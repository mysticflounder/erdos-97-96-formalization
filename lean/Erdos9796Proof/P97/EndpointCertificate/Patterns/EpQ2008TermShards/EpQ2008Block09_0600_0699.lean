/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_008, term block 9:600-699

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_008`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2008TermShards

/-- Generator polynomial 9 for endpoint certificate `ep_Q2_008`. -/
def ep_Q2_008_generator_09_0600_0699 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(2, 1)]
]

/-- Coefficient term 600 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0600 : Poly :=
[
  term ((-2392741860386051317660949145264553582200 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (6, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 600 for generator 9. -/
def ep_Q2_008_partial_09_0600 : Poly :=
[
  term ((-4785483720772102635321898290529107164400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((2392741860386051317660949145264553582200 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (6, 1), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 600 for generator 9. -/
theorem ep_Q2_008_partial_09_0600_valid :
    mulPoly ep_Q2_008_coefficient_09_0600
        ep_Q2_008_generator_09_0600_0699 =
      ep_Q2_008_partial_09_0600 := by
  native_decide

/-- Coefficient term 601 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0601 : Poly :=
[
  term ((124689594423356035933488121506542400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 1), (15, 3), (16, 1)]
]

/-- Partial product 601 for generator 9. -/
def ep_Q2_008_partial_09_0601 : Poly :=
[
  term ((249379188846712071866976243013084800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (6, 1), (7, 1), (15, 3), (16, 1)],
  term ((-124689594423356035933488121506542400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 601 for generator 9. -/
theorem ep_Q2_008_partial_09_0601_valid :
    mulPoly ep_Q2_008_coefficient_09_0601
        ep_Q2_008_generator_09_0600_0699 =
      ep_Q2_008_partial_09_0601 := by
  native_decide

/-- Coefficient term 602 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0602 : Poly :=
[
  term ((52208389534807899966554525138047200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 602 for generator 9. -/
def ep_Q2_008_partial_09_0602 : Poly :=
[
  term ((104416779069615799933109050276094400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-52208389534807899966554525138047200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 602 for generator 9. -/
theorem ep_Q2_008_partial_09_0602_valid :
    mulPoly ep_Q2_008_coefficient_09_0602
        ep_Q2_008_generator_09_0600_0699 =
      ep_Q2_008_partial_09_0602 := by
  native_decide

/-- Coefficient term 603 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0603 : Poly :=
[
  term ((-166741629986610000 : Rat) / 692956453614176359) [(4, 1), (6, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 603 for generator 9. -/
def ep_Q2_008_partial_09_0603 : Poly :=
[
  term ((-333483259973220000 : Rat) / 692956453614176359) [(2, 1), (4, 1), (6, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((166741629986610000 : Rat) / 692956453614176359) [(4, 1), (6, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 603 for generator 9. -/
theorem ep_Q2_008_partial_09_0603_valid :
    mulPoly ep_Q2_008_coefficient_09_0603
        ep_Q2_008_generator_09_0600_0699 =
      ep_Q2_008_partial_09_0603 := by
  native_decide

/-- Coefficient term 604 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0604 : Poly :=
[
  term ((-398483667050487750 : Rat) / 692956453614176359) [(4, 1), (6, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 604 for generator 9. -/
def ep_Q2_008_partial_09_0604 : Poly :=
[
  term ((-796967334100975500 : Rat) / 692956453614176359) [(2, 1), (4, 1), (6, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((398483667050487750 : Rat) / 692956453614176359) [(4, 1), (6, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 604 for generator 9. -/
theorem ep_Q2_008_partial_09_0604_valid :
    mulPoly ep_Q2_008_coefficient_09_0604
        ep_Q2_008_generator_09_0600_0699 =
      ep_Q2_008_partial_09_0604 := by
  native_decide

/-- Coefficient term 605 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0605 : Poly :=
[
  term ((956121245529929599387752468504337766400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (6, 1), (10, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 605 for generator 9. -/
def ep_Q2_008_partial_09_0605 : Poly :=
[
  term ((1912242491059859198775504937008675532800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (6, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((-956121245529929599387752468504337766400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (6, 1), (10, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 605 for generator 9. -/
theorem ep_Q2_008_partial_09_0605_valid :
    mulPoly ep_Q2_008_coefficient_09_0605
        ep_Q2_008_generator_09_0600_0699 =
      ep_Q2_008_partial_09_0605 := by
  native_decide

/-- Coefficient term 606 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0606 : Poly :=
[
  term ((58576465092935895420021750461658590283600 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (6, 1), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 606 for generator 9. -/
def ep_Q2_008_partial_09_0606 : Poly :=
[
  term ((117152930185871790840043500923317180567200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (6, 1), (10, 1), (15, 2), (16, 1)],
  term ((-58576465092935895420021750461658590283600 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (6, 1), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 606 for generator 9. -/
theorem ep_Q2_008_partial_09_0606_valid :
    mulPoly ep_Q2_008_coefficient_09_0606
        ep_Q2_008_generator_09_0600_0699 =
      ep_Q2_008_partial_09_0606 := by
  native_decide

/-- Coefficient term 607 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0607 : Poly :=
[
  term ((-244293712003370549631544627149109440000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (6, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 607 for generator 9. -/
def ep_Q2_008_partial_09_0607 : Poly :=
[
  term ((-488587424006741099263089254298218880000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (6, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((244293712003370549631544627149109440000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (6, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 607 for generator 9. -/
theorem ep_Q2_008_partial_09_0607_valid :
    mulPoly ep_Q2_008_coefficient_09_0607
        ep_Q2_008_generator_09_0600_0699 =
      ep_Q2_008_partial_09_0607 := by
  native_decide

/-- Coefficient term 608 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0608 : Poly :=
[
  term ((-4924029362609188125 : Rat) / 1385912907228352718) [(4, 1), (6, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 608 for generator 9. -/
def ep_Q2_008_partial_09_0608 : Poly :=
[
  term ((-4924029362609188125 : Rat) / 692956453614176359) [(2, 1), (4, 1), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((4924029362609188125 : Rat) / 1385912907228352718) [(4, 1), (6, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 608 for generator 9. -/
theorem ep_Q2_008_partial_09_0608_valid :
    mulPoly ep_Q2_008_coefficient_09_0608
        ep_Q2_008_generator_09_0600_0699 =
      ep_Q2_008_partial_09_0608 := by
  native_decide

/-- Coefficient term 609 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0609 : Poly :=
[
  term ((760550990762443999512984918128450496000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (6, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 609 for generator 9. -/
def ep_Q2_008_partial_09_0609 : Poly :=
[
  term ((1521101981524887999025969836256900992000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (6, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-760550990762443999512984918128450496000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (6, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 609 for generator 9. -/
theorem ep_Q2_008_partial_09_0609_valid :
    mulPoly ep_Q2_008_coefficient_09_0609
        ep_Q2_008_generator_09_0600_0699 =
      ep_Q2_008_partial_09_0609 := by
  native_decide

/-- Coefficient term 610 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0610 : Poly :=
[
  term ((92855326370671422675340111803800637525825 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (6, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 610 for generator 9. -/
def ep_Q2_008_partial_09_0610 : Poly :=
[
  term ((185710652741342845350680223607601275051650 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-92855326370671422675340111803800637525825 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (6, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 610 for generator 9. -/
theorem ep_Q2_008_partial_09_0610_valid :
    mulPoly ep_Q2_008_coefficient_09_0610
        ep_Q2_008_generator_09_0600_0699 =
      ep_Q2_008_partial_09_0610 := by
  native_decide

/-- Coefficient term 611 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0611 : Poly :=
[
  term ((47640465710460000 : Rat) / 692956453614176359) [(4, 1), (6, 1), (11, 2), (16, 1)]
]

/-- Partial product 611 for generator 9. -/
def ep_Q2_008_partial_09_0611 : Poly :=
[
  term ((95280931420920000 : Rat) / 692956453614176359) [(2, 1), (4, 1), (6, 1), (11, 2), (16, 1)],
  term ((-47640465710460000 : Rat) / 692956453614176359) [(4, 1), (6, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 611 for generator 9. -/
theorem ep_Q2_008_partial_09_0611_valid :
    mulPoly ep_Q2_008_coefficient_09_0611
        ep_Q2_008_generator_09_0600_0699 =
      ep_Q2_008_partial_09_0611 := by
  native_decide

/-- Coefficient term 612 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0612 : Poly :=
[
  term ((11460814755539028040614640180721123966668023 : Rat) / 1349660814810636123005926626071864437583984) [(4, 1), (6, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 612 for generator 9. -/
def ep_Q2_008_partial_09_0612 : Poly :=
[
  term ((11460814755539028040614640180721123966668023 : Rat) / 674830407405318061502963313035932218791992) [(2, 1), (4, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-11460814755539028040614640180721123966668023 : Rat) / 1349660814810636123005926626071864437583984) [(4, 1), (6, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 612 for generator 9. -/
theorem ep_Q2_008_partial_09_0612_valid :
    mulPoly ep_Q2_008_coefficient_09_0612
        ep_Q2_008_generator_09_0600_0699 =
      ep_Q2_008_partial_09_0612 := by
  native_decide

/-- Coefficient term 613 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0613 : Poly :=
[
  term ((-1070124977798169189215806627840588838400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (6, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 613 for generator 9. -/
def ep_Q2_008_partial_09_0613 : Poly :=
[
  term ((-2140249955596338378431613255681177676800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (6, 1), (13, 2), (15, 2), (16, 1)],
  term ((1070124977798169189215806627840588838400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (6, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 613 for generator 9. -/
theorem ep_Q2_008_partial_09_0613_valid :
    mulPoly ep_Q2_008_coefficient_09_0613
        ep_Q2_008_generator_09_0600_0699 =
      ep_Q2_008_partial_09_0613 := by
  native_decide

/-- Coefficient term 614 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0614 : Poly :=
[
  term ((-990081092115099243 : Rat) / 191160400997014168) [(4, 1), (6, 1), (13, 2), (16, 1)]
]

/-- Partial product 614 for generator 9. -/
def ep_Q2_008_partial_09_0614 : Poly :=
[
  term ((-990081092115099243 : Rat) / 95580200498507084) [(2, 1), (4, 1), (6, 1), (13, 2), (16, 1)],
  term ((990081092115099243 : Rat) / 191160400997014168) [(4, 1), (6, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 614 for generator 9. -/
theorem ep_Q2_008_partial_09_0614_valid :
    mulPoly ep_Q2_008_coefficient_09_0614
        ep_Q2_008_generator_09_0600_0699 =
      ep_Q2_008_partial_09_0614 := by
  native_decide

/-- Coefficient term 615 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0615 : Poly :=
[
  term ((912661188914932799415581901754140595200 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (6, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 615 for generator 9. -/
def ep_Q2_008_partial_09_0615 : Poly :=
[
  term ((1825322377829865598831163803508281190400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (6, 1), (13, 3), (15, 1), (16, 1)],
  term ((-912661188914932799415581901754140595200 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (6, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 615 for generator 9. -/
theorem ep_Q2_008_partial_09_0615_valid :
    mulPoly ep_Q2_008_coefficient_09_0615
        ep_Q2_008_generator_09_0600_0699 =
      ep_Q2_008_partial_09_0615 := by
  native_decide

/-- Coefficient term 616 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0616 : Poly :=
[
  term ((-1589424927923205831922394675246274355762783 : Rat) / 674830407405318061502963313035932218791992) [(4, 1), (6, 1), (15, 2), (16, 1)]
]

/-- Partial product 616 for generator 9. -/
def ep_Q2_008_partial_09_0616 : Poly :=
[
  term ((-1589424927923205831922394675246274355762783 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (4, 1), (6, 1), (15, 2), (16, 1)],
  term ((1589424927923205831922394675246274355762783 : Rat) / 674830407405318061502963313035932218791992) [(4, 1), (6, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 616 for generator 9. -/
theorem ep_Q2_008_partial_09_0616_valid :
    mulPoly ep_Q2_008_coefficient_09_0616
        ep_Q2_008_generator_09_0600_0699 =
      ep_Q2_008_partial_09_0616 := by
  native_decide

/-- Coefficient term 617 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0617 : Poly :=
[
  term ((1539920450431043081 : Rat) / 692956453614176359) [(4, 1), (6, 1), (16, 1)]
]

/-- Partial product 617 for generator 9. -/
def ep_Q2_008_partial_09_0617 : Poly :=
[
  term ((3079840900862086162 : Rat) / 692956453614176359) [(2, 1), (4, 1), (6, 1), (16, 1)],
  term ((-1539920450431043081 : Rat) / 692956453614176359) [(4, 1), (6, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 617 for generator 9. -/
theorem ep_Q2_008_partial_09_0617_valid :
    mulPoly ep_Q2_008_coefficient_09_0617
        ep_Q2_008_generator_09_0600_0699 =
      ep_Q2_008_partial_09_0617 := by
  native_decide

/-- Coefficient term 618 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0618 : Poly :=
[
  term ((41685407496652500 : Rat) / 692956453614176359) [(4, 1), (7, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 618 for generator 9. -/
def ep_Q2_008_partial_09_0618 : Poly :=
[
  term ((83370814993305000 : Rat) / 692956453614176359) [(2, 1), (4, 1), (7, 1), (10, 1), (11, 1), (16, 1)],
  term ((-41685407496652500 : Rat) / 692956453614176359) [(4, 1), (7, 1), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 618 for generator 9. -/
theorem ep_Q2_008_partial_09_0618_valid :
    mulPoly ep_Q2_008_coefficient_09_0618
        ep_Q2_008_generator_09_0600_0699 =
      ep_Q2_008_partial_09_0618 := by
  native_decide

/-- Coefficient term 619 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0619 : Poly :=
[
  term ((199241833525243875 : Rat) / 1385912907228352718) [(4, 1), (7, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 619 for generator 9. -/
def ep_Q2_008_partial_09_0619 : Poly :=
[
  term ((199241833525243875 : Rat) / 692956453614176359) [(2, 1), (4, 1), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((-199241833525243875 : Rat) / 1385912907228352718) [(4, 1), (7, 1), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 619 for generator 9. -/
theorem ep_Q2_008_partial_09_0619_valid :
    mulPoly ep_Q2_008_coefficient_09_0619
        ep_Q2_008_generator_09_0600_0699 =
      ep_Q2_008_partial_09_0619 := by
  native_decide

/-- Coefficient term 620 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0620 : Poly :=
[
  term ((-239030311382482399846938117126084441600 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (7, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 620 for generator 9. -/
def ep_Q2_008_partial_09_0620 : Poly :=
[
  term ((-478060622764964799693876234252168883200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (7, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((239030311382482399846938117126084441600 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (7, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 620 for generator 9. -/
theorem ep_Q2_008_partial_09_0620_valid :
    mulPoly ep_Q2_008_coefficient_09_0620
        ep_Q2_008_generator_09_0600_0699 =
      ep_Q2_008_partial_09_0620 := by
  native_decide

/-- Coefficient term 621 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0621 : Poly :=
[
  term ((-14644116273233973855005437615414647570900 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (7, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 621 for generator 9. -/
def ep_Q2_008_partial_09_0621 : Poly :=
[
  term ((-29288232546467947710010875230829295141800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((14644116273233973855005437615414647570900 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (7, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 621 for generator 9. -/
theorem ep_Q2_008_partial_09_0621_valid :
    mulPoly ep_Q2_008_coefficient_09_0621
        ep_Q2_008_generator_09_0600_0699 =
      ep_Q2_008_partial_09_0621 := by
  native_decide

/-- Coefficient term 622 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0622 : Poly :=
[
  term ((53595523924267500 : Rat) / 692956453614176359) [(4, 1), (7, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 622 for generator 9. -/
def ep_Q2_008_partial_09_0622 : Poly :=
[
  term ((107191047848535000 : Rat) / 692956453614176359) [(2, 1), (4, 1), (7, 1), (11, 1), (12, 1), (16, 1)],
  term ((-53595523924267500 : Rat) / 692956453614176359) [(4, 1), (7, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 622 for generator 9. -/
theorem ep_Q2_008_partial_09_0622_valid :
    mulPoly ep_Q2_008_coefficient_09_0622
        ep_Q2_008_generator_09_0600_0699 =
      ep_Q2_008_partial_09_0622 := by
  native_decide

/-- Coefficient term 623 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0623 : Poly :=
[
  term ((-2516696167861146740878214511876393696000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 623 for generator 9. -/
def ep_Q2_008_partial_09_0623 : Poly :=
[
  term ((-5033392335722293481756429023752787392000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((2516696167861146740878214511876393696000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 623 for generator 9. -/
theorem ep_Q2_008_partial_09_0623_valid :
    mulPoly ep_Q2_008_coefficient_09_0623
        ep_Q2_008_generator_09_0600_0699 =
      ep_Q2_008_partial_09_0623 := by
  native_decide

/-- Coefficient term 624 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0624 : Poly :=
[
  term ((-519432633909190125 : Rat) / 692956453614176359) [(4, 1), (7, 1), (11, 1), (16, 1)]
]

/-- Partial product 624 for generator 9. -/
def ep_Q2_008_partial_09_0624 : Poly :=
[
  term ((-1038865267818380250 : Rat) / 692956453614176359) [(2, 1), (4, 1), (7, 1), (11, 1), (16, 1)],
  term ((519432633909190125 : Rat) / 692956453614176359) [(4, 1), (7, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 624 for generator 9. -/
theorem ep_Q2_008_partial_09_0624_valid :
    mulPoly ep_Q2_008_coefficient_09_0624
        ep_Q2_008_generator_09_0600_0699 =
      ep_Q2_008_partial_09_0624 := by
  native_decide

/-- Coefficient term 625 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0625 : Poly :=
[
  term ((167461396184942916744996183488534064000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 625 for generator 9. -/
def ep_Q2_008_partial_09_0625 : Poly :=
[
  term ((334922792369885833489992366977068128000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-167461396184942916744996183488534064000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 625 for generator 9. -/
theorem ep_Q2_008_partial_09_0625_valid :
    mulPoly ep_Q2_008_coefficient_09_0625
        ep_Q2_008_generator_09_0600_0699 =
      ep_Q2_008_partial_09_0625 := by
  native_decide

/-- Coefficient term 626 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0626 : Poly :=
[
  term ((8447002578246985353 : Rat) / 1385912907228352718) [(4, 1), (7, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 626 for generator 9. -/
def ep_Q2_008_partial_09_0626 : Poly :=
[
  term ((8447002578246985353 : Rat) / 692956453614176359) [(2, 1), (4, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-8447002578246985353 : Rat) / 1385912907228352718) [(4, 1), (7, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 626 for generator 9. -/
theorem ep_Q2_008_partial_09_0626_valid :
    mulPoly ep_Q2_008_coefficient_09_0626
        ep_Q2_008_generator_09_0600_0699 =
      ep_Q2_008_partial_09_0626 := by
  native_decide

/-- Coefficient term 627 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0627 : Poly :=
[
  term ((-1126491844581746107083349998363272563200 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 627 for generator 9. -/
def ep_Q2_008_partial_09_0627 : Poly :=
[
  term ((-2252983689163492214166699996726545126400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((1126491844581746107083349998363272563200 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 627 for generator 9. -/
theorem ep_Q2_008_partial_09_0627_valid :
    mulPoly ep_Q2_008_coefficient_09_0627
        ep_Q2_008_generator_09_0600_0699 =
      ep_Q2_008_partial_09_0627 := by
  native_decide

/-- Coefficient term 628 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0628 : Poly :=
[
  term ((-613841753329135331856404027305667470575159 : Rat) / 168707601851329515375740828258983054697998) [(4, 1), (7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 628 for generator 9. -/
def ep_Q2_008_partial_09_0628 : Poly :=
[
  term ((-613841753329135331856404027305667470575159 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((613841753329135331856404027305667470575159 : Rat) / 168707601851329515375740828258983054697998) [(4, 1), (7, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 628 for generator 9. -/
theorem ep_Q2_008_partial_09_0628_valid :
    mulPoly ep_Q2_008_coefficient_09_0628
        ep_Q2_008_generator_09_0600_0699 =
      ep_Q2_008_partial_09_0628 := by
  native_decide

/-- Coefficient term 629 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0629 : Poly :=
[
  term ((-44438594159086527066540587275787166254103 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (7, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 629 for generator 9. -/
def ep_Q2_008_partial_09_0629 : Poly :=
[
  term ((-88877188318173054133081174551574332508206 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((44438594159086527066540587275787166254103 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (7, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 629 for generator 9. -/
theorem ep_Q2_008_partial_09_0629_valid :
    mulPoly ep_Q2_008_coefficient_09_0629
        ep_Q2_008_generator_09_0600_0699 =
      ep_Q2_008_partial_09_0629 := by
  native_decide

/-- Coefficient term 630 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0630 : Poly :=
[
  term ((67217096630450258565 : Rat) / 22174606515653643488) [(4, 1), (7, 1), (13, 1), (16, 1)]
]

/-- Partial product 630 for generator 9. -/
def ep_Q2_008_partial_09_0630 : Poly :=
[
  term ((67217096630450258565 : Rat) / 11087303257826821744) [(2, 1), (4, 1), (7, 1), (13, 1), (16, 1)],
  term ((-67217096630450258565 : Rat) / 22174606515653643488) [(4, 1), (7, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 630 for generator 9. -/
theorem ep_Q2_008_partial_09_0630_valid :
    mulPoly ep_Q2_008_coefficient_09_0630
        ep_Q2_008_generator_09_0600_0699 =
      ep_Q2_008_partial_09_0630 := by
  native_decide

/-- Coefficient term 631 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0631 : Poly :=
[
  term ((845196730357005302734698020729637748741557 : Rat) / 337415203702659030751481656517966109395996) [(4, 1), (7, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 631 for generator 9. -/
def ep_Q2_008_partial_09_0631 : Poly :=
[
  term ((845196730357005302734698020729637748741557 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (4, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-845196730357005302734698020729637748741557 : Rat) / 337415203702659030751481656517966109395996) [(4, 1), (7, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 631 for generator 9. -/
theorem ep_Q2_008_partial_09_0631_valid :
    mulPoly ep_Q2_008_coefficient_09_0631
        ep_Q2_008_generator_09_0600_0699 =
      ep_Q2_008_partial_09_0631 := by
  native_decide

/-- Coefficient term 632 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0632 : Poly :=
[
  term ((-7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (13, 2), (15, 3), (16, 1)]
]

/-- Partial product 632 for generator 9. -/
def ep_Q2_008_partial_09_0632 : Poly :=
[
  term ((-14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 1), (13, 2), (15, 3), (16, 1)],
  term ((7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 632 for generator 9. -/
theorem ep_Q2_008_partial_09_0632_valid :
    mulPoly ep_Q2_008_coefficient_09_0632
        ep_Q2_008_generator_09_0600_0699 =
      ep_Q2_008_partial_09_0632 := by
  native_decide

/-- Coefficient term 633 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0633 : Poly :=
[
  term ((35023986704047007290410291685978512000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (13, 3), (15, 2), (16, 1)]
]

/-- Partial product 633 for generator 9. -/
def ep_Q2_008_partial_09_0633 : Poly :=
[
  term ((70047973408094014580820583371957024000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 1), (13, 3), (15, 2), (16, 1)],
  term ((-35023986704047007290410291685978512000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 633 for generator 9. -/
theorem ep_Q2_008_partial_09_0633_valid :
    mulPoly ep_Q2_008_coefficient_09_0633
        ep_Q2_008_generator_09_0600_0699 =
      ep_Q2_008_partial_09_0633 := by
  native_decide

/-- Coefficient term 634 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0634 : Poly :=
[
  term ((364938985264381623 : Rat) / 5543651628913410872) [(4, 1), (7, 1), (13, 3), (16, 1)]
]

/-- Partial product 634 for generator 9. -/
def ep_Q2_008_partial_09_0634 : Poly :=
[
  term ((364938985264381623 : Rat) / 2771825814456705436) [(2, 1), (4, 1), (7, 1), (13, 3), (16, 1)],
  term ((-364938985264381623 : Rat) / 5543651628913410872) [(4, 1), (7, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 634 for generator 9. -/
theorem ep_Q2_008_partial_09_0634_valid :
    mulPoly ep_Q2_008_coefficient_09_0634
        ep_Q2_008_generator_09_0600_0699 =
      ep_Q2_008_partial_09_0634 := by
  native_decide

/-- Coefficient term 635 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0635 : Poly :=
[
  term ((921683860632815981326586623315224000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (13, 4), (15, 1), (16, 1)]
]

/-- Partial product 635 for generator 9. -/
def ep_Q2_008_partial_09_0635 : Poly :=
[
  term ((1843367721265631962653173246630448000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 1), (13, 4), (15, 1), (16, 1)],
  term ((-921683860632815981326586623315224000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (13, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 635 for generator 9. -/
theorem ep_Q2_008_partial_09_0635_valid :
    mulPoly ep_Q2_008_coefficient_09_0635
        ep_Q2_008_generator_09_0600_0699 =
      ep_Q2_008_partial_09_0635 := by
  native_decide

/-- Coefficient term 636 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0636 : Poly :=
[
  term ((-442053169902380091864994894331868278599341 : Rat) / 1349660814810636123005926626071864437583984) [(4, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 636 for generator 9. -/
def ep_Q2_008_partial_09_0636 : Poly :=
[
  term ((-442053169902380091864994894331868278599341 : Rat) / 674830407405318061502963313035932218791992) [(2, 1), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((442053169902380091864994894331868278599341 : Rat) / 1349660814810636123005926626071864437583984) [(4, 1), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 636 for generator 9. -/
theorem ep_Q2_008_partial_09_0636_valid :
    mulPoly ep_Q2_008_coefficient_09_0636
        ep_Q2_008_generator_09_0600_0699 =
      ep_Q2_008_partial_09_0636 := by
  native_decide

/-- Coefficient term 637 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0637 : Poly :=
[
  term ((-69075663604304722221546176848848000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (15, 3), (16, 1)]
]

/-- Partial product 637 for generator 9. -/
def ep_Q2_008_partial_09_0637 : Poly :=
[
  term ((-138151327208609444443092353697696000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 1), (15, 3), (16, 1)],
  term ((69075663604304722221546176848848000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 637 for generator 9. -/
theorem ep_Q2_008_partial_09_0637_valid :
    mulPoly ep_Q2_008_coefficient_09_0637
        ep_Q2_008_generator_09_0600_0699 =
      ep_Q2_008_partial_09_0637 := by
  native_decide

/-- Coefficient term 638 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0638 : Poly :=
[
  term ((-215271046490076175083161936231232000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 638 for generator 9. -/
def ep_Q2_008_partial_09_0638 : Poly :=
[
  term ((-430542092980152350166323872462464000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((215271046490076175083161936231232000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 638 for generator 9. -/
theorem ep_Q2_008_partial_09_0638_valid :
    mulPoly ep_Q2_008_coefficient_09_0638
        ep_Q2_008_generator_09_0600_0699 =
      ep_Q2_008_partial_09_0638 := by
  native_decide

/-- Coefficient term 639 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0639 : Poly :=
[
  term ((205274876882891587215791846321808000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 639 for generator 9. -/
def ep_Q2_008_partial_09_0639 : Poly :=
[
  term ((410549753765783174431583692643616000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 2), (12, 1), (15, 2), (16, 1)],
  term ((-205274876882891587215791846321808000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 639 for generator 9. -/
theorem ep_Q2_008_partial_09_0639_valid :
    mulPoly ep_Q2_008_coefficient_09_0639
        ep_Q2_008_generator_09_0600_0699 =
      ep_Q2_008_partial_09_0639 := by
  native_decide

/-- Coefficient term 640 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0640 : Poly :=
[
  term ((-1668846319631735459243040531074369246400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (7, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 640 for generator 9. -/
def ep_Q2_008_partial_09_0640 : Poly :=
[
  term ((-3337692639263470918486081062148738492800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((1668846319631735459243040531074369246400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (7, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 640 for generator 9. -/
theorem ep_Q2_008_partial_09_0640_valid :
    mulPoly ep_Q2_008_coefficient_09_0640
        ep_Q2_008_generator_09_0600_0699 =
      ep_Q2_008_partial_09_0640 := by
  native_decide

/-- Coefficient term 641 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0641 : Poly :=
[
  term ((-203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 641 for generator 9. -/
def ep_Q2_008_partial_09_0641 : Poly :=
[
  term ((-406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 2), (13, 1), (15, 3), (16, 1)],
  term ((203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 641 for generator 9. -/
theorem ep_Q2_008_partial_09_0641_valid :
    mulPoly ep_Q2_008_coefficient_09_0641
        ep_Q2_008_generator_09_0600_0699 =
      ep_Q2_008_partial_09_0641 := by
  native_decide

/-- Coefficient term 642 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0642 : Poly :=
[
  term ((964600075670260654692524675986963200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 642 for generator 9. -/
def ep_Q2_008_partial_09_0642 : Poly :=
[
  term ((1929200151340521309385049351973926400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 2), (13, 2), (15, 2), (16, 1)],
  term ((-964600075670260654692524675986963200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 642 for generator 9. -/
theorem ep_Q2_008_partial_09_0642_valid :
    mulPoly ep_Q2_008_coefficient_09_0642
        ep_Q2_008_generator_09_0600_0699 =
      ep_Q2_008_partial_09_0642 := by
  native_decide

/-- Coefficient term 643 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0643 : Poly :=
[
  term ((25384212517638438281382228315446400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 643 for generator 9. -/
def ep_Q2_008_partial_09_0643 : Poly :=
[
  term ((50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 2), (13, 3), (15, 1), (16, 1)],
  term ((-25384212517638438281382228315446400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 643 for generator 9. -/
theorem ep_Q2_008_partial_09_0643_valid :
    mulPoly ep_Q2_008_coefficient_09_0643
        ep_Q2_008_generator_09_0600_0699 =
      ep_Q2_008_partial_09_0643 := by
  native_decide

/-- Coefficient term 644 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0644 : Poly :=
[
  term ((-80743471002140829272124059571408000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (15, 2), (16, 1)]
]

/-- Partial product 644 for generator 9. -/
def ep_Q2_008_partial_09_0644 : Poly :=
[
  term ((-161486942004281658544248119142816000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 2), (15, 2), (16, 1)],
  term ((80743471002140829272124059571408000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 644 for generator 9. -/
theorem ep_Q2_008_partial_09_0644_valid :
    mulPoly ep_Q2_008_coefficient_09_0644
        ep_Q2_008_generator_09_0600_0699 =
      ep_Q2_008_partial_09_0644 := by
  native_decide

/-- Coefficient term 645 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0645 : Poly :=
[
  term ((-346288422606126750 : Rat) / 692956453614176359) [(4, 1), (7, 2), (16, 1)]
]

/-- Partial product 645 for generator 9. -/
def ep_Q2_008_partial_09_0645 : Poly :=
[
  term ((-692576845212253500 : Rat) / 692956453614176359) [(2, 1), (4, 1), (7, 2), (16, 1)],
  term ((346288422606126750 : Rat) / 692956453614176359) [(4, 1), (7, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 645 for generator 9. -/
theorem ep_Q2_008_partial_09_0645_valid :
    mulPoly ep_Q2_008_coefficient_09_0645
        ep_Q2_008_generator_09_0600_0699 =
      ep_Q2_008_partial_09_0645 := by
  native_decide

/-- Coefficient term 646 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0646 : Poly :=
[
  term ((-13028997973513095980349046781285836800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 646 for generator 9. -/
def ep_Q2_008_partial_09_0646 : Poly :=
[
  term ((-26057995947026191960698093562571673600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((13028997973513095980349046781285836800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 646 for generator 9. -/
theorem ep_Q2_008_partial_09_0646_valid :
    mulPoly ep_Q2_008_coefficient_09_0646
        ep_Q2_008_generator_09_0600_0699 =
      ep_Q2_008_partial_09_0646 := by
  native_decide

/-- Coefficient term 647 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0647 : Poly :=
[
  term ((-93766382576283600 : Rat) / 692956453614176359) [(4, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 647 for generator 9. -/
def ep_Q2_008_partial_09_0647 : Poly :=
[
  term ((-187532765152567200 : Rat) / 692956453614176359) [(2, 1), (4, 1), (9, 1), (13, 1), (16, 1)],
  term ((93766382576283600 : Rat) / 692956453614176359) [(4, 1), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 647 for generator 9. -/
theorem ep_Q2_008_partial_09_0647_valid :
    mulPoly ep_Q2_008_coefficient_09_0647
        ep_Q2_008_generator_09_0600_0699 =
      ep_Q2_008_partial_09_0647 := by
  native_decide

/-- Coefficient term 648 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0648 : Poly :=
[
  term ((52115991894052383921396187125143347200 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 648 for generator 9. -/
def ep_Q2_008_partial_09_0648 : Poly :=
[
  term ((104231983788104767842792374250286694400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-52115991894052383921396187125143347200 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 648 for generator 9. -/
theorem ep_Q2_008_partial_09_0648_valid :
    mulPoly ep_Q2_008_coefficient_09_0648
        ep_Q2_008_generator_09_0600_0699 =
      ep_Q2_008_partial_09_0648 := by
  native_decide

/-- Coefficient term 649 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0649 : Poly :=
[
  term ((23441595644070900 : Rat) / 692956453614176359) [(4, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 649 for generator 9. -/
def ep_Q2_008_partial_09_0649 : Poly :=
[
  term ((46883191288141800 : Rat) / 692956453614176359) [(2, 1), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((-23441595644070900 : Rat) / 692956453614176359) [(4, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 649 for generator 9. -/
theorem ep_Q2_008_partial_09_0649_valid :
    mulPoly ep_Q2_008_coefficient_09_0649
        ep_Q2_008_generator_09_0600_0699 =
      ep_Q2_008_partial_09_0649 := by
  native_decide

/-- Coefficient term 650 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0650 : Poly :=
[
  term ((41685407496652500 : Rat) / 692956453614176359) [(4, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 650 for generator 9. -/
def ep_Q2_008_partial_09_0650 : Poly :=
[
  term ((83370814993305000 : Rat) / 692956453614176359) [(2, 1), (4, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-41685407496652500 : Rat) / 692956453614176359) [(4, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 650 for generator 9. -/
theorem ep_Q2_008_partial_09_0650_valid :
    mulPoly ep_Q2_008_coefficient_09_0650
        ep_Q2_008_generator_09_0600_0699 =
      ep_Q2_008_partial_09_0650 := by
  native_decide

/-- Coefficient term 651 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0651 : Poly :=
[
  term ((2834618561200656128892554035297319381824125 : Rat) / 168707601851329515375740828258983054697998) [(4, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 651 for generator 9. -/
def ep_Q2_008_partial_09_0651 : Poly :=
[
  term ((2834618561200656128892554035297319381824125 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2834618561200656128892554035297319381824125 : Rat) / 168707601851329515375740828258983054697998) [(4, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 651 for generator 9. -/
theorem ep_Q2_008_partial_09_0651_valid :
    mulPoly ep_Q2_008_coefficient_09_0651
        ep_Q2_008_generator_09_0600_0699 =
      ep_Q2_008_partial_09_0651 := by
  native_decide

/-- Coefficient term 652 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0652 : Poly :=
[
  term ((-125026579114242810018883957789833369600 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (10, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 652 for generator 9. -/
def ep_Q2_008_partial_09_0652 : Poly :=
[
  term ((-250053158228485620037767915579666739200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((125026579114242810018883957789833369600 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (10, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 652 for generator 9. -/
theorem ep_Q2_008_partial_09_0652_valid :
    mulPoly ep_Q2_008_coefficient_09_0652
        ep_Q2_008_generator_09_0600_0699 =
      ep_Q2_008_partial_09_0652 := by
  native_decide

/-- Coefficient term 653 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0653 : Poly :=
[
  term ((2037934158460538625 : Rat) / 692956453614176359) [(4, 1), (10, 1), (13, 2), (16, 1)]
]

/-- Partial product 653 for generator 9. -/
def ep_Q2_008_partial_09_0653 : Poly :=
[
  term ((4075868316921077250 : Rat) / 692956453614176359) [(2, 1), (4, 1), (10, 1), (13, 2), (16, 1)],
  term ((-2037934158460538625 : Rat) / 692956453614176359) [(4, 1), (10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 653 for generator 9. -/
theorem ep_Q2_008_partial_09_0653_valid :
    mulPoly ep_Q2_008_coefficient_09_0653
        ep_Q2_008_generator_09_0600_0699 =
      ep_Q2_008_partial_09_0653 := by
  native_decide

/-- Coefficient term 654 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0654 : Poly :=
[
  term ((-912661188914932799415581901754140595200 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (10, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 654 for generator 9. -/
def ep_Q2_008_partial_09_0654 : Poly :=
[
  term ((-1825322377829865598831163803508281190400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (10, 1), (13, 3), (15, 1), (16, 1)],
  term ((912661188914932799415581901754140595200 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (10, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 654 for generator 9. -/
theorem ep_Q2_008_partial_09_0654_valid :
    mulPoly ep_Q2_008_coefficient_09_0654
        ep_Q2_008_generator_09_0600_0699 =
      ep_Q2_008_partial_09_0654 := by
  native_decide

/-- Coefficient term 655 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0655 : Poly :=
[
  term ((-343464780975318729321846280552485388952100 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 655 for generator 9. -/
def ep_Q2_008_partial_09_0655 : Poly :=
[
  term ((-686929561950637458643692561104970777904200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (10, 1), (15, 2), (16, 1)],
  term ((343464780975318729321846280552485388952100 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 655 for generator 9. -/
theorem ep_Q2_008_partial_09_0655_valid :
    mulPoly ep_Q2_008_coefficient_09_0655
        ep_Q2_008_generator_09_0600_0699 =
      ep_Q2_008_partial_09_0655 := by
  native_decide

/-- Coefficient term 656 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0656 : Poly :=
[
  term ((2218854690464674500 : Rat) / 692956453614176359) [(4, 1), (10, 1), (16, 1)]
]

/-- Partial product 656 for generator 9. -/
def ep_Q2_008_partial_09_0656 : Poly :=
[
  term ((4437709380929349000 : Rat) / 692956453614176359) [(2, 1), (4, 1), (10, 1), (16, 1)],
  term ((-2218854690464674500 : Rat) / 692956453614176359) [(4, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 656 for generator 9. -/
theorem ep_Q2_008_partial_09_0656_valid :
    mulPoly ep_Q2_008_coefficient_09_0656
        ep_Q2_008_generator_09_0600_0699 =
      ep_Q2_008_partial_09_0656 := by
  native_decide

/-- Coefficient term 657 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0657 : Poly :=
[
  term ((2745633208724349143532903699150725683200 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 657 for generator 9. -/
def ep_Q2_008_partial_09_0657 : Poly :=
[
  term ((5491266417448698287065807398301451366400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2745633208724349143532903699150725683200 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 657 for generator 9. -/
theorem ep_Q2_008_partial_09_0657_valid :
    mulPoly ep_Q2_008_coefficient_09_0657
        ep_Q2_008_generator_09_0600_0699 =
      ep_Q2_008_partial_09_0657 := by
  native_decide

/-- Coefficient term 658 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0658 : Poly :=
[
  term ((-5355408726244540125 : Rat) / 692956453614176359) [(4, 1), (11, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 658 for generator 9. -/
def ep_Q2_008_partial_09_0658 : Poly :=
[
  term ((-10710817452489080250 : Rat) / 692956453614176359) [(2, 1), (4, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((5355408726244540125 : Rat) / 692956453614176359) [(4, 1), (11, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 658 for generator 9. -/
theorem ep_Q2_008_partial_09_0658_valid :
    mulPoly ep_Q2_008_coefficient_09_0658
        ep_Q2_008_generator_09_0600_0699 =
      ep_Q2_008_partial_09_0658 := by
  native_decide

/-- Coefficient term 659 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0659 : Poly :=
[
  term ((-10525886575055422134028249532193766425600 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 659 for generator 9. -/
def ep_Q2_008_partial_09_0659 : Poly :=
[
  term ((-21051773150110844268056499064387532851200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((10525886575055422134028249532193766425600 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 659 for generator 9. -/
theorem ep_Q2_008_partial_09_0659_valid :
    mulPoly ep_Q2_008_coefficient_09_0659
        ep_Q2_008_generator_09_0600_0699 =
      ep_Q2_008_partial_09_0659 := by
  native_decide

/-- Coefficient term 660 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0660 : Poly :=
[
  term ((172529461610213251533274973830402497508875 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 660 for generator 9. -/
def ep_Q2_008_partial_09_0660 : Poly :=
[
  term ((345058923220426503066549947660804995017750 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-172529461610213251533274973830402497508875 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 660 for generator 9. -/
theorem ep_Q2_008_partial_09_0660_valid :
    mulPoly ep_Q2_008_coefficient_09_0660
        ep_Q2_008_generator_09_0600_0699 =
      ep_Q2_008_partial_09_0660 := by
  native_decide

/-- Coefficient term 661 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0661 : Poly :=
[
  term ((-577530433824303000316049754988415623862400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 661 for generator 9. -/
def ep_Q2_008_partial_09_0661 : Poly :=
[
  term ((-1155060867648606000632099509976831247724800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((577530433824303000316049754988415623862400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 661 for generator 9. -/
theorem ep_Q2_008_partial_09_0661_valid :
    mulPoly ep_Q2_008_coefficient_09_0661
        ep_Q2_008_generator_09_0600_0699 =
      ep_Q2_008_partial_09_0661 := by
  native_decide

/-- Coefficient term 662 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0662 : Poly :=
[
  term ((87047137098724874625 : Rat) / 11087303257826821744) [(4, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 662 for generator 9. -/
def ep_Q2_008_partial_09_0662 : Poly :=
[
  term ((87047137098724874625 : Rat) / 5543651628913410872) [(2, 1), (4, 1), (11, 1), (13, 1), (16, 1)],
  term ((-87047137098724874625 : Rat) / 11087303257826821744) [(4, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 662 for generator 9. -/
theorem ep_Q2_008_partial_09_0662_valid :
    mulPoly ep_Q2_008_coefficient_09_0662
        ep_Q2_008_generator_09_0600_0699 =
      ep_Q2_008_partial_09_0662 := by
  native_decide

/-- Coefficient term 663 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0663 : Poly :=
[
  term ((2767730276673864027886555744770952680606000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 663 for generator 9. -/
def ep_Q2_008_partial_09_0663 : Poly :=
[
  term ((5535460553347728055773111489541905361212000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-2767730276673864027886555744770952680606000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 663 for generator 9. -/
theorem ep_Q2_008_partial_09_0663_valid :
    mulPoly ep_Q2_008_coefficient_09_0663
        ep_Q2_008_generator_09_0600_0699 =
      ep_Q2_008_partial_09_0663 := by
  native_decide

/-- Coefficient term 664 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0664 : Poly :=
[
  term ((-394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 1), (13, 2), (15, 3), (16, 1)]
]

/-- Partial product 664 for generator 9. -/
def ep_Q2_008_partial_09_0664 : Poly :=
[
  term ((-788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (11, 1), (13, 2), (15, 3), (16, 1)],
  term ((394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 664 for generator 9. -/
theorem ep_Q2_008_partial_09_0664_valid :
    mulPoly ep_Q2_008_coefficient_09_0664
        ep_Q2_008_generator_09_0600_0699 =
      ep_Q2_008_partial_09_0664 := by
  native_decide

/-- Coefficient term 665 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0665 : Poly :=
[
  term ((1873555237202040894270972390043191667200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 1), (13, 3), (15, 2), (16, 1)]
]

/-- Partial product 665 for generator 9. -/
def ep_Q2_008_partial_09_0665 : Poly :=
[
  term ((3747110474404081788541944780086383334400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((-1873555237202040894270972390043191667200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 665 for generator 9. -/
theorem ep_Q2_008_partial_09_0665_valid :
    mulPoly ep_Q2_008_coefficient_09_0665
        ep_Q2_008_generator_09_0600_0699 =
      ep_Q2_008_partial_09_0665 := by
  native_decide

/-- Coefficient term 666 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0666 : Poly :=
[
  term ((595569214217403000 : Rat) / 692956453614176359) [(4, 1), (11, 1), (13, 3), (16, 1)]
]

/-- Partial product 666 for generator 9. -/
def ep_Q2_008_partial_09_0666 : Poly :=
[
  term ((1191138428434806000 : Rat) / 692956453614176359) [(2, 1), (4, 1), (11, 1), (13, 3), (16, 1)],
  term ((-595569214217403000 : Rat) / 692956453614176359) [(4, 1), (11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 666 for generator 9. -/
theorem ep_Q2_008_partial_09_0666_valid :
    mulPoly ep_Q2_008_coefficient_09_0666
        ep_Q2_008_generator_09_0600_0699 =
      ep_Q2_008_partial_09_0666 := by
  native_decide

/-- Coefficient term 667 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0667 : Poly :=
[
  term ((49304085189527391954499273422189254400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 1), (13, 4), (15, 1), (16, 1)]
]

/-- Partial product 667 for generator 9. -/
def ep_Q2_008_partial_09_0667 : Poly :=
[
  term ((98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (11, 1), (13, 4), (15, 1), (16, 1)],
  term ((-49304085189527391954499273422189254400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 1), (13, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 667 for generator 9. -/
theorem ep_Q2_008_partial_09_0667_valid :
    mulPoly ep_Q2_008_coefficient_09_0667
        ep_Q2_008_generator_09_0600_0699 =
      ep_Q2_008_partial_09_0667 := by
  native_decide

/-- Coefficient term 668 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0668 : Poly :=
[
  term ((-22983476625540815947830396444578102434125 : Rat) / 674830407405318061502963313035932218791992) [(4, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 668 for generator 9. -/
def ep_Q2_008_partial_09_0668 : Poly :=
[
  term ((-22983476625540815947830396444578102434125 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((22983476625540815947830396444578102434125 : Rat) / 674830407405318061502963313035932218791992) [(4, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 668 for generator 9. -/
theorem ep_Q2_008_partial_09_0668_valid :
    mulPoly ep_Q2_008_coefficient_09_0668
        ep_Q2_008_generator_09_0600_0699 =
      ep_Q2_008_partial_09_0668 := by
  native_decide

/-- Coefficient term 669 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0669 : Poly :=
[
  term ((-613605632661718295632535903365730304000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (15, 3), (16, 1)]
]

/-- Partial product 669 for generator 9. -/
def ep_Q2_008_partial_09_0669 : Poly :=
[
  term ((-1227211265323436591265071806731460608000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (11, 1), (15, 3), (16, 1)],
  term ((613605632661718295632535903365730304000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 669 for generator 9. -/
theorem ep_Q2_008_partial_09_0669_valid :
    mulPoly ep_Q2_008_coefficient_09_0669
        ep_Q2_008_generator_09_0600_0699 =
      ep_Q2_008_partial_09_0669 := by
  native_decide

/-- Coefficient term 670 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0670 : Poly :=
[
  term ((-29775291069037500 : Rat) / 692956453614176359) [(4, 1), (11, 2), (16, 1)]
]

/-- Partial product 670 for generator 9. -/
def ep_Q2_008_partial_09_0670 : Poly :=
[
  term ((-59550582138075000 : Rat) / 692956453614176359) [(2, 1), (4, 1), (11, 2), (16, 1)],
  term ((29775291069037500 : Rat) / 692956453614176359) [(4, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 670 for generator 9. -/
theorem ep_Q2_008_partial_09_0670_valid :
    mulPoly ep_Q2_008_coefficient_09_0670
        ep_Q2_008_generator_09_0600_0699 =
      ep_Q2_008_partial_09_0670 := by
  native_decide

/-- Coefficient term 671 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0671 : Poly :=
[
  term ((-15119719874140645852610237208654338966400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 671 for generator 9. -/
def ep_Q2_008_partial_09_0671 : Poly :=
[
  term ((-30239439748281291705220474417308677932800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((15119719874140645852610237208654338966400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 671 for generator 9. -/
theorem ep_Q2_008_partial_09_0671_valid :
    mulPoly ep_Q2_008_coefficient_09_0671
        ep_Q2_008_generator_09_0600_0699 =
      ep_Q2_008_partial_09_0671 := by
  native_decide

/-- Coefficient term 672 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0672 : Poly :=
[
  term ((3596253723793725129259455659563648101600 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 672 for generator 9. -/
def ep_Q2_008_partial_09_0672 : Poly :=
[
  term ((7192507447587450258518911319127296203200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (12, 1), (15, 2), (16, 1)],
  term ((-3596253723793725129259455659563648101600 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 672 for generator 9. -/
theorem ep_Q2_008_partial_09_0672_valid :
    mulPoly ep_Q2_008_coefficient_09_0672
        ep_Q2_008_generator_09_0600_0699 =
      ep_Q2_008_partial_09_0672 := by
  native_decide

/-- Coefficient term 673 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0673 : Poly :=
[
  term ((-38561230042895013473 : Rat) / 2771825814456705436) [(4, 1), (12, 1), (16, 1)]
]

/-- Partial product 673 for generator 9. -/
def ep_Q2_008_partial_09_0673 : Poly :=
[
  term ((-38561230042895013473 : Rat) / 1385912907228352718) [(2, 1), (4, 1), (12, 1), (16, 1)],
  term ((38561230042895013473 : Rat) / 2771825814456705436) [(4, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 673 for generator 9. -/
theorem ep_Q2_008_partial_09_0673_valid :
    mulPoly ep_Q2_008_coefficient_09_0673
        ep_Q2_008_generator_09_0600_0699 =
      ep_Q2_008_partial_09_0673 := by
  native_decide

/-- Coefficient term 674 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0674 : Poly :=
[
  term ((-1208068913885209004321638887225660478305957 : Rat) / 674830407405318061502963313035932218791992) [(4, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 674 for generator 9. -/
def ep_Q2_008_partial_09_0674 : Poly :=
[
  term ((-1208068913885209004321638887225660478305957 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((1208068913885209004321638887225660478305957 : Rat) / 674830407405318061502963313035932218791992) [(4, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 674 for generator 9. -/
theorem ep_Q2_008_partial_09_0674_valid :
    mulPoly ep_Q2_008_coefficient_09_0674
        ep_Q2_008_generator_09_0600_0699 =
      ep_Q2_008_partial_09_0674 := by
  native_decide

/-- Coefficient term 675 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0675 : Poly :=
[
  term ((-2410417089960027256144107099007007472000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 675 for generator 9. -/
def ep_Q2_008_partial_09_0675 : Poly :=
[
  term ((-4820834179920054512288214198014014944000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (13, 1), (15, 3), (16, 1)],
  term ((2410417089960027256144107099007007472000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 675 for generator 9. -/
theorem ep_Q2_008_partial_09_0675_valid :
    mulPoly ep_Q2_008_coefficient_09_0675
        ep_Q2_008_generator_09_0600_0699 =
      ep_Q2_008_partial_09_0675 := by
  native_decide

/-- Coefficient term 676 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0676 : Poly :=
[
  term ((18947515978693330830835322374732333464000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 676 for generator 9. -/
def ep_Q2_008_partial_09_0676 : Poly :=
[
  term ((37895031957386661661670644749464666928000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (13, 2), (15, 2), (16, 1)],
  term ((-18947515978693330830835322374732333464000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 676 for generator 9. -/
theorem ep_Q2_008_partial_09_0676_valid :
    mulPoly ep_Q2_008_coefficient_09_0676
        ep_Q2_008_generator_09_0600_0699 =
      ep_Q2_008_partial_09_0676 := by
  native_decide

/-- Coefficient term 677 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0677 : Poly :=
[
  term ((-33835658297308236195 : Rat) / 22174606515653643488) [(4, 1), (13, 2), (16, 1)]
]

/-- Partial product 677 for generator 9. -/
def ep_Q2_008_partial_09_0677 : Poly :=
[
  term ((-33835658297308236195 : Rat) / 11087303257826821744) [(2, 1), (4, 1), (13, 2), (16, 1)],
  term ((33835658297308236195 : Rat) / 22174606515653643488) [(4, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 677 for generator 9. -/
theorem ep_Q2_008_partial_09_0677_valid :
    mulPoly ep_Q2_008_coefficient_09_0677
        ep_Q2_008_generator_09_0600_0699 =
      ep_Q2_008_partial_09_0677 := by
  native_decide

/-- Coefficient term 678 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0678 : Poly :=
[
  term ((-3112453901783845092120865139131441315200 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 678 for generator 9. -/
def ep_Q2_008_partial_09_0678 : Poly :=
[
  term ((-6224907803567690184241730278262882630400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (13, 3), (15, 1), (16, 1)],
  term ((3112453901783845092120865139131441315200 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 678 for generator 9. -/
theorem ep_Q2_008_partial_09_0678_valid :
    mulPoly ep_Q2_008_coefficient_09_0678
        ep_Q2_008_generator_09_0600_0699 =
      ep_Q2_008_partial_09_0678 := by
  native_decide

/-- Coefficient term 679 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0679 : Poly :=
[
  term ((-1342284320277438151428013537198309998407445 : Rat) / 168707601851329515375740828258983054697998) [(4, 1), (15, 2), (16, 1)]
]

/-- Partial product 679 for generator 9. -/
def ep_Q2_008_partial_09_0679 : Poly :=
[
  term ((-1342284320277438151428013537198309998407445 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (15, 2), (16, 1)],
  term ((1342284320277438151428013537198309998407445 : Rat) / 168707601851329515375740828258983054697998) [(4, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 679 for generator 9. -/
theorem ep_Q2_008_partial_09_0679_valid :
    mulPoly ep_Q2_008_coefficient_09_0679
        ep_Q2_008_generator_09_0600_0699 =
      ep_Q2_008_partial_09_0679 := by
  native_decide

/-- Coefficient term 680 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0680 : Poly :=
[
  term ((202741532868096961467 : Rat) / 22174606515653643488) [(4, 1), (16, 1)]
]

/-- Partial product 680 for generator 9. -/
def ep_Q2_008_partial_09_0680 : Poly :=
[
  term ((202741532868096961467 : Rat) / 11087303257826821744) [(2, 1), (4, 1), (16, 1)],
  term ((-202741532868096961467 : Rat) / 22174606515653643488) [(4, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 680 for generator 9. -/
theorem ep_Q2_008_partial_09_0680_valid :
    mulPoly ep_Q2_008_coefficient_09_0680
        ep_Q2_008_generator_09_0600_0699 =
      ep_Q2_008_partial_09_0680 := by
  native_decide

/-- Coefficient term 681 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0681 : Poly :=
[
  term ((199241833525243875 : Rat) / 692956453614176359) [(4, 2), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 681 for generator 9. -/
def ep_Q2_008_partial_09_0681 : Poly :=
[
  term ((398483667050487750 : Rat) / 692956453614176359) [(2, 1), (4, 2), (11, 1), (13, 1), (16, 1)],
  term ((-199241833525243875 : Rat) / 692956453614176359) [(4, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 681 for generator 9. -/
theorem ep_Q2_008_partial_09_0681_valid :
    mulPoly ep_Q2_008_coefficient_09_0681
        ep_Q2_008_generator_09_0600_0699 =
      ep_Q2_008_partial_09_0681 := by
  native_decide

/-- Coefficient term 682 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0682 : Poly :=
[
  term ((-478060622764964799693876234252168883200 : Rat) / 84353800925664757687870414129491527348999) [(4, 2), (11, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 682 for generator 9. -/
def ep_Q2_008_partial_09_0682 : Poly :=
[
  term ((-956121245529929599387752468504337766400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((478060622764964799693876234252168883200 : Rat) / 84353800925664757687870414129491527348999) [(4, 2), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 682 for generator 9. -/
theorem ep_Q2_008_partial_09_0682_valid :
    mulPoly ep_Q2_008_coefficient_09_0682
        ep_Q2_008_generator_09_0600_0699 =
      ep_Q2_008_partial_09_0682 := by
  native_decide

/-- Coefficient term 683 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0683 : Poly :=
[
  term ((-12250624020253221857804351804734105470300 : Rat) / 84353800925664757687870414129491527348999) [(4, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 683 for generator 9. -/
def ep_Q2_008_partial_09_0683 : Poly :=
[
  term ((-24501248040506443715608703609468210940600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 2), (11, 1), (15, 1), (16, 1)],
  term ((12250624020253221857804351804734105470300 : Rat) / 84353800925664757687870414129491527348999) [(4, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 683 for generator 9. -/
theorem ep_Q2_008_partial_09_0683_valid :
    mulPoly ep_Q2_008_coefficient_09_0683
        ep_Q2_008_generator_09_0600_0699 =
      ep_Q2_008_partial_09_0683 := by
  native_decide

/-- Coefficient term 684 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0684 : Poly :=
[
  term ((29775291069037500 : Rat) / 692956453614176359) [(4, 2), (11, 2), (16, 1)]
]

/-- Partial product 684 for generator 9. -/
def ep_Q2_008_partial_09_0684 : Poly :=
[
  term ((59550582138075000 : Rat) / 692956453614176359) [(2, 1), (4, 2), (11, 2), (16, 1)],
  term ((-29775291069037500 : Rat) / 692956453614176359) [(4, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 684 for generator 9. -/
theorem ep_Q2_008_partial_09_0684_valid :
    mulPoly ep_Q2_008_coefficient_09_0684
        ep_Q2_008_generator_09_0600_0699 =
      ep_Q2_008_partial_09_0684 := by
  native_decide

/-- Coefficient term 685 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0685 : Poly :=
[
  term ((69611186046410533288739366850729600 : Rat) / 2908751756057405437512772901016949218931) [(4, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 685 for generator 9. -/
def ep_Q2_008_partial_09_0685 : Poly :=
[
  term ((139222372092821066577478733701459200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 2), (13, 1), (15, 1), (16, 1)],
  term ((-69611186046410533288739366850729600 : Rat) / 2908751756057405437512772901016949218931) [(4, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 685 for generator 9. -/
theorem ep_Q2_008_partial_09_0685_valid :
    mulPoly ep_Q2_008_coefficient_09_0685
        ep_Q2_008_generator_09_0600_0699 =
      ep_Q2_008_partial_09_0685 := by
  native_decide

/-- Coefficient term 686 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0686 : Poly :=
[
  term ((-516327403063627358773572644048793600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (9, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 686 for generator 9. -/
def ep_Q2_008_partial_09_0686 : Poly :=
[
  term ((-1032654806127254717547145288097587200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (6, 1), (7, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((516327403063627358773572644048793600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (9, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 686 for generator 9. -/
theorem ep_Q2_008_partial_09_0686_valid :
    mulPoly ep_Q2_008_coefficient_09_0686
        ep_Q2_008_generator_09_0600_0699 =
      ep_Q2_008_partial_09_0686 := by
  native_decide

/-- Coefficient term 687 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0687 : Poly :=
[
  term ((3796525022526671755688034147417600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 687 for generator 9. -/
def ep_Q2_008_partial_09_0687 : Poly :=
[
  term ((7593050045053343511376068294835200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (6, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-3796525022526671755688034147417600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 687 for generator 9. -/
theorem ep_Q2_008_partial_09_0687_valid :
    mulPoly ep_Q2_008_coefficient_09_0687
        ep_Q2_008_generator_09_0600_0699 =
      ep_Q2_008_partial_09_0687 := by
  native_decide

/-- Coefficient term 688 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0688 : Poly :=
[
  term ((-242917018595602843346656184889820800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 688 for generator 9. -/
def ep_Q2_008_partial_09_0688 : Poly :=
[
  term ((-485834037191205686693312369779641600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (6, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((242917018595602843346656184889820800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 688 for generator 9. -/
theorem ep_Q2_008_partial_09_0688_valid :
    mulPoly ep_Q2_008_coefficient_09_0688
        ep_Q2_008_generator_09_0600_0699 =
      ep_Q2_008_partial_09_0688 := by
  native_decide

/-- Coefficient term 689 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0689 : Poly :=
[
  term ((129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (12, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 689 for generator 9. -/
def ep_Q2_008_partial_09_0689 : Poly :=
[
  term ((258163701531813679386786322024396800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (6, 1), (7, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (12, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 689 for generator 9. -/
theorem ep_Q2_008_partial_09_0689_valid :
    mulPoly ep_Q2_008_coefficient_09_0689
        ep_Q2_008_generator_09_0600_0699 =
      ep_Q2_008_partial_09_0689 := by
  native_decide

/-- Coefficient term 690 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0690 : Poly :=
[
  term ((-229200052523521769995320561514111200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 690 for generator 9. -/
def ep_Q2_008_partial_09_0690 : Poly :=
[
  term ((-458400105047043539990641123028222400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (6, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((229200052523521769995320561514111200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 690 for generator 9. -/
theorem ep_Q2_008_partial_09_0690_valid :
    mulPoly ep_Q2_008_coefficient_09_0690
        ep_Q2_008_generator_09_0600_0699 =
      ep_Q2_008_partial_09_0690 := by
  native_decide

/-- Coefficient term 691 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0691 : Poly :=
[
  term ((1683813079527522074748375616691208921600 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 691 for generator 9. -/
def ep_Q2_008_partial_09_0691 : Poly :=
[
  term ((3367626159055044149496751233382417843200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1683813079527522074748375616691208921600 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 691 for generator 9. -/
theorem ep_Q2_008_partial_09_0691_valid :
    mulPoly ep_Q2_008_coefficient_09_0691
        ep_Q2_008_generator_09_0600_0699 =
      ep_Q2_008_partial_09_0691 := by
  native_decide

/-- Coefficient term 692 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0692 : Poly :=
[
  term ((306333795611957053648672088618227200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 692 for generator 9. -/
def ep_Q2_008_partial_09_0692 : Poly :=
[
  term ((612667591223914107297344177236454400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (6, 1), (7, 1), (13, 1), (15, 3), (16, 1)],
  term ((-306333795611957053648672088618227200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 692 for generator 9. -/
theorem ep_Q2_008_partial_09_0692_valid :
    mulPoly ep_Q2_008_coefficient_09_0692
        ep_Q2_008_generator_09_0600_0699 =
      ep_Q2_008_partial_09_0692 := by
  native_decide

/-- Coefficient term 693 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0693 : Poly :=
[
  term ((-26206011623156449418568525170723470790751480 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (6, 1), (7, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 693 for generator 9. -/
def ep_Q2_008_partial_09_0693 : Poly :=
[
  term ((-52412023246312898837137050341446941581502960 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (6, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((26206011623156449418568525170723470790751480 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (6, 1), (7, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 693 for generator 9. -/
theorem ep_Q2_008_partial_09_0693_valid :
    mulPoly ep_Q2_008_coefficient_09_0693
        ep_Q2_008_generator_09_0600_0699 =
      ep_Q2_008_partial_09_0693 := by
  native_decide

/-- Coefficient term 694 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0694 : Poly :=
[
  term ((1290818507659068396933931610121984000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (13, 2), (15, 4), (16, 1)]
]

/-- Partial product 694 for generator 9. -/
def ep_Q2_008_partial_09_0694 : Poly :=
[
  term ((2581637015318136793867863220243968000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (6, 1), (7, 1), (13, 2), (15, 4), (16, 1)],
  term ((-1290818507659068396933931610121984000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (13, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 694 for generator 9. -/
theorem ep_Q2_008_partial_09_0694_valid :
    mulPoly ep_Q2_008_coefficient_09_0694
        ep_Q2_008_generator_09_0600_0699 =
      ep_Q2_008_partial_09_0694 := by
  native_decide

/-- Coefficient term 695 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0695 : Poly :=
[
  term ((107639722585045279740 : Rat) / 692956453614176359) [(5, 1), (6, 1), (7, 1), (13, 2), (16, 1)]
]

/-- Partial product 695 for generator 9. -/
def ep_Q2_008_partial_09_0695 : Poly :=
[
  term ((215279445170090559480 : Rat) / 692956453614176359) [(2, 1), (5, 1), (6, 1), (7, 1), (13, 2), (16, 1)],
  term ((-107639722585045279740 : Rat) / 692956453614176359) [(5, 1), (6, 1), (7, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 695 for generator 9. -/
theorem ep_Q2_008_partial_09_0695_valid :
    mulPoly ep_Q2_008_coefficient_09_0695
        ep_Q2_008_generator_09_0600_0699 =
      ep_Q2_008_partial_09_0695 := by
  native_decide

/-- Coefficient term 696 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0696 : Poly :=
[
  term ((64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 696 for generator 9. -/
def ep_Q2_008_partial_09_0696 : Poly :=
[
  term ((129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (6, 1), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((-64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 696 for generator 9. -/
theorem ep_Q2_008_partial_09_0696_valid :
    mulPoly ep_Q2_008_coefficient_09_0696
        ep_Q2_008_generator_09_0600_0699 =
      ep_Q2_008_partial_09_0696 := by
  native_decide

/-- Coefficient term 697 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0697 : Poly :=
[
  term ((-610369651028734337705818689181764971591949 : Rat) / 168707601851329515375740828258983054697998) [(5, 1), (6, 1), (7, 1), (15, 2), (16, 1)]
]

/-- Partial product 697 for generator 9. -/
def ep_Q2_008_partial_09_0697 : Poly :=
[
  term ((-610369651028734337705818689181764971591949 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (6, 1), (7, 1), (15, 2), (16, 1)],
  term ((610369651028734337705818689181764971591949 : Rat) / 168707601851329515375740828258983054697998) [(5, 1), (6, 1), (7, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 697 for generator 9. -/
theorem ep_Q2_008_partial_09_0697_valid :
    mulPoly ep_Q2_008_coefficient_09_0697
        ep_Q2_008_generator_09_0600_0699 =
      ep_Q2_008_partial_09_0697 := by
  native_decide

/-- Coefficient term 698 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0698 : Poly :=
[
  term ((-389238054791812531207278167624601600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (15, 4), (16, 1)]
]

/-- Partial product 698 for generator 9. -/
def ep_Q2_008_partial_09_0698 : Poly :=
[
  term ((-778476109583625062414556335249203200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (6, 1), (7, 1), (15, 4), (16, 1)],
  term ((389238054791812531207278167624601600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 698 for generator 9. -/
theorem ep_Q2_008_partial_09_0698_valid :
    mulPoly ep_Q2_008_coefficient_09_0698
        ep_Q2_008_generator_09_0600_0699 =
      ep_Q2_008_partial_09_0698 := by
  native_decide

/-- Coefficient term 699 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0699 : Poly :=
[
  term ((6399366818370788709 : Rat) / 2771825814456705436) [(5, 1), (6, 1), (7, 1), (16, 1)]
]

/-- Partial product 699 for generator 9. -/
def ep_Q2_008_partial_09_0699 : Poly :=
[
  term ((6399366818370788709 : Rat) / 1385912907228352718) [(2, 1), (5, 1), (6, 1), (7, 1), (16, 1)],
  term ((-6399366818370788709 : Rat) / 2771825814456705436) [(5, 1), (6, 1), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 699 for generator 9. -/
theorem ep_Q2_008_partial_09_0699_valid :
    mulPoly ep_Q2_008_coefficient_09_0699
        ep_Q2_008_generator_09_0600_0699 =
      ep_Q2_008_partial_09_0699 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_008_partials_09_0600_0699 : List Poly :=
[
  ep_Q2_008_partial_09_0600,
  ep_Q2_008_partial_09_0601,
  ep_Q2_008_partial_09_0602,
  ep_Q2_008_partial_09_0603,
  ep_Q2_008_partial_09_0604,
  ep_Q2_008_partial_09_0605,
  ep_Q2_008_partial_09_0606,
  ep_Q2_008_partial_09_0607,
  ep_Q2_008_partial_09_0608,
  ep_Q2_008_partial_09_0609,
  ep_Q2_008_partial_09_0610,
  ep_Q2_008_partial_09_0611,
  ep_Q2_008_partial_09_0612,
  ep_Q2_008_partial_09_0613,
  ep_Q2_008_partial_09_0614,
  ep_Q2_008_partial_09_0615,
  ep_Q2_008_partial_09_0616,
  ep_Q2_008_partial_09_0617,
  ep_Q2_008_partial_09_0618,
  ep_Q2_008_partial_09_0619,
  ep_Q2_008_partial_09_0620,
  ep_Q2_008_partial_09_0621,
  ep_Q2_008_partial_09_0622,
  ep_Q2_008_partial_09_0623,
  ep_Q2_008_partial_09_0624,
  ep_Q2_008_partial_09_0625,
  ep_Q2_008_partial_09_0626,
  ep_Q2_008_partial_09_0627,
  ep_Q2_008_partial_09_0628,
  ep_Q2_008_partial_09_0629,
  ep_Q2_008_partial_09_0630,
  ep_Q2_008_partial_09_0631,
  ep_Q2_008_partial_09_0632,
  ep_Q2_008_partial_09_0633,
  ep_Q2_008_partial_09_0634,
  ep_Q2_008_partial_09_0635,
  ep_Q2_008_partial_09_0636,
  ep_Q2_008_partial_09_0637,
  ep_Q2_008_partial_09_0638,
  ep_Q2_008_partial_09_0639,
  ep_Q2_008_partial_09_0640,
  ep_Q2_008_partial_09_0641,
  ep_Q2_008_partial_09_0642,
  ep_Q2_008_partial_09_0643,
  ep_Q2_008_partial_09_0644,
  ep_Q2_008_partial_09_0645,
  ep_Q2_008_partial_09_0646,
  ep_Q2_008_partial_09_0647,
  ep_Q2_008_partial_09_0648,
  ep_Q2_008_partial_09_0649,
  ep_Q2_008_partial_09_0650,
  ep_Q2_008_partial_09_0651,
  ep_Q2_008_partial_09_0652,
  ep_Q2_008_partial_09_0653,
  ep_Q2_008_partial_09_0654,
  ep_Q2_008_partial_09_0655,
  ep_Q2_008_partial_09_0656,
  ep_Q2_008_partial_09_0657,
  ep_Q2_008_partial_09_0658,
  ep_Q2_008_partial_09_0659,
  ep_Q2_008_partial_09_0660,
  ep_Q2_008_partial_09_0661,
  ep_Q2_008_partial_09_0662,
  ep_Q2_008_partial_09_0663,
  ep_Q2_008_partial_09_0664,
  ep_Q2_008_partial_09_0665,
  ep_Q2_008_partial_09_0666,
  ep_Q2_008_partial_09_0667,
  ep_Q2_008_partial_09_0668,
  ep_Q2_008_partial_09_0669,
  ep_Q2_008_partial_09_0670,
  ep_Q2_008_partial_09_0671,
  ep_Q2_008_partial_09_0672,
  ep_Q2_008_partial_09_0673,
  ep_Q2_008_partial_09_0674,
  ep_Q2_008_partial_09_0675,
  ep_Q2_008_partial_09_0676,
  ep_Q2_008_partial_09_0677,
  ep_Q2_008_partial_09_0678,
  ep_Q2_008_partial_09_0679,
  ep_Q2_008_partial_09_0680,
  ep_Q2_008_partial_09_0681,
  ep_Q2_008_partial_09_0682,
  ep_Q2_008_partial_09_0683,
  ep_Q2_008_partial_09_0684,
  ep_Q2_008_partial_09_0685,
  ep_Q2_008_partial_09_0686,
  ep_Q2_008_partial_09_0687,
  ep_Q2_008_partial_09_0688,
  ep_Q2_008_partial_09_0689,
  ep_Q2_008_partial_09_0690,
  ep_Q2_008_partial_09_0691,
  ep_Q2_008_partial_09_0692,
  ep_Q2_008_partial_09_0693,
  ep_Q2_008_partial_09_0694,
  ep_Q2_008_partial_09_0695,
  ep_Q2_008_partial_09_0696,
  ep_Q2_008_partial_09_0697,
  ep_Q2_008_partial_09_0698,
  ep_Q2_008_partial_09_0699
]

/-- Sum of partial products in this block. -/
def ep_Q2_008_block_09_0600_0699 : Poly :=
[
  term ((-4785483720772102635321898290529107164400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((249379188846712071866976243013084800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (6, 1), (7, 1), (15, 3), (16, 1)],
  term ((104416779069615799933109050276094400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-333483259973220000 : Rat) / 692956453614176359) [(2, 1), (4, 1), (6, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-796967334100975500 : Rat) / 692956453614176359) [(2, 1), (4, 1), (6, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((1912242491059859198775504937008675532800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (6, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((117152930185871790840043500923317180567200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (6, 1), (10, 1), (15, 2), (16, 1)],
  term ((-488587424006741099263089254298218880000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (6, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-4924029362609188125 : Rat) / 692956453614176359) [(2, 1), (4, 1), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((1521101981524887999025969836256900992000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (6, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((185710652741342845350680223607601275051650 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((95280931420920000 : Rat) / 692956453614176359) [(2, 1), (4, 1), (6, 1), (11, 2), (16, 1)],
  term ((11460814755539028040614640180721123966668023 : Rat) / 674830407405318061502963313035932218791992) [(2, 1), (4, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2140249955596338378431613255681177676800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (6, 1), (13, 2), (15, 2), (16, 1)],
  term ((-990081092115099243 : Rat) / 95580200498507084) [(2, 1), (4, 1), (6, 1), (13, 2), (16, 1)],
  term ((1825322377829865598831163803508281190400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (6, 1), (13, 3), (15, 1), (16, 1)],
  term ((-1589424927923205831922394675246274355762783 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (4, 1), (6, 1), (15, 2), (16, 1)],
  term ((3079840900862086162 : Rat) / 692956453614176359) [(2, 1), (4, 1), (6, 1), (16, 1)],
  term ((83370814993305000 : Rat) / 692956453614176359) [(2, 1), (4, 1), (7, 1), (10, 1), (11, 1), (16, 1)],
  term ((199241833525243875 : Rat) / 692956453614176359) [(2, 1), (4, 1), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((-478060622764964799693876234252168883200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (7, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-29288232546467947710010875230829295141800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((107191047848535000 : Rat) / 692956453614176359) [(2, 1), (4, 1), (7, 1), (11, 1), (12, 1), (16, 1)],
  term ((-5033392335722293481756429023752787392000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1038865267818380250 : Rat) / 692956453614176359) [(2, 1), (4, 1), (7, 1), (11, 1), (16, 1)],
  term ((334922792369885833489992366977068128000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((8447002578246985353 : Rat) / 692956453614176359) [(2, 1), (4, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-2252983689163492214166699996726545126400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-613841753329135331856404027305667470575159 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-88877188318173054133081174551574332508206 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((67217096630450258565 : Rat) / 11087303257826821744) [(2, 1), (4, 1), (7, 1), (13, 1), (16, 1)],
  term ((845196730357005302734698020729637748741557 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (4, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 1), (13, 2), (15, 3), (16, 1)],
  term ((70047973408094014580820583371957024000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 1), (13, 3), (15, 2), (16, 1)],
  term ((364938985264381623 : Rat) / 2771825814456705436) [(2, 1), (4, 1), (7, 1), (13, 3), (16, 1)],
  term ((1843367721265631962653173246630448000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 1), (13, 4), (15, 1), (16, 1)],
  term ((-442053169902380091864994894331868278599341 : Rat) / 674830407405318061502963313035932218791992) [(2, 1), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((-138151327208609444443092353697696000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 1), (15, 3), (16, 1)],
  term ((-430542092980152350166323872462464000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((410549753765783174431583692643616000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 2), (12, 1), (15, 2), (16, 1)],
  term ((-3337692639263470918486081062148738492800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 2), (13, 1), (15, 3), (16, 1)],
  term ((1929200151340521309385049351973926400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 2), (13, 2), (15, 2), (16, 1)],
  term ((50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 2), (13, 3), (15, 1), (16, 1)],
  term ((-161486942004281658544248119142816000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (7, 2), (15, 2), (16, 1)],
  term ((-692576845212253500 : Rat) / 692956453614176359) [(2, 1), (4, 1), (7, 2), (16, 1)],
  term ((-26057995947026191960698093562571673600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-187532765152567200 : Rat) / 692956453614176359) [(2, 1), (4, 1), (9, 1), (13, 1), (16, 1)],
  term ((104231983788104767842792374250286694400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((46883191288141800 : Rat) / 692956453614176359) [(2, 1), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((83370814993305000 : Rat) / 692956453614176359) [(2, 1), (4, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((2834618561200656128892554035297319381824125 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-250053158228485620037767915579666739200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((4075868316921077250 : Rat) / 692956453614176359) [(2, 1), (4, 1), (10, 1), (13, 2), (16, 1)],
  term ((-1825322377829865598831163803508281190400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (10, 1), (13, 3), (15, 1), (16, 1)],
  term ((-686929561950637458643692561104970777904200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (10, 1), (15, 2), (16, 1)],
  term ((4437709380929349000 : Rat) / 692956453614176359) [(2, 1), (4, 1), (10, 1), (16, 1)],
  term ((5491266417448698287065807398301451366400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-10710817452489080250 : Rat) / 692956453614176359) [(2, 1), (4, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-21051773150110844268056499064387532851200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((345058923220426503066549947660804995017750 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1155060867648606000632099509976831247724800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((87047137098724874625 : Rat) / 5543651628913410872) [(2, 1), (4, 1), (11, 1), (13, 1), (16, 1)],
  term ((5535460553347728055773111489541905361212000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (11, 1), (13, 2), (15, 3), (16, 1)],
  term ((3747110474404081788541944780086383334400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((1191138428434806000 : Rat) / 692956453614176359) [(2, 1), (4, 1), (11, 1), (13, 3), (16, 1)],
  term ((98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (11, 1), (13, 4), (15, 1), (16, 1)],
  term ((-22983476625540815947830396444578102434125 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1227211265323436591265071806731460608000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (11, 1), (15, 3), (16, 1)],
  term ((-59550582138075000 : Rat) / 692956453614176359) [(2, 1), (4, 1), (11, 2), (16, 1)],
  term ((-30239439748281291705220474417308677932800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((7192507447587450258518911319127296203200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (12, 1), (15, 2), (16, 1)],
  term ((-38561230042895013473 : Rat) / 1385912907228352718) [(2, 1), (4, 1), (12, 1), (16, 1)],
  term ((-1208068913885209004321638887225660478305957 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4820834179920054512288214198014014944000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (13, 1), (15, 3), (16, 1)],
  term ((37895031957386661661670644749464666928000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (13, 2), (15, 2), (16, 1)],
  term ((-33835658297308236195 : Rat) / 11087303257826821744) [(2, 1), (4, 1), (13, 2), (16, 1)],
  term ((-6224907803567690184241730278262882630400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (13, 3), (15, 1), (16, 1)],
  term ((-1342284320277438151428013537198309998407445 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (15, 2), (16, 1)],
  term ((202741532868096961467 : Rat) / 11087303257826821744) [(2, 1), (4, 1), (16, 1)],
  term ((398483667050487750 : Rat) / 692956453614176359) [(2, 1), (4, 2), (11, 1), (13, 1), (16, 1)],
  term ((-956121245529929599387752468504337766400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-24501248040506443715608703609468210940600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 2), (11, 1), (15, 1), (16, 1)],
  term ((59550582138075000 : Rat) / 692956453614176359) [(2, 1), (4, 2), (11, 2), (16, 1)],
  term ((139222372092821066577478733701459200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1032654806127254717547145288097587200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (6, 1), (7, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((7593050045053343511376068294835200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (6, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-485834037191205686693312369779641600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (6, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((258163701531813679386786322024396800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (6, 1), (7, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-458400105047043539990641123028222400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (6, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((3367626159055044149496751233382417843200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((612667591223914107297344177236454400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (6, 1), (7, 1), (13, 1), (15, 3), (16, 1)],
  term ((-52412023246312898837137050341446941581502960 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (6, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((2581637015318136793867863220243968000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (6, 1), (7, 1), (13, 2), (15, 4), (16, 1)],
  term ((215279445170090559480 : Rat) / 692956453614176359) [(2, 1), (5, 1), (6, 1), (7, 1), (13, 2), (16, 1)],
  term ((129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (6, 1), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((-610369651028734337705818689181764971591949 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (5, 1), (6, 1), (7, 1), (15, 2), (16, 1)],
  term ((-778476109583625062414556335249203200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (5, 1), (6, 1), (7, 1), (15, 4), (16, 1)],
  term ((6399366818370788709 : Rat) / 1385912907228352718) [(2, 1), (5, 1), (6, 1), (7, 1), (16, 1)],
  term ((2392741860386051317660949145264553582200 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-124689594423356035933488121506542400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 1), (15, 3), (16, 1)],
  term ((-52208389534807899966554525138047200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((166741629986610000 : Rat) / 692956453614176359) [(4, 1), (6, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((398483667050487750 : Rat) / 692956453614176359) [(4, 1), (6, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-956121245529929599387752468504337766400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (6, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((-58576465092935895420021750461658590283600 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (6, 1), (10, 1), (15, 2), (16, 1)],
  term ((244293712003370549631544627149109440000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (6, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((4924029362609188125 : Rat) / 1385912907228352718) [(4, 1), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((-760550990762443999512984918128450496000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (6, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-92855326370671422675340111803800637525825 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-47640465710460000 : Rat) / 692956453614176359) [(4, 1), (6, 1), (11, 2), (16, 1)],
  term ((-11460814755539028040614640180721123966668023 : Rat) / 1349660814810636123005926626071864437583984) [(4, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((1070124977798169189215806627840588838400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (6, 1), (13, 2), (15, 2), (16, 1)],
  term ((990081092115099243 : Rat) / 191160400997014168) [(4, 1), (6, 1), (13, 2), (16, 1)],
  term ((-912661188914932799415581901754140595200 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (6, 1), (13, 3), (15, 1), (16, 1)],
  term ((1589424927923205831922394675246274355762783 : Rat) / 674830407405318061502963313035932218791992) [(4, 1), (6, 1), (15, 2), (16, 1)],
  term ((-1539920450431043081 : Rat) / 692956453614176359) [(4, 1), (6, 1), (16, 1)],
  term ((-41685407496652500 : Rat) / 692956453614176359) [(4, 1), (7, 1), (10, 1), (11, 1), (16, 1)],
  term ((-199241833525243875 : Rat) / 1385912907228352718) [(4, 1), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((239030311382482399846938117126084441600 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (7, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((14644116273233973855005437615414647570900 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-53595523924267500 : Rat) / 692956453614176359) [(4, 1), (7, 1), (11, 1), (12, 1), (16, 1)],
  term ((2516696167861146740878214511876393696000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((519432633909190125 : Rat) / 692956453614176359) [(4, 1), (7, 1), (11, 1), (16, 1)],
  term ((-167461396184942916744996183488534064000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-8447002578246985353 : Rat) / 1385912907228352718) [(4, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((1126491844581746107083349998363272563200 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((613841753329135331856404027305667470575159 : Rat) / 168707601851329515375740828258983054697998) [(4, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((44438594159086527066540587275787166254103 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-67217096630450258565 : Rat) / 22174606515653643488) [(4, 1), (7, 1), (13, 1), (16, 1)],
  term ((-845196730357005302734698020729637748741557 : Rat) / 337415203702659030751481656517966109395996) [(4, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (13, 2), (15, 3), (16, 1)],
  term ((-35023986704047007290410291685978512000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (13, 3), (15, 2), (16, 1)],
  term ((-364938985264381623 : Rat) / 5543651628913410872) [(4, 1), (7, 1), (13, 3), (16, 1)],
  term ((-921683860632815981326586623315224000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (13, 4), (15, 1), (16, 1)],
  term ((442053169902380091864994894331868278599341 : Rat) / 1349660814810636123005926626071864437583984) [(4, 1), (7, 1), (15, 1), (16, 1)],
  term ((69075663604304722221546176848848000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (15, 3), (16, 1)],
  term ((215271046490076175083161936231232000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-205274876882891587215791846321808000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (12, 1), (15, 2), (16, 1)],
  term ((1668846319631735459243040531074369246400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (13, 1), (15, 3), (16, 1)],
  term ((-964600075670260654692524675986963200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (13, 2), (15, 2), (16, 1)],
  term ((-25384212517638438281382228315446400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (13, 3), (15, 1), (16, 1)],
  term ((80743471002140829272124059571408000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (15, 2), (16, 1)],
  term ((346288422606126750 : Rat) / 692956453614176359) [(4, 1), (7, 2), (16, 1)],
  term ((13028997973513095980349046781285836800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((93766382576283600 : Rat) / 692956453614176359) [(4, 1), (9, 1), (13, 1), (16, 1)],
  term ((-52115991894052383921396187125143347200 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-23441595644070900 : Rat) / 692956453614176359) [(4, 1), (9, 1), (15, 1), (16, 1)],
  term ((-41685407496652500 : Rat) / 692956453614176359) [(4, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-2834618561200656128892554035297319381824125 : Rat) / 168707601851329515375740828258983054697998) [(4, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((125026579114242810018883957789833369600 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((-2037934158460538625 : Rat) / 692956453614176359) [(4, 1), (10, 1), (13, 2), (16, 1)],
  term ((912661188914932799415581901754140595200 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (10, 1), (13, 3), (15, 1), (16, 1)],
  term ((343464780975318729321846280552485388952100 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (10, 1), (15, 2), (16, 1)],
  term ((-2218854690464674500 : Rat) / 692956453614176359) [(4, 1), (10, 1), (16, 1)],
  term ((-2745633208724349143532903699150725683200 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((5355408726244540125 : Rat) / 692956453614176359) [(4, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((10525886575055422134028249532193766425600 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-172529461610213251533274973830402497508875 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((577530433824303000316049754988415623862400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-87047137098724874625 : Rat) / 11087303257826821744) [(4, 1), (11, 1), (13, 1), (16, 1)],
  term ((-2767730276673864027886555744770952680606000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 1), (13, 2), (15, 3), (16, 1)],
  term ((-1873555237202040894270972390043191667200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((-595569214217403000 : Rat) / 692956453614176359) [(4, 1), (11, 1), (13, 3), (16, 1)],
  term ((-49304085189527391954499273422189254400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 1), (13, 4), (15, 1), (16, 1)],
  term ((22983476625540815947830396444578102434125 : Rat) / 674830407405318061502963313035932218791992) [(4, 1), (11, 1), (15, 1), (16, 1)],
  term ((613605632661718295632535903365730304000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (15, 3), (16, 1)],
  term ((29775291069037500 : Rat) / 692956453614176359) [(4, 1), (11, 2), (16, 1)],
  term ((15119719874140645852610237208654338966400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3596253723793725129259455659563648101600 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (12, 1), (15, 2), (16, 1)],
  term ((38561230042895013473 : Rat) / 2771825814456705436) [(4, 1), (12, 1), (16, 1)],
  term ((1208068913885209004321638887225660478305957 : Rat) / 674830407405318061502963313035932218791992) [(4, 1), (13, 1), (15, 1), (16, 1)],
  term ((2410417089960027256144107099007007472000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (13, 1), (15, 3), (16, 1)],
  term ((-18947515978693330830835322374732333464000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (13, 2), (15, 2), (16, 1)],
  term ((33835658297308236195 : Rat) / 22174606515653643488) [(4, 1), (13, 2), (16, 1)],
  term ((3112453901783845092120865139131441315200 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (13, 3), (15, 1), (16, 1)],
  term ((1342284320277438151428013537198309998407445 : Rat) / 168707601851329515375740828258983054697998) [(4, 1), (15, 2), (16, 1)],
  term ((-202741532868096961467 : Rat) / 22174606515653643488) [(4, 1), (16, 1)],
  term ((-199241833525243875 : Rat) / 692956453614176359) [(4, 2), (11, 1), (13, 1), (16, 1)],
  term ((478060622764964799693876234252168883200 : Rat) / 84353800925664757687870414129491527348999) [(4, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((12250624020253221857804351804734105470300 : Rat) / 84353800925664757687870414129491527348999) [(4, 2), (11, 1), (15, 1), (16, 1)],
  term ((-29775291069037500 : Rat) / 692956453614176359) [(4, 2), (11, 2), (16, 1)],
  term ((-69611186046410533288739366850729600 : Rat) / 2908751756057405437512772901016949218931) [(4, 2), (13, 1), (15, 1), (16, 1)],
  term ((516327403063627358773572644048793600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-3796525022526671755688034147417600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((242917018595602843346656184889820800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((229200052523521769995320561514111200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((-1683813079527522074748375616691208921600 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-306333795611957053648672088618227200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (13, 1), (15, 3), (16, 1)],
  term ((26206011623156449418568525170723470790751480 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (6, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((-1290818507659068396933931610121984000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (13, 2), (15, 4), (16, 1)],
  term ((-107639722585045279740 : Rat) / 692956453614176359) [(5, 1), (6, 1), (7, 1), (13, 2), (16, 1)],
  term ((-64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((610369651028734337705818689181764971591949 : Rat) / 168707601851329515375740828258983054697998) [(5, 1), (6, 1), (7, 1), (15, 2), (16, 1)],
  term ((389238054791812531207278167624601600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (15, 4), (16, 1)],
  term ((-6399366818370788709 : Rat) / 2771825814456705436) [(5, 1), (6, 1), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 9, terms 600 through 699. -/
theorem ep_Q2_008_block_09_0600_0699_valid :
    checkProductSumEq ep_Q2_008_partials_09_0600_0699
      ep_Q2_008_block_09_0600_0699 = true := by
  native_decide

end EpQ2008TermShards

end Patterns

end EndpointCertificate

end Problem97
