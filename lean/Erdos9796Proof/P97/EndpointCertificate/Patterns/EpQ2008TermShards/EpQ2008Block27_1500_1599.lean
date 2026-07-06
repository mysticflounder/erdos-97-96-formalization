/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_008, term block 27:1500-1599

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_008`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2008TermShards

/-- Generator polynomial 27 for endpoint certificate `ep_Q2_008`. -/
def ep_Q2_008_generator_27_1500_1599 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(14, 1)]
]

/-- Coefficient term 1500 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1500 : Poly :=
[
  term ((6545042846310336289873070186814607339878270 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 1500 for generator 27. -/
def ep_Q2_008_partial_27_1500 : Poly :=
[
  term ((13090085692620672579746140373629214679756540 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-6545042846310336289873070186814607339878270 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1500 for generator 27. -/
theorem ep_Q2_008_partial_27_1500_valid :
    mulPoly ep_Q2_008_coefficient_27_1500
        ep_Q2_008_generator_27_1500_1599 =
      ep_Q2_008_partial_27_1500 := by
  native_decide

/-- Coefficient term 1501 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1501 : Poly :=
[
  term ((-77983809828931669893 : Rat) / 764641603988056672) [(5, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 1501 for generator 27. -/
def ep_Q2_008_partial_27_1501 : Poly :=
[
  term ((-77983809828931669893 : Rat) / 382320801994028336) [(5, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((77983809828931669893 : Rat) / 764641603988056672) [(5, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1501 for generator 27. -/
theorem ep_Q2_008_partial_27_1501_valid :
    mulPoly ep_Q2_008_coefficient_27_1501
        ep_Q2_008_generator_27_1500_1599 =
      ep_Q2_008_partial_27_1501 := by
  native_decide

/-- Coefficient term 1502 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1502 : Poly :=
[
  term ((2248155950298125711975739273981491532060921 : Rat) / 168707601851329515375740828258983054697998) [(5, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 1502 for generator 27. -/
def ep_Q2_008_partial_27_1502 : Poly :=
[
  term ((2248155950298125711975739273981491532060921 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-2248155950298125711975739273981491532060921 : Rat) / 168707601851329515375740828258983054697998) [(5, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1502 for generator 27. -/
theorem ep_Q2_008_partial_27_1502_valid :
    mulPoly ep_Q2_008_coefficient_27_1502
        ep_Q2_008_generator_27_1500_1599 =
      ep_Q2_008_partial_27_1502 := by
  native_decide

/-- Coefficient term 1503 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1503 : Poly :=
[
  term ((242189375816351879415 : Rat) / 692956453614176359) [(5, 1), (12, 1), (13, 3), (16, 1)]
]

/-- Partial product 1503 for generator 27. -/
def ep_Q2_008_partial_27_1503 : Poly :=
[
  term ((484378751632703758830 : Rat) / 692956453614176359) [(5, 1), (12, 1), (13, 3), (14, 1), (16, 1)],
  term ((-242189375816351879415 : Rat) / 692956453614176359) [(5, 1), (12, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1503 for generator 27. -/
theorem ep_Q2_008_partial_27_1503_valid :
    mulPoly ep_Q2_008_coefficient_27_1503
        ep_Q2_008_generator_27_1500_1599 =
      ep_Q2_008_partial_27_1503 := by
  native_decide

/-- Coefficient term 1504 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1504 : Poly :=
[
  term ((16970504645716035909061932009686703361500 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1504 for generator 27. -/
def ep_Q2_008_partial_27_1504 : Poly :=
[
  term ((-16970504645716035909061932009686703361500 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((33941009291432071818123864019373406723000 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (12, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1504 for generator 27. -/
theorem ep_Q2_008_partial_27_1504_valid :
    mulPoly ep_Q2_008_coefficient_27_1504
        ep_Q2_008_generator_27_1500_1599 =
      ep_Q2_008_partial_27_1504 := by
  native_decide

/-- Coefficient term 1505 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1505 : Poly :=
[
  term ((-6281595377600518432142555293809453788514703 : Rat) / 2699321629621272246011853252143728875167968) [(5, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1505 for generator 27. -/
def ep_Q2_008_partial_27_1505 : Poly :=
[
  term ((-6281595377600518432142555293809453788514703 : Rat) / 1349660814810636123005926626071864437583984) [(5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((6281595377600518432142555293809453788514703 : Rat) / 2699321629621272246011853252143728875167968) [(5, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1505 for generator 27. -/
theorem ep_Q2_008_partial_27_1505_valid :
    mulPoly ep_Q2_008_coefficient_27_1505
        ep_Q2_008_generator_27_1500_1599 =
      ep_Q2_008_partial_27_1505 := by
  native_decide

/-- Coefficient term 1506 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1506 : Poly :=
[
  term ((33941009291432071818123864019373406723000 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (12, 1), (15, 3), (16, 1)]
]

/-- Partial product 1506 for generator 27. -/
def ep_Q2_008_partial_27_1506 : Poly :=
[
  term ((67882018582864143636247728038746813446000 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((-33941009291432071818123864019373406723000 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1506 for generator 27. -/
theorem ep_Q2_008_partial_27_1506_valid :
    mulPoly ep_Q2_008_coefficient_27_1506
        ep_Q2_008_generator_27_1500_1599 =
      ep_Q2_008_partial_27_1506 := by
  native_decide

/-- Coefficient term 1507 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1507 : Poly :=
[
  term ((2723816650104925212153710468043271209600 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (12, 2), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 1507 for generator 27. -/
def ep_Q2_008_partial_27_1507 : Poly :=
[
  term ((5447633300209850424307420936086542419200 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (12, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2723816650104925212153710468043271209600 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (12, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1507 for generator 27. -/
theorem ep_Q2_008_partial_27_1507_valid :
    mulPoly ep_Q2_008_coefficient_27_1507
        ep_Q2_008_generator_27_1500_1599 =
      ep_Q2_008_partial_27_1507 := by
  native_decide

/-- Coefficient term 1508 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1508 : Poly :=
[
  term ((900559303502098301175 : Rat) / 11087303257826821744) [(5, 1), (12, 2), (13, 1), (16, 1)]
]

/-- Partial product 1508 for generator 27. -/
def ep_Q2_008_partial_27_1508 : Poly :=
[
  term ((900559303502098301175 : Rat) / 5543651628913410872) [(5, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-900559303502098301175 : Rat) / 11087303257826821744) [(5, 1), (12, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1508 for generator 27. -/
theorem ep_Q2_008_partial_27_1508_valid :
    mulPoly ep_Q2_008_coefficient_27_1508
        ep_Q2_008_generator_27_1500_1599 =
      ep_Q2_008_partial_27_1508 := by
  native_decide

/-- Coefficient term 1509 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1509 : Poly :=
[
  term ((-78044306866101539604042823875760324588800 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (12, 2), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 1509 for generator 27. -/
def ep_Q2_008_partial_27_1509 : Poly :=
[
  term ((-156088613732203079208085647751520649177600 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (12, 2), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((78044306866101539604042823875760324588800 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (12, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1509 for generator 27. -/
theorem ep_Q2_008_partial_27_1509_valid :
    mulPoly ep_Q2_008_coefficient_27_1509
        ep_Q2_008_generator_27_1500_1599 =
      ep_Q2_008_partial_27_1509 := by
  native_decide

/-- Coefficient term 1510 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1510 : Poly :=
[
  term ((-10151457138282586941198389116588087025529447 : Rat) / 674830407405318061502963313035932218791992) [(5, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 1510 for generator 27. -/
def ep_Q2_008_partial_27_1510 : Poly :=
[
  term ((-10151457138282586941198389116588087025529447 : Rat) / 337415203702659030751481656517966109395996) [(5, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((10151457138282586941198389116588087025529447 : Rat) / 674830407405318061502963313035932218791992) [(5, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1510 for generator 27. -/
theorem ep_Q2_008_partial_27_1510_valid :
    mulPoly ep_Q2_008_coefficient_27_1510
        ep_Q2_008_generator_27_1500_1599 =
      ep_Q2_008_partial_27_1510 := by
  native_decide

/-- Coefficient term 1511 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1511 : Poly :=
[
  term ((-33941009291432071818123864019373406723000 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1511 for generator 27. -/
def ep_Q2_008_partial_27_1511 : Poly :=
[
  term ((33941009291432071818123864019373406723000 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-67882018582864143636247728038746813446000 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (13, 1), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1511 for generator 27. -/
theorem ep_Q2_008_partial_27_1511_valid :
    mulPoly ep_Q2_008_coefficient_27_1511
        ep_Q2_008_generator_27_1500_1599 =
      ep_Q2_008_partial_27_1511 := by
  native_decide

/-- Coefficient term 1512 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1512 : Poly :=
[
  term ((338856038629410847841 : Rat) / 22174606515653643488) [(5, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1512 for generator 27. -/
def ep_Q2_008_partial_27_1512 : Poly :=
[
  term ((-338856038629410847841 : Rat) / 22174606515653643488) [(5, 1), (13, 1), (14, 1), (16, 1)],
  term ((338856038629410847841 : Rat) / 11087303257826821744) [(5, 1), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1512 for generator 27. -/
theorem ep_Q2_008_partial_27_1512_valid :
    mulPoly ep_Q2_008_coefficient_27_1512
        ep_Q2_008_generator_27_1500_1599 =
      ep_Q2_008_partial_27_1512 := by
  native_decide

/-- Coefficient term 1513 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1513 : Poly :=
[
  term ((-16970504645716035909061932009686703361500 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 1513 for generator 27. -/
def ep_Q2_008_partial_27_1513 : Poly :=
[
  term ((-33941009291432071818123864019373406723000 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((16970504645716035909061932009686703361500 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1513 for generator 27. -/
theorem ep_Q2_008_partial_27_1513_valid :
    mulPoly ep_Q2_008_coefficient_27_1513
        ep_Q2_008_generator_27_1500_1599 =
      ep_Q2_008_partial_27_1513 := by
  native_decide

/-- Coefficient term 1514 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1514 : Poly :=
[
  term ((475039821108794703569 : Rat) / 44349213031307286976) [(5, 1), (13, 1), (16, 1)]
]

/-- Partial product 1514 for generator 27. -/
def ep_Q2_008_partial_27_1514 : Poly :=
[
  term ((475039821108794703569 : Rat) / 22174606515653643488) [(5, 1), (13, 1), (14, 1), (16, 1)],
  term ((-475039821108794703569 : Rat) / 44349213031307286976) [(5, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1514 for generator 27. -/
theorem ep_Q2_008_partial_27_1514_valid :
    mulPoly ep_Q2_008_coefficient_27_1514
        ep_Q2_008_generator_27_1500_1599 =
      ep_Q2_008_partial_27_1514 := by
  native_decide

/-- Coefficient term 1515 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1515 : Poly :=
[
  term ((-16380677517175113957725927749910084474773275 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1515 for generator 27. -/
def ep_Q2_008_partial_27_1515 : Poly :=
[
  term ((16380677517175113957725927749910084474773275 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-32761355034350227915451855499820168949546550 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (13, 2), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1515 for generator 27. -/
theorem ep_Q2_008_partial_27_1515_valid :
    mulPoly ep_Q2_008_coefficient_27_1515
        ep_Q2_008_generator_27_1500_1599 =
      ep_Q2_008_partial_27_1515 := by
  native_decide

/-- Coefficient term 1516 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1516 : Poly :=
[
  term ((-16380677517175113957725927749910084474773275 : Rat) / 168707601851329515375740828258983054697998) [(5, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 1516 for generator 27. -/
def ep_Q2_008_partial_27_1516 : Poly :=
[
  term ((-16380677517175113957725927749910084474773275 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((16380677517175113957725927749910084474773275 : Rat) / 168707601851329515375740828258983054697998) [(5, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1516 for generator 27. -/
theorem ep_Q2_008_partial_27_1516_valid :
    mulPoly ep_Q2_008_coefficient_27_1516
        ep_Q2_008_generator_27_1500_1599 =
      ep_Q2_008_partial_27_1516 := by
  native_decide

/-- Coefficient term 1517 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1517 : Poly :=
[
  term ((-16145958387756791961 : Rat) / 1385912907228352718) [(5, 1), (13, 3), (14, 1), (16, 1)]
]

/-- Partial product 1517 for generator 27. -/
def ep_Q2_008_partial_27_1517 : Poly :=
[
  term ((16145958387756791961 : Rat) / 1385912907228352718) [(5, 1), (13, 3), (14, 1), (16, 1)],
  term ((-16145958387756791961 : Rat) / 692956453614176359) [(5, 1), (13, 3), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1517 for generator 27. -/
theorem ep_Q2_008_partial_27_1517_valid :
    mulPoly ep_Q2_008_coefficient_27_1517
        ep_Q2_008_generator_27_1500_1599 =
      ep_Q2_008_partial_27_1517 := by
  native_decide

/-- Coefficient term 1518 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1518 : Poly :=
[
  term ((-16145958387756791961 : Rat) / 2771825814456705436) [(5, 1), (13, 3), (16, 1)]
]

/-- Partial product 1518 for generator 27. -/
def ep_Q2_008_partial_27_1518 : Poly :=
[
  term ((-16145958387756791961 : Rat) / 1385912907228352718) [(5, 1), (13, 3), (14, 1), (16, 1)],
  term ((16145958387756791961 : Rat) / 2771825814456705436) [(5, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1518 for generator 27. -/
theorem ep_Q2_008_partial_27_1518_valid :
    mulPoly ep_Q2_008_coefficient_27_1518
        ep_Q2_008_generator_27_1500_1599 =
      ep_Q2_008_partial_27_1518 := by
  native_decide

/-- Coefficient term 1519 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1519 : Poly :=
[
  term ((-6449681742709274572199116378640422814317131 : Rat) / 1349660814810636123005926626071864437583984) [(5, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1519 for generator 27. -/
def ep_Q2_008_partial_27_1519 : Poly :=
[
  term ((6449681742709274572199116378640422814317131 : Rat) / 1349660814810636123005926626071864437583984) [(5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6449681742709274572199116378640422814317131 : Rat) / 674830407405318061502963313035932218791992) [(5, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1519 for generator 27. -/
theorem ep_Q2_008_partial_27_1519_valid :
    mulPoly ep_Q2_008_coefficient_27_1519
        ep_Q2_008_generator_27_1500_1599 =
      ep_Q2_008_partial_27_1519 := by
  native_decide

/-- Coefficient term 1520 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1520 : Poly :=
[
  term ((-5895513658953138937756929042883915776651531 : Rat) / 2699321629621272246011853252143728875167968) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 1520 for generator 27. -/
def ep_Q2_008_partial_27_1520 : Poly :=
[
  term ((-5895513658953138937756929042883915776651531 : Rat) / 1349660814810636123005926626071864437583984) [(5, 1), (14, 1), (15, 1), (16, 1)],
  term ((5895513658953138937756929042883915776651531 : Rat) / 2699321629621272246011853252143728875167968) [(5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1520 for generator 27. -/
theorem ep_Q2_008_partial_27_1520_valid :
    mulPoly ep_Q2_008_coefficient_27_1520
        ep_Q2_008_generator_27_1500_1599 =
      ep_Q2_008_partial_27_1520 := by
  native_decide

/-- Coefficient term 1521 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1521 : Poly :=
[
  term ((32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1521 for generator 27. -/
def ep_Q2_008_partial_27_1521 : Poly :=
[
  term ((64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1521 for generator 27. -/
theorem ep_Q2_008_partial_27_1521_valid :
    mulPoly ep_Q2_008_coefficient_27_1521
        ep_Q2_008_generator_27_1500_1599 =
      ep_Q2_008_partial_27_1521 := by
  native_decide

/-- Coefficient term 1522 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1522 : Poly :=
[
  term ((129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 1522 for generator 27. -/
def ep_Q2_008_partial_27_1522 : Poly :=
[
  term ((258163701531813679386786322024396800 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1522 for generator 27. -/
theorem ep_Q2_008_partial_27_1522_valid :
    mulPoly ep_Q2_008_coefficient_27_1522
        ep_Q2_008_generator_27_1500_1599 =
      ep_Q2_008_partial_27_1522 := by
  native_decide

/-- Coefficient term 1523 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1523 : Poly :=
[
  term ((-2597772246663875148829537365370492800 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 1523 for generator 27. -/
def ep_Q2_008_partial_27_1523 : Poly :=
[
  term ((-5195544493327750297659074730740985600 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((2597772246663875148829537365370492800 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1523 for generator 27. -/
theorem ep_Q2_008_partial_27_1523_valid :
    mulPoly ep_Q2_008_coefficient_27_1523
        ep_Q2_008_generator_27_1500_1599 =
      ep_Q2_008_partial_27_1523 := by
  native_decide

/-- Coefficient term 1524 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1524 : Poly :=
[
  term ((-16135231345738354961674145126524800 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1524 for generator 27. -/
def ep_Q2_008_partial_27_1524 : Poly :=
[
  term ((16135231345738354961674145126524800 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (12, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1524 for generator 27. -/
theorem ep_Q2_008_partial_27_1524_valid :
    mulPoly ep_Q2_008_coefficient_27_1524
        ep_Q2_008_generator_27_1500_1599 =
      ep_Q2_008_partial_27_1524 := by
  native_decide

/-- Coefficient term 1525 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1525 : Poly :=
[
  term ((-7118484417237509541915064026408000 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1525 for generator 27. -/
def ep_Q2_008_partial_27_1525 : Poly :=
[
  term ((-14236968834475019083830128052816000 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((7118484417237509541915064026408000 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1525 for generator 27. -/
theorem ep_Q2_008_partial_27_1525_valid :
    mulPoly ep_Q2_008_coefficient_27_1525
        ep_Q2_008_generator_27_1500_1599 =
      ep_Q2_008_partial_27_1525 := by
  native_decide

/-- Coefficient term 1526 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1526 : Poly :=
[
  term ((-32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (12, 1), (15, 3), (16, 1)]
]

/-- Partial product 1526 for generator 27. -/
def ep_Q2_008_partial_27_1526 : Poly :=
[
  term ((-64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1526 for generator 27. -/
theorem ep_Q2_008_partial_27_1526_valid :
    mulPoly ep_Q2_008_coefficient_27_1526
        ep_Q2_008_generator_27_1500_1599 =
      ep_Q2_008_partial_27_1526 := by
  native_decide

/-- Coefficient term 1527 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1527 : Poly :=
[
  term ((1452170821116451946550673061387232000 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (12, 2), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 1527 for generator 27. -/
def ep_Q2_008_partial_27_1527 : Poly :=
[
  term ((2904341642232903893101346122774464000 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (12, 2), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1452170821116451946550673061387232000 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (12, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1527 for generator 27. -/
theorem ep_Q2_008_partial_27_1527_valid :
    mulPoly ep_Q2_008_coefficient_27_1527
        ep_Q2_008_generator_27_1500_1599 =
      ep_Q2_008_partial_27_1527 := by
  native_decide

/-- Coefficient term 1528 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1528 : Poly :=
[
  term ((-6643918789421675572454059757980800 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 1528 for generator 27. -/
def ep_Q2_008_partial_27_1528 : Poly :=
[
  term ((-13287837578843351144908119515961600 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((6643918789421675572454059757980800 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1528 for generator 27. -/
theorem ep_Q2_008_partial_27_1528_valid :
    mulPoly ep_Q2_008_coefficient_27_1528
        ep_Q2_008_generator_27_1500_1599 =
      ep_Q2_008_partial_27_1528 := by
  native_decide

/-- Coefficient term 1529 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1529 : Poly :=
[
  term ((32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1529 for generator 27. -/
def ep_Q2_008_partial_27_1529 : Poly :=
[
  term ((-32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (13, 1), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1529 for generator 27. -/
theorem ep_Q2_008_partial_27_1529_valid :
    mulPoly ep_Q2_008_coefficient_27_1529
        ep_Q2_008_generator_27_1500_1599 =
      ep_Q2_008_partial_27_1529 := by
  native_decide

/-- Coefficient term 1530 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1530 : Poly :=
[
  term ((16135231345738354961674145126524800 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 1530 for generator 27. -/
def ep_Q2_008_partial_27_1530 : Poly :=
[
  term ((32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-16135231345738354961674145126524800 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1530 for generator 27. -/
theorem ep_Q2_008_partial_27_1530_valid :
    mulPoly ep_Q2_008_coefficient_27_1530
        ep_Q2_008_generator_27_1500_1599 =
      ep_Q2_008_partial_27_1530 := by
  native_decide

/-- Coefficient term 1531 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1531 : Poly :=
[
  term ((8067615672869177480837072563262400 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1531 for generator 27. -/
def ep_Q2_008_partial_27_1531 : Poly :=
[
  term ((-8067615672869177480837072563262400 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((16135231345738354961674145126524800 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1531 for generator 27. -/
theorem ep_Q2_008_partial_27_1531_valid :
    mulPoly ep_Q2_008_coefficient_27_1531
        ep_Q2_008_generator_27_1500_1599 =
      ep_Q2_008_partial_27_1531 := by
  native_decide

/-- Coefficient term 1532 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1532 : Poly :=
[
  term ((4033807836434588740418536281631200 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 1532 for generator 27. -/
def ep_Q2_008_partial_27_1532 : Poly :=
[
  term ((8067615672869177480837072563262400 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4033807836434588740418536281631200 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1532 for generator 27. -/
theorem ep_Q2_008_partial_27_1532_valid :
    mulPoly ep_Q2_008_coefficient_27_1532
        ep_Q2_008_generator_27_1500_1599 =
      ep_Q2_008_partial_27_1532 := by
  native_decide

/-- Coefficient term 1533 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1533 : Poly :=
[
  term ((5381986129252263987 : Rat) / 692956453614176359) [(5, 2), (10, 1), (12, 1), (16, 1)]
]

/-- Partial product 1533 for generator 27. -/
def ep_Q2_008_partial_27_1533 : Poly :=
[
  term ((10763972258504527974 : Rat) / 692956453614176359) [(5, 2), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-5381986129252263987 : Rat) / 692956453614176359) [(5, 2), (10, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1533 for generator 27. -/
theorem ep_Q2_008_partial_27_1533_valid :
    mulPoly ep_Q2_008_coefficient_27_1533
        ep_Q2_008_generator_27_1500_1599 =
      ep_Q2_008_partial_27_1533 := by
  native_decide

/-- Coefficient term 1534 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1534 : Poly :=
[
  term ((21527944517009055948 : Rat) / 692956453614176359) [(5, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1534 for generator 27. -/
def ep_Q2_008_partial_27_1534 : Poly :=
[
  term ((43055889034018111896 : Rat) / 692956453614176359) [(5, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-21527944517009055948 : Rat) / 692956453614176359) [(5, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1534 for generator 27. -/
theorem ep_Q2_008_partial_27_1534_valid :
    mulPoly ep_Q2_008_coefficient_27_1534
        ep_Q2_008_generator_27_1500_1599 =
      ep_Q2_008_partial_27_1534 := by
  native_decide

/-- Coefficient term 1535 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1535 : Poly :=
[
  term ((-866499766809614501907 : Rat) / 1385912907228352718) [(5, 2), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 1535 for generator 27. -/
def ep_Q2_008_partial_27_1535 : Poly :=
[
  term ((-866499766809614501907 : Rat) / 692956453614176359) [(5, 2), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((866499766809614501907 : Rat) / 1385912907228352718) [(5, 2), (12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1535 for generator 27. -/
theorem ep_Q2_008_partial_27_1535_valid :
    mulPoly ep_Q2_008_coefficient_27_1535
        ep_Q2_008_generator_27_1500_1599 =
      ep_Q2_008_partial_27_1535 := by
  native_decide

/-- Coefficient term 1536 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1536 : Poly :=
[
  term ((-5381986129252263987 : Rat) / 1385912907228352718) [(5, 2), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 1536 for generator 27. -/
def ep_Q2_008_partial_27_1536 : Poly :=
[
  term ((5381986129252263987 : Rat) / 1385912907228352718) [(5, 2), (12, 1), (14, 1), (16, 1)],
  term ((-5381986129252263987 : Rat) / 692956453614176359) [(5, 2), (12, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1536 for generator 27. -/
theorem ep_Q2_008_partial_27_1536_valid :
    mulPoly ep_Q2_008_coefficient_27_1536
        ep_Q2_008_generator_27_1500_1599 =
      ep_Q2_008_partial_27_1536 := by
  native_decide

/-- Coefficient term 1537 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1537 : Poly :=
[
  term ((-5381986129252263987 : Rat) / 692956453614176359) [(5, 2), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1537 for generator 27. -/
def ep_Q2_008_partial_27_1537 : Poly :=
[
  term ((-10763972258504527974 : Rat) / 692956453614176359) [(5, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((5381986129252263987 : Rat) / 692956453614176359) [(5, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1537 for generator 27. -/
theorem ep_Q2_008_partial_27_1537_valid :
    mulPoly ep_Q2_008_coefficient_27_1537
        ep_Q2_008_generator_27_1500_1599 =
      ep_Q2_008_partial_27_1537 := by
  native_decide

/-- Coefficient term 1538 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1538 : Poly :=
[
  term ((-25071065639731408545 : Rat) / 22174606515653643488) [(5, 2), (12, 1), (16, 1)]
]

/-- Partial product 1538 for generator 27. -/
def ep_Q2_008_partial_27_1538 : Poly :=
[
  term ((-25071065639731408545 : Rat) / 11087303257826821744) [(5, 2), (12, 1), (14, 1), (16, 1)],
  term ((25071065639731408545 : Rat) / 22174606515653643488) [(5, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1538 for generator 27. -/
theorem ep_Q2_008_partial_27_1538_valid :
    mulPoly ep_Q2_008_coefficient_27_1538
        ep_Q2_008_generator_27_1500_1599 =
      ep_Q2_008_partial_27_1538 := by
  native_decide

/-- Coefficient term 1539 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1539 : Poly :=
[
  term ((242189375816351879415 : Rat) / 692956453614176359) [(5, 2), (12, 2), (13, 2), (16, 1)]
]

/-- Partial product 1539 for generator 27. -/
def ep_Q2_008_partial_27_1539 : Poly :=
[
  term ((484378751632703758830 : Rat) / 692956453614176359) [(5, 2), (12, 2), (13, 2), (14, 1), (16, 1)],
  term ((-242189375816351879415 : Rat) / 692956453614176359) [(5, 2), (12, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1539 for generator 27. -/
theorem ep_Q2_008_partial_27_1539_valid :
    mulPoly ep_Q2_008_coefficient_27_1539
        ep_Q2_008_generator_27_1500_1599 =
      ep_Q2_008_partial_27_1539 := by
  native_decide

/-- Coefficient term 1540 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1540 : Poly :=
[
  term ((-40983859916519688411 : Rat) / 11087303257826821744) [(5, 2), (12, 2), (16, 1)]
]

/-- Partial product 1540 for generator 27. -/
def ep_Q2_008_partial_27_1540 : Poly :=
[
  term ((-40983859916519688411 : Rat) / 5543651628913410872) [(5, 2), (12, 2), (14, 1), (16, 1)],
  term ((40983859916519688411 : Rat) / 11087303257826821744) [(5, 2), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1540 for generator 27. -/
theorem ep_Q2_008_partial_27_1540_valid :
    mulPoly ep_Q2_008_coefficient_27_1540
        ep_Q2_008_generator_27_1500_1599 =
      ep_Q2_008_partial_27_1540 := by
  native_decide

/-- Coefficient term 1541 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1541 : Poly :=
[
  term ((656828614157898419643744992101003283079507 : Rat) / 84353800925664757687870414129491527348999) [(5, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1541 for generator 27. -/
def ep_Q2_008_partial_27_1541 : Poly :=
[
  term ((-656828614157898419643744992101003283079507 : Rat) / 84353800925664757687870414129491527348999) [(5, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1313657228315796839287489984202006566159014 : Rat) / 84353800925664757687870414129491527348999) [(5, 2), (13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1541 for generator 27. -/
theorem ep_Q2_008_partial_27_1541_valid :
    mulPoly ep_Q2_008_coefficient_27_1541
        ep_Q2_008_generator_27_1500_1599 =
      ep_Q2_008_partial_27_1541 := by
  native_decide

/-- Coefficient term 1542 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1542 : Poly :=
[
  term ((656828614157898419643744992101003283079507 : Rat) / 168707601851329515375740828258983054697998) [(5, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1542 for generator 27. -/
def ep_Q2_008_partial_27_1542 : Poly :=
[
  term ((656828614157898419643744992101003283079507 : Rat) / 84353800925664757687870414129491527348999) [(5, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-656828614157898419643744992101003283079507 : Rat) / 168707601851329515375740828258983054697998) [(5, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1542 for generator 27. -/
theorem ep_Q2_008_partial_27_1542_valid :
    mulPoly ep_Q2_008_coefficient_27_1542
        ep_Q2_008_generator_27_1500_1599 =
      ep_Q2_008_partial_27_1542 := by
  native_decide

/-- Coefficient term 1543 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1543 : Poly :=
[
  term ((6767139819676770987 : Rat) / 2771825814456705436) [(5, 2), (14, 1), (16, 1)]
]

/-- Partial product 1543 for generator 27. -/
def ep_Q2_008_partial_27_1543 : Poly :=
[
  term ((-6767139819676770987 : Rat) / 2771825814456705436) [(5, 2), (14, 1), (16, 1)],
  term ((6767139819676770987 : Rat) / 1385912907228352718) [(5, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1543 for generator 27. -/
theorem ep_Q2_008_partial_27_1543_valid :
    mulPoly ep_Q2_008_coefficient_27_1543
        ep_Q2_008_generator_27_1500_1599 =
      ep_Q2_008_partial_27_1543 := by
  native_decide

/-- Coefficient term 1544 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1544 : Poly :=
[
  term ((6767139819676770987 : Rat) / 5543651628913410872) [(5, 2), (16, 1)]
]

/-- Partial product 1544 for generator 27. -/
def ep_Q2_008_partial_27_1544 : Poly :=
[
  term ((6767139819676770987 : Rat) / 2771825814456705436) [(5, 2), (14, 1), (16, 1)],
  term ((-6767139819676770987 : Rat) / 5543651628913410872) [(5, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1544 for generator 27. -/
theorem ep_Q2_008_partial_27_1544_valid :
    mulPoly ep_Q2_008_coefficient_27_1544
        ep_Q2_008_generator_27_1500_1599 =
      ep_Q2_008_partial_27_1544 := by
  native_decide

/-- Coefficient term 1545 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1545 : Poly :=
[
  term ((8489530989603972000 : Rat) / 692956453614176359) [(6, 1), (7, 1), (10, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1545 for generator 27. -/
def ep_Q2_008_partial_27_1545 : Poly :=
[
  term ((-8489530989603972000 : Rat) / 692956453614176359) [(6, 1), (7, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((16979061979207944000 : Rat) / 692956453614176359) [(6, 1), (7, 1), (10, 1), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1545 for generator 27. -/
theorem ep_Q2_008_partial_27_1545_valid :
    mulPoly ep_Q2_008_coefficient_27_1545
        ep_Q2_008_generator_27_1500_1599 =
      ep_Q2_008_partial_27_1545 := by
  native_decide

/-- Coefficient term 1546 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1546 : Poly :=
[
  term ((4244765494801986000 : Rat) / 692956453614176359) [(6, 1), (7, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 1546 for generator 27. -/
def ep_Q2_008_partial_27_1546 : Poly :=
[
  term ((8489530989603972000 : Rat) / 692956453614176359) [(6, 1), (7, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-4244765494801986000 : Rat) / 692956453614176359) [(6, 1), (7, 1), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1546 for generator 27. -/
theorem ep_Q2_008_partial_27_1546_valid :
    mulPoly ep_Q2_008_coefficient_27_1546
        ep_Q2_008_generator_27_1500_1599 =
      ep_Q2_008_partial_27_1546 := by
  native_decide

/-- Coefficient term 1547 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1547 : Poly :=
[
  term ((-21813405123651604351406039090813201634600 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (7, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 1547 for generator 27. -/
def ep_Q2_008_partial_27_1547 : Poly :=
[
  term ((-43626810247303208702812078181626403269200 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((21813405123651604351406039090813201634600 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (7, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1547 for generator 27. -/
theorem ep_Q2_008_partial_27_1547_valid :
    mulPoly ep_Q2_008_coefficient_27_1547
        ep_Q2_008_generator_27_1500_1599 =
      ep_Q2_008_partial_27_1547 := by
  native_decide

/-- Coefficient term 1548 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1548 : Poly :=
[
  term ((4097778927515857893794044667679356716800 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (7, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1548 for generator 27. -/
def ep_Q2_008_partial_27_1548 : Poly :=
[
  term ((-4097778927515857893794044667679356716800 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (7, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((8195557855031715787588089335358713433600 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (7, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1548 for generator 27. -/
theorem ep_Q2_008_partial_27_1548_valid :
    mulPoly ep_Q2_008_coefficient_27_1548
        ep_Q2_008_generator_27_1500_1599 =
      ep_Q2_008_partial_27_1548 := by
  native_decide

/-- Coefficient term 1549 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1549 : Poly :=
[
  term ((2046265822635978600117772390241633174400 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1549 for generator 27. -/
def ep_Q2_008_partial_27_1549 : Poly :=
[
  term ((4092531645271957200235544780483266348800 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (7, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2046265822635978600117772390241633174400 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1549 for generator 27. -/
theorem ep_Q2_008_partial_27_1549_valid :
    mulPoly ep_Q2_008_coefficient_27_1549
        ep_Q2_008_generator_27_1500_1599 =
      ep_Q2_008_partial_27_1549 := by
  native_decide

/-- Coefficient term 1550 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1550 : Poly :=
[
  term ((23822768568696120000 : Rat) / 692956453614176359) [(6, 1), (7, 1), (11, 1), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 1550 for generator 27. -/
def ep_Q2_008_partial_27_1550 : Poly :=
[
  term ((-23822768568696120000 : Rat) / 692956453614176359) [(6, 1), (7, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((47645537137392240000 : Rat) / 692956453614176359) [(6, 1), (7, 1), (11, 1), (13, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1550 for generator 27. -/
theorem ep_Q2_008_partial_27_1550_valid :
    mulPoly ep_Q2_008_coefficient_27_1550
        ep_Q2_008_generator_27_1500_1599 =
      ep_Q2_008_partial_27_1550 := by
  native_decide

/-- Coefficient term 1551 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1551 : Poly :=
[
  term ((13006201240141204869 : Rat) / 692956453614176359) [(6, 1), (7, 1), (11, 1), (13, 2), (16, 1)]
]

/-- Partial product 1551 for generator 27. -/
def ep_Q2_008_partial_27_1551 : Poly :=
[
  term ((26012402480282409738 : Rat) / 692956453614176359) [(6, 1), (7, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-13006201240141204869 : Rat) / 692956453614176359) [(6, 1), (7, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1551 for generator 27. -/
theorem ep_Q2_008_partial_27_1551_valid :
    mulPoly ep_Q2_008_coefficient_27_1551
        ep_Q2_008_generator_27_1500_1599 =
      ep_Q2_008_partial_27_1551 := by
  native_decide

/-- Coefficient term 1552 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1552 : Poly :=
[
  term ((1972163407581095678179970936887570176000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (11, 1), (13, 3), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1552 for generator 27. -/
def ep_Q2_008_partial_27_1552 : Poly :=
[
  term ((-1972163407581095678179970936887570176000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (11, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((3944326815162191356359941873775140352000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (11, 1), (13, 3), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1552 for generator 27. -/
theorem ep_Q2_008_partial_27_1552_valid :
    mulPoly ep_Q2_008_coefficient_27_1552
        ep_Q2_008_generator_27_1500_1599 =
      ep_Q2_008_partial_27_1552 := by
  native_decide

/-- Coefficient term 1553 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1553 : Poly :=
[
  term ((1008202116445735422641823547403350464000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 1553 for generator 27. -/
def ep_Q2_008_partial_27_1553 : Poly :=
[
  term ((2016404232891470845283647094806700928000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (11, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-1008202116445735422641823547403350464000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1553 for generator 27. -/
theorem ep_Q2_008_partial_27_1553_valid :
    mulPoly ep_Q2_008_coefficient_27_1553
        ep_Q2_008_generator_27_1500_1599 =
      ep_Q2_008_partial_27_1553 := by
  native_decide

/-- Coefficient term 1554 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1554 : Poly :=
[
  term ((-25891905370046625 : Rat) / 1385912907228352718) [(6, 1), (7, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 1554 for generator 27. -/
def ep_Q2_008_partial_27_1554 : Poly :=
[
  term ((25891905370046625 : Rat) / 1385912907228352718) [(6, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-25891905370046625 : Rat) / 692956453614176359) [(6, 1), (7, 1), (11, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1554 for generator 27. -/
theorem ep_Q2_008_partial_27_1554_valid :
    mulPoly ep_Q2_008_coefficient_27_1554
        ep_Q2_008_generator_27_1500_1599 =
      ep_Q2_008_partial_27_1554 := by
  native_decide

/-- Coefficient term 1555 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1555 : Poly :=
[
  term ((154506451847614710653027389690915200 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 1555 for generator 27. -/
def ep_Q2_008_partial_27_1555 : Poly :=
[
  term ((309012903695229421306054779381830400 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-154506451847614710653027389690915200 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1555 for generator 27. -/
theorem ep_Q2_008_partial_27_1555_valid :
    mulPoly ep_Q2_008_coefficient_27_1555
        ep_Q2_008_generator_27_1500_1599 =
      ep_Q2_008_partial_27_1555 := by
  native_decide

/-- Coefficient term 1556 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1556 : Poly :=
[
  term ((18472788757426887099 : Rat) / 2771825814456705436) [(6, 1), (7, 1), (11, 1), (16, 1)]
]

/-- Partial product 1556 for generator 27. -/
def ep_Q2_008_partial_27_1556 : Poly :=
[
  term ((18472788757426887099 : Rat) / 1385912907228352718) [(6, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-18472788757426887099 : Rat) / 2771825814456705436) [(6, 1), (7, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1556 for generator 27. -/
theorem ep_Q2_008_partial_27_1556_valid :
    mulPoly ep_Q2_008_coefficient_27_1556
        ep_Q2_008_generator_27_1500_1599 =
      ep_Q2_008_partial_27_1556 := by
  native_decide

/-- Coefficient term 1557 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1557 : Poly :=
[
  term ((-1026292485381761586481392675316852800 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 1557 for generator 27. -/
def ep_Q2_008_partial_27_1557 : Poly :=
[
  term ((-2052584970763523172962785350633705600 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((1026292485381761586481392675316852800 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1557 for generator 27. -/
theorem ep_Q2_008_partial_27_1557_valid :
    mulPoly ep_Q2_008_coefficient_27_1557
        ep_Q2_008_generator_27_1500_1599 =
      ep_Q2_008_partial_27_1557 := by
  native_decide

/-- Coefficient term 1558 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1558 : Poly :=
[
  term ((-3284450867379434607 : Rat) / 1385912907228352718) [(6, 1), (7, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 1558 for generator 27. -/
def ep_Q2_008_partial_27_1558 : Poly :=
[
  term ((-3284450867379434607 : Rat) / 692956453614176359) [(6, 1), (7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((3284450867379434607 : Rat) / 1385912907228352718) [(6, 1), (7, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1558 for generator 27. -/
theorem ep_Q2_008_partial_27_1558_valid :
    mulPoly ep_Q2_008_coefficient_27_1558
        ep_Q2_008_generator_27_1500_1599 =
      ep_Q2_008_partial_27_1558 := by
  native_decide

/-- Coefficient term 1559 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1559 : Poly :=
[
  term ((43461365697970598625147001454104498434903 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 1559 for generator 27. -/
def ep_Q2_008_partial_27_1559 : Poly :=
[
  term ((86922731395941197250294002908208996869806 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (7, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-43461365697970598625147001454104498434903 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1559 for generator 27. -/
theorem ep_Q2_008_partial_27_1559_valid :
    mulPoly ep_Q2_008_coefficient_27_1559
        ep_Q2_008_generator_27_1500_1599 =
      ep_Q2_008_partial_27_1559 := by
  native_decide

/-- Coefficient term 1560 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1560 : Poly :=
[
  term ((7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (12, 1), (13, 3), (15, 2), (16, 1)]
]

/-- Partial product 1560 for generator 27. -/
def ep_Q2_008_partial_27_1560 : Poly :=
[
  term ((14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (12, 1), (13, 3), (14, 1), (15, 2), (16, 1)],
  term ((-7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (12, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1560 for generator 27. -/
theorem ep_Q2_008_partial_27_1560_valid :
    mulPoly ep_Q2_008_coefficient_27_1560
        ep_Q2_008_generator_27_1500_1599 =
      ep_Q2_008_partial_27_1560 := by
  native_decide

/-- Coefficient term 1561 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1561 : Poly :=
[
  term ((360474911944990473083888883476786948236893 : Rat) / 168707601851329515375740828258983054697998) [(6, 1), (7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1561 for generator 27. -/
def ep_Q2_008_partial_27_1561 : Poly :=
[
  term ((360474911944990473083888883476786948236893 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-360474911944990473083888883476786948236893 : Rat) / 168707601851329515375740828258983054697998) [(6, 1), (7, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1561 for generator 27. -/
theorem ep_Q2_008_partial_27_1561_valid :
    mulPoly ep_Q2_008_coefficient_27_1561
        ep_Q2_008_generator_27_1500_1599 =
      ep_Q2_008_partial_27_1561 := by
  native_decide

/-- Coefficient term 1562 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1562 : Poly :=
[
  term ((38626612961903677663256847422728800 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (12, 1), (15, 3), (16, 1)]
]

/-- Partial product 1562 for generator 27. -/
def ep_Q2_008_partial_27_1562 : Poly :=
[
  term ((77253225923807355326513694845457600 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((-38626612961903677663256847422728800 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1562 for generator 27. -/
theorem ep_Q2_008_partial_27_1562_valid :
    mulPoly ep_Q2_008_coefficient_27_1562
        ep_Q2_008_generator_27_1500_1599 =
      ep_Q2_008_partial_27_1562 := by
  native_decide

/-- Coefficient term 1563 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1563 : Poly :=
[
  term ((-786741741410890208442934465149055200 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1563 for generator 27. -/
def ep_Q2_008_partial_27_1563 : Poly :=
[
  term ((786741741410890208442934465149055200 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1573483482821780416885868930298110400 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (13, 1), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1563 for generator 27. -/
theorem ep_Q2_008_partial_27_1563_valid :
    mulPoly ep_Q2_008_coefficient_27_1563
        ep_Q2_008_generator_27_1500_1599 =
      ep_Q2_008_partial_27_1563 := by
  native_decide

/-- Coefficient term 1564 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1564 : Poly :=
[
  term ((-25833040376012974203 : Rat) / 2771825814456705436) [(6, 1), (7, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1564 for generator 27. -/
def ep_Q2_008_partial_27_1564 : Poly :=
[
  term ((25833040376012974203 : Rat) / 2771825814456705436) [(6, 1), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-25833040376012974203 : Rat) / 1385912907228352718) [(6, 1), (7, 1), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1564 for generator 27. -/
theorem ep_Q2_008_partial_27_1564_valid :
    mulPoly ep_Q2_008_coefficient_27_1564
        ep_Q2_008_generator_27_1500_1599 =
      ep_Q2_008_partial_27_1564 := by
  native_decide

/-- Coefficient term 1565 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1565 : Poly :=
[
  term ((-547877322553059814874494622265442800 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 1565 for generator 27. -/
def ep_Q2_008_partial_27_1565 : Poly :=
[
  term ((-1095754645106119629748989244530885600 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((547877322553059814874494622265442800 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1565 for generator 27. -/
theorem ep_Q2_008_partial_27_1565_valid :
    mulPoly ep_Q2_008_coefficient_27_1565
        ep_Q2_008_generator_27_1500_1599 =
      ep_Q2_008_partial_27_1565 := by
  native_decide

/-- Coefficient term 1566 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1566 : Poly :=
[
  term ((-25833040376012974203 : Rat) / 5543651628913410872) [(6, 1), (7, 1), (13, 1), (16, 1)]
]

/-- Partial product 1566 for generator 27. -/
def ep_Q2_008_partial_27_1566 : Poly :=
[
  term ((-25833040376012974203 : Rat) / 2771825814456705436) [(6, 1), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((25833040376012974203 : Rat) / 5543651628913410872) [(6, 1), (7, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1566 for generator 27. -/
theorem ep_Q2_008_partial_27_1566_valid :
    mulPoly ep_Q2_008_coefficient_27_1566
        ep_Q2_008_generator_27_1500_1599 =
      ep_Q2_008_partial_27_1566 := by
  native_decide

/-- Coefficient term 1567 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1567 : Poly :=
[
  term ((-187119964847179592806895376474361902334515 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (7, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1567 for generator 27. -/
def ep_Q2_008_partial_27_1567 : Poly :=
[
  term ((187119964847179592806895376474361902334515 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (7, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-374239929694359185613790752948723804669030 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (7, 1), (13, 2), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1567 for generator 27. -/
theorem ep_Q2_008_partial_27_1567_valid :
    mulPoly ep_Q2_008_coefficient_27_1567
        ep_Q2_008_generator_27_1500_1599 =
      ep_Q2_008_partial_27_1567 := by
  native_decide

/-- Coefficient term 1568 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1568 : Poly :=
[
  term ((-187119257401091352624103114435998858008115 : Rat) / 168707601851329515375740828258983054697998) [(6, 1), (7, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 1568 for generator 27. -/
def ep_Q2_008_partial_27_1568 : Poly :=
[
  term ((-187119257401091352624103114435998858008115 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (7, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((187119257401091352624103114435998858008115 : Rat) / 168707601851329515375740828258983054697998) [(6, 1), (7, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1568 for generator 27. -/
theorem ep_Q2_008_partial_27_1568_valid :
    mulPoly ep_Q2_008_coefficient_27_1568
        ep_Q2_008_generator_27_1500_1599 =
      ep_Q2_008_partial_27_1568 := by
  native_decide

/-- Coefficient term 1569 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1569 : Poly :=
[
  term ((-36867354425312639253063464932608960000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (13, 3), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1569 for generator 27. -/
def ep_Q2_008_partial_27_1569 : Poly :=
[
  term ((36867354425312639253063464932608960000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (13, 3), (14, 1), (15, 2), (16, 1)],
  term ((-73734708850625278506126929865217920000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (13, 3), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1569 for generator 27. -/
theorem ep_Q2_008_partial_27_1569_valid :
    mulPoly ep_Q2_008_coefficient_27_1569
        ep_Q2_008_generator_27_1500_1599 =
      ep_Q2_008_partial_27_1569 := by
  native_decide

/-- Coefficient term 1570 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1570 : Poly :=
[
  term ((-364938985264381623 : Rat) / 692956453614176359) [(6, 1), (7, 1), (13, 3), (14, 1), (16, 1)]
]

/-- Partial product 1570 for generator 27. -/
def ep_Q2_008_partial_27_1570 : Poly :=
[
  term ((364938985264381623 : Rat) / 692956453614176359) [(6, 1), (7, 1), (13, 3), (14, 1), (16, 1)],
  term ((-729877970528763246 : Rat) / 692956453614176359) [(6, 1), (7, 1), (13, 3), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1570 for generator 27. -/
theorem ep_Q2_008_partial_27_1570_valid :
    mulPoly ep_Q2_008_coefficient_27_1570
        ep_Q2_008_generator_27_1500_1599 =
      ep_Q2_008_partial_27_1570 := by
  native_decide

/-- Coefficient term 1571 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1571 : Poly :=
[
  term ((-18433677212656319626531732466304480000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (13, 3), (15, 2), (16, 1)]
]

/-- Partial product 1571 for generator 27. -/
def ep_Q2_008_partial_27_1571 : Poly :=
[
  term ((-36867354425312639253063464932608960000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (13, 3), (14, 1), (15, 2), (16, 1)],
  term ((18433677212656319626531732466304480000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1571 for generator 27. -/
theorem ep_Q2_008_partial_27_1571_valid :
    mulPoly ep_Q2_008_coefficient_27_1571
        ep_Q2_008_generator_27_1500_1599 =
      ep_Q2_008_partial_27_1571 := by
  native_decide

/-- Coefficient term 1572 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1572 : Poly :=
[
  term ((-364938985264381623 : Rat) / 1385912907228352718) [(6, 1), (7, 1), (13, 3), (16, 1)]
]

/-- Partial product 1572 for generator 27. -/
def ep_Q2_008_partial_27_1572 : Poly :=
[
  term ((-364938985264381623 : Rat) / 692956453614176359) [(6, 1), (7, 1), (13, 3), (14, 1), (16, 1)],
  term ((364938985264381623 : Rat) / 1385912907228352718) [(6, 1), (7, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1572 for generator 27. -/
theorem ep_Q2_008_partial_27_1572_valid :
    mulPoly ep_Q2_008_coefficient_27_1572
        ep_Q2_008_generator_27_1500_1599 =
      ep_Q2_008_partial_27_1572 := by
  native_decide

/-- Coefficient term 1573 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1573 : Poly :=
[
  term ((-7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (13, 4), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1573 for generator 27. -/
def ep_Q2_008_partial_27_1573 : Poly :=
[
  term ((7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (13, 4), (14, 1), (15, 1), (16, 1)],
  term ((-14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (13, 4), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1573 for generator 27. -/
theorem ep_Q2_008_partial_27_1573_valid :
    mulPoly ep_Q2_008_coefficient_27_1573
        ep_Q2_008_generator_27_1500_1599 =
      ep_Q2_008_partial_27_1573 := by
  native_decide

/-- Coefficient term 1574 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1574 : Poly :=
[
  term ((-3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (13, 4), (15, 1), (16, 1)]
]

/-- Partial product 1574 for generator 27. -/
def ep_Q2_008_partial_27_1574 : Poly :=
[
  term ((-7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (13, 4), (14, 1), (15, 1), (16, 1)],
  term ((3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (13, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1574 for generator 27. -/
theorem ep_Q2_008_partial_27_1574_valid :
    mulPoly ep_Q2_008_coefficient_27_1574
        ep_Q2_008_generator_27_1500_1599 =
      ep_Q2_008_partial_27_1574 := by
  native_decide

/-- Coefficient term 1575 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1575 : Poly :=
[
  term ((-277934770353741138318376147394573063836789 : Rat) / 337415203702659030751481656517966109395996) [(6, 1), (7, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1575 for generator 27. -/
def ep_Q2_008_partial_27_1575 : Poly :=
[
  term ((277934770353741138318376147394573063836789 : Rat) / 337415203702659030751481656517966109395996) [(6, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-277934770353741138318376147394573063836789 : Rat) / 168707601851329515375740828258983054697998) [(6, 1), (7, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1575 for generator 27. -/
theorem ep_Q2_008_partial_27_1575_valid :
    mulPoly ep_Q2_008_coefficient_27_1575
        ep_Q2_008_generator_27_1500_1599 =
      ep_Q2_008_partial_27_1575 := by
  native_decide

/-- Coefficient term 1576 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1576 : Poly :=
[
  term ((-277934770353741138318376147394573063836789 : Rat) / 674830407405318061502963313035932218791992) [(6, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 1576 for generator 27. -/
def ep_Q2_008_partial_27_1576 : Poly :=
[
  term ((-277934770353741138318376147394573063836789 : Rat) / 337415203702659030751481656517966109395996) [(6, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((277934770353741138318376147394573063836789 : Rat) / 674830407405318061502963313035932218791992) [(6, 1), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1576 for generator 27. -/
theorem ep_Q2_008_partial_27_1576_valid :
    mulPoly ep_Q2_008_coefficient_27_1576
        ep_Q2_008_generator_27_1500_1599 =
      ep_Q2_008_partial_27_1576 := by
  native_decide

/-- Coefficient term 1577 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1577 : Poly :=
[
  term ((609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (11, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 1577 for generator 27. -/
def ep_Q2_008_partial_27_1577 : Poly :=
[
  term ((1218442200846645037506346959141427200 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1577 for generator 27. -/
theorem ep_Q2_008_partial_27_1577_valid :
    mulPoly ep_Q2_008_coefficient_27_1577
        ep_Q2_008_generator_27_1500_1599 =
      ep_Q2_008_partial_27_1577 := by
  native_decide

/-- Coefficient term 1578 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1578 : Poly :=
[
  term ((43336929246501263764396389789139200 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 1578 for generator 27. -/
def ep_Q2_008_partial_27_1578 : Poly :=
[
  term ((86673858493002527528792779578278400 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-43336929246501263764396389789139200 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1578 for generator 27. -/
theorem ep_Q2_008_partial_27_1578_valid :
    mulPoly ep_Q2_008_coefficient_27_1578
        ep_Q2_008_generator_27_1500_1599 =
      ep_Q2_008_partial_27_1578 := by
  native_decide

/-- Coefficient term 1579 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1579 : Poly :=
[
  term ((-913831650634983778129760219356070400 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1579 for generator 27. -/
def ep_Q2_008_partial_27_1579 : Poly :=
[
  term ((-1827663301269967556259520438712140800 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((913831650634983778129760219356070400 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1579 for generator 27. -/
theorem ep_Q2_008_partial_27_1579_valid :
    mulPoly ep_Q2_008_coefficient_27_1579
        ep_Q2_008_generator_27_1500_1599 =
      ep_Q2_008_partial_27_1579 := by
  native_decide

/-- Coefficient term 1580 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1580 : Poly :=
[
  term ((203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (12, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 1580 for generator 27. -/
def ep_Q2_008_partial_27_1580 : Poly :=
[
  term ((406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (12, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (12, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1580 for generator 27. -/
theorem ep_Q2_008_partial_27_1580_valid :
    mulPoly ep_Q2_008_coefficient_27_1580
        ep_Q2_008_generator_27_1500_1599 =
      ep_Q2_008_partial_27_1580 := by
  native_decide

/-- Coefficient term 1581 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1581 : Poly :=
[
  term ((-19399973608017496453710841157548800 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1581 for generator 27. -/
def ep_Q2_008_partial_27_1581 : Poly :=
[
  term ((-38799947216034992907421682315097600 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((19399973608017496453710841157548800 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1581 for generator 27. -/
theorem ep_Q2_008_partial_27_1581_valid :
    mulPoly ep_Q2_008_coefficient_27_1581
        ep_Q2_008_generator_27_1500_1599 =
      ep_Q2_008_partial_27_1581 := by
  native_decide

/-- Coefficient term 1582 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1582 : Poly :=
[
  term ((1038280035578480702234798894248636800 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1582 for generator 27. -/
def ep_Q2_008_partial_27_1582 : Poly :=
[
  term ((-1038280035578480702234798894248636800 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((2076560071156961404469597788497273600 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1582 for generator 27. -/
theorem ep_Q2_008_partial_27_1582_valid :
    mulPoly ep_Q2_008_coefficient_27_1582
        ep_Q2_008_generator_27_1500_1599 =
      ep_Q2_008_partial_27_1582 := by
  native_decide

/-- Coefficient term 1583 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1583 : Poly :=
[
  term ((519140017789240351117399447124318400 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1583 for generator 27. -/
def ep_Q2_008_partial_27_1583 : Poly :=
[
  term ((1038280035578480702234798894248636800 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-519140017789240351117399447124318400 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1583 for generator 27. -/
theorem ep_Q2_008_partial_27_1583_valid :
    mulPoly ep_Q2_008_coefficient_27_1583
        ep_Q2_008_generator_27_1500_1599 =
      ep_Q2_008_partial_27_1583 := by
  native_decide

/-- Coefficient term 1584 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1584 : Poly :=
[
  term ((-1015368500705537531255289132617856000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (13, 2), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1584 for generator 27. -/
def ep_Q2_008_partial_27_1584 : Poly :=
[
  term ((1015368500705537531255289132617856000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-2030737001411075062510578265235712000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (13, 2), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1584 for generator 27. -/
theorem ep_Q2_008_partial_27_1584_valid :
    mulPoly ep_Q2_008_coefficient_27_1584
        ep_Q2_008_generator_27_1500_1599 =
      ep_Q2_008_partial_27_1584 := by
  native_decide

/-- Coefficient term 1585 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1585 : Poly :=
[
  term ((1824694926321908115 : Rat) / 692956453614176359) [(6, 1), (7, 2), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 1585 for generator 27. -/
def ep_Q2_008_partial_27_1585 : Poly :=
[
  term ((-1824694926321908115 : Rat) / 692956453614176359) [(6, 1), (7, 2), (13, 2), (14, 1), (16, 1)],
  term ((3649389852643816230 : Rat) / 692956453614176359) [(6, 1), (7, 2), (13, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1585 for generator 27. -/
theorem ep_Q2_008_partial_27_1585_valid :
    mulPoly ep_Q2_008_coefficient_27_1585
        ep_Q2_008_generator_27_1500_1599 =
      ep_Q2_008_partial_27_1585 := by
  native_decide

/-- Coefficient term 1586 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1586 : Poly :=
[
  term ((-507684250352768765627644566308928000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 1586 for generator 27. -/
def ep_Q2_008_partial_27_1586 : Poly :=
[
  term ((-1015368500705537531255289132617856000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((507684250352768765627644566308928000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1586 for generator 27. -/
theorem ep_Q2_008_partial_27_1586_valid :
    mulPoly ep_Q2_008_coefficient_27_1586
        ep_Q2_008_generator_27_1500_1599 =
      ep_Q2_008_partial_27_1586 := by
  native_decide

/-- Coefficient term 1587 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1587 : Poly :=
[
  term ((1824694926321908115 : Rat) / 1385912907228352718) [(6, 1), (7, 2), (13, 2), (16, 1)]
]

/-- Partial product 1587 for generator 27. -/
def ep_Q2_008_partial_27_1587 : Poly :=
[
  term ((1824694926321908115 : Rat) / 692956453614176359) [(6, 1), (7, 2), (13, 2), (14, 1), (16, 1)],
  term ((-1824694926321908115 : Rat) / 1385912907228352718) [(6, 1), (7, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1587 for generator 27. -/
theorem ep_Q2_008_partial_27_1587_valid :
    mulPoly ep_Q2_008_coefficient_27_1587
        ep_Q2_008_generator_27_1500_1599 =
      ep_Q2_008_partial_27_1587 := by
  native_decide

/-- Coefficient term 1588 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1588 : Poly :=
[
  term ((36664280725171531746812407106085388800 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (13, 3), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1588 for generator 27. -/
def ep_Q2_008_partial_27_1588 : Poly :=
[
  term ((-36664280725171531746812407106085388800 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((73328561450343063493624814212170777600 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (13, 3), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1588 for generator 27. -/
theorem ep_Q2_008_partial_27_1588_valid :
    mulPoly ep_Q2_008_coefficient_27_1588
        ep_Q2_008_generator_27_1500_1599 =
      ep_Q2_008_partial_27_1588 := by
  native_decide

/-- Coefficient term 1589 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1589 : Poly :=
[
  term ((18332140362585765873406203553042694400 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 1589 for generator 27. -/
def ep_Q2_008_partial_27_1589 : Poly :=
[
  term ((36664280725171531746812407106085388800 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-18332140362585765873406203553042694400 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1589 for generator 27. -/
theorem ep_Q2_008_partial_27_1589_valid :
    mulPoly ep_Q2_008_coefficient_27_1589
        ep_Q2_008_generator_27_1500_1599 =
      ep_Q2_008_partial_27_1589 := by
  native_decide

/-- Coefficient term 1590 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1590 : Poly :=
[
  term ((-9397072573488003139965417854246400 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1590 for generator 27. -/
def ep_Q2_008_partial_27_1590 : Poly :=
[
  term ((9397072573488003139965417854246400 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (14, 1), (15, 2), (16, 1)],
  term ((-18794145146976006279930835708492800 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1590 for generator 27. -/
theorem ep_Q2_008_partial_27_1590_valid :
    mulPoly ep_Q2_008_coefficient_27_1590
        ep_Q2_008_generator_27_1500_1599 =
      ep_Q2_008_partial_27_1590 := by
  native_decide

/-- Coefficient term 1591 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1591 : Poly :=
[
  term ((1619646487561852949 : Rat) / 2771825814456705436) [(6, 1), (7, 2), (14, 1), (16, 1)]
]

/-- Partial product 1591 for generator 27. -/
def ep_Q2_008_partial_27_1591 : Poly :=
[
  term ((-1619646487561852949 : Rat) / 2771825814456705436) [(6, 1), (7, 2), (14, 1), (16, 1)],
  term ((1619646487561852949 : Rat) / 1385912907228352718) [(6, 1), (7, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1591 for generator 27. -/
theorem ep_Q2_008_partial_27_1591_valid :
    mulPoly ep_Q2_008_coefficient_27_1591
        ep_Q2_008_generator_27_1500_1599 =
      ep_Q2_008_partial_27_1591 := by
  native_decide

/-- Coefficient term 1592 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1592 : Poly :=
[
  term ((-4698536286744001569982708927123200 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (15, 2), (16, 1)]
]

/-- Partial product 1592 for generator 27. -/
def ep_Q2_008_partial_27_1592 : Poly :=
[
  term ((-9397072573488003139965417854246400 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (14, 1), (15, 2), (16, 1)],
  term ((4698536286744001569982708927123200 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1592 for generator 27. -/
theorem ep_Q2_008_partial_27_1592_valid :
    mulPoly ep_Q2_008_coefficient_27_1592
        ep_Q2_008_generator_27_1500_1599 =
      ep_Q2_008_partial_27_1592 := by
  native_decide

/-- Coefficient term 1593 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1593 : Poly :=
[
  term ((1619646487561852949 : Rat) / 5543651628913410872) [(6, 1), (7, 2), (16, 1)]
]

/-- Partial product 1593 for generator 27. -/
def ep_Q2_008_partial_27_1593 : Poly :=
[
  term ((1619646487561852949 : Rat) / 2771825814456705436) [(6, 1), (7, 2), (14, 1), (16, 1)],
  term ((-1619646487561852949 : Rat) / 5543651628913410872) [(6, 1), (7, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1593 for generator 27. -/
theorem ep_Q2_008_partial_27_1593_valid :
    mulPoly ep_Q2_008_coefficient_27_1593
        ep_Q2_008_generator_27_1500_1599 =
      ep_Q2_008_partial_27_1593 := by
  native_decide

/-- Coefficient term 1594 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1594 : Poly :=
[
  term ((1015368500705537531255289132617856000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 3), (13, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1594 for generator 27. -/
def ep_Q2_008_partial_27_1594 : Poly :=
[
  term ((-1015368500705537531255289132617856000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 3), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((2030737001411075062510578265235712000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 3), (13, 2), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1594 for generator 27. -/
theorem ep_Q2_008_partial_27_1594_valid :
    mulPoly ep_Q2_008_coefficient_27_1594
        ep_Q2_008_generator_27_1500_1599 =
      ep_Q2_008_partial_27_1594 := by
  native_decide

/-- Coefficient term 1595 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1595 : Poly :=
[
  term ((507684250352768765627644566308928000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 3), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 1595 for generator 27. -/
def ep_Q2_008_partial_27_1595 : Poly :=
[
  term ((1015368500705537531255289132617856000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 3), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-507684250352768765627644566308928000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 3), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1595 for generator 27. -/
theorem ep_Q2_008_partial_27_1595_valid :
    mulPoly ep_Q2_008_coefficient_27_1595
        ep_Q2_008_generator_27_1500_1599 =
      ep_Q2_008_partial_27_1595 := by
  native_decide

/-- Coefficient term 1596 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1596 : Poly :=
[
  term ((9397072573488003139965417854246400 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 3), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1596 for generator 27. -/
def ep_Q2_008_partial_27_1596 : Poly :=
[
  term ((-9397072573488003139965417854246400 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 3), (14, 1), (15, 1), (16, 1)],
  term ((18794145146976006279930835708492800 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 3), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1596 for generator 27. -/
theorem ep_Q2_008_partial_27_1596_valid :
    mulPoly ep_Q2_008_coefficient_27_1596
        ep_Q2_008_generator_27_1500_1599 =
      ep_Q2_008_partial_27_1596 := by
  native_decide

/-- Coefficient term 1597 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1597 : Poly :=
[
  term ((4698536286744001569982708927123200 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 3), (15, 1), (16, 1)]
]

/-- Partial product 1597 for generator 27. -/
def ep_Q2_008_partial_27_1597 : Poly :=
[
  term ((9397072573488003139965417854246400 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 3), (14, 1), (15, 1), (16, 1)],
  term ((-4698536286744001569982708927123200 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1597 for generator 27. -/
theorem ep_Q2_008_partial_27_1597_valid :
    mulPoly ep_Q2_008_coefficient_27_1597
        ep_Q2_008_generator_27_1500_1599 =
      ep_Q2_008_partial_27_1597 := by
  native_decide

/-- Coefficient term 1598 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1598 : Poly :=
[
  term ((14423181750135707291662327260040033405200 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1598 for generator 27. -/
def ep_Q2_008_partial_27_1598 : Poly :=
[
  term ((-14423181750135707291662327260040033405200 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((28846363500271414583324654520080066810400 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (9, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1598 for generator 27. -/
theorem ep_Q2_008_partial_27_1598_valid :
    mulPoly ep_Q2_008_coefficient_27_1598
        ep_Q2_008_generator_27_1500_1599 =
      ep_Q2_008_partial_27_1598 := by
  native_decide

/-- Coefficient term 1599 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1599 : Poly :=
[
  term ((7510350068521486059682558432634612286600 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 1599 for generator 27. -/
def ep_Q2_008_partial_27_1599 : Poly :=
[
  term ((15020700137042972119365116865269224573200 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7510350068521486059682558432634612286600 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1599 for generator 27. -/
theorem ep_Q2_008_partial_27_1599_valid :
    mulPoly ep_Q2_008_coefficient_27_1599
        ep_Q2_008_generator_27_1500_1599 =
      ep_Q2_008_partial_27_1599 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_008_partials_27_1500_1599 : List Poly :=
[
  ep_Q2_008_partial_27_1500,
  ep_Q2_008_partial_27_1501,
  ep_Q2_008_partial_27_1502,
  ep_Q2_008_partial_27_1503,
  ep_Q2_008_partial_27_1504,
  ep_Q2_008_partial_27_1505,
  ep_Q2_008_partial_27_1506,
  ep_Q2_008_partial_27_1507,
  ep_Q2_008_partial_27_1508,
  ep_Q2_008_partial_27_1509,
  ep_Q2_008_partial_27_1510,
  ep_Q2_008_partial_27_1511,
  ep_Q2_008_partial_27_1512,
  ep_Q2_008_partial_27_1513,
  ep_Q2_008_partial_27_1514,
  ep_Q2_008_partial_27_1515,
  ep_Q2_008_partial_27_1516,
  ep_Q2_008_partial_27_1517,
  ep_Q2_008_partial_27_1518,
  ep_Q2_008_partial_27_1519,
  ep_Q2_008_partial_27_1520,
  ep_Q2_008_partial_27_1521,
  ep_Q2_008_partial_27_1522,
  ep_Q2_008_partial_27_1523,
  ep_Q2_008_partial_27_1524,
  ep_Q2_008_partial_27_1525,
  ep_Q2_008_partial_27_1526,
  ep_Q2_008_partial_27_1527,
  ep_Q2_008_partial_27_1528,
  ep_Q2_008_partial_27_1529,
  ep_Q2_008_partial_27_1530,
  ep_Q2_008_partial_27_1531,
  ep_Q2_008_partial_27_1532,
  ep_Q2_008_partial_27_1533,
  ep_Q2_008_partial_27_1534,
  ep_Q2_008_partial_27_1535,
  ep_Q2_008_partial_27_1536,
  ep_Q2_008_partial_27_1537,
  ep_Q2_008_partial_27_1538,
  ep_Q2_008_partial_27_1539,
  ep_Q2_008_partial_27_1540,
  ep_Q2_008_partial_27_1541,
  ep_Q2_008_partial_27_1542,
  ep_Q2_008_partial_27_1543,
  ep_Q2_008_partial_27_1544,
  ep_Q2_008_partial_27_1545,
  ep_Q2_008_partial_27_1546,
  ep_Q2_008_partial_27_1547,
  ep_Q2_008_partial_27_1548,
  ep_Q2_008_partial_27_1549,
  ep_Q2_008_partial_27_1550,
  ep_Q2_008_partial_27_1551,
  ep_Q2_008_partial_27_1552,
  ep_Q2_008_partial_27_1553,
  ep_Q2_008_partial_27_1554,
  ep_Q2_008_partial_27_1555,
  ep_Q2_008_partial_27_1556,
  ep_Q2_008_partial_27_1557,
  ep_Q2_008_partial_27_1558,
  ep_Q2_008_partial_27_1559,
  ep_Q2_008_partial_27_1560,
  ep_Q2_008_partial_27_1561,
  ep_Q2_008_partial_27_1562,
  ep_Q2_008_partial_27_1563,
  ep_Q2_008_partial_27_1564,
  ep_Q2_008_partial_27_1565,
  ep_Q2_008_partial_27_1566,
  ep_Q2_008_partial_27_1567,
  ep_Q2_008_partial_27_1568,
  ep_Q2_008_partial_27_1569,
  ep_Q2_008_partial_27_1570,
  ep_Q2_008_partial_27_1571,
  ep_Q2_008_partial_27_1572,
  ep_Q2_008_partial_27_1573,
  ep_Q2_008_partial_27_1574,
  ep_Q2_008_partial_27_1575,
  ep_Q2_008_partial_27_1576,
  ep_Q2_008_partial_27_1577,
  ep_Q2_008_partial_27_1578,
  ep_Q2_008_partial_27_1579,
  ep_Q2_008_partial_27_1580,
  ep_Q2_008_partial_27_1581,
  ep_Q2_008_partial_27_1582,
  ep_Q2_008_partial_27_1583,
  ep_Q2_008_partial_27_1584,
  ep_Q2_008_partial_27_1585,
  ep_Q2_008_partial_27_1586,
  ep_Q2_008_partial_27_1587,
  ep_Q2_008_partial_27_1588,
  ep_Q2_008_partial_27_1589,
  ep_Q2_008_partial_27_1590,
  ep_Q2_008_partial_27_1591,
  ep_Q2_008_partial_27_1592,
  ep_Q2_008_partial_27_1593,
  ep_Q2_008_partial_27_1594,
  ep_Q2_008_partial_27_1595,
  ep_Q2_008_partial_27_1596,
  ep_Q2_008_partial_27_1597,
  ep_Q2_008_partial_27_1598,
  ep_Q2_008_partial_27_1599
]

/-- Sum of partial products in this block. -/
def ep_Q2_008_block_27_1500_1599 : Poly :=
[
  term ((13090085692620672579746140373629214679756540 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-77983809828931669893 : Rat) / 382320801994028336) [(5, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-6545042846310336289873070186814607339878270 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((77983809828931669893 : Rat) / 764641603988056672) [(5, 1), (12, 1), (13, 1), (16, 1)],
  term ((2248155950298125711975739273981491532060921 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-2248155950298125711975739273981491532060921 : Rat) / 168707601851329515375740828258983054697998) [(5, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((484378751632703758830 : Rat) / 692956453614176359) [(5, 1), (12, 1), (13, 3), (14, 1), (16, 1)],
  term ((-242189375816351879415 : Rat) / 692956453614176359) [(5, 1), (12, 1), (13, 3), (16, 1)],
  term ((-6553123451931975006687546205964441042298703 : Rat) / 1349660814810636123005926626071864437583984) [(5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((67882018582864143636247728038746813446000 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((33941009291432071818123864019373406723000 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((6281595377600518432142555293809453788514703 : Rat) / 2699321629621272246011853252143728875167968) [(5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-33941009291432071818123864019373406723000 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (12, 1), (15, 3), (16, 1)],
  term ((5447633300209850424307420936086542419200 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (12, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((900559303502098301175 : Rat) / 5543651628913410872) [(5, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-2723816650104925212153710468043271209600 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-900559303502098301175 : Rat) / 11087303257826821744) [(5, 1), (12, 2), (13, 1), (16, 1)],
  term ((-156088613732203079208085647751520649177600 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (12, 2), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((78044306866101539604042823875760324588800 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((-10151457138282586941198389116588087025529447 : Rat) / 337415203702659030751481656517966109395996) [(5, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((10151457138282586941198389116588087025529447 : Rat) / 674830407405318061502963313035932218791992) [(5, 1), (12, 2), (15, 1), (16, 1)],
  term ((8511486404961490983 : Rat) / 1385912907228352718) [(5, 1), (13, 1), (14, 1), (16, 1)],
  term ((-67882018582864143636247728038746813446000 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((338856038629410847841 : Rat) / 11087303257826821744) [(5, 1), (13, 1), (14, 2), (16, 1)],
  term ((16970504645716035909061932009686703361500 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (13, 1), (15, 2), (16, 1)],
  term ((-475039821108794703569 : Rat) / 44349213031307286976) [(5, 1), (13, 1), (16, 1)],
  term ((-32761355034350227915451855499820168949546550 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((16380677517175113957725927749910084474773275 : Rat) / 168707601851329515375740828258983054697998) [(5, 1), (13, 2), (15, 1), (16, 1)],
  term ((-16145958387756791961 : Rat) / 692956453614176359) [(5, 1), (13, 3), (14, 2), (16, 1)],
  term ((16145958387756791961 : Rat) / 2771825814456705436) [(5, 1), (13, 3), (16, 1)],
  term ((34635505234758477152636708484781689854100 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6449681742709274572199116378640422814317131 : Rat) / 674830407405318061502963313035932218791992) [(5, 1), (14, 2), (15, 1), (16, 1)],
  term ((5895513658953138937756929042883915776651531 : Rat) / 2699321629621272246011853252143728875167968) [(5, 1), (15, 1), (16, 1)],
  term ((64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((258163701531813679386786322024396800 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-5195544493327750297659074730740985600 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((2597772246663875148829537365370492800 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((1898262511263335877844017073708800 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((-32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((7118484417237509541915064026408000 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (12, 1), (15, 3), (16, 1)],
  term ((2904341642232903893101346122774464000 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (12, 2), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1452170821116451946550673061387232000 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((-13287837578843351144908119515961600 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((6643918789421675572454059757980800 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-16135231345738354961674145126524800 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((16135231345738354961674145126524800 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-4033807836434588740418536281631200 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (15, 1), (16, 1)],
  term ((10763972258504527974 : Rat) / 692956453614176359) [(5, 2), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-5381986129252263987 : Rat) / 692956453614176359) [(5, 2), (10, 1), (12, 1), (16, 1)],
  term ((43055889034018111896 : Rat) / 692956453614176359) [(5, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-21527944517009055948 : Rat) / 692956453614176359) [(5, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-866499766809614501907 : Rat) / 692956453614176359) [(5, 2), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((866499766809614501907 : Rat) / 1385912907228352718) [(5, 2), (12, 1), (13, 2), (16, 1)],
  term ((-10763972258504527974 : Rat) / 692956453614176359) [(5, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((17984823394286703351 : Rat) / 11087303257826821744) [(5, 2), (12, 1), (14, 1), (16, 1)],
  term ((-5381986129252263987 : Rat) / 692956453614176359) [(5, 2), (12, 1), (14, 2), (16, 1)],
  term ((5381986129252263987 : Rat) / 692956453614176359) [(5, 2), (12, 1), (15, 2), (16, 1)],
  term ((25071065639731408545 : Rat) / 22174606515653643488) [(5, 2), (12, 1), (16, 1)],
  term ((484378751632703758830 : Rat) / 692956453614176359) [(5, 2), (12, 2), (13, 2), (14, 1), (16, 1)],
  term ((-242189375816351879415 : Rat) / 692956453614176359) [(5, 2), (12, 2), (13, 2), (16, 1)],
  term ((-40983859916519688411 : Rat) / 5543651628913410872) [(5, 2), (12, 2), (14, 1), (16, 1)],
  term ((40983859916519688411 : Rat) / 11087303257826821744) [(5, 2), (12, 2), (16, 1)],
  term ((1313657228315796839287489984202006566159014 : Rat) / 84353800925664757687870414129491527348999) [(5, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-656828614157898419643744992101003283079507 : Rat) / 168707601851329515375740828258983054697998) [(5, 2), (13, 1), (15, 1), (16, 1)],
  term ((6767139819676770987 : Rat) / 1385912907228352718) [(5, 2), (14, 2), (16, 1)],
  term ((-6767139819676770987 : Rat) / 5543651628913410872) [(5, 2), (16, 1)],
  term ((16979061979207944000 : Rat) / 692956453614176359) [(6, 1), (7, 1), (10, 1), (13, 1), (14, 2), (16, 1)],
  term ((-4244765494801986000 : Rat) / 692956453614176359) [(6, 1), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((-43626810247303208702812078181626403269200 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((21813405123651604351406039090813201634600 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-180940767031058398568961627451392000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((8195557855031715787588089335358713433600 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (7, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-2046265822635978600117772390241633174400 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((2189633911586289738 : Rat) / 692956453614176359) [(6, 1), (7, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((47645537137392240000 : Rat) / 692956453614176359) [(6, 1), (7, 1), (11, 1), (13, 2), (14, 2), (16, 1)],
  term ((-13006201240141204869 : Rat) / 692956453614176359) [(6, 1), (7, 1), (11, 1), (13, 2), (16, 1)],
  term ((44240825310375167103676157919130752000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (11, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((3944326815162191356359941873775140352000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (11, 1), (13, 3), (14, 2), (15, 1), (16, 1)],
  term ((-1008202116445735422641823547403350464000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((309012903695229421306054779381830400 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((9249340331398466862 : Rat) / 692956453614176359) [(6, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-25891905370046625 : Rat) / 692956453614176359) [(6, 1), (7, 1), (11, 1), (14, 2), (16, 1)],
  term ((-154506451847614710653027389690915200 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((-18472788757426887099 : Rat) / 2771825814456705436) [(6, 1), (7, 1), (11, 1), (16, 1)],
  term ((-2052584970763523172962785350633705600 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-3284450867379434607 : Rat) / 692956453614176359) [(6, 1), (7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((1026292485381761586481392675316852800 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((3284450867379434607 : Rat) / 1385912907228352718) [(6, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((86922731395941197250294002908208996869806 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (7, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-43461365697970598625147001454104498434903 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (12, 1), (13, 3), (14, 1), (15, 2), (16, 1)],
  term ((-7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((360474911944990473083888883476786948236893 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((77253225923807355326513694845457600 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((-360474911944990473083888883476786948236893 : Rat) / 168707601851329515375740828258983054697998) [(6, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-38626612961903677663256847422728800 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (12, 1), (15, 3), (16, 1)],
  term ((-309012903695229421306054779381830400 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1573483482821780416885868930298110400 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-25833040376012974203 : Rat) / 1385912907228352718) [(6, 1), (7, 1), (13, 1), (14, 2), (16, 1)],
  term ((547877322553059814874494622265442800 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((25833040376012974203 : Rat) / 5543651628913410872) [(6, 1), (7, 1), (13, 1), (16, 1)],
  term ((24394692697937337664208219415321600 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-374239929694359185613790752948723804669030 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (7, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((187119257401091352624103114435998858008115 : Rat) / 168707601851329515375740828258983054697998) [(6, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-73734708850625278506126929865217920000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (13, 3), (14, 2), (15, 2), (16, 1)],
  term ((-729877970528763246 : Rat) / 692956453614176359) [(6, 1), (7, 1), (13, 3), (14, 2), (16, 1)],
  term ((18433677212656319626531732466304480000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (13, 3), (15, 2), (16, 1)],
  term ((364938985264381623 : Rat) / 1385912907228352718) [(6, 1), (7, 1), (13, 3), (16, 1)],
  term ((-14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (13, 4), (14, 2), (15, 1), (16, 1)],
  term ((3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (13, 4), (15, 1), (16, 1)],
  term ((-277934770353741138318376147394573063836789 : Rat) / 168707601851329515375740828258983054697998) [(6, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((277934770353741138318376147394573063836789 : Rat) / 674830407405318061502963313035932218791992) [(6, 1), (7, 1), (15, 1), (16, 1)],
  term ((1218442200846645037506346959141427200 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((86673858493002527528792779578278400 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-43336929246501263764396389789139200 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((-1827663301269967556259520438712140800 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((913831650634983778129760219356070400 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (12, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-38799947216034992907421682315097600 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((19399973608017496453710841157548800 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (12, 1), (15, 2), (16, 1)],
  term ((2076560071156961404469597788497273600 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-519140017789240351117399447124318400 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-2030737001411075062510578265235712000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (13, 2), (14, 2), (15, 2), (16, 1)],
  term ((3649389852643816230 : Rat) / 692956453614176359) [(6, 1), (7, 2), (13, 2), (14, 2), (16, 1)],
  term ((507684250352768765627644566308928000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (13, 2), (15, 2), (16, 1)],
  term ((-1824694926321908115 : Rat) / 1385912907228352718) [(6, 1), (7, 2), (13, 2), (16, 1)],
  term ((73328561450343063493624814212170777600 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (13, 3), (14, 2), (15, 1), (16, 1)],
  term ((-18332140362585765873406203553042694400 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (13, 3), (15, 1), (16, 1)],
  term ((-18794145146976006279930835708492800 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (14, 2), (15, 2), (16, 1)],
  term ((1619646487561852949 : Rat) / 1385912907228352718) [(6, 1), (7, 2), (14, 2), (16, 1)],
  term ((4698536286744001569982708927123200 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (15, 2), (16, 1)],
  term ((-1619646487561852949 : Rat) / 5543651628913410872) [(6, 1), (7, 2), (16, 1)],
  term ((2030737001411075062510578265235712000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 3), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((-507684250352768765627644566308928000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 3), (13, 2), (15, 1), (16, 1)],
  term ((18794145146976006279930835708492800 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 3), (14, 2), (15, 1), (16, 1)],
  term ((-4698536286744001569982708927123200 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 3), (15, 1), (16, 1)],
  term ((597518386907264827702789605229191168000 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((28846363500271414583324654520080066810400 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-7510350068521486059682558432634612286600 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 27, terms 1500 through 1599. -/
theorem ep_Q2_008_block_27_1500_1599_valid :
    checkProductSumEq ep_Q2_008_partials_27_1500_1599
      ep_Q2_008_block_27_1500_1599 = true := by
  native_decide

end EpQ2008TermShards

end Patterns

end EndpointCertificate

end Problem97
