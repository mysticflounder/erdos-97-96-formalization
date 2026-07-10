/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_024, term block 15:1600-1699

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_024`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2024TermShards

/-- Generator polynomial 15 for endpoint certificate `ep_Q2_024`. -/
def ep_Q2_024_generator_15_1600_1699 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(6, 1)]
]

/-- Coefficient term 1600 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1600 : Poly :=
[
  term ((2578326853107933456558538464757287301318301626202703904507 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(5, 1), (8, 1), (13, 1), (15, 2)]
]

/-- Partial product 1600 for generator 15. -/
def ep_Q2_024_partial_15_1600 : Poly :=
[
  term ((2578326853107933456558538464757287301318301626202703904507 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(5, 1), (6, 1), (8, 1), (13, 1), (15, 2)],
  term ((-2578326853107933456558538464757287301318301626202703904507 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(5, 1), (8, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1600 for generator 15. -/
theorem ep_Q2_024_partial_15_1600_valid :
    mulPoly ep_Q2_024_coefficient_15_1600
        ep_Q2_024_generator_15_1600_1699 =
      ep_Q2_024_partial_15_1600 := by
  native_decide

/-- Coefficient term 1601 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1601 : Poly :=
[
  term ((50068166157171823 : Rat) / 6976681326919158) [(5, 1), (8, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 1601 for generator 15. -/
def ep_Q2_024_partial_15_1601 : Poly :=
[
  term ((50068166157171823 : Rat) / 3488340663459579) [(5, 1), (6, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((-50068166157171823 : Rat) / 6976681326919158) [(5, 1), (8, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1601 for generator 15. -/
theorem ep_Q2_024_partial_15_1601_valid :
    mulPoly ep_Q2_024_coefficient_15_1601
        ep_Q2_024_generator_15_1600_1699 =
      ep_Q2_024_partial_15_1601 := by
  native_decide

/-- Coefficient term 1602 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1602 : Poly :=
[
  term ((-4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (8, 1), (13, 2), (14, 1), (15, 1)]
]

/-- Partial product 1602 for generator 15. -/
def ep_Q2_024_partial_15_1602 : Poly :=
[
  term ((-8486750246624093521424296941571253888 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (6, 1), (8, 1), (13, 2), (14, 1), (15, 1)],
  term ((4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (8, 1), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1602 for generator 15. -/
theorem ep_Q2_024_partial_15_1602_valid :
    mulPoly ep_Q2_024_coefficient_15_1602
        ep_Q2_024_generator_15_1600_1699 =
      ep_Q2_024_partial_15_1602 := by
  native_decide

/-- Coefficient term 1603 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1603 : Poly :=
[
  term ((-147847046676439604201330883678806456320 : Rat) / 359912837220743188970008058408861780397) [(5, 1), (8, 1), (13, 2), (15, 1)]
]

/-- Partial product 1603 for generator 15. -/
def ep_Q2_024_partial_15_1603 : Poly :=
[
  term ((-295694093352879208402661767357612912640 : Rat) / 359912837220743188970008058408861780397) [(5, 1), (6, 1), (8, 1), (13, 2), (15, 1)],
  term ((147847046676439604201330883678806456320 : Rat) / 359912837220743188970008058408861780397) [(5, 1), (8, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1603 for generator 15. -/
theorem ep_Q2_024_partial_15_1603_valid :
    mulPoly ep_Q2_024_coefficient_15_1603
        ep_Q2_024_generator_15_1600_1699 =
      ep_Q2_024_partial_15_1603 := by
  native_decide

/-- Coefficient term 1604 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1604 : Poly :=
[
  term ((16040369868892513686379320850481196705661356383014948997 : Rat) / 464999476066009909252386715418132948733673211623730690) [(5, 1), (8, 1), (14, 1), (15, 1)]
]

/-- Partial product 1604 for generator 15. -/
def ep_Q2_024_partial_15_1604 : Poly :=
[
  term ((16040369868892513686379320850481196705661356383014948997 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 1), (6, 1), (8, 1), (14, 1), (15, 1)],
  term ((-16040369868892513686379320850481196705661356383014948997 : Rat) / 464999476066009909252386715418132948733673211623730690) [(5, 1), (8, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1604 for generator 15. -/
theorem ep_Q2_024_partial_15_1604_valid :
    mulPoly ep_Q2_024_coefficient_15_1604
        ep_Q2_024_generator_15_1600_1699 =
      ep_Q2_024_partial_15_1604 := by
  native_decide

/-- Coefficient term 1605 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1605 : Poly :=
[
  term ((-3458956381253066 : Rat) / 1162780221153193) [(5, 1), (8, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1605 for generator 15. -/
def ep_Q2_024_partial_15_1605 : Poly :=
[
  term ((-6917912762506132 : Rat) / 1162780221153193) [(5, 1), (6, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((3458956381253066 : Rat) / 1162780221153193) [(5, 1), (8, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1605 for generator 15. -/
theorem ep_Q2_024_partial_15_1605_valid :
    mulPoly ep_Q2_024_coefficient_15_1605
        ep_Q2_024_generator_15_1600_1699 =
      ep_Q2_024_partial_15_1605 := by
  native_decide

/-- Coefficient term 1606 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1606 : Poly :=
[
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 1), (8, 1), (14, 1), (15, 3)]
]

/-- Partial product 1606 for generator 15. -/
def ep_Q2_024_partial_15_1606 : Poly :=
[
  term ((674456529895393409686477352003493571793009190155093372 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 1), (6, 1), (8, 1), (14, 1), (15, 3)],
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 1), (8, 1), (14, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1606 for generator 15. -/
theorem ep_Q2_024_partial_15_1606_valid :
    mulPoly ep_Q2_024_coefficient_15_1606
        ep_Q2_024_generator_15_1600_1699 =
      ep_Q2_024_partial_15_1606 := by
  native_decide

/-- Coefficient term 1607 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1607 : Poly :=
[
  term ((833967741040952 : Rat) / 1162780221153193) [(5, 1), (8, 1), (14, 1), (15, 3), (16, 1)]
]

/-- Partial product 1607 for generator 15. -/
def ep_Q2_024_partial_15_1607 : Poly :=
[
  term ((1667935482081904 : Rat) / 1162780221153193) [(5, 1), (6, 1), (8, 1), (14, 1), (15, 3), (16, 1)],
  term ((-833967741040952 : Rat) / 1162780221153193) [(5, 1), (8, 1), (14, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1607 for generator 15. -/
theorem ep_Q2_024_partial_15_1607_valid :
    mulPoly ep_Q2_024_coefficient_15_1607
        ep_Q2_024_generator_15_1600_1699 =
      ep_Q2_024_partial_15_1607 := by
  native_decide

/-- Coefficient term 1608 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1608 : Poly :=
[
  term ((-28934963968114437263102135432304914667114125587340866313 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(5, 1), (8, 1), (15, 1)]
]

/-- Partial product 1608 for generator 15. -/
def ep_Q2_024_partial_15_1608 : Poly :=
[
  term ((-28934963968114437263102135432304914667114125587340866313 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(5, 1), (6, 1), (8, 1), (15, 1)],
  term ((28934963968114437263102135432304914667114125587340866313 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(5, 1), (8, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1608 for generator 15. -/
theorem ep_Q2_024_partial_15_1608_valid :
    mulPoly ep_Q2_024_coefficient_15_1608
        ep_Q2_024_generator_15_1600_1699 =
      ep_Q2_024_partial_15_1608 := by
  native_decide

/-- Coefficient term 1609 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1609 : Poly :=
[
  term ((-45154106597723 : Rat) / 1162780221153193) [(5, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 1609 for generator 15. -/
def ep_Q2_024_partial_15_1609 : Poly :=
[
  term ((-90308213195446 : Rat) / 1162780221153193) [(5, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((45154106597723 : Rat) / 1162780221153193) [(5, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1609 for generator 15. -/
theorem ep_Q2_024_partial_15_1609_valid :
    mulPoly ep_Q2_024_coefficient_15_1609
        ep_Q2_024_generator_15_1600_1699 =
      ep_Q2_024_partial_15_1609 := by
  native_decide

/-- Coefficient term 1610 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1610 : Poly :=
[
  term ((-596292272370210102731177090662239802901212841340772628921 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(5, 1), (8, 1), (15, 3)]
]

/-- Partial product 1610 for generator 15. -/
def ep_Q2_024_partial_15_1610 : Poly :=
[
  term ((-596292272370210102731177090662239802901212841340772628921 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(5, 1), (6, 1), (8, 1), (15, 3)],
  term ((596292272370210102731177090662239802901212841340772628921 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(5, 1), (8, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1610 for generator 15. -/
theorem ep_Q2_024_partial_15_1610_valid :
    mulPoly ep_Q2_024_coefficient_15_1610
        ep_Q2_024_generator_15_1600_1699 =
      ep_Q2_024_partial_15_1610 := by
  native_decide

/-- Coefficient term 1611 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1611 : Poly :=
[
  term ((-11177629529470399 : Rat) / 6976681326919158) [(5, 1), (8, 1), (15, 3), (16, 1)]
]

/-- Partial product 1611 for generator 15. -/
def ep_Q2_024_partial_15_1611 : Poly :=
[
  term ((-11177629529470399 : Rat) / 3488340663459579) [(5, 1), (6, 1), (8, 1), (15, 3), (16, 1)],
  term ((11177629529470399 : Rat) / 6976681326919158) [(5, 1), (8, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1611 for generator 15. -/
theorem ep_Q2_024_partial_15_1611_valid :
    mulPoly ep_Q2_024_coefficient_15_1611
        ep_Q2_024_generator_15_1600_1699 =
      ep_Q2_024_partial_15_1611 := by
  native_decide

/-- Coefficient term 1612 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1612 : Poly :=
[
  term ((118411732696218413314356683941480932632 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (9, 1)]
]

/-- Partial product 1612 for generator 15. -/
def ep_Q2_024_partial_15_1612 : Poly :=
[
  term ((236823465392436826628713367882961865264 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (6, 1), (9, 1)],
  term ((-118411732696218413314356683941480932632 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1612 for generator 15. -/
theorem ep_Q2_024_partial_15_1612_valid :
    mulPoly ep_Q2_024_coefficient_15_1612
        ep_Q2_024_generator_15_1600_1699 =
      ep_Q2_024_partial_15_1612 := by
  native_decide

/-- Coefficient term 1613 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1613 : Poly :=
[
  term ((-5285982928509702068477233452422236239436 : Rat) / 1799564186103715944850040292044308901985) [(5, 1), (9, 1), (12, 1)]
]

/-- Partial product 1613 for generator 15. -/
def ep_Q2_024_partial_15_1613 : Poly :=
[
  term ((-10571965857019404136954466904844472478872 : Rat) / 1799564186103715944850040292044308901985) [(5, 1), (6, 1), (9, 1), (12, 1)],
  term ((5285982928509702068477233452422236239436 : Rat) / 1799564186103715944850040292044308901985) [(5, 1), (9, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1613 for generator 15. -/
theorem ep_Q2_024_partial_15_1613_valid :
    mulPoly ep_Q2_024_coefficient_15_1613
        ep_Q2_024_generator_15_1600_1699 =
      ep_Q2_024_partial_15_1613 := by
  native_decide

/-- Coefficient term 1614 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1614 : Poly :=
[
  term ((16527737784929168061123148869963794329901925980398052713 : Rat) / 557999371279211891102864058501759538480407853948476828) [(5, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 1614 for generator 15. -/
def ep_Q2_024_partial_15_1614 : Poly :=
[
  term ((16527737784929168061123148869963794329901925980398052713 : Rat) / 278999685639605945551432029250879769240203926974238414) [(5, 1), (6, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-16527737784929168061123148869963794329901925980398052713 : Rat) / 557999371279211891102864058501759538480407853948476828) [(5, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1614 for generator 15. -/
theorem ep_Q2_024_partial_15_1614_valid :
    mulPoly ep_Q2_024_coefficient_15_1614
        ep_Q2_024_generator_15_1600_1699 =
      ep_Q2_024_partial_15_1614 := by
  native_decide

/-- Coefficient term 1615 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1615 : Poly :=
[
  term ((-4569079916135479 : Rat) / 1162780221153193) [(5, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1615 for generator 15. -/
def ep_Q2_024_partial_15_1615 : Poly :=
[
  term ((-9138159832270958 : Rat) / 1162780221153193) [(5, 1), (6, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((4569079916135479 : Rat) / 1162780221153193) [(5, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1615 for generator 15. -/
theorem ep_Q2_024_partial_15_1615_valid :
    mulPoly ep_Q2_024_coefficient_15_1615
        ep_Q2_024_generator_15_1600_1699 =
      ep_Q2_024_partial_15_1615 := by
  native_decide

/-- Coefficient term 1616 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1616 : Poly :=
[
  term ((-699598964377024284665984479369490528956 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (9, 1), (12, 1), (13, 2), (14, 1)]
]

/-- Partial product 1616 for generator 15. -/
def ep_Q2_024_partial_15_1616 : Poly :=
[
  term ((-1399197928754048569331968958738981057912 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (6, 1), (9, 1), (12, 1), (13, 2), (14, 1)],
  term ((699598964377024284665984479369490528956 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (9, 1), (12, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1616 for generator 15. -/
theorem ep_Q2_024_partial_15_1616_valid :
    mulPoly ep_Q2_024_coefficient_15_1616
        ep_Q2_024_generator_15_1600_1699 =
      ep_Q2_024_partial_15_1616 := by
  native_decide

/-- Coefficient term 1617 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1617 : Poly :=
[
  term ((61082206852097659943521512323032168564 : Rat) / 39990315246749243218889784267651308933) [(5, 1), (9, 1), (12, 1), (14, 1)]
]

/-- Partial product 1617 for generator 15. -/
def ep_Q2_024_partial_15_1617 : Poly :=
[
  term ((122164413704195319887043024646064337128 : Rat) / 39990315246749243218889784267651308933) [(5, 1), (6, 1), (9, 1), (12, 1), (14, 1)],
  term ((-61082206852097659943521512323032168564 : Rat) / 39990315246749243218889784267651308933) [(5, 1), (9, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1617 for generator 15. -/
theorem ep_Q2_024_partial_15_1617_valid :
    mulPoly ep_Q2_024_coefficient_15_1617
        ep_Q2_024_generator_15_1600_1699 =
      ep_Q2_024_partial_15_1617 := by
  native_decide

/-- Coefficient term 1618 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1618 : Poly :=
[
  term ((-57065163418514028206963760297560614190626285699065528079 : Rat) / 929998952132019818504773430836265897467346423247461380) [(5, 1), (9, 1), (12, 1), (14, 1), (15, 2)]
]

/-- Partial product 1618 for generator 15. -/
def ep_Q2_024_partial_15_1618 : Poly :=
[
  term ((-57065163418514028206963760297560614190626285699065528079 : Rat) / 464999476066009909252386715418132948733673211623730690) [(5, 1), (6, 1), (9, 1), (12, 1), (14, 1), (15, 2)],
  term ((57065163418514028206963760297560614190626285699065528079 : Rat) / 929998952132019818504773430836265897467346423247461380) [(5, 1), (9, 1), (12, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1618 for generator 15. -/
theorem ep_Q2_024_partial_15_1618_valid :
    mulPoly ep_Q2_024_coefficient_15_1618
        ep_Q2_024_generator_15_1600_1699 =
      ep_Q2_024_partial_15_1618 := by
  native_decide

/-- Coefficient term 1619 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1619 : Poly :=
[
  term ((13204414907240807 : Rat) / 1162780221153193) [(5, 1), (9, 1), (12, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1619 for generator 15. -/
def ep_Q2_024_partial_15_1619 : Poly :=
[
  term ((26408829814481614 : Rat) / 1162780221153193) [(5, 1), (6, 1), (9, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-13204414907240807 : Rat) / 1162780221153193) [(5, 1), (9, 1), (12, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1619 for generator 15. -/
theorem ep_Q2_024_partial_15_1619_valid :
    mulPoly ep_Q2_024_coefficient_15_1619
        ep_Q2_024_generator_15_1600_1699 =
      ep_Q2_024_partial_15_1619 := by
  native_decide

/-- Coefficient term 1620 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1620 : Poly :=
[
  term ((-20736469053658809228398245651487612136 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (9, 1), (12, 2)]
]

/-- Partial product 1620 for generator 15. -/
def ep_Q2_024_partial_15_1620 : Poly :=
[
  term ((-41472938107317618456796491302975224272 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (6, 1), (9, 1), (12, 2)],
  term ((20736469053658809228398245651487612136 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (9, 1), (12, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1620 for generator 15. -/
theorem ep_Q2_024_partial_15_1620_valid :
    mulPoly ep_Q2_024_coefficient_15_1620
        ep_Q2_024_generator_15_1600_1699 =
      ep_Q2_024_partial_15_1620 := by
  native_decide

/-- Coefficient term 1621 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1621 : Poly :=
[
  term ((-2578326853107933456558538464757287301318301626202703904507 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(5, 1), (9, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 1621 for generator 15. -/
def ep_Q2_024_partial_15_1621 : Poly :=
[
  term ((-2578326853107933456558538464757287301318301626202703904507 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(5, 1), (6, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((2578326853107933456558538464757287301318301626202703904507 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(5, 1), (9, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1621 for generator 15. -/
theorem ep_Q2_024_partial_15_1621_valid :
    mulPoly ep_Q2_024_coefficient_15_1621
        ep_Q2_024_generator_15_1600_1699 =
      ep_Q2_024_partial_15_1621 := by
  native_decide

/-- Coefficient term 1622 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1622 : Poly :=
[
  term ((-50068166157171823 : Rat) / 6976681326919158) [(5, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1622 for generator 15. -/
def ep_Q2_024_partial_15_1622 : Poly :=
[
  term ((-50068166157171823 : Rat) / 3488340663459579) [(5, 1), (6, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((50068166157171823 : Rat) / 6976681326919158) [(5, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1622 for generator 15. -/
theorem ep_Q2_024_partial_15_1622_valid :
    mulPoly ep_Q2_024_coefficient_15_1622
        ep_Q2_024_generator_15_1600_1699 =
      ep_Q2_024_partial_15_1622 := by
  native_decide

/-- Coefficient term 1623 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1623 : Poly :=
[
  term ((1681207212074162784866544631513075229980270038215301238 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (9, 1), (13, 1), (14, 2), (15, 1)]
]

/-- Partial product 1623 for generator 15. -/
def ep_Q2_024_partial_15_1623 : Poly :=
[
  term ((3362414424148325569733089263026150459960540076430602476 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (6, 1), (9, 1), (13, 1), (14, 2), (15, 1)],
  term ((-1681207212074162784866544631513075229980270038215301238 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (9, 1), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1623 for generator 15. -/
theorem ep_Q2_024_partial_15_1623_valid :
    mulPoly ep_Q2_024_coefficient_15_1623
        ep_Q2_024_generator_15_1600_1699 =
      ep_Q2_024_partial_15_1623 := by
  native_decide

/-- Coefficient term 1624 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1624 : Poly :=
[
  term ((833967741040952 : Rat) / 1162780221153193) [(5, 1), (9, 1), (13, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 1624 for generator 15. -/
def ep_Q2_024_partial_15_1624 : Poly :=
[
  term ((1667935482081904 : Rat) / 1162780221153193) [(5, 1), (6, 1), (9, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-833967741040952 : Rat) / 1162780221153193) [(5, 1), (9, 1), (13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1624 for generator 15. -/
theorem ep_Q2_024_partial_15_1624_valid :
    mulPoly ep_Q2_024_coefficient_15_1624
        ep_Q2_024_generator_15_1600_1699 =
      ep_Q2_024_partial_15_1624 := by
  native_decide

/-- Coefficient term 1625 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1625 : Poly :=
[
  term ((131097176046844988326031440704070359016 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (9, 1), (13, 1), (15, 1)]
]

/-- Partial product 1625 for generator 15. -/
def ep_Q2_024_partial_15_1625 : Poly :=
[
  term ((262194352093689976652062881408140718032 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (6, 1), (9, 1), (13, 1), (15, 1)],
  term ((-131097176046844988326031440704070359016 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (9, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1625 for generator 15. -/
theorem ep_Q2_024_partial_15_1625_valid :
    mulPoly ep_Q2_024_coefficient_15_1625
        ep_Q2_024_generator_15_1600_1699 =
      ep_Q2_024_partial_15_1625 := by
  native_decide

/-- Coefficient term 1626 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1626 : Poly :=
[
  term ((147847046676439604201330883678806456320 : Rat) / 359912837220743188970008058408861780397) [(5, 1), (9, 1), (13, 2), (14, 1)]
]

/-- Partial product 1626 for generator 15. -/
def ep_Q2_024_partial_15_1626 : Poly :=
[
  term ((295694093352879208402661767357612912640 : Rat) / 359912837220743188970008058408861780397) [(5, 1), (6, 1), (9, 1), (13, 2), (14, 1)],
  term ((-147847046676439604201330883678806456320 : Rat) / 359912837220743188970008058408861780397) [(5, 1), (9, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1626 for generator 15. -/
theorem ep_Q2_024_partial_15_1626_valid :
    mulPoly ep_Q2_024_coefficient_15_1626
        ep_Q2_024_generator_15_1600_1699 =
      ep_Q2_024_partial_15_1626 := by
  native_decide

/-- Coefficient term 1627 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1627 : Poly :=
[
  term ((4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (9, 1), (13, 2), (14, 2)]
]

/-- Partial product 1627 for generator 15. -/
def ep_Q2_024_partial_15_1627 : Poly :=
[
  term ((8486750246624093521424296941571253888 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (6, 1), (9, 1), (13, 2), (14, 2)],
  term ((-4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (9, 1), (13, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1627 for generator 15. -/
theorem ep_Q2_024_partial_15_1627_valid :
    mulPoly ep_Q2_024_coefficient_15_1627
        ep_Q2_024_generator_15_1600_1699 =
      ep_Q2_024_partial_15_1627 := by
  native_decide

/-- Coefficient term 1628 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1628 : Poly :=
[
  term ((-4657370217243730976159813239754180604901 : Rat) / 1799564186103715944850040292044308901985) [(5, 1), (9, 1), (14, 1)]
]

/-- Partial product 1628 for generator 15. -/
def ep_Q2_024_partial_15_1628 : Poly :=
[
  term ((-9314740434487461952319626479508361209802 : Rat) / 1799564186103715944850040292044308901985) [(5, 1), (6, 1), (9, 1), (14, 1)],
  term ((4657370217243730976159813239754180604901 : Rat) / 1799564186103715944850040292044308901985) [(5, 1), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1628 for generator 15. -/
theorem ep_Q2_024_partial_15_1628_valid :
    mulPoly ep_Q2_024_coefficient_15_1628
        ep_Q2_024_generator_15_1600_1699 =
      ep_Q2_024_partial_15_1628 := by
  native_decide

/-- Coefficient term 1629 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1629 : Poly :=
[
  term ((596292272370210102731177090662239802901212841340772628921 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(5, 1), (9, 1), (14, 1), (15, 2)]
]

/-- Partial product 1629 for generator 15. -/
def ep_Q2_024_partial_15_1629 : Poly :=
[
  term ((596292272370210102731177090662239802901212841340772628921 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(5, 1), (6, 1), (9, 1), (14, 1), (15, 2)],
  term ((-596292272370210102731177090662239802901212841340772628921 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(5, 1), (9, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1629 for generator 15. -/
theorem ep_Q2_024_partial_15_1629_valid :
    mulPoly ep_Q2_024_coefficient_15_1629
        ep_Q2_024_generator_15_1600_1699 =
      ep_Q2_024_partial_15_1629 := by
  native_decide

/-- Coefficient term 1630 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1630 : Poly :=
[
  term ((11177629529470399 : Rat) / 6976681326919158) [(5, 1), (9, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1630 for generator 15. -/
def ep_Q2_024_partial_15_1630 : Poly :=
[
  term ((11177629529470399 : Rat) / 3488340663459579) [(5, 1), (6, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-11177629529470399 : Rat) / 6976681326919158) [(5, 1), (9, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1630 for generator 15. -/
theorem ep_Q2_024_partial_15_1630_valid :
    mulPoly ep_Q2_024_coefficient_15_1630
        ep_Q2_024_generator_15_1600_1699 =
      ep_Q2_024_partial_15_1630 := by
  native_decide

/-- Coefficient term 1631 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1631 : Poly :=
[
  term ((1974494190937863380254092756241721176 : Rat) / 39990315246749243218889784267651308933) [(5, 1), (9, 1), (14, 2)]
]

/-- Partial product 1631 for generator 15. -/
def ep_Q2_024_partial_15_1631 : Poly :=
[
  term ((3948988381875726760508185512483442352 : Rat) / 39990315246749243218889784267651308933) [(5, 1), (6, 1), (9, 1), (14, 2)],
  term ((-1974494190937863380254092756241721176 : Rat) / 39990315246749243218889784267651308933) [(5, 1), (9, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1631 for generator 15. -/
theorem ep_Q2_024_partial_15_1631_valid :
    mulPoly ep_Q2_024_coefficient_15_1631
        ep_Q2_024_generator_15_1600_1699 =
      ep_Q2_024_partial_15_1631 := by
  native_decide

/-- Coefficient term 1632 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1632 : Poly :=
[
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 1), (9, 1), (14, 2), (15, 2)]
]

/-- Partial product 1632 for generator 15. -/
def ep_Q2_024_partial_15_1632 : Poly :=
[
  term ((-674456529895393409686477352003493571793009190155093372 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 1), (6, 1), (9, 1), (14, 2), (15, 2)],
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 1), (9, 1), (14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1632 for generator 15. -/
theorem ep_Q2_024_partial_15_1632_valid :
    mulPoly ep_Q2_024_coefficient_15_1632
        ep_Q2_024_generator_15_1600_1699 =
      ep_Q2_024_partial_15_1632 := by
  native_decide

/-- Coefficient term 1633 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1633 : Poly :=
[
  term ((-833967741040952 : Rat) / 1162780221153193) [(5, 1), (9, 1), (14, 2), (15, 2), (16, 1)]
]

/-- Partial product 1633 for generator 15. -/
def ep_Q2_024_partial_15_1633 : Poly :=
[
  term ((-1667935482081904 : Rat) / 1162780221153193) [(5, 1), (6, 1), (9, 1), (14, 2), (15, 2), (16, 1)],
  term ((833967741040952 : Rat) / 1162780221153193) [(5, 1), (9, 1), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1633 for generator 15. -/
theorem ep_Q2_024_partial_15_1633_valid :
    mulPoly ep_Q2_024_coefficient_15_1633
        ep_Q2_024_generator_15_1600_1699 =
      ep_Q2_024_partial_15_1633 := by
  native_decide

/-- Coefficient term 1634 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1634 : Poly :=
[
  term ((-3457567809821648964693558454914262033925753474640006559 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(5, 1), (9, 1), (15, 2)]
]

/-- Partial product 1634 for generator 15. -/
def ep_Q2_024_partial_15_1634 : Poly :=
[
  term ((-3457567809821648964693558454914262033925753474640006559 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (6, 1), (9, 1), (15, 2)],
  term ((3457567809821648964693558454914262033925753474640006559 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(5, 1), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1634 for generator 15. -/
theorem ep_Q2_024_partial_15_1634_valid :
    mulPoly ep_Q2_024_coefficient_15_1634
        ep_Q2_024_generator_15_1600_1699 =
      ep_Q2_024_partial_15_1634 := by
  native_decide

/-- Coefficient term 1635 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1635 : Poly :=
[
  term ((598350889601034 : Rat) / 1162780221153193) [(5, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 1635 for generator 15. -/
def ep_Q2_024_partial_15_1635 : Poly :=
[
  term ((1196701779202068 : Rat) / 1162780221153193) [(5, 1), (6, 1), (9, 1), (15, 2), (16, 1)],
  term ((-598350889601034 : Rat) / 1162780221153193) [(5, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1635 for generator 15. -/
theorem ep_Q2_024_partial_15_1635_valid :
    mulPoly ep_Q2_024_coefficient_15_1635
        ep_Q2_024_generator_15_1600_1699 =
      ep_Q2_024_partial_15_1635 := by
  native_decide

/-- Coefficient term 1636 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1636 : Poly :=
[
  term ((-51916682732587159756343578366982608688 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (9, 2), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 1636 for generator 15. -/
def ep_Q2_024_partial_15_1636 : Poly :=
[
  term ((-103833365465174319512687156733965217376 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (6, 1), (9, 2), (12, 1), (13, 1), (14, 1)],
  term ((51916682732587159756343578366982608688 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (9, 2), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1636 for generator 15. -/
theorem ep_Q2_024_partial_15_1636_valid :
    mulPoly ep_Q2_024_coefficient_15_1636
        ep_Q2_024_generator_15_1600_1699 =
      ep_Q2_024_partial_15_1636 := by
  native_decide

/-- Coefficient term 1637 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1637 : Poly :=
[
  term ((519790077507635364246714238454931580267528154182411463 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 1), (9, 2), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 1637 for generator 15. -/
def ep_Q2_024_partial_15_1637 : Poly :=
[
  term ((1039580155015270728493428476909863160535056308364822926 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 1), (6, 1), (9, 2), (12, 1), (14, 1), (15, 1)],
  term ((-519790077507635364246714238454931580267528154182411463 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 1), (9, 2), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1637 for generator 15. -/
theorem ep_Q2_024_partial_15_1637_valid :
    mulPoly ep_Q2_024_coefficient_15_1637
        ep_Q2_024_generator_15_1600_1699 =
      ep_Q2_024_partial_15_1637 := by
  native_decide

/-- Coefficient term 1638 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1638 : Poly :=
[
  term ((-850957154578940 : Rat) / 1162780221153193) [(5, 1), (9, 2), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1638 for generator 15. -/
def ep_Q2_024_partial_15_1638 : Poly :=
[
  term ((-1701914309157880 : Rat) / 1162780221153193) [(5, 1), (6, 1), (9, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((850957154578940 : Rat) / 1162780221153193) [(5, 1), (9, 2), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1638 for generator 15. -/
theorem ep_Q2_024_partial_15_1638_valid :
    mulPoly ep_Q2_024_coefficient_15_1638
        ep_Q2_024_generator_15_1600_1699 =
      ep_Q2_024_partial_15_1638 := by
  native_decide

/-- Coefficient term 1639 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1639 : Poly :=
[
  term ((1723527582385063883590680985223473124536 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (9, 2), (13, 1), (14, 1)]
]

/-- Partial product 1639 for generator 15. -/
def ep_Q2_024_partial_15_1639 : Poly :=
[
  term ((3447055164770127767181361970446946249072 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (6, 1), (9, 2), (13, 1), (14, 1)],
  term ((-1723527582385063883590680985223473124536 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (9, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1639 for generator 15. -/
theorem ep_Q2_024_partial_15_1639_valid :
    mulPoly ep_Q2_024_coefficient_15_1639
        ep_Q2_024_generator_15_1600_1699 =
      ep_Q2_024_partial_15_1639 := by
  native_decide

/-- Coefficient term 1640 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1640 : Poly :=
[
  term ((3837692621981570704068833845432150086140131802040740909 : Rat) / 46499947606600990925238671541813294873367321162373069) [(5, 1), (9, 2), (14, 1), (15, 1)]
]

/-- Partial product 1640 for generator 15. -/
def ep_Q2_024_partial_15_1640 : Poly :=
[
  term ((7675385243963141408137667690864300172280263604081481818 : Rat) / 46499947606600990925238671541813294873367321162373069) [(5, 1), (6, 1), (9, 2), (14, 1), (15, 1)],
  term ((-3837692621981570704068833845432150086140131802040740909 : Rat) / 46499947606600990925238671541813294873367321162373069) [(5, 1), (9, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1640 for generator 15. -/
theorem ep_Q2_024_partial_15_1640_valid :
    mulPoly ep_Q2_024_coefficient_15_1640
        ep_Q2_024_generator_15_1600_1699 =
      ep_Q2_024_partial_15_1640 := by
  native_decide

/-- Coefficient term 1641 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1641 : Poly :=
[
  term ((-11761952876044204 : Rat) / 1162780221153193) [(5, 1), (9, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1641 for generator 15. -/
def ep_Q2_024_partial_15_1641 : Poly :=
[
  term ((-23523905752088408 : Rat) / 1162780221153193) [(5, 1), (6, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((11761952876044204 : Rat) / 1162780221153193) [(5, 1), (9, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1641 for generator 15. -/
theorem ep_Q2_024_partial_15_1641_valid :
    mulPoly ep_Q2_024_coefficient_15_1641
        ep_Q2_024_generator_15_1600_1699 =
      ep_Q2_024_partial_15_1641 := by
  native_decide

/-- Coefficient term 1642 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1642 : Poly :=
[
  term ((31556266093234973165652571965850210528 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (9, 2), (15, 1)]
]

/-- Partial product 1642 for generator 15. -/
def ep_Q2_024_partial_15_1642 : Poly :=
[
  term ((63112532186469946331305143931700421056 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (6, 1), (9, 2), (15, 1)],
  term ((-31556266093234973165652571965850210528 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (9, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1642 for generator 15. -/
theorem ep_Q2_024_partial_15_1642_valid :
    mulPoly ep_Q2_024_coefficient_15_1642
        ep_Q2_024_generator_15_1600_1699 =
      ep_Q2_024_partial_15_1642 := by
  native_decide

/-- Coefficient term 1643 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1643 : Poly :=
[
  term ((-51644304559123503875495656333637980088 : Rat) / 119970945740247729656669352802953926799) [(5, 1), (9, 3), (14, 1)]
]

/-- Partial product 1643 for generator 15. -/
def ep_Q2_024_partial_15_1643 : Poly :=
[
  term ((-103288609118247007750991312667275960176 : Rat) / 119970945740247729656669352802953926799) [(5, 1), (6, 1), (9, 3), (14, 1)],
  term ((51644304559123503875495656333637980088 : Rat) / 119970945740247729656669352802953926799) [(5, 1), (9, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1643 for generator 15. -/
theorem ep_Q2_024_partial_15_1643_valid :
    mulPoly ep_Q2_024_coefficient_15_1643
        ep_Q2_024_generator_15_1600_1699 =
      ep_Q2_024_partial_15_1643 := by
  native_decide

/-- Coefficient term 1644 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1644 : Poly :=
[
  term ((174966140812491725990765627383426868992 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (11, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 1644 for generator 15. -/
def ep_Q2_024_partial_15_1644 : Poly :=
[
  term ((349932281624983451981531254766853737984 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (6, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-174966140812491725990765627383426868992 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (11, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1644 for generator 15. -/
theorem ep_Q2_024_partial_15_1644_valid :
    mulPoly ep_Q2_024_coefficient_15_1644
        ep_Q2_024_generator_15_1600_1699 =
      ep_Q2_024_partial_15_1644 := by
  native_decide

/-- Coefficient term 1645 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1645 : Poly :=
[
  term ((16176500484703859640326183609747740820124383478472384106 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (11, 1), (12, 1), (15, 2)]
]

/-- Partial product 1645 for generator 15. -/
def ep_Q2_024_partial_15_1645 : Poly :=
[
  term ((32353000969407719280652367219495481640248766956944768212 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (6, 1), (11, 1), (12, 1), (15, 2)],
  term ((-16176500484703859640326183609747740820124383478472384106 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (11, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1645 for generator 15. -/
theorem ep_Q2_024_partial_15_1645_valid :
    mulPoly ep_Q2_024_coefficient_15_1645
        ep_Q2_024_generator_15_1600_1699 =
      ep_Q2_024_partial_15_1645 := by
  native_decide

/-- Coefficient term 1646 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1646 : Poly :=
[
  term ((115944433813960 : Rat) / 1162780221153193) [(5, 1), (11, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1646 for generator 15. -/
def ep_Q2_024_partial_15_1646 : Poly :=
[
  term ((231888867627920 : Rat) / 1162780221153193) [(5, 1), (6, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-115944433813960 : Rat) / 1162780221153193) [(5, 1), (11, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1646 for generator 15. -/
theorem ep_Q2_024_partial_15_1646_valid :
    mulPoly ep_Q2_024_coefficient_15_1646
        ep_Q2_024_generator_15_1600_1699 =
      ep_Q2_024_partial_15_1646 := by
  native_decide

/-- Coefficient term 1647 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1647 : Poly :=
[
  term ((-43741535203122931497691406845856717248 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 1647 for generator 15. -/
def ep_Q2_024_partial_15_1647 : Poly :=
[
  term ((-87483070406245862995382813691713434496 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (6, 1), (11, 1), (13, 1), (15, 1)],
  term ((43741535203122931497691406845856717248 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1647 for generator 15. -/
theorem ep_Q2_024_partial_15_1647_valid :
    mulPoly ep_Q2_024_coefficient_15_1647
        ep_Q2_024_generator_15_1600_1699 =
      ep_Q2_024_partial_15_1647 := by
  native_decide

/-- Coefficient term 1648 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1648 : Poly :=
[
  term ((-244075067403674486867873273412360623676 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (11, 1), (14, 1)]
]

/-- Partial product 1648 for generator 15. -/
def ep_Q2_024_partial_15_1648 : Poly :=
[
  term ((-488150134807348973735746546824721247352 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (6, 1), (11, 1), (14, 1)],
  term ((244075067403674486867873273412360623676 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1648 for generator 15. -/
theorem ep_Q2_024_partial_15_1648_valid :
    mulPoly ep_Q2_024_coefficient_15_1648
        ep_Q2_024_generator_15_1600_1699 =
      ep_Q2_024_partial_15_1648 := by
  native_decide

/-- Coefficient term 1649 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1649 : Poly :=
[
  term ((-8088250242351929820163091804873870410062191739236192053 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(5, 1), (11, 1), (15, 2)]
]

/-- Partial product 1649 for generator 15. -/
def ep_Q2_024_partial_15_1649 : Poly :=
[
  term ((-8088250242351929820163091804873870410062191739236192053 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (6, 1), (11, 1), (15, 2)],
  term ((8088250242351929820163091804873870410062191739236192053 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(5, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1649 for generator 15. -/
theorem ep_Q2_024_partial_15_1649_valid :
    mulPoly ep_Q2_024_coefficient_15_1649
        ep_Q2_024_generator_15_1600_1699 =
      ep_Q2_024_partial_15_1649 := by
  native_decide

/-- Coefficient term 1650 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1650 : Poly :=
[
  term ((-28986108453490 : Rat) / 1162780221153193) [(5, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 1650 for generator 15. -/
def ep_Q2_024_partial_15_1650 : Poly :=
[
  term ((-57972216906980 : Rat) / 1162780221153193) [(5, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((28986108453490 : Rat) / 1162780221153193) [(5, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1650 for generator 15. -/
theorem ep_Q2_024_partial_15_1650_valid :
    mulPoly ep_Q2_024_coefficient_15_1650
        ep_Q2_024_generator_15_1600_1699 =
      ep_Q2_024_partial_15_1650 := by
  native_decide

/-- Coefficient term 1651 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1651 : Poly :=
[
  term ((-662002757597067264608220057268506985052 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (12, 1), (13, 1)]
]

/-- Partial product 1651 for generator 15. -/
def ep_Q2_024_partial_15_1651 : Poly :=
[
  term ((-1324005515194134529216440114537013970104 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (6, 1), (12, 1), (13, 1)],
  term ((662002757597067264608220057268506985052 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1651 for generator 15. -/
theorem ep_Q2_024_partial_15_1651_valid :
    mulPoly ep_Q2_024_coefficient_15_1651
        ep_Q2_024_generator_15_1600_1699 =
      ep_Q2_024_partial_15_1651 := by
  native_decide

/-- Coefficient term 1652 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1652 : Poly :=
[
  term ((549077845250167653744169908325901455832 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 1652 for generator 15. -/
def ep_Q2_024_partial_15_1652 : Poly :=
[
  term ((1098155690500335307488339816651802911664 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (6, 1), (12, 1), (13, 1), (14, 1)],
  term ((-549077845250167653744169908325901455832 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1652 for generator 15. -/
theorem ep_Q2_024_partial_15_1652_valid :
    mulPoly ep_Q2_024_coefficient_15_1652
        ep_Q2_024_generator_15_1600_1699 =
      ep_Q2_024_partial_15_1652 := by
  native_decide

/-- Coefficient term 1653 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1653 : Poly :=
[
  term ((4243375123312046760712148470785626944 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (12, 1), (13, 1), (14, 2)]
]

/-- Partial product 1653 for generator 15. -/
def ep_Q2_024_partial_15_1653 : Poly :=
[
  term ((8486750246624093521424296941571253888 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (6, 1), (12, 1), (13, 1), (14, 2)],
  term ((-4243375123312046760712148470785626944 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (12, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1653 for generator 15. -/
theorem ep_Q2_024_partial_15_1653_valid :
    mulPoly ep_Q2_024_coefficient_15_1653
        ep_Q2_024_generator_15_1600_1699 =
      ep_Q2_024_partial_15_1653 := by
  native_decide

/-- Coefficient term 1654 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1654 : Poly :=
[
  term ((-884665121903724864030315714982480195277164108406589296 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 1), (12, 1), (13, 1), (15, 2)]
]

/-- Partial product 1654 for generator 15. -/
def ep_Q2_024_partial_15_1654 : Poly :=
[
  term ((-1769330243807449728060631429964960390554328216813178592 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 1), (6, 1), (12, 1), (13, 1), (15, 2)],
  term ((884665121903724864030315714982480195277164108406589296 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1654 for generator 15. -/
theorem ep_Q2_024_partial_15_1654_valid :
    mulPoly ep_Q2_024_coefficient_15_1654
        ep_Q2_024_generator_15_1600_1699 =
      ep_Q2_024_partial_15_1654 := by
  native_decide

/-- Coefficient term 1655 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1655 : Poly :=
[
  term ((898255108859200 : Rat) / 1162780221153193) [(5, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 1655 for generator 15. -/
def ep_Q2_024_partial_15_1655 : Poly :=
[
  term ((1796510217718400 : Rat) / 1162780221153193) [(5, 1), (6, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-898255108859200 : Rat) / 1162780221153193) [(5, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1655 for generator 15. -/
theorem ep_Q2_024_partial_15_1655_valid :
    mulPoly ep_Q2_024_coefficient_15_1655
        ep_Q2_024_generator_15_1600_1699 =
      ep_Q2_024_partial_15_1655 := by
  native_decide

/-- Coefficient term 1656 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1656 : Poly :=
[
  term ((-46606006548196236713541705654221512448 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (12, 1), (13, 2), (15, 1)]
]

/-- Partial product 1656 for generator 15. -/
def ep_Q2_024_partial_15_1656 : Poly :=
[
  term ((-93212013096392473427083411308443024896 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (6, 1), (12, 1), (13, 2), (15, 1)],
  term ((46606006548196236713541705654221512448 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (12, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1656 for generator 15. -/
theorem ep_Q2_024_partial_15_1656_valid :
    mulPoly ep_Q2_024_coefficient_15_1656
        ep_Q2_024_generator_15_1600_1699 =
      ep_Q2_024_partial_15_1656 := by
  native_decide

/-- Coefficient term 1657 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1657 : Poly :=
[
  term ((13325395970905434867319386254491882365609830716424875713 : Rat) / 464999476066009909252386715418132948733673211623730690) [(5, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 1657 for generator 15. -/
def ep_Q2_024_partial_15_1657 : Poly :=
[
  term ((13325395970905434867319386254491882365609830716424875713 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 1), (6, 1), (12, 1), (14, 1), (15, 1)],
  term ((-13325395970905434867319386254491882365609830716424875713 : Rat) / 464999476066009909252386715418132948733673211623730690) [(5, 1), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1657 for generator 15. -/
theorem ep_Q2_024_partial_15_1657_valid :
    mulPoly ep_Q2_024_coefficient_15_1657
        ep_Q2_024_generator_15_1600_1699 =
      ep_Q2_024_partial_15_1657 := by
  native_decide

/-- Coefficient term 1658 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1658 : Poly :=
[
  term ((-13770078758963362 : Rat) / 1162780221153193) [(5, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1658 for generator 15. -/
def ep_Q2_024_partial_15_1658 : Poly :=
[
  term ((-27540157517926724 : Rat) / 1162780221153193) [(5, 1), (6, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((13770078758963362 : Rat) / 1162780221153193) [(5, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1658 for generator 15. -/
theorem ep_Q2_024_partial_15_1658_valid :
    mulPoly ep_Q2_024_coefficient_15_1658
        ep_Q2_024_generator_15_1600_1699 =
      ep_Q2_024_partial_15_1658 := by
  native_decide

/-- Coefficient term 1659 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1659 : Poly :=
[
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 46499947606600990925238671541813294873367321162373069) [(5, 1), (12, 1), (14, 2), (15, 1)]
]

/-- Partial product 1659 for generator 15. -/
def ep_Q2_024_partial_15_1659 : Poly :=
[
  term ((674456529895393409686477352003493571793009190155093372 : Rat) / 46499947606600990925238671541813294873367321162373069) [(5, 1), (6, 1), (12, 1), (14, 2), (15, 1)],
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 46499947606600990925238671541813294873367321162373069) [(5, 1), (12, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1659 for generator 15. -/
theorem ep_Q2_024_partial_15_1659_valid :
    mulPoly ep_Q2_024_coefficient_15_1659
        ep_Q2_024_generator_15_1600_1699 =
      ep_Q2_024_partial_15_1659 := by
  native_decide

/-- Coefficient term 1660 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1660 : Poly :=
[
  term ((2501903223122856 : Rat) / 1162780221153193) [(5, 1), (12, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 1660 for generator 15. -/
def ep_Q2_024_partial_15_1660 : Poly :=
[
  term ((5003806446245712 : Rat) / 1162780221153193) [(5, 1), (6, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-2501903223122856 : Rat) / 1162780221153193) [(5, 1), (12, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1660 for generator 15. -/
theorem ep_Q2_024_partial_15_1660_valid :
    mulPoly ep_Q2_024_coefficient_15_1660
        ep_Q2_024_generator_15_1600_1699 =
      ep_Q2_024_partial_15_1660 := by
  native_decide

/-- Coefficient term 1661 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1661 : Poly :=
[
  term ((1820857285750075095892933871182885340339657980270277503 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 1), (12, 1), (15, 1)]
]

/-- Partial product 1661 for generator 15. -/
def ep_Q2_024_partial_15_1661 : Poly :=
[
  term ((3641714571500150191785867742365770680679315960540555006 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 1), (6, 1), (12, 1), (15, 1)],
  term ((-1820857285750075095892933871182885340339657980270277503 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1661 for generator 15. -/
theorem ep_Q2_024_partial_15_1661_valid :
    mulPoly ep_Q2_024_coefficient_15_1661
        ep_Q2_024_generator_15_1600_1699 =
      ep_Q2_024_partial_15_1661 := by
  native_decide

/-- Coefficient term 1662 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1662 : Poly :=
[
  term ((2103784619591340 : Rat) / 1162780221153193) [(5, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1662 for generator 15. -/
def ep_Q2_024_partial_15_1662 : Poly :=
[
  term ((4207569239182680 : Rat) / 1162780221153193) [(5, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2103784619591340 : Rat) / 1162780221153193) [(5, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1662 for generator 15. -/
theorem ep_Q2_024_partial_15_1662_valid :
    mulPoly ep_Q2_024_coefficient_15_1662
        ep_Q2_024_generator_15_1600_1699 =
      ep_Q2_024_partial_15_1662 := by
  native_decide

/-- Coefficient term 1663 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1663 : Poly :=
[
  term ((1411028888900427473198385602032644033180051691814836514 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 1), (12, 1), (15, 3)]
]

/-- Partial product 1663 for generator 15. -/
def ep_Q2_024_partial_15_1663 : Poly :=
[
  term ((2822057777800854946396771204065288066360103383629673028 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 1), (6, 1), (12, 1), (15, 3)],
  term ((-1411028888900427473198385602032644033180051691814836514 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1663 for generator 15. -/
theorem ep_Q2_024_partial_15_1663_valid :
    mulPoly ep_Q2_024_coefficient_15_1663
        ep_Q2_024_generator_15_1600_1699 =
      ep_Q2_024_partial_15_1663 := by
  native_decide

/-- Coefficient term 1664 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1664 : Poly :=
[
  term ((3223595267130360 : Rat) / 1162780221153193) [(5, 1), (12, 1), (15, 3), (16, 1)]
]

/-- Partial product 1664 for generator 15. -/
def ep_Q2_024_partial_15_1664 : Poly :=
[
  term ((6447190534260720 : Rat) / 1162780221153193) [(5, 1), (6, 1), (12, 1), (15, 3), (16, 1)],
  term ((-3223595267130360 : Rat) / 1162780221153193) [(5, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1664 for generator 15. -/
theorem ep_Q2_024_partial_15_1664_valid :
    mulPoly ep_Q2_024_coefficient_15_1664
        ep_Q2_024_generator_15_1600_1699 =
      ep_Q2_024_partial_15_1664 := by
  native_decide

/-- Coefficient term 1665 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1665 : Poly :=
[
  term ((214119857339273441834365962729061040968 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (12, 2), (13, 1)]
]

/-- Partial product 1665 for generator 15. -/
def ep_Q2_024_partial_15_1665 : Poly :=
[
  term ((428239714678546883668731925458122081936 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (6, 1), (12, 2), (13, 1)],
  term ((-214119857339273441834365962729061040968 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (12, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1665 for generator 15. -/
theorem ep_Q2_024_partial_15_1665_valid :
    mulPoly ep_Q2_024_coefficient_15_1665
        ep_Q2_024_generator_15_1600_1699 =
      ep_Q2_024_partial_15_1665 := by
  native_decide

/-- Coefficient term 1666 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1666 : Poly :=
[
  term ((22370519732554535961701071237261233856 : Rat) / 119970945740247729656669352802953926799) [(5, 1), (12, 2), (13, 1), (14, 1)]
]

/-- Partial product 1666 for generator 15. -/
def ep_Q2_024_partial_15_1666 : Poly :=
[
  term ((44741039465109071923402142474522467712 : Rat) / 119970945740247729656669352802953926799) [(5, 1), (6, 1), (12, 2), (13, 1), (14, 1)],
  term ((-22370519732554535961701071237261233856 : Rat) / 119970945740247729656669352802953926799) [(5, 1), (12, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1666 for generator 15. -/
theorem ep_Q2_024_partial_15_1666_valid :
    mulPoly ep_Q2_024_coefficient_15_1666
        ep_Q2_024_generator_15_1600_1699 =
      ep_Q2_024_partial_15_1666 := by
  native_decide

/-- Coefficient term 1667 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1667 : Poly :=
[
  term ((711263385280071340703317012247457547686834787034189212 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (12, 2), (14, 1), (15, 1)]
]

/-- Partial product 1667 for generator 15. -/
def ep_Q2_024_partial_15_1667 : Poly :=
[
  term ((1422526770560142681406634024494915095373669574068378424 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (6, 1), (12, 2), (14, 1), (15, 1)],
  term ((-711263385280071340703317012247457547686834787034189212 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (12, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1667 for generator 15. -/
theorem ep_Q2_024_partial_15_1667_valid :
    mulPoly ep_Q2_024_coefficient_15_1667
        ep_Q2_024_generator_15_1600_1699 =
      ep_Q2_024_partial_15_1667 := by
  native_decide

/-- Coefficient term 1668 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1668 : Poly :=
[
  term ((1944431909698480 : Rat) / 1162780221153193) [(5, 1), (12, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1668 for generator 15. -/
def ep_Q2_024_partial_15_1668 : Poly :=
[
  term ((3888863819396960 : Rat) / 1162780221153193) [(5, 1), (6, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1944431909698480 : Rat) / 1162780221153193) [(5, 1), (12, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1668 for generator 15. -/
theorem ep_Q2_024_partial_15_1668_valid :
    mulPoly ep_Q2_024_coefficient_15_1668
        ep_Q2_024_generator_15_1600_1699 =
      ep_Q2_024_partial_15_1668 := by
  native_decide

/-- Coefficient term 1669 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1669 : Poly :=
[
  term ((-19964092496513101992035698782188801377345692451782328993 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (12, 2), (15, 1)]
]

/-- Partial product 1669 for generator 15. -/
def ep_Q2_024_partial_15_1669 : Poly :=
[
  term ((-39928184993026203984071397564377602754691384903564657986 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (6, 1), (12, 2), (15, 1)],
  term ((19964092496513101992035698782188801377345692451782328993 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1669 for generator 15. -/
theorem ep_Q2_024_partial_15_1669_valid :
    mulPoly ep_Q2_024_coefficient_15_1669
        ep_Q2_024_generator_15_1600_1699 =
      ep_Q2_024_partial_15_1669 := by
  native_decide

/-- Coefficient term 1670 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1670 : Poly :=
[
  term ((3708883052092 : Rat) / 1162780221153193) [(5, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 1670 for generator 15. -/
def ep_Q2_024_partial_15_1670 : Poly :=
[
  term ((7417766104184 : Rat) / 1162780221153193) [(5, 1), (6, 1), (12, 2), (15, 1), (16, 1)],
  term ((-3708883052092 : Rat) / 1162780221153193) [(5, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1670 for generator 15. -/
theorem ep_Q2_024_partial_15_1670_valid :
    mulPoly ep_Q2_024_coefficient_15_1670
        ep_Q2_024_generator_15_1600_1699 =
      ep_Q2_024_partial_15_1670 := by
  native_decide

/-- Coefficient term 1671 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1671 : Poly :=
[
  term ((-98886758962730543340771375054612478048 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (12, 3), (13, 1)]
]

/-- Partial product 1671 for generator 15. -/
def ep_Q2_024_partial_15_1671 : Poly :=
[
  term ((-197773517925461086681542750109224956096 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (6, 1), (12, 3), (13, 1)],
  term ((98886758962730543340771375054612478048 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (12, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1671 for generator 15. -/
theorem ep_Q2_024_partial_15_1671_valid :
    mulPoly ep_Q2_024_coefficient_15_1671
        ep_Q2_024_generator_15_1600_1699 =
      ep_Q2_024_partial_15_1671 := by
  native_decide

/-- Coefficient term 1672 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1672 : Poly :=
[
  term ((137716123028596746964596678388159079520001184040109204 : Rat) / 46499947606600990925238671541813294873367321162373069) [(5, 1), (12, 3), (15, 1)]
]

/-- Partial product 1672 for generator 15. -/
def ep_Q2_024_partial_15_1672 : Poly :=
[
  term ((275432246057193493929193356776318159040002368080218408 : Rat) / 46499947606600990925238671541813294873367321162373069) [(5, 1), (6, 1), (12, 3), (15, 1)],
  term ((-137716123028596746964596678388159079520001184040109204 : Rat) / 46499947606600990925238671541813294873367321162373069) [(5, 1), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1672 for generator 15. -/
theorem ep_Q2_024_partial_15_1672_valid :
    mulPoly ep_Q2_024_coefficient_15_1672
        ep_Q2_024_generator_15_1600_1699 =
      ep_Q2_024_partial_15_1672 := by
  native_decide

/-- Coefficient term 1673 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1673 : Poly :=
[
  term ((1269203461259312 : Rat) / 1162780221153193) [(5, 1), (12, 3), (15, 1), (16, 1)]
]

/-- Partial product 1673 for generator 15. -/
def ep_Q2_024_partial_15_1673 : Poly :=
[
  term ((2538406922518624 : Rat) / 1162780221153193) [(5, 1), (6, 1), (12, 3), (15, 1), (16, 1)],
  term ((-1269203461259312 : Rat) / 1162780221153193) [(5, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1673 for generator 15. -/
theorem ep_Q2_024_partial_15_1673_valid :
    mulPoly ep_Q2_024_coefficient_15_1673
        ep_Q2_024_generator_15_1600_1699 =
      ep_Q2_024_partial_15_1673 := by
  native_decide

/-- Coefficient term 1674 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1674 : Poly :=
[
  term ((-4456652695374021426939827934044003051 : Rat) / 119970945740247729656669352802953926799) [(5, 1), (13, 1)]
]

/-- Partial product 1674 for generator 15. -/
def ep_Q2_024_partial_15_1674 : Poly :=
[
  term ((-8913305390748042853879655868088006102 : Rat) / 119970945740247729656669352802953926799) [(5, 1), (6, 1), (13, 1)],
  term ((4456652695374021426939827934044003051 : Rat) / 119970945740247729656669352802953926799) [(5, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1674 for generator 15. -/
theorem ep_Q2_024_partial_15_1674_valid :
    mulPoly ep_Q2_024_coefficient_15_1674
        ep_Q2_024_generator_15_1600_1699 =
      ep_Q2_024_partial_15_1674 := by
  native_decide

/-- Coefficient term 1675 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1675 : Poly :=
[
  term ((19074940390521949604420484966328673164 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (13, 1), (14, 1)]
]

/-- Partial product 1675 for generator 15. -/
def ep_Q2_024_partial_15_1675 : Poly :=
[
  term ((38149880781043899208840969932657346328 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (6, 1), (13, 1), (14, 1)],
  term ((-19074940390521949604420484966328673164 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1675 for generator 15. -/
theorem ep_Q2_024_partial_15_1675_valid :
    mulPoly ep_Q2_024_coefficient_15_1675
        ep_Q2_024_generator_15_1600_1699 =
      ep_Q2_024_partial_15_1675 := by
  native_decide

/-- Coefficient term 1676 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1676 : Poly :=
[
  term ((-69627929165030634103382546455200970952 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (13, 1), (14, 2)]
]

/-- Partial product 1676 for generator 15. -/
def ep_Q2_024_partial_15_1676 : Poly :=
[
  term ((-139255858330061268206765092910401941904 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (6, 1), (13, 1), (14, 2)],
  term ((69627929165030634103382546455200970952 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1676 for generator 15. -/
theorem ep_Q2_024_partial_15_1676_valid :
    mulPoly ep_Q2_024_coefficient_15_1676
        ep_Q2_024_generator_15_1600_1699 =
      ep_Q2_024_partial_15_1676 := by
  native_decide

/-- Coefficient term 1677 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1677 : Poly :=
[
  term ((-681403003820077611208115885588084898455843890627941401 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 1), (13, 1), (15, 2)]
]

/-- Partial product 1677 for generator 15. -/
def ep_Q2_024_partial_15_1677 : Poly :=
[
  term ((-1362806007640155222416231771176169796911687781255882802 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 1), (6, 1), (13, 1), (15, 2)],
  term ((681403003820077611208115885588084898455843890627941401 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1677 for generator 15. -/
theorem ep_Q2_024_partial_15_1677_valid :
    mulPoly ep_Q2_024_coefficient_15_1677
        ep_Q2_024_generator_15_1600_1699 =
      ep_Q2_024_partial_15_1677 := by
  native_decide

/-- Coefficient term 1678 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1678 : Poly :=
[
  term ((-238633865073428 : Rat) / 1162780221153193) [(5, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 1678 for generator 15. -/
def ep_Q2_024_partial_15_1678 : Poly :=
[
  term ((-477267730146856 : Rat) / 1162780221153193) [(5, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((238633865073428 : Rat) / 1162780221153193) [(5, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1678 for generator 15. -/
theorem ep_Q2_024_partial_15_1678_valid :
    mulPoly ep_Q2_024_coefficient_15_1678
        ep_Q2_024_generator_15_1600_1699 =
      ep_Q2_024_partial_15_1678 := by
  native_decide

/-- Coefficient term 1679 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1679 : Poly :=
[
  term ((62218077861333914435497425719868413752 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (13, 2), (15, 1)]
]

/-- Partial product 1679 for generator 15. -/
def ep_Q2_024_partial_15_1679 : Poly :=
[
  term ((124436155722667828870994851439736827504 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (6, 1), (13, 2), (15, 1)],
  term ((-62218077861333914435497425719868413752 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1679 for generator 15. -/
theorem ep_Q2_024_partial_15_1679_valid :
    mulPoly ep_Q2_024_coefficient_15_1679
        ep_Q2_024_generator_15_1600_1699 =
      ep_Q2_024_partial_15_1679 := by
  native_decide

/-- Coefficient term 1680 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1680 : Poly :=
[
  term ((-7816279289600243297998921465199139927134874863176071983 : Rat) / 464999476066009909252386715418132948733673211623730690) [(5, 1), (14, 1), (15, 1)]
]

/-- Partial product 1680 for generator 15. -/
def ep_Q2_024_partial_15_1680 : Poly :=
[
  term ((-7816279289600243297998921465199139927134874863176071983 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 1), (6, 1), (14, 1), (15, 1)],
  term ((7816279289600243297998921465199139927134874863176071983 : Rat) / 464999476066009909252386715418132948733673211623730690) [(5, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1680 for generator 15. -/
theorem ep_Q2_024_partial_15_1680_valid :
    mulPoly ep_Q2_024_coefficient_15_1680
        ep_Q2_024_generator_15_1600_1699 =
      ep_Q2_024_partial_15_1680 := by
  native_decide

/-- Coefficient term 1681 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1681 : Poly :=
[
  term ((8733439578994350 : Rat) / 1162780221153193) [(5, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1681 for generator 15. -/
def ep_Q2_024_partial_15_1681 : Poly :=
[
  term ((17466879157988700 : Rat) / 1162780221153193) [(5, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-8733439578994350 : Rat) / 1162780221153193) [(5, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1681 for generator 15. -/
theorem ep_Q2_024_partial_15_1681_valid :
    mulPoly ep_Q2_024_coefficient_15_1681
        ep_Q2_024_generator_15_1600_1699 =
      ep_Q2_024_partial_15_1681 := by
  native_decide

/-- Coefficient term 1682 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1682 : Poly :=
[
  term ((-2932962448615325597563619362738367662789015208397428717 : Rat) / 278999685639605945551432029250879769240203926974238414) [(5, 1), (14, 2), (15, 1)]
]

/-- Partial product 1682 for generator 15. -/
def ep_Q2_024_partial_15_1682 : Poly :=
[
  term ((-2932962448615325597563619362738367662789015208397428717 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 1), (6, 1), (14, 2), (15, 1)],
  term ((2932962448615325597563619362738367662789015208397428717 : Rat) / 278999685639605945551432029250879769240203926974238414) [(5, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1682 for generator 15. -/
theorem ep_Q2_024_partial_15_1682_valid :
    mulPoly ep_Q2_024_coefficient_15_1682
        ep_Q2_024_generator_15_1600_1699 =
      ep_Q2_024_partial_15_1682 := by
  native_decide

/-- Coefficient term 1683 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1683 : Poly :=
[
  term ((-2606621612800730 : Rat) / 1162780221153193) [(5, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 1683 for generator 15. -/
def ep_Q2_024_partial_15_1683 : Poly :=
[
  term ((-5213243225601460 : Rat) / 1162780221153193) [(5, 1), (6, 1), (14, 2), (15, 1), (16, 1)],
  term ((2606621612800730 : Rat) / 1162780221153193) [(5, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1683 for generator 15. -/
theorem ep_Q2_024_partial_15_1683_valid :
    mulPoly ep_Q2_024_coefficient_15_1683
        ep_Q2_024_generator_15_1600_1699 =
      ep_Q2_024_partial_15_1683 := by
  native_decide

/-- Coefficient term 1684 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1684 : Poly :=
[
  term ((8701879192366389091177240959372835299408749675119996827 : Rat) / 929998952132019818504773430836265897467346423247461380) [(5, 1), (15, 1)]
]

/-- Partial product 1684 for generator 15. -/
def ep_Q2_024_partial_15_1684 : Poly :=
[
  term ((8701879192366389091177240959372835299408749675119996827 : Rat) / 464999476066009909252386715418132948733673211623730690) [(5, 1), (6, 1), (15, 1)],
  term ((-8701879192366389091177240959372835299408749675119996827 : Rat) / 929998952132019818504773430836265897467346423247461380) [(5, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1684 for generator 15. -/
theorem ep_Q2_024_partial_15_1684_valid :
    mulPoly ep_Q2_024_coefficient_15_1684
        ep_Q2_024_generator_15_1600_1699 =
      ep_Q2_024_partial_15_1684 := by
  native_decide

/-- Coefficient term 1685 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1685 : Poly :=
[
  term ((-1386419075523931 : Rat) / 1162780221153193) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 1685 for generator 15. -/
def ep_Q2_024_partial_15_1685 : Poly :=
[
  term ((-2772838151047862 : Rat) / 1162780221153193) [(5, 1), (6, 1), (15, 1), (16, 1)],
  term ((1386419075523931 : Rat) / 1162780221153193) [(5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1685 for generator 15. -/
theorem ep_Q2_024_partial_15_1685_valid :
    mulPoly ep_Q2_024_coefficient_15_1685
        ep_Q2_024_generator_15_1600_1699 =
      ep_Q2_024_partial_15_1685 := by
  native_decide

/-- Coefficient term 1686 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1686 : Poly :=
[
  term ((5438065294908516452060766208644677267388586863877549987 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(5, 1), (15, 3)]
]

/-- Partial product 1686 for generator 15. -/
def ep_Q2_024_partial_15_1686 : Poly :=
[
  term ((5438065294908516452060766208644677267388586863877549987 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (6, 1), (15, 3)],
  term ((-5438065294908516452060766208644677267388586863877549987 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(5, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1686 for generator 15. -/
theorem ep_Q2_024_partial_15_1686_valid :
    mulPoly ep_Q2_024_coefficient_15_1686
        ep_Q2_024_generator_15_1600_1699 =
      ep_Q2_024_partial_15_1686 := by
  native_decide

/-- Coefficient term 1687 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1687 : Poly :=
[
  term ((-1338454083518194 : Rat) / 1162780221153193) [(5, 1), (15, 3), (16, 1)]
]

/-- Partial product 1687 for generator 15. -/
def ep_Q2_024_partial_15_1687 : Poly :=
[
  term ((-2676908167036388 : Rat) / 1162780221153193) [(5, 1), (6, 1), (15, 3), (16, 1)],
  term ((1338454083518194 : Rat) / 1162780221153193) [(5, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1687 for generator 15. -/
theorem ep_Q2_024_partial_15_1687_valid :
    mulPoly ep_Q2_024_coefficient_15_1687
        ep_Q2_024_generator_15_1600_1699 =
      ep_Q2_024_partial_15_1687 := by
  native_decide

/-- Coefficient term 1688 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1688 : Poly :=
[
  term ((-108527865897635204440923906776011627033 : Rat) / 399903152467492432188897842676513089330) [(5, 2)]
]

/-- Partial product 1688 for generator 15. -/
def ep_Q2_024_partial_15_1688 : Poly :=
[
  term ((108527865897635204440923906776011627033 : Rat) / 399903152467492432188897842676513089330) [(5, 2)],
  term ((-108527865897635204440923906776011627033 : Rat) / 199951576233746216094448921338256544665) [(5, 2), (6, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1688 for generator 15. -/
theorem ep_Q2_024_partial_15_1688_valid :
    mulPoly ep_Q2_024_coefficient_15_1688
        ep_Q2_024_generator_15_1600_1699 =
      ep_Q2_024_partial_15_1688 := by
  native_decide

/-- Coefficient term 1689 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1689 : Poly :=
[
  term ((-108527865897635204440923906776011627033 : Rat) / 199951576233746216094448921338256544665) [(5, 2), (6, 1)]
]

/-- Partial product 1689 for generator 15. -/
def ep_Q2_024_partial_15_1689 : Poly :=
[
  term ((108527865897635204440923906776011627033 : Rat) / 199951576233746216094448921338256544665) [(5, 2), (6, 1)],
  term ((-217055731795270408881847813552023254066 : Rat) / 199951576233746216094448921338256544665) [(5, 2), (6, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1689 for generator 15. -/
theorem ep_Q2_024_partial_15_1689_valid :
    mulPoly ep_Q2_024_coefficient_15_1689
        ep_Q2_024_generator_15_1600_1699 =
      ep_Q2_024_partial_15_1689 := by
  native_decide

/-- Coefficient term 1690 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1690 : Poly :=
[
  term ((-16890983628896808743407603036576568848 : Rat) / 199951576233746216094448921338256544665) [(5, 2), (6, 1), (9, 1), (15, 1)]
]

/-- Partial product 1690 for generator 15. -/
def ep_Q2_024_partial_15_1690 : Poly :=
[
  term ((16890983628896808743407603036576568848 : Rat) / 199951576233746216094448921338256544665) [(5, 2), (6, 1), (9, 1), (15, 1)],
  term ((-33781967257793617486815206073153137696 : Rat) / 199951576233746216094448921338256544665) [(5, 2), (6, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1690 for generator 15. -/
theorem ep_Q2_024_partial_15_1690_valid :
    mulPoly ep_Q2_024_coefficient_15_1690
        ep_Q2_024_generator_15_1600_1699 =
      ep_Q2_024_partial_15_1690 := by
  native_decide

/-- Coefficient term 1691 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1691 : Poly :=
[
  term ((-20220074797511964466058292860462341536 : Rat) / 199951576233746216094448921338256544665) [(5, 2), (6, 1), (13, 1), (15, 1)]
]

/-- Partial product 1691 for generator 15. -/
def ep_Q2_024_partial_15_1691 : Poly :=
[
  term ((20220074797511964466058292860462341536 : Rat) / 199951576233746216094448921338256544665) [(5, 2), (6, 1), (13, 1), (15, 1)],
  term ((-40440149595023928932116585720924683072 : Rat) / 199951576233746216094448921338256544665) [(5, 2), (6, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1691 for generator 15. -/
theorem ep_Q2_024_partial_15_1691_valid :
    mulPoly ep_Q2_024_coefficient_15_1691
        ep_Q2_024_generator_15_1600_1699 =
      ep_Q2_024_partial_15_1691 := by
  native_decide

/-- Coefficient term 1692 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1692 : Poly :=
[
  term ((1086812258876365631714711692878661467835285345215957824 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 2), (6, 1), (15, 2)]
]

/-- Partial product 1692 for generator 15. -/
def ep_Q2_024_partial_15_1692 : Poly :=
[
  term ((-1086812258876365631714711692878661467835285345215957824 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 2), (6, 1), (15, 2)],
  term ((2173624517752731263429423385757322935670570690431915648 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 2), (6, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1692 for generator 15. -/
theorem ep_Q2_024_partial_15_1692_valid :
    mulPoly ep_Q2_024_coefficient_15_1692
        ep_Q2_024_generator_15_1600_1699 =
      ep_Q2_024_partial_15_1692 := by
  native_decide

/-- Coefficient term 1693 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1693 : Poly :=
[
  term ((103470768511616 : Rat) / 1162780221153193) [(5, 2), (6, 1), (15, 2), (16, 1)]
]

/-- Partial product 1693 for generator 15. -/
def ep_Q2_024_partial_15_1693 : Poly :=
[
  term ((-103470768511616 : Rat) / 1162780221153193) [(5, 2), (6, 1), (15, 2), (16, 1)],
  term ((206941537023232 : Rat) / 1162780221153193) [(5, 2), (6, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1693 for generator 15. -/
theorem ep_Q2_024_partial_15_1693_valid :
    mulPoly ep_Q2_024_coefficient_15_1693
        ep_Q2_024_generator_15_1600_1699 =
      ep_Q2_024_partial_15_1693 := by
  native_decide

/-- Coefficient term 1694 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1694 : Poly :=
[
  term ((-23642389152857299329089450702871043752 : Rat) / 199951576233746216094448921338256544665) [(5, 2), (8, 1), (9, 1), (15, 1)]
]

/-- Partial product 1694 for generator 15. -/
def ep_Q2_024_partial_15_1694 : Poly :=
[
  term ((-47284778305714598658178901405742087504 : Rat) / 199951576233746216094448921338256544665) [(5, 2), (6, 1), (8, 1), (9, 1), (15, 1)],
  term ((23642389152857299329089450702871043752 : Rat) / 199951576233746216094448921338256544665) [(5, 2), (8, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1694 for generator 15. -/
theorem ep_Q2_024_partial_15_1694_valid :
    mulPoly ep_Q2_024_coefficient_15_1694
        ep_Q2_024_generator_15_1600_1699 =
      ep_Q2_024_partial_15_1694 := by
  native_decide

/-- Coefficient term 1695 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1695 : Poly :=
[
  term ((-197694510238266821957195557551254432816 : Rat) / 599854728701238648283346764014769633995) [(5, 2), (8, 1), (13, 1), (15, 1)]
]

/-- Partial product 1695 for generator 15. -/
def ep_Q2_024_partial_15_1695 : Poly :=
[
  term ((-395389020476533643914391115102508865632 : Rat) / 599854728701238648283346764014769633995) [(5, 2), (6, 1), (8, 1), (13, 1), (15, 1)],
  term ((197694510238266821957195557551254432816 : Rat) / 599854728701238648283346764014769633995) [(5, 2), (8, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1695 for generator 15. -/
theorem ep_Q2_024_partial_15_1695_valid :
    mulPoly ep_Q2_024_coefficient_15_1695
        ep_Q2_024_generator_15_1600_1699 =
      ep_Q2_024_partial_15_1695 := by
  native_decide

/-- Coefficient term 1696 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1696 : Poly :=
[
  term ((-5230076720176820119682108016672776177553508626941610138 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 2), (8, 1), (15, 2)]
]

/-- Partial product 1696 for generator 15. -/
def ep_Q2_024_partial_15_1696 : Poly :=
[
  term ((-10460153440353640239364216033345552355107017253883220276 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 2), (6, 1), (8, 1), (15, 2)],
  term ((5230076720176820119682108016672776177553508626941610138 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 2), (8, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1696 for generator 15. -/
theorem ep_Q2_024_partial_15_1696_valid :
    mulPoly ep_Q2_024_coefficient_15_1696
        ep_Q2_024_generator_15_1600_1699 =
      ep_Q2_024_partial_15_1696 := by
  native_decide

/-- Coefficient term 1697 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1697 : Poly :=
[
  term ((2361660524222056 : Rat) / 1162780221153193) [(5, 2), (8, 1), (15, 2), (16, 1)]
]

/-- Partial product 1697 for generator 15. -/
def ep_Q2_024_partial_15_1697 : Poly :=
[
  term ((4723321048444112 : Rat) / 1162780221153193) [(5, 2), (6, 1), (8, 1), (15, 2), (16, 1)],
  term ((-2361660524222056 : Rat) / 1162780221153193) [(5, 2), (8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1697 for generator 15. -/
theorem ep_Q2_024_partial_15_1697_valid :
    mulPoly ep_Q2_024_coefficient_15_1697
        ep_Q2_024_generator_15_1600_1699 =
      ep_Q2_024_partial_15_1697 := by
  native_decide

/-- Coefficient term 1698 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1698 : Poly :=
[
  term ((197694510238266821957195557551254432816 : Rat) / 599854728701238648283346764014769633995) [(5, 2), (9, 1), (13, 1), (14, 1)]
]

/-- Partial product 1698 for generator 15. -/
def ep_Q2_024_partial_15_1698 : Poly :=
[
  term ((395389020476533643914391115102508865632 : Rat) / 599854728701238648283346764014769633995) [(5, 2), (6, 1), (9, 1), (13, 1), (14, 1)],
  term ((-197694510238266821957195557551254432816 : Rat) / 599854728701238648283346764014769633995) [(5, 2), (9, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1698 for generator 15. -/
theorem ep_Q2_024_partial_15_1698_valid :
    mulPoly ep_Q2_024_coefficient_15_1698
        ep_Q2_024_generator_15_1600_1699 =
      ep_Q2_024_partial_15_1698 := by
  native_decide

/-- Coefficient term 1699 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1699 : Poly :=
[
  term ((5230076720176820119682108016672776177553508626941610138 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 2), (9, 1), (14, 1), (15, 1)]
]

/-- Partial product 1699 for generator 15. -/
def ep_Q2_024_partial_15_1699 : Poly :=
[
  term ((10460153440353640239364216033345552355107017253883220276 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 2), (6, 1), (9, 1), (14, 1), (15, 1)],
  term ((-5230076720176820119682108016672776177553508626941610138 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 2), (9, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1699 for generator 15. -/
theorem ep_Q2_024_partial_15_1699_valid :
    mulPoly ep_Q2_024_coefficient_15_1699
        ep_Q2_024_generator_15_1600_1699 =
      ep_Q2_024_partial_15_1699 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_024_partials_15_1600_1699 : List Poly :=
[
  ep_Q2_024_partial_15_1600,
  ep_Q2_024_partial_15_1601,
  ep_Q2_024_partial_15_1602,
  ep_Q2_024_partial_15_1603,
  ep_Q2_024_partial_15_1604,
  ep_Q2_024_partial_15_1605,
  ep_Q2_024_partial_15_1606,
  ep_Q2_024_partial_15_1607,
  ep_Q2_024_partial_15_1608,
  ep_Q2_024_partial_15_1609,
  ep_Q2_024_partial_15_1610,
  ep_Q2_024_partial_15_1611,
  ep_Q2_024_partial_15_1612,
  ep_Q2_024_partial_15_1613,
  ep_Q2_024_partial_15_1614,
  ep_Q2_024_partial_15_1615,
  ep_Q2_024_partial_15_1616,
  ep_Q2_024_partial_15_1617,
  ep_Q2_024_partial_15_1618,
  ep_Q2_024_partial_15_1619,
  ep_Q2_024_partial_15_1620,
  ep_Q2_024_partial_15_1621,
  ep_Q2_024_partial_15_1622,
  ep_Q2_024_partial_15_1623,
  ep_Q2_024_partial_15_1624,
  ep_Q2_024_partial_15_1625,
  ep_Q2_024_partial_15_1626,
  ep_Q2_024_partial_15_1627,
  ep_Q2_024_partial_15_1628,
  ep_Q2_024_partial_15_1629,
  ep_Q2_024_partial_15_1630,
  ep_Q2_024_partial_15_1631,
  ep_Q2_024_partial_15_1632,
  ep_Q2_024_partial_15_1633,
  ep_Q2_024_partial_15_1634,
  ep_Q2_024_partial_15_1635,
  ep_Q2_024_partial_15_1636,
  ep_Q2_024_partial_15_1637,
  ep_Q2_024_partial_15_1638,
  ep_Q2_024_partial_15_1639,
  ep_Q2_024_partial_15_1640,
  ep_Q2_024_partial_15_1641,
  ep_Q2_024_partial_15_1642,
  ep_Q2_024_partial_15_1643,
  ep_Q2_024_partial_15_1644,
  ep_Q2_024_partial_15_1645,
  ep_Q2_024_partial_15_1646,
  ep_Q2_024_partial_15_1647,
  ep_Q2_024_partial_15_1648,
  ep_Q2_024_partial_15_1649,
  ep_Q2_024_partial_15_1650,
  ep_Q2_024_partial_15_1651,
  ep_Q2_024_partial_15_1652,
  ep_Q2_024_partial_15_1653,
  ep_Q2_024_partial_15_1654,
  ep_Q2_024_partial_15_1655,
  ep_Q2_024_partial_15_1656,
  ep_Q2_024_partial_15_1657,
  ep_Q2_024_partial_15_1658,
  ep_Q2_024_partial_15_1659,
  ep_Q2_024_partial_15_1660,
  ep_Q2_024_partial_15_1661,
  ep_Q2_024_partial_15_1662,
  ep_Q2_024_partial_15_1663,
  ep_Q2_024_partial_15_1664,
  ep_Q2_024_partial_15_1665,
  ep_Q2_024_partial_15_1666,
  ep_Q2_024_partial_15_1667,
  ep_Q2_024_partial_15_1668,
  ep_Q2_024_partial_15_1669,
  ep_Q2_024_partial_15_1670,
  ep_Q2_024_partial_15_1671,
  ep_Q2_024_partial_15_1672,
  ep_Q2_024_partial_15_1673,
  ep_Q2_024_partial_15_1674,
  ep_Q2_024_partial_15_1675,
  ep_Q2_024_partial_15_1676,
  ep_Q2_024_partial_15_1677,
  ep_Q2_024_partial_15_1678,
  ep_Q2_024_partial_15_1679,
  ep_Q2_024_partial_15_1680,
  ep_Q2_024_partial_15_1681,
  ep_Q2_024_partial_15_1682,
  ep_Q2_024_partial_15_1683,
  ep_Q2_024_partial_15_1684,
  ep_Q2_024_partial_15_1685,
  ep_Q2_024_partial_15_1686,
  ep_Q2_024_partial_15_1687,
  ep_Q2_024_partial_15_1688,
  ep_Q2_024_partial_15_1689,
  ep_Q2_024_partial_15_1690,
  ep_Q2_024_partial_15_1691,
  ep_Q2_024_partial_15_1692,
  ep_Q2_024_partial_15_1693,
  ep_Q2_024_partial_15_1694,
  ep_Q2_024_partial_15_1695,
  ep_Q2_024_partial_15_1696,
  ep_Q2_024_partial_15_1697,
  ep_Q2_024_partial_15_1698,
  ep_Q2_024_partial_15_1699
]

/-- Sum of partial products in this block. -/
def ep_Q2_024_block_15_1600_1699 : Poly :=
[
  term ((2578326853107933456558538464757287301318301626202703904507 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(5, 1), (6, 1), (8, 1), (13, 1), (15, 2)],
  term ((50068166157171823 : Rat) / 3488340663459579) [(5, 1), (6, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((-8486750246624093521424296941571253888 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (6, 1), (8, 1), (13, 2), (14, 1), (15, 1)],
  term ((-295694093352879208402661767357612912640 : Rat) / 359912837220743188970008058408861780397) [(5, 1), (6, 1), (8, 1), (13, 2), (15, 1)],
  term ((16040369868892513686379320850481196705661356383014948997 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 1), (6, 1), (8, 1), (14, 1), (15, 1)],
  term ((-6917912762506132 : Rat) / 1162780221153193) [(5, 1), (6, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((674456529895393409686477352003493571793009190155093372 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 1), (6, 1), (8, 1), (14, 1), (15, 3)],
  term ((1667935482081904 : Rat) / 1162780221153193) [(5, 1), (6, 1), (8, 1), (14, 1), (15, 3), (16, 1)],
  term ((-28934963968114437263102135432304914667114125587340866313 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(5, 1), (6, 1), (8, 1), (15, 1)],
  term ((-90308213195446 : Rat) / 1162780221153193) [(5, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((-596292272370210102731177090662239802901212841340772628921 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(5, 1), (6, 1), (8, 1), (15, 3)],
  term ((-11177629529470399 : Rat) / 3488340663459579) [(5, 1), (6, 1), (8, 1), (15, 3), (16, 1)],
  term ((236823465392436826628713367882961865264 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (6, 1), (9, 1)],
  term ((-10571965857019404136954466904844472478872 : Rat) / 1799564186103715944850040292044308901985) [(5, 1), (6, 1), (9, 1), (12, 1)],
  term ((16527737784929168061123148869963794329901925980398052713 : Rat) / 278999685639605945551432029250879769240203926974238414) [(5, 1), (6, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-9138159832270958 : Rat) / 1162780221153193) [(5, 1), (6, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1399197928754048569331968958738981057912 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (6, 1), (9, 1), (12, 1), (13, 2), (14, 1)],
  term ((122164413704195319887043024646064337128 : Rat) / 39990315246749243218889784267651308933) [(5, 1), (6, 1), (9, 1), (12, 1), (14, 1)],
  term ((-57065163418514028206963760297560614190626285699065528079 : Rat) / 464999476066009909252386715418132948733673211623730690) [(5, 1), (6, 1), (9, 1), (12, 1), (14, 1), (15, 2)],
  term ((26408829814481614 : Rat) / 1162780221153193) [(5, 1), (6, 1), (9, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-41472938107317618456796491302975224272 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (6, 1), (9, 1), (12, 2)],
  term ((-2578326853107933456558538464757287301318301626202703904507 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(5, 1), (6, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((-50068166157171823 : Rat) / 3488340663459579) [(5, 1), (6, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((3362414424148325569733089263026150459960540076430602476 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (6, 1), (9, 1), (13, 1), (14, 2), (15, 1)],
  term ((1667935482081904 : Rat) / 1162780221153193) [(5, 1), (6, 1), (9, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((262194352093689976652062881408140718032 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (6, 1), (9, 1), (13, 1), (15, 1)],
  term ((295694093352879208402661767357612912640 : Rat) / 359912837220743188970008058408861780397) [(5, 1), (6, 1), (9, 1), (13, 2), (14, 1)],
  term ((8486750246624093521424296941571253888 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (6, 1), (9, 1), (13, 2), (14, 2)],
  term ((-9314740434487461952319626479508361209802 : Rat) / 1799564186103715944850040292044308901985) [(5, 1), (6, 1), (9, 1), (14, 1)],
  term ((596292272370210102731177090662239802901212841340772628921 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(5, 1), (6, 1), (9, 1), (14, 1), (15, 2)],
  term ((11177629529470399 : Rat) / 3488340663459579) [(5, 1), (6, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((3948988381875726760508185512483442352 : Rat) / 39990315246749243218889784267651308933) [(5, 1), (6, 1), (9, 1), (14, 2)],
  term ((-674456529895393409686477352003493571793009190155093372 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 1), (6, 1), (9, 1), (14, 2), (15, 2)],
  term ((-1667935482081904 : Rat) / 1162780221153193) [(5, 1), (6, 1), (9, 1), (14, 2), (15, 2), (16, 1)],
  term ((-3457567809821648964693558454914262033925753474640006559 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (6, 1), (9, 1), (15, 2)],
  term ((1196701779202068 : Rat) / 1162780221153193) [(5, 1), (6, 1), (9, 1), (15, 2), (16, 1)],
  term ((-103833365465174319512687156733965217376 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (6, 1), (9, 2), (12, 1), (13, 1), (14, 1)],
  term ((1039580155015270728493428476909863160535056308364822926 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 1), (6, 1), (9, 2), (12, 1), (14, 1), (15, 1)],
  term ((-1701914309157880 : Rat) / 1162780221153193) [(5, 1), (6, 1), (9, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((3447055164770127767181361970446946249072 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (6, 1), (9, 2), (13, 1), (14, 1)],
  term ((7675385243963141408137667690864300172280263604081481818 : Rat) / 46499947606600990925238671541813294873367321162373069) [(5, 1), (6, 1), (9, 2), (14, 1), (15, 1)],
  term ((-23523905752088408 : Rat) / 1162780221153193) [(5, 1), (6, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((63112532186469946331305143931700421056 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (6, 1), (9, 2), (15, 1)],
  term ((-103288609118247007750991312667275960176 : Rat) / 119970945740247729656669352802953926799) [(5, 1), (6, 1), (9, 3), (14, 1)],
  term ((349932281624983451981531254766853737984 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (6, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((32353000969407719280652367219495481640248766956944768212 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (6, 1), (11, 1), (12, 1), (15, 2)],
  term ((231888867627920 : Rat) / 1162780221153193) [(5, 1), (6, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-87483070406245862995382813691713434496 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (6, 1), (11, 1), (13, 1), (15, 1)],
  term ((-488150134807348973735746546824721247352 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (6, 1), (11, 1), (14, 1)],
  term ((-8088250242351929820163091804873870410062191739236192053 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (6, 1), (11, 1), (15, 2)],
  term ((-57972216906980 : Rat) / 1162780221153193) [(5, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((-1324005515194134529216440114537013970104 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (6, 1), (12, 1), (13, 1)],
  term ((1098155690500335307488339816651802911664 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (6, 1), (12, 1), (13, 1), (14, 1)],
  term ((8486750246624093521424296941571253888 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (6, 1), (12, 1), (13, 1), (14, 2)],
  term ((-1769330243807449728060631429964960390554328216813178592 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 1), (6, 1), (12, 1), (13, 1), (15, 2)],
  term ((1796510217718400 : Rat) / 1162780221153193) [(5, 1), (6, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-93212013096392473427083411308443024896 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (6, 1), (12, 1), (13, 2), (15, 1)],
  term ((13325395970905434867319386254491882365609830716424875713 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 1), (6, 1), (12, 1), (14, 1), (15, 1)],
  term ((-27540157517926724 : Rat) / 1162780221153193) [(5, 1), (6, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((674456529895393409686477352003493571793009190155093372 : Rat) / 46499947606600990925238671541813294873367321162373069) [(5, 1), (6, 1), (12, 1), (14, 2), (15, 1)],
  term ((5003806446245712 : Rat) / 1162780221153193) [(5, 1), (6, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((3641714571500150191785867742365770680679315960540555006 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 1), (6, 1), (12, 1), (15, 1)],
  term ((4207569239182680 : Rat) / 1162780221153193) [(5, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((2822057777800854946396771204065288066360103383629673028 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 1), (6, 1), (12, 1), (15, 3)],
  term ((6447190534260720 : Rat) / 1162780221153193) [(5, 1), (6, 1), (12, 1), (15, 3), (16, 1)],
  term ((428239714678546883668731925458122081936 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (6, 1), (12, 2), (13, 1)],
  term ((44741039465109071923402142474522467712 : Rat) / 119970945740247729656669352802953926799) [(5, 1), (6, 1), (12, 2), (13, 1), (14, 1)],
  term ((1422526770560142681406634024494915095373669574068378424 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (6, 1), (12, 2), (14, 1), (15, 1)],
  term ((3888863819396960 : Rat) / 1162780221153193) [(5, 1), (6, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-39928184993026203984071397564377602754691384903564657986 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (6, 1), (12, 2), (15, 1)],
  term ((7417766104184 : Rat) / 1162780221153193) [(5, 1), (6, 1), (12, 2), (15, 1), (16, 1)],
  term ((-197773517925461086681542750109224956096 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (6, 1), (12, 3), (13, 1)],
  term ((275432246057193493929193356776318159040002368080218408 : Rat) / 46499947606600990925238671541813294873367321162373069) [(5, 1), (6, 1), (12, 3), (15, 1)],
  term ((2538406922518624 : Rat) / 1162780221153193) [(5, 1), (6, 1), (12, 3), (15, 1), (16, 1)],
  term ((-8913305390748042853879655868088006102 : Rat) / 119970945740247729656669352802953926799) [(5, 1), (6, 1), (13, 1)],
  term ((38149880781043899208840969932657346328 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (6, 1), (13, 1), (14, 1)],
  term ((-139255858330061268206765092910401941904 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (6, 1), (13, 1), (14, 2)],
  term ((-1362806007640155222416231771176169796911687781255882802 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 1), (6, 1), (13, 1), (15, 2)],
  term ((-477267730146856 : Rat) / 1162780221153193) [(5, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((124436155722667828870994851439736827504 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (6, 1), (13, 2), (15, 1)],
  term ((-7816279289600243297998921465199139927134874863176071983 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 1), (6, 1), (14, 1), (15, 1)],
  term ((17466879157988700 : Rat) / 1162780221153193) [(5, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2932962448615325597563619362738367662789015208397428717 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 1), (6, 1), (14, 2), (15, 1)],
  term ((-5213243225601460 : Rat) / 1162780221153193) [(5, 1), (6, 1), (14, 2), (15, 1), (16, 1)],
  term ((8701879192366389091177240959372835299408749675119996827 : Rat) / 464999476066009909252386715418132948733673211623730690) [(5, 1), (6, 1), (15, 1)],
  term ((-2772838151047862 : Rat) / 1162780221153193) [(5, 1), (6, 1), (15, 1), (16, 1)],
  term ((5438065294908516452060766208644677267388586863877549987 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (6, 1), (15, 3)],
  term ((-2676908167036388 : Rat) / 1162780221153193) [(5, 1), (6, 1), (15, 3), (16, 1)],
  term ((-2578326853107933456558538464757287301318301626202703904507 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(5, 1), (8, 1), (13, 1), (15, 2)],
  term ((-50068166157171823 : Rat) / 6976681326919158) [(5, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (8, 1), (13, 2), (14, 1), (15, 1)],
  term ((147847046676439604201330883678806456320 : Rat) / 359912837220743188970008058408861780397) [(5, 1), (8, 1), (13, 2), (15, 1)],
  term ((-16040369868892513686379320850481196705661356383014948997 : Rat) / 464999476066009909252386715418132948733673211623730690) [(5, 1), (8, 1), (14, 1), (15, 1)],
  term ((3458956381253066 : Rat) / 1162780221153193) [(5, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 1), (8, 1), (14, 1), (15, 3)],
  term ((-833967741040952 : Rat) / 1162780221153193) [(5, 1), (8, 1), (14, 1), (15, 3), (16, 1)],
  term ((28934963968114437263102135432304914667114125587340866313 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(5, 1), (8, 1), (15, 1)],
  term ((45154106597723 : Rat) / 1162780221153193) [(5, 1), (8, 1), (15, 1), (16, 1)],
  term ((596292272370210102731177090662239802901212841340772628921 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(5, 1), (8, 1), (15, 3)],
  term ((11177629529470399 : Rat) / 6976681326919158) [(5, 1), (8, 1), (15, 3), (16, 1)],
  term ((-118411732696218413314356683941480932632 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (9, 1)],
  term ((5285982928509702068477233452422236239436 : Rat) / 1799564186103715944850040292044308901985) [(5, 1), (9, 1), (12, 1)],
  term ((-16527737784929168061123148869963794329901925980398052713 : Rat) / 557999371279211891102864058501759538480407853948476828) [(5, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((4569079916135479 : Rat) / 1162780221153193) [(5, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((699598964377024284665984479369490528956 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (9, 1), (12, 1), (13, 2), (14, 1)],
  term ((-61082206852097659943521512323032168564 : Rat) / 39990315246749243218889784267651308933) [(5, 1), (9, 1), (12, 1), (14, 1)],
  term ((57065163418514028206963760297560614190626285699065528079 : Rat) / 929998952132019818504773430836265897467346423247461380) [(5, 1), (9, 1), (12, 1), (14, 1), (15, 2)],
  term ((-13204414907240807 : Rat) / 1162780221153193) [(5, 1), (9, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((20736469053658809228398245651487612136 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (9, 1), (12, 2)],
  term ((2578326853107933456558538464757287301318301626202703904507 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(5, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((50068166157171823 : Rat) / 6976681326919158) [(5, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1681207212074162784866544631513075229980270038215301238 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (9, 1), (13, 1), (14, 2), (15, 1)],
  term ((-833967741040952 : Rat) / 1162780221153193) [(5, 1), (9, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-131097176046844988326031440704070359016 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (9, 1), (13, 1), (15, 1)],
  term ((-147847046676439604201330883678806456320 : Rat) / 359912837220743188970008058408861780397) [(5, 1), (9, 1), (13, 2), (14, 1)],
  term ((-4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (9, 1), (13, 2), (14, 2)],
  term ((4657370217243730976159813239754180604901 : Rat) / 1799564186103715944850040292044308901985) [(5, 1), (9, 1), (14, 1)],
  term ((-596292272370210102731177090662239802901212841340772628921 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(5, 1), (9, 1), (14, 1), (15, 2)],
  term ((-11177629529470399 : Rat) / 6976681326919158) [(5, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1974494190937863380254092756241721176 : Rat) / 39990315246749243218889784267651308933) [(5, 1), (9, 1), (14, 2)],
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 1), (9, 1), (14, 2), (15, 2)],
  term ((833967741040952 : Rat) / 1162780221153193) [(5, 1), (9, 1), (14, 2), (15, 2), (16, 1)],
  term ((3457567809821648964693558454914262033925753474640006559 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(5, 1), (9, 1), (15, 2)],
  term ((-598350889601034 : Rat) / 1162780221153193) [(5, 1), (9, 1), (15, 2), (16, 1)],
  term ((51916682732587159756343578366982608688 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (9, 2), (12, 1), (13, 1), (14, 1)],
  term ((-519790077507635364246714238454931580267528154182411463 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 1), (9, 2), (12, 1), (14, 1), (15, 1)],
  term ((850957154578940 : Rat) / 1162780221153193) [(5, 1), (9, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1723527582385063883590680985223473124536 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (9, 2), (13, 1), (14, 1)],
  term ((-3837692621981570704068833845432150086140131802040740909 : Rat) / 46499947606600990925238671541813294873367321162373069) [(5, 1), (9, 2), (14, 1), (15, 1)],
  term ((11761952876044204 : Rat) / 1162780221153193) [(5, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((-31556266093234973165652571965850210528 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (9, 2), (15, 1)],
  term ((51644304559123503875495656333637980088 : Rat) / 119970945740247729656669352802953926799) [(5, 1), (9, 3), (14, 1)],
  term ((-174966140812491725990765627383426868992 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-16176500484703859640326183609747740820124383478472384106 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (11, 1), (12, 1), (15, 2)],
  term ((-115944433813960 : Rat) / 1162780221153193) [(5, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((43741535203122931497691406845856717248 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (11, 1), (13, 1), (15, 1)],
  term ((244075067403674486867873273412360623676 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (11, 1), (14, 1)],
  term ((8088250242351929820163091804873870410062191739236192053 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(5, 1), (11, 1), (15, 2)],
  term ((28986108453490 : Rat) / 1162780221153193) [(5, 1), (11, 1), (15, 2), (16, 1)],
  term ((662002757597067264608220057268506985052 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (12, 1), (13, 1)],
  term ((-549077845250167653744169908325901455832 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (12, 1), (13, 1), (14, 1)],
  term ((-4243375123312046760712148470785626944 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (12, 1), (13, 1), (14, 2)],
  term ((884665121903724864030315714982480195277164108406589296 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 1), (12, 1), (13, 1), (15, 2)],
  term ((-898255108859200 : Rat) / 1162780221153193) [(5, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((46606006548196236713541705654221512448 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (12, 1), (13, 2), (15, 1)],
  term ((-13325395970905434867319386254491882365609830716424875713 : Rat) / 464999476066009909252386715418132948733673211623730690) [(5, 1), (12, 1), (14, 1), (15, 1)],
  term ((13770078758963362 : Rat) / 1162780221153193) [(5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 46499947606600990925238671541813294873367321162373069) [(5, 1), (12, 1), (14, 2), (15, 1)],
  term ((-2501903223122856 : Rat) / 1162780221153193) [(5, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1820857285750075095892933871182885340339657980270277503 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 1), (12, 1), (15, 1)],
  term ((-2103784619591340 : Rat) / 1162780221153193) [(5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1411028888900427473198385602032644033180051691814836514 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 1), (12, 1), (15, 3)],
  term ((-3223595267130360 : Rat) / 1162780221153193) [(5, 1), (12, 1), (15, 3), (16, 1)],
  term ((-214119857339273441834365962729061040968 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (12, 2), (13, 1)],
  term ((-22370519732554535961701071237261233856 : Rat) / 119970945740247729656669352802953926799) [(5, 1), (12, 2), (13, 1), (14, 1)],
  term ((-711263385280071340703317012247457547686834787034189212 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (12, 2), (14, 1), (15, 1)],
  term ((-1944431909698480 : Rat) / 1162780221153193) [(5, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((19964092496513101992035698782188801377345692451782328993 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (12, 2), (15, 1)],
  term ((-3708883052092 : Rat) / 1162780221153193) [(5, 1), (12, 2), (15, 1), (16, 1)],
  term ((98886758962730543340771375054612478048 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (12, 3), (13, 1)],
  term ((-137716123028596746964596678388159079520001184040109204 : Rat) / 46499947606600990925238671541813294873367321162373069) [(5, 1), (12, 3), (15, 1)],
  term ((-1269203461259312 : Rat) / 1162780221153193) [(5, 1), (12, 3), (15, 1), (16, 1)],
  term ((4456652695374021426939827934044003051 : Rat) / 119970945740247729656669352802953926799) [(5, 1), (13, 1)],
  term ((-19074940390521949604420484966328673164 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (13, 1), (14, 1)],
  term ((69627929165030634103382546455200970952 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (13, 1), (14, 2)],
  term ((681403003820077611208115885588084898455843890627941401 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 1), (13, 1), (15, 2)],
  term ((238633865073428 : Rat) / 1162780221153193) [(5, 1), (13, 1), (15, 2), (16, 1)],
  term ((-62218077861333914435497425719868413752 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (13, 2), (15, 1)],
  term ((7816279289600243297998921465199139927134874863176071983 : Rat) / 464999476066009909252386715418132948733673211623730690) [(5, 1), (14, 1), (15, 1)],
  term ((-8733439578994350 : Rat) / 1162780221153193) [(5, 1), (14, 1), (15, 1), (16, 1)],
  term ((2932962448615325597563619362738367662789015208397428717 : Rat) / 278999685639605945551432029250879769240203926974238414) [(5, 1), (14, 2), (15, 1)],
  term ((2606621612800730 : Rat) / 1162780221153193) [(5, 1), (14, 2), (15, 1), (16, 1)],
  term ((-8701879192366389091177240959372835299408749675119996827 : Rat) / 929998952132019818504773430836265897467346423247461380) [(5, 1), (15, 1)],
  term ((1386419075523931 : Rat) / 1162780221153193) [(5, 1), (15, 1), (16, 1)],
  term ((-5438065294908516452060766208644677267388586863877549987 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(5, 1), (15, 3)],
  term ((1338454083518194 : Rat) / 1162780221153193) [(5, 1), (15, 3), (16, 1)],
  term ((108527865897635204440923906776011627033 : Rat) / 399903152467492432188897842676513089330) [(5, 2)],
  term ((-47284778305714598658178901405742087504 : Rat) / 199951576233746216094448921338256544665) [(5, 2), (6, 1), (8, 1), (9, 1), (15, 1)],
  term ((-395389020476533643914391115102508865632 : Rat) / 599854728701238648283346764014769633995) [(5, 2), (6, 1), (8, 1), (13, 1), (15, 1)],
  term ((-10460153440353640239364216033345552355107017253883220276 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 2), (6, 1), (8, 1), (15, 2)],
  term ((4723321048444112 : Rat) / 1162780221153193) [(5, 2), (6, 1), (8, 1), (15, 2), (16, 1)],
  term ((395389020476533643914391115102508865632 : Rat) / 599854728701238648283346764014769633995) [(5, 2), (6, 1), (9, 1), (13, 1), (14, 1)],
  term ((10460153440353640239364216033345552355107017253883220276 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 2), (6, 1), (9, 1), (14, 1), (15, 1)],
  term ((16890983628896808743407603036576568848 : Rat) / 199951576233746216094448921338256544665) [(5, 2), (6, 1), (9, 1), (15, 1)],
  term ((20220074797511964466058292860462341536 : Rat) / 199951576233746216094448921338256544665) [(5, 2), (6, 1), (13, 1), (15, 1)],
  term ((-1086812258876365631714711692878661467835285345215957824 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 2), (6, 1), (15, 2)],
  term ((-103470768511616 : Rat) / 1162780221153193) [(5, 2), (6, 1), (15, 2), (16, 1)],
  term ((-217055731795270408881847813552023254066 : Rat) / 199951576233746216094448921338256544665) [(5, 2), (6, 2)],
  term ((-33781967257793617486815206073153137696 : Rat) / 199951576233746216094448921338256544665) [(5, 2), (6, 2), (9, 1), (15, 1)],
  term ((-40440149595023928932116585720924683072 : Rat) / 199951576233746216094448921338256544665) [(5, 2), (6, 2), (13, 1), (15, 1)],
  term ((2173624517752731263429423385757322935670570690431915648 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 2), (6, 2), (15, 2)],
  term ((206941537023232 : Rat) / 1162780221153193) [(5, 2), (6, 2), (15, 2), (16, 1)],
  term ((23642389152857299329089450702871043752 : Rat) / 199951576233746216094448921338256544665) [(5, 2), (8, 1), (9, 1), (15, 1)],
  term ((197694510238266821957195557551254432816 : Rat) / 599854728701238648283346764014769633995) [(5, 2), (8, 1), (13, 1), (15, 1)],
  term ((5230076720176820119682108016672776177553508626941610138 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 2), (8, 1), (15, 2)],
  term ((-2361660524222056 : Rat) / 1162780221153193) [(5, 2), (8, 1), (15, 2), (16, 1)],
  term ((-197694510238266821957195557551254432816 : Rat) / 599854728701238648283346764014769633995) [(5, 2), (9, 1), (13, 1), (14, 1)],
  term ((-5230076720176820119682108016672776177553508626941610138 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 2), (9, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 15, terms 1600 through 1699. -/
theorem ep_Q2_024_block_15_1600_1699_valid :
    checkProductSumEq ep_Q2_024_partials_15_1600_1699
      ep_Q2_024_block_15_1600_1699 = true := by
  native_decide

end EpQ2024TermShards

end Patterns

end EndpointCertificate

end Problem97
