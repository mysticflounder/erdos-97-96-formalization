/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_002, term block 9:600-699

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_002`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2002TermShards

/-- Generator polynomial 9 for endpoint certificate `ep_Q2_002`. -/
def ep_Q2_002_generator_09_0600_0699 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(2, 1)]
]

/-- Coefficient term 600 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0600 : Poly :=
[
  term ((366644536219253669652003055641627229025319 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (4, 1), (15, 1)]
]

/-- Partial product 600 for generator 9. -/
def ep_Q2_002_partial_09_0600 : Poly :=
[
  term ((733289072438507339304006111283254458050638 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (3, 1), (4, 1), (15, 1)],
  term ((-366644536219253669652003055641627229025319 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (4, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 600 for generator 9. -/
theorem ep_Q2_002_partial_09_0600_valid :
    mulPoly ep_Q2_002_coefficient_09_0600
        ep_Q2_002_generator_09_0600_0699 =
      ep_Q2_002_partial_09_0600 := by
  native_decide

/-- Coefficient term 601 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0601 : Poly :=
[
  term ((313631849579 : Rat) / 88815806940) [(3, 1), (4, 1), (15, 1), (16, 1)]
]

/-- Partial product 601 for generator 9. -/
def ep_Q2_002_partial_09_0601 : Poly :=
[
  term ((313631849579 : Rat) / 44407903470) [(2, 1), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((-313631849579 : Rat) / 88815806940) [(3, 1), (4, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 601 for generator 9. -/
theorem ep_Q2_002_partial_09_0601_valid :
    mulPoly ep_Q2_002_coefficient_09_0601
        ep_Q2_002_generator_09_0600_0699 =
      ep_Q2_002_partial_09_0601 := by
  native_decide

/-- Coefficient term 602 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0602 : Poly :=
[
  term ((-1611219605751365550697957932482544381391776 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (4, 1), (15, 3)]
]

/-- Partial product 602 for generator 9. -/
def ep_Q2_002_partial_09_0602 : Poly :=
[
  term ((-3222439211502731101395915864965088762783552 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (3, 1), (4, 1), (15, 3)],
  term ((1611219605751365550697957932482544381391776 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (4, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 602 for generator 9. -/
theorem ep_Q2_002_partial_09_0602_valid :
    mulPoly ep_Q2_002_coefficient_09_0602
        ep_Q2_002_generator_09_0600_0699 =
      ep_Q2_002_partial_09_0602 := by
  native_decide

/-- Coefficient term 603 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0603 : Poly :=
[
  term ((-158475703364 : Rat) / 22203951735) [(3, 1), (4, 1), (15, 3), (16, 1)]
]

/-- Partial product 603 for generator 9. -/
def ep_Q2_002_partial_09_0603 : Poly :=
[
  term ((-316951406728 : Rat) / 22203951735) [(2, 1), (3, 1), (4, 1), (15, 3), (16, 1)],
  term ((158475703364 : Rat) / 22203951735) [(3, 1), (4, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 603 for generator 9. -/
theorem ep_Q2_002_partial_09_0603_valid :
    mulPoly ep_Q2_002_coefficient_09_0603
        ep_Q2_002_generator_09_0600_0699 =
      ep_Q2_002_partial_09_0603 := by
  native_decide

/-- Coefficient term 604 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0604 : Poly :=
[
  term ((-30145093087155470132697197547660 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 2), (11, 1)]
]

/-- Partial product 604 for generator 9. -/
def ep_Q2_002_partial_09_0604 : Poly :=
[
  term ((-60290186174310940265394395095320 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (4, 2), (11, 1)],
  term ((30145093087155470132697197547660 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 604 for generator 9. -/
theorem ep_Q2_002_partial_09_0604_valid :
    mulPoly ep_Q2_002_coefficient_09_0604
        ep_Q2_002_generator_09_0600_0699 =
      ep_Q2_002_partial_09_0604 := by
  native_decide

/-- Coefficient term 605 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0605 : Poly :=
[
  term ((77660027360155579098184172287344 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 2), (11, 1), (12, 1)]
]

/-- Partial product 605 for generator 9. -/
def ep_Q2_002_partial_09_0605 : Poly :=
[
  term ((155320054720311158196368344574688 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (4, 2), (11, 1), (12, 1)],
  term ((-77660027360155579098184172287344 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 2), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 605 for generator 9. -/
theorem ep_Q2_002_partial_09_0605_valid :
    mulPoly ep_Q2_002_coefficient_09_0605
        ep_Q2_002_generator_09_0600_0699 =
      ep_Q2_002_partial_09_0605 := by
  native_decide

/-- Coefficient term 606 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0606 : Poly :=
[
  term ((-146248375052405512905442859187648 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 2), (12, 1), (13, 1)]
]

/-- Partial product 606 for generator 9. -/
def ep_Q2_002_partial_09_0606 : Poly :=
[
  term ((-292496750104811025810885718375296 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (4, 2), (12, 1), (13, 1)],
  term ((146248375052405512905442859187648 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 2), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 606 for generator 9. -/
theorem ep_Q2_002_partial_09_0606_valid :
    mulPoly ep_Q2_002_coefficient_09_0606
        ep_Q2_002_generator_09_0600_0699 =
      ep_Q2_002_partial_09_0606 := by
  native_decide

/-- Coefficient term 607 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0607 : Poly :=
[
  term ((-927366971412859513140397087115195174138808 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (4, 2), (12, 1), (15, 1)]
]

/-- Partial product 607 for generator 9. -/
def ep_Q2_002_partial_09_0607 : Poly :=
[
  term ((-1854733942825719026280794174230390348277616 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (3, 1), (4, 2), (12, 1), (15, 1)],
  term ((927366971412859513140397087115195174138808 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (4, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 607 for generator 9. -/
theorem ep_Q2_002_partial_09_0607_valid :
    mulPoly ep_Q2_002_coefficient_09_0607
        ep_Q2_002_generator_09_0600_0699 =
      ep_Q2_002_partial_09_0607 := by
  native_decide

/-- Coefficient term 608 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0608 : Poly :=
[
  term ((-75025117954 : Rat) / 7401317245) [(3, 1), (4, 2), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 608 for generator 9. -/
def ep_Q2_002_partial_09_0608 : Poly :=
[
  term ((-150050235908 : Rat) / 7401317245) [(2, 1), (3, 1), (4, 2), (12, 1), (15, 1), (16, 1)],
  term ((75025117954 : Rat) / 7401317245) [(3, 1), (4, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 608 for generator 9. -/
theorem ep_Q2_002_partial_09_0608_valid :
    mulPoly ep_Q2_002_coefficient_09_0608
        ep_Q2_002_generator_09_0600_0699 =
      ep_Q2_002_partial_09_0608 := by
  native_decide

/-- Coefficient term 609 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0609 : Poly :=
[
  term ((56768855609004229131681643164720 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 2), (13, 1)]
]

/-- Partial product 609 for generator 9. -/
def ep_Q2_002_partial_09_0609 : Poly :=
[
  term ((113537711218008458263363286329440 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (4, 2), (13, 1)],
  term ((-56768855609004229131681643164720 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 609 for generator 9. -/
theorem ep_Q2_002_partial_09_0609_valid :
    mulPoly ep_Q2_002_coefficient_09_0609
        ep_Q2_002_generator_09_0600_0699 =
      ep_Q2_002_partial_09_0609 := by
  native_decide

/-- Coefficient term 610 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0610 : Poly :=
[
  term ((938252114491899917098580146671133191755646 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (4, 2), (15, 1)]
]

/-- Partial product 610 for generator 9. -/
def ep_Q2_002_partial_09_0610 : Poly :=
[
  term ((1876504228983799834197160293342266383511292 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (3, 1), (4, 2), (15, 1)],
  term ((-938252114491899917098580146671133191755646 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (4, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 610 for generator 9. -/
theorem ep_Q2_002_partial_09_0610_valid :
    mulPoly ep_Q2_002_coefficient_09_0610
        ep_Q2_002_generator_09_0600_0699 =
      ep_Q2_002_partial_09_0610 := by
  native_decide

/-- Coefficient term 611 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0611 : Poly :=
[
  term ((38126575709 : Rat) / 6343986210) [(3, 1), (4, 2), (15, 1), (16, 1)]
]

/-- Partial product 611 for generator 9. -/
def ep_Q2_002_partial_09_0611 : Poly :=
[
  term ((38126575709 : Rat) / 3171993105) [(2, 1), (3, 1), (4, 2), (15, 1), (16, 1)],
  term ((-38126575709 : Rat) / 6343986210) [(3, 1), (4, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 611 for generator 9. -/
theorem ep_Q2_002_partial_09_0611_valid :
    mulPoly ep_Q2_002_coefficient_09_0611
        ep_Q2_002_generator_09_0600_0699 =
      ep_Q2_002_partial_09_0611 := by
  native_decide

/-- Coefficient term 612 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0612 : Poly :=
[
  term ((-8290713400643154168021399431688 : Rat) / 115799135485108289802725034287) [(3, 1), (5, 1), (6, 1), (7, 1), (11, 1)]
]

/-- Partial product 612 for generator 9. -/
def ep_Q2_002_partial_09_0612 : Poly :=
[
  term ((-16581426801286308336042798863376 : Rat) / 115799135485108289802725034287) [(2, 1), (3, 1), (5, 1), (6, 1), (7, 1), (11, 1)],
  term ((8290713400643154168021399431688 : Rat) / 115799135485108289802725034287) [(3, 1), (5, 1), (6, 1), (7, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 612 for generator 9. -/
theorem ep_Q2_002_partial_09_0612_valid :
    mulPoly ep_Q2_002_coefficient_09_0612
        ep_Q2_002_generator_09_0600_0699 =
      ep_Q2_002_partial_09_0612 := by
  native_decide

/-- Coefficient term 613 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0613 : Poly :=
[
  term ((15612965950245775047301246219296 : Rat) / 115799135485108289802725034287) [(3, 1), (5, 1), (6, 1), (7, 1), (13, 1)]
]

/-- Partial product 613 for generator 9. -/
def ep_Q2_002_partial_09_0613 : Poly :=
[
  term ((31225931900491550094602492438592 : Rat) / 115799135485108289802725034287) [(2, 1), (3, 1), (5, 1), (6, 1), (7, 1), (13, 1)],
  term ((-15612965950245775047301246219296 : Rat) / 115799135485108289802725034287) [(3, 1), (5, 1), (6, 1), (7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 613 for generator 9. -/
theorem ep_Q2_002_partial_09_0613_valid :
    mulPoly ep_Q2_002_coefficient_09_0613
        ep_Q2_002_generator_09_0600_0699 =
      ep_Q2_002_partial_09_0613 := by
  native_decide

/-- Coefficient term 614 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0614 : Poly :=
[
  term ((449716229675215903230820593483673026786924 : Rat) / 122438019774574775144195206323084197045) [(3, 1), (5, 1), (6, 1), (7, 1), (15, 1)]
]

/-- Partial product 614 for generator 9. -/
def ep_Q2_002_partial_09_0614 : Poly :=
[
  term ((899432459350431806461641186967346053573848 : Rat) / 122438019774574775144195206323084197045) [(2, 1), (3, 1), (5, 1), (6, 1), (7, 1), (15, 1)],
  term ((-449716229675215903230820593483673026786924 : Rat) / 122438019774574775144195206323084197045) [(3, 1), (5, 1), (6, 1), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 614 for generator 9. -/
theorem ep_Q2_002_partial_09_0614_valid :
    mulPoly ep_Q2_002_coefficient_09_0614
        ep_Q2_002_generator_09_0600_0699 =
      ep_Q2_002_partial_09_0614 := by
  native_decide

/-- Coefficient term 615 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0615 : Poly :=
[
  term ((190895317587 : Rat) / 7401317245) [(3, 1), (5, 1), (6, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 615 for generator 9. -/
def ep_Q2_002_partial_09_0615 : Poly :=
[
  term ((381790635174 : Rat) / 7401317245) [(2, 1), (3, 1), (5, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-190895317587 : Rat) / 7401317245) [(3, 1), (5, 1), (6, 1), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 615 for generator 9. -/
theorem ep_Q2_002_partial_09_0615_valid :
    mulPoly ep_Q2_002_coefficient_09_0615
        ep_Q2_002_generator_09_0600_0699 =
      ep_Q2_002_partial_09_0615 := by
  native_decide

/-- Coefficient term 616 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0616 : Poly :=
[
  term ((-29382524941547184682553396442072 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (6, 1), (11, 1), (15, 1)]
]

/-- Partial product 616 for generator 9. -/
def ep_Q2_002_partial_09_0616 : Poly :=
[
  term ((-58765049883094369365106792884144 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (5, 1), (6, 1), (11, 1), (15, 1)],
  term ((29382524941547184682553396442072 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (6, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 616 for generator 9. -/
theorem ep_Q2_002_partial_09_0616_valid :
    mulPoly ep_Q2_002_coefficient_09_0616
        ep_Q2_002_generator_09_0600_0699 =
      ep_Q2_002_partial_09_0616 := by
  native_decide

/-- Coefficient term 617 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0617 : Poly :=
[
  term ((55332796983313391006412864246624 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (6, 1), (13, 1), (15, 1)]
]

/-- Partial product 617 for generator 9. -/
def ep_Q2_002_partial_09_0617 : Poly :=
[
  term ((110665593966626782012825728493248 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (5, 1), (6, 1), (13, 1), (15, 1)],
  term ((-55332796983313391006412864246624 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (6, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 617 for generator 9. -/
theorem ep_Q2_002_partial_09_0617_valid :
    mulPoly ep_Q2_002_coefficient_09_0617
        ep_Q2_002_generator_09_0600_0699 =
      ep_Q2_002_partial_09_0617 := by
  native_decide

/-- Coefficient term 618 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0618 : Poly :=
[
  term ((-238774013691955053428941188327174105526716 : Rat) / 269363643504064505317229453910785233499) [(3, 1), (5, 1), (6, 1), (15, 2)]
]

/-- Partial product 618 for generator 9. -/
def ep_Q2_002_partial_09_0618 : Poly :=
[
  term ((-477548027383910106857882376654348211053432 : Rat) / 269363643504064505317229453910785233499) [(2, 1), (3, 1), (5, 1), (6, 1), (15, 2)],
  term ((238774013691955053428941188327174105526716 : Rat) / 269363643504064505317229453910785233499) [(3, 1), (5, 1), (6, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 618 for generator 9. -/
theorem ep_Q2_002_partial_09_0618_valid :
    mulPoly ep_Q2_002_coefficient_09_0618
        ep_Q2_002_generator_09_0600_0699 =
      ep_Q2_002_partial_09_0618 := by
  native_decide

/-- Coefficient term 619 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0619 : Poly :=
[
  term ((-7782778567 : Rat) / 4440790347) [(3, 1), (5, 1), (6, 1), (15, 2), (16, 1)]
]

/-- Partial product 619 for generator 9. -/
def ep_Q2_002_partial_09_0619 : Poly :=
[
  term ((-15565557134 : Rat) / 4440790347) [(2, 1), (3, 1), (5, 1), (6, 1), (15, 2), (16, 1)],
  term ((7782778567 : Rat) / 4440790347) [(3, 1), (5, 1), (6, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 619 for generator 9. -/
theorem ep_Q2_002_partial_09_0619_valid :
    mulPoly ep_Q2_002_coefficient_09_0619
        ep_Q2_002_generator_09_0600_0699 =
      ep_Q2_002_partial_09_0619 := by
  native_decide

/-- Coefficient term 620 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0620 : Poly :=
[
  term ((-8290713400643154168021399431688 : Rat) / 115799135485108289802725034287) [(3, 1), (5, 1), (7, 1), (11, 1), (14, 1)]
]

/-- Partial product 620 for generator 9. -/
def ep_Q2_002_partial_09_0620 : Poly :=
[
  term ((-16581426801286308336042798863376 : Rat) / 115799135485108289802725034287) [(2, 1), (3, 1), (5, 1), (7, 1), (11, 1), (14, 1)],
  term ((8290713400643154168021399431688 : Rat) / 115799135485108289802725034287) [(3, 1), (5, 1), (7, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 620 for generator 9. -/
theorem ep_Q2_002_partial_09_0620_valid :
    mulPoly ep_Q2_002_coefficient_09_0620
        ep_Q2_002_generator_09_0600_0699 =
      ep_Q2_002_partial_09_0620 := by
  native_decide

/-- Coefficient term 621 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0621 : Poly :=
[
  term ((15612965950245775047301246219296 : Rat) / 115799135485108289802725034287) [(3, 1), (5, 1), (7, 1), (13, 1), (14, 1)]
]

/-- Partial product 621 for generator 9. -/
def ep_Q2_002_partial_09_0621 : Poly :=
[
  term ((31225931900491550094602492438592 : Rat) / 115799135485108289802725034287) [(2, 1), (3, 1), (5, 1), (7, 1), (13, 1), (14, 1)],
  term ((-15612965950245775047301246219296 : Rat) / 115799135485108289802725034287) [(3, 1), (5, 1), (7, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 621 for generator 9. -/
theorem ep_Q2_002_partial_09_0621_valid :
    mulPoly ep_Q2_002_coefficient_09_0621
        ep_Q2_002_generator_09_0600_0699 =
      ep_Q2_002_partial_09_0621 := by
  native_decide

/-- Coefficient term 622 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0622 : Poly :=
[
  term ((449716229675215903230820593483673026786924 : Rat) / 122438019774574775144195206323084197045) [(3, 1), (5, 1), (7, 1), (14, 1), (15, 1)]
]

/-- Partial product 622 for generator 9. -/
def ep_Q2_002_partial_09_0622 : Poly :=
[
  term ((899432459350431806461641186967346053573848 : Rat) / 122438019774574775144195206323084197045) [(2, 1), (3, 1), (5, 1), (7, 1), (14, 1), (15, 1)],
  term ((-449716229675215903230820593483673026786924 : Rat) / 122438019774574775144195206323084197045) [(3, 1), (5, 1), (7, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 622 for generator 9. -/
theorem ep_Q2_002_partial_09_0622_valid :
    mulPoly ep_Q2_002_coefficient_09_0622
        ep_Q2_002_generator_09_0600_0699 =
      ep_Q2_002_partial_09_0622 := by
  native_decide

/-- Coefficient term 623 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0623 : Poly :=
[
  term ((190895317587 : Rat) / 7401317245) [(3, 1), (5, 1), (7, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 623 for generator 9. -/
def ep_Q2_002_partial_09_0623 : Poly :=
[
  term ((381790635174 : Rat) / 7401317245) [(2, 1), (3, 1), (5, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-190895317587 : Rat) / 7401317245) [(3, 1), (5, 1), (7, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 623 for generator 9. -/
theorem ep_Q2_002_partial_09_0623_valid :
    mulPoly ep_Q2_002_coefficient_09_0623
        ep_Q2_002_generator_09_0600_0699 =
      ep_Q2_002_partial_09_0623 := by
  native_decide

/-- Coefficient term 624 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0624 : Poly :=
[
  term ((-29382524941547184682553396442072 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 624 for generator 9. -/
def ep_Q2_002_partial_09_0624 : Poly :=
[
  term ((-58765049883094369365106792884144 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (5, 1), (11, 1), (14, 1), (15, 1)],
  term ((29382524941547184682553396442072 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 624 for generator 9. -/
theorem ep_Q2_002_partial_09_0624_valid :
    mulPoly ep_Q2_002_coefficient_09_0624
        ep_Q2_002_generator_09_0600_0699 =
      ep_Q2_002_partial_09_0624 := by
  native_decide

/-- Coefficient term 625 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0625 : Poly :=
[
  term ((55332796983313391006412864246624 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 625 for generator 9. -/
def ep_Q2_002_partial_09_0625 : Poly :=
[
  term ((110665593966626782012825728493248 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (5, 1), (13, 1), (14, 1), (15, 1)],
  term ((-55332796983313391006412864246624 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 625 for generator 9. -/
theorem ep_Q2_002_partial_09_0625_valid :
    mulPoly ep_Q2_002_coefficient_09_0625
        ep_Q2_002_generator_09_0600_0699 =
      ep_Q2_002_partial_09_0625 := by
  native_decide

/-- Coefficient term 626 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0626 : Poly :=
[
  term ((-238774013691955053428941188327174105526716 : Rat) / 269363643504064505317229453910785233499) [(3, 1), (5, 1), (14, 1), (15, 2)]
]

/-- Partial product 626 for generator 9. -/
def ep_Q2_002_partial_09_0626 : Poly :=
[
  term ((-477548027383910106857882376654348211053432 : Rat) / 269363643504064505317229453910785233499) [(2, 1), (3, 1), (5, 1), (14, 1), (15, 2)],
  term ((238774013691955053428941188327174105526716 : Rat) / 269363643504064505317229453910785233499) [(3, 1), (5, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 626 for generator 9. -/
theorem ep_Q2_002_partial_09_0626_valid :
    mulPoly ep_Q2_002_coefficient_09_0626
        ep_Q2_002_generator_09_0600_0699 =
      ep_Q2_002_partial_09_0626 := by
  native_decide

/-- Coefficient term 627 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0627 : Poly :=
[
  term ((-7782778567 : Rat) / 4440790347) [(3, 1), (5, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 627 for generator 9. -/
def ep_Q2_002_partial_09_0627 : Poly :=
[
  term ((-15565557134 : Rat) / 4440790347) [(2, 1), (3, 1), (5, 1), (14, 1), (15, 2), (16, 1)],
  term ((7782778567 : Rat) / 4440790347) [(3, 1), (5, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 627 for generator 9. -/
theorem ep_Q2_002_partial_09_0627_valid :
    mulPoly ep_Q2_002_coefficient_09_0627
        ep_Q2_002_generator_09_0600_0699 =
      ep_Q2_002_partial_09_0627 := by
  native_decide

/-- Coefficient term 628 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0628 : Poly :=
[
  term ((-113272281966290933668877034461856 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (7, 1), (9, 1), (11, 1)]
]

/-- Partial product 628 for generator 9. -/
def ep_Q2_002_partial_09_0628 : Poly :=
[
  term ((-226544563932581867337754068923712 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (6, 1), (7, 1), (9, 1), (11, 1)],
  term ((113272281966290933668877034461856 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (7, 1), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 628 for generator 9. -/
theorem ep_Q2_002_partial_09_0628_valid :
    mulPoly ep_Q2_002_coefficient_09_0628
        ep_Q2_002_generator_09_0600_0699 =
      ep_Q2_002_partial_09_0628 := by
  native_decide

/-- Coefficient term 629 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0629 : Poly :=
[
  term ((213312919646835916708976405338752 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (7, 1), (9, 1), (13, 1)]
]

/-- Partial product 629 for generator 9. -/
def ep_Q2_002_partial_09_0629 : Poly :=
[
  term ((426625839293671833417952810677504 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (6, 1), (7, 1), (9, 1), (13, 1)],
  term ((-213312919646835916708976405338752 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (7, 1), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 629 for generator 9. -/
theorem ep_Q2_002_partial_09_0629_valid :
    mulPoly ep_Q2_002_coefficient_09_0629
        ep_Q2_002_generator_09_0600_0699 =
      ep_Q2_002_partial_09_0629 := by
  native_decide

/-- Coefficient term 630 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0630 : Poly :=
[
  term ((916331316729827140111237137786657977280576 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (6, 1), (7, 1), (9, 1), (15, 1)]
]

/-- Partial product 630 for generator 9. -/
def ep_Q2_002_partial_09_0630 : Poly :=
[
  term ((1832662633459654280222474275573315954561152 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (3, 1), (6, 1), (7, 1), (9, 1), (15, 1)],
  term ((-916331316729827140111237137786657977280576 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (6, 1), (7, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 630 for generator 9. -/
theorem ep_Q2_002_partial_09_0630_valid :
    mulPoly ep_Q2_002_coefficient_09_0630
        ep_Q2_002_generator_09_0600_0699 =
      ep_Q2_002_partial_09_0630 := by
  native_decide

/-- Coefficient term 631 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0631 : Poly :=
[
  term ((97514072568 : Rat) / 7401317245) [(3, 1), (6, 1), (7, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 631 for generator 9. -/
def ep_Q2_002_partial_09_0631 : Poly :=
[
  term ((195028145136 : Rat) / 7401317245) [(2, 1), (3, 1), (6, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-97514072568 : Rat) / 7401317245) [(3, 1), (6, 1), (7, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 631 for generator 9. -/
theorem ep_Q2_002_partial_09_0631_valid :
    mulPoly ep_Q2_002_coefficient_09_0631
        ep_Q2_002_generator_09_0600_0699 =
      ep_Q2_002_partial_09_0631 := by
  native_decide

/-- Coefficient term 632 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0632 : Poly :=
[
  term ((67902919568206753371259551815448 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (7, 1), (11, 1), (15, 1)]
]

/-- Partial product 632 for generator 9. -/
def ep_Q2_002_partial_09_0632 : Poly :=
[
  term ((135805839136413506742519103630896 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (6, 1), (7, 1), (11, 1), (15, 1)],
  term ((-67902919568206753371259551815448 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (7, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 632 for generator 9. -/
theorem ep_Q2_002_partial_09_0632_valid :
    mulPoly ep_Q2_002_coefficient_09_0632
        ep_Q2_002_generator_09_0600_0699 =
      ep_Q2_002_partial_09_0632 := by
  native_decide

/-- Coefficient term 633 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0633 : Poly :=
[
  term ((-127873913849011708153014985605216 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (7, 1), (13, 1), (15, 1)]
]

/-- Partial product 633 for generator 9. -/
def ep_Q2_002_partial_09_0633 : Poly :=
[
  term ((-255747827698023416306029971210432 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (6, 1), (7, 1), (13, 1), (15, 1)],
  term ((127873913849011708153014985605216 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (7, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 633 for generator 9. -/
theorem ep_Q2_002_partial_09_0633_valid :
    mulPoly ep_Q2_002_coefficient_09_0633
        ep_Q2_002_generator_09_0600_0699 =
      ep_Q2_002_partial_09_0633 := by
  native_decide

/-- Coefficient term 634 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0634 : Poly :=
[
  term ((532589502147386119189456030485993837436428 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (6, 1), (7, 1), (15, 2)]
]

/-- Partial product 634 for generator 9. -/
def ep_Q2_002_partial_09_0634 : Poly :=
[
  term ((1065179004294772238378912060971987674872856 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (3, 1), (6, 1), (7, 1), (15, 2)],
  term ((-532589502147386119189456030485993837436428 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (6, 1), (7, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 634 for generator 9. -/
theorem ep_Q2_002_partial_09_0634_valid :
    mulPoly ep_Q2_002_coefficient_09_0634
        ep_Q2_002_generator_09_0600_0699 =
      ep_Q2_002_partial_09_0634 := by
  native_decide

/-- Coefficient term 635 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0635 : Poly :=
[
  term ((-88171245013 : Rat) / 22203951735) [(3, 1), (6, 1), (7, 1), (15, 2), (16, 1)]
]

/-- Partial product 635 for generator 9. -/
def ep_Q2_002_partial_09_0635 : Poly :=
[
  term ((-176342490026 : Rat) / 22203951735) [(2, 1), (3, 1), (6, 1), (7, 1), (15, 2), (16, 1)],
  term ((88171245013 : Rat) / 22203951735) [(3, 1), (6, 1), (7, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 635 for generator 9. -/
theorem ep_Q2_002_partial_09_0635_valid :
    mulPoly ep_Q2_002_coefficient_09_0635
        ep_Q2_002_generator_09_0600_0699 =
      ep_Q2_002_partial_09_0635 := by
  native_decide

/-- Coefficient term 636 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0636 : Poly :=
[
  term ((-203708758704620260113778655446344 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (7, 2), (11, 1)]
]

/-- Partial product 636 for generator 9. -/
def ep_Q2_002_partial_09_0636 : Poly :=
[
  term ((-407417517409240520227557310892688 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (6, 1), (7, 2), (11, 1)],
  term ((203708758704620260113778655446344 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (7, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 636 for generator 9. -/
theorem ep_Q2_002_partial_09_0636_valid :
    mulPoly ep_Q2_002_coefficient_09_0636
        ep_Q2_002_generator_09_0600_0699 =
      ep_Q2_002_partial_09_0636 := by
  native_decide

/-- Coefficient term 637 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0637 : Poly :=
[
  term ((383621741547035124459044956815648 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (7, 2), (13, 1)]
]

/-- Partial product 637 for generator 9. -/
def ep_Q2_002_partial_09_0637 : Poly :=
[
  term ((767243483094070248918089913631296 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (6, 1), (7, 2), (13, 1)],
  term ((-383621741547035124459044956815648 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (7, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 637 for generator 9. -/
theorem ep_Q2_002_partial_09_0637_valid :
    mulPoly ep_Q2_002_coefficient_09_0637
        ep_Q2_002_generator_09_0600_0699 =
      ep_Q2_002_partial_09_0637 := by
  native_decide

/-- Coefficient term 638 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0638 : Poly :=
[
  term ((-1597768506442158357568368091457981512309284 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (6, 1), (7, 2), (15, 1)]
]

/-- Partial product 638 for generator 9. -/
def ep_Q2_002_partial_09_0638 : Poly :=
[
  term ((-3195537012884316715136736182915963024618568 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (3, 1), (6, 1), (7, 2), (15, 1)],
  term ((1597768506442158357568368091457981512309284 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (6, 1), (7, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 638 for generator 9. -/
theorem ep_Q2_002_partial_09_0638_valid :
    mulPoly ep_Q2_002_coefficient_09_0638
        ep_Q2_002_generator_09_0600_0699 =
      ep_Q2_002_partial_09_0638 := by
  native_decide

/-- Coefficient term 639 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0639 : Poly :=
[
  term ((88171245013 : Rat) / 7401317245) [(3, 1), (6, 1), (7, 2), (15, 1), (16, 1)]
]

/-- Partial product 639 for generator 9. -/
def ep_Q2_002_partial_09_0639 : Poly :=
[
  term ((176342490026 : Rat) / 7401317245) [(2, 1), (3, 1), (6, 1), (7, 2), (15, 1), (16, 1)],
  term ((-88171245013 : Rat) / 7401317245) [(3, 1), (6, 1), (7, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 639 for generator 9. -/
theorem ep_Q2_002_partial_09_0639_valid :
    mulPoly ep_Q2_002_coefficient_09_0639
        ep_Q2_002_generator_09_0600_0699 =
      ep_Q2_002_partial_09_0639 := by
  native_decide

/-- Coefficient term 640 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0640 : Poly :=
[
  term ((4720857189384319776116403847488 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (8, 1), (11, 1)]
]

/-- Partial product 640 for generator 9. -/
def ep_Q2_002_partial_09_0640 : Poly :=
[
  term ((9441714378768639552232807694976 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (6, 1), (8, 1), (11, 1)],
  term ((-4720857189384319776116403847488 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (8, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 640 for generator 9. -/
theorem ep_Q2_002_partial_09_0640_valid :
    mulPoly ep_Q2_002_coefficient_09_0640
        ep_Q2_002_generator_09_0600_0699 =
      ep_Q2_002_partial_09_0640 := by
  native_decide

/-- Coefficient term 641 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0641 : Poly :=
[
  term ((-8890258171041414654370853872896 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (8, 1), (13, 1)]
]

/-- Partial product 641 for generator 9. -/
def ep_Q2_002_partial_09_0641 : Poly :=
[
  term ((-17780516342082829308741707745792 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (6, 1), (8, 1), (13, 1)],
  term ((8890258171041414654370853872896 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (8, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 641 for generator 9. -/
theorem ep_Q2_002_partial_09_0641_valid :
    mulPoly ep_Q2_002_coefficient_09_0641
        ep_Q2_002_generator_09_0600_0699 =
      ep_Q2_002_partial_09_0641 := by
  native_decide

/-- Coefficient term 642 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0642 : Poly :=
[
  term ((-80975270084164716373576596449152458522768 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (6, 1), (8, 1), (15, 1)]
]

/-- Partial product 642 for generator 9. -/
def ep_Q2_002_partial_09_0642 : Poly :=
[
  term ((-161950540168329432747153192898304917045536 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (3, 1), (6, 1), (8, 1), (15, 1)],
  term ((80975270084164716373576596449152458522768 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (6, 1), (8, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 642 for generator 9. -/
theorem ep_Q2_002_partial_09_0642_valid :
    mulPoly ep_Q2_002_coefficient_09_0642
        ep_Q2_002_generator_09_0600_0699 =
      ep_Q2_002_partial_09_0642 := by
  native_decide

/-- Coefficient term 643 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0643 : Poly :=
[
  term ((-5271014764 : Rat) / 7401317245) [(3, 1), (6, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 643 for generator 9. -/
def ep_Q2_002_partial_09_0643 : Poly :=
[
  term ((-10542029528 : Rat) / 7401317245) [(2, 1), (3, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((5271014764 : Rat) / 7401317245) [(3, 1), (6, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 643 for generator 9. -/
theorem ep_Q2_002_partial_09_0643_valid :
    mulPoly ep_Q2_002_coefficient_09_0643
        ep_Q2_002_generator_09_0600_0699 =
      ep_Q2_002_partial_09_0643 := by
  native_decide

/-- Coefficient term 644 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0644 : Poly :=
[
  term ((37757427322096977889625678153952 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (9, 1), (11, 1), (15, 1)]
]

/-- Partial product 644 for generator 9. -/
def ep_Q2_002_partial_09_0644 : Poly :=
[
  term ((75514854644193955779251356307904 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (6, 1), (9, 1), (11, 1), (15, 1)],
  term ((-37757427322096977889625678153952 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (9, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 644 for generator 9. -/
theorem ep_Q2_002_partial_09_0644_valid :
    mulPoly ep_Q2_002_coefficient_09_0644
        ep_Q2_002_generator_09_0600_0699 =
      ep_Q2_002_partial_09_0644 := by
  native_decide

/-- Coefficient term 645 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0645 : Poly :=
[
  term ((-71104306548945305569658801779584 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (9, 1), (13, 1), (15, 1)]
]

/-- Partial product 645 for generator 9. -/
def ep_Q2_002_partial_09_0645 : Poly :=
[
  term ((-142208613097890611139317603559168 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (6, 1), (9, 1), (13, 1), (15, 1)],
  term ((71104306548945305569658801779584 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (9, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 645 for generator 9. -/
theorem ep_Q2_002_partial_09_0645_valid :
    mulPoly ep_Q2_002_coefficient_09_0645
        ep_Q2_002_generator_09_0600_0699 =
      ep_Q2_002_partial_09_0645 := by
  native_decide

/-- Coefficient term 646 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0646 : Poly :=
[
  term ((-305443772243275713370412379262219325760192 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (6, 1), (9, 1), (15, 2)]
]

/-- Partial product 646 for generator 9. -/
def ep_Q2_002_partial_09_0646 : Poly :=
[
  term ((-610887544486551426740824758524438651520384 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (3, 1), (6, 1), (9, 1), (15, 2)],
  term ((305443772243275713370412379262219325760192 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (6, 1), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 646 for generator 9. -/
theorem ep_Q2_002_partial_09_0646_valid :
    mulPoly ep_Q2_002_coefficient_09_0646
        ep_Q2_002_generator_09_0600_0699 =
      ep_Q2_002_partial_09_0646 := by
  native_decide

/-- Coefficient term 647 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0647 : Poly :=
[
  term ((-32504690856 : Rat) / 7401317245) [(3, 1), (6, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 647 for generator 9. -/
def ep_Q2_002_partial_09_0647 : Poly :=
[
  term ((-65009381712 : Rat) / 7401317245) [(2, 1), (3, 1), (6, 1), (9, 1), (15, 2), (16, 1)],
  term ((32504690856 : Rat) / 7401317245) [(3, 1), (6, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 647 for generator 9. -/
theorem ep_Q2_002_partial_09_0647_valid :
    mulPoly ep_Q2_002_coefficient_09_0647
        ep_Q2_002_generator_09_0600_0699 =
      ep_Q2_002_partial_09_0647 := by
  native_decide

/-- Coefficient term 648 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0648 : Poly :=
[
  term ((5114369551261288404068161567290 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (11, 1)]
]

/-- Partial product 648 for generator 9. -/
def ep_Q2_002_partial_09_0648 : Poly :=
[
  term ((10228739102522576808136323134580 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (6, 1), (11, 1)],
  term ((-5114369551261288404068161567290 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 648 for generator 9. -/
theorem ep_Q2_002_partial_09_0648_valid :
    mulPoly ep_Q2_002_coefficient_09_0648
        ep_Q2_002_generator_09_0600_0699 =
      ep_Q2_002_partial_09_0648 := by
  native_decide

/-- Coefficient term 649 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0649 : Poly :=
[
  term ((5736057393131143011586097338824 : Rat) / 97983883872014706756151952089) [(3, 1), (6, 1), (11, 1), (12, 1)]
]

/-- Partial product 649 for generator 9. -/
def ep_Q2_002_partial_09_0649 : Poly :=
[
  term ((11472114786262286023172194677648 : Rat) / 97983883872014706756151952089) [(2, 1), (3, 1), (6, 1), (11, 1), (12, 1)],
  term ((-5736057393131143011586097338824 : Rat) / 97983883872014706756151952089) [(3, 1), (6, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 649 for generator 9. -/
theorem ep_Q2_002_partial_09_0649_valid :
    mulPoly ep_Q2_002_coefficient_09_0649
        ep_Q2_002_generator_09_0600_0699 =
      ep_Q2_002_partial_09_0649 := by
  native_decide

/-- Coefficient term 650 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0650 : Poly :=
[
  term ((8670808792688503048076144907216 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (11, 1), (14, 1)]
]

/-- Partial product 650 for generator 9. -/
def ep_Q2_002_partial_09_0650 : Poly :=
[
  term ((17341617585377006096152289814432 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (6, 1), (11, 1), (14, 1)],
  term ((-8670808792688503048076144907216 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 650 for generator 9. -/
theorem ep_Q2_002_partial_09_0650_valid :
    mulPoly ep_Q2_002_coefficient_09_0650
        ep_Q2_002_generator_09_0600_0699 =
      ep_Q2_002_partial_09_0650 := by
  native_decide

/-- Coefficient term 651 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0651 : Poly :=
[
  term ((-15082271115816623387788229730480 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (11, 1), (15, 2)]
]

/-- Partial product 651 for generator 9. -/
def ep_Q2_002_partial_09_0651 : Poly :=
[
  term ((-30164542231633246775576459460960 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (6, 1), (11, 1), (15, 2)],
  term ((15082271115816623387788229730480 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 651 for generator 9. -/
theorem ep_Q2_002_partial_09_0651_valid :
    mulPoly ep_Q2_002_coefficient_09_0651
        ep_Q2_002_generator_09_0600_0699 =
      ep_Q2_002_partial_09_0651 := by
  native_decide

/-- Coefficient term 652 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0652 : Poly :=
[
  term ((-10802070273067777615157950763808 : Rat) / 97983883872014706756151952089) [(3, 1), (6, 1), (12, 1), (13, 1)]
]

/-- Partial product 652 for generator 9. -/
def ep_Q2_002_partial_09_0652 : Poly :=
[
  term ((-21604140546135555230315901527616 : Rat) / 97983883872014706756151952089) [(2, 1), (3, 1), (6, 1), (12, 1), (13, 1)],
  term ((10802070273067777615157950763808 : Rat) / 97983883872014706756151952089) [(3, 1), (6, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 652 for generator 9. -/
theorem ep_Q2_002_partial_09_0652_valid :
    mulPoly ep_Q2_002_coefficient_09_0652
        ep_Q2_002_generator_09_0600_0699 =
      ep_Q2_002_partial_09_0652 := by
  native_decide

/-- Coefficient term 653 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0653 : Poly :=
[
  term ((324536270974815395536233525603291814678836 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (6, 1), (12, 1), (15, 1)]
]

/-- Partial product 653 for generator 9. -/
def ep_Q2_002_partial_09_0653 : Poly :=
[
  term ((649072541949630791072467051206583629357672 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (3, 1), (6, 1), (12, 1), (15, 1)],
  term ((-324536270974815395536233525603291814678836 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (6, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 653 for generator 9. -/
theorem ep_Q2_002_partial_09_0653_valid :
    mulPoly ep_Q2_002_coefficient_09_0653
        ep_Q2_002_generator_09_0600_0699 =
      ep_Q2_002_partial_09_0653 := by
  native_decide

/-- Coefficient term 654 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0654 : Poly :=
[
  term ((-39643219857 : Rat) / 7401317245) [(3, 1), (6, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 654 for generator 9. -/
def ep_Q2_002_partial_09_0654 : Poly :=
[
  term ((-79286439714 : Rat) / 7401317245) [(2, 1), (3, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((39643219857 : Rat) / 7401317245) [(3, 1), (6, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 654 for generator 9. -/
theorem ep_Q2_002_partial_09_0654_valid :
    mulPoly ep_Q2_002_coefficient_09_0654
        ep_Q2_002_generator_09_0600_0699 =
      ep_Q2_002_partial_09_0654 := by
  native_decide

/-- Coefficient term 655 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0655 : Poly :=
[
  term ((-9631315642224689497214658760680 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (13, 1)]
]

/-- Partial product 655 for generator 9. -/
def ep_Q2_002_partial_09_0655 : Poly :=
[
  term ((-19262631284449378994429317521360 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (6, 1), (13, 1)],
  term ((9631315642224689497214658760680 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 655 for generator 9. -/
theorem ep_Q2_002_partial_09_0655_valid :
    mulPoly ep_Q2_002_coefficient_09_0655
        ep_Q2_002_generator_09_0600_0699 =
      ep_Q2_002_partial_09_0655 := by
  native_decide

/-- Coefficient term 656 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0656 : Poly :=
[
  term ((-16328756754615998126519279191872 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (13, 1), (14, 1)]
]

/-- Partial product 656 for generator 9. -/
def ep_Q2_002_partial_09_0656 : Poly :=
[
  term ((-32657513509231996253038558383744 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (6, 1), (13, 1), (14, 1)],
  term ((16328756754615998126519279191872 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 656 for generator 9. -/
theorem ep_Q2_002_partial_09_0656_valid :
    mulPoly ep_Q2_002_coefficient_09_0656
        ep_Q2_002_generator_09_0600_0699 =
      ep_Q2_002_partial_09_0656 := by
  native_decide

/-- Coefficient term 657 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0657 : Poly :=
[
  term ((28402740995166103804786929044160 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (13, 1), (15, 2)]
]

/-- Partial product 657 for generator 9. -/
def ep_Q2_002_partial_09_0657 : Poly :=
[
  term ((56805481990332207609573858088320 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (6, 1), (13, 1), (15, 2)],
  term ((-28402740995166103804786929044160 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 657 for generator 9. -/
theorem ep_Q2_002_partial_09_0657_valid :
    mulPoly ep_Q2_002_coefficient_09_0657
        ep_Q2_002_generator_09_0600_0699 =
      ep_Q2_002_partial_09_0657 := by
  native_decide

/-- Coefficient term 658 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0658 : Poly :=
[
  term ((259702224746748282717257402887671117333216 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (6, 1), (14, 1), (15, 1)]
]

/-- Partial product 658 for generator 9. -/
def ep_Q2_002_partial_09_0658 : Poly :=
[
  term ((519404449493496565434514805775342234666432 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (3, 1), (6, 1), (14, 1), (15, 1)],
  term ((-259702224746748282717257402887671117333216 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (6, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 658 for generator 9. -/
theorem ep_Q2_002_partial_09_0658_valid :
    mulPoly ep_Q2_002_coefficient_09_0658
        ep_Q2_002_generator_09_0600_0699 =
      ep_Q2_002_partial_09_0658 := by
  native_decide

/-- Coefficient term 659 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0659 : Poly :=
[
  term ((1505925468 : Rat) / 7401317245) [(3, 1), (6, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 659 for generator 9. -/
def ep_Q2_002_partial_09_0659 : Poly :=
[
  term ((3011850936 : Rat) / 7401317245) [(2, 1), (3, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1505925468 : Rat) / 7401317245) [(3, 1), (6, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 659 for generator 9. -/
theorem ep_Q2_002_partial_09_0659_valid :
    mulPoly ep_Q2_002_coefficient_09_0659
        ep_Q2_002_generator_09_0600_0699 =
      ep_Q2_002_partial_09_0659 := by
  native_decide

/-- Coefficient term 660 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0660 : Poly :=
[
  term ((92827562346096444501561752927736953385459 : Rat) / 269363643504064505317229453910785233499) [(3, 1), (6, 1), (15, 1)]
]

/-- Partial product 660 for generator 9. -/
def ep_Q2_002_partial_09_0660 : Poly :=
[
  term ((185655124692192889003123505855473906770918 : Rat) / 269363643504064505317229453910785233499) [(2, 1), (3, 1), (6, 1), (15, 1)],
  term ((-92827562346096444501561752927736953385459 : Rat) / 269363643504064505317229453910785233499) [(3, 1), (6, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 660 for generator 9. -/
theorem ep_Q2_002_partial_09_0660_valid :
    mulPoly ep_Q2_002_coefficient_09_0660
        ep_Q2_002_generator_09_0600_0699 =
      ep_Q2_002_partial_09_0660 := by
  native_decide

/-- Coefficient term 661 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0661 : Poly :=
[
  term ((21311157487 : Rat) / 17763161388) [(3, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 661 for generator 9. -/
def ep_Q2_002_partial_09_0661 : Poly :=
[
  term ((21311157487 : Rat) / 8881580694) [(2, 1), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((-21311157487 : Rat) / 17763161388) [(3, 1), (6, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 661 for generator 9. -/
theorem ep_Q2_002_partial_09_0661_valid :
    mulPoly ep_Q2_002_coefficient_09_0661
        ep_Q2_002_generator_09_0600_0699 =
      ep_Q2_002_partial_09_0661 := by
  native_decide

/-- Coefficient term 662 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0662 : Poly :=
[
  term ((1611219605751365550697957932482544381391776 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (6, 1), (15, 3)]
]

/-- Partial product 662 for generator 9. -/
def ep_Q2_002_partial_09_0662 : Poly :=
[
  term ((3222439211502731101395915864965088762783552 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (3, 1), (6, 1), (15, 3)],
  term ((-1611219605751365550697957932482544381391776 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (6, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 662 for generator 9. -/
theorem ep_Q2_002_partial_09_0662_valid :
    mulPoly ep_Q2_002_coefficient_09_0662
        ep_Q2_002_generator_09_0600_0699 =
      ep_Q2_002_partial_09_0662 := by
  native_decide

/-- Coefficient term 663 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0663 : Poly :=
[
  term ((158475703364 : Rat) / 22203951735) [(3, 1), (6, 1), (15, 3), (16, 1)]
]

/-- Partial product 663 for generator 9. -/
def ep_Q2_002_partial_09_0663 : Poly :=
[
  term ((316951406728 : Rat) / 22203951735) [(2, 1), (3, 1), (6, 1), (15, 3), (16, 1)],
  term ((-158475703364 : Rat) / 22203951735) [(3, 1), (6, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 663 for generator 9. -/
theorem ep_Q2_002_partial_09_0663_valid :
    mulPoly ep_Q2_002_coefficient_09_0663
        ep_Q2_002_generator_09_0600_0699 =
      ep_Q2_002_partial_09_0663 := by
  native_decide

/-- Coefficient term 664 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0664 : Poly :=
[
  term ((-113272281966290933668877034461856 : Rat) / 1273790490336191187829975377157) [(3, 1), (7, 1), (9, 1), (11, 1), (14, 1)]
]

/-- Partial product 664 for generator 9. -/
def ep_Q2_002_partial_09_0664 : Poly :=
[
  term ((-226544563932581867337754068923712 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (7, 1), (9, 1), (11, 1), (14, 1)],
  term ((113272281966290933668877034461856 : Rat) / 1273790490336191187829975377157) [(3, 1), (7, 1), (9, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 664 for generator 9. -/
theorem ep_Q2_002_partial_09_0664_valid :
    mulPoly ep_Q2_002_coefficient_09_0664
        ep_Q2_002_generator_09_0600_0699 =
      ep_Q2_002_partial_09_0664 := by
  native_decide

/-- Coefficient term 665 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0665 : Poly :=
[
  term ((213312919646835916708976405338752 : Rat) / 1273790490336191187829975377157) [(3, 1), (7, 1), (9, 1), (13, 1), (14, 1)]
]

/-- Partial product 665 for generator 9. -/
def ep_Q2_002_partial_09_0665 : Poly :=
[
  term ((426625839293671833417952810677504 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (7, 1), (9, 1), (13, 1), (14, 1)],
  term ((-213312919646835916708976405338752 : Rat) / 1273790490336191187829975377157) [(3, 1), (7, 1), (9, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 665 for generator 9. -/
theorem ep_Q2_002_partial_09_0665_valid :
    mulPoly ep_Q2_002_coefficient_09_0665
        ep_Q2_002_generator_09_0600_0699 =
      ep_Q2_002_partial_09_0665 := by
  native_decide

/-- Coefficient term 666 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0666 : Poly :=
[
  term ((916331316729827140111237137786657977280576 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (7, 1), (9, 1), (14, 1), (15, 1)]
]

/-- Partial product 666 for generator 9. -/
def ep_Q2_002_partial_09_0666 : Poly :=
[
  term ((1832662633459654280222474275573315954561152 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (3, 1), (7, 1), (9, 1), (14, 1), (15, 1)],
  term ((-916331316729827140111237137786657977280576 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (7, 1), (9, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 666 for generator 9. -/
theorem ep_Q2_002_partial_09_0666_valid :
    mulPoly ep_Q2_002_coefficient_09_0666
        ep_Q2_002_generator_09_0600_0699 =
      ep_Q2_002_partial_09_0666 := by
  native_decide

/-- Coefficient term 667 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0667 : Poly :=
[
  term ((97514072568 : Rat) / 7401317245) [(3, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 667 for generator 9. -/
def ep_Q2_002_partial_09_0667 : Poly :=
[
  term ((195028145136 : Rat) / 7401317245) [(2, 1), (3, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-97514072568 : Rat) / 7401317245) [(3, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 667 for generator 9. -/
theorem ep_Q2_002_partial_09_0667_valid :
    mulPoly ep_Q2_002_coefficient_09_0667
        ep_Q2_002_generator_09_0600_0699 =
      ep_Q2_002_partial_09_0667 := by
  native_decide

/-- Coefficient term 668 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0668 : Poly :=
[
  term ((67902919568206753371259551815448 : Rat) / 1273790490336191187829975377157) [(3, 1), (7, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 668 for generator 9. -/
def ep_Q2_002_partial_09_0668 : Poly :=
[
  term ((135805839136413506742519103630896 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (7, 1), (11, 1), (14, 1), (15, 1)],
  term ((-67902919568206753371259551815448 : Rat) / 1273790490336191187829975377157) [(3, 1), (7, 1), (11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 668 for generator 9. -/
theorem ep_Q2_002_partial_09_0668_valid :
    mulPoly ep_Q2_002_coefficient_09_0668
        ep_Q2_002_generator_09_0600_0699 =
      ep_Q2_002_partial_09_0668 := by
  native_decide

/-- Coefficient term 669 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0669 : Poly :=
[
  term ((-127873913849011708153014985605216 : Rat) / 1273790490336191187829975377157) [(3, 1), (7, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 669 for generator 9. -/
def ep_Q2_002_partial_09_0669 : Poly :=
[
  term ((-255747827698023416306029971210432 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (7, 1), (13, 1), (14, 1), (15, 1)],
  term ((127873913849011708153014985605216 : Rat) / 1273790490336191187829975377157) [(3, 1), (7, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 669 for generator 9. -/
theorem ep_Q2_002_partial_09_0669_valid :
    mulPoly ep_Q2_002_coefficient_09_0669
        ep_Q2_002_generator_09_0600_0699 =
      ep_Q2_002_partial_09_0669 := by
  native_decide

/-- Coefficient term 670 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0670 : Poly :=
[
  term ((356630455128457974240 : Rat) / 253528477699481291099) [(3, 1), (7, 1), (14, 1)]
]

/-- Partial product 670 for generator 9. -/
def ep_Q2_002_partial_09_0670 : Poly :=
[
  term ((713260910256915948480 : Rat) / 253528477699481291099) [(2, 1), (3, 1), (7, 1), (14, 1)],
  term ((-356630455128457974240 : Rat) / 253528477699481291099) [(3, 1), (7, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 670 for generator 9. -/
theorem ep_Q2_002_partial_09_0670_valid :
    mulPoly ep_Q2_002_coefficient_09_0670
        ep_Q2_002_generator_09_0600_0699 =
      ep_Q2_002_partial_09_0670 := by
  native_decide

/-- Coefficient term 671 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0671 : Poly :=
[
  term ((532589502147386119189456030485993837436428 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (7, 1), (14, 1), (15, 2)]
]

/-- Partial product 671 for generator 9. -/
def ep_Q2_002_partial_09_0671 : Poly :=
[
  term ((1065179004294772238378912060971987674872856 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (3, 1), (7, 1), (14, 1), (15, 2)],
  term ((-532589502147386119189456030485993837436428 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (7, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 671 for generator 9. -/
theorem ep_Q2_002_partial_09_0671_valid :
    mulPoly ep_Q2_002_coefficient_09_0671
        ep_Q2_002_generator_09_0600_0699 =
      ep_Q2_002_partial_09_0671 := by
  native_decide

/-- Coefficient term 672 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0672 : Poly :=
[
  term ((-88171245013 : Rat) / 22203951735) [(3, 1), (7, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 672 for generator 9. -/
def ep_Q2_002_partial_09_0672 : Poly :=
[
  term ((-176342490026 : Rat) / 22203951735) [(2, 1), (3, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((88171245013 : Rat) / 22203951735) [(3, 1), (7, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 672 for generator 9. -/
theorem ep_Q2_002_partial_09_0672_valid :
    mulPoly ep_Q2_002_coefficient_09_0672
        ep_Q2_002_generator_09_0600_0699 =
      ep_Q2_002_partial_09_0672 := by
  native_decide

/-- Coefficient term 673 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0673 : Poly :=
[
  term ((-203708758704620260113778655446344 : Rat) / 1273790490336191187829975377157) [(3, 1), (7, 2), (11, 1), (14, 1)]
]

/-- Partial product 673 for generator 9. -/
def ep_Q2_002_partial_09_0673 : Poly :=
[
  term ((-407417517409240520227557310892688 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (7, 2), (11, 1), (14, 1)],
  term ((203708758704620260113778655446344 : Rat) / 1273790490336191187829975377157) [(3, 1), (7, 2), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 673 for generator 9. -/
theorem ep_Q2_002_partial_09_0673_valid :
    mulPoly ep_Q2_002_coefficient_09_0673
        ep_Q2_002_generator_09_0600_0699 =
      ep_Q2_002_partial_09_0673 := by
  native_decide

/-- Coefficient term 674 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0674 : Poly :=
[
  term ((383621741547035124459044956815648 : Rat) / 1273790490336191187829975377157) [(3, 1), (7, 2), (13, 1), (14, 1)]
]

/-- Partial product 674 for generator 9. -/
def ep_Q2_002_partial_09_0674 : Poly :=
[
  term ((767243483094070248918089913631296 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (7, 2), (13, 1), (14, 1)],
  term ((-383621741547035124459044956815648 : Rat) / 1273790490336191187829975377157) [(3, 1), (7, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 674 for generator 9. -/
theorem ep_Q2_002_partial_09_0674_valid :
    mulPoly ep_Q2_002_coefficient_09_0674
        ep_Q2_002_generator_09_0600_0699 =
      ep_Q2_002_partial_09_0674 := by
  native_decide

/-- Coefficient term 675 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0675 : Poly :=
[
  term ((-1597768506442158357568368091457981512309284 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (7, 2), (14, 1), (15, 1)]
]

/-- Partial product 675 for generator 9. -/
def ep_Q2_002_partial_09_0675 : Poly :=
[
  term ((-3195537012884316715136736182915963024618568 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (3, 1), (7, 2), (14, 1), (15, 1)],
  term ((1597768506442158357568368091457981512309284 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (7, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 675 for generator 9. -/
theorem ep_Q2_002_partial_09_0675_valid :
    mulPoly ep_Q2_002_coefficient_09_0675
        ep_Q2_002_generator_09_0600_0699 =
      ep_Q2_002_partial_09_0675 := by
  native_decide

/-- Coefficient term 676 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0676 : Poly :=
[
  term ((88171245013 : Rat) / 7401317245) [(3, 1), (7, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 676 for generator 9. -/
def ep_Q2_002_partial_09_0676 : Poly :=
[
  term ((176342490026 : Rat) / 7401317245) [(2, 1), (3, 1), (7, 2), (14, 1), (15, 1), (16, 1)],
  term ((-88171245013 : Rat) / 7401317245) [(3, 1), (7, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 676 for generator 9. -/
theorem ep_Q2_002_partial_09_0676_valid :
    mulPoly ep_Q2_002_coefficient_09_0676
        ep_Q2_002_generator_09_0600_0699 =
      ep_Q2_002_partial_09_0676 := by
  native_decide

/-- Coefficient term 677 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0677 : Poly :=
[
  term ((-4720857189384319776116403847488 : Rat) / 1273790490336191187829975377157) [(3, 1), (8, 1), (11, 1), (14, 1)]
]

/-- Partial product 677 for generator 9. -/
def ep_Q2_002_partial_09_0677 : Poly :=
[
  term ((-9441714378768639552232807694976 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (8, 1), (11, 1), (14, 1)],
  term ((4720857189384319776116403847488 : Rat) / 1273790490336191187829975377157) [(3, 1), (8, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 677 for generator 9. -/
theorem ep_Q2_002_partial_09_0677_valid :
    mulPoly ep_Q2_002_coefficient_09_0677
        ep_Q2_002_generator_09_0600_0699 =
      ep_Q2_002_partial_09_0677 := by
  native_decide

/-- Coefficient term 678 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0678 : Poly :=
[
  term ((8890258171041414654370853872896 : Rat) / 1273790490336191187829975377157) [(3, 1), (8, 1), (13, 1), (14, 1)]
]

/-- Partial product 678 for generator 9. -/
def ep_Q2_002_partial_09_0678 : Poly :=
[
  term ((17780516342082829308741707745792 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (8, 1), (13, 1), (14, 1)],
  term ((-8890258171041414654370853872896 : Rat) / 1273790490336191187829975377157) [(3, 1), (8, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 678 for generator 9. -/
theorem ep_Q2_002_partial_09_0678_valid :
    mulPoly ep_Q2_002_coefficient_09_0678
        ep_Q2_002_generator_09_0600_0699 =
      ep_Q2_002_partial_09_0678 := by
  native_decide

/-- Coefficient term 679 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0679 : Poly :=
[
  term ((80975270084164716373576596449152458522768 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (8, 1), (14, 1), (15, 1)]
]

/-- Partial product 679 for generator 9. -/
def ep_Q2_002_partial_09_0679 : Poly :=
[
  term ((161950540168329432747153192898304917045536 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (3, 1), (8, 1), (14, 1), (15, 1)],
  term ((-80975270084164716373576596449152458522768 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (8, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 679 for generator 9. -/
theorem ep_Q2_002_partial_09_0679_valid :
    mulPoly ep_Q2_002_coefficient_09_0679
        ep_Q2_002_generator_09_0600_0699 =
      ep_Q2_002_partial_09_0679 := by
  native_decide

/-- Coefficient term 680 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0680 : Poly :=
[
  term ((5271014764 : Rat) / 7401317245) [(3, 1), (8, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 680 for generator 9. -/
def ep_Q2_002_partial_09_0680 : Poly :=
[
  term ((10542029528 : Rat) / 7401317245) [(2, 1), (3, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5271014764 : Rat) / 7401317245) [(3, 1), (8, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 680 for generator 9. -/
theorem ep_Q2_002_partial_09_0680_valid :
    mulPoly ep_Q2_002_coefficient_09_0680
        ep_Q2_002_generator_09_0600_0699 =
      ep_Q2_002_partial_09_0680 := by
  native_decide

/-- Coefficient term 681 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0681 : Poly :=
[
  term ((37757427322096977889625678153952 : Rat) / 1273790490336191187829975377157) [(3, 1), (9, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 681 for generator 9. -/
def ep_Q2_002_partial_09_0681 : Poly :=
[
  term ((75514854644193955779251356307904 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (9, 1), (11, 1), (14, 1), (15, 1)],
  term ((-37757427322096977889625678153952 : Rat) / 1273790490336191187829975377157) [(3, 1), (9, 1), (11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 681 for generator 9. -/
theorem ep_Q2_002_partial_09_0681_valid :
    mulPoly ep_Q2_002_coefficient_09_0681
        ep_Q2_002_generator_09_0600_0699 =
      ep_Q2_002_partial_09_0681 := by
  native_decide

/-- Coefficient term 682 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0682 : Poly :=
[
  term ((-71104306548945305569658801779584 : Rat) / 1273790490336191187829975377157) [(3, 1), (9, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 682 for generator 9. -/
def ep_Q2_002_partial_09_0682 : Poly :=
[
  term ((-142208613097890611139317603559168 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((71104306548945305569658801779584 : Rat) / 1273790490336191187829975377157) [(3, 1), (9, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 682 for generator 9. -/
theorem ep_Q2_002_partial_09_0682_valid :
    mulPoly ep_Q2_002_coefficient_09_0682
        ep_Q2_002_generator_09_0600_0699 =
      ep_Q2_002_partial_09_0682 := by
  native_decide

/-- Coefficient term 683 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0683 : Poly :=
[
  term ((-305443772243275713370412379262219325760192 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (9, 1), (14, 1), (15, 2)]
]

/-- Partial product 683 for generator 9. -/
def ep_Q2_002_partial_09_0683 : Poly :=
[
  term ((-610887544486551426740824758524438651520384 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (3, 1), (9, 1), (14, 1), (15, 2)],
  term ((305443772243275713370412379262219325760192 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (9, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 683 for generator 9. -/
theorem ep_Q2_002_partial_09_0683_valid :
    mulPoly ep_Q2_002_coefficient_09_0683
        ep_Q2_002_generator_09_0600_0699 =
      ep_Q2_002_partial_09_0683 := by
  native_decide

/-- Coefficient term 684 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0684 : Poly :=
[
  term ((-32504690856 : Rat) / 7401317245) [(3, 1), (9, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 684 for generator 9. -/
def ep_Q2_002_partial_09_0684 : Poly :=
[
  term ((-65009381712 : Rat) / 7401317245) [(2, 1), (3, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((32504690856 : Rat) / 7401317245) [(3, 1), (9, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 684 for generator 9. -/
theorem ep_Q2_002_partial_09_0684_valid :
    mulPoly ep_Q2_002_coefficient_09_0684
        ep_Q2_002_generator_09_0600_0699 =
      ep_Q2_002_partial_09_0684 := by
  native_decide

/-- Coefficient term 685 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0685 : Poly :=
[
  term ((8857232880781878026675967472488 : Rat) / 97983883872014706756151952089) [(3, 1), (11, 1), (12, 1), (14, 1)]
]

/-- Partial product 685 for generator 9. -/
def ep_Q2_002_partial_09_0685 : Poly :=
[
  term ((17714465761563756053351934944976 : Rat) / 97983883872014706756151952089) [(2, 1), (3, 1), (11, 1), (12, 1), (14, 1)],
  term ((-8857232880781878026675967472488 : Rat) / 97983883872014706756151952089) [(3, 1), (11, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 685 for generator 9. -/
theorem ep_Q2_002_partial_09_0685_valid :
    mulPoly ep_Q2_002_coefficient_09_0685
        ep_Q2_002_generator_09_0600_0699 =
      ep_Q2_002_partial_09_0685 := by
  native_decide

/-- Coefficient term 686 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0686 : Poly :=
[
  term ((-76479147780203639277020033679258 : Rat) / 1273790490336191187829975377157) [(3, 1), (11, 1), (14, 1)]
]

/-- Partial product 686 for generator 9. -/
def ep_Q2_002_partial_09_0686 : Poly :=
[
  term ((-152958295560407278554040067358516 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (11, 1), (14, 1)],
  term ((76479147780203639277020033679258 : Rat) / 1273790490336191187829975377157) [(3, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 686 for generator 9. -/
theorem ep_Q2_002_partial_09_0686_valid :
    mulPoly ep_Q2_002_coefficient_09_0686
        ep_Q2_002_generator_09_0600_0699 =
      ep_Q2_002_partial_09_0686 := by
  native_decide

/-- Coefficient term 687 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0687 : Poly :=
[
  term ((-15082271115816623387788229730480 : Rat) / 1273790490336191187829975377157) [(3, 1), (11, 1), (14, 1), (15, 2)]
]

/-- Partial product 687 for generator 9. -/
def ep_Q2_002_partial_09_0687 : Poly :=
[
  term ((-30164542231633246775576459460960 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (11, 1), (14, 1), (15, 2)],
  term ((15082271115816623387788229730480 : Rat) / 1273790490336191187829975377157) [(3, 1), (11, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 687 for generator 9. -/
theorem ep_Q2_002_partial_09_0687_valid :
    mulPoly ep_Q2_002_coefficient_09_0687
        ep_Q2_002_generator_09_0600_0699 =
      ep_Q2_002_partial_09_0687 := by
  native_decide

/-- Coefficient term 688 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0688 : Poly :=
[
  term ((-16679828224470653730875332372896 : Rat) / 97983883872014706756151952089) [(3, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 688 for generator 9. -/
def ep_Q2_002_partial_09_0688 : Poly :=
[
  term ((-33359656448941307461750664745792 : Rat) / 97983883872014706756151952089) [(2, 1), (3, 1), (12, 1), (13, 1), (14, 1)],
  term ((16679828224470653730875332372896 : Rat) / 97983883872014706756151952089) [(3, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 688 for generator 9. -/
theorem ep_Q2_002_partial_09_0688_valid :
    mulPoly ep_Q2_002_coefficient_09_0688
        ep_Q2_002_generator_09_0600_0699 =
      ep_Q2_002_partial_09_0688 := by
  native_decide

/-- Coefficient term 689 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0689 : Poly :=
[
  term ((-105342795193840704218839779959992968533292 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 689 for generator 9. -/
def ep_Q2_002_partial_09_0689 : Poly :=
[
  term ((-210685590387681408437679559919985937066584 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (3, 1), (12, 1), (14, 1), (15, 1)],
  term ((105342795193840704218839779959992968533292 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 689 for generator 9. -/
theorem ep_Q2_002_partial_09_0689_valid :
    mulPoly ep_Q2_002_coefficient_09_0689
        ep_Q2_002_generator_09_0600_0699 =
      ep_Q2_002_partial_09_0689 := by
  native_decide

/-- Coefficient term 690 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0690 : Poly :=
[
  term ((-77504694161 : Rat) / 7401317245) [(3, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 690 for generator 9. -/
def ep_Q2_002_partial_09_0690 : Poly :=
[
  term ((-155009388322 : Rat) / 7401317245) [(2, 1), (3, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((77504694161 : Rat) / 7401317245) [(3, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 690 for generator 9. -/
theorem ep_Q2_002_partial_09_0690_valid :
    mulPoly ep_Q2_002_coefficient_09_0690
        ep_Q2_002_generator_09_0600_0699 =
      ep_Q2_002_partial_09_0690 := by
  native_decide

/-- Coefficient term 691 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0691 : Poly :=
[
  term ((144024557657909652950530408805736 : Rat) / 1273790490336191187829975377157) [(3, 1), (13, 1), (14, 1)]
]

/-- Partial product 691 for generator 9. -/
def ep_Q2_002_partial_09_0691 : Poly :=
[
  term ((288049115315819305901060817611472 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (13, 1), (14, 1)],
  term ((-144024557657909652950530408805736 : Rat) / 1273790490336191187829975377157) [(3, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 691 for generator 9. -/
theorem ep_Q2_002_partial_09_0691_valid :
    mulPoly ep_Q2_002_coefficient_09_0691
        ep_Q2_002_generator_09_0600_0699 =
      ep_Q2_002_partial_09_0691 := by
  native_decide

/-- Coefficient term 692 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0692 : Poly :=
[
  term ((28402740995166103804786929044160 : Rat) / 1273790490336191187829975377157) [(3, 1), (13, 1), (14, 1), (15, 2)]
]

/-- Partial product 692 for generator 9. -/
def ep_Q2_002_partial_09_0692 : Poly :=
[
  term ((56805481990332207609573858088320 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (13, 1), (14, 1), (15, 2)],
  term ((-28402740995166103804786929044160 : Rat) / 1273790490336191187829975377157) [(3, 1), (13, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 692 for generator 9. -/
theorem ep_Q2_002_partial_09_0692_valid :
    mulPoly ep_Q2_002_coefficient_09_0692
        ep_Q2_002_generator_09_0600_0699 =
      ep_Q2_002_partial_09_0692 := by
  native_decide

/-- Coefficient term 693 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0693 : Poly :=
[
  term ((-610218244260754336536767830153130762839639 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (14, 1), (15, 1)]
]

/-- Partial product 693 for generator 9. -/
def ep_Q2_002_partial_09_0693 : Poly :=
[
  term ((-1220436488521508673073535660306261525679278 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (3, 1), (14, 1), (15, 1)],
  term ((610218244260754336536767830153130762839639 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 693 for generator 9. -/
theorem ep_Q2_002_partial_09_0693_valid :
    mulPoly ep_Q2_002_coefficient_09_0693
        ep_Q2_002_generator_09_0600_0699 =
      ep_Q2_002_partial_09_0693 := by
  native_decide

/-- Coefficient term 694 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0694 : Poly :=
[
  term ((382953023581 : Rat) / 88815806940) [(3, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 694 for generator 9. -/
def ep_Q2_002_partial_09_0694 : Poly :=
[
  term ((382953023581 : Rat) / 44407903470) [(2, 1), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((-382953023581 : Rat) / 88815806940) [(3, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 694 for generator 9. -/
theorem ep_Q2_002_partial_09_0694_valid :
    mulPoly ep_Q2_002_coefficient_09_0694
        ep_Q2_002_generator_09_0600_0699 =
      ep_Q2_002_partial_09_0694 := by
  native_decide

/-- Coefficient term 695 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0695 : Poly :=
[
  term ((1611219605751365550697957932482544381391776 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (14, 1), (15, 3)]
]

/-- Partial product 695 for generator 9. -/
def ep_Q2_002_partial_09_0695 : Poly :=
[
  term ((3222439211502731101395915864965088762783552 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (3, 1), (14, 1), (15, 3)],
  term ((-1611219605751365550697957932482544381391776 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (14, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 695 for generator 9. -/
theorem ep_Q2_002_partial_09_0695_valid :
    mulPoly ep_Q2_002_coefficient_09_0695
        ep_Q2_002_generator_09_0600_0699 =
      ep_Q2_002_partial_09_0695 := by
  native_decide

/-- Coefficient term 696 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0696 : Poly :=
[
  term ((158475703364 : Rat) / 22203951735) [(3, 1), (14, 1), (15, 3), (16, 1)]
]

/-- Partial product 696 for generator 9. -/
def ep_Q2_002_partial_09_0696 : Poly :=
[
  term ((316951406728 : Rat) / 22203951735) [(2, 1), (3, 1), (14, 1), (15, 3), (16, 1)],
  term ((-158475703364 : Rat) / 22203951735) [(3, 1), (14, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 696 for generator 9. -/
theorem ep_Q2_002_partial_09_0696_valid :
    mulPoly ep_Q2_002_coefficient_09_0696
        ep_Q2_002_generator_09_0600_0699 =
      ep_Q2_002_partial_09_0696 := by
  native_decide

/-- Coefficient term 697 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0697 : Poly :=
[
  term ((-8290713400643154168021399431688 : Rat) / 115799135485108289802725034287) [(4, 1), (5, 1), (6, 1), (11, 1)]
]

/-- Partial product 697 for generator 9. -/
def ep_Q2_002_partial_09_0697 : Poly :=
[
  term ((-16581426801286308336042798863376 : Rat) / 115799135485108289802725034287) [(2, 1), (4, 1), (5, 1), (6, 1), (11, 1)],
  term ((8290713400643154168021399431688 : Rat) / 115799135485108289802725034287) [(4, 1), (5, 1), (6, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 697 for generator 9. -/
theorem ep_Q2_002_partial_09_0697_valid :
    mulPoly ep_Q2_002_coefficient_09_0697
        ep_Q2_002_generator_09_0600_0699 =
      ep_Q2_002_partial_09_0697 := by
  native_decide

/-- Coefficient term 698 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0698 : Poly :=
[
  term ((15612965950245775047301246219296 : Rat) / 115799135485108289802725034287) [(4, 1), (5, 1), (6, 1), (13, 1)]
]

/-- Partial product 698 for generator 9. -/
def ep_Q2_002_partial_09_0698 : Poly :=
[
  term ((31225931900491550094602492438592 : Rat) / 115799135485108289802725034287) [(2, 1), (4, 1), (5, 1), (6, 1), (13, 1)],
  term ((-15612965950245775047301246219296 : Rat) / 115799135485108289802725034287) [(4, 1), (5, 1), (6, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 698 for generator 9. -/
theorem ep_Q2_002_partial_09_0698_valid :
    mulPoly ep_Q2_002_coefficient_09_0698
        ep_Q2_002_generator_09_0600_0699 =
      ep_Q2_002_partial_09_0698 := by
  native_decide

/-- Coefficient term 699 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0699 : Poly :=
[
  term ((449716229675215903230820593483673026786924 : Rat) / 122438019774574775144195206323084197045) [(4, 1), (5, 1), (6, 1), (15, 1)]
]

/-- Partial product 699 for generator 9. -/
def ep_Q2_002_partial_09_0699 : Poly :=
[
  term ((899432459350431806461641186967346053573848 : Rat) / 122438019774574775144195206323084197045) [(2, 1), (4, 1), (5, 1), (6, 1), (15, 1)],
  term ((-449716229675215903230820593483673026786924 : Rat) / 122438019774574775144195206323084197045) [(4, 1), (5, 1), (6, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 699 for generator 9. -/
theorem ep_Q2_002_partial_09_0699_valid :
    mulPoly ep_Q2_002_coefficient_09_0699
        ep_Q2_002_generator_09_0600_0699 =
      ep_Q2_002_partial_09_0699 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_002_partials_09_0600_0699 : List Poly :=
[
  ep_Q2_002_partial_09_0600,
  ep_Q2_002_partial_09_0601,
  ep_Q2_002_partial_09_0602,
  ep_Q2_002_partial_09_0603,
  ep_Q2_002_partial_09_0604,
  ep_Q2_002_partial_09_0605,
  ep_Q2_002_partial_09_0606,
  ep_Q2_002_partial_09_0607,
  ep_Q2_002_partial_09_0608,
  ep_Q2_002_partial_09_0609,
  ep_Q2_002_partial_09_0610,
  ep_Q2_002_partial_09_0611,
  ep_Q2_002_partial_09_0612,
  ep_Q2_002_partial_09_0613,
  ep_Q2_002_partial_09_0614,
  ep_Q2_002_partial_09_0615,
  ep_Q2_002_partial_09_0616,
  ep_Q2_002_partial_09_0617,
  ep_Q2_002_partial_09_0618,
  ep_Q2_002_partial_09_0619,
  ep_Q2_002_partial_09_0620,
  ep_Q2_002_partial_09_0621,
  ep_Q2_002_partial_09_0622,
  ep_Q2_002_partial_09_0623,
  ep_Q2_002_partial_09_0624,
  ep_Q2_002_partial_09_0625,
  ep_Q2_002_partial_09_0626,
  ep_Q2_002_partial_09_0627,
  ep_Q2_002_partial_09_0628,
  ep_Q2_002_partial_09_0629,
  ep_Q2_002_partial_09_0630,
  ep_Q2_002_partial_09_0631,
  ep_Q2_002_partial_09_0632,
  ep_Q2_002_partial_09_0633,
  ep_Q2_002_partial_09_0634,
  ep_Q2_002_partial_09_0635,
  ep_Q2_002_partial_09_0636,
  ep_Q2_002_partial_09_0637,
  ep_Q2_002_partial_09_0638,
  ep_Q2_002_partial_09_0639,
  ep_Q2_002_partial_09_0640,
  ep_Q2_002_partial_09_0641,
  ep_Q2_002_partial_09_0642,
  ep_Q2_002_partial_09_0643,
  ep_Q2_002_partial_09_0644,
  ep_Q2_002_partial_09_0645,
  ep_Q2_002_partial_09_0646,
  ep_Q2_002_partial_09_0647,
  ep_Q2_002_partial_09_0648,
  ep_Q2_002_partial_09_0649,
  ep_Q2_002_partial_09_0650,
  ep_Q2_002_partial_09_0651,
  ep_Q2_002_partial_09_0652,
  ep_Q2_002_partial_09_0653,
  ep_Q2_002_partial_09_0654,
  ep_Q2_002_partial_09_0655,
  ep_Q2_002_partial_09_0656,
  ep_Q2_002_partial_09_0657,
  ep_Q2_002_partial_09_0658,
  ep_Q2_002_partial_09_0659,
  ep_Q2_002_partial_09_0660,
  ep_Q2_002_partial_09_0661,
  ep_Q2_002_partial_09_0662,
  ep_Q2_002_partial_09_0663,
  ep_Q2_002_partial_09_0664,
  ep_Q2_002_partial_09_0665,
  ep_Q2_002_partial_09_0666,
  ep_Q2_002_partial_09_0667,
  ep_Q2_002_partial_09_0668,
  ep_Q2_002_partial_09_0669,
  ep_Q2_002_partial_09_0670,
  ep_Q2_002_partial_09_0671,
  ep_Q2_002_partial_09_0672,
  ep_Q2_002_partial_09_0673,
  ep_Q2_002_partial_09_0674,
  ep_Q2_002_partial_09_0675,
  ep_Q2_002_partial_09_0676,
  ep_Q2_002_partial_09_0677,
  ep_Q2_002_partial_09_0678,
  ep_Q2_002_partial_09_0679,
  ep_Q2_002_partial_09_0680,
  ep_Q2_002_partial_09_0681,
  ep_Q2_002_partial_09_0682,
  ep_Q2_002_partial_09_0683,
  ep_Q2_002_partial_09_0684,
  ep_Q2_002_partial_09_0685,
  ep_Q2_002_partial_09_0686,
  ep_Q2_002_partial_09_0687,
  ep_Q2_002_partial_09_0688,
  ep_Q2_002_partial_09_0689,
  ep_Q2_002_partial_09_0690,
  ep_Q2_002_partial_09_0691,
  ep_Q2_002_partial_09_0692,
  ep_Q2_002_partial_09_0693,
  ep_Q2_002_partial_09_0694,
  ep_Q2_002_partial_09_0695,
  ep_Q2_002_partial_09_0696,
  ep_Q2_002_partial_09_0697,
  ep_Q2_002_partial_09_0698,
  ep_Q2_002_partial_09_0699
]

/-- Sum of partial products in this block. -/
def ep_Q2_002_block_09_0600_0699 : Poly :=
[
  term ((733289072438507339304006111283254458050638 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (3, 1), (4, 1), (15, 1)],
  term ((313631849579 : Rat) / 44407903470) [(2, 1), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((-3222439211502731101395915864965088762783552 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (3, 1), (4, 1), (15, 3)],
  term ((-316951406728 : Rat) / 22203951735) [(2, 1), (3, 1), (4, 1), (15, 3), (16, 1)],
  term ((-60290186174310940265394395095320 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (4, 2), (11, 1)],
  term ((155320054720311158196368344574688 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (4, 2), (11, 1), (12, 1)],
  term ((-292496750104811025810885718375296 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (4, 2), (12, 1), (13, 1)],
  term ((-1854733942825719026280794174230390348277616 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (3, 1), (4, 2), (12, 1), (15, 1)],
  term ((-150050235908 : Rat) / 7401317245) [(2, 1), (3, 1), (4, 2), (12, 1), (15, 1), (16, 1)],
  term ((113537711218008458263363286329440 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (4, 2), (13, 1)],
  term ((1876504228983799834197160293342266383511292 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (3, 1), (4, 2), (15, 1)],
  term ((38126575709 : Rat) / 3171993105) [(2, 1), (3, 1), (4, 2), (15, 1), (16, 1)],
  term ((-16581426801286308336042798863376 : Rat) / 115799135485108289802725034287) [(2, 1), (3, 1), (5, 1), (6, 1), (7, 1), (11, 1)],
  term ((31225931900491550094602492438592 : Rat) / 115799135485108289802725034287) [(2, 1), (3, 1), (5, 1), (6, 1), (7, 1), (13, 1)],
  term ((899432459350431806461641186967346053573848 : Rat) / 122438019774574775144195206323084197045) [(2, 1), (3, 1), (5, 1), (6, 1), (7, 1), (15, 1)],
  term ((381790635174 : Rat) / 7401317245) [(2, 1), (3, 1), (5, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-58765049883094369365106792884144 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (5, 1), (6, 1), (11, 1), (15, 1)],
  term ((110665593966626782012825728493248 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (5, 1), (6, 1), (13, 1), (15, 1)],
  term ((-477548027383910106857882376654348211053432 : Rat) / 269363643504064505317229453910785233499) [(2, 1), (3, 1), (5, 1), (6, 1), (15, 2)],
  term ((-15565557134 : Rat) / 4440790347) [(2, 1), (3, 1), (5, 1), (6, 1), (15, 2), (16, 1)],
  term ((-16581426801286308336042798863376 : Rat) / 115799135485108289802725034287) [(2, 1), (3, 1), (5, 1), (7, 1), (11, 1), (14, 1)],
  term ((31225931900491550094602492438592 : Rat) / 115799135485108289802725034287) [(2, 1), (3, 1), (5, 1), (7, 1), (13, 1), (14, 1)],
  term ((899432459350431806461641186967346053573848 : Rat) / 122438019774574775144195206323084197045) [(2, 1), (3, 1), (5, 1), (7, 1), (14, 1), (15, 1)],
  term ((381790635174 : Rat) / 7401317245) [(2, 1), (3, 1), (5, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-58765049883094369365106792884144 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (5, 1), (11, 1), (14, 1), (15, 1)],
  term ((110665593966626782012825728493248 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (5, 1), (13, 1), (14, 1), (15, 1)],
  term ((-477548027383910106857882376654348211053432 : Rat) / 269363643504064505317229453910785233499) [(2, 1), (3, 1), (5, 1), (14, 1), (15, 2)],
  term ((-15565557134 : Rat) / 4440790347) [(2, 1), (3, 1), (5, 1), (14, 1), (15, 2), (16, 1)],
  term ((-226544563932581867337754068923712 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (6, 1), (7, 1), (9, 1), (11, 1)],
  term ((426625839293671833417952810677504 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (6, 1), (7, 1), (9, 1), (13, 1)],
  term ((1832662633459654280222474275573315954561152 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (3, 1), (6, 1), (7, 1), (9, 1), (15, 1)],
  term ((195028145136 : Rat) / 7401317245) [(2, 1), (3, 1), (6, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((135805839136413506742519103630896 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (6, 1), (7, 1), (11, 1), (15, 1)],
  term ((-255747827698023416306029971210432 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (6, 1), (7, 1), (13, 1), (15, 1)],
  term ((1065179004294772238378912060971987674872856 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (3, 1), (6, 1), (7, 1), (15, 2)],
  term ((-176342490026 : Rat) / 22203951735) [(2, 1), (3, 1), (6, 1), (7, 1), (15, 2), (16, 1)],
  term ((-407417517409240520227557310892688 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (6, 1), (7, 2), (11, 1)],
  term ((767243483094070248918089913631296 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (6, 1), (7, 2), (13, 1)],
  term ((-3195537012884316715136736182915963024618568 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (3, 1), (6, 1), (7, 2), (15, 1)],
  term ((176342490026 : Rat) / 7401317245) [(2, 1), (3, 1), (6, 1), (7, 2), (15, 1), (16, 1)],
  term ((9441714378768639552232807694976 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (6, 1), (8, 1), (11, 1)],
  term ((-17780516342082829308741707745792 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (6, 1), (8, 1), (13, 1)],
  term ((-161950540168329432747153192898304917045536 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (3, 1), (6, 1), (8, 1), (15, 1)],
  term ((-10542029528 : Rat) / 7401317245) [(2, 1), (3, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((75514854644193955779251356307904 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (6, 1), (9, 1), (11, 1), (15, 1)],
  term ((-142208613097890611139317603559168 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (6, 1), (9, 1), (13, 1), (15, 1)],
  term ((-610887544486551426740824758524438651520384 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (3, 1), (6, 1), (9, 1), (15, 2)],
  term ((-65009381712 : Rat) / 7401317245) [(2, 1), (3, 1), (6, 1), (9, 1), (15, 2), (16, 1)],
  term ((10228739102522576808136323134580 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (6, 1), (11, 1)],
  term ((11472114786262286023172194677648 : Rat) / 97983883872014706756151952089) [(2, 1), (3, 1), (6, 1), (11, 1), (12, 1)],
  term ((17341617585377006096152289814432 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (6, 1), (11, 1), (14, 1)],
  term ((-30164542231633246775576459460960 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (6, 1), (11, 1), (15, 2)],
  term ((-21604140546135555230315901527616 : Rat) / 97983883872014706756151952089) [(2, 1), (3, 1), (6, 1), (12, 1), (13, 1)],
  term ((649072541949630791072467051206583629357672 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (3, 1), (6, 1), (12, 1), (15, 1)],
  term ((-79286439714 : Rat) / 7401317245) [(2, 1), (3, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-19262631284449378994429317521360 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (6, 1), (13, 1)],
  term ((-32657513509231996253038558383744 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (6, 1), (13, 1), (14, 1)],
  term ((56805481990332207609573858088320 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (6, 1), (13, 1), (15, 2)],
  term ((519404449493496565434514805775342234666432 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (3, 1), (6, 1), (14, 1), (15, 1)],
  term ((3011850936 : Rat) / 7401317245) [(2, 1), (3, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((185655124692192889003123505855473906770918 : Rat) / 269363643504064505317229453910785233499) [(2, 1), (3, 1), (6, 1), (15, 1)],
  term ((21311157487 : Rat) / 8881580694) [(2, 1), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((3222439211502731101395915864965088762783552 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (3, 1), (6, 1), (15, 3)],
  term ((316951406728 : Rat) / 22203951735) [(2, 1), (3, 1), (6, 1), (15, 3), (16, 1)],
  term ((-226544563932581867337754068923712 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (7, 1), (9, 1), (11, 1), (14, 1)],
  term ((426625839293671833417952810677504 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (7, 1), (9, 1), (13, 1), (14, 1)],
  term ((1832662633459654280222474275573315954561152 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (3, 1), (7, 1), (9, 1), (14, 1), (15, 1)],
  term ((195028145136 : Rat) / 7401317245) [(2, 1), (3, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((135805839136413506742519103630896 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (7, 1), (11, 1), (14, 1), (15, 1)],
  term ((-255747827698023416306029971210432 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (7, 1), (13, 1), (14, 1), (15, 1)],
  term ((713260910256915948480 : Rat) / 253528477699481291099) [(2, 1), (3, 1), (7, 1), (14, 1)],
  term ((1065179004294772238378912060971987674872856 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (3, 1), (7, 1), (14, 1), (15, 2)],
  term ((-176342490026 : Rat) / 22203951735) [(2, 1), (3, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((-407417517409240520227557310892688 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (7, 2), (11, 1), (14, 1)],
  term ((767243483094070248918089913631296 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (7, 2), (13, 1), (14, 1)],
  term ((-3195537012884316715136736182915963024618568 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (3, 1), (7, 2), (14, 1), (15, 1)],
  term ((176342490026 : Rat) / 7401317245) [(2, 1), (3, 1), (7, 2), (14, 1), (15, 1), (16, 1)],
  term ((-9441714378768639552232807694976 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (8, 1), (11, 1), (14, 1)],
  term ((17780516342082829308741707745792 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (8, 1), (13, 1), (14, 1)],
  term ((161950540168329432747153192898304917045536 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (3, 1), (8, 1), (14, 1), (15, 1)],
  term ((10542029528 : Rat) / 7401317245) [(2, 1), (3, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((75514854644193955779251356307904 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (9, 1), (11, 1), (14, 1), (15, 1)],
  term ((-142208613097890611139317603559168 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((-610887544486551426740824758524438651520384 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (3, 1), (9, 1), (14, 1), (15, 2)],
  term ((-65009381712 : Rat) / 7401317245) [(2, 1), (3, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((17714465761563756053351934944976 : Rat) / 97983883872014706756151952089) [(2, 1), (3, 1), (11, 1), (12, 1), (14, 1)],
  term ((-152958295560407278554040067358516 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (11, 1), (14, 1)],
  term ((-30164542231633246775576459460960 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (11, 1), (14, 1), (15, 2)],
  term ((-33359656448941307461750664745792 : Rat) / 97983883872014706756151952089) [(2, 1), (3, 1), (12, 1), (13, 1), (14, 1)],
  term ((-210685590387681408437679559919985937066584 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (3, 1), (12, 1), (14, 1), (15, 1)],
  term ((-155009388322 : Rat) / 7401317245) [(2, 1), (3, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((288049115315819305901060817611472 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (13, 1), (14, 1)],
  term ((56805481990332207609573858088320 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (13, 1), (14, 1), (15, 2)],
  term ((-1220436488521508673073535660306261525679278 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (3, 1), (14, 1), (15, 1)],
  term ((382953023581 : Rat) / 44407903470) [(2, 1), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((3222439211502731101395915864965088762783552 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (3, 1), (14, 1), (15, 3)],
  term ((316951406728 : Rat) / 22203951735) [(2, 1), (3, 1), (14, 1), (15, 3), (16, 1)],
  term ((-16581426801286308336042798863376 : Rat) / 115799135485108289802725034287) [(2, 1), (4, 1), (5, 1), (6, 1), (11, 1)],
  term ((31225931900491550094602492438592 : Rat) / 115799135485108289802725034287) [(2, 1), (4, 1), (5, 1), (6, 1), (13, 1)],
  term ((899432459350431806461641186967346053573848 : Rat) / 122438019774574775144195206323084197045) [(2, 1), (4, 1), (5, 1), (6, 1), (15, 1)],
  term ((-366644536219253669652003055641627229025319 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (4, 1), (15, 1)],
  term ((-313631849579 : Rat) / 88815806940) [(3, 1), (4, 1), (15, 1), (16, 1)],
  term ((1611219605751365550697957932482544381391776 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (4, 1), (15, 3)],
  term ((158475703364 : Rat) / 22203951735) [(3, 1), (4, 1), (15, 3), (16, 1)],
  term ((30145093087155470132697197547660 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 2), (11, 1)],
  term ((-77660027360155579098184172287344 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 2), (11, 1), (12, 1)],
  term ((146248375052405512905442859187648 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 2), (12, 1), (13, 1)],
  term ((927366971412859513140397087115195174138808 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (4, 2), (12, 1), (15, 1)],
  term ((75025117954 : Rat) / 7401317245) [(3, 1), (4, 2), (12, 1), (15, 1), (16, 1)],
  term ((-56768855609004229131681643164720 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 2), (13, 1)],
  term ((-938252114491899917098580146671133191755646 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (4, 2), (15, 1)],
  term ((-38126575709 : Rat) / 6343986210) [(3, 1), (4, 2), (15, 1), (16, 1)],
  term ((8290713400643154168021399431688 : Rat) / 115799135485108289802725034287) [(3, 1), (5, 1), (6, 1), (7, 1), (11, 1)],
  term ((-15612965950245775047301246219296 : Rat) / 115799135485108289802725034287) [(3, 1), (5, 1), (6, 1), (7, 1), (13, 1)],
  term ((-449716229675215903230820593483673026786924 : Rat) / 122438019774574775144195206323084197045) [(3, 1), (5, 1), (6, 1), (7, 1), (15, 1)],
  term ((-190895317587 : Rat) / 7401317245) [(3, 1), (5, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((29382524941547184682553396442072 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (6, 1), (11, 1), (15, 1)],
  term ((-55332796983313391006412864246624 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (6, 1), (13, 1), (15, 1)],
  term ((238774013691955053428941188327174105526716 : Rat) / 269363643504064505317229453910785233499) [(3, 1), (5, 1), (6, 1), (15, 2)],
  term ((7782778567 : Rat) / 4440790347) [(3, 1), (5, 1), (6, 1), (15, 2), (16, 1)],
  term ((8290713400643154168021399431688 : Rat) / 115799135485108289802725034287) [(3, 1), (5, 1), (7, 1), (11, 1), (14, 1)],
  term ((-15612965950245775047301246219296 : Rat) / 115799135485108289802725034287) [(3, 1), (5, 1), (7, 1), (13, 1), (14, 1)],
  term ((-449716229675215903230820593483673026786924 : Rat) / 122438019774574775144195206323084197045) [(3, 1), (5, 1), (7, 1), (14, 1), (15, 1)],
  term ((-190895317587 : Rat) / 7401317245) [(3, 1), (5, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((29382524941547184682553396442072 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (11, 1), (14, 1), (15, 1)],
  term ((-55332796983313391006412864246624 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (13, 1), (14, 1), (15, 1)],
  term ((238774013691955053428941188327174105526716 : Rat) / 269363643504064505317229453910785233499) [(3, 1), (5, 1), (14, 1), (15, 2)],
  term ((7782778567 : Rat) / 4440790347) [(3, 1), (5, 1), (14, 1), (15, 2), (16, 1)],
  term ((113272281966290933668877034461856 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (7, 1), (9, 1), (11, 1)],
  term ((-213312919646835916708976405338752 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (7, 1), (9, 1), (13, 1)],
  term ((-916331316729827140111237137786657977280576 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (6, 1), (7, 1), (9, 1), (15, 1)],
  term ((-97514072568 : Rat) / 7401317245) [(3, 1), (6, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-67902919568206753371259551815448 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (7, 1), (11, 1), (15, 1)],
  term ((127873913849011708153014985605216 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (7, 1), (13, 1), (15, 1)],
  term ((-532589502147386119189456030485993837436428 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (6, 1), (7, 1), (15, 2)],
  term ((88171245013 : Rat) / 22203951735) [(3, 1), (6, 1), (7, 1), (15, 2), (16, 1)],
  term ((203708758704620260113778655446344 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (7, 2), (11, 1)],
  term ((-383621741547035124459044956815648 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (7, 2), (13, 1)],
  term ((1597768506442158357568368091457981512309284 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (6, 1), (7, 2), (15, 1)],
  term ((-88171245013 : Rat) / 7401317245) [(3, 1), (6, 1), (7, 2), (15, 1), (16, 1)],
  term ((-4720857189384319776116403847488 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (8, 1), (11, 1)],
  term ((8890258171041414654370853872896 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (8, 1), (13, 1)],
  term ((80975270084164716373576596449152458522768 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (6, 1), (8, 1), (15, 1)],
  term ((5271014764 : Rat) / 7401317245) [(3, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((-37757427322096977889625678153952 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (9, 1), (11, 1), (15, 1)],
  term ((71104306548945305569658801779584 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (9, 1), (13, 1), (15, 1)],
  term ((305443772243275713370412379262219325760192 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (6, 1), (9, 1), (15, 2)],
  term ((32504690856 : Rat) / 7401317245) [(3, 1), (6, 1), (9, 1), (15, 2), (16, 1)],
  term ((-5114369551261288404068161567290 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (11, 1)],
  term ((-5736057393131143011586097338824 : Rat) / 97983883872014706756151952089) [(3, 1), (6, 1), (11, 1), (12, 1)],
  term ((-8670808792688503048076144907216 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (11, 1), (14, 1)],
  term ((15082271115816623387788229730480 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (11, 1), (15, 2)],
  term ((10802070273067777615157950763808 : Rat) / 97983883872014706756151952089) [(3, 1), (6, 1), (12, 1), (13, 1)],
  term ((-324536270974815395536233525603291814678836 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (6, 1), (12, 1), (15, 1)],
  term ((39643219857 : Rat) / 7401317245) [(3, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((9631315642224689497214658760680 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (13, 1)],
  term ((16328756754615998126519279191872 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (13, 1), (14, 1)],
  term ((-28402740995166103804786929044160 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (13, 1), (15, 2)],
  term ((-259702224746748282717257402887671117333216 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (6, 1), (14, 1), (15, 1)],
  term ((-1505925468 : Rat) / 7401317245) [(3, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-92827562346096444501561752927736953385459 : Rat) / 269363643504064505317229453910785233499) [(3, 1), (6, 1), (15, 1)],
  term ((-21311157487 : Rat) / 17763161388) [(3, 1), (6, 1), (15, 1), (16, 1)],
  term ((-1611219605751365550697957932482544381391776 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (6, 1), (15, 3)],
  term ((-158475703364 : Rat) / 22203951735) [(3, 1), (6, 1), (15, 3), (16, 1)],
  term ((113272281966290933668877034461856 : Rat) / 1273790490336191187829975377157) [(3, 1), (7, 1), (9, 1), (11, 1), (14, 1)],
  term ((-213312919646835916708976405338752 : Rat) / 1273790490336191187829975377157) [(3, 1), (7, 1), (9, 1), (13, 1), (14, 1)],
  term ((-916331316729827140111237137786657977280576 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (7, 1), (9, 1), (14, 1), (15, 1)],
  term ((-97514072568 : Rat) / 7401317245) [(3, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-67902919568206753371259551815448 : Rat) / 1273790490336191187829975377157) [(3, 1), (7, 1), (11, 1), (14, 1), (15, 1)],
  term ((127873913849011708153014985605216 : Rat) / 1273790490336191187829975377157) [(3, 1), (7, 1), (13, 1), (14, 1), (15, 1)],
  term ((-356630455128457974240 : Rat) / 253528477699481291099) [(3, 1), (7, 1), (14, 1)],
  term ((-532589502147386119189456030485993837436428 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (7, 1), (14, 1), (15, 2)],
  term ((88171245013 : Rat) / 22203951735) [(3, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((203708758704620260113778655446344 : Rat) / 1273790490336191187829975377157) [(3, 1), (7, 2), (11, 1), (14, 1)],
  term ((-383621741547035124459044956815648 : Rat) / 1273790490336191187829975377157) [(3, 1), (7, 2), (13, 1), (14, 1)],
  term ((1597768506442158357568368091457981512309284 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (7, 2), (14, 1), (15, 1)],
  term ((-88171245013 : Rat) / 7401317245) [(3, 1), (7, 2), (14, 1), (15, 1), (16, 1)],
  term ((4720857189384319776116403847488 : Rat) / 1273790490336191187829975377157) [(3, 1), (8, 1), (11, 1), (14, 1)],
  term ((-8890258171041414654370853872896 : Rat) / 1273790490336191187829975377157) [(3, 1), (8, 1), (13, 1), (14, 1)],
  term ((-80975270084164716373576596449152458522768 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (8, 1), (14, 1), (15, 1)],
  term ((-5271014764 : Rat) / 7401317245) [(3, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-37757427322096977889625678153952 : Rat) / 1273790490336191187829975377157) [(3, 1), (9, 1), (11, 1), (14, 1), (15, 1)],
  term ((71104306548945305569658801779584 : Rat) / 1273790490336191187829975377157) [(3, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((305443772243275713370412379262219325760192 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (9, 1), (14, 1), (15, 2)],
  term ((32504690856 : Rat) / 7401317245) [(3, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-8857232880781878026675967472488 : Rat) / 97983883872014706756151952089) [(3, 1), (11, 1), (12, 1), (14, 1)],
  term ((76479147780203639277020033679258 : Rat) / 1273790490336191187829975377157) [(3, 1), (11, 1), (14, 1)],
  term ((15082271115816623387788229730480 : Rat) / 1273790490336191187829975377157) [(3, 1), (11, 1), (14, 1), (15, 2)],
  term ((16679828224470653730875332372896 : Rat) / 97983883872014706756151952089) [(3, 1), (12, 1), (13, 1), (14, 1)],
  term ((105342795193840704218839779959992968533292 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (12, 1), (14, 1), (15, 1)],
  term ((77504694161 : Rat) / 7401317245) [(3, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-144024557657909652950530408805736 : Rat) / 1273790490336191187829975377157) [(3, 1), (13, 1), (14, 1)],
  term ((-28402740995166103804786929044160 : Rat) / 1273790490336191187829975377157) [(3, 1), (13, 1), (14, 1), (15, 2)],
  term ((610218244260754336536767830153130762839639 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (14, 1), (15, 1)],
  term ((-382953023581 : Rat) / 88815806940) [(3, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1611219605751365550697957932482544381391776 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (14, 1), (15, 3)],
  term ((-158475703364 : Rat) / 22203951735) [(3, 1), (14, 1), (15, 3), (16, 1)],
  term ((8290713400643154168021399431688 : Rat) / 115799135485108289802725034287) [(4, 1), (5, 1), (6, 1), (11, 1)],
  term ((-15612965950245775047301246219296 : Rat) / 115799135485108289802725034287) [(4, 1), (5, 1), (6, 1), (13, 1)],
  term ((-449716229675215903230820593483673026786924 : Rat) / 122438019774574775144195206323084197045) [(4, 1), (5, 1), (6, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 9, terms 600 through 699. -/
theorem ep_Q2_002_block_09_0600_0699_valid :
    checkProductSumEq ep_Q2_002_partials_09_0600_0699
      ep_Q2_002_block_09_0600_0699 = true := by
  native_decide

end EpQ2002TermShards

end Patterns

end EndpointCertificate

end Problem97
