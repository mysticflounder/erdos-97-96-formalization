/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_008, term block 9:800-899

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_008`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2008TermShards

/-- Generator polynomial 9 for endpoint certificate `ep_Q2_008`. -/
def ep_Q2_008_generator_09_0800_0899 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(2, 1)]
]

/-- Coefficient term 800 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0800 : Poly :=
[
  term ((71069138684197378665 : Rat) / 22174606515653643488) [(5, 2), (12, 1), (16, 1)]
]

/-- Partial product 800 for generator 9. -/
def ep_Q2_008_partial_09_0800 : Poly :=
[
  term ((71069138684197378665 : Rat) / 11087303257826821744) [(2, 1), (5, 2), (12, 1), (16, 1)],
  term ((-71069138684197378665 : Rat) / 22174606515653643488) [(5, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 800 for generator 9. -/
theorem ep_Q2_008_partial_09_0800_valid :
    mulPoly ep_Q2_008_coefficient_09_0800
        ep_Q2_008_generator_09_0800_0899 =
      ep_Q2_008_partial_09_0800 := by
  native_decide

/-- Coefficient term 801 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0801 : Poly :=
[
  term ((-5381986129252263987 : Rat) / 692956453614176359) [(5, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 801 for generator 9. -/
def ep_Q2_008_partial_09_0801 : Poly :=
[
  term ((-10763972258504527974 : Rat) / 692956453614176359) [(2, 1), (5, 2), (13, 1), (15, 1), (16, 1)],
  term ((5381986129252263987 : Rat) / 692956453614176359) [(5, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 801 for generator 9. -/
theorem ep_Q2_008_partial_09_0801_valid :
    mulPoly ep_Q2_008_coefficient_09_0801
        ep_Q2_008_generator_09_0800_0899 =
      ep_Q2_008_partial_09_0801 := by
  native_decide

/-- Coefficient term 802 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0802 : Poly :=
[
  term ((59201847421774903857 : Rat) / 1385912907228352718) [(5, 2), (13, 2), (16, 1)]
]

/-- Partial product 802 for generator 9. -/
def ep_Q2_008_partial_09_0802 : Poly :=
[
  term ((59201847421774903857 : Rat) / 692956453614176359) [(2, 1), (5, 2), (13, 2), (16, 1)],
  term ((-59201847421774903857 : Rat) / 1385912907228352718) [(5, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 802 for generator 9. -/
theorem ep_Q2_008_partial_09_0802_valid :
    mulPoly ep_Q2_008_coefficient_09_0802
        ep_Q2_008_generator_09_0800_0899 =
      ep_Q2_008_partial_09_0802 := by
  native_decide

/-- Coefficient term 803 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0803 : Poly :=
[
  term ((5381986129252263987 : Rat) / 1385912907228352718) [(5, 2), (15, 2), (16, 1)]
]

/-- Partial product 803 for generator 9. -/
def ep_Q2_008_partial_09_0803 : Poly :=
[
  term ((5381986129252263987 : Rat) / 692956453614176359) [(2, 1), (5, 2), (15, 2), (16, 1)],
  term ((-5381986129252263987 : Rat) / 1385912907228352718) [(5, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 803 for generator 9. -/
theorem ep_Q2_008_partial_09_0803_valid :
    mulPoly ep_Q2_008_coefficient_09_0803
        ep_Q2_008_generator_09_0800_0899 =
      ep_Q2_008_partial_09_0803 := by
  native_decide

/-- Coefficient term 804 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0804 : Poly :=
[
  term ((-193419781321481949525 : Rat) / 22174606515653643488) [(5, 2), (16, 1)]
]

/-- Partial product 804 for generator 9. -/
def ep_Q2_008_partial_09_0804 : Poly :=
[
  term ((-193419781321481949525 : Rat) / 11087303257826821744) [(2, 1), (5, 2), (16, 1)],
  term ((193419781321481949525 : Rat) / 22174606515653643488) [(5, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 804 for generator 9. -/
theorem ep_Q2_008_partial_09_0804_valid :
    mulPoly ep_Q2_008_coefficient_09_0804
        ep_Q2_008_generator_09_0800_0899 =
      ep_Q2_008_partial_09_0804 := by
  native_decide

/-- Coefficient term 805 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0805 : Poly :=
[
  term ((99820336097602864299818897822793600 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 805 for generator 9. -/
def ep_Q2_008_partial_09_0805 : Poly :=
[
  term ((199640672195205728599637795645587200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-99820336097602864299818897822793600 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 805 for generator 9. -/
theorem ep_Q2_008_partial_09_0805_valid :
    mulPoly ep_Q2_008_coefficient_09_0805
        ep_Q2_008_generator_09_0800_0899 =
      ep_Q2_008_partial_09_0805 := by
  native_decide

/-- Coefficient term 806 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0806 : Poly :=
[
  term ((1459755941057526492 : Rat) / 692956453614176359) [(6, 1), (7, 1), (9, 1), (13, 2), (16, 1)]
]

/-- Partial product 806 for generator 9. -/
def ep_Q2_008_partial_09_0806 : Poly :=
[
  term ((2919511882115052984 : Rat) / 692956453614176359) [(2, 1), (6, 1), (7, 1), (9, 1), (13, 2), (16, 1)],
  term ((-1459755941057526492 : Rat) / 692956453614176359) [(6, 1), (7, 1), (9, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 806 for generator 9. -/
theorem ep_Q2_008_partial_09_0806_valid :
    mulPoly ep_Q2_008_coefficient_09_0806
        ep_Q2_008_generator_09_0800_0899 =
      ep_Q2_008_partial_09_0806 := by
  native_decide

/-- Coefficient term 807 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0807 : Poly :=
[
  term ((29493883540250111402450771946087168000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (9, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 807 for generator 9. -/
def ep_Q2_008_partial_09_0807 : Poly :=
[
  term ((58987767080500222804901543892174336000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 1), (9, 1), (13, 3), (15, 1), (16, 1)],
  term ((-29493883540250111402450771946087168000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (9, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 807 for generator 9. -/
theorem ep_Q2_008_partial_09_0807_valid :
    mulPoly ep_Q2_008_coefficient_09_0807
        ep_Q2_008_generator_09_0800_0899 =
      ep_Q2_008_partial_09_0807 := by
  native_decide

/-- Coefficient term 808 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0808 : Poly :=
[
  term ((23820232855230000 : Rat) / 692956453614176359) [(6, 1), (7, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 808 for generator 9. -/
def ep_Q2_008_partial_09_0808 : Poly :=
[
  term ((47640465710460000 : Rat) / 692956453614176359) [(2, 1), (6, 1), (7, 1), (10, 1), (11, 1), (16, 1)],
  term ((-23820232855230000 : Rat) / 692956453614176359) [(6, 1), (7, 1), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 808 for generator 9. -/
theorem ep_Q2_008_partial_09_0808_valid :
    mulPoly ep_Q2_008_coefficient_09_0808
        ep_Q2_008_generator_09_0800_0899 =
      ep_Q2_008_partial_09_0808 := by
  native_decide

/-- Coefficient term 809 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0809 : Poly :=
[
  term ((2066776830632508044696672082234101782056000 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (7, 1), (10, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 809 for generator 9. -/
def ep_Q2_008_partial_09_0809 : Poly :=
[
  term ((4133553661265016089393344164468203564112000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (7, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2066776830632508044696672082234101782056000 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (7, 1), (10, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 809 for generator 9. -/
theorem ep_Q2_008_partial_09_0809_valid :
    mulPoly ep_Q2_008_coefficient_09_0809
        ep_Q2_008_generator_09_0800_0899 =
      ep_Q2_008_partial_09_0809 := by
  native_decide

/-- Coefficient term 810 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0810 : Poly :=
[
  term ((-9261306534113424000 : Rat) / 692956453614176359) [(6, 1), (7, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 810 for generator 9. -/
def ep_Q2_008_partial_09_0810 : Poly :=
[
  term ((-18522613068226848000 : Rat) / 692956453614176359) [(2, 1), (6, 1), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((9261306534113424000 : Rat) / 692956453614176359) [(6, 1), (7, 1), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 810 for generator 9. -/
theorem ep_Q2_008_partial_09_0810_valid :
    mulPoly ep_Q2_008_coefficient_09_0810
        ep_Q2_008_generator_09_0800_0899 =
      ep_Q2_008_partial_09_0810 := by
  native_decide

/-- Coefficient term 811 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0811 : Poly :=
[
  term ((41019583372568435225665280457310267554975 : Rat) / 168707601851329515375740828258983054697998) [(6, 1), (7, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 811 for generator 9. -/
def ep_Q2_008_partial_09_0811 : Poly :=
[
  term ((41019583372568435225665280457310267554975 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-41019583372568435225665280457310267554975 : Rat) / 168707601851329515375740828258983054697998) [(6, 1), (7, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 811 for generator 9. -/
theorem ep_Q2_008_partial_09_0811_valid :
    mulPoly ep_Q2_008_coefficient_09_0811
        ep_Q2_008_generator_09_0800_0899 =
      ep_Q2_008_partial_09_0811 := by
  native_decide

/-- Coefficient term 812 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0812 : Poly :=
[
  term ((-4097778927515857893794044667679356716800 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 812 for generator 9. -/
def ep_Q2_008_partial_09_0812 : Poly :=
[
  term ((-8195557855031715787588089335358713433600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((4097778927515857893794044667679356716800 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 812 for generator 9. -/
theorem ep_Q2_008_partial_09_0812_valid :
    mulPoly ep_Q2_008_coefficient_09_0812
        ep_Q2_008_generator_09_0800_0899 =
      ep_Q2_008_partial_09_0812 := by
  native_decide

/-- Coefficient term 813 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0813 : Poly :=
[
  term ((8195557855031715787588089335358713433600 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (7, 1), (11, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 813 for generator 9. -/
def ep_Q2_008_partial_09_0813 : Poly :=
[
  term ((16391115710063431575176178670717426867200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (7, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-8195557855031715787588089335358713433600 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (7, 1), (11, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 813 for generator 9. -/
theorem ep_Q2_008_partial_09_0813_valid :
    mulPoly ep_Q2_008_coefficient_09_0813
        ep_Q2_008_generator_09_0800_0899 =
      ep_Q2_008_partial_09_0813 := by
  native_decide

/-- Coefficient term 814 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0814 : Poly :=
[
  term ((47645537137392240000 : Rat) / 692956453614176359) [(6, 1), (7, 1), (11, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 814 for generator 9. -/
def ep_Q2_008_partial_09_0814 : Poly :=
[
  term ((95291074274784480000 : Rat) / 692956453614176359) [(2, 1), (6, 1), (7, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-47645537137392240000 : Rat) / 692956453614176359) [(6, 1), (7, 1), (11, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 814 for generator 9. -/
theorem ep_Q2_008_partial_09_0814_valid :
    mulPoly ep_Q2_008_coefficient_09_0814
        ep_Q2_008_generator_09_0800_0899 =
      ep_Q2_008_partial_09_0814 := by
  native_decide

/-- Coefficient term 815 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0815 : Poly :=
[
  term ((-23822768568696120000 : Rat) / 692956453614176359) [(6, 1), (7, 1), (11, 1), (13, 2), (16, 1)]
]

/-- Partial product 815 for generator 9. -/
def ep_Q2_008_partial_09_0815 : Poly :=
[
  term ((-47645537137392240000 : Rat) / 692956453614176359) [(2, 1), (6, 1), (7, 1), (11, 1), (13, 2), (16, 1)],
  term ((23822768568696120000 : Rat) / 692956453614176359) [(6, 1), (7, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 815 for generator 9. -/
theorem ep_Q2_008_partial_09_0815_valid :
    mulPoly ep_Q2_008_coefficient_09_0815
        ep_Q2_008_generator_09_0800_0899 =
      ep_Q2_008_partial_09_0815 := by
  native_decide

/-- Coefficient term 816 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0816 : Poly :=
[
  term ((-1972163407581095678179970936887570176000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 816 for generator 9. -/
def ep_Q2_008_partial_09_0816 : Poly :=
[
  term ((-3944326815162191356359941873775140352000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((1972163407581095678179970936887570176000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 816 for generator 9. -/
theorem ep_Q2_008_partial_09_0816_valid :
    mulPoly ep_Q2_008_coefficient_09_0816
        ep_Q2_008_generator_09_0800_0899 =
      ep_Q2_008_partial_09_0816 := by
  native_decide

/-- Coefficient term 817 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0817 : Poly :=
[
  term ((3944326815162191356359941873775140352000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (11, 1), (13, 3), (15, 3), (16, 1)]
]

/-- Partial product 817 for generator 9. -/
def ep_Q2_008_partial_09_0817 : Poly :=
[
  term ((7888653630324382712719883747550280704000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 1), (11, 1), (13, 3), (15, 3), (16, 1)],
  term ((-3944326815162191356359941873775140352000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (11, 1), (13, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 817 for generator 9. -/
theorem ep_Q2_008_partial_09_0817_valid :
    mulPoly ep_Q2_008_coefficient_09_0817
        ep_Q2_008_generator_09_0800_0899 =
      ep_Q2_008_partial_09_0817 := by
  native_decide

/-- Coefficient term 818 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0818 : Poly :=
[
  term ((-25891905370046625 : Rat) / 692956453614176359) [(6, 1), (7, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 818 for generator 9. -/
def ep_Q2_008_partial_09_0818 : Poly :=
[
  term ((-51783810740093250 : Rat) / 692956453614176359) [(2, 1), (6, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((25891905370046625 : Rat) / 692956453614176359) [(6, 1), (7, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 818 for generator 9. -/
theorem ep_Q2_008_partial_09_0818_valid :
    mulPoly ep_Q2_008_coefficient_09_0818
        ep_Q2_008_generator_09_0800_0899 =
      ep_Q2_008_partial_09_0818 := by
  native_decide

/-- Coefficient term 819 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0819 : Poly :=
[
  term ((61622254652891625 : Rat) / 1385912907228352718) [(6, 1), (7, 1), (11, 1), (16, 1)]
]

/-- Partial product 819 for generator 9. -/
def ep_Q2_008_partial_09_0819 : Poly :=
[
  term ((61622254652891625 : Rat) / 692956453614176359) [(2, 1), (6, 1), (7, 1), (11, 1), (16, 1)],
  term ((-61622254652891625 : Rat) / 1385912907228352718) [(6, 1), (7, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 819 for generator 9. -/
theorem ep_Q2_008_partial_09_0819_valid :
    mulPoly ep_Q2_008_coefficient_09_0819
        ep_Q2_008_generator_09_0800_0899 =
      ep_Q2_008_partial_09_0819 := by
  native_decide

/-- Coefficient term 820 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0820 : Poly :=
[
  term ((1264150836327667986876985814707056000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 820 for generator 9. -/
def ep_Q2_008_partial_09_0820 : Poly :=
[
  term ((2528301672655335973753971629414112000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1264150836327667986876985814707056000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 820 for generator 9. -/
theorem ep_Q2_008_partial_09_0820_valid :
    mulPoly ep_Q2_008_coefficient_09_0820
        ep_Q2_008_generator_09_0800_0899 =
      ep_Q2_008_partial_09_0820 := by
  native_decide

/-- Coefficient term 821 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0821 : Poly :=
[
  term ((729877970528763246 : Rat) / 692956453614176359) [(6, 1), (7, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 821 for generator 9. -/
def ep_Q2_008_partial_09_0821 : Poly :=
[
  term ((1459755941057526492 : Rat) / 692956453614176359) [(2, 1), (6, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-729877970528763246 : Rat) / 692956453614176359) [(6, 1), (7, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 821 for generator 9. -/
theorem ep_Q2_008_partial_09_0821_valid :
    mulPoly ep_Q2_008_coefficient_09_0821
        ep_Q2_008_generator_09_0800_0899 =
      ep_Q2_008_partial_09_0821 := by
  native_decide

/-- Coefficient term 822 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0822 : Poly :=
[
  term ((-43996472921703812031410618224399611599703 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 822 for generator 9. -/
def ep_Q2_008_partial_09_0822 : Poly :=
[
  term ((-87992945843407624062821236448799223199406 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((43996472921703812031410618224399611599703 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 822 for generator 9. -/
theorem ep_Q2_008_partial_09_0822_valid :
    mulPoly ep_Q2_008_coefficient_09_0822
        ep_Q2_008_generator_09_0800_0899 =
      ep_Q2_008_partial_09_0822 := by
  native_decide

/-- Coefficient term 823 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0823 : Poly :=
[
  term ((-7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (12, 1), (13, 3), (15, 2), (16, 1)]
]

/-- Partial product 823 for generator 9. -/
def ep_Q2_008_partial_09_0823 : Poly :=
[
  term ((-14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 1), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (12, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 823 for generator 9. -/
theorem ep_Q2_008_partial_09_0823_valid :
    mulPoly ep_Q2_008_coefficient_09_0823
        ep_Q2_008_generator_09_0800_0899 =
      ep_Q2_008_partial_09_0823 := by
  native_decide

/-- Coefficient term 824 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0824 : Poly :=
[
  term ((-345935536652302900666016218830948341494893 : Rat) / 168707601851329515375740828258983054697998) [(6, 1), (7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 824 for generator 9. -/
def ep_Q2_008_partial_09_0824 : Poly :=
[
  term ((-345935536652302900666016218830948341494893 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((345935536652302900666016218830948341494893 : Rat) / 168707601851329515375740828258983054697998) [(6, 1), (7, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 824 for generator 9. -/
theorem ep_Q2_008_partial_09_0824_valid :
    mulPoly ep_Q2_008_coefficient_09_0824
        ep_Q2_008_generator_09_0800_0899 =
      ep_Q2_008_partial_09_0824 := by
  native_decide

/-- Coefficient term 825 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0825 : Poly :=
[
  term ((-115879838885711032989770542268186400 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (12, 1), (15, 3), (16, 1)]
]

/-- Partial product 825 for generator 9. -/
def ep_Q2_008_partial_09_0825 : Poly :=
[
  term ((-231759677771422065979541084536372800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 1), (12, 1), (15, 3), (16, 1)],
  term ((115879838885711032989770542268186400 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 825 for generator 9. -/
theorem ep_Q2_008_partial_09_0825_valid :
    mulPoly ep_Q2_008_coefficient_09_0825
        ep_Q2_008_generator_09_0800_0899 =
      ep_Q2_008_partial_09_0825 := by
  native_decide

/-- Coefficient term 826 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0826 : Poly :=
[
  term ((-83569812482433840577978241849594802744693 : Rat) / 5817503512114810875025545802033898437862) [(6, 1), (7, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 826 for generator 9. -/
def ep_Q2_008_partial_09_0826 : Poly :=
[
  term ((-83569812482433840577978241849594802744693 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((83569812482433840577978241849594802744693 : Rat) / 5817503512114810875025545802033898437862) [(6, 1), (7, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 826 for generator 9. -/
theorem ep_Q2_008_partial_09_0826_valid :
    mulPoly ep_Q2_008_coefficient_09_0826
        ep_Q2_008_generator_09_0800_0899 =
      ep_Q2_008_partial_09_0826 := by
  native_decide

/-- Coefficient term 827 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0827 : Poly :=
[
  term ((-1496230256897973061559355235452652800 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (13, 1), (15, 4), (16, 1)]
]

/-- Partial product 827 for generator 9. -/
def ep_Q2_008_partial_09_0827 : Poly :=
[
  term ((-2992460513795946123118710470905305600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 1), (13, 1), (15, 4), (16, 1)],
  term ((1496230256897973061559355235452652800 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (13, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 827 for generator 9. -/
theorem ep_Q2_008_partial_09_0827_valid :
    mulPoly ep_Q2_008_coefficient_09_0827
        ep_Q2_008_generator_09_0800_0899 =
      ep_Q2_008_partial_09_0827 := by
  native_decide

/-- Coefficient term 828 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0828 : Poly :=
[
  term ((4926086726109605367 : Rat) / 692956453614176359) [(6, 1), (7, 1), (13, 1), (16, 1)]
]

/-- Partial product 828 for generator 9. -/
def ep_Q2_008_partial_09_0828 : Poly :=
[
  term ((9852173452219210734 : Rat) / 692956453614176359) [(2, 1), (6, 1), (7, 1), (13, 1), (16, 1)],
  term ((-4926086726109605367 : Rat) / 692956453614176359) [(6, 1), (7, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 828 for generator 9. -/
theorem ep_Q2_008_partial_09_0828_valid :
    mulPoly ep_Q2_008_coefficient_09_0828
        ep_Q2_008_generator_09_0800_0899 =
      ep_Q2_008_partial_09_0828 := by
  native_decide

/-- Coefficient term 829 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0829 : Poly :=
[
  term ((-301836908947873017917809159175902524751818 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (7, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 829 for generator 9. -/
def ep_Q2_008_partial_09_0829 : Poly :=
[
  term ((-603673817895746035835618318351805049503636 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((301836908947873017917809159175902524751818 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (7, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 829 for generator 9. -/
theorem ep_Q2_008_partial_09_0829_valid :
    mulPoly ep_Q2_008_coefficient_09_0829
        ep_Q2_008_generator_09_0800_0899 =
      ep_Q2_008_partial_09_0829 := by
  native_decide

/-- Coefficient term 830 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0830 : Poly :=
[
  term ((-374312896719822070265633487106795291753830 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (7, 1), (13, 2), (15, 3), (16, 1)]
]

/-- Partial product 830 for generator 9. -/
def ep_Q2_008_partial_09_0830 : Poly :=
[
  term ((-748625793439644140531266974213590583507660 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (7, 1), (13, 2), (15, 3), (16, 1)],
  term ((374312896719822070265633487106795291753830 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (7, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 830 for generator 9. -/
theorem ep_Q2_008_partial_09_0830_valid :
    mulPoly ep_Q2_008_coefficient_09_0830
        ep_Q2_008_generator_09_0800_0899 =
      ep_Q2_008_partial_09_0830 := by
  native_decide

/-- Coefficient term 831 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0831 : Poly :=
[
  term ((-44240825310375167103676157919130752000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (13, 3), (15, 2), (16, 1)]
]

/-- Partial product 831 for generator 9. -/
def ep_Q2_008_partial_09_0831 : Poly :=
[
  term ((-88481650620750334207352315838261504000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 1), (13, 3), (15, 2), (16, 1)],
  term ((44240825310375167103676157919130752000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 831 for generator 9. -/
theorem ep_Q2_008_partial_09_0831_valid :
    mulPoly ep_Q2_008_coefficient_09_0831
        ep_Q2_008_generator_09_0800_0899 =
      ep_Q2_008_partial_09_0831 := by
  native_decide

/-- Coefficient term 832 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0832 : Poly :=
[
  term ((-73734708850625278506126929865217920000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (13, 3), (15, 4), (16, 1)]
]

/-- Partial product 832 for generator 9. -/
def ep_Q2_008_partial_09_0832 : Poly :=
[
  term ((-147469417701250557012253859730435840000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 1), (13, 3), (15, 4), (16, 1)],
  term ((73734708850625278506126929865217920000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (13, 3), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 832 for generator 9. -/
theorem ep_Q2_008_partial_09_0832_valid :
    mulPoly ep_Q2_008_coefficient_09_0832
        ep_Q2_008_generator_09_0800_0899 =
      ep_Q2_008_partial_09_0832 := by
  native_decide

/-- Coefficient term 833 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0833 : Poly :=
[
  term ((-364938985264381623 : Rat) / 1385912907228352718) [(6, 1), (7, 1), (13, 3), (16, 1)]
]

/-- Partial product 833 for generator 9. -/
def ep_Q2_008_partial_09_0833 : Poly :=
[
  term ((-364938985264381623 : Rat) / 692956453614176359) [(2, 1), (6, 1), (7, 1), (13, 3), (16, 1)],
  term ((364938985264381623 : Rat) / 1385912907228352718) [(6, 1), (7, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 833 for generator 9. -/
theorem ep_Q2_008_partial_09_0833_valid :
    mulPoly ep_Q2_008_coefficient_09_0833
        ep_Q2_008_generator_09_0800_0899 =
      ep_Q2_008_partial_09_0833 := by
  native_decide

/-- Coefficient term 834 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0834 : Poly :=
[
  term ((-3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (13, 4), (15, 1), (16, 1)]
]

/-- Partial product 834 for generator 9. -/
def ep_Q2_008_partial_09_0834 : Poly :=
[
  term ((-7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 1), (13, 4), (15, 1), (16, 1)],
  term ((3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (13, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 834 for generator 9. -/
theorem ep_Q2_008_partial_09_0834_valid :
    mulPoly ep_Q2_008_coefficient_09_0834
        ep_Q2_008_generator_09_0800_0899 =
      ep_Q2_008_partial_09_0834 := by
  native_decide

/-- Coefficient term 835 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0835 : Poly :=
[
  term ((323572082096977883074163638367949169038219 : Rat) / 168707601851329515375740828258983054697998) [(6, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 835 for generator 9. -/
def ep_Q2_008_partial_09_0835 : Poly :=
[
  term ((323572082096977883074163638367949169038219 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-323572082096977883074163638367949169038219 : Rat) / 168707601851329515375740828258983054697998) [(6, 1), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 835 for generator 9. -/
theorem ep_Q2_008_partial_09_0835_valid :
    mulPoly ep_Q2_008_coefficient_09_0835
        ep_Q2_008_generator_09_0800_0899 =
      ep_Q2_008_partial_09_0835 := by
  native_decide

/-- Coefficient term 836 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0836 : Poly :=
[
  term ((-277931547413642671039706101518918024700789 : Rat) / 168707601851329515375740828258983054697998) [(6, 1), (7, 1), (15, 3), (16, 1)]
]

/-- Partial product 836 for generator 9. -/
def ep_Q2_008_partial_09_0836 : Poly :=
[
  term ((-277931547413642671039706101518918024700789 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (7, 1), (15, 3), (16, 1)],
  term ((277931547413642671039706101518918024700789 : Rat) / 168707601851329515375740828258983054697998) [(6, 1), (7, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 836 for generator 9. -/
theorem ep_Q2_008_partial_09_0836_valid :
    mulPoly ep_Q2_008_coefficient_09_0836
        ep_Q2_008_generator_09_0800_0899 =
      ep_Q2_008_partial_09_0836 := by
  native_decide

/-- Coefficient term 837 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0837 : Poly :=
[
  term ((812294800564430025004231306094284800 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (9, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 837 for generator 9. -/
def ep_Q2_008_partial_09_0837 : Poly :=
[
  term ((1624589601128860050008462612188569600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 2), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-812294800564430025004231306094284800 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (9, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 837 for generator 9. -/
theorem ep_Q2_008_partial_09_0837_valid :
    mulPoly ep_Q2_008_coefficient_09_0837
        ep_Q2_008_generator_09_0800_0899 =
      ep_Q2_008_partial_09_0837 := by
  native_decide

/-- Coefficient term 838 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0838 : Poly :=
[
  term ((406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 838 for generator 9. -/
def ep_Q2_008_partial_09_0838 : Poly :=
[
  term ((812294800564430025004231306094284800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 838 for generator 9. -/
theorem ep_Q2_008_partial_09_0838_valid :
    mulPoly ep_Q2_008_coefficient_09_0838
        ep_Q2_008_generator_09_0800_0899 =
      ep_Q2_008_partial_09_0838 := by
  native_decide

/-- Coefficient term 839 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0839 : Poly :=
[
  term ((-203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (12, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 839 for generator 9. -/
def ep_Q2_008_partial_09_0839 : Poly :=
[
  term ((-406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 2), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (12, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 839 for generator 9. -/
theorem ep_Q2_008_partial_09_0839_valid :
    mulPoly ep_Q2_008_coefficient_09_0839
        ep_Q2_008_generator_09_0800_0899 =
      ep_Q2_008_partial_09_0839 := by
  native_decide

/-- Coefficient term 840 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0840 : Poly :=
[
  term ((19399973608017496453710841157548800 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 840 for generator 9. -/
def ep_Q2_008_partial_09_0840 : Poly :=
[
  term ((38799947216034992907421682315097600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 2), (12, 1), (15, 2), (16, 1)],
  term ((-19399973608017496453710841157548800 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 840 for generator 9. -/
theorem ep_Q2_008_partial_09_0840_valid :
    mulPoly ep_Q2_008_coefficient_09_0840
        ep_Q2_008_generator_09_0800_0899 =
      ep_Q2_008_partial_09_0840 := by
  native_decide

/-- Coefficient term 841 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0841 : Poly :=
[
  term ((-1110716925237008210679761545774099200 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 841 for generator 9. -/
def ep_Q2_008_partial_09_0841 : Poly :=
[
  term ((-2221433850474016421359523091548198400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((1110716925237008210679761545774099200 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 841 for generator 9. -/
theorem ep_Q2_008_partial_09_0841_valid :
    mulPoly ep_Q2_008_coefficient_09_0841
        ep_Q2_008_generator_09_0800_0899 =
      ep_Q2_008_partial_09_0841 := by
  native_decide

/-- Coefficient term 842 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0842 : Poly :=
[
  term ((2037760123940926411562176106182176000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 842 for generator 9. -/
def ep_Q2_008_partial_09_0842 : Poly :=
[
  term ((4075520247881852823124352212364352000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 2), (13, 1), (15, 3), (16, 1)],
  term ((-2037760123940926411562176106182176000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 842 for generator 9. -/
theorem ep_Q2_008_partial_09_0842_valid :
    mulPoly ep_Q2_008_coefficient_09_0842
        ep_Q2_008_generator_09_0800_0899 =
      ep_Q2_008_partial_09_0842 := by
  native_decide

/-- Coefficient term 843 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0843 : Poly :=
[
  term ((444206007506549833761373860114363653968230 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (7, 2), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 843 for generator 9. -/
def ep_Q2_008_partial_09_0843 : Poly :=
[
  term ((888412015013099667522747720228727307936460 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (7, 2), (13, 2), (15, 2), (16, 1)],
  term ((-444206007506549833761373860114363653968230 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (7, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 843 for generator 9. -/
theorem ep_Q2_008_partial_09_0843_valid :
    mulPoly ep_Q2_008_coefficient_09_0843
        ep_Q2_008_generator_09_0800_0899 =
      ep_Q2_008_partial_09_0843 := by
  native_decide

/-- Coefficient term 844 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0844 : Poly :=
[
  term ((-2030737001411075062510578265235712000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (13, 2), (15, 4), (16, 1)]
]

/-- Partial product 844 for generator 9. -/
def ep_Q2_008_partial_09_0844 : Poly :=
[
  term ((-4061474002822150125021156530471424000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 2), (13, 2), (15, 4), (16, 1)],
  term ((2030737001411075062510578265235712000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (13, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 844 for generator 9. -/
theorem ep_Q2_008_partial_09_0844_valid :
    mulPoly ep_Q2_008_coefficient_09_0844
        ep_Q2_008_generator_09_0800_0899 =
      ep_Q2_008_partial_09_0844 := by
  native_decide

/-- Coefficient term 845 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0845 : Poly :=
[
  term ((-1824694926321908115 : Rat) / 692956453614176359) [(6, 1), (7, 2), (13, 2), (16, 1)]
]

/-- Partial product 845 for generator 9. -/
def ep_Q2_008_partial_09_0845 : Poly :=
[
  term ((-3649389852643816230 : Rat) / 692956453614176359) [(2, 1), (6, 1), (7, 2), (13, 2), (16, 1)],
  term ((1824694926321908115 : Rat) / 692956453614176359) [(6, 1), (7, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 845 for generator 9. -/
theorem ep_Q2_008_partial_09_0845_valid :
    mulPoly ep_Q2_008_coefficient_09_0845
        ep_Q2_008_generator_09_0800_0899 =
      ep_Q2_008_partial_09_0845 := by
  native_decide

/-- Coefficient term 846 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0846 : Poly :=
[
  term ((-36968891275383193006188993845870745600 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 846 for generator 9. -/
def ep_Q2_008_partial_09_0846 : Poly :=
[
  term ((-73937782550766386012377987691741491200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 2), (13, 3), (15, 1), (16, 1)],
  term ((36968891275383193006188993845870745600 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 846 for generator 9. -/
theorem ep_Q2_008_partial_09_0846_valid :
    mulPoly ep_Q2_008_coefficient_09_0846
        ep_Q2_008_generator_09_0800_0899 =
      ep_Q2_008_partial_09_0846 := by
  native_decide

/-- Coefficient term 847 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0847 : Poly :=
[
  term ((73734708850625278506126929865217920000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (13, 3), (15, 3), (16, 1)]
]

/-- Partial product 847 for generator 9. -/
def ep_Q2_008_partial_09_0847 : Poly :=
[
  term ((147469417701250557012253859730435840000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 2), (13, 3), (15, 3), (16, 1)],
  term ((-73734708850625278506126929865217920000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (13, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 847 for generator 9. -/
theorem ep_Q2_008_partial_09_0847_valid :
    mulPoly ep_Q2_008_coefficient_09_0847
        ep_Q2_008_generator_09_0800_0899 =
      ep_Q2_008_partial_09_0847 := by
  native_decide

/-- Coefficient term 848 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0848 : Poly :=
[
  term ((197160899881750526107529996477227415923189 : Rat) / 168707601851329515375740828258983054697998) [(6, 1), (7, 2), (15, 2), (16, 1)]
]

/-- Partial product 848 for generator 9. -/
def ep_Q2_008_partial_09_0848 : Poly :=
[
  term ((197160899881750526107529996477227415923189 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (7, 2), (15, 2), (16, 1)],
  term ((-197160899881750526107529996477227415923189 : Rat) / 168707601851329515375740828258983054697998) [(6, 1), (7, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 848 for generator 9. -/
theorem ep_Q2_008_partial_09_0848_valid :
    mulPoly ep_Q2_008_coefficient_09_0848
        ep_Q2_008_generator_09_0800_0899 =
      ep_Q2_008_partial_09_0848 := by
  native_decide

/-- Coefficient term 849 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0849 : Poly :=
[
  term ((-18794145146976006279930835708492800 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (15, 4), (16, 1)]
]

/-- Partial product 849 for generator 9. -/
def ep_Q2_008_partial_09_0849 : Poly :=
[
  term ((-37588290293952012559861671416985600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 2), (15, 4), (16, 1)],
  term ((18794145146976006279930835708492800 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 849 for generator 9. -/
theorem ep_Q2_008_partial_09_0849_valid :
    mulPoly ep_Q2_008_coefficient_09_0849
        ep_Q2_008_generator_09_0800_0899 =
      ep_Q2_008_partial_09_0849 := by
  native_decide

/-- Coefficient term 850 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0850 : Poly :=
[
  term ((-1619646487561852949 : Rat) / 2771825814456705436) [(6, 1), (7, 2), (16, 1)]
]

/-- Partial product 850 for generator 9. -/
def ep_Q2_008_partial_09_0850 : Poly :=
[
  term ((-1619646487561852949 : Rat) / 1385912907228352718) [(2, 1), (6, 1), (7, 2), (16, 1)],
  term ((1619646487561852949 : Rat) / 2771825814456705436) [(6, 1), (7, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 850 for generator 9. -/
theorem ep_Q2_008_partial_09_0850_valid :
    mulPoly ep_Q2_008_coefficient_09_0850
        ep_Q2_008_generator_09_0800_0899 =
      ep_Q2_008_partial_09_0850 := by
  native_decide

/-- Coefficient term 851 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0851 : Poly :=
[
  term ((-1015368500705537531255289132617856000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 3), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 851 for generator 9. -/
def ep_Q2_008_partial_09_0851 : Poly :=
[
  term ((-2030737001411075062510578265235712000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 3), (13, 2), (15, 1), (16, 1)],
  term ((1015368500705537531255289132617856000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 3), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 851 for generator 9. -/
theorem ep_Q2_008_partial_09_0851_valid :
    mulPoly ep_Q2_008_coefficient_09_0851
        ep_Q2_008_generator_09_0800_0899 =
      ep_Q2_008_partial_09_0851 := by
  native_decide

/-- Coefficient term 852 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0852 : Poly :=
[
  term ((2030737001411075062510578265235712000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 3), (13, 2), (15, 3), (16, 1)]
]

/-- Partial product 852 for generator 9. -/
def ep_Q2_008_partial_09_0852 : Poly :=
[
  term ((4061474002822150125021156530471424000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 3), (13, 2), (15, 3), (16, 1)],
  term ((-2030737001411075062510578265235712000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 3), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 852 for generator 9. -/
theorem ep_Q2_008_partial_09_0852_valid :
    mulPoly ep_Q2_008_coefficient_09_0852
        ep_Q2_008_generator_09_0800_0899 =
      ep_Q2_008_partial_09_0852 := by
  native_decide

/-- Coefficient term 853 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0853 : Poly :=
[
  term ((-9397072573488003139965417854246400 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 3), (15, 1), (16, 1)]
]

/-- Partial product 853 for generator 9. -/
def ep_Q2_008_partial_09_0853 : Poly :=
[
  term ((-18794145146976006279930835708492800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 3), (15, 1), (16, 1)],
  term ((9397072573488003139965417854246400 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 853 for generator 9. -/
theorem ep_Q2_008_partial_09_0853_valid :
    mulPoly ep_Q2_008_coefficient_09_0853
        ep_Q2_008_generator_09_0800_0899 =
      ep_Q2_008_partial_09_0853 := by
  native_decide

/-- Coefficient term 854 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0854 : Poly :=
[
  term ((18794145146976006279930835708492800 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 3), (15, 3), (16, 1)]
]

/-- Partial product 854 for generator 9. -/
def ep_Q2_008_partial_09_0854 : Poly :=
[
  term ((37588290293952012559861671416985600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 3), (15, 3), (16, 1)],
  term ((-18794145146976006279930835708492800 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 854 for generator 9. -/
theorem ep_Q2_008_partial_09_0854_valid :
    mulPoly ep_Q2_008_coefficient_09_0854
        ep_Q2_008_generator_09_0800_0899 =
      ep_Q2_008_partial_09_0854 := by
  native_decide

/-- Coefficient term 855 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0855 : Poly :=
[
  term ((6945979900585068000 : Rat) / 692956453614176359) [(6, 1), (9, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 855 for generator 9. -/
def ep_Q2_008_partial_09_0855 : Poly :=
[
  term ((13891959801170136000 : Rat) / 692956453614176359) [(2, 1), (6, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-6945979900585068000 : Rat) / 692956453614176359) [(6, 1), (9, 1), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 855 for generator 9. -/
theorem ep_Q2_008_partial_09_0855_valid :
    mulPoly ep_Q2_008_coefficient_09_0855
        ep_Q2_008_generator_09_0800_0899 =
      ep_Q2_008_partial_09_0855 := by
  native_decide

/-- Coefficient term 856 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0856 : Poly :=
[
  term ((2343133172956448821031328838872771360000 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 856 for generator 9. -/
def ep_Q2_008_partial_09_0856 : Poly :=
[
  term ((4686266345912897642062657677745542720000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2343133172956448821031328838872771360000 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 856 for generator 9. -/
theorem ep_Q2_008_partial_09_0856_valid :
    mulPoly ep_Q2_008_coefficient_09_0856
        ep_Q2_008_generator_09_0800_0899 =
      ep_Q2_008_partial_09_0856 := by
  native_decide

/-- Coefficient term 857 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0857 : Poly :=
[
  term ((19058214854956896000 : Rat) / 692956453614176359) [(6, 1), (9, 1), (11, 1), (13, 2), (16, 1)]
]

/-- Partial product 857 for generator 9. -/
def ep_Q2_008_partial_09_0857 : Poly :=
[
  term ((38116429709913792000 : Rat) / 692956453614176359) [(2, 1), (6, 1), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((-19058214854956896000 : Rat) / 692956453614176359) [(6, 1), (9, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 857 for generator 9. -/
theorem ep_Q2_008_partial_09_0857_valid :
    mulPoly ep_Q2_008_coefficient_09_0857
        ep_Q2_008_generator_09_0800_0899 =
      ep_Q2_008_partial_09_0857 := by
  native_decide

/-- Coefficient term 858 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0858 : Poly :=
[
  term ((1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (9, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 858 for generator 9. -/
def ep_Q2_008_partial_09_0858 : Poly :=
[
  term ((3155461452129753085087953499020112281600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (9, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((-1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (9, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 858 for generator 9. -/
theorem ep_Q2_008_partial_09_0858_valid :
    mulPoly ep_Q2_008_coefficient_09_0858
        ep_Q2_008_generator_09_0800_0899 =
      ep_Q2_008_partial_09_0858 := by
  native_decide

/-- Coefficient term 859 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0859 : Poly :=
[
  term ((-389161661601209625 : Rat) / 1385912907228352718) [(6, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 859 for generator 9. -/
def ep_Q2_008_partial_09_0859 : Poly :=
[
  term ((-389161661601209625 : Rat) / 692956453614176359) [(2, 1), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((389161661601209625 : Rat) / 1385912907228352718) [(6, 1), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 859 for generator 9. -/
theorem ep_Q2_008_partial_09_0859_valid :
    mulPoly ep_Q2_008_coefficient_09_0859
        ep_Q2_008_generator_09_0800_0899 =
      ep_Q2_008_partial_09_0859 := by
  native_decide

/-- Coefficient term 860 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0860 : Poly :=
[
  term ((21935045861953702780443915773903649060600 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 860 for generator 9. -/
def ep_Q2_008_partial_09_0860 : Poly :=
[
  term ((43870091723907405560887831547807298121200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-21935045861953702780443915773903649060600 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 860 for generator 9. -/
theorem ep_Q2_008_partial_09_0860_valid :
    mulPoly ep_Q2_008_coefficient_09_0860
        ep_Q2_008_generator_09_0800_0899 =
      ep_Q2_008_partial_09_0860 := by
  native_decide

/-- Coefficient term 861 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0861 : Poly :=
[
  term ((32572494933782739950872616953214592000 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (9, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 861 for generator 9. -/
def ep_Q2_008_partial_09_0861 : Poly :=
[
  term ((65144989867565479901745233906429184000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-32572494933782739950872616953214592000 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (9, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 861 for generator 9. -/
theorem ep_Q2_008_partial_09_0861_valid :
    mulPoly ep_Q2_008_coefficient_09_0861
        ep_Q2_008_generator_09_0800_0899 =
      ep_Q2_008_partial_09_0861 := by
  native_decide

/-- Coefficient term 862 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0862 : Poly :=
[
  term ((-19693427191886127405 : Rat) / 1385912907228352718) [(6, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 862 for generator 9. -/
def ep_Q2_008_partial_09_0862 : Poly :=
[
  term ((-19693427191886127405 : Rat) / 692956453614176359) [(2, 1), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((19693427191886127405 : Rat) / 1385912907228352718) [(6, 1), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 862 for generator 9. -/
theorem ep_Q2_008_partial_09_0862_valid :
    mulPoly ep_Q2_008_coefficient_09_0862
        ep_Q2_008_generator_09_0800_0899 =
      ep_Q2_008_partial_09_0862 := by
  native_decide

/-- Coefficient term 863 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0863 : Poly :=
[
  term ((25124733538268943676526801496260805484800 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (9, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 863 for generator 9. -/
def ep_Q2_008_partial_09_0863 : Poly :=
[
  term ((50249467076537887353053602992521610969600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-25124733538268943676526801496260805484800 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (9, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 863 for generator 9. -/
theorem ep_Q2_008_partial_09_0863_valid :
    mulPoly ep_Q2_008_coefficient_09_0863
        ep_Q2_008_generator_09_0800_0899 =
      ep_Q2_008_partial_09_0863 := by
  native_decide

/-- Coefficient term 864 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0864 : Poly :=
[
  term ((-28687153619832789607509120323438817826650 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 864 for generator 9. -/
def ep_Q2_008_partial_09_0864 : Poly :=
[
  term ((-57374307239665579215018240646877635653300 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((28687153619832789607509120323438817826650 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 864 for generator 9. -/
theorem ep_Q2_008_partial_09_0864_valid :
    mulPoly ep_Q2_008_coefficient_09_0864
        ep_Q2_008_generator_09_0800_0899 =
      ep_Q2_008_partial_09_0864 := by
  native_decide

/-- Coefficient term 865 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0865 : Poly :=
[
  term ((28846363500271414583324654520080066810400 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (9, 1), (15, 3), (16, 1)]
]

/-- Partial product 865 for generator 9. -/
def ep_Q2_008_partial_09_0865 : Poly :=
[
  term ((57692727000542829166649309040160133620800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (9, 1), (15, 3), (16, 1)],
  term ((-28846363500271414583324654520080066810400 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 865 for generator 9. -/
theorem ep_Q2_008_partial_09_0865_valid :
    mulPoly ep_Q2_008_coefficient_09_0865
        ep_Q2_008_generator_09_0800_0899 =
      ep_Q2_008_partial_09_0865 := by
  native_decide

/-- Coefficient term 866 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0866 : Poly :=
[
  term ((39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (9, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 866 for generator 9. -/
def ep_Q2_008_partial_09_0866 : Poly :=
[
  term ((78173987841078575882094280687715020800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 866 for generator 9. -/
theorem ep_Q2_008_partial_09_0866_valid :
    mulPoly ep_Q2_008_coefficient_09_0866
        ep_Q2_008_generator_09_0800_0899 =
      ep_Q2_008_partial_09_0866 := by
  native_decide

/-- Coefficient term 867 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0867 : Poly :=
[
  term ((-70324786932212700 : Rat) / 692956453614176359) [(6, 1), (9, 2), (16, 1)]
]

/-- Partial product 867 for generator 9. -/
def ep_Q2_008_partial_09_0867 : Poly :=
[
  term ((-140649573864425400 : Rat) / 692956453614176359) [(2, 1), (6, 1), (9, 2), (16, 1)],
  term ((70324786932212700 : Rat) / 692956453614176359) [(6, 1), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 867 for generator 9. -/
theorem ep_Q2_008_partial_09_0867_valid :
    mulPoly ep_Q2_008_coefficient_09_0867
        ep_Q2_008_generator_09_0800_0899 =
      ep_Q2_008_partial_09_0867 := by
  native_decide

/-- Coefficient term 868 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0868 : Poly :=
[
  term ((-2315326633528356000 : Rat) / 692956453614176359) [(6, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 868 for generator 9. -/
def ep_Q2_008_partial_09_0868 : Poly :=
[
  term ((-4630653267056712000 : Rat) / 692956453614176359) [(2, 1), (6, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((2315326633528356000 : Rat) / 692956453614176359) [(6, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 868 for generator 9. -/
theorem ep_Q2_008_partial_09_0868_valid :
    mulPoly ep_Q2_008_coefficient_09_0868
        ep_Q2_008_generator_09_0800_0899 =
      ep_Q2_008_partial_09_0868 := by
  native_decide

/-- Coefficient term 869 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0869 : Poly :=
[
  term ((5788316583820890000 : Rat) / 692956453614176359) [(6, 1), (10, 1), (12, 1), (16, 1)]
]

/-- Partial product 869 for generator 9. -/
def ep_Q2_008_partial_09_0869 : Poly :=
[
  term ((11576633167641780000 : Rat) / 692956453614176359) [(2, 1), (6, 1), (10, 1), (12, 1), (16, 1)],
  term ((-5788316583820890000 : Rat) / 692956453614176359) [(6, 1), (10, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 869 for generator 9. -/
theorem ep_Q2_008_partial_09_0869_valid :
    mulPoly ep_Q2_008_coefficient_09_0869
        ep_Q2_008_generator_09_0800_0899 =
      ep_Q2_008_partial_09_0869 := by
  native_decide

/-- Coefficient term 870 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0870 : Poly :=
[
  term ((-10804857623132328000 : Rat) / 692956453614176359) [(6, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 870 for generator 9. -/
def ep_Q2_008_partial_09_0870 : Poly :=
[
  term ((-21609715246264656000 : Rat) / 692956453614176359) [(2, 1), (6, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((10804857623132328000 : Rat) / 692956453614176359) [(6, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 870 for generator 9. -/
theorem ep_Q2_008_partial_09_0870_valid :
    mulPoly ep_Q2_008_coefficient_09_0870
        ep_Q2_008_generator_09_0800_0899 =
      ep_Q2_008_partial_09_0870 := by
  native_decide

/-- Coefficient term 871 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0871 : Poly :=
[
  term ((-2067591143005852613195443897657932146856000 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (10, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 871 for generator 9. -/
def ep_Q2_008_partial_09_0871 : Poly :=
[
  term ((-4135182286011705226390887795315864293712000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((2067591143005852613195443897657932146856000 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (10, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 871 for generator 9. -/
theorem ep_Q2_008_partial_09_0871_valid :
    mulPoly ep_Q2_008_coefficient_09_0871
        ep_Q2_008_generator_09_0800_0899 =
      ep_Q2_008_partial_09_0871 := by
  native_decide

/-- Coefficient term 872 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0872 : Poly :=
[
  term ((-1157663316764178000 : Rat) / 692956453614176359) [(6, 1), (10, 1), (13, 2), (16, 1)]
]

/-- Partial product 872 for generator 9. -/
def ep_Q2_008_partial_09_0872 : Poly :=
[
  term ((-2315326633528356000 : Rat) / 692956453614176359) [(2, 1), (6, 1), (10, 1), (13, 2), (16, 1)],
  term ((1157663316764178000 : Rat) / 692956453614176359) [(6, 1), (10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 872 for generator 9. -/
theorem ep_Q2_008_partial_09_0872_valid :
    mulPoly ep_Q2_008_coefficient_09_0872
        ep_Q2_008_generator_09_0800_0899 =
      ep_Q2_008_partial_09_0872 := by
  native_decide

/-- Coefficient term 873 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0873 : Poly :=
[
  term ((1251748915535630496912039582383614781494125 : Rat) / 168707601851329515375740828258983054697998) [(6, 1), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 873 for generator 9. -/
def ep_Q2_008_partial_09_0873 : Poly :=
[
  term ((1251748915535630496912039582383614781494125 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (10, 1), (15, 2), (16, 1)],
  term ((-1251748915535630496912039582383614781494125 : Rat) / 168707601851329515375740828258983054697998) [(6, 1), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 873 for generator 9. -/
theorem ep_Q2_008_partial_09_0873_valid :
    mulPoly ep_Q2_008_coefficient_09_0873
        ep_Q2_008_generator_09_0800_0899 =
      ep_Q2_008_partial_09_0873 := by
  native_decide

/-- Coefficient term 874 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0874 : Poly :=
[
  term ((-4051821608674623000 : Rat) / 692956453614176359) [(6, 1), (10, 1), (16, 1)]
]

/-- Partial product 874 for generator 9. -/
def ep_Q2_008_partial_09_0874 : Poly :=
[
  term ((-8103643217349246000 : Rat) / 692956453614176359) [(2, 1), (6, 1), (10, 1), (16, 1)],
  term ((4051821608674623000 : Rat) / 692956453614176359) [(6, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 874 for generator 9. -/
theorem ep_Q2_008_partial_09_0874_valid :
    mulPoly ep_Q2_008_coefficient_09_0874
        ep_Q2_008_generator_09_0800_0899 =
      ep_Q2_008_partial_09_0874 := by
  native_decide

/-- Coefficient term 875 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0875 : Poly :=
[
  term ((794692033748713085134752484873103059200 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 875 for generator 9. -/
def ep_Q2_008_partial_09_0875 : Poly :=
[
  term ((1589384067497426170269504969746206118400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-794692033748713085134752484873103059200 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 875 for generator 9. -/
theorem ep_Q2_008_partial_09_0875_valid :
    mulPoly ep_Q2_008_coefficient_09_0875
        ep_Q2_008_generator_09_0800_0899 =
      ep_Q2_008_partial_09_0875 := by
  native_decide

/-- Coefficient term 876 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0876 : Poly :=
[
  term ((9529107427478448000 : Rat) / 692956453614176359) [(6, 1), (11, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 876 for generator 9. -/
def ep_Q2_008_partial_09_0876 : Poly :=
[
  term ((19058214854956896000 : Rat) / 692956453614176359) [(2, 1), (6, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-9529107427478448000 : Rat) / 692956453614176359) [(6, 1), (11, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 876 for generator 9. -/
theorem ep_Q2_008_partial_09_0876_valid :
    mulPoly ep_Q2_008_coefficient_09_0876
        ep_Q2_008_generator_09_0800_0899 =
      ep_Q2_008_partial_09_0876 := by
  native_decide

/-- Coefficient term 877 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0877 : Poly :=
[
  term ((-557113484503758207975926531396682428222400 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 877 for generator 9. -/
def ep_Q2_008_partial_09_0877 : Poly :=
[
  term ((-1114226969007516415951853062793364856444800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((557113484503758207975926531396682428222400 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 877 for generator 9. -/
theorem ep_Q2_008_partial_09_0877_valid :
    mulPoly ep_Q2_008_coefficient_09_0877
        ep_Q2_008_generator_09_0800_0899 =
      ep_Q2_008_partial_09_0877 := by
  native_decide

/-- Coefficient term 878 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0878 : Poly :=
[
  term ((-394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (11, 1), (12, 1), (13, 3), (15, 2), (16, 1)]
]

/-- Partial product 878 for generator 9. -/
def ep_Q2_008_partial_09_0878 : Poly :=
[
  term ((-788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (11, 1), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (11, 1), (12, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 878 for generator 9. -/
theorem ep_Q2_008_partial_09_0878_valid :
    mulPoly ep_Q2_008_coefficient_09_0878
        ep_Q2_008_generator_09_0800_0899 =
      ep_Q2_008_partial_09_0878 := by
  native_decide

/-- Coefficient term 879 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0879 : Poly :=
[
  term ((33965561196444017100103532925107972819625 : Rat) / 168707601851329515375740828258983054697998) [(6, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 879 for generator 9. -/
def ep_Q2_008_partial_09_0879 : Poly :=
[
  term ((33965561196444017100103532925107972819625 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-33965561196444017100103532925107972819625 : Rat) / 168707601851329515375740828258983054697998) [(6, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 879 for generator 9. -/
theorem ep_Q2_008_partial_09_0879_valid :
    mulPoly ep_Q2_008_coefficient_09_0879
        ep_Q2_008_generator_09_0800_0899 =
      ep_Q2_008_partial_09_0879 := by
  native_decide

/-- Coefficient term 880 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0880 : Poly :=
[
  term ((1543498755534811994006787910240624933593600 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 880 for generator 9. -/
def ep_Q2_008_partial_09_0880 : Poly :=
[
  term ((3086997511069623988013575820481249867187200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1543498755534811994006787910240624933593600 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 880 for generator 9. -/
theorem ep_Q2_008_partial_09_0880_valid :
    mulPoly ep_Q2_008_coefficient_09_0880
        ep_Q2_008_generator_09_0800_0899 =
      ep_Q2_008_partial_09_0880 := by
  native_decide

/-- Coefficient term 881 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0881 : Poly :=
[
  term ((-8314990336455585834074622264187166937600 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 1), (13, 1), (15, 4), (16, 1)]
]

/-- Partial product 881 for generator 9. -/
def ep_Q2_008_partial_09_0881 : Poly :=
[
  term ((-16629980672911171668149244528374333875200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (11, 1), (13, 1), (15, 4), (16, 1)],
  term ((8314990336455585834074622264187166937600 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 1), (13, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 881 for generator 9. -/
theorem ep_Q2_008_partial_09_0881_valid :
    mulPoly ep_Q2_008_coefficient_09_0881
        ep_Q2_008_generator_09_0800_0899 =
      ep_Q2_008_partial_09_0881 := by
  native_decide

/-- Coefficient term 882 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0882 : Poly :=
[
  term ((-31007345937571792125 : Rat) / 2771825814456705436) [(6, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 882 for generator 9. -/
def ep_Q2_008_partial_09_0882 : Poly :=
[
  term ((-31007345937571792125 : Rat) / 1385912907228352718) [(2, 1), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((31007345937571792125 : Rat) / 2771825814456705436) [(6, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 882 for generator 9. -/
theorem ep_Q2_008_partial_09_0882_valid :
    mulPoly ep_Q2_008_coefficient_09_0882
        ep_Q2_008_generator_09_0800_0899 =
      ep_Q2_008_partial_09_0882 := by
  native_decide

/-- Coefficient term 883 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0883 : Poly :=
[
  term ((-3501277356064693911891811131892065848755200 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 883 for generator 9. -/
def ep_Q2_008_partial_09_0883 : Poly :=
[
  term ((-7002554712129387823783622263784131697510400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((3501277356064693911891811131892065848755200 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 883 for generator 9. -/
theorem ep_Q2_008_partial_09_0883_valid :
    mulPoly ep_Q2_008_coefficient_09_0883
        ep_Q2_008_generator_09_0800_0899 =
      ep_Q2_008_partial_09_0883 := by
  native_decide

/-- Coefficient term 884 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0884 : Poly :=
[
  term ((-5769403006279734898605625058821921337251200 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 1), (13, 2), (15, 3), (16, 1)]
]

/-- Partial product 884 for generator 9. -/
def ep_Q2_008_partial_09_0884 : Poly :=
[
  term ((-11538806012559469797211250117643842674502400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (11, 1), (13, 2), (15, 3), (16, 1)],
  term ((5769403006279734898605625058821921337251200 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 884 for generator 9. -/
theorem ep_Q2_008_partial_09_0884_valid :
    mulPoly ep_Q2_008_coefficient_09_0884
        ep_Q2_008_generator_09_0800_0899 =
      ep_Q2_008_partial_09_0884 := by
  native_decide

/-- Coefficient term 885 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0885 : Poly :=
[
  term ((-2366596089097314813815965124265084211200 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (11, 1), (13, 3), (15, 2), (16, 1)]
]

/-- Partial product 885 for generator 9. -/
def ep_Q2_008_partial_09_0885 : Poly :=
[
  term ((-4733192178194629627631930248530168422400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((2366596089097314813815965124265084211200 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (11, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 885 for generator 9. -/
theorem ep_Q2_008_partial_09_0885_valid :
    mulPoly ep_Q2_008_coefficient_09_0885
        ep_Q2_008_generator_09_0800_0899 =
      ep_Q2_008_partial_09_0885 := by
  native_decide

/-- Coefficient term 886 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0886 : Poly :=
[
  term ((-3944326815162191356359941873775140352000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (11, 1), (13, 3), (15, 4), (16, 1)]
]

/-- Partial product 886 for generator 9. -/
def ep_Q2_008_partial_09_0886 : Poly :=
[
  term ((-7888653630324382712719883747550280704000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (11, 1), (13, 3), (15, 4), (16, 1)],
  term ((3944326815162191356359941873775140352000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (11, 1), (13, 3), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 886 for generator 9. -/
theorem ep_Q2_008_partial_09_0886_valid :
    mulPoly ep_Q2_008_coefficient_09_0886
        ep_Q2_008_generator_09_0800_0899 =
      ep_Q2_008_partial_09_0886 := by
  native_decide

/-- Coefficient term 887 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0887 : Poly :=
[
  term ((-2382276856869612000 : Rat) / 692956453614176359) [(6, 1), (11, 1), (13, 3), (16, 1)]
]

/-- Partial product 887 for generator 9. -/
def ep_Q2_008_partial_09_0887 : Poly :=
[
  term ((-4764553713739224000 : Rat) / 692956453614176359) [(2, 1), (6, 1), (11, 1), (13, 3), (16, 1)],
  term ((2382276856869612000 : Rat) / 692956453614176359) [(6, 1), (11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 887 for generator 9. -/
theorem ep_Q2_008_partial_09_0887_valid :
    mulPoly ep_Q2_008_coefficient_09_0887
        ep_Q2_008_generator_09_0800_0899 =
      ep_Q2_008_partial_09_0887 := by
  native_decide

/-- Coefficient term 888 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0888 : Poly :=
[
  term ((-197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (11, 1), (13, 4), (15, 1), (16, 1)]
]

/-- Partial product 888 for generator 9. -/
def ep_Q2_008_partial_09_0888 : Poly :=
[
  term ((-394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (11, 1), (13, 4), (15, 1), (16, 1)],
  term ((197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (11, 1), (13, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 888 for generator 9. -/
theorem ep_Q2_008_partial_09_0888_valid :
    mulPoly ep_Q2_008_coefficient_09_0888
        ep_Q2_008_generator_09_0800_0899 =
      ep_Q2_008_partial_09_0888 := by
  native_decide

/-- Coefficient term 889 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0889 : Poly :=
[
  term ((48369817720131828194102271379957190406150 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 889 for generator 9. -/
def ep_Q2_008_partial_09_0889 : Poly :=
[
  term ((96739635440263656388204542759914380812300 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-48369817720131828194102271379957190406150 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 889 for generator 9. -/
theorem ep_Q2_008_partial_09_0889_valid :
    mulPoly ep_Q2_008_coefficient_09_0889
        ep_Q2_008_generator_09_0800_0899 =
      ep_Q2_008_partial_09_0889 := by
  native_decide

/-- Coefficient term 890 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0890 : Poly :=
[
  term ((9144362709899146948734428935040000278875 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 1), (15, 3), (16, 1)]
]

/-- Partial product 890 for generator 9. -/
def ep_Q2_008_partial_09_0890 : Poly :=
[
  term ((18288725419798293897468857870080000557750 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (11, 1), (15, 3), (16, 1)],
  term ((-9144362709899146948734428935040000278875 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 890 for generator 9. -/
theorem ep_Q2_008_partial_09_0890_valid :
    mulPoly ep_Q2_008_coefficient_09_0890
        ep_Q2_008_generator_09_0800_0899 =
      ep_Q2_008_partial_09_0890 := by
  native_decide

/-- Coefficient term 891 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0891 : Poly :=
[
  term ((1825090599178964176421054557339828275161793 : Rat) / 674830407405318061502963313035932218791992) [(6, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 891 for generator 9. -/
def ep_Q2_008_partial_09_0891 : Poly :=
[
  term ((1825090599178964176421054557339828275161793 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1825090599178964176421054557339828275161793 : Rat) / 674830407405318061502963313035932218791992) [(6, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 891 for generator 9. -/
theorem ep_Q2_008_partial_09_0891_valid :
    mulPoly ep_Q2_008_coefficient_09_0891
        ep_Q2_008_generator_09_0800_0899 =
      ep_Q2_008_partial_09_0891 := by
  native_decide

/-- Coefficient term 892 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0892 : Poly :=
[
  term ((-141147478046391873120448006797263232000 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (12, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 892 for generator 9. -/
def ep_Q2_008_partial_09_0892 : Poly :=
[
  term ((-282294956092783746240896013594526464000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((141147478046391873120448006797263232000 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (12, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 892 for generator 9. -/
theorem ep_Q2_008_partial_09_0892_valid :
    mulPoly ep_Q2_008_coefficient_09_0892
        ep_Q2_008_generator_09_0800_0899 =
      ep_Q2_008_partial_09_0892 := by
  native_decide

/-- Coefficient term 893 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0893 : Poly :=
[
  term ((-4201465330826088668719012886041459123200 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (12, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 893 for generator 9. -/
def ep_Q2_008_partial_09_0893 : Poly :=
[
  term ((-8402930661652177337438025772082918246400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((4201465330826088668719012886041459123200 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (12, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 893 for generator 9. -/
theorem ep_Q2_008_partial_09_0893_valid :
    mulPoly ep_Q2_008_coefficient_09_0893
        ep_Q2_008_generator_09_0800_0899 =
      ep_Q2_008_partial_09_0893 := by
  native_decide

/-- Coefficient term 894 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0894 : Poly :=
[
  term ((3405818522793991866428877293815311177985563 : Rat) / 1349660814810636123005926626071864437583984) [(6, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 894 for generator 9. -/
def ep_Q2_008_partial_09_0894 : Poly :=
[
  term ((3405818522793991866428877293815311177985563 : Rat) / 674830407405318061502963313035932218791992) [(2, 1), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((-3405818522793991866428877293815311177985563 : Rat) / 1349660814810636123005926626071864437583984) [(6, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 894 for generator 9. -/
theorem ep_Q2_008_partial_09_0894_valid :
    mulPoly ep_Q2_008_coefficient_09_0894
        ep_Q2_008_generator_09_0800_0899 =
      ep_Q2_008_partial_09_0894 := by
  native_decide

/-- Coefficient term 895 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0895 : Poly :=
[
  term ((-210557658436937499 : Rat) / 95580200498507084) [(6, 1), (12, 1), (16, 1)]
]

/-- Partial product 895 for generator 9. -/
def ep_Q2_008_partial_09_0895 : Poly :=
[
  term ((-210557658436937499 : Rat) / 47790100249253542) [(2, 1), (6, 1), (12, 1), (16, 1)],
  term ((210557658436937499 : Rat) / 95580200498507084) [(6, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 895 for generator 9. -/
theorem ep_Q2_008_partial_09_0895_valid :
    mulPoly ep_Q2_008_coefficient_09_0895
        ep_Q2_008_generator_09_0800_0899 =
      ep_Q2_008_partial_09_0895 := by
  native_decide

/-- Coefficient term 896 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0896 : Poly :=
[
  term ((27963707277978506409285934147267352132548533 : Rat) / 2699321629621272246011853252143728875167968) [(6, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 896 for generator 9. -/
def ep_Q2_008_partial_09_0896 : Poly :=
[
  term ((27963707277978506409285934147267352132548533 : Rat) / 1349660814810636123005926626071864437583984) [(2, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-27963707277978506409285934147267352132548533 : Rat) / 2699321629621272246011853252143728875167968) [(6, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 896 for generator 9. -/
theorem ep_Q2_008_partial_09_0896_valid :
    mulPoly ep_Q2_008_coefficient_09_0896
        ep_Q2_008_generator_09_0800_0899 =
      ep_Q2_008_partial_09_0896 := by
  native_decide

/-- Coefficient term 897 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0897 : Poly :=
[
  term ((2698820711624065339667680549442491017524913 : Rat) / 168707601851329515375740828258983054697998) [(6, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 897 for generator 9. -/
def ep_Q2_008_partial_09_0897 : Poly :=
[
  term ((2698820711624065339667680549442491017524913 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (13, 1), (15, 3), (16, 1)],
  term ((-2698820711624065339667680549442491017524913 : Rat) / 168707601851329515375740828258983054697998) [(6, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 897 for generator 9. -/
theorem ep_Q2_008_partial_09_0897_valid :
    mulPoly ep_Q2_008_coefficient_09_0897
        ep_Q2_008_generator_09_0800_0899 =
      ep_Q2_008_partial_09_0897 := by
  native_decide

/-- Coefficient term 898 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0898 : Poly :=
[
  term ((-42177389479679636404739378051337263923200 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 898 for generator 9. -/
def ep_Q2_008_partial_09_0898 : Poly :=
[
  term ((-84354778959359272809478756102674527846400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (13, 2), (15, 2), (16, 1)],
  term ((42177389479679636404739378051337263923200 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 898 for generator 9. -/
theorem ep_Q2_008_partial_09_0898_valid :
    mulPoly ep_Q2_008_coefficient_09_0898
        ep_Q2_008_generator_09_0800_0899 =
      ep_Q2_008_partial_09_0898 := by
  native_decide

/-- Coefficient term 899 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0899 : Poly :=
[
  term ((-69358230528774147381380675478425778355200 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (13, 2), (15, 4), (16, 1)]
]

/-- Partial product 899 for generator 9. -/
def ep_Q2_008_partial_09_0899 : Poly :=
[
  term ((-138716461057548294762761350956851556710400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (13, 2), (15, 4), (16, 1)],
  term ((69358230528774147381380675478425778355200 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (13, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 899 for generator 9. -/
theorem ep_Q2_008_partial_09_0899_valid :
    mulPoly ep_Q2_008_coefficient_09_0899
        ep_Q2_008_generator_09_0800_0899 =
      ep_Q2_008_partial_09_0899 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_008_partials_09_0800_0899 : List Poly :=
[
  ep_Q2_008_partial_09_0800,
  ep_Q2_008_partial_09_0801,
  ep_Q2_008_partial_09_0802,
  ep_Q2_008_partial_09_0803,
  ep_Q2_008_partial_09_0804,
  ep_Q2_008_partial_09_0805,
  ep_Q2_008_partial_09_0806,
  ep_Q2_008_partial_09_0807,
  ep_Q2_008_partial_09_0808,
  ep_Q2_008_partial_09_0809,
  ep_Q2_008_partial_09_0810,
  ep_Q2_008_partial_09_0811,
  ep_Q2_008_partial_09_0812,
  ep_Q2_008_partial_09_0813,
  ep_Q2_008_partial_09_0814,
  ep_Q2_008_partial_09_0815,
  ep_Q2_008_partial_09_0816,
  ep_Q2_008_partial_09_0817,
  ep_Q2_008_partial_09_0818,
  ep_Q2_008_partial_09_0819,
  ep_Q2_008_partial_09_0820,
  ep_Q2_008_partial_09_0821,
  ep_Q2_008_partial_09_0822,
  ep_Q2_008_partial_09_0823,
  ep_Q2_008_partial_09_0824,
  ep_Q2_008_partial_09_0825,
  ep_Q2_008_partial_09_0826,
  ep_Q2_008_partial_09_0827,
  ep_Q2_008_partial_09_0828,
  ep_Q2_008_partial_09_0829,
  ep_Q2_008_partial_09_0830,
  ep_Q2_008_partial_09_0831,
  ep_Q2_008_partial_09_0832,
  ep_Q2_008_partial_09_0833,
  ep_Q2_008_partial_09_0834,
  ep_Q2_008_partial_09_0835,
  ep_Q2_008_partial_09_0836,
  ep_Q2_008_partial_09_0837,
  ep_Q2_008_partial_09_0838,
  ep_Q2_008_partial_09_0839,
  ep_Q2_008_partial_09_0840,
  ep_Q2_008_partial_09_0841,
  ep_Q2_008_partial_09_0842,
  ep_Q2_008_partial_09_0843,
  ep_Q2_008_partial_09_0844,
  ep_Q2_008_partial_09_0845,
  ep_Q2_008_partial_09_0846,
  ep_Q2_008_partial_09_0847,
  ep_Q2_008_partial_09_0848,
  ep_Q2_008_partial_09_0849,
  ep_Q2_008_partial_09_0850,
  ep_Q2_008_partial_09_0851,
  ep_Q2_008_partial_09_0852,
  ep_Q2_008_partial_09_0853,
  ep_Q2_008_partial_09_0854,
  ep_Q2_008_partial_09_0855,
  ep_Q2_008_partial_09_0856,
  ep_Q2_008_partial_09_0857,
  ep_Q2_008_partial_09_0858,
  ep_Q2_008_partial_09_0859,
  ep_Q2_008_partial_09_0860,
  ep_Q2_008_partial_09_0861,
  ep_Q2_008_partial_09_0862,
  ep_Q2_008_partial_09_0863,
  ep_Q2_008_partial_09_0864,
  ep_Q2_008_partial_09_0865,
  ep_Q2_008_partial_09_0866,
  ep_Q2_008_partial_09_0867,
  ep_Q2_008_partial_09_0868,
  ep_Q2_008_partial_09_0869,
  ep_Q2_008_partial_09_0870,
  ep_Q2_008_partial_09_0871,
  ep_Q2_008_partial_09_0872,
  ep_Q2_008_partial_09_0873,
  ep_Q2_008_partial_09_0874,
  ep_Q2_008_partial_09_0875,
  ep_Q2_008_partial_09_0876,
  ep_Q2_008_partial_09_0877,
  ep_Q2_008_partial_09_0878,
  ep_Q2_008_partial_09_0879,
  ep_Q2_008_partial_09_0880,
  ep_Q2_008_partial_09_0881,
  ep_Q2_008_partial_09_0882,
  ep_Q2_008_partial_09_0883,
  ep_Q2_008_partial_09_0884,
  ep_Q2_008_partial_09_0885,
  ep_Q2_008_partial_09_0886,
  ep_Q2_008_partial_09_0887,
  ep_Q2_008_partial_09_0888,
  ep_Q2_008_partial_09_0889,
  ep_Q2_008_partial_09_0890,
  ep_Q2_008_partial_09_0891,
  ep_Q2_008_partial_09_0892,
  ep_Q2_008_partial_09_0893,
  ep_Q2_008_partial_09_0894,
  ep_Q2_008_partial_09_0895,
  ep_Q2_008_partial_09_0896,
  ep_Q2_008_partial_09_0897,
  ep_Q2_008_partial_09_0898,
  ep_Q2_008_partial_09_0899
]

/-- Sum of partial products in this block. -/
def ep_Q2_008_block_09_0800_0899 : Poly :=
[
  term ((71069138684197378665 : Rat) / 11087303257826821744) [(2, 1), (5, 2), (12, 1), (16, 1)],
  term ((-10763972258504527974 : Rat) / 692956453614176359) [(2, 1), (5, 2), (13, 1), (15, 1), (16, 1)],
  term ((59201847421774903857 : Rat) / 692956453614176359) [(2, 1), (5, 2), (13, 2), (16, 1)],
  term ((5381986129252263987 : Rat) / 692956453614176359) [(2, 1), (5, 2), (15, 2), (16, 1)],
  term ((-193419781321481949525 : Rat) / 11087303257826821744) [(2, 1), (5, 2), (16, 1)],
  term ((199640672195205728599637795645587200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((2919511882115052984 : Rat) / 692956453614176359) [(2, 1), (6, 1), (7, 1), (9, 1), (13, 2), (16, 1)],
  term ((58987767080500222804901543892174336000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 1), (9, 1), (13, 3), (15, 1), (16, 1)],
  term ((47640465710460000 : Rat) / 692956453614176359) [(2, 1), (6, 1), (7, 1), (10, 1), (11, 1), (16, 1)],
  term ((4133553661265016089393344164468203564112000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (7, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-18522613068226848000 : Rat) / 692956453614176359) [(2, 1), (6, 1), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((41019583372568435225665280457310267554975 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-8195557855031715787588089335358713433600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((16391115710063431575176178670717426867200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (7, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((95291074274784480000 : Rat) / 692956453614176359) [(2, 1), (6, 1), (7, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-47645537137392240000 : Rat) / 692956453614176359) [(2, 1), (6, 1), (7, 1), (11, 1), (13, 2), (16, 1)],
  term ((-3944326815162191356359941873775140352000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((7888653630324382712719883747550280704000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 1), (11, 1), (13, 3), (15, 3), (16, 1)],
  term ((-51783810740093250 : Rat) / 692956453614176359) [(2, 1), (6, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((61622254652891625 : Rat) / 692956453614176359) [(2, 1), (6, 1), (7, 1), (11, 1), (16, 1)],
  term ((2528301672655335973753971629414112000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((1459755941057526492 : Rat) / 692956453614176359) [(2, 1), (6, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-87992945843407624062821236448799223199406 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 1), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((-345935536652302900666016218830948341494893 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-231759677771422065979541084536372800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 1), (12, 1), (15, 3), (16, 1)],
  term ((-83569812482433840577978241849594802744693 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2992460513795946123118710470905305600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 1), (13, 1), (15, 4), (16, 1)],
  term ((9852173452219210734 : Rat) / 692956453614176359) [(2, 1), (6, 1), (7, 1), (13, 1), (16, 1)],
  term ((-603673817895746035835618318351805049503636 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-748625793439644140531266974213590583507660 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (7, 1), (13, 2), (15, 3), (16, 1)],
  term ((-88481650620750334207352315838261504000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 1), (13, 3), (15, 2), (16, 1)],
  term ((-147469417701250557012253859730435840000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 1), (13, 3), (15, 4), (16, 1)],
  term ((-364938985264381623 : Rat) / 692956453614176359) [(2, 1), (6, 1), (7, 1), (13, 3), (16, 1)],
  term ((-7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 1), (13, 4), (15, 1), (16, 1)],
  term ((323572082096977883074163638367949169038219 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-277931547413642671039706101518918024700789 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (7, 1), (15, 3), (16, 1)],
  term ((1624589601128860050008462612188569600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 2), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((812294800564430025004231306094284800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 2), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((38799947216034992907421682315097600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 2), (12, 1), (15, 2), (16, 1)],
  term ((-2221433850474016421359523091548198400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((4075520247881852823124352212364352000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 2), (13, 1), (15, 3), (16, 1)],
  term ((888412015013099667522747720228727307936460 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (7, 2), (13, 2), (15, 2), (16, 1)],
  term ((-4061474002822150125021156530471424000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 2), (13, 2), (15, 4), (16, 1)],
  term ((-3649389852643816230 : Rat) / 692956453614176359) [(2, 1), (6, 1), (7, 2), (13, 2), (16, 1)],
  term ((-73937782550766386012377987691741491200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 2), (13, 3), (15, 1), (16, 1)],
  term ((147469417701250557012253859730435840000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 2), (13, 3), (15, 3), (16, 1)],
  term ((197160899881750526107529996477227415923189 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (7, 2), (15, 2), (16, 1)],
  term ((-37588290293952012559861671416985600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 2), (15, 4), (16, 1)],
  term ((-1619646487561852949 : Rat) / 1385912907228352718) [(2, 1), (6, 1), (7, 2), (16, 1)],
  term ((-2030737001411075062510578265235712000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 3), (13, 2), (15, 1), (16, 1)],
  term ((4061474002822150125021156530471424000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 3), (13, 2), (15, 3), (16, 1)],
  term ((-18794145146976006279930835708492800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 3), (15, 1), (16, 1)],
  term ((37588290293952012559861671416985600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (7, 3), (15, 3), (16, 1)],
  term ((13891959801170136000 : Rat) / 692956453614176359) [(2, 1), (6, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((4686266345912897642062657677745542720000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((38116429709913792000 : Rat) / 692956453614176359) [(2, 1), (6, 1), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((3155461452129753085087953499020112281600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (9, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((-389161661601209625 : Rat) / 692956453614176359) [(2, 1), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((43870091723907405560887831547807298121200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((65144989867565479901745233906429184000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-19693427191886127405 : Rat) / 692956453614176359) [(2, 1), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((50249467076537887353053602992521610969600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-57374307239665579215018240646877635653300 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((57692727000542829166649309040160133620800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (9, 1), (15, 3), (16, 1)],
  term ((78173987841078575882094280687715020800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-140649573864425400 : Rat) / 692956453614176359) [(2, 1), (6, 1), (9, 2), (16, 1)],
  term ((-4630653267056712000 : Rat) / 692956453614176359) [(2, 1), (6, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((11576633167641780000 : Rat) / 692956453614176359) [(2, 1), (6, 1), (10, 1), (12, 1), (16, 1)],
  term ((-21609715246264656000 : Rat) / 692956453614176359) [(2, 1), (6, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4135182286011705226390887795315864293712000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((-2315326633528356000 : Rat) / 692956453614176359) [(2, 1), (6, 1), (10, 1), (13, 2), (16, 1)],
  term ((1251748915535630496912039582383614781494125 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (10, 1), (15, 2), (16, 1)],
  term ((-8103643217349246000 : Rat) / 692956453614176359) [(2, 1), (6, 1), (10, 1), (16, 1)],
  term ((1589384067497426170269504969746206118400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((19058214854956896000 : Rat) / 692956453614176359) [(2, 1), (6, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-1114226969007516415951853062793364856444800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (11, 1), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((33965561196444017100103532925107972819625 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((3086997511069623988013575820481249867187200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-16629980672911171668149244528374333875200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (11, 1), (13, 1), (15, 4), (16, 1)],
  term ((-31007345937571792125 : Rat) / 1385912907228352718) [(2, 1), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((-7002554712129387823783622263784131697510400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-11538806012559469797211250117643842674502400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (11, 1), (13, 2), (15, 3), (16, 1)],
  term ((-4733192178194629627631930248530168422400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((-7888653630324382712719883747550280704000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (11, 1), (13, 3), (15, 4), (16, 1)],
  term ((-4764553713739224000 : Rat) / 692956453614176359) [(2, 1), (6, 1), (11, 1), (13, 3), (16, 1)],
  term ((-394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (6, 1), (11, 1), (13, 4), (15, 1), (16, 1)],
  term ((96739635440263656388204542759914380812300 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((18288725419798293897468857870080000557750 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (11, 1), (15, 3), (16, 1)],
  term ((1825090599178964176421054557339828275161793 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-282294956092783746240896013594526464000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-8402930661652177337438025772082918246400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((3405818522793991866428877293815311177985563 : Rat) / 674830407405318061502963313035932218791992) [(2, 1), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((-210557658436937499 : Rat) / 47790100249253542) [(2, 1), (6, 1), (12, 1), (16, 1)],
  term ((27963707277978506409285934147267352132548533 : Rat) / 1349660814810636123005926626071864437583984) [(2, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((2698820711624065339667680549442491017524913 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (13, 1), (15, 3), (16, 1)],
  term ((-84354778959359272809478756102674527846400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (13, 2), (15, 2), (16, 1)],
  term ((-138716461057548294762761350956851556710400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (6, 1), (13, 2), (15, 4), (16, 1)],
  term ((-71069138684197378665 : Rat) / 22174606515653643488) [(5, 2), (12, 1), (16, 1)],
  term ((5381986129252263987 : Rat) / 692956453614176359) [(5, 2), (13, 1), (15, 1), (16, 1)],
  term ((-59201847421774903857 : Rat) / 1385912907228352718) [(5, 2), (13, 2), (16, 1)],
  term ((-5381986129252263987 : Rat) / 1385912907228352718) [(5, 2), (15, 2), (16, 1)],
  term ((193419781321481949525 : Rat) / 22174606515653643488) [(5, 2), (16, 1)],
  term ((-99820336097602864299818897822793600 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1459755941057526492 : Rat) / 692956453614176359) [(6, 1), (7, 1), (9, 1), (13, 2), (16, 1)],
  term ((-29493883540250111402450771946087168000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (9, 1), (13, 3), (15, 1), (16, 1)],
  term ((-23820232855230000 : Rat) / 692956453614176359) [(6, 1), (7, 1), (10, 1), (11, 1), (16, 1)],
  term ((-2066776830632508044696672082234101782056000 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (7, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((9261306534113424000 : Rat) / 692956453614176359) [(6, 1), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((-41019583372568435225665280457310267554975 : Rat) / 168707601851329515375740828258983054697998) [(6, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((4097778927515857893794044667679356716800 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-8195557855031715787588089335358713433600 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (7, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-47645537137392240000 : Rat) / 692956453614176359) [(6, 1), (7, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((23822768568696120000 : Rat) / 692956453614176359) [(6, 1), (7, 1), (11, 1), (13, 2), (16, 1)],
  term ((1972163407581095678179970936887570176000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((-3944326815162191356359941873775140352000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (11, 1), (13, 3), (15, 3), (16, 1)],
  term ((25891905370046625 : Rat) / 692956453614176359) [(6, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((-61622254652891625 : Rat) / 1385912907228352718) [(6, 1), (7, 1), (11, 1), (16, 1)],
  term ((-1264150836327667986876985814707056000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-729877970528763246 : Rat) / 692956453614176359) [(6, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((43996472921703812031410618224399611599703 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((345935536652302900666016218830948341494893 : Rat) / 168707601851329515375740828258983054697998) [(6, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((115879838885711032989770542268186400 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (12, 1), (15, 3), (16, 1)],
  term ((83569812482433840577978241849594802744693 : Rat) / 5817503512114810875025545802033898437862) [(6, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((1496230256897973061559355235452652800 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (13, 1), (15, 4), (16, 1)],
  term ((-4926086726109605367 : Rat) / 692956453614176359) [(6, 1), (7, 1), (13, 1), (16, 1)],
  term ((301836908947873017917809159175902524751818 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((374312896719822070265633487106795291753830 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (7, 1), (13, 2), (15, 3), (16, 1)],
  term ((44240825310375167103676157919130752000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (13, 3), (15, 2), (16, 1)],
  term ((73734708850625278506126929865217920000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (13, 3), (15, 4), (16, 1)],
  term ((364938985264381623 : Rat) / 1385912907228352718) [(6, 1), (7, 1), (13, 3), (16, 1)],
  term ((3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 1), (13, 4), (15, 1), (16, 1)],
  term ((-323572082096977883074163638367949169038219 : Rat) / 168707601851329515375740828258983054697998) [(6, 1), (7, 1), (15, 1), (16, 1)],
  term ((277931547413642671039706101518918024700789 : Rat) / 168707601851329515375740828258983054697998) [(6, 1), (7, 1), (15, 3), (16, 1)],
  term ((-812294800564430025004231306094284800 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-19399973608017496453710841157548800 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (12, 1), (15, 2), (16, 1)],
  term ((1110716925237008210679761545774099200 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-2037760123940926411562176106182176000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (13, 1), (15, 3), (16, 1)],
  term ((-444206007506549833761373860114363653968230 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (7, 2), (13, 2), (15, 2), (16, 1)],
  term ((2030737001411075062510578265235712000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (13, 2), (15, 4), (16, 1)],
  term ((1824694926321908115 : Rat) / 692956453614176359) [(6, 1), (7, 2), (13, 2), (16, 1)],
  term ((36968891275383193006188993845870745600 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (13, 3), (15, 1), (16, 1)],
  term ((-73734708850625278506126929865217920000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (13, 3), (15, 3), (16, 1)],
  term ((-197160899881750526107529996477227415923189 : Rat) / 168707601851329515375740828258983054697998) [(6, 1), (7, 2), (15, 2), (16, 1)],
  term ((18794145146976006279930835708492800 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 2), (15, 4), (16, 1)],
  term ((1619646487561852949 : Rat) / 2771825814456705436) [(6, 1), (7, 2), (16, 1)],
  term ((1015368500705537531255289132617856000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 3), (13, 2), (15, 1), (16, 1)],
  term ((-2030737001411075062510578265235712000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 3), (13, 2), (15, 3), (16, 1)],
  term ((9397072573488003139965417854246400 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 3), (15, 1), (16, 1)],
  term ((-18794145146976006279930835708492800 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (7, 3), (15, 3), (16, 1)],
  term ((-6945979900585068000 : Rat) / 692956453614176359) [(6, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-2343133172956448821031328838872771360000 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-19058214854956896000 : Rat) / 692956453614176359) [(6, 1), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((-1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (9, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((389161661601209625 : Rat) / 1385912907228352718) [(6, 1), (9, 1), (11, 1), (16, 1)],
  term ((-21935045861953702780443915773903649060600 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-32572494933782739950872616953214592000 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((19693427191886127405 : Rat) / 1385912907228352718) [(6, 1), (9, 1), (13, 1), (16, 1)],
  term ((-25124733538268943676526801496260805484800 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((28687153619832789607509120323438817826650 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-28846363500271414583324654520080066810400 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (9, 1), (15, 3), (16, 1)],
  term ((-39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((70324786932212700 : Rat) / 692956453614176359) [(6, 1), (9, 2), (16, 1)],
  term ((2315326633528356000 : Rat) / 692956453614176359) [(6, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5788316583820890000 : Rat) / 692956453614176359) [(6, 1), (10, 1), (12, 1), (16, 1)],
  term ((10804857623132328000 : Rat) / 692956453614176359) [(6, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((2067591143005852613195443897657932146856000 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((1157663316764178000 : Rat) / 692956453614176359) [(6, 1), (10, 1), (13, 2), (16, 1)],
  term ((-1251748915535630496912039582383614781494125 : Rat) / 168707601851329515375740828258983054697998) [(6, 1), (10, 1), (15, 2), (16, 1)],
  term ((4051821608674623000 : Rat) / 692956453614176359) [(6, 1), (10, 1), (16, 1)],
  term ((-794692033748713085134752484873103059200 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-9529107427478448000 : Rat) / 692956453614176359) [(6, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((557113484503758207975926531396682428222400 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (11, 1), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((-33965561196444017100103532925107972819625 : Rat) / 168707601851329515375740828258983054697998) [(6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1543498755534811994006787910240624933593600 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((8314990336455585834074622264187166937600 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 1), (13, 1), (15, 4), (16, 1)],
  term ((31007345937571792125 : Rat) / 2771825814456705436) [(6, 1), (11, 1), (13, 1), (16, 1)],
  term ((3501277356064693911891811131892065848755200 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((5769403006279734898605625058821921337251200 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 1), (13, 2), (15, 3), (16, 1)],
  term ((2366596089097314813815965124265084211200 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((3944326815162191356359941873775140352000 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (11, 1), (13, 3), (15, 4), (16, 1)],
  term ((2382276856869612000 : Rat) / 692956453614176359) [(6, 1), (11, 1), (13, 3), (16, 1)],
  term ((197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(6, 1), (11, 1), (13, 4), (15, 1), (16, 1)],
  term ((-48369817720131828194102271379957190406150 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-9144362709899146948734428935040000278875 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 1), (15, 3), (16, 1)],
  term ((-1825090599178964176421054557339828275161793 : Rat) / 674830407405318061502963313035932218791992) [(6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((141147478046391873120448006797263232000 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((4201465330826088668719012886041459123200 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-3405818522793991866428877293815311177985563 : Rat) / 1349660814810636123005926626071864437583984) [(6, 1), (12, 1), (15, 2), (16, 1)],
  term ((210557658436937499 : Rat) / 95580200498507084) [(6, 1), (12, 1), (16, 1)],
  term ((-27963707277978506409285934147267352132548533 : Rat) / 2699321629621272246011853252143728875167968) [(6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2698820711624065339667680549442491017524913 : Rat) / 168707601851329515375740828258983054697998) [(6, 1), (13, 1), (15, 3), (16, 1)],
  term ((42177389479679636404739378051337263923200 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (13, 2), (15, 2), (16, 1)],
  term ((69358230528774147381380675478425778355200 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (13, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 9, terms 800 through 899. -/
theorem ep_Q2_008_block_09_0800_0899_valid :
    checkProductSumEq ep_Q2_008_partials_09_0800_0899
      ep_Q2_008_block_09_0800_0899 = true := by
  native_decide

end EpQ2008TermShards

end Patterns

end EndpointCertificate

end Problem97
