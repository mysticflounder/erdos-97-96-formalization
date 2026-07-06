/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_008, term block 28:200-299

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_008`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2008TermShards

/-- Generator polynomial 28 for endpoint certificate `ep_Q2_008`. -/
def ep_Q2_008_generator_28_0200_0299 : Poly :=
[
  term (2 : Rat) [(2, 1), (14, 1)],
  term (-1 : Rat) [(2, 2)],
  term (2 : Rat) [(3, 1), (15, 1)],
  term (-1 : Rat) [(3, 2)]
]

/-- Coefficient term 200 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0200 : Poly :=
[
  term ((83370814993305000 : Rat) / 692956453614176359) [(3, 1), (5, 1), (11, 2), (16, 1)]
]

/-- Partial product 200 for generator 28. -/
def ep_Q2_008_partial_28_0200 : Poly :=
[
  term ((166741629986610000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (5, 1), (11, 2), (14, 1), (16, 1)],
  term ((-83370814993305000 : Rat) / 692956453614176359) [(2, 2), (3, 1), (5, 1), (11, 2), (16, 1)],
  term ((166741629986610000 : Rat) / 692956453614176359) [(3, 2), (5, 1), (11, 2), (15, 1), (16, 1)],
  term ((-83370814993305000 : Rat) / 692956453614176359) [(3, 3), (5, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 200 for generator 28. -/
theorem ep_Q2_008_partial_28_0200_valid :
    mulPoly ep_Q2_008_coefficient_28_0200
        ep_Q2_008_generator_28_0200_0299 =
      ep_Q2_008_partial_28_0200 := by
  native_decide

/-- Coefficient term 201 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0201 : Poly :=
[
  term ((21527944517009055948 : Rat) / 692956453614176359) [(3, 1), (5, 1), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 201 for generator 28. -/
def ep_Q2_008_partial_28_0201 : Poly :=
[
  term ((43055889034018111896 : Rat) / 692956453614176359) [(2, 1), (3, 1), (5, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-21527944517009055948 : Rat) / 692956453614176359) [(2, 2), (3, 1), (5, 1), (12, 1), (13, 2), (16, 1)],
  term ((43055889034018111896 : Rat) / 692956453614176359) [(3, 2), (5, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-21527944517009055948 : Rat) / 692956453614176359) [(3, 3), (5, 1), (12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 201 for generator 28. -/
theorem ep_Q2_008_partial_28_0201_valid :
    mulPoly ep_Q2_008_coefficient_28_0201
        ep_Q2_008_generator_28_0200_0299 =
      ep_Q2_008_partial_28_0201 := by
  native_decide

/-- Coefficient term 202 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0202 : Poly :=
[
  term ((16248129776659487595 : Rat) / 2771825814456705436) [(3, 1), (5, 1), (12, 1), (16, 1)]
]

/-- Partial product 202 for generator 28. -/
def ep_Q2_008_partial_28_0202 : Poly :=
[
  term ((16248129776659487595 : Rat) / 1385912907228352718) [(2, 1), (3, 1), (5, 1), (12, 1), (14, 1), (16, 1)],
  term ((-16248129776659487595 : Rat) / 2771825814456705436) [(2, 2), (3, 1), (5, 1), (12, 1), (16, 1)],
  term ((16248129776659487595 : Rat) / 1385912907228352718) [(3, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-16248129776659487595 : Rat) / 2771825814456705436) [(3, 3), (5, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 202 for generator 28. -/
theorem ep_Q2_008_partial_28_0202_valid :
    mulPoly ep_Q2_008_coefficient_28_0202
        ep_Q2_008_generator_28_0200_0299 =
      ep_Q2_008_partial_28_0202 := by
  native_decide

/-- Coefficient term 203 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0203 : Poly :=
[
  term ((4209364481888006753262652120648845609900125 : Rat) / 168707601851329515375740828258983054697998) [(3, 1), (5, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 203 for generator 28. -/
def ep_Q2_008_partial_28_0203 : Poly :=
[
  term ((4209364481888006753262652120648845609900125 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (5, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4209364481888006753262652120648845609900125 : Rat) / 168707601851329515375740828258983054697998) [(2, 2), (3, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((4209364481888006753262652120648845609900125 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (5, 1), (13, 1), (15, 2), (16, 1)],
  term ((-4209364481888006753262652120648845609900125 : Rat) / 168707601851329515375740828258983054697998) [(3, 3), (5, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 203 for generator 28. -/
theorem ep_Q2_008_partial_28_0203_valid :
    mulPoly ep_Q2_008_coefficient_28_0203
        ep_Q2_008_generator_28_0200_0299 =
      ep_Q2_008_partial_28_0203 := by
  native_decide

/-- Coefficient term 204 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0204 : Poly :=
[
  term ((-107639722585045279740 : Rat) / 692956453614176359) [(3, 1), (5, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 204 for generator 28. -/
def ep_Q2_008_partial_28_0204 : Poly :=
[
  term ((-215279445170090559480 : Rat) / 692956453614176359) [(2, 1), (3, 1), (5, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((107639722585045279740 : Rat) / 692956453614176359) [(2, 2), (3, 1), (5, 1), (13, 2), (15, 2), (16, 1)],
  term ((-215279445170090559480 : Rat) / 692956453614176359) [(3, 2), (5, 1), (13, 2), (15, 3), (16, 1)],
  term ((107639722585045279740 : Rat) / 692956453614176359) [(3, 3), (5, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 204 for generator 28. -/
theorem ep_Q2_008_partial_28_0204_valid :
    mulPoly ep_Q2_008_coefficient_28_0204
        ep_Q2_008_generator_28_0200_0299 =
      ep_Q2_008_partial_28_0204 := by
  native_decide

/-- Coefficient term 205 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0205 : Poly :=
[
  term ((51206676898009787508 : Rat) / 692956453614176359) [(3, 1), (5, 1), (13, 2), (16, 1)]
]

/-- Partial product 205 for generator 28. -/
def ep_Q2_008_partial_28_0205 : Poly :=
[
  term ((102413353796019575016 : Rat) / 692956453614176359) [(2, 1), (3, 1), (5, 1), (13, 2), (14, 1), (16, 1)],
  term ((-51206676898009787508 : Rat) / 692956453614176359) [(2, 2), (3, 1), (5, 1), (13, 2), (16, 1)],
  term ((102413353796019575016 : Rat) / 692956453614176359) [(3, 2), (5, 1), (13, 2), (15, 1), (16, 1)],
  term ((-51206676898009787508 : Rat) / 692956453614176359) [(3, 3), (5, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 205 for generator 28. -/
theorem ep_Q2_008_partial_28_0205_valid :
    mulPoly ep_Q2_008_coefficient_28_0205
        ep_Q2_008_generator_28_0200_0299 =
      ep_Q2_008_partial_28_0205 := by
  native_decide

/-- Coefficient term 206 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0206 : Poly :=
[
  term ((-2104639235181182094975540307520976395808377 : Rat) / 337415203702659030751481656517966109395996) [(3, 1), (5, 1), (15, 2), (16, 1)]
]

/-- Partial product 206 for generator 28. -/
def ep_Q2_008_partial_28_0206 : Poly :=
[
  term ((-2104639235181182094975540307520976395808377 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (3, 1), (5, 1), (14, 1), (15, 2), (16, 1)],
  term ((2104639235181182094975540307520976395808377 : Rat) / 337415203702659030751481656517966109395996) [(2, 2), (3, 1), (5, 1), (15, 2), (16, 1)],
  term ((-2104639235181182094975540307520976395808377 : Rat) / 168707601851329515375740828258983054697998) [(3, 2), (5, 1), (15, 3), (16, 1)],
  term ((2104639235181182094975540307520976395808377 : Rat) / 337415203702659030751481656517966109395996) [(3, 3), (5, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 206 for generator 28. -/
theorem ep_Q2_008_partial_28_0206_valid :
    mulPoly ep_Q2_008_coefficient_28_0206
        ep_Q2_008_generator_28_0200_0299 =
      ep_Q2_008_partial_28_0206 := by
  native_decide

/-- Coefficient term 207 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0207 : Poly :=
[
  term ((-12935031557573321989 : Rat) / 11087303257826821744) [(3, 1), (5, 1), (16, 1)]
]

/-- Partial product 207 for generator 28. -/
def ep_Q2_008_partial_28_0207 : Poly :=
[
  term ((-12935031557573321989 : Rat) / 5543651628913410872) [(2, 1), (3, 1), (5, 1), (14, 1), (16, 1)],
  term ((12935031557573321989 : Rat) / 11087303257826821744) [(2, 2), (3, 1), (5, 1), (16, 1)],
  term ((-12935031557573321989 : Rat) / 5543651628913410872) [(3, 2), (5, 1), (15, 1), (16, 1)],
  term ((12935031557573321989 : Rat) / 11087303257826821744) [(3, 3), (5, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 207 for generator 28. -/
theorem ep_Q2_008_partial_28_0207_valid :
    mulPoly ep_Q2_008_coefficient_28_0207
        ep_Q2_008_generator_28_0200_0299 =
      ep_Q2_008_partial_28_0207 := by
  native_decide

/-- Coefficient term 208 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0208 : Poly :=
[
  term ((905512728341238130650910700088014400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 208 for generator 28. -/
def ep_Q2_008_partial_28_0208 : Poly :=
[
  term ((1811025456682476261301821400176028800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (6, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-905512728341238130650910700088014400 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (3, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((1811025456682476261301821400176028800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (6, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-905512728341238130650910700088014400 : Rat) / 2908751756057405437512772901016949218931) [(3, 3), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 208 for generator 28. -/
theorem ep_Q2_008_partial_28_0208_valid :
    mulPoly ep_Q2_008_coefficient_28_0208
        ep_Q2_008_generator_28_0200_0299 =
      ep_Q2_008_partial_28_0208 := by
  native_decide

/-- Coefficient term 209 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0209 : Poly :=
[
  term ((4744206808436961099 : Rat) / 1385912907228352718) [(3, 1), (6, 1), (7, 1), (13, 2), (16, 1)]
]

/-- Partial product 209 for generator 28. -/
def ep_Q2_008_partial_28_0209 : Poly :=
[
  term ((4744206808436961099 : Rat) / 692956453614176359) [(2, 1), (3, 1), (6, 1), (7, 1), (13, 2), (14, 1), (16, 1)],
  term ((-4744206808436961099 : Rat) / 1385912907228352718) [(2, 2), (3, 1), (6, 1), (7, 1), (13, 2), (16, 1)],
  term ((4744206808436961099 : Rat) / 692956453614176359) [(3, 2), (6, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-4744206808436961099 : Rat) / 1385912907228352718) [(3, 3), (6, 1), (7, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 209 for generator 28. -/
theorem ep_Q2_008_partial_28_0209_valid :
    mulPoly ep_Q2_008_coefficient_28_0209
        ep_Q2_008_generator_28_0200_0299 =
      ep_Q2_008_partial_28_0209 := by
  native_decide

/-- Coefficient term 210 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0210 : Poly :=
[
  term ((47927560752906431028982504412391648000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 210 for generator 28. -/
def ep_Q2_008_partial_28_0210 : Poly :=
[
  term ((95855121505812862057965008824783296000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (6, 1), (7, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-47927560752906431028982504412391648000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (3, 1), (6, 1), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((95855121505812862057965008824783296000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (6, 1), (7, 1), (13, 3), (15, 2), (16, 1)],
  term ((-47927560752906431028982504412391648000 : Rat) / 2908751756057405437512772901016949218931) [(3, 3), (6, 1), (7, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 210 for generator 28. -/
theorem ep_Q2_008_partial_28_0210_valid :
    mulPoly ep_Q2_008_coefficient_28_0210
        ep_Q2_008_generator_28_0200_0299 =
      ep_Q2_008_partial_28_0210 := by
  native_decide

/-- Coefficient term 211 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0211 : Poly :=
[
  term ((1619646487561852949 : Rat) / 5543651628913410872) [(3, 1), (6, 1), (7, 1), (16, 1)]
]

/-- Partial product 211 for generator 28. -/
def ep_Q2_008_partial_28_0211 : Poly :=
[
  term ((1619646487561852949 : Rat) / 2771825814456705436) [(2, 1), (3, 1), (6, 1), (7, 1), (14, 1), (16, 1)],
  term ((-1619646487561852949 : Rat) / 5543651628913410872) [(2, 2), (3, 1), (6, 1), (7, 1), (16, 1)],
  term ((1619646487561852949 : Rat) / 2771825814456705436) [(3, 2), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-1619646487561852949 : Rat) / 5543651628913410872) [(3, 3), (6, 1), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 211 for generator 28. -/
theorem ep_Q2_008_partial_28_0211_valid :
    mulPoly ep_Q2_008_coefficient_28_0211
        ep_Q2_008_generator_28_0200_0299 =
      ep_Q2_008_partial_28_0211 := by
  native_decide

/-- Coefficient term 212 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0212 : Poly :=
[
  term ((1319979050917198790631875872403212800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 2), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 212 for generator 28. -/
def ep_Q2_008_partial_28_0212 : Poly :=
[
  term ((2639958101834397581263751744806425600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (6, 1), (7, 2), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1319979050917198790631875872403212800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (3, 1), (6, 1), (7, 2), (13, 2), (15, 1), (16, 1)],
  term ((2639958101834397581263751744806425600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (6, 1), (7, 2), (13, 2), (15, 2), (16, 1)],
  term ((-1319979050917198790631875872403212800 : Rat) / 2908751756057405437512772901016949218931) [(3, 3), (6, 1), (7, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 212 for generator 28. -/
theorem ep_Q2_008_partial_28_0212_valid :
    mulPoly ep_Q2_008_coefficient_28_0212
        ep_Q2_008_generator_28_0200_0299 =
      ep_Q2_008_partial_28_0212 := by
  native_decide

/-- Coefficient term 213 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0213 : Poly :=
[
  term ((4698536286744001569982708927123200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 2), (15, 1), (16, 1)]
]

/-- Partial product 213 for generator 28. -/
def ep_Q2_008_partial_28_0213 : Poly :=
[
  term ((9397072573488003139965417854246400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (6, 1), (7, 2), (14, 1), (15, 1), (16, 1)],
  term ((-4698536286744001569982708927123200 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (3, 1), (6, 1), (7, 2), (15, 1), (16, 1)],
  term ((9397072573488003139965417854246400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (6, 1), (7, 2), (15, 2), (16, 1)],
  term ((-4698536286744001569982708927123200 : Rat) / 2908751756057405437512772901016949218931) [(3, 3), (6, 1), (7, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 213 for generator 28. -/
theorem ep_Q2_008_partial_28_0213_valid :
    mulPoly ep_Q2_008_coefficient_28_0213
        ep_Q2_008_generator_28_0200_0299 =
      ep_Q2_008_partial_28_0213 := by
  native_decide

/-- Coefficient term 214 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0214 : Poly :=
[
  term ((39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 214 for generator 28. -/
def ep_Q2_008_partial_28_0214 : Poly :=
[
  term ((78173987841078575882094280687715020800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (6, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (3, 1), (6, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((78173987841078575882094280687715020800 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (6, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(3, 3), (6, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 214 for generator 28. -/
theorem ep_Q2_008_partial_28_0214_valid :
    mulPoly ep_Q2_008_coefficient_28_0214
        ep_Q2_008_generator_28_0200_0299 =
      ep_Q2_008_partial_28_0214 := by
  native_decide

/-- Coefficient term 215 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0215 : Poly :=
[
  term ((-70324786932212700 : Rat) / 692956453614176359) [(3, 1), (6, 1), (9, 1), (16, 1)]
]

/-- Partial product 215 for generator 28. -/
def ep_Q2_008_partial_28_0215 : Poly :=
[
  term ((-140649573864425400 : Rat) / 692956453614176359) [(2, 1), (3, 1), (6, 1), (9, 1), (14, 1), (16, 1)],
  term ((70324786932212700 : Rat) / 692956453614176359) [(2, 2), (3, 1), (6, 1), (9, 1), (16, 1)],
  term ((-140649573864425400 : Rat) / 692956453614176359) [(3, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((70324786932212700 : Rat) / 692956453614176359) [(3, 3), (6, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 215 for generator 28. -/
theorem ep_Q2_008_partial_28_0215_valid :
    mulPoly ep_Q2_008_coefficient_28_0215
        ep_Q2_008_generator_28_0200_0299 =
      ep_Q2_008_partial_28_0215 := by
  native_decide

/-- Coefficient term 216 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0216 : Poly :=
[
  term ((11962520939896506000 : Rat) / 692956453614176359) [(3, 1), (6, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 216 for generator 28. -/
def ep_Q2_008_partial_28_0216 : Poly :=
[
  term ((23925041879793012000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (6, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-11962520939896506000 : Rat) / 692956453614176359) [(2, 2), (3, 1), (6, 1), (10, 1), (13, 1), (16, 1)],
  term ((23925041879793012000 : Rat) / 692956453614176359) [(3, 2), (6, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-11962520939896506000 : Rat) / 692956453614176359) [(3, 3), (6, 1), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 216 for generator 28. -/
theorem ep_Q2_008_partial_28_0216_valid :
    mulPoly ep_Q2_008_coefficient_28_0216
        ep_Q2_008_generator_28_0200_0299 =
      ep_Q2_008_partial_28_0216 := by
  native_decide

/-- Coefficient term 217 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0217 : Poly :=
[
  term ((4392022636714377767928351172712449718400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 217 for generator 28. -/
def ep_Q2_008_partial_28_0217 : Poly :=
[
  term ((8784045273428755535856702345424899436800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (6, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4392022636714377767928351172712449718400 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (3, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((8784045273428755535856702345424899436800 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (6, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-4392022636714377767928351172712449718400 : Rat) / 84353800925664757687870414129491527348999) [(3, 3), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 217 for generator 28. -/
theorem ep_Q2_008_partial_28_0217_valid :
    mulPoly ep_Q2_008_coefficient_28_0217
        ep_Q2_008_generator_28_0200_0299 =
      ep_Q2_008_partial_28_0217 := by
  native_decide

/-- Coefficient term 218 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0218 : Poly :=
[
  term ((30969599139304956000 : Rat) / 692956453614176359) [(3, 1), (6, 1), (11, 1), (13, 2), (16, 1)]
]

/-- Partial product 218 for generator 28. -/
def ep_Q2_008_partial_28_0218 : Poly :=
[
  term ((61939198278609912000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (6, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-30969599139304956000 : Rat) / 692956453614176359) [(2, 2), (3, 1), (6, 1), (11, 1), (13, 2), (16, 1)],
  term ((61939198278609912000 : Rat) / 692956453614176359) [(3, 2), (6, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-30969599139304956000 : Rat) / 692956453614176359) [(3, 3), (6, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 218 for generator 28. -/
theorem ep_Q2_008_partial_28_0218_valid :
    mulPoly ep_Q2_008_coefficient_28_0218
        ep_Q2_008_generator_28_0200_0299 =
      ep_Q2_008_partial_28_0218 := by
  native_decide

/-- Coefficient term 219 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0219 : Poly :=
[
  term ((2563812429855424381633962217953841228800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 219 for generator 28. -/
def ep_Q2_008_partial_28_0219 : Poly :=
[
  term ((5127624859710848763267924435907682457600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (6, 1), (11, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-2563812429855424381633962217953841228800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (3, 1), (6, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((5127624859710848763267924435907682457600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (6, 1), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((-2563812429855424381633962217953841228800 : Rat) / 2908751756057405437512772901016949218931) [(3, 3), (6, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 219 for generator 28. -/
theorem ep_Q2_008_partial_28_0219_valid :
    mulPoly ep_Q2_008_coefficient_28_0219
        ep_Q2_008_generator_28_0200_0299 =
      ep_Q2_008_partial_28_0219 := by
  native_decide

/-- Coefficient term 220 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0220 : Poly :=
[
  term ((-542192667164935875 : Rat) / 2771825814456705436) [(3, 1), (6, 1), (11, 1), (16, 1)]
]

/-- Partial product 220 for generator 28. -/
def ep_Q2_008_partial_28_0220 : Poly :=
[
  term ((-542192667164935875 : Rat) / 1385912907228352718) [(2, 1), (3, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((542192667164935875 : Rat) / 2771825814456705436) [(2, 2), (3, 1), (6, 1), (11, 1), (16, 1)],
  term ((-542192667164935875 : Rat) / 1385912907228352718) [(3, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((542192667164935875 : Rat) / 2771825814456705436) [(3, 3), (6, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 220 for generator 28. -/
theorem ep_Q2_008_partial_28_0220_valid :
    mulPoly ep_Q2_008_coefficient_28_0220
        ep_Q2_008_generator_28_0200_0299 =
      ep_Q2_008_partial_28_0220 := by
  native_decide

/-- Coefficient term 221 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0221 : Poly :=
[
  term ((14663910820736501329975236076965915182400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 221 for generator 28. -/
def ep_Q2_008_partial_28_0221 : Poly :=
[
  term ((29327821641473002659950472153931830364800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (6, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-14663910820736501329975236076965915182400 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (3, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((29327821641473002659950472153931830364800 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((-14663910820736501329975236076965915182400 : Rat) / 84353800925664757687870414129491527348999) [(3, 3), (6, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 221 for generator 28. -/
theorem ep_Q2_008_partial_28_0221_valid :
    mulPoly ep_Q2_008_coefficient_28_0221
        ep_Q2_008_generator_28_0200_0299 =
      ep_Q2_008_partial_28_0221 := by
  native_decide

/-- Coefficient term 222 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0222 : Poly :=
[
  term ((-4885874240067410992630892542982188800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 222 for generator 28. -/
def ep_Q2_008_partial_28_0222 : Poly :=
[
  term ((-9771748480134821985261785085964377600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (6, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((4885874240067410992630892542982188800 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (3, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((-9771748480134821985261785085964377600 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (6, 1), (13, 1), (15, 3), (16, 1)],
  term ((4885874240067410992630892542982188800 : Rat) / 84353800925664757687870414129491527348999) [(3, 3), (6, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 222 for generator 28. -/
theorem ep_Q2_008_partial_28_0222_valid :
    mulPoly ep_Q2_008_coefficient_28_0222
        ep_Q2_008_generator_28_0200_0299 =
      ep_Q2_008_partial_28_0222 := by
  native_decide

/-- Coefficient term 223 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0223 : Poly :=
[
  term ((-91573751732049538353 : Rat) / 5543651628913410872) [(3, 1), (6, 1), (13, 1), (16, 1)]
]

/-- Partial product 223 for generator 28. -/
def ep_Q2_008_partial_28_0223 : Poly :=
[
  term ((-91573751732049538353 : Rat) / 2771825814456705436) [(2, 1), (3, 1), (6, 1), (13, 1), (14, 1), (16, 1)],
  term ((91573751732049538353 : Rat) / 5543651628913410872) [(2, 2), (3, 1), (6, 1), (13, 1), (16, 1)],
  term ((-91573751732049538353 : Rat) / 2771825814456705436) [(3, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((91573751732049538353 : Rat) / 5543651628913410872) [(3, 3), (6, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 223 for generator 28. -/
theorem ep_Q2_008_partial_28_0223_valid :
    mulPoly ep_Q2_008_coefficient_28_0223
        ep_Q2_008_generator_28_0200_0299 =
      ep_Q2_008_partial_28_0223 := by
  native_decide

/-- Coefficient term 224 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0224 : Poly :=
[
  term ((42225260859079998122025032248741165632000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 224 for generator 28. -/
def ep_Q2_008_partial_28_0224 : Poly :=
[
  term ((84450521718159996244050064497482331264000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (6, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-42225260859079998122025032248741165632000 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (3, 1), (6, 1), (13, 2), (15, 1), (16, 1)],
  term ((84450521718159996244050064497482331264000 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (6, 1), (13, 2), (15, 2), (16, 1)],
  term ((-42225260859079998122025032248741165632000 : Rat) / 84353800925664757687870414129491527348999) [(3, 3), (6, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 224 for generator 28. -/
theorem ep_Q2_008_partial_28_0224_valid :
    mulPoly ep_Q2_008_coefficient_28_0224
        ep_Q2_008_generator_28_0200_0299 =
      ep_Q2_008_partial_28_0224 := by
  native_decide

/-- Coefficient term 225 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0225 : Poly :=
[
  term ((-59642494658654913967487239546819524298125 : Rat) / 168707601851329515375740828258983054697998) [(3, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 225 for generator 28. -/
def ep_Q2_008_partial_28_0225 : Poly :=
[
  term ((-59642494658654913967487239546819524298125 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((59642494658654913967487239546819524298125 : Rat) / 168707601851329515375740828258983054697998) [(2, 2), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((-59642494658654913967487239546819524298125 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (6, 1), (15, 2), (16, 1)],
  term ((59642494658654913967487239546819524298125 : Rat) / 168707601851329515375740828258983054697998) [(3, 3), (6, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 225 for generator 28. -/
theorem ep_Q2_008_partial_28_0225_valid :
    mulPoly ep_Q2_008_coefficient_28_0225
        ep_Q2_008_generator_28_0200_0299 =
      ep_Q2_008_partial_28_0225 := by
  native_decide

/-- Coefficient term 226 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0226 : Poly :=
[
  term ((-771775544509452000 : Rat) / 692956453614176359) [(3, 1), (7, 1), (10, 1), (12, 1), (16, 1)]
]

/-- Partial product 226 for generator 28. -/
def ep_Q2_008_partial_28_0226 : Poly :=
[
  term ((-1543551089018904000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (7, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((771775544509452000 : Rat) / 692956453614176359) [(2, 2), (3, 1), (7, 1), (10, 1), (12, 1), (16, 1)],
  term ((-1543551089018904000 : Rat) / 692956453614176359) [(3, 2), (7, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((771775544509452000 : Rat) / 692956453614176359) [(3, 3), (7, 1), (10, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 226 for generator 28. -/
theorem ep_Q2_008_partial_28_0226_valid :
    mulPoly ep_Q2_008_coefficient_28_0226
        ep_Q2_008_generator_28_0200_0299 =
      ep_Q2_008_partial_28_0226 := by
  native_decide

/-- Coefficient term 227 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0227 : Poly :=
[
  term ((-8489530989603972000 : Rat) / 692956453614176359) [(3, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 227 for generator 28. -/
def ep_Q2_008_partial_28_0227 : Poly :=
[
  term ((-16979061979207944000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (7, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((8489530989603972000 : Rat) / 692956453614176359) [(2, 2), (3, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-16979061979207944000 : Rat) / 692956453614176359) [(3, 2), (7, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((8489530989603972000 : Rat) / 692956453614176359) [(3, 3), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 227 for generator 28. -/
theorem ep_Q2_008_partial_28_0227_valid :
    mulPoly ep_Q2_008_coefficient_28_0227
        ep_Q2_008_generator_28_0200_0299 =
      ep_Q2_008_partial_28_0227 := by
  native_decide

/-- Coefficient term 228 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0228 : Poly :=
[
  term ((771775544509452000 : Rat) / 692956453614176359) [(3, 1), (7, 1), (10, 1), (16, 1)]
]

/-- Partial product 228 for generator 28. -/
def ep_Q2_008_partial_28_0228 : Poly :=
[
  term ((1543551089018904000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (7, 1), (10, 1), (14, 1), (16, 1)],
  term ((-771775544509452000 : Rat) / 692956453614176359) [(2, 2), (3, 1), (7, 1), (10, 1), (16, 1)],
  term ((1543551089018904000 : Rat) / 692956453614176359) [(3, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-771775544509452000 : Rat) / 692956453614176359) [(3, 3), (7, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 228 for generator 28. -/
theorem ep_Q2_008_partial_28_0228_valid :
    mulPoly ep_Q2_008_coefficient_28_0228
        ep_Q2_008_generator_28_0200_0299 =
      ep_Q2_008_partial_28_0228 := by
  native_decide

/-- Coefficient term 229 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0229 : Poly :=
[
  term ((-4097778927515857893794044667679356716800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 229 for generator 28. -/
def ep_Q2_008_partial_28_0229 : Poly :=
[
  term ((-8195557855031715787588089335358713433600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (7, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((4097778927515857893794044667679356716800 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (3, 1), (7, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-8195557855031715787588089335358713433600 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (7, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((4097778927515857893794044667679356716800 : Rat) / 84353800925664757687870414129491527348999) [(3, 3), (7, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 229 for generator 28. -/
theorem ep_Q2_008_partial_28_0229_valid :
    mulPoly ep_Q2_008_coefficient_28_0229
        ep_Q2_008_generator_28_0200_0299 =
      ep_Q2_008_partial_28_0229 := by
  native_decide

/-- Coefficient term 230 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0230 : Poly :=
[
  term ((-23822768568696120000 : Rat) / 692956453614176359) [(3, 1), (7, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 230 for generator 28. -/
def ep_Q2_008_partial_28_0230 : Poly :=
[
  term ((-47645537137392240000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (7, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((23822768568696120000 : Rat) / 692956453614176359) [(2, 2), (3, 1), (7, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-47645537137392240000 : Rat) / 692956453614176359) [(3, 2), (7, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((23822768568696120000 : Rat) / 692956453614176359) [(3, 3), (7, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 230 for generator 28. -/
theorem ep_Q2_008_partial_28_0230_valid :
    mulPoly ep_Q2_008_coefficient_28_0230
        ep_Q2_008_generator_28_0200_0299 =
      ep_Q2_008_partial_28_0230 := by
  native_decide

/-- Coefficient term 231 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0231 : Poly :=
[
  term ((-1972163407581095678179970936887570176000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (11, 1), (13, 3), (15, 2), (16, 1)]
]

/-- Partial product 231 for generator 28. -/
def ep_Q2_008_partial_28_0231 : Poly :=
[
  term ((-3944326815162191356359941873775140352000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 1), (11, 1), (13, 3), (14, 1), (15, 2), (16, 1)],
  term ((1972163407581095678179970936887570176000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (3, 1), (7, 1), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((-3944326815162191356359941873775140352000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 1), (11, 1), (13, 3), (15, 3), (16, 1)],
  term ((1972163407581095678179970936887570176000 : Rat) / 2908751756057405437512772901016949218931) [(3, 3), (7, 1), (11, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 231 for generator 28. -/
theorem ep_Q2_008_partial_28_0231_valid :
    mulPoly ep_Q2_008_coefficient_28_0231
        ep_Q2_008_generator_28_0200_0299 =
      ep_Q2_008_partial_28_0231 := by
  native_decide

/-- Coefficient term 232 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0232 : Poly :=
[
  term ((25891905370046625 : Rat) / 1385912907228352718) [(3, 1), (7, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 232 for generator 28. -/
def ep_Q2_008_partial_28_0232 : Poly :=
[
  term ((25891905370046625 : Rat) / 692956453614176359) [(2, 1), (3, 1), (7, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-25891905370046625 : Rat) / 1385912907228352718) [(2, 2), (3, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((25891905370046625 : Rat) / 692956453614176359) [(3, 2), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((-25891905370046625 : Rat) / 1385912907228352718) [(3, 3), (7, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 232 for generator 28. -/
theorem ep_Q2_008_partial_28_0232_valid :
    mulPoly ep_Q2_008_coefficient_28_0232
        ep_Q2_008_generator_28_0200_0299 =
      ep_Q2_008_partial_28_0232 := by
  native_decide

/-- Coefficient term 233 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0233 : Poly :=
[
  term ((-2443929962314291108885542870542246400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 233 for generator 28. -/
def ep_Q2_008_partial_28_0233 : Poly :=
[
  term ((-4887859924628582217771085741084492800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((2443929962314291108885542870542246400 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (3, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4887859924628582217771085741084492800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((2443929962314291108885542870542246400 : Rat) / 2908751756057405437512772901016949218931) [(3, 3), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 233 for generator 28. -/
theorem ep_Q2_008_partial_28_0233_valid :
    mulPoly ep_Q2_008_coefficient_28_0233
        ep_Q2_008_generator_28_0200_0299 =
      ep_Q2_008_partial_28_0233 := by
  native_decide

/-- Coefficient term 234 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0234 : Poly :=
[
  term ((-364938985264381623 : Rat) / 692956453614176359) [(3, 1), (7, 1), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 234 for generator 28. -/
def ep_Q2_008_partial_28_0234 : Poly :=
[
  term ((-729877970528763246 : Rat) / 692956453614176359) [(2, 1), (3, 1), (7, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((364938985264381623 : Rat) / 692956453614176359) [(2, 2), (3, 1), (7, 1), (12, 1), (13, 2), (16, 1)],
  term ((-729877970528763246 : Rat) / 692956453614176359) [(3, 2), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((364938985264381623 : Rat) / 692956453614176359) [(3, 3), (7, 1), (12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 234 for generator 28. -/
theorem ep_Q2_008_partial_28_0234_valid :
    mulPoly ep_Q2_008_coefficient_28_0234
        ep_Q2_008_generator_28_0200_0299 =
      ep_Q2_008_partial_28_0234 := by
  native_decide

/-- Coefficient term 235 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0235 : Poly :=
[
  term ((-7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (12, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 235 for generator 28. -/
def ep_Q2_008_partial_28_0235 : Poly :=
[
  term ((-14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 1), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (3, 1), (7, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 1), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(3, 3), (7, 1), (12, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 235 for generator 28. -/
theorem ep_Q2_008_partial_28_0235_valid :
    mulPoly ep_Q2_008_coefficient_28_0235
        ep_Q2_008_generator_28_0200_0299 =
      ep_Q2_008_partial_28_0235 := by
  native_decide

/-- Coefficient term 236 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0236 : Poly :=
[
  term ((154506451847614710653027389690915200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 236 for generator 28. -/
def ep_Q2_008_partial_28_0236 : Poly :=
[
  term ((309012903695229421306054779381830400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-154506451847614710653027389690915200 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (3, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((309012903695229421306054779381830400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 1), (12, 1), (15, 3), (16, 1)],
  term ((-154506451847614710653027389690915200 : Rat) / 2908751756057405437512772901016949218931) [(3, 3), (7, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 236 for generator 28. -/
theorem ep_Q2_008_partial_28_0236_valid :
    mulPoly ep_Q2_008_coefficient_28_0236
        ep_Q2_008_generator_28_0200_0299 =
      ep_Q2_008_partial_28_0236 := by
  native_decide

/-- Coefficient term 237 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0237 : Poly :=
[
  term ((-3467408232504942243 : Rat) / 692956453614176359) [(3, 1), (7, 1), (12, 1), (16, 1)]
]

/-- Partial product 237 for generator 28. -/
def ep_Q2_008_partial_28_0237 : Poly :=
[
  term ((-6934816465009884486 : Rat) / 692956453614176359) [(2, 1), (3, 1), (7, 1), (12, 1), (14, 1), (16, 1)],
  term ((3467408232504942243 : Rat) / 692956453614176359) [(2, 2), (3, 1), (7, 1), (12, 1), (16, 1)],
  term ((-6934816465009884486 : Rat) / 692956453614176359) [(3, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((3467408232504942243 : Rat) / 692956453614176359) [(3, 3), (7, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 237 for generator 28. -/
theorem ep_Q2_008_partial_28_0237_valid :
    mulPoly ep_Q2_008_coefficient_28_0237
        ep_Q2_008_generator_28_0200_0299 =
      ep_Q2_008_partial_28_0237 := by
  native_decide

/-- Coefficient term 238 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0238 : Poly :=
[
  term ((2597961231589460688942202163953750423154109 : Rat) / 337415203702659030751481656517966109395996) [(3, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 238 for generator 28. -/
def ep_Q2_008_partial_28_0238 : Poly :=
[
  term ((2597961231589460688942202163953750423154109 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (3, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2597961231589460688942202163953750423154109 : Rat) / 337415203702659030751481656517966109395996) [(2, 2), (3, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((2597961231589460688942202163953750423154109 : Rat) / 168707601851329515375740828258983054697998) [(3, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2597961231589460688942202163953750423154109 : Rat) / 337415203702659030751481656517966109395996) [(3, 3), (7, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 238 for generator 28. -/
theorem ep_Q2_008_partial_28_0238_valid :
    mulPoly ep_Q2_008_coefficient_28_0238
        ep_Q2_008_generator_28_0200_0299 =
      ep_Q2_008_partial_28_0238 := by
  native_decide

/-- Coefficient term 239 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0239 : Poly :=
[
  term ((748115128448986530779677617726326400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 239 for generator 28. -/
def ep_Q2_008_partial_28_0239 : Poly :=
[
  term ((1496230256897973061559355235452652800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-748115128448986530779677617726326400 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (3, 1), (7, 1), (13, 1), (15, 3), (16, 1)],
  term ((1496230256897973061559355235452652800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 1), (13, 1), (15, 4), (16, 1)],
  term ((-748115128448986530779677617726326400 : Rat) / 2908751756057405437512772901016949218931) [(3, 3), (7, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 239 for generator 28. -/
theorem ep_Q2_008_partial_28_0239_valid :
    mulPoly ep_Q2_008_coefficient_28_0239
        ep_Q2_008_generator_28_0200_0299 =
      ep_Q2_008_partial_28_0239 := by
  native_decide

/-- Coefficient term 240 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0240 : Poly :=
[
  term ((187370279015577848440484511650006777844915 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 240 for generator 28. -/
def ep_Q2_008_partial_28_0240 : Poly :=
[
  term ((374740558031155696880969023300013555689830 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (7, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-187370279015577848440484511650006777844915 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (3, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((374740558031155696880969023300013555689830 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (7, 1), (13, 2), (15, 3), (16, 1)],
  term ((-187370279015577848440484511650006777844915 : Rat) / 84353800925664757687870414129491527348999) [(3, 3), (7, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 240 for generator 28. -/
theorem ep_Q2_008_partial_28_0240_valid :
    mulPoly ep_Q2_008_coefficient_28_0240
        ep_Q2_008_generator_28_0200_0299 =
      ep_Q2_008_partial_28_0240 := by
  native_decide

/-- Coefficient term 241 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0241 : Poly :=
[
  term ((-4014328837908197853 : Rat) / 2771825814456705436) [(3, 1), (7, 1), (13, 2), (16, 1)]
]

/-- Partial product 241 for generator 28. -/
def ep_Q2_008_partial_28_0241 : Poly :=
[
  term ((-4014328837908197853 : Rat) / 1385912907228352718) [(2, 1), (3, 1), (7, 1), (13, 2), (14, 1), (16, 1)],
  term ((4014328837908197853 : Rat) / 2771825814456705436) [(2, 2), (3, 1), (7, 1), (13, 2), (16, 1)],
  term ((-4014328837908197853 : Rat) / 1385912907228352718) [(3, 2), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((4014328837908197853 : Rat) / 2771825814456705436) [(3, 3), (7, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 241 for generator 28. -/
theorem ep_Q2_008_partial_28_0241_valid :
    mulPoly ep_Q2_008_coefficient_28_0241
        ep_Q2_008_generator_28_0200_0299 =
      ep_Q2_008_partial_28_0241 := by
  native_decide

/-- Coefficient term 242 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0242 : Poly :=
[
  term ((-20277044933921951589184905712934928000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 242 for generator 28. -/
def ep_Q2_008_partial_28_0242 : Poly :=
[
  term ((-40554089867843903178369811425869856000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((20277044933921951589184905712934928000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (3, 1), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((-40554089867843903178369811425869856000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 1), (13, 3), (15, 2), (16, 1)],
  term ((20277044933921951589184905712934928000 : Rat) / 2908751756057405437512772901016949218931) [(3, 3), (7, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 242 for generator 28. -/
theorem ep_Q2_008_partial_28_0242_valid :
    mulPoly ep_Q2_008_coefficient_28_0242
        ep_Q2_008_generator_28_0200_0299 =
      ep_Q2_008_partial_28_0242 := by
  native_decide

/-- Coefficient term 243 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0243 : Poly :=
[
  term ((36867354425312639253063464932608960000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (13, 3), (15, 3), (16, 1)]
]

/-- Partial product 243 for generator 28. -/
def ep_Q2_008_partial_28_0243 : Poly :=
[
  term ((73734708850625278506126929865217920000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 1), (13, 3), (14, 1), (15, 3), (16, 1)],
  term ((-36867354425312639253063464932608960000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (3, 1), (7, 1), (13, 3), (15, 3), (16, 1)],
  term ((73734708850625278506126929865217920000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 1), (13, 3), (15, 4), (16, 1)],
  term ((-36867354425312639253063464932608960000 : Rat) / 2908751756057405437512772901016949218931) [(3, 3), (7, 1), (13, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 243 for generator 28. -/
theorem ep_Q2_008_partial_28_0243_valid :
    mulPoly ep_Q2_008_coefficient_28_0243
        ep_Q2_008_generator_28_0200_0299 =
      ep_Q2_008_partial_28_0243 := by
  native_decide

/-- Coefficient term 244 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0244 : Poly :=
[
  term ((277943290289918257532294657119649116617589 : Rat) / 337415203702659030751481656517966109395996) [(3, 1), (7, 1), (15, 2), (16, 1)]
]

/-- Partial product 244 for generator 28. -/
def ep_Q2_008_partial_28_0244 : Poly :=
[
  term ((277943290289918257532294657119649116617589 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (3, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((-277943290289918257532294657119649116617589 : Rat) / 337415203702659030751481656517966109395996) [(2, 2), (3, 1), (7, 1), (15, 2), (16, 1)],
  term ((277943290289918257532294657119649116617589 : Rat) / 168707601851329515375740828258983054697998) [(3, 2), (7, 1), (15, 3), (16, 1)],
  term ((-277943290289918257532294657119649116617589 : Rat) / 337415203702659030751481656517966109395996) [(3, 3), (7, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 244 for generator 28. -/
theorem ep_Q2_008_partial_28_0244_valid :
    mulPoly ep_Q2_008_coefficient_28_0244
        ep_Q2_008_generator_28_0200_0299 =
      ep_Q2_008_partial_28_0244 := by
  native_decide

/-- Coefficient term 245 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0245 : Poly :=
[
  term ((58721982710684932365 : Rat) / 11087303257826821744) [(3, 1), (7, 1), (16, 1)]
]

/-- Partial product 245 for generator 28. -/
def ep_Q2_008_partial_28_0245 : Poly :=
[
  term ((58721982710684932365 : Rat) / 5543651628913410872) [(2, 1), (3, 1), (7, 1), (14, 1), (16, 1)],
  term ((-58721982710684932365 : Rat) / 11087303257826821744) [(2, 2), (3, 1), (7, 1), (16, 1)],
  term ((58721982710684932365 : Rat) / 5543651628913410872) [(3, 2), (7, 1), (15, 1), (16, 1)],
  term ((-58721982710684932365 : Rat) / 11087303257826821744) [(3, 3), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 245 for generator 28. -/
theorem ep_Q2_008_partial_28_0245_valid :
    mulPoly ep_Q2_008_coefficient_28_0245
        ep_Q2_008_generator_28_0200_0299 =
      ep_Q2_008_partial_28_0245 := by
  native_decide

/-- Coefficient term 246 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0246 : Poly :=
[
  term ((-203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 246 for generator 28. -/
def ep_Q2_008_partial_28_0246 : Poly :=
[
  term ((-406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 2), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (3, 1), (7, 2), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 2), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(3, 3), (7, 2), (12, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 246 for generator 28. -/
theorem ep_Q2_008_partial_28_0246_valid :
    mulPoly ep_Q2_008_coefficient_28_0246
        ep_Q2_008_generator_28_0200_0299 =
      ep_Q2_008_partial_28_0246 := by
  native_decide

/-- Coefficient term 247 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0247 : Poly :=
[
  term ((-513771704481678257633071065506294400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 247 for generator 28. -/
def ep_Q2_008_partial_28_0247 : Poly :=
[
  term ((-1027543408963356515266142131012588800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((513771704481678257633071065506294400 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (3, 1), (7, 2), (12, 1), (15, 1), (16, 1)],
  term ((-1027543408963356515266142131012588800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 2), (12, 1), (15, 2), (16, 1)],
  term ((513771704481678257633071065506294400 : Rat) / 2908751756057405437512772901016949218931) [(3, 3), (7, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 247 for generator 28. -/
theorem ep_Q2_008_partial_28_0247_valid :
    mulPoly ep_Q2_008_coefficient_28_0247
        ep_Q2_008_generator_28_0200_0299 =
      ep_Q2_008_partial_28_0247 := by
  native_decide

/-- Coefficient term 248 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0248 : Poly :=
[
  term ((-815806361829355699530030226567516800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 248 for generator 28. -/
def ep_Q2_008_partial_28_0248 : Poly :=
[
  term ((-1631612723658711399060060453135033600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((815806361829355699530030226567516800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (3, 1), (7, 2), (13, 1), (15, 2), (16, 1)],
  term ((-1631612723658711399060060453135033600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 2), (13, 1), (15, 3), (16, 1)],
  term ((815806361829355699530030226567516800 : Rat) / 2908751756057405437512772901016949218931) [(3, 3), (7, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 248 for generator 28. -/
theorem ep_Q2_008_partial_28_0248_valid :
    mulPoly ep_Q2_008_coefficient_28_0248
        ep_Q2_008_generator_28_0200_0299 =
      ep_Q2_008_partial_28_0248 := by
  native_decide

/-- Coefficient term 249 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0249 : Poly :=
[
  term ((-222136866292773446557354293949754632481715 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 2), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 249 for generator 28. -/
def ep_Q2_008_partial_28_0249 : Poly :=
[
  term ((-444273732585546893114708587899509264963430 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (7, 2), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((222136866292773446557354293949754632481715 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (3, 1), (7, 2), (13, 2), (15, 1), (16, 1)],
  term ((-444273732585546893114708587899509264963430 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (7, 2), (13, 2), (15, 2), (16, 1)],
  term ((222136866292773446557354293949754632481715 : Rat) / 84353800925664757687870414129491527348999) [(3, 3), (7, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 249 for generator 28. -/
theorem ep_Q2_008_partial_28_0249_valid :
    mulPoly ep_Q2_008_coefficient_28_0249
        ep_Q2_008_generator_28_0200_0299 =
      ep_Q2_008_partial_28_0249 := by
  native_decide

/-- Coefficient term 250 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0250 : Poly :=
[
  term ((1015368500705537531255289132617856000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (13, 2), (15, 3), (16, 1)]
]

/-- Partial product 250 for generator 28. -/
def ep_Q2_008_partial_28_0250 : Poly :=
[
  term ((2030737001411075062510578265235712000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 2), (13, 2), (14, 1), (15, 3), (16, 1)],
  term ((-1015368500705537531255289132617856000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (3, 1), (7, 2), (13, 2), (15, 3), (16, 1)],
  term ((2030737001411075062510578265235712000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 2), (13, 2), (15, 4), (16, 1)],
  term ((-1015368500705537531255289132617856000 : Rat) / 2908751756057405437512772901016949218931) [(3, 3), (7, 2), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 250 for generator 28. -/
theorem ep_Q2_008_partial_28_0250_valid :
    mulPoly ep_Q2_008_coefficient_28_0250
        ep_Q2_008_generator_28_0200_0299 =
      ep_Q2_008_partial_28_0250 := by
  native_decide

/-- Coefficient term 251 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0251 : Poly :=
[
  term ((-36867354425312639253063464932608960000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (13, 3), (15, 2), (16, 1)]
]

/-- Partial product 251 for generator 28. -/
def ep_Q2_008_partial_28_0251 : Poly :=
[
  term ((-73734708850625278506126929865217920000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 2), (13, 3), (14, 1), (15, 2), (16, 1)],
  term ((36867354425312639253063464932608960000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (3, 1), (7, 2), (13, 3), (15, 2), (16, 1)],
  term ((-73734708850625278506126929865217920000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 2), (13, 3), (15, 3), (16, 1)],
  term ((36867354425312639253063464932608960000 : Rat) / 2908751756057405437512772901016949218931) [(3, 3), (7, 2), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 251 for generator 28. -/
theorem ep_Q2_008_partial_28_0251_valid :
    mulPoly ep_Q2_008_coefficient_28_0251
        ep_Q2_008_generator_28_0200_0299 =
      ep_Q2_008_partial_28_0251 := by
  native_decide

/-- Coefficient term 252 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0252 : Poly :=
[
  term ((-197106333352051105621400127908212675391989 : Rat) / 337415203702659030751481656517966109395996) [(3, 1), (7, 2), (15, 1), (16, 1)]
]

/-- Partial product 252 for generator 28. -/
def ep_Q2_008_partial_28_0252 : Poly :=
[
  term ((-197106333352051105621400127908212675391989 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (3, 1), (7, 2), (14, 1), (15, 1), (16, 1)],
  term ((197106333352051105621400127908212675391989 : Rat) / 337415203702659030751481656517966109395996) [(2, 2), (3, 1), (7, 2), (15, 1), (16, 1)],
  term ((-197106333352051105621400127908212675391989 : Rat) / 168707601851329515375740828258983054697998) [(3, 2), (7, 2), (15, 2), (16, 1)],
  term ((197106333352051105621400127908212675391989 : Rat) / 337415203702659030751481656517966109395996) [(3, 3), (7, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 252 for generator 28. -/
theorem ep_Q2_008_partial_28_0252_valid :
    mulPoly ep_Q2_008_coefficient_28_0252
        ep_Q2_008_generator_28_0200_0299 =
      ep_Q2_008_partial_28_0252 := by
  native_decide

/-- Coefficient term 253 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0253 : Poly :=
[
  term ((9397072573488003139965417854246400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (15, 3), (16, 1)]
]

/-- Partial product 253 for generator 28. -/
def ep_Q2_008_partial_28_0253 : Poly :=
[
  term ((18794145146976006279930835708492800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 2), (14, 1), (15, 3), (16, 1)],
  term ((-9397072573488003139965417854246400 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (3, 1), (7, 2), (15, 3), (16, 1)],
  term ((18794145146976006279930835708492800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 2), (15, 4), (16, 1)],
  term ((-9397072573488003139965417854246400 : Rat) / 2908751756057405437512772901016949218931) [(3, 3), (7, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 253 for generator 28. -/
theorem ep_Q2_008_partial_28_0253_valid :
    mulPoly ep_Q2_008_coefficient_28_0253
        ep_Q2_008_generator_28_0200_0299 =
      ep_Q2_008_partial_28_0253 := by
  native_decide

/-- Coefficient term 254 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0254 : Poly :=
[
  term ((-1015368500705537531255289132617856000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 3), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 254 for generator 28. -/
def ep_Q2_008_partial_28_0254 : Poly :=
[
  term ((-2030737001411075062510578265235712000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 3), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((1015368500705537531255289132617856000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (3, 1), (7, 3), (13, 2), (15, 2), (16, 1)],
  term ((-2030737001411075062510578265235712000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 3), (13, 2), (15, 3), (16, 1)],
  term ((1015368500705537531255289132617856000 : Rat) / 2908751756057405437512772901016949218931) [(3, 3), (7, 3), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 254 for generator 28. -/
theorem ep_Q2_008_partial_28_0254_valid :
    mulPoly ep_Q2_008_coefficient_28_0254
        ep_Q2_008_generator_28_0200_0299 =
      ep_Q2_008_partial_28_0254 := by
  native_decide

/-- Coefficient term 255 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0255 : Poly :=
[
  term ((-9397072573488003139965417854246400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 3), (15, 2), (16, 1)]
]

/-- Partial product 255 for generator 28. -/
def ep_Q2_008_partial_28_0255 : Poly :=
[
  term ((-18794145146976006279930835708492800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 3), (14, 1), (15, 2), (16, 1)],
  term ((9397072573488003139965417854246400 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (3, 1), (7, 3), (15, 2), (16, 1)],
  term ((-18794145146976006279930835708492800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 3), (15, 3), (16, 1)],
  term ((9397072573488003139965417854246400 : Rat) / 2908751756057405437512772901016949218931) [(3, 3), (7, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 255 for generator 28. -/
theorem ep_Q2_008_partial_28_0255_valid :
    mulPoly ep_Q2_008_coefficient_28_0255
        ep_Q2_008_generator_28_0200_0299 =
      ep_Q2_008_partial_28_0255 := by
  native_decide

/-- Coefficient term 256 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0256 : Poly :=
[
  term ((-14423181750135707291662327260040033405200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 256 for generator 28. -/
def ep_Q2_008_partial_28_0256 : Poly :=
[
  term ((-28846363500271414583324654520080066810400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((14423181750135707291662327260040033405200 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (3, 1), (9, 1), (15, 2), (16, 1)],
  term ((-28846363500271414583324654520080066810400 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (9, 1), (15, 3), (16, 1)],
  term ((14423181750135707291662327260040033405200 : Rat) / 84353800925664757687870414129491527348999) [(3, 3), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 256 for generator 28. -/
theorem ep_Q2_008_partial_28_0256_valid :
    mulPoly ep_Q2_008_coefficient_28_0256
        ep_Q2_008_generator_28_0200_0299 =
      ep_Q2_008_partial_28_0256 := by
  native_decide

/-- Coefficient term 257 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0257 : Poly :=
[
  term ((-2315326633528356000 : Rat) / 692956453614176359) [(3, 1), (10, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 257 for generator 28. -/
def ep_Q2_008_partial_28_0257 : Poly :=
[
  term ((-4630653267056712000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((2315326633528356000 : Rat) / 692956453614176359) [(2, 2), (3, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-4630653267056712000 : Rat) / 692956453614176359) [(3, 2), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((2315326633528356000 : Rat) / 692956453614176359) [(3, 3), (10, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 257 for generator 28. -/
theorem ep_Q2_008_partial_28_0257_valid :
    mulPoly ep_Q2_008_coefficient_28_0257
        ep_Q2_008_generator_28_0200_0299 =
      ep_Q2_008_partial_28_0257 := by
  native_decide

/-- Coefficient term 258 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0258 : Poly :=
[
  term ((1033750784322392355330289498980655403364000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (10, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 258 for generator 28. -/
def ep_Q2_008_partial_28_0258 : Poly :=
[
  term ((2067501568644784710660578997961310806728000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (10, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1033750784322392355330289498980655403364000 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (3, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((2067501568644784710660578997961310806728000 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((-1033750784322392355330289498980655403364000 : Rat) / 84353800925664757687870414129491527348999) [(3, 3), (10, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 258 for generator 28. -/
theorem ep_Q2_008_partial_28_0258_valid :
    mulPoly ep_Q2_008_coefficient_28_0258
        ep_Q2_008_generator_28_0200_0299 =
      ep_Q2_008_partial_28_0258 := by
  native_decide

/-- Coefficient term 259 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0259 : Poly :=
[
  term ((-4437709380929349000 : Rat) / 692956453614176359) [(3, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 259 for generator 28. -/
def ep_Q2_008_partial_28_0259 : Poly :=
[
  term ((-8875418761858698000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((4437709380929349000 : Rat) / 692956453614176359) [(2, 2), (3, 1), (10, 1), (13, 1), (16, 1)],
  term ((-8875418761858698000 : Rat) / 692956453614176359) [(3, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((4437709380929349000 : Rat) / 692956453614176359) [(3, 3), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 259 for generator 28. -/
theorem ep_Q2_008_partial_28_0259_valid :
    mulPoly ep_Q2_008_coefficient_28_0259
        ep_Q2_008_generator_28_0200_0299 =
      ep_Q2_008_partial_28_0259 := by
  native_decide

/-- Coefficient term 260 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0260 : Poly :=
[
  term ((35338844328770637459817416030000133630125 : Rat) / 168707601851329515375740828258983054697998) [(3, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 260 for generator 28. -/
def ep_Q2_008_partial_28_0260 : Poly :=
[
  term ((35338844328770637459817416030000133630125 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-35338844328770637459817416030000133630125 : Rat) / 168707601851329515375740828258983054697998) [(2, 2), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((35338844328770637459817416030000133630125 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (10, 1), (15, 2), (16, 1)],
  term ((-35338844328770637459817416030000133630125 : Rat) / 168707601851329515375740828258983054697998) [(3, 3), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 260 for generator 28. -/
theorem ep_Q2_008_partial_28_0260_valid :
    mulPoly ep_Q2_008_coefficient_28_0260
        ep_Q2_008_generator_28_0200_0299 =
      ep_Q2_008_partial_28_0260 := by
  native_decide

/-- Coefficient term 261 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0261 : Poly :=
[
  term ((-4924581848236464381587163232100850451200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 261 for generator 28. -/
def ep_Q2_008_partial_28_0261 : Poly :=
[
  term ((-9849163696472928763174326464201700902400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((4924581848236464381587163232100850451200 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (3, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-9849163696472928763174326464201700902400 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((4924581848236464381587163232100850451200 : Rat) / 84353800925664757687870414129491527348999) [(3, 3), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 261 for generator 28. -/
theorem ep_Q2_008_partial_28_0261_valid :
    mulPoly ep_Q2_008_coefficient_28_0261
        ep_Q2_008_generator_28_0200_0299 =
      ep_Q2_008_partial_28_0261 := by
  native_decide

/-- Coefficient term 262 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0262 : Poly :=
[
  term ((-4764553713739224000 : Rat) / 692956453614176359) [(3, 1), (11, 1), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 262 for generator 28. -/
def ep_Q2_008_partial_28_0262 : Poly :=
[
  term ((-9529107427478448000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (11, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((4764553713739224000 : Rat) / 692956453614176359) [(2, 2), (3, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((-9529107427478448000 : Rat) / 692956453614176359) [(3, 2), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((4764553713739224000 : Rat) / 692956453614176359) [(3, 3), (11, 1), (12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 262 for generator 28. -/
theorem ep_Q2_008_partial_28_0262_valid :
    mulPoly ep_Q2_008_coefficient_28_0262
        ep_Q2_008_generator_28_0200_0299 =
      ep_Q2_008_partial_28_0262 := by
  native_decide

/-- Coefficient term 263 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0263 : Poly :=
[
  term ((-394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 263 for generator 28. -/
def ep_Q2_008_partial_28_0263 : Poly :=
[
  term ((-788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (11, 1), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (3, 1), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (11, 1), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(3, 3), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 263 for generator 28. -/
theorem ep_Q2_008_partial_28_0263_valid :
    mulPoly ep_Q2_008_coefficient_28_0263
        ep_Q2_008_generator_28_0200_0299 =
      ep_Q2_008_partial_28_0263 := by
  native_decide

/-- Coefficient term 264 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0264 : Poly :=
[
  term ((-17037438647019067125 : Rat) / 5543651628913410872) [(3, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 264 for generator 28. -/
def ep_Q2_008_partial_28_0264 : Poly :=
[
  term ((-17037438647019067125 : Rat) / 2771825814456705436) [(2, 1), (3, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((17037438647019067125 : Rat) / 5543651628913410872) [(2, 2), (3, 1), (11, 1), (12, 1), (16, 1)],
  term ((-17037438647019067125 : Rat) / 2771825814456705436) [(3, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((17037438647019067125 : Rat) / 5543651628913410872) [(3, 3), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 264 for generator 28. -/
theorem ep_Q2_008_partial_28_0264_valid :
    mulPoly ep_Q2_008_coefficient_28_0264
        ep_Q2_008_generator_28_0200_0299 =
      ep_Q2_008_partial_28_0264 := by
  native_decide

/-- Coefficient term 265 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0265 : Poly :=
[
  term ((-192432158004964264564150087643013740092800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 265 for generator 28. -/
def ep_Q2_008_partial_28_0265 : Poly :=
[
  term ((-384864316009928529128300175286027480185600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((192432158004964264564150087643013740092800 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-384864316009928529128300175286027480185600 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((192432158004964264564150087643013740092800 : Rat) / 84353800925664757687870414129491527348999) [(3, 3), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 265 for generator 28. -/
theorem ep_Q2_008_partial_28_0265_valid :
    mulPoly ep_Q2_008_coefficient_28_0265
        ep_Q2_008_generator_28_0200_0299 =
      ep_Q2_008_partial_28_0265 := by
  native_decide

/-- Coefficient term 266 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0266 : Poly :=
[
  term ((4157495168227792917037311132093583468800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (11, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 266 for generator 28. -/
def ep_Q2_008_partial_28_0266 : Poly :=
[
  term ((8314990336455585834074622264187166937600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (11, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-4157495168227792917037311132093583468800 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (3, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((8314990336455585834074622264187166937600 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (11, 1), (13, 1), (15, 4), (16, 1)],
  term ((-4157495168227792917037311132093583468800 : Rat) / 84353800925664757687870414129491527348999) [(3, 3), (11, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 266 for generator 28. -/
theorem ep_Q2_008_partial_28_0266_valid :
    mulPoly ep_Q2_008_coefficient_28_0266
        ep_Q2_008_generator_28_0200_0299 =
      ep_Q2_008_partial_28_0266 := by
  native_decide

/-- Coefficient term 267 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0267 : Poly :=
[
  term ((2896140050903837804236256360844908575646400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (11, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 267 for generator 28. -/
def ep_Q2_008_partial_28_0267 : Poly :=
[
  term ((5792280101807675608472512721689817151292800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (11, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-2896140050903837804236256360844908575646400 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (3, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((5792280101807675608472512721689817151292800 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (11, 1), (13, 2), (15, 3), (16, 1)],
  term ((-2896140050903837804236256360844908575646400 : Rat) / 84353800925664757687870414129491527348999) [(3, 3), (11, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 267 for generator 28. -/
theorem ep_Q2_008_partial_28_0267_valid :
    mulPoly ep_Q2_008_coefficient_28_0267
        ep_Q2_008_generator_28_0200_0299 =
      ep_Q2_008_partial_28_0267 := by
  native_decide

/-- Coefficient term 268 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0268 : Poly :=
[
  term ((-13102522712782866000 : Rat) / 692956453614176359) [(3, 1), (11, 1), (13, 2), (16, 1)]
]

/-- Partial product 268 for generator 28. -/
def ep_Q2_008_partial_28_0268 : Poly :=
[
  term ((-26205045425565732000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((13102522712782866000 : Rat) / 692956453614176359) [(2, 2), (3, 1), (11, 1), (13, 2), (16, 1)],
  term ((-26205045425565732000 : Rat) / 692956453614176359) [(3, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((13102522712782866000 : Rat) / 692956453614176359) [(3, 3), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 268 for generator 28. -/
theorem ep_Q2_008_partial_28_0268_valid :
    mulPoly ep_Q2_008_coefficient_28_0268
        ep_Q2_008_generator_28_0200_0299 =
      ep_Q2_008_partial_28_0268 := by
  native_decide

/-- Coefficient term 269 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0269 : Poly :=
[
  term ((-1084689874169602622998984015288163596800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 269 for generator 28. -/
def ep_Q2_008_partial_28_0269 : Poly :=
[
  term ((-2169379748339205245997968030576327193600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (11, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((1084689874169602622998984015288163596800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (3, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((-2169379748339205245997968030576327193600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((1084689874169602622998984015288163596800 : Rat) / 2908751756057405437512772901016949218931) [(3, 3), (11, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 269 for generator 28. -/
theorem ep_Q2_008_partial_28_0269_valid :
    mulPoly ep_Q2_008_coefficient_28_0269
        ep_Q2_008_generator_28_0200_0299 =
      ep_Q2_008_partial_28_0269 := by
  native_decide

/-- Coefficient term 270 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0270 : Poly :=
[
  term ((1972163407581095678179970936887570176000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 1), (13, 3), (15, 3), (16, 1)]
]

/-- Partial product 270 for generator 28. -/
def ep_Q2_008_partial_28_0270 : Poly :=
[
  term ((3944326815162191356359941873775140352000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (11, 1), (13, 3), (14, 1), (15, 3), (16, 1)],
  term ((-1972163407581095678179970936887570176000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (3, 1), (11, 1), (13, 3), (15, 3), (16, 1)],
  term ((3944326815162191356359941873775140352000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (11, 1), (13, 3), (15, 4), (16, 1)],
  term ((-1972163407581095678179970936887570176000 : Rat) / 2908751756057405437512772901016949218931) [(3, 3), (11, 1), (13, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 270 for generator 28. -/
theorem ep_Q2_008_partial_28_0270_valid :
    mulPoly ep_Q2_008_coefficient_28_0270
        ep_Q2_008_generator_28_0200_0299 =
      ep_Q2_008_partial_28_0270 := by
  native_decide

/-- Coefficient term 271 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0271 : Poly :=
[
  term ((-7917151444575710357469357128308539670875 : Rat) / 168707601851329515375740828258983054697998) [(3, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 271 for generator 28. -/
def ep_Q2_008_partial_28_0271 : Poly :=
[
  term ((-7917151444575710357469357128308539670875 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((7917151444575710357469357128308539670875 : Rat) / 168707601851329515375740828258983054697998) [(2, 2), (3, 1), (11, 1), (15, 2), (16, 1)],
  term ((-7917151444575710357469357128308539670875 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (11, 1), (15, 3), (16, 1)],
  term ((7917151444575710357469357128308539670875 : Rat) / 168707601851329515375740828258983054697998) [(3, 3), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 271 for generator 28. -/
theorem ep_Q2_008_partial_28_0271_valid :
    mulPoly ep_Q2_008_coefficient_28_0271
        ep_Q2_008_generator_28_0200_0299 =
      ep_Q2_008_partial_28_0271 := by
  native_decide

/-- Coefficient term 272 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0272 : Poly :=
[
  term ((1875339452687916375 : Rat) / 692956453614176359) [(3, 1), (11, 1), (16, 1)]
]

/-- Partial product 272 for generator 28. -/
def ep_Q2_008_partial_28_0272 : Poly :=
[
  term ((3750678905375832750 : Rat) / 692956453614176359) [(2, 1), (3, 1), (11, 1), (14, 1), (16, 1)],
  term ((-1875339452687916375 : Rat) / 692956453614176359) [(2, 2), (3, 1), (11, 1), (16, 1)],
  term ((3750678905375832750 : Rat) / 692956453614176359) [(3, 2), (11, 1), (15, 1), (16, 1)],
  term ((-1875339452687916375 : Rat) / 692956453614176359) [(3, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 272 for generator 28. -/
theorem ep_Q2_008_partial_28_0272_valid :
    mulPoly ep_Q2_008_coefficient_28_0272
        ep_Q2_008_generator_28_0200_0299 =
      ep_Q2_008_partial_28_0272 := by
  native_decide

/-- Coefficient term 273 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0273 : Poly :=
[
  term ((-27143745778152283292393847461012160000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 273 for generator 28. -/
def ep_Q2_008_partial_28_0273 : Poly :=
[
  term ((-54287491556304566584787694922024320000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((27143745778152283292393847461012160000 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (3, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-54287491556304566584787694922024320000 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((27143745778152283292393847461012160000 : Rat) / 84353800925664757687870414129491527348999) [(3, 3), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 273 for generator 28. -/
theorem ep_Q2_008_partial_28_0273_valid :
    mulPoly ep_Q2_008_coefficient_28_0273
        ep_Q2_008_generator_28_0200_0299 =
      ep_Q2_008_partial_28_0273 := by
  native_decide

/-- Coefficient term 274 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0274 : Poly :=
[
  term ((18819211750745152989 : Rat) / 1385912907228352718) [(3, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 274 for generator 28. -/
def ep_Q2_008_partial_28_0274 : Poly :=
[
  term ((18819211750745152989 : Rat) / 692956453614176359) [(2, 1), (3, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-18819211750745152989 : Rat) / 1385912907228352718) [(2, 2), (3, 1), (12, 1), (13, 1), (16, 1)],
  term ((18819211750745152989 : Rat) / 692956453614176359) [(3, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-18819211750745152989 : Rat) / 1385912907228352718) [(3, 3), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 274 for generator 28. -/
theorem ep_Q2_008_partial_28_0274_valid :
    mulPoly ep_Q2_008_coefficient_28_0274
        ep_Q2_008_generator_28_0200_0299 =
      ep_Q2_008_partial_28_0274 := by
  native_decide

/-- Coefficient term 275 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0275 : Poly :=
[
  term ((-5114126519741021468134594787795599718400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 275 for generator 28. -/
def ep_Q2_008_partial_28_0275 : Poly :=
[
  term ((-10228253039482042936269189575591199436800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((5114126519741021468134594787795599718400 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (3, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-10228253039482042936269189575591199436800 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((5114126519741021468134594787795599718400 : Rat) / 84353800925664757687870414129491527348999) [(3, 3), (12, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 275 for generator 28. -/
theorem ep_Q2_008_partial_28_0275_valid :
    mulPoly ep_Q2_008_coefficient_28_0275
        ep_Q2_008_generator_28_0200_0299 =
      ep_Q2_008_partial_28_0275 := by
  native_decide

/-- Coefficient term 276 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0276 : Poly :=
[
  term ((-1305200776235947320391454185037592179097471 : Rat) / 337415203702659030751481656517966109395996) [(3, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 276 for generator 28. -/
def ep_Q2_008_partial_28_0276 : Poly :=
[
  term ((-1305200776235947320391454185037592179097471 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (3, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1305200776235947320391454185037592179097471 : Rat) / 337415203702659030751481656517966109395996) [(2, 2), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1305200776235947320391454185037592179097471 : Rat) / 168707601851329515375740828258983054697998) [(3, 2), (12, 1), (15, 2), (16, 1)],
  term ((1305200776235947320391454185037592179097471 : Rat) / 337415203702659030751481656517966109395996) [(3, 3), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 276 for generator 28. -/
theorem ep_Q2_008_partial_28_0276_valid :
    mulPoly ep_Q2_008_coefficient_28_0276
        ep_Q2_008_generator_28_0200_0299 =
      ep_Q2_008_partial_28_0276 := by
  native_decide

/-- Coefficient term 277 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0277 : Poly :=
[
  term ((-2689080455108298444378053722205785367310513 : Rat) / 337415203702659030751481656517966109395996) [(3, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 277 for generator 28. -/
def ep_Q2_008_partial_28_0277 : Poly :=
[
  term ((-2689080455108298444378053722205785367310513 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (3, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((2689080455108298444378053722205785367310513 : Rat) / 337415203702659030751481656517966109395996) [(2, 2), (3, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2689080455108298444378053722205785367310513 : Rat) / 168707601851329515375740828258983054697998) [(3, 2), (13, 1), (15, 3), (16, 1)],
  term ((2689080455108298444378053722205785367310513 : Rat) / 337415203702659030751481656517966109395996) [(3, 3), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 277 for generator 28. -/
theorem ep_Q2_008_partial_28_0277_valid :
    mulPoly ep_Q2_008_coefficient_28_0277
        ep_Q2_008_generator_28_0200_0299 =
      ep_Q2_008_partial_28_0277 := by
  native_decide

/-- Coefficient term 278 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0278 : Poly :=
[
  term ((-60285156349398187953 : Rat) / 11087303257826821744) [(3, 1), (13, 1), (16, 1)]
]

/-- Partial product 278 for generator 28. -/
def ep_Q2_008_partial_28_0278 : Poly :=
[
  term ((-60285156349398187953 : Rat) / 5543651628913410872) [(2, 1), (3, 1), (13, 1), (14, 1), (16, 1)],
  term ((60285156349398187953 : Rat) / 11087303257826821744) [(2, 2), (3, 1), (13, 1), (16, 1)],
  term ((-60285156349398187953 : Rat) / 5543651628913410872) [(3, 2), (13, 1), (15, 1), (16, 1)],
  term ((60285156349398187953 : Rat) / 11087303257826821744) [(3, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 278 for generator 28. -/
theorem ep_Q2_008_partial_28_0278_valid :
    mulPoly ep_Q2_008_coefficient_28_0278
        ep_Q2_008_generator_28_0200_0299 =
      ep_Q2_008_partial_28_0278 := by
  native_decide

/-- Coefficient term 279 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0279 : Poly :=
[
  term ((-22025171400539200599159593252119193616000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 279 for generator 28. -/
def ep_Q2_008_partial_28_0279 : Poly :=
[
  term ((-44050342801078401198319186504238387232000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((22025171400539200599159593252119193616000 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (3, 1), (13, 2), (15, 1), (16, 1)],
  term ((-44050342801078401198319186504238387232000 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (13, 2), (15, 2), (16, 1)],
  term ((22025171400539200599159593252119193616000 : Rat) / 84353800925664757687870414129491527348999) [(3, 3), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 279 for generator 28. -/
theorem ep_Q2_008_partial_28_0279_valid :
    mulPoly ep_Q2_008_coefficient_28_0279
        ep_Q2_008_generator_28_0200_0299 =
      ep_Q2_008_partial_28_0279 := by
  native_decide

/-- Coefficient term 280 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0280 : Poly :=
[
  term ((34679115264387073690690337739212889177600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (13, 2), (15, 3), (16, 1)]
]

/-- Partial product 280 for generator 28. -/
def ep_Q2_008_partial_28_0280 : Poly :=
[
  term ((69358230528774147381380675478425778355200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (13, 2), (14, 1), (15, 3), (16, 1)],
  term ((-34679115264387073690690337739212889177600 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (3, 1), (13, 2), (15, 3), (16, 1)],
  term ((69358230528774147381380675478425778355200 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (13, 2), (15, 4), (16, 1)],
  term ((-34679115264387073690690337739212889177600 : Rat) / 84353800925664757687870414129491527348999) [(3, 3), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 280 for generator 28. -/
theorem ep_Q2_008_partial_28_0280_valid :
    mulPoly ep_Q2_008_coefficient_28_0280
        ep_Q2_008_generator_28_0200_0299 =
      ep_Q2_008_partial_28_0280 := by
  native_decide

/-- Coefficient term 281 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0281 : Poly :=
[
  term ((1809321583903802516182885454533563548643745 : Rat) / 674830407405318061502963313035932218791992) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 281 for generator 28. -/
def ep_Q2_008_partial_28_0281 : Poly :=
[
  term ((1809321583903802516182885454533563548643745 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1809321583903802516182885454533563548643745 : Rat) / 674830407405318061502963313035932218791992) [(2, 2), (3, 1), (15, 1), (16, 1)],
  term ((1809321583903802516182885454533563548643745 : Rat) / 337415203702659030751481656517966109395996) [(3, 2), (15, 2), (16, 1)],
  term ((-1809321583903802516182885454533563548643745 : Rat) / 674830407405318061502963313035932218791992) [(3, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 281 for generator 28. -/
theorem ep_Q2_008_partial_28_0281_valid :
    mulPoly ep_Q2_008_coefficient_28_0281
        ep_Q2_008_generator_28_0200_0299 =
      ep_Q2_008_partial_28_0281 := by
  native_decide

/-- Coefficient term 282 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0282 : Poly :=
[
  term ((-20196228687940276989083986479503878576800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (15, 3), (16, 1)]
]

/-- Partial product 282 for generator 28. -/
def ep_Q2_008_partial_28_0282 : Poly :=
[
  term ((-40392457375880553978167972959007757153600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (14, 1), (15, 3), (16, 1)],
  term ((20196228687940276989083986479503878576800 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (3, 1), (15, 3), (16, 1)],
  term ((-40392457375880553978167972959007757153600 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (15, 4), (16, 1)],
  term ((20196228687940276989083986479503878576800 : Rat) / 84353800925664757687870414129491527348999) [(3, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 282 for generator 28. -/
theorem ep_Q2_008_partial_28_0282_valid :
    mulPoly ep_Q2_008_coefficient_28_0282
        ep_Q2_008_generator_28_0200_0299 =
      ep_Q2_008_partial_28_0282 := by
  native_decide

/-- Coefficient term 283 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0283 : Poly :=
[
  term ((-32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 283 for generator 28. -/
def ep_Q2_008_partial_28_0283 : Poly :=
[
  term ((-64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (5, 1), (7, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (5, 1), (7, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (5, 1), (7, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (5, 1), (7, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 283 for generator 28. -/
theorem ep_Q2_008_partial_28_0283_valid :
    mulPoly ep_Q2_008_coefficient_28_0283
        ep_Q2_008_generator_28_0200_0299 =
      ep_Q2_008_partial_28_0283 := by
  native_decide

/-- Coefficient term 284 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0284 : Poly :=
[
  term ((-64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 284 for generator 28. -/
def ep_Q2_008_partial_28_0284 : Poly :=
[
  term ((-129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (5, 1), (7, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (5, 1), (7, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (5, 1), (7, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (5, 1), (7, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 284 for generator 28. -/
theorem ep_Q2_008_partial_28_0284_valid :
    mulPoly ep_Q2_008_coefficient_28_0284
        ep_Q2_008_generator_28_0200_0299 =
      ep_Q2_008_partial_28_0284 := by
  native_decide

/-- Coefficient term 285 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0285 : Poly :=
[
  term ((32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 285 for generator 28. -/
def ep_Q2_008_partial_28_0285 : Poly :=
[
  term ((64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (5, 1), (7, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (5, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((-32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (5, 1), (7, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 285 for generator 28. -/
theorem ep_Q2_008_partial_28_0285_valid :
    mulPoly ep_Q2_008_coefficient_28_0285
        ep_Q2_008_generator_28_0200_0299 =
      ep_Q2_008_partial_28_0285 := by
  native_decide

/-- Coefficient term 286 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0286 : Poly :=
[
  term ((32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 286 for generator 28. -/
def ep_Q2_008_partial_28_0286 : Poly :=
[
  term ((64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (5, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (5, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (5, 1), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (5, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 286 for generator 28. -/
theorem ep_Q2_008_partial_28_0286_valid :
    mulPoly ep_Q2_008_coefficient_28_0286
        ep_Q2_008_generator_28_0200_0299 =
      ep_Q2_008_partial_28_0286 := by
  native_decide

/-- Coefficient term 287 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0287 : Poly :=
[
  term ((-79727025473060106869448717095769600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 287 for generator 28. -/
def ep_Q2_008_partial_28_0287 : Poly :=
[
  term ((-159454050946120213738897434191539200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (5, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((79727025473060106869448717095769600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-159454050946120213738897434191539200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (5, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((79727025473060106869448717095769600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 287 for generator 28. -/
theorem ep_Q2_008_partial_28_0287_valid :
    mulPoly ep_Q2_008_coefficient_28_0287
        ep_Q2_008_generator_28_0200_0299 =
      ep_Q2_008_partial_28_0287 := by
  native_decide

/-- Coefficient term 288 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0288 : Poly :=
[
  term ((-2968882567615857312948042703280563200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 288 for generator 28. -/
def ep_Q2_008_partial_28_0288 : Poly :=
[
  term ((-5937765135231714625896085406561126400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (5, 1), (7, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((2968882567615857312948042703280563200 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (5, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((-5937765135231714625896085406561126400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (5, 1), (7, 1), (13, 2), (15, 3), (16, 1)],
  term ((2968882567615857312948042703280563200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (5, 1), (7, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 288 for generator 28. -/
theorem ep_Q2_008_partial_28_0288_valid :
    mulPoly ep_Q2_008_coefficient_28_0288
        ep_Q2_008_generator_28_0200_0299 =
      ep_Q2_008_partial_28_0288 := by
  native_decide

/-- Coefficient term 289 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0289 : Poly :=
[
  term ((-129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 289 for generator 28. -/
def ep_Q2_008_partial_28_0289 : Poly :=
[
  term ((-258163701531813679386786322024396800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (5, 1), (7, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (5, 1), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((-258163701531813679386786322024396800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (5, 1), (7, 1), (13, 3), (15, 2), (16, 1)],
  term ((129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (5, 1), (7, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 289 for generator 28. -/
theorem ep_Q2_008_partial_28_0289_valid :
    mulPoly ep_Q2_008_coefficient_28_0289
        ep_Q2_008_generator_28_0200_0299 =
      ep_Q2_008_partial_28_0289 := by
  native_decide

/-- Coefficient term 290 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0290 : Poly :=
[
  term ((13287837578843351144908119515961600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (15, 2), (16, 1)]
]

/-- Partial product 290 for generator 28. -/
def ep_Q2_008_partial_28_0290 : Poly :=
[
  term ((26575675157686702289816239031923200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (5, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((-13287837578843351144908119515961600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((26575675157686702289816239031923200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (5, 1), (7, 1), (15, 3), (16, 1)],
  term ((-13287837578843351144908119515961600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (5, 1), (7, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 290 for generator 28. -/
theorem ep_Q2_008_partial_28_0290_valid :
    mulPoly ep_Q2_008_coefficient_28_0290
        ep_Q2_008_generator_28_0200_0299 =
      ep_Q2_008_partial_28_0290 := by
  native_decide

/-- Coefficient term 291 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0291 : Poly :=
[
  term ((43926043926967546635 : Rat) / 5543651628913410872) [(4, 1), (5, 1), (9, 1), (16, 1)]
]

/-- Partial product 291 for generator 28. -/
def ep_Q2_008_partial_28_0291 : Poly :=
[
  term ((43926043926967546635 : Rat) / 2771825814456705436) [(2, 1), (4, 1), (5, 1), (9, 1), (14, 1), (16, 1)],
  term ((-43926043926967546635 : Rat) / 5543651628913410872) [(2, 2), (4, 1), (5, 1), (9, 1), (16, 1)],
  term ((43926043926967546635 : Rat) / 2771825814456705436) [(3, 1), (4, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((-43926043926967546635 : Rat) / 5543651628913410872) [(3, 2), (4, 1), (5, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 291 for generator 28. -/
theorem ep_Q2_008_partial_28_0291_valid :
    mulPoly ep_Q2_008_coefficient_28_0291
        ep_Q2_008_generator_28_0200_0299 =
      ep_Q2_008_partial_28_0291 := by
  native_decide

/-- Coefficient term 292 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0292 : Poly :=
[
  term ((-87013982558013166610924208563412000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 292 for generator 28. -/
def ep_Q2_008_partial_28_0292 : Poly :=
[
  term ((-174027965116026333221848417126824000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (5, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((87013982558013166610924208563412000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((-174027965116026333221848417126824000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (5, 1), (10, 1), (15, 2), (16, 1)],
  term ((87013982558013166610924208563412000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (5, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 292 for generator 28. -/
theorem ep_Q2_008_partial_28_0292_valid :
    mulPoly ep_Q2_008_coefficient_28_0292
        ep_Q2_008_generator_28_0200_0299 =
      ep_Q2_008_partial_28_0292 := by
  native_decide

/-- Coefficient term 293 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0293 : Poly :=
[
  term ((-5381986129252263987 : Rat) / 692956453614176359) [(4, 1), (5, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 293 for generator 28. -/
def ep_Q2_008_partial_28_0293 : Poly :=
[
  term ((-10763972258504527974 : Rat) / 692956453614176359) [(2, 1), (4, 1), (5, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((5381986129252263987 : Rat) / 692956453614176359) [(2, 2), (4, 1), (5, 1), (11, 1), (12, 1), (16, 1)],
  term ((-10763972258504527974 : Rat) / 692956453614176359) [(3, 1), (4, 1), (5, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((5381986129252263987 : Rat) / 692956453614176359) [(3, 2), (4, 1), (5, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 293 for generator 28. -/
theorem ep_Q2_008_partial_28_0293_valid :
    mulPoly ep_Q2_008_coefficient_28_0293
        ep_Q2_008_generator_28_0200_0299 =
      ep_Q2_008_partial_28_0293 := by
  native_decide

/-- Coefficient term 294 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0294 : Poly :=
[
  term ((-10763972258504527974 : Rat) / 692956453614176359) [(4, 1), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 294 for generator 28. -/
def ep_Q2_008_partial_28_0294 : Poly :=
[
  term ((-21527944517009055948 : Rat) / 692956453614176359) [(2, 1), (4, 1), (5, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((10763972258504527974 : Rat) / 692956453614176359) [(2, 2), (4, 1), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-21527944517009055948 : Rat) / 692956453614176359) [(3, 1), (4, 1), (5, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((10763972258504527974 : Rat) / 692956453614176359) [(3, 2), (4, 1), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 294 for generator 28. -/
theorem ep_Q2_008_partial_28_0294_valid :
    mulPoly ep_Q2_008_coefficient_28_0294
        ep_Q2_008_generator_28_0200_0299 =
      ep_Q2_008_partial_28_0294 := by
  native_decide

/-- Coefficient term 295 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0295 : Poly :=
[
  term ((-34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 295 for generator 28. -/
def ep_Q2_008_partial_28_0295 : Poly :=
[
  term ((-69611186046410533288739366850729600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (5, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (5, 1), (11, 1), (15, 2), (16, 1)],
  term ((-69611186046410533288739366850729600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (5, 1), (11, 1), (15, 3), (16, 1)],
  term ((34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (5, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 295 for generator 28. -/
theorem ep_Q2_008_partial_28_0295_valid :
    mulPoly ep_Q2_008_coefficient_28_0295
        ep_Q2_008_generator_28_0200_0299 =
      ep_Q2_008_partial_28_0295 := by
  native_decide

/-- Coefficient term 296 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0296 : Poly :=
[
  term ((5381986129252263987 : Rat) / 692956453614176359) [(4, 1), (5, 1), (11, 1), (16, 1)]
]

/-- Partial product 296 for generator 28. -/
def ep_Q2_008_partial_28_0296 : Poly :=
[
  term ((10763972258504527974 : Rat) / 692956453614176359) [(2, 1), (4, 1), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((-5381986129252263987 : Rat) / 692956453614176359) [(2, 2), (4, 1), (5, 1), (11, 1), (16, 1)],
  term ((10763972258504527974 : Rat) / 692956453614176359) [(3, 1), (4, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((-5381986129252263987 : Rat) / 692956453614176359) [(3, 2), (4, 1), (5, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 296 for generator 28. -/
theorem ep_Q2_008_partial_28_0296_valid :
    mulPoly ep_Q2_008_coefficient_28_0296
        ep_Q2_008_generator_28_0200_0299 =
      ep_Q2_008_partial_28_0296 := by
  native_decide

/-- Coefficient term 297 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0297 : Poly :=
[
  term ((5381986129252263987 : Rat) / 692956453614176359) [(4, 1), (5, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 297 for generator 28. -/
def ep_Q2_008_partial_28_0297 : Poly :=
[
  term ((10763972258504527974 : Rat) / 692956453614176359) [(2, 1), (4, 1), (5, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-5381986129252263987 : Rat) / 692956453614176359) [(2, 2), (4, 1), (5, 1), (12, 1), (13, 1), (16, 1)],
  term ((10763972258504527974 : Rat) / 692956453614176359) [(3, 1), (4, 1), (5, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5381986129252263987 : Rat) / 692956453614176359) [(3, 2), (4, 1), (5, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 297 for generator 28. -/
theorem ep_Q2_008_partial_28_0297_valid :
    mulPoly ep_Q2_008_coefficient_28_0297
        ep_Q2_008_generator_28_0200_0299 =
      ep_Q2_008_partial_28_0297 := by
  native_decide

/-- Coefficient term 298 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0298 : Poly :=
[
  term ((-17402796511602633322184841712682400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 298 for generator 28. -/
def ep_Q2_008_partial_28_0298 : Poly :=
[
  term ((-34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((17402796511602633322184841712682400 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (5, 1), (12, 1), (15, 2), (16, 1)],
  term ((17402796511602633322184841712682400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (5, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 298 for generator 28. -/
theorem ep_Q2_008_partial_28_0298_valid :
    mulPoly ep_Q2_008_coefficient_28_0298
        ep_Q2_008_generator_28_0200_0299 =
      ep_Q2_008_partial_28_0298 := by
  native_decide

/-- Coefficient term 299 from coefficient polynomial 28. -/
def ep_Q2_008_coefficient_28_0299 : Poly :=
[
  term ((34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 299 for generator 28. -/
def ep_Q2_008_partial_28_0299 : Poly :=
[
  term ((69611186046410533288739366850729600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (5, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (5, 1), (13, 1), (15, 2), (16, 1)],
  term ((69611186046410533288739366850729600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (5, 1), (13, 1), (15, 3), (16, 1)],
  term ((-34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (5, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 299 for generator 28. -/
theorem ep_Q2_008_partial_28_0299_valid :
    mulPoly ep_Q2_008_coefficient_28_0299
        ep_Q2_008_generator_28_0200_0299 =
      ep_Q2_008_partial_28_0299 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_008_partials_28_0200_0299 : List Poly :=
[
  ep_Q2_008_partial_28_0200,
  ep_Q2_008_partial_28_0201,
  ep_Q2_008_partial_28_0202,
  ep_Q2_008_partial_28_0203,
  ep_Q2_008_partial_28_0204,
  ep_Q2_008_partial_28_0205,
  ep_Q2_008_partial_28_0206,
  ep_Q2_008_partial_28_0207,
  ep_Q2_008_partial_28_0208,
  ep_Q2_008_partial_28_0209,
  ep_Q2_008_partial_28_0210,
  ep_Q2_008_partial_28_0211,
  ep_Q2_008_partial_28_0212,
  ep_Q2_008_partial_28_0213,
  ep_Q2_008_partial_28_0214,
  ep_Q2_008_partial_28_0215,
  ep_Q2_008_partial_28_0216,
  ep_Q2_008_partial_28_0217,
  ep_Q2_008_partial_28_0218,
  ep_Q2_008_partial_28_0219,
  ep_Q2_008_partial_28_0220,
  ep_Q2_008_partial_28_0221,
  ep_Q2_008_partial_28_0222,
  ep_Q2_008_partial_28_0223,
  ep_Q2_008_partial_28_0224,
  ep_Q2_008_partial_28_0225,
  ep_Q2_008_partial_28_0226,
  ep_Q2_008_partial_28_0227,
  ep_Q2_008_partial_28_0228,
  ep_Q2_008_partial_28_0229,
  ep_Q2_008_partial_28_0230,
  ep_Q2_008_partial_28_0231,
  ep_Q2_008_partial_28_0232,
  ep_Q2_008_partial_28_0233,
  ep_Q2_008_partial_28_0234,
  ep_Q2_008_partial_28_0235,
  ep_Q2_008_partial_28_0236,
  ep_Q2_008_partial_28_0237,
  ep_Q2_008_partial_28_0238,
  ep_Q2_008_partial_28_0239,
  ep_Q2_008_partial_28_0240,
  ep_Q2_008_partial_28_0241,
  ep_Q2_008_partial_28_0242,
  ep_Q2_008_partial_28_0243,
  ep_Q2_008_partial_28_0244,
  ep_Q2_008_partial_28_0245,
  ep_Q2_008_partial_28_0246,
  ep_Q2_008_partial_28_0247,
  ep_Q2_008_partial_28_0248,
  ep_Q2_008_partial_28_0249,
  ep_Q2_008_partial_28_0250,
  ep_Q2_008_partial_28_0251,
  ep_Q2_008_partial_28_0252,
  ep_Q2_008_partial_28_0253,
  ep_Q2_008_partial_28_0254,
  ep_Q2_008_partial_28_0255,
  ep_Q2_008_partial_28_0256,
  ep_Q2_008_partial_28_0257,
  ep_Q2_008_partial_28_0258,
  ep_Q2_008_partial_28_0259,
  ep_Q2_008_partial_28_0260,
  ep_Q2_008_partial_28_0261,
  ep_Q2_008_partial_28_0262,
  ep_Q2_008_partial_28_0263,
  ep_Q2_008_partial_28_0264,
  ep_Q2_008_partial_28_0265,
  ep_Q2_008_partial_28_0266,
  ep_Q2_008_partial_28_0267,
  ep_Q2_008_partial_28_0268,
  ep_Q2_008_partial_28_0269,
  ep_Q2_008_partial_28_0270,
  ep_Q2_008_partial_28_0271,
  ep_Q2_008_partial_28_0272,
  ep_Q2_008_partial_28_0273,
  ep_Q2_008_partial_28_0274,
  ep_Q2_008_partial_28_0275,
  ep_Q2_008_partial_28_0276,
  ep_Q2_008_partial_28_0277,
  ep_Q2_008_partial_28_0278,
  ep_Q2_008_partial_28_0279,
  ep_Q2_008_partial_28_0280,
  ep_Q2_008_partial_28_0281,
  ep_Q2_008_partial_28_0282,
  ep_Q2_008_partial_28_0283,
  ep_Q2_008_partial_28_0284,
  ep_Q2_008_partial_28_0285,
  ep_Q2_008_partial_28_0286,
  ep_Q2_008_partial_28_0287,
  ep_Q2_008_partial_28_0288,
  ep_Q2_008_partial_28_0289,
  ep_Q2_008_partial_28_0290,
  ep_Q2_008_partial_28_0291,
  ep_Q2_008_partial_28_0292,
  ep_Q2_008_partial_28_0293,
  ep_Q2_008_partial_28_0294,
  ep_Q2_008_partial_28_0295,
  ep_Q2_008_partial_28_0296,
  ep_Q2_008_partial_28_0297,
  ep_Q2_008_partial_28_0298,
  ep_Q2_008_partial_28_0299
]

/-- Sum of partial products in this block. -/
def ep_Q2_008_block_28_0200_0299 : Poly :=
[
  term ((166741629986610000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (5, 1), (11, 2), (14, 1), (16, 1)],
  term ((43055889034018111896 : Rat) / 692956453614176359) [(2, 1), (3, 1), (5, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((16248129776659487595 : Rat) / 1385912907228352718) [(2, 1), (3, 1), (5, 1), (12, 1), (14, 1), (16, 1)],
  term ((4209364481888006753262652120648845609900125 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (5, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-215279445170090559480 : Rat) / 692956453614176359) [(2, 1), (3, 1), (5, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((102413353796019575016 : Rat) / 692956453614176359) [(2, 1), (3, 1), (5, 1), (13, 2), (14, 1), (16, 1)],
  term ((-2104639235181182094975540307520976395808377 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (3, 1), (5, 1), (14, 1), (15, 2), (16, 1)],
  term ((-12935031557573321989 : Rat) / 5543651628913410872) [(2, 1), (3, 1), (5, 1), (14, 1), (16, 1)],
  term ((1811025456682476261301821400176028800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (6, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((4744206808436961099 : Rat) / 692956453614176359) [(2, 1), (3, 1), (6, 1), (7, 1), (13, 2), (14, 1), (16, 1)],
  term ((95855121505812862057965008824783296000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (6, 1), (7, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((1619646487561852949 : Rat) / 2771825814456705436) [(2, 1), (3, 1), (6, 1), (7, 1), (14, 1), (16, 1)],
  term ((2639958101834397581263751744806425600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (6, 1), (7, 2), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((9397072573488003139965417854246400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (6, 1), (7, 2), (14, 1), (15, 1), (16, 1)],
  term ((78173987841078575882094280687715020800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (6, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-140649573864425400 : Rat) / 692956453614176359) [(2, 1), (3, 1), (6, 1), (9, 1), (14, 1), (16, 1)],
  term ((23925041879793012000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (6, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((8784045273428755535856702345424899436800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (6, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((61939198278609912000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (6, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((5127624859710848763267924435907682457600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (6, 1), (11, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-542192667164935875 : Rat) / 1385912907228352718) [(2, 1), (3, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((29327821641473002659950472153931830364800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (6, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-9771748480134821985261785085964377600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (6, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-91573751732049538353 : Rat) / 2771825814456705436) [(2, 1), (3, 1), (6, 1), (13, 1), (14, 1), (16, 1)],
  term ((84450521718159996244050064497482331264000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (6, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-59642494658654913967487239546819524298125 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1543551089018904000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (7, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-16979061979207944000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (7, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1543551089018904000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (7, 1), (10, 1), (14, 1), (16, 1)],
  term ((-8195557855031715787588089335358713433600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (7, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-47645537137392240000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (7, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-3944326815162191356359941873775140352000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 1), (11, 1), (13, 3), (14, 1), (15, 2), (16, 1)],
  term ((25891905370046625 : Rat) / 692956453614176359) [(2, 1), (3, 1), (7, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4887859924628582217771085741084492800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-729877970528763246 : Rat) / 692956453614176359) [(2, 1), (3, 1), (7, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 1), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((309012903695229421306054779381830400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-6934816465009884486 : Rat) / 692956453614176359) [(2, 1), (3, 1), (7, 1), (12, 1), (14, 1), (16, 1)],
  term ((2597961231589460688942202163953750423154109 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (3, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1496230256897973061559355235452652800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((374740558031155696880969023300013555689830 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (7, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-4014328837908197853 : Rat) / 1385912907228352718) [(2, 1), (3, 1), (7, 1), (13, 2), (14, 1), (16, 1)],
  term ((-40554089867843903178369811425869856000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((73734708850625278506126929865217920000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 1), (13, 3), (14, 1), (15, 3), (16, 1)],
  term ((277943290289918257532294657119649116617589 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (3, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((58721982710684932365 : Rat) / 5543651628913410872) [(2, 1), (3, 1), (7, 1), (14, 1), (16, 1)],
  term ((-406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 2), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1027543408963356515266142131012588800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1631612723658711399060060453135033600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-444273732585546893114708587899509264963430 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (7, 2), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((2030737001411075062510578265235712000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 2), (13, 2), (14, 1), (15, 3), (16, 1)],
  term ((-73734708850625278506126929865217920000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 2), (13, 3), (14, 1), (15, 2), (16, 1)],
  term ((-197106333352051105621400127908212675391989 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (3, 1), (7, 2), (14, 1), (15, 1), (16, 1)],
  term ((18794145146976006279930835708492800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 2), (14, 1), (15, 3), (16, 1)],
  term ((-2030737001411075062510578265235712000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 3), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-18794145146976006279930835708492800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (7, 3), (14, 1), (15, 2), (16, 1)],
  term ((-28846363500271414583324654520080066810400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-4630653267056712000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((2067501568644784710660578997961310806728000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (10, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-8875418761858698000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((35338844328770637459817416030000133630125 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-9849163696472928763174326464201700902400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-9529107427478448000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (11, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (11, 1), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-17037438647019067125 : Rat) / 2771825814456705436) [(2, 1), (3, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-384864316009928529128300175286027480185600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((8314990336455585834074622264187166937600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (11, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((5792280101807675608472512721689817151292800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (11, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-26205045425565732000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-2169379748339205245997968030576327193600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (11, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((3944326815162191356359941873775140352000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (11, 1), (13, 3), (14, 1), (15, 3), (16, 1)],
  term ((-7917151444575710357469357128308539670875 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((3750678905375832750 : Rat) / 692956453614176359) [(2, 1), (3, 1), (11, 1), (14, 1), (16, 1)],
  term ((-54287491556304566584787694922024320000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((18819211750745152989 : Rat) / 692956453614176359) [(2, 1), (3, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-10228253039482042936269189575591199436800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1305200776235947320391454185037592179097471 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (3, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2689080455108298444378053722205785367310513 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (3, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-60285156349398187953 : Rat) / 5543651628913410872) [(2, 1), (3, 1), (13, 1), (14, 1), (16, 1)],
  term ((-44050342801078401198319186504238387232000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((69358230528774147381380675478425778355200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (13, 2), (14, 1), (15, 3), (16, 1)],
  term ((1809321583903802516182885454533563548643745 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((-40392457375880553978167972959007757153600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (14, 1), (15, 3), (16, 1)],
  term ((-64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (5, 1), (7, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (5, 1), (7, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (5, 1), (7, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (5, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-159454050946120213738897434191539200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (5, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5937765135231714625896085406561126400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (5, 1), (7, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-258163701531813679386786322024396800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (5, 1), (7, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((26575675157686702289816239031923200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (5, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((43926043926967546635 : Rat) / 2771825814456705436) [(2, 1), (4, 1), (5, 1), (9, 1), (14, 1), (16, 1)],
  term ((-174027965116026333221848417126824000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (5, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-10763972258504527974 : Rat) / 692956453614176359) [(2, 1), (4, 1), (5, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-21527944517009055948 : Rat) / 692956453614176359) [(2, 1), (4, 1), (5, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-69611186046410533288739366850729600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (5, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((10763972258504527974 : Rat) / 692956453614176359) [(2, 1), (4, 1), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((10763972258504527974 : Rat) / 692956453614176359) [(2, 1), (4, 1), (5, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((69611186046410533288739366850729600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (4, 1), (5, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-83370814993305000 : Rat) / 692956453614176359) [(2, 2), (3, 1), (5, 1), (11, 2), (16, 1)],
  term ((-21527944517009055948 : Rat) / 692956453614176359) [(2, 2), (3, 1), (5, 1), (12, 1), (13, 2), (16, 1)],
  term ((-16248129776659487595 : Rat) / 2771825814456705436) [(2, 2), (3, 1), (5, 1), (12, 1), (16, 1)],
  term ((-4209364481888006753262652120648845609900125 : Rat) / 168707601851329515375740828258983054697998) [(2, 2), (3, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((107639722585045279740 : Rat) / 692956453614176359) [(2, 2), (3, 1), (5, 1), (13, 2), (15, 2), (16, 1)],
  term ((-51206676898009787508 : Rat) / 692956453614176359) [(2, 2), (3, 1), (5, 1), (13, 2), (16, 1)],
  term ((2104639235181182094975540307520976395808377 : Rat) / 337415203702659030751481656517966109395996) [(2, 2), (3, 1), (5, 1), (15, 2), (16, 1)],
  term ((12935031557573321989 : Rat) / 11087303257826821744) [(2, 2), (3, 1), (5, 1), (16, 1)],
  term ((-905512728341238130650910700088014400 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (3, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4744206808436961099 : Rat) / 1385912907228352718) [(2, 2), (3, 1), (6, 1), (7, 1), (13, 2), (16, 1)],
  term ((-47927560752906431028982504412391648000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (3, 1), (6, 1), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((-1619646487561852949 : Rat) / 5543651628913410872) [(2, 2), (3, 1), (6, 1), (7, 1), (16, 1)],
  term ((-1319979050917198790631875872403212800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (3, 1), (6, 1), (7, 2), (13, 2), (15, 1), (16, 1)],
  term ((-4698536286744001569982708927123200 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (3, 1), (6, 1), (7, 2), (15, 1), (16, 1)],
  term ((-39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (3, 1), (6, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((70324786932212700 : Rat) / 692956453614176359) [(2, 2), (3, 1), (6, 1), (9, 1), (16, 1)],
  term ((-11962520939896506000 : Rat) / 692956453614176359) [(2, 2), (3, 1), (6, 1), (10, 1), (13, 1), (16, 1)],
  term ((-4392022636714377767928351172712449718400 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (3, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-30969599139304956000 : Rat) / 692956453614176359) [(2, 2), (3, 1), (6, 1), (11, 1), (13, 2), (16, 1)],
  term ((-2563812429855424381633962217953841228800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (3, 1), (6, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((542192667164935875 : Rat) / 2771825814456705436) [(2, 2), (3, 1), (6, 1), (11, 1), (16, 1)],
  term ((-14663910820736501329975236076965915182400 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (3, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((4885874240067410992630892542982188800 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (3, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((91573751732049538353 : Rat) / 5543651628913410872) [(2, 2), (3, 1), (6, 1), (13, 1), (16, 1)],
  term ((-42225260859079998122025032248741165632000 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (3, 1), (6, 1), (13, 2), (15, 1), (16, 1)],
  term ((59642494658654913967487239546819524298125 : Rat) / 168707601851329515375740828258983054697998) [(2, 2), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((771775544509452000 : Rat) / 692956453614176359) [(2, 2), (3, 1), (7, 1), (10, 1), (12, 1), (16, 1)],
  term ((8489530989603972000 : Rat) / 692956453614176359) [(2, 2), (3, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-771775544509452000 : Rat) / 692956453614176359) [(2, 2), (3, 1), (7, 1), (10, 1), (16, 1)],
  term ((4097778927515857893794044667679356716800 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (3, 1), (7, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((23822768568696120000 : Rat) / 692956453614176359) [(2, 2), (3, 1), (7, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((1972163407581095678179970936887570176000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (3, 1), (7, 1), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((-25891905370046625 : Rat) / 1385912907228352718) [(2, 2), (3, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((2443929962314291108885542870542246400 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (3, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((364938985264381623 : Rat) / 692956453614176359) [(2, 2), (3, 1), (7, 1), (12, 1), (13, 2), (16, 1)],
  term ((7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (3, 1), (7, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-154506451847614710653027389690915200 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (3, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((3467408232504942243 : Rat) / 692956453614176359) [(2, 2), (3, 1), (7, 1), (12, 1), (16, 1)],
  term ((-2597961231589460688942202163953750423154109 : Rat) / 337415203702659030751481656517966109395996) [(2, 2), (3, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-748115128448986530779677617726326400 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (3, 1), (7, 1), (13, 1), (15, 3), (16, 1)],
  term ((-187370279015577848440484511650006777844915 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (3, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((4014328837908197853 : Rat) / 2771825814456705436) [(2, 2), (3, 1), (7, 1), (13, 2), (16, 1)],
  term ((20277044933921951589184905712934928000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (3, 1), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((-36867354425312639253063464932608960000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (3, 1), (7, 1), (13, 3), (15, 3), (16, 1)],
  term ((-277943290289918257532294657119649116617589 : Rat) / 337415203702659030751481656517966109395996) [(2, 2), (3, 1), (7, 1), (15, 2), (16, 1)],
  term ((-58721982710684932365 : Rat) / 11087303257826821744) [(2, 2), (3, 1), (7, 1), (16, 1)],
  term ((203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (3, 1), (7, 2), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((513771704481678257633071065506294400 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (3, 1), (7, 2), (12, 1), (15, 1), (16, 1)],
  term ((815806361829355699530030226567516800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (3, 1), (7, 2), (13, 1), (15, 2), (16, 1)],
  term ((222136866292773446557354293949754632481715 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (3, 1), (7, 2), (13, 2), (15, 1), (16, 1)],
  term ((-1015368500705537531255289132617856000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (3, 1), (7, 2), (13, 2), (15, 3), (16, 1)],
  term ((36867354425312639253063464932608960000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (3, 1), (7, 2), (13, 3), (15, 2), (16, 1)],
  term ((197106333352051105621400127908212675391989 : Rat) / 337415203702659030751481656517966109395996) [(2, 2), (3, 1), (7, 2), (15, 1), (16, 1)],
  term ((-9397072573488003139965417854246400 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (3, 1), (7, 2), (15, 3), (16, 1)],
  term ((1015368500705537531255289132617856000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (3, 1), (7, 3), (13, 2), (15, 2), (16, 1)],
  term ((9397072573488003139965417854246400 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (3, 1), (7, 3), (15, 2), (16, 1)],
  term ((14423181750135707291662327260040033405200 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (3, 1), (9, 1), (15, 2), (16, 1)],
  term ((2315326633528356000 : Rat) / 692956453614176359) [(2, 2), (3, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-1033750784322392355330289498980655403364000 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (3, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((4437709380929349000 : Rat) / 692956453614176359) [(2, 2), (3, 1), (10, 1), (13, 1), (16, 1)],
  term ((-35338844328770637459817416030000133630125 : Rat) / 168707601851329515375740828258983054697998) [(2, 2), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((4924581848236464381587163232100850451200 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (3, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((4764553713739224000 : Rat) / 692956453614176359) [(2, 2), (3, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (3, 1), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((17037438647019067125 : Rat) / 5543651628913410872) [(2, 2), (3, 1), (11, 1), (12, 1), (16, 1)],
  term ((192432158004964264564150087643013740092800 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4157495168227792917037311132093583468800 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (3, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-2896140050903837804236256360844908575646400 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (3, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((13102522712782866000 : Rat) / 692956453614176359) [(2, 2), (3, 1), (11, 1), (13, 2), (16, 1)],
  term ((1084689874169602622998984015288163596800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (3, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((-1972163407581095678179970936887570176000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (3, 1), (11, 1), (13, 3), (15, 3), (16, 1)],
  term ((7917151444575710357469357128308539670875 : Rat) / 168707601851329515375740828258983054697998) [(2, 2), (3, 1), (11, 1), (15, 2), (16, 1)],
  term ((-1875339452687916375 : Rat) / 692956453614176359) [(2, 2), (3, 1), (11, 1), (16, 1)],
  term ((27143745778152283292393847461012160000 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (3, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-18819211750745152989 : Rat) / 1385912907228352718) [(2, 2), (3, 1), (12, 1), (13, 1), (16, 1)],
  term ((5114126519741021468134594787795599718400 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (3, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((1305200776235947320391454185037592179097471 : Rat) / 337415203702659030751481656517966109395996) [(2, 2), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((2689080455108298444378053722205785367310513 : Rat) / 337415203702659030751481656517966109395996) [(2, 2), (3, 1), (13, 1), (15, 2), (16, 1)],
  term ((60285156349398187953 : Rat) / 11087303257826821744) [(2, 2), (3, 1), (13, 1), (16, 1)],
  term ((22025171400539200599159593252119193616000 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (3, 1), (13, 2), (15, 1), (16, 1)],
  term ((-34679115264387073690690337739212889177600 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (3, 1), (13, 2), (15, 3), (16, 1)],
  term ((-1809321583903802516182885454533563548643745 : Rat) / 674830407405318061502963313035932218791992) [(2, 2), (3, 1), (15, 1), (16, 1)],
  term ((20196228687940276989083986479503878576800 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (3, 1), (15, 3), (16, 1)],
  term ((32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (5, 1), (7, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (5, 1), (7, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (5, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((79727025473060106869448717095769600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((2968882567615857312948042703280563200 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (5, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (5, 1), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((-13287837578843351144908119515961600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((-43926043926967546635 : Rat) / 5543651628913410872) [(2, 2), (4, 1), (5, 1), (9, 1), (16, 1)],
  term ((87013982558013166610924208563412000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((5381986129252263987 : Rat) / 692956453614176359) [(2, 2), (4, 1), (5, 1), (11, 1), (12, 1), (16, 1)],
  term ((10763972258504527974 : Rat) / 692956453614176359) [(2, 2), (4, 1), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (5, 1), (11, 1), (15, 2), (16, 1)],
  term ((-5381986129252263987 : Rat) / 692956453614176359) [(2, 2), (4, 1), (5, 1), (11, 1), (16, 1)],
  term ((-5381986129252263987 : Rat) / 692956453614176359) [(2, 2), (4, 1), (5, 1), (12, 1), (13, 1), (16, 1)],
  term ((17402796511602633322184841712682400 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (5, 1), (13, 1), (15, 2), (16, 1)],
  term ((-64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (5, 1), (7, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (5, 1), (7, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (5, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (5, 1), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-159454050946120213738897434191539200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (5, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-5937765135231714625896085406561126400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (5, 1), (7, 1), (13, 2), (15, 3), (16, 1)],
  term ((-258163701531813679386786322024396800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (5, 1), (7, 1), (13, 3), (15, 2), (16, 1)],
  term ((26575675157686702289816239031923200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (5, 1), (7, 1), (15, 3), (16, 1)],
  term ((43926043926967546635 : Rat) / 2771825814456705436) [(3, 1), (4, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((-174027965116026333221848417126824000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (5, 1), (10, 1), (15, 2), (16, 1)],
  term ((-10763972258504527974 : Rat) / 692956453614176359) [(3, 1), (4, 1), (5, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-21527944517009055948 : Rat) / 692956453614176359) [(3, 1), (4, 1), (5, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((10763972258504527974 : Rat) / 692956453614176359) [(3, 1), (4, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((-69611186046410533288739366850729600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (5, 1), (11, 1), (15, 3), (16, 1)],
  term ((10763972258504527974 : Rat) / 692956453614176359) [(3, 1), (4, 1), (5, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (5, 1), (12, 1), (15, 2), (16, 1)],
  term ((69611186046410533288739366850729600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (5, 1), (13, 1), (15, 3), (16, 1)],
  term ((32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (5, 1), (7, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (5, 1), (7, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (5, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((79727025473060106869448717095769600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((2968882567615857312948042703280563200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (5, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (5, 1), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((-13287837578843351144908119515961600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((-43926043926967546635 : Rat) / 5543651628913410872) [(3, 2), (4, 1), (5, 1), (9, 1), (16, 1)],
  term ((87013982558013166610924208563412000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((5381986129252263987 : Rat) / 692956453614176359) [(3, 2), (4, 1), (5, 1), (11, 1), (12, 1), (16, 1)],
  term ((10763972258504527974 : Rat) / 692956453614176359) [(3, 2), (4, 1), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (5, 1), (11, 1), (15, 2), (16, 1)],
  term ((-5381986129252263987 : Rat) / 692956453614176359) [(3, 2), (4, 1), (5, 1), (11, 1), (16, 1)],
  term ((-5381986129252263987 : Rat) / 692956453614176359) [(3, 2), (4, 1), (5, 1), (12, 1), (13, 1), (16, 1)],
  term ((17402796511602633322184841712682400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (5, 1), (13, 1), (15, 2), (16, 1)],
  term ((166741629986610000 : Rat) / 692956453614176359) [(3, 2), (5, 1), (11, 2), (15, 1), (16, 1)],
  term ((43055889034018111896 : Rat) / 692956453614176359) [(3, 2), (5, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((16248129776659487595 : Rat) / 1385912907228352718) [(3, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((4209364481888006753262652120648845609900125 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (5, 1), (13, 1), (15, 2), (16, 1)],
  term ((102413353796019575016 : Rat) / 692956453614176359) [(3, 2), (5, 1), (13, 2), (15, 1), (16, 1)],
  term ((-215279445170090559480 : Rat) / 692956453614176359) [(3, 2), (5, 1), (13, 2), (15, 3), (16, 1)],
  term ((-12935031557573321989 : Rat) / 5543651628913410872) [(3, 2), (5, 1), (15, 1), (16, 1)],
  term ((-2104639235181182094975540307520976395808377 : Rat) / 168707601851329515375740828258983054697998) [(3, 2), (5, 1), (15, 3), (16, 1)],
  term ((1811025456682476261301821400176028800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (6, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((4744206808436961099 : Rat) / 692956453614176359) [(3, 2), (6, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((95855121505812862057965008824783296000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (6, 1), (7, 1), (13, 3), (15, 2), (16, 1)],
  term ((1619646487561852949 : Rat) / 2771825814456705436) [(3, 2), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((2639958101834397581263751744806425600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (6, 1), (7, 2), (13, 2), (15, 2), (16, 1)],
  term ((9397072573488003139965417854246400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (6, 1), (7, 2), (15, 2), (16, 1)],
  term ((78173987841078575882094280687715020800 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (6, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-140649573864425400 : Rat) / 692956453614176359) [(3, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((23925041879793012000 : Rat) / 692956453614176359) [(3, 2), (6, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((8784045273428755535856702345424899436800 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (6, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((61939198278609912000 : Rat) / 692956453614176359) [(3, 2), (6, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((5127624859710848763267924435907682457600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (6, 1), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((-542192667164935875 : Rat) / 1385912907228352718) [(3, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((29327821641473002659950472153931830364800 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((-91573751732049538353 : Rat) / 2771825814456705436) [(3, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-9771748480134821985261785085964377600 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (6, 1), (13, 1), (15, 3), (16, 1)],
  term ((84450521718159996244050064497482331264000 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (6, 1), (13, 2), (15, 2), (16, 1)],
  term ((-59642494658654913967487239546819524298125 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (6, 1), (15, 2), (16, 1)],
  term ((-1543551089018904000 : Rat) / 692956453614176359) [(3, 2), (7, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-16979061979207944000 : Rat) / 692956453614176359) [(3, 2), (7, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((1543551089018904000 : Rat) / 692956453614176359) [(3, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-8195557855031715787588089335358713433600 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (7, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-47645537137392240000 : Rat) / 692956453614176359) [(3, 2), (7, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-3944326815162191356359941873775140352000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 1), (11, 1), (13, 3), (15, 3), (16, 1)],
  term ((25891905370046625 : Rat) / 692956453614176359) [(3, 2), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((-4887859924628582217771085741084492800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-729877970528763246 : Rat) / 692956453614176359) [(3, 2), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 1), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((-6934816465009884486 : Rat) / 692956453614176359) [(3, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((309012903695229421306054779381830400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 1), (12, 1), (15, 3), (16, 1)],
  term ((2597961231589460688942202163953750423154109 : Rat) / 168707601851329515375740828258983054697998) [(3, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((1496230256897973061559355235452652800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 1), (13, 1), (15, 4), (16, 1)],
  term ((-4014328837908197853 : Rat) / 1385912907228352718) [(3, 2), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((374740558031155696880969023300013555689830 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (7, 1), (13, 2), (15, 3), (16, 1)],
  term ((-40554089867843903178369811425869856000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 1), (13, 3), (15, 2), (16, 1)],
  term ((73734708850625278506126929865217920000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 1), (13, 3), (15, 4), (16, 1)],
  term ((58721982710684932365 : Rat) / 5543651628913410872) [(3, 2), (7, 1), (15, 1), (16, 1)],
  term ((277943290289918257532294657119649116617589 : Rat) / 168707601851329515375740828258983054697998) [(3, 2), (7, 1), (15, 3), (16, 1)],
  term ((-406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 2), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-1027543408963356515266142131012588800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 2), (12, 1), (15, 2), (16, 1)],
  term ((-1631612723658711399060060453135033600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 2), (13, 1), (15, 3), (16, 1)],
  term ((-444273732585546893114708587899509264963430 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (7, 2), (13, 2), (15, 2), (16, 1)],
  term ((2030737001411075062510578265235712000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 2), (13, 2), (15, 4), (16, 1)],
  term ((-73734708850625278506126929865217920000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 2), (13, 3), (15, 3), (16, 1)],
  term ((-197106333352051105621400127908212675391989 : Rat) / 168707601851329515375740828258983054697998) [(3, 2), (7, 2), (15, 2), (16, 1)],
  term ((18794145146976006279930835708492800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 2), (15, 4), (16, 1)],
  term ((-2030737001411075062510578265235712000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 3), (13, 2), (15, 3), (16, 1)],
  term ((-18794145146976006279930835708492800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 3), (15, 3), (16, 1)],
  term ((-28846363500271414583324654520080066810400 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (9, 1), (15, 3), (16, 1)],
  term ((-4630653267056712000 : Rat) / 692956453614176359) [(3, 2), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-8875418761858698000 : Rat) / 692956453614176359) [(3, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((2067501568644784710660578997961310806728000 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((35338844328770637459817416030000133630125 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (10, 1), (15, 2), (16, 1)],
  term ((-9849163696472928763174326464201700902400 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-9529107427478448000 : Rat) / 692956453614176359) [(3, 2), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (11, 1), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((-17037438647019067125 : Rat) / 2771825814456705436) [(3, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-384864316009928529128300175286027480185600 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((8314990336455585834074622264187166937600 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (11, 1), (13, 1), (15, 4), (16, 1)],
  term ((-26205045425565732000 : Rat) / 692956453614176359) [(3, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((5792280101807675608472512721689817151292800 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (11, 1), (13, 2), (15, 3), (16, 1)],
  term ((-2169379748339205245997968030576327193600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((3944326815162191356359941873775140352000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (11, 1), (13, 3), (15, 4), (16, 1)],
  term ((3750678905375832750 : Rat) / 692956453614176359) [(3, 2), (11, 1), (15, 1), (16, 1)],
  term ((-7917151444575710357469357128308539670875 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (11, 1), (15, 3), (16, 1)],
  term ((18819211750745152989 : Rat) / 692956453614176359) [(3, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-54287491556304566584787694922024320000 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-10228253039482042936269189575591199436800 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-1305200776235947320391454185037592179097471 : Rat) / 168707601851329515375740828258983054697998) [(3, 2), (12, 1), (15, 2), (16, 1)],
  term ((-60285156349398187953 : Rat) / 5543651628913410872) [(3, 2), (13, 1), (15, 1), (16, 1)],
  term ((-2689080455108298444378053722205785367310513 : Rat) / 168707601851329515375740828258983054697998) [(3, 2), (13, 1), (15, 3), (16, 1)],
  term ((-44050342801078401198319186504238387232000 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (13, 2), (15, 2), (16, 1)],
  term ((69358230528774147381380675478425778355200 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (13, 2), (15, 4), (16, 1)],
  term ((1809321583903802516182885454533563548643745 : Rat) / 337415203702659030751481656517966109395996) [(3, 2), (15, 2), (16, 1)],
  term ((-40392457375880553978167972959007757153600 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (15, 4), (16, 1)],
  term ((-83370814993305000 : Rat) / 692956453614176359) [(3, 3), (5, 1), (11, 2), (16, 1)],
  term ((-21527944517009055948 : Rat) / 692956453614176359) [(3, 3), (5, 1), (12, 1), (13, 2), (16, 1)],
  term ((-16248129776659487595 : Rat) / 2771825814456705436) [(3, 3), (5, 1), (12, 1), (16, 1)],
  term ((-4209364481888006753262652120648845609900125 : Rat) / 168707601851329515375740828258983054697998) [(3, 3), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((107639722585045279740 : Rat) / 692956453614176359) [(3, 3), (5, 1), (13, 2), (15, 2), (16, 1)],
  term ((-51206676898009787508 : Rat) / 692956453614176359) [(3, 3), (5, 1), (13, 2), (16, 1)],
  term ((2104639235181182094975540307520976395808377 : Rat) / 337415203702659030751481656517966109395996) [(3, 3), (5, 1), (15, 2), (16, 1)],
  term ((12935031557573321989 : Rat) / 11087303257826821744) [(3, 3), (5, 1), (16, 1)],
  term ((-905512728341238130650910700088014400 : Rat) / 2908751756057405437512772901016949218931) [(3, 3), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4744206808436961099 : Rat) / 1385912907228352718) [(3, 3), (6, 1), (7, 1), (13, 2), (16, 1)],
  term ((-47927560752906431028982504412391648000 : Rat) / 2908751756057405437512772901016949218931) [(3, 3), (6, 1), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((-1619646487561852949 : Rat) / 5543651628913410872) [(3, 3), (6, 1), (7, 1), (16, 1)],
  term ((-1319979050917198790631875872403212800 : Rat) / 2908751756057405437512772901016949218931) [(3, 3), (6, 1), (7, 2), (13, 2), (15, 1), (16, 1)],
  term ((-4698536286744001569982708927123200 : Rat) / 2908751756057405437512772901016949218931) [(3, 3), (6, 1), (7, 2), (15, 1), (16, 1)],
  term ((-39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(3, 3), (6, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((70324786932212700 : Rat) / 692956453614176359) [(3, 3), (6, 1), (9, 1), (16, 1)],
  term ((-11962520939896506000 : Rat) / 692956453614176359) [(3, 3), (6, 1), (10, 1), (13, 1), (16, 1)],
  term ((-4392022636714377767928351172712449718400 : Rat) / 84353800925664757687870414129491527348999) [(3, 3), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-30969599139304956000 : Rat) / 692956453614176359) [(3, 3), (6, 1), (11, 1), (13, 2), (16, 1)],
  term ((-2563812429855424381633962217953841228800 : Rat) / 2908751756057405437512772901016949218931) [(3, 3), (6, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((542192667164935875 : Rat) / 2771825814456705436) [(3, 3), (6, 1), (11, 1), (16, 1)],
  term ((-14663910820736501329975236076965915182400 : Rat) / 84353800925664757687870414129491527348999) [(3, 3), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((4885874240067410992630892542982188800 : Rat) / 84353800925664757687870414129491527348999) [(3, 3), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((91573751732049538353 : Rat) / 5543651628913410872) [(3, 3), (6, 1), (13, 1), (16, 1)],
  term ((-42225260859079998122025032248741165632000 : Rat) / 84353800925664757687870414129491527348999) [(3, 3), (6, 1), (13, 2), (15, 1), (16, 1)],
  term ((59642494658654913967487239546819524298125 : Rat) / 168707601851329515375740828258983054697998) [(3, 3), (6, 1), (15, 1), (16, 1)],
  term ((771775544509452000 : Rat) / 692956453614176359) [(3, 3), (7, 1), (10, 1), (12, 1), (16, 1)],
  term ((8489530989603972000 : Rat) / 692956453614176359) [(3, 3), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-771775544509452000 : Rat) / 692956453614176359) [(3, 3), (7, 1), (10, 1), (16, 1)],
  term ((4097778927515857893794044667679356716800 : Rat) / 84353800925664757687870414129491527348999) [(3, 3), (7, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((23822768568696120000 : Rat) / 692956453614176359) [(3, 3), (7, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((1972163407581095678179970936887570176000 : Rat) / 2908751756057405437512772901016949218931) [(3, 3), (7, 1), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((-25891905370046625 : Rat) / 1385912907228352718) [(3, 3), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((2443929962314291108885542870542246400 : Rat) / 2908751756057405437512772901016949218931) [(3, 3), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((364938985264381623 : Rat) / 692956453614176359) [(3, 3), (7, 1), (12, 1), (13, 2), (16, 1)],
  term ((7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(3, 3), (7, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-154506451847614710653027389690915200 : Rat) / 2908751756057405437512772901016949218931) [(3, 3), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((3467408232504942243 : Rat) / 692956453614176359) [(3, 3), (7, 1), (12, 1), (16, 1)],
  term ((-2597961231589460688942202163953750423154109 : Rat) / 337415203702659030751481656517966109395996) [(3, 3), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-748115128448986530779677617726326400 : Rat) / 2908751756057405437512772901016949218931) [(3, 3), (7, 1), (13, 1), (15, 3), (16, 1)],
  term ((-187370279015577848440484511650006777844915 : Rat) / 84353800925664757687870414129491527348999) [(3, 3), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((4014328837908197853 : Rat) / 2771825814456705436) [(3, 3), (7, 1), (13, 2), (16, 1)],
  term ((20277044933921951589184905712934928000 : Rat) / 2908751756057405437512772901016949218931) [(3, 3), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((-36867354425312639253063464932608960000 : Rat) / 2908751756057405437512772901016949218931) [(3, 3), (7, 1), (13, 3), (15, 3), (16, 1)],
  term ((-277943290289918257532294657119649116617589 : Rat) / 337415203702659030751481656517966109395996) [(3, 3), (7, 1), (15, 2), (16, 1)],
  term ((-58721982710684932365 : Rat) / 11087303257826821744) [(3, 3), (7, 1), (16, 1)],
  term ((203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(3, 3), (7, 2), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((513771704481678257633071065506294400 : Rat) / 2908751756057405437512772901016949218931) [(3, 3), (7, 2), (12, 1), (15, 1), (16, 1)],
  term ((815806361829355699530030226567516800 : Rat) / 2908751756057405437512772901016949218931) [(3, 3), (7, 2), (13, 1), (15, 2), (16, 1)],
  term ((222136866292773446557354293949754632481715 : Rat) / 84353800925664757687870414129491527348999) [(3, 3), (7, 2), (13, 2), (15, 1), (16, 1)],
  term ((-1015368500705537531255289132617856000 : Rat) / 2908751756057405437512772901016949218931) [(3, 3), (7, 2), (13, 2), (15, 3), (16, 1)],
  term ((36867354425312639253063464932608960000 : Rat) / 2908751756057405437512772901016949218931) [(3, 3), (7, 2), (13, 3), (15, 2), (16, 1)],
  term ((197106333352051105621400127908212675391989 : Rat) / 337415203702659030751481656517966109395996) [(3, 3), (7, 2), (15, 1), (16, 1)],
  term ((-9397072573488003139965417854246400 : Rat) / 2908751756057405437512772901016949218931) [(3, 3), (7, 2), (15, 3), (16, 1)],
  term ((1015368500705537531255289132617856000 : Rat) / 2908751756057405437512772901016949218931) [(3, 3), (7, 3), (13, 2), (15, 2), (16, 1)],
  term ((9397072573488003139965417854246400 : Rat) / 2908751756057405437512772901016949218931) [(3, 3), (7, 3), (15, 2), (16, 1)],
  term ((14423181750135707291662327260040033405200 : Rat) / 84353800925664757687870414129491527348999) [(3, 3), (9, 1), (15, 2), (16, 1)],
  term ((2315326633528356000 : Rat) / 692956453614176359) [(3, 3), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-1033750784322392355330289498980655403364000 : Rat) / 84353800925664757687870414129491527348999) [(3, 3), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((4437709380929349000 : Rat) / 692956453614176359) [(3, 3), (10, 1), (13, 1), (16, 1)],
  term ((-35338844328770637459817416030000133630125 : Rat) / 168707601851329515375740828258983054697998) [(3, 3), (10, 1), (15, 1), (16, 1)],
  term ((4924581848236464381587163232100850451200 : Rat) / 84353800925664757687870414129491527348999) [(3, 3), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((4764553713739224000 : Rat) / 692956453614176359) [(3, 3), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(3, 3), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((17037438647019067125 : Rat) / 5543651628913410872) [(3, 3), (11, 1), (12, 1), (16, 1)],
  term ((192432158004964264564150087643013740092800 : Rat) / 84353800925664757687870414129491527348999) [(3, 3), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4157495168227792917037311132093583468800 : Rat) / 84353800925664757687870414129491527348999) [(3, 3), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-2896140050903837804236256360844908575646400 : Rat) / 84353800925664757687870414129491527348999) [(3, 3), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((13102522712782866000 : Rat) / 692956453614176359) [(3, 3), (11, 1), (13, 2), (16, 1)],
  term ((1084689874169602622998984015288163596800 : Rat) / 2908751756057405437512772901016949218931) [(3, 3), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((-1972163407581095678179970936887570176000 : Rat) / 2908751756057405437512772901016949218931) [(3, 3), (11, 1), (13, 3), (15, 3), (16, 1)],
  term ((7917151444575710357469357128308539670875 : Rat) / 168707601851329515375740828258983054697998) [(3, 3), (11, 1), (15, 2), (16, 1)],
  term ((-1875339452687916375 : Rat) / 692956453614176359) [(3, 3), (11, 1), (16, 1)],
  term ((27143745778152283292393847461012160000 : Rat) / 84353800925664757687870414129491527348999) [(3, 3), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-18819211750745152989 : Rat) / 1385912907228352718) [(3, 3), (12, 1), (13, 1), (16, 1)],
  term ((5114126519741021468134594787795599718400 : Rat) / 84353800925664757687870414129491527348999) [(3, 3), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((1305200776235947320391454185037592179097471 : Rat) / 337415203702659030751481656517966109395996) [(3, 3), (12, 1), (15, 1), (16, 1)],
  term ((2689080455108298444378053722205785367310513 : Rat) / 337415203702659030751481656517966109395996) [(3, 3), (13, 1), (15, 2), (16, 1)],
  term ((60285156349398187953 : Rat) / 11087303257826821744) [(3, 3), (13, 1), (16, 1)],
  term ((22025171400539200599159593252119193616000 : Rat) / 84353800925664757687870414129491527348999) [(3, 3), (13, 2), (15, 1), (16, 1)],
  term ((-34679115264387073690690337739212889177600 : Rat) / 84353800925664757687870414129491527348999) [(3, 3), (13, 2), (15, 3), (16, 1)],
  term ((-1809321583903802516182885454533563548643745 : Rat) / 674830407405318061502963313035932218791992) [(3, 3), (15, 1), (16, 1)],
  term ((20196228687940276989083986479503878576800 : Rat) / 84353800925664757687870414129491527348999) [(3, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 28, terms 200 through 299. -/
theorem ep_Q2_008_block_28_0200_0299_valid :
    checkProductSumEq ep_Q2_008_partials_28_0200_0299
      ep_Q2_008_block_28_0200_0299 = true := by
  native_decide

end EpQ2008TermShards

end Patterns

end EndpointCertificate

end Problem97
