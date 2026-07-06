/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_020, term block 21:600-693

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_020`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2020TermShards

/-- Generator polynomial 21 for endpoint certificate `ep_Q2_020`. -/
def ep_Q2_020_generator_21_0600_0693 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(10, 1)]
]

/-- Coefficient term 600 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0600 : Poly :=
[
  term ((-52941187292021250 : Rat) / 28298395017400811) [(8, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 600 for generator 21. -/
def ep_Q2_020_partial_21_0600 : Poly :=
[
  term ((-105882374584042500 : Rat) / 28298395017400811) [(8, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((52941187292021250 : Rat) / 28298395017400811) [(8, 1), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 600 for generator 21. -/
theorem ep_Q2_020_partial_21_0600_valid :
    mulPoly ep_Q2_020_coefficient_21_0600
        ep_Q2_020_generator_21_0600_0693 =
      ep_Q2_020_partial_21_0600 := by
  native_decide

/-- Coefficient term 601 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0601 : Poly :=
[
  term ((-1427760539524453497 : Rat) / 56596790034801622) [(8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 601 for generator 21. -/
def ep_Q2_020_partial_21_0601 : Poly :=
[
  term ((-1427760539524453497 : Rat) / 28298395017400811) [(8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((1427760539524453497 : Rat) / 56596790034801622) [(8, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 601 for generator 21. -/
theorem ep_Q2_020_partial_21_0601_valid :
    mulPoly ep_Q2_020_coefficient_21_0601
        ep_Q2_020_generator_21_0600_0693 =
      ep_Q2_020_partial_21_0601 := by
  native_decide

/-- Coefficient term 602 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0602 : Poly :=
[
  term ((1192382656777920 : Rat) / 1230365000756557) [(8, 1), (9, 1), (15, 3), (16, 1)]
]

/-- Partial product 602 for generator 21. -/
def ep_Q2_020_partial_21_0602 : Poly :=
[
  term ((2384765313555840 : Rat) / 1230365000756557) [(8, 1), (9, 1), (10, 1), (15, 3), (16, 1)],
  term ((-1192382656777920 : Rat) / 1230365000756557) [(8, 1), (9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 602 for generator 21. -/
theorem ep_Q2_020_partial_21_0602_valid :
    mulPoly ep_Q2_020_coefficient_21_0602
        ep_Q2_020_generator_21_0600_0693 =
      ep_Q2_020_partial_21_0602 := by
  native_decide

/-- Coefficient term 603 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0603 : Poly :=
[
  term ((16002112088689920 : Rat) / 1230365000756557) [(8, 1), (11, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 603 for generator 21. -/
def ep_Q2_020_partial_21_0603 : Poly :=
[
  term ((32004224177379840 : Rat) / 1230365000756557) [(8, 1), (10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-16002112088689920 : Rat) / 1230365000756557) [(8, 1), (11, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 603 for generator 21. -/
theorem ep_Q2_020_partial_21_0603_valid :
    mulPoly ep_Q2_020_coefficient_21_0603
        ep_Q2_020_generator_21_0600_0693 =
      ep_Q2_020_partial_21_0603 := by
  native_decide

/-- Coefficient term 604 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0604 : Poly :=
[
  term ((-203186661821118000 : Rat) / 28298395017400811) [(8, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 604 for generator 21. -/
def ep_Q2_020_partial_21_0604 : Poly :=
[
  term ((-406373323642236000 : Rat) / 28298395017400811) [(8, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((203186661821118000 : Rat) / 28298395017400811) [(8, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 604 for generator 21. -/
theorem ep_Q2_020_partial_21_0604_valid :
    mulPoly ep_Q2_020_coefficient_21_0604
        ep_Q2_020_generator_21_0600_0693 =
      ep_Q2_020_partial_21_0604 := by
  native_decide

/-- Coefficient term 605 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0605 : Poly :=
[
  term ((10393361922360000 : Rat) / 28298395017400811) [(8, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 605 for generator 21. -/
def ep_Q2_020_partial_21_0605 : Poly :=
[
  term ((20786723844720000 : Rat) / 28298395017400811) [(8, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-10393361922360000 : Rat) / 28298395017400811) [(8, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 605 for generator 21. -/
theorem ep_Q2_020_partial_21_0605_valid :
    mulPoly ep_Q2_020_coefficient_21_0605
        ep_Q2_020_generator_21_0600_0693 =
      ep_Q2_020_partial_21_0605 := by
  native_decide

/-- Coefficient term 606 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0606 : Poly :=
[
  term ((15590042883540000 : Rat) / 28298395017400811) [(8, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 606 for generator 21. -/
def ep_Q2_020_partial_21_0606 : Poly :=
[
  term ((31180085767080000 : Rat) / 28298395017400811) [(8, 1), (10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-15590042883540000 : Rat) / 28298395017400811) [(8, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 606 for generator 21. -/
theorem ep_Q2_020_partial_21_0606_valid :
    mulPoly ep_Q2_020_coefficient_21_0606
        ep_Q2_020_generator_21_0600_0693 =
      ep_Q2_020_partial_21_0606 := by
  native_decide

/-- Coefficient term 607 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0607 : Poly :=
[
  term ((-445998792457568160 : Rat) / 28298395017400811) [(8, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 607 for generator 21. -/
def ep_Q2_020_partial_21_0607 : Poly :=
[
  term ((-891997584915136320 : Rat) / 28298395017400811) [(8, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((445998792457568160 : Rat) / 28298395017400811) [(8, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 607 for generator 21. -/
theorem ep_Q2_020_partial_21_0607_valid :
    mulPoly ep_Q2_020_coefficient_21_0607
        ep_Q2_020_generator_21_0600_0693 =
      ep_Q2_020_partial_21_0607 := by
  native_decide

/-- Coefficient term 608 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0608 : Poly :=
[
  term ((476953062711168 : Rat) / 1230365000756557) [(8, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 608 for generator 21. -/
def ep_Q2_020_partial_21_0608 : Poly :=
[
  term ((953906125422336 : Rat) / 1230365000756557) [(8, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-476953062711168 : Rat) / 1230365000756557) [(8, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 608 for generator 21. -/
theorem ep_Q2_020_partial_21_0608_valid :
    mulPoly ep_Q2_020_coefficient_21_0608
        ep_Q2_020_generator_21_0600_0693 =
      ep_Q2_020_partial_21_0608 := by
  native_decide

/-- Coefficient term 609 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0609 : Poly :=
[
  term ((-134018070731204971 : Rat) / 1951613449475918) [(8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 609 for generator 21. -/
def ep_Q2_020_partial_21_0609 : Poly :=
[
  term ((-134018070731204971 : Rat) / 975806724737959) [(8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((134018070731204971 : Rat) / 1951613449475918) [(8, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 609 for generator 21. -/
theorem ep_Q2_020_partial_21_0609_valid :
    mulPoly ep_Q2_020_coefficient_21_0609
        ep_Q2_020_generator_21_0600_0693 =
      ep_Q2_020_partial_21_0609 := by
  native_decide

/-- Coefficient term 610 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0610 : Poly :=
[
  term ((715429594066752 : Rat) / 1230365000756557) [(8, 1), (11, 1), (15, 3), (16, 1)]
]

/-- Partial product 610 for generator 21. -/
def ep_Q2_020_partial_21_0610 : Poly :=
[
  term ((1430859188133504 : Rat) / 1230365000756557) [(8, 1), (10, 1), (11, 1), (15, 3), (16, 1)],
  term ((-715429594066752 : Rat) / 1230365000756557) [(8, 1), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 610 for generator 21. -/
theorem ep_Q2_020_partial_21_0610_valid :
    mulPoly ep_Q2_020_coefficient_21_0610
        ep_Q2_020_generator_21_0600_0693 =
      ep_Q2_020_partial_21_0610 := by
  native_decide

/-- Coefficient term 611 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0611 : Poly :=
[
  term ((-32004224177379840 : Rat) / 1230365000756557) [(8, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 611 for generator 21. -/
def ep_Q2_020_partial_21_0611 : Poly :=
[
  term ((-64008448354759680 : Rat) / 1230365000756557) [(8, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((32004224177379840 : Rat) / 1230365000756557) [(8, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 611 for generator 21. -/
theorem ep_Q2_020_partial_21_0611_valid :
    mulPoly ep_Q2_020_coefficient_21_0611
        ep_Q2_020_generator_21_0600_0693 =
      ep_Q2_020_partial_21_0611 := by
  native_decide

/-- Coefficient term 612 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0612 : Poly :=
[
  term ((6745411801148508 : Rat) / 975806724737959) [(8, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 612 for generator 21. -/
def ep_Q2_020_partial_21_0612 : Poly :=
[
  term ((13490823602297016 : Rat) / 975806724737959) [(8, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-6745411801148508 : Rat) / 975806724737959) [(8, 1), (12, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 612 for generator 21. -/
theorem ep_Q2_020_partial_21_0612_valid :
    mulPoly ep_Q2_020_coefficient_21_0612
        ep_Q2_020_generator_21_0600_0693 =
      ep_Q2_020_partial_21_0612 := by
  native_decide

/-- Coefficient term 613 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0613 : Poly :=
[
  term ((406373323642236000 : Rat) / 28298395017400811) [(8, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 613 for generator 21. -/
def ep_Q2_020_partial_21_0613 : Poly :=
[
  term ((812746647284472000 : Rat) / 28298395017400811) [(8, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-406373323642236000 : Rat) / 28298395017400811) [(8, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 613 for generator 21. -/
theorem ep_Q2_020_partial_21_0613_valid :
    mulPoly ep_Q2_020_coefficient_21_0613
        ep_Q2_020_generator_21_0600_0693 =
      ep_Q2_020_partial_21_0613 := by
  native_decide

/-- Coefficient term 614 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0614 : Poly :=
[
  term ((-11692532162655000 : Rat) / 28298395017400811) [(8, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 614 for generator 21. -/
def ep_Q2_020_partial_21_0614 : Poly :=
[
  term ((-23385064325310000 : Rat) / 28298395017400811) [(8, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((11692532162655000 : Rat) / 28298395017400811) [(8, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 614 for generator 21. -/
theorem ep_Q2_020_partial_21_0614_valid :
    mulPoly ep_Q2_020_coefficient_21_0614
        ep_Q2_020_generator_21_0600_0693 =
      ep_Q2_020_partial_21_0614 := by
  native_decide

/-- Coefficient term 615 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0615 : Poly :=
[
  term ((-1679881632094967847 : Rat) / 113193580069603244) [(8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 615 for generator 21. -/
def ep_Q2_020_partial_21_0615 : Poly :=
[
  term ((-1679881632094967847 : Rat) / 56596790034801622) [(8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((1679881632094967847 : Rat) / 113193580069603244) [(8, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 615 for generator 21. -/
theorem ep_Q2_020_partial_21_0615_valid :
    mulPoly ep_Q2_020_coefficient_21_0615
        ep_Q2_020_generator_21_0600_0693 =
      ep_Q2_020_partial_21_0615 := by
  native_decide

/-- Coefficient term 616 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0616 : Poly :=
[
  term ((8001056044344960 : Rat) / 1230365000756557) [(8, 1), (13, 2), (16, 1)]
]

/-- Partial product 616 for generator 21. -/
def ep_Q2_020_partial_21_0616 : Poly :=
[
  term ((16002112088689920 : Rat) / 1230365000756557) [(8, 1), (10, 1), (13, 2), (16, 1)],
  term ((-8001056044344960 : Rat) / 1230365000756557) [(8, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 616 for generator 21. -/
theorem ep_Q2_020_partial_21_0616_valid :
    mulPoly ep_Q2_020_coefficient_21_0616
        ep_Q2_020_generator_21_0600_0693 =
      ep_Q2_020_partial_21_0616 := by
  native_decide

/-- Coefficient term 617 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0617 : Poly :=
[
  term ((-536572195550064 : Rat) / 1230365000756557) [(8, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 617 for generator 21. -/
def ep_Q2_020_partial_21_0617 : Poly :=
[
  term ((-1073144391100128 : Rat) / 1230365000756557) [(8, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((536572195550064 : Rat) / 1230365000756557) [(8, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 617 for generator 21. -/
theorem ep_Q2_020_partial_21_0617_valid :
    mulPoly ep_Q2_020_coefficient_21_0617
        ep_Q2_020_generator_21_0600_0693 =
      ep_Q2_020_partial_21_0617 := by
  native_decide

/-- Coefficient term 618 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0618 : Poly :=
[
  term ((-2540996289813398209 : Rat) / 113193580069603244) [(8, 1), (14, 1), (16, 1)]
]

/-- Partial product 618 for generator 21. -/
def ep_Q2_020_partial_21_0618 : Poly :=
[
  term ((-2540996289813398209 : Rat) / 56596790034801622) [(8, 1), (10, 1), (14, 1), (16, 1)],
  term ((2540996289813398209 : Rat) / 113193580069603244) [(8, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 618 for generator 21. -/
theorem ep_Q2_020_partial_21_0618_valid :
    mulPoly ep_Q2_020_coefficient_21_0618
        ep_Q2_020_generator_21_0600_0693 =
      ep_Q2_020_partial_21_0618 := by
  native_decide

/-- Coefficient term 619 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0619 : Poly :=
[
  term ((276751775050837038 : Rat) / 28298395017400811) [(8, 1), (14, 2), (16, 1)]
]

/-- Partial product 619 for generator 21. -/
def ep_Q2_020_partial_21_0619 : Poly :=
[
  term ((553503550101674076 : Rat) / 28298395017400811) [(8, 1), (10, 1), (14, 2), (16, 1)],
  term ((-276751775050837038 : Rat) / 28298395017400811) [(8, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 619 for generator 21. -/
theorem ep_Q2_020_partial_21_0619_valid :
    mulPoly ep_Q2_020_coefficient_21_0619
        ep_Q2_020_generator_21_0600_0693 =
      ep_Q2_020_partial_21_0619 := by
  native_decide

/-- Coefficient term 620 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0620 : Poly :=
[
  term ((-1339434607813939896 : Rat) / 28298395017400811) [(8, 1), (15, 2), (16, 1)]
]

/-- Partial product 620 for generator 21. -/
def ep_Q2_020_partial_21_0620 : Poly :=
[
  term ((-2678869215627879792 : Rat) / 28298395017400811) [(8, 1), (10, 1), (15, 2), (16, 1)],
  term ((1339434607813939896 : Rat) / 28298395017400811) [(8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 620 for generator 21. -/
theorem ep_Q2_020_partial_21_0620_valid :
    mulPoly ep_Q2_020_coefficient_21_0620
        ep_Q2_020_generator_21_0600_0693 =
      ep_Q2_020_partial_21_0620 := by
  native_decide

/-- Coefficient term 621 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0621 : Poly :=
[
  term ((72487606254096515 : Rat) / 9842920006052456) [(8, 1), (16, 1)]
]

/-- Partial product 621 for generator 21. -/
def ep_Q2_020_partial_21_0621 : Poly :=
[
  term ((72487606254096515 : Rat) / 4921460003026228) [(8, 1), (10, 1), (16, 1)],
  term ((-72487606254096515 : Rat) / 9842920006052456) [(8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 621 for generator 21. -/
theorem ep_Q2_020_partial_21_0621_valid :
    mulPoly ep_Q2_020_coefficient_21_0621
        ep_Q2_020_generator_21_0600_0693 =
      ep_Q2_020_partial_21_0621 := by
  native_decide

/-- Coefficient term 622 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0622 : Poly :=
[
  term ((14290872643245000 : Rat) / 28298395017400811) [(9, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 622 for generator 21. -/
def ep_Q2_020_partial_21_0622 : Poly :=
[
  term ((-14290872643245000 : Rat) / 28298395017400811) [(9, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((28581745286490000 : Rat) / 28298395017400811) [(9, 1), (10, 2), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 622 for generator 21. -/
theorem ep_Q2_020_partial_21_0622_valid :
    mulPoly ep_Q2_020_coefficient_21_0622
        ep_Q2_020_generator_21_0600_0693 =
      ep_Q2_020_partial_21_0622 := by
  native_decide

/-- Coefficient term 623 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0623 : Poly :=
[
  term ((655810461227856 : Rat) / 1230365000756557) [(9, 1), (10, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 623 for generator 21. -/
def ep_Q2_020_partial_21_0623 : Poly :=
[
  term ((-655810461227856 : Rat) / 1230365000756557) [(9, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((1311620922455712 : Rat) / 1230365000756557) [(9, 1), (10, 2), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 623 for generator 21. -/
theorem ep_Q2_020_partial_21_0623_valid :
    mulPoly ep_Q2_020_coefficient_21_0623
        ep_Q2_020_generator_21_0600_0693 =
      ep_Q2_020_partial_21_0623 := by
  native_decide

/-- Coefficient term 624 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0624 : Poly :=
[
  term ((-16002112088689920 : Rat) / 1230365000756557) [(9, 1), (10, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 624 for generator 21. -/
def ep_Q2_020_partial_21_0624 : Poly :=
[
  term ((16002112088689920 : Rat) / 1230365000756557) [(9, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-32004224177379840 : Rat) / 1230365000756557) [(9, 1), (10, 2), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 624 for generator 21. -/
theorem ep_Q2_020_partial_21_0624_valid :
    mulPoly ep_Q2_020_coefficient_21_0624
        ep_Q2_020_generator_21_0600_0693 =
      ep_Q2_020_partial_21_0624 := by
  native_decide

/-- Coefficient term 625 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0625 : Poly :=
[
  term ((203186661821118000 : Rat) / 28298395017400811) [(9, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 625 for generator 21. -/
def ep_Q2_020_partial_21_0625 : Poly :=
[
  term ((-203186661821118000 : Rat) / 28298395017400811) [(9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((406373323642236000 : Rat) / 28298395017400811) [(9, 1), (10, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 625 for generator 21. -/
theorem ep_Q2_020_partial_21_0625_valid :
    mulPoly ep_Q2_020_coefficient_21_0625
        ep_Q2_020_generator_21_0600_0693 =
      ep_Q2_020_partial_21_0625 := by
  native_decide

/-- Coefficient term 626 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0626 : Poly :=
[
  term ((-3247925600737500 : Rat) / 28298395017400811) [(9, 1), (10, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 626 for generator 21. -/
def ep_Q2_020_partial_21_0626 : Poly :=
[
  term ((3247925600737500 : Rat) / 28298395017400811) [(9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-6495851201475000 : Rat) / 28298395017400811) [(9, 1), (10, 2), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 626 for generator 21. -/
theorem ep_Q2_020_partial_21_0626_valid :
    mulPoly ep_Q2_020_coefficient_21_0626
        ep_Q2_020_generator_21_0600_0693 =
      ep_Q2_020_partial_21_0626 := by
  native_decide

/-- Coefficient term 627 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0627 : Poly :=
[
  term ((-12991702402950000 : Rat) / 28298395017400811) [(9, 1), (10, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 627 for generator 21. -/
def ep_Q2_020_partial_21_0627 : Poly :=
[
  term ((12991702402950000 : Rat) / 28298395017400811) [(9, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-25983404805900000 : Rat) / 28298395017400811) [(9, 1), (10, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 627 for generator 21. -/
theorem ep_Q2_020_partial_21_0627_valid :
    mulPoly ep_Q2_020_coefficient_21_0627
        ep_Q2_020_generator_21_0600_0693 =
      ep_Q2_020_partial_21_0627 := by
  native_decide

/-- Coefficient term 628 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0628 : Poly :=
[
  term ((10790879860896510 : Rat) / 690204756521971) [(9, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 628 for generator 21. -/
def ep_Q2_020_partial_21_0628 : Poly :=
[
  term ((-10790879860896510 : Rat) / 690204756521971) [(9, 1), (10, 1), (13, 1), (16, 1)],
  term ((21581759721793020 : Rat) / 690204756521971) [(9, 1), (10, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 628 for generator 21. -/
theorem ep_Q2_020_partial_21_0628_valid :
    mulPoly ep_Q2_020_coefficient_21_0628
        ep_Q2_020_generator_21_0600_0693 =
      ep_Q2_020_partial_21_0628 := by
  native_decide

/-- Coefficient term 629 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0629 : Poly :=
[
  term ((-149047832097240 : Rat) / 1230365000756557) [(9, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 629 for generator 21. -/
def ep_Q2_020_partial_21_0629 : Poly :=
[
  term ((149047832097240 : Rat) / 1230365000756557) [(9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-298095664194480 : Rat) / 1230365000756557) [(9, 1), (10, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 629 for generator 21. -/
theorem ep_Q2_020_partial_21_0629_valid :
    mulPoly ep_Q2_020_coefficient_21_0629
        ep_Q2_020_generator_21_0600_0693 =
      ep_Q2_020_partial_21_0629 := by
  native_decide

/-- Coefficient term 630 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0630 : Poly :=
[
  term ((-3588358379297949 : Rat) / 1230365000756557) [(9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 630 for generator 21. -/
def ep_Q2_020_partial_21_0630 : Poly :=
[
  term ((3588358379297949 : Rat) / 1230365000756557) [(9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-7176716758595898 : Rat) / 1230365000756557) [(9, 1), (10, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 630 for generator 21. -/
theorem ep_Q2_020_partial_21_0630_valid :
    mulPoly ep_Q2_020_coefficient_21_0630
        ep_Q2_020_generator_21_0600_0693 =
      ep_Q2_020_partial_21_0630 := by
  native_decide

/-- Coefficient term 631 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0631 : Poly :=
[
  term ((-596191328388960 : Rat) / 1230365000756557) [(9, 1), (10, 1), (15, 3), (16, 1)]
]

/-- Partial product 631 for generator 21. -/
def ep_Q2_020_partial_21_0631 : Poly :=
[
  term ((596191328388960 : Rat) / 1230365000756557) [(9, 1), (10, 1), (15, 3), (16, 1)],
  term ((-1192382656777920 : Rat) / 1230365000756557) [(9, 1), (10, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 631 for generator 21. -/
theorem ep_Q2_020_partial_21_0631_valid :
    mulPoly ep_Q2_020_coefficient_21_0631
        ep_Q2_020_generator_21_0600_0693 =
      ep_Q2_020_partial_21_0631 := by
  native_decide

/-- Coefficient term 632 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0632 : Poly :=
[
  term ((-2598340480590000 : Rat) / 28298395017400811) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 632 for generator 21. -/
def ep_Q2_020_partial_21_0632 : Poly :=
[
  term ((-5196680961180000 : Rat) / 28298395017400811) [(9, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((2598340480590000 : Rat) / 28298395017400811) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 632 for generator 21. -/
theorem ep_Q2_020_partial_21_0632_valid :
    mulPoly ep_Q2_020_coefficient_21_0632
        ep_Q2_020_generator_21_0600_0693 =
      ep_Q2_020_partial_21_0632 := by
  native_decide

/-- Coefficient term 633 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0633 : Poly :=
[
  term ((7145436321622500 : Rat) / 28298395017400811) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 633 for generator 21. -/
def ep_Q2_020_partial_21_0633 : Poly :=
[
  term ((14290872643245000 : Rat) / 28298395017400811) [(9, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-7145436321622500 : Rat) / 28298395017400811) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 633 for generator 21. -/
theorem ep_Q2_020_partial_21_0633_valid :
    mulPoly ep_Q2_020_coefficient_21_0633
        ep_Q2_020_generator_21_0600_0693 =
      ep_Q2_020_partial_21_0633 := by
  native_decide

/-- Coefficient term 634 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0634 : Poly :=
[
  term ((-119238265677792 : Rat) / 1230365000756557) [(9, 1), (11, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 634 for generator 21. -/
def ep_Q2_020_partial_21_0634 : Poly :=
[
  term ((-238476531355584 : Rat) / 1230365000756557) [(9, 1), (10, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((119238265677792 : Rat) / 1230365000756557) [(9, 1), (11, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 634 for generator 21. -/
theorem ep_Q2_020_partial_21_0634_valid :
    mulPoly ep_Q2_020_coefficient_21_0634
        ep_Q2_020_generator_21_0600_0693 =
      ep_Q2_020_partial_21_0634 := by
  native_decide

/-- Coefficient term 635 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0635 : Poly :=
[
  term ((4044046716348529469 : Rat) / 56596790034801622) [(9, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 635 for generator 21. -/
def ep_Q2_020_partial_21_0635 : Poly :=
[
  term ((4044046716348529469 : Rat) / 28298395017400811) [(9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-4044046716348529469 : Rat) / 56596790034801622) [(9, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 635 for generator 21. -/
theorem ep_Q2_020_partial_21_0635_valid :
    mulPoly ep_Q2_020_coefficient_21_0635
        ep_Q2_020_generator_21_0600_0693 =
      ep_Q2_020_partial_21_0635 := by
  native_decide

/-- Coefficient term 636 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0636 : Poly :=
[
  term ((327905230613928 : Rat) / 1230365000756557) [(9, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 636 for generator 21. -/
def ep_Q2_020_partial_21_0636 : Poly :=
[
  term ((655810461227856 : Rat) / 1230365000756557) [(9, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-327905230613928 : Rat) / 1230365000756557) [(9, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 636 for generator 21. -/
theorem ep_Q2_020_partial_21_0636_valid :
    mulPoly ep_Q2_020_coefficient_21_0636
        ep_Q2_020_generator_21_0600_0693 =
      ep_Q2_020_partial_21_0636 := by
  native_decide

/-- Coefficient term 637 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0637 : Poly :=
[
  term ((-14290872643245000 : Rat) / 28298395017400811) [(9, 1), (11, 2), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 637 for generator 21. -/
def ep_Q2_020_partial_21_0637 : Poly :=
[
  term ((-28581745286490000 : Rat) / 28298395017400811) [(9, 1), (10, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((14290872643245000 : Rat) / 28298395017400811) [(9, 1), (11, 2), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 637 for generator 21. -/
theorem ep_Q2_020_partial_21_0637_valid :
    mulPoly ep_Q2_020_coefficient_21_0637
        ep_Q2_020_generator_21_0600_0693 =
      ep_Q2_020_partial_21_0637 := by
  native_decide

/-- Coefficient term 638 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0638 : Poly :=
[
  term ((-655810461227856 : Rat) / 1230365000756557) [(9, 1), (11, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 638 for generator 21. -/
def ep_Q2_020_partial_21_0638 : Poly :=
[
  term ((-1311620922455712 : Rat) / 1230365000756557) [(9, 1), (10, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((655810461227856 : Rat) / 1230365000756557) [(9, 1), (11, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 638 for generator 21. -/
theorem ep_Q2_020_partial_21_0638_valid :
    mulPoly ep_Q2_020_coefficient_21_0638
        ep_Q2_020_generator_21_0600_0693 =
      ep_Q2_020_partial_21_0638 := by
  native_decide

/-- Coefficient term 639 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0639 : Poly :=
[
  term ((32004224177379840 : Rat) / 1230365000756557) [(9, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 639 for generator 21. -/
def ep_Q2_020_partial_21_0639 : Poly :=
[
  term ((64008448354759680 : Rat) / 1230365000756557) [(9, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-32004224177379840 : Rat) / 1230365000756557) [(9, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 639 for generator 21. -/
theorem ep_Q2_020_partial_21_0639_valid :
    mulPoly ep_Q2_020_coefficient_21_0639
        ep_Q2_020_generator_21_0600_0693 =
      ep_Q2_020_partial_21_0639 := by
  native_decide

/-- Coefficient term 640 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0640 : Poly :=
[
  term ((-8001056044344960 : Rat) / 1230365000756557) [(9, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 640 for generator 21. -/
def ep_Q2_020_partial_21_0640 : Poly :=
[
  term ((-16002112088689920 : Rat) / 1230365000756557) [(9, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((8001056044344960 : Rat) / 1230365000756557) [(9, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 640 for generator 21. -/
theorem ep_Q2_020_partial_21_0640_valid :
    mulPoly ep_Q2_020_coefficient_21_0640
        ep_Q2_020_generator_21_0600_0693 =
      ep_Q2_020_partial_21_0640 := by
  native_decide

/-- Coefficient term 641 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0641 : Poly :=
[
  term ((-406373323642236000 : Rat) / 28298395017400811) [(9, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 641 for generator 21. -/
def ep_Q2_020_partial_21_0641 : Poly :=
[
  term ((-812746647284472000 : Rat) / 28298395017400811) [(9, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((406373323642236000 : Rat) / 28298395017400811) [(9, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 641 for generator 21. -/
theorem ep_Q2_020_partial_21_0641_valid :
    mulPoly ep_Q2_020_coefficient_21_0641
        ep_Q2_020_generator_21_0600_0693 =
      ep_Q2_020_partial_21_0641 := by
  native_decide

/-- Coefficient term 642 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0642 : Poly :=
[
  term ((101593330910559000 : Rat) / 28298395017400811) [(9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 642 for generator 21. -/
def ep_Q2_020_partial_21_0642 : Poly :=
[
  term ((203186661821118000 : Rat) / 28298395017400811) [(9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-101593330910559000 : Rat) / 28298395017400811) [(9, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 642 for generator 21. -/
theorem ep_Q2_020_partial_21_0642_valid :
    mulPoly ep_Q2_020_coefficient_21_0642
        ep_Q2_020_generator_21_0600_0693 =
      ep_Q2_020_partial_21_0642 := by
  native_decide

/-- Coefficient term 643 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0643 : Poly :=
[
  term ((-398027340981279609 : Rat) / 113193580069603244) [(9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 643 for generator 21. -/
def ep_Q2_020_partial_21_0643 : Poly :=
[
  term ((-398027340981279609 : Rat) / 56596790034801622) [(9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((398027340981279609 : Rat) / 113193580069603244) [(9, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 643 for generator 21. -/
theorem ep_Q2_020_partial_21_0643_valid :
    mulPoly ep_Q2_020_coefficient_21_0643
        ep_Q2_020_generator_21_0600_0693 =
      ep_Q2_020_partial_21_0643 := by
  native_decide

/-- Coefficient term 644 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0644 : Poly :=
[
  term ((12991702402950000 : Rat) / 28298395017400811) [(9, 1), (13, 1), (14, 2), (16, 1)]
]

/-- Partial product 644 for generator 21. -/
def ep_Q2_020_partial_21_0644 : Poly :=
[
  term ((25983404805900000 : Rat) / 28298395017400811) [(9, 1), (10, 1), (13, 1), (14, 2), (16, 1)],
  term ((-12991702402950000 : Rat) / 28298395017400811) [(9, 1), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 644 for generator 21. -/
theorem ep_Q2_020_partial_21_0644_valid :
    mulPoly ep_Q2_020_coefficient_21_0644
        ep_Q2_020_generator_21_0600_0693 =
      ep_Q2_020_partial_21_0644 := by
  native_decide

/-- Coefficient term 645 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0645 : Poly :=
[
  term ((-6495851201475000 : Rat) / 28298395017400811) [(9, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 645 for generator 21. -/
def ep_Q2_020_partial_21_0645 : Poly :=
[
  term ((-12991702402950000 : Rat) / 28298395017400811) [(9, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((6495851201475000 : Rat) / 28298395017400811) [(9, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 645 for generator 21. -/
theorem ep_Q2_020_partial_21_0645_valid :
    mulPoly ep_Q2_020_coefficient_21_0645
        ep_Q2_020_generator_21_0600_0693 =
      ep_Q2_020_partial_21_0645 := by
  native_decide

/-- Coefficient term 646 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0646 : Poly :=
[
  term ((5395439930448255 : Rat) / 690204756521971) [(9, 1), (13, 1), (16, 1)]
]

/-- Partial product 646 for generator 21. -/
def ep_Q2_020_partial_21_0646 : Poly :=
[
  term ((10790879860896510 : Rat) / 690204756521971) [(9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-5395439930448255 : Rat) / 690204756521971) [(9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 646 for generator 21. -/
theorem ep_Q2_020_partial_21_0646_valid :
    mulPoly ep_Q2_020_coefficient_21_0646
        ep_Q2_020_generator_21_0600_0693 =
      ep_Q2_020_partial_21_0646 := by
  native_decide

/-- Coefficient term 647 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0647 : Poly :=
[
  term ((1340805847869234504 : Rat) / 28298395017400811) [(9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 647 for generator 21. -/
def ep_Q2_020_partial_21_0647 : Poly :=
[
  term ((2681611695738469008 : Rat) / 28298395017400811) [(9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1340805847869234504 : Rat) / 28298395017400811) [(9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 647 for generator 21. -/
theorem ep_Q2_020_partial_21_0647_valid :
    mulPoly ep_Q2_020_coefficient_21_0647
        ep_Q2_020_generator_21_0600_0693 =
      ep_Q2_020_partial_21_0647 := by
  native_decide

/-- Coefficient term 648 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0648 : Poly :=
[
  term ((596191328388960 : Rat) / 1230365000756557) [(9, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 648 for generator 21. -/
def ep_Q2_020_partial_21_0648 : Poly :=
[
  term ((1192382656777920 : Rat) / 1230365000756557) [(9, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((-596191328388960 : Rat) / 1230365000756557) [(9, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 648 for generator 21. -/
theorem ep_Q2_020_partial_21_0648_valid :
    mulPoly ep_Q2_020_coefficient_21_0648
        ep_Q2_020_generator_21_0600_0693 =
      ep_Q2_020_partial_21_0648 := by
  native_decide

/-- Coefficient term 649 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0649 : Poly :=
[
  term ((-3588358379297949 : Rat) / 2460730001513114) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 649 for generator 21. -/
def ep_Q2_020_partial_21_0649 : Poly :=
[
  term ((-3588358379297949 : Rat) / 1230365000756557) [(9, 1), (10, 1), (15, 1), (16, 1)],
  term ((3588358379297949 : Rat) / 2460730001513114) [(9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 649 for generator 21. -/
theorem ep_Q2_020_partial_21_0649_valid :
    mulPoly ep_Q2_020_coefficient_21_0649
        ep_Q2_020_generator_21_0600_0693 =
      ep_Q2_020_partial_21_0649 := by
  native_decide

/-- Coefficient term 650 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0650 : Poly :=
[
  term ((-298095664194480 : Rat) / 1230365000756557) [(9, 1), (15, 3), (16, 1)]
]

/-- Partial product 650 for generator 21. -/
def ep_Q2_020_partial_21_0650 : Poly :=
[
  term ((-596191328388960 : Rat) / 1230365000756557) [(9, 1), (10, 1), (15, 3), (16, 1)],
  term ((298095664194480 : Rat) / 1230365000756557) [(9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 650 for generator 21. -/
theorem ep_Q2_020_partial_21_0650_valid :
    mulPoly ep_Q2_020_coefficient_21_0650
        ep_Q2_020_generator_21_0600_0693 =
      ep_Q2_020_partial_21_0650 := by
  native_decide

/-- Coefficient term 651 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0651 : Poly :=
[
  term ((-14290872643245000 : Rat) / 28298395017400811) [(9, 2), (10, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 651 for generator 21. -/
def ep_Q2_020_partial_21_0651 : Poly :=
[
  term ((14290872643245000 : Rat) / 28298395017400811) [(9, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-28581745286490000 : Rat) / 28298395017400811) [(9, 2), (10, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 651 for generator 21. -/
theorem ep_Q2_020_partial_21_0651_valid :
    mulPoly ep_Q2_020_coefficient_21_0651
        ep_Q2_020_generator_21_0600_0693 =
      ep_Q2_020_partial_21_0651 := by
  native_decide

/-- Coefficient term 652 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0652 : Poly :=
[
  term ((-655810461227856 : Rat) / 1230365000756557) [(9, 2), (10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 652 for generator 21. -/
def ep_Q2_020_partial_21_0652 : Poly :=
[
  term ((655810461227856 : Rat) / 1230365000756557) [(9, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1311620922455712 : Rat) / 1230365000756557) [(9, 2), (10, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 652 for generator 21. -/
theorem ep_Q2_020_partial_21_0652_valid :
    mulPoly ep_Q2_020_coefficient_21_0652
        ep_Q2_020_generator_21_0600_0693 =
      ep_Q2_020_partial_21_0652 := by
  native_decide

/-- Coefficient term 653 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0653 : Poly :=
[
  term ((-2598340480590000 : Rat) / 28298395017400811) [(9, 2), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 653 for generator 21. -/
def ep_Q2_020_partial_21_0653 : Poly :=
[
  term ((2598340480590000 : Rat) / 28298395017400811) [(9, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5196680961180000 : Rat) / 28298395017400811) [(9, 2), (10, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 653 for generator 21. -/
theorem ep_Q2_020_partial_21_0653_valid :
    mulPoly ep_Q2_020_coefficient_21_0653
        ep_Q2_020_generator_21_0600_0693 =
      ep_Q2_020_partial_21_0653 := by
  native_decide

/-- Coefficient term 654 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0654 : Poly :=
[
  term ((-119238265677792 : Rat) / 1230365000756557) [(9, 2), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 654 for generator 21. -/
def ep_Q2_020_partial_21_0654 : Poly :=
[
  term ((119238265677792 : Rat) / 1230365000756557) [(9, 2), (10, 1), (15, 2), (16, 1)],
  term ((-238476531355584 : Rat) / 1230365000756557) [(9, 2), (10, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 654 for generator 21. -/
theorem ep_Q2_020_partial_21_0654_valid :
    mulPoly ep_Q2_020_coefficient_21_0654
        ep_Q2_020_generator_21_0600_0693 =
      ep_Q2_020_partial_21_0654 := by
  native_decide

/-- Coefficient term 655 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0655 : Poly :=
[
  term ((72487606254096515 : Rat) / 2460730001513114) [(9, 2), (10, 1), (16, 1)]
]

/-- Partial product 655 for generator 21. -/
def ep_Q2_020_partial_21_0655 : Poly :=
[
  term ((-72487606254096515 : Rat) / 2460730001513114) [(9, 2), (10, 1), (16, 1)],
  term ((72487606254096515 : Rat) / 1230365000756557) [(9, 2), (10, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 655 for generator 21. -/
theorem ep_Q2_020_partial_21_0655_valid :
    mulPoly ep_Q2_020_coefficient_21_0655
        ep_Q2_020_generator_21_0600_0693 =
      ep_Q2_020_partial_21_0655 := by
  native_decide

/-- Coefficient term 656 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0656 : Poly :=
[
  term ((28581745286490000 : Rat) / 28298395017400811) [(9, 2), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 656 for generator 21. -/
def ep_Q2_020_partial_21_0656 : Poly :=
[
  term ((57163490572980000 : Rat) / 28298395017400811) [(9, 2), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-28581745286490000 : Rat) / 28298395017400811) [(9, 2), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 656 for generator 21. -/
theorem ep_Q2_020_partial_21_0656_valid :
    mulPoly ep_Q2_020_coefficient_21_0656
        ep_Q2_020_generator_21_0600_0693 =
      ep_Q2_020_partial_21_0656 := by
  native_decide

/-- Coefficient term 657 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0657 : Poly :=
[
  term ((-7145436321622500 : Rat) / 28298395017400811) [(9, 2), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 657 for generator 21. -/
def ep_Q2_020_partial_21_0657 : Poly :=
[
  term ((-14290872643245000 : Rat) / 28298395017400811) [(9, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((7145436321622500 : Rat) / 28298395017400811) [(9, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 657 for generator 21. -/
theorem ep_Q2_020_partial_21_0657_valid :
    mulPoly ep_Q2_020_coefficient_21_0657
        ep_Q2_020_generator_21_0600_0693 =
      ep_Q2_020_partial_21_0657 := by
  native_decide

/-- Coefficient term 658 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0658 : Poly :=
[
  term ((1311620922455712 : Rat) / 1230365000756557) [(9, 2), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 658 for generator 21. -/
def ep_Q2_020_partial_21_0658 : Poly :=
[
  term ((2623241844911424 : Rat) / 1230365000756557) [(9, 2), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1311620922455712 : Rat) / 1230365000756557) [(9, 2), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 658 for generator 21. -/
theorem ep_Q2_020_partial_21_0658_valid :
    mulPoly ep_Q2_020_coefficient_21_0658
        ep_Q2_020_generator_21_0600_0693 =
      ep_Q2_020_partial_21_0658 := by
  native_decide

/-- Coefficient term 659 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0659 : Poly :=
[
  term ((-327905230613928 : Rat) / 1230365000756557) [(9, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 659 for generator 21. -/
def ep_Q2_020_partial_21_0659 : Poly :=
[
  term ((-655810461227856 : Rat) / 1230365000756557) [(9, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((327905230613928 : Rat) / 1230365000756557) [(9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 659 for generator 21. -/
theorem ep_Q2_020_partial_21_0659_valid :
    mulPoly ep_Q2_020_coefficient_21_0659
        ep_Q2_020_generator_21_0600_0693 =
      ep_Q2_020_partial_21_0659 := by
  native_decide

/-- Coefficient term 660 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0660 : Poly :=
[
  term ((-25983404805900000 : Rat) / 28298395017400811) [(9, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 660 for generator 21. -/
def ep_Q2_020_partial_21_0660 : Poly :=
[
  term ((-51966809611800000 : Rat) / 28298395017400811) [(9, 2), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((25983404805900000 : Rat) / 28298395017400811) [(9, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 660 for generator 21. -/
theorem ep_Q2_020_partial_21_0660_valid :
    mulPoly ep_Q2_020_coefficient_21_0660
        ep_Q2_020_generator_21_0600_0693 =
      ep_Q2_020_partial_21_0660 := by
  native_decide

/-- Coefficient term 661 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0661 : Poly :=
[
  term ((-1299170240295000 : Rat) / 28298395017400811) [(9, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 661 for generator 21. -/
def ep_Q2_020_partial_21_0661 : Poly :=
[
  term ((-2598340480590000 : Rat) / 28298395017400811) [(9, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((1299170240295000 : Rat) / 28298395017400811) [(9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 661 for generator 21. -/
theorem ep_Q2_020_partial_21_0661_valid :
    mulPoly ep_Q2_020_coefficient_21_0661
        ep_Q2_020_generator_21_0600_0693 =
      ep_Q2_020_partial_21_0661 := by
  native_decide

/-- Coefficient term 662 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0662 : Poly :=
[
  term ((-1192382656777920 : Rat) / 1230365000756557) [(9, 2), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 662 for generator 21. -/
def ep_Q2_020_partial_21_0662 : Poly :=
[
  term ((-2384765313555840 : Rat) / 1230365000756557) [(9, 2), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((1192382656777920 : Rat) / 1230365000756557) [(9, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 662 for generator 21. -/
theorem ep_Q2_020_partial_21_0662_valid :
    mulPoly ep_Q2_020_coefficient_21_0662
        ep_Q2_020_generator_21_0600_0693 =
      ep_Q2_020_partial_21_0662 := by
  native_decide

/-- Coefficient term 663 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0663 : Poly :=
[
  term ((-1482374497569771120 : Rat) / 28298395017400811) [(9, 2), (14, 1), (16, 1)]
]

/-- Partial product 663 for generator 21. -/
def ep_Q2_020_partial_21_0663 : Poly :=
[
  term ((-2964748995139542240 : Rat) / 28298395017400811) [(9, 2), (10, 1), (14, 1), (16, 1)],
  term ((1482374497569771120 : Rat) / 28298395017400811) [(9, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 663 for generator 21. -/
theorem ep_Q2_020_partial_21_0663_valid :
    mulPoly ep_Q2_020_coefficient_21_0663
        ep_Q2_020_generator_21_0600_0693 =
      ep_Q2_020_partial_21_0663 := by
  native_decide

/-- Coefficient term 664 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0664 : Poly :=
[
  term ((-59619132838896 : Rat) / 1230365000756557) [(9, 2), (15, 2), (16, 1)]
]

/-- Partial product 664 for generator 21. -/
def ep_Q2_020_partial_21_0664 : Poly :=
[
  term ((-119238265677792 : Rat) / 1230365000756557) [(9, 2), (10, 1), (15, 2), (16, 1)],
  term ((59619132838896 : Rat) / 1230365000756557) [(9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 664 for generator 21. -/
theorem ep_Q2_020_partial_21_0664_valid :
    mulPoly ep_Q2_020_coefficient_21_0664
        ep_Q2_020_generator_21_0600_0693 =
      ep_Q2_020_partial_21_0664 := by
  native_decide

/-- Coefficient term 665 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0665 : Poly :=
[
  term ((72487606254096515 : Rat) / 4921460003026228) [(9, 2), (16, 1)]
]

/-- Partial product 665 for generator 21. -/
def ep_Q2_020_partial_21_0665 : Poly :=
[
  term ((72487606254096515 : Rat) / 2460730001513114) [(9, 2), (10, 1), (16, 1)],
  term ((-72487606254096515 : Rat) / 4921460003026228) [(9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 665 for generator 21. -/
theorem ep_Q2_020_partial_21_0665_valid :
    mulPoly ep_Q2_020_coefficient_21_0665
        ep_Q2_020_generator_21_0600_0693 =
      ep_Q2_020_partial_21_0665 := by
  native_decide

/-- Coefficient term 666 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0666 : Poly :=
[
  term ((589410376663348278 : Rat) / 28298395017400811) [(10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 666 for generator 21. -/
def ep_Q2_020_partial_21_0666 : Poly :=
[
  term ((-589410376663348278 : Rat) / 28298395017400811) [(10, 1), (11, 1), (15, 1), (16, 1)],
  term ((1178820753326696556 : Rat) / 28298395017400811) [(10, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 666 for generator 21. -/
theorem ep_Q2_020_partial_21_0666_valid :
    mulPoly ep_Q2_020_coefficient_21_0666
        ep_Q2_020_generator_21_0600_0693 =
      ep_Q2_020_partial_21_0666 := by
  native_decide

/-- Coefficient term 667 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0667 : Poly :=
[
  term ((16002112088689920 : Rat) / 1230365000756557) [(10, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 667 for generator 21. -/
def ep_Q2_020_partial_21_0667 : Poly :=
[
  term ((-16002112088689920 : Rat) / 1230365000756557) [(10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((32004224177379840 : Rat) / 1230365000756557) [(10, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 667 for generator 21. -/
theorem ep_Q2_020_partial_21_0667_valid :
    mulPoly ep_Q2_020_coefficient_21_0667
        ep_Q2_020_generator_21_0600_0693 =
      ep_Q2_020_partial_21_0667 := by
  native_decide

/-- Coefficient term 668 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0668 : Poly :=
[
  term ((-1702436067084144 : Rat) / 1230365000756557) [(10, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 668 for generator 21. -/
def ep_Q2_020_partial_21_0668 : Poly :=
[
  term ((1702436067084144 : Rat) / 1230365000756557) [(10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-3404872134168288 : Rat) / 1230365000756557) [(10, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 668 for generator 21. -/
theorem ep_Q2_020_partial_21_0668_valid :
    mulPoly ep_Q2_020_coefficient_21_0668
        ep_Q2_020_generator_21_0600_0693 =
      ep_Q2_020_partial_21_0668 := by
  native_decide

/-- Coefficient term 669 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0669 : Poly :=
[
  term ((-2598340480590000 : Rat) / 1230365000756557) [(10, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 669 for generator 21. -/
def ep_Q2_020_partial_21_0669 : Poly :=
[
  term ((2598340480590000 : Rat) / 1230365000756557) [(10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5196680961180000 : Rat) / 1230365000756557) [(10, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 669 for generator 21. -/
theorem ep_Q2_020_partial_21_0669_valid :
    mulPoly ep_Q2_020_coefficient_21_0669
        ep_Q2_020_generator_21_0600_0693 =
      ep_Q2_020_partial_21_0669 := by
  native_decide

/-- Coefficient term 670 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0670 : Poly :=
[
  term ((-228997957566769218 : Rat) / 28298395017400811) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 670 for generator 21. -/
def ep_Q2_020_partial_21_0670 : Poly :=
[
  term ((228997957566769218 : Rat) / 28298395017400811) [(10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-457995915133538436 : Rat) / 28298395017400811) [(10, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 670 for generator 21. -/
theorem ep_Q2_020_partial_21_0670_valid :
    mulPoly ep_Q2_020_coefficient_21_0670
        ep_Q2_020_generator_21_0600_0693 =
      ep_Q2_020_partial_21_0670 := by
  native_decide

/-- Coefficient term 671 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0671 : Poly :=
[
  term ((1997240950103016 : Rat) / 1230365000756557) [(10, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 671 for generator 21. -/
def ep_Q2_020_partial_21_0671 : Poly :=
[
  term ((-1997240950103016 : Rat) / 1230365000756557) [(10, 1), (14, 1), (15, 2), (16, 1)],
  term ((3994481900206032 : Rat) / 1230365000756557) [(10, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 671 for generator 21. -/
theorem ep_Q2_020_partial_21_0671_valid :
    mulPoly ep_Q2_020_coefficient_21_0671
        ep_Q2_020_generator_21_0600_0693 =
      ep_Q2_020_partial_21_0671 := by
  native_decide

/-- Coefficient term 672 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0672 : Poly :=
[
  term ((-1336390307567996925 : Rat) / 56596790034801622) [(10, 1), (15, 2), (16, 1)]
]

/-- Partial product 672 for generator 21. -/
def ep_Q2_020_partial_21_0672 : Poly :=
[
  term ((1336390307567996925 : Rat) / 56596790034801622) [(10, 1), (15, 2), (16, 1)],
  term ((-1336390307567996925 : Rat) / 28298395017400811) [(10, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 672 for generator 21. -/
theorem ep_Q2_020_partial_21_0672_valid :
    mulPoly ep_Q2_020_coefficient_21_0672
        ep_Q2_020_generator_21_0600_0693 =
      ep_Q2_020_partial_21_0672 := by
  native_decide

/-- Coefficient term 673 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0673 : Poly :=
[
  term ((-16002112088689920 : Rat) / 1230365000756557) [(11, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 673 for generator 21. -/
def ep_Q2_020_partial_21_0673 : Poly :=
[
  term ((-32004224177379840 : Rat) / 1230365000756557) [(10, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((16002112088689920 : Rat) / 1230365000756557) [(11, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 673 for generator 21. -/
theorem ep_Q2_020_partial_21_0673_valid :
    mulPoly ep_Q2_020_coefficient_21_0673
        ep_Q2_020_generator_21_0600_0693 =
      ep_Q2_020_partial_21_0673 := by
  native_decide

/-- Coefficient term 674 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0674 : Poly :=
[
  term ((1702436067084144 : Rat) / 1230365000756557) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 674 for generator 21. -/
def ep_Q2_020_partial_21_0674 : Poly :=
[
  term ((3404872134168288 : Rat) / 1230365000756557) [(10, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1702436067084144 : Rat) / 1230365000756557) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 674 for generator 21. -/
theorem ep_Q2_020_partial_21_0674_valid :
    mulPoly ep_Q2_020_coefficient_21_0674
        ep_Q2_020_generator_21_0600_0693 =
      ep_Q2_020_partial_21_0674 := by
  native_decide

/-- Coefficient term 675 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0675 : Poly :=
[
  term ((228997957566769218 : Rat) / 28298395017400811) [(11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 675 for generator 21. -/
def ep_Q2_020_partial_21_0675 : Poly :=
[
  term ((457995915133538436 : Rat) / 28298395017400811) [(10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-228997957566769218 : Rat) / 28298395017400811) [(11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 675 for generator 21. -/
theorem ep_Q2_020_partial_21_0675_valid :
    mulPoly ep_Q2_020_coefficient_21_0675
        ep_Q2_020_generator_21_0600_0693 =
      ep_Q2_020_partial_21_0675 := by
  native_decide

/-- Coefficient term 676 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0676 : Poly :=
[
  term ((2598340480590000 : Rat) / 1230365000756557) [(11, 1), (13, 1), (14, 2), (16, 1)]
]

/-- Partial product 676 for generator 21. -/
def ep_Q2_020_partial_21_0676 : Poly :=
[
  term ((5196680961180000 : Rat) / 1230365000756557) [(10, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-2598340480590000 : Rat) / 1230365000756557) [(11, 1), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 676 for generator 21. -/
theorem ep_Q2_020_partial_21_0676_valid :
    mulPoly ep_Q2_020_coefficient_21_0676
        ep_Q2_020_generator_21_0600_0693 =
      ep_Q2_020_partial_21_0676 := by
  native_decide

/-- Coefficient term 677 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0677 : Poly :=
[
  term ((1336390307567996925 : Rat) / 56596790034801622) [(11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 677 for generator 21. -/
def ep_Q2_020_partial_21_0677 : Poly :=
[
  term ((1336390307567996925 : Rat) / 28298395017400811) [(10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1336390307567996925 : Rat) / 56596790034801622) [(11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 677 for generator 21. -/
theorem ep_Q2_020_partial_21_0677_valid :
    mulPoly ep_Q2_020_coefficient_21_0677
        ep_Q2_020_generator_21_0600_0693 =
      ep_Q2_020_partial_21_0677 := by
  native_decide

/-- Coefficient term 678 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0678 : Poly :=
[
  term ((-1997240950103016 : Rat) / 1230365000756557) [(11, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 678 for generator 21. -/
def ep_Q2_020_partial_21_0678 : Poly :=
[
  term ((-3994481900206032 : Rat) / 1230365000756557) [(10, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((1997240950103016 : Rat) / 1230365000756557) [(11, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 678 for generator 21. -/
theorem ep_Q2_020_partial_21_0678_valid :
    mulPoly ep_Q2_020_coefficient_21_0678
        ep_Q2_020_generator_21_0600_0693 =
      ep_Q2_020_partial_21_0678 := by
  native_decide

/-- Coefficient term 679 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0679 : Poly :=
[
  term ((294705188331674139 : Rat) / 28298395017400811) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 679 for generator 21. -/
def ep_Q2_020_partial_21_0679 : Poly :=
[
  term ((589410376663348278 : Rat) / 28298395017400811) [(10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-294705188331674139 : Rat) / 28298395017400811) [(11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 679 for generator 21. -/
theorem ep_Q2_020_partial_21_0679_valid :
    mulPoly ep_Q2_020_coefficient_21_0679
        ep_Q2_020_generator_21_0600_0693 =
      ep_Q2_020_partial_21_0679 := by
  native_decide

/-- Coefficient term 680 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0680 : Poly :=
[
  term ((-589410376663348278 : Rat) / 28298395017400811) [(11, 2), (14, 1), (16, 1)]
]

/-- Partial product 680 for generator 21. -/
def ep_Q2_020_partial_21_0680 : Poly :=
[
  term ((-1178820753326696556 : Rat) / 28298395017400811) [(10, 1), (11, 2), (14, 1), (16, 1)],
  term ((589410376663348278 : Rat) / 28298395017400811) [(11, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 680 for generator 21. -/
theorem ep_Q2_020_partial_21_0680_valid :
    mulPoly ep_Q2_020_coefficient_21_0680
        ep_Q2_020_generator_21_0600_0693 =
      ep_Q2_020_partial_21_0680 := by
  native_decide

/-- Coefficient term 681 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0681 : Poly :=
[
  term ((8001056044344960 : Rat) / 1230365000756557) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 681 for generator 21. -/
def ep_Q2_020_partial_21_0681 : Poly :=
[
  term ((16002112088689920 : Rat) / 1230365000756557) [(10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-8001056044344960 : Rat) / 1230365000756557) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 681 for generator 21. -/
theorem ep_Q2_020_partial_21_0681_valid :
    mulPoly ep_Q2_020_coefficient_21_0681
        ep_Q2_020_generator_21_0600_0693 =
      ep_Q2_020_partial_21_0681 := by
  native_decide

/-- Coefficient term 682 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0682 : Poly :=
[
  term ((424148439214976610 : Rat) / 28298395017400811) [(12, 1), (14, 1), (16, 1)]
]

/-- Partial product 682 for generator 21. -/
def ep_Q2_020_partial_21_0682 : Poly :=
[
  term ((848296878429953220 : Rat) / 28298395017400811) [(10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-424148439214976610 : Rat) / 28298395017400811) [(12, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 682 for generator 21. -/
theorem ep_Q2_020_partial_21_0682_valid :
    mulPoly ep_Q2_020_coefficient_21_0682
        ep_Q2_020_generator_21_0600_0693 =
      ep_Q2_020_partial_21_0682 := by
  native_decide

/-- Coefficient term 683 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0683 : Poly :=
[
  term ((935178421653215553 : Rat) / 113193580069603244) [(12, 1), (14, 2), (16, 1)]
]

/-- Partial product 683 for generator 21. -/
def ep_Q2_020_partial_21_0683 : Poly :=
[
  term ((935178421653215553 : Rat) / 56596790034801622) [(10, 1), (12, 1), (14, 2), (16, 1)],
  term ((-935178421653215553 : Rat) / 113193580069603244) [(12, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 683 for generator 21. -/
theorem ep_Q2_020_partial_21_0683_valid :
    mulPoly ep_Q2_020_coefficient_21_0683
        ep_Q2_020_generator_21_0600_0693 =
      ep_Q2_020_partial_21_0683 := by
  native_decide

/-- Coefficient term 684 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0684 : Poly :=
[
  term ((-851218033542072 : Rat) / 1230365000756557) [(12, 1), (15, 2), (16, 1)]
]

/-- Partial product 684 for generator 21. -/
def ep_Q2_020_partial_21_0684 : Poly :=
[
  term ((-1702436067084144 : Rat) / 1230365000756557) [(10, 1), (12, 1), (15, 2), (16, 1)],
  term ((851218033542072 : Rat) / 1230365000756557) [(12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 684 for generator 21. -/
theorem ep_Q2_020_partial_21_0684_valid :
    mulPoly ep_Q2_020_coefficient_21_0684
        ep_Q2_020_generator_21_0600_0693 =
      ep_Q2_020_partial_21_0684 := by
  native_decide

/-- Coefficient term 685 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0685 : Poly :=
[
  term ((134518482142185609 : Rat) / 56596790034801622) [(12, 2), (14, 1), (16, 1)]
]

/-- Partial product 685 for generator 21. -/
def ep_Q2_020_partial_21_0685 : Poly :=
[
  term ((134518482142185609 : Rat) / 28298395017400811) [(10, 1), (12, 2), (14, 1), (16, 1)],
  term ((-134518482142185609 : Rat) / 56596790034801622) [(12, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 685 for generator 21. -/
theorem ep_Q2_020_partial_21_0685_valid :
    mulPoly ep_Q2_020_coefficient_21_0685
        ep_Q2_020_generator_21_0600_0693 =
      ep_Q2_020_partial_21_0685 := by
  native_decide

/-- Coefficient term 686 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0686 : Poly :=
[
  term ((1156399207171536177 : Rat) / 113193580069603244) [(13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 686 for generator 21. -/
def ep_Q2_020_partial_21_0686 : Poly :=
[
  term ((1156399207171536177 : Rat) / 56596790034801622) [(10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1156399207171536177 : Rat) / 113193580069603244) [(13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 686 for generator 21. -/
theorem ep_Q2_020_partial_21_0686_valid :
    mulPoly ep_Q2_020_coefficient_21_0686
        ep_Q2_020_generator_21_0600_0693 =
      ep_Q2_020_partial_21_0686 := by
  native_decide

/-- Coefficient term 687 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0687 : Poly :=
[
  term ((-114498978783384609 : Rat) / 28298395017400811) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 687 for generator 21. -/
def ep_Q2_020_partial_21_0687 : Poly :=
[
  term ((-228997957566769218 : Rat) / 28298395017400811) [(10, 1), (13, 1), (15, 1), (16, 1)],
  term ((114498978783384609 : Rat) / 28298395017400811) [(13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 687 for generator 21. -/
theorem ep_Q2_020_partial_21_0687_valid :
    mulPoly ep_Q2_020_coefficient_21_0687
        ep_Q2_020_generator_21_0600_0693 =
      ep_Q2_020_partial_21_0687 := by
  native_decide

/-- Coefficient term 688 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0688 : Poly :=
[
  term ((-233530095897682551 : Rat) / 56596790034801622) [(13, 2), (14, 1), (16, 1)]
]

/-- Partial product 688 for generator 21. -/
def ep_Q2_020_partial_21_0688 : Poly :=
[
  term ((-233530095897682551 : Rat) / 28298395017400811) [(10, 1), (13, 2), (14, 1), (16, 1)],
  term ((233530095897682551 : Rat) / 56596790034801622) [(13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 688 for generator 21. -/
theorem ep_Q2_020_partial_21_0688_valid :
    mulPoly ep_Q2_020_coefficient_21_0688
        ep_Q2_020_generator_21_0600_0693 =
      ep_Q2_020_partial_21_0688 := by
  native_decide

/-- Coefficient term 689 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0689 : Poly :=
[
  term ((4945060195657124865 : Rat) / 56596790034801622) [(14, 1), (15, 2), (16, 1)]
]

/-- Partial product 689 for generator 21. -/
def ep_Q2_020_partial_21_0689 : Poly :=
[
  term ((4945060195657124865 : Rat) / 28298395017400811) [(10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-4945060195657124865 : Rat) / 56596790034801622) [(14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 689 for generator 21. -/
theorem ep_Q2_020_partial_21_0689_valid :
    mulPoly ep_Q2_020_coefficient_21_0689
        ep_Q2_020_generator_21_0600_0693 =
      ep_Q2_020_partial_21_0689 := by
  native_decide

/-- Coefficient term 690 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0690 : Poly :=
[
  term ((-552401434184546867 : Rat) / 28298395017400811) [(14, 1), (16, 1)]
]

/-- Partial product 690 for generator 21. -/
def ep_Q2_020_partial_21_0690 : Poly :=
[
  term ((-1104802868369093734 : Rat) / 28298395017400811) [(10, 1), (14, 1), (16, 1)],
  term ((552401434184546867 : Rat) / 28298395017400811) [(14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 690 for generator 21. -/
theorem ep_Q2_020_partial_21_0690_valid :
    mulPoly ep_Q2_020_coefficient_21_0690
        ep_Q2_020_generator_21_0600_0693 =
      ep_Q2_020_partial_21_0690 := by
  native_decide

/-- Coefficient term 691 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0691 : Poly :=
[
  term ((258468134561443098 : Rat) / 28298395017400811) [(14, 2), (16, 1)]
]

/-- Partial product 691 for generator 21. -/
def ep_Q2_020_partial_21_0691 : Poly :=
[
  term ((516936269122886196 : Rat) / 28298395017400811) [(10, 1), (14, 2), (16, 1)],
  term ((-258468134561443098 : Rat) / 28298395017400811) [(14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 691 for generator 21. -/
theorem ep_Q2_020_partial_21_0691_valid :
    mulPoly ep_Q2_020_coefficient_21_0691
        ep_Q2_020_generator_21_0600_0693 =
      ep_Q2_020_partial_21_0691 := by
  native_decide

/-- Coefficient term 692 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0692 : Poly :=
[
  term ((111654401023963923 : Rat) / 28298395017400811) [(14, 3), (16, 1)]
]

/-- Partial product 692 for generator 21. -/
def ep_Q2_020_partial_21_0692 : Poly :=
[
  term ((223308802047927846 : Rat) / 28298395017400811) [(10, 1), (14, 3), (16, 1)],
  term ((-111654401023963923 : Rat) / 28298395017400811) [(14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 692 for generator 21. -/
theorem ep_Q2_020_partial_21_0692_valid :
    mulPoly ep_Q2_020_coefficient_21_0692
        ep_Q2_020_generator_21_0600_0693 =
      ep_Q2_020_partial_21_0692 := by
  native_decide

/-- Coefficient term 693 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0693 : Poly :=
[
  term ((-1336390307567996925 : Rat) / 113193580069603244) [(15, 2), (16, 1)]
]

/-- Partial product 693 for generator 21. -/
def ep_Q2_020_partial_21_0693 : Poly :=
[
  term ((-1336390307567996925 : Rat) / 56596790034801622) [(10, 1), (15, 2), (16, 1)],
  term ((1336390307567996925 : Rat) / 113193580069603244) [(15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 693 for generator 21. -/
theorem ep_Q2_020_partial_21_0693_valid :
    mulPoly ep_Q2_020_coefficient_21_0693
        ep_Q2_020_generator_21_0600_0693 =
      ep_Q2_020_partial_21_0693 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_020_partials_21_0600_0693 : List Poly :=
[
  ep_Q2_020_partial_21_0600,
  ep_Q2_020_partial_21_0601,
  ep_Q2_020_partial_21_0602,
  ep_Q2_020_partial_21_0603,
  ep_Q2_020_partial_21_0604,
  ep_Q2_020_partial_21_0605,
  ep_Q2_020_partial_21_0606,
  ep_Q2_020_partial_21_0607,
  ep_Q2_020_partial_21_0608,
  ep_Q2_020_partial_21_0609,
  ep_Q2_020_partial_21_0610,
  ep_Q2_020_partial_21_0611,
  ep_Q2_020_partial_21_0612,
  ep_Q2_020_partial_21_0613,
  ep_Q2_020_partial_21_0614,
  ep_Q2_020_partial_21_0615,
  ep_Q2_020_partial_21_0616,
  ep_Q2_020_partial_21_0617,
  ep_Q2_020_partial_21_0618,
  ep_Q2_020_partial_21_0619,
  ep_Q2_020_partial_21_0620,
  ep_Q2_020_partial_21_0621,
  ep_Q2_020_partial_21_0622,
  ep_Q2_020_partial_21_0623,
  ep_Q2_020_partial_21_0624,
  ep_Q2_020_partial_21_0625,
  ep_Q2_020_partial_21_0626,
  ep_Q2_020_partial_21_0627,
  ep_Q2_020_partial_21_0628,
  ep_Q2_020_partial_21_0629,
  ep_Q2_020_partial_21_0630,
  ep_Q2_020_partial_21_0631,
  ep_Q2_020_partial_21_0632,
  ep_Q2_020_partial_21_0633,
  ep_Q2_020_partial_21_0634,
  ep_Q2_020_partial_21_0635,
  ep_Q2_020_partial_21_0636,
  ep_Q2_020_partial_21_0637,
  ep_Q2_020_partial_21_0638,
  ep_Q2_020_partial_21_0639,
  ep_Q2_020_partial_21_0640,
  ep_Q2_020_partial_21_0641,
  ep_Q2_020_partial_21_0642,
  ep_Q2_020_partial_21_0643,
  ep_Q2_020_partial_21_0644,
  ep_Q2_020_partial_21_0645,
  ep_Q2_020_partial_21_0646,
  ep_Q2_020_partial_21_0647,
  ep_Q2_020_partial_21_0648,
  ep_Q2_020_partial_21_0649,
  ep_Q2_020_partial_21_0650,
  ep_Q2_020_partial_21_0651,
  ep_Q2_020_partial_21_0652,
  ep_Q2_020_partial_21_0653,
  ep_Q2_020_partial_21_0654,
  ep_Q2_020_partial_21_0655,
  ep_Q2_020_partial_21_0656,
  ep_Q2_020_partial_21_0657,
  ep_Q2_020_partial_21_0658,
  ep_Q2_020_partial_21_0659,
  ep_Q2_020_partial_21_0660,
  ep_Q2_020_partial_21_0661,
  ep_Q2_020_partial_21_0662,
  ep_Q2_020_partial_21_0663,
  ep_Q2_020_partial_21_0664,
  ep_Q2_020_partial_21_0665,
  ep_Q2_020_partial_21_0666,
  ep_Q2_020_partial_21_0667,
  ep_Q2_020_partial_21_0668,
  ep_Q2_020_partial_21_0669,
  ep_Q2_020_partial_21_0670,
  ep_Q2_020_partial_21_0671,
  ep_Q2_020_partial_21_0672,
  ep_Q2_020_partial_21_0673,
  ep_Q2_020_partial_21_0674,
  ep_Q2_020_partial_21_0675,
  ep_Q2_020_partial_21_0676,
  ep_Q2_020_partial_21_0677,
  ep_Q2_020_partial_21_0678,
  ep_Q2_020_partial_21_0679,
  ep_Q2_020_partial_21_0680,
  ep_Q2_020_partial_21_0681,
  ep_Q2_020_partial_21_0682,
  ep_Q2_020_partial_21_0683,
  ep_Q2_020_partial_21_0684,
  ep_Q2_020_partial_21_0685,
  ep_Q2_020_partial_21_0686,
  ep_Q2_020_partial_21_0687,
  ep_Q2_020_partial_21_0688,
  ep_Q2_020_partial_21_0689,
  ep_Q2_020_partial_21_0690,
  ep_Q2_020_partial_21_0691,
  ep_Q2_020_partial_21_0692,
  ep_Q2_020_partial_21_0693
]

/-- Sum of partial products in this block. -/
def ep_Q2_020_block_21_0600_0693 : Poly :=
[
  term ((-105882374584042500 : Rat) / 28298395017400811) [(8, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-1427760539524453497 : Rat) / 28298395017400811) [(8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((2384765313555840 : Rat) / 1230365000756557) [(8, 1), (9, 1), (10, 1), (15, 3), (16, 1)],
  term ((52941187292021250 : Rat) / 28298395017400811) [(8, 1), (9, 1), (13, 1), (16, 1)],
  term ((1427760539524453497 : Rat) / 56596790034801622) [(8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-1192382656777920 : Rat) / 1230365000756557) [(8, 1), (9, 1), (15, 3), (16, 1)],
  term ((32004224177379840 : Rat) / 1230365000756557) [(8, 1), (10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-406373323642236000 : Rat) / 28298395017400811) [(8, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((20786723844720000 : Rat) / 28298395017400811) [(8, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((31180085767080000 : Rat) / 28298395017400811) [(8, 1), (10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-891997584915136320 : Rat) / 28298395017400811) [(8, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((953906125422336 : Rat) / 1230365000756557) [(8, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-134018070731204971 : Rat) / 975806724737959) [(8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((1430859188133504 : Rat) / 1230365000756557) [(8, 1), (10, 1), (11, 1), (15, 3), (16, 1)],
  term ((-64008448354759680 : Rat) / 1230365000756557) [(8, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((13490823602297016 : Rat) / 975806724737959) [(8, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((812746647284472000 : Rat) / 28298395017400811) [(8, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-23385064325310000 : Rat) / 28298395017400811) [(8, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1679881632094967847 : Rat) / 56596790034801622) [(8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((16002112088689920 : Rat) / 1230365000756557) [(8, 1), (10, 1), (13, 2), (16, 1)],
  term ((-1073144391100128 : Rat) / 1230365000756557) [(8, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2540996289813398209 : Rat) / 56596790034801622) [(8, 1), (10, 1), (14, 1), (16, 1)],
  term ((553503550101674076 : Rat) / 28298395017400811) [(8, 1), (10, 1), (14, 2), (16, 1)],
  term ((-2678869215627879792 : Rat) / 28298395017400811) [(8, 1), (10, 1), (15, 2), (16, 1)],
  term ((72487606254096515 : Rat) / 4921460003026228) [(8, 1), (10, 1), (16, 1)],
  term ((-16002112088689920 : Rat) / 1230365000756557) [(8, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((203186661821118000 : Rat) / 28298395017400811) [(8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-10393361922360000 : Rat) / 28298395017400811) [(8, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-15590042883540000 : Rat) / 28298395017400811) [(8, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((445998792457568160 : Rat) / 28298395017400811) [(8, 1), (11, 1), (13, 1), (16, 1)],
  term ((-476953062711168 : Rat) / 1230365000756557) [(8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((134018070731204971 : Rat) / 1951613449475918) [(8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-715429594066752 : Rat) / 1230365000756557) [(8, 1), (11, 1), (15, 3), (16, 1)],
  term ((32004224177379840 : Rat) / 1230365000756557) [(8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-6745411801148508 : Rat) / 975806724737959) [(8, 1), (12, 1), (14, 1), (16, 1)],
  term ((-406373323642236000 : Rat) / 28298395017400811) [(8, 1), (12, 1), (15, 2), (16, 1)],
  term ((11692532162655000 : Rat) / 28298395017400811) [(8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1679881632094967847 : Rat) / 113193580069603244) [(8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-8001056044344960 : Rat) / 1230365000756557) [(8, 1), (13, 2), (16, 1)],
  term ((536572195550064 : Rat) / 1230365000756557) [(8, 1), (14, 1), (15, 2), (16, 1)],
  term ((2540996289813398209 : Rat) / 113193580069603244) [(8, 1), (14, 1), (16, 1)],
  term ((-276751775050837038 : Rat) / 28298395017400811) [(8, 1), (14, 2), (16, 1)],
  term ((1339434607813939896 : Rat) / 28298395017400811) [(8, 1), (15, 2), (16, 1)],
  term ((-72487606254096515 : Rat) / 9842920006052456) [(8, 1), (16, 1)],
  term ((-5196680961180000 : Rat) / 28298395017400811) [(9, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-238476531355584 : Rat) / 1230365000756557) [(9, 1), (10, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((4044046716348529469 : Rat) / 28298395017400811) [(9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-28581745286490000 : Rat) / 28298395017400811) [(9, 1), (10, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((-1311620922455712 : Rat) / 1230365000756557) [(9, 1), (10, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((64008448354759680 : Rat) / 1230365000756557) [(9, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-812746647284472000 : Rat) / 28298395017400811) [(9, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-13501085854476021 : Rat) / 1951613449475918) [(9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((25983404805900000 : Rat) / 28298395017400811) [(9, 1), (10, 1), (13, 1), (14, 2), (16, 1)],
  term ((2685039795876705528 : Rat) / 28298395017400811) [(9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((1192382656777920 : Rat) / 1230365000756557) [(9, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((28581745286490000 : Rat) / 28298395017400811) [(9, 1), (10, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((1311620922455712 : Rat) / 1230365000756557) [(9, 1), (10, 2), (11, 1), (15, 2), (16, 1)],
  term ((-32004224177379840 : Rat) / 1230365000756557) [(9, 1), (10, 2), (12, 1), (13, 1), (16, 1)],
  term ((406373323642236000 : Rat) / 28298395017400811) [(9, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((-6495851201475000 : Rat) / 28298395017400811) [(9, 1), (10, 2), (13, 1), (14, 1), (16, 1)],
  term ((-25983404805900000 : Rat) / 28298395017400811) [(9, 1), (10, 2), (13, 1), (15, 2), (16, 1)],
  term ((21581759721793020 : Rat) / 690204756521971) [(9, 1), (10, 2), (13, 1), (16, 1)],
  term ((-298095664194480 : Rat) / 1230365000756557) [(9, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((-7176716758595898 : Rat) / 1230365000756557) [(9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-1192382656777920 : Rat) / 1230365000756557) [(9, 1), (10, 2), (15, 3), (16, 1)],
  term ((2598340480590000 : Rat) / 28298395017400811) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7145436321622500 : Rat) / 28298395017400811) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((119238265677792 : Rat) / 1230365000756557) [(9, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-4044046716348529469 : Rat) / 56596790034801622) [(9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-327905230613928 : Rat) / 1230365000756557) [(9, 1), (11, 1), (15, 2), (16, 1)],
  term ((14290872643245000 : Rat) / 28298395017400811) [(9, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((655810461227856 : Rat) / 1230365000756557) [(9, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-32004224177379840 : Rat) / 1230365000756557) [(9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((8001056044344960 : Rat) / 1230365000756557) [(9, 1), (12, 1), (13, 1), (16, 1)],
  term ((406373323642236000 : Rat) / 28298395017400811) [(9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-101593330910559000 : Rat) / 28298395017400811) [(9, 1), (12, 1), (15, 1), (16, 1)],
  term ((398027340981279609 : Rat) / 113193580069603244) [(9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-12991702402950000 : Rat) / 28298395017400811) [(9, 1), (13, 1), (14, 2), (16, 1)],
  term ((6495851201475000 : Rat) / 28298395017400811) [(9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-5395439930448255 : Rat) / 690204756521971) [(9, 1), (13, 1), (16, 1)],
  term ((-1340805847869234504 : Rat) / 28298395017400811) [(9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-596191328388960 : Rat) / 1230365000756557) [(9, 1), (14, 2), (15, 1), (16, 1)],
  term ((3588358379297949 : Rat) / 2460730001513114) [(9, 1), (15, 1), (16, 1)],
  term ((298095664194480 : Rat) / 1230365000756557) [(9, 1), (15, 3), (16, 1)],
  term ((57163490572980000 : Rat) / 28298395017400811) [(9, 2), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((2623241844911424 : Rat) / 1230365000756557) [(9, 2), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-51966809611800000 : Rat) / 28298395017400811) [(9, 2), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2384765313555840 : Rat) / 1230365000756557) [(9, 2), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2964748995139542240 : Rat) / 28298395017400811) [(9, 2), (10, 1), (14, 1), (16, 1)],
  term ((-28581745286490000 : Rat) / 28298395017400811) [(9, 2), (10, 2), (11, 1), (13, 1), (16, 1)],
  term ((-1311620922455712 : Rat) / 1230365000756557) [(9, 2), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-5196680961180000 : Rat) / 28298395017400811) [(9, 2), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-238476531355584 : Rat) / 1230365000756557) [(9, 2), (10, 2), (15, 2), (16, 1)],
  term ((72487606254096515 : Rat) / 1230365000756557) [(9, 2), (10, 2), (16, 1)],
  term ((-28581745286490000 : Rat) / 28298395017400811) [(9, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((7145436321622500 : Rat) / 28298395017400811) [(9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-1311620922455712 : Rat) / 1230365000756557) [(9, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((327905230613928 : Rat) / 1230365000756557) [(9, 2), (11, 1), (15, 1), (16, 1)],
  term ((25983404805900000 : Rat) / 28298395017400811) [(9, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1299170240295000 : Rat) / 28298395017400811) [(9, 2), (13, 1), (15, 1), (16, 1)],
  term ((1192382656777920 : Rat) / 1230365000756557) [(9, 2), (14, 1), (15, 2), (16, 1)],
  term ((1482374497569771120 : Rat) / 28298395017400811) [(9, 2), (14, 1), (16, 1)],
  term ((59619132838896 : Rat) / 1230365000756557) [(9, 2), (15, 2), (16, 1)],
  term ((-72487606254096515 : Rat) / 4921460003026228) [(9, 2), (16, 1)],
  term ((-32004224177379840 : Rat) / 1230365000756557) [(10, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((3404872134168288 : Rat) / 1230365000756557) [(10, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((457995915133538436 : Rat) / 28298395017400811) [(10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((5196680961180000 : Rat) / 1230365000756557) [(10, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((1336390307567996925 : Rat) / 28298395017400811) [(10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3994481900206032 : Rat) / 1230365000756557) [(10, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1178820753326696556 : Rat) / 28298395017400811) [(10, 1), (11, 2), (14, 1), (16, 1)],
  term ((848296878429953220 : Rat) / 28298395017400811) [(10, 1), (12, 1), (14, 1), (16, 1)],
  term ((935178421653215553 : Rat) / 56596790034801622) [(10, 1), (12, 1), (14, 2), (16, 1)],
  term ((134518482142185609 : Rat) / 28298395017400811) [(10, 1), (12, 2), (14, 1), (16, 1)],
  term ((1275922869278676177 : Rat) / 56596790034801622) [(10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-233530095897682551 : Rat) / 28298395017400811) [(10, 1), (13, 2), (14, 1), (16, 1)],
  term ((4899123653804755497 : Rat) / 28298395017400811) [(10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1104802868369093734 : Rat) / 28298395017400811) [(10, 1), (14, 1), (16, 1)],
  term ((516936269122886196 : Rat) / 28298395017400811) [(10, 1), (14, 2), (16, 1)],
  term ((223308802047927846 : Rat) / 28298395017400811) [(10, 1), (14, 3), (16, 1)],
  term ((1178820753326696556 : Rat) / 28298395017400811) [(10, 2), (11, 1), (15, 1), (16, 1)],
  term ((32004224177379840 : Rat) / 1230365000756557) [(10, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3404872134168288 : Rat) / 1230365000756557) [(10, 2), (12, 1), (15, 2), (16, 1)],
  term ((-5196680961180000 : Rat) / 1230365000756557) [(10, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-457995915133538436 : Rat) / 28298395017400811) [(10, 2), (13, 1), (15, 1), (16, 1)],
  term ((3994481900206032 : Rat) / 1230365000756557) [(10, 2), (14, 1), (15, 2), (16, 1)],
  term ((-1336390307567996925 : Rat) / 28298395017400811) [(10, 2), (15, 2), (16, 1)],
  term ((16002112088689920 : Rat) / 1230365000756557) [(11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1702436067084144 : Rat) / 1230365000756557) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-228997957566769218 : Rat) / 28298395017400811) [(11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2598340480590000 : Rat) / 1230365000756557) [(11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-1336390307567996925 : Rat) / 56596790034801622) [(11, 1), (14, 1), (15, 1), (16, 1)],
  term ((1997240950103016 : Rat) / 1230365000756557) [(11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-294705188331674139 : Rat) / 28298395017400811) [(11, 1), (15, 1), (16, 1)],
  term ((589410376663348278 : Rat) / 28298395017400811) [(11, 2), (14, 1), (16, 1)],
  term ((-8001056044344960 : Rat) / 1230365000756557) [(12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-424148439214976610 : Rat) / 28298395017400811) [(12, 1), (14, 1), (16, 1)],
  term ((-935178421653215553 : Rat) / 113193580069603244) [(12, 1), (14, 2), (16, 1)],
  term ((851218033542072 : Rat) / 1230365000756557) [(12, 1), (15, 2), (16, 1)],
  term ((-134518482142185609 : Rat) / 56596790034801622) [(12, 2), (14, 1), (16, 1)],
  term ((-1156399207171536177 : Rat) / 113193580069603244) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((114498978783384609 : Rat) / 28298395017400811) [(13, 1), (15, 1), (16, 1)],
  term ((233530095897682551 : Rat) / 56596790034801622) [(13, 2), (14, 1), (16, 1)],
  term ((-4945060195657124865 : Rat) / 56596790034801622) [(14, 1), (15, 2), (16, 1)],
  term ((552401434184546867 : Rat) / 28298395017400811) [(14, 1), (16, 1)],
  term ((-258468134561443098 : Rat) / 28298395017400811) [(14, 2), (16, 1)],
  term ((-111654401023963923 : Rat) / 28298395017400811) [(14, 3), (16, 1)],
  term ((1336390307567996925 : Rat) / 113193580069603244) [(15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 21, terms 600 through 693. -/
theorem ep_Q2_020_block_21_0600_0693_valid :
    checkProductSumEq ep_Q2_020_partials_21_0600_0693
      ep_Q2_020_block_21_0600_0693 = true := by
  native_decide

end EpQ2020TermShards

end Patterns

end EndpointCertificate

end Problem97
