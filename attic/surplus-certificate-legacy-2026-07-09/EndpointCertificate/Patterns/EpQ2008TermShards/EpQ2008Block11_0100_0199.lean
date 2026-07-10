/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_008, term block 11:100-199

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_008`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2008TermShards

/-- Generator polynomial 11 for endpoint certificate `ep_Q2_008`. -/
def ep_Q2_008_generator_11_0100_0199 : Poly :=
[
  term (2 : Rat) [(2, 1), (14, 1)],
  term (2 : Rat) [(3, 1), (15, 1)],
  term (-1 : Rat) [(14, 2)],
  term (-1 : Rat) [(15, 2)]
]

/-- Coefficient term 100 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0100 : Poly :=
[
  term ((-20872911779832277763745049391179810392000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (4, 1), (15, 1), (16, 1)]
]

/-- Partial product 100 for generator 11. -/
def ep_Q2_008_partial_11_0100 : Poly :=
[
  term ((-41745823559664555527490098782359620784000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 1), (4, 1), (14, 1), (15, 1), (16, 1)],
  term ((-41745823559664555527490098782359620784000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 1), (4, 1), (15, 2), (16, 1)],
  term ((20872911779832277763745049391179810392000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (4, 1), (14, 2), (15, 1), (16, 1)],
  term ((20872911779832277763745049391179810392000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (4, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 11. -/
theorem ep_Q2_008_partial_11_0100_valid :
    mulPoly ep_Q2_008_coefficient_11_0100
        ep_Q2_008_generator_11_0100_0199 =
      ep_Q2_008_partial_11_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0101 : Poly :=
[
  term ((-387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (5, 1), (6, 1), (7, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 101 for generator 11. -/
def ep_Q2_008_partial_11_0101 : Poly :=
[
  term ((-774491104595441038160358966073190400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (2, 1), (5, 1), (6, 1), (7, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-774491104595441038160358966073190400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (3, 1), (5, 1), (6, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (5, 1), (6, 1), (7, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (5, 1), (6, 1), (7, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 11. -/
theorem ep_Q2_008_partial_11_0101_valid :
    mulPoly ep_Q2_008_coefficient_11_0101
        ep_Q2_008_generator_11_0100_0199 =
      ep_Q2_008_partial_11_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0102 : Poly :=
[
  term ((43660037759056725190412392695302400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (5, 1), (6, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 102 for generator 11. -/
def ep_Q2_008_partial_11_0102 : Poly :=
[
  term ((87320075518113450380824785390604800 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (2, 1), (5, 1), (6, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((87320075518113450380824785390604800 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (3, 1), (5, 1), (6, 1), (7, 1), (15, 2), (16, 1)],
  term ((-43660037759056725190412392695302400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (5, 1), (6, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-43660037759056725190412392695302400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (5, 1), (6, 1), (7, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 11. -/
theorem ep_Q2_008_partial_11_0102_valid :
    mulPoly ep_Q2_008_coefficient_11_0102
        ep_Q2_008_generator_11_0100_0199 =
      ep_Q2_008_partial_11_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0103 : Poly :=
[
  term ((-64583833551027167844 : Rat) / 692956453614176359) [(1, 1), (5, 1), (6, 1), (13, 2), (16, 1)]
]

/-- Partial product 103 for generator 11. -/
def ep_Q2_008_partial_11_0103 : Poly :=
[
  term ((-129167667102054335688 : Rat) / 692956453614176359) [(1, 1), (2, 1), (5, 1), (6, 1), (13, 2), (14, 1), (16, 1)],
  term ((-129167667102054335688 : Rat) / 692956453614176359) [(1, 1), (3, 1), (5, 1), (6, 1), (13, 2), (15, 1), (16, 1)],
  term ((64583833551027167844 : Rat) / 692956453614176359) [(1, 1), (5, 1), (6, 1), (13, 2), (14, 2), (16, 1)],
  term ((64583833551027167844 : Rat) / 692956453614176359) [(1, 1), (5, 1), (6, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 11. -/
theorem ep_Q2_008_partial_11_0103_valid :
    mulPoly ep_Q2_008_coefficient_11_0103
        ep_Q2_008_generator_11_0100_0199 =
      ep_Q2_008_partial_11_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0104 : Poly :=
[
  term ((26542157644955337657 : Rat) / 2771825814456705436) [(1, 1), (5, 1), (6, 1), (16, 1)]
]

/-- Partial product 104 for generator 11. -/
def ep_Q2_008_partial_11_0104 : Poly :=
[
  term ((26542157644955337657 : Rat) / 1385912907228352718) [(1, 1), (2, 1), (5, 1), (6, 1), (14, 1), (16, 1)],
  term ((26542157644955337657 : Rat) / 1385912907228352718) [(1, 1), (3, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-26542157644955337657 : Rat) / 2771825814456705436) [(1, 1), (5, 1), (6, 1), (14, 2), (16, 1)],
  term ((-26542157644955337657 : Rat) / 2771825814456705436) [(1, 1), (5, 1), (6, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 11. -/
theorem ep_Q2_008_partial_11_0104_valid :
    mulPoly ep_Q2_008_coefficient_11_0104
        ep_Q2_008_generator_11_0100_0199 =
      ep_Q2_008_partial_11_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0105 : Poly :=
[
  term ((387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (5, 1), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 105 for generator 11. -/
def ep_Q2_008_partial_11_0105 : Poly :=
[
  term ((774491104595441038160358966073190400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (2, 1), (5, 1), (7, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((774491104595441038160358966073190400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (3, 1), (5, 1), (7, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (5, 1), (7, 1), (12, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((-387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (5, 1), (7, 1), (12, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 11. -/
theorem ep_Q2_008_partial_11_0105_valid :
    mulPoly ep_Q2_008_coefficient_11_0105
        ep_Q2_008_generator_11_0100_0199 =
      ep_Q2_008_partial_11_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0106 : Poly :=
[
  term ((-43660037759056725190412392695302400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (5, 1), (7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 106 for generator 11. -/
def ep_Q2_008_partial_11_0106 : Poly :=
[
  term ((-87320075518113450380824785390604800 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (2, 1), (5, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-87320075518113450380824785390604800 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (3, 1), (5, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((43660037759056725190412392695302400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (5, 1), (7, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((43660037759056725190412392695302400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (5, 1), (7, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 11. -/
theorem ep_Q2_008_partial_11_0106_valid :
    mulPoly ep_Q2_008_coefficient_11_0106
        ep_Q2_008_generator_11_0100_0199 =
      ep_Q2_008_partial_11_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0107 : Poly :=
[
  term ((12113105612672266983 : Rat) / 2771825814456705436) [(1, 1), (5, 1), (8, 1), (16, 1)]
]

/-- Partial product 107 for generator 11. -/
def ep_Q2_008_partial_11_0107 : Poly :=
[
  term ((12113105612672266983 : Rat) / 1385912907228352718) [(1, 1), (2, 1), (5, 1), (8, 1), (14, 1), (16, 1)],
  term ((12113105612672266983 : Rat) / 1385912907228352718) [(1, 1), (3, 1), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-12113105612672266983 : Rat) / 2771825814456705436) [(1, 1), (5, 1), (8, 1), (14, 2), (16, 1)],
  term ((-12113105612672266983 : Rat) / 2771825814456705436) [(1, 1), (5, 1), (8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 11. -/
theorem ep_Q2_008_partial_11_0107_valid :
    mulPoly ep_Q2_008_coefficient_11_0107
        ep_Q2_008_generator_11_0100_0199 =
      ep_Q2_008_partial_11_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0108 : Poly :=
[
  term ((-11741509980130678983 : Rat) / 2771825814456705436) [(1, 1), (5, 1), (10, 1), (16, 1)]
]

/-- Partial product 108 for generator 11. -/
def ep_Q2_008_partial_11_0108 : Poly :=
[
  term ((-11741509980130678983 : Rat) / 1385912907228352718) [(1, 1), (2, 1), (5, 1), (10, 1), (14, 1), (16, 1)],
  term ((-11741509980130678983 : Rat) / 1385912907228352718) [(1, 1), (3, 1), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((11741509980130678983 : Rat) / 2771825814456705436) [(1, 1), (5, 1), (10, 1), (14, 2), (16, 1)],
  term ((11741509980130678983 : Rat) / 2771825814456705436) [(1, 1), (5, 1), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 11. -/
theorem ep_Q2_008_partial_11_0108_valid :
    mulPoly ep_Q2_008_coefficient_11_0108
        ep_Q2_008_generator_11_0100_0199 =
      ep_Q2_008_partial_11_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0109 : Poly :=
[
  term ((1339889716095078704545649417786671104000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (5, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 109 for generator 11. -/
def ep_Q2_008_partial_11_0109 : Poly :=
[
  term ((2679779432190157409091298835573342208000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 1), (5, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((2679779432190157409091298835573342208000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 1), (5, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1339889716095078704545649417786671104000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (5, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1339889716095078704545649417786671104000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (5, 1), (12, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 11. -/
theorem ep_Q2_008_partial_11_0109_valid :
    mulPoly ep_Q2_008_coefficient_11_0109
        ep_Q2_008_generator_11_0100_0199 =
      ep_Q2_008_partial_11_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0110 : Poly :=
[
  term ((64583833551027167844 : Rat) / 692956453614176359) [(1, 1), (5, 1), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 110 for generator 11. -/
def ep_Q2_008_partial_11_0110 : Poly :=
[
  term ((129167667102054335688 : Rat) / 692956453614176359) [(1, 1), (2, 1), (5, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((129167667102054335688 : Rat) / 692956453614176359) [(1, 1), (3, 1), (5, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-64583833551027167844 : Rat) / 692956453614176359) [(1, 1), (5, 1), (12, 1), (13, 2), (14, 2), (16, 1)],
  term ((-64583833551027167844 : Rat) / 692956453614176359) [(1, 1), (5, 1), (12, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 11. -/
theorem ep_Q2_008_partial_11_0110_valid :
    mulPoly ep_Q2_008_coefficient_11_0110
        ep_Q2_008_generator_11_0100_0199 =
      ep_Q2_008_partial_11_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0111 : Poly :=
[
  term ((-7400323832412329337 : Rat) / 1385912907228352718) [(1, 1), (5, 1), (12, 1), (16, 1)]
]

/-- Partial product 111 for generator 11. -/
def ep_Q2_008_partial_11_0111 : Poly :=
[
  term ((-7400323832412329337 : Rat) / 692956453614176359) [(1, 1), (2, 1), (5, 1), (12, 1), (14, 1), (16, 1)],
  term ((-7400323832412329337 : Rat) / 692956453614176359) [(1, 1), (3, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((7400323832412329337 : Rat) / 1385912907228352718) [(1, 1), (5, 1), (12, 1), (14, 2), (16, 1)],
  term ((7400323832412329337 : Rat) / 1385912907228352718) [(1, 1), (5, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 11. -/
theorem ep_Q2_008_partial_11_0111_valid :
    mulPoly ep_Q2_008_coefficient_11_0111
        ep_Q2_008_generator_11_0100_0199 =
      ep_Q2_008_partial_11_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0112 : Poly :=
[
  term ((-669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (5, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 112 for generator 11. -/
def ep_Q2_008_partial_11_0112 : Poly :=
[
  term ((-1339889716095078704545649417786671104000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 1), (5, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1339889716095078704545649417786671104000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 1), (5, 1), (13, 1), (15, 2), (16, 1)],
  term ((669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (5, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (5, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 11. -/
theorem ep_Q2_008_partial_11_0112_valid :
    mulPoly ep_Q2_008_coefficient_11_0112
        ep_Q2_008_generator_11_0100_0199 =
      ep_Q2_008_partial_11_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0113 : Poly :=
[
  term ((1879933578065458983 : Rat) / 5543651628913410872) [(1, 1), (5, 1), (16, 1)]
]

/-- Partial product 113 for generator 11. -/
def ep_Q2_008_partial_11_0113 : Poly :=
[
  term ((1879933578065458983 : Rat) / 2771825814456705436) [(1, 1), (2, 1), (5, 1), (14, 1), (16, 1)],
  term ((1879933578065458983 : Rat) / 2771825814456705436) [(1, 1), (3, 1), (5, 1), (15, 1), (16, 1)],
  term ((-1879933578065458983 : Rat) / 5543651628913410872) [(1, 1), (5, 1), (14, 2), (16, 1)],
  term ((-1879933578065458983 : Rat) / 5543651628913410872) [(1, 1), (5, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 11. -/
theorem ep_Q2_008_partial_11_0113_valid :
    mulPoly ep_Q2_008_coefficient_11_0113
        ep_Q2_008_generator_11_0100_0199 =
      ep_Q2_008_partial_11_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0114 : Poly :=
[
  term ((-78273037166560530452376704018035200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 114 for generator 11. -/
def ep_Q2_008_partial_11_0114 : Poly :=
[
  term ((-156546074333121060904753408036070400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (2, 1), (6, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-156546074333121060904753408036070400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (3, 1), (6, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((78273037166560530452376704018035200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (7, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((78273037166560530452376704018035200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (7, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 11. -/
theorem ep_Q2_008_partial_11_0114_valid :
    mulPoly ep_Q2_008_coefficient_11_0114
        ep_Q2_008_generator_11_0100_0199 =
      ep_Q2_008_partial_11_0114 := by
  native_decide

/-- Coefficient term 115 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0115 : Poly :=
[
  term ((1094816955793144869 : Rat) / 692956453614176359) [(1, 1), (6, 1), (7, 1), (13, 2), (16, 1)]
]

/-- Partial product 115 for generator 11. -/
def ep_Q2_008_partial_11_0115 : Poly :=
[
  term ((2189633911586289738 : Rat) / 692956453614176359) [(1, 1), (2, 1), (6, 1), (7, 1), (13, 2), (14, 1), (16, 1)],
  term ((2189633911586289738 : Rat) / 692956453614176359) [(1, 1), (3, 1), (6, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1094816955793144869 : Rat) / 692956453614176359) [(1, 1), (6, 1), (7, 1), (13, 2), (14, 2), (16, 1)],
  term ((-1094816955793144869 : Rat) / 692956453614176359) [(1, 1), (6, 1), (7, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 115 for generator 11. -/
theorem ep_Q2_008_partial_11_0115_valid :
    mulPoly ep_Q2_008_coefficient_11_0115
        ep_Q2_008_generator_11_0100_0199 =
      ep_Q2_008_partial_11_0115 := by
  native_decide

/-- Coefficient term 116 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0116 : Poly :=
[
  term ((22120412655187583551838078959565376000 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (7, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 116 for generator 11. -/
def ep_Q2_008_partial_11_0116 : Poly :=
[
  term ((44240825310375167103676157919130752000 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (2, 1), (6, 1), (7, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((44240825310375167103676157919130752000 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (3, 1), (6, 1), (7, 1), (13, 3), (15, 2), (16, 1)],
  term ((-22120412655187583551838078959565376000 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (7, 1), (13, 3), (14, 2), (15, 1), (16, 1)],
  term ((-22120412655187583551838078959565376000 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (7, 1), (13, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 116 for generator 11. -/
theorem ep_Q2_008_partial_11_0116_valid :
    mulPoly ep_Q2_008_coefficient_11_0116
        ep_Q2_008_generator_11_0100_0199 =
      ep_Q2_008_partial_11_0116 := by
  native_decide

/-- Coefficient term 117 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0117 : Poly :=
[
  term ((4624670165699233431 : Rat) / 692956453614176359) [(1, 1), (6, 1), (7, 1), (16, 1)]
]

/-- Partial product 117 for generator 11. -/
def ep_Q2_008_partial_11_0117 : Poly :=
[
  term ((9249340331398466862 : Rat) / 692956453614176359) [(1, 1), (2, 1), (6, 1), (7, 1), (14, 1), (16, 1)],
  term ((9249340331398466862 : Rat) / 692956453614176359) [(1, 1), (3, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-4624670165699233431 : Rat) / 692956453614176359) [(1, 1), (6, 1), (7, 1), (14, 2), (16, 1)],
  term ((-4624670165699233431 : Rat) / 692956453614176359) [(1, 1), (6, 1), (7, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 117 for generator 11. -/
theorem ep_Q2_008_partial_11_0117_valid :
    mulPoly ep_Q2_008_coefficient_11_0117
        ep_Q2_008_generator_11_0100_0199 =
      ep_Q2_008_partial_11_0117 := by
  native_decide

/-- Coefficient term 118 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0118 : Poly :=
[
  term ((609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (7, 2), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 118 for generator 11. -/
def ep_Q2_008_partial_11_0118 : Poly :=
[
  term ((1218442200846645037506346959141427200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (2, 1), (6, 1), (7, 2), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((1218442200846645037506346959141427200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (3, 1), (6, 1), (7, 2), (13, 2), (15, 2), (16, 1)],
  term ((-609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (7, 2), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((-609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (7, 2), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 118 for generator 11. -/
theorem ep_Q2_008_partial_11_0118_valid :
    mulPoly ep_Q2_008_coefficient_11_0118
        ep_Q2_008_generator_11_0100_0199 =
      ep_Q2_008_partial_11_0118 := by
  native_decide

/-- Coefficient term 119 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0119 : Poly :=
[
  term ((43336929246501263764396389789139200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (7, 2), (15, 1), (16, 1)]
]

/-- Partial product 119 for generator 11. -/
def ep_Q2_008_partial_11_0119 : Poly :=
[
  term ((86673858493002527528792779578278400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (2, 1), (6, 1), (7, 2), (14, 1), (15, 1), (16, 1)],
  term ((86673858493002527528792779578278400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (3, 1), (6, 1), (7, 2), (15, 2), (16, 1)],
  term ((-43336929246501263764396389789139200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (7, 2), (14, 2), (15, 1), (16, 1)],
  term ((-43336929246501263764396389789139200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (7, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 119 for generator 11. -/
theorem ep_Q2_008_partial_11_0119_valid :
    mulPoly ep_Q2_008_coefficient_11_0119
        ep_Q2_008_generator_11_0100_0199 =
      ep_Q2_008_partial_11_0119 := by
  native_decide

/-- Coefficient term 120 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0120 : Poly :=
[
  term ((-298759193453632413851394802614595584000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 120 for generator 11. -/
def ep_Q2_008_partial_11_0120 : Poly :=
[
  term ((-597518386907264827702789605229191168000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 1), (6, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-597518386907264827702789605229191168000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 1), (6, 1), (8, 1), (15, 2), (16, 1)],
  term ((298759193453632413851394802614595584000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((298759193453632413851394802614595584000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (8, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 120 for generator 11. -/
theorem ep_Q2_008_partial_11_0120_valid :
    mulPoly ep_Q2_008_coefficient_11_0120
        ep_Q2_008_generator_11_0100_0199 =
      ep_Q2_008_partial_11_0120 := by
  native_decide

/-- Coefficient term 121 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0121 : Poly :=
[
  term ((6945979900585068000 : Rat) / 692956453614176359) [(1, 1), (6, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 121 for generator 11. -/
def ep_Q2_008_partial_11_0121 : Poly :=
[
  term ((13891959801170136000 : Rat) / 692956453614176359) [(1, 1), (2, 1), (6, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((13891959801170136000 : Rat) / 692956453614176359) [(1, 1), (3, 1), (6, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-6945979900585068000 : Rat) / 692956453614176359) [(1, 1), (6, 1), (10, 1), (13, 1), (14, 2), (16, 1)],
  term ((-6945979900585068000 : Rat) / 692956453614176359) [(1, 1), (6, 1), (10, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 121 for generator 11. -/
theorem ep_Q2_008_partial_11_0121_valid :
    mulPoly ep_Q2_008_coefficient_11_0121
        ep_Q2_008_generator_11_0100_0199 =
      ep_Q2_008_partial_11_0121 := by
  native_decide

/-- Coefficient term 122 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0122 : Poly :=
[
  term ((3335197780739038211317658262354644332800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 122 for generator 11. -/
def ep_Q2_008_partial_11_0122 : Poly :=
[
  term ((6670395561478076422635316524709288665600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 1), (6, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((6670395561478076422635316524709288665600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 1), (6, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-3335197780739038211317658262354644332800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-3335197780739038211317658262354644332800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (11, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 122 for generator 11. -/
theorem ep_Q2_008_partial_11_0122_valid :
    mulPoly ep_Q2_008_coefficient_11_0122
        ep_Q2_008_generator_11_0100_0199 =
      ep_Q2_008_partial_11_0122 := by
  native_decide

/-- Coefficient term 123 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0123 : Poly :=
[
  term ((14293661141217672000 : Rat) / 692956453614176359) [(1, 1), (6, 1), (11, 1), (13, 2), (16, 1)]
]

/-- Partial product 123 for generator 11. -/
def ep_Q2_008_partial_11_0123 : Poly :=
[
  term ((28587322282435344000 : Rat) / 692956453614176359) [(1, 1), (2, 1), (6, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((28587322282435344000 : Rat) / 692956453614176359) [(1, 1), (3, 1), (6, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-14293661141217672000 : Rat) / 692956453614176359) [(1, 1), (6, 1), (11, 1), (13, 2), (14, 2), (16, 1)],
  term ((-14293661141217672000 : Rat) / 692956453614176359) [(1, 1), (6, 1), (11, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 123 for generator 11. -/
theorem ep_Q2_008_partial_11_0123_valid :
    mulPoly ep_Q2_008_coefficient_11_0123
        ep_Q2_008_generator_11_0100_0199 =
      ep_Q2_008_partial_11_0123 := by
  native_decide

/-- Coefficient term 124 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0124 : Poly :=
[
  term ((1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 124 for generator 11. -/
def ep_Q2_008_partial_11_0124 : Poly :=
[
  term ((2366596089097314813815965124265084211200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (2, 1), (6, 1), (11, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((2366596089097314813815965124265084211200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (3, 1), (6, 1), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((-1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (11, 1), (13, 3), (14, 2), (15, 1), (16, 1)],
  term ((-1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (11, 1), (13, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 124 for generator 11. -/
theorem ep_Q2_008_partial_11_0124_valid :
    mulPoly ep_Q2_008_coefficient_11_0124
        ep_Q2_008_generator_11_0100_0199 =
      ep_Q2_008_partial_11_0124 := by
  native_decide

/-- Coefficient term 125 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0125 : Poly :=
[
  term ((3615781793256984375 : Rat) / 1385912907228352718) [(1, 1), (6, 1), (11, 1), (16, 1)]
]

/-- Partial product 125 for generator 11. -/
def ep_Q2_008_partial_11_0125 : Poly :=
[
  term ((3615781793256984375 : Rat) / 692956453614176359) [(1, 1), (2, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((3615781793256984375 : Rat) / 692956453614176359) [(1, 1), (3, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3615781793256984375 : Rat) / 1385912907228352718) [(1, 1), (6, 1), (11, 1), (14, 2), (16, 1)],
  term ((-3615781793256984375 : Rat) / 1385912907228352718) [(1, 1), (6, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 125 for generator 11. -/
theorem ep_Q2_008_partial_11_0125_valid :
    mulPoly ep_Q2_008_coefficient_11_0125
        ep_Q2_008_generator_11_0100_0199 =
      ep_Q2_008_partial_11_0125 := by
  native_decide

/-- Coefficient term 126 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0126 : Poly :=
[
  term ((-21215886736744339523703249485584010466600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 126 for generator 11. -/
def ep_Q2_008_partial_11_0126 : Poly :=
[
  term ((-42431773473488679047406498971168020933200 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 1), (6, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-42431773473488679047406498971168020933200 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 1), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((21215886736744339523703249485584010466600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((21215886736744339523703249485584010466600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 126 for generator 11. -/
theorem ep_Q2_008_partial_11_0126_valid :
    mulPoly ep_Q2_008_coefficient_11_0126
        ep_Q2_008_generator_11_0100_0199 =
      ep_Q2_008_partial_11_0126 := by
  native_decide

/-- Coefficient term 127 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0127 : Poly :=
[
  term ((537446166407415209189398179728040768000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 127 for generator 11. -/
def ep_Q2_008_partial_11_0127 : Poly :=
[
  term ((1074892332814830418378796359456081536000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 1), (6, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((1074892332814830418378796359456081536000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 1), (6, 1), (13, 1), (15, 3), (16, 1)],
  term ((-537446166407415209189398179728040768000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-537446166407415209189398179728040768000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (13, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 127 for generator 11. -/
theorem ep_Q2_008_partial_11_0127_valid :
    mulPoly ep_Q2_008_coefficient_11_0127
        ep_Q2_008_generator_11_0100_0199 =
      ep_Q2_008_partial_11_0127 := by
  native_decide

/-- Coefficient term 128 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0128 : Poly :=
[
  term ((-17217002483323082460 : Rat) / 692956453614176359) [(1, 1), (6, 1), (13, 1), (16, 1)]
]

/-- Partial product 128 for generator 11. -/
def ep_Q2_008_partial_11_0128 : Poly :=
[
  term ((-34434004966646164920 : Rat) / 692956453614176359) [(1, 1), (2, 1), (6, 1), (13, 1), (14, 1), (16, 1)],
  term ((-34434004966646164920 : Rat) / 692956453614176359) [(1, 1), (3, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((17217002483323082460 : Rat) / 692956453614176359) [(1, 1), (6, 1), (13, 1), (14, 2), (16, 1)],
  term ((17217002483323082460 : Rat) / 692956453614176359) [(1, 1), (6, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 128 for generator 11. -/
theorem ep_Q2_008_partial_11_0128_valid :
    mulPoly ep_Q2_008_coefficient_11_0128
        ep_Q2_008_generator_11_0100_0199 =
      ep_Q2_008_partial_11_0128 := by
  native_decide

/-- Coefficient term 129 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0129 : Poly :=
[
  term ((11691734803563333206741456756370236774400 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 129 for generator 11. -/
def ep_Q2_008_partial_11_0129 : Poly :=
[
  term ((23383469607126666413482913512740473548800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 1), (6, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((23383469607126666413482913512740473548800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 1), (6, 1), (13, 2), (15, 2), (16, 1)],
  term ((-11691734803563333206741456756370236774400 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((-11691734803563333206741456756370236774400 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 129 for generator 11. -/
theorem ep_Q2_008_partial_11_0129_valid :
    mulPoly ep_Q2_008_coefficient_11_0129
        ep_Q2_008_generator_11_0100_0199 =
      ep_Q2_008_partial_11_0129 := by
  native_decide

/-- Coefficient term 130 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0130 : Poly :=
[
  term ((72472312780526128348785742657620382554075 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 130 for generator 11. -/
def ep_Q2_008_partial_11_0130 : Poly :=
[
  term ((144944625561052256697571485315240765108150 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((144944625561052256697571485315240765108150 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 1), (6, 1), (15, 2), (16, 1)],
  term ((-72472312780526128348785742657620382554075 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (14, 2), (15, 1), (16, 1)],
  term ((-72472312780526128348785742657620382554075 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 130 for generator 11. -/
theorem ep_Q2_008_partial_11_0130_valid :
    mulPoly ep_Q2_008_coefficient_11_0130
        ep_Q2_008_generator_11_0100_0199 =
      ep_Q2_008_partial_11_0130 := by
  native_decide

/-- Coefficient term 131 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0131 : Poly :=
[
  term ((21813405123651604351406039090813201634600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 2), (15, 1), (16, 1)]
]

/-- Partial product 131 for generator 11. -/
def ep_Q2_008_partial_11_0131 : Poly :=
[
  term ((43626810247303208702812078181626403269200 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 1), (6, 2), (14, 1), (15, 1), (16, 1)],
  term ((43626810247303208702812078181626403269200 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 1), (6, 2), (15, 2), (16, 1)],
  term ((-21813405123651604351406039090813201634600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 2), (14, 2), (15, 1), (16, 1)],
  term ((-21813405123651604351406039090813201634600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 131 for generator 11. -/
theorem ep_Q2_008_partial_11_0131_valid :
    mulPoly ep_Q2_008_coefficient_11_0131
        ep_Q2_008_generator_11_0100_0199 =
      ep_Q2_008_partial_11_0131 := by
  native_decide

/-- Coefficient term 132 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0132 : Poly :=
[
  term ((514517029672968000 : Rat) / 692956453614176359) [(1, 1), (7, 1), (10, 1), (16, 1)]
]

/-- Partial product 132 for generator 11. -/
def ep_Q2_008_partial_11_0132 : Poly :=
[
  term ((1029034059345936000 : Rat) / 692956453614176359) [(1, 1), (2, 1), (7, 1), (10, 1), (14, 1), (16, 1)],
  term ((1029034059345936000 : Rat) / 692956453614176359) [(1, 1), (3, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-514517029672968000 : Rat) / 692956453614176359) [(1, 1), (7, 1), (10, 1), (14, 2), (16, 1)],
  term ((-514517029672968000 : Rat) / 692956453614176359) [(1, 1), (7, 1), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 132 for generator 11. -/
theorem ep_Q2_008_partial_11_0132_valid :
    mulPoly ep_Q2_008_coefficient_11_0132
        ep_Q2_008_generator_11_0100_0199 =
      ep_Q2_008_partial_11_0132 := by
  native_decide

/-- Coefficient term 133 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0133 : Poly :=
[
  term ((78273037166560530452376704018035200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 133 for generator 11. -/
def ep_Q2_008_partial_11_0133 : Poly :=
[
  term ((156546074333121060904753408036070400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (2, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((156546074333121060904753408036070400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (3, 1), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-78273037166560530452376704018035200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (7, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-78273037166560530452376704018035200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (7, 1), (12, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 133 for generator 11. -/
theorem ep_Q2_008_partial_11_0133_valid :
    mulPoly ep_Q2_008_coefficient_11_0133
        ep_Q2_008_generator_11_0100_0199 =
      ep_Q2_008_partial_11_0133 := by
  native_decide

/-- Coefficient term 134 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0134 : Poly :=
[
  term ((-1094816955793144869 : Rat) / 692956453614176359) [(1, 1), (7, 1), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 134 for generator 11. -/
def ep_Q2_008_partial_11_0134 : Poly :=
[
  term ((-2189633911586289738 : Rat) / 692956453614176359) [(1, 1), (2, 1), (7, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-2189633911586289738 : Rat) / 692956453614176359) [(1, 1), (3, 1), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((1094816955793144869 : Rat) / 692956453614176359) [(1, 1), (7, 1), (12, 1), (13, 2), (14, 2), (16, 1)],
  term ((1094816955793144869 : Rat) / 692956453614176359) [(1, 1), (7, 1), (12, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 134 for generator 11. -/
theorem ep_Q2_008_partial_11_0134_valid :
    mulPoly ep_Q2_008_coefficient_11_0134
        ep_Q2_008_generator_11_0100_0199 =
      ep_Q2_008_partial_11_0134 := by
  native_decide

/-- Coefficient term 135 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0135 : Poly :=
[
  term ((-22120412655187583551838078959565376000 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (7, 1), (12, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 135 for generator 11. -/
def ep_Q2_008_partial_11_0135 : Poly :=
[
  term ((-44240825310375167103676157919130752000 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (2, 1), (7, 1), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-44240825310375167103676157919130752000 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (3, 1), (7, 1), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((22120412655187583551838078959565376000 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (7, 1), (12, 1), (13, 3), (14, 2), (15, 1), (16, 1)],
  term ((22120412655187583551838078959565376000 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (7, 1), (12, 1), (13, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 135 for generator 11. -/
theorem ep_Q2_008_partial_11_0135_valid :
    mulPoly ep_Q2_008_coefficient_11_0135
        ep_Q2_008_generator_11_0100_0199 =
      ep_Q2_008_partial_11_0135 := by
  native_decide

/-- Coefficient term 136 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0136 : Poly :=
[
  term ((-5396445710208685431 : Rat) / 692956453614176359) [(1, 1), (7, 1), (12, 1), (16, 1)]
]

/-- Partial product 136 for generator 11. -/
def ep_Q2_008_partial_11_0136 : Poly :=
[
  term ((-10792891420417370862 : Rat) / 692956453614176359) [(1, 1), (2, 1), (7, 1), (12, 1), (14, 1), (16, 1)],
  term ((-10792891420417370862 : Rat) / 692956453614176359) [(1, 1), (3, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((5396445710208685431 : Rat) / 692956453614176359) [(1, 1), (7, 1), (12, 1), (14, 2), (16, 1)],
  term ((5396445710208685431 : Rat) / 692956453614176359) [(1, 1), (7, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 136 for generator 11. -/
theorem ep_Q2_008_partial_11_0136_valid :
    mulPoly ep_Q2_008_coefficient_11_0136
        ep_Q2_008_generator_11_0100_0199 =
      ep_Q2_008_partial_11_0136 := by
  native_decide

/-- Coefficient term 137 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0137 : Poly :=
[
  term ((-1029034059345936000 : Rat) / 692956453614176359) [(1, 1), (7, 1), (16, 1)]
]

/-- Partial product 137 for generator 11. -/
def ep_Q2_008_partial_11_0137 : Poly :=
[
  term ((-2058068118691872000 : Rat) / 692956453614176359) [(1, 1), (2, 1), (7, 1), (14, 1), (16, 1)],
  term ((-2058068118691872000 : Rat) / 692956453614176359) [(1, 1), (3, 1), (7, 1), (15, 1), (16, 1)],
  term ((1029034059345936000 : Rat) / 692956453614176359) [(1, 1), (7, 1), (14, 2), (16, 1)],
  term ((1029034059345936000 : Rat) / 692956453614176359) [(1, 1), (7, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 137 for generator 11. -/
theorem ep_Q2_008_partial_11_0137_valid :
    mulPoly ep_Q2_008_coefficient_11_0137
        ep_Q2_008_generator_11_0100_0199 =
      ep_Q2_008_partial_11_0137 := by
  native_decide

/-- Coefficient term 138 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0138 : Poly :=
[
  term ((-609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (7, 2), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 138 for generator 11. -/
def ep_Q2_008_partial_11_0138 : Poly :=
[
  term ((-1218442200846645037506346959141427200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (2, 1), (7, 2), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1218442200846645037506346959141427200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (3, 1), (7, 2), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (7, 2), (12, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (7, 2), (12, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 138 for generator 11. -/
theorem ep_Q2_008_partial_11_0138_valid :
    mulPoly ep_Q2_008_coefficient_11_0138
        ep_Q2_008_generator_11_0100_0199 =
      ep_Q2_008_partial_11_0138 := by
  native_decide

/-- Coefficient term 139 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0139 : Poly :=
[
  term ((-43336929246501263764396389789139200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (7, 2), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 139 for generator 11. -/
def ep_Q2_008_partial_11_0139 : Poly :=
[
  term ((-86673858493002527528792779578278400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (2, 1), (7, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-86673858493002527528792779578278400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (3, 1), (7, 2), (12, 1), (15, 2), (16, 1)],
  term ((43336929246501263764396389789139200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (7, 2), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((43336929246501263764396389789139200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (7, 2), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 139 for generator 11. -/
theorem ep_Q2_008_partial_11_0139_valid :
    mulPoly ep_Q2_008_coefficient_11_0139
        ep_Q2_008_generator_11_0100_0199 =
      ep_Q2_008_partial_11_0139 := by
  native_decide

/-- Coefficient term 140 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0140 : Poly :=
[
  term ((-60212255272942500 : Rat) / 692956453614176359) [(1, 1), (8, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 140 for generator 11. -/
def ep_Q2_008_partial_11_0140 : Poly :=
[
  term ((-120424510545885000 : Rat) / 692956453614176359) [(1, 1), (2, 1), (8, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-120424510545885000 : Rat) / 692956453614176359) [(1, 1), (3, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((60212255272942500 : Rat) / 692956453614176359) [(1, 1), (8, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((60212255272942500 : Rat) / 692956453614176359) [(1, 1), (8, 1), (11, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 140 for generator 11. -/
theorem ep_Q2_008_partial_11_0140_valid :
    mulPoly ep_Q2_008_coefficient_11_0140
        ep_Q2_008_generator_11_0100_0199 =
      ep_Q2_008_partial_11_0140 := by
  native_decide

/-- Coefficient term 141 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0141 : Poly :=
[
  term ((334972429023769676136412354446667776000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 141 for generator 11. -/
def ep_Q2_008_partial_11_0141 : Poly :=
[
  term ((669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 1), (8, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 1), (8, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-334972429023769676136412354446667776000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (8, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-334972429023769676136412354446667776000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (8, 1), (11, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 141 for generator 11. -/
theorem ep_Q2_008_partial_11_0141_valid :
    mulPoly ep_Q2_008_coefficient_11_0141
        ep_Q2_008_generator_11_0100_0199 =
      ep_Q2_008_partial_11_0141 := by
  native_decide

/-- Coefficient term 142 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0142 : Poly :=
[
  term ((-100574316499860000 : Rat) / 692956453614176359) [(1, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 142 for generator 11. -/
def ep_Q2_008_partial_11_0142 : Poly :=
[
  term ((-201148632999720000 : Rat) / 692956453614176359) [(1, 1), (2, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((-201148632999720000 : Rat) / 692956453614176359) [(1, 1), (3, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((100574316499860000 : Rat) / 692956453614176359) [(1, 1), (8, 1), (11, 1), (14, 2), (16, 1)],
  term ((100574316499860000 : Rat) / 692956453614176359) [(1, 1), (8, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 142 for generator 11. -/
theorem ep_Q2_008_partial_11_0142_valid :
    mulPoly ep_Q2_008_coefficient_11_0142
        ep_Q2_008_generator_11_0100_0199 =
      ep_Q2_008_partial_11_0142 := by
  native_decide

/-- Coefficient term 143 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0143 : Poly :=
[
  term ((264988797391185653150505649995689332800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (8, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 143 for generator 11. -/
def ep_Q2_008_partial_11_0143 : Poly :=
[
  term ((529977594782371306301011299991378665600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((529977594782371306301011299991378665600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-264988797391185653150505649995689332800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (8, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-264988797391185653150505649995689332800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (8, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 143 for generator 11. -/
theorem ep_Q2_008_partial_11_0143_valid :
    mulPoly ep_Q2_008_coefficient_11_0143
        ep_Q2_008_generator_11_0100_0199 =
      ep_Q2_008_partial_11_0143 := by
  native_decide

/-- Coefficient term 144 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0144 : Poly :=
[
  term ((-9497299241309471661 : Rat) / 2771825814456705436) [(1, 1), (8, 1), (13, 1), (16, 1)]
]

/-- Partial product 144 for generator 11. -/
def ep_Q2_008_partial_11_0144 : Poly :=
[
  term ((-9497299241309471661 : Rat) / 1385912907228352718) [(1, 1), (2, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((-9497299241309471661 : Rat) / 1385912907228352718) [(1, 1), (3, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((9497299241309471661 : Rat) / 2771825814456705436) [(1, 1), (8, 1), (13, 1), (14, 2), (16, 1)],
  term ((9497299241309471661 : Rat) / 2771825814456705436) [(1, 1), (8, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 144 for generator 11. -/
theorem ep_Q2_008_partial_11_0144_valid :
    mulPoly ep_Q2_008_coefficient_11_0144
        ep_Q2_008_generator_11_0100_0199 =
      ep_Q2_008_partial_11_0144 := by
  native_decide

/-- Coefficient term 145 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0145 : Poly :=
[
  term ((-111657476341256558712137451482222592000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (8, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 145 for generator 11. -/
def ep_Q2_008_partial_11_0145 : Poly :=
[
  term ((-223314952682513117424274902964445184000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 1), (8, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-223314952682513117424274902964445184000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 1), (8, 1), (13, 2), (15, 2), (16, 1)],
  term ((111657476341256558712137451482222592000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (8, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((111657476341256558712137451482222592000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (8, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 145 for generator 11. -/
theorem ep_Q2_008_partial_11_0145_valid :
    mulPoly ep_Q2_008_coefficient_11_0145
        ep_Q2_008_generator_11_0100_0199 =
      ep_Q2_008_partial_11_0145 := by
  native_decide

/-- Coefficient term 146 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0146 : Poly :=
[
  term ((33770396062446760700889152618906251200 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 146 for generator 11. -/
def ep_Q2_008_partial_11_0146 : Poly :=
[
  term ((67540792124893521401778305237812502400 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((67540792124893521401778305237812502400 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 1), (8, 1), (15, 2), (16, 1)],
  term ((-33770396062446760700889152618906251200 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((-33770396062446760700889152618906251200 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (8, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 146 for generator 11. -/
theorem ep_Q2_008_partial_11_0146_valid :
    mulPoly ep_Q2_008_coefficient_11_0146
        ep_Q2_008_generator_11_0100_0199 =
      ep_Q2_008_partial_11_0146 := by
  native_decide

/-- Coefficient term 147 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0147 : Poly :=
[
  term ((385887772254726000 : Rat) / 692956453614176359) [(1, 1), (9, 1), (12, 1), (16, 1)]
]

/-- Partial product 147 for generator 11. -/
def ep_Q2_008_partial_11_0147 : Poly :=
[
  term ((771775544509452000 : Rat) / 692956453614176359) [(1, 1), (2, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((771775544509452000 : Rat) / 692956453614176359) [(1, 1), (3, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-385887772254726000 : Rat) / 692956453614176359) [(1, 1), (9, 1), (12, 1), (14, 2), (16, 1)],
  term ((-385887772254726000 : Rat) / 692956453614176359) [(1, 1), (9, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 147 for generator 11. -/
theorem ep_Q2_008_partial_11_0147_valid :
    mulPoly ep_Q2_008_coefficient_11_0147
        ep_Q2_008_generator_11_0100_0199 =
      ep_Q2_008_partial_11_0147 := by
  native_decide

/-- Coefficient term 148 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0148 : Poly :=
[
  term ((47640465710460000 : Rat) / 692956453614176359) [(1, 1), (10, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 148 for generator 11. -/
def ep_Q2_008_partial_11_0148 : Poly :=
[
  term ((95280931420920000 : Rat) / 692956453614176359) [(1, 1), (2, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((95280931420920000 : Rat) / 692956453614176359) [(1, 1), (3, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-47640465710460000 : Rat) / 692956453614176359) [(1, 1), (10, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((-47640465710460000 : Rat) / 692956453614176359) [(1, 1), (10, 1), (11, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 148 for generator 11. -/
theorem ep_Q2_008_partial_11_0148_valid :
    mulPoly ep_Q2_008_coefficient_11_0148
        ep_Q2_008_generator_11_0100_0199 =
      ep_Q2_008_partial_11_0148 := by
  native_decide

/-- Coefficient term 149 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0149 : Poly :=
[
  term ((-304898980546944000 : Rat) / 692956453614176359) [(1, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 149 for generator 11. -/
def ep_Q2_008_partial_11_0149 : Poly :=
[
  term ((-609797961093888000 : Rat) / 692956453614176359) [(1, 1), (2, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-609797961093888000 : Rat) / 692956453614176359) [(1, 1), (3, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((304898980546944000 : Rat) / 692956453614176359) [(1, 1), (10, 1), (11, 1), (14, 2), (16, 1)],
  term ((304898980546944000 : Rat) / 692956453614176359) [(1, 1), (10, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 149 for generator 11. -/
theorem ep_Q2_008_partial_11_0149_valid :
    mulPoly ep_Q2_008_coefficient_11_0149
        ep_Q2_008_generator_11_0100_0199 =
      ep_Q2_008_partial_11_0149 := by
  native_decide

/-- Coefficient term 150 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0150 : Poly :=
[
  term ((-8489530989603972000 : Rat) / 692956453614176359) [(1, 1), (10, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 150 for generator 11. -/
def ep_Q2_008_partial_11_0150 : Poly :=
[
  term ((-16979061979207944000 : Rat) / 692956453614176359) [(1, 1), (2, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-16979061979207944000 : Rat) / 692956453614176359) [(1, 1), (3, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((8489530989603972000 : Rat) / 692956453614176359) [(1, 1), (10, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((8489530989603972000 : Rat) / 692956453614176359) [(1, 1), (10, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 150 for generator 11. -/
theorem ep_Q2_008_partial_11_0150_valid :
    mulPoly ep_Q2_008_coefficient_11_0150
        ep_Q2_008_generator_11_0100_0199 =
      ep_Q2_008_partial_11_0150 := by
  native_decide

/-- Coefficient term 151 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0151 : Poly :=
[
  term ((33536628109921223774287078524254174232600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 151 for generator 11. -/
def ep_Q2_008_partial_11_0151 : Poly :=
[
  term ((67073256219842447548574157048508348465200 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((67073256219842447548574157048508348465200 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-33536628109921223774287078524254174232600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (10, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-33536628109921223774287078524254174232600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (10, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 151 for generator 11. -/
theorem ep_Q2_008_partial_11_0151_valid :
    mulPoly ep_Q2_008_coefficient_11_0151
        ep_Q2_008_generator_11_0100_0199 =
      ep_Q2_008_partial_11_0151 := by
  native_decide

/-- Coefficient term 152 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0152 : Poly :=
[
  term ((19716523940061682983 : Rat) / 2771825814456705436) [(1, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 152 for generator 11. -/
def ep_Q2_008_partial_11_0152 : Poly :=
[
  term ((19716523940061682983 : Rat) / 1385912907228352718) [(1, 1), (2, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((19716523940061682983 : Rat) / 1385912907228352718) [(1, 1), (3, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-19716523940061682983 : Rat) / 2771825814456705436) [(1, 1), (10, 1), (13, 1), (14, 2), (16, 1)],
  term ((-19716523940061682983 : Rat) / 2771825814456705436) [(1, 1), (10, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 152 for generator 11. -/
theorem ep_Q2_008_partial_11_0152_valid :
    mulPoly ep_Q2_008_coefficient_11_0152
        ep_Q2_008_generator_11_0100_0199 =
      ep_Q2_008_partial_11_0152 := by
  native_decide

/-- Coefficient term 153 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0153 : Poly :=
[
  term ((669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 153 for generator 11. -/
def ep_Q2_008_partial_11_0153 : Poly :=
[
  term ((1339889716095078704545649417786671104000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 1), (10, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((1339889716095078704545649417786671104000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((-669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (10, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((-669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (10, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 153 for generator 11. -/
theorem ep_Q2_008_partial_11_0153_valid :
    mulPoly ep_Q2_008_coefficient_11_0153
        ep_Q2_008_generator_11_0100_0199 =
      ep_Q2_008_partial_11_0153 := by
  native_decide

/-- Coefficient term 154 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0154 : Poly :=
[
  term ((-37618634030860335785142286561194786761100 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 154 for generator 11. -/
def ep_Q2_008_partial_11_0154 : Poly :=
[
  term ((-75237268061720671570284573122389573522200 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-75237268061720671570284573122389573522200 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 1), (10, 1), (15, 2), (16, 1)],
  term ((37618634030860335785142286561194786761100 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((37618634030860335785142286561194786761100 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (10, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 154 for generator 11. -/
theorem ep_Q2_008_partial_11_0154_valid :
    mulPoly ep_Q2_008_coefficient_11_0154
        ep_Q2_008_generator_11_0100_0199 =
      ep_Q2_008_partial_11_0154 := by
  native_decide

/-- Coefficient term 155 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0155 : Poly :=
[
  term ((-4005142638786577563590482971247979884800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 155 for generator 11. -/
def ep_Q2_008_partial_11_0155 : Poly :=
[
  term ((-8010285277573155127180965942495959769600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-8010285277573155127180965942495959769600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((4005142638786577563590482971247979884800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (11, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((4005142638786577563590482971247979884800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (11, 1), (12, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 155 for generator 11. -/
theorem ep_Q2_008_partial_11_0155_valid :
    mulPoly ep_Q2_008_coefficient_11_0155
        ep_Q2_008_generator_11_0100_0199 =
      ep_Q2_008_partial_11_0155 := by
  native_decide

/-- Coefficient term 156 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0156 : Poly :=
[
  term ((-14293661141217672000 : Rat) / 692956453614176359) [(1, 1), (11, 1), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 156 for generator 11. -/
def ep_Q2_008_partial_11_0156 : Poly :=
[
  term ((-28587322282435344000 : Rat) / 692956453614176359) [(1, 1), (2, 1), (11, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-28587322282435344000 : Rat) / 692956453614176359) [(1, 1), (3, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((14293661141217672000 : Rat) / 692956453614176359) [(1, 1), (11, 1), (12, 1), (13, 2), (14, 2), (16, 1)],
  term ((14293661141217672000 : Rat) / 692956453614176359) [(1, 1), (11, 1), (12, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 156 for generator 11. -/
theorem ep_Q2_008_partial_11_0156_valid :
    mulPoly ep_Q2_008_coefficient_11_0156
        ep_Q2_008_generator_11_0100_0199 =
      ep_Q2_008_partial_11_0156 := by
  native_decide

/-- Coefficient term 157 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0157 : Poly :=
[
  term ((-1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 157 for generator 11. -/
def ep_Q2_008_partial_11_0157 : Poly :=
[
  term ((-2366596089097314813815965124265084211200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (2, 1), (11, 1), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-2366596089097314813815965124265084211200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (3, 1), (11, 1), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (11, 1), (12, 1), (13, 3), (14, 2), (15, 1), (16, 1)],
  term ((1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (11, 1), (12, 1), (13, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 157 for generator 11. -/
theorem ep_Q2_008_partial_11_0157_valid :
    mulPoly ep_Q2_008_coefficient_11_0157
        ep_Q2_008_generator_11_0100_0199 =
      ep_Q2_008_partial_11_0157 := by
  native_decide

/-- Coefficient term 158 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0158 : Poly :=
[
  term ((-18085769892787330233 : Rat) / 2771825814456705436) [(1, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 158 for generator 11. -/
def ep_Q2_008_partial_11_0158 : Poly :=
[
  term ((-18085769892787330233 : Rat) / 1385912907228352718) [(1, 1), (2, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-18085769892787330233 : Rat) / 1385912907228352718) [(1, 1), (3, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((18085769892787330233 : Rat) / 2771825814456705436) [(1, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((18085769892787330233 : Rat) / 2771825814456705436) [(1, 1), (11, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 158 for generator 11. -/
theorem ep_Q2_008_partial_11_0158_valid :
    mulPoly ep_Q2_008_coefficient_11_0158
        ep_Q2_008_generator_11_0100_0199 =
      ep_Q2_008_partial_11_0158 := by
  native_decide

/-- Coefficient term 159 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0159 : Poly :=
[
  term ((43008753766387500 : Rat) / 692956453614176359) [(1, 1), (11, 1), (12, 2), (16, 1)]
]

/-- Partial product 159 for generator 11. -/
def ep_Q2_008_partial_11_0159 : Poly :=
[
  term ((86017507532775000 : Rat) / 692956453614176359) [(1, 1), (2, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((86017507532775000 : Rat) / 692956453614176359) [(1, 1), (3, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-43008753766387500 : Rat) / 692956453614176359) [(1, 1), (11, 1), (12, 2), (14, 2), (16, 1)],
  term ((-43008753766387500 : Rat) / 692956453614176359) [(1, 1), (11, 1), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 159 for generator 11. -/
theorem ep_Q2_008_partial_11_0159_valid :
    mulPoly ep_Q2_008_coefficient_11_0159
        ep_Q2_008_generator_11_0100_0199 =
      ep_Q2_008_partial_11_0159 := by
  native_decide

/-- Coefficient term 160 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0160 : Poly :=
[
  term ((837431072559424190341030886116669440000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 160 for generator 11. -/
def ep_Q2_008_partial_11_0160 : Poly :=
[
  term ((1674862145118848380682061772233338880000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1674862145118848380682061772233338880000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-837431072559424190341030886116669440000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-837431072559424190341030886116669440000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (11, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 160 for generator 11. -/
theorem ep_Q2_008_partial_11_0160_valid :
    mulPoly ep_Q2_008_coefficient_11_0160
        ep_Q2_008_generator_11_0100_0199 =
      ep_Q2_008_partial_11_0160 := by
  native_decide

/-- Coefficient term 161 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0161 : Poly :=
[
  term ((12757112074838804733 : Rat) / 2771825814456705436) [(1, 1), (11, 1), (16, 1)]
]

/-- Partial product 161 for generator 11. -/
def ep_Q2_008_partial_11_0161 : Poly :=
[
  term ((12757112074838804733 : Rat) / 1385912907228352718) [(1, 1), (2, 1), (11, 1), (14, 1), (16, 1)],
  term ((12757112074838804733 : Rat) / 1385912907228352718) [(1, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((-12757112074838804733 : Rat) / 2771825814456705436) [(1, 1), (11, 1), (14, 2), (16, 1)],
  term ((-12757112074838804733 : Rat) / 2771825814456705436) [(1, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 161 for generator 11. -/
theorem ep_Q2_008_partial_11_0161_valid :
    mulPoly ep_Q2_008_coefficient_11_0161
        ep_Q2_008_generator_11_0100_0199 =
      ep_Q2_008_partial_11_0161 := by
  native_decide

/-- Coefficient term 162 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0162 : Poly :=
[
  term ((-537446166407415209189398179728040768000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 162 for generator 11. -/
def ep_Q2_008_partial_11_0162 : Poly :=
[
  term ((-1074892332814830418378796359456081536000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1074892332814830418378796359456081536000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((537446166407415209189398179728040768000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (12, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((537446166407415209189398179728040768000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (12, 1), (13, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 162 for generator 11. -/
theorem ep_Q2_008_partial_11_0162_valid :
    mulPoly ep_Q2_008_coefficient_11_0162
        ep_Q2_008_generator_11_0100_0199 =
      ep_Q2_008_partial_11_0162 := by
  native_decide

/-- Coefficient term 163 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0163 : Poly :=
[
  term ((66834780657169178679 : Rat) / 2771825814456705436) [(1, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 163 for generator 11. -/
def ep_Q2_008_partial_11_0163 : Poly :=
[
  term ((66834780657169178679 : Rat) / 1385912907228352718) [(1, 1), (2, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((66834780657169178679 : Rat) / 1385912907228352718) [(1, 1), (3, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-66834780657169178679 : Rat) / 2771825814456705436) [(1, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-66834780657169178679 : Rat) / 2771825814456705436) [(1, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 163 for generator 11. -/
theorem ep_Q2_008_partial_11_0163_valid :
    mulPoly ep_Q2_008_coefficient_11_0163
        ep_Q2_008_generator_11_0100_0199 =
      ep_Q2_008_partial_11_0163 := by
  native_decide

/-- Coefficient term 164 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0164 : Poly :=
[
  term ((-12138364708928359441590006562299127142400 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 164 for generator 11. -/
def ep_Q2_008_partial_11_0164 : Poly :=
[
  term ((-24276729417856718883180013124598254284800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-24276729417856718883180013124598254284800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((12138364708928359441590006562299127142400 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (12, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((12138364708928359441590006562299127142400 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (12, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 164 for generator 11. -/
theorem ep_Q2_008_partial_11_0164_valid :
    mulPoly ep_Q2_008_coefficient_11_0164
        ep_Q2_008_generator_11_0100_0199 =
      ep_Q2_008_partial_11_0164 := by
  native_decide

/-- Coefficient term 165 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0165 : Poly :=
[
  term ((13564140929495529788066643625765824408825 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 165 for generator 11. -/
def ep_Q2_008_partial_11_0165 : Poly :=
[
  term ((27128281858991059576133287251531648817650 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((27128281858991059576133287251531648817650 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 1), (12, 1), (15, 2), (16, 1)],
  term ((-13564140929495529788066643625765824408825 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-13564140929495529788066643625765824408825 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 165 for generator 11. -/
theorem ep_Q2_008_partial_11_0165_valid :
    mulPoly ep_Q2_008_coefficient_11_0165
        ep_Q2_008_generator_11_0100_0199 =
      ep_Q2_008_partial_11_0165 := by
  native_decide

/-- Coefficient term 166 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0166 : Poly :=
[
  term ((-63892801305851915029291942101720580800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 166 for generator 11. -/
def ep_Q2_008_partial_11_0166 : Poly :=
[
  term ((-127785602611703830058583884203441161600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-127785602611703830058583884203441161600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 1), (12, 2), (15, 2), (16, 1)],
  term ((63892801305851915029291942101720580800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((63892801305851915029291942101720580800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (12, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 166 for generator 11. -/
theorem ep_Q2_008_partial_11_0166_valid :
    mulPoly ep_Q2_008_coefficient_11_0166
        ep_Q2_008_generator_11_0100_0199 =
      ep_Q2_008_partial_11_0166 := by
  native_decide

/-- Coefficient term 167 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0167 : Poly :=
[
  term ((20385026275509425805 : Rat) / 5543651628913410872) [(1, 1), (13, 1), (16, 1)]
]

/-- Partial product 167 for generator 11. -/
def ep_Q2_008_partial_11_0167 : Poly :=
[
  term ((20385026275509425805 : Rat) / 2771825814456705436) [(1, 1), (2, 1), (13, 1), (14, 1), (16, 1)],
  term ((20385026275509425805 : Rat) / 2771825814456705436) [(1, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((-20385026275509425805 : Rat) / 5543651628913410872) [(1, 1), (13, 1), (14, 2), (16, 1)],
  term ((-20385026275509425805 : Rat) / 5543651628913410872) [(1, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 167 for generator 11. -/
theorem ep_Q2_008_partial_11_0167_valid :
    mulPoly ep_Q2_008_coefficient_11_0167
        ep_Q2_008_generator_11_0100_0199 =
      ep_Q2_008_partial_11_0167 := by
  native_decide

/-- Coefficient term 168 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0168 : Poly :=
[
  term ((614116119876911072916755983152224256000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 168 for generator 11. -/
def ep_Q2_008_partial_11_0168 : Poly :=
[
  term ((1228232239753822145833511966304448512000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((1228232239753822145833511966304448512000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 1), (13, 2), (15, 2), (16, 1)],
  term ((-614116119876911072916755983152224256000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((-614116119876911072916755983152224256000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 168 for generator 11. -/
theorem ep_Q2_008_partial_11_0168_valid :
    mulPoly ep_Q2_008_coefficient_11_0168
        ep_Q2_008_generator_11_0100_0199 =
      ep_Q2_008_partial_11_0168 := by
  native_decide

/-- Coefficient term 169 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0169 : Poly :=
[
  term ((-63733627783237525025347137065157536091750 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 169 for generator 11. -/
def ep_Q2_008_partial_11_0169 : Poly :=
[
  term ((-127467255566475050050694274130315072183500 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 1), (14, 1), (15, 1), (16, 1)],
  term ((-127467255566475050050694274130315072183500 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 1), (15, 2), (16, 1)],
  term ((63733627783237525025347137065157536091750 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (14, 2), (15, 1), (16, 1)],
  term ((63733627783237525025347137065157536091750 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 169 for generator 11. -/
theorem ep_Q2_008_partial_11_0169_valid :
    mulPoly ep_Q2_008_coefficient_11_0169
        ep_Q2_008_generator_11_0100_0199 =
      ep_Q2_008_partial_11_0169 := by
  native_decide

/-- Coefficient term 170 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0170 : Poly :=
[
  term ((669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 2), (4, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 170 for generator 11. -/
def ep_Q2_008_partial_11_0170 : Poly :=
[
  term ((1339889716095078704545649417786671104000 : Rat) / 84353800925664757687870414129491527348999) [(1, 2), (2, 1), (4, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1339889716095078704545649417786671104000 : Rat) / 84353800925664757687870414129491527348999) [(1, 2), (3, 1), (4, 1), (13, 1), (15, 2), (16, 1)],
  term ((-669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 2), (4, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 2), (4, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 170 for generator 11. -/
theorem ep_Q2_008_partial_11_0170_valid :
    mulPoly ep_Q2_008_coefficient_11_0170
        ep_Q2_008_generator_11_0100_0199 =
      ep_Q2_008_partial_11_0170 := by
  native_decide

/-- Coefficient term 171 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0171 : Poly :=
[
  term ((10455217405948258983 : Rat) / 2771825814456705436) [(1, 2), (4, 1), (16, 1)]
]

/-- Partial product 171 for generator 11. -/
def ep_Q2_008_partial_11_0171 : Poly :=
[
  term ((10455217405948258983 : Rat) / 1385912907228352718) [(1, 2), (2, 1), (4, 1), (14, 1), (16, 1)],
  term ((10455217405948258983 : Rat) / 1385912907228352718) [(1, 2), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((-10455217405948258983 : Rat) / 2771825814456705436) [(1, 2), (4, 1), (14, 2), (16, 1)],
  term ((-10455217405948258983 : Rat) / 2771825814456705436) [(1, 2), (4, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 171 for generator 11. -/
theorem ep_Q2_008_partial_11_0171_valid :
    mulPoly ep_Q2_008_coefficient_11_0171
        ep_Q2_008_generator_11_0100_0199 =
      ep_Q2_008_partial_11_0171 := by
  native_decide

/-- Coefficient term 172 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0172 : Poly :=
[
  term ((-669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 172 for generator 11. -/
def ep_Q2_008_partial_11_0172 : Poly :=
[
  term ((-1339889716095078704545649417786671104000 : Rat) / 84353800925664757687870414129491527348999) [(1, 2), (2, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1339889716095078704545649417786671104000 : Rat) / 84353800925664757687870414129491527348999) [(1, 2), (3, 1), (13, 1), (15, 2), (16, 1)],
  term ((669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 2), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 172 for generator 11. -/
theorem ep_Q2_008_partial_11_0172_valid :
    mulPoly ep_Q2_008_coefficient_11_0172
        ep_Q2_008_generator_11_0100_0199 =
      ep_Q2_008_partial_11_0172 := by
  native_decide

/-- Coefficient term 173 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0173 : Poly :=
[
  term ((-10455217405948258983 : Rat) / 2771825814456705436) [(1, 2), (16, 1)]
]

/-- Partial product 173 for generator 11. -/
def ep_Q2_008_partial_11_0173 : Poly :=
[
  term ((-10455217405948258983 : Rat) / 1385912907228352718) [(1, 2), (2, 1), (14, 1), (16, 1)],
  term ((-10455217405948258983 : Rat) / 1385912907228352718) [(1, 2), (3, 1), (15, 1), (16, 1)],
  term ((10455217405948258983 : Rat) / 2771825814456705436) [(1, 2), (14, 2), (16, 1)],
  term ((10455217405948258983 : Rat) / 2771825814456705436) [(1, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 173 for generator 11. -/
theorem ep_Q2_008_partial_11_0173_valid :
    mulPoly ep_Q2_008_coefficient_11_0173
        ep_Q2_008_generator_11_0100_0199 =
      ep_Q2_008_partial_11_0173 := by
  native_decide

/-- Coefficient term 174 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0174 : Poly :=
[
  term ((-1452170821116451946550673061387232000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (5, 1), (7, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 174 for generator 11. -/
def ep_Q2_008_partial_11_0174 : Poly :=
[
  term ((-2904341642232903893101346122774464000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (4, 1), (5, 1), (7, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((1452170821116451946550673061387232000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (5, 1), (7, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((1452170821116451946550673061387232000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (5, 1), (7, 1), (13, 2), (15, 3), (16, 1)],
  term ((-2904341642232903893101346122774464000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (5, 1), (7, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 174 for generator 11. -/
theorem ep_Q2_008_partial_11_0174_valid :
    mulPoly ep_Q2_008_coefficient_11_0174
        ep_Q2_008_generator_11_0100_0199 =
      ep_Q2_008_partial_11_0174 := by
  native_decide

/-- Coefficient term 175 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0175 : Poly :=
[
  term ((6643918789421675572454059757980800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (5, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 175 for generator 11. -/
def ep_Q2_008_partial_11_0175 : Poly :=
[
  term ((13287837578843351144908119515961600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (4, 1), (5, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6643918789421675572454059757980800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (5, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-6643918789421675572454059757980800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (5, 1), (7, 1), (15, 3), (16, 1)],
  term ((13287837578843351144908119515961600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (5, 1), (7, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 175 for generator 11. -/
theorem ep_Q2_008_partial_11_0175_valid :
    mulPoly ep_Q2_008_coefficient_11_0175
        ep_Q2_008_generator_11_0100_0199 =
      ep_Q2_008_partial_11_0175 := by
  native_decide

/-- Coefficient term 176 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0176 : Poly :=
[
  term ((-242189375816351879415 : Rat) / 692956453614176359) [(3, 1), (4, 1), (5, 1), (13, 2), (16, 1)]
]

/-- Partial product 176 for generator 11. -/
def ep_Q2_008_partial_11_0176 : Poly :=
[
  term ((-484378751632703758830 : Rat) / 692956453614176359) [(2, 1), (3, 1), (4, 1), (5, 1), (13, 2), (14, 1), (16, 1)],
  term ((242189375816351879415 : Rat) / 692956453614176359) [(3, 1), (4, 1), (5, 1), (13, 2), (14, 2), (16, 1)],
  term ((242189375816351879415 : Rat) / 692956453614176359) [(3, 1), (4, 1), (5, 1), (13, 2), (15, 2), (16, 1)],
  term ((-484378751632703758830 : Rat) / 692956453614176359) [(3, 2), (4, 1), (5, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 176 for generator 11. -/
theorem ep_Q2_008_partial_11_0176_valid :
    mulPoly ep_Q2_008_coefficient_11_0176
        ep_Q2_008_generator_11_0100_0199 =
      ep_Q2_008_partial_11_0176 := by
  native_decide

/-- Coefficient term 177 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0177 : Poly :=
[
  term ((40983859916519688411 : Rat) / 11087303257826821744) [(3, 1), (4, 1), (5, 1), (16, 1)]
]

/-- Partial product 177 for generator 11. -/
def ep_Q2_008_partial_11_0177 : Poly :=
[
  term ((40983859916519688411 : Rat) / 5543651628913410872) [(2, 1), (3, 1), (4, 1), (5, 1), (14, 1), (16, 1)],
  term ((-40983859916519688411 : Rat) / 11087303257826821744) [(3, 1), (4, 1), (5, 1), (14, 2), (16, 1)],
  term ((-40983859916519688411 : Rat) / 11087303257826821744) [(3, 1), (4, 1), (5, 1), (15, 2), (16, 1)],
  term ((40983859916519688411 : Rat) / 5543651628913410872) [(3, 2), (4, 1), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 177 for generator 11. -/
theorem ep_Q2_008_partial_11_0177_valid :
    mulPoly ep_Q2_008_coefficient_11_0177
        ep_Q2_008_generator_11_0100_0199 =
      ep_Q2_008_partial_11_0177 := by
  native_decide

/-- Coefficient term 178 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0178 : Poly :=
[
  term ((18296019523453003248156164561491200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 178 for generator 11. -/
def ep_Q2_008_partial_11_0178 : Poly :=
[
  term ((36592039046906006496312329122982400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (4, 1), (6, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-18296019523453003248156164561491200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (6, 1), (7, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-18296019523453003248156164561491200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (6, 1), (7, 1), (13, 1), (15, 3), (16, 1)],
  term ((36592039046906006496312329122982400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (6, 1), (7, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 178 for generator 11. -/
theorem ep_Q2_008_partial_11_0178_valid :
    mulPoly ep_Q2_008_coefficient_11_0178
        ep_Q2_008_generator_11_0100_0199 =
      ep_Q2_008_partial_11_0178 := by
  native_decide

/-- Coefficient term 179 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0179 : Poly :=
[
  term ((-231759677771422065979541084536372800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (6, 1), (7, 1), (15, 2), (16, 1)]
]

/-- Partial product 179 for generator 11. -/
def ep_Q2_008_partial_11_0179 : Poly :=
[
  term ((-463519355542844131959082169072745600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (4, 1), (6, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((231759677771422065979541084536372800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (6, 1), (7, 1), (14, 2), (15, 2), (16, 1)],
  term ((231759677771422065979541084536372800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (6, 1), (7, 1), (15, 4), (16, 1)],
  term ((-463519355542844131959082169072745600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (6, 1), (7, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 179 for generator 11. -/
theorem ep_Q2_008_partial_11_0179_valid :
    mulPoly ep_Q2_008_coefficient_11_0179
        ep_Q2_008_generator_11_0100_0199 =
      ep_Q2_008_partial_11_0179 := by
  native_decide

/-- Coefficient term 180 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0180 : Poly :=
[
  term ((-80393285886401250 : Rat) / 692956453614176359) [(3, 1), (4, 1), (6, 1), (11, 1), (16, 1)]
]

/-- Partial product 180 for generator 11. -/
def ep_Q2_008_partial_11_0180 : Poly :=
[
  term ((-160786571772802500 : Rat) / 692956453614176359) [(2, 1), (3, 1), (4, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((80393285886401250 : Rat) / 692956453614176359) [(3, 1), (4, 1), (6, 1), (11, 1), (14, 2), (16, 1)],
  term ((80393285886401250 : Rat) / 692956453614176359) [(3, 1), (4, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((-160786571772802500 : Rat) / 692956453614176359) [(3, 2), (4, 1), (6, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 180 for generator 11. -/
theorem ep_Q2_008_partial_11_0180_valid :
    mulPoly ep_Q2_008_coefficient_11_0180
        ep_Q2_008_generator_11_0100_0199 =
      ep_Q2_008_partial_11_0180 := by
  native_decide

/-- Coefficient term 181 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0181 : Poly :=
[
  term ((-23985511571295349047 : Rat) / 2771825814456705436) [(3, 1), (4, 1), (6, 1), (13, 1), (16, 1)]
]

/-- Partial product 181 for generator 11. -/
def ep_Q2_008_partial_11_0181 : Poly :=
[
  term ((-23985511571295349047 : Rat) / 1385912907228352718) [(2, 1), (3, 1), (4, 1), (6, 1), (13, 1), (14, 1), (16, 1)],
  term ((23985511571295349047 : Rat) / 2771825814456705436) [(3, 1), (4, 1), (6, 1), (13, 1), (14, 2), (16, 1)],
  term ((23985511571295349047 : Rat) / 2771825814456705436) [(3, 1), (4, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((-23985511571295349047 : Rat) / 1385912907228352718) [(3, 2), (4, 1), (6, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 181 for generator 11. -/
theorem ep_Q2_008_partial_11_0181_valid :
    mulPoly ep_Q2_008_coefficient_11_0181
        ep_Q2_008_generator_11_0100_0199 =
      ep_Q2_008_partial_11_0181 := by
  native_decide

/-- Coefficient term 182 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0182 : Poly :=
[
  term ((3435221566231953390351318312084659222072763 : Rat) / 674830407405318061502963313035932218791992) [(3, 1), (4, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 182 for generator 11. -/
def ep_Q2_008_partial_11_0182 : Poly :=
[
  term ((3435221566231953390351318312084659222072763 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (3, 1), (4, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3435221566231953390351318312084659222072763 : Rat) / 674830407405318061502963313035932218791992) [(3, 1), (4, 1), (6, 1), (14, 2), (15, 1), (16, 1)],
  term ((-3435221566231953390351318312084659222072763 : Rat) / 674830407405318061502963313035932218791992) [(3, 1), (4, 1), (6, 1), (15, 3), (16, 1)],
  term ((3435221566231953390351318312084659222072763 : Rat) / 337415203702659030751481656517966109395996) [(3, 2), (4, 1), (6, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 182 for generator 11. -/
theorem ep_Q2_008_partial_11_0182_valid :
    mulPoly ep_Q2_008_coefficient_11_0182
        ep_Q2_008_generator_11_0100_0199 =
      ep_Q2_008_partial_11_0182 := by
  native_decide

/-- Coefficient term 183 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0183 : Poly :=
[
  term ((-1226998405954298601969926980543696800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 183 for generator 11. -/
def ep_Q2_008_partial_11_0183 : Poly :=
[
  term ((-2453996811908597203939853961087393600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (4, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1226998405954298601969926980543696800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((1226998405954298601969926980543696800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 1), (13, 1), (15, 3), (16, 1)],
  term ((-2453996811908597203939853961087393600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (7, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 183 for generator 11. -/
theorem ep_Q2_008_partial_11_0183_valid :
    mulPoly ep_Q2_008_coefficient_11_0183
        ep_Q2_008_generator_11_0100_0199 =
      ep_Q2_008_partial_11_0183 := by
  native_decide

/-- Coefficient term 184 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0184 : Poly :=
[
  term ((16422254336897173035 : Rat) / 2771825814456705436) [(3, 1), (4, 1), (7, 1), (13, 2), (16, 1)]
]

/-- Partial product 184 for generator 11. -/
def ep_Q2_008_partial_11_0184 : Poly :=
[
  term ((16422254336897173035 : Rat) / 1385912907228352718) [(2, 1), (3, 1), (4, 1), (7, 1), (13, 2), (14, 1), (16, 1)],
  term ((-16422254336897173035 : Rat) / 2771825814456705436) [(3, 1), (4, 1), (7, 1), (13, 2), (14, 2), (16, 1)],
  term ((-16422254336897173035 : Rat) / 2771825814456705436) [(3, 1), (4, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((16422254336897173035 : Rat) / 1385912907228352718) [(3, 2), (4, 1), (7, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 184 for generator 11. -/
theorem ep_Q2_008_partial_11_0184_valid :
    mulPoly ep_Q2_008_coefficient_11_0184
        ep_Q2_008_generator_11_0100_0199 =
      ep_Q2_008_partial_11_0184 := by
  native_decide

/-- Coefficient term 185 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0185 : Poly :=
[
  term ((82951547456953438319392796098370160000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 185 for generator 11. -/
def ep_Q2_008_partial_11_0185 : Poly :=
[
  term ((165903094913906876638785592196740320000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (4, 1), (7, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-82951547456953438319392796098370160000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 1), (13, 3), (14, 2), (15, 1), (16, 1)],
  term ((-82951547456953438319392796098370160000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 1), (13, 3), (15, 3), (16, 1)],
  term ((165903094913906876638785592196740320000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (7, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 185 for generator 11. -/
theorem ep_Q2_008_partial_11_0185_valid :
    mulPoly ep_Q2_008_coefficient_11_0185
        ep_Q2_008_generator_11_0100_0199 =
      ep_Q2_008_partial_11_0185 := by
  native_decide

/-- Coefficient term 186 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0186 : Poly :=
[
  term ((287195225765833385362536694256289600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 1), (15, 2), (16, 1)]
]

/-- Partial product 186 for generator 11. -/
def ep_Q2_008_partial_11_0186 : Poly :=
[
  term ((574390451531666770725073388512579200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (4, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((-287195225765833385362536694256289600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 1), (14, 2), (15, 2), (16, 1)],
  term ((-287195225765833385362536694256289600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 1), (15, 4), (16, 1)],
  term ((574390451531666770725073388512579200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (7, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 186 for generator 11. -/
theorem ep_Q2_008_partial_11_0186_valid :
    mulPoly ep_Q2_008_coefficient_11_0186
        ep_Q2_008_generator_11_0100_0199 =
      ep_Q2_008_partial_11_0186 := by
  native_decide

/-- Coefficient term 187 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0187 : Poly :=
[
  term ((13117062446999150049 : Rat) / 11087303257826821744) [(3, 1), (4, 1), (7, 1), (16, 1)]
]

/-- Partial product 187 for generator 11. -/
def ep_Q2_008_partial_11_0187 : Poly :=
[
  term ((13117062446999150049 : Rat) / 5543651628913410872) [(2, 1), (3, 1), (4, 1), (7, 1), (14, 1), (16, 1)],
  term ((-13117062446999150049 : Rat) / 11087303257826821744) [(3, 1), (4, 1), (7, 1), (14, 2), (16, 1)],
  term ((-13117062446999150049 : Rat) / 11087303257826821744) [(3, 1), (4, 1), (7, 1), (15, 2), (16, 1)],
  term ((13117062446999150049 : Rat) / 5543651628913410872) [(3, 2), (4, 1), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 187 for generator 11. -/
theorem ep_Q2_008_partial_11_0187_valid :
    mulPoly ep_Q2_008_coefficient_11_0187
        ep_Q2_008_generator_11_0100_0199 =
      ep_Q2_008_partial_11_0187 := by
  native_decide

/-- Coefficient term 188 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0188 : Poly :=
[
  term ((2284579126587459445324400548390176000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 2), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 188 for generator 11. -/
def ep_Q2_008_partial_11_0188 : Poly :=
[
  term ((4569158253174918890648801096780352000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (4, 1), (7, 2), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-2284579126587459445324400548390176000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 2), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((-2284579126587459445324400548390176000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 2), (13, 2), (15, 3), (16, 1)],
  term ((4569158253174918890648801096780352000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (7, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 188 for generator 11. -/
theorem ep_Q2_008_partial_11_0188_valid :
    mulPoly ep_Q2_008_coefficient_11_0188
        ep_Q2_008_generator_11_0100_0199 =
      ep_Q2_008_partial_11_0188 := by
  native_decide

/-- Coefficient term 189 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0189 : Poly :=
[
  term ((-29625011744928869497842266458838400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 2), (15, 1), (16, 1)]
]

/-- Partial product 189 for generator 11. -/
def ep_Q2_008_partial_11_0189 : Poly :=
[
  term ((-59250023489857738995684532917676800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (4, 1), (7, 2), (14, 1), (15, 1), (16, 1)],
  term ((29625011744928869497842266458838400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 2), (14, 2), (15, 1), (16, 1)],
  term ((29625011744928869497842266458838400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 2), (15, 3), (16, 1)],
  term ((-59250023489857738995684532917676800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (7, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 189 for generator 11. -/
theorem ep_Q2_008_partial_11_0189_valid :
    mulPoly ep_Q2_008_coefficient_11_0189
        ep_Q2_008_generator_11_0100_0199 =
      ep_Q2_008_partial_11_0189 := by
  native_decide

/-- Coefficient term 190 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0190 : Poly :=
[
  term ((17172005865335307000 : Rat) / 692956453614176359) [(3, 1), (4, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 190 for generator 11. -/
def ep_Q2_008_partial_11_0190 : Poly :=
[
  term ((34344011730670614000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (4, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-17172005865335307000 : Rat) / 692956453614176359) [(3, 1), (4, 1), (10, 1), (13, 1), (14, 2), (16, 1)],
  term ((-17172005865335307000 : Rat) / 692956453614176359) [(3, 1), (4, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((34344011730670614000 : Rat) / 692956453614176359) [(3, 2), (4, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 190 for generator 11. -/
theorem ep_Q2_008_partial_11_0190_valid :
    mulPoly ep_Q2_008_coefficient_11_0190
        ep_Q2_008_generator_11_0100_0199 =
      ep_Q2_008_partial_11_0190 := by
  native_decide

/-- Coefficient term 191 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0191 : Poly :=
[
  term ((771775544509452000 : Rat) / 692956453614176359) [(3, 1), (4, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 191 for generator 11. -/
def ep_Q2_008_partial_11_0191 : Poly :=
[
  term ((1543551089018904000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (4, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-771775544509452000 : Rat) / 692956453614176359) [(3, 1), (4, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((-771775544509452000 : Rat) / 692956453614176359) [(3, 1), (4, 1), (10, 1), (15, 3), (16, 1)],
  term ((1543551089018904000 : Rat) / 692956453614176359) [(3, 2), (4, 1), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 191 for generator 11. -/
theorem ep_Q2_008_partial_11_0191_valid :
    mulPoly ep_Q2_008_coefficient_11_0191
        ep_Q2_008_generator_11_0100_0199 =
      ep_Q2_008_partial_11_0191 := by
  native_decide

/-- Coefficient term 192 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0192 : Poly :=
[
  term ((6360365645918091527675642643791575857600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 192 for generator 11. -/
def ep_Q2_008_partial_11_0192 : Poly :=
[
  term ((12720731291836183055351285287583151715200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (4, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6360365645918091527675642643791575857600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-6360365645918091527675642643791575857600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((12720731291836183055351285287583151715200 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 192 for generator 11. -/
theorem ep_Q2_008_partial_11_0192_valid :
    mulPoly ep_Q2_008_coefficient_11_0192
        ep_Q2_008_generator_11_0100_0199 =
      ep_Q2_008_partial_11_0192 := by
  native_decide

/-- Coefficient term 193 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0193 : Poly :=
[
  term ((53601229279566270000 : Rat) / 692956453614176359) [(3, 1), (4, 1), (11, 1), (13, 2), (16, 1)]
]

/-- Partial product 193 for generator 11. -/
def ep_Q2_008_partial_11_0193 : Poly :=
[
  term ((107202458559132540000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (4, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-53601229279566270000 : Rat) / 692956453614176359) [(3, 1), (4, 1), (11, 1), (13, 2), (14, 2), (16, 1)],
  term ((-53601229279566270000 : Rat) / 692956453614176359) [(3, 1), (4, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((107202458559132540000 : Rat) / 692956453614176359) [(3, 2), (4, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 193 for generator 11. -/
theorem ep_Q2_008_partial_11_0193_valid :
    mulPoly ep_Q2_008_coefficient_11_0193
        ep_Q2_008_generator_11_0100_0199 =
      ep_Q2_008_partial_11_0193 := by
  native_decide

/-- Coefficient term 194 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0194 : Poly :=
[
  term ((4437367667057465275904934607997032896000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 194 for generator 11. -/
def ep_Q2_008_partial_11_0194 : Poly :=
[
  term ((8874735334114930551809869215994065792000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (4, 1), (11, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-4437367667057465275904934607997032896000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (11, 1), (13, 3), (14, 2), (15, 1), (16, 1)],
  term ((-4437367667057465275904934607997032896000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (11, 1), (13, 3), (15, 3), (16, 1)],
  term ((8874735334114930551809869215994065792000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (11, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 194 for generator 11. -/
theorem ep_Q2_008_partial_11_0194_valid :
    mulPoly ep_Q2_008_coefficient_11_0194
        ep_Q2_008_generator_11_0100_0199 =
      ep_Q2_008_partial_11_0194 := by
  native_decide

/-- Coefficient term 195 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0195 : Poly :=
[
  term ((698802278341388625 : Rat) / 5543651628913410872) [(3, 1), (4, 1), (11, 1), (16, 1)]
]

/-- Partial product 195 for generator 11. -/
def ep_Q2_008_partial_11_0195 : Poly :=
[
  term ((698802278341388625 : Rat) / 2771825814456705436) [(2, 1), (3, 1), (4, 1), (11, 1), (14, 1), (16, 1)],
  term ((-698802278341388625 : Rat) / 5543651628913410872) [(3, 1), (4, 1), (11, 1), (14, 2), (16, 1)],
  term ((-698802278341388625 : Rat) / 5543651628913410872) [(3, 1), (4, 1), (11, 1), (15, 2), (16, 1)],
  term ((698802278341388625 : Rat) / 2771825814456705436) [(3, 2), (4, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 195 for generator 11. -/
theorem ep_Q2_008_partial_11_0195_valid :
    mulPoly ep_Q2_008_coefficient_11_0195
        ep_Q2_008_generator_11_0100_0199 =
      ep_Q2_008_partial_11_0195 := by
  native_decide

/-- Coefficient term 196 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0196 : Poly :=
[
  term ((-2968110362108295761785255095192380649600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 196 for generator 11. -/
def ep_Q2_008_partial_11_0196 : Poly :=
[
  term ((-5936220724216591523570510190384761299200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (4, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((2968110362108295761785255095192380649600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((2968110362108295761785255095192380649600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (13, 1), (15, 4), (16, 1)],
  term ((-5936220724216591523570510190384761299200 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 196 for generator 11. -/
theorem ep_Q2_008_partial_11_0196_valid :
    mulPoly ep_Q2_008_coefficient_11_0196
        ep_Q2_008_generator_11_0100_0199 =
      ep_Q2_008_partial_11_0196 := by
  native_decide

/-- Coefficient term 197 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0197 : Poly :=
[
  term ((-317800570854334441839 : Rat) / 11087303257826821744) [(3, 1), (4, 1), (13, 1), (16, 1)]
]

/-- Partial product 197 for generator 11. -/
def ep_Q2_008_partial_11_0197 : Poly :=
[
  term ((-317800570854334441839 : Rat) / 5543651628913410872) [(2, 1), (3, 1), (4, 1), (13, 1), (14, 1), (16, 1)],
  term ((317800570854334441839 : Rat) / 11087303257826821744) [(3, 1), (4, 1), (13, 1), (14, 2), (16, 1)],
  term ((317800570854334441839 : Rat) / 11087303257826821744) [(3, 1), (4, 1), (13, 1), (15, 2), (16, 1)],
  term ((-317800570854334441839 : Rat) / 5543651628913410872) [(3, 2), (4, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 197 for generator 11. -/
theorem ep_Q2_008_partial_11_0197_valid :
    mulPoly ep_Q2_008_coefficient_11_0197
        ep_Q2_008_generator_11_0100_0199 =
      ep_Q2_008_partial_11_0197 := by
  native_decide

/-- Coefficient term 198 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0198 : Poly :=
[
  term ((78087766922716536404014994442510521760000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 198 for generator 11. -/
def ep_Q2_008_partial_11_0198 : Poly :=
[
  term ((156175533845433072808029988885021043520000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (4, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-78087766922716536404014994442510521760000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((-78087766922716536404014994442510521760000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (13, 2), (15, 3), (16, 1)],
  term ((156175533845433072808029988885021043520000 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 198 for generator 11. -/
theorem ep_Q2_008_partial_11_0198_valid :
    mulPoly ep_Q2_008_coefficient_11_0198
        ep_Q2_008_generator_11_0100_0199 =
      ep_Q2_008_partial_11_0198 := by
  native_decide

/-- Coefficient term 199 from coefficient polynomial 11. -/
def ep_Q2_008_coefficient_11_0199 : Poly :=
[
  term ((-127721114127203116015314603255944173943349 : Rat) / 23270014048459243500102183208135593751448) [(3, 1), (4, 1), (15, 1), (16, 1)]
]

/-- Partial product 199 for generator 11. -/
def ep_Q2_008_partial_11_0199 : Poly :=
[
  term ((-127721114127203116015314603255944173943349 : Rat) / 11635007024229621750051091604067796875724) [(2, 1), (3, 1), (4, 1), (14, 1), (15, 1), (16, 1)],
  term ((127721114127203116015314603255944173943349 : Rat) / 23270014048459243500102183208135593751448) [(3, 1), (4, 1), (14, 2), (15, 1), (16, 1)],
  term ((127721114127203116015314603255944173943349 : Rat) / 23270014048459243500102183208135593751448) [(3, 1), (4, 1), (15, 3), (16, 1)],
  term ((-127721114127203116015314603255944173943349 : Rat) / 11635007024229621750051091604067796875724) [(3, 2), (4, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 199 for generator 11. -/
theorem ep_Q2_008_partial_11_0199_valid :
    mulPoly ep_Q2_008_coefficient_11_0199
        ep_Q2_008_generator_11_0100_0199 =
      ep_Q2_008_partial_11_0199 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_008_partials_11_0100_0199 : List Poly :=
[
  ep_Q2_008_partial_11_0100,
  ep_Q2_008_partial_11_0101,
  ep_Q2_008_partial_11_0102,
  ep_Q2_008_partial_11_0103,
  ep_Q2_008_partial_11_0104,
  ep_Q2_008_partial_11_0105,
  ep_Q2_008_partial_11_0106,
  ep_Q2_008_partial_11_0107,
  ep_Q2_008_partial_11_0108,
  ep_Q2_008_partial_11_0109,
  ep_Q2_008_partial_11_0110,
  ep_Q2_008_partial_11_0111,
  ep_Q2_008_partial_11_0112,
  ep_Q2_008_partial_11_0113,
  ep_Q2_008_partial_11_0114,
  ep_Q2_008_partial_11_0115,
  ep_Q2_008_partial_11_0116,
  ep_Q2_008_partial_11_0117,
  ep_Q2_008_partial_11_0118,
  ep_Q2_008_partial_11_0119,
  ep_Q2_008_partial_11_0120,
  ep_Q2_008_partial_11_0121,
  ep_Q2_008_partial_11_0122,
  ep_Q2_008_partial_11_0123,
  ep_Q2_008_partial_11_0124,
  ep_Q2_008_partial_11_0125,
  ep_Q2_008_partial_11_0126,
  ep_Q2_008_partial_11_0127,
  ep_Q2_008_partial_11_0128,
  ep_Q2_008_partial_11_0129,
  ep_Q2_008_partial_11_0130,
  ep_Q2_008_partial_11_0131,
  ep_Q2_008_partial_11_0132,
  ep_Q2_008_partial_11_0133,
  ep_Q2_008_partial_11_0134,
  ep_Q2_008_partial_11_0135,
  ep_Q2_008_partial_11_0136,
  ep_Q2_008_partial_11_0137,
  ep_Q2_008_partial_11_0138,
  ep_Q2_008_partial_11_0139,
  ep_Q2_008_partial_11_0140,
  ep_Q2_008_partial_11_0141,
  ep_Q2_008_partial_11_0142,
  ep_Q2_008_partial_11_0143,
  ep_Q2_008_partial_11_0144,
  ep_Q2_008_partial_11_0145,
  ep_Q2_008_partial_11_0146,
  ep_Q2_008_partial_11_0147,
  ep_Q2_008_partial_11_0148,
  ep_Q2_008_partial_11_0149,
  ep_Q2_008_partial_11_0150,
  ep_Q2_008_partial_11_0151,
  ep_Q2_008_partial_11_0152,
  ep_Q2_008_partial_11_0153,
  ep_Q2_008_partial_11_0154,
  ep_Q2_008_partial_11_0155,
  ep_Q2_008_partial_11_0156,
  ep_Q2_008_partial_11_0157,
  ep_Q2_008_partial_11_0158,
  ep_Q2_008_partial_11_0159,
  ep_Q2_008_partial_11_0160,
  ep_Q2_008_partial_11_0161,
  ep_Q2_008_partial_11_0162,
  ep_Q2_008_partial_11_0163,
  ep_Q2_008_partial_11_0164,
  ep_Q2_008_partial_11_0165,
  ep_Q2_008_partial_11_0166,
  ep_Q2_008_partial_11_0167,
  ep_Q2_008_partial_11_0168,
  ep_Q2_008_partial_11_0169,
  ep_Q2_008_partial_11_0170,
  ep_Q2_008_partial_11_0171,
  ep_Q2_008_partial_11_0172,
  ep_Q2_008_partial_11_0173,
  ep_Q2_008_partial_11_0174,
  ep_Q2_008_partial_11_0175,
  ep_Q2_008_partial_11_0176,
  ep_Q2_008_partial_11_0177,
  ep_Q2_008_partial_11_0178,
  ep_Q2_008_partial_11_0179,
  ep_Q2_008_partial_11_0180,
  ep_Q2_008_partial_11_0181,
  ep_Q2_008_partial_11_0182,
  ep_Q2_008_partial_11_0183,
  ep_Q2_008_partial_11_0184,
  ep_Q2_008_partial_11_0185,
  ep_Q2_008_partial_11_0186,
  ep_Q2_008_partial_11_0187,
  ep_Q2_008_partial_11_0188,
  ep_Q2_008_partial_11_0189,
  ep_Q2_008_partial_11_0190,
  ep_Q2_008_partial_11_0191,
  ep_Q2_008_partial_11_0192,
  ep_Q2_008_partial_11_0193,
  ep_Q2_008_partial_11_0194,
  ep_Q2_008_partial_11_0195,
  ep_Q2_008_partial_11_0196,
  ep_Q2_008_partial_11_0197,
  ep_Q2_008_partial_11_0198,
  ep_Q2_008_partial_11_0199
]

/-- Sum of partial products in this block. -/
def ep_Q2_008_block_11_0100_0199 : Poly :=
[
  term ((-41745823559664555527490098782359620784000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 1), (4, 1), (14, 1), (15, 1), (16, 1)],
  term ((-774491104595441038160358966073190400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (2, 1), (5, 1), (6, 1), (7, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((87320075518113450380824785390604800 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (2, 1), (5, 1), (6, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-129167667102054335688 : Rat) / 692956453614176359) [(1, 1), (2, 1), (5, 1), (6, 1), (13, 2), (14, 1), (16, 1)],
  term ((26542157644955337657 : Rat) / 1385912907228352718) [(1, 1), (2, 1), (5, 1), (6, 1), (14, 1), (16, 1)],
  term ((774491104595441038160358966073190400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (2, 1), (5, 1), (7, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-87320075518113450380824785390604800 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (2, 1), (5, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((12113105612672266983 : Rat) / 1385912907228352718) [(1, 1), (2, 1), (5, 1), (8, 1), (14, 1), (16, 1)],
  term ((-11741509980130678983 : Rat) / 1385912907228352718) [(1, 1), (2, 1), (5, 1), (10, 1), (14, 1), (16, 1)],
  term ((2679779432190157409091298835573342208000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 1), (5, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((129167667102054335688 : Rat) / 692956453614176359) [(1, 1), (2, 1), (5, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-7400323832412329337 : Rat) / 692956453614176359) [(1, 1), (2, 1), (5, 1), (12, 1), (14, 1), (16, 1)],
  term ((-1339889716095078704545649417786671104000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 1), (5, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1879933578065458983 : Rat) / 2771825814456705436) [(1, 1), (2, 1), (5, 1), (14, 1), (16, 1)],
  term ((-156546074333121060904753408036070400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (2, 1), (6, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((2189633911586289738 : Rat) / 692956453614176359) [(1, 1), (2, 1), (6, 1), (7, 1), (13, 2), (14, 1), (16, 1)],
  term ((44240825310375167103676157919130752000 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (2, 1), (6, 1), (7, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((9249340331398466862 : Rat) / 692956453614176359) [(1, 1), (2, 1), (6, 1), (7, 1), (14, 1), (16, 1)],
  term ((1218442200846645037506346959141427200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (2, 1), (6, 1), (7, 2), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((86673858493002527528792779578278400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (2, 1), (6, 1), (7, 2), (14, 1), (15, 1), (16, 1)],
  term ((-597518386907264827702789605229191168000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 1), (6, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((13891959801170136000 : Rat) / 692956453614176359) [(1, 1), (2, 1), (6, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((6670395561478076422635316524709288665600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 1), (6, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((28587322282435344000 : Rat) / 692956453614176359) [(1, 1), (2, 1), (6, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((2366596089097314813815965124265084211200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (2, 1), (6, 1), (11, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((3615781793256984375 : Rat) / 692956453614176359) [(1, 1), (2, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((-42431773473488679047406498971168020933200 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 1), (6, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1074892332814830418378796359456081536000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 1), (6, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-34434004966646164920 : Rat) / 692956453614176359) [(1, 1), (2, 1), (6, 1), (13, 1), (14, 1), (16, 1)],
  term ((23383469607126666413482913512740473548800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 1), (6, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((144944625561052256697571485315240765108150 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((43626810247303208702812078181626403269200 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 1), (6, 2), (14, 1), (15, 1), (16, 1)],
  term ((1029034059345936000 : Rat) / 692956453614176359) [(1, 1), (2, 1), (7, 1), (10, 1), (14, 1), (16, 1)],
  term ((156546074333121060904753408036070400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (2, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2189633911586289738 : Rat) / 692956453614176359) [(1, 1), (2, 1), (7, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-44240825310375167103676157919130752000 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (2, 1), (7, 1), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-10792891420417370862 : Rat) / 692956453614176359) [(1, 1), (2, 1), (7, 1), (12, 1), (14, 1), (16, 1)],
  term ((-2058068118691872000 : Rat) / 692956453614176359) [(1, 1), (2, 1), (7, 1), (14, 1), (16, 1)],
  term ((-1218442200846645037506346959141427200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (2, 1), (7, 2), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-86673858493002527528792779578278400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (2, 1), (7, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-120424510545885000 : Rat) / 692956453614176359) [(1, 1), (2, 1), (8, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 1), (8, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-201148632999720000 : Rat) / 692956453614176359) [(1, 1), (2, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((529977594782371306301011299991378665600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-9497299241309471661 : Rat) / 1385912907228352718) [(1, 1), (2, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((-223314952682513117424274902964445184000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 1), (8, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((67540792124893521401778305237812502400 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((771775544509452000 : Rat) / 692956453614176359) [(1, 1), (2, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((95280931420920000 : Rat) / 692956453614176359) [(1, 1), (2, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-609797961093888000 : Rat) / 692956453614176359) [(1, 1), (2, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-16979061979207944000 : Rat) / 692956453614176359) [(1, 1), (2, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((67073256219842447548574157048508348465200 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((19716523940061682983 : Rat) / 1385912907228352718) [(1, 1), (2, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((1339889716095078704545649417786671104000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 1), (10, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-75237268061720671570284573122389573522200 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-8010285277573155127180965942495959769600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-28587322282435344000 : Rat) / 692956453614176359) [(1, 1), (2, 1), (11, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-2366596089097314813815965124265084211200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (2, 1), (11, 1), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-18085769892787330233 : Rat) / 1385912907228352718) [(1, 1), (2, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((86017507532775000 : Rat) / 692956453614176359) [(1, 1), (2, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((1674862145118848380682061772233338880000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((12757112074838804733 : Rat) / 1385912907228352718) [(1, 1), (2, 1), (11, 1), (14, 1), (16, 1)],
  term ((-1074892332814830418378796359456081536000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((66834780657169178679 : Rat) / 1385912907228352718) [(1, 1), (2, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-24276729417856718883180013124598254284800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((27128281858991059576133287251531648817650 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-127785602611703830058583884203441161600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((20385026275509425805 : Rat) / 2771825814456705436) [(1, 1), (2, 1), (13, 1), (14, 1), (16, 1)],
  term ((1228232239753822145833511966304448512000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-127467255566475050050694274130315072183500 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (2, 1), (14, 1), (15, 1), (16, 1)],
  term ((-41745823559664555527490098782359620784000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 1), (4, 1), (15, 2), (16, 1)],
  term ((-774491104595441038160358966073190400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (3, 1), (5, 1), (6, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((87320075518113450380824785390604800 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (3, 1), (5, 1), (6, 1), (7, 1), (15, 2), (16, 1)],
  term ((-129167667102054335688 : Rat) / 692956453614176359) [(1, 1), (3, 1), (5, 1), (6, 1), (13, 2), (15, 1), (16, 1)],
  term ((26542157644955337657 : Rat) / 1385912907228352718) [(1, 1), (3, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((774491104595441038160358966073190400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (3, 1), (5, 1), (7, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-87320075518113450380824785390604800 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (3, 1), (5, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((12113105612672266983 : Rat) / 1385912907228352718) [(1, 1), (3, 1), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-11741509980130678983 : Rat) / 1385912907228352718) [(1, 1), (3, 1), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((2679779432190157409091298835573342208000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 1), (5, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((129167667102054335688 : Rat) / 692956453614176359) [(1, 1), (3, 1), (5, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-7400323832412329337 : Rat) / 692956453614176359) [(1, 1), (3, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1339889716095078704545649417786671104000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 1), (5, 1), (13, 1), (15, 2), (16, 1)],
  term ((1879933578065458983 : Rat) / 2771825814456705436) [(1, 1), (3, 1), (5, 1), (15, 1), (16, 1)],
  term ((-156546074333121060904753408036070400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (3, 1), (6, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((2189633911586289738 : Rat) / 692956453614176359) [(1, 1), (3, 1), (6, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((44240825310375167103676157919130752000 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (3, 1), (6, 1), (7, 1), (13, 3), (15, 2), (16, 1)],
  term ((9249340331398466862 : Rat) / 692956453614176359) [(1, 1), (3, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((1218442200846645037506346959141427200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (3, 1), (6, 1), (7, 2), (13, 2), (15, 2), (16, 1)],
  term ((86673858493002527528792779578278400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (3, 1), (6, 1), (7, 2), (15, 2), (16, 1)],
  term ((-597518386907264827702789605229191168000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 1), (6, 1), (8, 1), (15, 2), (16, 1)],
  term ((13891959801170136000 : Rat) / 692956453614176359) [(1, 1), (3, 1), (6, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((6670395561478076422635316524709288665600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 1), (6, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((28587322282435344000 : Rat) / 692956453614176359) [(1, 1), (3, 1), (6, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((2366596089097314813815965124265084211200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (3, 1), (6, 1), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((3615781793256984375 : Rat) / 692956453614176359) [(1, 1), (3, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-42431773473488679047406498971168020933200 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 1), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((-34434004966646164920 : Rat) / 692956453614176359) [(1, 1), (3, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((1074892332814830418378796359456081536000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 1), (6, 1), (13, 1), (15, 3), (16, 1)],
  term ((23383469607126666413482913512740473548800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 1), (6, 1), (13, 2), (15, 2), (16, 1)],
  term ((144944625561052256697571485315240765108150 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 1), (6, 1), (15, 2), (16, 1)],
  term ((43626810247303208702812078181626403269200 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 1), (6, 2), (15, 2), (16, 1)],
  term ((1029034059345936000 : Rat) / 692956453614176359) [(1, 1), (3, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((156546074333121060904753408036070400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (3, 1), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2189633911586289738 : Rat) / 692956453614176359) [(1, 1), (3, 1), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-44240825310375167103676157919130752000 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (3, 1), (7, 1), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((-10792891420417370862 : Rat) / 692956453614176359) [(1, 1), (3, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2058068118691872000 : Rat) / 692956453614176359) [(1, 1), (3, 1), (7, 1), (15, 1), (16, 1)],
  term ((-1218442200846645037506346959141427200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (3, 1), (7, 2), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-86673858493002527528792779578278400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (3, 1), (7, 2), (12, 1), (15, 2), (16, 1)],
  term ((-120424510545885000 : Rat) / 692956453614176359) [(1, 1), (3, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 1), (8, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-201148632999720000 : Rat) / 692956453614176359) [(1, 1), (3, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((529977594782371306301011299991378665600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-9497299241309471661 : Rat) / 1385912907228352718) [(1, 1), (3, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-223314952682513117424274902964445184000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 1), (8, 1), (13, 2), (15, 2), (16, 1)],
  term ((67540792124893521401778305237812502400 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 1), (8, 1), (15, 2), (16, 1)],
  term ((771775544509452000 : Rat) / 692956453614176359) [(1, 1), (3, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((95280931420920000 : Rat) / 692956453614176359) [(1, 1), (3, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-609797961093888000 : Rat) / 692956453614176359) [(1, 1), (3, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-16979061979207944000 : Rat) / 692956453614176359) [(1, 1), (3, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((67073256219842447548574157048508348465200 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((19716523940061682983 : Rat) / 1385912907228352718) [(1, 1), (3, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((1339889716095078704545649417786671104000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((-75237268061720671570284573122389573522200 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 1), (10, 1), (15, 2), (16, 1)],
  term ((-8010285277573155127180965942495959769600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-28587322282435344000 : Rat) / 692956453614176359) [(1, 1), (3, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-2366596089097314813815965124265084211200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (3, 1), (11, 1), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((-18085769892787330233 : Rat) / 1385912907228352718) [(1, 1), (3, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((86017507532775000 : Rat) / 692956453614176359) [(1, 1), (3, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((1674862145118848380682061772233338880000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((12757112074838804733 : Rat) / 1385912907228352718) [(1, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((66834780657169178679 : Rat) / 1385912907228352718) [(1, 1), (3, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1074892332814830418378796359456081536000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-24276729417856718883180013124598254284800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((27128281858991059576133287251531648817650 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 1), (12, 1), (15, 2), (16, 1)],
  term ((-127785602611703830058583884203441161600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 1), (12, 2), (15, 2), (16, 1)],
  term ((20385026275509425805 : Rat) / 2771825814456705436) [(1, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((1228232239753822145833511966304448512000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 1), (13, 2), (15, 2), (16, 1)],
  term ((-127467255566475050050694274130315072183500 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (3, 1), (15, 2), (16, 1)],
  term ((20872911779832277763745049391179810392000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (4, 1), (14, 2), (15, 1), (16, 1)],
  term ((20872911779832277763745049391179810392000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (4, 1), (15, 3), (16, 1)],
  term ((387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (5, 1), (6, 1), (7, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (5, 1), (6, 1), (7, 1), (13, 2), (15, 3), (16, 1)],
  term ((-43660037759056725190412392695302400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (5, 1), (6, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-43660037759056725190412392695302400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (5, 1), (6, 1), (7, 1), (15, 3), (16, 1)],
  term ((64583833551027167844 : Rat) / 692956453614176359) [(1, 1), (5, 1), (6, 1), (13, 2), (14, 2), (16, 1)],
  term ((64583833551027167844 : Rat) / 692956453614176359) [(1, 1), (5, 1), (6, 1), (13, 2), (15, 2), (16, 1)],
  term ((-26542157644955337657 : Rat) / 2771825814456705436) [(1, 1), (5, 1), (6, 1), (14, 2), (16, 1)],
  term ((-26542157644955337657 : Rat) / 2771825814456705436) [(1, 1), (5, 1), (6, 1), (15, 2), (16, 1)],
  term ((-387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (5, 1), (7, 1), (12, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((-387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (5, 1), (7, 1), (12, 1), (13, 2), (15, 3), (16, 1)],
  term ((43660037759056725190412392695302400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (5, 1), (7, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((43660037759056725190412392695302400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (5, 1), (7, 1), (12, 1), (15, 3), (16, 1)],
  term ((-12113105612672266983 : Rat) / 2771825814456705436) [(1, 1), (5, 1), (8, 1), (14, 2), (16, 1)],
  term ((-12113105612672266983 : Rat) / 2771825814456705436) [(1, 1), (5, 1), (8, 1), (15, 2), (16, 1)],
  term ((11741509980130678983 : Rat) / 2771825814456705436) [(1, 1), (5, 1), (10, 1), (14, 2), (16, 1)],
  term ((11741509980130678983 : Rat) / 2771825814456705436) [(1, 1), (5, 1), (10, 1), (15, 2), (16, 1)],
  term ((-1339889716095078704545649417786671104000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (5, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1339889716095078704545649417786671104000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (5, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-64583833551027167844 : Rat) / 692956453614176359) [(1, 1), (5, 1), (12, 1), (13, 2), (14, 2), (16, 1)],
  term ((-64583833551027167844 : Rat) / 692956453614176359) [(1, 1), (5, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((7400323832412329337 : Rat) / 1385912907228352718) [(1, 1), (5, 1), (12, 1), (14, 2), (16, 1)],
  term ((7400323832412329337 : Rat) / 1385912907228352718) [(1, 1), (5, 1), (12, 1), (15, 2), (16, 1)],
  term ((669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (5, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (5, 1), (13, 1), (15, 3), (16, 1)],
  term ((-1879933578065458983 : Rat) / 5543651628913410872) [(1, 1), (5, 1), (14, 2), (16, 1)],
  term ((-1879933578065458983 : Rat) / 5543651628913410872) [(1, 1), (5, 1), (15, 2), (16, 1)],
  term ((78273037166560530452376704018035200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (7, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((78273037166560530452376704018035200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (7, 1), (13, 1), (15, 3), (16, 1)],
  term ((-1094816955793144869 : Rat) / 692956453614176359) [(1, 1), (6, 1), (7, 1), (13, 2), (14, 2), (16, 1)],
  term ((-1094816955793144869 : Rat) / 692956453614176359) [(1, 1), (6, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((-22120412655187583551838078959565376000 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (7, 1), (13, 3), (14, 2), (15, 1), (16, 1)],
  term ((-22120412655187583551838078959565376000 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (7, 1), (13, 3), (15, 3), (16, 1)],
  term ((-4624670165699233431 : Rat) / 692956453614176359) [(1, 1), (6, 1), (7, 1), (14, 2), (16, 1)],
  term ((-4624670165699233431 : Rat) / 692956453614176359) [(1, 1), (6, 1), (7, 1), (15, 2), (16, 1)],
  term ((-609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (7, 2), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((-609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (7, 2), (13, 2), (15, 3), (16, 1)],
  term ((-43336929246501263764396389789139200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (7, 2), (14, 2), (15, 1), (16, 1)],
  term ((-43336929246501263764396389789139200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (7, 2), (15, 3), (16, 1)],
  term ((298759193453632413851394802614595584000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((298759193453632413851394802614595584000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (8, 1), (15, 3), (16, 1)],
  term ((-6945979900585068000 : Rat) / 692956453614176359) [(1, 1), (6, 1), (10, 1), (13, 1), (14, 2), (16, 1)],
  term ((-6945979900585068000 : Rat) / 692956453614176359) [(1, 1), (6, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-3335197780739038211317658262354644332800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-3335197780739038211317658262354644332800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-14293661141217672000 : Rat) / 692956453614176359) [(1, 1), (6, 1), (11, 1), (13, 2), (14, 2), (16, 1)],
  term ((-14293661141217672000 : Rat) / 692956453614176359) [(1, 1), (6, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (11, 1), (13, 3), (14, 2), (15, 1), (16, 1)],
  term ((-1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 1), (11, 1), (13, 3), (15, 3), (16, 1)],
  term ((-3615781793256984375 : Rat) / 1385912907228352718) [(1, 1), (6, 1), (11, 1), (14, 2), (16, 1)],
  term ((-3615781793256984375 : Rat) / 1385912907228352718) [(1, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((21215886736744339523703249485584010466600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((21215886736744339523703249485584010466600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (12, 1), (15, 3), (16, 1)],
  term ((-537446166407415209189398179728040768000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((17217002483323082460 : Rat) / 692956453614176359) [(1, 1), (6, 1), (13, 1), (14, 2), (16, 1)],
  term ((17217002483323082460 : Rat) / 692956453614176359) [(1, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((-537446166407415209189398179728040768000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (13, 1), (15, 4), (16, 1)],
  term ((-11691734803563333206741456756370236774400 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((-11691734803563333206741456756370236774400 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (13, 2), (15, 3), (16, 1)],
  term ((-72472312780526128348785742657620382554075 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (14, 2), (15, 1), (16, 1)],
  term ((-72472312780526128348785742657620382554075 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (15, 3), (16, 1)],
  term ((-21813405123651604351406039090813201634600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 2), (14, 2), (15, 1), (16, 1)],
  term ((-21813405123651604351406039090813201634600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 2), (15, 3), (16, 1)],
  term ((-514517029672968000 : Rat) / 692956453614176359) [(1, 1), (7, 1), (10, 1), (14, 2), (16, 1)],
  term ((-514517029672968000 : Rat) / 692956453614176359) [(1, 1), (7, 1), (10, 1), (15, 2), (16, 1)],
  term ((-78273037166560530452376704018035200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (7, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-78273037166560530452376704018035200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (7, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((1094816955793144869 : Rat) / 692956453614176359) [(1, 1), (7, 1), (12, 1), (13, 2), (14, 2), (16, 1)],
  term ((1094816955793144869 : Rat) / 692956453614176359) [(1, 1), (7, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((22120412655187583551838078959565376000 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (7, 1), (12, 1), (13, 3), (14, 2), (15, 1), (16, 1)],
  term ((22120412655187583551838078959565376000 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (7, 1), (12, 1), (13, 3), (15, 3), (16, 1)],
  term ((5396445710208685431 : Rat) / 692956453614176359) [(1, 1), (7, 1), (12, 1), (14, 2), (16, 1)],
  term ((5396445710208685431 : Rat) / 692956453614176359) [(1, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((1029034059345936000 : Rat) / 692956453614176359) [(1, 1), (7, 1), (14, 2), (16, 1)],
  term ((1029034059345936000 : Rat) / 692956453614176359) [(1, 1), (7, 1), (15, 2), (16, 1)],
  term ((609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (7, 2), (12, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (7, 2), (12, 1), (13, 2), (15, 3), (16, 1)],
  term ((43336929246501263764396389789139200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (7, 2), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((43336929246501263764396389789139200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (7, 2), (12, 1), (15, 3), (16, 1)],
  term ((60212255272942500 : Rat) / 692956453614176359) [(1, 1), (8, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((60212255272942500 : Rat) / 692956453614176359) [(1, 1), (8, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-334972429023769676136412354446667776000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (8, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-334972429023769676136412354446667776000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (8, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((100574316499860000 : Rat) / 692956453614176359) [(1, 1), (8, 1), (11, 1), (14, 2), (16, 1)],
  term ((100574316499860000 : Rat) / 692956453614176359) [(1, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((-264988797391185653150505649995689332800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (8, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-264988797391185653150505649995689332800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (8, 1), (12, 1), (15, 3), (16, 1)],
  term ((9497299241309471661 : Rat) / 2771825814456705436) [(1, 1), (8, 1), (13, 1), (14, 2), (16, 1)],
  term ((9497299241309471661 : Rat) / 2771825814456705436) [(1, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((111657476341256558712137451482222592000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (8, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((111657476341256558712137451482222592000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (8, 1), (13, 2), (15, 3), (16, 1)],
  term ((-33770396062446760700889152618906251200 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((-33770396062446760700889152618906251200 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (8, 1), (15, 3), (16, 1)],
  term ((-385887772254726000 : Rat) / 692956453614176359) [(1, 1), (9, 1), (12, 1), (14, 2), (16, 1)],
  term ((-385887772254726000 : Rat) / 692956453614176359) [(1, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-47640465710460000 : Rat) / 692956453614176359) [(1, 1), (10, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((-47640465710460000 : Rat) / 692956453614176359) [(1, 1), (10, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((304898980546944000 : Rat) / 692956453614176359) [(1, 1), (10, 1), (11, 1), (14, 2), (16, 1)],
  term ((304898980546944000 : Rat) / 692956453614176359) [(1, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((8489530989603972000 : Rat) / 692956453614176359) [(1, 1), (10, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((8489530989603972000 : Rat) / 692956453614176359) [(1, 1), (10, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-33536628109921223774287078524254174232600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (10, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-33536628109921223774287078524254174232600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (10, 1), (12, 1), (15, 3), (16, 1)],
  term ((-19716523940061682983 : Rat) / 2771825814456705436) [(1, 1), (10, 1), (13, 1), (14, 2), (16, 1)],
  term ((-19716523940061682983 : Rat) / 2771825814456705436) [(1, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (10, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((-669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (10, 1), (13, 2), (15, 3), (16, 1)],
  term ((37618634030860335785142286561194786761100 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((37618634030860335785142286561194786761100 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (10, 1), (15, 3), (16, 1)],
  term ((4005142638786577563590482971247979884800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (11, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((4005142638786577563590482971247979884800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (11, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((14293661141217672000 : Rat) / 692956453614176359) [(1, 1), (11, 1), (12, 1), (13, 2), (14, 2), (16, 1)],
  term ((14293661141217672000 : Rat) / 692956453614176359) [(1, 1), (11, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (11, 1), (12, 1), (13, 3), (14, 2), (15, 1), (16, 1)],
  term ((1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (11, 1), (12, 1), (13, 3), (15, 3), (16, 1)],
  term ((18085769892787330233 : Rat) / 2771825814456705436) [(1, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((18085769892787330233 : Rat) / 2771825814456705436) [(1, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-43008753766387500 : Rat) / 692956453614176359) [(1, 1), (11, 1), (12, 2), (14, 2), (16, 1)],
  term ((-43008753766387500 : Rat) / 692956453614176359) [(1, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((-837431072559424190341030886116669440000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-837431072559424190341030886116669440000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-12757112074838804733 : Rat) / 2771825814456705436) [(1, 1), (11, 1), (14, 2), (16, 1)],
  term ((-12757112074838804733 : Rat) / 2771825814456705436) [(1, 1), (11, 1), (15, 2), (16, 1)],
  term ((537446166407415209189398179728040768000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (12, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-66834780657169178679 : Rat) / 2771825814456705436) [(1, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-66834780657169178679 : Rat) / 2771825814456705436) [(1, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((537446166407415209189398179728040768000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (12, 1), (13, 1), (15, 4), (16, 1)],
  term ((12138364708928359441590006562299127142400 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (12, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((12138364708928359441590006562299127142400 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (12, 1), (13, 2), (15, 3), (16, 1)],
  term ((-13564140929495529788066643625765824408825 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-13564140929495529788066643625765824408825 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (12, 1), (15, 3), (16, 1)],
  term ((63892801305851915029291942101720580800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((63892801305851915029291942101720580800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (12, 2), (15, 3), (16, 1)],
  term ((-20385026275509425805 : Rat) / 5543651628913410872) [(1, 1), (13, 1), (14, 2), (16, 1)],
  term ((-20385026275509425805 : Rat) / 5543651628913410872) [(1, 1), (13, 1), (15, 2), (16, 1)],
  term ((-614116119876911072916755983152224256000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((-614116119876911072916755983152224256000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (13, 2), (15, 3), (16, 1)],
  term ((63733627783237525025347137065157536091750 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (14, 2), (15, 1), (16, 1)],
  term ((63733627783237525025347137065157536091750 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (15, 3), (16, 1)],
  term ((1339889716095078704545649417786671104000 : Rat) / 84353800925664757687870414129491527348999) [(1, 2), (2, 1), (4, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((10455217405948258983 : Rat) / 1385912907228352718) [(1, 2), (2, 1), (4, 1), (14, 1), (16, 1)],
  term ((-1339889716095078704545649417786671104000 : Rat) / 84353800925664757687870414129491527348999) [(1, 2), (2, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-10455217405948258983 : Rat) / 1385912907228352718) [(1, 2), (2, 1), (14, 1), (16, 1)],
  term ((1339889716095078704545649417786671104000 : Rat) / 84353800925664757687870414129491527348999) [(1, 2), (3, 1), (4, 1), (13, 1), (15, 2), (16, 1)],
  term ((10455217405948258983 : Rat) / 1385912907228352718) [(1, 2), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((-1339889716095078704545649417786671104000 : Rat) / 84353800925664757687870414129491527348999) [(1, 2), (3, 1), (13, 1), (15, 2), (16, 1)],
  term ((-10455217405948258983 : Rat) / 1385912907228352718) [(1, 2), (3, 1), (15, 1), (16, 1)],
  term ((-669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 2), (4, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 2), (4, 1), (13, 1), (15, 3), (16, 1)],
  term ((-10455217405948258983 : Rat) / 2771825814456705436) [(1, 2), (4, 1), (14, 2), (16, 1)],
  term ((-10455217405948258983 : Rat) / 2771825814456705436) [(1, 2), (4, 1), (15, 2), (16, 1)],
  term ((669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((669944858047539352272824708893335552000 : Rat) / 84353800925664757687870414129491527348999) [(1, 2), (13, 1), (15, 3), (16, 1)],
  term ((10455217405948258983 : Rat) / 2771825814456705436) [(1, 2), (14, 2), (16, 1)],
  term ((10455217405948258983 : Rat) / 2771825814456705436) [(1, 2), (15, 2), (16, 1)],
  term ((-2904341642232903893101346122774464000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (4, 1), (5, 1), (7, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((13287837578843351144908119515961600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (4, 1), (5, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-484378751632703758830 : Rat) / 692956453614176359) [(2, 1), (3, 1), (4, 1), (5, 1), (13, 2), (14, 1), (16, 1)],
  term ((40983859916519688411 : Rat) / 5543651628913410872) [(2, 1), (3, 1), (4, 1), (5, 1), (14, 1), (16, 1)],
  term ((36592039046906006496312329122982400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (4, 1), (6, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-463519355542844131959082169072745600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (4, 1), (6, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((-160786571772802500 : Rat) / 692956453614176359) [(2, 1), (3, 1), (4, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((-23985511571295349047 : Rat) / 1385912907228352718) [(2, 1), (3, 1), (4, 1), (6, 1), (13, 1), (14, 1), (16, 1)],
  term ((3435221566231953390351318312084659222072763 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (3, 1), (4, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2453996811908597203939853961087393600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (4, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((16422254336897173035 : Rat) / 1385912907228352718) [(2, 1), (3, 1), (4, 1), (7, 1), (13, 2), (14, 1), (16, 1)],
  term ((165903094913906876638785592196740320000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (4, 1), (7, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((574390451531666770725073388512579200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (4, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((13117062446999150049 : Rat) / 5543651628913410872) [(2, 1), (3, 1), (4, 1), (7, 1), (14, 1), (16, 1)],
  term ((4569158253174918890648801096780352000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (4, 1), (7, 2), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-59250023489857738995684532917676800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (4, 1), (7, 2), (14, 1), (15, 1), (16, 1)],
  term ((34344011730670614000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (4, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((1543551089018904000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (4, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((12720731291836183055351285287583151715200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (4, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((107202458559132540000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (4, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((8874735334114930551809869215994065792000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (4, 1), (11, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((698802278341388625 : Rat) / 2771825814456705436) [(2, 1), (3, 1), (4, 1), (11, 1), (14, 1), (16, 1)],
  term ((-5936220724216591523570510190384761299200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (4, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-317800570854334441839 : Rat) / 5543651628913410872) [(2, 1), (3, 1), (4, 1), (13, 1), (14, 1), (16, 1)],
  term ((156175533845433072808029988885021043520000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (4, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-127721114127203116015314603255944173943349 : Rat) / 11635007024229621750051091604067796875724) [(2, 1), (3, 1), (4, 1), (14, 1), (15, 1), (16, 1)],
  term ((1452170821116451946550673061387232000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (5, 1), (7, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((1452170821116451946550673061387232000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (5, 1), (7, 1), (13, 2), (15, 3), (16, 1)],
  term ((-6643918789421675572454059757980800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (5, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-6643918789421675572454059757980800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (5, 1), (7, 1), (15, 3), (16, 1)],
  term ((242189375816351879415 : Rat) / 692956453614176359) [(3, 1), (4, 1), (5, 1), (13, 2), (14, 2), (16, 1)],
  term ((242189375816351879415 : Rat) / 692956453614176359) [(3, 1), (4, 1), (5, 1), (13, 2), (15, 2), (16, 1)],
  term ((-40983859916519688411 : Rat) / 11087303257826821744) [(3, 1), (4, 1), (5, 1), (14, 2), (16, 1)],
  term ((-40983859916519688411 : Rat) / 11087303257826821744) [(3, 1), (4, 1), (5, 1), (15, 2), (16, 1)],
  term ((-18296019523453003248156164561491200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (6, 1), (7, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-18296019523453003248156164561491200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (6, 1), (7, 1), (13, 1), (15, 3), (16, 1)],
  term ((231759677771422065979541084536372800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (6, 1), (7, 1), (14, 2), (15, 2), (16, 1)],
  term ((231759677771422065979541084536372800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (6, 1), (7, 1), (15, 4), (16, 1)],
  term ((80393285886401250 : Rat) / 692956453614176359) [(3, 1), (4, 1), (6, 1), (11, 1), (14, 2), (16, 1)],
  term ((80393285886401250 : Rat) / 692956453614176359) [(3, 1), (4, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((23985511571295349047 : Rat) / 2771825814456705436) [(3, 1), (4, 1), (6, 1), (13, 1), (14, 2), (16, 1)],
  term ((23985511571295349047 : Rat) / 2771825814456705436) [(3, 1), (4, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((-3435221566231953390351318312084659222072763 : Rat) / 674830407405318061502963313035932218791992) [(3, 1), (4, 1), (6, 1), (14, 2), (15, 1), (16, 1)],
  term ((-3435221566231953390351318312084659222072763 : Rat) / 674830407405318061502963313035932218791992) [(3, 1), (4, 1), (6, 1), (15, 3), (16, 1)],
  term ((1226998405954298601969926980543696800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((1226998405954298601969926980543696800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 1), (13, 1), (15, 3), (16, 1)],
  term ((-16422254336897173035 : Rat) / 2771825814456705436) [(3, 1), (4, 1), (7, 1), (13, 2), (14, 2), (16, 1)],
  term ((-16422254336897173035 : Rat) / 2771825814456705436) [(3, 1), (4, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((-82951547456953438319392796098370160000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 1), (13, 3), (14, 2), (15, 1), (16, 1)],
  term ((-82951547456953438319392796098370160000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 1), (13, 3), (15, 3), (16, 1)],
  term ((-287195225765833385362536694256289600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 1), (14, 2), (15, 2), (16, 1)],
  term ((-13117062446999150049 : Rat) / 11087303257826821744) [(3, 1), (4, 1), (7, 1), (14, 2), (16, 1)],
  term ((-13117062446999150049 : Rat) / 11087303257826821744) [(3, 1), (4, 1), (7, 1), (15, 2), (16, 1)],
  term ((-287195225765833385362536694256289600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 1), (15, 4), (16, 1)],
  term ((-2284579126587459445324400548390176000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 2), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((-2284579126587459445324400548390176000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 2), (13, 2), (15, 3), (16, 1)],
  term ((29625011744928869497842266458838400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 2), (14, 2), (15, 1), (16, 1)],
  term ((29625011744928869497842266458838400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 2), (15, 3), (16, 1)],
  term ((-17172005865335307000 : Rat) / 692956453614176359) [(3, 1), (4, 1), (10, 1), (13, 1), (14, 2), (16, 1)],
  term ((-17172005865335307000 : Rat) / 692956453614176359) [(3, 1), (4, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-771775544509452000 : Rat) / 692956453614176359) [(3, 1), (4, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((-771775544509452000 : Rat) / 692956453614176359) [(3, 1), (4, 1), (10, 1), (15, 3), (16, 1)],
  term ((-6360365645918091527675642643791575857600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-6360365645918091527675642643791575857600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-53601229279566270000 : Rat) / 692956453614176359) [(3, 1), (4, 1), (11, 1), (13, 2), (14, 2), (16, 1)],
  term ((-53601229279566270000 : Rat) / 692956453614176359) [(3, 1), (4, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-4437367667057465275904934607997032896000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (11, 1), (13, 3), (14, 2), (15, 1), (16, 1)],
  term ((-4437367667057465275904934607997032896000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (11, 1), (13, 3), (15, 3), (16, 1)],
  term ((-698802278341388625 : Rat) / 5543651628913410872) [(3, 1), (4, 1), (11, 1), (14, 2), (16, 1)],
  term ((-698802278341388625 : Rat) / 5543651628913410872) [(3, 1), (4, 1), (11, 1), (15, 2), (16, 1)],
  term ((2968110362108295761785255095192380649600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((317800570854334441839 : Rat) / 11087303257826821744) [(3, 1), (4, 1), (13, 1), (14, 2), (16, 1)],
  term ((317800570854334441839 : Rat) / 11087303257826821744) [(3, 1), (4, 1), (13, 1), (15, 2), (16, 1)],
  term ((2968110362108295761785255095192380649600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (13, 1), (15, 4), (16, 1)],
  term ((-78087766922716536404014994442510521760000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((-78087766922716536404014994442510521760000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (13, 2), (15, 3), (16, 1)],
  term ((127721114127203116015314603255944173943349 : Rat) / 23270014048459243500102183208135593751448) [(3, 1), (4, 1), (14, 2), (15, 1), (16, 1)],
  term ((127721114127203116015314603255944173943349 : Rat) / 23270014048459243500102183208135593751448) [(3, 1), (4, 1), (15, 3), (16, 1)],
  term ((-2904341642232903893101346122774464000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (5, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((13287837578843351144908119515961600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((-484378751632703758830 : Rat) / 692956453614176359) [(3, 2), (4, 1), (5, 1), (13, 2), (15, 1), (16, 1)],
  term ((40983859916519688411 : Rat) / 5543651628913410872) [(3, 2), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((36592039046906006496312329122982400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (6, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-463519355542844131959082169072745600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (6, 1), (7, 1), (15, 3), (16, 1)],
  term ((-160786571772802500 : Rat) / 692956453614176359) [(3, 2), (4, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-23985511571295349047 : Rat) / 1385912907228352718) [(3, 2), (4, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((3435221566231953390351318312084659222072763 : Rat) / 337415203702659030751481656517966109395996) [(3, 2), (4, 1), (6, 1), (15, 2), (16, 1)],
  term ((-2453996811908597203939853961087393600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((16422254336897173035 : Rat) / 1385912907228352718) [(3, 2), (4, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((165903094913906876638785592196740320000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (7, 1), (13, 3), (15, 2), (16, 1)],
  term ((13117062446999150049 : Rat) / 5543651628913410872) [(3, 2), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((574390451531666770725073388512579200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (7, 1), (15, 3), (16, 1)],
  term ((4569158253174918890648801096780352000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (7, 2), (13, 2), (15, 2), (16, 1)],
  term ((-59250023489857738995684532917676800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (7, 2), (15, 2), (16, 1)],
  term ((34344011730670614000 : Rat) / 692956453614176359) [(3, 2), (4, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((1543551089018904000 : Rat) / 692956453614176359) [(3, 2), (4, 1), (10, 1), (15, 2), (16, 1)],
  term ((12720731291836183055351285287583151715200 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((107202458559132540000 : Rat) / 692956453614176359) [(3, 2), (4, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((8874735334114930551809869215994065792000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((698802278341388625 : Rat) / 2771825814456705436) [(3, 2), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((-317800570854334441839 : Rat) / 5543651628913410872) [(3, 2), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5936220724216591523570510190384761299200 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (13, 1), (15, 3), (16, 1)],
  term ((156175533845433072808029988885021043520000 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (13, 2), (15, 2), (16, 1)],
  term ((-127721114127203116015314603255944173943349 : Rat) / 11635007024229621750051091604067796875724) [(3, 2), (4, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 11, terms 100 through 199. -/
theorem ep_Q2_008_block_11_0100_0199_valid :
    checkProductSumEq ep_Q2_008_partials_11_0100_0199
      ep_Q2_008_block_11_0100_0199 = true := by
  native_decide

end EpQ2008TermShards

end Patterns

end EndpointCertificate

end Problem97
