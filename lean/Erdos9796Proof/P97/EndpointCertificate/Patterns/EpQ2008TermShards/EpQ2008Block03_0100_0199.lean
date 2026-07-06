/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_008, term block 3:100-199

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_008`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2008TermShards

/-- Generator polynomial 3 for endpoint certificate `ep_Q2_008`. -/
def ep_Q2_008_generator_03_0100_0199 : Poly :=
[
  term (1 : Rat) [(2, 2)],
  term (1 : Rat) [(3, 2)],
  term (-1 : Rat) [(8, 2)],
  term (-1 : Rat) [(9, 2)]
]

/-- Coefficient term 100 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0100 : Poly :=
[
  term ((-1339889716095078704545649417786671104000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (5, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 100 for generator 3. -/
def ep_Q2_008_partial_03_0100 : Poly :=
[
  term ((-1339889716095078704545649417786671104000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 2), (5, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1339889716095078704545649417786671104000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 2), (5, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1339889716095078704545649417786671104000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (5, 1), (8, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1339889716095078704545649417786671104000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (5, 1), (9, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 3. -/
theorem ep_Q2_008_partial_03_0100_valid :
    mulPoly ep_Q2_008_coefficient_03_0100
        ep_Q2_008_generator_03_0100_0199 =
      ep_Q2_008_partial_03_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0101 : Poly :=
[
  term ((-64583833551027167844 : Rat) / 692956453614176359) [(1, 1), (5, 1), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 101 for generator 3. -/
def ep_Q2_008_partial_03_0101 : Poly :=
[
  term ((-64583833551027167844 : Rat) / 692956453614176359) [(1, 1), (2, 2), (5, 1), (12, 1), (13, 2), (16, 1)],
  term ((-64583833551027167844 : Rat) / 692956453614176359) [(1, 1), (3, 2), (5, 1), (12, 1), (13, 2), (16, 1)],
  term ((64583833551027167844 : Rat) / 692956453614176359) [(1, 1), (5, 1), (8, 2), (12, 1), (13, 2), (16, 1)],
  term ((64583833551027167844 : Rat) / 692956453614176359) [(1, 1), (5, 1), (9, 2), (12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 3. -/
theorem ep_Q2_008_partial_03_0101_valid :
    mulPoly ep_Q2_008_coefficient_03_0101
        ep_Q2_008_generator_03_0100_0199 =
      ep_Q2_008_partial_03_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0102 : Poly :=
[
  term ((7400323832412329337 : Rat) / 1385912907228352718) [(1, 1), (5, 1), (12, 1), (16, 1)]
]

/-- Partial product 102 for generator 3. -/
def ep_Q2_008_partial_03_0102 : Poly :=
[
  term ((7400323832412329337 : Rat) / 1385912907228352718) [(1, 1), (2, 2), (5, 1), (12, 1), (16, 1)],
  term ((7400323832412329337 : Rat) / 1385912907228352718) [(1, 1), (3, 2), (5, 1), (12, 1), (16, 1)],
  term ((-7400323832412329337 : Rat) / 1385912907228352718) [(1, 1), (5, 1), (8, 2), (12, 1), (16, 1)],
  term ((-7400323832412329337 : Rat) / 1385912907228352718) [(1, 1), (5, 1), (9, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 3. -/
theorem ep_Q2_008_partial_03_0102_valid :
    mulPoly ep_Q2_008_coefficient_03_0102
        ep_Q2_008_generator_03_0100_0199 =
      ep_Q2_008_partial_03_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0103 : Poly :=
[
  term ((669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (5, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 103 for generator 3. -/
def ep_Q2_008_partial_03_0103 : Poly :=
[
  term ((669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 2), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 2), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (5, 1), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((-669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (5, 1), (9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 3. -/
theorem ep_Q2_008_partial_03_0103_valid :
    mulPoly ep_Q2_008_coefficient_03_0103
        ep_Q2_008_generator_03_0100_0199 =
      ep_Q2_008_partial_03_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0104 : Poly :=
[
  term ((15428882026120282983 : Rat) / 5543651628913410872) [(1, 1), (5, 1), (16, 1)]
]

/-- Partial product 104 for generator 3. -/
def ep_Q2_008_partial_03_0104 : Poly :=
[
  term ((15428882026120282983 : Rat) / 5543651628913410872) [(1, 1), (2, 2), (5, 1), (16, 1)],
  term ((15428882026120282983 : Rat) / 5543651628913410872) [(1, 1), (3, 2), (5, 1), (16, 1)],
  term ((-15428882026120282983 : Rat) / 5543651628913410872) [(1, 1), (5, 1), (8, 2), (16, 1)],
  term ((-15428882026120282983 : Rat) / 5543651628913410872) [(1, 1), (5, 1), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 3. -/
theorem ep_Q2_008_partial_03_0104_valid :
    mulPoly ep_Q2_008_coefficient_03_0104
        ep_Q2_008_generator_03_0100_0199 =
      ep_Q2_008_partial_03_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0105 : Poly :=
[
  term ((78273037166560530452376704018035200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 105 for generator 3. -/
def ep_Q2_008_partial_03_0105 : Poly :=
[
  term ((78273037166560530452376704018035200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (2, 2), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((78273037166560530452376704018035200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (3, 2), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-78273037166560530452376704018035200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (7, 1), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((-78273037166560530452376704018035200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (7, 1), (9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 3. -/
theorem ep_Q2_008_partial_03_0105_valid :
    mulPoly ep_Q2_008_coefficient_03_0105
        ep_Q2_008_generator_03_0100_0199 =
      ep_Q2_008_partial_03_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0106 : Poly :=
[
  term ((-1094816955793144869 : Rat) / 692956453614176359) [(1, 1), (6, 1), (7, 1), (13, 2), (16, 1)]
]

/-- Partial product 106 for generator 3. -/
def ep_Q2_008_partial_03_0106 : Poly :=
[
  term ((-1094816955793144869 : Rat) / 692956453614176359) [(1, 1), (2, 2), (6, 1), (7, 1), (13, 2), (16, 1)],
  term ((-1094816955793144869 : Rat) / 692956453614176359) [(1, 1), (3, 2), (6, 1), (7, 1), (13, 2), (16, 1)],
  term ((1094816955793144869 : Rat) / 692956453614176359) [(1, 1), (6, 1), (7, 1), (8, 2), (13, 2), (16, 1)],
  term ((1094816955793144869 : Rat) / 692956453614176359) [(1, 1), (6, 1), (7, 1), (9, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 3. -/
theorem ep_Q2_008_partial_03_0106_valid :
    mulPoly ep_Q2_008_coefficient_03_0106
        ep_Q2_008_generator_03_0100_0199 =
      ep_Q2_008_partial_03_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0107 : Poly :=
[
  term ((-22120412655187583551838078959565376000 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (7, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 107 for generator 3. -/
def ep_Q2_008_partial_03_0107 : Poly :=
[
  term ((-22120412655187583551838078959565376000 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (2, 2), (6, 1), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((-22120412655187583551838078959565376000 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (3, 2), (6, 1), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((22120412655187583551838078959565376000 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (7, 1), (8, 2), (13, 3), (15, 1), (16, 1)],
  term ((22120412655187583551838078959565376000 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (7, 1), (9, 2), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 3. -/
theorem ep_Q2_008_partial_03_0107_valid :
    mulPoly ep_Q2_008_coefficient_03_0107
        ep_Q2_008_generator_03_0100_0199 =
      ep_Q2_008_partial_03_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0108 : Poly :=
[
  term ((-4624670165699233431 : Rat) / 692956453614176359) [(1, 1), (6, 1), (7, 1), (16, 1)]
]

/-- Partial product 108 for generator 3. -/
def ep_Q2_008_partial_03_0108 : Poly :=
[
  term ((-4624670165699233431 : Rat) / 692956453614176359) [(1, 1), (2, 2), (6, 1), (7, 1), (16, 1)],
  term ((-4624670165699233431 : Rat) / 692956453614176359) [(1, 1), (3, 2), (6, 1), (7, 1), (16, 1)],
  term ((4624670165699233431 : Rat) / 692956453614176359) [(1, 1), (6, 1), (7, 1), (8, 2), (16, 1)],
  term ((4624670165699233431 : Rat) / 692956453614176359) [(1, 1), (6, 1), (7, 1), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 3. -/
theorem ep_Q2_008_partial_03_0108_valid :
    mulPoly ep_Q2_008_coefficient_03_0108
        ep_Q2_008_generator_03_0100_0199 =
      ep_Q2_008_partial_03_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0109 : Poly :=
[
  term ((-609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (7, 2), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 109 for generator 3. -/
def ep_Q2_008_partial_03_0109 : Poly :=
[
  term ((-609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (2, 2), (6, 1), (7, 2), (13, 2), (15, 1), (16, 1)],
  term ((-609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (3, 2), (6, 1), (7, 2), (13, 2), (15, 1), (16, 1)],
  term ((609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (7, 2), (8, 2), (13, 2), (15, 1), (16, 1)],
  term ((609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (7, 2), (9, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 3. -/
theorem ep_Q2_008_partial_03_0109_valid :
    mulPoly ep_Q2_008_coefficient_03_0109
        ep_Q2_008_generator_03_0100_0199 =
      ep_Q2_008_partial_03_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0110 : Poly :=
[
  term ((-43336929246501263764396389789139200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (7, 2), (15, 1), (16, 1)]
]

/-- Partial product 110 for generator 3. -/
def ep_Q2_008_partial_03_0110 : Poly :=
[
  term ((-43336929246501263764396389789139200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (2, 2), (6, 1), (7, 2), (15, 1), (16, 1)],
  term ((-43336929246501263764396389789139200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (3, 2), (6, 1), (7, 2), (15, 1), (16, 1)],
  term ((43336929246501263764396389789139200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (7, 2), (8, 2), (15, 1), (16, 1)],
  term ((43336929246501263764396389789139200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (7, 2), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 3. -/
theorem ep_Q2_008_partial_03_0110_valid :
    mulPoly ep_Q2_008_coefficient_03_0110
        ep_Q2_008_generator_03_0100_0199 =
      ep_Q2_008_partial_03_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0111 : Poly :=
[
  term ((298759193453632413851394802614595584000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 111 for generator 3. -/
def ep_Q2_008_partial_03_0111 : Poly :=
[
  term ((298759193453632413851394802614595584000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 2), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((298759193453632413851394802614595584000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 2), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((-298759193453632413851394802614595584000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((-298759193453632413851394802614595584000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (8, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 3. -/
theorem ep_Q2_008_partial_03_0111_valid :
    mulPoly ep_Q2_008_coefficient_03_0111
        ep_Q2_008_generator_03_0100_0199 =
      ep_Q2_008_partial_03_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0112 : Poly :=
[
  term ((-6945979900585068000 : Rat) / 692956453614176359) [(1, 1), (6, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 112 for generator 3. -/
def ep_Q2_008_partial_03_0112 : Poly :=
[
  term ((-6945979900585068000 : Rat) / 692956453614176359) [(1, 1), (2, 2), (6, 1), (10, 1), (13, 1), (16, 1)],
  term ((-6945979900585068000 : Rat) / 692956453614176359) [(1, 1), (3, 2), (6, 1), (10, 1), (13, 1), (16, 1)],
  term ((6945979900585068000 : Rat) / 692956453614176359) [(1, 1), (6, 1), (8, 2), (10, 1), (13, 1), (16, 1)],
  term ((6945979900585068000 : Rat) / 692956453614176359) [(1, 1), (6, 1), (9, 2), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 3. -/
theorem ep_Q2_008_partial_03_0112_valid :
    mulPoly ep_Q2_008_coefficient_03_0112
        ep_Q2_008_generator_03_0100_0199 =
      ep_Q2_008_partial_03_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0113 : Poly :=
[
  term ((-3335197780739038211317658262354644332800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 113 for generator 3. -/
def ep_Q2_008_partial_03_0113 : Poly :=
[
  term ((-3335197780739038211317658262354644332800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 2), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3335197780739038211317658262354644332800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 2), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((3335197780739038211317658262354644332800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (8, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((3335197780739038211317658262354644332800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 3. -/
theorem ep_Q2_008_partial_03_0113_valid :
    mulPoly ep_Q2_008_coefficient_03_0113
        ep_Q2_008_generator_03_0100_0199 =
      ep_Q2_008_partial_03_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0114 : Poly :=
[
  term ((-14293661141217672000 : Rat) / 692956453614176359) [(1, 1), (6, 1), (11, 1), (13, 2), (16, 1)]
]

/-- Partial product 114 for generator 3. -/
def ep_Q2_008_partial_03_0114 : Poly :=
[
  term ((-14293661141217672000 : Rat) / 692956453614176359) [(1, 1), (2, 2), (6, 1), (11, 1), (13, 2), (16, 1)],
  term ((-14293661141217672000 : Rat) / 692956453614176359) [(1, 1), (3, 2), (6, 1), (11, 1), (13, 2), (16, 1)],
  term ((14293661141217672000 : Rat) / 692956453614176359) [(1, 1), (6, 1), (8, 2), (11, 1), (13, 2), (16, 1)],
  term ((14293661141217672000 : Rat) / 692956453614176359) [(1, 1), (6, 1), (9, 2), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 3. -/
theorem ep_Q2_008_partial_03_0114_valid :
    mulPoly ep_Q2_008_coefficient_03_0114
        ep_Q2_008_generator_03_0100_0199 =
      ep_Q2_008_partial_03_0114 := by
  native_decide

/-- Coefficient term 115 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0115 : Poly :=
[
  term ((-1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 115 for generator 3. -/
def ep_Q2_008_partial_03_0115 : Poly :=
[
  term ((-1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (2, 2), (6, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((-1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (3, 2), (6, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (8, 2), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (9, 2), (11, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 115 for generator 3. -/
theorem ep_Q2_008_partial_03_0115_valid :
    mulPoly ep_Q2_008_coefficient_03_0115
        ep_Q2_008_generator_03_0100_0199 =
      ep_Q2_008_partial_03_0115 := by
  native_decide

/-- Coefficient term 116 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0116 : Poly :=
[
  term ((-3627691909684599375 : Rat) / 1385912907228352718) [(1, 1), (6, 1), (11, 1), (16, 1)]
]

/-- Partial product 116 for generator 3. -/
def ep_Q2_008_partial_03_0116 : Poly :=
[
  term ((-3627691909684599375 : Rat) / 1385912907228352718) [(1, 1), (2, 2), (6, 1), (11, 1), (16, 1)],
  term ((-3627691909684599375 : Rat) / 1385912907228352718) [(1, 1), (3, 2), (6, 1), (11, 1), (16, 1)],
  term ((3627691909684599375 : Rat) / 1385912907228352718) [(1, 1), (6, 1), (8, 2), (11, 1), (16, 1)],
  term ((3627691909684599375 : Rat) / 1385912907228352718) [(1, 1), (6, 1), (9, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 116 for generator 3. -/
theorem ep_Q2_008_partial_03_0116_valid :
    mulPoly ep_Q2_008_coefficient_03_0116
        ep_Q2_008_generator_03_0100_0199 =
      ep_Q2_008_partial_03_0116 := by
  native_decide

/-- Coefficient term 117 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0117 : Poly :=
[
  term ((21215886736744339523703249485584010466600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 117 for generator 3. -/
def ep_Q2_008_partial_03_0117 : Poly :=
[
  term ((21215886736744339523703249485584010466600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 2), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((21215886736744339523703249485584010466600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 2), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-21215886736744339523703249485584010466600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (8, 2), (12, 1), (15, 1), (16, 1)],
  term ((-21215886736744339523703249485584010466600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (9, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 117 for generator 3. -/
theorem ep_Q2_008_partial_03_0117_valid :
    mulPoly ep_Q2_008_coefficient_03_0117
        ep_Q2_008_generator_03_0100_0199 =
      ep_Q2_008_partial_03_0117 := by
  native_decide

/-- Coefficient term 118 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0118 : Poly :=
[
  term ((-537446166407415209189398179728040768000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 118 for generator 3. -/
def ep_Q2_008_partial_03_0118 : Poly :=
[
  term ((-537446166407415209189398179728040768000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 2), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((-537446166407415209189398179728040768000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 2), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((537446166407415209189398179728040768000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (8, 2), (13, 1), (15, 2), (16, 1)],
  term ((537446166407415209189398179728040768000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (9, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 118 for generator 3. -/
theorem ep_Q2_008_partial_03_0118_valid :
    mulPoly ep_Q2_008_coefficient_03_0118
        ep_Q2_008_generator_03_0100_0199 =
      ep_Q2_008_partial_03_0118 := by
  native_decide

/-- Coefficient term 119 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0119 : Poly :=
[
  term ((15930709909140662460 : Rat) / 692956453614176359) [(1, 1), (6, 1), (13, 1), (16, 1)]
]

/-- Partial product 119 for generator 3. -/
def ep_Q2_008_partial_03_0119 : Poly :=
[
  term ((15930709909140662460 : Rat) / 692956453614176359) [(1, 1), (2, 2), (6, 1), (13, 1), (16, 1)],
  term ((15930709909140662460 : Rat) / 692956453614176359) [(1, 1), (3, 2), (6, 1), (13, 1), (16, 1)],
  term ((-15930709909140662460 : Rat) / 692956453614176359) [(1, 1), (6, 1), (8, 2), (13, 1), (16, 1)],
  term ((-15930709909140662460 : Rat) / 692956453614176359) [(1, 1), (6, 1), (9, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 119 for generator 3. -/
theorem ep_Q2_008_partial_03_0119_valid :
    mulPoly ep_Q2_008_coefficient_03_0119
        ep_Q2_008_generator_03_0100_0199 =
      ep_Q2_008_partial_03_0119 := by
  native_decide

/-- Coefficient term 120 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0120 : Poly :=
[
  term ((-11691734803563333206741456756370236774400 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 120 for generator 3. -/
def ep_Q2_008_partial_03_0120 : Poly :=
[
  term ((-11691734803563333206741456756370236774400 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 2), (6, 1), (13, 2), (15, 1), (16, 1)],
  term ((-11691734803563333206741456756370236774400 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 2), (6, 1), (13, 2), (15, 1), (16, 1)],
  term ((11691734803563333206741456756370236774400 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (8, 2), (13, 2), (15, 1), (16, 1)],
  term ((11691734803563333206741456756370236774400 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (9, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 120 for generator 3. -/
theorem ep_Q2_008_partial_03_0120_valid :
    mulPoly ep_Q2_008_coefficient_03_0120
        ep_Q2_008_generator_03_0100_0199 =
      ep_Q2_008_partial_03_0120 := by
  native_decide

/-- Coefficient term 121 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0121 : Poly :=
[
  term ((-15925028570517060720602543763476311299975 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 121 for generator 3. -/
def ep_Q2_008_partial_03_0121 : Poly :=
[
  term ((-15925028570517060720602543763476311299975 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 2), (6, 1), (15, 1), (16, 1)],
  term ((-15925028570517060720602543763476311299975 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 2), (6, 1), (15, 1), (16, 1)],
  term ((15925028570517060720602543763476311299975 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (8, 2), (15, 1), (16, 1)],
  term ((15925028570517060720602543763476311299975 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 121 for generator 3. -/
theorem ep_Q2_008_partial_03_0121_valid :
    mulPoly ep_Q2_008_coefficient_03_0121
        ep_Q2_008_generator_03_0100_0199 =
      ep_Q2_008_partial_03_0121 := by
  native_decide

/-- Coefficient term 122 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0122 : Poly :=
[
  term ((-21813405123651604351406039090813201634600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 2), (15, 1), (16, 1)]
]

/-- Partial product 122 for generator 3. -/
def ep_Q2_008_partial_03_0122 : Poly :=
[
  term ((-21813405123651604351406039090813201634600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 2), (6, 2), (15, 1), (16, 1)],
  term ((-21813405123651604351406039090813201634600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 2), (6, 2), (15, 1), (16, 1)],
  term ((21813405123651604351406039090813201634600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 2), (8, 2), (15, 1), (16, 1)],
  term ((21813405123651604351406039090813201634600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 2), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 122 for generator 3. -/
theorem ep_Q2_008_partial_03_0122_valid :
    mulPoly ep_Q2_008_coefficient_03_0122
        ep_Q2_008_generator_03_0100_0199 =
      ep_Q2_008_partial_03_0122 := by
  native_decide

/-- Coefficient term 123 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0123 : Poly :=
[
  term ((-514517029672968000 : Rat) / 692956453614176359) [(1, 1), (7, 1), (10, 1), (16, 1)]
]

/-- Partial product 123 for generator 3. -/
def ep_Q2_008_partial_03_0123 : Poly :=
[
  term ((-514517029672968000 : Rat) / 692956453614176359) [(1, 1), (2, 2), (7, 1), (10, 1), (16, 1)],
  term ((-514517029672968000 : Rat) / 692956453614176359) [(1, 1), (3, 2), (7, 1), (10, 1), (16, 1)],
  term ((514517029672968000 : Rat) / 692956453614176359) [(1, 1), (7, 1), (8, 2), (10, 1), (16, 1)],
  term ((514517029672968000 : Rat) / 692956453614176359) [(1, 1), (7, 1), (9, 2), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 123 for generator 3. -/
theorem ep_Q2_008_partial_03_0123_valid :
    mulPoly ep_Q2_008_coefficient_03_0123
        ep_Q2_008_generator_03_0100_0199 =
      ep_Q2_008_partial_03_0123 := by
  native_decide

/-- Coefficient term 124 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0124 : Poly :=
[
  term ((-78273037166560530452376704018035200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 124 for generator 3. -/
def ep_Q2_008_partial_03_0124 : Poly :=
[
  term ((-78273037166560530452376704018035200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (2, 2), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-78273037166560530452376704018035200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (3, 2), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((78273037166560530452376704018035200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (7, 1), (8, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((78273037166560530452376704018035200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (7, 1), (9, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 124 for generator 3. -/
theorem ep_Q2_008_partial_03_0124_valid :
    mulPoly ep_Q2_008_coefficient_03_0124
        ep_Q2_008_generator_03_0100_0199 =
      ep_Q2_008_partial_03_0124 := by
  native_decide

/-- Coefficient term 125 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0125 : Poly :=
[
  term ((1094816955793144869 : Rat) / 692956453614176359) [(1, 1), (7, 1), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 125 for generator 3. -/
def ep_Q2_008_partial_03_0125 : Poly :=
[
  term ((1094816955793144869 : Rat) / 692956453614176359) [(1, 1), (2, 2), (7, 1), (12, 1), (13, 2), (16, 1)],
  term ((1094816955793144869 : Rat) / 692956453614176359) [(1, 1), (3, 2), (7, 1), (12, 1), (13, 2), (16, 1)],
  term ((-1094816955793144869 : Rat) / 692956453614176359) [(1, 1), (7, 1), (8, 2), (12, 1), (13, 2), (16, 1)],
  term ((-1094816955793144869 : Rat) / 692956453614176359) [(1, 1), (7, 1), (9, 2), (12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 125 for generator 3. -/
theorem ep_Q2_008_partial_03_0125_valid :
    mulPoly ep_Q2_008_coefficient_03_0125
        ep_Q2_008_generator_03_0100_0199 =
      ep_Q2_008_partial_03_0125 := by
  native_decide

/-- Coefficient term 126 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0126 : Poly :=
[
  term ((22120412655187583551838078959565376000 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (7, 1), (12, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 126 for generator 3. -/
def ep_Q2_008_partial_03_0126 : Poly :=
[
  term ((22120412655187583551838078959565376000 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (2, 2), (7, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((22120412655187583551838078959565376000 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (3, 2), (7, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-22120412655187583551838078959565376000 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (7, 1), (8, 2), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-22120412655187583551838078959565376000 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (7, 1), (9, 2), (12, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 126 for generator 3. -/
theorem ep_Q2_008_partial_03_0126_valid :
    mulPoly ep_Q2_008_coefficient_03_0126
        ep_Q2_008_generator_03_0100_0199 =
      ep_Q2_008_partial_03_0126 := by
  native_decide

/-- Coefficient term 127 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0127 : Poly :=
[
  term ((5396445710208685431 : Rat) / 692956453614176359) [(1, 1), (7, 1), (12, 1), (16, 1)]
]

/-- Partial product 127 for generator 3. -/
def ep_Q2_008_partial_03_0127 : Poly :=
[
  term ((5396445710208685431 : Rat) / 692956453614176359) [(1, 1), (2, 2), (7, 1), (12, 1), (16, 1)],
  term ((5396445710208685431 : Rat) / 692956453614176359) [(1, 1), (3, 2), (7, 1), (12, 1), (16, 1)],
  term ((-5396445710208685431 : Rat) / 692956453614176359) [(1, 1), (7, 1), (8, 2), (12, 1), (16, 1)],
  term ((-5396445710208685431 : Rat) / 692956453614176359) [(1, 1), (7, 1), (9, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 127 for generator 3. -/
theorem ep_Q2_008_partial_03_0127_valid :
    mulPoly ep_Q2_008_coefficient_03_0127
        ep_Q2_008_generator_03_0100_0199 =
      ep_Q2_008_partial_03_0127 := by
  native_decide

/-- Coefficient term 128 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0128 : Poly :=
[
  term ((-257258514836484000 : Rat) / 692956453614176359) [(1, 1), (7, 1), (16, 1)]
]

/-- Partial product 128 for generator 3. -/
def ep_Q2_008_partial_03_0128 : Poly :=
[
  term ((-257258514836484000 : Rat) / 692956453614176359) [(1, 1), (2, 2), (7, 1), (16, 1)],
  term ((-257258514836484000 : Rat) / 692956453614176359) [(1, 1), (3, 2), (7, 1), (16, 1)],
  term ((257258514836484000 : Rat) / 692956453614176359) [(1, 1), (7, 1), (8, 2), (16, 1)],
  term ((257258514836484000 : Rat) / 692956453614176359) [(1, 1), (7, 1), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 128 for generator 3. -/
theorem ep_Q2_008_partial_03_0128_valid :
    mulPoly ep_Q2_008_coefficient_03_0128
        ep_Q2_008_generator_03_0100_0199 =
      ep_Q2_008_partial_03_0128 := by
  native_decide

/-- Coefficient term 129 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0129 : Poly :=
[
  term ((609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (7, 2), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 129 for generator 3. -/
def ep_Q2_008_partial_03_0129 : Poly :=
[
  term ((609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (2, 2), (7, 2), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (3, 2), (7, 2), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (7, 2), (8, 2), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (7, 2), (9, 2), (12, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 129 for generator 3. -/
theorem ep_Q2_008_partial_03_0129_valid :
    mulPoly ep_Q2_008_coefficient_03_0129
        ep_Q2_008_generator_03_0100_0199 =
      ep_Q2_008_partial_03_0129 := by
  native_decide

/-- Coefficient term 130 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0130 : Poly :=
[
  term ((43336929246501263764396389789139200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (7, 2), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 130 for generator 3. -/
def ep_Q2_008_partial_03_0130 : Poly :=
[
  term ((43336929246501263764396389789139200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (2, 2), (7, 2), (12, 1), (15, 1), (16, 1)],
  term ((43336929246501263764396389789139200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (3, 2), (7, 2), (12, 1), (15, 1), (16, 1)],
  term ((-43336929246501263764396389789139200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (7, 2), (8, 2), (12, 1), (15, 1), (16, 1)],
  term ((-43336929246501263764396389789139200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (7, 2), (9, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 130 for generator 3. -/
theorem ep_Q2_008_partial_03_0130_valid :
    mulPoly ep_Q2_008_coefficient_03_0130
        ep_Q2_008_generator_03_0100_0199 =
      ep_Q2_008_partial_03_0130 := by
  native_decide

/-- Coefficient term 131 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0131 : Poly :=
[
  term ((60212255272942500 : Rat) / 692956453614176359) [(1, 1), (8, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 131 for generator 3. -/
def ep_Q2_008_partial_03_0131 : Poly :=
[
  term ((60212255272942500 : Rat) / 692956453614176359) [(1, 1), (2, 2), (8, 1), (11, 1), (12, 1), (16, 1)],
  term ((60212255272942500 : Rat) / 692956453614176359) [(1, 1), (3, 2), (8, 1), (11, 1), (12, 1), (16, 1)],
  term ((-60212255272942500 : Rat) / 692956453614176359) [(1, 1), (8, 1), (9, 2), (11, 1), (12, 1), (16, 1)],
  term ((-60212255272942500 : Rat) / 692956453614176359) [(1, 1), (8, 3), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 131 for generator 3. -/
theorem ep_Q2_008_partial_03_0131_valid :
    mulPoly ep_Q2_008_coefficient_03_0131
        ep_Q2_008_generator_03_0100_0199 =
      ep_Q2_008_partial_03_0131 := by
  native_decide

/-- Coefficient term 132 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0132 : Poly :=
[
  term ((-334972429023769676136412354446667776000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 132 for generator 3. -/
def ep_Q2_008_partial_03_0132 : Poly :=
[
  term ((-334972429023769676136412354446667776000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 2), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-334972429023769676136412354446667776000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 2), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((334972429023769676136412354446667776000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (8, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((334972429023769676136412354446667776000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (8, 3), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 132 for generator 3. -/
theorem ep_Q2_008_partial_03_0132_valid :
    mulPoly ep_Q2_008_coefficient_03_0132
        ep_Q2_008_generator_03_0100_0199 =
      ep_Q2_008_partial_03_0132 := by
  native_decide

/-- Coefficient term 133 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0133 : Poly :=
[
  term ((100574316499860000 : Rat) / 692956453614176359) [(1, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 133 for generator 3. -/
def ep_Q2_008_partial_03_0133 : Poly :=
[
  term ((100574316499860000 : Rat) / 692956453614176359) [(1, 1), (2, 2), (8, 1), (11, 1), (16, 1)],
  term ((100574316499860000 : Rat) / 692956453614176359) [(1, 1), (3, 2), (8, 1), (11, 1), (16, 1)],
  term ((-100574316499860000 : Rat) / 692956453614176359) [(1, 1), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((-100574316499860000 : Rat) / 692956453614176359) [(1, 1), (8, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 133 for generator 3. -/
theorem ep_Q2_008_partial_03_0133_valid :
    mulPoly ep_Q2_008_coefficient_03_0133
        ep_Q2_008_generator_03_0100_0199 =
      ep_Q2_008_partial_03_0133 := by
  native_decide

/-- Coefficient term 134 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0134 : Poly :=
[
  term ((-264988797391185653150505649995689332800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (8, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 134 for generator 3. -/
def ep_Q2_008_partial_03_0134 : Poly :=
[
  term ((-264988797391185653150505649995689332800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 2), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-264988797391185653150505649995689332800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 2), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((264988797391185653150505649995689332800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (8, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((264988797391185653150505649995689332800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (8, 3), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 134 for generator 3. -/
theorem ep_Q2_008_partial_03_0134_valid :
    mulPoly ep_Q2_008_coefficient_03_0134
        ep_Q2_008_generator_03_0100_0199 =
      ep_Q2_008_partial_03_0134 := by
  native_decide

/-- Coefficient term 135 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0135 : Poly :=
[
  term ((9497299241309471661 : Rat) / 2771825814456705436) [(1, 1), (8, 1), (13, 1), (16, 1)]
]

/-- Partial product 135 for generator 3. -/
def ep_Q2_008_partial_03_0135 : Poly :=
[
  term ((9497299241309471661 : Rat) / 2771825814456705436) [(1, 1), (2, 2), (8, 1), (13, 1), (16, 1)],
  term ((9497299241309471661 : Rat) / 2771825814456705436) [(1, 1), (3, 2), (8, 1), (13, 1), (16, 1)],
  term ((-9497299241309471661 : Rat) / 2771825814456705436) [(1, 1), (8, 1), (9, 2), (13, 1), (16, 1)],
  term ((-9497299241309471661 : Rat) / 2771825814456705436) [(1, 1), (8, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 135 for generator 3. -/
theorem ep_Q2_008_partial_03_0135_valid :
    mulPoly ep_Q2_008_coefficient_03_0135
        ep_Q2_008_generator_03_0100_0199 =
      ep_Q2_008_partial_03_0135 := by
  native_decide

/-- Coefficient term 136 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0136 : Poly :=
[
  term ((111657476341256558712137451482222592000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (8, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 136 for generator 3. -/
def ep_Q2_008_partial_03_0136 : Poly :=
[
  term ((111657476341256558712137451482222592000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 2), (8, 1), (13, 2), (15, 1), (16, 1)],
  term ((111657476341256558712137451482222592000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 2), (8, 1), (13, 2), (15, 1), (16, 1)],
  term ((-111657476341256558712137451482222592000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (8, 1), (9, 2), (13, 2), (15, 1), (16, 1)],
  term ((-111657476341256558712137451482222592000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (8, 3), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 136 for generator 3. -/
theorem ep_Q2_008_partial_03_0136_valid :
    mulPoly ep_Q2_008_coefficient_03_0136
        ep_Q2_008_generator_03_0100_0199 =
      ep_Q2_008_partial_03_0136 := by
  native_decide

/-- Coefficient term 137 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0137 : Poly :=
[
  term ((-33770396062446760700889152618906251200 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 137 for generator 3. -/
def ep_Q2_008_partial_03_0137 : Poly :=
[
  term ((-33770396062446760700889152618906251200 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 2), (8, 1), (15, 1), (16, 1)],
  term ((-33770396062446760700889152618906251200 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 2), (8, 1), (15, 1), (16, 1)],
  term ((33770396062446760700889152618906251200 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((33770396062446760700889152618906251200 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (8, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 137 for generator 3. -/
theorem ep_Q2_008_partial_03_0137_valid :
    mulPoly ep_Q2_008_coefficient_03_0137
        ep_Q2_008_generator_03_0100_0199 =
      ep_Q2_008_partial_03_0137 := by
  native_decide

/-- Coefficient term 138 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0138 : Poly :=
[
  term ((-385887772254726000 : Rat) / 692956453614176359) [(1, 1), (9, 1), (12, 1), (16, 1)]
]

/-- Partial product 138 for generator 3. -/
def ep_Q2_008_partial_03_0138 : Poly :=
[
  term ((-385887772254726000 : Rat) / 692956453614176359) [(1, 1), (2, 2), (9, 1), (12, 1), (16, 1)],
  term ((-385887772254726000 : Rat) / 692956453614176359) [(1, 1), (3, 2), (9, 1), (12, 1), (16, 1)],
  term ((385887772254726000 : Rat) / 692956453614176359) [(1, 1), (8, 2), (9, 1), (12, 1), (16, 1)],
  term ((385887772254726000 : Rat) / 692956453614176359) [(1, 1), (9, 3), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 138 for generator 3. -/
theorem ep_Q2_008_partial_03_0138_valid :
    mulPoly ep_Q2_008_coefficient_03_0138
        ep_Q2_008_generator_03_0100_0199 =
      ep_Q2_008_partial_03_0138 := by
  native_decide

/-- Coefficient term 139 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0139 : Poly :=
[
  term ((385887772254726000 : Rat) / 692956453614176359) [(1, 1), (9, 1), (16, 1)]
]

/-- Partial product 139 for generator 3. -/
def ep_Q2_008_partial_03_0139 : Poly :=
[
  term ((385887772254726000 : Rat) / 692956453614176359) [(1, 1), (2, 2), (9, 1), (16, 1)],
  term ((385887772254726000 : Rat) / 692956453614176359) [(1, 1), (3, 2), (9, 1), (16, 1)],
  term ((-385887772254726000 : Rat) / 692956453614176359) [(1, 1), (8, 2), (9, 1), (16, 1)],
  term ((-385887772254726000 : Rat) / 692956453614176359) [(1, 1), (9, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 139 for generator 3. -/
theorem ep_Q2_008_partial_03_0139_valid :
    mulPoly ep_Q2_008_coefficient_03_0139
        ep_Q2_008_generator_03_0100_0199 =
      ep_Q2_008_partial_03_0139 := by
  native_decide

/-- Coefficient term 140 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0140 : Poly :=
[
  term ((-47640465710460000 : Rat) / 692956453614176359) [(1, 1), (10, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 140 for generator 3. -/
def ep_Q2_008_partial_03_0140 : Poly :=
[
  term ((-47640465710460000 : Rat) / 692956453614176359) [(1, 1), (2, 2), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((-47640465710460000 : Rat) / 692956453614176359) [(1, 1), (3, 2), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((47640465710460000 : Rat) / 692956453614176359) [(1, 1), (8, 2), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((47640465710460000 : Rat) / 692956453614176359) [(1, 1), (9, 2), (10, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 140 for generator 3. -/
theorem ep_Q2_008_partial_03_0140_valid :
    mulPoly ep_Q2_008_coefficient_03_0140
        ep_Q2_008_generator_03_0100_0199 =
      ep_Q2_008_partial_03_0140 := by
  native_decide

/-- Coefficient term 141 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0141 : Poly :=
[
  term ((173887699843179000 : Rat) / 692956453614176359) [(1, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 141 for generator 3. -/
def ep_Q2_008_partial_03_0141 : Poly :=
[
  term ((173887699843179000 : Rat) / 692956453614176359) [(1, 1), (2, 2), (10, 1), (11, 1), (16, 1)],
  term ((173887699843179000 : Rat) / 692956453614176359) [(1, 1), (3, 2), (10, 1), (11, 1), (16, 1)],
  term ((-173887699843179000 : Rat) / 692956453614176359) [(1, 1), (8, 2), (10, 1), (11, 1), (16, 1)],
  term ((-173887699843179000 : Rat) / 692956453614176359) [(1, 1), (9, 2), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 141 for generator 3. -/
theorem ep_Q2_008_partial_03_0141_valid :
    mulPoly ep_Q2_008_coefficient_03_0141
        ep_Q2_008_generator_03_0100_0199 =
      ep_Q2_008_partial_03_0141 := by
  native_decide

/-- Coefficient term 142 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0142 : Poly :=
[
  term ((8489530989603972000 : Rat) / 692956453614176359) [(1, 1), (10, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 142 for generator 3. -/
def ep_Q2_008_partial_03_0142 : Poly :=
[
  term ((8489530989603972000 : Rat) / 692956453614176359) [(1, 1), (2, 2), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((8489530989603972000 : Rat) / 692956453614176359) [(1, 1), (3, 2), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-8489530989603972000 : Rat) / 692956453614176359) [(1, 1), (8, 2), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-8489530989603972000 : Rat) / 692956453614176359) [(1, 1), (9, 2), (10, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 142 for generator 3. -/
theorem ep_Q2_008_partial_03_0142_valid :
    mulPoly ep_Q2_008_coefficient_03_0142
        ep_Q2_008_generator_03_0100_0199 =
      ep_Q2_008_partial_03_0142 := by
  native_decide

/-- Coefficient term 143 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0143 : Poly :=
[
  term ((-33536628109921223774287078524254174232600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 143 for generator 3. -/
def ep_Q2_008_partial_03_0143 : Poly :=
[
  term ((-33536628109921223774287078524254174232600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 2), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-33536628109921223774287078524254174232600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 2), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((33536628109921223774287078524254174232600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (8, 2), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((33536628109921223774287078524254174232600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (9, 2), (10, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 143 for generator 3. -/
theorem ep_Q2_008_partial_03_0143_valid :
    mulPoly ep_Q2_008_coefficient_03_0143
        ep_Q2_008_generator_03_0100_0199 =
      ep_Q2_008_partial_03_0143 := by
  native_decide

/-- Coefficient term 144 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0144 : Poly :=
[
  term ((-16629421762023874983 : Rat) / 2771825814456705436) [(1, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 144 for generator 3. -/
def ep_Q2_008_partial_03_0144 : Poly :=
[
  term ((-16629421762023874983 : Rat) / 2771825814456705436) [(1, 1), (2, 2), (10, 1), (13, 1), (16, 1)],
  term ((-16629421762023874983 : Rat) / 2771825814456705436) [(1, 1), (3, 2), (10, 1), (13, 1), (16, 1)],
  term ((16629421762023874983 : Rat) / 2771825814456705436) [(1, 1), (8, 2), (10, 1), (13, 1), (16, 1)],
  term ((16629421762023874983 : Rat) / 2771825814456705436) [(1, 1), (9, 2), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 144 for generator 3. -/
theorem ep_Q2_008_partial_03_0144_valid :
    mulPoly ep_Q2_008_coefficient_03_0144
        ep_Q2_008_generator_03_0100_0199 =
      ep_Q2_008_partial_03_0144 := by
  native_decide

/-- Coefficient term 145 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0145 : Poly :=
[
  term ((-669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 145 for generator 3. -/
def ep_Q2_008_partial_03_0145 : Poly :=
[
  term ((-669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 2), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 2), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (8, 2), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (9, 2), (10, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 145 for generator 3. -/
theorem ep_Q2_008_partial_03_0145_valid :
    mulPoly ep_Q2_008_coefficient_03_0145
        ep_Q2_008_generator_03_0100_0199 =
      ep_Q2_008_partial_03_0145 := by
  native_decide

/-- Coefficient term 146 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0146 : Poly :=
[
  term ((33898718997323814473955420164791961779800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 146 for generator 3. -/
def ep_Q2_008_partial_03_0146 : Poly :=
[
  term ((33898718997323814473955420164791961779800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 2), (10, 1), (15, 1), (16, 1)],
  term ((33898718997323814473955420164791961779800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 2), (10, 1), (15, 1), (16, 1)],
  term ((-33898718997323814473955420164791961779800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (8, 2), (10, 1), (15, 1), (16, 1)],
  term ((-33898718997323814473955420164791961779800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (9, 2), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 146 for generator 3. -/
theorem ep_Q2_008_partial_03_0146_valid :
    mulPoly ep_Q2_008_coefficient_03_0146
        ep_Q2_008_generator_03_0100_0199 =
      ep_Q2_008_partial_03_0146 := by
  native_decide

/-- Coefficient term 147 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0147 : Poly :=
[
  term ((4005142638786577563590482971247979884800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 147 for generator 3. -/
def ep_Q2_008_partial_03_0147 : Poly :=
[
  term ((4005142638786577563590482971247979884800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 2), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((4005142638786577563590482971247979884800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 2), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4005142638786577563590482971247979884800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (8, 2), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4005142638786577563590482971247979884800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (9, 2), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 147 for generator 3. -/
theorem ep_Q2_008_partial_03_0147_valid :
    mulPoly ep_Q2_008_coefficient_03_0147
        ep_Q2_008_generator_03_0100_0199 =
      ep_Q2_008_partial_03_0147 := by
  native_decide

/-- Coefficient term 148 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0148 : Poly :=
[
  term ((14293661141217672000 : Rat) / 692956453614176359) [(1, 1), (11, 1), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 148 for generator 3. -/
def ep_Q2_008_partial_03_0148 : Poly :=
[
  term ((14293661141217672000 : Rat) / 692956453614176359) [(1, 1), (2, 2), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((14293661141217672000 : Rat) / 692956453614176359) [(1, 1), (3, 2), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((-14293661141217672000 : Rat) / 692956453614176359) [(1, 1), (8, 2), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((-14293661141217672000 : Rat) / 692956453614176359) [(1, 1), (9, 2), (11, 1), (12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 148 for generator 3. -/
theorem ep_Q2_008_partial_03_0148_valid :
    mulPoly ep_Q2_008_coefficient_03_0148
        ep_Q2_008_generator_03_0100_0199 =
      ep_Q2_008_partial_03_0148 := by
  native_decide

/-- Coefficient term 149 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0149 : Poly :=
[
  term ((1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 149 for generator 3. -/
def ep_Q2_008_partial_03_0149 : Poly :=
[
  term ((1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (2, 2), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (3, 2), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (8, 2), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (9, 2), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 149 for generator 3. -/
theorem ep_Q2_008_partial_03_0149_valid :
    mulPoly ep_Q2_008_coefficient_03_0149
        ep_Q2_008_generator_03_0100_0199 =
      ep_Q2_008_partial_03_0149 := by
  native_decide

/-- Coefficient term 150 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0150 : Poly :=
[
  term ((18877792635223727733 : Rat) / 2771825814456705436) [(1, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 150 for generator 3. -/
def ep_Q2_008_partial_03_0150 : Poly :=
[
  term ((18877792635223727733 : Rat) / 2771825814456705436) [(1, 1), (2, 2), (11, 1), (12, 1), (16, 1)],
  term ((18877792635223727733 : Rat) / 2771825814456705436) [(1, 1), (3, 2), (11, 1), (12, 1), (16, 1)],
  term ((-18877792635223727733 : Rat) / 2771825814456705436) [(1, 1), (8, 2), (11, 1), (12, 1), (16, 1)],
  term ((-18877792635223727733 : Rat) / 2771825814456705436) [(1, 1), (9, 2), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 150 for generator 3. -/
theorem ep_Q2_008_partial_03_0150_valid :
    mulPoly ep_Q2_008_coefficient_03_0150
        ep_Q2_008_generator_03_0100_0199 =
      ep_Q2_008_partial_03_0150 := by
  native_decide

/-- Coefficient term 151 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0151 : Poly :=
[
  term ((-43008753766387500 : Rat) / 692956453614176359) [(1, 1), (11, 1), (12, 2), (16, 1)]
]

/-- Partial product 151 for generator 3. -/
def ep_Q2_008_partial_03_0151 : Poly :=
[
  term ((-43008753766387500 : Rat) / 692956453614176359) [(1, 1), (2, 2), (11, 1), (12, 2), (16, 1)],
  term ((-43008753766387500 : Rat) / 692956453614176359) [(1, 1), (3, 2), (11, 1), (12, 2), (16, 1)],
  term ((43008753766387500 : Rat) / 692956453614176359) [(1, 1), (8, 2), (11, 1), (12, 2), (16, 1)],
  term ((43008753766387500 : Rat) / 692956453614176359) [(1, 1), (9, 2), (11, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 151 for generator 3. -/
theorem ep_Q2_008_partial_03_0151_valid :
    mulPoly ep_Q2_008_coefficient_03_0151
        ep_Q2_008_generator_03_0100_0199 =
      ep_Q2_008_partial_03_0151 := by
  native_decide

/-- Coefficient term 152 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0152 : Poly :=
[
  term ((-837431072559424190341030886116669440000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 152 for generator 3. -/
def ep_Q2_008_partial_03_0152 : Poly :=
[
  term ((-837431072559424190341030886116669440000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-837431072559424190341030886116669440000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((837431072559424190341030886116669440000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (8, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((837431072559424190341030886116669440000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 152 for generator 3. -/
theorem ep_Q2_008_partial_03_0152_valid :
    mulPoly ep_Q2_008_coefficient_03_0152
        ep_Q2_008_generator_03_0100_0199 =
      ep_Q2_008_partial_03_0152 := by
  native_decide

/-- Coefficient term 153 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0153 : Poly :=
[
  term ((-12467497743707299983 : Rat) / 2771825814456705436) [(1, 1), (11, 1), (16, 1)]
]

/-- Partial product 153 for generator 3. -/
def ep_Q2_008_partial_03_0153 : Poly :=
[
  term ((-12467497743707299983 : Rat) / 2771825814456705436) [(1, 1), (2, 2), (11, 1), (16, 1)],
  term ((-12467497743707299983 : Rat) / 2771825814456705436) [(1, 1), (3, 2), (11, 1), (16, 1)],
  term ((12467497743707299983 : Rat) / 2771825814456705436) [(1, 1), (8, 2), (11, 1), (16, 1)],
  term ((12467497743707299983 : Rat) / 2771825814456705436) [(1, 1), (9, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 153 for generator 3. -/
theorem ep_Q2_008_partial_03_0153_valid :
    mulPoly ep_Q2_008_coefficient_03_0153
        ep_Q2_008_generator_03_0100_0199 =
      ep_Q2_008_partial_03_0153 := by
  native_decide

/-- Coefficient term 154 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0154 : Poly :=
[
  term ((537446166407415209189398179728040768000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 154 for generator 3. -/
def ep_Q2_008_partial_03_0154 : Poly :=
[
  term ((537446166407415209189398179728040768000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 2), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((537446166407415209189398179728040768000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 2), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-537446166407415209189398179728040768000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (8, 2), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-537446166407415209189398179728040768000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (9, 2), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 154 for generator 3. -/
theorem ep_Q2_008_partial_03_0154_valid :
    mulPoly ep_Q2_008_coefficient_03_0154
        ep_Q2_008_generator_03_0100_0199 =
      ep_Q2_008_partial_03_0154 := by
  native_decide

/-- Coefficient term 155 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0155 : Poly :=
[
  term ((-63215296274816980179 : Rat) / 2771825814456705436) [(1, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 155 for generator 3. -/
def ep_Q2_008_partial_03_0155 : Poly :=
[
  term ((-63215296274816980179 : Rat) / 2771825814456705436) [(1, 1), (2, 2), (12, 1), (13, 1), (16, 1)],
  term ((-63215296274816980179 : Rat) / 2771825814456705436) [(1, 1), (3, 2), (12, 1), (13, 1), (16, 1)],
  term ((63215296274816980179 : Rat) / 2771825814456705436) [(1, 1), (8, 2), (12, 1), (13, 1), (16, 1)],
  term ((63215296274816980179 : Rat) / 2771825814456705436) [(1, 1), (9, 2), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 155 for generator 3. -/
theorem ep_Q2_008_partial_03_0155_valid :
    mulPoly ep_Q2_008_coefficient_03_0155
        ep_Q2_008_generator_03_0100_0199 =
      ep_Q2_008_partial_03_0155 := by
  native_decide

/-- Coefficient term 156 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0156 : Poly :=
[
  term ((12138364708928359441590006562299127142400 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 156 for generator 3. -/
def ep_Q2_008_partial_03_0156 : Poly :=
[
  term ((12138364708928359441590006562299127142400 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 2), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((12138364708928359441590006562299127142400 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 2), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-12138364708928359441590006562299127142400 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (8, 2), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-12138364708928359441590006562299127142400 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (9, 2), (12, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 156 for generator 3. -/
theorem ep_Q2_008_partial_03_0156_valid :
    mulPoly ep_Q2_008_coefficient_03_0156
        ep_Q2_008_generator_03_0100_0199 =
      ep_Q2_008_partial_03_0156 := by
  native_decide

/-- Coefficient term 157 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0157 : Poly :=
[
  term ((-63335310709037556130880962229377422589125 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 157 for generator 3. -/
def ep_Q2_008_partial_03_0157 : Poly :=
[
  term ((-63335310709037556130880962229377422589125 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 2), (12, 1), (15, 1), (16, 1)],
  term ((-63335310709037556130880962229377422589125 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 2), (12, 1), (15, 1), (16, 1)],
  term ((63335310709037556130880962229377422589125 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (8, 2), (12, 1), (15, 1), (16, 1)],
  term ((63335310709037556130880962229377422589125 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (9, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 157 for generator 3. -/
theorem ep_Q2_008_partial_03_0157_valid :
    mulPoly ep_Q2_008_coefficient_03_0157
        ep_Q2_008_generator_03_0100_0199 =
      ep_Q2_008_partial_03_0157 := by
  native_decide

/-- Coefficient term 158 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0158 : Poly :=
[
  term ((63892801305851915029291942101720580800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 158 for generator 3. -/
def ep_Q2_008_partial_03_0158 : Poly :=
[
  term ((63892801305851915029291942101720580800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 2), (12, 2), (15, 1), (16, 1)],
  term ((63892801305851915029291942101720580800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 2), (12, 2), (15, 1), (16, 1)],
  term ((-63892801305851915029291942101720580800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (8, 2), (12, 2), (15, 1), (16, 1)],
  term ((-63892801305851915029291942101720580800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (9, 2), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 158 for generator 3. -/
theorem ep_Q2_008_partial_03_0158_valid :
    mulPoly ep_Q2_008_coefficient_03_0158
        ep_Q2_008_generator_03_0100_0199 =
      ep_Q2_008_partial_03_0158 := by
  native_decide

/-- Coefficient term 159 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0159 : Poly :=
[
  term ((-22017903237735442305 : Rat) / 5543651628913410872) [(1, 1), (13, 1), (16, 1)]
]

/-- Partial product 159 for generator 3. -/
def ep_Q2_008_partial_03_0159 : Poly :=
[
  term ((-22017903237735442305 : Rat) / 5543651628913410872) [(1, 1), (2, 2), (13, 1), (16, 1)],
  term ((-22017903237735442305 : Rat) / 5543651628913410872) [(1, 1), (3, 2), (13, 1), (16, 1)],
  term ((22017903237735442305 : Rat) / 5543651628913410872) [(1, 1), (8, 2), (13, 1), (16, 1)],
  term ((22017903237735442305 : Rat) / 5543651628913410872) [(1, 1), (9, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 159 for generator 3. -/
theorem ep_Q2_008_partial_03_0159_valid :
    mulPoly ep_Q2_008_coefficient_03_0159
        ep_Q2_008_generator_03_0100_0199 =
      ep_Q2_008_partial_03_0159 := by
  native_decide

/-- Coefficient term 160 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0160 : Poly :=
[
  term ((-614116119876911072916755983152224256000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 160 for generator 3. -/
def ep_Q2_008_partial_03_0160 : Poly :=
[
  term ((-614116119876911072916755983152224256000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 2), (13, 2), (15, 1), (16, 1)],
  term ((-614116119876911072916755983152224256000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 2), (13, 2), (15, 1), (16, 1)],
  term ((614116119876911072916755983152224256000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (8, 2), (13, 2), (15, 1), (16, 1)],
  term ((614116119876911072916755983152224256000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (9, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 160 for generator 3. -/
theorem ep_Q2_008_partial_03_0160_valid :
    mulPoly ep_Q2_008_coefficient_03_0160
        ep_Q2_008_generator_03_0100_0199 =
      ep_Q2_008_partial_03_0160 := by
  native_decide

/-- Coefficient term 161 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0161 : Poly :=
[
  term ((81046706772867584584036124334012092541000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 161 for generator 3. -/
def ep_Q2_008_partial_03_0161 : Poly :=
[
  term ((81046706772867584584036124334012092541000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 2), (15, 1), (16, 1)],
  term ((81046706772867584584036124334012092541000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 2), (15, 1), (16, 1)],
  term ((-81046706772867584584036124334012092541000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (8, 2), (15, 1), (16, 1)],
  term ((-81046706772867584584036124334012092541000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 161 for generator 3. -/
theorem ep_Q2_008_partial_03_0161_valid :
    mulPoly ep_Q2_008_coefficient_03_0161
        ep_Q2_008_generator_03_0100_0199 =
      ep_Q2_008_partial_03_0161 := by
  native_decide

/-- Coefficient term 162 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0162 : Poly :=
[
  term ((-669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 2), (4, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 162 for generator 3. -/
def ep_Q2_008_partial_03_0162 : Poly :=
[
  term ((-669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 2), (2, 2), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 2), (3, 2), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 2), (4, 1), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 2), (4, 1), (9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 162 for generator 3. -/
theorem ep_Q2_008_partial_03_0162_valid :
    mulPoly ep_Q2_008_coefficient_03_0162
        ep_Q2_008_generator_03_0100_0199 =
      ep_Q2_008_partial_03_0162 := by
  native_decide

/-- Coefficient term 163 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0163 : Poly :=
[
  term ((-10455217405948258983 : Rat) / 2771825814456705436) [(1, 2), (4, 1), (16, 1)]
]

/-- Partial product 163 for generator 3. -/
def ep_Q2_008_partial_03_0163 : Poly :=
[
  term ((-10455217405948258983 : Rat) / 2771825814456705436) [(1, 2), (2, 2), (4, 1), (16, 1)],
  term ((-10455217405948258983 : Rat) / 2771825814456705436) [(1, 2), (3, 2), (4, 1), (16, 1)],
  term ((10455217405948258983 : Rat) / 2771825814456705436) [(1, 2), (4, 1), (8, 2), (16, 1)],
  term ((10455217405948258983 : Rat) / 2771825814456705436) [(1, 2), (4, 1), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 163 for generator 3. -/
theorem ep_Q2_008_partial_03_0163_valid :
    mulPoly ep_Q2_008_coefficient_03_0163
        ep_Q2_008_generator_03_0100_0199 =
      ep_Q2_008_partial_03_0163 := by
  native_decide

/-- Coefficient term 164 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0164 : Poly :=
[
  term ((669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 164 for generator 3. -/
def ep_Q2_008_partial_03_0164 : Poly :=
[
  term ((669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 2), (2, 2), (13, 1), (15, 1), (16, 1)],
  term ((669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 2), (3, 2), (13, 1), (15, 1), (16, 1)],
  term ((-669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 2), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((-669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 2), (9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 164 for generator 3. -/
theorem ep_Q2_008_partial_03_0164_valid :
    mulPoly ep_Q2_008_coefficient_03_0164
        ep_Q2_008_generator_03_0100_0199 =
      ep_Q2_008_partial_03_0164 := by
  native_decide

/-- Coefficient term 165 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0165 : Poly :=
[
  term ((10455217405948258983 : Rat) / 2771825814456705436) [(1, 2), (16, 1)]
]

/-- Partial product 165 for generator 3. -/
def ep_Q2_008_partial_03_0165 : Poly :=
[
  term ((10455217405948258983 : Rat) / 2771825814456705436) [(1, 2), (2, 2), (16, 1)],
  term ((10455217405948258983 : Rat) / 2771825814456705436) [(1, 2), (3, 2), (16, 1)],
  term ((-10455217405948258983 : Rat) / 2771825814456705436) [(1, 2), (8, 2), (16, 1)],
  term ((-10455217405948258983 : Rat) / 2771825814456705436) [(1, 2), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 165 for generator 3. -/
theorem ep_Q2_008_partial_03_0165_valid :
    mulPoly ep_Q2_008_coefficient_03_0165
        ep_Q2_008_generator_03_0100_0199 =
      ep_Q2_008_partial_03_0165 := by
  native_decide

/-- Coefficient term 166 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0166 : Poly :=
[
  term ((52208389534807899966554525138047200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 166 for generator 3. -/
def ep_Q2_008_partial_03_0166 : Poly :=
[
  term ((52208389534807899966554525138047200 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (3, 1), (4, 1), (6, 1), (15, 1), (16, 1)],
  term ((-52208389534807899966554525138047200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (6, 1), (8, 2), (15, 1), (16, 1)],
  term ((-52208389534807899966554525138047200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (6, 1), (9, 2), (15, 1), (16, 1)],
  term ((52208389534807899966554525138047200 : Rat) / 2908751756057405437512772901016949218931) [(3, 3), (4, 1), (6, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 166 for generator 3. -/
theorem ep_Q2_008_partial_03_0166_valid :
    mulPoly ep_Q2_008_coefficient_03_0166
        ep_Q2_008_generator_03_0100_0199 =
      ep_Q2_008_partial_03_0166 := by
  native_decide

/-- Coefficient term 167 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0167 : Poly :=
[
  term ((215817414009571000480626496701028800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 167 for generator 3. -/
def ep_Q2_008_partial_03_0167 : Poly :=
[
  term ((215817414009571000480626496701028800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (3, 1), (4, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-215817414009571000480626496701028800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 1), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((-215817414009571000480626496701028800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((215817414009571000480626496701028800 : Rat) / 2908751756057405437512772901016949218931) [(3, 3), (4, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 167 for generator 3. -/
theorem ep_Q2_008_partial_03_0167_valid :
    mulPoly ep_Q2_008_coefficient_03_0167
        ep_Q2_008_generator_03_0100_0199 =
      ep_Q2_008_partial_03_0167 := by
  native_decide

/-- Coefficient term 168 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0168 : Poly :=
[
  term ((385887772254726000 : Rat) / 692956453614176359) [(3, 1), (4, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 168 for generator 3. -/
def ep_Q2_008_partial_03_0168 : Poly :=
[
  term ((385887772254726000 : Rat) / 692956453614176359) [(2, 2), (3, 1), (4, 1), (10, 1), (13, 1), (16, 1)],
  term ((-385887772254726000 : Rat) / 692956453614176359) [(3, 1), (4, 1), (8, 2), (10, 1), (13, 1), (16, 1)],
  term ((-385887772254726000 : Rat) / 692956453614176359) [(3, 1), (4, 1), (9, 2), (10, 1), (13, 1), (16, 1)],
  term ((385887772254726000 : Rat) / 692956453614176359) [(3, 3), (4, 1), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 168 for generator 3. -/
theorem ep_Q2_008_partial_03_0168_valid :
    mulPoly ep_Q2_008_coefficient_03_0168
        ep_Q2_008_generator_03_0100_0199 =
      ep_Q2_008_partial_03_0168 := by
  native_decide

/-- Coefficient term 169 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0169 : Poly :=
[
  term ((1804205182183737225 : Rat) / 1385912907228352718) [(3, 1), (4, 1), (13, 1), (16, 1)]
]

/-- Partial product 169 for generator 3. -/
def ep_Q2_008_partial_03_0169 : Poly :=
[
  term ((1804205182183737225 : Rat) / 1385912907228352718) [(2, 2), (3, 1), (4, 1), (13, 1), (16, 1)],
  term ((-1804205182183737225 : Rat) / 1385912907228352718) [(3, 1), (4, 1), (8, 2), (13, 1), (16, 1)],
  term ((-1804205182183737225 : Rat) / 1385912907228352718) [(3, 1), (4, 1), (9, 2), (13, 1), (16, 1)],
  term ((1804205182183737225 : Rat) / 1385912907228352718) [(3, 3), (4, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 169 for generator 3. -/
theorem ep_Q2_008_partial_03_0169_valid :
    mulPoly ep_Q2_008_coefficient_03_0169
        ep_Q2_008_generator_03_0100_0199 =
      ep_Q2_008_partial_03_0169 := by
  native_decide

/-- Coefficient term 170 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0170 : Poly :=
[
  term ((-52208389534807899966554525138047200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (15, 1), (16, 1)]
]

/-- Partial product 170 for generator 3. -/
def ep_Q2_008_partial_03_0170 : Poly :=
[
  term ((-52208389534807899966554525138047200 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((52208389534807899966554525138047200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (8, 2), (15, 1), (16, 1)],
  term ((52208389534807899966554525138047200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (9, 2), (15, 1), (16, 1)],
  term ((-52208389534807899966554525138047200 : Rat) / 2908751756057405437512772901016949218931) [(3, 3), (4, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 170 for generator 3. -/
theorem ep_Q2_008_partial_03_0170_valid :
    mulPoly ep_Q2_008_coefficient_03_0170
        ep_Q2_008_generator_03_0100_0199 =
      ep_Q2_008_partial_03_0170 := by
  native_decide

/-- Coefficient term 171 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0171 : Poly :=
[
  term ((-516327403063627358773572644048793600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 171 for generator 3. -/
def ep_Q2_008_partial_03_0171 : Poly :=
[
  term ((-516327403063627358773572644048793600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (3, 1), (5, 1), (6, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((516327403063627358773572644048793600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 1), (8, 2), (13, 2), (15, 1), (16, 1)],
  term ((516327403063627358773572644048793600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 1), (9, 2), (13, 2), (15, 1), (16, 1)],
  term ((-516327403063627358773572644048793600 : Rat) / 2908751756057405437512772901016949218931) [(3, 3), (5, 1), (6, 1), (7, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 171 for generator 3. -/
theorem ep_Q2_008_partial_03_0171_valid :
    mulPoly ep_Q2_008_coefficient_03_0171
        ep_Q2_008_generator_03_0100_0199 =
      ep_Q2_008_partial_03_0171 := by
  native_decide

/-- Coefficient term 172 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0172 : Poly :=
[
  term ((3796525022526671755688034147417600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 172 for generator 3. -/
def ep_Q2_008_partial_03_0172 : Poly :=
[
  term ((3796525022526671755688034147417600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (3, 1), (5, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-3796525022526671755688034147417600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 1), (8, 2), (15, 1), (16, 1)],
  term ((-3796525022526671755688034147417600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((3796525022526671755688034147417600 : Rat) / 2908751756057405437512772901016949218931) [(3, 3), (5, 1), (6, 1), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 172 for generator 3. -/
theorem ep_Q2_008_partial_03_0172_valid :
    mulPoly ep_Q2_008_coefficient_03_0172
        ep_Q2_008_generator_03_0100_0199 =
      ep_Q2_008_partial_03_0172 := by
  native_decide

/-- Coefficient term 173 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0173 : Poly :=
[
  term ((-86111778068036223792 : Rat) / 692956453614176359) [(3, 1), (5, 1), (6, 1), (13, 2), (16, 1)]
]

/-- Partial product 173 for generator 3. -/
def ep_Q2_008_partial_03_0173 : Poly :=
[
  term ((-86111778068036223792 : Rat) / 692956453614176359) [(2, 2), (3, 1), (5, 1), (6, 1), (13, 2), (16, 1)],
  term ((86111778068036223792 : Rat) / 692956453614176359) [(3, 1), (5, 1), (6, 1), (8, 2), (13, 2), (16, 1)],
  term ((86111778068036223792 : Rat) / 692956453614176359) [(3, 1), (5, 1), (6, 1), (9, 2), (13, 2), (16, 1)],
  term ((-86111778068036223792 : Rat) / 692956453614176359) [(3, 3), (5, 1), (6, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 173 for generator 3. -/
theorem ep_Q2_008_partial_03_0173_valid :
    mulPoly ep_Q2_008_coefficient_03_0173
        ep_Q2_008_generator_03_0100_0199 =
      ep_Q2_008_partial_03_0173 := by
  native_decide

/-- Coefficient term 174 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0174 : Poly :=
[
  term ((30955433660627124993 : Rat) / 2771825814456705436) [(3, 1), (5, 1), (6, 1), (16, 1)]
]

/-- Partial product 174 for generator 3. -/
def ep_Q2_008_partial_03_0174 : Poly :=
[
  term ((30955433660627124993 : Rat) / 2771825814456705436) [(2, 2), (3, 1), (5, 1), (6, 1), (16, 1)],
  term ((-30955433660627124993 : Rat) / 2771825814456705436) [(3, 1), (5, 1), (6, 1), (8, 2), (16, 1)],
  term ((-30955433660627124993 : Rat) / 2771825814456705436) [(3, 1), (5, 1), (6, 1), (9, 2), (16, 1)],
  term ((30955433660627124993 : Rat) / 2771825814456705436) [(3, 3), (5, 1), (6, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 174 for generator 3. -/
theorem ep_Q2_008_partial_03_0174_valid :
    mulPoly ep_Q2_008_coefficient_03_0174
        ep_Q2_008_generator_03_0100_0199 =
      ep_Q2_008_partial_03_0174 := by
  native_decide

/-- Coefficient term 175 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0175 : Poly :=
[
  term ((-215817414009571000480626496701028800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 175 for generator 3. -/
def ep_Q2_008_partial_03_0175 : Poly :=
[
  term ((-215817414009571000480626496701028800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (3, 1), (5, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((215817414009571000480626496701028800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (8, 2), (12, 1), (15, 1), (16, 1)],
  term ((215817414009571000480626496701028800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((-215817414009571000480626496701028800 : Rat) / 2908751756057405437512772901016949218931) [(3, 3), (5, 1), (7, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 175 for generator 3. -/
theorem ep_Q2_008_partial_03_0175_valid :
    mulPoly ep_Q2_008_coefficient_03_0175
        ep_Q2_008_generator_03_0100_0199 =
      ep_Q2_008_partial_03_0175 := by
  native_decide

/-- Coefficient term 176 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0176 : Poly :=
[
  term ((516327403063627358773572644048793600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 176 for generator 3. -/
def ep_Q2_008_partial_03_0176 : Poly :=
[
  term ((516327403063627358773572644048793600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (3, 1), (5, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-516327403063627358773572644048793600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (8, 2), (13, 2), (15, 1), (16, 1)],
  term ((-516327403063627358773572644048793600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (9, 2), (13, 2), (15, 1), (16, 1)],
  term ((516327403063627358773572644048793600 : Rat) / 2908751756057405437512772901016949218931) [(3, 3), (5, 1), (7, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 176 for generator 3. -/
theorem ep_Q2_008_partial_03_0176_valid :
    mulPoly ep_Q2_008_coefficient_03_0176
        ep_Q2_008_generator_03_0100_0199 =
      ep_Q2_008_partial_03_0176 := by
  native_decide

/-- Coefficient term 177 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0177 : Poly :=
[
  term ((212020888987044328724938462553611200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 177 for generator 3. -/
def ep_Q2_008_partial_03_0177 : Poly :=
[
  term ((212020888987044328724938462553611200 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (3, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-212020888987044328724938462553611200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (8, 2), (15, 1), (16, 1)],
  term ((-212020888987044328724938462553611200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((212020888987044328724938462553611200 : Rat) / 2908751756057405437512772901016949218931) [(3, 3), (5, 1), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 177 for generator 3. -/
theorem ep_Q2_008_partial_03_0177_valid :
    mulPoly ep_Q2_008_coefficient_03_0177
        ep_Q2_008_generator_03_0100_0199 =
      ep_Q2_008_partial_03_0177 := by
  native_decide

/-- Coefficient term 178 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0178 : Poly :=
[
  term ((-385887772254726000 : Rat) / 692956453614176359) [(3, 1), (5, 1), (10, 1), (12, 1), (16, 1)]
]

/-- Partial product 178 for generator 3. -/
def ep_Q2_008_partial_03_0178 : Poly :=
[
  term ((-385887772254726000 : Rat) / 692956453614176359) [(2, 2), (3, 1), (5, 1), (10, 1), (12, 1), (16, 1)],
  term ((385887772254726000 : Rat) / 692956453614176359) [(3, 1), (5, 1), (8, 2), (10, 1), (12, 1), (16, 1)],
  term ((385887772254726000 : Rat) / 692956453614176359) [(3, 1), (5, 1), (9, 2), (10, 1), (12, 1), (16, 1)],
  term ((-385887772254726000 : Rat) / 692956453614176359) [(3, 3), (5, 1), (10, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 178 for generator 3. -/
theorem ep_Q2_008_partial_03_0178_valid :
    mulPoly ep_Q2_008_coefficient_03_0178
        ep_Q2_008_generator_03_0100_0199 =
      ep_Q2_008_partial_03_0178 := by
  native_decide

/-- Coefficient term 179 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0179 : Poly :=
[
  term ((385887772254726000 : Rat) / 692956453614176359) [(3, 1), (5, 1), (10, 1), (16, 1)]
]

/-- Partial product 179 for generator 3. -/
def ep_Q2_008_partial_03_0179 : Poly :=
[
  term ((385887772254726000 : Rat) / 692956453614176359) [(2, 2), (3, 1), (5, 1), (10, 1), (16, 1)],
  term ((-385887772254726000 : Rat) / 692956453614176359) [(3, 1), (5, 1), (8, 2), (10, 1), (16, 1)],
  term ((-385887772254726000 : Rat) / 692956453614176359) [(3, 1), (5, 1), (9, 2), (10, 1), (16, 1)],
  term ((385887772254726000 : Rat) / 692956453614176359) [(3, 3), (5, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 179 for generator 3. -/
theorem ep_Q2_008_partial_03_0179_valid :
    mulPoly ep_Q2_008_coefficient_03_0179
        ep_Q2_008_generator_03_0100_0199 =
      ep_Q2_008_partial_03_0179 := by
  native_decide

/-- Coefficient term 180 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0180 : Poly :=
[
  term ((-1804205182183737225 : Rat) / 1385912907228352718) [(3, 1), (5, 1), (12, 1), (16, 1)]
]

/-- Partial product 180 for generator 3. -/
def ep_Q2_008_partial_03_0180 : Poly :=
[
  term ((-1804205182183737225 : Rat) / 1385912907228352718) [(2, 2), (3, 1), (5, 1), (12, 1), (16, 1)],
  term ((1804205182183737225 : Rat) / 1385912907228352718) [(3, 1), (5, 1), (8, 2), (12, 1), (16, 1)],
  term ((1804205182183737225 : Rat) / 1385912907228352718) [(3, 1), (5, 1), (9, 2), (12, 1), (16, 1)],
  term ((-1804205182183737225 : Rat) / 1385912907228352718) [(3, 3), (5, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 180 for generator 3. -/
theorem ep_Q2_008_partial_03_0180_valid :
    mulPoly ep_Q2_008_coefficient_03_0180
        ep_Q2_008_generator_03_0100_0199 =
      ep_Q2_008_partial_03_0180 := by
  native_decide

/-- Coefficient term 181 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0181 : Poly :=
[
  term ((86111778068036223792 : Rat) / 692956453614176359) [(3, 1), (5, 1), (13, 2), (16, 1)]
]

/-- Partial product 181 for generator 3. -/
def ep_Q2_008_partial_03_0181 : Poly :=
[
  term ((86111778068036223792 : Rat) / 692956453614176359) [(2, 2), (3, 1), (5, 1), (13, 2), (16, 1)],
  term ((-86111778068036223792 : Rat) / 692956453614176359) [(3, 1), (5, 1), (8, 2), (13, 2), (16, 1)],
  term ((-86111778068036223792 : Rat) / 692956453614176359) [(3, 1), (5, 1), (9, 2), (13, 2), (16, 1)],
  term ((86111778068036223792 : Rat) / 692956453614176359) [(3, 3), (5, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 181 for generator 3. -/
theorem ep_Q2_008_partial_03_0181_valid :
    mulPoly ep_Q2_008_coefficient_03_0181
        ep_Q2_008_generator_03_0100_0199 =
      ep_Q2_008_partial_03_0181 := by
  native_decide

/-- Coefficient term 182 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0182 : Poly :=
[
  term ((-27347023296259650543 : Rat) / 2771825814456705436) [(3, 1), (5, 1), (16, 1)]
]

/-- Partial product 182 for generator 3. -/
def ep_Q2_008_partial_03_0182 : Poly :=
[
  term ((-27347023296259650543 : Rat) / 2771825814456705436) [(2, 2), (3, 1), (5, 1), (16, 1)],
  term ((27347023296259650543 : Rat) / 2771825814456705436) [(3, 1), (5, 1), (8, 2), (16, 1)],
  term ((27347023296259650543 : Rat) / 2771825814456705436) [(3, 1), (5, 1), (9, 2), (16, 1)],
  term ((-27347023296259650543 : Rat) / 2771825814456705436) [(3, 3), (5, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 182 for generator 3. -/
theorem ep_Q2_008_partial_03_0182_valid :
    mulPoly ep_Q2_008_coefficient_03_0182
        ep_Q2_008_generator_03_0100_0199 =
      ep_Q2_008_partial_03_0182 := by
  native_decide

/-- Coefficient term 183 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0183 : Poly :=
[
  term ((531455164116744865261071891224851200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 183 for generator 3. -/
def ep_Q2_008_partial_03_0183 : Poly :=
[
  term ((531455164116744865261071891224851200 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (3, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-531455164116744865261071891224851200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((-531455164116744865261071891224851200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((531455164116744865261071891224851200 : Rat) / 2908751756057405437512772901016949218931) [(3, 3), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 183 for generator 3. -/
theorem ep_Q2_008_partial_03_0183_valid :
    mulPoly ep_Q2_008_coefficient_03_0183
        ep_Q2_008_generator_03_0100_0199 =
      ep_Q2_008_partial_03_0183 := by
  native_decide

/-- Coefficient term 184 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0184 : Poly :=
[
  term ((1459755941057526492 : Rat) / 692956453614176359) [(3, 1), (6, 1), (7, 1), (13, 2), (16, 1)]
]

/-- Partial product 184 for generator 3. -/
def ep_Q2_008_partial_03_0184 : Poly :=
[
  term ((1459755941057526492 : Rat) / 692956453614176359) [(2, 2), (3, 1), (6, 1), (7, 1), (13, 2), (16, 1)],
  term ((-1459755941057526492 : Rat) / 692956453614176359) [(3, 1), (6, 1), (7, 1), (8, 2), (13, 2), (16, 1)],
  term ((-1459755941057526492 : Rat) / 692956453614176359) [(3, 1), (6, 1), (7, 1), (9, 2), (13, 2), (16, 1)],
  term ((1459755941057526492 : Rat) / 692956453614176359) [(3, 3), (6, 1), (7, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 184 for generator 3. -/
theorem ep_Q2_008_partial_03_0184_valid :
    mulPoly ep_Q2_008_coefficient_03_0184
        ep_Q2_008_generator_03_0100_0199 =
      ep_Q2_008_partial_03_0184 := by
  native_decide

/-- Coefficient term 185 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0185 : Poly :=
[
  term ((29493883540250111402450771946087168000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 185 for generator 3. -/
def ep_Q2_008_partial_03_0185 : Poly :=
[
  term ((29493883540250111402450771946087168000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (3, 1), (6, 1), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((-29493883540250111402450771946087168000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (8, 2), (13, 3), (15, 1), (16, 1)],
  term ((-29493883540250111402450771946087168000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (9, 2), (13, 3), (15, 1), (16, 1)],
  term ((29493883540250111402450771946087168000 : Rat) / 2908751756057405437512772901016949218931) [(3, 3), (6, 1), (7, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 185 for generator 3. -/
theorem ep_Q2_008_partial_03_0185_valid :
    mulPoly ep_Q2_008_coefficient_03_0185
        ep_Q2_008_generator_03_0100_0199 =
      ep_Q2_008_partial_03_0185 := by
  native_decide

/-- Coefficient term 186 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0186 : Poly :=
[
  term ((812294800564430025004231306094284800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 2), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 186 for generator 3. -/
def ep_Q2_008_partial_03_0186 : Poly :=
[
  term ((812294800564430025004231306094284800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (3, 1), (6, 1), (7, 2), (13, 2), (15, 1), (16, 1)],
  term ((-812294800564430025004231306094284800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 2), (8, 2), (13, 2), (15, 1), (16, 1)],
  term ((-812294800564430025004231306094284800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 2), (9, 2), (13, 2), (15, 1), (16, 1)],
  term ((812294800564430025004231306094284800 : Rat) / 2908751756057405437512772901016949218931) [(3, 3), (6, 1), (7, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 186 for generator 3. -/
theorem ep_Q2_008_partial_03_0186_valid :
    mulPoly ep_Q2_008_coefficient_03_0186
        ep_Q2_008_generator_03_0100_0199 =
      ep_Q2_008_partial_03_0186 := by
  native_decide

/-- Coefficient term 187 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0187 : Poly :=
[
  term ((39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 187 for generator 3. -/
def ep_Q2_008_partial_03_0187 : Poly :=
[
  term ((39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (3, 1), (6, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (8, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (9, 3), (13, 1), (15, 1), (16, 1)],
  term ((39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(3, 3), (6, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 187 for generator 3. -/
theorem ep_Q2_008_partial_03_0187_valid :
    mulPoly ep_Q2_008_coefficient_03_0187
        ep_Q2_008_generator_03_0100_0199 =
      ep_Q2_008_partial_03_0187 := by
  native_decide

/-- Coefficient term 188 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0188 : Poly :=
[
  term ((-70324786932212700 : Rat) / 692956453614176359) [(3, 1), (6, 1), (9, 1), (16, 1)]
]

/-- Partial product 188 for generator 3. -/
def ep_Q2_008_partial_03_0188 : Poly :=
[
  term ((-70324786932212700 : Rat) / 692956453614176359) [(2, 2), (3, 1), (6, 1), (9, 1), (16, 1)],
  term ((70324786932212700 : Rat) / 692956453614176359) [(3, 1), (6, 1), (8, 2), (9, 1), (16, 1)],
  term ((70324786932212700 : Rat) / 692956453614176359) [(3, 1), (6, 1), (9, 3), (16, 1)],
  term ((-70324786932212700 : Rat) / 692956453614176359) [(3, 3), (6, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 188 for generator 3. -/
theorem ep_Q2_008_partial_03_0188_valid :
    mulPoly ep_Q2_008_coefficient_03_0188
        ep_Q2_008_generator_03_0100_0199 =
      ep_Q2_008_partial_03_0188 := by
  native_decide

/-- Coefficient term 189 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0189 : Poly :=
[
  term ((7717755445094520000 : Rat) / 692956453614176359) [(3, 1), (6, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 189 for generator 3. -/
def ep_Q2_008_partial_03_0189 : Poly :=
[
  term ((7717755445094520000 : Rat) / 692956453614176359) [(2, 2), (3, 1), (6, 1), (10, 1), (13, 1), (16, 1)],
  term ((-7717755445094520000 : Rat) / 692956453614176359) [(3, 1), (6, 1), (8, 2), (10, 1), (13, 1), (16, 1)],
  term ((-7717755445094520000 : Rat) / 692956453614176359) [(3, 1), (6, 1), (9, 2), (10, 1), (13, 1), (16, 1)],
  term ((7717755445094520000 : Rat) / 692956453614176359) [(3, 3), (6, 1), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 189 for generator 3. -/
theorem ep_Q2_008_partial_03_0189_valid :
    mulPoly ep_Q2_008_coefficient_03_0189
        ep_Q2_008_generator_03_0100_0199 =
      ep_Q2_008_partial_03_0189 := by
  native_decide

/-- Coefficient term 190 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0190 : Poly :=
[
  term ((2343133172956448821031328838872771360000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 190 for generator 3. -/
def ep_Q2_008_partial_03_0190 : Poly :=
[
  term ((2343133172956448821031328838872771360000 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (3, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2343133172956448821031328838872771360000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (8, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2343133172956448821031328838872771360000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((2343133172956448821031328838872771360000 : Rat) / 84353800925664757687870414129491527348999) [(3, 3), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 190 for generator 3. -/
theorem ep_Q2_008_partial_03_0190_valid :
    mulPoly ep_Q2_008_coefficient_03_0190
        ep_Q2_008_generator_03_0100_0199 =
      ep_Q2_008_partial_03_0190 := by
  native_decide

/-- Coefficient term 191 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0191 : Poly :=
[
  term ((19058214854956896000 : Rat) / 692956453614176359) [(3, 1), (6, 1), (11, 1), (13, 2), (16, 1)]
]

/-- Partial product 191 for generator 3. -/
def ep_Q2_008_partial_03_0191 : Poly :=
[
  term ((19058214854956896000 : Rat) / 692956453614176359) [(2, 2), (3, 1), (6, 1), (11, 1), (13, 2), (16, 1)],
  term ((-19058214854956896000 : Rat) / 692956453614176359) [(3, 1), (6, 1), (8, 2), (11, 1), (13, 2), (16, 1)],
  term ((-19058214854956896000 : Rat) / 692956453614176359) [(3, 1), (6, 1), (9, 2), (11, 1), (13, 2), (16, 1)],
  term ((19058214854956896000 : Rat) / 692956453614176359) [(3, 3), (6, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 191 for generator 3. -/
theorem ep_Q2_008_partial_03_0191_valid :
    mulPoly ep_Q2_008_coefficient_03_0191
        ep_Q2_008_generator_03_0100_0199 =
      ep_Q2_008_partial_03_0191 := by
  native_decide

/-- Coefficient term 192 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0192 : Poly :=
[
  term ((1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 192 for generator 3. -/
def ep_Q2_008_partial_03_0192 : Poly :=
[
  term ((1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (3, 1), (6, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((-1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (8, 2), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((-1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (9, 2), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(3, 3), (6, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 192 for generator 3. -/
theorem ep_Q2_008_partial_03_0192_valid :
    mulPoly ep_Q2_008_coefficient_03_0192
        ep_Q2_008_generator_03_0100_0199 =
      ep_Q2_008_partial_03_0192 := by
  native_decide

/-- Coefficient term 193 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0193 : Poly :=
[
  term ((-389161661601209625 : Rat) / 1385912907228352718) [(3, 1), (6, 1), (11, 1), (16, 1)]
]

/-- Partial product 193 for generator 3. -/
def ep_Q2_008_partial_03_0193 : Poly :=
[
  term ((-389161661601209625 : Rat) / 1385912907228352718) [(2, 2), (3, 1), (6, 1), (11, 1), (16, 1)],
  term ((389161661601209625 : Rat) / 1385912907228352718) [(3, 1), (6, 1), (8, 2), (11, 1), (16, 1)],
  term ((389161661601209625 : Rat) / 1385912907228352718) [(3, 1), (6, 1), (9, 2), (11, 1), (16, 1)],
  term ((-389161661601209625 : Rat) / 1385912907228352718) [(3, 3), (6, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 193 for generator 3. -/
theorem ep_Q2_008_partial_03_0193_valid :
    mulPoly ep_Q2_008_coefficient_03_0193
        ep_Q2_008_generator_03_0100_0199 =
      ep_Q2_008_partial_03_0193 := by
  native_decide

/-- Coefficient term 194 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0194 : Poly :=
[
  term ((21935045861953702780443915773903649060600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 194 for generator 3. -/
def ep_Q2_008_partial_03_0194 : Poly :=
[
  term ((21935045861953702780443915773903649060600 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (3, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-21935045861953702780443915773903649060600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (8, 2), (12, 1), (15, 1), (16, 1)],
  term ((-21935045861953702780443915773903649060600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((21935045861953702780443915773903649060600 : Rat) / 84353800925664757687870414129491527348999) [(3, 3), (6, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 194 for generator 3. -/
theorem ep_Q2_008_partial_03_0194_valid :
    mulPoly ep_Q2_008_coefficient_03_0194
        ep_Q2_008_generator_03_0100_0199 =
      ep_Q2_008_partial_03_0194 := by
  native_decide

/-- Coefficient term 195 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0195 : Poly :=
[
  term ((84688486827835123872268804078357939200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 195 for generator 3. -/
def ep_Q2_008_partial_03_0195 : Poly :=
[
  term ((84688486827835123872268804078357939200 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (3, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((-84688486827835123872268804078357939200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (8, 2), (13, 1), (15, 2), (16, 1)],
  term ((-84688486827835123872268804078357939200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((84688486827835123872268804078357939200 : Rat) / 84353800925664757687870414129491527348999) [(3, 3), (6, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 195 for generator 3. -/
theorem ep_Q2_008_partial_03_0195_valid :
    mulPoly ep_Q2_008_coefficient_03_0195
        ep_Q2_008_generator_03_0100_0199 =
      ep_Q2_008_partial_03_0195 := by
  native_decide

/-- Coefficient term 196 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0196 : Poly :=
[
  term ((-16085016827518652955 : Rat) / 1385912907228352718) [(3, 1), (6, 1), (13, 1), (16, 1)]
]

/-- Partial product 196 for generator 3. -/
def ep_Q2_008_partial_03_0196 : Poly :=
[
  term ((-16085016827518652955 : Rat) / 1385912907228352718) [(2, 2), (3, 1), (6, 1), (13, 1), (16, 1)],
  term ((16085016827518652955 : Rat) / 1385912907228352718) [(3, 1), (6, 1), (8, 2), (13, 1), (16, 1)],
  term ((16085016827518652955 : Rat) / 1385912907228352718) [(3, 1), (6, 1), (9, 2), (13, 1), (16, 1)],
  term ((-16085016827518652955 : Rat) / 1385912907228352718) [(3, 3), (6, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 196 for generator 3. -/
theorem ep_Q2_008_partial_03_0196_valid :
    mulPoly ep_Q2_008_coefficient_03_0196
        ep_Q2_008_generator_03_0100_0199 =
      ep_Q2_008_partial_03_0196 := by
  native_decide

/-- Coefficient term 197 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0197 : Poly :=
[
  term ((25124733538268943676526801496260805484800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 197 for generator 3. -/
def ep_Q2_008_partial_03_0197 : Poly :=
[
  term ((25124733538268943676526801496260805484800 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (3, 1), (6, 1), (13, 2), (15, 1), (16, 1)],
  term ((-25124733538268943676526801496260805484800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (8, 2), (13, 2), (15, 1), (16, 1)],
  term ((-25124733538268943676526801496260805484800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (9, 2), (13, 2), (15, 1), (16, 1)],
  term ((25124733538268943676526801496260805484800 : Rat) / 84353800925664757687870414129491527348999) [(3, 3), (6, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 197 for generator 3. -/
theorem ep_Q2_008_partial_03_0197_valid :
    mulPoly ep_Q2_008_coefficient_03_0197
        ep_Q2_008_generator_03_0100_0199 =
      ep_Q2_008_partial_03_0197 := by
  native_decide

/-- Coefficient term 198 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0198 : Poly :=
[
  term ((-36495568596397148339390075890656645214950 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 198 for generator 3. -/
def ep_Q2_008_partial_03_0198 : Poly :=
[
  term ((-36495568596397148339390075890656645214950 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((36495568596397148339390075890656645214950 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (8, 2), (15, 1), (16, 1)],
  term ((36495568596397148339390075890656645214950 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (9, 2), (15, 1), (16, 1)],
  term ((-36495568596397148339390075890656645214950 : Rat) / 84353800925664757687870414129491527348999) [(3, 3), (6, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 198 for generator 3. -/
theorem ep_Q2_008_partial_03_0198_valid :
    mulPoly ep_Q2_008_coefficient_03_0198
        ep_Q2_008_generator_03_0100_0199 =
      ep_Q2_008_partial_03_0198 := by
  native_decide

/-- Coefficient term 199 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0199 : Poly :=
[
  term ((-771775544509452000 : Rat) / 692956453614176359) [(3, 1), (7, 1), (10, 1), (12, 1), (16, 1)]
]

/-- Partial product 199 for generator 3. -/
def ep_Q2_008_partial_03_0199 : Poly :=
[
  term ((-771775544509452000 : Rat) / 692956453614176359) [(2, 2), (3, 1), (7, 1), (10, 1), (12, 1), (16, 1)],
  term ((771775544509452000 : Rat) / 692956453614176359) [(3, 1), (7, 1), (8, 2), (10, 1), (12, 1), (16, 1)],
  term ((771775544509452000 : Rat) / 692956453614176359) [(3, 1), (7, 1), (9, 2), (10, 1), (12, 1), (16, 1)],
  term ((-771775544509452000 : Rat) / 692956453614176359) [(3, 3), (7, 1), (10, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 199 for generator 3. -/
theorem ep_Q2_008_partial_03_0199_valid :
    mulPoly ep_Q2_008_coefficient_03_0199
        ep_Q2_008_generator_03_0100_0199 =
      ep_Q2_008_partial_03_0199 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_008_partials_03_0100_0199 : List Poly :=
[
  ep_Q2_008_partial_03_0100,
  ep_Q2_008_partial_03_0101,
  ep_Q2_008_partial_03_0102,
  ep_Q2_008_partial_03_0103,
  ep_Q2_008_partial_03_0104,
  ep_Q2_008_partial_03_0105,
  ep_Q2_008_partial_03_0106,
  ep_Q2_008_partial_03_0107,
  ep_Q2_008_partial_03_0108,
  ep_Q2_008_partial_03_0109,
  ep_Q2_008_partial_03_0110,
  ep_Q2_008_partial_03_0111,
  ep_Q2_008_partial_03_0112,
  ep_Q2_008_partial_03_0113,
  ep_Q2_008_partial_03_0114,
  ep_Q2_008_partial_03_0115,
  ep_Q2_008_partial_03_0116,
  ep_Q2_008_partial_03_0117,
  ep_Q2_008_partial_03_0118,
  ep_Q2_008_partial_03_0119,
  ep_Q2_008_partial_03_0120,
  ep_Q2_008_partial_03_0121,
  ep_Q2_008_partial_03_0122,
  ep_Q2_008_partial_03_0123,
  ep_Q2_008_partial_03_0124,
  ep_Q2_008_partial_03_0125,
  ep_Q2_008_partial_03_0126,
  ep_Q2_008_partial_03_0127,
  ep_Q2_008_partial_03_0128,
  ep_Q2_008_partial_03_0129,
  ep_Q2_008_partial_03_0130,
  ep_Q2_008_partial_03_0131,
  ep_Q2_008_partial_03_0132,
  ep_Q2_008_partial_03_0133,
  ep_Q2_008_partial_03_0134,
  ep_Q2_008_partial_03_0135,
  ep_Q2_008_partial_03_0136,
  ep_Q2_008_partial_03_0137,
  ep_Q2_008_partial_03_0138,
  ep_Q2_008_partial_03_0139,
  ep_Q2_008_partial_03_0140,
  ep_Q2_008_partial_03_0141,
  ep_Q2_008_partial_03_0142,
  ep_Q2_008_partial_03_0143,
  ep_Q2_008_partial_03_0144,
  ep_Q2_008_partial_03_0145,
  ep_Q2_008_partial_03_0146,
  ep_Q2_008_partial_03_0147,
  ep_Q2_008_partial_03_0148,
  ep_Q2_008_partial_03_0149,
  ep_Q2_008_partial_03_0150,
  ep_Q2_008_partial_03_0151,
  ep_Q2_008_partial_03_0152,
  ep_Q2_008_partial_03_0153,
  ep_Q2_008_partial_03_0154,
  ep_Q2_008_partial_03_0155,
  ep_Q2_008_partial_03_0156,
  ep_Q2_008_partial_03_0157,
  ep_Q2_008_partial_03_0158,
  ep_Q2_008_partial_03_0159,
  ep_Q2_008_partial_03_0160,
  ep_Q2_008_partial_03_0161,
  ep_Q2_008_partial_03_0162,
  ep_Q2_008_partial_03_0163,
  ep_Q2_008_partial_03_0164,
  ep_Q2_008_partial_03_0165,
  ep_Q2_008_partial_03_0166,
  ep_Q2_008_partial_03_0167,
  ep_Q2_008_partial_03_0168,
  ep_Q2_008_partial_03_0169,
  ep_Q2_008_partial_03_0170,
  ep_Q2_008_partial_03_0171,
  ep_Q2_008_partial_03_0172,
  ep_Q2_008_partial_03_0173,
  ep_Q2_008_partial_03_0174,
  ep_Q2_008_partial_03_0175,
  ep_Q2_008_partial_03_0176,
  ep_Q2_008_partial_03_0177,
  ep_Q2_008_partial_03_0178,
  ep_Q2_008_partial_03_0179,
  ep_Q2_008_partial_03_0180,
  ep_Q2_008_partial_03_0181,
  ep_Q2_008_partial_03_0182,
  ep_Q2_008_partial_03_0183,
  ep_Q2_008_partial_03_0184,
  ep_Q2_008_partial_03_0185,
  ep_Q2_008_partial_03_0186,
  ep_Q2_008_partial_03_0187,
  ep_Q2_008_partial_03_0188,
  ep_Q2_008_partial_03_0189,
  ep_Q2_008_partial_03_0190,
  ep_Q2_008_partial_03_0191,
  ep_Q2_008_partial_03_0192,
  ep_Q2_008_partial_03_0193,
  ep_Q2_008_partial_03_0194,
  ep_Q2_008_partial_03_0195,
  ep_Q2_008_partial_03_0196,
  ep_Q2_008_partial_03_0197,
  ep_Q2_008_partial_03_0198,
  ep_Q2_008_partial_03_0199
]

/-- Sum of partial products in this block. -/
def ep_Q2_008_block_03_0100_0199 : Poly :=
[
  term ((-1339889716095078704545649417786671104000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 2), (5, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-64583833551027167844 : Rat) / 692956453614176359) [(1, 1), (2, 2), (5, 1), (12, 1), (13, 2), (16, 1)],
  term ((7400323832412329337 : Rat) / 1385912907228352718) [(1, 1), (2, 2), (5, 1), (12, 1), (16, 1)],
  term ((669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 2), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((15428882026120282983 : Rat) / 5543651628913410872) [(1, 1), (2, 2), (5, 1), (16, 1)],
  term ((78273037166560530452376704018035200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (2, 2), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1094816955793144869 : Rat) / 692956453614176359) [(1, 1), (2, 2), (6, 1), (7, 1), (13, 2), (16, 1)],
  term ((-22120412655187583551838078959565376000 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (2, 2), (6, 1), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((-4624670165699233431 : Rat) / 692956453614176359) [(1, 1), (2, 2), (6, 1), (7, 1), (16, 1)],
  term ((-609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (2, 2), (6, 1), (7, 2), (13, 2), (15, 1), (16, 1)],
  term ((-43336929246501263764396389789139200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (2, 2), (6, 1), (7, 2), (15, 1), (16, 1)],
  term ((298759193453632413851394802614595584000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 2), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((-6945979900585068000 : Rat) / 692956453614176359) [(1, 1), (2, 2), (6, 1), (10, 1), (13, 1), (16, 1)],
  term ((-3335197780739038211317658262354644332800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 2), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-14293661141217672000 : Rat) / 692956453614176359) [(1, 1), (2, 2), (6, 1), (11, 1), (13, 2), (16, 1)],
  term ((-1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (2, 2), (6, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((-3627691909684599375 : Rat) / 1385912907228352718) [(1, 1), (2, 2), (6, 1), (11, 1), (16, 1)],
  term ((21215886736744339523703249485584010466600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 2), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-537446166407415209189398179728040768000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 2), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((15930709909140662460 : Rat) / 692956453614176359) [(1, 1), (2, 2), (6, 1), (13, 1), (16, 1)],
  term ((-11691734803563333206741456756370236774400 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 2), (6, 1), (13, 2), (15, 1), (16, 1)],
  term ((-15925028570517060720602543763476311299975 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 2), (6, 1), (15, 1), (16, 1)],
  term ((-21813405123651604351406039090813201634600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 2), (6, 2), (15, 1), (16, 1)],
  term ((-514517029672968000 : Rat) / 692956453614176359) [(1, 1), (2, 2), (7, 1), (10, 1), (16, 1)],
  term ((-78273037166560530452376704018035200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (2, 2), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1094816955793144869 : Rat) / 692956453614176359) [(1, 1), (2, 2), (7, 1), (12, 1), (13, 2), (16, 1)],
  term ((22120412655187583551838078959565376000 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (2, 2), (7, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((5396445710208685431 : Rat) / 692956453614176359) [(1, 1), (2, 2), (7, 1), (12, 1), (16, 1)],
  term ((-257258514836484000 : Rat) / 692956453614176359) [(1, 1), (2, 2), (7, 1), (16, 1)],
  term ((609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (2, 2), (7, 2), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((43336929246501263764396389789139200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (2, 2), (7, 2), (12, 1), (15, 1), (16, 1)],
  term ((60212255272942500 : Rat) / 692956453614176359) [(1, 1), (2, 2), (8, 1), (11, 1), (12, 1), (16, 1)],
  term ((-334972429023769676136412354446667776000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 2), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((100574316499860000 : Rat) / 692956453614176359) [(1, 1), (2, 2), (8, 1), (11, 1), (16, 1)],
  term ((-264988797391185653150505649995689332800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 2), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((9497299241309471661 : Rat) / 2771825814456705436) [(1, 1), (2, 2), (8, 1), (13, 1), (16, 1)],
  term ((111657476341256558712137451482222592000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 2), (8, 1), (13, 2), (15, 1), (16, 1)],
  term ((-33770396062446760700889152618906251200 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 2), (8, 1), (15, 1), (16, 1)],
  term ((-385887772254726000 : Rat) / 692956453614176359) [(1, 1), (2, 2), (9, 1), (12, 1), (16, 1)],
  term ((385887772254726000 : Rat) / 692956453614176359) [(1, 1), (2, 2), (9, 1), (16, 1)],
  term ((-47640465710460000 : Rat) / 692956453614176359) [(1, 1), (2, 2), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((173887699843179000 : Rat) / 692956453614176359) [(1, 1), (2, 2), (10, 1), (11, 1), (16, 1)],
  term ((8489530989603972000 : Rat) / 692956453614176359) [(1, 1), (2, 2), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-33536628109921223774287078524254174232600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 2), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-16629421762023874983 : Rat) / 2771825814456705436) [(1, 1), (2, 2), (10, 1), (13, 1), (16, 1)],
  term ((-669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 2), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((33898718997323814473955420164791961779800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 2), (10, 1), (15, 1), (16, 1)],
  term ((4005142638786577563590482971247979884800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 2), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((14293661141217672000 : Rat) / 692956453614176359) [(1, 1), (2, 2), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (2, 2), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((18877792635223727733 : Rat) / 2771825814456705436) [(1, 1), (2, 2), (11, 1), (12, 1), (16, 1)],
  term ((-43008753766387500 : Rat) / 692956453614176359) [(1, 1), (2, 2), (11, 1), (12, 2), (16, 1)],
  term ((-837431072559424190341030886116669440000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-12467497743707299983 : Rat) / 2771825814456705436) [(1, 1), (2, 2), (11, 1), (16, 1)],
  term ((537446166407415209189398179728040768000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 2), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-63215296274816980179 : Rat) / 2771825814456705436) [(1, 1), (2, 2), (12, 1), (13, 1), (16, 1)],
  term ((12138364708928359441590006562299127142400 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 2), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-63335310709037556130880962229377422589125 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 2), (12, 1), (15, 1), (16, 1)],
  term ((63892801305851915029291942101720580800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 2), (12, 2), (15, 1), (16, 1)],
  term ((-22017903237735442305 : Rat) / 5543651628913410872) [(1, 1), (2, 2), (13, 1), (16, 1)],
  term ((-614116119876911072916755983152224256000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 2), (13, 2), (15, 1), (16, 1)],
  term ((81046706772867584584036124334012092541000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 2), (15, 1), (16, 1)],
  term ((-1339889716095078704545649417786671104000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 2), (5, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-64583833551027167844 : Rat) / 692956453614176359) [(1, 1), (3, 2), (5, 1), (12, 1), (13, 2), (16, 1)],
  term ((7400323832412329337 : Rat) / 1385912907228352718) [(1, 1), (3, 2), (5, 1), (12, 1), (16, 1)],
  term ((669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 2), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((15428882026120282983 : Rat) / 5543651628913410872) [(1, 1), (3, 2), (5, 1), (16, 1)],
  term ((78273037166560530452376704018035200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (3, 2), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1094816955793144869 : Rat) / 692956453614176359) [(1, 1), (3, 2), (6, 1), (7, 1), (13, 2), (16, 1)],
  term ((-22120412655187583551838078959565376000 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (3, 2), (6, 1), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((-4624670165699233431 : Rat) / 692956453614176359) [(1, 1), (3, 2), (6, 1), (7, 1), (16, 1)],
  term ((-609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (3, 2), (6, 1), (7, 2), (13, 2), (15, 1), (16, 1)],
  term ((-43336929246501263764396389789139200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (3, 2), (6, 1), (7, 2), (15, 1), (16, 1)],
  term ((298759193453632413851394802614595584000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 2), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((-6945979900585068000 : Rat) / 692956453614176359) [(1, 1), (3, 2), (6, 1), (10, 1), (13, 1), (16, 1)],
  term ((-3335197780739038211317658262354644332800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 2), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-14293661141217672000 : Rat) / 692956453614176359) [(1, 1), (3, 2), (6, 1), (11, 1), (13, 2), (16, 1)],
  term ((-1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (3, 2), (6, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((-3627691909684599375 : Rat) / 1385912907228352718) [(1, 1), (3, 2), (6, 1), (11, 1), (16, 1)],
  term ((21215886736744339523703249485584010466600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 2), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-537446166407415209189398179728040768000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 2), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((15930709909140662460 : Rat) / 692956453614176359) [(1, 1), (3, 2), (6, 1), (13, 1), (16, 1)],
  term ((-11691734803563333206741456756370236774400 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 2), (6, 1), (13, 2), (15, 1), (16, 1)],
  term ((-15925028570517060720602543763476311299975 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 2), (6, 1), (15, 1), (16, 1)],
  term ((-21813405123651604351406039090813201634600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 2), (6, 2), (15, 1), (16, 1)],
  term ((-514517029672968000 : Rat) / 692956453614176359) [(1, 1), (3, 2), (7, 1), (10, 1), (16, 1)],
  term ((-78273037166560530452376704018035200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (3, 2), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1094816955793144869 : Rat) / 692956453614176359) [(1, 1), (3, 2), (7, 1), (12, 1), (13, 2), (16, 1)],
  term ((22120412655187583551838078959565376000 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (3, 2), (7, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((5396445710208685431 : Rat) / 692956453614176359) [(1, 1), (3, 2), (7, 1), (12, 1), (16, 1)],
  term ((-257258514836484000 : Rat) / 692956453614176359) [(1, 1), (3, 2), (7, 1), (16, 1)],
  term ((609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (3, 2), (7, 2), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((43336929246501263764396389789139200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (3, 2), (7, 2), (12, 1), (15, 1), (16, 1)],
  term ((60212255272942500 : Rat) / 692956453614176359) [(1, 1), (3, 2), (8, 1), (11, 1), (12, 1), (16, 1)],
  term ((-334972429023769676136412354446667776000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 2), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((100574316499860000 : Rat) / 692956453614176359) [(1, 1), (3, 2), (8, 1), (11, 1), (16, 1)],
  term ((-264988797391185653150505649995689332800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 2), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((9497299241309471661 : Rat) / 2771825814456705436) [(1, 1), (3, 2), (8, 1), (13, 1), (16, 1)],
  term ((111657476341256558712137451482222592000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 2), (8, 1), (13, 2), (15, 1), (16, 1)],
  term ((-33770396062446760700889152618906251200 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 2), (8, 1), (15, 1), (16, 1)],
  term ((-385887772254726000 : Rat) / 692956453614176359) [(1, 1), (3, 2), (9, 1), (12, 1), (16, 1)],
  term ((385887772254726000 : Rat) / 692956453614176359) [(1, 1), (3, 2), (9, 1), (16, 1)],
  term ((-47640465710460000 : Rat) / 692956453614176359) [(1, 1), (3, 2), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((173887699843179000 : Rat) / 692956453614176359) [(1, 1), (3, 2), (10, 1), (11, 1), (16, 1)],
  term ((8489530989603972000 : Rat) / 692956453614176359) [(1, 1), (3, 2), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-33536628109921223774287078524254174232600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 2), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-16629421762023874983 : Rat) / 2771825814456705436) [(1, 1), (3, 2), (10, 1), (13, 1), (16, 1)],
  term ((-669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 2), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((33898718997323814473955420164791961779800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 2), (10, 1), (15, 1), (16, 1)],
  term ((4005142638786577563590482971247979884800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 2), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((14293661141217672000 : Rat) / 692956453614176359) [(1, 1), (3, 2), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (3, 2), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((18877792635223727733 : Rat) / 2771825814456705436) [(1, 1), (3, 2), (11, 1), (12, 1), (16, 1)],
  term ((-43008753766387500 : Rat) / 692956453614176359) [(1, 1), (3, 2), (11, 1), (12, 2), (16, 1)],
  term ((-837431072559424190341030886116669440000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-12467497743707299983 : Rat) / 2771825814456705436) [(1, 1), (3, 2), (11, 1), (16, 1)],
  term ((537446166407415209189398179728040768000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 2), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-63215296274816980179 : Rat) / 2771825814456705436) [(1, 1), (3, 2), (12, 1), (13, 1), (16, 1)],
  term ((12138364708928359441590006562299127142400 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 2), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-63335310709037556130880962229377422589125 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 2), (12, 1), (15, 1), (16, 1)],
  term ((63892801305851915029291942101720580800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 2), (12, 2), (15, 1), (16, 1)],
  term ((-22017903237735442305 : Rat) / 5543651628913410872) [(1, 1), (3, 2), (13, 1), (16, 1)],
  term ((-614116119876911072916755983152224256000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 2), (13, 2), (15, 1), (16, 1)],
  term ((81046706772867584584036124334012092541000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 2), (15, 1), (16, 1)],
  term ((1339889716095078704545649417786671104000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (5, 1), (8, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((64583833551027167844 : Rat) / 692956453614176359) [(1, 1), (5, 1), (8, 2), (12, 1), (13, 2), (16, 1)],
  term ((-7400323832412329337 : Rat) / 1385912907228352718) [(1, 1), (5, 1), (8, 2), (12, 1), (16, 1)],
  term ((-669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (5, 1), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((-15428882026120282983 : Rat) / 5543651628913410872) [(1, 1), (5, 1), (8, 2), (16, 1)],
  term ((1339889716095078704545649417786671104000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (5, 1), (9, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((64583833551027167844 : Rat) / 692956453614176359) [(1, 1), (5, 1), (9, 2), (12, 1), (13, 2), (16, 1)],
  term ((-7400323832412329337 : Rat) / 1385912907228352718) [(1, 1), (5, 1), (9, 2), (12, 1), (16, 1)],
  term ((-669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (5, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-15428882026120282983 : Rat) / 5543651628913410872) [(1, 1), (5, 1), (9, 2), (16, 1)],
  term ((-78273037166560530452376704018035200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (7, 1), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((1094816955793144869 : Rat) / 692956453614176359) [(1, 1), (6, 1), (7, 1), (8, 2), (13, 2), (16, 1)],
  term ((22120412655187583551838078959565376000 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (7, 1), (8, 2), (13, 3), (15, 1), (16, 1)],
  term ((4624670165699233431 : Rat) / 692956453614176359) [(1, 1), (6, 1), (7, 1), (8, 2), (16, 1)],
  term ((-78273037166560530452376704018035200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (7, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((1094816955793144869 : Rat) / 692956453614176359) [(1, 1), (6, 1), (7, 1), (9, 2), (13, 2), (16, 1)],
  term ((22120412655187583551838078959565376000 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (7, 1), (9, 2), (13, 3), (15, 1), (16, 1)],
  term ((4624670165699233431 : Rat) / 692956453614176359) [(1, 1), (6, 1), (7, 1), (9, 2), (16, 1)],
  term ((609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (7, 2), (8, 2), (13, 2), (15, 1), (16, 1)],
  term ((43336929246501263764396389789139200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (7, 2), (8, 2), (15, 1), (16, 1)],
  term ((609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (7, 2), (9, 2), (13, 2), (15, 1), (16, 1)],
  term ((43336929246501263764396389789139200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (7, 2), (9, 2), (15, 1), (16, 1)],
  term ((-298759193453632413851394802614595584000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((6945979900585068000 : Rat) / 692956453614176359) [(1, 1), (6, 1), (8, 2), (10, 1), (13, 1), (16, 1)],
  term ((3335197780739038211317658262354644332800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (8, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((14293661141217672000 : Rat) / 692956453614176359) [(1, 1), (6, 1), (8, 2), (11, 1), (13, 2), (16, 1)],
  term ((1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (8, 2), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((3627691909684599375 : Rat) / 1385912907228352718) [(1, 1), (6, 1), (8, 2), (11, 1), (16, 1)],
  term ((-21215886736744339523703249485584010466600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (8, 2), (12, 1), (15, 1), (16, 1)],
  term ((537446166407415209189398179728040768000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (8, 2), (13, 1), (15, 2), (16, 1)],
  term ((-15930709909140662460 : Rat) / 692956453614176359) [(1, 1), (6, 1), (8, 2), (13, 1), (16, 1)],
  term ((11691734803563333206741456756370236774400 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (8, 2), (13, 2), (15, 1), (16, 1)],
  term ((15925028570517060720602543763476311299975 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (8, 2), (15, 1), (16, 1)],
  term ((-298759193453632413851394802614595584000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (8, 3), (15, 1), (16, 1)],
  term ((6945979900585068000 : Rat) / 692956453614176359) [(1, 1), (6, 1), (9, 2), (10, 1), (13, 1), (16, 1)],
  term ((3335197780739038211317658262354644332800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((14293661141217672000 : Rat) / 692956453614176359) [(1, 1), (6, 1), (9, 2), (11, 1), (13, 2), (16, 1)],
  term ((1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (9, 2), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((3627691909684599375 : Rat) / 1385912907228352718) [(1, 1), (6, 1), (9, 2), (11, 1), (16, 1)],
  term ((-21215886736744339523703249485584010466600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((537446166407415209189398179728040768000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((-15930709909140662460 : Rat) / 692956453614176359) [(1, 1), (6, 1), (9, 2), (13, 1), (16, 1)],
  term ((11691734803563333206741456756370236774400 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (9, 2), (13, 2), (15, 1), (16, 1)],
  term ((15925028570517060720602543763476311299975 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (9, 2), (15, 1), (16, 1)],
  term ((21813405123651604351406039090813201634600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 2), (8, 2), (15, 1), (16, 1)],
  term ((21813405123651604351406039090813201634600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 2), (9, 2), (15, 1), (16, 1)],
  term ((514517029672968000 : Rat) / 692956453614176359) [(1, 1), (7, 1), (8, 2), (10, 1), (16, 1)],
  term ((78273037166560530452376704018035200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (7, 1), (8, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1094816955793144869 : Rat) / 692956453614176359) [(1, 1), (7, 1), (8, 2), (12, 1), (13, 2), (16, 1)],
  term ((-22120412655187583551838078959565376000 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (7, 1), (8, 2), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-5396445710208685431 : Rat) / 692956453614176359) [(1, 1), (7, 1), (8, 2), (12, 1), (16, 1)],
  term ((257258514836484000 : Rat) / 692956453614176359) [(1, 1), (7, 1), (8, 2), (16, 1)],
  term ((514517029672968000 : Rat) / 692956453614176359) [(1, 1), (7, 1), (9, 2), (10, 1), (16, 1)],
  term ((78273037166560530452376704018035200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (7, 1), (9, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1094816955793144869 : Rat) / 692956453614176359) [(1, 1), (7, 1), (9, 2), (12, 1), (13, 2), (16, 1)],
  term ((-22120412655187583551838078959565376000 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (7, 1), (9, 2), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-5396445710208685431 : Rat) / 692956453614176359) [(1, 1), (7, 1), (9, 2), (12, 1), (16, 1)],
  term ((257258514836484000 : Rat) / 692956453614176359) [(1, 1), (7, 1), (9, 2), (16, 1)],
  term ((-609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (7, 2), (8, 2), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-43336929246501263764396389789139200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (7, 2), (8, 2), (12, 1), (15, 1), (16, 1)],
  term ((-609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (7, 2), (9, 2), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-43336929246501263764396389789139200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (7, 2), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((-60212255272942500 : Rat) / 692956453614176359) [(1, 1), (8, 1), (9, 2), (11, 1), (12, 1), (16, 1)],
  term ((334972429023769676136412354446667776000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (8, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-100574316499860000 : Rat) / 692956453614176359) [(1, 1), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((264988797391185653150505649995689332800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (8, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((-9497299241309471661 : Rat) / 2771825814456705436) [(1, 1), (8, 1), (9, 2), (13, 1), (16, 1)],
  term ((-111657476341256558712137451482222592000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (8, 1), (9, 2), (13, 2), (15, 1), (16, 1)],
  term ((33770396062446760700889152618906251200 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((385887772254726000 : Rat) / 692956453614176359) [(1, 1), (8, 2), (9, 1), (12, 1), (16, 1)],
  term ((-385887772254726000 : Rat) / 692956453614176359) [(1, 1), (8, 2), (9, 1), (16, 1)],
  term ((47640465710460000 : Rat) / 692956453614176359) [(1, 1), (8, 2), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((-173887699843179000 : Rat) / 692956453614176359) [(1, 1), (8, 2), (10, 1), (11, 1), (16, 1)],
  term ((-8489530989603972000 : Rat) / 692956453614176359) [(1, 1), (8, 2), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((33536628109921223774287078524254174232600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (8, 2), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((16629421762023874983 : Rat) / 2771825814456705436) [(1, 1), (8, 2), (10, 1), (13, 1), (16, 1)],
  term ((669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (8, 2), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-33898718997323814473955420164791961779800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (8, 2), (10, 1), (15, 1), (16, 1)],
  term ((-4005142638786577563590482971247979884800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (8, 2), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-14293661141217672000 : Rat) / 692956453614176359) [(1, 1), (8, 2), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((-1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (8, 2), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-18877792635223727733 : Rat) / 2771825814456705436) [(1, 1), (8, 2), (11, 1), (12, 1), (16, 1)],
  term ((43008753766387500 : Rat) / 692956453614176359) [(1, 1), (8, 2), (11, 1), (12, 2), (16, 1)],
  term ((837431072559424190341030886116669440000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (8, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((12467497743707299983 : Rat) / 2771825814456705436) [(1, 1), (8, 2), (11, 1), (16, 1)],
  term ((-537446166407415209189398179728040768000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (8, 2), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((63215296274816980179 : Rat) / 2771825814456705436) [(1, 1), (8, 2), (12, 1), (13, 1), (16, 1)],
  term ((-12138364708928359441590006562299127142400 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (8, 2), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((63335310709037556130880962229377422589125 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (8, 2), (12, 1), (15, 1), (16, 1)],
  term ((-63892801305851915029291942101720580800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (8, 2), (12, 2), (15, 1), (16, 1)],
  term ((22017903237735442305 : Rat) / 5543651628913410872) [(1, 1), (8, 2), (13, 1), (16, 1)],
  term ((614116119876911072916755983152224256000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (8, 2), (13, 2), (15, 1), (16, 1)],
  term ((-81046706772867584584036124334012092541000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (8, 2), (15, 1), (16, 1)],
  term ((-60212255272942500 : Rat) / 692956453614176359) [(1, 1), (8, 3), (11, 1), (12, 1), (16, 1)],
  term ((334972429023769676136412354446667776000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (8, 3), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-100574316499860000 : Rat) / 692956453614176359) [(1, 1), (8, 3), (11, 1), (16, 1)],
  term ((264988797391185653150505649995689332800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (8, 3), (12, 1), (15, 1), (16, 1)],
  term ((-9497299241309471661 : Rat) / 2771825814456705436) [(1, 1), (8, 3), (13, 1), (16, 1)],
  term ((-111657476341256558712137451482222592000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (8, 3), (13, 2), (15, 1), (16, 1)],
  term ((33770396062446760700889152618906251200 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (8, 3), (15, 1), (16, 1)],
  term ((47640465710460000 : Rat) / 692956453614176359) [(1, 1), (9, 2), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((-173887699843179000 : Rat) / 692956453614176359) [(1, 1), (9, 2), (10, 1), (11, 1), (16, 1)],
  term ((-8489530989603972000 : Rat) / 692956453614176359) [(1, 1), (9, 2), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((33536628109921223774287078524254174232600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (9, 2), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((16629421762023874983 : Rat) / 2771825814456705436) [(1, 1), (9, 2), (10, 1), (13, 1), (16, 1)],
  term ((669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (9, 2), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-33898718997323814473955420164791961779800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((-4005142638786577563590482971247979884800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (9, 2), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-14293661141217672000 : Rat) / 692956453614176359) [(1, 1), (9, 2), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((-1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (9, 2), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-18877792635223727733 : Rat) / 2771825814456705436) [(1, 1), (9, 2), (11, 1), (12, 1), (16, 1)],
  term ((43008753766387500 : Rat) / 692956453614176359) [(1, 1), (9, 2), (11, 1), (12, 2), (16, 1)],
  term ((837431072559424190341030886116669440000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((12467497743707299983 : Rat) / 2771825814456705436) [(1, 1), (9, 2), (11, 1), (16, 1)],
  term ((-537446166407415209189398179728040768000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (9, 2), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((63215296274816980179 : Rat) / 2771825814456705436) [(1, 1), (9, 2), (12, 1), (13, 1), (16, 1)],
  term ((-12138364708928359441590006562299127142400 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (9, 2), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((63335310709037556130880962229377422589125 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((-63892801305851915029291942101720580800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (9, 2), (12, 2), (15, 1), (16, 1)],
  term ((22017903237735442305 : Rat) / 5543651628913410872) [(1, 1), (9, 2), (13, 1), (16, 1)],
  term ((614116119876911072916755983152224256000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (9, 2), (13, 2), (15, 1), (16, 1)],
  term ((-81046706772867584584036124334012092541000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (9, 2), (15, 1), (16, 1)],
  term ((385887772254726000 : Rat) / 692956453614176359) [(1, 1), (9, 3), (12, 1), (16, 1)],
  term ((-385887772254726000 : Rat) / 692956453614176359) [(1, 1), (9, 3), (16, 1)],
  term ((-669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 2), (2, 2), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-10455217405948258983 : Rat) / 2771825814456705436) [(1, 2), (2, 2), (4, 1), (16, 1)],
  term ((669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 2), (2, 2), (13, 1), (15, 1), (16, 1)],
  term ((10455217405948258983 : Rat) / 2771825814456705436) [(1, 2), (2, 2), (16, 1)],
  term ((-669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 2), (3, 2), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-10455217405948258983 : Rat) / 2771825814456705436) [(1, 2), (3, 2), (4, 1), (16, 1)],
  term ((669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 2), (3, 2), (13, 1), (15, 1), (16, 1)],
  term ((10455217405948258983 : Rat) / 2771825814456705436) [(1, 2), (3, 2), (16, 1)],
  term ((669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 2), (4, 1), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((10455217405948258983 : Rat) / 2771825814456705436) [(1, 2), (4, 1), (8, 2), (16, 1)],
  term ((669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 2), (4, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((10455217405948258983 : Rat) / 2771825814456705436) [(1, 2), (4, 1), (9, 2), (16, 1)],
  term ((-669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 2), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((-10455217405948258983 : Rat) / 2771825814456705436) [(1, 2), (8, 2), (16, 1)],
  term ((-669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 2), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-10455217405948258983 : Rat) / 2771825814456705436) [(1, 2), (9, 2), (16, 1)],
  term ((52208389534807899966554525138047200 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (3, 1), (4, 1), (6, 1), (15, 1), (16, 1)],
  term ((215817414009571000480626496701028800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (3, 1), (4, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((385887772254726000 : Rat) / 692956453614176359) [(2, 2), (3, 1), (4, 1), (10, 1), (13, 1), (16, 1)],
  term ((1804205182183737225 : Rat) / 1385912907228352718) [(2, 2), (3, 1), (4, 1), (13, 1), (16, 1)],
  term ((-52208389534807899966554525138047200 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((-516327403063627358773572644048793600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (3, 1), (5, 1), (6, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((3796525022526671755688034147417600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (3, 1), (5, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-86111778068036223792 : Rat) / 692956453614176359) [(2, 2), (3, 1), (5, 1), (6, 1), (13, 2), (16, 1)],
  term ((30955433660627124993 : Rat) / 2771825814456705436) [(2, 2), (3, 1), (5, 1), (6, 1), (16, 1)],
  term ((-215817414009571000480626496701028800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (3, 1), (5, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((516327403063627358773572644048793600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (3, 1), (5, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((212020888987044328724938462553611200 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (3, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-385887772254726000 : Rat) / 692956453614176359) [(2, 2), (3, 1), (5, 1), (10, 1), (12, 1), (16, 1)],
  term ((385887772254726000 : Rat) / 692956453614176359) [(2, 2), (3, 1), (5, 1), (10, 1), (16, 1)],
  term ((-1804205182183737225 : Rat) / 1385912907228352718) [(2, 2), (3, 1), (5, 1), (12, 1), (16, 1)],
  term ((86111778068036223792 : Rat) / 692956453614176359) [(2, 2), (3, 1), (5, 1), (13, 2), (16, 1)],
  term ((-27347023296259650543 : Rat) / 2771825814456705436) [(2, 2), (3, 1), (5, 1), (16, 1)],
  term ((531455164116744865261071891224851200 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (3, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((1459755941057526492 : Rat) / 692956453614176359) [(2, 2), (3, 1), (6, 1), (7, 1), (13, 2), (16, 1)],
  term ((29493883540250111402450771946087168000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (3, 1), (6, 1), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((812294800564430025004231306094284800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (3, 1), (6, 1), (7, 2), (13, 2), (15, 1), (16, 1)],
  term ((39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (3, 1), (6, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-70324786932212700 : Rat) / 692956453614176359) [(2, 2), (3, 1), (6, 1), (9, 1), (16, 1)],
  term ((7717755445094520000 : Rat) / 692956453614176359) [(2, 2), (3, 1), (6, 1), (10, 1), (13, 1), (16, 1)],
  term ((2343133172956448821031328838872771360000 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (3, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((19058214854956896000 : Rat) / 692956453614176359) [(2, 2), (3, 1), (6, 1), (11, 1), (13, 2), (16, 1)],
  term ((1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (3, 1), (6, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((-389161661601209625 : Rat) / 1385912907228352718) [(2, 2), (3, 1), (6, 1), (11, 1), (16, 1)],
  term ((21935045861953702780443915773903649060600 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (3, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((84688486827835123872268804078357939200 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (3, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((-16085016827518652955 : Rat) / 1385912907228352718) [(2, 2), (3, 1), (6, 1), (13, 1), (16, 1)],
  term ((25124733538268943676526801496260805484800 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (3, 1), (6, 1), (13, 2), (15, 1), (16, 1)],
  term ((-36495568596397148339390075890656645214950 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((-771775544509452000 : Rat) / 692956453614176359) [(2, 2), (3, 1), (7, 1), (10, 1), (12, 1), (16, 1)],
  term ((-52208389534807899966554525138047200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (6, 1), (8, 2), (15, 1), (16, 1)],
  term ((-52208389534807899966554525138047200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (6, 1), (9, 2), (15, 1), (16, 1)],
  term ((-215817414009571000480626496701028800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 1), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((-215817414009571000480626496701028800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-385887772254726000 : Rat) / 692956453614176359) [(3, 1), (4, 1), (8, 2), (10, 1), (13, 1), (16, 1)],
  term ((-1804205182183737225 : Rat) / 1385912907228352718) [(3, 1), (4, 1), (8, 2), (13, 1), (16, 1)],
  term ((52208389534807899966554525138047200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (8, 2), (15, 1), (16, 1)],
  term ((-385887772254726000 : Rat) / 692956453614176359) [(3, 1), (4, 1), (9, 2), (10, 1), (13, 1), (16, 1)],
  term ((-1804205182183737225 : Rat) / 1385912907228352718) [(3, 1), (4, 1), (9, 2), (13, 1), (16, 1)],
  term ((52208389534807899966554525138047200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (9, 2), (15, 1), (16, 1)],
  term ((516327403063627358773572644048793600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 1), (8, 2), (13, 2), (15, 1), (16, 1)],
  term ((-3796525022526671755688034147417600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 1), (8, 2), (15, 1), (16, 1)],
  term ((516327403063627358773572644048793600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 1), (9, 2), (13, 2), (15, 1), (16, 1)],
  term ((-3796525022526671755688034147417600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((86111778068036223792 : Rat) / 692956453614176359) [(3, 1), (5, 1), (6, 1), (8, 2), (13, 2), (16, 1)],
  term ((-30955433660627124993 : Rat) / 2771825814456705436) [(3, 1), (5, 1), (6, 1), (8, 2), (16, 1)],
  term ((86111778068036223792 : Rat) / 692956453614176359) [(3, 1), (5, 1), (6, 1), (9, 2), (13, 2), (16, 1)],
  term ((-30955433660627124993 : Rat) / 2771825814456705436) [(3, 1), (5, 1), (6, 1), (9, 2), (16, 1)],
  term ((215817414009571000480626496701028800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (8, 2), (12, 1), (15, 1), (16, 1)],
  term ((-516327403063627358773572644048793600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (8, 2), (13, 2), (15, 1), (16, 1)],
  term ((-212020888987044328724938462553611200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (8, 2), (15, 1), (16, 1)],
  term ((215817414009571000480626496701028800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((-516327403063627358773572644048793600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (9, 2), (13, 2), (15, 1), (16, 1)],
  term ((-212020888987044328724938462553611200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((385887772254726000 : Rat) / 692956453614176359) [(3, 1), (5, 1), (8, 2), (10, 1), (12, 1), (16, 1)],
  term ((-385887772254726000 : Rat) / 692956453614176359) [(3, 1), (5, 1), (8, 2), (10, 1), (16, 1)],
  term ((1804205182183737225 : Rat) / 1385912907228352718) [(3, 1), (5, 1), (8, 2), (12, 1), (16, 1)],
  term ((-86111778068036223792 : Rat) / 692956453614176359) [(3, 1), (5, 1), (8, 2), (13, 2), (16, 1)],
  term ((27347023296259650543 : Rat) / 2771825814456705436) [(3, 1), (5, 1), (8, 2), (16, 1)],
  term ((385887772254726000 : Rat) / 692956453614176359) [(3, 1), (5, 1), (9, 2), (10, 1), (12, 1), (16, 1)],
  term ((-385887772254726000 : Rat) / 692956453614176359) [(3, 1), (5, 1), (9, 2), (10, 1), (16, 1)],
  term ((1804205182183737225 : Rat) / 1385912907228352718) [(3, 1), (5, 1), (9, 2), (12, 1), (16, 1)],
  term ((-86111778068036223792 : Rat) / 692956453614176359) [(3, 1), (5, 1), (9, 2), (13, 2), (16, 1)],
  term ((27347023296259650543 : Rat) / 2771825814456705436) [(3, 1), (5, 1), (9, 2), (16, 1)],
  term ((-531455164116744865261071891224851200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1459755941057526492 : Rat) / 692956453614176359) [(3, 1), (6, 1), (7, 1), (8, 2), (13, 2), (16, 1)],
  term ((-29493883540250111402450771946087168000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (8, 2), (13, 3), (15, 1), (16, 1)],
  term ((-531455164116744865261071891224851200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1459755941057526492 : Rat) / 692956453614176359) [(3, 1), (6, 1), (7, 1), (9, 2), (13, 2), (16, 1)],
  term ((-29493883540250111402450771946087168000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (9, 2), (13, 3), (15, 1), (16, 1)],
  term ((-812294800564430025004231306094284800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 2), (8, 2), (13, 2), (15, 1), (16, 1)],
  term ((-812294800564430025004231306094284800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 2), (9, 2), (13, 2), (15, 1), (16, 1)],
  term ((-39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (8, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((70324786932212700 : Rat) / 692956453614176359) [(3, 1), (6, 1), (8, 2), (9, 1), (16, 1)],
  term ((-7717755445094520000 : Rat) / 692956453614176359) [(3, 1), (6, 1), (8, 2), (10, 1), (13, 1), (16, 1)],
  term ((-2343133172956448821031328838872771360000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (8, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-19058214854956896000 : Rat) / 692956453614176359) [(3, 1), (6, 1), (8, 2), (11, 1), (13, 2), (16, 1)],
  term ((-1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (8, 2), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((389161661601209625 : Rat) / 1385912907228352718) [(3, 1), (6, 1), (8, 2), (11, 1), (16, 1)],
  term ((-21935045861953702780443915773903649060600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (8, 2), (12, 1), (15, 1), (16, 1)],
  term ((-84688486827835123872268804078357939200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (8, 2), (13, 1), (15, 2), (16, 1)],
  term ((16085016827518652955 : Rat) / 1385912907228352718) [(3, 1), (6, 1), (8, 2), (13, 1), (16, 1)],
  term ((-25124733538268943676526801496260805484800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (8, 2), (13, 2), (15, 1), (16, 1)],
  term ((36495568596397148339390075890656645214950 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (8, 2), (15, 1), (16, 1)],
  term ((-7717755445094520000 : Rat) / 692956453614176359) [(3, 1), (6, 1), (9, 2), (10, 1), (13, 1), (16, 1)],
  term ((-2343133172956448821031328838872771360000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-19058214854956896000 : Rat) / 692956453614176359) [(3, 1), (6, 1), (9, 2), (11, 1), (13, 2), (16, 1)],
  term ((-1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (9, 2), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((389161661601209625 : Rat) / 1385912907228352718) [(3, 1), (6, 1), (9, 2), (11, 1), (16, 1)],
  term ((-21935045861953702780443915773903649060600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((-84688486827835123872268804078357939200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((16085016827518652955 : Rat) / 1385912907228352718) [(3, 1), (6, 1), (9, 2), (13, 1), (16, 1)],
  term ((-25124733538268943676526801496260805484800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (9, 2), (13, 2), (15, 1), (16, 1)],
  term ((36495568596397148339390075890656645214950 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (9, 2), (15, 1), (16, 1)],
  term ((-39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (9, 3), (13, 1), (15, 1), (16, 1)],
  term ((70324786932212700 : Rat) / 692956453614176359) [(3, 1), (6, 1), (9, 3), (16, 1)],
  term ((771775544509452000 : Rat) / 692956453614176359) [(3, 1), (7, 1), (8, 2), (10, 1), (12, 1), (16, 1)],
  term ((771775544509452000 : Rat) / 692956453614176359) [(3, 1), (7, 1), (9, 2), (10, 1), (12, 1), (16, 1)],
  term ((52208389534807899966554525138047200 : Rat) / 2908751756057405437512772901016949218931) [(3, 3), (4, 1), (6, 1), (15, 1), (16, 1)],
  term ((215817414009571000480626496701028800 : Rat) / 2908751756057405437512772901016949218931) [(3, 3), (4, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((385887772254726000 : Rat) / 692956453614176359) [(3, 3), (4, 1), (10, 1), (13, 1), (16, 1)],
  term ((1804205182183737225 : Rat) / 1385912907228352718) [(3, 3), (4, 1), (13, 1), (16, 1)],
  term ((-52208389534807899966554525138047200 : Rat) / 2908751756057405437512772901016949218931) [(3, 3), (4, 1), (15, 1), (16, 1)],
  term ((-516327403063627358773572644048793600 : Rat) / 2908751756057405437512772901016949218931) [(3, 3), (5, 1), (6, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((3796525022526671755688034147417600 : Rat) / 2908751756057405437512772901016949218931) [(3, 3), (5, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-86111778068036223792 : Rat) / 692956453614176359) [(3, 3), (5, 1), (6, 1), (13, 2), (16, 1)],
  term ((30955433660627124993 : Rat) / 2771825814456705436) [(3, 3), (5, 1), (6, 1), (16, 1)],
  term ((-215817414009571000480626496701028800 : Rat) / 2908751756057405437512772901016949218931) [(3, 3), (5, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((516327403063627358773572644048793600 : Rat) / 2908751756057405437512772901016949218931) [(3, 3), (5, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((212020888987044328724938462553611200 : Rat) / 2908751756057405437512772901016949218931) [(3, 3), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-385887772254726000 : Rat) / 692956453614176359) [(3, 3), (5, 1), (10, 1), (12, 1), (16, 1)],
  term ((385887772254726000 : Rat) / 692956453614176359) [(3, 3), (5, 1), (10, 1), (16, 1)],
  term ((-1804205182183737225 : Rat) / 1385912907228352718) [(3, 3), (5, 1), (12, 1), (16, 1)],
  term ((86111778068036223792 : Rat) / 692956453614176359) [(3, 3), (5, 1), (13, 2), (16, 1)],
  term ((-27347023296259650543 : Rat) / 2771825814456705436) [(3, 3), (5, 1), (16, 1)],
  term ((531455164116744865261071891224851200 : Rat) / 2908751756057405437512772901016949218931) [(3, 3), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((1459755941057526492 : Rat) / 692956453614176359) [(3, 3), (6, 1), (7, 1), (13, 2), (16, 1)],
  term ((29493883540250111402450771946087168000 : Rat) / 2908751756057405437512772901016949218931) [(3, 3), (6, 1), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((812294800564430025004231306094284800 : Rat) / 2908751756057405437512772901016949218931) [(3, 3), (6, 1), (7, 2), (13, 2), (15, 1), (16, 1)],
  term ((39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(3, 3), (6, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-70324786932212700 : Rat) / 692956453614176359) [(3, 3), (6, 1), (9, 1), (16, 1)],
  term ((7717755445094520000 : Rat) / 692956453614176359) [(3, 3), (6, 1), (10, 1), (13, 1), (16, 1)],
  term ((2343133172956448821031328838872771360000 : Rat) / 84353800925664757687870414129491527348999) [(3, 3), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((19058214854956896000 : Rat) / 692956453614176359) [(3, 3), (6, 1), (11, 1), (13, 2), (16, 1)],
  term ((1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(3, 3), (6, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((-389161661601209625 : Rat) / 1385912907228352718) [(3, 3), (6, 1), (11, 1), (16, 1)],
  term ((21935045861953702780443915773903649060600 : Rat) / 84353800925664757687870414129491527348999) [(3, 3), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((84688486827835123872268804078357939200 : Rat) / 84353800925664757687870414129491527348999) [(3, 3), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((-16085016827518652955 : Rat) / 1385912907228352718) [(3, 3), (6, 1), (13, 1), (16, 1)],
  term ((25124733538268943676526801496260805484800 : Rat) / 84353800925664757687870414129491527348999) [(3, 3), (6, 1), (13, 2), (15, 1), (16, 1)],
  term ((-36495568596397148339390075890656645214950 : Rat) / 84353800925664757687870414129491527348999) [(3, 3), (6, 1), (15, 1), (16, 1)],
  term ((-771775544509452000 : Rat) / 692956453614176359) [(3, 3), (7, 1), (10, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 3, terms 100 through 199. -/
theorem ep_Q2_008_block_03_0100_0199_valid :
    checkProductSumEq ep_Q2_008_partials_03_0100_0199
      ep_Q2_008_block_03_0100_0199 = true := by
  native_decide

end EpQ2008TermShards

end Patterns

end EndpointCertificate

end Problem97
