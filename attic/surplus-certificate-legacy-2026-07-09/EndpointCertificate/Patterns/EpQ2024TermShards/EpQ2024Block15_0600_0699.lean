/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_024, term block 15:600-699

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_024`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2024TermShards

/-- Generator polynomial 15 for endpoint certificate `ep_Q2_024`. -/
def ep_Q2_024_generator_15_0600_0699 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(6, 1)]
]

/-- Coefficient term 600 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0600 : Poly :=
[
  term ((699598964377024284665984479369490528956 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (12, 1), (13, 2), (14, 1)]
]

/-- Partial product 600 for generator 15. -/
def ep_Q2_024_partial_15_0600 : Poly :=
[
  term ((1399197928754048569331968958738981057912 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (6, 1), (12, 1), (13, 2), (14, 1)],
  term ((-699598964377024284665984479369490528956 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (12, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 600 for generator 15. -/
theorem ep_Q2_024_partial_15_0600_valid :
    mulPoly ep_Q2_024_coefficient_15_0600
        ep_Q2_024_generator_15_0600_0699 =
      ep_Q2_024_partial_15_0600 := by
  native_decide

/-- Coefficient term 601 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0601 : Poly :=
[
  term ((-18487218660096223946260146026516252604 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (12, 1), (14, 1)]
]

/-- Partial product 601 for generator 15. -/
def ep_Q2_024_partial_15_0601 : Poly :=
[
  term ((-36974437320192447892520292053032505208 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (6, 1), (12, 1), (14, 1)],
  term ((18487218660096223946260146026516252604 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 601 for generator 15. -/
theorem ep_Q2_024_partial_15_0601_valid :
    mulPoly ep_Q2_024_coefficient_15_0601
        ep_Q2_024_generator_15_0600_0699 =
      ep_Q2_024_partial_15_0601 := by
  native_decide

/-- Coefficient term 602 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0602 : Poly :=
[
  term ((57065163418514028206963760297560614190626285699065528079 : Rat) / 929998952132019818504773430836265897467346423247461380) [(1, 1), (5, 1), (12, 1), (14, 1), (15, 2)]
]

/-- Partial product 602 for generator 15. -/
def ep_Q2_024_partial_15_0602 : Poly :=
[
  term ((57065163418514028206963760297560614190626285699065528079 : Rat) / 464999476066009909252386715418132948733673211623730690) [(1, 1), (5, 1), (6, 1), (12, 1), (14, 1), (15, 2)],
  term ((-57065163418514028206963760297560614190626285699065528079 : Rat) / 929998952132019818504773430836265897467346423247461380) [(1, 1), (5, 1), (12, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 602 for generator 15. -/
theorem ep_Q2_024_partial_15_0602_valid :
    mulPoly ep_Q2_024_coefficient_15_0602
        ep_Q2_024_generator_15_0600_0699 =
      ep_Q2_024_partial_15_0602 := by
  native_decide

/-- Coefficient term 603 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0603 : Poly :=
[
  term ((-13204414907240807 : Rat) / 1162780221153193) [(1, 1), (5, 1), (12, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 603 for generator 15. -/
def ep_Q2_024_partial_15_0603 : Poly :=
[
  term ((-26408829814481614 : Rat) / 1162780221153193) [(1, 1), (5, 1), (6, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((13204414907240807 : Rat) / 1162780221153193) [(1, 1), (5, 1), (12, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 603 for generator 15. -/
theorem ep_Q2_024_partial_15_0603_valid :
    mulPoly ep_Q2_024_coefficient_15_0603
        ep_Q2_024_generator_15_0600_0699 =
      ep_Q2_024_partial_15_0603 := by
  native_decide

/-- Coefficient term 604 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0604 : Poly :=
[
  term ((4466115409796894554675042235934975650543774254263469936 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (5, 1), (12, 1), (15, 2)]
]

/-- Partial product 604 for generator 15. -/
def ep_Q2_024_partial_15_0604 : Poly :=
[
  term ((8932230819593789109350084471869951301087548508526939872 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (5, 1), (6, 1), (12, 1), (15, 2)],
  term ((-4466115409796894554675042235934975650543774254263469936 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (5, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 604 for generator 15. -/
theorem ep_Q2_024_partial_15_0604_valid :
    mulPoly ep_Q2_024_coefficient_15_0604
        ep_Q2_024_generator_15_0600_0699 =
      ep_Q2_024_partial_15_0604 := by
  native_decide

/-- Coefficient term 605 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0605 : Poly :=
[
  term ((-898255108859200 : Rat) / 1162780221153193) [(1, 1), (5, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 605 for generator 15. -/
def ep_Q2_024_partial_15_0605 : Poly :=
[
  term ((-1796510217718400 : Rat) / 1162780221153193) [(1, 1), (5, 1), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((898255108859200 : Rat) / 1162780221153193) [(1, 1), (5, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 605 for generator 15. -/
theorem ep_Q2_024_partial_15_0605_valid :
    mulPoly ep_Q2_024_coefficient_15_0605
        ep_Q2_024_generator_15_0600_0699 =
      ep_Q2_024_partial_15_0605 := by
  native_decide

/-- Coefficient term 606 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0606 : Poly :=
[
  term ((2145093596645849219495004953877108926626236865692501316507 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(1, 1), (5, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 606 for generator 15. -/
def ep_Q2_024_partial_15_0606 : Poly :=
[
  term ((2145093596645849219495004953877108926626236865692501316507 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(1, 1), (5, 1), (6, 1), (13, 1), (14, 1), (15, 1)],
  term ((-2145093596645849219495004953877108926626236865692501316507 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(1, 1), (5, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 606 for generator 15. -/
theorem ep_Q2_024_partial_15_0606_valid :
    mulPoly ep_Q2_024_coefficient_15_0606
        ep_Q2_024_generator_15_0600_0699 =
      ep_Q2_024_partial_15_0606 := by
  native_decide

/-- Coefficient term 607 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0607 : Poly :=
[
  term ((49730484048564751 : Rat) / 6976681326919158) [(1, 1), (5, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 607 for generator 15. -/
def ep_Q2_024_partial_15_0607 : Poly :=
[
  term ((49730484048564751 : Rat) / 3488340663459579) [(1, 1), (5, 1), (6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-49730484048564751 : Rat) / 6976681326919158) [(1, 1), (5, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 607 for generator 15. -/
theorem ep_Q2_024_partial_15_0607_valid :
    mulPoly ep_Q2_024_coefficient_15_0607
        ep_Q2_024_generator_15_0600_0699 =
      ep_Q2_024_partial_15_0607 := by
  native_decide

/-- Coefficient term 608 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0608 : Poly :=
[
  term ((-1681207212074162784866544631513075229980270038215301238 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (5, 1), (13, 1), (14, 2), (15, 1)]
]

/-- Partial product 608 for generator 15. -/
def ep_Q2_024_partial_15_0608 : Poly :=
[
  term ((-3362414424148325569733089263026150459960540076430602476 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (5, 1), (6, 1), (13, 1), (14, 2), (15, 1)],
  term ((1681207212074162784866544631513075229980270038215301238 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (5, 1), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 608 for generator 15. -/
theorem ep_Q2_024_partial_15_0608_valid :
    mulPoly ep_Q2_024_coefficient_15_0608
        ep_Q2_024_generator_15_0600_0699 =
      ep_Q2_024_partial_15_0608 := by
  native_decide

/-- Coefficient term 609 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0609 : Poly :=
[
  term ((-833967741040952 : Rat) / 1162780221153193) [(1, 1), (5, 1), (13, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 609 for generator 15. -/
def ep_Q2_024_partial_15_0609 : Poly :=
[
  term ((-1667935482081904 : Rat) / 1162780221153193) [(1, 1), (5, 1), (6, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((833967741040952 : Rat) / 1162780221153193) [(1, 1), (5, 1), (13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 609 for generator 15. -/
theorem ep_Q2_024_partial_15_0609_valid :
    mulPoly ep_Q2_024_coefficient_15_0609
        ep_Q2_024_generator_15_0600_0699 =
      ep_Q2_024_partial_15_0609 := by
  native_decide

/-- Coefficient term 610 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0610 : Poly :=
[
  term ((-26487263738155951584262085343655170784 : Rat) / 359912837220743188970008058408861780397) [(1, 1), (5, 1), (13, 2), (14, 1)]
]

/-- Partial product 610 for generator 15. -/
def ep_Q2_024_partial_15_0610 : Poly :=
[
  term ((-52974527476311903168524170687310341568 : Rat) / 359912837220743188970008058408861780397) [(1, 1), (5, 1), (6, 1), (13, 2), (14, 1)],
  term ((26487263738155951584262085343655170784 : Rat) / 359912837220743188970008058408861780397) [(1, 1), (5, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 610 for generator 15. -/
theorem ep_Q2_024_partial_15_0610_valid :
    mulPoly ep_Q2_024_coefficient_15_0610
        ep_Q2_024_generator_15_0600_0699 =
      ep_Q2_024_partial_15_0610 := by
  native_decide

/-- Coefficient term 611 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0611 : Poly :=
[
  term ((-4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (13, 2), (14, 2)]
]

/-- Partial product 611 for generator 15. -/
def ep_Q2_024_partial_15_0611 : Poly :=
[
  term ((-8486750246624093521424296941571253888 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (6, 1), (13, 2), (14, 2)],
  term ((4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (13, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 611 for generator 15. -/
theorem ep_Q2_024_partial_15_0611_valid :
    mulPoly ep_Q2_024_coefficient_15_0611
        ep_Q2_024_generator_15_0600_0699 =
      ep_Q2_024_partial_15_0611 := by
  native_decide

/-- Coefficient term 612 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0612 : Poly :=
[
  term ((5779023800179324385686668960106447929907 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (5, 1), (14, 1)]
]

/-- Partial product 612 for generator 15. -/
def ep_Q2_024_partial_15_0612 : Poly :=
[
  term ((11558047600358648771373337920212895859814 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (5, 1), (6, 1), (14, 1)],
  term ((-5779023800179324385686668960106447929907 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (5, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 612 for generator 15. -/
theorem ep_Q2_024_partial_15_0612_valid :
    mulPoly ep_Q2_024_coefficient_15_0612
        ep_Q2_024_generator_15_0600_0699 =
      ep_Q2_024_partial_15_0612 := by
  native_decide

/-- Coefficient term 613 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0613 : Poly :=
[
  term ((-475418534318063580141443576875141509826674210915175752793 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(1, 1), (5, 1), (14, 1), (15, 2)]
]

/-- Partial product 613 for generator 15. -/
def ep_Q2_024_partial_15_0613 : Poly :=
[
  term ((-475418534318063580141443576875141509826674210915175752793 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(1, 1), (5, 1), (6, 1), (14, 1), (15, 2)],
  term ((475418534318063580141443576875141509826674210915175752793 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(1, 1), (5, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 613 for generator 15. -/
theorem ep_Q2_024_partial_15_0613_valid :
    mulPoly ep_Q2_024_coefficient_15_0613
        ep_Q2_024_generator_15_0600_0699 =
      ep_Q2_024_partial_15_0613 := by
  native_decide

/-- Coefficient term 614 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0614 : Poly :=
[
  term ((-23958955931124895 : Rat) / 6976681326919158) [(1, 1), (5, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 614 for generator 15. -/
def ep_Q2_024_partial_15_0614 : Poly :=
[
  term ((-23958955931124895 : Rat) / 3488340663459579) [(1, 1), (5, 1), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((23958955931124895 : Rat) / 6976681326919158) [(1, 1), (5, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 614 for generator 15. -/
theorem ep_Q2_024_partial_15_0614_valid :
    mulPoly ep_Q2_024_coefficient_15_0614
        ep_Q2_024_generator_15_0600_0699 =
      ep_Q2_024_partial_15_0614 := by
  native_decide

/-- Coefficient term 615 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0615 : Poly :=
[
  term ((-8921151527862041881559355605928391576 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (14, 2)]
]

/-- Partial product 615 for generator 15. -/
def ep_Q2_024_partial_15_0615 : Poly :=
[
  term ((-17842303055724083763118711211856783152 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (6, 1), (14, 2)],
  term ((8921151527862041881559355605928391576 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 615 for generator 15. -/
theorem ep_Q2_024_partial_15_0615_valid :
    mulPoly ep_Q2_024_coefficient_15_0615
        ep_Q2_024_generator_15_0600_0699 =
      ep_Q2_024_partial_15_0615 := by
  native_decide

/-- Coefficient term 616 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0616 : Poly :=
[
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (5, 1), (14, 2), (15, 2)]
]

/-- Partial product 616 for generator 15. -/
def ep_Q2_024_partial_15_0616 : Poly :=
[
  term ((674456529895393409686477352003493571793009190155093372 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (5, 1), (6, 1), (14, 2), (15, 2)],
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (5, 1), (14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 616 for generator 15. -/
theorem ep_Q2_024_partial_15_0616_valid :
    mulPoly ep_Q2_024_coefficient_15_0616
        ep_Q2_024_generator_15_0600_0699 =
      ep_Q2_024_partial_15_0616 := by
  native_decide

/-- Coefficient term 617 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0617 : Poly :=
[
  term ((833967741040952 : Rat) / 1162780221153193) [(1, 1), (5, 1), (14, 2), (15, 2), (16, 1)]
]

/-- Partial product 617 for generator 15. -/
def ep_Q2_024_partial_15_0617 : Poly :=
[
  term ((1667935482081904 : Rat) / 1162780221153193) [(1, 1), (5, 1), (6, 1), (14, 2), (15, 2), (16, 1)],
  term ((-833967741040952 : Rat) / 1162780221153193) [(1, 1), (5, 1), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 617 for generator 15. -/
theorem ep_Q2_024_partial_15_0617_valid :
    mulPoly ep_Q2_024_coefficient_15_0617
        ep_Q2_024_generator_15_0600_0699 =
      ep_Q2_024_partial_15_0617 := by
  native_decide

/-- Coefficient term 618 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0618 : Poly :=
[
  term ((-57424356410650916815904656776024181448 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 2), (9, 1), (14, 1)]
]

/-- Partial product 618 for generator 15. -/
def ep_Q2_024_partial_15_0618 : Poly :=
[
  term ((-114848712821301833631809313552048362896 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 2), (6, 1), (9, 1), (14, 1)],
  term ((57424356410650916815904656776024181448 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 2), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 618 for generator 15. -/
theorem ep_Q2_024_partial_15_0618_valid :
    mulPoly ep_Q2_024_coefficient_15_0618
        ep_Q2_024_generator_15_0600_0699 =
      ep_Q2_024_partial_15_0618 := by
  native_decide

/-- Coefficient term 619 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0619 : Poly :=
[
  term ((-319014959023338608753545314714028482032 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 2), (13, 1), (14, 1)]
]

/-- Partial product 619 for generator 15. -/
def ep_Q2_024_partial_15_0619 : Poly :=
[
  term ((-638029918046677217507090629428056964064 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 2), (6, 1), (13, 1), (14, 1)],
  term ((319014959023338608753545314714028482032 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 619 for generator 15. -/
theorem ep_Q2_024_partial_15_0619_valid :
    mulPoly ep_Q2_024_coefficient_15_0619
        ep_Q2_024_generator_15_0600_0699 =
      ep_Q2_024_partial_15_0619 := by
  native_decide

/-- Coefficient term 620 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0620 : Poly :=
[
  term ((-611290440484817771250536926183090648376587587301938898 : Rat) / 46499947606600990925238671541813294873367321162373069) [(1, 1), (5, 2), (14, 1), (15, 1)]
]

/-- Partial product 620 for generator 15. -/
def ep_Q2_024_partial_15_0620 : Poly :=
[
  term ((-1222580880969635542501073852366181296753175174603877796 : Rat) / 46499947606600990925238671541813294873367321162373069) [(1, 1), (5, 2), (6, 1), (14, 1), (15, 1)],
  term ((611290440484817771250536926183090648376587587301938898 : Rat) / 46499947606600990925238671541813294873367321162373069) [(1, 1), (5, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 620 for generator 15. -/
theorem ep_Q2_024_partial_15_0620_valid :
    mulPoly ep_Q2_024_coefficient_15_0620
        ep_Q2_024_generator_15_0600_0699 =
      ep_Q2_024_partial_15_0620 := by
  native_decide

/-- Coefficient term 621 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0621 : Poly :=
[
  term ((2568602061245288 : Rat) / 1162780221153193) [(1, 1), (5, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 621 for generator 15. -/
def ep_Q2_024_partial_15_0621 : Poly :=
[
  term ((5137204122490576 : Rat) / 1162780221153193) [(1, 1), (5, 2), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2568602061245288 : Rat) / 1162780221153193) [(1, 1), (5, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 621 for generator 15. -/
theorem ep_Q2_024_partial_15_0621_valid :
    mulPoly ep_Q2_024_coefficient_15_0621
        ep_Q2_024_generator_15_0600_0699 =
      ep_Q2_024_partial_15_0621 := by
  native_decide

/-- Coefficient term 622 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0622 : Poly :=
[
  term ((216972628081924106501895954685240162569 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (6, 1), (9, 1)]
]

/-- Partial product 622 for generator 15. -/
def ep_Q2_024_partial_15_0622 : Poly :=
[
  term ((-216972628081924106501895954685240162569 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (6, 1), (9, 1)],
  term ((433945256163848213003791909370480325138 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (6, 2), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 622 for generator 15. -/
theorem ep_Q2_024_partial_15_0622_valid :
    mulPoly ep_Q2_024_coefficient_15_0622
        ep_Q2_024_generator_15_0600_0699 =
      ep_Q2_024_partial_15_0622 := by
  native_decide

/-- Coefficient term 623 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0623 : Poly :=
[
  term ((-29825028787604780568533645441663554308 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (6, 1), (9, 1), (12, 1)]
]

/-- Partial product 623 for generator 15. -/
def ep_Q2_024_partial_15_0623 : Poly :=
[
  term ((29825028787604780568533645441663554308 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (6, 1), (9, 1), (12, 1)],
  term ((-59650057575209561137067290883327108616 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (6, 2), (9, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 623 for generator 15. -/
theorem ep_Q2_024_partial_15_0623_valid :
    mulPoly ep_Q2_024_coefficient_15_0623
        ep_Q2_024_generator_15_0600_0699 =
      ep_Q2_024_partial_15_0623 := by
  native_decide

/-- Coefficient term 624 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0624 : Poly :=
[
  term ((-1429182194689304419382031011936884624481 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (6, 1), (11, 1)]
]

/-- Partial product 624 for generator 15. -/
def ep_Q2_024_partial_15_0624 : Poly :=
[
  term ((1429182194689304419382031011936884624481 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (6, 1), (11, 1)],
  term ((-2858364389378608838764062023873769248962 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (6, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 624 for generator 15. -/
theorem ep_Q2_024_partial_15_0624_valid :
    mulPoly ep_Q2_024_coefficient_15_0624
        ep_Q2_024_generator_15_0600_0699 =
      ep_Q2_024_partial_15_0624 := by
  native_decide

/-- Coefficient term 625 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0625 : Poly :=
[
  term ((-978713189482658811602675316160828911784 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (6, 1), (12, 1), (13, 1)]
]

/-- Partial product 625 for generator 15. -/
def ep_Q2_024_partial_15_0625 : Poly :=
[
  term ((978713189482658811602675316160828911784 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (6, 1), (12, 1), (13, 1)],
  term ((-1957426378965317623205350632321657823568 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (6, 2), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 625 for generator 15. -/
theorem ep_Q2_024_partial_15_0625_valid :
    mulPoly ep_Q2_024_coefficient_15_0625
        ep_Q2_024_generator_15_0600_0699 =
      ep_Q2_024_partial_15_0625 := by
  native_decide

/-- Coefficient term 626 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0626 : Poly :=
[
  term ((-2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (6, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 626 for generator 15. -/
def ep_Q2_024_partial_15_0626 : Poly :=
[
  term ((2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (6, 1), (12, 1), (13, 1), (14, 1)],
  term ((-4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (6, 2), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 626 for generator 15. -/
theorem ep_Q2_024_partial_15_0626_valid :
    mulPoly ep_Q2_024_coefficient_15_0626
        ep_Q2_024_generator_15_0600_0699 =
      ep_Q2_024_partial_15_0626 := by
  native_decide

/-- Coefficient term 627 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0627 : Poly :=
[
  term ((-168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (6, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 627 for generator 15. -/
def ep_Q2_024_partial_15_0627 : Poly :=
[
  term ((168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (6, 1), (12, 1), (14, 1), (15, 1)],
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (6, 2), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 627 for generator 15. -/
theorem ep_Q2_024_partial_15_0627_valid :
    mulPoly ep_Q2_024_coefficient_15_0627
        ep_Q2_024_generator_15_0600_0699 =
      ep_Q2_024_partial_15_0627 := by
  native_decide

/-- Coefficient term 628 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0628 : Poly :=
[
  term ((-416983870520476 : Rat) / 1162780221153193) [(1, 1), (6, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 628 for generator 15. -/
def ep_Q2_024_partial_15_0628 : Poly :=
[
  term ((416983870520476 : Rat) / 1162780221153193) [(1, 1), (6, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-833967741040952 : Rat) / 1162780221153193) [(1, 1), (6, 2), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 628 for generator 15. -/
theorem ep_Q2_024_partial_15_0628_valid :
    mulPoly ep_Q2_024_coefficient_15_0628
        ep_Q2_024_generator_15_0600_0699 =
      ep_Q2_024_partial_15_0628 := by
  native_decide

/-- Coefficient term 629 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0629 : Poly :=
[
  term ((41474039614314444175292781100268953852929667220818943797 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(1, 1), (6, 1), (12, 1), (15, 1)]
]

/-- Partial product 629 for generator 15. -/
def ep_Q2_024_partial_15_0629 : Poly :=
[
  term ((-41474039614314444175292781100268953852929667220818943797 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(1, 1), (6, 1), (12, 1), (15, 1)],
  term ((41474039614314444175292781100268953852929667220818943797 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (6, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 629 for generator 15. -/
theorem ep_Q2_024_partial_15_0629_valid :
    mulPoly ep_Q2_024_coefficient_15_0629
        ep_Q2_024_generator_15_0600_0699 =
      ep_Q2_024_partial_15_0629 := by
  native_decide

/-- Coefficient term 630 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0630 : Poly :=
[
  term ((-3815045210365534 : Rat) / 1162780221153193) [(1, 1), (6, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 630 for generator 15. -/
def ep_Q2_024_partial_15_0630 : Poly :=
[
  term ((3815045210365534 : Rat) / 1162780221153193) [(1, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-7630090420731068 : Rat) / 1162780221153193) [(1, 1), (6, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 630 for generator 15. -/
theorem ep_Q2_024_partial_15_0630_valid :
    mulPoly ep_Q2_024_coefficient_15_0630
        ep_Q2_024_generator_15_0600_0699 =
      ep_Q2_024_partial_15_0630 := by
  native_decide

/-- Coefficient term 631 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0631 : Poly :=
[
  term ((362247986505545785230389804845802505856 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (6, 1), (12, 2), (13, 1)]
]

/-- Partial product 631 for generator 15. -/
def ep_Q2_024_partial_15_0631 : Poly :=
[
  term ((-362247986505545785230389804845802505856 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (6, 1), (12, 2), (13, 1)],
  term ((724495973011091570460779609691605011712 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (6, 2), (12, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 631 for generator 15. -/
theorem ep_Q2_024_partial_15_0631_valid :
    mulPoly ep_Q2_024_coefficient_15_0631
        ep_Q2_024_generator_15_0600_0699 =
      ep_Q2_024_partial_15_0631 := by
  native_decide

/-- Coefficient term 632 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0632 : Poly :=
[
  term ((-3257096208512683818267653266718205086600232278149220966 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (6, 1), (12, 2), (15, 1)]
]

/-- Partial product 632 for generator 15. -/
def ep_Q2_024_partial_15_0632 : Poly :=
[
  term ((3257096208512683818267653266718205086600232278149220966 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (6, 1), (12, 2), (15, 1)],
  term ((-6514192417025367636535306533436410173200464556298441932 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (6, 2), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 632 for generator 15. -/
theorem ep_Q2_024_partial_15_0632_valid :
    mulPoly ep_Q2_024_coefficient_15_0632
        ep_Q2_024_generator_15_0600_0699 =
      ep_Q2_024_partial_15_0632 := by
  native_decide

/-- Coefficient term 633 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0633 : Poly :=
[
  term ((2393155378199320 : Rat) / 1162780221153193) [(1, 1), (6, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 633 for generator 15. -/
def ep_Q2_024_partial_15_0633 : Poly :=
[
  term ((-2393155378199320 : Rat) / 1162780221153193) [(1, 1), (6, 1), (12, 2), (15, 1), (16, 1)],
  term ((4786310756398640 : Rat) / 1162780221153193) [(1, 1), (6, 2), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 633 for generator 15. -/
theorem ep_Q2_024_partial_15_0633_valid :
    mulPoly ep_Q2_024_coefficient_15_0633
        ep_Q2_024_generator_15_0600_0699 =
      ep_Q2_024_partial_15_0633 := by
  native_decide

/-- Coefficient term 634 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0634 : Poly :=
[
  term ((370315927423382885391950958321325355729 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (6, 1), (13, 1)]
]

/-- Partial product 634 for generator 15. -/
def ep_Q2_024_partial_15_0634 : Poly :=
[
  term ((-370315927423382885391950958321325355729 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (6, 1), (13, 1)],
  term ((740631854846765770783901916642650711458 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (6, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 634 for generator 15. -/
theorem ep_Q2_024_partial_15_0634_valid :
    mulPoly ep_Q2_024_coefficient_15_0634
        ep_Q2_024_generator_15_0600_0699 =
      ep_Q2_024_partial_15_0634 := by
  native_decide

/-- Coefficient term 635 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0635 : Poly :=
[
  term ((2233057704898447277337521117967487825271887127131734968 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (6, 1), (13, 1), (15, 2)]
]

/-- Partial product 635 for generator 15. -/
def ep_Q2_024_partial_15_0635 : Poly :=
[
  term ((-2233057704898447277337521117967487825271887127131734968 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (6, 1), (13, 1), (15, 2)],
  term ((4466115409796894554675042235934975650543774254263469936 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (6, 2), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 635 for generator 15. -/
theorem ep_Q2_024_partial_15_0635_valid :
    mulPoly ep_Q2_024_coefficient_15_0635
        ep_Q2_024_generator_15_0600_0699 =
      ep_Q2_024_partial_15_0635 := by
  native_decide

/-- Coefficient term 636 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0636 : Poly :=
[
  term ((-449127554429600 : Rat) / 1162780221153193) [(1, 1), (6, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 636 for generator 15. -/
def ep_Q2_024_partial_15_0636 : Poly :=
[
  term ((449127554429600 : Rat) / 1162780221153193) [(1, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((-898255108859200 : Rat) / 1162780221153193) [(1, 1), (6, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 636 for generator 15. -/
theorem ep_Q2_024_partial_15_0636_valid :
    mulPoly ep_Q2_024_coefficient_15_0636
        ep_Q2_024_generator_15_0600_0699 =
      ep_Q2_024_partial_15_0636 := by
  native_decide

/-- Coefficient term 637 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0637 : Poly :=
[
  term ((23303003274098118356770852827110756224 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (6, 1), (13, 2), (15, 1)]
]

/-- Partial product 637 for generator 15. -/
def ep_Q2_024_partial_15_0637 : Poly :=
[
  term ((-23303003274098118356770852827110756224 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (6, 1), (13, 2), (15, 1)],
  term ((46606006548196236713541705654221512448 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (6, 2), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 637 for generator 15. -/
theorem ep_Q2_024_partial_15_0637_valid :
    mulPoly ep_Q2_024_coefficient_15_0637
        ep_Q2_024_generator_15_0600_0699 =
      ep_Q2_024_partial_15_0637 := by
  native_decide

/-- Coefficient term 638 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0638 : Poly :=
[
  term ((-14930111000563771909392666589219249207504651660907005579 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (6, 1), (15, 1)]
]

/-- Partial product 638 for generator 15. -/
def ep_Q2_024_partial_15_0638 : Poly :=
[
  term ((14930111000563771909392666589219249207504651660907005579 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (6, 1), (15, 1)],
  term ((-29860222001127543818785333178438498415009303321814011158 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (6, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 638 for generator 15. -/
theorem ep_Q2_024_partial_15_0638_valid :
    mulPoly ep_Q2_024_coefficient_15_0638
        ep_Q2_024_generator_15_0600_0699 =
      ep_Q2_024_partial_15_0638 := by
  native_decide

/-- Coefficient term 639 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0639 : Poly :=
[
  term ((2314053073690208 : Rat) / 1162780221153193) [(1, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 639 for generator 15. -/
def ep_Q2_024_partial_15_0639 : Poly :=
[
  term ((-2314053073690208 : Rat) / 1162780221153193) [(1, 1), (6, 1), (15, 1), (16, 1)],
  term ((4628106147380416 : Rat) / 1162780221153193) [(1, 1), (6, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 639 for generator 15. -/
theorem ep_Q2_024_partial_15_0639_valid :
    mulPoly ep_Q2_024_coefficient_15_0639
        ep_Q2_024_generator_15_0600_0699 =
      ep_Q2_024_partial_15_0639 := by
  native_decide

/-- Coefficient term 640 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0640 : Poly :=
[
  term ((-129635793720887885036628771703244224696 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (7, 1), (8, 1)]
]

/-- Partial product 640 for generator 15. -/
def ep_Q2_024_partial_15_0640 : Poly :=
[
  term ((-259271587441775770073257543406488449392 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (6, 1), (7, 1), (8, 1)],
  term ((129635793720887885036628771703244224696 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (7, 1), (8, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 640 for generator 15. -/
theorem ep_Q2_024_partial_15_0640_valid :
    mulPoly ep_Q2_024_coefficient_15_0640
        ep_Q2_024_generator_15_0600_0699 =
      ep_Q2_024_partial_15_0640 := by
  native_decide

/-- Coefficient term 641 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0641 : Poly :=
[
  term ((129635793720887885036628771703244224696 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (7, 1), (12, 1)]
]

/-- Partial product 641 for generator 15. -/
def ep_Q2_024_partial_15_0641 : Poly :=
[
  term ((259271587441775770073257543406488449392 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (6, 1), (7, 1), (12, 1)],
  term ((-129635793720887885036628771703244224696 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (7, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 641 for generator 15. -/
theorem ep_Q2_024_partial_15_0641_valid :
    mulPoly ep_Q2_024_coefficient_15_0641
        ep_Q2_024_generator_15_0600_0699 =
      ep_Q2_024_partial_15_0641 := by
  native_decide

/-- Coefficient term 642 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0642 : Poly :=
[
  term ((-259271587441775770073257543406488449392 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (7, 1), (14, 1)]
]

/-- Partial product 642 for generator 15. -/
def ep_Q2_024_partial_15_0642 : Poly :=
[
  term ((-518543174883551540146515086812976898784 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (6, 1), (7, 1), (14, 1)],
  term ((259271587441775770073257543406488449392 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (7, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 642 for generator 15. -/
theorem ep_Q2_024_partial_15_0642_valid :
    mulPoly ep_Q2_024_coefficient_15_0642
        ep_Q2_024_generator_15_0600_0699 =
      ep_Q2_024_partial_15_0642 := by
  native_decide

/-- Coefficient term 643 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0643 : Poly :=
[
  term ((470221962546291690410739826432694674626 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (8, 1), (9, 1)]
]

/-- Partial product 643 for generator 15. -/
def ep_Q2_024_partial_15_0643 : Poly :=
[
  term ((940443925092583380821479652865389349252 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (6, 1), (8, 1), (9, 1)],
  term ((-470221962546291690410739826432694674626 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (8, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 643 for generator 15. -/
theorem ep_Q2_024_partial_15_0643_valid :
    mulPoly ep_Q2_024_coefficient_15_0643
        ep_Q2_024_generator_15_0600_0699 =
      ep_Q2_024_partial_15_0643 := by
  native_decide

/-- Coefficient term 644 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0644 : Poly :=
[
  term ((334760625685890379059113333535631342424 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (8, 1), (9, 1), (12, 1)]
]

/-- Partial product 644 for generator 15. -/
def ep_Q2_024_partial_15_0644 : Poly :=
[
  term ((669521251371780758118226667071262684848 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (6, 1), (8, 1), (9, 1), (12, 1)],
  term ((-334760625685890379059113333535631342424 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (8, 1), (9, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 644 for generator 15. -/
theorem ep_Q2_024_partial_15_0644_valid :
    mulPoly ep_Q2_024_coefficient_15_0644
        ep_Q2_024_generator_15_0600_0699 =
      ep_Q2_024_partial_15_0644 := by
  native_decide

/-- Coefficient term 645 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0645 : Poly :=
[
  term ((-246382883394687277923374977844594259244 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (8, 1), (9, 1), (14, 1)]
]

/-- Partial product 645 for generator 15. -/
def ep_Q2_024_partial_15_0645 : Poly :=
[
  term ((-492765766789374555846749955689188518488 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (6, 1), (8, 1), (9, 1), (14, 1)],
  term ((246382883394687277923374977844594259244 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (8, 1), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 645 for generator 15. -/
theorem ep_Q2_024_partial_15_0645_valid :
    mulPoly ep_Q2_024_coefficient_15_0645
        ep_Q2_024_generator_15_0600_0699 =
      ep_Q2_024_partial_15_0645 := by
  native_decide

/-- Coefficient term 646 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0646 : Poly :=
[
  term ((-1429182194689304419382031011936884624481 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (8, 1), (11, 1)]
]

/-- Partial product 646 for generator 15. -/
def ep_Q2_024_partial_15_0646 : Poly :=
[
  term ((-2858364389378608838764062023873769248962 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (6, 1), (8, 1), (11, 1)],
  term ((1429182194689304419382031011936884624481 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (8, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 646 for generator 15. -/
theorem ep_Q2_024_partial_15_0646_valid :
    mulPoly ep_Q2_024_coefficient_15_0646
        ep_Q2_024_generator_15_0600_0699 =
      ep_Q2_024_partial_15_0646 := by
  native_decide

/-- Coefficient term 647 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0647 : Poly :=
[
  term ((-4356564189724637708906259429022804199456 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (8, 1), (12, 1), (13, 1)]
]

/-- Partial product 647 for generator 15. -/
def ep_Q2_024_partial_15_0647 : Poly :=
[
  term ((-8713128379449275417812518858045608398912 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (6, 1), (8, 1), (12, 1), (13, 1)],
  term ((4356564189724637708906259429022804199456 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (8, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 647 for generator 15. -/
theorem ep_Q2_024_partial_15_0647_valid :
    mulPoly ep_Q2_024_coefficient_15_0647
        ep_Q2_024_generator_15_0600_0699 =
      ep_Q2_024_partial_15_0647 := by
  native_decide

/-- Coefficient term 648 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0648 : Poly :=
[
  term ((172337401456158824305693594333174250126 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (8, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 648 for generator 15. -/
def ep_Q2_024_partial_15_0648 : Poly :=
[
  term ((344674802912317648611387188666348500252 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (6, 1), (8, 1), (12, 1), (13, 1), (14, 1)],
  term ((-172337401456158824305693594333174250126 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (8, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 648 for generator 15. -/
theorem ep_Q2_024_partial_15_0648_valid :
    mulPoly ep_Q2_024_coefficient_15_0648
        ep_Q2_024_generator_15_0600_0699 =
      ep_Q2_024_partial_15_0648 := by
  native_decide

/-- Coefficient term 649 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0649 : Poly :=
[
  term ((-42897185966036484390082822956409864505349421492734777533 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(1, 1), (8, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 649 for generator 15. -/
def ep_Q2_024_partial_15_0649 : Poly :=
[
  term ((-42897185966036484390082822956409864505349421492734777533 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(1, 1), (6, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((42897185966036484390082822956409864505349421492734777533 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(1, 1), (8, 1), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 649 for generator 15. -/
theorem ep_Q2_024_partial_15_0649_valid :
    mulPoly ep_Q2_024_coefficient_15_0649
        ep_Q2_024_generator_15_0600_0699 =
      ep_Q2_024_partial_15_0649 := by
  native_decide

/-- Coefficient term 650 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0650 : Poly :=
[
  term ((277384937357655 : Rat) / 2325560442306386) [(1, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 650 for generator 15. -/
def ep_Q2_024_partial_15_0650 : Poly :=
[
  term ((277384937357655 : Rat) / 1162780221153193) [(1, 1), (6, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-277384937357655 : Rat) / 2325560442306386) [(1, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 650 for generator 15. -/
theorem ep_Q2_024_partial_15_0650_valid :
    mulPoly ep_Q2_024_coefficient_15_0650
        ep_Q2_024_generator_15_0600_0699 =
      ep_Q2_024_partial_15_0650 := by
  native_decide

/-- Coefficient term 651 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0651 : Poly :=
[
  term ((2790009293275740138936205997796948742986167698945351423 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(1, 1), (8, 1), (12, 1), (15, 1)]
]

/-- Partial product 651 for generator 15. -/
def ep_Q2_024_partial_15_0651 : Poly :=
[
  term ((2790009293275740138936205997796948742986167698945351423 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(1, 1), (6, 1), (8, 1), (12, 1), (15, 1)],
  term ((-2790009293275740138936205997796948742986167698945351423 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(1, 1), (8, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 651 for generator 15. -/
theorem ep_Q2_024_partial_15_0651_valid :
    mulPoly ep_Q2_024_coefficient_15_0651
        ep_Q2_024_generator_15_0600_0699 =
      ep_Q2_024_partial_15_0651 := by
  native_decide

/-- Coefficient term 652 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0652 : Poly :=
[
  term ((-131503738079788567 : Rat) / 13953362653838316) [(1, 1), (8, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 652 for generator 15. -/
def ep_Q2_024_partial_15_0652 : Poly :=
[
  term ((-131503738079788567 : Rat) / 6976681326919158) [(1, 1), (6, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((131503738079788567 : Rat) / 13953362653838316) [(1, 1), (8, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 652 for generator 15. -/
theorem ep_Q2_024_partial_15_0652_valid :
    mulPoly ep_Q2_024_coefficient_15_0652
        ep_Q2_024_generator_15_0600_0699 =
      ep_Q2_024_partial_15_0652 := by
  native_decide

/-- Coefficient term 653 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0653 : Poly :=
[
  term ((124898830274193142709262456668953249078 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (8, 1), (12, 2), (13, 1)]
]

/-- Partial product 653 for generator 15. -/
def ep_Q2_024_partial_15_0653 : Poly :=
[
  term ((249797660548386285418524913337906498156 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (6, 1), (8, 1), (12, 2), (13, 1)],
  term ((-124898830274193142709262456668953249078 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (8, 1), (12, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 653 for generator 15. -/
theorem ep_Q2_024_partial_15_0653_valid :
    mulPoly ep_Q2_024_coefficient_15_0653
        ep_Q2_024_generator_15_0600_0699 =
      ep_Q2_024_partial_15_0653 := by
  native_decide

/-- Coefficient term 654 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0654 : Poly :=
[
  term ((-26974210883668912519839817367166225675565343026070909313 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(1, 1), (8, 1), (12, 2), (15, 1)]
]

/-- Partial product 654 for generator 15. -/
def ep_Q2_024_partial_15_0654 : Poly :=
[
  term ((-26974210883668912519839817367166225675565343026070909313 : Rat) / 929998952132019818504773430836265897467346423247461380) [(1, 1), (6, 1), (8, 1), (12, 2), (15, 1)],
  term ((26974210883668912519839817367166225675565343026070909313 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(1, 1), (8, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 654 for generator 15. -/
theorem ep_Q2_024_partial_15_0654_valid :
    mulPoly ep_Q2_024_coefficient_15_0654
        ep_Q2_024_generator_15_0600_0699 =
      ep_Q2_024_partial_15_0654 := by
  native_decide

/-- Coefficient term 655 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0655 : Poly :=
[
  term ((5003541596661801 : Rat) / 2325560442306386) [(1, 1), (8, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 655 for generator 15. -/
def ep_Q2_024_partial_15_0655 : Poly :=
[
  term ((5003541596661801 : Rat) / 1162780221153193) [(1, 1), (6, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((-5003541596661801 : Rat) / 2325560442306386) [(1, 1), (8, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 655 for generator 15. -/
theorem ep_Q2_024_partial_15_0655_valid :
    mulPoly ep_Q2_024_coefficient_15_0655
        ep_Q2_024_generator_15_0600_0699 =
      ep_Q2_024_partial_15_0655 := by
  native_decide

/-- Coefficient term 656 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0656 : Poly :=
[
  term ((-33205499331019002408747835458120414914 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (8, 1), (13, 1)]
]

/-- Partial product 656 for generator 15. -/
def ep_Q2_024_partial_15_0656 : Poly :=
[
  term ((-66410998662038004817495670916240829828 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (6, 1), (8, 1), (13, 1)],
  term ((33205499331019002408747835458120414914 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (8, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 656 for generator 15. -/
theorem ep_Q2_024_partial_15_0656_valid :
    mulPoly ep_Q2_024_coefficient_15_0656
        ep_Q2_024_generator_15_0600_0699 =
      ep_Q2_024_partial_15_0656 := by
  native_decide

/-- Coefficient term 657 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0657 : Poly :=
[
  term ((-9731724517667531014946304995107149754744 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (8, 1), (13, 1), (14, 1)]
]

/-- Partial product 657 for generator 15. -/
def ep_Q2_024_partial_15_0657 : Poly :=
[
  term ((-19463449035335062029892609990214299509488 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (6, 1), (8, 1), (13, 1), (14, 1)],
  term ((9731724517667531014946304995107149754744 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (8, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 657 for generator 15. -/
theorem ep_Q2_024_partial_15_0657_valid :
    mulPoly ep_Q2_024_coefficient_15_0657
        ep_Q2_024_generator_15_0600_0699 =
      ep_Q2_024_partial_15_0657 := by
  native_decide

/-- Coefficient term 658 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0658 : Poly :=
[
  term ((-2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (8, 1), (13, 1), (14, 2)]
]

/-- Partial product 658 for generator 15. -/
def ep_Q2_024_partial_15_0658 : Poly :=
[
  term ((-4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (6, 1), (8, 1), (13, 1), (14, 2)],
  term ((2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (8, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 658 for generator 15. -/
theorem ep_Q2_024_partial_15_0658_valid :
    mulPoly ep_Q2_024_coefficient_15_0658
        ep_Q2_024_generator_15_0600_0699 =
      ep_Q2_024_partial_15_0658 := by
  native_decide

/-- Coefficient term 659 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0659 : Poly :=
[
  term ((46606006548196236713541705654221512448 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (8, 1), (13, 1), (15, 2)]
]

/-- Partial product 659 for generator 15. -/
def ep_Q2_024_partial_15_0659 : Poly :=
[
  term ((93212013096392473427083411308443024896 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (6, 1), (8, 1), (13, 1), (15, 2)],
  term ((-46606006548196236713541705654221512448 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (8, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 659 for generator 15. -/
theorem ep_Q2_024_partial_15_0659_valid :
    mulPoly ep_Q2_024_coefficient_15_0659
        ep_Q2_024_generator_15_0600_0699 =
      ep_Q2_024_partial_15_0659 := by
  native_decide

/-- Coefficient term 660 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0660 : Poly :=
[
  term ((86883956888373154677565351407430153815648725261687772569 : Rat) / 3719995808528079274019093723345063589869385692989845520) [(1, 1), (8, 1), (14, 1), (15, 1)]
]

/-- Partial product 660 for generator 15. -/
def ep_Q2_024_partial_15_0660 : Poly :=
[
  term ((86883956888373154677565351407430153815648725261687772569 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(1, 1), (6, 1), (8, 1), (14, 1), (15, 1)],
  term ((-86883956888373154677565351407430153815648725261687772569 : Rat) / 3719995808528079274019093723345063589869385692989845520) [(1, 1), (8, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 660 for generator 15. -/
theorem ep_Q2_024_partial_15_0660_valid :
    mulPoly ep_Q2_024_coefficient_15_0660
        ep_Q2_024_generator_15_0600_0699 =
      ep_Q2_024_partial_15_0660 := by
  native_decide

/-- Coefficient term 661 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0661 : Poly :=
[
  term ((-60129224652876851 : Rat) / 13953362653838316) [(1, 1), (8, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 661 for generator 15. -/
def ep_Q2_024_partial_15_0661 : Poly :=
[
  term ((-60129224652876851 : Rat) / 6976681326919158) [(1, 1), (6, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((60129224652876851 : Rat) / 13953362653838316) [(1, 1), (8, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 661 for generator 15. -/
theorem ep_Q2_024_partial_15_0661_valid :
    mulPoly ep_Q2_024_coefficient_15_0661
        ep_Q2_024_generator_15_0600_0699 =
      ep_Q2_024_partial_15_0661 := by
  native_decide

/-- Coefficient term 662 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0662 : Poly :=
[
  term ((-168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (8, 1), (14, 2), (15, 1)]
]

/-- Partial product 662 for generator 15. -/
def ep_Q2_024_partial_15_0662 : Poly :=
[
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (6, 1), (8, 1), (14, 2), (15, 1)],
  term ((168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (8, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 662 for generator 15. -/
theorem ep_Q2_024_partial_15_0662_valid :
    mulPoly ep_Q2_024_coefficient_15_0662
        ep_Q2_024_generator_15_0600_0699 =
      ep_Q2_024_partial_15_0662 := by
  native_decide

/-- Coefficient term 663 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0663 : Poly :=
[
  term ((-416983870520476 : Rat) / 1162780221153193) [(1, 1), (8, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 663 for generator 15. -/
def ep_Q2_024_partial_15_0663 : Poly :=
[
  term ((-833967741040952 : Rat) / 1162780221153193) [(1, 1), (6, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((416983870520476 : Rat) / 1162780221153193) [(1, 1), (8, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 663 for generator 15. -/
theorem ep_Q2_024_partial_15_0663_valid :
    mulPoly ep_Q2_024_coefficient_15_0663
        ep_Q2_024_generator_15_0600_0699 =
      ep_Q2_024_partial_15_0663 := by
  native_decide

/-- Coefficient term 664 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0664 : Poly :=
[
  term ((-63235000842975854703597614395624623353546682444744162259 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(1, 1), (8, 1), (15, 1)]
]

/-- Partial product 664 for generator 15. -/
def ep_Q2_024_partial_15_0664 : Poly :=
[
  term ((-63235000842975854703597614395624623353546682444744162259 : Rat) / 929998952132019818504773430836265897467346423247461380) [(1, 1), (6, 1), (8, 1), (15, 1)],
  term ((63235000842975854703597614395624623353546682444744162259 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(1, 1), (8, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 664 for generator 15. -/
theorem ep_Q2_024_partial_15_0664_valid :
    mulPoly ep_Q2_024_coefficient_15_0664
        ep_Q2_024_generator_15_0600_0699 =
      ep_Q2_024_partial_15_0664 := by
  native_decide

/-- Coefficient term 665 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0665 : Poly :=
[
  term ((4842600466899879 : Rat) / 2325560442306386) [(1, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 665 for generator 15. -/
def ep_Q2_024_partial_15_0665 : Poly :=
[
  term ((4842600466899879 : Rat) / 1162780221153193) [(1, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((-4842600466899879 : Rat) / 2325560442306386) [(1, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 665 for generator 15. -/
theorem ep_Q2_024_partial_15_0665_valid :
    mulPoly ep_Q2_024_coefficient_15_0665
        ep_Q2_024_generator_15_0600_0699 =
      ep_Q2_024_partial_15_0665 := by
  native_decide

/-- Coefficient term 666 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0666 : Poly :=
[
  term ((4466115409796894554675042235934975650543774254263469936 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (8, 1), (15, 3)]
]

/-- Partial product 666 for generator 15. -/
def ep_Q2_024_partial_15_0666 : Poly :=
[
  term ((8932230819593789109350084471869951301087548508526939872 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (6, 1), (8, 1), (15, 3)],
  term ((-4466115409796894554675042235934975650543774254263469936 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (8, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 666 for generator 15. -/
theorem ep_Q2_024_partial_15_0666_valid :
    mulPoly ep_Q2_024_coefficient_15_0666
        ep_Q2_024_generator_15_0600_0699 =
      ep_Q2_024_partial_15_0666 := by
  native_decide

/-- Coefficient term 667 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0667 : Poly :=
[
  term ((-898255108859200 : Rat) / 1162780221153193) [(1, 1), (8, 1), (15, 3), (16, 1)]
]

/-- Partial product 667 for generator 15. -/
def ep_Q2_024_partial_15_0667 : Poly :=
[
  term ((-1796510217718400 : Rat) / 1162780221153193) [(1, 1), (6, 1), (8, 1), (15, 3), (16, 1)],
  term ((898255108859200 : Rat) / 1162780221153193) [(1, 1), (8, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 667 for generator 15. -/
theorem ep_Q2_024_partial_15_0667_valid :
    mulPoly ep_Q2_024_coefficient_15_0667
        ep_Q2_024_generator_15_0600_0699 =
      ep_Q2_024_partial_15_0667 := by
  native_decide

/-- Coefficient term 668 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0668 : Poly :=
[
  term ((216972628081924106501895954685240162569 : Rat) / 399903152467492432188897842676513089330) [(1, 1), (9, 1)]
]

/-- Partial product 668 for generator 15. -/
def ep_Q2_024_partial_15_0668 : Poly :=
[
  term ((216972628081924106501895954685240162569 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (6, 1), (9, 1)],
  term ((-216972628081924106501895954685240162569 : Rat) / 399903152467492432188897842676513089330) [(1, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 668 for generator 15. -/
theorem ep_Q2_024_partial_15_0668_valid :
    mulPoly ep_Q2_024_coefficient_15_0668
        ep_Q2_024_generator_15_0600_0699 =
      ep_Q2_024_partial_15_0668 := by
  native_decide

/-- Coefficient term 669 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0669 : Poly :=
[
  term ((-97026895388018816139001329830705290356 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (9, 1), (12, 1)]
]

/-- Partial product 669 for generator 15. -/
def ep_Q2_024_partial_15_0669 : Poly :=
[
  term ((-194053790776037632278002659661410580712 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (6, 1), (9, 1), (12, 1)],
  term ((97026895388018816139001329830705290356 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (9, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 669 for generator 15. -/
theorem ep_Q2_024_partial_15_0669_valid :
    mulPoly ep_Q2_024_coefficient_15_0669
        ep_Q2_024_generator_15_0600_0699 =
      ep_Q2_024_partial_15_0669 := by
  native_decide

/-- Coefficient term 670 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0670 : Poly :=
[
  term ((-6570968729135020696767114934141041039508 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (9, 1), (12, 1), (14, 1)]
]

/-- Partial product 670 for generator 15. -/
def ep_Q2_024_partial_15_0670 : Poly :=
[
  term ((-13141937458270041393534229868282082079016 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (6, 1), (9, 1), (12, 1), (14, 1)],
  term ((6570968729135020696767114934141041039508 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (9, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 670 for generator 15. -/
theorem ep_Q2_024_partial_15_0670_valid :
    mulPoly ep_Q2_024_coefficient_15_0670
        ep_Q2_024_generator_15_0600_0699 =
      ep_Q2_024_partial_15_0670 := by
  native_decide

/-- Coefficient term 671 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0671 : Poly :=
[
  term ((-334760625685890379059113333535631342424 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (9, 1), (12, 2)]
]

/-- Partial product 671 for generator 15. -/
def ep_Q2_024_partial_15_0671 : Poly :=
[
  term ((-669521251371780758118226667071262684848 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (6, 1), (9, 1), (12, 2)],
  term ((334760625685890379059113333535631342424 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (9, 1), (12, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 671 for generator 15. -/
theorem ep_Q2_024_partial_15_0671_valid :
    mulPoly ep_Q2_024_coefficient_15_0671
        ep_Q2_024_generator_15_0600_0699 =
      ep_Q2_024_partial_15_0671 := by
  native_decide

/-- Coefficient term 672 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0672 : Poly :=
[
  term ((2449020209846403374712074673893548417307732695016543182 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (9, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 672 for generator 15. -/
def ep_Q2_024_partial_15_0672 : Poly :=
[
  term ((4898040419692806749424149347787096834615465390033086364 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (6, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((-2449020209846403374712074673893548417307732695016543182 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (9, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 672 for generator 15. -/
theorem ep_Q2_024_partial_15_0672_valid :
    mulPoly ep_Q2_024_coefficient_15_0672
        ep_Q2_024_generator_15_0600_0699 =
      ep_Q2_024_partial_15_0672 := by
  native_decide

/-- Coefficient term 673 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0673 : Poly :=
[
  term ((-1495148449544936 : Rat) / 1162780221153193) [(1, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 673 for generator 15. -/
def ep_Q2_024_partial_15_0673 : Poly :=
[
  term ((-2990296899089872 : Rat) / 1162780221153193) [(1, 1), (6, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1495148449544936 : Rat) / 1162780221153193) [(1, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 673 for generator 15. -/
theorem ep_Q2_024_partial_15_0673_valid :
    mulPoly ep_Q2_024_coefficient_15_0673
        ep_Q2_024_generator_15_0600_0699 =
      ep_Q2_024_partial_15_0673 := by
  native_decide

/-- Coefficient term 674 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0674 : Poly :=
[
  term ((-156549602987398445852407283417014511808 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (9, 1), (13, 2), (14, 1)]
]

/-- Partial product 674 for generator 15. -/
def ep_Q2_024_partial_15_0674 : Poly :=
[
  term ((-313099205974796891704814566834029023616 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (6, 1), (9, 1), (13, 2), (14, 1)],
  term ((156549602987398445852407283417014511808 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (9, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 674 for generator 15. -/
theorem ep_Q2_024_partial_15_0674_valid :
    mulPoly ep_Q2_024_coefficient_15_0674
        ep_Q2_024_generator_15_0600_0699 =
      ep_Q2_024_partial_15_0674 := by
  native_decide

/-- Coefficient term 675 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0675 : Poly :=
[
  term ((1503200724195832143731226559734825965246 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (9, 1), (14, 1)]
]

/-- Partial product 675 for generator 15. -/
def ep_Q2_024_partial_15_0675 : Poly :=
[
  term ((3006401448391664287462453119469651930492 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (6, 1), (9, 1), (14, 1)],
  term ((-1503200724195832143731226559734825965246 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 675 for generator 15. -/
theorem ep_Q2_024_partial_15_0675_valid :
    mulPoly ep_Q2_024_coefficient_15_0675
        ep_Q2_024_generator_15_0600_0699 =
      ep_Q2_024_partial_15_0675 := by
  native_decide

/-- Coefficient term 676 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0676 : Poly :=
[
  term ((482650611438740466194406210179930591592 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (9, 1), (14, 2)]
]

/-- Partial product 676 for generator 15. -/
def ep_Q2_024_partial_15_0676 : Poly :=
[
  term ((965301222877480932388812420359861183184 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (6, 1), (9, 1), (14, 2)],
  term ((-482650611438740466194406210179930591592 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (9, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 676 for generator 15. -/
theorem ep_Q2_024_partial_15_0676_valid :
    mulPoly ep_Q2_024_coefficient_15_0676
        ep_Q2_024_generator_15_0600_0699 =
      ep_Q2_024_partial_15_0676 := by
  native_decide

/-- Coefficient term 677 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0677 : Poly :=
[
  term ((-126225064372939892662610287863400842112 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (9, 2), (13, 1), (14, 1)]
]

/-- Partial product 677 for generator 15. -/
def ep_Q2_024_partial_15_0677 : Poly :=
[
  term ((-252450128745879785325220575726801684224 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (6, 1), (9, 2), (13, 1), (14, 1)],
  term ((126225064372939892662610287863400842112 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (9, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 677 for generator 15. -/
theorem ep_Q2_024_partial_15_0677_valid :
    mulPoly ep_Q2_024_coefficient_15_0677
        ep_Q2_024_generator_15_0600_0699 =
      ep_Q2_024_partial_15_0677 := by
  native_decide

/-- Coefficient term 678 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0678 : Poly :=
[
  term ((-1429182194689304419382031011936884624481 : Rat) / 3599128372207431889700080584088617803970) [(1, 1), (11, 1)]
]

/-- Partial product 678 for generator 15. -/
def ep_Q2_024_partial_15_0678 : Poly :=
[
  term ((-1429182194689304419382031011936884624481 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (6, 1), (11, 1)],
  term ((1429182194689304419382031011936884624481 : Rat) / 3599128372207431889700080584088617803970) [(1, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 678 for generator 15. -/
theorem ep_Q2_024_partial_15_0678_valid :
    mulPoly ep_Q2_024_coefficient_15_0678
        ep_Q2_024_generator_15_0600_0699 =
      ep_Q2_024_partial_15_0678 := by
  native_decide

/-- Coefficient term 679 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0679 : Poly :=
[
  term ((1429182194689304419382031011936884624481 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (11, 1), (12, 1)]
]

/-- Partial product 679 for generator 15. -/
def ep_Q2_024_partial_15_0679 : Poly :=
[
  term ((2858364389378608838764062023873769248962 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (6, 1), (11, 1), (12, 1)],
  term ((-1429182194689304419382031011936884624481 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 679 for generator 15. -/
theorem ep_Q2_024_partial_15_0679_valid :
    mulPoly ep_Q2_024_coefficient_15_0679
        ep_Q2_024_generator_15_0600_0699 =
      ep_Q2_024_partial_15_0679 := by
  native_decide

/-- Coefficient term 680 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0680 : Poly :=
[
  term ((-2858364389378608838764062023873769248962 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (11, 1), (14, 1)]
]

/-- Partial product 680 for generator 15. -/
def ep_Q2_024_partial_15_0680 : Poly :=
[
  term ((-5716728778757217677528124047747538497924 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (6, 1), (11, 1), (14, 1)],
  term ((2858364389378608838764062023873769248962 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 680 for generator 15. -/
theorem ep_Q2_024_partial_15_0680_valid :
    mulPoly ep_Q2_024_coefficient_15_0680
        ep_Q2_024_generator_15_0600_0699 =
      ep_Q2_024_partial_15_0680 := by
  native_decide

/-- Coefficient term 681 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0681 : Poly :=
[
  term ((-152050365136770134464196607540764680326 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (12, 1), (13, 1)]
]

/-- Partial product 681 for generator 15. -/
def ep_Q2_024_partial_15_0681 : Poly :=
[
  term ((-304100730273540268928393215081529360652 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (6, 1), (12, 1), (13, 1)],
  term ((152050365136770134464196607540764680326 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 681 for generator 15. -/
theorem ep_Q2_024_partial_15_0681_valid :
    mulPoly ep_Q2_024_coefficient_15_0681
        ep_Q2_024_generator_15_0600_0699 =
      ep_Q2_024_partial_15_0681 := by
  native_decide

/-- Coefficient term 682 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0682 : Poly :=
[
  term ((-3206903168664934630691848055693142588526 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 682 for generator 15. -/
def ep_Q2_024_partial_15_0682 : Poly :=
[
  term ((-6413806337329869261383696111386285177052 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (6, 1), (12, 1), (13, 1), (14, 1)],
  term ((3206903168664934630691848055693142588526 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 682 for generator 15. -/
theorem ep_Q2_024_partial_15_0682_valid :
    mulPoly ep_Q2_024_coefficient_15_0682
        ep_Q2_024_generator_15_0600_0699 =
      ep_Q2_024_partial_15_0682 := by
  native_decide

/-- Coefficient term 683 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0683 : Poly :=
[
  term ((1546100191643701696048210640783465431772 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (12, 1), (13, 1), (14, 2)]
]

/-- Partial product 683 for generator 15. -/
def ep_Q2_024_partial_15_0683 : Poly :=
[
  term ((3092200383287403392096421281566930863544 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (6, 1), (12, 1), (13, 1), (14, 2)],
  term ((-1546100191643701696048210640783465431772 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (12, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 683 for generator 15. -/
theorem ep_Q2_024_partial_15_0683_valid :
    mulPoly ep_Q2_024_coefficient_15_0683
        ep_Q2_024_generator_15_0600_0699 =
      ep_Q2_024_partial_15_0683 := by
  native_decide

/-- Coefficient term 684 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0684 : Poly :=
[
  term ((-46606006548196236713541705654221512448 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (12, 1), (13, 1), (15, 2)]
]

/-- Partial product 684 for generator 15. -/
def ep_Q2_024_partial_15_0684 : Poly :=
[
  term ((-93212013096392473427083411308443024896 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (6, 1), (12, 1), (13, 1), (15, 2)],
  term ((46606006548196236713541705654221512448 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 684 for generator 15. -/
theorem ep_Q2_024_partial_15_0684_valid :
    mulPoly ep_Q2_024_coefficient_15_0684
        ep_Q2_024_generator_15_0600_0699 =
      ep_Q2_024_partial_15_0684 := by
  native_decide

/-- Coefficient term 685 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0685 : Poly :=
[
  term ((15897572065064664599878445851919467651194949204591129449 : Rat) / 743999161705615854803818744669012717973877138597969104) [(1, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 685 for generator 15. -/
def ep_Q2_024_partial_15_0685 : Poly :=
[
  term ((15897572065064664599878445851919467651194949204591129449 : Rat) / 371999580852807927401909372334506358986938569298984552) [(1, 1), (6, 1), (12, 1), (14, 1), (15, 1)],
  term ((-15897572065064664599878445851919467651194949204591129449 : Rat) / 743999161705615854803818744669012717973877138597969104) [(1, 1), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 685 for generator 15. -/
theorem ep_Q2_024_partial_15_0685_valid :
    mulPoly ep_Q2_024_coefficient_15_0685
        ep_Q2_024_generator_15_0600_0699 =
      ep_Q2_024_partial_15_0685 := by
  native_decide

/-- Coefficient term 686 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0686 : Poly :=
[
  term ((58815685077901435 : Rat) / 4651120884612772) [(1, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 686 for generator 15. -/
def ep_Q2_024_partial_15_0686 : Poly :=
[
  term ((58815685077901435 : Rat) / 2325560442306386) [(1, 1), (6, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-58815685077901435 : Rat) / 4651120884612772) [(1, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 686 for generator 15. -/
theorem ep_Q2_024_partial_15_0686_valid :
    mulPoly ep_Q2_024_coefficient_15_0686
        ep_Q2_024_generator_15_0600_0699 =
      ep_Q2_024_partial_15_0686 := by
  native_decide

/-- Coefficient term 687 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0687 : Poly :=
[
  term ((-60437446067990995255396147057578082049591331649840994939 : Rat) / 929998952132019818504773430836265897467346423247461380) [(1, 1), (12, 1), (14, 2), (15, 1)]
]

/-- Partial product 687 for generator 15. -/
def ep_Q2_024_partial_15_0687 : Poly :=
[
  term ((-60437446067990995255396147057578082049591331649840994939 : Rat) / 464999476066009909252386715418132948733673211623730690) [(1, 1), (6, 1), (12, 1), (14, 2), (15, 1)],
  term ((60437446067990995255396147057578082049591331649840994939 : Rat) / 929998952132019818504773430836265897467346423247461380) [(1, 1), (12, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 687 for generator 15. -/
theorem ep_Q2_024_partial_15_0687_valid :
    mulPoly ep_Q2_024_coefficient_15_0687
        ep_Q2_024_generator_15_0600_0699 =
      ep_Q2_024_partial_15_0687 := by
  native_decide

/-- Coefficient term 688 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0688 : Poly :=
[
  term ((11953463295679379 : Rat) / 1162780221153193) [(1, 1), (12, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 688 for generator 15. -/
def ep_Q2_024_partial_15_0688 : Poly :=
[
  term ((23906926591358758 : Rat) / 1162780221153193) [(1, 1), (6, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-11953463295679379 : Rat) / 1162780221153193) [(1, 1), (12, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 688 for generator 15. -/
theorem ep_Q2_024_partial_15_0688_valid :
    mulPoly ep_Q2_024_coefficient_15_0688
        ep_Q2_024_generator_15_0600_0699 =
      ep_Q2_024_partial_15_0688 := by
  native_decide

/-- Coefficient term 689 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0689 : Poly :=
[
  term ((272653081757556452461378405387411777766499381775870374371 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(1, 1), (12, 1), (15, 1)]
]

/-- Partial product 689 for generator 15. -/
def ep_Q2_024_partial_15_0689 : Poly :=
[
  term ((272653081757556452461378405387411777766499381775870374371 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(1, 1), (6, 1), (12, 1), (15, 1)],
  term ((-272653081757556452461378405387411777766499381775870374371 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(1, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 689 for generator 15. -/
theorem ep_Q2_024_partial_15_0689_valid :
    mulPoly ep_Q2_024_coefficient_15_0689
        ep_Q2_024_generator_15_0600_0699 =
      ep_Q2_024_partial_15_0689 := by
  native_decide

/-- Coefficient term 690 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0690 : Poly :=
[
  term ((-8657645677265413 : Rat) / 2325560442306386) [(1, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 690 for generator 15. -/
def ep_Q2_024_partial_15_0690 : Poly :=
[
  term ((-8657645677265413 : Rat) / 1162780221153193) [(1, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((8657645677265413 : Rat) / 2325560442306386) [(1, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 690 for generator 15. -/
theorem ep_Q2_024_partial_15_0690_valid :
    mulPoly ep_Q2_024_coefficient_15_0690
        ep_Q2_024_generator_15_0600_0699 =
      ep_Q2_024_partial_15_0690 := by
  native_decide

/-- Coefficient term 691 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0691 : Poly :=
[
  term ((-4466115409796894554675042235934975650543774254263469936 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (12, 1), (15, 3)]
]

/-- Partial product 691 for generator 15. -/
def ep_Q2_024_partial_15_0691 : Poly :=
[
  term ((-8932230819593789109350084471869951301087548508526939872 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (6, 1), (12, 1), (15, 3)],
  term ((4466115409796894554675042235934975650543774254263469936 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 691 for generator 15. -/
theorem ep_Q2_024_partial_15_0691_valid :
    mulPoly ep_Q2_024_coefficient_15_0691
        ep_Q2_024_generator_15_0600_0699 =
      ep_Q2_024_partial_15_0691 := by
  native_decide

/-- Coefficient term 692 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0692 : Poly :=
[
  term ((898255108859200 : Rat) / 1162780221153193) [(1, 1), (12, 1), (15, 3), (16, 1)]
]

/-- Partial product 692 for generator 15. -/
def ep_Q2_024_partial_15_0692 : Poly :=
[
  term ((1796510217718400 : Rat) / 1162780221153193) [(1, 1), (6, 1), (12, 1), (15, 3), (16, 1)],
  term ((-898255108859200 : Rat) / 1162780221153193) [(1, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 692 for generator 15. -/
theorem ep_Q2_024_partial_15_0692_valid :
    mulPoly ep_Q2_024_coefficient_15_0692
        ep_Q2_024_generator_15_0600_0699 =
      ep_Q2_024_partial_15_0692 := by
  native_decide

/-- Coefficient term 693 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0693 : Poly :=
[
  term ((979987233896591277350368827258301591648 : Rat) / 359912837220743188970008058408861780397) [(1, 1), (12, 2), (13, 1)]
]

/-- Partial product 693 for generator 15. -/
def ep_Q2_024_partial_15_0693 : Poly :=
[
  term ((1959974467793182554700737654516603183296 : Rat) / 359912837220743188970008058408861780397) [(1, 1), (6, 1), (12, 2), (13, 1)],
  term ((-979987233896591277350368827258301591648 : Rat) / 359912837220743188970008058408861780397) [(1, 1), (12, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 693 for generator 15. -/
theorem ep_Q2_024_partial_15_0693_valid :
    mulPoly ep_Q2_024_coefficient_15_0693
        ep_Q2_024_generator_15_0600_0699 =
      ep_Q2_024_partial_15_0693 := by
  native_decide

/-- Coefficient term 694 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0694 : Poly :=
[
  term ((-140669587790123427364018014596054843554 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (12, 2), (13, 1), (14, 1)]
]

/-- Partial product 694 for generator 15. -/
def ep_Q2_024_partial_15_0694 : Poly :=
[
  term ((-281339175580246854728036029192109687108 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (6, 1), (12, 2), (13, 1), (14, 1)],
  term ((140669587790123427364018014596054843554 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (12, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 694 for generator 15. -/
theorem ep_Q2_024_partial_15_0694_valid :
    mulPoly ep_Q2_024_coefficient_15_0694
        ep_Q2_024_generator_15_0600_0699 =
      ep_Q2_024_partial_15_0694 := by
  native_decide

/-- Coefficient term 695 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0695 : Poly :=
[
  term ((103436313310270000545012885157159913515082002681601566193 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(1, 1), (12, 2), (14, 1), (15, 1)]
]

/-- Partial product 695 for generator 15. -/
def ep_Q2_024_partial_15_0695 : Poly :=
[
  term ((103436313310270000545012885157159913515082002681601566193 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(1, 1), (6, 1), (12, 2), (14, 1), (15, 1)],
  term ((-103436313310270000545012885157159913515082002681601566193 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(1, 1), (12, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 695 for generator 15. -/
theorem ep_Q2_024_partial_15_0695_valid :
    mulPoly ep_Q2_024_coefficient_15_0695
        ep_Q2_024_generator_15_0600_0699 =
      ep_Q2_024_partial_15_0695 := by
  native_decide

/-- Coefficient term 696 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0696 : Poly :=
[
  term ((-8898255387244787 : Rat) / 2325560442306386) [(1, 1), (12, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 696 for generator 15. -/
def ep_Q2_024_partial_15_0696 : Poly :=
[
  term ((-8898255387244787 : Rat) / 1162780221153193) [(1, 1), (6, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((8898255387244787 : Rat) / 2325560442306386) [(1, 1), (12, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 696 for generator 15. -/
theorem ep_Q2_024_partial_15_0696_valid :
    mulPoly ep_Q2_024_coefficient_15_0696
        ep_Q2_024_generator_15_0600_0699 =
      ep_Q2_024_partial_15_0696 := by
  native_decide

/-- Coefficient term 697 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0697 : Poly :=
[
  term ((-80960318297580151777359884399033870821391742374526654607 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(1, 1), (12, 2), (15, 1)]
]

/-- Partial product 697 for generator 15. -/
def ep_Q2_024_partial_15_0697 : Poly :=
[
  term ((-80960318297580151777359884399033870821391742374526654607 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(1, 1), (6, 1), (12, 2), (15, 1)],
  term ((80960318297580151777359884399033870821391742374526654607 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(1, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 697 for generator 15. -/
theorem ep_Q2_024_partial_15_0697_valid :
    mulPoly ep_Q2_024_coefficient_15_0697
        ep_Q2_024_generator_15_0600_0699 =
      ep_Q2_024_partial_15_0697 := by
  native_decide

/-- Coefficient term 698 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0698 : Poly :=
[
  term ((145862670348984487 : Rat) / 13953362653838316) [(1, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 698 for generator 15. -/
def ep_Q2_024_partial_15_0698 : Poly :=
[
  term ((145862670348984487 : Rat) / 6976681326919158) [(1, 1), (6, 1), (12, 2), (15, 1), (16, 1)],
  term ((-145862670348984487 : Rat) / 13953362653838316) [(1, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 698 for generator 15. -/
theorem ep_Q2_024_partial_15_0698_valid :
    mulPoly ep_Q2_024_coefficient_15_0698
        ep_Q2_024_generator_15_0600_0699 =
      ep_Q2_024_partial_15_0698 := by
  native_decide

/-- Coefficient term 699 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0699 : Poly :=
[
  term ((-124898830274193142709262456668953249078 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (12, 3), (13, 1)]
]

/-- Partial product 699 for generator 15. -/
def ep_Q2_024_partial_15_0699 : Poly :=
[
  term ((-249797660548386285418524913337906498156 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (6, 1), (12, 3), (13, 1)],
  term ((124898830274193142709262456668953249078 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (12, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 699 for generator 15. -/
theorem ep_Q2_024_partial_15_0699_valid :
    mulPoly ep_Q2_024_coefficient_15_0699
        ep_Q2_024_generator_15_0600_0699 =
      ep_Q2_024_partial_15_0699 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_024_partials_15_0600_0699 : List Poly :=
[
  ep_Q2_024_partial_15_0600,
  ep_Q2_024_partial_15_0601,
  ep_Q2_024_partial_15_0602,
  ep_Q2_024_partial_15_0603,
  ep_Q2_024_partial_15_0604,
  ep_Q2_024_partial_15_0605,
  ep_Q2_024_partial_15_0606,
  ep_Q2_024_partial_15_0607,
  ep_Q2_024_partial_15_0608,
  ep_Q2_024_partial_15_0609,
  ep_Q2_024_partial_15_0610,
  ep_Q2_024_partial_15_0611,
  ep_Q2_024_partial_15_0612,
  ep_Q2_024_partial_15_0613,
  ep_Q2_024_partial_15_0614,
  ep_Q2_024_partial_15_0615,
  ep_Q2_024_partial_15_0616,
  ep_Q2_024_partial_15_0617,
  ep_Q2_024_partial_15_0618,
  ep_Q2_024_partial_15_0619,
  ep_Q2_024_partial_15_0620,
  ep_Q2_024_partial_15_0621,
  ep_Q2_024_partial_15_0622,
  ep_Q2_024_partial_15_0623,
  ep_Q2_024_partial_15_0624,
  ep_Q2_024_partial_15_0625,
  ep_Q2_024_partial_15_0626,
  ep_Q2_024_partial_15_0627,
  ep_Q2_024_partial_15_0628,
  ep_Q2_024_partial_15_0629,
  ep_Q2_024_partial_15_0630,
  ep_Q2_024_partial_15_0631,
  ep_Q2_024_partial_15_0632,
  ep_Q2_024_partial_15_0633,
  ep_Q2_024_partial_15_0634,
  ep_Q2_024_partial_15_0635,
  ep_Q2_024_partial_15_0636,
  ep_Q2_024_partial_15_0637,
  ep_Q2_024_partial_15_0638,
  ep_Q2_024_partial_15_0639,
  ep_Q2_024_partial_15_0640,
  ep_Q2_024_partial_15_0641,
  ep_Q2_024_partial_15_0642,
  ep_Q2_024_partial_15_0643,
  ep_Q2_024_partial_15_0644,
  ep_Q2_024_partial_15_0645,
  ep_Q2_024_partial_15_0646,
  ep_Q2_024_partial_15_0647,
  ep_Q2_024_partial_15_0648,
  ep_Q2_024_partial_15_0649,
  ep_Q2_024_partial_15_0650,
  ep_Q2_024_partial_15_0651,
  ep_Q2_024_partial_15_0652,
  ep_Q2_024_partial_15_0653,
  ep_Q2_024_partial_15_0654,
  ep_Q2_024_partial_15_0655,
  ep_Q2_024_partial_15_0656,
  ep_Q2_024_partial_15_0657,
  ep_Q2_024_partial_15_0658,
  ep_Q2_024_partial_15_0659,
  ep_Q2_024_partial_15_0660,
  ep_Q2_024_partial_15_0661,
  ep_Q2_024_partial_15_0662,
  ep_Q2_024_partial_15_0663,
  ep_Q2_024_partial_15_0664,
  ep_Q2_024_partial_15_0665,
  ep_Q2_024_partial_15_0666,
  ep_Q2_024_partial_15_0667,
  ep_Q2_024_partial_15_0668,
  ep_Q2_024_partial_15_0669,
  ep_Q2_024_partial_15_0670,
  ep_Q2_024_partial_15_0671,
  ep_Q2_024_partial_15_0672,
  ep_Q2_024_partial_15_0673,
  ep_Q2_024_partial_15_0674,
  ep_Q2_024_partial_15_0675,
  ep_Q2_024_partial_15_0676,
  ep_Q2_024_partial_15_0677,
  ep_Q2_024_partial_15_0678,
  ep_Q2_024_partial_15_0679,
  ep_Q2_024_partial_15_0680,
  ep_Q2_024_partial_15_0681,
  ep_Q2_024_partial_15_0682,
  ep_Q2_024_partial_15_0683,
  ep_Q2_024_partial_15_0684,
  ep_Q2_024_partial_15_0685,
  ep_Q2_024_partial_15_0686,
  ep_Q2_024_partial_15_0687,
  ep_Q2_024_partial_15_0688,
  ep_Q2_024_partial_15_0689,
  ep_Q2_024_partial_15_0690,
  ep_Q2_024_partial_15_0691,
  ep_Q2_024_partial_15_0692,
  ep_Q2_024_partial_15_0693,
  ep_Q2_024_partial_15_0694,
  ep_Q2_024_partial_15_0695,
  ep_Q2_024_partial_15_0696,
  ep_Q2_024_partial_15_0697,
  ep_Q2_024_partial_15_0698,
  ep_Q2_024_partial_15_0699
]

/-- Sum of partial products in this block. -/
def ep_Q2_024_block_15_0600_0699 : Poly :=
[
  term ((1399197928754048569331968958738981057912 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (6, 1), (12, 1), (13, 2), (14, 1)],
  term ((-36974437320192447892520292053032505208 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (6, 1), (12, 1), (14, 1)],
  term ((57065163418514028206963760297560614190626285699065528079 : Rat) / 464999476066009909252386715418132948733673211623730690) [(1, 1), (5, 1), (6, 1), (12, 1), (14, 1), (15, 2)],
  term ((-26408829814481614 : Rat) / 1162780221153193) [(1, 1), (5, 1), (6, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((8932230819593789109350084471869951301087548508526939872 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (5, 1), (6, 1), (12, 1), (15, 2)],
  term ((-1796510217718400 : Rat) / 1162780221153193) [(1, 1), (5, 1), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((2145093596645849219495004953877108926626236865692501316507 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(1, 1), (5, 1), (6, 1), (13, 1), (14, 1), (15, 1)],
  term ((49730484048564751 : Rat) / 3488340663459579) [(1, 1), (5, 1), (6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3362414424148325569733089263026150459960540076430602476 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (5, 1), (6, 1), (13, 1), (14, 2), (15, 1)],
  term ((-1667935482081904 : Rat) / 1162780221153193) [(1, 1), (5, 1), (6, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-52974527476311903168524170687310341568 : Rat) / 359912837220743188970008058408861780397) [(1, 1), (5, 1), (6, 1), (13, 2), (14, 1)],
  term ((-8486750246624093521424296941571253888 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (6, 1), (13, 2), (14, 2)],
  term ((11558047600358648771373337920212895859814 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (5, 1), (6, 1), (14, 1)],
  term ((-475418534318063580141443576875141509826674210915175752793 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(1, 1), (5, 1), (6, 1), (14, 1), (15, 2)],
  term ((-23958955931124895 : Rat) / 3488340663459579) [(1, 1), (5, 1), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((-17842303055724083763118711211856783152 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (6, 1), (14, 2)],
  term ((674456529895393409686477352003493571793009190155093372 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (5, 1), (6, 1), (14, 2), (15, 2)],
  term ((1667935482081904 : Rat) / 1162780221153193) [(1, 1), (5, 1), (6, 1), (14, 2), (15, 2), (16, 1)],
  term ((-699598964377024284665984479369490528956 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (12, 1), (13, 2), (14, 1)],
  term ((18487218660096223946260146026516252604 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (12, 1), (14, 1)],
  term ((-57065163418514028206963760297560614190626285699065528079 : Rat) / 929998952132019818504773430836265897467346423247461380) [(1, 1), (5, 1), (12, 1), (14, 1), (15, 2)],
  term ((13204414907240807 : Rat) / 1162780221153193) [(1, 1), (5, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-4466115409796894554675042235934975650543774254263469936 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (5, 1), (12, 1), (15, 2)],
  term ((898255108859200 : Rat) / 1162780221153193) [(1, 1), (5, 1), (12, 1), (15, 2), (16, 1)],
  term ((-2145093596645849219495004953877108926626236865692501316507 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(1, 1), (5, 1), (13, 1), (14, 1), (15, 1)],
  term ((-49730484048564751 : Rat) / 6976681326919158) [(1, 1), (5, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1681207212074162784866544631513075229980270038215301238 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (5, 1), (13, 1), (14, 2), (15, 1)],
  term ((833967741040952 : Rat) / 1162780221153193) [(1, 1), (5, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((26487263738155951584262085343655170784 : Rat) / 359912837220743188970008058408861780397) [(1, 1), (5, 1), (13, 2), (14, 1)],
  term ((4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (13, 2), (14, 2)],
  term ((-5779023800179324385686668960106447929907 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (5, 1), (14, 1)],
  term ((475418534318063580141443576875141509826674210915175752793 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(1, 1), (5, 1), (14, 1), (15, 2)],
  term ((23958955931124895 : Rat) / 6976681326919158) [(1, 1), (5, 1), (14, 1), (15, 2), (16, 1)],
  term ((8921151527862041881559355605928391576 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (14, 2)],
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (5, 1), (14, 2), (15, 2)],
  term ((-833967741040952 : Rat) / 1162780221153193) [(1, 1), (5, 1), (14, 2), (15, 2), (16, 1)],
  term ((-114848712821301833631809313552048362896 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 2), (6, 1), (9, 1), (14, 1)],
  term ((-638029918046677217507090629428056964064 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 2), (6, 1), (13, 1), (14, 1)],
  term ((-1222580880969635542501073852366181296753175174603877796 : Rat) / 46499947606600990925238671541813294873367321162373069) [(1, 1), (5, 2), (6, 1), (14, 1), (15, 1)],
  term ((5137204122490576 : Rat) / 1162780221153193) [(1, 1), (5, 2), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((57424356410650916815904656776024181448 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 2), (9, 1), (14, 1)],
  term ((319014959023338608753545314714028482032 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 2), (13, 1), (14, 1)],
  term ((611290440484817771250536926183090648376587587301938898 : Rat) / 46499947606600990925238671541813294873367321162373069) [(1, 1), (5, 2), (14, 1), (15, 1)],
  term ((-2568602061245288 : Rat) / 1162780221153193) [(1, 1), (5, 2), (14, 1), (15, 1), (16, 1)],
  term ((-259271587441775770073257543406488449392 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (6, 1), (7, 1), (8, 1)],
  term ((259271587441775770073257543406488449392 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (6, 1), (7, 1), (12, 1)],
  term ((-518543174883551540146515086812976898784 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (6, 1), (7, 1), (14, 1)],
  term ((940443925092583380821479652865389349252 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (6, 1), (8, 1), (9, 1)],
  term ((669521251371780758118226667071262684848 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (6, 1), (8, 1), (9, 1), (12, 1)],
  term ((-492765766789374555846749955689188518488 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (6, 1), (8, 1), (9, 1), (14, 1)],
  term ((-2858364389378608838764062023873769248962 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (6, 1), (8, 1), (11, 1)],
  term ((-8713128379449275417812518858045608398912 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (6, 1), (8, 1), (12, 1), (13, 1)],
  term ((344674802912317648611387188666348500252 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (6, 1), (8, 1), (12, 1), (13, 1), (14, 1)],
  term ((-42897185966036484390082822956409864505349421492734777533 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(1, 1), (6, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((277384937357655 : Rat) / 1162780221153193) [(1, 1), (6, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((2790009293275740138936205997796948742986167698945351423 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(1, 1), (6, 1), (8, 1), (12, 1), (15, 1)],
  term ((-131503738079788567 : Rat) / 6976681326919158) [(1, 1), (6, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((249797660548386285418524913337906498156 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (6, 1), (8, 1), (12, 2), (13, 1)],
  term ((-26974210883668912519839817367166225675565343026070909313 : Rat) / 929998952132019818504773430836265897467346423247461380) [(1, 1), (6, 1), (8, 1), (12, 2), (15, 1)],
  term ((5003541596661801 : Rat) / 1162780221153193) [(1, 1), (6, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((-66410998662038004817495670916240829828 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (6, 1), (8, 1), (13, 1)],
  term ((-19463449035335062029892609990214299509488 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (6, 1), (8, 1), (13, 1), (14, 1)],
  term ((-4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (6, 1), (8, 1), (13, 1), (14, 2)],
  term ((93212013096392473427083411308443024896 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (6, 1), (8, 1), (13, 1), (15, 2)],
  term ((86883956888373154677565351407430153815648725261687772569 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(1, 1), (6, 1), (8, 1), (14, 1), (15, 1)],
  term ((-60129224652876851 : Rat) / 6976681326919158) [(1, 1), (6, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (6, 1), (8, 1), (14, 2), (15, 1)],
  term ((-833967741040952 : Rat) / 1162780221153193) [(1, 1), (6, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((-63235000842975854703597614395624623353546682444744162259 : Rat) / 929998952132019818504773430836265897467346423247461380) [(1, 1), (6, 1), (8, 1), (15, 1)],
  term ((4842600466899879 : Rat) / 1162780221153193) [(1, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((8932230819593789109350084471869951301087548508526939872 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (6, 1), (8, 1), (15, 3)],
  term ((-1796510217718400 : Rat) / 1162780221153193) [(1, 1), (6, 1), (8, 1), (15, 3), (16, 1)],
  term ((-940443925092583380821479652865389349252 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (6, 1), (9, 1), (12, 1)],
  term ((-13141937458270041393534229868282082079016 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (6, 1), (9, 1), (12, 1), (14, 1)],
  term ((-669521251371780758118226667071262684848 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (6, 1), (9, 1), (12, 2)],
  term ((4898040419692806749424149347787096834615465390033086364 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (6, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((-2990296899089872 : Rat) / 1162780221153193) [(1, 1), (6, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-313099205974796891704814566834029023616 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (6, 1), (9, 1), (13, 2), (14, 1)],
  term ((3006401448391664287462453119469651930492 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (6, 1), (9, 1), (14, 1)],
  term ((965301222877480932388812420359861183184 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (6, 1), (9, 1), (14, 2)],
  term ((-252450128745879785325220575726801684224 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (6, 1), (9, 2), (13, 1), (14, 1)],
  term ((2858364389378608838764062023873769248962 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (6, 1), (11, 1), (12, 1)],
  term ((-5716728778757217677528124047747538497924 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (6, 1), (11, 1), (14, 1)],
  term ((66410998662038004817495670916240829828 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (6, 1), (12, 1), (13, 1)],
  term ((-427445643317880882533556002476726157572 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (6, 1), (12, 1), (13, 1), (14, 1)],
  term ((3092200383287403392096421281566930863544 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (6, 1), (12, 1), (13, 1), (14, 2)],
  term ((-93212013096392473427083411308443024896 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (6, 1), (12, 1), (13, 1), (15, 2)],
  term ((49041629254984780619008292259765390097170865994083575091 : Rat) / 1115998742558423782205728117003519076960815707896953656) [(1, 1), (6, 1), (12, 1), (14, 1), (15, 1)],
  term ((59649652818942387 : Rat) / 2325560442306386) [(1, 1), (6, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-60437446067990995255396147057578082049591331649840994939 : Rat) / 464999476066009909252386715418132948733673211623730690) [(1, 1), (6, 1), (12, 1), (14, 2), (15, 1)],
  term ((23906926591358758 : Rat) / 1162780221153193) [(1, 1), (6, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((63235000842975854703597614395624623353546682444744162259 : Rat) / 929998952132019818504773430836265897467346423247461380) [(1, 1), (6, 1), (12, 1), (15, 1)],
  term ((-4842600466899879 : Rat) / 1162780221153193) [(1, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-8932230819593789109350084471869951301087548508526939872 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (6, 1), (12, 1), (15, 3)],
  term ((1796510217718400 : Rat) / 1162780221153193) [(1, 1), (6, 1), (12, 1), (15, 3), (16, 1)],
  term ((8713128379449275417812518858045608398912 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (6, 1), (12, 2), (13, 1)],
  term ((-281339175580246854728036029192109687108 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (6, 1), (12, 2), (13, 1), (14, 1)],
  term ((103436313310270000545012885157159913515082002681601566193 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(1, 1), (6, 1), (12, 2), (14, 1), (15, 1)],
  term ((-8898255387244787 : Rat) / 1162780221153193) [(1, 1), (6, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-2790009293275740138936205997796948742986167698945351423 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(1, 1), (6, 1), (12, 2), (15, 1)],
  term ((131503738079788567 : Rat) / 6976681326919158) [(1, 1), (6, 1), (12, 2), (15, 1), (16, 1)],
  term ((-249797660548386285418524913337906498156 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (6, 1), (12, 3), (13, 1)],
  term ((-370315927423382885391950958321325355729 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (6, 1), (13, 1)],
  term ((-2233057704898447277337521117967487825271887127131734968 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (6, 1), (13, 1), (15, 2)],
  term ((449127554429600 : Rat) / 1162780221153193) [(1, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((-23303003274098118356770852827110756224 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (6, 1), (13, 2), (15, 1)],
  term ((14930111000563771909392666589219249207504651660907005579 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (6, 1), (15, 1)],
  term ((-2314053073690208 : Rat) / 1162780221153193) [(1, 1), (6, 1), (15, 1), (16, 1)],
  term ((433945256163848213003791909370480325138 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (6, 2), (9, 1)],
  term ((-59650057575209561137067290883327108616 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (6, 2), (9, 1), (12, 1)],
  term ((-2858364389378608838764062023873769248962 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (6, 2), (11, 1)],
  term ((-1957426378965317623205350632321657823568 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (6, 2), (12, 1), (13, 1)],
  term ((-4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (6, 2), (12, 1), (13, 1), (14, 1)],
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (6, 2), (12, 1), (14, 1), (15, 1)],
  term ((-833967741040952 : Rat) / 1162780221153193) [(1, 1), (6, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((41474039614314444175292781100268953852929667220818943797 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (6, 2), (12, 1), (15, 1)],
  term ((-7630090420731068 : Rat) / 1162780221153193) [(1, 1), (6, 2), (12, 1), (15, 1), (16, 1)],
  term ((724495973011091570460779609691605011712 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (6, 2), (12, 2), (13, 1)],
  term ((-6514192417025367636535306533436410173200464556298441932 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (6, 2), (12, 2), (15, 1)],
  term ((4786310756398640 : Rat) / 1162780221153193) [(1, 1), (6, 2), (12, 2), (15, 1), (16, 1)],
  term ((740631854846765770783901916642650711458 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (6, 2), (13, 1)],
  term ((4466115409796894554675042235934975650543774254263469936 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (6, 2), (13, 1), (15, 2)],
  term ((-898255108859200 : Rat) / 1162780221153193) [(1, 1), (6, 2), (13, 1), (15, 2), (16, 1)],
  term ((46606006548196236713541705654221512448 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (6, 2), (13, 2), (15, 1)],
  term ((-29860222001127543818785333178438498415009303321814011158 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (6, 2), (15, 1)],
  term ((4628106147380416 : Rat) / 1162780221153193) [(1, 1), (6, 2), (15, 1), (16, 1)],
  term ((129635793720887885036628771703244224696 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (7, 1), (8, 1)],
  term ((-129635793720887885036628771703244224696 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (7, 1), (12, 1)],
  term ((259271587441775770073257543406488449392 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (7, 1), (14, 1)],
  term ((-470221962546291690410739826432694674626 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (8, 1), (9, 1)],
  term ((-334760625685890379059113333535631342424 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (8, 1), (9, 1), (12, 1)],
  term ((246382883394687277923374977844594259244 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (8, 1), (9, 1), (14, 1)],
  term ((1429182194689304419382031011936884624481 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (8, 1), (11, 1)],
  term ((4356564189724637708906259429022804199456 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (8, 1), (12, 1), (13, 1)],
  term ((-172337401456158824305693594333174250126 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (8, 1), (12, 1), (13, 1), (14, 1)],
  term ((42897185966036484390082822956409864505349421492734777533 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(1, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((-277384937357655 : Rat) / 2325560442306386) [(1, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2790009293275740138936205997796948742986167698945351423 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(1, 1), (8, 1), (12, 1), (15, 1)],
  term ((131503738079788567 : Rat) / 13953362653838316) [(1, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-124898830274193142709262456668953249078 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (8, 1), (12, 2), (13, 1)],
  term ((26974210883668912519839817367166225675565343026070909313 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(1, 1), (8, 1), (12, 2), (15, 1)],
  term ((-5003541596661801 : Rat) / 2325560442306386) [(1, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((33205499331019002408747835458120414914 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (8, 1), (13, 1)],
  term ((9731724517667531014946304995107149754744 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (8, 1), (13, 1), (14, 1)],
  term ((2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (8, 1), (13, 1), (14, 2)],
  term ((-46606006548196236713541705654221512448 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (8, 1), (13, 1), (15, 2)],
  term ((-86883956888373154677565351407430153815648725261687772569 : Rat) / 3719995808528079274019093723345063589869385692989845520) [(1, 1), (8, 1), (14, 1), (15, 1)],
  term ((60129224652876851 : Rat) / 13953362653838316) [(1, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (8, 1), (14, 2), (15, 1)],
  term ((416983870520476 : Rat) / 1162780221153193) [(1, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((63235000842975854703597614395624623353546682444744162259 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(1, 1), (8, 1), (15, 1)],
  term ((-4842600466899879 : Rat) / 2325560442306386) [(1, 1), (8, 1), (15, 1), (16, 1)],
  term ((-4466115409796894554675042235934975650543774254263469936 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (8, 1), (15, 3)],
  term ((898255108859200 : Rat) / 1162780221153193) [(1, 1), (8, 1), (15, 3), (16, 1)],
  term ((-216972628081924106501895954685240162569 : Rat) / 399903152467492432188897842676513089330) [(1, 1), (9, 1)],
  term ((97026895388018816139001329830705290356 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (9, 1), (12, 1)],
  term ((6570968729135020696767114934141041039508 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (9, 1), (12, 1), (14, 1)],
  term ((334760625685890379059113333535631342424 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (9, 1), (12, 2)],
  term ((-2449020209846403374712074673893548417307732695016543182 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((1495148449544936 : Rat) / 1162780221153193) [(1, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((156549602987398445852407283417014511808 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (9, 1), (13, 2), (14, 1)],
  term ((-1503200724195832143731226559734825965246 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (9, 1), (14, 1)],
  term ((-482650611438740466194406210179930591592 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (9, 1), (14, 2)],
  term ((126225064372939892662610287863400842112 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (9, 2), (13, 1), (14, 1)],
  term ((1429182194689304419382031011936884624481 : Rat) / 3599128372207431889700080584088617803970) [(1, 1), (11, 1)],
  term ((-1429182194689304419382031011936884624481 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (11, 1), (12, 1)],
  term ((2858364389378608838764062023873769248962 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (11, 1), (14, 1)],
  term ((152050365136770134464196607540764680326 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (12, 1), (13, 1)],
  term ((3206903168664934630691848055693142588526 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (12, 1), (13, 1), (14, 1)],
  term ((-1546100191643701696048210640783465431772 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (12, 1), (13, 1), (14, 2)],
  term ((46606006548196236713541705654221512448 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (12, 1), (13, 1), (15, 2)],
  term ((-15897572065064664599878445851919467651194949204591129449 : Rat) / 743999161705615854803818744669012717973877138597969104) [(1, 1), (12, 1), (14, 1), (15, 1)],
  term ((-58815685077901435 : Rat) / 4651120884612772) [(1, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((60437446067990995255396147057578082049591331649840994939 : Rat) / 929998952132019818504773430836265897467346423247461380) [(1, 1), (12, 1), (14, 2), (15, 1)],
  term ((-11953463295679379 : Rat) / 1162780221153193) [(1, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-272653081757556452461378405387411777766499381775870374371 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(1, 1), (12, 1), (15, 1)],
  term ((8657645677265413 : Rat) / 2325560442306386) [(1, 1), (12, 1), (15, 1), (16, 1)],
  term ((4466115409796894554675042235934975650543774254263469936 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (12, 1), (15, 3)],
  term ((-898255108859200 : Rat) / 1162780221153193) [(1, 1), (12, 1), (15, 3), (16, 1)],
  term ((-979987233896591277350368827258301591648 : Rat) / 359912837220743188970008058408861780397) [(1, 1), (12, 2), (13, 1)],
  term ((140669587790123427364018014596054843554 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (12, 2), (13, 1), (14, 1)],
  term ((-103436313310270000545012885157159913515082002681601566193 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(1, 1), (12, 2), (14, 1), (15, 1)],
  term ((8898255387244787 : Rat) / 2325560442306386) [(1, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((80960318297580151777359884399033870821391742374526654607 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(1, 1), (12, 2), (15, 1)],
  term ((-145862670348984487 : Rat) / 13953362653838316) [(1, 1), (12, 2), (15, 1), (16, 1)],
  term ((124898830274193142709262456668953249078 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (12, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 15, terms 600 through 699. -/
theorem ep_Q2_024_block_15_0600_0699_valid :
    checkProductSumEq ep_Q2_024_partials_15_0600_0699
      ep_Q2_024_block_15_0600_0699 = true := by
  native_decide

end EpQ2024TermShards

end Patterns

end EndpointCertificate

end Problem97
