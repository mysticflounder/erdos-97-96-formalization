/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NYNYN, term block 28:1600-1699

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NYNYNTermShards

/-- Generator polynomial 28 for relaxed split surplus certificate `R009:u=v:R009NYNYN`. -/
def rs_R009_ueqv_R009NYNYN_generator_28_1600_1699 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(14, 1)]
]

/-- Coefficient term 1600 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1600 : Poly :=
[
  term ((-40504531346666479333376582420887593958529658596811980800 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (9, 1), (10, 2)]
]

/-- Partial product 1600 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1600 : Poly :=
[
  term ((40504531346666479333376582420887593958529658596811980800 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (9, 1), (10, 2)],
  term ((-81009062693332958666753164841775187917059317193623961600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (9, 1), (10, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1600 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1600_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1600
        rs_R009_ueqv_R009NYNYN_generator_28_1600_1699 =
      rs_R009_ueqv_R009NYNYN_partial_28_1600 := by
  native_decide

/-- Coefficient term 1601 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1601 : Poly :=
[
  term ((5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (9, 1), (10, 2), (12, 1)]
]

/-- Partial product 1601 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1601 : Poly :=
[
  term ((-5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (9, 1), (10, 2), (12, 1)],
  term ((11445208307152018749942276720439365358264601698684108800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (9, 1), (10, 2), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1601 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1601_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1601
        rs_R009_ueqv_R009NYNYN_generator_28_1600_1699 =
      rs_R009_ueqv_R009NYNYN_partial_28_1601 := by
  native_decide

/-- Coefficient term 1602 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1602 : Poly :=
[
  term ((-2861302076788004687485569180109841339566150424671027200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (9, 1), (10, 2), (14, 1)]
]

/-- Partial product 1602 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1602 : Poly :=
[
  term ((2861302076788004687485569180109841339566150424671027200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (9, 1), (10, 2), (14, 1)],
  term ((-5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (9, 1), (10, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1602 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1602_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1602
        rs_R009_ueqv_R009NYNYN_generator_28_1600_1699 =
      rs_R009_ueqv_R009NYNYN_partial_28_1602 := by
  native_decide

/-- Coefficient term 1603 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1603 : Poly :=
[
  term ((-2861302076788004687485569180109841339566150424671027200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (9, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 1603 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1603 : Poly :=
[
  term ((-5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((2861302076788004687485569180109841339566150424671027200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (9, 1), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1603 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1603_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1603
        rs_R009_ueqv_R009NYNYN_generator_28_1600_1699 =
      rs_R009_ueqv_R009NYNYN_partial_28_1603 := by
  native_decide

/-- Coefficient term 1604 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1604 : Poly :=
[
  term ((-2861302076788004687485569180109841339566150424671027200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (9, 1), (11, 1), (13, 1)]
]

/-- Partial product 1604 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1604 : Poly :=
[
  term ((2861302076788004687485569180109841339566150424671027200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (9, 1), (11, 1), (13, 1)],
  term ((-5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (9, 1), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1604 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1604_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1604
        rs_R009_ueqv_R009NYNYN_generator_28_1600_1699 =
      rs_R009_ueqv_R009NYNYN_partial_28_1604 := by
  native_decide

/-- Coefficient term 1605 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1605 : Poly :=
[
  term ((5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (9, 1), (11, 1), (13, 1), (14, 1)]
]

/-- Partial product 1605 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1605 : Poly :=
[
  term ((-5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (9, 1), (11, 1), (13, 1), (14, 1)],
  term ((11445208307152018749942276720439365358264601698684108800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (9, 1), (11, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1605 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1605_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1605
        rs_R009_ueqv_R009NYNYN_generator_28_1600_1699 =
      rs_R009_ueqv_R009NYNYN_partial_28_1605 := by
  native_decide

/-- Coefficient term 1606 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1606 : Poly :=
[
  term ((-2202719273171030132118093654988708040286967770934016614400 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (9, 1), (12, 1)]
]

/-- Partial product 1606 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1606 : Poly :=
[
  term ((2202719273171030132118093654988708040286967770934016614400 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (9, 1), (12, 1)],
  term ((-4405438546342060264236187309977416080573935541868033228800 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (9, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1606 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1606_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1606
        rs_R009_ueqv_R009NYNYN_generator_28_1600_1699 =
      rs_R009_ueqv_R009NYNYN_partial_28_1606 := by
  native_decide

/-- Coefficient term 1607 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1607 : Poly :=
[
  term ((-2331483067018177213614679010203434628848959051005542400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (9, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 1607 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1607 : Poly :=
[
  term ((-4662966134036354427229358020406869257697918102011084800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((2331483067018177213614679010203434628848959051005542400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (9, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1607 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1607_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1607
        rs_R009_ueqv_R009NYNYN_generator_28_1600_1699 =
      rs_R009_ueqv_R009NYNYN_partial_28_1607 := by
  native_decide

/-- Coefficient term 1608 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1608 : Poly :=
[
  term ((-1449204250723669963221510123307665778966031908148783718400 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (9, 1), (12, 1), (14, 1)]
]

/-- Partial product 1608 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1608 : Poly :=
[
  term ((1449204250723669963221510123307665778966031908148783718400 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (9, 1), (12, 1), (14, 1)],
  term ((-2898408501447339926443020246615331557932063816297567436800 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (9, 1), (12, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1608 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1608_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1608
        rs_R009_ueqv_R009NYNYN_generator_28_1600_1699 =
      rs_R009_ueqv_R009NYNYN_partial_28_1608 := by
  native_decide

/-- Coefficient term 1609 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1609 : Poly :=
[
  term ((32038953431625363305481283035263947031903923151857356800 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (9, 1), (12, 1), (15, 2)]
]

/-- Partial product 1609 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1609 : Poly :=
[
  term ((64077906863250726610962566070527894063807846303714713600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (9, 1), (12, 1), (14, 1), (15, 2)],
  term ((-32038953431625363305481283035263947031903923151857356800 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (9, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1609 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1609_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1609
        rs_R009_ueqv_R009NYNYN_generator_28_1600_1699 =
      rs_R009_ueqv_R009NYNYN_partial_28_1609 := by
  native_decide

/-- Coefficient term 1610 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1610 : Poly :=
[
  term ((2019790838518175921305493905635811652985822756052063846400 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (9, 1), (12, 2)]
]

/-- Partial product 1610 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1610 : Poly :=
[
  term ((-2019790838518175921305493905635811652985822756052063846400 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (9, 1), (12, 2)],
  term ((4039581677036351842610987811271623305971645512104127692800 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (9, 1), (12, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1610 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1610_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1610
        rs_R009_ueqv_R009NYNYN_generator_28_1600_1699 =
      rs_R009_ueqv_R009NYNYN_partial_28_1610 := by
  native_decide

/-- Coefficient term 1611 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1611 : Poly :=
[
  term ((-64077906863250726610962566070527894063807846303714713600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (9, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 1611 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1611 : Poly :=
[
  term ((64077906863250726610962566070527894063807846303714713600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((-128155813726501453221925132141055788127615692607429427200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (9, 1), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1611 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1611_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1611
        rs_R009_ueqv_R009NYNYN_generator_28_1600_1699 =
      rs_R009_ueqv_R009NYNYN_partial_28_1611 := by
  native_decide

/-- Coefficient term 1612 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1612 : Poly :=
[
  term ((32038953431625363305481283035263947031903923151857356800 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (9, 1), (13, 1), (15, 1)]
]

/-- Partial product 1612 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1612 : Poly :=
[
  term ((64077906863250726610962566070527894063807846303714713600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((-32038953431625363305481283035263947031903923151857356800 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (9, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1612 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1612_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1612
        rs_R009_ueqv_R009NYNYN_generator_28_1600_1699 =
      rs_R009_ueqv_R009NYNYN_partial_28_1612 := by
  native_decide

/-- Coefficient term 1613 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1613 : Poly :=
[
  term ((1165741533509088606807339505101717314424479525502771200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (9, 1), (13, 2)]
]

/-- Partial product 1613 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1613 : Poly :=
[
  term ((-1165741533509088606807339505101717314424479525502771200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (9, 1), (13, 2)],
  term ((2331483067018177213614679010203434628848959051005542400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (9, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1613 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1613_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1613
        rs_R009_ueqv_R009NYNYN_generator_28_1600_1699 =
      rs_R009_ueqv_R009NYNYN_partial_28_1613 := by
  native_decide

/-- Coefficient term 1614 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1614 : Poly :=
[
  term ((2331483067018177213614679010203434628848959051005542400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (9, 1), (13, 2), (14, 1)]
]

/-- Partial product 1614 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1614 : Poly :=
[
  term ((-2331483067018177213614679010203434628848959051005542400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (9, 1), (13, 2), (14, 1)],
  term ((4662966134036354427229358020406869257697918102011084800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (9, 1), (13, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1614 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1614_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1614
        rs_R009_ueqv_R009NYNYN_generator_28_1600_1699 =
      rs_R009_ueqv_R009NYNYN_partial_28_1614 := by
  native_decide

/-- Coefficient term 1615 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1615 : Poly :=
[
  term ((728374640846174309486985984316532642657059418801581107200 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (9, 1), (14, 1)]
]

/-- Partial product 1615 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1615 : Poly :=
[
  term ((-728374640846174309486985984316532642657059418801581107200 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (9, 1), (14, 1)],
  term ((1456749281692348618973971968633065285314118837603162214400 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (9, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1615 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1615_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1615
        rs_R009_ueqv_R009NYNYN_generator_28_1600_1699 =
      rs_R009_ueqv_R009NYNYN_partial_28_1615 := by
  native_decide

/-- Coefficient term 1616 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1616 : Poly :=
[
  term ((-1430651038394002343742784590054920669783075212335513600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (9, 2), (11, 1)]
]

/-- Partial product 1616 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1616 : Poly :=
[
  term ((1430651038394002343742784590054920669783075212335513600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (9, 2), (11, 1)],
  term ((-2861302076788004687485569180109841339566150424671027200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (9, 2), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1616 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1616_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1616
        rs_R009_ueqv_R009NYNYN_generator_28_1600_1699 =
      rs_R009_ueqv_R009NYNYN_partial_28_1616 := by
  native_decide

/-- Coefficient term 1617 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1617 : Poly :=
[
  term ((5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (9, 2), (11, 1), (12, 1)]
]

/-- Partial product 1617 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1617 : Poly :=
[
  term ((-5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (9, 2), (11, 1), (12, 1)],
  term ((11445208307152018749942276720439365358264601698684108800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (9, 2), (11, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1617 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1617_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1617
        rs_R009_ueqv_R009NYNYN_generator_28_1600_1699 =
      rs_R009_ueqv_R009NYNYN_partial_28_1617 := by
  native_decide

/-- Coefficient term 1618 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1618 : Poly :=
[
  term ((-2861302076788004687485569180109841339566150424671027200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (9, 2), (11, 1), (14, 1)]
]

/-- Partial product 1618 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1618 : Poly :=
[
  term ((2861302076788004687485569180109841339566150424671027200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (9, 2), (11, 1), (14, 1)],
  term ((-5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (9, 2), (11, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1618 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1618_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1618
        rs_R009_ueqv_R009NYNYN_generator_28_1600_1699 =
      rs_R009_ueqv_R009NYNYN_partial_28_1618 := by
  native_decide

/-- Coefficient term 1619 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1619 : Poly :=
[
  term ((-64077906863250726610962566070527894063807846303714713600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (9, 2), (12, 1), (15, 1)]
]

/-- Partial product 1619 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1619 : Poly :=
[
  term ((-128155813726501453221925132141055788127615692607429427200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (9, 2), (12, 1), (14, 1), (15, 1)],
  term ((64077906863250726610962566070527894063807846303714713600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (9, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1619 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1619_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1619
        rs_R009_ueqv_R009NYNYN_generator_28_1600_1699 =
      rs_R009_ueqv_R009NYNYN_partial_28_1619 := by
  native_decide

/-- Coefficient term 1620 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1620 : Poly :=
[
  term ((32038953431625363305481283035263947031903923151857356800 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (9, 2), (14, 1), (15, 1)]
]

/-- Partial product 1620 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1620 : Poly :=
[
  term ((-32038953431625363305481283035263947031903923151857356800 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (9, 2), (14, 1), (15, 1)],
  term ((64077906863250726610962566070527894063807846303714713600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (9, 2), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1620 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1620_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1620
        rs_R009_ueqv_R009NYNYN_generator_28_1600_1699 =
      rs_R009_ueqv_R009NYNYN_partial_28_1620 := by
  native_decide

/-- Coefficient term 1621 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1621 : Poly :=
[
  term ((16019476715812681652740641517631973515951961575928678400 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (9, 2), (15, 1)]
]

/-- Partial product 1621 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1621 : Poly :=
[
  term ((32038953431625363305481283035263947031903923151857356800 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (9, 2), (14, 1), (15, 1)],
  term ((-16019476715812681652740641517631973515951961575928678400 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (9, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1621 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1621_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1621
        rs_R009_ueqv_R009NYNYN_generator_28_1600_1699 =
      rs_R009_ueqv_R009NYNYN_partial_28_1621 := by
  native_decide

/-- Coefficient term 1622 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1622 : Poly :=
[
  term ((-1430651038394002343742784590054920669783075212335513600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (10, 1), (11, 1)]
]

/-- Partial product 1622 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1622 : Poly :=
[
  term ((1430651038394002343742784590054920669783075212335513600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (10, 1), (11, 1)],
  term ((-2861302076788004687485569180109841339566150424671027200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (10, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1622 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1622_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1622
        rs_R009_ueqv_R009NYNYN_generator_28_1600_1699 =
      rs_R009_ueqv_R009NYNYN_partial_28_1622 := by
  native_decide

/-- Coefficient term 1623 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1623 : Poly :=
[
  term ((1430651038394002343742784590054920669783075212335513600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (10, 1), (11, 1), (12, 1)]
]

/-- Partial product 1623 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1623 : Poly :=
[
  term ((-1430651038394002343742784590054920669783075212335513600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (10, 1), (11, 1), (12, 1)],
  term ((2861302076788004687485569180109841339566150424671027200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (10, 1), (11, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1623 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1623_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1623
        rs_R009_ueqv_R009NYNYN_generator_28_1600_1699 =
      rs_R009_ueqv_R009NYNYN_partial_28_1623 := by
  native_decide

/-- Coefficient term 1624 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1624 : Poly :=
[
  term ((2861302076788004687485569180109841339566150424671027200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (10, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 1624 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1624 : Poly :=
[
  term ((5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-2861302076788004687485569180109841339566150424671027200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (10, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1624 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1624_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1624
        rs_R009_ueqv_R009NYNYN_generator_28_1600_1699 =
      rs_R009_ueqv_R009NYNYN_partial_28_1624 := by
  native_decide

/-- Coefficient term 1625 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1625 : Poly :=
[
  term ((-2861302076788004687485569180109841339566150424671027200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (10, 1), (11, 1), (14, 1)]
]

/-- Partial product 1625 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1625 : Poly :=
[
  term ((2861302076788004687485569180109841339566150424671027200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (10, 1), (11, 1), (14, 1)],
  term ((-5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (10, 1), (11, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1625 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1625_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1625
        rs_R009_ueqv_R009NYNYN_generator_28_1600_1699 =
      rs_R009_ueqv_R009NYNYN_partial_28_1625 := by
  native_decide

/-- Coefficient term 1626 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1626 : Poly :=
[
  term ((23061175744320682744905936150195181751334040933562777600 : Rat) / 2155526510388634287214594206068266543338254015229673617) [(5, 1), (10, 1), (12, 1), (13, 1)]
]

/-- Partial product 1626 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1626 : Poly :=
[
  term ((-23061175744320682744905936150195181751334040933562777600 : Rat) / 2155526510388634287214594206068266543338254015229673617) [(5, 1), (10, 1), (12, 1), (13, 1)],
  term ((46122351488641365489811872300390363502668081867125555200 : Rat) / 2155526510388634287214594206068266543338254015229673617) [(5, 1), (10, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1626 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1626_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1626
        rs_R009_ueqv_R009NYNYN_generator_28_1600_1699 =
      rs_R009_ueqv_R009NYNYN_partial_28_1626 := by
  native_decide

/-- Coefficient term 1627 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1627 : Poly :=
[
  term ((481636371759748912297511214589609130729132561088928153600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (10, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 1627 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1627 : Poly :=
[
  term ((-481636371759748912297511214589609130729132561088928153600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((963272743519497824595022429179218261458265122177856307200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (10, 1), (12, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1627 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1627_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1627
        rs_R009_ueqv_R009NYNYN_generator_28_1600_1699 =
      rs_R009_ueqv_R009NYNYN_partial_28_1627 := by
  native_decide

/-- Coefficient term 1628 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1628 : Poly :=
[
  term ((-57821758046159072047683707372198536651380793989008384000 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (10, 1), (12, 1), (15, 1)]
]

/-- Partial product 1628 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1628 : Poly :=
[
  term ((-115643516092318144095367414744397073302761587978016768000 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((57821758046159072047683707372198536651380793989008384000 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (10, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1628 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1628_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1628
        rs_R009_ueqv_R009NYNYN_generator_28_1600_1699 =
      rs_R009_ueqv_R009NYNYN_partial_28_1628 := by
  native_decide

/-- Coefficient term 1629 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1629 : Poly :=
[
  term ((-217218032226992144048654906811203276347011879678476288000 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (10, 1), (12, 2), (13, 1)]
]

/-- Partial product 1629 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1629 : Poly :=
[
  term ((217218032226992144048654906811203276347011879678476288000 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (10, 1), (12, 2), (13, 1)],
  term ((-434436064453984288097309813622406552694023759356952576000 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (10, 1), (12, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1629 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1629_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1629
        rs_R009_ueqv_R009NYNYN_generator_28_1600_1699 =
      rs_R009_ueqv_R009NYNYN_partial_28_1629 := by
  native_decide

/-- Coefficient term 1630 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1630 : Poly :=
[
  term ((-217218032226992144048654906811203276347011879678476288000 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (10, 1), (12, 2), (13, 1), (14, 1)]
]

/-- Partial product 1630 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1630 : Poly :=
[
  term ((217218032226992144048654906811203276347011879678476288000 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (10, 1), (12, 2), (13, 1), (14, 1)],
  term ((-434436064453984288097309813622406552694023759356952576000 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (10, 1), (12, 2), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1630 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1630_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1630
        rs_R009_ueqv_R009NYNYN_generator_28_1600_1699 =
      rs_R009_ueqv_R009NYNYN_partial_28_1630 := by
  native_decide

/-- Coefficient term 1631 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1631 : Poly :=
[
  term ((-481636371759748912297511214589609130729132561088928153600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (10, 1), (12, 2), (15, 1)]
]

/-- Partial product 1631 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1631 : Poly :=
[
  term ((-963272743519497824595022429179218261458265122177856307200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (10, 1), (12, 2), (14, 1), (15, 1)],
  term ((481636371759748912297511214589609130729132561088928153600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (10, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1631 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1631_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1631
        rs_R009_ueqv_R009NYNYN_generator_28_1600_1699 =
      rs_R009_ueqv_R009NYNYN_partial_28_1631 := by
  native_decide

/-- Coefficient term 1632 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1632 : Poly :=
[
  term ((217218032226992144048654906811203276347011879678476288000 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (10, 1), (12, 3), (15, 1)]
]

/-- Partial product 1632 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1632 : Poly :=
[
  term ((434436064453984288097309813622406552694023759356952576000 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (10, 1), (12, 3), (14, 1), (15, 1)],
  term ((-217218032226992144048654906811203276347011879678476288000 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (10, 1), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1632 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1632_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1632
        rs_R009_ueqv_R009NYNYN_generator_28_1600_1699 =
      rs_R009_ueqv_R009NYNYN_partial_28_1632 := by
  native_decide

/-- Coefficient term 1633 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1633 : Poly :=
[
  term ((-77790641181451051810020603913681259663339958812575129600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (10, 1), (13, 1)]
]

/-- Partial product 1633 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1633 : Poly :=
[
  term ((77790641181451051810020603913681259663339958812575129600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (10, 1), (13, 1)],
  term ((-155581282362902103620041207827362519326679917625150259200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (10, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1633 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1633_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1633
        rs_R009_ueqv_R009NYNYN_generator_28_1600_1699 =
      rs_R009_ueqv_R009NYNYN_partial_28_1633 := by
  native_decide

/-- Coefficient term 1634 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1634 : Poly :=
[
  term ((-34767781351524318323903104515771128006173184274301081600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (10, 1), (13, 1), (14, 1)]
]

/-- Partial product 1634 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1634 : Poly :=
[
  term ((34767781351524318323903104515771128006173184274301081600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (10, 1), (13, 1), (14, 1)],
  term ((-69535562703048636647806209031542256012346368548602163200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (10, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1634 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1634_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1634
        rs_R009_ueqv_R009NYNYN_generator_28_1600_1699 =
      rs_R009_ueqv_R009NYNYN_partial_28_1634 := by
  native_decide

/-- Coefficient term 1635 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1635 : Poly :=
[
  term ((-32038953431625363305481283035263947031903923151857356800 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (10, 1), (13, 1), (15, 2)]
]

/-- Partial product 1635 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1635 : Poly :=
[
  term ((-64077906863250726610962566070527894063807846303714713600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (10, 1), (13, 1), (14, 1), (15, 2)],
  term ((32038953431625363305481283035263947031903923151857356800 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (10, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1635 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1635_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1635
        rs_R009_ueqv_R009NYNYN_generator_28_1600_1699 =
      rs_R009_ueqv_R009NYNYN_partial_28_1635 := by
  native_decide

/-- Coefficient term 1636 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1636 : Poly :=
[
  term ((1068428233846193617741176517917398912203313588682803200 : Rat) / 307932358626947755316370600866895220476893430747096231) [(5, 1), (10, 1), (15, 1)]
]

/-- Partial product 1636 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1636 : Poly :=
[
  term ((2136856467692387235482353035834797824406627177365606400 : Rat) / 307932358626947755316370600866895220476893430747096231) [(5, 1), (10, 1), (14, 1), (15, 1)],
  term ((-1068428233846193617741176517917398912203313588682803200 : Rat) / 307932358626947755316370600866895220476893430747096231) [(5, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1636 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1636_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1636
        rs_R009_ueqv_R009NYNYN_generator_28_1600_1699 =
      rs_R009_ueqv_R009NYNYN_partial_28_1636 := by
  native_decide

/-- Coefficient term 1637 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1637 : Poly :=
[
  term ((-2861302076788004687485569180109841339566150424671027200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (10, 2), (12, 1), (15, 1)]
]

/-- Partial product 1637 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1637 : Poly :=
[
  term ((-5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (10, 2), (12, 1), (14, 1), (15, 1)],
  term ((2861302076788004687485569180109841339566150424671027200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (10, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1637 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1637_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1637
        rs_R009_ueqv_R009NYNYN_generator_28_1600_1699 =
      rs_R009_ueqv_R009NYNYN_partial_28_1637 := by
  native_decide

/-- Coefficient term 1638 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1638 : Poly :=
[
  term ((2861302076788004687485569180109841339566150424671027200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (10, 2), (13, 1), (14, 1)]
]

/-- Partial product 1638 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1638 : Poly :=
[
  term ((-2861302076788004687485569180109841339566150424671027200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (10, 2), (13, 1), (14, 1)],
  term ((5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (10, 2), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1638 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1638_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1638
        rs_R009_ueqv_R009NYNYN_generator_28_1600_1699 =
      rs_R009_ueqv_R009NYNYN_partial_28_1638 := by
  native_decide

/-- Coefficient term 1639 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1639 : Poly :=
[
  term ((2861302076788004687485569180109841339566150424671027200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (10, 2), (15, 1)]
]

/-- Partial product 1639 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1639 : Poly :=
[
  term ((5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (10, 2), (14, 1), (15, 1)],
  term ((-2861302076788004687485569180109841339566150424671027200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (10, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1639 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1639_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1639
        rs_R009_ueqv_R009NYNYN_generator_28_1600_1699 =
      rs_R009_ueqv_R009NYNYN_partial_28_1639 := by
  native_decide

/-- Coefficient term 1640 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1640 : Poly :=
[
  term ((-36223532041586108238604429848382961109310811458576102400 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (11, 1)]
]

/-- Partial product 1640 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1640 : Poly :=
[
  term ((36223532041586108238604429848382961109310811458576102400 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (11, 1)],
  term ((-72447064083172216477208859696765922218621622917152204800 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1640 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1640_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1640
        rs_R009_ueqv_R009NYNYN_generator_28_1600_1699 =
      rs_R009_ueqv_R009NYNYN_partial_28_1640 := by
  native_decide

/-- Coefficient term 1641 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1641 : Poly :=
[
  term ((-365183302155579127335974244546043610020455311518861721600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (11, 1), (12, 1)]
]

/-- Partial product 1641 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1641 : Poly :=
[
  term ((365183302155579127335974244546043610020455311518861721600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (11, 1), (12, 1)],
  term ((-730366604311158254671948489092087220040910623037723443200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (11, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1641 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1641_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1641
        rs_R009_ueqv_R009NYNYN_generator_28_1600_1699 =
      rs_R009_ueqv_R009NYNYN_partial_28_1641 := by
  native_decide

/-- Coefficient term 1642 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1642 : Poly :=
[
  term ((-1072988278795501757807088442541190502337306409251635200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (11, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 1642 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1642 : Poly :=
[
  term ((-2145976557591003515614176885082381004674612818503270400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((1072988278795501757807088442541190502337306409251635200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (11, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1642 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1642_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1642
        rs_R009_ueqv_R009NYNYN_generator_28_1600_1699 =
      rs_R009_ueqv_R009NYNYN_partial_28_1642 := by
  native_decide

/-- Coefficient term 1643 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1643 : Poly :=
[
  term ((142402558414935650823595494093344236963264751593116467200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (11, 1), (12, 2)]
]

/-- Partial product 1643 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1643 : Poly :=
[
  term ((-142402558414935650823595494093344236963264751593116467200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (11, 1), (12, 2)],
  term ((284805116829871301647190988186688473926529503186232934400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (11, 1), (12, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1643 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1643_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1643
        rs_R009_ueqv_R009NYNYN_generator_28_1600_1699 =
      rs_R009_ueqv_R009NYNYN_partial_28_1643 := by
  native_decide

/-- Coefficient term 1644 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1644 : Poly :=
[
  term ((32038953431625363305481283035263947031903923151857356800 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (11, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 1644 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1644 : Poly :=
[
  term ((-32038953431625363305481283035263947031903923151857356800 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((64077906863250726610962566070527894063807846303714713600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (11, 1), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1644 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1644_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1644
        rs_R009_ueqv_R009NYNYN_generator_28_1600_1699 =
      rs_R009_ueqv_R009NYNYN_partial_28_1644 := by
  native_decide

/-- Coefficient term 1645 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1645 : Poly :=
[
  term ((24603382946176695715197349057961497534650412849941760000 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 1645 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1645 : Poly :=
[
  term ((49206765892353391430394698115922995069300825699883520000 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-24603382946176695715197349057961497534650412849941760000 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1645 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1645_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1645
        rs_R009_ueqv_R009NYNYN_generator_28_1600_1699 =
      rs_R009_ueqv_R009NYNYN_partial_28_1645 := by
  native_decide

/-- Coefficient term 1646 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1646 : Poly :=
[
  term ((536494139397750878903544221270595251168653204625817600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (11, 1), (13, 2)]
]

/-- Partial product 1646 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1646 : Poly :=
[
  term ((-536494139397750878903544221270595251168653204625817600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (11, 1), (13, 2)],
  term ((1072988278795501757807088442541190502337306409251635200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (11, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1646 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1646_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1646
        rs_R009_ueqv_R009NYNYN_generator_28_1600_1699 =
      rs_R009_ueqv_R009NYNYN_partial_28_1646 := by
  native_decide

/-- Coefficient term 1647 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1647 : Poly :=
[
  term ((1072988278795501757807088442541190502337306409251635200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (11, 1), (13, 2), (14, 1)]
]

/-- Partial product 1647 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1647 : Poly :=
[
  term ((-1072988278795501757807088442541190502337306409251635200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (11, 1), (13, 2), (14, 1)],
  term ((2145976557591003515614176885082381004674612818503270400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (11, 1), (13, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1647 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1647_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1647
        rs_R009_ueqv_R009NYNYN_generator_28_1600_1699 =
      rs_R009_ueqv_R009NYNYN_partial_28_1647 := by
  native_decide

/-- Coefficient term 1648 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1648 : Poly :=
[
  term ((-5998632406358597853428998478404514039370802434838374400 : Rat) / 718508836796211429071531402022755514446084671743224539) [(5, 1), (11, 1), (14, 1)]
]

/-- Partial product 1648 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1648 : Poly :=
[
  term ((5998632406358597853428998478404514039370802434838374400 : Rat) / 718508836796211429071531402022755514446084671743224539) [(5, 1), (11, 1), (14, 1)],
  term ((-11997264812717195706857996956809028078741604869676748800 : Rat) / 718508836796211429071531402022755514446084671743224539) [(5, 1), (11, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1648 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1648_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1648
        rs_R009_ueqv_R009NYNYN_generator_28_1600_1699 =
      rs_R009_ueqv_R009NYNYN_partial_28_1648 := by
  native_decide

/-- Coefficient term 1649 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1649 : Poly :=
[
  term ((-1430651038394002343742784590054920669783075212335513600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (11, 2), (13, 1)]
]

/-- Partial product 1649 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1649 : Poly :=
[
  term ((1430651038394002343742784590054920669783075212335513600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (11, 2), (13, 1)],
  term ((-2861302076788004687485569180109841339566150424671027200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (11, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1649 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1649_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1649
        rs_R009_ueqv_R009NYNYN_generator_28_1600_1699 =
      rs_R009_ueqv_R009NYNYN_partial_28_1649 := by
  native_decide

/-- Coefficient term 1650 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1650 : Poly :=
[
  term ((-2861302076788004687485569180109841339566150424671027200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (11, 2), (13, 1), (14, 1)]
]

/-- Partial product 1650 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1650 : Poly :=
[
  term ((2861302076788004687485569180109841339566150424671027200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (11, 2), (13, 1), (14, 1)],
  term ((-5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (11, 2), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1650 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1650_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1650
        rs_R009_ueqv_R009NYNYN_generator_28_1600_1699 =
      rs_R009_ueqv_R009NYNYN_partial_28_1650 := by
  native_decide

/-- Coefficient term 1651 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1651 : Poly :=
[
  term ((-581919735422584553391880776645596318386464774968836556800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (12, 1), (13, 1)]
]

/-- Partial product 1651 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1651 : Poly :=
[
  term ((581919735422584553391880776645596318386464774968836556800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (12, 1), (13, 1)],
  term ((-1163839470845169106783761553291192636772929549937673113600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1651 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1651_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1651
        rs_R009_ueqv_R009NYNYN_generator_28_1600_1699 =
      rs_R009_ueqv_R009NYNYN_partial_28_1651 := by
  native_decide

/-- Coefficient term 1652 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1652 : Poly :=
[
  term ((-4222136362643382121143547009219503311070361438828734617600 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 1652 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1652 : Poly :=
[
  term ((4222136362643382121143547009219503311070361438828734617600 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (12, 1), (13, 1), (14, 1)],
  term ((-8444272725286764242287094018439006622140722877657469235200 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (12, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1652 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1652_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1652
        rs_R009_ueqv_R009NYNYN_generator_28_1600_1699 =
      rs_R009_ueqv_R009NYNYN_partial_28_1652 := by
  native_decide

/-- Coefficient term 1653 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1653 : Poly :=
[
  term ((5390438836800448772212498676347068041201708923821772800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (12, 1), (13, 1), (15, 2)]
]

/-- Partial product 1653 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1653 : Poly :=
[
  term ((10780877673600897544424997352694136082403417847643545600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((-5390438836800448772212498676347068041201708923821772800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1653 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1653_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1653
        rs_R009_ueqv_R009NYNYN_generator_28_1600_1699 =
      rs_R009_ueqv_R009NYNYN_partial_28_1653 := by
  native_decide

/-- Coefficient term 1654 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1654 : Poly :=
[
  term ((-692016335220777904708688825649109066699767130171682355200 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (12, 1), (15, 1)]
]

/-- Partial product 1654 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1654 : Poly :=
[
  term ((-1384032670441555809417377651298218133399534260343364710400 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (12, 1), (14, 1), (15, 1)],
  term ((692016335220777904708688825649109066699767130171682355200 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1654 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1654_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1654
        rs_R009_ueqv_R009NYNYN_generator_28_1600_1699 =
      rs_R009_ueqv_R009NYNYN_partial_28_1654 := by
  native_decide

/-- Coefficient term 1655 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1655 : Poly :=
[
  term ((2887916827645758128981754191069416102102243500568042496000 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (12, 2), (13, 1)]
]

/-- Partial product 1655 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1655 : Poly :=
[
  term ((-2887916827645758128981754191069416102102243500568042496000 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (12, 2), (13, 1)],
  term ((5775833655291516257963508382138832204204487001136084992000 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (12, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1655 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1655_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1655
        rs_R009_ueqv_R009NYNYN_generator_28_1600_1699 =
      rs_R009_ueqv_R009NYNYN_partial_28_1655 := by
  native_decide

/-- Coefficient term 1656 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1656 : Poly :=
[
  term ((2887916827645758128981754191069416102102243500568042496000 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (12, 2), (13, 1), (14, 1)]
]

/-- Partial product 1656 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1656 : Poly :=
[
  term ((-2887916827645758128981754191069416102102243500568042496000 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (12, 2), (13, 1), (14, 1)],
  term ((5775833655291516257963508382138832204204487001136084992000 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (12, 2), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1656 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1656_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1656
        rs_R009_ueqv_R009NYNYN_generator_28_1600_1699 =
      rs_R009_ueqv_R009NYNYN_partial_28_1656 := by
  native_decide

/-- Coefficient term 1657 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1657 : Poly :=
[
  term ((4246393337408984140618503253263065117255769128985932595200 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (12, 2), (15, 1)]
]

/-- Partial product 1657 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1657 : Poly :=
[
  term ((8492786674817968281237006506526130234511538257971865190400 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (12, 2), (14, 1), (15, 1)],
  term ((-4246393337408984140618503253263065117255769128985932595200 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1657 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1657_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1657
        rs_R009_ueqv_R009NYNYN_generator_28_1600_1699 =
      rs_R009_ueqv_R009NYNYN_partial_28_1657 := by
  native_decide

/-- Coefficient term 1658 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1658 : Poly :=
[
  term ((-2887916827645758128981754191069416102102243500568042496000 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (12, 3), (15, 1)]
]

/-- Partial product 1658 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1658 : Poly :=
[
  term ((-5775833655291516257963508382138832204204487001136084992000 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (12, 3), (14, 1), (15, 1)],
  term ((2887916827645758128981754191069416102102243500568042496000 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1658 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1658_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1658
        rs_R009_ueqv_R009NYNYN_generator_28_1600_1699 =
      rs_R009_ueqv_R009NYNYN_partial_28_1658 := by
  native_decide

/-- Coefficient term 1659 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1659 : Poly :=
[
  term ((1818892285453544452524426582089670690066535586895918054400 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (13, 1)]
]

/-- Partial product 1659 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1659 : Poly :=
[
  term ((-1818892285453544452524426582089670690066535586895918054400 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (13, 1)],
  term ((3637784570907088905048853164179341380133071173791836108800 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1659 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1659_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1659
        rs_R009_ueqv_R009NYNYN_generator_28_1600_1699 =
      rs_R009_ueqv_R009NYNYN_partial_28_1659 := by
  native_decide

/-- Coefficient term 1660 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1660 : Poly :=
[
  term ((240096379275515459577811812519673503365399195695445299200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (13, 1), (14, 1)]
]

/-- Partial product 1660 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1660 : Poly :=
[
  term ((-240096379275515459577811812519673503365399195695445299200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (13, 1), (14, 1)],
  term ((480192758551030919155623625039347006730798391390890598400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1660 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1660_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1660
        rs_R009_ueqv_R009NYNYN_generator_28_1600_1699 =
      rs_R009_ueqv_R009NYNYN_partial_28_1660 := by
  native_decide

/-- Coefficient term 1661 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1661 : Poly :=
[
  term ((-32038953431625363305481283035263947031903923151857356800 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (13, 1), (15, 2)]
]

/-- Partial product 1661 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1661 : Poly :=
[
  term ((-64077906863250726610962566070527894063807846303714713600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (13, 1), (14, 1), (15, 2)],
  term ((32038953431625363305481283035263947031903923151857356800 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1661 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1661_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1661
        rs_R009_ueqv_R009NYNYN_generator_28_1600_1699 =
      rs_R009_ueqv_R009NYNYN_partial_28_1661 := by
  native_decide

/-- Coefficient term 1662 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1662 : Poly :=
[
  term ((-5390438836800448772212498676347068041201708923821772800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (13, 2), (14, 1), (15, 1)]
]

/-- Partial product 1662 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1662 : Poly :=
[
  term ((5390438836800448772212498676347068041201708923821772800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (13, 2), (14, 1), (15, 1)],
  term ((-10780877673600897544424997352694136082403417847643545600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (13, 2), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1662 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1662_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1662
        rs_R009_ueqv_R009NYNYN_generator_28_1600_1699 =
      rs_R009_ueqv_R009NYNYN_partial_28_1662 := by
  native_decide

/-- Coefficient term 1663 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1663 : Poly :=
[
  term ((-2695219418400224386106249338173534020600854461910886400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (13, 2), (15, 1)]
]

/-- Partial product 1663 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1663 : Poly :=
[
  term ((-5390438836800448772212498676347068041201708923821772800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (13, 2), (14, 1), (15, 1)],
  term ((2695219418400224386106249338173534020600854461910886400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1663 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1663_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1663
        rs_R009_ueqv_R009NYNYN_generator_28_1600_1699 =
      rs_R009_ueqv_R009NYNYN_partial_28_1663 := by
  native_decide

/-- Coefficient term 1664 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1664 : Poly :=
[
  term ((-323681673320741589375844963202630352831988541922350028800 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (15, 1)]
]

/-- Partial product 1664 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1664 : Poly :=
[
  term ((-647363346641483178751689926405260705663977083844700057600 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (14, 1), (15, 1)],
  term ((323681673320741589375844963202630352831988541922350028800 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1664 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1664_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1664
        rs_R009_ueqv_R009NYNYN_generator_28_1600_1699 =
      rs_R009_ueqv_R009NYNYN_partial_28_1664 := by
  native_decide

/-- Coefficient term 1665 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1665 : Poly :=
[
  term ((-2437819434346724479832540061005042773250153334908518400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 2)]
]

/-- Partial product 1665 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1665 : Poly :=
[
  term ((2437819434346724479832540061005042773250153334908518400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 2)],
  term ((-4875638868693448959665080122010085546500306669817036800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1665 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1665_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1665
        rs_R009_ueqv_R009NYNYN_generator_28_1600_1699 =
      rs_R009_ueqv_R009NYNYN_partial_28_1665 := by
  native_decide

/-- Coefficient term 1666 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1666 : Poly :=
[
  term ((-4875638868693448959665080122010085546500306669817036800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 2), (8, 1)]
]

/-- Partial product 1666 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1666 : Poly :=
[
  term ((4875638868693448959665080122010085546500306669817036800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 2), (8, 1)],
  term ((-9751277737386897919330160244020171093000613339634073600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 2), (8, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1666 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1666_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1666
        rs_R009_ueqv_R009NYNYN_generator_28_1600_1699 =
      rs_R009_ueqv_R009NYNYN_partial_28_1666 := by
  native_decide

/-- Coefficient term 1667 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1667 : Poly :=
[
  term ((3662063577243717227236276350222151272198460898243359245615848517973523924346007 : Rat) / 1554571426730003356920520719663599136469924503826690302914338620185265024000) [(6, 1)]
]

/-- Partial product 1667 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1667 : Poly :=
[
  term ((-3662063577243717227236276350222151272198460898243359245615848517973523924346007 : Rat) / 1554571426730003356920520719663599136469924503826690302914338620185265024000) [(6, 1)],
  term ((3662063577243717227236276350222151272198460898243359245615848517973523924346007 : Rat) / 777285713365001678460260359831799568234962251913345151457169310092632512000) [(6, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1667 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1667_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1667
        rs_R009_ueqv_R009NYNYN_generator_28_1600_1699 =
      rs_R009_ueqv_R009NYNYN_partial_28_1667 := by
  native_decide

/-- Coefficient term 1668 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1668 : Poly :=
[
  term ((-1231910201230940794896701872478967367638981518031742961435866544125725120833 : Rat) / 10743106961394847258882379982161534121292758012482592883830843013761792000) [(6, 1), (8, 1)]
]

/-- Partial product 1668 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1668 : Poly :=
[
  term ((1231910201230940794896701872478967367638981518031742961435866544125725120833 : Rat) / 10743106961394847258882379982161534121292758012482592883830843013761792000) [(6, 1), (8, 1)],
  term ((-1231910201230940794896701872478967367638981518031742961435866544125725120833 : Rat) / 5371553480697423629441189991080767060646379006241296441915421506880896000) [(6, 1), (8, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1668 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1668_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1668
        rs_R009_ueqv_R009NYNYN_generator_28_1600_1699 =
      rs_R009_ueqv_R009NYNYN_partial_28_1668 := by
  native_decide

/-- Coefficient term 1669 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1669 : Poly :=
[
  term ((1242661681893867478288933640958308477645472625502324690976250316926758336833 : Rat) / 16114660442092270888323569973242301181939137018723889325746264520642688000) [(6, 1), (8, 1), (14, 1)]
]

/-- Partial product 1669 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1669 : Poly :=
[
  term ((-1242661681893867478288933640958308477645472625502324690976250316926758336833 : Rat) / 16114660442092270888323569973242301181939137018723889325746264520642688000) [(6, 1), (8, 1), (14, 1)],
  term ((1242661681893867478288933640958308477645472625502324690976250316926758336833 : Rat) / 8057330221046135444161784986621150590969568509361944662873132260321344000) [(6, 1), (8, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1669 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1669_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1669
        rs_R009_ueqv_R009NYNYN_generator_28_1600_1699 =
      rs_R009_ueqv_R009NYNYN_partial_28_1669 := by
  native_decide

/-- Coefficient term 1670 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1670 : Poly :=
[
  term ((11370534228796125233 : Rat) / 10683035854916732895) [(6, 1), (8, 1), (14, 1), (16, 1)]
]

/-- Partial product 1670 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1670 : Poly :=
[
  term ((-11370534228796125233 : Rat) / 10683035854916732895) [(6, 1), (8, 1), (14, 1), (16, 1)],
  term ((22741068457592250466 : Rat) / 10683035854916732895) [(6, 1), (8, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1670 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1670_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1670
        rs_R009_ueqv_R009NYNYN_generator_28_1600_1699 =
      rs_R009_ueqv_R009NYNYN_partial_28_1670 := by
  native_decide

/-- Coefficient term 1671 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1671 : Poly :=
[
  term ((-11370534228796125233 : Rat) / 7122023903277821930) [(6, 1), (8, 1), (16, 1)]
]

/-- Partial product 1671 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1671 : Poly :=
[
  term ((-11370534228796125233 : Rat) / 3561011951638910965) [(6, 1), (8, 1), (14, 1), (16, 1)],
  term ((11370534228796125233 : Rat) / 7122023903277821930) [(6, 1), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1671 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1671_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1671
        rs_R009_ueqv_R009NYNYN_generator_28_1600_1699 =
      rs_R009_ueqv_R009NYNYN_partial_28_1671 := by
  native_decide

/-- Coefficient term 1672 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1672 : Poly :=
[
  term ((-3663619360379237260881023683985473070984196106356015567111891194321395883898007 : Rat) / 2331857140095005035380781079495398704704886755740035454371507930277897536000) [(6, 1), (14, 1)]
]

/-- Partial product 1672 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1672 : Poly :=
[
  term ((3663619360379237260881023683985473070984196106356015567111891194321395883898007 : Rat) / 2331857140095005035380781079495398704704886755740035454371507930277897536000) [(6, 1), (14, 1)],
  term ((-3663619360379237260881023683985473070984196106356015567111891194321395883898007 : Rat) / 1165928570047502517690390539747699352352443377870017727185753965138948768000) [(6, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1672 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1672_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1672
        rs_R009_ueqv_R009NYNYN_generator_28_1600_1699 =
      rs_R009_ueqv_R009NYNYN_partial_28_1672 := by
  native_decide

/-- Coefficient term 1673 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1673 : Poly :=
[
  term ((-1063271254698166725818 : Rat) / 32049107564750198685) [(6, 1), (14, 1), (16, 1)]
]

/-- Partial product 1673 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1673 : Poly :=
[
  term ((1063271254698166725818 : Rat) / 32049107564750198685) [(6, 1), (14, 1), (16, 1)],
  term ((-2126542509396333451636 : Rat) / 32049107564750198685) [(6, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1673 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1673_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1673
        rs_R009_ueqv_R009NYNYN_generator_28_1600_1699 =
      rs_R009_ueqv_R009NYNYN_partial_28_1673 := by
  native_decide

/-- Coefficient term 1674 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1674 : Poly :=
[
  term ((531635627349083362909 : Rat) / 10683035854916732895) [(6, 1), (16, 1)]
]

/-- Partial product 1674 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1674 : Poly :=
[
  term ((1063271254698166725818 : Rat) / 10683035854916732895) [(6, 1), (14, 1), (16, 1)],
  term ((-531635627349083362909 : Rat) / 10683035854916732895) [(6, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1674 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1674_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1674
        rs_R009_ueqv_R009NYNYN_generator_28_1600_1699 =
      rs_R009_ueqv_R009NYNYN_partial_28_1674 := by
  native_decide

/-- Coefficient term 1675 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1675 : Poly :=
[
  term ((-25659611084893707138376543247128560727835283229482533664124743950451517045494049 : Rat) / 29018666632293395995849720100387183880771924071431552321067654243458280448000) [(6, 2)]
]

/-- Partial product 1675 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1675 : Poly :=
[
  term ((25659611084893707138376543247128560727835283229482533664124743950451517045494049 : Rat) / 29018666632293395995849720100387183880771924071431552321067654243458280448000) [(6, 2)],
  term ((-25659611084893707138376543247128560727835283229482533664124743950451517045494049 : Rat) / 14509333316146697997924860050193591940385962035715776160533827121729140224000) [(6, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1675 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1675_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1675
        rs_R009_ueqv_R009NYNYN_generator_28_1600_1699 =
      rs_R009_ueqv_R009NYNYN_partial_28_1675 := by
  native_decide

/-- Coefficient term 1676 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1676 : Poly :=
[
  term ((25659611084893707138376543247128560727835283229482533664124743950451517045494049 : Rat) / 43527999948440093993774580150580775821157886107147328481601481365187420672000) [(6, 2), (14, 1)]
]

/-- Partial product 1676 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1676 : Poly :=
[
  term ((-25659611084893707138376543247128560727835283229482533664124743950451517045494049 : Rat) / 43527999948440093993774580150580775821157886107147328481601481365187420672000) [(6, 2), (14, 1)],
  term ((25659611084893707138376543247128560727835283229482533664124743950451517045494049 : Rat) / 21763999974220046996887290075290387910578943053573664240800740682593710336000) [(6, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1676 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1676_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1676
        rs_R009_ueqv_R009NYNYN_generator_28_1600_1699 =
      rs_R009_ueqv_R009NYNYN_partial_28_1676 := by
  native_decide

/-- Coefficient term 1677 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1677 : Poly :=
[
  term ((531635627349083362909 : Rat) / 42732143419666931580) [(6, 2), (14, 1), (16, 1)]
]

/-- Partial product 1677 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1677 : Poly :=
[
  term ((-531635627349083362909 : Rat) / 42732143419666931580) [(6, 2), (14, 1), (16, 1)],
  term ((531635627349083362909 : Rat) / 21366071709833465790) [(6, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1677 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1677_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1677
        rs_R009_ueqv_R009NYNYN_generator_28_1600_1699 =
      rs_R009_ueqv_R009NYNYN_partial_28_1677 := by
  native_decide

/-- Coefficient term 1678 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1678 : Poly :=
[
  term ((-531635627349083362909 : Rat) / 28488095613111287720) [(6, 2), (16, 1)]
]

/-- Partial product 1678 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1678 : Poly :=
[
  term ((-531635627349083362909 : Rat) / 14244047806555643860) [(6, 2), (14, 1), (16, 1)],
  term ((531635627349083362909 : Rat) / 28488095613111287720) [(6, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1678 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1678_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1678
        rs_R009_ueqv_R009NYNYN_generator_28_1600_1699 =
      rs_R009_ueqv_R009NYNYN_partial_28_1678 := by
  native_decide

/-- Coefficient term 1679 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1679 : Poly :=
[
  term ((12596598213959792 : Rat) / 3146696864482101) [(7, 1), (8, 1), (15, 1)]
]

/-- Partial product 1679 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1679 : Poly :=
[
  term ((25193196427919584 : Rat) / 3146696864482101) [(7, 1), (8, 1), (14, 1), (15, 1)],
  term ((-12596598213959792 : Rat) / 3146696864482101) [(7, 1), (8, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1679 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1679_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1679
        rs_R009_ueqv_R009NYNYN_generator_28_1600_1699 =
      rs_R009_ueqv_R009NYNYN_partial_28_1679 := by
  native_decide

/-- Coefficient term 1680 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1680 : Poly :=
[
  term ((-1253413162556794161681165409437649587651963732972906420516634089727791552833 : Rat) / 10743106961394847258882379982161534121292758012482592883830843013761792000) [(7, 1), (9, 1)]
]

/-- Partial product 1680 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1680 : Poly :=
[
  term ((1253413162556794161681165409437649587651963732972906420516634089727791552833 : Rat) / 10743106961394847258882379982161534121292758012482592883830843013761792000) [(7, 1), (9, 1)],
  term ((-1253413162556794161681165409437649587651963732972906420516634089727791552833 : Rat) / 5371553480697423629441189991080767060646379006241296441915421506880896000) [(7, 1), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1680 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1680_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1680
        rs_R009_ueqv_R009NYNYN_generator_28_1600_1699 =
      rs_R009_ueqv_R009NYNYN_partial_28_1680 := by
  native_decide

/-- Coefficient term 1681 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1681 : Poly :=
[
  term ((1178152797916307377935543030082261817606525980678834313733947680120559040833 : Rat) / 16114660442092270888323569973242301181939137018723889325746264520642688000) [(7, 1), (9, 1), (14, 1)]
]

/-- Partial product 1681 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1681 : Poly :=
[
  term ((-1178152797916307377935543030082261817606525980678834313733947680120559040833 : Rat) / 16114660442092270888323569973242301181939137018723889325746264520642688000) [(7, 1), (9, 1), (14, 1)],
  term ((1178152797916307377935543030082261817606525980678834313733947680120559040833 : Rat) / 8057330221046135444161784986621150590969568509361944662873132260321344000) [(7, 1), (9, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1681 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1681_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1681
        rs_R009_ueqv_R009NYNYN_generator_28_1600_1699 =
      rs_R009_ueqv_R009NYNYN_partial_28_1681 := by
  native_decide

/-- Coefficient term 1682 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1682 : Poly :=
[
  term ((11370534228796125233 : Rat) / 10683035854916732895) [(7, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 1682 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1682 : Poly :=
[
  term ((-11370534228796125233 : Rat) / 10683035854916732895) [(7, 1), (9, 1), (14, 1), (16, 1)],
  term ((22741068457592250466 : Rat) / 10683035854916732895) [(7, 1), (9, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1682 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1682_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1682
        rs_R009_ueqv_R009NYNYN_generator_28_1600_1699 =
      rs_R009_ueqv_R009NYNYN_partial_28_1682 := by
  native_decide

/-- Coefficient term 1683 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1683 : Poly :=
[
  term ((-11370534228796125233 : Rat) / 7122023903277821930) [(7, 1), (9, 1), (16, 1)]
]

/-- Partial product 1683 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1683 : Poly :=
[
  term ((-11370534228796125233 : Rat) / 3561011951638910965) [(7, 1), (9, 1), (14, 1), (16, 1)],
  term ((11370534228796125233 : Rat) / 7122023903277821930) [(7, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1683 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1683_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1683
        rs_R009_ueqv_R009NYNYN_generator_28_1600_1699 =
      rs_R009_ueqv_R009NYNYN_partial_28_1683 := by
  native_decide

/-- Coefficient term 1684 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1684 : Poly :=
[
  term ((25193196427919584 : Rat) / 3146696864482101) [(7, 1), (12, 1), (13, 1)]
]

/-- Partial product 1684 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1684 : Poly :=
[
  term ((-25193196427919584 : Rat) / 3146696864482101) [(7, 1), (12, 1), (13, 1)],
  term ((50386392855839168 : Rat) / 3146696864482101) [(7, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1684 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1684_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1684
        rs_R009_ueqv_R009NYNYN_generator_28_1600_1699 =
      rs_R009_ueqv_R009NYNYN_partial_28_1684 := by
  native_decide

/-- Coefficient term 1685 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1685 : Poly :=
[
  term ((25193196427919584 : Rat) / 3146696864482101) [(7, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 1685 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1685 : Poly :=
[
  term ((-25193196427919584 : Rat) / 3146696864482101) [(7, 1), (12, 1), (13, 1), (14, 1)],
  term ((50386392855839168 : Rat) / 3146696864482101) [(7, 1), (12, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1685 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1685_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1685
        rs_R009_ueqv_R009NYNYN_generator_28_1600_1699 =
      rs_R009_ueqv_R009NYNYN_partial_28_1685 := by
  native_decide

/-- Coefficient term 1686 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1686 : Poly :=
[
  term ((15745747767449740 : Rat) / 3146696864482101) [(7, 1), (12, 1), (15, 1)]
]

/-- Partial product 1686 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1686 : Poly :=
[
  term ((31491495534899480 : Rat) / 3146696864482101) [(7, 1), (12, 1), (14, 1), (15, 1)],
  term ((-15745747767449740 : Rat) / 3146696864482101) [(7, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1686 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1686_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1686
        rs_R009_ueqv_R009NYNYN_generator_28_1600_1699 =
      rs_R009_ueqv_R009NYNYN_partial_28_1686 := by
  native_decide

/-- Coefficient term 1687 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1687 : Poly :=
[
  term ((-25193196427919584 : Rat) / 3146696864482101) [(7, 1), (12, 2), (15, 1)]
]

/-- Partial product 1687 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1687 : Poly :=
[
  term ((-50386392855839168 : Rat) / 3146696864482101) [(7, 1), (12, 2), (14, 1), (15, 1)],
  term ((25193196427919584 : Rat) / 3146696864482101) [(7, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1687 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1687_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1687
        rs_R009_ueqv_R009NYNYN_generator_28_1600_1699 =
      rs_R009_ueqv_R009NYNYN_partial_28_1687 := by
  native_decide

/-- Coefficient term 1688 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1688 : Poly :=
[
  term ((-7872873883724870 : Rat) / 3146696864482101) [(7, 1), (13, 1)]
]

/-- Partial product 1688 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1688 : Poly :=
[
  term ((7872873883724870 : Rat) / 3146696864482101) [(7, 1), (13, 1)],
  term ((-15745747767449740 : Rat) / 3146696864482101) [(7, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1688 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1688_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1688
        rs_R009_ueqv_R009NYNYN_generator_28_1600_1699 =
      rs_R009_ueqv_R009NYNYN_partial_28_1688 := by
  native_decide

/-- Coefficient term 1689 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1689 : Poly :=
[
  term ((-15745747767449740 : Rat) / 3146696864482101) [(7, 1), (13, 1), (14, 1)]
]

/-- Partial product 1689 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1689 : Poly :=
[
  term ((15745747767449740 : Rat) / 3146696864482101) [(7, 1), (13, 1), (14, 1)],
  term ((-31491495534899480 : Rat) / 3146696864482101) [(7, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1689 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1689_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1689
        rs_R009_ueqv_R009NYNYN_generator_28_1600_1699 =
      rs_R009_ueqv_R009NYNYN_partial_28_1689 := by
  native_decide

/-- Coefficient term 1690 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1690 : Poly :=
[
  term ((3149149553489948 : Rat) / 1048898954827367) [(7, 1), (15, 1)]
]

/-- Partial product 1690 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1690 : Poly :=
[
  term ((6298299106979896 : Rat) / 1048898954827367) [(7, 1), (14, 1), (15, 1)],
  term ((-3149149553489948 : Rat) / 1048898954827367) [(7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1690 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1690_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1690
        rs_R009_ueqv_R009NYNYN_generator_28_1600_1699 =
      rs_R009_ueqv_R009NYNYN_partial_28_1690 := by
  native_decide

/-- Coefficient term 1691 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1691 : Poly :=
[
  term ((-25659611084893707138376543247128560727835283229482533664124743950451517045494049 : Rat) / 29018666632293395995849720100387183880771924071431552321067654243458280448000) [(7, 2)]
]

/-- Partial product 1691 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1691 : Poly :=
[
  term ((25659611084893707138376543247128560727835283229482533664124743950451517045494049 : Rat) / 29018666632293395995849720100387183880771924071431552321067654243458280448000) [(7, 2)],
  term ((-25659611084893707138376543247128560727835283229482533664124743950451517045494049 : Rat) / 14509333316146697997924860050193591940385962035715776160533827121729140224000) [(7, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1691 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1691_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1691
        rs_R009_ueqv_R009NYNYN_generator_28_1600_1699 =
      rs_R009_ueqv_R009NYNYN_partial_28_1691 := by
  native_decide

/-- Coefficient term 1692 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1692 : Poly :=
[
  term ((25659611084893707138376543247128560727835283229482533664124743950451517045494049 : Rat) / 43527999948440093993774580150580775821157886107147328481601481365187420672000) [(7, 2), (14, 1)]
]

/-- Partial product 1692 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1692 : Poly :=
[
  term ((-25659611084893707138376543247128560727835283229482533664124743950451517045494049 : Rat) / 43527999948440093993774580150580775821157886107147328481601481365187420672000) [(7, 2), (14, 1)],
  term ((25659611084893707138376543247128560727835283229482533664124743950451517045494049 : Rat) / 21763999974220046996887290075290387910578943053573664240800740682593710336000) [(7, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1692 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1692_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1692
        rs_R009_ueqv_R009NYNYN_generator_28_1600_1699 =
      rs_R009_ueqv_R009NYNYN_partial_28_1692 := by
  native_decide

/-- Coefficient term 1693 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1693 : Poly :=
[
  term ((531635627349083362909 : Rat) / 42732143419666931580) [(7, 2), (14, 1), (16, 1)]
]

/-- Partial product 1693 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1693 : Poly :=
[
  term ((-531635627349083362909 : Rat) / 42732143419666931580) [(7, 2), (14, 1), (16, 1)],
  term ((531635627349083362909 : Rat) / 21366071709833465790) [(7, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1693 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1693_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1693
        rs_R009_ueqv_R009NYNYN_generator_28_1600_1699 =
      rs_R009_ueqv_R009NYNYN_partial_28_1693 := by
  native_decide

/-- Coefficient term 1694 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1694 : Poly :=
[
  term ((-531635627349083362909 : Rat) / 28488095613111287720) [(7, 2), (16, 1)]
]

/-- Partial product 1694 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1694 : Poly :=
[
  term ((-531635627349083362909 : Rat) / 14244047806555643860) [(7, 2), (14, 1), (16, 1)],
  term ((531635627349083362909 : Rat) / 28488095613111287720) [(7, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1694 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1694_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1694
        rs_R009_ueqv_R009NYNYN_generator_28_1600_1699 =
      rs_R009_ueqv_R009NYNYN_partial_28_1694 := by
  native_decide

/-- Coefficient term 1695 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1695 : Poly :=
[
  term ((6771624652481626682253673030282330955373621630327455288628575730089984199600776046643 : Rat) / 9625346628598557984843372908697926957332643354873488747136535574283894333199360000) [(8, 1)]
]

/-- Partial product 1695 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1695 : Poly :=
[
  term ((-6771624652481626682253673030282330955373621630327455288628575730089984199600776046643 : Rat) / 9625346628598557984843372908697926957332643354873488747136535574283894333199360000) [(8, 1)],
  term ((6771624652481626682253673030282330955373621630327455288628575730089984199600776046643 : Rat) / 4812673314299278992421686454348963478666321677436744373568267787141947166599680000) [(8, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1695 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1695_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1695
        rs_R009_ueqv_R009NYNYN_generator_28_1600_1699 =
      rs_R009_ueqv_R009NYNYN_partial_28_1695 := by
  native_decide

/-- Coefficient term 1696 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1696 : Poly :=
[
  term ((-456720167849093754498431671822913982273787 : Rat) / 4396352775071994240912540908485088809500) [(8, 1), (9, 1), (10, 1), (11, 1)]
]

/-- Partial product 1696 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1696 : Poly :=
[
  term ((456720167849093754498431671822913982273787 : Rat) / 4396352775071994240912540908485088809500) [(8, 1), (9, 1), (10, 1), (11, 1)],
  term ((-456720167849093754498431671822913982273787 : Rat) / 2198176387535997120456270454242544404750) [(8, 1), (9, 1), (10, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1696 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1696_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1696
        rs_R009_ueqv_R009NYNYN_generator_28_1600_1699 =
      rs_R009_ueqv_R009NYNYN_partial_28_1696 := by
  native_decide

/-- Coefficient term 1697 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1697 : Poly :=
[
  term ((28098782776770744636875994754413520494776 : Rat) / 49707506250814005236448326854730903625) [(8, 1), (9, 1), (10, 1), (11, 1), (12, 1)]
]

/-- Partial product 1697 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1697 : Poly :=
[
  term ((-28098782776770744636875994754413520494776 : Rat) / 49707506250814005236448326854730903625) [(8, 1), (9, 1), (10, 1), (11, 1), (12, 1)],
  term ((56197565553541489273751989508827040989552 : Rat) / 49707506250814005236448326854730903625) [(8, 1), (9, 1), (10, 1), (11, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1697 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1697_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1697
        rs_R009_ueqv_R009NYNYN_generator_28_1600_1699 =
      rs_R009_ueqv_R009NYNYN_partial_28_1697 := by
  native_decide

/-- Coefficient term 1698 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1698 : Poly :=
[
  term ((5528973344396980660608 : Rat) / 4339258264657398321155) [(8, 1), (9, 1), (10, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 1698 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1698 : Poly :=
[
  term ((11057946688793961321216 : Rat) / 4339258264657398321155) [(8, 1), (9, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-5528973344396980660608 : Rat) / 4339258264657398321155) [(8, 1), (9, 1), (10, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1698 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1698_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1698
        rs_R009_ueqv_R009NYNYN_generator_28_1600_1699 =
      rs_R009_ueqv_R009NYNYN_partial_28_1698 := by
  native_decide

/-- Coefficient term 1699 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1699 : Poly :=
[
  term ((-14049391388385372318437997377206760247388 : Rat) / 49707506250814005236448326854730903625) [(8, 1), (9, 1), (10, 1), (11, 1), (14, 1)]
]

/-- Partial product 1699 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1699 : Poly :=
[
  term ((14049391388385372318437997377206760247388 : Rat) / 49707506250814005236448326854730903625) [(8, 1), (9, 1), (10, 1), (11, 1), (14, 1)],
  term ((-28098782776770744636875994754413520494776 : Rat) / 49707506250814005236448326854730903625) [(8, 1), (9, 1), (10, 1), (11, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1699 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1699_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1699
        rs_R009_ueqv_R009NYNYN_generator_28_1600_1699 =
      rs_R009_ueqv_R009NYNYN_partial_28_1699 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NYNYN_partials_28_1600_1699 : List Poly :=
[
  rs_R009_ueqv_R009NYNYN_partial_28_1600,
  rs_R009_ueqv_R009NYNYN_partial_28_1601,
  rs_R009_ueqv_R009NYNYN_partial_28_1602,
  rs_R009_ueqv_R009NYNYN_partial_28_1603,
  rs_R009_ueqv_R009NYNYN_partial_28_1604,
  rs_R009_ueqv_R009NYNYN_partial_28_1605,
  rs_R009_ueqv_R009NYNYN_partial_28_1606,
  rs_R009_ueqv_R009NYNYN_partial_28_1607,
  rs_R009_ueqv_R009NYNYN_partial_28_1608,
  rs_R009_ueqv_R009NYNYN_partial_28_1609,
  rs_R009_ueqv_R009NYNYN_partial_28_1610,
  rs_R009_ueqv_R009NYNYN_partial_28_1611,
  rs_R009_ueqv_R009NYNYN_partial_28_1612,
  rs_R009_ueqv_R009NYNYN_partial_28_1613,
  rs_R009_ueqv_R009NYNYN_partial_28_1614,
  rs_R009_ueqv_R009NYNYN_partial_28_1615,
  rs_R009_ueqv_R009NYNYN_partial_28_1616,
  rs_R009_ueqv_R009NYNYN_partial_28_1617,
  rs_R009_ueqv_R009NYNYN_partial_28_1618,
  rs_R009_ueqv_R009NYNYN_partial_28_1619,
  rs_R009_ueqv_R009NYNYN_partial_28_1620,
  rs_R009_ueqv_R009NYNYN_partial_28_1621,
  rs_R009_ueqv_R009NYNYN_partial_28_1622,
  rs_R009_ueqv_R009NYNYN_partial_28_1623,
  rs_R009_ueqv_R009NYNYN_partial_28_1624,
  rs_R009_ueqv_R009NYNYN_partial_28_1625,
  rs_R009_ueqv_R009NYNYN_partial_28_1626,
  rs_R009_ueqv_R009NYNYN_partial_28_1627,
  rs_R009_ueqv_R009NYNYN_partial_28_1628,
  rs_R009_ueqv_R009NYNYN_partial_28_1629,
  rs_R009_ueqv_R009NYNYN_partial_28_1630,
  rs_R009_ueqv_R009NYNYN_partial_28_1631,
  rs_R009_ueqv_R009NYNYN_partial_28_1632,
  rs_R009_ueqv_R009NYNYN_partial_28_1633,
  rs_R009_ueqv_R009NYNYN_partial_28_1634,
  rs_R009_ueqv_R009NYNYN_partial_28_1635,
  rs_R009_ueqv_R009NYNYN_partial_28_1636,
  rs_R009_ueqv_R009NYNYN_partial_28_1637,
  rs_R009_ueqv_R009NYNYN_partial_28_1638,
  rs_R009_ueqv_R009NYNYN_partial_28_1639,
  rs_R009_ueqv_R009NYNYN_partial_28_1640,
  rs_R009_ueqv_R009NYNYN_partial_28_1641,
  rs_R009_ueqv_R009NYNYN_partial_28_1642,
  rs_R009_ueqv_R009NYNYN_partial_28_1643,
  rs_R009_ueqv_R009NYNYN_partial_28_1644,
  rs_R009_ueqv_R009NYNYN_partial_28_1645,
  rs_R009_ueqv_R009NYNYN_partial_28_1646,
  rs_R009_ueqv_R009NYNYN_partial_28_1647,
  rs_R009_ueqv_R009NYNYN_partial_28_1648,
  rs_R009_ueqv_R009NYNYN_partial_28_1649,
  rs_R009_ueqv_R009NYNYN_partial_28_1650,
  rs_R009_ueqv_R009NYNYN_partial_28_1651,
  rs_R009_ueqv_R009NYNYN_partial_28_1652,
  rs_R009_ueqv_R009NYNYN_partial_28_1653,
  rs_R009_ueqv_R009NYNYN_partial_28_1654,
  rs_R009_ueqv_R009NYNYN_partial_28_1655,
  rs_R009_ueqv_R009NYNYN_partial_28_1656,
  rs_R009_ueqv_R009NYNYN_partial_28_1657,
  rs_R009_ueqv_R009NYNYN_partial_28_1658,
  rs_R009_ueqv_R009NYNYN_partial_28_1659,
  rs_R009_ueqv_R009NYNYN_partial_28_1660,
  rs_R009_ueqv_R009NYNYN_partial_28_1661,
  rs_R009_ueqv_R009NYNYN_partial_28_1662,
  rs_R009_ueqv_R009NYNYN_partial_28_1663,
  rs_R009_ueqv_R009NYNYN_partial_28_1664,
  rs_R009_ueqv_R009NYNYN_partial_28_1665,
  rs_R009_ueqv_R009NYNYN_partial_28_1666,
  rs_R009_ueqv_R009NYNYN_partial_28_1667,
  rs_R009_ueqv_R009NYNYN_partial_28_1668,
  rs_R009_ueqv_R009NYNYN_partial_28_1669,
  rs_R009_ueqv_R009NYNYN_partial_28_1670,
  rs_R009_ueqv_R009NYNYN_partial_28_1671,
  rs_R009_ueqv_R009NYNYN_partial_28_1672,
  rs_R009_ueqv_R009NYNYN_partial_28_1673,
  rs_R009_ueqv_R009NYNYN_partial_28_1674,
  rs_R009_ueqv_R009NYNYN_partial_28_1675,
  rs_R009_ueqv_R009NYNYN_partial_28_1676,
  rs_R009_ueqv_R009NYNYN_partial_28_1677,
  rs_R009_ueqv_R009NYNYN_partial_28_1678,
  rs_R009_ueqv_R009NYNYN_partial_28_1679,
  rs_R009_ueqv_R009NYNYN_partial_28_1680,
  rs_R009_ueqv_R009NYNYN_partial_28_1681,
  rs_R009_ueqv_R009NYNYN_partial_28_1682,
  rs_R009_ueqv_R009NYNYN_partial_28_1683,
  rs_R009_ueqv_R009NYNYN_partial_28_1684,
  rs_R009_ueqv_R009NYNYN_partial_28_1685,
  rs_R009_ueqv_R009NYNYN_partial_28_1686,
  rs_R009_ueqv_R009NYNYN_partial_28_1687,
  rs_R009_ueqv_R009NYNYN_partial_28_1688,
  rs_R009_ueqv_R009NYNYN_partial_28_1689,
  rs_R009_ueqv_R009NYNYN_partial_28_1690,
  rs_R009_ueqv_R009NYNYN_partial_28_1691,
  rs_R009_ueqv_R009NYNYN_partial_28_1692,
  rs_R009_ueqv_R009NYNYN_partial_28_1693,
  rs_R009_ueqv_R009NYNYN_partial_28_1694,
  rs_R009_ueqv_R009NYNYN_partial_28_1695,
  rs_R009_ueqv_R009NYNYN_partial_28_1696,
  rs_R009_ueqv_R009NYNYN_partial_28_1697,
  rs_R009_ueqv_R009NYNYN_partial_28_1698,
  rs_R009_ueqv_R009NYNYN_partial_28_1699
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NYNYN_block_28_1600_1699 : Poly :=
[
  term ((40504531346666479333376582420887593958529658596811980800 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (9, 1), (10, 2)],
  term ((-5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (9, 1), (10, 2), (12, 1)],
  term ((11445208307152018749942276720439365358264601698684108800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (9, 1), (10, 2), (12, 1), (14, 1)],
  term ((-10346450923281277800613779614492237699765837988515840000 : Rat) / 2155526510388634287214594206068266543338254015229673617) [(5, 1), (9, 1), (10, 2), (14, 1)],
  term ((-5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (9, 1), (10, 2), (14, 2)],
  term ((-5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((2861302076788004687485569180109841339566150424671027200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((2861302076788004687485569180109841339566150424671027200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (9, 1), (11, 1), (13, 1)],
  term ((-11445208307152018749942276720439365358264601698684108800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (9, 1), (11, 1), (13, 1), (14, 1)],
  term ((11445208307152018749942276720439365358264601698684108800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (9, 1), (11, 1), (13, 1), (14, 2)],
  term ((2202719273171030132118093654988708040286967770934016614400 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (9, 1), (12, 1)],
  term ((-4662966134036354427229358020406869257697918102011084800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((2331483067018177213614679010203434628848959051005542400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((-328470477290932255668297465185527811289767070413249945600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (9, 1), (12, 1), (14, 1)],
  term ((64077906863250726610962566070527894063807846303714713600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (9, 1), (12, 1), (14, 1), (15, 2)],
  term ((-2898408501447339926443020246615331557932063816297567436800 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (9, 1), (12, 1), (14, 2)],
  term ((-32038953431625363305481283035263947031903923151857356800 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (9, 1), (12, 1), (15, 2)],
  term ((-2019790838518175921305493905635811652985822756052063846400 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (9, 1), (12, 2)],
  term ((4039581677036351842610987811271623305971645512104127692800 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (9, 1), (12, 2), (14, 1)],
  term ((128155813726501453221925132141055788127615692607429427200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((-128155813726501453221925132141055788127615692607429427200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (9, 1), (13, 1), (14, 2), (15, 1)],
  term ((-32038953431625363305481283035263947031903923151857356800 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (9, 1), (13, 1), (15, 1)],
  term ((-1165741533509088606807339505101717314424479525502771200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (9, 1), (13, 2)],
  term ((4662966134036354427229358020406869257697918102011084800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (9, 1), (13, 2), (14, 2)],
  term ((-728374640846174309486985984316532642657059418801581107200 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (9, 1), (14, 1)],
  term ((1456749281692348618973971968633065285314118837603162214400 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (9, 1), (14, 2)],
  term ((1430651038394002343742784590054920669783075212335513600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (9, 2), (11, 1)],
  term ((-5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (9, 2), (11, 1), (12, 1)],
  term ((11445208307152018749942276720439365358264601698684108800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (9, 2), (11, 1), (12, 1), (14, 1)],
  term ((-5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (9, 2), (11, 1), (14, 2)],
  term ((-128155813726501453221925132141055788127615692607429427200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (9, 2), (12, 1), (14, 1), (15, 1)],
  term ((64077906863250726610962566070527894063807846303714713600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (9, 2), (12, 1), (15, 1)],
  term ((64077906863250726610962566070527894063807846303714713600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (9, 2), (14, 2), (15, 1)],
  term ((-16019476715812681652740641517631973515951961575928678400 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (9, 2), (15, 1)],
  term ((1430651038394002343742784590054920669783075212335513600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (10, 1), (11, 1)],
  term ((-1430651038394002343742784590054920669783075212335513600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (10, 1), (11, 1), (12, 1)],
  term ((2861302076788004687485569180109841339566150424671027200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (10, 1), (11, 1), (12, 1), (14, 1)],
  term ((5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-2861302076788004687485569180109841339566150424671027200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (10, 1), (11, 1), (14, 2)],
  term ((-23061175744320682744905936150195181751334040933562777600 : Rat) / 2155526510388634287214594206068266543338254015229673617) [(5, 1), (10, 1), (12, 1), (13, 1)],
  term ((-52926637113086451289609369495625528736818662673016422400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((963272743519497824595022429179218261458265122177856307200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (10, 1), (12, 1), (13, 1), (14, 2)],
  term ((-115643516092318144095367414744397073302761587978016768000 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((57821758046159072047683707372198536651380793989008384000 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (10, 1), (12, 1), (15, 1)],
  term ((217218032226992144048654906811203276347011879678476288000 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (10, 1), (12, 2), (13, 1)],
  term ((-217218032226992144048654906811203276347011879678476288000 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (10, 1), (12, 2), (13, 1), (14, 1)],
  term ((-434436064453984288097309813622406552694023759356952576000 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (10, 1), (12, 2), (13, 1), (14, 2)],
  term ((-963272743519497824595022429179218261458265122177856307200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (10, 1), (12, 2), (14, 1), (15, 1)],
  term ((481636371759748912297511214589609130729132561088928153600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (10, 1), (12, 2), (15, 1)],
  term ((434436064453984288097309813622406552694023759356952576000 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (10, 1), (12, 3), (14, 1), (15, 1)],
  term ((-217218032226992144048654906811203276347011879678476288000 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (10, 1), (12, 3), (15, 1)],
  term ((77790641181451051810020603913681259663339958812575129600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (10, 1), (13, 1)],
  term ((-17259071573053969328019729044513055902929533335835596800 : Rat) / 2155526510388634287214594206068266543338254015229673617) [(5, 1), (10, 1), (13, 1), (14, 1)],
  term ((-64077906863250726610962566070527894063807846303714713600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (10, 1), (13, 1), (14, 1), (15, 2)],
  term ((-69535562703048636647806209031542256012346368548602163200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (10, 1), (13, 1), (14, 2)],
  term ((32038953431625363305481283035263947031903923151857356800 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (10, 1), (13, 1), (15, 2)],
  term ((2136856467692387235482353035834797824406627177365606400 : Rat) / 307932358626947755316370600866895220476893430747096231) [(5, 1), (10, 1), (14, 1), (15, 1)],
  term ((-1068428233846193617741176517917398912203313588682803200 : Rat) / 307932358626947755316370600866895220476893430747096231) [(5, 1), (10, 1), (15, 1)],
  term ((-5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (10, 2), (12, 1), (14, 1), (15, 1)],
  term ((2861302076788004687485569180109841339566150424671027200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (10, 2), (12, 1), (15, 1)],
  term ((-2861302076788004687485569180109841339566150424671027200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (10, 2), (13, 1), (14, 1)],
  term ((5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (10, 2), (13, 1), (14, 2)],
  term ((5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (10, 2), (14, 1), (15, 1)],
  term ((-2861302076788004687485569180109841339566150424671027200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (10, 2), (15, 1)],
  term ((36223532041586108238604429848382961109310811458576102400 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (11, 1)],
  term ((365183302155579127335974244546043610020455311518861721600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (11, 1), (12, 1)],
  term ((-2145976557591003515614176885082381004674612818503270400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((1072988278795501757807088442541190502337306409251635200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-730366604311158254671948489092087220040910623037723443200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (11, 1), (12, 1), (14, 1)],
  term ((-142402558414935650823595494093344236963264751593116467200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (11, 1), (12, 2)],
  term ((284805116829871301647190988186688473926529503186232934400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (11, 1), (12, 2), (14, 1)],
  term ((5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((64077906863250726610962566070527894063807846303714713600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((-24603382946176695715197349057961497534650412849941760000 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (11, 1), (13, 1), (15, 1)],
  term ((-536494139397750878903544221270595251168653204625817600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (11, 1), (13, 2)],
  term ((2145976557591003515614176885082381004674612818503270400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (11, 1), (13, 2), (14, 2)],
  term ((53524216450358338444800108349728872608165228214453657600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (11, 1), (14, 1)],
  term ((-11997264812717195706857996956809028078741604869676748800 : Rat) / 718508836796211429071531402022755514446084671743224539) [(5, 1), (11, 1), (14, 2)],
  term ((1430651038394002343742784590054920669783075212335513600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (11, 2), (13, 1)],
  term ((-5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (11, 2), (13, 1), (14, 2)],
  term ((581919735422584553391880776645596318386464774968836556800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (12, 1), (13, 1)],
  term ((-6252418874963139839910306970401230419886004510610323404800 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (12, 1), (13, 1), (14, 1)],
  term ((10780877673600897544424997352694136082403417847643545600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((-8444272725286764242287094018439006622140722877657469235200 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (12, 1), (13, 1), (14, 2)],
  term ((-5390438836800448772212498676347068041201708923821772800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (12, 1), (13, 1), (15, 2)],
  term ((-1384032670441555809417377651298218133399534260343364710400 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (12, 1), (14, 1), (15, 1)],
  term ((692016335220777904708688825649109066699767130171682355200 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (12, 1), (15, 1)],
  term ((-2887916827645758128981754191069416102102243500568042496000 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (12, 2), (13, 1)],
  term ((2887916827645758128981754191069416102102243500568042496000 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (12, 2), (13, 1), (14, 1)],
  term ((5775833655291516257963508382138832204204487001136084992000 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (12, 2), (13, 1), (14, 2)],
  term ((8492786674817968281237006506526130234511538257971865190400 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (12, 2), (14, 1), (15, 1)],
  term ((-4246393337408984140618503253263065117255769128985932595200 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (12, 2), (15, 1)],
  term ((-5775833655291516257963508382138832204204487001136084992000 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (12, 3), (14, 1), (15, 1)],
  term ((2887916827645758128981754191069416102102243500568042496000 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (12, 3), (15, 1)],
  term ((-1818892285453544452524426582089670690066535586895918054400 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (13, 1)],
  term ((1476917157427449768848546851502279849844478412532828416000 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (13, 1), (14, 1)],
  term ((-64077906863250726610962566070527894063807846303714713600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (13, 1), (14, 1), (15, 2)],
  term ((480192758551030919155623625039347006730798391390890598400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (13, 1), (14, 2)],
  term ((32038953431625363305481283035263947031903923151857356800 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (13, 1), (15, 2)],
  term ((-10780877673600897544424997352694136082403417847643545600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (13, 2), (14, 2), (15, 1)],
  term ((2695219418400224386106249338173534020600854461910886400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (13, 2), (15, 1)],
  term ((-647363346641483178751689926405260705663977083844700057600 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (14, 1), (15, 1)],
  term ((323681673320741589375844963202630352831988541922350028800 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (15, 1)],
  term ((2437819434346724479832540061005042773250153334908518400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 2)],
  term ((4875638868693448959665080122010085546500306669817036800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 2), (8, 1)],
  term ((-9751277737386897919330160244020171093000613339634073600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 2), (8, 1), (14, 1)],
  term ((-4875638868693448959665080122010085546500306669817036800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 2), (14, 1)],
  term ((-3662063577243717227236276350222151272198460898243359245615848517973523924346007 : Rat) / 1554571426730003356920520719663599136469924503826690302914338620185265024000) [(6, 1)],
  term ((1231910201230940794896701872478967367638981518031742961435866544125725120833 : Rat) / 10743106961394847258882379982161534121292758012482592883830843013761792000) [(6, 1), (8, 1)],
  term ((-1234598071396672465744759814598802645140604294899388393820962487325983424833 : Rat) / 4028665110523067722080892493310575295484784254680972331436566130160672000) [(6, 1), (8, 1), (14, 1)],
  term ((-45482136915184500932 : Rat) / 10683035854916732895) [(6, 1), (8, 1), (14, 1), (16, 1)],
  term ((1242661681893867478288933640958308477645472625502324690976250316926758336833 : Rat) / 8057330221046135444161784986621150590969568509361944662873132260321344000) [(6, 1), (8, 1), (14, 2)],
  term ((22741068457592250466 : Rat) / 10683035854916732895) [(6, 1), (8, 1), (14, 2), (16, 1)],
  term ((11370534228796125233 : Rat) / 7122023903277821930) [(6, 1), (8, 1), (16, 1)],
  term ((3662452523027597235647463183662981721894894700271523325989859187060491914234007 : Rat) / 582964285023751258845195269873849676176221688935008863592876982569474384000) [(6, 1), (14, 1)],
  term ((4253085018792666903272 : Rat) / 32049107564750198685) [(6, 1), (14, 1), (16, 1)],
  term ((-3663619360379237260881023683985473070984196106356015567111891194321395883898007 : Rat) / 1165928570047502517690390539747699352352443377870017727185753965138948768000) [(6, 1), (14, 2)],
  term ((-2126542509396333451636 : Rat) / 32049107564750198685) [(6, 1), (14, 2), (16, 1)],
  term ((-531635627349083362909 : Rat) / 10683035854916732895) [(6, 1), (16, 1)],
  term ((25659611084893707138376543247128560727835283229482533664124743950451517045494049 : Rat) / 29018666632293395995849720100387183880771924071431552321067654243458280448000) [(6, 2)],
  term ((-25659611084893707138376543247128560727835283229482533664124743950451517045494049 : Rat) / 10881999987110023498443645037645193955289471526786832120400370341296855168000) [(6, 2), (14, 1)],
  term ((-531635627349083362909 : Rat) / 10683035854916732895) [(6, 2), (14, 1), (16, 1)],
  term ((25659611084893707138376543247128560727835283229482533664124743950451517045494049 : Rat) / 21763999974220046996887290075290387910578943053573664240800740682593710336000) [(6, 2), (14, 2)],
  term ((531635627349083362909 : Rat) / 21366071709833465790) [(6, 2), (14, 2), (16, 1)],
  term ((531635627349083362909 : Rat) / 28488095613111287720) [(6, 2), (16, 1)],
  term ((25193196427919584 : Rat) / 3146696864482101) [(7, 1), (8, 1), (14, 1), (15, 1)],
  term ((-12596598213959792 : Rat) / 3146696864482101) [(7, 1), (8, 1), (15, 1)],
  term ((1253413162556794161681165409437649587651963732972906420516634089727791552833 : Rat) / 10743106961394847258882379982161534121292758012482592883830843013761792000) [(7, 1), (9, 1)],
  term ((-1234598071396672465744759814598802645140604294899388393820962487325983424833 : Rat) / 4028665110523067722080892493310575295484784254680972331436566130160672000) [(7, 1), (9, 1), (14, 1)],
  term ((-45482136915184500932 : Rat) / 10683035854916732895) [(7, 1), (9, 1), (14, 1), (16, 1)],
  term ((1178152797916307377935543030082261817606525980678834313733947680120559040833 : Rat) / 8057330221046135444161784986621150590969568509361944662873132260321344000) [(7, 1), (9, 1), (14, 2)],
  term ((22741068457592250466 : Rat) / 10683035854916732895) [(7, 1), (9, 1), (14, 2), (16, 1)],
  term ((11370534228796125233 : Rat) / 7122023903277821930) [(7, 1), (9, 1), (16, 1)],
  term ((-25193196427919584 : Rat) / 3146696864482101) [(7, 1), (12, 1), (13, 1)],
  term ((25193196427919584 : Rat) / 3146696864482101) [(7, 1), (12, 1), (13, 1), (14, 1)],
  term ((50386392855839168 : Rat) / 3146696864482101) [(7, 1), (12, 1), (13, 1), (14, 2)],
  term ((31491495534899480 : Rat) / 3146696864482101) [(7, 1), (12, 1), (14, 1), (15, 1)],
  term ((-15745747767449740 : Rat) / 3146696864482101) [(7, 1), (12, 1), (15, 1)],
  term ((-50386392855839168 : Rat) / 3146696864482101) [(7, 1), (12, 2), (14, 1), (15, 1)],
  term ((25193196427919584 : Rat) / 3146696864482101) [(7, 1), (12, 2), (15, 1)],
  term ((7872873883724870 : Rat) / 3146696864482101) [(7, 1), (13, 1)],
  term ((-31491495534899480 : Rat) / 3146696864482101) [(7, 1), (13, 1), (14, 2)],
  term ((6298299106979896 : Rat) / 1048898954827367) [(7, 1), (14, 1), (15, 1)],
  term ((-3149149553489948 : Rat) / 1048898954827367) [(7, 1), (15, 1)],
  term ((25659611084893707138376543247128560727835283229482533664124743950451517045494049 : Rat) / 29018666632293395995849720100387183880771924071431552321067654243458280448000) [(7, 2)],
  term ((-25659611084893707138376543247128560727835283229482533664124743950451517045494049 : Rat) / 10881999987110023498443645037645193955289471526786832120400370341296855168000) [(7, 2), (14, 1)],
  term ((-531635627349083362909 : Rat) / 10683035854916732895) [(7, 2), (14, 1), (16, 1)],
  term ((25659611084893707138376543247128560727835283229482533664124743950451517045494049 : Rat) / 21763999974220046996887290075290387910578943053573664240800740682593710336000) [(7, 2), (14, 2)],
  term ((531635627349083362909 : Rat) / 21366071709833465790) [(7, 2), (14, 2), (16, 1)],
  term ((531635627349083362909 : Rat) / 28488095613111287720) [(7, 2), (16, 1)],
  term ((-6771624652481626682253673030282330955373621630327455288628575730089984199600776046643 : Rat) / 9625346628598557984843372908697926957332643354873488747136535574283894333199360000) [(8, 1)],
  term ((456720167849093754498431671822913982273787 : Rat) / 4396352775071994240912540908485088809500) [(8, 1), (9, 1), (10, 1), (11, 1)],
  term ((-28098782776770744636875994754413520494776 : Rat) / 49707506250814005236448326854730903625) [(8, 1), (9, 1), (10, 1), (11, 1), (12, 1)],
  term ((56197565553541489273751989508827040989552 : Rat) / 49707506250814005236448326854730903625) [(8, 1), (9, 1), (10, 1), (11, 1), (12, 1), (14, 1)],
  term ((11057946688793961321216 : Rat) / 4339258264657398321155) [(8, 1), (9, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-5528973344396980660608 : Rat) / 4339258264657398321155) [(8, 1), (9, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((1481176261935534392252437909722064737996341 : Rat) / 19783587487823974084106434088182899642750) [(8, 1), (9, 1), (10, 1), (11, 1), (14, 1)],
  term ((-28098782776770744636875994754413520494776 : Rat) / 49707506250814005236448326854730903625) [(8, 1), (9, 1), (10, 1), (11, 1), (14, 2)],
  term ((6771624652481626682253673030282330955373621630327455288628575730089984199600776046643 : Rat) / 4812673314299278992421686454348963478666321677436744373568267787141947166599680000) [(8, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 28, terms 1600 through 1699. -/
theorem rs_R009_ueqv_R009NYNYN_block_28_1600_1699_valid :
    checkProductSumEq rs_R009_ueqv_R009NYNYN_partials_28_1600_1699
      rs_R009_ueqv_R009NYNYN_block_28_1600_1699 = true := by
  native_decide

end R009UeqvR009NYNYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
