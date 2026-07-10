/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_002, term block 9:800-899

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_002`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2002TermShards

/-- Generator polynomial 9 for endpoint certificate `ep_Q2_002`. -/
def ep_Q2_002_generator_09_0800_0899 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(2, 1)]
]

/-- Coefficient term 800 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0800 : Poly :=
[
  term ((73124187526202756452721429593824 : Rat) / 1273790490336191187829975377157) [(4, 1), (13, 2), (14, 1)]
]

/-- Partial product 800 for generator 9. -/
def ep_Q2_002_partial_09_0800 : Poly :=
[
  term ((146248375052405512905442859187648 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (13, 2), (14, 1)],
  term ((-73124187526202756452721429593824 : Rat) / 1273790490336191187829975377157) [(4, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 800 for generator 9. -/
theorem ep_Q2_002_partial_09_0800_valid :
    mulPoly ep_Q2_002_coefficient_09_0800
        ep_Q2_002_generator_09_0800_0899 =
      ep_Q2_002_partial_09_0800 := by
  native_decide

/-- Coefficient term 801 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0801 : Poly :=
[
  term ((-188177935994668181826385098171264 : Rat) / 1273790490336191187829975377157) [(4, 1), (13, 2), (15, 2)]
]

/-- Partial product 801 for generator 9. -/
def ep_Q2_002_partial_09_0801 : Poly :=
[
  term ((-376355871989336363652770196342528 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (13, 2), (15, 2)],
  term ((188177935994668181826385098171264 : Rat) / 1273790490336191187829975377157) [(4, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 801 for generator 9. -/
theorem ep_Q2_002_partial_09_0801_valid :
    mulPoly ep_Q2_002_coefficient_09_0801
        ep_Q2_002_generator_09_0800_0899 =
      ep_Q2_002_partial_09_0801 := by
  native_decide

/-- Coefficient term 802 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0802 : Poly :=
[
  term ((805609802875682775348978966241272190695888 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (14, 1), (15, 2)]
]

/-- Partial product 802 for generator 9. -/
def ep_Q2_002_partial_09_0802 : Poly :=
[
  term ((1611219605751365550697957932482544381391776 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (14, 1), (15, 2)],
  term ((-805609802875682775348978966241272190695888 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 802 for generator 9. -/
theorem ep_Q2_002_partial_09_0802_valid :
    mulPoly ep_Q2_002_coefficient_09_0802
        ep_Q2_002_generator_09_0800_0899 =
      ep_Q2_002_partial_09_0802 := by
  native_decide

/-- Coefficient term 803 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0803 : Poly :=
[
  term ((79237851682 : Rat) / 22203951735) [(4, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 803 for generator 9. -/
def ep_Q2_002_partial_09_0803 : Poly :=
[
  term ((158475703364 : Rat) / 22203951735) [(2, 1), (4, 1), (14, 1), (15, 2), (16, 1)],
  term ((-79237851682 : Rat) / 22203951735) [(4, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 803 for generator 9. -/
theorem ep_Q2_002_partial_09_0803_valid :
    mulPoly ep_Q2_002_coefficient_09_0803
        ep_Q2_002_generator_09_0800_0899 =
      ep_Q2_002_partial_09_0803 := by
  native_decide

/-- Coefficient term 804 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0804 : Poly :=
[
  term ((77641036406136607739668953994941301250082 : Rat) / 103601401347717117429703636119532782115) [(4, 1), (15, 2)]
]

/-- Partial product 804 for generator 9. -/
def ep_Q2_002_partial_09_0804 : Poly :=
[
  term ((155282072812273215479337907989882602500164 : Rat) / 103601401347717117429703636119532782115) [(2, 1), (4, 1), (15, 2)],
  term ((-77641036406136607739668953994941301250082 : Rat) / 103601401347717117429703636119532782115) [(4, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 804 for generator 9. -/
theorem ep_Q2_002_partial_09_0804_valid :
    mulPoly ep_Q2_002_coefficient_09_0804
        ep_Q2_002_generator_09_0800_0899 =
      ep_Q2_002_partial_09_0804 := by
  native_decide

/-- Coefficient term 805 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0805 : Poly :=
[
  term ((279477504583 : Rat) / 44407903470) [(4, 1), (15, 2), (16, 1)]
]

/-- Partial product 805 for generator 9. -/
def ep_Q2_002_partial_09_0805 : Poly :=
[
  term ((279477504583 : Rat) / 22203951735) [(2, 1), (4, 1), (15, 2), (16, 1)],
  term ((-279477504583 : Rat) / 44407903470) [(4, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 805 for generator 9. -/
theorem ep_Q2_002_partial_09_0805_valid :
    mulPoly ep_Q2_002_coefficient_09_0805
        ep_Q2_002_generator_09_0800_0899 =
      ep_Q2_002_partial_09_0805 := by
  native_decide

/-- Coefficient term 806 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0806 : Poly :=
[
  term ((3222439211502731101395915864965088762783552 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (15, 4)]
]

/-- Partial product 806 for generator 9. -/
def ep_Q2_002_partial_09_0806 : Poly :=
[
  term ((6444878423005462202791831729930177525567104 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (15, 4)],
  term ((-3222439211502731101395915864965088762783552 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 806 for generator 9. -/
theorem ep_Q2_002_partial_09_0806_valid :
    mulPoly ep_Q2_002_coefficient_09_0806
        ep_Q2_002_generator_09_0800_0899 =
      ep_Q2_002_partial_09_0806 := by
  native_decide

/-- Coefficient term 807 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0807 : Poly :=
[
  term ((316951406728 : Rat) / 22203951735) [(4, 1), (15, 4), (16, 1)]
]

/-- Partial product 807 for generator 9. -/
def ep_Q2_002_partial_09_0807 : Poly :=
[
  term ((633902813456 : Rat) / 22203951735) [(2, 1), (4, 1), (15, 4), (16, 1)],
  term ((-316951406728 : Rat) / 22203951735) [(4, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 807 for generator 9. -/
theorem ep_Q2_002_partial_09_0807_valid :
    mulPoly ep_Q2_002_coefficient_09_0807
        ep_Q2_002_generator_09_0800_0899 =
      ep_Q2_002_partial_09_0807 := by
  native_decide

/-- Coefficient term 808 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0808 : Poly :=
[
  term ((4145356700321577084010699715844 : Rat) / 115799135485108289802725034287) [(4, 2), (7, 1), (11, 1)]
]

/-- Partial product 808 for generator 9. -/
def ep_Q2_002_partial_09_0808 : Poly :=
[
  term ((8290713400643154168021399431688 : Rat) / 115799135485108289802725034287) [(2, 1), (4, 2), (7, 1), (11, 1)],
  term ((-4145356700321577084010699715844 : Rat) / 115799135485108289802725034287) [(4, 2), (7, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 808 for generator 9. -/
theorem ep_Q2_002_partial_09_0808_valid :
    mulPoly ep_Q2_002_coefficient_09_0808
        ep_Q2_002_generator_09_0800_0899 =
      ep_Q2_002_partial_09_0808 := by
  native_decide

/-- Coefficient term 809 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0809 : Poly :=
[
  term ((-7806482975122887523650623109648 : Rat) / 115799135485108289802725034287) [(4, 2), (7, 1), (13, 1)]
]

/-- Partial product 809 for generator 9. -/
def ep_Q2_002_partial_09_0809 : Poly :=
[
  term ((-15612965950245775047301246219296 : Rat) / 115799135485108289802725034287) [(2, 1), (4, 2), (7, 1), (13, 1)],
  term ((7806482975122887523650623109648 : Rat) / 115799135485108289802725034287) [(4, 2), (7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 809 for generator 9. -/
theorem ep_Q2_002_partial_09_0809_valid :
    mulPoly ep_Q2_002_coefficient_09_0809
        ep_Q2_002_generator_09_0800_0899 =
      ep_Q2_002_partial_09_0809 := by
  native_decide

/-- Coefficient term 810 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0810 : Poly :=
[
  term ((-224858114837607951615410296741836513393462 : Rat) / 122438019774574775144195206323084197045) [(4, 2), (7, 1), (15, 1)]
]

/-- Partial product 810 for generator 9. -/
def ep_Q2_002_partial_09_0810 : Poly :=
[
  term ((-449716229675215903230820593483673026786924 : Rat) / 122438019774574775144195206323084197045) [(2, 1), (4, 2), (7, 1), (15, 1)],
  term ((224858114837607951615410296741836513393462 : Rat) / 122438019774574775144195206323084197045) [(4, 2), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 810 for generator 9. -/
theorem ep_Q2_002_partial_09_0810_valid :
    mulPoly ep_Q2_002_coefficient_09_0810
        ep_Q2_002_generator_09_0800_0899 =
      ep_Q2_002_partial_09_0810 := by
  native_decide

/-- Coefficient term 811 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0811 : Poly :=
[
  term ((-190895317587 : Rat) / 14802634490) [(4, 2), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 811 for generator 9. -/
def ep_Q2_002_partial_09_0811 : Poly :=
[
  term ((-190895317587 : Rat) / 7401317245) [(2, 1), (4, 2), (7, 1), (15, 1), (16, 1)],
  term ((190895317587 : Rat) / 14802634490) [(4, 2), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 811 for generator 9. -/
theorem ep_Q2_002_partial_09_0811_valid :
    mulPoly ep_Q2_002_coefficient_09_0811
        ep_Q2_002_generator_09_0800_0899 =
      ep_Q2_002_partial_09_0811 := by
  native_decide

/-- Coefficient term 812 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0812 : Poly :=
[
  term ((-155320054720311158196368344574688 : Rat) / 1273790490336191187829975377157) [(4, 2), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 812 for generator 9. -/
def ep_Q2_002_partial_09_0812 : Poly :=
[
  term ((-310640109440622316392736689149376 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 2), (11, 1), (12, 1), (15, 1)],
  term ((155320054720311158196368344574688 : Rat) / 1273790490336191187829975377157) [(4, 2), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 812 for generator 9. -/
theorem ep_Q2_002_partial_09_0812_valid :
    mulPoly ep_Q2_002_coefficient_09_0812
        ep_Q2_002_generator_09_0800_0899 =
      ep_Q2_002_partial_09_0812 := by
  native_decide

/-- Coefficient term 813 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0813 : Poly :=
[
  term ((38830013680077789549092086143672 : Rat) / 1273790490336191187829975377157) [(4, 2), (11, 1), (13, 1)]
]

/-- Partial product 813 for generator 9. -/
def ep_Q2_002_partial_09_0813 : Poly :=
[
  term ((77660027360155579098184172287344 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 2), (11, 1), (13, 1)],
  term ((-38830013680077789549092086143672 : Rat) / 1273790490336191187829975377157) [(4, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 813 for generator 9. -/
theorem ep_Q2_002_partial_09_0813_valid :
    mulPoly ep_Q2_002_coefficient_09_0813
        ep_Q2_002_generator_09_0800_0899 =
      ep_Q2_002_partial_09_0813 := by
  native_decide

/-- Coefficient term 814 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0814 : Poly :=
[
  term ((14691262470773592341276698221036 : Rat) / 1273790490336191187829975377157) [(4, 2), (11, 1), (15, 1)]
]

/-- Partial product 814 for generator 9. -/
def ep_Q2_002_partial_09_0814 : Poly :=
[
  term ((29382524941547184682553396442072 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 2), (11, 1), (15, 1)],
  term ((-14691262470773592341276698221036 : Rat) / 1273790490336191187829975377157) [(4, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 814 for generator 9. -/
theorem ep_Q2_002_partial_09_0814_valid :
    mulPoly ep_Q2_002_coefficient_09_0814
        ep_Q2_002_generator_09_0800_0899 =
      ep_Q2_002_partial_09_0814 := by
  native_decide

/-- Coefficient term 815 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0815 : Poly :=
[
  term ((292496750104811025810885718375296 : Rat) / 1273790490336191187829975377157) [(4, 2), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 815 for generator 9. -/
def ep_Q2_002_partial_09_0815 : Poly :=
[
  term ((584993500209622051621771436750592 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 2), (12, 1), (13, 1), (15, 1)],
  term ((-292496750104811025810885718375296 : Rat) / 1273790490336191187829975377157) [(4, 2), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 815 for generator 9. -/
theorem ep_Q2_002_partial_09_0815_valid :
    mulPoly ep_Q2_002_coefficient_09_0815
        ep_Q2_002_generator_09_0800_0899 =
      ep_Q2_002_partial_09_0815 := by
  native_decide

/-- Coefficient term 816 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0816 : Poly :=
[
  term ((1854733942825719026280794174230390348277616 : Rat) / 1346818217520322526586147269553926167495) [(4, 2), (12, 1), (15, 2)]
]

/-- Partial product 816 for generator 9. -/
def ep_Q2_002_partial_09_0816 : Poly :=
[
  term ((3709467885651438052561588348460780696555232 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 2), (12, 1), (15, 2)],
  term ((-1854733942825719026280794174230390348277616 : Rat) / 1346818217520322526586147269553926167495) [(4, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 816 for generator 9. -/
theorem ep_Q2_002_partial_09_0816_valid :
    mulPoly ep_Q2_002_coefficient_09_0816
        ep_Q2_002_generator_09_0800_0899 =
      ep_Q2_002_partial_09_0816 := by
  native_decide

/-- Coefficient term 817 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0817 : Poly :=
[
  term ((150050235908 : Rat) / 7401317245) [(4, 2), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 817 for generator 9. -/
def ep_Q2_002_partial_09_0817 : Poly :=
[
  term ((300100471816 : Rat) / 7401317245) [(2, 1), (4, 2), (12, 1), (15, 2), (16, 1)],
  term ((-150050235908 : Rat) / 7401317245) [(4, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 817 for generator 9. -/
theorem ep_Q2_002_partial_09_0817_valid :
    mulPoly ep_Q2_002_coefficient_09_0817
        ep_Q2_002_generator_09_0800_0899 =
      ep_Q2_002_partial_09_0817 := by
  native_decide

/-- Coefficient term 818 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0818 : Poly :=
[
  term ((-492936027458335569291283646253196311657324 : Rat) / 1346818217520322526586147269553926167495) [(4, 2), (13, 1), (15, 1)]
]

/-- Partial product 818 for generator 9. -/
def ep_Q2_002_partial_09_0818 : Poly :=
[
  term ((-985872054916671138582567292506392623314648 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 2), (13, 1), (15, 1)],
  term ((492936027458335569291283646253196311657324 : Rat) / 1346818217520322526586147269553926167495) [(4, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 818 for generator 9. -/
theorem ep_Q2_002_partial_09_0818_valid :
    mulPoly ep_Q2_002_coefficient_09_0818
        ep_Q2_002_generator_09_0800_0899 =
      ep_Q2_002_partial_09_0818 := by
  native_decide

/-- Coefficient term 819 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0819 : Poly :=
[
  term ((-37512558977 : Rat) / 7401317245) [(4, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 819 for generator 9. -/
def ep_Q2_002_partial_09_0819 : Poly :=
[
  term ((-75025117954 : Rat) / 7401317245) [(2, 1), (4, 2), (13, 1), (15, 1), (16, 1)],
  term ((37512558977 : Rat) / 7401317245) [(4, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 819 for generator 9. -/
theorem ep_Q2_002_partial_09_0819_valid :
    mulPoly ep_Q2_002_coefficient_09_0819
        ep_Q2_002_generator_09_0800_0899 =
      ep_Q2_002_partial_09_0819 := by
  native_decide

/-- Coefficient term 820 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0820 : Poly :=
[
  term ((-73124187526202756452721429593824 : Rat) / 1273790490336191187829975377157) [(4, 2), (13, 2)]
]

/-- Partial product 820 for generator 9. -/
def ep_Q2_002_partial_09_0820 : Poly :=
[
  term ((-146248375052405512905442859187648 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 2), (13, 2)],
  term ((73124187526202756452721429593824 : Rat) / 1273790490336191187829975377157) [(4, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 820 for generator 9. -/
theorem ep_Q2_002_partial_09_0820_valid :
    mulPoly ep_Q2_002_coefficient_09_0820
        ep_Q2_002_generator_09_0800_0899 =
      ep_Q2_002_partial_09_0820 := by
  native_decide

/-- Coefficient term 821 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0821 : Poly :=
[
  term ((119387006845977526714470594163587052763358 : Rat) / 269363643504064505317229453910785233499) [(4, 2), (15, 2)]
]

/-- Partial product 821 for generator 9. -/
def ep_Q2_002_partial_09_0821 : Poly :=
[
  term ((238774013691955053428941188327174105526716 : Rat) / 269363643504064505317229453910785233499) [(2, 1), (4, 2), (15, 2)],
  term ((-119387006845977526714470594163587052763358 : Rat) / 269363643504064505317229453910785233499) [(4, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 821 for generator 9. -/
theorem ep_Q2_002_partial_09_0821_valid :
    mulPoly ep_Q2_002_coefficient_09_0821
        ep_Q2_002_generator_09_0800_0899 =
      ep_Q2_002_partial_09_0821 := by
  native_decide

/-- Coefficient term 822 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0822 : Poly :=
[
  term ((7782778567 : Rat) / 8881580694) [(4, 2), (15, 2), (16, 1)]
]

/-- Partial product 822 for generator 9. -/
def ep_Q2_002_partial_09_0822 : Poly :=
[
  term ((7782778567 : Rat) / 4440790347) [(2, 1), (4, 2), (15, 2), (16, 1)],
  term ((-7782778567 : Rat) / 8881580694) [(4, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 822 for generator 9. -/
theorem ep_Q2_002_partial_09_0822_valid :
    mulPoly ep_Q2_002_coefficient_09_0822
        ep_Q2_002_generator_09_0800_0899 =
      ep_Q2_002_partial_09_0822 := by
  native_decide

/-- Coefficient term 823 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0823 : Poly :=
[
  term ((15612965950245775047301246219296 : Rat) / 115799135485108289802725034287) [(5, 1), (6, 1), (7, 1), (11, 1), (13, 1)]
]

/-- Partial product 823 for generator 9. -/
def ep_Q2_002_partial_09_0823 : Poly :=
[
  term ((31225931900491550094602492438592 : Rat) / 115799135485108289802725034287) [(2, 1), (5, 1), (6, 1), (7, 1), (11, 1), (13, 1)],
  term ((-15612965950245775047301246219296 : Rat) / 115799135485108289802725034287) [(5, 1), (6, 1), (7, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 823 for generator 9. -/
theorem ep_Q2_002_partial_09_0823_valid :
    mulPoly ep_Q2_002_coefficient_09_0823
        ep_Q2_002_generator_09_0800_0899 =
      ep_Q2_002_partial_09_0823 := by
  native_decide

/-- Coefficient term 824 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0824 : Poly :=
[
  term ((449716229675215903230820593483673026786924 : Rat) / 122438019774574775144195206323084197045) [(5, 1), (6, 1), (7, 1), (11, 1), (15, 1)]
]

/-- Partial product 824 for generator 9. -/
def ep_Q2_002_partial_09_0824 : Poly :=
[
  term ((899432459350431806461641186967346053573848 : Rat) / 122438019774574775144195206323084197045) [(2, 1), (5, 1), (6, 1), (7, 1), (11, 1), (15, 1)],
  term ((-449716229675215903230820593483673026786924 : Rat) / 122438019774574775144195206323084197045) [(5, 1), (6, 1), (7, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 824 for generator 9. -/
theorem ep_Q2_002_partial_09_0824_valid :
    mulPoly ep_Q2_002_coefficient_09_0824
        ep_Q2_002_generator_09_0800_0899 =
      ep_Q2_002_partial_09_0824 := by
  native_decide

/-- Coefficient term 825 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0825 : Poly :=
[
  term ((190895317587 : Rat) / 7401317245) [(5, 1), (6, 1), (7, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 825 for generator 9. -/
def ep_Q2_002_partial_09_0825 : Poly :=
[
  term ((381790635174 : Rat) / 7401317245) [(2, 1), (5, 1), (6, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-190895317587 : Rat) / 7401317245) [(5, 1), (6, 1), (7, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 825 for generator 9. -/
theorem ep_Q2_002_partial_09_0825_valid :
    mulPoly ep_Q2_002_coefficient_09_0825
        ep_Q2_002_generator_09_0800_0899 =
      ep_Q2_002_partial_09_0825 := by
  native_decide

/-- Coefficient term 826 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0826 : Poly :=
[
  term ((-8290713400643154168021399431688 : Rat) / 115799135485108289802725034287) [(5, 1), (6, 1), (7, 1), (11, 2)]
]

/-- Partial product 826 for generator 9. -/
def ep_Q2_002_partial_09_0826 : Poly :=
[
  term ((-16581426801286308336042798863376 : Rat) / 115799135485108289802725034287) [(2, 1), (5, 1), (6, 1), (7, 1), (11, 2)],
  term ((8290713400643154168021399431688 : Rat) / 115799135485108289802725034287) [(5, 1), (6, 1), (7, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 826 for generator 9. -/
theorem ep_Q2_002_partial_09_0826_valid :
    mulPoly ep_Q2_002_coefficient_09_0826
        ep_Q2_002_generator_09_0800_0899 =
      ep_Q2_002_partial_09_0826 := by
  native_decide

/-- Coefficient term 827 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0827 : Poly :=
[
  term ((-14157856471664169168696435229488 : Rat) / 1273790490336191187829975377157) [(5, 1), (6, 1), (8, 1), (11, 1)]
]

/-- Partial product 827 for generator 9. -/
def ep_Q2_002_partial_09_0827 : Poly :=
[
  term ((-28315712943328338337392870458976 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (6, 1), (8, 1), (11, 1)],
  term ((14157856471664169168696435229488 : Rat) / 1273790490336191187829975377157) [(5, 1), (6, 1), (8, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 827 for generator 9. -/
theorem ep_Q2_002_partial_09_0827_valid :
    mulPoly ep_Q2_002_coefficient_09_0827
        ep_Q2_002_generator_09_0800_0899 =
      ep_Q2_002_partial_09_0827 := by
  native_decide

/-- Coefficient term 828 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0828 : Poly :=
[
  term ((26661895103431238130458547016896 : Rat) / 1273790490336191187829975377157) [(5, 1), (6, 1), (8, 1), (13, 1)]
]

/-- Partial product 828 for generator 9. -/
def ep_Q2_002_partial_09_0828 : Poly :=
[
  term ((53323790206862476260917094033792 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (6, 1), (8, 1), (13, 1)],
  term ((-26661895103431238130458547016896 : Rat) / 1273790490336191187829975377157) [(5, 1), (6, 1), (8, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 828 for generator 9. -/
theorem ep_Q2_002_partial_09_0828_valid :
    mulPoly ep_Q2_002_coefficient_09_0828
        ep_Q2_002_generator_09_0800_0899 =
      ep_Q2_002_partial_09_0828 := by
  native_decide

/-- Coefficient term 829 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0829 : Poly :=
[
  term ((71746616037473140311629593181957204357328 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (6, 1), (8, 1), (15, 1)]
]

/-- Partial product 829 for generator 9. -/
def ep_Q2_002_partial_09_0829 : Poly :=
[
  term ((143493232074946280623259186363914408714656 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (5, 1), (6, 1), (8, 1), (15, 1)],
  term ((-71746616037473140311629593181957204357328 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (6, 1), (8, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 829 for generator 9. -/
theorem ep_Q2_002_partial_09_0829_valid :
    mulPoly ep_Q2_002_coefficient_09_0829
        ep_Q2_002_generator_09_0800_0899 =
      ep_Q2_002_partial_09_0829 := by
  native_decide

/-- Coefficient term 830 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0830 : Poly :=
[
  term ((10981330664 : Rat) / 7401317245) [(5, 1), (6, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 830 for generator 9. -/
def ep_Q2_002_partial_09_0830 : Poly :=
[
  term ((21962661328 : Rat) / 7401317245) [(2, 1), (5, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((-10981330664 : Rat) / 7401317245) [(5, 1), (6, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 830 for generator 9. -/
theorem ep_Q2_002_partial_09_0830_valid :
    mulPoly ep_Q2_002_coefficient_09_0830
        ep_Q2_002_generator_09_0800_0899 =
      ep_Q2_002_partial_09_0830 := by
  native_decide

/-- Coefficient term 831 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0831 : Poly :=
[
  term ((127651815083817667639457163823806 : Rat) / 1273790490336191187829975377157) [(5, 1), (6, 1), (11, 1)]
]

/-- Partial product 831 for generator 9. -/
def ep_Q2_002_partial_09_0831 : Poly :=
[
  term ((255303630167635335278914327647612 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (6, 1), (11, 1)],
  term ((-127651815083817667639457163823806 : Rat) / 1273790490336191187829975377157) [(5, 1), (6, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 831 for generator 9. -/
theorem ep_Q2_002_partial_09_0831_valid :
    mulPoly ep_Q2_002_coefficient_09_0831
        ep_Q2_002_generator_09_0800_0899 =
      ep_Q2_002_partial_09_0831 := by
  native_decide

/-- Coefficient term 832 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0832 : Poly :=
[
  term ((-49962618910079865940988756816496 : Rat) / 1273790490336191187829975377157) [(5, 1), (6, 1), (11, 1), (12, 1)]
]

/-- Partial product 832 for generator 9. -/
def ep_Q2_002_partial_09_0832 : Poly :=
[
  term ((-99925237820159731881977513632992 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (6, 1), (11, 1), (12, 1)],
  term ((49962618910079865940988756816496 : Rat) / 1273790490336191187829975377157) [(5, 1), (6, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 832 for generator 9. -/
theorem ep_Q2_002_partial_09_0832_valid :
    mulPoly ep_Q2_002_coefficient_09_0832
        ep_Q2_002_generator_09_0800_0899 =
      ep_Q2_002_partial_09_0832 := by
  native_decide

/-- Coefficient term 833 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0833 : Poly :=
[
  term ((11942925754113317145260798298432 : Rat) / 97983883872014706756151952089) [(5, 1), (6, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 833 for generator 9. -/
def ep_Q2_002_partial_09_0833 : Poly :=
[
  term ((23885851508226634290521596596864 : Rat) / 97983883872014706756151952089) [(2, 1), (5, 1), (6, 1), (11, 1), (13, 1), (15, 1)],
  term ((-11942925754113317145260798298432 : Rat) / 97983883872014706756151952089) [(5, 1), (6, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 833 for generator 9. -/
theorem ep_Q2_002_partial_09_0833_valid :
    mulPoly ep_Q2_002_coefficient_09_0833
        ep_Q2_002_generator_09_0800_0899 =
      ep_Q2_002_partial_09_0833 := by
  native_decide

/-- Coefficient term 834 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0834 : Poly :=
[
  term ((59376094840828832391147245721732 : Rat) / 1273790490336191187829975377157) [(5, 1), (6, 1), (11, 1), (14, 1)]
]

/-- Partial product 834 for generator 9. -/
def ep_Q2_002_partial_09_0834 : Poly :=
[
  term ((118752189681657664782294491443464 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (6, 1), (11, 1), (14, 1)],
  term ((-59376094840828832391147245721732 : Rat) / 1273790490336191187829975377157) [(5, 1), (6, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 834 for generator 9. -/
theorem ep_Q2_002_partial_09_0834_valid :
    mulPoly ep_Q2_002_coefficient_09_0834
        ep_Q2_002_generator_09_0800_0899 =
      ep_Q2_002_partial_09_0834 := by
  native_decide

/-- Coefficient term 835 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0835 : Poly :=
[
  term ((-238774013691955053428941188327174105526716 : Rat) / 269363643504064505317229453910785233499) [(5, 1), (6, 1), (11, 1), (15, 2)]
]

/-- Partial product 835 for generator 9. -/
def ep_Q2_002_partial_09_0835 : Poly :=
[
  term ((-477548027383910106857882376654348211053432 : Rat) / 269363643504064505317229453910785233499) [(2, 1), (5, 1), (6, 1), (11, 1), (15, 2)],
  term ((238774013691955053428941188327174105526716 : Rat) / 269363643504064505317229453910785233499) [(5, 1), (6, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 835 for generator 9. -/
theorem ep_Q2_002_partial_09_0835_valid :
    mulPoly ep_Q2_002_coefficient_09_0835
        ep_Q2_002_generator_09_0800_0899 =
      ep_Q2_002_partial_09_0835 := by
  native_decide

/-- Coefficient term 836 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0836 : Poly :=
[
  term ((-7782778567 : Rat) / 4440790347) [(5, 1), (6, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 836 for generator 9. -/
def ep_Q2_002_partial_09_0836 : Poly :=
[
  term ((-15565557134 : Rat) / 4440790347) [(2, 1), (5, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((7782778567 : Rat) / 4440790347) [(5, 1), (6, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 836 for generator 9. -/
theorem ep_Q2_002_partial_09_0836_valid :
    mulPoly ep_Q2_002_coefficient_09_0836
        ep_Q2_002_generator_09_0800_0899 =
      ep_Q2_002_partial_09_0836 := by
  native_decide

/-- Coefficient term 837 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0837 : Poly :=
[
  term ((-29382524941547184682553396442072 : Rat) / 1273790490336191187829975377157) [(5, 1), (6, 1), (11, 2), (15, 1)]
]

/-- Partial product 837 for generator 9. -/
def ep_Q2_002_partial_09_0837 : Poly :=
[
  term ((-58765049883094369365106792884144 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (6, 1), (11, 2), (15, 1)],
  term ((29382524941547184682553396442072 : Rat) / 1273790490336191187829975377157) [(5, 1), (6, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 837 for generator 9. -/
theorem ep_Q2_002_partial_09_0837_valid :
    mulPoly ep_Q2_002_coefficient_09_0837
        ep_Q2_002_generator_09_0800_0899 =
      ep_Q2_002_partial_09_0837 := by
  native_decide

/-- Coefficient term 838 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0838 : Poly :=
[
  term ((94088967997334090913192549085632 : Rat) / 1273790490336191187829975377157) [(5, 1), (6, 1), (12, 1), (13, 1)]
]

/-- Partial product 838 for generator 9. -/
def ep_Q2_002_partial_09_0838 : Poly :=
[
  term ((188177935994668181826385098171264 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (6, 1), (12, 1), (13, 1)],
  term ((-94088967997334090913192549085632 : Rat) / 1273790490336191187829975377157) [(5, 1), (6, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 838 for generator 9. -/
theorem ep_Q2_002_partial_09_0838_valid :
    mulPoly ep_Q2_002_coefficient_09_0838
        ep_Q2_002_generator_09_0800_0899 =
      ep_Q2_002_partial_09_0838 := by
  native_decide

/-- Coefficient term 839 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0839 : Poly :=
[
  term ((878937346169027455438753096498157458754784 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (6, 1), (12, 1), (15, 1)]
]

/-- Partial product 839 for generator 9. -/
def ep_Q2_002_partial_09_0839 : Poly :=
[
  term ((1757874692338054910877506192996314917509568 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (5, 1), (6, 1), (12, 1), (15, 1)],
  term ((-878937346169027455438753096498157458754784 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (6, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 839 for generator 9. -/
theorem ep_Q2_002_partial_09_0839_valid :
    mulPoly ep_Q2_002_coefficient_09_0839
        ep_Q2_002_generator_09_0800_0899 =
      ep_Q2_002_partial_09_0839 := by
  native_decide

/-- Coefficient term 840 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0840 : Poly :=
[
  term ((56063165212 : Rat) / 7401317245) [(5, 1), (6, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 840 for generator 9. -/
def ep_Q2_002_partial_09_0840 : Poly :=
[
  term ((112126330424 : Rat) / 7401317245) [(2, 1), (5, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-56063165212 : Rat) / 7401317245) [(5, 1), (6, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 840 for generator 9. -/
theorem ep_Q2_002_partial_09_0840_valid :
    mulPoly ep_Q2_002_coefficient_09_0840
        ep_Q2_002_generator_09_0800_0899 =
      ep_Q2_002_partial_09_0840 := by
  native_decide

/-- Coefficient term 841 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0841 : Poly :=
[
  term ((-240392273388211197743707920988152 : Rat) / 1273790490336191187829975377157) [(5, 1), (6, 1), (13, 1)]
]

/-- Partial product 841 for generator 9. -/
def ep_Q2_002_partial_09_0841 : Poly :=
[
  term ((-480784546776422395487415841976304 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (6, 1), (13, 1)],
  term ((240392273388211197743707920988152 : Rat) / 1273790490336191187829975377157) [(5, 1), (6, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 841 for generator 9. -/
theorem ep_Q2_002_partial_09_0841_valid :
    mulPoly ep_Q2_002_coefficient_09_0841
        ep_Q2_002_generator_09_0800_0899 =
      ep_Q2_002_partial_09_0841 := by
  native_decide

/-- Coefficient term 842 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0842 : Poly :=
[
  term ((-111816306053530842005492822755344 : Rat) / 1273790490336191187829975377157) [(5, 1), (6, 1), (13, 1), (14, 1)]
]

/-- Partial product 842 for generator 9. -/
def ep_Q2_002_partial_09_0842 : Poly :=
[
  term ((-223632612107061684010985645510688 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (6, 1), (13, 1), (14, 1)],
  term ((111816306053530842005492822755344 : Rat) / 1273790490336191187829975377157) [(5, 1), (6, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 842 for generator 9. -/
theorem ep_Q2_002_partial_09_0842_valid :
    mulPoly ep_Q2_002_coefficient_09_0842
        ep_Q2_002_generator_09_0800_0899 =
      ep_Q2_002_partial_09_0842 := by
  native_decide

/-- Coefficient term 843 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0843 : Poly :=
[
  term ((-1757874692338054910877506192996314917509568 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (6, 1), (13, 1), (15, 2)]
]

/-- Partial product 843 for generator 9. -/
def ep_Q2_002_partial_09_0843 : Poly :=
[
  term ((-3515749384676109821755012385992629835019136 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (5, 1), (6, 1), (13, 1), (15, 2)],
  term ((1757874692338054910877506192996314917509568 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (6, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 843 for generator 9. -/
theorem ep_Q2_002_partial_09_0843_valid :
    mulPoly ep_Q2_002_coefficient_09_0843
        ep_Q2_002_generator_09_0800_0899 =
      ep_Q2_002_partial_09_0843 := by
  native_decide

/-- Coefficient term 844 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0844 : Poly :=
[
  term ((-112126330424 : Rat) / 7401317245) [(5, 1), (6, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 844 for generator 9. -/
def ep_Q2_002_partial_09_0844 : Poly :=
[
  term ((-224252660848 : Rat) / 7401317245) [(2, 1), (5, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((112126330424 : Rat) / 7401317245) [(5, 1), (6, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 844 for generator 9. -/
theorem ep_Q2_002_partial_09_0844_valid :
    mulPoly ep_Q2_002_coefficient_09_0844
        ep_Q2_002_generator_09_0800_0899 =
      ep_Q2_002_partial_09_0844 := by
  native_decide

/-- Coefficient term 845 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0845 : Poly :=
[
  term ((-188177935994668181826385098171264 : Rat) / 1273790490336191187829975377157) [(5, 1), (6, 1), (13, 2), (15, 1)]
]

/-- Partial product 845 for generator 9. -/
def ep_Q2_002_partial_09_0845 : Poly :=
[
  term ((-376355871989336363652770196342528 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (6, 1), (13, 2), (15, 1)],
  term ((188177935994668181826385098171264 : Rat) / 1273790490336191187829975377157) [(5, 1), (6, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 845 for generator 9. -/
theorem ep_Q2_002_partial_09_0845_valid :
    mulPoly ep_Q2_002_coefficient_09_0845
        ep_Q2_002_generator_09_0800_0899 =
      ep_Q2_002_partial_09_0845 := by
  native_decide

/-- Coefficient term 846 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0846 : Poly :=
[
  term ((1185303295548519608528173021440362540437602 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (6, 1), (14, 1), (15, 1)]
]

/-- Partial product 846 for generator 9. -/
def ep_Q2_002_partial_09_0846 : Poly :=
[
  term ((2370606591097039217056346042880725080875204 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (5, 1), (6, 1), (14, 1), (15, 1)],
  term ((-1185303295548519608528173021440362540437602 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (6, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 846 for generator 9. -/
theorem ep_Q2_002_partial_09_0846_valid :
    mulPoly ep_Q2_002_coefficient_09_0846
        ep_Q2_002_generator_09_0800_0899 =
      ep_Q2_002_partial_09_0846 := by
  native_decide

/-- Coefficient term 847 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0847 : Poly :=
[
  term ((-12619833773 : Rat) / 14802634490) [(5, 1), (6, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 847 for generator 9. -/
def ep_Q2_002_partial_09_0847 : Poly :=
[
  term ((-12619833773 : Rat) / 7401317245) [(2, 1), (5, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((12619833773 : Rat) / 14802634490) [(5, 1), (6, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 847 for generator 9. -/
theorem ep_Q2_002_partial_09_0847_valid :
    mulPoly ep_Q2_002_coefficient_09_0847
        ep_Q2_002_generator_09_0800_0899 =
      ep_Q2_002_partial_09_0847 := by
  native_decide

/-- Coefficient term 848 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0848 : Poly :=
[
  term ((-56695083186440924171004248530142999816781 : Rat) / 103601401347717117429703636119532782115) [(5, 1), (6, 1), (15, 1)]
]

/-- Partial product 848 for generator 9. -/
def ep_Q2_002_partial_09_0848 : Poly :=
[
  term ((-113390166372881848342008497060285999633562 : Rat) / 103601401347717117429703636119532782115) [(2, 1), (5, 1), (6, 1), (15, 1)],
  term ((56695083186440924171004248530142999816781 : Rat) / 103601401347717117429703636119532782115) [(5, 1), (6, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 848 for generator 9. -/
theorem ep_Q2_002_partial_09_0848_valid :
    mulPoly ep_Q2_002_coefficient_09_0848
        ep_Q2_002_generator_09_0800_0899 =
      ep_Q2_002_partial_09_0848 := by
  native_decide

/-- Coefficient term 849 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0849 : Poly :=
[
  term ((-1231702974353 : Rat) / 88815806940) [(5, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 849 for generator 9. -/
def ep_Q2_002_partial_09_0849 : Poly :=
[
  term ((-1231702974353 : Rat) / 44407903470) [(2, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((1231702974353 : Rat) / 88815806940) [(5, 1), (6, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 849 for generator 9. -/
theorem ep_Q2_002_partial_09_0849_valid :
    mulPoly ep_Q2_002_coefficient_09_0849
        ep_Q2_002_generator_09_0800_0899 =
      ep_Q2_002_partial_09_0849 := by
  native_decide

/-- Coefficient term 850 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0850 : Poly :=
[
  term ((-101854379352310130056889327723172 : Rat) / 1273790490336191187829975377157) [(5, 1), (6, 2), (11, 1)]
]

/-- Partial product 850 for generator 9. -/
def ep_Q2_002_partial_09_0850 : Poly :=
[
  term ((-203708758704620260113778655446344 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (6, 2), (11, 1)],
  term ((101854379352310130056889327723172 : Rat) / 1273790490336191187829975377157) [(5, 1), (6, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 850 for generator 9. -/
theorem ep_Q2_002_partial_09_0850_valid :
    mulPoly ep_Q2_002_coefficient_09_0850
        ep_Q2_002_generator_09_0800_0899 =
      ep_Q2_002_partial_09_0850 := by
  native_decide

/-- Coefficient term 851 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0851 : Poly :=
[
  term ((191810870773517562229522478407824 : Rat) / 1273790490336191187829975377157) [(5, 1), (6, 2), (13, 1)]
]

/-- Partial product 851 for generator 9. -/
def ep_Q2_002_partial_09_0851 : Poly :=
[
  term ((383621741547035124459044956815648 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (6, 2), (13, 1)],
  term ((-191810870773517562229522478407824 : Rat) / 1273790490336191187829975377157) [(5, 1), (6, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 851 for generator 9. -/
theorem ep_Q2_002_partial_09_0851_valid :
    mulPoly ep_Q2_002_coefficient_09_0851
        ep_Q2_002_generator_09_0800_0899 =
      ep_Q2_002_partial_09_0851 := by
  native_decide

/-- Coefficient term 852 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0852 : Poly :=
[
  term ((-798884253221079178784184045728990756154642 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (6, 2), (15, 1)]
]

/-- Partial product 852 for generator 9. -/
def ep_Q2_002_partial_09_0852 : Poly :=
[
  term ((-1597768506442158357568368091457981512309284 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (5, 1), (6, 2), (15, 1)],
  term ((798884253221079178784184045728990756154642 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (6, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 852 for generator 9. -/
theorem ep_Q2_002_partial_09_0852_valid :
    mulPoly ep_Q2_002_coefficient_09_0852
        ep_Q2_002_generator_09_0800_0899 =
      ep_Q2_002_partial_09_0852 := by
  native_decide

/-- Coefficient term 853 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0853 : Poly :=
[
  term ((88171245013 : Rat) / 14802634490) [(5, 1), (6, 2), (15, 1), (16, 1)]
]

/-- Partial product 853 for generator 9. -/
def ep_Q2_002_partial_09_0853 : Poly :=
[
  term ((88171245013 : Rat) / 7401317245) [(2, 1), (5, 1), (6, 2), (15, 1), (16, 1)],
  term ((-88171245013 : Rat) / 14802634490) [(5, 1), (6, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 853 for generator 9. -/
theorem ep_Q2_002_partial_09_0853_valid :
    mulPoly ep_Q2_002_coefficient_09_0853
        ep_Q2_002_generator_09_0800_0899 =
      ep_Q2_002_partial_09_0853 := by
  native_decide

/-- Coefficient term 854 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0854 : Poly :=
[
  term ((-56636140983145466834438517230928 : Rat) / 1273790490336191187829975377157) [(5, 1), (7, 1), (9, 1), (11, 1)]
]

/-- Partial product 854 for generator 9. -/
def ep_Q2_002_partial_09_0854 : Poly :=
[
  term ((-113272281966290933668877034461856 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (7, 1), (9, 1), (11, 1)],
  term ((56636140983145466834438517230928 : Rat) / 1273790490336191187829975377157) [(5, 1), (7, 1), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 854 for generator 9. -/
theorem ep_Q2_002_partial_09_0854_valid :
    mulPoly ep_Q2_002_coefficient_09_0854
        ep_Q2_002_generator_09_0800_0899 =
      ep_Q2_002_partial_09_0854 := by
  native_decide

/-- Coefficient term 855 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0855 : Poly :=
[
  term ((226544563932581867337754068923712 : Rat) / 1273790490336191187829975377157) [(5, 1), (7, 1), (9, 1), (11, 1), (14, 1)]
]

/-- Partial product 855 for generator 9. -/
def ep_Q2_002_partial_09_0855 : Poly :=
[
  term ((453089127865163734675508137847424 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (7, 1), (9, 1), (11, 1), (14, 1)],
  term ((-226544563932581867337754068923712 : Rat) / 1273790490336191187829975377157) [(5, 1), (7, 1), (9, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 855 for generator 9. -/
theorem ep_Q2_002_partial_09_0855_valid :
    mulPoly ep_Q2_002_coefficient_09_0855
        ep_Q2_002_generator_09_0800_0899 =
      ep_Q2_002_partial_09_0855 := by
  native_decide

/-- Coefficient term 856 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0856 : Poly :=
[
  term ((106656459823417958354488202669376 : Rat) / 1273790490336191187829975377157) [(5, 1), (7, 1), (9, 1), (13, 1)]
]

/-- Partial product 856 for generator 9. -/
def ep_Q2_002_partial_09_0856 : Poly :=
[
  term ((213312919646835916708976405338752 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (7, 1), (9, 1), (13, 1)],
  term ((-106656459823417958354488202669376 : Rat) / 1273790490336191187829975377157) [(5, 1), (7, 1), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 856 for generator 9. -/
theorem ep_Q2_002_partial_09_0856_valid :
    mulPoly ep_Q2_002_coefficient_09_0856
        ep_Q2_002_generator_09_0800_0899 =
      ep_Q2_002_partial_09_0856 := by
  native_decide

/-- Coefficient term 857 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0857 : Poly :=
[
  term ((-426625839293671833417952810677504 : Rat) / 1273790490336191187829975377157) [(5, 1), (7, 1), (9, 1), (13, 1), (14, 1)]
]

/-- Partial product 857 for generator 9. -/
def ep_Q2_002_partial_09_0857 : Poly :=
[
  term ((-853251678587343666835905621355008 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (7, 1), (9, 1), (13, 1), (14, 1)],
  term ((426625839293671833417952810677504 : Rat) / 1273790490336191187829975377157) [(5, 1), (7, 1), (9, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 857 for generator 9. -/
theorem ep_Q2_002_partial_09_0857_valid :
    mulPoly ep_Q2_002_coefficient_09_0857
        ep_Q2_002_generator_09_0800_0899 =
      ep_Q2_002_partial_09_0857 := by
  native_decide

/-- Coefficient term 858 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0858 : Poly :=
[
  term ((-1832662633459654280222474275573315954561152 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (7, 1), (9, 1), (14, 1), (15, 1)]
]

/-- Partial product 858 for generator 9. -/
def ep_Q2_002_partial_09_0858 : Poly :=
[
  term ((-3665325266919308560444948551146631909122304 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (5, 1), (7, 1), (9, 1), (14, 1), (15, 1)],
  term ((1832662633459654280222474275573315954561152 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (7, 1), (9, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 858 for generator 9. -/
theorem ep_Q2_002_partial_09_0858_valid :
    mulPoly ep_Q2_002_coefficient_09_0858
        ep_Q2_002_generator_09_0800_0899 =
      ep_Q2_002_partial_09_0858 := by
  native_decide

/-- Coefficient term 859 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0859 : Poly :=
[
  term ((-195028145136 : Rat) / 7401317245) [(5, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 859 for generator 9. -/
def ep_Q2_002_partial_09_0859 : Poly :=
[
  term ((-390056290272 : Rat) / 7401317245) [(2, 1), (5, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((195028145136 : Rat) / 7401317245) [(5, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 859 for generator 9. -/
theorem ep_Q2_002_partial_09_0859_valid :
    mulPoly ep_Q2_002_coefficient_09_0859
        ep_Q2_002_generator_09_0800_0899 =
      ep_Q2_002_partial_09_0859 := by
  native_decide

/-- Coefficient term 860 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0860 : Poly :=
[
  term ((458165658364913570055618568893328988640288 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (7, 1), (9, 1), (15, 1)]
]

/-- Partial product 860 for generator 9. -/
def ep_Q2_002_partial_09_0860 : Poly :=
[
  term ((916331316729827140111237137786657977280576 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (5, 1), (7, 1), (9, 1), (15, 1)],
  term ((-458165658364913570055618568893328988640288 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (7, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 860 for generator 9. -/
theorem ep_Q2_002_partial_09_0860_valid :
    mulPoly ep_Q2_002_coefficient_09_0860
        ep_Q2_002_generator_09_0800_0899 =
      ep_Q2_002_partial_09_0860 := by
  native_decide

/-- Coefficient term 861 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0861 : Poly :=
[
  term ((48757036284 : Rat) / 7401317245) [(5, 1), (7, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 861 for generator 9. -/
def ep_Q2_002_partial_09_0861 : Poly :=
[
  term ((97514072568 : Rat) / 7401317245) [(2, 1), (5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-48757036284 : Rat) / 7401317245) [(5, 1), (7, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 861 for generator 9. -/
theorem ep_Q2_002_partial_09_0861_valid :
    mulPoly ep_Q2_002_coefficient_09_0861
        ep_Q2_002_generator_09_0800_0899 =
      ep_Q2_002_partial_09_0861 := by
  native_decide

/-- Coefficient term 862 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0862 : Poly :=
[
  term ((-135805839136413506742519103630896 : Rat) / 1273790490336191187829975377157) [(5, 1), (7, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 862 for generator 9. -/
def ep_Q2_002_partial_09_0862 : Poly :=
[
  term ((-271611678272827013485038207261792 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (7, 1), (11, 1), (14, 1), (15, 1)],
  term ((135805839136413506742519103630896 : Rat) / 1273790490336191187829975377157) [(5, 1), (7, 1), (11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 862 for generator 9. -/
theorem ep_Q2_002_partial_09_0862_valid :
    mulPoly ep_Q2_002_coefficient_09_0862
        ep_Q2_002_generator_09_0800_0899 =
      ep_Q2_002_partial_09_0862 := by
  native_decide

/-- Coefficient term 863 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0863 : Poly :=
[
  term ((94241645958414316951024171003044 : Rat) / 1273790490336191187829975377157) [(5, 1), (7, 1), (11, 1), (15, 1)]
]

/-- Partial product 863 for generator 9. -/
def ep_Q2_002_partial_09_0863 : Poly :=
[
  term ((188483291916828633902048342006088 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (7, 1), (11, 1), (15, 1)],
  term ((-94241645958414316951024171003044 : Rat) / 1273790490336191187829975377157) [(5, 1), (7, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 863 for generator 9. -/
theorem ep_Q2_002_partial_09_0863_valid :
    mulPoly ep_Q2_002_coefficient_09_0863
        ep_Q2_002_generator_09_0800_0899 =
      ep_Q2_002_partial_09_0863 := by
  native_decide

/-- Coefficient term 864 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0864 : Poly :=
[
  term ((255747827698023416306029971210432 : Rat) / 1273790490336191187829975377157) [(5, 1), (7, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 864 for generator 9. -/
def ep_Q2_002_partial_09_0864 : Poly :=
[
  term ((511495655396046832612059942420864 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (7, 1), (13, 1), (14, 1), (15, 1)],
  term ((-255747827698023416306029971210432 : Rat) / 1273790490336191187829975377157) [(5, 1), (7, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 864 for generator 9. -/
theorem ep_Q2_002_partial_09_0864_valid :
    mulPoly ep_Q2_002_coefficient_09_0864
        ep_Q2_002_generator_09_0800_0899 =
      ep_Q2_002_partial_09_0864 := by
  native_decide

/-- Coefficient term 865 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0865 : Poly :=
[
  term ((-177474668142514312339870779132048 : Rat) / 1273790490336191187829975377157) [(5, 1), (7, 1), (13, 1), (15, 1)]
]

/-- Partial product 865 for generator 9. -/
def ep_Q2_002_partial_09_0865 : Poly :=
[
  term ((-354949336285028624679741558264096 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (7, 1), (13, 1), (15, 1)],
  term ((177474668142514312339870779132048 : Rat) / 1273790490336191187829975377157) [(5, 1), (7, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 865 for generator 9. -/
theorem ep_Q2_002_partial_09_0865_valid :
    mulPoly ep_Q2_002_coefficient_09_0865
        ep_Q2_002_generator_09_0800_0899 =
      ep_Q2_002_partial_09_0865 := by
  native_decide

/-- Coefficient term 866 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0866 : Poly :=
[
  term ((-1065179004294772238378912060971987674872856 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (7, 1), (14, 1), (15, 2)]
]

/-- Partial product 866 for generator 9. -/
def ep_Q2_002_partial_09_0866 : Poly :=
[
  term ((-2130358008589544476757824121943975349745712 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (5, 1), (7, 1), (14, 1), (15, 2)],
  term ((1065179004294772238378912060971987674872856 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (7, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 866 for generator 9. -/
theorem ep_Q2_002_partial_09_0866_valid :
    mulPoly ep_Q2_002_coefficient_09_0866
        ep_Q2_002_generator_09_0800_0899 =
      ep_Q2_002_partial_09_0866 := by
  native_decide

/-- Coefficient term 867 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0867 : Poly :=
[
  term ((176342490026 : Rat) / 22203951735) [(5, 1), (7, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 867 for generator 9. -/
def ep_Q2_002_partial_09_0867 : Poly :=
[
  term ((352684980052 : Rat) / 22203951735) [(2, 1), (5, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((-176342490026 : Rat) / 22203951735) [(5, 1), (7, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 867 for generator 9. -/
theorem ep_Q2_002_partial_09_0867_valid :
    mulPoly ep_Q2_002_coefficient_09_0867
        ep_Q2_002_generator_09_0800_0899 =
      ep_Q2_002_partial_09_0867 := by
  native_decide

/-- Coefficient term 868 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0868 : Poly :=
[
  term ((-1610209477910106774602432278099269464793078 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (7, 1), (15, 2)]
]

/-- Partial product 868 for generator 9. -/
def ep_Q2_002_partial_09_0868 : Poly :=
[
  term ((-3220418955820213549204864556198538929586156 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (5, 1), (7, 1), (15, 2)],
  term ((1610209477910106774602432278099269464793078 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (7, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 868 for generator 9. -/
theorem ep_Q2_002_partial_09_0868_valid :
    mulPoly ep_Q2_002_coefficient_09_0868
        ep_Q2_002_generator_09_0800_0899 =
      ep_Q2_002_partial_09_0868 := by
  native_decide

/-- Coefficient term 869 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0869 : Poly :=
[
  term ((-621943304939 : Rat) / 44407903470) [(5, 1), (7, 1), (15, 2), (16, 1)]
]

/-- Partial product 869 for generator 9. -/
def ep_Q2_002_partial_09_0869 : Poly :=
[
  term ((-621943304939 : Rat) / 22203951735) [(2, 1), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((621943304939 : Rat) / 44407903470) [(5, 1), (7, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 869 for generator 9. -/
theorem ep_Q2_002_partial_09_0869_valid :
    mulPoly ep_Q2_002_coefficient_09_0869
        ep_Q2_002_generator_09_0800_0899 =
      ep_Q2_002_partial_09_0869 := by
  native_decide

/-- Coefficient term 870 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0870 : Poly :=
[
  term ((-56255455648772782132771630848888 : Rat) / 1273790490336191187829975377157) [(5, 1), (7, 2), (11, 1)]
]

/-- Partial product 870 for generator 9. -/
def ep_Q2_002_partial_09_0870 : Poly :=
[
  term ((-112510911297545564265543261697776 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (7, 2), (11, 1)],
  term ((56255455648772782132771630848888 : Rat) / 1273790490336191187829975377157) [(5, 1), (7, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 870 for generator 9. -/
theorem ep_Q2_002_partial_09_0870_valid :
    mulPoly ep_Q2_002_coefficient_09_0870
        ep_Q2_002_generator_09_0800_0899 =
      ep_Q2_002_partial_09_0870 := by
  native_decide

/-- Coefficient term 871 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0871 : Poly :=
[
  term ((407417517409240520227557310892688 : Rat) / 1273790490336191187829975377157) [(5, 1), (7, 2), (11, 1), (14, 1)]
]

/-- Partial product 871 for generator 9. -/
def ep_Q2_002_partial_09_0871 : Poly :=
[
  term ((814835034818481040455114621785376 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (7, 2), (11, 1), (14, 1)],
  term ((-407417517409240520227557310892688 : Rat) / 1273790490336191187829975377157) [(5, 1), (7, 2), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 871 for generator 9. -/
theorem ep_Q2_002_partial_09_0871_valid :
    mulPoly ep_Q2_002_coefficient_09_0871
        ep_Q2_002_generator_09_0800_0899 =
      ep_Q2_002_partial_09_0871 := by
  native_decide

/-- Coefficient term 872 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0872 : Poly :=
[
  term ((105939558047165799469365624201696 : Rat) / 1273790490336191187829975377157) [(5, 1), (7, 2), (13, 1)]
]

/-- Partial product 872 for generator 9. -/
def ep_Q2_002_partial_09_0872 : Poly :=
[
  term ((211879116094331598938731248403392 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (7, 2), (13, 1)],
  term ((-105939558047165799469365624201696 : Rat) / 1273790490336191187829975377157) [(5, 1), (7, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 872 for generator 9. -/
theorem ep_Q2_002_partial_09_0872_valid :
    mulPoly ep_Q2_002_coefficient_09_0872
        ep_Q2_002_generator_09_0800_0899 =
      ep_Q2_002_partial_09_0872 := by
  native_decide

/-- Coefficient term 873 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0873 : Poly :=
[
  term ((-767243483094070248918089913631296 : Rat) / 1273790490336191187829975377157) [(5, 1), (7, 2), (13, 1), (14, 1)]
]

/-- Partial product 873 for generator 9. -/
def ep_Q2_002_partial_09_0873 : Poly :=
[
  term ((-1534486966188140497836179827262592 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (7, 2), (13, 1), (14, 1)],
  term ((767243483094070248918089913631296 : Rat) / 1273790490336191187829975377157) [(5, 1), (7, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 873 for generator 9. -/
theorem ep_Q2_002_partial_09_0873_valid :
    mulPoly ep_Q2_002_coefficient_09_0873
        ep_Q2_002_generator_09_0800_0899 =
      ep_Q2_002_partial_09_0873 := by
  native_decide

/-- Coefficient term 874 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0874 : Poly :=
[
  term ((3195537012884316715136736182915963024618568 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (7, 2), (14, 1), (15, 1)]
]

/-- Partial product 874 for generator 9. -/
def ep_Q2_002_partial_09_0874 : Poly :=
[
  term ((6391074025768633430273472365831926049237136 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (5, 1), (7, 2), (14, 1), (15, 1)],
  term ((-3195537012884316715136736182915963024618568 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (7, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 874 for generator 9. -/
theorem ep_Q2_002_partial_09_0874_valid :
    mulPoly ep_Q2_002_coefficient_09_0874
        ep_Q2_002_generator_09_0800_0899 =
      ep_Q2_002_partial_09_0874 := by
  native_decide

/-- Coefficient term 875 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0875 : Poly :=
[
  term ((-176342490026 : Rat) / 7401317245) [(5, 1), (7, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 875 for generator 9. -/
def ep_Q2_002_partial_09_0875 : Poly :=
[
  term ((-352684980052 : Rat) / 7401317245) [(2, 1), (5, 1), (7, 2), (14, 1), (15, 1), (16, 1)],
  term ((176342490026 : Rat) / 7401317245) [(5, 1), (7, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 875 for generator 9. -/
theorem ep_Q2_002_partial_09_0875_valid :
    mulPoly ep_Q2_002_coefficient_09_0875
        ep_Q2_002_generator_09_0800_0899 =
      ep_Q2_002_partial_09_0875 := by
  native_decide

/-- Coefficient term 876 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0876 : Poly :=
[
  term ((-3272323516434766646553697309889192403482724 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (7, 2), (15, 1)]
]

/-- Partial product 876 for generator 9. -/
def ep_Q2_002_partial_09_0876 : Poly :=
[
  term ((-6544647032869533293107394619778384806965448 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (5, 1), (7, 2), (15, 1)],
  term ((3272323516434766646553697309889192403482724 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (7, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 876 for generator 9. -/
theorem ep_Q2_002_partial_09_0876_valid :
    mulPoly ep_Q2_002_coefficient_09_0876
        ep_Q2_002_generator_09_0800_0899 =
      ep_Q2_002_partial_09_0876 := by
  native_decide

/-- Coefficient term 877 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0877 : Poly :=
[
  term ((-51362036287 : Rat) / 7401317245) [(5, 1), (7, 2), (15, 1), (16, 1)]
]

/-- Partial product 877 for generator 9. -/
def ep_Q2_002_partial_09_0877 : Poly :=
[
  term ((-102724072574 : Rat) / 7401317245) [(2, 1), (5, 1), (7, 2), (15, 1), (16, 1)],
  term ((51362036287 : Rat) / 7401317245) [(5, 1), (7, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 877 for generator 9. -/
theorem ep_Q2_002_partial_09_0877_valid :
    mulPoly ep_Q2_002_coefficient_09_0877
        ep_Q2_002_generator_09_0800_0899 =
      ep_Q2_002_partial_09_0877 := by
  native_decide

/-- Coefficient term 878 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0878 : Poly :=
[
  term ((2360428594692159888058201923744 : Rat) / 1273790490336191187829975377157) [(5, 1), (8, 1), (11, 1)]
]

/-- Partial product 878 for generator 9. -/
def ep_Q2_002_partial_09_0878 : Poly :=
[
  term ((4720857189384319776116403847488 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (8, 1), (11, 1)],
  term ((-2360428594692159888058201923744 : Rat) / 1273790490336191187829975377157) [(5, 1), (8, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 878 for generator 9. -/
theorem ep_Q2_002_partial_09_0878_valid :
    mulPoly ep_Q2_002_coefficient_09_0878
        ep_Q2_002_generator_09_0800_0899 =
      ep_Q2_002_partial_09_0878 := by
  native_decide

/-- Coefficient term 879 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0879 : Poly :=
[
  term ((18878713661048488944812839076976 : Rat) / 1273790490336191187829975377157) [(5, 1), (8, 1), (11, 1), (14, 1)]
]

/-- Partial product 879 for generator 9. -/
def ep_Q2_002_partial_09_0879 : Poly :=
[
  term ((37757427322096977889625678153952 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (8, 1), (11, 1), (14, 1)],
  term ((-18878713661048488944812839076976 : Rat) / 1273790490336191187829975377157) [(5, 1), (8, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 879 for generator 9. -/
theorem ep_Q2_002_partial_09_0879_valid :
    mulPoly ep_Q2_002_coefficient_09_0879
        ep_Q2_002_generator_09_0800_0899 =
      ep_Q2_002_partial_09_0879 := by
  native_decide

/-- Coefficient term 880 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0880 : Poly :=
[
  term ((-4445129085520707327185426936448 : Rat) / 1273790490336191187829975377157) [(5, 1), (8, 1), (13, 1)]
]

/-- Partial product 880 for generator 9. -/
def ep_Q2_002_partial_09_0880 : Poly :=
[
  term ((-8890258171041414654370853872896 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (8, 1), (13, 1)],
  term ((4445129085520707327185426936448 : Rat) / 1273790490336191187829975377157) [(5, 1), (8, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 880 for generator 9. -/
theorem ep_Q2_002_partial_09_0880_valid :
    mulPoly ep_Q2_002_coefficient_09_0880
        ep_Q2_002_generator_09_0800_0899 =
      ep_Q2_002_partial_09_0880 := by
  native_decide

/-- Coefficient term 881 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0881 : Poly :=
[
  term ((-35552153274472652784829400889792 : Rat) / 1273790490336191187829975377157) [(5, 1), (8, 1), (13, 1), (14, 1)]
]

/-- Partial product 881 for generator 9. -/
def ep_Q2_002_partial_09_0881 : Poly :=
[
  term ((-71104306548945305569658801779584 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (8, 1), (13, 1), (14, 1)],
  term ((35552153274472652784829400889792 : Rat) / 1273790490336191187829975377157) [(5, 1), (8, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 881 for generator 9. -/
theorem ep_Q2_002_partial_09_0881_valid :
    mulPoly ep_Q2_002_coefficient_09_0881
        ep_Q2_002_generator_09_0800_0899 =
      ep_Q2_002_partial_09_0881 := by
  native_decide

/-- Coefficient term 882 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0882 : Poly :=
[
  term ((-152721886121637856685206189631109662880096 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (8, 1), (14, 1), (15, 1)]
]

/-- Partial product 882 for generator 9. -/
def ep_Q2_002_partial_09_0882 : Poly :=
[
  term ((-305443772243275713370412379262219325760192 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (5, 1), (8, 1), (14, 1), (15, 1)],
  term ((152721886121637856685206189631109662880096 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (8, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 882 for generator 9. -/
theorem ep_Q2_002_partial_09_0882_valid :
    mulPoly ep_Q2_002_coefficient_09_0882
        ep_Q2_002_generator_09_0800_0899 =
      ep_Q2_002_partial_09_0882 := by
  native_decide

/-- Coefficient term 883 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0883 : Poly :=
[
  term ((-16252345428 : Rat) / 7401317245) [(5, 1), (8, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 883 for generator 9. -/
def ep_Q2_002_partial_09_0883 : Poly :=
[
  term ((-32504690856 : Rat) / 7401317245) [(2, 1), (5, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((16252345428 : Rat) / 7401317245) [(5, 1), (8, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 883 for generator 9. -/
theorem ep_Q2_002_partial_09_0883_valid :
    mulPoly ep_Q2_002_coefficient_09_0883
        ep_Q2_002_generator_09_0800_0899 =
      ep_Q2_002_partial_09_0883 := by
  native_decide

/-- Coefficient term 884 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0884 : Poly :=
[
  term ((-40487635042082358186788298224576229261384 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (8, 1), (15, 1)]
]

/-- Partial product 884 for generator 9. -/
def ep_Q2_002_partial_09_0884 : Poly :=
[
  term ((-80975270084164716373576596449152458522768 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (5, 1), (8, 1), (15, 1)],
  term ((40487635042082358186788298224576229261384 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (8, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 884 for generator 9. -/
theorem ep_Q2_002_partial_09_0884_valid :
    mulPoly ep_Q2_002_coefficient_09_0884
        ep_Q2_002_generator_09_0800_0899 =
      ep_Q2_002_partial_09_0884 := by
  native_decide

/-- Coefficient term 885 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0885 : Poly :=
[
  term ((-2635507382 : Rat) / 7401317245) [(5, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 885 for generator 9. -/
def ep_Q2_002_partial_09_0885 : Poly :=
[
  term ((-5271014764 : Rat) / 7401317245) [(2, 1), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((2635507382 : Rat) / 7401317245) [(5, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 885 for generator 9. -/
theorem ep_Q2_002_partial_09_0885_valid :
    mulPoly ep_Q2_002_coefficient_09_0885
        ep_Q2_002_generator_09_0800_0899 =
      ep_Q2_002_partial_09_0885 := by
  native_decide

/-- Coefficient term 886 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0886 : Poly :=
[
  term ((-75514854644193955779251356307904 : Rat) / 1273790490336191187829975377157) [(5, 1), (9, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 886 for generator 9. -/
def ep_Q2_002_partial_09_0886 : Poly :=
[
  term ((-151029709288387911558502712615808 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (9, 1), (11, 1), (14, 1), (15, 1)],
  term ((75514854644193955779251356307904 : Rat) / 1273790490336191187829975377157) [(5, 1), (9, 1), (11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 886 for generator 9. -/
theorem ep_Q2_002_partial_09_0886_valid :
    mulPoly ep_Q2_002_coefficient_09_0886
        ep_Q2_002_generator_09_0800_0899 =
      ep_Q2_002_partial_09_0886 := by
  native_decide

/-- Coefficient term 887 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0887 : Poly :=
[
  term ((18878713661048488944812839076976 : Rat) / 1273790490336191187829975377157) [(5, 1), (9, 1), (11, 1), (15, 1)]
]

/-- Partial product 887 for generator 9. -/
def ep_Q2_002_partial_09_0887 : Poly :=
[
  term ((37757427322096977889625678153952 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (9, 1), (11, 1), (15, 1)],
  term ((-18878713661048488944812839076976 : Rat) / 1273790490336191187829975377157) [(5, 1), (9, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 887 for generator 9. -/
theorem ep_Q2_002_partial_09_0887_valid :
    mulPoly ep_Q2_002_coefficient_09_0887
        ep_Q2_002_generator_09_0800_0899 =
      ep_Q2_002_partial_09_0887 := by
  native_decide

/-- Coefficient term 888 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0888 : Poly :=
[
  term ((142208613097890611139317603559168 : Rat) / 1273790490336191187829975377157) [(5, 1), (9, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 888 for generator 9. -/
def ep_Q2_002_partial_09_0888 : Poly :=
[
  term ((284417226195781222278635207118336 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((-142208613097890611139317603559168 : Rat) / 1273790490336191187829975377157) [(5, 1), (9, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 888 for generator 9. -/
theorem ep_Q2_002_partial_09_0888_valid :
    mulPoly ep_Q2_002_coefficient_09_0888
        ep_Q2_002_generator_09_0800_0899 =
      ep_Q2_002_partial_09_0888 := by
  native_decide

/-- Coefficient term 889 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0889 : Poly :=
[
  term ((-35552153274472652784829400889792 : Rat) / 1273790490336191187829975377157) [(5, 1), (9, 1), (13, 1), (15, 1)]
]

/-- Partial product 889 for generator 9. -/
def ep_Q2_002_partial_09_0889 : Poly :=
[
  term ((-71104306548945305569658801779584 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (9, 1), (13, 1), (15, 1)],
  term ((35552153274472652784829400889792 : Rat) / 1273790490336191187829975377157) [(5, 1), (9, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 889 for generator 9. -/
theorem ep_Q2_002_partial_09_0889_valid :
    mulPoly ep_Q2_002_coefficient_09_0889
        ep_Q2_002_generator_09_0800_0899 =
      ep_Q2_002_partial_09_0889 := by
  native_decide

/-- Coefficient term 890 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0890 : Poly :=
[
  term ((610887544486551426740824758524438651520384 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (9, 1), (14, 1), (15, 2)]
]

/-- Partial product 890 for generator 9. -/
def ep_Q2_002_partial_09_0890 : Poly :=
[
  term ((1221775088973102853481649517048877303040768 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (5, 1), (9, 1), (14, 1), (15, 2)],
  term ((-610887544486551426740824758524438651520384 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (9, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 890 for generator 9. -/
theorem ep_Q2_002_partial_09_0890_valid :
    mulPoly ep_Q2_002_coefficient_09_0890
        ep_Q2_002_generator_09_0800_0899 =
      ep_Q2_002_partial_09_0890 := by
  native_decide

/-- Coefficient term 891 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0891 : Poly :=
[
  term ((65009381712 : Rat) / 7401317245) [(5, 1), (9, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 891 for generator 9. -/
def ep_Q2_002_partial_09_0891 : Poly :=
[
  term ((130018763424 : Rat) / 7401317245) [(2, 1), (5, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-65009381712 : Rat) / 7401317245) [(5, 1), (9, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 891 for generator 9. -/
theorem ep_Q2_002_partial_09_0891_valid :
    mulPoly ep_Q2_002_coefficient_09_0891
        ep_Q2_002_generator_09_0800_0899 =
      ep_Q2_002_partial_09_0891 := by
  native_decide

/-- Coefficient term 892 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0892 : Poly :=
[
  term ((-152721886121637856685206189631109662880096 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (9, 1), (15, 2)]
]

/-- Partial product 892 for generator 9. -/
def ep_Q2_002_partial_09_0892 : Poly :=
[
  term ((-305443772243275713370412379262219325760192 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (5, 1), (9, 1), (15, 2)],
  term ((152721886121637856685206189631109662880096 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 892 for generator 9. -/
theorem ep_Q2_002_partial_09_0892_valid :
    mulPoly ep_Q2_002_coefficient_09_0892
        ep_Q2_002_generator_09_0800_0899 =
      ep_Q2_002_partial_09_0892 := by
  native_decide

/-- Coefficient term 893 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0893 : Poly :=
[
  term ((-16252345428 : Rat) / 7401317245) [(5, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 893 for generator 9. -/
def ep_Q2_002_partial_09_0893 : Poly :=
[
  term ((-32504690856 : Rat) / 7401317245) [(2, 1), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((16252345428 : Rat) / 7401317245) [(5, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 893 for generator 9. -/
theorem ep_Q2_002_partial_09_0893_valid :
    mulPoly ep_Q2_002_coefficient_09_0893
        ep_Q2_002_generator_09_0800_0899 =
      ep_Q2_002_partial_09_0893 := by
  native_decide

/-- Coefficient term 894 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0894 : Poly :=
[
  term ((12557821151775934868861640590271 : Rat) / 1273790490336191187829975377157) [(5, 1), (11, 1)]
]

/-- Partial product 894 for generator 9. -/
def ep_Q2_002_partial_09_0894 : Poly :=
[
  term ((25115642303551869737723281180542 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (11, 1)],
  term ((-12557821151775934868861640590271 : Rat) / 1273790490336191187829975377157) [(5, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 894 for generator 9. -/
theorem ep_Q2_002_partial_09_0894_valid :
    mulPoly ep_Q2_002_coefficient_09_0894
        ep_Q2_002_generator_09_0800_0899 =
      ep_Q2_002_partial_09_0894 := by
  native_decide

/-- Coefficient term 895 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0895 : Poly :=
[
  term ((2868028696565571505793048669412 : Rat) / 97983883872014706756151952089) [(5, 1), (11, 1), (12, 1)]
]

/-- Partial product 895 for generator 9. -/
def ep_Q2_002_partial_09_0895 : Poly :=
[
  term ((5736057393131143011586097338824 : Rat) / 97983883872014706756151952089) [(2, 1), (5, 1), (11, 1), (12, 1)],
  term ((-2868028696565571505793048669412 : Rat) / 97983883872014706756151952089) [(5, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 895 for generator 9. -/
theorem ep_Q2_002_partial_09_0895_valid :
    mulPoly ep_Q2_002_coefficient_09_0895
        ep_Q2_002_generator_09_0800_0899 =
      ep_Q2_002_partial_09_0895 := by
  native_decide

/-- Coefficient term 896 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0896 : Poly :=
[
  term ((-9733925734142700595002087081744 : Rat) / 97983883872014706756151952089) [(5, 1), (11, 1), (12, 1), (14, 1)]
]

/-- Partial product 896 for generator 9. -/
def ep_Q2_002_partial_09_0896 : Poly :=
[
  term ((-19467851468285401190004174163488 : Rat) / 97983883872014706756151952089) [(2, 1), (5, 1), (11, 1), (12, 1), (14, 1)],
  term ((9733925734142700595002087081744 : Rat) / 97983883872014706756151952089) [(5, 1), (11, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 896 for generator 9. -/
theorem ep_Q2_002_partial_09_0896_valid :
    mulPoly ep_Q2_002_coefficient_09_0896
        ep_Q2_002_generator_09_0800_0899 =
      ep_Q2_002_partial_09_0896 := by
  native_decide

/-- Coefficient term 897 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0897 : Poly :=
[
  term ((-99925237820159731881977513632992 : Rat) / 1273790490336191187829975377157) [(5, 1), (11, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 897 for generator 9. -/
def ep_Q2_002_partial_09_0897 : Poly :=
[
  term ((-199850475640319463763955027265984 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((99925237820159731881977513632992 : Rat) / 1273790490336191187829975377157) [(5, 1), (11, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 897 for generator 9. -/
theorem ep_Q2_002_partial_09_0897_valid :
    mulPoly ep_Q2_002_coefficient_09_0897
        ep_Q2_002_generator_09_0800_0899 =
      ep_Q2_002_partial_09_0897 := by
  native_decide

/-- Coefficient term 898 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0898 : Poly :=
[
  term ((3047738692317394948244548057224 : Rat) / 1273790490336191187829975377157) [(5, 1), (11, 1), (14, 1)]
]

/-- Partial product 898 for generator 9. -/
def ep_Q2_002_partial_09_0898 : Poly :=
[
  term ((6095477384634789896489096114448 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (11, 1), (14, 1)],
  term ((-3047738692317394948244548057224 : Rat) / 1273790490336191187829975377157) [(5, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 898 for generator 9. -/
theorem ep_Q2_002_partial_09_0898_valid :
    mulPoly ep_Q2_002_coefficient_09_0898
        ep_Q2_002_generator_09_0800_0899 =
      ep_Q2_002_partial_09_0898 := by
  native_decide

/-- Coefficient term 899 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0899 : Poly :=
[
  term ((30164542231633246775576459460960 : Rat) / 1273790490336191187829975377157) [(5, 1), (11, 1), (14, 1), (15, 2)]
]

/-- Partial product 899 for generator 9. -/
def ep_Q2_002_partial_09_0899 : Poly :=
[
  term ((60329084463266493551152918921920 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (11, 1), (14, 1), (15, 2)],
  term ((-30164542231633246775576459460960 : Rat) / 1273790490336191187829975377157) [(5, 1), (11, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 899 for generator 9. -/
theorem ep_Q2_002_partial_09_0899_valid :
    mulPoly ep_Q2_002_coefficient_09_0899
        ep_Q2_002_generator_09_0800_0899 =
      ep_Q2_002_partial_09_0899 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_002_partials_09_0800_0899 : List Poly :=
[
  ep_Q2_002_partial_09_0800,
  ep_Q2_002_partial_09_0801,
  ep_Q2_002_partial_09_0802,
  ep_Q2_002_partial_09_0803,
  ep_Q2_002_partial_09_0804,
  ep_Q2_002_partial_09_0805,
  ep_Q2_002_partial_09_0806,
  ep_Q2_002_partial_09_0807,
  ep_Q2_002_partial_09_0808,
  ep_Q2_002_partial_09_0809,
  ep_Q2_002_partial_09_0810,
  ep_Q2_002_partial_09_0811,
  ep_Q2_002_partial_09_0812,
  ep_Q2_002_partial_09_0813,
  ep_Q2_002_partial_09_0814,
  ep_Q2_002_partial_09_0815,
  ep_Q2_002_partial_09_0816,
  ep_Q2_002_partial_09_0817,
  ep_Q2_002_partial_09_0818,
  ep_Q2_002_partial_09_0819,
  ep_Q2_002_partial_09_0820,
  ep_Q2_002_partial_09_0821,
  ep_Q2_002_partial_09_0822,
  ep_Q2_002_partial_09_0823,
  ep_Q2_002_partial_09_0824,
  ep_Q2_002_partial_09_0825,
  ep_Q2_002_partial_09_0826,
  ep_Q2_002_partial_09_0827,
  ep_Q2_002_partial_09_0828,
  ep_Q2_002_partial_09_0829,
  ep_Q2_002_partial_09_0830,
  ep_Q2_002_partial_09_0831,
  ep_Q2_002_partial_09_0832,
  ep_Q2_002_partial_09_0833,
  ep_Q2_002_partial_09_0834,
  ep_Q2_002_partial_09_0835,
  ep_Q2_002_partial_09_0836,
  ep_Q2_002_partial_09_0837,
  ep_Q2_002_partial_09_0838,
  ep_Q2_002_partial_09_0839,
  ep_Q2_002_partial_09_0840,
  ep_Q2_002_partial_09_0841,
  ep_Q2_002_partial_09_0842,
  ep_Q2_002_partial_09_0843,
  ep_Q2_002_partial_09_0844,
  ep_Q2_002_partial_09_0845,
  ep_Q2_002_partial_09_0846,
  ep_Q2_002_partial_09_0847,
  ep_Q2_002_partial_09_0848,
  ep_Q2_002_partial_09_0849,
  ep_Q2_002_partial_09_0850,
  ep_Q2_002_partial_09_0851,
  ep_Q2_002_partial_09_0852,
  ep_Q2_002_partial_09_0853,
  ep_Q2_002_partial_09_0854,
  ep_Q2_002_partial_09_0855,
  ep_Q2_002_partial_09_0856,
  ep_Q2_002_partial_09_0857,
  ep_Q2_002_partial_09_0858,
  ep_Q2_002_partial_09_0859,
  ep_Q2_002_partial_09_0860,
  ep_Q2_002_partial_09_0861,
  ep_Q2_002_partial_09_0862,
  ep_Q2_002_partial_09_0863,
  ep_Q2_002_partial_09_0864,
  ep_Q2_002_partial_09_0865,
  ep_Q2_002_partial_09_0866,
  ep_Q2_002_partial_09_0867,
  ep_Q2_002_partial_09_0868,
  ep_Q2_002_partial_09_0869,
  ep_Q2_002_partial_09_0870,
  ep_Q2_002_partial_09_0871,
  ep_Q2_002_partial_09_0872,
  ep_Q2_002_partial_09_0873,
  ep_Q2_002_partial_09_0874,
  ep_Q2_002_partial_09_0875,
  ep_Q2_002_partial_09_0876,
  ep_Q2_002_partial_09_0877,
  ep_Q2_002_partial_09_0878,
  ep_Q2_002_partial_09_0879,
  ep_Q2_002_partial_09_0880,
  ep_Q2_002_partial_09_0881,
  ep_Q2_002_partial_09_0882,
  ep_Q2_002_partial_09_0883,
  ep_Q2_002_partial_09_0884,
  ep_Q2_002_partial_09_0885,
  ep_Q2_002_partial_09_0886,
  ep_Q2_002_partial_09_0887,
  ep_Q2_002_partial_09_0888,
  ep_Q2_002_partial_09_0889,
  ep_Q2_002_partial_09_0890,
  ep_Q2_002_partial_09_0891,
  ep_Q2_002_partial_09_0892,
  ep_Q2_002_partial_09_0893,
  ep_Q2_002_partial_09_0894,
  ep_Q2_002_partial_09_0895,
  ep_Q2_002_partial_09_0896,
  ep_Q2_002_partial_09_0897,
  ep_Q2_002_partial_09_0898,
  ep_Q2_002_partial_09_0899
]

/-- Sum of partial products in this block. -/
def ep_Q2_002_block_09_0800_0899 : Poly :=
[
  term ((146248375052405512905442859187648 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (13, 2), (14, 1)],
  term ((-376355871989336363652770196342528 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (13, 2), (15, 2)],
  term ((1611219605751365550697957932482544381391776 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (14, 1), (15, 2)],
  term ((158475703364 : Rat) / 22203951735) [(2, 1), (4, 1), (14, 1), (15, 2), (16, 1)],
  term ((155282072812273215479337907989882602500164 : Rat) / 103601401347717117429703636119532782115) [(2, 1), (4, 1), (15, 2)],
  term ((279477504583 : Rat) / 22203951735) [(2, 1), (4, 1), (15, 2), (16, 1)],
  term ((6444878423005462202791831729930177525567104 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (15, 4)],
  term ((633902813456 : Rat) / 22203951735) [(2, 1), (4, 1), (15, 4), (16, 1)],
  term ((8290713400643154168021399431688 : Rat) / 115799135485108289802725034287) [(2, 1), (4, 2), (7, 1), (11, 1)],
  term ((-15612965950245775047301246219296 : Rat) / 115799135485108289802725034287) [(2, 1), (4, 2), (7, 1), (13, 1)],
  term ((-449716229675215903230820593483673026786924 : Rat) / 122438019774574775144195206323084197045) [(2, 1), (4, 2), (7, 1), (15, 1)],
  term ((-190895317587 : Rat) / 7401317245) [(2, 1), (4, 2), (7, 1), (15, 1), (16, 1)],
  term ((-310640109440622316392736689149376 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 2), (11, 1), (12, 1), (15, 1)],
  term ((77660027360155579098184172287344 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 2), (11, 1), (13, 1)],
  term ((29382524941547184682553396442072 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 2), (11, 1), (15, 1)],
  term ((584993500209622051621771436750592 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 2), (12, 1), (13, 1), (15, 1)],
  term ((3709467885651438052561588348460780696555232 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 2), (12, 1), (15, 2)],
  term ((300100471816 : Rat) / 7401317245) [(2, 1), (4, 2), (12, 1), (15, 2), (16, 1)],
  term ((-985872054916671138582567292506392623314648 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 2), (13, 1), (15, 1)],
  term ((-75025117954 : Rat) / 7401317245) [(2, 1), (4, 2), (13, 1), (15, 1), (16, 1)],
  term ((-146248375052405512905442859187648 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 2), (13, 2)],
  term ((238774013691955053428941188327174105526716 : Rat) / 269363643504064505317229453910785233499) [(2, 1), (4, 2), (15, 2)],
  term ((7782778567 : Rat) / 4440790347) [(2, 1), (4, 2), (15, 2), (16, 1)],
  term ((31225931900491550094602492438592 : Rat) / 115799135485108289802725034287) [(2, 1), (5, 1), (6, 1), (7, 1), (11, 1), (13, 1)],
  term ((899432459350431806461641186967346053573848 : Rat) / 122438019774574775144195206323084197045) [(2, 1), (5, 1), (6, 1), (7, 1), (11, 1), (15, 1)],
  term ((381790635174 : Rat) / 7401317245) [(2, 1), (5, 1), (6, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-16581426801286308336042798863376 : Rat) / 115799135485108289802725034287) [(2, 1), (5, 1), (6, 1), (7, 1), (11, 2)],
  term ((-28315712943328338337392870458976 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (6, 1), (8, 1), (11, 1)],
  term ((53323790206862476260917094033792 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (6, 1), (8, 1), (13, 1)],
  term ((143493232074946280623259186363914408714656 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (5, 1), (6, 1), (8, 1), (15, 1)],
  term ((21962661328 : Rat) / 7401317245) [(2, 1), (5, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((255303630167635335278914327647612 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (6, 1), (11, 1)],
  term ((-99925237820159731881977513632992 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (6, 1), (11, 1), (12, 1)],
  term ((23885851508226634290521596596864 : Rat) / 97983883872014706756151952089) [(2, 1), (5, 1), (6, 1), (11, 1), (13, 1), (15, 1)],
  term ((118752189681657664782294491443464 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (6, 1), (11, 1), (14, 1)],
  term ((-477548027383910106857882376654348211053432 : Rat) / 269363643504064505317229453910785233499) [(2, 1), (5, 1), (6, 1), (11, 1), (15, 2)],
  term ((-15565557134 : Rat) / 4440790347) [(2, 1), (5, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((-58765049883094369365106792884144 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (6, 1), (11, 2), (15, 1)],
  term ((188177935994668181826385098171264 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (6, 1), (12, 1), (13, 1)],
  term ((1757874692338054910877506192996314917509568 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (5, 1), (6, 1), (12, 1), (15, 1)],
  term ((112126330424 : Rat) / 7401317245) [(2, 1), (5, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-480784546776422395487415841976304 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (6, 1), (13, 1)],
  term ((-223632612107061684010985645510688 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (6, 1), (13, 1), (14, 1)],
  term ((-3515749384676109821755012385992629835019136 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (5, 1), (6, 1), (13, 1), (15, 2)],
  term ((-224252660848 : Rat) / 7401317245) [(2, 1), (5, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((-376355871989336363652770196342528 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (6, 1), (13, 2), (15, 1)],
  term ((2370606591097039217056346042880725080875204 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (5, 1), (6, 1), (14, 1), (15, 1)],
  term ((-12619833773 : Rat) / 7401317245) [(2, 1), (5, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-113390166372881848342008497060285999633562 : Rat) / 103601401347717117429703636119532782115) [(2, 1), (5, 1), (6, 1), (15, 1)],
  term ((-1231702974353 : Rat) / 44407903470) [(2, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-203708758704620260113778655446344 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (6, 2), (11, 1)],
  term ((383621741547035124459044956815648 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (6, 2), (13, 1)],
  term ((-1597768506442158357568368091457981512309284 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (5, 1), (6, 2), (15, 1)],
  term ((88171245013 : Rat) / 7401317245) [(2, 1), (5, 1), (6, 2), (15, 1), (16, 1)],
  term ((-113272281966290933668877034461856 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (7, 1), (9, 1), (11, 1)],
  term ((453089127865163734675508137847424 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (7, 1), (9, 1), (11, 1), (14, 1)],
  term ((213312919646835916708976405338752 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (7, 1), (9, 1), (13, 1)],
  term ((-853251678587343666835905621355008 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (7, 1), (9, 1), (13, 1), (14, 1)],
  term ((-3665325266919308560444948551146631909122304 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (5, 1), (7, 1), (9, 1), (14, 1), (15, 1)],
  term ((-390056290272 : Rat) / 7401317245) [(2, 1), (5, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((916331316729827140111237137786657977280576 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (5, 1), (7, 1), (9, 1), (15, 1)],
  term ((97514072568 : Rat) / 7401317245) [(2, 1), (5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-271611678272827013485038207261792 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (7, 1), (11, 1), (14, 1), (15, 1)],
  term ((188483291916828633902048342006088 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (7, 1), (11, 1), (15, 1)],
  term ((511495655396046832612059942420864 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (7, 1), (13, 1), (14, 1), (15, 1)],
  term ((-354949336285028624679741558264096 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (7, 1), (13, 1), (15, 1)],
  term ((-2130358008589544476757824121943975349745712 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (5, 1), (7, 1), (14, 1), (15, 2)],
  term ((352684980052 : Rat) / 22203951735) [(2, 1), (5, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((-3220418955820213549204864556198538929586156 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (5, 1), (7, 1), (15, 2)],
  term ((-621943304939 : Rat) / 22203951735) [(2, 1), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((-112510911297545564265543261697776 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (7, 2), (11, 1)],
  term ((814835034818481040455114621785376 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (7, 2), (11, 1), (14, 1)],
  term ((211879116094331598938731248403392 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (7, 2), (13, 1)],
  term ((-1534486966188140497836179827262592 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (7, 2), (13, 1), (14, 1)],
  term ((6391074025768633430273472365831926049237136 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (5, 1), (7, 2), (14, 1), (15, 1)],
  term ((-352684980052 : Rat) / 7401317245) [(2, 1), (5, 1), (7, 2), (14, 1), (15, 1), (16, 1)],
  term ((-6544647032869533293107394619778384806965448 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (5, 1), (7, 2), (15, 1)],
  term ((-102724072574 : Rat) / 7401317245) [(2, 1), (5, 1), (7, 2), (15, 1), (16, 1)],
  term ((4720857189384319776116403847488 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (8, 1), (11, 1)],
  term ((37757427322096977889625678153952 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (8, 1), (11, 1), (14, 1)],
  term ((-8890258171041414654370853872896 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (8, 1), (13, 1)],
  term ((-71104306548945305569658801779584 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (8, 1), (13, 1), (14, 1)],
  term ((-305443772243275713370412379262219325760192 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (5, 1), (8, 1), (14, 1), (15, 1)],
  term ((-32504690856 : Rat) / 7401317245) [(2, 1), (5, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-80975270084164716373576596449152458522768 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (5, 1), (8, 1), (15, 1)],
  term ((-5271014764 : Rat) / 7401317245) [(2, 1), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-151029709288387911558502712615808 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (9, 1), (11, 1), (14, 1), (15, 1)],
  term ((37757427322096977889625678153952 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (9, 1), (11, 1), (15, 1)],
  term ((284417226195781222278635207118336 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((-71104306548945305569658801779584 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (9, 1), (13, 1), (15, 1)],
  term ((1221775088973102853481649517048877303040768 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (5, 1), (9, 1), (14, 1), (15, 2)],
  term ((130018763424 : Rat) / 7401317245) [(2, 1), (5, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-305443772243275713370412379262219325760192 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (5, 1), (9, 1), (15, 2)],
  term ((-32504690856 : Rat) / 7401317245) [(2, 1), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((25115642303551869737723281180542 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (11, 1)],
  term ((5736057393131143011586097338824 : Rat) / 97983883872014706756151952089) [(2, 1), (5, 1), (11, 1), (12, 1)],
  term ((-19467851468285401190004174163488 : Rat) / 97983883872014706756151952089) [(2, 1), (5, 1), (11, 1), (12, 1), (14, 1)],
  term ((-199850475640319463763955027265984 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((6095477384634789896489096114448 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (11, 1), (14, 1)],
  term ((60329084463266493551152918921920 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (11, 1), (14, 1), (15, 2)],
  term ((-73124187526202756452721429593824 : Rat) / 1273790490336191187829975377157) [(4, 1), (13, 2), (14, 1)],
  term ((188177935994668181826385098171264 : Rat) / 1273790490336191187829975377157) [(4, 1), (13, 2), (15, 2)],
  term ((-805609802875682775348978966241272190695888 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (14, 1), (15, 2)],
  term ((-79237851682 : Rat) / 22203951735) [(4, 1), (14, 1), (15, 2), (16, 1)],
  term ((-77641036406136607739668953994941301250082 : Rat) / 103601401347717117429703636119532782115) [(4, 1), (15, 2)],
  term ((-279477504583 : Rat) / 44407903470) [(4, 1), (15, 2), (16, 1)],
  term ((-3222439211502731101395915864965088762783552 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (15, 4)],
  term ((-316951406728 : Rat) / 22203951735) [(4, 1), (15, 4), (16, 1)],
  term ((-4145356700321577084010699715844 : Rat) / 115799135485108289802725034287) [(4, 2), (7, 1), (11, 1)],
  term ((7806482975122887523650623109648 : Rat) / 115799135485108289802725034287) [(4, 2), (7, 1), (13, 1)],
  term ((224858114837607951615410296741836513393462 : Rat) / 122438019774574775144195206323084197045) [(4, 2), (7, 1), (15, 1)],
  term ((190895317587 : Rat) / 14802634490) [(4, 2), (7, 1), (15, 1), (16, 1)],
  term ((155320054720311158196368344574688 : Rat) / 1273790490336191187829975377157) [(4, 2), (11, 1), (12, 1), (15, 1)],
  term ((-38830013680077789549092086143672 : Rat) / 1273790490336191187829975377157) [(4, 2), (11, 1), (13, 1)],
  term ((-14691262470773592341276698221036 : Rat) / 1273790490336191187829975377157) [(4, 2), (11, 1), (15, 1)],
  term ((-292496750104811025810885718375296 : Rat) / 1273790490336191187829975377157) [(4, 2), (12, 1), (13, 1), (15, 1)],
  term ((-1854733942825719026280794174230390348277616 : Rat) / 1346818217520322526586147269553926167495) [(4, 2), (12, 1), (15, 2)],
  term ((-150050235908 : Rat) / 7401317245) [(4, 2), (12, 1), (15, 2), (16, 1)],
  term ((492936027458335569291283646253196311657324 : Rat) / 1346818217520322526586147269553926167495) [(4, 2), (13, 1), (15, 1)],
  term ((37512558977 : Rat) / 7401317245) [(4, 2), (13, 1), (15, 1), (16, 1)],
  term ((73124187526202756452721429593824 : Rat) / 1273790490336191187829975377157) [(4, 2), (13, 2)],
  term ((-119387006845977526714470594163587052763358 : Rat) / 269363643504064505317229453910785233499) [(4, 2), (15, 2)],
  term ((-7782778567 : Rat) / 8881580694) [(4, 2), (15, 2), (16, 1)],
  term ((-15612965950245775047301246219296 : Rat) / 115799135485108289802725034287) [(5, 1), (6, 1), (7, 1), (11, 1), (13, 1)],
  term ((-449716229675215903230820593483673026786924 : Rat) / 122438019774574775144195206323084197045) [(5, 1), (6, 1), (7, 1), (11, 1), (15, 1)],
  term ((-190895317587 : Rat) / 7401317245) [(5, 1), (6, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((8290713400643154168021399431688 : Rat) / 115799135485108289802725034287) [(5, 1), (6, 1), (7, 1), (11, 2)],
  term ((14157856471664169168696435229488 : Rat) / 1273790490336191187829975377157) [(5, 1), (6, 1), (8, 1), (11, 1)],
  term ((-26661895103431238130458547016896 : Rat) / 1273790490336191187829975377157) [(5, 1), (6, 1), (8, 1), (13, 1)],
  term ((-71746616037473140311629593181957204357328 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (6, 1), (8, 1), (15, 1)],
  term ((-10981330664 : Rat) / 7401317245) [(5, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((-127651815083817667639457163823806 : Rat) / 1273790490336191187829975377157) [(5, 1), (6, 1), (11, 1)],
  term ((49962618910079865940988756816496 : Rat) / 1273790490336191187829975377157) [(5, 1), (6, 1), (11, 1), (12, 1)],
  term ((-11942925754113317145260798298432 : Rat) / 97983883872014706756151952089) [(5, 1), (6, 1), (11, 1), (13, 1), (15, 1)],
  term ((-59376094840828832391147245721732 : Rat) / 1273790490336191187829975377157) [(5, 1), (6, 1), (11, 1), (14, 1)],
  term ((238774013691955053428941188327174105526716 : Rat) / 269363643504064505317229453910785233499) [(5, 1), (6, 1), (11, 1), (15, 2)],
  term ((7782778567 : Rat) / 4440790347) [(5, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((29382524941547184682553396442072 : Rat) / 1273790490336191187829975377157) [(5, 1), (6, 1), (11, 2), (15, 1)],
  term ((-94088967997334090913192549085632 : Rat) / 1273790490336191187829975377157) [(5, 1), (6, 1), (12, 1), (13, 1)],
  term ((-878937346169027455438753096498157458754784 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (6, 1), (12, 1), (15, 1)],
  term ((-56063165212 : Rat) / 7401317245) [(5, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((240392273388211197743707920988152 : Rat) / 1273790490336191187829975377157) [(5, 1), (6, 1), (13, 1)],
  term ((111816306053530842005492822755344 : Rat) / 1273790490336191187829975377157) [(5, 1), (6, 1), (13, 1), (14, 1)],
  term ((1757874692338054910877506192996314917509568 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (6, 1), (13, 1), (15, 2)],
  term ((112126330424 : Rat) / 7401317245) [(5, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((188177935994668181826385098171264 : Rat) / 1273790490336191187829975377157) [(5, 1), (6, 1), (13, 2), (15, 1)],
  term ((-1185303295548519608528173021440362540437602 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (6, 1), (14, 1), (15, 1)],
  term ((12619833773 : Rat) / 14802634490) [(5, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((56695083186440924171004248530142999816781 : Rat) / 103601401347717117429703636119532782115) [(5, 1), (6, 1), (15, 1)],
  term ((1231702974353 : Rat) / 88815806940) [(5, 1), (6, 1), (15, 1), (16, 1)],
  term ((101854379352310130056889327723172 : Rat) / 1273790490336191187829975377157) [(5, 1), (6, 2), (11, 1)],
  term ((-191810870773517562229522478407824 : Rat) / 1273790490336191187829975377157) [(5, 1), (6, 2), (13, 1)],
  term ((798884253221079178784184045728990756154642 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (6, 2), (15, 1)],
  term ((-88171245013 : Rat) / 14802634490) [(5, 1), (6, 2), (15, 1), (16, 1)],
  term ((56636140983145466834438517230928 : Rat) / 1273790490336191187829975377157) [(5, 1), (7, 1), (9, 1), (11, 1)],
  term ((-226544563932581867337754068923712 : Rat) / 1273790490336191187829975377157) [(5, 1), (7, 1), (9, 1), (11, 1), (14, 1)],
  term ((-106656459823417958354488202669376 : Rat) / 1273790490336191187829975377157) [(5, 1), (7, 1), (9, 1), (13, 1)],
  term ((426625839293671833417952810677504 : Rat) / 1273790490336191187829975377157) [(5, 1), (7, 1), (9, 1), (13, 1), (14, 1)],
  term ((1832662633459654280222474275573315954561152 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (7, 1), (9, 1), (14, 1), (15, 1)],
  term ((195028145136 : Rat) / 7401317245) [(5, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-458165658364913570055618568893328988640288 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (7, 1), (9, 1), (15, 1)],
  term ((-48757036284 : Rat) / 7401317245) [(5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((135805839136413506742519103630896 : Rat) / 1273790490336191187829975377157) [(5, 1), (7, 1), (11, 1), (14, 1), (15, 1)],
  term ((-94241645958414316951024171003044 : Rat) / 1273790490336191187829975377157) [(5, 1), (7, 1), (11, 1), (15, 1)],
  term ((-255747827698023416306029971210432 : Rat) / 1273790490336191187829975377157) [(5, 1), (7, 1), (13, 1), (14, 1), (15, 1)],
  term ((177474668142514312339870779132048 : Rat) / 1273790490336191187829975377157) [(5, 1), (7, 1), (13, 1), (15, 1)],
  term ((1065179004294772238378912060971987674872856 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (7, 1), (14, 1), (15, 2)],
  term ((-176342490026 : Rat) / 22203951735) [(5, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((1610209477910106774602432278099269464793078 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (7, 1), (15, 2)],
  term ((621943304939 : Rat) / 44407903470) [(5, 1), (7, 1), (15, 2), (16, 1)],
  term ((56255455648772782132771630848888 : Rat) / 1273790490336191187829975377157) [(5, 1), (7, 2), (11, 1)],
  term ((-407417517409240520227557310892688 : Rat) / 1273790490336191187829975377157) [(5, 1), (7, 2), (11, 1), (14, 1)],
  term ((-105939558047165799469365624201696 : Rat) / 1273790490336191187829975377157) [(5, 1), (7, 2), (13, 1)],
  term ((767243483094070248918089913631296 : Rat) / 1273790490336191187829975377157) [(5, 1), (7, 2), (13, 1), (14, 1)],
  term ((-3195537012884316715136736182915963024618568 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (7, 2), (14, 1), (15, 1)],
  term ((176342490026 : Rat) / 7401317245) [(5, 1), (7, 2), (14, 1), (15, 1), (16, 1)],
  term ((3272323516434766646553697309889192403482724 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (7, 2), (15, 1)],
  term ((51362036287 : Rat) / 7401317245) [(5, 1), (7, 2), (15, 1), (16, 1)],
  term ((-2360428594692159888058201923744 : Rat) / 1273790490336191187829975377157) [(5, 1), (8, 1), (11, 1)],
  term ((-18878713661048488944812839076976 : Rat) / 1273790490336191187829975377157) [(5, 1), (8, 1), (11, 1), (14, 1)],
  term ((4445129085520707327185426936448 : Rat) / 1273790490336191187829975377157) [(5, 1), (8, 1), (13, 1)],
  term ((35552153274472652784829400889792 : Rat) / 1273790490336191187829975377157) [(5, 1), (8, 1), (13, 1), (14, 1)],
  term ((152721886121637856685206189631109662880096 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (8, 1), (14, 1), (15, 1)],
  term ((16252345428 : Rat) / 7401317245) [(5, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((40487635042082358186788298224576229261384 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (8, 1), (15, 1)],
  term ((2635507382 : Rat) / 7401317245) [(5, 1), (8, 1), (15, 1), (16, 1)],
  term ((75514854644193955779251356307904 : Rat) / 1273790490336191187829975377157) [(5, 1), (9, 1), (11, 1), (14, 1), (15, 1)],
  term ((-18878713661048488944812839076976 : Rat) / 1273790490336191187829975377157) [(5, 1), (9, 1), (11, 1), (15, 1)],
  term ((-142208613097890611139317603559168 : Rat) / 1273790490336191187829975377157) [(5, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((35552153274472652784829400889792 : Rat) / 1273790490336191187829975377157) [(5, 1), (9, 1), (13, 1), (15, 1)],
  term ((-610887544486551426740824758524438651520384 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (9, 1), (14, 1), (15, 2)],
  term ((-65009381712 : Rat) / 7401317245) [(5, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((152721886121637856685206189631109662880096 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (9, 1), (15, 2)],
  term ((16252345428 : Rat) / 7401317245) [(5, 1), (9, 1), (15, 2), (16, 1)],
  term ((-12557821151775934868861640590271 : Rat) / 1273790490336191187829975377157) [(5, 1), (11, 1)],
  term ((-2868028696565571505793048669412 : Rat) / 97983883872014706756151952089) [(5, 1), (11, 1), (12, 1)],
  term ((9733925734142700595002087081744 : Rat) / 97983883872014706756151952089) [(5, 1), (11, 1), (12, 1), (14, 1)],
  term ((99925237820159731881977513632992 : Rat) / 1273790490336191187829975377157) [(5, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-3047738692317394948244548057224 : Rat) / 1273790490336191187829975377157) [(5, 1), (11, 1), (14, 1)],
  term ((-30164542231633246775576459460960 : Rat) / 1273790490336191187829975377157) [(5, 1), (11, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 9, terms 800 through 899. -/
theorem ep_Q2_002_block_09_0800_0899_valid :
    checkProductSumEq ep_Q2_002_partials_09_0800_0899
      ep_Q2_002_block_09_0800_0899 = true := by
  native_decide

end EpQ2002TermShards

end Patterns

end EndpointCertificate

end Problem97
