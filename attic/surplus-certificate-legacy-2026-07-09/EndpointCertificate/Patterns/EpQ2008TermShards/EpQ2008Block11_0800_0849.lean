/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_008, term block 11:800-849

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_008`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2008TermShards

/-- Generator polynomial 11 for endpoint certificate `ep_Q2_008`. -/
def ep_Q2_008_generator_11_0800_0849 : Poly :=
[
  term (2 : Rat) [(2, 1), (14, 1)],
  term (2 : Rat) [(3, 1), (15, 1)],
  term (-1 : Rat) [(14, 2)],
  term (-1 : Rat) [(15, 2)]
]

/-- Coefficient term 800 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0800 : Poly :=
[
  term ((5050832160450947517 : Rat) / 5543651628913410872) [(10, 1), (12, 1), (16, 1)]
]

/-- Partial product 800 for generator 11. -/
def ep_Q2_008_partial_11_0800 : Poly :=
[
  term ((5050832160450947517 : Rat) / 2771825814456705436) [(2, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((5050832160450947517 : Rat) / 2771825814456705436) [(3, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-5050832160450947517 : Rat) / 5543651628913410872) [(10, 1), (12, 1), (14, 2), (16, 1)],
  term ((-5050832160450947517 : Rat) / 5543651628913410872) [(10, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 800 for generator 11. -/
theorem ep_Q2_008_partial_11_0800_valid :
    mulPoly ep_Q2_008_coefficient_11_0800
        ep_Q2_008_generator_11_0800_0849 =
      ep_Q2_008_partial_11_0800 := by
  native_decide

/-- Coefficient term 801 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0801 : Poly :=
[
  term ((-3472989950292534000 : Rat) / 692956453614176359) [(10, 1), (12, 2), (16, 1)]
]

/-- Partial product 801 for generator 11. -/
def ep_Q2_008_partial_11_0801 : Poly :=
[
  term ((-6945979900585068000 : Rat) / 692956453614176359) [(2, 1), (10, 1), (12, 2), (14, 1), (16, 1)],
  term ((-6945979900585068000 : Rat) / 692956453614176359) [(3, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((3472989950292534000 : Rat) / 692956453614176359) [(10, 1), (12, 2), (14, 2), (16, 1)],
  term ((3472989950292534000 : Rat) / 692956453614176359) [(10, 1), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 801 for generator 11. -/
theorem ep_Q2_008_partial_11_0801_valid :
    mulPoly ep_Q2_008_coefficient_11_0801
        ep_Q2_008_generator_11_0800_0849 =
      ep_Q2_008_partial_11_0801 := by
  native_decide

/-- Coefficient term 802 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0802 : Poly :=
[
  term ((17449999590777010633278925880584192069461621 : Rat) / 337415203702659030751481656517966109395996) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 802 for generator 11. -/
def ep_Q2_008_partial_11_0802 : Poly :=
[
  term ((17449999590777010633278925880584192069461621 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((17449999590777010633278925880584192069461621 : Rat) / 168707601851329515375740828258983054697998) [(3, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-17449999590777010633278925880584192069461621 : Rat) / 337415203702659030751481656517966109395996) [(10, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-17449999590777010633278925880584192069461621 : Rat) / 337415203702659030751481656517966109395996) [(10, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 802 for generator 11. -/
theorem ep_Q2_008_partial_11_0802_valid :
    mulPoly ep_Q2_008_coefficient_11_0802
        ep_Q2_008_generator_11_0800_0849 =
      ep_Q2_008_partial_11_0802 := by
  native_decide

/-- Coefficient term 803 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0803 : Poly :=
[
  term ((-68202314783046340579097975438786756934000 : Rat) / 84353800925664757687870414129491527348999) [(10, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 803 for generator 11. -/
def ep_Q2_008_partial_11_0803 : Poly :=
[
  term ((-136404629566092681158195950877573513868000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (10, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-136404629566092681158195950877573513868000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (10, 1), (13, 2), (15, 3), (16, 1)],
  term ((68202314783046340579097975438786756934000 : Rat) / 84353800925664757687870414129491527348999) [(10, 1), (13, 2), (14, 2), (15, 2), (16, 1)],
  term ((68202314783046340579097975438786756934000 : Rat) / 84353800925664757687870414129491527348999) [(10, 1), (13, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 803 for generator 11. -/
theorem ep_Q2_008_partial_11_0803_valid :
    mulPoly ep_Q2_008_coefficient_11_0803
        ep_Q2_008_generator_11_0800_0849 =
      ep_Q2_008_partial_11_0803 := by
  native_decide

/-- Coefficient term 804 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0804 : Poly :=
[
  term ((13792899295430665821 : Rat) / 1385912907228352718) [(10, 1), (13, 2), (16, 1)]
]

/-- Partial product 804 for generator 11. -/
def ep_Q2_008_partial_11_0804 : Poly :=
[
  term ((13792899295430665821 : Rat) / 692956453614176359) [(2, 1), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((13792899295430665821 : Rat) / 692956453614176359) [(3, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-13792899295430665821 : Rat) / 1385912907228352718) [(10, 1), (13, 2), (14, 2), (16, 1)],
  term ((-13792899295430665821 : Rat) / 1385912907228352718) [(10, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 804 for generator 11. -/
theorem ep_Q2_008_partial_11_0804_valid :
    mulPoly ep_Q2_008_coefficient_11_0804
        ep_Q2_008_generator_11_0800_0849 =
      ep_Q2_008_partial_11_0804 := by
  native_decide

/-- Coefficient term 805 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0805 : Poly :=
[
  term ((-12604395992478266006157038658124377369600 : Rat) / 84353800925664757687870414129491527348999) [(10, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 805 for generator 11. -/
def ep_Q2_008_partial_11_0805 : Poly :=
[
  term ((-25208791984956532012314077316248754739200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (10, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-25208791984956532012314077316248754739200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (10, 1), (13, 3), (15, 2), (16, 1)],
  term ((12604395992478266006157038658124377369600 : Rat) / 84353800925664757687870414129491527348999) [(10, 1), (13, 3), (14, 2), (15, 1), (16, 1)],
  term ((12604395992478266006157038658124377369600 : Rat) / 84353800925664757687870414129491527348999) [(10, 1), (13, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 805 for generator 11. -/
theorem ep_Q2_008_partial_11_0805_valid :
    mulPoly ep_Q2_008_coefficient_11_0805
        ep_Q2_008_generator_11_0800_0849 =
      ep_Q2_008_partial_11_0805 := by
  native_decide

/-- Coefficient term 806 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0806 : Poly :=
[
  term ((-493229987690929460247528577684786776492600 : Rat) / 84353800925664757687870414129491527348999) [(10, 1), (15, 2), (16, 1)]
]

/-- Partial product 806 for generator 11. -/
def ep_Q2_008_partial_11_0806 : Poly :=
[
  term ((-986459975381858920495057155369573552985200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-986459975381858920495057155369573552985200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (10, 1), (15, 3), (16, 1)],
  term ((493229987690929460247528577684786776492600 : Rat) / 84353800925664757687870414129491527348999) [(10, 1), (14, 2), (15, 2), (16, 1)],
  term ((493229987690929460247528577684786776492600 : Rat) / 84353800925664757687870414129491527348999) [(10, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 806 for generator 11. -/
theorem ep_Q2_008_partial_11_0806_valid :
    mulPoly ep_Q2_008_coefficient_11_0806
        ep_Q2_008_generator_11_0800_0849 =
      ep_Q2_008_partial_11_0806 := by
  native_decide

/-- Coefficient term 807 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0807 : Poly :=
[
  term ((42711622889070958983 : Rat) / 5543651628913410872) [(10, 1), (16, 1)]
]

/-- Partial product 807 for generator 11. -/
def ep_Q2_008_partial_11_0807 : Poly :=
[
  term ((42711622889070958983 : Rat) / 2771825814456705436) [(2, 1), (10, 1), (14, 1), (16, 1)],
  term ((42711622889070958983 : Rat) / 2771825814456705436) [(3, 1), (10, 1), (15, 1), (16, 1)],
  term ((-42711622889070958983 : Rat) / 5543651628913410872) [(10, 1), (14, 2), (16, 1)],
  term ((-42711622889070958983 : Rat) / 5543651628913410872) [(10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 807 for generator 11. -/
theorem ep_Q2_008_partial_11_0807_valid :
    mulPoly ep_Q2_008_coefficient_11_0807
        ep_Q2_008_generator_11_0800_0849 =
      ep_Q2_008_partial_11_0807 := by
  native_decide

/-- Coefficient term 808 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0808 : Poly :=
[
  term ((-6945979900585068000 : Rat) / 692956453614176359) [(10, 2), (13, 2), (16, 1)]
]

/-- Partial product 808 for generator 11. -/
def ep_Q2_008_partial_11_0808 : Poly :=
[
  term ((-13891959801170136000 : Rat) / 692956453614176359) [(2, 1), (10, 2), (13, 2), (14, 1), (16, 1)],
  term ((-13891959801170136000 : Rat) / 692956453614176359) [(3, 1), (10, 2), (13, 2), (15, 1), (16, 1)],
  term ((6945979900585068000 : Rat) / 692956453614176359) [(10, 2), (13, 2), (14, 2), (16, 1)],
  term ((6945979900585068000 : Rat) / 692956453614176359) [(10, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 808 for generator 11. -/
theorem ep_Q2_008_partial_11_0808_valid :
    mulPoly ep_Q2_008_coefficient_11_0808
        ep_Q2_008_generator_11_0800_0849 =
      ep_Q2_008_partial_11_0808 := by
  native_decide

/-- Coefficient term 809 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0809 : Poly :=
[
  term ((11020747726338080733 : Rat) / 11087303257826821744) [(10, 2), (16, 1)]
]

/-- Partial product 809 for generator 11. -/
def ep_Q2_008_partial_11_0809 : Poly :=
[
  term ((11020747726338080733 : Rat) / 5543651628913410872) [(2, 1), (10, 2), (14, 1), (16, 1)],
  term ((11020747726338080733 : Rat) / 5543651628913410872) [(3, 1), (10, 2), (15, 1), (16, 1)],
  term ((-11020747726338080733 : Rat) / 11087303257826821744) [(10, 2), (14, 2), (16, 1)],
  term ((-11020747726338080733 : Rat) / 11087303257826821744) [(10, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 809 for generator 11. -/
theorem ep_Q2_008_partial_11_0809_valid :
    mulPoly ep_Q2_008_coefficient_11_0809
        ep_Q2_008_generator_11_0800_0849 =
      ep_Q2_008_partial_11_0809 := by
  native_decide

/-- Coefficient term 810 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0810 : Poly :=
[
  term ((80281954310949609573495533799552286302000 : Rat) / 84353800925664757687870414129491527348999) [(11, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 810 for generator 11. -/
def ep_Q2_008_partial_11_0810 : Poly :=
[
  term ((160563908621899219146991067599104572604000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((160563908621899219146991067599104572604000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (11, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-80281954310949609573495533799552286302000 : Rat) / 84353800925664757687870414129491527348999) [(11, 1), (12, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-80281954310949609573495533799552286302000 : Rat) / 84353800925664757687870414129491527348999) [(11, 1), (12, 1), (13, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 810 for generator 11. -/
theorem ep_Q2_008_partial_11_0810_valid :
    mulPoly ep_Q2_008_coefficient_11_0810
        ep_Q2_008_generator_11_0800_0849 =
      ep_Q2_008_partial_11_0810 := by
  native_decide

/-- Coefficient term 811 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0811 : Poly :=
[
  term ((-63662080170520297017 : Rat) / 2771825814456705436) [(11, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 811 for generator 11. -/
def ep_Q2_008_partial_11_0811 : Poly :=
[
  term ((-63662080170520297017 : Rat) / 1385912907228352718) [(2, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-63662080170520297017 : Rat) / 1385912907228352718) [(3, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((63662080170520297017 : Rat) / 2771825814456705436) [(11, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((63662080170520297017 : Rat) / 2771825814456705436) [(11, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 811 for generator 11. -/
theorem ep_Q2_008_partial_11_0811_valid :
    mulPoly ep_Q2_008_coefficient_11_0811
        ep_Q2_008_generator_11_0800_0849 =
      ep_Q2_008_partial_11_0811 := by
  native_decide

/-- Coefficient term 812 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0812 : Poly :=
[
  term ((6528919510526113325537733850559168672574000 : Rat) / 84353800925664757687870414129491527348999) [(11, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 812 for generator 11. -/
def ep_Q2_008_partial_11_0812 : Poly :=
[
  term ((13057839021052226651075467701118337345148000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (11, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((13057839021052226651075467701118337345148000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (11, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-6528919510526113325537733850559168672574000 : Rat) / 84353800925664757687870414129491527348999) [(11, 1), (12, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((-6528919510526113325537733850559168672574000 : Rat) / 84353800925664757687870414129491527348999) [(11, 1), (12, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 812 for generator 11. -/
theorem ep_Q2_008_partial_11_0812_valid :
    mulPoly ep_Q2_008_coefficient_11_0812
        ep_Q2_008_generator_11_0800_0849 =
      ep_Q2_008_partial_11_0812 := by
  native_decide

/-- Coefficient term 813 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0813 : Poly :=
[
  term ((4437367667057465275904934607997032896000 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (12, 1), (13, 3), (15, 2), (16, 1)]
]

/-- Partial product 813 for generator 11. -/
def ep_Q2_008_partial_11_0813 : Poly :=
[
  term ((8874735334114930551809869215994065792000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (11, 1), (12, 1), (13, 3), (14, 1), (15, 2), (16, 1)],
  term ((8874735334114930551809869215994065792000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 1), (12, 1), (13, 3), (15, 3), (16, 1)],
  term ((-4437367667057465275904934607997032896000 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (12, 1), (13, 3), (14, 2), (15, 2), (16, 1)],
  term ((-4437367667057465275904934607997032896000 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (12, 1), (13, 3), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 813 for generator 11. -/
theorem ep_Q2_008_partial_11_0813_valid :
    mulPoly ep_Q2_008_coefficient_11_0813
        ep_Q2_008_generator_11_0800_0849 =
      ep_Q2_008_partial_11_0813 := by
  native_decide

/-- Coefficient term 814 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0814 : Poly :=
[
  term ((247978834509805942244745414535387051545933 : Rat) / 674830407405318061502963313035932218791992) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 814 for generator 11. -/
def ep_Q2_008_partial_11_0814 : Poly :=
[
  term ((247978834509805942244745414535387051545933 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((247978834509805942244745414535387051545933 : Rat) / 337415203702659030751481656517966109395996) [(3, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-247978834509805942244745414535387051545933 : Rat) / 674830407405318061502963313035932218791992) [(11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-247978834509805942244745414535387051545933 : Rat) / 674830407405318061502963313035932218791992) [(11, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 814 for generator 11. -/
theorem ep_Q2_008_partial_11_0814_valid :
    mulPoly ep_Q2_008_coefficient_11_0814
        ep_Q2_008_generator_11_0800_0849 =
      ep_Q2_008_partial_11_0814 := by
  native_decide

/-- Coefficient term 815 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0815 : Poly :=
[
  term ((-9529107427478448000 : Rat) / 692956453614176359) [(11, 1), (12, 2), (13, 1), (16, 1)]
]

/-- Partial product 815 for generator 11. -/
def ep_Q2_008_partial_11_0815 : Poly :=
[
  term ((-19058214854956896000 : Rat) / 692956453614176359) [(2, 1), (11, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-19058214854956896000 : Rat) / 692956453614176359) [(3, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((9529107427478448000 : Rat) / 692956453614176359) [(11, 1), (12, 2), (13, 1), (14, 2), (16, 1)],
  term ((9529107427478448000 : Rat) / 692956453614176359) [(11, 1), (12, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 815 for generator 11. -/
theorem ep_Q2_008_partial_11_0815_valid :
    mulPoly ep_Q2_008_coefficient_11_0815
        ep_Q2_008_generator_11_0800_0849 =
      ep_Q2_008_partial_11_0815 := by
  native_decide

/-- Coefficient term 816 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0816 : Poly :=
[
  term ((-788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (12, 2), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 816 for generator 11. -/
def ep_Q2_008_partial_11_0816 : Poly :=
[
  term ((-1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (11, 1), (12, 2), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 1), (12, 2), (13, 2), (15, 2), (16, 1)],
  term ((788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (12, 2), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (12, 2), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 816 for generator 11. -/
theorem ep_Q2_008_partial_11_0816_valid :
    mulPoly ep_Q2_008_coefficient_11_0816
        ep_Q2_008_generator_11_0800_0849 =
      ep_Q2_008_partial_11_0816 := by
  native_decide

/-- Coefficient term 817 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0817 : Poly :=
[
  term ((-1216729051811765980483263849554153117400 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 817 for generator 11. -/
def ep_Q2_008_partial_11_0817 : Poly :=
[
  term ((-2433458103623531960966527699108306234800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-2433458103623531960966527699108306234800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((1216729051811765980483263849554153117400 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((1216729051811765980483263849554153117400 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (12, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 817 for generator 11. -/
theorem ep_Q2_008_partial_11_0817_valid :
    mulPoly ep_Q2_008_coefficient_11_0817
        ep_Q2_008_generator_11_0800_0849 =
      ep_Q2_008_partial_11_0817 := by
  native_decide

/-- Coefficient term 818 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0818 : Poly :=
[
  term ((-29594538834701107847752275636970006596000 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 818 for generator 11. -/
def ep_Q2_008_partial_11_0818 : Poly :=
[
  term ((-59189077669402215695504551273940013192000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-59189077669402215695504551273940013192000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((29594538834701107847752275636970006596000 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((29594538834701107847752275636970006596000 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (13, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 818 for generator 11. -/
theorem ep_Q2_008_partial_11_0818_valid :
    mulPoly ep_Q2_008_coefficient_11_0818
        ep_Q2_008_generator_11_0800_0849 =
      ep_Q2_008_partial_11_0818 := by
  native_decide

/-- Coefficient term 819 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0819 : Poly :=
[
  term ((21161101007637534375 : Rat) / 1385912907228352718) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 819 for generator 11. -/
def ep_Q2_008_partial_11_0819 : Poly :=
[
  term ((21161101007637534375 : Rat) / 692956453614176359) [(2, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((21161101007637534375 : Rat) / 692956453614176359) [(3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-21161101007637534375 : Rat) / 1385912907228352718) [(11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-21161101007637534375 : Rat) / 1385912907228352718) [(11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 819 for generator 11. -/
theorem ep_Q2_008_partial_11_0819_valid :
    mulPoly ep_Q2_008_coefficient_11_0819
        ep_Q2_008_generator_11_0800_0849 =
      ep_Q2_008_partial_11_0819 := by
  native_decide

/-- Coefficient term 820 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0820 : Poly :=
[
  term ((9719165853678878605930508698666734301920300 : Rat) / 84353800925664757687870414129491527348999) [(11, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 820 for generator 11. -/
def ep_Q2_008_partial_11_0820 : Poly :=
[
  term ((19438331707357757211861017397333468603840600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((19438331707357757211861017397333468603840600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-9719165853678878605930508698666734301920300 : Rat) / 84353800925664757687870414129491527348999) [(11, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((-9719165853678878605930508698666734301920300 : Rat) / 84353800925664757687870414129491527348999) [(11, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 820 for generator 11. -/
theorem ep_Q2_008_partial_11_0820_valid :
    mulPoly ep_Q2_008_coefficient_11_0820
        ep_Q2_008_generator_11_0800_0849 =
      ep_Q2_008_partial_11_0820 := by
  native_decide

/-- Coefficient term 821 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0821 : Poly :=
[
  term ((-591649022274328703453991281066271052800 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (13, 2), (15, 3), (16, 1)]
]

/-- Partial product 821 for generator 11. -/
def ep_Q2_008_partial_11_0821 : Poly :=
[
  term ((-1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (11, 1), (13, 2), (14, 1), (15, 3), (16, 1)],
  term ((-1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 1), (13, 2), (15, 4), (16, 1)],
  term ((591649022274328703453991281066271052800 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (13, 2), (14, 2), (15, 3), (16, 1)],
  term ((591649022274328703453991281066271052800 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (13, 2), (15, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 821 for generator 11. -/
theorem ep_Q2_008_partial_11_0821_valid :
    mulPoly ep_Q2_008_coefficient_11_0821
        ep_Q2_008_generator_11_0800_0849 =
      ep_Q2_008_partial_11_0821 := by
  native_decide

/-- Coefficient term 822 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0822 : Poly :=
[
  term ((6705355585775725305811901185417738598400 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (13, 3), (15, 2), (16, 1)]
]

/-- Partial product 822 for generator 11. -/
def ep_Q2_008_partial_11_0822 : Poly :=
[
  term ((13410711171551450611623802370835477196800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (11, 1), (13, 3), (14, 1), (15, 2), (16, 1)],
  term ((13410711171551450611623802370835477196800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 1), (13, 3), (15, 3), (16, 1)],
  term ((-6705355585775725305811901185417738598400 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (13, 3), (14, 2), (15, 2), (16, 1)],
  term ((-6705355585775725305811901185417738598400 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (13, 3), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 822 for generator 11. -/
theorem ep_Q2_008_partial_11_0822_valid :
    mulPoly ep_Q2_008_coefficient_11_0822
        ep_Q2_008_generator_11_0800_0849 =
      ep_Q2_008_partial_11_0822 := by
  native_decide

/-- Coefficient term 823 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0823 : Poly :=
[
  term ((-23227199354478717000 : Rat) / 692956453614176359) [(11, 1), (13, 3), (16, 1)]
]

/-- Partial product 823 for generator 11. -/
def ep_Q2_008_partial_11_0823 : Poly :=
[
  term ((-46454398708957434000 : Rat) / 692956453614176359) [(2, 1), (11, 1), (13, 3), (14, 1), (16, 1)],
  term ((-46454398708957434000 : Rat) / 692956453614176359) [(3, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((23227199354478717000 : Rat) / 692956453614176359) [(11, 1), (13, 3), (14, 2), (16, 1)],
  term ((23227199354478717000 : Rat) / 692956453614176359) [(11, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 823 for generator 11. -/
theorem ep_Q2_008_partial_11_0823_valid :
    mulPoly ep_Q2_008_coefficient_11_0823
        ep_Q2_008_generator_11_0800_0849 =
      ep_Q2_008_partial_11_0823 := by
  native_decide

/-- Coefficient term 824 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0824 : Poly :=
[
  term ((-1922859322391568286225471663465380921600 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (13, 4), (15, 1), (16, 1)]
]

/-- Partial product 824 for generator 11. -/
def ep_Q2_008_partial_11_0824 : Poly :=
[
  term ((-3845718644783136572450943326930761843200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (11, 1), (13, 4), (14, 1), (15, 1), (16, 1)],
  term ((-3845718644783136572450943326930761843200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 1), (13, 4), (15, 2), (16, 1)],
  term ((1922859322391568286225471663465380921600 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (13, 4), (14, 2), (15, 1), (16, 1)],
  term ((1922859322391568286225471663465380921600 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (13, 4), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 824 for generator 11. -/
theorem ep_Q2_008_partial_11_0824_valid :
    mulPoly ep_Q2_008_coefficient_11_0824
        ep_Q2_008_generator_11_0800_0849 =
      ep_Q2_008_partial_11_0824 := by
  native_decide

/-- Coefficient term 825 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0825 : Poly :=
[
  term ((-1286075344007549740482835006665522204592875 : Rat) / 674830407405318061502963313035932218791992) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 825 for generator 11. -/
def ep_Q2_008_partial_11_0825 : Poly :=
[
  term ((-1286075344007549740482835006665522204592875 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1286075344007549740482835006665522204592875 : Rat) / 337415203702659030751481656517966109395996) [(3, 1), (11, 1), (15, 2), (16, 1)],
  term ((1286075344007549740482835006665522204592875 : Rat) / 674830407405318061502963313035932218791992) [(11, 1), (14, 2), (15, 1), (16, 1)],
  term ((1286075344007549740482835006665522204592875 : Rat) / 674830407405318061502963313035932218791992) [(11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 825 for generator 11. -/
theorem ep_Q2_008_partial_11_0825_valid :
    mulPoly ep_Q2_008_coefficient_11_0825
        ep_Q2_008_generator_11_0800_0849 =
      ep_Q2_008_partial_11_0825 := by
  native_decide

/-- Coefficient term 826 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0826 : Poly :=
[
  term ((-920408448992577443448803855048595456000 : Rat) / 84353800925664757687870414129491527348999) [(11, 1), (15, 3), (16, 1)]
]

/-- Partial product 826 for generator 11. -/
def ep_Q2_008_partial_11_0826 : Poly :=
[
  term ((-1840816897985154886897607710097190912000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (11, 1), (14, 1), (15, 3), (16, 1)],
  term ((-1840816897985154886897607710097190912000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (11, 1), (15, 4), (16, 1)],
  term ((920408448992577443448803855048595456000 : Rat) / 84353800925664757687870414129491527348999) [(11, 1), (14, 2), (15, 3), (16, 1)],
  term ((920408448992577443448803855048595456000 : Rat) / 84353800925664757687870414129491527348999) [(11, 1), (15, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 826 for generator 11. -/
theorem ep_Q2_008_partial_11_0826_valid :
    mulPoly ep_Q2_008_coefficient_11_0826
        ep_Q2_008_generator_11_0800_0849 =
      ep_Q2_008_partial_11_0826 := by
  native_decide

/-- Coefficient term 827 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0827 : Poly :=
[
  term ((134607341108404353960247653855076339622700 : Rat) / 84353800925664757687870414129491527348999) [(11, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 827 for generator 11. -/
def ep_Q2_008_partial_11_0827 : Poly :=
[
  term ((269214682216808707920495307710152679245400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (11, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((269214682216808707920495307710152679245400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (11, 2), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-134607341108404353960247653855076339622700 : Rat) / 84353800925664757687870414129491527348999) [(11, 2), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-134607341108404353960247653855076339622700 : Rat) / 84353800925664757687870414129491527348999) [(11, 2), (12, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 827 for generator 11. -/
theorem ep_Q2_008_partial_11_0827_valid :
    mulPoly ep_Q2_008_coefficient_11_0827
        ep_Q2_008_generator_11_0800_0849 =
      ep_Q2_008_partial_11_0827 := by
  native_decide

/-- Coefficient term 828 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0828 : Poly :=
[
  term ((197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(11, 2), (12, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 828 for generator 11. -/
def ep_Q2_008_partial_11_0828 : Poly :=
[
  term ((394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (11, 2), (12, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 2), (12, 1), (13, 2), (15, 3), (16, 1)],
  term ((-197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(11, 2), (12, 1), (13, 2), (14, 2), (15, 2), (16, 1)],
  term ((-197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(11, 2), (12, 1), (13, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 828 for generator 11. -/
theorem ep_Q2_008_partial_11_0828_valid :
    mulPoly ep_Q2_008_coefficient_11_0828
        ep_Q2_008_generator_11_0800_0849 =
      ep_Q2_008_partial_11_0828 := by
  native_decide

/-- Coefficient term 829 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0829 : Poly :=
[
  term ((14293661141217672000 : Rat) / 692956453614176359) [(11, 2), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 829 for generator 11. -/
def ep_Q2_008_partial_11_0829 : Poly :=
[
  term ((28587322282435344000 : Rat) / 692956453614176359) [(2, 1), (11, 2), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((28587322282435344000 : Rat) / 692956453614176359) [(3, 1), (11, 2), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-14293661141217672000 : Rat) / 692956453614176359) [(11, 2), (12, 1), (13, 2), (14, 2), (16, 1)],
  term ((-14293661141217672000 : Rat) / 692956453614176359) [(11, 2), (12, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 829 for generator 11. -/
theorem ep_Q2_008_partial_11_0829_valid :
    mulPoly ep_Q2_008_coefficient_11_0829
        ep_Q2_008_generator_11_0800_0849 =
      ep_Q2_008_partial_11_0829 := by
  native_decide

/-- Coefficient term 830 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0830 : Poly :=
[
  term ((1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(11, 2), (12, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 830 for generator 11. -/
def ep_Q2_008_partial_11_0830 : Poly :=
[
  term ((2366596089097314813815965124265084211200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (11, 2), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((2366596089097314813815965124265084211200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 2), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((-1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(11, 2), (12, 1), (13, 3), (14, 2), (15, 1), (16, 1)],
  term ((-1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(11, 2), (12, 1), (13, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 830 for generator 11. -/
theorem ep_Q2_008_partial_11_0830_valid :
    mulPoly ep_Q2_008_coefficient_11_0830
        ep_Q2_008_generator_11_0800_0849 =
      ep_Q2_008_partial_11_0830 := by
  native_decide

/-- Coefficient term 831 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0831 : Poly :=
[
  term ((5952518285441448375 : Rat) / 1385912907228352718) [(11, 2), (12, 1), (16, 1)]
]

/-- Partial product 831 for generator 11. -/
def ep_Q2_008_partial_11_0831 : Poly :=
[
  term ((5952518285441448375 : Rat) / 692956453614176359) [(2, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((5952518285441448375 : Rat) / 692956453614176359) [(3, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-5952518285441448375 : Rat) / 1385912907228352718) [(11, 2), (12, 1), (14, 2), (16, 1)],
  term ((-5952518285441448375 : Rat) / 1385912907228352718) [(11, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 831 for generator 11. -/
theorem ep_Q2_008_partial_11_0831_valid :
    mulPoly ep_Q2_008_coefficient_11_0831
        ep_Q2_008_generator_11_0800_0849 =
      ep_Q2_008_partial_11_0831 := by
  native_decide

/-- Coefficient term 832 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0832 : Poly :=
[
  term ((-98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(11, 2), (12, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 832 for generator 11. -/
def ep_Q2_008_partial_11_0832 : Poly :=
[
  term ((-197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (11, 2), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 2), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(11, 2), (12, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(11, 2), (12, 2), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 832 for generator 11. -/
theorem ep_Q2_008_partial_11_0832_valid :
    mulPoly ep_Q2_008_coefficient_11_0832
        ep_Q2_008_generator_11_0800_0849 =
      ep_Q2_008_partial_11_0832 := by
  native_decide

/-- Coefficient term 833 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0833 : Poly :=
[
  term ((-515700953587329750 : Rat) / 692956453614176359) [(11, 2), (12, 2), (16, 1)]
]

/-- Partial product 833 for generator 11. -/
def ep_Q2_008_partial_11_0833 : Poly :=
[
  term ((-1031401907174659500 : Rat) / 692956453614176359) [(2, 1), (11, 2), (12, 2), (14, 1), (16, 1)],
  term ((-1031401907174659500 : Rat) / 692956453614176359) [(3, 1), (11, 2), (12, 2), (15, 1), (16, 1)],
  term ((515700953587329750 : Rat) / 692956453614176359) [(11, 2), (12, 2), (14, 2), (16, 1)],
  term ((515700953587329750 : Rat) / 692956453614176359) [(11, 2), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 833 for generator 11. -/
theorem ep_Q2_008_partial_11_0833_valid :
    mulPoly ep_Q2_008_coefficient_11_0833
        ep_Q2_008_generator_11_0800_0849 =
      ep_Q2_008_partial_11_0833 := by
  native_decide

/-- Coefficient term 834 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0834 : Poly :=
[
  term ((-2020738218372206486401553021194845523200 : Rat) / 84353800925664757687870414129491527348999) [(11, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 834 for generator 11. -/
def ep_Q2_008_partial_11_0834 : Poly :=
[
  term ((-4041476436744412972803106042389691046400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4041476436744412972803106042389691046400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((2020738218372206486401553021194845523200 : Rat) / 84353800925664757687870414129491527348999) [(11, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((2020738218372206486401553021194845523200 : Rat) / 84353800925664757687870414129491527348999) [(11, 2), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 834 for generator 11. -/
theorem ep_Q2_008_partial_11_0834_valid :
    mulPoly ep_Q2_008_coefficient_11_0834
        ep_Q2_008_generator_11_0800_0849 =
      ep_Q2_008_partial_11_0834 := by
  native_decide

/-- Coefficient term 835 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0835 : Poly :=
[
  term ((375613366775954733 : Rat) / 11087303257826821744) [(11, 2), (16, 1)]
]

/-- Partial product 835 for generator 11. -/
def ep_Q2_008_partial_11_0835 : Poly :=
[
  term ((375613366775954733 : Rat) / 5543651628913410872) [(2, 1), (11, 2), (14, 1), (16, 1)],
  term ((375613366775954733 : Rat) / 5543651628913410872) [(3, 1), (11, 2), (15, 1), (16, 1)],
  term ((-375613366775954733 : Rat) / 11087303257826821744) [(11, 2), (14, 2), (16, 1)],
  term ((-375613366775954733 : Rat) / 11087303257826821744) [(11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 835 for generator 11. -/
theorem ep_Q2_008_partial_11_0835_valid :
    mulPoly ep_Q2_008_coefficient_11_0835
        ep_Q2_008_generator_11_0800_0849 =
      ep_Q2_008_partial_11_0835 := by
  native_decide

/-- Coefficient term 836 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0836 : Poly :=
[
  term ((-28583835452810868024854318413272479432414679 : Rat) / 1349660814810636123005926626071864437583984) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 836 for generator 11. -/
def ep_Q2_008_partial_11_0836 : Poly :=
[
  term ((-28583835452810868024854318413272479432414679 : Rat) / 674830407405318061502963313035932218791992) [(2, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-28583835452810868024854318413272479432414679 : Rat) / 674830407405318061502963313035932218791992) [(3, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((28583835452810868024854318413272479432414679 : Rat) / 1349660814810636123005926626071864437583984) [(12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((28583835452810868024854318413272479432414679 : Rat) / 1349660814810636123005926626071864437583984) [(12, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 836 for generator 11. -/
theorem ep_Q2_008_partial_11_0836_valid :
    mulPoly ep_Q2_008_coefficient_11_0836
        ep_Q2_008_generator_11_0800_0849 =
      ep_Q2_008_partial_11_0836 := by
  native_decide

/-- Coefficient term 837 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0837 : Poly :=
[
  term ((-2723816650104925212153710468043271209600 : Rat) / 84353800925664757687870414129491527348999) [(12, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 837 for generator 11. -/
def ep_Q2_008_partial_11_0837 : Poly :=
[
  term ((-5447633300209850424307420936086542419200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (12, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-5447633300209850424307420936086542419200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (12, 1), (13, 1), (15, 4), (16, 1)],
  term ((2723816650104925212153710468043271209600 : Rat) / 84353800925664757687870414129491527348999) [(12, 1), (13, 1), (14, 2), (15, 3), (16, 1)],
  term ((2723816650104925212153710468043271209600 : Rat) / 84353800925664757687870414129491527348999) [(12, 1), (13, 1), (15, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 837 for generator 11. -/
theorem ep_Q2_008_partial_11_0837_valid :
    mulPoly ep_Q2_008_coefficient_11_0837
        ep_Q2_008_generator_11_0800_0849 =
      ep_Q2_008_partial_11_0837 := by
  native_decide

/-- Coefficient term 838 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0838 : Poly :=
[
  term ((78044306866101539604042823875760324588800 : Rat) / 84353800925664757687870414129491527348999) [(12, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 838 for generator 11. -/
def ep_Q2_008_partial_11_0838 : Poly :=
[
  term ((156088613732203079208085647751520649177600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (12, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((156088613732203079208085647751520649177600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (12, 1), (13, 2), (15, 3), (16, 1)],
  term ((-78044306866101539604042823875760324588800 : Rat) / 84353800925664757687870414129491527348999) [(12, 1), (13, 2), (14, 2), (15, 2), (16, 1)],
  term ((-78044306866101539604042823875760324588800 : Rat) / 84353800925664757687870414129491527348999) [(12, 1), (13, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 838 for generator 11. -/
theorem ep_Q2_008_partial_11_0838_valid :
    mulPoly ep_Q2_008_coefficient_11_0838
        ep_Q2_008_generator_11_0800_0849 =
      ep_Q2_008_partial_11_0838 := by
  native_decide

/-- Coefficient term 839 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0839 : Poly :=
[
  term ((-4986580138520299548904727954121064409940921 : Rat) / 674830407405318061502963313035932218791992) [(12, 1), (15, 2), (16, 1)]
]

/-- Partial product 839 for generator 11. -/
def ep_Q2_008_partial_11_0839 : Poly :=
[
  term ((-4986580138520299548904727954121064409940921 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-4986580138520299548904727954121064409940921 : Rat) / 337415203702659030751481656517966109395996) [(3, 1), (12, 1), (15, 3), (16, 1)],
  term ((4986580138520299548904727954121064409940921 : Rat) / 674830407405318061502963313035932218791992) [(12, 1), (14, 2), (15, 2), (16, 1)],
  term ((4986580138520299548904727954121064409940921 : Rat) / 674830407405318061502963313035932218791992) [(12, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 839 for generator 11. -/
theorem ep_Q2_008_partial_11_0839_valid :
    mulPoly ep_Q2_008_coefficient_11_0839
        ep_Q2_008_generator_11_0800_0849 =
      ep_Q2_008_partial_11_0839 := by
  native_decide

/-- Coefficient term 840 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0840 : Poly :=
[
  term ((513261169754797023 : Rat) / 2771825814456705436) [(12, 1), (16, 1)]
]

/-- Partial product 840 for generator 11. -/
def ep_Q2_008_partial_11_0840 : Poly :=
[
  term ((513261169754797023 : Rat) / 1385912907228352718) [(2, 1), (12, 1), (14, 1), (16, 1)],
  term ((513261169754797023 : Rat) / 1385912907228352718) [(3, 1), (12, 1), (15, 1), (16, 1)],
  term ((-513261169754797023 : Rat) / 2771825814456705436) [(12, 1), (14, 2), (16, 1)],
  term ((-513261169754797023 : Rat) / 2771825814456705436) [(12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 840 for generator 11. -/
theorem ep_Q2_008_partial_11_0840_valid :
    mulPoly ep_Q2_008_coefficient_11_0840
        ep_Q2_008_generator_11_0800_0849 =
      ep_Q2_008_partial_11_0840 := by
  native_decide

/-- Coefficient term 841 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0841 : Poly :=
[
  term ((-12826511395213439640177769223973196857600 : Rat) / 84353800925664757687870414129491527348999) [(12, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 841 for generator 11. -/
def ep_Q2_008_partial_11_0841 : Poly :=
[
  term ((-25653022790426879280355538447946393715200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-25653022790426879280355538447946393715200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((12826511395213439640177769223973196857600 : Rat) / 84353800925664757687870414129491527348999) [(12, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((12826511395213439640177769223973196857600 : Rat) / 84353800925664757687870414129491527348999) [(12, 2), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 841 for generator 11. -/
theorem ep_Q2_008_partial_11_0841_valid :
    mulPoly ep_Q2_008_coefficient_11_0841
        ep_Q2_008_generator_11_0800_0849 =
      ep_Q2_008_partial_11_0841 := by
  native_decide

/-- Coefficient term 842 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0842 : Poly :=
[
  term ((62566193848146107415 : Rat) / 11087303257826821744) [(12, 2), (16, 1)]
]

/-- Partial product 842 for generator 11. -/
def ep_Q2_008_partial_11_0842 : Poly :=
[
  term ((62566193848146107415 : Rat) / 5543651628913410872) [(2, 1), (12, 2), (14, 1), (16, 1)],
  term ((62566193848146107415 : Rat) / 5543651628913410872) [(3, 1), (12, 2), (15, 1), (16, 1)],
  term ((-62566193848146107415 : Rat) / 11087303257826821744) [(12, 2), (14, 2), (16, 1)],
  term ((-62566193848146107415 : Rat) / 11087303257826821744) [(12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 842 for generator 11. -/
theorem ep_Q2_008_partial_11_0842_valid :
    mulPoly ep_Q2_008_coefficient_11_0842
        ep_Q2_008_generator_11_0800_0849 =
      ep_Q2_008_partial_11_0842 := by
  native_decide

/-- Coefficient term 843 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0843 : Poly :=
[
  term ((-27977852920786207247447987477399441380711467 : Rat) / 1349660814810636123005926626071864437583984) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 843 for generator 11. -/
def ep_Q2_008_partial_11_0843 : Poly :=
[
  term ((-27977852920786207247447987477399441380711467 : Rat) / 674830407405318061502963313035932218791992) [(2, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-27977852920786207247447987477399441380711467 : Rat) / 674830407405318061502963313035932218791992) [(3, 1), (13, 1), (15, 2), (16, 1)],
  term ((27977852920786207247447987477399441380711467 : Rat) / 1349660814810636123005926626071864437583984) [(13, 1), (14, 2), (15, 1), (16, 1)],
  term ((27977852920786207247447987477399441380711467 : Rat) / 1349660814810636123005926626071864437583984) [(13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 843 for generator 11. -/
theorem ep_Q2_008_partial_11_0843_valid :
    mulPoly ep_Q2_008_coefficient_11_0843
        ep_Q2_008_generator_11_0800_0849 =
      ep_Q2_008_partial_11_0843 := by
  native_decide

/-- Coefficient term 844 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0844 : Poly :=
[
  term ((-5973314516755472989117191146972504731200 : Rat) / 84353800925664757687870414129491527348999) [(13, 1), (15, 3), (16, 1)]
]

/-- Partial product 844 for generator 11. -/
def ep_Q2_008_partial_11_0844 : Poly :=
[
  term ((-11946629033510945978234382293945009462400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-11946629033510945978234382293945009462400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (13, 1), (15, 4), (16, 1)],
  term ((5973314516755472989117191146972504731200 : Rat) / 84353800925664757687870414129491527348999) [(13, 1), (14, 2), (15, 3), (16, 1)],
  term ((5973314516755472989117191146972504731200 : Rat) / 84353800925664757687870414129491527348999) [(13, 1), (15, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 844 for generator 11. -/
theorem ep_Q2_008_partial_11_0844_valid :
    mulPoly ep_Q2_008_coefficient_11_0844
        ep_Q2_008_generator_11_0800_0849 =
      ep_Q2_008_partial_11_0844 := by
  native_decide

/-- Coefficient term 845 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0845 : Poly :=
[
  term ((158713686560710796500831464339732139316400 : Rat) / 84353800925664757687870414129491527348999) [(13, 2), (15, 2), (16, 1)]
]

/-- Partial product 845 for generator 11. -/
def ep_Q2_008_partial_11_0845 : Poly :=
[
  term ((317427373121421593001662928679464278632800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((317427373121421593001662928679464278632800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (13, 2), (15, 3), (16, 1)],
  term ((-158713686560710796500831464339732139316400 : Rat) / 84353800925664757687870414129491527348999) [(13, 2), (14, 2), (15, 2), (16, 1)],
  term ((-158713686560710796500831464339732139316400 : Rat) / 84353800925664757687870414129491527348999) [(13, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 845 for generator 11. -/
theorem ep_Q2_008_partial_11_0845_valid :
    mulPoly ep_Q2_008_coefficient_11_0845
        ep_Q2_008_generator_11_0800_0849 =
      ep_Q2_008_partial_11_0845 := by
  native_decide

/-- Coefficient term 846 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0846 : Poly :=
[
  term ((180956426661062067351 : Rat) / 22174606515653643488) [(13, 2), (16, 1)]
]

/-- Partial product 846 for generator 11. -/
def ep_Q2_008_partial_11_0846 : Poly :=
[
  term ((180956426661062067351 : Rat) / 11087303257826821744) [(2, 1), (13, 2), (14, 1), (16, 1)],
  term ((180956426661062067351 : Rat) / 11087303257826821744) [(3, 1), (13, 2), (15, 1), (16, 1)],
  term ((-180956426661062067351 : Rat) / 22174606515653643488) [(13, 2), (14, 2), (16, 1)],
  term ((-180956426661062067351 : Rat) / 22174606515653643488) [(13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 846 for generator 11. -/
theorem ep_Q2_008_partial_11_0846_valid :
    mulPoly ep_Q2_008_coefficient_11_0846
        ep_Q2_008_generator_11_0800_0849 =
      ep_Q2_008_partial_11_0846 := by
  native_decide

/-- Coefficient term 847 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0847 : Poly :=
[
  term ((-36609406062589441979569891220245393046400 : Rat) / 84353800925664757687870414129491527348999) [(13, 3), (15, 1), (16, 1)]
]

/-- Partial product 847 for generator 11. -/
def ep_Q2_008_partial_11_0847 : Poly :=
[
  term ((-73218812125178883959139782440490786092800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-73218812125178883959139782440490786092800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (13, 3), (15, 2), (16, 1)],
  term ((36609406062589441979569891220245393046400 : Rat) / 84353800925664757687870414129491527348999) [(13, 3), (14, 2), (15, 1), (16, 1)],
  term ((36609406062589441979569891220245393046400 : Rat) / 84353800925664757687870414129491527348999) [(13, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 847 for generator 11. -/
theorem ep_Q2_008_partial_11_0847_valid :
    mulPoly ep_Q2_008_coefficient_11_0847
        ep_Q2_008_generator_11_0800_0849 =
      ep_Q2_008_partial_11_0847 := by
  native_decide

/-- Coefficient term 848 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0848 : Poly :=
[
  term ((3968759632583823468528589335854209937858823 : Rat) / 1349660814810636123005926626071864437583984) [(15, 2), (16, 1)]
]

/-- Partial product 848 for generator 11. -/
def ep_Q2_008_partial_11_0848 : Poly :=
[
  term ((3968759632583823468528589335854209937858823 : Rat) / 674830407405318061502963313035932218791992) [(2, 1), (14, 1), (15, 2), (16, 1)],
  term ((3968759632583823468528589335854209937858823 : Rat) / 674830407405318061502963313035932218791992) [(3, 1), (15, 3), (16, 1)],
  term ((-3968759632583823468528589335854209937858823 : Rat) / 1349660814810636123005926626071864437583984) [(14, 2), (15, 2), (16, 1)],
  term ((-3968759632583823468528589335854209937858823 : Rat) / 1349660814810636123005926626071864437583984) [(15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 848 for generator 11. -/
theorem ep_Q2_008_partial_11_0848_valid :
    mulPoly ep_Q2_008_coefficient_11_0848
        ep_Q2_008_generator_11_0800_0849 =
      ep_Q2_008_partial_11_0848 := by
  native_decide

/-- Coefficient term 849 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0849 : Poly :=
[
  term ((170577678497598830591 : Rat) / 44349213031307286976) [(16, 1)]
]

/-- Partial product 849 for generator 11. -/
def ep_Q2_008_partial_11_0849 : Poly :=
[
  term ((170577678497598830591 : Rat) / 22174606515653643488) [(2, 1), (14, 1), (16, 1)],
  term ((170577678497598830591 : Rat) / 22174606515653643488) [(3, 1), (15, 1), (16, 1)],
  term ((-170577678497598830591 : Rat) / 44349213031307286976) [(14, 2), (16, 1)],
  term ((-170577678497598830591 : Rat) / 44349213031307286976) [(15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 849 for generator 11. -/
theorem ep_Q2_008_partial_11_0849_valid :
    mulPoly ep_Q2_008_coefficient_11_0849
        ep_Q2_008_generator_11_0800_0849 =
      ep_Q2_008_partial_11_0849 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_008_partials_11_0800_0849 : List Poly :=
[
  ep_Q2_008_partial_11_0800,
  ep_Q2_008_partial_11_0801,
  ep_Q2_008_partial_11_0802,
  ep_Q2_008_partial_11_0803,
  ep_Q2_008_partial_11_0804,
  ep_Q2_008_partial_11_0805,
  ep_Q2_008_partial_11_0806,
  ep_Q2_008_partial_11_0807,
  ep_Q2_008_partial_11_0808,
  ep_Q2_008_partial_11_0809,
  ep_Q2_008_partial_11_0810,
  ep_Q2_008_partial_11_0811,
  ep_Q2_008_partial_11_0812,
  ep_Q2_008_partial_11_0813,
  ep_Q2_008_partial_11_0814,
  ep_Q2_008_partial_11_0815,
  ep_Q2_008_partial_11_0816,
  ep_Q2_008_partial_11_0817,
  ep_Q2_008_partial_11_0818,
  ep_Q2_008_partial_11_0819,
  ep_Q2_008_partial_11_0820,
  ep_Q2_008_partial_11_0821,
  ep_Q2_008_partial_11_0822,
  ep_Q2_008_partial_11_0823,
  ep_Q2_008_partial_11_0824,
  ep_Q2_008_partial_11_0825,
  ep_Q2_008_partial_11_0826,
  ep_Q2_008_partial_11_0827,
  ep_Q2_008_partial_11_0828,
  ep_Q2_008_partial_11_0829,
  ep_Q2_008_partial_11_0830,
  ep_Q2_008_partial_11_0831,
  ep_Q2_008_partial_11_0832,
  ep_Q2_008_partial_11_0833,
  ep_Q2_008_partial_11_0834,
  ep_Q2_008_partial_11_0835,
  ep_Q2_008_partial_11_0836,
  ep_Q2_008_partial_11_0837,
  ep_Q2_008_partial_11_0838,
  ep_Q2_008_partial_11_0839,
  ep_Q2_008_partial_11_0840,
  ep_Q2_008_partial_11_0841,
  ep_Q2_008_partial_11_0842,
  ep_Q2_008_partial_11_0843,
  ep_Q2_008_partial_11_0844,
  ep_Q2_008_partial_11_0845,
  ep_Q2_008_partial_11_0846,
  ep_Q2_008_partial_11_0847,
  ep_Q2_008_partial_11_0848,
  ep_Q2_008_partial_11_0849
]

/-- Sum of partial products in this block. -/
def ep_Q2_008_block_11_0800_0849 : Poly :=
[
  term ((5050832160450947517 : Rat) / 2771825814456705436) [(2, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-6945979900585068000 : Rat) / 692956453614176359) [(2, 1), (10, 1), (12, 2), (14, 1), (16, 1)],
  term ((17449999590777010633278925880584192069461621 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-136404629566092681158195950877573513868000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (10, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((13792899295430665821 : Rat) / 692956453614176359) [(2, 1), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((-25208791984956532012314077316248754739200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (10, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-986459975381858920495057155369573552985200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((42711622889070958983 : Rat) / 2771825814456705436) [(2, 1), (10, 1), (14, 1), (16, 1)],
  term ((-13891959801170136000 : Rat) / 692956453614176359) [(2, 1), (10, 2), (13, 2), (14, 1), (16, 1)],
  term ((11020747726338080733 : Rat) / 5543651628913410872) [(2, 1), (10, 2), (14, 1), (16, 1)],
  term ((160563908621899219146991067599104572604000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-63662080170520297017 : Rat) / 1385912907228352718) [(2, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((13057839021052226651075467701118337345148000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (11, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((8874735334114930551809869215994065792000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (11, 1), (12, 1), (13, 3), (14, 1), (15, 2), (16, 1)],
  term ((247978834509805942244745414535387051545933 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-19058214854956896000 : Rat) / 692956453614176359) [(2, 1), (11, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (11, 1), (12, 2), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-2433458103623531960966527699108306234800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-59189077669402215695504551273940013192000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((21161101007637534375 : Rat) / 692956453614176359) [(2, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((19438331707357757211861017397333468603840600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (11, 1), (13, 2), (14, 1), (15, 3), (16, 1)],
  term ((13410711171551450611623802370835477196800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (11, 1), (13, 3), (14, 1), (15, 2), (16, 1)],
  term ((-46454398708957434000 : Rat) / 692956453614176359) [(2, 1), (11, 1), (13, 3), (14, 1), (16, 1)],
  term ((-3845718644783136572450943326930761843200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (11, 1), (13, 4), (14, 1), (15, 1), (16, 1)],
  term ((-1286075344007549740482835006665522204592875 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1840816897985154886897607710097190912000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (11, 1), (14, 1), (15, 3), (16, 1)],
  term ((269214682216808707920495307710152679245400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (11, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (11, 2), (12, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((28587322282435344000 : Rat) / 692956453614176359) [(2, 1), (11, 2), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((2366596089097314813815965124265084211200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (11, 2), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((5952518285441448375 : Rat) / 692956453614176359) [(2, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((-197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (11, 2), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1031401907174659500 : Rat) / 692956453614176359) [(2, 1), (11, 2), (12, 2), (14, 1), (16, 1)],
  term ((-4041476436744412972803106042389691046400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((375613366775954733 : Rat) / 5543651628913410872) [(2, 1), (11, 2), (14, 1), (16, 1)],
  term ((-28583835452810868024854318413272479432414679 : Rat) / 674830407405318061502963313035932218791992) [(2, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5447633300209850424307420936086542419200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (12, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((156088613732203079208085647751520649177600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (12, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-4986580138520299548904727954121064409940921 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((513261169754797023 : Rat) / 1385912907228352718) [(2, 1), (12, 1), (14, 1), (16, 1)],
  term ((-25653022790426879280355538447946393715200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((62566193848146107415 : Rat) / 5543651628913410872) [(2, 1), (12, 2), (14, 1), (16, 1)],
  term ((-27977852920786207247447987477399441380711467 : Rat) / 674830407405318061502963313035932218791992) [(2, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-11946629033510945978234382293945009462400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((317427373121421593001662928679464278632800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((180956426661062067351 : Rat) / 11087303257826821744) [(2, 1), (13, 2), (14, 1), (16, 1)],
  term ((-73218812125178883959139782440490786092800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((3968759632583823468528589335854209937858823 : Rat) / 674830407405318061502963313035932218791992) [(2, 1), (14, 1), (15, 2), (16, 1)],
  term ((170577678497598830591 : Rat) / 22174606515653643488) [(2, 1), (14, 1), (16, 1)],
  term ((5050832160450947517 : Rat) / 2771825814456705436) [(3, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-6945979900585068000 : Rat) / 692956453614176359) [(3, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((17449999590777010633278925880584192069461621 : Rat) / 168707601851329515375740828258983054697998) [(3, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((13792899295430665821 : Rat) / 692956453614176359) [(3, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-136404629566092681158195950877573513868000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (10, 1), (13, 2), (15, 3), (16, 1)],
  term ((-25208791984956532012314077316248754739200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (10, 1), (13, 3), (15, 2), (16, 1)],
  term ((42711622889070958983 : Rat) / 2771825814456705436) [(3, 1), (10, 1), (15, 1), (16, 1)],
  term ((-986459975381858920495057155369573552985200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (10, 1), (15, 3), (16, 1)],
  term ((-13891959801170136000 : Rat) / 692956453614176359) [(3, 1), (10, 2), (13, 2), (15, 1), (16, 1)],
  term ((11020747726338080733 : Rat) / 5543651628913410872) [(3, 1), (10, 2), (15, 1), (16, 1)],
  term ((-63662080170520297017 : Rat) / 1385912907228352718) [(3, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((160563908621899219146991067599104572604000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (11, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((13057839021052226651075467701118337345148000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (11, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((8874735334114930551809869215994065792000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 1), (12, 1), (13, 3), (15, 3), (16, 1)],
  term ((247978834509805942244745414535387051545933 : Rat) / 337415203702659030751481656517966109395996) [(3, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-19058214854956896000 : Rat) / 692956453614176359) [(3, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 1), (12, 2), (13, 2), (15, 2), (16, 1)],
  term ((-2433458103623531960966527699108306234800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((21161101007637534375 : Rat) / 692956453614176359) [(3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-59189077669402215695504551273940013192000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((19438331707357757211861017397333468603840600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 1), (13, 2), (15, 4), (16, 1)],
  term ((-46454398708957434000 : Rat) / 692956453614176359) [(3, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((13410711171551450611623802370835477196800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 1), (13, 3), (15, 3), (16, 1)],
  term ((-3845718644783136572450943326930761843200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 1), (13, 4), (15, 2), (16, 1)],
  term ((-1286075344007549740482835006665522204592875 : Rat) / 337415203702659030751481656517966109395996) [(3, 1), (11, 1), (15, 2), (16, 1)],
  term ((-1840816897985154886897607710097190912000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (11, 1), (15, 4), (16, 1)],
  term ((269214682216808707920495307710152679245400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (11, 2), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((28587322282435344000 : Rat) / 692956453614176359) [(3, 1), (11, 2), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 2), (12, 1), (13, 2), (15, 3), (16, 1)],
  term ((2366596089097314813815965124265084211200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 2), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((5952518285441448375 : Rat) / 692956453614176359) [(3, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 2), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-1031401907174659500 : Rat) / 692956453614176359) [(3, 1), (11, 2), (12, 2), (15, 1), (16, 1)],
  term ((-4041476436744412972803106042389691046400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((375613366775954733 : Rat) / 5543651628913410872) [(3, 1), (11, 2), (15, 1), (16, 1)],
  term ((-28583835452810868024854318413272479432414679 : Rat) / 674830407405318061502963313035932218791992) [(3, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-5447633300209850424307420936086542419200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (12, 1), (13, 1), (15, 4), (16, 1)],
  term ((156088613732203079208085647751520649177600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (12, 1), (13, 2), (15, 3), (16, 1)],
  term ((513261169754797023 : Rat) / 1385912907228352718) [(3, 1), (12, 1), (15, 1), (16, 1)],
  term ((-4986580138520299548904727954121064409940921 : Rat) / 337415203702659030751481656517966109395996) [(3, 1), (12, 1), (15, 3), (16, 1)],
  term ((-25653022790426879280355538447946393715200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((62566193848146107415 : Rat) / 5543651628913410872) [(3, 1), (12, 2), (15, 1), (16, 1)],
  term ((-27977852920786207247447987477399441380711467 : Rat) / 674830407405318061502963313035932218791992) [(3, 1), (13, 1), (15, 2), (16, 1)],
  term ((-11946629033510945978234382293945009462400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (13, 1), (15, 4), (16, 1)],
  term ((180956426661062067351 : Rat) / 11087303257826821744) [(3, 1), (13, 2), (15, 1), (16, 1)],
  term ((317427373121421593001662928679464278632800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (13, 2), (15, 3), (16, 1)],
  term ((-73218812125178883959139782440490786092800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (13, 3), (15, 2), (16, 1)],
  term ((170577678497598830591 : Rat) / 22174606515653643488) [(3, 1), (15, 1), (16, 1)],
  term ((3968759632583823468528589335854209937858823 : Rat) / 674830407405318061502963313035932218791992) [(3, 1), (15, 3), (16, 1)],
  term ((-5050832160450947517 : Rat) / 5543651628913410872) [(10, 1), (12, 1), (14, 2), (16, 1)],
  term ((-5050832160450947517 : Rat) / 5543651628913410872) [(10, 1), (12, 1), (15, 2), (16, 1)],
  term ((3472989950292534000 : Rat) / 692956453614176359) [(10, 1), (12, 2), (14, 2), (16, 1)],
  term ((3472989950292534000 : Rat) / 692956453614176359) [(10, 1), (12, 2), (15, 2), (16, 1)],
  term ((-17449999590777010633278925880584192069461621 : Rat) / 337415203702659030751481656517966109395996) [(10, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-17449999590777010633278925880584192069461621 : Rat) / 337415203702659030751481656517966109395996) [(10, 1), (13, 1), (15, 3), (16, 1)],
  term ((68202314783046340579097975438786756934000 : Rat) / 84353800925664757687870414129491527348999) [(10, 1), (13, 2), (14, 2), (15, 2), (16, 1)],
  term ((-13792899295430665821 : Rat) / 1385912907228352718) [(10, 1), (13, 2), (14, 2), (16, 1)],
  term ((-13792899295430665821 : Rat) / 1385912907228352718) [(10, 1), (13, 2), (15, 2), (16, 1)],
  term ((68202314783046340579097975438786756934000 : Rat) / 84353800925664757687870414129491527348999) [(10, 1), (13, 2), (15, 4), (16, 1)],
  term ((12604395992478266006157038658124377369600 : Rat) / 84353800925664757687870414129491527348999) [(10, 1), (13, 3), (14, 2), (15, 1), (16, 1)],
  term ((12604395992478266006157038658124377369600 : Rat) / 84353800925664757687870414129491527348999) [(10, 1), (13, 3), (15, 3), (16, 1)],
  term ((493229987690929460247528577684786776492600 : Rat) / 84353800925664757687870414129491527348999) [(10, 1), (14, 2), (15, 2), (16, 1)],
  term ((-42711622889070958983 : Rat) / 5543651628913410872) [(10, 1), (14, 2), (16, 1)],
  term ((-42711622889070958983 : Rat) / 5543651628913410872) [(10, 1), (15, 2), (16, 1)],
  term ((493229987690929460247528577684786776492600 : Rat) / 84353800925664757687870414129491527348999) [(10, 1), (15, 4), (16, 1)],
  term ((6945979900585068000 : Rat) / 692956453614176359) [(10, 2), (13, 2), (14, 2), (16, 1)],
  term ((6945979900585068000 : Rat) / 692956453614176359) [(10, 2), (13, 2), (15, 2), (16, 1)],
  term ((-11020747726338080733 : Rat) / 11087303257826821744) [(10, 2), (14, 2), (16, 1)],
  term ((-11020747726338080733 : Rat) / 11087303257826821744) [(10, 2), (15, 2), (16, 1)],
  term ((-80281954310949609573495533799552286302000 : Rat) / 84353800925664757687870414129491527348999) [(11, 1), (12, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((63662080170520297017 : Rat) / 2771825814456705436) [(11, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((63662080170520297017 : Rat) / 2771825814456705436) [(11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-80281954310949609573495533799552286302000 : Rat) / 84353800925664757687870414129491527348999) [(11, 1), (12, 1), (13, 1), (15, 4), (16, 1)],
  term ((-6528919510526113325537733850559168672574000 : Rat) / 84353800925664757687870414129491527348999) [(11, 1), (12, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((-6528919510526113325537733850559168672574000 : Rat) / 84353800925664757687870414129491527348999) [(11, 1), (12, 1), (13, 2), (15, 3), (16, 1)],
  term ((-4437367667057465275904934607997032896000 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (12, 1), (13, 3), (14, 2), (15, 2), (16, 1)],
  term ((-4437367667057465275904934607997032896000 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (12, 1), (13, 3), (15, 4), (16, 1)],
  term ((-247978834509805942244745414535387051545933 : Rat) / 674830407405318061502963313035932218791992) [(11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-247978834509805942244745414535387051545933 : Rat) / 674830407405318061502963313035932218791992) [(11, 1), (12, 1), (15, 3), (16, 1)],
  term ((9529107427478448000 : Rat) / 692956453614176359) [(11, 1), (12, 2), (13, 1), (14, 2), (16, 1)],
  term ((9529107427478448000 : Rat) / 692956453614176359) [(11, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (12, 2), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (12, 2), (13, 2), (15, 3), (16, 1)],
  term ((1216729051811765980483263849554153117400 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((1216729051811765980483263849554153117400 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (12, 2), (15, 3), (16, 1)],
  term ((29594538834701107847752275636970006596000 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-21161101007637534375 : Rat) / 1385912907228352718) [(11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-21161101007637534375 : Rat) / 1385912907228352718) [(11, 1), (13, 1), (15, 2), (16, 1)],
  term ((29594538834701107847752275636970006596000 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (13, 1), (15, 4), (16, 1)],
  term ((-9719165853678878605930508698666734301920300 : Rat) / 84353800925664757687870414129491527348999) [(11, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((591649022274328703453991281066271052800 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (13, 2), (14, 2), (15, 3), (16, 1)],
  term ((-9719165853678878605930508698666734301920300 : Rat) / 84353800925664757687870414129491527348999) [(11, 1), (13, 2), (15, 3), (16, 1)],
  term ((591649022274328703453991281066271052800 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (13, 2), (15, 5), (16, 1)],
  term ((-6705355585775725305811901185417738598400 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (13, 3), (14, 2), (15, 2), (16, 1)],
  term ((23227199354478717000 : Rat) / 692956453614176359) [(11, 1), (13, 3), (14, 2), (16, 1)],
  term ((23227199354478717000 : Rat) / 692956453614176359) [(11, 1), (13, 3), (15, 2), (16, 1)],
  term ((-6705355585775725305811901185417738598400 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (13, 3), (15, 4), (16, 1)],
  term ((1922859322391568286225471663465380921600 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (13, 4), (14, 2), (15, 1), (16, 1)],
  term ((1922859322391568286225471663465380921600 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (13, 4), (15, 3), (16, 1)],
  term ((1286075344007549740482835006665522204592875 : Rat) / 674830407405318061502963313035932218791992) [(11, 1), (14, 2), (15, 1), (16, 1)],
  term ((920408448992577443448803855048595456000 : Rat) / 84353800925664757687870414129491527348999) [(11, 1), (14, 2), (15, 3), (16, 1)],
  term ((1286075344007549740482835006665522204592875 : Rat) / 674830407405318061502963313035932218791992) [(11, 1), (15, 3), (16, 1)],
  term ((920408448992577443448803855048595456000 : Rat) / 84353800925664757687870414129491527348999) [(11, 1), (15, 5), (16, 1)],
  term ((-134607341108404353960247653855076339622700 : Rat) / 84353800925664757687870414129491527348999) [(11, 2), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-134607341108404353960247653855076339622700 : Rat) / 84353800925664757687870414129491527348999) [(11, 2), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(11, 2), (12, 1), (13, 2), (14, 2), (15, 2), (16, 1)],
  term ((-14293661141217672000 : Rat) / 692956453614176359) [(11, 2), (12, 1), (13, 2), (14, 2), (16, 1)],
  term ((-14293661141217672000 : Rat) / 692956453614176359) [(11, 2), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(11, 2), (12, 1), (13, 2), (15, 4), (16, 1)],
  term ((-1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(11, 2), (12, 1), (13, 3), (14, 2), (15, 1), (16, 1)],
  term ((-1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(11, 2), (12, 1), (13, 3), (15, 3), (16, 1)],
  term ((-5952518285441448375 : Rat) / 1385912907228352718) [(11, 2), (12, 1), (14, 2), (16, 1)],
  term ((-5952518285441448375 : Rat) / 1385912907228352718) [(11, 2), (12, 1), (15, 2), (16, 1)],
  term ((98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(11, 2), (12, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(11, 2), (12, 2), (13, 1), (15, 3), (16, 1)],
  term ((515700953587329750 : Rat) / 692956453614176359) [(11, 2), (12, 2), (14, 2), (16, 1)],
  term ((515700953587329750 : Rat) / 692956453614176359) [(11, 2), (12, 2), (15, 2), (16, 1)],
  term ((2020738218372206486401553021194845523200 : Rat) / 84353800925664757687870414129491527348999) [(11, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((2020738218372206486401553021194845523200 : Rat) / 84353800925664757687870414129491527348999) [(11, 2), (13, 1), (15, 3), (16, 1)],
  term ((-375613366775954733 : Rat) / 11087303257826821744) [(11, 2), (14, 2), (16, 1)],
  term ((-375613366775954733 : Rat) / 11087303257826821744) [(11, 2), (15, 2), (16, 1)],
  term ((28583835452810868024854318413272479432414679 : Rat) / 1349660814810636123005926626071864437583984) [(12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((2723816650104925212153710468043271209600 : Rat) / 84353800925664757687870414129491527348999) [(12, 1), (13, 1), (14, 2), (15, 3), (16, 1)],
  term ((28583835452810868024854318413272479432414679 : Rat) / 1349660814810636123005926626071864437583984) [(12, 1), (13, 1), (15, 3), (16, 1)],
  term ((2723816650104925212153710468043271209600 : Rat) / 84353800925664757687870414129491527348999) [(12, 1), (13, 1), (15, 5), (16, 1)],
  term ((-78044306866101539604042823875760324588800 : Rat) / 84353800925664757687870414129491527348999) [(12, 1), (13, 2), (14, 2), (15, 2), (16, 1)],
  term ((-78044306866101539604042823875760324588800 : Rat) / 84353800925664757687870414129491527348999) [(12, 1), (13, 2), (15, 4), (16, 1)],
  term ((4986580138520299548904727954121064409940921 : Rat) / 674830407405318061502963313035932218791992) [(12, 1), (14, 2), (15, 2), (16, 1)],
  term ((-513261169754797023 : Rat) / 2771825814456705436) [(12, 1), (14, 2), (16, 1)],
  term ((-513261169754797023 : Rat) / 2771825814456705436) [(12, 1), (15, 2), (16, 1)],
  term ((4986580138520299548904727954121064409940921 : Rat) / 674830407405318061502963313035932218791992) [(12, 1), (15, 4), (16, 1)],
  term ((12826511395213439640177769223973196857600 : Rat) / 84353800925664757687870414129491527348999) [(12, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((12826511395213439640177769223973196857600 : Rat) / 84353800925664757687870414129491527348999) [(12, 2), (13, 1), (15, 3), (16, 1)],
  term ((-62566193848146107415 : Rat) / 11087303257826821744) [(12, 2), (14, 2), (16, 1)],
  term ((-62566193848146107415 : Rat) / 11087303257826821744) [(12, 2), (15, 2), (16, 1)],
  term ((27977852920786207247447987477399441380711467 : Rat) / 1349660814810636123005926626071864437583984) [(13, 1), (14, 2), (15, 1), (16, 1)],
  term ((5973314516755472989117191146972504731200 : Rat) / 84353800925664757687870414129491527348999) [(13, 1), (14, 2), (15, 3), (16, 1)],
  term ((27977852920786207247447987477399441380711467 : Rat) / 1349660814810636123005926626071864437583984) [(13, 1), (15, 3), (16, 1)],
  term ((5973314516755472989117191146972504731200 : Rat) / 84353800925664757687870414129491527348999) [(13, 1), (15, 5), (16, 1)],
  term ((-158713686560710796500831464339732139316400 : Rat) / 84353800925664757687870414129491527348999) [(13, 2), (14, 2), (15, 2), (16, 1)],
  term ((-180956426661062067351 : Rat) / 22174606515653643488) [(13, 2), (14, 2), (16, 1)],
  term ((-180956426661062067351 : Rat) / 22174606515653643488) [(13, 2), (15, 2), (16, 1)],
  term ((-158713686560710796500831464339732139316400 : Rat) / 84353800925664757687870414129491527348999) [(13, 2), (15, 4), (16, 1)],
  term ((36609406062589441979569891220245393046400 : Rat) / 84353800925664757687870414129491527348999) [(13, 3), (14, 2), (15, 1), (16, 1)],
  term ((36609406062589441979569891220245393046400 : Rat) / 84353800925664757687870414129491527348999) [(13, 3), (15, 3), (16, 1)],
  term ((-3968759632583823468528589335854209937858823 : Rat) / 1349660814810636123005926626071864437583984) [(14, 2), (15, 2), (16, 1)],
  term ((-170577678497598830591 : Rat) / 44349213031307286976) [(14, 2), (16, 1)],
  term ((-170577678497598830591 : Rat) / 44349213031307286976) [(15, 2), (16, 1)],
  term ((-3968759632583823468528589335854209937858823 : Rat) / 1349660814810636123005926626071864437583984) [(15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 11, terms 800 through 849. -/
theorem ep_Q2_008_block_11_0800_0849_valid :
    checkProductSumEq ep_Q2_008_partials_11_0800_0849
      ep_Q2_008_block_11_0800_0849 = true := by
  native_decide

end EpQ2008TermShards

end Patterns

end EndpointCertificate

end Problem97
