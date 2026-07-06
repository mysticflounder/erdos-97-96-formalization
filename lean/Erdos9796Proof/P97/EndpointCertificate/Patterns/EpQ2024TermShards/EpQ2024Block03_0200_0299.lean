/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_024, term block 3:200-299

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_024`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2024TermShards

/-- Generator polynomial 3 for endpoint certificate `ep_Q2_024`. -/
def ep_Q2_024_generator_03_0200_0299 : Poly :=
[
  term (1 : Rat) [(2, 2)],
  term (1 : Rat) [(3, 2)],
  term (-1 : Rat) [(8, 2)],
  term (-1 : Rat) [(9, 2)]
]

/-- Coefficient term 200 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0200 : Poly :=
[
  term ((6544627211193844374324207850933658385537878969261824301 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(2, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 200 for generator 3. -/
def ep_Q2_024_partial_03_0200 : Poly :=
[
  term ((6544627211193844374324207850933658385537878969261824301 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(2, 1), (3, 2), (11, 1), (12, 1), (15, 1)],
  term ((-6544627211193844374324207850933658385537878969261824301 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(2, 1), (8, 2), (11, 1), (12, 1), (15, 1)],
  term ((-6544627211193844374324207850933658385537878969261824301 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(2, 1), (9, 2), (11, 1), (12, 1), (15, 1)],
  term ((6544627211193844374324207850933658385537878969261824301 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(2, 3), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 200 for generator 3. -/
theorem ep_Q2_024_partial_03_0200_valid :
    mulPoly ep_Q2_024_coefficient_03_0200
        ep_Q2_024_generator_03_0200_0299 =
      ep_Q2_024_partial_03_0200 := by
  native_decide

/-- Coefficient term 201 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0201 : Poly :=
[
  term ((-448228140819559 : Rat) / 1162780221153193) [(2, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 201 for generator 3. -/
def ep_Q2_024_partial_03_0201 : Poly :=
[
  term ((-448228140819559 : Rat) / 1162780221153193) [(2, 1), (3, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((448228140819559 : Rat) / 1162780221153193) [(2, 1), (8, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((448228140819559 : Rat) / 1162780221153193) [(2, 1), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-448228140819559 : Rat) / 1162780221153193) [(2, 3), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 201 for generator 3. -/
theorem ep_Q2_024_partial_03_0201_valid :
    mulPoly ep_Q2_024_coefficient_03_0201
        ep_Q2_024_generator_03_0200_0299 =
      ep_Q2_024_partial_03_0201 := by
  native_decide

/-- Coefficient term 202 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0202 : Poly :=
[
  term ((188722442315693407427840899617497803072 : Rat) / 119970945740247729656669352802953926799) [(2, 1), (11, 1), (13, 1)]
]

/-- Partial product 202 for generator 3. -/
def ep_Q2_024_partial_03_0202 : Poly :=
[
  term ((188722442315693407427840899617497803072 : Rat) / 119970945740247729656669352802953926799) [(2, 1), (3, 2), (11, 1), (13, 1)],
  term ((-188722442315693407427840899617497803072 : Rat) / 119970945740247729656669352802953926799) [(2, 1), (8, 2), (11, 1), (13, 1)],
  term ((-188722442315693407427840899617497803072 : Rat) / 119970945740247729656669352802953926799) [(2, 1), (9, 2), (11, 1), (13, 1)],
  term ((188722442315693407427840899617497803072 : Rat) / 119970945740247729656669352802953926799) [(2, 3), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 202 for generator 3. -/
theorem ep_Q2_024_partial_03_0202_valid :
    mulPoly ep_Q2_024_coefficient_03_0202
        ep_Q2_024_generator_03_0200_0299 =
      ep_Q2_024_partial_03_0202 := by
  native_decide

/-- Coefficient term 203 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0203 : Poly :=
[
  term ((137190219846581823769882591558384019657388474051565837181 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(2, 1), (11, 1), (15, 1)]
]

/-- Partial product 203 for generator 3. -/
def ep_Q2_024_partial_03_0203 : Poly :=
[
  term ((137190219846581823769882591558384019657388474051565837181 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(2, 1), (3, 2), (11, 1), (15, 1)],
  term ((-137190219846581823769882591558384019657388474051565837181 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(2, 1), (8, 2), (11, 1), (15, 1)],
  term ((-137190219846581823769882591558384019657388474051565837181 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(2, 1), (9, 2), (11, 1), (15, 1)],
  term ((137190219846581823769882591558384019657388474051565837181 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(2, 3), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 203 for generator 3. -/
theorem ep_Q2_024_partial_03_0203_valid :
    mulPoly ep_Q2_024_coefficient_03_0203
        ep_Q2_024_generator_03_0200_0299 =
      ep_Q2_024_partial_03_0203 := by
  native_decide

/-- Coefficient term 204 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0204 : Poly :=
[
  term ((13092500098671601 : Rat) / 2325560442306386) [(2, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 204 for generator 3. -/
def ep_Q2_024_partial_03_0204 : Poly :=
[
  term ((13092500098671601 : Rat) / 2325560442306386) [(2, 1), (3, 2), (11, 1), (15, 1), (16, 1)],
  term ((-13092500098671601 : Rat) / 2325560442306386) [(2, 1), (8, 2), (11, 1), (15, 1), (16, 1)],
  term ((-13092500098671601 : Rat) / 2325560442306386) [(2, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((13092500098671601 : Rat) / 2325560442306386) [(2, 3), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 204 for generator 3. -/
theorem ep_Q2_024_partial_03_0204_valid :
    mulPoly ep_Q2_024_coefficient_03_0204
        ep_Q2_024_generator_03_0200_0299 =
      ep_Q2_024_partial_03_0204 := by
  native_decide

/-- Coefficient term 205 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0205 : Poly :=
[
  term ((-44975123602223741861033454546231653929 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (12, 1)]
]

/-- Partial product 205 for generator 3. -/
def ep_Q2_024_partial_03_0205 : Poly :=
[
  term ((-44975123602223741861033454546231653929 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (3, 2), (12, 1)],
  term ((44975123602223741861033454546231653929 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (8, 2), (12, 1)],
  term ((44975123602223741861033454546231653929 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (9, 2), (12, 1)],
  term ((-44975123602223741861033454546231653929 : Rat) / 199951576233746216094448921338256544665) [(2, 3), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 205 for generator 3. -/
theorem ep_Q2_024_partial_03_0205_valid :
    mulPoly ep_Q2_024_coefficient_03_0205
        ep_Q2_024_generator_03_0200_0299 =
      ep_Q2_024_partial_03_0205 := by
  native_decide

/-- Coefficient term 206 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0206 : Poly :=
[
  term ((9510999754260881254713232656424688445575676709809539897 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(2, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 206 for generator 3. -/
def ep_Q2_024_partial_03_0206 : Poly :=
[
  term ((9510999754260881254713232656424688445575676709809539897 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(2, 1), (3, 2), (12, 1), (13, 1), (15, 1)],
  term ((-9510999754260881254713232656424688445575676709809539897 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(2, 1), (8, 2), (12, 1), (13, 1), (15, 1)],
  term ((-9510999754260881254713232656424688445575676709809539897 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(2, 1), (9, 2), (12, 1), (13, 1), (15, 1)],
  term ((9510999754260881254713232656424688445575676709809539897 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(2, 3), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 206 for generator 3. -/
theorem ep_Q2_024_partial_03_0206_valid :
    mulPoly ep_Q2_024_coefficient_03_0206
        ep_Q2_024_generator_03_0200_0299 =
      ep_Q2_024_partial_03_0206 := by
  native_decide

/-- Coefficient term 207 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0207 : Poly :=
[
  term ((-651692520789483 : Rat) / 1162780221153193) [(2, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 207 for generator 3. -/
def ep_Q2_024_partial_03_0207 : Poly :=
[
  term ((-651692520789483 : Rat) / 1162780221153193) [(2, 1), (3, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((651692520789483 : Rat) / 1162780221153193) [(2, 1), (8, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((651692520789483 : Rat) / 1162780221153193) [(2, 1), (9, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-651692520789483 : Rat) / 1162780221153193) [(2, 3), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 207 for generator 3. -/
theorem ep_Q2_024_partial_03_0207_valid :
    mulPoly ep_Q2_024_coefficient_03_0207
        ep_Q2_024_generator_03_0200_0299 =
      ep_Q2_024_partial_03_0207 := by
  native_decide

/-- Coefficient term 208 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0208 : Poly :=
[
  term ((-24897008634067285794795130322114482756 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (12, 1), (13, 2)]
]

/-- Partial product 208 for generator 3. -/
def ep_Q2_024_partial_03_0208 : Poly :=
[
  term ((-24897008634067285794795130322114482756 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (3, 2), (12, 1), (13, 2)],
  term ((24897008634067285794795130322114482756 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (8, 2), (12, 1), (13, 2)],
  term ((24897008634067285794795130322114482756 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (9, 2), (12, 1), (13, 2)],
  term ((-24897008634067285794795130322114482756 : Rat) / 199951576233746216094448921338256544665) [(2, 3), (12, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 208 for generator 3. -/
theorem ep_Q2_024_partial_03_0208_valid :
    mulPoly ep_Q2_024_coefficient_03_0208
        ep_Q2_024_generator_03_0200_0299 =
      ep_Q2_024_partial_03_0208 := by
  native_decide

/-- Coefficient term 209 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0209 : Poly :=
[
  term ((-15030458751725280376487136793198712815572721057832694131 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(2, 1), (12, 1), (15, 2)]
]

/-- Partial product 209 for generator 3. -/
def ep_Q2_024_partial_03_0209 : Poly :=
[
  term ((-15030458751725280376487136793198712815572721057832694131 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(2, 1), (3, 2), (12, 1), (15, 2)],
  term ((15030458751725280376487136793198712815572721057832694131 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(2, 1), (8, 2), (12, 1), (15, 2)],
  term ((15030458751725280376487136793198712815572721057832694131 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(2, 1), (9, 2), (12, 1), (15, 2)],
  term ((-15030458751725280376487136793198712815572721057832694131 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(2, 3), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 209 for generator 3. -/
theorem ep_Q2_024_partial_03_0209_valid :
    mulPoly ep_Q2_024_coefficient_03_0209
        ep_Q2_024_generator_03_0200_0299 =
      ep_Q2_024_partial_03_0209 := by
  native_decide

/-- Coefficient term 210 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0210 : Poly :=
[
  term ((2556195793603410 : Rat) / 1162780221153193) [(2, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 210 for generator 3. -/
def ep_Q2_024_partial_03_0210 : Poly :=
[
  term ((2556195793603410 : Rat) / 1162780221153193) [(2, 1), (3, 2), (12, 1), (15, 2), (16, 1)],
  term ((-2556195793603410 : Rat) / 1162780221153193) [(2, 1), (8, 2), (12, 1), (15, 2), (16, 1)],
  term ((-2556195793603410 : Rat) / 1162780221153193) [(2, 1), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((2556195793603410 : Rat) / 1162780221153193) [(2, 3), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 210 for generator 3. -/
theorem ep_Q2_024_partial_03_0210_valid :
    mulPoly ep_Q2_024_coefficient_03_0210
        ep_Q2_024_generator_03_0200_0299 =
      ep_Q2_024_partial_03_0210 := by
  native_decide

/-- Coefficient term 211 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0211 : Poly :=
[
  term ((-21047616800457164513286695224263497261818406700425024105 : Rat) / 557999371279211891102864058501759538480407853948476828) [(2, 1), (13, 1), (15, 1)]
]

/-- Partial product 211 for generator 3. -/
def ep_Q2_024_partial_03_0211 : Poly :=
[
  term ((-21047616800457164513286695224263497261818406700425024105 : Rat) / 557999371279211891102864058501759538480407853948476828) [(2, 1), (3, 2), (13, 1), (15, 1)],
  term ((21047616800457164513286695224263497261818406700425024105 : Rat) / 557999371279211891102864058501759538480407853948476828) [(2, 1), (8, 2), (13, 1), (15, 1)],
  term ((21047616800457164513286695224263497261818406700425024105 : Rat) / 557999371279211891102864058501759538480407853948476828) [(2, 1), (9, 2), (13, 1), (15, 1)],
  term ((-21047616800457164513286695224263497261818406700425024105 : Rat) / 557999371279211891102864058501759538480407853948476828) [(2, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 211 for generator 3. -/
theorem ep_Q2_024_partial_03_0211_valid :
    mulPoly ep_Q2_024_coefficient_03_0211
        ep_Q2_024_generator_03_0200_0299 =
      ep_Q2_024_partial_03_0211 := by
  native_decide

/-- Coefficient term 212 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0212 : Poly :=
[
  term ((-2090188890747827 : Rat) / 3488340663459579) [(2, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 212 for generator 3. -/
def ep_Q2_024_partial_03_0212 : Poly :=
[
  term ((-2090188890747827 : Rat) / 3488340663459579) [(2, 1), (3, 2), (13, 1), (15, 1), (16, 1)],
  term ((2090188890747827 : Rat) / 3488340663459579) [(2, 1), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((2090188890747827 : Rat) / 3488340663459579) [(2, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-2090188890747827 : Rat) / 3488340663459579) [(2, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 212 for generator 3. -/
theorem ep_Q2_024_partial_03_0212_valid :
    mulPoly ep_Q2_024_coefficient_03_0212
        ep_Q2_024_generator_03_0200_0299 =
      ep_Q2_024_partial_03_0212 := by
  native_decide

/-- Coefficient term 213 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0213 : Poly :=
[
  term ((1165373230691828432735482041440586377306 : Rat) / 1799564186103715944850040292044308901985) [(2, 1), (13, 2)]
]

/-- Partial product 213 for generator 3. -/
def ep_Q2_024_partial_03_0213 : Poly :=
[
  term ((1165373230691828432735482041440586377306 : Rat) / 1799564186103715944850040292044308901985) [(2, 1), (3, 2), (13, 2)],
  term ((-1165373230691828432735482041440586377306 : Rat) / 1799564186103715944850040292044308901985) [(2, 1), (8, 2), (13, 2)],
  term ((-1165373230691828432735482041440586377306 : Rat) / 1799564186103715944850040292044308901985) [(2, 1), (9, 2), (13, 2)],
  term ((1165373230691828432735482041440586377306 : Rat) / 1799564186103715944850040292044308901985) [(2, 3), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 213 for generator 3. -/
theorem ep_Q2_024_partial_03_0213_valid :
    mulPoly ep_Q2_024_coefficient_03_0213
        ep_Q2_024_generator_03_0200_0299 =
      ep_Q2_024_partial_03_0213 := by
  native_decide

/-- Coefficient term 214 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0214 : Poly :=
[
  term ((-560642286760300522460041580524949194093 : Rat) / 1199709457402477296566693528029539267990) [(2, 1), (14, 1)]
]

/-- Partial product 214 for generator 3. -/
def ep_Q2_024_partial_03_0214 : Poly :=
[
  term ((-560642286760300522460041580524949194093 : Rat) / 1199709457402477296566693528029539267990) [(2, 1), (3, 2), (14, 1)],
  term ((560642286760300522460041580524949194093 : Rat) / 1199709457402477296566693528029539267990) [(2, 1), (8, 2), (14, 1)],
  term ((560642286760300522460041580524949194093 : Rat) / 1199709457402477296566693528029539267990) [(2, 1), (9, 2), (14, 1)],
  term ((-560642286760300522460041580524949194093 : Rat) / 1199709457402477296566693528029539267990) [(2, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 214 for generator 3. -/
theorem ep_Q2_024_partial_03_0214_valid :
    mulPoly ep_Q2_024_coefficient_03_0214
        ep_Q2_024_generator_03_0200_0299 =
      ep_Q2_024_partial_03_0214 := by
  native_decide

/-- Coefficient term 215 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0215 : Poly :=
[
  term ((208219600235417462847331844009923309593726162121183658633 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(2, 1), (15, 2)]
]

/-- Partial product 215 for generator 3. -/
def ep_Q2_024_partial_03_0215 : Poly :=
[
  term ((208219600235417462847331844009923309593726162121183658633 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(2, 1), (3, 2), (15, 2)],
  term ((-208219600235417462847331844009923309593726162121183658633 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(2, 1), (8, 2), (15, 2)],
  term ((-208219600235417462847331844009923309593726162121183658633 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(2, 1), (9, 2), (15, 2)],
  term ((208219600235417462847331844009923309593726162121183658633 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(2, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 215 for generator 3. -/
theorem ep_Q2_024_partial_03_0215_valid :
    mulPoly ep_Q2_024_coefficient_03_0215
        ep_Q2_024_generator_03_0200_0299 =
      ep_Q2_024_partial_03_0215 := by
  native_decide

/-- Coefficient term 216 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0216 : Poly :=
[
  term ((2672565420476413 : Rat) / 2325560442306386) [(2, 1), (15, 2), (16, 1)]
]

/-- Partial product 216 for generator 3. -/
def ep_Q2_024_partial_03_0216 : Poly :=
[
  term ((2672565420476413 : Rat) / 2325560442306386) [(2, 1), (3, 2), (15, 2), (16, 1)],
  term ((-2672565420476413 : Rat) / 2325560442306386) [(2, 1), (8, 2), (15, 2), (16, 1)],
  term ((-2672565420476413 : Rat) / 2325560442306386) [(2, 1), (9, 2), (15, 2), (16, 1)],
  term ((2672565420476413 : Rat) / 2325560442306386) [(2, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 216 for generator 3. -/
theorem ep_Q2_024_partial_03_0216_valid :
    mulPoly ep_Q2_024_coefficient_03_0216
        ep_Q2_024_generator_03_0200_0299 =
      ep_Q2_024_partial_03_0216 := by
  native_decide

/-- Coefficient term 217 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0217 : Poly :=
[
  term ((-1070272288403214792732786634564357540 : Rat) / 39990315246749243218889784267651308933) [(2, 2)]
]

/-- Partial product 217 for generator 3. -/
def ep_Q2_024_partial_03_0217 : Poly :=
[
  term ((-1070272288403214792732786634564357540 : Rat) / 39990315246749243218889784267651308933) [(2, 2), (3, 2)],
  term ((1070272288403214792732786634564357540 : Rat) / 39990315246749243218889784267651308933) [(2, 2), (8, 2)],
  term ((1070272288403214792732786634564357540 : Rat) / 39990315246749243218889784267651308933) [(2, 2), (9, 2)],
  term ((-1070272288403214792732786634564357540 : Rat) / 39990315246749243218889784267651308933) [(2, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 217 for generator 3. -/
theorem ep_Q2_024_partial_03_0217_valid :
    mulPoly ep_Q2_024_coefficient_03_0217
        ep_Q2_024_generator_03_0200_0299 =
      ep_Q2_024_partial_03_0217 := by
  native_decide

/-- Coefficient term 218 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0218 : Poly :=
[
  term ((182481956855019299207446157664365046748 : Rat) / 359912837220743188970008058408861780397) [(3, 1), (4, 1), (9, 1)]
]

/-- Partial product 218 for generator 3. -/
def ep_Q2_024_partial_03_0218 : Poly :=
[
  term ((182481956855019299207446157664365046748 : Rat) / 359912837220743188970008058408861780397) [(2, 2), (3, 1), (4, 1), (9, 1)],
  term ((-182481956855019299207446157664365046748 : Rat) / 359912837220743188970008058408861780397) [(3, 1), (4, 1), (8, 2), (9, 1)],
  term ((-182481956855019299207446157664365046748 : Rat) / 359912837220743188970008058408861780397) [(3, 1), (4, 1), (9, 3)],
  term ((182481956855019299207446157664365046748 : Rat) / 359912837220743188970008058408861780397) [(3, 3), (4, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 218 for generator 3. -/
theorem ep_Q2_024_partial_03_0218_valid :
    mulPoly ep_Q2_024_coefficient_03_0218
        ep_Q2_024_generator_03_0200_0299 =
      ep_Q2_024_partial_03_0218 := by
  native_decide

/-- Coefficient term 219 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0219 : Poly :=
[
  term ((17821249978825436563697260595591044088 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (4, 1), (13, 1)]
]

/-- Partial product 219 for generator 3. -/
def ep_Q2_024_partial_03_0219 : Poly :=
[
  term ((17821249978825436563697260595591044088 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (3, 1), (4, 1), (13, 1)],
  term ((-17821249978825436563697260595591044088 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (4, 1), (8, 2), (13, 1)],
  term ((-17821249978825436563697260595591044088 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (4, 1), (9, 2), (13, 1)],
  term ((17821249978825436563697260595591044088 : Rat) / 199951576233746216094448921338256544665) [(3, 3), (4, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 219 for generator 3. -/
theorem ep_Q2_024_partial_03_0219_valid :
    mulPoly ep_Q2_024_coefficient_03_0219
        ep_Q2_024_generator_03_0200_0299 =
      ep_Q2_024_partial_03_0219 := by
  native_decide

/-- Coefficient term 220 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0220 : Poly :=
[
  term ((424161063795057930629132723086609003137058634794396433 : Rat) / 278999685639605945551432029250879769240203926974238414) [(3, 1), (4, 1), (15, 1)]
]

/-- Partial product 220 for generator 3. -/
def ep_Q2_024_partial_03_0220 : Poly :=
[
  term ((424161063795057930629132723086609003137058634794396433 : Rat) / 278999685639605945551432029250879769240203926974238414) [(2, 2), (3, 1), (4, 1), (15, 1)],
  term ((-424161063795057930629132723086609003137058634794396433 : Rat) / 278999685639605945551432029250879769240203926974238414) [(3, 1), (4, 1), (8, 2), (15, 1)],
  term ((-424161063795057930629132723086609003137058634794396433 : Rat) / 278999685639605945551432029250879769240203926974238414) [(3, 1), (4, 1), (9, 2), (15, 1)],
  term ((424161063795057930629132723086609003137058634794396433 : Rat) / 278999685639605945551432029250879769240203926974238414) [(3, 3), (4, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 220 for generator 3. -/
theorem ep_Q2_024_partial_03_0220_valid :
    mulPoly ep_Q2_024_coefficient_03_0220
        ep_Q2_024_generator_03_0200_0299 =
      ep_Q2_024_partial_03_0220 := by
  native_decide

/-- Coefficient term 221 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0221 : Poly :=
[
  term ((-71768591212414 : Rat) / 1162780221153193) [(3, 1), (4, 1), (15, 1), (16, 1)]
]

/-- Partial product 221 for generator 3. -/
def ep_Q2_024_partial_03_0221 : Poly :=
[
  term ((-71768591212414 : Rat) / 1162780221153193) [(2, 2), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((71768591212414 : Rat) / 1162780221153193) [(3, 1), (4, 1), (8, 2), (15, 1), (16, 1)],
  term ((71768591212414 : Rat) / 1162780221153193) [(3, 1), (4, 1), (9, 2), (15, 1), (16, 1)],
  term ((-71768591212414 : Rat) / 1162780221153193) [(3, 3), (4, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 221 for generator 3. -/
theorem ep_Q2_024_partial_03_0221_valid :
    mulPoly ep_Q2_024_coefficient_03_0221
        ep_Q2_024_generator_03_0200_0299 =
      ep_Q2_024_partial_03_0221 := by
  native_decide

/-- Coefficient term 222 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0222 : Poly :=
[
  term ((-2500133093754034575671568746854548692126 : Rat) / 1799564186103715944850040292044308901985) [(3, 1), (5, 1)]
]

/-- Partial product 222 for generator 3. -/
def ep_Q2_024_partial_03_0222 : Poly :=
[
  term ((-2500133093754034575671568746854548692126 : Rat) / 1799564186103715944850040292044308901985) [(2, 2), (3, 1), (5, 1)],
  term ((2500133093754034575671568746854548692126 : Rat) / 1799564186103715944850040292044308901985) [(3, 1), (5, 1), (8, 2)],
  term ((2500133093754034575671568746854548692126 : Rat) / 1799564186103715944850040292044308901985) [(3, 1), (5, 1), (9, 2)],
  term ((-2500133093754034575671568746854548692126 : Rat) / 1799564186103715944850040292044308901985) [(3, 3), (5, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 222 for generator 3. -/
theorem ep_Q2_024_partial_03_0222_valid :
    mulPoly ep_Q2_024_coefficient_03_0222
        ep_Q2_024_generator_03_0200_0299 =
      ep_Q2_024_partial_03_0222 := by
  native_decide

/-- Coefficient term 223 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0223 : Poly :=
[
  term ((436235768289341236967421850993701608432 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (5, 1), (9, 1), (13, 1)]
]

/-- Partial product 223 for generator 3. -/
def ep_Q2_024_partial_03_0223 : Poly :=
[
  term ((436235768289341236967421850993701608432 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (3, 1), (5, 1), (9, 1), (13, 1)],
  term ((-436235768289341236967421850993701608432 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (5, 1), (8, 2), (9, 1), (13, 1)],
  term ((-436235768289341236967421850993701608432 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (5, 1), (9, 3), (13, 1)],
  term ((436235768289341236967421850993701608432 : Rat) / 599854728701238648283346764014769633995) [(3, 3), (5, 1), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 223 for generator 3. -/
theorem ep_Q2_024_partial_03_0223_valid :
    mulPoly ep_Q2_024_coefficient_03_0223
        ep_Q2_024_generator_03_0200_0299 =
      ep_Q2_024_partial_03_0223 := by
  native_decide

/-- Coefficient term 224 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0224 : Poly :=
[
  term ((-4020828775229646273920745062779027820219088571223109254 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (5, 1), (9, 1), (15, 1)]
]

/-- Partial product 224 for generator 3. -/
def ep_Q2_024_partial_03_0224 : Poly :=
[
  term ((-4020828775229646273920745062779027820219088571223109254 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 2), (3, 1), (5, 1), (9, 1), (15, 1)],
  term ((4020828775229646273920745062779027820219088571223109254 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (5, 1), (8, 2), (9, 1), (15, 1)],
  term ((4020828775229646273920745062779027820219088571223109254 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (5, 1), (9, 3), (15, 1)],
  term ((-4020828775229646273920745062779027820219088571223109254 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 3), (5, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 224 for generator 3. -/
theorem ep_Q2_024_partial_03_0224_valid :
    mulPoly ep_Q2_024_coefficient_03_0224
        ep_Q2_024_generator_03_0200_0299 =
      ep_Q2_024_partial_03_0224 := by
  native_decide

/-- Coefficient term 225 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0225 : Poly :=
[
  term ((5884563396179416 : Rat) / 3488340663459579) [(3, 1), (5, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 225 for generator 3. -/
def ep_Q2_024_partial_03_0225 : Poly :=
[
  term ((5884563396179416 : Rat) / 3488340663459579) [(2, 2), (3, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((-5884563396179416 : Rat) / 3488340663459579) [(3, 1), (5, 1), (8, 2), (9, 1), (15, 1), (16, 1)],
  term ((-5884563396179416 : Rat) / 3488340663459579) [(3, 1), (5, 1), (9, 3), (15, 1), (16, 1)],
  term ((5884563396179416 : Rat) / 3488340663459579) [(3, 3), (5, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 225 for generator 3. -/
theorem ep_Q2_024_partial_03_0225_valid :
    mulPoly ep_Q2_024_coefficient_03_0225
        ep_Q2_024_generator_03_0200_0299 =
      ep_Q2_024_partial_03_0225 := by
  native_decide

/-- Coefficient term 226 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0226 : Poly :=
[
  term ((370229701304371273616127062071914241912 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (5, 1), (9, 2)]
]

/-- Partial product 226 for generator 3. -/
def ep_Q2_024_partial_03_0226 : Poly :=
[
  term ((370229701304371273616127062071914241912 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (3, 1), (5, 1), (9, 2)],
  term ((-370229701304371273616127062071914241912 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (5, 1), (8, 2), (9, 2)],
  term ((-370229701304371273616127062071914241912 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (5, 1), (9, 4)],
  term ((370229701304371273616127062071914241912 : Rat) / 599854728701238648283346764014769633995) [(3, 3), (5, 1), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 226 for generator 3. -/
theorem ep_Q2_024_partial_03_0226_valid :
    mulPoly ep_Q2_024_coefficient_03_0226
        ep_Q2_024_generator_03_0200_0299 =
      ep_Q2_024_partial_03_0226 := by
  native_decide

/-- Coefficient term 227 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0227 : Poly :=
[
  term ((-11411605273029541008032460508186846605890014568048271908 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (5, 1), (13, 1), (15, 1)]
]

/-- Partial product 227 for generator 3. -/
def ep_Q2_024_partial_03_0227 : Poly :=
[
  term ((-11411605273029541008032460508186846605890014568048271908 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 2), (3, 1), (5, 1), (13, 1), (15, 1)],
  term ((11411605273029541008032460508186846605890014568048271908 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (5, 1), (8, 2), (13, 1), (15, 1)],
  term ((11411605273029541008032460508186846605890014568048271908 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (5, 1), (9, 2), (13, 1), (15, 1)],
  term ((-11411605273029541008032460508186846605890014568048271908 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 3), (5, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 227 for generator 3. -/
theorem ep_Q2_024_partial_03_0227_valid :
    mulPoly ep_Q2_024_coefficient_03_0227
        ep_Q2_024_generator_03_0200_0299 =
      ep_Q2_024_partial_03_0227 := by
  native_decide

/-- Coefficient term 228 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0228 : Poly :=
[
  term ((150661185588720 : Rat) / 1162780221153193) [(3, 1), (5, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 228 for generator 3. -/
def ep_Q2_024_partial_03_0228 : Poly :=
[
  term ((150661185588720 : Rat) / 1162780221153193) [(2, 2), (3, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-150661185588720 : Rat) / 1162780221153193) [(3, 1), (5, 1), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((-150661185588720 : Rat) / 1162780221153193) [(3, 1), (5, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((150661185588720 : Rat) / 1162780221153193) [(3, 3), (5, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 228 for generator 3. -/
theorem ep_Q2_024_partial_03_0228_valid :
    mulPoly ep_Q2_024_coefficient_03_0228
        ep_Q2_024_generator_03_0200_0299 =
      ep_Q2_024_partial_03_0228 := by
  native_decide

/-- Coefficient term 229 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0229 : Poly :=
[
  term ((80945856112067634232098240062478093344 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (5, 1), (13, 2)]
]

/-- Partial product 229 for generator 3. -/
def ep_Q2_024_partial_03_0229 : Poly :=
[
  term ((80945856112067634232098240062478093344 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (3, 1), (5, 1), (13, 2)],
  term ((-80945856112067634232098240062478093344 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (5, 1), (8, 2), (13, 2)],
  term ((-80945856112067634232098240062478093344 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (5, 1), (9, 2), (13, 2)],
  term ((80945856112067634232098240062478093344 : Rat) / 599854728701238648283346764014769633995) [(3, 3), (5, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 229 for generator 3. -/
theorem ep_Q2_024_partial_03_0229_valid :
    mulPoly ep_Q2_024_coefficient_03_0229
        ep_Q2_024_generator_03_0200_0299 =
      ep_Q2_024_partial_03_0229 := by
  native_decide

/-- Coefficient term 230 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0230 : Poly :=
[
  term ((17842303055724083763118711211856783152 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (14, 1)]
]

/-- Partial product 230 for generator 3. -/
def ep_Q2_024_partial_03_0230 : Poly :=
[
  term ((17842303055724083763118711211856783152 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (3, 1), (5, 1), (14, 1)],
  term ((-17842303055724083763118711211856783152 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (8, 2), (14, 1)],
  term ((-17842303055724083763118711211856783152 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (9, 2), (14, 1)],
  term ((17842303055724083763118711211856783152 : Rat) / 199951576233746216094448921338256544665) [(3, 3), (5, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 230 for generator 3. -/
theorem ep_Q2_024_partial_03_0230_valid :
    mulPoly ep_Q2_024_coefficient_03_0230
        ep_Q2_024_generator_03_0200_0299 =
      ep_Q2_024_partial_03_0230 := by
  native_decide

/-- Coefficient term 231 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0231 : Poly :=
[
  term ((8041427323100157780307091328156563931516252580159861034 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (5, 1), (15, 2)]
]

/-- Partial product 231 for generator 3. -/
def ep_Q2_024_partial_03_0231 : Poly :=
[
  term ((8041427323100157780307091328156563931516252580159861034 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 2), (3, 1), (5, 1), (15, 2)],
  term ((-8041427323100157780307091328156563931516252580159861034 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (5, 1), (8, 2), (15, 2)],
  term ((-8041427323100157780307091328156563931516252580159861034 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (5, 1), (9, 2), (15, 2)],
  term ((8041427323100157780307091328156563931516252580159861034 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 3), (5, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 231 for generator 3. -/
theorem ep_Q2_024_partial_03_0231_valid :
    mulPoly ep_Q2_024_coefficient_03_0231
        ep_Q2_024_generator_03_0200_0299 =
      ep_Q2_024_partial_03_0231 := by
  native_decide

/-- Coefficient term 232 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0232 : Poly :=
[
  term ((-1054067308495096 : Rat) / 1162780221153193) [(3, 1), (5, 1), (15, 2), (16, 1)]
]

/-- Partial product 232 for generator 3. -/
def ep_Q2_024_partial_03_0232 : Poly :=
[
  term ((-1054067308495096 : Rat) / 1162780221153193) [(2, 2), (3, 1), (5, 1), (15, 2), (16, 1)],
  term ((1054067308495096 : Rat) / 1162780221153193) [(3, 1), (5, 1), (8, 2), (15, 2), (16, 1)],
  term ((1054067308495096 : Rat) / 1162780221153193) [(3, 1), (5, 1), (9, 2), (15, 2), (16, 1)],
  term ((-1054067308495096 : Rat) / 1162780221153193) [(3, 3), (5, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 232 for generator 3. -/
theorem ep_Q2_024_partial_03_0232_valid :
    mulPoly ep_Q2_024_coefficient_03_0232
        ep_Q2_024_generator_03_0200_0299 =
      ep_Q2_024_partial_03_0232 := by
  native_decide

/-- Coefficient term 233 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0233 : Poly :=
[
  term ((-33781967257793617486815206073153137696 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 2), (9, 1)]
]

/-- Partial product 233 for generator 3. -/
def ep_Q2_024_partial_03_0233 : Poly :=
[
  term ((-33781967257793617486815206073153137696 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (3, 1), (5, 2), (9, 1)],
  term ((33781967257793617486815206073153137696 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 2), (8, 2), (9, 1)],
  term ((33781967257793617486815206073153137696 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 2), (9, 3)],
  term ((-33781967257793617486815206073153137696 : Rat) / 199951576233746216094448921338256544665) [(3, 3), (5, 2), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 233 for generator 3. -/
theorem ep_Q2_024_partial_03_0233_valid :
    mulPoly ep_Q2_024_coefficient_03_0233
        ep_Q2_024_generator_03_0200_0299 =
      ep_Q2_024_partial_03_0233 := by
  native_decide

/-- Coefficient term 234 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0234 : Poly :=
[
  term ((-40440149595023928932116585720924683072 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 2), (13, 1)]
]

/-- Partial product 234 for generator 3. -/
def ep_Q2_024_partial_03_0234 : Poly :=
[
  term ((-40440149595023928932116585720924683072 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (3, 1), (5, 2), (13, 1)],
  term ((40440149595023928932116585720924683072 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 2), (8, 2), (13, 1)],
  term ((40440149595023928932116585720924683072 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 2), (9, 2), (13, 1)],
  term ((-40440149595023928932116585720924683072 : Rat) / 199951576233746216094448921338256544665) [(3, 3), (5, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 234 for generator 3. -/
theorem ep_Q2_024_partial_03_0234_valid :
    mulPoly ep_Q2_024_coefficient_03_0234
        ep_Q2_024_generator_03_0200_0299 =
      ep_Q2_024_partial_03_0234 := by
  native_decide

/-- Coefficient term 235 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0235 : Poly :=
[
  term ((2173624517752731263429423385757322935670570690431915648 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (5, 2), (15, 1)]
]

/-- Partial product 235 for generator 3. -/
def ep_Q2_024_partial_03_0235 : Poly :=
[
  term ((2173624517752731263429423385757322935670570690431915648 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 2), (3, 1), (5, 2), (15, 1)],
  term ((-2173624517752731263429423385757322935670570690431915648 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (5, 2), (8, 2), (15, 1)],
  term ((-2173624517752731263429423385757322935670570690431915648 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (5, 2), (9, 2), (15, 1)],
  term ((2173624517752731263429423385757322935670570690431915648 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 3), (5, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 235 for generator 3. -/
theorem ep_Q2_024_partial_03_0235_valid :
    mulPoly ep_Q2_024_coefficient_03_0235
        ep_Q2_024_generator_03_0200_0299 =
      ep_Q2_024_partial_03_0235 := by
  native_decide

/-- Coefficient term 236 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0236 : Poly :=
[
  term ((206941537023232 : Rat) / 1162780221153193) [(3, 1), (5, 2), (15, 1), (16, 1)]
]

/-- Partial product 236 for generator 3. -/
def ep_Q2_024_partial_03_0236 : Poly :=
[
  term ((206941537023232 : Rat) / 1162780221153193) [(2, 2), (3, 1), (5, 2), (15, 1), (16, 1)],
  term ((-206941537023232 : Rat) / 1162780221153193) [(3, 1), (5, 2), (8, 2), (15, 1), (16, 1)],
  term ((-206941537023232 : Rat) / 1162780221153193) [(3, 1), (5, 2), (9, 2), (15, 1), (16, 1)],
  term ((206941537023232 : Rat) / 1162780221153193) [(3, 3), (5, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 236 for generator 3. -/
theorem ep_Q2_024_partial_03_0236_valid :
    mulPoly ep_Q2_024_coefficient_03_0236
        ep_Q2_024_generator_03_0200_0299 =
      ep_Q2_024_partial_03_0236 := by
  native_decide

/-- Coefficient term 237 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0237 : Poly :=
[
  term ((-1481468177506417179031785085475034735568 : Rat) / 1799564186103715944850040292044308901985) [(3, 1), (8, 1), (9, 1)]
]

/-- Partial product 237 for generator 3. -/
def ep_Q2_024_partial_03_0237 : Poly :=
[
  term ((-1481468177506417179031785085475034735568 : Rat) / 1799564186103715944850040292044308901985) [(2, 2), (3, 1), (8, 1), (9, 1)],
  term ((1481468177506417179031785085475034735568 : Rat) / 1799564186103715944850040292044308901985) [(3, 1), (8, 1), (9, 3)],
  term ((1481468177506417179031785085475034735568 : Rat) / 1799564186103715944850040292044308901985) [(3, 1), (8, 3), (9, 1)],
  term ((-1481468177506417179031785085475034735568 : Rat) / 1799564186103715944850040292044308901985) [(3, 3), (8, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 237 for generator 3. -/
theorem ep_Q2_024_partial_03_0237_valid :
    mulPoly ep_Q2_024_coefficient_03_0237
        ep_Q2_024_generator_03_0200_0299 =
      ep_Q2_024_partial_03_0237 := by
  native_decide

/-- Coefficient term 238 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0238 : Poly :=
[
  term ((24897008634067285794795130322114482756 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (8, 1), (12, 1), (13, 1)]
]

/-- Partial product 238 for generator 3. -/
def ep_Q2_024_partial_03_0238 : Poly :=
[
  term ((24897008634067285794795130322114482756 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (3, 1), (8, 1), (12, 1), (13, 1)],
  term ((-24897008634067285794795130322114482756 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (8, 1), (9, 2), (12, 1), (13, 1)],
  term ((-24897008634067285794795130322114482756 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (8, 3), (12, 1), (13, 1)],
  term ((24897008634067285794795130322114482756 : Rat) / 199951576233746216094448921338256544665) [(3, 3), (8, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 238 for generator 3. -/
theorem ep_Q2_024_partial_03_0238_valid :
    mulPoly ep_Q2_024_coefficient_03_0238
        ep_Q2_024_generator_03_0200_0299 =
      ep_Q2_024_partial_03_0238 := by
  native_decide

/-- Coefficient term 239 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0239 : Poly :=
[
  term ((-550464729340465184219154740052350989658090880526284951 : Rat) / 185999790426403963700954686167253179493469284649492276) [(3, 1), (8, 1), (12, 1), (15, 1)]
]

/-- Partial product 239 for generator 3. -/
def ep_Q2_024_partial_03_0239 : Poly :=
[
  term ((-550464729340465184219154740052350989658090880526284951 : Rat) / 185999790426403963700954686167253179493469284649492276) [(2, 2), (3, 1), (8, 1), (12, 1), (15, 1)],
  term ((550464729340465184219154740052350989658090880526284951 : Rat) / 185999790426403963700954686167253179493469284649492276) [(3, 1), (8, 1), (9, 2), (12, 1), (15, 1)],
  term ((550464729340465184219154740052350989658090880526284951 : Rat) / 185999790426403963700954686167253179493469284649492276) [(3, 1), (8, 3), (12, 1), (15, 1)],
  term ((-550464729340465184219154740052350989658090880526284951 : Rat) / 185999790426403963700954686167253179493469284649492276) [(3, 3), (8, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 239 for generator 3. -/
theorem ep_Q2_024_partial_03_0239_valid :
    mulPoly ep_Q2_024_coefficient_03_0239
        ep_Q2_024_generator_03_0200_0299 =
      ep_Q2_024_partial_03_0239 := by
  native_decide

/-- Coefficient term 240 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0240 : Poly :=
[
  term ((651692520789483 : Rat) / 1162780221153193) [(3, 1), (8, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 240 for generator 3. -/
def ep_Q2_024_partial_03_0240 : Poly :=
[
  term ((651692520789483 : Rat) / 1162780221153193) [(2, 2), (3, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-651692520789483 : Rat) / 1162780221153193) [(3, 1), (8, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((-651692520789483 : Rat) / 1162780221153193) [(3, 1), (8, 3), (12, 1), (15, 1), (16, 1)],
  term ((651692520789483 : Rat) / 1162780221153193) [(3, 3), (8, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 240 for generator 3. -/
theorem ep_Q2_024_partial_03_0240_valid :
    mulPoly ep_Q2_024_coefficient_03_0240
        ep_Q2_024_generator_03_0200_0299 =
      ep_Q2_024_partial_03_0240 := by
  native_decide

/-- Coefficient term 241 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0241 : Poly :=
[
  term ((60109530803457746714844956809437023648 : Rat) / 359912837220743188970008058408861780397) [(3, 1), (8, 1), (13, 1)]
]

/-- Partial product 241 for generator 3. -/
def ep_Q2_024_partial_03_0241 : Poly :=
[
  term ((60109530803457746714844956809437023648 : Rat) / 359912837220743188970008058408861780397) [(2, 2), (3, 1), (8, 1), (13, 1)],
  term ((-60109530803457746714844956809437023648 : Rat) / 359912837220743188970008058408861780397) [(3, 1), (8, 1), (9, 2), (13, 1)],
  term ((-60109530803457746714844956809437023648 : Rat) / 359912837220743188970008058408861780397) [(3, 1), (8, 3), (13, 1)],
  term ((60109530803457746714844956809437023648 : Rat) / 359912837220743188970008058408861780397) [(3, 3), (8, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 241 for generator 3. -/
theorem ep_Q2_024_partial_03_0241_valid :
    mulPoly ep_Q2_024_coefficient_03_0241
        ep_Q2_024_generator_03_0200_0299 =
      ep_Q2_024_partial_03_0241 := by
  native_decide

/-- Coefficient term 242 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0242 : Poly :=
[
  term ((32331194976992331728812035004906785732445447232480744223 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(3, 1), (8, 1), (15, 1)]
]

/-- Partial product 242 for generator 3. -/
def ep_Q2_024_partial_03_0242 : Poly :=
[
  term ((32331194976992331728812035004906785732445447232480744223 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(2, 2), (3, 1), (8, 1), (15, 1)],
  term ((-32331194976992331728812035004906785732445447232480744223 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(3, 1), (8, 1), (9, 2), (15, 1)],
  term ((-32331194976992331728812035004906785732445447232480744223 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(3, 1), (8, 3), (15, 1)],
  term ((32331194976992331728812035004906785732445447232480744223 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(3, 3), (8, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 242 for generator 3. -/
theorem ep_Q2_024_partial_03_0242_valid :
    mulPoly ep_Q2_024_coefficient_03_0242
        ep_Q2_024_generator_03_0200_0299 =
      ep_Q2_024_partial_03_0242 := by
  native_decide

/-- Coefficient term 243 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0243 : Poly :=
[
  term ((-10199593906176821 : Rat) / 6976681326919158) [(3, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 243 for generator 3. -/
def ep_Q2_024_partial_03_0243 : Poly :=
[
  term ((-10199593906176821 : Rat) / 6976681326919158) [(2, 2), (3, 1), (8, 1), (15, 1), (16, 1)],
  term ((10199593906176821 : Rat) / 6976681326919158) [(3, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((10199593906176821 : Rat) / 6976681326919158) [(3, 1), (8, 3), (15, 1), (16, 1)],
  term ((-10199593906176821 : Rat) / 6976681326919158) [(3, 3), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 243 for generator 3. -/
theorem ep_Q2_024_partial_03_0243_valid :
    mulPoly ep_Q2_024_coefficient_03_0243
        ep_Q2_024_generator_03_0200_0299 =
      ep_Q2_024_partial_03_0243 := by
  native_decide

/-- Coefficient term 244 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0244 : Poly :=
[
  term ((-1000982346610935217724611529643855417109 : Rat) / 1079738511662229566910024175226585341191) [(3, 1), (9, 1)]
]

/-- Partial product 244 for generator 3. -/
def ep_Q2_024_partial_03_0244 : Poly :=
[
  term ((-1000982346610935217724611529643855417109 : Rat) / 1079738511662229566910024175226585341191) [(2, 2), (3, 1), (9, 1)],
  term ((1000982346610935217724611529643855417109 : Rat) / 1079738511662229566910024175226585341191) [(3, 1), (8, 2), (9, 1)],
  term ((1000982346610935217724611529643855417109 : Rat) / 1079738511662229566910024175226585341191) [(3, 1), (9, 3)],
  term ((-1000982346610935217724611529643855417109 : Rat) / 1079738511662229566910024175226585341191) [(3, 3), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 244 for generator 3. -/
theorem ep_Q2_024_partial_03_0244_valid :
    mulPoly ep_Q2_024_coefficient_03_0244
        ep_Q2_024_generator_03_0200_0299 =
      ep_Q2_024_partial_03_0244 := by
  native_decide

/-- Coefficient term 245 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0245 : Poly :=
[
  term ((25684658116189026778536493717385089142 : Rat) / 119970945740247729656669352802953926799) [(3, 1), (9, 1), (12, 1)]
]

/-- Partial product 245 for generator 3. -/
def ep_Q2_024_partial_03_0245 : Poly :=
[
  term ((25684658116189026778536493717385089142 : Rat) / 119970945740247729656669352802953926799) [(2, 2), (3, 1), (9, 1), (12, 1)],
  term ((-25684658116189026778536493717385089142 : Rat) / 119970945740247729656669352802953926799) [(3, 1), (8, 2), (9, 1), (12, 1)],
  term ((-25684658116189026778536493717385089142 : Rat) / 119970945740247729656669352802953926799) [(3, 1), (9, 3), (12, 1)],
  term ((25684658116189026778536493717385089142 : Rat) / 119970945740247729656669352802953926799) [(3, 3), (9, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 245 for generator 3. -/
theorem ep_Q2_024_partial_03_0245_valid :
    mulPoly ep_Q2_024_coefficient_03_0245
        ep_Q2_024_generator_03_0200_0299 =
      ep_Q2_024_partial_03_0245 := by
  native_decide

/-- Coefficient term 246 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0246 : Poly :=
[
  term ((11091310340086889976887063337008120224 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (9, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 246 for generator 3. -/
def ep_Q2_024_partial_03_0246 : Poly :=
[
  term ((11091310340086889976887063337008120224 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (3, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((-11091310340086889976887063337008120224 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (8, 2), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((-11091310340086889976887063337008120224 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (9, 3), (12, 1), (13, 1), (15, 1)],
  term ((11091310340086889976887063337008120224 : Rat) / 199951576233746216094448921338256544665) [(3, 3), (9, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 246 for generator 3. -/
theorem ep_Q2_024_partial_03_0246_valid :
    mulPoly ep_Q2_024_coefficient_03_0246
        ep_Q2_024_generator_03_0200_0299 =
      ep_Q2_024_partial_03_0246 := by
  native_decide

/-- Coefficient term 247 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0247 : Poly :=
[
  term ((-198745616475118943998092102782769635563595552220534688 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 1), (9, 1), (12, 1), (15, 2)]
]

/-- Partial product 247 for generator 3. -/
def ep_Q2_024_partial_03_0247 : Poly :=
[
  term ((-198745616475118943998092102782769635563595552220534688 : Rat) / 139499842819802972775716014625439884620101963487119207) [(2, 2), (3, 1), (9, 1), (12, 1), (15, 2)],
  term ((198745616475118943998092102782769635563595552220534688 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 1), (8, 2), (9, 1), (12, 1), (15, 2)],
  term ((198745616475118943998092102782769635563595552220534688 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 1), (9, 3), (12, 1), (15, 2)],
  term ((-198745616475118943998092102782769635563595552220534688 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 3), (9, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 247 for generator 3. -/
theorem ep_Q2_024_partial_03_0247_valid :
    mulPoly ep_Q2_024_coefficient_03_0247
        ep_Q2_024_generator_03_0200_0299 =
      ep_Q2_024_partial_03_0247 := by
  native_decide

/-- Coefficient term 248 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0248 : Poly :=
[
  term ((527210767274432 : Rat) / 1162780221153193) [(3, 1), (9, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 248 for generator 3. -/
def ep_Q2_024_partial_03_0248 : Poly :=
[
  term ((527210767274432 : Rat) / 1162780221153193) [(2, 2), (3, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-527210767274432 : Rat) / 1162780221153193) [(3, 1), (8, 2), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-527210767274432 : Rat) / 1162780221153193) [(3, 1), (9, 3), (12, 1), (15, 2), (16, 1)],
  term ((527210767274432 : Rat) / 1162780221153193) [(3, 3), (9, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 248 for generator 3. -/
theorem ep_Q2_024_partial_03_0248_valid :
    mulPoly ep_Q2_024_coefficient_03_0248
        ep_Q2_024_generator_03_0200_0299 =
      ep_Q2_024_partial_03_0248 := by
  native_decide

/-- Coefficient term 249 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0249 : Poly :=
[
  term ((1712108411655918217728834922540791858411089679157655495 : Rat) / 1673998113837635673308592175505278615441223561845430484) [(3, 1), (9, 1), (13, 1), (15, 1)]
]

/-- Partial product 249 for generator 3. -/
def ep_Q2_024_partial_03_0249 : Poly :=
[
  term ((1712108411655918217728834922540791858411089679157655495 : Rat) / 1673998113837635673308592175505278615441223561845430484) [(2, 2), (3, 1), (9, 1), (13, 1), (15, 1)],
  term ((-1712108411655918217728834922540791858411089679157655495 : Rat) / 1673998113837635673308592175505278615441223561845430484) [(3, 1), (8, 2), (9, 1), (13, 1), (15, 1)],
  term ((-1712108411655918217728834922540791858411089679157655495 : Rat) / 1673998113837635673308592175505278615441223561845430484) [(3, 1), (9, 3), (13, 1), (15, 1)],
  term ((1712108411655918217728834922540791858411089679157655495 : Rat) / 1673998113837635673308592175505278615441223561845430484) [(3, 3), (9, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 249 for generator 3. -/
theorem ep_Q2_024_partial_03_0249_valid :
    mulPoly ep_Q2_024_coefficient_03_0249
        ep_Q2_024_generator_03_0200_0299 =
      ep_Q2_024_partial_03_0249 := by
  native_decide

/-- Coefficient term 250 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0250 : Poly :=
[
  term ((-5094646267068265 : Rat) / 3488340663459579) [(3, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 250 for generator 3. -/
def ep_Q2_024_partial_03_0250 : Poly :=
[
  term ((-5094646267068265 : Rat) / 3488340663459579) [(2, 2), (3, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((5094646267068265 : Rat) / 3488340663459579) [(3, 1), (8, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((5094646267068265 : Rat) / 3488340663459579) [(3, 1), (9, 3), (13, 1), (15, 1), (16, 1)],
  term ((-5094646267068265 : Rat) / 3488340663459579) [(3, 3), (9, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 250 for generator 3. -/
theorem ep_Q2_024_partial_03_0250_valid :
    mulPoly ep_Q2_024_coefficient_03_0250
        ep_Q2_024_generator_03_0200_0299 =
      ep_Q2_024_partial_03_0250 := by
  native_decide

/-- Coefficient term 251 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0251 : Poly :=
[
  term ((815388877581942842408941403533558143676 : Rat) / 1799564186103715944850040292044308901985) [(3, 1), (9, 1), (13, 2)]
]

/-- Partial product 251 for generator 3. -/
def ep_Q2_024_partial_03_0251 : Poly :=
[
  term ((815388877581942842408941403533558143676 : Rat) / 1799564186103715944850040292044308901985) [(2, 2), (3, 1), (9, 1), (13, 2)],
  term ((-815388877581942842408941403533558143676 : Rat) / 1799564186103715944850040292044308901985) [(3, 1), (8, 2), (9, 1), (13, 2)],
  term ((-815388877581942842408941403533558143676 : Rat) / 1799564186103715944850040292044308901985) [(3, 1), (9, 3), (13, 2)],
  term ((815388877581942842408941403533558143676 : Rat) / 1799564186103715944850040292044308901985) [(3, 3), (9, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 251 for generator 3. -/
theorem ep_Q2_024_partial_03_0251_valid :
    mulPoly ep_Q2_024_coefficient_03_0251
        ep_Q2_024_generator_03_0200_0299 =
      ep_Q2_024_partial_03_0251 := by
  native_decide

/-- Coefficient term 252 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0252 : Poly :=
[
  term ((-127117587288509716251354049751831833361 : Rat) / 359912837220743188970008058408861780397) [(3, 1), (9, 1), (14, 1)]
]

/-- Partial product 252 for generator 3. -/
def ep_Q2_024_partial_03_0252 : Poly :=
[
  term ((-127117587288509716251354049751831833361 : Rat) / 359912837220743188970008058408861780397) [(2, 2), (3, 1), (9, 1), (14, 1)],
  term ((127117587288509716251354049751831833361 : Rat) / 359912837220743188970008058408861780397) [(3, 1), (8, 2), (9, 1), (14, 1)],
  term ((127117587288509716251354049751831833361 : Rat) / 359912837220743188970008058408861780397) [(3, 1), (9, 3), (14, 1)],
  term ((-127117587288509716251354049751831833361 : Rat) / 359912837220743188970008058408861780397) [(3, 3), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 252 for generator 3. -/
theorem ep_Q2_024_partial_03_0252_valid :
    mulPoly ep_Q2_024_coefficient_03_0252
        ep_Q2_024_generator_03_0200_0299 =
      ep_Q2_024_partial_03_0252 := by
  native_decide

/-- Coefficient term 253 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0253 : Poly :=
[
  term ((-333955871046148452268336181265217742995139883845432488747 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(3, 1), (9, 1), (15, 2)]
]

/-- Partial product 253 for generator 3. -/
def ep_Q2_024_partial_03_0253 : Poly :=
[
  term ((-333955871046148452268336181265217742995139883845432488747 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(2, 2), (3, 1), (9, 1), (15, 2)],
  term ((333955871046148452268336181265217742995139883845432488747 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(3, 1), (8, 2), (9, 1), (15, 2)],
  term ((333955871046148452268336181265217742995139883845432488747 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(3, 1), (9, 3), (15, 2)],
  term ((-333955871046148452268336181265217742995139883845432488747 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(3, 3), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 253 for generator 3. -/
theorem ep_Q2_024_partial_03_0253_valid :
    mulPoly ep_Q2_024_coefficient_03_0253
        ep_Q2_024_generator_03_0200_0299 =
      ep_Q2_024_partial_03_0253 := by
  native_decide

/-- Coefficient term 254 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0254 : Poly :=
[
  term ((23585081757950473 : Rat) / 3488340663459579) [(3, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 254 for generator 3. -/
def ep_Q2_024_partial_03_0254 : Poly :=
[
  term ((23585081757950473 : Rat) / 3488340663459579) [(2, 2), (3, 1), (9, 1), (15, 2), (16, 1)],
  term ((-23585081757950473 : Rat) / 3488340663459579) [(3, 1), (8, 2), (9, 1), (15, 2), (16, 1)],
  term ((-23585081757950473 : Rat) / 3488340663459579) [(3, 1), (9, 3), (15, 2), (16, 1)],
  term ((23585081757950473 : Rat) / 3488340663459579) [(3, 3), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 254 for generator 3. -/
theorem ep_Q2_024_partial_03_0254_valid :
    mulPoly ep_Q2_024_coefficient_03_0254
        ep_Q2_024_generator_03_0200_0299 =
      ep_Q2_024_partial_03_0254 := by
  native_decide

/-- Coefficient term 255 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0255 : Poly :=
[
  term ((80699759732353167093043025510819982368 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (9, 2), (13, 1)]
]

/-- Partial product 255 for generator 3. -/
def ep_Q2_024_partial_03_0255 : Poly :=
[
  term ((80699759732353167093043025510819982368 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (3, 1), (9, 2), (13, 1)],
  term ((-80699759732353167093043025510819982368 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (8, 2), (9, 2), (13, 1)],
  term ((-80699759732353167093043025510819982368 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (9, 4), (13, 1)],
  term ((80699759732353167093043025510819982368 : Rat) / 599854728701238648283346764014769633995) [(3, 3), (9, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 255 for generator 3. -/
theorem ep_Q2_024_partial_03_0255_valid :
    mulPoly ep_Q2_024_coefficient_03_0255
        ep_Q2_024_generator_03_0200_0299 =
      ep_Q2_024_partial_03_0255 := by
  native_decide

/-- Coefficient term 256 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0256 : Poly :=
[
  term ((5091805456535845778375342211586282097669456763909390217 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(3, 1), (9, 2), (15, 1)]
]

/-- Partial product 256 for generator 3. -/
def ep_Q2_024_partial_03_0256 : Poly :=
[
  term ((5091805456535845778375342211586282097669456763909390217 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(2, 2), (3, 1), (9, 2), (15, 1)],
  term ((-5091805456535845778375342211586282097669456763909390217 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(3, 1), (8, 2), (9, 2), (15, 1)],
  term ((-5091805456535845778375342211586282097669456763909390217 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(3, 1), (9, 4), (15, 1)],
  term ((5091805456535845778375342211586282097669456763909390217 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(3, 3), (9, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 256 for generator 3. -/
theorem ep_Q2_024_partial_03_0256_valid :
    mulPoly ep_Q2_024_coefficient_03_0256
        ep_Q2_024_generator_03_0200_0299 =
      ep_Q2_024_partial_03_0256 := by
  native_decide

/-- Coefficient term 257 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0257 : Poly :=
[
  term ((373787112386234 : Rat) / 3488340663459579) [(3, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 257 for generator 3. -/
def ep_Q2_024_partial_03_0257 : Poly :=
[
  term ((373787112386234 : Rat) / 3488340663459579) [(2, 2), (3, 1), (9, 2), (15, 1), (16, 1)],
  term ((-373787112386234 : Rat) / 3488340663459579) [(3, 1), (8, 2), (9, 2), (15, 1), (16, 1)],
  term ((-373787112386234 : Rat) / 3488340663459579) [(3, 1), (9, 4), (15, 1), (16, 1)],
  term ((373787112386234 : Rat) / 3488340663459579) [(3, 3), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 257 for generator 3. -/
theorem ep_Q2_024_partial_03_0257_valid :
    mulPoly ep_Q2_024_coefficient_03_0257
        ep_Q2_024_generator_03_0200_0299 =
      ep_Q2_024_partial_03_0257 := by
  native_decide

/-- Coefficient term 258 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0258 : Poly :=
[
  term ((31556266093234973165652571965850210528 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (9, 3)]
]

/-- Partial product 258 for generator 3. -/
def ep_Q2_024_partial_03_0258 : Poly :=
[
  term ((31556266093234973165652571965850210528 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (3, 1), (9, 3)],
  term ((-31556266093234973165652571965850210528 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (8, 2), (9, 3)],
  term ((-31556266093234973165652571965850210528 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (9, 5)],
  term ((31556266093234973165652571965850210528 : Rat) / 599854728701238648283346764014769633995) [(3, 3), (9, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 258 for generator 3. -/
theorem ep_Q2_024_partial_03_0258_valid :
    mulPoly ep_Q2_024_coefficient_03_0258
        ep_Q2_024_generator_03_0200_0299 =
      ep_Q2_024_partial_03_0258 := by
  native_decide

/-- Coefficient term 259 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0259 : Poly :=
[
  term ((-76474576310683161421068611148154773436 : Rat) / 1799564186103715944850040292044308901985) [(3, 1), (12, 1), (13, 1)]
]

/-- Partial product 259 for generator 3. -/
def ep_Q2_024_partial_03_0259 : Poly :=
[
  term ((-76474576310683161421068611148154773436 : Rat) / 1799564186103715944850040292044308901985) [(2, 2), (3, 1), (12, 1), (13, 1)],
  term ((76474576310683161421068611148154773436 : Rat) / 1799564186103715944850040292044308901985) [(3, 1), (8, 2), (12, 1), (13, 1)],
  term ((76474576310683161421068611148154773436 : Rat) / 1799564186103715944850040292044308901985) [(3, 1), (9, 2), (12, 1), (13, 1)],
  term ((-76474576310683161421068611148154773436 : Rat) / 1799564186103715944850040292044308901985) [(3, 3), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 259 for generator 3. -/
theorem ep_Q2_024_partial_03_0259_valid :
    mulPoly ep_Q2_024_coefficient_03_0259
        ep_Q2_024_generator_03_0200_0299 =
      ep_Q2_024_partial_03_0259 := by
  native_decide

/-- Coefficient term 260 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0260 : Poly :=
[
  term ((3209257923513847776562869360713708288 : Rat) / 39990315246749243218889784267651308933) [(3, 1), (12, 1), (13, 1), (15, 2)]
]

/-- Partial product 260 for generator 3. -/
def ep_Q2_024_partial_03_0260 : Poly :=
[
  term ((3209257923513847776562869360713708288 : Rat) / 39990315246749243218889784267651308933) [(2, 2), (3, 1), (12, 1), (13, 1), (15, 2)],
  term ((-3209257923513847776562869360713708288 : Rat) / 39990315246749243218889784267651308933) [(3, 1), (8, 2), (12, 1), (13, 1), (15, 2)],
  term ((-3209257923513847776562869360713708288 : Rat) / 39990315246749243218889784267651308933) [(3, 1), (9, 2), (12, 1), (13, 1), (15, 2)],
  term ((3209257923513847776562869360713708288 : Rat) / 39990315246749243218889784267651308933) [(3, 3), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 260 for generator 3. -/
theorem ep_Q2_024_partial_03_0260_valid :
    mulPoly ep_Q2_024_coefficient_03_0260
        ep_Q2_024_generator_03_0200_0299 =
      ep_Q2_024_partial_03_0260 := by
  native_decide

/-- Coefficient term 261 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0261 : Poly :=
[
  term ((-133901730145647480311055423658088066627164029419309381743 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(3, 1), (12, 1), (15, 1)]
]

/-- Partial product 261 for generator 3. -/
def ep_Q2_024_partial_03_0261 : Poly :=
[
  term ((-133901730145647480311055423658088066627164029419309381743 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(2, 2), (3, 1), (12, 1), (15, 1)],
  term ((133901730145647480311055423658088066627164029419309381743 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(3, 1), (8, 2), (12, 1), (15, 1)],
  term ((133901730145647480311055423658088066627164029419309381743 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(3, 1), (9, 2), (12, 1), (15, 1)],
  term ((-133901730145647480311055423658088066627164029419309381743 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(3, 3), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 261 for generator 3. -/
theorem ep_Q2_024_partial_03_0261_valid :
    mulPoly ep_Q2_024_coefficient_03_0261
        ep_Q2_024_generator_03_0200_0299 =
      ep_Q2_024_partial_03_0261 := by
  native_decide

/-- Coefficient term 262 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0262 : Poly :=
[
  term ((14109749030913719 : Rat) / 6976681326919158) [(3, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 262 for generator 3. -/
def ep_Q2_024_partial_03_0262 : Poly :=
[
  term ((14109749030913719 : Rat) / 6976681326919158) [(2, 2), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((-14109749030913719 : Rat) / 6976681326919158) [(3, 1), (8, 2), (12, 1), (15, 1), (16, 1)],
  term ((-14109749030913719 : Rat) / 6976681326919158) [(3, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((14109749030913719 : Rat) / 6976681326919158) [(3, 3), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 262 for generator 3. -/
theorem ep_Q2_024_partial_03_0262_valid :
    mulPoly ep_Q2_024_coefficient_03_0262
        ep_Q2_024_generator_03_0200_0299 =
      ep_Q2_024_partial_03_0262 := by
  native_decide

/-- Coefficient term 263 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0263 : Poly :=
[
  term ((-550224871676112102035615555952179792604942567145793832 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (12, 1), (15, 3)]
]

/-- Partial product 263 for generator 3. -/
def ep_Q2_024_partial_03_0263 : Poly :=
[
  term ((-550224871676112102035615555952179792604942567145793832 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 2), (3, 1), (12, 1), (15, 3)],
  term ((550224871676112102035615555952179792604942567145793832 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (8, 2), (12, 1), (15, 3)],
  term ((550224871676112102035615555952179792604942567145793832 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (9, 2), (12, 1), (15, 3)],
  term ((-550224871676112102035615555952179792604942567145793832 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 3), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 263 for generator 3. -/
theorem ep_Q2_024_partial_03_0263_valid :
    mulPoly ep_Q2_024_coefficient_03_0263
        ep_Q2_024_generator_03_0200_0299 =
      ep_Q2_024_partial_03_0263 := by
  native_decide

/-- Coefficient term 264 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0264 : Poly :=
[
  term ((1443384088015008 : Rat) / 1162780221153193) [(3, 1), (12, 1), (15, 3), (16, 1)]
]

/-- Partial product 264 for generator 3. -/
def ep_Q2_024_partial_03_0264 : Poly :=
[
  term ((1443384088015008 : Rat) / 1162780221153193) [(2, 2), (3, 1), (12, 1), (15, 3), (16, 1)],
  term ((-1443384088015008 : Rat) / 1162780221153193) [(3, 1), (8, 2), (12, 1), (15, 3), (16, 1)],
  term ((-1443384088015008 : Rat) / 1162780221153193) [(3, 1), (9, 2), (12, 1), (15, 3), (16, 1)],
  term ((1443384088015008 : Rat) / 1162780221153193) [(3, 3), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 264 for generator 3. -/
theorem ep_Q2_024_partial_03_0264_valid :
    mulPoly ep_Q2_024_coefficient_03_0264
        ep_Q2_024_generator_03_0200_0299 =
      ep_Q2_024_partial_03_0264 := by
  native_decide

/-- Coefficient term 265 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0265 : Poly :=
[
  term ((-24897008634067285794795130322114482756 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (12, 2), (13, 1)]
]

/-- Partial product 265 for generator 3. -/
def ep_Q2_024_partial_03_0265 : Poly :=
[
  term ((-24897008634067285794795130322114482756 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (3, 1), (12, 2), (13, 1)],
  term ((24897008634067285794795130322114482756 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (8, 2), (12, 2), (13, 1)],
  term ((24897008634067285794795130322114482756 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (9, 2), (12, 2), (13, 1)],
  term ((-24897008634067285794795130322114482756 : Rat) / 199951576233746216094448921338256544665) [(3, 3), (12, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 265 for generator 3. -/
theorem ep_Q2_024_partial_03_0265_valid :
    mulPoly ep_Q2_024_coefficient_03_0265
        ep_Q2_024_generator_03_0200_0299 =
      ep_Q2_024_partial_03_0265 := by
  native_decide

/-- Coefficient term 266 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0266 : Poly :=
[
  term ((550464729340465184219154740052350989658090880526284951 : Rat) / 185999790426403963700954686167253179493469284649492276) [(3, 1), (12, 2), (15, 1)]
]

/-- Partial product 266 for generator 3. -/
def ep_Q2_024_partial_03_0266 : Poly :=
[
  term ((550464729340465184219154740052350989658090880526284951 : Rat) / 185999790426403963700954686167253179493469284649492276) [(2, 2), (3, 1), (12, 2), (15, 1)],
  term ((-550464729340465184219154740052350989658090880526284951 : Rat) / 185999790426403963700954686167253179493469284649492276) [(3, 1), (8, 2), (12, 2), (15, 1)],
  term ((-550464729340465184219154740052350989658090880526284951 : Rat) / 185999790426403963700954686167253179493469284649492276) [(3, 1), (9, 2), (12, 2), (15, 1)],
  term ((550464729340465184219154740052350989658090880526284951 : Rat) / 185999790426403963700954686167253179493469284649492276) [(3, 3), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 266 for generator 3. -/
theorem ep_Q2_024_partial_03_0266_valid :
    mulPoly ep_Q2_024_coefficient_03_0266
        ep_Q2_024_generator_03_0200_0299 =
      ep_Q2_024_partial_03_0266 := by
  native_decide

/-- Coefficient term 267 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0267 : Poly :=
[
  term ((-651692520789483 : Rat) / 1162780221153193) [(3, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 267 for generator 3. -/
def ep_Q2_024_partial_03_0267 : Poly :=
[
  term ((-651692520789483 : Rat) / 1162780221153193) [(2, 2), (3, 1), (12, 2), (15, 1), (16, 1)],
  term ((651692520789483 : Rat) / 1162780221153193) [(3, 1), (8, 2), (12, 2), (15, 1), (16, 1)],
  term ((651692520789483 : Rat) / 1162780221153193) [(3, 1), (9, 2), (12, 2), (15, 1), (16, 1)],
  term ((-651692520789483 : Rat) / 1162780221153193) [(3, 3), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 267 for generator 3. -/
theorem ep_Q2_024_partial_03_0267_valid :
    mulPoly ep_Q2_024_coefficient_03_0267
        ep_Q2_024_generator_03_0200_0299 =
      ep_Q2_024_partial_03_0267 := by
  native_decide

/-- Coefficient term 268 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0268 : Poly :=
[
  term ((-1833924092259080024041547913384349366796 : Rat) / 1799564186103715944850040292044308901985) [(3, 1), (13, 1)]
]

/-- Partial product 268 for generator 3. -/
def ep_Q2_024_partial_03_0268 : Poly :=
[
  term ((-1833924092259080024041547913384349366796 : Rat) / 1799564186103715944850040292044308901985) [(2, 2), (3, 1), (13, 1)],
  term ((1833924092259080024041547913384349366796 : Rat) / 1799564186103715944850040292044308901985) [(3, 1), (8, 2), (13, 1)],
  term ((1833924092259080024041547913384349366796 : Rat) / 1799564186103715944850040292044308901985) [(3, 1), (9, 2), (13, 1)],
  term ((-1833924092259080024041547913384349366796 : Rat) / 1799564186103715944850040292044308901985) [(3, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 268 for generator 3. -/
theorem ep_Q2_024_partial_03_0268_valid :
    mulPoly ep_Q2_024_coefficient_03_0268
        ep_Q2_024_generator_03_0200_0299 =
      ep_Q2_024_partial_03_0268 := by
  native_decide

/-- Coefficient term 269 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0269 : Poly :=
[
  term ((-43135328846876119407214699700298383881329052598883204313 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(3, 1), (13, 1), (15, 2)]
]

/-- Partial product 269 for generator 3. -/
def ep_Q2_024_partial_03_0269 : Poly :=
[
  term ((-43135328846876119407214699700298383881329052598883204313 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(2, 2), (3, 1), (13, 1), (15, 2)],
  term ((43135328846876119407214699700298383881329052598883204313 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(3, 1), (8, 2), (13, 1), (15, 2)],
  term ((43135328846876119407214699700298383881329052598883204313 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(3, 1), (9, 2), (13, 1), (15, 2)],
  term ((-43135328846876119407214699700298383881329052598883204313 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(3, 3), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 269 for generator 3. -/
theorem ep_Q2_024_partial_03_0269_valid :
    mulPoly ep_Q2_024_coefficient_03_0269
        ep_Q2_024_generator_03_0200_0299 =
      ep_Q2_024_partial_03_0269 := by
  native_decide

/-- Coefficient term 270 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0270 : Poly :=
[
  term ((212582817171990 : Rat) / 1162780221153193) [(3, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 270 for generator 3. -/
def ep_Q2_024_partial_03_0270 : Poly :=
[
  term ((212582817171990 : Rat) / 1162780221153193) [(2, 2), (3, 1), (13, 1), (15, 2), (16, 1)],
  term ((-212582817171990 : Rat) / 1162780221153193) [(3, 1), (8, 2), (13, 1), (15, 2), (16, 1)],
  term ((-212582817171990 : Rat) / 1162780221153193) [(3, 1), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((212582817171990 : Rat) / 1162780221153193) [(3, 3), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 270 for generator 3. -/
theorem ep_Q2_024_partial_03_0270_valid :
    mulPoly ep_Q2_024_coefficient_03_0270
        ep_Q2_024_generator_03_0200_0299 =
      ep_Q2_024_partial_03_0270 := by
  native_decide

/-- Coefficient term 271 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0271 : Poly :=
[
  term ((-32374617250718488653403865302693490632 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (13, 2), (15, 1)]
]

/-- Partial product 271 for generator 3. -/
def ep_Q2_024_partial_03_0271 : Poly :=
[
  term ((-32374617250718488653403865302693490632 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (3, 1), (13, 2), (15, 1)],
  term ((32374617250718488653403865302693490632 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (8, 2), (13, 2), (15, 1)],
  term ((32374617250718488653403865302693490632 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (9, 2), (13, 2), (15, 1)],
  term ((-32374617250718488653403865302693490632 : Rat) / 599854728701238648283346764014769633995) [(3, 3), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 271 for generator 3. -/
theorem ep_Q2_024_partial_03_0271_valid :
    mulPoly ep_Q2_024_coefficient_03_0271
        ep_Q2_024_generator_03_0200_0299 =
      ep_Q2_024_partial_03_0271 := by
  native_decide

/-- Coefficient term 272 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0272 : Poly :=
[
  term ((-1217648963717924911224184363882747984154 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (14, 1), (15, 1)]
]

/-- Partial product 272 for generator 3. -/
def ep_Q2_024_partial_03_0272 : Poly :=
[
  term ((-1217648963717924911224184363882747984154 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (3, 1), (14, 1), (15, 1)],
  term ((1217648963717924911224184363882747984154 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (8, 2), (14, 1), (15, 1)],
  term ((1217648963717924911224184363882747984154 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (9, 2), (14, 1), (15, 1)],
  term ((-1217648963717924911224184363882747984154 : Rat) / 599854728701238648283346764014769633995) [(3, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 272 for generator 3. -/
theorem ep_Q2_024_partial_03_0272_valid :
    mulPoly ep_Q2_024_coefficient_03_0272
        ep_Q2_024_generator_03_0200_0299 =
      ep_Q2_024_partial_03_0272 := by
  native_decide

/-- Coefficient term 273 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0273 : Poly :=
[
  term ((-39292236797226992440197220772125994819345850433213325433 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(3, 1), (15, 1)]
]

/-- Partial product 273 for generator 3. -/
def ep_Q2_024_partial_03_0273 : Poly :=
[
  term ((-39292236797226992440197220772125994819345850433213325433 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(2, 2), (3, 1), (15, 1)],
  term ((39292236797226992440197220772125994819345850433213325433 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(3, 1), (8, 2), (15, 1)],
  term ((39292236797226992440197220772125994819345850433213325433 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(3, 1), (9, 2), (15, 1)],
  term ((-39292236797226992440197220772125994819345850433213325433 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(3, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 273 for generator 3. -/
theorem ep_Q2_024_partial_03_0273_valid :
    mulPoly ep_Q2_024_coefficient_03_0273
        ep_Q2_024_generator_03_0200_0299 =
      ep_Q2_024_partial_03_0273 := by
  native_decide

/-- Coefficient term 274 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0274 : Poly :=
[
  term ((8151765536575891 : Rat) / 6976681326919158) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 274 for generator 3. -/
def ep_Q2_024_partial_03_0274 : Poly :=
[
  term ((8151765536575891 : Rat) / 6976681326919158) [(2, 2), (3, 1), (15, 1), (16, 1)],
  term ((-8151765536575891 : Rat) / 6976681326919158) [(3, 1), (8, 2), (15, 1), (16, 1)],
  term ((-8151765536575891 : Rat) / 6976681326919158) [(3, 1), (9, 2), (15, 1), (16, 1)],
  term ((8151765536575891 : Rat) / 6976681326919158) [(3, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 274 for generator 3. -/
theorem ep_Q2_024_partial_03_0274_valid :
    mulPoly ep_Q2_024_coefficient_03_0274
        ep_Q2_024_generator_03_0200_0299 =
      ep_Q2_024_partial_03_0274 := by
  native_decide

/-- Coefficient term 275 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0275 : Poly :=
[
  term ((-4666118582264079879312520807185554929005944364492589137 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (15, 3)]
]

/-- Partial product 275 for generator 3. -/
def ep_Q2_024_partial_03_0275 : Poly :=
[
  term ((-4666118582264079879312520807185554929005944364492589137 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 2), (3, 1), (15, 3)],
  term ((4666118582264079879312520807185554929005944364492589137 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (8, 2), (15, 3)],
  term ((4666118582264079879312520807185554929005944364492589137 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (9, 2), (15, 3)],
  term ((-4666118582264079879312520807185554929005944364492589137 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 3), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 275 for generator 3. -/
theorem ep_Q2_024_partial_03_0275_valid :
    mulPoly ep_Q2_024_coefficient_03_0275
        ep_Q2_024_generator_03_0200_0299 =
      ep_Q2_024_partial_03_0275 := by
  native_decide

/-- Coefficient term 276 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0276 : Poly :=
[
  term ((7791585621739076 : Rat) / 1162780221153193) [(3, 1), (15, 3), (16, 1)]
]

/-- Partial product 276 for generator 3. -/
def ep_Q2_024_partial_03_0276 : Poly :=
[
  term ((7791585621739076 : Rat) / 1162780221153193) [(2, 2), (3, 1), (15, 3), (16, 1)],
  term ((-7791585621739076 : Rat) / 1162780221153193) [(3, 1), (8, 2), (15, 3), (16, 1)],
  term ((-7791585621739076 : Rat) / 1162780221153193) [(3, 1), (9, 2), (15, 3), (16, 1)],
  term ((7791585621739076 : Rat) / 1162780221153193) [(3, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 276 for generator 3. -/
theorem ep_Q2_024_partial_03_0276_valid :
    mulPoly ep_Q2_024_coefficient_03_0276
        ep_Q2_024_generator_03_0200_0299 =
      ep_Q2_024_partial_03_0276 := by
  native_decide

/-- Coefficient term 277 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0277 : Poly :=
[
  term ((-10914088454272291175538852046163768941136 : Rat) / 5398692558311147834550120876132926705955) [(3, 2)]
]

/-- Partial product 277 for generator 3. -/
def ep_Q2_024_partial_03_0277 : Poly :=
[
  term ((-10914088454272291175538852046163768941136 : Rat) / 5398692558311147834550120876132926705955) [(2, 2), (3, 2)],
  term ((10914088454272291175538852046163768941136 : Rat) / 5398692558311147834550120876132926705955) [(3, 2), (8, 2)],
  term ((10914088454272291175538852046163768941136 : Rat) / 5398692558311147834550120876132926705955) [(3, 2), (9, 2)],
  term ((-10914088454272291175538852046163768941136 : Rat) / 5398692558311147834550120876132926705955) [(3, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 277 for generator 3. -/
theorem ep_Q2_024_partial_03_0277_valid :
    mulPoly ep_Q2_024_coefficient_03_0277
        ep_Q2_024_generator_03_0200_0299 =
      ep_Q2_024_partial_03_0277 := by
  native_decide

/-- Coefficient term 278 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0278 : Poly :=
[
  term ((-2930149234713651113130679487801312091016 : Rat) / 1799564186103715944850040292044308901985) [(3, 2), (4, 1)]
]

/-- Partial product 278 for generator 3. -/
def ep_Q2_024_partial_03_0278 : Poly :=
[
  term ((-2930149234713651113130679487801312091016 : Rat) / 1799564186103715944850040292044308901985) [(2, 2), (3, 2), (4, 1)],
  term ((2930149234713651113130679487801312091016 : Rat) / 1799564186103715944850040292044308901985) [(3, 2), (4, 1), (8, 2)],
  term ((2930149234713651113130679487801312091016 : Rat) / 1799564186103715944850040292044308901985) [(3, 2), (4, 1), (9, 2)],
  term ((-2930149234713651113130679487801312091016 : Rat) / 1799564186103715944850040292044308901985) [(3, 4), (4, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 278 for generator 3. -/
theorem ep_Q2_024_partial_03_0278_valid :
    mulPoly ep_Q2_024_coefficient_03_0278
        ep_Q2_024_generator_03_0200_0299 =
      ep_Q2_024_partial_03_0278 := by
  native_decide

/-- Coefficient term 279 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0279 : Poly :=
[
  term ((16890983628896808743407603036576568848 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (5, 1), (9, 1)]
]

/-- Partial product 279 for generator 3. -/
def ep_Q2_024_partial_03_0279 : Poly :=
[
  term ((16890983628896808743407603036576568848 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (3, 2), (5, 1), (9, 1)],
  term ((-16890983628896808743407603036576568848 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (5, 1), (8, 2), (9, 1)],
  term ((-16890983628896808743407603036576568848 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (5, 1), (9, 3)],
  term ((16890983628896808743407603036576568848 : Rat) / 599854728701238648283346764014769633995) [(3, 4), (5, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 279 for generator 3. -/
theorem ep_Q2_024_partial_03_0279_valid :
    mulPoly ep_Q2_024_coefficient_03_0279
        ep_Q2_024_generator_03_0200_0299 =
      ep_Q2_024_partial_03_0279 := by
  native_decide

/-- Coefficient term 280 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0280 : Poly :=
[
  term ((-3082928476586153890712559966648414688 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (5, 1), (13, 1)]
]

/-- Partial product 280 for generator 3. -/
def ep_Q2_024_partial_03_0280 : Poly :=
[
  term ((-3082928476586153890712559966648414688 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (3, 2), (5, 1), (13, 1)],
  term ((3082928476586153890712559966648414688 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (5, 1), (8, 2), (13, 1)],
  term ((3082928476586153890712559966648414688 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (5, 1), (9, 2), (13, 1)],
  term ((-3082928476586153890712559966648414688 : Rat) / 599854728701238648283346764014769633995) [(3, 4), (5, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 280 for generator 3. -/
theorem ep_Q2_024_partial_03_0280_valid :
    mulPoly ep_Q2_024_coefficient_03_0280
        ep_Q2_024_generator_03_0200_0299 =
      ep_Q2_024_partial_03_0280 := by
  native_decide

/-- Coefficient term 281 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0281 : Poly :=
[
  term ((-3319869963774812909052232810846149293107172472347692792 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 2), (5, 1), (15, 1)]
]

/-- Partial product 281 for generator 3. -/
def ep_Q2_024_partial_03_0281 : Poly :=
[
  term ((-3319869963774812909052232810846149293107172472347692792 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 2), (3, 2), (5, 1), (15, 1)],
  term ((3319869963774812909052232810846149293107172472347692792 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 2), (5, 1), (8, 2), (15, 1)],
  term ((3319869963774812909052232810846149293107172472347692792 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 2), (5, 1), (9, 2), (15, 1)],
  term ((-3319869963774812909052232810846149293107172472347692792 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 4), (5, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 281 for generator 3. -/
theorem ep_Q2_024_partial_03_0281_valid :
    mulPoly ep_Q2_024_coefficient_03_0281
        ep_Q2_024_generator_03_0200_0299 =
      ep_Q2_024_partial_03_0281 := by
  native_decide

/-- Coefficient term 282 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0282 : Poly :=
[
  term ((1243911894777184 : Rat) / 3488340663459579) [(3, 2), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 282 for generator 3. -/
def ep_Q2_024_partial_03_0282 : Poly :=
[
  term ((1243911894777184 : Rat) / 3488340663459579) [(2, 2), (3, 2), (5, 1), (15, 1), (16, 1)],
  term ((-1243911894777184 : Rat) / 3488340663459579) [(3, 2), (5, 1), (8, 2), (15, 1), (16, 1)],
  term ((-1243911894777184 : Rat) / 3488340663459579) [(3, 2), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((1243911894777184 : Rat) / 3488340663459579) [(3, 4), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 282 for generator 3. -/
theorem ep_Q2_024_partial_03_0282_valid :
    mulPoly ep_Q2_024_coefficient_03_0282
        ep_Q2_024_generator_03_0200_0299 =
      ep_Q2_024_partial_03_0282 := by
  native_decide

/-- Coefficient term 283 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0283 : Poly :=
[
  term ((1652695128300478652375073904873736949728 : Rat) / 1799564186103715944850040292044308901985) [(3, 2), (8, 1)]
]

/-- Partial product 283 for generator 3. -/
def ep_Q2_024_partial_03_0283 : Poly :=
[
  term ((1652695128300478652375073904873736949728 : Rat) / 1799564186103715944850040292044308901985) [(2, 2), (3, 2), (8, 1)],
  term ((-1652695128300478652375073904873736949728 : Rat) / 1799564186103715944850040292044308901985) [(3, 2), (8, 1), (9, 2)],
  term ((-1652695128300478652375073904873736949728 : Rat) / 1799564186103715944850040292044308901985) [(3, 2), (8, 3)],
  term ((1652695128300478652375073904873736949728 : Rat) / 1799564186103715944850040292044308901985) [(3, 4), (8, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 283 for generator 3. -/
theorem ep_Q2_024_partial_03_0283_valid :
    mulPoly ep_Q2_024_coefficient_03_0283
        ep_Q2_024_generator_03_0200_0299 =
      ep_Q2_024_partial_03_0283 := by
  native_decide

/-- Coefficient term 284 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0284 : Poly :=
[
  term ((-36712442508195667296262437051940901488 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (9, 1), (13, 1)]
]

/-- Partial product 284 for generator 3. -/
def ep_Q2_024_partial_03_0284 : Poly :=
[
  term ((-36712442508195667296262437051940901488 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (3, 2), (9, 1), (13, 1)],
  term ((36712442508195667296262437051940901488 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (8, 2), (9, 1), (13, 1)],
  term ((36712442508195667296262437051940901488 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (9, 3), (13, 1)],
  term ((-36712442508195667296262437051940901488 : Rat) / 599854728701238648283346764014769633995) [(3, 4), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 284 for generator 3. -/
theorem ep_Q2_024_partial_03_0284_valid :
    mulPoly ep_Q2_024_coefficient_03_0284
        ep_Q2_024_generator_03_0200_0299 =
      ep_Q2_024_partial_03_0284 := by
  native_decide

/-- Coefficient term 285 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0285 : Poly :=
[
  term ((-225792246667296571754346172666409042645220020210494517 : Rat) / 418499528459408918327148043876319653860305890461357621) [(3, 2), (9, 1), (15, 1)]
]

/-- Partial product 285 for generator 3. -/
def ep_Q2_024_partial_03_0285 : Poly :=
[
  term ((-225792246667296571754346172666409042645220020210494517 : Rat) / 418499528459408918327148043876319653860305890461357621) [(2, 2), (3, 2), (9, 1), (15, 1)],
  term ((225792246667296571754346172666409042645220020210494517 : Rat) / 418499528459408918327148043876319653860305890461357621) [(3, 2), (8, 2), (9, 1), (15, 1)],
  term ((225792246667296571754346172666409042645220020210494517 : Rat) / 418499528459408918327148043876319653860305890461357621) [(3, 2), (9, 3), (15, 1)],
  term ((-225792246667296571754346172666409042645220020210494517 : Rat) / 418499528459408918327148043876319653860305890461357621) [(3, 4), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 285 for generator 3. -/
theorem ep_Q2_024_partial_03_0285_valid :
    mulPoly ep_Q2_024_coefficient_03_0285
        ep_Q2_024_generator_03_0200_0299 =
      ep_Q2_024_partial_03_0285 := by
  native_decide

/-- Coefficient term 286 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0286 : Poly :=
[
  term ((-747574224772468 : Rat) / 3488340663459579) [(3, 2), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 286 for generator 3. -/
def ep_Q2_024_partial_03_0286 : Poly :=
[
  term ((-747574224772468 : Rat) / 3488340663459579) [(2, 2), (3, 2), (9, 1), (15, 1), (16, 1)],
  term ((747574224772468 : Rat) / 3488340663459579) [(3, 2), (8, 2), (9, 1), (15, 1), (16, 1)],
  term ((747574224772468 : Rat) / 3488340663459579) [(3, 2), (9, 3), (15, 1), (16, 1)],
  term ((-747574224772468 : Rat) / 3488340663459579) [(3, 4), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 286 for generator 3. -/
theorem ep_Q2_024_partial_03_0286_valid :
    mulPoly ep_Q2_024_coefficient_03_0286
        ep_Q2_024_generator_03_0200_0299 =
      ep_Q2_024_partial_03_0286 := by
  native_decide

/-- Coefficient term 287 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0287 : Poly :=
[
  term ((-63112532186469946331305143931700421056 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (9, 2)]
]

/-- Partial product 287 for generator 3. -/
def ep_Q2_024_partial_03_0287 : Poly :=
[
  term ((-63112532186469946331305143931700421056 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (3, 2), (9, 2)],
  term ((63112532186469946331305143931700421056 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (8, 2), (9, 2)],
  term ((63112532186469946331305143931700421056 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (9, 4)],
  term ((-63112532186469946331305143931700421056 : Rat) / 599854728701238648283346764014769633995) [(3, 4), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 287 for generator 3. -/
theorem ep_Q2_024_partial_03_0287_valid :
    mulPoly ep_Q2_024_coefficient_03_0287
        ep_Q2_024_generator_03_0200_0299 =
      ep_Q2_024_partial_03_0287 := by
  native_decide

/-- Coefficient term 288 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0288 : Poly :=
[
  term ((179900494408894967444133818184926615716 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (12, 1)]
]

/-- Partial product 288 for generator 3. -/
def ep_Q2_024_partial_03_0288 : Poly :=
[
  term ((179900494408894967444133818184926615716 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (3, 2), (12, 1)],
  term ((-179900494408894967444133818184926615716 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (8, 2), (12, 1)],
  term ((-179900494408894967444133818184926615716 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (9, 2), (12, 1)],
  term ((179900494408894967444133818184926615716 : Rat) / 599854728701238648283346764014769633995) [(3, 4), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 288 for generator 3. -/
theorem ep_Q2_024_partial_03_0288_valid :
    mulPoly ep_Q2_024_coefficient_03_0288
        ep_Q2_024_generator_03_0200_0299 =
      ep_Q2_024_partial_03_0288 := by
  native_decide

/-- Coefficient term 289 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0289 : Poly :=
[
  term ((-22182620680173779953774126674016240448 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 289 for generator 3. -/
def ep_Q2_024_partial_03_0289 : Poly :=
[
  term ((-22182620680173779953774126674016240448 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (3, 2), (12, 1), (13, 1), (15, 1)],
  term ((22182620680173779953774126674016240448 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (8, 2), (12, 1), (13, 1), (15, 1)],
  term ((22182620680173779953774126674016240448 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (9, 2), (12, 1), (13, 1), (15, 1)],
  term ((-22182620680173779953774126674016240448 : Rat) / 199951576233746216094448921338256544665) [(3, 4), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 289 for generator 3. -/
theorem ep_Q2_024_partial_03_0289_valid :
    mulPoly ep_Q2_024_coefficient_03_0289
        ep_Q2_024_generator_03_0200_0299 =
      ep_Q2_024_partial_03_0289 := by
  native_decide

/-- Coefficient term 290 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0290 : Poly :=
[
  term ((397491232950237887996184205565539271127191104441069376 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 2), (12, 1), (15, 2)]
]

/-- Partial product 290 for generator 3. -/
def ep_Q2_024_partial_03_0290 : Poly :=
[
  term ((397491232950237887996184205565539271127191104441069376 : Rat) / 139499842819802972775716014625439884620101963487119207) [(2, 2), (3, 2), (12, 1), (15, 2)],
  term ((-397491232950237887996184205565539271127191104441069376 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 2), (8, 2), (12, 1), (15, 2)],
  term ((-397491232950237887996184205565539271127191104441069376 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 2), (9, 2), (12, 1), (15, 2)],
  term ((397491232950237887996184205565539271127191104441069376 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 4), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 290 for generator 3. -/
theorem ep_Q2_024_partial_03_0290_valid :
    mulPoly ep_Q2_024_coefficient_03_0290
        ep_Q2_024_generator_03_0200_0299 =
      ep_Q2_024_partial_03_0290 := by
  native_decide

/-- Coefficient term 291 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0291 : Poly :=
[
  term ((-1054421534548864 : Rat) / 1162780221153193) [(3, 2), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 291 for generator 3. -/
def ep_Q2_024_partial_03_0291 : Poly :=
[
  term ((-1054421534548864 : Rat) / 1162780221153193) [(2, 2), (3, 2), (12, 1), (15, 2), (16, 1)],
  term ((1054421534548864 : Rat) / 1162780221153193) [(3, 2), (8, 2), (12, 1), (15, 2), (16, 1)],
  term ((1054421534548864 : Rat) / 1162780221153193) [(3, 2), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((-1054421534548864 : Rat) / 1162780221153193) [(3, 4), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 291 for generator 3. -/
theorem ep_Q2_024_partial_03_0291_valid :
    mulPoly ep_Q2_024_coefficient_03_0291
        ep_Q2_024_generator_03_0200_0299 =
      ep_Q2_024_partial_03_0291 := by
  native_decide

/-- Coefficient term 292 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0292 : Poly :=
[
  term ((36326709823775404890386910227678820329661108457314367451 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(3, 2), (13, 1), (15, 1)]
]

/-- Partial product 292 for generator 3. -/
def ep_Q2_024_partial_03_0292 : Poly :=
[
  term ((36326709823775404890386910227678820329661108457314367451 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(2, 2), (3, 2), (13, 1), (15, 1)],
  term ((-36326709823775404890386910227678820329661108457314367451 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(3, 2), (8, 2), (13, 1), (15, 1)],
  term ((-36326709823775404890386910227678820329661108457314367451 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(3, 2), (9, 2), (13, 1), (15, 1)],
  term ((36326709823775404890386910227678820329661108457314367451 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(3, 4), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 292 for generator 3. -/
theorem ep_Q2_024_partial_03_0292_valid :
    mulPoly ep_Q2_024_coefficient_03_0292
        ep_Q2_024_generator_03_0200_0299 =
      ep_Q2_024_partial_03_0292 := by
  native_decide

/-- Coefficient term 293 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0293 : Poly :=
[
  term ((-5187528714443170 : Rat) / 3488340663459579) [(3, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 293 for generator 3. -/
def ep_Q2_024_partial_03_0293 : Poly :=
[
  term ((-5187528714443170 : Rat) / 3488340663459579) [(2, 2), (3, 2), (13, 1), (15, 1), (16, 1)],
  term ((5187528714443170 : Rat) / 3488340663459579) [(3, 2), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((5187528714443170 : Rat) / 3488340663459579) [(3, 2), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-5187528714443170 : Rat) / 3488340663459579) [(3, 4), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 293 for generator 3. -/
theorem ep_Q2_024_partial_03_0293_valid :
    mulPoly ep_Q2_024_coefficient_03_0293
        ep_Q2_024_generator_03_0200_0299 =
      ep_Q2_024_partial_03_0293 := by
  native_decide

/-- Coefficient term 294 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0294 : Poly :=
[
  term ((197073917525224405347438912316263103928 : Rat) / 359912837220743188970008058408861780397) [(3, 2), (13, 2)]
]

/-- Partial product 294 for generator 3. -/
def ep_Q2_024_partial_03_0294 : Poly :=
[
  term ((197073917525224405347438912316263103928 : Rat) / 359912837220743188970008058408861780397) [(2, 2), (3, 2), (13, 2)],
  term ((-197073917525224405347438912316263103928 : Rat) / 359912837220743188970008058408861780397) [(3, 2), (8, 2), (13, 2)],
  term ((-197073917525224405347438912316263103928 : Rat) / 359912837220743188970008058408861780397) [(3, 2), (9, 2), (13, 2)],
  term ((197073917525224405347438912316263103928 : Rat) / 359912837220743188970008058408861780397) [(3, 4), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 294 for generator 3. -/
theorem ep_Q2_024_partial_03_0294_valid :
    mulPoly ep_Q2_024_coefficient_03_0294
        ep_Q2_024_generator_03_0200_0299 =
      ep_Q2_024_partial_03_0294 := by
  native_decide

/-- Coefficient term 295 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0295 : Poly :=
[
  term ((254235174577019432502708099503663666722 : Rat) / 359912837220743188970008058408861780397) [(3, 2), (14, 1)]
]

/-- Partial product 295 for generator 3. -/
def ep_Q2_024_partial_03_0295 : Poly :=
[
  term ((254235174577019432502708099503663666722 : Rat) / 359912837220743188970008058408861780397) [(2, 2), (3, 2), (14, 1)],
  term ((-254235174577019432502708099503663666722 : Rat) / 359912837220743188970008058408861780397) [(3, 2), (8, 2), (14, 1)],
  term ((-254235174577019432502708099503663666722 : Rat) / 359912837220743188970008058408861780397) [(3, 2), (9, 2), (14, 1)],
  term ((254235174577019432502708099503663666722 : Rat) / 359912837220743188970008058408861780397) [(3, 4), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 295 for generator 3. -/
theorem ep_Q2_024_partial_03_0295_valid :
    mulPoly ep_Q2_024_coefficient_03_0295
        ep_Q2_024_generator_03_0200_0299 =
      ep_Q2_024_partial_03_0295 := by
  native_decide

/-- Coefficient term 296 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0296 : Poly :=
[
  term ((408424516433622249313695112340266633602697230933700476949 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(3, 2), (15, 2)]
]

/-- Partial product 296 for generator 3. -/
def ep_Q2_024_partial_03_0296 : Poly :=
[
  term ((408424516433622249313695112340266633602697230933700476949 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(2, 2), (3, 2), (15, 2)],
  term ((-408424516433622249313695112340266633602697230933700476949 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(3, 2), (8, 2), (15, 2)],
  term ((-408424516433622249313695112340266633602697230933700476949 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(3, 2), (9, 2), (15, 2)],
  term ((408424516433622249313695112340266633602697230933700476949 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(3, 4), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 296 for generator 3. -/
theorem ep_Q2_024_partial_03_0296_valid :
    mulPoly ep_Q2_024_coefficient_03_0296
        ep_Q2_024_generator_03_0200_0299 =
      ep_Q2_024_partial_03_0296 := by
  native_decide

/-- Coefficient term 297 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0297 : Poly :=
[
  term ((-44155261447042286 : Rat) / 3488340663459579) [(3, 2), (15, 2), (16, 1)]
]

/-- Partial product 297 for generator 3. -/
def ep_Q2_024_partial_03_0297 : Poly :=
[
  term ((-44155261447042286 : Rat) / 3488340663459579) [(2, 2), (3, 2), (15, 2), (16, 1)],
  term ((44155261447042286 : Rat) / 3488340663459579) [(3, 2), (8, 2), (15, 2), (16, 1)],
  term ((44155261447042286 : Rat) / 3488340663459579) [(3, 2), (9, 2), (15, 2), (16, 1)],
  term ((-44155261447042286 : Rat) / 3488340663459579) [(3, 4), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 297 for generator 3. -/
theorem ep_Q2_024_partial_03_0297_valid :
    mulPoly ep_Q2_024_coefficient_03_0297
        ep_Q2_024_generator_03_0200_0299 =
      ep_Q2_024_partial_03_0297 := by
  native_decide

/-- Coefficient term 298 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0298 : Poly :=
[
  term ((-4193995851290688309546964503438074155436 : Rat) / 1799564186103715944850040292044308901985) [(4, 1)]
]

/-- Partial product 298 for generator 3. -/
def ep_Q2_024_partial_03_0298 : Poly :=
[
  term ((-4193995851290688309546964503438074155436 : Rat) / 1799564186103715944850040292044308901985) [(2, 2), (4, 1)],
  term ((-4193995851290688309546964503438074155436 : Rat) / 1799564186103715944850040292044308901985) [(3, 2), (4, 1)],
  term ((4193995851290688309546964503438074155436 : Rat) / 1799564186103715944850040292044308901985) [(4, 1), (8, 2)],
  term ((4193995851290688309546964503438074155436 : Rat) / 1799564186103715944850040292044308901985) [(4, 1), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 298 for generator 3. -/
theorem ep_Q2_024_partial_03_0298_valid :
    mulPoly ep_Q2_024_coefficient_03_0298
        ep_Q2_024_generator_03_0200_0299 =
      ep_Q2_024_partial_03_0298 := by
  native_decide

/-- Coefficient term 299 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0299 : Poly :=
[
  term ((-23339430700679655250422137903023638228 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (7, 1), (9, 1)]
]

/-- Partial product 299 for generator 3. -/
def ep_Q2_024_partial_03_0299 : Poly :=
[
  term ((-23339430700679655250422137903023638228 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (4, 1), (7, 1), (9, 1)],
  term ((-23339430700679655250422137903023638228 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (4, 1), (7, 1), (9, 1)],
  term ((23339430700679655250422137903023638228 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (7, 1), (8, 2), (9, 1)],
  term ((23339430700679655250422137903023638228 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (7, 1), (9, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 299 for generator 3. -/
theorem ep_Q2_024_partial_03_0299_valid :
    mulPoly ep_Q2_024_coefficient_03_0299
        ep_Q2_024_generator_03_0200_0299 =
      ep_Q2_024_partial_03_0299 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_024_partials_03_0200_0299 : List Poly :=
[
  ep_Q2_024_partial_03_0200,
  ep_Q2_024_partial_03_0201,
  ep_Q2_024_partial_03_0202,
  ep_Q2_024_partial_03_0203,
  ep_Q2_024_partial_03_0204,
  ep_Q2_024_partial_03_0205,
  ep_Q2_024_partial_03_0206,
  ep_Q2_024_partial_03_0207,
  ep_Q2_024_partial_03_0208,
  ep_Q2_024_partial_03_0209,
  ep_Q2_024_partial_03_0210,
  ep_Q2_024_partial_03_0211,
  ep_Q2_024_partial_03_0212,
  ep_Q2_024_partial_03_0213,
  ep_Q2_024_partial_03_0214,
  ep_Q2_024_partial_03_0215,
  ep_Q2_024_partial_03_0216,
  ep_Q2_024_partial_03_0217,
  ep_Q2_024_partial_03_0218,
  ep_Q2_024_partial_03_0219,
  ep_Q2_024_partial_03_0220,
  ep_Q2_024_partial_03_0221,
  ep_Q2_024_partial_03_0222,
  ep_Q2_024_partial_03_0223,
  ep_Q2_024_partial_03_0224,
  ep_Q2_024_partial_03_0225,
  ep_Q2_024_partial_03_0226,
  ep_Q2_024_partial_03_0227,
  ep_Q2_024_partial_03_0228,
  ep_Q2_024_partial_03_0229,
  ep_Q2_024_partial_03_0230,
  ep_Q2_024_partial_03_0231,
  ep_Q2_024_partial_03_0232,
  ep_Q2_024_partial_03_0233,
  ep_Q2_024_partial_03_0234,
  ep_Q2_024_partial_03_0235,
  ep_Q2_024_partial_03_0236,
  ep_Q2_024_partial_03_0237,
  ep_Q2_024_partial_03_0238,
  ep_Q2_024_partial_03_0239,
  ep_Q2_024_partial_03_0240,
  ep_Q2_024_partial_03_0241,
  ep_Q2_024_partial_03_0242,
  ep_Q2_024_partial_03_0243,
  ep_Q2_024_partial_03_0244,
  ep_Q2_024_partial_03_0245,
  ep_Q2_024_partial_03_0246,
  ep_Q2_024_partial_03_0247,
  ep_Q2_024_partial_03_0248,
  ep_Q2_024_partial_03_0249,
  ep_Q2_024_partial_03_0250,
  ep_Q2_024_partial_03_0251,
  ep_Q2_024_partial_03_0252,
  ep_Q2_024_partial_03_0253,
  ep_Q2_024_partial_03_0254,
  ep_Q2_024_partial_03_0255,
  ep_Q2_024_partial_03_0256,
  ep_Q2_024_partial_03_0257,
  ep_Q2_024_partial_03_0258,
  ep_Q2_024_partial_03_0259,
  ep_Q2_024_partial_03_0260,
  ep_Q2_024_partial_03_0261,
  ep_Q2_024_partial_03_0262,
  ep_Q2_024_partial_03_0263,
  ep_Q2_024_partial_03_0264,
  ep_Q2_024_partial_03_0265,
  ep_Q2_024_partial_03_0266,
  ep_Q2_024_partial_03_0267,
  ep_Q2_024_partial_03_0268,
  ep_Q2_024_partial_03_0269,
  ep_Q2_024_partial_03_0270,
  ep_Q2_024_partial_03_0271,
  ep_Q2_024_partial_03_0272,
  ep_Q2_024_partial_03_0273,
  ep_Q2_024_partial_03_0274,
  ep_Q2_024_partial_03_0275,
  ep_Q2_024_partial_03_0276,
  ep_Q2_024_partial_03_0277,
  ep_Q2_024_partial_03_0278,
  ep_Q2_024_partial_03_0279,
  ep_Q2_024_partial_03_0280,
  ep_Q2_024_partial_03_0281,
  ep_Q2_024_partial_03_0282,
  ep_Q2_024_partial_03_0283,
  ep_Q2_024_partial_03_0284,
  ep_Q2_024_partial_03_0285,
  ep_Q2_024_partial_03_0286,
  ep_Q2_024_partial_03_0287,
  ep_Q2_024_partial_03_0288,
  ep_Q2_024_partial_03_0289,
  ep_Q2_024_partial_03_0290,
  ep_Q2_024_partial_03_0291,
  ep_Q2_024_partial_03_0292,
  ep_Q2_024_partial_03_0293,
  ep_Q2_024_partial_03_0294,
  ep_Q2_024_partial_03_0295,
  ep_Q2_024_partial_03_0296,
  ep_Q2_024_partial_03_0297,
  ep_Q2_024_partial_03_0298,
  ep_Q2_024_partial_03_0299
]

/-- Sum of partial products in this block. -/
def ep_Q2_024_block_03_0200_0299 : Poly :=
[
  term ((6544627211193844374324207850933658385537878969261824301 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(2, 1), (3, 2), (11, 1), (12, 1), (15, 1)],
  term ((-448228140819559 : Rat) / 1162780221153193) [(2, 1), (3, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((188722442315693407427840899617497803072 : Rat) / 119970945740247729656669352802953926799) [(2, 1), (3, 2), (11, 1), (13, 1)],
  term ((137190219846581823769882591558384019657388474051565837181 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(2, 1), (3, 2), (11, 1), (15, 1)],
  term ((13092500098671601 : Rat) / 2325560442306386) [(2, 1), (3, 2), (11, 1), (15, 1), (16, 1)],
  term ((-44975123602223741861033454546231653929 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (3, 2), (12, 1)],
  term ((9510999754260881254713232656424688445575676709809539897 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(2, 1), (3, 2), (12, 1), (13, 1), (15, 1)],
  term ((-651692520789483 : Rat) / 1162780221153193) [(2, 1), (3, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-24897008634067285794795130322114482756 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (3, 2), (12, 1), (13, 2)],
  term ((-15030458751725280376487136793198712815572721057832694131 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(2, 1), (3, 2), (12, 1), (15, 2)],
  term ((2556195793603410 : Rat) / 1162780221153193) [(2, 1), (3, 2), (12, 1), (15, 2), (16, 1)],
  term ((-21047616800457164513286695224263497261818406700425024105 : Rat) / 557999371279211891102864058501759538480407853948476828) [(2, 1), (3, 2), (13, 1), (15, 1)],
  term ((-2090188890747827 : Rat) / 3488340663459579) [(2, 1), (3, 2), (13, 1), (15, 1), (16, 1)],
  term ((1165373230691828432735482041440586377306 : Rat) / 1799564186103715944850040292044308901985) [(2, 1), (3, 2), (13, 2)],
  term ((-560642286760300522460041580524949194093 : Rat) / 1199709457402477296566693528029539267990) [(2, 1), (3, 2), (14, 1)],
  term ((208219600235417462847331844009923309593726162121183658633 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(2, 1), (3, 2), (15, 2)],
  term ((2672565420476413 : Rat) / 2325560442306386) [(2, 1), (3, 2), (15, 2), (16, 1)],
  term ((-6544627211193844374324207850933658385537878969261824301 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(2, 1), (8, 2), (11, 1), (12, 1), (15, 1)],
  term ((448228140819559 : Rat) / 1162780221153193) [(2, 1), (8, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-188722442315693407427840899617497803072 : Rat) / 119970945740247729656669352802953926799) [(2, 1), (8, 2), (11, 1), (13, 1)],
  term ((-137190219846581823769882591558384019657388474051565837181 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(2, 1), (8, 2), (11, 1), (15, 1)],
  term ((-13092500098671601 : Rat) / 2325560442306386) [(2, 1), (8, 2), (11, 1), (15, 1), (16, 1)],
  term ((44975123602223741861033454546231653929 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (8, 2), (12, 1)],
  term ((-9510999754260881254713232656424688445575676709809539897 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(2, 1), (8, 2), (12, 1), (13, 1), (15, 1)],
  term ((651692520789483 : Rat) / 1162780221153193) [(2, 1), (8, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((24897008634067285794795130322114482756 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (8, 2), (12, 1), (13, 2)],
  term ((15030458751725280376487136793198712815572721057832694131 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(2, 1), (8, 2), (12, 1), (15, 2)],
  term ((-2556195793603410 : Rat) / 1162780221153193) [(2, 1), (8, 2), (12, 1), (15, 2), (16, 1)],
  term ((21047616800457164513286695224263497261818406700425024105 : Rat) / 557999371279211891102864058501759538480407853948476828) [(2, 1), (8, 2), (13, 1), (15, 1)],
  term ((2090188890747827 : Rat) / 3488340663459579) [(2, 1), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1165373230691828432735482041440586377306 : Rat) / 1799564186103715944850040292044308901985) [(2, 1), (8, 2), (13, 2)],
  term ((560642286760300522460041580524949194093 : Rat) / 1199709457402477296566693528029539267990) [(2, 1), (8, 2), (14, 1)],
  term ((-208219600235417462847331844009923309593726162121183658633 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(2, 1), (8, 2), (15, 2)],
  term ((-2672565420476413 : Rat) / 2325560442306386) [(2, 1), (8, 2), (15, 2), (16, 1)],
  term ((-6544627211193844374324207850933658385537878969261824301 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(2, 1), (9, 2), (11, 1), (12, 1), (15, 1)],
  term ((448228140819559 : Rat) / 1162780221153193) [(2, 1), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-188722442315693407427840899617497803072 : Rat) / 119970945740247729656669352802953926799) [(2, 1), (9, 2), (11, 1), (13, 1)],
  term ((-137190219846581823769882591558384019657388474051565837181 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(2, 1), (9, 2), (11, 1), (15, 1)],
  term ((-13092500098671601 : Rat) / 2325560442306386) [(2, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((44975123602223741861033454546231653929 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (9, 2), (12, 1)],
  term ((-9510999754260881254713232656424688445575676709809539897 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(2, 1), (9, 2), (12, 1), (13, 1), (15, 1)],
  term ((651692520789483 : Rat) / 1162780221153193) [(2, 1), (9, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((24897008634067285794795130322114482756 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (9, 2), (12, 1), (13, 2)],
  term ((15030458751725280376487136793198712815572721057832694131 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(2, 1), (9, 2), (12, 1), (15, 2)],
  term ((-2556195793603410 : Rat) / 1162780221153193) [(2, 1), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((21047616800457164513286695224263497261818406700425024105 : Rat) / 557999371279211891102864058501759538480407853948476828) [(2, 1), (9, 2), (13, 1), (15, 1)],
  term ((2090188890747827 : Rat) / 3488340663459579) [(2, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1165373230691828432735482041440586377306 : Rat) / 1799564186103715944850040292044308901985) [(2, 1), (9, 2), (13, 2)],
  term ((560642286760300522460041580524949194093 : Rat) / 1199709457402477296566693528029539267990) [(2, 1), (9, 2), (14, 1)],
  term ((-208219600235417462847331844009923309593726162121183658633 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(2, 1), (9, 2), (15, 2)],
  term ((-2672565420476413 : Rat) / 2325560442306386) [(2, 1), (9, 2), (15, 2), (16, 1)],
  term ((182481956855019299207446157664365046748 : Rat) / 359912837220743188970008058408861780397) [(2, 2), (3, 1), (4, 1), (9, 1)],
  term ((17821249978825436563697260595591044088 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (3, 1), (4, 1), (13, 1)],
  term ((424161063795057930629132723086609003137058634794396433 : Rat) / 278999685639605945551432029250879769240203926974238414) [(2, 2), (3, 1), (4, 1), (15, 1)],
  term ((-71768591212414 : Rat) / 1162780221153193) [(2, 2), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((-2500133093754034575671568746854548692126 : Rat) / 1799564186103715944850040292044308901985) [(2, 2), (3, 1), (5, 1)],
  term ((436235768289341236967421850993701608432 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (3, 1), (5, 1), (9, 1), (13, 1)],
  term ((-4020828775229646273920745062779027820219088571223109254 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 2), (3, 1), (5, 1), (9, 1), (15, 1)],
  term ((5884563396179416 : Rat) / 3488340663459579) [(2, 2), (3, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((370229701304371273616127062071914241912 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (3, 1), (5, 1), (9, 2)],
  term ((-11411605273029541008032460508186846605890014568048271908 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 2), (3, 1), (5, 1), (13, 1), (15, 1)],
  term ((150661185588720 : Rat) / 1162780221153193) [(2, 2), (3, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((80945856112067634232098240062478093344 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (3, 1), (5, 1), (13, 2)],
  term ((17842303055724083763118711211856783152 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (3, 1), (5, 1), (14, 1)],
  term ((8041427323100157780307091328156563931516252580159861034 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 2), (3, 1), (5, 1), (15, 2)],
  term ((-1054067308495096 : Rat) / 1162780221153193) [(2, 2), (3, 1), (5, 1), (15, 2), (16, 1)],
  term ((-33781967257793617486815206073153137696 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (3, 1), (5, 2), (9, 1)],
  term ((-40440149595023928932116585720924683072 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (3, 1), (5, 2), (13, 1)],
  term ((2173624517752731263429423385757322935670570690431915648 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 2), (3, 1), (5, 2), (15, 1)],
  term ((206941537023232 : Rat) / 1162780221153193) [(2, 2), (3, 1), (5, 2), (15, 1), (16, 1)],
  term ((-1481468177506417179031785085475034735568 : Rat) / 1799564186103715944850040292044308901985) [(2, 2), (3, 1), (8, 1), (9, 1)],
  term ((24897008634067285794795130322114482756 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (3, 1), (8, 1), (12, 1), (13, 1)],
  term ((-550464729340465184219154740052350989658090880526284951 : Rat) / 185999790426403963700954686167253179493469284649492276) [(2, 2), (3, 1), (8, 1), (12, 1), (15, 1)],
  term ((651692520789483 : Rat) / 1162780221153193) [(2, 2), (3, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((60109530803457746714844956809437023648 : Rat) / 359912837220743188970008058408861780397) [(2, 2), (3, 1), (8, 1), (13, 1)],
  term ((32331194976992331728812035004906785732445447232480744223 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(2, 2), (3, 1), (8, 1), (15, 1)],
  term ((-10199593906176821 : Rat) / 6976681326919158) [(2, 2), (3, 1), (8, 1), (15, 1), (16, 1)],
  term ((-1000982346610935217724611529643855417109 : Rat) / 1079738511662229566910024175226585341191) [(2, 2), (3, 1), (9, 1)],
  term ((25684658116189026778536493717385089142 : Rat) / 119970945740247729656669352802953926799) [(2, 2), (3, 1), (9, 1), (12, 1)],
  term ((11091310340086889976887063337008120224 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (3, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((-198745616475118943998092102782769635563595552220534688 : Rat) / 139499842819802972775716014625439884620101963487119207) [(2, 2), (3, 1), (9, 1), (12, 1), (15, 2)],
  term ((527210767274432 : Rat) / 1162780221153193) [(2, 2), (3, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((1712108411655918217728834922540791858411089679157655495 : Rat) / 1673998113837635673308592175505278615441223561845430484) [(2, 2), (3, 1), (9, 1), (13, 1), (15, 1)],
  term ((-5094646267068265 : Rat) / 3488340663459579) [(2, 2), (3, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((815388877581942842408941403533558143676 : Rat) / 1799564186103715944850040292044308901985) [(2, 2), (3, 1), (9, 1), (13, 2)],
  term ((-127117587288509716251354049751831833361 : Rat) / 359912837220743188970008058408861780397) [(2, 2), (3, 1), (9, 1), (14, 1)],
  term ((-333955871046148452268336181265217742995139883845432488747 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(2, 2), (3, 1), (9, 1), (15, 2)],
  term ((23585081757950473 : Rat) / 3488340663459579) [(2, 2), (3, 1), (9, 1), (15, 2), (16, 1)],
  term ((80699759732353167093043025510819982368 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (3, 1), (9, 2), (13, 1)],
  term ((5091805456535845778375342211586282097669456763909390217 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(2, 2), (3, 1), (9, 2), (15, 1)],
  term ((373787112386234 : Rat) / 3488340663459579) [(2, 2), (3, 1), (9, 2), (15, 1), (16, 1)],
  term ((31556266093234973165652571965850210528 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (3, 1), (9, 3)],
  term ((-76474576310683161421068611148154773436 : Rat) / 1799564186103715944850040292044308901985) [(2, 2), (3, 1), (12, 1), (13, 1)],
  term ((3209257923513847776562869360713708288 : Rat) / 39990315246749243218889784267651308933) [(2, 2), (3, 1), (12, 1), (13, 1), (15, 2)],
  term ((-133901730145647480311055423658088066627164029419309381743 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(2, 2), (3, 1), (12, 1), (15, 1)],
  term ((14109749030913719 : Rat) / 6976681326919158) [(2, 2), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((-550224871676112102035615555952179792604942567145793832 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 2), (3, 1), (12, 1), (15, 3)],
  term ((1443384088015008 : Rat) / 1162780221153193) [(2, 2), (3, 1), (12, 1), (15, 3), (16, 1)],
  term ((-24897008634067285794795130322114482756 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (3, 1), (12, 2), (13, 1)],
  term ((550464729340465184219154740052350989658090880526284951 : Rat) / 185999790426403963700954686167253179493469284649492276) [(2, 2), (3, 1), (12, 2), (15, 1)],
  term ((-651692520789483 : Rat) / 1162780221153193) [(2, 2), (3, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1833924092259080024041547913384349366796 : Rat) / 1799564186103715944850040292044308901985) [(2, 2), (3, 1), (13, 1)],
  term ((-43135328846876119407214699700298383881329052598883204313 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(2, 2), (3, 1), (13, 1), (15, 2)],
  term ((212582817171990 : Rat) / 1162780221153193) [(2, 2), (3, 1), (13, 1), (15, 2), (16, 1)],
  term ((-32374617250718488653403865302693490632 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (3, 1), (13, 2), (15, 1)],
  term ((-1217648963717924911224184363882747984154 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (3, 1), (14, 1), (15, 1)],
  term ((-39292236797226992440197220772125994819345850433213325433 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(2, 2), (3, 1), (15, 1)],
  term ((8151765536575891 : Rat) / 6976681326919158) [(2, 2), (3, 1), (15, 1), (16, 1)],
  term ((-4666118582264079879312520807185554929005944364492589137 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 2), (3, 1), (15, 3)],
  term ((7791585621739076 : Rat) / 1162780221153193) [(2, 2), (3, 1), (15, 3), (16, 1)],
  term ((-11058575213206725172557778241829957209036 : Rat) / 5398692558311147834550120876132926705955) [(2, 2), (3, 2)],
  term ((-2930149234713651113130679487801312091016 : Rat) / 1799564186103715944850040292044308901985) [(2, 2), (3, 2), (4, 1)],
  term ((16890983628896808743407603036576568848 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (3, 2), (5, 1), (9, 1)],
  term ((-3082928476586153890712559966648414688 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (3, 2), (5, 1), (13, 1)],
  term ((-3319869963774812909052232810846149293107172472347692792 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 2), (3, 2), (5, 1), (15, 1)],
  term ((1243911894777184 : Rat) / 3488340663459579) [(2, 2), (3, 2), (5, 1), (15, 1), (16, 1)],
  term ((1652695128300478652375073904873736949728 : Rat) / 1799564186103715944850040292044308901985) [(2, 2), (3, 2), (8, 1)],
  term ((-36712442508195667296262437051940901488 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (3, 2), (9, 1), (13, 1)],
  term ((-225792246667296571754346172666409042645220020210494517 : Rat) / 418499528459408918327148043876319653860305890461357621) [(2, 2), (3, 2), (9, 1), (15, 1)],
  term ((-747574224772468 : Rat) / 3488340663459579) [(2, 2), (3, 2), (9, 1), (15, 1), (16, 1)],
  term ((-63112532186469946331305143931700421056 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (3, 2), (9, 2)],
  term ((179900494408894967444133818184926615716 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (3, 2), (12, 1)],
  term ((-22182620680173779953774126674016240448 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (3, 2), (12, 1), (13, 1), (15, 1)],
  term ((397491232950237887996184205565539271127191104441069376 : Rat) / 139499842819802972775716014625439884620101963487119207) [(2, 2), (3, 2), (12, 1), (15, 2)],
  term ((-1054421534548864 : Rat) / 1162780221153193) [(2, 2), (3, 2), (12, 1), (15, 2), (16, 1)],
  term ((36326709823775404890386910227678820329661108457314367451 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(2, 2), (3, 2), (13, 1), (15, 1)],
  term ((-5187528714443170 : Rat) / 3488340663459579) [(2, 2), (3, 2), (13, 1), (15, 1), (16, 1)],
  term ((197073917525224405347438912316263103928 : Rat) / 359912837220743188970008058408861780397) [(2, 2), (3, 2), (13, 2)],
  term ((254235174577019432502708099503663666722 : Rat) / 359912837220743188970008058408861780397) [(2, 2), (3, 2), (14, 1)],
  term ((408424516433622249313695112340266633602697230933700476949 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(2, 2), (3, 2), (15, 2)],
  term ((-44155261447042286 : Rat) / 3488340663459579) [(2, 2), (3, 2), (15, 2), (16, 1)],
  term ((-4193995851290688309546964503438074155436 : Rat) / 1799564186103715944850040292044308901985) [(2, 2), (4, 1)],
  term ((-23339430700679655250422137903023638228 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (4, 1), (7, 1), (9, 1)],
  term ((1070272288403214792732786634564357540 : Rat) / 39990315246749243218889784267651308933) [(2, 2), (8, 2)],
  term ((1070272288403214792732786634564357540 : Rat) / 39990315246749243218889784267651308933) [(2, 2), (9, 2)],
  term ((6544627211193844374324207850933658385537878969261824301 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(2, 3), (11, 1), (12, 1), (15, 1)],
  term ((-448228140819559 : Rat) / 1162780221153193) [(2, 3), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((188722442315693407427840899617497803072 : Rat) / 119970945740247729656669352802953926799) [(2, 3), (11, 1), (13, 1)],
  term ((137190219846581823769882591558384019657388474051565837181 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(2, 3), (11, 1), (15, 1)],
  term ((13092500098671601 : Rat) / 2325560442306386) [(2, 3), (11, 1), (15, 1), (16, 1)],
  term ((-44975123602223741861033454546231653929 : Rat) / 199951576233746216094448921338256544665) [(2, 3), (12, 1)],
  term ((9510999754260881254713232656424688445575676709809539897 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(2, 3), (12, 1), (13, 1), (15, 1)],
  term ((-651692520789483 : Rat) / 1162780221153193) [(2, 3), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-24897008634067285794795130322114482756 : Rat) / 199951576233746216094448921338256544665) [(2, 3), (12, 1), (13, 2)],
  term ((-15030458751725280376487136793198712815572721057832694131 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(2, 3), (12, 1), (15, 2)],
  term ((2556195793603410 : Rat) / 1162780221153193) [(2, 3), (12, 1), (15, 2), (16, 1)],
  term ((-21047616800457164513286695224263497261818406700425024105 : Rat) / 557999371279211891102864058501759538480407853948476828) [(2, 3), (13, 1), (15, 1)],
  term ((-2090188890747827 : Rat) / 3488340663459579) [(2, 3), (13, 1), (15, 1), (16, 1)],
  term ((1165373230691828432735482041440586377306 : Rat) / 1799564186103715944850040292044308901985) [(2, 3), (13, 2)],
  term ((-560642286760300522460041580524949194093 : Rat) / 1199709457402477296566693528029539267990) [(2, 3), (14, 1)],
  term ((208219600235417462847331844009923309593726162121183658633 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(2, 3), (15, 2)],
  term ((2672565420476413 : Rat) / 2325560442306386) [(2, 3), (15, 2), (16, 1)],
  term ((-1070272288403214792732786634564357540 : Rat) / 39990315246749243218889784267651308933) [(2, 4)],
  term ((-182481956855019299207446157664365046748 : Rat) / 359912837220743188970008058408861780397) [(3, 1), (4, 1), (8, 2), (9, 1)],
  term ((-17821249978825436563697260595591044088 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (4, 1), (8, 2), (13, 1)],
  term ((-424161063795057930629132723086609003137058634794396433 : Rat) / 278999685639605945551432029250879769240203926974238414) [(3, 1), (4, 1), (8, 2), (15, 1)],
  term ((71768591212414 : Rat) / 1162780221153193) [(3, 1), (4, 1), (8, 2), (15, 1), (16, 1)],
  term ((-17821249978825436563697260595591044088 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (4, 1), (9, 2), (13, 1)],
  term ((-424161063795057930629132723086609003137058634794396433 : Rat) / 278999685639605945551432029250879769240203926974238414) [(3, 1), (4, 1), (9, 2), (15, 1)],
  term ((71768591212414 : Rat) / 1162780221153193) [(3, 1), (4, 1), (9, 2), (15, 1), (16, 1)],
  term ((-182481956855019299207446157664365046748 : Rat) / 359912837220743188970008058408861780397) [(3, 1), (4, 1), (9, 3)],
  term ((2500133093754034575671568746854548692126 : Rat) / 1799564186103715944850040292044308901985) [(3, 1), (5, 1), (8, 2)],
  term ((-436235768289341236967421850993701608432 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (5, 1), (8, 2), (9, 1), (13, 1)],
  term ((4020828775229646273920745062779027820219088571223109254 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (5, 1), (8, 2), (9, 1), (15, 1)],
  term ((-5884563396179416 : Rat) / 3488340663459579) [(3, 1), (5, 1), (8, 2), (9, 1), (15, 1), (16, 1)],
  term ((-370229701304371273616127062071914241912 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (5, 1), (8, 2), (9, 2)],
  term ((11411605273029541008032460508186846605890014568048271908 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (5, 1), (8, 2), (13, 1), (15, 1)],
  term ((-150661185588720 : Rat) / 1162780221153193) [(3, 1), (5, 1), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((-80945856112067634232098240062478093344 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (5, 1), (8, 2), (13, 2)],
  term ((-17842303055724083763118711211856783152 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (8, 2), (14, 1)],
  term ((-8041427323100157780307091328156563931516252580159861034 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (5, 1), (8, 2), (15, 2)],
  term ((1054067308495096 : Rat) / 1162780221153193) [(3, 1), (5, 1), (8, 2), (15, 2), (16, 1)],
  term ((2500133093754034575671568746854548692126 : Rat) / 1799564186103715944850040292044308901985) [(3, 1), (5, 1), (9, 2)],
  term ((11411605273029541008032460508186846605890014568048271908 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (5, 1), (9, 2), (13, 1), (15, 1)],
  term ((-150661185588720 : Rat) / 1162780221153193) [(3, 1), (5, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-80945856112067634232098240062478093344 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (5, 1), (9, 2), (13, 2)],
  term ((-17842303055724083763118711211856783152 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (9, 2), (14, 1)],
  term ((-8041427323100157780307091328156563931516252580159861034 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (5, 1), (9, 2), (15, 2)],
  term ((1054067308495096 : Rat) / 1162780221153193) [(3, 1), (5, 1), (9, 2), (15, 2), (16, 1)],
  term ((-436235768289341236967421850993701608432 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (5, 1), (9, 3), (13, 1)],
  term ((4020828775229646273920745062779027820219088571223109254 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (5, 1), (9, 3), (15, 1)],
  term ((-5884563396179416 : Rat) / 3488340663459579) [(3, 1), (5, 1), (9, 3), (15, 1), (16, 1)],
  term ((-370229701304371273616127062071914241912 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (5, 1), (9, 4)],
  term ((33781967257793617486815206073153137696 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 2), (8, 2), (9, 1)],
  term ((40440149595023928932116585720924683072 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 2), (8, 2), (13, 1)],
  term ((-2173624517752731263429423385757322935670570690431915648 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (5, 2), (8, 2), (15, 1)],
  term ((-206941537023232 : Rat) / 1162780221153193) [(3, 1), (5, 2), (8, 2), (15, 1), (16, 1)],
  term ((40440149595023928932116585720924683072 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 2), (9, 2), (13, 1)],
  term ((-2173624517752731263429423385757322935670570690431915648 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (5, 2), (9, 2), (15, 1)],
  term ((-206941537023232 : Rat) / 1162780221153193) [(3, 1), (5, 2), (9, 2), (15, 1), (16, 1)],
  term ((33781967257793617486815206073153137696 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 2), (9, 3)],
  term ((-24897008634067285794795130322114482756 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (8, 1), (9, 2), (12, 1), (13, 1)],
  term ((550464729340465184219154740052350989658090880526284951 : Rat) / 185999790426403963700954686167253179493469284649492276) [(3, 1), (8, 1), (9, 2), (12, 1), (15, 1)],
  term ((-651692520789483 : Rat) / 1162780221153193) [(3, 1), (8, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((-60109530803457746714844956809437023648 : Rat) / 359912837220743188970008058408861780397) [(3, 1), (8, 1), (9, 2), (13, 1)],
  term ((-32331194976992331728812035004906785732445447232480744223 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(3, 1), (8, 1), (9, 2), (15, 1)],
  term ((10199593906176821 : Rat) / 6976681326919158) [(3, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((1481468177506417179031785085475034735568 : Rat) / 1799564186103715944850040292044308901985) [(3, 1), (8, 1), (9, 3)],
  term ((1000982346610935217724611529643855417109 : Rat) / 1079738511662229566910024175226585341191) [(3, 1), (8, 2), (9, 1)],
  term ((-25684658116189026778536493717385089142 : Rat) / 119970945740247729656669352802953926799) [(3, 1), (8, 2), (9, 1), (12, 1)],
  term ((-11091310340086889976887063337008120224 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (8, 2), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((198745616475118943998092102782769635563595552220534688 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 1), (8, 2), (9, 1), (12, 1), (15, 2)],
  term ((-527210767274432 : Rat) / 1162780221153193) [(3, 1), (8, 2), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-1712108411655918217728834922540791858411089679157655495 : Rat) / 1673998113837635673308592175505278615441223561845430484) [(3, 1), (8, 2), (9, 1), (13, 1), (15, 1)],
  term ((5094646267068265 : Rat) / 3488340663459579) [(3, 1), (8, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-815388877581942842408941403533558143676 : Rat) / 1799564186103715944850040292044308901985) [(3, 1), (8, 2), (9, 1), (13, 2)],
  term ((127117587288509716251354049751831833361 : Rat) / 359912837220743188970008058408861780397) [(3, 1), (8, 2), (9, 1), (14, 1)],
  term ((333955871046148452268336181265217742995139883845432488747 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(3, 1), (8, 2), (9, 1), (15, 2)],
  term ((-23585081757950473 : Rat) / 3488340663459579) [(3, 1), (8, 2), (9, 1), (15, 2), (16, 1)],
  term ((-80699759732353167093043025510819982368 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (8, 2), (9, 2), (13, 1)],
  term ((-5091805456535845778375342211586282097669456763909390217 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(3, 1), (8, 2), (9, 2), (15, 1)],
  term ((-373787112386234 : Rat) / 3488340663459579) [(3, 1), (8, 2), (9, 2), (15, 1), (16, 1)],
  term ((-31556266093234973165652571965850210528 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (8, 2), (9, 3)],
  term ((76474576310683161421068611148154773436 : Rat) / 1799564186103715944850040292044308901985) [(3, 1), (8, 2), (12, 1), (13, 1)],
  term ((-3209257923513847776562869360713708288 : Rat) / 39990315246749243218889784267651308933) [(3, 1), (8, 2), (12, 1), (13, 1), (15, 2)],
  term ((133901730145647480311055423658088066627164029419309381743 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(3, 1), (8, 2), (12, 1), (15, 1)],
  term ((-14109749030913719 : Rat) / 6976681326919158) [(3, 1), (8, 2), (12, 1), (15, 1), (16, 1)],
  term ((550224871676112102035615555952179792604942567145793832 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (8, 2), (12, 1), (15, 3)],
  term ((-1443384088015008 : Rat) / 1162780221153193) [(3, 1), (8, 2), (12, 1), (15, 3), (16, 1)],
  term ((24897008634067285794795130322114482756 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (8, 2), (12, 2), (13, 1)],
  term ((-550464729340465184219154740052350989658090880526284951 : Rat) / 185999790426403963700954686167253179493469284649492276) [(3, 1), (8, 2), (12, 2), (15, 1)],
  term ((651692520789483 : Rat) / 1162780221153193) [(3, 1), (8, 2), (12, 2), (15, 1), (16, 1)],
  term ((1833924092259080024041547913384349366796 : Rat) / 1799564186103715944850040292044308901985) [(3, 1), (8, 2), (13, 1)],
  term ((43135328846876119407214699700298383881329052598883204313 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(3, 1), (8, 2), (13, 1), (15, 2)],
  term ((-212582817171990 : Rat) / 1162780221153193) [(3, 1), (8, 2), (13, 1), (15, 2), (16, 1)],
  term ((32374617250718488653403865302693490632 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (8, 2), (13, 2), (15, 1)],
  term ((1217648963717924911224184363882747984154 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (8, 2), (14, 1), (15, 1)],
  term ((39292236797226992440197220772125994819345850433213325433 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(3, 1), (8, 2), (15, 1)],
  term ((-8151765536575891 : Rat) / 6976681326919158) [(3, 1), (8, 2), (15, 1), (16, 1)],
  term ((4666118582264079879312520807185554929005944364492589137 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (8, 2), (15, 3)],
  term ((-7791585621739076 : Rat) / 1162780221153193) [(3, 1), (8, 2), (15, 3), (16, 1)],
  term ((1481468177506417179031785085475034735568 : Rat) / 1799564186103715944850040292044308901985) [(3, 1), (8, 3), (9, 1)],
  term ((-24897008634067285794795130322114482756 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (8, 3), (12, 1), (13, 1)],
  term ((550464729340465184219154740052350989658090880526284951 : Rat) / 185999790426403963700954686167253179493469284649492276) [(3, 1), (8, 3), (12, 1), (15, 1)],
  term ((-651692520789483 : Rat) / 1162780221153193) [(3, 1), (8, 3), (12, 1), (15, 1), (16, 1)],
  term ((-60109530803457746714844956809437023648 : Rat) / 359912837220743188970008058408861780397) [(3, 1), (8, 3), (13, 1)],
  term ((-32331194976992331728812035004906785732445447232480744223 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(3, 1), (8, 3), (15, 1)],
  term ((10199593906176821 : Rat) / 6976681326919158) [(3, 1), (8, 3), (15, 1), (16, 1)],
  term ((76474576310683161421068611148154773436 : Rat) / 1799564186103715944850040292044308901985) [(3, 1), (9, 2), (12, 1), (13, 1)],
  term ((-3209257923513847776562869360713708288 : Rat) / 39990315246749243218889784267651308933) [(3, 1), (9, 2), (12, 1), (13, 1), (15, 2)],
  term ((133901730145647480311055423658088066627164029419309381743 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(3, 1), (9, 2), (12, 1), (15, 1)],
  term ((-14109749030913719 : Rat) / 6976681326919158) [(3, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((550224871676112102035615555952179792604942567145793832 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (9, 2), (12, 1), (15, 3)],
  term ((-1443384088015008 : Rat) / 1162780221153193) [(3, 1), (9, 2), (12, 1), (15, 3), (16, 1)],
  term ((24897008634067285794795130322114482756 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (9, 2), (12, 2), (13, 1)],
  term ((-550464729340465184219154740052350989658090880526284951 : Rat) / 185999790426403963700954686167253179493469284649492276) [(3, 1), (9, 2), (12, 2), (15, 1)],
  term ((651692520789483 : Rat) / 1162780221153193) [(3, 1), (9, 2), (12, 2), (15, 1), (16, 1)],
  term ((1833924092259080024041547913384349366796 : Rat) / 1799564186103715944850040292044308901985) [(3, 1), (9, 2), (13, 1)],
  term ((43135328846876119407214699700298383881329052598883204313 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(3, 1), (9, 2), (13, 1), (15, 2)],
  term ((-212582817171990 : Rat) / 1162780221153193) [(3, 1), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((32374617250718488653403865302693490632 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (9, 2), (13, 2), (15, 1)],
  term ((1217648963717924911224184363882747984154 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (9, 2), (14, 1), (15, 1)],
  term ((39292236797226992440197220772125994819345850433213325433 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(3, 1), (9, 2), (15, 1)],
  term ((-8151765536575891 : Rat) / 6976681326919158) [(3, 1), (9, 2), (15, 1), (16, 1)],
  term ((4666118582264079879312520807185554929005944364492589137 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (9, 2), (15, 3)],
  term ((-7791585621739076 : Rat) / 1162780221153193) [(3, 1), (9, 2), (15, 3), (16, 1)],
  term ((1000982346610935217724611529643855417109 : Rat) / 1079738511662229566910024175226585341191) [(3, 1), (9, 3)],
  term ((-25684658116189026778536493717385089142 : Rat) / 119970945740247729656669352802953926799) [(3, 1), (9, 3), (12, 1)],
  term ((-11091310340086889976887063337008120224 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (9, 3), (12, 1), (13, 1), (15, 1)],
  term ((198745616475118943998092102782769635563595552220534688 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 1), (9, 3), (12, 1), (15, 2)],
  term ((-527210767274432 : Rat) / 1162780221153193) [(3, 1), (9, 3), (12, 1), (15, 2), (16, 1)],
  term ((-1712108411655918217728834922540791858411089679157655495 : Rat) / 1673998113837635673308592175505278615441223561845430484) [(3, 1), (9, 3), (13, 1), (15, 1)],
  term ((5094646267068265 : Rat) / 3488340663459579) [(3, 1), (9, 3), (13, 1), (15, 1), (16, 1)],
  term ((-815388877581942842408941403533558143676 : Rat) / 1799564186103715944850040292044308901985) [(3, 1), (9, 3), (13, 2)],
  term ((127117587288509716251354049751831833361 : Rat) / 359912837220743188970008058408861780397) [(3, 1), (9, 3), (14, 1)],
  term ((333955871046148452268336181265217742995139883845432488747 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(3, 1), (9, 3), (15, 2)],
  term ((-23585081757950473 : Rat) / 3488340663459579) [(3, 1), (9, 3), (15, 2), (16, 1)],
  term ((-80699759732353167093043025510819982368 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (9, 4), (13, 1)],
  term ((-5091805456535845778375342211586282097669456763909390217 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(3, 1), (9, 4), (15, 1)],
  term ((-373787112386234 : Rat) / 3488340663459579) [(3, 1), (9, 4), (15, 1), (16, 1)],
  term ((-31556266093234973165652571965850210528 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (9, 5)],
  term ((-4193995851290688309546964503438074155436 : Rat) / 1799564186103715944850040292044308901985) [(3, 2), (4, 1)],
  term ((-23339430700679655250422137903023638228 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (4, 1), (7, 1), (9, 1)],
  term ((2930149234713651113130679487801312091016 : Rat) / 1799564186103715944850040292044308901985) [(3, 2), (4, 1), (8, 2)],
  term ((2930149234713651113130679487801312091016 : Rat) / 1799564186103715944850040292044308901985) [(3, 2), (4, 1), (9, 2)],
  term ((-16890983628896808743407603036576568848 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (5, 1), (8, 2), (9, 1)],
  term ((3082928476586153890712559966648414688 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (5, 1), (8, 2), (13, 1)],
  term ((3319869963774812909052232810846149293107172472347692792 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 2), (5, 1), (8, 2), (15, 1)],
  term ((-1243911894777184 : Rat) / 3488340663459579) [(3, 2), (5, 1), (8, 2), (15, 1), (16, 1)],
  term ((3082928476586153890712559966648414688 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (5, 1), (9, 2), (13, 1)],
  term ((3319869963774812909052232810846149293107172472347692792 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 2), (5, 1), (9, 2), (15, 1)],
  term ((-1243911894777184 : Rat) / 3488340663459579) [(3, 2), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((-16890983628896808743407603036576568848 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (5, 1), (9, 3)],
  term ((-1652695128300478652375073904873736949728 : Rat) / 1799564186103715944850040292044308901985) [(3, 2), (8, 1), (9, 2)],
  term ((10914088454272291175538852046163768941136 : Rat) / 5398692558311147834550120876132926705955) [(3, 2), (8, 2)],
  term ((36712442508195667296262437051940901488 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (8, 2), (9, 1), (13, 1)],
  term ((225792246667296571754346172666409042645220020210494517 : Rat) / 418499528459408918327148043876319653860305890461357621) [(3, 2), (8, 2), (9, 1), (15, 1)],
  term ((747574224772468 : Rat) / 3488340663459579) [(3, 2), (8, 2), (9, 1), (15, 1), (16, 1)],
  term ((63112532186469946331305143931700421056 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (8, 2), (9, 2)],
  term ((-179900494408894967444133818184926615716 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (8, 2), (12, 1)],
  term ((22182620680173779953774126674016240448 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (8, 2), (12, 1), (13, 1), (15, 1)],
  term ((-397491232950237887996184205565539271127191104441069376 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 2), (8, 2), (12, 1), (15, 2)],
  term ((1054421534548864 : Rat) / 1162780221153193) [(3, 2), (8, 2), (12, 1), (15, 2), (16, 1)],
  term ((-36326709823775404890386910227678820329661108457314367451 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(3, 2), (8, 2), (13, 1), (15, 1)],
  term ((5187528714443170 : Rat) / 3488340663459579) [(3, 2), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((-197073917525224405347438912316263103928 : Rat) / 359912837220743188970008058408861780397) [(3, 2), (8, 2), (13, 2)],
  term ((-254235174577019432502708099503663666722 : Rat) / 359912837220743188970008058408861780397) [(3, 2), (8, 2), (14, 1)],
  term ((-408424516433622249313695112340266633602697230933700476949 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(3, 2), (8, 2), (15, 2)],
  term ((44155261447042286 : Rat) / 3488340663459579) [(3, 2), (8, 2), (15, 2), (16, 1)],
  term ((-1652695128300478652375073904873736949728 : Rat) / 1799564186103715944850040292044308901985) [(3, 2), (8, 3)],
  term ((10914088454272291175538852046163768941136 : Rat) / 5398692558311147834550120876132926705955) [(3, 2), (9, 2)],
  term ((-179900494408894967444133818184926615716 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (9, 2), (12, 1)],
  term ((22182620680173779953774126674016240448 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (9, 2), (12, 1), (13, 1), (15, 1)],
  term ((-397491232950237887996184205565539271127191104441069376 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 2), (9, 2), (12, 1), (15, 2)],
  term ((1054421534548864 : Rat) / 1162780221153193) [(3, 2), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((-36326709823775404890386910227678820329661108457314367451 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(3, 2), (9, 2), (13, 1), (15, 1)],
  term ((5187528714443170 : Rat) / 3488340663459579) [(3, 2), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-197073917525224405347438912316263103928 : Rat) / 359912837220743188970008058408861780397) [(3, 2), (9, 2), (13, 2)],
  term ((-254235174577019432502708099503663666722 : Rat) / 359912837220743188970008058408861780397) [(3, 2), (9, 2), (14, 1)],
  term ((-408424516433622249313695112340266633602697230933700476949 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(3, 2), (9, 2), (15, 2)],
  term ((44155261447042286 : Rat) / 3488340663459579) [(3, 2), (9, 2), (15, 2), (16, 1)],
  term ((36712442508195667296262437051940901488 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (9, 3), (13, 1)],
  term ((225792246667296571754346172666409042645220020210494517 : Rat) / 418499528459408918327148043876319653860305890461357621) [(3, 2), (9, 3), (15, 1)],
  term ((747574224772468 : Rat) / 3488340663459579) [(3, 2), (9, 3), (15, 1), (16, 1)],
  term ((63112532186469946331305143931700421056 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (9, 4)],
  term ((182481956855019299207446157664365046748 : Rat) / 359912837220743188970008058408861780397) [(3, 3), (4, 1), (9, 1)],
  term ((17821249978825436563697260595591044088 : Rat) / 199951576233746216094448921338256544665) [(3, 3), (4, 1), (13, 1)],
  term ((424161063795057930629132723086609003137058634794396433 : Rat) / 278999685639605945551432029250879769240203926974238414) [(3, 3), (4, 1), (15, 1)],
  term ((-71768591212414 : Rat) / 1162780221153193) [(3, 3), (4, 1), (15, 1), (16, 1)],
  term ((-2500133093754034575671568746854548692126 : Rat) / 1799564186103715944850040292044308901985) [(3, 3), (5, 1)],
  term ((436235768289341236967421850993701608432 : Rat) / 599854728701238648283346764014769633995) [(3, 3), (5, 1), (9, 1), (13, 1)],
  term ((-4020828775229646273920745062779027820219088571223109254 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 3), (5, 1), (9, 1), (15, 1)],
  term ((5884563396179416 : Rat) / 3488340663459579) [(3, 3), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((370229701304371273616127062071914241912 : Rat) / 599854728701238648283346764014769633995) [(3, 3), (5, 1), (9, 2)],
  term ((-11411605273029541008032460508186846605890014568048271908 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 3), (5, 1), (13, 1), (15, 1)],
  term ((150661185588720 : Rat) / 1162780221153193) [(3, 3), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((80945856112067634232098240062478093344 : Rat) / 599854728701238648283346764014769633995) [(3, 3), (5, 1), (13, 2)],
  term ((17842303055724083763118711211856783152 : Rat) / 199951576233746216094448921338256544665) [(3, 3), (5, 1), (14, 1)],
  term ((8041427323100157780307091328156563931516252580159861034 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 3), (5, 1), (15, 2)],
  term ((-1054067308495096 : Rat) / 1162780221153193) [(3, 3), (5, 1), (15, 2), (16, 1)],
  term ((-33781967257793617486815206073153137696 : Rat) / 199951576233746216094448921338256544665) [(3, 3), (5, 2), (9, 1)],
  term ((-40440149595023928932116585720924683072 : Rat) / 199951576233746216094448921338256544665) [(3, 3), (5, 2), (13, 1)],
  term ((2173624517752731263429423385757322935670570690431915648 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 3), (5, 2), (15, 1)],
  term ((206941537023232 : Rat) / 1162780221153193) [(3, 3), (5, 2), (15, 1), (16, 1)],
  term ((-1481468177506417179031785085475034735568 : Rat) / 1799564186103715944850040292044308901985) [(3, 3), (8, 1), (9, 1)],
  term ((24897008634067285794795130322114482756 : Rat) / 199951576233746216094448921338256544665) [(3, 3), (8, 1), (12, 1), (13, 1)],
  term ((-550464729340465184219154740052350989658090880526284951 : Rat) / 185999790426403963700954686167253179493469284649492276) [(3, 3), (8, 1), (12, 1), (15, 1)],
  term ((651692520789483 : Rat) / 1162780221153193) [(3, 3), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((60109530803457746714844956809437023648 : Rat) / 359912837220743188970008058408861780397) [(3, 3), (8, 1), (13, 1)],
  term ((32331194976992331728812035004906785732445447232480744223 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(3, 3), (8, 1), (15, 1)],
  term ((-10199593906176821 : Rat) / 6976681326919158) [(3, 3), (8, 1), (15, 1), (16, 1)],
  term ((-1000982346610935217724611529643855417109 : Rat) / 1079738511662229566910024175226585341191) [(3, 3), (9, 1)],
  term ((25684658116189026778536493717385089142 : Rat) / 119970945740247729656669352802953926799) [(3, 3), (9, 1), (12, 1)],
  term ((11091310340086889976887063337008120224 : Rat) / 199951576233746216094448921338256544665) [(3, 3), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((-198745616475118943998092102782769635563595552220534688 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 3), (9, 1), (12, 1), (15, 2)],
  term ((527210767274432 : Rat) / 1162780221153193) [(3, 3), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((1712108411655918217728834922540791858411089679157655495 : Rat) / 1673998113837635673308592175505278615441223561845430484) [(3, 3), (9, 1), (13, 1), (15, 1)],
  term ((-5094646267068265 : Rat) / 3488340663459579) [(3, 3), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((815388877581942842408941403533558143676 : Rat) / 1799564186103715944850040292044308901985) [(3, 3), (9, 1), (13, 2)],
  term ((-127117587288509716251354049751831833361 : Rat) / 359912837220743188970008058408861780397) [(3, 3), (9, 1), (14, 1)],
  term ((-333955871046148452268336181265217742995139883845432488747 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(3, 3), (9, 1), (15, 2)],
  term ((23585081757950473 : Rat) / 3488340663459579) [(3, 3), (9, 1), (15, 2), (16, 1)],
  term ((80699759732353167093043025510819982368 : Rat) / 599854728701238648283346764014769633995) [(3, 3), (9, 2), (13, 1)],
  term ((5091805456535845778375342211586282097669456763909390217 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(3, 3), (9, 2), (15, 1)],
  term ((373787112386234 : Rat) / 3488340663459579) [(3, 3), (9, 2), (15, 1), (16, 1)],
  term ((31556266093234973165652571965850210528 : Rat) / 599854728701238648283346764014769633995) [(3, 3), (9, 3)],
  term ((-76474576310683161421068611148154773436 : Rat) / 1799564186103715944850040292044308901985) [(3, 3), (12, 1), (13, 1)],
  term ((3209257923513847776562869360713708288 : Rat) / 39990315246749243218889784267651308933) [(3, 3), (12, 1), (13, 1), (15, 2)],
  term ((-133901730145647480311055423658088066627164029419309381743 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(3, 3), (12, 1), (15, 1)],
  term ((14109749030913719 : Rat) / 6976681326919158) [(3, 3), (12, 1), (15, 1), (16, 1)],
  term ((-550224871676112102035615555952179792604942567145793832 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 3), (12, 1), (15, 3)],
  term ((1443384088015008 : Rat) / 1162780221153193) [(3, 3), (12, 1), (15, 3), (16, 1)],
  term ((-24897008634067285794795130322114482756 : Rat) / 199951576233746216094448921338256544665) [(3, 3), (12, 2), (13, 1)],
  term ((550464729340465184219154740052350989658090880526284951 : Rat) / 185999790426403963700954686167253179493469284649492276) [(3, 3), (12, 2), (15, 1)],
  term ((-651692520789483 : Rat) / 1162780221153193) [(3, 3), (12, 2), (15, 1), (16, 1)],
  term ((-1833924092259080024041547913384349366796 : Rat) / 1799564186103715944850040292044308901985) [(3, 3), (13, 1)],
  term ((-43135328846876119407214699700298383881329052598883204313 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(3, 3), (13, 1), (15, 2)],
  term ((212582817171990 : Rat) / 1162780221153193) [(3, 3), (13, 1), (15, 2), (16, 1)],
  term ((-32374617250718488653403865302693490632 : Rat) / 599854728701238648283346764014769633995) [(3, 3), (13, 2), (15, 1)],
  term ((-1217648963717924911224184363882747984154 : Rat) / 599854728701238648283346764014769633995) [(3, 3), (14, 1), (15, 1)],
  term ((-39292236797226992440197220772125994819345850433213325433 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(3, 3), (15, 1)],
  term ((8151765536575891 : Rat) / 6976681326919158) [(3, 3), (15, 1), (16, 1)],
  term ((-4666118582264079879312520807185554929005944364492589137 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 3), (15, 3)],
  term ((7791585621739076 : Rat) / 1162780221153193) [(3, 3), (15, 3), (16, 1)],
  term ((-10914088454272291175538852046163768941136 : Rat) / 5398692558311147834550120876132926705955) [(3, 4)],
  term ((-2930149234713651113130679487801312091016 : Rat) / 1799564186103715944850040292044308901985) [(3, 4), (4, 1)],
  term ((16890983628896808743407603036576568848 : Rat) / 599854728701238648283346764014769633995) [(3, 4), (5, 1), (9, 1)],
  term ((-3082928476586153890712559966648414688 : Rat) / 599854728701238648283346764014769633995) [(3, 4), (5, 1), (13, 1)],
  term ((-3319869963774812909052232810846149293107172472347692792 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 4), (5, 1), (15, 1)],
  term ((1243911894777184 : Rat) / 3488340663459579) [(3, 4), (5, 1), (15, 1), (16, 1)],
  term ((1652695128300478652375073904873736949728 : Rat) / 1799564186103715944850040292044308901985) [(3, 4), (8, 1)],
  term ((-36712442508195667296262437051940901488 : Rat) / 599854728701238648283346764014769633995) [(3, 4), (9, 1), (13, 1)],
  term ((-225792246667296571754346172666409042645220020210494517 : Rat) / 418499528459408918327148043876319653860305890461357621) [(3, 4), (9, 1), (15, 1)],
  term ((-747574224772468 : Rat) / 3488340663459579) [(3, 4), (9, 1), (15, 1), (16, 1)],
  term ((-63112532186469946331305143931700421056 : Rat) / 599854728701238648283346764014769633995) [(3, 4), (9, 2)],
  term ((179900494408894967444133818184926615716 : Rat) / 599854728701238648283346764014769633995) [(3, 4), (12, 1)],
  term ((-22182620680173779953774126674016240448 : Rat) / 199951576233746216094448921338256544665) [(3, 4), (12, 1), (13, 1), (15, 1)],
  term ((397491232950237887996184205565539271127191104441069376 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 4), (12, 1), (15, 2)],
  term ((-1054421534548864 : Rat) / 1162780221153193) [(3, 4), (12, 1), (15, 2), (16, 1)],
  term ((36326709823775404890386910227678820329661108457314367451 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(3, 4), (13, 1), (15, 1)],
  term ((-5187528714443170 : Rat) / 3488340663459579) [(3, 4), (13, 1), (15, 1), (16, 1)],
  term ((197073917525224405347438912316263103928 : Rat) / 359912837220743188970008058408861780397) [(3, 4), (13, 2)],
  term ((254235174577019432502708099503663666722 : Rat) / 359912837220743188970008058408861780397) [(3, 4), (14, 1)],
  term ((408424516433622249313695112340266633602697230933700476949 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(3, 4), (15, 2)],
  term ((-44155261447042286 : Rat) / 3488340663459579) [(3, 4), (15, 2), (16, 1)],
  term ((23339430700679655250422137903023638228 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (7, 1), (8, 2), (9, 1)],
  term ((23339430700679655250422137903023638228 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (7, 1), (9, 3)],
  term ((4193995851290688309546964503438074155436 : Rat) / 1799564186103715944850040292044308901985) [(4, 1), (8, 2)],
  term ((4193995851290688309546964503438074155436 : Rat) / 1799564186103715944850040292044308901985) [(4, 1), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 3, terms 200 through 299. -/
theorem ep_Q2_024_block_03_0200_0299_valid :
    checkProductSumEq ep_Q2_024_partials_03_0200_0299
      ep_Q2_024_block_03_0200_0299 = true := by
  native_decide

end EpQ2024TermShards

end Patterns

end EndpointCertificate

end Problem97
