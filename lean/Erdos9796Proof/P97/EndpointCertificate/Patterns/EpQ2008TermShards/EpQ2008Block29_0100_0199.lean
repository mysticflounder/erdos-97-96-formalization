/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_008, term block 29:100-199

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_008`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2008TermShards

/-- Generator polynomial 29 for endpoint certificate `ep_Q2_008`. -/
def ep_Q2_008_generator_29_0100_0199 : Poly :=
[
  term (2 : Rat) [(12, 1), (14, 1)],
  term (-1 : Rat) [(12, 2)],
  term (2 : Rat) [(13, 1), (15, 1)],
  term (-1 : Rat) [(13, 2)]
]

/-- Coefficient term 100 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0100 : Poly :=
[
  term ((-11741509980130678983 : Rat) / 2771825814456705436) [(1, 1), (5, 1), (10, 1), (16, 1)]
]

/-- Partial product 100 for generator 29. -/
def ep_Q2_008_partial_29_0100 : Poly :=
[
  term ((-11741509980130678983 : Rat) / 1385912907228352718) [(1, 1), (5, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((11741509980130678983 : Rat) / 2771825814456705436) [(1, 1), (5, 1), (10, 1), (12, 2), (16, 1)],
  term ((-11741509980130678983 : Rat) / 1385912907228352718) [(1, 1), (5, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((11741509980130678983 : Rat) / 2771825814456705436) [(1, 1), (5, 1), (10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 29. -/
theorem ep_Q2_008_partial_29_0100_valid :
    mulPoly ep_Q2_008_coefficient_29_0100
        ep_Q2_008_generator_29_0100_0199 =
      ep_Q2_008_partial_29_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0101 : Poly :=
[
  term ((1339889716095078704545649417786671104000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (5, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 101 for generator 29. -/
def ep_Q2_008_partial_29_0101 : Poly :=
[
  term ((2679779432190157409091298835573342208000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (5, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-1339889716095078704545649417786671104000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (5, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((2679779432190157409091298835573342208000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (5, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1339889716095078704545649417786671104000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (5, 1), (12, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 29. -/
theorem ep_Q2_008_partial_29_0101_valid :
    mulPoly ep_Q2_008_coefficient_29_0101
        ep_Q2_008_generator_29_0100_0199 =
      ep_Q2_008_partial_29_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0102 : Poly :=
[
  term ((129167667102054335688 : Rat) / 692956453614176359) [(1, 1), (5, 1), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 102 for generator 29. -/
def ep_Q2_008_partial_29_0102 : Poly :=
[
  term ((258335334204108671376 : Rat) / 692956453614176359) [(1, 1), (5, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-129167667102054335688 : Rat) / 692956453614176359) [(1, 1), (5, 1), (12, 1), (13, 4), (16, 1)],
  term ((258335334204108671376 : Rat) / 692956453614176359) [(1, 1), (5, 1), (12, 2), (13, 2), (14, 1), (16, 1)],
  term ((-129167667102054335688 : Rat) / 692956453614176359) [(1, 1), (5, 1), (12, 3), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 29. -/
theorem ep_Q2_008_partial_29_0102_valid :
    mulPoly ep_Q2_008_coefficient_29_0102
        ep_Q2_008_generator_29_0100_0199 =
      ep_Q2_008_partial_29_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0103 : Poly :=
[
  term ((-41342805309779996331 : Rat) / 2771825814456705436) [(1, 1), (5, 1), (12, 1), (16, 1)]
]

/-- Partial product 103 for generator 29. -/
def ep_Q2_008_partial_29_0103 : Poly :=
[
  term ((-41342805309779996331 : Rat) / 1385912907228352718) [(1, 1), (5, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((41342805309779996331 : Rat) / 2771825814456705436) [(1, 1), (5, 1), (12, 1), (13, 2), (16, 1)],
  term ((-41342805309779996331 : Rat) / 1385912907228352718) [(1, 1), (5, 1), (12, 2), (14, 1), (16, 1)],
  term ((41342805309779996331 : Rat) / 2771825814456705436) [(1, 1), (5, 1), (12, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 29. -/
theorem ep_Q2_008_partial_29_0103_valid :
    mulPoly ep_Q2_008_coefficient_29_0103
        ep_Q2_008_generator_29_0100_0199 =
      ep_Q2_008_partial_29_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0104 : Poly :=
[
  term ((669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (5, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 104 for generator 29. -/
def ep_Q2_008_partial_29_0104 : Poly :=
[
  term ((1339889716095078704545649417786671104000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (5, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (5, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((1339889716095078704545649417786671104000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (5, 1), (13, 2), (15, 2), (16, 1)],
  term ((-669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (5, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 29. -/
theorem ep_Q2_008_partial_29_0104_valid :
    mulPoly ep_Q2_008_coefficient_29_0104
        ep_Q2_008_generator_29_0100_0199 =
      ep_Q2_008_partial_29_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0105 : Poly :=
[
  term ((56506560384830142915 : Rat) / 5543651628913410872) [(1, 1), (5, 1), (16, 1)]
]

/-- Partial product 105 for generator 29. -/
def ep_Q2_008_partial_29_0105 : Poly :=
[
  term ((56506560384830142915 : Rat) / 2771825814456705436) [(1, 1), (5, 1), (12, 1), (14, 1), (16, 1)],
  term ((-56506560384830142915 : Rat) / 5543651628913410872) [(1, 1), (5, 1), (12, 2), (16, 1)],
  term ((56506560384830142915 : Rat) / 2771825814456705436) [(1, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-56506560384830142915 : Rat) / 5543651628913410872) [(1, 1), (5, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 29. -/
theorem ep_Q2_008_partial_29_0105_valid :
    mulPoly ep_Q2_008_coefficient_29_0105
        ep_Q2_008_generator_29_0100_0199 =
      ep_Q2_008_partial_29_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0106 : Poly :=
[
  term ((-156546074333121060904753408036070400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 106 for generator 29. -/
def ep_Q2_008_partial_29_0106 : Poly :=
[
  term ((-313092148666242121809506816072140800 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((156546074333121060904753408036070400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (7, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-313092148666242121809506816072140800 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((156546074333121060904753408036070400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (7, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 29. -/
theorem ep_Q2_008_partial_29_0106_valid :
    mulPoly ep_Q2_008_coefficient_29_0106
        ep_Q2_008_generator_29_0100_0199 =
      ep_Q2_008_partial_29_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0107 : Poly :=
[
  term ((2189633911586289738 : Rat) / 692956453614176359) [(1, 1), (6, 1), (7, 1), (13, 2), (16, 1)]
]

/-- Partial product 107 for generator 29. -/
def ep_Q2_008_partial_29_0107 : Poly :=
[
  term ((4379267823172579476 : Rat) / 692956453614176359) [(1, 1), (6, 1), (7, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-2189633911586289738 : Rat) / 692956453614176359) [(1, 1), (6, 1), (7, 1), (12, 2), (13, 2), (16, 1)],
  term ((4379267823172579476 : Rat) / 692956453614176359) [(1, 1), (6, 1), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((-2189633911586289738 : Rat) / 692956453614176359) [(1, 1), (6, 1), (7, 1), (13, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 29. -/
theorem ep_Q2_008_partial_29_0107_valid :
    mulPoly ep_Q2_008_coefficient_29_0107
        ep_Q2_008_generator_29_0100_0199 =
      ep_Q2_008_partial_29_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0108 : Poly :=
[
  term ((44240825310375167103676157919130752000 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (7, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 108 for generator 29. -/
def ep_Q2_008_partial_29_0108 : Poly :=
[
  term ((88481650620750334207352315838261504000 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (7, 1), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-44240825310375167103676157919130752000 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (7, 1), (12, 2), (13, 3), (15, 1), (16, 1)],
  term ((88481650620750334207352315838261504000 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (7, 1), (13, 4), (15, 2), (16, 1)],
  term ((-44240825310375167103676157919130752000 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (7, 1), (13, 5), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 29. -/
theorem ep_Q2_008_partial_29_0108_valid :
    mulPoly ep_Q2_008_coefficient_29_0108
        ep_Q2_008_generator_29_0100_0199 =
      ep_Q2_008_partial_29_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0109 : Poly :=
[
  term ((9249340331398466862 : Rat) / 692956453614176359) [(1, 1), (6, 1), (7, 1), (16, 1)]
]

/-- Partial product 109 for generator 29. -/
def ep_Q2_008_partial_29_0109 : Poly :=
[
  term ((18498680662796933724 : Rat) / 692956453614176359) [(1, 1), (6, 1), (7, 1), (12, 1), (14, 1), (16, 1)],
  term ((-9249340331398466862 : Rat) / 692956453614176359) [(1, 1), (6, 1), (7, 1), (12, 2), (16, 1)],
  term ((18498680662796933724 : Rat) / 692956453614176359) [(1, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-9249340331398466862 : Rat) / 692956453614176359) [(1, 1), (6, 1), (7, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 29. -/
theorem ep_Q2_008_partial_29_0109_valid :
    mulPoly ep_Q2_008_coefficient_29_0109
        ep_Q2_008_generator_29_0100_0199 =
      ep_Q2_008_partial_29_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0110 : Poly :=
[
  term ((1218442200846645037506346959141427200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (7, 2), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 110 for generator 29. -/
def ep_Q2_008_partial_29_0110 : Poly :=
[
  term ((2436884401693290075012693918282854400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (7, 2), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1218442200846645037506346959141427200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (7, 2), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((2436884401693290075012693918282854400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (7, 2), (13, 3), (15, 2), (16, 1)],
  term ((-1218442200846645037506346959141427200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (7, 2), (13, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 29. -/
theorem ep_Q2_008_partial_29_0110_valid :
    mulPoly ep_Q2_008_coefficient_29_0110
        ep_Q2_008_generator_29_0100_0199 =
      ep_Q2_008_partial_29_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0111 : Poly :=
[
  term ((86673858493002527528792779578278400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (7, 2), (15, 1), (16, 1)]
]

/-- Partial product 111 for generator 29. -/
def ep_Q2_008_partial_29_0111 : Poly :=
[
  term ((173347716986005055057585559156556800 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (7, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-86673858493002527528792779578278400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (7, 2), (12, 2), (15, 1), (16, 1)],
  term ((173347716986005055057585559156556800 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (7, 2), (13, 1), (15, 2), (16, 1)],
  term ((-86673858493002527528792779578278400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (7, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 29. -/
theorem ep_Q2_008_partial_29_0111_valid :
    mulPoly ep_Q2_008_coefficient_29_0111
        ep_Q2_008_generator_29_0100_0199 =
      ep_Q2_008_partial_29_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0112 : Poly :=
[
  term ((-298759193453632413851394802614595584000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 112 for generator 29. -/
def ep_Q2_008_partial_29_0112 : Poly :=
[
  term ((-597518386907264827702789605229191168000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((298759193453632413851394802614595584000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((-597518386907264827702789605229191168000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((298759193453632413851394802614595584000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (8, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 29. -/
theorem ep_Q2_008_partial_29_0112_valid :
    mulPoly ep_Q2_008_coefficient_29_0112
        ep_Q2_008_generator_29_0100_0199 =
      ep_Q2_008_partial_29_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0113 : Poly :=
[
  term ((13891959801170136000 : Rat) / 692956453614176359) [(1, 1), (6, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 113 for generator 29. -/
def ep_Q2_008_partial_29_0113 : Poly :=
[
  term ((27783919602340272000 : Rat) / 692956453614176359) [(1, 1), (6, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-13891959801170136000 : Rat) / 692956453614176359) [(1, 1), (6, 1), (10, 1), (12, 2), (13, 1), (16, 1)],
  term ((27783919602340272000 : Rat) / 692956453614176359) [(1, 1), (6, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-13891959801170136000 : Rat) / 692956453614176359) [(1, 1), (6, 1), (10, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 29. -/
theorem ep_Q2_008_partial_29_0113_valid :
    mulPoly ep_Q2_008_coefficient_29_0113
        ep_Q2_008_generator_29_0100_0199 =
      ep_Q2_008_partial_29_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0114 : Poly :=
[
  term ((6670395561478076422635316524709288665600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 114 for generator 29. -/
def ep_Q2_008_partial_29_0114 : Poly :=
[
  term ((13340791122956152845270633049418577331200 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6670395561478076422635316524709288665600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((13340791122956152845270633049418577331200 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-6670395561478076422635316524709288665600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 29. -/
theorem ep_Q2_008_partial_29_0114_valid :
    mulPoly ep_Q2_008_coefficient_29_0114
        ep_Q2_008_generator_29_0100_0199 =
      ep_Q2_008_partial_29_0114 := by
  native_decide

/-- Coefficient term 115 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0115 : Poly :=
[
  term ((28587322282435344000 : Rat) / 692956453614176359) [(1, 1), (6, 1), (11, 1), (13, 2), (16, 1)]
]

/-- Partial product 115 for generator 29. -/
def ep_Q2_008_partial_29_0115 : Poly :=
[
  term ((57174644564870688000 : Rat) / 692956453614176359) [(1, 1), (6, 1), (11, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-28587322282435344000 : Rat) / 692956453614176359) [(1, 1), (6, 1), (11, 1), (12, 2), (13, 2), (16, 1)],
  term ((57174644564870688000 : Rat) / 692956453614176359) [(1, 1), (6, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((-28587322282435344000 : Rat) / 692956453614176359) [(1, 1), (6, 1), (11, 1), (13, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 115 for generator 29. -/
theorem ep_Q2_008_partial_29_0115_valid :
    mulPoly ep_Q2_008_coefficient_29_0115
        ep_Q2_008_generator_29_0100_0199 =
      ep_Q2_008_partial_29_0115 := by
  native_decide

/-- Coefficient term 116 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0116 : Poly :=
[
  term ((2366596089097314813815965124265084211200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 116 for generator 29. -/
def ep_Q2_008_partial_29_0116 : Poly :=
[
  term ((4733192178194629627631930248530168422400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (11, 1), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-2366596089097314813815965124265084211200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (11, 1), (12, 2), (13, 3), (15, 1), (16, 1)],
  term ((4733192178194629627631930248530168422400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (11, 1), (13, 4), (15, 2), (16, 1)],
  term ((-2366596089097314813815965124265084211200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (11, 1), (13, 5), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 116 for generator 29. -/
theorem ep_Q2_008_partial_29_0116_valid :
    mulPoly ep_Q2_008_coefficient_29_0116
        ep_Q2_008_generator_29_0100_0199 =
      ep_Q2_008_partial_29_0116 := by
  native_decide

/-- Coefficient term 117 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0117 : Poly :=
[
  term ((3675332375395059375 : Rat) / 692956453614176359) [(1, 1), (6, 1), (11, 1), (16, 1)]
]

/-- Partial product 117 for generator 29. -/
def ep_Q2_008_partial_29_0117 : Poly :=
[
  term ((7350664750790118750 : Rat) / 692956453614176359) [(1, 1), (6, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-3675332375395059375 : Rat) / 692956453614176359) [(1, 1), (6, 1), (11, 1), (12, 2), (16, 1)],
  term ((7350664750790118750 : Rat) / 692956453614176359) [(1, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3675332375395059375 : Rat) / 692956453614176359) [(1, 1), (6, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 117 for generator 29. -/
theorem ep_Q2_008_partial_29_0117_valid :
    mulPoly ep_Q2_008_coefficient_29_0117
        ep_Q2_008_generator_29_0100_0199 =
      ep_Q2_008_partial_29_0117 := by
  native_decide

/-- Coefficient term 118 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0118 : Poly :=
[
  term ((-43029291860395943875109288576397212101200 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 118 for generator 29. -/
def ep_Q2_008_partial_29_0118 : Poly :=
[
  term ((-86058583720791887750218577152794424202400 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((43029291860395943875109288576397212101200 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-86058583720791887750218577152794424202400 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((43029291860395943875109288576397212101200 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 118 for generator 29. -/
theorem ep_Q2_008_partial_29_0118_valid :
    mulPoly ep_Q2_008_coefficient_29_0118
        ep_Q2_008_generator_29_0100_0199 =
      ep_Q2_008_partial_29_0118 := by
  native_decide

/-- Coefficient term 119 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0119 : Poly :=
[
  term ((1074892332814830418378796359456081536000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 119 for generator 29. -/
def ep_Q2_008_partial_29_0119 : Poly :=
[
  term ((2149784665629660836757592718912163072000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1074892332814830418378796359456081536000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((2149784665629660836757592718912163072000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (13, 2), (15, 3), (16, 1)],
  term ((-1074892332814830418378796359456081536000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 119 for generator 29. -/
theorem ep_Q2_008_partial_29_0119_valid :
    mulPoly ep_Q2_008_coefficient_29_0119
        ep_Q2_008_generator_29_0100_0199 =
      ep_Q2_008_partial_29_0119 := by
  native_decide

/-- Coefficient term 120 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0120 : Poly :=
[
  term ((-34434004966646164920 : Rat) / 692956453614176359) [(1, 1), (6, 1), (13, 1), (16, 1)]
]

/-- Partial product 120 for generator 29. -/
def ep_Q2_008_partial_29_0120 : Poly :=
[
  term ((-68868009933292329840 : Rat) / 692956453614176359) [(1, 1), (6, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((34434004966646164920 : Rat) / 692956453614176359) [(1, 1), (6, 1), (12, 2), (13, 1), (16, 1)],
  term ((-68868009933292329840 : Rat) / 692956453614176359) [(1, 1), (6, 1), (13, 2), (15, 1), (16, 1)],
  term ((34434004966646164920 : Rat) / 692956453614176359) [(1, 1), (6, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 120 for generator 29. -/
theorem ep_Q2_008_partial_29_0120_valid :
    mulPoly ep_Q2_008_coefficient_29_0120
        ep_Q2_008_generator_29_0100_0199 =
      ep_Q2_008_partial_29_0120 := by
  native_decide

/-- Coefficient term 121 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0121 : Poly :=
[
  term ((23383469607126666413482913512740473548800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 121 for generator 29. -/
def ep_Q2_008_partial_29_0121 : Poly :=
[
  term ((46766939214253332826965827025480947097600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-23383469607126666413482913512740473548800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((46766939214253332826965827025480947097600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (13, 3), (15, 2), (16, 1)],
  term ((-23383469607126666413482913512740473548800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (13, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 121 for generator 29. -/
theorem ep_Q2_008_partial_29_0121_valid :
    mulPoly ep_Q2_008_coefficient_29_0121
        ep_Q2_008_generator_29_0100_0199 =
      ep_Q2_008_partial_29_0121 := by
  native_decide

/-- Coefficient term 122 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0122 : Poly :=
[
  term ((76226013386589261140285511010928505164550 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 122 for generator 29. -/
def ep_Q2_008_partial_29_0122 : Poly :=
[
  term ((152452026773178522280571022021857010329100 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-76226013386589261140285511010928505164550 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (12, 2), (15, 1), (16, 1)],
  term ((152452026773178522280571022021857010329100 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((-76226013386589261140285511010928505164550 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 122 for generator 29. -/
theorem ep_Q2_008_partial_29_0122_valid :
    mulPoly ep_Q2_008_coefficient_29_0122
        ep_Q2_008_generator_29_0100_0199 =
      ep_Q2_008_partial_29_0122 := by
  native_decide

/-- Coefficient term 123 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0123 : Poly :=
[
  term ((43626810247303208702812078181626403269200 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 2), (15, 1), (16, 1)]
]

/-- Partial product 123 for generator 29. -/
def ep_Q2_008_partial_29_0123 : Poly :=
[
  term ((87253620494606417405624156363252806538400 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-43626810247303208702812078181626403269200 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 2), (12, 2), (15, 1), (16, 1)],
  term ((87253620494606417405624156363252806538400 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 2), (13, 1), (15, 2), (16, 1)],
  term ((-43626810247303208702812078181626403269200 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 123 for generator 29. -/
theorem ep_Q2_008_partial_29_0123_valid :
    mulPoly ep_Q2_008_coefficient_29_0123
        ep_Q2_008_generator_29_0100_0199 =
      ep_Q2_008_partial_29_0123 := by
  native_decide

/-- Coefficient term 124 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0124 : Poly :=
[
  term ((514517029672968000 : Rat) / 692956453614176359) [(1, 1), (7, 1), (10, 1), (16, 1)]
]

/-- Partial product 124 for generator 29. -/
def ep_Q2_008_partial_29_0124 : Poly :=
[
  term ((1029034059345936000 : Rat) / 692956453614176359) [(1, 1), (7, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-514517029672968000 : Rat) / 692956453614176359) [(1, 1), (7, 1), (10, 1), (12, 2), (16, 1)],
  term ((1029034059345936000 : Rat) / 692956453614176359) [(1, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-514517029672968000 : Rat) / 692956453614176359) [(1, 1), (7, 1), (10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 124 for generator 29. -/
theorem ep_Q2_008_partial_29_0124_valid :
    mulPoly ep_Q2_008_coefficient_29_0124
        ep_Q2_008_generator_29_0100_0199 =
      ep_Q2_008_partial_29_0124 := by
  native_decide

/-- Coefficient term 125 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0125 : Poly :=
[
  term ((156546074333121060904753408036070400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 125 for generator 29. -/
def ep_Q2_008_partial_29_0125 : Poly :=
[
  term ((313092148666242121809506816072140800 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (7, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-156546074333121060904753408036070400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (7, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((313092148666242121809506816072140800 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (7, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-156546074333121060904753408036070400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (7, 1), (12, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 125 for generator 29. -/
theorem ep_Q2_008_partial_29_0125_valid :
    mulPoly ep_Q2_008_coefficient_29_0125
        ep_Q2_008_generator_29_0100_0199 =
      ep_Q2_008_partial_29_0125 := by
  native_decide

/-- Coefficient term 126 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0126 : Poly :=
[
  term ((-2189633911586289738 : Rat) / 692956453614176359) [(1, 1), (7, 1), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 126 for generator 29. -/
def ep_Q2_008_partial_29_0126 : Poly :=
[
  term ((-4379267823172579476 : Rat) / 692956453614176359) [(1, 1), (7, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((2189633911586289738 : Rat) / 692956453614176359) [(1, 1), (7, 1), (12, 1), (13, 4), (16, 1)],
  term ((-4379267823172579476 : Rat) / 692956453614176359) [(1, 1), (7, 1), (12, 2), (13, 2), (14, 1), (16, 1)],
  term ((2189633911586289738 : Rat) / 692956453614176359) [(1, 1), (7, 1), (12, 3), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 126 for generator 29. -/
theorem ep_Q2_008_partial_29_0126_valid :
    mulPoly ep_Q2_008_coefficient_29_0126
        ep_Q2_008_generator_29_0100_0199 =
      ep_Q2_008_partial_29_0126 := by
  native_decide

/-- Coefficient term 127 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0127 : Poly :=
[
  term ((-44240825310375167103676157919130752000 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (7, 1), (12, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 127 for generator 29. -/
def ep_Q2_008_partial_29_0127 : Poly :=
[
  term ((-88481650620750334207352315838261504000 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (7, 1), (12, 1), (13, 4), (15, 2), (16, 1)],
  term ((44240825310375167103676157919130752000 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (7, 1), (12, 1), (13, 5), (15, 1), (16, 1)],
  term ((-88481650620750334207352315838261504000 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (7, 1), (12, 2), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((44240825310375167103676157919130752000 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (7, 1), (12, 3), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 127 for generator 29. -/
theorem ep_Q2_008_partial_29_0127_valid :
    mulPoly ep_Q2_008_coefficient_29_0127
        ep_Q2_008_generator_29_0100_0199 =
      ep_Q2_008_partial_29_0127 := by
  native_decide

/-- Coefficient term 128 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0128 : Poly :=
[
  term ((-10021115875907918862 : Rat) / 692956453614176359) [(1, 1), (7, 1), (12, 1), (16, 1)]
]

/-- Partial product 128 for generator 29. -/
def ep_Q2_008_partial_29_0128 : Poly :=
[
  term ((-20042231751815837724 : Rat) / 692956453614176359) [(1, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((10021115875907918862 : Rat) / 692956453614176359) [(1, 1), (7, 1), (12, 1), (13, 2), (16, 1)],
  term ((-20042231751815837724 : Rat) / 692956453614176359) [(1, 1), (7, 1), (12, 2), (14, 1), (16, 1)],
  term ((10021115875907918862 : Rat) / 692956453614176359) [(1, 1), (7, 1), (12, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 128 for generator 29. -/
theorem ep_Q2_008_partial_29_0128_valid :
    mulPoly ep_Q2_008_coefficient_29_0128
        ep_Q2_008_generator_29_0100_0199 =
      ep_Q2_008_partial_29_0128 := by
  native_decide

/-- Coefficient term 129 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0129 : Poly :=
[
  term ((-514517029672968000 : Rat) / 692956453614176359) [(1, 1), (7, 1), (16, 1)]
]

/-- Partial product 129 for generator 29. -/
def ep_Q2_008_partial_29_0129 : Poly :=
[
  term ((-1029034059345936000 : Rat) / 692956453614176359) [(1, 1), (7, 1), (12, 1), (14, 1), (16, 1)],
  term ((514517029672968000 : Rat) / 692956453614176359) [(1, 1), (7, 1), (12, 2), (16, 1)],
  term ((-1029034059345936000 : Rat) / 692956453614176359) [(1, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((514517029672968000 : Rat) / 692956453614176359) [(1, 1), (7, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 129 for generator 29. -/
theorem ep_Q2_008_partial_29_0129_valid :
    mulPoly ep_Q2_008_coefficient_29_0129
        ep_Q2_008_generator_29_0100_0199 =
      ep_Q2_008_partial_29_0129 := by
  native_decide

/-- Coefficient term 130 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0130 : Poly :=
[
  term ((-1218442200846645037506346959141427200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (7, 2), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 130 for generator 29. -/
def ep_Q2_008_partial_29_0130 : Poly :=
[
  term ((-2436884401693290075012693918282854400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (7, 2), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((1218442200846645037506346959141427200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (7, 2), (12, 1), (13, 4), (15, 1), (16, 1)],
  term ((-2436884401693290075012693918282854400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (7, 2), (12, 2), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((1218442200846645037506346959141427200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (7, 2), (12, 3), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 130 for generator 29. -/
theorem ep_Q2_008_partial_29_0130_valid :
    mulPoly ep_Q2_008_coefficient_29_0130
        ep_Q2_008_generator_29_0100_0199 =
      ep_Q2_008_partial_29_0130 := by
  native_decide

/-- Coefficient term 131 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0131 : Poly :=
[
  term ((-86673858493002527528792779578278400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (7, 2), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 131 for generator 29. -/
def ep_Q2_008_partial_29_0131 : Poly :=
[
  term ((-173347716986005055057585559156556800 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (7, 2), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((86673858493002527528792779578278400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (7, 2), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-173347716986005055057585559156556800 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (7, 2), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((86673858493002527528792779578278400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (7, 2), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 131 for generator 29. -/
theorem ep_Q2_008_partial_29_0131_valid :
    mulPoly ep_Q2_008_coefficient_29_0131
        ep_Q2_008_generator_29_0100_0199 =
      ep_Q2_008_partial_29_0131 := by
  native_decide

/-- Coefficient term 132 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0132 : Poly :=
[
  term ((-60212255272942500 : Rat) / 692956453614176359) [(1, 1), (8, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 132 for generator 29. -/
def ep_Q2_008_partial_29_0132 : Poly :=
[
  term ((-120424510545885000 : Rat) / 692956453614176359) [(1, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((60212255272942500 : Rat) / 692956453614176359) [(1, 1), (8, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((-120424510545885000 : Rat) / 692956453614176359) [(1, 1), (8, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((60212255272942500 : Rat) / 692956453614176359) [(1, 1), (8, 1), (11, 1), (12, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 132 for generator 29. -/
theorem ep_Q2_008_partial_29_0132_valid :
    mulPoly ep_Q2_008_coefficient_29_0132
        ep_Q2_008_generator_29_0100_0199 =
      ep_Q2_008_partial_29_0132 := by
  native_decide

/-- Coefficient term 133 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0133 : Poly :=
[
  term ((334972429023769676136412354446667776000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 133 for generator 29. -/
def ep_Q2_008_partial_29_0133 : Poly :=
[
  term ((669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (8, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-334972429023769676136412354446667776000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (8, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (8, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-334972429023769676136412354446667776000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (8, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 133 for generator 29. -/
theorem ep_Q2_008_partial_29_0133_valid :
    mulPoly ep_Q2_008_coefficient_29_0133
        ep_Q2_008_generator_29_0100_0199 =
      ep_Q2_008_partial_29_0133 := by
  native_decide

/-- Coefficient term 134 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0134 : Poly :=
[
  term ((-100574316499860000 : Rat) / 692956453614176359) [(1, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 134 for generator 29. -/
def ep_Q2_008_partial_29_0134 : Poly :=
[
  term ((-201148632999720000 : Rat) / 692956453614176359) [(1, 1), (8, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((100574316499860000 : Rat) / 692956453614176359) [(1, 1), (8, 1), (11, 1), (12, 2), (16, 1)],
  term ((-201148632999720000 : Rat) / 692956453614176359) [(1, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((100574316499860000 : Rat) / 692956453614176359) [(1, 1), (8, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 134 for generator 29. -/
theorem ep_Q2_008_partial_29_0134_valid :
    mulPoly ep_Q2_008_coefficient_29_0134
        ep_Q2_008_generator_29_0100_0199 =
      ep_Q2_008_partial_29_0134 := by
  native_decide

/-- Coefficient term 135 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0135 : Poly :=
[
  term ((264988797391185653150505649995689332800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (8, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 135 for generator 29. -/
def ep_Q2_008_partial_29_0135 : Poly :=
[
  term ((529977594782371306301011299991378665600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (8, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-264988797391185653150505649995689332800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (8, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((529977594782371306301011299991378665600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (8, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-264988797391185653150505649995689332800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (8, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 135 for generator 29. -/
theorem ep_Q2_008_partial_29_0135_valid :
    mulPoly ep_Q2_008_coefficient_29_0135
        ep_Q2_008_generator_29_0100_0199 =
      ep_Q2_008_partial_29_0135 := by
  native_decide

/-- Coefficient term 136 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0136 : Poly :=
[
  term ((-9497299241309471661 : Rat) / 2771825814456705436) [(1, 1), (8, 1), (13, 1), (16, 1)]
]

/-- Partial product 136 for generator 29. -/
def ep_Q2_008_partial_29_0136 : Poly :=
[
  term ((-9497299241309471661 : Rat) / 1385912907228352718) [(1, 1), (8, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((9497299241309471661 : Rat) / 2771825814456705436) [(1, 1), (8, 1), (12, 2), (13, 1), (16, 1)],
  term ((-9497299241309471661 : Rat) / 1385912907228352718) [(1, 1), (8, 1), (13, 2), (15, 1), (16, 1)],
  term ((9497299241309471661 : Rat) / 2771825814456705436) [(1, 1), (8, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 136 for generator 29. -/
theorem ep_Q2_008_partial_29_0136_valid :
    mulPoly ep_Q2_008_coefficient_29_0136
        ep_Q2_008_generator_29_0100_0199 =
      ep_Q2_008_partial_29_0136 := by
  native_decide

/-- Coefficient term 137 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0137 : Poly :=
[
  term ((-111657476341256558712137451482222592000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (8, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 137 for generator 29. -/
def ep_Q2_008_partial_29_0137 : Poly :=
[
  term ((-223314952682513117424274902964445184000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (8, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((111657476341256558712137451482222592000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (8, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((-223314952682513117424274902964445184000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (8, 1), (13, 3), (15, 2), (16, 1)],
  term ((111657476341256558712137451482222592000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (8, 1), (13, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 137 for generator 29. -/
theorem ep_Q2_008_partial_29_0137_valid :
    mulPoly ep_Q2_008_coefficient_29_0137
        ep_Q2_008_generator_29_0100_0199 =
      ep_Q2_008_partial_29_0137 := by
  native_decide

/-- Coefficient term 138 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0138 : Poly :=
[
  term ((33770396062446760700889152618906251200 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 138 for generator 29. -/
def ep_Q2_008_partial_29_0138 : Poly :=
[
  term ((67540792124893521401778305237812502400 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-33770396062446760700889152618906251200 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((67540792124893521401778305237812502400 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((-33770396062446760700889152618906251200 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (8, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 138 for generator 29. -/
theorem ep_Q2_008_partial_29_0138_valid :
    mulPoly ep_Q2_008_coefficient_29_0138
        ep_Q2_008_generator_29_0100_0199 =
      ep_Q2_008_partial_29_0138 := by
  native_decide

/-- Coefficient term 139 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0139 : Poly :=
[
  term ((385887772254726000 : Rat) / 692956453614176359) [(1, 1), (9, 1), (12, 1), (16, 1)]
]

/-- Partial product 139 for generator 29. -/
def ep_Q2_008_partial_29_0139 : Poly :=
[
  term ((771775544509452000 : Rat) / 692956453614176359) [(1, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-385887772254726000 : Rat) / 692956453614176359) [(1, 1), (9, 1), (12, 1), (13, 2), (16, 1)],
  term ((771775544509452000 : Rat) / 692956453614176359) [(1, 1), (9, 1), (12, 2), (14, 1), (16, 1)],
  term ((-385887772254726000 : Rat) / 692956453614176359) [(1, 1), (9, 1), (12, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 139 for generator 29. -/
theorem ep_Q2_008_partial_29_0139_valid :
    mulPoly ep_Q2_008_coefficient_29_0139
        ep_Q2_008_generator_29_0100_0199 =
      ep_Q2_008_partial_29_0139 := by
  native_decide

/-- Coefficient term 140 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0140 : Poly :=
[
  term ((47640465710460000 : Rat) / 692956453614176359) [(1, 1), (10, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 140 for generator 29. -/
def ep_Q2_008_partial_29_0140 : Poly :=
[
  term ((95280931420920000 : Rat) / 692956453614176359) [(1, 1), (10, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-47640465710460000 : Rat) / 692956453614176359) [(1, 1), (10, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((95280931420920000 : Rat) / 692956453614176359) [(1, 1), (10, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((-47640465710460000 : Rat) / 692956453614176359) [(1, 1), (10, 1), (11, 1), (12, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 140 for generator 29. -/
theorem ep_Q2_008_partial_29_0140_valid :
    mulPoly ep_Q2_008_coefficient_29_0140
        ep_Q2_008_generator_29_0100_0199 =
      ep_Q2_008_partial_29_0140 := by
  native_decide

/-- Coefficient term 141 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0141 : Poly :=
[
  term ((-304898980546944000 : Rat) / 692956453614176359) [(1, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 141 for generator 29. -/
def ep_Q2_008_partial_29_0141 : Poly :=
[
  term ((-609797961093888000 : Rat) / 692956453614176359) [(1, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((304898980546944000 : Rat) / 692956453614176359) [(1, 1), (10, 1), (11, 1), (12, 2), (16, 1)],
  term ((-609797961093888000 : Rat) / 692956453614176359) [(1, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((304898980546944000 : Rat) / 692956453614176359) [(1, 1), (10, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 141 for generator 29. -/
theorem ep_Q2_008_partial_29_0141_valid :
    mulPoly ep_Q2_008_coefficient_29_0141
        ep_Q2_008_generator_29_0100_0199 =
      ep_Q2_008_partial_29_0141 := by
  native_decide

/-- Coefficient term 142 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0142 : Poly :=
[
  term ((-15435510890189040000 : Rat) / 692956453614176359) [(1, 1), (10, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 142 for generator 29. -/
def ep_Q2_008_partial_29_0142 : Poly :=
[
  term ((-30871021780378080000 : Rat) / 692956453614176359) [(1, 1), (10, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((15435510890189040000 : Rat) / 692956453614176359) [(1, 1), (10, 1), (12, 1), (13, 3), (16, 1)],
  term ((-30871021780378080000 : Rat) / 692956453614176359) [(1, 1), (10, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((15435510890189040000 : Rat) / 692956453614176359) [(1, 1), (10, 1), (12, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 142 for generator 29. -/
theorem ep_Q2_008_partial_29_0142_valid :
    mulPoly ep_Q2_008_coefficient_29_0142
        ep_Q2_008_generator_29_0100_0199 =
      ep_Q2_008_partial_29_0142 := by
  native_decide

/-- Coefficient term 143 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0143 : Poly :=
[
  term ((33536628109921223774287078524254174232600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 143 for generator 29. -/
def ep_Q2_008_partial_29_0143 : Poly :=
[
  term ((67073256219842447548574157048508348465200 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (10, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-33536628109921223774287078524254174232600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (10, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((67073256219842447548574157048508348465200 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (10, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-33536628109921223774287078524254174232600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (10, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 143 for generator 29. -/
theorem ep_Q2_008_partial_29_0143_valid :
    mulPoly ep_Q2_008_coefficient_29_0143
        ep_Q2_008_generator_29_0100_0199 =
      ep_Q2_008_partial_29_0143 := by
  native_decide

/-- Coefficient term 144 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0144 : Poly :=
[
  term ((19716523940061682983 : Rat) / 2771825814456705436) [(1, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 144 for generator 29. -/
def ep_Q2_008_partial_29_0144 : Poly :=
[
  term ((19716523940061682983 : Rat) / 1385912907228352718) [(1, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-19716523940061682983 : Rat) / 2771825814456705436) [(1, 1), (10, 1), (12, 2), (13, 1), (16, 1)],
  term ((19716523940061682983 : Rat) / 1385912907228352718) [(1, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-19716523940061682983 : Rat) / 2771825814456705436) [(1, 1), (10, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 144 for generator 29. -/
theorem ep_Q2_008_partial_29_0144_valid :
    mulPoly ep_Q2_008_coefficient_29_0144
        ep_Q2_008_generator_29_0100_0199 =
      ep_Q2_008_partial_29_0144 := by
  native_decide

/-- Coefficient term 145 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0145 : Poly :=
[
  term ((669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 145 for generator 29. -/
def ep_Q2_008_partial_29_0145 : Poly :=
[
  term ((1339889716095078704545649417786671104000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (10, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (10, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((1339889716095078704545649417786671104000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (10, 1), (13, 3), (15, 2), (16, 1)],
  term ((-669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (10, 1), (13, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 145 for generator 29. -/
theorem ep_Q2_008_partial_29_0145_valid :
    mulPoly ep_Q2_008_coefficient_29_0145
        ep_Q2_008_generator_29_0100_0199 =
      ep_Q2_008_partial_29_0145 := by
  native_decide

/-- Coefficient term 146 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0146 : Poly :=
[
  term ((-37677599684852024773821487827087241087500 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 146 for generator 29. -/
def ep_Q2_008_partial_29_0146 : Poly :=
[
  term ((-75355199369704049547642975654174482175000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((37677599684852024773821487827087241087500 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-75355199369704049547642975654174482175000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((37677599684852024773821487827087241087500 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 146 for generator 29. -/
theorem ep_Q2_008_partial_29_0146_valid :
    mulPoly ep_Q2_008_coefficient_29_0146
        ep_Q2_008_generator_29_0100_0199 =
      ep_Q2_008_partial_29_0146 := by
  native_decide

/-- Coefficient term 147 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0147 : Poly :=
[
  term ((-7340340419525615774908141233602624217600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 147 for generator 29. -/
def ep_Q2_008_partial_29_0147 : Poly :=
[
  term ((-14680680839051231549816282467205248435200 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (11, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((7340340419525615774908141233602624217600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-14680680839051231549816282467205248435200 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (11, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((7340340419525615774908141233602624217600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (11, 1), (12, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 147 for generator 29. -/
theorem ep_Q2_008_partial_29_0147_valid :
    mulPoly ep_Q2_008_coefficient_29_0147
        ep_Q2_008_generator_29_0100_0199 =
      ep_Q2_008_partial_29_0147 := by
  native_decide

/-- Coefficient term 148 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0148 : Poly :=
[
  term ((-28587322282435344000 : Rat) / 692956453614176359) [(1, 1), (11, 1), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 148 for generator 29. -/
def ep_Q2_008_partial_29_0148 : Poly :=
[
  term ((-57174644564870688000 : Rat) / 692956453614176359) [(1, 1), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((28587322282435344000 : Rat) / 692956453614176359) [(1, 1), (11, 1), (12, 1), (13, 4), (16, 1)],
  term ((-57174644564870688000 : Rat) / 692956453614176359) [(1, 1), (11, 1), (12, 2), (13, 2), (14, 1), (16, 1)],
  term ((28587322282435344000 : Rat) / 692956453614176359) [(1, 1), (11, 1), (12, 3), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 148 for generator 29. -/
theorem ep_Q2_008_partial_29_0148_valid :
    mulPoly ep_Q2_008_coefficient_29_0148
        ep_Q2_008_generator_29_0100_0199 =
      ep_Q2_008_partial_29_0148 := by
  native_decide

/-- Coefficient term 149 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0149 : Poly :=
[
  term ((-2366596089097314813815965124265084211200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 149 for generator 29. -/
def ep_Q2_008_partial_29_0149 : Poly :=
[
  term ((-4733192178194629627631930248530168422400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (11, 1), (12, 1), (13, 4), (15, 2), (16, 1)],
  term ((2366596089097314813815965124265084211200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (11, 1), (12, 1), (13, 5), (15, 1), (16, 1)],
  term ((-4733192178194629627631930248530168422400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (11, 1), (12, 2), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((2366596089097314813815965124265084211200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (11, 1), (12, 3), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 149 for generator 29. -/
theorem ep_Q2_008_partial_29_0149_valid :
    mulPoly ep_Q2_008_coefficient_29_0149
        ep_Q2_008_generator_29_0100_0199 =
      ep_Q2_008_partial_29_0149 := by
  native_decide

/-- Coefficient term 150 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0150 : Poly :=
[
  term ((-933178121929203327 : Rat) / 95580200498507084) [(1, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 150 for generator 29. -/
def ep_Q2_008_partial_29_0150 : Poly :=
[
  term ((-933178121929203327 : Rat) / 47790100249253542) [(1, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((933178121929203327 : Rat) / 95580200498507084) [(1, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((-933178121929203327 : Rat) / 47790100249253542) [(1, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((933178121929203327 : Rat) / 95580200498507084) [(1, 1), (11, 1), (12, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 150 for generator 29. -/
theorem ep_Q2_008_partial_29_0150_valid :
    mulPoly ep_Q2_008_coefficient_29_0150
        ep_Q2_008_generator_29_0100_0199 =
      ep_Q2_008_partial_29_0150 := by
  native_decide

/-- Coefficient term 151 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0151 : Poly :=
[
  term ((43008753766387500 : Rat) / 692956453614176359) [(1, 1), (11, 1), (12, 2), (16, 1)]
]

/-- Partial product 151 for generator 29. -/
def ep_Q2_008_partial_29_0151 : Poly :=
[
  term ((86017507532775000 : Rat) / 692956453614176359) [(1, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-43008753766387500 : Rat) / 692956453614176359) [(1, 1), (11, 1), (12, 2), (13, 2), (16, 1)],
  term ((86017507532775000 : Rat) / 692956453614176359) [(1, 1), (11, 1), (12, 3), (14, 1), (16, 1)],
  term ((-43008753766387500 : Rat) / 692956453614176359) [(1, 1), (11, 1), (12, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 151 for generator 29. -/
theorem ep_Q2_008_partial_29_0151_valid :
    mulPoly ep_Q2_008_coefficient_29_0151
        ep_Q2_008_generator_29_0100_0199 =
      ep_Q2_008_partial_29_0151 := by
  native_decide

/-- Coefficient term 152 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0152 : Poly :=
[
  term ((167486214511884838068206177223333888000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 152 for generator 29. -/
def ep_Q2_008_partial_29_0152 : Poly :=
[
  term ((334972429023769676136412354446667776000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-167486214511884838068206177223333888000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((334972429023769676136412354446667776000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-167486214511884838068206177223333888000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 152 for generator 29. -/
theorem ep_Q2_008_partial_29_0152_valid :
    mulPoly ep_Q2_008_coefficient_29_0152
        ep_Q2_008_generator_29_0100_0199 =
      ep_Q2_008_partial_29_0152 := by
  native_decide

/-- Coefficient term 153 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0153 : Poly :=
[
  term ((626637542376265875 : Rat) / 692956453614176359) [(1, 1), (11, 1), (16, 1)]
]

/-- Partial product 153 for generator 29. -/
def ep_Q2_008_partial_29_0153 : Poly :=
[
  term ((1253275084752531750 : Rat) / 692956453614176359) [(1, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-626637542376265875 : Rat) / 692956453614176359) [(1, 1), (11, 1), (12, 2), (16, 1)],
  term ((1253275084752531750 : Rat) / 692956453614176359) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-626637542376265875 : Rat) / 692956453614176359) [(1, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 153 for generator 29. -/
theorem ep_Q2_008_partial_29_0153_valid :
    mulPoly ep_Q2_008_coefficient_29_0153
        ep_Q2_008_generator_29_0100_0199 =
      ep_Q2_008_partial_29_0153 := by
  native_decide

/-- Coefficient term 154 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0154 : Poly :=
[
  term ((-1074892332814830418378796359456081536000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 154 for generator 29. -/
def ep_Q2_008_partial_29_0154 : Poly :=
[
  term ((-2149784665629660836757592718912163072000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (12, 1), (13, 2), (15, 3), (16, 1)],
  term ((1074892332814830418378796359456081536000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((-2149784665629660836757592718912163072000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (12, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((1074892332814830418378796359456081536000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (12, 3), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 154 for generator 29. -/
theorem ep_Q2_008_partial_29_0154_valid :
    mulPoly ep_Q2_008_coefficient_29_0154
        ep_Q2_008_generator_29_0100_0199 =
      ep_Q2_008_partial_29_0154 := by
  native_decide

/-- Coefficient term 155 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0155 : Poly :=
[
  term ((137228476504838990019 : Rat) / 2771825814456705436) [(1, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 155 for generator 29. -/
def ep_Q2_008_partial_29_0155 : Poly :=
[
  term ((137228476504838990019 : Rat) / 1385912907228352718) [(1, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-137228476504838990019 : Rat) / 2771825814456705436) [(1, 1), (12, 1), (13, 3), (16, 1)],
  term ((137228476504838990019 : Rat) / 1385912907228352718) [(1, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-137228476504838990019 : Rat) / 2771825814456705436) [(1, 1), (12, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 155 for generator 29. -/
theorem ep_Q2_008_partial_29_0155_valid :
    mulPoly ep_Q2_008_coefficient_29_0155
        ep_Q2_008_generator_29_0100_0199 =
      ep_Q2_008_partial_29_0155 := by
  native_decide

/-- Coefficient term 156 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0156 : Poly :=
[
  term ((-23830099512491692648331463318669363916800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 156 for generator 29. -/
def ep_Q2_008_partial_29_0156 : Poly :=
[
  term ((-47660199024983385296662926637338727833600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((23830099512491692648331463318669363916800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (12, 1), (13, 4), (15, 1), (16, 1)],
  term ((-47660199024983385296662926637338727833600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (12, 2), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((23830099512491692648331463318669363916800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (12, 3), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 156 for generator 29. -/
theorem ep_Q2_008_partial_29_0156_valid :
    mulPoly ep_Q2_008_coefficient_29_0156
        ep_Q2_008_generator_29_0100_0199 =
      ep_Q2_008_partial_29_0156 := by
  native_decide

/-- Coefficient term 157 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0157 : Poly :=
[
  term ((24459448046943444801607728160761205671750 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 157 for generator 29. -/
def ep_Q2_008_partial_29_0157 : Poly :=
[
  term ((48918896093886889603215456321522411343500 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-24459448046943444801607728160761205671750 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((48918896093886889603215456321522411343500 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-24459448046943444801607728160761205671750 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 157 for generator 29. -/
theorem ep_Q2_008_partial_29_0157_valid :
    mulPoly ep_Q2_008_coefficient_29_0157
        ep_Q2_008_generator_29_0100_0199 =
      ep_Q2_008_partial_29_0157 := by
  native_decide

/-- Coefficient term 158 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0158 : Poly :=
[
  term ((-63892801305851915029291942101720580800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 158 for generator 29. -/
def ep_Q2_008_partial_29_0158 : Poly :=
[
  term ((-127785602611703830058583884203441161600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((63892801305851915029291942101720580800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((-127785602611703830058583884203441161600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (12, 3), (14, 1), (15, 1), (16, 1)],
  term ((63892801305851915029291942101720580800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (12, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 158 for generator 29. -/
theorem ep_Q2_008_partial_29_0158_valid :
    mulPoly ep_Q2_008_coefficient_29_0158
        ep_Q2_008_generator_29_0100_0199 =
      ep_Q2_008_partial_29_0158 := by
  native_decide

/-- Coefficient term 159 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0159 : Poly :=
[
  term ((-7832264964728894661 : Rat) / 5543651628913410872) [(1, 1), (13, 1), (16, 1)]
]

/-- Partial product 159 for generator 29. -/
def ep_Q2_008_partial_29_0159 : Poly :=
[
  term ((-7832264964728894661 : Rat) / 2771825814456705436) [(1, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((7832264964728894661 : Rat) / 5543651628913410872) [(1, 1), (12, 2), (13, 1), (16, 1)],
  term ((-7832264964728894661 : Rat) / 2771825814456705436) [(1, 1), (13, 2), (15, 1), (16, 1)],
  term ((7832264964728894661 : Rat) / 5543651628913410872) [(1, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 159 for generator 29. -/
theorem ep_Q2_008_partial_29_0159_valid :
    mulPoly ep_Q2_008_coefficient_29_0159
        ep_Q2_008_generator_29_0100_0199 =
      ep_Q2_008_partial_29_0159 := by
  native_decide

/-- Coefficient term 160 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0160 : Poly :=
[
  term ((-55828738170628279356068725741111296000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 160 for generator 29. -/
def ep_Q2_008_partial_29_0160 : Poly :=
[
  term ((-111657476341256558712137451482222592000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((55828738170628279356068725741111296000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((-111657476341256558712137451482222592000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (13, 3), (15, 2), (16, 1)],
  term ((55828738170628279356068725741111296000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (13, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 160 for generator 29. -/
theorem ep_Q2_008_partial_29_0160_valid :
    mulPoly ep_Q2_008_coefficient_29_0160
        ep_Q2_008_generator_29_0100_0199 =
      ep_Q2_008_partial_29_0160 := by
  native_decide

/-- Coefficient term 161 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0161 : Poly :=
[
  term ((-42509459680196361970254740180041205981700 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 161 for generator 29. -/
def ep_Q2_008_partial_29_0161 : Poly :=
[
  term ((-85018919360392723940509480360082411963400 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((42509459680196361970254740180041205981700 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (12, 2), (15, 1), (16, 1)],
  term ((-85018919360392723940509480360082411963400 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (13, 1), (15, 2), (16, 1)],
  term ((42509459680196361970254740180041205981700 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 161 for generator 29. -/
theorem ep_Q2_008_partial_29_0161_valid :
    mulPoly ep_Q2_008_coefficient_29_0161
        ep_Q2_008_generator_29_0100_0199 =
      ep_Q2_008_partial_29_0161 := by
  native_decide

/-- Coefficient term 162 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0162 : Poly :=
[
  term ((669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 2), (4, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 162 for generator 29. -/
def ep_Q2_008_partial_29_0162 : Poly :=
[
  term ((1339889716095078704545649417786671104000 : Rat) / 84353800925664757687870414129491527348999) [(1, 2), (4, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 2), (4, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((1339889716095078704545649417786671104000 : Rat) / 84353800925664757687870414129491527348999) [(1, 2), (4, 1), (13, 2), (15, 2), (16, 1)],
  term ((-669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 2), (4, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 162 for generator 29. -/
theorem ep_Q2_008_partial_29_0162_valid :
    mulPoly ep_Q2_008_coefficient_29_0162
        ep_Q2_008_generator_29_0100_0199 =
      ep_Q2_008_partial_29_0162 := by
  native_decide

/-- Coefficient term 163 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0163 : Poly :=
[
  term ((10455217405948258983 : Rat) / 2771825814456705436) [(1, 2), (4, 1), (16, 1)]
]

/-- Partial product 163 for generator 29. -/
def ep_Q2_008_partial_29_0163 : Poly :=
[
  term ((10455217405948258983 : Rat) / 1385912907228352718) [(1, 2), (4, 1), (12, 1), (14, 1), (16, 1)],
  term ((-10455217405948258983 : Rat) / 2771825814456705436) [(1, 2), (4, 1), (12, 2), (16, 1)],
  term ((10455217405948258983 : Rat) / 1385912907228352718) [(1, 2), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-10455217405948258983 : Rat) / 2771825814456705436) [(1, 2), (4, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 163 for generator 29. -/
theorem ep_Q2_008_partial_29_0163_valid :
    mulPoly ep_Q2_008_coefficient_29_0163
        ep_Q2_008_generator_29_0100_0199 =
      ep_Q2_008_partial_29_0163 := by
  native_decide

/-- Coefficient term 164 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0164 : Poly :=
[
  term ((-669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 164 for generator 29. -/
def ep_Q2_008_partial_29_0164 : Poly :=
[
  term ((-1339889716095078704545649417786671104000 : Rat) / 84353800925664757687870414129491527348999) [(1, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1339889716095078704545649417786671104000 : Rat) / 84353800925664757687870414129491527348999) [(1, 2), (13, 2), (15, 2), (16, 1)],
  term ((669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 2), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 164 for generator 29. -/
theorem ep_Q2_008_partial_29_0164_valid :
    mulPoly ep_Q2_008_coefficient_29_0164
        ep_Q2_008_generator_29_0100_0199 =
      ep_Q2_008_partial_29_0164 := by
  native_decide

/-- Coefficient term 165 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0165 : Poly :=
[
  term ((-10455217405948258983 : Rat) / 2771825814456705436) [(1, 2), (16, 1)]
]

/-- Partial product 165 for generator 29. -/
def ep_Q2_008_partial_29_0165 : Poly :=
[
  term ((-10455217405948258983 : Rat) / 1385912907228352718) [(1, 2), (12, 1), (14, 1), (16, 1)],
  term ((10455217405948258983 : Rat) / 2771825814456705436) [(1, 2), (12, 2), (16, 1)],
  term ((-10455217405948258983 : Rat) / 1385912907228352718) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((10455217405948258983 : Rat) / 2771825814456705436) [(1, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 165 for generator 29. -/
theorem ep_Q2_008_partial_29_0165_valid :
    mulPoly ep_Q2_008_coefficient_29_0165
        ep_Q2_008_generator_29_0100_0199 =
      ep_Q2_008_partial_29_0165 := by
  native_decide

/-- Coefficient term 166 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0166 : Poly :=
[
  term ((-52208389534807899966554525138047200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 166 for generator 29. -/
def ep_Q2_008_partial_29_0166 : Poly :=
[
  term ((-104416779069615799933109050276094400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (6, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((52208389534807899966554525138047200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (6, 1), (12, 2), (15, 1), (16, 1)],
  term ((-104416779069615799933109050276094400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((52208389534807899966554525138047200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (6, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 166 for generator 29. -/
theorem ep_Q2_008_partial_29_0166_valid :
    mulPoly ep_Q2_008_coefficient_29_0166
        ep_Q2_008_generator_29_0100_0199 =
      ep_Q2_008_partial_29_0166 := by
  native_decide

/-- Coefficient term 167 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0167 : Poly :=
[
  term ((-215817414009571000480626496701028800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 167 for generator 29. -/
def ep_Q2_008_partial_29_0167 : Poly :=
[
  term ((-431634828019142000961252993402057600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((215817414009571000480626496701028800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-431634828019142000961252993402057600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((215817414009571000480626496701028800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 167 for generator 29. -/
theorem ep_Q2_008_partial_29_0167_valid :
    mulPoly ep_Q2_008_coefficient_29_0167
        ep_Q2_008_generator_29_0100_0199 =
      ep_Q2_008_partial_29_0167 := by
  native_decide

/-- Coefficient term 168 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0168 : Poly :=
[
  term ((-385887772254726000 : Rat) / 692956453614176359) [(3, 1), (4, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 168 for generator 29. -/
def ep_Q2_008_partial_29_0168 : Poly :=
[
  term ((-771775544509452000 : Rat) / 692956453614176359) [(3, 1), (4, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((385887772254726000 : Rat) / 692956453614176359) [(3, 1), (4, 1), (10, 1), (12, 2), (13, 1), (16, 1)],
  term ((-771775544509452000 : Rat) / 692956453614176359) [(3, 1), (4, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((385887772254726000 : Rat) / 692956453614176359) [(3, 1), (4, 1), (10, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 168 for generator 29. -/
theorem ep_Q2_008_partial_29_0168_valid :
    mulPoly ep_Q2_008_coefficient_29_0168
        ep_Q2_008_generator_29_0100_0199 =
      ep_Q2_008_partial_29_0168 := by
  native_decide

/-- Coefficient term 169 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0169 : Poly :=
[
  term ((-23820232855230000 : Rat) / 692956453614176359) [(3, 1), (4, 1), (11, 1), (16, 1)]
]

/-- Partial product 169 for generator 29. -/
def ep_Q2_008_partial_29_0169 : Poly :=
[
  term ((-47640465710460000 : Rat) / 692956453614176359) [(3, 1), (4, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((23820232855230000 : Rat) / 692956453614176359) [(3, 1), (4, 1), (11, 1), (12, 2), (16, 1)],
  term ((-47640465710460000 : Rat) / 692956453614176359) [(3, 1), (4, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((23820232855230000 : Rat) / 692956453614176359) [(3, 1), (4, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 169 for generator 29. -/
theorem ep_Q2_008_partial_29_0169_valid :
    mulPoly ep_Q2_008_coefficient_29_0169
        ep_Q2_008_generator_29_0100_0199 =
      ep_Q2_008_partial_29_0169 := by
  native_decide

/-- Coefficient term 170 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0170 : Poly :=
[
  term ((-1405721515133249475 : Rat) / 1385912907228352718) [(3, 1), (4, 1), (13, 1), (16, 1)]
]

/-- Partial product 170 for generator 29. -/
def ep_Q2_008_partial_29_0170 : Poly :=
[
  term ((-1405721515133249475 : Rat) / 692956453614176359) [(3, 1), (4, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((1405721515133249475 : Rat) / 1385912907228352718) [(3, 1), (4, 1), (12, 2), (13, 1), (16, 1)],
  term ((-1405721515133249475 : Rat) / 692956453614176359) [(3, 1), (4, 1), (13, 2), (15, 1), (16, 1)],
  term ((1405721515133249475 : Rat) / 1385912907228352718) [(3, 1), (4, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 170 for generator 29. -/
theorem ep_Q2_008_partial_29_0170_valid :
    mulPoly ep_Q2_008_coefficient_29_0170
        ep_Q2_008_generator_29_0100_0199 =
      ep_Q2_008_partial_29_0170 := by
  native_decide

/-- Coefficient term 171 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0171 : Poly :=
[
  term ((-478060622764964799693876234252168883200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 171 for generator 29. -/
def ep_Q2_008_partial_29_0171 : Poly :=
[
  term ((-956121245529929599387752468504337766400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((478060622764964799693876234252168883200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((-956121245529929599387752468504337766400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (13, 3), (15, 2), (16, 1)],
  term ((478060622764964799693876234252168883200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (13, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 171 for generator 29. -/
theorem ep_Q2_008_partial_29_0171_valid :
    mulPoly ep_Q2_008_coefficient_29_0171
        ep_Q2_008_generator_29_0100_0199 =
      ep_Q2_008_partial_29_0171 := by
  native_decide

/-- Coefficient term 172 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0172 : Poly :=
[
  term ((4787489187060340470768514981770751990800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (15, 1), (16, 1)]
]

/-- Partial product 172 for generator 29. -/
def ep_Q2_008_partial_29_0172 : Poly :=
[
  term ((9574978374120680941537029963541503981600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4787489187060340470768514981770751990800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (12, 2), (15, 1), (16, 1)],
  term ((9574978374120680941537029963541503981600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (13, 1), (15, 2), (16, 1)],
  term ((-4787489187060340470768514981770751990800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 172 for generator 29. -/
theorem ep_Q2_008_partial_29_0172_valid :
    mulPoly ep_Q2_008_coefficient_29_0172
        ep_Q2_008_generator_29_0100_0199 =
      ep_Q2_008_partial_29_0172 := by
  native_decide

/-- Coefficient term 173 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0173 : Poly :=
[
  term ((516327403063627358773572644048793600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 173 for generator 29. -/
def ep_Q2_008_partial_29_0173 : Poly :=
[
  term ((1032654806127254717547145288097587200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-516327403063627358773572644048793600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((1032654806127254717547145288097587200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 1), (13, 3), (15, 2), (16, 1)],
  term ((-516327403063627358773572644048793600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 1), (13, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 173 for generator 29. -/
theorem ep_Q2_008_partial_29_0173_valid :
    mulPoly ep_Q2_008_coefficient_29_0173
        ep_Q2_008_generator_29_0100_0199 =
      ep_Q2_008_partial_29_0173 := by
  native_decide

/-- Coefficient term 174 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0174 : Poly :=
[
  term ((-3796525022526671755688034147417600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 174 for generator 29. -/
def ep_Q2_008_partial_29_0174 : Poly :=
[
  term ((-7593050045053343511376068294835200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((3796525022526671755688034147417600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((-7593050045053343511376068294835200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((3796525022526671755688034147417600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 174 for generator 29. -/
theorem ep_Q2_008_partial_29_0174_valid :
    mulPoly ep_Q2_008_coefficient_29_0174
        ep_Q2_008_generator_29_0100_0199 =
      ep_Q2_008_partial_29_0174 := by
  native_decide

/-- Coefficient term 175 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0175 : Poly :=
[
  term ((86111778068036223792 : Rat) / 692956453614176359) [(3, 1), (5, 1), (6, 1), (13, 2), (16, 1)]
]

/-- Partial product 175 for generator 29. -/
def ep_Q2_008_partial_29_0175 : Poly :=
[
  term ((172223556136072447584 : Rat) / 692956453614176359) [(3, 1), (5, 1), (6, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-86111778068036223792 : Rat) / 692956453614176359) [(3, 1), (5, 1), (6, 1), (12, 2), (13, 2), (16, 1)],
  term ((172223556136072447584 : Rat) / 692956453614176359) [(3, 1), (5, 1), (6, 1), (13, 3), (15, 1), (16, 1)],
  term ((-86111778068036223792 : Rat) / 692956453614176359) [(3, 1), (5, 1), (6, 1), (13, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 175 for generator 29. -/
theorem ep_Q2_008_partial_29_0175_valid :
    mulPoly ep_Q2_008_coefficient_29_0175
        ep_Q2_008_generator_29_0100_0199 =
      ep_Q2_008_partial_29_0175 := by
  native_decide

/-- Coefficient term 176 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0176 : Poly :=
[
  term ((-30955433660627124993 : Rat) / 2771825814456705436) [(3, 1), (5, 1), (6, 1), (16, 1)]
]

/-- Partial product 176 for generator 29. -/
def ep_Q2_008_partial_29_0176 : Poly :=
[
  term ((-30955433660627124993 : Rat) / 1385912907228352718) [(3, 1), (5, 1), (6, 1), (12, 1), (14, 1), (16, 1)],
  term ((30955433660627124993 : Rat) / 2771825814456705436) [(3, 1), (5, 1), (6, 1), (12, 2), (16, 1)],
  term ((-30955433660627124993 : Rat) / 1385912907228352718) [(3, 1), (5, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((30955433660627124993 : Rat) / 2771825814456705436) [(3, 1), (5, 1), (6, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 176 for generator 29. -/
theorem ep_Q2_008_partial_29_0176_valid :
    mulPoly ep_Q2_008_coefficient_29_0176
        ep_Q2_008_generator_29_0100_0199 =
      ep_Q2_008_partial_29_0176 := by
  native_decide

/-- Coefficient term 177 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0177 : Poly :=
[
  term ((151276488626617580633929916194929600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 177 for generator 29. -/
def ep_Q2_008_partial_29_0177 : Poly :=
[
  term ((302552977253235161267859832389859200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-151276488626617580633929916194929600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((302552977253235161267859832389859200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-151276488626617580633929916194929600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 177 for generator 29. -/
theorem ep_Q2_008_partial_29_0177_valid :
    mulPoly ep_Q2_008_coefficient_29_0177
        ep_Q2_008_generator_29_0100_0199 =
      ep_Q2_008_partial_29_0177 := by
  native_decide

/-- Coefficient term 178 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0178 : Poly :=
[
  term ((258163701531813679386786322024396800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 178 for generator 29. -/
def ep_Q2_008_partial_29_0178 : Poly :=
[
  term ((516327403063627358773572644048793600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-258163701531813679386786322024396800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((516327403063627358773572644048793600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (13, 2), (15, 3), (16, 1)],
  term ((-258163701531813679386786322024396800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 178 for generator 29. -/
theorem ep_Q2_008_partial_29_0178_valid :
    mulPoly ep_Q2_008_coefficient_29_0178
        ep_Q2_008_generator_29_0100_0199 =
      ep_Q2_008_partial_29_0178 := by
  native_decide

/-- Coefficient term 179 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0179 : Poly :=
[
  term ((-629274022483795843505291659934467200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 179 for generator 29. -/
def ep_Q2_008_partial_29_0179 : Poly :=
[
  term ((-1258548044967591687010583319868934400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((629274022483795843505291659934467200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((-1258548044967591687010583319868934400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (13, 3), (15, 2), (16, 1)],
  term ((629274022483795843505291659934467200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (13, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 179 for generator 29. -/
theorem ep_Q2_008_partial_29_0179_valid :
    mulPoly ep_Q2_008_coefficient_29_0179
        ep_Q2_008_generator_29_0100_0199 =
      ep_Q2_008_partial_29_0179 := by
  native_decide

/-- Coefficient term 180 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0180 : Poly :=
[
  term ((46981997153767562976639422574292800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 180 for generator 29. -/
def ep_Q2_008_partial_29_0180 : Poly :=
[
  term ((93963994307535125953278845148585600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-46981997153767562976639422574292800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((93963994307535125953278845148585600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-46981997153767562976639422574292800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 180 for generator 29. -/
theorem ep_Q2_008_partial_29_0180_valid :
    mulPoly ep_Q2_008_coefficient_29_0180
        ep_Q2_008_generator_29_0100_0199 =
      ep_Q2_008_partial_29_0180 := by
  native_decide

/-- Coefficient term 181 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0181 : Poly :=
[
  term ((385887772254726000 : Rat) / 692956453614176359) [(3, 1), (5, 1), (10, 1), (12, 1), (16, 1)]
]

/-- Partial product 181 for generator 29. -/
def ep_Q2_008_partial_29_0181 : Poly :=
[
  term ((771775544509452000 : Rat) / 692956453614176359) [(3, 1), (5, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-385887772254726000 : Rat) / 692956453614176359) [(3, 1), (5, 1), (10, 1), (12, 1), (13, 2), (16, 1)],
  term ((771775544509452000 : Rat) / 692956453614176359) [(3, 1), (5, 1), (10, 1), (12, 2), (14, 1), (16, 1)],
  term ((-385887772254726000 : Rat) / 692956453614176359) [(3, 1), (5, 1), (10, 1), (12, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 181 for generator 29. -/
theorem ep_Q2_008_partial_29_0181_valid :
    mulPoly ep_Q2_008_coefficient_29_0181
        ep_Q2_008_generator_29_0100_0199 =
      ep_Q2_008_partial_29_0181 := by
  native_decide

/-- Coefficient term 182 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0182 : Poly :=
[
  term ((-19723739334825318723 : Rat) / 1385912907228352718) [(3, 1), (5, 1), (12, 1), (16, 1)]
]

/-- Partial product 182 for generator 29. -/
def ep_Q2_008_partial_29_0182 : Poly :=
[
  term ((-19723739334825318723 : Rat) / 692956453614176359) [(3, 1), (5, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((19723739334825318723 : Rat) / 1385912907228352718) [(3, 1), (5, 1), (12, 1), (13, 2), (16, 1)],
  term ((-19723739334825318723 : Rat) / 692956453614176359) [(3, 1), (5, 1), (12, 2), (14, 1), (16, 1)],
  term ((19723739334825318723 : Rat) / 1385912907228352718) [(3, 1), (5, 1), (12, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 182 for generator 29. -/
theorem ep_Q2_008_partial_29_0182_valid :
    mulPoly ep_Q2_008_coefficient_29_0182
        ep_Q2_008_generator_29_0100_0199 =
      ep_Q2_008_partial_29_0182 := by
  native_decide

/-- Coefficient term 183 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0183 : Poly :=
[
  term ((43055889034018111896 : Rat) / 692956453614176359) [(3, 1), (5, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 183 for generator 29. -/
def ep_Q2_008_partial_29_0183 : Poly :=
[
  term ((86111778068036223792 : Rat) / 692956453614176359) [(3, 1), (5, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-43055889034018111896 : Rat) / 692956453614176359) [(3, 1), (5, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((86111778068036223792 : Rat) / 692956453614176359) [(3, 1), (5, 1), (13, 2), (15, 2), (16, 1)],
  term ((-43055889034018111896 : Rat) / 692956453614176359) [(3, 1), (5, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 183 for generator 29. -/
theorem ep_Q2_008_partial_29_0183_valid :
    mulPoly ep_Q2_008_coefficient_29_0183
        ep_Q2_008_generator_29_0100_0199 =
      ep_Q2_008_partial_29_0183 := by
  native_decide

/-- Coefficient term 184 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0184 : Poly :=
[
  term ((-209897459040838295493 : Rat) / 1385912907228352718) [(3, 1), (5, 1), (13, 2), (16, 1)]
]

/-- Partial product 184 for generator 29. -/
def ep_Q2_008_partial_29_0184 : Poly :=
[
  term ((-209897459040838295493 : Rat) / 692956453614176359) [(3, 1), (5, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((209897459040838295493 : Rat) / 1385912907228352718) [(3, 1), (5, 1), (12, 2), (13, 2), (16, 1)],
  term ((-209897459040838295493 : Rat) / 692956453614176359) [(3, 1), (5, 1), (13, 3), (15, 1), (16, 1)],
  term ((209897459040838295493 : Rat) / 1385912907228352718) [(3, 1), (5, 1), (13, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 184 for generator 29. -/
theorem ep_Q2_008_partial_29_0184_valid :
    mulPoly ep_Q2_008_coefficient_29_0184
        ep_Q2_008_generator_29_0100_0199 =
      ep_Q2_008_partial_29_0184 := by
  native_decide

/-- Coefficient term 185 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0185 : Poly :=
[
  term ((341173208930097482937 : Rat) / 22174606515653643488) [(3, 1), (5, 1), (16, 1)]
]

/-- Partial product 185 for generator 29. -/
def ep_Q2_008_partial_29_0185 : Poly :=
[
  term ((341173208930097482937 : Rat) / 11087303257826821744) [(3, 1), (5, 1), (12, 1), (14, 1), (16, 1)],
  term ((-341173208930097482937 : Rat) / 22174606515653643488) [(3, 1), (5, 1), (12, 2), (16, 1)],
  term ((341173208930097482937 : Rat) / 11087303257826821744) [(3, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-341173208930097482937 : Rat) / 22174606515653643488) [(3, 1), (5, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 185 for generator 29. -/
theorem ep_Q2_008_partial_29_0185_valid :
    mulPoly ep_Q2_008_coefficient_29_0185
        ep_Q2_008_generator_29_0100_0199 =
      ep_Q2_008_partial_29_0185 := by
  native_decide

/-- Coefficient term 186 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0186 : Poly :=
[
  term ((-528405827529502698053045863797936000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 186 for generator 29. -/
def ep_Q2_008_partial_29_0186 : Poly :=
[
  term ((-1056811655059005396106091727595872000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((528405827529502698053045863797936000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1056811655059005396106091727595872000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((528405827529502698053045863797936000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 186 for generator 29. -/
theorem ep_Q2_008_partial_29_0186_valid :
    mulPoly ep_Q2_008_coefficient_29_0186
        ep_Q2_008_generator_29_0100_0199 =
      ep_Q2_008_partial_29_0186 := by
  native_decide

/-- Coefficient term 187 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0187 : Poly :=
[
  term ((-1459755941057526492 : Rat) / 692956453614176359) [(3, 1), (6, 1), (7, 1), (13, 2), (16, 1)]
]

/-- Partial product 187 for generator 29. -/
def ep_Q2_008_partial_29_0187 : Poly :=
[
  term ((-2919511882115052984 : Rat) / 692956453614176359) [(3, 1), (6, 1), (7, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((1459755941057526492 : Rat) / 692956453614176359) [(3, 1), (6, 1), (7, 1), (12, 2), (13, 2), (16, 1)],
  term ((-2919511882115052984 : Rat) / 692956453614176359) [(3, 1), (6, 1), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((1459755941057526492 : Rat) / 692956453614176359) [(3, 1), (6, 1), (7, 1), (13, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 187 for generator 29. -/
theorem ep_Q2_008_partial_29_0187_valid :
    mulPoly ep_Q2_008_coefficient_29_0187
        ep_Q2_008_generator_29_0100_0199 =
      ep_Q2_008_partial_29_0187 := by
  native_decide

/-- Coefficient term 188 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0188 : Poly :=
[
  term ((-29493883540250111402450771946087168000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 188 for generator 29. -/
def ep_Q2_008_partial_29_0188 : Poly :=
[
  term ((-58987767080500222804901543892174336000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((29493883540250111402450771946087168000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (12, 2), (13, 3), (15, 1), (16, 1)],
  term ((-58987767080500222804901543892174336000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (13, 4), (15, 2), (16, 1)],
  term ((29493883540250111402450771946087168000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (13, 5), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 188 for generator 29. -/
theorem ep_Q2_008_partial_29_0188_valid :
    mulPoly ep_Q2_008_coefficient_29_0188
        ep_Q2_008_generator_29_0100_0199 =
      ep_Q2_008_partial_29_0188 := by
  native_decide

/-- Coefficient term 189 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0189 : Poly :=
[
  term ((-38626612961903677663256847422728800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (15, 2), (16, 1)]
]

/-- Partial product 189 for generator 29. -/
def ep_Q2_008_partial_29_0189 : Poly :=
[
  term ((-77253225923807355326513694845457600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((38626612961903677663256847422728800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (12, 2), (15, 2), (16, 1)],
  term ((-77253225923807355326513694845457600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (13, 1), (15, 3), (16, 1)],
  term ((38626612961903677663256847422728800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 189 for generator 29. -/
theorem ep_Q2_008_partial_29_0189_valid :
    mulPoly ep_Q2_008_coefficient_29_0189
        ep_Q2_008_generator_29_0100_0199 =
      ep_Q2_008_partial_29_0189 := by
  native_decide

/-- Coefficient term 190 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0190 : Poly :=
[
  term ((-812294800564430025004231306094284800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 2), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 190 for generator 29. -/
def ep_Q2_008_partial_29_0190 : Poly :=
[
  term ((-1624589601128860050008462612188569600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 2), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((812294800564430025004231306094284800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 2), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((-1624589601128860050008462612188569600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 2), (13, 3), (15, 2), (16, 1)],
  term ((812294800564430025004231306094284800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 2), (13, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 190 for generator 29. -/
theorem ep_Q2_008_partial_29_0190_valid :
    mulPoly ep_Q2_008_coefficient_29_0190
        ep_Q2_008_generator_29_0100_0199 =
      ep_Q2_008_partial_29_0190 := by
  native_decide

/-- Coefficient term 191 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0191 : Poly :=
[
  term ((-39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 191 for generator 29. -/
def ep_Q2_008_partial_29_0191 : Poly :=
[
  term ((-78173987841078575882094280687715020800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (9, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-78173987841078575882094280687715020800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (9, 1), (13, 2), (15, 2), (16, 1)],
  term ((39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (9, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 191 for generator 29. -/
theorem ep_Q2_008_partial_29_0191_valid :
    mulPoly ep_Q2_008_coefficient_29_0191
        ep_Q2_008_generator_29_0100_0199 =
      ep_Q2_008_partial_29_0191 := by
  native_decide

/-- Coefficient term 192 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0192 : Poly :=
[
  term ((70324786932212700 : Rat) / 692956453614176359) [(3, 1), (6, 1), (9, 1), (16, 1)]
]

/-- Partial product 192 for generator 29. -/
def ep_Q2_008_partial_29_0192 : Poly :=
[
  term ((140649573864425400 : Rat) / 692956453614176359) [(3, 1), (6, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((-70324786932212700 : Rat) / 692956453614176359) [(3, 1), (6, 1), (9, 1), (12, 2), (16, 1)],
  term ((140649573864425400 : Rat) / 692956453614176359) [(3, 1), (6, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-70324786932212700 : Rat) / 692956453614176359) [(3, 1), (6, 1), (9, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 192 for generator 29. -/
theorem ep_Q2_008_partial_29_0192_valid :
    mulPoly ep_Q2_008_coefficient_29_0192
        ep_Q2_008_generator_29_0100_0199 =
      ep_Q2_008_partial_29_0192 := by
  native_decide

/-- Coefficient term 193 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0193 : Poly :=
[
  term ((-7717755445094520000 : Rat) / 692956453614176359) [(3, 1), (6, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 193 for generator 29. -/
def ep_Q2_008_partial_29_0193 : Poly :=
[
  term ((-15435510890189040000 : Rat) / 692956453614176359) [(3, 1), (6, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((7717755445094520000 : Rat) / 692956453614176359) [(3, 1), (6, 1), (10, 1), (12, 2), (13, 1), (16, 1)],
  term ((-15435510890189040000 : Rat) / 692956453614176359) [(3, 1), (6, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((7717755445094520000 : Rat) / 692956453614176359) [(3, 1), (6, 1), (10, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 193 for generator 29. -/
theorem ep_Q2_008_partial_29_0193_valid :
    mulPoly ep_Q2_008_coefficient_29_0193
        ep_Q2_008_generator_29_0100_0199 =
      ep_Q2_008_partial_29_0193 := by
  native_decide

/-- Coefficient term 194 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0194 : Poly :=
[
  term ((-2343133172956448821031328838872771360000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 194 for generator 29. -/
def ep_Q2_008_partial_29_0194 : Poly :=
[
  term ((-4686266345912897642062657677745542720000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((2343133172956448821031328838872771360000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-4686266345912897642062657677745542720000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((2343133172956448821031328838872771360000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 194 for generator 29. -/
theorem ep_Q2_008_partial_29_0194_valid :
    mulPoly ep_Q2_008_coefficient_29_0194
        ep_Q2_008_generator_29_0100_0199 =
      ep_Q2_008_partial_29_0194 := by
  native_decide

/-- Coefficient term 195 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0195 : Poly :=
[
  term ((-19058214854956896000 : Rat) / 692956453614176359) [(3, 1), (6, 1), (11, 1), (13, 2), (16, 1)]
]

/-- Partial product 195 for generator 29. -/
def ep_Q2_008_partial_29_0195 : Poly :=
[
  term ((-38116429709913792000 : Rat) / 692956453614176359) [(3, 1), (6, 1), (11, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((19058214854956896000 : Rat) / 692956453614176359) [(3, 1), (6, 1), (11, 1), (12, 2), (13, 2), (16, 1)],
  term ((-38116429709913792000 : Rat) / 692956453614176359) [(3, 1), (6, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((19058214854956896000 : Rat) / 692956453614176359) [(3, 1), (6, 1), (11, 1), (13, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 195 for generator 29. -/
theorem ep_Q2_008_partial_29_0195_valid :
    mulPoly ep_Q2_008_coefficient_29_0195
        ep_Q2_008_generator_29_0100_0199 =
      ep_Q2_008_partial_29_0195 := by
  native_decide

/-- Coefficient term 196 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0196 : Poly :=
[
  term ((-1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 196 for generator 29. -/
def ep_Q2_008_partial_29_0196 : Poly :=
[
  term ((-3155461452129753085087953499020112281600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (11, 1), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (11, 1), (12, 2), (13, 3), (15, 1), (16, 1)],
  term ((-3155461452129753085087953499020112281600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (11, 1), (13, 4), (15, 2), (16, 1)],
  term ((1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (11, 1), (13, 5), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 196 for generator 29. -/
theorem ep_Q2_008_partial_29_0196_valid :
    mulPoly ep_Q2_008_coefficient_29_0196
        ep_Q2_008_generator_29_0100_0199 =
      ep_Q2_008_partial_29_0196 := by
  native_decide

/-- Coefficient term 197 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0197 : Poly :=
[
  term ((386184132494305875 : Rat) / 1385912907228352718) [(3, 1), (6, 1), (11, 1), (16, 1)]
]

/-- Partial product 197 for generator 29. -/
def ep_Q2_008_partial_29_0197 : Poly :=
[
  term ((386184132494305875 : Rat) / 692956453614176359) [(3, 1), (6, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-386184132494305875 : Rat) / 1385912907228352718) [(3, 1), (6, 1), (11, 1), (12, 2), (16, 1)],
  term ((386184132494305875 : Rat) / 692956453614176359) [(3, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-386184132494305875 : Rat) / 1385912907228352718) [(3, 1), (6, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 197 for generator 29. -/
theorem ep_Q2_008_partial_29_0197_valid :
    mulPoly ep_Q2_008_coefficient_29_0197
        ep_Q2_008_generator_29_0100_0199 =
      ep_Q2_008_partial_29_0197 := by
  native_decide

/-- Coefficient term 198 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0198 : Poly :=
[
  term ((-21935045861953702780443915773903649060600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 198 for generator 29. -/
def ep_Q2_008_partial_29_0198 : Poly :=
[
  term ((-43870091723907405560887831547807298121200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((21935045861953702780443915773903649060600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-43870091723907405560887831547807298121200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((21935045861953702780443915773903649060600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 198 for generator 29. -/
theorem ep_Q2_008_partial_29_0198_valid :
    mulPoly ep_Q2_008_coefficient_29_0198
        ep_Q2_008_generator_29_0100_0199 =
      ep_Q2_008_partial_29_0198 := by
  native_decide

/-- Coefficient term 199 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0199 : Poly :=
[
  term ((29315245440404465955785355257893132800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 199 for generator 29. -/
def ep_Q2_008_partial_29_0199 : Poly :=
[
  term ((58630490880808931911570710515786265600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-29315245440404465955785355257893132800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((58630490880808931911570710515786265600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (13, 2), (15, 3), (16, 1)],
  term ((-29315245440404465955785355257893132800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 199 for generator 29. -/
theorem ep_Q2_008_partial_29_0199_valid :
    mulPoly ep_Q2_008_coefficient_29_0199
        ep_Q2_008_generator_29_0100_0199 =
      ep_Q2_008_partial_29_0199 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_008_partials_29_0100_0199 : List Poly :=
[
  ep_Q2_008_partial_29_0100,
  ep_Q2_008_partial_29_0101,
  ep_Q2_008_partial_29_0102,
  ep_Q2_008_partial_29_0103,
  ep_Q2_008_partial_29_0104,
  ep_Q2_008_partial_29_0105,
  ep_Q2_008_partial_29_0106,
  ep_Q2_008_partial_29_0107,
  ep_Q2_008_partial_29_0108,
  ep_Q2_008_partial_29_0109,
  ep_Q2_008_partial_29_0110,
  ep_Q2_008_partial_29_0111,
  ep_Q2_008_partial_29_0112,
  ep_Q2_008_partial_29_0113,
  ep_Q2_008_partial_29_0114,
  ep_Q2_008_partial_29_0115,
  ep_Q2_008_partial_29_0116,
  ep_Q2_008_partial_29_0117,
  ep_Q2_008_partial_29_0118,
  ep_Q2_008_partial_29_0119,
  ep_Q2_008_partial_29_0120,
  ep_Q2_008_partial_29_0121,
  ep_Q2_008_partial_29_0122,
  ep_Q2_008_partial_29_0123,
  ep_Q2_008_partial_29_0124,
  ep_Q2_008_partial_29_0125,
  ep_Q2_008_partial_29_0126,
  ep_Q2_008_partial_29_0127,
  ep_Q2_008_partial_29_0128,
  ep_Q2_008_partial_29_0129,
  ep_Q2_008_partial_29_0130,
  ep_Q2_008_partial_29_0131,
  ep_Q2_008_partial_29_0132,
  ep_Q2_008_partial_29_0133,
  ep_Q2_008_partial_29_0134,
  ep_Q2_008_partial_29_0135,
  ep_Q2_008_partial_29_0136,
  ep_Q2_008_partial_29_0137,
  ep_Q2_008_partial_29_0138,
  ep_Q2_008_partial_29_0139,
  ep_Q2_008_partial_29_0140,
  ep_Q2_008_partial_29_0141,
  ep_Q2_008_partial_29_0142,
  ep_Q2_008_partial_29_0143,
  ep_Q2_008_partial_29_0144,
  ep_Q2_008_partial_29_0145,
  ep_Q2_008_partial_29_0146,
  ep_Q2_008_partial_29_0147,
  ep_Q2_008_partial_29_0148,
  ep_Q2_008_partial_29_0149,
  ep_Q2_008_partial_29_0150,
  ep_Q2_008_partial_29_0151,
  ep_Q2_008_partial_29_0152,
  ep_Q2_008_partial_29_0153,
  ep_Q2_008_partial_29_0154,
  ep_Q2_008_partial_29_0155,
  ep_Q2_008_partial_29_0156,
  ep_Q2_008_partial_29_0157,
  ep_Q2_008_partial_29_0158,
  ep_Q2_008_partial_29_0159,
  ep_Q2_008_partial_29_0160,
  ep_Q2_008_partial_29_0161,
  ep_Q2_008_partial_29_0162,
  ep_Q2_008_partial_29_0163,
  ep_Q2_008_partial_29_0164,
  ep_Q2_008_partial_29_0165,
  ep_Q2_008_partial_29_0166,
  ep_Q2_008_partial_29_0167,
  ep_Q2_008_partial_29_0168,
  ep_Q2_008_partial_29_0169,
  ep_Q2_008_partial_29_0170,
  ep_Q2_008_partial_29_0171,
  ep_Q2_008_partial_29_0172,
  ep_Q2_008_partial_29_0173,
  ep_Q2_008_partial_29_0174,
  ep_Q2_008_partial_29_0175,
  ep_Q2_008_partial_29_0176,
  ep_Q2_008_partial_29_0177,
  ep_Q2_008_partial_29_0178,
  ep_Q2_008_partial_29_0179,
  ep_Q2_008_partial_29_0180,
  ep_Q2_008_partial_29_0181,
  ep_Q2_008_partial_29_0182,
  ep_Q2_008_partial_29_0183,
  ep_Q2_008_partial_29_0184,
  ep_Q2_008_partial_29_0185,
  ep_Q2_008_partial_29_0186,
  ep_Q2_008_partial_29_0187,
  ep_Q2_008_partial_29_0188,
  ep_Q2_008_partial_29_0189,
  ep_Q2_008_partial_29_0190,
  ep_Q2_008_partial_29_0191,
  ep_Q2_008_partial_29_0192,
  ep_Q2_008_partial_29_0193,
  ep_Q2_008_partial_29_0194,
  ep_Q2_008_partial_29_0195,
  ep_Q2_008_partial_29_0196,
  ep_Q2_008_partial_29_0197,
  ep_Q2_008_partial_29_0198,
  ep_Q2_008_partial_29_0199
]

/-- Sum of partial products in this block. -/
def ep_Q2_008_block_29_0100_0199 : Poly :=
[
  term ((-11741509980130678983 : Rat) / 1385912907228352718) [(1, 1), (5, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((11741509980130678983 : Rat) / 2771825814456705436) [(1, 1), (5, 1), (10, 1), (12, 2), (16, 1)],
  term ((-11741509980130678983 : Rat) / 1385912907228352718) [(1, 1), (5, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((11741509980130678983 : Rat) / 2771825814456705436) [(1, 1), (5, 1), (10, 1), (13, 2), (16, 1)],
  term ((1339889716095078704545649417786671104000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (5, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-41342805309779996331 : Rat) / 1385912907228352718) [(1, 1), (5, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((2679779432190157409091298835573342208000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (5, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((41342805309779996331 : Rat) / 2771825814456705436) [(1, 1), (5, 1), (12, 1), (13, 2), (16, 1)],
  term ((31445899312491472368487111107050326318440336 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (5, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-129167667102054335688 : Rat) / 692956453614176359) [(1, 1), (5, 1), (12, 1), (13, 4), (16, 1)],
  term ((56506560384830142915 : Rat) / 2771825814456705436) [(1, 1), (5, 1), (12, 1), (14, 1), (16, 1)],
  term ((2679779432190157409091298835573342208000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (5, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (5, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((258335334204108671376 : Rat) / 692956453614176359) [(1, 1), (5, 1), (12, 2), (13, 2), (14, 1), (16, 1)],
  term ((-41342805309779996331 : Rat) / 1385912907228352718) [(1, 1), (5, 1), (12, 2), (14, 1), (16, 1)],
  term ((-56506560384830142915 : Rat) / 5543651628913410872) [(1, 1), (5, 1), (12, 2), (16, 1)],
  term ((-1339889716095078704545649417786671104000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (5, 1), (12, 3), (13, 1), (15, 1), (16, 1)],
  term ((-129167667102054335688 : Rat) / 692956453614176359) [(1, 1), (5, 1), (12, 3), (13, 2), (16, 1)],
  term ((41342805309779996331 : Rat) / 2771825814456705436) [(1, 1), (5, 1), (12, 3), (16, 1)],
  term ((56506560384830142915 : Rat) / 2771825814456705436) [(1, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((1339889716095078704545649417786671104000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (5, 1), (13, 2), (15, 2), (16, 1)],
  term ((-56506560384830142915 : Rat) / 5543651628913410872) [(1, 1), (5, 1), (13, 2), (16, 1)],
  term ((-669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (5, 1), (13, 3), (15, 1), (16, 1)],
  term ((-313092148666242121809506816072140800 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((4379267823172579476 : Rat) / 692956453614176359) [(1, 1), (6, 1), (7, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((88481650620750334207352315838261504000 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (7, 1), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((18498680662796933724 : Rat) / 692956453614176359) [(1, 1), (6, 1), (7, 1), (12, 1), (14, 1), (16, 1)],
  term ((156546074333121060904753408036070400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (7, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-2189633911586289738 : Rat) / 692956453614176359) [(1, 1), (6, 1), (7, 1), (12, 2), (13, 2), (16, 1)],
  term ((-44240825310375167103676157919130752000 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (7, 1), (12, 2), (13, 3), (15, 1), (16, 1)],
  term ((-9249340331398466862 : Rat) / 692956453614176359) [(1, 1), (6, 1), (7, 1), (12, 2), (16, 1)],
  term ((18498680662796933724 : Rat) / 692956453614176359) [(1, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-313092148666242121809506816072140800 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((-9249340331398466862 : Rat) / 692956453614176359) [(1, 1), (6, 1), (7, 1), (13, 2), (16, 1)],
  term ((533094150632604924271720090860247552470036 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((88481650620750334207352315838261504000 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (7, 1), (13, 4), (15, 2), (16, 1)],
  term ((-2189633911586289738 : Rat) / 692956453614176359) [(1, 1), (6, 1), (7, 1), (13, 4), (16, 1)],
  term ((-44240825310375167103676157919130752000 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (7, 1), (13, 5), (15, 1), (16, 1)],
  term ((2436884401693290075012693918282854400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (7, 2), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((173347716986005055057585559156556800 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (7, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1218442200846645037506346959141427200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (7, 2), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((-86673858493002527528792779578278400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (7, 2), (12, 2), (15, 1), (16, 1)],
  term ((173347716986005055057585559156556800 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (7, 2), (13, 1), (15, 2), (16, 1)],
  term ((-86673858493002527528792779578278400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (7, 2), (13, 2), (15, 1), (16, 1)],
  term ((2436884401693290075012693918282854400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (7, 2), (13, 3), (15, 2), (16, 1)],
  term ((-1218442200846645037506346959141427200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (7, 2), (13, 4), (15, 1), (16, 1)],
  term ((-597518386907264827702789605229191168000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((298759193453632413851394802614595584000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((-597518386907264827702789605229191168000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((298759193453632413851394802614595584000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (8, 1), (13, 2), (15, 1), (16, 1)],
  term ((27783919602340272000 : Rat) / 692956453614176359) [(1, 1), (6, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-13891959801170136000 : Rat) / 692956453614176359) [(1, 1), (6, 1), (10, 1), (12, 2), (13, 1), (16, 1)],
  term ((27783919602340272000 : Rat) / 692956453614176359) [(1, 1), (6, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-13891959801170136000 : Rat) / 692956453614176359) [(1, 1), (6, 1), (10, 1), (13, 3), (16, 1)],
  term ((13340791122956152845270633049418577331200 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((57174644564870688000 : Rat) / 692956453614176359) [(1, 1), (6, 1), (11, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((4733192178194629627631930248530168422400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (11, 1), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((7350664750790118750 : Rat) / 692956453614176359) [(1, 1), (6, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-6670395561478076422635316524709288665600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-28587322282435344000 : Rat) / 692956453614176359) [(1, 1), (6, 1), (11, 1), (12, 2), (13, 2), (16, 1)],
  term ((-2366596089097314813815965124265084211200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (11, 1), (12, 2), (13, 3), (15, 1), (16, 1)],
  term ((-3675332375395059375 : Rat) / 692956453614176359) [(1, 1), (6, 1), (11, 1), (12, 2), (16, 1)],
  term ((7350664750790118750 : Rat) / 692956453614176359) [(1, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((13340791122956152845270633049418577331200 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-3675332375395059375 : Rat) / 692956453614176359) [(1, 1), (6, 1), (11, 1), (13, 2), (16, 1)],
  term ((6953216564818908937691135014650229618502400 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((4733192178194629627631930248530168422400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (11, 1), (13, 4), (15, 2), (16, 1)],
  term ((-28587322282435344000 : Rat) / 692956453614176359) [(1, 1), (6, 1), (11, 1), (13, 4), (16, 1)],
  term ((-2366596089097314813815965124265084211200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (11, 1), (13, 5), (15, 1), (16, 1)],
  term ((2149784665629660836757592718912163072000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-68868009933292329840 : Rat) / 692956453614176359) [(1, 1), (6, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-86058583720791887750218577152794424202400 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((46766939214253332826965827025480947097600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((43029291860395943875109288576397212101200 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((152452026773178522280571022021857010329100 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1074892332814830418378796359456081536000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((34434004966646164920 : Rat) / 692956453614176359) [(1, 1), (6, 1), (12, 2), (13, 1), (16, 1)],
  term ((-23383469607126666413482913512740473548800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((-86058583720791887750218577152794424202400 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-76226013386589261140285511010928505164550 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (12, 2), (15, 1), (16, 1)],
  term ((43029291860395943875109288576397212101200 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (12, 3), (15, 1), (16, 1)],
  term ((152452026773178522280571022021857010329100 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((-8459549914565131154682297963113140417820790 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (13, 2), (15, 1), (16, 1)],
  term ((2149784665629660836757592718912163072000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (13, 2), (15, 3), (16, 1)],
  term ((45692046881438502408587030666024865561600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (13, 3), (15, 2), (16, 1)],
  term ((34434004966646164920 : Rat) / 692956453614176359) [(1, 1), (6, 1), (13, 3), (16, 1)],
  term ((-23383469607126666413482913512740473548800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (13, 4), (15, 1), (16, 1)],
  term ((87253620494606417405624156363252806538400 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-43626810247303208702812078181626403269200 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 2), (12, 2), (15, 1), (16, 1)],
  term ((87253620494606417405624156363252806538400 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 2), (13, 1), (15, 2), (16, 1)],
  term ((-43626810247303208702812078181626403269200 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 2), (13, 2), (15, 1), (16, 1)],
  term ((1029034059345936000 : Rat) / 692956453614176359) [(1, 1), (7, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-514517029672968000 : Rat) / 692956453614176359) [(1, 1), (7, 1), (10, 1), (12, 2), (16, 1)],
  term ((1029034059345936000 : Rat) / 692956453614176359) [(1, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-514517029672968000 : Rat) / 692956453614176359) [(1, 1), (7, 1), (10, 1), (13, 2), (16, 1)],
  term ((-20042231751815837724 : Rat) / 692956453614176359) [(1, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((313092148666242121809506816072140800 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (7, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((10021115875907918862 : Rat) / 692956453614176359) [(1, 1), (7, 1), (12, 1), (13, 2), (16, 1)],
  term ((-533094150632604924271720090860247552470036 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (7, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-88481650620750334207352315838261504000 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (7, 1), (12, 1), (13, 4), (15, 2), (16, 1)],
  term ((2189633911586289738 : Rat) / 692956453614176359) [(1, 1), (7, 1), (12, 1), (13, 4), (16, 1)],
  term ((44240825310375167103676157919130752000 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (7, 1), (12, 1), (13, 5), (15, 1), (16, 1)],
  term ((-1029034059345936000 : Rat) / 692956453614176359) [(1, 1), (7, 1), (12, 1), (14, 1), (16, 1)],
  term ((313092148666242121809506816072140800 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (7, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4379267823172579476 : Rat) / 692956453614176359) [(1, 1), (7, 1), (12, 2), (13, 2), (14, 1), (16, 1)],
  term ((-88481650620750334207352315838261504000 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (7, 1), (12, 2), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-20042231751815837724 : Rat) / 692956453614176359) [(1, 1), (7, 1), (12, 2), (14, 1), (16, 1)],
  term ((514517029672968000 : Rat) / 692956453614176359) [(1, 1), (7, 1), (12, 2), (16, 1)],
  term ((-156546074333121060904753408036070400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (7, 1), (12, 3), (13, 1), (15, 1), (16, 1)],
  term ((2189633911586289738 : Rat) / 692956453614176359) [(1, 1), (7, 1), (12, 3), (13, 2), (16, 1)],
  term ((44240825310375167103676157919130752000 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (7, 1), (12, 3), (13, 3), (15, 1), (16, 1)],
  term ((10021115875907918862 : Rat) / 692956453614176359) [(1, 1), (7, 1), (12, 3), (16, 1)],
  term ((-1029034059345936000 : Rat) / 692956453614176359) [(1, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((514517029672968000 : Rat) / 692956453614176359) [(1, 1), (7, 1), (13, 2), (16, 1)],
  term ((-173347716986005055057585559156556800 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (7, 2), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((86673858493002527528792779578278400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (7, 2), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-2436884401693290075012693918282854400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (7, 2), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((1218442200846645037506346959141427200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (7, 2), (12, 1), (13, 4), (15, 1), (16, 1)],
  term ((-2436884401693290075012693918282854400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (7, 2), (12, 2), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-173347716986005055057585559156556800 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (7, 2), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((1218442200846645037506346959141427200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (7, 2), (12, 3), (13, 2), (15, 1), (16, 1)],
  term ((86673858493002527528792779578278400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (7, 2), (12, 3), (15, 1), (16, 1)],
  term ((669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (8, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-120424510545885000 : Rat) / 692956453614176359) [(1, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((60212255272942500 : Rat) / 692956453614176359) [(1, 1), (8, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((-201148632999720000 : Rat) / 692956453614176359) [(1, 1), (8, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-334972429023769676136412354446667776000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (8, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-120424510545885000 : Rat) / 692956453614176359) [(1, 1), (8, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((100574316499860000 : Rat) / 692956453614176359) [(1, 1), (8, 1), (11, 1), (12, 2), (16, 1)],
  term ((60212255272942500 : Rat) / 692956453614176359) [(1, 1), (8, 1), (11, 1), (12, 3), (16, 1)],
  term ((-201148632999720000 : Rat) / 692956453614176359) [(1, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (8, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((100574316499860000 : Rat) / 692956453614176359) [(1, 1), (8, 1), (11, 1), (13, 2), (16, 1)],
  term ((-334972429023769676136412354446667776000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (8, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((-9497299241309471661 : Rat) / 1385912907228352718) [(1, 1), (8, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((529977594782371306301011299991378665600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (8, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-223314952682513117424274902964445184000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (8, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-264988797391185653150505649995689332800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (8, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((67540792124893521401778305237812502400 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((9497299241309471661 : Rat) / 2771825814456705436) [(1, 1), (8, 1), (12, 2), (13, 1), (16, 1)],
  term ((111657476341256558712137451482222592000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (8, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((529977594782371306301011299991378665600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (8, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-33770396062446760700889152618906251200 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((-264988797391185653150505649995689332800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (8, 1), (12, 3), (15, 1), (16, 1)],
  term ((67540792124893521401778305237812502400 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((-39868161401029321491817372278124962204849 : Rat) / 5817503512114810875025545802033898437862) [(1, 1), (8, 1), (13, 2), (15, 1), (16, 1)],
  term ((-223314952682513117424274902964445184000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (8, 1), (13, 3), (15, 2), (16, 1)],
  term ((9497299241309471661 : Rat) / 2771825814456705436) [(1, 1), (8, 1), (13, 3), (16, 1)],
  term ((111657476341256558712137451482222592000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (8, 1), (13, 4), (15, 1), (16, 1)],
  term ((771775544509452000 : Rat) / 692956453614176359) [(1, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-385887772254726000 : Rat) / 692956453614176359) [(1, 1), (9, 1), (12, 1), (13, 2), (16, 1)],
  term ((771775544509452000 : Rat) / 692956453614176359) [(1, 1), (9, 1), (12, 2), (14, 1), (16, 1)],
  term ((-385887772254726000 : Rat) / 692956453614176359) [(1, 1), (9, 1), (12, 3), (16, 1)],
  term ((95280931420920000 : Rat) / 692956453614176359) [(1, 1), (10, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-47640465710460000 : Rat) / 692956453614176359) [(1, 1), (10, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((-609797961093888000 : Rat) / 692956453614176359) [(1, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((95280931420920000 : Rat) / 692956453614176359) [(1, 1), (10, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((304898980546944000 : Rat) / 692956453614176359) [(1, 1), (10, 1), (11, 1), (12, 2), (16, 1)],
  term ((-47640465710460000 : Rat) / 692956453614176359) [(1, 1), (10, 1), (11, 1), (12, 3), (16, 1)],
  term ((-609797961093888000 : Rat) / 692956453614176359) [(1, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((304898980546944000 : Rat) / 692956453614176359) [(1, 1), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((19716523940061682983 : Rat) / 1385912907228352718) [(1, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((67073256219842447548574157048508348465200 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (10, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((1339889716095078704545649417786671104000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (10, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-3791475546280059309649808863852841669112600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (10, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((15435510890189040000 : Rat) / 692956453614176359) [(1, 1), (10, 1), (12, 1), (13, 3), (16, 1)],
  term ((-75355199369704049547642975654174482175000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-30871021780378080000 : Rat) / 692956453614176359) [(1, 1), (10, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-19716523940061682983 : Rat) / 2771825814456705436) [(1, 1), (10, 1), (12, 2), (13, 1), (16, 1)],
  term ((-669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (10, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((67073256219842447548574157048508348465200 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (10, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((37677599684852024773821487827087241087500 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((15435510890189040000 : Rat) / 692956453614176359) [(1, 1), (10, 1), (12, 3), (13, 1), (16, 1)],
  term ((-33536628109921223774287078524254174232600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (10, 1), (12, 3), (15, 1), (16, 1)],
  term ((-75355199369704049547642975654174482175000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((2475453685662294790286562743661373163037663 : Rat) / 168707601851329515375740828258983054697998) [(1, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((1339889716095078704545649417786671104000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (10, 1), (13, 3), (15, 2), (16, 1)],
  term ((-19716523940061682983 : Rat) / 2771825814456705436) [(1, 1), (10, 1), (13, 3), (16, 1)],
  term ((-669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (10, 1), (13, 4), (15, 1), (16, 1)],
  term ((334972429023769676136412354446667776000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-933178121929203327 : Rat) / 47790100249253542) [(1, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-14680680839051231549816282467205248435200 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (11, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((933178121929203327 : Rat) / 95580200498507084) [(1, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((-6952546619960861398338862189941336282950400 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-4733192178194629627631930248530168422400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (11, 1), (12, 1), (13, 4), (15, 2), (16, 1)],
  term ((28587322282435344000 : Rat) / 692956453614176359) [(1, 1), (11, 1), (12, 1), (13, 4), (16, 1)],
  term ((2366596089097314813815965124265084211200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (11, 1), (12, 1), (13, 5), (15, 1), (16, 1)],
  term ((1253275084752531750 : Rat) / 692956453614176359) [(1, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-14680680839051231549816282467205248435200 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (11, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((10303451271816089080909370813789962887000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-57174644564870688000 : Rat) / 692956453614176359) [(1, 1), (11, 1), (12, 2), (13, 2), (14, 1), (16, 1)],
  term ((-43008753766387500 : Rat) / 692956453614176359) [(1, 1), (11, 1), (12, 2), (13, 2), (16, 1)],
  term ((-4733192178194629627631930248530168422400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (11, 1), (12, 2), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-933178121929203327 : Rat) / 47790100249253542) [(1, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((-626637542376265875 : Rat) / 692956453614176359) [(1, 1), (11, 1), (12, 2), (16, 1)],
  term ((7340340419525615774908141233602624217600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (11, 1), (12, 3), (13, 1), (15, 1), (16, 1)],
  term ((28587322282435344000 : Rat) / 692956453614176359) [(1, 1), (11, 1), (12, 3), (13, 2), (16, 1)],
  term ((2366596089097314813815965124265084211200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (11, 1), (12, 3), (13, 3), (15, 1), (16, 1)],
  term ((86017507532775000 : Rat) / 692956453614176359) [(1, 1), (11, 1), (12, 3), (14, 1), (16, 1)],
  term ((933178121929203327 : Rat) / 95580200498507084) [(1, 1), (11, 1), (12, 3), (16, 1)],
  term ((-43008753766387500 : Rat) / 692956453614176359) [(1, 1), (11, 1), (12, 4), (16, 1)],
  term ((1253275084752531750 : Rat) / 692956453614176359) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((334972429023769676136412354446667776000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-626637542376265875 : Rat) / 692956453614176359) [(1, 1), (11, 1), (13, 2), (16, 1)],
  term ((-167486214511884838068206177223333888000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((-7832264964728894661 : Rat) / 2771825814456705436) [(1, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((48918896093886889603215456321522411343500 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-111657476341256558712137451482222592000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((16655945497688905197376407061127923440252759 : Rat) / 168707601851329515375740828258983054697998) [(1, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-2149784665629660836757592718912163072000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (12, 1), (13, 2), (15, 3), (16, 1)],
  term ((-46585306692168554878284130277882646297600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((-137228476504838990019 : Rat) / 2771825814456705436) [(1, 1), (12, 1), (13, 3), (16, 1)],
  term ((23830099512491692648331463318669363916800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (12, 1), (13, 4), (15, 1), (16, 1)],
  term ((-85018919360392723940509480360082411963400 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2149784665629660836757592718912163072000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (12, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((137228476504838990019 : Rat) / 1385912907228352718) [(1, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-127785602611703830058583884203441161600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((7832264964728894661 : Rat) / 5543651628913410872) [(1, 1), (12, 2), (13, 1), (16, 1)],
  term ((-47660199024983385296662926637338727833600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (12, 2), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((119721539476480194385360667842831876800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((48918896093886889603215456321522411343500 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((42509459680196361970254740180041205981700 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (12, 2), (15, 1), (16, 1)],
  term ((1074892332814830418378796359456081536000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (12, 3), (13, 1), (15, 2), (16, 1)],
  term ((-137228476504838990019 : Rat) / 2771825814456705436) [(1, 1), (12, 3), (13, 1), (16, 1)],
  term ((23830099512491692648331463318669363916800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (12, 3), (13, 2), (15, 1), (16, 1)],
  term ((-127785602611703830058583884203441161600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (12, 3), (14, 1), (15, 1), (16, 1)],
  term ((-24459448046943444801607728160761205671750 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (12, 3), (15, 1), (16, 1)],
  term ((63892801305851915029291942101720580800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (12, 4), (15, 1), (16, 1)],
  term ((-85018919360392723940509480360082411963400 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (13, 1), (15, 2), (16, 1)],
  term ((-783386169650819108247089405192637729014421 : Rat) / 337415203702659030751481656517966109395996) [(1, 1), (13, 2), (15, 1), (16, 1)],
  term ((-111657476341256558712137451482222592000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (13, 3), (15, 2), (16, 1)],
  term ((7832264964728894661 : Rat) / 5543651628913410872) [(1, 1), (13, 3), (16, 1)],
  term ((55828738170628279356068725741111296000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (13, 4), (15, 1), (16, 1)],
  term ((1339889716095078704545649417786671104000 : Rat) / 84353800925664757687870414129491527348999) [(1, 2), (4, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((10455217405948258983 : Rat) / 1385912907228352718) [(1, 2), (4, 1), (12, 1), (14, 1), (16, 1)],
  term ((-669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 2), (4, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-10455217405948258983 : Rat) / 2771825814456705436) [(1, 2), (4, 1), (12, 2), (16, 1)],
  term ((10455217405948258983 : Rat) / 1385912907228352718) [(1, 2), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((1339889716095078704545649417786671104000 : Rat) / 84353800925664757687870414129491527348999) [(1, 2), (4, 1), (13, 2), (15, 2), (16, 1)],
  term ((-10455217405948258983 : Rat) / 2771825814456705436) [(1, 2), (4, 1), (13, 2), (16, 1)],
  term ((-669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 2), (4, 1), (13, 3), (15, 1), (16, 1)],
  term ((-1339889716095078704545649417786671104000 : Rat) / 84353800925664757687870414129491527348999) [(1, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-10455217405948258983 : Rat) / 1385912907228352718) [(1, 2), (12, 1), (14, 1), (16, 1)],
  term ((669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((10455217405948258983 : Rat) / 2771825814456705436) [(1, 2), (12, 2), (16, 1)],
  term ((-10455217405948258983 : Rat) / 1385912907228352718) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1339889716095078704545649417786671104000 : Rat) / 84353800925664757687870414129491527348999) [(1, 2), (13, 2), (15, 2), (16, 1)],
  term ((10455217405948258983 : Rat) / 2771825814456705436) [(1, 2), (13, 2), (16, 1)],
  term ((669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 2), (13, 3), (15, 1), (16, 1)],
  term ((-104416779069615799933109050276094400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (6, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((52208389534807899966554525138047200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (6, 1), (12, 2), (15, 1), (16, 1)],
  term ((-104416779069615799933109050276094400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((52208389534807899966554525138047200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (6, 1), (13, 2), (15, 1), (16, 1)],
  term ((-431634828019142000961252993402057600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((215817414009571000480626496701028800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-431634828019142000961252993402057600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((215817414009571000480626496701028800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((-771775544509452000 : Rat) / 692956453614176359) [(3, 1), (4, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((385887772254726000 : Rat) / 692956453614176359) [(3, 1), (4, 1), (10, 1), (12, 2), (13, 1), (16, 1)],
  term ((-771775544509452000 : Rat) / 692956453614176359) [(3, 1), (4, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((385887772254726000 : Rat) / 692956453614176359) [(3, 1), (4, 1), (10, 1), (13, 3), (16, 1)],
  term ((-47640465710460000 : Rat) / 692956453614176359) [(3, 1), (4, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((23820232855230000 : Rat) / 692956453614176359) [(3, 1), (4, 1), (11, 1), (12, 2), (16, 1)],
  term ((-47640465710460000 : Rat) / 692956453614176359) [(3, 1), (4, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((23820232855230000 : Rat) / 692956453614176359) [(3, 1), (4, 1), (11, 1), (13, 2), (16, 1)],
  term ((-1405721515133249475 : Rat) / 692956453614176359) [(3, 1), (4, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-956121245529929599387752468504337766400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((9574978374120680941537029963541503981600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1405721515133249475 : Rat) / 1385912907228352718) [(3, 1), (4, 1), (12, 2), (13, 1), (16, 1)],
  term ((478060622764964799693876234252168883200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((-4787489187060340470768514981770751990800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (12, 2), (15, 1), (16, 1)],
  term ((9574978374120680941537029963541503981600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (13, 1), (15, 2), (16, 1)],
  term ((-175906398933870615578135026557450507436275 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (13, 2), (15, 1), (16, 1)],
  term ((-956121245529929599387752468504337766400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (13, 3), (15, 2), (16, 1)],
  term ((1405721515133249475 : Rat) / 1385912907228352718) [(3, 1), (4, 1), (13, 3), (16, 1)],
  term ((478060622764964799693876234252168883200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (13, 4), (15, 1), (16, 1)],
  term ((1032654806127254717547145288097587200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-7593050045053343511376068294835200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-516327403063627358773572644048793600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((3796525022526671755688034147417600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((-7593050045053343511376068294835200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((3796525022526671755688034147417600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((1032654806127254717547145288097587200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 1), (13, 3), (15, 2), (16, 1)],
  term ((-516327403063627358773572644048793600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 1), (13, 4), (15, 1), (16, 1)],
  term ((172223556136072447584 : Rat) / 692956453614176359) [(3, 1), (5, 1), (6, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-30955433660627124993 : Rat) / 1385912907228352718) [(3, 1), (5, 1), (6, 1), (12, 1), (14, 1), (16, 1)],
  term ((-86111778068036223792 : Rat) / 692956453614176359) [(3, 1), (5, 1), (6, 1), (12, 2), (13, 2), (16, 1)],
  term ((30955433660627124993 : Rat) / 2771825814456705436) [(3, 1), (5, 1), (6, 1), (12, 2), (16, 1)],
  term ((-30955433660627124993 : Rat) / 1385912907228352718) [(3, 1), (5, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((30955433660627124993 : Rat) / 2771825814456705436) [(3, 1), (5, 1), (6, 1), (13, 2), (16, 1)],
  term ((172223556136072447584 : Rat) / 692956453614176359) [(3, 1), (5, 1), (6, 1), (13, 3), (15, 1), (16, 1)],
  term ((-86111778068036223792 : Rat) / 692956453614176359) [(3, 1), (5, 1), (6, 1), (13, 4), (16, 1)],
  term ((516327403063627358773572644048793600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((302552977253235161267859832389859200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1258548044967591687010583319868934400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-151276488626617580633929916194929600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((93963994307535125953278845148585600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-258163701531813679386786322024396800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((629274022483795843505291659934467200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((302552977253235161267859832389859200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-46981997153767562976639422574292800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((-151276488626617580633929916194929600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (12, 3), (15, 1), (16, 1)],
  term ((93963994307535125953278845148585600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-46981997153767562976639422574292800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((516327403063627358773572644048793600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (13, 2), (15, 3), (16, 1)],
  term ((-1516711746499405366397369641893331200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (13, 3), (15, 2), (16, 1)],
  term ((629274022483795843505291659934467200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (13, 4), (15, 1), (16, 1)],
  term ((771775544509452000 : Rat) / 692956453614176359) [(3, 1), (5, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-385887772254726000 : Rat) / 692956453614176359) [(3, 1), (5, 1), (10, 1), (12, 1), (13, 2), (16, 1)],
  term ((771775544509452000 : Rat) / 692956453614176359) [(3, 1), (5, 1), (10, 1), (12, 2), (14, 1), (16, 1)],
  term ((-385887772254726000 : Rat) / 692956453614176359) [(3, 1), (5, 1), (10, 1), (12, 3), (16, 1)],
  term ((86111778068036223792 : Rat) / 692956453614176359) [(3, 1), (5, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-19723739334825318723 : Rat) / 692956453614176359) [(3, 1), (5, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-209897459040838295493 : Rat) / 692956453614176359) [(3, 1), (5, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((19723739334825318723 : Rat) / 1385912907228352718) [(3, 1), (5, 1), (12, 1), (13, 2), (16, 1)],
  term ((341173208930097482937 : Rat) / 11087303257826821744) [(3, 1), (5, 1), (12, 1), (14, 1), (16, 1)],
  term ((-43055889034018111896 : Rat) / 692956453614176359) [(3, 1), (5, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((209897459040838295493 : Rat) / 1385912907228352718) [(3, 1), (5, 1), (12, 2), (13, 2), (16, 1)],
  term ((-19723739334825318723 : Rat) / 692956453614176359) [(3, 1), (5, 1), (12, 2), (14, 1), (16, 1)],
  term ((-341173208930097482937 : Rat) / 22174606515653643488) [(3, 1), (5, 1), (12, 2), (16, 1)],
  term ((19723739334825318723 : Rat) / 1385912907228352718) [(3, 1), (5, 1), (12, 3), (16, 1)],
  term ((341173208930097482937 : Rat) / 11087303257826821744) [(3, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((86111778068036223792 : Rat) / 692956453614176359) [(3, 1), (5, 1), (13, 2), (15, 2), (16, 1)],
  term ((-341173208930097482937 : Rat) / 22174606515653643488) [(3, 1), (5, 1), (13, 2), (16, 1)],
  term ((-252953348074856407389 : Rat) / 692956453614176359) [(3, 1), (5, 1), (13, 3), (15, 1), (16, 1)],
  term ((209897459040838295493 : Rat) / 1385912907228352718) [(3, 1), (5, 1), (13, 4), (16, 1)],
  term ((-1056811655059005396106091727595872000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2919511882115052984 : Rat) / 692956453614176359) [(3, 1), (6, 1), (7, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-58987767080500222804901543892174336000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-77253225923807355326513694845457600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((528405827529502698053045863797936000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((1459755941057526492 : Rat) / 692956453614176359) [(3, 1), (6, 1), (7, 1), (12, 2), (13, 2), (16, 1)],
  term ((29493883540250111402450771946087168000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (12, 2), (13, 3), (15, 1), (16, 1)],
  term ((38626612961903677663256847422728800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (12, 2), (15, 2), (16, 1)],
  term ((-77253225923807355326513694845457600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (13, 1), (15, 3), (16, 1)],
  term ((-1018185042097101718442834880173143200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((-355377750095301153595725697010892864141624 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((-58987767080500222804901543892174336000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (13, 4), (15, 2), (16, 1)],
  term ((1459755941057526492 : Rat) / 692956453614176359) [(3, 1), (6, 1), (7, 1), (13, 4), (16, 1)],
  term ((29493883540250111402450771946087168000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (13, 5), (15, 1), (16, 1)],
  term ((-1624589601128860050008462612188569600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 2), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((812294800564430025004231306094284800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 2), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((-1624589601128860050008462612188569600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 2), (13, 3), (15, 2), (16, 1)],
  term ((812294800564430025004231306094284800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 2), (13, 4), (15, 1), (16, 1)],
  term ((-78173987841078575882094280687715020800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((140649573864425400 : Rat) / 692956453614176359) [(3, 1), (6, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (9, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-70324786932212700 : Rat) / 692956453614176359) [(3, 1), (6, 1), (9, 1), (12, 2), (16, 1)],
  term ((140649573864425400 : Rat) / 692956453614176359) [(3, 1), (6, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-78173987841078575882094280687715020800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (9, 1), (13, 2), (15, 2), (16, 1)],
  term ((-70324786932212700 : Rat) / 692956453614176359) [(3, 1), (6, 1), (9, 1), (13, 2), (16, 1)],
  term ((39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (9, 1), (13, 3), (15, 1), (16, 1)],
  term ((-15435510890189040000 : Rat) / 692956453614176359) [(3, 1), (6, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((7717755445094520000 : Rat) / 692956453614176359) [(3, 1), (6, 1), (10, 1), (12, 2), (13, 1), (16, 1)],
  term ((-15435510890189040000 : Rat) / 692956453614176359) [(3, 1), (6, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((7717755445094520000 : Rat) / 692956453614176359) [(3, 1), (6, 1), (10, 1), (13, 3), (16, 1)],
  term ((-4686266345912897642062657677745542720000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-38116429709913792000 : Rat) / 692956453614176359) [(3, 1), (6, 1), (11, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-3155461452129753085087953499020112281600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (11, 1), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((386184132494305875 : Rat) / 692956453614176359) [(3, 1), (6, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((2343133172956448821031328838872771360000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((19058214854956896000 : Rat) / 692956453614176359) [(3, 1), (6, 1), (11, 1), (12, 2), (13, 2), (16, 1)],
  term ((1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (11, 1), (12, 2), (13, 3), (15, 1), (16, 1)],
  term ((-386184132494305875 : Rat) / 1385912907228352718) [(3, 1), (6, 1), (11, 1), (12, 2), (16, 1)],
  term ((386184132494305875 : Rat) / 692956453614176359) [(3, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4686266345912897642062657677745542720000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-386184132494305875 : Rat) / 1385912907228352718) [(3, 1), (6, 1), (11, 1), (13, 2), (16, 1)],
  term ((-4637581507080634893921482225277753166752000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((-3155461452129753085087953499020112281600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (11, 1), (13, 4), (15, 2), (16, 1)],
  term ((19058214854956896000 : Rat) / 692956453614176359) [(3, 1), (6, 1), (11, 1), (13, 4), (16, 1)],
  term ((1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (11, 1), (13, 5), (15, 1), (16, 1)],
  term ((58630490880808931911570710515786265600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-43870091723907405560887831547807298121200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((21935045861953702780443915773903649060600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-29315245440404465955785355257893132800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-43870091723907405560887831547807298121200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((21935045861953702780443915773903649060600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (12, 3), (15, 1), (16, 1)],
  term ((58630490880808931911570710515786265600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (13, 2), (15, 3), (16, 1)],
  term ((-29315245440404465955785355257893132800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 29, terms 100 through 199. -/
theorem ep_Q2_008_block_29_0100_0199_valid :
    checkProductSumEq ep_Q2_008_partials_29_0100_0199
      ep_Q2_008_block_29_0100_0199 = true := by
  native_decide

end EpQ2008TermShards

end Patterns

end EndpointCertificate

end Problem97
