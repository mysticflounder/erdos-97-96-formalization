/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_008, term block 9:500-599

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_008`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2008TermShards

/-- Generator polynomial 9 for endpoint certificate `ep_Q2_008`. -/
def ep_Q2_008_generator_09_0500_0599 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(2, 1)]
]

/-- Coefficient term 500 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0500 : Poly :=
[
  term ((18433677212656319626531732466304480000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 2), (7, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 500 for generator 9. -/
def ep_Q2_008_partial_09_0500 : Poly :=
[
  term ((36867354425312639253063464932608960000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (6, 2), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((-18433677212656319626531732466304480000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 2), (7, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 500 for generator 9. -/
theorem ep_Q2_008_partial_09_0500_valid :
    mulPoly ep_Q2_008_coefficient_09_0500
        ep_Q2_008_generator_09_0500_0599 =
      ep_Q2_008_partial_09_0500 := by
  native_decide

/-- Coefficient term 501 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0501 : Poly :=
[
  term ((1619646487561852949 : Rat) / 5543651628913410872) [(3, 1), (6, 2), (7, 1), (16, 1)]
]

/-- Partial product 501 for generator 9. -/
def ep_Q2_008_partial_09_0501 : Poly :=
[
  term ((1619646487561852949 : Rat) / 2771825814456705436) [(2, 1), (3, 1), (6, 2), (7, 1), (16, 1)],
  term ((-1619646487561852949 : Rat) / 5543651628913410872) [(3, 1), (6, 2), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 501 for generator 9. -/
theorem ep_Q2_008_partial_09_0501_valid :
    mulPoly ep_Q2_008_coefficient_09_0501
        ep_Q2_008_generator_09_0500_0599 =
      ep_Q2_008_partial_09_0501 := by
  native_decide

/-- Coefficient term 502 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0502 : Poly :=
[
  term ((507684250352768765627644566308928000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 2), (7, 2), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 502 for generator 9. -/
def ep_Q2_008_partial_09_0502 : Poly :=
[
  term ((1015368500705537531255289132617856000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (6, 2), (7, 2), (13, 2), (15, 1), (16, 1)],
  term ((-507684250352768765627644566308928000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 2), (7, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 502 for generator 9. -/
theorem ep_Q2_008_partial_09_0502_valid :
    mulPoly ep_Q2_008_coefficient_09_0502
        ep_Q2_008_generator_09_0500_0599 =
      ep_Q2_008_partial_09_0502 := by
  native_decide

/-- Coefficient term 503 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0503 : Poly :=
[
  term ((4698536286744001569982708927123200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 2), (7, 2), (15, 1), (16, 1)]
]

/-- Partial product 503 for generator 9. -/
def ep_Q2_008_partial_09_0503 : Poly :=
[
  term ((9397072573488003139965417854246400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (6, 2), (7, 2), (15, 1), (16, 1)],
  term ((-4698536286744001569982708927123200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 2), (7, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 503 for generator 9. -/
theorem ep_Q2_008_partial_09_0503_valid :
    mulPoly ep_Q2_008_coefficient_09_0503
        ep_Q2_008_generator_09_0500_0599 =
      ep_Q2_008_partial_09_0503 := by
  native_decide

/-- Coefficient term 504 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0504 : Poly :=
[
  term ((4244765494801986000 : Rat) / 692956453614176359) [(3, 1), (6, 2), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 504 for generator 9. -/
def ep_Q2_008_partial_09_0504 : Poly :=
[
  term ((8489530989603972000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (6, 2), (10, 1), (13, 1), (16, 1)],
  term ((-4244765494801986000 : Rat) / 692956453614176359) [(3, 1), (6, 2), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 504 for generator 9. -/
theorem ep_Q2_008_partial_09_0504_valid :
    mulPoly ep_Q2_008_coefficient_09_0504
        ep_Q2_008_generator_09_0500_0599 =
      ep_Q2_008_partial_09_0504 := by
  native_decide

/-- Coefficient term 505 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0505 : Poly :=
[
  term ((2048889463757928946897022333839678358400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 2), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 505 for generator 9. -/
def ep_Q2_008_partial_09_0505 : Poly :=
[
  term ((4097778927515857893794044667679356716800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (6, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2048889463757928946897022333839678358400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 2), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 505 for generator 9. -/
theorem ep_Q2_008_partial_09_0505_valid :
    mulPoly ep_Q2_008_coefficient_09_0505
        ep_Q2_008_generator_09_0500_0599 =
      ep_Q2_008_partial_09_0505 := by
  native_decide

/-- Coefficient term 506 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0506 : Poly :=
[
  term ((11911384284348060000 : Rat) / 692956453614176359) [(3, 1), (6, 2), (11, 1), (13, 2), (16, 1)]
]

/-- Partial product 506 for generator 9. -/
def ep_Q2_008_partial_09_0506 : Poly :=
[
  term ((23822768568696120000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (6, 2), (11, 1), (13, 2), (16, 1)],
  term ((-11911384284348060000 : Rat) / 692956453614176359) [(3, 1), (6, 2), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 506 for generator 9. -/
theorem ep_Q2_008_partial_09_0506_valid :
    mulPoly ep_Q2_008_coefficient_09_0506
        ep_Q2_008_generator_09_0500_0599 =
      ep_Q2_008_partial_09_0506 := by
  native_decide

/-- Coefficient term 507 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0507 : Poly :=
[
  term ((986081703790547839089985468443785088000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 2), (11, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 507 for generator 9. -/
def ep_Q2_008_partial_09_0507 : Poly :=
[
  term ((1972163407581095678179970936887570176000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (6, 2), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((-986081703790547839089985468443785088000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 2), (11, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 507 for generator 9. -/
theorem ep_Q2_008_partial_09_0507_valid :
    mulPoly ep_Q2_008_coefficient_09_0507
        ep_Q2_008_generator_09_0500_0599 =
      ep_Q2_008_partial_09_0507 := by
  native_decide

/-- Coefficient term 508 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0508 : Poly :=
[
  term ((-25891905370046625 : Rat) / 2771825814456705436) [(3, 1), (6, 2), (11, 1), (16, 1)]
]

/-- Partial product 508 for generator 9. -/
def ep_Q2_008_partial_09_0508 : Poly :=
[
  term ((-25891905370046625 : Rat) / 1385912907228352718) [(2, 1), (3, 1), (6, 2), (11, 1), (16, 1)],
  term ((25891905370046625 : Rat) / 2771825814456705436) [(3, 1), (6, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 508 for generator 9. -/
theorem ep_Q2_008_partial_09_0508_valid :
    mulPoly ep_Q2_008_coefficient_09_0508
        ep_Q2_008_generator_09_0500_0599 =
      ep_Q2_008_partial_09_0508 := by
  native_decide

/-- Coefficient term 509 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0509 : Poly :=
[
  term ((-7271135041217201450468679696937733878200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 2), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 509 for generator 9. -/
def ep_Q2_008_partial_09_0509 : Poly :=
[
  term ((-14542270082434402900937359393875467756400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (6, 2), (12, 1), (15, 1), (16, 1)],
  term ((7271135041217201450468679696937733878200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 509 for generator 9. -/
theorem ep_Q2_008_partial_09_0509_valid :
    mulPoly ep_Q2_008_coefficient_09_0509
        ep_Q2_008_generator_09_0500_0599 =
      ep_Q2_008_partial_09_0509 := by
  native_decide

/-- Coefficient term 510 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0510 : Poly :=
[
  term ((-21856447400000286033 : Rat) / 5543651628913410872) [(3, 1), (6, 2), (13, 1), (16, 1)]
]

/-- Partial product 510 for generator 9. -/
def ep_Q2_008_partial_09_0510 : Poly :=
[
  term ((-21856447400000286033 : Rat) / 2771825814456705436) [(2, 1), (3, 1), (6, 2), (13, 1), (16, 1)],
  term ((21856447400000286033 : Rat) / 5543651628913410872) [(3, 1), (6, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 510 for generator 9. -/
theorem ep_Q2_008_partial_09_0510_valid :
    mulPoly ep_Q2_008_coefficient_09_0510
        ep_Q2_008_generator_09_0500_0599 =
      ep_Q2_008_partial_09_0510 := by
  native_decide

/-- Coefficient term 511 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0511 : Poly :=
[
  term ((17339557632193536845345168869606444588800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 2), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 511 for generator 9. -/
def ep_Q2_008_partial_09_0511 : Poly :=
[
  term ((34679115264387073690690337739212889177600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (6, 2), (13, 2), (15, 1), (16, 1)],
  term ((-17339557632193536845345168869606444588800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 511 for generator 9. -/
theorem ep_Q2_008_partial_09_0511_valid :
    mulPoly ep_Q2_008_coefficient_09_0511
        ep_Q2_008_generator_09_0500_0599 =
      ep_Q2_008_partial_09_0511 := by
  native_decide

/-- Coefficient term 512 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0512 : Poly :=
[
  term ((4444213374628048323053593352475263798400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 2), (15, 1), (16, 1)]
]

/-- Partial product 512 for generator 9. -/
def ep_Q2_008_partial_09_0512 : Poly :=
[
  term ((8888426749256096646107186704950527596800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (6, 2), (15, 1), (16, 1)],
  term ((-4444213374628048323053593352475263798400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 512 for generator 9. -/
theorem ep_Q2_008_partial_09_0512_valid :
    mulPoly ep_Q2_008_coefficient_09_0512
        ep_Q2_008_generator_09_0500_0599 =
      ep_Q2_008_partial_09_0512 := by
  native_decide

/-- Coefficient term 513 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0513 : Poly :=
[
  term ((4244765494801986000 : Rat) / 692956453614176359) [(3, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 513 for generator 9. -/
def ep_Q2_008_partial_09_0513 : Poly :=
[
  term ((8489530989603972000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4244765494801986000 : Rat) / 692956453614176359) [(3, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 513 for generator 9. -/
theorem ep_Q2_008_partial_09_0513_valid :
    mulPoly ep_Q2_008_coefficient_09_0513
        ep_Q2_008_generator_09_0500_0599 =
      ep_Q2_008_partial_09_0513 := by
  native_decide

/-- Coefficient term 514 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0514 : Poly :=
[
  term ((-385887772254726000 : Rat) / 692956453614176359) [(3, 1), (7, 1), (10, 1), (16, 1)]
]

/-- Partial product 514 for generator 9. -/
def ep_Q2_008_partial_09_0514 : Poly :=
[
  term ((-771775544509452000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (7, 1), (10, 1), (16, 1)],
  term ((385887772254726000 : Rat) / 692956453614176359) [(3, 1), (7, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 514 for generator 9. -/
theorem ep_Q2_008_partial_09_0514_valid :
    mulPoly ep_Q2_008_coefficient_09_0514
        ep_Q2_008_generator_09_0500_0599 =
      ep_Q2_008_partial_09_0514 := by
  native_decide

/-- Coefficient term 515 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0515 : Poly :=
[
  term ((2048889463757928946897022333839678358400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 515 for generator 9. -/
def ep_Q2_008_partial_09_0515 : Poly :=
[
  term ((4097778927515857893794044667679356716800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (7, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2048889463757928946897022333839678358400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 515 for generator 9. -/
theorem ep_Q2_008_partial_09_0515_valid :
    mulPoly ep_Q2_008_coefficient_09_0515
        ep_Q2_008_generator_09_0500_0599 =
      ep_Q2_008_partial_09_0515 := by
  native_decide

/-- Coefficient term 516 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0516 : Poly :=
[
  term ((11911384284348060000 : Rat) / 692956453614176359) [(3, 1), (7, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 516 for generator 9. -/
def ep_Q2_008_partial_09_0516 : Poly :=
[
  term ((23822768568696120000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (7, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-11911384284348060000 : Rat) / 692956453614176359) [(3, 1), (7, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 516 for generator 9. -/
theorem ep_Q2_008_partial_09_0516_valid :
    mulPoly ep_Q2_008_coefficient_09_0516
        ep_Q2_008_generator_09_0500_0599 =
      ep_Q2_008_partial_09_0516 := by
  native_decide

/-- Coefficient term 517 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0517 : Poly :=
[
  term ((986081703790547839089985468443785088000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (11, 1), (13, 3), (15, 2), (16, 1)]
]

/-- Partial product 517 for generator 9. -/
def ep_Q2_008_partial_09_0517 : Poly :=
[
  term ((1972163407581095678179970936887570176000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 1), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((-986081703790547839089985468443785088000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (11, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 517 for generator 9. -/
theorem ep_Q2_008_partial_09_0517_valid :
    mulPoly ep_Q2_008_coefficient_09_0517
        ep_Q2_008_generator_09_0500_0599 =
      ep_Q2_008_partial_09_0517 := by
  native_decide

/-- Coefficient term 518 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0518 : Poly :=
[
  term ((-25891905370046625 : Rat) / 2771825814456705436) [(3, 1), (7, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 518 for generator 9. -/
def ep_Q2_008_partial_09_0518 : Poly :=
[
  term ((-25891905370046625 : Rat) / 1385912907228352718) [(2, 1), (3, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((25891905370046625 : Rat) / 2771825814456705436) [(3, 1), (7, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 518 for generator 9. -/
theorem ep_Q2_008_partial_09_0518_valid :
    mulPoly ep_Q2_008_coefficient_09_0518
        ep_Q2_008_generator_09_0500_0599 =
      ep_Q2_008_partial_09_0518 := by
  native_decide

/-- Coefficient term 519 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0519 : Poly :=
[
  term ((1194686432794194975127264134361730400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 519 for generator 9. -/
def ep_Q2_008_partial_09_0519 : Poly :=
[
  term ((2389372865588389950254528268723460800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1194686432794194975127264134361730400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 519 for generator 9. -/
theorem ep_Q2_008_partial_09_0519_valid :
    mulPoly ep_Q2_008_coefficient_09_0519
        ep_Q2_008_generator_09_0500_0599 =
      ep_Q2_008_partial_09_0519 := by
  native_decide

/-- Coefficient term 520 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0520 : Poly :=
[
  term ((4744206808436961099 : Rat) / 2771825814456705436) [(3, 1), (7, 1), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 520 for generator 9. -/
def ep_Q2_008_partial_09_0520 : Poly :=
[
  term ((4744206808436961099 : Rat) / 1385912907228352718) [(2, 1), (3, 1), (7, 1), (12, 1), (13, 2), (16, 1)],
  term ((-4744206808436961099 : Rat) / 2771825814456705436) [(3, 1), (7, 1), (12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 520 for generator 9. -/
theorem ep_Q2_008_partial_09_0520_valid :
    mulPoly ep_Q2_008_coefficient_09_0520
        ep_Q2_008_generator_09_0500_0599 =
      ep_Q2_008_partial_09_0520 := by
  native_decide

/-- Coefficient term 521 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0521 : Poly :=
[
  term ((23963780376453215514491252206195824000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (12, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 521 for generator 9. -/
def ep_Q2_008_partial_09_0521 : Poly :=
[
  term ((47927560752906431028982504412391648000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-23963780376453215514491252206195824000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (12, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 521 for generator 9. -/
theorem ep_Q2_008_partial_09_0521_valid :
    mulPoly ep_Q2_008_coefficient_09_0521
        ep_Q2_008_generator_09_0500_0599 =
      ep_Q2_008_partial_09_0521 := by
  native_decide

/-- Coefficient term 522 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0522 : Poly :=
[
  term ((-73897609392371990308409997997075200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 522 for generator 9. -/
def ep_Q2_008_partial_09_0522 : Poly :=
[
  term ((-147795218784743980616819995994150400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((73897609392371990308409997997075200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 522 for generator 9. -/
theorem ep_Q2_008_partial_09_0522_valid :
    mulPoly ep_Q2_008_coefficient_09_0522
        ep_Q2_008_generator_09_0500_0599 =
      ep_Q2_008_partial_09_0522 := by
  native_decide

/-- Coefficient term 523 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0523 : Poly :=
[
  term ((-6986928998826554805 : Rat) / 11087303257826821744) [(3, 1), (7, 1), (12, 1), (16, 1)]
]

/-- Partial product 523 for generator 9. -/
def ep_Q2_008_partial_09_0523 : Poly :=
[
  term ((-6986928998826554805 : Rat) / 5543651628913410872) [(2, 1), (3, 1), (7, 1), (12, 1), (16, 1)],
  term ((6986928998826554805 : Rat) / 11087303257826821744) [(3, 1), (7, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 523 for generator 9. -/
theorem ep_Q2_008_partial_09_0523_valid :
    mulPoly ep_Q2_008_coefficient_09_0523
        ep_Q2_008_generator_09_0500_0599 =
      ep_Q2_008_partial_09_0523 := by
  native_decide

/-- Coefficient term 524 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0524 : Poly :=
[
  term ((-2656508851257165795057296759919627610014513 : Rat) / 674830407405318061502963313035932218791992) [(3, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 524 for generator 9. -/
def ep_Q2_008_partial_09_0524 : Poly :=
[
  term ((-2656508851257165795057296759919627610014513 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (3, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((2656508851257165795057296759919627610014513 : Rat) / 674830407405318061502963313035932218791992) [(3, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 524 for generator 9. -/
theorem ep_Q2_008_partial_09_0524_valid :
    mulPoly ep_Q2_008_coefficient_09_0524
        ep_Q2_008_generator_09_0500_0599 =
      ep_Q2_008_partial_09_0524 := by
  native_decide

/-- Coefficient term 525 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0525 : Poly :=
[
  term ((240398342864050722161218940013652800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 525 for generator 9. -/
def ep_Q2_008_partial_09_0525 : Poly :=
[
  term ((480796685728101444322437880027305600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 1), (13, 1), (15, 3), (16, 1)],
  term ((-240398342864050722161218940013652800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 525 for generator 9. -/
theorem ep_Q2_008_partial_09_0525_valid :
    mulPoly ep_Q2_008_coefficient_09_0525
        ep_Q2_008_generator_09_0500_0599 =
      ep_Q2_008_partial_09_0525 := by
  native_decide

/-- Coefficient term 526 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0526 : Poly :=
[
  term ((-187441555900800119543040434348876488500915 : Rat) / 168707601851329515375740828258983054697998) [(3, 1), (7, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 526 for generator 9. -/
def ep_Q2_008_partial_09_0526 : Poly :=
[
  term ((-187441555900800119543040434348876488500915 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((187441555900800119543040434348876488500915 : Rat) / 168707601851329515375740828258983054697998) [(3, 1), (7, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 526 for generator 9. -/
theorem ep_Q2_008_partial_09_0526_valid :
    mulPoly ep_Q2_008_coefficient_09_0526
        ep_Q2_008_generator_09_0500_0599 =
      ep_Q2_008_partial_09_0526 := by
  native_decide

/-- Coefficient term 527 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0527 : Poly :=
[
  term ((3284450867379434607 : Rat) / 5543651628913410872) [(3, 1), (7, 1), (13, 2), (16, 1)]
]

/-- Partial product 527 for generator 9. -/
def ep_Q2_008_partial_09_0527 : Poly :=
[
  term ((3284450867379434607 : Rat) / 2771825814456705436) [(2, 1), (3, 1), (7, 1), (13, 2), (16, 1)],
  term ((-3284450867379434607 : Rat) / 5543651628913410872) [(3, 1), (7, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 527 for generator 9. -/
theorem ep_Q2_008_partial_09_0527_valid :
    mulPoly ep_Q2_008_coefficient_09_0527
        ep_Q2_008_generator_09_0500_0599 =
      ep_Q2_008_partial_09_0527 := by
  native_decide

/-- Coefficient term 528 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0528 : Poly :=
[
  term ((8295154745695343831939279609837016000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 528 for generator 9. -/
def ep_Q2_008_partial_09_0528 : Poly :=
[
  term ((16590309491390687663878559219674032000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((-8295154745695343831939279609837016000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 528 for generator 9. -/
theorem ep_Q2_008_partial_09_0528_valid :
    mulPoly ep_Q2_008_coefficient_09_0528
        ep_Q2_008_generator_09_0500_0599 =
      ep_Q2_008_partial_09_0528 := by
  native_decide

/-- Coefficient term 529 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0529 : Poly :=
[
  term ((-18433677212656319626531732466304480000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (13, 3), (15, 3), (16, 1)]
]

/-- Partial product 529 for generator 9. -/
def ep_Q2_008_partial_09_0529 : Poly :=
[
  term ((-36867354425312639253063464932608960000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 1), (13, 3), (15, 3), (16, 1)],
  term ((18433677212656319626531732466304480000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (13, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 529 for generator 9. -/
theorem ep_Q2_008_partial_09_0529_valid :
    mulPoly ep_Q2_008_coefficient_09_0529
        ep_Q2_008_generator_09_0500_0599 =
      ep_Q2_008_partial_09_0529 := by
  native_decide

/-- Coefficient term 530 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0530 : Poly :=
[
  term ((-248334132367369355942904185647582392182587 : Rat) / 674830407405318061502963313035932218791992) [(3, 1), (7, 1), (15, 2), (16, 1)]
]

/-- Partial product 530 for generator 9. -/
def ep_Q2_008_partial_09_0530 : Poly :=
[
  term ((-248334132367369355942904185647582392182587 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (3, 1), (7, 1), (15, 2), (16, 1)],
  term ((248334132367369355942904185647582392182587 : Rat) / 674830407405318061502963313035932218791992) [(3, 1), (7, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 530 for generator 9. -/
theorem ep_Q2_008_partial_09_0530_valid :
    mulPoly ep_Q2_008_coefficient_09_0530
        ep_Q2_008_generator_09_0500_0599 =
      ep_Q2_008_partial_09_0530 := by
  native_decide

/-- Coefficient term 531 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0531 : Poly :=
[
  term ((-25502223610551969251 : Rat) / 22174606515653643488) [(3, 1), (7, 1), (16, 1)]
]

/-- Partial product 531 for generator 9. -/
def ep_Q2_008_partial_09_0531 : Poly :=
[
  term ((-25502223610551969251 : Rat) / 11087303257826821744) [(2, 1), (3, 1), (7, 1), (16, 1)],
  term ((25502223610551969251 : Rat) / 22174606515653643488) [(3, 1), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 531 for generator 9. -/
theorem ep_Q2_008_partial_09_0531_valid :
    mulPoly ep_Q2_008_coefficient_09_0531
        ep_Q2_008_generator_09_0500_0599 =
      ep_Q2_008_partial_09_0531 := by
  native_decide

/-- Coefficient term 532 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0532 : Poly :=
[
  term ((659989525458599395315937936201606400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 532 for generator 9. -/
def ep_Q2_008_partial_09_0532 : Poly :=
[
  term ((1319979050917198790631875872403212800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 2), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-659989525458599395315937936201606400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (12, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 532 for generator 9. -/
theorem ep_Q2_008_partial_09_0532_valid :
    mulPoly ep_Q2_008_coefficient_09_0532
        ep_Q2_008_generator_09_0500_0599 =
      ep_Q2_008_partial_09_0532 := by
  native_decide

/-- Coefficient term 533 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0533 : Poly :=
[
  term ((16747791234124750581829483969459200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 533 for generator 9. -/
def ep_Q2_008_partial_09_0533 : Poly :=
[
  term ((33495582468249501163658967938918400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 2), (12, 1), (15, 1), (16, 1)],
  term ((-16747791234124750581829483969459200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 533 for generator 9. -/
theorem ep_Q2_008_partial_09_0533_valid :
    mulPoly ep_Q2_008_coefficient_09_0533
        ep_Q2_008_generator_09_0500_0599 =
      ep_Q2_008_partial_09_0533 := by
  native_decide

/-- Coefficient term 534 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0534 : Poly :=
[
  term ((374057564224493265389838808863163200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 534 for generator 9. -/
def ep_Q2_008_partial_09_0534 : Poly :=
[
  term ((748115128448986530779677617726326400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 2), (13, 1), (15, 2), (16, 1)],
  term ((-374057564224493265389838808863163200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 534 for generator 9. -/
theorem ep_Q2_008_partial_09_0534_valid :
    mulPoly ep_Q2_008_coefficient_09_0534
        ep_Q2_008_generator_09_0500_0599 =
      ep_Q2_008_partial_09_0534 := by
  native_decide

/-- Coefficient term 535 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0535 : Poly :=
[
  term ((222133921724121400498513653611270040699315 : Rat) / 168707601851329515375740828258983054697998) [(3, 1), (7, 2), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 535 for generator 9. -/
def ep_Q2_008_partial_09_0535 : Poly :=
[
  term ((222133921724121400498513653611270040699315 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (7, 2), (13, 2), (15, 1), (16, 1)],
  term ((-222133921724121400498513653611270040699315 : Rat) / 168707601851329515375740828258983054697998) [(3, 1), (7, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 535 for generator 9. -/
theorem ep_Q2_008_partial_09_0535_valid :
    mulPoly ep_Q2_008_coefficient_09_0535
        ep_Q2_008_generator_09_0500_0599 =
      ep_Q2_008_partial_09_0535 := by
  native_decide

/-- Coefficient term 536 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0536 : Poly :=
[
  term ((-507684250352768765627644566308928000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (13, 2), (15, 3), (16, 1)]
]

/-- Partial product 536 for generator 9. -/
def ep_Q2_008_partial_09_0536 : Poly :=
[
  term ((-1015368500705537531255289132617856000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 2), (13, 2), (15, 3), (16, 1)],
  term ((507684250352768765627644566308928000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 536 for generator 9. -/
theorem ep_Q2_008_partial_09_0536_valid :
    mulPoly ep_Q2_008_coefficient_09_0536
        ep_Q2_008_generator_09_0500_0599 =
      ep_Q2_008_partial_09_0536 := by
  native_decide

/-- Coefficient term 537 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0537 : Poly :=
[
  term ((18433677212656319626531732466304480000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (13, 3), (15, 2), (16, 1)]
]

/-- Partial product 537 for generator 9. -/
def ep_Q2_008_partial_09_0537 : Poly :=
[
  term ((36867354425312639253063464932608960000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 2), (13, 3), (15, 2), (16, 1)],
  term ((-18433677212656319626531732466304480000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 537 for generator 9. -/
theorem ep_Q2_008_partial_09_0537_valid :
    mulPoly ep_Q2_008_coefficient_09_0537
        ep_Q2_008_generator_09_0500_0599 =
      ep_Q2_008_partial_09_0537 := by
  native_decide

/-- Coefficient term 538 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0538 : Poly :=
[
  term ((197106059535537187787589436346638752422389 : Rat) / 674830407405318061502963313035932218791992) [(3, 1), (7, 2), (15, 1), (16, 1)]
]

/-- Partial product 538 for generator 9. -/
def ep_Q2_008_partial_09_0538 : Poly :=
[
  term ((197106059535537187787589436346638752422389 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (3, 1), (7, 2), (15, 1), (16, 1)],
  term ((-197106059535537187787589436346638752422389 : Rat) / 674830407405318061502963313035932218791992) [(3, 1), (7, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 538 for generator 9. -/
theorem ep_Q2_008_partial_09_0538_valid :
    mulPoly ep_Q2_008_coefficient_09_0538
        ep_Q2_008_generator_09_0500_0599 =
      ep_Q2_008_partial_09_0538 := by
  native_decide

/-- Coefficient term 539 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0539 : Poly :=
[
  term ((12224272058348290617605443283174400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (15, 3), (16, 1)]
]

/-- Partial product 539 for generator 9. -/
def ep_Q2_008_partial_09_0539 : Poly :=
[
  term ((24448544116696581235210886566348800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 2), (15, 3), (16, 1)],
  term ((-12224272058348290617605443283174400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 539 for generator 9. -/
theorem ep_Q2_008_partial_09_0539_valid :
    mulPoly ep_Q2_008_coefficient_09_0539
        ep_Q2_008_generator_09_0500_0599 =
      ep_Q2_008_partial_09_0539 := by
  native_decide

/-- Coefficient term 540 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0540 : Poly :=
[
  term ((507684250352768765627644566308928000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 3), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 540 for generator 9. -/
def ep_Q2_008_partial_09_0540 : Poly :=
[
  term ((1015368500705537531255289132617856000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 3), (13, 2), (15, 2), (16, 1)],
  term ((-507684250352768765627644566308928000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 3), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 540 for generator 9. -/
theorem ep_Q2_008_partial_09_0540_valid :
    mulPoly ep_Q2_008_coefficient_09_0540
        ep_Q2_008_generator_09_0500_0599 =
      ep_Q2_008_partial_09_0540 := by
  native_decide

/-- Coefficient term 541 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0541 : Poly :=
[
  term ((4698536286744001569982708927123200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 3), (15, 2), (16, 1)]
]

/-- Partial product 541 for generator 9. -/
def ep_Q2_008_partial_09_0541 : Poly :=
[
  term ((9397072573488003139965417854246400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 3), (15, 2), (16, 1)],
  term ((-4698536286744001569982708927123200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 541 for generator 9. -/
theorem ep_Q2_008_partial_09_0541_valid :
    mulPoly ep_Q2_008_coefficient_09_0541
        ep_Q2_008_generator_09_0500_0599 =
      ep_Q2_008_partial_09_0541 := by
  native_decide

/-- Coefficient term 542 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0542 : Poly :=
[
  term ((234997830172389375 : Rat) / 1385912907228352718) [(3, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 542 for generator 9. -/
def ep_Q2_008_partial_09_0542 : Poly :=
[
  term ((234997830172389375 : Rat) / 692956453614176359) [(2, 1), (3, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-234997830172389375 : Rat) / 1385912907228352718) [(3, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 542 for generator 9. -/
theorem ep_Q2_008_partial_09_0542_valid :
    mulPoly ep_Q2_008_coefficient_09_0542
        ep_Q2_008_generator_09_0500_0599 =
      ep_Q2_008_partial_09_0542 := by
  native_decide

/-- Coefficient term 543 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0543 : Poly :=
[
  term ((-234997830172389375 : Rat) / 2771825814456705436) [(3, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 543 for generator 9. -/
def ep_Q2_008_partial_09_0543 : Poly :=
[
  term ((-234997830172389375 : Rat) / 1385912907228352718) [(2, 1), (3, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((234997830172389375 : Rat) / 2771825814456705436) [(3, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 543 for generator 9. -/
theorem ep_Q2_008_partial_09_0543_valid :
    mulPoly ep_Q2_008_coefficient_09_0543
        ep_Q2_008_generator_09_0500_0599 =
      ep_Q2_008_partial_09_0543 := by
  native_decide

/-- Coefficient term 544 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0544 : Poly :=
[
  term ((18783866913972227341922186296255629165150 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 544 for generator 9. -/
def ep_Q2_008_partial_09_0544 : Poly :=
[
  term ((37567733827944454683844372592511258330300 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-18783866913972227341922186296255629165150 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 544 for generator 9. -/
theorem ep_Q2_008_partial_09_0544_valid :
    mulPoly ep_Q2_008_coefficient_09_0544
        ep_Q2_008_generator_09_0500_0599 =
      ep_Q2_008_partial_09_0544 := by
  native_decide

/-- Coefficient term 545 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0545 : Poly :=
[
  term ((-2190114330398394847115191303193762257575 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 545 for generator 9. -/
def ep_Q2_008_partial_09_0545 : Poly :=
[
  term ((-4380228660796789694230382606387524515150 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (9, 1), (15, 2), (16, 1)],
  term ((2190114330398394847115191303193762257575 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 545 for generator 9. -/
theorem ep_Q2_008_partial_09_0545_valid :
    mulPoly ep_Q2_008_coefficient_09_0545
        ep_Q2_008_generator_09_0500_0599 =
      ep_Q2_008_partial_09_0545 := by
  native_decide

/-- Coefficient term 546 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0546 : Poly :=
[
  term ((35162393466106350 : Rat) / 692956453614176359) [(3, 1), (9, 1), (16, 1)]
]

/-- Partial product 546 for generator 9. -/
def ep_Q2_008_partial_09_0546 : Poly :=
[
  term ((70324786932212700 : Rat) / 692956453614176359) [(2, 1), (3, 1), (9, 1), (16, 1)],
  term ((-35162393466106350 : Rat) / 692956453614176359) [(3, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 546 for generator 9. -/
theorem ep_Q2_008_partial_09_0546_valid :
    mulPoly ep_Q2_008_coefficient_09_0546
        ep_Q2_008_generator_09_0500_0599 =
      ep_Q2_008_partial_09_0546 := by
  native_decide

/-- Coefficient term 547 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0547 : Poly :=
[
  term ((5209484925438801000 : Rat) / 692956453614176359) [(3, 1), (10, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 547 for generator 9. -/
def ep_Q2_008_partial_09_0547 : Poly :=
[
  term ((10418969850877602000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-5209484925438801000 : Rat) / 692956453614176359) [(3, 1), (10, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 547 for generator 9. -/
theorem ep_Q2_008_partial_09_0547_valid :
    mulPoly ep_Q2_008_coefficient_09_0547
        ep_Q2_008_generator_09_0500_0599 =
      ep_Q2_008_partial_09_0547 := by
  native_decide

/-- Coefficient term 548 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0548 : Poly :=
[
  term ((-516886249659507438578461707029312106546000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (10, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 548 for generator 9. -/
def ep_Q2_008_partial_09_0548 : Poly :=
[
  term ((-1033772499319014877156923414058624213092000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((516886249659507438578461707029312106546000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (10, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 548 for generator 9. -/
theorem ep_Q2_008_partial_09_0548_valid :
    mulPoly ep_Q2_008_coefficient_09_0548
        ep_Q2_008_generator_09_0500_0599 =
      ep_Q2_008_partial_09_0548 := by
  native_decide

/-- Coefficient term 549 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0549 : Poly :=
[
  term ((4248773279509728375 : Rat) / 1385912907228352718) [(3, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 549 for generator 9. -/
def ep_Q2_008_partial_09_0549 : Poly :=
[
  term ((4248773279509728375 : Rat) / 692956453614176359) [(2, 1), (3, 1), (10, 1), (13, 1), (16, 1)],
  term ((-4248773279509728375 : Rat) / 1385912907228352718) [(3, 1), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 549 for generator 9. -/
theorem ep_Q2_008_partial_09_0549_valid :
    mulPoly ep_Q2_008_coefficient_09_0549
        ep_Q2_008_generator_09_0500_0599 =
      ep_Q2_008_partial_09_0549 := by
  native_decide

/-- Coefficient term 550 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0550 : Poly :=
[
  term ((-152110198152488799902596983625690099200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 550 for generator 9. -/
def ep_Q2_008_partial_09_0550 : Poly :=
[
  term ((-304220396304977599805193967251380198400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((152110198152488799902596983625690099200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 550 for generator 9. -/
theorem ep_Q2_008_partial_09_0550_valid :
    mulPoly ep_Q2_008_coefficient_09_0550
        ep_Q2_008_generator_09_0500_0599 =
      ep_Q2_008_partial_09_0550 := by
  native_decide

/-- Coefficient term 551 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0551 : Poly :=
[
  term ((-48928739749345806293192297634312031613925 : Rat) / 337415203702659030751481656517966109395996) [(3, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 551 for generator 9. -/
def ep_Q2_008_partial_09_0551 : Poly :=
[
  term ((-48928739749345806293192297634312031613925 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((48928739749345806293192297634312031613925 : Rat) / 337415203702659030751481656517966109395996) [(3, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 551 for generator 9. -/
theorem ep_Q2_008_partial_09_0551_valid :
    mulPoly ep_Q2_008_coefficient_09_0551
        ep_Q2_008_generator_09_0500_0599 =
      ep_Q2_008_partial_09_0551 := by
  native_decide

/-- Coefficient term 552 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0552 : Poly :=
[
  term ((3470680212511249962912909743196069067200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 552 for generator 9. -/
def ep_Q2_008_partial_09_0552 : Poly :=
[
  term ((6941360425022499925825819486392138134400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3470680212511249962912909743196069067200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 552 for generator 9. -/
theorem ep_Q2_008_partial_09_0552_valid :
    mulPoly ep_Q2_008_coefficient_09_0552
        ep_Q2_008_generator_09_0500_0599 =
      ep_Q2_008_partial_09_0552 := by
  native_decide

/-- Coefficient term 553 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0553 : Poly :=
[
  term ((15484799569652478000 : Rat) / 692956453614176359) [(3, 1), (11, 1), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 553 for generator 9. -/
def ep_Q2_008_partial_09_0553 : Poly :=
[
  term ((30969599139304956000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((-15484799569652478000 : Rat) / 692956453614176359) [(3, 1), (11, 1), (12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 553 for generator 9. -/
theorem ep_Q2_008_partial_09_0553_valid :
    mulPoly ep_Q2_008_coefficient_09_0553
        ep_Q2_008_generator_09_0500_0599 =
      ep_Q2_008_partial_09_0553 := by
  native_decide

/-- Coefficient term 554 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0554 : Poly :=
[
  term ((1281906214927712190816981108976920614400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 554 for generator 9. -/
def ep_Q2_008_partial_09_0554 : Poly :=
[
  term ((2563812429855424381633962217953841228800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-1281906214927712190816981108976920614400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 554 for generator 9. -/
theorem ep_Q2_008_partial_09_0554_valid :
    mulPoly ep_Q2_008_coefficient_09_0554
        ep_Q2_008_generator_09_0500_0599 =
      ep_Q2_008_partial_09_0554 := by
  native_decide

/-- Coefficient term 555 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0555 : Poly :=
[
  term ((-207456214280770125 : Rat) / 5543651628913410872) [(3, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 555 for generator 9. -/
def ep_Q2_008_partial_09_0555 : Poly :=
[
  term ((-207456214280770125 : Rat) / 2771825814456705436) [(2, 1), (3, 1), (11, 1), (12, 1), (16, 1)],
  term ((207456214280770125 : Rat) / 5543651628913410872) [(3, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 555 for generator 9. -/
theorem ep_Q2_008_partial_09_0555_valid :
    mulPoly ep_Q2_008_coefficient_09_0555
        ep_Q2_008_generator_09_0500_0599 =
      ep_Q2_008_partial_09_0555 := by
  native_decide

/-- Coefficient term 556 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0556 : Poly :=
[
  term ((54773866962779332619491473654133517007900 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 556 for generator 9. -/
def ep_Q2_008_partial_09_0556 : Poly :=
[
  term ((109547733925558665238982947308267034015800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-54773866962779332619491473654133517007900 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 556 for generator 9. -/
theorem ep_Q2_008_partial_09_0556_valid :
    mulPoly ep_Q2_008_coefficient_09_0556
        ep_Q2_008_generator_09_0500_0599 =
      ep_Q2_008_partial_09_0556 := by
  native_decide

/-- Coefficient term 557 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0557 : Poly :=
[
  term ((-1125535270449700214065002946551132816000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (11, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 557 for generator 9. -/
def ep_Q2_008_partial_09_0557 : Poly :=
[
  term ((-2251070540899400428130005893102265632000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((1125535270449700214065002946551132816000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (11, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 557 for generator 9. -/
theorem ep_Q2_008_partial_09_0557_valid :
    mulPoly ep_Q2_008_coefficient_09_0557
        ep_Q2_008_generator_09_0500_0599 =
      ep_Q2_008_partial_09_0557 := by
  native_decide

/-- Coefficient term 558 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0558 : Poly :=
[
  term ((-11911384284348060000 : Rat) / 692956453614176359) [(3, 1), (11, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 558 for generator 9. -/
def ep_Q2_008_partial_09_0558 : Poly :=
[
  term ((-23822768568696120000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((11911384284348060000 : Rat) / 692956453614176359) [(3, 1), (11, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 558 for generator 9. -/
theorem ep_Q2_008_partial_09_0558_valid :
    mulPoly ep_Q2_008_coefficient_09_0558
        ep_Q2_008_generator_09_0500_0599 =
      ep_Q2_008_partial_09_0558 := by
  native_decide

/-- Coefficient term 559 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0559 : Poly :=
[
  term ((5360122927956627000 : Rat) / 692956453614176359) [(3, 1), (11, 1), (13, 2), (16, 1)]
]

/-- Partial product 559 for generator 9. -/
def ep_Q2_008_partial_09_0559 : Poly :=
[
  term ((10720245855913254000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (11, 1), (13, 2), (16, 1)],
  term ((-5360122927956627000 : Rat) / 692956453614176359) [(3, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 559 for generator 9. -/
theorem ep_Q2_008_partial_09_0559_valid :
    mulPoly ep_Q2_008_coefficient_09_0559
        ep_Q2_008_generator_09_0500_0599 =
      ep_Q2_008_partial_09_0559 := by
  native_decide

/-- Coefficient term 560 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0560 : Poly :=
[
  term ((443736766705746527590493460799703289600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 560 for generator 9. -/
def ep_Q2_008_partial_09_0560 : Poly :=
[
  term ((887473533411493055180986921599406579200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((-443736766705746527590493460799703289600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 560 for generator 9. -/
theorem ep_Q2_008_partial_09_0560_valid :
    mulPoly ep_Q2_008_coefficient_09_0560
        ep_Q2_008_generator_09_0500_0599 =
      ep_Q2_008_partial_09_0560 := by
  native_decide

/-- Coefficient term 561 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0561 : Poly :=
[
  term ((-986081703790547839089985468443785088000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 1), (13, 3), (15, 3), (16, 1)]
]

/-- Partial product 561 for generator 9. -/
def ep_Q2_008_partial_09_0561 : Poly :=
[
  term ((-1972163407581095678179970936887570176000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (11, 1), (13, 3), (15, 3), (16, 1)],
  term ((986081703790547839089985468443785088000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 1), (13, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 561 for generator 9. -/
theorem ep_Q2_008_partial_09_0561_valid :
    mulPoly ep_Q2_008_coefficient_09_0561
        ep_Q2_008_generator_09_0500_0599 =
      ep_Q2_008_partial_09_0561 := by
  native_decide

/-- Coefficient term 562 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0562 : Poly :=
[
  term ((91619064408362469212274743712140367523875 : Rat) / 337415203702659030751481656517966109395996) [(3, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 562 for generator 9. -/
def ep_Q2_008_partial_09_0562 : Poly :=
[
  term ((91619064408362469212274743712140367523875 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (3, 1), (11, 1), (15, 2), (16, 1)],
  term ((-91619064408362469212274743712140367523875 : Rat) / 337415203702659030751481656517966109395996) [(3, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 562 for generator 9. -/
theorem ep_Q2_008_partial_09_0562_valid :
    mulPoly ep_Q2_008_coefficient_09_0562
        ep_Q2_008_generator_09_0500_0599 =
      ep_Q2_008_partial_09_0562 := by
  native_decide

/-- Coefficient term 563 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0563 : Poly :=
[
  term ((-19274969785069125 : Rat) / 47790100249253542) [(3, 1), (11, 1), (16, 1)]
]

/-- Partial product 563 for generator 9. -/
def ep_Q2_008_partial_09_0563 : Poly :=
[
  term ((-19274969785069125 : Rat) / 23895050124626771) [(2, 1), (3, 1), (11, 1), (16, 1)],
  term ((19274969785069125 : Rat) / 47790100249253542) [(3, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 563 for generator 9. -/
theorem ep_Q2_008_partial_09_0563_valid :
    mulPoly ep_Q2_008_coefficient_09_0563
        ep_Q2_008_generator_09_0500_0599 =
      ep_Q2_008_partial_09_0563 := by
  native_decide

/-- Coefficient term 564 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0564 : Poly :=
[
  term ((-978512622391504340611460826079722019200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 564 for generator 9. -/
def ep_Q2_008_partial_09_0564 : Poly :=
[
  term ((-1957025244783008681222921652159444038400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((978512622391504340611460826079722019200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 564 for generator 9. -/
theorem ep_Q2_008_partial_09_0564_valid :
    mulPoly ep_Q2_008_coefficient_09_0564
        ep_Q2_008_generator_09_0500_0599 =
      ep_Q2_008_partial_09_0564 := by
  native_decide

/-- Coefficient term 565 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0565 : Poly :=
[
  term ((-48748672533921967185 : Rat) / 11087303257826821744) [(3, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 565 for generator 9. -/
def ep_Q2_008_partial_09_0565 : Poly :=
[
  term ((-48748672533921967185 : Rat) / 5543651628913410872) [(2, 1), (3, 1), (12, 1), (13, 1), (16, 1)],
  term ((48748672533921967185 : Rat) / 11087303257826821744) [(3, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 565 for generator 9. -/
theorem ep_Q2_008_partial_09_0565_valid :
    mulPoly ep_Q2_008_coefficient_09_0565
        ep_Q2_008_generator_09_0500_0599 =
      ep_Q2_008_partial_09_0565 := by
  native_decide

/-- Coefficient term 566 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0566 : Poly :=
[
  term ((23914036289954135533654768182232711968000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 566 for generator 9. -/
def ep_Q2_008_partial_09_0566 : Poly :=
[
  term ((47828072579908271067309536364465423936000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-23914036289954135533654768182232711968000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 566 for generator 9. -/
theorem ep_Q2_008_partial_09_0566_valid :
    mulPoly ep_Q2_008_coefficient_09_0566
        ep_Q2_008_generator_09_0500_0599 =
      ep_Q2_008_partial_09_0566 := by
  native_decide

/-- Coefficient term 567 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0567 : Poly :=
[
  term ((-149433281527214073286875932217810742260075 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 567 for generator 9. -/
def ep_Q2_008_partial_09_0567 : Poly :=
[
  term ((-298866563054428146573751864435621484520150 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((149433281527214073286875932217810742260075 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 567 for generator 9. -/
theorem ep_Q2_008_partial_09_0567_valid :
    mulPoly ep_Q2_008_coefficient_09_0567
        ep_Q2_008_generator_09_0500_0599 =
      ep_Q2_008_partial_09_0567 := by
  native_decide

/-- Coefficient term 568 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0568 : Poly :=
[
  term ((2497965466424768865463160654519426351550513 : Rat) / 674830407405318061502963313035932218791992) [(3, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 568 for generator 9. -/
def ep_Q2_008_partial_09_0568 : Poly :=
[
  term ((2497965466424768865463160654519426351550513 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (3, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2497965466424768865463160654519426351550513 : Rat) / 674830407405318061502963313035932218791992) [(3, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 568 for generator 9. -/
theorem ep_Q2_008_partial_09_0568_valid :
    mulPoly ep_Q2_008_coefficient_09_0568
        ep_Q2_008_generator_09_0500_0599 =
      ep_Q2_008_partial_09_0568 := by
  native_decide

/-- Coefficient term 569 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0569 : Poly :=
[
  term ((-23308638671110373457 : Rat) / 22174606515653643488) [(3, 1), (13, 1), (16, 1)]
]

/-- Partial product 569 for generator 9. -/
def ep_Q2_008_partial_09_0569 : Poly :=
[
  term ((-23308638671110373457 : Rat) / 11087303257826821744) [(2, 1), (3, 1), (13, 1), (16, 1)],
  term ((23308638671110373457 : Rat) / 22174606515653643488) [(3, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 569 for generator 9. -/
theorem ep_Q2_008_partial_09_0569_valid :
    mulPoly ep_Q2_008_coefficient_09_0569
        ep_Q2_008_generator_09_0500_0599 =
      ep_Q2_008_partial_09_0569 := by
  native_decide

/-- Coefficient term 570 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0570 : Poly :=
[
  term ((5334600045689691459497035937927697672000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 570 for generator 9. -/
def ep_Q2_008_partial_09_0570 : Poly :=
[
  term ((10669200091379382918994071875855395344000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (13, 2), (15, 1), (16, 1)],
  term ((-5334600045689691459497035937927697672000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 570 for generator 9. -/
theorem ep_Q2_008_partial_09_0570_valid :
    mulPoly ep_Q2_008_coefficient_09_0570
        ep_Q2_008_generator_09_0500_0599 =
      ep_Q2_008_partial_09_0570 := by
  native_decide

/-- Coefficient term 571 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0571 : Poly :=
[
  term ((-17339557632193536845345168869606444588800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (13, 2), (15, 3), (16, 1)]
]

/-- Partial product 571 for generator 9. -/
def ep_Q2_008_partial_09_0571 : Poly :=
[
  term ((-34679115264387073690690337739212889177600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (13, 2), (15, 3), (16, 1)],
  term ((17339557632193536845345168869606444588800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 571 for generator 9. -/
theorem ep_Q2_008_partial_09_0571_valid :
    mulPoly ep_Q2_008_coefficient_09_0571
        ep_Q2_008_generator_09_0500_0599 =
      ep_Q2_008_partial_09_0571 := by
  native_decide

/-- Coefficient term 572 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0572 : Poly :=
[
  term ((-2682420152527532571250708238738785786090823 : Rat) / 1349660814810636123005926626071864437583984) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 572 for generator 9. -/
def ep_Q2_008_partial_09_0572 : Poly :=
[
  term ((-2682420152527532571250708238738785786090823 : Rat) / 674830407405318061502963313035932218791992) [(2, 1), (3, 1), (15, 1), (16, 1)],
  term ((2682420152527532571250708238738785786090823 : Rat) / 1349660814810636123005926626071864437583984) [(3, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 572 for generator 9. -/
theorem ep_Q2_008_partial_09_0572_valid :
    mulPoly ep_Q2_008_coefficient_09_0572
        ep_Q2_008_generator_09_0500_0599 =
      ep_Q2_008_partial_09_0572 := by
  native_decide

/-- Coefficient term 573 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0573 : Poly :=
[
  term ((21411784107780829100583281246209741529400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (15, 3), (16, 1)]
]

/-- Partial product 573 for generator 9. -/
def ep_Q2_008_partial_09_0573 : Poly :=
[
  term ((42823568215561658201166562492419483058800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (15, 3), (16, 1)],
  term ((-21411784107780829100583281246209741529400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 573 for generator 9. -/
theorem ep_Q2_008_partial_09_0573_valid :
    mulPoly ep_Q2_008_coefficient_09_0573
        ep_Q2_008_generator_09_0500_0599 =
      ep_Q2_008_partial_09_0573 := by
  native_decide

/-- Coefficient term 574 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0574 : Poly :=
[
  term ((107908707004785500240313248350514400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 574 for generator 9. -/
def ep_Q2_008_partial_09_0574 : Poly :=
[
  term ((215817414009571000480626496701028800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 2), (7, 1), (15, 1), (16, 1)],
  term ((-107908707004785500240313248350514400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 574 for generator 9. -/
theorem ep_Q2_008_partial_09_0574_valid :
    mulPoly ep_Q2_008_coefficient_09_0574
        ep_Q2_008_generator_09_0500_0599 =
      ep_Q2_008_partial_09_0574 := by
  native_decide

/-- Coefficient term 575 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0575 : Poly :=
[
  term ((192943886127363000 : Rat) / 692956453614176359) [(3, 2), (10, 1), (16, 1)]
]

/-- Partial product 575 for generator 9. -/
def ep_Q2_008_partial_09_0575 : Poly :=
[
  term ((385887772254726000 : Rat) / 692956453614176359) [(2, 1), (3, 2), (10, 1), (16, 1)],
  term ((-192943886127363000 : Rat) / 692956453614176359) [(3, 2), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 575 for generator 9. -/
theorem ep_Q2_008_partial_09_0575_valid :
    mulPoly ep_Q2_008_coefficient_09_0575
        ep_Q2_008_generator_09_0500_0599 =
      ep_Q2_008_partial_09_0575 := by
  native_decide

/-- Coefficient term 576 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0576 : Poly :=
[
  term ((1804205182183737225 : Rat) / 2771825814456705436) [(3, 2), (16, 1)]
]

/-- Partial product 576 for generator 9. -/
def ep_Q2_008_partial_09_0576 : Poly :=
[
  term ((1804205182183737225 : Rat) / 1385912907228352718) [(2, 1), (3, 2), (16, 1)],
  term ((-1804205182183737225 : Rat) / 2771825814456705436) [(3, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 576 for generator 9. -/
theorem ep_Q2_008_partial_09_0576_valid :
    mulPoly ep_Q2_008_coefficient_09_0576
        ep_Q2_008_generator_09_0500_0599 =
      ep_Q2_008_partial_09_0576 := by
  native_decide

/-- Coefficient term 577 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0577 : Poly :=
[
  term ((129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 577 for generator 9. -/
def ep_Q2_008_partial_09_0577 : Poly :=
[
  term ((258163701531813679386786322024396800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (5, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 577 for generator 9. -/
theorem ep_Q2_008_partial_09_0577_valid :
    mulPoly ep_Q2_008_coefficient_09_0577
        ep_Q2_008_generator_09_0500_0599 =
      ep_Q2_008_partial_09_0577 := by
  native_decide

/-- Coefficient term 578 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0578 : Poly :=
[
  term ((-32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 578 for generator 9. -/
def ep_Q2_008_partial_09_0578 : Poly :=
[
  term ((-64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (5, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 578 for generator 9. -/
theorem ep_Q2_008_partial_09_0578_valid :
    mulPoly ep_Q2_008_coefficient_09_0578
        ep_Q2_008_generator_09_0500_0599 =
      ep_Q2_008_partial_09_0578 := by
  native_decide

/-- Coefficient term 579 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0579 : Poly :=
[
  term ((3351562506341977846599109195899699009600 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 579 for generator 9. -/
def ep_Q2_008_partial_09_0579 : Poly :=
[
  term ((6703125012683955693198218391799398019200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3351562506341977846599109195899699009600 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 579 for generator 9. -/
theorem ep_Q2_008_partial_09_0579_valid :
    mulPoly ep_Q2_008_coefficient_09_0579
        ep_Q2_008_generator_09_0500_0599 =
      ep_Q2_008_partial_09_0579 := by
  native_decide

/-- Coefficient term 580 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0580 : Poly :=
[
  term ((129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 580 for generator 9. -/
def ep_Q2_008_partial_09_0580 : Poly :=
[
  term ((258163701531813679386786322024396800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (5, 1), (7, 1), (13, 1), (15, 3), (16, 1)],
  term ((-129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 580 for generator 9. -/
theorem ep_Q2_008_partial_09_0580_valid :
    mulPoly ep_Q2_008_coefficient_09_0580
        ep_Q2_008_generator_09_0500_0599 =
      ep_Q2_008_partial_09_0580 := by
  native_decide

/-- Coefficient term 581 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0581 : Poly :=
[
  term ((-613138791138057488543617514807942400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 581 for generator 9. -/
def ep_Q2_008_partial_09_0581 : Poly :=
[
  term ((-1226277582276114977087235029615884800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (5, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((613138791138057488543617514807942400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 581 for generator 9. -/
theorem ep_Q2_008_partial_09_0581_valid :
    mulPoly ep_Q2_008_coefficient_09_0581
        ep_Q2_008_generator_09_0500_0599 =
      ep_Q2_008_partial_09_0581 := by
  native_decide

/-- Coefficient term 582 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0582 : Poly :=
[
  term ((-16135231345738354961674145126524800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 582 for generator 9. -/
def ep_Q2_008_partial_09_0582 : Poly :=
[
  term ((-32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (5, 1), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((16135231345738354961674145126524800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 582 for generator 9. -/
theorem ep_Q2_008_partial_09_0582_valid :
    mulPoly ep_Q2_008_coefficient_09_0582
        ep_Q2_008_generator_09_0500_0599 =
      ep_Q2_008_partial_09_0582 := by
  native_decide

/-- Coefficient term 583 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0583 : Poly :=
[
  term ((4745656278158339694610042684272000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (15, 2), (16, 1)]
]

/-- Partial product 583 for generator 9. -/
def ep_Q2_008_partial_09_0583 : Poly :=
[
  term ((9491312556316679389220085368544000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((-4745656278158339694610042684272000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 583 for generator 9. -/
theorem ep_Q2_008_partial_09_0583_valid :
    mulPoly ep_Q2_008_coefficient_09_0583
        ep_Q2_008_generator_09_0500_0599 =
      ep_Q2_008_partial_09_0583 := by
  native_decide

/-- Coefficient term 584 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0584 : Poly :=
[
  term ((692576845212253500 : Rat) / 692956453614176359) [(4, 1), (5, 1), (7, 1), (16, 1)]
]

/-- Partial product 584 for generator 9. -/
def ep_Q2_008_partial_09_0584 : Poly :=
[
  term ((1385153690424507000 : Rat) / 692956453614176359) [(2, 1), (4, 1), (5, 1), (7, 1), (16, 1)],
  term ((-692576845212253500 : Rat) / 692956453614176359) [(4, 1), (5, 1), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 584 for generator 9. -/
theorem ep_Q2_008_partial_09_0584_valid :
    mulPoly ep_Q2_008_coefficient_09_0584
        ep_Q2_008_generator_09_0500_0599 =
      ep_Q2_008_partial_09_0584 := by
  native_decide

/-- Coefficient term 585 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0585 : Poly :=
[
  term ((-29775291069037500 : Rat) / 692956453614176359) [(4, 1), (5, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 585 for generator 9. -/
def ep_Q2_008_partial_09_0585 : Poly :=
[
  term ((-59550582138075000 : Rat) / 692956453614176359) [(2, 1), (4, 1), (5, 1), (10, 1), (11, 1), (16, 1)],
  term ((29775291069037500 : Rat) / 692956453614176359) [(4, 1), (5, 1), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 585 for generator 9. -/
theorem ep_Q2_008_partial_09_0585_valid :
    mulPoly ep_Q2_008_coefficient_09_0585
        ep_Q2_008_generator_09_0500_0599 =
      ep_Q2_008_partial_09_0585 := by
  native_decide

/-- Coefficient term 586 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0586 : Poly :=
[
  term ((-199241833525243875 : Rat) / 692956453614176359) [(4, 1), (5, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 586 for generator 9. -/
def ep_Q2_008_partial_09_0586 : Poly :=
[
  term ((-398483667050487750 : Rat) / 692956453614176359) [(2, 1), (4, 1), (5, 1), (10, 1), (13, 1), (16, 1)],
  term ((199241833525243875 : Rat) / 692956453614176359) [(4, 1), (5, 1), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 586 for generator 9. -/
theorem ep_Q2_008_partial_09_0586_valid :
    mulPoly ep_Q2_008_coefficient_09_0586
        ep_Q2_008_generator_09_0500_0599 =
      ep_Q2_008_partial_09_0586 := by
  native_decide

/-- Coefficient term 587 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0587 : Poly :=
[
  term ((478060622764964799693876234252168883200 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (5, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 587 for generator 9. -/
def ep_Q2_008_partial_09_0587 : Poly :=
[
  term ((956121245529929599387752468504337766400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (5, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-478060622764964799693876234252168883200 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (5, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 587 for generator 9. -/
theorem ep_Q2_008_partial_09_0587_valid :
    mulPoly ep_Q2_008_coefficient_09_0587
        ep_Q2_008_generator_09_0500_0599 =
      ep_Q2_008_partial_09_0587 := by
  native_decide

/-- Coefficient term 588 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0588 : Poly :=
[
  term ((12250624020253221857804351804734105470300 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (5, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 588 for generator 9. -/
def ep_Q2_008_partial_09_0588 : Poly :=
[
  term ((24501248040506443715608703609468210940600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((-12250624020253221857804351804734105470300 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (5, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 588 for generator 9. -/
theorem ep_Q2_008_partial_09_0588_valid :
    mulPoly ep_Q2_008_coefficient_09_0588
        ep_Q2_008_generator_09_0500_0599 =
      ep_Q2_008_partial_09_0588 := by
  native_decide

/-- Coefficient term 589 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0589 : Poly :=
[
  term ((21527944517009055948 : Rat) / 692956453614176359) [(4, 1), (5, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 589 for generator 9. -/
def ep_Q2_008_partial_09_0589 : Poly :=
[
  term ((43055889034018111896 : Rat) / 692956453614176359) [(2, 1), (4, 1), (5, 1), (12, 1), (13, 1), (16, 1)],
  term ((-21527944517009055948 : Rat) / 692956453614176359) [(4, 1), (5, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 589 for generator 9. -/
theorem ep_Q2_008_partial_09_0589_valid :
    mulPoly ep_Q2_008_coefficient_09_0589
        ep_Q2_008_generator_09_0500_0599 =
      ep_Q2_008_partial_09_0589 := by
  native_decide

/-- Coefficient term 590 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0590 : Poly :=
[
  term ((-5381986129252263987 : Rat) / 692956453614176359) [(4, 1), (5, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 590 for generator 9. -/
def ep_Q2_008_partial_09_0590 : Poly :=
[
  term ((-10763972258504527974 : Rat) / 692956453614176359) [(2, 1), (4, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((5381986129252263987 : Rat) / 692956453614176359) [(4, 1), (5, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 590 for generator 9. -/
theorem ep_Q2_008_partial_09_0590_valid :
    mulPoly ep_Q2_008_coefficient_09_0590
        ep_Q2_008_generator_09_0500_0599 =
      ep_Q2_008_partial_09_0590 := by
  native_decide

/-- Coefficient term 591 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0591 : Poly :=
[
  term ((21527944517009055948 : Rat) / 692956453614176359) [(4, 1), (5, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 591 for generator 9. -/
def ep_Q2_008_partial_09_0591 : Poly :=
[
  term ((43055889034018111896 : Rat) / 692956453614176359) [(2, 1), (4, 1), (5, 1), (13, 1), (15, 2), (16, 1)],
  term ((-21527944517009055948 : Rat) / 692956453614176359) [(4, 1), (5, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 591 for generator 9. -/
theorem ep_Q2_008_partial_09_0591_valid :
    mulPoly ep_Q2_008_coefficient_09_0591
        ep_Q2_008_generator_09_0500_0599 =
      ep_Q2_008_partial_09_0591 := by
  native_decide

/-- Coefficient term 592 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0592 : Poly :=
[
  term ((-460437452878108482489 : Rat) / 22174606515653643488) [(4, 1), (5, 1), (13, 1), (16, 1)]
]

/-- Partial product 592 for generator 9. -/
def ep_Q2_008_partial_09_0592 : Poly :=
[
  term ((-460437452878108482489 : Rat) / 11087303257826821744) [(2, 1), (4, 1), (5, 1), (13, 1), (16, 1)],
  term ((460437452878108482489 : Rat) / 22174606515653643488) [(4, 1), (5, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 592 for generator 9. -/
theorem ep_Q2_008_partial_09_0592_valid :
    mulPoly ep_Q2_008_coefficient_09_0592
        ep_Q2_008_generator_09_0500_0599 =
      ep_Q2_008_partial_09_0592 := by
  native_decide

/-- Coefficient term 593 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0593 : Poly :=
[
  term ((-102257736455793015753 : Rat) / 692956453614176359) [(4, 1), (5, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 593 for generator 9. -/
def ep_Q2_008_partial_09_0593 : Poly :=
[
  term ((-204515472911586031506 : Rat) / 692956453614176359) [(2, 1), (4, 1), (5, 1), (13, 2), (15, 1), (16, 1)],
  term ((102257736455793015753 : Rat) / 692956453614176359) [(4, 1), (5, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 593 for generator 9. -/
theorem ep_Q2_008_partial_09_0593_valid :
    mulPoly ep_Q2_008_coefficient_09_0593
        ep_Q2_008_generator_09_0500_0599 =
      ep_Q2_008_partial_09_0593 := by
  native_decide

/-- Coefficient term 594 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0594 : Poly :=
[
  term ((-5381986129252263987 : Rat) / 1385912907228352718) [(4, 1), (5, 1), (13, 3), (16, 1)]
]

/-- Partial product 594 for generator 9. -/
def ep_Q2_008_partial_09_0594 : Poly :=
[
  term ((-5381986129252263987 : Rat) / 692956453614176359) [(2, 1), (4, 1), (5, 1), (13, 3), (16, 1)],
  term ((5381986129252263987 : Rat) / 1385912907228352718) [(4, 1), (5, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 594 for generator 9. -/
theorem ep_Q2_008_partial_09_0594_valid :
    mulPoly ep_Q2_008_coefficient_09_0594
        ep_Q2_008_generator_09_0500_0599 =
      ep_Q2_008_partial_09_0594 := by
  native_decide

/-- Coefficient term 595 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0595 : Poly :=
[
  term ((-2547467158270449039676910611696721294840775 : Rat) / 1349660814810636123005926626071864437583984) [(4, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 595 for generator 9. -/
def ep_Q2_008_partial_09_0595 : Poly :=
[
  term ((-2547467158270449039676910611696721294840775 : Rat) / 674830407405318061502963313035932218791992) [(2, 1), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((2547467158270449039676910611696721294840775 : Rat) / 1349660814810636123005926626071864437583984) [(4, 1), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 595 for generator 9. -/
theorem ep_Q2_008_partial_09_0595_valid :
    mulPoly ep_Q2_008_coefficient_09_0595
        ep_Q2_008_generator_09_0500_0599 =
      ep_Q2_008_partial_09_0595 := by
  native_decide

/-- Coefficient term 596 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0596 : Poly :=
[
  term ((11910116427615000 : Rat) / 692956453614176359) [(4, 1), (6, 1), (7, 1), (11, 1), (16, 1)]
]

/-- Partial product 596 for generator 9. -/
def ep_Q2_008_partial_09_0596 : Poly :=
[
  term ((23820232855230000 : Rat) / 692956453614176359) [(2, 1), (4, 1), (6, 1), (7, 1), (11, 1), (16, 1)],
  term ((-11910116427615000 : Rat) / 692956453614176359) [(4, 1), (6, 1), (7, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 596 for generator 9. -/
theorem ep_Q2_008_partial_09_0596_valid :
    mulPoly ep_Q2_008_coefficient_09_0596
        ep_Q2_008_generator_09_0500_0599 =
      ep_Q2_008_partial_09_0596 := by
  native_decide

/-- Coefficient term 597 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0597 : Poly :=
[
  term ((-126044294176518257016523967024570400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 597 for generator 9. -/
def ep_Q2_008_partial_09_0597 : Poly :=
[
  term ((-252088588353036514033047934049140800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (6, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((126044294176518257016523967024570400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 597 for generator 9. -/
theorem ep_Q2_008_partial_09_0597_valid :
    mulPoly ep_Q2_008_coefficient_09_0597
        ep_Q2_008_generator_09_0500_0599 =
      ep_Q2_008_partial_09_0597 := by
  native_decide

/-- Coefficient term 598 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0598 : Poly :=
[
  term ((-199241833525243875 : Rat) / 1385912907228352718) [(4, 1), (6, 1), (7, 1), (13, 1), (16, 1)]
]

/-- Partial product 598 for generator 9. -/
def ep_Q2_008_partial_09_0598 : Poly :=
[
  term ((-199241833525243875 : Rat) / 692956453614176359) [(2, 1), (4, 1), (6, 1), (7, 1), (13, 1), (16, 1)],
  term ((199241833525243875 : Rat) / 1385912907228352718) [(4, 1), (6, 1), (7, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 598 for generator 9. -/
theorem ep_Q2_008_partial_09_0598_valid :
    mulPoly ep_Q2_008_coefficient_09_0598
        ep_Q2_008_generator_09_0500_0599 =
      ep_Q2_008_partial_09_0598 := by
  native_decide

/-- Coefficient term 599 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0599 : Poly :=
[
  term ((239295603665572468394036381512226064000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (6, 1), (7, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 599 for generator 9. -/
def ep_Q2_008_partial_09_0599 : Poly :=
[
  term ((478591207331144936788072763024452128000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (6, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-239295603665572468394036381512226064000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (6, 1), (7, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 599 for generator 9. -/
theorem ep_Q2_008_partial_09_0599_valid :
    mulPoly ep_Q2_008_coefficient_09_0599
        ep_Q2_008_generator_09_0500_0599 =
      ep_Q2_008_partial_09_0599 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_008_partials_09_0500_0599 : List Poly :=
[
  ep_Q2_008_partial_09_0500,
  ep_Q2_008_partial_09_0501,
  ep_Q2_008_partial_09_0502,
  ep_Q2_008_partial_09_0503,
  ep_Q2_008_partial_09_0504,
  ep_Q2_008_partial_09_0505,
  ep_Q2_008_partial_09_0506,
  ep_Q2_008_partial_09_0507,
  ep_Q2_008_partial_09_0508,
  ep_Q2_008_partial_09_0509,
  ep_Q2_008_partial_09_0510,
  ep_Q2_008_partial_09_0511,
  ep_Q2_008_partial_09_0512,
  ep_Q2_008_partial_09_0513,
  ep_Q2_008_partial_09_0514,
  ep_Q2_008_partial_09_0515,
  ep_Q2_008_partial_09_0516,
  ep_Q2_008_partial_09_0517,
  ep_Q2_008_partial_09_0518,
  ep_Q2_008_partial_09_0519,
  ep_Q2_008_partial_09_0520,
  ep_Q2_008_partial_09_0521,
  ep_Q2_008_partial_09_0522,
  ep_Q2_008_partial_09_0523,
  ep_Q2_008_partial_09_0524,
  ep_Q2_008_partial_09_0525,
  ep_Q2_008_partial_09_0526,
  ep_Q2_008_partial_09_0527,
  ep_Q2_008_partial_09_0528,
  ep_Q2_008_partial_09_0529,
  ep_Q2_008_partial_09_0530,
  ep_Q2_008_partial_09_0531,
  ep_Q2_008_partial_09_0532,
  ep_Q2_008_partial_09_0533,
  ep_Q2_008_partial_09_0534,
  ep_Q2_008_partial_09_0535,
  ep_Q2_008_partial_09_0536,
  ep_Q2_008_partial_09_0537,
  ep_Q2_008_partial_09_0538,
  ep_Q2_008_partial_09_0539,
  ep_Q2_008_partial_09_0540,
  ep_Q2_008_partial_09_0541,
  ep_Q2_008_partial_09_0542,
  ep_Q2_008_partial_09_0543,
  ep_Q2_008_partial_09_0544,
  ep_Q2_008_partial_09_0545,
  ep_Q2_008_partial_09_0546,
  ep_Q2_008_partial_09_0547,
  ep_Q2_008_partial_09_0548,
  ep_Q2_008_partial_09_0549,
  ep_Q2_008_partial_09_0550,
  ep_Q2_008_partial_09_0551,
  ep_Q2_008_partial_09_0552,
  ep_Q2_008_partial_09_0553,
  ep_Q2_008_partial_09_0554,
  ep_Q2_008_partial_09_0555,
  ep_Q2_008_partial_09_0556,
  ep_Q2_008_partial_09_0557,
  ep_Q2_008_partial_09_0558,
  ep_Q2_008_partial_09_0559,
  ep_Q2_008_partial_09_0560,
  ep_Q2_008_partial_09_0561,
  ep_Q2_008_partial_09_0562,
  ep_Q2_008_partial_09_0563,
  ep_Q2_008_partial_09_0564,
  ep_Q2_008_partial_09_0565,
  ep_Q2_008_partial_09_0566,
  ep_Q2_008_partial_09_0567,
  ep_Q2_008_partial_09_0568,
  ep_Q2_008_partial_09_0569,
  ep_Q2_008_partial_09_0570,
  ep_Q2_008_partial_09_0571,
  ep_Q2_008_partial_09_0572,
  ep_Q2_008_partial_09_0573,
  ep_Q2_008_partial_09_0574,
  ep_Q2_008_partial_09_0575,
  ep_Q2_008_partial_09_0576,
  ep_Q2_008_partial_09_0577,
  ep_Q2_008_partial_09_0578,
  ep_Q2_008_partial_09_0579,
  ep_Q2_008_partial_09_0580,
  ep_Q2_008_partial_09_0581,
  ep_Q2_008_partial_09_0582,
  ep_Q2_008_partial_09_0583,
  ep_Q2_008_partial_09_0584,
  ep_Q2_008_partial_09_0585,
  ep_Q2_008_partial_09_0586,
  ep_Q2_008_partial_09_0587,
  ep_Q2_008_partial_09_0588,
  ep_Q2_008_partial_09_0589,
  ep_Q2_008_partial_09_0590,
  ep_Q2_008_partial_09_0591,
  ep_Q2_008_partial_09_0592,
  ep_Q2_008_partial_09_0593,
  ep_Q2_008_partial_09_0594,
  ep_Q2_008_partial_09_0595,
  ep_Q2_008_partial_09_0596,
  ep_Q2_008_partial_09_0597,
  ep_Q2_008_partial_09_0598,
  ep_Q2_008_partial_09_0599
]

/-- Sum of partial products in this block. -/
def ep_Q2_008_block_09_0500_0599 : Poly :=
[
  term ((36867354425312639253063464932608960000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (6, 2), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((1619646487561852949 : Rat) / 2771825814456705436) [(2, 1), (3, 1), (6, 2), (7, 1), (16, 1)],
  term ((1015368500705537531255289132617856000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (6, 2), (7, 2), (13, 2), (15, 1), (16, 1)],
  term ((9397072573488003139965417854246400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (6, 2), (7, 2), (15, 1), (16, 1)],
  term ((8489530989603972000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (6, 2), (10, 1), (13, 1), (16, 1)],
  term ((4097778927515857893794044667679356716800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (6, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((23822768568696120000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (6, 2), (11, 1), (13, 2), (16, 1)],
  term ((1972163407581095678179970936887570176000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (6, 2), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((-25891905370046625 : Rat) / 1385912907228352718) [(2, 1), (3, 1), (6, 2), (11, 1), (16, 1)],
  term ((-14542270082434402900937359393875467756400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (6, 2), (12, 1), (15, 1), (16, 1)],
  term ((-21856447400000286033 : Rat) / 2771825814456705436) [(2, 1), (3, 1), (6, 2), (13, 1), (16, 1)],
  term ((34679115264387073690690337739212889177600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (6, 2), (13, 2), (15, 1), (16, 1)],
  term ((8888426749256096646107186704950527596800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (6, 2), (15, 1), (16, 1)],
  term ((8489530989603972000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-771775544509452000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (7, 1), (10, 1), (16, 1)],
  term ((4097778927515857893794044667679356716800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (7, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((23822768568696120000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (7, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((1972163407581095678179970936887570176000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 1), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((-25891905370046625 : Rat) / 1385912907228352718) [(2, 1), (3, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((2389372865588389950254528268723460800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((4744206808436961099 : Rat) / 1385912907228352718) [(2, 1), (3, 1), (7, 1), (12, 1), (13, 2), (16, 1)],
  term ((47927560752906431028982504412391648000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-147795218784743980616819995994150400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((-6986928998826554805 : Rat) / 5543651628913410872) [(2, 1), (3, 1), (7, 1), (12, 1), (16, 1)],
  term ((-2656508851257165795057296759919627610014513 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (3, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((480796685728101444322437880027305600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 1), (13, 1), (15, 3), (16, 1)],
  term ((-187441555900800119543040434348876488500915 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((3284450867379434607 : Rat) / 2771825814456705436) [(2, 1), (3, 1), (7, 1), (13, 2), (16, 1)],
  term ((16590309491390687663878559219674032000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((-36867354425312639253063464932608960000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 1), (13, 3), (15, 3), (16, 1)],
  term ((-248334132367369355942904185647582392182587 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (3, 1), (7, 1), (15, 2), (16, 1)],
  term ((-25502223610551969251 : Rat) / 11087303257826821744) [(2, 1), (3, 1), (7, 1), (16, 1)],
  term ((1319979050917198790631875872403212800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 2), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((33495582468249501163658967938918400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 2), (12, 1), (15, 1), (16, 1)],
  term ((748115128448986530779677617726326400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 2), (13, 1), (15, 2), (16, 1)],
  term ((222133921724121400498513653611270040699315 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (7, 2), (13, 2), (15, 1), (16, 1)],
  term ((-1015368500705537531255289132617856000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 2), (13, 2), (15, 3), (16, 1)],
  term ((36867354425312639253063464932608960000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 2), (13, 3), (15, 2), (16, 1)],
  term ((197106059535537187787589436346638752422389 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (3, 1), (7, 2), (15, 1), (16, 1)],
  term ((24448544116696581235210886566348800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 2), (15, 3), (16, 1)],
  term ((1015368500705537531255289132617856000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 3), (13, 2), (15, 2), (16, 1)],
  term ((9397072573488003139965417854246400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 3), (15, 2), (16, 1)],
  term ((234997830172389375 : Rat) / 692956453614176359) [(2, 1), (3, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-234997830172389375 : Rat) / 1385912907228352718) [(2, 1), (3, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((37567733827944454683844372592511258330300 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4380228660796789694230382606387524515150 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (9, 1), (15, 2), (16, 1)],
  term ((70324786932212700 : Rat) / 692956453614176359) [(2, 1), (3, 1), (9, 1), (16, 1)],
  term ((10418969850877602000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-1033772499319014877156923414058624213092000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((4248773279509728375 : Rat) / 692956453614176359) [(2, 1), (3, 1), (10, 1), (13, 1), (16, 1)],
  term ((-304220396304977599805193967251380198400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-48928739749345806293192297634312031613925 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((6941360425022499925825819486392138134400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((30969599139304956000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((2563812429855424381633962217953841228800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-207456214280770125 : Rat) / 2771825814456705436) [(2, 1), (3, 1), (11, 1), (12, 1), (16, 1)],
  term ((109547733925558665238982947308267034015800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2251070540899400428130005893102265632000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-23822768568696120000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((10720245855913254000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (11, 1), (13, 2), (16, 1)],
  term ((887473533411493055180986921599406579200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((-1972163407581095678179970936887570176000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (11, 1), (13, 3), (15, 3), (16, 1)],
  term ((91619064408362469212274743712140367523875 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (3, 1), (11, 1), (15, 2), (16, 1)],
  term ((-19274969785069125 : Rat) / 23895050124626771) [(2, 1), (3, 1), (11, 1), (16, 1)],
  term ((-1957025244783008681222921652159444038400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-48748672533921967185 : Rat) / 5543651628913410872) [(2, 1), (3, 1), (12, 1), (13, 1), (16, 1)],
  term ((47828072579908271067309536364465423936000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-298866563054428146573751864435621484520150 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((2497965466424768865463160654519426351550513 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (3, 1), (13, 1), (15, 2), (16, 1)],
  term ((-23308638671110373457 : Rat) / 11087303257826821744) [(2, 1), (3, 1), (13, 1), (16, 1)],
  term ((10669200091379382918994071875855395344000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (13, 2), (15, 1), (16, 1)],
  term ((-34679115264387073690690337739212889177600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (13, 2), (15, 3), (16, 1)],
  term ((-2682420152527532571250708238738785786090823 : Rat) / 674830407405318061502963313035932218791992) [(2, 1), (3, 1), (15, 1), (16, 1)],
  term ((42823568215561658201166562492419483058800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (15, 3), (16, 1)],
  term ((215817414009571000480626496701028800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 2), (7, 1), (15, 1), (16, 1)],
  term ((385887772254726000 : Rat) / 692956453614176359) [(2, 1), (3, 2), (10, 1), (16, 1)],
  term ((1804205182183737225 : Rat) / 1385912907228352718) [(2, 1), (3, 2), (16, 1)],
  term ((258163701531813679386786322024396800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (5, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (5, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((6703125012683955693198218391799398019200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((258163701531813679386786322024396800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (5, 1), (7, 1), (13, 1), (15, 3), (16, 1)],
  term ((-1226277582276114977087235029615884800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (5, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((-32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (5, 1), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((9491312556316679389220085368544000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((1385153690424507000 : Rat) / 692956453614176359) [(2, 1), (4, 1), (5, 1), (7, 1), (16, 1)],
  term ((-59550582138075000 : Rat) / 692956453614176359) [(2, 1), (4, 1), (5, 1), (10, 1), (11, 1), (16, 1)],
  term ((-398483667050487750 : Rat) / 692956453614176359) [(2, 1), (4, 1), (5, 1), (10, 1), (13, 1), (16, 1)],
  term ((956121245529929599387752468504337766400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (5, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((24501248040506443715608703609468210940600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((43055889034018111896 : Rat) / 692956453614176359) [(2, 1), (4, 1), (5, 1), (12, 1), (13, 1), (16, 1)],
  term ((-10763972258504527974 : Rat) / 692956453614176359) [(2, 1), (4, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((43055889034018111896 : Rat) / 692956453614176359) [(2, 1), (4, 1), (5, 1), (13, 1), (15, 2), (16, 1)],
  term ((-460437452878108482489 : Rat) / 11087303257826821744) [(2, 1), (4, 1), (5, 1), (13, 1), (16, 1)],
  term ((-204515472911586031506 : Rat) / 692956453614176359) [(2, 1), (4, 1), (5, 1), (13, 2), (15, 1), (16, 1)],
  term ((-5381986129252263987 : Rat) / 692956453614176359) [(2, 1), (4, 1), (5, 1), (13, 3), (16, 1)],
  term ((-2547467158270449039676910611696721294840775 : Rat) / 674830407405318061502963313035932218791992) [(2, 1), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((23820232855230000 : Rat) / 692956453614176359) [(2, 1), (4, 1), (6, 1), (7, 1), (11, 1), (16, 1)],
  term ((-252088588353036514033047934049140800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (6, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-199241833525243875 : Rat) / 692956453614176359) [(2, 1), (4, 1), (6, 1), (7, 1), (13, 1), (16, 1)],
  term ((478591207331144936788072763024452128000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (4, 1), (6, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-18433677212656319626531732466304480000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 2), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((-1619646487561852949 : Rat) / 5543651628913410872) [(3, 1), (6, 2), (7, 1), (16, 1)],
  term ((-507684250352768765627644566308928000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 2), (7, 2), (13, 2), (15, 1), (16, 1)],
  term ((-4698536286744001569982708927123200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 2), (7, 2), (15, 1), (16, 1)],
  term ((-4244765494801986000 : Rat) / 692956453614176359) [(3, 1), (6, 2), (10, 1), (13, 1), (16, 1)],
  term ((-2048889463757928946897022333839678358400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-11911384284348060000 : Rat) / 692956453614176359) [(3, 1), (6, 2), (11, 1), (13, 2), (16, 1)],
  term ((-986081703790547839089985468443785088000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 2), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((25891905370046625 : Rat) / 2771825814456705436) [(3, 1), (6, 2), (11, 1), (16, 1)],
  term ((7271135041217201450468679696937733878200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 2), (12, 1), (15, 1), (16, 1)],
  term ((21856447400000286033 : Rat) / 5543651628913410872) [(3, 1), (6, 2), (13, 1), (16, 1)],
  term ((-17339557632193536845345168869606444588800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 2), (13, 2), (15, 1), (16, 1)],
  term ((-4444213374628048323053593352475263798400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 2), (15, 1), (16, 1)],
  term ((-4244765494801986000 : Rat) / 692956453614176359) [(3, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((385887772254726000 : Rat) / 692956453614176359) [(3, 1), (7, 1), (10, 1), (16, 1)],
  term ((-2048889463757928946897022333839678358400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-11911384284348060000 : Rat) / 692956453614176359) [(3, 1), (7, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-986081703790547839089985468443785088000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((25891905370046625 : Rat) / 2771825814456705436) [(3, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1194686432794194975127264134361730400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4744206808436961099 : Rat) / 2771825814456705436) [(3, 1), (7, 1), (12, 1), (13, 2), (16, 1)],
  term ((-23963780376453215514491252206195824000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((73897609392371990308409997997075200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((6986928998826554805 : Rat) / 11087303257826821744) [(3, 1), (7, 1), (12, 1), (16, 1)],
  term ((2656508851257165795057296759919627610014513 : Rat) / 674830407405318061502963313035932218791992) [(3, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-240398342864050722161218940013652800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (13, 1), (15, 3), (16, 1)],
  term ((187441555900800119543040434348876488500915 : Rat) / 168707601851329515375740828258983054697998) [(3, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((-3284450867379434607 : Rat) / 5543651628913410872) [(3, 1), (7, 1), (13, 2), (16, 1)],
  term ((-8295154745695343831939279609837016000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((18433677212656319626531732466304480000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (13, 3), (15, 3), (16, 1)],
  term ((248334132367369355942904185647582392182587 : Rat) / 674830407405318061502963313035932218791992) [(3, 1), (7, 1), (15, 2), (16, 1)],
  term ((25502223610551969251 : Rat) / 22174606515653643488) [(3, 1), (7, 1), (16, 1)],
  term ((-659989525458599395315937936201606400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-16747791234124750581829483969459200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (12, 1), (15, 1), (16, 1)],
  term ((-374057564224493265389838808863163200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (13, 1), (15, 2), (16, 1)],
  term ((-222133921724121400498513653611270040699315 : Rat) / 168707601851329515375740828258983054697998) [(3, 1), (7, 2), (13, 2), (15, 1), (16, 1)],
  term ((507684250352768765627644566308928000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (13, 2), (15, 3), (16, 1)],
  term ((-18433677212656319626531732466304480000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (13, 3), (15, 2), (16, 1)],
  term ((-197106059535537187787589436346638752422389 : Rat) / 674830407405318061502963313035932218791992) [(3, 1), (7, 2), (15, 1), (16, 1)],
  term ((-12224272058348290617605443283174400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (15, 3), (16, 1)],
  term ((-507684250352768765627644566308928000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 3), (13, 2), (15, 2), (16, 1)],
  term ((-4698536286744001569982708927123200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 3), (15, 2), (16, 1)],
  term ((-234997830172389375 : Rat) / 1385912907228352718) [(3, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((234997830172389375 : Rat) / 2771825814456705436) [(3, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-18783866913972227341922186296255629165150 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((2190114330398394847115191303193762257575 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (9, 1), (15, 2), (16, 1)],
  term ((-35162393466106350 : Rat) / 692956453614176359) [(3, 1), (9, 1), (16, 1)],
  term ((-5209484925438801000 : Rat) / 692956453614176359) [(3, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((516886249659507438578461707029312106546000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-4248773279509728375 : Rat) / 1385912907228352718) [(3, 1), (10, 1), (13, 1), (16, 1)],
  term ((152110198152488799902596983625690099200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((48928739749345806293192297634312031613925 : Rat) / 337415203702659030751481656517966109395996) [(3, 1), (10, 1), (15, 1), (16, 1)],
  term ((-3470680212511249962912909743196069067200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-15484799569652478000 : Rat) / 692956453614176359) [(3, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((-1281906214927712190816981108976920614400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((207456214280770125 : Rat) / 5543651628913410872) [(3, 1), (11, 1), (12, 1), (16, 1)],
  term ((-54773866962779332619491473654133517007900 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((1125535270449700214065002946551132816000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((11911384284348060000 : Rat) / 692956453614176359) [(3, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-5360122927956627000 : Rat) / 692956453614176359) [(3, 1), (11, 1), (13, 2), (16, 1)],
  term ((-443736766705746527590493460799703289600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((986081703790547839089985468443785088000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 1), (13, 3), (15, 3), (16, 1)],
  term ((-91619064408362469212274743712140367523875 : Rat) / 337415203702659030751481656517966109395996) [(3, 1), (11, 1), (15, 2), (16, 1)],
  term ((19274969785069125 : Rat) / 47790100249253542) [(3, 1), (11, 1), (16, 1)],
  term ((978512622391504340611460826079722019200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((48748672533921967185 : Rat) / 11087303257826821744) [(3, 1), (12, 1), (13, 1), (16, 1)],
  term ((-23914036289954135533654768182232711968000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((149433281527214073286875932217810742260075 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2497965466424768865463160654519426351550513 : Rat) / 674830407405318061502963313035932218791992) [(3, 1), (13, 1), (15, 2), (16, 1)],
  term ((23308638671110373457 : Rat) / 22174606515653643488) [(3, 1), (13, 1), (16, 1)],
  term ((-5334600045689691459497035937927697672000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (13, 2), (15, 1), (16, 1)],
  term ((17339557632193536845345168869606444588800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (13, 2), (15, 3), (16, 1)],
  term ((2682420152527532571250708238738785786090823 : Rat) / 1349660814810636123005926626071864437583984) [(3, 1), (15, 1), (16, 1)],
  term ((-21411784107780829100583281246209741529400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (15, 3), (16, 1)],
  term ((-107908707004785500240313248350514400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 1), (15, 1), (16, 1)],
  term ((-192943886127363000 : Rat) / 692956453614176359) [(3, 2), (10, 1), (16, 1)],
  term ((-1804205182183737225 : Rat) / 2771825814456705436) [(3, 2), (16, 1)],
  term ((-129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((-3351562506341977846599109195899699009600 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (13, 1), (15, 3), (16, 1)],
  term ((613138791138057488543617514807942400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((16135231345738354961674145126524800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((-4745656278158339694610042684272000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((-692576845212253500 : Rat) / 692956453614176359) [(4, 1), (5, 1), (7, 1), (16, 1)],
  term ((29775291069037500 : Rat) / 692956453614176359) [(4, 1), (5, 1), (10, 1), (11, 1), (16, 1)],
  term ((199241833525243875 : Rat) / 692956453614176359) [(4, 1), (5, 1), (10, 1), (13, 1), (16, 1)],
  term ((-478060622764964799693876234252168883200 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (5, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-12250624020253221857804351804734105470300 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((-21527944517009055948 : Rat) / 692956453614176359) [(4, 1), (5, 1), (12, 1), (13, 1), (16, 1)],
  term ((5381986129252263987 : Rat) / 692956453614176359) [(4, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-21527944517009055948 : Rat) / 692956453614176359) [(4, 1), (5, 1), (13, 1), (15, 2), (16, 1)],
  term ((460437452878108482489 : Rat) / 22174606515653643488) [(4, 1), (5, 1), (13, 1), (16, 1)],
  term ((102257736455793015753 : Rat) / 692956453614176359) [(4, 1), (5, 1), (13, 2), (15, 1), (16, 1)],
  term ((5381986129252263987 : Rat) / 1385912907228352718) [(4, 1), (5, 1), (13, 3), (16, 1)],
  term ((2547467158270449039676910611696721294840775 : Rat) / 1349660814810636123005926626071864437583984) [(4, 1), (5, 1), (15, 1), (16, 1)],
  term ((-11910116427615000 : Rat) / 692956453614176359) [(4, 1), (6, 1), (7, 1), (11, 1), (16, 1)],
  term ((126044294176518257016523967024570400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((199241833525243875 : Rat) / 1385912907228352718) [(4, 1), (6, 1), (7, 1), (13, 1), (16, 1)],
  term ((-239295603665572468394036381512226064000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (6, 1), (7, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 9, terms 500 through 599. -/
theorem ep_Q2_008_block_09_0500_0599_valid :
    checkProductSumEq ep_Q2_008_partials_09_0500_0599
      ep_Q2_008_block_09_0500_0599 = true := by
  native_decide

end EpQ2008TermShards

end Patterns

end EndpointCertificate

end Problem97
