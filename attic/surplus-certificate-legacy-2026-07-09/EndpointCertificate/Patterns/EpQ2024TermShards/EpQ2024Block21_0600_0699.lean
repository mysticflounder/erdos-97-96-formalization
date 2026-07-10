/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_024, term block 21:600-699

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_024`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2024TermShards

/-- Generator polynomial 21 for endpoint certificate `ep_Q2_024`. -/
def ep_Q2_024_generator_21_0600_0699 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(10, 1)]
]

/-- Coefficient term 600 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0600 : Poly :=
[
  term ((1086154201315805 : Rat) / 1162780221153193) [(1, 1), (8, 2), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 600 for generator 21. -/
def ep_Q2_024_partial_21_0600 : Poly :=
[
  term ((2172308402631610 : Rat) / 1162780221153193) [(1, 1), (8, 2), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1086154201315805 : Rat) / 1162780221153193) [(1, 1), (8, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 600 for generator 21. -/
theorem ep_Q2_024_partial_21_0600_valid :
    mulPoly ep_Q2_024_coefficient_21_0600
        ep_Q2_024_generator_21_0600_0699 =
      ep_Q2_024_partial_21_0600 := by
  native_decide

/-- Coefficient term 601 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0601 : Poly :=
[
  term ((8275709440100912892211675038987725738048 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (8, 2), (13, 1)]
]

/-- Partial product 601 for generator 21. -/
def ep_Q2_024_partial_21_0601 : Poly :=
[
  term ((16551418880201825784423350077975451476096 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (8, 2), (10, 1), (13, 1)],
  term ((-8275709440100912892211675038987725738048 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (8, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 601 for generator 21. -/
theorem ep_Q2_024_partial_21_0601_valid :
    mulPoly ep_Q2_024_coefficient_21_0601
        ep_Q2_024_generator_21_0600_0699 =
      ep_Q2_024_partial_21_0601 := by
  native_decide

/-- Coefficient term 602 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0602 : Poly :=
[
  term ((8106296284960604636905427382372649950820795712175917799 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (8, 2), (15, 1)]
]

/-- Partial product 602 for generator 21. -/
def ep_Q2_024_partial_21_0602 : Poly :=
[
  term ((16212592569921209273810854764745299901641591424351835598 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (8, 2), (10, 1), (15, 1)],
  term ((-8106296284960604636905427382372649950820795712175917799 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (8, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 602 for generator 21. -/
theorem ep_Q2_024_partial_21_0602_valid :
    mulPoly ep_Q2_024_coefficient_21_0602
        ep_Q2_024_generator_21_0600_0699 =
      ep_Q2_024_partial_21_0602 := by
  native_decide

/-- Coefficient term 603 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0603 : Poly :=
[
  term ((-8683303471552472 : Rat) / 3488340663459579) [(1, 1), (8, 2), (15, 1), (16, 1)]
]

/-- Partial product 603 for generator 21. -/
def ep_Q2_024_partial_21_0603 : Poly :=
[
  term ((-17366606943104944 : Rat) / 3488340663459579) [(1, 1), (8, 2), (10, 1), (15, 1), (16, 1)],
  term ((8683303471552472 : Rat) / 3488340663459579) [(1, 1), (8, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 603 for generator 21. -/
theorem ep_Q2_024_partial_21_0603_valid :
    mulPoly ep_Q2_024_coefficient_21_0603
        ep_Q2_024_generator_21_0600_0699 =
      ep_Q2_024_partial_21_0603 := by
  native_decide

/-- Coefficient term 604 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0604 : Poly :=
[
  term ((237333185862901430680855269554656779911 : Rat) / 1199709457402477296566693528029539267990) [(1, 1), (9, 1)]
]

/-- Partial product 604 for generator 21. -/
def ep_Q2_024_partial_21_0604 : Poly :=
[
  term ((-237333185862901430680855269554656779911 : Rat) / 1199709457402477296566693528029539267990) [(1, 1), (9, 1)],
  term ((237333185862901430680855269554656779911 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (9, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 604 for generator 21. -/
theorem ep_Q2_024_partial_21_0604_valid :
    mulPoly ep_Q2_024_coefficient_21_0604
        ep_Q2_024_generator_21_0600_0699 =
      ep_Q2_024_partial_21_0604 := by
  native_decide

/-- Coefficient term 605 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0605 : Poly :=
[
  term ((237333185862901430680855269554656779911 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (9, 1), (10, 1)]
]

/-- Partial product 605 for generator 21. -/
def ep_Q2_024_partial_21_0605 : Poly :=
[
  term ((-237333185862901430680855269554656779911 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (9, 1), (10, 1)],
  term ((474666371725802861361710539109313559822 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (9, 1), (10, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 605 for generator 21. -/
theorem ep_Q2_024_partial_21_0605_valid :
    mulPoly ep_Q2_024_coefficient_21_0605
        ep_Q2_024_generator_21_0600_0699 =
      ep_Q2_024_partial_21_0605 := by
  native_decide

/-- Coefficient term 606 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0606 : Poly :=
[
  term ((5376850268926733078407856162700184262 : Rat) / 2033405860004198807740158522083964861) [(1, 1), (9, 1), (10, 1), (12, 1)]
]

/-- Partial product 606 for generator 21. -/
def ep_Q2_024_partial_21_0606 : Poly :=
[
  term ((-5376850268926733078407856162700184262 : Rat) / 2033405860004198807740158522083964861) [(1, 1), (9, 1), (10, 1), (12, 1)],
  term ((10753700537853466156815712325400368524 : Rat) / 2033405860004198807740158522083964861) [(1, 1), (9, 1), (10, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 606 for generator 21. -/
theorem ep_Q2_024_partial_21_0606_valid :
    mulPoly ep_Q2_024_coefficient_21_0606
        ep_Q2_024_generator_21_0600_0699 =
      ep_Q2_024_partial_21_0606 := by
  native_decide

/-- Coefficient term 607 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0607 : Poly :=
[
  term ((2047818080201274466308686617343593935035288847100251241 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (9, 1), (10, 1), (13, 1), (15, 1)]
]

/-- Partial product 607 for generator 21. -/
def ep_Q2_024_partial_21_0607 : Poly :=
[
  term ((-2047818080201274466308686617343593935035288847100251241 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((4095636160402548932617373234687187870070577694200502482 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (9, 1), (10, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 607 for generator 21. -/
theorem ep_Q2_024_partial_21_0607_valid :
    mulPoly ep_Q2_024_coefficient_21_0607
        ep_Q2_024_generator_21_0600_0699 =
      ep_Q2_024_partial_21_0607 := by
  native_decide

/-- Coefficient term 608 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0608 : Poly :=
[
  term ((596913039183748 : Rat) / 1162780221153193) [(1, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 608 for generator 21. -/
def ep_Q2_024_partial_21_0608 : Poly :=
[
  term ((-596913039183748 : Rat) / 1162780221153193) [(1, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((1193826078367496 : Rat) / 1162780221153193) [(1, 1), (9, 1), (10, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 608 for generator 21. -/
theorem ep_Q2_024_partial_21_0608_valid :
    mulPoly ep_Q2_024_coefficient_21_0608
        ep_Q2_024_generator_21_0600_0699 =
      ep_Q2_024_partial_21_0608 := by
  native_decide

/-- Coefficient term 609 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0609 : Poly :=
[
  term ((153878548369030034546512685063043674368 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (9, 1), (10, 1), (13, 2)]
]

/-- Partial product 609 for generator 21. -/
def ep_Q2_024_partial_21_0609 : Poly :=
[
  term ((-153878548369030034546512685063043674368 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (9, 1), (10, 1), (13, 2)],
  term ((307757096738060069093025370126087348736 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (9, 1), (10, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 609 for generator 21. -/
theorem ep_Q2_024_partial_21_0609_valid :
    mulPoly ep_Q2_024_coefficient_21_0609
        ep_Q2_024_generator_21_0600_0699 =
      ep_Q2_024_partial_21_0609 := by
  native_decide

/-- Coefficient term 610 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0610 : Poly :=
[
  term ((-1237112775840867861314563918548255670752 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (9, 1), (10, 1), (14, 1)]
]

/-- Partial product 610 for generator 21. -/
def ep_Q2_024_partial_21_0610 : Poly :=
[
  term ((1237112775840867861314563918548255670752 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (9, 1), (10, 1), (14, 1)],
  term ((-2474225551681735722629127837096511341504 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (9, 1), (10, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 610 for generator 21. -/
theorem ep_Q2_024_partial_21_0610_valid :
    mulPoly ep_Q2_024_coefficient_21_0610
        ep_Q2_024_generator_21_0600_0699 =
      ep_Q2_024_partial_21_0610 := by
  native_decide

/-- Coefficient term 611 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0611 : Poly :=
[
  term ((-52209993745386587556466945432264188113755967333291914913 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(1, 1), (9, 1), (10, 1), (15, 2)]
]

/-- Partial product 611 for generator 21. -/
def ep_Q2_024_partial_21_0611 : Poly :=
[
  term ((52209993745386587556466945432264188113755967333291914913 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(1, 1), (9, 1), (10, 1), (15, 2)],
  term ((-52209993745386587556466945432264188113755967333291914913 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (9, 1), (10, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 611 for generator 21. -/
theorem ep_Q2_024_partial_21_0611_valid :
    mulPoly ep_Q2_024_coefficient_21_0611
        ep_Q2_024_generator_21_0600_0699 =
      ep_Q2_024_partial_21_0611 := by
  native_decide

/-- Coefficient term 612 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0612 : Poly :=
[
  term ((4095023840331510 : Rat) / 1162780221153193) [(1, 1), (9, 1), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 612 for generator 21. -/
def ep_Q2_024_partial_21_0612 : Poly :=
[
  term ((-4095023840331510 : Rat) / 1162780221153193) [(1, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((8190047680663020 : Rat) / 1162780221153193) [(1, 1), (9, 1), (10, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 612 for generator 21. -/
theorem ep_Q2_024_partial_21_0612_valid :
    mulPoly ep_Q2_024_coefficient_21_0612
        ep_Q2_024_generator_21_0600_0699 =
      ep_Q2_024_partial_21_0612 := by
  native_decide

/-- Coefficient term 613 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0613 : Poly :=
[
  term ((-84137745390860658180211860664979045196 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (9, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 613 for generator 21. -/
def ep_Q2_024_partial_21_0613 : Poly :=
[
  term ((-168275490781721316360423721329958090392 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (9, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((84137745390860658180211860664979045196 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (9, 1), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 613 for generator 21. -/
theorem ep_Q2_024_partial_21_0613_valid :
    mulPoly ep_Q2_024_coefficient_21_0613
        ep_Q2_024_generator_21_0600_0699 =
      ep_Q2_024_partial_21_0613 := by
  native_decide

/-- Coefficient term 614 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0614 : Poly :=
[
  term ((1572412685156106218853659204789658496018 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (9, 1), (12, 1)]
]

/-- Partial product 614 for generator 21. -/
def ep_Q2_024_partial_21_0614 : Poly :=
[
  term ((3144825370312212437707318409579316992036 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (9, 1), (10, 1), (12, 1)],
  term ((-1572412685156106218853659204789658496018 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (9, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 614 for generator 21. -/
theorem ep_Q2_024_partial_21_0614_valid :
    mulPoly ep_Q2_024_coefficient_21_0614
        ep_Q2_024_generator_21_0600_0699 =
      ep_Q2_024_partial_21_0614 := by
  native_decide

/-- Coefficient term 615 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0615 : Poly :=
[
  term ((-241325305719370233097203105089965295796 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (9, 1), (12, 1), (14, 1)]
]

/-- Partial product 615 for generator 21. -/
def ep_Q2_024_partial_21_0615 : Poly :=
[
  term ((-482650611438740466194406210179930591592 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (9, 1), (10, 1), (12, 1), (14, 1)],
  term ((241325305719370233097203105089965295796 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (9, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 615 for generator 21. -/
theorem ep_Q2_024_partial_21_0615_valid :
    mulPoly ep_Q2_024_coefficient_21_0615
        ep_Q2_024_generator_21_0600_0699 =
      ep_Q2_024_partial_21_0615 := by
  native_decide

/-- Coefficient term 616 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0616 : Poly :=
[
  term ((1788692416620335209089756674861747871064 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (9, 1), (12, 2)]
]

/-- Partial product 616 for generator 21. -/
def ep_Q2_024_partial_21_0616 : Poly :=
[
  term ((3577384833240670418179513349723495742128 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (9, 1), (10, 1), (12, 2)],
  term ((-1788692416620335209089756674861747871064 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (9, 1), (12, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 616 for generator 21. -/
theorem ep_Q2_024_partial_21_0616_valid :
    mulPoly ep_Q2_024_coefficient_21_0616
        ep_Q2_024_generator_21_0600_0699 =
      ep_Q2_024_partial_21_0616 := by
  native_decide

/-- Coefficient term 617 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0617 : Poly :=
[
  term ((2047818080201274466308686617343593935035288847100251241 : Rat) / 278999685639605945551432029250879769240203926974238414) [(1, 1), (9, 1), (13, 1), (15, 1)]
]

/-- Partial product 617 for generator 21. -/
def ep_Q2_024_partial_21_0617 : Poly :=
[
  term ((2047818080201274466308686617343593935035288847100251241 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((-2047818080201274466308686617343593935035288847100251241 : Rat) / 278999685639605945551432029250879769240203926974238414) [(1, 1), (9, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 617 for generator 21. -/
theorem ep_Q2_024_partial_21_0617_valid :
    mulPoly ep_Q2_024_coefficient_21_0617
        ep_Q2_024_generator_21_0600_0699 =
      ep_Q2_024_partial_21_0617 := by
  native_decide

/-- Coefficient term 618 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0618 : Poly :=
[
  term ((298456519591874 : Rat) / 1162780221153193) [(1, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 618 for generator 21. -/
def ep_Q2_024_partial_21_0618 : Poly :=
[
  term ((596913039183748 : Rat) / 1162780221153193) [(1, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-298456519591874 : Rat) / 1162780221153193) [(1, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 618 for generator 21. -/
theorem ep_Q2_024_partial_21_0618_valid :
    mulPoly ep_Q2_024_coefficient_21_0618
        ep_Q2_024_generator_21_0600_0699 =
      ep_Q2_024_partial_21_0618 := by
  native_decide

/-- Coefficient term 619 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0619 : Poly :=
[
  term ((76939274184515017273256342531521837184 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (9, 1), (13, 2)]
]

/-- Partial product 619 for generator 21. -/
def ep_Q2_024_partial_21_0619 : Poly :=
[
  term ((153878548369030034546512685063043674368 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (9, 1), (10, 1), (13, 2)],
  term ((-76939274184515017273256342531521837184 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (9, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 619 for generator 21. -/
theorem ep_Q2_024_partial_21_0619_valid :
    mulPoly ep_Q2_024_coefficient_21_0619
        ep_Q2_024_generator_21_0600_0699 =
      ep_Q2_024_partial_21_0619 := by
  native_decide

/-- Coefficient term 620 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0620 : Poly :=
[
  term ((-618556387920433930657281959274127835376 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (9, 1), (14, 1)]
]

/-- Partial product 620 for generator 21. -/
def ep_Q2_024_partial_21_0620 : Poly :=
[
  term ((-1237112775840867861314563918548255670752 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (9, 1), (10, 1), (14, 1)],
  term ((618556387920433930657281959274127835376 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 620 for generator 21. -/
theorem ep_Q2_024_partial_21_0620_valid :
    mulPoly ep_Q2_024_coefficient_21_0620
        ep_Q2_024_generator_21_0600_0699 =
      ep_Q2_024_partial_21_0620 := by
  native_decide

/-- Coefficient term 621 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0621 : Poly :=
[
  term ((-52209993745386587556466945432264188113755967333291914913 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(1, 1), (9, 1), (15, 2)]
]

/-- Partial product 621 for generator 21. -/
def ep_Q2_024_partial_21_0621 : Poly :=
[
  term ((-52209993745386587556466945432264188113755967333291914913 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(1, 1), (9, 1), (10, 1), (15, 2)],
  term ((52209993745386587556466945432264188113755967333291914913 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(1, 1), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 621 for generator 21. -/
theorem ep_Q2_024_partial_21_0621_valid :
    mulPoly ep_Q2_024_coefficient_21_0621
        ep_Q2_024_generator_21_0600_0699 =
      ep_Q2_024_partial_21_0621 := by
  native_decide

/-- Coefficient term 622 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0622 : Poly :=
[
  term ((2047511920165755 : Rat) / 1162780221153193) [(1, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 622 for generator 21. -/
def ep_Q2_024_partial_21_0622 : Poly :=
[
  term ((4095023840331510 : Rat) / 1162780221153193) [(1, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((-2047511920165755 : Rat) / 1162780221153193) [(1, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 622 for generator 21. -/
theorem ep_Q2_024_partial_21_0622_valid :
    mulPoly ep_Q2_024_coefficient_21_0622
        ep_Q2_024_generator_21_0600_0699 =
      ep_Q2_024_partial_21_0622 := by
  native_decide

/-- Coefficient term 623 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0623 : Poly :=
[
  term ((-93437070800928499521102139485314090752 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (9, 2), (10, 1), (13, 1)]
]

/-- Partial product 623 for generator 21. -/
def ep_Q2_024_partial_21_0623 : Poly :=
[
  term ((93437070800928499521102139485314090752 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (9, 2), (10, 1), (13, 1)],
  term ((-186874141601856999042204278970628181504 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (9, 2), (10, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 623 for generator 21. -/
theorem ep_Q2_024_partial_21_0623_valid :
    mulPoly ep_Q2_024_coefficient_21_0623
        ep_Q2_024_generator_21_0600_0699 =
      ep_Q2_024_partial_21_0623 := by
  native_decide

/-- Coefficient term 624 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0624 : Poly :=
[
  term ((2449020209846403374712074673893548417307732695016543182 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (9, 2), (10, 1), (15, 1)]
]

/-- Partial product 624 for generator 21. -/
def ep_Q2_024_partial_21_0624 : Poly :=
[
  term ((-2449020209846403374712074673893548417307732695016543182 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (9, 2), (10, 1), (15, 1)],
  term ((4898040419692806749424149347787096834615465390033086364 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (9, 2), (10, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 624 for generator 21. -/
theorem ep_Q2_024_partial_21_0624_valid :
    mulPoly ep_Q2_024_coefficient_21_0624
        ep_Q2_024_generator_21_0600_0699 =
      ep_Q2_024_partial_21_0624 := by
  native_decide

/-- Coefficient term 625 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0625 : Poly :=
[
  term ((-1495148449544936 : Rat) / 1162780221153193) [(1, 1), (9, 2), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 625 for generator 21. -/
def ep_Q2_024_partial_21_0625 : Poly :=
[
  term ((1495148449544936 : Rat) / 1162780221153193) [(1, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((-2990296899089872 : Rat) / 1162780221153193) [(1, 1), (9, 2), (10, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 625 for generator 21. -/
theorem ep_Q2_024_partial_21_0625_valid :
    mulPoly ep_Q2_024_coefficient_21_0625
        ep_Q2_024_generator_21_0600_0699 =
      ep_Q2_024_partial_21_0625 := by
  native_decide

/-- Coefficient term 626 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0626 : Poly :=
[
  term ((-46718535400464249760551069742657045376 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (9, 2), (13, 1)]
]

/-- Partial product 626 for generator 21. -/
def ep_Q2_024_partial_21_0626 : Poly :=
[
  term ((-93437070800928499521102139485314090752 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (9, 2), (10, 1), (13, 1)],
  term ((46718535400464249760551069742657045376 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (9, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 626 for generator 21. -/
theorem ep_Q2_024_partial_21_0626_valid :
    mulPoly ep_Q2_024_coefficient_21_0626
        ep_Q2_024_generator_21_0600_0699 =
      ep_Q2_024_partial_21_0626 := by
  native_decide

/-- Coefficient term 627 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0627 : Poly :=
[
  term ((1224510104923201687356037336946774208653866347508271591 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (9, 2), (15, 1)]
]

/-- Partial product 627 for generator 21. -/
def ep_Q2_024_partial_21_0627 : Poly :=
[
  term ((2449020209846403374712074673893548417307732695016543182 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (9, 2), (10, 1), (15, 1)],
  term ((-1224510104923201687356037336946774208653866347508271591 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (9, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 627 for generator 21. -/
theorem ep_Q2_024_partial_21_0627_valid :
    mulPoly ep_Q2_024_coefficient_21_0627
        ep_Q2_024_generator_21_0600_0699 =
      ep_Q2_024_partial_21_0627 := by
  native_decide

/-- Coefficient term 628 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0628 : Poly :=
[
  term ((-747574224772468 : Rat) / 1162780221153193) [(1, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 628 for generator 21. -/
def ep_Q2_024_partial_21_0628 : Poly :=
[
  term ((-1495148449544936 : Rat) / 1162780221153193) [(1, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((747574224772468 : Rat) / 1162780221153193) [(1, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 628 for generator 21. -/
theorem ep_Q2_024_partial_21_0628_valid :
    mulPoly ep_Q2_024_coefficient_21_0628
        ep_Q2_024_generator_21_0600_0699 =
      ep_Q2_024_partial_21_0628 := by
  native_decide

/-- Coefficient term 629 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0629 : Poly :=
[
  term ((-63112532186469946331305143931700421056 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (9, 3)]
]

/-- Partial product 629 for generator 21. -/
def ep_Q2_024_partial_21_0629 : Poly :=
[
  term ((63112532186469946331305143931700421056 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (9, 3)],
  term ((-126225064372939892662610287863400842112 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (9, 3), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 629 for generator 21. -/
theorem ep_Q2_024_partial_21_0629_valid :
    mulPoly ep_Q2_024_coefficient_21_0629
        ep_Q2_024_generator_21_0600_0699 =
      ep_Q2_024_partial_21_0629 := by
  native_decide

/-- Coefficient term 630 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0630 : Poly :=
[
  term ((-126225064372939892662610287863400842112 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (9, 3), (10, 1)]
]

/-- Partial product 630 for generator 21. -/
def ep_Q2_024_partial_21_0630 : Poly :=
[
  term ((126225064372939892662610287863400842112 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (9, 3), (10, 1)],
  term ((-252450128745879785325220575726801684224 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (9, 3), (10, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 630 for generator 21. -/
theorem ep_Q2_024_partial_21_0630_valid :
    mulPoly ep_Q2_024_coefficient_21_0630
        ep_Q2_024_generator_21_0600_0699 =
      ep_Q2_024_partial_21_0630 := by
  native_decide

/-- Coefficient term 631 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0631 : Poly :=
[
  term ((1429182194689304419382031011936884624481 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (10, 1), (11, 1)]
]

/-- Partial product 631 for generator 21. -/
def ep_Q2_024_partial_21_0631 : Poly :=
[
  term ((-1429182194689304419382031011936884624481 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (10, 1), (11, 1)],
  term ((2858364389378608838764062023873769248962 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (10, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 631 for generator 21. -/
theorem ep_Q2_024_partial_21_0631_valid :
    mulPoly ep_Q2_024_coefficient_21_0631
        ep_Q2_024_generator_21_0600_0699 =
      ep_Q2_024_partial_21_0631 := by
  native_decide

/-- Coefficient term 632 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0632 : Poly :=
[
  term ((743728828033921465155816990252479329548 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (10, 1), (12, 1), (13, 1)]
]

/-- Partial product 632 for generator 21. -/
def ep_Q2_024_partial_21_0632 : Poly :=
[
  term ((-743728828033921465155816990252479329548 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (10, 1), (12, 1), (13, 1)],
  term ((1487457656067842930311633980504958659096 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (10, 2), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 632 for generator 21. -/
theorem ep_Q2_024_partial_21_0632_valid :
    mulPoly ep_Q2_024_coefficient_21_0632
        ep_Q2_024_generator_21_0600_0699 =
      ep_Q2_024_partial_21_0632 := by
  native_decide

/-- Coefficient term 633 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0633 : Poly :=
[
  term ((-296643393949947970943582733117341809304 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (10, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 633 for generator 21. -/
def ep_Q2_024_partial_21_0633 : Poly :=
[
  term ((296643393949947970943582733117341809304 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((-593286787899895941887165466234683618608 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (10, 2), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 633 for generator 21. -/
theorem ep_Q2_024_partial_21_0633_valid :
    mulPoly ep_Q2_024_coefficient_21_0633
        ep_Q2_024_generator_21_0600_0699 =
      ep_Q2_024_partial_21_0633 := by
  native_decide

/-- Coefficient term 634 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0634 : Poly :=
[
  term ((20252641348034408839391540692055832082022486889027059413 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(1, 1), (10, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 634 for generator 21. -/
def ep_Q2_024_partial_21_0634 : Poly :=
[
  term ((-20252641348034408839391540692055832082022486889027059413 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(1, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((20252641348034408839391540692055832082022486889027059413 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (10, 2), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 634 for generator 21. -/
theorem ep_Q2_024_partial_21_0634_valid :
    mulPoly ep_Q2_024_coefficient_21_0634
        ep_Q2_024_generator_21_0600_0699 =
      ep_Q2_024_partial_21_0634 := by
  native_decide

/-- Coefficient term 635 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0635 : Poly :=
[
  term ((-2189297816169598 : Rat) / 1162780221153193) [(1, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 635 for generator 21. -/
def ep_Q2_024_partial_21_0635 : Poly :=
[
  term ((2189297816169598 : Rat) / 1162780221153193) [(1, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4378595632339196 : Rat) / 1162780221153193) [(1, 1), (10, 2), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 635 for generator 21. -/
theorem ep_Q2_024_partial_21_0635_valid :
    mulPoly ep_Q2_024_coefficient_21_0635
        ep_Q2_024_generator_21_0600_0699 =
      ep_Q2_024_partial_21_0635 := by
  native_decide

/-- Coefficient term 636 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0636 : Poly :=
[
  term ((-63627736971180017614311097019407767411616512022247398207 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(1, 1), (10, 1), (12, 1), (15, 1)]
]

/-- Partial product 636 for generator 21. -/
def ep_Q2_024_partial_21_0636 : Poly :=
[
  term ((63627736971180017614311097019407767411616512022247398207 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(1, 1), (10, 1), (12, 1), (15, 1)],
  term ((-63627736971180017614311097019407767411616512022247398207 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(1, 1), (10, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 636 for generator 21. -/
theorem ep_Q2_024_partial_21_0636_valid :
    mulPoly ep_Q2_024_coefficient_21_0636
        ep_Q2_024_generator_21_0600_0699 =
      ep_Q2_024_partial_21_0636 := by
  native_decide

/-- Coefficient term 637 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0637 : Poly :=
[
  term ((13803265389892245 : Rat) / 4651120884612772) [(1, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 637 for generator 21. -/
def ep_Q2_024_partial_21_0637 : Poly :=
[
  term ((-13803265389892245 : Rat) / 4651120884612772) [(1, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((13803265389892245 : Rat) / 2325560442306386) [(1, 1), (10, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 637 for generator 21. -/
theorem ep_Q2_024_partial_21_0637_valid :
    mulPoly ep_Q2_024_coefficient_21_0637
        ep_Q2_024_generator_21_0600_0699 =
      ep_Q2_024_partial_21_0637 := by
  native_decide

/-- Coefficient term 638 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0638 : Poly :=
[
  term ((10028931010980774301758966752230338400 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (10, 1), (12, 2), (13, 1)]
]

/-- Partial product 638 for generator 21. -/
def ep_Q2_024_partial_21_0638 : Poly :=
[
  term ((-10028931010980774301758966752230338400 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (10, 1), (12, 2), (13, 1)],
  term ((20057862021961548603517933504460676800 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (10, 2), (12, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 638 for generator 21. -/
theorem ep_Q2_024_partial_21_0638_valid :
    mulPoly ep_Q2_024_coefficient_21_0638
        ep_Q2_024_generator_21_0600_0699 =
      ep_Q2_024_partial_21_0638 := by
  native_decide

/-- Coefficient term 639 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0639 : Poly :=
[
  term ((-114630181599190021257419907490037456792696368155373715 : Rat) / 46499947606600990925238671541813294873367321162373069) [(1, 1), (10, 1), (12, 2), (15, 1)]
]

/-- Partial product 639 for generator 21. -/
def ep_Q2_024_partial_21_0639 : Poly :=
[
  term ((114630181599190021257419907490037456792696368155373715 : Rat) / 46499947606600990925238671541813294873367321162373069) [(1, 1), (10, 1), (12, 2), (15, 1)],
  term ((-229260363198380042514839814980074913585392736310747430 : Rat) / 46499947606600990925238671541813294873367321162373069) [(1, 1), (10, 2), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 639 for generator 21. -/
theorem ep_Q2_024_partial_21_0639_valid :
    mulPoly ep_Q2_024_coefficient_21_0639
        ep_Q2_024_generator_21_0600_0699 =
      ep_Q2_024_partial_21_0639 := by
  native_decide

/-- Coefficient term 640 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0640 : Poly :=
[
  term ((1503525091682300 : Rat) / 1162780221153193) [(1, 1), (10, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 640 for generator 21. -/
def ep_Q2_024_partial_21_0640 : Poly :=
[
  term ((-1503525091682300 : Rat) / 1162780221153193) [(1, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((3007050183364600 : Rat) / 1162780221153193) [(1, 1), (10, 2), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 640 for generator 21. -/
theorem ep_Q2_024_partial_21_0640_valid :
    mulPoly ep_Q2_024_coefficient_21_0640
        ep_Q2_024_generator_21_0600_0699 =
      ep_Q2_024_partial_21_0640 := by
  native_decide

/-- Coefficient term 641 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0641 : Poly :=
[
  term ((374161071782279539019315125263367990046 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (10, 1), (13, 1)]
]

/-- Partial product 641 for generator 21. -/
def ep_Q2_024_partial_21_0641 : Poly :=
[
  term ((-374161071782279539019315125263367990046 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (10, 1), (13, 1)],
  term ((748322143564559078038630250526735980092 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (10, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 641 for generator 21. -/
theorem ep_Q2_024_partial_21_0641_valid :
    mulPoly ep_Q2_024_coefficient_21_0641
        ep_Q2_024_generator_21_0600_0699 =
      ep_Q2_024_partial_21_0641 := by
  native_decide

/-- Coefficient term 642 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0642 : Poly :=
[
  term ((-2694544970124256243547102523240490961236 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (10, 1), (13, 1), (14, 1)]
]

/-- Partial product 642 for generator 21. -/
def ep_Q2_024_partial_21_0642 : Poly :=
[
  term ((2694544970124256243547102523240490961236 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (10, 1), (13, 1), (14, 1)],
  term ((-5389089940248512487094205046480981922472 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (10, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 642 for generator 21. -/
theorem ep_Q2_024_partial_21_0642_valid :
    mulPoly ep_Q2_024_coefficient_21_0642
        ep_Q2_024_generator_21_0600_0699 =
      ep_Q2_024_partial_21_0642 := by
  native_decide

/-- Coefficient term 643 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0643 : Poly :=
[
  term ((1782882398220433258379987525289416869685846899350097674 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (10, 1), (13, 1), (15, 2)]
]

/-- Partial product 643 for generator 21. -/
def ep_Q2_024_partial_21_0643 : Poly :=
[
  term ((-1782882398220433258379987525289416869685846899350097674 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (10, 1), (13, 1), (15, 2)],
  term ((3565764796440866516759975050578833739371693798700195348 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (10, 2), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 643 for generator 21. -/
theorem ep_Q2_024_partial_21_0643_valid :
    mulPoly ep_Q2_024_coefficient_21_0643
        ep_Q2_024_generator_21_0600_0699 =
      ep_Q2_024_partial_21_0643 := by
  native_decide

/-- Coefficient term 644 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0644 : Poly :=
[
  term ((-615982979041608 : Rat) / 1162780221153193) [(1, 1), (10, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 644 for generator 21. -/
def ep_Q2_024_partial_21_0644 : Poly :=
[
  term ((615982979041608 : Rat) / 1162780221153193) [(1, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1231965958083216 : Rat) / 1162780221153193) [(1, 1), (10, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 644 for generator 21. -/
theorem ep_Q2_024_partial_21_0644_valid :
    mulPoly ep_Q2_024_coefficient_21_0644
        ep_Q2_024_generator_21_0600_0699 =
      ep_Q2_024_partial_21_0644 := by
  native_decide

/-- Coefficient term 645 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0645 : Poly :=
[
  term ((-1158470467526316153526390429368632037283251313046047402 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (10, 1), (13, 2), (15, 1)]
]

/-- Partial product 645 for generator 21. -/
def ep_Q2_024_partial_21_0645 : Poly :=
[
  term ((1158470467526316153526390429368632037283251313046047402 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (10, 1), (13, 2), (15, 1)],
  term ((-2316940935052632307052780858737264074566502626092094804 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (10, 2), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 645 for generator 21. -/
theorem ep_Q2_024_partial_21_0645_valid :
    mulPoly ep_Q2_024_coefficient_21_0645
        ep_Q2_024_generator_21_0600_0699 =
      ep_Q2_024_partial_21_0645 := by
  native_decide

/-- Coefficient term 646 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0646 : Poly :=
[
  term ((75330592794360 : Rat) / 1162780221153193) [(1, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 646 for generator 21. -/
def ep_Q2_024_partial_21_0646 : Poly :=
[
  term ((-75330592794360 : Rat) / 1162780221153193) [(1, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((150661185588720 : Rat) / 1162780221153193) [(1, 1), (10, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 646 for generator 21. -/
theorem ep_Q2_024_partial_21_0646_valid :
    mulPoly ep_Q2_024_coefficient_21_0646
        ep_Q2_024_generator_21_0600_0699 =
      ep_Q2_024_partial_21_0646 := by
  native_decide

/-- Coefficient term 647 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0647 : Poly :=
[
  term ((40472928056033817116049120031239046672 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (10, 1), (13, 3)]
]

/-- Partial product 647 for generator 21. -/
def ep_Q2_024_partial_21_0647 : Poly :=
[
  term ((-40472928056033817116049120031239046672 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (10, 1), (13, 3)],
  term ((80945856112067634232098240062478093344 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (10, 2), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 647 for generator 21. -/
theorem ep_Q2_024_partial_21_0647_valid :
    mulPoly ep_Q2_024_coefficient_21_0647
        ep_Q2_024_generator_21_0600_0699 =
      ep_Q2_024_partial_21_0647 := by
  native_decide

/-- Coefficient term 648 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0648 : Poly :=
[
  term ((123634377194162065175984705896580339781478522958385658387 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(1, 1), (10, 1), (14, 1), (15, 1)]
]

/-- Partial product 648 for generator 21. -/
def ep_Q2_024_partial_21_0648 : Poly :=
[
  term ((-123634377194162065175984705896580339781478522958385658387 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(1, 1), (10, 1), (14, 1), (15, 1)],
  term ((123634377194162065175984705896580339781478522958385658387 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(1, 1), (10, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 648 for generator 21. -/
theorem ep_Q2_024_partial_21_0648_valid :
    mulPoly ep_Q2_024_coefficient_21_0648
        ep_Q2_024_generator_21_0600_0699 =
      ep_Q2_024_partial_21_0648 := by
  native_decide

/-- Coefficient term 649 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0649 : Poly :=
[
  term ((-16636019461371833 : Rat) / 2325560442306386) [(1, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 649 for generator 21. -/
def ep_Q2_024_partial_21_0649 : Poly :=
[
  term ((16636019461371833 : Rat) / 2325560442306386) [(1, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-16636019461371833 : Rat) / 1162780221153193) [(1, 1), (10, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 649 for generator 21. -/
theorem ep_Q2_024_partial_21_0649_valid :
    mulPoly ep_Q2_024_coefficient_21_0649
        ep_Q2_024_generator_21_0600_0699 =
      ep_Q2_024_partial_21_0649 := by
  native_decide

/-- Coefficient term 650 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0650 : Poly :=
[
  term ((-64885598020952966377851495215056251811814535036016934143 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(1, 1), (10, 1), (15, 1)]
]

/-- Partial product 650 for generator 21. -/
def ep_Q2_024_partial_21_0650 : Poly :=
[
  term ((64885598020952966377851495215056251811814535036016934143 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(1, 1), (10, 1), (15, 1)],
  term ((-64885598020952966377851495215056251811814535036016934143 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(1, 1), (10, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 650 for generator 21. -/
theorem ep_Q2_024_partial_21_0650_valid :
    mulPoly ep_Q2_024_coefficient_21_0650
        ep_Q2_024_generator_21_0600_0699 =
      ep_Q2_024_partial_21_0650 := by
  native_decide

/-- Coefficient term 651 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0651 : Poly :=
[
  term ((-978162947449257 : Rat) / 1162780221153193) [(1, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 651 for generator 21. -/
def ep_Q2_024_partial_21_0651 : Poly :=
[
  term ((978162947449257 : Rat) / 1162780221153193) [(1, 1), (10, 1), (15, 1), (16, 1)],
  term ((-1956325894898514 : Rat) / 1162780221153193) [(1, 1), (10, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 651 for generator 21. -/
theorem ep_Q2_024_partial_21_0651_valid :
    mulPoly ep_Q2_024_coefficient_21_0651
        ep_Q2_024_generator_21_0600_0699 =
      ep_Q2_024_partial_21_0651 := by
  native_decide

/-- Coefficient term 652 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0652 : Poly :=
[
  term ((2233057704898447277337521117967487825271887127131734968 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (10, 1), (15, 3)]
]

/-- Partial product 652 for generator 21. -/
def ep_Q2_024_partial_21_0652 : Poly :=
[
  term ((-2233057704898447277337521117967487825271887127131734968 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (10, 1), (15, 3)],
  term ((4466115409796894554675042235934975650543774254263469936 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (10, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 652 for generator 21. -/
theorem ep_Q2_024_partial_21_0652_valid :
    mulPoly ep_Q2_024_coefficient_21_0652
        ep_Q2_024_generator_21_0600_0699 =
      ep_Q2_024_partial_21_0652 := by
  native_decide

/-- Coefficient term 653 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0653 : Poly :=
[
  term ((-449127554429600 : Rat) / 1162780221153193) [(1, 1), (10, 1), (15, 3), (16, 1)]
]

/-- Partial product 653 for generator 21. -/
def ep_Q2_024_partial_21_0653 : Poly :=
[
  term ((449127554429600 : Rat) / 1162780221153193) [(1, 1), (10, 1), (15, 3), (16, 1)],
  term ((-898255108859200 : Rat) / 1162780221153193) [(1, 1), (10, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 653 for generator 21. -/
theorem ep_Q2_024_partial_21_0653_valid :
    mulPoly ep_Q2_024_coefficient_21_0653
        ep_Q2_024_generator_21_0600_0699 =
      ep_Q2_024_partial_21_0653 := by
  native_decide

/-- Coefficient term 654 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0654 : Poly :=
[
  term ((1429182194689304419382031011936884624481 : Rat) / 3599128372207431889700080584088617803970) [(1, 1), (11, 1)]
]

/-- Partial product 654 for generator 21. -/
def ep_Q2_024_partial_21_0654 : Poly :=
[
  term ((1429182194689304419382031011936884624481 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (10, 1), (11, 1)],
  term ((-1429182194689304419382031011936884624481 : Rat) / 3599128372207431889700080584088617803970) [(1, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 654 for generator 21. -/
theorem ep_Q2_024_partial_21_0654_valid :
    mulPoly ep_Q2_024_coefficient_21_0654
        ep_Q2_024_generator_21_0600_0699 =
      ep_Q2_024_partial_21_0654 := by
  native_decide

/-- Coefficient term 655 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0655 : Poly :=
[
  term ((-1429182194689304419382031011936884624481 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (11, 1), (12, 1)]
]

/-- Partial product 655 for generator 21. -/
def ep_Q2_024_partial_21_0655 : Poly :=
[
  term ((-2858364389378608838764062023873769248962 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (10, 1), (11, 1), (12, 1)],
  term ((1429182194689304419382031011936884624481 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 655 for generator 21. -/
theorem ep_Q2_024_partial_21_0655_valid :
    mulPoly ep_Q2_024_coefficient_21_0655
        ep_Q2_024_generator_21_0600_0699 =
      ep_Q2_024_partial_21_0655 := by
  native_decide

/-- Coefficient term 656 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0656 : Poly :=
[
  term ((121146326533413229489263888085127877224 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (11, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 656 for generator 21. -/
def ep_Q2_024_partial_21_0656 : Poly :=
[
  term ((242292653066826458978527776170255754448 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (10, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-121146326533413229489263888085127877224 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (11, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 656 for generator 21. -/
theorem ep_Q2_024_partial_21_0656_valid :
    mulPoly ep_Q2_024_coefficient_21_0656
        ep_Q2_024_generator_21_0600_0699 =
      ep_Q2_024_partial_21_0656 := by
  native_decide

/-- Coefficient term 657 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0657 : Poly :=
[
  term ((228548346943902101627953017098607070723838550969230898109 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(1, 1), (11, 1), (12, 1), (15, 2)]
]

/-- Partial product 657 for generator 21. -/
def ep_Q2_024_partial_21_0657 : Poly :=
[
  term ((228548346943902101627953017098607070723838550969230898109 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(1, 1), (10, 1), (11, 1), (12, 1), (15, 2)],
  term ((-228548346943902101627953017098607070723838550969230898109 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(1, 1), (11, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 657 for generator 21. -/
theorem ep_Q2_024_partial_21_0657_valid :
    mulPoly ep_Q2_024_coefficient_21_0657
        ep_Q2_024_generator_21_0600_0699 =
      ep_Q2_024_partial_21_0657 := by
  native_decide

/-- Coefficient term 658 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0658 : Poly :=
[
  term ((-9851670194564511 : Rat) / 2325560442306386) [(1, 1), (11, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 658 for generator 21. -/
def ep_Q2_024_partial_21_0658 : Poly :=
[
  term ((-9851670194564511 : Rat) / 1162780221153193) [(1, 1), (10, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((9851670194564511 : Rat) / 2325560442306386) [(1, 1), (11, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 658 for generator 21. -/
theorem ep_Q2_024_partial_21_0658_valid :
    mulPoly ep_Q2_024_coefficient_21_0658
        ep_Q2_024_generator_21_0600_0699 =
      ep_Q2_024_partial_21_0658 := by
  native_decide

/-- Coefficient term 659 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0659 : Poly :=
[
  term ((963896129163407086351667425944418077694 : Rat) / 359912837220743188970008058408861780397) [(1, 1), (12, 1), (13, 1)]
]

/-- Partial product 659 for generator 21. -/
def ep_Q2_024_partial_21_0659 : Poly :=
[
  term ((1927792258326814172703334851888836155388 : Rat) / 359912837220743188970008058408861780397) [(1, 1), (10, 1), (12, 1), (13, 1)],
  term ((-963896129163407086351667425944418077694 : Rat) / 359912837220743188970008058408861780397) [(1, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 659 for generator 21. -/
theorem ep_Q2_024_partial_21_0659_valid :
    mulPoly ep_Q2_024_coefficient_21_0659
        ep_Q2_024_generator_21_0600_0699 =
      ep_Q2_024_partial_21_0659 := by
  native_decide

/-- Coefficient term 660 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0660 : Poly :=
[
  term ((-7076045626415592334154908924159185909332 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 660 for generator 21. -/
def ep_Q2_024_partial_21_0660 : Poly :=
[
  term ((-14152091252831184668309817848318371818664 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((7076045626415592334154908924159185909332 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 660 for generator 21. -/
theorem ep_Q2_024_partial_21_0660_valid :
    mulPoly ep_Q2_024_coefficient_21_0660
        ep_Q2_024_generator_21_0600_0699 =
      ep_Q2_024_partial_21_0660 := by
  native_decide

/-- Coefficient term 661 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0661 : Poly :=
[
  term ((2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (12, 1), (13, 1), (14, 2)]
]

/-- Partial product 661 for generator 21. -/
def ep_Q2_024_partial_21_0661 : Poly :=
[
  term ((4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (10, 1), (12, 1), (13, 1), (14, 2)],
  term ((-2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (12, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 661 for generator 21. -/
theorem ep_Q2_024_partial_21_0661_valid :
    mulPoly ep_Q2_024_coefficient_21_0661
        ep_Q2_024_generator_21_0600_0699 =
      ep_Q2_024_partial_21_0661 := by
  native_decide

/-- Coefficient term 662 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0662 : Poly :=
[
  term ((297031741864478853810108763188514323404882766587533673749 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(1, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 662 for generator 21. -/
def ep_Q2_024_partial_21_0662 : Poly :=
[
  term ((297031741864478853810108763188514323404882766587533673749 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(1, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-297031741864478853810108763188514323404882766587533673749 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(1, 1), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 662 for generator 21. -/
theorem ep_Q2_024_partial_21_0662_valid :
    mulPoly ep_Q2_024_coefficient_21_0662
        ep_Q2_024_generator_21_0600_0699 =
      ep_Q2_024_partial_21_0662 := by
  native_decide

/-- Coefficient term 663 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0663 : Poly :=
[
  term ((-149944030454025133 : Rat) / 13953362653838316) [(1, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 663 for generator 21. -/
def ep_Q2_024_partial_21_0663 : Poly :=
[
  term ((-149944030454025133 : Rat) / 6976681326919158) [(1, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((149944030454025133 : Rat) / 13953362653838316) [(1, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 663 for generator 21. -/
theorem ep_Q2_024_partial_21_0663_valid :
    mulPoly ep_Q2_024_coefficient_21_0663
        ep_Q2_024_generator_21_0600_0699 =
      ep_Q2_024_partial_21_0663 := by
  native_decide

/-- Coefficient term 664 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0664 : Poly :=
[
  term ((168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (12, 1), (14, 2), (15, 1)]
]

/-- Partial product 664 for generator 21. -/
def ep_Q2_024_partial_21_0664 : Poly :=
[
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (10, 1), (12, 1), (14, 2), (15, 1)],
  term ((-168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (12, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 664 for generator 21. -/
theorem ep_Q2_024_partial_21_0664_valid :
    mulPoly ep_Q2_024_coefficient_21_0664
        ep_Q2_024_generator_21_0600_0699 =
      ep_Q2_024_partial_21_0664 := by
  native_decide

/-- Coefficient term 665 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0665 : Poly :=
[
  term ((416983870520476 : Rat) / 1162780221153193) [(1, 1), (12, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 665 for generator 21. -/
def ep_Q2_024_partial_21_0665 : Poly :=
[
  term ((833967741040952 : Rat) / 1162780221153193) [(1, 1), (10, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-416983870520476 : Rat) / 1162780221153193) [(1, 1), (12, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 665 for generator 21. -/
theorem ep_Q2_024_partial_21_0665_valid :
    mulPoly ep_Q2_024_coefficient_21_0665
        ep_Q2_024_generator_21_0600_0699 =
      ep_Q2_024_partial_21_0665 := by
  native_decide

/-- Coefficient term 666 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0666 : Poly :=
[
  term ((-18721653861933400438488283849904078814765674105956982777 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(1, 1), (12, 1), (15, 1)]
]

/-- Partial product 666 for generator 21. -/
def ep_Q2_024_partial_21_0666 : Poly :=
[
  term ((-18721653861933400438488283849904078814765674105956982777 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (10, 1), (12, 1), (15, 1)],
  term ((18721653861933400438488283849904078814765674105956982777 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(1, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 666 for generator 21. -/
theorem ep_Q2_024_partial_21_0666_valid :
    mulPoly ep_Q2_024_coefficient_21_0666
        ep_Q2_024_generator_21_0600_0699 =
      ep_Q2_024_partial_21_0666 := by
  native_decide

/-- Coefficient term 667 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0667 : Poly :=
[
  term ((41125569115936534 : Rat) / 3488340663459579) [(1, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 667 for generator 21. -/
def ep_Q2_024_partial_21_0667 : Poly :=
[
  term ((82251138231873068 : Rat) / 3488340663459579) [(1, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-41125569115936534 : Rat) / 3488340663459579) [(1, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 667 for generator 21. -/
theorem ep_Q2_024_partial_21_0667_valid :
    mulPoly ep_Q2_024_coefficient_21_0667
        ep_Q2_024_generator_21_0600_0699 =
      ep_Q2_024_partial_21_0667 := by
  native_decide

/-- Coefficient term 668 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0668 : Poly :=
[
  term ((-3619385523905905893276329125078042987622 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (12, 2), (13, 1)]
]

/-- Partial product 668 for generator 21. -/
def ep_Q2_024_partial_21_0668 : Poly :=
[
  term ((-7238771047811811786552658250156085975244 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (10, 1), (12, 2), (13, 1)],
  term ((3619385523905905893276329125078042987622 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (12, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 668 for generator 21. -/
theorem ep_Q2_024_partial_21_0668_valid :
    mulPoly ep_Q2_024_coefficient_21_0668
        ep_Q2_024_generator_21_0600_0699 =
      ep_Q2_024_partial_21_0668 := by
  native_decide

/-- Coefficient term 669 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0669 : Poly :=
[
  term ((-259451438241996968824998501993404916522 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (12, 2), (13, 1), (14, 1)]
]

/-- Partial product 669 for generator 21. -/
def ep_Q2_024_partial_21_0669 : Poly :=
[
  term ((-518902876483993937649997003986809833044 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (10, 1), (12, 2), (13, 1), (14, 1)],
  term ((259451438241996968824998501993404916522 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (12, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 669 for generator 21. -/
theorem ep_Q2_024_partial_21_0669_valid :
    mulPoly ep_Q2_024_coefficient_21_0669
        ep_Q2_024_generator_21_0600_0699 =
      ep_Q2_024_partial_21_0669 := by
  native_decide

/-- Coefficient term 670 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0670 : Poly :=
[
  term ((164450924956588150524026507372646906853948765195645650517 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(1, 1), (12, 2), (14, 1), (15, 1)]
]

/-- Partial product 670 for generator 21. -/
def ep_Q2_024_partial_21_0670 : Poly :=
[
  term ((164450924956588150524026507372646906853948765195645650517 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(1, 1), (10, 1), (12, 2), (14, 1), (15, 1)],
  term ((-164450924956588150524026507372646906853948765195645650517 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(1, 1), (12, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 670 for generator 21. -/
theorem ep_Q2_024_partial_21_0670_valid :
    mulPoly ep_Q2_024_coefficient_21_0670
        ep_Q2_024_generator_21_0600_0699 =
      ep_Q2_024_partial_21_0670 := by
  native_decide

/-- Coefficient term 671 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0671 : Poly :=
[
  term ((-14038382648281759 : Rat) / 2325560442306386) [(1, 1), (12, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 671 for generator 21. -/
def ep_Q2_024_partial_21_0671 : Poly :=
[
  term ((-14038382648281759 : Rat) / 1162780221153193) [(1, 1), (10, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((14038382648281759 : Rat) / 2325560442306386) [(1, 1), (12, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 671 for generator 21. -/
theorem ep_Q2_024_partial_21_0671_valid :
    mulPoly ep_Q2_024_coefficient_21_0671
        ep_Q2_024_generator_21_0600_0699 =
      ep_Q2_024_partial_21_0671 := by
  native_decide

/-- Coefficient term 672 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0672 : Poly :=
[
  term ((-47255370516857834375103635894219571321602495223550913657 : Rat) / 3719995808528079274019093723345063589869385692989845520) [(1, 1), (12, 2), (15, 1)]
]

/-- Partial product 672 for generator 21. -/
def ep_Q2_024_partial_21_0672 : Poly :=
[
  term ((-47255370516857834375103635894219571321602495223550913657 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(1, 1), (10, 1), (12, 2), (15, 1)],
  term ((47255370516857834375103635894219571321602495223550913657 : Rat) / 3719995808528079274019093723345063589869385692989845520) [(1, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 672 for generator 21. -/
theorem ep_Q2_024_partial_21_0672_valid :
    mulPoly ep_Q2_024_coefficient_21_0672
        ep_Q2_024_generator_21_0600_0699 =
      ep_Q2_024_partial_21_0672 := by
  native_decide

/-- Coefficient term 673 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0673 : Poly :=
[
  term ((-110256744975063325 : Rat) / 13953362653838316) [(1, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 673 for generator 21. -/
def ep_Q2_024_partial_21_0673 : Poly :=
[
  term ((-110256744975063325 : Rat) / 6976681326919158) [(1, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((110256744975063325 : Rat) / 13953362653838316) [(1, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 673 for generator 21. -/
theorem ep_Q2_024_partial_21_0673_valid :
    mulPoly ep_Q2_024_coefficient_21_0673
        ep_Q2_024_generator_21_0600_0699 =
      ep_Q2_024_partial_21_0673 := by
  native_decide

/-- Coefficient term 674 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0674 : Poly :=
[
  term ((124898830274193142709262456668953249078 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (12, 3), (13, 1)]
]

/-- Partial product 674 for generator 21. -/
def ep_Q2_024_partial_21_0674 : Poly :=
[
  term ((249797660548386285418524913337906498156 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (10, 1), (12, 3), (13, 1)],
  term ((-124898830274193142709262456668953249078 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (12, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 674 for generator 21. -/
theorem ep_Q2_024_partial_21_0674_valid :
    mulPoly ep_Q2_024_coefficient_21_0674
        ep_Q2_024_generator_21_0600_0699 =
      ep_Q2_024_partial_21_0674 := by
  native_decide

/-- Coefficient term 675 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0675 : Poly :=
[
  term ((-26974210883668912519839817367166225675565343026070909313 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(1, 1), (12, 3), (15, 1)]
]

/-- Partial product 675 for generator 21. -/
def ep_Q2_024_partial_21_0675 : Poly :=
[
  term ((-26974210883668912519839817367166225675565343026070909313 : Rat) / 929998952132019818504773430836265897467346423247461380) [(1, 1), (10, 1), (12, 3), (15, 1)],
  term ((26974210883668912519839817367166225675565343026070909313 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(1, 1), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 675 for generator 21. -/
theorem ep_Q2_024_partial_21_0675_valid :
    mulPoly ep_Q2_024_coefficient_21_0675
        ep_Q2_024_generator_21_0600_0699 =
      ep_Q2_024_partial_21_0675 := by
  native_decide

/-- Coefficient term 676 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0676 : Poly :=
[
  term ((5003541596661801 : Rat) / 2325560442306386) [(1, 1), (12, 3), (15, 1), (16, 1)]
]

/-- Partial product 676 for generator 21. -/
def ep_Q2_024_partial_21_0676 : Poly :=
[
  term ((5003541596661801 : Rat) / 1162780221153193) [(1, 1), (10, 1), (12, 3), (15, 1), (16, 1)],
  term ((-5003541596661801 : Rat) / 2325560442306386) [(1, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 676 for generator 21. -/
theorem ep_Q2_024_partial_21_0676_valid :
    mulPoly ep_Q2_024_coefficient_21_0676
        ep_Q2_024_generator_21_0600_0699 =
      ep_Q2_024_partial_21_0676 := by
  native_decide

/-- Coefficient term 677 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0677 : Poly :=
[
  term ((187080535891139769509657562631683995023 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (13, 1)]
]

/-- Partial product 677 for generator 21. -/
def ep_Q2_024_partial_21_0677 : Poly :=
[
  term ((374161071782279539019315125263367990046 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (10, 1), (13, 1)],
  term ((-187080535891139769509657562631683995023 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 677 for generator 21. -/
theorem ep_Q2_024_partial_21_0677_valid :
    mulPoly ep_Q2_024_coefficient_21_0677
        ep_Q2_024_generator_21_0600_0699 =
      ep_Q2_024_partial_21_0677 := by
  native_decide

/-- Coefficient term 678 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0678 : Poly :=
[
  term ((-1347272485062128121773551261620245480618 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (13, 1), (14, 1)]
]

/-- Partial product 678 for generator 21. -/
def ep_Q2_024_partial_21_0678 : Poly :=
[
  term ((-2694544970124256243547102523240490961236 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (10, 1), (13, 1), (14, 1)],
  term ((1347272485062128121773551261620245480618 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 678 for generator 21. -/
theorem ep_Q2_024_partial_21_0678_valid :
    mulPoly ep_Q2_024_coefficient_21_0678
        ep_Q2_024_generator_21_0600_0699 =
      ep_Q2_024_partial_21_0678 := by
  native_decide

/-- Coefficient term 679 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0679 : Poly :=
[
  term ((891441199110216629189993762644708434842923449675048837 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (13, 1), (15, 2)]
]

/-- Partial product 679 for generator 21. -/
def ep_Q2_024_partial_21_0679 : Poly :=
[
  term ((1782882398220433258379987525289416869685846899350097674 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (10, 1), (13, 1), (15, 2)],
  term ((-891441199110216629189993762644708434842923449675048837 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 679 for generator 21. -/
theorem ep_Q2_024_partial_21_0679_valid :
    mulPoly ep_Q2_024_coefficient_21_0679
        ep_Q2_024_generator_21_0600_0699 =
      ep_Q2_024_partial_21_0679 := by
  native_decide

/-- Coefficient term 680 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0680 : Poly :=
[
  term ((-307991489520804 : Rat) / 1162780221153193) [(1, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 680 for generator 21. -/
def ep_Q2_024_partial_21_0680 : Poly :=
[
  term ((-615982979041608 : Rat) / 1162780221153193) [(1, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((307991489520804 : Rat) / 1162780221153193) [(1, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 680 for generator 21. -/
theorem ep_Q2_024_partial_21_0680_valid :
    mulPoly ep_Q2_024_coefficient_21_0680
        ep_Q2_024_generator_21_0600_0699 =
      ep_Q2_024_partial_21_0680 := by
  native_decide

/-- Coefficient term 681 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0681 : Poly :=
[
  term ((-579235233763158076763195214684316018641625656523023701 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (13, 2), (15, 1)]
]

/-- Partial product 681 for generator 21. -/
def ep_Q2_024_partial_21_0681 : Poly :=
[
  term ((-1158470467526316153526390429368632037283251313046047402 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (10, 1), (13, 2), (15, 1)],
  term ((579235233763158076763195214684316018641625656523023701 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 681 for generator 21. -/
theorem ep_Q2_024_partial_21_0681_valid :
    mulPoly ep_Q2_024_coefficient_21_0681
        ep_Q2_024_generator_21_0600_0699 =
      ep_Q2_024_partial_21_0681 := by
  native_decide

/-- Coefficient term 682 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0682 : Poly :=
[
  term ((37665296397180 : Rat) / 1162780221153193) [(1, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 682 for generator 21. -/
def ep_Q2_024_partial_21_0682 : Poly :=
[
  term ((75330592794360 : Rat) / 1162780221153193) [(1, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-37665296397180 : Rat) / 1162780221153193) [(1, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 682 for generator 21. -/
theorem ep_Q2_024_partial_21_0682_valid :
    mulPoly ep_Q2_024_coefficient_21_0682
        ep_Q2_024_generator_21_0600_0699 =
      ep_Q2_024_partial_21_0682 := by
  native_decide

/-- Coefficient term 683 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0683 : Poly :=
[
  term ((20236464028016908558024560015619523336 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (13, 3)]
]

/-- Partial product 683 for generator 21. -/
def ep_Q2_024_partial_21_0683 : Poly :=
[
  term ((40472928056033817116049120031239046672 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (10, 1), (13, 3)],
  term ((-20236464028016908558024560015619523336 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 683 for generator 21. -/
theorem ep_Q2_024_partial_21_0683_valid :
    mulPoly ep_Q2_024_coefficient_21_0683
        ep_Q2_024_generator_21_0600_0699 =
      ep_Q2_024_partial_21_0683 := by
  native_decide

/-- Coefficient term 684 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0684 : Poly :=
[
  term ((123634377194162065175984705896580339781478522958385658387 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(1, 1), (14, 1), (15, 1)]
]

/-- Partial product 684 for generator 21. -/
def ep_Q2_024_partial_21_0684 : Poly :=
[
  term ((123634377194162065175984705896580339781478522958385658387 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(1, 1), (10, 1), (14, 1), (15, 1)],
  term ((-123634377194162065175984705896580339781478522958385658387 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(1, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 684 for generator 21. -/
theorem ep_Q2_024_partial_21_0684_valid :
    mulPoly ep_Q2_024_coefficient_21_0684
        ep_Q2_024_generator_21_0600_0699 =
      ep_Q2_024_partial_21_0684 := by
  native_decide

/-- Coefficient term 685 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0685 : Poly :=
[
  term ((-16636019461371833 : Rat) / 4651120884612772) [(1, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 685 for generator 21. -/
def ep_Q2_024_partial_21_0685 : Poly :=
[
  term ((-16636019461371833 : Rat) / 2325560442306386) [(1, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((16636019461371833 : Rat) / 4651120884612772) [(1, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 685 for generator 21. -/
theorem ep_Q2_024_partial_21_0685_valid :
    mulPoly ep_Q2_024_coefficient_21_0685
        ep_Q2_024_generator_21_0600_0699 =
      ep_Q2_024_partial_21_0685 := by
  native_decide

/-- Coefficient term 686 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0686 : Poly :=
[
  term ((-64885598020952966377851495215056251811814535036016934143 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(1, 1), (15, 1)]
]

/-- Partial product 686 for generator 21. -/
def ep_Q2_024_partial_21_0686 : Poly :=
[
  term ((-64885598020952966377851495215056251811814535036016934143 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(1, 1), (10, 1), (15, 1)],
  term ((64885598020952966377851495215056251811814535036016934143 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(1, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 686 for generator 21. -/
theorem ep_Q2_024_partial_21_0686_valid :
    mulPoly ep_Q2_024_coefficient_21_0686
        ep_Q2_024_generator_21_0600_0699 =
      ep_Q2_024_partial_21_0686 := by
  native_decide

/-- Coefficient term 687 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0687 : Poly :=
[
  term ((-978162947449257 : Rat) / 2325560442306386) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 687 for generator 21. -/
def ep_Q2_024_partial_21_0687 : Poly :=
[
  term ((-978162947449257 : Rat) / 1162780221153193) [(1, 1), (10, 1), (15, 1), (16, 1)],
  term ((978162947449257 : Rat) / 2325560442306386) [(1, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 687 for generator 21. -/
theorem ep_Q2_024_partial_21_0687_valid :
    mulPoly ep_Q2_024_coefficient_21_0687
        ep_Q2_024_generator_21_0600_0699 =
      ep_Q2_024_partial_21_0687 := by
  native_decide

/-- Coefficient term 688 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0688 : Poly :=
[
  term ((1116528852449223638668760558983743912635943563565867484 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (15, 3)]
]

/-- Partial product 688 for generator 21. -/
def ep_Q2_024_partial_21_0688 : Poly :=
[
  term ((2233057704898447277337521117967487825271887127131734968 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (10, 1), (15, 3)],
  term ((-1116528852449223638668760558983743912635943563565867484 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 688 for generator 21. -/
theorem ep_Q2_024_partial_21_0688_valid :
    mulPoly ep_Q2_024_coefficient_21_0688
        ep_Q2_024_generator_21_0600_0699 =
      ep_Q2_024_partial_21_0688 := by
  native_decide

/-- Coefficient term 689 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0689 : Poly :=
[
  term ((-224563777214800 : Rat) / 1162780221153193) [(1, 1), (15, 3), (16, 1)]
]

/-- Partial product 689 for generator 21. -/
def ep_Q2_024_partial_21_0689 : Poly :=
[
  term ((-449127554429600 : Rat) / 1162780221153193) [(1, 1), (10, 1), (15, 3), (16, 1)],
  term ((224563777214800 : Rat) / 1162780221153193) [(1, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 689 for generator 21. -/
theorem ep_Q2_024_partial_21_0689_valid :
    mulPoly ep_Q2_024_coefficient_21_0689
        ep_Q2_024_generator_21_0600_0699 =
      ep_Q2_024_partial_21_0689 := by
  native_decide

/-- Coefficient term 690 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0690 : Poly :=
[
  term ((2140544576806429585465573269128715080 : Rat) / 119970945740247729656669352802953926799) [(1, 2), (2, 1), (8, 1)]
]

/-- Partial product 690 for generator 21. -/
def ep_Q2_024_partial_21_0690 : Poly :=
[
  term ((-2140544576806429585465573269128715080 : Rat) / 119970945740247729656669352802953926799) [(1, 2), (2, 1), (8, 1)],
  term ((4281089153612859170931146538257430160 : Rat) / 119970945740247729656669352802953926799) [(1, 2), (2, 1), (8, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 690 for generator 21. -/
theorem ep_Q2_024_partial_21_0690_valid :
    mulPoly ep_Q2_024_coefficient_21_0690
        ep_Q2_024_generator_21_0600_0699 =
      ep_Q2_024_partial_21_0690 := by
  native_decide

/-- Coefficient term 691 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0691 : Poly :=
[
  term ((-1465074617356825556565339743900656045508 : Rat) / 1799564186103715944850040292044308901985) [(1, 2), (4, 1), (8, 1)]
]

/-- Partial product 691 for generator 21. -/
def ep_Q2_024_partial_21_0691 : Poly :=
[
  term ((1465074617356825556565339743900656045508 : Rat) / 1799564186103715944850040292044308901985) [(1, 2), (4, 1), (8, 1)],
  term ((-2930149234713651113130679487801312091016 : Rat) / 1799564186103715944850040292044308901985) [(1, 2), (4, 1), (8, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 691 for generator 21. -/
theorem ep_Q2_024_partial_21_0691_valid :
    mulPoly ep_Q2_024_coefficient_21_0691
        ep_Q2_024_generator_21_0600_0699 =
      ep_Q2_024_partial_21_0691 := by
  native_decide

/-- Coefficient term 692 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0692 : Poly :=
[
  term ((-113154626530813919845787359700054553376 : Rat) / 599854728701238648283346764014769633995) [(1, 2), (5, 1), (8, 1), (9, 1)]
]

/-- Partial product 692 for generator 21. -/
def ep_Q2_024_partial_21_0692 : Poly :=
[
  term ((113154626530813919845787359700054553376 : Rat) / 599854728701238648283346764014769633995) [(1, 2), (5, 1), (8, 1), (9, 1)],
  term ((-226309253061627839691574719400109106752 : Rat) / 599854728701238648283346764014769633995) [(1, 2), (5, 1), (8, 1), (9, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 692 for generator 21. -/
theorem ep_Q2_024_partial_21_0692_valid :
    mulPoly ep_Q2_024_coefficient_21_0692
        ep_Q2_024_generator_21_0600_0699 =
      ep_Q2_024_partial_21_0692 := by
  native_decide

/-- Coefficient term 693 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0693 : Poly :=
[
  term ((-127486305738244094577774877096070878592 : Rat) / 599854728701238648283346764014769633995) [(1, 2), (5, 1), (8, 1), (13, 1)]
]

/-- Partial product 693 for generator 21. -/
def ep_Q2_024_partial_21_0693 : Poly :=
[
  term ((-254972611476488189155549754192141757184 : Rat) / 599854728701238648283346764014769633995) [(1, 2), (5, 1), (8, 1), (10, 1), (13, 1)],
  term ((127486305738244094577774877096070878592 : Rat) / 599854728701238648283346764014769633995) [(1, 2), (5, 1), (8, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 693 for generator 21. -/
theorem ep_Q2_024_partial_21_0693_valid :
    mulPoly ep_Q2_024_coefficient_21_0693
        ep_Q2_024_generator_21_0600_0699 =
      ep_Q2_024_partial_21_0693 := by
  native_decide

/-- Coefficient term 694 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0694 : Poly :=
[
  term ((-121769664108826368855745847975501807230353906738527584 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 2), (5, 1), (8, 1), (15, 1)]
]

/-- Partial product 694 for generator 21. -/
def ep_Q2_024_partial_21_0694 : Poly :=
[
  term ((-243539328217652737711491695951003614460707813477055168 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 2), (5, 1), (8, 1), (10, 1), (15, 1)],
  term ((121769664108826368855745847975501807230353906738527584 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 2), (5, 1), (8, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 694 for generator 21. -/
theorem ep_Q2_024_partial_21_0694_valid :
    mulPoly ep_Q2_024_coefficient_21_0694
        ep_Q2_024_generator_21_0600_0699 =
      ep_Q2_024_partial_21_0694 := by
  native_decide

/-- Coefficient term 695 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0695 : Poly :=
[
  term ((3108648400624064 : Rat) / 3488340663459579) [(1, 2), (5, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 695 for generator 21. -/
def ep_Q2_024_partial_21_0695 : Poly :=
[
  term ((6217296801248128 : Rat) / 3488340663459579) [(1, 2), (5, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-3108648400624064 : Rat) / 3488340663459579) [(1, 2), (5, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 695 for generator 21. -/
theorem ep_Q2_024_partial_21_0695_valid :
    mulPoly ep_Q2_024_coefficient_21_0695
        ep_Q2_024_generator_21_0600_0699 =
      ep_Q2_024_partial_21_0695 := by
  native_decide

/-- Coefficient term 696 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0696 : Poly :=
[
  term ((18578835009886931389828064953150187574 : Rat) / 199951576233746216094448921338256544665) [(1, 2), (5, 1), (9, 1)]
]

/-- Partial product 696 for generator 21. -/
def ep_Q2_024_partial_21_0696 : Poly :=
[
  term ((-18578835009886931389828064953150187574 : Rat) / 199951576233746216094448921338256544665) [(1, 2), (5, 1), (9, 1)],
  term ((37157670019773862779656129906300375148 : Rat) / 199951576233746216094448921338256544665) [(1, 2), (5, 1), (9, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 696 for generator 21. -/
theorem ep_Q2_024_partial_21_0696_valid :
    mulPoly ep_Q2_024_coefficient_21_0696
        ep_Q2_024_generator_21_0600_0699 =
      ep_Q2_024_partial_21_0696 := by
  native_decide

/-- Coefficient term 697 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0697 : Poly :=
[
  term ((37157670019773862779656129906300375148 : Rat) / 199951576233746216094448921338256544665) [(1, 2), (5, 1), (9, 1), (10, 1)]
]

/-- Partial product 697 for generator 21. -/
def ep_Q2_024_partial_21_0697 : Poly :=
[
  term ((-37157670019773862779656129906300375148 : Rat) / 199951576233746216094448921338256544665) [(1, 2), (5, 1), (9, 1), (10, 1)],
  term ((74315340039547725559312259812600750296 : Rat) / 199951576233746216094448921338256544665) [(1, 2), (5, 1), (9, 1), (10, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 697 for generator 21. -/
theorem ep_Q2_024_partial_21_0697_valid :
    mulPoly ep_Q2_024_coefficient_21_0697
        ep_Q2_024_generator_21_0600_0699 =
      ep_Q2_024_partial_21_0697 := by
  native_decide

/-- Coefficient term 698 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0698 : Poly :=
[
  term ((9407326506538999398797487783872895160 : Rat) / 39990315246749243218889784267651308933) [(1, 2), (5, 1), (10, 1), (13, 1)]
]

/-- Partial product 698 for generator 21. -/
def ep_Q2_024_partial_21_0698 : Poly :=
[
  term ((-9407326506538999398797487783872895160 : Rat) / 39990315246749243218889784267651308933) [(1, 2), (5, 1), (10, 1), (13, 1)],
  term ((18814653013077998797594975567745790320 : Rat) / 39990315246749243218889784267651308933) [(1, 2), (5, 1), (10, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 698 for generator 21. -/
theorem ep_Q2_024_partial_21_0698_valid :
    mulPoly ep_Q2_024_coefficient_21_0698
        ep_Q2_024_generator_21_0600_0699 =
      ep_Q2_024_partial_21_0698 := by
  native_decide

/-- Coefficient term 699 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0699 : Poly :=
[
  term ((-2354726156844551479976179518884154954213556855016731652 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 2), (5, 1), (10, 1), (15, 1)]
]

/-- Partial product 699 for generator 21. -/
def ep_Q2_024_partial_21_0699 : Poly :=
[
  term ((2354726156844551479976179518884154954213556855016731652 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 2), (5, 1), (10, 1), (15, 1)],
  term ((-4709452313689102959952359037768309908427113710033463304 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 2), (5, 1), (10, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 699 for generator 21. -/
theorem ep_Q2_024_partial_21_0699_valid :
    mulPoly ep_Q2_024_coefficient_21_0699
        ep_Q2_024_generator_21_0600_0699 =
      ep_Q2_024_partial_21_0699 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_024_partials_21_0600_0699 : List Poly :=
[
  ep_Q2_024_partial_21_0600,
  ep_Q2_024_partial_21_0601,
  ep_Q2_024_partial_21_0602,
  ep_Q2_024_partial_21_0603,
  ep_Q2_024_partial_21_0604,
  ep_Q2_024_partial_21_0605,
  ep_Q2_024_partial_21_0606,
  ep_Q2_024_partial_21_0607,
  ep_Q2_024_partial_21_0608,
  ep_Q2_024_partial_21_0609,
  ep_Q2_024_partial_21_0610,
  ep_Q2_024_partial_21_0611,
  ep_Q2_024_partial_21_0612,
  ep_Q2_024_partial_21_0613,
  ep_Q2_024_partial_21_0614,
  ep_Q2_024_partial_21_0615,
  ep_Q2_024_partial_21_0616,
  ep_Q2_024_partial_21_0617,
  ep_Q2_024_partial_21_0618,
  ep_Q2_024_partial_21_0619,
  ep_Q2_024_partial_21_0620,
  ep_Q2_024_partial_21_0621,
  ep_Q2_024_partial_21_0622,
  ep_Q2_024_partial_21_0623,
  ep_Q2_024_partial_21_0624,
  ep_Q2_024_partial_21_0625,
  ep_Q2_024_partial_21_0626,
  ep_Q2_024_partial_21_0627,
  ep_Q2_024_partial_21_0628,
  ep_Q2_024_partial_21_0629,
  ep_Q2_024_partial_21_0630,
  ep_Q2_024_partial_21_0631,
  ep_Q2_024_partial_21_0632,
  ep_Q2_024_partial_21_0633,
  ep_Q2_024_partial_21_0634,
  ep_Q2_024_partial_21_0635,
  ep_Q2_024_partial_21_0636,
  ep_Q2_024_partial_21_0637,
  ep_Q2_024_partial_21_0638,
  ep_Q2_024_partial_21_0639,
  ep_Q2_024_partial_21_0640,
  ep_Q2_024_partial_21_0641,
  ep_Q2_024_partial_21_0642,
  ep_Q2_024_partial_21_0643,
  ep_Q2_024_partial_21_0644,
  ep_Q2_024_partial_21_0645,
  ep_Q2_024_partial_21_0646,
  ep_Q2_024_partial_21_0647,
  ep_Q2_024_partial_21_0648,
  ep_Q2_024_partial_21_0649,
  ep_Q2_024_partial_21_0650,
  ep_Q2_024_partial_21_0651,
  ep_Q2_024_partial_21_0652,
  ep_Q2_024_partial_21_0653,
  ep_Q2_024_partial_21_0654,
  ep_Q2_024_partial_21_0655,
  ep_Q2_024_partial_21_0656,
  ep_Q2_024_partial_21_0657,
  ep_Q2_024_partial_21_0658,
  ep_Q2_024_partial_21_0659,
  ep_Q2_024_partial_21_0660,
  ep_Q2_024_partial_21_0661,
  ep_Q2_024_partial_21_0662,
  ep_Q2_024_partial_21_0663,
  ep_Q2_024_partial_21_0664,
  ep_Q2_024_partial_21_0665,
  ep_Q2_024_partial_21_0666,
  ep_Q2_024_partial_21_0667,
  ep_Q2_024_partial_21_0668,
  ep_Q2_024_partial_21_0669,
  ep_Q2_024_partial_21_0670,
  ep_Q2_024_partial_21_0671,
  ep_Q2_024_partial_21_0672,
  ep_Q2_024_partial_21_0673,
  ep_Q2_024_partial_21_0674,
  ep_Q2_024_partial_21_0675,
  ep_Q2_024_partial_21_0676,
  ep_Q2_024_partial_21_0677,
  ep_Q2_024_partial_21_0678,
  ep_Q2_024_partial_21_0679,
  ep_Q2_024_partial_21_0680,
  ep_Q2_024_partial_21_0681,
  ep_Q2_024_partial_21_0682,
  ep_Q2_024_partial_21_0683,
  ep_Q2_024_partial_21_0684,
  ep_Q2_024_partial_21_0685,
  ep_Q2_024_partial_21_0686,
  ep_Q2_024_partial_21_0687,
  ep_Q2_024_partial_21_0688,
  ep_Q2_024_partial_21_0689,
  ep_Q2_024_partial_21_0690,
  ep_Q2_024_partial_21_0691,
  ep_Q2_024_partial_21_0692,
  ep_Q2_024_partial_21_0693,
  ep_Q2_024_partial_21_0694,
  ep_Q2_024_partial_21_0695,
  ep_Q2_024_partial_21_0696,
  ep_Q2_024_partial_21_0697,
  ep_Q2_024_partial_21_0698,
  ep_Q2_024_partial_21_0699
]

/-- Sum of partial products in this block. -/
def ep_Q2_024_block_21_0600_0699 : Poly :=
[
  term ((2172308402631610 : Rat) / 1162780221153193) [(1, 1), (8, 2), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((16551418880201825784423350077975451476096 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (8, 2), (10, 1), (13, 1)],
  term ((16212592569921209273810854764745299901641591424351835598 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (8, 2), (10, 1), (15, 1)],
  term ((-17366606943104944 : Rat) / 3488340663459579) [(1, 1), (8, 2), (10, 1), (15, 1), (16, 1)],
  term ((-1086154201315805 : Rat) / 1162780221153193) [(1, 1), (8, 2), (12, 1), (15, 1), (16, 1)],
  term ((-8275709440100912892211675038987725738048 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (8, 2), (13, 1)],
  term ((-8106296284960604636905427382372649950820795712175917799 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (8, 2), (15, 1)],
  term ((8683303471552472 : Rat) / 3488340663459579) [(1, 1), (8, 2), (15, 1), (16, 1)],
  term ((-237333185862901430680855269554656779911 : Rat) / 1199709457402477296566693528029539267990) [(1, 1), (9, 1)],
  term ((-168275490781721316360423721329958090392 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (9, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((519551513659608726525666947194254211582 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (9, 1), (10, 1), (12, 1)],
  term ((-482650611438740466194406210179930591592 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (9, 1), (10, 1), (12, 1), (14, 1)],
  term ((3577384833240670418179513349723495742128 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (9, 1), (10, 1), (12, 2)],
  term ((474666371725802861361710539109313559822 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (9, 1), (10, 2)],
  term ((10753700537853466156815712325400368524 : Rat) / 2033405860004198807740158522083964861) [(1, 1), (9, 1), (10, 2), (12, 1)],
  term ((4095636160402548932617373234687187870070577694200502482 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (9, 1), (10, 2), (13, 1), (15, 1)],
  term ((1193826078367496 : Rat) / 1162780221153193) [(1, 1), (9, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((307757096738060069093025370126087348736 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (9, 1), (10, 2), (13, 2)],
  term ((-2474225551681735722629127837096511341504 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (9, 1), (10, 2), (14, 1)],
  term ((-52209993745386587556466945432264188113755967333291914913 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (9, 1), (10, 2), (15, 2)],
  term ((8190047680663020 : Rat) / 1162780221153193) [(1, 1), (9, 1), (10, 2), (15, 2), (16, 1)],
  term ((84137745390860658180211860664979045196 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((-1572412685156106218853659204789658496018 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (9, 1), (12, 1)],
  term ((241325305719370233097203105089965295796 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (9, 1), (12, 1), (14, 1)],
  term ((-1788692416620335209089756674861747871064 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (9, 1), (12, 2)],
  term ((-2047818080201274466308686617343593935035288847100251241 : Rat) / 278999685639605945551432029250879769240203926974238414) [(1, 1), (9, 1), (13, 1), (15, 1)],
  term ((-298456519591874 : Rat) / 1162780221153193) [(1, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-76939274184515017273256342531521837184 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (9, 1), (13, 2)],
  term ((618556387920433930657281959274127835376 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (9, 1), (14, 1)],
  term ((52209993745386587556466945432264188113755967333291914913 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(1, 1), (9, 1), (15, 2)],
  term ((-2047511920165755 : Rat) / 1162780221153193) [(1, 1), (9, 1), (15, 2), (16, 1)],
  term ((-186874141601856999042204278970628181504 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (9, 2), (10, 2), (13, 1)],
  term ((4898040419692806749424149347787096834615465390033086364 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (9, 2), (10, 2), (15, 1)],
  term ((-2990296899089872 : Rat) / 1162780221153193) [(1, 1), (9, 2), (10, 2), (15, 1), (16, 1)],
  term ((46718535400464249760551069742657045376 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (9, 2), (13, 1)],
  term ((-1224510104923201687356037336946774208653866347508271591 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (9, 2), (15, 1)],
  term ((747574224772468 : Rat) / 1162780221153193) [(1, 1), (9, 2), (15, 1), (16, 1)],
  term ((63112532186469946331305143931700421056 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (9, 3)],
  term ((-252450128745879785325220575726801684224 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (9, 3), (10, 2)],
  term ((-2858364389378608838764062023873769248962 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (10, 1), (11, 1), (12, 1)],
  term ((242292653066826458978527776170255754448 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (10, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((228548346943902101627953017098607070723838550969230898109 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(1, 1), (10, 1), (11, 1), (12, 1), (15, 2)],
  term ((-9851670194564511 : Rat) / 1162780221153193) [(1, 1), (10, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((2945401839328777677114321347171866811008 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (10, 1), (12, 1), (13, 1)],
  term ((-13262161070981340755479069648966346390752 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (10, 1), (12, 1), (13, 1), (14, 2)],
  term ((72007058824113739484180866806763665025597606343808478699 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(1, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-136808243557007545 : Rat) / 6976681326919158) [(1, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (10, 1), (12, 1), (14, 2), (15, 1)],
  term ((833967741040952 : Rat) / 1162780221153193) [(1, 1), (10, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-47183744963950877880300288915811498724926854734612865245 : Rat) / 2231997485116847564411456234007038153921631415793907312) [(1, 1), (10, 1), (12, 1), (15, 1)],
  term ((287594756757815537 : Rat) / 13953362653838316) [(1, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-7389205012976523401079042751439541051244 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (10, 1), (12, 2), (13, 1)],
  term ((-518902876483993937649997003986809833044 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (10, 1), (12, 2), (13, 1), (14, 1)],
  term ((164450924956588150524026507372646906853948765195645650517 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(1, 1), (10, 1), (12, 2), (14, 1), (15, 1)],
  term ((-14038382648281759 : Rat) / 1162780221153193) [(1, 1), (10, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-42670163252890233524806839594618073049894640497335965057 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(1, 1), (10, 1), (12, 2), (15, 1)],
  term ((-119277895525157125 : Rat) / 6976681326919158) [(1, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((249797660548386285418524913337906498156 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (10, 1), (12, 3), (13, 1)],
  term ((-26974210883668912519839817367166225675565343026070909313 : Rat) / 929998952132019818504773430836265897467346423247461380) [(1, 1), (10, 1), (12, 3), (15, 1)],
  term ((5003541596661801 : Rat) / 1162780221153193) [(1, 1), (10, 1), (12, 3), (15, 1), (16, 1)],
  term ((2858364389378608838764062023873769248962 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (10, 2), (11, 1)],
  term ((1487457656067842930311633980504958659096 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (10, 2), (12, 1), (13, 1)],
  term ((-593286787899895941887165466234683618608 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (10, 2), (12, 1), (13, 1), (14, 1)],
  term ((20252641348034408839391540692055832082022486889027059413 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (10, 2), (12, 1), (14, 1), (15, 1)],
  term ((-4378595632339196 : Rat) / 1162780221153193) [(1, 1), (10, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-63627736971180017614311097019407767411616512022247398207 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(1, 1), (10, 2), (12, 1), (15, 1)],
  term ((13803265389892245 : Rat) / 2325560442306386) [(1, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((20057862021961548603517933504460676800 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (10, 2), (12, 2), (13, 1)],
  term ((-229260363198380042514839814980074913585392736310747430 : Rat) / 46499947606600990925238671541813294873367321162373069) [(1, 1), (10, 2), (12, 2), (15, 1)],
  term ((3007050183364600 : Rat) / 1162780221153193) [(1, 1), (10, 2), (12, 2), (15, 1), (16, 1)],
  term ((748322143564559078038630250526735980092 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (10, 2), (13, 1)],
  term ((-5389089940248512487094205046480981922472 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (10, 2), (13, 1), (14, 1)],
  term ((3565764796440866516759975050578833739371693798700195348 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (10, 2), (13, 1), (15, 2)],
  term ((-1231965958083216 : Rat) / 1162780221153193) [(1, 1), (10, 2), (13, 1), (15, 2), (16, 1)],
  term ((-2316940935052632307052780858737264074566502626092094804 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (10, 2), (13, 2), (15, 1)],
  term ((150661185588720 : Rat) / 1162780221153193) [(1, 1), (10, 2), (13, 2), (15, 1), (16, 1)],
  term ((80945856112067634232098240062478093344 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (10, 2), (13, 3)],
  term ((123634377194162065175984705896580339781478522958385658387 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(1, 1), (10, 2), (14, 1), (15, 1)],
  term ((-16636019461371833 : Rat) / 1162780221153193) [(1, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((-64885598020952966377851495215056251811814535036016934143 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(1, 1), (10, 2), (15, 1)],
  term ((-1956325894898514 : Rat) / 1162780221153193) [(1, 1), (10, 2), (15, 1), (16, 1)],
  term ((4466115409796894554675042235934975650543774254263469936 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (10, 2), (15, 3)],
  term ((-898255108859200 : Rat) / 1162780221153193) [(1, 1), (10, 2), (15, 3), (16, 1)],
  term ((-1429182194689304419382031011936884624481 : Rat) / 3599128372207431889700080584088617803970) [(1, 1), (11, 1)],
  term ((1429182194689304419382031011936884624481 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (11, 1), (12, 1)],
  term ((-121146326533413229489263888085127877224 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-228548346943902101627953017098607070723838550969230898109 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(1, 1), (11, 1), (12, 1), (15, 2)],
  term ((9851670194564511 : Rat) / 2325560442306386) [(1, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-963896129163407086351667425944418077694 : Rat) / 359912837220743188970008058408861780397) [(1, 1), (12, 1), (13, 1)],
  term ((7076045626415592334154908924159185909332 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (12, 1), (13, 1), (14, 1)],
  term ((-2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (12, 1), (13, 1), (14, 2)],
  term ((-297031741864478853810108763188514323404882766587533673749 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(1, 1), (12, 1), (14, 1), (15, 1)],
  term ((149944030454025133 : Rat) / 13953362653838316) [(1, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (12, 1), (14, 2), (15, 1)],
  term ((-416983870520476 : Rat) / 1162780221153193) [(1, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((18721653861933400438488283849904078814765674105956982777 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(1, 1), (12, 1), (15, 1)],
  term ((-41125569115936534 : Rat) / 3488340663459579) [(1, 1), (12, 1), (15, 1), (16, 1)],
  term ((3619385523905905893276329125078042987622 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (12, 2), (13, 1)],
  term ((259451438241996968824998501993404916522 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (12, 2), (13, 1), (14, 1)],
  term ((-164450924956588150524026507372646906853948765195645650517 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(1, 1), (12, 2), (14, 1), (15, 1)],
  term ((14038382648281759 : Rat) / 2325560442306386) [(1, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((47255370516857834375103635894219571321602495223550913657 : Rat) / 3719995808528079274019093723345063589869385692989845520) [(1, 1), (12, 2), (15, 1)],
  term ((110256744975063325 : Rat) / 13953362653838316) [(1, 1), (12, 2), (15, 1), (16, 1)],
  term ((-124898830274193142709262456668953249078 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (12, 3), (13, 1)],
  term ((26974210883668912519839817367166225675565343026070909313 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(1, 1), (12, 3), (15, 1)],
  term ((-5003541596661801 : Rat) / 2325560442306386) [(1, 1), (12, 3), (15, 1), (16, 1)],
  term ((-187080535891139769509657562631683995023 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (13, 1)],
  term ((1347272485062128121773551261620245480618 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (13, 1), (14, 1)],
  term ((-891441199110216629189993762644708434842923449675048837 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (13, 1), (15, 2)],
  term ((307991489520804 : Rat) / 1162780221153193) [(1, 1), (13, 1), (15, 2), (16, 1)],
  term ((579235233763158076763195214684316018641625656523023701 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (13, 2), (15, 1)],
  term ((-37665296397180 : Rat) / 1162780221153193) [(1, 1), (13, 2), (15, 1), (16, 1)],
  term ((-20236464028016908558024560015619523336 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (13, 3)],
  term ((-123634377194162065175984705896580339781478522958385658387 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(1, 1), (14, 1), (15, 1)],
  term ((16636019461371833 : Rat) / 4651120884612772) [(1, 1), (14, 1), (15, 1), (16, 1)],
  term ((64885598020952966377851495215056251811814535036016934143 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(1, 1), (15, 1)],
  term ((978162947449257 : Rat) / 2325560442306386) [(1, 1), (15, 1), (16, 1)],
  term ((-1116528852449223638668760558983743912635943563565867484 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (15, 3)],
  term ((224563777214800 : Rat) / 1162780221153193) [(1, 1), (15, 3), (16, 1)],
  term ((-2140544576806429585465573269128715080 : Rat) / 119970945740247729656669352802953926799) [(1, 2), (2, 1), (8, 1)],
  term ((4281089153612859170931146538257430160 : Rat) / 119970945740247729656669352802953926799) [(1, 2), (2, 1), (8, 1), (10, 1)],
  term ((1465074617356825556565339743900656045508 : Rat) / 1799564186103715944850040292044308901985) [(1, 2), (4, 1), (8, 1)],
  term ((-2930149234713651113130679487801312091016 : Rat) / 1799564186103715944850040292044308901985) [(1, 2), (4, 1), (8, 1), (10, 1)],
  term ((113154626530813919845787359700054553376 : Rat) / 599854728701238648283346764014769633995) [(1, 2), (5, 1), (8, 1), (9, 1)],
  term ((-226309253061627839691574719400109106752 : Rat) / 599854728701238648283346764014769633995) [(1, 2), (5, 1), (8, 1), (9, 1), (10, 1)],
  term ((-254972611476488189155549754192141757184 : Rat) / 599854728701238648283346764014769633995) [(1, 2), (5, 1), (8, 1), (10, 1), (13, 1)],
  term ((-243539328217652737711491695951003614460707813477055168 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 2), (5, 1), (8, 1), (10, 1), (15, 1)],
  term ((6217296801248128 : Rat) / 3488340663459579) [(1, 2), (5, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((127486305738244094577774877096070878592 : Rat) / 599854728701238648283346764014769633995) [(1, 2), (5, 1), (8, 1), (13, 1)],
  term ((121769664108826368855745847975501807230353906738527584 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 2), (5, 1), (8, 1), (15, 1)],
  term ((-3108648400624064 : Rat) / 3488340663459579) [(1, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-18578835009886931389828064953150187574 : Rat) / 199951576233746216094448921338256544665) [(1, 2), (5, 1), (9, 1)],
  term ((74315340039547725559312259812600750296 : Rat) / 199951576233746216094448921338256544665) [(1, 2), (5, 1), (9, 1), (10, 2)],
  term ((-9407326506538999398797487783872895160 : Rat) / 39990315246749243218889784267651308933) [(1, 2), (5, 1), (10, 1), (13, 1)],
  term ((2354726156844551479976179518884154954213556855016731652 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 2), (5, 1), (10, 1), (15, 1)],
  term ((18814653013077998797594975567745790320 : Rat) / 39990315246749243218889784267651308933) [(1, 2), (5, 1), (10, 2), (13, 1)],
  term ((-4709452313689102959952359037768309908427113710033463304 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 2), (5, 1), (10, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 21, terms 600 through 699. -/
theorem ep_Q2_024_block_21_0600_0699_valid :
    checkProductSumEq ep_Q2_024_partials_21_0600_0699
      ep_Q2_024_block_21_0600_0699 = true := by
  native_decide

end EpQ2024TermShards

end Patterns

end EndpointCertificate

end Problem97
