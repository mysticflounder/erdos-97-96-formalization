/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_008, term block 9:700-799

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_008`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2008TermShards

/-- Generator polynomial 9 for endpoint certificate `ep_Q2_008`. -/
def ep_Q2_008_generator_09_0700_0799 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(2, 1)]
]

/-- Coefficient term 700 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0700 : Poly :=
[
  term ((645409253829534198466965805060992000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 2), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 700 for generator 9. -/
def ep_Q2_008_partial_09_0700 : Poly :=
[
  term ((1290818507659068396933931610121984000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (6, 1), (7, 2), (13, 2), (15, 1), (16, 1)],
  term ((-645409253829534198466965805060992000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 700 for generator 9. -/
theorem ep_Q2_008_partial_09_0700_valid :
    mulPoly ep_Q2_008_coefficient_09_0700
        ep_Q2_008_generator_09_0700_0799 =
      ep_Q2_008_partial_09_0700 := by
  native_decide

/-- Coefficient term 701 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0701 : Poly :=
[
  term ((-1290818507659068396933931610121984000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 2), (13, 2), (15, 3), (16, 1)]
]

/-- Partial product 701 for generator 9. -/
def ep_Q2_008_partial_09_0701 : Poly :=
[
  term ((-2581637015318136793867863220243968000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (6, 1), (7, 2), (13, 2), (15, 3), (16, 1)],
  term ((1290818507659068396933931610121984000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 2), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 701 for generator 9. -/
theorem ep_Q2_008_partial_09_0701_valid :
    mulPoly ep_Q2_008_coefficient_09_0701
        ep_Q2_008_generator_09_0700_0799 =
      ep_Q2_008_partial_09_0701 := by
  native_decide

/-- Coefficient term 702 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0702 : Poly :=
[
  term ((11389575067580015267064102442252800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 2), (15, 1), (16, 1)]
]

/-- Partial product 702 for generator 9. -/
def ep_Q2_008_partial_09_0702 : Poly :=
[
  term ((22779150135160030534128204884505600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (6, 1), (7, 2), (15, 1), (16, 1)],
  term ((-11389575067580015267064102442252800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 702 for generator 9. -/
theorem ep_Q2_008_partial_09_0702_valid :
    mulPoly ep_Q2_008_coefficient_09_0702
        ep_Q2_008_generator_09_0700_0799 =
      ep_Q2_008_partial_09_0702 := by
  native_decide

/-- Coefficient term 703 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0703 : Poly :=
[
  term ((-22779150135160030534128204884505600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 2), (15, 3), (16, 1)]
]

/-- Partial product 703 for generator 9. -/
def ep_Q2_008_partial_09_0703 : Poly :=
[
  term ((-45558300270320061068256409769011200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (6, 1), (7, 2), (15, 3), (16, 1)],
  term ((22779150135160030534128204884505600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 703 for generator 9. -/
theorem ep_Q2_008_partial_09_0703_valid :
    mulPoly ep_Q2_008_coefficient_09_0703
        ep_Q2_008_generator_09_0700_0799 =
      ep_Q2_008_partial_09_0703 := by
  native_decide

/-- Coefficient term 704 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0704 : Poly :=
[
  term ((-86111778068036223792 : Rat) / 692956453614176359) [(5, 1), (6, 1), (9, 1), (13, 2), (16, 1)]
]

/-- Partial product 704 for generator 9. -/
def ep_Q2_008_partial_09_0704 : Poly :=
[
  term ((-172223556136072447584 : Rat) / 692956453614176359) [(2, 1), (5, 1), (6, 1), (9, 1), (13, 2), (16, 1)],
  term ((86111778068036223792 : Rat) / 692956453614176359) [(5, 1), (6, 1), (9, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 704 for generator 9. -/
theorem ep_Q2_008_partial_09_0704_valid :
    mulPoly ep_Q2_008_coefficient_09_0704
        ep_Q2_008_generator_09_0700_0799 =
      ep_Q2_008_partial_09_0704 := by
  native_decide

/-- Coefficient term 705 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0705 : Poly :=
[
  term ((30955433660627124993 : Rat) / 2771825814456705436) [(5, 1), (6, 1), (9, 1), (16, 1)]
]

/-- Partial product 705 for generator 9. -/
def ep_Q2_008_partial_09_0705 : Poly :=
[
  term ((30955433660627124993 : Rat) / 1385912907228352718) [(2, 1), (5, 1), (6, 1), (9, 1), (16, 1)],
  term ((-30955433660627124993 : Rat) / 2771825814456705436) [(5, 1), (6, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 705 for generator 9. -/
theorem ep_Q2_008_partial_09_0705_valid :
    mulPoly ep_Q2_008_coefficient_09_0705
        ep_Q2_008_generator_09_0700_0799 =
      ep_Q2_008_partial_09_0705 := by
  native_decide

/-- Coefficient term 706 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0706 : Poly :=
[
  term ((-47640465710460000 : Rat) / 692956453614176359) [(5, 1), (6, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 706 for generator 9. -/
def ep_Q2_008_partial_09_0706 : Poly :=
[
  term ((-95280931420920000 : Rat) / 692956453614176359) [(2, 1), (5, 1), (6, 1), (10, 1), (11, 1), (16, 1)],
  term ((47640465710460000 : Rat) / 692956453614176359) [(5, 1), (6, 1), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 706 for generator 9. -/
theorem ep_Q2_008_partial_09_0706_valid :
    mulPoly ep_Q2_008_coefficient_09_0706
        ep_Q2_008_generator_09_0700_0799 =
      ep_Q2_008_partial_09_0706 := by
  native_decide

/-- Coefficient term 707 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0707 : Poly :=
[
  term ((244293712003370549631544627149109440000 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (6, 1), (10, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 707 for generator 9. -/
def ep_Q2_008_partial_09_0707 : Poly :=
[
  term ((488587424006741099263089254298218880000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (6, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-244293712003370549631544627149109440000 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (6, 1), (10, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 707 for generator 9. -/
theorem ep_Q2_008_partial_09_0707_valid :
    mulPoly ep_Q2_008_coefficient_09_0707
        ep_Q2_008_generator_09_0700_0799 =
      ep_Q2_008_partial_09_0707 := by
  native_decide

/-- Coefficient term 708 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0708 : Poly :=
[
  term ((4843636076722786875 : Rat) / 1385912907228352718) [(5, 1), (6, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 708 for generator 9. -/
def ep_Q2_008_partial_09_0708 : Poly :=
[
  term ((4843636076722786875 : Rat) / 692956453614176359) [(2, 1), (5, 1), (6, 1), (10, 1), (13, 1), (16, 1)],
  term ((-4843636076722786875 : Rat) / 1385912907228352718) [(5, 1), (6, 1), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 708 for generator 9. -/
theorem ep_Q2_008_partial_09_0708_valid :
    mulPoly ep_Q2_008_coefficient_09_0708
        ep_Q2_008_generator_09_0700_0799 =
      ep_Q2_008_partial_09_0708 := by
  native_decide

/-- Coefficient term 709 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0709 : Poly :=
[
  term ((-760550990762443999512984918128450496000 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (6, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 709 for generator 9. -/
def ep_Q2_008_partial_09_0709 : Poly :=
[
  term ((-1521101981524887999025969836256900992000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (6, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((760550990762443999512984918128450496000 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (6, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 709 for generator 9. -/
theorem ep_Q2_008_partial_09_0709_valid :
    mulPoly ep_Q2_008_coefficient_09_0709
        ep_Q2_008_generator_09_0700_0799 =
      ep_Q2_008_partial_09_0709 := by
  native_decide

/-- Coefficient term 710 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0710 : Poly :=
[
  term ((-62771517515721436069662227141158588714575 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (6, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 710 for generator 9. -/
def ep_Q2_008_partial_09_0710 : Poly :=
[
  term ((-125543035031442872139324454282317177429150 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((62771517515721436069662227141158588714575 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (6, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 710 for generator 9. -/
theorem ep_Q2_008_partial_09_0710_valid :
    mulPoly ep_Q2_008_coefficient_09_0710
        ep_Q2_008_generator_09_0700_0799 =
      ep_Q2_008_partial_09_0710 := by
  native_decide

/-- Coefficient term 711 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0711 : Poly :=
[
  term ((-66994404905334375 : Rat) / 692956453614176359) [(5, 1), (6, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 711 for generator 9. -/
def ep_Q2_008_partial_09_0711 : Poly :=
[
  term ((-133988809810668750 : Rat) / 692956453614176359) [(2, 1), (5, 1), (6, 1), (11, 1), (12, 1), (16, 1)],
  term ((66994404905334375 : Rat) / 692956453614176359) [(5, 1), (6, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 711 for generator 9. -/
theorem ep_Q2_008_partial_09_0711_valid :
    mulPoly ep_Q2_008_coefficient_09_0711
        ep_Q2_008_generator_09_0700_0799 =
      ep_Q2_008_partial_09_0711 := by
  native_decide

/-- Coefficient term 712 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0712 : Poly :=
[
  term ((-19894044390296437222431488782249663761750 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 712 for generator 9. -/
def ep_Q2_008_partial_09_0712 : Poly :=
[
  term ((-39788088780592874444862977564499327523500 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((19894044390296437222431488782249663761750 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 712 for generator 9. -/
theorem ep_Q2_008_partial_09_0712_valid :
    mulPoly ep_Q2_008_coefficient_09_0712
        ep_Q2_008_generator_09_0700_0799 =
      ep_Q2_008_partial_09_0712 := by
  native_decide

/-- Coefficient term 713 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0713 : Poly :=
[
  term ((956121245529929599387752468504337766400 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (6, 1), (11, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 713 for generator 9. -/
def ep_Q2_008_partial_09_0713 : Poly :=
[
  term ((1912242491059859198775504937008675532800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (6, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-956121245529929599387752468504337766400 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (6, 1), (11, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 713 for generator 9. -/
theorem ep_Q2_008_partial_09_0713_valid :
    mulPoly ep_Q2_008_coefficient_09_0713
        ep_Q2_008_generator_09_0700_0799 =
      ep_Q2_008_partial_09_0713 := by
  native_decide

/-- Coefficient term 714 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0714 : Poly :=
[
  term ((58576465092935895420021750461658590283600 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (6, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 714 for generator 9. -/
def ep_Q2_008_partial_09_0714 : Poly :=
[
  term ((117152930185871790840043500923317180567200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((-58576465092935895420021750461658590283600 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (6, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 714 for generator 9. -/
theorem ep_Q2_008_partial_09_0714_valid :
    mulPoly ep_Q2_008_coefficient_09_0714
        ep_Q2_008_generator_09_0700_0799 =
      ep_Q2_008_partial_09_0714 := by
  native_decide

/-- Coefficient term 715 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0715 : Poly :=
[
  term ((550696689531679500 : Rat) / 692956453614176359) [(5, 1), (6, 1), (11, 1), (16, 1)]
]

/-- Partial product 715 for generator 9. -/
def ep_Q2_008_partial_09_0715 : Poly :=
[
  term ((1101393379063359000 : Rat) / 692956453614176359) [(2, 1), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((-550696689531679500 : Rat) / 692956453614176359) [(5, 1), (6, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 715 for generator 9. -/
theorem ep_Q2_008_partial_09_0715_valid :
    mulPoly ep_Q2_008_coefficient_09_0715
        ep_Q2_008_generator_09_0700_0799 =
      ep_Q2_008_partial_09_0715 := by
  native_decide

/-- Coefficient term 716 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0716 : Poly :=
[
  term ((-166741629986610000 : Rat) / 692956453614176359) [(5, 1), (6, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 716 for generator 9. -/
def ep_Q2_008_partial_09_0716 : Poly :=
[
  term ((-333483259973220000 : Rat) / 692956453614176359) [(2, 1), (5, 1), (6, 1), (11, 2), (15, 1), (16, 1)],
  term ((166741629986610000 : Rat) / 692956453614176359) [(5, 1), (6, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 716 for generator 9. -/
theorem ep_Q2_008_partial_09_0716_valid :
    mulPoly ep_Q2_008_coefficient_09_0716
        ep_Q2_008_generator_09_0700_0799 =
      ep_Q2_008_partial_09_0716 := by
  native_decide

/-- Coefficient term 717 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0717 : Poly :=
[
  term ((-384422964890970476913 : Rat) / 5543651628913410872) [(5, 1), (6, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 717 for generator 9. -/
def ep_Q2_008_partial_09_0717 : Poly :=
[
  term ((-384422964890970476913 : Rat) / 2771825814456705436) [(2, 1), (5, 1), (6, 1), (12, 1), (13, 1), (16, 1)],
  term ((384422964890970476913 : Rat) / 5543651628913410872) [(5, 1), (6, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 717 for generator 9. -/
theorem ep_Q2_008_partial_09_0717_valid :
    mulPoly ep_Q2_008_coefficient_09_0717
        ep_Q2_008_generator_09_0700_0799 =
      ep_Q2_008_partial_09_0717 := by
  native_decide

/-- Coefficient term 718 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0718 : Poly :=
[
  term ((21527944517009055948 : Rat) / 692956453614176359) [(5, 1), (6, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 718 for generator 9. -/
def ep_Q2_008_partial_09_0718 : Poly :=
[
  term ((43055889034018111896 : Rat) / 692956453614176359) [(2, 1), (5, 1), (6, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-21527944517009055948 : Rat) / 692956453614176359) [(5, 1), (6, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 718 for generator 9. -/
theorem ep_Q2_008_partial_09_0718_valid :
    mulPoly ep_Q2_008_coefficient_09_0718
        ep_Q2_008_generator_09_0700_0799 =
      ep_Q2_008_partial_09_0718 := by
  native_decide

/-- Coefficient term 719 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0719 : Poly :=
[
  term ((-5512819400368696418782510098532711359943839 : Rat) / 1349660814810636123005926626071864437583984) [(5, 1), (6, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 719 for generator 9. -/
def ep_Q2_008_partial_09_0719 : Poly :=
[
  term ((-5512819400368696418782510098532711359943839 : Rat) / 674830407405318061502963313035932218791992) [(2, 1), (5, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((5512819400368696418782510098532711359943839 : Rat) / 1349660814810636123005926626071864437583984) [(5, 1), (6, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 719 for generator 9. -/
theorem ep_Q2_008_partial_09_0719_valid :
    mulPoly ep_Q2_008_coefficient_09_0719
        ep_Q2_008_generator_09_0700_0799 =
      ep_Q2_008_partial_09_0719 := by
  native_decide

/-- Coefficient term 720 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0720 : Poly :=
[
  term ((-9445781916965549071529136695663594096872181 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (6, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 720 for generator 9. -/
def ep_Q2_008_partial_09_0720 : Poly :=
[
  term ((-18891563833931098143058273391327188193744362 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((9445781916965549071529136695663594096872181 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (6, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 720 for generator 9. -/
theorem ep_Q2_008_partial_09_0720_valid :
    mulPoly ep_Q2_008_coefficient_09_0720
        ep_Q2_008_generator_09_0700_0799 =
      ep_Q2_008_partial_09_0720 := by
  native_decide

/-- Coefficient term 721 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0721 : Poly :=
[
  term ((150445491817593666083 : Rat) / 2771825814456705436) [(5, 1), (6, 1), (13, 1), (16, 1)]
]

/-- Partial product 721 for generator 9. -/
def ep_Q2_008_partial_09_0721 : Poly :=
[
  term ((150445491817593666083 : Rat) / 1385912907228352718) [(2, 1), (5, 1), (6, 1), (13, 1), (16, 1)],
  term ((-150445491817593666083 : Rat) / 2771825814456705436) [(5, 1), (6, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 721 for generator 9. -/
theorem ep_Q2_008_partial_09_0721_valid :
    mulPoly ep_Q2_008_coefficient_09_0721
        ep_Q2_008_generator_09_0700_0799 =
      ep_Q2_008_partial_09_0721 := by
  native_decide

/-- Coefficient term 722 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0722 : Poly :=
[
  term ((17671367316459434795066724701114576138470146 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (6, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 722 for generator 9. -/
def ep_Q2_008_partial_09_0722 : Poly :=
[
  term ((35342734632918869590133449402229152276940292 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (6, 1), (13, 2), (15, 1), (16, 1)],
  term ((-17671367316459434795066724701114576138470146 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (6, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 722 for generator 9. -/
theorem ep_Q2_008_partial_09_0722_valid :
    mulPoly ep_Q2_008_coefficient_09_0722
        ep_Q2_008_generator_09_0700_0799 =
      ep_Q2_008_partial_09_0722 := by
  native_decide

/-- Coefficient term 723 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0723 : Poly :=
[
  term ((215279445170090559480 : Rat) / 692956453614176359) [(5, 1), (6, 1), (13, 2), (15, 3), (16, 1)]
]

/-- Partial product 723 for generator 9. -/
def ep_Q2_008_partial_09_0723 : Poly :=
[
  term ((430558890340181118960 : Rat) / 692956453614176359) [(2, 1), (5, 1), (6, 1), (13, 2), (15, 3), (16, 1)],
  term ((-215279445170090559480 : Rat) / 692956453614176359) [(5, 1), (6, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 723 for generator 9. -/
theorem ep_Q2_008_partial_09_0723_valid :
    mulPoly ep_Q2_008_coefficient_09_0723
        ep_Q2_008_generator_09_0700_0799 =
      ep_Q2_008_partial_09_0723 := by
  native_decide

/-- Coefficient term 724 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0724 : Poly :=
[
  term ((10763972258504527974 : Rat) / 692956453614176359) [(5, 1), (6, 1), (13, 3), (16, 1)]
]

/-- Partial product 724 for generator 9. -/
def ep_Q2_008_partial_09_0724 : Poly :=
[
  term ((21527944517009055948 : Rat) / 692956453614176359) [(2, 1), (5, 1), (6, 1), (13, 3), (16, 1)],
  term ((-10763972258504527974 : Rat) / 692956453614176359) [(5, 1), (6, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 724 for generator 9. -/
theorem ep_Q2_008_partial_09_0724_valid :
    mulPoly ep_Q2_008_coefficient_09_0724
        ep_Q2_008_generator_09_0700_0799 =
      ep_Q2_008_partial_09_0724 := by
  native_decide

/-- Coefficient term 725 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0725 : Poly :=
[
  term ((-127688267393908154570641191318960823373969 : Rat) / 1349660814810636123005926626071864437583984) [(5, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 725 for generator 9. -/
def ep_Q2_008_partial_09_0725 : Poly :=
[
  term ((-127688267393908154570641191318960823373969 : Rat) / 674830407405318061502963313035932218791992) [(2, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((127688267393908154570641191318960823373969 : Rat) / 1349660814810636123005926626071864437583984) [(5, 1), (6, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 725 for generator 9. -/
theorem ep_Q2_008_partial_09_0725_valid :
    mulPoly ep_Q2_008_coefficient_09_0725
        ep_Q2_008_generator_09_0700_0799 =
      ep_Q2_008_partial_09_0725 := by
  native_decide

/-- Coefficient term 726 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0726 : Poly :=
[
  term ((2104639235181182094975540307520976395808377 : Rat) / 168707601851329515375740828258983054697998) [(5, 1), (6, 1), (15, 3), (16, 1)]
]

/-- Partial product 726 for generator 9. -/
def ep_Q2_008_partial_09_0726 : Poly :=
[
  term ((2104639235181182094975540307520976395808377 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (6, 1), (15, 3), (16, 1)],
  term ((-2104639235181182094975540307520976395808377 : Rat) / 168707601851329515375740828258983054697998) [(5, 1), (6, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 726 for generator 9. -/
theorem ep_Q2_008_partial_09_0726_valid :
    mulPoly ep_Q2_008_coefficient_09_0726
        ep_Q2_008_generator_09_0700_0799 =
      ep_Q2_008_partial_09_0726 := by
  native_decide

/-- Coefficient term 727 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0727 : Poly :=
[
  term ((-322704626914767099233482902530496000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 2), (7, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 727 for generator 9. -/
def ep_Q2_008_partial_09_0727 : Poly :=
[
  term ((-645409253829534198466965805060992000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (6, 2), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((322704626914767099233482902530496000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 2), (7, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 727 for generator 9. -/
theorem ep_Q2_008_partial_09_0727_valid :
    mulPoly ep_Q2_008_coefficient_09_0727
        ep_Q2_008_generator_09_0700_0799 =
      ep_Q2_008_partial_09_0727 := by
  native_decide

/-- Coefficient term 728 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0728 : Poly :=
[
  term ((-5694787533790007633532051221126400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 2), (7, 1), (15, 2), (16, 1)]
]

/-- Partial product 728 for generator 9. -/
def ep_Q2_008_partial_09_0728 : Poly :=
[
  term ((-11389575067580015267064102442252800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (6, 2), (7, 1), (15, 2), (16, 1)],
  term ((5694787533790007633532051221126400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 2), (7, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 728 for generator 9. -/
theorem ep_Q2_008_partial_09_0728_valid :
    mulPoly ep_Q2_008_coefficient_09_0728
        ep_Q2_008_generator_09_0700_0799 =
      ep_Q2_008_partial_09_0728 := by
  native_decide

/-- Coefficient term 729 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0729 : Poly :=
[
  term ((-11910116427615000 : Rat) / 692956453614176359) [(5, 1), (6, 2), (11, 1), (16, 1)]
]

/-- Partial product 729 for generator 9. -/
def ep_Q2_008_partial_09_0729 : Poly :=
[
  term ((-23820232855230000 : Rat) / 692956453614176359) [(2, 1), (5, 1), (6, 2), (11, 1), (16, 1)],
  term ((11910116427615000 : Rat) / 692956453614176359) [(5, 1), (6, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 729 for generator 9. -/
theorem ep_Q2_008_partial_09_0729_valid :
    mulPoly ep_Q2_008_coefficient_09_0729
        ep_Q2_008_generator_09_0700_0799 =
      ep_Q2_008_partial_09_0729 := by
  native_decide

/-- Coefficient term 730 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0730 : Poly :=
[
  term ((199241833525243875 : Rat) / 1385912907228352718) [(5, 1), (6, 2), (13, 1), (16, 1)]
]

/-- Partial product 730 for generator 9. -/
def ep_Q2_008_partial_09_0730 : Poly :=
[
  term ((199241833525243875 : Rat) / 692956453614176359) [(2, 1), (5, 1), (6, 2), (13, 1), (16, 1)],
  term ((-199241833525243875 : Rat) / 1385912907228352718) [(5, 1), (6, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 730 for generator 9. -/
theorem ep_Q2_008_partial_09_0730_valid :
    mulPoly ep_Q2_008_coefficient_09_0730
        ep_Q2_008_generator_09_0700_0799 =
      ep_Q2_008_partial_09_0730 := by
  native_decide

/-- Coefficient term 731 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0731 : Poly :=
[
  term ((-6551747197437959033898108762381316290596670 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (6, 2), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 731 for generator 9. -/
def ep_Q2_008_partial_09_0731 : Poly :=
[
  term ((-13103494394875918067796217524762632581193340 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (6, 2), (13, 2), (15, 1), (16, 1)],
  term ((6551747197437959033898108762381316290596670 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (6, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 731 for generator 9. -/
theorem ep_Q2_008_partial_09_0731_valid :
    mulPoly ep_Q2_008_coefficient_09_0731
        ep_Q2_008_generator_09_0700_0799 =
      ep_Q2_008_partial_09_0731 := by
  native_decide

/-- Coefficient term 732 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0732 : Poly :=
[
  term ((-591233758816710615558086028488332001985549 : Rat) / 674830407405318061502963313035932218791992) [(5, 1), (6, 2), (15, 1), (16, 1)]
]

/-- Partial product 732 for generator 9. -/
def ep_Q2_008_partial_09_0732 : Poly :=
[
  term ((-591233758816710615558086028488332001985549 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (5, 1), (6, 2), (15, 1), (16, 1)],
  term ((591233758816710615558086028488332001985549 : Rat) / 674830407405318061502963313035932218791992) [(5, 1), (6, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 732 for generator 9. -/
theorem ep_Q2_008_partial_09_0732_valid :
    mulPoly ep_Q2_008_coefficient_09_0732
        ep_Q2_008_generator_09_0700_0799 =
      ep_Q2_008_partial_09_0732 := by
  native_decide

/-- Coefficient term 733 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0733 : Poly :=
[
  term ((92050785676708875 : Rat) / 1385912907228352718) [(5, 1), (7, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 733 for generator 9. -/
def ep_Q2_008_partial_09_0733 : Poly :=
[
  term ((92050785676708875 : Rat) / 692956453614176359) [(2, 1), (5, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((-92050785676708875 : Rat) / 1385912907228352718) [(5, 1), (7, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 733 for generator 9. -/
theorem ep_Q2_008_partial_09_0733_valid :
    mulPoly ep_Q2_008_coefficient_09_0733
        ep_Q2_008_generator_09_0700_0799 =
      ep_Q2_008_partial_09_0733 := by
  native_decide

/-- Coefficient term 734 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0734 : Poly :=
[
  term ((-239030311382482399846938117126084441600 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (7, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 734 for generator 9. -/
def ep_Q2_008_partial_09_0734 : Poly :=
[
  term ((-478060622764964799693876234252168883200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (7, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((239030311382482399846938117126084441600 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (7, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 734 for generator 9. -/
theorem ep_Q2_008_partial_09_0734_valid :
    mulPoly ep_Q2_008_coefficient_09_0734
        ep_Q2_008_generator_09_0700_0799 =
      ep_Q2_008_partial_09_0734 := by
  native_decide

/-- Coefficient term 735 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0735 : Poly :=
[
  term ((-14644116273233973855005437615414647570900 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (7, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 735 for generator 9. -/
def ep_Q2_008_partial_09_0735 : Poly :=
[
  term ((-29288232546467947710010875230829295141800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((14644116273233973855005437615414647570900 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (7, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 735 for generator 9. -/
theorem ep_Q2_008_partial_09_0735_valid :
    mulPoly ep_Q2_008_coefficient_09_0735
        ep_Q2_008_generator_09_0700_0799 =
      ep_Q2_008_partial_09_0735 := by
  native_decide

/-- Coefficient term 736 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0736 : Poly :=
[
  term ((41685407496652500 : Rat) / 692956453614176359) [(5, 1), (7, 1), (11, 2), (16, 1)]
]

/-- Partial product 736 for generator 9. -/
def ep_Q2_008_partial_09_0736 : Poly :=
[
  term ((83370814993305000 : Rat) / 692956453614176359) [(2, 1), (5, 1), (7, 1), (11, 2), (16, 1)],
  term ((-41685407496652500 : Rat) / 692956453614176359) [(5, 1), (7, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 736 for generator 9. -/
theorem ep_Q2_008_partial_09_0736_valid :
    mulPoly ep_Q2_008_coefficient_09_0736
        ep_Q2_008_generator_09_0700_0799 =
      ep_Q2_008_partial_09_0736 := by
  native_decide

/-- Coefficient term 737 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0737 : Poly :=
[
  term ((-673411150155922742207555806920901200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 737 for generator 9. -/
def ep_Q2_008_partial_09_0737 : Poly :=
[
  term ((-1346822300311845484415111613841802400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((673411150155922742207555806920901200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 737 for generator 9. -/
theorem ep_Q2_008_partial_09_0737_valid :
    mulPoly ep_Q2_008_coefficient_09_0737
        ep_Q2_008_generator_09_0700_0799 =
      ep_Q2_008_partial_09_0737 := by
  native_decide

/-- Coefficient term 738 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0738 : Poly :=
[
  term ((242028470186075324425112176897872000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 738 for generator 9. -/
def ep_Q2_008_partial_09_0738 : Poly :=
[
  term ((484056940372150648850224353795744000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-242028470186075324425112176897872000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 738 for generator 9. -/
theorem ep_Q2_008_partial_09_0738_valid :
    mulPoly ep_Q2_008_coefficient_09_0738
        ep_Q2_008_generator_09_0700_0799 =
      ep_Q2_008_partial_09_0738 := by
  native_decide

/-- Coefficient term 739 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0739 : Poly :=
[
  term ((-166749471357106723239 : Rat) / 5543651628913410872) [(5, 1), (7, 1), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 739 for generator 9. -/
def ep_Q2_008_partial_09_0739 : Poly :=
[
  term ((-166749471357106723239 : Rat) / 2771825814456705436) [(2, 1), (5, 1), (7, 1), (12, 1), (13, 2), (16, 1)],
  term ((166749471357106723239 : Rat) / 5543651628913410872) [(5, 1), (7, 1), (12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 739 for generator 9. -/
theorem ep_Q2_008_partial_09_0739_valid :
    mulPoly ep_Q2_008_coefficient_09_0739
        ep_Q2_008_generator_09_0700_0799 =
      ep_Q2_008_partial_09_0739 := by
  native_decide

/-- Coefficient term 740 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0740 : Poly :=
[
  term ((13825257909492239719898799349728360000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 740 for generator 9. -/
def ep_Q2_008_partial_09_0740 : Poly :=
[
  term ((27650515818984479439797598699456720000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-13825257909492239719898799349728360000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 740 for generator 9. -/
theorem ep_Q2_008_partial_09_0740_valid :
    mulPoly ep_Q2_008_coefficient_09_0740
        ep_Q2_008_generator_09_0700_0799 =
      ep_Q2_008_partial_09_0740 := by
  native_decide

/-- Coefficient term 741 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0741 : Poly :=
[
  term ((32840951158957446503657795384244000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 741 for generator 9. -/
def ep_Q2_008_partial_09_0741 : Poly :=
[
  term ((65681902317914893007315590768488000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((-32840951158957446503657795384244000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 741 for generator 9. -/
theorem ep_Q2_008_partial_09_0741_valid :
    mulPoly ep_Q2_008_coefficient_09_0741
        ep_Q2_008_generator_09_0700_0799 =
      ep_Q2_008_partial_09_0741 := by
  native_decide

/-- Coefficient term 742 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0742 : Poly :=
[
  term ((578290294120164951 : Rat) / 764641603988056672) [(5, 1), (7, 1), (12, 1), (16, 1)]
]

/-- Partial product 742 for generator 9. -/
def ep_Q2_008_partial_09_0742 : Poly :=
[
  term ((578290294120164951 : Rat) / 382320801994028336) [(2, 1), (5, 1), (7, 1), (12, 1), (16, 1)],
  term ((-578290294120164951 : Rat) / 764641603988056672) [(5, 1), (7, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 742 for generator 9. -/
theorem ep_Q2_008_partial_09_0742_valid :
    mulPoly ep_Q2_008_coefficient_09_0742
        ep_Q2_008_generator_09_0700_0799 =
      ep_Q2_008_partial_09_0742 := by
  native_decide

/-- Coefficient term 743 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0743 : Poly :=
[
  term ((1060953045252120477830586106212121437989357 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 743 for generator 9. -/
def ep_Q2_008_partial_09_0743 : Poly :=
[
  term ((2121906090504240955661172212424242875978714 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1060953045252120477830586106212121437989357 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 743 for generator 9. -/
theorem ep_Q2_008_partial_09_0743_valid :
    mulPoly ep_Q2_008_coefficient_09_0743
        ep_Q2_008_generator_09_0700_0799 =
      ep_Q2_008_partial_09_0743 := by
  native_decide

/-- Coefficient term 744 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0744 : Poly :=
[
  term ((-1095078697610235374508799516228929600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 744 for generator 9. -/
def ep_Q2_008_partial_09_0744 : Poly :=
[
  term ((-2190157395220470749017599032457859200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 1), (13, 1), (15, 3), (16, 1)],
  term ((1095078697610235374508799516228929600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 744 for generator 9. -/
theorem ep_Q2_008_partial_09_0744_valid :
    mulPoly ep_Q2_008_coefficient_09_0744
        ep_Q2_008_generator_09_0700_0799 =
      ep_Q2_008_partial_09_0744 := by
  native_decide

/-- Coefficient term 745 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0745 : Poly :=
[
  term ((2162134463183629375757086113742080000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 745 for generator 9. -/
def ep_Q2_008_partial_09_0745 : Poly :=
[
  term ((4324268926367258751514172227484160000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((-2162134463183629375757086113742080000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 745 for generator 9. -/
theorem ep_Q2_008_partial_09_0745_valid :
    mulPoly ep_Q2_008_coefficient_09_0745
        ep_Q2_008_generator_09_0700_0799 =
      ep_Q2_008_partial_09_0745 := by
  native_decide

/-- Coefficient term 746 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0746 : Poly :=
[
  term ((-322704626914767099233482902530496000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (13, 2), (15, 4), (16, 1)]
]

/-- Partial product 746 for generator 9. -/
def ep_Q2_008_partial_09_0746 : Poly :=
[
  term ((-645409253829534198466965805060992000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 1), (13, 2), (15, 4), (16, 1)],
  term ((322704626914767099233482902530496000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (13, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 746 for generator 9. -/
theorem ep_Q2_008_partial_09_0746_valid :
    mulPoly ep_Q2_008_coefficient_09_0746
        ep_Q2_008_generator_09_0700_0799 =
      ep_Q2_008_partial_09_0746 := by
  native_decide

/-- Coefficient term 747 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0747 : Poly :=
[
  term ((-423498012239131670313 : Rat) / 5543651628913410872) [(5, 1), (7, 1), (13, 2), (16, 1)]
]

/-- Partial product 747 for generator 9. -/
def ep_Q2_008_partial_09_0747 : Poly :=
[
  term ((-423498012239131670313 : Rat) / 2771825814456705436) [(2, 1), (5, 1), (7, 1), (13, 2), (16, 1)],
  term ((423498012239131670313 : Rat) / 5543651628913410872) [(5, 1), (7, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 747 for generator 9. -/
theorem ep_Q2_008_partial_09_0747_valid :
    mulPoly ep_Q2_008_coefficient_09_0747
        ep_Q2_008_generator_09_0700_0799 =
      ep_Q2_008_partial_09_0747 := by
  native_decide

/-- Coefficient term 748 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0748 : Poly :=
[
  term ((-10194995776671060036958312364410300800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 748 for generator 9. -/
def ep_Q2_008_partial_09_0748 : Poly :=
[
  term ((-20389991553342120073916624728820601600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((10194995776671060036958312364410300800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 748 for generator 9. -/
theorem ep_Q2_008_partial_09_0748_valid :
    mulPoly ep_Q2_008_coefficient_09_0748
        ep_Q2_008_generator_09_0700_0799 =
      ep_Q2_008_partial_09_0748 := by
  native_decide

/-- Coefficient term 749 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0749 : Poly :=
[
  term ((-1538701444754814528784797335490656593603331 : Rat) / 674830407405318061502963313035932218791992) [(5, 1), (7, 1), (15, 2), (16, 1)]
]

/-- Partial product 749 for generator 9. -/
def ep_Q2_008_partial_09_0749 : Poly :=
[
  term ((-1538701444754814528784797335490656593603331 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((1538701444754814528784797335490656593603331 : Rat) / 674830407405318061502963313035932218791992) [(5, 1), (7, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 749 for generator 9. -/
theorem ep_Q2_008_partial_09_0749_valid :
    mulPoly ep_Q2_008_coefficient_09_0749
        ep_Q2_008_generator_09_0700_0799 =
      ep_Q2_008_partial_09_0749 := by
  native_decide

/-- Coefficient term 750 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0750 : Poly :=
[
  term ((97309513697953132801819541906150400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (15, 4), (16, 1)]
]

/-- Partial product 750 for generator 9. -/
def ep_Q2_008_partial_09_0750 : Poly :=
[
  term ((194619027395906265603639083812300800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 1), (15, 4), (16, 1)],
  term ((-97309513697953132801819541906150400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 750 for generator 9. -/
theorem ep_Q2_008_partial_09_0750_valid :
    mulPoly ep_Q2_008_coefficient_09_0750
        ep_Q2_008_generator_09_0700_0799 =
      ep_Q2_008_partial_09_0750 := by
  native_decide

/-- Coefficient term 751 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0751 : Poly :=
[
  term ((-39496077136136433567 : Rat) / 5543651628913410872) [(5, 1), (7, 1), (16, 1)]
]

/-- Partial product 751 for generator 9. -/
def ep_Q2_008_partial_09_0751 : Poly :=
[
  term ((-39496077136136433567 : Rat) / 2771825814456705436) [(2, 1), (5, 1), (7, 1), (16, 1)],
  term ((39496077136136433567 : Rat) / 5543651628913410872) [(5, 1), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 751 for generator 9. -/
theorem ep_Q2_008_partial_09_0751_valid :
    mulPoly ep_Q2_008_coefficient_09_0751
        ep_Q2_008_generator_09_0700_0799 =
      ep_Q2_008_partial_09_0751 := by
  native_decide

/-- Coefficient term 752 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0752 : Poly :=
[
  term ((251681336998669734527340263719497600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 752 for generator 9. -/
def ep_Q2_008_partial_09_0752 : Poly :=
[
  term ((503362673997339469054680527438995200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 2), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-251681336998669734527340263719497600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (12, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 752 for generator 9. -/
theorem ep_Q2_008_partial_09_0752_valid :
    mulPoly ep_Q2_008_coefficient_09_0752
        ep_Q2_008_generator_09_0700_0799 =
      ep_Q2_008_partial_09_0752 := by
  native_decide

/-- Coefficient term 753 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0753 : Poly :=
[
  term ((-18063785280053765348207162472686400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 753 for generator 9. -/
def ep_Q2_008_partial_09_0753 : Poly :=
[
  term ((-36127570560107530696414324945372800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 2), (12, 1), (15, 1), (16, 1)],
  term ((18063785280053765348207162472686400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 753 for generator 9. -/
theorem ep_Q2_008_partial_09_0753_valid :
    mulPoly ep_Q2_008_coefficient_09_0753
        ep_Q2_008_generator_09_0700_0799 =
      ep_Q2_008_partial_09_0753 := by
  native_decide

/-- Coefficient term 754 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0754 : Poly :=
[
  term ((-90355949250665806696100146029763200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 754 for generator 9. -/
def ep_Q2_008_partial_09_0754 : Poly :=
[
  term ((-180711898501331613392200292059526400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 2), (13, 1), (15, 2), (16, 1)],
  term ((90355949250665806696100146029763200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 754 for generator 9. -/
theorem ep_Q2_008_partial_09_0754_valid :
    mulPoly ep_Q2_008_coefficient_09_0754
        ep_Q2_008_generator_09_0700_0799 =
      ep_Q2_008_partial_09_0754 := by
  native_decide

/-- Coefficient term 755 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0755 : Poly :=
[
  term ((6551492000695065069506556200448783054971070 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (7, 2), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 755 for generator 9. -/
def ep_Q2_008_partial_09_0755 : Poly :=
[
  term ((13102984001390130139013112400897566109942140 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (7, 2), (13, 2), (15, 1), (16, 1)],
  term ((-6551492000695065069506556200448783054971070 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (7, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 755 for generator 9. -/
theorem ep_Q2_008_partial_09_0755_valid :
    mulPoly ep_Q2_008_coefficient_09_0755
        ep_Q2_008_generator_09_0700_0799 =
      ep_Q2_008_partial_09_0755 := by
  native_decide

/-- Coefficient term 756 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0756 : Poly :=
[
  term ((610376991074716919105675325156784190188749 : Rat) / 674830407405318061502963313035932218791992) [(5, 1), (7, 2), (15, 1), (16, 1)]
]

/-- Partial product 756 for generator 9. -/
def ep_Q2_008_partial_09_0756 : Poly :=
[
  term ((610376991074716919105675325156784190188749 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (5, 1), (7, 2), (15, 1), (16, 1)],
  term ((-610376991074716919105675325156784190188749 : Rat) / 674830407405318061502963313035932218791992) [(5, 1), (7, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 756 for generator 9. -/
theorem ep_Q2_008_partial_09_0756_valid :
    mulPoly ep_Q2_008_coefficient_09_0756
        ep_Q2_008_generator_09_0700_0799 =
      ep_Q2_008_partial_09_0756 := by
  native_decide

/-- Coefficient term 757 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0757 : Poly :=
[
  term ((77620088714104702153969364811830400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (15, 3), (16, 1)]
]

/-- Partial product 757 for generator 9. -/
def ep_Q2_008_partial_09_0757 : Poly :=
[
  term ((155240177428209404307938729623660800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 2), (15, 3), (16, 1)],
  term ((-77620088714104702153969364811830400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 757 for generator 9. -/
theorem ep_Q2_008_partial_09_0757_valid :
    mulPoly ep_Q2_008_coefficient_09_0757
        ep_Q2_008_generator_09_0700_0799 =
      ep_Q2_008_partial_09_0757 := by
  native_decide

/-- Coefficient term 758 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0758 : Poly :=
[
  term ((322704626914767099233482902530496000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 3), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 758 for generator 9. -/
def ep_Q2_008_partial_09_0758 : Poly :=
[
  term ((645409253829534198466965805060992000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 3), (13, 2), (15, 2), (16, 1)],
  term ((-322704626914767099233482902530496000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 3), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 758 for generator 9. -/
theorem ep_Q2_008_partial_09_0758_valid :
    mulPoly ep_Q2_008_coefficient_09_0758
        ep_Q2_008_generator_09_0700_0799 =
      ep_Q2_008_partial_09_0758 := by
  native_decide

/-- Coefficient term 759 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0759 : Poly :=
[
  term ((5694787533790007633532051221126400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 3), (15, 2), (16, 1)]
]

/-- Partial product 759 for generator 9. -/
def ep_Q2_008_partial_09_0759 : Poly :=
[
  term ((11389575067580015267064102442252800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 3), (15, 2), (16, 1)],
  term ((-5694787533790007633532051221126400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 759 for generator 9. -/
theorem ep_Q2_008_partial_09_0759_valid :
    mulPoly ep_Q2_008_coefficient_09_0759
        ep_Q2_008_generator_09_0700_0799 =
      ep_Q2_008_partial_09_0759 := by
  native_decide

/-- Coefficient term 760 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0760 : Poly :=
[
  term ((-19543496960269643970523570171928755200 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 760 for generator 9. -/
def ep_Q2_008_partial_09_0760 : Poly :=
[
  term ((-39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((19543496960269643970523570171928755200 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 760 for generator 9. -/
theorem ep_Q2_008_partial_09_0760_valid :
    mulPoly ep_Q2_008_coefficient_09_0760
        ep_Q2_008_generator_09_0700_0799 =
      ep_Q2_008_partial_09_0760 := by
  native_decide

/-- Coefficient term 761 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0761 : Poly :=
[
  term ((35162393466106350 : Rat) / 692956453614176359) [(5, 1), (9, 1), (16, 1)]
]

/-- Partial product 761 for generator 9. -/
def ep_Q2_008_partial_09_0761 : Poly :=
[
  term ((70324786932212700 : Rat) / 692956453614176359) [(2, 1), (5, 1), (9, 1), (16, 1)],
  term ((-35162393466106350 : Rat) / 692956453614176359) [(5, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 761 for generator 9. -/
theorem ep_Q2_008_partial_09_0761_valid :
    mulPoly ep_Q2_008_coefficient_09_0761
        ep_Q2_008_generator_09_0700_0799 =
      ep_Q2_008_partial_09_0761 := by
  native_decide

/-- Coefficient term 762 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0762 : Poly :=
[
  term ((29775291069037500 : Rat) / 692956453614176359) [(5, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 762 for generator 9. -/
def ep_Q2_008_partial_09_0762 : Poly :=
[
  term ((59550582138075000 : Rat) / 692956453614176359) [(2, 1), (5, 1), (10, 1), (11, 1), (16, 1)],
  term ((-29775291069037500 : Rat) / 692956453614176359) [(5, 1), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 762 for generator 9. -/
theorem ep_Q2_008_partial_09_0762_valid :
    mulPoly ep_Q2_008_coefficient_09_0762
        ep_Q2_008_generator_09_0700_0799 =
      ep_Q2_008_partial_09_0762 := by
  native_decide

/-- Coefficient term 763 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0763 : Poly :=
[
  term ((3183574121101489500 : Rat) / 692956453614176359) [(5, 1), (10, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 763 for generator 9. -/
def ep_Q2_008_partial_09_0763 : Poly :=
[
  term ((6367148242202979000 : Rat) / 692956453614176359) [(2, 1), (5, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-3183574121101489500 : Rat) / 692956453614176359) [(5, 1), (10, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 763 for generator 9. -/
theorem ep_Q2_008_partial_09_0763_valid :
    mulPoly ep_Q2_008_coefficient_09_0763
        ep_Q2_008_generator_09_0700_0799 =
      ep_Q2_008_partial_09_0763 := by
  native_decide

/-- Coefficient term 764 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0764 : Poly :=
[
  term ((-32572494933782739950872616953214592000 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (10, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 764 for generator 9. -/
def ep_Q2_008_partial_09_0764 : Poly :=
[
  term ((-65144989867565479901745233906429184000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((32572494933782739950872616953214592000 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (10, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 764 for generator 9. -/
theorem ep_Q2_008_partial_09_0764_valid :
    mulPoly ep_Q2_008_coefficient_09_0764
        ep_Q2_008_generator_09_0700_0799 =
      ep_Q2_008_partial_09_0764 := by
  native_decide

/-- Coefficient term 765 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0765 : Poly :=
[
  term ((-10606760870952153375 : Rat) / 2771825814456705436) [(5, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 765 for generator 9. -/
def ep_Q2_008_partial_09_0765 : Poly :=
[
  term ((-10606760870952153375 : Rat) / 1385912907228352718) [(2, 1), (5, 1), (10, 1), (13, 1), (16, 1)],
  term ((10606760870952153375 : Rat) / 2771825814456705436) [(5, 1), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 765 for generator 9. -/
theorem ep_Q2_008_partial_09_0765_valid :
    mulPoly ep_Q2_008_coefficient_09_0765
        ep_Q2_008_generator_09_0700_0799 =
      ep_Q2_008_partial_09_0765 := by
  native_decide

/-- Coefficient term 766 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0766 : Poly :=
[
  term ((-97785127383742799937383775187943635200 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 766 for generator 9. -/
def ep_Q2_008_partial_09_0766 : Poly :=
[
  term ((-195570254767485599874767550375887270400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((97785127383742799937383775187943635200 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 766 for generator 9. -/
theorem ep_Q2_008_partial_09_0766_valid :
    mulPoly ep_Q2_008_coefficient_09_0766
        ep_Q2_008_generator_09_0700_0799 =
      ep_Q2_008_partial_09_0766 := by
  native_decide

/-- Coefficient term 767 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0767 : Poly :=
[
  term ((-47384560950961550325501210427595762100 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 767 for generator 9. -/
def ep_Q2_008_partial_09_0767 : Poly :=
[
  term ((-94769121901923100651002420855191524200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((47384560950961550325501210427595762100 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 767 for generator 9. -/
theorem ep_Q2_008_partial_09_0767_valid :
    mulPoly ep_Q2_008_coefficient_09_0767
        ep_Q2_008_generator_09_0700_0799 =
      ep_Q2_008_partial_09_0767 := by
  native_decide

/-- Coefficient term 768 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0768 : Poly :=
[
  term ((106848627322152343492287821136270391200 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 768 for generator 9. -/
def ep_Q2_008_partial_09_0768 : Poly :=
[
  term ((213697254644304686984575642272540782400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-106848627322152343492287821136270391200 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 768 for generator 9. -/
theorem ep_Q2_008_partial_09_0768_valid :
    mulPoly ep_Q2_008_coefficient_09_0768
        ep_Q2_008_generator_09_0700_0799 =
      ep_Q2_008_partial_09_0768 := by
  native_decide

/-- Coefficient term 769 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0769 : Poly :=
[
  term ((8933538213261045000 : Rat) / 692956453614176359) [(5, 1), (11, 1), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 769 for generator 9. -/
def ep_Q2_008_partial_09_0769 : Poly :=
[
  term ((17867076426522090000 : Rat) / 692956453614176359) [(2, 1), (5, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((-8933538213261045000 : Rat) / 692956453614176359) [(5, 1), (11, 1), (12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 769 for generator 9. -/
theorem ep_Q2_008_partial_09_0769_valid :
    mulPoly ep_Q2_008_coefficient_09_0769
        ep_Q2_008_generator_09_0700_0799 =
      ep_Q2_008_partial_09_0769 := by
  native_decide

/-- Coefficient term 770 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0770 : Poly :=
[
  term ((739561277842910879317489101332838816000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 770 for generator 9. -/
def ep_Q2_008_partial_09_0770 : Poly :=
[
  term ((1479122555685821758634978202665677632000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-739561277842910879317489101332838816000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 770 for generator 9. -/
theorem ep_Q2_008_partial_09_0770_valid :
    mulPoly ep_Q2_008_coefficient_09_0770
        ep_Q2_008_generator_09_0700_0799 =
      ep_Q2_008_partial_09_0770 := by
  native_decide

/-- Coefficient term 771 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0771 : Poly :=
[
  term ((-2723913011097289125 : Rat) / 11087303257826821744) [(5, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 771 for generator 9. -/
def ep_Q2_008_partial_09_0771 : Poly :=
[
  term ((-2723913011097289125 : Rat) / 5543651628913410872) [(2, 1), (5, 1), (11, 1), (12, 1), (16, 1)],
  term ((2723913011097289125 : Rat) / 11087303257826821744) [(5, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 771 for generator 9. -/
theorem ep_Q2_008_partial_09_0771_valid :
    mulPoly ep_Q2_008_coefficient_09_0771
        ep_Q2_008_generator_09_0700_0799 =
      ep_Q2_008_partial_09_0771 := by
  native_decide

/-- Coefficient term 772 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0772 : Poly :=
[
  term ((137584278989425887466300832244723070893975 : Rat) / 168707601851329515375740828258983054697998) [(5, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 772 for generator 9. -/
def ep_Q2_008_partial_09_0772 : Poly :=
[
  term ((137584278989425887466300832244723070893975 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-137584278989425887466300832244723070893975 : Rat) / 168707601851329515375740828258983054697998) [(5, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 772 for generator 9. -/
theorem ep_Q2_008_partial_09_0772_valid :
    mulPoly ep_Q2_008_coefficient_09_0772
        ep_Q2_008_generator_09_0700_0799 =
      ep_Q2_008_partial_09_0772 := by
  native_decide

/-- Coefficient term 773 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0773 : Poly :=
[
  term ((-49304085189527391954499273422189254400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (11, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 773 for generator 9. -/
def ep_Q2_008_partial_09_0773 : Poly :=
[
  term ((-98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((49304085189527391954499273422189254400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (11, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 773 for generator 9. -/
theorem ep_Q2_008_partial_09_0773_valid :
    mulPoly ep_Q2_008_coefficient_09_0773
        ep_Q2_008_generator_09_0700_0799 =
      ep_Q2_008_partial_09_0773 := by
  native_decide

/-- Coefficient term 774 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0774 : Poly :=
[
  term ((2620606629610106333514019741360892313600 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (11, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 774 for generator 9. -/
def ep_Q2_008_partial_09_0774 : Poly :=
[
  term ((5241213259220212667028039482721784627200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-2620606629610106333514019741360892313600 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (11, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 774 for generator 9. -/
theorem ep_Q2_008_partial_09_0774_valid :
    mulPoly ep_Q2_008_coefficient_09_0774
        ep_Q2_008_generator_09_0700_0799 =
      ep_Q2_008_partial_09_0774 := by
  native_decide

/-- Coefficient term 775 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0775 : Poly :=
[
  term ((-6551261356391433000 : Rat) / 692956453614176359) [(5, 1), (11, 1), (13, 2), (16, 1)]
]

/-- Partial product 775 for generator 9. -/
def ep_Q2_008_partial_09_0775 : Poly :=
[
  term ((-13102522712782866000 : Rat) / 692956453614176359) [(2, 1), (5, 1), (11, 1), (13, 2), (16, 1)],
  term ((6551261356391433000 : Rat) / 692956453614176359) [(5, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 775 for generator 9. -/
theorem ep_Q2_008_partial_09_0775_valid :
    mulPoly ep_Q2_008_coefficient_09_0775
        ep_Q2_008_generator_09_0700_0799 =
      ep_Q2_008_partial_09_0775 := by
  native_decide

/-- Coefficient term 776 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0776 : Poly :=
[
  term ((-542344937084801311499492007644081798400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 776 for generator 9. -/
def ep_Q2_008_partial_09_0776 : Poly :=
[
  term ((-1084689874169602622998984015288163596800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((542344937084801311499492007644081798400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 776 for generator 9. -/
theorem ep_Q2_008_partial_09_0776_valid :
    mulPoly ep_Q2_008_coefficient_09_0776
        ep_Q2_008_generator_09_0700_0799 =
      ep_Q2_008_partial_09_0776 := by
  native_decide

/-- Coefficient term 777 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0777 : Poly :=
[
  term ((-1587321849470827876743360606356951138475 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 777 for generator 9. -/
def ep_Q2_008_partial_09_0777 : Poly :=
[
  term ((-3174643698941655753486721212713902276950 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (11, 1), (15, 2), (16, 1)],
  term ((1587321849470827876743360606356951138475 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 777 for generator 9. -/
theorem ep_Q2_008_partial_09_0777_valid :
    mulPoly ep_Q2_008_coefficient_09_0777
        ep_Q2_008_generator_09_0700_0799 =
      ep_Q2_008_partial_09_0777 := by
  native_decide

/-- Coefficient term 778 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0778 : Poly :=
[
  term ((3383792457399581625 : Rat) / 11087303257826821744) [(5, 1), (11, 1), (16, 1)]
]

/-- Partial product 778 for generator 9. -/
def ep_Q2_008_partial_09_0778 : Poly :=
[
  term ((3383792457399581625 : Rat) / 5543651628913410872) [(2, 1), (5, 1), (11, 1), (16, 1)],
  term ((-3383792457399581625 : Rat) / 11087303257826821744) [(5, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 778 for generator 9. -/
theorem ep_Q2_008_partial_09_0778_valid :
    mulPoly ep_Q2_008_coefficient_09_0778
        ep_Q2_008_generator_09_0700_0799 =
      ep_Q2_008_partial_09_0778 := by
  native_decide

/-- Coefficient term 779 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0779 : Poly :=
[
  term ((41685407496652500 : Rat) / 692956453614176359) [(5, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 779 for generator 9. -/
def ep_Q2_008_partial_09_0779 : Poly :=
[
  term ((83370814993305000 : Rat) / 692956453614176359) [(2, 1), (5, 1), (11, 2), (15, 1), (16, 1)],
  term ((-41685407496652500 : Rat) / 692956453614176359) [(5, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 779 for generator 9. -/
theorem ep_Q2_008_partial_09_0779_valid :
    mulPoly ep_Q2_008_coefficient_09_0779
        ep_Q2_008_generator_09_0700_0799 =
      ep_Q2_008_partial_09_0779 := by
  native_decide

/-- Coefficient term 780 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0780 : Poly :=
[
  term ((-434968819639447603720942718117836689600 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 780 for generator 9. -/
def ep_Q2_008_partial_09_0780 : Poly :=
[
  term ((-869937639278895207441885436235673379200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((434968819639447603720942718117836689600 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 780 for generator 9. -/
theorem ep_Q2_008_partial_09_0780_valid :
    mulPoly ep_Q2_008_coefficient_09_0780
        ep_Q2_008_generator_09_0700_0799 =
      ep_Q2_008_partial_09_0780 := by
  native_decide

/-- Coefficient term 781 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0781 : Poly :=
[
  term ((-238887582178858674933 : Rat) / 22174606515653643488) [(5, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 781 for generator 9. -/
def ep_Q2_008_partial_09_0781 : Poly :=
[
  term ((-238887582178858674933 : Rat) / 11087303257826821744) [(2, 1), (5, 1), (12, 1), (13, 1), (16, 1)],
  term ((238887582178858674933 : Rat) / 22174606515653643488) [(5, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 781 for generator 9. -/
theorem ep_Q2_008_partial_09_0781_valid :
    mulPoly ep_Q2_008_coefficient_09_0781
        ep_Q2_008_generator_09_0700_0799 =
      ep_Q2_008_partial_09_0781 := by
  native_decide

/-- Coefficient term 782 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0782 : Poly :=
[
  term ((9852972799248927029515601817054287370563805 : Rat) / 168707601851329515375740828258983054697998) [(5, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 782 for generator 9. -/
def ep_Q2_008_partial_09_0782 : Poly :=
[
  term ((9852972799248927029515601817054287370563805 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-9852972799248927029515601817054287370563805 : Rat) / 168707601851329515375740828258983054697998) [(5, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 782 for generator 9. -/
theorem ep_Q2_008_partial_09_0782_valid :
    mulPoly ep_Q2_008_coefficient_09_0782
        ep_Q2_008_generator_09_0700_0799 =
      ep_Q2_008_partial_09_0782 := by
  native_decide

/-- Coefficient term 783 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0783 : Poly :=
[
  term ((13554670509346661261909181750685004553669125 : Rat) / 2699321629621272246011853252143728875167968) [(5, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 783 for generator 9. -/
def ep_Q2_008_partial_09_0783 : Poly :=
[
  term ((13554670509346661261909181750685004553669125 : Rat) / 1349660814810636123005926626071864437583984) [(2, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-13554670509346661261909181750685004553669125 : Rat) / 2699321629621272246011853252143728875167968) [(5, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 783 for generator 9. -/
theorem ep_Q2_008_partial_09_0783_valid :
    mulPoly ep_Q2_008_coefficient_09_0783
        ep_Q2_008_generator_09_0700_0799 =
      ep_Q2_008_partial_09_0783 := by
  native_decide

/-- Coefficient term 784 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0784 : Poly :=
[
  term ((1718877231716861616131978050222143404486897 : Rat) / 337415203702659030751481656517966109395996) [(5, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 784 for generator 9. -/
def ep_Q2_008_partial_09_0784 : Poly :=
[
  term ((1718877231716861616131978050222143404486897 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (5, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1718877231716861616131978050222143404486897 : Rat) / 337415203702659030751481656517966109395996) [(5, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 784 for generator 9. -/
theorem ep_Q2_008_partial_09_0784_valid :
    mulPoly ep_Q2_008_coefficient_09_0784
        ep_Q2_008_generator_09_0700_0799 =
      ep_Q2_008_partial_09_0784 := by
  native_decide

/-- Coefficient term 785 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0785 : Poly :=
[
  term ((834538340144665796651 : Rat) / 44349213031307286976) [(5, 1), (13, 1), (16, 1)]
]

/-- Partial product 785 for generator 9. -/
def ep_Q2_008_partial_09_0785 : Poly :=
[
  term ((834538340144665796651 : Rat) / 22174606515653643488) [(2, 1), (5, 1), (13, 1), (16, 1)],
  term ((-834538340144665796651 : Rat) / 44349213031307286976) [(5, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 785 for generator 9. -/
theorem ep_Q2_008_partial_09_0785_valid :
    mulPoly ep_Q2_008_coefficient_09_0785
        ep_Q2_008_generator_09_0700_0799 =
      ep_Q2_008_partial_09_0785 := by
  native_decide

/-- Coefficient term 786 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0786 : Poly :=
[
  term ((5729530917613742078158785452193523829284422 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 786 for generator 9. -/
def ep_Q2_008_partial_09_0786 : Poly :=
[
  term ((11459061835227484156317570904387047658568844 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (13, 2), (15, 1), (16, 1)],
  term ((-5729530917613742078158785452193523829284422 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 786 for generator 9. -/
theorem ep_Q2_008_partial_09_0786_valid :
    mulPoly ep_Q2_008_coefficient_09_0786
        ep_Q2_008_generator_09_0700_0799 =
      ep_Q2_008_partial_09_0786 := by
  native_decide

/-- Coefficient term 787 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0787 : Poly :=
[
  term ((-53819861292522639870 : Rat) / 692956453614176359) [(5, 1), (13, 2), (15, 3), (16, 1)]
]

/-- Partial product 787 for generator 9. -/
def ep_Q2_008_partial_09_0787 : Poly :=
[
  term ((-107639722585045279740 : Rat) / 692956453614176359) [(2, 1), (5, 1), (13, 2), (15, 3), (16, 1)],
  term ((53819861292522639870 : Rat) / 692956453614176359) [(5, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 787 for generator 9. -/
theorem ep_Q2_008_partial_09_0787_valid :
    mulPoly ep_Q2_008_coefficient_09_0787
        ep_Q2_008_generator_09_0700_0799 =
      ep_Q2_008_partial_09_0787 := by
  native_decide

/-- Coefficient term 788 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0788 : Poly :=
[
  term ((-37673902904765847909 : Rat) / 2771825814456705436) [(5, 1), (13, 3), (16, 1)]
]

/-- Partial product 788 for generator 9. -/
def ep_Q2_008_partial_09_0788 : Poly :=
[
  term ((-37673902904765847909 : Rat) / 1385912907228352718) [(2, 1), (5, 1), (13, 3), (16, 1)],
  term ((37673902904765847909 : Rat) / 2771825814456705436) [(5, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 788 for generator 9. -/
theorem ep_Q2_008_partial_09_0788_valid :
    mulPoly ep_Q2_008_coefficient_09_0788
        ep_Q2_008_generator_09_0700_0799 =
      ep_Q2_008_partial_09_0788 := by
  native_decide

/-- Coefficient term 789 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0789 : Poly :=
[
  term ((9502554447087405588479186838102620729513045 : Rat) / 2699321629621272246011853252143728875167968) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 789 for generator 9. -/
def ep_Q2_008_partial_09_0789 : Poly :=
[
  term ((9502554447087405588479186838102620729513045 : Rat) / 1349660814810636123005926626071864437583984) [(2, 1), (5, 1), (15, 1), (16, 1)],
  term ((-9502554447087405588479186838102620729513045 : Rat) / 2699321629621272246011853252143728875167968) [(5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 789 for generator 9. -/
theorem ep_Q2_008_partial_09_0789_valid :
    mulPoly ep_Q2_008_coefficient_09_0789
        ep_Q2_008_generator_09_0700_0799 =
      ep_Q2_008_partial_09_0789 := by
  native_decide

/-- Coefficient term 790 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0790 : Poly :=
[
  term ((-2240403272346910382248035763598470022700377 : Rat) / 674830407405318061502963313035932218791992) [(5, 1), (15, 3), (16, 1)]
]

/-- Partial product 790 for generator 9. -/
def ep_Q2_008_partial_09_0790 : Poly :=
[
  term ((-2240403272346910382248035763598470022700377 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (5, 1), (15, 3), (16, 1)],
  term ((2240403272346910382248035763598470022700377 : Rat) / 674830407405318061502963313035932218791992) [(5, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 790 for generator 9. -/
theorem ep_Q2_008_partial_09_0790_valid :
    mulPoly ep_Q2_008_coefficient_09_0790
        ep_Q2_008_generator_09_0700_0799 =
      ep_Q2_008_partial_09_0790 := by
  native_decide

/-- Coefficient term 791 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0791 : Poly :=
[
  term ((-3355594890481528987837619349168524928000 : Rat) / 84353800925664757687870414129491527348999) [(5, 2), (6, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 791 for generator 9. -/
def ep_Q2_008_partial_09_0791 : Poly :=
[
  term ((-6711189780963057975675238698337049856000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((3355594890481528987837619349168524928000 : Rat) / 84353800925664757687870414129491527348999) [(5, 2), (6, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 791 for generator 9. -/
theorem ep_Q2_008_partial_09_0791_valid :
    mulPoly ep_Q2_008_coefficient_09_0791
        ep_Q2_008_generator_09_0700_0799 =
      ep_Q2_008_partial_09_0791 := by
  native_decide

/-- Coefficient term 792 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0792 : Poly :=
[
  term ((-692576845212253500 : Rat) / 692956453614176359) [(5, 2), (6, 1), (16, 1)]
]

/-- Partial product 792 for generator 9. -/
def ep_Q2_008_partial_09_0792 : Poly :=
[
  term ((-1385153690424507000 : Rat) / 692956453614176359) [(2, 1), (5, 2), (6, 1), (16, 1)],
  term ((692576845212253500 : Rat) / 692956453614176359) [(5, 2), (6, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 792 for generator 9. -/
theorem ep_Q2_008_partial_09_0792_valid :
    mulPoly ep_Q2_008_coefficient_09_0792
        ep_Q2_008_generator_09_0700_0799 =
      ep_Q2_008_partial_09_0792 := by
  native_decide

/-- Coefficient term 793 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0793 : Poly :=
[
  term ((-242028470186075324425112176897872000 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 793 for generator 9. -/
def ep_Q2_008_partial_09_0793 : Poly :=
[
  term ((-484056940372150648850224353795744000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 2), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((242028470186075324425112176897872000 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 793 for generator 9. -/
theorem ep_Q2_008_partial_09_0793_valid :
    mulPoly ep_Q2_008_coefficient_09_0793
        ep_Q2_008_generator_09_0700_0799 =
      ep_Q2_008_partial_09_0793 := by
  native_decide

/-- Coefficient term 794 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0794 : Poly :=
[
  term ((11864140695395849236525106710680000 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 794 for generator 9. -/
def ep_Q2_008_partial_09_0794 : Poly :=
[
  term ((23728281390791698473050213421360000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-11864140695395849236525106710680000 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 794 for generator 9. -/
theorem ep_Q2_008_partial_09_0794_valid :
    mulPoly ep_Q2_008_coefficient_09_0794
        ep_Q2_008_generator_09_0700_0799 =
      ep_Q2_008_partial_09_0794 := by
  native_decide

/-- Coefficient term 795 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0795 : Poly :=
[
  term ((-32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 795 for generator 9. -/
def ep_Q2_008_partial_09_0795 : Poly :=
[
  term ((-64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 795 for generator 9. -/
theorem ep_Q2_008_partial_09_0795_valid :
    mulPoly ep_Q2_008_coefficient_09_0795
        ep_Q2_008_generator_09_0700_0799 =
      ep_Q2_008_partial_09_0795 := by
  native_decide

/-- Coefficient term 796 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0796 : Poly :=
[
  term ((177487544803121904578415596391772800 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 796 for generator 9. -/
def ep_Q2_008_partial_09_0796 : Poly :=
[
  term ((354975089606243809156831192783545600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 2), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-177487544803121904578415596391772800 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 796 for generator 9. -/
theorem ep_Q2_008_partial_09_0796_valid :
    mulPoly ep_Q2_008_coefficient_09_0796
        ep_Q2_008_generator_09_0700_0799 =
      ep_Q2_008_partial_09_0796 := by
  native_decide

/-- Coefficient term 797 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0797 : Poly :=
[
  term ((-15423382904014604007482638723884000 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 797 for generator 9. -/
def ep_Q2_008_partial_09_0797 : Poly :=
[
  term ((-30846765808029208014965277447768000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 2), (7, 1), (15, 1), (16, 1)],
  term ((15423382904014604007482638723884000 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 797 for generator 9. -/
theorem ep_Q2_008_partial_09_0797_valid :
    mulPoly ep_Q2_008_coefficient_09_0797
        ep_Q2_008_generator_09_0700_0799 =
      ep_Q2_008_partial_09_0797 := by
  native_decide

/-- Coefficient term 798 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0798 : Poly :=
[
  term ((16135231345738354961674145126524800 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (15, 3), (16, 1)]
]

/-- Partial product 798 for generator 9. -/
def ep_Q2_008_partial_09_0798 : Poly :=
[
  term ((32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 2), (7, 1), (15, 3), (16, 1)],
  term ((-16135231345738354961674145126524800 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 798 for generator 9. -/
theorem ep_Q2_008_partial_09_0798_valid :
    mulPoly ep_Q2_008_coefficient_09_0798
        ep_Q2_008_generator_09_0700_0799 =
      ep_Q2_008_partial_09_0798 := by
  native_decide

/-- Coefficient term 799 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0799 : Poly :=
[
  term ((-80729791938783959805 : Rat) / 1385912907228352718) [(5, 2), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 799 for generator 9. -/
def ep_Q2_008_partial_09_0799 : Poly :=
[
  term ((-80729791938783959805 : Rat) / 692956453614176359) [(2, 1), (5, 2), (12, 1), (13, 2), (16, 1)],
  term ((80729791938783959805 : Rat) / 1385912907228352718) [(5, 2), (12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 799 for generator 9. -/
theorem ep_Q2_008_partial_09_0799_valid :
    mulPoly ep_Q2_008_coefficient_09_0799
        ep_Q2_008_generator_09_0700_0799 =
      ep_Q2_008_partial_09_0799 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_008_partials_09_0700_0799 : List Poly :=
[
  ep_Q2_008_partial_09_0700,
  ep_Q2_008_partial_09_0701,
  ep_Q2_008_partial_09_0702,
  ep_Q2_008_partial_09_0703,
  ep_Q2_008_partial_09_0704,
  ep_Q2_008_partial_09_0705,
  ep_Q2_008_partial_09_0706,
  ep_Q2_008_partial_09_0707,
  ep_Q2_008_partial_09_0708,
  ep_Q2_008_partial_09_0709,
  ep_Q2_008_partial_09_0710,
  ep_Q2_008_partial_09_0711,
  ep_Q2_008_partial_09_0712,
  ep_Q2_008_partial_09_0713,
  ep_Q2_008_partial_09_0714,
  ep_Q2_008_partial_09_0715,
  ep_Q2_008_partial_09_0716,
  ep_Q2_008_partial_09_0717,
  ep_Q2_008_partial_09_0718,
  ep_Q2_008_partial_09_0719,
  ep_Q2_008_partial_09_0720,
  ep_Q2_008_partial_09_0721,
  ep_Q2_008_partial_09_0722,
  ep_Q2_008_partial_09_0723,
  ep_Q2_008_partial_09_0724,
  ep_Q2_008_partial_09_0725,
  ep_Q2_008_partial_09_0726,
  ep_Q2_008_partial_09_0727,
  ep_Q2_008_partial_09_0728,
  ep_Q2_008_partial_09_0729,
  ep_Q2_008_partial_09_0730,
  ep_Q2_008_partial_09_0731,
  ep_Q2_008_partial_09_0732,
  ep_Q2_008_partial_09_0733,
  ep_Q2_008_partial_09_0734,
  ep_Q2_008_partial_09_0735,
  ep_Q2_008_partial_09_0736,
  ep_Q2_008_partial_09_0737,
  ep_Q2_008_partial_09_0738,
  ep_Q2_008_partial_09_0739,
  ep_Q2_008_partial_09_0740,
  ep_Q2_008_partial_09_0741,
  ep_Q2_008_partial_09_0742,
  ep_Q2_008_partial_09_0743,
  ep_Q2_008_partial_09_0744,
  ep_Q2_008_partial_09_0745,
  ep_Q2_008_partial_09_0746,
  ep_Q2_008_partial_09_0747,
  ep_Q2_008_partial_09_0748,
  ep_Q2_008_partial_09_0749,
  ep_Q2_008_partial_09_0750,
  ep_Q2_008_partial_09_0751,
  ep_Q2_008_partial_09_0752,
  ep_Q2_008_partial_09_0753,
  ep_Q2_008_partial_09_0754,
  ep_Q2_008_partial_09_0755,
  ep_Q2_008_partial_09_0756,
  ep_Q2_008_partial_09_0757,
  ep_Q2_008_partial_09_0758,
  ep_Q2_008_partial_09_0759,
  ep_Q2_008_partial_09_0760,
  ep_Q2_008_partial_09_0761,
  ep_Q2_008_partial_09_0762,
  ep_Q2_008_partial_09_0763,
  ep_Q2_008_partial_09_0764,
  ep_Q2_008_partial_09_0765,
  ep_Q2_008_partial_09_0766,
  ep_Q2_008_partial_09_0767,
  ep_Q2_008_partial_09_0768,
  ep_Q2_008_partial_09_0769,
  ep_Q2_008_partial_09_0770,
  ep_Q2_008_partial_09_0771,
  ep_Q2_008_partial_09_0772,
  ep_Q2_008_partial_09_0773,
  ep_Q2_008_partial_09_0774,
  ep_Q2_008_partial_09_0775,
  ep_Q2_008_partial_09_0776,
  ep_Q2_008_partial_09_0777,
  ep_Q2_008_partial_09_0778,
  ep_Q2_008_partial_09_0779,
  ep_Q2_008_partial_09_0780,
  ep_Q2_008_partial_09_0781,
  ep_Q2_008_partial_09_0782,
  ep_Q2_008_partial_09_0783,
  ep_Q2_008_partial_09_0784,
  ep_Q2_008_partial_09_0785,
  ep_Q2_008_partial_09_0786,
  ep_Q2_008_partial_09_0787,
  ep_Q2_008_partial_09_0788,
  ep_Q2_008_partial_09_0789,
  ep_Q2_008_partial_09_0790,
  ep_Q2_008_partial_09_0791,
  ep_Q2_008_partial_09_0792,
  ep_Q2_008_partial_09_0793,
  ep_Q2_008_partial_09_0794,
  ep_Q2_008_partial_09_0795,
  ep_Q2_008_partial_09_0796,
  ep_Q2_008_partial_09_0797,
  ep_Q2_008_partial_09_0798,
  ep_Q2_008_partial_09_0799
]

/-- Sum of partial products in this block. -/
def ep_Q2_008_block_09_0700_0799 : Poly :=
[
  term ((1290818507659068396933931610121984000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (6, 1), (7, 2), (13, 2), (15, 1), (16, 1)],
  term ((-2581637015318136793867863220243968000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (6, 1), (7, 2), (13, 2), (15, 3), (16, 1)],
  term ((22779150135160030534128204884505600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (6, 1), (7, 2), (15, 1), (16, 1)],
  term ((-45558300270320061068256409769011200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (6, 1), (7, 2), (15, 3), (16, 1)],
  term ((-172223556136072447584 : Rat) / 692956453614176359) [(2, 1), (5, 1), (6, 1), (9, 1), (13, 2), (16, 1)],
  term ((30955433660627124993 : Rat) / 1385912907228352718) [(2, 1), (5, 1), (6, 1), (9, 1), (16, 1)],
  term ((-95280931420920000 : Rat) / 692956453614176359) [(2, 1), (5, 1), (6, 1), (10, 1), (11, 1), (16, 1)],
  term ((488587424006741099263089254298218880000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (6, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((4843636076722786875 : Rat) / 692956453614176359) [(2, 1), (5, 1), (6, 1), (10, 1), (13, 1), (16, 1)],
  term ((-1521101981524887999025969836256900992000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (6, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-125543035031442872139324454282317177429150 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((-133988809810668750 : Rat) / 692956453614176359) [(2, 1), (5, 1), (6, 1), (11, 1), (12, 1), (16, 1)],
  term ((-39788088780592874444862977564499327523500 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((1912242491059859198775504937008675532800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (6, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((117152930185871790840043500923317180567200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((1101393379063359000 : Rat) / 692956453614176359) [(2, 1), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((-333483259973220000 : Rat) / 692956453614176359) [(2, 1), (5, 1), (6, 1), (11, 2), (15, 1), (16, 1)],
  term ((-384422964890970476913 : Rat) / 2771825814456705436) [(2, 1), (5, 1), (6, 1), (12, 1), (13, 1), (16, 1)],
  term ((43055889034018111896 : Rat) / 692956453614176359) [(2, 1), (5, 1), (6, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-5512819400368696418782510098532711359943839 : Rat) / 674830407405318061502963313035932218791992) [(2, 1), (5, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-18891563833931098143058273391327188193744362 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((150445491817593666083 : Rat) / 1385912907228352718) [(2, 1), (5, 1), (6, 1), (13, 1), (16, 1)],
  term ((35342734632918869590133449402229152276940292 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (6, 1), (13, 2), (15, 1), (16, 1)],
  term ((430558890340181118960 : Rat) / 692956453614176359) [(2, 1), (5, 1), (6, 1), (13, 2), (15, 3), (16, 1)],
  term ((21527944517009055948 : Rat) / 692956453614176359) [(2, 1), (5, 1), (6, 1), (13, 3), (16, 1)],
  term ((-127688267393908154570641191318960823373969 : Rat) / 674830407405318061502963313035932218791992) [(2, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((2104639235181182094975540307520976395808377 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (6, 1), (15, 3), (16, 1)],
  term ((-645409253829534198466965805060992000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (6, 2), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((-11389575067580015267064102442252800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (6, 2), (7, 1), (15, 2), (16, 1)],
  term ((-23820232855230000 : Rat) / 692956453614176359) [(2, 1), (5, 1), (6, 2), (11, 1), (16, 1)],
  term ((199241833525243875 : Rat) / 692956453614176359) [(2, 1), (5, 1), (6, 2), (13, 1), (16, 1)],
  term ((-13103494394875918067796217524762632581193340 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (6, 2), (13, 2), (15, 1), (16, 1)],
  term ((-591233758816710615558086028488332001985549 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (5, 1), (6, 2), (15, 1), (16, 1)],
  term ((92050785676708875 : Rat) / 692956453614176359) [(2, 1), (5, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((-478060622764964799693876234252168883200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (7, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-29288232546467947710010875230829295141800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((83370814993305000 : Rat) / 692956453614176359) [(2, 1), (5, 1), (7, 1), (11, 2), (16, 1)],
  term ((-1346822300311845484415111613841802400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((484056940372150648850224353795744000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-166749471357106723239 : Rat) / 2771825814456705436) [(2, 1), (5, 1), (7, 1), (12, 1), (13, 2), (16, 1)],
  term ((27650515818984479439797598699456720000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((65681902317914893007315590768488000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((578290294120164951 : Rat) / 382320801994028336) [(2, 1), (5, 1), (7, 1), (12, 1), (16, 1)],
  term ((2121906090504240955661172212424242875978714 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2190157395220470749017599032457859200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 1), (13, 1), (15, 3), (16, 1)],
  term ((4324268926367258751514172227484160000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((-645409253829534198466965805060992000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 1), (13, 2), (15, 4), (16, 1)],
  term ((-423498012239131670313 : Rat) / 2771825814456705436) [(2, 1), (5, 1), (7, 1), (13, 2), (16, 1)],
  term ((-20389991553342120073916624728820601600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((-1538701444754814528784797335490656593603331 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((194619027395906265603639083812300800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 1), (15, 4), (16, 1)],
  term ((-39496077136136433567 : Rat) / 2771825814456705436) [(2, 1), (5, 1), (7, 1), (16, 1)],
  term ((503362673997339469054680527438995200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 2), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-36127570560107530696414324945372800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 2), (12, 1), (15, 1), (16, 1)],
  term ((-180711898501331613392200292059526400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 2), (13, 1), (15, 2), (16, 1)],
  term ((13102984001390130139013112400897566109942140 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (7, 2), (13, 2), (15, 1), (16, 1)],
  term ((610376991074716919105675325156784190188749 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (5, 1), (7, 2), (15, 1), (16, 1)],
  term ((155240177428209404307938729623660800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 2), (15, 3), (16, 1)],
  term ((645409253829534198466965805060992000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 3), (13, 2), (15, 2), (16, 1)],
  term ((11389575067580015267064102442252800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (7, 3), (15, 2), (16, 1)],
  term ((-39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((70324786932212700 : Rat) / 692956453614176359) [(2, 1), (5, 1), (9, 1), (16, 1)],
  term ((59550582138075000 : Rat) / 692956453614176359) [(2, 1), (5, 1), (10, 1), (11, 1), (16, 1)],
  term ((6367148242202979000 : Rat) / 692956453614176359) [(2, 1), (5, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-65144989867565479901745233906429184000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-10606760870952153375 : Rat) / 1385912907228352718) [(2, 1), (5, 1), (10, 1), (13, 1), (16, 1)],
  term ((-195570254767485599874767550375887270400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-94769121901923100651002420855191524200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((213697254644304686984575642272540782400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((17867076426522090000 : Rat) / 692956453614176359) [(2, 1), (5, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((1479122555685821758634978202665677632000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-2723913011097289125 : Rat) / 5543651628913410872) [(2, 1), (5, 1), (11, 1), (12, 1), (16, 1)],
  term ((137584278989425887466300832244723070893975 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((5241213259220212667028039482721784627200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-13102522712782866000 : Rat) / 692956453614176359) [(2, 1), (5, 1), (11, 1), (13, 2), (16, 1)],
  term ((-1084689874169602622998984015288163596800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((-3174643698941655753486721212713902276950 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (11, 1), (15, 2), (16, 1)],
  term ((3383792457399581625 : Rat) / 5543651628913410872) [(2, 1), (5, 1), (11, 1), (16, 1)],
  term ((83370814993305000 : Rat) / 692956453614176359) [(2, 1), (5, 1), (11, 2), (15, 1), (16, 1)],
  term ((-869937639278895207441885436235673379200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-238887582178858674933 : Rat) / 11087303257826821744) [(2, 1), (5, 1), (12, 1), (13, 1), (16, 1)],
  term ((9852972799248927029515601817054287370563805 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((13554670509346661261909181750685004553669125 : Rat) / 1349660814810636123005926626071864437583984) [(2, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((1718877231716861616131978050222143404486897 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (5, 1), (13, 1), (15, 2), (16, 1)],
  term ((834538340144665796651 : Rat) / 22174606515653643488) [(2, 1), (5, 1), (13, 1), (16, 1)],
  term ((11459061835227484156317570904387047658568844 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (13, 2), (15, 1), (16, 1)],
  term ((-107639722585045279740 : Rat) / 692956453614176359) [(2, 1), (5, 1), (13, 2), (15, 3), (16, 1)],
  term ((-37673902904765847909 : Rat) / 1385912907228352718) [(2, 1), (5, 1), (13, 3), (16, 1)],
  term ((9502554447087405588479186838102620729513045 : Rat) / 1349660814810636123005926626071864437583984) [(2, 1), (5, 1), (15, 1), (16, 1)],
  term ((-2240403272346910382248035763598470022700377 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (5, 1), (15, 3), (16, 1)],
  term ((-6711189780963057975675238698337049856000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1385153690424507000 : Rat) / 692956453614176359) [(2, 1), (5, 2), (6, 1), (16, 1)],
  term ((-484056940372150648850224353795744000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 2), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((23728281390791698473050213421360000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((354975089606243809156831192783545600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 2), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-30846765808029208014965277447768000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 2), (7, 1), (15, 1), (16, 1)],
  term ((32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 2), (7, 1), (15, 3), (16, 1)],
  term ((-80729791938783959805 : Rat) / 692956453614176359) [(2, 1), (5, 2), (12, 1), (13, 2), (16, 1)],
  term ((-645409253829534198466965805060992000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 2), (13, 2), (15, 1), (16, 1)],
  term ((1290818507659068396933931610121984000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 2), (13, 2), (15, 3), (16, 1)],
  term ((-11389575067580015267064102442252800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 2), (15, 1), (16, 1)],
  term ((22779150135160030534128204884505600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 2), (15, 3), (16, 1)],
  term ((86111778068036223792 : Rat) / 692956453614176359) [(5, 1), (6, 1), (9, 1), (13, 2), (16, 1)],
  term ((-30955433660627124993 : Rat) / 2771825814456705436) [(5, 1), (6, 1), (9, 1), (16, 1)],
  term ((47640465710460000 : Rat) / 692956453614176359) [(5, 1), (6, 1), (10, 1), (11, 1), (16, 1)],
  term ((-244293712003370549631544627149109440000 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (6, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-4843636076722786875 : Rat) / 1385912907228352718) [(5, 1), (6, 1), (10, 1), (13, 1), (16, 1)],
  term ((760550990762443999512984918128450496000 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (6, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((62771517515721436069662227141158588714575 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((66994404905334375 : Rat) / 692956453614176359) [(5, 1), (6, 1), (11, 1), (12, 1), (16, 1)],
  term ((19894044390296437222431488782249663761750 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-956121245529929599387752468504337766400 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (6, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-58576465092935895420021750461658590283600 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((-550696689531679500 : Rat) / 692956453614176359) [(5, 1), (6, 1), (11, 1), (16, 1)],
  term ((166741629986610000 : Rat) / 692956453614176359) [(5, 1), (6, 1), (11, 2), (15, 1), (16, 1)],
  term ((384422964890970476913 : Rat) / 5543651628913410872) [(5, 1), (6, 1), (12, 1), (13, 1), (16, 1)],
  term ((-21527944517009055948 : Rat) / 692956453614176359) [(5, 1), (6, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((5512819400368696418782510098532711359943839 : Rat) / 1349660814810636123005926626071864437583984) [(5, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((9445781916965549071529136695663594096872181 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((-150445491817593666083 : Rat) / 2771825814456705436) [(5, 1), (6, 1), (13, 1), (16, 1)],
  term ((-17671367316459434795066724701114576138470146 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (6, 1), (13, 2), (15, 1), (16, 1)],
  term ((-215279445170090559480 : Rat) / 692956453614176359) [(5, 1), (6, 1), (13, 2), (15, 3), (16, 1)],
  term ((-10763972258504527974 : Rat) / 692956453614176359) [(5, 1), (6, 1), (13, 3), (16, 1)],
  term ((127688267393908154570641191318960823373969 : Rat) / 1349660814810636123005926626071864437583984) [(5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-2104639235181182094975540307520976395808377 : Rat) / 168707601851329515375740828258983054697998) [(5, 1), (6, 1), (15, 3), (16, 1)],
  term ((322704626914767099233482902530496000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 2), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((5694787533790007633532051221126400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 2), (7, 1), (15, 2), (16, 1)],
  term ((11910116427615000 : Rat) / 692956453614176359) [(5, 1), (6, 2), (11, 1), (16, 1)],
  term ((-199241833525243875 : Rat) / 1385912907228352718) [(5, 1), (6, 2), (13, 1), (16, 1)],
  term ((6551747197437959033898108762381316290596670 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (6, 2), (13, 2), (15, 1), (16, 1)],
  term ((591233758816710615558086028488332001985549 : Rat) / 674830407405318061502963313035932218791992) [(5, 1), (6, 2), (15, 1), (16, 1)],
  term ((-92050785676708875 : Rat) / 1385912907228352718) [(5, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((239030311382482399846938117126084441600 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (7, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((14644116273233973855005437615414647570900 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-41685407496652500 : Rat) / 692956453614176359) [(5, 1), (7, 1), (11, 2), (16, 1)],
  term ((673411150155922742207555806920901200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-242028470186075324425112176897872000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((166749471357106723239 : Rat) / 5543651628913410872) [(5, 1), (7, 1), (12, 1), (13, 2), (16, 1)],
  term ((-13825257909492239719898799349728360000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-32840951158957446503657795384244000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((-578290294120164951 : Rat) / 764641603988056672) [(5, 1), (7, 1), (12, 1), (16, 1)],
  term ((-1060953045252120477830586106212121437989357 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((1095078697610235374508799516228929600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (13, 1), (15, 3), (16, 1)],
  term ((-2162134463183629375757086113742080000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((322704626914767099233482902530496000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (13, 2), (15, 4), (16, 1)],
  term ((423498012239131670313 : Rat) / 5543651628913410872) [(5, 1), (7, 1), (13, 2), (16, 1)],
  term ((10194995776671060036958312364410300800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((1538701444754814528784797335490656593603331 : Rat) / 674830407405318061502963313035932218791992) [(5, 1), (7, 1), (15, 2), (16, 1)],
  term ((-97309513697953132801819541906150400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (15, 4), (16, 1)],
  term ((39496077136136433567 : Rat) / 5543651628913410872) [(5, 1), (7, 1), (16, 1)],
  term ((-251681336998669734527340263719497600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((18063785280053765348207162472686400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (12, 1), (15, 1), (16, 1)],
  term ((90355949250665806696100146029763200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (13, 1), (15, 2), (16, 1)],
  term ((-6551492000695065069506556200448783054971070 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (7, 2), (13, 2), (15, 1), (16, 1)],
  term ((-610376991074716919105675325156784190188749 : Rat) / 674830407405318061502963313035932218791992) [(5, 1), (7, 2), (15, 1), (16, 1)],
  term ((-77620088714104702153969364811830400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (15, 3), (16, 1)],
  term ((-322704626914767099233482902530496000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 3), (13, 2), (15, 2), (16, 1)],
  term ((-5694787533790007633532051221126400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 3), (15, 2), (16, 1)],
  term ((19543496960269643970523570171928755200 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-35162393466106350 : Rat) / 692956453614176359) [(5, 1), (9, 1), (16, 1)],
  term ((-29775291069037500 : Rat) / 692956453614176359) [(5, 1), (10, 1), (11, 1), (16, 1)],
  term ((-3183574121101489500 : Rat) / 692956453614176359) [(5, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((32572494933782739950872616953214592000 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((10606760870952153375 : Rat) / 2771825814456705436) [(5, 1), (10, 1), (13, 1), (16, 1)],
  term ((97785127383742799937383775187943635200 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((47384560950961550325501210427595762100 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (10, 1), (15, 1), (16, 1)],
  term ((-106848627322152343492287821136270391200 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-8933538213261045000 : Rat) / 692956453614176359) [(5, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((-739561277842910879317489101332838816000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((2723913011097289125 : Rat) / 11087303257826821744) [(5, 1), (11, 1), (12, 1), (16, 1)],
  term ((-137584278989425887466300832244723070893975 : Rat) / 168707601851329515375740828258983054697998) [(5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((49304085189527391954499273422189254400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-2620606629610106333514019741360892313600 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((6551261356391433000 : Rat) / 692956453614176359) [(5, 1), (11, 1), (13, 2), (16, 1)],
  term ((542344937084801311499492007644081798400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((1587321849470827876743360606356951138475 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (11, 1), (15, 2), (16, 1)],
  term ((-3383792457399581625 : Rat) / 11087303257826821744) [(5, 1), (11, 1), (16, 1)],
  term ((-41685407496652500 : Rat) / 692956453614176359) [(5, 1), (11, 2), (15, 1), (16, 1)],
  term ((434968819639447603720942718117836689600 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((238887582178858674933 : Rat) / 22174606515653643488) [(5, 1), (12, 1), (13, 1), (16, 1)],
  term ((-9852972799248927029515601817054287370563805 : Rat) / 168707601851329515375740828258983054697998) [(5, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-13554670509346661261909181750685004553669125 : Rat) / 2699321629621272246011853252143728875167968) [(5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1718877231716861616131978050222143404486897 : Rat) / 337415203702659030751481656517966109395996) [(5, 1), (13, 1), (15, 2), (16, 1)],
  term ((-834538340144665796651 : Rat) / 44349213031307286976) [(5, 1), (13, 1), (16, 1)],
  term ((-5729530917613742078158785452193523829284422 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (13, 2), (15, 1), (16, 1)],
  term ((53819861292522639870 : Rat) / 692956453614176359) [(5, 1), (13, 2), (15, 3), (16, 1)],
  term ((37673902904765847909 : Rat) / 2771825814456705436) [(5, 1), (13, 3), (16, 1)],
  term ((-9502554447087405588479186838102620729513045 : Rat) / 2699321629621272246011853252143728875167968) [(5, 1), (15, 1), (16, 1)],
  term ((2240403272346910382248035763598470022700377 : Rat) / 674830407405318061502963313035932218791992) [(5, 1), (15, 3), (16, 1)],
  term ((3355594890481528987837619349168524928000 : Rat) / 84353800925664757687870414129491527348999) [(5, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((692576845212253500 : Rat) / 692956453614176359) [(5, 2), (6, 1), (16, 1)],
  term ((242028470186075324425112176897872000 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-11864140695395849236525106710680000 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-177487544803121904578415596391772800 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((15423382904014604007482638723884000 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (15, 1), (16, 1)],
  term ((-16135231345738354961674145126524800 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (15, 3), (16, 1)],
  term ((80729791938783959805 : Rat) / 1385912907228352718) [(5, 2), (12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 9, terms 700 through 799. -/
theorem ep_Q2_008_block_09_0700_0799_valid :
    checkProductSumEq ep_Q2_008_partials_09_0700_0799
      ep_Q2_008_block_09_0700_0799 = true := by
  native_decide

end EpQ2008TermShards

end Patterns

end EndpointCertificate

end Problem97
