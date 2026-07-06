/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_008, term block 27:1600-1699

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_008`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2008TermShards

/-- Generator polynomial 27 for endpoint certificate `ep_Q2_008`. -/
def ep_Q2_008_generator_27_1600_1699 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(14, 1)]
]

/-- Coefficient term 1600 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1600 : Poly :=
[
  term ((6945979900585068000 : Rat) / 692956453614176359) [(6, 1), (10, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 1600 for generator 27. -/
def ep_Q2_008_partial_27_1600 : Poly :=
[
  term ((13891959801170136000 : Rat) / 692956453614176359) [(6, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-6945979900585068000 : Rat) / 692956453614176359) [(6, 1), (10, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1600 for generator 27. -/
theorem ep_Q2_008_partial_27_1600_valid :
    mulPoly ep_Q2_008_coefficient_27_1600
        ep_Q2_008_generator_27_1600_1699 =
      ep_Q2_008_partial_27_1600 := by
  native_decide

/-- Coefficient term 1601 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1601 : Poly :=
[
  term ((2315326633528356000 : Rat) / 692956453614176359) [(6, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1601 for generator 27. -/
def ep_Q2_008_partial_27_1601 : Poly :=
[
  term ((4630653267056712000 : Rat) / 692956453614176359) [(6, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2315326633528356000 : Rat) / 692956453614176359) [(6, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1601 for generator 27. -/
theorem ep_Q2_008_partial_27_1601_valid :
    mulPoly ep_Q2_008_coefficient_27_1601
        ep_Q2_008_generator_27_1600_1699 =
      ep_Q2_008_partial_27_1601 := by
  native_decide

/-- Coefficient term 1602 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1602 : Poly :=
[
  term ((-9261306534113424000 : Rat) / 692956453614176359) [(6, 1), (10, 1), (12, 1), (16, 1)]
]

/-- Partial product 1602 for generator 27. -/
def ep_Q2_008_partial_27_1602 : Poly :=
[
  term ((-18522613068226848000 : Rat) / 692956453614176359) [(6, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((9261306534113424000 : Rat) / 692956453614176359) [(6, 1), (10, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1602 for generator 27. -/
theorem ep_Q2_008_partial_27_1602_valid :
    mulPoly ep_Q2_008_coefficient_27_1602
        ep_Q2_008_generator_27_1600_1699 =
      ep_Q2_008_partial_27_1602 := by
  native_decide

/-- Coefficient term 1603 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1603 : Poly :=
[
  term ((-1033013753135477782492288788546715495476000 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1603 for generator 27. -/
def ep_Q2_008_partial_27_1603 : Poly :=
[
  term ((1033013753135477782492288788546715495476000 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2066027506270955564984577577093430990952000 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (10, 1), (13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1603 for generator 27. -/
theorem ep_Q2_008_partial_27_1603_valid :
    mulPoly ep_Q2_008_coefficient_27_1603
        ep_Q2_008_generator_27_1600_1699 =
      ep_Q2_008_partial_27_1603 := by
  native_decide

/-- Coefficient term 1604 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1604 : Poly :=
[
  term ((-494693471444087286894738355182544546103400 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1604 for generator 27. -/
def ep_Q2_008_partial_27_1604 : Poly :=
[
  term ((-989386942888174573789476710365089092206800 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((494693471444087286894738355182544546103400 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1604 for generator 27. -/
theorem ep_Q2_008_partial_27_1604_valid :
    mulPoly ep_Q2_008_coefficient_27_1604
        ep_Q2_008_generator_27_1600_1699 =
      ep_Q2_008_partial_27_1604 := by
  native_decide

/-- Coefficient term 1605 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1605 : Poly :=
[
  term ((-2315326633528356000 : Rat) / 692956453614176359) [(6, 1), (10, 1), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 1605 for generator 27. -/
def ep_Q2_008_partial_27_1605 : Poly :=
[
  term ((2315326633528356000 : Rat) / 692956453614176359) [(6, 1), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((-4630653267056712000 : Rat) / 692956453614176359) [(6, 1), (10, 1), (13, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1605 for generator 27. -/
theorem ep_Q2_008_partial_27_1605_valid :
    mulPoly ep_Q2_008_coefficient_27_1605
        ep_Q2_008_generator_27_1600_1699 =
      ep_Q2_008_partial_27_1605 := by
  native_decide

/-- Coefficient term 1606 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1606 : Poly :=
[
  term ((-1157663316764178000 : Rat) / 692956453614176359) [(6, 1), (10, 1), (13, 2), (16, 1)]
]

/-- Partial product 1606 for generator 27. -/
def ep_Q2_008_partial_27_1606 : Poly :=
[
  term ((-2315326633528356000 : Rat) / 692956453614176359) [(6, 1), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((1157663316764178000 : Rat) / 692956453614176359) [(6, 1), (10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1606 for generator 27. -/
theorem ep_Q2_008_partial_27_1606_valid :
    mulPoly ep_Q2_008_coefficient_27_1606
        ep_Q2_008_generator_27_1600_1699 =
      ep_Q2_008_partial_27_1606 := by
  native_decide

/-- Coefficient term 1607 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1607 : Poly :=
[
  term ((5575573022869227375 : Rat) / 1385912907228352718) [(6, 1), (10, 1), (14, 1), (16, 1)]
]

/-- Partial product 1607 for generator 27. -/
def ep_Q2_008_partial_27_1607 : Poly :=
[
  term ((-5575573022869227375 : Rat) / 1385912907228352718) [(6, 1), (10, 1), (14, 1), (16, 1)],
  term ((5575573022869227375 : Rat) / 692956453614176359) [(6, 1), (10, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1607 for generator 27. -/
theorem ep_Q2_008_partial_27_1607_valid :
    mulPoly ep_Q2_008_coefficient_27_1607
        ep_Q2_008_generator_27_1600_1699 =
      ep_Q2_008_partial_27_1607 := by
  native_decide

/-- Coefficient term 1608 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1608 : Poly :=
[
  term ((5575573022869227375 : Rat) / 2771825814456705436) [(6, 1), (10, 1), (16, 1)]
]

/-- Partial product 1608 for generator 27. -/
def ep_Q2_008_partial_27_1608 : Poly :=
[
  term ((5575573022869227375 : Rat) / 1385912907228352718) [(6, 1), (10, 1), (14, 1), (16, 1)],
  term ((-5575573022869227375 : Rat) / 2771825814456705436) [(6, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1608 for generator 27. -/
theorem ep_Q2_008_partial_27_1608_valid :
    mulPoly ep_Q2_008_coefficient_27_1608
        ep_Q2_008_generator_27_1600_1699 =
      ep_Q2_008_partial_27_1608 := by
  native_decide

/-- Coefficient term 1609 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1609 : Poly :=
[
  term ((-794692033748713085134752484873103059200 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 1609 for generator 27. -/
def ep_Q2_008_partial_27_1609 : Poly :=
[
  term ((-1589384067497426170269504969746206118400 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((794692033748713085134752484873103059200 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1609 for generator 27. -/
theorem ep_Q2_008_partial_27_1609_valid :
    mulPoly ep_Q2_008_coefficient_27_1609
        ep_Q2_008_generator_27_1600_1699 =
      ep_Q2_008_partial_27_1609 := by
  native_decide

/-- Coefficient term 1610 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1610 : Poly :=
[
  term ((-736555118135865750 : Rat) / 23895050124626771) [(6, 1), (11, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 1610 for generator 27. -/
def ep_Q2_008_partial_27_1610 : Poly :=
[
  term ((-1473110236271731500 : Rat) / 23895050124626771) [(6, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((736555118135865750 : Rat) / 23895050124626771) [(6, 1), (11, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1610 for generator 27. -/
theorem ep_Q2_008_partial_27_1610_valid :
    mulPoly ep_Q2_008_coefficient_27_1610
        ep_Q2_008_generator_27_1600_1699 =
      ep_Q2_008_partial_27_1610 := by
  native_decide

/-- Coefficient term 1611 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1611 : Poly :=
[
  term ((528517115093832320642316952811812660670400 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 1611 for generator 27. -/
def ep_Q2_008_partial_27_1611 : Poly :=
[
  term ((1057034230187664641284633905623625321340800 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-528517115093832320642316952811812660670400 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1611 for generator 27. -/
theorem ep_Q2_008_partial_27_1611_valid :
    mulPoly ep_Q2_008_coefficient_27_1611
        ep_Q2_008_generator_27_1600_1699 =
      ep_Q2_008_partial_27_1611 := by
  native_decide

/-- Coefficient term 1612 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1612 : Poly :=
[
  term ((394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (11, 1), (12, 1), (13, 3), (15, 2), (16, 1)]
]

/-- Partial product 1612 for generator 27. -/
def ep_Q2_008_partial_27_1612 : Poly :=
[
  term ((788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (11, 1), (12, 1), (13, 3), (14, 1), (15, 2), (16, 1)],
  term ((-394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (11, 1), (12, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1612 for generator 27. -/
theorem ep_Q2_008_partial_27_1612_valid :
    mulPoly ep_Q2_008_coefficient_27_1612
        ep_Q2_008_generator_27_1600_1699 =
      ep_Q2_008_partial_27_1612 := by
  native_decide

/-- Coefficient term 1613 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1613 : Poly :=
[
  term ((-87184599117767862569056627056425158676325 : Rat) / 168707601851329515375740828258983054697998) [(6, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1613 for generator 27. -/
def ep_Q2_008_partial_27_1613 : Poly :=
[
  term ((-87184599117767862569056627056425158676325 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((87184599117767862569056627056425158676325 : Rat) / 168707601851329515375740828258983054697998) [(6, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1613 for generator 27. -/
theorem ep_Q2_008_partial_27_1613_valid :
    mulPoly ep_Q2_008_coefficient_27_1613
        ep_Q2_008_generator_27_1600_1699 =
      ep_Q2_008_partial_27_1613 := by
  native_decide

/-- Coefficient term 1614 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1614 : Poly :=
[
  term ((-4157495168227792917037311132093583468800 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1614 for generator 27. -/
def ep_Q2_008_partial_27_1614 : Poly :=
[
  term ((4157495168227792917037311132093583468800 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-8314990336455585834074622264187166937600 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 1), (13, 1), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1614 for generator 27. -/
theorem ep_Q2_008_partial_27_1614_valid :
    mulPoly ep_Q2_008_coefficient_27_1614
        ep_Q2_008_generator_27_1600_1699 =
      ep_Q2_008_partial_27_1614 := by
  native_decide

/-- Coefficient term 1615 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1615 : Poly :=
[
  term ((13017932354601955125 : Rat) / 1385912907228352718) [(6, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1615 for generator 27. -/
def ep_Q2_008_partial_27_1615 : Poly :=
[
  term ((-13017932354601955125 : Rat) / 1385912907228352718) [(6, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((13017932354601955125 : Rat) / 692956453614176359) [(6, 1), (11, 1), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1615 for generator 27. -/
theorem ep_Q2_008_partial_27_1615_valid :
    mulPoly ep_Q2_008_coefficient_27_1615
        ep_Q2_008_generator_27_1600_1699 =
      ep_Q2_008_partial_27_1615 := by
  native_decide

/-- Coefficient term 1616 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1616 : Poly :=
[
  term ((-49217161566835919293144938861465513600 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 1616 for generator 27. -/
def ep_Q2_008_partial_27_1616 : Poly :=
[
  term ((-98434323133671838586289877722931027200 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((49217161566835919293144938861465513600 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1616 for generator 27. -/
theorem ep_Q2_008_partial_27_1616_valid :
    mulPoly ep_Q2_008_coefficient_27_1616
        ep_Q2_008_generator_27_1600_1699 =
      ep_Q2_008_partial_27_1616 := by
  native_decide

/-- Coefficient term 1617 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1617 : Poly :=
[
  term ((-45895330585892975517 : Rat) / 2771825814456705436) [(6, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 1617 for generator 27. -/
def ep_Q2_008_partial_27_1617 : Poly :=
[
  term ((-45895330585892975517 : Rat) / 1385912907228352718) [(6, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((45895330585892975517 : Rat) / 2771825814456705436) [(6, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1617 for generator 27. -/
theorem ep_Q2_008_partial_27_1617_valid :
    mulPoly ep_Q2_008_coefficient_27_1617
        ep_Q2_008_generator_27_1600_1699 =
      ep_Q2_008_partial_27_1617 := by
  native_decide

/-- Coefficient term 1618 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1618 : Poly :=
[
  term ((-2883906811106118736217677776926087565566400 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1618 for generator 27. -/
def ep_Q2_008_partial_27_1618 : Poly :=
[
  term ((2883906811106118736217677776926087565566400 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-5767813622212237472435355553852175131132800 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 1), (13, 2), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1618 for generator 27. -/
theorem ep_Q2_008_partial_27_1618_valid :
    mulPoly ep_Q2_008_coefficient_27_1618
        ep_Q2_008_generator_27_1600_1699 =
      ep_Q2_008_partial_27_1618 := by
  native_decide

/-- Coefficient term 1619 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1619 : Poly :=
[
  term ((-1431174331938410967701513013608427686604000 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 1619 for generator 27. -/
def ep_Q2_008_partial_27_1619 : Poly :=
[
  term ((-2862348663876821935403026027216855373208000 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((1431174331938410967701513013608427686604000 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1619 for generator 27. -/
theorem ep_Q2_008_partial_27_1619_valid :
    mulPoly ep_Q2_008_coefficient_27_1619
        ep_Q2_008_generator_27_1600_1699 =
      ep_Q2_008_partial_27_1619 := by
  native_decide

/-- Coefficient term 1620 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1620 : Poly :=
[
  term ((-1972163407581095678179970936887570176000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (11, 1), (13, 3), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1620 for generator 27. -/
def ep_Q2_008_partial_27_1620 : Poly :=
[
  term ((1972163407581095678179970936887570176000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (11, 1), (13, 3), (14, 1), (15, 2), (16, 1)],
  term ((-3944326815162191356359941873775140352000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (11, 1), (13, 3), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1620 for generator 27. -/
theorem ep_Q2_008_partial_27_1620_valid :
    mulPoly ep_Q2_008_coefficient_27_1620
        ep_Q2_008_generator_27_1600_1699 =
      ep_Q2_008_partial_27_1620 := by
  native_decide

/-- Coefficient term 1621 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1621 : Poly :=
[
  term ((-4764553713739224000 : Rat) / 692956453614176359) [(6, 1), (11, 1), (13, 3), (14, 1), (16, 1)]
]

/-- Partial product 1621 for generator 27. -/
def ep_Q2_008_partial_27_1621 : Poly :=
[
  term ((4764553713739224000 : Rat) / 692956453614176359) [(6, 1), (11, 1), (13, 3), (14, 1), (16, 1)],
  term ((-9529107427478448000 : Rat) / 692956453614176359) [(6, 1), (11, 1), (13, 3), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1621 for generator 27. -/
theorem ep_Q2_008_partial_27_1621_valid :
    mulPoly ep_Q2_008_coefficient_27_1621
        ep_Q2_008_generator_27_1600_1699 =
      ep_Q2_008_partial_27_1621 := by
  native_decide

/-- Coefficient term 1622 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1622 : Poly :=
[
  term ((-986081703790547839089985468443785088000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (11, 1), (13, 3), (15, 2), (16, 1)]
]

/-- Partial product 1622 for generator 27. -/
def ep_Q2_008_partial_27_1622 : Poly :=
[
  term ((-1972163407581095678179970936887570176000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (11, 1), (13, 3), (14, 1), (15, 2), (16, 1)],
  term ((986081703790547839089985468443785088000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (11, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1622 for generator 27. -/
theorem ep_Q2_008_partial_27_1622_valid :
    mulPoly ep_Q2_008_coefficient_27_1622
        ep_Q2_008_generator_27_1600_1699 =
      ep_Q2_008_partial_27_1622 := by
  native_decide

/-- Coefficient term 1623 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1623 : Poly :=
[
  term ((-2382276856869612000 : Rat) / 692956453614176359) [(6, 1), (11, 1), (13, 3), (16, 1)]
]

/-- Partial product 1623 for generator 27. -/
def ep_Q2_008_partial_27_1623 : Poly :=
[
  term ((-4764553713739224000 : Rat) / 692956453614176359) [(6, 1), (11, 1), (13, 3), (14, 1), (16, 1)],
  term ((2382276856869612000 : Rat) / 692956453614176359) [(6, 1), (11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1623 for generator 27. -/
theorem ep_Q2_008_partial_27_1623_valid :
    mulPoly ep_Q2_008_coefficient_27_1623
        ep_Q2_008_generator_27_1600_1699 =
      ep_Q2_008_partial_27_1623 := by
  native_decide

/-- Coefficient term 1624 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1624 : Poly :=
[
  term ((-394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (11, 1), (13, 4), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1624 for generator 27. -/
def ep_Q2_008_partial_27_1624 : Poly :=
[
  term ((394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (11, 1), (13, 4), (14, 1), (15, 1), (16, 1)],
  term ((-788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (11, 1), (13, 4), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1624 for generator 27. -/
theorem ep_Q2_008_partial_27_1624_valid :
    mulPoly ep_Q2_008_coefficient_27_1624
        ep_Q2_008_generator_27_1600_1699 =
      ep_Q2_008_partial_27_1624 := by
  native_decide

/-- Coefficient term 1625 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1625 : Poly :=
[
  term ((-197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (11, 1), (13, 4), (15, 1), (16, 1)]
]

/-- Partial product 1625 for generator 27. -/
def ep_Q2_008_partial_27_1625 : Poly :=
[
  term ((-394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (11, 1), (13, 4), (14, 1), (15, 1), (16, 1)],
  term ((197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (11, 1), (13, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1625 for generator 27. -/
theorem ep_Q2_008_partial_27_1625_valid :
    mulPoly ep_Q2_008_coefficient_27_1625
        ep_Q2_008_generator_27_1600_1699 =
      ep_Q2_008_partial_27_1625 := by
  native_decide

/-- Coefficient term 1626 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1626 : Poly :=
[
  term ((9144362709899146948734428935040000278875 : Rat) / 168707601851329515375740828258983054697998) [(6, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1626 for generator 27. -/
def ep_Q2_008_partial_27_1626 : Poly :=
[
  term ((-9144362709899146948734428935040000278875 : Rat) / 168707601851329515375740828258983054697998) [(6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((9144362709899146948734428935040000278875 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1626 for generator 27. -/
theorem ep_Q2_008_partial_27_1626_valid :
    mulPoly ep_Q2_008_coefficient_27_1626
        ep_Q2_008_generator_27_1600_1699 =
      ep_Q2_008_partial_27_1626 := by
  native_decide

/-- Coefficient term 1627 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1627 : Poly :=
[
  term ((-487437338939156812981702322470411793665023 : Rat) / 168707601851329515375740828258983054697998) [(6, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 1627 for generator 27. -/
def ep_Q2_008_partial_27_1627 : Poly :=
[
  term ((-487437338939156812981702322470411793665023 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((487437338939156812981702322470411793665023 : Rat) / 168707601851329515375740828258983054697998) [(6, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1627 for generator 27. -/
theorem ep_Q2_008_partial_27_1627_valid :
    mulPoly ep_Q2_008_coefficient_27_1627
        ep_Q2_008_generator_27_1600_1699 =
      ep_Q2_008_partial_27_1627 := by
  native_decide

/-- Coefficient term 1628 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1628 : Poly :=
[
  term ((3335197780739038211317658262354644332800 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1628 for generator 27. -/
def ep_Q2_008_partial_27_1628 : Poly :=
[
  term ((6670395561478076422635316524709288665600 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3335197780739038211317658262354644332800 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1628 for generator 27. -/
theorem ep_Q2_008_partial_27_1628_valid :
    mulPoly ep_Q2_008_coefficient_27_1628
        ep_Q2_008_generator_27_1600_1699 =
      ep_Q2_008_partial_27_1628 := by
  native_decide

/-- Coefficient term 1629 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1629 : Poly :=
[
  term ((14293661141217672000 : Rat) / 692956453614176359) [(6, 1), (11, 2), (13, 2), (16, 1)]
]

/-- Partial product 1629 for generator 27. -/
def ep_Q2_008_partial_27_1629 : Poly :=
[
  term ((28587322282435344000 : Rat) / 692956453614176359) [(6, 1), (11, 2), (13, 2), (14, 1), (16, 1)],
  term ((-14293661141217672000 : Rat) / 692956453614176359) [(6, 1), (11, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1629 for generator 27. -/
theorem ep_Q2_008_partial_27_1629_valid :
    mulPoly ep_Q2_008_coefficient_27_1629
        ep_Q2_008_generator_27_1600_1699 =
      ep_Q2_008_partial_27_1629 := by
  native_decide

/-- Coefficient term 1630 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1630 : Poly :=
[
  term ((1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (11, 2), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 1630 for generator 27. -/
def ep_Q2_008_partial_27_1630 : Poly :=
[
  term ((2366596089097314813815965124265084211200 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (11, 2), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (11, 2), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1630 for generator 27. -/
theorem ep_Q2_008_partial_27_1630_valid :
    mulPoly ep_Q2_008_coefficient_27_1630
        ep_Q2_008_generator_27_1600_1699 =
      ep_Q2_008_partial_27_1630 := by
  native_decide

/-- Coefficient term 1631 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1631 : Poly :=
[
  term ((3877804354664514375 : Rat) / 1385912907228352718) [(6, 1), (11, 2), (16, 1)]
]

/-- Partial product 1631 for generator 27. -/
def ep_Q2_008_partial_27_1631 : Poly :=
[
  term ((3877804354664514375 : Rat) / 692956453614176359) [(6, 1), (11, 2), (14, 1), (16, 1)],
  term ((-3877804354664514375 : Rat) / 1385912907228352718) [(6, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1631 for generator 27. -/
theorem ep_Q2_008_partial_27_1631_valid :
    mulPoly ep_Q2_008_coefficient_27_1631
        ep_Q2_008_generator_27_1600_1699 =
      ep_Q2_008_partial_27_1631 := by
  native_decide

/-- Coefficient term 1632 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1632 : Poly :=
[
  term ((-3682244654810617547036612513503161525080667 : Rat) / 337415203702659030751481656517966109395996) [(6, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1632 for generator 27. -/
def ep_Q2_008_partial_27_1632 : Poly :=
[
  term ((-3682244654810617547036612513503161525080667 : Rat) / 168707601851329515375740828258983054697998) [(6, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((3682244654810617547036612513503161525080667 : Rat) / 337415203702659030751481656517966109395996) [(6, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1632 for generator 27. -/
theorem ep_Q2_008_partial_27_1632_valid :
    mulPoly ep_Q2_008_coefficient_27_1632
        ep_Q2_008_generator_27_1600_1699 =
      ep_Q2_008_partial_27_1632 := by
  native_decide

/-- Coefficient term 1633 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1633 : Poly :=
[
  term ((141147478046391873120448006797263232000 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (12, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 1633 for generator 27. -/
def ep_Q2_008_partial_27_1633 : Poly :=
[
  term ((282294956092783746240896013594526464000 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (12, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-141147478046391873120448006797263232000 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (12, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1633 for generator 27. -/
theorem ep_Q2_008_partial_27_1633_valid :
    mulPoly ep_Q2_008_coefficient_27_1633
        ep_Q2_008_generator_27_1600_1699 =
      ep_Q2_008_partial_27_1633 := by
  native_decide

/-- Coefficient term 1634 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1634 : Poly :=
[
  term ((4201465330826088668719012886041459123200 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (12, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 1634 for generator 27. -/
def ep_Q2_008_partial_27_1634 : Poly :=
[
  term ((8402930661652177337438025772082918246400 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (12, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-4201465330826088668719012886041459123200 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (12, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1634 for generator 27. -/
theorem ep_Q2_008_partial_27_1634_valid :
    mulPoly ep_Q2_008_coefficient_27_1634
        ep_Q2_008_generator_27_1600_1699 =
      ep_Q2_008_partial_27_1634 := by
  native_decide

/-- Coefficient term 1635 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1635 : Poly :=
[
  term ((23985511571295349047 : Rat) / 2771825814456705436) [(6, 1), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 1635 for generator 27. -/
def ep_Q2_008_partial_27_1635 : Poly :=
[
  term ((23985511571295349047 : Rat) / 1385912907228352718) [(6, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-23985511571295349047 : Rat) / 2771825814456705436) [(6, 1), (12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1635 for generator 27. -/
theorem ep_Q2_008_partial_27_1635_valid :
    mulPoly ep_Q2_008_coefficient_27_1635
        ep_Q2_008_generator_27_1600_1699 =
      ep_Q2_008_partial_27_1635 := by
  native_decide

/-- Coefficient term 1636 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1636 : Poly :=
[
  term ((-1348339058394058668987801342294324496072521 : Rat) / 1349660814810636123005926626071864437583984) [(6, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1636 for generator 27. -/
def ep_Q2_008_partial_27_1636 : Poly :=
[
  term ((-1348339058394058668987801342294324496072521 : Rat) / 674830407405318061502963313035932218791992) [(6, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((1348339058394058668987801342294324496072521 : Rat) / 1349660814810636123005926626071864437583984) [(6, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1636 for generator 27. -/
theorem ep_Q2_008_partial_27_1636_valid :
    mulPoly ep_Q2_008_coefficient_27_1636
        ep_Q2_008_generator_27_1600_1699 =
      ep_Q2_008_partial_27_1636 := by
  native_decide

/-- Coefficient term 1637 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1637 : Poly :=
[
  term ((54102316226717537127 : Rat) / 5543651628913410872) [(6, 1), (12, 1), (16, 1)]
]

/-- Partial product 1637 for generator 27. -/
def ep_Q2_008_partial_27_1637 : Poly :=
[
  term ((54102316226717537127 : Rat) / 2771825814456705436) [(6, 1), (12, 1), (14, 1), (16, 1)],
  term ((-54102316226717537127 : Rat) / 5543651628913410872) [(6, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1637 for generator 27. -/
theorem ep_Q2_008_partial_27_1637_valid :
    mulPoly ep_Q2_008_coefficient_27_1637
        ep_Q2_008_generator_27_1600_1699 =
      ep_Q2_008_partial_27_1637 := by
  native_decide

/-- Coefficient term 1638 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1638 : Poly :=
[
  term ((12129918486196904941506727646259994783900173 : Rat) / 1349660814810636123005926626071864437583984) [(6, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1638 for generator 27. -/
def ep_Q2_008_partial_27_1638 : Poly :=
[
  term ((-12129918486196904941506727646259994783900173 : Rat) / 1349660814810636123005926626071864437583984) [(6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((12129918486196904941506727646259994783900173 : Rat) / 674830407405318061502963313035932218791992) [(6, 1), (13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1638 for generator 27. -/
theorem ep_Q2_008_partial_27_1638_valid :
    mulPoly ep_Q2_008_coefficient_27_1638
        ep_Q2_008_generator_27_1600_1699 =
      ep_Q2_008_partial_27_1638 := by
  native_decide

/-- Coefficient term 1639 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1639 : Poly :=
[
  term ((19034243457652093231884177834738198278457141 : Rat) / 2699321629621272246011853252143728875167968) [(6, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1639 for generator 27. -/
def ep_Q2_008_partial_27_1639 : Poly :=
[
  term ((19034243457652093231884177834738198278457141 : Rat) / 1349660814810636123005926626071864437583984) [(6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-19034243457652093231884177834738198278457141 : Rat) / 2699321629621272246011853252143728875167968) [(6, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1639 for generator 27. -/
theorem ep_Q2_008_partial_27_1639_valid :
    mulPoly ep_Q2_008_coefficient_27_1639
        ep_Q2_008_generator_27_1600_1699 =
      ep_Q2_008_partial_27_1639 := by
  native_decide

/-- Coefficient term 1640 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1640 : Poly :=
[
  term ((-34820262742433465563810785746010152409600 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (13, 2), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1640 for generator 27. -/
def ep_Q2_008_partial_27_1640 : Poly :=
[
  term ((34820262742433465563810785746010152409600 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-69640525484866931127621571492020304819200 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (13, 2), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1640 for generator 27. -/
theorem ep_Q2_008_partial_27_1640_valid :
    mulPoly ep_Q2_008_coefficient_27_1640
        ep_Q2_008_generator_27_1600_1699 =
      ep_Q2_008_partial_27_1640 := by
  native_decide

/-- Coefficient term 1641 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1641 : Poly :=
[
  term ((30574154284112501211 : Rat) / 5543651628913410872) [(6, 1), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 1641 for generator 27. -/
def ep_Q2_008_partial_27_1641 : Poly :=
[
  term ((-30574154284112501211 : Rat) / 5543651628913410872) [(6, 1), (13, 2), (14, 1), (16, 1)],
  term ((30574154284112501211 : Rat) / 2771825814456705436) [(6, 1), (13, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1641 for generator 27. -/
theorem ep_Q2_008_partial_27_1641_valid :
    mulPoly ep_Q2_008_coefficient_27_1641
        ep_Q2_008_generator_27_1600_1699 =
      ep_Q2_008_partial_27_1641 := by
  native_decide

/-- Coefficient term 1642 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1642 : Poly :=
[
  term ((-17524135103484972371733447032341327276800 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 1642 for generator 27. -/
def ep_Q2_008_partial_27_1642 : Poly :=
[
  term ((-35048270206969944743466894064682654553600 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((17524135103484972371733447032341327276800 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1642 for generator 27. -/
theorem ep_Q2_008_partial_27_1642_valid :
    mulPoly ep_Q2_008_coefficient_27_1642
        ep_Q2_008_generator_27_1600_1699 =
      ep_Q2_008_partial_27_1642 := by
  native_decide

/-- Coefficient term 1643 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1643 : Poly :=
[
  term ((31249562166813904419 : Rat) / 11087303257826821744) [(6, 1), (13, 2), (16, 1)]
]

/-- Partial product 1643 for generator 27. -/
def ep_Q2_008_partial_27_1643 : Poly :=
[
  term ((31249562166813904419 : Rat) / 5543651628913410872) [(6, 1), (13, 2), (14, 1), (16, 1)],
  term ((-31249562166813904419 : Rat) / 11087303257826821744) [(6, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1643 for generator 27. -/
theorem ep_Q2_008_partial_27_1643_valid :
    mulPoly ep_Q2_008_coefficient_27_1643
        ep_Q2_008_generator_27_1600_1699 =
      ep_Q2_008_partial_27_1643 := by
  native_decide

/-- Coefficient term 1644 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1644 : Poly :=
[
  term ((-4201465330826088668719012886041459123200 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (13, 3), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1644 for generator 27. -/
def ep_Q2_008_partial_27_1644 : Poly :=
[
  term ((4201465330826088668719012886041459123200 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-8402930661652177337438025772082918246400 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (13, 3), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1644 for generator 27. -/
theorem ep_Q2_008_partial_27_1644_valid :
    mulPoly ep_Q2_008_coefficient_27_1644
        ep_Q2_008_generator_27_1600_1699 =
      ep_Q2_008_partial_27_1644 := by
  native_decide

/-- Coefficient term 1645 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1645 : Poly :=
[
  term ((-40967981948210742584273260043675481600 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 1645 for generator 27. -/
def ep_Q2_008_partial_27_1645 : Poly :=
[
  term ((-81935963896421485168546520087350963200 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((40967981948210742584273260043675481600 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1645 for generator 27. -/
theorem ep_Q2_008_partial_27_1645_valid :
    mulPoly ep_Q2_008_coefficient_27_1645
        ep_Q2_008_generator_27_1600_1699 =
      ep_Q2_008_partial_27_1645 := by
  native_decide

/-- Coefficient term 1646 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1646 : Poly :=
[
  term ((20196228687940276989083986479503878576800 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1646 for generator 27. -/
def ep_Q2_008_partial_27_1646 : Poly :=
[
  term ((-20196228687940276989083986479503878576800 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (14, 1), (15, 2), (16, 1)],
  term ((40392457375880553978167972959007757153600 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1646 for generator 27. -/
theorem ep_Q2_008_partial_27_1646_valid :
    mulPoly ep_Q2_008_coefficient_27_1646
        ep_Q2_008_generator_27_1600_1699 =
      ep_Q2_008_partial_27_1646 := by
  native_decide

/-- Coefficient term 1647 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1647 : Poly :=
[
  term ((-1819895049170098075 : Rat) / 692956453614176359) [(6, 1), (14, 1), (16, 1)]
]

/-- Partial product 1647 for generator 27. -/
def ep_Q2_008_partial_27_1647 : Poly :=
[
  term ((1819895049170098075 : Rat) / 692956453614176359) [(6, 1), (14, 1), (16, 1)],
  term ((-3639790098340196150 : Rat) / 692956453614176359) [(6, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1647 for generator 27. -/
theorem ep_Q2_008_partial_27_1647_valid :
    mulPoly ep_Q2_008_coefficient_27_1647
        ep_Q2_008_generator_27_1600_1699 =
      ep_Q2_008_partial_27_1647 := by
  native_decide

/-- Coefficient term 1648 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1648 : Poly :=
[
  term ((10098114343970138494541993239751939288400 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (15, 2), (16, 1)]
]

/-- Partial product 1648 for generator 27. -/
def ep_Q2_008_partial_27_1648 : Poly :=
[
  term ((20196228687940276989083986479503878576800 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (14, 1), (15, 2), (16, 1)],
  term ((-10098114343970138494541993239751939288400 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1648 for generator 27. -/
theorem ep_Q2_008_partial_27_1648_valid :
    mulPoly ep_Q2_008_coefficient_27_1648
        ep_Q2_008_generator_27_1600_1699 =
      ep_Q2_008_partial_27_1648 := by
  native_decide

/-- Coefficient term 1649 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1649 : Poly :=
[
  term ((-1434007276915372075 : Rat) / 1385912907228352718) [(6, 1), (16, 1)]
]

/-- Partial product 1649 for generator 27. -/
def ep_Q2_008_partial_27_1649 : Poly :=
[
  term ((-1434007276915372075 : Rat) / 692956453614176359) [(6, 1), (14, 1), (16, 1)],
  term ((1434007276915372075 : Rat) / 1385912907228352718) [(6, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1649 for generator 27. -/
theorem ep_Q2_008_partial_27_1649_valid :
    mulPoly ep_Q2_008_coefficient_27_1649
        ep_Q2_008_generator_27_1600_1699 =
      ep_Q2_008_partial_27_1649 := by
  native_decide

/-- Coefficient term 1650 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1650 : Poly :=
[
  term ((21813405123651604351406039090813201634600 : Rat) / 84353800925664757687870414129491527348999) [(6, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 1650 for generator 27. -/
def ep_Q2_008_partial_27_1650 : Poly :=
[
  term ((43626810247303208702812078181626403269200 : Rat) / 84353800925664757687870414129491527348999) [(6, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-21813405123651604351406039090813201634600 : Rat) / 84353800925664757687870414129491527348999) [(6, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1650 for generator 27. -/
theorem ep_Q2_008_partial_27_1650_valid :
    mulPoly ep_Q2_008_coefficient_27_1650
        ep_Q2_008_generator_27_1600_1699 =
      ep_Q2_008_partial_27_1650 := by
  native_decide

/-- Coefficient term 1651 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1651 : Poly :=
[
  term ((7271135041217201450468679696937733878200 : Rat) / 84353800925664757687870414129491527348999) [(6, 2), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1651 for generator 27. -/
def ep_Q2_008_partial_27_1651 : Poly :=
[
  term ((14542270082434402900937359393875467756400 : Rat) / 84353800925664757687870414129491527348999) [(6, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-7271135041217201450468679696937733878200 : Rat) / 84353800925664757687870414129491527348999) [(6, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1651 for generator 27. -/
theorem ep_Q2_008_partial_27_1651_valid :
    mulPoly ep_Q2_008_coefficient_27_1651
        ep_Q2_008_generator_27_1600_1699 =
      ep_Q2_008_partial_27_1651 := by
  native_decide

/-- Coefficient term 1652 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1652 : Poly :=
[
  term ((-8110033763837583697428084534229865110200 : Rat) / 84353800925664757687870414129491527348999) [(6, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1652 for generator 27. -/
def ep_Q2_008_partial_27_1652 : Poly :=
[
  term ((8110033763837583697428084534229865110200 : Rat) / 84353800925664757687870414129491527348999) [(6, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-16220067527675167394856169068459730220400 : Rat) / 84353800925664757687870414129491527348999) [(6, 2), (13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1652 for generator 27. -/
theorem ep_Q2_008_partial_27_1652_valid :
    mulPoly ep_Q2_008_coefficient_27_1652
        ep_Q2_008_generator_27_1600_1699 =
      ep_Q2_008_partial_27_1652 := by
  native_decide

/-- Coefficient term 1653 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1653 : Poly :=
[
  term ((-4055016881918791848714042267114932555100 : Rat) / 84353800925664757687870414129491527348999) [(6, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1653 for generator 27. -/
def ep_Q2_008_partial_27_1653 : Poly :=
[
  term ((-8110033763837583697428084534229865110200 : Rat) / 84353800925664757687870414129491527348999) [(6, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((4055016881918791848714042267114932555100 : Rat) / 84353800925664757687870414129491527348999) [(6, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1653 for generator 27. -/
theorem ep_Q2_008_partial_27_1653_valid :
    mulPoly ep_Q2_008_coefficient_27_1653
        ep_Q2_008_generator_27_1600_1699 =
      ep_Q2_008_partial_27_1653 := by
  native_decide

/-- Coefficient term 1654 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1654 : Poly :=
[
  term ((-173144211303063375 : Rat) / 692956453614176359) [(6, 2), (14, 1), (16, 1)]
]

/-- Partial product 1654 for generator 27. -/
def ep_Q2_008_partial_27_1654 : Poly :=
[
  term ((173144211303063375 : Rat) / 692956453614176359) [(6, 2), (14, 1), (16, 1)],
  term ((-346288422606126750 : Rat) / 692956453614176359) [(6, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1654 for generator 27. -/
theorem ep_Q2_008_partial_27_1654_valid :
    mulPoly ep_Q2_008_coefficient_27_1654
        ep_Q2_008_generator_27_1600_1699 =
      ep_Q2_008_partial_27_1654 := by
  native_decide

/-- Coefficient term 1655 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1655 : Poly :=
[
  term ((-173144211303063375 : Rat) / 1385912907228352718) [(6, 2), (16, 1)]
]

/-- Partial product 1655 for generator 27. -/
def ep_Q2_008_partial_27_1655 : Poly :=
[
  term ((-173144211303063375 : Rat) / 692956453614176359) [(6, 2), (14, 1), (16, 1)],
  term ((173144211303063375 : Rat) / 1385912907228352718) [(6, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1655 for generator 27. -/
theorem ep_Q2_008_partial_27_1655_valid :
    mulPoly ep_Q2_008_coefficient_27_1655
        ep_Q2_008_generator_27_1600_1699 =
      ep_Q2_008_partial_27_1655 := by
  native_decide

/-- Coefficient term 1656 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1656 : Poly :=
[
  term ((-3335197780739038211317658262354644332800 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1656 for generator 27. -/
def ep_Q2_008_partial_27_1656 : Poly :=
[
  term ((-6670395561478076422635316524709288665600 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((3335197780739038211317658262354644332800 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1656 for generator 27. -/
theorem ep_Q2_008_partial_27_1656_valid :
    mulPoly ep_Q2_008_coefficient_27_1656
        ep_Q2_008_generator_27_1600_1699 =
      ep_Q2_008_partial_27_1656 := by
  native_decide

/-- Coefficient term 1657 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1657 : Poly :=
[
  term ((-14293661141217672000 : Rat) / 692956453614176359) [(7, 1), (10, 1), (11, 1), (13, 2), (16, 1)]
]

/-- Partial product 1657 for generator 27. -/
def ep_Q2_008_partial_27_1657 : Poly :=
[
  term ((-28587322282435344000 : Rat) / 692956453614176359) [(7, 1), (10, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((14293661141217672000 : Rat) / 692956453614176359) [(7, 1), (10, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1657 for generator 27. -/
theorem ep_Q2_008_partial_27_1657_valid :
    mulPoly ep_Q2_008_coefficient_27_1657
        ep_Q2_008_generator_27_1600_1699 =
      ep_Q2_008_partial_27_1657 := by
  native_decide

/-- Coefficient term 1658 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1658 : Poly :=
[
  term ((-1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (10, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 1658 for generator 27. -/
def ep_Q2_008_partial_27_1658 : Poly :=
[
  term ((-2366596089097314813815965124265084211200 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (10, 1), (11, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (10, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1658 for generator 27. -/
theorem ep_Q2_008_partial_27_1658_valid :
    mulPoly ep_Q2_008_coefficient_27_1658
        ep_Q2_008_generator_27_1600_1699 =
      ep_Q2_008_partial_27_1658 := by
  native_decide

/-- Coefficient term 1659 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1659 : Poly :=
[
  term ((-3877804354664514375 : Rat) / 1385912907228352718) [(7, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 1659 for generator 27. -/
def ep_Q2_008_partial_27_1659 : Poly :=
[
  term ((-3877804354664514375 : Rat) / 692956453614176359) [(7, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((3877804354664514375 : Rat) / 1385912907228352718) [(7, 1), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1659 for generator 27. -/
theorem ep_Q2_008_partial_27_1659_valid :
    mulPoly ep_Q2_008_coefficient_27_1659
        ep_Q2_008_generator_27_1600_1699 =
      ep_Q2_008_partial_27_1659 := by
  native_decide

/-- Coefficient term 1660 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1660 : Poly :=
[
  term ((364938985264381623 : Rat) / 2771825814456705436) [(7, 1), (10, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 1660 for generator 27. -/
def ep_Q2_008_partial_27_1660 : Poly :=
[
  term ((364938985264381623 : Rat) / 1385912907228352718) [(7, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-364938985264381623 : Rat) / 2771825814456705436) [(7, 1), (10, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1660 for generator 27. -/
theorem ep_Q2_008_partial_27_1660_valid :
    mulPoly ep_Q2_008_coefficient_27_1660
        ep_Q2_008_generator_27_1600_1699 =
      ep_Q2_008_partial_27_1660 := by
  native_decide

/-- Coefficient term 1661 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1661 : Poly :=
[
  term ((1843367721265631962653173246630448000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (10, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 1661 for generator 27. -/
def ep_Q2_008_partial_27_1661 : Poly :=
[
  term ((3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (10, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1843367721265631962653173246630448000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (10, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1661 for generator 27. -/
theorem ep_Q2_008_partial_27_1661_valid :
    mulPoly ep_Q2_008_coefficient_27_1661
        ep_Q2_008_generator_27_1600_1699 =
      ep_Q2_008_partial_27_1661 := by
  native_decide

/-- Coefficient term 1662 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1662 : Poly :=
[
  term ((-5402428811566164000 : Rat) / 692956453614176359) [(7, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1662 for generator 27. -/
def ep_Q2_008_partial_27_1662 : Poly :=
[
  term ((-10804857623132328000 : Rat) / 692956453614176359) [(7, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((5402428811566164000 : Rat) / 692956453614176359) [(7, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1662 for generator 27. -/
theorem ep_Q2_008_partial_27_1662_valid :
    mulPoly ep_Q2_008_coefficient_27_1662
        ep_Q2_008_generator_27_1600_1699 =
      ep_Q2_008_partial_27_1662 := by
  native_decide

/-- Coefficient term 1663 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1663 : Poly :=
[
  term ((-3087102178037808000 : Rat) / 692956453614176359) [(7, 1), (10, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1663 for generator 27. -/
def ep_Q2_008_partial_27_1663 : Poly :=
[
  term ((3087102178037808000 : Rat) / 692956453614176359) [(7, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-6174204356075616000 : Rat) / 692956453614176359) [(7, 1), (10, 1), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1663 for generator 27. -/
theorem ep_Q2_008_partial_27_1663_valid :
    mulPoly ep_Q2_008_coefficient_27_1663
        ep_Q2_008_generator_27_1600_1699 =
      ep_Q2_008_partial_27_1663 := by
  native_decide

/-- Coefficient term 1664 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1664 : Poly :=
[
  term ((-646969211572073972408514544763255299200 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (10, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 1664 for generator 27. -/
def ep_Q2_008_partial_27_1664 : Poly :=
[
  term ((-1293938423144147944817029089526510598400 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (10, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((646969211572073972408514544763255299200 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (10, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1664 for generator 27. -/
theorem ep_Q2_008_partial_27_1664_valid :
    mulPoly ep_Q2_008_coefficient_27_1664
        ep_Q2_008_generator_27_1600_1699 =
      ep_Q2_008_partial_27_1664 := by
  native_decide

/-- Coefficient term 1665 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1665 : Poly :=
[
  term ((1225362027883269627 : Rat) / 47790100249253542) [(7, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 1665 for generator 27. -/
def ep_Q2_008_partial_27_1665 : Poly :=
[
  term ((1225362027883269627 : Rat) / 23895050124626771) [(7, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1225362027883269627 : Rat) / 47790100249253542) [(7, 1), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1665 for generator 27. -/
theorem ep_Q2_008_partial_27_1665_valid :
    mulPoly ep_Q2_008_coefficient_27_1665
        ep_Q2_008_generator_27_1600_1699 =
      ep_Q2_008_partial_27_1665 := by
  native_decide

/-- Coefficient term 1666 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1666 : Poly :=
[
  term ((-10781697255770350754105124798214141363200 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 1666 for generator 27. -/
def ep_Q2_008_partial_27_1666 : Poly :=
[
  term ((-21563394511540701508210249596428282726400 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (10, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((10781697255770350754105124798214141363200 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1666 for generator 27. -/
theorem ep_Q2_008_partial_27_1666_valid :
    mulPoly ep_Q2_008_coefficient_27_1666
        ep_Q2_008_generator_27_1600_1699 =
      ep_Q2_008_partial_27_1666 := by
  native_decide

/-- Coefficient term 1667 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1667 : Poly :=
[
  term ((1094816955793144869 : Rat) / 692956453614176359) [(7, 1), (10, 1), (13, 3), (16, 1)]
]

/-- Partial product 1667 for generator 27. -/
def ep_Q2_008_partial_27_1667 : Poly :=
[
  term ((2189633911586289738 : Rat) / 692956453614176359) [(7, 1), (10, 1), (13, 3), (14, 1), (16, 1)],
  term ((-1094816955793144869 : Rat) / 692956453614176359) [(7, 1), (10, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1667 for generator 27. -/
theorem ep_Q2_008_partial_27_1667_valid :
    mulPoly ep_Q2_008_coefficient_27_1667
        ep_Q2_008_generator_27_1600_1699 =
      ep_Q2_008_partial_27_1667 := by
  native_decide

/-- Coefficient term 1668 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1668 : Poly :=
[
  term ((22120412655187583551838078959565376000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (10, 1), (13, 4), (15, 1), (16, 1)]
]

/-- Partial product 1668 for generator 27. -/
def ep_Q2_008_partial_27_1668 : Poly :=
[
  term ((44240825310375167103676157919130752000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (10, 1), (13, 4), (14, 1), (15, 1), (16, 1)],
  term ((-22120412655187583551838078959565376000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (10, 1), (13, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1668 for generator 27. -/
theorem ep_Q2_008_partial_27_1668_valid :
    mulPoly ep_Q2_008_coefficient_27_1668
        ep_Q2_008_generator_27_1600_1699 =
      ep_Q2_008_partial_27_1668 := by
  native_decide

/-- Coefficient term 1669 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1669 : Poly :=
[
  term ((984019040588212772912139073875863587608921 : Rat) / 337415203702659030751481656517966109395996) [(7, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 1669 for generator 27. -/
def ep_Q2_008_partial_27_1669 : Poly :=
[
  term ((984019040588212772912139073875863587608921 : Rat) / 168707601851329515375740828258983054697998) [(7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-984019040588212772912139073875863587608921 : Rat) / 337415203702659030751481656517966109395996) [(7, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1669 for generator 27. -/
theorem ep_Q2_008_partial_27_1669_valid :
    mulPoly ep_Q2_008_coefficient_27_1669
        ep_Q2_008_generator_27_1600_1699 =
      ep_Q2_008_partial_27_1669 := by
  native_decide

/-- Coefficient term 1670 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1670 : Poly :=
[
  term ((-6945979900585068000 : Rat) / 692956453614176359) [(7, 1), (10, 2), (13, 1), (16, 1)]
]

/-- Partial product 1670 for generator 27. -/
def ep_Q2_008_partial_27_1670 : Poly :=
[
  term ((-13891959801170136000 : Rat) / 692956453614176359) [(7, 1), (10, 2), (13, 1), (14, 1), (16, 1)],
  term ((6945979900585068000 : Rat) / 692956453614176359) [(7, 1), (10, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1670 for generator 27. -/
theorem ep_Q2_008_partial_27_1670_valid :
    mulPoly ep_Q2_008_coefficient_27_1670
        ep_Q2_008_generator_27_1600_1699 =
      ep_Q2_008_partial_27_1670 := by
  native_decide

/-- Coefficient term 1671 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1671 : Poly :=
[
  term ((-1159078781772528392421312427990215063417600 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1671 for generator 27. -/
def ep_Q2_008_partial_27_1671 : Poly :=
[
  term ((-2318157563545056784842624855980430126835200 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1159078781772528392421312427990215063417600 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1671 for generator 27. -/
theorem ep_Q2_008_partial_27_1671_valid :
    mulPoly ep_Q2_008_coefficient_27_1671
        ep_Q2_008_generator_27_1600_1699 =
      ep_Q2_008_partial_27_1671 := by
  native_decide

/-- Coefficient term 1672 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1672 : Poly :=
[
  term ((-788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (11, 1), (12, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 1672 for generator 27. -/
def ep_Q2_008_partial_27_1672 : Poly :=
[
  term ((-1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (11, 1), (12, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (11, 1), (12, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1672 for generator 27. -/
theorem ep_Q2_008_partial_27_1672_valid :
    mulPoly ep_Q2_008_coefficient_27_1672
        ep_Q2_008_generator_27_1600_1699 =
      ep_Q2_008_partial_27_1672 := by
  native_decide

/-- Coefficient term 1673 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1673 : Poly :=
[
  term ((-1094816955793144869 : Rat) / 692956453614176359) [(7, 1), (11, 1), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 1673 for generator 27. -/
def ep_Q2_008_partial_27_1673 : Poly :=
[
  term ((-2189633911586289738 : Rat) / 692956453614176359) [(7, 1), (11, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((1094816955793144869 : Rat) / 692956453614176359) [(7, 1), (11, 1), (12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1673 for generator 27. -/
theorem ep_Q2_008_partial_27_1673_valid :
    mulPoly ep_Q2_008_coefficient_27_1673
        ep_Q2_008_generator_27_1600_1699 =
      ep_Q2_008_partial_27_1673 := by
  native_decide

/-- Coefficient term 1674 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1674 : Poly :=
[
  term ((-22120412655187583551838078959565376000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 1674 for generator 27. -/
def ep_Q2_008_partial_27_1674 : Poly :=
[
  term ((-44240825310375167103676157919130752000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (11, 1), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((22120412655187583551838078959565376000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1674 for generator 27. -/
theorem ep_Q2_008_partial_27_1674_valid :
    mulPoly ep_Q2_008_coefficient_27_1674
        ep_Q2_008_generator_27_1600_1699 =
      ep_Q2_008_partial_27_1674 := by
  native_decide

/-- Coefficient term 1675 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1675 : Poly :=
[
  term ((-1231691952427017417874009601032497148800 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (11, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1675 for generator 27. -/
def ep_Q2_008_partial_27_1675 : Poly :=
[
  term ((-2463383904854034835748019202064994297600 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((1231691952427017417874009601032497148800 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (11, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1675 for generator 27. -/
theorem ep_Q2_008_partial_27_1675_valid :
    mulPoly ep_Q2_008_coefficient_27_1675
        ep_Q2_008_generator_27_1600_1699 =
      ep_Q2_008_partial_27_1675 := by
  native_decide

/-- Coefficient term 1676 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1676 : Poly :=
[
  term ((-17108693446828297347 : Rat) / 2771825814456705436) [(7, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 1676 for generator 27. -/
def ep_Q2_008_partial_27_1676 : Poly :=
[
  term ((-17108693446828297347 : Rat) / 1385912907228352718) [(7, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((17108693446828297347 : Rat) / 2771825814456705436) [(7, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1676 for generator 27. -/
theorem ep_Q2_008_partial_27_1676_valid :
    mulPoly ep_Q2_008_coefficient_27_1676
        ep_Q2_008_generator_27_1600_1699 =
      ep_Q2_008_partial_27_1676 := by
  native_decide

/-- Coefficient term 1677 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1677 : Poly :=
[
  term ((1843367721265631962653173246630448000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1677 for generator 27. -/
def ep_Q2_008_partial_27_1677 : Poly :=
[
  term ((3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (11, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1843367721265631962653173246630448000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1677 for generator 27. -/
theorem ep_Q2_008_partial_27_1677_valid :
    mulPoly ep_Q2_008_coefficient_27_1677
        ep_Q2_008_generator_27_1600_1699 =
      ep_Q2_008_partial_27_1677 := by
  native_decide

/-- Coefficient term 1678 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1678 : Poly :=
[
  term ((364938985264381623 : Rat) / 2771825814456705436) [(7, 1), (11, 1), (12, 2), (16, 1)]
]

/-- Partial product 1678 for generator 27. -/
def ep_Q2_008_partial_27_1678 : Poly :=
[
  term ((364938985264381623 : Rat) / 1385912907228352718) [(7, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((-364938985264381623 : Rat) / 2771825814456705436) [(7, 1), (11, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1678 for generator 27. -/
theorem ep_Q2_008_partial_27_1678_valid :
    mulPoly ep_Q2_008_coefficient_27_1678
        ep_Q2_008_generator_27_1600_1699 =
      ep_Q2_008_partial_27_1678 := by
  native_decide

/-- Coefficient term 1679 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1679 : Poly :=
[
  term ((-2103678354921880952906629194800874844800 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1679 for generator 27. -/
def ep_Q2_008_partial_27_1679 : Poly :=
[
  term ((2103678354921880952906629194800874844800 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4207356709843761905813258389601749689600 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1679 for generator 27. -/
theorem ep_Q2_008_partial_27_1679_valid :
    mulPoly ep_Q2_008_coefficient_27_1679
        ep_Q2_008_generator_27_1600_1699 =
      ep_Q2_008_partial_27_1679 := by
  native_decide

/-- Coefficient term 1680 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1680 : Poly :=
[
  term ((-1051839177460940476453314597400437422400 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1680 for generator 27. -/
def ep_Q2_008_partial_27_1680 : Poly :=
[
  term ((-2103678354921880952906629194800874844800 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1051839177460940476453314597400437422400 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1680 for generator 27. -/
theorem ep_Q2_008_partial_27_1680_valid :
    mulPoly ep_Q2_008_coefficient_27_1680
        ep_Q2_008_generator_27_1600_1699 =
      ep_Q2_008_partial_27_1680 := by
  native_decide

/-- Coefficient term 1681 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1681 : Poly :=
[
  term ((-14293661141217672000 : Rat) / 692956453614176359) [(7, 1), (11, 1), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 1681 for generator 27. -/
def ep_Q2_008_partial_27_1681 : Poly :=
[
  term ((14293661141217672000 : Rat) / 692956453614176359) [(7, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-28587322282435344000 : Rat) / 692956453614176359) [(7, 1), (11, 1), (13, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1681 for generator 27. -/
theorem ep_Q2_008_partial_27_1681_valid :
    mulPoly ep_Q2_008_coefficient_27_1681
        ep_Q2_008_generator_27_1600_1699 =
      ep_Q2_008_partial_27_1681 := by
  native_decide

/-- Coefficient term 1682 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1682 : Poly :=
[
  term ((-7146830570608836000 : Rat) / 692956453614176359) [(7, 1), (11, 1), (13, 2), (16, 1)]
]

/-- Partial product 1682 for generator 27. -/
def ep_Q2_008_partial_27_1682 : Poly :=
[
  term ((-14293661141217672000 : Rat) / 692956453614176359) [(7, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((7146830570608836000 : Rat) / 692956453614176359) [(7, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1682 for generator 27. -/
theorem ep_Q2_008_partial_27_1682_valid :
    mulPoly ep_Q2_008_coefficient_27_1682
        ep_Q2_008_generator_27_1600_1699 =
      ep_Q2_008_partial_27_1682 := by
  native_decide

/-- Coefficient term 1683 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1683 : Poly :=
[
  term ((-1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (11, 1), (13, 3), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1683 for generator 27. -/
def ep_Q2_008_partial_27_1683 : Poly :=
[
  term ((1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (11, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-2366596089097314813815965124265084211200 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (11, 1), (13, 3), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1683 for generator 27. -/
theorem ep_Q2_008_partial_27_1683_valid :
    mulPoly ep_Q2_008_coefficient_27_1683
        ep_Q2_008_generator_27_1600_1699 =
      ep_Q2_008_partial_27_1683 := by
  native_decide

/-- Coefficient term 1684 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1684 : Poly :=
[
  term ((-591649022274328703453991281066271052800 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 1684 for generator 27. -/
def ep_Q2_008_partial_27_1684 : Poly :=
[
  term ((-1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (11, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((591649022274328703453991281066271052800 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1684 for generator 27. -/
theorem ep_Q2_008_partial_27_1684_valid :
    mulPoly ep_Q2_008_coefficient_27_1684
        ep_Q2_008_generator_27_1600_1699 =
      ep_Q2_008_partial_27_1684 := by
  native_decide

/-- Coefficient term 1685 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1685 : Poly :=
[
  term ((234883624037139000 : Rat) / 692956453614176359) [(7, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 1685 for generator 27. -/
def ep_Q2_008_partial_27_1685 : Poly :=
[
  term ((-234883624037139000 : Rat) / 692956453614176359) [(7, 1), (11, 1), (14, 1), (16, 1)],
  term ((469767248074278000 : Rat) / 692956453614176359) [(7, 1), (11, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1685 for generator 27. -/
theorem ep_Q2_008_partial_27_1685_valid :
    mulPoly ep_Q2_008_coefficient_27_1685
        ep_Q2_008_generator_27_1600_1699 =
      ep_Q2_008_partial_27_1685 := by
  native_decide

/-- Coefficient term 1686 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1686 : Poly :=
[
  term ((-136839173711010750 : Rat) / 692956453614176359) [(7, 1), (11, 1), (16, 1)]
]

/-- Partial product 1686 for generator 27. -/
def ep_Q2_008_partial_27_1686 : Poly :=
[
  term ((-273678347422021500 : Rat) / 692956453614176359) [(7, 1), (11, 1), (14, 1), (16, 1)],
  term ((136839173711010750 : Rat) / 692956453614176359) [(7, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1686 for generator 27. -/
theorem ep_Q2_008_partial_27_1686_valid :
    mulPoly ep_Q2_008_coefficient_27_1686
        ep_Q2_008_generator_27_1600_1699 =
      ep_Q2_008_partial_27_1686 := by
  native_decide

/-- Coefficient term 1687 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1687 : Poly :=
[
  term ((-364938985264381623 : Rat) / 692956453614176359) [(7, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1687 for generator 27. -/
def ep_Q2_008_partial_27_1687 : Poly :=
[
  term ((364938985264381623 : Rat) / 692956453614176359) [(7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-729877970528763246 : Rat) / 692956453614176359) [(7, 1), (12, 1), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1687 for generator 27. -/
theorem ep_Q2_008_partial_27_1687_valid :
    mulPoly ep_Q2_008_coefficient_27_1687
        ep_Q2_008_generator_27_1600_1699 =
      ep_Q2_008_partial_27_1687 := by
  native_decide

/-- Coefficient term 1688 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1688 : Poly :=
[
  term ((-233788651487954081202973310251158145383315 : Rat) / 168707601851329515375740828258983054697998) [(7, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 1688 for generator 27. -/
def ep_Q2_008_partial_27_1688 : Poly :=
[
  term ((-233788651487954081202973310251158145383315 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((233788651487954081202973310251158145383315 : Rat) / 168707601851329515375740828258983054697998) [(7, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1688 for generator 27. -/
theorem ep_Q2_008_partial_27_1688_valid :
    mulPoly ep_Q2_008_coefficient_27_1688
        ep_Q2_008_generator_27_1600_1699 =
      ep_Q2_008_partial_27_1688 := by
  native_decide

/-- Coefficient term 1689 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1689 : Poly :=
[
  term ((-72911131077253149 : Rat) / 382320801994028336) [(7, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 1689 for generator 27. -/
def ep_Q2_008_partial_27_1689 : Poly :=
[
  term ((-72911131077253149 : Rat) / 191160400997014168) [(7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((72911131077253149 : Rat) / 382320801994028336) [(7, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1689 for generator 27. -/
theorem ep_Q2_008_partial_27_1689_valid :
    mulPoly ep_Q2_008_coefficient_27_1689
        ep_Q2_008_generator_27_1600_1699 =
      ep_Q2_008_partial_27_1689 := by
  native_decide

/-- Coefficient term 1690 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1690 : Poly :=
[
  term ((-7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1690 for generator 27. -/
def ep_Q2_008_partial_27_1690 : Poly :=
[
  term ((7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (12, 1), (13, 2), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1690 for generator 27. -/
theorem ep_Q2_008_partial_27_1690_valid :
    mulPoly ep_Q2_008_coefficient_27_1690
        ep_Q2_008_generator_27_1600_1699 =
      ep_Q2_008_partial_27_1690 := by
  native_decide

/-- Coefficient term 1691 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1691 : Poly :=
[
  term ((-137118086289832470497779332597827695631109 : Rat) / 674830407405318061502963313035932218791992) [(7, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 1691 for generator 27. -/
def ep_Q2_008_partial_27_1691 : Poly :=
[
  term ((-137118086289832470497779332597827695631109 : Rat) / 337415203702659030751481656517966109395996) [(7, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((137118086289832470497779332597827695631109 : Rat) / 674830407405318061502963313035932218791992) [(7, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1691 for generator 27. -/
theorem ep_Q2_008_partial_27_1691_valid :
    mulPoly ep_Q2_008_coefficient_27_1691
        ep_Q2_008_generator_27_1600_1699 =
      ep_Q2_008_partial_27_1691 := by
  native_decide

/-- Coefficient term 1692 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1692 : Poly :=
[
  term ((-18433677212656319626531732466304480000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (12, 1), (13, 2), (15, 3), (16, 1)]
]

/-- Partial product 1692 for generator 27. -/
def ep_Q2_008_partial_27_1692 : Poly :=
[
  term ((-36867354425312639253063464932608960000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (12, 1), (13, 2), (14, 1), (15, 3), (16, 1)],
  term ((18433677212656319626531732466304480000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (12, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1692 for generator 27. -/
theorem ep_Q2_008_partial_27_1692_valid :
    mulPoly ep_Q2_008_coefficient_27_1692
        ep_Q2_008_generator_27_1600_1699 =
      ep_Q2_008_partial_27_1692 := by
  native_decide

/-- Coefficient term 1693 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1693 : Poly :=
[
  term ((-2765051581898447943979759869945672000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (12, 1), (13, 3), (15, 2), (16, 1)]
]

/-- Partial product 1693 for generator 27. -/
def ep_Q2_008_partial_27_1693 : Poly :=
[
  term ((-5530103163796895887959519739891344000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (12, 1), (13, 3), (14, 1), (15, 2), (16, 1)],
  term ((2765051581898447943979759869945672000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (12, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1693 for generator 27. -/
theorem ep_Q2_008_partial_27_1693_valid :
    mulPoly ep_Q2_008_coefficient_27_1693
        ep_Q2_008_generator_27_1600_1699 =
      ep_Q2_008_partial_27_1693 := by
  native_decide

/-- Coefficient term 1694 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1694 : Poly :=
[
  term ((-16422254336897173035 : Rat) / 2771825814456705436) [(7, 1), (12, 1), (13, 3), (16, 1)]
]

/-- Partial product 1694 for generator 27. -/
def ep_Q2_008_partial_27_1694 : Poly :=
[
  term ((-16422254336897173035 : Rat) / 1385912907228352718) [(7, 1), (12, 1), (13, 3), (14, 1), (16, 1)],
  term ((16422254336897173035 : Rat) / 2771825814456705436) [(7, 1), (12, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1694 for generator 27. -/
theorem ep_Q2_008_partial_27_1694_valid :
    mulPoly ep_Q2_008_coefficient_27_1694
        ep_Q2_008_generator_27_1600_1699 =
      ep_Q2_008_partial_27_1694 := by
  native_decide

/-- Coefficient term 1695 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1695 : Poly :=
[
  term ((-82951547456953438319392796098370160000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (12, 1), (13, 4), (15, 1), (16, 1)]
]

/-- Partial product 1695 for generator 27. -/
def ep_Q2_008_partial_27_1695 : Poly :=
[
  term ((-165903094913906876638785592196740320000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (12, 1), (13, 4), (14, 1), (15, 1), (16, 1)],
  term ((82951547456953438319392796098370160000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (12, 1), (13, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1695 for generator 27. -/
theorem ep_Q2_008_partial_27_1695_valid :
    mulPoly ep_Q2_008_coefficient_27_1695
        ep_Q2_008_generator_27_1600_1699 =
      ep_Q2_008_partial_27_1695 := by
  native_decide

/-- Coefficient term 1696 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1696 : Poly :=
[
  term ((16146730867452568432565339674400400 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1696 for generator 27. -/
def ep_Q2_008_partial_27_1696 : Poly :=
[
  term ((-16146730867452568432565339674400400 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((32293461734905136865130679348800800 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (12, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1696 for generator 27. -/
theorem ep_Q2_008_partial_27_1696_valid :
    mulPoly ep_Q2_008_coefficient_27_1696
        ep_Q2_008_generator_27_1600_1699 =
      ep_Q2_008_partial_27_1696 := by
  native_decide

/-- Coefficient term 1697 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1697 : Poly :=
[
  term ((-12007828009139946943836748371970917825446679 : Rat) / 2699321629621272246011853252143728875167968) [(7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1697 for generator 27. -/
def ep_Q2_008_partial_27_1697 : Poly :=
[
  term ((-12007828009139946943836748371970917825446679 : Rat) / 1349660814810636123005926626071864437583984) [(7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((12007828009139946943836748371970917825446679 : Rat) / 2699321629621272246011853252143728875167968) [(7, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1697 for generator 27. -/
theorem ep_Q2_008_partial_27_1697_valid :
    mulPoly ep_Q2_008_coefficient_27_1697
        ep_Q2_008_generator_27_1600_1699 =
      ep_Q2_008_partial_27_1697 := by
  native_decide

/-- Coefficient term 1698 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1698 : Poly :=
[
  term ((-190887572837713679829579272472374400 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (12, 1), (15, 3), (16, 1)]
]

/-- Partial product 1698 for generator 27. -/
def ep_Q2_008_partial_27_1698 : Poly :=
[
  term ((-381775145675427359659158544944748800 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((190887572837713679829579272472374400 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1698 for generator 27. -/
theorem ep_Q2_008_partial_27_1698_valid :
    mulPoly ep_Q2_008_coefficient_27_1698
        ep_Q2_008_generator_27_1600_1699 =
      ep_Q2_008_partial_27_1698 := by
  native_decide

/-- Coefficient term 1699 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1699 : Poly :=
[
  term ((5530103163796895887959519739891344000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (12, 2), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 1699 for generator 27. -/
def ep_Q2_008_partial_27_1699 : Poly :=
[
  term ((11060206327593791775919039479782688000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (12, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-5530103163796895887959519739891344000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (12, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1699 for generator 27. -/
theorem ep_Q2_008_partial_27_1699_valid :
    mulPoly ep_Q2_008_coefficient_27_1699
        ep_Q2_008_generator_27_1600_1699 =
      ep_Q2_008_partial_27_1699 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_008_partials_27_1600_1699 : List Poly :=
[
  ep_Q2_008_partial_27_1600,
  ep_Q2_008_partial_27_1601,
  ep_Q2_008_partial_27_1602,
  ep_Q2_008_partial_27_1603,
  ep_Q2_008_partial_27_1604,
  ep_Q2_008_partial_27_1605,
  ep_Q2_008_partial_27_1606,
  ep_Q2_008_partial_27_1607,
  ep_Q2_008_partial_27_1608,
  ep_Q2_008_partial_27_1609,
  ep_Q2_008_partial_27_1610,
  ep_Q2_008_partial_27_1611,
  ep_Q2_008_partial_27_1612,
  ep_Q2_008_partial_27_1613,
  ep_Q2_008_partial_27_1614,
  ep_Q2_008_partial_27_1615,
  ep_Q2_008_partial_27_1616,
  ep_Q2_008_partial_27_1617,
  ep_Q2_008_partial_27_1618,
  ep_Q2_008_partial_27_1619,
  ep_Q2_008_partial_27_1620,
  ep_Q2_008_partial_27_1621,
  ep_Q2_008_partial_27_1622,
  ep_Q2_008_partial_27_1623,
  ep_Q2_008_partial_27_1624,
  ep_Q2_008_partial_27_1625,
  ep_Q2_008_partial_27_1626,
  ep_Q2_008_partial_27_1627,
  ep_Q2_008_partial_27_1628,
  ep_Q2_008_partial_27_1629,
  ep_Q2_008_partial_27_1630,
  ep_Q2_008_partial_27_1631,
  ep_Q2_008_partial_27_1632,
  ep_Q2_008_partial_27_1633,
  ep_Q2_008_partial_27_1634,
  ep_Q2_008_partial_27_1635,
  ep_Q2_008_partial_27_1636,
  ep_Q2_008_partial_27_1637,
  ep_Q2_008_partial_27_1638,
  ep_Q2_008_partial_27_1639,
  ep_Q2_008_partial_27_1640,
  ep_Q2_008_partial_27_1641,
  ep_Q2_008_partial_27_1642,
  ep_Q2_008_partial_27_1643,
  ep_Q2_008_partial_27_1644,
  ep_Q2_008_partial_27_1645,
  ep_Q2_008_partial_27_1646,
  ep_Q2_008_partial_27_1647,
  ep_Q2_008_partial_27_1648,
  ep_Q2_008_partial_27_1649,
  ep_Q2_008_partial_27_1650,
  ep_Q2_008_partial_27_1651,
  ep_Q2_008_partial_27_1652,
  ep_Q2_008_partial_27_1653,
  ep_Q2_008_partial_27_1654,
  ep_Q2_008_partial_27_1655,
  ep_Q2_008_partial_27_1656,
  ep_Q2_008_partial_27_1657,
  ep_Q2_008_partial_27_1658,
  ep_Q2_008_partial_27_1659,
  ep_Q2_008_partial_27_1660,
  ep_Q2_008_partial_27_1661,
  ep_Q2_008_partial_27_1662,
  ep_Q2_008_partial_27_1663,
  ep_Q2_008_partial_27_1664,
  ep_Q2_008_partial_27_1665,
  ep_Q2_008_partial_27_1666,
  ep_Q2_008_partial_27_1667,
  ep_Q2_008_partial_27_1668,
  ep_Q2_008_partial_27_1669,
  ep_Q2_008_partial_27_1670,
  ep_Q2_008_partial_27_1671,
  ep_Q2_008_partial_27_1672,
  ep_Q2_008_partial_27_1673,
  ep_Q2_008_partial_27_1674,
  ep_Q2_008_partial_27_1675,
  ep_Q2_008_partial_27_1676,
  ep_Q2_008_partial_27_1677,
  ep_Q2_008_partial_27_1678,
  ep_Q2_008_partial_27_1679,
  ep_Q2_008_partial_27_1680,
  ep_Q2_008_partial_27_1681,
  ep_Q2_008_partial_27_1682,
  ep_Q2_008_partial_27_1683,
  ep_Q2_008_partial_27_1684,
  ep_Q2_008_partial_27_1685,
  ep_Q2_008_partial_27_1686,
  ep_Q2_008_partial_27_1687,
  ep_Q2_008_partial_27_1688,
  ep_Q2_008_partial_27_1689,
  ep_Q2_008_partial_27_1690,
  ep_Q2_008_partial_27_1691,
  ep_Q2_008_partial_27_1692,
  ep_Q2_008_partial_27_1693,
  ep_Q2_008_partial_27_1694,
  ep_Q2_008_partial_27_1695,
  ep_Q2_008_partial_27_1696,
  ep_Q2_008_partial_27_1697,
  ep_Q2_008_partial_27_1698,
  ep_Q2_008_partial_27_1699
]

/-- Sum of partial products in this block. -/
def ep_Q2_008_block_27_1600_1699 : Poly :=
[
  term ((13891959801170136000 : Rat) / 692956453614176359) [(6, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-6945979900585068000 : Rat) / 692956453614176359) [(6, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((4630653267056712000 : Rat) / 692956453614176359) [(6, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2315326633528356000 : Rat) / 692956453614176359) [(6, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-18522613068226848000 : Rat) / 692956453614176359) [(6, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((9261306534113424000 : Rat) / 692956453614176359) [(6, 1), (10, 1), (12, 1), (16, 1)],
  term ((43626810247303208702812078181626403269200 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2066027506270955564984577577093430990952000 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (10, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((494693471444087286894738355182544546103400 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4630653267056712000 : Rat) / 692956453614176359) [(6, 1), (10, 1), (13, 2), (14, 2), (16, 1)],
  term ((1157663316764178000 : Rat) / 692956453614176359) [(6, 1), (10, 1), (13, 2), (16, 1)],
  term ((5575573022869227375 : Rat) / 692956453614176359) [(6, 1), (10, 1), (14, 2), (16, 1)],
  term ((-5575573022869227375 : Rat) / 2771825814456705436) [(6, 1), (10, 1), (16, 1)],
  term ((-1589384067497426170269504969746206118400 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1473110236271731500 : Rat) / 23895050124626771) [(6, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((794692033748713085134752484873103059200 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((736555118135865750 : Rat) / 23895050124626771) [(6, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((1057034230187664641284633905623625321340800 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-528517115093832320642316952811812660670400 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (11, 1), (12, 1), (13, 3), (14, 1), (15, 2), (16, 1)],
  term ((-394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (11, 1), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((-87184599117767862569056627056425158676325 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((87184599117767862569056627056425158676325 : Rat) / 168707601851329515375740828258983054697998) [(6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((1302899797351309598034904678128583680000 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-29456631470247465321 : Rat) / 692956453614176359) [(6, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-8314990336455585834074622264187166937600 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((13017932354601955125 : Rat) / 692956453614176359) [(6, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((49217161566835919293144938861465513600 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((45895330585892975517 : Rat) / 2771825814456705436) [(6, 1), (11, 1), (13, 1), (16, 1)],
  term ((21558147229296800814651749709232192358400 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-5767813622212237472435355553852175131132800 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((1431174331938410967701513013608427686604000 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-3944326815162191356359941873775140352000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (11, 1), (13, 3), (14, 2), (15, 2), (16, 1)],
  term ((-9529107427478448000 : Rat) / 692956453614176359) [(6, 1), (11, 1), (13, 3), (14, 2), (16, 1)],
  term ((986081703790547839089985468443785088000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((2382276856869612000 : Rat) / 692956453614176359) [(6, 1), (11, 1), (13, 3), (16, 1)],
  term ((-788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (11, 1), (13, 4), (14, 2), (15, 1), (16, 1)],
  term ((197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (11, 1), (13, 4), (15, 1), (16, 1)],
  term ((-984019040588212772912139073875863587608921 : Rat) / 168707601851329515375740828258983054697998) [(6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((9144362709899146948734428935040000278875 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((487437338939156812981702322470411793665023 : Rat) / 168707601851329515375740828258983054697998) [(6, 1), (11, 1), (15, 1), (16, 1)],
  term ((6670395561478076422635316524709288665600 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3335197780739038211317658262354644332800 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((28587322282435344000 : Rat) / 692956453614176359) [(6, 1), (11, 2), (13, 2), (14, 1), (16, 1)],
  term ((-14293661141217672000 : Rat) / 692956453614176359) [(6, 1), (11, 2), (13, 2), (16, 1)],
  term ((2366596089097314813815965124265084211200 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (11, 2), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (11, 2), (13, 3), (15, 1), (16, 1)],
  term ((3877804354664514375 : Rat) / 692956453614176359) [(6, 1), (11, 2), (14, 1), (16, 1)],
  term ((-3877804354664514375 : Rat) / 1385912907228352718) [(6, 1), (11, 2), (16, 1)],
  term ((-3682244654810617547036612513503161525080667 : Rat) / 168707601851329515375740828258983054697998) [(6, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((282294956092783746240896013594526464000 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (12, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((3682244654810617547036612513503161525080667 : Rat) / 337415203702659030751481656517966109395996) [(6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-141147478046391873120448006797263232000 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((8402930661652177337438025772082918246400 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (12, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((23985511571295349047 : Rat) / 1385912907228352718) [(6, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-4201465330826088668719012886041459123200 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-23985511571295349047 : Rat) / 2771825814456705436) [(6, 1), (12, 1), (13, 2), (16, 1)],
  term ((-1348339058394058668987801342294324496072521 : Rat) / 674830407405318061502963313035932218791992) [(6, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((54102316226717537127 : Rat) / 2771825814456705436) [(6, 1), (12, 1), (14, 1), (16, 1)],
  term ((1348339058394058668987801342294324496072521 : Rat) / 1349660814810636123005926626071864437583984) [(6, 1), (12, 1), (15, 2), (16, 1)],
  term ((-54102316226717537127 : Rat) / 5543651628913410872) [(6, 1), (12, 1), (16, 1)],
  term ((863040621431898536297181273559775436819621 : Rat) / 168707601851329515375740828258983054697998) [(6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((12129918486196904941506727646259994783900173 : Rat) / 674830407405318061502963313035932218791992) [(6, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-19034243457652093231884177834738198278457141 : Rat) / 2699321629621272246011853252143728875167968) [(6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-228007464536479179656108318672502144000 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((84425985337675401 : Rat) / 692956453614176359) [(6, 1), (13, 2), (14, 1), (16, 1)],
  term ((-69640525484866931127621571492020304819200 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (13, 2), (14, 2), (15, 2), (16, 1)],
  term ((30574154284112501211 : Rat) / 2771825814456705436) [(6, 1), (13, 2), (14, 2), (16, 1)],
  term ((17524135103484972371733447032341327276800 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (13, 2), (15, 2), (16, 1)],
  term ((-31249562166813904419 : Rat) / 11087303257826821744) [(6, 1), (13, 2), (16, 1)],
  term ((1825322377829865598831163803508281190400 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-8402930661652177337438025772082918246400 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (13, 3), (14, 2), (15, 1), (16, 1)],
  term ((40967981948210742584273260043675481600 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (13, 3), (15, 1), (16, 1)],
  term ((385887772254726000 : Rat) / 692956453614176359) [(6, 1), (14, 1), (16, 1)],
  term ((40392457375880553978167972959007757153600 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (14, 2), (15, 2), (16, 1)],
  term ((-3639790098340196150 : Rat) / 692956453614176359) [(6, 1), (14, 2), (16, 1)],
  term ((-10098114343970138494541993239751939288400 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (15, 2), (16, 1)],
  term ((1434007276915372075 : Rat) / 1385912907228352718) [(6, 1), (16, 1)],
  term ((43626810247303208702812078181626403269200 : Rat) / 84353800925664757687870414129491527348999) [(6, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-21813405123651604351406039090813201634600 : Rat) / 84353800925664757687870414129491527348999) [(6, 2), (11, 1), (15, 1), (16, 1)],
  term ((14542270082434402900937359393875467756400 : Rat) / 84353800925664757687870414129491527348999) [(6, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-7271135041217201450468679696937733878200 : Rat) / 84353800925664757687870414129491527348999) [(6, 2), (12, 1), (15, 2), (16, 1)],
  term ((-16220067527675167394856169068459730220400 : Rat) / 84353800925664757687870414129491527348999) [(6, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((4055016881918791848714042267114932555100 : Rat) / 84353800925664757687870414129491527348999) [(6, 2), (13, 1), (15, 1), (16, 1)],
  term ((-346288422606126750 : Rat) / 692956453614176359) [(6, 2), (14, 2), (16, 1)],
  term ((173144211303063375 : Rat) / 1385912907228352718) [(6, 2), (16, 1)],
  term ((-6670395561478076422635316524709288665600 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((3335197780739038211317658262354644332800 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-28587322282435344000 : Rat) / 692956453614176359) [(7, 1), (10, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((14293661141217672000 : Rat) / 692956453614176359) [(7, 1), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((-2366596089097314813815965124265084211200 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (10, 1), (11, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (10, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((-3877804354664514375 : Rat) / 692956453614176359) [(7, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((3877804354664514375 : Rat) / 1385912907228352718) [(7, 1), (10, 1), (11, 1), (16, 1)],
  term ((364938985264381623 : Rat) / 1385912907228352718) [(7, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-364938985264381623 : Rat) / 2771825814456705436) [(7, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (10, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1843367721265631962653173246630448000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (10, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-10804857623132328000 : Rat) / 692956453614176359) [(7, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((5402428811566164000 : Rat) / 692956453614176359) [(7, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1293938423144147944817029089526510598400 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (10, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((38622600986652627183 : Rat) / 692956453614176359) [(7, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-6174204356075616000 : Rat) / 692956453614176359) [(7, 1), (10, 1), (13, 1), (14, 2), (16, 1)],
  term ((646969211572073972408514544763255299200 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1225362027883269627 : Rat) / 47790100249253542) [(7, 1), (10, 1), (13, 1), (16, 1)],
  term ((-21563394511540701508210249596428282726400 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (10, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((10781697255770350754105124798214141363200 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((2189633911586289738 : Rat) / 692956453614176359) [(7, 1), (10, 1), (13, 3), (14, 1), (16, 1)],
  term ((-1094816955793144869 : Rat) / 692956453614176359) [(7, 1), (10, 1), (13, 3), (16, 1)],
  term ((44240825310375167103676157919130752000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (10, 1), (13, 4), (14, 1), (15, 1), (16, 1)],
  term ((-22120412655187583551838078959565376000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (10, 1), (13, 4), (15, 1), (16, 1)],
  term ((984019040588212772912139073875863587608921 : Rat) / 168707601851329515375740828258983054697998) [(7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-984019040588212772912139073875863587608921 : Rat) / 337415203702659030751481656517966109395996) [(7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-13891959801170136000 : Rat) / 692956453614176359) [(7, 1), (10, 2), (13, 1), (14, 1), (16, 1)],
  term ((6945979900585068000 : Rat) / 692956453614176359) [(7, 1), (10, 2), (13, 1), (16, 1)],
  term ((-2318157563545056784842624855980430126835200 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1159078781772528392421312427990215063417600 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (11, 1), (12, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-2189633911586289738 : Rat) / 692956453614176359) [(7, 1), (11, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (11, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((1094816955793144869 : Rat) / 692956453614176359) [(7, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((-44240825310375167103676157919130752000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (11, 1), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((22120412655187583551838078959565376000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-2463383904854034835748019202064994297600 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-17108693446828297347 : Rat) / 1385912907228352718) [(7, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((1231691952427017417874009601032497148800 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((17108693446828297347 : Rat) / 2771825814456705436) [(7, 1), (11, 1), (12, 1), (16, 1)],
  term ((3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (11, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1843367721265631962653173246630448000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((364938985264381623 : Rat) / 1385912907228352718) [(7, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((-364938985264381623 : Rat) / 2771825814456705436) [(7, 1), (11, 1), (12, 2), (16, 1)],
  term ((-4207356709843761905813258389601749689600 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((1051839177460940476453314597400437422400 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-28587322282435344000 : Rat) / 692956453614176359) [(7, 1), (11, 1), (13, 2), (14, 2), (16, 1)],
  term ((7146830570608836000 : Rat) / 692956453614176359) [(7, 1), (11, 1), (13, 2), (16, 1)],
  term ((-2366596089097314813815965124265084211200 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (11, 1), (13, 3), (14, 2), (15, 1), (16, 1)],
  term ((591649022274328703453991281066271052800 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((-508561971459160500 : Rat) / 692956453614176359) [(7, 1), (11, 1), (14, 1), (16, 1)],
  term ((469767248074278000 : Rat) / 692956453614176359) [(7, 1), (11, 1), (14, 2), (16, 1)],
  term ((136839173711010750 : Rat) / 692956453614176359) [(7, 1), (11, 1), (16, 1)],
  term ((-233788651487954081202973310251158145383315 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((805089080874711663 : Rat) / 5543651628913410872) [(7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-729877970528763246 : Rat) / 692956453614176359) [(7, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((233788651487954081202973310251158145383315 : Rat) / 168707601851329515375740828258983054697998) [(7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((72911131077253149 : Rat) / 382320801994028336) [(7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-136262763667165217267108260211391167759109 : Rat) / 337415203702659030751481656517966109395996) [(7, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-36867354425312639253063464932608960000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (12, 1), (13, 2), (14, 1), (15, 3), (16, 1)],
  term ((-14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (12, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((137118086289832470497779332597827695631109 : Rat) / 674830407405318061502963313035932218791992) [(7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((18433677212656319626531732466304480000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (12, 1), (13, 2), (15, 3), (16, 1)],
  term ((-5530103163796895887959519739891344000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (12, 1), (13, 3), (14, 1), (15, 2), (16, 1)],
  term ((-16422254336897173035 : Rat) / 1385912907228352718) [(7, 1), (12, 1), (13, 3), (14, 1), (16, 1)],
  term ((2765051581898447943979759869945672000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((16422254336897173035 : Rat) / 2771825814456705436) [(7, 1), (12, 1), (13, 3), (16, 1)],
  term ((-165903094913906876638785592196740320000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (12, 1), (13, 4), (14, 1), (15, 1), (16, 1)],
  term ((82951547456953438319392796098370160000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (12, 1), (13, 4), (15, 1), (16, 1)],
  term ((-12007835501223069441828501082288526747232279 : Rat) / 1349660814810636123005926626071864437583984) [(7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-381775145675427359659158544944748800 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((32293461734905136865130679348800800 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((12007828009139946943836748371970917825446679 : Rat) / 2699321629621272246011853252143728875167968) [(7, 1), (12, 1), (15, 1), (16, 1)],
  term ((190887572837713679829579272472374400 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (12, 1), (15, 3), (16, 1)],
  term ((11060206327593791775919039479782688000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (12, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-5530103163796895887959519739891344000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (12, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 27, terms 1600 through 1699. -/
theorem ep_Q2_008_block_27_1600_1699_valid :
    checkProductSumEq ep_Q2_008_partials_27_1600_1699
      ep_Q2_008_block_27_1600_1699 = true := by
  native_decide

end EpQ2008TermShards

end Patterns

end EndpointCertificate

end Problem97
