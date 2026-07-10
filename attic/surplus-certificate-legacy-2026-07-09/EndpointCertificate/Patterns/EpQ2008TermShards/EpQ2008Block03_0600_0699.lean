/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_008, term block 3:600-699

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_008`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2008TermShards

/-- Generator polynomial 3 for endpoint certificate `ep_Q2_008`. -/
def ep_Q2_008_generator_03_0600_0699 : Poly :=
[
  term (1 : Rat) [(2, 2)],
  term (1 : Rat) [(3, 2)],
  term (-1 : Rat) [(8, 2)],
  term (-1 : Rat) [(9, 2)]
]

/-- Coefficient term 600 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0600 : Poly :=
[
  term ((364938985264381623 : Rat) / 692956453614176359) [(7, 2), (13, 2), (16, 1)]
]

/-- Partial product 600 for generator 3. -/
def ep_Q2_008_partial_03_0600 : Poly :=
[
  term ((364938985264381623 : Rat) / 692956453614176359) [(2, 2), (7, 2), (13, 2), (16, 1)],
  term ((364938985264381623 : Rat) / 692956453614176359) [(3, 2), (7, 2), (13, 2), (16, 1)],
  term ((-364938985264381623 : Rat) / 692956453614176359) [(7, 2), (8, 2), (13, 2), (16, 1)],
  term ((-364938985264381623 : Rat) / 692956453614176359) [(7, 2), (9, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 600 for generator 3. -/
theorem ep_Q2_008_partial_03_0600_valid :
    mulPoly ep_Q2_008_coefficient_03_0600
        ep_Q2_008_generator_03_0600_0699 =
      ep_Q2_008_partial_03_0600 := by
  native_decide

/-- Coefficient term 601 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0601 : Poly :=
[
  term ((8185765685626957875616924292616076800 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 601 for generator 3. -/
def ep_Q2_008_partial_03_0601 : Poly :=
[
  term ((8185765685626957875616924292616076800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 2), (13, 3), (15, 1), (16, 1)],
  term ((8185765685626957875616924292616076800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 2), (13, 3), (15, 1), (16, 1)],
  term ((-8185765685626957875616924292616076800 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (8, 2), (13, 3), (15, 1), (16, 1)],
  term ((-8185765685626957875616924292616076800 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (9, 2), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 601 for generator 3. -/
theorem ep_Q2_008_partial_03_0601_valid :
    mulPoly ep_Q2_008_coefficient_03_0601
        ep_Q2_008_generator_03_0600_0699 =
      ep_Q2_008_partial_03_0601 := by
  native_decide

/-- Coefficient term 602 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0602 : Poly :=
[
  term ((305467685293579219548379191939206400 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (15, 2), (16, 1)]
]

/-- Partial product 602 for generator 3. -/
def ep_Q2_008_partial_03_0602 : Poly :=
[
  term ((305467685293579219548379191939206400 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 2), (15, 2), (16, 1)],
  term ((305467685293579219548379191939206400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 2), (15, 2), (16, 1)],
  term ((-305467685293579219548379191939206400 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (8, 2), (15, 2), (16, 1)],
  term ((-305467685293579219548379191939206400 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 602 for generator 3. -/
theorem ep_Q2_008_partial_03_0602_valid :
    mulPoly ep_Q2_008_coefficient_03_0602
        ep_Q2_008_generator_03_0600_0699 =
      ep_Q2_008_partial_03_0602 := by
  native_decide

/-- Coefficient term 603 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0603 : Poly :=
[
  term ((3448052429063870577 : Rat) / 1385912907228352718) [(7, 2), (16, 1)]
]

/-- Partial product 603 for generator 3. -/
def ep_Q2_008_partial_03_0603 : Poly :=
[
  term ((3448052429063870577 : Rat) / 1385912907228352718) [(2, 2), (7, 2), (16, 1)],
  term ((3448052429063870577 : Rat) / 1385912907228352718) [(3, 2), (7, 2), (16, 1)],
  term ((-3448052429063870577 : Rat) / 1385912907228352718) [(7, 2), (8, 2), (16, 1)],
  term ((-3448052429063870577 : Rat) / 1385912907228352718) [(7, 2), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 603 for generator 3. -/
theorem ep_Q2_008_partial_03_0603_valid :
    mulPoly ep_Q2_008_coefficient_03_0603
        ep_Q2_008_generator_03_0600_0699 =
      ep_Q2_008_partial_03_0603 := by
  native_decide

/-- Coefficient term 604 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0604 : Poly :=
[
  term ((-609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (10, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 604 for generator 3. -/
def ep_Q2_008_partial_03_0604 : Poly :=
[
  term ((-609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 3), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 3), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (8, 2), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (9, 2), (10, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 604 for generator 3. -/
theorem ep_Q2_008_partial_03_0604_valid :
    mulPoly ep_Q2_008_coefficient_03_0604
        ep_Q2_008_generator_03_0600_0699 =
      ep_Q2_008_partial_03_0604 := by
  native_decide

/-- Coefficient term 605 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0605 : Poly :=
[
  term ((-43336929246501263764396389789139200 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 605 for generator 3. -/
def ep_Q2_008_partial_03_0605 : Poly :=
[
  term ((-43336929246501263764396389789139200 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 3), (10, 1), (15, 1), (16, 1)],
  term ((-43336929246501263764396389789139200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 3), (10, 1), (15, 1), (16, 1)],
  term ((43336929246501263764396389789139200 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (8, 2), (10, 1), (15, 1), (16, 1)],
  term ((43336929246501263764396389789139200 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (9, 2), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 605 for generator 3. -/
theorem ep_Q2_008_partial_03_0605_valid :
    mulPoly ep_Q2_008_coefficient_03_0605
        ep_Q2_008_generator_03_0600_0699 =
      ep_Q2_008_partial_03_0605 := by
  native_decide

/-- Coefficient term 606 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0606 : Poly :=
[
  term ((-406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 606 for generator 3. -/
def ep_Q2_008_partial_03_0606 : Poly :=
[
  term ((-406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 3), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 3), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (8, 2), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (9, 2), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 606 for generator 3. -/
theorem ep_Q2_008_partial_03_0606_valid :
    mulPoly ep_Q2_008_coefficient_03_0606
        ep_Q2_008_generator_03_0600_0699 =
      ep_Q2_008_partial_03_0606 := by
  native_decide

/-- Coefficient term 607 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0607 : Poly :=
[
  term ((-203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 607 for generator 3. -/
def ep_Q2_008_partial_03_0607 : Poly :=
[
  term ((-203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 3), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 3), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (8, 2), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (9, 2), (12, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 607 for generator 3. -/
theorem ep_Q2_008_partial_03_0607_valid :
    mulPoly ep_Q2_008_coefficient_03_0607
        ep_Q2_008_generator_03_0600_0699 =
      ep_Q2_008_partial_03_0607 := by
  native_decide

/-- Coefficient term 608 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0608 : Poly :=
[
  term ((-217519343223274594172523289786617600 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 608 for generator 3. -/
def ep_Q2_008_partial_03_0608 : Poly :=
[
  term ((-217519343223274594172523289786617600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 3), (12, 1), (15, 1), (16, 1)],
  term ((-217519343223274594172523289786617600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 3), (12, 1), (15, 1), (16, 1)],
  term ((217519343223274594172523289786617600 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (8, 2), (12, 1), (15, 1), (16, 1)],
  term ((217519343223274594172523289786617600 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (9, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 608 for generator 3. -/
theorem ep_Q2_008_partial_03_0608_valid :
    mulPoly ep_Q2_008_coefficient_03_0608
        ep_Q2_008_generator_03_0600_0699 =
      ep_Q2_008_partial_03_0608 := by
  native_decide

/-- Coefficient term 609 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0609 : Poly :=
[
  term ((101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 609 for generator 3. -/
def ep_Q2_008_partial_03_0609 : Poly :=
[
  term ((101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 3), (12, 2), (15, 1), (16, 1)],
  term ((101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 3), (12, 2), (15, 1), (16, 1)],
  term ((-101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (8, 2), (12, 2), (15, 1), (16, 1)],
  term ((-101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (9, 2), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 609 for generator 3. -/
theorem ep_Q2_008_partial_03_0609_valid :
    mulPoly ep_Q2_008_coefficient_03_0609
        ep_Q2_008_generator_03_0600_0699 =
      ep_Q2_008_partial_03_0609 := by
  native_decide

/-- Coefficient term 610 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0610 : Poly :=
[
  term ((406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 610 for generator 3. -/
def ep_Q2_008_partial_03_0610 : Poly :=
[
  term ((406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 3), (13, 1), (15, 2), (16, 1)],
  term ((406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 3), (13, 1), (15, 2), (16, 1)],
  term ((-406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (8, 2), (13, 1), (15, 2), (16, 1)],
  term ((-406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (9, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 610 for generator 3. -/
theorem ep_Q2_008_partial_03_0610_valid :
    mulPoly ep_Q2_008_coefficient_03_0610
        ep_Q2_008_generator_03_0600_0699 =
      ep_Q2_008_partial_03_0610 := by
  native_decide

/-- Coefficient term 611 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0611 : Poly :=
[
  term ((203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 611 for generator 3. -/
def ep_Q2_008_partial_03_0611 : Poly :=
[
  term ((203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 3), (13, 2), (15, 1), (16, 1)],
  term ((203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 3), (13, 2), (15, 1), (16, 1)],
  term ((-203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (8, 2), (13, 2), (15, 1), (16, 1)],
  term ((-203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (9, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 611 for generator 3. -/
theorem ep_Q2_008_partial_03_0611_valid :
    mulPoly ep_Q2_008_coefficient_03_0611
        ep_Q2_008_generator_03_0600_0699 =
      ep_Q2_008_partial_03_0611 := by
  native_decide

/-- Coefficient term 612 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0612 : Poly :=
[
  term ((115982493152720841046994376524832000 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (15, 1), (16, 1)]
]

/-- Partial product 612 for generator 3. -/
def ep_Q2_008_partial_03_0612 : Poly :=
[
  term ((115982493152720841046994376524832000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 3), (15, 1), (16, 1)],
  term ((115982493152720841046994376524832000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 3), (15, 1), (16, 1)],
  term ((-115982493152720841046994376524832000 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (8, 2), (15, 1), (16, 1)],
  term ((-115982493152720841046994376524832000 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 612 for generator 3. -/
theorem ep_Q2_008_partial_03_0612_valid :
    mulPoly ep_Q2_008_coefficient_03_0612
        ep_Q2_008_generator_03_0600_0699 =
      ep_Q2_008_partial_03_0612 := by
  native_decide

/-- Coefficient term 613 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0613 : Poly :=
[
  term ((70324786932212700 : Rat) / 692956453614176359) [(8, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 613 for generator 3. -/
def ep_Q2_008_partial_03_0613 : Poly :=
[
  term ((70324786932212700 : Rat) / 692956453614176359) [(2, 2), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((70324786932212700 : Rat) / 692956453614176359) [(3, 2), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((-70324786932212700 : Rat) / 692956453614176359) [(8, 1), (9, 3), (13, 1), (16, 1)],
  term ((-70324786932212700 : Rat) / 692956453614176359) [(8, 3), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 613 for generator 3. -/
theorem ep_Q2_008_partial_03_0613_valid :
    mulPoly ep_Q2_008_coefficient_03_0613
        ep_Q2_008_generator_03_0600_0699 =
      ep_Q2_008_partial_03_0613 := by
  native_decide

/-- Coefficient term 614 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0614 : Poly :=
[
  term ((-39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(8, 1), (9, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 614 for generator 3. -/
def ep_Q2_008_partial_03_0614 : Poly :=
[
  term ((-39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (8, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (8, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(8, 1), (9, 3), (13, 2), (15, 1), (16, 1)],
  term ((39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(8, 3), (9, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 614 for generator 3. -/
theorem ep_Q2_008_partial_03_0614_valid :
    mulPoly ep_Q2_008_coefficient_03_0614
        ep_Q2_008_generator_03_0600_0699 =
      ep_Q2_008_partial_03_0614 := by
  native_decide

/-- Coefficient term 615 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0615 : Poly :=
[
  term ((-6945979900585068000 : Rat) / 692956453614176359) [(8, 1), (10, 1), (13, 2), (16, 1)]
]

/-- Partial product 615 for generator 3. -/
def ep_Q2_008_partial_03_0615 : Poly :=
[
  term ((-6945979900585068000 : Rat) / 692956453614176359) [(2, 2), (8, 1), (10, 1), (13, 2), (16, 1)],
  term ((-6945979900585068000 : Rat) / 692956453614176359) [(3, 2), (8, 1), (10, 1), (13, 2), (16, 1)],
  term ((6945979900585068000 : Rat) / 692956453614176359) [(8, 1), (9, 2), (10, 1), (13, 2), (16, 1)],
  term ((6945979900585068000 : Rat) / 692956453614176359) [(8, 3), (10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 615 for generator 3. -/
theorem ep_Q2_008_partial_03_0615_valid :
    mulPoly ep_Q2_008_coefficient_03_0615
        ep_Q2_008_generator_03_0600_0699 =
      ep_Q2_008_partial_03_0615 := by
  native_decide

/-- Coefficient term 616 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0616 : Poly :=
[
  term ((1969850932679345625 : Rat) / 2771825814456705436) [(8, 1), (11, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 616 for generator 3. -/
def ep_Q2_008_partial_03_0616 : Poly :=
[
  term ((1969850932679345625 : Rat) / 2771825814456705436) [(2, 2), (8, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((1969850932679345625 : Rat) / 2771825814456705436) [(3, 2), (8, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-1969850932679345625 : Rat) / 2771825814456705436) [(8, 1), (9, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-1969850932679345625 : Rat) / 2771825814456705436) [(8, 3), (11, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 616 for generator 3. -/
theorem ep_Q2_008_partial_03_0616_valid :
    mulPoly ep_Q2_008_coefficient_03_0616
        ep_Q2_008_generator_03_0600_0699 =
      ep_Q2_008_partial_03_0616 := by
  native_decide

/-- Coefficient term 617 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0617 : Poly :=
[
  term ((1387039924178296875 : Rat) / 5543651628913410872) [(8, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 617 for generator 3. -/
def ep_Q2_008_partial_03_0617 : Poly :=
[
  term ((1387039924178296875 : Rat) / 5543651628913410872) [(2, 2), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((1387039924178296875 : Rat) / 5543651628913410872) [(3, 2), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((-1387039924178296875 : Rat) / 5543651628913410872) [(8, 1), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-1387039924178296875 : Rat) / 5543651628913410872) [(8, 3), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 617 for generator 3. -/
theorem ep_Q2_008_partial_03_0617_valid :
    mulPoly ep_Q2_008_coefficient_03_0617
        ep_Q2_008_generator_03_0600_0699 =
      ep_Q2_008_partial_03_0617 := by
  native_decide

/-- Coefficient term 618 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0618 : Poly :=
[
  term ((-1498262336125082331259894946679368419200 : Rat) / 84353800925664757687870414129491527348999) [(8, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 618 for generator 3. -/
def ep_Q2_008_partial_03_0618 : Poly :=
[
  term ((-1498262336125082331259894946679368419200 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (8, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1498262336125082331259894946679368419200 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (8, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((1498262336125082331259894946679368419200 : Rat) / 84353800925664757687870414129491527348999) [(8, 1), (9, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((1498262336125082331259894946679368419200 : Rat) / 84353800925664757687870414129491527348999) [(8, 3), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 618 for generator 3. -/
theorem ep_Q2_008_partial_03_0618_valid :
    mulPoly ep_Q2_008_coefficient_03_0618
        ep_Q2_008_generator_03_0600_0699 =
      ep_Q2_008_partial_03_0618 := by
  native_decide

/-- Coefficient term 619 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0619 : Poly :=
[
  term ((-19058214854956896000 : Rat) / 692956453614176359) [(8, 1), (11, 1), (13, 3), (16, 1)]
]

/-- Partial product 619 for generator 3. -/
def ep_Q2_008_partial_03_0619 : Poly :=
[
  term ((-19058214854956896000 : Rat) / 692956453614176359) [(2, 2), (8, 1), (11, 1), (13, 3), (16, 1)],
  term ((-19058214854956896000 : Rat) / 692956453614176359) [(3, 2), (8, 1), (11, 1), (13, 3), (16, 1)],
  term ((19058214854956896000 : Rat) / 692956453614176359) [(8, 1), (9, 2), (11, 1), (13, 3), (16, 1)],
  term ((19058214854956896000 : Rat) / 692956453614176359) [(8, 3), (11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 619 for generator 3. -/
theorem ep_Q2_008_partial_03_0619_valid :
    mulPoly ep_Q2_008_coefficient_03_0619
        ep_Q2_008_generator_03_0600_0699 =
      ep_Q2_008_partial_03_0619 := by
  native_decide

/-- Coefficient term 620 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0620 : Poly :=
[
  term ((-1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(8, 1), (11, 1), (13, 4), (15, 1), (16, 1)]
]

/-- Partial product 620 for generator 3. -/
def ep_Q2_008_partial_03_0620 : Poly :=
[
  term ((-1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (8, 1), (11, 1), (13, 4), (15, 1), (16, 1)],
  term ((-1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (8, 1), (11, 1), (13, 4), (15, 1), (16, 1)],
  term ((1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(8, 1), (9, 2), (11, 1), (13, 4), (15, 1), (16, 1)],
  term ((1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(8, 3), (11, 1), (13, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 620 for generator 3. -/
theorem ep_Q2_008_partial_03_0620_valid :
    mulPoly ep_Q2_008_coefficient_03_0620
        ep_Q2_008_generator_03_0600_0699 =
      ep_Q2_008_partial_03_0620 := by
  native_decide

/-- Coefficient term 621 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0621 : Poly :=
[
  term ((-11020747726338080733 : Rat) / 5543651628913410872) [(8, 1), (11, 2), (16, 1)]
]

/-- Partial product 621 for generator 3. -/
def ep_Q2_008_partial_03_0621 : Poly :=
[
  term ((-11020747726338080733 : Rat) / 5543651628913410872) [(2, 2), (8, 1), (11, 2), (16, 1)],
  term ((-11020747726338080733 : Rat) / 5543651628913410872) [(3, 2), (8, 1), (11, 2), (16, 1)],
  term ((11020747726338080733 : Rat) / 5543651628913410872) [(8, 1), (9, 2), (11, 2), (16, 1)],
  term ((11020747726338080733 : Rat) / 5543651628913410872) [(8, 3), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 621 for generator 3. -/
theorem ep_Q2_008_partial_03_0621_valid :
    mulPoly ep_Q2_008_coefficient_03_0621
        ep_Q2_008_generator_03_0600_0699 =
      ep_Q2_008_partial_03_0621 := by
  native_decide

/-- Coefficient term 622 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0622 : Poly :=
[
  term ((14950744787709303129050138340319920107025 : Rat) / 84353800925664757687870414129491527348999) [(8, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 622 for generator 3. -/
def ep_Q2_008_partial_03_0622 : Poly :=
[
  term ((14950744787709303129050138340319920107025 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((14950744787709303129050138340319920107025 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-14950744787709303129050138340319920107025 : Rat) / 84353800925664757687870414129491527348999) [(8, 1), (9, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-14950744787709303129050138340319920107025 : Rat) / 84353800925664757687870414129491527348999) [(8, 3), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 622 for generator 3. -/
theorem ep_Q2_008_partial_03_0622_valid :
    mulPoly ep_Q2_008_coefficient_03_0622
        ep_Q2_008_generator_03_0600_0699 =
      ep_Q2_008_partial_03_0622 := by
  native_decide

/-- Coefficient term 623 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0623 : Poly :=
[
  term ((-35162393466106350 : Rat) / 692956453614176359) [(8, 1), (12, 1), (16, 1)]
]

/-- Partial product 623 for generator 3. -/
def ep_Q2_008_partial_03_0623 : Poly :=
[
  term ((-35162393466106350 : Rat) / 692956453614176359) [(2, 2), (8, 1), (12, 1), (16, 1)],
  term ((-35162393466106350 : Rat) / 692956453614176359) [(3, 2), (8, 1), (12, 1), (16, 1)],
  term ((35162393466106350 : Rat) / 692956453614176359) [(8, 1), (9, 2), (12, 1), (16, 1)],
  term ((35162393466106350 : Rat) / 692956453614176359) [(8, 3), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 623 for generator 3. -/
theorem ep_Q2_008_partial_03_0623_valid :
    mulPoly ep_Q2_008_coefficient_03_0623
        ep_Q2_008_generator_03_0600_0699 =
      ep_Q2_008_partial_03_0623 := by
  native_decide

/-- Coefficient term 624 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0624 : Poly :=
[
  term ((3988922053075555626108933898896416534175 : Rat) / 168707601851329515375740828258983054697998) [(8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 624 for generator 3. -/
def ep_Q2_008_partial_03_0624 : Poly :=
[
  term ((3988922053075555626108933898896416534175 : Rat) / 168707601851329515375740828258983054697998) [(2, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((3988922053075555626108933898896416534175 : Rat) / 168707601851329515375740828258983054697998) [(3, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3988922053075555626108933898896416534175 : Rat) / 168707601851329515375740828258983054697998) [(8, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-3988922053075555626108933898896416534175 : Rat) / 168707601851329515375740828258983054697998) [(8, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 624 for generator 3. -/
theorem ep_Q2_008_partial_03_0624_valid :
    mulPoly ep_Q2_008_coefficient_03_0624
        ep_Q2_008_generator_03_0600_0699 =
      ep_Q2_008_partial_03_0624 := by
  native_decide

/-- Coefficient term 625 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0625 : Poly :=
[
  term ((-39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(8, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 625 for generator 3. -/
def ep_Q2_008_partial_03_0625 : Poly :=
[
  term ((-39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (8, 1), (13, 2), (15, 2), (16, 1)],
  term ((-39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (8, 1), (13, 2), (15, 2), (16, 1)],
  term ((39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(8, 1), (9, 2), (13, 2), (15, 2), (16, 1)],
  term ((39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(8, 3), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 625 for generator 3. -/
theorem ep_Q2_008_partial_03_0625_valid :
    mulPoly ep_Q2_008_coefficient_03_0625
        ep_Q2_008_generator_03_0600_0699 =
      ep_Q2_008_partial_03_0625 := by
  native_decide

/-- Coefficient term 626 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0626 : Poly :=
[
  term ((52553723233734477915 : Rat) / 5543651628913410872) [(8, 1), (13, 2), (16, 1)]
]

/-- Partial product 626 for generator 3. -/
def ep_Q2_008_partial_03_0626 : Poly :=
[
  term ((52553723233734477915 : Rat) / 5543651628913410872) [(2, 2), (8, 1), (13, 2), (16, 1)],
  term ((52553723233734477915 : Rat) / 5543651628913410872) [(3, 2), (8, 1), (13, 2), (16, 1)],
  term ((-52553723233734477915 : Rat) / 5543651628913410872) [(8, 1), (9, 2), (13, 2), (16, 1)],
  term ((-52553723233734477915 : Rat) / 5543651628913410872) [(8, 3), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 626 for generator 3. -/
theorem ep_Q2_008_partial_03_0626_valid :
    mulPoly ep_Q2_008_coefficient_03_0626
        ep_Q2_008_generator_03_0600_0699 =
      ep_Q2_008_partial_03_0626 := by
  native_decide

/-- Coefficient term 627 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0627 : Poly :=
[
  term ((-25848593045194364880230305998322280985600 : Rat) / 84353800925664757687870414129491527348999) [(8, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 627 for generator 3. -/
def ep_Q2_008_partial_03_0627 : Poly :=
[
  term ((-25848593045194364880230305998322280985600 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (8, 1), (13, 3), (15, 1), (16, 1)],
  term ((-25848593045194364880230305998322280985600 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (8, 1), (13, 3), (15, 1), (16, 1)],
  term ((25848593045194364880230305998322280985600 : Rat) / 84353800925664757687870414129491527348999) [(8, 1), (9, 2), (13, 3), (15, 1), (16, 1)],
  term ((25848593045194364880230305998322280985600 : Rat) / 84353800925664757687870414129491527348999) [(8, 3), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 627 for generator 3. -/
theorem ep_Q2_008_partial_03_0627_valid :
    mulPoly ep_Q2_008_coefficient_03_0627
        ep_Q2_008_generator_03_0600_0699 =
      ep_Q2_008_partial_03_0627 := by
  native_decide

/-- Coefficient term 628 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0628 : Poly :=
[
  term ((11020747726338080733 : Rat) / 5543651628913410872) [(9, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 628 for generator 3. -/
def ep_Q2_008_partial_03_0628 : Poly :=
[
  term ((11020747726338080733 : Rat) / 5543651628913410872) [(2, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((11020747726338080733 : Rat) / 5543651628913410872) [(3, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-11020747726338080733 : Rat) / 5543651628913410872) [(8, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-11020747726338080733 : Rat) / 5543651628913410872) [(9, 3), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 628 for generator 3. -/
theorem ep_Q2_008_partial_03_0628_valid :
    mulPoly ep_Q2_008_coefficient_03_0628
        ep_Q2_008_generator_03_0600_0699 =
      ep_Q2_008_partial_03_0628 := by
  native_decide

/-- Coefficient term 629 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0629 : Poly :=
[
  term ((6945979900585068000 : Rat) / 692956453614176359) [(9, 1), (10, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 629 for generator 3. -/
def ep_Q2_008_partial_03_0629 : Poly :=
[
  term ((6945979900585068000 : Rat) / 692956453614176359) [(2, 2), (9, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((6945979900585068000 : Rat) / 692956453614176359) [(3, 2), (9, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-6945979900585068000 : Rat) / 692956453614176359) [(8, 2), (9, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-6945979900585068000 : Rat) / 692956453614176359) [(9, 3), (10, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 629 for generator 3. -/
theorem ep_Q2_008_partial_03_0629_valid :
    mulPoly ep_Q2_008_coefficient_03_0629
        ep_Q2_008_generator_03_0600_0699 =
      ep_Q2_008_partial_03_0629 := by
  native_decide

/-- Coefficient term 630 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0630 : Poly :=
[
  term ((-71449162036572956733 : Rat) / 5543651628913410872) [(9, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 630 for generator 3. -/
def ep_Q2_008_partial_03_0630 : Poly :=
[
  term ((-71449162036572956733 : Rat) / 5543651628913410872) [(2, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-71449162036572956733 : Rat) / 5543651628913410872) [(3, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((71449162036572956733 : Rat) / 5543651628913410872) [(8, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((71449162036572956733 : Rat) / 5543651628913410872) [(9, 3), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 630 for generator 3. -/
theorem ep_Q2_008_partial_03_0630_valid :
    mulPoly ep_Q2_008_coefficient_03_0630
        ep_Q2_008_generator_03_0600_0699 =
      ep_Q2_008_partial_03_0630 := by
  native_decide

/-- Coefficient term 631 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0631 : Poly :=
[
  term ((-670900164047368156987703685423339033600 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 631 for generator 3. -/
def ep_Q2_008_partial_03_0631 : Poly :=
[
  term ((-670900164047368156987703685423339033600 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (9, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-670900164047368156987703685423339033600 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (9, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((670900164047368156987703685423339033600 : Rat) / 84353800925664757687870414129491527348999) [(8, 2), (9, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((670900164047368156987703685423339033600 : Rat) / 84353800925664757687870414129491527348999) [(9, 3), (10, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 631 for generator 3. -/
theorem ep_Q2_008_partial_03_0631_valid :
    mulPoly ep_Q2_008_coefficient_03_0631
        ep_Q2_008_generator_03_0600_0699 =
      ep_Q2_008_partial_03_0631 := by
  native_decide

/-- Coefficient term 632 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0632 : Poly :=
[
  term ((2169162500172450488247598632102707452800 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 632 for generator 3. -/
def ep_Q2_008_partial_03_0632 : Poly :=
[
  term ((2169162500172450488247598632102707452800 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((2169162500172450488247598632102707452800 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2169162500172450488247598632102707452800 : Rat) / 84353800925664757687870414129491527348999) [(8, 2), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2169162500172450488247598632102707452800 : Rat) / 84353800925664757687870414129491527348999) [(9, 3), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 632 for generator 3. -/
theorem ep_Q2_008_partial_03_0632_valid :
    mulPoly ep_Q2_008_coefficient_03_0632
        ep_Q2_008_generator_03_0600_0699 =
      ep_Q2_008_partial_03_0632 := by
  native_decide

/-- Coefficient term 633 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0633 : Poly :=
[
  term ((19058214854956896000 : Rat) / 692956453614176359) [(9, 1), (11, 1), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 633 for generator 3. -/
def ep_Q2_008_partial_03_0633 : Poly :=
[
  term ((19058214854956896000 : Rat) / 692956453614176359) [(2, 2), (9, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((19058214854956896000 : Rat) / 692956453614176359) [(3, 2), (9, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((-19058214854956896000 : Rat) / 692956453614176359) [(8, 2), (9, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((-19058214854956896000 : Rat) / 692956453614176359) [(9, 3), (11, 1), (12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 633 for generator 3. -/
theorem ep_Q2_008_partial_03_0633_valid :
    mulPoly ep_Q2_008_coefficient_03_0633
        ep_Q2_008_generator_03_0600_0699 =
      ep_Q2_008_partial_03_0633 := by
  native_decide

/-- Coefficient term 634 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0634 : Poly :=
[
  term ((1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(9, 1), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 634 for generator 3. -/
def ep_Q2_008_partial_03_0634 : Poly :=
[
  term ((1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (9, 1), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (9, 1), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(8, 2), (9, 1), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(9, 3), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 634 for generator 3. -/
theorem ep_Q2_008_partial_03_0634_valid :
    mulPoly ep_Q2_008_coefficient_03_0634
        ep_Q2_008_generator_03_0600_0699 =
      ep_Q2_008_partial_03_0634 := by
  native_decide

/-- Coefficient term 635 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0635 : Poly :=
[
  term ((3976067472187113027 : Rat) / 1385912907228352718) [(9, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 635 for generator 3. -/
def ep_Q2_008_partial_03_0635 : Poly :=
[
  term ((3976067472187113027 : Rat) / 1385912907228352718) [(2, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((3976067472187113027 : Rat) / 1385912907228352718) [(3, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-3976067472187113027 : Rat) / 1385912907228352718) [(8, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-3976067472187113027 : Rat) / 1385912907228352718) [(9, 3), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 635 for generator 3. -/
theorem ep_Q2_008_partial_03_0635_valid :
    mulPoly ep_Q2_008_coefficient_03_0635
        ep_Q2_008_generator_03_0600_0699 =
      ep_Q2_008_partial_03_0635 := by
  native_decide

/-- Coefficient term 636 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0636 : Poly :=
[
  term ((-1969850932679345625 : Rat) / 2771825814456705436) [(9, 1), (11, 1), (12, 2), (16, 1)]
]

/-- Partial product 636 for generator 3. -/
def ep_Q2_008_partial_03_0636 : Poly :=
[
  term ((-1969850932679345625 : Rat) / 2771825814456705436) [(2, 2), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((-1969850932679345625 : Rat) / 2771825814456705436) [(3, 2), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((1969850932679345625 : Rat) / 2771825814456705436) [(8, 2), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((1969850932679345625 : Rat) / 2771825814456705436) [(9, 3), (11, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 636 for generator 3. -/
theorem ep_Q2_008_partial_03_0636_valid :
    mulPoly ep_Q2_008_coefficient_03_0636
        ep_Q2_008_generator_03_0600_0699 =
      ep_Q2_008_partial_03_0636 := by
  native_decide

/-- Coefficient term 637 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0637 : Poly :=
[
  term ((-2343133172956448821031328838872771360000 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 637 for generator 3. -/
def ep_Q2_008_partial_03_0637 : Poly :=
[
  term ((-2343133172956448821031328838872771360000 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2343133172956448821031328838872771360000 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((2343133172956448821031328838872771360000 : Rat) / 84353800925664757687870414129491527348999) [(8, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((2343133172956448821031328838872771360000 : Rat) / 84353800925664757687870414129491527348999) [(9, 3), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 637 for generator 3. -/
theorem ep_Q2_008_partial_03_0637_valid :
    mulPoly ep_Q2_008_coefficient_03_0637
        ep_Q2_008_generator_03_0600_0699 =
      ep_Q2_008_partial_03_0637 := by
  native_decide

/-- Coefficient term 638 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0638 : Poly :=
[
  term ((-19058214854956896000 : Rat) / 692956453614176359) [(9, 1), (11, 1), (13, 2), (16, 1)]
]

/-- Partial product 638 for generator 3. -/
def ep_Q2_008_partial_03_0638 : Poly :=
[
  term ((-19058214854956896000 : Rat) / 692956453614176359) [(2, 2), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((-19058214854956896000 : Rat) / 692956453614176359) [(3, 2), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((19058214854956896000 : Rat) / 692956453614176359) [(8, 2), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((19058214854956896000 : Rat) / 692956453614176359) [(9, 3), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 638 for generator 3. -/
theorem ep_Q2_008_partial_03_0638_valid :
    mulPoly ep_Q2_008_coefficient_03_0638
        ep_Q2_008_generator_03_0600_0699 =
      ep_Q2_008_partial_03_0638 := by
  native_decide

/-- Coefficient term 639 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0639 : Poly :=
[
  term ((-1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(9, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 639 for generator 3. -/
def ep_Q2_008_partial_03_0639 : Poly :=
[
  term ((-1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (9, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((-1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (9, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(8, 2), (9, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(9, 3), (11, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 639 for generator 3. -/
theorem ep_Q2_008_partial_03_0639_valid :
    mulPoly ep_Q2_008_coefficient_03_0639
        ep_Q2_008_generator_03_0600_0699 =
      ep_Q2_008_partial_03_0639 := by
  native_decide

/-- Coefficient term 640 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0640 : Poly :=
[
  term ((-4637633334215077125 : Rat) / 5543651628913410872) [(9, 1), (11, 1), (16, 1)]
]

/-- Partial product 640 for generator 3. -/
def ep_Q2_008_partial_03_0640 : Poly :=
[
  term ((-4637633334215077125 : Rat) / 5543651628913410872) [(2, 2), (9, 1), (11, 1), (16, 1)],
  term ((-4637633334215077125 : Rat) / 5543651628913410872) [(3, 2), (9, 1), (11, 1), (16, 1)],
  term ((4637633334215077125 : Rat) / 5543651628913410872) [(8, 2), (9, 1), (11, 1), (16, 1)],
  term ((4637633334215077125 : Rat) / 5543651628913410872) [(9, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 640 for generator 3. -/
theorem ep_Q2_008_partial_03_0640_valid :
    mulPoly ep_Q2_008_coefficient_03_0640
        ep_Q2_008_generator_03_0600_0699 =
      ep_Q2_008_partial_03_0640 := by
  native_decide

/-- Coefficient term 641 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0641 : Poly :=
[
  term ((39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 641 for generator 3. -/
def ep_Q2_008_partial_03_0641 : Poly :=
[
  term ((39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(8, 2), (9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(9, 3), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 641 for generator 3. -/
theorem ep_Q2_008_partial_03_0641_valid :
    mulPoly ep_Q2_008_coefficient_03_0641
        ep_Q2_008_generator_03_0600_0699 =
      ep_Q2_008_partial_03_0641 := by
  native_decide

/-- Coefficient term 642 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0642 : Poly :=
[
  term ((-52553723233734477915 : Rat) / 5543651628913410872) [(9, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 642 for generator 3. -/
def ep_Q2_008_partial_03_0642 : Poly :=
[
  term ((-52553723233734477915 : Rat) / 5543651628913410872) [(2, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-52553723233734477915 : Rat) / 5543651628913410872) [(3, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((52553723233734477915 : Rat) / 5543651628913410872) [(8, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((52553723233734477915 : Rat) / 5543651628913410872) [(9, 3), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 642 for generator 3. -/
theorem ep_Q2_008_partial_03_0642_valid :
    mulPoly ep_Q2_008_coefficient_03_0642
        ep_Q2_008_generator_03_0600_0699 =
      ep_Q2_008_partial_03_0642 := by
  native_decide

/-- Coefficient term 643 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0643 : Poly :=
[
  term ((25848593045194364880230305998322280985600 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 643 for generator 3. -/
def ep_Q2_008_partial_03_0643 : Poly :=
[
  term ((25848593045194364880230305998322280985600 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (9, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((25848593045194364880230305998322280985600 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (9, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-25848593045194364880230305998322280985600 : Rat) / 84353800925664757687870414129491527348999) [(8, 2), (9, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-25848593045194364880230305998322280985600 : Rat) / 84353800925664757687870414129491527348999) [(9, 3), (12, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 643 for generator 3. -/
theorem ep_Q2_008_partial_03_0643_valid :
    mulPoly ep_Q2_008_coefficient_03_0643
        ep_Q2_008_generator_03_0600_0699 =
      ep_Q2_008_partial_03_0643 := by
  native_decide

/-- Coefficient term 644 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0644 : Poly :=
[
  term ((8551217455814529770681364152578959105675 : Rat) / 168707601851329515375740828258983054697998) [(9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 644 for generator 3. -/
def ep_Q2_008_partial_03_0644 : Poly :=
[
  term ((8551217455814529770681364152578959105675 : Rat) / 168707601851329515375740828258983054697998) [(2, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((8551217455814529770681364152578959105675 : Rat) / 168707601851329515375740828258983054697998) [(3, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-8551217455814529770681364152578959105675 : Rat) / 168707601851329515375740828258983054697998) [(8, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-8551217455814529770681364152578959105675 : Rat) / 168707601851329515375740828258983054697998) [(9, 3), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 644 for generator 3. -/
theorem ep_Q2_008_partial_03_0644_valid :
    mulPoly ep_Q2_008_coefficient_03_0644
        ep_Q2_008_generator_03_0600_0699 =
      ep_Q2_008_partial_03_0644 := by
  native_decide

/-- Coefficient term 645 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0645 : Poly :=
[
  term ((-14931201290749033485079614770147991351825 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 645 for generator 3. -/
def ep_Q2_008_partial_03_0645 : Poly :=
[
  term ((-14931201290749033485079614770147991351825 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-14931201290749033485079614770147991351825 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((14931201290749033485079614770147991351825 : Rat) / 84353800925664757687870414129491527348999) [(8, 2), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((14931201290749033485079614770147991351825 : Rat) / 84353800925664757687870414129491527348999) [(9, 3), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 645 for generator 3. -/
theorem ep_Q2_008_partial_03_0645_valid :
    mulPoly ep_Q2_008_coefficient_03_0645
        ep_Q2_008_generator_03_0600_0699 =
      ep_Q2_008_partial_03_0645 := by
  native_decide

/-- Coefficient term 646 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0646 : Poly :=
[
  term ((-149833476695400603774014037984787123200 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 646 for generator 3. -/
def ep_Q2_008_partial_03_0646 : Poly :=
[
  term ((-149833476695400603774014037984787123200 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-149833476695400603774014037984787123200 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((149833476695400603774014037984787123200 : Rat) / 84353800925664757687870414129491527348999) [(8, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((149833476695400603774014037984787123200 : Rat) / 84353800925664757687870414129491527348999) [(9, 3), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 646 for generator 3. -/
theorem ep_Q2_008_partial_03_0646_valid :
    mulPoly ep_Q2_008_coefficient_03_0646
        ep_Q2_008_generator_03_0600_0699 =
      ep_Q2_008_partial_03_0646 := by
  native_decide

/-- Coefficient term 647 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0647 : Poly :=
[
  term ((8770966736472141765 : Rat) / 692956453614176359) [(9, 1), (13, 1), (16, 1)]
]

/-- Partial product 647 for generator 3. -/
def ep_Q2_008_partial_03_0647 : Poly :=
[
  term ((8770966736472141765 : Rat) / 692956453614176359) [(2, 2), (9, 1), (13, 1), (16, 1)],
  term ((8770966736472141765 : Rat) / 692956453614176359) [(3, 2), (9, 1), (13, 1), (16, 1)],
  term ((-8770966736472141765 : Rat) / 692956453614176359) [(8, 2), (9, 1), (13, 1), (16, 1)],
  term ((-8770966736472141765 : Rat) / 692956453614176359) [(9, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 647 for generator 3. -/
theorem ep_Q2_008_partial_03_0647_valid :
    mulPoly ep_Q2_008_coefficient_03_0647
        ep_Q2_008_generator_03_0600_0699 =
      ep_Q2_008_partial_03_0647 := by
  native_decide

/-- Coefficient term 648 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0648 : Poly :=
[
  term ((-25418021277837777496254186897496336531200 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 648 for generator 3. -/
def ep_Q2_008_partial_03_0648 : Poly :=
[
  term ((-25418021277837777496254186897496336531200 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-25418021277837777496254186897496336531200 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((25418021277837777496254186897496336531200 : Rat) / 84353800925664757687870414129491527348999) [(8, 2), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((25418021277837777496254186897496336531200 : Rat) / 84353800925664757687870414129491527348999) [(9, 3), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 648 for generator 3. -/
theorem ep_Q2_008_partial_03_0648_valid :
    mulPoly ep_Q2_008_coefficient_03_0648
        ep_Q2_008_generator_03_0600_0699 =
      ep_Q2_008_partial_03_0648 := by
  native_decide

/-- Coefficient term 649 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0649 : Poly :=
[
  term ((51933688175996120327605020397671108001875 : Rat) / 168707601851329515375740828258983054697998) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 649 for generator 3. -/
def ep_Q2_008_partial_03_0649 : Poly :=
[
  term ((51933688175996120327605020397671108001875 : Rat) / 168707601851329515375740828258983054697998) [(2, 2), (9, 1), (15, 1), (16, 1)],
  term ((51933688175996120327605020397671108001875 : Rat) / 168707601851329515375740828258983054697998) [(3, 2), (9, 1), (15, 1), (16, 1)],
  term ((-51933688175996120327605020397671108001875 : Rat) / 168707601851329515375740828258983054697998) [(8, 2), (9, 1), (15, 1), (16, 1)],
  term ((-51933688175996120327605020397671108001875 : Rat) / 168707601851329515375740828258983054697998) [(9, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 649 for generator 3. -/
theorem ep_Q2_008_partial_03_0649_valid :
    mulPoly ep_Q2_008_coefficient_03_0649
        ep_Q2_008_generator_03_0600_0699 =
      ep_Q2_008_partial_03_0649 := by
  native_decide

/-- Coefficient term 650 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0650 : Poly :=
[
  term ((39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(9, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 650 for generator 3. -/
def ep_Q2_008_partial_03_0650 : Poly :=
[
  term ((39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (9, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (9, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(8, 2), (9, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(9, 4), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 650 for generator 3. -/
theorem ep_Q2_008_partial_03_0650_valid :
    mulPoly ep_Q2_008_coefficient_03_0650
        ep_Q2_008_generator_03_0600_0699 =
      ep_Q2_008_partial_03_0650 := by
  native_decide

/-- Coefficient term 651 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0651 : Poly :=
[
  term ((-70324786932212700 : Rat) / 692956453614176359) [(9, 2), (12, 1), (16, 1)]
]

/-- Partial product 651 for generator 3. -/
def ep_Q2_008_partial_03_0651 : Poly :=
[
  term ((-70324786932212700 : Rat) / 692956453614176359) [(2, 2), (9, 2), (12, 1), (16, 1)],
  term ((-70324786932212700 : Rat) / 692956453614176359) [(3, 2), (9, 2), (12, 1), (16, 1)],
  term ((70324786932212700 : Rat) / 692956453614176359) [(8, 2), (9, 2), (12, 1), (16, 1)],
  term ((70324786932212700 : Rat) / 692956453614176359) [(9, 4), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 651 for generator 3. -/
theorem ep_Q2_008_partial_03_0651_valid :
    mulPoly ep_Q2_008_coefficient_03_0651
        ep_Q2_008_generator_03_0600_0699 =
      ep_Q2_008_partial_03_0651 := by
  native_decide

/-- Coefficient term 652 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0652 : Poly :=
[
  term ((-39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(9, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 652 for generator 3. -/
def ep_Q2_008_partial_03_0652 : Poly :=
[
  term ((-39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(8, 2), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(9, 4), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 652 for generator 3. -/
theorem ep_Q2_008_partial_03_0652_valid :
    mulPoly ep_Q2_008_coefficient_03_0652
        ep_Q2_008_generator_03_0600_0699 =
      ep_Q2_008_partial_03_0652 := by
  native_decide

/-- Coefficient term 653 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0653 : Poly :=
[
  term ((70324786932212700 : Rat) / 692956453614176359) [(9, 2), (16, 1)]
]

/-- Partial product 653 for generator 3. -/
def ep_Q2_008_partial_03_0653 : Poly :=
[
  term ((70324786932212700 : Rat) / 692956453614176359) [(2, 2), (9, 2), (16, 1)],
  term ((70324786932212700 : Rat) / 692956453614176359) [(3, 2), (9, 2), (16, 1)],
  term ((-70324786932212700 : Rat) / 692956453614176359) [(8, 2), (9, 2), (16, 1)],
  term ((-70324786932212700 : Rat) / 692956453614176359) [(9, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 653 for generator 3. -/
theorem ep_Q2_008_partial_03_0653_valid :
    mulPoly ep_Q2_008_coefficient_03_0653
        ep_Q2_008_generator_03_0600_0699 =
      ep_Q2_008_partial_03_0653 := by
  native_decide

/-- Coefficient term 654 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0654 : Poly :=
[
  term ((-7461680854172397750 : Rat) / 692956453614176359) [(10, 1), (11, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 654 for generator 3. -/
def ep_Q2_008_partial_03_0654 : Poly :=
[
  term ((-7461680854172397750 : Rat) / 692956453614176359) [(2, 2), (10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-7461680854172397750 : Rat) / 692956453614176359) [(3, 2), (10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((7461680854172397750 : Rat) / 692956453614176359) [(8, 2), (10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((7461680854172397750 : Rat) / 692956453614176359) [(9, 2), (10, 1), (11, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 654 for generator 3. -/
theorem ep_Q2_008_partial_03_0654_valid :
    mulPoly ep_Q2_008_coefficient_03_0654
        ep_Q2_008_generator_03_0600_0699 =
      ep_Q2_008_partial_03_0654 := by
  native_decide

/-- Coefficient term 655 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0655 : Poly :=
[
  term ((-98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(10, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 655 for generator 3. -/
def ep_Q2_008_partial_03_0655 : Poly :=
[
  term ((-98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (10, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (10, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(8, 2), (10, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(9, 2), (10, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 655 for generator 3. -/
theorem ep_Q2_008_partial_03_0655_valid :
    mulPoly ep_Q2_008_coefficient_03_0655
        ep_Q2_008_generator_03_0600_0699 =
      ep_Q2_008_partial_03_0655 := by
  native_decide

/-- Coefficient term 656 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0656 : Poly :=
[
  term ((3889714471092129375 : Rat) / 1385912907228352718) [(10, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 656 for generator 3. -/
def ep_Q2_008_partial_03_0656 : Poly :=
[
  term ((3889714471092129375 : Rat) / 1385912907228352718) [(2, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((3889714471092129375 : Rat) / 1385912907228352718) [(3, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-3889714471092129375 : Rat) / 1385912907228352718) [(8, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-3889714471092129375 : Rat) / 1385912907228352718) [(9, 2), (10, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 656 for generator 3. -/
theorem ep_Q2_008_partial_03_0656_valid :
    mulPoly ep_Q2_008_coefficient_03_0656
        ep_Q2_008_generator_03_0600_0699 =
      ep_Q2_008_partial_03_0656 := by
  native_decide

/-- Coefficient term 657 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0657 : Poly :=
[
  term ((128888067226419176493525738138102386112300 : Rat) / 84353800925664757687870414129491527348999) [(10, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 657 for generator 3. -/
def ep_Q2_008_partial_03_0657 : Poly :=
[
  term ((128888067226419176493525738138102386112300 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (10, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((128888067226419176493525738138102386112300 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (10, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-128888067226419176493525738138102386112300 : Rat) / 84353800925664757687870414129491527348999) [(8, 2), (10, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-128888067226419176493525738138102386112300 : Rat) / 84353800925664757687870414129491527348999) [(9, 2), (10, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 657 for generator 3. -/
theorem ep_Q2_008_partial_03_0657_valid :
    mulPoly ep_Q2_008_coefficient_03_0657
        ep_Q2_008_generator_03_0600_0699 =
      ep_Q2_008_partial_03_0657 := by
  native_decide

/-- Coefficient term 658 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0658 : Poly :=
[
  term ((197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(10, 1), (11, 1), (13, 3), (15, 2), (16, 1)]
]

/-- Partial product 658 for generator 3. -/
def ep_Q2_008_partial_03_0658 : Poly :=
[
  term ((197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (10, 1), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (10, 1), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((-197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(8, 2), (10, 1), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((-197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(9, 2), (10, 1), (11, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 658 for generator 3. -/
theorem ep_Q2_008_partial_03_0658_valid :
    mulPoly ep_Q2_008_coefficient_03_0658
        ep_Q2_008_generator_03_0600_0699 =
      ep_Q2_008_partial_03_0658 := by
  native_decide

/-- Coefficient term 659 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0659 : Poly :=
[
  term ((14293661141217672000 : Rat) / 692956453614176359) [(10, 1), (11, 1), (13, 3), (16, 1)]
]

/-- Partial product 659 for generator 3. -/
def ep_Q2_008_partial_03_0659 : Poly :=
[
  term ((14293661141217672000 : Rat) / 692956453614176359) [(2, 2), (10, 1), (11, 1), (13, 3), (16, 1)],
  term ((14293661141217672000 : Rat) / 692956453614176359) [(3, 2), (10, 1), (11, 1), (13, 3), (16, 1)],
  term ((-14293661141217672000 : Rat) / 692956453614176359) [(8, 2), (10, 1), (11, 1), (13, 3), (16, 1)],
  term ((-14293661141217672000 : Rat) / 692956453614176359) [(9, 2), (10, 1), (11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 659 for generator 3. -/
theorem ep_Q2_008_partial_03_0659_valid :
    mulPoly ep_Q2_008_coefficient_03_0659
        ep_Q2_008_generator_03_0600_0699 =
      ep_Q2_008_partial_03_0659 := by
  native_decide

/-- Coefficient term 660 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0660 : Poly :=
[
  term ((1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(10, 1), (11, 1), (13, 4), (15, 1), (16, 1)]
]

/-- Partial product 660 for generator 3. -/
def ep_Q2_008_partial_03_0660 : Poly :=
[
  term ((1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (10, 1), (11, 1), (13, 4), (15, 1), (16, 1)],
  term ((1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (10, 1), (11, 1), (13, 4), (15, 1), (16, 1)],
  term ((-1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(8, 2), (10, 1), (11, 1), (13, 4), (15, 1), (16, 1)],
  term ((-1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(9, 2), (10, 1), (11, 1), (13, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 660 for generator 3. -/
theorem ep_Q2_008_partial_03_0660_valid :
    mulPoly ep_Q2_008_coefficient_03_0660
        ep_Q2_008_generator_03_0600_0699 =
      ep_Q2_008_partial_03_0660 := by
  native_decide

/-- Coefficient term 661 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0661 : Poly :=
[
  term ((-33865111170431304111397000478307417161400 : Rat) / 84353800925664757687870414129491527348999) [(10, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 661 for generator 3. -/
def ep_Q2_008_partial_03_0661 : Poly :=
[
  term ((-33865111170431304111397000478307417161400 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-33865111170431304111397000478307417161400 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((33865111170431304111397000478307417161400 : Rat) / 84353800925664757687870414129491527348999) [(8, 2), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((33865111170431304111397000478307417161400 : Rat) / 84353800925664757687870414129491527348999) [(9, 2), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 661 for generator 3. -/
theorem ep_Q2_008_partial_03_0661_valid :
    mulPoly ep_Q2_008_coefficient_03_0661
        ep_Q2_008_generator_03_0600_0699 =
      ep_Q2_008_partial_03_0661 := by
  native_decide

/-- Coefficient term 662 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0662 : Poly :=
[
  term ((-15855689783583275517 : Rat) / 5543651628913410872) [(10, 1), (12, 1), (16, 1)]
]

/-- Partial product 662 for generator 3. -/
def ep_Q2_008_partial_03_0662 : Poly :=
[
  term ((-15855689783583275517 : Rat) / 5543651628913410872) [(2, 2), (10, 1), (12, 1), (16, 1)],
  term ((-15855689783583275517 : Rat) / 5543651628913410872) [(3, 2), (10, 1), (12, 1), (16, 1)],
  term ((15855689783583275517 : Rat) / 5543651628913410872) [(8, 2), (10, 1), (12, 1), (16, 1)],
  term ((15855689783583275517 : Rat) / 5543651628913410872) [(9, 2), (10, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 662 for generator 3. -/
theorem ep_Q2_008_partial_03_0662_valid :
    mulPoly ep_Q2_008_coefficient_03_0662
        ep_Q2_008_generator_03_0600_0699 =
      ep_Q2_008_partial_03_0662 := by
  native_decide

/-- Coefficient term 663 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0663 : Poly :=
[
  term ((3472989950292534000 : Rat) / 692956453614176359) [(10, 1), (12, 2), (16, 1)]
]

/-- Partial product 663 for generator 3. -/
def ep_Q2_008_partial_03_0663 : Poly :=
[
  term ((3472989950292534000 : Rat) / 692956453614176359) [(2, 2), (10, 1), (12, 2), (16, 1)],
  term ((3472989950292534000 : Rat) / 692956453614176359) [(3, 2), (10, 1), (12, 2), (16, 1)],
  term ((-3472989950292534000 : Rat) / 692956453614176359) [(8, 2), (10, 1), (12, 2), (16, 1)],
  term ((-3472989950292534000 : Rat) / 692956453614176359) [(9, 2), (10, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 663 for generator 3. -/
theorem ep_Q2_008_partial_03_0663_valid :
    mulPoly ep_Q2_008_coefficient_03_0663
        ep_Q2_008_generator_03_0600_0699 =
      ep_Q2_008_partial_03_0663 := by
  native_decide

/-- Coefficient term 664 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0664 : Poly :=
[
  term ((-5079133510334155108456437850925402239044621 : Rat) / 337415203702659030751481656517966109395996) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 664 for generator 3. -/
def ep_Q2_008_partial_03_0664 : Poly :=
[
  term ((-5079133510334155108456437850925402239044621 : Rat) / 337415203702659030751481656517966109395996) [(2, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5079133510334155108456437850925402239044621 : Rat) / 337415203702659030751481656517966109395996) [(3, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((5079133510334155108456437850925402239044621 : Rat) / 337415203702659030751481656517966109395996) [(8, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((5079133510334155108456437850925402239044621 : Rat) / 337415203702659030751481656517966109395996) [(9, 2), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 664 for generator 3. -/
theorem ep_Q2_008_partial_03_0664_valid :
    mulPoly ep_Q2_008_coefficient_03_0664
        ep_Q2_008_generator_03_0600_0699 =
      ep_Q2_008_partial_03_0664 := by
  native_decide

/-- Coefficient term 665 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0665 : Poly :=
[
  term ((68430322247582819758754083757459259078000 : Rat) / 84353800925664757687870414129491527348999) [(10, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 665 for generator 3. -/
def ep_Q2_008_partial_03_0665 : Poly :=
[
  term ((68430322247582819758754083757459259078000 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((68430322247582819758754083757459259078000 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((-68430322247582819758754083757459259078000 : Rat) / 84353800925664757687870414129491527348999) [(8, 2), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((-68430322247582819758754083757459259078000 : Rat) / 84353800925664757687870414129491527348999) [(9, 2), (10, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 665 for generator 3. -/
theorem ep_Q2_008_partial_03_0665_valid :
    mulPoly ep_Q2_008_coefficient_03_0665
        ep_Q2_008_generator_03_0600_0699 =
      ep_Q2_008_partial_03_0665 := by
  native_decide

/-- Coefficient term 666 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0666 : Poly :=
[
  term ((-13165974220555668321 : Rat) / 1385912907228352718) [(10, 1), (13, 2), (16, 1)]
]

/-- Partial product 666 for generator 3. -/
def ep_Q2_008_partial_03_0666 : Poly :=
[
  term ((-13165974220555668321 : Rat) / 1385912907228352718) [(2, 2), (10, 1), (13, 2), (16, 1)],
  term ((-13165974220555668321 : Rat) / 1385912907228352718) [(3, 2), (10, 1), (13, 2), (16, 1)],
  term ((13165974220555668321 : Rat) / 1385912907228352718) [(8, 2), (10, 1), (13, 2), (16, 1)],
  term ((13165974220555668321 : Rat) / 1385912907228352718) [(9, 2), (10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 666 for generator 3. -/
theorem ep_Q2_008_partial_03_0666_valid :
    mulPoly ep_Q2_008_coefficient_03_0666
        ep_Q2_008_generator_03_0600_0699 =
      ep_Q2_008_partial_03_0666 := by
  native_decide

/-- Coefficient term 667 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0667 : Poly :=
[
  term ((10779073614648400407325874854616096179200 : Rat) / 84353800925664757687870414129491527348999) [(10, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 667 for generator 3. -/
def ep_Q2_008_partial_03_0667 : Poly :=
[
  term ((10779073614648400407325874854616096179200 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (10, 1), (13, 3), (15, 1), (16, 1)],
  term ((10779073614648400407325874854616096179200 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (10, 1), (13, 3), (15, 1), (16, 1)],
  term ((-10779073614648400407325874854616096179200 : Rat) / 84353800925664757687870414129491527348999) [(8, 2), (10, 1), (13, 3), (15, 1), (16, 1)],
  term ((-10779073614648400407325874854616096179200 : Rat) / 84353800925664757687870414129491527348999) [(9, 2), (10, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 667 for generator 3. -/
theorem ep_Q2_008_partial_03_0667_valid :
    mulPoly ep_Q2_008_coefficient_03_0667
        ep_Q2_008_generator_03_0600_0699 =
      ep_Q2_008_partial_03_0667 := by
  native_decide

/-- Coefficient term 668 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0668 : Poly :=
[
  term ((-13944805926705838233 : Rat) / 11087303257826821744) [(10, 1), (16, 1)]
]

/-- Partial product 668 for generator 3. -/
def ep_Q2_008_partial_03_0668 : Poly :=
[
  term ((-13944805926705838233 : Rat) / 11087303257826821744) [(2, 2), (10, 1), (16, 1)],
  term ((-13944805926705838233 : Rat) / 11087303257826821744) [(3, 2), (10, 1), (16, 1)],
  term ((13944805926705838233 : Rat) / 11087303257826821744) [(8, 2), (10, 1), (16, 1)],
  term ((13944805926705838233 : Rat) / 11087303257826821744) [(9, 2), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 668 for generator 3. -/
theorem ep_Q2_008_partial_03_0668_valid :
    mulPoly ep_Q2_008_coefficient_03_0668
        ep_Q2_008_generator_03_0600_0699 =
      ep_Q2_008_partial_03_0668 := by
  native_decide

/-- Coefficient term 669 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0669 : Poly :=
[
  term ((6945979900585068000 : Rat) / 692956453614176359) [(10, 2), (13, 2), (16, 1)]
]

/-- Partial product 669 for generator 3. -/
def ep_Q2_008_partial_03_0669 : Poly :=
[
  term ((6945979900585068000 : Rat) / 692956453614176359) [(2, 2), (10, 2), (13, 2), (16, 1)],
  term ((6945979900585068000 : Rat) / 692956453614176359) [(3, 2), (10, 2), (13, 2), (16, 1)],
  term ((-6945979900585068000 : Rat) / 692956453614176359) [(8, 2), (10, 2), (13, 2), (16, 1)],
  term ((-6945979900585068000 : Rat) / 692956453614176359) [(9, 2), (10, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 669 for generator 3. -/
theorem ep_Q2_008_partial_03_0669_valid :
    mulPoly ep_Q2_008_coefficient_03_0669
        ep_Q2_008_generator_03_0600_0699 =
      ep_Q2_008_partial_03_0669 := by
  native_decide

/-- Coefficient term 670 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0670 : Poly :=
[
  term ((-11020747726338080733 : Rat) / 11087303257826821744) [(10, 2), (16, 1)]
]

/-- Partial product 670 for generator 3. -/
def ep_Q2_008_partial_03_0670 : Poly :=
[
  term ((-11020747726338080733 : Rat) / 11087303257826821744) [(2, 2), (10, 2), (16, 1)],
  term ((-11020747726338080733 : Rat) / 11087303257826821744) [(3, 2), (10, 2), (16, 1)],
  term ((11020747726338080733 : Rat) / 11087303257826821744) [(8, 2), (10, 2), (16, 1)],
  term ((11020747726338080733 : Rat) / 11087303257826821744) [(9, 2), (10, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 670 for generator 3. -/
theorem ep_Q2_008_partial_03_0670_valid :
    mulPoly ep_Q2_008_coefficient_03_0670
        ep_Q2_008_generator_03_0600_0699 =
      ep_Q2_008_partial_03_0670 := by
  native_decide

/-- Coefficient term 671 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0671 : Poly :=
[
  term ((-68202314783046340579097975438786756934000 : Rat) / 84353800925664757687870414129491527348999) [(11, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 671 for generator 3. -/
def ep_Q2_008_partial_03_0671 : Poly :=
[
  term ((-68202314783046340579097975438786756934000 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-68202314783046340579097975438786756934000 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((68202314783046340579097975438786756934000 : Rat) / 84353800925664757687870414129491527348999) [(8, 2), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((68202314783046340579097975438786756934000 : Rat) / 84353800925664757687870414129491527348999) [(9, 2), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 671 for generator 3. -/
theorem ep_Q2_008_partial_03_0671_valid :
    mulPoly ep_Q2_008_coefficient_03_0671
        ep_Q2_008_generator_03_0600_0699 =
      ep_Q2_008_partial_03_0671 := by
  native_decide

/-- Coefficient term 672 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0672 : Poly :=
[
  term ((33011954073735634017 : Rat) / 2771825814456705436) [(11, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 672 for generator 3. -/
def ep_Q2_008_partial_03_0672 : Poly :=
[
  term ((33011954073735634017 : Rat) / 2771825814456705436) [(2, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((33011954073735634017 : Rat) / 2771825814456705436) [(3, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-33011954073735634017 : Rat) / 2771825814456705436) [(8, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-33011954073735634017 : Rat) / 2771825814456705436) [(9, 2), (11, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 672 for generator 3. -/
theorem ep_Q2_008_partial_03_0672_valid :
    mulPoly ep_Q2_008_coefficient_03_0672
        ep_Q2_008_generator_03_0600_0699 =
      ep_Q2_008_partial_03_0672 := by
  native_decide

/-- Coefficient term 673 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0673 : Poly :=
[
  term ((-24042943756448620939600870092072284390400 : Rat) / 84353800925664757687870414129491527348999) [(11, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 673 for generator 3. -/
def ep_Q2_008_partial_03_0673 : Poly :=
[
  term ((-24042943756448620939600870092072284390400 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-24042943756448620939600870092072284390400 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((24042943756448620939600870092072284390400 : Rat) / 84353800925664757687870414129491527348999) [(8, 2), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((24042943756448620939600870092072284390400 : Rat) / 84353800925664757687870414129491527348999) [(9, 2), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 673 for generator 3. -/
theorem ep_Q2_008_partial_03_0673_valid :
    mulPoly ep_Q2_008_coefficient_03_0673
        ep_Q2_008_generator_03_0600_0699 =
      ep_Q2_008_partial_03_0673 := by
  native_decide

/-- Coefficient term 674 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0674 : Poly :=
[
  term ((634934315306295958173975109401654207223221 : Rat) / 337415203702659030751481656517966109395996) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 674 for generator 3. -/
def ep_Q2_008_partial_03_0674 : Poly :=
[
  term ((634934315306295958173975109401654207223221 : Rat) / 337415203702659030751481656517966109395996) [(2, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((634934315306295958173975109401654207223221 : Rat) / 337415203702659030751481656517966109395996) [(3, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-634934315306295958173975109401654207223221 : Rat) / 337415203702659030751481656517966109395996) [(8, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-634934315306295958173975109401654207223221 : Rat) / 337415203702659030751481656517966109395996) [(9, 2), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 674 for generator 3. -/
theorem ep_Q2_008_partial_03_0674_valid :
    mulPoly ep_Q2_008_coefficient_03_0674
        ep_Q2_008_generator_03_0600_0699 =
      ep_Q2_008_partial_03_0674 := by
  native_decide

/-- Coefficient term 675 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0675 : Poly :=
[
  term ((9529107427478448000 : Rat) / 692956453614176359) [(11, 1), (12, 2), (13, 1), (16, 1)]
]

/-- Partial product 675 for generator 3. -/
def ep_Q2_008_partial_03_0675 : Poly :=
[
  term ((9529107427478448000 : Rat) / 692956453614176359) [(2, 2), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((9529107427478448000 : Rat) / 692956453614176359) [(3, 2), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-9529107427478448000 : Rat) / 692956453614176359) [(8, 2), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-9529107427478448000 : Rat) / 692956453614176359) [(9, 2), (11, 1), (12, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 675 for generator 3. -/
theorem ep_Q2_008_partial_03_0675_valid :
    mulPoly ep_Q2_008_coefficient_03_0675
        ep_Q2_008_generator_03_0600_0699 =
      ep_Q2_008_partial_03_0675 := by
  native_decide

/-- Coefficient term 676 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0676 : Poly :=
[
  term ((788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (12, 2), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 676 for generator 3. -/
def ep_Q2_008_partial_03_0676 : Poly :=
[
  term ((788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (11, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (11, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((-788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(8, 2), (11, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((-788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(9, 2), (11, 1), (12, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 676 for generator 3. -/
theorem ep_Q2_008_partial_03_0676_valid :
    mulPoly ep_Q2_008_coefficient_03_0676
        ep_Q2_008_generator_03_0600_0699 =
      ep_Q2_008_partial_03_0676 := by
  native_decide

/-- Coefficient term 677 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0677 : Poly :=
[
  term ((1216729051811765980483263849554153117400 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 677 for generator 3. -/
def ep_Q2_008_partial_03_0677 : Poly :=
[
  term ((1216729051811765980483263849554153117400 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((1216729051811765980483263849554153117400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1216729051811765980483263849554153117400 : Rat) / 2908751756057405437512772901016949218931) [(8, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1216729051811765980483263849554153117400 : Rat) / 2908751756057405437512772901016949218931) [(9, 2), (11, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 677 for generator 3. -/
theorem ep_Q2_008_partial_03_0677_valid :
    mulPoly ep_Q2_008_coefficient_03_0677
        ep_Q2_008_generator_03_0600_0699 =
      ep_Q2_008_partial_03_0677 := by
  native_decide

/-- Coefficient term 678 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0678 : Poly :=
[
  term ((-1878818142074568083506959096542607936000 : Rat) / 84353800925664757687870414129491527348999) [(11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 678 for generator 3. -/
def ep_Q2_008_partial_03_0678 : Poly :=
[
  term ((-1878818142074568083506959096542607936000 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1878818142074568083506959096542607936000 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((1878818142074568083506959096542607936000 : Rat) / 84353800925664757687870414129491527348999) [(8, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((1878818142074568083506959096542607936000 : Rat) / 84353800925664757687870414129491527348999) [(9, 2), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 678 for generator 3. -/
theorem ep_Q2_008_partial_03_0678_valid :
    mulPoly ep_Q2_008_coefficient_03_0678
        ep_Q2_008_generator_03_0600_0699 =
      ep_Q2_008_partial_03_0678 := by
  native_decide

/-- Coefficient term 679 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0679 : Poly :=
[
  term ((-97696237937503057875 : Rat) / 11087303257826821744) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 679 for generator 3. -/
def ep_Q2_008_partial_03_0679 : Poly :=
[
  term ((-97696237937503057875 : Rat) / 11087303257826821744) [(2, 2), (11, 1), (13, 1), (16, 1)],
  term ((-97696237937503057875 : Rat) / 11087303257826821744) [(3, 2), (11, 1), (13, 1), (16, 1)],
  term ((97696237937503057875 : Rat) / 11087303257826821744) [(8, 2), (11, 1), (13, 1), (16, 1)],
  term ((97696237937503057875 : Rat) / 11087303257826821744) [(9, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 679 for generator 3. -/
theorem ep_Q2_008_partial_03_0679_valid :
    mulPoly ep_Q2_008_coefficient_03_0679
        ep_Q2_008_generator_03_0600_0699 =
      ep_Q2_008_partial_03_0679 := by
  native_decide

/-- Coefficient term 680 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0680 : Poly :=
[
  term ((-1748077855914345199985729841647917161427200 : Rat) / 84353800925664757687870414129491527348999) [(11, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 680 for generator 3. -/
def ep_Q2_008_partial_03_0680 : Poly :=
[
  term ((-1748077855914345199985729841647917161427200 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1748077855914345199985729841647917161427200 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((1748077855914345199985729841647917161427200 : Rat) / 84353800925664757687870414129491527348999) [(8, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((1748077855914345199985729841647917161427200 : Rat) / 84353800925664757687870414129491527348999) [(9, 2), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 680 for generator 3. -/
theorem ep_Q2_008_partial_03_0680_valid :
    mulPoly ep_Q2_008_coefficient_03_0680
        ep_Q2_008_generator_03_0600_0699 =
      ep_Q2_008_partial_03_0680 := by
  native_decide

/-- Coefficient term 681 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0681 : Poly :=
[
  term ((-1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (13, 3), (15, 2), (16, 1)]
]

/-- Partial product 681 for generator 3. -/
def ep_Q2_008_partial_03_0681 : Poly :=
[
  term ((-1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((-1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(8, 2), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(9, 2), (11, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 681 for generator 3. -/
theorem ep_Q2_008_partial_03_0681_valid :
    mulPoly ep_Q2_008_coefficient_03_0681
        ep_Q2_008_generator_03_0600_0699 =
      ep_Q2_008_partial_03_0681 := by
  native_decide

/-- Coefficient term 682 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0682 : Poly :=
[
  term ((19058214854956896000 : Rat) / 692956453614176359) [(11, 1), (13, 3), (16, 1)]
]

/-- Partial product 682 for generator 3. -/
def ep_Q2_008_partial_03_0682 : Poly :=
[
  term ((19058214854956896000 : Rat) / 692956453614176359) [(2, 2), (11, 1), (13, 3), (16, 1)],
  term ((19058214854956896000 : Rat) / 692956453614176359) [(3, 2), (11, 1), (13, 3), (16, 1)],
  term ((-19058214854956896000 : Rat) / 692956453614176359) [(8, 2), (11, 1), (13, 3), (16, 1)],
  term ((-19058214854956896000 : Rat) / 692956453614176359) [(9, 2), (11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 682 for generator 3. -/
theorem ep_Q2_008_partial_03_0682_valid :
    mulPoly ep_Q2_008_coefficient_03_0682
        ep_Q2_008_generator_03_0600_0699 =
      ep_Q2_008_partial_03_0682 := by
  native_decide

/-- Coefficient term 683 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0683 : Poly :=
[
  term ((1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (13, 4), (15, 1), (16, 1)]
]

/-- Partial product 683 for generator 3. -/
def ep_Q2_008_partial_03_0683 : Poly :=
[
  term ((1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (11, 1), (13, 4), (15, 1), (16, 1)],
  term ((1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (11, 1), (13, 4), (15, 1), (16, 1)],
  term ((-1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(8, 2), (11, 1), (13, 4), (15, 1), (16, 1)],
  term ((-1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(9, 2), (11, 1), (13, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 683 for generator 3. -/
theorem ep_Q2_008_partial_03_0683_valid :
    mulPoly ep_Q2_008_coefficient_03_0683
        ep_Q2_008_generator_03_0600_0699 =
      ep_Q2_008_partial_03_0683 := by
  native_decide

/-- Coefficient term 684 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0684 : Poly :=
[
  term ((102041838154402569700306115948852911654725 : Rat) / 84353800925664757687870414129491527348999) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 684 for generator 3. -/
def ep_Q2_008_partial_03_0684 : Poly :=
[
  term ((102041838154402569700306115948852911654725 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (11, 1), (15, 1), (16, 1)],
  term ((102041838154402569700306115948852911654725 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (11, 1), (15, 1), (16, 1)],
  term ((-102041838154402569700306115948852911654725 : Rat) / 84353800925664757687870414129491527348999) [(8, 2), (11, 1), (15, 1), (16, 1)],
  term ((-102041838154402569700306115948852911654725 : Rat) / 84353800925664757687870414129491527348999) [(9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 684 for generator 3. -/
theorem ep_Q2_008_partial_03_0684_valid :
    mulPoly ep_Q2_008_coefficient_03_0684
        ep_Q2_008_generator_03_0600_0699 =
      ep_Q2_008_partial_03_0684 := by
  native_decide

/-- Coefficient term 685 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0685 : Poly :=
[
  term ((-134607341108404353960247653855076339622700 : Rat) / 84353800925664757687870414129491527348999) [(11, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 685 for generator 3. -/
def ep_Q2_008_partial_03_0685 : Poly :=
[
  term ((-134607341108404353960247653855076339622700 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-134607341108404353960247653855076339622700 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((134607341108404353960247653855076339622700 : Rat) / 84353800925664757687870414129491527348999) [(8, 2), (11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((134607341108404353960247653855076339622700 : Rat) / 84353800925664757687870414129491527348999) [(9, 2), (11, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 685 for generator 3. -/
theorem ep_Q2_008_partial_03_0685_valid :
    mulPoly ep_Q2_008_coefficient_03_0685
        ep_Q2_008_generator_03_0600_0699 =
      ep_Q2_008_partial_03_0685 := by
  native_decide

/-- Coefficient term 686 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0686 : Poly :=
[
  term ((-197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(11, 2), (12, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 686 for generator 3. -/
def ep_Q2_008_partial_03_0686 : Poly :=
[
  term ((-197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (11, 2), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (11, 2), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(8, 2), (11, 2), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(9, 2), (11, 2), (12, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 686 for generator 3. -/
theorem ep_Q2_008_partial_03_0686_valid :
    mulPoly ep_Q2_008_coefficient_03_0686
        ep_Q2_008_generator_03_0600_0699 =
      ep_Q2_008_partial_03_0686 := by
  native_decide

/-- Coefficient term 687 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0687 : Poly :=
[
  term ((-14293661141217672000 : Rat) / 692956453614176359) [(11, 2), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 687 for generator 3. -/
def ep_Q2_008_partial_03_0687 : Poly :=
[
  term ((-14293661141217672000 : Rat) / 692956453614176359) [(2, 2), (11, 2), (12, 1), (13, 2), (16, 1)],
  term ((-14293661141217672000 : Rat) / 692956453614176359) [(3, 2), (11, 2), (12, 1), (13, 2), (16, 1)],
  term ((14293661141217672000 : Rat) / 692956453614176359) [(8, 2), (11, 2), (12, 1), (13, 2), (16, 1)],
  term ((14293661141217672000 : Rat) / 692956453614176359) [(9, 2), (11, 2), (12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 687 for generator 3. -/
theorem ep_Q2_008_partial_03_0687_valid :
    mulPoly ep_Q2_008_coefficient_03_0687
        ep_Q2_008_generator_03_0600_0699 =
      ep_Q2_008_partial_03_0687 := by
  native_decide

/-- Coefficient term 688 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0688 : Poly :=
[
  term ((-1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(11, 2), (12, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 688 for generator 3. -/
def ep_Q2_008_partial_03_0688 : Poly :=
[
  term ((-1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (11, 2), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (11, 2), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(8, 2), (11, 2), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(9, 2), (11, 2), (12, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 688 for generator 3. -/
theorem ep_Q2_008_partial_03_0688_valid :
    mulPoly ep_Q2_008_coefficient_03_0688
        ep_Q2_008_generator_03_0600_0699 =
      ep_Q2_008_partial_03_0688 := by
  native_decide

/-- Coefficient term 689 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0689 : Poly :=
[
  term ((-5952518285441448375 : Rat) / 1385912907228352718) [(11, 2), (12, 1), (16, 1)]
]

/-- Partial product 689 for generator 3. -/
def ep_Q2_008_partial_03_0689 : Poly :=
[
  term ((-5952518285441448375 : Rat) / 1385912907228352718) [(2, 2), (11, 2), (12, 1), (16, 1)],
  term ((-5952518285441448375 : Rat) / 1385912907228352718) [(3, 2), (11, 2), (12, 1), (16, 1)],
  term ((5952518285441448375 : Rat) / 1385912907228352718) [(8, 2), (11, 2), (12, 1), (16, 1)],
  term ((5952518285441448375 : Rat) / 1385912907228352718) [(9, 2), (11, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 689 for generator 3. -/
theorem ep_Q2_008_partial_03_0689_valid :
    mulPoly ep_Q2_008_coefficient_03_0689
        ep_Q2_008_generator_03_0600_0699 =
      ep_Q2_008_partial_03_0689 := by
  native_decide

/-- Coefficient term 690 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0690 : Poly :=
[
  term ((98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(11, 2), (12, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 690 for generator 3. -/
def ep_Q2_008_partial_03_0690 : Poly :=
[
  term ((98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (11, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (11, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(8, 2), (11, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(9, 2), (11, 2), (12, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 690 for generator 3. -/
theorem ep_Q2_008_partial_03_0690_valid :
    mulPoly ep_Q2_008_coefficient_03_0690
        ep_Q2_008_generator_03_0600_0699 =
      ep_Q2_008_partial_03_0690 := by
  native_decide

/-- Coefficient term 691 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0691 : Poly :=
[
  term ((515700953587329750 : Rat) / 692956453614176359) [(11, 2), (12, 2), (16, 1)]
]

/-- Partial product 691 for generator 3. -/
def ep_Q2_008_partial_03_0691 : Poly :=
[
  term ((515700953587329750 : Rat) / 692956453614176359) [(2, 2), (11, 2), (12, 2), (16, 1)],
  term ((515700953587329750 : Rat) / 692956453614176359) [(3, 2), (11, 2), (12, 2), (16, 1)],
  term ((-515700953587329750 : Rat) / 692956453614176359) [(8, 2), (11, 2), (12, 2), (16, 1)],
  term ((-515700953587329750 : Rat) / 692956453614176359) [(9, 2), (11, 2), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 691 for generator 3. -/
theorem ep_Q2_008_partial_03_0691_valid :
    mulPoly ep_Q2_008_coefficient_03_0691
        ep_Q2_008_generator_03_0600_0699 =
      ep_Q2_008_partial_03_0691 := by
  native_decide

/-- Coefficient term 692 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0692 : Poly :=
[
  term ((2020738218372206486401553021194845523200 : Rat) / 84353800925664757687870414129491527348999) [(11, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 692 for generator 3. -/
def ep_Q2_008_partial_03_0692 : Poly :=
[
  term ((2020738218372206486401553021194845523200 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((2020738218372206486401553021194845523200 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-2020738218372206486401553021194845523200 : Rat) / 84353800925664757687870414129491527348999) [(8, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-2020738218372206486401553021194845523200 : Rat) / 84353800925664757687870414129491527348999) [(9, 2), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 692 for generator 3. -/
theorem ep_Q2_008_partial_03_0692_valid :
    mulPoly ep_Q2_008_coefficient_03_0692
        ep_Q2_008_generator_03_0600_0699 =
      ep_Q2_008_partial_03_0692 := by
  native_decide

/-- Coefficient term 693 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0693 : Poly :=
[
  term ((-375613366775954733 : Rat) / 11087303257826821744) [(11, 2), (16, 1)]
]

/-- Partial product 693 for generator 3. -/
def ep_Q2_008_partial_03_0693 : Poly :=
[
  term ((-375613366775954733 : Rat) / 11087303257826821744) [(2, 2), (11, 2), (16, 1)],
  term ((-375613366775954733 : Rat) / 11087303257826821744) [(3, 2), (11, 2), (16, 1)],
  term ((375613366775954733 : Rat) / 11087303257826821744) [(8, 2), (11, 2), (16, 1)],
  term ((375613366775954733 : Rat) / 11087303257826821744) [(9, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 693 for generator 3. -/
theorem ep_Q2_008_partial_03_0693_valid :
    mulPoly ep_Q2_008_coefficient_03_0693
        ep_Q2_008_generator_03_0600_0699 =
      ep_Q2_008_partial_03_0693 := by
  native_decide

/-- Coefficient term 694 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0694 : Poly :=
[
  term ((-9600253026263363831800507906467207035025 : Rat) / 84353800925664757687870414129491527348999) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 694 for generator 3. -/
def ep_Q2_008_partial_03_0694 : Poly :=
[
  term ((-9600253026263363831800507906467207035025 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-9600253026263363831800507906467207035025 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((9600253026263363831800507906467207035025 : Rat) / 84353800925664757687870414129491527348999) [(8, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((9600253026263363831800507906467207035025 : Rat) / 84353800925664757687870414129491527348999) [(9, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 694 for generator 3. -/
theorem ep_Q2_008_partial_03_0694_valid :
    mulPoly ep_Q2_008_coefficient_03_0694
        ep_Q2_008_generator_03_0600_0699 =
      ep_Q2_008_partial_03_0694 := by
  native_decide

/-- Coefficient term 695 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0695 : Poly :=
[
  term ((26522229763466783907 : Rat) / 5543651628913410872) [(12, 1), (16, 1)]
]

/-- Partial product 695 for generator 3. -/
def ep_Q2_008_partial_03_0695 : Poly :=
[
  term ((26522229763466783907 : Rat) / 5543651628913410872) [(2, 2), (12, 1), (16, 1)],
  term ((26522229763466783907 : Rat) / 5543651628913410872) [(3, 2), (12, 1), (16, 1)],
  term ((-26522229763466783907 : Rat) / 5543651628913410872) [(8, 2), (12, 1), (16, 1)],
  term ((-26522229763466783907 : Rat) / 5543651628913410872) [(9, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 695 for generator 3. -/
theorem ep_Q2_008_partial_03_0695_valid :
    mulPoly ep_Q2_008_coefficient_03_0695
        ep_Q2_008_generator_03_0600_0699 =
      ep_Q2_008_partial_03_0695 := by
  native_decide

/-- Coefficient term 696 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0696 : Poly :=
[
  term ((12826511395213439640177769223973196857600 : Rat) / 84353800925664757687870414129491527348999) [(12, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 696 for generator 3. -/
def ep_Q2_008_partial_03_0696 : Poly :=
[
  term ((12826511395213439640177769223973196857600 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((12826511395213439640177769223973196857600 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-12826511395213439640177769223973196857600 : Rat) / 84353800925664757687870414129491527348999) [(8, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-12826511395213439640177769223973196857600 : Rat) / 84353800925664757687870414129491527348999) [(9, 2), (12, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 696 for generator 3. -/
theorem ep_Q2_008_partial_03_0696_valid :
    mulPoly ep_Q2_008_coefficient_03_0696
        ep_Q2_008_generator_03_0600_0699 =
      ep_Q2_008_partial_03_0696 := by
  native_decide

/-- Coefficient term 697 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0697 : Poly :=
[
  term ((-62566193848146107415 : Rat) / 11087303257826821744) [(12, 2), (16, 1)]
]

/-- Partial product 697 for generator 3. -/
def ep_Q2_008_partial_03_0697 : Poly :=
[
  term ((-62566193848146107415 : Rat) / 11087303257826821744) [(2, 2), (12, 2), (16, 1)],
  term ((-62566193848146107415 : Rat) / 11087303257826821744) [(3, 2), (12, 2), (16, 1)],
  term ((62566193848146107415 : Rat) / 11087303257826821744) [(8, 2), (12, 2), (16, 1)],
  term ((62566193848146107415 : Rat) / 11087303257826821744) [(9, 2), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 697 for generator 3. -/
theorem ep_Q2_008_partial_03_0697_valid :
    mulPoly ep_Q2_008_coefficient_03_0697
        ep_Q2_008_generator_03_0600_0699 =
      ep_Q2_008_partial_03_0697 := by
  native_decide

/-- Coefficient term 698 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0698 : Poly :=
[
  term ((5564322951718051560802073809911485575668915 : Rat) / 674830407405318061502963313035932218791992) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 698 for generator 3. -/
def ep_Q2_008_partial_03_0698 : Poly :=
[
  term ((5564322951718051560802073809911485575668915 : Rat) / 674830407405318061502963313035932218791992) [(2, 2), (13, 1), (15, 1), (16, 1)],
  term ((5564322951718051560802073809911485575668915 : Rat) / 674830407405318061502963313035932218791992) [(3, 2), (13, 1), (15, 1), (16, 1)],
  term ((-5564322951718051560802073809911485575668915 : Rat) / 674830407405318061502963313035932218791992) [(8, 2), (13, 1), (15, 1), (16, 1)],
  term ((-5564322951718051560802073809911485575668915 : Rat) / 674830407405318061502963313035932218791992) [(9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 698 for generator 3. -/
theorem ep_Q2_008_partial_03_0698_valid :
    mulPoly ep_Q2_008_coefficient_03_0698
        ep_Q2_008_generator_03_0600_0699 =
      ep_Q2_008_partial_03_0698 := by
  native_decide

/-- Coefficient term 699 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0699 : Poly :=
[
  term ((-9064035172560306458574698718294171849600 : Rat) / 84353800925664757687870414129491527348999) [(13, 2), (15, 2), (16, 1)]
]

/-- Partial product 699 for generator 3. -/
def ep_Q2_008_partial_03_0699 : Poly :=
[
  term ((-9064035172560306458574698718294171849600 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (13, 2), (15, 2), (16, 1)],
  term ((-9064035172560306458574698718294171849600 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (13, 2), (15, 2), (16, 1)],
  term ((9064035172560306458574698718294171849600 : Rat) / 84353800925664757687870414129491527348999) [(8, 2), (13, 2), (15, 2), (16, 1)],
  term ((9064035172560306458574698718294171849600 : Rat) / 84353800925664757687870414129491527348999) [(9, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 699 for generator 3. -/
theorem ep_Q2_008_partial_03_0699_valid :
    mulPoly ep_Q2_008_coefficient_03_0699
        ep_Q2_008_generator_03_0600_0699 =
      ep_Q2_008_partial_03_0699 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_008_partials_03_0600_0699 : List Poly :=
[
  ep_Q2_008_partial_03_0600,
  ep_Q2_008_partial_03_0601,
  ep_Q2_008_partial_03_0602,
  ep_Q2_008_partial_03_0603,
  ep_Q2_008_partial_03_0604,
  ep_Q2_008_partial_03_0605,
  ep_Q2_008_partial_03_0606,
  ep_Q2_008_partial_03_0607,
  ep_Q2_008_partial_03_0608,
  ep_Q2_008_partial_03_0609,
  ep_Q2_008_partial_03_0610,
  ep_Q2_008_partial_03_0611,
  ep_Q2_008_partial_03_0612,
  ep_Q2_008_partial_03_0613,
  ep_Q2_008_partial_03_0614,
  ep_Q2_008_partial_03_0615,
  ep_Q2_008_partial_03_0616,
  ep_Q2_008_partial_03_0617,
  ep_Q2_008_partial_03_0618,
  ep_Q2_008_partial_03_0619,
  ep_Q2_008_partial_03_0620,
  ep_Q2_008_partial_03_0621,
  ep_Q2_008_partial_03_0622,
  ep_Q2_008_partial_03_0623,
  ep_Q2_008_partial_03_0624,
  ep_Q2_008_partial_03_0625,
  ep_Q2_008_partial_03_0626,
  ep_Q2_008_partial_03_0627,
  ep_Q2_008_partial_03_0628,
  ep_Q2_008_partial_03_0629,
  ep_Q2_008_partial_03_0630,
  ep_Q2_008_partial_03_0631,
  ep_Q2_008_partial_03_0632,
  ep_Q2_008_partial_03_0633,
  ep_Q2_008_partial_03_0634,
  ep_Q2_008_partial_03_0635,
  ep_Q2_008_partial_03_0636,
  ep_Q2_008_partial_03_0637,
  ep_Q2_008_partial_03_0638,
  ep_Q2_008_partial_03_0639,
  ep_Q2_008_partial_03_0640,
  ep_Q2_008_partial_03_0641,
  ep_Q2_008_partial_03_0642,
  ep_Q2_008_partial_03_0643,
  ep_Q2_008_partial_03_0644,
  ep_Q2_008_partial_03_0645,
  ep_Q2_008_partial_03_0646,
  ep_Q2_008_partial_03_0647,
  ep_Q2_008_partial_03_0648,
  ep_Q2_008_partial_03_0649,
  ep_Q2_008_partial_03_0650,
  ep_Q2_008_partial_03_0651,
  ep_Q2_008_partial_03_0652,
  ep_Q2_008_partial_03_0653,
  ep_Q2_008_partial_03_0654,
  ep_Q2_008_partial_03_0655,
  ep_Q2_008_partial_03_0656,
  ep_Q2_008_partial_03_0657,
  ep_Q2_008_partial_03_0658,
  ep_Q2_008_partial_03_0659,
  ep_Q2_008_partial_03_0660,
  ep_Q2_008_partial_03_0661,
  ep_Q2_008_partial_03_0662,
  ep_Q2_008_partial_03_0663,
  ep_Q2_008_partial_03_0664,
  ep_Q2_008_partial_03_0665,
  ep_Q2_008_partial_03_0666,
  ep_Q2_008_partial_03_0667,
  ep_Q2_008_partial_03_0668,
  ep_Q2_008_partial_03_0669,
  ep_Q2_008_partial_03_0670,
  ep_Q2_008_partial_03_0671,
  ep_Q2_008_partial_03_0672,
  ep_Q2_008_partial_03_0673,
  ep_Q2_008_partial_03_0674,
  ep_Q2_008_partial_03_0675,
  ep_Q2_008_partial_03_0676,
  ep_Q2_008_partial_03_0677,
  ep_Q2_008_partial_03_0678,
  ep_Q2_008_partial_03_0679,
  ep_Q2_008_partial_03_0680,
  ep_Q2_008_partial_03_0681,
  ep_Q2_008_partial_03_0682,
  ep_Q2_008_partial_03_0683,
  ep_Q2_008_partial_03_0684,
  ep_Q2_008_partial_03_0685,
  ep_Q2_008_partial_03_0686,
  ep_Q2_008_partial_03_0687,
  ep_Q2_008_partial_03_0688,
  ep_Q2_008_partial_03_0689,
  ep_Q2_008_partial_03_0690,
  ep_Q2_008_partial_03_0691,
  ep_Q2_008_partial_03_0692,
  ep_Q2_008_partial_03_0693,
  ep_Q2_008_partial_03_0694,
  ep_Q2_008_partial_03_0695,
  ep_Q2_008_partial_03_0696,
  ep_Q2_008_partial_03_0697,
  ep_Q2_008_partial_03_0698,
  ep_Q2_008_partial_03_0699
]

/-- Sum of partial products in this block. -/
def ep_Q2_008_block_03_0600_0699 : Poly :=
[
  term ((364938985264381623 : Rat) / 692956453614176359) [(2, 2), (7, 2), (13, 2), (16, 1)],
  term ((8185765685626957875616924292616076800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 2), (13, 3), (15, 1), (16, 1)],
  term ((305467685293579219548379191939206400 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 2), (15, 2), (16, 1)],
  term ((3448052429063870577 : Rat) / 1385912907228352718) [(2, 2), (7, 2), (16, 1)],
  term ((-609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 3), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-43336929246501263764396389789139200 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 3), (10, 1), (15, 1), (16, 1)],
  term ((-406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 3), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 3), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-217519343223274594172523289786617600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 3), (12, 1), (15, 1), (16, 1)],
  term ((101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 3), (12, 2), (15, 1), (16, 1)],
  term ((406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 3), (13, 1), (15, 2), (16, 1)],
  term ((203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 3), (13, 2), (15, 1), (16, 1)],
  term ((115982493152720841046994376524832000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 3), (15, 1), (16, 1)],
  term ((70324786932212700 : Rat) / 692956453614176359) [(2, 2), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((-39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (8, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-6945979900585068000 : Rat) / 692956453614176359) [(2, 2), (8, 1), (10, 1), (13, 2), (16, 1)],
  term ((1969850932679345625 : Rat) / 2771825814456705436) [(2, 2), (8, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((1387039924178296875 : Rat) / 5543651628913410872) [(2, 2), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((-1498262336125082331259894946679368419200 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (8, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-19058214854956896000 : Rat) / 692956453614176359) [(2, 2), (8, 1), (11, 1), (13, 3), (16, 1)],
  term ((-1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (8, 1), (11, 1), (13, 4), (15, 1), (16, 1)],
  term ((-11020747726338080733 : Rat) / 5543651628913410872) [(2, 2), (8, 1), (11, 2), (16, 1)],
  term ((14950744787709303129050138340319920107025 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-35162393466106350 : Rat) / 692956453614176359) [(2, 2), (8, 1), (12, 1), (16, 1)],
  term ((3988922053075555626108933898896416534175 : Rat) / 168707601851329515375740828258983054697998) [(2, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (8, 1), (13, 2), (15, 2), (16, 1)],
  term ((52553723233734477915 : Rat) / 5543651628913410872) [(2, 2), (8, 1), (13, 2), (16, 1)],
  term ((-25848593045194364880230305998322280985600 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (8, 1), (13, 3), (15, 1), (16, 1)],
  term ((11020747726338080733 : Rat) / 5543651628913410872) [(2, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((6945979900585068000 : Rat) / 692956453614176359) [(2, 2), (9, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-71449162036572956733 : Rat) / 5543651628913410872) [(2, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-670900164047368156987703685423339033600 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (9, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((2169162500172450488247598632102707452800 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((19058214854956896000 : Rat) / 692956453614176359) [(2, 2), (9, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (9, 1), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((3976067472187113027 : Rat) / 1385912907228352718) [(2, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-1969850932679345625 : Rat) / 2771825814456705436) [(2, 2), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((-2343133172956448821031328838872771360000 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-19058214854956896000 : Rat) / 692956453614176359) [(2, 2), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((-1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (9, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((-4637633334215077125 : Rat) / 5543651628913410872) [(2, 2), (9, 1), (11, 1), (16, 1)],
  term ((39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-52553723233734477915 : Rat) / 5543651628913410872) [(2, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((25848593045194364880230305998322280985600 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (9, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((8551217455814529770681364152578959105675 : Rat) / 168707601851329515375740828258983054697998) [(2, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-14931201290749033485079614770147991351825 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-149833476695400603774014037984787123200 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((8770966736472141765 : Rat) / 692956453614176359) [(2, 2), (9, 1), (13, 1), (16, 1)],
  term ((-25418021277837777496254186897496336531200 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((51933688175996120327605020397671108001875 : Rat) / 168707601851329515375740828258983054697998) [(2, 2), (9, 1), (15, 1), (16, 1)],
  term ((39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (9, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-70324786932212700 : Rat) / 692956453614176359) [(2, 2), (9, 2), (12, 1), (16, 1)],
  term ((-39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((70324786932212700 : Rat) / 692956453614176359) [(2, 2), (9, 2), (16, 1)],
  term ((-7461680854172397750 : Rat) / 692956453614176359) [(2, 2), (10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (10, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((3889714471092129375 : Rat) / 1385912907228352718) [(2, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((128888067226419176493525738138102386112300 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (10, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (10, 1), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((14293661141217672000 : Rat) / 692956453614176359) [(2, 2), (10, 1), (11, 1), (13, 3), (16, 1)],
  term ((1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (10, 1), (11, 1), (13, 4), (15, 1), (16, 1)],
  term ((-33865111170431304111397000478307417161400 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-15855689783583275517 : Rat) / 5543651628913410872) [(2, 2), (10, 1), (12, 1), (16, 1)],
  term ((3472989950292534000 : Rat) / 692956453614176359) [(2, 2), (10, 1), (12, 2), (16, 1)],
  term ((-5079133510334155108456437850925402239044621 : Rat) / 337415203702659030751481656517966109395996) [(2, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((68430322247582819758754083757459259078000 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((-13165974220555668321 : Rat) / 1385912907228352718) [(2, 2), (10, 1), (13, 2), (16, 1)],
  term ((10779073614648400407325874854616096179200 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (10, 1), (13, 3), (15, 1), (16, 1)],
  term ((-13944805926705838233 : Rat) / 11087303257826821744) [(2, 2), (10, 1), (16, 1)],
  term ((6945979900585068000 : Rat) / 692956453614176359) [(2, 2), (10, 2), (13, 2), (16, 1)],
  term ((-11020747726338080733 : Rat) / 11087303257826821744) [(2, 2), (10, 2), (16, 1)],
  term ((-68202314783046340579097975438786756934000 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((33011954073735634017 : Rat) / 2771825814456705436) [(2, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-24042943756448620939600870092072284390400 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((634934315306295958173975109401654207223221 : Rat) / 337415203702659030751481656517966109395996) [(2, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((9529107427478448000 : Rat) / 692956453614176359) [(2, 2), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (11, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((1216729051811765980483263849554153117400 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1878818142074568083506959096542607936000 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-97696237937503057875 : Rat) / 11087303257826821744) [(2, 2), (11, 1), (13, 1), (16, 1)],
  term ((-1748077855914345199985729841647917161427200 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((19058214854956896000 : Rat) / 692956453614176359) [(2, 2), (11, 1), (13, 3), (16, 1)],
  term ((1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (11, 1), (13, 4), (15, 1), (16, 1)],
  term ((102041838154402569700306115948852911654725 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (11, 1), (15, 1), (16, 1)],
  term ((-134607341108404353960247653855076339622700 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (11, 2), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-14293661141217672000 : Rat) / 692956453614176359) [(2, 2), (11, 2), (12, 1), (13, 2), (16, 1)],
  term ((-1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (11, 2), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-5952518285441448375 : Rat) / 1385912907228352718) [(2, 2), (11, 2), (12, 1), (16, 1)],
  term ((98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (11, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((515700953587329750 : Rat) / 692956453614176359) [(2, 2), (11, 2), (12, 2), (16, 1)],
  term ((2020738218372206486401553021194845523200 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-375613366775954733 : Rat) / 11087303257826821744) [(2, 2), (11, 2), (16, 1)],
  term ((-9600253026263363831800507906467207035025 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((26522229763466783907 : Rat) / 5543651628913410872) [(2, 2), (12, 1), (16, 1)],
  term ((12826511395213439640177769223973196857600 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-62566193848146107415 : Rat) / 11087303257826821744) [(2, 2), (12, 2), (16, 1)],
  term ((5564322951718051560802073809911485575668915 : Rat) / 674830407405318061502963313035932218791992) [(2, 2), (13, 1), (15, 1), (16, 1)],
  term ((-9064035172560306458574698718294171849600 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (13, 2), (15, 2), (16, 1)],
  term ((364938985264381623 : Rat) / 692956453614176359) [(3, 2), (7, 2), (13, 2), (16, 1)],
  term ((8185765685626957875616924292616076800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 2), (13, 3), (15, 1), (16, 1)],
  term ((305467685293579219548379191939206400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 2), (15, 2), (16, 1)],
  term ((3448052429063870577 : Rat) / 1385912907228352718) [(3, 2), (7, 2), (16, 1)],
  term ((-609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 3), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-43336929246501263764396389789139200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 3), (10, 1), (15, 1), (16, 1)],
  term ((-406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 3), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 3), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-217519343223274594172523289786617600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 3), (12, 1), (15, 1), (16, 1)],
  term ((101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 3), (12, 2), (15, 1), (16, 1)],
  term ((406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 3), (13, 1), (15, 2), (16, 1)],
  term ((203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 3), (13, 2), (15, 1), (16, 1)],
  term ((115982493152720841046994376524832000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 3), (15, 1), (16, 1)],
  term ((70324786932212700 : Rat) / 692956453614176359) [(3, 2), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((-39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (8, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-6945979900585068000 : Rat) / 692956453614176359) [(3, 2), (8, 1), (10, 1), (13, 2), (16, 1)],
  term ((1969850932679345625 : Rat) / 2771825814456705436) [(3, 2), (8, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((1387039924178296875 : Rat) / 5543651628913410872) [(3, 2), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((-1498262336125082331259894946679368419200 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (8, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-19058214854956896000 : Rat) / 692956453614176359) [(3, 2), (8, 1), (11, 1), (13, 3), (16, 1)],
  term ((-1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (8, 1), (11, 1), (13, 4), (15, 1), (16, 1)],
  term ((-11020747726338080733 : Rat) / 5543651628913410872) [(3, 2), (8, 1), (11, 2), (16, 1)],
  term ((14950744787709303129050138340319920107025 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-35162393466106350 : Rat) / 692956453614176359) [(3, 2), (8, 1), (12, 1), (16, 1)],
  term ((3988922053075555626108933898896416534175 : Rat) / 168707601851329515375740828258983054697998) [(3, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (8, 1), (13, 2), (15, 2), (16, 1)],
  term ((52553723233734477915 : Rat) / 5543651628913410872) [(3, 2), (8, 1), (13, 2), (16, 1)],
  term ((-25848593045194364880230305998322280985600 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (8, 1), (13, 3), (15, 1), (16, 1)],
  term ((11020747726338080733 : Rat) / 5543651628913410872) [(3, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((6945979900585068000 : Rat) / 692956453614176359) [(3, 2), (9, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-71449162036572956733 : Rat) / 5543651628913410872) [(3, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-670900164047368156987703685423339033600 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (9, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((2169162500172450488247598632102707452800 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((19058214854956896000 : Rat) / 692956453614176359) [(3, 2), (9, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (9, 1), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((3976067472187113027 : Rat) / 1385912907228352718) [(3, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-1969850932679345625 : Rat) / 2771825814456705436) [(3, 2), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((-2343133172956448821031328838872771360000 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-19058214854956896000 : Rat) / 692956453614176359) [(3, 2), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((-1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (9, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((-4637633334215077125 : Rat) / 5543651628913410872) [(3, 2), (9, 1), (11, 1), (16, 1)],
  term ((39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-52553723233734477915 : Rat) / 5543651628913410872) [(3, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((25848593045194364880230305998322280985600 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (9, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((8551217455814529770681364152578959105675 : Rat) / 168707601851329515375740828258983054697998) [(3, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-14931201290749033485079614770147991351825 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-149833476695400603774014037984787123200 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((8770966736472141765 : Rat) / 692956453614176359) [(3, 2), (9, 1), (13, 1), (16, 1)],
  term ((-25418021277837777496254186897496336531200 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((51933688175996120327605020397671108001875 : Rat) / 168707601851329515375740828258983054697998) [(3, 2), (9, 1), (15, 1), (16, 1)],
  term ((39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (9, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-70324786932212700 : Rat) / 692956453614176359) [(3, 2), (9, 2), (12, 1), (16, 1)],
  term ((-39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((70324786932212700 : Rat) / 692956453614176359) [(3, 2), (9, 2), (16, 1)],
  term ((-7461680854172397750 : Rat) / 692956453614176359) [(3, 2), (10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (10, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((3889714471092129375 : Rat) / 1385912907228352718) [(3, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((128888067226419176493525738138102386112300 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (10, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (10, 1), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((14293661141217672000 : Rat) / 692956453614176359) [(3, 2), (10, 1), (11, 1), (13, 3), (16, 1)],
  term ((1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (10, 1), (11, 1), (13, 4), (15, 1), (16, 1)],
  term ((-33865111170431304111397000478307417161400 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-15855689783583275517 : Rat) / 5543651628913410872) [(3, 2), (10, 1), (12, 1), (16, 1)],
  term ((3472989950292534000 : Rat) / 692956453614176359) [(3, 2), (10, 1), (12, 2), (16, 1)],
  term ((-5079133510334155108456437850925402239044621 : Rat) / 337415203702659030751481656517966109395996) [(3, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((68430322247582819758754083757459259078000 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((-13165974220555668321 : Rat) / 1385912907228352718) [(3, 2), (10, 1), (13, 2), (16, 1)],
  term ((10779073614648400407325874854616096179200 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (10, 1), (13, 3), (15, 1), (16, 1)],
  term ((-13944805926705838233 : Rat) / 11087303257826821744) [(3, 2), (10, 1), (16, 1)],
  term ((6945979900585068000 : Rat) / 692956453614176359) [(3, 2), (10, 2), (13, 2), (16, 1)],
  term ((-11020747726338080733 : Rat) / 11087303257826821744) [(3, 2), (10, 2), (16, 1)],
  term ((-68202314783046340579097975438786756934000 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((33011954073735634017 : Rat) / 2771825814456705436) [(3, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-24042943756448620939600870092072284390400 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((634934315306295958173975109401654207223221 : Rat) / 337415203702659030751481656517966109395996) [(3, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((9529107427478448000 : Rat) / 692956453614176359) [(3, 2), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (11, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((1216729051811765980483263849554153117400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1878818142074568083506959096542607936000 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-97696237937503057875 : Rat) / 11087303257826821744) [(3, 2), (11, 1), (13, 1), (16, 1)],
  term ((-1748077855914345199985729841647917161427200 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((19058214854956896000 : Rat) / 692956453614176359) [(3, 2), (11, 1), (13, 3), (16, 1)],
  term ((1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (11, 1), (13, 4), (15, 1), (16, 1)],
  term ((102041838154402569700306115948852911654725 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (11, 1), (15, 1), (16, 1)],
  term ((-134607341108404353960247653855076339622700 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (11, 2), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-14293661141217672000 : Rat) / 692956453614176359) [(3, 2), (11, 2), (12, 1), (13, 2), (16, 1)],
  term ((-1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (11, 2), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-5952518285441448375 : Rat) / 1385912907228352718) [(3, 2), (11, 2), (12, 1), (16, 1)],
  term ((98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (11, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((515700953587329750 : Rat) / 692956453614176359) [(3, 2), (11, 2), (12, 2), (16, 1)],
  term ((2020738218372206486401553021194845523200 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-375613366775954733 : Rat) / 11087303257826821744) [(3, 2), (11, 2), (16, 1)],
  term ((-9600253026263363831800507906467207035025 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((26522229763466783907 : Rat) / 5543651628913410872) [(3, 2), (12, 1), (16, 1)],
  term ((12826511395213439640177769223973196857600 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-62566193848146107415 : Rat) / 11087303257826821744) [(3, 2), (12, 2), (16, 1)],
  term ((5564322951718051560802073809911485575668915 : Rat) / 674830407405318061502963313035932218791992) [(3, 2), (13, 1), (15, 1), (16, 1)],
  term ((-9064035172560306458574698718294171849600 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (13, 2), (15, 2), (16, 1)],
  term ((-364938985264381623 : Rat) / 692956453614176359) [(7, 2), (8, 2), (13, 2), (16, 1)],
  term ((-8185765685626957875616924292616076800 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (8, 2), (13, 3), (15, 1), (16, 1)],
  term ((-305467685293579219548379191939206400 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (8, 2), (15, 2), (16, 1)],
  term ((-3448052429063870577 : Rat) / 1385912907228352718) [(7, 2), (8, 2), (16, 1)],
  term ((-364938985264381623 : Rat) / 692956453614176359) [(7, 2), (9, 2), (13, 2), (16, 1)],
  term ((-8185765685626957875616924292616076800 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (9, 2), (13, 3), (15, 1), (16, 1)],
  term ((-305467685293579219548379191939206400 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (9, 2), (15, 2), (16, 1)],
  term ((-3448052429063870577 : Rat) / 1385912907228352718) [(7, 2), (9, 2), (16, 1)],
  term ((609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (8, 2), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((43336929246501263764396389789139200 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (8, 2), (10, 1), (15, 1), (16, 1)],
  term ((406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (8, 2), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (8, 2), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((217519343223274594172523289786617600 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (8, 2), (12, 1), (15, 1), (16, 1)],
  term ((-101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (8, 2), (12, 2), (15, 1), (16, 1)],
  term ((-406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (8, 2), (13, 1), (15, 2), (16, 1)],
  term ((-203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (8, 2), (13, 2), (15, 1), (16, 1)],
  term ((-115982493152720841046994376524832000 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (8, 2), (15, 1), (16, 1)],
  term ((609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (9, 2), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((43336929246501263764396389789139200 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (9, 2), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (9, 2), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((217519343223274594172523289786617600 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((-101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (9, 2), (12, 2), (15, 1), (16, 1)],
  term ((-406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((-203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (9, 2), (13, 2), (15, 1), (16, 1)],
  term ((-115982493152720841046994376524832000 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (9, 2), (15, 1), (16, 1)],
  term ((6945979900585068000 : Rat) / 692956453614176359) [(8, 1), (9, 2), (10, 1), (13, 2), (16, 1)],
  term ((-1969850932679345625 : Rat) / 2771825814456705436) [(8, 1), (9, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-1387039924178296875 : Rat) / 5543651628913410872) [(8, 1), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((1498262336125082331259894946679368419200 : Rat) / 84353800925664757687870414129491527348999) [(8, 1), (9, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((19058214854956896000 : Rat) / 692956453614176359) [(8, 1), (9, 2), (11, 1), (13, 3), (16, 1)],
  term ((1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(8, 1), (9, 2), (11, 1), (13, 4), (15, 1), (16, 1)],
  term ((11020747726338080733 : Rat) / 5543651628913410872) [(8, 1), (9, 2), (11, 2), (16, 1)],
  term ((-14950744787709303129050138340319920107025 : Rat) / 84353800925664757687870414129491527348999) [(8, 1), (9, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((35162393466106350 : Rat) / 692956453614176359) [(8, 1), (9, 2), (12, 1), (16, 1)],
  term ((-3988922053075555626108933898896416534175 : Rat) / 168707601851329515375740828258983054697998) [(8, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(8, 1), (9, 2), (13, 2), (15, 2), (16, 1)],
  term ((-52553723233734477915 : Rat) / 5543651628913410872) [(8, 1), (9, 2), (13, 2), (16, 1)],
  term ((25848593045194364880230305998322280985600 : Rat) / 84353800925664757687870414129491527348999) [(8, 1), (9, 2), (13, 3), (15, 1), (16, 1)],
  term ((-70324786932212700 : Rat) / 692956453614176359) [(8, 1), (9, 3), (13, 1), (16, 1)],
  term ((39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(8, 1), (9, 3), (13, 2), (15, 1), (16, 1)],
  term ((-11020747726338080733 : Rat) / 5543651628913410872) [(8, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-6945979900585068000 : Rat) / 692956453614176359) [(8, 2), (9, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((71449162036572956733 : Rat) / 5543651628913410872) [(8, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((670900164047368156987703685423339033600 : Rat) / 84353800925664757687870414129491527348999) [(8, 2), (9, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-2169162500172450488247598632102707452800 : Rat) / 84353800925664757687870414129491527348999) [(8, 2), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-19058214854956896000 : Rat) / 692956453614176359) [(8, 2), (9, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((-1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(8, 2), (9, 1), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-3976067472187113027 : Rat) / 1385912907228352718) [(8, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((1969850932679345625 : Rat) / 2771825814456705436) [(8, 2), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((2343133172956448821031328838872771360000 : Rat) / 84353800925664757687870414129491527348999) [(8, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((19058214854956896000 : Rat) / 692956453614176359) [(8, 2), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(8, 2), (9, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((4637633334215077125 : Rat) / 5543651628913410872) [(8, 2), (9, 1), (11, 1), (16, 1)],
  term ((-39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(8, 2), (9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((52553723233734477915 : Rat) / 5543651628913410872) [(8, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-25848593045194364880230305998322280985600 : Rat) / 84353800925664757687870414129491527348999) [(8, 2), (9, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-8551217455814529770681364152578959105675 : Rat) / 168707601851329515375740828258983054697998) [(8, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((14931201290749033485079614770147991351825 : Rat) / 84353800925664757687870414129491527348999) [(8, 2), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((149833476695400603774014037984787123200 : Rat) / 84353800925664757687870414129491527348999) [(8, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-8770966736472141765 : Rat) / 692956453614176359) [(8, 2), (9, 1), (13, 1), (16, 1)],
  term ((25418021277837777496254186897496336531200 : Rat) / 84353800925664757687870414129491527348999) [(8, 2), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-51933688175996120327605020397671108001875 : Rat) / 168707601851329515375740828258983054697998) [(8, 2), (9, 1), (15, 1), (16, 1)],
  term ((-39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(8, 2), (9, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((70324786932212700 : Rat) / 692956453614176359) [(8, 2), (9, 2), (12, 1), (16, 1)],
  term ((39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(8, 2), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-70324786932212700 : Rat) / 692956453614176359) [(8, 2), (9, 2), (16, 1)],
  term ((7461680854172397750 : Rat) / 692956453614176359) [(8, 2), (10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(8, 2), (10, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-3889714471092129375 : Rat) / 1385912907228352718) [(8, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-128888067226419176493525738138102386112300 : Rat) / 84353800925664757687870414129491527348999) [(8, 2), (10, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(8, 2), (10, 1), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((-14293661141217672000 : Rat) / 692956453614176359) [(8, 2), (10, 1), (11, 1), (13, 3), (16, 1)],
  term ((-1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(8, 2), (10, 1), (11, 1), (13, 4), (15, 1), (16, 1)],
  term ((33865111170431304111397000478307417161400 : Rat) / 84353800925664757687870414129491527348999) [(8, 2), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((15855689783583275517 : Rat) / 5543651628913410872) [(8, 2), (10, 1), (12, 1), (16, 1)],
  term ((-3472989950292534000 : Rat) / 692956453614176359) [(8, 2), (10, 1), (12, 2), (16, 1)],
  term ((5079133510334155108456437850925402239044621 : Rat) / 337415203702659030751481656517966109395996) [(8, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-68430322247582819758754083757459259078000 : Rat) / 84353800925664757687870414129491527348999) [(8, 2), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((13165974220555668321 : Rat) / 1385912907228352718) [(8, 2), (10, 1), (13, 2), (16, 1)],
  term ((-10779073614648400407325874854616096179200 : Rat) / 84353800925664757687870414129491527348999) [(8, 2), (10, 1), (13, 3), (15, 1), (16, 1)],
  term ((13944805926705838233 : Rat) / 11087303257826821744) [(8, 2), (10, 1), (16, 1)],
  term ((-6945979900585068000 : Rat) / 692956453614176359) [(8, 2), (10, 2), (13, 2), (16, 1)],
  term ((11020747726338080733 : Rat) / 11087303257826821744) [(8, 2), (10, 2), (16, 1)],
  term ((68202314783046340579097975438786756934000 : Rat) / 84353800925664757687870414129491527348999) [(8, 2), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-33011954073735634017 : Rat) / 2771825814456705436) [(8, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((24042943756448620939600870092072284390400 : Rat) / 84353800925664757687870414129491527348999) [(8, 2), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-634934315306295958173975109401654207223221 : Rat) / 337415203702659030751481656517966109395996) [(8, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-9529107427478448000 : Rat) / 692956453614176359) [(8, 2), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(8, 2), (11, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((-1216729051811765980483263849554153117400 : Rat) / 2908751756057405437512772901016949218931) [(8, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((1878818142074568083506959096542607936000 : Rat) / 84353800925664757687870414129491527348999) [(8, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((97696237937503057875 : Rat) / 11087303257826821744) [(8, 2), (11, 1), (13, 1), (16, 1)],
  term ((1748077855914345199985729841647917161427200 : Rat) / 84353800925664757687870414129491527348999) [(8, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(8, 2), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((-19058214854956896000 : Rat) / 692956453614176359) [(8, 2), (11, 1), (13, 3), (16, 1)],
  term ((-1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(8, 2), (11, 1), (13, 4), (15, 1), (16, 1)],
  term ((-102041838154402569700306115948852911654725 : Rat) / 84353800925664757687870414129491527348999) [(8, 2), (11, 1), (15, 1), (16, 1)],
  term ((134607341108404353960247653855076339622700 : Rat) / 84353800925664757687870414129491527348999) [(8, 2), (11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(8, 2), (11, 2), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((14293661141217672000 : Rat) / 692956453614176359) [(8, 2), (11, 2), (12, 1), (13, 2), (16, 1)],
  term ((1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(8, 2), (11, 2), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((5952518285441448375 : Rat) / 1385912907228352718) [(8, 2), (11, 2), (12, 1), (16, 1)],
  term ((-98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(8, 2), (11, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-515700953587329750 : Rat) / 692956453614176359) [(8, 2), (11, 2), (12, 2), (16, 1)],
  term ((-2020738218372206486401553021194845523200 : Rat) / 84353800925664757687870414129491527348999) [(8, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((375613366775954733 : Rat) / 11087303257826821744) [(8, 2), (11, 2), (16, 1)],
  term ((9600253026263363831800507906467207035025 : Rat) / 84353800925664757687870414129491527348999) [(8, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-26522229763466783907 : Rat) / 5543651628913410872) [(8, 2), (12, 1), (16, 1)],
  term ((-12826511395213439640177769223973196857600 : Rat) / 84353800925664757687870414129491527348999) [(8, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((62566193848146107415 : Rat) / 11087303257826821744) [(8, 2), (12, 2), (16, 1)],
  term ((-5564322951718051560802073809911485575668915 : Rat) / 674830407405318061502963313035932218791992) [(8, 2), (13, 1), (15, 1), (16, 1)],
  term ((9064035172560306458574698718294171849600 : Rat) / 84353800925664757687870414129491527348999) [(8, 2), (13, 2), (15, 2), (16, 1)],
  term ((-70324786932212700 : Rat) / 692956453614176359) [(8, 3), (9, 1), (13, 1), (16, 1)],
  term ((39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(8, 3), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((6945979900585068000 : Rat) / 692956453614176359) [(8, 3), (10, 1), (13, 2), (16, 1)],
  term ((-1969850932679345625 : Rat) / 2771825814456705436) [(8, 3), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-1387039924178296875 : Rat) / 5543651628913410872) [(8, 3), (11, 1), (13, 1), (16, 1)],
  term ((1498262336125082331259894946679368419200 : Rat) / 84353800925664757687870414129491527348999) [(8, 3), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((19058214854956896000 : Rat) / 692956453614176359) [(8, 3), (11, 1), (13, 3), (16, 1)],
  term ((1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(8, 3), (11, 1), (13, 4), (15, 1), (16, 1)],
  term ((11020747726338080733 : Rat) / 5543651628913410872) [(8, 3), (11, 2), (16, 1)],
  term ((-14950744787709303129050138340319920107025 : Rat) / 84353800925664757687870414129491527348999) [(8, 3), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((35162393466106350 : Rat) / 692956453614176359) [(8, 3), (12, 1), (16, 1)],
  term ((-3988922053075555626108933898896416534175 : Rat) / 168707601851329515375740828258983054697998) [(8, 3), (13, 1), (15, 1), (16, 1)],
  term ((39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(8, 3), (13, 2), (15, 2), (16, 1)],
  term ((-52553723233734477915 : Rat) / 5543651628913410872) [(8, 3), (13, 2), (16, 1)],
  term ((25848593045194364880230305998322280985600 : Rat) / 84353800925664757687870414129491527348999) [(8, 3), (13, 3), (15, 1), (16, 1)],
  term ((7461680854172397750 : Rat) / 692956453614176359) [(9, 2), (10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(9, 2), (10, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-3889714471092129375 : Rat) / 1385912907228352718) [(9, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-128888067226419176493525738138102386112300 : Rat) / 84353800925664757687870414129491527348999) [(9, 2), (10, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(9, 2), (10, 1), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((-14293661141217672000 : Rat) / 692956453614176359) [(9, 2), (10, 1), (11, 1), (13, 3), (16, 1)],
  term ((-1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(9, 2), (10, 1), (11, 1), (13, 4), (15, 1), (16, 1)],
  term ((33865111170431304111397000478307417161400 : Rat) / 84353800925664757687870414129491527348999) [(9, 2), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((15855689783583275517 : Rat) / 5543651628913410872) [(9, 2), (10, 1), (12, 1), (16, 1)],
  term ((-3472989950292534000 : Rat) / 692956453614176359) [(9, 2), (10, 1), (12, 2), (16, 1)],
  term ((5079133510334155108456437850925402239044621 : Rat) / 337415203702659030751481656517966109395996) [(9, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-68430322247582819758754083757459259078000 : Rat) / 84353800925664757687870414129491527348999) [(9, 2), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((13165974220555668321 : Rat) / 1385912907228352718) [(9, 2), (10, 1), (13, 2), (16, 1)],
  term ((-10779073614648400407325874854616096179200 : Rat) / 84353800925664757687870414129491527348999) [(9, 2), (10, 1), (13, 3), (15, 1), (16, 1)],
  term ((13944805926705838233 : Rat) / 11087303257826821744) [(9, 2), (10, 1), (16, 1)],
  term ((-6945979900585068000 : Rat) / 692956453614176359) [(9, 2), (10, 2), (13, 2), (16, 1)],
  term ((11020747726338080733 : Rat) / 11087303257826821744) [(9, 2), (10, 2), (16, 1)],
  term ((68202314783046340579097975438786756934000 : Rat) / 84353800925664757687870414129491527348999) [(9, 2), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-33011954073735634017 : Rat) / 2771825814456705436) [(9, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((24042943756448620939600870092072284390400 : Rat) / 84353800925664757687870414129491527348999) [(9, 2), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-634934315306295958173975109401654207223221 : Rat) / 337415203702659030751481656517966109395996) [(9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-9529107427478448000 : Rat) / 692956453614176359) [(9, 2), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(9, 2), (11, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((-1216729051811765980483263849554153117400 : Rat) / 2908751756057405437512772901016949218931) [(9, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((1878818142074568083506959096542607936000 : Rat) / 84353800925664757687870414129491527348999) [(9, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((97696237937503057875 : Rat) / 11087303257826821744) [(9, 2), (11, 1), (13, 1), (16, 1)],
  term ((1748077855914345199985729841647917161427200 : Rat) / 84353800925664757687870414129491527348999) [(9, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(9, 2), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((-19058214854956896000 : Rat) / 692956453614176359) [(9, 2), (11, 1), (13, 3), (16, 1)],
  term ((-1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(9, 2), (11, 1), (13, 4), (15, 1), (16, 1)],
  term ((-102041838154402569700306115948852911654725 : Rat) / 84353800925664757687870414129491527348999) [(9, 2), (11, 1), (15, 1), (16, 1)],
  term ((134607341108404353960247653855076339622700 : Rat) / 84353800925664757687870414129491527348999) [(9, 2), (11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(9, 2), (11, 2), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((14293661141217672000 : Rat) / 692956453614176359) [(9, 2), (11, 2), (12, 1), (13, 2), (16, 1)],
  term ((1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(9, 2), (11, 2), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((5952518285441448375 : Rat) / 1385912907228352718) [(9, 2), (11, 2), (12, 1), (16, 1)],
  term ((-98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(9, 2), (11, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-515700953587329750 : Rat) / 692956453614176359) [(9, 2), (11, 2), (12, 2), (16, 1)],
  term ((-2020738218372206486401553021194845523200 : Rat) / 84353800925664757687870414129491527348999) [(9, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((375613366775954733 : Rat) / 11087303257826821744) [(9, 2), (11, 2), (16, 1)],
  term ((9600253026263363831800507906467207035025 : Rat) / 84353800925664757687870414129491527348999) [(9, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-26522229763466783907 : Rat) / 5543651628913410872) [(9, 2), (12, 1), (16, 1)],
  term ((-12826511395213439640177769223973196857600 : Rat) / 84353800925664757687870414129491527348999) [(9, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((62566193848146107415 : Rat) / 11087303257826821744) [(9, 2), (12, 2), (16, 1)],
  term ((-5564322951718051560802073809911485575668915 : Rat) / 674830407405318061502963313035932218791992) [(9, 2), (13, 1), (15, 1), (16, 1)],
  term ((9064035172560306458574698718294171849600 : Rat) / 84353800925664757687870414129491527348999) [(9, 2), (13, 2), (15, 2), (16, 1)],
  term ((-11020747726338080733 : Rat) / 5543651628913410872) [(9, 3), (10, 1), (11, 1), (16, 1)],
  term ((-6945979900585068000 : Rat) / 692956453614176359) [(9, 3), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((71449162036572956733 : Rat) / 5543651628913410872) [(9, 3), (10, 1), (13, 1), (16, 1)],
  term ((670900164047368156987703685423339033600 : Rat) / 84353800925664757687870414129491527348999) [(9, 3), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-2169162500172450488247598632102707452800 : Rat) / 84353800925664757687870414129491527348999) [(9, 3), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-19058214854956896000 : Rat) / 692956453614176359) [(9, 3), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((-1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(9, 3), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-3976067472187113027 : Rat) / 1385912907228352718) [(9, 3), (11, 1), (12, 1), (16, 1)],
  term ((1969850932679345625 : Rat) / 2771825814456705436) [(9, 3), (11, 1), (12, 2), (16, 1)],
  term ((2343133172956448821031328838872771360000 : Rat) / 84353800925664757687870414129491527348999) [(9, 3), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((19058214854956896000 : Rat) / 692956453614176359) [(9, 3), (11, 1), (13, 2), (16, 1)],
  term ((1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(9, 3), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((4637633334215077125 : Rat) / 5543651628913410872) [(9, 3), (11, 1), (16, 1)],
  term ((-39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(9, 3), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((52553723233734477915 : Rat) / 5543651628913410872) [(9, 3), (12, 1), (13, 1), (16, 1)],
  term ((-25848593045194364880230305998322280985600 : Rat) / 84353800925664757687870414129491527348999) [(9, 3), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-8551217455814529770681364152578959105675 : Rat) / 168707601851329515375740828258983054697998) [(9, 3), (12, 1), (15, 1), (16, 1)],
  term ((14931201290749033485079614770147991351825 : Rat) / 84353800925664757687870414129491527348999) [(9, 3), (12, 2), (15, 1), (16, 1)],
  term ((149833476695400603774014037984787123200 : Rat) / 84353800925664757687870414129491527348999) [(9, 3), (13, 1), (15, 2), (16, 1)],
  term ((-8770966736472141765 : Rat) / 692956453614176359) [(9, 3), (13, 1), (16, 1)],
  term ((25418021277837777496254186897496336531200 : Rat) / 84353800925664757687870414129491527348999) [(9, 3), (13, 2), (15, 1), (16, 1)],
  term ((-51933688175996120327605020397671108001875 : Rat) / 168707601851329515375740828258983054697998) [(9, 3), (15, 1), (16, 1)],
  term ((-39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(9, 4), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((70324786932212700 : Rat) / 692956453614176359) [(9, 4), (12, 1), (16, 1)],
  term ((39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(9, 4), (13, 1), (15, 1), (16, 1)],
  term ((-70324786932212700 : Rat) / 692956453614176359) [(9, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 3, terms 600 through 699. -/
theorem ep_Q2_008_block_03_0600_0699_valid :
    checkProductSumEq ep_Q2_008_partials_03_0600_0699
      ep_Q2_008_block_03_0600_0699 = true := by
  native_decide

end EpQ2008TermShards

end Patterns

end EndpointCertificate

end Problem97
