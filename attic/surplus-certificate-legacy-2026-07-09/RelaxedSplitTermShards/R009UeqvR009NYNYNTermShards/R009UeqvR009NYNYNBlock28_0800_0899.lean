/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NYNYN, term block 28:800-899

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NYNYNTermShards

/-- Generator polynomial 28 for relaxed split surplus certificate `R009:u=v:R009NYNYN`. -/
def rs_R009_ueqv_R009NYNYN_generator_28_0800_0899 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(14, 1)]
]

/-- Coefficient term 800 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0800 : Poly :=
[
  term ((-92092922182834432586514551 : Rat) / 3788172465045908734368315) [(2, 1), (3, 1), (13, 1), (16, 1)]
]

/-- Partial product 800 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0800 : Poly :=
[
  term ((-184185844365668865173029102 : Rat) / 3788172465045908734368315) [(2, 1), (3, 1), (13, 1), (14, 1), (16, 1)],
  term ((92092922182834432586514551 : Rat) / 3788172465045908734368315) [(2, 1), (3, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 800 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0800_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0800
        rs_R009_ueqv_R009NYNYN_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYNYN_partial_28_0800 := by
  native_decide

/-- Coefficient term 801 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0801 : Poly :=
[
  term ((102976766948312772400796676921249197280427076329838523459891383741 : Rat) / 666780459879334418213550964159273134650165107367486484970970610) [(2, 1), (3, 1), (13, 2), (15, 1)]
]

/-- Partial product 801 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0801 : Poly :=
[
  term ((102976766948312772400796676921249197280427076329838523459891383741 : Rat) / 333390229939667209106775482079636567325082553683743242485485305) [(2, 1), (3, 1), (13, 2), (14, 1), (15, 1)],
  term ((-102976766948312772400796676921249197280427076329838523459891383741 : Rat) / 666780459879334418213550964159273134650165107367486484970970610) [(2, 1), (3, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 801 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0801_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0801
        rs_R009_ueqv_R009NYNYN_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYNYN_partial_28_0801 := by
  native_decide

/-- Coefficient term 802 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0802 : Poly :=
[
  term ((29162659845054054605864 : Rat) / 13017774793972194963465) [(2, 1), (3, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 802 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0802 : Poly :=
[
  term ((58325319690108109211728 : Rat) / 13017774793972194963465) [(2, 1), (3, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-29162659845054054605864 : Rat) / 13017774793972194963465) [(2, 1), (3, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 802 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0802_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0802
        rs_R009_ueqv_R009NYNYN_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYNYN_partial_28_0802 := by
  native_decide

/-- Coefficient term 803 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0803 : Poly :=
[
  term ((-4278729247299390535366344375013648479972822723504 : Rat) / 1354520779047503116208002444856180344466756464819) [(2, 1), (3, 1), (13, 3)]
]

/-- Partial product 803 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0803 : Poly :=
[
  term ((4278729247299390535366344375013648479972822723504 : Rat) / 1354520779047503116208002444856180344466756464819) [(2, 1), (3, 1), (13, 3)],
  term ((-8557458494598781070732688750027296959945645447008 : Rat) / 1354520779047503116208002444856180344466756464819) [(2, 1), (3, 1), (13, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 803 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0803_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0803
        rs_R009_ueqv_R009NYNYN_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYNYN_partial_28_0803 := by
  native_decide

/-- Coefficient term 804 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0804 : Poly :=
[
  term ((57327607019429517098249360881570223693364016172026174328195098593835130948694941 : Rat) / 65291999922660140990661870225871163731736829160720992722402222047781131008000) [(2, 1), (3, 1), (14, 1), (15, 1)]
]

/-- Partial product 804 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0804 : Poly :=
[
  term ((-57327607019429517098249360881570223693364016172026174328195098593835130948694941 : Rat) / 65291999922660140990661870225871163731736829160720992722402222047781131008000) [(2, 1), (3, 1), (14, 1), (15, 1)],
  term ((57327607019429517098249360881570223693364016172026174328195098593835130948694941 : Rat) / 32645999961330070495330935112935581865868414580360496361201111023890565504000) [(2, 1), (3, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 804 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0804_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0804
        rs_R009_ueqv_R009NYNYN_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYNYN_partial_28_0804 := by
  native_decide

/-- Coefficient term 805 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0805 : Poly :=
[
  term ((1070484610703458968011 : Rat) / 64098215129500397370) [(2, 1), (3, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 805 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0805 : Poly :=
[
  term ((-1070484610703458968011 : Rat) / 64098215129500397370) [(2, 1), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((1070484610703458968011 : Rat) / 32049107564750198685) [(2, 1), (3, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 805 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0805_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0805
        rs_R009_ueqv_R009NYNYN_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYNYN_partial_28_0805 := by
  native_decide

/-- Coefficient term 806 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0806 : Poly :=
[
  term ((917642708921538358179650683987022650999379714247428958337948977901313924629859 : Rat) / 2072761902306671142560694292884798848626566005102253737219118160247020032000) [(2, 1), (3, 1), (15, 1)]
]

/-- Partial product 806 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0806 : Poly :=
[
  term ((917642708921538358179650683987022650999379714247428958337948977901313924629859 : Rat) / 1036380951153335571280347146442399424313283002551126868609559080123510016000) [(2, 1), (3, 1), (14, 1), (15, 1)],
  term ((-917642708921538358179650683987022650999379714247428958337948977901313924629859 : Rat) / 2072761902306671142560694292884798848626566005102253737219118160247020032000) [(2, 1), (3, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 806 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0806_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0806
        rs_R009_ueqv_R009NYNYN_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYNYN_partial_28_0806 := by
  native_decide

/-- Coefficient term 807 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0807 : Poly :=
[
  term ((171725045059466956083 : Rat) / 14244047806555643860) [(2, 1), (3, 1), (15, 1), (16, 1)]
]

/-- Partial product 807 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0807 : Poly :=
[
  term ((171725045059466956083 : Rat) / 7122023903277821930) [(2, 1), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((-171725045059466956083 : Rat) / 14244047806555643860) [(2, 1), (3, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 807 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0807_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0807
        rs_R009_ueqv_R009NYNYN_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYNYN_partial_28_0807 := by
  native_decide

/-- Coefficient term 808 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0808 : Poly :=
[
  term ((-23753300016878974411953899684316924669783159960575140584274860653 : Rat) / 661895678035833026440714994376224468399663825434444755200899512) [(2, 1), (3, 1), (15, 3)]
]

/-- Partial product 808 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0808 : Poly :=
[
  term ((-23753300016878974411953899684316924669783159960575140584274860653 : Rat) / 330947839017916513220357497188112234199831912717222377600449756) [(2, 1), (3, 1), (14, 1), (15, 3)],
  term ((23753300016878974411953899684316924669783159960575140584274860653 : Rat) / 661895678035833026440714994376224468399663825434444755200899512) [(2, 1), (3, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 808 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0808_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0808
        rs_R009_ueqv_R009NYNYN_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYNYN_partial_28_0808 := by
  native_decide

/-- Coefficient term 809 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0809 : Poly :=
[
  term ((25667968590396 : Rat) / 88461357636043) [(2, 1), (3, 1), (15, 3), (16, 1)]
]

/-- Partial product 809 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0809 : Poly :=
[
  term ((51335937180792 : Rat) / 88461357636043) [(2, 1), (3, 1), (14, 1), (15, 3), (16, 1)],
  term ((-25667968590396 : Rat) / 88461357636043) [(2, 1), (3, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 809 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0809_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0809
        rs_R009_ueqv_R009NYNYN_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYNYN_partial_28_0809 := by
  native_decide

/-- Coefficient term 810 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0810 : Poly :=
[
  term ((-15113597141050423314645466723928237424847902360897622033099527312857408036267 : Rat) / 673113401264537535986204847689393440533369372790938069303115691214238464000) [(2, 1), (3, 2)]
]

/-- Partial product 810 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0810 : Poly :=
[
  term ((15113597141050423314645466723928237424847902360897622033099527312857408036267 : Rat) / 673113401264537535986204847689393440533369372790938069303115691214238464000) [(2, 1), (3, 2)],
  term ((-15113597141050423314645466723928237424847902360897622033099527312857408036267 : Rat) / 336556700632268767993102423844696720266684686395469034651557845607119232000) [(2, 1), (3, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 810 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0810_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0810
        rs_R009_ueqv_R009NYNYN_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYNYN_partial_28_0810 := by
  native_decide

/-- Coefficient term 811 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0811 : Poly :=
[
  term ((-6298299106979896 : Rat) / 1048898954827367) [(2, 1), (3, 2), (12, 1)]
]

/-- Partial product 811 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0811 : Poly :=
[
  term ((6298299106979896 : Rat) / 1048898954827367) [(2, 1), (3, 2), (12, 1)],
  term ((-12596598213959792 : Rat) / 1048898954827367) [(2, 1), (3, 2), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 811 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0811_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0811
        rs_R009_ueqv_R009NYNYN_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYNYN_partial_28_0811 := by
  native_decide

/-- Coefficient term 812 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0812 : Poly :=
[
  term ((3149149553489948 : Rat) / 1048898954827367) [(2, 1), (3, 2), (14, 1)]
]

/-- Partial product 812 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0812 : Poly :=
[
  term ((-3149149553489948 : Rat) / 1048898954827367) [(2, 1), (3, 2), (14, 1)],
  term ((6298299106979896 : Rat) / 1048898954827367) [(2, 1), (3, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 812 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0812_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0812
        rs_R009_ueqv_R009NYNYN_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYNYN_partial_28_0812 := by
  native_decide

/-- Coefficient term 813 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0813 : Poly :=
[
  term ((-1157892799853546297 : Rat) / 660806341541241210) [(2, 1), (3, 2), (16, 1)]
]

/-- Partial product 813 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0813 : Poly :=
[
  term ((-1157892799853546297 : Rat) / 330403170770620605) [(2, 1), (3, 2), (14, 1), (16, 1)],
  term ((1157892799853546297 : Rat) / 660806341541241210) [(2, 1), (3, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 813 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0813_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0813
        rs_R009_ueqv_R009NYNYN_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYNYN_partial_28_0813 := by
  native_decide

/-- Coefficient term 814 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0814 : Poly :=
[
  term ((-4570911439400108399686012614384455199844037502953472000 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (8, 1), (9, 1)]
]

/-- Partial product 814 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0814 : Poly :=
[
  term ((4570911439400108399686012614384455199844037502953472000 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (8, 1), (9, 1)],
  term ((-9141822878800216799372025228768910399688075005906944000 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (8, 1), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 814 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0814_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0814
        rs_R009_ueqv_R009NYNYN_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYNYN_partial_28_0814 := by
  native_decide

/-- Coefficient term 815 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0815 : Poly :=
[
  term ((1828364575760043359874405045753782079937615001181388800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (8, 1), (9, 1), (12, 1)]
]

/-- Partial product 815 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0815 : Poly :=
[
  term ((-1828364575760043359874405045753782079937615001181388800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (8, 1), (9, 1), (12, 1)],
  term ((3656729151520086719748810091507564159875230002362777600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (8, 1), (9, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 815 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0815_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0815
        rs_R009_ueqv_R009NYNYN_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYNYN_partial_28_0815 := by
  native_decide

/-- Coefficient term 816 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0816 : Poly :=
[
  term ((-914182287880021679937202522876891039968807500590694400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (8, 1), (9, 1), (14, 1)]
]

/-- Partial product 816 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0816 : Poly :=
[
  term ((914182287880021679937202522876891039968807500590694400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (8, 1), (9, 1), (14, 1)],
  term ((-1828364575760043359874405045753782079937615001181388800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (8, 1), (9, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 816 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0816_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0816
        rs_R009_ueqv_R009NYNYN_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYNYN_partial_28_0816 := by
  native_decide

/-- Coefficient term 817 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0817 : Poly :=
[
  term ((266267428057477922645285580634790314837645974421707776000 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (5, 1), (8, 1), (11, 1)]
]

/-- Partial product 817 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0817 : Poly :=
[
  term ((-266267428057477922645285580634790314837645974421707776000 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (5, 1), (8, 1), (11, 1)],
  term ((532534856114955845290571161269580629675291948843415552000 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (5, 1), (8, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 817 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0817_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0817
        rs_R009_ueqv_R009NYNYN_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYNYN_partial_28_0817 := by
  native_decide

/-- Coefficient term 818 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0818 : Poly :=
[
  term ((1828364575760043359874405045753782079937615001181388800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (8, 1), (11, 1), (12, 1)]
]

/-- Partial product 818 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0818 : Poly :=
[
  term ((-1828364575760043359874405045753782079937615001181388800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (8, 1), (11, 1), (12, 1)],
  term ((3656729151520086719748810091507564159875230002362777600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (8, 1), (11, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 818 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0818_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0818
        rs_R009_ueqv_R009NYNYN_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYNYN_partial_28_0818 := by
  native_decide

/-- Coefficient term 819 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0819 : Poly :=
[
  term ((-914182287880021679937202522876891039968807500590694400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (8, 1), (11, 1), (14, 1)]
]

/-- Partial product 819 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0819 : Poly :=
[
  term ((914182287880021679937202522876891039968807500590694400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (8, 1), (11, 1), (14, 1)],
  term ((-1828364575760043359874405045753782079937615001181388800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (8, 1), (11, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 819 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0819_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0819
        rs_R009_ueqv_R009NYNYN_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYNYN_partial_28_0819 := by
  native_decide

/-- Coefficient term 820 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0820 : Poly :=
[
  term ((-1828364575760043359874405045753782079937615001181388800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (8, 1), (12, 1), (15, 1)]
]

/-- Partial product 820 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0820 : Poly :=
[
  term ((-3656729151520086719748810091507564159875230002362777600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((1828364575760043359874405045753782079937615001181388800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (8, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 820 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0820_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0820
        rs_R009_ueqv_R009NYNYN_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYNYN_partial_28_0820 := by
  native_decide

/-- Coefficient term 821 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0821 : Poly :=
[
  term ((1828364575760043359874405045753782079937615001181388800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (8, 1), (13, 1), (14, 1)]
]

/-- Partial product 821 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0821 : Poly :=
[
  term ((-1828364575760043359874405045753782079937615001181388800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (8, 1), (13, 1), (14, 1)],
  term ((3656729151520086719748810091507564159875230002362777600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (8, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 821 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0821_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0821
        rs_R009_ueqv_R009NYNYN_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYNYN_partial_28_0821 := by
  native_decide

/-- Coefficient term 822 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0822 : Poly :=
[
  term ((-134609926707732859465852643839435876614710807711255859200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (5, 1), (8, 1), (15, 1)]
]

/-- Partial product 822 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0822 : Poly :=
[
  term ((-269219853415465718931705287678871753229421615422511718400 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (5, 1), (8, 1), (14, 1), (15, 1)],
  term ((134609926707732859465852643839435876614710807711255859200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (5, 1), (8, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 822 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0822_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0822
        rs_R009_ueqv_R009NYNYN_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYNYN_partial_28_0822 := by
  native_decide

/-- Coefficient term 823 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0823 : Poly :=
[
  term ((-1828364575760043359874405045753782079937615001181388800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (8, 2), (13, 1)]
]

/-- Partial product 823 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0823 : Poly :=
[
  term ((1828364575760043359874405045753782079937615001181388800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (8, 2), (13, 1)],
  term ((-3656729151520086719748810091507564159875230002362777600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (8, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 823 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0823_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0823
        rs_R009_ueqv_R009NYNYN_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYNYN_partial_28_0823 := by
  native_decide

/-- Coefficient term 824 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0824 : Poly :=
[
  term ((914182287880021679937202522876891039968807500590694400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (8, 2), (15, 1)]
]

/-- Partial product 824 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0824 : Poly :=
[
  term ((1828364575760043359874405045753782079937615001181388800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (8, 2), (14, 1), (15, 1)],
  term ((-914182287880021679937202522876891039968807500590694400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (8, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 824 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0824_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0824
        rs_R009_ueqv_R009NYNYN_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYNYN_partial_28_0824 := by
  native_decide

/-- Coefficient term 825 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0825 : Poly :=
[
  term ((-1980029730329372818407033143028484499032457067419648000 : Rat) / 60114285150280637492040475866445680491505092058198069) [(2, 1), (5, 1), (9, 1)]
]

/-- Partial product 825 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0825 : Poly :=
[
  term ((1980029730329372818407033143028484499032457067419648000 : Rat) / 60114285150280637492040475866445680491505092058198069) [(2, 1), (5, 1), (9, 1)],
  term ((-3960059460658745636814066286056968998064914134839296000 : Rat) / 60114285150280637492040475866445680491505092058198069) [(2, 1), (5, 1), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 825 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0825_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0825
        rs_R009_ueqv_R009NYNYN_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYNYN_partial_28_0825 := by
  native_decide

/-- Coefficient term 826 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0826 : Poly :=
[
  term ((319009101985641798653583152404824433203582851708928000 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (9, 1), (10, 1)]
]

/-- Partial product 826 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0826 : Poly :=
[
  term ((-319009101985641798653583152404824433203582851708928000 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (9, 1), (10, 1)],
  term ((638018203971283597307166304809648866407165703417856000 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (9, 1), (10, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 826 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0826_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0826
        rs_R009_ueqv_R009NYNYN_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYNYN_partial_28_0826 := by
  native_decide

/-- Coefficient term 827 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0827 : Poly :=
[
  term ((1373834818770282198581124524955083325475283813928960000 : Rat) / 718508836796211429071531402022755514446084671743224539) [(2, 1), (5, 1), (9, 1), (10, 1), (12, 1)]
]

/-- Partial product 827 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0827 : Poly :=
[
  term ((-1373834818770282198581124524955083325475283813928960000 : Rat) / 718508836796211429071531402022755514446084671743224539) [(2, 1), (5, 1), (9, 1), (10, 1), (12, 1)],
  term ((2747669637540564397162249049910166650950567627857920000 : Rat) / 718508836796211429071531402022755514446084671743224539) [(2, 1), (5, 1), (9, 1), (10, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 827 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0827_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0827
        rs_R009_ueqv_R009NYNYN_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYNYN_partial_28_0827 := by
  native_decide

/-- Coefficient term 828 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0828 : Poly :=
[
  term ((-686917409385141099290562262477541662737641906964480000 : Rat) / 718508836796211429071531402022755514446084671743224539) [(2, 1), (5, 1), (9, 1), (10, 1), (14, 1)]
]

/-- Partial product 828 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0828 : Poly :=
[
  term ((686917409385141099290562262477541662737641906964480000 : Rat) / 718508836796211429071531402022755514446084671743224539) [(2, 1), (5, 1), (9, 1), (10, 1), (14, 1)],
  term ((-1373834818770282198581124524955083325475283813928960000 : Rat) / 718508836796211429071531402022755514446084671743224539) [(2, 1), (5, 1), (9, 1), (10, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 828 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0828_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0828
        rs_R009_ueqv_R009NYNYN_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYNYN_partial_28_0828 := by
  native_decide

/-- Coefficient term 829 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0829 : Poly :=
[
  term ((-57359078421600334636059860858455189097530050101164851200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (5, 1), (9, 1), (12, 1)]
]

/-- Partial product 829 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0829 : Poly :=
[
  term ((57359078421600334636059860858455189097530050101164851200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (5, 1), (9, 1), (12, 1)],
  term ((-114718156843200669272119721716910378195060100202329702400 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (5, 1), (9, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 829 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0829_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0829
        rs_R009_ueqv_R009NYNYN_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYNYN_partial_28_0829 := by
  native_decide

/-- Coefficient term 830 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0830 : Poly :=
[
  term ((2331483067018177213614679010203434628848959051005542400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (9, 1), (13, 1), (15, 1)]
]

/-- Partial product 830 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0830 : Poly :=
[
  term ((4662966134036354427229358020406869257697918102011084800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((-2331483067018177213614679010203434628848959051005542400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (9, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 830 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0830_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0830
        rs_R009_ueqv_R009NYNYN_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYNYN_partial_28_0830 := by
  native_decide

/-- Coefficient term 831 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0831 : Poly :=
[
  term ((-4662966134036354427229358020406869257697918102011084800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (9, 1), (13, 2)]
]

/-- Partial product 831 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0831 : Poly :=
[
  term ((4662966134036354427229358020406869257697918102011084800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (9, 1), (13, 2)],
  term ((-9325932268072708854458716040813738515395836204022169600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (9, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 831 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0831_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0831
        rs_R009_ueqv_R009NYNYN_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYNYN_partial_28_0831 := by
  native_decide

/-- Coefficient term 832 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0832 : Poly :=
[
  term ((42112965924743720737901856599892210580685679434899148800 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (5, 1), (9, 1), (14, 1)]
]

/-- Partial product 832 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0832 : Poly :=
[
  term ((-42112965924743720737901856599892210580685679434899148800 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (5, 1), (9, 1), (14, 1)],
  term ((84225931849487441475803713199784421161371358869798297600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (5, 1), (9, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 832 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0832_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0832
        rs_R009_ueqv_R009NYNYN_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYNYN_partial_28_0832 := by
  native_decide

/-- Coefficient term 833 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0833 : Poly :=
[
  term ((-683007956721196377608181805976245751046255517408549273600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (5, 1), (10, 1), (12, 1), (13, 1)]
]

/-- Partial product 833 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0833 : Poly :=
[
  term ((683007956721196377608181805976245751046255517408549273600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (5, 1), (10, 1), (12, 1), (13, 1)],
  term ((-1366015913442392755216363611952491502092511034817098547200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (5, 1), (10, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 833 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0833_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0833
        rs_R009_ueqv_R009NYNYN_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYNYN_partial_28_0833 := by
  native_decide

/-- Coefficient term 834 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0834 : Poly :=
[
  term ((11445208307152018749942276720439365358264601698684108800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (10, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 834 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0834 : Poly :=
[
  term ((-11445208307152018749942276720439365358264601698684108800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((22890416614304037499884553440878730716529203397368217600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (10, 1), (12, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 834 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0834_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0834
        rs_R009_ueqv_R009NYNYN_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYNYN_partial_28_0834 := by
  native_decide

/-- Coefficient term 835 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0835 : Poly :=
[
  term ((207084719745086187994781453069339663438870625269228748800 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (5, 1), (10, 1), (12, 1), (15, 1)]
]

/-- Partial product 835 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0835 : Poly :=
[
  term ((414169439490172375989562906138679326877741250538457497600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (5, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-207084719745086187994781453069339663438870625269228748800 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (5, 1), (10, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 835 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0835_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0835
        rs_R009_ueqv_R009NYNYN_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYNYN_partial_28_0835 := by
  native_decide

/-- Coefficient term 836 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0836 : Poly :=
[
  term ((434436064453984288097309813622406552694023759356952576000 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (5, 1), (10, 1), (12, 2), (13, 1)]
]

/-- Partial product 836 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0836 : Poly :=
[
  term ((-434436064453984288097309813622406552694023759356952576000 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (5, 1), (10, 1), (12, 2), (13, 1)],
  term ((868872128907968576194619627244813105388047518713905152000 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (5, 1), (10, 1), (12, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 836 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0836_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0836
        rs_R009_ueqv_R009NYNYN_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYNYN_partial_28_0836 := by
  native_decide

/-- Coefficient term 837 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0837 : Poly :=
[
  term ((-251553657148448200298481736972521372421805684774528614400 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (5, 1), (10, 1), (12, 2), (15, 1)]
]

/-- Partial product 837 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0837 : Poly :=
[
  term ((-503107314296896400596963473945042744843611369549057228800 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (5, 1), (10, 1), (12, 2), (14, 1), (15, 1)],
  term ((251553657148448200298481736972521372421805684774528614400 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (5, 1), (10, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 837 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0837_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0837
        rs_R009_ueqv_R009NYNYN_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYNYN_partial_28_0837 := by
  native_decide

/-- Coefficient term 838 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0838 : Poly :=
[
  term ((75187573479920037454437825767160433138680942243776512000 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (10, 1), (13, 1)]
]

/-- Partial product 838 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0838 : Poly :=
[
  term ((-75187573479920037454437825767160433138680942243776512000 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (10, 1), (13, 1)],
  term ((150375146959840074908875651534320866277361884487553024000 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (10, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 838 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0838_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0838
        rs_R009_ueqv_R009NYNYN_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYNYN_partial_28_0838 := by
  native_decide

/-- Coefficient term 839 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0839 : Poly :=
[
  term ((-3775484364668026367422771702986732379534957925261721600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (10, 1), (13, 1), (14, 1)]
]

/-- Partial product 839 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0839 : Poly :=
[
  term ((3775484364668026367422771702986732379534957925261721600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (10, 1), (13, 1), (14, 1)],
  term ((-7550968729336052734845543405973464759069915850523443200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (10, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 839 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0839_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0839
        rs_R009_ueqv_R009NYNYN_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYNYN_partial_28_0839 := by
  native_decide

/-- Coefficient term 840 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0840 : Poly :=
[
  term ((6407542309408684813467134595839238204875613957591552000 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (10, 1), (15, 1)]
]

/-- Partial product 840 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0840 : Poly :=
[
  term ((12815084618817369626934269191678476409751227915183104000 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (10, 1), (14, 1), (15, 1)],
  term ((-6407542309408684813467134595839238204875613957591552000 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 840 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0840_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0840
        rs_R009_ueqv_R009NYNYN_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYNYN_partial_28_0840 := by
  native_decide

/-- Coefficient term 841 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0841 : Poly :=
[
  term ((304795635923114254074095934923726633632103144583987968000 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (5, 1), (11, 1)]
]

/-- Partial product 841 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0841 : Poly :=
[
  term ((-304795635923114254074095934923726633632103144583987968000 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (5, 1), (11, 1)],
  term ((609591271846228508148191869847453267264206289167975936000 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (5, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 841 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0841_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0841
        rs_R009_ueqv_R009NYNYN_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYNYN_partial_28_0841 := by
  native_decide

/-- Coefficient term 842 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0842 : Poly :=
[
  term ((1360911457339477001628369878999997372159372245848780800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (11, 1), (12, 1)]
]

/-- Partial product 842 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0842 : Poly :=
[
  term ((-1360911457339477001628369878999997372159372245848780800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (11, 1), (12, 1)],
  term ((2721822914678954003256739757999994744318744491697561600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (11, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 842 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0842_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0842
        rs_R009_ueqv_R009NYNYN_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYNYN_partial_28_0842 := by
  native_decide

/-- Coefficient term 843 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0843 : Poly :=
[
  term ((1072988278795501757807088442541190502337306409251635200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 843 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0843 : Poly :=
[
  term ((2145976557591003515614176885082381004674612818503270400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-1072988278795501757807088442541190502337306409251635200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 843 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0843_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0843
        rs_R009_ueqv_R009NYNYN_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYNYN_partial_28_0843 := by
  native_decide

/-- Coefficient term 844 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0844 : Poly :=
[
  term ((-2145976557591003515614176885082381004674612818503270400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (11, 1), (13, 2)]
]

/-- Partial product 844 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0844 : Poly :=
[
  term ((2145976557591003515614176885082381004674612818503270400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (11, 1), (13, 2)],
  term ((-4291953115182007031228353770164762009349225637006540800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (11, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 844 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0844_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0844
        rs_R009_ueqv_R009NYNYN_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYNYN_partial_28_0844 := by
  native_decide

/-- Coefficient term 845 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0845 : Poly :=
[
  term ((34171230449921849600301698989348894578558966049843200 : Rat) / 102644119542315918438790200288965073492297810249032077) [(2, 1), (5, 1), (11, 1), (14, 1)]
]

/-- Partial product 845 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0845 : Poly :=
[
  term ((-34171230449921849600301698989348894578558966049843200 : Rat) / 102644119542315918438790200288965073492297810249032077) [(2, 1), (5, 1), (11, 1), (14, 1)],
  term ((68342460899843699200603397978697789157117932099686400 : Rat) / 102644119542315918438790200288965073492297810249032077) [(2, 1), (5, 1), (11, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 845 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0845_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0845
        rs_R009_ueqv_R009NYNYN_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYNYN_partial_28_0845 := by
  native_decide

/-- Coefficient term 846 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0846 : Poly :=
[
  term ((11727717101772098029055850614328268739525357966184743526400 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(2, 1), (5, 1), (12, 1), (13, 1)]
]

/-- Partial product 846 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0846 : Poly :=
[
  term ((-11727717101772098029055850614328268739525357966184743526400 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(2, 1), (5, 1), (12, 1), (13, 1)],
  term ((23455434203544196058111701228656537479050715932369487052800 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(2, 1), (5, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 846 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0846_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0846
        rs_R009_ueqv_R009NYNYN_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYNYN_partial_28_0846 := by
  native_decide

/-- Coefficient term 847 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0847 : Poly :=
[
  term ((-9085549983681095070899069563198716308672844454206464000 : Rat) / 2155526510388634287214594206068266543338254015229673617) [(2, 1), (5, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 847 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0847 : Poly :=
[
  term ((9085549983681095070899069563198716308672844454206464000 : Rat) / 2155526510388634287214594206068266543338254015229673617) [(2, 1), (5, 1), (12, 1), (13, 1), (14, 1)],
  term ((-18171099967362190141798139126397432617345688908412928000 : Rat) / 2155526510388634287214594206068266543338254015229673617) [(2, 1), (5, 1), (12, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 847 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0847_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0847
        rs_R009_ueqv_R009NYNYN_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYNYN_partial_28_0847 := by
  native_decide

/-- Coefficient term 848 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0848 : Poly :=
[
  term ((-550452145920884203636360245187130428254541356504848384000 : Rat) / 6466579531165902861643782618204799630014762045689020851) [(2, 1), (5, 1), (12, 1), (15, 1)]
]

/-- Partial product 848 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0848 : Poly :=
[
  term ((-1100904291841768407272720490374260856509082713009696768000 : Rat) / 6466579531165902861643782618204799630014762045689020851) [(2, 1), (5, 1), (12, 1), (14, 1), (15, 1)],
  term ((550452145920884203636360245187130428254541356504848384000 : Rat) / 6466579531165902861643782618204799630014762045689020851) [(2, 1), (5, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 848 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0848_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0848
        rs_R009_ueqv_R009NYNYN_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYNYN_partial_28_0848 := by
  native_decide

/-- Coefficient term 849 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0849 : Poly :=
[
  term ((-5775833655291516257963508382138832204204487001136084992000 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(2, 1), (5, 1), (12, 2), (13, 1)]
]

/-- Partial product 849 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0849 : Poly :=
[
  term ((5775833655291516257963508382138832204204487001136084992000 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(2, 1), (5, 1), (12, 2), (13, 1)],
  term ((-11551667310583032515927016764277664408408974002272169984000 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(2, 1), (5, 1), (12, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 849 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0849_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0849
        rs_R009_ueqv_R009NYNYN_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYNYN_partial_28_0849 := by
  native_decide

/-- Coefficient term 850 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0850 : Poly :=
[
  term ((3078713377303061125470634651896589144584373234106378240000 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(2, 1), (5, 1), (12, 2), (15, 1)]
]

/-- Partial product 850 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0850 : Poly :=
[
  term ((6157426754606122250941269303793178289168746468212756480000 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(2, 1), (5, 1), (12, 2), (14, 1), (15, 1)],
  term ((-3078713377303061125470634651896589144584373234106378240000 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(2, 1), (5, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 850 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0850_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0850
        rs_R009_ueqv_R009NYNYN_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYNYN_partial_28_0850 := by
  native_decide

/-- Coefficient term 851 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0851 : Poly :=
[
  term ((-670331807939983460248787661807147477978459134579633561600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (13, 1)]
]

/-- Partial product 851 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0851 : Poly :=
[
  term ((670331807939983460248787661807147477978459134579633561600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (13, 1)],
  term ((-1340663615879966920497575323614294955956918269159267123200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 851 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0851_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0851
        rs_R009_ueqv_R009NYNYN_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYNYN_partial_28_0851 := by
  native_decide

/-- Coefficient term 852 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0852 : Poly :=
[
  term ((-298518006383644369251017227286850309027002347365580800 : Rat) / 718508836796211429071531402022755514446084671743224539) [(2, 1), (5, 1), (13, 1), (14, 1)]
]

/-- Partial product 852 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0852 : Poly :=
[
  term ((298518006383644369251017227286850309027002347365580800 : Rat) / 718508836796211429071531402022755514446084671743224539) [(2, 1), (5, 1), (13, 1), (14, 1)],
  term ((-597036012767288738502034454573700618054004694731161600 : Rat) / 718508836796211429071531402022755514446084671743224539) [(2, 1), (5, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 852 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0852_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0852
        rs_R009_ueqv_R009NYNYN_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYNYN_partial_28_0852 := by
  native_decide

/-- Coefficient term 853 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0853 : Poly :=
[
  term ((-5390438836800448772212498676347068041201708923821772800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (13, 1), (15, 2)]
]

/-- Partial product 853 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0853 : Poly :=
[
  term ((-10780877673600897544424997352694136082403417847643545600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (13, 1), (14, 1), (15, 2)],
  term ((5390438836800448772212498676347068041201708923821772800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 853 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0853_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0853
        rs_R009_ueqv_R009NYNYN_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYNYN_partial_28_0853 := by
  native_decide

/-- Coefficient term 854 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0854 : Poly :=
[
  term ((10780877673600897544424997352694136082403417847643545600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (13, 2), (15, 1)]
]

/-- Partial product 854 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0854 : Poly :=
[
  term ((21561755347201795088849994705388272164806835695287091200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (13, 2), (14, 1), (15, 1)],
  term ((-10780877673600897544424997352694136082403417847643545600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 854 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0854_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0854
        rs_R009_ueqv_R009NYNYN_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYNYN_partial_28_0854 := by
  native_decide

/-- Coefficient term 855 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0855 : Poly :=
[
  term ((55027653567921935824233257319629930531533865426592102400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (15, 1)]
]

/-- Partial product 855 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0855 : Poly :=
[
  term ((110055307135843871648466514639259861063067730853184204800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (14, 1), (15, 1)],
  term ((-55027653567921935824233257319629930531533865426592102400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 855 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0855_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0855
        rs_R009_ueqv_R009NYNYN_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYNYN_partial_28_0855 := by
  native_decide

/-- Coefficient term 856 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0856 : Poly :=
[
  term ((3656729151520086719748810091507564159875230002362777600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 2)]
]

/-- Partial product 856 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0856 : Poly :=
[
  term ((-3656729151520086719748810091507564159875230002362777600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 2)],
  term ((7313458303040173439497620183015128319750460004725555200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 856 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0856_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0856
        rs_R009_ueqv_R009NYNYN_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYNYN_partial_28_0856 := by
  native_decide

/-- Coefficient term 857 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0857 : Poly :=
[
  term ((3656729151520086719748810091507564159875230002362777600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 2), (8, 1)]
]

/-- Partial product 857 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0857 : Poly :=
[
  term ((-3656729151520086719748810091507564159875230002362777600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 2), (8, 1)],
  term ((7313458303040173439497620183015128319750460004725555200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 2), (8, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 857 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0857_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0857
        rs_R009_ueqv_R009NYNYN_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYNYN_partial_28_0857 := by
  native_decide

/-- Coefficient term 858 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0858 : Poly :=
[
  term ((-1213314066154711565255101131463026045200718591103872080589809824713011105665163 : Rat) / 2560470585202358470222034126504751518891640359243960498917734197952201216000) [(2, 1), (6, 1)]
]

/-- Partial product 858 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0858 : Poly :=
[
  term ((1213314066154711565255101131463026045200718591103872080589809824713011105665163 : Rat) / 2560470585202358470222034126504751518891640359243960498917734197952201216000) [(2, 1), (6, 1)],
  term ((-1213314066154711565255101131463026045200718591103872080589809824713011105665163 : Rat) / 1280235292601179235111017063252375759445820179621980249458867098976100608000) [(2, 1), (6, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 858 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0858_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0858
        rs_R009_ueqv_R009NYNYN_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYNYN_partial_28_0858 := by
  native_decide

/-- Coefficient term 859 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0859 : Poly :=
[
  term ((1213314066154711565255101131463026045200718591103872080589809824713011105665163 : Rat) / 3840705877803537705333051189757127278337460538865940748376601296928301824000) [(2, 1), (6, 1), (14, 1)]
]

/-- Partial product 859 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0859 : Poly :=
[
  term ((-1213314066154711565255101131463026045200718591103872080589809824713011105665163 : Rat) / 3840705877803537705333051189757127278337460538865940748376601296928301824000) [(2, 1), (6, 1), (14, 1)],
  term ((1213314066154711565255101131463026045200718591103872080589809824713011105665163 : Rat) / 1920352938901768852666525594878563639168730269432970374188300648464150912000) [(2, 1), (6, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 859 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0859_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0859
        rs_R009_ueqv_R009NYNYN_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYNYN_partial_28_0859 := by
  native_decide

/-- Coefficient term 860 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0860 : Poly :=
[
  term ((463412421976306611511 : Rat) / 64098215129500397370) [(2, 1), (6, 1), (14, 1), (16, 1)]
]

/-- Partial product 860 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0860 : Poly :=
[
  term ((-463412421976306611511 : Rat) / 64098215129500397370) [(2, 1), (6, 1), (14, 1), (16, 1)],
  term ((463412421976306611511 : Rat) / 32049107564750198685) [(2, 1), (6, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 860 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0860_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0860
        rs_R009_ueqv_R009NYNYN_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYNYN_partial_28_0860 := by
  native_decide

/-- Coefficient term 861 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0861 : Poly :=
[
  term ((-463412421976306611511 : Rat) / 42732143419666931580) [(2, 1), (6, 1), (16, 1)]
]

/-- Partial product 861 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0861 : Poly :=
[
  term ((-463412421976306611511 : Rat) / 21366071709833465790) [(2, 1), (6, 1), (14, 1), (16, 1)],
  term ((463412421976306611511 : Rat) / 42732143419666931580) [(2, 1), (6, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 861 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0861_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0861
        rs_R009_ueqv_R009NYNYN_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYNYN_partial_28_0861 := by
  native_decide

/-- Coefficient term 862 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0862 : Poly :=
[
  term ((3149149553489948 : Rat) / 449528123497443) [(2, 1), (7, 1), (9, 1)]
]

/-- Partial product 862 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0862 : Poly :=
[
  term ((-3149149553489948 : Rat) / 449528123497443) [(2, 1), (7, 1), (9, 1)],
  term ((6298299106979896 : Rat) / 449528123497443) [(2, 1), (7, 1), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 862 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0862_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0862
        rs_R009_ueqv_R009NYNYN_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYNYN_partial_28_0862 := by
  native_decide

/-- Coefficient term 863 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0863 : Poly :=
[
  term ((-50386392855839168 : Rat) / 3146696864482101) [(2, 1), (7, 1), (12, 1), (13, 1)]
]

/-- Partial product 863 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0863 : Poly :=
[
  term ((50386392855839168 : Rat) / 3146696864482101) [(2, 1), (7, 1), (12, 1), (13, 1)],
  term ((-100772785711678336 : Rat) / 3146696864482101) [(2, 1), (7, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 863 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0863_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0863
        rs_R009_ueqv_R009NYNYN_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYNYN_partial_28_0863 := by
  native_decide

/-- Coefficient term 864 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0864 : Poly :=
[
  term ((12596598213959792 : Rat) / 1048898954827367) [(2, 1), (7, 1), (12, 1), (15, 1)]
]

/-- Partial product 864 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0864 : Poly :=
[
  term ((25193196427919584 : Rat) / 1048898954827367) [(2, 1), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((-12596598213959792 : Rat) / 1048898954827367) [(2, 1), (7, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 864 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0864_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0864
        rs_R009_ueqv_R009NYNYN_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYNYN_partial_28_0864 := by
  native_decide

/-- Coefficient term 865 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0865 : Poly :=
[
  term ((12596598213959792 : Rat) / 3146696864482101) [(2, 1), (7, 1), (13, 1)]
]

/-- Partial product 865 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0865 : Poly :=
[
  term ((-12596598213959792 : Rat) / 3146696864482101) [(2, 1), (7, 1), (13, 1)],
  term ((25193196427919584 : Rat) / 3146696864482101) [(2, 1), (7, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 865 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0865_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0865
        rs_R009_ueqv_R009NYNYN_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYNYN_partial_28_0865 := by
  native_decide

/-- Coefficient term 866 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0866 : Poly :=
[
  term ((-12596598213959792 : Rat) / 3146696864482101) [(2, 1), (7, 1), (13, 1), (14, 1)]
]

/-- Partial product 866 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0866 : Poly :=
[
  term ((12596598213959792 : Rat) / 3146696864482101) [(2, 1), (7, 1), (13, 1), (14, 1)],
  term ((-25193196427919584 : Rat) / 3146696864482101) [(2, 1), (7, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 866 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0866_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0866
        rs_R009_ueqv_R009NYNYN_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYNYN_partial_28_0866 := by
  native_decide

/-- Coefficient term 867 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0867 : Poly :=
[
  term ((-12596598213959792 : Rat) / 3146696864482101) [(2, 1), (7, 1), (15, 1)]
]

/-- Partial product 867 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0867 : Poly :=
[
  term ((-25193196427919584 : Rat) / 3146696864482101) [(2, 1), (7, 1), (14, 1), (15, 1)],
  term ((12596598213959792 : Rat) / 3146696864482101) [(2, 1), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 867 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0867_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0867
        rs_R009_ueqv_R009NYNYN_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYNYN_partial_28_0867 := by
  native_decide

/-- Coefficient term 868 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0868 : Poly :=
[
  term ((5828157549217728287664936767648656578989727782302097422119185971941801824563273 : Rat) / 65291999922660140990661870225871163731736829160720992722402222047781131008000) [(2, 1), (8, 1)]
]

/-- Partial product 868 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0868 : Poly :=
[
  term ((-5828157549217728287664936767648656578989727782302097422119185971941801824563273 : Rat) / 65291999922660140990661870225871163731736829160720992722402222047781131008000) [(2, 1), (8, 1)],
  term ((5828157549217728287664936767648656578989727782302097422119185971941801824563273 : Rat) / 32645999961330070495330935112935581865868414580360496361201111023890565504000) [(2, 1), (8, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 868 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0868_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0868
        rs_R009_ueqv_R009NYNYN_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYNYN_partial_28_0868 := by
  native_decide

/-- Coefficient term 869 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0869 : Poly :=
[
  term ((-97022232964002980125785630293438087957294054656000 : Rat) / 4063562337142509348624007334568541033400269394457) [(2, 1), (8, 1), (9, 1), (11, 1)]
]

/-- Partial product 869 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0869 : Poly :=
[
  term ((97022232964002980125785630293438087957294054656000 : Rat) / 4063562337142509348624007334568541033400269394457) [(2, 1), (8, 1), (9, 1), (11, 1)],
  term ((-194044465928005960251571260586876175914588109312000 : Rat) / 4063562337142509348624007334568541033400269394457) [(2, 1), (8, 1), (9, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 869 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0869_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0869
        rs_R009_ueqv_R009NYNYN_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYNYN_partial_28_0869 := by
  native_decide

/-- Coefficient term 870 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0870 : Poly :=
[
  term ((38808893185601192050314252117375235182917621862400 : Rat) / 4063562337142509348624007334568541033400269394457) [(2, 1), (8, 1), (9, 1), (11, 1), (12, 1)]
]

/-- Partial product 870 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0870 : Poly :=
[
  term ((-38808893185601192050314252117375235182917621862400 : Rat) / 4063562337142509348624007334568541033400269394457) [(2, 1), (8, 1), (9, 1), (11, 1), (12, 1)],
  term ((77617786371202384100628504234750470365835243724800 : Rat) / 4063562337142509348624007334568541033400269394457) [(2, 1), (8, 1), (9, 1), (11, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 870 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0870_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0870
        rs_R009_ueqv_R009NYNYN_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYNYN_partial_28_0870 := by
  native_decide

/-- Coefficient term 871 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0871 : Poly :=
[
  term ((-19404446592800596025157126058687617591458810931200 : Rat) / 4063562337142509348624007334568541033400269394457) [(2, 1), (8, 1), (9, 1), (11, 1), (14, 1)]
]

/-- Partial product 871 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0871 : Poly :=
[
  term ((19404446592800596025157126058687617591458810931200 : Rat) / 4063562337142509348624007334568541033400269394457) [(2, 1), (8, 1), (9, 1), (11, 1), (14, 1)],
  term ((-38808893185601192050314252117375235182917621862400 : Rat) / 4063562337142509348624007334568541033400269394457) [(2, 1), (8, 1), (9, 1), (11, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 871 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0871_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0871
        rs_R009_ueqv_R009NYNYN_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYNYN_partial_28_0871 := by
  native_decide

/-- Coefficient term 872 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0872 : Poly :=
[
  term ((-352683508445203406137727288943253672795148 : Rat) / 9891793743911987042053217044091449821375) [(2, 1), (8, 1), (9, 1), (12, 1), (13, 1)]
]

/-- Partial product 872 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0872 : Poly :=
[
  term ((352683508445203406137727288943253672795148 : Rat) / 9891793743911987042053217044091449821375) [(2, 1), (8, 1), (9, 1), (12, 1), (13, 1)],
  term ((-705367016890406812275454577886507345590296 : Rat) / 9891793743911987042053217044091449821375) [(2, 1), (8, 1), (9, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 872 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0872_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0872
        rs_R009_ueqv_R009NYNYN_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYNYN_partial_28_0872 := by
  native_decide

/-- Coefficient term 873 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0873 : Poly :=
[
  term ((1200052718647521464256 : Rat) / 4339258264657398321155) [(2, 1), (8, 1), (9, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 873 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0873 : Poly :=
[
  term ((2400105437295042928512 : Rat) / 4339258264657398321155) [(2, 1), (8, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1200052718647521464256 : Rat) / 4339258264657398321155) [(2, 1), (8, 1), (9, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 873 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0873_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0873
        rs_R009_ueqv_R009NYNYN_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYNYN_partial_28_0873 := by
  native_decide

/-- Coefficient term 874 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0874 : Poly :=
[
  term ((139214338607893003043759982633245394194001527992503649141195413486906626 : Rat) / 10316113332786535598644818303893315614873123421785032037250850112591125) [(2, 1), (8, 1), (9, 1), (12, 1), (15, 1)]
]

/-- Partial product 874 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0874 : Poly :=
[
  term ((278428677215786006087519965266490788388003055985007298282390826973813252 : Rat) / 10316113332786535598644818303893315614873123421785032037250850112591125) [(2, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-139214338607893003043759982633245394194001527992503649141195413486906626 : Rat) / 10316113332786535598644818303893315614873123421785032037250850112591125) [(2, 1), (8, 1), (9, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 874 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0874_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0874
        rs_R009_ueqv_R009NYNYN_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYNYN_partial_28_0874 := by
  native_decide

/-- Coefficient term 875 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0875 : Poly :=
[
  term ((-600026359323760732128 : Rat) / 4339258264657398321155) [(2, 1), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 875 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0875 : Poly :=
[
  term ((-1200052718647521464256 : Rat) / 4339258264657398321155) [(2, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((600026359323760732128 : Rat) / 4339258264657398321155) [(2, 1), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 875 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0875_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0875
        rs_R009_ueqv_R009NYNYN_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYNYN_partial_28_0875 := by
  native_decide

/-- Coefficient term 876 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0876 : Poly :=
[
  term ((632629282699164045662745885820006053375683215348160647446855681631624902301145581 : Rat) / 986381531040197597770353067334834570798512457818003657821474980039069773008000) [(2, 1), (8, 1), (9, 1), (13, 1)]
]

/-- Partial product 876 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0876 : Poly :=
[
  term ((-632629282699164045662745885820006053375683215348160647446855681631624902301145581 : Rat) / 986381531040197597770353067334834570798512457818003657821474980039069773008000) [(2, 1), (8, 1), (9, 1), (13, 1)],
  term ((632629282699164045662745885820006053375683215348160647446855681631624902301145581 : Rat) / 493190765520098798885176533667417285399256228909001828910737490019534886504000) [(2, 1), (8, 1), (9, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 876 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0876_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0876
        rs_R009_ueqv_R009NYNYN_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYNYN_partial_28_0876 := by
  native_decide

/-- Coefficient term 877 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0877 : Poly :=
[
  term ((2080534172269871381044888 : Rat) / 252544831003060582291221) [(2, 1), (8, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 877 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0877 : Poly :=
[
  term ((4161068344539742762089776 : Rat) / 252544831003060582291221) [(2, 1), (8, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2080534172269871381044888 : Rat) / 252544831003060582291221) [(2, 1), (8, 1), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 877 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0877_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0877
        rs_R009_ueqv_R009NYNYN_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYNYN_partial_28_0877 := by
  native_decide

/-- Coefficient term 878 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0878 : Poly :=
[
  term ((32683840809690498313781354962698371314938465274344857600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (8, 1), (9, 1), (14, 1), (15, 1)]
]

/-- Partial product 878 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0878 : Poly :=
[
  term ((-32683840809690498313781354962698371314938465274344857600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (8, 1), (9, 1), (14, 1), (15, 1)],
  term ((65367681619380996627562709925396742629876930548689715200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (8, 1), (9, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 878 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0878_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0878
        rs_R009_ueqv_R009NYNYN_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYNYN_partial_28_0878 := by
  native_decide

/-- Coefficient term 879 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0879 : Poly :=
[
  term ((-115890829510782593303300048497065327649856336670401545817120568022787324723687609 : Rat) / 394552612416079039108141226933933828319404983127201463128589992015627909203200) [(2, 1), (8, 1), (9, 1), (15, 1)]
]

/-- Partial product 879 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0879 : Poly :=
[
  term ((-115890829510782593303300048497065327649856336670401545817120568022787324723687609 : Rat) / 197276306208039519554070613466966914159702491563600731564294996007813954601600) [(2, 1), (8, 1), (9, 1), (14, 1), (15, 1)],
  term ((115890829510782593303300048497065327649856336670401545817120568022787324723687609 : Rat) / 394552612416079039108141226933933828319404983127201463128589992015627909203200) [(2, 1), (8, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 879 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0879_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0879
        rs_R009_ueqv_R009NYNYN_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYNYN_partial_28_0879 := by
  native_decide

/-- Coefficient term 880 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0880 : Poly :=
[
  term ((-5359262971668289248307849 : Rat) / 1262724155015302911456105) [(2, 1), (8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 880 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0880 : Poly :=
[
  term ((-10718525943336578496615698 : Rat) / 1262724155015302911456105) [(2, 1), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((5359262971668289248307849 : Rat) / 1262724155015302911456105) [(2, 1), (8, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 880 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0880_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0880
        rs_R009_ueqv_R009NYNYN_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYNYN_partial_28_0880 := by
  native_decide

/-- Coefficient term 881 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0881 : Poly :=
[
  term ((-10536140660316550661170003642481812917306936852421720951181199776 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(2, 1), (8, 1), (11, 1), (12, 1), (13, 1)]
]

/-- Partial product 881 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0881 : Poly :=
[
  term ((10536140660316550661170003642481812917306936852421720951181199776 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(2, 1), (8, 1), (11, 1), (12, 1), (13, 1)],
  term ((-21072281320633101322340007284963625834613873704843441902362399552 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(2, 1), (8, 1), (11, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 881 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0881_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0881
        rs_R009_ueqv_R009NYNYN_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYNYN_partial_28_0881 := by
  native_decide

/-- Coefficient term 882 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0882 : Poly :=
[
  term ((-907046216217659535616 : Rat) / 619894037808199760165) [(2, 1), (8, 1), (11, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 882 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0882 : Poly :=
[
  term ((-1814092432435319071232 : Rat) / 619894037808199760165) [(2, 1), (8, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((907046216217659535616 : Rat) / 619894037808199760165) [(2, 1), (8, 1), (11, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 882 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0882_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0882
        rs_R009_ueqv_R009NYNYN_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYNYN_partial_28_0882 := by
  native_decide

/-- Coefficient term 883 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0883 : Poly :=
[
  term ((3648399356509873928454840733559674413796835657878584112313522806325296 : Rat) / 1146234814754059510960535367099257290541458157976114670805650012510125) [(2, 1), (8, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 883 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0883 : Poly :=
[
  term ((7296798713019747856909681467119348827593671315757168224627045612650592 : Rat) / 1146234814754059510960535367099257290541458157976114670805650012510125) [(2, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-3648399356509873928454840733559674413796835657878584112313522806325296 : Rat) / 1146234814754059510960535367099257290541458157976114670805650012510125) [(2, 1), (8, 1), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 883 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0883_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0883
        rs_R009_ueqv_R009NYNYN_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYNYN_partial_28_0883 := by
  native_decide

/-- Coefficient term 884 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0884 : Poly :=
[
  term ((453523108108829767808 : Rat) / 619894037808199760165) [(2, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 884 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0884 : Poly :=
[
  term ((907046216217659535616 : Rat) / 619894037808199760165) [(2, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-453523108108829767808 : Rat) / 619894037808199760165) [(2, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 884 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0884_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0884
        rs_R009_ueqv_R009NYNYN_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYNYN_partial_28_0884 := by
  native_decide

/-- Coefficient term 885 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0885 : Poly :=
[
  term ((-349783075650328787836963098045968762441985595003223168987060757151540001739960301 : Rat) / 986381531040197597770353067334834570798512457818003657821474980039069773008000) [(2, 1), (8, 1), (11, 1), (13, 1)]
]

/-- Partial product 885 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0885 : Poly :=
[
  term ((349783075650328787836963098045968762441985595003223168987060757151540001739960301 : Rat) / 986381531040197597770353067334834570798512457818003657821474980039069773008000) [(2, 1), (8, 1), (11, 1), (13, 1)],
  term ((-349783075650328787836963098045968762441985595003223168987060757151540001739960301 : Rat) / 493190765520098798885176533667417285399256228909001828910737490019534886504000) [(2, 1), (8, 1), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 885 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0885_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0885
        rs_R009_ueqv_R009NYNYN_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYNYN_partial_28_0885 := by
  native_decide

/-- Coefficient term 886 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0886 : Poly :=
[
  term ((38808893185601192050314252117375235182917621862400 : Rat) / 4063562337142509348624007334568541033400269394457) [(2, 1), (8, 1), (11, 1), (13, 1), (14, 1)]
]

/-- Partial product 886 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0886 : Poly :=
[
  term ((-38808893185601192050314252117375235182917621862400 : Rat) / 4063562337142509348624007334568541033400269394457) [(2, 1), (8, 1), (11, 1), (13, 1), (14, 1)],
  term ((77617786371202384100628504234750470365835243724800 : Rat) / 4063562337142509348624007334568541033400269394457) [(2, 1), (8, 1), (11, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 886 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0886_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0886
        rs_R009_ueqv_R009NYNYN_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYNYN_partial_28_0886 := by
  native_decide

/-- Coefficient term 887 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0887 : Poly :=
[
  term ((-8904233060040413177273144 : Rat) / 1262724155015302911456105) [(2, 1), (8, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 887 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0887 : Poly :=
[
  term ((-17808466120080826354546288 : Rat) / 1262724155015302911456105) [(2, 1), (8, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((8904233060040413177273144 : Rat) / 1262724155015302911456105) [(2, 1), (8, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 887 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0887_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0887
        rs_R009_ueqv_R009NYNYN_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYNYN_partial_28_0887 := by
  native_decide

/-- Coefficient term 888 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0888 : Poly :=
[
  term ((32683840809690498313781354962698371314938465274344857600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (8, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 888 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0888 : Poly :=
[
  term ((-32683840809690498313781354962698371314938465274344857600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((65367681619380996627562709925396742629876930548689715200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (8, 1), (11, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 888 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0888_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0888
        rs_R009_ueqv_R009NYNYN_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYNYN_partial_28_0888 := by
  native_decide

/-- Coefficient term 889 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0889 : Poly :=
[
  term ((-103177464415574838861211281618697458438956101631062734983064266254180901 : Rat) / 2292469629508119021921070734198514581082916315952229341611300025020250) [(2, 1), (8, 1), (11, 1), (15, 1)]
]

/-- Partial product 889 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0889 : Poly :=
[
  term ((-103177464415574838861211281618697458438956101631062734983064266254180901 : Rat) / 1146234814754059510960535367099257290541458157976114670805650012510125) [(2, 1), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((103177464415574838861211281618697458438956101631062734983064266254180901 : Rat) / 2292469629508119021921070734198514581082916315952229341611300025020250) [(2, 1), (8, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 889 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0889_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0889
        rs_R009_ueqv_R009NYNYN_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYNYN_partial_28_0889 := by
  native_decide

/-- Coefficient term 890 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0890 : Poly :=
[
  term ((-6189242252697572132 : Rat) / 88556291115457108595) [(2, 1), (8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 890 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0890 : Poly :=
[
  term ((-12378484505395144264 : Rat) / 88556291115457108595) [(2, 1), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((6189242252697572132 : Rat) / 88556291115457108595) [(2, 1), (8, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 890 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0890_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0890
        rs_R009_ueqv_R009NYNYN_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYNYN_partial_28_0890 := by
  native_decide

/-- Coefficient term 891 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0891 : Poly :=
[
  term ((-155235572742404768201257008469500940731670487449600 : Rat) / 4063562337142509348624007334568541033400269394457) [(2, 1), (8, 1), (11, 2)]
]

/-- Partial product 891 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0891 : Poly :=
[
  term ((155235572742404768201257008469500940731670487449600 : Rat) / 4063562337142509348624007334568541033400269394457) [(2, 1), (8, 1), (11, 2)],
  term ((-310471145484809536402514016939001881463340974899200 : Rat) / 4063562337142509348624007334568541033400269394457) [(2, 1), (8, 1), (11, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 891 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0891_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0891
        rs_R009_ueqv_R009NYNYN_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYNYN_partial_28_0891 := by
  native_decide

/-- Coefficient term 892 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0892 : Poly :=
[
  term ((38808893185601192050314252117375235182917621862400 : Rat) / 4063562337142509348624007334568541033400269394457) [(2, 1), (8, 1), (11, 2), (12, 1)]
]

/-- Partial product 892 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0892 : Poly :=
[
  term ((-38808893185601192050314252117375235182917621862400 : Rat) / 4063562337142509348624007334568541033400269394457) [(2, 1), (8, 1), (11, 2), (12, 1)],
  term ((77617786371202384100628504234750470365835243724800 : Rat) / 4063562337142509348624007334568541033400269394457) [(2, 1), (8, 1), (11, 2), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 892 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0892_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0892
        rs_R009_ueqv_R009NYNYN_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYNYN_partial_28_0892 := by
  native_decide

/-- Coefficient term 893 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0893 : Poly :=
[
  term ((-19404446592800596025157126058687617591458810931200 : Rat) / 4063562337142509348624007334568541033400269394457) [(2, 1), (8, 1), (11, 2), (14, 1)]
]

/-- Partial product 893 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0893 : Poly :=
[
  term ((19404446592800596025157126058687617591458810931200 : Rat) / 4063562337142509348624007334568541033400269394457) [(2, 1), (8, 1), (11, 2), (14, 1)],
  term ((-38808893185601192050314252117375235182917621862400 : Rat) / 4063562337142509348624007334568541033400269394457) [(2, 1), (8, 1), (11, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 893 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0893_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0893
        rs_R009_ueqv_R009NYNYN_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYNYN_partial_28_0893 := by
  native_decide

/-- Coefficient term 894 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0894 : Poly :=
[
  term ((-1756582159228378444676214281082708233629688669211591703515025644031969817279 : Rat) / 8345092014654925995738991593286191683504195956124871257975744126761392000) [(2, 1), (8, 1), (12, 1)]
]

/-- Partial product 894 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0894 : Poly :=
[
  term ((1756582159228378444676214281082708233629688669211591703515025644031969817279 : Rat) / 8345092014654925995738991593286191683504195956124871257975744126761392000) [(2, 1), (8, 1), (12, 1)],
  term ((-1756582159228378444676214281082708233629688669211591703515025644031969817279 : Rat) / 4172546007327462997869495796643095841752097978062435628987872063380696000) [(2, 1), (8, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 894 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0894_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0894
        rs_R009_ueqv_R009NYNYN_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYNYN_partial_28_0894 := by
  native_decide

/-- Coefficient term 895 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0895 : Poly :=
[
  term ((-5798558816270715340785350733061482116143205411549478387599060498 : Rat) / 333390229939667209106775482079636567325082553683743242485485305) [(2, 1), (8, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 895 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0895 : Poly :=
[
  term ((-11597117632541430681570701466122964232286410823098956775198120996 : Rat) / 333390229939667209106775482079636567325082553683743242485485305) [(2, 1), (8, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((5798558816270715340785350733061482116143205411549478387599060498 : Rat) / 333390229939667209106775482079636567325082553683743242485485305) [(2, 1), (8, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 895 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0895_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0895
        rs_R009_ueqv_R009NYNYN_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYNYN_partial_28_0895 := by
  native_decide

/-- Coefficient term 896 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0896 : Poly :=
[
  term ((-8042391521042253719584 : Rat) / 13017774793972194963465) [(2, 1), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 896 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0896 : Poly :=
[
  term ((-16084783042084507439168 : Rat) / 13017774793972194963465) [(2, 1), (8, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((8042391521042253719584 : Rat) / 13017774793972194963465) [(2, 1), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 896 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0896_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0896
        rs_R009_ueqv_R009NYNYN_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYNYN_partial_28_0896 := by
  native_decide

/-- Coefficient term 897 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0897 : Poly :=
[
  term ((28606517902490010161604388303876880332850563237701628590562135876 : Rat) / 333390229939667209106775482079636567325082553683743242485485305) [(2, 1), (8, 1), (12, 1), (13, 2)]
]

/-- Partial product 897 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0897 : Poly :=
[
  term ((-28606517902490010161604388303876880332850563237701628590562135876 : Rat) / 333390229939667209106775482079636567325082553683743242485485305) [(2, 1), (8, 1), (12, 1), (13, 2)],
  term ((57213035804980020323208776607753760665701126475403257181124271752 : Rat) / 333390229939667209106775482079636567325082553683743242485485305) [(2, 1), (8, 1), (12, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 897 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0897_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0897
        rs_R009_ueqv_R009NYNYN_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYNYN_partial_28_0897 := by
  native_decide

/-- Coefficient term 898 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0898 : Poly :=
[
  term ((16084783042084507439168 : Rat) / 13017774793972194963465) [(2, 1), (8, 1), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 898 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0898 : Poly :=
[
  term ((32169566084169014878336 : Rat) / 13017774793972194963465) [(2, 1), (8, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-16084783042084507439168 : Rat) / 13017774793972194963465) [(2, 1), (8, 1), (12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 898 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0898_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0898
        rs_R009_ueqv_R009NYNYN_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYNYN_partial_28_0898 := by
  native_decide

/-- Coefficient term 899 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0899 : Poly :=
[
  term ((-127086587736566762886595484280674471036051779605065083576 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (8, 1), (12, 1), (15, 2)]
]

/-- Partial product 899 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0899 : Poly :=
[
  term ((-254173175473133525773190968561348942072103559210130167152 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (8, 1), (12, 1), (14, 1), (15, 2)],
  term ((127086587736566762886595484280674471036051779605065083576 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (8, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 899 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0899_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0899
        rs_R009_ueqv_R009NYNYN_generator_28_0800_0899 =
      rs_R009_ueqv_R009NYNYN_partial_28_0899 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NYNYN_partials_28_0800_0899 : List Poly :=
[
  rs_R009_ueqv_R009NYNYN_partial_28_0800,
  rs_R009_ueqv_R009NYNYN_partial_28_0801,
  rs_R009_ueqv_R009NYNYN_partial_28_0802,
  rs_R009_ueqv_R009NYNYN_partial_28_0803,
  rs_R009_ueqv_R009NYNYN_partial_28_0804,
  rs_R009_ueqv_R009NYNYN_partial_28_0805,
  rs_R009_ueqv_R009NYNYN_partial_28_0806,
  rs_R009_ueqv_R009NYNYN_partial_28_0807,
  rs_R009_ueqv_R009NYNYN_partial_28_0808,
  rs_R009_ueqv_R009NYNYN_partial_28_0809,
  rs_R009_ueqv_R009NYNYN_partial_28_0810,
  rs_R009_ueqv_R009NYNYN_partial_28_0811,
  rs_R009_ueqv_R009NYNYN_partial_28_0812,
  rs_R009_ueqv_R009NYNYN_partial_28_0813,
  rs_R009_ueqv_R009NYNYN_partial_28_0814,
  rs_R009_ueqv_R009NYNYN_partial_28_0815,
  rs_R009_ueqv_R009NYNYN_partial_28_0816,
  rs_R009_ueqv_R009NYNYN_partial_28_0817,
  rs_R009_ueqv_R009NYNYN_partial_28_0818,
  rs_R009_ueqv_R009NYNYN_partial_28_0819,
  rs_R009_ueqv_R009NYNYN_partial_28_0820,
  rs_R009_ueqv_R009NYNYN_partial_28_0821,
  rs_R009_ueqv_R009NYNYN_partial_28_0822,
  rs_R009_ueqv_R009NYNYN_partial_28_0823,
  rs_R009_ueqv_R009NYNYN_partial_28_0824,
  rs_R009_ueqv_R009NYNYN_partial_28_0825,
  rs_R009_ueqv_R009NYNYN_partial_28_0826,
  rs_R009_ueqv_R009NYNYN_partial_28_0827,
  rs_R009_ueqv_R009NYNYN_partial_28_0828,
  rs_R009_ueqv_R009NYNYN_partial_28_0829,
  rs_R009_ueqv_R009NYNYN_partial_28_0830,
  rs_R009_ueqv_R009NYNYN_partial_28_0831,
  rs_R009_ueqv_R009NYNYN_partial_28_0832,
  rs_R009_ueqv_R009NYNYN_partial_28_0833,
  rs_R009_ueqv_R009NYNYN_partial_28_0834,
  rs_R009_ueqv_R009NYNYN_partial_28_0835,
  rs_R009_ueqv_R009NYNYN_partial_28_0836,
  rs_R009_ueqv_R009NYNYN_partial_28_0837,
  rs_R009_ueqv_R009NYNYN_partial_28_0838,
  rs_R009_ueqv_R009NYNYN_partial_28_0839,
  rs_R009_ueqv_R009NYNYN_partial_28_0840,
  rs_R009_ueqv_R009NYNYN_partial_28_0841,
  rs_R009_ueqv_R009NYNYN_partial_28_0842,
  rs_R009_ueqv_R009NYNYN_partial_28_0843,
  rs_R009_ueqv_R009NYNYN_partial_28_0844,
  rs_R009_ueqv_R009NYNYN_partial_28_0845,
  rs_R009_ueqv_R009NYNYN_partial_28_0846,
  rs_R009_ueqv_R009NYNYN_partial_28_0847,
  rs_R009_ueqv_R009NYNYN_partial_28_0848,
  rs_R009_ueqv_R009NYNYN_partial_28_0849,
  rs_R009_ueqv_R009NYNYN_partial_28_0850,
  rs_R009_ueqv_R009NYNYN_partial_28_0851,
  rs_R009_ueqv_R009NYNYN_partial_28_0852,
  rs_R009_ueqv_R009NYNYN_partial_28_0853,
  rs_R009_ueqv_R009NYNYN_partial_28_0854,
  rs_R009_ueqv_R009NYNYN_partial_28_0855,
  rs_R009_ueqv_R009NYNYN_partial_28_0856,
  rs_R009_ueqv_R009NYNYN_partial_28_0857,
  rs_R009_ueqv_R009NYNYN_partial_28_0858,
  rs_R009_ueqv_R009NYNYN_partial_28_0859,
  rs_R009_ueqv_R009NYNYN_partial_28_0860,
  rs_R009_ueqv_R009NYNYN_partial_28_0861,
  rs_R009_ueqv_R009NYNYN_partial_28_0862,
  rs_R009_ueqv_R009NYNYN_partial_28_0863,
  rs_R009_ueqv_R009NYNYN_partial_28_0864,
  rs_R009_ueqv_R009NYNYN_partial_28_0865,
  rs_R009_ueqv_R009NYNYN_partial_28_0866,
  rs_R009_ueqv_R009NYNYN_partial_28_0867,
  rs_R009_ueqv_R009NYNYN_partial_28_0868,
  rs_R009_ueqv_R009NYNYN_partial_28_0869,
  rs_R009_ueqv_R009NYNYN_partial_28_0870,
  rs_R009_ueqv_R009NYNYN_partial_28_0871,
  rs_R009_ueqv_R009NYNYN_partial_28_0872,
  rs_R009_ueqv_R009NYNYN_partial_28_0873,
  rs_R009_ueqv_R009NYNYN_partial_28_0874,
  rs_R009_ueqv_R009NYNYN_partial_28_0875,
  rs_R009_ueqv_R009NYNYN_partial_28_0876,
  rs_R009_ueqv_R009NYNYN_partial_28_0877,
  rs_R009_ueqv_R009NYNYN_partial_28_0878,
  rs_R009_ueqv_R009NYNYN_partial_28_0879,
  rs_R009_ueqv_R009NYNYN_partial_28_0880,
  rs_R009_ueqv_R009NYNYN_partial_28_0881,
  rs_R009_ueqv_R009NYNYN_partial_28_0882,
  rs_R009_ueqv_R009NYNYN_partial_28_0883,
  rs_R009_ueqv_R009NYNYN_partial_28_0884,
  rs_R009_ueqv_R009NYNYN_partial_28_0885,
  rs_R009_ueqv_R009NYNYN_partial_28_0886,
  rs_R009_ueqv_R009NYNYN_partial_28_0887,
  rs_R009_ueqv_R009NYNYN_partial_28_0888,
  rs_R009_ueqv_R009NYNYN_partial_28_0889,
  rs_R009_ueqv_R009NYNYN_partial_28_0890,
  rs_R009_ueqv_R009NYNYN_partial_28_0891,
  rs_R009_ueqv_R009NYNYN_partial_28_0892,
  rs_R009_ueqv_R009NYNYN_partial_28_0893,
  rs_R009_ueqv_R009NYNYN_partial_28_0894,
  rs_R009_ueqv_R009NYNYN_partial_28_0895,
  rs_R009_ueqv_R009NYNYN_partial_28_0896,
  rs_R009_ueqv_R009NYNYN_partial_28_0897,
  rs_R009_ueqv_R009NYNYN_partial_28_0898,
  rs_R009_ueqv_R009NYNYN_partial_28_0899
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NYNYN_block_28_0800_0899 : Poly :=
[
  term ((-184185844365668865173029102 : Rat) / 3788172465045908734368315) [(2, 1), (3, 1), (13, 1), (14, 1), (16, 1)],
  term ((92092922182834432586514551 : Rat) / 3788172465045908734368315) [(2, 1), (3, 1), (13, 1), (16, 1)],
  term ((102976766948312772400796676921249197280427076329838523459891383741 : Rat) / 333390229939667209106775482079636567325082553683743242485485305) [(2, 1), (3, 1), (13, 2), (14, 1), (15, 1)],
  term ((58325319690108109211728 : Rat) / 13017774793972194963465) [(2, 1), (3, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-102976766948312772400796676921249197280427076329838523459891383741 : Rat) / 666780459879334418213550964159273134650165107367486484970970610) [(2, 1), (3, 1), (13, 2), (15, 1)],
  term ((-29162659845054054605864 : Rat) / 13017774793972194963465) [(2, 1), (3, 1), (13, 2), (15, 1), (16, 1)],
  term ((4278729247299390535366344375013648479972822723504 : Rat) / 1354520779047503116208002444856180344466756464819) [(2, 1), (3, 1), (13, 3)],
  term ((-8557458494598781070732688750027296959945645447008 : Rat) / 1354520779047503116208002444856180344466756464819) [(2, 1), (3, 1), (13, 3), (14, 1)],
  term ((46384551632227709649983915798715809010439592174257098072822758238846463093 : Rat) / 6258819010991194496804243694964643762628146967093653443481808095071044000) [(2, 1), (3, 1), (14, 1), (15, 1)],
  term ((237520397415871818368 : Rat) / 32049107564750198685) [(2, 1), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((-23753300016878974411953899684316924669783159960575140584274860653 : Rat) / 330947839017916513220357497188112234199831912717222377600449756) [(2, 1), (3, 1), (14, 1), (15, 3)],
  term ((51335937180792 : Rat) / 88461357636043) [(2, 1), (3, 1), (14, 1), (15, 3), (16, 1)],
  term ((57327607019429517098249360881570223693364016172026174328195098593835130948694941 : Rat) / 32645999961330070495330935112935581865868414580360496361201111023890565504000) [(2, 1), (3, 1), (14, 2), (15, 1)],
  term ((1070484610703458968011 : Rat) / 32049107564750198685) [(2, 1), (3, 1), (14, 2), (15, 1), (16, 1)],
  term ((-917642708921538358179650683987022650999379714247428958337948977901313924629859 : Rat) / 2072761902306671142560694292884798848626566005102253737219118160247020032000) [(2, 1), (3, 1), (15, 1)],
  term ((-171725045059466956083 : Rat) / 14244047806555643860) [(2, 1), (3, 1), (15, 1), (16, 1)],
  term ((23753300016878974411953899684316924669783159960575140584274860653 : Rat) / 661895678035833026440714994376224468399663825434444755200899512) [(2, 1), (3, 1), (15, 3)],
  term ((-25667968590396 : Rat) / 88461357636043) [(2, 1), (3, 1), (15, 3), (16, 1)],
  term ((15113597141050423314645466723928237424847902360897622033099527312857408036267 : Rat) / 673113401264537535986204847689393440533369372790938069303115691214238464000) [(2, 1), (3, 2)],
  term ((6298299106979896 : Rat) / 1048898954827367) [(2, 1), (3, 2), (12, 1)],
  term ((-12596598213959792 : Rat) / 1048898954827367) [(2, 1), (3, 2), (12, 1), (14, 1)],
  term ((-16124054229068589496285487621755797460943965361901212283106626384155691044267 : Rat) / 336556700632268767993102423844696720266684686395469034651557845607119232000) [(2, 1), (3, 2), (14, 1)],
  term ((-1157892799853546297 : Rat) / 330403170770620605) [(2, 1), (3, 2), (14, 1), (16, 1)],
  term ((6298299106979896 : Rat) / 1048898954827367) [(2, 1), (3, 2), (14, 2)],
  term ((1157892799853546297 : Rat) / 660806341541241210) [(2, 1), (3, 2), (16, 1)],
  term ((4570911439400108399686012614384455199844037502953472000 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (8, 1), (9, 1)],
  term ((-1828364575760043359874405045753782079937615001181388800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (8, 1), (9, 1), (12, 1)],
  term ((3656729151520086719748810091507564159875230002362777600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (8, 1), (9, 1), (12, 1), (14, 1)],
  term ((-8227640590920195119434822705892019359719267505316249600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (8, 1), (9, 1), (14, 1)],
  term ((-1828364575760043359874405045753782079937615001181388800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (8, 1), (9, 1), (14, 2)],
  term ((-266267428057477922645285580634790314837645974421707776000 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (5, 1), (8, 1), (11, 1)],
  term ((-1828364575760043359874405045753782079937615001181388800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (8, 1), (11, 1), (12, 1)],
  term ((3656729151520086719748810091507564159875230002362777600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (8, 1), (11, 1), (12, 1), (14, 1)],
  term ((535277402978595910330382768838211302795198371345187635200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (5, 1), (8, 1), (11, 1), (14, 1)],
  term ((-1828364575760043359874405045753782079937615001181388800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (8, 1), (11, 1), (14, 2)],
  term ((-3656729151520086719748810091507564159875230002362777600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((1828364575760043359874405045753782079937615001181388800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (8, 1), (12, 1), (15, 1)],
  term ((-1828364575760043359874405045753782079937615001181388800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (8, 1), (13, 1), (14, 1)],
  term ((3656729151520086719748810091507564159875230002362777600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (8, 1), (13, 1), (14, 2)],
  term ((-269219853415465718931705287678871753229421615422511718400 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (5, 1), (8, 1), (14, 1), (15, 1)],
  term ((134609926707732859465852643839435876614710807711255859200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (5, 1), (8, 1), (15, 1)],
  term ((1828364575760043359874405045753782079937615001181388800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (8, 2), (13, 1)],
  term ((-3656729151520086719748810091507564159875230002362777600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (8, 2), (13, 1), (14, 1)],
  term ((1828364575760043359874405045753782079937615001181388800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (8, 2), (14, 1), (15, 1)],
  term ((-914182287880021679937202522876891039968807500590694400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (8, 2), (15, 1)],
  term ((1980029730329372818407033143028484499032457067419648000 : Rat) / 60114285150280637492040475866445680491505092058198069) [(2, 1), (5, 1), (9, 1)],
  term ((-319009101985641798653583152404824433203582851708928000 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (9, 1), (10, 1)],
  term ((-1373834818770282198581124524955083325475283813928960000 : Rat) / 718508836796211429071531402022755514446084671743224539) [(2, 1), (5, 1), (9, 1), (10, 1), (12, 1)],
  term ((2747669637540564397162249049910166650950567627857920000 : Rat) / 718508836796211429071531402022755514446084671743224539) [(2, 1), (5, 1), (9, 1), (10, 1), (12, 1), (14, 1)],
  term ((5446440069667271292341102142152440505570659052169216000 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (9, 1), (10, 1), (14, 1)],
  term ((-1373834818770282198581124524955083325475283813928960000 : Rat) / 718508836796211429071531402022755514446084671743224539) [(2, 1), (5, 1), (9, 1), (10, 1), (14, 2)],
  term ((57359078421600334636059860858455189097530050101164851200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (5, 1), (9, 1), (12, 1)],
  term ((-114718156843200669272119721716910378195060100202329702400 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (5, 1), (9, 1), (12, 1), (14, 1)],
  term ((4662966134036354427229358020406869257697918102011084800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((-2331483067018177213614679010203434628848959051005542400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (9, 1), (13, 1), (15, 1)],
  term ((4662966134036354427229358020406869257697918102011084800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (9, 1), (13, 2)],
  term ((-9325932268072708854458716040813738515395836204022169600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (9, 1), (13, 2), (14, 1)],
  term ((-345362630183362958526077498133397143031659709093187481600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (9, 1), (14, 1)],
  term ((84225931849487441475803713199784421161371358869798297600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (5, 1), (9, 1), (14, 2)],
  term ((683007956721196377608181805976245751046255517408549273600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (5, 1), (10, 1), (12, 1), (13, 1)],
  term ((-200050219766264115923741491730544228309614977130450124800 : Rat) / 2155526510388634287214594206068266543338254015229673617) [(2, 1), (5, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((22890416614304037499884553440878730716529203397368217600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (10, 1), (12, 1), (13, 1), (14, 2)],
  term ((414169439490172375989562906138679326877741250538457497600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (5, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-207084719745086187994781453069339663438870625269228748800 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (5, 1), (10, 1), (12, 1), (15, 1)],
  term ((-434436064453984288097309813622406552694023759356952576000 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (5, 1), (10, 1), (12, 2), (13, 1)],
  term ((868872128907968576194619627244813105388047518713905152000 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (5, 1), (10, 1), (12, 2), (13, 1), (14, 1)],
  term ((-503107314296896400596963473945042744843611369549057228800 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (5, 1), (10, 1), (12, 2), (14, 1), (15, 1)],
  term ((251553657148448200298481736972521372421805684774528614400 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (5, 1), (10, 1), (12, 2), (15, 1)],
  term ((-75187573479920037454437825767160433138680942243776512000 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (10, 1), (13, 1)],
  term ((154150631324508101276298423237307598656896842412814745600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (10, 1), (13, 1), (14, 1)],
  term ((-7550968729336052734845543405973464759069915850523443200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (10, 1), (13, 1), (14, 2)],
  term ((12815084618817369626934269191678476409751227915183104000 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (10, 1), (14, 1), (15, 1)],
  term ((-6407542309408684813467134595839238204875613957591552000 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (10, 1), (15, 1)],
  term ((-304795635923114254074095934923726633632103144583987968000 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (5, 1), (11, 1)],
  term ((-1360911457339477001628369878999997372159372245848780800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (11, 1), (12, 1)],
  term ((2721822914678954003256739757999994744318744491697561600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (11, 1), (12, 1), (14, 1)],
  term ((2145976557591003515614176885082381004674612818503270400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-1072988278795501757807088442541190502337306409251635200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (11, 1), (13, 1), (15, 1)],
  term ((2145976557591003515614176885082381004674612818503270400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (11, 1), (13, 2)],
  term ((-4291953115182007031228353770164762009349225637006540800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (11, 1), (13, 2), (14, 1)],
  term ((604568100970089996256947520096018979761158121158648985600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (5, 1), (11, 1), (14, 1)],
  term ((68342460899843699200603397978697789157117932099686400 : Rat) / 102644119542315918438790200288965073492297810249032077) [(2, 1), (5, 1), (11, 1), (14, 2)],
  term ((-11727717101772098029055850614328268739525357966184743526400 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(2, 1), (5, 1), (12, 1), (13, 1)],
  term ((23646230753201499054600581689483710521532845665907822796800 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(2, 1), (5, 1), (12, 1), (13, 1), (14, 1)],
  term ((-18171099967362190141798139126397432617345688908412928000 : Rat) / 2155526510388634287214594206068266543338254015229673617) [(2, 1), (5, 1), (12, 1), (13, 1), (14, 2)],
  term ((-1100904291841768407272720490374260856509082713009696768000 : Rat) / 6466579531165902861643782618204799630014762045689020851) [(2, 1), (5, 1), (12, 1), (14, 1), (15, 1)],
  term ((550452145920884203636360245187130428254541356504848384000 : Rat) / 6466579531165902861643782618204799630014762045689020851) [(2, 1), (5, 1), (12, 1), (15, 1)],
  term ((5775833655291516257963508382138832204204487001136084992000 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(2, 1), (5, 1), (12, 2), (13, 1)],
  term ((-11551667310583032515927016764277664408408974002272169984000 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(2, 1), (5, 1), (12, 2), (13, 1), (14, 1)],
  term ((6157426754606122250941269303793178289168746468212756480000 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(2, 1), (5, 1), (12, 2), (14, 1), (15, 1)],
  term ((-3078713377303061125470634651896589144584373234106378240000 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(2, 1), (5, 1), (12, 2), (15, 1)],
  term ((670331807939983460248787661807147477978459134579633561600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (13, 1)],
  term ((-1338573989835281409912818203023287003793729252727708057600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (13, 1), (14, 1)],
  term ((-10780877673600897544424997352694136082403417847643545600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (13, 1), (14, 1), (15, 2)],
  term ((-597036012767288738502034454573700618054004694731161600 : Rat) / 718508836796211429071531402022755514446084671743224539) [(2, 1), (5, 1), (13, 1), (14, 2)],
  term ((5390438836800448772212498676347068041201708923821772800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (13, 1), (15, 2)],
  term ((21561755347201795088849994705388272164806835695287091200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (13, 2), (14, 1), (15, 1)],
  term ((-10780877673600897544424997352694136082403417847643545600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (13, 2), (15, 1)],
  term ((110055307135843871648466514639259861063067730853184204800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (14, 1), (15, 1)],
  term ((-55027653567921935824233257319629930531533865426592102400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 1), (15, 1)],
  term ((-3656729151520086719748810091507564159875230002362777600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 2)],
  term ((-3656729151520086719748810091507564159875230002362777600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 2), (8, 1)],
  term ((7313458303040173439497620183015128319750460004725555200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 2), (8, 1), (14, 1)],
  term ((7313458303040173439497620183015128319750460004725555200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 1), (5, 2), (14, 1)],
  term ((1213314066154711565255101131463026045200718591103872080589809824713011105665163 : Rat) / 2560470585202358470222034126504751518891640359243960498917734197952201216000) [(2, 1), (6, 1)],
  term ((-1213314066154711565255101131463026045200718591103872080589809824713011105665163 : Rat) / 960176469450884426333262797439281819584365134716485187094150324232075456000) [(2, 1), (6, 1), (14, 1)],
  term ((-926824843952613223022 : Rat) / 32049107564750198685) [(2, 1), (6, 1), (14, 1), (16, 1)],
  term ((1213314066154711565255101131463026045200718591103872080589809824713011105665163 : Rat) / 1920352938901768852666525594878563639168730269432970374188300648464150912000) [(2, 1), (6, 1), (14, 2)],
  term ((463412421976306611511 : Rat) / 32049107564750198685) [(2, 1), (6, 1), (14, 2), (16, 1)],
  term ((463412421976306611511 : Rat) / 42732143419666931580) [(2, 1), (6, 1), (16, 1)],
  term ((-3149149553489948 : Rat) / 449528123497443) [(2, 1), (7, 1), (9, 1)],
  term ((6298299106979896 : Rat) / 449528123497443) [(2, 1), (7, 1), (9, 1), (14, 1)],
  term ((50386392855839168 : Rat) / 3146696864482101) [(2, 1), (7, 1), (12, 1), (13, 1)],
  term ((-100772785711678336 : Rat) / 3146696864482101) [(2, 1), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((25193196427919584 : Rat) / 1048898954827367) [(2, 1), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((-12596598213959792 : Rat) / 1048898954827367) [(2, 1), (7, 1), (12, 1), (15, 1)],
  term ((-12596598213959792 : Rat) / 3146696864482101) [(2, 1), (7, 1), (13, 1)],
  term ((12596598213959792 : Rat) / 1048898954827367) [(2, 1), (7, 1), (13, 1), (14, 1)],
  term ((-25193196427919584 : Rat) / 3146696864482101) [(2, 1), (7, 1), (13, 1), (14, 2)],
  term ((-25193196427919584 : Rat) / 3146696864482101) [(2, 1), (7, 1), (14, 1), (15, 1)],
  term ((12596598213959792 : Rat) / 3146696864482101) [(2, 1), (7, 1), (15, 1)],
  term ((-5828157549217728287664936767648656578989727782302097422119185971941801824563273 : Rat) / 65291999922660140990661870225871163731736829160720992722402222047781131008000) [(2, 1), (8, 1)],
  term ((97022232964002980125785630293438087957294054656000 : Rat) / 4063562337142509348624007334568541033400269394457) [(2, 1), (8, 1), (9, 1), (11, 1)],
  term ((-38808893185601192050314252117375235182917621862400 : Rat) / 4063562337142509348624007334568541033400269394457) [(2, 1), (8, 1), (9, 1), (11, 1), (12, 1)],
  term ((77617786371202384100628504234750470365835243724800 : Rat) / 4063562337142509348624007334568541033400269394457) [(2, 1), (8, 1), (9, 1), (11, 1), (12, 1), (14, 1)],
  term ((-58213339778401788075471378176062852774376432793600 : Rat) / 1354520779047503116208002444856180344466756464819) [(2, 1), (8, 1), (9, 1), (11, 1), (14, 1)],
  term ((-38808893185601192050314252117375235182917621862400 : Rat) / 4063562337142509348624007334568541033400269394457) [(2, 1), (8, 1), (9, 1), (11, 1), (14, 2)],
  term ((352683508445203406137727288943253672795148 : Rat) / 9891793743911987042053217044091449821375) [(2, 1), (8, 1), (9, 1), (12, 1), (13, 1)],
  term ((-705367016890406812275454577886507345590296 : Rat) / 9891793743911987042053217044091449821375) [(2, 1), (8, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((2400105437295042928512 : Rat) / 4339258264657398321155) [(2, 1), (8, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1200052718647521464256 : Rat) / 4339258264657398321155) [(2, 1), (8, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((278428677215786006087519965266490788388003055985007298282390826973813252 : Rat) / 10316113332786535598644818303893315614873123421785032037250850112591125) [(2, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-1200052718647521464256 : Rat) / 4339258264657398321155) [(2, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-139214338607893003043759982633245394194001527992503649141195413486906626 : Rat) / 10316113332786535598644818303893315614873123421785032037250850112591125) [(2, 1), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((600026359323760732128 : Rat) / 4339258264657398321155) [(2, 1), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-632629282699164045662745885820006053375683215348160647446855681631624902301145581 : Rat) / 986381531040197597770353067334834570798512457818003657821474980039069773008000) [(2, 1), (8, 1), (9, 1), (13, 1)],
  term ((632629282699164045662745885820006053375683215348160647446855681631624902301145581 : Rat) / 493190765520098798885176533667417285399256228909001828910737490019534886504000) [(2, 1), (8, 1), (9, 1), (13, 1), (14, 1)],
  term ((4161068344539742762089776 : Rat) / 252544831003060582291221) [(2, 1), (8, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2080534172269871381044888 : Rat) / 252544831003060582291221) [(2, 1), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((-116318152842331400543857139461997513686031572601436796138733993167598057636327609 : Rat) / 197276306208039519554070613466966914159702491563600731564294996007813954601600) [(2, 1), (8, 1), (9, 1), (14, 1), (15, 1)],
  term ((-10718525943336578496615698 : Rat) / 1262724155015302911456105) [(2, 1), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((65367681619380996627562709925396742629876930548689715200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (8, 1), (9, 1), (14, 2), (15, 1)],
  term ((115890829510782593303300048497065327649856336670401545817120568022787324723687609 : Rat) / 394552612416079039108141226933933828319404983127201463128589992015627909203200) [(2, 1), (8, 1), (9, 1), (15, 1)],
  term ((5359262971668289248307849 : Rat) / 1262724155015302911456105) [(2, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((10536140660316550661170003642481812917306936852421720951181199776 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(2, 1), (8, 1), (11, 1), (12, 1), (13, 1)],
  term ((-21072281320633101322340007284963625834613873704843441902362399552 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(2, 1), (8, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-1814092432435319071232 : Rat) / 619894037808199760165) [(2, 1), (8, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((907046216217659535616 : Rat) / 619894037808199760165) [(2, 1), (8, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((7296798713019747856909681467119348827593671315757168224627045612650592 : Rat) / 1146234814754059510960535367099257290541458157976114670805650012510125) [(2, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((907046216217659535616 : Rat) / 619894037808199760165) [(2, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3648399356509873928454840733559674413796835657878584112313522806325296 : Rat) / 1146234814754059510960535367099257290541458157976114670805650012510125) [(2, 1), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((-453523108108829767808 : Rat) / 619894037808199760165) [(2, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((349783075650328787836963098045968762441985595003223168987060757151540001739960301 : Rat) / 986381531040197597770353067334834570798512457818003657821474980039069773008000) [(2, 1), (8, 1), (11, 1), (13, 1)],
  term ((-50641896395575654946992747274354667225076919492558271372813490290782229964680043 : Rat) / 70455823645728399840739504809631040771322318415571689844391070002790698072000) [(2, 1), (8, 1), (11, 1), (13, 1), (14, 1)],
  term ((-17808466120080826354546288 : Rat) / 1262724155015302911456105) [(2, 1), (8, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((77617786371202384100628504234750470365835243724800 : Rat) / 4063562337142509348624007334568541033400269394457) [(2, 1), (8, 1), (11, 1), (13, 1), (14, 2)],
  term ((8904233060040413177273144 : Rat) / 1262724155015302911456105) [(2, 1), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((-15094334543299640628325244106727417538380695840684836355355646952425843 : Rat) / 163747830679151358708647909585608184363065451139444952972235716072875) [(2, 1), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((-12378484505395144264 : Rat) / 88556291115457108595) [(2, 1), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((65367681619380996627562709925396742629876930548689715200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (8, 1), (11, 1), (14, 2), (15, 1)],
  term ((103177464415574838861211281618697458438956101631062734983064266254180901 : Rat) / 2292469629508119021921070734198514581082916315952229341611300025020250) [(2, 1), (8, 1), (11, 1), (15, 1)],
  term ((6189242252697572132 : Rat) / 88556291115457108595) [(2, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((155235572742404768201257008469500940731670487449600 : Rat) / 4063562337142509348624007334568541033400269394457) [(2, 1), (8, 1), (11, 2)],
  term ((-38808893185601192050314252117375235182917621862400 : Rat) / 4063562337142509348624007334568541033400269394457) [(2, 1), (8, 1), (11, 2), (12, 1)],
  term ((77617786371202384100628504234750470365835243724800 : Rat) / 4063562337142509348624007334568541033400269394457) [(2, 1), (8, 1), (11, 2), (12, 1), (14, 1)],
  term ((-97022232964002980125785630293438087957294054656000 : Rat) / 1354520779047503116208002444856180344466756464819) [(2, 1), (8, 1), (11, 2), (14, 1)],
  term ((-38808893185601192050314252117375235182917621862400 : Rat) / 4063562337142509348624007334568541033400269394457) [(2, 1), (8, 1), (11, 2), (14, 2)],
  term ((1756582159228378444676214281082708233629688669211591703515025644031969817279 : Rat) / 8345092014654925995738991593286191683504195956124871257975744126761392000) [(2, 1), (8, 1), (12, 1)],
  term ((-11597117632541430681570701466122964232286410823098956775198120996 : Rat) / 333390229939667209106775482079636567325082553683743242485485305) [(2, 1), (8, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-16084783042084507439168 : Rat) / 13017774793972194963465) [(2, 1), (8, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((5798558816270715340785350733061482116143205411549478387599060498 : Rat) / 333390229939667209106775482079636567325082553683743242485485305) [(2, 1), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((8042391521042253719584 : Rat) / 13017774793972194963465) [(2, 1), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-28606517902490010161604388303876880332850563237701628590562135876 : Rat) / 333390229939667209106775482079636567325082553683743242485485305) [(2, 1), (8, 1), (12, 1), (13, 2)],
  term ((57213035804980020323208776607753760665701126475403257181124271752 : Rat) / 333390229939667209106775482079636567325082553683743242485485305) [(2, 1), (8, 1), (12, 1), (13, 2), (14, 1)],
  term ((32169566084169014878336 : Rat) / 13017774793972194963465) [(2, 1), (8, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-16084783042084507439168 : Rat) / 13017774793972194963465) [(2, 1), (8, 1), (12, 1), (13, 2), (16, 1)],
  term ((-1756582159228378444676214281082708233629688669211591703515025644031969817279 : Rat) / 4172546007327462997869495796643095841752097978062435628987872063380696000) [(2, 1), (8, 1), (12, 1), (14, 1)],
  term ((-254173175473133525773190968561348942072103559210130167152 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (8, 1), (12, 1), (14, 1), (15, 2)],
  term ((127086587736566762886595484280674471036051779605065083576 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (8, 1), (12, 1), (15, 2)],
  term ((5828157549217728287664936767648656578989727782302097422119185971941801824563273 : Rat) / 32645999961330070495330935112935581865868414580360496361201111023890565504000) [(2, 1), (8, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 28, terms 800 through 899. -/
theorem rs_R009_ueqv_R009NYNYN_block_28_0800_0899_valid :
    checkProductSumEq rs_R009_ueqv_R009NYNYN_partials_28_0800_0899
      rs_R009_ueqv_R009NYNYN_block_28_0800_0899 = true := by
  native_decide

end R009UeqvR009NYNYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
