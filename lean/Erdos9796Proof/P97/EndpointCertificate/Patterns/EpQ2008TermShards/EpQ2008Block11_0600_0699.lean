/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_008, term block 11:600-699

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_008`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2008TermShards

/-- Generator polynomial 11 for endpoint certificate `ep_Q2_008`. -/
def ep_Q2_008_generator_11_0600_0699 : Poly :=
[
  term (2 : Rat) [(2, 1), (14, 1)],
  term (2 : Rat) [(3, 1), (15, 1)],
  term (-1 : Rat) [(14, 2)],
  term (-1 : Rat) [(15, 2)]
]

/-- Coefficient term 600 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0600 : Poly :=
[
  term ((-154506451847614710653027389690915200 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 600 for generator 11. -/
def ep_Q2_008_partial_11_0600 : Poly :=
[
  term ((-309012903695229421306054779381830400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-309012903695229421306054779381830400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (11, 1), (15, 3), (16, 1)],
  term ((154506451847614710653027389690915200 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (11, 1), (14, 2), (15, 2), (16, 1)],
  term ((154506451847614710653027389690915200 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (11, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 600 for generator 11. -/
theorem ep_Q2_008_partial_11_0600_valid :
    mulPoly ep_Q2_008_coefficient_11_0600
        ep_Q2_008_generator_11_0600_0699 =
      ep_Q2_008_partial_11_0600 := by
  native_decide

/-- Coefficient term 601 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0601 : Poly :=
[
  term ((-4650562071069280056 : Rat) / 692956453614176359) [(6, 1), (7, 1), (11, 1), (16, 1)]
]

/-- Partial product 601 for generator 11. -/
def ep_Q2_008_partial_11_0601 : Poly :=
[
  term ((-9301124142138560112 : Rat) / 692956453614176359) [(2, 1), (6, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-9301124142138560112 : Rat) / 692956453614176359) [(3, 1), (6, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((4650562071069280056 : Rat) / 692956453614176359) [(6, 1), (7, 1), (11, 1), (14, 2), (16, 1)],
  term ((4650562071069280056 : Rat) / 692956453614176359) [(6, 1), (7, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 601 for generator 11. -/
theorem ep_Q2_008_partial_11_0601_valid :
    mulPoly ep_Q2_008_coefficient_11_0601
        ep_Q2_008_generator_11_0600_0699 =
      ep_Q2_008_partial_11_0601 := by
  native_decide

/-- Coefficient term 602 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0602 : Poly :=
[
  term ((18296019523453003248156164561491200 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 602 for generator 11. -/
def ep_Q2_008_partial_11_0602 : Poly :=
[
  term ((36592039046906006496312329122982400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((36592039046906006496312329122982400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-18296019523453003248156164561491200 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (12, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-18296019523453003248156164561491200 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (12, 1), (13, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 602 for generator 11. -/
theorem ep_Q2_008_partial_11_0602_valid :
    mulPoly ep_Q2_008_coefficient_11_0602
        ep_Q2_008_generator_11_0600_0699 =
      ep_Q2_008_partial_11_0602 := by
  native_decide

/-- Coefficient term 603 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0603 : Poly :=
[
  term ((1824694926321908115 : Rat) / 1385912907228352718) [(6, 1), (7, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 603 for generator 11. -/
def ep_Q2_008_partial_11_0603 : Poly :=
[
  term ((1824694926321908115 : Rat) / 692956453614176359) [(2, 1), (6, 1), (7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((1824694926321908115 : Rat) / 692956453614176359) [(3, 1), (6, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1824694926321908115 : Rat) / 1385912907228352718) [(6, 1), (7, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-1824694926321908115 : Rat) / 1385912907228352718) [(6, 1), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 603 for generator 11. -/
theorem ep_Q2_008_partial_11_0603_valid :
    mulPoly ep_Q2_008_coefficient_11_0603
        ep_Q2_008_generator_11_0600_0699 =
      ep_Q2_008_partial_11_0603 := by
  native_decide

/-- Coefficient term 604 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0604 : Poly :=
[
  term ((18433677212656319626531732466304480000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 604 for generator 11. -/
def ep_Q2_008_partial_11_0604 : Poly :=
[
  term ((36867354425312639253063464932608960000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((36867354425312639253063464932608960000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-18433677212656319626531732466304480000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (12, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((-18433677212656319626531732466304480000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (12, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 604 for generator 11. -/
theorem ep_Q2_008_partial_11_0604_valid :
    mulPoly ep_Q2_008_coefficient_11_0604
        ep_Q2_008_generator_11_0600_0699 =
      ep_Q2_008_partial_11_0604 := by
  native_decide

/-- Coefficient term 605 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0605 : Poly :=
[
  term ((-14540822687560987659405012019857037249200 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 605 for generator 11. -/
def ep_Q2_008_partial_11_0605 : Poly :=
[
  term ((-29081645375121975318810024039714074498400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-29081645375121975318810024039714074498400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((14540822687560987659405012019857037249200 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (7, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((14540822687560987659405012019857037249200 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (7, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 605 for generator 11. -/
theorem ep_Q2_008_partial_11_0605_valid :
    mulPoly ep_Q2_008_coefficient_11_0605
        ep_Q2_008_generator_11_0600_0699 =
      ep_Q2_008_partial_11_0605 := by
  native_decide

/-- Coefficient term 606 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0606 : Poly :=
[
  term ((-231759677771422065979541084536372800 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (12, 1), (15, 3), (16, 1)]
]

/-- Partial product 606 for generator 11. -/
def ep_Q2_008_partial_11_0606 : Poly :=
[
  term ((-463519355542844131959082169072745600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((-463519355542844131959082169072745600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (12, 1), (15, 4), (16, 1)],
  term ((231759677771422065979541084536372800 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (12, 1), (14, 2), (15, 3), (16, 1)],
  term ((231759677771422065979541084536372800 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (12, 1), (15, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 606 for generator 11. -/
theorem ep_Q2_008_partial_11_0606_valid :
    mulPoly ep_Q2_008_coefficient_11_0606
        ep_Q2_008_generator_11_0600_0699 =
      ep_Q2_008_partial_11_0606 := by
  native_decide

/-- Coefficient term 607 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0607 : Poly :=
[
  term ((-3018074155795590088697385312395440800 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 607 for generator 11. -/
def ep_Q2_008_partial_11_0607 : Poly :=
[
  term ((-6036148311591180177394770624790881600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-6036148311591180177394770624790881600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (13, 1), (15, 3), (16, 1)],
  term ((3018074155795590088697385312395440800 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((3018074155795590088697385312395440800 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (13, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 607 for generator 11. -/
theorem ep_Q2_008_partial_11_0607_valid :
    mulPoly ep_Q2_008_coefficient_11_0607
        ep_Q2_008_generator_11_0600_0699 =
      ep_Q2_008_partial_11_0607 := by
  native_decide

/-- Coefficient term 608 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0608 : Poly :=
[
  term ((-804007011760614225 : Rat) / 47790100249253542) [(6, 1), (7, 1), (13, 1), (16, 1)]
]

/-- Partial product 608 for generator 11. -/
def ep_Q2_008_partial_11_0608 : Poly :=
[
  term ((-804007011760614225 : Rat) / 23895050124626771) [(2, 1), (6, 1), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-804007011760614225 : Rat) / 23895050124626771) [(3, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((804007011760614225 : Rat) / 47790100249253542) [(6, 1), (7, 1), (13, 1), (14, 2), (16, 1)],
  term ((804007011760614225 : Rat) / 47790100249253542) [(6, 1), (7, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 608 for generator 11. -/
theorem ep_Q2_008_partial_11_0608_valid :
    mulPoly ep_Q2_008_coefficient_11_0608
        ep_Q2_008_generator_11_0600_0699 =
      ep_Q2_008_partial_11_0608 := by
  native_decide

/-- Coefficient term 609 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0609 : Poly :=
[
  term ((-419734642053688214279615461044202974851133 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (7, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 609 for generator 11. -/
def ep_Q2_008_partial_11_0609 : Poly :=
[
  term ((-839469284107376428559230922088405949702266 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (7, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-839469284107376428559230922088405949702266 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((419734642053688214279615461044202974851133 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (7, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((419734642053688214279615461044202974851133 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (7, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 609 for generator 11. -/
theorem ep_Q2_008_partial_11_0609_valid :
    mulPoly ep_Q2_008_coefficient_11_0609
        ep_Q2_008_generator_11_0600_0699 =
      ep_Q2_008_partial_11_0609 := by
  native_decide

/-- Coefficient term 610 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0610 : Poly :=
[
  term ((-81108179735687806356739622851739712000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (13, 3), (15, 2), (16, 1)]
]

/-- Partial product 610 for generator 11. -/
def ep_Q2_008_partial_11_0610 : Poly :=
[
  term ((-162216359471375612713479245703479424000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 1), (13, 3), (14, 1), (15, 2), (16, 1)],
  term ((-162216359471375612713479245703479424000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (13, 3), (15, 3), (16, 1)],
  term ((81108179735687806356739622851739712000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (13, 3), (14, 2), (15, 2), (16, 1)],
  term ((81108179735687806356739622851739712000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (13, 3), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 610 for generator 11. -/
theorem ep_Q2_008_partial_11_0610_valid :
    mulPoly ep_Q2_008_coefficient_11_0610
        ep_Q2_008_generator_11_0600_0699 =
      ep_Q2_008_partial_11_0610 := by
  native_decide

/-- Coefficient term 611 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0611 : Poly :=
[
  term ((63083498173375073991568123984120305825052 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 611 for generator 11. -/
def ep_Q2_008_partial_11_0611 : Poly :=
[
  term ((126166996346750147983136247968240611650104 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((126166996346750147983136247968240611650104 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (7, 1), (15, 2), (16, 1)],
  term ((-63083498173375073991568123984120305825052 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-63083498173375073991568123984120305825052 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (7, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 611 for generator 11. -/
theorem ep_Q2_008_partial_11_0611_valid :
    mulPoly ep_Q2_008_coefficient_11_0611
        ep_Q2_008_generator_11_0600_0699 =
      ep_Q2_008_partial_11_0611 := by
  native_decide

/-- Coefficient term 612 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0612 : Poly :=
[
  term ((-609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (11, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 612 for generator 11. -/
def ep_Q2_008_partial_11_0612 : Poly :=
[
  term ((-1218442200846645037506346959141427200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 2), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1218442200846645037506346959141427200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 2), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (11, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (11, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 612 for generator 11. -/
theorem ep_Q2_008_partial_11_0612_valid :
    mulPoly ep_Q2_008_coefficient_11_0612
        ep_Q2_008_generator_11_0600_0699 =
      ep_Q2_008_partial_11_0612 := by
  native_decide

/-- Coefficient term 613 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0613 : Poly :=
[
  term ((-43336929246501263764396389789139200 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 613 for generator 11. -/
def ep_Q2_008_partial_11_0613 : Poly :=
[
  term ((-86673858493002527528792779578278400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-86673858493002527528792779578278400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 2), (11, 1), (15, 2), (16, 1)],
  term ((43336929246501263764396389789139200 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((43336929246501263764396389789139200 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 613 for generator 11. -/
theorem ep_Q2_008_partial_11_0613_valid :
    mulPoly ep_Q2_008_coefficient_11_0613
        ep_Q2_008_generator_11_0600_0699 =
      ep_Q2_008_partial_11_0613 := by
  native_decide

/-- Coefficient term 614 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0614 : Poly :=
[
  term ((507684250352768765627644566308928000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 614 for generator 11. -/
def ep_Q2_008_partial_11_0614 : Poly :=
[
  term ((1015368500705537531255289132617856000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1015368500705537531255289132617856000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 2), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-507684250352768765627644566308928000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-507684250352768765627644566308928000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (12, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 614 for generator 11. -/
theorem ep_Q2_008_partial_11_0614_valid :
    mulPoly ep_Q2_008_coefficient_11_0614
        ep_Q2_008_generator_11_0600_0699 =
      ep_Q2_008_partial_11_0614 := by
  native_decide

/-- Coefficient term 615 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0615 : Poly :=
[
  term ((1090082856615758049057239582405510400 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 615 for generator 11. -/
def ep_Q2_008_partial_11_0615 : Poly :=
[
  term ((2180165713231516098114479164811020800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((2180165713231516098114479164811020800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 2), (13, 1), (15, 2), (16, 1)],
  term ((-1090082856615758049057239582405510400 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1090082856615758049057239582405510400 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 615 for generator 11. -/
theorem ep_Q2_008_partial_11_0615_valid :
    mulPoly ep_Q2_008_coefficient_11_0615
        ep_Q2_008_generator_11_0600_0699 =
      ep_Q2_008_partial_11_0615 := by
  native_decide

/-- Coefficient term 616 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0616 : Poly :=
[
  term ((-2233810701552182568761636091759283200 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 616 for generator 11. -/
def ep_Q2_008_partial_11_0616 : Poly :=
[
  term ((-4467621403104365137523272183518566400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 2), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-4467621403104365137523272183518566400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 2), (13, 2), (15, 3), (16, 1)],
  term ((2233810701552182568761636091759283200 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (13, 2), (14, 2), (15, 2), (16, 1)],
  term ((2233810701552182568761636091759283200 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (13, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 616 for generator 11. -/
theorem ep_Q2_008_partial_11_0616_valid :
    mulPoly ep_Q2_008_coefficient_11_0616
        ep_Q2_008_generator_11_0600_0699 =
      ep_Q2_008_partial_11_0616 := by
  native_decide

/-- Coefficient term 617 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0617 : Poly :=
[
  term ((3649389852643816230 : Rat) / 692956453614176359) [(6, 1), (7, 2), (13, 2), (16, 1)]
]

/-- Partial product 617 for generator 11. -/
def ep_Q2_008_partial_11_0617 : Poly :=
[
  term ((7298779705287632460 : Rat) / 692956453614176359) [(2, 1), (6, 1), (7, 2), (13, 2), (14, 1), (16, 1)],
  term ((7298779705287632460 : Rat) / 692956453614176359) [(3, 1), (6, 1), (7, 2), (13, 2), (15, 1), (16, 1)],
  term ((-3649389852643816230 : Rat) / 692956453614176359) [(6, 1), (7, 2), (13, 2), (14, 2), (16, 1)],
  term ((-3649389852643816230 : Rat) / 692956453614176359) [(6, 1), (7, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 617 for generator 11. -/
theorem ep_Q2_008_partial_11_0617_valid :
    mulPoly ep_Q2_008_coefficient_11_0617
        ep_Q2_008_generator_11_0600_0699 =
      ep_Q2_008_partial_11_0617 := by
  native_decide

/-- Coefficient term 618 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0618 : Poly :=
[
  term ((73734708850625278506126929865217920000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 618 for generator 11. -/
def ep_Q2_008_partial_11_0618 : Poly :=
[
  term ((147469417701250557012253859730435840000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 2), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((147469417701250557012253859730435840000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 2), (13, 3), (15, 2), (16, 1)],
  term ((-73734708850625278506126929865217920000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (13, 3), (14, 2), (15, 1), (16, 1)],
  term ((-73734708850625278506126929865217920000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (13, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 618 for generator 11. -/
theorem ep_Q2_008_partial_11_0618_valid :
    mulPoly ep_Q2_008_coefficient_11_0618
        ep_Q2_008_generator_11_0600_0699 =
      ep_Q2_008_partial_11_0618 := by
  native_decide

/-- Coefficient term 619 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0619 : Poly :=
[
  term ((-38194118754993502733641676866041600 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (15, 2), (16, 1)]
]

/-- Partial product 619 for generator 11. -/
def ep_Q2_008_partial_11_0619 : Poly :=
[
  term ((-76388237509987005467283353732083200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 2), (14, 1), (15, 2), (16, 1)],
  term ((-76388237509987005467283353732083200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 2), (15, 3), (16, 1)],
  term ((38194118754993502733641676866041600 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (14, 2), (15, 2), (16, 1)],
  term ((38194118754993502733641676866041600 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 619 for generator 11. -/
theorem ep_Q2_008_partial_11_0619_valid :
    mulPoly ep_Q2_008_coefficient_11_0619
        ep_Q2_008_generator_11_0600_0699 =
      ep_Q2_008_partial_11_0619 := by
  native_decide

/-- Coefficient term 620 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0620 : Poly :=
[
  term ((1619646487561852949 : Rat) / 1385912907228352718) [(6, 1), (7, 2), (16, 1)]
]

/-- Partial product 620 for generator 11. -/
def ep_Q2_008_partial_11_0620 : Poly :=
[
  term ((1619646487561852949 : Rat) / 692956453614176359) [(2, 1), (6, 1), (7, 2), (14, 1), (16, 1)],
  term ((1619646487561852949 : Rat) / 692956453614176359) [(3, 1), (6, 1), (7, 2), (15, 1), (16, 1)],
  term ((-1619646487561852949 : Rat) / 1385912907228352718) [(6, 1), (7, 2), (14, 2), (16, 1)],
  term ((-1619646487561852949 : Rat) / 1385912907228352718) [(6, 1), (7, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 620 for generator 11. -/
theorem ep_Q2_008_partial_11_0620_valid :
    mulPoly ep_Q2_008_coefficient_11_0620
        ep_Q2_008_generator_11_0600_0699 =
      ep_Q2_008_partial_11_0620 := by
  native_decide

/-- Coefficient term 621 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0621 : Poly :=
[
  term ((2030737001411075062510578265235712000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 3), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 621 for generator 11. -/
def ep_Q2_008_partial_11_0621 : Poly :=
[
  term ((4061474002822150125021156530471424000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 3), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((4061474002822150125021156530471424000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 3), (13, 2), (15, 2), (16, 1)],
  term ((-2030737001411075062510578265235712000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 3), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((-2030737001411075062510578265235712000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 3), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 621 for generator 11. -/
theorem ep_Q2_008_partial_11_0621_valid :
    mulPoly ep_Q2_008_coefficient_11_0621
        ep_Q2_008_generator_11_0600_0699 =
      ep_Q2_008_partial_11_0621 := by
  native_decide

/-- Coefficient term 622 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0622 : Poly :=
[
  term ((18794145146976006279930835708492800 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 3), (15, 1), (16, 1)]
]

/-- Partial product 622 for generator 11. -/
def ep_Q2_008_partial_11_0622 : Poly :=
[
  term ((37588290293952012559861671416985600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 3), (14, 1), (15, 1), (16, 1)],
  term ((37588290293952012559861671416985600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 3), (15, 2), (16, 1)],
  term ((-18794145146976006279930835708492800 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 3), (14, 2), (15, 1), (16, 1)],
  term ((-18794145146976006279930835708492800 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 622 for generator 11. -/
theorem ep_Q2_008_partial_11_0622_valid :
    mulPoly ep_Q2_008_coefficient_11_0622
        ep_Q2_008_generator_11_0600_0699 =
      ep_Q2_008_partial_11_0622 := by
  native_decide

/-- Coefficient term 623 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0623 : Poly :=
[
  term ((21954589358913972424414439344075577815800 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 623 for generator 11. -/
def ep_Q2_008_partial_11_0623 : Poly :=
[
  term ((43909178717827944848828878688151155631600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((43909178717827944848828878688151155631600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((-21954589358913972424414439344075577815800 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (8, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-21954589358913972424414439344075577815800 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (8, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 623 for generator 11. -/
theorem ep_Q2_008_partial_11_0623_valid :
    mulPoly ep_Q2_008_coefficient_11_0623
        ep_Q2_008_generator_11_0600_0699 =
      ep_Q2_008_partial_11_0623 := by
  native_decide

/-- Coefficient term 624 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0624 : Poly :=
[
  term ((-35162393466106350 : Rat) / 692956453614176359) [(6, 1), (8, 1), (16, 1)]
]

/-- Partial product 624 for generator 11. -/
def ep_Q2_008_partial_11_0624 : Poly :=
[
  term ((-70324786932212700 : Rat) / 692956453614176359) [(2, 1), (6, 1), (8, 1), (14, 1), (16, 1)],
  term ((-70324786932212700 : Rat) / 692956453614176359) [(3, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((35162393466106350 : Rat) / 692956453614176359) [(6, 1), (8, 1), (14, 2), (16, 1)],
  term ((35162393466106350 : Rat) / 692956453614176359) [(6, 1), (8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 624 for generator 11. -/
theorem ep_Q2_008_partial_11_0624_valid :
    mulPoly ep_Q2_008_coefficient_11_0624
        ep_Q2_008_generator_11_0600_0699 =
      ep_Q2_008_partial_11_0624 := by
  native_decide

/-- Coefficient term 625 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0625 : Poly :=
[
  term ((41685407496652500 : Rat) / 692956453614176359) [(6, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 625 for generator 11. -/
def ep_Q2_008_partial_11_0625 : Poly :=
[
  term ((83370814993305000 : Rat) / 692956453614176359) [(2, 1), (6, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((83370814993305000 : Rat) / 692956453614176359) [(3, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-41685407496652500 : Rat) / 692956453614176359) [(6, 1), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((-41685407496652500 : Rat) / 692956453614176359) [(6, 1), (9, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 625 for generator 11. -/
theorem ep_Q2_008_partial_11_0625_valid :
    mulPoly ep_Q2_008_coefficient_11_0625
        ep_Q2_008_generator_11_0600_0699 =
      ep_Q2_008_partial_11_0625 := by
  native_decide

/-- Coefficient term 626 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0626 : Poly :=
[
  term ((-21935045861953702780443915773903649060600 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 626 for generator 11. -/
def ep_Q2_008_partial_11_0626 : Poly :=
[
  term ((-43870091723907405560887831547807298121200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-43870091723907405560887831547807298121200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((21935045861953702780443915773903649060600 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((21935045861953702780443915773903649060600 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (9, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 626 for generator 11. -/
theorem ep_Q2_008_partial_11_0626_valid :
    mulPoly ep_Q2_008_coefficient_11_0626
        ep_Q2_008_generator_11_0600_0699 =
      ep_Q2_008_partial_11_0626 := by
  native_decide

/-- Coefficient term 627 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0627 : Poly :=
[
  term ((-32572494933782739950872616953214592000 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (9, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 627 for generator 11. -/
def ep_Q2_008_partial_11_0627 : Poly :=
[
  term ((-65144989867565479901745233906429184000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-65144989867565479901745233906429184000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((32572494933782739950872616953214592000 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (9, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((32572494933782739950872616953214592000 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (9, 1), (13, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 627 for generator 11. -/
theorem ep_Q2_008_partial_11_0627_valid :
    mulPoly ep_Q2_008_coefficient_11_0627
        ep_Q2_008_generator_11_0600_0699 =
      ep_Q2_008_partial_11_0627 := by
  native_decide

/-- Coefficient term 628 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0628 : Poly :=
[
  term ((-2315584888450340175 : Rat) / 2771825814456705436) [(6, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 628 for generator 11. -/
def ep_Q2_008_partial_11_0628 : Poly :=
[
  term ((-2315584888450340175 : Rat) / 1385912907228352718) [(2, 1), (6, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2315584888450340175 : Rat) / 1385912907228352718) [(3, 1), (6, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((2315584888450340175 : Rat) / 2771825814456705436) [(6, 1), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((2315584888450340175 : Rat) / 2771825814456705436) [(6, 1), (9, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 628 for generator 11. -/
theorem ep_Q2_008_partial_11_0628_valid :
    mulPoly ep_Q2_008_coefficient_11_0628
        ep_Q2_008_generator_11_0600_0699 =
      ep_Q2_008_partial_11_0628 := by
  native_decide

/-- Coefficient term 629 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0629 : Poly :=
[
  term ((-123843123330768991898081868750515308800 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (9, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 629 for generator 11. -/
def ep_Q2_008_partial_11_0629 : Poly :=
[
  term ((-247686246661537983796163737501030617600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (9, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-247686246661537983796163737501030617600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (9, 1), (13, 2), (15, 2), (16, 1)],
  term ((123843123330768991898081868750515308800 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (9, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((123843123330768991898081868750515308800 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (9, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 629 for generator 11. -/
theorem ep_Q2_008_partial_11_0629_valid :
    mulPoly ep_Q2_008_coefficient_11_0629
        ep_Q2_008_generator_11_0600_0699 =
      ep_Q2_008_partial_11_0629 := by
  native_decide

/-- Coefficient term 630 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0630 : Poly :=
[
  term ((35897230451604133824241253872229831160450 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 630 for generator 11. -/
def ep_Q2_008_partial_11_0630 : Poly :=
[
  term ((71794460903208267648482507744459662320900 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((71794460903208267648482507744459662320900 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (9, 1), (15, 2), (16, 1)],
  term ((-35897230451604133824241253872229831160450 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-35897230451604133824241253872229831160450 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 630 for generator 11. -/
theorem ep_Q2_008_partial_11_0630_valid :
    mulPoly ep_Q2_008_coefficient_11_0630
        ep_Q2_008_generator_11_0600_0699 =
      ep_Q2_008_partial_11_0630 := by
  native_decide

/-- Coefficient term 631 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0631 : Poly :=
[
  term ((-6945979900585068000 : Rat) / 692956453614176359) [(6, 1), (10, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 631 for generator 11. -/
def ep_Q2_008_partial_11_0631 : Poly :=
[
  term ((-13891959801170136000 : Rat) / 692956453614176359) [(2, 1), (6, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-13891959801170136000 : Rat) / 692956453614176359) [(3, 1), (6, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((6945979900585068000 : Rat) / 692956453614176359) [(6, 1), (10, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((6945979900585068000 : Rat) / 692956453614176359) [(6, 1), (10, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 631 for generator 11. -/
theorem ep_Q2_008_partial_11_0631_valid :
    mulPoly ep_Q2_008_coefficient_11_0631
        ep_Q2_008_generator_11_0600_0699 =
      ep_Q2_008_partial_11_0631 := by
  native_decide

/-- Coefficient term 632 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0632 : Poly :=
[
  term ((3472989950292534000 : Rat) / 692956453614176359) [(6, 1), (10, 1), (12, 1), (16, 1)]
]

/-- Partial product 632 for generator 11. -/
def ep_Q2_008_partial_11_0632 : Poly :=
[
  term ((6945979900585068000 : Rat) / 692956453614176359) [(2, 1), (6, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((6945979900585068000 : Rat) / 692956453614176359) [(3, 1), (6, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3472989950292534000 : Rat) / 692956453614176359) [(6, 1), (10, 1), (12, 1), (14, 2), (16, 1)],
  term ((-3472989950292534000 : Rat) / 692956453614176359) [(6, 1), (10, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 632 for generator 11. -/
theorem ep_Q2_008_partial_11_0632_valid :
    mulPoly ep_Q2_008_coefficient_11_0632
        ep_Q2_008_generator_11_0600_0699 =
      ep_Q2_008_partial_11_0632 := by
  native_decide

/-- Coefficient term 633 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0633 : Poly :=
[
  term ((-2463997250706797049252101470056080882154600 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 633 for generator 11. -/
def ep_Q2_008_partial_11_0633 : Poly :=
[
  term ((-4927994501413594098504202940112161764309200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4927994501413594098504202940112161764309200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((2463997250706797049252101470056080882154600 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (10, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((2463997250706797049252101470056080882154600 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (10, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 633 for generator 11. -/
theorem ep_Q2_008_partial_11_0633_valid :
    mulPoly ep_Q2_008_coefficient_11_0633
        ep_Q2_008_generator_11_0600_0699 =
      ep_Q2_008_partial_11_0633 := by
  native_decide

/-- Coefficient term 634 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0634 : Poly :=
[
  term ((-15048724891584691125 : Rat) / 2771825814456705436) [(6, 1), (10, 1), (16, 1)]
]

/-- Partial product 634 for generator 11. -/
def ep_Q2_008_partial_11_0634 : Poly :=
[
  term ((-15048724891584691125 : Rat) / 1385912907228352718) [(2, 1), (6, 1), (10, 1), (14, 1), (16, 1)],
  term ((-15048724891584691125 : Rat) / 1385912907228352718) [(3, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((15048724891584691125 : Rat) / 2771825814456705436) [(6, 1), (10, 1), (14, 2), (16, 1)],
  term ((15048724891584691125 : Rat) / 2771825814456705436) [(6, 1), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 634 for generator 11. -/
theorem ep_Q2_008_partial_11_0634_valid :
    mulPoly ep_Q2_008_coefficient_11_0634
        ep_Q2_008_generator_11_0600_0699 =
      ep_Q2_008_partial_11_0634 := by
  native_decide

/-- Coefficient term 635 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0635 : Poly :=
[
  term ((11911384284348060000 : Rat) / 692956453614176359) [(6, 1), (11, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 635 for generator 11. -/
def ep_Q2_008_partial_11_0635 : Poly :=
[
  term ((23822768568696120000 : Rat) / 692956453614176359) [(2, 1), (6, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((23822768568696120000 : Rat) / 692956453614176359) [(3, 1), (6, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-11911384284348060000 : Rat) / 692956453614176359) [(6, 1), (11, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-11911384284348060000 : Rat) / 692956453614176359) [(6, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 635 for generator 11. -/
theorem ep_Q2_008_partial_11_0635_valid :
    mulPoly ep_Q2_008_coefficient_11_0635
        ep_Q2_008_generator_11_0600_0699 =
      ep_Q2_008_partial_11_0635 := by
  native_decide

/-- Coefficient term 636 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0636 : Poly :=
[
  term ((986081703790547839089985468443785088000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 636 for generator 11. -/
def ep_Q2_008_partial_11_0636 : Poly :=
[
  term ((1972163407581095678179970936887570176000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (11, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((1972163407581095678179970936887570176000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (11, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-986081703790547839089985468443785088000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (11, 1), (12, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((-986081703790547839089985468443785088000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (11, 1), (12, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 636 for generator 11. -/
theorem ep_Q2_008_partial_11_0636_valid :
    mulPoly ep_Q2_008_coefficient_11_0636
        ep_Q2_008_generator_11_0600_0699 =
      ep_Q2_008_partial_11_0636 := by
  native_decide

/-- Coefficient term 637 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0637 : Poly :=
[
  term ((13561119939237832158519874199934330793350 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 637 for generator 11. -/
def ep_Q2_008_partial_11_0637 : Poly :=
[
  term ((27122239878475664317039748399868661586700 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((27122239878475664317039748399868661586700 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-13561119939237832158519874199934330793350 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-13561119939237832158519874199934330793350 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 637 for generator 11. -/
theorem ep_Q2_008_partial_11_0637_valid :
    mulPoly ep_Q2_008_coefficient_11_0637
        ep_Q2_008_generator_11_0600_0699 =
      ep_Q2_008_partial_11_0637 := by
  native_decide

/-- Coefficient term 638 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0638 : Poly :=
[
  term ((-10874339801935150719663844735519771372800 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 638 for generator 11. -/
def ep_Q2_008_partial_11_0638 : Poly :=
[
  term ((-21748679603870301439327689471039542745600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-21748679603870301439327689471039542745600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((10874339801935150719663844735519771372800 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((10874339801935150719663844735519771372800 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 1), (13, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 638 for generator 11. -/
theorem ep_Q2_008_partial_11_0638_valid :
    mulPoly ep_Q2_008_coefficient_11_0638
        ep_Q2_008_generator_11_0600_0699 =
      ep_Q2_008_partial_11_0638 := by
  native_decide

/-- Coefficient term 639 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0639 : Poly :=
[
  term ((8691101425391959071 : Rat) / 1385912907228352718) [(6, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 639 for generator 11. -/
def ep_Q2_008_partial_11_0639 : Poly :=
[
  term ((8691101425391959071 : Rat) / 692956453614176359) [(2, 1), (6, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((8691101425391959071 : Rat) / 692956453614176359) [(3, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-8691101425391959071 : Rat) / 1385912907228352718) [(6, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-8691101425391959071 : Rat) / 1385912907228352718) [(6, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 639 for generator 11. -/
theorem ep_Q2_008_partial_11_0639_valid :
    mulPoly ep_Q2_008_coefficient_11_0639
        ep_Q2_008_generator_11_0600_0699 =
      ep_Q2_008_partial_11_0639 := by
  native_decide

/-- Coefficient term 640 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0640 : Poly :=
[
  term ((-6413552549491277206545169674632872575124800 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 640 for generator 11. -/
def ep_Q2_008_partial_11_0640 : Poly :=
[
  term ((-12827105098982554413090339349265745150249600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-12827105098982554413090339349265745150249600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((6413552549491277206545169674632872575124800 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((6413552549491277206545169674632872575124800 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 640 for generator 11. -/
theorem ep_Q2_008_partial_11_0640_valid :
    mulPoly ep_Q2_008_coefficient_11_0640
        ep_Q2_008_generator_11_0600_0699 =
      ep_Q2_008_partial_11_0640 := by
  native_decide

/-- Coefficient term 641 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0641 : Poly :=
[
  term ((-4338759496678410491995936061152654387200 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (11, 1), (13, 3), (15, 2), (16, 1)]
]

/-- Partial product 641 for generator 11. -/
def ep_Q2_008_partial_11_0641 : Poly :=
[
  term ((-8677518993356820983991872122305308774400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (11, 1), (13, 3), (14, 1), (15, 2), (16, 1)],
  term ((-8677518993356820983991872122305308774400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (11, 1), (13, 3), (15, 3), (16, 1)],
  term ((4338759496678410491995936061152654387200 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (11, 1), (13, 3), (14, 2), (15, 2), (16, 1)],
  term ((4338759496678410491995936061152654387200 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (11, 1), (13, 3), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 641 for generator 11. -/
theorem ep_Q2_008_partial_11_0641_valid :
    mulPoly ep_Q2_008_coefficient_11_0641
        ep_Q2_008_generator_11_0600_0699 =
      ep_Q2_008_partial_11_0641 := by
  native_decide

/-- Coefficient term 642 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0642 : Poly :=
[
  term ((1036063097961228958589159967207787327816371 : Rat) / 337415203702659030751481656517966109395996) [(6, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 642 for generator 11. -/
def ep_Q2_008_partial_11_0642 : Poly :=
[
  term ((1036063097961228958589159967207787327816371 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((1036063097961228958589159967207787327816371 : Rat) / 168707601851329515375740828258983054697998) [(3, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((-1036063097961228958589159967207787327816371 : Rat) / 337415203702659030751481656517966109395996) [(6, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1036063097961228958589159967207787327816371 : Rat) / 337415203702659030751481656517966109395996) [(6, 1), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 642 for generator 11. -/
theorem ep_Q2_008_partial_11_0642_valid :
    mulPoly ep_Q2_008_coefficient_11_0642
        ep_Q2_008_generator_11_0600_0699 =
      ep_Q2_008_partial_11_0642 := by
  native_decide

/-- Coefficient term 643 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0643 : Poly :=
[
  term ((-4174096503359420458277063099646775564800 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 643 for generator 11. -/
def ep_Q2_008_partial_11_0643 : Poly :=
[
  term ((-8348193006718840916554126199293551129600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-8348193006718840916554126199293551129600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((4174096503359420458277063099646775564800 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((4174096503359420458277063099646775564800 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 2), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 643 for generator 11. -/
theorem ep_Q2_008_partial_11_0643_valid :
    mulPoly ep_Q2_008_coefficient_11_0643
        ep_Q2_008_generator_11_0600_0699 =
      ep_Q2_008_partial_11_0643 := by
  native_decide

/-- Coefficient term 644 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0644 : Poly :=
[
  term ((-14293661141217672000 : Rat) / 692956453614176359) [(6, 1), (11, 2), (13, 2), (16, 1)]
]

/-- Partial product 644 for generator 11. -/
def ep_Q2_008_partial_11_0644 : Poly :=
[
  term ((-28587322282435344000 : Rat) / 692956453614176359) [(2, 1), (6, 1), (11, 2), (13, 2), (14, 1), (16, 1)],
  term ((-28587322282435344000 : Rat) / 692956453614176359) [(3, 1), (6, 1), (11, 2), (13, 2), (15, 1), (16, 1)],
  term ((14293661141217672000 : Rat) / 692956453614176359) [(6, 1), (11, 2), (13, 2), (14, 2), (16, 1)],
  term ((14293661141217672000 : Rat) / 692956453614176359) [(6, 1), (11, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 644 for generator 11. -/
theorem ep_Q2_008_partial_11_0644_valid :
    mulPoly ep_Q2_008_coefficient_11_0644
        ep_Q2_008_generator_11_0600_0699 =
      ep_Q2_008_partial_11_0644 := by
  native_decide

/-- Coefficient term 645 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0645 : Poly :=
[
  term ((-1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (11, 2), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 645 for generator 11. -/
def ep_Q2_008_partial_11_0645 : Poly :=
[
  term ((-2366596089097314813815965124265084211200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (11, 2), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-2366596089097314813815965124265084211200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (11, 2), (13, 3), (15, 2), (16, 1)],
  term ((1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (11, 2), (13, 3), (14, 2), (15, 1), (16, 1)],
  term ((1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (11, 2), (13, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 645 for generator 11. -/
theorem ep_Q2_008_partial_11_0645_valid :
    mulPoly ep_Q2_008_coefficient_11_0645
        ep_Q2_008_generator_11_0600_0699 =
      ep_Q2_008_partial_11_0645 := by
  native_decide

/-- Coefficient term 646 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0646 : Poly :=
[
  term ((-3661935281887213125 : Rat) / 1385912907228352718) [(6, 1), (11, 2), (16, 1)]
]

/-- Partial product 646 for generator 11. -/
def ep_Q2_008_partial_11_0646 : Poly :=
[
  term ((-3661935281887213125 : Rat) / 692956453614176359) [(2, 1), (6, 1), (11, 2), (14, 1), (16, 1)],
  term ((-3661935281887213125 : Rat) / 692956453614176359) [(3, 1), (6, 1), (11, 2), (15, 1), (16, 1)],
  term ((3661935281887213125 : Rat) / 1385912907228352718) [(6, 1), (11, 2), (14, 2), (16, 1)],
  term ((3661935281887213125 : Rat) / 1385912907228352718) [(6, 1), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 646 for generator 11. -/
theorem ep_Q2_008_partial_11_0646_valid :
    mulPoly ep_Q2_008_coefficient_11_0646
        ep_Q2_008_generator_11_0600_0699 =
      ep_Q2_008_partial_11_0646 := by
  native_decide

/-- Coefficient term 647 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0647 : Poly :=
[
  term ((-2840935691552274599409348964990276285649367 : Rat) / 337415203702659030751481656517966109395996) [(6, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 647 for generator 11. -/
def ep_Q2_008_partial_11_0647 : Poly :=
[
  term ((-2840935691552274599409348964990276285649367 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (6, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2840935691552274599409348964990276285649367 : Rat) / 168707601851329515375740828258983054697998) [(3, 1), (6, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((2840935691552274599409348964990276285649367 : Rat) / 337415203702659030751481656517966109395996) [(6, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((2840935691552274599409348964990276285649367 : Rat) / 337415203702659030751481656517966109395996) [(6, 1), (12, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 647 for generator 11. -/
theorem ep_Q2_008_partial_11_0647_valid :
    mulPoly ep_Q2_008_coefficient_11_0647
        ep_Q2_008_generator_11_0600_0699 =
      ep_Q2_008_partial_11_0647 := by
  native_decide

/-- Coefficient term 648 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0648 : Poly :=
[
  term ((3435233678578325465784110552734491249023163 : Rat) / 674830407405318061502963313035932218791992) [(6, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 648 for generator 11. -/
def ep_Q2_008_partial_11_0648 : Poly :=
[
  term ((3435233678578325465784110552734491249023163 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (6, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((3435233678578325465784110552734491249023163 : Rat) / 337415203702659030751481656517966109395996) [(3, 1), (6, 1), (12, 1), (15, 3), (16, 1)],
  term ((-3435233678578325465784110552734491249023163 : Rat) / 674830407405318061502963313035932218791992) [(6, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((-3435233678578325465784110552734491249023163 : Rat) / 674830407405318061502963313035932218791992) [(6, 1), (12, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 648 for generator 11. -/
theorem ep_Q2_008_partial_11_0648_valid :
    mulPoly ep_Q2_008_coefficient_11_0648
        ep_Q2_008_generator_11_0600_0699 =
      ep_Q2_008_partial_11_0648 := by
  native_decide

/-- Coefficient term 649 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0649 : Poly :=
[
  term ((-41889972037375162185 : Rat) / 5543651628913410872) [(6, 1), (12, 1), (16, 1)]
]

/-- Partial product 649 for generator 11. -/
def ep_Q2_008_partial_11_0649 : Poly :=
[
  term ((-41889972037375162185 : Rat) / 2771825814456705436) [(2, 1), (6, 1), (12, 1), (14, 1), (16, 1)],
  term ((-41889972037375162185 : Rat) / 2771825814456705436) [(3, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((41889972037375162185 : Rat) / 5543651628913410872) [(6, 1), (12, 1), (14, 2), (16, 1)],
  term ((41889972037375162185 : Rat) / 5543651628913410872) [(6, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 649 for generator 11. -/
theorem ep_Q2_008_partial_11_0649_valid :
    mulPoly ep_Q2_008_coefficient_11_0649
        ep_Q2_008_generator_11_0600_0699 =
      ep_Q2_008_partial_11_0649 := by
  native_decide

/-- Coefficient term 650 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0650 : Poly :=
[
  term ((18544321300218456056194432836710405669336271 : Rat) / 1349660814810636123005926626071864437583984) [(6, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 650 for generator 11. -/
def ep_Q2_008_partial_11_0650 : Poly :=
[
  term ((18544321300218456056194432836710405669336271 : Rat) / 674830407405318061502963313035932218791992) [(2, 1), (6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((18544321300218456056194432836710405669336271 : Rat) / 674830407405318061502963313035932218791992) [(3, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((-18544321300218456056194432836710405669336271 : Rat) / 1349660814810636123005926626071864437583984) [(6, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-18544321300218456056194432836710405669336271 : Rat) / 1349660814810636123005926626071864437583984) [(6, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 650 for generator 11. -/
theorem ep_Q2_008_partial_11_0650_valid :
    mulPoly ep_Q2_008_coefficient_11_0650
        ep_Q2_008_generator_11_0600_0699 =
      ep_Q2_008_partial_11_0650 := by
  native_decide

/-- Coefficient term 651 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0651 : Poly :=
[
  term ((141147478046391873120448006797263232000 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 651 for generator 11. -/
def ep_Q2_008_partial_11_0651 : Poly :=
[
  term ((282294956092783746240896013594526464000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((282294956092783746240896013594526464000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (13, 1), (15, 4), (16, 1)],
  term ((-141147478046391873120448006797263232000 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (13, 1), (14, 2), (15, 3), (16, 1)],
  term ((-141147478046391873120448006797263232000 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (13, 1), (15, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 651 for generator 11. -/
theorem ep_Q2_008_partial_11_0651_valid :
    mulPoly ep_Q2_008_coefficient_11_0651
        ep_Q2_008_generator_11_0600_0699 =
      ep_Q2_008_partial_11_0651 := by
  native_decide

/-- Coefficient term 652 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0652 : Poly :=
[
  term ((-71494386130903293746792654147962307308800 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 652 for generator 11. -/
def ep_Q2_008_partial_11_0652 : Poly :=
[
  term ((-142988772261806587493585308295924614617600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-142988772261806587493585308295924614617600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (13, 2), (15, 3), (16, 1)],
  term ((71494386130903293746792654147962307308800 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (13, 2), (14, 2), (15, 2), (16, 1)],
  term ((71494386130903293746792654147962307308800 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (13, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 652 for generator 11. -/
theorem ep_Q2_008_partial_11_0652_valid :
    mulPoly ep_Q2_008_coefficient_11_0652
        ep_Q2_008_generator_11_0600_0699 =
      ep_Q2_008_partial_11_0652 := by
  native_decide

/-- Coefficient term 653 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0653 : Poly :=
[
  term ((-23985511571295349047 : Rat) / 5543651628913410872) [(6, 1), (13, 2), (16, 1)]
]

/-- Partial product 653 for generator 11. -/
def ep_Q2_008_partial_11_0653 : Poly :=
[
  term ((-23985511571295349047 : Rat) / 2771825814456705436) [(2, 1), (6, 1), (13, 2), (14, 1), (16, 1)],
  term ((-23985511571295349047 : Rat) / 2771825814456705436) [(3, 1), (6, 1), (13, 2), (15, 1), (16, 1)],
  term ((23985511571295349047 : Rat) / 5543651628913410872) [(6, 1), (13, 2), (14, 2), (16, 1)],
  term ((23985511571295349047 : Rat) / 5543651628913410872) [(6, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 653 for generator 11. -/
theorem ep_Q2_008_partial_11_0653_valid :
    mulPoly ep_Q2_008_coefficient_11_0653
        ep_Q2_008_generator_11_0600_0699 =
      ep_Q2_008_partial_11_0653 := by
  native_decide

/-- Coefficient term 654 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0654 : Poly :=
[
  term ((5641764941641580875071738680230623985650 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (15, 2), (16, 1)]
]

/-- Partial product 654 for generator 11. -/
def ep_Q2_008_partial_11_0654 : Poly :=
[
  term ((11283529883283161750143477360461247971300 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((11283529883283161750143477360461247971300 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (15, 3), (16, 1)],
  term ((-5641764941641580875071738680230623985650 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (14, 2), (15, 2), (16, 1)],
  term ((-5641764941641580875071738680230623985650 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 654 for generator 11. -/
theorem ep_Q2_008_partial_11_0654_valid :
    mulPoly ep_Q2_008_coefficient_11_0654
        ep_Q2_008_generator_11_0600_0699 =
      ep_Q2_008_partial_11_0654 := by
  native_decide

/-- Coefficient term 655 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0655 : Poly :=
[
  term ((731645701927614049 : Rat) / 5543651628913410872) [(6, 1), (16, 1)]
]

/-- Partial product 655 for generator 11. -/
def ep_Q2_008_partial_11_0655 : Poly :=
[
  term ((731645701927614049 : Rat) / 2771825814456705436) [(2, 1), (6, 1), (14, 1), (16, 1)],
  term ((731645701927614049 : Rat) / 2771825814456705436) [(3, 1), (6, 1), (15, 1), (16, 1)],
  term ((-731645701927614049 : Rat) / 5543651628913410872) [(6, 1), (14, 2), (16, 1)],
  term ((-731645701927614049 : Rat) / 5543651628913410872) [(6, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 655 for generator 11. -/
theorem ep_Q2_008_partial_11_0655_valid :
    mulPoly ep_Q2_008_coefficient_11_0655
        ep_Q2_008_generator_11_0600_0699 =
      ep_Q2_008_partial_11_0655 := by
  native_decide

/-- Coefficient term 656 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0656 : Poly :=
[
  term ((-21813405123651604351406039090813201634600 : Rat) / 84353800925664757687870414129491527348999) [(6, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 656 for generator 11. -/
def ep_Q2_008_partial_11_0656 : Poly :=
[
  term ((-43626810247303208702812078181626403269200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-43626810247303208702812078181626403269200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 2), (11, 1), (15, 2), (16, 1)],
  term ((21813405123651604351406039090813201634600 : Rat) / 84353800925664757687870414129491527348999) [(6, 2), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((21813405123651604351406039090813201634600 : Rat) / 84353800925664757687870414129491527348999) [(6, 2), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 656 for generator 11. -/
theorem ep_Q2_008_partial_11_0656_valid :
    mulPoly ep_Q2_008_coefficient_11_0656
        ep_Q2_008_generator_11_0600_0699 =
      ep_Q2_008_partial_11_0656 := by
  native_decide

/-- Coefficient term 657 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0657 : Poly :=
[
  term ((-1677797445240764493918809674584262464000 : Rat) / 84353800925664757687870414129491527348999) [(6, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 657 for generator 11. -/
def ep_Q2_008_partial_11_0657 : Poly :=
[
  term ((-3355594890481528987837619349168524928000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3355594890481528987837619349168524928000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 2), (13, 1), (15, 2), (16, 1)],
  term ((1677797445240764493918809674584262464000 : Rat) / 84353800925664757687870414129491527348999) [(6, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((1677797445240764493918809674584262464000 : Rat) / 84353800925664757687870414129491527348999) [(6, 2), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 657 for generator 11. -/
theorem ep_Q2_008_partial_11_0657_valid :
    mulPoly ep_Q2_008_coefficient_11_0657
        ep_Q2_008_generator_11_0600_0699 =
      ep_Q2_008_partial_11_0657 := by
  native_decide

/-- Coefficient term 658 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0658 : Poly :=
[
  term ((7271135041217201450468679696937733878200 : Rat) / 84353800925664757687870414129491527348999) [(6, 2), (15, 2), (16, 1)]
]

/-- Partial product 658 for generator 11. -/
def ep_Q2_008_partial_11_0658 : Poly :=
[
  term ((14542270082434402900937359393875467756400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 2), (14, 1), (15, 2), (16, 1)],
  term ((14542270082434402900937359393875467756400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 2), (15, 3), (16, 1)],
  term ((-7271135041217201450468679696937733878200 : Rat) / 84353800925664757687870414129491527348999) [(6, 2), (14, 2), (15, 2), (16, 1)],
  term ((-7271135041217201450468679696937733878200 : Rat) / 84353800925664757687870414129491527348999) [(6, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 658 for generator 11. -/
theorem ep_Q2_008_partial_11_0658_valid :
    mulPoly ep_Q2_008_coefficient_11_0658
        ep_Q2_008_generator_11_0600_0699 =
      ep_Q2_008_partial_11_0658 := by
  native_decide

/-- Coefficient term 659 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0659 : Poly :=
[
  term ((-346288422606126750 : Rat) / 692956453614176359) [(6, 2), (16, 1)]
]

/-- Partial product 659 for generator 11. -/
def ep_Q2_008_partial_11_0659 : Poly :=
[
  term ((-692576845212253500 : Rat) / 692956453614176359) [(2, 1), (6, 2), (14, 1), (16, 1)],
  term ((-692576845212253500 : Rat) / 692956453614176359) [(3, 1), (6, 2), (15, 1), (16, 1)],
  term ((346288422606126750 : Rat) / 692956453614176359) [(6, 2), (14, 2), (16, 1)],
  term ((346288422606126750 : Rat) / 692956453614176359) [(6, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 659 for generator 11. -/
theorem ep_Q2_008_partial_11_0659_valid :
    mulPoly ep_Q2_008_coefficient_11_0659
        ep_Q2_008_generator_11_0600_0699 =
      ep_Q2_008_partial_11_0659 := by
  native_decide

/-- Coefficient term 660 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0660 : Poly :=
[
  term ((-41685407496652500 : Rat) / 692956453614176359) [(7, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 660 for generator 11. -/
def ep_Q2_008_partial_11_0660 : Poly :=
[
  term ((-83370814993305000 : Rat) / 692956453614176359) [(2, 1), (7, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((-83370814993305000 : Rat) / 692956453614176359) [(3, 1), (7, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((41685407496652500 : Rat) / 692956453614176359) [(7, 1), (8, 1), (11, 1), (14, 2), (16, 1)],
  term ((41685407496652500 : Rat) / 692956453614176359) [(7, 1), (8, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 660 for generator 11. -/
theorem ep_Q2_008_partial_11_0660_valid :
    mulPoly ep_Q2_008_coefficient_11_0660
        ep_Q2_008_generator_11_0600_0699 =
      ep_Q2_008_partial_11_0660 := by
  native_decide

/-- Coefficient term 661 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0661 : Poly :=
[
  term ((32572494933782739950872616953214592000 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (8, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 661 for generator 11. -/
def ep_Q2_008_partial_11_0661 : Poly :=
[
  term ((65144989867565479901745233906429184000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (8, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((65144989867565479901745233906429184000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 1), (8, 1), (13, 1), (15, 3), (16, 1)],
  term ((-32572494933782739950872616953214592000 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (8, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-32572494933782739950872616953214592000 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (8, 1), (13, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 661 for generator 11. -/
theorem ep_Q2_008_partial_11_0661_valid :
    mulPoly ep_Q2_008_coefficient_11_0661
        ep_Q2_008_generator_11_0600_0699 =
      ep_Q2_008_partial_11_0661 := by
  native_decide

/-- Coefficient term 662 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0662 : Poly :=
[
  term ((2503117653602907375 : Rat) / 2771825814456705436) [(7, 1), (8, 1), (13, 1), (16, 1)]
]

/-- Partial product 662 for generator 11. -/
def ep_Q2_008_partial_11_0662 : Poly :=
[
  term ((2503117653602907375 : Rat) / 1385912907228352718) [(2, 1), (7, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((2503117653602907375 : Rat) / 1385912907228352718) [(3, 1), (7, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2503117653602907375 : Rat) / 2771825814456705436) [(7, 1), (8, 1), (13, 1), (14, 2), (16, 1)],
  term ((-2503117653602907375 : Rat) / 2771825814456705436) [(7, 1), (8, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 662 for generator 11. -/
theorem ep_Q2_008_partial_11_0662_valid :
    mulPoly ep_Q2_008_coefficient_11_0662
        ep_Q2_008_generator_11_0600_0699 =
      ep_Q2_008_partial_11_0662 := by
  native_decide

/-- Coefficient term 663 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0663 : Poly :=
[
  term ((100679917130573283002078523224804649600 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (8, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 663 for generator 11. -/
def ep_Q2_008_partial_11_0663 : Poly :=
[
  term ((201359834261146566004157046449609299200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (8, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((201359834261146566004157046449609299200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 1), (8, 1), (13, 2), (15, 2), (16, 1)],
  term ((-100679917130573283002078523224804649600 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (8, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((-100679917130573283002078523224804649600 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (8, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 663 for generator 11. -/
theorem ep_Q2_008_partial_11_0663_valid :
    mulPoly ep_Q2_008_coefficient_11_0663
        ep_Q2_008_generator_11_0600_0699 =
      ep_Q2_008_partial_11_0663 := by
  native_decide

/-- Coefficient term 664 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0664 : Poly :=
[
  term ((1459755941057526492 : Rat) / 692956453614176359) [(7, 1), (8, 1), (13, 3), (16, 1)]
]

/-- Partial product 664 for generator 11. -/
def ep_Q2_008_partial_11_0664 : Poly :=
[
  term ((2919511882115052984 : Rat) / 692956453614176359) [(2, 1), (7, 1), (8, 1), (13, 3), (14, 1), (16, 1)],
  term ((2919511882115052984 : Rat) / 692956453614176359) [(3, 1), (7, 1), (8, 1), (13, 3), (15, 1), (16, 1)],
  term ((-1459755941057526492 : Rat) / 692956453614176359) [(7, 1), (8, 1), (13, 3), (14, 2), (16, 1)],
  term ((-1459755941057526492 : Rat) / 692956453614176359) [(7, 1), (8, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 664 for generator 11. -/
theorem ep_Q2_008_partial_11_0664_valid :
    mulPoly ep_Q2_008_coefficient_11_0664
        ep_Q2_008_generator_11_0600_0699 =
      ep_Q2_008_partial_11_0664 := by
  native_decide

/-- Coefficient term 665 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0665 : Poly :=
[
  term ((29493883540250111402450771946087168000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (8, 1), (13, 4), (15, 1), (16, 1)]
]

/-- Partial product 665 for generator 11. -/
def ep_Q2_008_partial_11_0665 : Poly :=
[
  term ((58987767080500222804901543892174336000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 1), (8, 1), (13, 4), (14, 1), (15, 1), (16, 1)],
  term ((58987767080500222804901543892174336000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (8, 1), (13, 4), (15, 2), (16, 1)],
  term ((-29493883540250111402450771946087168000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (8, 1), (13, 4), (14, 2), (15, 1), (16, 1)],
  term ((-29493883540250111402450771946087168000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (8, 1), (13, 4), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 665 for generator 11. -/
theorem ep_Q2_008_partial_11_0665_valid :
    mulPoly ep_Q2_008_coefficient_11_0665
        ep_Q2_008_generator_11_0600_0699 =
      ep_Q2_008_partial_11_0665 := by
  native_decide

/-- Coefficient term 666 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0666 : Poly :=
[
  term ((-7050866951332719240916599352149764350050 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 666 for generator 11. -/
def ep_Q2_008_partial_11_0666 : Poly :=
[
  term ((-14101733902665438481833198704299528700100 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-14101733902665438481833198704299528700100 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 1), (8, 1), (15, 2), (16, 1)],
  term ((7050866951332719240916599352149764350050 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((7050866951332719240916599352149764350050 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (8, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 666 for generator 11. -/
theorem ep_Q2_008_partial_11_0666_valid :
    mulPoly ep_Q2_008_coefficient_11_0666
        ep_Q2_008_generator_11_0600_0699 =
      ep_Q2_008_partial_11_0666 := by
  native_decide

/-- Coefficient term 667 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0667 : Poly :=
[
  term ((23163206200195708896003345525710659200 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 667 for generator 11. -/
def ep_Q2_008_partial_11_0667 : Poly :=
[
  term ((46326412400391417792006691051421318400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((46326412400391417792006691051421318400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 1), (9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-23163206200195708896003345525710659200 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (9, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-23163206200195708896003345525710659200 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (9, 1), (12, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 667 for generator 11. -/
theorem ep_Q2_008_partial_11_0667_valid :
    mulPoly ep_Q2_008_coefficient_11_0667
        ep_Q2_008_generator_11_0600_0699 =
      ep_Q2_008_partial_11_0667 := by
  native_decide

/-- Coefficient term 668 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0668 : Poly :=
[
  term ((-1459755941057526492 : Rat) / 692956453614176359) [(7, 1), (9, 1), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 668 for generator 11. -/
def ep_Q2_008_partial_11_0668 : Poly :=
[
  term ((-2919511882115052984 : Rat) / 692956453614176359) [(2, 1), (7, 1), (9, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-2919511882115052984 : Rat) / 692956453614176359) [(3, 1), (7, 1), (9, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((1459755941057526492 : Rat) / 692956453614176359) [(7, 1), (9, 1), (12, 1), (13, 2), (14, 2), (16, 1)],
  term ((1459755941057526492 : Rat) / 692956453614176359) [(7, 1), (9, 1), (12, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 668 for generator 11. -/
theorem ep_Q2_008_partial_11_0668_valid :
    mulPoly ep_Q2_008_coefficient_11_0668
        ep_Q2_008_generator_11_0600_0699 =
      ep_Q2_008_partial_11_0668 := by
  native_decide

/-- Coefficient term 669 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0669 : Poly :=
[
  term ((-29493883540250111402450771946087168000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (9, 1), (12, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 669 for generator 11. -/
def ep_Q2_008_partial_11_0669 : Poly :=
[
  term ((-58987767080500222804901543892174336000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 1), (9, 1), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-58987767080500222804901543892174336000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (9, 1), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((29493883540250111402450771946087168000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (9, 1), (12, 1), (13, 3), (14, 2), (15, 1), (16, 1)],
  term ((29493883540250111402450771946087168000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (9, 1), (12, 1), (13, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 669 for generator 11. -/
theorem ep_Q2_008_partial_11_0669_valid :
    mulPoly ep_Q2_008_coefficient_11_0669
        ep_Q2_008_generator_11_0600_0699 =
      ep_Q2_008_partial_11_0669 := by
  native_decide

/-- Coefficient term 670 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0670 : Poly :=
[
  term ((-46883191288141800 : Rat) / 692956453614176359) [(7, 1), (9, 1), (12, 1), (16, 1)]
]

/-- Partial product 670 for generator 11. -/
def ep_Q2_008_partial_11_0670 : Poly :=
[
  term ((-93766382576283600 : Rat) / 692956453614176359) [(2, 1), (7, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((-93766382576283600 : Rat) / 692956453614176359) [(3, 1), (7, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((46883191288141800 : Rat) / 692956453614176359) [(7, 1), (9, 1), (12, 1), (14, 2), (16, 1)],
  term ((46883191288141800 : Rat) / 692956453614176359) [(7, 1), (9, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 670 for generator 11. -/
theorem ep_Q2_008_partial_11_0670_valid :
    mulPoly ep_Q2_008_coefficient_11_0670
        ep_Q2_008_generator_11_0600_0699 =
      ep_Q2_008_partial_11_0670 := by
  native_decide

/-- Coefficient term 671 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0671 : Poly :=
[
  term ((4174096503359420458277063099646775564800 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 671 for generator 11. -/
def ep_Q2_008_partial_11_0671 : Poly :=
[
  term ((8348193006718840916554126199293551129600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((8348193006718840916554126199293551129600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 1), (10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-4174096503359420458277063099646775564800 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (10, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-4174096503359420458277063099646775564800 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (10, 1), (11, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 671 for generator 11. -/
theorem ep_Q2_008_partial_11_0671_valid :
    mulPoly ep_Q2_008_coefficient_11_0671
        ep_Q2_008_generator_11_0600_0699 =
      ep_Q2_008_partial_11_0671 := by
  native_decide

/-- Coefficient term 672 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0672 : Poly :=
[
  term ((14293661141217672000 : Rat) / 692956453614176359) [(7, 1), (10, 1), (11, 1), (13, 2), (16, 1)]
]

/-- Partial product 672 for generator 11. -/
def ep_Q2_008_partial_11_0672 : Poly :=
[
  term ((28587322282435344000 : Rat) / 692956453614176359) [(2, 1), (7, 1), (10, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((28587322282435344000 : Rat) / 692956453614176359) [(3, 1), (7, 1), (10, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-14293661141217672000 : Rat) / 692956453614176359) [(7, 1), (10, 1), (11, 1), (13, 2), (14, 2), (16, 1)],
  term ((-14293661141217672000 : Rat) / 692956453614176359) [(7, 1), (10, 1), (11, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 672 for generator 11. -/
theorem ep_Q2_008_partial_11_0672_valid :
    mulPoly ep_Q2_008_coefficient_11_0672
        ep_Q2_008_generator_11_0600_0699 =
      ep_Q2_008_partial_11_0672 := by
  native_decide

/-- Coefficient term 673 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0673 : Poly :=
[
  term ((1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (10, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 673 for generator 11. -/
def ep_Q2_008_partial_11_0673 : Poly :=
[
  term ((2366596089097314813815965124265084211200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 1), (10, 1), (11, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((2366596089097314813815965124265084211200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (10, 1), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((-1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (10, 1), (11, 1), (13, 3), (14, 2), (15, 1), (16, 1)],
  term ((-1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (10, 1), (11, 1), (13, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 673 for generator 11. -/
theorem ep_Q2_008_partial_11_0673_valid :
    mulPoly ep_Q2_008_coefficient_11_0673
        ep_Q2_008_generator_11_0600_0699 =
      ep_Q2_008_partial_11_0673 := by
  native_decide

/-- Coefficient term 674 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0674 : Poly :=
[
  term ((3661935281887213125 : Rat) / 1385912907228352718) [(7, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 674 for generator 11. -/
def ep_Q2_008_partial_11_0674 : Poly :=
[
  term ((3661935281887213125 : Rat) / 692956453614176359) [(2, 1), (7, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((3661935281887213125 : Rat) / 692956453614176359) [(3, 1), (7, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3661935281887213125 : Rat) / 1385912907228352718) [(7, 1), (10, 1), (11, 1), (14, 2), (16, 1)],
  term ((-3661935281887213125 : Rat) / 1385912907228352718) [(7, 1), (10, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 674 for generator 11. -/
theorem ep_Q2_008_partial_11_0674_valid :
    mulPoly ep_Q2_008_coefficient_11_0674
        ep_Q2_008_generator_11_0600_0699 =
      ep_Q2_008_partial_11_0674 := by
  native_decide

/-- Coefficient term 675 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0675 : Poly :=
[
  term ((-18157674082962466377 : Rat) / 2771825814456705436) [(7, 1), (10, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 675 for generator 11. -/
def ep_Q2_008_partial_11_0675 : Poly :=
[
  term ((-18157674082962466377 : Rat) / 1385912907228352718) [(2, 1), (7, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-18157674082962466377 : Rat) / 1385912907228352718) [(3, 1), (7, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((18157674082962466377 : Rat) / 2771825814456705436) [(7, 1), (10, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((18157674082962466377 : Rat) / 2771825814456705436) [(7, 1), (10, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 675 for generator 11. -/
theorem ep_Q2_008_partial_11_0675_valid :
    mulPoly ep_Q2_008_coefficient_11_0675
        ep_Q2_008_generator_11_0600_0699 =
      ep_Q2_008_partial_11_0675 := by
  native_decide

/-- Coefficient term 676 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0676 : Poly :=
[
  term ((1843367721265631962653173246630448000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (10, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 676 for generator 11. -/
def ep_Q2_008_partial_11_0676 : Poly :=
[
  term ((3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 1), (10, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (10, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-1843367721265631962653173246630448000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (10, 1), (12, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((-1843367721265631962653173246630448000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (10, 1), (12, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 676 for generator 11. -/
theorem ep_Q2_008_partial_11_0676_valid :
    mulPoly ep_Q2_008_coefficient_11_0676
        ep_Q2_008_generator_11_0600_0699 =
      ep_Q2_008_partial_11_0676 := by
  native_decide

/-- Coefficient term 677 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0677 : Poly :=
[
  term ((5402428811566164000 : Rat) / 692956453614176359) [(7, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 677 for generator 11. -/
def ep_Q2_008_partial_11_0677 : Poly :=
[
  term ((10804857623132328000 : Rat) / 692956453614176359) [(2, 1), (7, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((10804857623132328000 : Rat) / 692956453614176359) [(3, 1), (7, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-5402428811566164000 : Rat) / 692956453614176359) [(7, 1), (10, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-5402428811566164000 : Rat) / 692956453614176359) [(7, 1), (10, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 677 for generator 11. -/
theorem ep_Q2_008_partial_11_0677_valid :
    mulPoly ep_Q2_008_coefficient_11_0677
        ep_Q2_008_generator_11_0600_0699 =
      ep_Q2_008_partial_11_0677 := by
  native_decide

/-- Coefficient term 678 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0678 : Poly :=
[
  term ((532965479303834382580460385427004227200 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (10, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 678 for generator 11. -/
def ep_Q2_008_partial_11_0678 : Poly :=
[
  term ((1065930958607668765160920770854008454400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (10, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((1065930958607668765160920770854008454400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 1), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((-532965479303834382580460385427004227200 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (10, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-532965479303834382580460385427004227200 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (10, 1), (13, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 678 for generator 11. -/
theorem ep_Q2_008_partial_11_0678_valid :
    mulPoly ep_Q2_008_coefficient_11_0678
        ep_Q2_008_generator_11_0600_0699 =
      ep_Q2_008_partial_11_0678 := by
  native_decide

/-- Coefficient term 679 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0679 : Poly :=
[
  term ((-1225362027883269627 : Rat) / 47790100249253542) [(7, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 679 for generator 11. -/
def ep_Q2_008_partial_11_0679 : Poly :=
[
  term ((-1225362027883269627 : Rat) / 23895050124626771) [(2, 1), (7, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1225362027883269627 : Rat) / 23895050124626771) [(3, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((1225362027883269627 : Rat) / 47790100249253542) [(7, 1), (10, 1), (13, 1), (14, 2), (16, 1)],
  term ((1225362027883269627 : Rat) / 47790100249253542) [(7, 1), (10, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 679 for generator 11. -/
theorem ep_Q2_008_partial_11_0679_valid :
    mulPoly ep_Q2_008_coefficient_11_0679
        ep_Q2_008_generator_11_0600_0699 =
      ep_Q2_008_partial_11_0679 := by
  native_decide

/-- Coefficient term 680 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0680 : Poly :=
[
  term ((-22860739721496737138535904821189592809303 : Rat) / 168707601851329515375740828258983054697998) [(7, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 680 for generator 11. -/
def ep_Q2_008_partial_11_0680 : Poly :=
[
  term ((-22860739721496737138535904821189592809303 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (10, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-22860739721496737138535904821189592809303 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((22860739721496737138535904821189592809303 : Rat) / 168707601851329515375740828258983054697998) [(7, 1), (10, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((22860739721496737138535904821189592809303 : Rat) / 168707601851329515375740828258983054697998) [(7, 1), (10, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 680 for generator 11. -/
theorem ep_Q2_008_partial_11_0680_valid :
    mulPoly ep_Q2_008_coefficient_11_0680
        ep_Q2_008_generator_11_0600_0699 =
      ep_Q2_008_partial_11_0680 := by
  native_decide

/-- Coefficient term 681 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0681 : Poly :=
[
  term ((-3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (10, 1), (13, 3), (15, 2), (16, 1)]
]

/-- Partial product 681 for generator 11. -/
def ep_Q2_008_partial_11_0681 : Poly :=
[
  term ((-7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 1), (10, 1), (13, 3), (14, 1), (15, 2), (16, 1)],
  term ((-7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (10, 1), (13, 3), (15, 3), (16, 1)],
  term ((3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (10, 1), (13, 3), (14, 2), (15, 2), (16, 1)],
  term ((3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (10, 1), (13, 3), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 681 for generator 11. -/
theorem ep_Q2_008_partial_11_0681_valid :
    mulPoly ep_Q2_008_coefficient_11_0681
        ep_Q2_008_generator_11_0600_0699 =
      ep_Q2_008_partial_11_0681 := by
  native_decide

/-- Coefficient term 682 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0682 : Poly :=
[
  term ((-1094816955793144869 : Rat) / 692956453614176359) [(7, 1), (10, 1), (13, 3), (16, 1)]
]

/-- Partial product 682 for generator 11. -/
def ep_Q2_008_partial_11_0682 : Poly :=
[
  term ((-2189633911586289738 : Rat) / 692956453614176359) [(2, 1), (7, 1), (10, 1), (13, 3), (14, 1), (16, 1)],
  term ((-2189633911586289738 : Rat) / 692956453614176359) [(3, 1), (7, 1), (10, 1), (13, 3), (15, 1), (16, 1)],
  term ((1094816955793144869 : Rat) / 692956453614176359) [(7, 1), (10, 1), (13, 3), (14, 2), (16, 1)],
  term ((1094816955793144869 : Rat) / 692956453614176359) [(7, 1), (10, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 682 for generator 11. -/
theorem ep_Q2_008_partial_11_0682_valid :
    mulPoly ep_Q2_008_coefficient_11_0682
        ep_Q2_008_generator_11_0600_0699 =
      ep_Q2_008_partial_11_0682 := by
  native_decide

/-- Coefficient term 683 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0683 : Poly :=
[
  term ((-22120412655187583551838078959565376000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (10, 1), (13, 4), (15, 1), (16, 1)]
]

/-- Partial product 683 for generator 11. -/
def ep_Q2_008_partial_11_0683 : Poly :=
[
  term ((-44240825310375167103676157919130752000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 1), (10, 1), (13, 4), (14, 1), (15, 1), (16, 1)],
  term ((-44240825310375167103676157919130752000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (10, 1), (13, 4), (15, 2), (16, 1)],
  term ((22120412655187583551838078959565376000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (10, 1), (13, 4), (14, 2), (15, 1), (16, 1)],
  term ((22120412655187583551838078959565376000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (10, 1), (13, 4), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 683 for generator 11. -/
theorem ep_Q2_008_partial_11_0683_valid :
    mulPoly ep_Q2_008_coefficient_11_0683
        ep_Q2_008_generator_11_0600_0699 =
      ep_Q2_008_partial_11_0683 := by
  native_decide

/-- Coefficient term 684 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0684 : Poly :=
[
  term ((-3683087647914606546580134175353400510578621 : Rat) / 337415203702659030751481656517966109395996) [(7, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 684 for generator 11. -/
def ep_Q2_008_partial_11_0684 : Poly :=
[
  term ((-3683087647914606546580134175353400510578621 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3683087647914606546580134175353400510578621 : Rat) / 168707601851329515375740828258983054697998) [(3, 1), (7, 1), (10, 1), (15, 2), (16, 1)],
  term ((3683087647914606546580134175353400510578621 : Rat) / 337415203702659030751481656517966109395996) [(7, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((3683087647914606546580134175353400510578621 : Rat) / 337415203702659030751481656517966109395996) [(7, 1), (10, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 684 for generator 11. -/
theorem ep_Q2_008_partial_11_0684_valid :
    mulPoly ep_Q2_008_coefficient_11_0684
        ep_Q2_008_generator_11_0600_0699 =
      ep_Q2_008_partial_11_0684 := by
  native_decide

/-- Coefficient term 685 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0685 : Poly :=
[
  term ((6945979900585068000 : Rat) / 692956453614176359) [(7, 1), (10, 2), (13, 1), (16, 1)]
]

/-- Partial product 685 for generator 11. -/
def ep_Q2_008_partial_11_0685 : Poly :=
[
  term ((13891959801170136000 : Rat) / 692956453614176359) [(2, 1), (7, 1), (10, 2), (13, 1), (14, 1), (16, 1)],
  term ((13891959801170136000 : Rat) / 692956453614176359) [(3, 1), (7, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-6945979900585068000 : Rat) / 692956453614176359) [(7, 1), (10, 2), (13, 1), (14, 2), (16, 1)],
  term ((-6945979900585068000 : Rat) / 692956453614176359) [(7, 1), (10, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 685 for generator 11. -/
theorem ep_Q2_008_partial_11_0685_valid :
    mulPoly ep_Q2_008_coefficient_11_0685
        ep_Q2_008_generator_11_0600_0699 =
      ep_Q2_008_partial_11_0685 := by
  native_decide

/-- Coefficient term 686 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0686 : Poly :=
[
  term ((2371586655122907659950465820102818934102103 : Rat) / 168707601851329515375740828258983054697998) [(7, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 686 for generator 11. -/
def ep_Q2_008_partial_11_0686 : Poly :=
[
  term ((2371586655122907659950465820102818934102103 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((2371586655122907659950465820102818934102103 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2371586655122907659950465820102818934102103 : Rat) / 168707601851329515375740828258983054697998) [(7, 1), (11, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-2371586655122907659950465820102818934102103 : Rat) / 168707601851329515375740828258983054697998) [(7, 1), (11, 1), (12, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 686 for generator 11. -/
theorem ep_Q2_008_partial_11_0686_valid :
    mulPoly ep_Q2_008_coefficient_11_0686
        ep_Q2_008_generator_11_0600_0699 =
      ep_Q2_008_partial_11_0686 := by
  native_decide

/-- Coefficient term 687 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0687 : Poly :=
[
  term ((792552098474969535197294721248288966400 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (11, 1), (12, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 687 for generator 11. -/
def ep_Q2_008_partial_11_0687 : Poly :=
[
  term ((1585104196949939070394589442496577932800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 1), (11, 1), (12, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((1585104196949939070394589442496577932800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (11, 1), (12, 1), (13, 2), (15, 3), (16, 1)],
  term ((-792552098474969535197294721248288966400 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (11, 1), (12, 1), (13, 2), (14, 2), (15, 2), (16, 1)],
  term ((-792552098474969535197294721248288966400 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (11, 1), (12, 1), (13, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 687 for generator 11. -/
theorem ep_Q2_008_partial_11_0687_valid :
    mulPoly ep_Q2_008_coefficient_11_0687
        ep_Q2_008_generator_11_0600_0699 =
      ep_Q2_008_partial_11_0687 := by
  native_decide

/-- Coefficient term 688 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0688 : Poly :=
[
  term ((-8434290471685303131 : Rat) / 692956453614176359) [(7, 1), (11, 1), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 688 for generator 11. -/
def ep_Q2_008_partial_11_0688 : Poly :=
[
  term ((-16868580943370606262 : Rat) / 692956453614176359) [(2, 1), (7, 1), (11, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-16868580943370606262 : Rat) / 692956453614176359) [(3, 1), (7, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((8434290471685303131 : Rat) / 692956453614176359) [(7, 1), (11, 1), (12, 1), (13, 2), (14, 2), (16, 1)],
  term ((8434290471685303131 : Rat) / 692956453614176359) [(7, 1), (11, 1), (12, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 688 for generator 11. -/
theorem ep_Q2_008_partial_11_0688_valid :
    mulPoly ep_Q2_008_coefficient_11_0688
        ep_Q2_008_generator_11_0600_0699 =
      ep_Q2_008_partial_11_0688 := by
  native_decide

/-- Coefficient term 689 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0689 : Poly :=
[
  term ((-766744950377250687720150295795462694400 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 689 for generator 11. -/
def ep_Q2_008_partial_11_0689 : Poly :=
[
  term ((-1533489900754501375440300591590925388800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 1), (11, 1), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-1533489900754501375440300591590925388800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (11, 1), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((766744950377250687720150295795462694400 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (11, 1), (12, 1), (13, 3), (14, 2), (15, 1), (16, 1)],
  term ((766744950377250687720150295795462694400 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (11, 1), (12, 1), (13, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 689 for generator 11. -/
theorem ep_Q2_008_partial_11_0689_valid :
    mulPoly ep_Q2_008_coefficient_11_0689
        ep_Q2_008_generator_11_0600_0699 =
      ep_Q2_008_partial_11_0689 := by
  native_decide

/-- Coefficient term 690 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0690 : Poly :=
[
  term ((1231691952427017417874009601032497148800 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (11, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 690 for generator 11. -/
def ep_Q2_008_partial_11_0690 : Poly :=
[
  term ((2463383904854034835748019202064994297600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((2463383904854034835748019202064994297600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 1), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((-1231691952427017417874009601032497148800 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (11, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((-1231691952427017417874009601032497148800 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (11, 1), (12, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 690 for generator 11. -/
theorem ep_Q2_008_partial_11_0690_valid :
    mulPoly ep_Q2_008_coefficient_11_0690
        ep_Q2_008_generator_11_0600_0699 =
      ep_Q2_008_partial_11_0690 := by
  native_decide

/-- Coefficient term 691 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0691 : Poly :=
[
  term ((11988162028943441235 : Rat) / 1385912907228352718) [(7, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 691 for generator 11. -/
def ep_Q2_008_partial_11_0691 : Poly :=
[
  term ((11988162028943441235 : Rat) / 692956453614176359) [(2, 1), (7, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((11988162028943441235 : Rat) / 692956453614176359) [(3, 1), (7, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-11988162028943441235 : Rat) / 1385912907228352718) [(7, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((-11988162028943441235 : Rat) / 1385912907228352718) [(7, 1), (11, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 691 for generator 11. -/
theorem ep_Q2_008_partial_11_0691_valid :
    mulPoly ep_Q2_008_coefficient_11_0691
        ep_Q2_008_generator_11_0600_0699 =
      ep_Q2_008_partial_11_0691 := by
  native_decide

/-- Coefficient term 692 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0692 : Poly :=
[
  term ((-199059708479375199780650266935387465600 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 692 for generator 11. -/
def ep_Q2_008_partial_11_0692 : Poly :=
[
  term ((-398119416958750399561300533870774931200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 1), (11, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-398119416958750399561300533870774931200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (11, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((199059708479375199780650266935387465600 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (11, 1), (12, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((199059708479375199780650266935387465600 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (11, 1), (12, 2), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 692 for generator 11. -/
theorem ep_Q2_008_partial_11_0692_valid :
    mulPoly ep_Q2_008_coefficient_11_0692
        ep_Q2_008_generator_11_0600_0699 =
      ep_Q2_008_partial_11_0692 := by
  native_decide

/-- Coefficient term 693 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0693 : Poly :=
[
  term ((-9894046412742829623 : Rat) / 2771825814456705436) [(7, 1), (11, 1), (12, 2), (16, 1)]
]

/-- Partial product 693 for generator 11. -/
def ep_Q2_008_partial_11_0693 : Poly :=
[
  term ((-9894046412742829623 : Rat) / 1385912907228352718) [(2, 1), (7, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((-9894046412742829623 : Rat) / 1385912907228352718) [(3, 1), (7, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((9894046412742829623 : Rat) / 2771825814456705436) [(7, 1), (11, 1), (12, 2), (14, 2), (16, 1)],
  term ((9894046412742829623 : Rat) / 2771825814456705436) [(7, 1), (11, 1), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 693 for generator 11. -/
theorem ep_Q2_008_partial_11_0693_valid :
    mulPoly ep_Q2_008_coefficient_11_0693
        ep_Q2_008_generator_11_0600_0699 =
      ep_Q2_008_partial_11_0693 := by
  native_decide

/-- Coefficient term 694 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0694 : Poly :=
[
  term ((-1163995040779499479435390384103449905004800 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 694 for generator 11. -/
def ep_Q2_008_partial_11_0694 : Poly :=
[
  term ((-2327990081558998958870780768206899810009600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2327990081558998958870780768206899810009600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((1163995040779499479435390384103449905004800 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((1163995040779499479435390384103449905004800 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (11, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 694 for generator 11. -/
theorem ep_Q2_008_partial_11_0694_valid :
    mulPoly ep_Q2_008_coefficient_11_0694
        ep_Q2_008_generator_11_0600_0699 =
      ep_Q2_008_partial_11_0694 := by
  native_decide

/-- Coefficient term 695 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0695 : Poly :=
[
  term ((-788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (11, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 695 for generator 11. -/
def ep_Q2_008_partial_11_0695 : Poly :=
[
  term ((-1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 1), (11, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (11, 1), (13, 2), (15, 3), (16, 1)],
  term ((788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (11, 1), (13, 2), (14, 2), (15, 2), (16, 1)],
  term ((788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (11, 1), (13, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 695 for generator 11. -/
theorem ep_Q2_008_partial_11_0695_valid :
    mulPoly ep_Q2_008_coefficient_11_0695
        ep_Q2_008_generator_11_0600_0699 =
      ep_Q2_008_partial_11_0695 := by
  native_decide

/-- Coefficient term 696 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0696 : Poly :=
[
  term ((-14293661141217672000 : Rat) / 692956453614176359) [(7, 1), (11, 1), (13, 2), (16, 1)]
]

/-- Partial product 696 for generator 11. -/
def ep_Q2_008_partial_11_0696 : Poly :=
[
  term ((-28587322282435344000 : Rat) / 692956453614176359) [(2, 1), (7, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-28587322282435344000 : Rat) / 692956453614176359) [(3, 1), (7, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((14293661141217672000 : Rat) / 692956453614176359) [(7, 1), (11, 1), (13, 2), (14, 2), (16, 1)],
  term ((14293661141217672000 : Rat) / 692956453614176359) [(7, 1), (11, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 696 for generator 11. -/
theorem ep_Q2_008_partial_11_0696_valid :
    mulPoly ep_Q2_008_coefficient_11_0696
        ep_Q2_008_generator_11_0600_0699 =
      ep_Q2_008_partial_11_0696 := by
  native_decide

/-- Coefficient term 697 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0697 : Poly :=
[
  term ((-1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 697 for generator 11. -/
def ep_Q2_008_partial_11_0697 : Poly :=
[
  term ((-2366596089097314813815965124265084211200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 1), (11, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-2366596089097314813815965124265084211200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (11, 1), (13, 3), (14, 2), (15, 1), (16, 1)],
  term ((1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (11, 1), (13, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 697 for generator 11. -/
theorem ep_Q2_008_partial_11_0697_valid :
    mulPoly ep_Q2_008_coefficient_11_0697
        ep_Q2_008_generator_11_0600_0699 =
      ep_Q2_008_partial_11_0697 := by
  native_decide

/-- Coefficient term 698 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0698 : Poly :=
[
  term ((-1227211265323436591265071806731460608000 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 698 for generator 11. -/
def ep_Q2_008_partial_11_0698 : Poly :=
[
  term ((-2454422530646873182530143613462921216000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2454422530646873182530143613462921216000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 1), (11, 1), (15, 3), (16, 1)],
  term ((1227211265323436591265071806731460608000 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (11, 1), (14, 2), (15, 2), (16, 1)],
  term ((1227211265323436591265071806731460608000 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (11, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 698 for generator 11. -/
theorem ep_Q2_008_partial_11_0698_valid :
    mulPoly ep_Q2_008_coefficient_11_0698
        ep_Q2_008_generator_11_0600_0699 =
      ep_Q2_008_partial_11_0698 := by
  native_decide

/-- Coefficient term 699 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0699 : Poly :=
[
  term ((3397610233499327127 : Rat) / 2771825814456705436) [(7, 1), (11, 1), (16, 1)]
]

/-- Partial product 699 for generator 11. -/
def ep_Q2_008_partial_11_0699 : Poly :=
[
  term ((3397610233499327127 : Rat) / 1385912907228352718) [(2, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((3397610233499327127 : Rat) / 1385912907228352718) [(3, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3397610233499327127 : Rat) / 2771825814456705436) [(7, 1), (11, 1), (14, 2), (16, 1)],
  term ((-3397610233499327127 : Rat) / 2771825814456705436) [(7, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 699 for generator 11. -/
theorem ep_Q2_008_partial_11_0699_valid :
    mulPoly ep_Q2_008_coefficient_11_0699
        ep_Q2_008_generator_11_0600_0699 =
      ep_Q2_008_partial_11_0699 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_008_partials_11_0600_0699 : List Poly :=
[
  ep_Q2_008_partial_11_0600,
  ep_Q2_008_partial_11_0601,
  ep_Q2_008_partial_11_0602,
  ep_Q2_008_partial_11_0603,
  ep_Q2_008_partial_11_0604,
  ep_Q2_008_partial_11_0605,
  ep_Q2_008_partial_11_0606,
  ep_Q2_008_partial_11_0607,
  ep_Q2_008_partial_11_0608,
  ep_Q2_008_partial_11_0609,
  ep_Q2_008_partial_11_0610,
  ep_Q2_008_partial_11_0611,
  ep_Q2_008_partial_11_0612,
  ep_Q2_008_partial_11_0613,
  ep_Q2_008_partial_11_0614,
  ep_Q2_008_partial_11_0615,
  ep_Q2_008_partial_11_0616,
  ep_Q2_008_partial_11_0617,
  ep_Q2_008_partial_11_0618,
  ep_Q2_008_partial_11_0619,
  ep_Q2_008_partial_11_0620,
  ep_Q2_008_partial_11_0621,
  ep_Q2_008_partial_11_0622,
  ep_Q2_008_partial_11_0623,
  ep_Q2_008_partial_11_0624,
  ep_Q2_008_partial_11_0625,
  ep_Q2_008_partial_11_0626,
  ep_Q2_008_partial_11_0627,
  ep_Q2_008_partial_11_0628,
  ep_Q2_008_partial_11_0629,
  ep_Q2_008_partial_11_0630,
  ep_Q2_008_partial_11_0631,
  ep_Q2_008_partial_11_0632,
  ep_Q2_008_partial_11_0633,
  ep_Q2_008_partial_11_0634,
  ep_Q2_008_partial_11_0635,
  ep_Q2_008_partial_11_0636,
  ep_Q2_008_partial_11_0637,
  ep_Q2_008_partial_11_0638,
  ep_Q2_008_partial_11_0639,
  ep_Q2_008_partial_11_0640,
  ep_Q2_008_partial_11_0641,
  ep_Q2_008_partial_11_0642,
  ep_Q2_008_partial_11_0643,
  ep_Q2_008_partial_11_0644,
  ep_Q2_008_partial_11_0645,
  ep_Q2_008_partial_11_0646,
  ep_Q2_008_partial_11_0647,
  ep_Q2_008_partial_11_0648,
  ep_Q2_008_partial_11_0649,
  ep_Q2_008_partial_11_0650,
  ep_Q2_008_partial_11_0651,
  ep_Q2_008_partial_11_0652,
  ep_Q2_008_partial_11_0653,
  ep_Q2_008_partial_11_0654,
  ep_Q2_008_partial_11_0655,
  ep_Q2_008_partial_11_0656,
  ep_Q2_008_partial_11_0657,
  ep_Q2_008_partial_11_0658,
  ep_Q2_008_partial_11_0659,
  ep_Q2_008_partial_11_0660,
  ep_Q2_008_partial_11_0661,
  ep_Q2_008_partial_11_0662,
  ep_Q2_008_partial_11_0663,
  ep_Q2_008_partial_11_0664,
  ep_Q2_008_partial_11_0665,
  ep_Q2_008_partial_11_0666,
  ep_Q2_008_partial_11_0667,
  ep_Q2_008_partial_11_0668,
  ep_Q2_008_partial_11_0669,
  ep_Q2_008_partial_11_0670,
  ep_Q2_008_partial_11_0671,
  ep_Q2_008_partial_11_0672,
  ep_Q2_008_partial_11_0673,
  ep_Q2_008_partial_11_0674,
  ep_Q2_008_partial_11_0675,
  ep_Q2_008_partial_11_0676,
  ep_Q2_008_partial_11_0677,
  ep_Q2_008_partial_11_0678,
  ep_Q2_008_partial_11_0679,
  ep_Q2_008_partial_11_0680,
  ep_Q2_008_partial_11_0681,
  ep_Q2_008_partial_11_0682,
  ep_Q2_008_partial_11_0683,
  ep_Q2_008_partial_11_0684,
  ep_Q2_008_partial_11_0685,
  ep_Q2_008_partial_11_0686,
  ep_Q2_008_partial_11_0687,
  ep_Q2_008_partial_11_0688,
  ep_Q2_008_partial_11_0689,
  ep_Q2_008_partial_11_0690,
  ep_Q2_008_partial_11_0691,
  ep_Q2_008_partial_11_0692,
  ep_Q2_008_partial_11_0693,
  ep_Q2_008_partial_11_0694,
  ep_Q2_008_partial_11_0695,
  ep_Q2_008_partial_11_0696,
  ep_Q2_008_partial_11_0697,
  ep_Q2_008_partial_11_0698,
  ep_Q2_008_partial_11_0699
]

/-- Sum of partial products in this block. -/
def ep_Q2_008_block_11_0600_0699 : Poly :=
[
  term ((-309012903695229421306054779381830400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-9301124142138560112 : Rat) / 692956453614176359) [(2, 1), (6, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((36592039046906006496312329122982400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((1824694926321908115 : Rat) / 692956453614176359) [(2, 1), (6, 1), (7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((36867354425312639253063464932608960000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-29081645375121975318810024039714074498400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-463519355542844131959082169072745600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((-6036148311591180177394770624790881600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-804007011760614225 : Rat) / 23895050124626771) [(2, 1), (6, 1), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-839469284107376428559230922088405949702266 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (7, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-162216359471375612713479245703479424000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 1), (13, 3), (14, 1), (15, 2), (16, 1)],
  term ((126166996346750147983136247968240611650104 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1218442200846645037506346959141427200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 2), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-86673858493002527528792779578278400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((1015368500705537531255289132617856000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((2180165713231516098114479164811020800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4467621403104365137523272183518566400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 2), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((7298779705287632460 : Rat) / 692956453614176359) [(2, 1), (6, 1), (7, 2), (13, 2), (14, 1), (16, 1)],
  term ((147469417701250557012253859730435840000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 2), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-76388237509987005467283353732083200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 2), (14, 1), (15, 2), (16, 1)],
  term ((1619646487561852949 : Rat) / 692956453614176359) [(2, 1), (6, 1), (7, 2), (14, 1), (16, 1)],
  term ((4061474002822150125021156530471424000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 3), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((37588290293952012559861671416985600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 3), (14, 1), (15, 1), (16, 1)],
  term ((43909178717827944848828878688151155631600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-70324786932212700 : Rat) / 692956453614176359) [(2, 1), (6, 1), (8, 1), (14, 1), (16, 1)],
  term ((83370814993305000 : Rat) / 692956453614176359) [(2, 1), (6, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-43870091723907405560887831547807298121200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-65144989867565479901745233906429184000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2315584888450340175 : Rat) / 1385912907228352718) [(2, 1), (6, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-247686246661537983796163737501030617600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (9, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((71794460903208267648482507744459662320900 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-13891959801170136000 : Rat) / 692956453614176359) [(2, 1), (6, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((6945979900585068000 : Rat) / 692956453614176359) [(2, 1), (6, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-4927994501413594098504202940112161764309200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-15048724891584691125 : Rat) / 1385912907228352718) [(2, 1), (6, 1), (10, 1), (14, 1), (16, 1)],
  term ((23822768568696120000 : Rat) / 692956453614176359) [(2, 1), (6, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((1972163407581095678179970936887570176000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (11, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((27122239878475664317039748399868661586700 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-21748679603870301439327689471039542745600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((8691101425391959071 : Rat) / 692956453614176359) [(2, 1), (6, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-12827105098982554413090339349265745150249600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-8677518993356820983991872122305308774400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (11, 1), (13, 3), (14, 1), (15, 2), (16, 1)],
  term ((1036063097961228958589159967207787327816371 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-8348193006718840916554126199293551129600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-28587322282435344000 : Rat) / 692956453614176359) [(2, 1), (6, 1), (11, 2), (13, 2), (14, 1), (16, 1)],
  term ((-2366596089097314813815965124265084211200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (11, 2), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-3661935281887213125 : Rat) / 692956453614176359) [(2, 1), (6, 1), (11, 2), (14, 1), (16, 1)],
  term ((-2840935691552274599409348964990276285649367 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (6, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((3435233678578325465784110552734491249023163 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (6, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-41889972037375162185 : Rat) / 2771825814456705436) [(2, 1), (6, 1), (12, 1), (14, 1), (16, 1)],
  term ((18544321300218456056194432836710405669336271 : Rat) / 674830407405318061502963313035932218791992) [(2, 1), (6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((282294956092783746240896013594526464000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-142988772261806587493585308295924614617600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-23985511571295349047 : Rat) / 2771825814456705436) [(2, 1), (6, 1), (13, 2), (14, 1), (16, 1)],
  term ((11283529883283161750143477360461247971300 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((731645701927614049 : Rat) / 2771825814456705436) [(2, 1), (6, 1), (14, 1), (16, 1)],
  term ((-43626810247303208702812078181626403269200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3355594890481528987837619349168524928000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((14542270082434402900937359393875467756400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 2), (14, 1), (15, 2), (16, 1)],
  term ((-692576845212253500 : Rat) / 692956453614176359) [(2, 1), (6, 2), (14, 1), (16, 1)],
  term ((-83370814993305000 : Rat) / 692956453614176359) [(2, 1), (7, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((65144989867565479901745233906429184000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (8, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((2503117653602907375 : Rat) / 1385912907228352718) [(2, 1), (7, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((201359834261146566004157046449609299200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (8, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((2919511882115052984 : Rat) / 692956453614176359) [(2, 1), (7, 1), (8, 1), (13, 3), (14, 1), (16, 1)],
  term ((58987767080500222804901543892174336000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 1), (8, 1), (13, 4), (14, 1), (15, 1), (16, 1)],
  term ((-14101733902665438481833198704299528700100 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((46326412400391417792006691051421318400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2919511882115052984 : Rat) / 692956453614176359) [(2, 1), (7, 1), (9, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-58987767080500222804901543892174336000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 1), (9, 1), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-93766382576283600 : Rat) / 692956453614176359) [(2, 1), (7, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((8348193006718840916554126199293551129600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((28587322282435344000 : Rat) / 692956453614176359) [(2, 1), (7, 1), (10, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((2366596089097314813815965124265084211200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 1), (10, 1), (11, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((3661935281887213125 : Rat) / 692956453614176359) [(2, 1), (7, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-18157674082962466377 : Rat) / 1385912907228352718) [(2, 1), (7, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 1), (10, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((10804857623132328000 : Rat) / 692956453614176359) [(2, 1), (7, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1065930958607668765160920770854008454400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (10, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1225362027883269627 : Rat) / 23895050124626771) [(2, 1), (7, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-22860739721496737138535904821189592809303 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (10, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 1), (10, 1), (13, 3), (14, 1), (15, 2), (16, 1)],
  term ((-2189633911586289738 : Rat) / 692956453614176359) [(2, 1), (7, 1), (10, 1), (13, 3), (14, 1), (16, 1)],
  term ((-44240825310375167103676157919130752000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 1), (10, 1), (13, 4), (14, 1), (15, 1), (16, 1)],
  term ((-3683087647914606546580134175353400510578621 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((13891959801170136000 : Rat) / 692956453614176359) [(2, 1), (7, 1), (10, 2), (13, 1), (14, 1), (16, 1)],
  term ((2371586655122907659950465820102818934102103 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1585104196949939070394589442496577932800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 1), (11, 1), (12, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-16868580943370606262 : Rat) / 692956453614176359) [(2, 1), (7, 1), (11, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-1533489900754501375440300591590925388800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 1), (11, 1), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((2463383904854034835748019202064994297600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((11988162028943441235 : Rat) / 692956453614176359) [(2, 1), (7, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-398119416958750399561300533870774931200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 1), (11, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-9894046412742829623 : Rat) / 1385912907228352718) [(2, 1), (7, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((-2327990081558998958870780768206899810009600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 1), (11, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-28587322282435344000 : Rat) / 692956453614176359) [(2, 1), (7, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-2366596089097314813815965124265084211200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (7, 1), (11, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-2454422530646873182530143613462921216000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (7, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((3397610233499327127 : Rat) / 1385912907228352718) [(2, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-9301124142138560112 : Rat) / 692956453614176359) [(3, 1), (6, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-309012903695229421306054779381830400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (11, 1), (15, 3), (16, 1)],
  term ((1824694926321908115 : Rat) / 692956453614176359) [(3, 1), (6, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((36592039046906006496312329122982400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((36867354425312639253063464932608960000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-29081645375121975318810024039714074498400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((-463519355542844131959082169072745600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (12, 1), (15, 4), (16, 1)],
  term ((-804007011760614225 : Rat) / 23895050124626771) [(3, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-6036148311591180177394770624790881600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (13, 1), (15, 3), (16, 1)],
  term ((-839469284107376428559230922088405949702266 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((-162216359471375612713479245703479424000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (13, 3), (15, 3), (16, 1)],
  term ((126166996346750147983136247968240611650104 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (7, 1), (15, 2), (16, 1)],
  term ((-1218442200846645037506346959141427200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 2), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-86673858493002527528792779578278400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 2), (11, 1), (15, 2), (16, 1)],
  term ((1015368500705537531255289132617856000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 2), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((2180165713231516098114479164811020800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 2), (13, 1), (15, 2), (16, 1)],
  term ((7298779705287632460 : Rat) / 692956453614176359) [(3, 1), (6, 1), (7, 2), (13, 2), (15, 1), (16, 1)],
  term ((-4467621403104365137523272183518566400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 2), (13, 2), (15, 3), (16, 1)],
  term ((147469417701250557012253859730435840000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 2), (13, 3), (15, 2), (16, 1)],
  term ((1619646487561852949 : Rat) / 692956453614176359) [(3, 1), (6, 1), (7, 2), (15, 1), (16, 1)],
  term ((-76388237509987005467283353732083200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 2), (15, 3), (16, 1)],
  term ((4061474002822150125021156530471424000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 3), (13, 2), (15, 2), (16, 1)],
  term ((37588290293952012559861671416985600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 3), (15, 2), (16, 1)],
  term ((43909178717827944848828878688151155631600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((-70324786932212700 : Rat) / 692956453614176359) [(3, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((83370814993305000 : Rat) / 692956453614176359) [(3, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-43870091723907405560887831547807298121200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-2315584888450340175 : Rat) / 1385912907228352718) [(3, 1), (6, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-65144989867565479901745233906429184000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((-247686246661537983796163737501030617600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (9, 1), (13, 2), (15, 2), (16, 1)],
  term ((71794460903208267648482507744459662320900 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (9, 1), (15, 2), (16, 1)],
  term ((-13891959801170136000 : Rat) / 692956453614176359) [(3, 1), (6, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((6945979900585068000 : Rat) / 692956453614176359) [(3, 1), (6, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-4927994501413594098504202940112161764309200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-15048724891584691125 : Rat) / 1385912907228352718) [(3, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((23822768568696120000 : Rat) / 692956453614176359) [(3, 1), (6, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1972163407581095678179970936887570176000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (11, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((27122239878475664317039748399868661586700 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((8691101425391959071 : Rat) / 692956453614176359) [(3, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-21748679603870301439327689471039542745600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-12827105098982554413090339349265745150249600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-8677518993356820983991872122305308774400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (11, 1), (13, 3), (15, 3), (16, 1)],
  term ((1036063097961228958589159967207787327816371 : Rat) / 168707601851329515375740828258983054697998) [(3, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((-8348193006718840916554126199293551129600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((-28587322282435344000 : Rat) / 692956453614176359) [(3, 1), (6, 1), (11, 2), (13, 2), (15, 1), (16, 1)],
  term ((-2366596089097314813815965124265084211200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (11, 2), (13, 3), (15, 2), (16, 1)],
  term ((-3661935281887213125 : Rat) / 692956453614176359) [(3, 1), (6, 1), (11, 2), (15, 1), (16, 1)],
  term ((-2840935691552274599409348964990276285649367 : Rat) / 168707601851329515375740828258983054697998) [(3, 1), (6, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-41889972037375162185 : Rat) / 2771825814456705436) [(3, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((3435233678578325465784110552734491249023163 : Rat) / 337415203702659030751481656517966109395996) [(3, 1), (6, 1), (12, 1), (15, 3), (16, 1)],
  term ((18544321300218456056194432836710405669336271 : Rat) / 674830407405318061502963313035932218791992) [(3, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((282294956092783746240896013594526464000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (13, 1), (15, 4), (16, 1)],
  term ((-23985511571295349047 : Rat) / 2771825814456705436) [(3, 1), (6, 1), (13, 2), (15, 1), (16, 1)],
  term ((-142988772261806587493585308295924614617600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (13, 2), (15, 3), (16, 1)],
  term ((731645701927614049 : Rat) / 2771825814456705436) [(3, 1), (6, 1), (15, 1), (16, 1)],
  term ((11283529883283161750143477360461247971300 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (15, 3), (16, 1)],
  term ((-43626810247303208702812078181626403269200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 2), (11, 1), (15, 2), (16, 1)],
  term ((-3355594890481528987837619349168524928000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 2), (13, 1), (15, 2), (16, 1)],
  term ((-692576845212253500 : Rat) / 692956453614176359) [(3, 1), (6, 2), (15, 1), (16, 1)],
  term ((14542270082434402900937359393875467756400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 2), (15, 3), (16, 1)],
  term ((-83370814993305000 : Rat) / 692956453614176359) [(3, 1), (7, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((2503117653602907375 : Rat) / 1385912907228352718) [(3, 1), (7, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((65144989867565479901745233906429184000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 1), (8, 1), (13, 1), (15, 3), (16, 1)],
  term ((201359834261146566004157046449609299200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 1), (8, 1), (13, 2), (15, 2), (16, 1)],
  term ((2919511882115052984 : Rat) / 692956453614176359) [(3, 1), (7, 1), (8, 1), (13, 3), (15, 1), (16, 1)],
  term ((58987767080500222804901543892174336000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (8, 1), (13, 4), (15, 2), (16, 1)],
  term ((-14101733902665438481833198704299528700100 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 1), (8, 1), (15, 2), (16, 1)],
  term ((46326412400391417792006691051421318400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 1), (9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2919511882115052984 : Rat) / 692956453614176359) [(3, 1), (7, 1), (9, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-58987767080500222804901543892174336000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (9, 1), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((-93766382576283600 : Rat) / 692956453614176359) [(3, 1), (7, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((8348193006718840916554126199293551129600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 1), (10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((28587322282435344000 : Rat) / 692956453614176359) [(3, 1), (7, 1), (10, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((2366596089097314813815965124265084211200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (10, 1), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((3661935281887213125 : Rat) / 692956453614176359) [(3, 1), (7, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-18157674082962466377 : Rat) / 1385912907228352718) [(3, 1), (7, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (10, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((10804857623132328000 : Rat) / 692956453614176359) [(3, 1), (7, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-1225362027883269627 : Rat) / 23895050124626771) [(3, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((1065930958607668765160920770854008454400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 1), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((-22860739721496737138535904821189592809303 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((-2189633911586289738 : Rat) / 692956453614176359) [(3, 1), (7, 1), (10, 1), (13, 3), (15, 1), (16, 1)],
  term ((-7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (10, 1), (13, 3), (15, 3), (16, 1)],
  term ((-44240825310375167103676157919130752000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (10, 1), (13, 4), (15, 2), (16, 1)],
  term ((-3683087647914606546580134175353400510578621 : Rat) / 168707601851329515375740828258983054697998) [(3, 1), (7, 1), (10, 1), (15, 2), (16, 1)],
  term ((13891959801170136000 : Rat) / 692956453614176359) [(3, 1), (7, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((2371586655122907659950465820102818934102103 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-16868580943370606262 : Rat) / 692956453614176359) [(3, 1), (7, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((1585104196949939070394589442496577932800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (11, 1), (12, 1), (13, 2), (15, 3), (16, 1)],
  term ((-1533489900754501375440300591590925388800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (11, 1), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((11988162028943441235 : Rat) / 692956453614176359) [(3, 1), (7, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((2463383904854034835748019202064994297600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 1), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((-398119416958750399561300533870774931200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (11, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-9894046412742829623 : Rat) / 1385912907228352718) [(3, 1), (7, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-2327990081558998958870780768206899810009600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-28587322282435344000 : Rat) / 692956453614176359) [(3, 1), (7, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (11, 1), (13, 2), (15, 3), (16, 1)],
  term ((-2366596089097314813815965124265084211200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((3397610233499327127 : Rat) / 1385912907228352718) [(3, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-2454422530646873182530143613462921216000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 1), (11, 1), (15, 3), (16, 1)],
  term ((154506451847614710653027389690915200 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (11, 1), (14, 2), (15, 2), (16, 1)],
  term ((4650562071069280056 : Rat) / 692956453614176359) [(6, 1), (7, 1), (11, 1), (14, 2), (16, 1)],
  term ((4650562071069280056 : Rat) / 692956453614176359) [(6, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((154506451847614710653027389690915200 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (11, 1), (15, 4), (16, 1)],
  term ((-18296019523453003248156164561491200 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (12, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-1824694926321908115 : Rat) / 1385912907228352718) [(6, 1), (7, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-1824694926321908115 : Rat) / 1385912907228352718) [(6, 1), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-18296019523453003248156164561491200 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (12, 1), (13, 1), (15, 4), (16, 1)],
  term ((-18433677212656319626531732466304480000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (12, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((-18433677212656319626531732466304480000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (12, 1), (13, 2), (15, 3), (16, 1)],
  term ((14540822687560987659405012019857037249200 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (7, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((231759677771422065979541084536372800 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (12, 1), (14, 2), (15, 3), (16, 1)],
  term ((14540822687560987659405012019857037249200 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (7, 1), (12, 1), (15, 3), (16, 1)],
  term ((231759677771422065979541084536372800 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (12, 1), (15, 5), (16, 1)],
  term ((3018074155795590088697385312395440800 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((804007011760614225 : Rat) / 47790100249253542) [(6, 1), (7, 1), (13, 1), (14, 2), (16, 1)],
  term ((804007011760614225 : Rat) / 47790100249253542) [(6, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((3018074155795590088697385312395440800 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (13, 1), (15, 4), (16, 1)],
  term ((419734642053688214279615461044202974851133 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (7, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((419734642053688214279615461044202974851133 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (7, 1), (13, 2), (15, 3), (16, 1)],
  term ((81108179735687806356739622851739712000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (13, 3), (14, 2), (15, 2), (16, 1)],
  term ((81108179735687806356739622851739712000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (13, 3), (15, 4), (16, 1)],
  term ((-63083498173375073991568123984120305825052 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-63083498173375073991568123984120305825052 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (7, 1), (15, 3), (16, 1)],
  term ((609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (11, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (11, 1), (13, 2), (15, 3), (16, 1)],
  term ((43336929246501263764396389789139200 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((43336929246501263764396389789139200 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (11, 1), (15, 3), (16, 1)],
  term ((-507684250352768765627644566308928000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-507684250352768765627644566308928000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-1090082856615758049057239582405510400 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1090082856615758049057239582405510400 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (13, 1), (15, 3), (16, 1)],
  term ((2233810701552182568761636091759283200 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (13, 2), (14, 2), (15, 2), (16, 1)],
  term ((-3649389852643816230 : Rat) / 692956453614176359) [(6, 1), (7, 2), (13, 2), (14, 2), (16, 1)],
  term ((-3649389852643816230 : Rat) / 692956453614176359) [(6, 1), (7, 2), (13, 2), (15, 2), (16, 1)],
  term ((2233810701552182568761636091759283200 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (13, 2), (15, 4), (16, 1)],
  term ((-73734708850625278506126929865217920000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (13, 3), (14, 2), (15, 1), (16, 1)],
  term ((-73734708850625278506126929865217920000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (13, 3), (15, 3), (16, 1)],
  term ((38194118754993502733641676866041600 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (14, 2), (15, 2), (16, 1)],
  term ((-1619646487561852949 : Rat) / 1385912907228352718) [(6, 1), (7, 2), (14, 2), (16, 1)],
  term ((-1619646487561852949 : Rat) / 1385912907228352718) [(6, 1), (7, 2), (15, 2), (16, 1)],
  term ((38194118754993502733641676866041600 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (15, 4), (16, 1)],
  term ((-2030737001411075062510578265235712000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 3), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((-2030737001411075062510578265235712000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 3), (13, 2), (15, 3), (16, 1)],
  term ((-18794145146976006279930835708492800 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 3), (14, 2), (15, 1), (16, 1)],
  term ((-18794145146976006279930835708492800 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 3), (15, 3), (16, 1)],
  term ((-21954589358913972424414439344075577815800 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (8, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-21954589358913972424414439344075577815800 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (8, 1), (13, 1), (15, 3), (16, 1)],
  term ((35162393466106350 : Rat) / 692956453614176359) [(6, 1), (8, 1), (14, 2), (16, 1)],
  term ((35162393466106350 : Rat) / 692956453614176359) [(6, 1), (8, 1), (15, 2), (16, 1)],
  term ((-41685407496652500 : Rat) / 692956453614176359) [(6, 1), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((-41685407496652500 : Rat) / 692956453614176359) [(6, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((21935045861953702780443915773903649060600 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((21935045861953702780443915773903649060600 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (9, 1), (12, 1), (15, 3), (16, 1)],
  term ((32572494933782739950872616953214592000 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (9, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((2315584888450340175 : Rat) / 2771825814456705436) [(6, 1), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((2315584888450340175 : Rat) / 2771825814456705436) [(6, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((32572494933782739950872616953214592000 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (9, 1), (13, 1), (15, 4), (16, 1)],
  term ((123843123330768991898081868750515308800 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (9, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((123843123330768991898081868750515308800 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (9, 1), (13, 2), (15, 3), (16, 1)],
  term ((-35897230451604133824241253872229831160450 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-35897230451604133824241253872229831160450 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (9, 1), (15, 3), (16, 1)],
  term ((6945979900585068000 : Rat) / 692956453614176359) [(6, 1), (10, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((6945979900585068000 : Rat) / 692956453614176359) [(6, 1), (10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-3472989950292534000 : Rat) / 692956453614176359) [(6, 1), (10, 1), (12, 1), (14, 2), (16, 1)],
  term ((-3472989950292534000 : Rat) / 692956453614176359) [(6, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((2463997250706797049252101470056080882154600 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (10, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((2463997250706797049252101470056080882154600 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((15048724891584691125 : Rat) / 2771825814456705436) [(6, 1), (10, 1), (14, 2), (16, 1)],
  term ((15048724891584691125 : Rat) / 2771825814456705436) [(6, 1), (10, 1), (15, 2), (16, 1)],
  term ((-11911384284348060000 : Rat) / 692956453614176359) [(6, 1), (11, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-11911384284348060000 : Rat) / 692956453614176359) [(6, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-986081703790547839089985468443785088000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (11, 1), (12, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((-986081703790547839089985468443785088000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (11, 1), (12, 1), (13, 2), (15, 3), (16, 1)],
  term ((-13561119939237832158519874199934330793350 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-13561119939237832158519874199934330793350 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((10874339801935150719663844735519771372800 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-8691101425391959071 : Rat) / 1385912907228352718) [(6, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-8691101425391959071 : Rat) / 1385912907228352718) [(6, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((10874339801935150719663844735519771372800 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 1), (13, 1), (15, 4), (16, 1)],
  term ((6413552549491277206545169674632872575124800 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((6413552549491277206545169674632872575124800 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 1), (13, 2), (15, 3), (16, 1)],
  term ((4338759496678410491995936061152654387200 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (11, 1), (13, 3), (14, 2), (15, 2), (16, 1)],
  term ((4338759496678410491995936061152654387200 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (11, 1), (13, 3), (15, 4), (16, 1)],
  term ((-1036063097961228958589159967207787327816371 : Rat) / 337415203702659030751481656517966109395996) [(6, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1036063097961228958589159967207787327816371 : Rat) / 337415203702659030751481656517966109395996) [(6, 1), (11, 1), (15, 3), (16, 1)],
  term ((4174096503359420458277063099646775564800 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((4174096503359420458277063099646775564800 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 2), (13, 1), (15, 3), (16, 1)],
  term ((14293661141217672000 : Rat) / 692956453614176359) [(6, 1), (11, 2), (13, 2), (14, 2), (16, 1)],
  term ((14293661141217672000 : Rat) / 692956453614176359) [(6, 1), (11, 2), (13, 2), (15, 2), (16, 1)],
  term ((1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (11, 2), (13, 3), (14, 2), (15, 1), (16, 1)],
  term ((1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (11, 2), (13, 3), (15, 3), (16, 1)],
  term ((3661935281887213125 : Rat) / 1385912907228352718) [(6, 1), (11, 2), (14, 2), (16, 1)],
  term ((3661935281887213125 : Rat) / 1385912907228352718) [(6, 1), (11, 2), (15, 2), (16, 1)],
  term ((2840935691552274599409348964990276285649367 : Rat) / 337415203702659030751481656517966109395996) [(6, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((2840935691552274599409348964990276285649367 : Rat) / 337415203702659030751481656517966109395996) [(6, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-3435233678578325465784110552734491249023163 : Rat) / 674830407405318061502963313035932218791992) [(6, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((41889972037375162185 : Rat) / 5543651628913410872) [(6, 1), (12, 1), (14, 2), (16, 1)],
  term ((41889972037375162185 : Rat) / 5543651628913410872) [(6, 1), (12, 1), (15, 2), (16, 1)],
  term ((-3435233678578325465784110552734491249023163 : Rat) / 674830407405318061502963313035932218791992) [(6, 1), (12, 1), (15, 4), (16, 1)],
  term ((-18544321300218456056194432836710405669336271 : Rat) / 1349660814810636123005926626071864437583984) [(6, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-141147478046391873120448006797263232000 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (13, 1), (14, 2), (15, 3), (16, 1)],
  term ((-18544321300218456056194432836710405669336271 : Rat) / 1349660814810636123005926626071864437583984) [(6, 1), (13, 1), (15, 3), (16, 1)],
  term ((-141147478046391873120448006797263232000 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (13, 1), (15, 5), (16, 1)],
  term ((71494386130903293746792654147962307308800 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (13, 2), (14, 2), (15, 2), (16, 1)],
  term ((23985511571295349047 : Rat) / 5543651628913410872) [(6, 1), (13, 2), (14, 2), (16, 1)],
  term ((23985511571295349047 : Rat) / 5543651628913410872) [(6, 1), (13, 2), (15, 2), (16, 1)],
  term ((71494386130903293746792654147962307308800 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (13, 2), (15, 4), (16, 1)],
  term ((-5641764941641580875071738680230623985650 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (14, 2), (15, 2), (16, 1)],
  term ((-731645701927614049 : Rat) / 5543651628913410872) [(6, 1), (14, 2), (16, 1)],
  term ((-731645701927614049 : Rat) / 5543651628913410872) [(6, 1), (15, 2), (16, 1)],
  term ((-5641764941641580875071738680230623985650 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (15, 4), (16, 1)],
  term ((21813405123651604351406039090813201634600 : Rat) / 84353800925664757687870414129491527348999) [(6, 2), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((21813405123651604351406039090813201634600 : Rat) / 84353800925664757687870414129491527348999) [(6, 2), (11, 1), (15, 3), (16, 1)],
  term ((1677797445240764493918809674584262464000 : Rat) / 84353800925664757687870414129491527348999) [(6, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((1677797445240764493918809674584262464000 : Rat) / 84353800925664757687870414129491527348999) [(6, 2), (13, 1), (15, 3), (16, 1)],
  term ((-7271135041217201450468679696937733878200 : Rat) / 84353800925664757687870414129491527348999) [(6, 2), (14, 2), (15, 2), (16, 1)],
  term ((346288422606126750 : Rat) / 692956453614176359) [(6, 2), (14, 2), (16, 1)],
  term ((346288422606126750 : Rat) / 692956453614176359) [(6, 2), (15, 2), (16, 1)],
  term ((-7271135041217201450468679696937733878200 : Rat) / 84353800925664757687870414129491527348999) [(6, 2), (15, 4), (16, 1)],
  term ((41685407496652500 : Rat) / 692956453614176359) [(7, 1), (8, 1), (11, 1), (14, 2), (16, 1)],
  term ((41685407496652500 : Rat) / 692956453614176359) [(7, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((-32572494933782739950872616953214592000 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (8, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-2503117653602907375 : Rat) / 2771825814456705436) [(7, 1), (8, 1), (13, 1), (14, 2), (16, 1)],
  term ((-2503117653602907375 : Rat) / 2771825814456705436) [(7, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((-32572494933782739950872616953214592000 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (8, 1), (13, 1), (15, 4), (16, 1)],
  term ((-100679917130573283002078523224804649600 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (8, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((-100679917130573283002078523224804649600 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (8, 1), (13, 2), (15, 3), (16, 1)],
  term ((-1459755941057526492 : Rat) / 692956453614176359) [(7, 1), (8, 1), (13, 3), (14, 2), (16, 1)],
  term ((-1459755941057526492 : Rat) / 692956453614176359) [(7, 1), (8, 1), (13, 3), (15, 2), (16, 1)],
  term ((-29493883540250111402450771946087168000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (8, 1), (13, 4), (14, 2), (15, 1), (16, 1)],
  term ((-29493883540250111402450771946087168000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (8, 1), (13, 4), (15, 3), (16, 1)],
  term ((7050866951332719240916599352149764350050 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((7050866951332719240916599352149764350050 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (8, 1), (15, 3), (16, 1)],
  term ((-23163206200195708896003345525710659200 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (9, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-23163206200195708896003345525710659200 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (9, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((1459755941057526492 : Rat) / 692956453614176359) [(7, 1), (9, 1), (12, 1), (13, 2), (14, 2), (16, 1)],
  term ((1459755941057526492 : Rat) / 692956453614176359) [(7, 1), (9, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((29493883540250111402450771946087168000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (9, 1), (12, 1), (13, 3), (14, 2), (15, 1), (16, 1)],
  term ((29493883540250111402450771946087168000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (9, 1), (12, 1), (13, 3), (15, 3), (16, 1)],
  term ((46883191288141800 : Rat) / 692956453614176359) [(7, 1), (9, 1), (12, 1), (14, 2), (16, 1)],
  term ((46883191288141800 : Rat) / 692956453614176359) [(7, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-4174096503359420458277063099646775564800 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (10, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-4174096503359420458277063099646775564800 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (10, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-14293661141217672000 : Rat) / 692956453614176359) [(7, 1), (10, 1), (11, 1), (13, 2), (14, 2), (16, 1)],
  term ((-14293661141217672000 : Rat) / 692956453614176359) [(7, 1), (10, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (10, 1), (11, 1), (13, 3), (14, 2), (15, 1), (16, 1)],
  term ((-1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (10, 1), (11, 1), (13, 3), (15, 3), (16, 1)],
  term ((-3661935281887213125 : Rat) / 1385912907228352718) [(7, 1), (10, 1), (11, 1), (14, 2), (16, 1)],
  term ((-3661935281887213125 : Rat) / 1385912907228352718) [(7, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((18157674082962466377 : Rat) / 2771825814456705436) [(7, 1), (10, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((18157674082962466377 : Rat) / 2771825814456705436) [(7, 1), (10, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1843367721265631962653173246630448000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (10, 1), (12, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((-1843367721265631962653173246630448000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (10, 1), (12, 1), (13, 2), (15, 3), (16, 1)],
  term ((-5402428811566164000 : Rat) / 692956453614176359) [(7, 1), (10, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-5402428811566164000 : Rat) / 692956453614176359) [(7, 1), (10, 1), (12, 1), (15, 3), (16, 1)],
  term ((-532965479303834382580460385427004227200 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (10, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((1225362027883269627 : Rat) / 47790100249253542) [(7, 1), (10, 1), (13, 1), (14, 2), (16, 1)],
  term ((1225362027883269627 : Rat) / 47790100249253542) [(7, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-532965479303834382580460385427004227200 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (10, 1), (13, 1), (15, 4), (16, 1)],
  term ((22860739721496737138535904821189592809303 : Rat) / 168707601851329515375740828258983054697998) [(7, 1), (10, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((22860739721496737138535904821189592809303 : Rat) / 168707601851329515375740828258983054697998) [(7, 1), (10, 1), (13, 2), (15, 3), (16, 1)],
  term ((3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (10, 1), (13, 3), (14, 2), (15, 2), (16, 1)],
  term ((1094816955793144869 : Rat) / 692956453614176359) [(7, 1), (10, 1), (13, 3), (14, 2), (16, 1)],
  term ((1094816955793144869 : Rat) / 692956453614176359) [(7, 1), (10, 1), (13, 3), (15, 2), (16, 1)],
  term ((3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (10, 1), (13, 3), (15, 4), (16, 1)],
  term ((22120412655187583551838078959565376000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (10, 1), (13, 4), (14, 2), (15, 1), (16, 1)],
  term ((22120412655187583551838078959565376000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (10, 1), (13, 4), (15, 3), (16, 1)],
  term ((3683087647914606546580134175353400510578621 : Rat) / 337415203702659030751481656517966109395996) [(7, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((3683087647914606546580134175353400510578621 : Rat) / 337415203702659030751481656517966109395996) [(7, 1), (10, 1), (15, 3), (16, 1)],
  term ((-6945979900585068000 : Rat) / 692956453614176359) [(7, 1), (10, 2), (13, 1), (14, 2), (16, 1)],
  term ((-6945979900585068000 : Rat) / 692956453614176359) [(7, 1), (10, 2), (13, 1), (15, 2), (16, 1)],
  term ((-2371586655122907659950465820102818934102103 : Rat) / 168707601851329515375740828258983054697998) [(7, 1), (11, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-2371586655122907659950465820102818934102103 : Rat) / 168707601851329515375740828258983054697998) [(7, 1), (11, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-792552098474969535197294721248288966400 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (11, 1), (12, 1), (13, 2), (14, 2), (15, 2), (16, 1)],
  term ((8434290471685303131 : Rat) / 692956453614176359) [(7, 1), (11, 1), (12, 1), (13, 2), (14, 2), (16, 1)],
  term ((8434290471685303131 : Rat) / 692956453614176359) [(7, 1), (11, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-792552098474969535197294721248288966400 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (11, 1), (12, 1), (13, 2), (15, 4), (16, 1)],
  term ((766744950377250687720150295795462694400 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (11, 1), (12, 1), (13, 3), (14, 2), (15, 1), (16, 1)],
  term ((766744950377250687720150295795462694400 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (11, 1), (12, 1), (13, 3), (15, 3), (16, 1)],
  term ((-1231691952427017417874009601032497148800 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (11, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((-11988162028943441235 : Rat) / 1385912907228352718) [(7, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((-11988162028943441235 : Rat) / 1385912907228352718) [(7, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-1231691952427017417874009601032497148800 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (11, 1), (12, 1), (15, 4), (16, 1)],
  term ((199059708479375199780650266935387465600 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (11, 1), (12, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((199059708479375199780650266935387465600 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (11, 1), (12, 2), (13, 1), (15, 3), (16, 1)],
  term ((9894046412742829623 : Rat) / 2771825814456705436) [(7, 1), (11, 1), (12, 2), (14, 2), (16, 1)],
  term ((9894046412742829623 : Rat) / 2771825814456705436) [(7, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((1163995040779499479435390384103449905004800 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((1163995040779499479435390384103449905004800 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (11, 1), (13, 2), (14, 2), (15, 2), (16, 1)],
  term ((14293661141217672000 : Rat) / 692956453614176359) [(7, 1), (11, 1), (13, 2), (14, 2), (16, 1)],
  term ((14293661141217672000 : Rat) / 692956453614176359) [(7, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (11, 1), (13, 2), (15, 4), (16, 1)],
  term ((1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (11, 1), (13, 3), (14, 2), (15, 1), (16, 1)],
  term ((1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (11, 1), (13, 3), (15, 3), (16, 1)],
  term ((1227211265323436591265071806731460608000 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (11, 1), (14, 2), (15, 2), (16, 1)],
  term ((-3397610233499327127 : Rat) / 2771825814456705436) [(7, 1), (11, 1), (14, 2), (16, 1)],
  term ((-3397610233499327127 : Rat) / 2771825814456705436) [(7, 1), (11, 1), (15, 2), (16, 1)],
  term ((1227211265323436591265071806731460608000 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (11, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 11, terms 600 through 699. -/
theorem ep_Q2_008_block_11_0600_0699_valid :
    checkProductSumEq ep_Q2_008_partials_11_0600_0699
      ep_Q2_008_block_11_0600_0699 = true := by
  native_decide

end EpQ2008TermShards

end Patterns

end EndpointCertificate

end Problem97
