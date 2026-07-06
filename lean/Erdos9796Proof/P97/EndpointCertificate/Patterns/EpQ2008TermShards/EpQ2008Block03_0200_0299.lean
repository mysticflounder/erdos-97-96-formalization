/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_008, term block 3:200-299

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_008`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2008TermShards

/-- Generator polynomial 3 for endpoint certificate `ep_Q2_008`. -/
def ep_Q2_008_generator_03_0200_0299 : Poly :=
[
  term (1 : Rat) [(2, 2)],
  term (1 : Rat) [(3, 2)],
  term (-1 : Rat) [(8, 2)],
  term (-1 : Rat) [(9, 2)]
]

/-- Coefficient term 200 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0200 : Poly :=
[
  term ((771775544509452000 : Rat) / 692956453614176359) [(3, 1), (7, 1), (10, 1), (16, 1)]
]

/-- Partial product 200 for generator 3. -/
def ep_Q2_008_partial_03_0200 : Poly :=
[
  term ((771775544509452000 : Rat) / 692956453614176359) [(2, 2), (3, 1), (7, 1), (10, 1), (16, 1)],
  term ((-771775544509452000 : Rat) / 692956453614176359) [(3, 1), (7, 1), (8, 2), (10, 1), (16, 1)],
  term ((-771775544509452000 : Rat) / 692956453614176359) [(3, 1), (7, 1), (9, 2), (10, 1), (16, 1)],
  term ((771775544509452000 : Rat) / 692956453614176359) [(3, 3), (7, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 200 for generator 3. -/
theorem ep_Q2_008_partial_03_0200_valid :
    mulPoly ep_Q2_008_coefficient_03_0200
        ep_Q2_008_generator_03_0200_0299 =
      ep_Q2_008_partial_03_0200 := by
  native_decide

/-- Coefficient term 201 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0201 : Poly :=
[
  term ((-1804205182183737225 : Rat) / 692956453614176359) [(3, 1), (7, 1), (12, 1), (16, 1)]
]

/-- Partial product 201 for generator 3. -/
def ep_Q2_008_partial_03_0201 : Poly :=
[
  term ((-1804205182183737225 : Rat) / 692956453614176359) [(2, 2), (3, 1), (7, 1), (12, 1), (16, 1)],
  term ((1804205182183737225 : Rat) / 692956453614176359) [(3, 1), (7, 1), (8, 2), (12, 1), (16, 1)],
  term ((1804205182183737225 : Rat) / 692956453614176359) [(3, 1), (7, 1), (9, 2), (12, 1), (16, 1)],
  term ((-1804205182183737225 : Rat) / 692956453614176359) [(3, 3), (7, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 201 for generator 3. -/
theorem ep_Q2_008_partial_03_0201_valid :
    mulPoly ep_Q2_008_coefficient_03_0201
        ep_Q2_008_generator_03_0200_0299 =
      ep_Q2_008_partial_03_0201 := by
  native_decide

/-- Coefficient term 202 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0202 : Poly :=
[
  term ((-747272578126315865741698387925880000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 202 for generator 3. -/
def ep_Q2_008_partial_03_0202 : Poly :=
[
  term ((-747272578126315865741698387925880000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (3, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((747272578126315865741698387925880000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((747272578126315865741698387925880000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-747272578126315865741698387925880000 : Rat) / 2908751756057405437512772901016949218931) [(3, 3), (7, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 202 for generator 3. -/
theorem ep_Q2_008_partial_03_0202_valid :
    mulPoly ep_Q2_008_coefficient_03_0202
        ep_Q2_008_generator_03_0200_0299 =
      ep_Q2_008_partial_03_0202 := by
  native_decide

/-- Coefficient term 203 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0203 : Poly :=
[
  term ((-1459755941057526492 : Rat) / 692956453614176359) [(3, 1), (7, 1), (13, 2), (16, 1)]
]

/-- Partial product 203 for generator 3. -/
def ep_Q2_008_partial_03_0203 : Poly :=
[
  term ((-1459755941057526492 : Rat) / 692956453614176359) [(2, 2), (3, 1), (7, 1), (13, 2), (16, 1)],
  term ((1459755941057526492 : Rat) / 692956453614176359) [(3, 1), (7, 1), (8, 2), (13, 2), (16, 1)],
  term ((1459755941057526492 : Rat) / 692956453614176359) [(3, 1), (7, 1), (9, 2), (13, 2), (16, 1)],
  term ((-1459755941057526492 : Rat) / 692956453614176359) [(3, 3), (7, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 203 for generator 3. -/
theorem ep_Q2_008_partial_03_0203_valid :
    mulPoly ep_Q2_008_coefficient_03_0203
        ep_Q2_008_generator_03_0200_0299 =
      ep_Q2_008_partial_03_0203 := by
  native_decide

/-- Coefficient term 204 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0204 : Poly :=
[
  term ((-29493883540250111402450771946087168000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 204 for generator 3. -/
def ep_Q2_008_partial_03_0204 : Poly :=
[
  term ((-29493883540250111402450771946087168000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (3, 1), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((29493883540250111402450771946087168000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (8, 2), (13, 3), (15, 1), (16, 1)],
  term ((29493883540250111402450771946087168000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (9, 2), (13, 3), (15, 1), (16, 1)],
  term ((-29493883540250111402450771946087168000 : Rat) / 2908751756057405437512772901016949218931) [(3, 3), (7, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 204 for generator 3. -/
theorem ep_Q2_008_partial_03_0204_valid :
    mulPoly ep_Q2_008_coefficient_03_0204
        ep_Q2_008_generator_03_0200_0299 =
      ep_Q2_008_partial_03_0204 := by
  native_decide

/-- Coefficient term 205 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0205 : Poly :=
[
  term ((1804205182183737225 : Rat) / 692956453614176359) [(3, 1), (7, 1), (16, 1)]
]

/-- Partial product 205 for generator 3. -/
def ep_Q2_008_partial_03_0205 : Poly :=
[
  term ((1804205182183737225 : Rat) / 692956453614176359) [(2, 2), (3, 1), (7, 1), (16, 1)],
  term ((-1804205182183737225 : Rat) / 692956453614176359) [(3, 1), (7, 1), (8, 2), (16, 1)],
  term ((-1804205182183737225 : Rat) / 692956453614176359) [(3, 1), (7, 1), (9, 2), (16, 1)],
  term ((1804205182183737225 : Rat) / 692956453614176359) [(3, 3), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 205 for generator 3. -/
theorem ep_Q2_008_partial_03_0205_valid :
    mulPoly ep_Q2_008_coefficient_03_0205
        ep_Q2_008_generator_03_0200_0299 =
      ep_Q2_008_partial_03_0205 := by
  native_decide

/-- Coefficient term 206 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0206 : Poly :=
[
  term ((-431634828019142000961252993402057600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 206 for generator 3. -/
def ep_Q2_008_partial_03_0206 : Poly :=
[
  term ((-431634828019142000961252993402057600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (3, 1), (7, 2), (12, 1), (15, 1), (16, 1)],
  term ((431634828019142000961252993402057600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (8, 2), (12, 1), (15, 1), (16, 1)],
  term ((431634828019142000961252993402057600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((-431634828019142000961252993402057600 : Rat) / 2908751756057405437512772901016949218931) [(3, 3), (7, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 206 for generator 3. -/
theorem ep_Q2_008_partial_03_0206_valid :
    mulPoly ep_Q2_008_coefficient_03_0206
        ep_Q2_008_generator_03_0200_0299 =
      ep_Q2_008_partial_03_0206 := by
  native_decide

/-- Coefficient term 207 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0207 : Poly :=
[
  term ((-812294800564430025004231306094284800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 207 for generator 3. -/
def ep_Q2_008_partial_03_0207 : Poly :=
[
  term ((-812294800564430025004231306094284800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (3, 1), (7, 2), (13, 2), (15, 1), (16, 1)],
  term ((812294800564430025004231306094284800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (8, 2), (13, 2), (15, 1), (16, 1)],
  term ((812294800564430025004231306094284800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (9, 2), (13, 2), (15, 1), (16, 1)],
  term ((-812294800564430025004231306094284800 : Rat) / 2908751756057405437512772901016949218931) [(3, 3), (7, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 207 for generator 3. -/
theorem ep_Q2_008_partial_03_0207_valid :
    mulPoly ep_Q2_008_coefficient_03_0207
        ep_Q2_008_generator_03_0200_0299 =
      ep_Q2_008_partial_03_0207 := by
  native_decide

/-- Coefficient term 208 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0208 : Poly :=
[
  term ((431634828019142000961252993402057600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (15, 1), (16, 1)]
]

/-- Partial product 208 for generator 3. -/
def ep_Q2_008_partial_03_0208 : Poly :=
[
  term ((431634828019142000961252993402057600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (3, 1), (7, 2), (15, 1), (16, 1)],
  term ((-431634828019142000961252993402057600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (8, 2), (15, 1), (16, 1)],
  term ((-431634828019142000961252993402057600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (9, 2), (15, 1), (16, 1)],
  term ((431634828019142000961252993402057600 : Rat) / 2908751756057405437512772901016949218931) [(3, 3), (7, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 208 for generator 3. -/
theorem ep_Q2_008_partial_03_0208_valid :
    mulPoly ep_Q2_008_coefficient_03_0208
        ep_Q2_008_generator_03_0200_0299 =
      ep_Q2_008_partial_03_0208 := by
  native_decide

/-- Coefficient term 209 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0209 : Poly :=
[
  term ((-39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 209 for generator 3. -/
def ep_Q2_008_partial_03_0209 : Poly :=
[
  term ((-39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (3, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (8, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (9, 3), (13, 1), (15, 1), (16, 1)],
  term ((-39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(3, 3), (9, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 209 for generator 3. -/
theorem ep_Q2_008_partial_03_0209_valid :
    mulPoly ep_Q2_008_coefficient_03_0209
        ep_Q2_008_generator_03_0200_0299 =
      ep_Q2_008_partial_03_0209 := by
  native_decide

/-- Coefficient term 210 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0210 : Poly :=
[
  term ((70324786932212700 : Rat) / 692956453614176359) [(3, 1), (9, 1), (16, 1)]
]

/-- Partial product 210 for generator 3. -/
def ep_Q2_008_partial_03_0210 : Poly :=
[
  term ((70324786932212700 : Rat) / 692956453614176359) [(2, 2), (3, 1), (9, 1), (16, 1)],
  term ((-70324786932212700 : Rat) / 692956453614176359) [(3, 1), (8, 2), (9, 1), (16, 1)],
  term ((-70324786932212700 : Rat) / 692956453614176359) [(3, 1), (9, 3), (16, 1)],
  term ((70324786932212700 : Rat) / 692956453614176359) [(3, 3), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 210 for generator 3. -/
theorem ep_Q2_008_partial_03_0210_valid :
    mulPoly ep_Q2_008_coefficient_03_0210
        ep_Q2_008_generator_03_0200_0299 =
      ep_Q2_008_partial_03_0210 := by
  native_decide

/-- Coefficient term 211 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0211 : Poly :=
[
  term ((-8103643217349246000 : Rat) / 692956453614176359) [(3, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 211 for generator 3. -/
def ep_Q2_008_partial_03_0211 : Poly :=
[
  term ((-8103643217349246000 : Rat) / 692956453614176359) [(2, 2), (3, 1), (10, 1), (13, 1), (16, 1)],
  term ((8103643217349246000 : Rat) / 692956453614176359) [(3, 1), (8, 2), (10, 1), (13, 1), (16, 1)],
  term ((8103643217349246000 : Rat) / 692956453614176359) [(3, 1), (9, 2), (10, 1), (13, 1), (16, 1)],
  term ((-8103643217349246000 : Rat) / 692956453614176359) [(3, 3), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 211 for generator 3. -/
theorem ep_Q2_008_partial_03_0211_valid :
    mulPoly ep_Q2_008_coefficient_03_0211
        ep_Q2_008_generator_03_0200_0299 =
      ep_Q2_008_partial_03_0211 := by
  native_decide

/-- Coefficient term 212 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0212 : Poly :=
[
  term ((234997830172389375 : Rat) / 5543651628913410872) [(3, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 212 for generator 3. -/
def ep_Q2_008_partial_03_0212 : Poly :=
[
  term ((234997830172389375 : Rat) / 5543651628913410872) [(2, 2), (3, 1), (11, 1), (12, 1), (16, 1)],
  term ((-234997830172389375 : Rat) / 5543651628913410872) [(3, 1), (8, 2), (11, 1), (12, 1), (16, 1)],
  term ((-234997830172389375 : Rat) / 5543651628913410872) [(3, 1), (9, 2), (11, 1), (12, 1), (16, 1)],
  term ((234997830172389375 : Rat) / 5543651628913410872) [(3, 3), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 212 for generator 3. -/
theorem ep_Q2_008_partial_03_0212_valid :
    mulPoly ep_Q2_008_coefficient_03_0212
        ep_Q2_008_generator_03_0200_0299 =
      ep_Q2_008_partial_03_0212 := by
  native_decide

/-- Coefficient term 213 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0213 : Poly :=
[
  term ((-2343133172956448821031328838872771360000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 213 for generator 3. -/
def ep_Q2_008_partial_03_0213 : Poly :=
[
  term ((-2343133172956448821031328838872771360000 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((2343133172956448821031328838872771360000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (8, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((2343133172956448821031328838872771360000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2343133172956448821031328838872771360000 : Rat) / 84353800925664757687870414129491527348999) [(3, 3), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 213 for generator 3. -/
theorem ep_Q2_008_partial_03_0213_valid :
    mulPoly ep_Q2_008_coefficient_03_0213
        ep_Q2_008_generator_03_0200_0299 =
      ep_Q2_008_partial_03_0213 := by
  native_decide

/-- Coefficient term 214 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0214 : Poly :=
[
  term ((-19058214854956896000 : Rat) / 692956453614176359) [(3, 1), (11, 1), (13, 2), (16, 1)]
]

/-- Partial product 214 for generator 3. -/
def ep_Q2_008_partial_03_0214 : Poly :=
[
  term ((-19058214854956896000 : Rat) / 692956453614176359) [(2, 2), (3, 1), (11, 1), (13, 2), (16, 1)],
  term ((19058214854956896000 : Rat) / 692956453614176359) [(3, 1), (8, 2), (11, 1), (13, 2), (16, 1)],
  term ((19058214854956896000 : Rat) / 692956453614176359) [(3, 1), (9, 2), (11, 1), (13, 2), (16, 1)],
  term ((-19058214854956896000 : Rat) / 692956453614176359) [(3, 3), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 214 for generator 3. -/
theorem ep_Q2_008_partial_03_0214_valid :
    mulPoly ep_Q2_008_coefficient_03_0214
        ep_Q2_008_generator_03_0200_0299 =
      ep_Q2_008_partial_03_0214 := by
  native_decide

/-- Coefficient term 215 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0215 : Poly :=
[
  term ((-1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 215 for generator 3. -/
def ep_Q2_008_partial_03_0215 : Poly :=
[
  term ((-1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (3, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (8, 2), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (9, 2), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((-1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(3, 3), (11, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 215 for generator 3. -/
theorem ep_Q2_008_partial_03_0215_valid :
    mulPoly ep_Q2_008_coefficient_03_0215
        ep_Q2_008_generator_03_0200_0299 =
      ep_Q2_008_partial_03_0215 := by
  native_decide

/-- Coefficient term 216 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0216 : Poly :=
[
  term ((1321648816232449125 : Rat) / 5543651628913410872) [(3, 1), (11, 1), (16, 1)]
]

/-- Partial product 216 for generator 3. -/
def ep_Q2_008_partial_03_0216 : Poly :=
[
  term ((1321648816232449125 : Rat) / 5543651628913410872) [(2, 2), (3, 1), (11, 1), (16, 1)],
  term ((-1321648816232449125 : Rat) / 5543651628913410872) [(3, 1), (8, 2), (11, 1), (16, 1)],
  term ((-1321648816232449125 : Rat) / 5543651628913410872) [(3, 1), (9, 2), (11, 1), (16, 1)],
  term ((1321648816232449125 : Rat) / 5543651628913410872) [(3, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 216 for generator 3. -/
theorem ep_Q2_008_partial_03_0216_valid :
    mulPoly ep_Q2_008_coefficient_03_0216
        ep_Q2_008_generator_03_0200_0299 =
      ep_Q2_008_partial_03_0216 := by
  native_decide

/-- Coefficient term 217 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0217 : Poly :=
[
  term ((-34468386518441157067941476614593519161025 : Rat) / 168707601851329515375740828258983054697998) [(3, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 217 for generator 3. -/
def ep_Q2_008_partial_03_0217 : Poly :=
[
  term ((-34468386518441157067941476614593519161025 : Rat) / 168707601851329515375740828258983054697998) [(2, 2), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((34468386518441157067941476614593519161025 : Rat) / 168707601851329515375740828258983054697998) [(3, 1), (8, 2), (12, 1), (15, 1), (16, 1)],
  term ((34468386518441157067941476614593519161025 : Rat) / 168707601851329515375740828258983054697998) [(3, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((-34468386518441157067941476614593519161025 : Rat) / 168707601851329515375740828258983054697998) [(3, 3), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 217 for generator 3. -/
theorem ep_Q2_008_partial_03_0217_valid :
    mulPoly ep_Q2_008_coefficient_03_0217
        ep_Q2_008_generator_03_0200_0299 =
      ep_Q2_008_partial_03_0217 := by
  native_decide

/-- Coefficient term 218 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0218 : Poly :=
[
  term ((-84688486827835123872268804078357939200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 218 for generator 3. -/
def ep_Q2_008_partial_03_0218 : Poly :=
[
  term ((-84688486827835123872268804078357939200 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (3, 1), (13, 1), (15, 2), (16, 1)],
  term ((84688486827835123872268804078357939200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (8, 2), (13, 1), (15, 2), (16, 1)],
  term ((84688486827835123872268804078357939200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((-84688486827835123872268804078357939200 : Rat) / 84353800925664757687870414129491527348999) [(3, 3), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 218 for generator 3. -/
theorem ep_Q2_008_partial_03_0218_valid :
    mulPoly ep_Q2_008_coefficient_03_0218
        ep_Q2_008_generator_03_0200_0299 =
      ep_Q2_008_partial_03_0218 := by
  native_decide

/-- Coefficient term 219 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0219 : Poly :=
[
  term ((7140405822667457865 : Rat) / 692956453614176359) [(3, 1), (13, 1), (16, 1)]
]

/-- Partial product 219 for generator 3. -/
def ep_Q2_008_partial_03_0219 : Poly :=
[
  term ((7140405822667457865 : Rat) / 692956453614176359) [(2, 2), (3, 1), (13, 1), (16, 1)],
  term ((-7140405822667457865 : Rat) / 692956453614176359) [(3, 1), (8, 2), (13, 1), (16, 1)],
  term ((-7140405822667457865 : Rat) / 692956453614176359) [(3, 1), (9, 2), (13, 1), (16, 1)],
  term ((7140405822667457865 : Rat) / 692956453614176359) [(3, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 219 for generator 3. -/
theorem ep_Q2_008_partial_03_0219_valid :
    mulPoly ep_Q2_008_coefficient_03_0219
        ep_Q2_008_generator_03_0200_0299 =
      ep_Q2_008_partial_03_0219 := by
  native_decide

/-- Coefficient term 220 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0220 : Poly :=
[
  term ((-25124733538268943676526801496260805484800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 220 for generator 3. -/
def ep_Q2_008_partial_03_0220 : Poly :=
[
  term ((-25124733538268943676526801496260805484800 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (3, 1), (13, 2), (15, 1), (16, 1)],
  term ((25124733538268943676526801496260805484800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (8, 2), (13, 2), (15, 1), (16, 1)],
  term ((25124733538268943676526801496260805484800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (9, 2), (13, 2), (15, 1), (16, 1)],
  term ((-25124733538268943676526801496260805484800 : Rat) / 84353800925664757687870414129491527348999) [(3, 3), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 220 for generator 3. -/
theorem ep_Q2_008_partial_03_0220_valid :
    mulPoly ep_Q2_008_coefficient_03_0220
        ep_Q2_008_generator_03_0200_0299 =
      ep_Q2_008_partial_03_0220 := by
  native_decide

/-- Coefficient term 221 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0221 : Poly :=
[
  term ((63589431987328048185833796848099511469725 : Rat) / 168707601851329515375740828258983054697998) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 221 for generator 3. -/
def ep_Q2_008_partial_03_0221 : Poly :=
[
  term ((63589431987328048185833796848099511469725 : Rat) / 168707601851329515375740828258983054697998) [(2, 2), (3, 1), (15, 1), (16, 1)],
  term ((-63589431987328048185833796848099511469725 : Rat) / 168707601851329515375740828258983054697998) [(3, 1), (8, 2), (15, 1), (16, 1)],
  term ((-63589431987328048185833796848099511469725 : Rat) / 168707601851329515375740828258983054697998) [(3, 1), (9, 2), (15, 1), (16, 1)],
  term ((63589431987328048185833796848099511469725 : Rat) / 168707601851329515375740828258983054697998) [(3, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 221 for generator 3. -/
theorem ep_Q2_008_partial_03_0221_valid :
    mulPoly ep_Q2_008_coefficient_03_0221
        ep_Q2_008_generator_03_0200_0299 =
      ep_Q2_008_partial_03_0221 := by
  native_decide

/-- Coefficient term 222 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0222 : Poly :=
[
  term ((-32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 222 for generator 3. -/
def ep_Q2_008_partial_03_0222 : Poly :=
[
  term ((-32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (5, 1), (7, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (5, 1), (7, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (8, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 222 for generator 3. -/
theorem ep_Q2_008_partial_03_0222_valid :
    mulPoly ep_Q2_008_coefficient_03_0222
        ep_Q2_008_generator_03_0200_0299 =
      ep_Q2_008_partial_03_0222 := by
  native_decide

/-- Coefficient term 223 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0223 : Poly :=
[
  term ((-64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 223 for generator 3. -/
def ep_Q2_008_partial_03_0223 : Poly :=
[
  term ((-64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (5, 1), (7, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (5, 1), (7, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (8, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (9, 2), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 223 for generator 3. -/
theorem ep_Q2_008_partial_03_0223_valid :
    mulPoly ep_Q2_008_coefficient_03_0223
        ep_Q2_008_generator_03_0200_0299 =
      ep_Q2_008_partial_03_0223 := by
  native_decide

/-- Coefficient term 224 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0224 : Poly :=
[
  term ((32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 224 for generator 3. -/
def ep_Q2_008_partial_03_0224 : Poly :=
[
  term ((32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (8, 2), (11, 1), (15, 1), (16, 1)],
  term ((-32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 224 for generator 3. -/
theorem ep_Q2_008_partial_03_0224_valid :
    mulPoly ep_Q2_008_coefficient_03_0224
        ep_Q2_008_generator_03_0200_0299 =
      ep_Q2_008_partial_03_0224 := by
  native_decide

/-- Coefficient term 225 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0225 : Poly :=
[
  term ((32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 225 for generator 3. -/
def ep_Q2_008_partial_03_0225 : Poly :=
[
  term ((32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (5, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (5, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (8, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (9, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 225 for generator 3. -/
theorem ep_Q2_008_partial_03_0225_valid :
    mulPoly ep_Q2_008_coefficient_03_0225
        ep_Q2_008_generator_03_0200_0299 =
      ep_Q2_008_partial_03_0225 := by
  native_decide

/-- Coefficient term 226 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0226 : Poly :=
[
  term ((-47456562781583396946100426842720000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 226 for generator 3. -/
def ep_Q2_008_partial_03_0226 : Poly :=
[
  term ((-47456562781583396946100426842720000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-47456562781583396946100426842720000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((47456562781583396946100426842720000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((47456562781583396946100426842720000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 226 for generator 3. -/
theorem ep_Q2_008_partial_03_0226_valid :
    mulPoly ep_Q2_008_coefficient_03_0226
        ep_Q2_008_generator_03_0200_0299 =
      ep_Q2_008_partial_03_0226 := by
  native_decide

/-- Coefficient term 227 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0227 : Poly :=
[
  term ((-64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 227 for generator 3. -/
def ep_Q2_008_partial_03_0227 : Poly :=
[
  term ((-64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (5, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((-64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (5, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (8, 2), (13, 2), (15, 2), (16, 1)],
  term ((64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (9, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 227 for generator 3. -/
theorem ep_Q2_008_partial_03_0227_valid :
    mulPoly ep_Q2_008_coefficient_03_0227
        ep_Q2_008_generator_03_0200_0299 =
      ep_Q2_008_partial_03_0227 := by
  native_decide

/-- Coefficient term 228 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0228 : Poly :=
[
  term ((-129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 228 for generator 3. -/
def ep_Q2_008_partial_03_0228 : Poly :=
[
  term ((-129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (5, 1), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((-129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (5, 1), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (8, 2), (13, 3), (15, 1), (16, 1)],
  term ((129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (9, 2), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 228 for generator 3. -/
theorem ep_Q2_008_partial_03_0228_valid :
    mulPoly ep_Q2_008_coefficient_03_0228
        ep_Q2_008_generator_03_0200_0299 =
      ep_Q2_008_partial_03_0228 := by
  native_decide

/-- Coefficient term 229 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0229 : Poly :=
[
  term ((43926043926967546635 : Rat) / 5543651628913410872) [(4, 1), (5, 1), (9, 1), (16, 1)]
]

/-- Partial product 229 for generator 3. -/
def ep_Q2_008_partial_03_0229 : Poly :=
[
  term ((43926043926967546635 : Rat) / 5543651628913410872) [(2, 2), (4, 1), (5, 1), (9, 1), (16, 1)],
  term ((43926043926967546635 : Rat) / 5543651628913410872) [(3, 2), (4, 1), (5, 1), (9, 1), (16, 1)],
  term ((-43926043926967546635 : Rat) / 5543651628913410872) [(4, 1), (5, 1), (8, 2), (9, 1), (16, 1)],
  term ((-43926043926967546635 : Rat) / 5543651628913410872) [(4, 1), (5, 1), (9, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 229 for generator 3. -/
theorem ep_Q2_008_partial_03_0229_valid :
    mulPoly ep_Q2_008_coefficient_03_0229
        ep_Q2_008_generator_03_0200_0299 =
      ep_Q2_008_partial_03_0229 := by
  native_decide

/-- Coefficient term 230 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0230 : Poly :=
[
  term ((-87013982558013166610924208563412000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 230 for generator 3. -/
def ep_Q2_008_partial_03_0230 : Poly :=
[
  term ((-87013982558013166610924208563412000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((-87013982558013166610924208563412000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((87013982558013166610924208563412000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (8, 2), (10, 1), (15, 1), (16, 1)],
  term ((87013982558013166610924208563412000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (9, 2), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 230 for generator 3. -/
theorem ep_Q2_008_partial_03_0230_valid :
    mulPoly ep_Q2_008_coefficient_03_0230
        ep_Q2_008_generator_03_0200_0299 =
      ep_Q2_008_partial_03_0230 := by
  native_decide

/-- Coefficient term 231 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0231 : Poly :=
[
  term ((-5381986129252263987 : Rat) / 692956453614176359) [(4, 1), (5, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 231 for generator 3. -/
def ep_Q2_008_partial_03_0231 : Poly :=
[
  term ((-5381986129252263987 : Rat) / 692956453614176359) [(2, 2), (4, 1), (5, 1), (11, 1), (12, 1), (16, 1)],
  term ((-5381986129252263987 : Rat) / 692956453614176359) [(3, 2), (4, 1), (5, 1), (11, 1), (12, 1), (16, 1)],
  term ((5381986129252263987 : Rat) / 692956453614176359) [(4, 1), (5, 1), (8, 2), (11, 1), (12, 1), (16, 1)],
  term ((5381986129252263987 : Rat) / 692956453614176359) [(4, 1), (5, 1), (9, 2), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 231 for generator 3. -/
theorem ep_Q2_008_partial_03_0231_valid :
    mulPoly ep_Q2_008_coefficient_03_0231
        ep_Q2_008_generator_03_0200_0299 =
      ep_Q2_008_partial_03_0231 := by
  native_decide

/-- Coefficient term 232 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0232 : Poly :=
[
  term ((-10763972258504527974 : Rat) / 692956453614176359) [(4, 1), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 232 for generator 3. -/
def ep_Q2_008_partial_03_0232 : Poly :=
[
  term ((-10763972258504527974 : Rat) / 692956453614176359) [(2, 2), (4, 1), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-10763972258504527974 : Rat) / 692956453614176359) [(3, 2), (4, 1), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((10763972258504527974 : Rat) / 692956453614176359) [(4, 1), (5, 1), (8, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((10763972258504527974 : Rat) / 692956453614176359) [(4, 1), (5, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 232 for generator 3. -/
theorem ep_Q2_008_partial_03_0232_valid :
    mulPoly ep_Q2_008_coefficient_03_0232
        ep_Q2_008_generator_03_0200_0299 =
      ep_Q2_008_partial_03_0232 := by
  native_decide

/-- Coefficient term 233 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0233 : Poly :=
[
  term ((-34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 233 for generator 3. -/
def ep_Q2_008_partial_03_0233 : Poly :=
[
  term ((-34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (5, 1), (11, 1), (15, 2), (16, 1)],
  term ((-34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (5, 1), (11, 1), (15, 2), (16, 1)],
  term ((34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (8, 2), (11, 1), (15, 2), (16, 1)],
  term ((34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (9, 2), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 233 for generator 3. -/
theorem ep_Q2_008_partial_03_0233_valid :
    mulPoly ep_Q2_008_coefficient_03_0233
        ep_Q2_008_generator_03_0200_0299 =
      ep_Q2_008_partial_03_0233 := by
  native_decide

/-- Coefficient term 234 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0234 : Poly :=
[
  term ((5381986129252263987 : Rat) / 692956453614176359) [(4, 1), (5, 1), (11, 1), (16, 1)]
]

/-- Partial product 234 for generator 3. -/
def ep_Q2_008_partial_03_0234 : Poly :=
[
  term ((5381986129252263987 : Rat) / 692956453614176359) [(2, 2), (4, 1), (5, 1), (11, 1), (16, 1)],
  term ((5381986129252263987 : Rat) / 692956453614176359) [(3, 2), (4, 1), (5, 1), (11, 1), (16, 1)],
  term ((-5381986129252263987 : Rat) / 692956453614176359) [(4, 1), (5, 1), (8, 2), (11, 1), (16, 1)],
  term ((-5381986129252263987 : Rat) / 692956453614176359) [(4, 1), (5, 1), (9, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 234 for generator 3. -/
theorem ep_Q2_008_partial_03_0234_valid :
    mulPoly ep_Q2_008_coefficient_03_0234
        ep_Q2_008_generator_03_0200_0299 =
      ep_Q2_008_partial_03_0234 := by
  native_decide

/-- Coefficient term 235 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0235 : Poly :=
[
  term ((5381986129252263987 : Rat) / 692956453614176359) [(4, 1), (5, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 235 for generator 3. -/
def ep_Q2_008_partial_03_0235 : Poly :=
[
  term ((5381986129252263987 : Rat) / 692956453614176359) [(2, 2), (4, 1), (5, 1), (12, 1), (13, 1), (16, 1)],
  term ((5381986129252263987 : Rat) / 692956453614176359) [(3, 2), (4, 1), (5, 1), (12, 1), (13, 1), (16, 1)],
  term ((-5381986129252263987 : Rat) / 692956453614176359) [(4, 1), (5, 1), (8, 2), (12, 1), (13, 1), (16, 1)],
  term ((-5381986129252263987 : Rat) / 692956453614176359) [(4, 1), (5, 1), (9, 2), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 235 for generator 3. -/
theorem ep_Q2_008_partial_03_0235_valid :
    mulPoly ep_Q2_008_coefficient_03_0235
        ep_Q2_008_generator_03_0200_0299 =
      ep_Q2_008_partial_03_0235 := by
  native_decide

/-- Coefficient term 236 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0236 : Poly :=
[
  term ((-17402796511602633322184841712682400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 236 for generator 3. -/
def ep_Q2_008_partial_03_0236 : Poly :=
[
  term ((-17402796511602633322184841712682400 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-17402796511602633322184841712682400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((17402796511602633322184841712682400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (8, 2), (12, 1), (15, 1), (16, 1)],
  term ((17402796511602633322184841712682400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (9, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 236 for generator 3. -/
theorem ep_Q2_008_partial_03_0236_valid :
    mulPoly ep_Q2_008_coefficient_03_0236
        ep_Q2_008_generator_03_0200_0299 =
      ep_Q2_008_partial_03_0236 := by
  native_decide

/-- Coefficient term 237 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0237 : Poly :=
[
  term ((34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 237 for generator 3. -/
def ep_Q2_008_partial_03_0237 : Poly :=
[
  term ((34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (5, 1), (13, 1), (15, 2), (16, 1)],
  term ((34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (5, 1), (13, 1), (15, 2), (16, 1)],
  term ((-34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (8, 2), (13, 1), (15, 2), (16, 1)],
  term ((-34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (9, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 237 for generator 3. -/
theorem ep_Q2_008_partial_03_0237_valid :
    mulPoly ep_Q2_008_coefficient_03_0237
        ep_Q2_008_generator_03_0200_0299 =
      ep_Q2_008_partial_03_0237 := by
  native_decide

/-- Coefficient term 238 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0238 : Poly :=
[
  term ((-13571547378614916015 : Rat) / 2771825814456705436) [(4, 1), (5, 1), (13, 1), (16, 1)]
]

/-- Partial product 238 for generator 3. -/
def ep_Q2_008_partial_03_0238 : Poly :=
[
  term ((-13571547378614916015 : Rat) / 2771825814456705436) [(2, 2), (4, 1), (5, 1), (13, 1), (16, 1)],
  term ((-13571547378614916015 : Rat) / 2771825814456705436) [(3, 2), (4, 1), (5, 1), (13, 1), (16, 1)],
  term ((13571547378614916015 : Rat) / 2771825814456705436) [(4, 1), (5, 1), (8, 2), (13, 1), (16, 1)],
  term ((13571547378614916015 : Rat) / 2771825814456705436) [(4, 1), (5, 1), (9, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 238 for generator 3. -/
theorem ep_Q2_008_partial_03_0238_valid :
    mulPoly ep_Q2_008_coefficient_03_0238
        ep_Q2_008_generator_03_0200_0299 =
      ep_Q2_008_partial_03_0238 := by
  native_decide

/-- Coefficient term 239 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0239 : Poly :=
[
  term ((-10763972258504527974 : Rat) / 692956453614176359) [(4, 1), (5, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 239 for generator 3. -/
def ep_Q2_008_partial_03_0239 : Poly :=
[
  term ((-10763972258504527974 : Rat) / 692956453614176359) [(2, 2), (4, 1), (5, 1), (13, 2), (15, 1), (16, 1)],
  term ((-10763972258504527974 : Rat) / 692956453614176359) [(3, 2), (4, 1), (5, 1), (13, 2), (15, 1), (16, 1)],
  term ((10763972258504527974 : Rat) / 692956453614176359) [(4, 1), (5, 1), (8, 2), (13, 2), (15, 1), (16, 1)],
  term ((10763972258504527974 : Rat) / 692956453614176359) [(4, 1), (5, 1), (9, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 239 for generator 3. -/
theorem ep_Q2_008_partial_03_0239_valid :
    mulPoly ep_Q2_008_coefficient_03_0239
        ep_Q2_008_generator_03_0200_0299 =
      ep_Q2_008_partial_03_0239 := by
  native_decide

/-- Coefficient term 240 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0240 : Poly :=
[
  term ((-21527944517009055948 : Rat) / 692956453614176359) [(4, 1), (5, 1), (13, 3), (16, 1)]
]

/-- Partial product 240 for generator 3. -/
def ep_Q2_008_partial_03_0240 : Poly :=
[
  term ((-21527944517009055948 : Rat) / 692956453614176359) [(2, 2), (4, 1), (5, 1), (13, 3), (16, 1)],
  term ((-21527944517009055948 : Rat) / 692956453614176359) [(3, 2), (4, 1), (5, 1), (13, 3), (16, 1)],
  term ((21527944517009055948 : Rat) / 692956453614176359) [(4, 1), (5, 1), (8, 2), (13, 3), (16, 1)],
  term ((21527944517009055948 : Rat) / 692956453614176359) [(4, 1), (5, 1), (9, 2), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 240 for generator 3. -/
theorem ep_Q2_008_partial_03_0240_valid :
    mulPoly ep_Q2_008_coefficient_03_0240
        ep_Q2_008_generator_03_0200_0299 =
      ep_Q2_008_partial_03_0240 := by
  native_decide

/-- Coefficient term 241 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0241 : Poly :=
[
  term ((104416779069615799933109050276094400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 241 for generator 3. -/
def ep_Q2_008_partial_03_0241 : Poly :=
[
  term ((104416779069615799933109050276094400 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((104416779069615799933109050276094400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((-104416779069615799933109050276094400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (8, 2), (15, 1), (16, 1)],
  term ((-104416779069615799933109050276094400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 241 for generator 3. -/
theorem ep_Q2_008_partial_03_0241_valid :
    mulPoly ep_Q2_008_coefficient_03_0241
        ep_Q2_008_generator_03_0200_0299 =
      ep_Q2_008_partial_03_0241 := by
  native_decide

/-- Coefficient term 242 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0242 : Poly :=
[
  term ((-1898262511263335877844017073708800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 242 for generator 3. -/
def ep_Q2_008_partial_03_0242 : Poly :=
[
  term ((-1898262511263335877844017073708800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-1898262511263335877844017073708800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((1898262511263335877844017073708800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 1), (8, 2), (15, 1), (16, 1)],
  term ((1898262511263335877844017073708800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 242 for generator 3. -/
theorem ep_Q2_008_partial_03_0242_valid :
    mulPoly ep_Q2_008_coefficient_03_0242
        ep_Q2_008_generator_03_0200_0299 =
      ep_Q2_008_partial_03_0242 := by
  native_decide

/-- Coefficient term 243 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0243 : Poly :=
[
  term ((-52208389534807899966554525138047200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 243 for generator 3. -/
def ep_Q2_008_partial_03_0243 : Poly :=
[
  term ((-52208389534807899966554525138047200 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-52208389534807899966554525138047200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((52208389534807899966554525138047200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (8, 2), (9, 1), (15, 1), (16, 1)],
  term ((52208389534807899966554525138047200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (9, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 243 for generator 3. -/
theorem ep_Q2_008_partial_03_0243_valid :
    mulPoly ep_Q2_008_coefficient_03_0243
        ep_Q2_008_generator_03_0200_0299 =
      ep_Q2_008_partial_03_0243 := by
  native_decide

/-- Coefficient term 244 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0244 : Poly :=
[
  term ((7264480957224552596016038175384619596600 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (6, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 244 for generator 3. -/
def ep_Q2_008_partial_03_0244 : Poly :=
[
  term ((7264480957224552596016038175384619596600 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((7264480957224552596016038175384619596600 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-7264480957224552596016038175384619596600 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (6, 1), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((-7264480957224552596016038175384619596600 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (6, 1), (9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 244 for generator 3. -/
theorem ep_Q2_008_partial_03_0244_valid :
    mulPoly ep_Q2_008_coefficient_03_0244
        ep_Q2_008_generator_03_0200_0299 =
      ep_Q2_008_partial_03_0244 := by
  native_decide

/-- Coefficient term 245 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0245 : Poly :=
[
  term ((-30955433660627124993 : Rat) / 5543651628913410872) [(4, 1), (6, 1), (16, 1)]
]

/-- Partial product 245 for generator 3. -/
def ep_Q2_008_partial_03_0245 : Poly :=
[
  term ((-30955433660627124993 : Rat) / 5543651628913410872) [(2, 2), (4, 1), (6, 1), (16, 1)],
  term ((-30955433660627124993 : Rat) / 5543651628913410872) [(3, 2), (4, 1), (6, 1), (16, 1)],
  term ((30955433660627124993 : Rat) / 5543651628913410872) [(4, 1), (6, 1), (8, 2), (16, 1)],
  term ((30955433660627124993 : Rat) / 5543651628913410872) [(4, 1), (6, 1), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 245 for generator 3. -/
theorem ep_Q2_008_partial_03_0245_valid :
    mulPoly ep_Q2_008_coefficient_03_0245
        ep_Q2_008_generator_03_0200_0299 =
      ep_Q2_008_partial_03_0245 := by
  native_decide

/-- Coefficient term 246 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0246 : Poly :=
[
  term ((1843367721265631962653173246630448000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 246 for generator 3. -/
def ep_Q2_008_partial_03_0246 : Poly :=
[
  term ((1843367721265631962653173246630448000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (7, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1843367721265631962653173246630448000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (7, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1843367721265631962653173246630448000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (8, 2), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1843367721265631962653173246630448000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (9, 2), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 246 for generator 3. -/
theorem ep_Q2_008_partial_03_0246_valid :
    mulPoly ep_Q2_008_coefficient_03_0246
        ep_Q2_008_generator_03_0200_0299 =
      ep_Q2_008_partial_03_0246 := by
  native_decide

/-- Coefficient term 247 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0247 : Poly :=
[
  term ((364938985264381623 : Rat) / 2771825814456705436) [(4, 1), (7, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 247 for generator 3. -/
def ep_Q2_008_partial_03_0247 : Poly :=
[
  term ((364938985264381623 : Rat) / 2771825814456705436) [(2, 2), (4, 1), (7, 1), (11, 1), (12, 1), (16, 1)],
  term ((364938985264381623 : Rat) / 2771825814456705436) [(3, 2), (4, 1), (7, 1), (11, 1), (12, 1), (16, 1)],
  term ((-364938985264381623 : Rat) / 2771825814456705436) [(4, 1), (7, 1), (8, 2), (11, 1), (12, 1), (16, 1)],
  term ((-364938985264381623 : Rat) / 2771825814456705436) [(4, 1), (7, 1), (9, 2), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 247 for generator 3. -/
theorem ep_Q2_008_partial_03_0247_valid :
    mulPoly ep_Q2_008_coefficient_03_0247
        ep_Q2_008_generator_03_0200_0299 =
      ep_Q2_008_partial_03_0247 := by
  native_decide

/-- Coefficient term 248 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0248 : Poly :=
[
  term ((44317218905204031992912270369313309551703 : Rat) / 168707601851329515375740828258983054697998) [(4, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 248 for generator 3. -/
def ep_Q2_008_partial_03_0248 : Poly :=
[
  term ((44317218905204031992912270369313309551703 : Rat) / 168707601851329515375740828258983054697998) [(2, 2), (4, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((44317218905204031992912270369313309551703 : Rat) / 168707601851329515375740828258983054697998) [(3, 2), (4, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-44317218905204031992912270369313309551703 : Rat) / 168707601851329515375740828258983054697998) [(4, 1), (7, 1), (8, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-44317218905204031992912270369313309551703 : Rat) / 168707601851329515375740828258983054697998) [(4, 1), (7, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 248 for generator 3. -/
theorem ep_Q2_008_partial_03_0248_valid :
    mulPoly ep_Q2_008_coefficient_03_0248
        ep_Q2_008_generator_03_0200_0299 =
      ep_Q2_008_partial_03_0248 := by
  native_decide

/-- Coefficient term 249 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0249 : Poly :=
[
  term ((3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (11, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 249 for generator 3. -/
def ep_Q2_008_partial_03_0249 : Poly :=
[
  term ((3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (7, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (7, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (8, 2), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (9, 2), (11, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 249 for generator 3. -/
theorem ep_Q2_008_partial_03_0249_valid :
    mulPoly ep_Q2_008_coefficient_03_0249
        ep_Q2_008_generator_03_0200_0299 =
      ep_Q2_008_partial_03_0249 := by
  native_decide

/-- Coefficient term 250 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0250 : Poly :=
[
  term ((-2326334950970681373 : Rat) / 2771825814456705436) [(4, 1), (7, 1), (11, 1), (16, 1)]
]

/-- Partial product 250 for generator 3. -/
def ep_Q2_008_partial_03_0250 : Poly :=
[
  term ((-2326334950970681373 : Rat) / 2771825814456705436) [(2, 2), (4, 1), (7, 1), (11, 1), (16, 1)],
  term ((-2326334950970681373 : Rat) / 2771825814456705436) [(3, 2), (4, 1), (7, 1), (11, 1), (16, 1)],
  term ((2326334950970681373 : Rat) / 2771825814456705436) [(4, 1), (7, 1), (8, 2), (11, 1), (16, 1)],
  term ((2326334950970681373 : Rat) / 2771825814456705436) [(4, 1), (7, 1), (9, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 250 for generator 3. -/
theorem ep_Q2_008_partial_03_0250_valid :
    mulPoly ep_Q2_008_coefficient_03_0250
        ep_Q2_008_generator_03_0200_0299 =
      ep_Q2_008_partial_03_0250 := by
  native_decide

/-- Coefficient term 251 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0251 : Poly :=
[
  term ((-364938985264381623 : Rat) / 2771825814456705436) [(4, 1), (7, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 251 for generator 3. -/
def ep_Q2_008_partial_03_0251 : Poly :=
[
  term ((-364938985264381623 : Rat) / 2771825814456705436) [(2, 2), (4, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-364938985264381623 : Rat) / 2771825814456705436) [(3, 2), (4, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((364938985264381623 : Rat) / 2771825814456705436) [(4, 1), (7, 1), (8, 2), (12, 1), (13, 1), (16, 1)],
  term ((364938985264381623 : Rat) / 2771825814456705436) [(4, 1), (7, 1), (9, 2), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 251 for generator 3. -/
theorem ep_Q2_008_partial_03_0251_valid :
    mulPoly ep_Q2_008_coefficient_03_0251
        ep_Q2_008_generator_03_0200_0299 =
      ep_Q2_008_partial_03_0251 := by
  native_decide

/-- Coefficient term 252 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0252 : Poly :=
[
  term ((-1843367721265631962653173246630448000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 252 for generator 3. -/
def ep_Q2_008_partial_03_0252 : Poly :=
[
  term ((-1843367721265631962653173246630448000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1843367721265631962653173246630448000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((1843367721265631962653173246630448000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (8, 2), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((1843367721265631962653173246630448000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (9, 2), (12, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 252 for generator 3. -/
theorem ep_Q2_008_partial_03_0252_valid :
    mulPoly ep_Q2_008_coefficient_03_0252
        ep_Q2_008_generator_03_0200_0299 =
      ep_Q2_008_partial_03_0252 := by
  native_decide

/-- Coefficient term 253 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0253 : Poly :=
[
  term ((-32907330511941930766525666351656000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 253 for generator 3. -/
def ep_Q2_008_partial_03_0253 : Poly :=
[
  term ((-32907330511941930766525666351656000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-32907330511941930766525666351656000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((32907330511941930766525666351656000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (8, 2), (12, 1), (15, 1), (16, 1)],
  term ((32907330511941930766525666351656000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (9, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 253 for generator 3. -/
theorem ep_Q2_008_partial_03_0253_valid :
    mulPoly ep_Q2_008_coefficient_03_0253
        ep_Q2_008_generator_03_0200_0299 =
      ep_Q2_008_partial_03_0253 := by
  native_decide

/-- Coefficient term 254 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0254 : Poly :=
[
  term ((231003514099677687503378633290699200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 254 for generator 3. -/
def ep_Q2_008_partial_03_0254 : Poly :=
[
  term ((231003514099677687503378633290699200 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((231003514099677687503378633290699200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-231003514099677687503378633290699200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (8, 2), (13, 1), (15, 2), (16, 1)],
  term ((-231003514099677687503378633290699200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (9, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 254 for generator 3. -/
theorem ep_Q2_008_partial_03_0254_valid :
    mulPoly ep_Q2_008_coefficient_03_0254
        ep_Q2_008_generator_03_0200_0299 =
      ep_Q2_008_partial_03_0254 := by
  native_decide

/-- Coefficient term 255 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0255 : Poly :=
[
  term ((3448052429063870577 : Rat) / 1385912907228352718) [(4, 1), (7, 1), (13, 1), (16, 1)]
]

/-- Partial product 255 for generator 3. -/
def ep_Q2_008_partial_03_0255 : Poly :=
[
  term ((3448052429063870577 : Rat) / 1385912907228352718) [(2, 2), (4, 1), (7, 1), (13, 1), (16, 1)],
  term ((3448052429063870577 : Rat) / 1385912907228352718) [(3, 2), (4, 1), (7, 1), (13, 1), (16, 1)],
  term ((-3448052429063870577 : Rat) / 1385912907228352718) [(4, 1), (7, 1), (8, 2), (13, 1), (16, 1)],
  term ((-3448052429063870577 : Rat) / 1385912907228352718) [(4, 1), (7, 1), (9, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 255 for generator 3. -/
theorem ep_Q2_008_partial_03_0255_valid :
    mulPoly ep_Q2_008_coefficient_03_0255
        ep_Q2_008_generator_03_0200_0299 =
      ep_Q2_008_partial_03_0255 := by
  native_decide

/-- Coefficient term 256 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0256 : Poly :=
[
  term ((44636451609985698450825176564615992156503 : Rat) / 168707601851329515375740828258983054697998) [(4, 1), (7, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 256 for generator 3. -/
def ep_Q2_008_partial_03_0256 : Poly :=
[
  term ((44636451609985698450825176564615992156503 : Rat) / 168707601851329515375740828258983054697998) [(2, 2), (4, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((44636451609985698450825176564615992156503 : Rat) / 168707601851329515375740828258983054697998) [(3, 2), (4, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-44636451609985698450825176564615992156503 : Rat) / 168707601851329515375740828258983054697998) [(4, 1), (7, 1), (8, 2), (13, 2), (15, 1), (16, 1)],
  term ((-44636451609985698450825176564615992156503 : Rat) / 168707601851329515375740828258983054697998) [(4, 1), (7, 1), (9, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 256 for generator 3. -/
theorem ep_Q2_008_partial_03_0256_valid :
    mulPoly ep_Q2_008_coefficient_03_0256
        ep_Q2_008_generator_03_0200_0299 =
      ep_Q2_008_partial_03_0256 := by
  native_decide

/-- Coefficient term 257 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0257 : Poly :=
[
  term ((3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (13, 3), (15, 2), (16, 1)]
]

/-- Partial product 257 for generator 3. -/
def ep_Q2_008_partial_03_0257 : Poly :=
[
  term ((3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (7, 1), (13, 3), (15, 2), (16, 1)],
  term ((3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (7, 1), (13, 3), (15, 2), (16, 1)],
  term ((-3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (8, 2), (13, 3), (15, 2), (16, 1)],
  term ((-3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (9, 2), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 257 for generator 3. -/
theorem ep_Q2_008_partial_03_0257_valid :
    mulPoly ep_Q2_008_coefficient_03_0257
        ep_Q2_008_generator_03_0200_0299 =
      ep_Q2_008_partial_03_0257 := by
  native_decide

/-- Coefficient term 258 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0258 : Poly :=
[
  term ((364938985264381623 : Rat) / 692956453614176359) [(4, 1), (7, 1), (13, 3), (16, 1)]
]

/-- Partial product 258 for generator 3. -/
def ep_Q2_008_partial_03_0258 : Poly :=
[
  term ((364938985264381623 : Rat) / 692956453614176359) [(2, 2), (4, 1), (7, 1), (13, 3), (16, 1)],
  term ((364938985264381623 : Rat) / 692956453614176359) [(3, 2), (4, 1), (7, 1), (13, 3), (16, 1)],
  term ((-364938985264381623 : Rat) / 692956453614176359) [(4, 1), (7, 1), (8, 2), (13, 3), (16, 1)],
  term ((-364938985264381623 : Rat) / 692956453614176359) [(4, 1), (7, 1), (9, 2), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 258 for generator 3. -/
theorem ep_Q2_008_partial_03_0258_valid :
    mulPoly ep_Q2_008_coefficient_03_0258
        ep_Q2_008_generator_03_0200_0299 =
      ep_Q2_008_partial_03_0258 := by
  native_decide

/-- Coefficient term 259 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0259 : Poly :=
[
  term ((7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (13, 4), (15, 1), (16, 1)]
]

/-- Partial product 259 for generator 3. -/
def ep_Q2_008_partial_03_0259 : Poly :=
[
  term ((7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (7, 1), (13, 4), (15, 1), (16, 1)],
  term ((7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (7, 1), (13, 4), (15, 1), (16, 1)],
  term ((-7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (8, 2), (13, 4), (15, 1), (16, 1)],
  term ((-7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (9, 2), (13, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 259 for generator 3. -/
theorem ep_Q2_008_partial_03_0259_valid :
    mulPoly ep_Q2_008_coefficient_03_0259
        ep_Q2_008_generator_03_0200_0299 =
      ep_Q2_008_partial_03_0259 := by
  native_decide

/-- Coefficient term 260 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0260 : Poly :=
[
  term ((78312584302211849949831787707070800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 260 for generator 3. -/
def ep_Q2_008_partial_03_0260 : Poly :=
[
  term ((78312584302211849949831787707070800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((78312584302211849949831787707070800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((-78312584302211849949831787707070800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (8, 2), (15, 1), (16, 1)],
  term ((-78312584302211849949831787707070800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 260 for generator 3. -/
theorem ep_Q2_008_partial_03_0260_valid :
    mulPoly ep_Q2_008_coefficient_03_0260
        ep_Q2_008_generator_03_0200_0299 =
      ep_Q2_008_partial_03_0260 := by
  native_decide

/-- Coefficient term 261 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0261 : Poly :=
[
  term ((50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 261 for generator 3. -/
def ep_Q2_008_partial_03_0261 : Poly :=
[
  term ((50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (7, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (7, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (8, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 261 for generator 3. -/
theorem ep_Q2_008_partial_03_0261_valid :
    mulPoly ep_Q2_008_coefficient_03_0261
        ep_Q2_008_generator_03_0200_0299 =
      ep_Q2_008_partial_03_0261 := by
  native_decide

/-- Coefficient term 262 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0262 : Poly :=
[
  term ((101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 262 for generator 3. -/
def ep_Q2_008_partial_03_0262 : Poly :=
[
  term ((101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (7, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (7, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (8, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (9, 2), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 262 for generator 3. -/
theorem ep_Q2_008_partial_03_0262_valid :
    mulPoly ep_Q2_008_coefficient_03_0262
        ep_Q2_008_generator_03_0200_0299 =
      ep_Q2_008_partial_03_0262 := by
  native_decide

/-- Coefficient term 263 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0263 : Poly :=
[
  term ((-50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 263 for generator 3. -/
def ep_Q2_008_partial_03_0263 : Poly :=
[
  term ((-50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((-50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (8, 2), (11, 1), (15, 1), (16, 1)],
  term ((50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 263 for generator 3. -/
theorem ep_Q2_008_partial_03_0263_valid :
    mulPoly ep_Q2_008_coefficient_03_0263
        ep_Q2_008_generator_03_0200_0299 =
      ep_Q2_008_partial_03_0263 := by
  native_decide

/-- Coefficient term 264 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0264 : Poly :=
[
  term ((-50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 264 for generator 3. -/
def ep_Q2_008_partial_03_0264 : Poly :=
[
  term ((-50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (7, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (7, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (8, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (9, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 264 for generator 3. -/
theorem ep_Q2_008_partial_03_0264_valid :
    mulPoly ep_Q2_008_coefficient_03_0264
        ep_Q2_008_generator_03_0200_0299 =
      ep_Q2_008_partial_03_0264 := by
  native_decide

/-- Coefficient term 265 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0265 : Poly :=
[
  term ((115982493152720841046994376524832000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 265 for generator 3. -/
def ep_Q2_008_partial_03_0265 : Poly :=
[
  term ((115982493152720841046994376524832000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((115982493152720841046994376524832000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-115982493152720841046994376524832000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((-115982493152720841046994376524832000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 265 for generator 3. -/
theorem ep_Q2_008_partial_03_0265_valid :
    mulPoly ep_Q2_008_coefficient_03_0265
        ep_Q2_008_generator_03_0200_0299 =
      ep_Q2_008_partial_03_0265 := by
  native_decide

/-- Coefficient term 266 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0266 : Poly :=
[
  term ((101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 266 for generator 3. -/
def ep_Q2_008_partial_03_0266 : Poly :=
[
  term ((101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (7, 2), (13, 2), (15, 2), (16, 1)],
  term ((101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (7, 2), (13, 2), (15, 2), (16, 1)],
  term ((-101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (8, 2), (13, 2), (15, 2), (16, 1)],
  term ((-101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (9, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 266 for generator 3. -/
theorem ep_Q2_008_partial_03_0266_valid :
    mulPoly ep_Q2_008_coefficient_03_0266
        ep_Q2_008_generator_03_0200_0299 =
      ep_Q2_008_partial_03_0266 := by
  native_decide

/-- Coefficient term 267 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0267 : Poly :=
[
  term ((203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 267 for generator 3. -/
def ep_Q2_008_partial_03_0267 : Poly :=
[
  term ((203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (7, 2), (13, 3), (15, 1), (16, 1)],
  term ((203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (7, 2), (13, 3), (15, 1), (16, 1)],
  term ((-203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (8, 2), (13, 3), (15, 1), (16, 1)],
  term ((-203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (9, 2), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 267 for generator 3. -/
theorem ep_Q2_008_partial_03_0267_valid :
    mulPoly ep_Q2_008_coefficient_03_0267
        ep_Q2_008_generator_03_0200_0299 =
      ep_Q2_008_partial_03_0267 := by
  native_decide

/-- Coefficient term 268 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0268 : Poly :=
[
  term ((-65144989867565479901745233906429184000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 268 for generator 3. -/
def ep_Q2_008_partial_03_0268 : Poly :=
[
  term ((-65144989867565479901745233906429184000 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (8, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-65144989867565479901745233906429184000 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (8, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((65144989867565479901745233906429184000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 1), (9, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((65144989867565479901745233906429184000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 3), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 268 for generator 3. -/
theorem ep_Q2_008_partial_03_0268_valid :
    mulPoly ep_Q2_008_coefficient_03_0268
        ep_Q2_008_generator_03_0200_0299 =
      ep_Q2_008_partial_03_0268 := by
  native_decide

/-- Coefficient term 269 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0269 : Poly :=
[
  term ((-2669859283589517375 : Rat) / 1385912907228352718) [(4, 1), (8, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 269 for generator 3. -/
def ep_Q2_008_partial_03_0269 : Poly :=
[
  term ((-2669859283589517375 : Rat) / 1385912907228352718) [(2, 2), (4, 1), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((-2669859283589517375 : Rat) / 1385912907228352718) [(3, 2), (4, 1), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((2669859283589517375 : Rat) / 1385912907228352718) [(4, 1), (8, 1), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((2669859283589517375 : Rat) / 1385912907228352718) [(4, 1), (8, 3), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 269 for generator 3. -/
theorem ep_Q2_008_partial_03_0269_valid :
    mulPoly ep_Q2_008_coefficient_03_0269
        ep_Q2_008_generator_03_0200_0299 =
      ep_Q2_008_partial_03_0269 := by
  native_decide

/-- Coefficient term 270 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0270 : Poly :=
[
  term ((-195570254767485599874767550375887270400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 270 for generator 3. -/
def ep_Q2_008_partial_03_0270 : Poly :=
[
  term ((-195570254767485599874767550375887270400 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (8, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-195570254767485599874767550375887270400 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (8, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((195570254767485599874767550375887270400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 1), (9, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((195570254767485599874767550375887270400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 3), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 270 for generator 3. -/
theorem ep_Q2_008_partial_03_0270_valid :
    mulPoly ep_Q2_008_coefficient_03_0270
        ep_Q2_008_generator_03_0200_0299 =
      ep_Q2_008_partial_03_0270 := by
  native_decide

/-- Coefficient term 271 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0271 : Poly :=
[
  term ((14101733902665438481833198704299528700100 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 271 for generator 3. -/
def ep_Q2_008_partial_03_0271 : Poly :=
[
  term ((14101733902665438481833198704299528700100 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((14101733902665438481833198704299528700100 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-14101733902665438481833198704299528700100 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-14101733902665438481833198704299528700100 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 3), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 271 for generator 3. -/
theorem ep_Q2_008_partial_03_0271_valid :
    mulPoly ep_Q2_008_coefficient_03_0271
        ep_Q2_008_generator_03_0200_0299 =
      ep_Q2_008_partial_03_0271 := by
  native_decide

/-- Coefficient term 272 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0272 : Poly :=
[
  term ((83370814993305000 : Rat) / 692956453614176359) [(4, 1), (8, 1), (11, 2), (16, 1)]
]

/-- Partial product 272 for generator 3. -/
def ep_Q2_008_partial_03_0272 : Poly :=
[
  term ((83370814993305000 : Rat) / 692956453614176359) [(2, 2), (4, 1), (8, 1), (11, 2), (16, 1)],
  term ((83370814993305000 : Rat) / 692956453614176359) [(3, 2), (4, 1), (8, 1), (11, 2), (16, 1)],
  term ((-83370814993305000 : Rat) / 692956453614176359) [(4, 1), (8, 1), (9, 2), (11, 2), (16, 1)],
  term ((-83370814993305000 : Rat) / 692956453614176359) [(4, 1), (8, 3), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 272 for generator 3. -/
theorem ep_Q2_008_partial_03_0272_valid :
    mulPoly ep_Q2_008_coefficient_03_0272
        ep_Q2_008_generator_03_0200_0299 =
      ep_Q2_008_partial_03_0272 := by
  native_decide

/-- Coefficient term 273 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0273 : Poly :=
[
  term ((-14103247945961947910932228785528532068900 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 273 for generator 3. -/
def ep_Q2_008_partial_03_0273 : Poly :=
[
  term ((-14103247945961947910932228785528532068900 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-14103247945961947910932228785528532068900 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((14103247945961947910932228785528532068900 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((14103247945961947910932228785528532068900 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 273 for generator 3. -/
theorem ep_Q2_008_partial_03_0273_valid :
    mulPoly ep_Q2_008_coefficient_03_0273
        ep_Q2_008_generator_03_0200_0299 =
      ep_Q2_008_partial_03_0273 := by
  native_decide

/-- Coefficient term 274 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0274 : Poly :=
[
  term ((65144989867565479901745233906429184000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 274 for generator 3. -/
def ep_Q2_008_partial_03_0274 : Poly :=
[
  term ((65144989867565479901745233906429184000 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (8, 1), (13, 2), (15, 2), (16, 1)],
  term ((65144989867565479901745233906429184000 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (8, 1), (13, 2), (15, 2), (16, 1)],
  term ((-65144989867565479901745233906429184000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 1), (9, 2), (13, 2), (15, 2), (16, 1)],
  term ((-65144989867565479901745233906429184000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 3), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 274 for generator 3. -/
theorem ep_Q2_008_partial_03_0274_valid :
    mulPoly ep_Q2_008_coefficient_03_0274
        ep_Q2_008_generator_03_0200_0299 =
      ep_Q2_008_partial_03_0274 := by
  native_decide

/-- Coefficient term 275 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0275 : Poly :=
[
  term ((2503117653602907375 : Rat) / 1385912907228352718) [(4, 1), (8, 1), (13, 2), (16, 1)]
]

/-- Partial product 275 for generator 3. -/
def ep_Q2_008_partial_03_0275 : Poly :=
[
  term ((2503117653602907375 : Rat) / 1385912907228352718) [(2, 2), (4, 1), (8, 1), (13, 2), (16, 1)],
  term ((2503117653602907375 : Rat) / 1385912907228352718) [(3, 2), (4, 1), (8, 1), (13, 2), (16, 1)],
  term ((-2503117653602907375 : Rat) / 1385912907228352718) [(4, 1), (8, 1), (9, 2), (13, 2), (16, 1)],
  term ((-2503117653602907375 : Rat) / 1385912907228352718) [(4, 1), (8, 3), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 275 for generator 3. -/
theorem ep_Q2_008_partial_03_0275_valid :
    mulPoly ep_Q2_008_coefficient_03_0275
        ep_Q2_008_generator_03_0200_0299 =
      ep_Q2_008_partial_03_0275 := by
  native_decide

/-- Coefficient term 276 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0276 : Poly :=
[
  term ((195570254767485599874767550375887270400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 276 for generator 3. -/
def ep_Q2_008_partial_03_0276 : Poly :=
[
  term ((195570254767485599874767550375887270400 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (8, 1), (13, 3), (15, 1), (16, 1)],
  term ((195570254767485599874767550375887270400 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (8, 1), (13, 3), (15, 1), (16, 1)],
  term ((-195570254767485599874767550375887270400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 1), (9, 2), (13, 3), (15, 1), (16, 1)],
  term ((-195570254767485599874767550375887270400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 3), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 276 for generator 3. -/
theorem ep_Q2_008_partial_03_0276_valid :
    mulPoly ep_Q2_008_coefficient_03_0276
        ep_Q2_008_generator_03_0200_0299 =
      ep_Q2_008_partial_03_0276 := by
  native_decide

/-- Coefficient term 277 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0277 : Poly :=
[
  term ((-83370814993305000 : Rat) / 692956453614176359) [(4, 1), (9, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 277 for generator 3. -/
def ep_Q2_008_partial_03_0277 : Poly :=
[
  term ((-83370814993305000 : Rat) / 692956453614176359) [(2, 2), (4, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-83370814993305000 : Rat) / 692956453614176359) [(3, 2), (4, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((83370814993305000 : Rat) / 692956453614176359) [(4, 1), (8, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((83370814993305000 : Rat) / 692956453614176359) [(4, 1), (9, 3), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 277 for generator 3. -/
theorem ep_Q2_008_partial_03_0277_valid :
    mulPoly ep_Q2_008_coefficient_03_0277
        ep_Q2_008_generator_03_0200_0299 =
      ep_Q2_008_partial_03_0277 := by
  native_decide

/-- Coefficient term 278 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0278 : Poly :=
[
  term ((65144989867565479901745233906429184000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (10, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 278 for generator 3. -/
def ep_Q2_008_partial_03_0278 : Poly :=
[
  term ((65144989867565479901745233906429184000 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (9, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((65144989867565479901745233906429184000 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (9, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-65144989867565479901745233906429184000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 2), (9, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-65144989867565479901745233906429184000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 3), (10, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 278 for generator 3. -/
theorem ep_Q2_008_partial_03_0278_valid :
    mulPoly ep_Q2_008_coefficient_03_0278
        ep_Q2_008_generator_03_0200_0299 =
      ep_Q2_008_partial_03_0278 := by
  native_decide

/-- Coefficient term 279 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0279 : Poly :=
[
  term ((2503117653602907375 : Rat) / 1385912907228352718) [(4, 1), (9, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 279 for generator 3. -/
def ep_Q2_008_partial_03_0279 : Poly :=
[
  term ((2503117653602907375 : Rat) / 1385912907228352718) [(2, 2), (4, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((2503117653602907375 : Rat) / 1385912907228352718) [(3, 2), (4, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-2503117653602907375 : Rat) / 1385912907228352718) [(4, 1), (8, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-2503117653602907375 : Rat) / 1385912907228352718) [(4, 1), (9, 3), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 279 for generator 3. -/
theorem ep_Q2_008_partial_03_0279_valid :
    mulPoly ep_Q2_008_coefficient_03_0279
        ep_Q2_008_generator_03_0200_0299 =
      ep_Q2_008_partial_03_0279 := by
  native_decide

/-- Coefficient term 280 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0280 : Poly :=
[
  term ((195570254767485599874767550375887270400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 280 for generator 3. -/
def ep_Q2_008_partial_03_0280 : Poly :=
[
  term ((195570254767485599874767550375887270400 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (9, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((195570254767485599874767550375887270400 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (9, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-195570254767485599874767550375887270400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 2), (9, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-195570254767485599874767550375887270400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 3), (10, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 280 for generator 3. -/
theorem ep_Q2_008_partial_03_0280_valid :
    mulPoly ep_Q2_008_coefficient_03_0280
        ep_Q2_008_generator_03_0200_0299 =
      ep_Q2_008_partial_03_0280 := by
  native_decide

/-- Coefficient term 281 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0281 : Poly :=
[
  term ((-14101733902665438481833198704299528700100 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 281 for generator 3. -/
def ep_Q2_008_partial_03_0281 : Poly :=
[
  term ((-14101733902665438481833198704299528700100 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-14101733902665438481833198704299528700100 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((14101733902665438481833198704299528700100 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((14101733902665438481833198704299528700100 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 3), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 281 for generator 3. -/
theorem ep_Q2_008_partial_03_0281_valid :
    mulPoly ep_Q2_008_coefficient_03_0281
        ep_Q2_008_generator_03_0200_0299 =
      ep_Q2_008_partial_03_0281 := by
  native_decide

/-- Coefficient term 282 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0282 : Poly :=
[
  term ((459797430806791875 : Rat) / 692956453614176359) [(4, 1), (9, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 282 for generator 3. -/
def ep_Q2_008_partial_03_0282 : Poly :=
[
  term ((459797430806791875 : Rat) / 692956453614176359) [(2, 2), (4, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((459797430806791875 : Rat) / 692956453614176359) [(3, 2), (4, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-459797430806791875 : Rat) / 692956453614176359) [(4, 1), (8, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-459797430806791875 : Rat) / 692956453614176359) [(4, 1), (9, 3), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 282 for generator 3. -/
theorem ep_Q2_008_partial_03_0282_valid :
    mulPoly ep_Q2_008_coefficient_03_0282
        ep_Q2_008_generator_03_0200_0299 =
      ep_Q2_008_partial_03_0282 := by
  native_decide

/-- Coefficient term 283 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0283 : Poly :=
[
  term ((-161001756239771343352682147676603868800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 283 for generator 3. -/
def ep_Q2_008_partial_03_0283 : Poly :=
[
  term ((-161001756239771343352682147676603868800 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-161001756239771343352682147676603868800 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((161001756239771343352682147676603868800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((161001756239771343352682147676603868800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 3), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 283 for generator 3. -/
theorem ep_Q2_008_partial_03_0283_valid :
    mulPoly ep_Q2_008_coefficient_03_0283
        ep_Q2_008_generator_03_0200_0299 =
      ep_Q2_008_partial_03_0283 := by
  native_decide

/-- Coefficient term 284 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0284 : Poly :=
[
  term ((-9869659753932509733 : Rat) / 2771825814456705436) [(4, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 284 for generator 3. -/
def ep_Q2_008_partial_03_0284 : Poly :=
[
  term ((-9869659753932509733 : Rat) / 2771825814456705436) [(2, 2), (4, 1), (9, 1), (11, 1), (16, 1)],
  term ((-9869659753932509733 : Rat) / 2771825814456705436) [(3, 2), (4, 1), (9, 1), (11, 1), (16, 1)],
  term ((9869659753932509733 : Rat) / 2771825814456705436) [(4, 1), (8, 2), (9, 1), (11, 1), (16, 1)],
  term ((9869659753932509733 : Rat) / 2771825814456705436) [(4, 1), (9, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 284 for generator 3. -/
theorem ep_Q2_008_partial_03_0284_valid :
    mulPoly ep_Q2_008_coefficient_03_0284
        ep_Q2_008_generator_03_0200_0299 =
      ep_Q2_008_partial_03_0284 := by
  native_decide

/-- Coefficient term 285 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0285 : Poly :=
[
  term ((-65144989867565479901745233906429184000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 285 for generator 3. -/
def ep_Q2_008_partial_03_0285 : Poly :=
[
  term ((-65144989867565479901745233906429184000 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-65144989867565479901745233906429184000 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((65144989867565479901745233906429184000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 2), (9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((65144989867565479901745233906429184000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 3), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 285 for generator 3. -/
theorem ep_Q2_008_partial_03_0285_valid :
    mulPoly ep_Q2_008_coefficient_03_0285
        ep_Q2_008_generator_03_0200_0299 =
      ep_Q2_008_partial_03_0285 := by
  native_decide

/-- Coefficient term 286 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0286 : Poly :=
[
  term ((-2503117653602907375 : Rat) / 1385912907228352718) [(4, 1), (9, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 286 for generator 3. -/
def ep_Q2_008_partial_03_0286 : Poly :=
[
  term ((-2503117653602907375 : Rat) / 1385912907228352718) [(2, 2), (4, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-2503117653602907375 : Rat) / 1385912907228352718) [(3, 2), (4, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((2503117653602907375 : Rat) / 1385912907228352718) [(4, 1), (8, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((2503117653602907375 : Rat) / 1385912907228352718) [(4, 1), (9, 3), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 286 for generator 3. -/
theorem ep_Q2_008_partial_03_0286_valid :
    mulPoly ep_Q2_008_coefficient_03_0286
        ep_Q2_008_generator_03_0200_0299 =
      ep_Q2_008_partial_03_0286 := by
  native_decide

/-- Coefficient term 287 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0287 : Poly :=
[
  term ((-195570254767485599874767550375887270400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 287 for generator 3. -/
def ep_Q2_008_partial_03_0287 : Poly :=
[
  term ((-195570254767485599874767550375887270400 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (9, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-195570254767485599874767550375887270400 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (9, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((195570254767485599874767550375887270400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 2), (9, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((195570254767485599874767550375887270400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 3), (12, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 287 for generator 3. -/
theorem ep_Q2_008_partial_03_0287_valid :
    mulPoly ep_Q2_008_coefficient_03_0287
        ep_Q2_008_generator_03_0200_0299 =
      ep_Q2_008_partial_03_0287 := by
  native_decide

/-- Coefficient term 288 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0288 : Poly :=
[
  term ((22499390684874753044466188879943146268000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 288 for generator 3. -/
def ep_Q2_008_partial_03_0288 : Poly :=
[
  term ((22499390684874753044466188879943146268000 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((22499390684874753044466188879943146268000 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-22499390684874753044466188879943146268000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-22499390684874753044466188879943146268000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 3), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 288 for generator 3. -/
theorem ep_Q2_008_partial_03_0288_valid :
    mulPoly ep_Q2_008_coefficient_03_0288
        ep_Q2_008_generator_03_0200_0299 =
      ep_Q2_008_partial_03_0288 := by
  native_decide

/-- Coefficient term 289 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0289 : Poly :=
[
  term ((78173987841078575882094280687715020800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 289 for generator 3. -/
def ep_Q2_008_partial_03_0289 : Poly :=
[
  term ((78173987841078575882094280687715020800 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((78173987841078575882094280687715020800 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-78173987841078575882094280687715020800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-78173987841078575882094280687715020800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 3), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 289 for generator 3. -/
theorem ep_Q2_008_partial_03_0289_valid :
    mulPoly ep_Q2_008_coefficient_03_0289
        ep_Q2_008_generator_03_0200_0299 =
      ep_Q2_008_partial_03_0289 := by
  native_decide

/-- Coefficient term 290 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0290 : Poly :=
[
  term ((2174935314585914775 : Rat) / 1385912907228352718) [(4, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 290 for generator 3. -/
def ep_Q2_008_partial_03_0290 : Poly :=
[
  term ((2174935314585914775 : Rat) / 1385912907228352718) [(2, 2), (4, 1), (9, 1), (13, 1), (16, 1)],
  term ((2174935314585914775 : Rat) / 1385912907228352718) [(3, 2), (4, 1), (9, 1), (13, 1), (16, 1)],
  term ((-2174935314585914775 : Rat) / 1385912907228352718) [(4, 1), (8, 2), (9, 1), (13, 1), (16, 1)],
  term ((-2174935314585914775 : Rat) / 1385912907228352718) [(4, 1), (9, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 290 for generator 3. -/
theorem ep_Q2_008_partial_03_0290_valid :
    mulPoly ep_Q2_008_coefficient_03_0290
        ep_Q2_008_generator_03_0200_0299 =
      ep_Q2_008_partial_03_0290 := by
  native_decide

/-- Coefficient term 291 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0291 : Poly :=
[
  term ((286773240582077271737210877844888128000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 291 for generator 3. -/
def ep_Q2_008_partial_03_0291 : Poly :=
[
  term ((286773240582077271737210877844888128000 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((286773240582077271737210877844888128000 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-286773240582077271737210877844888128000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 2), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-286773240582077271737210877844888128000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 3), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 291 for generator 3. -/
theorem ep_Q2_008_partial_03_0291_valid :
    mulPoly ep_Q2_008_coefficient_03_0291
        ep_Q2_008_generator_03_0200_0299 =
      ep_Q2_008_partial_03_0291 := by
  native_decide

/-- Coefficient term 292 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0292 : Poly :=
[
  term ((-16956800549486519299631363131085491003800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 292 for generator 3. -/
def ep_Q2_008_partial_03_0292 : Poly :=
[
  term ((-16956800549486519299631363131085491003800 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((-16956800549486519299631363131085491003800 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((16956800549486519299631363131085491003800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 2), (9, 1), (15, 1), (16, 1)],
  term ((16956800549486519299631363131085491003800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 292 for generator 3. -/
theorem ep_Q2_008_partial_03_0292_valid :
    mulPoly ep_Q2_008_coefficient_03_0292
        ep_Q2_008_generator_03_0200_0299 =
      ep_Q2_008_partial_03_0292 := by
  native_decide

/-- Coefficient term 293 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0293 : Poly :=
[
  term ((47640465710460000 : Rat) / 692956453614176359) [(4, 1), (10, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 293 for generator 3. -/
def ep_Q2_008_partial_03_0293 : Poly :=
[
  term ((47640465710460000 : Rat) / 692956453614176359) [(2, 2), (4, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((47640465710460000 : Rat) / 692956453614176359) [(3, 2), (4, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-47640465710460000 : Rat) / 692956453614176359) [(4, 1), (8, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-47640465710460000 : Rat) / 692956453614176359) [(4, 1), (9, 2), (10, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 293 for generator 3. -/
theorem ep_Q2_008_partial_03_0293_valid :
    mulPoly ep_Q2_008_coefficient_03_0293
        ep_Q2_008_generator_03_0200_0299 =
      ep_Q2_008_partial_03_0293 := by
  native_decide

/-- Coefficient term 294 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0294 : Poly :=
[
  term ((362604775223538913274506125351976883646600 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 294 for generator 3. -/
def ep_Q2_008_partial_03_0294 : Poly :=
[
  term ((362604775223538913274506125351976883646600 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((362604775223538913274506125351976883646600 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-362604775223538913274506125351976883646600 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-362604775223538913274506125351976883646600 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 2), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 294 for generator 3. -/
theorem ep_Q2_008_partial_03_0294_valid :
    mulPoly ep_Q2_008_coefficient_03_0294
        ep_Q2_008_generator_03_0200_0299 =
      ep_Q2_008_partial_03_0294 := by
  native_decide

/-- Coefficient term 295 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0295 : Poly :=
[
  term ((771775544509452000 : Rat) / 692956453614176359) [(4, 1), (10, 1), (13, 2), (16, 1)]
]

/-- Partial product 295 for generator 3. -/
def ep_Q2_008_partial_03_0295 : Poly :=
[
  term ((771775544509452000 : Rat) / 692956453614176359) [(2, 2), (4, 1), (10, 1), (13, 2), (16, 1)],
  term ((771775544509452000 : Rat) / 692956453614176359) [(3, 2), (4, 1), (10, 1), (13, 2), (16, 1)],
  term ((-771775544509452000 : Rat) / 692956453614176359) [(4, 1), (8, 2), (10, 1), (13, 2), (16, 1)],
  term ((-771775544509452000 : Rat) / 692956453614176359) [(4, 1), (9, 2), (10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 295 for generator 3. -/
theorem ep_Q2_008_partial_03_0295_valid :
    mulPoly ep_Q2_008_coefficient_03_0295
        ep_Q2_008_generator_03_0200_0299 =
      ep_Q2_008_partial_03_0295 := by
  native_decide

/-- Coefficient term 296 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0296 : Poly :=
[
  term ((9536176493959289733 : Rat) / 5543651628913410872) [(4, 1), (10, 1), (16, 1)]
]

/-- Partial product 296 for generator 3. -/
def ep_Q2_008_partial_03_0296 : Poly :=
[
  term ((9536176493959289733 : Rat) / 5543651628913410872) [(2, 2), (4, 1), (10, 1), (16, 1)],
  term ((9536176493959289733 : Rat) / 5543651628913410872) [(3, 2), (4, 1), (10, 1), (16, 1)],
  term ((-9536176493959289733 : Rat) / 5543651628913410872) [(4, 1), (8, 2), (10, 1), (16, 1)],
  term ((-9536176493959289733 : Rat) / 5543651628913410872) [(4, 1), (9, 2), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 296 for generator 3. -/
theorem ep_Q2_008_partial_03_0296_valid :
    mulPoly ep_Q2_008_coefficient_03_0296
        ep_Q2_008_generator_03_0200_0299 =
      ep_Q2_008_partial_03_0296 := by
  native_decide

/-- Coefficient term 297 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0297 : Poly :=
[
  term ((-228007464536479179656108318672502144000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 297 for generator 3. -/
def ep_Q2_008_partial_03_0297 : Poly :=
[
  term ((-228007464536479179656108318672502144000 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-228007464536479179656108318672502144000 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((228007464536479179656108318672502144000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 2), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((228007464536479179656108318672502144000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 2), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 297 for generator 3. -/
theorem ep_Q2_008_partial_03_0297_valid :
    mulPoly ep_Q2_008_coefficient_03_0297
        ep_Q2_008_generator_03_0200_0299 =
      ep_Q2_008_partial_03_0297 := by
  native_decide

/-- Coefficient term 298 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0298 : Poly :=
[
  term ((38816249744893500 : Rat) / 692956453614176359) [(4, 1), (11, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 298 for generator 3. -/
def ep_Q2_008_partial_03_0298 : Poly :=
[
  term ((38816249744893500 : Rat) / 692956453614176359) [(2, 2), (4, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((38816249744893500 : Rat) / 692956453614176359) [(3, 2), (4, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-38816249744893500 : Rat) / 692956453614176359) [(4, 1), (8, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-38816249744893500 : Rat) / 692956453614176359) [(4, 1), (9, 2), (11, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 298 for generator 3. -/
theorem ep_Q2_008_partial_03_0298_valid :
    mulPoly ep_Q2_008_coefficient_03_0298
        ep_Q2_008_generator_03_0200_0299 =
      ep_Q2_008_partial_03_0298 := by
  native_decide

/-- Coefficient term 299 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0299 : Poly :=
[
  term ((-1034314563162723134529794054978695564800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 299 for generator 3. -/
def ep_Q2_008_partial_03_0299 : Poly :=
[
  term ((-1034314563162723134529794054978695564800 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1034314563162723134529794054978695564800 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((1034314563162723134529794054978695564800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 2), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((1034314563162723134529794054978695564800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 2), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 299 for generator 3. -/
theorem ep_Q2_008_partial_03_0299_valid :
    mulPoly ep_Q2_008_coefficient_03_0299
        ep_Q2_008_generator_03_0200_0299 =
      ep_Q2_008_partial_03_0299 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_008_partials_03_0200_0299 : List Poly :=
[
  ep_Q2_008_partial_03_0200,
  ep_Q2_008_partial_03_0201,
  ep_Q2_008_partial_03_0202,
  ep_Q2_008_partial_03_0203,
  ep_Q2_008_partial_03_0204,
  ep_Q2_008_partial_03_0205,
  ep_Q2_008_partial_03_0206,
  ep_Q2_008_partial_03_0207,
  ep_Q2_008_partial_03_0208,
  ep_Q2_008_partial_03_0209,
  ep_Q2_008_partial_03_0210,
  ep_Q2_008_partial_03_0211,
  ep_Q2_008_partial_03_0212,
  ep_Q2_008_partial_03_0213,
  ep_Q2_008_partial_03_0214,
  ep_Q2_008_partial_03_0215,
  ep_Q2_008_partial_03_0216,
  ep_Q2_008_partial_03_0217,
  ep_Q2_008_partial_03_0218,
  ep_Q2_008_partial_03_0219,
  ep_Q2_008_partial_03_0220,
  ep_Q2_008_partial_03_0221,
  ep_Q2_008_partial_03_0222,
  ep_Q2_008_partial_03_0223,
  ep_Q2_008_partial_03_0224,
  ep_Q2_008_partial_03_0225,
  ep_Q2_008_partial_03_0226,
  ep_Q2_008_partial_03_0227,
  ep_Q2_008_partial_03_0228,
  ep_Q2_008_partial_03_0229,
  ep_Q2_008_partial_03_0230,
  ep_Q2_008_partial_03_0231,
  ep_Q2_008_partial_03_0232,
  ep_Q2_008_partial_03_0233,
  ep_Q2_008_partial_03_0234,
  ep_Q2_008_partial_03_0235,
  ep_Q2_008_partial_03_0236,
  ep_Q2_008_partial_03_0237,
  ep_Q2_008_partial_03_0238,
  ep_Q2_008_partial_03_0239,
  ep_Q2_008_partial_03_0240,
  ep_Q2_008_partial_03_0241,
  ep_Q2_008_partial_03_0242,
  ep_Q2_008_partial_03_0243,
  ep_Q2_008_partial_03_0244,
  ep_Q2_008_partial_03_0245,
  ep_Q2_008_partial_03_0246,
  ep_Q2_008_partial_03_0247,
  ep_Q2_008_partial_03_0248,
  ep_Q2_008_partial_03_0249,
  ep_Q2_008_partial_03_0250,
  ep_Q2_008_partial_03_0251,
  ep_Q2_008_partial_03_0252,
  ep_Q2_008_partial_03_0253,
  ep_Q2_008_partial_03_0254,
  ep_Q2_008_partial_03_0255,
  ep_Q2_008_partial_03_0256,
  ep_Q2_008_partial_03_0257,
  ep_Q2_008_partial_03_0258,
  ep_Q2_008_partial_03_0259,
  ep_Q2_008_partial_03_0260,
  ep_Q2_008_partial_03_0261,
  ep_Q2_008_partial_03_0262,
  ep_Q2_008_partial_03_0263,
  ep_Q2_008_partial_03_0264,
  ep_Q2_008_partial_03_0265,
  ep_Q2_008_partial_03_0266,
  ep_Q2_008_partial_03_0267,
  ep_Q2_008_partial_03_0268,
  ep_Q2_008_partial_03_0269,
  ep_Q2_008_partial_03_0270,
  ep_Q2_008_partial_03_0271,
  ep_Q2_008_partial_03_0272,
  ep_Q2_008_partial_03_0273,
  ep_Q2_008_partial_03_0274,
  ep_Q2_008_partial_03_0275,
  ep_Q2_008_partial_03_0276,
  ep_Q2_008_partial_03_0277,
  ep_Q2_008_partial_03_0278,
  ep_Q2_008_partial_03_0279,
  ep_Q2_008_partial_03_0280,
  ep_Q2_008_partial_03_0281,
  ep_Q2_008_partial_03_0282,
  ep_Q2_008_partial_03_0283,
  ep_Q2_008_partial_03_0284,
  ep_Q2_008_partial_03_0285,
  ep_Q2_008_partial_03_0286,
  ep_Q2_008_partial_03_0287,
  ep_Q2_008_partial_03_0288,
  ep_Q2_008_partial_03_0289,
  ep_Q2_008_partial_03_0290,
  ep_Q2_008_partial_03_0291,
  ep_Q2_008_partial_03_0292,
  ep_Q2_008_partial_03_0293,
  ep_Q2_008_partial_03_0294,
  ep_Q2_008_partial_03_0295,
  ep_Q2_008_partial_03_0296,
  ep_Q2_008_partial_03_0297,
  ep_Q2_008_partial_03_0298,
  ep_Q2_008_partial_03_0299
]

/-- Sum of partial products in this block. -/
def ep_Q2_008_block_03_0200_0299 : Poly :=
[
  term ((771775544509452000 : Rat) / 692956453614176359) [(2, 2), (3, 1), (7, 1), (10, 1), (16, 1)],
  term ((-1804205182183737225 : Rat) / 692956453614176359) [(2, 2), (3, 1), (7, 1), (12, 1), (16, 1)],
  term ((-747272578126315865741698387925880000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (3, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1459755941057526492 : Rat) / 692956453614176359) [(2, 2), (3, 1), (7, 1), (13, 2), (16, 1)],
  term ((-29493883540250111402450771946087168000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (3, 1), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((1804205182183737225 : Rat) / 692956453614176359) [(2, 2), (3, 1), (7, 1), (16, 1)],
  term ((-431634828019142000961252993402057600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (3, 1), (7, 2), (12, 1), (15, 1), (16, 1)],
  term ((-812294800564430025004231306094284800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (3, 1), (7, 2), (13, 2), (15, 1), (16, 1)],
  term ((431634828019142000961252993402057600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (3, 1), (7, 2), (15, 1), (16, 1)],
  term ((-39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (3, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((70324786932212700 : Rat) / 692956453614176359) [(2, 2), (3, 1), (9, 1), (16, 1)],
  term ((-8103643217349246000 : Rat) / 692956453614176359) [(2, 2), (3, 1), (10, 1), (13, 1), (16, 1)],
  term ((234997830172389375 : Rat) / 5543651628913410872) [(2, 2), (3, 1), (11, 1), (12, 1), (16, 1)],
  term ((-2343133172956448821031328838872771360000 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-19058214854956896000 : Rat) / 692956453614176359) [(2, 2), (3, 1), (11, 1), (13, 2), (16, 1)],
  term ((-1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (3, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((1321648816232449125 : Rat) / 5543651628913410872) [(2, 2), (3, 1), (11, 1), (16, 1)],
  term ((-34468386518441157067941476614593519161025 : Rat) / 168707601851329515375740828258983054697998) [(2, 2), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((-84688486827835123872268804078357939200 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (3, 1), (13, 1), (15, 2), (16, 1)],
  term ((7140405822667457865 : Rat) / 692956453614176359) [(2, 2), (3, 1), (13, 1), (16, 1)],
  term ((-25124733538268943676526801496260805484800 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (3, 1), (13, 2), (15, 1), (16, 1)],
  term ((63589431987328048185833796848099511469725 : Rat) / 168707601851329515375740828258983054697998) [(2, 2), (3, 1), (15, 1), (16, 1)],
  term ((-32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (5, 1), (7, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (5, 1), (7, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (5, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-47456562781583396946100426842720000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (5, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((-129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (5, 1), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((43926043926967546635 : Rat) / 5543651628913410872) [(2, 2), (4, 1), (5, 1), (9, 1), (16, 1)],
  term ((-87013982558013166610924208563412000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((-5381986129252263987 : Rat) / 692956453614176359) [(2, 2), (4, 1), (5, 1), (11, 1), (12, 1), (16, 1)],
  term ((-10763972258504527974 : Rat) / 692956453614176359) [(2, 2), (4, 1), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (5, 1), (11, 1), (15, 2), (16, 1)],
  term ((5381986129252263987 : Rat) / 692956453614176359) [(2, 2), (4, 1), (5, 1), (11, 1), (16, 1)],
  term ((5381986129252263987 : Rat) / 692956453614176359) [(2, 2), (4, 1), (5, 1), (12, 1), (13, 1), (16, 1)],
  term ((-17402796511602633322184841712682400 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (5, 1), (13, 1), (15, 2), (16, 1)],
  term ((-13571547378614916015 : Rat) / 2771825814456705436) [(2, 2), (4, 1), (5, 1), (13, 1), (16, 1)],
  term ((-10763972258504527974 : Rat) / 692956453614176359) [(2, 2), (4, 1), (5, 1), (13, 2), (15, 1), (16, 1)],
  term ((-21527944517009055948 : Rat) / 692956453614176359) [(2, 2), (4, 1), (5, 1), (13, 3), (16, 1)],
  term ((104416779069615799933109050276094400 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((-1898262511263335877844017073708800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-52208389534807899966554525138047200 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((7264480957224552596016038175384619596600 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-30955433660627124993 : Rat) / 5543651628913410872) [(2, 2), (4, 1), (6, 1), (16, 1)],
  term ((1843367721265631962653173246630448000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (7, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((364938985264381623 : Rat) / 2771825814456705436) [(2, 2), (4, 1), (7, 1), (11, 1), (12, 1), (16, 1)],
  term ((44317218905204031992912270369313309551703 : Rat) / 168707601851329515375740828258983054697998) [(2, 2), (4, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (7, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-2326334950970681373 : Rat) / 2771825814456705436) [(2, 2), (4, 1), (7, 1), (11, 1), (16, 1)],
  term ((-364938985264381623 : Rat) / 2771825814456705436) [(2, 2), (4, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-1843367721265631962653173246630448000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-32907330511941930766525666351656000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((231003514099677687503378633290699200 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((3448052429063870577 : Rat) / 1385912907228352718) [(2, 2), (4, 1), (7, 1), (13, 1), (16, 1)],
  term ((44636451609985698450825176564615992156503 : Rat) / 168707601851329515375740828258983054697998) [(2, 2), (4, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (7, 1), (13, 3), (15, 2), (16, 1)],
  term ((364938985264381623 : Rat) / 692956453614176359) [(2, 2), (4, 1), (7, 1), (13, 3), (16, 1)],
  term ((7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (7, 1), (13, 4), (15, 1), (16, 1)],
  term ((78312584302211849949831787707070800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (7, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (7, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((-50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (7, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((115982493152720841046994376524832000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (7, 2), (13, 2), (15, 2), (16, 1)],
  term ((203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (4, 1), (7, 2), (13, 3), (15, 1), (16, 1)],
  term ((-65144989867565479901745233906429184000 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (8, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2669859283589517375 : Rat) / 1385912907228352718) [(2, 2), (4, 1), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((-195570254767485599874767550375887270400 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (8, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((14101733902665438481833198704299528700100 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((83370814993305000 : Rat) / 692956453614176359) [(2, 2), (4, 1), (8, 1), (11, 2), (16, 1)],
  term ((-14103247945961947910932228785528532068900 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((65144989867565479901745233906429184000 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (8, 1), (13, 2), (15, 2), (16, 1)],
  term ((2503117653602907375 : Rat) / 1385912907228352718) [(2, 2), (4, 1), (8, 1), (13, 2), (16, 1)],
  term ((195570254767485599874767550375887270400 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (8, 1), (13, 3), (15, 1), (16, 1)],
  term ((-83370814993305000 : Rat) / 692956453614176359) [(2, 2), (4, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((65144989867565479901745233906429184000 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (9, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((2503117653602907375 : Rat) / 1385912907228352718) [(2, 2), (4, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((195570254767485599874767550375887270400 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (9, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-14101733902665438481833198704299528700100 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((459797430806791875 : Rat) / 692956453614176359) [(2, 2), (4, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-161001756239771343352682147676603868800 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-9869659753932509733 : Rat) / 2771825814456705436) [(2, 2), (4, 1), (9, 1), (11, 1), (16, 1)],
  term ((-65144989867565479901745233906429184000 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2503117653602907375 : Rat) / 1385912907228352718) [(2, 2), (4, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-195570254767485599874767550375887270400 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (9, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((22499390684874753044466188879943146268000 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((78173987841078575882094280687715020800 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((2174935314585914775 : Rat) / 1385912907228352718) [(2, 2), (4, 1), (9, 1), (13, 1), (16, 1)],
  term ((286773240582077271737210877844888128000 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-16956800549486519299631363131085491003800 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((47640465710460000 : Rat) / 692956453614176359) [(2, 2), (4, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((362604775223538913274506125351976883646600 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((771775544509452000 : Rat) / 692956453614176359) [(2, 2), (4, 1), (10, 1), (13, 2), (16, 1)],
  term ((9536176493959289733 : Rat) / 5543651628913410872) [(2, 2), (4, 1), (10, 1), (16, 1)],
  term ((-228007464536479179656108318672502144000 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((38816249744893500 : Rat) / 692956453614176359) [(2, 2), (4, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-1034314563162723134529794054978695564800 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (4, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-771775544509452000 : Rat) / 692956453614176359) [(3, 1), (7, 1), (8, 2), (10, 1), (16, 1)],
  term ((1804205182183737225 : Rat) / 692956453614176359) [(3, 1), (7, 1), (8, 2), (12, 1), (16, 1)],
  term ((747272578126315865741698387925880000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((1459755941057526492 : Rat) / 692956453614176359) [(3, 1), (7, 1), (8, 2), (13, 2), (16, 1)],
  term ((29493883540250111402450771946087168000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (8, 2), (13, 3), (15, 1), (16, 1)],
  term ((-1804205182183737225 : Rat) / 692956453614176359) [(3, 1), (7, 1), (8, 2), (16, 1)],
  term ((-771775544509452000 : Rat) / 692956453614176359) [(3, 1), (7, 1), (9, 2), (10, 1), (16, 1)],
  term ((1804205182183737225 : Rat) / 692956453614176359) [(3, 1), (7, 1), (9, 2), (12, 1), (16, 1)],
  term ((747272578126315865741698387925880000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((1459755941057526492 : Rat) / 692956453614176359) [(3, 1), (7, 1), (9, 2), (13, 2), (16, 1)],
  term ((29493883540250111402450771946087168000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (9, 2), (13, 3), (15, 1), (16, 1)],
  term ((-1804205182183737225 : Rat) / 692956453614176359) [(3, 1), (7, 1), (9, 2), (16, 1)],
  term ((431634828019142000961252993402057600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (8, 2), (12, 1), (15, 1), (16, 1)],
  term ((812294800564430025004231306094284800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (8, 2), (13, 2), (15, 1), (16, 1)],
  term ((-431634828019142000961252993402057600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (8, 2), (15, 1), (16, 1)],
  term ((431634828019142000961252993402057600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((812294800564430025004231306094284800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (9, 2), (13, 2), (15, 1), (16, 1)],
  term ((-431634828019142000961252993402057600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (9, 2), (15, 1), (16, 1)],
  term ((39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (8, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-70324786932212700 : Rat) / 692956453614176359) [(3, 1), (8, 2), (9, 1), (16, 1)],
  term ((8103643217349246000 : Rat) / 692956453614176359) [(3, 1), (8, 2), (10, 1), (13, 1), (16, 1)],
  term ((-234997830172389375 : Rat) / 5543651628913410872) [(3, 1), (8, 2), (11, 1), (12, 1), (16, 1)],
  term ((2343133172956448821031328838872771360000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (8, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((19058214854956896000 : Rat) / 692956453614176359) [(3, 1), (8, 2), (11, 1), (13, 2), (16, 1)],
  term ((1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (8, 2), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((-1321648816232449125 : Rat) / 5543651628913410872) [(3, 1), (8, 2), (11, 1), (16, 1)],
  term ((34468386518441157067941476614593519161025 : Rat) / 168707601851329515375740828258983054697998) [(3, 1), (8, 2), (12, 1), (15, 1), (16, 1)],
  term ((84688486827835123872268804078357939200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (8, 2), (13, 1), (15, 2), (16, 1)],
  term ((-7140405822667457865 : Rat) / 692956453614176359) [(3, 1), (8, 2), (13, 1), (16, 1)],
  term ((25124733538268943676526801496260805484800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (8, 2), (13, 2), (15, 1), (16, 1)],
  term ((-63589431987328048185833796848099511469725 : Rat) / 168707601851329515375740828258983054697998) [(3, 1), (8, 2), (15, 1), (16, 1)],
  term ((8103643217349246000 : Rat) / 692956453614176359) [(3, 1), (9, 2), (10, 1), (13, 1), (16, 1)],
  term ((-234997830172389375 : Rat) / 5543651628913410872) [(3, 1), (9, 2), (11, 1), (12, 1), (16, 1)],
  term ((2343133172956448821031328838872771360000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((19058214854956896000 : Rat) / 692956453614176359) [(3, 1), (9, 2), (11, 1), (13, 2), (16, 1)],
  term ((1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (9, 2), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((-1321648816232449125 : Rat) / 5543651628913410872) [(3, 1), (9, 2), (11, 1), (16, 1)],
  term ((34468386518441157067941476614593519161025 : Rat) / 168707601851329515375740828258983054697998) [(3, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((84688486827835123872268804078357939200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((-7140405822667457865 : Rat) / 692956453614176359) [(3, 1), (9, 2), (13, 1), (16, 1)],
  term ((25124733538268943676526801496260805484800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (9, 2), (13, 2), (15, 1), (16, 1)],
  term ((-63589431987328048185833796848099511469725 : Rat) / 168707601851329515375740828258983054697998) [(3, 1), (9, 2), (15, 1), (16, 1)],
  term ((39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (9, 3), (13, 1), (15, 1), (16, 1)],
  term ((-70324786932212700 : Rat) / 692956453614176359) [(3, 1), (9, 3), (16, 1)],
  term ((-32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (5, 1), (7, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (5, 1), (7, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (5, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-47456562781583396946100426842720000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (5, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((-129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (5, 1), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((43926043926967546635 : Rat) / 5543651628913410872) [(3, 2), (4, 1), (5, 1), (9, 1), (16, 1)],
  term ((-87013982558013166610924208563412000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((-5381986129252263987 : Rat) / 692956453614176359) [(3, 2), (4, 1), (5, 1), (11, 1), (12, 1), (16, 1)],
  term ((-10763972258504527974 : Rat) / 692956453614176359) [(3, 2), (4, 1), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (5, 1), (11, 1), (15, 2), (16, 1)],
  term ((5381986129252263987 : Rat) / 692956453614176359) [(3, 2), (4, 1), (5, 1), (11, 1), (16, 1)],
  term ((5381986129252263987 : Rat) / 692956453614176359) [(3, 2), (4, 1), (5, 1), (12, 1), (13, 1), (16, 1)],
  term ((-17402796511602633322184841712682400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (5, 1), (13, 1), (15, 2), (16, 1)],
  term ((-13571547378614916015 : Rat) / 2771825814456705436) [(3, 2), (4, 1), (5, 1), (13, 1), (16, 1)],
  term ((-10763972258504527974 : Rat) / 692956453614176359) [(3, 2), (4, 1), (5, 1), (13, 2), (15, 1), (16, 1)],
  term ((-21527944517009055948 : Rat) / 692956453614176359) [(3, 2), (4, 1), (5, 1), (13, 3), (16, 1)],
  term ((104416779069615799933109050276094400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((-1898262511263335877844017073708800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-52208389534807899966554525138047200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((7264480957224552596016038175384619596600 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-30955433660627124993 : Rat) / 5543651628913410872) [(3, 2), (4, 1), (6, 1), (16, 1)],
  term ((1843367721265631962653173246630448000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (7, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((364938985264381623 : Rat) / 2771825814456705436) [(3, 2), (4, 1), (7, 1), (11, 1), (12, 1), (16, 1)],
  term ((44317218905204031992912270369313309551703 : Rat) / 168707601851329515375740828258983054697998) [(3, 2), (4, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (7, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-2326334950970681373 : Rat) / 2771825814456705436) [(3, 2), (4, 1), (7, 1), (11, 1), (16, 1)],
  term ((-364938985264381623 : Rat) / 2771825814456705436) [(3, 2), (4, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-1843367721265631962653173246630448000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-32907330511941930766525666351656000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((231003514099677687503378633290699200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((3448052429063870577 : Rat) / 1385912907228352718) [(3, 2), (4, 1), (7, 1), (13, 1), (16, 1)],
  term ((44636451609985698450825176564615992156503 : Rat) / 168707601851329515375740828258983054697998) [(3, 2), (4, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (7, 1), (13, 3), (15, 2), (16, 1)],
  term ((364938985264381623 : Rat) / 692956453614176359) [(3, 2), (4, 1), (7, 1), (13, 3), (16, 1)],
  term ((7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (7, 1), (13, 4), (15, 1), (16, 1)],
  term ((78312584302211849949831787707070800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (7, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (7, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((-50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (7, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((115982493152720841046994376524832000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (7, 2), (13, 2), (15, 2), (16, 1)],
  term ((203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (7, 2), (13, 3), (15, 1), (16, 1)],
  term ((-65144989867565479901745233906429184000 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (8, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2669859283589517375 : Rat) / 1385912907228352718) [(3, 2), (4, 1), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((-195570254767485599874767550375887270400 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (8, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((14101733902665438481833198704299528700100 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((83370814993305000 : Rat) / 692956453614176359) [(3, 2), (4, 1), (8, 1), (11, 2), (16, 1)],
  term ((-14103247945961947910932228785528532068900 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((65144989867565479901745233906429184000 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (8, 1), (13, 2), (15, 2), (16, 1)],
  term ((2503117653602907375 : Rat) / 1385912907228352718) [(3, 2), (4, 1), (8, 1), (13, 2), (16, 1)],
  term ((195570254767485599874767550375887270400 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (8, 1), (13, 3), (15, 1), (16, 1)],
  term ((-83370814993305000 : Rat) / 692956453614176359) [(3, 2), (4, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((65144989867565479901745233906429184000 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (9, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((2503117653602907375 : Rat) / 1385912907228352718) [(3, 2), (4, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((195570254767485599874767550375887270400 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (9, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-14101733902665438481833198704299528700100 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((459797430806791875 : Rat) / 692956453614176359) [(3, 2), (4, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-161001756239771343352682147676603868800 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-9869659753932509733 : Rat) / 2771825814456705436) [(3, 2), (4, 1), (9, 1), (11, 1), (16, 1)],
  term ((-65144989867565479901745233906429184000 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2503117653602907375 : Rat) / 1385912907228352718) [(3, 2), (4, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-195570254767485599874767550375887270400 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (9, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((22499390684874753044466188879943146268000 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((78173987841078575882094280687715020800 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((2174935314585914775 : Rat) / 1385912907228352718) [(3, 2), (4, 1), (9, 1), (13, 1), (16, 1)],
  term ((286773240582077271737210877844888128000 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-16956800549486519299631363131085491003800 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((47640465710460000 : Rat) / 692956453614176359) [(3, 2), (4, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((362604775223538913274506125351976883646600 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((771775544509452000 : Rat) / 692956453614176359) [(3, 2), (4, 1), (10, 1), (13, 2), (16, 1)],
  term ((9536176493959289733 : Rat) / 5543651628913410872) [(3, 2), (4, 1), (10, 1), (16, 1)],
  term ((-228007464536479179656108318672502144000 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((38816249744893500 : Rat) / 692956453614176359) [(3, 2), (4, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-1034314563162723134529794054978695564800 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (4, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((771775544509452000 : Rat) / 692956453614176359) [(3, 3), (7, 1), (10, 1), (16, 1)],
  term ((-1804205182183737225 : Rat) / 692956453614176359) [(3, 3), (7, 1), (12, 1), (16, 1)],
  term ((-747272578126315865741698387925880000 : Rat) / 2908751756057405437512772901016949218931) [(3, 3), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1459755941057526492 : Rat) / 692956453614176359) [(3, 3), (7, 1), (13, 2), (16, 1)],
  term ((-29493883540250111402450771946087168000 : Rat) / 2908751756057405437512772901016949218931) [(3, 3), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((1804205182183737225 : Rat) / 692956453614176359) [(3, 3), (7, 1), (16, 1)],
  term ((-431634828019142000961252993402057600 : Rat) / 2908751756057405437512772901016949218931) [(3, 3), (7, 2), (12, 1), (15, 1), (16, 1)],
  term ((-812294800564430025004231306094284800 : Rat) / 2908751756057405437512772901016949218931) [(3, 3), (7, 2), (13, 2), (15, 1), (16, 1)],
  term ((431634828019142000961252993402057600 : Rat) / 2908751756057405437512772901016949218931) [(3, 3), (7, 2), (15, 1), (16, 1)],
  term ((-39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(3, 3), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((70324786932212700 : Rat) / 692956453614176359) [(3, 3), (9, 1), (16, 1)],
  term ((-8103643217349246000 : Rat) / 692956453614176359) [(3, 3), (10, 1), (13, 1), (16, 1)],
  term ((234997830172389375 : Rat) / 5543651628913410872) [(3, 3), (11, 1), (12, 1), (16, 1)],
  term ((-2343133172956448821031328838872771360000 : Rat) / 84353800925664757687870414129491527348999) [(3, 3), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-19058214854956896000 : Rat) / 692956453614176359) [(3, 3), (11, 1), (13, 2), (16, 1)],
  term ((-1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(3, 3), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((1321648816232449125 : Rat) / 5543651628913410872) [(3, 3), (11, 1), (16, 1)],
  term ((-34468386518441157067941476614593519161025 : Rat) / 168707601851329515375740828258983054697998) [(3, 3), (12, 1), (15, 1), (16, 1)],
  term ((-84688486827835123872268804078357939200 : Rat) / 84353800925664757687870414129491527348999) [(3, 3), (13, 1), (15, 2), (16, 1)],
  term ((7140405822667457865 : Rat) / 692956453614176359) [(3, 3), (13, 1), (16, 1)],
  term ((-25124733538268943676526801496260805484800 : Rat) / 84353800925664757687870414129491527348999) [(3, 3), (13, 2), (15, 1), (16, 1)],
  term ((63589431987328048185833796848099511469725 : Rat) / 168707601851329515375740828258983054697998) [(3, 3), (15, 1), (16, 1)],
  term ((32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (8, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (8, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (8, 2), (11, 1), (15, 1), (16, 1)],
  term ((-32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (8, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((47456562781583396946100426842720000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (8, 2), (13, 2), (15, 2), (16, 1)],
  term ((129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (8, 2), (13, 3), (15, 1), (16, 1)],
  term ((32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (9, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (9, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((47456562781583396946100426842720000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (9, 2), (13, 2), (15, 2), (16, 1)],
  term ((129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (9, 2), (13, 3), (15, 1), (16, 1)],
  term ((-43926043926967546635 : Rat) / 5543651628913410872) [(4, 1), (5, 1), (8, 2), (9, 1), (16, 1)],
  term ((87013982558013166610924208563412000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (8, 2), (10, 1), (15, 1), (16, 1)],
  term ((5381986129252263987 : Rat) / 692956453614176359) [(4, 1), (5, 1), (8, 2), (11, 1), (12, 1), (16, 1)],
  term ((10763972258504527974 : Rat) / 692956453614176359) [(4, 1), (5, 1), (8, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (8, 2), (11, 1), (15, 2), (16, 1)],
  term ((-5381986129252263987 : Rat) / 692956453614176359) [(4, 1), (5, 1), (8, 2), (11, 1), (16, 1)],
  term ((-5381986129252263987 : Rat) / 692956453614176359) [(4, 1), (5, 1), (8, 2), (12, 1), (13, 1), (16, 1)],
  term ((17402796511602633322184841712682400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (8, 2), (12, 1), (15, 1), (16, 1)],
  term ((-34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (8, 2), (13, 1), (15, 2), (16, 1)],
  term ((13571547378614916015 : Rat) / 2771825814456705436) [(4, 1), (5, 1), (8, 2), (13, 1), (16, 1)],
  term ((10763972258504527974 : Rat) / 692956453614176359) [(4, 1), (5, 1), (8, 2), (13, 2), (15, 1), (16, 1)],
  term ((21527944517009055948 : Rat) / 692956453614176359) [(4, 1), (5, 1), (8, 2), (13, 3), (16, 1)],
  term ((-104416779069615799933109050276094400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (8, 2), (15, 1), (16, 1)],
  term ((87013982558013166610924208563412000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((5381986129252263987 : Rat) / 692956453614176359) [(4, 1), (5, 1), (9, 2), (11, 1), (12, 1), (16, 1)],
  term ((10763972258504527974 : Rat) / 692956453614176359) [(4, 1), (5, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((-5381986129252263987 : Rat) / 692956453614176359) [(4, 1), (5, 1), (9, 2), (11, 1), (16, 1)],
  term ((-5381986129252263987 : Rat) / 692956453614176359) [(4, 1), (5, 1), (9, 2), (12, 1), (13, 1), (16, 1)],
  term ((17402796511602633322184841712682400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((-34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((13571547378614916015 : Rat) / 2771825814456705436) [(4, 1), (5, 1), (9, 2), (13, 1), (16, 1)],
  term ((10763972258504527974 : Rat) / 692956453614176359) [(4, 1), (5, 1), (9, 2), (13, 2), (15, 1), (16, 1)],
  term ((21527944517009055948 : Rat) / 692956453614176359) [(4, 1), (5, 1), (9, 2), (13, 3), (16, 1)],
  term ((-104416779069615799933109050276094400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((-43926043926967546635 : Rat) / 5543651628913410872) [(4, 1), (5, 1), (9, 3), (16, 1)],
  term ((1898262511263335877844017073708800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 1), (8, 2), (15, 1), (16, 1)],
  term ((1898262511263335877844017073708800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((52208389534807899966554525138047200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (8, 2), (9, 1), (15, 1), (16, 1)],
  term ((-7264480957224552596016038175384619596600 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (6, 1), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((30955433660627124993 : Rat) / 5543651628913410872) [(4, 1), (6, 1), (8, 2), (16, 1)],
  term ((-7264480957224552596016038175384619596600 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (6, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((30955433660627124993 : Rat) / 5543651628913410872) [(4, 1), (6, 1), (9, 2), (16, 1)],
  term ((52208389534807899966554525138047200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (9, 3), (15, 1), (16, 1)],
  term ((-1843367721265631962653173246630448000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (8, 2), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-364938985264381623 : Rat) / 2771825814456705436) [(4, 1), (7, 1), (8, 2), (11, 1), (12, 1), (16, 1)],
  term ((-44317218905204031992912270369313309551703 : Rat) / 168707601851329515375740828258983054697998) [(4, 1), (7, 1), (8, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (8, 2), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((2326334950970681373 : Rat) / 2771825814456705436) [(4, 1), (7, 1), (8, 2), (11, 1), (16, 1)],
  term ((364938985264381623 : Rat) / 2771825814456705436) [(4, 1), (7, 1), (8, 2), (12, 1), (13, 1), (16, 1)],
  term ((1843367721265631962653173246630448000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (8, 2), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((32907330511941930766525666351656000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (8, 2), (12, 1), (15, 1), (16, 1)],
  term ((-231003514099677687503378633290699200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (8, 2), (13, 1), (15, 2), (16, 1)],
  term ((-3448052429063870577 : Rat) / 1385912907228352718) [(4, 1), (7, 1), (8, 2), (13, 1), (16, 1)],
  term ((-44636451609985698450825176564615992156503 : Rat) / 168707601851329515375740828258983054697998) [(4, 1), (7, 1), (8, 2), (13, 2), (15, 1), (16, 1)],
  term ((-3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (8, 2), (13, 3), (15, 2), (16, 1)],
  term ((-364938985264381623 : Rat) / 692956453614176359) [(4, 1), (7, 1), (8, 2), (13, 3), (16, 1)],
  term ((-7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (8, 2), (13, 4), (15, 1), (16, 1)],
  term ((-78312584302211849949831787707070800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (8, 2), (15, 1), (16, 1)],
  term ((-1843367721265631962653173246630448000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (9, 2), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-364938985264381623 : Rat) / 2771825814456705436) [(4, 1), (7, 1), (9, 2), (11, 1), (12, 1), (16, 1)],
  term ((-44317218905204031992912270369313309551703 : Rat) / 168707601851329515375740828258983054697998) [(4, 1), (7, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (9, 2), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((2326334950970681373 : Rat) / 2771825814456705436) [(4, 1), (7, 1), (9, 2), (11, 1), (16, 1)],
  term ((364938985264381623 : Rat) / 2771825814456705436) [(4, 1), (7, 1), (9, 2), (12, 1), (13, 1), (16, 1)],
  term ((1843367721265631962653173246630448000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (9, 2), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((32907330511941930766525666351656000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((-231003514099677687503378633290699200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((-3448052429063870577 : Rat) / 1385912907228352718) [(4, 1), (7, 1), (9, 2), (13, 1), (16, 1)],
  term ((-44636451609985698450825176564615992156503 : Rat) / 168707601851329515375740828258983054697998) [(4, 1), (7, 1), (9, 2), (13, 2), (15, 1), (16, 1)],
  term ((-3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (9, 2), (13, 3), (15, 2), (16, 1)],
  term ((-364938985264381623 : Rat) / 692956453614176359) [(4, 1), (7, 1), (9, 2), (13, 3), (16, 1)],
  term ((-7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (9, 2), (13, 4), (15, 1), (16, 1)],
  term ((-78312584302211849949831787707070800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((-50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (8, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (8, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (8, 2), (11, 1), (15, 1), (16, 1)],
  term ((50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (8, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-115982493152720841046994376524832000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((-101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (8, 2), (13, 2), (15, 2), (16, 1)],
  term ((-203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (8, 2), (13, 3), (15, 1), (16, 1)],
  term ((-50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (9, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (9, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-115982493152720841046994376524832000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (9, 2), (13, 2), (15, 2), (16, 1)],
  term ((-203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (9, 2), (13, 3), (15, 1), (16, 1)],
  term ((65144989867565479901745233906429184000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 1), (9, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((2669859283589517375 : Rat) / 1385912907228352718) [(4, 1), (8, 1), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((195570254767485599874767550375887270400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 1), (9, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-14101733902665438481833198704299528700100 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-83370814993305000 : Rat) / 692956453614176359) [(4, 1), (8, 1), (9, 2), (11, 2), (16, 1)],
  term ((14103247945961947910932228785528532068900 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-65144989867565479901745233906429184000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 1), (9, 2), (13, 2), (15, 2), (16, 1)],
  term ((-2503117653602907375 : Rat) / 1385912907228352718) [(4, 1), (8, 1), (9, 2), (13, 2), (16, 1)],
  term ((-195570254767485599874767550375887270400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 1), (9, 2), (13, 3), (15, 1), (16, 1)],
  term ((83370814993305000 : Rat) / 692956453614176359) [(4, 1), (8, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-65144989867565479901745233906429184000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 2), (9, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2503117653602907375 : Rat) / 1385912907228352718) [(4, 1), (8, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-195570254767485599874767550375887270400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 2), (9, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((14101733902665438481833198704299528700100 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-459797430806791875 : Rat) / 692956453614176359) [(4, 1), (8, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((161001756239771343352682147676603868800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((9869659753932509733 : Rat) / 2771825814456705436) [(4, 1), (8, 2), (9, 1), (11, 1), (16, 1)],
  term ((65144989867565479901745233906429184000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 2), (9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((2503117653602907375 : Rat) / 1385912907228352718) [(4, 1), (8, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((195570254767485599874767550375887270400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 2), (9, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-22499390684874753044466188879943146268000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-78173987841078575882094280687715020800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2174935314585914775 : Rat) / 1385912907228352718) [(4, 1), (8, 2), (9, 1), (13, 1), (16, 1)],
  term ((-286773240582077271737210877844888128000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 2), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((16956800549486519299631363131085491003800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 2), (9, 1), (15, 1), (16, 1)],
  term ((-47640465710460000 : Rat) / 692956453614176359) [(4, 1), (8, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-362604775223538913274506125351976883646600 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-771775544509452000 : Rat) / 692956453614176359) [(4, 1), (8, 2), (10, 1), (13, 2), (16, 1)],
  term ((-9536176493959289733 : Rat) / 5543651628913410872) [(4, 1), (8, 2), (10, 1), (16, 1)],
  term ((228007464536479179656108318672502144000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 2), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-38816249744893500 : Rat) / 692956453614176359) [(4, 1), (8, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((1034314563162723134529794054978695564800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 2), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((65144989867565479901745233906429184000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 3), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((2669859283589517375 : Rat) / 1385912907228352718) [(4, 1), (8, 3), (11, 1), (13, 1), (16, 1)],
  term ((195570254767485599874767550375887270400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 3), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-14101733902665438481833198704299528700100 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 3), (11, 1), (15, 1), (16, 1)],
  term ((-83370814993305000 : Rat) / 692956453614176359) [(4, 1), (8, 3), (11, 2), (16, 1)],
  term ((14103247945961947910932228785528532068900 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 3), (13, 1), (15, 1), (16, 1)],
  term ((-65144989867565479901745233906429184000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 3), (13, 2), (15, 2), (16, 1)],
  term ((-2503117653602907375 : Rat) / 1385912907228352718) [(4, 1), (8, 3), (13, 2), (16, 1)],
  term ((-195570254767485599874767550375887270400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (8, 3), (13, 3), (15, 1), (16, 1)],
  term ((-47640465710460000 : Rat) / 692956453614176359) [(4, 1), (9, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-362604775223538913274506125351976883646600 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-771775544509452000 : Rat) / 692956453614176359) [(4, 1), (9, 2), (10, 1), (13, 2), (16, 1)],
  term ((-9536176493959289733 : Rat) / 5543651628913410872) [(4, 1), (9, 2), (10, 1), (16, 1)],
  term ((228007464536479179656108318672502144000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 2), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-38816249744893500 : Rat) / 692956453614176359) [(4, 1), (9, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((1034314563162723134529794054978695564800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 2), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((83370814993305000 : Rat) / 692956453614176359) [(4, 1), (9, 3), (10, 1), (11, 1), (16, 1)],
  term ((-65144989867565479901745233906429184000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 3), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2503117653602907375 : Rat) / 1385912907228352718) [(4, 1), (9, 3), (10, 1), (13, 1), (16, 1)],
  term ((-195570254767485599874767550375887270400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 3), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((14101733902665438481833198704299528700100 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 3), (10, 1), (15, 1), (16, 1)],
  term ((-459797430806791875 : Rat) / 692956453614176359) [(4, 1), (9, 3), (11, 1), (12, 1), (16, 1)],
  term ((161001756239771343352682147676603868800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 3), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((9869659753932509733 : Rat) / 2771825814456705436) [(4, 1), (9, 3), (11, 1), (16, 1)],
  term ((65144989867565479901745233906429184000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 3), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((2503117653602907375 : Rat) / 1385912907228352718) [(4, 1), (9, 3), (12, 1), (13, 1), (16, 1)],
  term ((195570254767485599874767550375887270400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 3), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-22499390684874753044466188879943146268000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 3), (12, 1), (15, 1), (16, 1)],
  term ((-78173987841078575882094280687715020800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 3), (13, 1), (15, 2), (16, 1)],
  term ((-2174935314585914775 : Rat) / 1385912907228352718) [(4, 1), (9, 3), (13, 1), (16, 1)],
  term ((-286773240582077271737210877844888128000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 3), (13, 2), (15, 1), (16, 1)],
  term ((16956800549486519299631363131085491003800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 3, terms 200 through 299. -/
theorem ep_Q2_008_block_03_0200_0299_valid :
    checkProductSumEq ep_Q2_008_partials_03_0200_0299
      ep_Q2_008_block_03_0200_0299 = true := by
  native_decide

end EpQ2008TermShards

end Patterns

end EndpointCertificate

end Problem97
