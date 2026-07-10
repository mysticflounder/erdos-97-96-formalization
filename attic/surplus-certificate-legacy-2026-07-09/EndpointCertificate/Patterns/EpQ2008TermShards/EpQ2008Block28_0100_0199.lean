/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_008, term block 28:100-199

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_008`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2008TermShards

/-- Generator polynomial 28 for endpoint certificate `ep_Q2_008`. -/
def ep_Q2_008_generator_28_0100_0199 : Poly :=
[
  term (2 : Rat) [(2, 1), (14, 1)],
  term (-1 : Rat) [(2, 2)],
  term (2 : Rat) [(3, 1), (15, 1)],
  term (-1 : Rat) [(3, 2)]
]

/-- Coefficient term 100 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0100 : Poly :=
[
  term ((43660037759056725190412392695302400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (5, 1), (7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 100 for generator 28. -/
def ep_Q2_008_partial_28_0100 : Poly :=
[
  term ((87320075518113450380824785390604800 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (2, 1), (5, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-43660037759056725190412392695302400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (2, 2), (5, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((87320075518113450380824785390604800 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (3, 1), (5, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((-43660037759056725190412392695302400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (3, 2), (5, 1), (7, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 28. -/
theorem ep_Q2_008_partial_28_0100_valid :
    mulPoly ep_Q2_008_coefficient_28_0100
        ep_Q2_008_generator_28_0100_0199 =
      ep_Q2_008_partial_28_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0101 : Poly :=
[
  term ((-12113105612672266983 : Rat) / 2771825814456705436) [(1, 1), (5, 1), (8, 1), (16, 1)]
]

/-- Partial product 101 for generator 28. -/
def ep_Q2_008_partial_28_0101 : Poly :=
[
  term ((-12113105612672266983 : Rat) / 1385912907228352718) [(1, 1), (2, 1), (5, 1), (8, 1), (14, 1), (16, 1)],
  term ((12113105612672266983 : Rat) / 2771825814456705436) [(1, 1), (2, 2), (5, 1), (8, 1), (16, 1)],
  term ((-12113105612672266983 : Rat) / 1385912907228352718) [(1, 1), (3, 1), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((12113105612672266983 : Rat) / 2771825814456705436) [(1, 1), (3, 2), (5, 1), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 28. -/
theorem ep_Q2_008_partial_28_0101_valid :
    mulPoly ep_Q2_008_coefficient_28_0101
        ep_Q2_008_generator_28_0100_0199 =
      ep_Q2_008_partial_28_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0102 : Poly :=
[
  term ((11741509980130678983 : Rat) / 2771825814456705436) [(1, 1), (5, 1), (10, 1), (16, 1)]
]

/-- Partial product 102 for generator 28. -/
def ep_Q2_008_partial_28_0102 : Poly :=
[
  term ((11741509980130678983 : Rat) / 1385912907228352718) [(1, 1), (2, 1), (5, 1), (10, 1), (14, 1), (16, 1)],
  term ((-11741509980130678983 : Rat) / 2771825814456705436) [(1, 1), (2, 2), (5, 1), (10, 1), (16, 1)],
  term ((11741509980130678983 : Rat) / 1385912907228352718) [(1, 1), (3, 1), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((-11741509980130678983 : Rat) / 2771825814456705436) [(1, 1), (3, 2), (5, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 28. -/
theorem ep_Q2_008_partial_28_0102_valid :
    mulPoly ep_Q2_008_coefficient_28_0102
        ep_Q2_008_generator_28_0100_0199 =
      ep_Q2_008_partial_28_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0103 : Poly :=
[
  term ((-1339889716095078704545649417786671104000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (5, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 103 for generator 28. -/
def ep_Q2_008_partial_28_0103 : Poly :=
[
  term ((-2679779432190157409091298835573342208000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 1), (5, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1339889716095078704545649417786671104000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 2), (5, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2679779432190157409091298835573342208000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 1), (5, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((1339889716095078704545649417786671104000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 2), (5, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 28. -/
theorem ep_Q2_008_partial_28_0103_valid :
    mulPoly ep_Q2_008_coefficient_28_0103
        ep_Q2_008_generator_28_0100_0199 =
      ep_Q2_008_partial_28_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0104 : Poly :=
[
  term ((-64583833551027167844 : Rat) / 692956453614176359) [(1, 1), (5, 1), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 104 for generator 28. -/
def ep_Q2_008_partial_28_0104 : Poly :=
[
  term ((-129167667102054335688 : Rat) / 692956453614176359) [(1, 1), (2, 1), (5, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((64583833551027167844 : Rat) / 692956453614176359) [(1, 1), (2, 2), (5, 1), (12, 1), (13, 2), (16, 1)],
  term ((-129167667102054335688 : Rat) / 692956453614176359) [(1, 1), (3, 1), (5, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((64583833551027167844 : Rat) / 692956453614176359) [(1, 1), (3, 2), (5, 1), (12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 28. -/
theorem ep_Q2_008_partial_28_0104_valid :
    mulPoly ep_Q2_008_coefficient_28_0104
        ep_Q2_008_generator_28_0100_0199 =
      ep_Q2_008_partial_28_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0105 : Poly :=
[
  term ((7400323832412329337 : Rat) / 1385912907228352718) [(1, 1), (5, 1), (12, 1), (16, 1)]
]

/-- Partial product 105 for generator 28. -/
def ep_Q2_008_partial_28_0105 : Poly :=
[
  term ((7400323832412329337 : Rat) / 692956453614176359) [(1, 1), (2, 1), (5, 1), (12, 1), (14, 1), (16, 1)],
  term ((-7400323832412329337 : Rat) / 1385912907228352718) [(1, 1), (2, 2), (5, 1), (12, 1), (16, 1)],
  term ((7400323832412329337 : Rat) / 692956453614176359) [(1, 1), (3, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-7400323832412329337 : Rat) / 1385912907228352718) [(1, 1), (3, 2), (5, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 28. -/
theorem ep_Q2_008_partial_28_0105_valid :
    mulPoly ep_Q2_008_coefficient_28_0105
        ep_Q2_008_generator_28_0100_0199 =
      ep_Q2_008_partial_28_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0106 : Poly :=
[
  term ((669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (5, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 106 for generator 28. -/
def ep_Q2_008_partial_28_0106 : Poly :=
[
  term ((1339889716095078704545649417786671104000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 1), (5, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 2), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((1339889716095078704545649417786671104000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 1), (5, 1), (13, 1), (15, 2), (16, 1)],
  term ((-669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 2), (5, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 28. -/
theorem ep_Q2_008_partial_28_0106_valid :
    mulPoly ep_Q2_008_coefficient_28_0106
        ep_Q2_008_generator_28_0100_0199 =
      ep_Q2_008_partial_28_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0107 : Poly :=
[
  term ((-1879933578065458983 : Rat) / 5543651628913410872) [(1, 1), (5, 1), (16, 1)]
]

/-- Partial product 107 for generator 28. -/
def ep_Q2_008_partial_28_0107 : Poly :=
[
  term ((-1879933578065458983 : Rat) / 2771825814456705436) [(1, 1), (2, 1), (5, 1), (14, 1), (16, 1)],
  term ((1879933578065458983 : Rat) / 5543651628913410872) [(1, 1), (2, 2), (5, 1), (16, 1)],
  term ((-1879933578065458983 : Rat) / 2771825814456705436) [(1, 1), (3, 1), (5, 1), (15, 1), (16, 1)],
  term ((1879933578065458983 : Rat) / 5543651628913410872) [(1, 1), (3, 2), (5, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 28. -/
theorem ep_Q2_008_partial_28_0107_valid :
    mulPoly ep_Q2_008_coefficient_28_0107
        ep_Q2_008_generator_28_0100_0199 =
      ep_Q2_008_partial_28_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0108 : Poly :=
[
  term ((78273037166560530452376704018035200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 108 for generator 28. -/
def ep_Q2_008_partial_28_0108 : Poly :=
[
  term ((156546074333121060904753408036070400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (2, 1), (6, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-78273037166560530452376704018035200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (2, 2), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((156546074333121060904753408036070400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (3, 1), (6, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-78273037166560530452376704018035200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (3, 2), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 28. -/
theorem ep_Q2_008_partial_28_0108_valid :
    mulPoly ep_Q2_008_coefficient_28_0108
        ep_Q2_008_generator_28_0100_0199 =
      ep_Q2_008_partial_28_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0109 : Poly :=
[
  term ((-1094816955793144869 : Rat) / 692956453614176359) [(1, 1), (6, 1), (7, 1), (13, 2), (16, 1)]
]

/-- Partial product 109 for generator 28. -/
def ep_Q2_008_partial_28_0109 : Poly :=
[
  term ((-2189633911586289738 : Rat) / 692956453614176359) [(1, 1), (2, 1), (6, 1), (7, 1), (13, 2), (14, 1), (16, 1)],
  term ((1094816955793144869 : Rat) / 692956453614176359) [(1, 1), (2, 2), (6, 1), (7, 1), (13, 2), (16, 1)],
  term ((-2189633911586289738 : Rat) / 692956453614176359) [(1, 1), (3, 1), (6, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((1094816955793144869 : Rat) / 692956453614176359) [(1, 1), (3, 2), (6, 1), (7, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 28. -/
theorem ep_Q2_008_partial_28_0109_valid :
    mulPoly ep_Q2_008_coefficient_28_0109
        ep_Q2_008_generator_28_0100_0199 =
      ep_Q2_008_partial_28_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0110 : Poly :=
[
  term ((-22120412655187583551838078959565376000 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (7, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 110 for generator 28. -/
def ep_Q2_008_partial_28_0110 : Poly :=
[
  term ((-44240825310375167103676157919130752000 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (2, 1), (6, 1), (7, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((22120412655187583551838078959565376000 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (2, 2), (6, 1), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((-44240825310375167103676157919130752000 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (3, 1), (6, 1), (7, 1), (13, 3), (15, 2), (16, 1)],
  term ((22120412655187583551838078959565376000 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (3, 2), (6, 1), (7, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 28. -/
theorem ep_Q2_008_partial_28_0110_valid :
    mulPoly ep_Q2_008_coefficient_28_0110
        ep_Q2_008_generator_28_0100_0199 =
      ep_Q2_008_partial_28_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0111 : Poly :=
[
  term ((-4624670165699233431 : Rat) / 692956453614176359) [(1, 1), (6, 1), (7, 1), (16, 1)]
]

/-- Partial product 111 for generator 28. -/
def ep_Q2_008_partial_28_0111 : Poly :=
[
  term ((-9249340331398466862 : Rat) / 692956453614176359) [(1, 1), (2, 1), (6, 1), (7, 1), (14, 1), (16, 1)],
  term ((4624670165699233431 : Rat) / 692956453614176359) [(1, 1), (2, 2), (6, 1), (7, 1), (16, 1)],
  term ((-9249340331398466862 : Rat) / 692956453614176359) [(1, 1), (3, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((4624670165699233431 : Rat) / 692956453614176359) [(1, 1), (3, 2), (6, 1), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 28. -/
theorem ep_Q2_008_partial_28_0111_valid :
    mulPoly ep_Q2_008_coefficient_28_0111
        ep_Q2_008_generator_28_0100_0199 =
      ep_Q2_008_partial_28_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0112 : Poly :=
[
  term ((-609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (7, 2), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 112 for generator 28. -/
def ep_Q2_008_partial_28_0112 : Poly :=
[
  term ((-1218442200846645037506346959141427200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (2, 1), (6, 1), (7, 2), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (2, 2), (6, 1), (7, 2), (13, 2), (15, 1), (16, 1)],
  term ((-1218442200846645037506346959141427200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (3, 1), (6, 1), (7, 2), (13, 2), (15, 2), (16, 1)],
  term ((609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (3, 2), (6, 1), (7, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 28. -/
theorem ep_Q2_008_partial_28_0112_valid :
    mulPoly ep_Q2_008_coefficient_28_0112
        ep_Q2_008_generator_28_0100_0199 =
      ep_Q2_008_partial_28_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0113 : Poly :=
[
  term ((-43336929246501263764396389789139200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (7, 2), (15, 1), (16, 1)]
]

/-- Partial product 113 for generator 28. -/
def ep_Q2_008_partial_28_0113 : Poly :=
[
  term ((-86673858493002527528792779578278400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (2, 1), (6, 1), (7, 2), (14, 1), (15, 1), (16, 1)],
  term ((43336929246501263764396389789139200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (2, 2), (6, 1), (7, 2), (15, 1), (16, 1)],
  term ((-86673858493002527528792779578278400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (3, 1), (6, 1), (7, 2), (15, 2), (16, 1)],
  term ((43336929246501263764396389789139200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (3, 2), (6, 1), (7, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 28. -/
theorem ep_Q2_008_partial_28_0113_valid :
    mulPoly ep_Q2_008_coefficient_28_0113
        ep_Q2_008_generator_28_0100_0199 =
      ep_Q2_008_partial_28_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0114 : Poly :=
[
  term ((298759193453632413851394802614595584000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 114 for generator 28. -/
def ep_Q2_008_partial_28_0114 : Poly :=
[
  term ((597518386907264827702789605229191168000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 1), (6, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-298759193453632413851394802614595584000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 2), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((597518386907264827702789605229191168000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 1), (6, 1), (8, 1), (15, 2), (16, 1)],
  term ((-298759193453632413851394802614595584000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 2), (6, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 28. -/
theorem ep_Q2_008_partial_28_0114_valid :
    mulPoly ep_Q2_008_coefficient_28_0114
        ep_Q2_008_generator_28_0100_0199 =
      ep_Q2_008_partial_28_0114 := by
  native_decide

/-- Coefficient term 115 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0115 : Poly :=
[
  term ((-6945979900585068000 : Rat) / 692956453614176359) [(1, 1), (6, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 115 for generator 28. -/
def ep_Q2_008_partial_28_0115 : Poly :=
[
  term ((-13891959801170136000 : Rat) / 692956453614176359) [(1, 1), (2, 1), (6, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((6945979900585068000 : Rat) / 692956453614176359) [(1, 1), (2, 2), (6, 1), (10, 1), (13, 1), (16, 1)],
  term ((-13891959801170136000 : Rat) / 692956453614176359) [(1, 1), (3, 1), (6, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((6945979900585068000 : Rat) / 692956453614176359) [(1, 1), (3, 2), (6, 1), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 115 for generator 28. -/
theorem ep_Q2_008_partial_28_0115_valid :
    mulPoly ep_Q2_008_coefficient_28_0115
        ep_Q2_008_generator_28_0100_0199 =
      ep_Q2_008_partial_28_0115 := by
  native_decide

/-- Coefficient term 116 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0116 : Poly :=
[
  term ((-3335197780739038211317658262354644332800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 116 for generator 28. -/
def ep_Q2_008_partial_28_0116 : Poly :=
[
  term ((-6670395561478076422635316524709288665600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 1), (6, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((3335197780739038211317658262354644332800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 2), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-6670395561478076422635316524709288665600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 1), (6, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((3335197780739038211317658262354644332800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 2), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 116 for generator 28. -/
theorem ep_Q2_008_partial_28_0116_valid :
    mulPoly ep_Q2_008_coefficient_28_0116
        ep_Q2_008_generator_28_0100_0199 =
      ep_Q2_008_partial_28_0116 := by
  native_decide

/-- Coefficient term 117 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0117 : Poly :=
[
  term ((-14293661141217672000 : Rat) / 692956453614176359) [(1, 1), (6, 1), (11, 1), (13, 2), (16, 1)]
]

/-- Partial product 117 for generator 28. -/
def ep_Q2_008_partial_28_0117 : Poly :=
[
  term ((-28587322282435344000 : Rat) / 692956453614176359) [(1, 1), (2, 1), (6, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((14293661141217672000 : Rat) / 692956453614176359) [(1, 1), (2, 2), (6, 1), (11, 1), (13, 2), (16, 1)],
  term ((-28587322282435344000 : Rat) / 692956453614176359) [(1, 1), (3, 1), (6, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((14293661141217672000 : Rat) / 692956453614176359) [(1, 1), (3, 2), (6, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 117 for generator 28. -/
theorem ep_Q2_008_partial_28_0117_valid :
    mulPoly ep_Q2_008_coefficient_28_0117
        ep_Q2_008_generator_28_0100_0199 =
      ep_Q2_008_partial_28_0117 := by
  native_decide

/-- Coefficient term 118 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0118 : Poly :=
[
  term ((-1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 118 for generator 28. -/
def ep_Q2_008_partial_28_0118 : Poly :=
[
  term ((-2366596089097314813815965124265084211200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (2, 1), (6, 1), (11, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (2, 2), (6, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((-2366596089097314813815965124265084211200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (3, 1), (6, 1), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (3, 2), (6, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 118 for generator 28. -/
theorem ep_Q2_008_partial_28_0118_valid :
    mulPoly ep_Q2_008_coefficient_28_0118
        ep_Q2_008_generator_28_0100_0199 =
      ep_Q2_008_partial_28_0118 := by
  native_decide

/-- Coefficient term 119 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0119 : Poly :=
[
  term ((-3615781793256984375 : Rat) / 1385912907228352718) [(1, 1), (6, 1), (11, 1), (16, 1)]
]

/-- Partial product 119 for generator 28. -/
def ep_Q2_008_partial_28_0119 : Poly :=
[
  term ((-3615781793256984375 : Rat) / 692956453614176359) [(1, 1), (2, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((3615781793256984375 : Rat) / 1385912907228352718) [(1, 1), (2, 2), (6, 1), (11, 1), (16, 1)],
  term ((-3615781793256984375 : Rat) / 692956453614176359) [(1, 1), (3, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((3615781793256984375 : Rat) / 1385912907228352718) [(1, 1), (3, 2), (6, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 119 for generator 28. -/
theorem ep_Q2_008_partial_28_0119_valid :
    mulPoly ep_Q2_008_coefficient_28_0119
        ep_Q2_008_generator_28_0100_0199 =
      ep_Q2_008_partial_28_0119 := by
  native_decide

/-- Coefficient term 120 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0120 : Poly :=
[
  term ((21215886736744339523703249485584010466600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 120 for generator 28. -/
def ep_Q2_008_partial_28_0120 : Poly :=
[
  term ((42431773473488679047406498971168020933200 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 1), (6, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-21215886736744339523703249485584010466600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 2), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((42431773473488679047406498971168020933200 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 1), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((-21215886736744339523703249485584010466600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 2), (6, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 120 for generator 28. -/
theorem ep_Q2_008_partial_28_0120_valid :
    mulPoly ep_Q2_008_coefficient_28_0120
        ep_Q2_008_generator_28_0100_0199 =
      ep_Q2_008_partial_28_0120 := by
  native_decide

/-- Coefficient term 121 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0121 : Poly :=
[
  term ((-537446166407415209189398179728040768000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 121 for generator 28. -/
def ep_Q2_008_partial_28_0121 : Poly :=
[
  term ((-1074892332814830418378796359456081536000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 1), (6, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((537446166407415209189398179728040768000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 2), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1074892332814830418378796359456081536000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 1), (6, 1), (13, 1), (15, 3), (16, 1)],
  term ((537446166407415209189398179728040768000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 2), (6, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 121 for generator 28. -/
theorem ep_Q2_008_partial_28_0121_valid :
    mulPoly ep_Q2_008_coefficient_28_0121
        ep_Q2_008_generator_28_0100_0199 =
      ep_Q2_008_partial_28_0121 := by
  native_decide

/-- Coefficient term 122 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0122 : Poly :=
[
  term ((17474260998159566460 : Rat) / 692956453614176359) [(1, 1), (6, 1), (13, 1), (16, 1)]
]

/-- Partial product 122 for generator 28. -/
def ep_Q2_008_partial_28_0122 : Poly :=
[
  term ((34948521996319132920 : Rat) / 692956453614176359) [(1, 1), (2, 1), (6, 1), (13, 1), (14, 1), (16, 1)],
  term ((-17474260998159566460 : Rat) / 692956453614176359) [(1, 1), (2, 2), (6, 1), (13, 1), (16, 1)],
  term ((34948521996319132920 : Rat) / 692956453614176359) [(1, 1), (3, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-17474260998159566460 : Rat) / 692956453614176359) [(1, 1), (3, 2), (6, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 122 for generator 28. -/
theorem ep_Q2_008_partial_28_0122_valid :
    mulPoly ep_Q2_008_coefficient_28_0122
        ep_Q2_008_generator_28_0100_0199 =
      ep_Q2_008_partial_28_0122 := by
  native_decide

/-- Coefficient term 123 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0123 : Poly :=
[
  term ((-11691734803563333206741456756370236774400 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 123 for generator 28. -/
def ep_Q2_008_partial_28_0123 : Poly :=
[
  term ((-23383469607126666413482913512740473548800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 1), (6, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((11691734803563333206741456756370236774400 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 2), (6, 1), (13, 2), (15, 1), (16, 1)],
  term ((-23383469607126666413482913512740473548800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 1), (6, 1), (13, 2), (15, 2), (16, 1)],
  term ((11691734803563333206741456756370236774400 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 2), (6, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 123 for generator 28. -/
theorem ep_Q2_008_partial_28_0123_valid :
    mulPoly ep_Q2_008_coefficient_28_0123
        ep_Q2_008_generator_28_0100_0199 =
      ep_Q2_008_partial_28_0123 := by
  native_decide

/-- Coefficient term 124 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0124 : Poly :=
[
  term ((-72049070589800149095829600020583038810075 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 124 for generator 28. -/
def ep_Q2_008_partial_28_0124 : Poly :=
[
  term ((-144098141179600298191659200041166077620150 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((72049070589800149095829600020583038810075 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 2), (6, 1), (15, 1), (16, 1)],
  term ((-144098141179600298191659200041166077620150 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 1), (6, 1), (15, 2), (16, 1)],
  term ((72049070589800149095829600020583038810075 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 2), (6, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 124 for generator 28. -/
theorem ep_Q2_008_partial_28_0124_valid :
    mulPoly ep_Q2_008_coefficient_28_0124
        ep_Q2_008_generator_28_0100_0199 =
      ep_Q2_008_partial_28_0124 := by
  native_decide

/-- Coefficient term 125 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0125 : Poly :=
[
  term ((-21813405123651604351406039090813201634600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 2), (15, 1), (16, 1)]
]

/-- Partial product 125 for generator 28. -/
def ep_Q2_008_partial_28_0125 : Poly :=
[
  term ((-43626810247303208702812078181626403269200 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 1), (6, 2), (14, 1), (15, 1), (16, 1)],
  term ((21813405123651604351406039090813201634600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 2), (6, 2), (15, 1), (16, 1)],
  term ((-43626810247303208702812078181626403269200 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 1), (6, 2), (15, 2), (16, 1)],
  term ((21813405123651604351406039090813201634600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 2), (6, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 125 for generator 28. -/
theorem ep_Q2_008_partial_28_0125_valid :
    mulPoly ep_Q2_008_coefficient_28_0125
        ep_Q2_008_generator_28_0100_0199 =
      ep_Q2_008_partial_28_0125 := by
  native_decide

/-- Coefficient term 126 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0126 : Poly :=
[
  term ((-514517029672968000 : Rat) / 692956453614176359) [(1, 1), (7, 1), (10, 1), (16, 1)]
]

/-- Partial product 126 for generator 28. -/
def ep_Q2_008_partial_28_0126 : Poly :=
[
  term ((-1029034059345936000 : Rat) / 692956453614176359) [(1, 1), (2, 1), (7, 1), (10, 1), (14, 1), (16, 1)],
  term ((514517029672968000 : Rat) / 692956453614176359) [(1, 1), (2, 2), (7, 1), (10, 1), (16, 1)],
  term ((-1029034059345936000 : Rat) / 692956453614176359) [(1, 1), (3, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((514517029672968000 : Rat) / 692956453614176359) [(1, 1), (3, 2), (7, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 126 for generator 28. -/
theorem ep_Q2_008_partial_28_0126_valid :
    mulPoly ep_Q2_008_coefficient_28_0126
        ep_Q2_008_generator_28_0100_0199 =
      ep_Q2_008_partial_28_0126 := by
  native_decide

/-- Coefficient term 127 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0127 : Poly :=
[
  term ((-78273037166560530452376704018035200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 127 for generator 28. -/
def ep_Q2_008_partial_28_0127 : Poly :=
[
  term ((-156546074333121060904753408036070400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (2, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((78273037166560530452376704018035200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (2, 2), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-156546074333121060904753408036070400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (3, 1), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((78273037166560530452376704018035200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (3, 2), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 127 for generator 28. -/
theorem ep_Q2_008_partial_28_0127_valid :
    mulPoly ep_Q2_008_coefficient_28_0127
        ep_Q2_008_generator_28_0100_0199 =
      ep_Q2_008_partial_28_0127 := by
  native_decide

/-- Coefficient term 128 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0128 : Poly :=
[
  term ((1094816955793144869 : Rat) / 692956453614176359) [(1, 1), (7, 1), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 128 for generator 28. -/
def ep_Q2_008_partial_28_0128 : Poly :=
[
  term ((2189633911586289738 : Rat) / 692956453614176359) [(1, 1), (2, 1), (7, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-1094816955793144869 : Rat) / 692956453614176359) [(1, 1), (2, 2), (7, 1), (12, 1), (13, 2), (16, 1)],
  term ((2189633911586289738 : Rat) / 692956453614176359) [(1, 1), (3, 1), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1094816955793144869 : Rat) / 692956453614176359) [(1, 1), (3, 2), (7, 1), (12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 128 for generator 28. -/
theorem ep_Q2_008_partial_28_0128_valid :
    mulPoly ep_Q2_008_coefficient_28_0128
        ep_Q2_008_generator_28_0100_0199 =
      ep_Q2_008_partial_28_0128 := by
  native_decide

/-- Coefficient term 129 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0129 : Poly :=
[
  term ((22120412655187583551838078959565376000 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (7, 1), (12, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 129 for generator 28. -/
def ep_Q2_008_partial_28_0129 : Poly :=
[
  term ((44240825310375167103676157919130752000 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (2, 1), (7, 1), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-22120412655187583551838078959565376000 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (2, 2), (7, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((44240825310375167103676157919130752000 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (3, 1), (7, 1), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((-22120412655187583551838078959565376000 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (3, 2), (7, 1), (12, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 129 for generator 28. -/
theorem ep_Q2_008_partial_28_0129_valid :
    mulPoly ep_Q2_008_coefficient_28_0129
        ep_Q2_008_generator_28_0100_0199 =
      ep_Q2_008_partial_28_0129 := by
  native_decide

/-- Coefficient term 130 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0130 : Poly :=
[
  term ((5396445710208685431 : Rat) / 692956453614176359) [(1, 1), (7, 1), (12, 1), (16, 1)]
]

/-- Partial product 130 for generator 28. -/
def ep_Q2_008_partial_28_0130 : Poly :=
[
  term ((10792891420417370862 : Rat) / 692956453614176359) [(1, 1), (2, 1), (7, 1), (12, 1), (14, 1), (16, 1)],
  term ((-5396445710208685431 : Rat) / 692956453614176359) [(1, 1), (2, 2), (7, 1), (12, 1), (16, 1)],
  term ((10792891420417370862 : Rat) / 692956453614176359) [(1, 1), (3, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-5396445710208685431 : Rat) / 692956453614176359) [(1, 1), (3, 2), (7, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 130 for generator 28. -/
theorem ep_Q2_008_partial_28_0130_valid :
    mulPoly ep_Q2_008_coefficient_28_0130
        ep_Q2_008_generator_28_0100_0199 =
      ep_Q2_008_partial_28_0130 := by
  native_decide

/-- Coefficient term 131 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0131 : Poly :=
[
  term ((122874557058042210218372901090036151824000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 131 for generator 28. -/
def ep_Q2_008_partial_28_0131 : Poly :=
[
  term ((245749114116084420436745802180072303648000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-122874557058042210218372901090036151824000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 2), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((245749114116084420436745802180072303648000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-122874557058042210218372901090036151824000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 2), (7, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 131 for generator 28. -/
theorem ep_Q2_008_partial_28_0131_valid :
    mulPoly ep_Q2_008_coefficient_28_0131
        ep_Q2_008_generator_28_0100_0199 =
      ep_Q2_008_partial_28_0131 := by
  native_decide

/-- Coefficient term 132 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0132 : Poly :=
[
  term ((1692968762903917011824570548149374976000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (7, 1), (15, 2), (16, 1)]
]

/-- Partial product 132 for generator 28. -/
def ep_Q2_008_partial_28_0132 : Poly :=
[
  term ((3385937525807834023649141096298749952000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1692968762903917011824570548149374976000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 2), (7, 1), (15, 2), (16, 1)],
  term ((3385937525807834023649141096298749952000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 1), (7, 1), (15, 3), (16, 1)],
  term ((-1692968762903917011824570548149374976000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 2), (7, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 132 for generator 28. -/
theorem ep_Q2_008_partial_28_0132_valid :
    mulPoly ep_Q2_008_coefficient_28_0132
        ep_Q2_008_generator_28_0100_0199 =
      ep_Q2_008_partial_28_0132 := by
  native_decide

/-- Coefficient term 133 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0133 : Poly :=
[
  term ((1029034059345936000 : Rat) / 692956453614176359) [(1, 1), (7, 1), (16, 1)]
]

/-- Partial product 133 for generator 28. -/
def ep_Q2_008_partial_28_0133 : Poly :=
[
  term ((2058068118691872000 : Rat) / 692956453614176359) [(1, 1), (2, 1), (7, 1), (14, 1), (16, 1)],
  term ((-1029034059345936000 : Rat) / 692956453614176359) [(1, 1), (2, 2), (7, 1), (16, 1)],
  term ((2058068118691872000 : Rat) / 692956453614176359) [(1, 1), (3, 1), (7, 1), (15, 1), (16, 1)],
  term ((-1029034059345936000 : Rat) / 692956453614176359) [(1, 1), (3, 2), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 133 for generator 28. -/
theorem ep_Q2_008_partial_28_0133_valid :
    mulPoly ep_Q2_008_coefficient_28_0133
        ep_Q2_008_generator_28_0100_0199 =
      ep_Q2_008_partial_28_0133 := by
  native_decide

/-- Coefficient term 134 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0134 : Poly :=
[
  term ((609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (7, 2), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 134 for generator 28. -/
def ep_Q2_008_partial_28_0134 : Poly :=
[
  term ((1218442200846645037506346959141427200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (2, 1), (7, 2), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (2, 2), (7, 2), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((1218442200846645037506346959141427200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (3, 1), (7, 2), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (3, 2), (7, 2), (12, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 134 for generator 28. -/
theorem ep_Q2_008_partial_28_0134_valid :
    mulPoly ep_Q2_008_coefficient_28_0134
        ep_Q2_008_generator_28_0100_0199 =
      ep_Q2_008_partial_28_0134 := by
  native_decide

/-- Coefficient term 135 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0135 : Poly :=
[
  term ((43336929246501263764396389789139200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (7, 2), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 135 for generator 28. -/
def ep_Q2_008_partial_28_0135 : Poly :=
[
  term ((86673858493002527528792779578278400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (2, 1), (7, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-43336929246501263764396389789139200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (2, 2), (7, 2), (12, 1), (15, 1), (16, 1)],
  term ((86673858493002527528792779578278400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (3, 1), (7, 2), (12, 1), (15, 2), (16, 1)],
  term ((-43336929246501263764396389789139200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (3, 2), (7, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 135 for generator 28. -/
theorem ep_Q2_008_partial_28_0135_valid :
    mulPoly ep_Q2_008_coefficient_28_0135
        ep_Q2_008_generator_28_0100_0199 =
      ep_Q2_008_partial_28_0135 := by
  native_decide

/-- Coefficient term 136 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0136 : Poly :=
[
  term ((60212255272942500 : Rat) / 692956453614176359) [(1, 1), (8, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 136 for generator 28. -/
def ep_Q2_008_partial_28_0136 : Poly :=
[
  term ((120424510545885000 : Rat) / 692956453614176359) [(1, 1), (2, 1), (8, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-60212255272942500 : Rat) / 692956453614176359) [(1, 1), (2, 2), (8, 1), (11, 1), (12, 1), (16, 1)],
  term ((120424510545885000 : Rat) / 692956453614176359) [(1, 1), (3, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-60212255272942500 : Rat) / 692956453614176359) [(1, 1), (3, 2), (8, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 136 for generator 28. -/
theorem ep_Q2_008_partial_28_0136_valid :
    mulPoly ep_Q2_008_coefficient_28_0136
        ep_Q2_008_generator_28_0100_0199 =
      ep_Q2_008_partial_28_0136 := by
  native_decide

/-- Coefficient term 137 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0137 : Poly :=
[
  term ((-334972429023769676136412354446667776000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 137 for generator 28. -/
def ep_Q2_008_partial_28_0137 : Poly :=
[
  term ((-669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 1), (8, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((334972429023769676136412354446667776000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 2), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 1), (8, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((334972429023769676136412354446667776000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 2), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 137 for generator 28. -/
theorem ep_Q2_008_partial_28_0137_valid :
    mulPoly ep_Q2_008_coefficient_28_0137
        ep_Q2_008_generator_28_0100_0199 =
      ep_Q2_008_partial_28_0137 := by
  native_decide

/-- Coefficient term 138 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0138 : Poly :=
[
  term ((100574316499860000 : Rat) / 692956453614176359) [(1, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 138 for generator 28. -/
def ep_Q2_008_partial_28_0138 : Poly :=
[
  term ((201148632999720000 : Rat) / 692956453614176359) [(1, 1), (2, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((-100574316499860000 : Rat) / 692956453614176359) [(1, 1), (2, 2), (8, 1), (11, 1), (16, 1)],
  term ((201148632999720000 : Rat) / 692956453614176359) [(1, 1), (3, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-100574316499860000 : Rat) / 692956453614176359) [(1, 1), (3, 2), (8, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 138 for generator 28. -/
theorem ep_Q2_008_partial_28_0138_valid :
    mulPoly ep_Q2_008_coefficient_28_0138
        ep_Q2_008_generator_28_0100_0199 =
      ep_Q2_008_partial_28_0138 := by
  native_decide

/-- Coefficient term 139 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0139 : Poly :=
[
  term ((-264988797391185653150505649995689332800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (8, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 139 for generator 28. -/
def ep_Q2_008_partial_28_0139 : Poly :=
[
  term ((-529977594782371306301011299991378665600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((264988797391185653150505649995689332800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 2), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-529977594782371306301011299991378665600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((264988797391185653150505649995689332800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 2), (8, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 139 for generator 28. -/
theorem ep_Q2_008_partial_28_0139_valid :
    mulPoly ep_Q2_008_coefficient_28_0139
        ep_Q2_008_generator_28_0100_0199 =
      ep_Q2_008_partial_28_0139 := by
  native_decide

/-- Coefficient term 140 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0140 : Poly :=
[
  term ((9497299241309471661 : Rat) / 2771825814456705436) [(1, 1), (8, 1), (13, 1), (16, 1)]
]

/-- Partial product 140 for generator 28. -/
def ep_Q2_008_partial_28_0140 : Poly :=
[
  term ((9497299241309471661 : Rat) / 1385912907228352718) [(1, 1), (2, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((-9497299241309471661 : Rat) / 2771825814456705436) [(1, 1), (2, 2), (8, 1), (13, 1), (16, 1)],
  term ((9497299241309471661 : Rat) / 1385912907228352718) [(1, 1), (3, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-9497299241309471661 : Rat) / 2771825814456705436) [(1, 1), (3, 2), (8, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 140 for generator 28. -/
theorem ep_Q2_008_partial_28_0140_valid :
    mulPoly ep_Q2_008_coefficient_28_0140
        ep_Q2_008_generator_28_0100_0199 =
      ep_Q2_008_partial_28_0140 := by
  native_decide

/-- Coefficient term 141 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0141 : Poly :=
[
  term ((111657476341256558712137451482222592000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (8, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 141 for generator 28. -/
def ep_Q2_008_partial_28_0141 : Poly :=
[
  term ((223314952682513117424274902964445184000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 1), (8, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-111657476341256558712137451482222592000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 2), (8, 1), (13, 2), (15, 1), (16, 1)],
  term ((223314952682513117424274902964445184000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 1), (8, 1), (13, 2), (15, 2), (16, 1)],
  term ((-111657476341256558712137451482222592000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 2), (8, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 141 for generator 28. -/
theorem ep_Q2_008_partial_28_0141_valid :
    mulPoly ep_Q2_008_coefficient_28_0141
        ep_Q2_008_generator_28_0100_0199 =
      ep_Q2_008_partial_28_0141 := by
  native_decide

/-- Coefficient term 142 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0142 : Poly :=
[
  term ((-33770396062446760700889152618906251200 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 142 for generator 28. -/
def ep_Q2_008_partial_28_0142 : Poly :=
[
  term ((-67540792124893521401778305237812502400 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((33770396062446760700889152618906251200 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 2), (8, 1), (15, 1), (16, 1)],
  term ((-67540792124893521401778305237812502400 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 1), (8, 1), (15, 2), (16, 1)],
  term ((33770396062446760700889152618906251200 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 2), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 142 for generator 28. -/
theorem ep_Q2_008_partial_28_0142_valid :
    mulPoly ep_Q2_008_coefficient_28_0142
        ep_Q2_008_generator_28_0100_0199 =
      ep_Q2_008_partial_28_0142 := by
  native_decide

/-- Coefficient term 143 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0143 : Poly :=
[
  term ((-385887772254726000 : Rat) / 692956453614176359) [(1, 1), (9, 1), (12, 1), (16, 1)]
]

/-- Partial product 143 for generator 28. -/
def ep_Q2_008_partial_28_0143 : Poly :=
[
  term ((-771775544509452000 : Rat) / 692956453614176359) [(1, 1), (2, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((385887772254726000 : Rat) / 692956453614176359) [(1, 1), (2, 2), (9, 1), (12, 1), (16, 1)],
  term ((-771775544509452000 : Rat) / 692956453614176359) [(1, 1), (3, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((385887772254726000 : Rat) / 692956453614176359) [(1, 1), (3, 2), (9, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 143 for generator 28. -/
theorem ep_Q2_008_partial_28_0143_valid :
    mulPoly ep_Q2_008_coefficient_28_0143
        ep_Q2_008_generator_28_0100_0199 =
      ep_Q2_008_partial_28_0143 := by
  native_decide

/-- Coefficient term 144 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0144 : Poly :=
[
  term ((-47640465710460000 : Rat) / 692956453614176359) [(1, 1), (10, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 144 for generator 28. -/
def ep_Q2_008_partial_28_0144 : Poly :=
[
  term ((-95280931420920000 : Rat) / 692956453614176359) [(1, 1), (2, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((47640465710460000 : Rat) / 692956453614176359) [(1, 1), (2, 2), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((-95280931420920000 : Rat) / 692956453614176359) [(1, 1), (3, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((47640465710460000 : Rat) / 692956453614176359) [(1, 1), (3, 2), (10, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 144 for generator 28. -/
theorem ep_Q2_008_partial_28_0144_valid :
    mulPoly ep_Q2_008_coefficient_28_0144
        ep_Q2_008_generator_28_0100_0199 =
      ep_Q2_008_partial_28_0144 := by
  native_decide

/-- Coefficient term 145 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0145 : Poly :=
[
  term ((304898980546944000 : Rat) / 692956453614176359) [(1, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 145 for generator 28. -/
def ep_Q2_008_partial_28_0145 : Poly :=
[
  term ((609797961093888000 : Rat) / 692956453614176359) [(1, 1), (2, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-304898980546944000 : Rat) / 692956453614176359) [(1, 1), (2, 2), (10, 1), (11, 1), (16, 1)],
  term ((609797961093888000 : Rat) / 692956453614176359) [(1, 1), (3, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-304898980546944000 : Rat) / 692956453614176359) [(1, 1), (3, 2), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 145 for generator 28. -/
theorem ep_Q2_008_partial_28_0145_valid :
    mulPoly ep_Q2_008_coefficient_28_0145
        ep_Q2_008_generator_28_0100_0199 =
      ep_Q2_008_partial_28_0145 := by
  native_decide

/-- Coefficient term 146 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0146 : Poly :=
[
  term ((8489530989603972000 : Rat) / 692956453614176359) [(1, 1), (10, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 146 for generator 28. -/
def ep_Q2_008_partial_28_0146 : Poly :=
[
  term ((16979061979207944000 : Rat) / 692956453614176359) [(1, 1), (2, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-8489530989603972000 : Rat) / 692956453614176359) [(1, 1), (2, 2), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((16979061979207944000 : Rat) / 692956453614176359) [(1, 1), (3, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-8489530989603972000 : Rat) / 692956453614176359) [(1, 1), (3, 2), (10, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 146 for generator 28. -/
theorem ep_Q2_008_partial_28_0146_valid :
    mulPoly ep_Q2_008_coefficient_28_0146
        ep_Q2_008_generator_28_0100_0199 =
      ep_Q2_008_partial_28_0146 := by
  native_decide

/-- Coefficient term 147 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0147 : Poly :=
[
  term ((-33536628109921223774287078524254174232600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 147 for generator 28. -/
def ep_Q2_008_partial_28_0147 : Poly :=
[
  term ((-67073256219842447548574157048508348465200 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((33536628109921223774287078524254174232600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 2), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-67073256219842447548574157048508348465200 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((33536628109921223774287078524254174232600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 2), (10, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 147 for generator 28. -/
theorem ep_Q2_008_partial_28_0147_valid :
    mulPoly ep_Q2_008_coefficient_28_0147
        ep_Q2_008_generator_28_0100_0199 =
      ep_Q2_008_partial_28_0147 := by
  native_decide

/-- Coefficient term 148 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0148 : Poly :=
[
  term ((-19716523940061682983 : Rat) / 2771825814456705436) [(1, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 148 for generator 28. -/
def ep_Q2_008_partial_28_0148 : Poly :=
[
  term ((-19716523940061682983 : Rat) / 1385912907228352718) [(1, 1), (2, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((19716523940061682983 : Rat) / 2771825814456705436) [(1, 1), (2, 2), (10, 1), (13, 1), (16, 1)],
  term ((-19716523940061682983 : Rat) / 1385912907228352718) [(1, 1), (3, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((19716523940061682983 : Rat) / 2771825814456705436) [(1, 1), (3, 2), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 148 for generator 28. -/
theorem ep_Q2_008_partial_28_0148_valid :
    mulPoly ep_Q2_008_coefficient_28_0148
        ep_Q2_008_generator_28_0100_0199 =
      ep_Q2_008_partial_28_0148 := by
  native_decide

/-- Coefficient term 149 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0149 : Poly :=
[
  term ((-669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 149 for generator 28. -/
def ep_Q2_008_partial_28_0149 : Poly :=
[
  term ((-1339889716095078704545649417786671104000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 1), (10, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 2), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1339889716095078704545649417786671104000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 2), (10, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 149 for generator 28. -/
theorem ep_Q2_008_partial_28_0149_valid :
    mulPoly ep_Q2_008_coefficient_28_0149
        ep_Q2_008_generator_28_0100_0199 =
      ep_Q2_008_partial_28_0149 := by
  native_decide

/-- Coefficient term 150 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0150 : Poly :=
[
  term ((37618634030860335785142286561194786761100 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 150 for generator 28. -/
def ep_Q2_008_partial_28_0150 : Poly :=
[
  term ((75237268061720671570284573122389573522200 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-37618634030860335785142286561194786761100 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 2), (10, 1), (15, 1), (16, 1)],
  term ((75237268061720671570284573122389573522200 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 1), (10, 1), (15, 2), (16, 1)],
  term ((-37618634030860335785142286561194786761100 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 2), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 150 for generator 28. -/
theorem ep_Q2_008_partial_28_0150_valid :
    mulPoly ep_Q2_008_coefficient_28_0150
        ep_Q2_008_generator_28_0100_0199 =
      ep_Q2_008_partial_28_0150 := by
  native_decide

/-- Coefficient term 151 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0151 : Poly :=
[
  term ((4005142638786577563590482971247979884800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 151 for generator 28. -/
def ep_Q2_008_partial_28_0151 : Poly :=
[
  term ((8010285277573155127180965942495959769600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4005142638786577563590482971247979884800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 2), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((8010285277573155127180965942495959769600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-4005142638786577563590482971247979884800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 2), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 151 for generator 28. -/
theorem ep_Q2_008_partial_28_0151_valid :
    mulPoly ep_Q2_008_coefficient_28_0151
        ep_Q2_008_generator_28_0100_0199 =
      ep_Q2_008_partial_28_0151 := by
  native_decide

/-- Coefficient term 152 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0152 : Poly :=
[
  term ((14293661141217672000 : Rat) / 692956453614176359) [(1, 1), (11, 1), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 152 for generator 28. -/
def ep_Q2_008_partial_28_0152 : Poly :=
[
  term ((28587322282435344000 : Rat) / 692956453614176359) [(1, 1), (2, 1), (11, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-14293661141217672000 : Rat) / 692956453614176359) [(1, 1), (2, 2), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((28587322282435344000 : Rat) / 692956453614176359) [(1, 1), (3, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-14293661141217672000 : Rat) / 692956453614176359) [(1, 1), (3, 2), (11, 1), (12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 152 for generator 28. -/
theorem ep_Q2_008_partial_28_0152_valid :
    mulPoly ep_Q2_008_coefficient_28_0152
        ep_Q2_008_generator_28_0100_0199 =
      ep_Q2_008_partial_28_0152 := by
  native_decide

/-- Coefficient term 153 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0153 : Poly :=
[
  term ((1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 153 for generator 28. -/
def ep_Q2_008_partial_28_0153 : Poly :=
[
  term ((2366596089097314813815965124265084211200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (2, 1), (11, 1), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (2, 2), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((2366596089097314813815965124265084211200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (3, 1), (11, 1), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((-1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (3, 2), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 153 for generator 28. -/
theorem ep_Q2_008_partial_28_0153_valid :
    mulPoly ep_Q2_008_coefficient_28_0153
        ep_Q2_008_generator_28_0100_0199 =
      ep_Q2_008_partial_28_0153 := by
  native_decide

/-- Coefficient term 154 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0154 : Poly :=
[
  term ((17790002001501557733 : Rat) / 2771825814456705436) [(1, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 154 for generator 28. -/
def ep_Q2_008_partial_28_0154 : Poly :=
[
  term ((17790002001501557733 : Rat) / 1385912907228352718) [(1, 1), (2, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-17790002001501557733 : Rat) / 2771825814456705436) [(1, 1), (2, 2), (11, 1), (12, 1), (16, 1)],
  term ((17790002001501557733 : Rat) / 1385912907228352718) [(1, 1), (3, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-17790002001501557733 : Rat) / 2771825814456705436) [(1, 1), (3, 2), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 154 for generator 28. -/
theorem ep_Q2_008_partial_28_0154_valid :
    mulPoly ep_Q2_008_coefficient_28_0154
        ep_Q2_008_generator_28_0100_0199 =
      ep_Q2_008_partial_28_0154 := by
  native_decide

/-- Coefficient term 155 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0155 : Poly :=
[
  term ((-43008753766387500 : Rat) / 692956453614176359) [(1, 1), (11, 1), (12, 2), (16, 1)]
]

/-- Partial product 155 for generator 28. -/
def ep_Q2_008_partial_28_0155 : Poly :=
[
  term ((-86017507532775000 : Rat) / 692956453614176359) [(1, 1), (2, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((43008753766387500 : Rat) / 692956453614176359) [(1, 1), (2, 2), (11, 1), (12, 2), (16, 1)],
  term ((-86017507532775000 : Rat) / 692956453614176359) [(1, 1), (3, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((43008753766387500 : Rat) / 692956453614176359) [(1, 1), (3, 2), (11, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 155 for generator 28. -/
theorem ep_Q2_008_partial_28_0155_valid :
    mulPoly ep_Q2_008_coefficient_28_0155
        ep_Q2_008_generator_28_0100_0199 =
      ep_Q2_008_partial_28_0155 := by
  native_decide

/-- Coefficient term 156 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0156 : Poly :=
[
  term ((-837431072559424190341030886116669440000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 156 for generator 28. -/
def ep_Q2_008_partial_28_0156 : Poly :=
[
  term ((-1674862145118848380682061772233338880000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((837431072559424190341030886116669440000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1674862145118848380682061772233338880000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((837431072559424190341030886116669440000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 2), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 156 for generator 28. -/
theorem ep_Q2_008_partial_28_0156_valid :
    mulPoly ep_Q2_008_coefficient_28_0156
        ep_Q2_008_generator_28_0100_0199 =
      ep_Q2_008_partial_28_0156 := by
  native_decide

/-- Coefficient term 157 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0157 : Poly :=
[
  term ((-12609228129195918483 : Rat) / 2771825814456705436) [(1, 1), (11, 1), (16, 1)]
]

/-- Partial product 157 for generator 28. -/
def ep_Q2_008_partial_28_0157 : Poly :=
[
  term ((-12609228129195918483 : Rat) / 1385912907228352718) [(1, 1), (2, 1), (11, 1), (14, 1), (16, 1)],
  term ((12609228129195918483 : Rat) / 2771825814456705436) [(1, 1), (2, 2), (11, 1), (16, 1)],
  term ((-12609228129195918483 : Rat) / 1385912907228352718) [(1, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((12609228129195918483 : Rat) / 2771825814456705436) [(1, 1), (3, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 157 for generator 28. -/
theorem ep_Q2_008_partial_28_0157_valid :
    mulPoly ep_Q2_008_coefficient_28_0157
        ep_Q2_008_generator_28_0100_0199 =
      ep_Q2_008_partial_28_0157 := by
  native_decide

/-- Coefficient term 158 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0158 : Poly :=
[
  term ((537446166407415209189398179728040768000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 158 for generator 28. -/
def ep_Q2_008_partial_28_0158 : Poly :=
[
  term ((1074892332814830418378796359456081536000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-537446166407415209189398179728040768000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 2), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((1074892332814830418378796359456081536000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-537446166407415209189398179728040768000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 2), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 158 for generator 28. -/
theorem ep_Q2_008_partial_28_0158_valid :
    mulPoly ep_Q2_008_coefficient_28_0158
        ep_Q2_008_generator_28_0100_0199 =
      ep_Q2_008_partial_28_0158 := by
  native_decide

/-- Coefficient term 159 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0159 : Poly :=
[
  term ((-72405142110364714179 : Rat) / 2771825814456705436) [(1, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 159 for generator 28. -/
def ep_Q2_008_partial_28_0159 : Poly :=
[
  term ((-72405142110364714179 : Rat) / 1385912907228352718) [(1, 1), (2, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((72405142110364714179 : Rat) / 2771825814456705436) [(1, 1), (2, 2), (12, 1), (13, 1), (16, 1)],
  term ((-72405142110364714179 : Rat) / 1385912907228352718) [(1, 1), (3, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((72405142110364714179 : Rat) / 2771825814456705436) [(1, 1), (3, 2), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 159 for generator 28. -/
theorem ep_Q2_008_partial_28_0159_valid :
    mulPoly ep_Q2_008_coefficient_28_0159
        ep_Q2_008_generator_28_0100_0199 =
      ep_Q2_008_partial_28_0159 := by
  native_decide

/-- Coefficient term 160 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0160 : Poly :=
[
  term ((12138364708928359441590006562299127142400 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 160 for generator 28. -/
def ep_Q2_008_partial_28_0160 : Poly :=
[
  term ((24276729417856718883180013124598254284800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-12138364708928359441590006562299127142400 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 2), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((24276729417856718883180013124598254284800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-12138364708928359441590006562299127142400 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 2), (12, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 160 for generator 28. -/
theorem ep_Q2_008_partial_28_0160_valid :
    mulPoly ep_Q2_008_coefficient_28_0160
        ep_Q2_008_generator_28_0100_0199 =
      ep_Q2_008_partial_28_0160 := by
  native_decide

/-- Coefficient term 161 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0161 : Poly :=
[
  term ((79297569806685134154494651197429641872175 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 161 for generator 28. -/
def ep_Q2_008_partial_28_0161 : Poly :=
[
  term ((158595139613370268308989302394859283744350 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-79297569806685134154494651197429641872175 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 2), (12, 1), (15, 1), (16, 1)],
  term ((158595139613370268308989302394859283744350 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 1), (12, 1), (15, 2), (16, 1)],
  term ((-79297569806685134154494651197429641872175 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 161 for generator 28. -/
theorem ep_Q2_008_partial_28_0161_valid :
    mulPoly ep_Q2_008_coefficient_28_0161
        ep_Q2_008_generator_28_0100_0199 =
      ep_Q2_008_partial_28_0161 := by
  native_decide

/-- Coefficient term 162 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0162 : Poly :=
[
  term ((63892801305851915029291942101720580800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 162 for generator 28. -/
def ep_Q2_008_partial_28_0162 : Poly :=
[
  term ((127785602611703830058583884203441161600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-63892801305851915029291942101720580800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 2), (12, 2), (15, 1), (16, 1)],
  term ((127785602611703830058583884203441161600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 1), (12, 2), (15, 2), (16, 1)],
  term ((-63892801305851915029291942101720580800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 2), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 162 for generator 28. -/
theorem ep_Q2_008_partial_28_0162_valid :
    mulPoly ep_Q2_008_coefficient_28_0162
        ep_Q2_008_generator_28_0100_0199 =
      ep_Q2_008_partial_28_0162 := by
  native_decide

/-- Coefficient term 163 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0163 : Poly :=
[
  term ((-13892821810816489305 : Rat) / 5543651628913410872) [(1, 1), (13, 1), (16, 1)]
]

/-- Partial product 163 for generator 28. -/
def ep_Q2_008_partial_28_0163 : Poly :=
[
  term ((-13892821810816489305 : Rat) / 2771825814456705436) [(1, 1), (2, 1), (13, 1), (14, 1), (16, 1)],
  term ((13892821810816489305 : Rat) / 5543651628913410872) [(1, 1), (2, 2), (13, 1), (16, 1)],
  term ((-13892821810816489305 : Rat) / 2771825814456705436) [(1, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((13892821810816489305 : Rat) / 5543651628913410872) [(1, 1), (3, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 163 for generator 28. -/
theorem ep_Q2_008_partial_28_0163_valid :
    mulPoly ep_Q2_008_coefficient_28_0163
        ep_Q2_008_generator_28_0100_0199 =
      ep_Q2_008_partial_28_0163 := by
  native_decide

/-- Coefficient term 164 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0164 : Poly :=
[
  term ((-614116119876911072916755983152224256000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 164 for generator 28. -/
def ep_Q2_008_partial_28_0164 : Poly :=
[
  term ((-1228232239753822145833511966304448512000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((614116119876911072916755983152224256000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 2), (13, 2), (15, 1), (16, 1)],
  term ((-1228232239753822145833511966304448512000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 1), (13, 2), (15, 2), (16, 1)],
  term ((614116119876911072916755983152224256000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 164 for generator 28. -/
theorem ep_Q2_008_partial_28_0164_valid :
    mulPoly ep_Q2_008_coefficient_28_0164
        ep_Q2_008_generator_28_0100_0199 =
      ep_Q2_008_partial_28_0164 := by
  native_decide

/-- Coefficient term 165 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0165 : Poly :=
[
  term ((94294178863210072668665399457243015378000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 165 for generator 28. -/
def ep_Q2_008_partial_28_0165 : Poly :=
[
  term ((188588357726420145337330798914486030756000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 1), (14, 1), (15, 1), (16, 1)],
  term ((-94294178863210072668665399457243015378000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 2), (15, 1), (16, 1)],
  term ((188588357726420145337330798914486030756000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 1), (15, 2), (16, 1)],
  term ((-94294178863210072668665399457243015378000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 165 for generator 28. -/
theorem ep_Q2_008_partial_28_0165_valid :
    mulPoly ep_Q2_008_coefficient_28_0165
        ep_Q2_008_generator_28_0100_0199 =
      ep_Q2_008_partial_28_0165 := by
  native_decide

/-- Coefficient term 166 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0166 : Poly :=
[
  term ((-669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 2), (4, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 166 for generator 28. -/
def ep_Q2_008_partial_28_0166 : Poly :=
[
  term ((-1339889716095078704545649417786671104000 : Rat) / 84353800925664757687870414129491527348999) [(1, 2), (2, 1), (4, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 2), (2, 2), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1339889716095078704545649417786671104000 : Rat) / 84353800925664757687870414129491527348999) [(1, 2), (3, 1), (4, 1), (13, 1), (15, 2), (16, 1)],
  term ((669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 2), (3, 2), (4, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 166 for generator 28. -/
theorem ep_Q2_008_partial_28_0166_valid :
    mulPoly ep_Q2_008_coefficient_28_0166
        ep_Q2_008_generator_28_0100_0199 =
      ep_Q2_008_partial_28_0166 := by
  native_decide

/-- Coefficient term 167 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0167 : Poly :=
[
  term ((-10455217405948258983 : Rat) / 2771825814456705436) [(1, 2), (4, 1), (16, 1)]
]

/-- Partial product 167 for generator 28. -/
def ep_Q2_008_partial_28_0167 : Poly :=
[
  term ((-10455217405948258983 : Rat) / 1385912907228352718) [(1, 2), (2, 1), (4, 1), (14, 1), (16, 1)],
  term ((10455217405948258983 : Rat) / 2771825814456705436) [(1, 2), (2, 2), (4, 1), (16, 1)],
  term ((-10455217405948258983 : Rat) / 1385912907228352718) [(1, 2), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((10455217405948258983 : Rat) / 2771825814456705436) [(1, 2), (3, 2), (4, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 167 for generator 28. -/
theorem ep_Q2_008_partial_28_0167_valid :
    mulPoly ep_Q2_008_coefficient_28_0167
        ep_Q2_008_generator_28_0100_0199 =
      ep_Q2_008_partial_28_0167 := by
  native_decide

/-- Coefficient term 168 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0168 : Poly :=
[
  term ((669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 168 for generator 28. -/
def ep_Q2_008_partial_28_0168 : Poly :=
[
  term ((1339889716095078704545649417786671104000 : Rat) / 84353800925664757687870414129491527348999) [(1, 2), (2, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 2), (2, 2), (13, 1), (15, 1), (16, 1)],
  term ((1339889716095078704545649417786671104000 : Rat) / 84353800925664757687870414129491527348999) [(1, 2), (3, 1), (13, 1), (15, 2), (16, 1)],
  term ((-669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 2), (3, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 168 for generator 28. -/
theorem ep_Q2_008_partial_28_0168_valid :
    mulPoly ep_Q2_008_coefficient_28_0168
        ep_Q2_008_generator_28_0100_0199 =
      ep_Q2_008_partial_28_0168 := by
  native_decide

/-- Coefficient term 169 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0169 : Poly :=
[
  term ((10455217405948258983 : Rat) / 2771825814456705436) [(1, 2), (16, 1)]
]

/-- Partial product 169 for generator 28. -/
def ep_Q2_008_partial_28_0169 : Poly :=
[
  term ((10455217405948258983 : Rat) / 1385912907228352718) [(1, 2), (2, 1), (14, 1), (16, 1)],
  term ((-10455217405948258983 : Rat) / 2771825814456705436) [(1, 2), (2, 2), (16, 1)],
  term ((10455217405948258983 : Rat) / 1385912907228352718) [(1, 2), (3, 1), (15, 1), (16, 1)],
  term ((-10455217405948258983 : Rat) / 2771825814456705436) [(1, 2), (3, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 169 for generator 28. -/
theorem ep_Q2_008_partial_28_0169_valid :
    mulPoly ep_Q2_008_coefficient_28_0169
        ep_Q2_008_generator_28_0100_0199 =
      ep_Q2_008_partial_28_0169 := by
  native_decide

/-- Coefficient term 170 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0170 : Poly :=
[
  term ((52208389534807899966554525138047200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 170 for generator 28. -/
def ep_Q2_008_partial_28_0170 : Poly :=
[
  term ((104416779069615799933109050276094400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (4, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-52208389534807899966554525138047200 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (3, 1), (4, 1), (6, 1), (15, 1), (16, 1)],
  term ((104416779069615799933109050276094400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (6, 1), (15, 2), (16, 1)],
  term ((-52208389534807899966554525138047200 : Rat) / 2908751756057405437512772901016949218931) [(3, 3), (4, 1), (6, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 170 for generator 28. -/
theorem ep_Q2_008_partial_28_0170_valid :
    mulPoly ep_Q2_008_coefficient_28_0170
        ep_Q2_008_generator_28_0100_0199 =
      ep_Q2_008_partial_28_0170 := by
  native_decide

/-- Coefficient term 171 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0171 : Poly :=
[
  term ((223948978242216779702029236506136000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 171 for generator 28. -/
def ep_Q2_008_partial_28_0171 : Poly :=
[
  term ((447897956484433559404058473012272000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (4, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-223948978242216779702029236506136000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (3, 1), (4, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((447897956484433559404058473012272000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-223948978242216779702029236506136000 : Rat) / 2908751756057405437512772901016949218931) [(3, 3), (4, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 171 for generator 28. -/
theorem ep_Q2_008_partial_28_0171_valid :
    mulPoly ep_Q2_008_coefficient_28_0171
        ep_Q2_008_generator_28_0100_0199 =
      ep_Q2_008_partial_28_0171 := by
  native_decide

/-- Coefficient term 172 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0172 : Poly :=
[
  term ((-100971410173581695630000908176000000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 1), (15, 2), (16, 1)]
]

/-- Partial product 172 for generator 28. -/
def ep_Q2_008_partial_28_0172 : Poly :=
[
  term ((-201942820347163391260001816352000000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (4, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((100971410173581695630000908176000000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (3, 1), (4, 1), (7, 1), (15, 2), (16, 1)],
  term ((-201942820347163391260001816352000000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (7, 1), (15, 3), (16, 1)],
  term ((100971410173581695630000908176000000 : Rat) / 2908751756057405437512772901016949218931) [(3, 3), (4, 1), (7, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 172 for generator 28. -/
theorem ep_Q2_008_partial_28_0172_valid :
    mulPoly ep_Q2_008_coefficient_28_0172
        ep_Q2_008_generator_28_0100_0199 =
      ep_Q2_008_partial_28_0172 := by
  native_decide

/-- Coefficient term 173 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0173 : Poly :=
[
  term ((83370814993305000 : Rat) / 692956453614176359) [(3, 1), (4, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 173 for generator 28. -/
def ep_Q2_008_partial_28_0173 : Poly :=
[
  term ((166741629986610000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (4, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-83370814993305000 : Rat) / 692956453614176359) [(2, 2), (3, 1), (4, 1), (10, 1), (11, 1), (16, 1)],
  term ((166741629986610000 : Rat) / 692956453614176359) [(3, 2), (4, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-83370814993305000 : Rat) / 692956453614176359) [(3, 3), (4, 1), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 173 for generator 28. -/
theorem ep_Q2_008_partial_28_0173_valid :
    mulPoly ep_Q2_008_coefficient_28_0173
        ep_Q2_008_generator_28_0100_0199 =
      ep_Q2_008_partial_28_0173 := by
  native_decide

/-- Coefficient term 174 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0174 : Poly :=
[
  term ((585129605779969875 : Rat) / 692956453614176359) [(3, 1), (4, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 174 for generator 28. -/
def ep_Q2_008_partial_28_0174 : Poly :=
[
  term ((1170259211559939750 : Rat) / 692956453614176359) [(2, 1), (3, 1), (4, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-585129605779969875 : Rat) / 692956453614176359) [(2, 2), (3, 1), (4, 1), (10, 1), (13, 1), (16, 1)],
  term ((1170259211559939750 : Rat) / 692956453614176359) [(3, 2), (4, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-585129605779969875 : Rat) / 692956453614176359) [(3, 3), (4, 1), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 174 for generator 28. -/
theorem ep_Q2_008_partial_28_0174_valid :
    mulPoly ep_Q2_008_coefficient_28_0174
        ep_Q2_008_generator_28_0100_0199 =
      ep_Q2_008_partial_28_0174 := by
  native_decide

/-- Coefficient term 175 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0175 : Poly :=
[
  term ((-478060622764964799693876234252168883200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 175 for generator 28. -/
def ep_Q2_008_partial_28_0175 : Poly :=
[
  term ((-956121245529929599387752468504337766400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (4, 1), (10, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((478060622764964799693876234252168883200 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (3, 1), (4, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-956121245529929599387752468504337766400 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((478060622764964799693876234252168883200 : Rat) / 84353800925664757687870414129491527348999) [(3, 3), (4, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 175 for generator 28. -/
theorem ep_Q2_008_partial_28_0175_valid :
    mulPoly ep_Q2_008_coefficient_28_0175
        ep_Q2_008_generator_28_0100_0199 =
      ep_Q2_008_partial_28_0175 := by
  native_decide

/-- Coefficient term 176 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0176 : Poly :=
[
  term ((-29288232546467947710010875230829295141800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 176 for generator 28. -/
def ep_Q2_008_partial_28_0176 : Poly :=
[
  term ((-58576465092935895420021750461658590283600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (4, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((29288232546467947710010875230829295141800 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (3, 1), (4, 1), (10, 1), (15, 1), (16, 1)],
  term ((-58576465092935895420021750461658590283600 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (10, 1), (15, 2), (16, 1)],
  term ((29288232546467947710010875230829295141800 : Rat) / 84353800925664757687870414129491527348999) [(3, 3), (4, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 176 for generator 28. -/
theorem ep_Q2_008_partial_28_0176_valid :
    mulPoly ep_Q2_008_coefficient_28_0176
        ep_Q2_008_generator_28_0100_0199 =
      ep_Q2_008_partial_28_0176 := by
  native_decide

/-- Coefficient term 177 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0177 : Poly :=
[
  term ((-160786571772802500 : Rat) / 692956453614176359) [(3, 1), (4, 1), (11, 1), (16, 1)]
]

/-- Partial product 177 for generator 28. -/
def ep_Q2_008_partial_28_0177 : Poly :=
[
  term ((-321573143545605000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (4, 1), (11, 1), (14, 1), (16, 1)],
  term ((160786571772802500 : Rat) / 692956453614176359) [(2, 2), (3, 1), (4, 1), (11, 1), (16, 1)],
  term ((-321573143545605000 : Rat) / 692956453614176359) [(3, 2), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((160786571772802500 : Rat) / 692956453614176359) [(3, 3), (4, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 177 for generator 28. -/
theorem ep_Q2_008_partial_28_0177_valid :
    mulPoly ep_Q2_008_coefficient_28_0177
        ep_Q2_008_generator_28_0100_0199 =
      ep_Q2_008_partial_28_0177 := by
  native_decide

/-- Coefficient term 178 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0178 : Poly :=
[
  term ((244293712003370549631544627149109440000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 178 for generator 28. -/
def ep_Q2_008_partial_28_0178 : Poly :=
[
  term ((488587424006741099263089254298218880000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (4, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-244293712003370549631544627149109440000 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (3, 1), (4, 1), (13, 1), (15, 2), (16, 1)],
  term ((488587424006741099263089254298218880000 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (13, 1), (15, 3), (16, 1)],
  term ((-244293712003370549631544627149109440000 : Rat) / 84353800925664757687870414129491527348999) [(3, 3), (4, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 178 for generator 28. -/
theorem ep_Q2_008_partial_28_0178_valid :
    mulPoly ep_Q2_008_coefficient_28_0178
        ep_Q2_008_generator_28_0100_0199 =
      ep_Q2_008_partial_28_0178 := by
  native_decide

/-- Coefficient term 179 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0179 : Poly :=
[
  term ((260380121147735517 : Rat) / 692956453614176359) [(3, 1), (4, 1), (13, 1), (16, 1)]
]

/-- Partial product 179 for generator 28. -/
def ep_Q2_008_partial_28_0179 : Poly :=
[
  term ((520760242295471034 : Rat) / 692956453614176359) [(2, 1), (3, 1), (4, 1), (13, 1), (14, 1), (16, 1)],
  term ((-260380121147735517 : Rat) / 692956453614176359) [(2, 2), (3, 1), (4, 1), (13, 1), (16, 1)],
  term ((520760242295471034 : Rat) / 692956453614176359) [(3, 2), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-260380121147735517 : Rat) / 692956453614176359) [(3, 3), (4, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 179 for generator 28. -/
theorem ep_Q2_008_partial_28_0179_valid :
    mulPoly ep_Q2_008_coefficient_28_0179
        ep_Q2_008_generator_28_0100_0199 =
      ep_Q2_008_partial_28_0179 := by
  native_decide

/-- Coefficient term 180 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0180 : Poly :=
[
  term ((195570254767485599874767550375887270400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 180 for generator 28. -/
def ep_Q2_008_partial_28_0180 : Poly :=
[
  term ((391140509534971199749535100751774540800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (4, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-195570254767485599874767550375887270400 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (3, 1), (4, 1), (13, 2), (15, 1), (16, 1)],
  term ((391140509534971199749535100751774540800 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (13, 2), (15, 2), (16, 1)],
  term ((-195570254767485599874767550375887270400 : Rat) / 84353800925664757687870414129491527348999) [(3, 3), (4, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 180 for generator 28. -/
theorem ep_Q2_008_partial_28_0180_valid :
    mulPoly ep_Q2_008_coefficient_28_0180
        ep_Q2_008_generator_28_0100_0199 =
      ep_Q2_008_partial_28_0180 := by
  native_decide

/-- Coefficient term 181 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0181 : Poly :=
[
  term ((221310177648892921726565076787661981322263 : Rat) / 168707601851329515375740828258983054697998) [(3, 1), (4, 1), (15, 1), (16, 1)]
]

/-- Partial product 181 for generator 28. -/
def ep_Q2_008_partial_28_0181 : Poly :=
[
  term ((221310177648892921726565076787661981322263 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (4, 1), (14, 1), (15, 1), (16, 1)],
  term ((-221310177648892921726565076787661981322263 : Rat) / 168707601851329515375740828258983054697998) [(2, 2), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((221310177648892921726565076787661981322263 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (15, 2), (16, 1)],
  term ((-221310177648892921726565076787661981322263 : Rat) / 168707601851329515375740828258983054697998) [(3, 3), (4, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 181 for generator 28. -/
theorem ep_Q2_008_partial_28_0181_valid :
    mulPoly ep_Q2_008_coefficient_28_0181
        ep_Q2_008_generator_28_0100_0199 =
      ep_Q2_008_partial_28_0181 := by
  native_decide

/-- Coefficient term 182 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0182 : Poly :=
[
  term ((-839032029978394458007055546579289600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 182 for generator 28. -/
def ep_Q2_008_partial_28_0182 : Poly :=
[
  term ((-1678064059956788916014111093158579200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (6, 1), (7, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((839032029978394458007055546579289600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (3, 1), (5, 1), (6, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1678064059956788916014111093158579200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (6, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((839032029978394458007055546579289600 : Rat) / 2908751756057405437512772901016949218931) [(3, 3), (5, 1), (6, 1), (7, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 182 for generator 28. -/
theorem ep_Q2_008_partial_28_0182_valid :
    mulPoly ep_Q2_008_coefficient_28_0182
        ep_Q2_008_generator_28_0100_0199 =
      ep_Q2_008_partial_28_0182 := by
  native_decide

/-- Coefficient term 183 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0183 : Poly :=
[
  term ((-1898262511263335877844017073708800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 183 for generator 28. -/
def ep_Q2_008_partial_28_0183 : Poly :=
[
  term ((-3796525022526671755688034147417600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (6, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((1898262511263335877844017073708800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (3, 1), (5, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-3796525022526671755688034147417600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (6, 1), (7, 1), (15, 2), (16, 1)],
  term ((1898262511263335877844017073708800 : Rat) / 2908751756057405437512772901016949218931) [(3, 3), (5, 1), (6, 1), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 183 for generator 28. -/
theorem ep_Q2_008_partial_28_0183_valid :
    mulPoly ep_Q2_008_coefficient_28_0183
        ep_Q2_008_generator_28_0100_0199 =
      ep_Q2_008_partial_28_0183 := by
  native_decide

/-- Coefficient term 184 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0184 : Poly :=
[
  term ((-139931639360558863662 : Rat) / 692956453614176359) [(3, 1), (5, 1), (6, 1), (13, 2), (16, 1)]
]

/-- Partial product 184 for generator 28. -/
def ep_Q2_008_partial_28_0184 : Poly :=
[
  term ((-279863278721117727324 : Rat) / 692956453614176359) [(2, 1), (3, 1), (5, 1), (6, 1), (13, 2), (14, 1), (16, 1)],
  term ((139931639360558863662 : Rat) / 692956453614176359) [(2, 2), (3, 1), (5, 1), (6, 1), (13, 2), (16, 1)],
  term ((-279863278721117727324 : Rat) / 692956453614176359) [(3, 2), (5, 1), (6, 1), (13, 2), (15, 1), (16, 1)],
  term ((139931639360558863662 : Rat) / 692956453614176359) [(3, 3), (5, 1), (6, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 184 for generator 28. -/
theorem ep_Q2_008_partial_28_0184_valid :
    mulPoly ep_Q2_008_coefficient_28_0184
        ep_Q2_008_generator_28_0100_0199 =
      ep_Q2_008_partial_28_0184 := by
  native_decide

/-- Coefficient term 185 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0185 : Poly :=
[
  term ((56896654193307968277 : Rat) / 5543651628913410872) [(3, 1), (5, 1), (6, 1), (16, 1)]
]

/-- Partial product 185 for generator 28. -/
def ep_Q2_008_partial_28_0185 : Poly :=
[
  term ((56896654193307968277 : Rat) / 2771825814456705436) [(2, 1), (3, 1), (5, 1), (6, 1), (14, 1), (16, 1)],
  term ((-56896654193307968277 : Rat) / 5543651628913410872) [(2, 2), (3, 1), (5, 1), (6, 1), (16, 1)],
  term ((56896654193307968277 : Rat) / 2771825814456705436) [(3, 2), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-56896654193307968277 : Rat) / 5543651628913410872) [(3, 3), (5, 1), (6, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 185 for generator 28. -/
theorem ep_Q2_008_partial_28_0185_valid :
    mulPoly ep_Q2_008_coefficient_28_0185
        ep_Q2_008_generator_28_0100_0199 =
      ep_Q2_008_partial_28_0185 := by
  native_decide

/-- Coefficient term 186 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0186 : Poly :=
[
  term ((129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 186 for generator 28. -/
def ep_Q2_008_partial_28_0186 : Poly :=
[
  term ((258163701531813679386786322024396800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (7, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (3, 1), (5, 1), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((258163701531813679386786322024396800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(3, 3), (5, 1), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 186 for generator 28. -/
theorem ep_Q2_008_partial_28_0186_valid :
    mulPoly ep_Q2_008_coefficient_28_0186
        ep_Q2_008_generator_28_0100_0199 =
      ep_Q2_008_partial_28_0186 := by
  native_decide

/-- Coefficient term 187 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0187 : Poly :=
[
  term ((-187343476340620962312966240595396800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 187 for generator 28. -/
def ep_Q2_008_partial_28_0187 : Poly :=
[
  term ((-374686952681241924625932481190793600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((187343476340620962312966240595396800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (3, 1), (5, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-374686952681241924625932481190793600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((187343476340620962312966240595396800 : Rat) / 2908751756057405437512772901016949218931) [(3, 3), (5, 1), (7, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 187 for generator 28. -/
theorem ep_Q2_008_partial_28_0187_valid :
    mulPoly ep_Q2_008_coefficient_28_0187
        ep_Q2_008_generator_28_0100_0199 =
      ep_Q2_008_partial_28_0187 := by
  native_decide

/-- Coefficient term 188 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0188 : Poly :=
[
  term ((-282248748571885366517729205321312000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 188 for generator 28. -/
def ep_Q2_008_partial_28_0188 : Poly :=
[
  term ((-564497497143770733035458410642624000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((282248748571885366517729205321312000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (3, 1), (5, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-564497497143770733035458410642624000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 1), (13, 1), (15, 3), (16, 1)],
  term ((282248748571885366517729205321312000 : Rat) / 2908751756057405437512772901016949218931) [(3, 3), (5, 1), (7, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 188 for generator 28. -/
theorem ep_Q2_008_partial_28_0188_valid :
    mulPoly ep_Q2_008_coefficient_28_0188
        ep_Q2_008_generator_28_0100_0199 =
      ep_Q2_008_partial_28_0188 := by
  native_decide

/-- Coefficient term 189 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0189 : Poly :=
[
  term ((13103027335976839924249781458671334179458940 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (7, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 189 for generator 28. -/
def ep_Q2_008_partial_28_0189 : Poly :=
[
  term ((26206054671953679848499562917342668358917880 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (5, 1), (7, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-13103027335976839924249781458671334179458940 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (3, 1), (5, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((26206054671953679848499562917342668358917880 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (5, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((-13103027335976839924249781458671334179458940 : Rat) / 84353800925664757687870414129491527348999) [(3, 3), (5, 1), (7, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 189 for generator 28. -/
theorem ep_Q2_008_partial_28_0189_valid :
    mulPoly ep_Q2_008_coefficient_28_0189
        ep_Q2_008_generator_28_0100_0199 =
      ep_Q2_008_partial_28_0189 := by
  native_decide

/-- Coefficient term 190 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0190 : Poly :=
[
  term ((-645409253829534198466965805060992000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (13, 2), (15, 3), (16, 1)]
]

/-- Partial product 190 for generator 28. -/
def ep_Q2_008_partial_28_0190 : Poly :=
[
  term ((-1290818507659068396933931610121984000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (7, 1), (13, 2), (14, 1), (15, 3), (16, 1)],
  term ((645409253829534198466965805060992000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (3, 1), (5, 1), (7, 1), (13, 2), (15, 3), (16, 1)],
  term ((-1290818507659068396933931610121984000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 1), (13, 2), (15, 4), (16, 1)],
  term ((645409253829534198466965805060992000 : Rat) / 2908751756057405437512772901016949218931) [(3, 3), (5, 1), (7, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 190 for generator 28. -/
theorem ep_Q2_008_partial_28_0190_valid :
    mulPoly ep_Q2_008_coefficient_28_0190
        ep_Q2_008_generator_28_0100_0199 =
      ep_Q2_008_partial_28_0190 := by
  native_decide

/-- Coefficient term 191 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0191 : Poly :=
[
  term ((610405667368067093461434956435154332063949 : Rat) / 337415203702659030751481656517966109395996) [(3, 1), (5, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 191 for generator 28. -/
def ep_Q2_008_partial_28_0191 : Poly :=
[
  term ((610405667368067093461434956435154332063949 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (3, 1), (5, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-610405667368067093461434956435154332063949 : Rat) / 337415203702659030751481656517966109395996) [(2, 2), (3, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((610405667368067093461434956435154332063949 : Rat) / 168707601851329515375740828258983054697998) [(3, 2), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((-610405667368067093461434956435154332063949 : Rat) / 337415203702659030751481656517966109395996) [(3, 3), (5, 1), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 191 for generator 28. -/
theorem ep_Q2_008_partial_28_0191_valid :
    mulPoly ep_Q2_008_coefficient_28_0191
        ep_Q2_008_generator_28_0100_0199 =
      ep_Q2_008_partial_28_0191 := by
  native_decide

/-- Coefficient term 192 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0192 : Poly :=
[
  term ((194619027395906265603639083812300800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (15, 3), (16, 1)]
]

/-- Partial product 192 for generator 28. -/
def ep_Q2_008_partial_28_0192 : Poly :=
[
  term ((389238054791812531207278167624601600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (7, 1), (14, 1), (15, 3), (16, 1)],
  term ((-194619027395906265603639083812300800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (3, 1), (5, 1), (7, 1), (15, 3), (16, 1)],
  term ((389238054791812531207278167624601600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 1), (15, 4), (16, 1)],
  term ((-194619027395906265603639083812300800 : Rat) / 2908751756057405437512772901016949218931) [(3, 3), (5, 1), (7, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 192 for generator 28. -/
theorem ep_Q2_008_partial_28_0192_valid :
    mulPoly ep_Q2_008_coefficient_28_0192
        ep_Q2_008_generator_28_0100_0199 =
      ep_Q2_008_partial_28_0192 := by
  native_decide

/-- Coefficient term 193 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0193 : Poly :=
[
  term ((645409253829534198466965805060992000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 2), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 193 for generator 28. -/
def ep_Q2_008_partial_28_0193 : Poly :=
[
  term ((1290818507659068396933931610121984000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (7, 2), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-645409253829534198466965805060992000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (3, 1), (5, 1), (7, 2), (13, 2), (15, 2), (16, 1)],
  term ((1290818507659068396933931610121984000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 2), (13, 2), (15, 3), (16, 1)],
  term ((-645409253829534198466965805060992000 : Rat) / 2908751756057405437512772901016949218931) [(3, 3), (5, 1), (7, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 193 for generator 28. -/
theorem ep_Q2_008_partial_28_0193_valid :
    mulPoly ep_Q2_008_coefficient_28_0193
        ep_Q2_008_generator_28_0100_0199 =
      ep_Q2_008_partial_28_0193 := by
  native_decide

/-- Coefficient term 194 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0194 : Poly :=
[
  term ((11389575067580015267064102442252800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 2), (15, 2), (16, 1)]
]

/-- Partial product 194 for generator 28. -/
def ep_Q2_008_partial_28_0194 : Poly :=
[
  term ((22779150135160030534128204884505600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (7, 2), (14, 1), (15, 2), (16, 1)],
  term ((-11389575067580015267064102442252800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (3, 1), (5, 1), (7, 2), (15, 2), (16, 1)],
  term ((22779150135160030534128204884505600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 2), (15, 3), (16, 1)],
  term ((-11389575067580015267064102442252800 : Rat) / 2908751756057405437512772901016949218931) [(3, 3), (5, 1), (7, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 194 for generator 28. -/
theorem ep_Q2_008_partial_28_0194_valid :
    mulPoly ep_Q2_008_coefficient_28_0194
        ep_Q2_008_generator_28_0100_0199 =
      ep_Q2_008_partial_28_0194 := by
  native_decide

/-- Coefficient term 195 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0195 : Poly :=
[
  term ((-385887772254726000 : Rat) / 692956453614176359) [(3, 1), (5, 1), (10, 1), (12, 1), (16, 1)]
]

/-- Partial product 195 for generator 28. -/
def ep_Q2_008_partial_28_0195 : Poly :=
[
  term ((-771775544509452000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (5, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((385887772254726000 : Rat) / 692956453614176359) [(2, 2), (3, 1), (5, 1), (10, 1), (12, 1), (16, 1)],
  term ((-771775544509452000 : Rat) / 692956453614176359) [(3, 2), (5, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((385887772254726000 : Rat) / 692956453614176359) [(3, 3), (5, 1), (10, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 195 for generator 28. -/
theorem ep_Q2_008_partial_28_0195_valid :
    mulPoly ep_Q2_008_coefficient_28_0195
        ep_Q2_008_generator_28_0100_0199 =
      ep_Q2_008_partial_28_0195 := by
  native_decide

/-- Coefficient term 196 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0196 : Poly :=
[
  term ((385887772254726000 : Rat) / 692956453614176359) [(3, 1), (5, 1), (10, 1), (16, 1)]
]

/-- Partial product 196 for generator 28. -/
def ep_Q2_008_partial_28_0196 : Poly :=
[
  term ((771775544509452000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (5, 1), (10, 1), (14, 1), (16, 1)],
  term ((-385887772254726000 : Rat) / 692956453614176359) [(2, 2), (3, 1), (5, 1), (10, 1), (16, 1)],
  term ((771775544509452000 : Rat) / 692956453614176359) [(3, 2), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((-385887772254726000 : Rat) / 692956453614176359) [(3, 3), (5, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 196 for generator 28. -/
theorem ep_Q2_008_partial_28_0196_valid :
    mulPoly ep_Q2_008_coefficient_28_0196
        ep_Q2_008_generator_28_0100_0199 =
      ep_Q2_008_partial_28_0196 := by
  native_decide

/-- Coefficient term 197 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0197 : Poly :=
[
  term ((92050785676708875 : Rat) / 692956453614176359) [(3, 1), (5, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 197 for generator 28. -/
def ep_Q2_008_partial_28_0197 : Poly :=
[
  term ((184101571353417750 : Rat) / 692956453614176359) [(2, 1), (3, 1), (5, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-92050785676708875 : Rat) / 692956453614176359) [(2, 2), (3, 1), (5, 1), (11, 1), (13, 1), (16, 1)],
  term ((184101571353417750 : Rat) / 692956453614176359) [(3, 2), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-92050785676708875 : Rat) / 692956453614176359) [(3, 3), (5, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 197 for generator 28. -/
theorem ep_Q2_008_partial_28_0197_valid :
    mulPoly ep_Q2_008_coefficient_28_0197
        ep_Q2_008_generator_28_0100_0199 =
      ep_Q2_008_partial_28_0197 := by
  native_decide

/-- Coefficient term 198 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0198 : Poly :=
[
  term ((-478060622764964799693876234252168883200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 198 for generator 28. -/
def ep_Q2_008_partial_28_0198 : Poly :=
[
  term ((-956121245529929599387752468504337766400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (5, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((478060622764964799693876234252168883200 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (3, 1), (5, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-956121245529929599387752468504337766400 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (5, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((478060622764964799693876234252168883200 : Rat) / 84353800925664757687870414129491527348999) [(3, 3), (5, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 198 for generator 28. -/
theorem ep_Q2_008_partial_28_0198_valid :
    mulPoly ep_Q2_008_coefficient_28_0198
        ep_Q2_008_generator_28_0100_0199 =
      ep_Q2_008_partial_28_0198 := by
  native_decide

/-- Coefficient term 199 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0199 : Poly :=
[
  term ((-29288232546467947710010875230829295141800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 199 for generator 28. -/
def ep_Q2_008_partial_28_0199 : Poly :=
[
  term ((-58576465092935895420021750461658590283600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (5, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((29288232546467947710010875230829295141800 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (3, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((-58576465092935895420021750461658590283600 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (5, 1), (11, 1), (15, 2), (16, 1)],
  term ((29288232546467947710010875230829295141800 : Rat) / 84353800925664757687870414129491527348999) [(3, 3), (5, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 199 for generator 28. -/
theorem ep_Q2_008_partial_28_0199_valid :
    mulPoly ep_Q2_008_coefficient_28_0199
        ep_Q2_008_generator_28_0100_0199 =
      ep_Q2_008_partial_28_0199 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_008_partials_28_0100_0199 : List Poly :=
[
  ep_Q2_008_partial_28_0100,
  ep_Q2_008_partial_28_0101,
  ep_Q2_008_partial_28_0102,
  ep_Q2_008_partial_28_0103,
  ep_Q2_008_partial_28_0104,
  ep_Q2_008_partial_28_0105,
  ep_Q2_008_partial_28_0106,
  ep_Q2_008_partial_28_0107,
  ep_Q2_008_partial_28_0108,
  ep_Q2_008_partial_28_0109,
  ep_Q2_008_partial_28_0110,
  ep_Q2_008_partial_28_0111,
  ep_Q2_008_partial_28_0112,
  ep_Q2_008_partial_28_0113,
  ep_Q2_008_partial_28_0114,
  ep_Q2_008_partial_28_0115,
  ep_Q2_008_partial_28_0116,
  ep_Q2_008_partial_28_0117,
  ep_Q2_008_partial_28_0118,
  ep_Q2_008_partial_28_0119,
  ep_Q2_008_partial_28_0120,
  ep_Q2_008_partial_28_0121,
  ep_Q2_008_partial_28_0122,
  ep_Q2_008_partial_28_0123,
  ep_Q2_008_partial_28_0124,
  ep_Q2_008_partial_28_0125,
  ep_Q2_008_partial_28_0126,
  ep_Q2_008_partial_28_0127,
  ep_Q2_008_partial_28_0128,
  ep_Q2_008_partial_28_0129,
  ep_Q2_008_partial_28_0130,
  ep_Q2_008_partial_28_0131,
  ep_Q2_008_partial_28_0132,
  ep_Q2_008_partial_28_0133,
  ep_Q2_008_partial_28_0134,
  ep_Q2_008_partial_28_0135,
  ep_Q2_008_partial_28_0136,
  ep_Q2_008_partial_28_0137,
  ep_Q2_008_partial_28_0138,
  ep_Q2_008_partial_28_0139,
  ep_Q2_008_partial_28_0140,
  ep_Q2_008_partial_28_0141,
  ep_Q2_008_partial_28_0142,
  ep_Q2_008_partial_28_0143,
  ep_Q2_008_partial_28_0144,
  ep_Q2_008_partial_28_0145,
  ep_Q2_008_partial_28_0146,
  ep_Q2_008_partial_28_0147,
  ep_Q2_008_partial_28_0148,
  ep_Q2_008_partial_28_0149,
  ep_Q2_008_partial_28_0150,
  ep_Q2_008_partial_28_0151,
  ep_Q2_008_partial_28_0152,
  ep_Q2_008_partial_28_0153,
  ep_Q2_008_partial_28_0154,
  ep_Q2_008_partial_28_0155,
  ep_Q2_008_partial_28_0156,
  ep_Q2_008_partial_28_0157,
  ep_Q2_008_partial_28_0158,
  ep_Q2_008_partial_28_0159,
  ep_Q2_008_partial_28_0160,
  ep_Q2_008_partial_28_0161,
  ep_Q2_008_partial_28_0162,
  ep_Q2_008_partial_28_0163,
  ep_Q2_008_partial_28_0164,
  ep_Q2_008_partial_28_0165,
  ep_Q2_008_partial_28_0166,
  ep_Q2_008_partial_28_0167,
  ep_Q2_008_partial_28_0168,
  ep_Q2_008_partial_28_0169,
  ep_Q2_008_partial_28_0170,
  ep_Q2_008_partial_28_0171,
  ep_Q2_008_partial_28_0172,
  ep_Q2_008_partial_28_0173,
  ep_Q2_008_partial_28_0174,
  ep_Q2_008_partial_28_0175,
  ep_Q2_008_partial_28_0176,
  ep_Q2_008_partial_28_0177,
  ep_Q2_008_partial_28_0178,
  ep_Q2_008_partial_28_0179,
  ep_Q2_008_partial_28_0180,
  ep_Q2_008_partial_28_0181,
  ep_Q2_008_partial_28_0182,
  ep_Q2_008_partial_28_0183,
  ep_Q2_008_partial_28_0184,
  ep_Q2_008_partial_28_0185,
  ep_Q2_008_partial_28_0186,
  ep_Q2_008_partial_28_0187,
  ep_Q2_008_partial_28_0188,
  ep_Q2_008_partial_28_0189,
  ep_Q2_008_partial_28_0190,
  ep_Q2_008_partial_28_0191,
  ep_Q2_008_partial_28_0192,
  ep_Q2_008_partial_28_0193,
  ep_Q2_008_partial_28_0194,
  ep_Q2_008_partial_28_0195,
  ep_Q2_008_partial_28_0196,
  ep_Q2_008_partial_28_0197,
  ep_Q2_008_partial_28_0198,
  ep_Q2_008_partial_28_0199
]

/-- Sum of partial products in this block. -/
def ep_Q2_008_block_28_0100_0199 : Poly :=
[
  term ((87320075518113450380824785390604800 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (2, 1), (5, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-12113105612672266983 : Rat) / 1385912907228352718) [(1, 1), (2, 1), (5, 1), (8, 1), (14, 1), (16, 1)],
  term ((11741509980130678983 : Rat) / 1385912907228352718) [(1, 1), (2, 1), (5, 1), (10, 1), (14, 1), (16, 1)],
  term ((-2679779432190157409091298835573342208000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 1), (5, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-129167667102054335688 : Rat) / 692956453614176359) [(1, 1), (2, 1), (5, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((7400323832412329337 : Rat) / 692956453614176359) [(1, 1), (2, 1), (5, 1), (12, 1), (14, 1), (16, 1)],
  term ((1339889716095078704545649417786671104000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 1), (5, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1879933578065458983 : Rat) / 2771825814456705436) [(1, 1), (2, 1), (5, 1), (14, 1), (16, 1)],
  term ((156546074333121060904753408036070400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (2, 1), (6, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2189633911586289738 : Rat) / 692956453614176359) [(1, 1), (2, 1), (6, 1), (7, 1), (13, 2), (14, 1), (16, 1)],
  term ((-44240825310375167103676157919130752000 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (2, 1), (6, 1), (7, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-9249340331398466862 : Rat) / 692956453614176359) [(1, 1), (2, 1), (6, 1), (7, 1), (14, 1), (16, 1)],
  term ((-1218442200846645037506346959141427200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (2, 1), (6, 1), (7, 2), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-86673858493002527528792779578278400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (2, 1), (6, 1), (7, 2), (14, 1), (15, 1), (16, 1)],
  term ((597518386907264827702789605229191168000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 1), (6, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-13891959801170136000 : Rat) / 692956453614176359) [(1, 1), (2, 1), (6, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-6670395561478076422635316524709288665600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 1), (6, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-28587322282435344000 : Rat) / 692956453614176359) [(1, 1), (2, 1), (6, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-2366596089097314813815965124265084211200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (2, 1), (6, 1), (11, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-3615781793256984375 : Rat) / 692956453614176359) [(1, 1), (2, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((42431773473488679047406498971168020933200 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 1), (6, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1074892332814830418378796359456081536000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 1), (6, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((34948521996319132920 : Rat) / 692956453614176359) [(1, 1), (2, 1), (6, 1), (13, 1), (14, 1), (16, 1)],
  term ((-23383469607126666413482913512740473548800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 1), (6, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-144098141179600298191659200041166077620150 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-43626810247303208702812078181626403269200 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 1), (6, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1029034059345936000 : Rat) / 692956453614176359) [(1, 1), (2, 1), (7, 1), (10, 1), (14, 1), (16, 1)],
  term ((-156546074333121060904753408036070400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (2, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((2189633911586289738 : Rat) / 692956453614176359) [(1, 1), (2, 1), (7, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((44240825310375167103676157919130752000 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (2, 1), (7, 1), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((10792891420417370862 : Rat) / 692956453614176359) [(1, 1), (2, 1), (7, 1), (12, 1), (14, 1), (16, 1)],
  term ((245749114116084420436745802180072303648000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((3385937525807834023649141096298749952000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((2058068118691872000 : Rat) / 692956453614176359) [(1, 1), (2, 1), (7, 1), (14, 1), (16, 1)],
  term ((1218442200846645037506346959141427200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (2, 1), (7, 2), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((86673858493002527528792779578278400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (2, 1), (7, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((120424510545885000 : Rat) / 692956453614176359) [(1, 1), (2, 1), (8, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 1), (8, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((201148632999720000 : Rat) / 692956453614176359) [(1, 1), (2, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((-529977594782371306301011299991378665600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((9497299241309471661 : Rat) / 1385912907228352718) [(1, 1), (2, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((223314952682513117424274902964445184000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 1), (8, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-67540792124893521401778305237812502400 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-771775544509452000 : Rat) / 692956453614176359) [(1, 1), (2, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((-95280931420920000 : Rat) / 692956453614176359) [(1, 1), (2, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((609797961093888000 : Rat) / 692956453614176359) [(1, 1), (2, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((16979061979207944000 : Rat) / 692956453614176359) [(1, 1), (2, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-67073256219842447548574157048508348465200 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-19716523940061682983 : Rat) / 1385912907228352718) [(1, 1), (2, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1339889716095078704545649417786671104000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 1), (10, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((75237268061720671570284573122389573522200 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((8010285277573155127180965942495959769600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((28587322282435344000 : Rat) / 692956453614176359) [(1, 1), (2, 1), (11, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((2366596089097314813815965124265084211200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (2, 1), (11, 1), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((17790002001501557733 : Rat) / 1385912907228352718) [(1, 1), (2, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-86017507532775000 : Rat) / 692956453614176359) [(1, 1), (2, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((-1674862145118848380682061772233338880000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-12609228129195918483 : Rat) / 1385912907228352718) [(1, 1), (2, 1), (11, 1), (14, 1), (16, 1)],
  term ((1074892332814830418378796359456081536000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-72405142110364714179 : Rat) / 1385912907228352718) [(1, 1), (2, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((24276729417856718883180013124598254284800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((158595139613370268308989302394859283744350 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((127785602611703830058583884203441161600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-13892821810816489305 : Rat) / 2771825814456705436) [(1, 1), (2, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1228232239753822145833511966304448512000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((188588357726420145337330798914486030756000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 1), (14, 1), (15, 1), (16, 1)],
  term ((-43660037759056725190412392695302400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (2, 2), (5, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((12113105612672266983 : Rat) / 2771825814456705436) [(1, 1), (2, 2), (5, 1), (8, 1), (16, 1)],
  term ((-11741509980130678983 : Rat) / 2771825814456705436) [(1, 1), (2, 2), (5, 1), (10, 1), (16, 1)],
  term ((1339889716095078704545649417786671104000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 2), (5, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((64583833551027167844 : Rat) / 692956453614176359) [(1, 1), (2, 2), (5, 1), (12, 1), (13, 2), (16, 1)],
  term ((-7400323832412329337 : Rat) / 1385912907228352718) [(1, 1), (2, 2), (5, 1), (12, 1), (16, 1)],
  term ((-669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 2), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((1879933578065458983 : Rat) / 5543651628913410872) [(1, 1), (2, 2), (5, 1), (16, 1)],
  term ((-78273037166560530452376704018035200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (2, 2), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((1094816955793144869 : Rat) / 692956453614176359) [(1, 1), (2, 2), (6, 1), (7, 1), (13, 2), (16, 1)],
  term ((22120412655187583551838078959565376000 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (2, 2), (6, 1), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((4624670165699233431 : Rat) / 692956453614176359) [(1, 1), (2, 2), (6, 1), (7, 1), (16, 1)],
  term ((609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (2, 2), (6, 1), (7, 2), (13, 2), (15, 1), (16, 1)],
  term ((43336929246501263764396389789139200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (2, 2), (6, 1), (7, 2), (15, 1), (16, 1)],
  term ((-298759193453632413851394802614595584000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 2), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((6945979900585068000 : Rat) / 692956453614176359) [(1, 1), (2, 2), (6, 1), (10, 1), (13, 1), (16, 1)],
  term ((3335197780739038211317658262354644332800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 2), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((14293661141217672000 : Rat) / 692956453614176359) [(1, 1), (2, 2), (6, 1), (11, 1), (13, 2), (16, 1)],
  term ((1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (2, 2), (6, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((3615781793256984375 : Rat) / 1385912907228352718) [(1, 1), (2, 2), (6, 1), (11, 1), (16, 1)],
  term ((-21215886736744339523703249485584010466600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 2), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((537446166407415209189398179728040768000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 2), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((-17474260998159566460 : Rat) / 692956453614176359) [(1, 1), (2, 2), (6, 1), (13, 1), (16, 1)],
  term ((11691734803563333206741456756370236774400 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 2), (6, 1), (13, 2), (15, 1), (16, 1)],
  term ((72049070589800149095829600020583038810075 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 2), (6, 1), (15, 1), (16, 1)],
  term ((21813405123651604351406039090813201634600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 2), (6, 2), (15, 1), (16, 1)],
  term ((514517029672968000 : Rat) / 692956453614176359) [(1, 1), (2, 2), (7, 1), (10, 1), (16, 1)],
  term ((78273037166560530452376704018035200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (2, 2), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1094816955793144869 : Rat) / 692956453614176359) [(1, 1), (2, 2), (7, 1), (12, 1), (13, 2), (16, 1)],
  term ((-22120412655187583551838078959565376000 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (2, 2), (7, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-5396445710208685431 : Rat) / 692956453614176359) [(1, 1), (2, 2), (7, 1), (12, 1), (16, 1)],
  term ((-122874557058042210218372901090036151824000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 2), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1692968762903917011824570548149374976000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 2), (7, 1), (15, 2), (16, 1)],
  term ((-1029034059345936000 : Rat) / 692956453614176359) [(1, 1), (2, 2), (7, 1), (16, 1)],
  term ((-609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (2, 2), (7, 2), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-43336929246501263764396389789139200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (2, 2), (7, 2), (12, 1), (15, 1), (16, 1)],
  term ((-60212255272942500 : Rat) / 692956453614176359) [(1, 1), (2, 2), (8, 1), (11, 1), (12, 1), (16, 1)],
  term ((334972429023769676136412354446667776000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 2), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-100574316499860000 : Rat) / 692956453614176359) [(1, 1), (2, 2), (8, 1), (11, 1), (16, 1)],
  term ((264988797391185653150505649995689332800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 2), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-9497299241309471661 : Rat) / 2771825814456705436) [(1, 1), (2, 2), (8, 1), (13, 1), (16, 1)],
  term ((-111657476341256558712137451482222592000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 2), (8, 1), (13, 2), (15, 1), (16, 1)],
  term ((33770396062446760700889152618906251200 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 2), (8, 1), (15, 1), (16, 1)],
  term ((385887772254726000 : Rat) / 692956453614176359) [(1, 1), (2, 2), (9, 1), (12, 1), (16, 1)],
  term ((47640465710460000 : Rat) / 692956453614176359) [(1, 1), (2, 2), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((-304898980546944000 : Rat) / 692956453614176359) [(1, 1), (2, 2), (10, 1), (11, 1), (16, 1)],
  term ((-8489530989603972000 : Rat) / 692956453614176359) [(1, 1), (2, 2), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((33536628109921223774287078524254174232600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 2), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((19716523940061682983 : Rat) / 2771825814456705436) [(1, 1), (2, 2), (10, 1), (13, 1), (16, 1)],
  term ((669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 2), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-37618634030860335785142286561194786761100 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 2), (10, 1), (15, 1), (16, 1)],
  term ((-4005142638786577563590482971247979884800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 2), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-14293661141217672000 : Rat) / 692956453614176359) [(1, 1), (2, 2), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((-1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (2, 2), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-17790002001501557733 : Rat) / 2771825814456705436) [(1, 1), (2, 2), (11, 1), (12, 1), (16, 1)],
  term ((43008753766387500 : Rat) / 692956453614176359) [(1, 1), (2, 2), (11, 1), (12, 2), (16, 1)],
  term ((837431072559424190341030886116669440000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((12609228129195918483 : Rat) / 2771825814456705436) [(1, 1), (2, 2), (11, 1), (16, 1)],
  term ((-537446166407415209189398179728040768000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 2), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((72405142110364714179 : Rat) / 2771825814456705436) [(1, 1), (2, 2), (12, 1), (13, 1), (16, 1)],
  term ((-12138364708928359441590006562299127142400 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 2), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-79297569806685134154494651197429641872175 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 2), (12, 1), (15, 1), (16, 1)],
  term ((-63892801305851915029291942101720580800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 2), (12, 2), (15, 1), (16, 1)],
  term ((13892821810816489305 : Rat) / 5543651628913410872) [(1, 1), (2, 2), (13, 1), (16, 1)],
  term ((614116119876911072916755983152224256000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 2), (13, 2), (15, 1), (16, 1)],
  term ((-94294178863210072668665399457243015378000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 2), (15, 1), (16, 1)],
  term ((87320075518113450380824785390604800 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (3, 1), (5, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((-12113105612672266983 : Rat) / 1385912907228352718) [(1, 1), (3, 1), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((11741509980130678983 : Rat) / 1385912907228352718) [(1, 1), (3, 1), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((-2679779432190157409091298835573342208000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 1), (5, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-129167667102054335688 : Rat) / 692956453614176359) [(1, 1), (3, 1), (5, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((7400323832412329337 : Rat) / 692956453614176359) [(1, 1), (3, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((1339889716095078704545649417786671104000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 1), (5, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1879933578065458983 : Rat) / 2771825814456705436) [(1, 1), (3, 1), (5, 1), (15, 1), (16, 1)],
  term ((156546074333121060904753408036070400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (3, 1), (6, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2189633911586289738 : Rat) / 692956453614176359) [(1, 1), (3, 1), (6, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-44240825310375167103676157919130752000 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (3, 1), (6, 1), (7, 1), (13, 3), (15, 2), (16, 1)],
  term ((-9249340331398466862 : Rat) / 692956453614176359) [(1, 1), (3, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-1218442200846645037506346959141427200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (3, 1), (6, 1), (7, 2), (13, 2), (15, 2), (16, 1)],
  term ((-86673858493002527528792779578278400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (3, 1), (6, 1), (7, 2), (15, 2), (16, 1)],
  term ((597518386907264827702789605229191168000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 1), (6, 1), (8, 1), (15, 2), (16, 1)],
  term ((-13891959801170136000 : Rat) / 692956453614176359) [(1, 1), (3, 1), (6, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-6670395561478076422635316524709288665600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 1), (6, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-28587322282435344000 : Rat) / 692956453614176359) [(1, 1), (3, 1), (6, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-2366596089097314813815965124265084211200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (3, 1), (6, 1), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((-3615781793256984375 : Rat) / 692956453614176359) [(1, 1), (3, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((42431773473488679047406498971168020933200 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 1), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((34948521996319132920 : Rat) / 692956453614176359) [(1, 1), (3, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1074892332814830418378796359456081536000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 1), (6, 1), (13, 1), (15, 3), (16, 1)],
  term ((-23383469607126666413482913512740473548800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 1), (6, 1), (13, 2), (15, 2), (16, 1)],
  term ((-144098141179600298191659200041166077620150 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 1), (6, 1), (15, 2), (16, 1)],
  term ((-43626810247303208702812078181626403269200 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 1), (6, 2), (15, 2), (16, 1)],
  term ((-1029034059345936000 : Rat) / 692956453614176359) [(1, 1), (3, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-156546074333121060904753408036070400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (3, 1), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((2189633911586289738 : Rat) / 692956453614176359) [(1, 1), (3, 1), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((44240825310375167103676157919130752000 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (3, 1), (7, 1), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((10792891420417370862 : Rat) / 692956453614176359) [(1, 1), (3, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((245749114116084420436745802180072303648000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((2058068118691872000 : Rat) / 692956453614176359) [(1, 1), (3, 1), (7, 1), (15, 1), (16, 1)],
  term ((3385937525807834023649141096298749952000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 1), (7, 1), (15, 3), (16, 1)],
  term ((1218442200846645037506346959141427200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (3, 1), (7, 2), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((86673858493002527528792779578278400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (3, 1), (7, 2), (12, 1), (15, 2), (16, 1)],
  term ((120424510545885000 : Rat) / 692956453614176359) [(1, 1), (3, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 1), (8, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((201148632999720000 : Rat) / 692956453614176359) [(1, 1), (3, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-529977594782371306301011299991378665600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((9497299241309471661 : Rat) / 1385912907228352718) [(1, 1), (3, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((223314952682513117424274902964445184000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 1), (8, 1), (13, 2), (15, 2), (16, 1)],
  term ((-67540792124893521401778305237812502400 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 1), (8, 1), (15, 2), (16, 1)],
  term ((-771775544509452000 : Rat) / 692956453614176359) [(1, 1), (3, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-95280931420920000 : Rat) / 692956453614176359) [(1, 1), (3, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((609797961093888000 : Rat) / 692956453614176359) [(1, 1), (3, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((16979061979207944000 : Rat) / 692956453614176359) [(1, 1), (3, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-67073256219842447548574157048508348465200 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-19716523940061682983 : Rat) / 1385912907228352718) [(1, 1), (3, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1339889716095078704545649417786671104000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((75237268061720671570284573122389573522200 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 1), (10, 1), (15, 2), (16, 1)],
  term ((8010285277573155127180965942495959769600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((28587322282435344000 : Rat) / 692956453614176359) [(1, 1), (3, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((2366596089097314813815965124265084211200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (3, 1), (11, 1), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((17790002001501557733 : Rat) / 1385912907228352718) [(1, 1), (3, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-86017507532775000 : Rat) / 692956453614176359) [(1, 1), (3, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1674862145118848380682061772233338880000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-12609228129195918483 : Rat) / 1385912907228352718) [(1, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((-72405142110364714179 : Rat) / 1385912907228352718) [(1, 1), (3, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1074892332814830418378796359456081536000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((24276729417856718883180013124598254284800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((158595139613370268308989302394859283744350 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 1), (12, 1), (15, 2), (16, 1)],
  term ((127785602611703830058583884203441161600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 1), (12, 2), (15, 2), (16, 1)],
  term ((-13892821810816489305 : Rat) / 2771825814456705436) [(1, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1228232239753822145833511966304448512000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 1), (13, 2), (15, 2), (16, 1)],
  term ((188588357726420145337330798914486030756000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 1), (15, 2), (16, 1)],
  term ((-43660037759056725190412392695302400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (3, 2), (5, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((12113105612672266983 : Rat) / 2771825814456705436) [(1, 1), (3, 2), (5, 1), (8, 1), (16, 1)],
  term ((-11741509980130678983 : Rat) / 2771825814456705436) [(1, 1), (3, 2), (5, 1), (10, 1), (16, 1)],
  term ((1339889716095078704545649417786671104000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 2), (5, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((64583833551027167844 : Rat) / 692956453614176359) [(1, 1), (3, 2), (5, 1), (12, 1), (13, 2), (16, 1)],
  term ((-7400323832412329337 : Rat) / 1385912907228352718) [(1, 1), (3, 2), (5, 1), (12, 1), (16, 1)],
  term ((-669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 2), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((1879933578065458983 : Rat) / 5543651628913410872) [(1, 1), (3, 2), (5, 1), (16, 1)],
  term ((-78273037166560530452376704018035200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (3, 2), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((1094816955793144869 : Rat) / 692956453614176359) [(1, 1), (3, 2), (6, 1), (7, 1), (13, 2), (16, 1)],
  term ((22120412655187583551838078959565376000 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (3, 2), (6, 1), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((4624670165699233431 : Rat) / 692956453614176359) [(1, 1), (3, 2), (6, 1), (7, 1), (16, 1)],
  term ((609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (3, 2), (6, 1), (7, 2), (13, 2), (15, 1), (16, 1)],
  term ((43336929246501263764396389789139200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (3, 2), (6, 1), (7, 2), (15, 1), (16, 1)],
  term ((-298759193453632413851394802614595584000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 2), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((6945979900585068000 : Rat) / 692956453614176359) [(1, 1), (3, 2), (6, 1), (10, 1), (13, 1), (16, 1)],
  term ((3335197780739038211317658262354644332800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 2), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((14293661141217672000 : Rat) / 692956453614176359) [(1, 1), (3, 2), (6, 1), (11, 1), (13, 2), (16, 1)],
  term ((1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (3, 2), (6, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((3615781793256984375 : Rat) / 1385912907228352718) [(1, 1), (3, 2), (6, 1), (11, 1), (16, 1)],
  term ((-21215886736744339523703249485584010466600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 2), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((537446166407415209189398179728040768000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 2), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((-17474260998159566460 : Rat) / 692956453614176359) [(1, 1), (3, 2), (6, 1), (13, 1), (16, 1)],
  term ((11691734803563333206741456756370236774400 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 2), (6, 1), (13, 2), (15, 1), (16, 1)],
  term ((72049070589800149095829600020583038810075 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 2), (6, 1), (15, 1), (16, 1)],
  term ((21813405123651604351406039090813201634600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 2), (6, 2), (15, 1), (16, 1)],
  term ((514517029672968000 : Rat) / 692956453614176359) [(1, 1), (3, 2), (7, 1), (10, 1), (16, 1)],
  term ((78273037166560530452376704018035200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (3, 2), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1094816955793144869 : Rat) / 692956453614176359) [(1, 1), (3, 2), (7, 1), (12, 1), (13, 2), (16, 1)],
  term ((-22120412655187583551838078959565376000 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (3, 2), (7, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-5396445710208685431 : Rat) / 692956453614176359) [(1, 1), (3, 2), (7, 1), (12, 1), (16, 1)],
  term ((-122874557058042210218372901090036151824000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 2), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1692968762903917011824570548149374976000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 2), (7, 1), (15, 2), (16, 1)],
  term ((-1029034059345936000 : Rat) / 692956453614176359) [(1, 1), (3, 2), (7, 1), (16, 1)],
  term ((-609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (3, 2), (7, 2), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-43336929246501263764396389789139200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (3, 2), (7, 2), (12, 1), (15, 1), (16, 1)],
  term ((-60212255272942500 : Rat) / 692956453614176359) [(1, 1), (3, 2), (8, 1), (11, 1), (12, 1), (16, 1)],
  term ((334972429023769676136412354446667776000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 2), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-100574316499860000 : Rat) / 692956453614176359) [(1, 1), (3, 2), (8, 1), (11, 1), (16, 1)],
  term ((264988797391185653150505649995689332800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 2), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-9497299241309471661 : Rat) / 2771825814456705436) [(1, 1), (3, 2), (8, 1), (13, 1), (16, 1)],
  term ((-111657476341256558712137451482222592000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 2), (8, 1), (13, 2), (15, 1), (16, 1)],
  term ((33770396062446760700889152618906251200 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 2), (8, 1), (15, 1), (16, 1)],
  term ((385887772254726000 : Rat) / 692956453614176359) [(1, 1), (3, 2), (9, 1), (12, 1), (16, 1)],
  term ((47640465710460000 : Rat) / 692956453614176359) [(1, 1), (3, 2), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((-304898980546944000 : Rat) / 692956453614176359) [(1, 1), (3, 2), (10, 1), (11, 1), (16, 1)],
  term ((-8489530989603972000 : Rat) / 692956453614176359) [(1, 1), (3, 2), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((33536628109921223774287078524254174232600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 2), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((19716523940061682983 : Rat) / 2771825814456705436) [(1, 1), (3, 2), (10, 1), (13, 1), (16, 1)],
  term ((669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 2), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-37618634030860335785142286561194786761100 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 2), (10, 1), (15, 1), (16, 1)],
  term ((-4005142638786577563590482971247979884800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 2), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-14293661141217672000 : Rat) / 692956453614176359) [(1, 1), (3, 2), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((-1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (3, 2), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-17790002001501557733 : Rat) / 2771825814456705436) [(1, 1), (3, 2), (11, 1), (12, 1), (16, 1)],
  term ((43008753766387500 : Rat) / 692956453614176359) [(1, 1), (3, 2), (11, 1), (12, 2), (16, 1)],
  term ((837431072559424190341030886116669440000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((12609228129195918483 : Rat) / 2771825814456705436) [(1, 1), (3, 2), (11, 1), (16, 1)],
  term ((-537446166407415209189398179728040768000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 2), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((72405142110364714179 : Rat) / 2771825814456705436) [(1, 1), (3, 2), (12, 1), (13, 1), (16, 1)],
  term ((-12138364708928359441590006562299127142400 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 2), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-79297569806685134154494651197429641872175 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 2), (12, 1), (15, 1), (16, 1)],
  term ((-63892801305851915029291942101720580800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 2), (12, 2), (15, 1), (16, 1)],
  term ((13892821810816489305 : Rat) / 5543651628913410872) [(1, 1), (3, 2), (13, 1), (16, 1)],
  term ((614116119876911072916755983152224256000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 2), (13, 2), (15, 1), (16, 1)],
  term ((-94294178863210072668665399457243015378000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 2), (15, 1), (16, 1)],
  term ((-1339889716095078704545649417786671104000 : Rat) / 84353800925664757687870414129491527348999) [(1, 2), (2, 1), (4, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-10455217405948258983 : Rat) / 1385912907228352718) [(1, 2), (2, 1), (4, 1), (14, 1), (16, 1)],
  term ((1339889716095078704545649417786671104000 : Rat) / 84353800925664757687870414129491527348999) [(1, 2), (2, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((10455217405948258983 : Rat) / 1385912907228352718) [(1, 2), (2, 1), (14, 1), (16, 1)],
  term ((669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 2), (2, 2), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((10455217405948258983 : Rat) / 2771825814456705436) [(1, 2), (2, 2), (4, 1), (16, 1)],
  term ((-669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 2), (2, 2), (13, 1), (15, 1), (16, 1)],
  term ((-10455217405948258983 : Rat) / 2771825814456705436) [(1, 2), (2, 2), (16, 1)],
  term ((-1339889716095078704545649417786671104000 : Rat) / 84353800925664757687870414129491527348999) [(1, 2), (3, 1), (4, 1), (13, 1), (15, 2), (16, 1)],
  term ((-10455217405948258983 : Rat) / 1385912907228352718) [(1, 2), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((1339889716095078704545649417786671104000 : Rat) / 84353800925664757687870414129491527348999) [(1, 2), (3, 1), (13, 1), (15, 2), (16, 1)],
  term ((10455217405948258983 : Rat) / 1385912907228352718) [(1, 2), (3, 1), (15, 1), (16, 1)],
  term ((669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 2), (3, 2), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((10455217405948258983 : Rat) / 2771825814456705436) [(1, 2), (3, 2), (4, 1), (16, 1)],
  term ((-669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 2), (3, 2), (13, 1), (15, 1), (16, 1)],
  term ((-10455217405948258983 : Rat) / 2771825814456705436) [(1, 2), (3, 2), (16, 1)],
  term ((104416779069615799933109050276094400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (4, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((447897956484433559404058473012272000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (4, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-201942820347163391260001816352000000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (4, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((166741629986610000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (4, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((1170259211559939750 : Rat) / 692956453614176359) [(2, 1), (3, 1), (4, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-956121245529929599387752468504337766400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (4, 1), (10, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-58576465092935895420021750461658590283600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (4, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-321573143545605000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (4, 1), (11, 1), (14, 1), (16, 1)],
  term ((488587424006741099263089254298218880000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (4, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((520760242295471034 : Rat) / 692956453614176359) [(2, 1), (3, 1), (4, 1), (13, 1), (14, 1), (16, 1)],
  term ((391140509534971199749535100751774540800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (4, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((221310177648892921726565076787661981322263 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (4, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1678064059956788916014111093158579200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (6, 1), (7, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-3796525022526671755688034147417600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (6, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-279863278721117727324 : Rat) / 692956453614176359) [(2, 1), (3, 1), (5, 1), (6, 1), (13, 2), (14, 1), (16, 1)],
  term ((56896654193307968277 : Rat) / 2771825814456705436) [(2, 1), (3, 1), (5, 1), (6, 1), (14, 1), (16, 1)],
  term ((258163701531813679386786322024396800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (7, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-374686952681241924625932481190793600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-564497497143770733035458410642624000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((26206054671953679848499562917342668358917880 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (5, 1), (7, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1290818507659068396933931610121984000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (7, 1), (13, 2), (14, 1), (15, 3), (16, 1)],
  term ((610405667368067093461434956435154332063949 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (3, 1), (5, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((389238054791812531207278167624601600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (7, 1), (14, 1), (15, 3), (16, 1)],
  term ((1290818507659068396933931610121984000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (7, 2), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((22779150135160030534128204884505600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (7, 2), (14, 1), (15, 2), (16, 1)],
  term ((-771775544509452000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (5, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((771775544509452000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (5, 1), (10, 1), (14, 1), (16, 1)],
  term ((184101571353417750 : Rat) / 692956453614176359) [(2, 1), (3, 1), (5, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-956121245529929599387752468504337766400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (5, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-58576465092935895420021750461658590283600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (5, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-52208389534807899966554525138047200 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (3, 1), (4, 1), (6, 1), (15, 1), (16, 1)],
  term ((-223948978242216779702029236506136000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (3, 1), (4, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((100971410173581695630000908176000000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (3, 1), (4, 1), (7, 1), (15, 2), (16, 1)],
  term ((-83370814993305000 : Rat) / 692956453614176359) [(2, 2), (3, 1), (4, 1), (10, 1), (11, 1), (16, 1)],
  term ((-585129605779969875 : Rat) / 692956453614176359) [(2, 2), (3, 1), (4, 1), (10, 1), (13, 1), (16, 1)],
  term ((478060622764964799693876234252168883200 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (3, 1), (4, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((29288232546467947710010875230829295141800 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (3, 1), (4, 1), (10, 1), (15, 1), (16, 1)],
  term ((160786571772802500 : Rat) / 692956453614176359) [(2, 2), (3, 1), (4, 1), (11, 1), (16, 1)],
  term ((-244293712003370549631544627149109440000 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (3, 1), (4, 1), (13, 1), (15, 2), (16, 1)],
  term ((-260380121147735517 : Rat) / 692956453614176359) [(2, 2), (3, 1), (4, 1), (13, 1), (16, 1)],
  term ((-195570254767485599874767550375887270400 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (3, 1), (4, 1), (13, 2), (15, 1), (16, 1)],
  term ((-221310177648892921726565076787661981322263 : Rat) / 168707601851329515375740828258983054697998) [(2, 2), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((839032029978394458007055546579289600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (3, 1), (5, 1), (6, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((1898262511263335877844017073708800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (3, 1), (5, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((139931639360558863662 : Rat) / 692956453614176359) [(2, 2), (3, 1), (5, 1), (6, 1), (13, 2), (16, 1)],
  term ((-56896654193307968277 : Rat) / 5543651628913410872) [(2, 2), (3, 1), (5, 1), (6, 1), (16, 1)],
  term ((-129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (3, 1), (5, 1), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((187343476340620962312966240595396800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (3, 1), (5, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((282248748571885366517729205321312000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (3, 1), (5, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-13103027335976839924249781458671334179458940 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (3, 1), (5, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((645409253829534198466965805060992000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (3, 1), (5, 1), (7, 1), (13, 2), (15, 3), (16, 1)],
  term ((-610405667368067093461434956435154332063949 : Rat) / 337415203702659030751481656517966109395996) [(2, 2), (3, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-194619027395906265603639083812300800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (3, 1), (5, 1), (7, 1), (15, 3), (16, 1)],
  term ((-645409253829534198466965805060992000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (3, 1), (5, 1), (7, 2), (13, 2), (15, 2), (16, 1)],
  term ((-11389575067580015267064102442252800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (3, 1), (5, 1), (7, 2), (15, 2), (16, 1)],
  term ((385887772254726000 : Rat) / 692956453614176359) [(2, 2), (3, 1), (5, 1), (10, 1), (12, 1), (16, 1)],
  term ((-385887772254726000 : Rat) / 692956453614176359) [(2, 2), (3, 1), (5, 1), (10, 1), (16, 1)],
  term ((-92050785676708875 : Rat) / 692956453614176359) [(2, 2), (3, 1), (5, 1), (11, 1), (13, 1), (16, 1)],
  term ((478060622764964799693876234252168883200 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (3, 1), (5, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((29288232546467947710010875230829295141800 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (3, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((104416779069615799933109050276094400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (6, 1), (15, 2), (16, 1)],
  term ((447897956484433559404058473012272000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-201942820347163391260001816352000000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (7, 1), (15, 3), (16, 1)],
  term ((166741629986610000 : Rat) / 692956453614176359) [(3, 2), (4, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((1170259211559939750 : Rat) / 692956453614176359) [(3, 2), (4, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-956121245529929599387752468504337766400 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((-58576465092935895420021750461658590283600 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (10, 1), (15, 2), (16, 1)],
  term ((-321573143545605000 : Rat) / 692956453614176359) [(3, 2), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((520760242295471034 : Rat) / 692956453614176359) [(3, 2), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((488587424006741099263089254298218880000 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (13, 1), (15, 3), (16, 1)],
  term ((391140509534971199749535100751774540800 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (13, 2), (15, 2), (16, 1)],
  term ((221310177648892921726565076787661981322263 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (15, 2), (16, 1)],
  term ((-1678064059956788916014111093158579200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (6, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((-3796525022526671755688034147417600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (6, 1), (7, 1), (15, 2), (16, 1)],
  term ((-279863278721117727324 : Rat) / 692956453614176359) [(3, 2), (5, 1), (6, 1), (13, 2), (15, 1), (16, 1)],
  term ((56896654193307968277 : Rat) / 2771825814456705436) [(3, 2), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((258163701531813679386786322024396800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-374686952681241924625932481190793600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((-564497497143770733035458410642624000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 1), (13, 1), (15, 3), (16, 1)],
  term ((26206054671953679848499562917342668358917880 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (5, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((-1290818507659068396933931610121984000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 1), (13, 2), (15, 4), (16, 1)],
  term ((610405667368067093461434956435154332063949 : Rat) / 168707601851329515375740828258983054697998) [(3, 2), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((389238054791812531207278167624601600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 1), (15, 4), (16, 1)],
  term ((1290818507659068396933931610121984000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 2), (13, 2), (15, 3), (16, 1)],
  term ((22779150135160030534128204884505600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (7, 2), (15, 3), (16, 1)],
  term ((-771775544509452000 : Rat) / 692956453614176359) [(3, 2), (5, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((771775544509452000 : Rat) / 692956453614176359) [(3, 2), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((184101571353417750 : Rat) / 692956453614176359) [(3, 2), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-956121245529929599387752468504337766400 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (5, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-58576465092935895420021750461658590283600 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (5, 1), (11, 1), (15, 2), (16, 1)],
  term ((-52208389534807899966554525138047200 : Rat) / 2908751756057405437512772901016949218931) [(3, 3), (4, 1), (6, 1), (15, 1), (16, 1)],
  term ((-223948978242216779702029236506136000 : Rat) / 2908751756057405437512772901016949218931) [(3, 3), (4, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((100971410173581695630000908176000000 : Rat) / 2908751756057405437512772901016949218931) [(3, 3), (4, 1), (7, 1), (15, 2), (16, 1)],
  term ((-83370814993305000 : Rat) / 692956453614176359) [(3, 3), (4, 1), (10, 1), (11, 1), (16, 1)],
  term ((-585129605779969875 : Rat) / 692956453614176359) [(3, 3), (4, 1), (10, 1), (13, 1), (16, 1)],
  term ((478060622764964799693876234252168883200 : Rat) / 84353800925664757687870414129491527348999) [(3, 3), (4, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((29288232546467947710010875230829295141800 : Rat) / 84353800925664757687870414129491527348999) [(3, 3), (4, 1), (10, 1), (15, 1), (16, 1)],
  term ((160786571772802500 : Rat) / 692956453614176359) [(3, 3), (4, 1), (11, 1), (16, 1)],
  term ((-244293712003370549631544627149109440000 : Rat) / 84353800925664757687870414129491527348999) [(3, 3), (4, 1), (13, 1), (15, 2), (16, 1)],
  term ((-260380121147735517 : Rat) / 692956453614176359) [(3, 3), (4, 1), (13, 1), (16, 1)],
  term ((-195570254767485599874767550375887270400 : Rat) / 84353800925664757687870414129491527348999) [(3, 3), (4, 1), (13, 2), (15, 1), (16, 1)],
  term ((-221310177648892921726565076787661981322263 : Rat) / 168707601851329515375740828258983054697998) [(3, 3), (4, 1), (15, 1), (16, 1)],
  term ((839032029978394458007055546579289600 : Rat) / 2908751756057405437512772901016949218931) [(3, 3), (5, 1), (6, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((1898262511263335877844017073708800 : Rat) / 2908751756057405437512772901016949218931) [(3, 3), (5, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((139931639360558863662 : Rat) / 692956453614176359) [(3, 3), (5, 1), (6, 1), (13, 2), (16, 1)],
  term ((-56896654193307968277 : Rat) / 5543651628913410872) [(3, 3), (5, 1), (6, 1), (16, 1)],
  term ((-129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(3, 3), (5, 1), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((187343476340620962312966240595396800 : Rat) / 2908751756057405437512772901016949218931) [(3, 3), (5, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((282248748571885366517729205321312000 : Rat) / 2908751756057405437512772901016949218931) [(3, 3), (5, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-13103027335976839924249781458671334179458940 : Rat) / 84353800925664757687870414129491527348999) [(3, 3), (5, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((645409253829534198466965805060992000 : Rat) / 2908751756057405437512772901016949218931) [(3, 3), (5, 1), (7, 1), (13, 2), (15, 3), (16, 1)],
  term ((-610405667368067093461434956435154332063949 : Rat) / 337415203702659030751481656517966109395996) [(3, 3), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-194619027395906265603639083812300800 : Rat) / 2908751756057405437512772901016949218931) [(3, 3), (5, 1), (7, 1), (15, 3), (16, 1)],
  term ((-645409253829534198466965805060992000 : Rat) / 2908751756057405437512772901016949218931) [(3, 3), (5, 1), (7, 2), (13, 2), (15, 2), (16, 1)],
  term ((-11389575067580015267064102442252800 : Rat) / 2908751756057405437512772901016949218931) [(3, 3), (5, 1), (7, 2), (15, 2), (16, 1)],
  term ((385887772254726000 : Rat) / 692956453614176359) [(3, 3), (5, 1), (10, 1), (12, 1), (16, 1)],
  term ((-385887772254726000 : Rat) / 692956453614176359) [(3, 3), (5, 1), (10, 1), (16, 1)],
  term ((-92050785676708875 : Rat) / 692956453614176359) [(3, 3), (5, 1), (11, 1), (13, 1), (16, 1)],
  term ((478060622764964799693876234252168883200 : Rat) / 84353800925664757687870414129491527348999) [(3, 3), (5, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((29288232546467947710010875230829295141800 : Rat) / 84353800925664757687870414129491527348999) [(3, 3), (5, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 28, terms 100 through 199. -/
theorem ep_Q2_008_block_28_0100_0199_valid :
    checkProductSumEq ep_Q2_008_partials_28_0100_0199
      ep_Q2_008_block_28_0100_0199 = true := by
  native_decide

end EpQ2008TermShards

end Patterns

end EndpointCertificate

end Problem97
