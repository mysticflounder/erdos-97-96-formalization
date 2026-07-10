/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_008, term block 27:800-899

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_008`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2008TermShards

/-- Generator polynomial 27 for endpoint certificate `ep_Q2_008`. -/
def ep_Q2_008_generator_27_0800_0899 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(14, 1)]
]

/-- Coefficient term 800 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0800 : Poly :=
[
  term ((3480147937316115776047364635132800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 800 for generator 27. -/
def ep_Q2_008_partial_27_0800 : Poly :=
[
  term ((6960295874632231552094729270265600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3480147937316115776047364635132800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 800 for generator 27. -/
theorem ep_Q2_008_partial_27_0800_valid :
    mulPoly ep_Q2_008_coefficient_27_0800
        ep_Q2_008_generator_27_0800_0899 =
      ep_Q2_008_partial_27_0800 := by
  native_decide

/-- Coefficient term 801 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0801 : Poly :=
[
  term ((53595523924267500 : Rat) / 692956453614176359) [(3, 1), (5, 1), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 801 for generator 27. -/
def ep_Q2_008_partial_27_0801 : Poly :=
[
  term ((107191047848535000 : Rat) / 692956453614176359) [(3, 1), (5, 1), (6, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-53595523924267500 : Rat) / 692956453614176359) [(3, 1), (5, 1), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 801 for generator 27. -/
theorem ep_Q2_008_partial_27_0801_valid :
    mulPoly ep_Q2_008_coefficient_27_0801
        ep_Q2_008_generator_27_0800_0899 =
      ep_Q2_008_partial_27_0801 := by
  native_decide

/-- Coefficient term 802 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0802 : Poly :=
[
  term ((-53595523924267500 : Rat) / 692956453614176359) [(3, 1), (5, 1), (6, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 802 for generator 27. -/
def ep_Q2_008_partial_27_0802 : Poly :=
[
  term ((53595523924267500 : Rat) / 692956453614176359) [(3, 1), (5, 1), (6, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-107191047848535000 : Rat) / 692956453614176359) [(3, 1), (5, 1), (6, 1), (11, 1), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 802 for generator 27. -/
theorem ep_Q2_008_partial_27_0802_valid :
    mulPoly ep_Q2_008_coefficient_27_0802
        ep_Q2_008_generator_27_0800_0899 =
      ep_Q2_008_partial_27_0802 := by
  native_decide

/-- Coefficient term 803 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0803 : Poly :=
[
  term ((-26797761962133750 : Rat) / 692956453614176359) [(3, 1), (5, 1), (6, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 803 for generator 27. -/
def ep_Q2_008_partial_27_0803 : Poly :=
[
  term ((-53595523924267500 : Rat) / 692956453614176359) [(3, 1), (5, 1), (6, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((26797761962133750 : Rat) / 692956453614176359) [(3, 1), (5, 1), (6, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 803 for generator 27. -/
theorem ep_Q2_008_partial_27_0803_valid :
    mulPoly ep_Q2_008_coefficient_27_0803
        ep_Q2_008_generator_27_0800_0899 =
      ep_Q2_008_partial_27_0803 := by
  native_decide

/-- Coefficient term 804 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0804 : Poly :=
[
  term ((7995170523765116349 : Rat) / 1385912907228352718) [(3, 1), (5, 1), (6, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 804 for generator 27. -/
def ep_Q2_008_partial_27_0804 : Poly :=
[
  term ((7995170523765116349 : Rat) / 692956453614176359) [(3, 1), (5, 1), (6, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7995170523765116349 : Rat) / 1385912907228352718) [(3, 1), (5, 1), (6, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 804 for generator 27. -/
theorem ep_Q2_008_partial_27_0804_valid :
    mulPoly ep_Q2_008_coefficient_27_0804
        ep_Q2_008_generator_27_0800_0899 =
      ep_Q2_008_partial_27_0804 := by
  native_decide

/-- Coefficient term 805 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0805 : Poly :=
[
  term ((-21527944517009055948 : Rat) / 692956453614176359) [(3, 1), (5, 1), (6, 1), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 805 for generator 27. -/
def ep_Q2_008_partial_27_0805 : Poly :=
[
  term ((-43055889034018111896 : Rat) / 692956453614176359) [(3, 1), (5, 1), (6, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((21527944517009055948 : Rat) / 692956453614176359) [(3, 1), (5, 1), (6, 1), (12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 805 for generator 27. -/
theorem ep_Q2_008_partial_27_0805_valid :
    mulPoly ep_Q2_008_coefficient_27_0805
        ep_Q2_008_generator_27_0800_0899 =
      ep_Q2_008_partial_27_0805 := by
  native_decide

/-- Coefficient term 806 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0806 : Poly :=
[
  term ((-1145077892859441821928036850911497083007721 : Rat) / 337415203702659030751481656517966109395996) [(3, 1), (5, 1), (6, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 806 for generator 27. -/
def ep_Q2_008_partial_27_0806 : Poly :=
[
  term ((-1145077892859441821928036850911497083007721 : Rat) / 168707601851329515375740828258983054697998) [(3, 1), (5, 1), (6, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((1145077892859441821928036850911497083007721 : Rat) / 337415203702659030751481656517966109395996) [(3, 1), (5, 1), (6, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 806 for generator 27. -/
theorem ep_Q2_008_partial_27_0806_valid :
    mulPoly ep_Q2_008_coefficient_27_0806
        ep_Q2_008_generator_27_0800_0899 =
      ep_Q2_008_partial_27_0806 := by
  native_decide

/-- Coefficient term 807 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0807 : Poly :=
[
  term ((-19856540141026962045 : Rat) / 2771825814456705436) [(3, 1), (5, 1), (6, 1), (12, 1), (16, 1)]
]

/-- Partial product 807 for generator 27. -/
def ep_Q2_008_partial_27_0807 : Poly :=
[
  term ((-19856540141026962045 : Rat) / 1385912907228352718) [(3, 1), (5, 1), (6, 1), (12, 1), (14, 1), (16, 1)],
  term ((19856540141026962045 : Rat) / 2771825814456705436) [(3, 1), (5, 1), (6, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 807 for generator 27. -/
theorem ep_Q2_008_partial_27_0807_valid :
    mulPoly ep_Q2_008_coefficient_27_0807
        ep_Q2_008_generator_27_0800_0899 =
      ep_Q2_008_partial_27_0807 := by
  native_decide

/-- Coefficient term 808 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0808 : Poly :=
[
  term ((1145077892859441821928036850911497083007721 : Rat) / 337415203702659030751481656517966109395996) [(3, 1), (5, 1), (6, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 808 for generator 27. -/
def ep_Q2_008_partial_27_0808 : Poly :=
[
  term ((-1145077892859441821928036850911497083007721 : Rat) / 337415203702659030751481656517966109395996) [(3, 1), (5, 1), (6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1145077892859441821928036850911497083007721 : Rat) / 168707601851329515375740828258983054697998) [(3, 1), (5, 1), (6, 1), (13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 808 for generator 27. -/
theorem ep_Q2_008_partial_27_0808_valid :
    mulPoly ep_Q2_008_coefficient_27_0808
        ep_Q2_008_generator_27_0800_0899 =
      ep_Q2_008_partial_27_0808 := by
  native_decide

/-- Coefficient term 809 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0809 : Poly :=
[
  term ((1145077892859441821928036850911497083007721 : Rat) / 674830407405318061502963313035932218791992) [(3, 1), (5, 1), (6, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 809 for generator 27. -/
def ep_Q2_008_partial_27_0809 : Poly :=
[
  term ((1145077892859441821928036850911497083007721 : Rat) / 337415203702659030751481656517966109395996) [(3, 1), (5, 1), (6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1145077892859441821928036850911497083007721 : Rat) / 674830407405318061502963313035932218791992) [(3, 1), (5, 1), (6, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 809 for generator 27. -/
theorem ep_Q2_008_partial_27_0809_valid :
    mulPoly ep_Q2_008_coefficient_27_0809
        ep_Q2_008_generator_27_0800_0899 =
      ep_Q2_008_partial_27_0809 := by
  native_decide

/-- Coefficient term 810 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0810 : Poly :=
[
  term ((35060718510252995547 : Rat) / 1385912907228352718) [(3, 1), (5, 1), (6, 1), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 810 for generator 27. -/
def ep_Q2_008_partial_27_0810 : Poly :=
[
  term ((-35060718510252995547 : Rat) / 1385912907228352718) [(3, 1), (5, 1), (6, 1), (13, 2), (14, 1), (16, 1)],
  term ((35060718510252995547 : Rat) / 692956453614176359) [(3, 1), (5, 1), (6, 1), (13, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 810 for generator 27. -/
theorem ep_Q2_008_partial_27_0810_valid :
    mulPoly ep_Q2_008_coefficient_27_0810
        ep_Q2_008_generator_27_0800_0899 =
      ep_Q2_008_partial_27_0810 := by
  native_decide

/-- Coefficient term 811 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0811 : Poly :=
[
  term ((35060718510252995547 : Rat) / 2771825814456705436) [(3, 1), (5, 1), (6, 1), (13, 2), (16, 1)]
]

/-- Partial product 811 for generator 27. -/
def ep_Q2_008_partial_27_0811 : Poly :=
[
  term ((35060718510252995547 : Rat) / 1385912907228352718) [(3, 1), (5, 1), (6, 1), (13, 2), (14, 1), (16, 1)],
  term ((-35060718510252995547 : Rat) / 2771825814456705436) [(3, 1), (5, 1), (6, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 811 for generator 27. -/
theorem ep_Q2_008_partial_27_0811_valid :
    mulPoly ep_Q2_008_coefficient_27_0811
        ep_Q2_008_generator_27_0800_0899 =
      ep_Q2_008_partial_27_0811 := by
  native_decide

/-- Coefficient term 812 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0812 : Poly :=
[
  term ((5504577129687591413 : Rat) / 2771825814456705436) [(3, 1), (5, 1), (6, 1), (14, 1), (16, 1)]
]

/-- Partial product 812 for generator 27. -/
def ep_Q2_008_partial_27_0812 : Poly :=
[
  term ((-5504577129687591413 : Rat) / 2771825814456705436) [(3, 1), (5, 1), (6, 1), (14, 1), (16, 1)],
  term ((5504577129687591413 : Rat) / 1385912907228352718) [(3, 1), (5, 1), (6, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 812 for generator 27. -/
theorem ep_Q2_008_partial_27_0812_valid :
    mulPoly ep_Q2_008_coefficient_27_0812
        ep_Q2_008_generator_27_0800_0899 =
      ep_Q2_008_partial_27_0812 := by
  native_decide

/-- Coefficient term 813 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0813 : Poly :=
[
  term ((5504577129687591413 : Rat) / 5543651628913410872) [(3, 1), (5, 1), (6, 1), (16, 1)]
]

/-- Partial product 813 for generator 27. -/
def ep_Q2_008_partial_27_0813 : Poly :=
[
  term ((5504577129687591413 : Rat) / 2771825814456705436) [(3, 1), (5, 1), (6, 1), (14, 1), (16, 1)],
  term ((-5504577129687591413 : Rat) / 5543651628913410872) [(3, 1), (5, 1), (6, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 813 for generator 27. -/
theorem ep_Q2_008_partial_27_0813_valid :
    mulPoly ep_Q2_008_coefficient_27_0813
        ep_Q2_008_generator_27_0800_0899 =
      ep_Q2_008_partial_27_0813 := by
  native_decide

/-- Coefficient term 814 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0814 : Poly :=
[
  term ((-5454317389034277919942828724911377600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 814 for generator 27. -/
def ep_Q2_008_partial_27_0814 : Poly :=
[
  term ((-10908634778068555839885657449822755200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((5454317389034277919942828724911377600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 814 for generator 27. -/
theorem ep_Q2_008_partial_27_0814_valid :
    mulPoly ep_Q2_008_coefficient_27_0814
        ep_Q2_008_generator_27_0800_0899 =
      ep_Q2_008_partial_27_0814 := by
  native_decide

/-- Coefficient term 815 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0815 : Poly :=
[
  term ((-86111778068036223792 : Rat) / 692956453614176359) [(3, 1), (5, 1), (7, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 815 for generator 27. -/
def ep_Q2_008_partial_27_0815 : Poly :=
[
  term ((-172223556136072447584 : Rat) / 692956453614176359) [(3, 1), (5, 1), (7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((86111778068036223792 : Rat) / 692956453614176359) [(3, 1), (5, 1), (7, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 815 for generator 27. -/
theorem ep_Q2_008_partial_27_0815_valid :
    mulPoly ep_Q2_008_coefficient_27_0815
        ep_Q2_008_generator_27_0800_0899 =
      ep_Q2_008_partial_27_0815 := by
  native_decide

/-- Coefficient term 816 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0816 : Poly :=
[
  term ((354975089606243809156831192783545600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 816 for generator 27. -/
def ep_Q2_008_partial_27_0816 : Poly :=
[
  term ((-354975089606243809156831192783545600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((709950179212487618313662385567091200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (12, 1), (13, 2), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 816 for generator 27. -/
theorem ep_Q2_008_partial_27_0816_valid :
    mulPoly ep_Q2_008_coefficient_27_0816
        ep_Q2_008_generator_27_0800_0899 =
      ep_Q2_008_partial_27_0816 := by
  native_decide

/-- Coefficient term 817 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0817 : Poly :=
[
  term ((-666345168314036628858612328456756041144345 : Rat) / 168707601851329515375740828258983054697998) [(3, 1), (5, 1), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 817 for generator 27. -/
def ep_Q2_008_partial_27_0817 : Poly :=
[
  term ((-666345168314036628858612328456756041144345 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (7, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((666345168314036628858612328456756041144345 : Rat) / 168707601851329515375740828258983054697998) [(3, 1), (5, 1), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 817 for generator 27. -/
theorem ep_Q2_008_partial_27_0817_valid :
    mulPoly ep_Q2_008_coefficient_27_0817
        ep_Q2_008_generator_27_0800_0899 =
      ep_Q2_008_partial_27_0817 := by
  native_decide

/-- Coefficient term 818 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0818 : Poly :=
[
  term ((-55301031637968958879595197398913440000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (12, 1), (13, 3), (15, 2), (16, 1)]
]

/-- Partial product 818 for generator 27. -/
def ep_Q2_008_partial_27_0818 : Poly :=
[
  term ((-110602063275937917759190394797826880000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (12, 1), (13, 3), (14, 1), (15, 2), (16, 1)],
  term ((55301031637968958879595197398913440000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (12, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 818 for generator 27. -/
theorem ep_Q2_008_partial_27_0818_valid :
    mulPoly ep_Q2_008_coefficient_27_0818
        ep_Q2_008_generator_27_0800_0899 =
      ep_Q2_008_partial_27_0818 := by
  native_decide

/-- Coefficient term 819 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0819 : Poly :=
[
  term ((-19931756368265026717362179273942400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 819 for generator 27. -/
def ep_Q2_008_partial_27_0819 : Poly :=
[
  term ((19931756368265026717362179273942400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-39863512736530053434724358547884800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (12, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 819 for generator 27. -/
theorem ep_Q2_008_partial_27_0819_valid :
    mulPoly ep_Q2_008_coefficient_27_0819
        ep_Q2_008_generator_27_0800_0899 =
      ep_Q2_008_partial_27_0819 := by
  native_decide

/-- Coefficient term 820 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0820 : Poly :=
[
  term ((-769239208120150199913682442370449939480379 : Rat) / 674830407405318061502963313035932218791992) [(3, 1), (5, 1), (7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 820 for generator 27. -/
def ep_Q2_008_partial_27_0820 : Poly :=
[
  term ((-769239208120150199913682442370449939480379 : Rat) / 337415203702659030751481656517966109395996) [(3, 1), (5, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((769239208120150199913682442370449939480379 : Rat) / 674830407405318061502963313035932218791992) [(3, 1), (5, 1), (7, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 820 for generator 27. -/
theorem ep_Q2_008_partial_27_0820_valid :
    mulPoly ep_Q2_008_coefficient_27_0820
        ep_Q2_008_generator_27_0800_0899 =
      ep_Q2_008_partial_27_0820 := by
  native_decide

/-- Coefficient term 821 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0821 : Poly :=
[
  term ((14802408731447076579358133138601600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (12, 1), (15, 3), (16, 1)]
]

/-- Partial product 821 for generator 27. -/
def ep_Q2_008_partial_27_0821 : Poly :=
[
  term ((29604817462894153158716266277203200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((-14802408731447076579358133138601600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 821 for generator 27. -/
theorem ep_Q2_008_partial_27_0821_valid :
    mulPoly ep_Q2_008_coefficient_27_0821
        ep_Q2_008_generator_27_0800_0899 =
      ep_Q2_008_partial_27_0821 := by
  native_decide

/-- Coefficient term 822 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0822 : Poly :=
[
  term ((129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 822 for generator 27. -/
def ep_Q2_008_partial_27_0822 : Poly :=
[
  term ((258163701531813679386786322024396800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 822 for generator 27. -/
theorem ep_Q2_008_partial_27_0822_valid :
    mulPoly ep_Q2_008_coefficient_27_0822
        ep_Q2_008_generator_27_0800_0899 =
      ep_Q2_008_partial_27_0822 := by
  native_decide

/-- Coefficient term 823 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0823 : Poly :=
[
  term ((2022188088683045145613904855010144000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 823 for generator 27. -/
def ep_Q2_008_partial_27_0823 : Poly :=
[
  term ((-2022188088683045145613904855010144000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((4044376177366090291227809710020288000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (13, 1), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 823 for generator 27. -/
theorem ep_Q2_008_partial_27_0823_valid :
    mulPoly ep_Q2_008_coefficient_27_0823
        ep_Q2_008_generator_27_0800_0899 =
      ep_Q2_008_partial_27_0823 := by
  native_decide

/-- Coefficient term 824 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0824 : Poly :=
[
  term ((349306051734830454015 : Rat) / 5543651628913410872) [(3, 1), (5, 1), (7, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 824 for generator 27. -/
def ep_Q2_008_partial_27_0824 : Poly :=
[
  term ((-349306051734830454015 : Rat) / 5543651628913410872) [(3, 1), (5, 1), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((349306051734830454015 : Rat) / 2771825814456705436) [(3, 1), (5, 1), (7, 1), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 824 for generator 27. -/
theorem ep_Q2_008_partial_27_0824_valid :
    mulPoly ep_Q2_008_coefficient_27_0824
        ep_Q2_008_generator_27_0800_0899 =
      ep_Q2_008_partial_27_0824 := by
  native_decide

/-- Coefficient term 825 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0825 : Poly :=
[
  term ((1011094044341522572806952427505072000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 825 for generator 27. -/
def ep_Q2_008_partial_27_0825 : Poly :=
[
  term ((2022188088683045145613904855010144000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1011094044341522572806952427505072000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 825 for generator 27. -/
theorem ep_Q2_008_partial_27_0825_valid :
    mulPoly ep_Q2_008_coefficient_27_0825
        ep_Q2_008_generator_27_0800_0899 =
      ep_Q2_008_partial_27_0825 := by
  native_decide

/-- Coefficient term 826 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0826 : Poly :=
[
  term ((349306051734830454015 : Rat) / 11087303257826821744) [(3, 1), (5, 1), (7, 1), (13, 1), (16, 1)]
]

/-- Partial product 826 for generator 27. -/
def ep_Q2_008_partial_27_0826 : Poly :=
[
  term ((349306051734830454015 : Rat) / 5543651628913410872) [(3, 1), (5, 1), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-349306051734830454015 : Rat) / 11087303257826821744) [(3, 1), (5, 1), (7, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 826 for generator 27. -/
theorem ep_Q2_008_partial_27_0826_valid :
    mulPoly ep_Q2_008_coefficient_27_0826
        ep_Q2_008_generator_27_0800_0899 =
      ep_Q2_008_partial_27_0826 := by
  native_decide

/-- Coefficient term 827 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0827 : Poly :=
[
  term ((1348065931513816765632954458360836800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 827 for generator 27. -/
def ep_Q2_008_partial_27_0827 : Poly :=
[
  term ((-1348065931513816765632954458360836800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((2696131863027633531265908916721673600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (13, 2), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 827 for generator 27. -/
theorem ep_Q2_008_partial_27_0827_valid :
    mulPoly ep_Q2_008_coefficient_27_0827
        ep_Q2_008_generator_27_0800_0899 =
      ep_Q2_008_partial_27_0827 := by
  native_decide

/-- Coefficient term 828 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0828 : Poly :=
[
  term ((674032965756908382816477229180418400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 828 for generator 27. -/
def ep_Q2_008_partial_27_0828 : Poly :=
[
  term ((1348065931513816765632954458360836800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-674032965756908382816477229180418400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 828 for generator 27. -/
theorem ep_Q2_008_partial_27_0828_valid :
    mulPoly ep_Q2_008_coefficient_27_0828
        ep_Q2_008_generator_27_0800_0899 =
      ep_Q2_008_partial_27_0828 := by
  native_decide

/-- Coefficient term 829 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0829 : Poly :=
[
  term ((5474084778965724345 : Rat) / 1385912907228352718) [(3, 1), (5, 1), (7, 1), (13, 3), (14, 1), (16, 1)]
]

/-- Partial product 829 for generator 27. -/
def ep_Q2_008_partial_27_0829 : Poly :=
[
  term ((-5474084778965724345 : Rat) / 1385912907228352718) [(3, 1), (5, 1), (7, 1), (13, 3), (14, 1), (16, 1)],
  term ((5474084778965724345 : Rat) / 692956453614176359) [(3, 1), (5, 1), (7, 1), (13, 3), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 829 for generator 27. -/
theorem ep_Q2_008_partial_27_0829_valid :
    mulPoly ep_Q2_008_coefficient_27_0829
        ep_Q2_008_generator_27_0800_0899 =
      ep_Q2_008_partial_27_0829 := by
  native_decide

/-- Coefficient term 830 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0830 : Poly :=
[
  term ((5474084778965724345 : Rat) / 2771825814456705436) [(3, 1), (5, 1), (7, 1), (13, 3), (16, 1)]
]

/-- Partial product 830 for generator 27. -/
def ep_Q2_008_partial_27_0830 : Poly :=
[
  term ((5474084778965724345 : Rat) / 1385912907228352718) [(3, 1), (5, 1), (7, 1), (13, 3), (14, 1), (16, 1)],
  term ((-5474084778965724345 : Rat) / 2771825814456705436) [(3, 1), (5, 1), (7, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 830 for generator 27. -/
theorem ep_Q2_008_partial_27_0830_valid :
    mulPoly ep_Q2_008_coefficient_27_0830
        ep_Q2_008_generator_27_0800_0899 =
      ep_Q2_008_partial_27_0830 := by
  native_decide

/-- Coefficient term 831 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0831 : Poly :=
[
  term ((55301031637968958879595197398913440000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (13, 4), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 831 for generator 27. -/
def ep_Q2_008_partial_27_0831 : Poly :=
[
  term ((-55301031637968958879595197398913440000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (13, 4), (14, 1), (15, 1), (16, 1)],
  term ((110602063275937917759190394797826880000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (13, 4), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 831 for generator 27. -/
theorem ep_Q2_008_partial_27_0831_valid :
    mulPoly ep_Q2_008_coefficient_27_0831
        ep_Q2_008_generator_27_0800_0899 =
      ep_Q2_008_partial_27_0831 := by
  native_decide

/-- Coefficient term 832 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0832 : Poly :=
[
  term ((27650515818984479439797598699456720000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (13, 4), (15, 1), (16, 1)]
]

/-- Partial product 832 for generator 27. -/
def ep_Q2_008_partial_27_0832 : Poly :=
[
  term ((55301031637968958879595197398913440000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (13, 4), (14, 1), (15, 1), (16, 1)],
  term ((-27650515818984479439797598699456720000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (13, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 832 for generator 27. -/
theorem ep_Q2_008_partial_27_0832_valid :
    mulPoly ep_Q2_008_coefficient_27_0832
        ep_Q2_008_generator_27_0800_0899 =
      ep_Q2_008_partial_27_0832 := by
  native_decide

/-- Coefficient term 833 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0833 : Poly :=
[
  term ((44421879931871048571998626266675150402903 : Rat) / 337415203702659030751481656517966109395996) [(3, 1), (5, 1), (7, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 833 for generator 27. -/
def ep_Q2_008_partial_27_0833 : Poly :=
[
  term ((-44421879931871048571998626266675150402903 : Rat) / 337415203702659030751481656517966109395996) [(3, 1), (5, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((44421879931871048571998626266675150402903 : Rat) / 168707601851329515375740828258983054697998) [(3, 1), (5, 1), (7, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 833 for generator 27. -/
theorem ep_Q2_008_partial_27_0833_valid :
    mulPoly ep_Q2_008_coefficient_27_0833
        ep_Q2_008_generator_27_0800_0899 =
      ep_Q2_008_partial_27_0833 := by
  native_decide

/-- Coefficient term 834 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0834 : Poly :=
[
  term ((44421879931871048571998626266675150402903 : Rat) / 674830407405318061502963313035932218791992) [(3, 1), (5, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 834 for generator 27. -/
def ep_Q2_008_partial_27_0834 : Poly :=
[
  term ((44421879931871048571998626266675150402903 : Rat) / 337415203702659030751481656517966109395996) [(3, 1), (5, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-44421879931871048571998626266675150402903 : Rat) / 674830407405318061502963313035932218791992) [(3, 1), (5, 1), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 834 for generator 27. -/
theorem ep_Q2_008_partial_27_0834_valid :
    mulPoly ep_Q2_008_coefficient_27_0834
        ep_Q2_008_generator_27_0800_0899 =
      ep_Q2_008_partial_27_0834 := by
  native_decide

/-- Coefficient term 835 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0835 : Poly :=
[
  term ((-516327403063627358773572644048793600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 835 for generator 27. -/
def ep_Q2_008_partial_27_0835 : Poly :=
[
  term ((-1032654806127254717547145288097587200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((516327403063627358773572644048793600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 835 for generator 27. -/
theorem ep_Q2_008_partial_27_0835_valid :
    mulPoly ep_Q2_008_coefficient_27_0835
        ep_Q2_008_generator_27_0800_0899 =
      ep_Q2_008_partial_27_0835 := by
  native_decide

/-- Coefficient term 836 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0836 : Poly :=
[
  term ((-1523052751058306296882933698926784000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 2), (12, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 836 for generator 27. -/
def ep_Q2_008_partial_27_0836 : Poly :=
[
  term ((-3046105502116612593765867397853568000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 2), (12, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((1523052751058306296882933698926784000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 2), (12, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 836 for generator 27. -/
theorem ep_Q2_008_partial_27_0836_valid :
    mulPoly ep_Q2_008_coefficient_27_0836
        ep_Q2_008_generator_27_0800_0899 =
      ep_Q2_008_partial_27_0836 := by
  native_decide

/-- Coefficient term 837 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0837 : Poly :=
[
  term ((-115632458930785757835477040043155200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 2), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 837 for generator 27. -/
def ep_Q2_008_partial_27_0837 : Poly :=
[
  term ((-231264917861571515670954080086310400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((115632458930785757835477040043155200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 837 for generator 27. -/
theorem ep_Q2_008_partial_27_0837_valid :
    mulPoly ep_Q2_008_coefficient_27_0837
        ep_Q2_008_generator_27_0800_0899 =
      ep_Q2_008_partial_27_0837 := by
  native_decide

/-- Coefficient term 838 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0838 : Poly :=
[
  term ((272259310392045684096734448805766400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 838 for generator 27. -/
def ep_Q2_008_partial_27_0838 : Poly :=
[
  term ((-272259310392045684096734448805766400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((544518620784091368193468897611532800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 2), (13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 838 for generator 27. -/
theorem ep_Q2_008_partial_27_0838_valid :
    mulPoly ep_Q2_008_coefficient_27_0838
        ep_Q2_008_generator_27_0800_0899 =
      ep_Q2_008_partial_27_0838 := by
  native_decide

/-- Coefficient term 839 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0839 : Poly :=
[
  term ((136129655196022842048367224402883200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 839 for generator 27. -/
def ep_Q2_008_partial_27_0839 : Poly :=
[
  term ((272259310392045684096734448805766400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-136129655196022842048367224402883200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 839 for generator 27. -/
theorem ep_Q2_008_partial_27_0839_valid :
    mulPoly ep_Q2_008_coefficient_27_0839
        ep_Q2_008_generator_27_0800_0899 =
      ep_Q2_008_partial_27_0839 := by
  native_decide

/-- Coefficient term 840 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0840 : Poly :=
[
  term ((1523052751058306296882933698926784000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 2), (13, 3), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 840 for generator 27. -/
def ep_Q2_008_partial_27_0840 : Poly :=
[
  term ((-1523052751058306296882933698926784000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 2), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((3046105502116612593765867397853568000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 2), (13, 3), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 840 for generator 27. -/
theorem ep_Q2_008_partial_27_0840_valid :
    mulPoly ep_Q2_008_coefficient_27_0840
        ep_Q2_008_generator_27_0800_0899 =
      ep_Q2_008_partial_27_0840 := by
  native_decide

/-- Coefficient term 841 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0841 : Poly :=
[
  term ((761526375529153148441466849463392000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 2), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 841 for generator 27. -/
def ep_Q2_008_partial_27_0841 : Poly :=
[
  term ((1523052751058306296882933698926784000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 2), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-761526375529153148441466849463392000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 2), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 841 for generator 27. -/
theorem ep_Q2_008_partial_27_0841_valid :
    mulPoly ep_Q2_008_coefficient_27_0841
        ep_Q2_008_generator_27_0800_0899 =
      ep_Q2_008_partial_27_0841 := by
  native_decide

/-- Coefficient term 842 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0842 : Poly :=
[
  term ((50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 2), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 842 for generator 27. -/
def ep_Q2_008_partial_27_0842 : Poly :=
[
  term ((-50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 2), (14, 1), (15, 2), (16, 1)],
  term ((101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 2), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 842 for generator 27. -/
theorem ep_Q2_008_partial_27_0842_valid :
    mulPoly ep_Q2_008_coefficient_27_0842
        ep_Q2_008_generator_27_0800_0899 =
      ep_Q2_008_partial_27_0842 := by
  native_decide

/-- Coefficient term 843 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0843 : Poly :=
[
  term ((25384212517638438281382228315446400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 2), (15, 2), (16, 1)]
]

/-- Partial product 843 for generator 27. -/
def ep_Q2_008_partial_27_0843 : Poly :=
[
  term ((50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 2), (14, 1), (15, 2), (16, 1)],
  term ((-25384212517638438281382228315446400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 843 for generator 27. -/
theorem ep_Q2_008_partial_27_0843_valid :
    mulPoly ep_Q2_008_coefficient_27_0843
        ep_Q2_008_generator_27_0800_0899 =
      ep_Q2_008_partial_27_0843 := by
  native_decide

/-- Coefficient term 844 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0844 : Poly :=
[
  term ((-12734296484405958000 : Rat) / 692956453614176359) [(3, 1), (5, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 844 for generator 27. -/
def ep_Q2_008_partial_27_0844 : Poly :=
[
  term ((-25468592968811916000 : Rat) / 692956453614176359) [(3, 1), (5, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((12734296484405958000 : Rat) / 692956453614176359) [(3, 1), (5, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 844 for generator 27. -/
theorem ep_Q2_008_partial_27_0844_valid :
    mulPoly ep_Q2_008_coefficient_27_0844
        ep_Q2_008_generator_27_0800_0899 =
      ep_Q2_008_partial_27_0844 := by
  native_decide

/-- Coefficient term 845 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0845 : Poly :=
[
  term ((-385887772254726000 : Rat) / 692956453614176359) [(3, 1), (5, 1), (10, 1), (12, 1), (16, 1)]
]

/-- Partial product 845 for generator 27. -/
def ep_Q2_008_partial_27_0845 : Poly :=
[
  term ((-771775544509452000 : Rat) / 692956453614176359) [(3, 1), (5, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((385887772254726000 : Rat) / 692956453614176359) [(3, 1), (5, 1), (10, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 845 for generator 27. -/
theorem ep_Q2_008_partial_27_0845_valid :
    mulPoly ep_Q2_008_coefficient_27_0845
        ep_Q2_008_generator_27_0800_0899 =
      ep_Q2_008_partial_27_0845 := by
  native_decide

/-- Coefficient term 846 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0846 : Poly :=
[
  term ((12734296484405958000 : Rat) / 692956453614176359) [(3, 1), (5, 1), (10, 1), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 846 for generator 27. -/
def ep_Q2_008_partial_27_0846 : Poly :=
[
  term ((-12734296484405958000 : Rat) / 692956453614176359) [(3, 1), (5, 1), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((25468592968811916000 : Rat) / 692956453614176359) [(3, 1), (5, 1), (10, 1), (13, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 846 for generator 27. -/
theorem ep_Q2_008_partial_27_0846_valid :
    mulPoly ep_Q2_008_coefficient_27_0846
        ep_Q2_008_generator_27_0800_0899 =
      ep_Q2_008_partial_27_0846 := by
  native_decide

/-- Coefficient term 847 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0847 : Poly :=
[
  term ((6367148242202979000 : Rat) / 692956453614176359) [(3, 1), (5, 1), (10, 1), (13, 2), (16, 1)]
]

/-- Partial product 847 for generator 27. -/
def ep_Q2_008_partial_27_0847 : Poly :=
[
  term ((12734296484405958000 : Rat) / 692956453614176359) [(3, 1), (5, 1), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((-6367148242202979000 : Rat) / 692956453614176359) [(3, 1), (5, 1), (10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 847 for generator 27. -/
theorem ep_Q2_008_partial_27_0847_valid :
    mulPoly ep_Q2_008_coefficient_27_0847
        ep_Q2_008_generator_27_0800_0899 =
      ep_Q2_008_partial_27_0847 := by
  native_decide

/-- Coefficient term 848 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0848 : Poly :=
[
  term ((-11865942273258964307412982718492988585600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 848 for generator 27. -/
def ep_Q2_008_partial_27_0848 : Poly :=
[
  term ((-23731884546517928614825965436985977171200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((11865942273258964307412982718492988585600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 848 for generator 27. -/
theorem ep_Q2_008_partial_27_0848_valid :
    mulPoly ep_Q2_008_coefficient_27_0848
        ep_Q2_008_generator_27_0800_0899 =
      ep_Q2_008_partial_27_0848 := by
  native_decide

/-- Coefficient term 849 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0849 : Poly :=
[
  term ((-35734152853044180000 : Rat) / 692956453614176359) [(3, 1), (5, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 849 for generator 27. -/
def ep_Q2_008_partial_27_0849 : Poly :=
[
  term ((-71468305706088360000 : Rat) / 692956453614176359) [(3, 1), (5, 1), (11, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((35734152853044180000 : Rat) / 692956453614176359) [(3, 1), (5, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 849 for generator 27. -/
theorem ep_Q2_008_partial_27_0849_valid :
    mulPoly ep_Q2_008_coefficient_27_0849
        ep_Q2_008_generator_27_0800_0899 =
      ep_Q2_008_partial_27_0849 := by
  native_decide

/-- Coefficient term 850 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0850 : Poly :=
[
  term ((-2958245111371643517269956405331355264000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (11, 1), (12, 1), (13, 3), (15, 2), (16, 1)]
]

/-- Partial product 850 for generator 27. -/
def ep_Q2_008_partial_27_0850 : Poly :=
[
  term ((-5916490222743287034539912810662710528000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (11, 1), (12, 1), (13, 3), (14, 1), (15, 2), (16, 1)],
  term ((2958245111371643517269956405331355264000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (11, 1), (12, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 850 for generator 27. -/
theorem ep_Q2_008_partial_27_0850_valid :
    mulPoly ep_Q2_008_coefficient_27_0850
        ep_Q2_008_generator_27_0800_0899 =
      ep_Q2_008_partial_27_0850 := by
  native_decide

/-- Coefficient term 851 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0851 : Poly :=
[
  term ((-5527302246299986875 : Rat) / 2771825814456705436) [(3, 1), (5, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 851 for generator 27. -/
def ep_Q2_008_partial_27_0851 : Poly :=
[
  term ((-5527302246299986875 : Rat) / 1385912907228352718) [(3, 1), (5, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((5527302246299986875 : Rat) / 2771825814456705436) [(3, 1), (5, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 851 for generator 27. -/
theorem ep_Q2_008_partial_27_0851_valid :
    mulPoly ep_Q2_008_coefficient_27_0851
        ep_Q2_008_generator_27_0800_0899 =
      ep_Q2_008_partial_27_0851 := by
  native_decide

/-- Coefficient term 852 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0852 : Poly :=
[
  term ((98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 852 for generator 27. -/
def ep_Q2_008_partial_27_0852 : Poly :=
[
  term ((-98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (11, 1), (13, 1), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 852 for generator 27. -/
theorem ep_Q2_008_partial_27_0852_valid :
    mulPoly ep_Q2_008_coefficient_27_0852
        ep_Q2_008_generator_27_0800_0899 =
      ep_Q2_008_partial_27_0852 := by
  native_decide

/-- Coefficient term 853 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0853 : Poly :=
[
  term ((1401694617601348875 : Rat) / 2771825814456705436) [(3, 1), (5, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 853 for generator 27. -/
def ep_Q2_008_partial_27_0853 : Poly :=
[
  term ((-1401694617601348875 : Rat) / 2771825814456705436) [(3, 1), (5, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((1401694617601348875 : Rat) / 1385912907228352718) [(3, 1), (5, 1), (11, 1), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 853 for generator 27. -/
theorem ep_Q2_008_partial_27_0853_valid :
    mulPoly ep_Q2_008_coefficient_27_0853
        ep_Q2_008_generator_27_0800_0899 =
      ep_Q2_008_partial_27_0853 := by
  native_decide

/-- Coefficient term 854 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0854 : Poly :=
[
  term ((49304085189527391954499273422189254400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 854 for generator 27. -/
def ep_Q2_008_partial_27_0854 : Poly :=
[
  term ((98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-49304085189527391954499273422189254400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 854 for generator 27. -/
theorem ep_Q2_008_partial_27_0854_valid :
    mulPoly ep_Q2_008_coefficient_27_0854
        ep_Q2_008_generator_27_0800_0899 =
      ep_Q2_008_partial_27_0854 := by
  native_decide

/-- Coefficient term 855 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0855 : Poly :=
[
  term ((1401694617601348875 : Rat) / 5543651628913410872) [(3, 1), (5, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 855 for generator 27. -/
def ep_Q2_008_partial_27_0855 : Poly :=
[
  term ((1401694617601348875 : Rat) / 2771825814456705436) [(3, 1), (5, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1401694617601348875 : Rat) / 5543651628913410872) [(3, 1), (5, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 855 for generator 27. -/
theorem ep_Q2_008_partial_27_0855_valid :
    mulPoly ep_Q2_008_coefficient_27_0855
        ep_Q2_008_generator_27_0800_0899 =
      ep_Q2_008_partial_27_0855 := by
  native_decide

/-- Coefficient term 856 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0856 : Poly :=
[
  term ((6146668391273786840691067001519035075200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 856 for generator 27. -/
def ep_Q2_008_partial_27_0856 : Poly :=
[
  term ((-6146668391273786840691067001519035075200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((12293336782547573681382134003038070150400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (11, 1), (13, 2), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 856 for generator 27. -/
theorem ep_Q2_008_partial_27_0856_valid :
    mulPoly ep_Q2_008_coefficient_27_0856
        ep_Q2_008_generator_27_0800_0899 =
      ep_Q2_008_partial_27_0856 := by
  native_decide

/-- Coefficient term 857 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0857 : Poly :=
[
  term ((3073334195636893420345533500759517537600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 857 for generator 27. -/
def ep_Q2_008_partial_27_0857 : Poly :=
[
  term ((6146668391273786840691067001519035075200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-3073334195636893420345533500759517537600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 857 for generator 27. -/
theorem ep_Q2_008_partial_27_0857_valid :
    mulPoly ep_Q2_008_coefficient_27_0857
        ep_Q2_008_generator_27_0800_0899 =
      ep_Q2_008_partial_27_0857 := by
  native_decide

/-- Coefficient term 858 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0858 : Poly :=
[
  term ((35734152853044180000 : Rat) / 692956453614176359) [(3, 1), (5, 1), (11, 1), (13, 3), (14, 1), (16, 1)]
]

/-- Partial product 858 for generator 27. -/
def ep_Q2_008_partial_27_0858 : Poly :=
[
  term ((-35734152853044180000 : Rat) / 692956453614176359) [(3, 1), (5, 1), (11, 1), (13, 3), (14, 1), (16, 1)],
  term ((71468305706088360000 : Rat) / 692956453614176359) [(3, 1), (5, 1), (11, 1), (13, 3), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 858 for generator 27. -/
theorem ep_Q2_008_partial_27_0858_valid :
    mulPoly ep_Q2_008_coefficient_27_0858
        ep_Q2_008_generator_27_0800_0899 =
      ep_Q2_008_partial_27_0858 := by
  native_decide

/-- Coefficient term 859 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0859 : Poly :=
[
  term ((17867076426522090000 : Rat) / 692956453614176359) [(3, 1), (5, 1), (11, 1), (13, 3), (16, 1)]
]

/-- Partial product 859 for generator 27. -/
def ep_Q2_008_partial_27_0859 : Poly :=
[
  term ((35734152853044180000 : Rat) / 692956453614176359) [(3, 1), (5, 1), (11, 1), (13, 3), (14, 1), (16, 1)],
  term ((-17867076426522090000 : Rat) / 692956453614176359) [(3, 1), (5, 1), (11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 859 for generator 27. -/
theorem ep_Q2_008_partial_27_0859_valid :
    mulPoly ep_Q2_008_coefficient_27_0859
        ep_Q2_008_generator_27_0800_0899 =
      ep_Q2_008_partial_27_0859 := by
  native_decide

/-- Coefficient term 860 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0860 : Poly :=
[
  term ((2958245111371643517269956405331355264000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (11, 1), (13, 4), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 860 for generator 27. -/
def ep_Q2_008_partial_27_0860 : Poly :=
[
  term ((-2958245111371643517269956405331355264000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (11, 1), (13, 4), (14, 1), (15, 1), (16, 1)],
  term ((5916490222743287034539912810662710528000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (11, 1), (13, 4), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 860 for generator 27. -/
theorem ep_Q2_008_partial_27_0860_valid :
    mulPoly ep_Q2_008_coefficient_27_0860
        ep_Q2_008_generator_27_0800_0899 =
      ep_Q2_008_partial_27_0860 := by
  native_decide

/-- Coefficient term 861 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0861 : Poly :=
[
  term ((1479122555685821758634978202665677632000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (11, 1), (13, 4), (15, 1), (16, 1)]
]

/-- Partial product 861 for generator 27. -/
def ep_Q2_008_partial_27_0861 : Poly :=
[
  term ((2958245111371643517269956405331355264000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (11, 1), (13, 4), (14, 1), (15, 1), (16, 1)],
  term ((-1479122555685821758634978202665677632000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (11, 1), (13, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 861 for generator 27. -/
theorem ep_Q2_008_partial_27_0861_valid :
    mulPoly ep_Q2_008_coefficient_27_0861
        ep_Q2_008_generator_27_0800_0899 =
      ep_Q2_008_partial_27_0861 := by
  native_decide

/-- Coefficient term 862 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0862 : Poly :=
[
  term ((515700953587329750 : Rat) / 692956453614176359) [(3, 1), (5, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 862 for generator 27. -/
def ep_Q2_008_partial_27_0862 : Poly :=
[
  term ((-515700953587329750 : Rat) / 692956453614176359) [(3, 1), (5, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((1031401907174659500 : Rat) / 692956453614176359) [(3, 1), (5, 1), (11, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 862 for generator 27. -/
theorem ep_Q2_008_partial_27_0862_valid :
    mulPoly ep_Q2_008_coefficient_27_0862
        ep_Q2_008_generator_27_0800_0899 =
      ep_Q2_008_partial_27_0862 := by
  native_decide

/-- Coefficient term 863 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0863 : Poly :=
[
  term ((257850476793664875 : Rat) / 692956453614176359) [(3, 1), (5, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 863 for generator 27. -/
def ep_Q2_008_partial_27_0863 : Poly :=
[
  term ((515700953587329750 : Rat) / 692956453614176359) [(3, 1), (5, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-257850476793664875 : Rat) / 692956453614176359) [(3, 1), (5, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 863 for generator 27. -/
theorem ep_Q2_008_partial_27_0863_valid :
    mulPoly ep_Q2_008_coefficient_27_0863
        ep_Q2_008_generator_27_0800_0899 =
      ep_Q2_008_partial_27_0863 := by
  native_decide

/-- Coefficient term 864 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0864 : Poly :=
[
  term ((-96720821385638532995749287415432251133076331 : Rat) / 674830407405318061502963313035932218791992) [(3, 1), (5, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 864 for generator 27. -/
def ep_Q2_008_partial_27_0864 : Poly :=
[
  term ((-96720821385638532995749287415432251133076331 : Rat) / 337415203702659030751481656517966109395996) [(3, 1), (5, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((96720821385638532995749287415432251133076331 : Rat) / 674830407405318061502963313035932218791992) [(3, 1), (5, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 864 for generator 27. -/
theorem ep_Q2_008_partial_27_0864_valid :
    mulPoly ep_Q2_008_coefficient_27_0864
        ep_Q2_008_generator_27_0800_0899 =
      ep_Q2_008_partial_27_0864 := by
  native_decide

/-- Coefficient term 865 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0865 : Poly :=
[
  term ((1739875278557790414883770872471346758400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (12, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 865 for generator 27. -/
def ep_Q2_008_partial_27_0865 : Poly :=
[
  term ((3479750557115580829767541744942693516800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (12, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-1739875278557790414883770872471346758400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (12, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 865 for generator 27. -/
theorem ep_Q2_008_partial_27_0865_valid :
    mulPoly ep_Q2_008_coefficient_27_0865
        ep_Q2_008_generator_27_0800_0899 =
      ep_Q2_008_partial_27_0865 := by
  native_decide

/-- Coefficient term 866 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0866 : Poly :=
[
  term ((59201847421774903857 : Rat) / 692956453614176359) [(3, 1), (5, 1), (12, 1), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 866 for generator 27. -/
def ep_Q2_008_partial_27_0866 : Poly :=
[
  term ((-59201847421774903857 : Rat) / 692956453614176359) [(3, 1), (5, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((118403694843549807714 : Rat) / 692956453614176359) [(3, 1), (5, 1), (12, 1), (13, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 866 for generator 27. -/
theorem ep_Q2_008_partial_27_0866_valid :
    mulPoly ep_Q2_008_coefficient_27_0866
        ep_Q2_008_generator_27_0800_0899 =
      ep_Q2_008_partial_27_0866 := by
  native_decide

/-- Coefficient term 867 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0867 : Poly :=
[
  term ((-51421097118124404536418161316004122662400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (12, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 867 for generator 27. -/
def ep_Q2_008_partial_27_0867 : Poly :=
[
  term ((-102842194236248809072836322632008245324800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (12, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((51421097118124404536418161316004122662400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (12, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 867 for generator 27. -/
theorem ep_Q2_008_partial_27_0867_valid :
    mulPoly ep_Q2_008_coefficient_27_0867
        ep_Q2_008_generator_27_0800_0899 =
      ep_Q2_008_partial_27_0867 := by
  native_decide

/-- Coefficient term 868 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0868 : Poly :=
[
  term ((48437875163270375883 : Rat) / 692956453614176359) [(3, 1), (5, 1), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 868 for generator 27. -/
def ep_Q2_008_partial_27_0868 : Poly :=
[
  term ((96875750326540751766 : Rat) / 692956453614176359) [(3, 1), (5, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-48437875163270375883 : Rat) / 692956453614176359) [(3, 1), (5, 1), (12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 868 for generator 27. -/
theorem ep_Q2_008_partial_27_0868_valid :
    mulPoly ep_Q2_008_coefficient_27_0868
        ep_Q2_008_generator_27_0800_0899 =
      ep_Q2_008_partial_27_0868 := by
  native_decide

/-- Coefficient term 869 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0869 : Poly :=
[
  term ((-64383521180269003053 : Rat) / 11087303257826821744) [(3, 1), (5, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 869 for generator 27. -/
def ep_Q2_008_partial_27_0869 : Poly :=
[
  term ((64383521180269003053 : Rat) / 11087303257826821744) [(3, 1), (5, 1), (12, 1), (14, 1), (16, 1)],
  term ((-64383521180269003053 : Rat) / 5543651628913410872) [(3, 1), (5, 1), (12, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 869 for generator 27. -/
theorem ep_Q2_008_partial_27_0869_valid :
    mulPoly ep_Q2_008_coefficient_27_0869
        ep_Q2_008_generator_27_0800_0899 =
      ep_Q2_008_partial_27_0869 := by
  native_decide

/-- Coefficient term 870 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0870 : Poly :=
[
  term ((3902117879880274719223567712322940203463073 : Rat) / 337415203702659030751481656517966109395996) [(3, 1), (5, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 870 for generator 27. -/
def ep_Q2_008_partial_27_0870 : Poly :=
[
  term ((3902117879880274719223567712322940203463073 : Rat) / 168707601851329515375740828258983054697998) [(3, 1), (5, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-3902117879880274719223567712322940203463073 : Rat) / 337415203702659030751481656517966109395996) [(3, 1), (5, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 870 for generator 27. -/
theorem ep_Q2_008_partial_27_0870_valid :
    mulPoly ep_Q2_008_coefficient_27_0870
        ep_Q2_008_generator_27_0800_0899 =
      ep_Q2_008_partial_27_0870 := by
  native_decide

/-- Coefficient term 871 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0871 : Poly :=
[
  term ((-290628363095620340695 : Rat) / 11087303257826821744) [(3, 1), (5, 1), (12, 1), (16, 1)]
]

/-- Partial product 871 for generator 27. -/
def ep_Q2_008_partial_27_0871 : Poly :=
[
  term ((-290628363095620340695 : Rat) / 5543651628913410872) [(3, 1), (5, 1), (12, 1), (14, 1), (16, 1)],
  term ((290628363095620340695 : Rat) / 11087303257826821744) [(3, 1), (5, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 871 for generator 27. -/
theorem ep_Q2_008_partial_27_0871_valid :
    mulPoly ep_Q2_008_coefficient_27_0871
        ep_Q2_008_generator_27_0800_0899 =
      ep_Q2_008_partial_27_0871 := by
  native_decide

/-- Coefficient term 872 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0872 : Poly :=
[
  term ((21527944517009055948 : Rat) / 692956453614176359) [(3, 1), (5, 1), (12, 2), (16, 1)]
]

/-- Partial product 872 for generator 27. -/
def ep_Q2_008_partial_27_0872 : Poly :=
[
  term ((43055889034018111896 : Rat) / 692956453614176359) [(3, 1), (5, 1), (12, 2), (14, 1), (16, 1)],
  term ((-21527944517009055948 : Rat) / 692956453614176359) [(3, 1), (5, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 872 for generator 27. -/
theorem ep_Q2_008_partial_27_0872_valid :
    mulPoly ep_Q2_008_coefficient_27_0872
        ep_Q2_008_generator_27_0800_0899 =
      ep_Q2_008_partial_27_0872 := by
  native_decide

/-- Coefficient term 873 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0873 : Poly :=
[
  term ((11546977017160604311426817281730083991035495 : Rat) / 337415203702659030751481656517966109395996) [(3, 1), (5, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 873 for generator 27. -/
def ep_Q2_008_partial_27_0873 : Poly :=
[
  term ((-11546977017160604311426817281730083991035495 : Rat) / 337415203702659030751481656517966109395996) [(3, 1), (5, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((11546977017160604311426817281730083991035495 : Rat) / 168707601851329515375740828258983054697998) [(3, 1), (5, 1), (13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 873 for generator 27. -/
theorem ep_Q2_008_partial_27_0873_valid :
    mulPoly ep_Q2_008_coefficient_27_0873
        ep_Q2_008_generator_27_0800_0899 =
      ep_Q2_008_partial_27_0873 := by
  native_decide

/-- Coefficient term 874 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0874 : Poly :=
[
  term ((11546977017160604311426817281730083991035495 : Rat) / 674830407405318061502963313035932218791992) [(3, 1), (5, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 874 for generator 27. -/
def ep_Q2_008_partial_27_0874 : Poly :=
[
  term ((11546977017160604311426817281730083991035495 : Rat) / 337415203702659030751481656517966109395996) [(3, 1), (5, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-11546977017160604311426817281730083991035495 : Rat) / 674830407405318061502963313035932218791992) [(3, 1), (5, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 874 for generator 27. -/
theorem ep_Q2_008_partial_27_0874_valid :
    mulPoly ep_Q2_008_coefficient_27_0874
        ep_Q2_008_generator_27_0800_0899 =
      ep_Q2_008_partial_27_0874 := by
  native_decide

/-- Coefficient term 875 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0875 : Poly :=
[
  term ((-1739875278557790414883770872471346758400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (13, 2), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 875 for generator 27. -/
def ep_Q2_008_partial_27_0875 : Poly :=
[
  term ((1739875278557790414883770872471346758400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-3479750557115580829767541744942693516800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (13, 2), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 875 for generator 27. -/
theorem ep_Q2_008_partial_27_0875_valid :
    mulPoly ep_Q2_008_coefficient_27_0875
        ep_Q2_008_generator_27_0800_0899 =
      ep_Q2_008_partial_27_0875 := by
  native_decide

/-- Coefficient term 876 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0876 : Poly :=
[
  term ((234727197195340555923 : Rat) / 5543651628913410872) [(3, 1), (5, 1), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 876 for generator 27. -/
def ep_Q2_008_partial_27_0876 : Poly :=
[
  term ((-234727197195340555923 : Rat) / 5543651628913410872) [(3, 1), (5, 1), (13, 2), (14, 1), (16, 1)],
  term ((234727197195340555923 : Rat) / 2771825814456705436) [(3, 1), (5, 1), (13, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 876 for generator 27. -/
theorem ep_Q2_008_partial_27_0876_valid :
    mulPoly ep_Q2_008_coefficient_27_0876
        ep_Q2_008_generator_27_0800_0899 =
      ep_Q2_008_partial_27_0876 := by
  native_decide

/-- Coefficient term 877 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0877 : Poly :=
[
  term ((-869937639278895207441885436235673379200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 877 for generator 27. -/
def ep_Q2_008_partial_27_0877 : Poly :=
[
  term ((-1739875278557790414883770872471346758400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((869937639278895207441885436235673379200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 877 for generator 27. -/
theorem ep_Q2_008_partial_27_0877_valid :
    mulPoly ep_Q2_008_coefficient_27_0877
        ep_Q2_008_generator_27_0800_0899 =
      ep_Q2_008_partial_27_0877 := by
  native_decide

/-- Coefficient term 878 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0878 : Poly :=
[
  term ((234727197195340555923 : Rat) / 11087303257826821744) [(3, 1), (5, 1), (13, 2), (16, 1)]
]

/-- Partial product 878 for generator 27. -/
def ep_Q2_008_partial_27_0878 : Poly :=
[
  term ((234727197195340555923 : Rat) / 5543651628913410872) [(3, 1), (5, 1), (13, 2), (14, 1), (16, 1)],
  term ((-234727197195340555923 : Rat) / 11087303257826821744) [(3, 1), (5, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 878 for generator 27. -/
theorem ep_Q2_008_partial_27_0878_valid :
    mulPoly ep_Q2_008_coefficient_27_0878
        ep_Q2_008_generator_27_0800_0899 =
      ep_Q2_008_partial_27_0878 := by
  native_decide

/-- Coefficient term 879 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0879 : Poly :=
[
  term ((51421097118124404536418161316004122662400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (13, 3), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 879 for generator 27. -/
def ep_Q2_008_partial_27_0879 : Poly :=
[
  term ((-51421097118124404536418161316004122662400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((102842194236248809072836322632008245324800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (13, 3), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 879 for generator 27. -/
theorem ep_Q2_008_partial_27_0879_valid :
    mulPoly ep_Q2_008_coefficient_27_0879
        ep_Q2_008_generator_27_0800_0899 =
      ep_Q2_008_partial_27_0879 := by
  native_decide

/-- Coefficient term 880 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0880 : Poly :=
[
  term ((25710548559062202268209080658002061331200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 880 for generator 27. -/
def ep_Q2_008_partial_27_0880 : Poly :=
[
  term ((51421097118124404536418161316004122662400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-25710548559062202268209080658002061331200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 880 for generator 27. -/
theorem ep_Q2_008_partial_27_0880_valid :
    mulPoly ep_Q2_008_coefficient_27_0880
        ep_Q2_008_generator_27_0800_0899 =
      ep_Q2_008_partial_27_0880 := by
  native_decide

/-- Coefficient term 881 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0881 : Poly :=
[
  term ((33941009291432071818123864019373406723000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 881 for generator 27. -/
def ep_Q2_008_partial_27_0881 : Poly :=
[
  term ((-33941009291432071818123864019373406723000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (14, 1), (15, 2), (16, 1)],
  term ((67882018582864143636247728038746813446000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 881 for generator 27. -/
theorem ep_Q2_008_partial_27_0881_valid :
    mulPoly ep_Q2_008_coefficient_27_0881
        ep_Q2_008_generator_27_0800_0899 =
      ep_Q2_008_partial_27_0881 := by
  native_decide

/-- Coefficient term 882 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0882 : Poly :=
[
  term ((8234778841197807247 : Rat) / 11087303257826821744) [(3, 1), (5, 1), (14, 1), (16, 1)]
]

/-- Partial product 882 for generator 27. -/
def ep_Q2_008_partial_27_0882 : Poly :=
[
  term ((-8234778841197807247 : Rat) / 11087303257826821744) [(3, 1), (5, 1), (14, 1), (16, 1)],
  term ((8234778841197807247 : Rat) / 5543651628913410872) [(3, 1), (5, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 882 for generator 27. -/
theorem ep_Q2_008_partial_27_0882_valid :
    mulPoly ep_Q2_008_coefficient_27_0882
        ep_Q2_008_generator_27_0800_0899 =
      ep_Q2_008_partial_27_0882 := by
  native_decide

/-- Coefficient term 883 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0883 : Poly :=
[
  term ((16970504645716035909061932009686703361500 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (15, 2), (16, 1)]
]

/-- Partial product 883 for generator 27. -/
def ep_Q2_008_partial_27_0883 : Poly :=
[
  term ((33941009291432071818123864019373406723000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (14, 1), (15, 2), (16, 1)],
  term ((-16970504645716035909061932009686703361500 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 883 for generator 27. -/
theorem ep_Q2_008_partial_27_0883_valid :
    mulPoly ep_Q2_008_coefficient_27_0883
        ep_Q2_008_generator_27_0800_0899 =
      ep_Q2_008_partial_27_0883 := by
  native_decide

/-- Coefficient term 884 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0884 : Poly :=
[
  term ((8234778841197807247 : Rat) / 22174606515653643488) [(3, 1), (5, 1), (16, 1)]
]

/-- Partial product 884 for generator 27. -/
def ep_Q2_008_partial_27_0884 : Poly :=
[
  term ((8234778841197807247 : Rat) / 11087303257826821744) [(3, 1), (5, 1), (14, 1), (16, 1)],
  term ((-8234778841197807247 : Rat) / 22174606515653643488) [(3, 1), (5, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 884 for generator 27. -/
theorem ep_Q2_008_partial_27_0884_valid :
    mulPoly ep_Q2_008_coefficient_27_0884
        ep_Q2_008_generator_27_0800_0899 =
      ep_Q2_008_partial_27_0884 := by
  native_decide

/-- Coefficient term 885 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0885 : Poly :=
[
  term ((968113880744301297700448707591488000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (7, 1), (12, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 885 for generator 27. -/
def ep_Q2_008_partial_27_0885 : Poly :=
[
  term ((1936227761488602595400897415182976000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (7, 1), (12, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-968113880744301297700448707591488000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (7, 1), (12, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 885 for generator 27. -/
theorem ep_Q2_008_partial_27_0885_valid :
    mulPoly ep_Q2_008_coefficient_27_0885
        ep_Q2_008_generator_27_0800_0899 =
      ep_Q2_008_partial_27_0885 := by
  native_decide

/-- Coefficient term 886 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0886 : Poly :=
[
  term ((81625287984323442747292734169478400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (7, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 886 for generator 27. -/
def ep_Q2_008_partial_27_0886 : Poly :=
[
  term ((163250575968646885494585468338956800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (7, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-81625287984323442747292734169478400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (7, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 886 for generator 27. -/
theorem ep_Q2_008_partial_27_0886_valid :
    mulPoly ep_Q2_008_coefficient_27_0886
        ep_Q2_008_generator_27_0800_0899 =
      ep_Q2_008_partial_27_0886 := by
  native_decide

/-- Coefficient term 887 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0887 : Poly :=
[
  term ((-17084362601370022900596153663379200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 887 for generator 27. -/
def ep_Q2_008_partial_27_0887 : Poly :=
[
  term ((17084362601370022900596153663379200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-34168725202740045801192307326758400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (7, 1), (13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 887 for generator 27. -/
theorem ep_Q2_008_partial_27_0887_valid :
    mulPoly ep_Q2_008_coefficient_27_0887
        ep_Q2_008_generator_27_0800_0899 =
      ep_Q2_008_partial_27_0887 := by
  native_decide

/-- Coefficient term 888 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0888 : Poly :=
[
  term ((-8542181300685011450298076831689600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (7, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 888 for generator 27. -/
def ep_Q2_008_partial_27_0888 : Poly :=
[
  term ((-17084362601370022900596153663379200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((8542181300685011450298076831689600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (7, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 888 for generator 27. -/
theorem ep_Q2_008_partial_27_0888_valid :
    mulPoly ep_Q2_008_coefficient_27_0888
        ep_Q2_008_generator_27_0800_0899 =
      ep_Q2_008_partial_27_0888 := by
  native_decide

/-- Coefficient term 889 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0889 : Poly :=
[
  term ((-968113880744301297700448707591488000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (7, 1), (13, 3), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 889 for generator 27. -/
def ep_Q2_008_partial_27_0889 : Poly :=
[
  term ((968113880744301297700448707591488000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (7, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-1936227761488602595400897415182976000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (7, 1), (13, 3), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 889 for generator 27. -/
theorem ep_Q2_008_partial_27_0889_valid :
    mulPoly ep_Q2_008_coefficient_27_0889
        ep_Q2_008_generator_27_0800_0899 =
      ep_Q2_008_partial_27_0889 := by
  native_decide

/-- Coefficient term 890 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0890 : Poly :=
[
  term ((-484056940372150648850224353795744000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (7, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 890 for generator 27. -/
def ep_Q2_008_partial_27_0890 : Poly :=
[
  term ((-968113880744301297700448707591488000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (7, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((484056940372150648850224353795744000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (7, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 890 for generator 27. -/
theorem ep_Q2_008_partial_27_0890_valid :
    mulPoly ep_Q2_008_coefficient_27_0890
        ep_Q2_008_generator_27_0800_0899 =
      ep_Q2_008_partial_27_0890 := by
  native_decide

/-- Coefficient term 891 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0891 : Poly :=
[
  term ((-32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (7, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 891 for generator 27. -/
def ep_Q2_008_partial_27_0891 : Poly :=
[
  term ((32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((-64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (7, 1), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 891 for generator 27. -/
theorem ep_Q2_008_partial_27_0891_valid :
    mulPoly ep_Q2_008_coefficient_27_0891
        ep_Q2_008_generator_27_0800_0899 =
      ep_Q2_008_partial_27_0891 := by
  native_decide

/-- Coefficient term 892 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0892 : Poly :=
[
  term ((-16135231345738354961674145126524800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (7, 1), (15, 2), (16, 1)]
]

/-- Partial product 892 for generator 27. -/
def ep_Q2_008_partial_27_0892 : Poly :=
[
  term ((-32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((16135231345738354961674145126524800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (7, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 892 for generator 27. -/
theorem ep_Q2_008_partial_27_0892_valid :
    mulPoly ep_Q2_008_coefficient_27_0892
        ep_Q2_008_generator_27_0800_0899 =
      ep_Q2_008_partial_27_0892 := by
  native_decide

/-- Coefficient term 893 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0893 : Poly :=
[
  term ((161459583877567919610 : Rat) / 692956453614176359) [(3, 1), (5, 2), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 893 for generator 27. -/
def ep_Q2_008_partial_27_0893 : Poly :=
[
  term ((322919167755135839220 : Rat) / 692956453614176359) [(3, 1), (5, 2), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-161459583877567919610 : Rat) / 692956453614176359) [(3, 1), (5, 2), (12, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 893 for generator 27. -/
theorem ep_Q2_008_partial_27_0893_valid :
    mulPoly ep_Q2_008_coefficient_27_0893
        ep_Q2_008_generator_27_0800_0899 =
      ep_Q2_008_partial_27_0893 := by
  native_decide

/-- Coefficient term 894 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0894 : Poly :=
[
  term ((101154417451875068919 : Rat) / 5543651628913410872) [(3, 1), (5, 2), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 894 for generator 27. -/
def ep_Q2_008_partial_27_0894 : Poly :=
[
  term ((101154417451875068919 : Rat) / 2771825814456705436) [(3, 1), (5, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-101154417451875068919 : Rat) / 5543651628913410872) [(3, 1), (5, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 894 for generator 27. -/
theorem ep_Q2_008_partial_27_0894_valid :
    mulPoly ep_Q2_008_coefficient_27_0894
        ep_Q2_008_generator_27_0800_0899 =
      ep_Q2_008_partial_27_0894 := by
  native_decide

/-- Coefficient term 895 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0895 : Poly :=
[
  term ((-15042639383838845127 : Rat) / 5543651628913410872) [(3, 1), (5, 2), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 895 for generator 27. -/
def ep_Q2_008_partial_27_0895 : Poly :=
[
  term ((15042639383838845127 : Rat) / 5543651628913410872) [(3, 1), (5, 2), (13, 1), (14, 1), (16, 1)],
  term ((-15042639383838845127 : Rat) / 2771825814456705436) [(3, 1), (5, 2), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 895 for generator 27. -/
theorem ep_Q2_008_partial_27_0895_valid :
    mulPoly ep_Q2_008_coefficient_27_0895
        ep_Q2_008_generator_27_0800_0899 =
      ep_Q2_008_partial_27_0895 := by
  native_decide

/-- Coefficient term 896 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0896 : Poly :=
[
  term ((-15042639383838845127 : Rat) / 11087303257826821744) [(3, 1), (5, 2), (13, 1), (16, 1)]
]

/-- Partial product 896 for generator 27. -/
def ep_Q2_008_partial_27_0896 : Poly :=
[
  term ((-15042639383838845127 : Rat) / 5543651628913410872) [(3, 1), (5, 2), (13, 1), (14, 1), (16, 1)],
  term ((15042639383838845127 : Rat) / 11087303257826821744) [(3, 1), (5, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 896 for generator 27. -/
theorem ep_Q2_008_partial_27_0896_valid :
    mulPoly ep_Q2_008_coefficient_27_0896
        ep_Q2_008_generator_27_0800_0899 =
      ep_Q2_008_partial_27_0896 := by
  native_decide

/-- Coefficient term 897 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0897 : Poly :=
[
  term ((-161459583877567919610 : Rat) / 692956453614176359) [(3, 1), (5, 2), (13, 3), (14, 1), (16, 1)]
]

/-- Partial product 897 for generator 27. -/
def ep_Q2_008_partial_27_0897 : Poly :=
[
  term ((161459583877567919610 : Rat) / 692956453614176359) [(3, 1), (5, 2), (13, 3), (14, 1), (16, 1)],
  term ((-322919167755135839220 : Rat) / 692956453614176359) [(3, 1), (5, 2), (13, 3), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 897 for generator 27. -/
theorem ep_Q2_008_partial_27_0897_valid :
    mulPoly ep_Q2_008_coefficient_27_0897
        ep_Q2_008_generator_27_0800_0899 =
      ep_Q2_008_partial_27_0897 := by
  native_decide

/-- Coefficient term 898 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0898 : Poly :=
[
  term ((-80729791938783959805 : Rat) / 692956453614176359) [(3, 1), (5, 2), (13, 3), (16, 1)]
]

/-- Partial product 898 for generator 27. -/
def ep_Q2_008_partial_27_0898 : Poly :=
[
  term ((-161459583877567919610 : Rat) / 692956453614176359) [(3, 1), (5, 2), (13, 3), (14, 1), (16, 1)],
  term ((80729791938783959805 : Rat) / 692956453614176359) [(3, 1), (5, 2), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 898 for generator 27. -/
theorem ep_Q2_008_partial_27_0898_valid :
    mulPoly ep_Q2_008_coefficient_27_0898
        ep_Q2_008_generator_27_0800_0899 =
      ep_Q2_008_partial_27_0898 := by
  native_decide

/-- Coefficient term 899 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0899 : Poly :=
[
  term ((-5381986129252263987 : Rat) / 692956453614176359) [(3, 1), (5, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 899 for generator 27. -/
def ep_Q2_008_partial_27_0899 : Poly :=
[
  term ((5381986129252263987 : Rat) / 692956453614176359) [(3, 1), (5, 2), (14, 1), (15, 1), (16, 1)],
  term ((-10763972258504527974 : Rat) / 692956453614176359) [(3, 1), (5, 2), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 899 for generator 27. -/
theorem ep_Q2_008_partial_27_0899_valid :
    mulPoly ep_Q2_008_coefficient_27_0899
        ep_Q2_008_generator_27_0800_0899 =
      ep_Q2_008_partial_27_0899 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_008_partials_27_0800_0899 : List Poly :=
[
  ep_Q2_008_partial_27_0800,
  ep_Q2_008_partial_27_0801,
  ep_Q2_008_partial_27_0802,
  ep_Q2_008_partial_27_0803,
  ep_Q2_008_partial_27_0804,
  ep_Q2_008_partial_27_0805,
  ep_Q2_008_partial_27_0806,
  ep_Q2_008_partial_27_0807,
  ep_Q2_008_partial_27_0808,
  ep_Q2_008_partial_27_0809,
  ep_Q2_008_partial_27_0810,
  ep_Q2_008_partial_27_0811,
  ep_Q2_008_partial_27_0812,
  ep_Q2_008_partial_27_0813,
  ep_Q2_008_partial_27_0814,
  ep_Q2_008_partial_27_0815,
  ep_Q2_008_partial_27_0816,
  ep_Q2_008_partial_27_0817,
  ep_Q2_008_partial_27_0818,
  ep_Q2_008_partial_27_0819,
  ep_Q2_008_partial_27_0820,
  ep_Q2_008_partial_27_0821,
  ep_Q2_008_partial_27_0822,
  ep_Q2_008_partial_27_0823,
  ep_Q2_008_partial_27_0824,
  ep_Q2_008_partial_27_0825,
  ep_Q2_008_partial_27_0826,
  ep_Q2_008_partial_27_0827,
  ep_Q2_008_partial_27_0828,
  ep_Q2_008_partial_27_0829,
  ep_Q2_008_partial_27_0830,
  ep_Q2_008_partial_27_0831,
  ep_Q2_008_partial_27_0832,
  ep_Q2_008_partial_27_0833,
  ep_Q2_008_partial_27_0834,
  ep_Q2_008_partial_27_0835,
  ep_Q2_008_partial_27_0836,
  ep_Q2_008_partial_27_0837,
  ep_Q2_008_partial_27_0838,
  ep_Q2_008_partial_27_0839,
  ep_Q2_008_partial_27_0840,
  ep_Q2_008_partial_27_0841,
  ep_Q2_008_partial_27_0842,
  ep_Q2_008_partial_27_0843,
  ep_Q2_008_partial_27_0844,
  ep_Q2_008_partial_27_0845,
  ep_Q2_008_partial_27_0846,
  ep_Q2_008_partial_27_0847,
  ep_Q2_008_partial_27_0848,
  ep_Q2_008_partial_27_0849,
  ep_Q2_008_partial_27_0850,
  ep_Q2_008_partial_27_0851,
  ep_Q2_008_partial_27_0852,
  ep_Q2_008_partial_27_0853,
  ep_Q2_008_partial_27_0854,
  ep_Q2_008_partial_27_0855,
  ep_Q2_008_partial_27_0856,
  ep_Q2_008_partial_27_0857,
  ep_Q2_008_partial_27_0858,
  ep_Q2_008_partial_27_0859,
  ep_Q2_008_partial_27_0860,
  ep_Q2_008_partial_27_0861,
  ep_Q2_008_partial_27_0862,
  ep_Q2_008_partial_27_0863,
  ep_Q2_008_partial_27_0864,
  ep_Q2_008_partial_27_0865,
  ep_Q2_008_partial_27_0866,
  ep_Q2_008_partial_27_0867,
  ep_Q2_008_partial_27_0868,
  ep_Q2_008_partial_27_0869,
  ep_Q2_008_partial_27_0870,
  ep_Q2_008_partial_27_0871,
  ep_Q2_008_partial_27_0872,
  ep_Q2_008_partial_27_0873,
  ep_Q2_008_partial_27_0874,
  ep_Q2_008_partial_27_0875,
  ep_Q2_008_partial_27_0876,
  ep_Q2_008_partial_27_0877,
  ep_Q2_008_partial_27_0878,
  ep_Q2_008_partial_27_0879,
  ep_Q2_008_partial_27_0880,
  ep_Q2_008_partial_27_0881,
  ep_Q2_008_partial_27_0882,
  ep_Q2_008_partial_27_0883,
  ep_Q2_008_partial_27_0884,
  ep_Q2_008_partial_27_0885,
  ep_Q2_008_partial_27_0886,
  ep_Q2_008_partial_27_0887,
  ep_Q2_008_partial_27_0888,
  ep_Q2_008_partial_27_0889,
  ep_Q2_008_partial_27_0890,
  ep_Q2_008_partial_27_0891,
  ep_Q2_008_partial_27_0892,
  ep_Q2_008_partial_27_0893,
  ep_Q2_008_partial_27_0894,
  ep_Q2_008_partial_27_0895,
  ep_Q2_008_partial_27_0896,
  ep_Q2_008_partial_27_0897,
  ep_Q2_008_partial_27_0898,
  ep_Q2_008_partial_27_0899
]

/-- Sum of partial products in this block. -/
def ep_Q2_008_block_27_0800_0899 : Poly :=
[
  term ((6960295874632231552094729270265600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3480147937316115776047364635132800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((107191047848535000 : Rat) / 692956453614176359) [(3, 1), (5, 1), (6, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-53595523924267500 : Rat) / 692956453614176359) [(3, 1), (5, 1), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-107191047848535000 : Rat) / 692956453614176359) [(3, 1), (5, 1), (6, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((26797761962133750 : Rat) / 692956453614176359) [(3, 1), (5, 1), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((7995170523765116349 : Rat) / 692956453614176359) [(3, 1), (5, 1), (6, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7995170523765116349 : Rat) / 1385912907228352718) [(3, 1), (5, 1), (6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-43055889034018111896 : Rat) / 692956453614176359) [(3, 1), (5, 1), (6, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((21527944517009055948 : Rat) / 692956453614176359) [(3, 1), (5, 1), (6, 1), (12, 1), (13, 2), (16, 1)],
  term ((-1145077892859441821928036850911497083007721 : Rat) / 168707601851329515375740828258983054697998) [(3, 1), (5, 1), (6, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-19856540141026962045 : Rat) / 1385912907228352718) [(3, 1), (5, 1), (6, 1), (12, 1), (14, 1), (16, 1)],
  term ((1145077892859441821928036850911497083007721 : Rat) / 337415203702659030751481656517966109395996) [(3, 1), (5, 1), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((19856540141026962045 : Rat) / 2771825814456705436) [(3, 1), (5, 1), (6, 1), (12, 1), (16, 1)],
  term ((1145077892859441821928036850911497083007721 : Rat) / 168707601851329515375740828258983054697998) [(3, 1), (5, 1), (6, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1145077892859441821928036850911497083007721 : Rat) / 674830407405318061502963313035932218791992) [(3, 1), (5, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((35060718510252995547 : Rat) / 692956453614176359) [(3, 1), (5, 1), (6, 1), (13, 2), (14, 2), (16, 1)],
  term ((-35060718510252995547 : Rat) / 2771825814456705436) [(3, 1), (5, 1), (6, 1), (13, 2), (16, 1)],
  term ((5504577129687591413 : Rat) / 1385912907228352718) [(3, 1), (5, 1), (6, 1), (14, 2), (16, 1)],
  term ((-5504577129687591413 : Rat) / 5543651628913410872) [(3, 1), (5, 1), (6, 1), (16, 1)],
  term ((-10908634778068555839885657449822755200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-172223556136072447584 : Rat) / 692956453614176359) [(3, 1), (5, 1), (7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((5454317389034277919942828724911377600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((86111778068036223792 : Rat) / 692956453614176359) [(3, 1), (5, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-666355462591635209929077876561346763966745 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (7, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((709950179212487618313662385567091200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (12, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((666345168314036628858612328456756041144345 : Rat) / 168707601851329515375740828258983054697998) [(3, 1), (5, 1), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-110602063275937917759190394797826880000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (12, 1), (13, 3), (14, 1), (15, 2), (16, 1)],
  term ((55301031637968958879595197398913440000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((-769236896036411481170583228357654162161979 : Rat) / 337415203702659030751481656517966109395996) [(3, 1), (5, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((29604817462894153158716266277203200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((-39863512736530053434724358547884800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((769239208120150199913682442370449939480379 : Rat) / 674830407405318061502963313035932218791992) [(3, 1), (5, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-14802408731447076579358133138601600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (12, 1), (15, 3), (16, 1)],
  term ((258163701531813679386786322024396800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((4044376177366090291227809710020288000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((349306051734830454015 : Rat) / 2771825814456705436) [(3, 1), (5, 1), (7, 1), (13, 1), (14, 2), (16, 1)],
  term ((-1011094044341522572806952427505072000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-349306051734830454015 : Rat) / 11087303257826821744) [(3, 1), (5, 1), (7, 1), (13, 1), (16, 1)],
  term ((2696131863027633531265908916721673600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((-674032965756908382816477229180418400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((5474084778965724345 : Rat) / 692956453614176359) [(3, 1), (5, 1), (7, 1), (13, 3), (14, 2), (16, 1)],
  term ((-5474084778965724345 : Rat) / 2771825814456705436) [(3, 1), (5, 1), (7, 1), (13, 3), (16, 1)],
  term ((110602063275937917759190394797826880000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (13, 4), (14, 2), (15, 1), (16, 1)],
  term ((-27650515818984479439797598699456720000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (13, 4), (15, 1), (16, 1)],
  term ((44421879931871048571998626266675150402903 : Rat) / 168707601851329515375740828258983054697998) [(3, 1), (5, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-44421879931871048571998626266675150402903 : Rat) / 674830407405318061502963313035932218791992) [(3, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-1032654806127254717547145288097587200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((516327403063627358773572644048793600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3046105502116612593765867397853568000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 2), (12, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((1523052751058306296882933698926784000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 2), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-231264917861571515670954080086310400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((115632458930785757835477040043155200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 2), (12, 1), (15, 2), (16, 1)],
  term ((544518620784091368193468897611532800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-136129655196022842048367224402883200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((3046105502116612593765867397853568000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 2), (13, 3), (14, 2), (15, 1), (16, 1)],
  term ((-761526375529153148441466849463392000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 2), (13, 3), (15, 1), (16, 1)],
  term ((101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 2), (14, 2), (15, 2), (16, 1)],
  term ((-25384212517638438281382228315446400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 2), (15, 2), (16, 1)],
  term ((-25468592968811916000 : Rat) / 692956453614176359) [(3, 1), (5, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((12734296484405958000 : Rat) / 692956453614176359) [(3, 1), (5, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-771775544509452000 : Rat) / 692956453614176359) [(3, 1), (5, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((385887772254726000 : Rat) / 692956453614176359) [(3, 1), (5, 1), (10, 1), (12, 1), (16, 1)],
  term ((25468592968811916000 : Rat) / 692956453614176359) [(3, 1), (5, 1), (10, 1), (13, 2), (14, 2), (16, 1)],
  term ((-6367148242202979000 : Rat) / 692956453614176359) [(3, 1), (5, 1), (10, 1), (13, 2), (16, 1)],
  term ((-23731884546517928614825965436985977171200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((11865942273258964307412982718492988585600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-71468305706088360000 : Rat) / 692956453614176359) [(3, 1), (5, 1), (11, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((35734152853044180000 : Rat) / 692956453614176359) [(3, 1), (5, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-5916490222743287034539912810662710528000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (11, 1), (12, 1), (13, 3), (14, 1), (15, 2), (16, 1)],
  term ((2958245111371643517269956405331355264000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (11, 1), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((-5527302246299986875 : Rat) / 1385912907228352718) [(3, 1), (5, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((5527302246299986875 : Rat) / 2771825814456705436) [(3, 1), (5, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (11, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((1401694617601348875 : Rat) / 1385912907228352718) [(3, 1), (5, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-49304085189527391954499273422189254400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1401694617601348875 : Rat) / 5543651628913410872) [(3, 1), (5, 1), (11, 1), (13, 1), (16, 1)],
  term ((12293336782547573681382134003038070150400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (11, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((-3073334195636893420345533500759517537600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((71468305706088360000 : Rat) / 692956453614176359) [(3, 1), (5, 1), (11, 1), (13, 3), (14, 2), (16, 1)],
  term ((-17867076426522090000 : Rat) / 692956453614176359) [(3, 1), (5, 1), (11, 1), (13, 3), (16, 1)],
  term ((5916490222743287034539912810662710528000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (11, 1), (13, 4), (14, 2), (15, 1), (16, 1)],
  term ((-1479122555685821758634978202665677632000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (11, 1), (13, 4), (15, 1), (16, 1)],
  term ((1031401907174659500 : Rat) / 692956453614176359) [(3, 1), (5, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-257850476793664875 : Rat) / 692956453614176359) [(3, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((-96720821385638532995749287415432251133076331 : Rat) / 337415203702659030751481656517966109395996) [(3, 1), (5, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((3479750557115580829767541744942693516800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (12, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((96720821385638532995749287415432251133076331 : Rat) / 674830407405318061502963313035932218791992) [(3, 1), (5, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1739875278557790414883770872471346758400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-102842194236248809072836322632008245324800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (12, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((37673902904765847909 : Rat) / 692956453614176359) [(3, 1), (5, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((118403694843549807714 : Rat) / 692956453614176359) [(3, 1), (5, 1), (12, 1), (13, 2), (14, 2), (16, 1)],
  term ((51421097118124404536418161316004122662400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-48437875163270375883 : Rat) / 692956453614176359) [(3, 1), (5, 1), (12, 1), (13, 2), (16, 1)],
  term ((3902117879880274719223567712322940203463073 : Rat) / 168707601851329515375740828258983054697998) [(3, 1), (5, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-516873205010971678337 : Rat) / 11087303257826821744) [(3, 1), (5, 1), (12, 1), (14, 1), (16, 1)],
  term ((-64383521180269003053 : Rat) / 5543651628913410872) [(3, 1), (5, 1), (12, 1), (14, 2), (16, 1)],
  term ((-3902117879880274719223567712322940203463073 : Rat) / 337415203702659030751481656517966109395996) [(3, 1), (5, 1), (12, 1), (15, 2), (16, 1)],
  term ((290628363095620340695 : Rat) / 11087303257826821744) [(3, 1), (5, 1), (12, 1), (16, 1)],
  term ((43055889034018111896 : Rat) / 692956453614176359) [(3, 1), (5, 1), (12, 2), (14, 1), (16, 1)],
  term ((-21527944517009055948 : Rat) / 692956453614176359) [(3, 1), (5, 1), (12, 2), (16, 1)],
  term ((11546977017160604311426817281730083991035495 : Rat) / 168707601851329515375740828258983054697998) [(3, 1), (5, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-11546977017160604311426817281730083991035495 : Rat) / 674830407405318061502963313035932218791992) [(3, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3479750557115580829767541744942693516800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (13, 2), (14, 2), (15, 2), (16, 1)],
  term ((234727197195340555923 : Rat) / 2771825814456705436) [(3, 1), (5, 1), (13, 2), (14, 2), (16, 1)],
  term ((869937639278895207441885436235673379200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (13, 2), (15, 2), (16, 1)],
  term ((-234727197195340555923 : Rat) / 11087303257826821744) [(3, 1), (5, 1), (13, 2), (16, 1)],
  term ((102842194236248809072836322632008245324800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (13, 3), (14, 2), (15, 1), (16, 1)],
  term ((-25710548559062202268209080658002061331200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (13, 3), (15, 1), (16, 1)],
  term ((67882018582864143636247728038746813446000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (14, 2), (15, 2), (16, 1)],
  term ((8234778841197807247 : Rat) / 5543651628913410872) [(3, 1), (5, 1), (14, 2), (16, 1)],
  term ((-16970504645716035909061932009686703361500 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (15, 2), (16, 1)],
  term ((-8234778841197807247 : Rat) / 22174606515653643488) [(3, 1), (5, 1), (16, 1)],
  term ((1936227761488602595400897415182976000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (7, 1), (12, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-968113880744301297700448707591488000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (7, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((163250575968646885494585468338956800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (7, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-81625287984323442747292734169478400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((-34168725202740045801192307326758400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (7, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((8542181300685011450298076831689600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1936227761488602595400897415182976000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (7, 1), (13, 3), (14, 2), (15, 1), (16, 1)],
  term ((484056940372150648850224353795744000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((-64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (7, 1), (14, 2), (15, 2), (16, 1)],
  term ((16135231345738354961674145126524800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (7, 1), (15, 2), (16, 1)],
  term ((322919167755135839220 : Rat) / 692956453614176359) [(3, 1), (5, 2), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-161459583877567919610 : Rat) / 692956453614176359) [(3, 1), (5, 2), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((101154417451875068919 : Rat) / 2771825814456705436) [(3, 1), (5, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-101154417451875068919 : Rat) / 5543651628913410872) [(3, 1), (5, 2), (12, 1), (15, 1), (16, 1)],
  term ((-15042639383838845127 : Rat) / 2771825814456705436) [(3, 1), (5, 2), (13, 1), (14, 2), (16, 1)],
  term ((15042639383838845127 : Rat) / 11087303257826821744) [(3, 1), (5, 2), (13, 1), (16, 1)],
  term ((-322919167755135839220 : Rat) / 692956453614176359) [(3, 1), (5, 2), (13, 3), (14, 2), (16, 1)],
  term ((80729791938783959805 : Rat) / 692956453614176359) [(3, 1), (5, 2), (13, 3), (16, 1)],
  term ((5381986129252263987 : Rat) / 692956453614176359) [(3, 1), (5, 2), (14, 1), (15, 1), (16, 1)],
  term ((-10763972258504527974 : Rat) / 692956453614176359) [(3, 1), (5, 2), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 27, terms 800 through 899. -/
theorem ep_Q2_008_block_27_0800_0899_valid :
    checkProductSumEq ep_Q2_008_partials_27_0800_0899
      ep_Q2_008_block_27_0800_0899 = true := by
  native_decide

end EpQ2008TermShards

end Patterns

end EndpointCertificate

end Problem97
