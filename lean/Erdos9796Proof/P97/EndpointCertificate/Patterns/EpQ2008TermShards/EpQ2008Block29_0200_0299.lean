/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_008, term block 29:200-299

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_008`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2008TermShards

/-- Generator polynomial 29 for endpoint certificate `ep_Q2_008`. -/
def ep_Q2_008_generator_29_0200_0299 : Poly :=
[
  term (2 : Rat) [(12, 1), (14, 1)],
  term (-1 : Rat) [(12, 2)],
  term (2 : Rat) [(13, 1), (15, 1)],
  term (-1 : Rat) [(13, 2)]
]

/-- Coefficient term 200 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0200 : Poly :=
[
  term ((60274769552251048971 : Rat) / 5543651628913410872) [(3, 1), (6, 1), (13, 1), (16, 1)]
]

/-- Partial product 200 for generator 29. -/
def ep_Q2_008_partial_29_0200 : Poly :=
[
  term ((60274769552251048971 : Rat) / 2771825814456705436) [(3, 1), (6, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-60274769552251048971 : Rat) / 5543651628913410872) [(3, 1), (6, 1), (12, 2), (13, 1), (16, 1)],
  term ((60274769552251048971 : Rat) / 2771825814456705436) [(3, 1), (6, 1), (13, 2), (15, 1), (16, 1)],
  term ((-60274769552251048971 : Rat) / 5543651628913410872) [(3, 1), (6, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 200 for generator 29. -/
theorem ep_Q2_008_partial_29_0200_valid :
    mulPoly ep_Q2_008_coefficient_29_0200
        ep_Q2_008_generator_29_0200_0299 =
      ep_Q2_008_partial_29_0200 := by
  native_decide

/-- Coefficient term 201 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0201 : Poly :=
[
  term ((-25798364415801394076095445280888861638400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 201 for generator 29. -/
def ep_Q2_008_partial_29_0201 : Poly :=
[
  term ((-51596728831602788152190890561777723276800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((25798364415801394076095445280888861638400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((-51596728831602788152190890561777723276800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (13, 3), (15, 2), (16, 1)],
  term ((25798364415801394076095445280888861638400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (13, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 201 for generator 29. -/
theorem ep_Q2_008_partial_29_0201_valid :
    mulPoly ep_Q2_008_coefficient_29_0201
        ep_Q2_008_generator_29_0200_0299 =
      ep_Q2_008_partial_29_0201 := by
  native_decide

/-- Coefficient term 202 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0202 : Poly :=
[
  term ((1124303593867496349791174379128316941012121 : Rat) / 1349660814810636123005926626071864437583984) [(3, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 202 for generator 29. -/
def ep_Q2_008_partial_29_0202 : Poly :=
[
  term ((1124303593867496349791174379128316941012121 : Rat) / 674830407405318061502963313035932218791992) [(3, 1), (6, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1124303593867496349791174379128316941012121 : Rat) / 1349660814810636123005926626071864437583984) [(3, 1), (6, 1), (12, 2), (15, 1), (16, 1)],
  term ((1124303593867496349791174379128316941012121 : Rat) / 674830407405318061502963313035932218791992) [(3, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1124303593867496349791174379128316941012121 : Rat) / 1349660814810636123005926626071864437583984) [(3, 1), (6, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 202 for generator 29. -/
theorem ep_Q2_008_partial_29_0202_valid :
    mulPoly ep_Q2_008_coefficient_29_0202
        ep_Q2_008_generator_29_0200_0299 =
      ep_Q2_008_partial_29_0202 := by
  native_decide

/-- Coefficient term 203 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0203 : Poly :=
[
  term ((771775544509452000 : Rat) / 692956453614176359) [(3, 1), (7, 1), (10, 1), (12, 1), (16, 1)]
]

/-- Partial product 203 for generator 29. -/
def ep_Q2_008_partial_29_0203 : Poly :=
[
  term ((1543551089018904000 : Rat) / 692956453614176359) [(3, 1), (7, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-771775544509452000 : Rat) / 692956453614176359) [(3, 1), (7, 1), (10, 1), (12, 1), (13, 2), (16, 1)],
  term ((1543551089018904000 : Rat) / 692956453614176359) [(3, 1), (7, 1), (10, 1), (12, 2), (14, 1), (16, 1)],
  term ((-771775544509452000 : Rat) / 692956453614176359) [(3, 1), (7, 1), (10, 1), (12, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 203 for generator 29. -/
theorem ep_Q2_008_partial_29_0203_valid :
    mulPoly ep_Q2_008_coefficient_29_0203
        ep_Q2_008_generator_29_0200_0299 =
      ep_Q2_008_partial_29_0203 := by
  native_decide

/-- Coefficient term 204 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0204 : Poly :=
[
  term ((3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 204 for generator 29. -/
def ep_Q2_008_partial_29_0204 : Poly :=
[
  term ((7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (12, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 204 for generator 29. -/
theorem ep_Q2_008_partial_29_0204_valid :
    mulPoly ep_Q2_008_coefficient_29_0204
        ep_Q2_008_generator_29_0200_0299 =
      ep_Q2_008_partial_29_0204 := by
  native_decide

/-- Coefficient term 205 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0205 : Poly :=
[
  term ((3973349349631856073 : Rat) / 1385912907228352718) [(3, 1), (7, 1), (12, 1), (16, 1)]
]

/-- Partial product 205 for generator 29. -/
def ep_Q2_008_partial_29_0205 : Poly :=
[
  term ((3973349349631856073 : Rat) / 692956453614176359) [(3, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3973349349631856073 : Rat) / 1385912907228352718) [(3, 1), (7, 1), (12, 1), (13, 2), (16, 1)],
  term ((3973349349631856073 : Rat) / 692956453614176359) [(3, 1), (7, 1), (12, 2), (14, 1), (16, 1)],
  term ((-3973349349631856073 : Rat) / 1385912907228352718) [(3, 1), (7, 1), (12, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 205 for generator 29. -/
theorem ep_Q2_008_partial_29_0205_valid :
    mulPoly ep_Q2_008_coefficient_29_0205
        ep_Q2_008_generator_29_0200_0299 =
      ep_Q2_008_partial_29_0205 := by
  native_decide

/-- Coefficient term 206 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0206 : Poly :=
[
  term ((-88931056064289798911615085339387275979006 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 206 for generator 29. -/
def ep_Q2_008_partial_29_0206 : Poly :=
[
  term ((-177862112128579597823230170678774551958012 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((88931056064289798911615085339387275979006 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-177862112128579597823230170678774551958012 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((88931056064289798911615085339387275979006 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 206 for generator 29. -/
theorem ep_Q2_008_partial_29_0206_valid :
    mulPoly ep_Q2_008_coefficient_29_0206
        ep_Q2_008_generator_29_0200_0299 =
      ep_Q2_008_partial_29_0206 := by
  native_decide

/-- Coefficient term 207 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0207 : Poly :=
[
  term ((-14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 207 for generator 29. -/
def ep_Q2_008_partial_29_0207 : Poly :=
[
  term ((-29493883540250111402450771946087168000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (12, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (12, 2), (13, 2), (15, 2), (16, 1)],
  term ((-29493883540250111402450771946087168000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (13, 3), (15, 3), (16, 1)],
  term ((14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (13, 4), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 207 for generator 29. -/
theorem ep_Q2_008_partial_29_0207_valid :
    mulPoly ep_Q2_008_coefficient_29_0207
        ep_Q2_008_generator_29_0200_0299 =
      ep_Q2_008_partial_29_0207 := by
  native_decide

/-- Coefficient term 208 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0208 : Poly :=
[
  term ((14232620425310883297 : Rat) / 5543651628913410872) [(3, 1), (7, 1), (13, 2), (16, 1)]
]

/-- Partial product 208 for generator 29. -/
def ep_Q2_008_partial_29_0208 : Poly :=
[
  term ((14232620425310883297 : Rat) / 2771825814456705436) [(3, 1), (7, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-14232620425310883297 : Rat) / 5543651628913410872) [(3, 1), (7, 1), (12, 2), (13, 2), (16, 1)],
  term ((14232620425310883297 : Rat) / 2771825814456705436) [(3, 1), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((-14232620425310883297 : Rat) / 5543651628913410872) [(3, 1), (7, 1), (13, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 208 for generator 29. -/
theorem ep_Q2_008_partial_29_0208_valid :
    mulPoly ep_Q2_008_coefficient_29_0208
        ep_Q2_008_generator_29_0200_0299 =
      ep_Q2_008_partial_29_0208 := by
  native_decide

/-- Coefficient term 209 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0209 : Poly :=
[
  term ((35945670564679823271736878309293736000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 209 for generator 29. -/
def ep_Q2_008_partial_29_0209 : Poly :=
[
  term ((71891341129359646543473756618587472000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-35945670564679823271736878309293736000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (12, 2), (13, 3), (15, 1), (16, 1)],
  term ((71891341129359646543473756618587472000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (13, 4), (15, 2), (16, 1)],
  term ((-35945670564679823271736878309293736000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (13, 5), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 209 for generator 29. -/
theorem ep_Q2_008_partial_29_0209_valid :
    mulPoly ep_Q2_008_coefficient_29_0209
        ep_Q2_008_generator_29_0200_0299 =
      ep_Q2_008_partial_29_0209 := by
  native_decide

/-- Coefficient term 210 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0210 : Poly :=
[
  term ((143787214753131529420840237722386400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (15, 2), (16, 1)]
]

/-- Partial product 210 for generator 29. -/
def ep_Q2_008_partial_29_0210 : Poly :=
[
  term ((287574429506263058841680475444772800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-143787214753131529420840237722386400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (12, 2), (15, 2), (16, 1)],
  term ((287574429506263058841680475444772800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (13, 1), (15, 3), (16, 1)],
  term ((-143787214753131529420840237722386400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 210 for generator 29. -/
theorem ep_Q2_008_partial_29_0210_valid :
    mulPoly ep_Q2_008_coefficient_29_0210
        ep_Q2_008_generator_29_0200_0299 =
      ep_Q2_008_partial_29_0210 := by
  native_decide

/-- Coefficient term 211 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0211 : Poly :=
[
  term ((-50309899402336370385 : Rat) / 22174606515653643488) [(3, 1), (7, 1), (16, 1)]
]

/-- Partial product 211 for generator 29. -/
def ep_Q2_008_partial_29_0211 : Poly :=
[
  term ((-50309899402336370385 : Rat) / 11087303257826821744) [(3, 1), (7, 1), (12, 1), (14, 1), (16, 1)],
  term ((50309899402336370385 : Rat) / 22174606515653643488) [(3, 1), (7, 1), (12, 2), (16, 1)],
  term ((-50309899402336370385 : Rat) / 11087303257826821744) [(3, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((50309899402336370385 : Rat) / 22174606515653643488) [(3, 1), (7, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 211 for generator 29. -/
theorem ep_Q2_008_partial_29_0211_valid :
    mulPoly ep_Q2_008_coefficient_29_0211
        ep_Q2_008_generator_29_0200_0299 =
      ep_Q2_008_partial_29_0211 := by
  native_decide

/-- Coefficient term 212 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0212 : Poly :=
[
  term ((533171678089695754086781906663843200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 212 for generator 29. -/
def ep_Q2_008_partial_29_0212 : Poly :=
[
  term ((1066343356179391508173563813327686400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-533171678089695754086781906663843200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((1066343356179391508173563813327686400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-533171678089695754086781906663843200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 212 for generator 29. -/
theorem ep_Q2_008_partial_29_0212_valid :
    mulPoly ep_Q2_008_coefficient_29_0212
        ep_Q2_008_generator_29_0200_0299 =
      ep_Q2_008_partial_29_0212 := by
  native_decide

/-- Coefficient term 213 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0213 : Poly :=
[
  term ((-406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 213 for generator 29. -/
def ep_Q2_008_partial_29_0213 : Poly :=
[
  term ((-812294800564430025004231306094284800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-812294800564430025004231306094284800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (13, 2), (15, 3), (16, 1)],
  term ((406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 213 for generator 29. -/
theorem ep_Q2_008_partial_29_0213_valid :
    mulPoly ep_Q2_008_coefficient_29_0213
        ep_Q2_008_generator_29_0200_0299 =
      ep_Q2_008_partial_29_0213 := by
  native_decide

/-- Coefficient term 214 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0214 : Poly :=
[
  term ((989984288187899092973906904302409600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 214 for generator 29. -/
def ep_Q2_008_partial_29_0214 : Poly :=
[
  term ((1979968576375798185947813808604819200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-989984288187899092973906904302409600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((1979968576375798185947813808604819200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (13, 3), (15, 2), (16, 1)],
  term ((-989984288187899092973906904302409600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (13, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 214 for generator 29. -/
theorem ep_Q2_008_partial_29_0214_valid :
    mulPoly ep_Q2_008_coefficient_29_0214
        ep_Q2_008_generator_29_0200_0299 =
      ep_Q2_008_partial_29_0214 := by
  native_decide

/-- Coefficient term 215 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0215 : Poly :=
[
  term ((-112458590937662839869507344829489600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (15, 1), (16, 1)]
]

/-- Partial product 215 for generator 29. -/
def ep_Q2_008_partial_29_0215 : Poly :=
[
  term ((-224917181875325679739014689658979200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((112458590937662839869507344829489600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (12, 2), (15, 1), (16, 1)],
  term ((-224917181875325679739014689658979200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (13, 1), (15, 2), (16, 1)],
  term ((112458590937662839869507344829489600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 215 for generator 29. -/
theorem ep_Q2_008_partial_29_0215_valid :
    mulPoly ep_Q2_008_coefficient_29_0215
        ep_Q2_008_generator_29_0200_0299 =
      ep_Q2_008_partial_29_0215 := by
  native_decide

/-- Coefficient term 216 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0216 : Poly :=
[
  term ((13028997973513095980349046781285836800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 216 for generator 29. -/
def ep_Q2_008_partial_29_0216 : Poly :=
[
  term ((26057995947026191960698093562571673600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-13028997973513095980349046781285836800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (9, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((26057995947026191960698093562571673600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (9, 1), (13, 2), (15, 2), (16, 1)],
  term ((-13028997973513095980349046781285836800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (9, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 216 for generator 29. -/
theorem ep_Q2_008_partial_29_0216_valid :
    mulPoly ep_Q2_008_coefficient_29_0216
        ep_Q2_008_generator_29_0200_0299 =
      ep_Q2_008_partial_29_0216 := by
  native_decide

/-- Coefficient term 217 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0217 : Poly :=
[
  term ((-23441595644070900 : Rat) / 692956453614176359) [(3, 1), (9, 1), (16, 1)]
]

/-- Partial product 217 for generator 29. -/
def ep_Q2_008_partial_29_0217 : Poly :=
[
  term ((-46883191288141800 : Rat) / 692956453614176359) [(3, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((23441595644070900 : Rat) / 692956453614176359) [(3, 1), (9, 1), (12, 2), (16, 1)],
  term ((-46883191288141800 : Rat) / 692956453614176359) [(3, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((23441595644070900 : Rat) / 692956453614176359) [(3, 1), (9, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 217 for generator 29. -/
theorem ep_Q2_008_partial_29_0217_valid :
    mulPoly ep_Q2_008_coefficient_29_0217
        ep_Q2_008_generator_29_0200_0299 =
      ep_Q2_008_partial_29_0217 := by
  native_decide

/-- Coefficient term 218 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0218 : Poly :=
[
  term ((-114003732268239589828054159336251072000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (10, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 218 for generator 29. -/
def ep_Q2_008_partial_29_0218 : Poly :=
[
  term ((-228007464536479179656108318672502144000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((114003732268239589828054159336251072000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (10, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-228007464536479179656108318672502144000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (10, 1), (13, 2), (15, 3), (16, 1)],
  term ((114003732268239589828054159336251072000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (10, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 218 for generator 29. -/
theorem ep_Q2_008_partial_29_0218_valid :
    mulPoly ep_Q2_008_coefficient_29_0218
        ep_Q2_008_generator_29_0200_0299 =
      ep_Q2_008_partial_29_0218 := by
  native_decide

/-- Coefficient term 219 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0219 : Poly :=
[
  term ((7995147920162337375 : Rat) / 692956453614176359) [(3, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 219 for generator 29. -/
def ep_Q2_008_partial_29_0219 : Poly :=
[
  term ((15990295840324674750 : Rat) / 692956453614176359) [(3, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-7995147920162337375 : Rat) / 692956453614176359) [(3, 1), (10, 1), (12, 2), (13, 1), (16, 1)],
  term ((15990295840324674750 : Rat) / 692956453614176359) [(3, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-7995147920162337375 : Rat) / 692956453614176359) [(3, 1), (10, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 219 for generator 29. -/
theorem ep_Q2_008_partial_29_0219_valid :
    mulPoly ep_Q2_008_coefficient_29_0219
        ep_Q2_008_generator_29_0200_0299 =
      ep_Q2_008_partial_29_0219 := by
  native_decide

/-- Coefficient term 220 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0220 : Poly :=
[
  term ((912661188914932799415581901754140595200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 220 for generator 29. -/
def ep_Q2_008_partial_29_0220 : Poly :=
[
  term ((1825322377829865598831163803508281190400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (10, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-912661188914932799415581901754140595200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (10, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((1825322377829865598831163803508281190400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (10, 1), (13, 3), (15, 2), (16, 1)],
  term ((-912661188914932799415581901754140595200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (10, 1), (13, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 220 for generator 29. -/
theorem ep_Q2_008_partial_29_0220_valid :
    mulPoly ep_Q2_008_coefficient_29_0220
        ep_Q2_008_generator_29_0200_0299 =
      ep_Q2_008_partial_29_0220 := by
  native_decide

/-- Coefficient term 221 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0221 : Poly :=
[
  term ((-583133257600358916882200864851637530975125 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 221 for generator 29. -/
def ep_Q2_008_partial_29_0221 : Poly :=
[
  term ((-1166266515200717833764401729703275061950250 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((583133257600358916882200864851637530975125 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1166266515200717833764401729703275061950250 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((583133257600358916882200864851637530975125 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 221 for generator 29. -/
theorem ep_Q2_008_partial_29_0221_valid :
    mulPoly ep_Q2_008_coefficient_29_0221
        ep_Q2_008_generator_29_0200_0299 =
      ep_Q2_008_partial_29_0221 := by
  native_decide

/-- Coefficient term 222 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0222 : Poly :=
[
  term ((197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 222 for generator 29. -/
def ep_Q2_008_partial_29_0222 : Poly :=
[
  term ((394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 1), (12, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 222 for generator 29. -/
theorem ep_Q2_008_partial_29_0222_valid :
    mulPoly ep_Q2_008_coefficient_29_0222
        ep_Q2_008_generator_29_0200_0299 =
      ep_Q2_008_partial_29_0222 := by
  native_decide

/-- Coefficient term 223 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0223 : Poly :=
[
  term ((18823217024784506625 : Rat) / 5543651628913410872) [(3, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 223 for generator 29. -/
def ep_Q2_008_partial_29_0223 : Poly :=
[
  term ((18823217024784506625 : Rat) / 2771825814456705436) [(3, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-18823217024784506625 : Rat) / 5543651628913410872) [(3, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((18823217024784506625 : Rat) / 2771825814456705436) [(3, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((-18823217024784506625 : Rat) / 5543651628913410872) [(3, 1), (11, 1), (12, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 223 for generator 29. -/
theorem ep_Q2_008_partial_29_0223_valid :
    mulPoly ep_Q2_008_coefficient_29_0223
        ep_Q2_008_generator_29_0200_0299 =
      ep_Q2_008_partial_29_0223 := by
  native_decide

/-- Coefficient term 224 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0224 : Poly :=
[
  term ((-1161063583833742934626115427040737644325600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 224 for generator 29. -/
def ep_Q2_008_partial_29_0224 : Poly :=
[
  term ((-2322127167667485869252230854081475288651200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1161063583833742934626115427040737644325600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-2322127167667485869252230854081475288651200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((1161063583833742934626115427040737644325600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 224 for generator 29. -/
theorem ep_Q2_008_partial_29_0224_valid :
    mulPoly ep_Q2_008_coefficient_29_0224
        ep_Q2_008_generator_29_0200_0299 =
      ep_Q2_008_partial_29_0224 := by
  native_decide

/-- Coefficient term 225 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0225 : Poly :=
[
  term ((-788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 225 for generator 29. -/
def ep_Q2_008_partial_29_0225 : Poly :=
[
  term ((-1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 1), (12, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 1), (12, 2), (13, 2), (15, 2), (16, 1)],
  term ((-1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 1), (13, 3), (15, 3), (16, 1)],
  term ((788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 1), (13, 4), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 225 for generator 29. -/
theorem ep_Q2_008_partial_29_0225_valid :
    mulPoly ep_Q2_008_coefficient_29_0225
        ep_Q2_008_generator_29_0200_0299 =
      ep_Q2_008_partial_29_0225 := by
  native_decide

/-- Coefficient term 226 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0226 : Poly :=
[
  term ((23227199354478717000 : Rat) / 692956453614176359) [(3, 1), (11, 1), (13, 2), (16, 1)]
]

/-- Partial product 226 for generator 29. -/
def ep_Q2_008_partial_29_0226 : Poly :=
[
  term ((46454398708957434000 : Rat) / 692956453614176359) [(3, 1), (11, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-23227199354478717000 : Rat) / 692956453614176359) [(3, 1), (11, 1), (12, 2), (13, 2), (16, 1)],
  term ((46454398708957434000 : Rat) / 692956453614176359) [(3, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((-23227199354478717000 : Rat) / 692956453614176359) [(3, 1), (11, 1), (13, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 226 for generator 29. -/
theorem ep_Q2_008_partial_29_0226_valid :
    mulPoly ep_Q2_008_coefficient_29_0226
        ep_Q2_008_generator_29_0200_0299 =
      ep_Q2_008_partial_29_0226 := by
  native_decide

/-- Coefficient term 227 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0227 : Poly :=
[
  term ((1922859322391568286225471663465380921600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 227 for generator 29. -/
def ep_Q2_008_partial_29_0227 : Poly :=
[
  term ((3845718644783136572450943326930761843200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 1), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-1922859322391568286225471663465380921600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 1), (12, 2), (13, 3), (15, 1), (16, 1)],
  term ((3845718644783136572450943326930761843200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 1), (13, 4), (15, 2), (16, 1)],
  term ((-1922859322391568286225471663465380921600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 1), (13, 5), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 227 for generator 29. -/
theorem ep_Q2_008_partial_29_0227_valid :
    mulPoly ep_Q2_008_coefficient_29_0227
        ep_Q2_008_generator_29_0200_0299 =
      ep_Q2_008_partial_29_0227 := by
  native_decide

/-- Coefficient term 228 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0228 : Poly :=
[
  term ((-1227211265323436591265071806731460608000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 228 for generator 29. -/
def ep_Q2_008_partial_29_0228 : Poly :=
[
  term ((-2454422530646873182530143613462921216000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((1227211265323436591265071806731460608000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((-2454422530646873182530143613462921216000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((1227211265323436591265071806731460608000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (11, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 228 for generator 29. -/
theorem ep_Q2_008_partial_29_0228_valid :
    mulPoly ep_Q2_008_coefficient_29_0228
        ep_Q2_008_generator_29_0200_0299 =
      ep_Q2_008_partial_29_0228 := by
  native_decide

/-- Coefficient term 229 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0229 : Poly :=
[
  term ((-31366816329996631125 : Rat) / 11087303257826821744) [(3, 1), (11, 1), (16, 1)]
]

/-- Partial product 229 for generator 29. -/
def ep_Q2_008_partial_29_0229 : Poly :=
[
  term ((-31366816329996631125 : Rat) / 5543651628913410872) [(3, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((31366816329996631125 : Rat) / 11087303257826821744) [(3, 1), (11, 1), (12, 2), (16, 1)],
  term ((-31366816329996631125 : Rat) / 5543651628913410872) [(3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((31366816329996631125 : Rat) / 11087303257826821744) [(3, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 229 for generator 29. -/
theorem ep_Q2_008_partial_29_0229_valid :
    mulPoly ep_Q2_008_coefficient_29_0229
        ep_Q2_008_generator_29_0200_0299 =
      ep_Q2_008_partial_29_0229 := by
  native_decide

/-- Coefficient term 230 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0230 : Poly :=
[
  term ((-114003732268239589828054159336251072000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 230 for generator 29. -/
def ep_Q2_008_partial_29_0230 : Poly :=
[
  term ((-228007464536479179656108318672502144000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (12, 1), (13, 2), (15, 3), (16, 1)],
  term ((114003732268239589828054159336251072000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((-228007464536479179656108318672502144000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (12, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((114003732268239589828054159336251072000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (12, 3), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 230 for generator 29. -/
theorem ep_Q2_008_partial_29_0230_valid :
    mulPoly ep_Q2_008_coefficient_29_0230
        ep_Q2_008_generator_29_0200_0299 =
      ep_Q2_008_partial_29_0230 := by
  native_decide

/-- Coefficient term 231 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0231 : Poly :=
[
  term ((-590855012505316125 : Rat) / 692956453614176359) [(3, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 231 for generator 29. -/
def ep_Q2_008_partial_29_0231 : Poly :=
[
  term ((-1181710025010632250 : Rat) / 692956453614176359) [(3, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((590855012505316125 : Rat) / 692956453614176359) [(3, 1), (12, 1), (13, 3), (16, 1)],
  term ((-1181710025010632250 : Rat) / 692956453614176359) [(3, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((590855012505316125 : Rat) / 692956453614176359) [(3, 1), (12, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 231 for generator 29. -/
theorem ep_Q2_008_partial_29_0231_valid :
    mulPoly ep_Q2_008_coefficient_29_0231
        ep_Q2_008_generator_29_0200_0299 =
      ep_Q2_008_partial_29_0231 := by
  native_decide

/-- Coefficient term 232 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0232 : Poly :=
[
  term ((912661188914932799415581901754140595200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 232 for generator 29. -/
def ep_Q2_008_partial_29_0232 : Poly :=
[
  term ((1825322377829865598831163803508281190400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((-912661188914932799415581901754140595200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (12, 1), (13, 4), (15, 1), (16, 1)],
  term ((1825322377829865598831163803508281190400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (12, 2), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-912661188914932799415581901754140595200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (12, 3), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 232 for generator 29. -/
theorem ep_Q2_008_partial_29_0232_valid :
    mulPoly ep_Q2_008_coefficient_29_0232
        ep_Q2_008_generator_29_0200_0299 =
      ep_Q2_008_partial_29_0232 := by
  native_decide

/-- Coefficient term 233 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0233 : Poly :=
[
  term ((105114090116402977290993102433461038947575 : Rat) / 168707601851329515375740828258983054697998) [(3, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 233 for generator 29. -/
def ep_Q2_008_partial_29_0233 : Poly :=
[
  term ((105114090116402977290993102433461038947575 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-105114090116402977290993102433461038947575 : Rat) / 168707601851329515375740828258983054697998) [(3, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((105114090116402977290993102433461038947575 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-105114090116402977290993102433461038947575 : Rat) / 168707601851329515375740828258983054697998) [(3, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 233 for generator 29. -/
theorem ep_Q2_008_partial_29_0233_valid :
    mulPoly ep_Q2_008_coefficient_29_0233
        ep_Q2_008_generator_29_0200_0299 =
      ep_Q2_008_partial_29_0233 := by
  native_decide

/-- Coefficient term 234 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0234 : Poly :=
[
  term ((-6318415626114491847455364625209346584000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 234 for generator 29. -/
def ep_Q2_008_partial_29_0234 : Poly :=
[
  term ((-12636831252228983694910729250418693168000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((6318415626114491847455364625209346584000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-12636831252228983694910729250418693168000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (13, 2), (15, 3), (16, 1)],
  term ((6318415626114491847455364625209346584000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 234 for generator 29. -/
theorem ep_Q2_008_partial_29_0234_valid :
    mulPoly ep_Q2_008_coefficient_29_0234
        ep_Q2_008_generator_29_0200_0299 =
      ep_Q2_008_partial_29_0234 := by
  native_decide

/-- Coefficient term 235 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0235 : Poly :=
[
  term ((-236639440070486743461 : Rat) / 22174606515653643488) [(3, 1), (13, 1), (16, 1)]
]

/-- Partial product 235 for generator 29. -/
def ep_Q2_008_partial_29_0235 : Poly :=
[
  term ((-236639440070486743461 : Rat) / 11087303257826821744) [(3, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((236639440070486743461 : Rat) / 22174606515653643488) [(3, 1), (12, 2), (13, 1), (16, 1)],
  term ((-236639440070486743461 : Rat) / 11087303257826821744) [(3, 1), (13, 2), (15, 1), (16, 1)],
  term ((236639440070486743461 : Rat) / 22174606515653643488) [(3, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 235 for generator 29. -/
theorem ep_Q2_008_partial_29_0235_valid :
    mulPoly ep_Q2_008_coefficient_29_0235
        ep_Q2_008_generator_29_0200_0299 =
      ep_Q2_008_partial_29_0235 := by
  native_decide

/-- Coefficient term 236 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0236 : Poly :=
[
  term ((33086867600618918389653418946951942889600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 236 for generator 29. -/
def ep_Q2_008_partial_29_0236 : Poly :=
[
  term ((66173735201237836779306837893903885779200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-33086867600618918389653418946951942889600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((66173735201237836779306837893903885779200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (13, 3), (15, 2), (16, 1)],
  term ((-33086867600618918389653418946951942889600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (13, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 236 for generator 29. -/
theorem ep_Q2_008_partial_29_0236_valid :
    mulPoly ep_Q2_008_coefficient_29_0236
        ep_Q2_008_generator_29_0200_0299 =
      ep_Q2_008_partial_29_0236 := by
  native_decide

/-- Coefficient term 237 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0237 : Poly :=
[
  term ((286771065261668748064689298372976694291561 : Rat) / 1349660814810636123005926626071864437583984) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 237 for generator 29. -/
def ep_Q2_008_partial_29_0237 : Poly :=
[
  term ((286771065261668748064689298372976694291561 : Rat) / 674830407405318061502963313035932218791992) [(3, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-286771065261668748064689298372976694291561 : Rat) / 1349660814810636123005926626071864437583984) [(3, 1), (12, 2), (15, 1), (16, 1)],
  term ((286771065261668748064689298372976694291561 : Rat) / 674830407405318061502963313035932218791992) [(3, 1), (13, 1), (15, 2), (16, 1)],
  term ((-286771065261668748064689298372976694291561 : Rat) / 1349660814810636123005926626071864437583984) [(3, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 237 for generator 29. -/
theorem ep_Q2_008_partial_29_0237_valid :
    mulPoly ep_Q2_008_coefficient_29_0237
        ep_Q2_008_generator_29_0200_0299 =
      ep_Q2_008_partial_29_0237 := by
  native_decide

/-- Coefficient term 238 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0238 : Poly :=
[
  term ((-431634828019142000961252993402057600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 238 for generator 29. -/
def ep_Q2_008_partial_29_0238 : Poly :=
[
  term ((-863269656038284001922505986804115200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((431634828019142000961252993402057600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((-863269656038284001922505986804115200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((431634828019142000961252993402057600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 238 for generator 29. -/
theorem ep_Q2_008_partial_29_0238_valid :
    mulPoly ep_Q2_008_coefficient_29_0238
        ep_Q2_008_generator_29_0200_0299 =
      ep_Q2_008_partial_29_0238 := by
  native_decide

/-- Coefficient term 239 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0239 : Poly :=
[
  term ((-771775544509452000 : Rat) / 692956453614176359) [(3, 2), (10, 1), (16, 1)]
]

/-- Partial product 239 for generator 29. -/
def ep_Q2_008_partial_29_0239 : Poly :=
[
  term ((-1543551089018904000 : Rat) / 692956453614176359) [(3, 2), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((771775544509452000 : Rat) / 692956453614176359) [(3, 2), (10, 1), (12, 2), (16, 1)],
  term ((-1543551089018904000 : Rat) / 692956453614176359) [(3, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((771775544509452000 : Rat) / 692956453614176359) [(3, 2), (10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 239 for generator 29. -/
theorem ep_Q2_008_partial_29_0239_valid :
    mulPoly ep_Q2_008_coefficient_29_0239
        ep_Q2_008_generator_29_0200_0299 =
      ep_Q2_008_partial_29_0239 := by
  native_decide

/-- Coefficient term 240 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0240 : Poly :=
[
  term ((-1804205182183737225 : Rat) / 692956453614176359) [(3, 2), (16, 1)]
]

/-- Partial product 240 for generator 29. -/
def ep_Q2_008_partial_29_0240 : Poly :=
[
  term ((-3608410364367474450 : Rat) / 692956453614176359) [(3, 2), (12, 1), (14, 1), (16, 1)],
  term ((1804205182183737225 : Rat) / 692956453614176359) [(3, 2), (12, 2), (16, 1)],
  term ((-3608410364367474450 : Rat) / 692956453614176359) [(3, 2), (13, 1), (15, 1), (16, 1)],
  term ((1804205182183737225 : Rat) / 692956453614176359) [(3, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 240 for generator 29. -/
theorem ep_Q2_008_partial_29_0240_valid :
    mulPoly ep_Q2_008_coefficient_29_0240
        ep_Q2_008_generator_29_0200_0299 =
      ep_Q2_008_partial_29_0240 := by
  native_decide

/-- Coefficient term 241 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0241 : Poly :=
[
  term ((32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 241 for generator 29. -/
def ep_Q2_008_partial_29_0241 : Poly :=
[
  term ((64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (11, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 241 for generator 29. -/
theorem ep_Q2_008_partial_29_0241_valid :
    mulPoly ep_Q2_008_coefficient_29_0241
        ep_Q2_008_generator_29_0200_0299 =
      ep_Q2_008_partial_29_0241 := by
  native_decide

/-- Coefficient term 242 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0242 : Poly :=
[
  term ((64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 242 for generator 29. -/
def ep_Q2_008_partial_29_0242 : Poly :=
[
  term ((129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (11, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (11, 1), (13, 2), (15, 3), (16, 1)],
  term ((-64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (11, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 242 for generator 29. -/
theorem ep_Q2_008_partial_29_0242_valid :
    mulPoly ep_Q2_008_coefficient_29_0242
        ep_Q2_008_generator_29_0200_0299 =
      ep_Q2_008_partial_29_0242 := by
  native_decide

/-- Coefficient term 243 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0243 : Poly :=
[
  term ((-32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 243 for generator 29. -/
def ep_Q2_008_partial_29_0243 : Poly :=
[
  term ((-64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (12, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 243 for generator 29. -/
theorem ep_Q2_008_partial_29_0243_valid :
    mulPoly ep_Q2_008_coefficient_29_0243
        ep_Q2_008_generator_29_0200_0299 =
      ep_Q2_008_partial_29_0243 := by
  native_decide

/-- Coefficient term 244 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0244 : Poly :=
[
  term ((1080111368908838114493245714940307200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 244 for generator 29. -/
def ep_Q2_008_partial_29_0244 : Poly :=
[
  term ((2160222737817676228986491429880614400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1080111368908838114493245714940307200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((2160222737817676228986491429880614400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((-1080111368908838114493245714940307200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 244 for generator 29. -/
theorem ep_Q2_008_partial_29_0244_valid :
    mulPoly ep_Q2_008_coefficient_29_0244
        ep_Q2_008_generator_29_0200_0299 =
      ep_Q2_008_partial_29_0244 := by
  native_decide

/-- Coefficient term 245 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0245 : Poly :=
[
  term ((2968882567615857312948042703280563200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 245 for generator 29. -/
def ep_Q2_008_partial_29_0245 : Poly :=
[
  term ((5937765135231714625896085406561126400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (12, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-2968882567615857312948042703280563200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (12, 2), (13, 2), (15, 2), (16, 1)],
  term ((5937765135231714625896085406561126400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (13, 3), (15, 3), (16, 1)],
  term ((-2968882567615857312948042703280563200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (13, 4), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 245 for generator 29. -/
theorem ep_Q2_008_partial_29_0245_valid :
    mulPoly ep_Q2_008_coefficient_29_0245
        ep_Q2_008_generator_29_0200_0299 =
      ep_Q2_008_partial_29_0245 := by
  native_decide

/-- Coefficient term 246 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0246 : Poly :=
[
  term ((129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 246 for generator 29. -/
def ep_Q2_008_partial_29_0246 : Poly :=
[
  term ((258163701531813679386786322024396800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (12, 2), (13, 3), (15, 1), (16, 1)],
  term ((258163701531813679386786322024396800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (13, 4), (15, 2), (16, 1)],
  term ((-129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (13, 5), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 246 for generator 29. -/
theorem ep_Q2_008_partial_29_0246_valid :
    mulPoly ep_Q2_008_coefficient_29_0246
        ep_Q2_008_generator_29_0200_0299 =
      ep_Q2_008_partial_29_0246 := by
  native_decide

/-- Coefficient term 247 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0247 : Poly :=
[
  term ((-13287837578843351144908119515961600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (15, 2), (16, 1)]
]

/-- Partial product 247 for generator 29. -/
def ep_Q2_008_partial_29_0247 : Poly :=
[
  term ((-26575675157686702289816239031923200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((13287837578843351144908119515961600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (12, 2), (15, 2), (16, 1)],
  term ((-26575675157686702289816239031923200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (13, 1), (15, 3), (16, 1)],
  term ((13287837578843351144908119515961600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 247 for generator 29. -/
theorem ep_Q2_008_partial_29_0247_valid :
    mulPoly ep_Q2_008_coefficient_29_0247
        ep_Q2_008_generator_29_0200_0299 =
      ep_Q2_008_partial_29_0247 := by
  native_decide

/-- Coefficient term 248 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0248 : Poly :=
[
  term ((-43926043926967546635 : Rat) / 5543651628913410872) [(4, 1), (5, 1), (9, 1), (16, 1)]
]

/-- Partial product 248 for generator 29. -/
def ep_Q2_008_partial_29_0248 : Poly :=
[
  term ((-43926043926967546635 : Rat) / 2771825814456705436) [(4, 1), (5, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((43926043926967546635 : Rat) / 5543651628913410872) [(4, 1), (5, 1), (9, 1), (12, 2), (16, 1)],
  term ((-43926043926967546635 : Rat) / 2771825814456705436) [(4, 1), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((43926043926967546635 : Rat) / 5543651628913410872) [(4, 1), (5, 1), (9, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 248 for generator 29. -/
theorem ep_Q2_008_partial_29_0248_valid :
    mulPoly ep_Q2_008_coefficient_29_0248
        ep_Q2_008_generator_29_0200_0299 =
      ep_Q2_008_partial_29_0248 := by
  native_decide

/-- Coefficient term 249 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0249 : Poly :=
[
  term ((87013982558013166610924208563412000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 249 for generator 29. -/
def ep_Q2_008_partial_29_0249 : Poly :=
[
  term ((174027965116026333221848417126824000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-87013982558013166610924208563412000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((174027965116026333221848417126824000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-87013982558013166610924208563412000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 249 for generator 29. -/
theorem ep_Q2_008_partial_29_0249_valid :
    mulPoly ep_Q2_008_coefficient_29_0249
        ep_Q2_008_generator_29_0200_0299 =
      ep_Q2_008_partial_29_0249 := by
  native_decide

/-- Coefficient term 250 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0250 : Poly :=
[
  term ((5381986129252263987 : Rat) / 692956453614176359) [(4, 1), (5, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 250 for generator 29. -/
def ep_Q2_008_partial_29_0250 : Poly :=
[
  term ((10763972258504527974 : Rat) / 692956453614176359) [(4, 1), (5, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5381986129252263987 : Rat) / 692956453614176359) [(4, 1), (5, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((10763972258504527974 : Rat) / 692956453614176359) [(4, 1), (5, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((-5381986129252263987 : Rat) / 692956453614176359) [(4, 1), (5, 1), (11, 1), (12, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 250 for generator 29. -/
theorem ep_Q2_008_partial_29_0250_valid :
    mulPoly ep_Q2_008_coefficient_29_0250
        ep_Q2_008_generator_29_0200_0299 =
      ep_Q2_008_partial_29_0250 := by
  native_decide

/-- Coefficient term 251 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0251 : Poly :=
[
  term ((10763972258504527974 : Rat) / 692956453614176359) [(4, 1), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 251 for generator 29. -/
def ep_Q2_008_partial_29_0251 : Poly :=
[
  term ((21527944517009055948 : Rat) / 692956453614176359) [(4, 1), (5, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-10763972258504527974 : Rat) / 692956453614176359) [(4, 1), (5, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((21527944517009055948 : Rat) / 692956453614176359) [(4, 1), (5, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-10763972258504527974 : Rat) / 692956453614176359) [(4, 1), (5, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 251 for generator 29. -/
theorem ep_Q2_008_partial_29_0251_valid :
    mulPoly ep_Q2_008_coefficient_29_0251
        ep_Q2_008_generator_29_0200_0299 =
      ep_Q2_008_partial_29_0251 := by
  native_decide

/-- Coefficient term 252 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0252 : Poly :=
[
  term ((34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 252 for generator 29. -/
def ep_Q2_008_partial_29_0252 : Poly :=
[
  term ((69611186046410533288739366850729600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((69611186046410533288739366850729600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (11, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 252 for generator 29. -/
theorem ep_Q2_008_partial_29_0252_valid :
    mulPoly ep_Q2_008_coefficient_29_0252
        ep_Q2_008_generator_29_0200_0299 =
      ep_Q2_008_partial_29_0252 := by
  native_decide

/-- Coefficient term 253 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0253 : Poly :=
[
  term ((-5381986129252263987 : Rat) / 692956453614176359) [(4, 1), (5, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 253 for generator 29. -/
def ep_Q2_008_partial_29_0253 : Poly :=
[
  term ((-10763972258504527974 : Rat) / 692956453614176359) [(4, 1), (5, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((5381986129252263987 : Rat) / 692956453614176359) [(4, 1), (5, 1), (12, 1), (13, 3), (16, 1)],
  term ((-10763972258504527974 : Rat) / 692956453614176359) [(4, 1), (5, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((5381986129252263987 : Rat) / 692956453614176359) [(4, 1), (5, 1), (12, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 253 for generator 29. -/
theorem ep_Q2_008_partial_29_0253_valid :
    mulPoly ep_Q2_008_coefficient_29_0253
        ep_Q2_008_generator_29_0200_0299 =
      ep_Q2_008_partial_29_0253 := by
  native_decide

/-- Coefficient term 254 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0254 : Poly :=
[
  term ((17402796511602633322184841712682400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 254 for generator 29. -/
def ep_Q2_008_partial_29_0254 : Poly :=
[
  term ((34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-17402796511602633322184841712682400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-17402796511602633322184841712682400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 254 for generator 29. -/
theorem ep_Q2_008_partial_29_0254_valid :
    mulPoly ep_Q2_008_coefficient_29_0254
        ep_Q2_008_generator_29_0200_0299 =
      ep_Q2_008_partial_29_0254 := by
  native_decide

/-- Coefficient term 255 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0255 : Poly :=
[
  term ((-34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 255 for generator 29. -/
def ep_Q2_008_partial_29_0255 : Poly :=
[
  term ((-69611186046410533288739366850729600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-69611186046410533288739366850729600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (13, 2), (15, 3), (16, 1)],
  term ((34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 255 for generator 29. -/
theorem ep_Q2_008_partial_29_0255_valid :
    mulPoly ep_Q2_008_coefficient_29_0255
        ep_Q2_008_generator_29_0200_0299 =
      ep_Q2_008_partial_29_0255 := by
  native_decide

/-- Coefficient term 256 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0256 : Poly :=
[
  term ((702465771922904706351 : Rat) / 2771825814456705436) [(4, 1), (5, 1), (13, 1), (16, 1)]
]

/-- Partial product 256 for generator 29. -/
def ep_Q2_008_partial_29_0256 : Poly :=
[
  term ((702465771922904706351 : Rat) / 1385912907228352718) [(4, 1), (5, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-702465771922904706351 : Rat) / 2771825814456705436) [(4, 1), (5, 1), (12, 2), (13, 1), (16, 1)],
  term ((702465771922904706351 : Rat) / 1385912907228352718) [(4, 1), (5, 1), (13, 2), (15, 1), (16, 1)],
  term ((-702465771922904706351 : Rat) / 2771825814456705436) [(4, 1), (5, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 256 for generator 29. -/
theorem ep_Q2_008_partial_29_0256_valid :
    mulPoly ep_Q2_008_coefficient_29_0256
        ep_Q2_008_generator_29_0200_0299 =
      ep_Q2_008_partial_29_0256 := by
  native_decide

/-- Coefficient term 257 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0257 : Poly :=
[
  term ((495142723891208286804 : Rat) / 692956453614176359) [(4, 1), (5, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 257 for generator 29. -/
def ep_Q2_008_partial_29_0257 : Poly :=
[
  term ((990285447782416573608 : Rat) / 692956453614176359) [(4, 1), (5, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-495142723891208286804 : Rat) / 692956453614176359) [(4, 1), (5, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((990285447782416573608 : Rat) / 692956453614176359) [(4, 1), (5, 1), (13, 3), (15, 2), (16, 1)],
  term ((-495142723891208286804 : Rat) / 692956453614176359) [(4, 1), (5, 1), (13, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 257 for generator 29. -/
theorem ep_Q2_008_partial_29_0257_valid :
    mulPoly ep_Q2_008_coefficient_29_0257
        ep_Q2_008_generator_29_0200_0299 =
      ep_Q2_008_partial_29_0257 := by
  native_decide

/-- Coefficient term 258 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0258 : Poly :=
[
  term ((21527944517009055948 : Rat) / 692956453614176359) [(4, 1), (5, 1), (13, 3), (16, 1)]
]

/-- Partial product 258 for generator 29. -/
def ep_Q2_008_partial_29_0258 : Poly :=
[
  term ((43055889034018111896 : Rat) / 692956453614176359) [(4, 1), (5, 1), (12, 1), (13, 3), (14, 1), (16, 1)],
  term ((-21527944517009055948 : Rat) / 692956453614176359) [(4, 1), (5, 1), (12, 2), (13, 3), (16, 1)],
  term ((43055889034018111896 : Rat) / 692956453614176359) [(4, 1), (5, 1), (13, 4), (15, 1), (16, 1)],
  term ((-21527944517009055948 : Rat) / 692956453614176359) [(4, 1), (5, 1), (13, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 258 for generator 29. -/
theorem ep_Q2_008_partial_29_0258_valid :
    mulPoly ep_Q2_008_coefficient_29_0258
        ep_Q2_008_generator_29_0200_0299 =
      ep_Q2_008_partial_29_0258 := by
  native_decide

/-- Coefficient term 259 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0259 : Poly :=
[
  term ((-4988997983081466257630620218475103992318971 : Rat) / 674830407405318061502963313035932218791992) [(4, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 259 for generator 29. -/
def ep_Q2_008_partial_29_0259 : Poly :=
[
  term ((-4988997983081466257630620218475103992318971 : Rat) / 337415203702659030751481656517966109395996) [(4, 1), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((4988997983081466257630620218475103992318971 : Rat) / 674830407405318061502963313035932218791992) [(4, 1), (5, 1), (12, 2), (15, 1), (16, 1)],
  term ((-4988997983081466257630620218475103992318971 : Rat) / 337415203702659030751481656517966109395996) [(4, 1), (5, 1), (13, 1), (15, 2), (16, 1)],
  term ((4988997983081466257630620218475103992318971 : Rat) / 674830407405318061502963313035932218791992) [(4, 1), (5, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 259 for generator 29. -/
theorem ep_Q2_008_partial_29_0259_valid :
    mulPoly ep_Q2_008_coefficient_29_0259
        ep_Q2_008_generator_29_0200_0299 =
      ep_Q2_008_partial_29_0259 := by
  native_decide

/-- Coefficient term 260 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0260 : Poly :=
[
  term ((-36592039046906006496312329122982400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 260 for generator 29. -/
def ep_Q2_008_partial_29_0260 : Poly :=
[
  term ((-73184078093812012992624658245964800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((36592039046906006496312329122982400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-73184078093812012992624658245964800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 1), (13, 2), (15, 3), (16, 1)],
  term ((36592039046906006496312329122982400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 260 for generator 29. -/
theorem ep_Q2_008_partial_29_0260_valid :
    mulPoly ep_Q2_008_coefficient_29_0260
        ep_Q2_008_generator_29_0200_0299 =
      ep_Q2_008_partial_29_0260 := by
  native_decide

/-- Coefficient term 261 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0261 : Poly :=
[
  term ((1898262511263335877844017073708800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 261 for generator 29. -/
def ep_Q2_008_partial_29_0261 : Poly :=
[
  term ((3796525022526671755688034147417600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1898262511263335877844017073708800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((3796525022526671755688034147417600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1898262511263335877844017073708800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 261 for generator 29. -/
theorem ep_Q2_008_partial_29_0261_valid :
    mulPoly ep_Q2_008_coefficient_29_0261
        ep_Q2_008_generator_29_0200_0299 =
      ep_Q2_008_partial_29_0261 := by
  native_decide

/-- Coefficient term 262 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0262 : Poly :=
[
  term ((463519355542844131959082169072745600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 1), (15, 3), (16, 1)]
]

/-- Partial product 262 for generator 29. -/
def ep_Q2_008_partial_29_0262 : Poly :=
[
  term ((927038711085688263918164338145491200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((-463519355542844131959082169072745600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 1), (12, 2), (15, 3), (16, 1)],
  term ((927038711085688263918164338145491200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 1), (13, 1), (15, 4), (16, 1)],
  term ((-463519355542844131959082169072745600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 262 for generator 29. -/
theorem ep_Q2_008_partial_29_0262_valid :
    mulPoly ep_Q2_008_coefficient_29_0262
        ep_Q2_008_generator_29_0200_0299 =
      ep_Q2_008_partial_29_0262 := by
  native_decide

/-- Coefficient term 263 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0263 : Poly :=
[
  term ((52208389534807899966554525138047200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 263 for generator 29. -/
def ep_Q2_008_partial_29_0263 : Poly :=
[
  term ((104416779069615799933109050276094400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-52208389534807899966554525138047200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((104416779069615799933109050276094400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-52208389534807899966554525138047200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (9, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 263 for generator 29. -/
theorem ep_Q2_008_partial_29_0263_valid :
    mulPoly ep_Q2_008_coefficient_29_0263
        ep_Q2_008_generator_29_0200_0299 =
      ep_Q2_008_partial_29_0263 := by
  native_decide

/-- Coefficient term 264 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0264 : Poly :=
[
  term ((160786571772802500 : Rat) / 692956453614176359) [(4, 1), (6, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 264 for generator 29. -/
def ep_Q2_008_partial_29_0264 : Poly :=
[
  term ((321573143545605000 : Rat) / 692956453614176359) [(4, 1), (6, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-160786571772802500 : Rat) / 692956453614176359) [(4, 1), (6, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((321573143545605000 : Rat) / 692956453614176359) [(4, 1), (6, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-160786571772802500 : Rat) / 692956453614176359) [(4, 1), (6, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 264 for generator 29. -/
theorem ep_Q2_008_partial_29_0264_valid :
    mulPoly ep_Q2_008_coefficient_29_0264
        ep_Q2_008_generator_29_0200_0299 =
      ep_Q2_008_partial_29_0264 := by
  native_decide

/-- Coefficient term 265 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0265 : Poly :=
[
  term ((2905234693698736388815502116241439297284967 : Rat) / 168707601851329515375740828258983054697998) [(4, 1), (6, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 265 for generator 29. -/
def ep_Q2_008_partial_29_0265 : Poly :=
[
  term ((2905234693698736388815502116241439297284967 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (6, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2905234693698736388815502116241439297284967 : Rat) / 168707601851329515375740828258983054697998) [(4, 1), (6, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((2905234693698736388815502116241439297284967 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (6, 1), (13, 2), (15, 2), (16, 1)],
  term ((-2905234693698736388815502116241439297284967 : Rat) / 168707601851329515375740828258983054697998) [(4, 1), (6, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 265 for generator 29. -/
theorem ep_Q2_008_partial_29_0265_valid :
    mulPoly ep_Q2_008_coefficient_29_0265
        ep_Q2_008_generator_29_0200_0299 =
      ep_Q2_008_partial_29_0265 := by
  native_decide

/-- Coefficient term 266 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0266 : Poly :=
[
  term ((-3435233678578325465784110552734491249023163 : Rat) / 337415203702659030751481656517966109395996) [(4, 1), (6, 1), (15, 2), (16, 1)]
]

/-- Partial product 266 for generator 29. -/
def ep_Q2_008_partial_29_0266 : Poly :=
[
  term ((-3435233678578325465784110552734491249023163 : Rat) / 168707601851329515375740828258983054697998) [(4, 1), (6, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((3435233678578325465784110552734491249023163 : Rat) / 337415203702659030751481656517966109395996) [(4, 1), (6, 1), (12, 2), (15, 2), (16, 1)],
  term ((-3435233678578325465784110552734491249023163 : Rat) / 168707601851329515375740828258983054697998) [(4, 1), (6, 1), (13, 1), (15, 3), (16, 1)],
  term ((3435233678578325465784110552734491249023163 : Rat) / 337415203702659030751481656517966109395996) [(4, 1), (6, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 266 for generator 29. -/
theorem ep_Q2_008_partial_29_0266_valid :
    mulPoly ep_Q2_008_coefficient_29_0266
        ep_Q2_008_generator_29_0200_0299 =
      ep_Q2_008_partial_29_0266 := by
  native_decide

/-- Coefficient term 267 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0267 : Poly :=
[
  term ((30955433660627124993 : Rat) / 5543651628913410872) [(4, 1), (6, 1), (16, 1)]
]

/-- Partial product 267 for generator 29. -/
def ep_Q2_008_partial_29_0267 : Poly :=
[
  term ((30955433660627124993 : Rat) / 2771825814456705436) [(4, 1), (6, 1), (12, 1), (14, 1), (16, 1)],
  term ((-30955433660627124993 : Rat) / 5543651628913410872) [(4, 1), (6, 1), (12, 2), (16, 1)],
  term ((30955433660627124993 : Rat) / 2771825814456705436) [(4, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-30955433660627124993 : Rat) / 5543651628913410872) [(4, 1), (6, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 267 for generator 29. -/
theorem ep_Q2_008_partial_29_0267_valid :
    mulPoly ep_Q2_008_coefficient_29_0267
        ep_Q2_008_generator_29_0200_0299 =
      ep_Q2_008_partial_29_0267 := by
  native_decide

/-- Coefficient term 268 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0268 : Poly :=
[
  term ((-1843367721265631962653173246630448000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 268 for generator 29. -/
def ep_Q2_008_partial_29_0268 : Poly :=
[
  term ((-3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (11, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((1843367721265631962653173246630448000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (11, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1843367721265631962653173246630448000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (11, 1), (12, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 268 for generator 29. -/
theorem ep_Q2_008_partial_29_0268_valid :
    mulPoly ep_Q2_008_coefficient_29_0268
        ep_Q2_008_generator_29_0200_0299 =
      ep_Q2_008_partial_29_0268 := by
  native_decide

/-- Coefficient term 269 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0269 : Poly :=
[
  term ((-364938985264381623 : Rat) / 2771825814456705436) [(4, 1), (7, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 269 for generator 29. -/
def ep_Q2_008_partial_29_0269 : Poly :=
[
  term ((-364938985264381623 : Rat) / 1385912907228352718) [(4, 1), (7, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((364938985264381623 : Rat) / 2771825814456705436) [(4, 1), (7, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((-364938985264381623 : Rat) / 1385912907228352718) [(4, 1), (7, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((364938985264381623 : Rat) / 2771825814456705436) [(4, 1), (7, 1), (11, 1), (12, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 269 for generator 29. -/
theorem ep_Q2_008_partial_29_0269_valid :
    mulPoly ep_Q2_008_coefficient_29_0269
        ep_Q2_008_generator_29_0200_0299 =
      ep_Q2_008_partial_29_0269 := by
  native_decide

/-- Coefficient term 270 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0270 : Poly :=
[
  term ((-364938985264381623 : Rat) / 1385912907228352718) [(4, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 270 for generator 29. -/
def ep_Q2_008_partial_29_0270 : Poly :=
[
  term ((-364938985264381623 : Rat) / 692956453614176359) [(4, 1), (7, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((364938985264381623 : Rat) / 1385912907228352718) [(4, 1), (7, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-364938985264381623 : Rat) / 692956453614176359) [(4, 1), (7, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((364938985264381623 : Rat) / 1385912907228352718) [(4, 1), (7, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 270 for generator 29. -/
theorem ep_Q2_008_partial_29_0270_valid :
    mulPoly ep_Q2_008_coefficient_29_0270
        ep_Q2_008_generator_29_0200_0299 =
      ep_Q2_008_partial_29_0270 := by
  native_decide

/-- Coefficient term 271 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0271 : Poly :=
[
  term ((-3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (11, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 271 for generator 29. -/
def ep_Q2_008_partial_29_0271 : Poly :=
[
  term ((-7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (11, 1), (12, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (11, 1), (12, 2), (13, 2), (15, 2), (16, 1)],
  term ((-7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (11, 1), (13, 3), (15, 3), (16, 1)],
  term ((3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (11, 1), (13, 4), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 271 for generator 29. -/
theorem ep_Q2_008_partial_29_0271_valid :
    mulPoly ep_Q2_008_coefficient_29_0271
        ep_Q2_008_generator_29_0200_0299 =
      ep_Q2_008_partial_29_0271 := by
  native_decide

/-- Coefficient term 272 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0272 : Poly :=
[
  term ((980697982853149875 : Rat) / 1385912907228352718) [(4, 1), (7, 1), (11, 1), (16, 1)]
]

/-- Partial product 272 for generator 29. -/
def ep_Q2_008_partial_29_0272 : Poly :=
[
  term ((980697982853149875 : Rat) / 692956453614176359) [(4, 1), (7, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-980697982853149875 : Rat) / 1385912907228352718) [(4, 1), (7, 1), (11, 1), (12, 2), (16, 1)],
  term ((980697982853149875 : Rat) / 692956453614176359) [(4, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-980697982853149875 : Rat) / 1385912907228352718) [(4, 1), (7, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 272 for generator 29. -/
theorem ep_Q2_008_partial_29_0272_valid :
    mulPoly ep_Q2_008_coefficient_29_0272
        ep_Q2_008_generator_29_0200_0299 =
      ep_Q2_008_partial_29_0272 := by
  native_decide

/-- Coefficient term 273 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0273 : Poly :=
[
  term ((364938985264381623 : Rat) / 2771825814456705436) [(4, 1), (7, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 273 for generator 29. -/
def ep_Q2_008_partial_29_0273 : Poly :=
[
  term ((364938985264381623 : Rat) / 1385912907228352718) [(4, 1), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-364938985264381623 : Rat) / 2771825814456705436) [(4, 1), (7, 1), (12, 1), (13, 3), (16, 1)],
  term ((364938985264381623 : Rat) / 1385912907228352718) [(4, 1), (7, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-364938985264381623 : Rat) / 2771825814456705436) [(4, 1), (7, 1), (12, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 273 for generator 29. -/
theorem ep_Q2_008_partial_29_0273_valid :
    mulPoly ep_Q2_008_coefficient_29_0273
        ep_Q2_008_generator_29_0200_0299 =
      ep_Q2_008_partial_29_0273 := by
  native_decide

/-- Coefficient term 274 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0274 : Poly :=
[
  term ((1843367721265631962653173246630448000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 274 for generator 29. -/
def ep_Q2_008_partial_29_0274 : Poly :=
[
  term ((3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((-1843367721265631962653173246630448000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (12, 1), (13, 4), (15, 1), (16, 1)],
  term ((3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (12, 2), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1843367721265631962653173246630448000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (12, 3), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 274 for generator 29. -/
theorem ep_Q2_008_partial_29_0274_valid :
    mulPoly ep_Q2_008_coefficient_29_0274
        ep_Q2_008_generator_29_0200_0299 =
      ep_Q2_008_partial_29_0274 := by
  native_decide

/-- Coefficient term 275 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0275 : Poly :=
[
  term ((32907330511941930766525666351656000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 275 for generator 29. -/
def ep_Q2_008_partial_29_0275 : Poly :=
[
  term ((65814661023883861533051332703312000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-32907330511941930766525666351656000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((65814661023883861533051332703312000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-32907330511941930766525666351656000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 275 for generator 29. -/
theorem ep_Q2_008_partial_29_0275_valid :
    mulPoly ep_Q2_008_coefficient_29_0275
        ep_Q2_008_generator_29_0200_0299 =
      ep_Q2_008_partial_29_0275 := by
  native_decide

/-- Coefficient term 276 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0276 : Poly :=
[
  term ((64819157713209511630210360786406400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 276 for generator 29. -/
def ep_Q2_008_partial_29_0276 : Poly :=
[
  term ((129638315426419023260420721572812800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-64819157713209511630210360786406400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((129638315426419023260420721572812800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (13, 2), (15, 3), (16, 1)],
  term ((-64819157713209511630210360786406400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 276 for generator 29. -/
theorem ep_Q2_008_partial_29_0276_valid :
    mulPoly ep_Q2_008_coefficient_29_0276
        ep_Q2_008_generator_29_0200_0299 =
      ep_Q2_008_partial_29_0276 := by
  native_decide

/-- Coefficient term 277 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0277 : Poly :=
[
  term ((-9287076193293976545 : Rat) / 1385912907228352718) [(4, 1), (7, 1), (13, 1), (16, 1)]
]

/-- Partial product 277 for generator 29. -/
def ep_Q2_008_partial_29_0277 : Poly :=
[
  term ((-9287076193293976545 : Rat) / 692956453614176359) [(4, 1), (7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((9287076193293976545 : Rat) / 1385912907228352718) [(4, 1), (7, 1), (12, 2), (13, 1), (16, 1)],
  term ((-9287076193293976545 : Rat) / 692956453614176359) [(4, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((9287076193293976545 : Rat) / 1385912907228352718) [(4, 1), (7, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 277 for generator 29. -/
theorem ep_Q2_008_partial_29_0277_valid :
    mulPoly ep_Q2_008_coefficient_29_0277
        ep_Q2_008_generator_29_0200_0299 =
      ep_Q2_008_partial_29_0277 := by
  native_decide

/-- Coefficient term 278 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0278 : Poly :=
[
  term ((-1023571891293669725238543207451583251375569 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (7, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 278 for generator 29. -/
def ep_Q2_008_partial_29_0278 : Poly :=
[
  term ((-2047143782587339450477086414903166502751138 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (7, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((1023571891293669725238543207451583251375569 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (7, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((-2047143782587339450477086414903166502751138 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (7, 1), (13, 3), (15, 2), (16, 1)],
  term ((1023571891293669725238543207451583251375569 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (7, 1), (13, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 278 for generator 29. -/
theorem ep_Q2_008_partial_29_0278_valid :
    mulPoly ep_Q2_008_coefficient_29_0278
        ep_Q2_008_generator_29_0200_0299 =
      ep_Q2_008_partial_29_0278 := by
  native_decide

/-- Coefficient term 279 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0279 : Poly :=
[
  term ((-169589830356438140564091938690001216000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (13, 3), (15, 2), (16, 1)]
]

/-- Partial product 279 for generator 29. -/
def ep_Q2_008_partial_29_0279 : Poly :=
[
  term ((-339179660712876281128183877380002432000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (12, 1), (13, 3), (14, 1), (15, 2), (16, 1)],
  term ((169589830356438140564091938690001216000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (12, 2), (13, 3), (15, 2), (16, 1)],
  term ((-339179660712876281128183877380002432000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (13, 4), (15, 3), (16, 1)],
  term ((169589830356438140564091938690001216000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (13, 5), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 279 for generator 29. -/
theorem ep_Q2_008_partial_29_0279_valid :
    mulPoly ep_Q2_008_coefficient_29_0279
        ep_Q2_008_generator_29_0200_0299 =
      ep_Q2_008_partial_29_0279 := by
  native_decide

/-- Coefficient term 280 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0280 : Poly :=
[
  term ((-364938985264381623 : Rat) / 692956453614176359) [(4, 1), (7, 1), (13, 3), (16, 1)]
]

/-- Partial product 280 for generator 29. -/
def ep_Q2_008_partial_29_0280 : Poly :=
[
  term ((-729877970528763246 : Rat) / 692956453614176359) [(4, 1), (7, 1), (12, 1), (13, 3), (14, 1), (16, 1)],
  term ((364938985264381623 : Rat) / 692956453614176359) [(4, 1), (7, 1), (12, 2), (13, 3), (16, 1)],
  term ((-729877970528763246 : Rat) / 692956453614176359) [(4, 1), (7, 1), (13, 4), (15, 1), (16, 1)],
  term ((364938985264381623 : Rat) / 692956453614176359) [(4, 1), (7, 1), (13, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 280 for generator 29. -/
theorem ep_Q2_008_partial_29_0280_valid :
    mulPoly ep_Q2_008_coefficient_29_0280
        ep_Q2_008_generator_29_0200_0299 =
      ep_Q2_008_partial_29_0280 := by
  native_decide

/-- Coefficient term 281 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0281 : Poly :=
[
  term ((-7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (13, 4), (15, 1), (16, 1)]
]

/-- Partial product 281 for generator 29. -/
def ep_Q2_008_partial_29_0281 : Poly :=
[
  term ((-14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (12, 1), (13, 4), (14, 1), (15, 1), (16, 1)],
  term ((7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (12, 2), (13, 4), (15, 1), (16, 1)],
  term ((-14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (13, 5), (15, 2), (16, 1)],
  term ((7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (13, 6), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 281 for generator 29. -/
theorem ep_Q2_008_partial_29_0281_valid :
    mulPoly ep_Q2_008_coefficient_29_0281
        ep_Q2_008_generator_29_0200_0299 =
      ep_Q2_008_partial_29_0281 := by
  native_decide

/-- Coefficient term 282 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0282 : Poly :=
[
  term ((-1555082648796660380024323312834971697210689 : Rat) / 674830407405318061502963313035932218791992) [(4, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 282 for generator 29. -/
def ep_Q2_008_partial_29_0282 : Poly :=
[
  term ((-1555082648796660380024323312834971697210689 : Rat) / 337415203702659030751481656517966109395996) [(4, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1555082648796660380024323312834971697210689 : Rat) / 674830407405318061502963313035932218791992) [(4, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1555082648796660380024323312834971697210689 : Rat) / 337415203702659030751481656517966109395996) [(4, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((1555082648796660380024323312834971697210689 : Rat) / 674830407405318061502963313035932218791992) [(4, 1), (7, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 282 for generator 29. -/
theorem ep_Q2_008_partial_29_0282_valid :
    mulPoly ep_Q2_008_coefficient_29_0282
        ep_Q2_008_generator_29_0200_0299 =
      ep_Q2_008_partial_29_0282 := by
  native_decide

/-- Coefficient term 283 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0283 : Poly :=
[
  term ((288879204506617231197432598291536000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (15, 3), (16, 1)]
]

/-- Partial product 283 for generator 29. -/
def ep_Q2_008_partial_29_0283 : Poly :=
[
  term ((577758409013234462394865196583072000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((-288879204506617231197432598291536000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (12, 2), (15, 3), (16, 1)],
  term ((577758409013234462394865196583072000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (13, 1), (15, 4), (16, 1)],
  term ((-288879204506617231197432598291536000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 283 for generator 29. -/
theorem ep_Q2_008_partial_29_0283_valid :
    mulPoly ep_Q2_008_coefficient_29_0283
        ep_Q2_008_generator_29_0200_0299 =
      ep_Q2_008_partial_29_0283 := by
  native_decide

/-- Coefficient term 284 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0284 : Poly :=
[
  term ((-50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 284 for generator 29. -/
def ep_Q2_008_partial_29_0284 : Poly :=
[
  term ((-101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (11, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 284 for generator 29. -/
theorem ep_Q2_008_partial_29_0284_valid :
    mulPoly ep_Q2_008_coefficient_29_0284
        ep_Q2_008_generator_29_0200_0299 =
      ep_Q2_008_partial_29_0284 := by
  native_decide

/-- Coefficient term 285 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0285 : Poly :=
[
  term ((-101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 285 for generator 29. -/
def ep_Q2_008_partial_29_0285 : Poly :=
[
  term ((-203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (11, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (11, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (11, 1), (13, 2), (15, 3), (16, 1)],
  term ((101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (11, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 285 for generator 29. -/
theorem ep_Q2_008_partial_29_0285_valid :
    mulPoly ep_Q2_008_coefficient_29_0285
        ep_Q2_008_generator_29_0200_0299 =
      ep_Q2_008_partial_29_0285 := by
  native_decide

/-- Coefficient term 286 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0286 : Poly :=
[
  term ((50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 286 for generator 29. -/
def ep_Q2_008_partial_29_0286 : Poly :=
[
  term ((101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (12, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 286 for generator 29. -/
theorem ep_Q2_008_partial_29_0286_valid :
    mulPoly ep_Q2_008_coefficient_29_0286
        ep_Q2_008_generator_29_0200_0299 =
      ep_Q2_008_partial_29_0286 := by
  native_decide

/-- Coefficient term 287 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0287 : Poly :=
[
  term ((-1740572094281580891055456988713401600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 287 for generator 29. -/
def ep_Q2_008_partial_29_0287 : Poly :=
[
  term ((-3481144188563161782110913977426803200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1740572094281580891055456988713401600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-3481144188563161782110913977426803200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (13, 2), (15, 2), (16, 1)],
  term ((1740572094281580891055456988713401600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 287 for generator 29. -/
theorem ep_Q2_008_partial_29_0287_valid :
    mulPoly ep_Q2_008_coefficient_29_0287
        ep_Q2_008_generator_29_0200_0299 =
      ep_Q2_008_partial_29_0287 := by
  native_decide

/-- Coefficient term 288 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0288 : Poly :=
[
  term ((-4670695103245472643774330010042137600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 288 for generator 29. -/
def ep_Q2_008_partial_29_0288 : Poly :=
[
  term ((-9341390206490945287548660020084275200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (12, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((4670695103245472643774330010042137600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (12, 2), (13, 2), (15, 2), (16, 1)],
  term ((-9341390206490945287548660020084275200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (13, 3), (15, 3), (16, 1)],
  term ((4670695103245472643774330010042137600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (13, 4), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 288 for generator 29. -/
theorem ep_Q2_008_partial_29_0288_valid :
    mulPoly ep_Q2_008_coefficient_29_0288
        ep_Q2_008_generator_29_0200_0299 =
      ep_Q2_008_partial_29_0288 := by
  native_decide

/-- Coefficient term 289 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0289 : Poly :=
[
  term ((-203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 289 for generator 29. -/
def ep_Q2_008_partial_29_0289 : Poly :=
[
  term ((-406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (12, 2), (13, 3), (15, 1), (16, 1)],
  term ((-406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (13, 4), (15, 2), (16, 1)],
  term ((203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (13, 5), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 289 for generator 29. -/
theorem ep_Q2_008_partial_29_0289_valid :
    mulPoly ep_Q2_008_coefficient_29_0289
        ep_Q2_008_generator_29_0200_0299 =
      ep_Q2_008_partial_29_0289 := by
  native_decide

/-- Coefficient term 290 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0290 : Poly :=
[
  term ((59250023489857738995684532917676800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (15, 2), (16, 1)]
]

/-- Partial product 290 for generator 29. -/
def ep_Q2_008_partial_29_0290 : Poly :=
[
  term ((118500046979715477991369065835353600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-59250023489857738995684532917676800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (12, 2), (15, 2), (16, 1)],
  term ((118500046979715477991369065835353600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (13, 1), (15, 3), (16, 1)],
  term ((-59250023489857738995684532917676800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 290 for generator 29. -/
theorem ep_Q2_008_partial_29_0290_valid :
    mulPoly ep_Q2_008_coefficient_29_0290
        ep_Q2_008_generator_29_0200_0299 =
      ep_Q2_008_partial_29_0290 := by
  native_decide

/-- Coefficient term 291 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0291 : Poly :=
[
  term ((65144989867565479901745233906429184000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 291 for generator 29. -/
def ep_Q2_008_partial_29_0291 : Poly :=
[
  term ((130289979735130959803490467812858368000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-65144989867565479901745233906429184000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 1), (11, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((130289979735130959803490467812858368000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 1), (11, 1), (13, 2), (15, 3), (16, 1)],
  term ((-65144989867565479901745233906429184000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 1), (11, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 291 for generator 29. -/
theorem ep_Q2_008_partial_29_0291_valid :
    mulPoly ep_Q2_008_coefficient_29_0291
        ep_Q2_008_generator_29_0200_0299 =
      ep_Q2_008_partial_29_0291 := by
  native_decide

/-- Coefficient term 292 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0292 : Poly :=
[
  term ((2669859283589517375 : Rat) / 1385912907228352718) [(4, 1), (8, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 292 for generator 29. -/
def ep_Q2_008_partial_29_0292 : Poly :=
[
  term ((2669859283589517375 : Rat) / 692956453614176359) [(4, 1), (8, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2669859283589517375 : Rat) / 1385912907228352718) [(4, 1), (8, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((2669859283589517375 : Rat) / 692956453614176359) [(4, 1), (8, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-2669859283589517375 : Rat) / 1385912907228352718) [(4, 1), (8, 1), (11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 292 for generator 29. -/
theorem ep_Q2_008_partial_29_0292_valid :
    mulPoly ep_Q2_008_coefficient_29_0292
        ep_Q2_008_generator_29_0200_0299 =
      ep_Q2_008_partial_29_0292 := by
  native_decide

/-- Coefficient term 293 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0293 : Poly :=
[
  term ((195570254767485599874767550375887270400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 293 for generator 29. -/
def ep_Q2_008_partial_29_0293 : Poly :=
[
  term ((391140509534971199749535100751774540800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 1), (11, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-195570254767485599874767550375887270400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 1), (11, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((391140509534971199749535100751774540800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 1), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((-195570254767485599874767550375887270400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 1), (11, 1), (13, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 293 for generator 29. -/
theorem ep_Q2_008_partial_29_0293_valid :
    mulPoly ep_Q2_008_coefficient_29_0293
        ep_Q2_008_generator_29_0200_0299 =
      ep_Q2_008_partial_29_0293 := by
  native_decide

/-- Coefficient term 294 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0294 : Poly :=
[
  term ((-14101733902665438481833198704299528700100 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 294 for generator 29. -/
def ep_Q2_008_partial_29_0294 : Poly :=
[
  term ((-28203467805330876963666397408599057400200 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((14101733902665438481833198704299528700100 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-28203467805330876963666397408599057400200 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((14101733902665438481833198704299528700100 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 294 for generator 29. -/
theorem ep_Q2_008_partial_29_0294_valid :
    mulPoly ep_Q2_008_coefficient_29_0294
        ep_Q2_008_generator_29_0200_0299 =
      ep_Q2_008_partial_29_0294 := by
  native_decide

/-- Coefficient term 295 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0295 : Poly :=
[
  term ((-83370814993305000 : Rat) / 692956453614176359) [(4, 1), (8, 1), (11, 2), (16, 1)]
]

/-- Partial product 295 for generator 29. -/
def ep_Q2_008_partial_29_0295 : Poly :=
[
  term ((-166741629986610000 : Rat) / 692956453614176359) [(4, 1), (8, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((83370814993305000 : Rat) / 692956453614176359) [(4, 1), (8, 1), (11, 2), (12, 2), (16, 1)],
  term ((-166741629986610000 : Rat) / 692956453614176359) [(4, 1), (8, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((83370814993305000 : Rat) / 692956453614176359) [(4, 1), (8, 1), (11, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 295 for generator 29. -/
theorem ep_Q2_008_partial_29_0295_valid :
    mulPoly ep_Q2_008_coefficient_29_0295
        ep_Q2_008_generator_29_0200_0299 =
      ep_Q2_008_partial_29_0295 := by
  native_decide

/-- Coefficient term 296 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0296 : Poly :=
[
  term ((14103247945961947910932228785528532068900 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 296 for generator 29. -/
def ep_Q2_008_partial_29_0296 : Poly :=
[
  term ((28206495891923895821864457571057064137800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-14103247945961947910932228785528532068900 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((28206495891923895821864457571057064137800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 1), (13, 2), (15, 2), (16, 1)],
  term ((-14103247945961947910932228785528532068900 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 296 for generator 29. -/
theorem ep_Q2_008_partial_29_0296_valid :
    mulPoly ep_Q2_008_coefficient_29_0296
        ep_Q2_008_generator_29_0200_0299 =
      ep_Q2_008_partial_29_0296 := by
  native_decide

/-- Coefficient term 297 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0297 : Poly :=
[
  term ((-65144989867565479901745233906429184000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 297 for generator 29. -/
def ep_Q2_008_partial_29_0297 : Poly :=
[
  term ((-130289979735130959803490467812858368000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 1), (12, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((65144989867565479901745233906429184000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 1), (12, 2), (13, 2), (15, 2), (16, 1)],
  term ((-130289979735130959803490467812858368000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 1), (13, 3), (15, 3), (16, 1)],
  term ((65144989867565479901745233906429184000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 1), (13, 4), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 297 for generator 29. -/
theorem ep_Q2_008_partial_29_0297_valid :
    mulPoly ep_Q2_008_coefficient_29_0297
        ep_Q2_008_generator_29_0200_0299 =
      ep_Q2_008_partial_29_0297 := by
  native_decide

/-- Coefficient term 298 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0298 : Poly :=
[
  term ((-2503117653602907375 : Rat) / 1385912907228352718) [(4, 1), (8, 1), (13, 2), (16, 1)]
]

/-- Partial product 298 for generator 29. -/
def ep_Q2_008_partial_29_0298 : Poly :=
[
  term ((-2503117653602907375 : Rat) / 692956453614176359) [(4, 1), (8, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((2503117653602907375 : Rat) / 1385912907228352718) [(4, 1), (8, 1), (12, 2), (13, 2), (16, 1)],
  term ((-2503117653602907375 : Rat) / 692956453614176359) [(4, 1), (8, 1), (13, 3), (15, 1), (16, 1)],
  term ((2503117653602907375 : Rat) / 1385912907228352718) [(4, 1), (8, 1), (13, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 298 for generator 29. -/
theorem ep_Q2_008_partial_29_0298_valid :
    mulPoly ep_Q2_008_coefficient_29_0298
        ep_Q2_008_generator_29_0200_0299 =
      ep_Q2_008_partial_29_0298 := by
  native_decide

/-- Coefficient term 299 from coefficient polynomial 29. -/
def ep_Q2_008_coefficient_29_0299 : Poly :=
[
  term ((-195570254767485599874767550375887270400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 299 for generator 29. -/
def ep_Q2_008_partial_29_0299 : Poly :=
[
  term ((-391140509534971199749535100751774540800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 1), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((195570254767485599874767550375887270400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 1), (12, 2), (13, 3), (15, 1), (16, 1)],
  term ((-391140509534971199749535100751774540800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 1), (13, 4), (15, 2), (16, 1)],
  term ((195570254767485599874767550375887270400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 1), (13, 5), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 299 for generator 29. -/
theorem ep_Q2_008_partial_29_0299_valid :
    mulPoly ep_Q2_008_coefficient_29_0299
        ep_Q2_008_generator_29_0200_0299 =
      ep_Q2_008_partial_29_0299 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_008_partials_29_0200_0299 : List Poly :=
[
  ep_Q2_008_partial_29_0200,
  ep_Q2_008_partial_29_0201,
  ep_Q2_008_partial_29_0202,
  ep_Q2_008_partial_29_0203,
  ep_Q2_008_partial_29_0204,
  ep_Q2_008_partial_29_0205,
  ep_Q2_008_partial_29_0206,
  ep_Q2_008_partial_29_0207,
  ep_Q2_008_partial_29_0208,
  ep_Q2_008_partial_29_0209,
  ep_Q2_008_partial_29_0210,
  ep_Q2_008_partial_29_0211,
  ep_Q2_008_partial_29_0212,
  ep_Q2_008_partial_29_0213,
  ep_Q2_008_partial_29_0214,
  ep_Q2_008_partial_29_0215,
  ep_Q2_008_partial_29_0216,
  ep_Q2_008_partial_29_0217,
  ep_Q2_008_partial_29_0218,
  ep_Q2_008_partial_29_0219,
  ep_Q2_008_partial_29_0220,
  ep_Q2_008_partial_29_0221,
  ep_Q2_008_partial_29_0222,
  ep_Q2_008_partial_29_0223,
  ep_Q2_008_partial_29_0224,
  ep_Q2_008_partial_29_0225,
  ep_Q2_008_partial_29_0226,
  ep_Q2_008_partial_29_0227,
  ep_Q2_008_partial_29_0228,
  ep_Q2_008_partial_29_0229,
  ep_Q2_008_partial_29_0230,
  ep_Q2_008_partial_29_0231,
  ep_Q2_008_partial_29_0232,
  ep_Q2_008_partial_29_0233,
  ep_Q2_008_partial_29_0234,
  ep_Q2_008_partial_29_0235,
  ep_Q2_008_partial_29_0236,
  ep_Q2_008_partial_29_0237,
  ep_Q2_008_partial_29_0238,
  ep_Q2_008_partial_29_0239,
  ep_Q2_008_partial_29_0240,
  ep_Q2_008_partial_29_0241,
  ep_Q2_008_partial_29_0242,
  ep_Q2_008_partial_29_0243,
  ep_Q2_008_partial_29_0244,
  ep_Q2_008_partial_29_0245,
  ep_Q2_008_partial_29_0246,
  ep_Q2_008_partial_29_0247,
  ep_Q2_008_partial_29_0248,
  ep_Q2_008_partial_29_0249,
  ep_Q2_008_partial_29_0250,
  ep_Q2_008_partial_29_0251,
  ep_Q2_008_partial_29_0252,
  ep_Q2_008_partial_29_0253,
  ep_Q2_008_partial_29_0254,
  ep_Q2_008_partial_29_0255,
  ep_Q2_008_partial_29_0256,
  ep_Q2_008_partial_29_0257,
  ep_Q2_008_partial_29_0258,
  ep_Q2_008_partial_29_0259,
  ep_Q2_008_partial_29_0260,
  ep_Q2_008_partial_29_0261,
  ep_Q2_008_partial_29_0262,
  ep_Q2_008_partial_29_0263,
  ep_Q2_008_partial_29_0264,
  ep_Q2_008_partial_29_0265,
  ep_Q2_008_partial_29_0266,
  ep_Q2_008_partial_29_0267,
  ep_Q2_008_partial_29_0268,
  ep_Q2_008_partial_29_0269,
  ep_Q2_008_partial_29_0270,
  ep_Q2_008_partial_29_0271,
  ep_Q2_008_partial_29_0272,
  ep_Q2_008_partial_29_0273,
  ep_Q2_008_partial_29_0274,
  ep_Q2_008_partial_29_0275,
  ep_Q2_008_partial_29_0276,
  ep_Q2_008_partial_29_0277,
  ep_Q2_008_partial_29_0278,
  ep_Q2_008_partial_29_0279,
  ep_Q2_008_partial_29_0280,
  ep_Q2_008_partial_29_0281,
  ep_Q2_008_partial_29_0282,
  ep_Q2_008_partial_29_0283,
  ep_Q2_008_partial_29_0284,
  ep_Q2_008_partial_29_0285,
  ep_Q2_008_partial_29_0286,
  ep_Q2_008_partial_29_0287,
  ep_Q2_008_partial_29_0288,
  ep_Q2_008_partial_29_0289,
  ep_Q2_008_partial_29_0290,
  ep_Q2_008_partial_29_0291,
  ep_Q2_008_partial_29_0292,
  ep_Q2_008_partial_29_0293,
  ep_Q2_008_partial_29_0294,
  ep_Q2_008_partial_29_0295,
  ep_Q2_008_partial_29_0296,
  ep_Q2_008_partial_29_0297,
  ep_Q2_008_partial_29_0298,
  ep_Q2_008_partial_29_0299
]

/-- Sum of partial products in this block. -/
def ep_Q2_008_block_29_0200_0299 : Poly :=
[
  term ((60274769552251048971 : Rat) / 2771825814456705436) [(3, 1), (6, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-51596728831602788152190890561777723276800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((1124303593867496349791174379128316941012121 : Rat) / 674830407405318061502963313035932218791992) [(3, 1), (6, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-60274769552251048971 : Rat) / 5543651628913410872) [(3, 1), (6, 1), (12, 2), (13, 1), (16, 1)],
  term ((25798364415801394076095445280888861638400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((-1124303593867496349791174379128316941012121 : Rat) / 1349660814810636123005926626071864437583984) [(3, 1), (6, 1), (12, 2), (15, 1), (16, 1)],
  term ((1124303593867496349791174379128316941012121 : Rat) / 674830407405318061502963313035932218791992) [(3, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((28224760897170754186140389165920878880400403 : Rat) / 1349660814810636123005926626071864437583984) [(3, 1), (6, 1), (13, 2), (15, 1), (16, 1)],
  term ((-51596728831602788152190890561777723276800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (13, 3), (15, 2), (16, 1)],
  term ((-60274769552251048971 : Rat) / 5543651628913410872) [(3, 1), (6, 1), (13, 3), (16, 1)],
  term ((25798364415801394076095445280888861638400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (13, 4), (15, 1), (16, 1)],
  term ((1543551089018904000 : Rat) / 692956453614176359) [(3, 1), (7, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-771775544509452000 : Rat) / 692956453614176359) [(3, 1), (7, 1), (10, 1), (12, 1), (13, 2), (16, 1)],
  term ((1543551089018904000 : Rat) / 692956453614176359) [(3, 1), (7, 1), (10, 1), (12, 2), (14, 1), (16, 1)],
  term ((-771775544509452000 : Rat) / 692956453614176359) [(3, 1), (7, 1), (10, 1), (12, 3), (16, 1)],
  term ((-177862112128579597823230170678774551958012 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((3973349349631856073 : Rat) / 692956453614176359) [(3, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-29493883540250111402450771946087168000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (12, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((14232620425310883297 : Rat) / 2771825814456705436) [(3, 1), (7, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-3973349349631856073 : Rat) / 1385912907228352718) [(3, 1), (7, 1), (12, 1), (13, 2), (16, 1)],
  term ((71891341129359646543473756618587472000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((287574429506263058841680475444772800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-50309899402336370385 : Rat) / 11087303257826821744) [(3, 1), (7, 1), (12, 1), (14, 1), (16, 1)],
  term ((7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((88931056064289798911615085339387275979006 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (12, 2), (13, 2), (15, 2), (16, 1)],
  term ((-14232620425310883297 : Rat) / 5543651628913410872) [(3, 1), (7, 1), (12, 2), (13, 2), (16, 1)],
  term ((-35945670564679823271736878309293736000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (12, 2), (13, 3), (15, 1), (16, 1)],
  term ((3973349349631856073 : Rat) / 692956453614176359) [(3, 1), (7, 1), (12, 2), (14, 1), (16, 1)],
  term ((-143787214753131529420840237722386400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (12, 2), (15, 2), (16, 1)],
  term ((50309899402336370385 : Rat) / 22174606515653643488) [(3, 1), (7, 1), (12, 2), (16, 1)],
  term ((-3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (12, 3), (13, 1), (15, 1), (16, 1)],
  term ((-3973349349631856073 : Rat) / 1385912907228352718) [(3, 1), (7, 1), (12, 3), (16, 1)],
  term ((-50309899402336370385 : Rat) / 11087303257826821744) [(3, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((287574429506263058841680475444772800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (13, 1), (15, 3), (16, 1)],
  term ((-177866281957807438637583375045668501163612 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((50309899402336370385 : Rat) / 22174606515653643488) [(3, 1), (7, 1), (13, 2), (16, 1)],
  term ((2088265459345619302869560363644646249808441 : Rat) / 337415203702659030751481656517966109395996) [(3, 1), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((-29493883540250111402450771946087168000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (13, 3), (15, 3), (16, 1)],
  term ((86638282899484702244699142591631056000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (13, 4), (15, 2), (16, 1)],
  term ((-14232620425310883297 : Rat) / 5543651628913410872) [(3, 1), (7, 1), (13, 4), (16, 1)],
  term ((-35945670564679823271736878309293736000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (13, 5), (15, 1), (16, 1)],
  term ((-812294800564430025004231306094284800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((1066343356179391508173563813327686400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((1979968576375798185947813808604819200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-533171678089695754086781906663843200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-224917181875325679739014689658979200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-989984288187899092973906904302409600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((1066343356179391508173563813327686400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((112458590937662839869507344829489600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (12, 2), (15, 1), (16, 1)],
  term ((-533171678089695754086781906663843200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (12, 3), (15, 1), (16, 1)],
  term ((-224917181875325679739014689658979200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (13, 1), (15, 2), (16, 1)],
  term ((112458590937662839869507344829489600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (13, 2), (15, 1), (16, 1)],
  term ((-812294800564430025004231306094284800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (13, 2), (15, 3), (16, 1)],
  term ((2386115976658013198449929461651961600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (13, 3), (15, 2), (16, 1)],
  term ((-989984288187899092973906904302409600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (13, 4), (15, 1), (16, 1)],
  term ((26057995947026191960698093562571673600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-46883191288141800 : Rat) / 692956453614176359) [(3, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((-13028997973513095980349046781285836800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (9, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((23441595644070900 : Rat) / 692956453614176359) [(3, 1), (9, 1), (12, 2), (16, 1)],
  term ((-46883191288141800 : Rat) / 692956453614176359) [(3, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((26057995947026191960698093562571673600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (9, 1), (13, 2), (15, 2), (16, 1)],
  term ((23441595644070900 : Rat) / 692956453614176359) [(3, 1), (9, 1), (13, 2), (16, 1)],
  term ((-13028997973513095980349046781285836800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (9, 1), (13, 3), (15, 1), (16, 1)],
  term ((-228007464536479179656108318672502144000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((15990295840324674750 : Rat) / 692956453614176359) [(3, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((1825322377829865598831163803508281190400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (10, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1166266515200717833764401729703275061950250 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((114003732268239589828054159336251072000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (10, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-7995147920162337375 : Rat) / 692956453614176359) [(3, 1), (10, 1), (12, 2), (13, 1), (16, 1)],
  term ((-912661188914932799415581901754140595200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (10, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((583133257600358916882200864851637530975125 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1166266515200717833764401729703275061950250 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((2529636858255530792577640558182813930409875 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-228007464536479179656108318672502144000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (10, 1), (13, 2), (15, 3), (16, 1)],
  term ((1939326110098105188659217962844532262400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (10, 1), (13, 3), (15, 2), (16, 1)],
  term ((-7995147920162337375 : Rat) / 692956453614176359) [(3, 1), (10, 1), (13, 3), (16, 1)],
  term ((-912661188914932799415581901754140595200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (10, 1), (13, 4), (15, 1), (16, 1)],
  term ((-2322127167667485869252230854081475288651200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((18823217024784506625 : Rat) / 2771825814456705436) [(3, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 1), (12, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((46454398708957434000 : Rat) / 692956453614176359) [(3, 1), (11, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-18823217024784506625 : Rat) / 5543651628913410872) [(3, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((3845718644783136572450943326930761843200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 1), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-2454422530646873182530143613462921216000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-31366816329996631125 : Rat) / 5543651628913410872) [(3, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1161063583833742934626115427040737644325600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 1), (12, 2), (13, 2), (15, 2), (16, 1)],
  term ((-23227199354478717000 : Rat) / 692956453614176359) [(3, 1), (11, 1), (12, 2), (13, 2), (16, 1)],
  term ((-1922859322391568286225471663465380921600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 1), (12, 2), (13, 3), (15, 1), (16, 1)],
  term ((18823217024784506625 : Rat) / 2771825814456705436) [(3, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((1227211265323436591265071806731460608000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((31366816329996631125 : Rat) / 11087303257826821744) [(3, 1), (11, 1), (12, 2), (16, 1)],
  term ((-197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 1), (12, 3), (13, 1), (15, 1), (16, 1)],
  term ((-18823217024784506625 : Rat) / 5543651628913410872) [(3, 1), (11, 1), (12, 3), (16, 1)],
  term ((-31366816329996631125 : Rat) / 5543651628913410872) [(3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2454422530646873182530143613462921216000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-2320899956402162432660965782274743828043200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((31366816329996631125 : Rat) / 11087303257826821744) [(3, 1), (11, 1), (13, 2), (16, 1)],
  term ((6815971739142807383593553821120375506399600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((-1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 1), (13, 3), (15, 3), (16, 1)],
  term ((4634584007815574843722931701685789913600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 1), (13, 4), (15, 2), (16, 1)],
  term ((-23227199354478717000 : Rat) / 692956453614176359) [(3, 1), (11, 1), (13, 4), (16, 1)],
  term ((-1922859322391568286225471663465380921600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 1), (13, 5), (15, 1), (16, 1)],
  term ((-12636831252228983694910729250418693168000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-236639440070486743461 : Rat) / 11087303257826821744) [(3, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((105114090116402977290993102433461038947575 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((66173735201237836779306837893903885779200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-392813935270337846436631701949161828132075 : Rat) / 168707601851329515375740828258983054697998) [(3, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-228007464536479179656108318672502144000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (12, 1), (13, 2), (15, 3), (16, 1)],
  term ((1939326110098105188659217962844532262400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((590855012505316125 : Rat) / 692956453614176359) [(3, 1), (12, 1), (13, 3), (16, 1)],
  term ((-912661188914932799415581901754140595200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (12, 1), (13, 4), (15, 1), (16, 1)],
  term ((286771065261668748064689298372976694291561 : Rat) / 674830407405318061502963313035932218791992) [(3, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-228007464536479179656108318672502144000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (12, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1181710025010632250 : Rat) / 692956453614176359) [(3, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((6318415626114491847455364625209346584000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((236639440070486743461 : Rat) / 22174606515653643488) [(3, 1), (12, 2), (13, 1), (16, 1)],
  term ((1825322377829865598831163803508281190400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (12, 2), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-33086867600618918389653418946951942889600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((105114090116402977290993102433461038947575 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-286771065261668748064689298372976694291561 : Rat) / 1349660814810636123005926626071864437583984) [(3, 1), (12, 2), (15, 1), (16, 1)],
  term ((114003732268239589828054159336251072000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (12, 3), (13, 1), (15, 2), (16, 1)],
  term ((590855012505316125 : Rat) / 692956453614176359) [(3, 1), (12, 3), (13, 1), (16, 1)],
  term ((-912661188914932799415581901754140595200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (12, 3), (13, 2), (15, 1), (16, 1)],
  term ((-105114090116402977290993102433461038947575 : Rat) / 168707601851329515375740828258983054697998) [(3, 1), (12, 3), (15, 1), (16, 1)],
  term ((286771065261668748064689298372976694291561 : Rat) / 674830407405318061502963313035932218791992) [(3, 1), (13, 1), (15, 2), (16, 1)],
  term ((-14546481221224221984857563726567623458764791 : Rat) / 674830407405318061502963313035932218791992) [(3, 1), (13, 2), (15, 1), (16, 1)],
  term ((-12636831252228983694910729250418693168000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (13, 2), (15, 3), (16, 1)],
  term ((72492150827352328626762202519113232363200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (13, 3), (15, 2), (16, 1)],
  term ((236639440070486743461 : Rat) / 22174606515653643488) [(3, 1), (13, 3), (16, 1)],
  term ((-33086867600618918389653418946951942889600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (13, 4), (15, 1), (16, 1)],
  term ((-863269656038284001922505986804115200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((431634828019142000961252993402057600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((-863269656038284001922505986804115200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((431634828019142000961252993402057600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1543551089018904000 : Rat) / 692956453614176359) [(3, 2), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((771775544509452000 : Rat) / 692956453614176359) [(3, 2), (10, 1), (12, 2), (16, 1)],
  term ((-1543551089018904000 : Rat) / 692956453614176359) [(3, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((771775544509452000 : Rat) / 692956453614176359) [(3, 2), (10, 1), (13, 2), (16, 1)],
  term ((-3608410364367474450 : Rat) / 692956453614176359) [(3, 2), (12, 1), (14, 1), (16, 1)],
  term ((1804205182183737225 : Rat) / 692956453614176359) [(3, 2), (12, 2), (16, 1)],
  term ((-3608410364367474450 : Rat) / 692956453614176359) [(3, 2), (13, 1), (15, 1), (16, 1)],
  term ((1804205182183737225 : Rat) / 692956453614176359) [(3, 2), (13, 2), (16, 1)],
  term ((129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (11, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (11, 1), (12, 3), (15, 1), (16, 1)],
  term ((129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (11, 1), (13, 2), (15, 3), (16, 1)],
  term ((-64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((2160222737817676228986491429880614400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((5937765135231714625896085406561126400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (12, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((258163701531813679386786322024396800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-26575675157686702289816239031923200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1080111368908838114493245714940307200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-2968882567615857312948042703280563200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (12, 2), (13, 2), (15, 2), (16, 1)],
  term ((-129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (12, 2), (13, 3), (15, 1), (16, 1)],
  term ((13287837578843351144908119515961600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (12, 2), (15, 2), (16, 1)],
  term ((32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (12, 3), (13, 1), (15, 1), (16, 1)],
  term ((-26575675157686702289816239031923200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (13, 1), (15, 3), (16, 1)],
  term ((2173510575396519580131399549396576000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((-1080111368908838114493245714940307200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((5937765135231714625896085406561126400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (13, 3), (15, 3), (16, 1)],
  term ((-2710718866084043633561256381256166400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (13, 4), (15, 2), (16, 1)],
  term ((-129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (13, 5), (15, 1), (16, 1)],
  term ((-43926043926967546635 : Rat) / 2771825814456705436) [(4, 1), (5, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((43926043926967546635 : Rat) / 5543651628913410872) [(4, 1), (5, 1), (9, 1), (12, 2), (16, 1)],
  term ((-43926043926967546635 : Rat) / 2771825814456705436) [(4, 1), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((43926043926967546635 : Rat) / 5543651628913410872) [(4, 1), (5, 1), (9, 1), (13, 2), (16, 1)],
  term ((174027965116026333221848417126824000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-87013982558013166610924208563412000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((174027965116026333221848417126824000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-87013982558013166610924208563412000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((21527944517009055948 : Rat) / 692956453614176359) [(4, 1), (5, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((10763972258504527974 : Rat) / 692956453614176359) [(4, 1), (5, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5381986129252263987 : Rat) / 692956453614176359) [(4, 1), (5, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((69611186046410533288739366850729600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-10763972258504527974 : Rat) / 692956453614176359) [(4, 1), (5, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((10763972258504527974 : Rat) / 692956453614176359) [(4, 1), (5, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((-34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((-5381986129252263987 : Rat) / 692956453614176359) [(4, 1), (5, 1), (11, 1), (12, 3), (16, 1)],
  term ((69611186046410533288739366850729600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((2620602257488432947646572042984856746882828 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (5, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-10763972258504527974 : Rat) / 692956453614176359) [(4, 1), (5, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((-69611186046410533288739366850729600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((702465771922904706351 : Rat) / 1385912907228352718) [(4, 1), (5, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((990285447782416573608 : Rat) / 692956453614176359) [(4, 1), (5, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1310302138106414146776018708213247709020614 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (5, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((43055889034018111896 : Rat) / 692956453614176359) [(4, 1), (5, 1), (12, 1), (13, 3), (14, 1), (16, 1)],
  term ((5381986129252263987 : Rat) / 692956453614176359) [(4, 1), (5, 1), (12, 1), (13, 3), (16, 1)],
  term ((-4988997983081466257630620218475103992318971 : Rat) / 337415203702659030751481656517966109395996) [(4, 1), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-10763972258504527974 : Rat) / 692956453614176359) [(4, 1), (5, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-702465771922904706351 : Rat) / 2771825814456705436) [(4, 1), (5, 1), (12, 2), (13, 1), (16, 1)],
  term ((-495142723891208286804 : Rat) / 692956453614176359) [(4, 1), (5, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((-21527944517009055948 : Rat) / 692956453614176359) [(4, 1), (5, 1), (12, 2), (13, 3), (16, 1)],
  term ((34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((4988997983081466257630620218475103992318971 : Rat) / 674830407405318061502963313035932218791992) [(4, 1), (5, 1), (12, 2), (15, 1), (16, 1)],
  term ((5381986129252263987 : Rat) / 692956453614176359) [(4, 1), (5, 1), (12, 3), (13, 1), (16, 1)],
  term ((-17402796511602633322184841712682400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (12, 3), (15, 1), (16, 1)],
  term ((-4988997983081466257630620218475103992318971 : Rat) / 337415203702659030751481656517966109395996) [(4, 1), (5, 1), (13, 1), (15, 2), (16, 1)],
  term ((347034490584095248894943858721244675703740215 : Rat) / 674830407405318061502963313035932218791992) [(4, 1), (5, 1), (13, 2), (15, 1), (16, 1)],
  term ((-69611186046410533288739366850729600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (13, 2), (15, 3), (16, 1)],
  term ((120547751284491206220520750253181919128832488 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (5, 1), (13, 3), (15, 2), (16, 1)],
  term ((-702465771922904706351 : Rat) / 2771825814456705436) [(4, 1), (5, 1), (13, 3), (16, 1)],
  term ((-452086834857190174908 : Rat) / 692956453614176359) [(4, 1), (5, 1), (13, 4), (15, 1), (16, 1)],
  term ((-21527944517009055948 : Rat) / 692956453614176359) [(4, 1), (5, 1), (13, 5), (16, 1)],
  term ((-73184078093812012992624658245964800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((3796525022526671755688034147417600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((927038711085688263918164338145491200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((36592039046906006496312329122982400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-1898262511263335877844017073708800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((-463519355542844131959082169072745600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 1), (12, 2), (15, 3), (16, 1)],
  term ((3796525022526671755688034147417600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((927038711085688263918164338145491200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 1), (13, 1), (15, 4), (16, 1)],
  term ((-1898262511263335877844017073708800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-536703433636656144951706827318710400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 1), (13, 2), (15, 3), (16, 1)],
  term ((36592039046906006496312329122982400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 1), (13, 3), (15, 2), (16, 1)],
  term ((104416779069615799933109050276094400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-52208389534807899966554525138047200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((104416779069615799933109050276094400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-52208389534807899966554525138047200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((321573143545605000 : Rat) / 692956453614176359) [(4, 1), (6, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-160786571772802500 : Rat) / 692956453614176359) [(4, 1), (6, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((321573143545605000 : Rat) / 692956453614176359) [(4, 1), (6, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-160786571772802500 : Rat) / 692956453614176359) [(4, 1), (6, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((2905234693698736388815502116241439297284967 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (6, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3435233678578325465784110552734491249023163 : Rat) / 168707601851329515375740828258983054697998) [(4, 1), (6, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((30955433660627124993 : Rat) / 2771825814456705436) [(4, 1), (6, 1), (12, 1), (14, 1), (16, 1)],
  term ((-2905234693698736388815502116241439297284967 : Rat) / 168707601851329515375740828258983054697998) [(4, 1), (6, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((3435233678578325465784110552734491249023163 : Rat) / 337415203702659030751481656517966109395996) [(4, 1), (6, 1), (12, 2), (15, 2), (16, 1)],
  term ((-30955433660627124993 : Rat) / 5543651628913410872) [(4, 1), (6, 1), (12, 2), (16, 1)],
  term ((30955433660627124993 : Rat) / 2771825814456705436) [(4, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3435233678578325465784110552734491249023163 : Rat) / 168707601851329515375740828258983054697998) [(4, 1), (6, 1), (13, 1), (15, 3), (16, 1)],
  term ((15056172453373271021046119017700248438163031 : Rat) / 337415203702659030751481656517966109395996) [(4, 1), (6, 1), (13, 2), (15, 2), (16, 1)],
  term ((-30955433660627124993 : Rat) / 5543651628913410872) [(4, 1), (6, 1), (13, 2), (16, 1)],
  term ((-2905234693698736388815502116241439297284967 : Rat) / 168707601851329515375740828258983054697998) [(4, 1), (6, 1), (13, 3), (15, 1), (16, 1)],
  term ((-364938985264381623 : Rat) / 692956453614176359) [(4, 1), (7, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-364938985264381623 : Rat) / 1385912907228352718) [(4, 1), (7, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (11, 1), (12, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (11, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((364938985264381623 : Rat) / 2771825814456705436) [(4, 1), (7, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((1843367721265631962653173246630448000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((980697982853149875 : Rat) / 692956453614176359) [(4, 1), (7, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (11, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((364938985264381623 : Rat) / 1385912907228352718) [(4, 1), (7, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (11, 1), (12, 2), (13, 2), (15, 2), (16, 1)],
  term ((-364938985264381623 : Rat) / 1385912907228352718) [(4, 1), (7, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((-980697982853149875 : Rat) / 1385912907228352718) [(4, 1), (7, 1), (11, 1), (12, 2), (16, 1)],
  term ((1843367721265631962653173246630448000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (11, 1), (12, 3), (13, 1), (15, 1), (16, 1)],
  term ((364938985264381623 : Rat) / 2771825814456705436) [(4, 1), (7, 1), (11, 1), (12, 3), (16, 1)],
  term ((980697982853149875 : Rat) / 692956453614176359) [(4, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-364938985264381623 : Rat) / 692956453614176359) [(4, 1), (7, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-980697982853149875 : Rat) / 1385912907228352718) [(4, 1), (7, 1), (11, 1), (13, 2), (16, 1)],
  term ((364938985264381623 : Rat) / 1385912907228352718) [(4, 1), (7, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((-7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (11, 1), (13, 3), (15, 3), (16, 1)],
  term ((3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (11, 1), (13, 4), (15, 2), (16, 1)],
  term ((129638315426419023260420721572812800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-9287076193293976545 : Rat) / 692956453614176359) [(4, 1), (7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((65814661023883861533051332703312000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2047143782587339450477086414903166502751138 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (7, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((44422225607867746014761695928969479487703 : Rat) / 168707601851329515375740828258983054697998) [(4, 1), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-339179660712876281128183877380002432000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (12, 1), (13, 3), (14, 1), (15, 2), (16, 1)],
  term ((-729877970528763246 : Rat) / 692956453614176359) [(4, 1), (7, 1), (12, 1), (13, 3), (14, 1), (16, 1)],
  term ((3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((-364938985264381623 : Rat) / 2771825814456705436) [(4, 1), (7, 1), (12, 1), (13, 3), (16, 1)],
  term ((-14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (12, 1), (13, 4), (14, 1), (15, 1), (16, 1)],
  term ((-1843367721265631962653173246630448000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (12, 1), (13, 4), (15, 1), (16, 1)],
  term ((-1555082648796660380024323312834971697210689 : Rat) / 337415203702659030751481656517966109395996) [(4, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((577758409013234462394865196583072000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((364938985264381623 : Rat) / 1385912907228352718) [(4, 1), (7, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-64819157713209511630210360786406400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((9287076193293976545 : Rat) / 1385912907228352718) [(4, 1), (7, 1), (12, 2), (13, 1), (16, 1)],
  term ((3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (12, 2), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((1023571891293669725238543207451583251375569 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (7, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((169589830356438140564091938690001216000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (12, 2), (13, 3), (15, 2), (16, 1)],
  term ((364938985264381623 : Rat) / 692956453614176359) [(4, 1), (7, 1), (12, 2), (13, 3), (16, 1)],
  term ((7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (12, 2), (13, 4), (15, 1), (16, 1)],
  term ((65814661023883861533051332703312000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((1555082648796660380024323312834971697210689 : Rat) / 674830407405318061502963313035932218791992) [(4, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((-288879204506617231197432598291536000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (12, 2), (15, 3), (16, 1)],
  term ((-364938985264381623 : Rat) / 2771825814456705436) [(4, 1), (7, 1), (12, 3), (13, 1), (16, 1)],
  term ((-1843367721265631962653173246630448000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (12, 3), (13, 2), (15, 1), (16, 1)],
  term ((-32907330511941930766525666351656000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (12, 3), (15, 1), (16, 1)],
  term ((-1555082648796660380024323312834971697210689 : Rat) / 337415203702659030751481656517966109395996) [(4, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((577758409013234462394865196583072000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (13, 1), (15, 4), (16, 1)],
  term ((-7489066342727489672647476919142270365187271 : Rat) / 674830407405318061502963313035932218791992) [(4, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-159240889080198207937011876718723200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (13, 2), (15, 3), (16, 1)],
  term ((-2047145662342913133552923691003629308536738 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (7, 1), (13, 3), (15, 2), (16, 1)],
  term ((9287076193293976545 : Rat) / 1385912907228352718) [(4, 1), (7, 1), (13, 3), (16, 1)],
  term ((934723622827594847945050898616347500304163 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (7, 1), (13, 4), (15, 1), (16, 1)],
  term ((-339179660712876281128183877380002432000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (13, 4), (15, 3), (16, 1)],
  term ((154842888586313084862866552716957632000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (13, 5), (15, 2), (16, 1)],
  term ((364938985264381623 : Rat) / 692956453614176359) [(4, 1), (7, 1), (13, 5), (16, 1)],
  term ((7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (13, 6), (15, 1), (16, 1)],
  term ((-203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (11, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (11, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (11, 1), (12, 3), (15, 1), (16, 1)],
  term ((-203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (11, 1), (13, 2), (15, 3), (16, 1)],
  term ((101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((-3481144188563161782110913977426803200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-9341390206490945287548660020084275200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (12, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((118500046979715477991369065835353600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1740572094281580891055456988713401600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((4670695103245472643774330010042137600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (12, 2), (13, 2), (15, 2), (16, 1)],
  term ((203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (12, 2), (13, 3), (15, 1), (16, 1)],
  term ((-59250023489857738995684532917676800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (12, 2), (15, 2), (16, 1)],
  term ((-50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (12, 3), (13, 1), (15, 1), (16, 1)],
  term ((118500046979715477991369065835353600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (13, 1), (15, 3), (16, 1)],
  term ((-3540394212053019521106598510344480000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (13, 2), (15, 2), (16, 1)],
  term ((1740572094281580891055456988713401600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (13, 3), (15, 1), (16, 1)],
  term ((-9341390206490945287548660020084275200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (13, 3), (15, 3), (16, 1)],
  term ((4264547702963257631272214356994995200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (13, 4), (15, 2), (16, 1)],
  term ((203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (13, 5), (15, 1), (16, 1)],
  term ((130289979735130959803490467812858368000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((2669859283589517375 : Rat) / 692956453614176359) [(4, 1), (8, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((391140509534971199749535100751774540800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 1), (11, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-28203467805330876963666397408599057400200 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-65144989867565479901745233906429184000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 1), (11, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-2669859283589517375 : Rat) / 1385912907228352718) [(4, 1), (8, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-195570254767485599874767550375887270400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 1), (11, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((14101733902665438481833198704299528700100 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-28203467805330876963666397408599057400200 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((339104520633102378843111031031018608397475 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((130289979735130959803490467812858368000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 1), (11, 1), (13, 2), (15, 3), (16, 1)],
  term ((325995519667405719847789866845345356800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 1), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((-2669859283589517375 : Rat) / 1385912907228352718) [(4, 1), (8, 1), (11, 1), (13, 3), (16, 1)],
  term ((-195570254767485599874767550375887270400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 1), (11, 1), (13, 4), (15, 1), (16, 1)],
  term ((-166741629986610000 : Rat) / 692956453614176359) [(4, 1), (8, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((83370814993305000 : Rat) / 692956453614176359) [(4, 1), (8, 1), (11, 2), (12, 2), (16, 1)],
  term ((-166741629986610000 : Rat) / 692956453614176359) [(4, 1), (8, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((83370814993305000 : Rat) / 692956453614176359) [(4, 1), (8, 1), (11, 2), (13, 2), (16, 1)],
  term ((28206495891923895821864457571057064137800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-130289979735130959803490467812858368000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 1), (12, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-2503117653602907375 : Rat) / 692956453614176359) [(4, 1), (8, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-391140509534971199749535100751774540800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 1), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-14103247945961947910932228785528532068900 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((65144989867565479901745233906429184000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 1), (12, 2), (13, 2), (15, 2), (16, 1)],
  term ((2503117653602907375 : Rat) / 1385912907228352718) [(4, 1), (8, 1), (12, 2), (13, 2), (16, 1)],
  term ((195570254767485599874767550375887270400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 1), (12, 2), (13, 3), (15, 1), (16, 1)],
  term ((28206495891923895821864457571057064137800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 1), (13, 2), (15, 2), (16, 1)],
  term ((-318808525087516969598499681098898759556275 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 1), (13, 3), (15, 1), (16, 1)],
  term ((-130289979735130959803490467812858368000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 1), (13, 3), (15, 3), (16, 1)],
  term ((-325995519667405719847789866845345356800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 1), (13, 4), (15, 2), (16, 1)],
  term ((2503117653602907375 : Rat) / 1385912907228352718) [(4, 1), (8, 1), (13, 4), (16, 1)],
  term ((195570254767485599874767550375887270400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 1), (13, 5), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 29, terms 200 through 299. -/
theorem ep_Q2_008_block_29_0200_0299_valid :
    checkProductSumEq ep_Q2_008_partials_29_0200_0299
      ep_Q2_008_block_29_0200_0299 = true := by
  native_decide

end EpQ2008TermShards

end Patterns

end EndpointCertificate

end Problem97
