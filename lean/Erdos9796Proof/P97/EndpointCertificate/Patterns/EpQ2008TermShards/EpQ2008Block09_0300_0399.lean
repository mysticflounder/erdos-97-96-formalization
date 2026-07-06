/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_008, term block 9:300-399

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_008`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2008TermShards

/-- Generator polynomial 9 for endpoint certificate `ep_Q2_008`. -/
def ep_Q2_008_generator_09_0300_0399 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(2, 1)]
]

/-- Coefficient term 300 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0300 : Poly :=
[
  term ((-18803410410932496985892709866427557920350 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 300 for generator 9. -/
def ep_Q2_008_partial_09_0300 : Poly :=
[
  term ((18803410410932496985892709866427557920350 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-37606820821864993971785419732855115840700 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (9, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 300 for generator 9. -/
theorem ep_Q2_008_partial_09_0300_valid :
    mulPoly ep_Q2_008_coefficient_09_0300
        ep_Q2_008_generator_09_0300_0399 =
      ep_Q2_008_partial_09_0300 := by
  native_decide

/-- Coefficient term 301 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0301 : Poly :=
[
  term ((39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (9, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 301 for generator 9. -/
def ep_Q2_008_partial_09_0301 : Poly :=
[
  term ((-39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((78173987841078575882094280687715020800 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (9, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 301 for generator 9. -/
theorem ep_Q2_008_partial_09_0301_valid :
    mulPoly ep_Q2_008_coefficient_09_0301
        ep_Q2_008_generator_09_0300_0399 =
      ep_Q2_008_partial_09_0301 := by
  native_decide

/-- Coefficient term 302 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0302 : Poly :=
[
  term ((11083799995251317146644258726299583271125 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 302 for generator 9. -/
def ep_Q2_008_partial_09_0302 : Poly :=
[
  term ((-11083799995251317146644258726299583271125 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (9, 1), (15, 1), (16, 1)],
  term ((11083799995251317146644258726299583271125 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 302 for generator 9. -/
theorem ep_Q2_008_partial_09_0302_valid :
    mulPoly ep_Q2_008_coefficient_09_0302
        ep_Q2_008_generator_09_0300_0399 =
      ep_Q2_008_partial_09_0302 := by
  native_decide

/-- Coefficient term 303 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0303 : Poly :=
[
  term ((-14423181750135707291662327260040033405200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (9, 1), (15, 3), (16, 1)]
]

/-- Partial product 303 for generator 9. -/
def ep_Q2_008_partial_09_0303 : Poly :=
[
  term ((14423181750135707291662327260040033405200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (9, 1), (15, 3), (16, 1)],
  term ((-28846363500271414583324654520080066810400 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 303 for generator 9. -/
theorem ep_Q2_008_partial_09_0303_valid :
    mulPoly ep_Q2_008_coefficient_09_0303
        ep_Q2_008_generator_09_0300_0399 =
      ep_Q2_008_partial_09_0303 := by
  native_decide

/-- Coefficient term 304 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0304 : Poly :=
[
  term ((-10418969850877602000 : Rat) / 692956453614176359) [(2, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 304 for generator 9. -/
def ep_Q2_008_partial_09_0304 : Poly :=
[
  term ((10418969850877602000 : Rat) / 692956453614176359) [(2, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-20837939701755204000 : Rat) / 692956453614176359) [(2, 2), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 304 for generator 9. -/
theorem ep_Q2_008_partial_09_0304_valid :
    mulPoly ep_Q2_008_coefficient_09_0304
        ep_Q2_008_generator_09_0300_0399 =
      ep_Q2_008_partial_09_0304 := by
  native_decide

/-- Coefficient term 305 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0305 : Poly :=
[
  term ((-2894158291910445000 : Rat) / 692956453614176359) [(2, 1), (10, 1), (12, 1), (16, 1)]
]

/-- Partial product 305 for generator 9. -/
def ep_Q2_008_partial_09_0305 : Poly :=
[
  term ((2894158291910445000 : Rat) / 692956453614176359) [(2, 1), (10, 1), (12, 1), (16, 1)],
  term ((-5788316583820890000 : Rat) / 692956453614176359) [(2, 2), (10, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 305 for generator 9. -/
theorem ep_Q2_008_partial_09_0305_valid :
    mulPoly ep_Q2_008_coefficient_09_0305
        ep_Q2_008_generator_09_0300_0399 =
      ep_Q2_008_partial_09_0305 := by
  native_decide

/-- Coefficient term 306 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0306 : Poly :=
[
  term ((-4007784707742375 : Rat) / 692956453614176359) [(2, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 306 for generator 9. -/
def ep_Q2_008_partial_09_0306 : Poly :=
[
  term ((4007784707742375 : Rat) / 692956453614176359) [(2, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-8015569415484750 : Rat) / 692956453614176359) [(2, 2), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 306 for generator 9. -/
theorem ep_Q2_008_partial_09_0306_valid :
    mulPoly ep_Q2_008_coefficient_09_0306
        ep_Q2_008_generator_09_0300_0399 =
      ep_Q2_008_partial_09_0306 := by
  native_decide

/-- Coefficient term 307 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0307 : Poly :=
[
  term ((1033772499319014877156923414058624213092000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (10, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 307 for generator 9. -/
def ep_Q2_008_partial_09_0307 : Poly :=
[
  term ((-1033772499319014877156923414058624213092000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((2067544998638029754313846828117248426184000 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (10, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 307 for generator 9. -/
theorem ep_Q2_008_partial_09_0307_valid :
    mulPoly ep_Q2_008_coefficient_09_0307
        ep_Q2_008_generator_09_0300_0399 =
      ep_Q2_008_partial_09_0307 := by
  native_decide

/-- Coefficient term 308 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0308 : Poly :=
[
  term ((304220396304977599805193967251380198400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (10, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 308 for generator 9. -/
def ep_Q2_008_partial_09_0308 : Poly :=
[
  term ((-304220396304977599805193967251380198400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((608440792609955199610387934502760396800 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (10, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 308 for generator 9. -/
theorem ep_Q2_008_partial_09_0308_valid :
    mulPoly ep_Q2_008_coefficient_09_0308
        ep_Q2_008_generator_09_0300_0399 =
      ep_Q2_008_partial_09_0308 := by
  native_decide

/-- Coefficient term 309 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0309 : Poly :=
[
  term ((-608710570930428358735024014798190779990075 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 309 for generator 9. -/
def ep_Q2_008_partial_09_0309 : Poly :=
[
  term ((608710570930428358735024014798190779990075 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (10, 1), (15, 2), (16, 1)],
  term ((-608710570930428358735024014798190779990075 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 309 for generator 9. -/
theorem ep_Q2_008_partial_09_0309_valid :
    mulPoly ep_Q2_008_coefficient_09_0309
        ep_Q2_008_generator_09_0300_0399 =
      ep_Q2_008_partial_09_0309 := by
  native_decide

/-- Coefficient term 310 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0310 : Poly :=
[
  term ((1832966918209948500 : Rat) / 692956453614176359) [(2, 1), (10, 1), (16, 1)]
]

/-- Partial product 310 for generator 9. -/
def ep_Q2_008_partial_09_0310 : Poly :=
[
  term ((-1832966918209948500 : Rat) / 692956453614176359) [(2, 1), (10, 1), (16, 1)],
  term ((3665933836419897000 : Rat) / 692956453614176359) [(2, 2), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 310 for generator 9. -/
theorem ep_Q2_008_partial_09_0310_valid :
    mulPoly ep_Q2_008_coefficient_09_0310
        ep_Q2_008_generator_09_0300_0399 =
      ep_Q2_008_partial_09_0310 := by
  native_decide

/-- Coefficient term 311 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0311 : Poly :=
[
  term ((-5034935797694107436918514247400820297600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 311 for generator 9. -/
def ep_Q2_008_partial_09_0311 : Poly :=
[
  term ((5034935797694107436918514247400820297600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-10069871595388214873837028494801640595200 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 311 for generator 9. -/
theorem ep_Q2_008_partial_09_0311_valid :
    mulPoly ep_Q2_008_coefficient_09_0311
        ep_Q2_008_generator_09_0300_0399 =
      ep_Q2_008_partial_09_0311 := by
  native_decide

/-- Coefficient term 312 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0312 : Poly :=
[
  term ((-4764553713739224000 : Rat) / 692956453614176359) [(2, 1), (11, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 312 for generator 9. -/
def ep_Q2_008_partial_09_0312 : Poly :=
[
  term ((4764553713739224000 : Rat) / 692956453614176359) [(2, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-9529107427478448000 : Rat) / 692956453614176359) [(2, 2), (11, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 312 for generator 9. -/
theorem ep_Q2_008_partial_09_0312_valid :
    mulPoly ep_Q2_008_coefficient_09_0312
        ep_Q2_008_generator_09_0300_0399 =
      ep_Q2_008_partial_09_0312 := by
  native_decide

/-- Coefficient term 313 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0313 : Poly :=
[
  term ((-3781377317970013320911736094153706481736800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 313 for generator 9. -/
def ep_Q2_008_partial_09_0313 : Poly :=
[
  term ((3781377317970013320911736094153706481736800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-7562754635940026641823472188307412963473600 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 313 for generator 9. -/
theorem ep_Q2_008_partial_09_0313_valid :
    mulPoly ep_Q2_008_coefficient_09_0313
        ep_Q2_008_generator_09_0300_0399 =
      ep_Q2_008_partial_09_0313 := by
  native_decide

/-- Coefficient term 314 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0314 : Poly :=
[
  term ((-2563812429855424381633962217953841228800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (11, 1), (12, 1), (13, 3), (15, 2), (16, 1)]
]

/-- Partial product 314 for generator 9. -/
def ep_Q2_008_partial_09_0314 : Poly :=
[
  term ((2563812429855424381633962217953841228800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (11, 1), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((-5127624859710848763267924435907682457600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (11, 1), (12, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 314 for generator 9. -/
theorem ep_Q2_008_partial_09_0314_valid :
    mulPoly ep_Q2_008_coefficient_09_0314
        ep_Q2_008_generator_09_0300_0399 =
      ep_Q2_008_partial_09_0314 := by
  native_decide

/-- Coefficient term 315 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0315 : Poly :=
[
  term ((190203111777822410034369517077194951080125 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 315 for generator 9. -/
def ep_Q2_008_partial_09_0315 : Poly :=
[
  term ((-190203111777822410034369517077194951080125 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((190203111777822410034369517077194951080125 : Rat) / 168707601851329515375740828258983054697998) [(2, 2), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 315 for generator 9. -/
theorem ep_Q2_008_partial_09_0315_valid :
    mulPoly ep_Q2_008_coefficient_09_0315
        ep_Q2_008_generator_09_0300_0399 =
      ep_Q2_008_partial_09_0315 := by
  native_decide

/-- Coefficient term 316 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0316 : Poly :=
[
  term ((-773442834126217199712017935279189131902400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 316 for generator 9. -/
def ep_Q2_008_partial_09_0316 : Poly :=
[
  term ((773442834126217199712017935279189131902400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1546885668252434399424035870558378263804800 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 316 for generator 9. -/
theorem ep_Q2_008_partial_09_0316_valid :
    mulPoly ep_Q2_008_coefficient_09_0316
        ep_Q2_008_generator_09_0300_0399 =
      ep_Q2_008_partial_09_0316 := by
  native_decide

/-- Coefficient term 317 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0317 : Poly :=
[
  term ((4157495168227792917037311132093583468800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (11, 1), (13, 1), (15, 4), (16, 1)]
]

/-- Partial product 317 for generator 9. -/
def ep_Q2_008_partial_09_0317 : Poly :=
[
  term ((-4157495168227792917037311132093583468800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (11, 1), (13, 1), (15, 4), (16, 1)],
  term ((8314990336455585834074622264187166937600 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (11, 1), (13, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 317 for generator 9. -/
theorem ep_Q2_008_partial_09_0317_valid :
    mulPoly ep_Q2_008_coefficient_09_0317
        ep_Q2_008_generator_09_0300_0399 =
      ep_Q2_008_partial_09_0317 := by
  native_decide

/-- Coefficient term 318 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0318 : Poly :=
[
  term ((3573415285304418000 : Rat) / 692956453614176359) [(2, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 318 for generator 9. -/
def ep_Q2_008_partial_09_0318 : Poly :=
[
  term ((-3573415285304418000 : Rat) / 692956453614176359) [(2, 1), (11, 1), (13, 1), (16, 1)],
  term ((7146830570608836000 : Rat) / 692956453614176359) [(2, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 318 for generator 9. -/
theorem ep_Q2_008_partial_09_0318_valid :
    mulPoly ep_Q2_008_coefficient_09_0318
        ep_Q2_008_generator_09_0300_0399 =
      ep_Q2_008_partial_09_0318 := by
  native_decide

/-- Coefficient term 319 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0319 : Poly :=
[
  term ((-136418734184946963260620674990683630300400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 319 for generator 9. -/
def ep_Q2_008_partial_09_0319 : Poly :=
[
  term ((136418734184946963260620674990683630300400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-272837468369893926521241349981367260600800 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 319 for generator 9. -/
theorem ep_Q2_008_partial_09_0319_valid :
    mulPoly ep_Q2_008_coefficient_09_0319
        ep_Q2_008_generator_09_0300_0399 =
      ep_Q2_008_partial_09_0319 := by
  native_decide

/-- Coefficient term 320 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0320 : Poly :=
[
  term ((2884701503139867449302812529410960668625600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (11, 1), (13, 2), (15, 3), (16, 1)]
]

/-- Partial product 320 for generator 9. -/
def ep_Q2_008_partial_09_0320 : Poly :=
[
  term ((-2884701503139867449302812529410960668625600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (11, 1), (13, 2), (15, 3), (16, 1)],
  term ((5769403006279734898605625058821921337251200 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (11, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 320 for generator 9. -/
theorem ep_Q2_008_partial_09_0320_valid :
    mulPoly ep_Q2_008_coefficient_09_0320
        ep_Q2_008_generator_09_0300_0399 =
      ep_Q2_008_partial_09_0320 := by
  native_decide

/-- Coefficient term 321 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0321 : Poly :=
[
  term ((-98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (11, 1), (13, 3), (15, 2), (16, 1)]
]

/-- Partial product 321 for generator 9. -/
def ep_Q2_008_partial_09_0321 : Poly :=
[
  term ((98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((-197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (11, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 321 for generator 9. -/
theorem ep_Q2_008_partial_09_0321_valid :
    mulPoly ep_Q2_008_coefficient_09_0321
        ep_Q2_008_generator_09_0300_0399 =
      ep_Q2_008_partial_09_0321 := by
  native_decide

/-- Coefficient term 322 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0322 : Poly :=
[
  term ((1972163407581095678179970936887570176000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (11, 1), (13, 3), (15, 4), (16, 1)]
]

/-- Partial product 322 for generator 9. -/
def ep_Q2_008_partial_09_0322 : Poly :=
[
  term ((-1972163407581095678179970936887570176000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (11, 1), (13, 3), (15, 4), (16, 1)],
  term ((3944326815162191356359941873775140352000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (11, 1), (13, 3), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 322 for generator 9. -/
theorem ep_Q2_008_partial_09_0322_valid :
    mulPoly ep_Q2_008_coefficient_09_0322
        ep_Q2_008_generator_09_0300_0399 =
      ep_Q2_008_partial_09_0322 := by
  native_decide

/-- Coefficient term 323 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0323 : Poly :=
[
  term ((37116077819898225663389872120562644227750 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 323 for generator 9. -/
def ep_Q2_008_partial_09_0323 : Poly :=
[
  term ((-37116077819898225663389872120562644227750 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (11, 1), (15, 1), (16, 1)],
  term ((74232155639796451326779744241125288455500 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 323 for generator 9. -/
theorem ep_Q2_008_partial_09_0323_valid :
    mulPoly ep_Q2_008_coefficient_09_0323
        ep_Q2_008_generator_09_0300_0399 =
      ep_Q2_008_partial_09_0323 := by
  native_decide

/-- Coefficient term 324 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0324 : Poly :=
[
  term ((-9144362709899146948734428935040000278875 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (11, 1), (15, 3), (16, 1)]
]

/-- Partial product 324 for generator 9. -/
def ep_Q2_008_partial_09_0324 : Poly :=
[
  term ((9144362709899146948734428935040000278875 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (11, 1), (15, 3), (16, 1)],
  term ((-9144362709899146948734428935040000278875 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 324 for generator 9. -/
theorem ep_Q2_008_partial_09_0324_valid :
    mulPoly ep_Q2_008_coefficient_09_0324
        ep_Q2_008_generator_09_0300_0399 =
      ep_Q2_008_partial_09_0324 := by
  native_decide

/-- Coefficient term 325 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0325 : Poly :=
[
  term ((5901778635813679521030208707116750563511985 : Rat) / 674830407405318061502963313035932218791992) [(2, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 325 for generator 9. -/
def ep_Q2_008_partial_09_0325 : Poly :=
[
  term ((-5901778635813679521030208707116750563511985 : Rat) / 674830407405318061502963313035932218791992) [(2, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((5901778635813679521030208707116750563511985 : Rat) / 337415203702659030751481656517966109395996) [(2, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 325 for generator 9. -/
theorem ep_Q2_008_partial_09_0325_valid :
    mulPoly ep_Q2_008_coefficient_09_0325
        ep_Q2_008_generator_09_0300_0399 =
      ep_Q2_008_partial_09_0325 := by
  native_decide

/-- Coefficient term 326 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0326 : Poly :=
[
  term ((1957025244783008681222921652159444038400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (12, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 326 for generator 9. -/
def ep_Q2_008_partial_09_0326 : Poly :=
[
  term ((-1957025244783008681222921652159444038400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((3914050489566017362445843304318888076800 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (12, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 326 for generator 9. -/
theorem ep_Q2_008_partial_09_0326_valid :
    mulPoly ep_Q2_008_coefficient_09_0326
        ep_Q2_008_generator_09_0300_0399 =
      ep_Q2_008_partial_09_0326 := by
  native_decide

/-- Coefficient term 327 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0327 : Poly :=
[
  term ((-47828072579908271067309536364465423936000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (12, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 327 for generator 9. -/
def ep_Q2_008_partial_09_0327 : Poly :=
[
  term ((47828072579908271067309536364465423936000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-95656145159816542134619072728930847872000 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (12, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 327 for generator 9. -/
theorem ep_Q2_008_partial_09_0327_valid :
    mulPoly ep_Q2_008_coefficient_09_0327
        ep_Q2_008_generator_09_0300_0399 =
      ep_Q2_008_partial_09_0327 := by
  native_decide

/-- Coefficient term 328 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0328 : Poly :=
[
  term ((321493902582049527785834440448537089002150 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 328 for generator 9. -/
def ep_Q2_008_partial_09_0328 : Poly :=
[
  term ((-321493902582049527785834440448537089002150 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (12, 1), (15, 2), (16, 1)],
  term ((642987805164099055571668880897074178004300 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 328 for generator 9. -/
theorem ep_Q2_008_partial_09_0328_valid :
    mulPoly ep_Q2_008_coefficient_09_0328
        ep_Q2_008_generator_09_0300_0399 =
      ep_Q2_008_partial_09_0328 := by
  native_decide

/-- Coefficient term 329 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0329 : Poly :=
[
  term ((-3529179131355380613 : Rat) / 5543651628913410872) [(2, 1), (12, 1), (16, 1)]
]

/-- Partial product 329 for generator 9. -/
def ep_Q2_008_partial_09_0329 : Poly :=
[
  term ((3529179131355380613 : Rat) / 5543651628913410872) [(2, 1), (12, 1), (16, 1)],
  term ((-3529179131355380613 : Rat) / 2771825814456705436) [(2, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 329 for generator 9. -/
theorem ep_Q2_008_partial_09_0329_valid :
    mulPoly ep_Q2_008_coefficient_09_0329
        ep_Q2_008_generator_09_0300_0399 =
      ep_Q2_008_partial_09_0329 := by
  native_decide

/-- Coefficient term 330 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0330 : Poly :=
[
  term ((-2423628158338250340915715481932147009247451 : Rat) / 1349660814810636123005926626071864437583984) [(2, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 330 for generator 9. -/
def ep_Q2_008_partial_09_0330 : Poly :=
[
  term ((2423628158338250340915715481932147009247451 : Rat) / 1349660814810636123005926626071864437583984) [(2, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2423628158338250340915715481932147009247451 : Rat) / 674830407405318061502963313035932218791992) [(2, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 330 for generator 9. -/
theorem ep_Q2_008_partial_09_0330_valid :
    mulPoly ep_Q2_008_coefficient_09_0330
        ep_Q2_008_generator_09_0300_0399 =
      ep_Q2_008_partial_09_0330 := by
  native_decide

/-- Coefficient term 331 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0331 : Poly :=
[
  term ((-2695190269413799169800112585706713376692913 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 331 for generator 9. -/
def ep_Q2_008_partial_09_0331 : Poly :=
[
  term ((2695190269413799169800112585706713376692913 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (13, 1), (15, 3), (16, 1)],
  term ((-2695190269413799169800112585706713376692913 : Rat) / 168707601851329515375740828258983054697998) [(2, 2), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 331 for generator 9. -/
theorem ep_Q2_008_partial_09_0331_valid :
    mulPoly ep_Q2_008_coefficient_09_0331
        ep_Q2_008_generator_09_0300_0399 =
      ep_Q2_008_partial_09_0331 := by
  native_decide

/-- Coefficient term 332 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0332 : Poly :=
[
  term ((-2566156707349755598848410333874300700800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 332 for generator 9. -/
def ep_Q2_008_partial_09_0332 : Poly :=
[
  term ((2566156707349755598848410333874300700800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (13, 2), (15, 2), (16, 1)],
  term ((-5132313414699511197696820667748601401600 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 332 for generator 9. -/
theorem ep_Q2_008_partial_09_0332_valid :
    mulPoly ep_Q2_008_coefficient_09_0332
        ep_Q2_008_generator_09_0300_0399 =
      ep_Q2_008_partial_09_0332 := by
  native_decide

/-- Coefficient term 333 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0333 : Poly :=
[
  term ((34679115264387073690690337739212889177600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (13, 2), (15, 4), (16, 1)]
]

/-- Partial product 333 for generator 9. -/
def ep_Q2_008_partial_09_0333 : Poly :=
[
  term ((-34679115264387073690690337739212889177600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (13, 2), (15, 4), (16, 1)],
  term ((69358230528774147381380675478425778355200 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (13, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 333 for generator 9. -/
theorem ep_Q2_008_partial_09_0333_valid :
    mulPoly ep_Q2_008_coefficient_09_0333
        ep_Q2_008_generator_09_0300_0399 =
      ep_Q2_008_partial_09_0333 := by
  native_decide

/-- Coefficient term 334 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0334 : Poly :=
[
  term ((639075239394064851664757191995962577125045 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (15, 2), (16, 1)]
]

/-- Partial product 334 for generator 9. -/
def ep_Q2_008_partial_09_0334 : Poly :=
[
  term ((-639075239394064851664757191995962577125045 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (15, 2), (16, 1)],
  term ((639075239394064851664757191995962577125045 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 334 for generator 9. -/
theorem ep_Q2_008_partial_09_0334_valid :
    mulPoly ep_Q2_008_coefficient_09_0334
        ep_Q2_008_generator_09_0300_0399 =
      ep_Q2_008_partial_09_0334 := by
  native_decide

/-- Coefficient term 335 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0335 : Poly :=
[
  term ((-20196228687940276989083986479503878576800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (15, 4), (16, 1)]
]

/-- Partial product 335 for generator 9. -/
def ep_Q2_008_partial_09_0335 : Poly :=
[
  term ((20196228687940276989083986479503878576800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (15, 4), (16, 1)],
  term ((-40392457375880553978167972959007757153600 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 335 for generator 9. -/
theorem ep_Q2_008_partial_09_0335_valid :
    mulPoly ep_Q2_008_coefficient_09_0335
        ep_Q2_008_generator_09_0300_0399 =
      ep_Q2_008_partial_09_0335 := by
  native_decide

/-- Coefficient term 336 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0336 : Poly :=
[
  term ((-14671335156506179311 : Rat) / 22174606515653643488) [(2, 1), (16, 1)]
]

/-- Partial product 336 for generator 9. -/
def ep_Q2_008_partial_09_0336 : Poly :=
[
  term ((14671335156506179311 : Rat) / 22174606515653643488) [(2, 1), (16, 1)],
  term ((-14671335156506179311 : Rat) / 11087303257826821744) [(2, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 336 for generator 9. -/
theorem ep_Q2_008_partial_09_0336_valid :
    mulPoly ep_Q2_008_coefficient_09_0336
        ep_Q2_008_generator_09_0300_0399 =
      ep_Q2_008_partial_09_0336 := by
  native_decide

/-- Coefficient term 337 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0337 : Poly :=
[
  term ((532462634409365713735246789175318400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (5, 1), (7, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 337 for generator 9. -/
def ep_Q2_008_partial_09_0337 : Poly :=
[
  term ((1064925268818731427470493578350636800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (4, 1), (5, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-532462634409365713735246789175318400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (5, 1), (7, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 337 for generator 9. -/
theorem ep_Q2_008_partial_09_0337_valid :
    mulPoly ep_Q2_008_coefficient_09_0337
        ep_Q2_008_generator_09_0300_0399 =
      ep_Q2_008_partial_09_0337 := by
  native_decide

/-- Coefficient term 338 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0338 : Poly :=
[
  term ((6169353161605841602993055489553600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (5, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 338 for generator 9. -/
def ep_Q2_008_partial_09_0338 : Poly :=
[
  term ((12338706323211683205986110979107200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (4, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-6169353161605841602993055489553600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (5, 1), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 338 for generator 9. -/
theorem ep_Q2_008_partial_09_0338_valid :
    mulPoly ep_Q2_008_coefficient_09_0338
        ep_Q2_008_generator_09_0300_0399 =
      ep_Q2_008_partial_09_0338 := by
  native_decide

/-- Coefficient term 339 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0339 : Poly :=
[
  term ((177605542265324711571 : Rat) / 1385912907228352718) [(3, 1), (4, 1), (5, 1), (13, 2), (16, 1)]
]

/-- Partial product 339 for generator 9. -/
def ep_Q2_008_partial_09_0339 : Poly :=
[
  term ((177605542265324711571 : Rat) / 692956453614176359) [(2, 1), (3, 1), (4, 1), (5, 1), (13, 2), (16, 1)],
  term ((-177605542265324711571 : Rat) / 1385912907228352718) [(3, 1), (4, 1), (5, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 339 for generator 9. -/
theorem ep_Q2_008_partial_09_0339_valid :
    mulPoly ep_Q2_008_coefficient_09_0339
        ep_Q2_008_generator_09_0300_0399 =
      ep_Q2_008_partial_09_0339 := by
  native_decide

/-- Coefficient term 340 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0340 : Poly :=
[
  term ((226716461880282438369 : Rat) / 22174606515653643488) [(3, 1), (4, 1), (5, 1), (16, 1)]
]

/-- Partial product 340 for generator 9. -/
def ep_Q2_008_partial_09_0340 : Poly :=
[
  term ((226716461880282438369 : Rat) / 11087303257826821744) [(2, 1), (3, 1), (4, 1), (5, 1), (16, 1)],
  term ((-226716461880282438369 : Rat) / 22174606515653643488) [(3, 1), (4, 1), (5, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 340 for generator 9. -/
theorem ep_Q2_008_partial_09_0340_valid :
    mulPoly ep_Q2_008_coefficient_09_0340
        ep_Q2_008_generator_09_0300_0399 =
      ep_Q2_008_partial_09_0340 := by
  native_decide

/-- Coefficient term 341 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0341 : Poly :=
[
  term ((-1016445529080722402675342475638400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 341 for generator 9. -/
def ep_Q2_008_partial_09_0341 : Poly :=
[
  term ((-2032891058161444805350684951276800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (4, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((1016445529080722402675342475638400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 341 for generator 9. -/
theorem ep_Q2_008_partial_09_0341_valid :
    mulPoly ep_Q2_008_coefficient_09_0341
        ep_Q2_008_generator_09_0300_0399 =
      ep_Q2_008_partial_09_0341 := by
  native_decide

/-- Coefficient term 342 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0342 : Poly :=
[
  term ((14908428712129337359769634092186400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (6, 1), (7, 1), (15, 2), (16, 1)]
]

/-- Partial product 342 for generator 9. -/
def ep_Q2_008_partial_09_0342 : Poly :=
[
  term ((29816857424258674719539268184372800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (4, 1), (6, 1), (7, 1), (15, 2), (16, 1)],
  term ((-14908428712129337359769634092186400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (6, 1), (7, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 342 for generator 9. -/
theorem ep_Q2_008_partial_09_0342_valid :
    mulPoly ep_Q2_008_coefficient_09_0342
        ep_Q2_008_generator_09_0300_0399 =
      ep_Q2_008_partial_09_0342 := by
  native_decide

/-- Coefficient term 343 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0343 : Poly :=
[
  term ((83370814993305000 : Rat) / 692956453614176359) [(3, 1), (4, 1), (6, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 343 for generator 9. -/
def ep_Q2_008_partial_09_0343 : Poly :=
[
  term ((166741629986610000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (4, 1), (6, 1), (10, 1), (11, 1), (16, 1)],
  term ((-83370814993305000 : Rat) / 692956453614176359) [(3, 1), (4, 1), (6, 1), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 343 for generator 9. -/
theorem ep_Q2_008_partial_09_0343_valid :
    mulPoly ep_Q2_008_coefficient_09_0343
        ep_Q2_008_generator_09_0300_0399 =
      ep_Q2_008_partial_09_0343 := by
  native_decide

/-- Coefficient term 344 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0344 : Poly :=
[
  term ((199241833525243875 : Rat) / 692956453614176359) [(3, 1), (4, 1), (6, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 344 for generator 9. -/
def ep_Q2_008_partial_09_0344 : Poly :=
[
  term ((398483667050487750 : Rat) / 692956453614176359) [(2, 1), (3, 1), (4, 1), (6, 1), (10, 1), (13, 1), (16, 1)],
  term ((-199241833525243875 : Rat) / 692956453614176359) [(3, 1), (4, 1), (6, 1), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 344 for generator 9. -/
theorem ep_Q2_008_partial_09_0344_valid :
    mulPoly ep_Q2_008_coefficient_09_0344
        ep_Q2_008_generator_09_0300_0399 =
      ep_Q2_008_partial_09_0344 := by
  native_decide

/-- Coefficient term 345 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0345 : Poly :=
[
  term ((-478060622764964799693876234252168883200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (6, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 345 for generator 9. -/
def ep_Q2_008_partial_09_0345 : Poly :=
[
  term ((-956121245529929599387752468504337766400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (4, 1), (6, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((478060622764964799693876234252168883200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (6, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 345 for generator 9. -/
theorem ep_Q2_008_partial_09_0345_valid :
    mulPoly ep_Q2_008_coefficient_09_0345
        ep_Q2_008_generator_09_0300_0399 =
      ep_Q2_008_partial_09_0345 := by
  native_decide

/-- Coefficient term 346 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0346 : Poly :=
[
  term ((-29288232546467947710010875230829295141800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (6, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 346 for generator 9. -/
def ep_Q2_008_partial_09_0346 : Poly :=
[
  term ((-58576465092935895420021750461658590283600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (4, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((29288232546467947710010875230829295141800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (6, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 346 for generator 9. -/
theorem ep_Q2_008_partial_09_0346_valid :
    mulPoly ep_Q2_008_coefficient_09_0346
        ep_Q2_008_generator_09_0300_0399 =
      ep_Q2_008_partial_09_0346 := by
  native_decide

/-- Coefficient term 347 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0347 : Poly :=
[
  term ((-1488764553451875 : Rat) / 23895050124626771) [(3, 1), (4, 1), (6, 1), (11, 1), (16, 1)]
]

/-- Partial product 347 for generator 9. -/
def ep_Q2_008_partial_09_0347 : Poly :=
[
  term ((-2977529106903750 : Rat) / 23895050124626771) [(2, 1), (3, 1), (4, 1), (6, 1), (11, 1), (16, 1)],
  term ((1488764553451875 : Rat) / 23895050124626771) [(3, 1), (4, 1), (6, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 347 for generator 9. -/
theorem ep_Q2_008_partial_09_0347_valid :
    mulPoly ep_Q2_008_coefficient_09_0347
        ep_Q2_008_generator_09_0300_0399 =
      ep_Q2_008_partial_09_0347 := by
  native_decide

/-- Coefficient term 348 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0348 : Poly :=
[
  term ((1071122173053087783 : Rat) / 5543651628913410872) [(3, 1), (4, 1), (6, 1), (13, 1), (16, 1)]
]

/-- Partial product 348 for generator 9. -/
def ep_Q2_008_partial_09_0348 : Poly :=
[
  term ((1071122173053087783 : Rat) / 2771825814456705436) [(2, 1), (3, 1), (4, 1), (6, 1), (13, 1), (16, 1)],
  term ((-1071122173053087783 : Rat) / 5543651628913410872) [(3, 1), (4, 1), (6, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 348 for generator 9. -/
theorem ep_Q2_008_partial_09_0348_valid :
    mulPoly ep_Q2_008_coefficient_09_0348
        ep_Q2_008_generator_09_0300_0399 =
      ep_Q2_008_partial_09_0348 := by
  native_decide

/-- Coefficient term 349 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0349 : Poly :=
[
  term ((478060622764964799693876234252168883200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (6, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 349 for generator 9. -/
def ep_Q2_008_partial_09_0349 : Poly :=
[
  term ((956121245529929599387752468504337766400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (4, 1), (6, 1), (13, 2), (15, 1), (16, 1)],
  term ((-478060622764964799693876234252168883200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (6, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 349 for generator 9. -/
theorem ep_Q2_008_partial_09_0349_valid :
    mulPoly ep_Q2_008_coefficient_09_0349
        ep_Q2_008_generator_09_0300_0399 =
      ep_Q2_008_partial_09_0349 := by
  native_decide

/-- Coefficient term 350 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0350 : Poly :=
[
  term ((-856393736766946513716279451750739612635859 : Rat) / 1349660814810636123005926626071864437583984) [(3, 1), (4, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 350 for generator 9. -/
def ep_Q2_008_partial_09_0350 : Poly :=
[
  term ((-856393736766946513716279451750739612635859 : Rat) / 674830407405318061502963313035932218791992) [(2, 1), (3, 1), (4, 1), (6, 1), (15, 1), (16, 1)],
  term ((856393736766946513716279451750739612635859 : Rat) / 1349660814810636123005926626071864437583984) [(3, 1), (4, 1), (6, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 350 for generator 9. -/
theorem ep_Q2_008_partial_09_0350_valid :
    mulPoly ep_Q2_008_coefficient_09_0350
        ep_Q2_008_generator_09_0300_0399 =
      ep_Q2_008_partial_09_0350 := by
  native_decide

/-- Coefficient term 351 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0351 : Poly :=
[
  term ((654856531631969621394480584477914800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 351 for generator 9. -/
def ep_Q2_008_partial_09_0351 : Poly :=
[
  term ((1309713063263939242788961168955829600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (4, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-654856531631969621394480584477914800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 351 for generator 9. -/
theorem ep_Q2_008_partial_09_0351_valid :
    mulPoly ep_Q2_008_coefficient_09_0351
        ep_Q2_008_generator_09_0300_0399 =
      ep_Q2_008_partial_09_0351 := by
  native_decide

/-- Coefficient term 352 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0352 : Poly :=
[
  term ((-12042986513724593559 : Rat) / 5543651628913410872) [(3, 1), (4, 1), (7, 1), (13, 2), (16, 1)]
]

/-- Partial product 352 for generator 9. -/
def ep_Q2_008_partial_09_0352 : Poly :=
[
  term ((-12042986513724593559 : Rat) / 2771825814456705436) [(2, 1), (3, 1), (4, 1), (7, 1), (13, 2), (16, 1)],
  term ((12042986513724593559 : Rat) / 5543651628913410872) [(3, 1), (4, 1), (7, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 352 for generator 9. -/
theorem ep_Q2_008_partial_09_0352_valid :
    mulPoly ep_Q2_008_coefficient_09_0352
        ep_Q2_008_generator_09_0300_0399 =
      ep_Q2_008_partial_09_0352 := by
  native_decide

/-- Coefficient term 353 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0353 : Poly :=
[
  term ((-30415567400882927383777358569402392000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 353 for generator 9. -/
def ep_Q2_008_partial_09_0353 : Poly :=
[
  term ((-60831134801765854767554717138804784000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (4, 1), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((30415567400882927383777358569402392000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 353 for generator 9. -/
theorem ep_Q2_008_partial_09_0353_valid :
    mulPoly ep_Q2_008_coefficient_09_0353
        ep_Q2_008_generator_09_0300_0399 =
      ep_Q2_008_partial_09_0353 := by
  native_decide

/-- Coefficient term 354 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0354 : Poly :=
[
  term ((-42626202709334997051267438952144800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 1), (15, 2), (16, 1)]
]

/-- Partial product 354 for generator 9. -/
def ep_Q2_008_partial_09_0354 : Poly :=
[
  term ((-85252405418669994102534877904289600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (4, 1), (7, 1), (15, 2), (16, 1)],
  term ((42626202709334997051267438952144800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 354 for generator 9. -/
theorem ep_Q2_008_partial_09_0354_valid :
    mulPoly ep_Q2_008_coefficient_09_0354
        ep_Q2_008_generator_09_0300_0399 =
      ep_Q2_008_partial_09_0354 := by
  native_decide

/-- Coefficient term 355 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0355 : Poly :=
[
  term ((-675712013698157305 : Rat) / 764641603988056672) [(3, 1), (4, 1), (7, 1), (16, 1)]
]

/-- Partial product 355 for generator 9. -/
def ep_Q2_008_partial_09_0355 : Poly :=
[
  term ((-675712013698157305 : Rat) / 382320801994028336) [(2, 1), (3, 1), (4, 1), (7, 1), (16, 1)],
  term ((675712013698157305 : Rat) / 764641603988056672) [(3, 1), (4, 1), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 355 for generator 9. -/
theorem ep_Q2_008_partial_09_0355_valid :
    mulPoly ep_Q2_008_coefficient_09_0355
        ep_Q2_008_generator_09_0300_0399 =
      ep_Q2_008_partial_09_0355 := by
  native_decide

/-- Coefficient term 356 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0356 : Poly :=
[
  term ((-837679013082068463285613534409731200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 2), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 356 for generator 9. -/
def ep_Q2_008_partial_09_0356 : Poly :=
[
  term ((-1675358026164136926571227068819462400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (4, 1), (7, 2), (13, 2), (15, 1), (16, 1)],
  term ((837679013082068463285613534409731200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 356 for generator 9. -/
theorem ep_Q2_008_partial_09_0356_valid :
    mulPoly ep_Q2_008_coefficient_09_0356
        ep_Q2_008_generator_09_0300_0399 =
      ep_Q2_008_partial_09_0356 := by
  native_decide

/-- Coefficient term 357 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0357 : Poly :=
[
  term ((10113969585720433178938424302296000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 2), (15, 1), (16, 1)]
]

/-- Partial product 357 for generator 9. -/
def ep_Q2_008_partial_09_0357 : Poly :=
[
  term ((20227939171440866357876848604592000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (4, 1), (7, 2), (15, 1), (16, 1)],
  term ((-10113969585720433178938424302296000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 357 for generator 9. -/
theorem ep_Q2_008_partial_09_0357_valid :
    mulPoly ep_Q2_008_coefficient_09_0357
        ep_Q2_008_generator_09_0300_0399 =
      ep_Q2_008_partial_09_0357 := by
  native_decide

/-- Coefficient term 358 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0358 : Poly :=
[
  term ((39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 358 for generator 9. -/
def ep_Q2_008_partial_09_0358 : Poly :=
[
  term ((78173987841078575882094280687715020800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (4, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 358 for generator 9. -/
theorem ep_Q2_008_partial_09_0358_valid :
    mulPoly ep_Q2_008_coefficient_09_0358
        ep_Q2_008_generator_09_0300_0399 =
      ep_Q2_008_partial_09_0358 := by
  native_decide

/-- Coefficient term 359 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0359 : Poly :=
[
  term ((-70324786932212700 : Rat) / 692956453614176359) [(3, 1), (4, 1), (9, 1), (16, 1)]
]

/-- Partial product 359 for generator 9. -/
def ep_Q2_008_partial_09_0359 : Poly :=
[
  term ((-140649573864425400 : Rat) / 692956453614176359) [(2, 1), (3, 1), (4, 1), (9, 1), (16, 1)],
  term ((70324786932212700 : Rat) / 692956453614176359) [(3, 1), (4, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 359 for generator 9. -/
theorem ep_Q2_008_partial_09_0359_valid :
    mulPoly ep_Q2_008_coefficient_09_0359
        ep_Q2_008_generator_09_0300_0399 =
      ep_Q2_008_partial_09_0359 := by
  native_decide

/-- Coefficient term 360 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0360 : Poly :=
[
  term ((-101235989634727500 : Rat) / 692956453614176359) [(3, 1), (4, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 360 for generator 9. -/
def ep_Q2_008_partial_09_0360 : Poly :=
[
  term ((-202471979269455000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (4, 1), (10, 1), (11, 1), (16, 1)],
  term ((101235989634727500 : Rat) / 692956453614176359) [(3, 1), (4, 1), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 360 for generator 9. -/
theorem ep_Q2_008_partial_09_0360_valid :
    mulPoly ep_Q2_008_coefficient_09_0360
        ep_Q2_008_generator_09_0300_0399 =
      ep_Q2_008_partial_09_0360 := by
  native_decide

/-- Coefficient term 361 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0361 : Poly :=
[
  term ((65144989867565479901745233906429184000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (10, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 361 for generator 9. -/
def ep_Q2_008_partial_09_0361 : Poly :=
[
  term ((130289979735130959803490467812858368000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (4, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-65144989867565479901745233906429184000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (10, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 361 for generator 9. -/
theorem ep_Q2_008_partial_09_0361_valid :
    mulPoly ep_Q2_008_coefficient_09_0361
        ep_Q2_008_generator_09_0300_0399 =
      ep_Q2_008_partial_09_0361 := by
  native_decide

/-- Coefficient term 362 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0362 : Poly :=
[
  term ((-4925794502973102750 : Rat) / 692956453614176359) [(3, 1), (4, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 362 for generator 9. -/
def ep_Q2_008_partial_09_0362 : Poly :=
[
  term ((-9851589005946205500 : Rat) / 692956453614176359) [(2, 1), (3, 1), (4, 1), (10, 1), (13, 1), (16, 1)],
  term ((4925794502973102750 : Rat) / 692956453614176359) [(3, 1), (4, 1), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 362 for generator 9. -/
theorem ep_Q2_008_partial_09_0362_valid :
    mulPoly ep_Q2_008_coefficient_09_0362
        ep_Q2_008_generator_09_0300_0399 =
      ep_Q2_008_partial_09_0362 := by
  native_decide

/-- Coefficient term 363 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0363 : Poly :=
[
  term ((434600566149967999721705667501971712000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 363 for generator 9. -/
def ep_Q2_008_partial_09_0363 : Poly :=
[
  term ((869201132299935999443411335003943424000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (4, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-434600566149967999721705667501971712000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 363 for generator 9. -/
theorem ep_Q2_008_partial_09_0363_valid :
    mulPoly ep_Q2_008_coefficient_09_0363
        ep_Q2_008_generator_09_0300_0399 =
      ep_Q2_008_partial_09_0363 := by
  native_decide

/-- Coefficient term 364 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0364 : Poly :=
[
  term ((-29580806306539309346826827775572806334100 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 364 for generator 9. -/
def ep_Q2_008_partial_09_0364 : Poly :=
[
  term ((-59161612613078618693653655551145612668200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (4, 1), (10, 1), (15, 1), (16, 1)],
  term ((29580806306539309346826827775572806334100 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 364 for generator 9. -/
theorem ep_Q2_008_partial_09_0364_valid :
    mulPoly ep_Q2_008_coefficient_09_0364
        ep_Q2_008_generator_09_0300_0399 =
      ep_Q2_008_partial_09_0364 := by
  native_decide

/-- Coefficient term 365 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0365 : Poly :=
[
  term ((-2885939113760525889703514816862694927200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 365 for generator 9. -/
def ep_Q2_008_partial_09_0365 : Poly :=
[
  term ((-5771878227521051779407029633725389854400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (4, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((2885939113760525889703514816862694927200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 365 for generator 9. -/
theorem ep_Q2_008_partial_09_0365_valid :
    mulPoly ep_Q2_008_coefficient_09_0365
        ep_Q2_008_generator_09_0300_0399 =
      ep_Q2_008_partial_09_0365 := by
  native_decide

/-- Coefficient term 366 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0366 : Poly :=
[
  term ((-19653784069174299000 : Rat) / 692956453614176359) [(3, 1), (4, 1), (11, 1), (13, 2), (16, 1)]
]

/-- Partial product 366 for generator 9. -/
def ep_Q2_008_partial_09_0366 : Poly :=
[
  term ((-39307568138348598000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (4, 1), (11, 1), (13, 2), (16, 1)],
  term ((19653784069174299000 : Rat) / 692956453614176359) [(3, 1), (4, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 366 for generator 9. -/
theorem ep_Q2_008_partial_09_0366_valid :
    mulPoly ep_Q2_008_coefficient_09_0366
        ep_Q2_008_generator_09_0300_0399 =
      ep_Q2_008_partial_09_0366 := by
  native_decide

/-- Coefficient term 367 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0367 : Poly :=
[
  term ((-1627034811254403934498476022932245395200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 367 for generator 9. -/
def ep_Q2_008_partial_09_0367 : Poly :=
[
  term ((-3254069622508807868996952045864490790400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (4, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((1627034811254403934498476022932245395200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 367 for generator 9. -/
theorem ep_Q2_008_partial_09_0367_valid :
    mulPoly ep_Q2_008_coefficient_09_0367
        ep_Q2_008_generator_09_0300_0399 =
      ep_Q2_008_partial_09_0367 := by
  native_decide

/-- Coefficient term 368 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0368 : Poly :=
[
  term ((-1898190252673399125 : Rat) / 11087303257826821744) [(3, 1), (4, 1), (11, 1), (16, 1)]
]

/-- Partial product 368 for generator 9. -/
def ep_Q2_008_partial_09_0368 : Poly :=
[
  term ((-1898190252673399125 : Rat) / 5543651628913410872) [(2, 1), (3, 1), (4, 1), (11, 1), (16, 1)],
  term ((1898190252673399125 : Rat) / 11087303257826821744) [(3, 1), (4, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 368 for generator 9. -/
theorem ep_Q2_008_partial_09_0368_valid :
    mulPoly ep_Q2_008_coefficient_09_0368
        ep_Q2_008_generator_09_0300_0399 =
      ep_Q2_008_partial_09_0368 := by
  native_decide

/-- Coefficient term 369 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0369 : Poly :=
[
  term ((21935045861953702780443915773903649060600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 369 for generator 9. -/
def ep_Q2_008_partial_09_0369 : Poly :=
[
  term ((43870091723907405560887831547807298121200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (4, 1), (12, 1), (15, 1), (16, 1)],
  term ((-21935045861953702780443915773903649060600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 369 for generator 9. -/
theorem ep_Q2_008_partial_09_0369_valid :
    mulPoly ep_Q2_008_coefficient_09_0369
        ep_Q2_008_generator_09_0300_0399 =
      ep_Q2_008_partial_09_0369 := by
  native_decide

/-- Coefficient term 370 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0370 : Poly :=
[
  term ((1414024316946514989998251421146778952000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 370 for generator 9. -/
def ep_Q2_008_partial_09_0370 : Poly :=
[
  term ((2828048633893029979996502842293557904000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (4, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1414024316946514989998251421146778952000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 370 for generator 9. -/
theorem ep_Q2_008_partial_09_0370_valid :
    mulPoly ep_Q2_008_coefficient_09_0370
        ep_Q2_008_generator_09_0300_0399 =
      ep_Q2_008_partial_09_0370 := by
  native_decide

/-- Coefficient term 371 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0371 : Poly :=
[
  term ((166578576640688464947 : Rat) / 22174606515653643488) [(3, 1), (4, 1), (13, 1), (16, 1)]
]

/-- Partial product 371 for generator 9. -/
def ep_Q2_008_partial_09_0371 : Poly :=
[
  term ((166578576640688464947 : Rat) / 11087303257826821744) [(2, 1), (3, 1), (4, 1), (13, 1), (16, 1)],
  term ((-166578576640688464947 : Rat) / 22174606515653643488) [(3, 1), (4, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 371 for generator 9. -/
theorem ep_Q2_008_partial_09_0371_valid :
    mulPoly ep_Q2_008_coefficient_09_0371
        ep_Q2_008_generator_09_0300_0399 =
      ep_Q2_008_partial_09_0371 := by
  native_decide

/-- Coefficient term 372 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0372 : Poly :=
[
  term ((-30856702031594140971083286852161576150400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 372 for generator 9. -/
def ep_Q2_008_partial_09_0372 : Poly :=
[
  term ((-61713404063188281942166573704323152300800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (4, 1), (13, 2), (15, 1), (16, 1)],
  term ((30856702031594140971083286852161576150400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 372 for generator 9. -/
theorem ep_Q2_008_partial_09_0372_valid :
    mulPoly ep_Q2_008_coefficient_09_0372
        ep_Q2_008_generator_09_0300_0399 =
      ep_Q2_008_partial_09_0372 := by
  native_decide

/-- Coefficient term 373 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0373 : Poly :=
[
  term ((1204593909789456321194254797107303210640017 : Rat) / 1349660814810636123005926626071864437583984) [(3, 1), (4, 1), (15, 1), (16, 1)]
]

/-- Partial product 373 for generator 9. -/
def ep_Q2_008_partial_09_0373 : Poly :=
[
  term ((1204593909789456321194254797107303210640017 : Rat) / 674830407405318061502963313035932218791992) [(2, 1), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((-1204593909789456321194254797107303210640017 : Rat) / 1349660814810636123005926626071864437583984) [(3, 1), (4, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 373 for generator 9. -/
theorem ep_Q2_008_partial_09_0373_valid :
    mulPoly ep_Q2_008_coefficient_09_0373
        ep_Q2_008_generator_09_0300_0399 =
      ep_Q2_008_partial_09_0373 := by
  native_decide

/-- Coefficient term 374 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0374 : Poly :=
[
  term ((52208389534807899966554525138047200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 2), (15, 1), (16, 1)]
]

/-- Partial product 374 for generator 9. -/
def ep_Q2_008_partial_09_0374 : Poly :=
[
  term ((104416779069615799933109050276094400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (4, 2), (15, 1), (16, 1)],
  term ((-52208389534807899966554525138047200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 374 for generator 9. -/
theorem ep_Q2_008_partial_09_0374_valid :
    mulPoly ep_Q2_008_coefficient_09_0374
        ep_Q2_008_generator_09_0300_0399 =
      ep_Q2_008_partial_09_0374 := by
  native_decide

/-- Coefficient term 375 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0375 : Poly :=
[
  term ((129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 375 for generator 9. -/
def ep_Q2_008_partial_09_0375 : Poly :=
[
  term ((258163701531813679386786322024396800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (6, 1), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 375 for generator 9. -/
theorem ep_Q2_008_partial_09_0375_valid :
    mulPoly ep_Q2_008_coefficient_09_0375
        ep_Q2_008_generator_09_0300_0399 =
      ep_Q2_008_partial_09_0375 := by
  native_decide

/-- Coefficient term 376 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0376 : Poly :=
[
  term ((28473937668950038167660256105632000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 376 for generator 9. -/
def ep_Q2_008_partial_09_0376 : Poly :=
[
  term ((56947875337900076335320512211264000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (6, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-28473937668950038167660256105632000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 376 for generator 9. -/
theorem ep_Q2_008_partial_09_0376_valid :
    mulPoly ep_Q2_008_coefficient_09_0376
        ep_Q2_008_generator_09_0300_0399 =
      ep_Q2_008_partial_09_0376 := by
  native_decide

/-- Coefficient term 377 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0377 : Poly :=
[
  term ((-121643623549786321448649760776566400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 377 for generator 9. -/
def ep_Q2_008_partial_09_0377 : Poly :=
[
  term ((-243287247099572642897299521553132800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (6, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((121643623549786321448649760776566400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 377 for generator 9. -/
theorem ep_Q2_008_partial_09_0377_valid :
    mulPoly ep_Q2_008_coefficient_09_0377
        ep_Q2_008_generator_09_0300_0399 =
      ep_Q2_008_partial_09_0377 := by
  native_decide

/-- Coefficient term 378 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0378 : Poly :=
[
  term ((13103014816289361117438744225346727257596540 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (6, 1), (7, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 378 for generator 9. -/
def ep_Q2_008_partial_09_0378 : Poly :=
[
  term ((26206029632578722234877488450693454515193080 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (5, 1), (6, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-13103014816289361117438744225346727257596540 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (6, 1), (7, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 378 for generator 9. -/
theorem ep_Q2_008_partial_09_0378_valid :
    mulPoly ep_Q2_008_coefficient_09_0378
        ep_Q2_008_generator_09_0300_0399 =
      ep_Q2_008_partial_09_0378 := by
  native_decide

/-- Coefficient term 379 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0379 : Poly :=
[
  term ((-645409253829534198466965805060992000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 1), (13, 2), (15, 3), (16, 1)]
]

/-- Partial product 379 for generator 9. -/
def ep_Q2_008_partial_09_0379 : Poly :=
[
  term ((-1290818507659068396933931610121984000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (6, 1), (7, 1), (13, 2), (15, 3), (16, 1)],
  term ((645409253829534198466965805060992000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 379 for generator 9. -/
theorem ep_Q2_008_partial_09_0379_valid :
    mulPoly ep_Q2_008_coefficient_09_0379
        ep_Q2_008_generator_09_0300_0399 =
      ep_Q2_008_partial_09_0379 := by
  native_decide

/-- Coefficient term 380 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0380 : Poly :=
[
  term ((610382247336684897903099289738727714342349 : Rat) / 337415203702659030751481656517966109395996) [(3, 1), (5, 1), (6, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 380 for generator 9. -/
def ep_Q2_008_partial_09_0380 : Poly :=
[
  term ((610382247336684897903099289738727714342349 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (3, 1), (5, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-610382247336684897903099289738727714342349 : Rat) / 337415203702659030751481656517966109395996) [(3, 1), (5, 1), (6, 1), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 380 for generator 9. -/
theorem ep_Q2_008_partial_09_0380_valid :
    mulPoly ep_Q2_008_coefficient_09_0380
        ep_Q2_008_generator_09_0300_0399 =
      ep_Q2_008_partial_09_0380 := by
  native_decide

/-- Coefficient term 381 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0381 : Poly :=
[
  term ((117365801472098910277125388966843200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 1), (15, 3), (16, 1)]
]

/-- Partial product 381 for generator 9. -/
def ep_Q2_008_partial_09_0381 : Poly :=
[
  term ((234731602944197820554250777933686400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (6, 1), (7, 1), (15, 3), (16, 1)],
  term ((-117365801472098910277125388966843200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 381 for generator 9. -/
theorem ep_Q2_008_partial_09_0381_valid :
    mulPoly ep_Q2_008_coefficient_09_0381
        ep_Q2_008_generator_09_0300_0399 =
      ep_Q2_008_partial_09_0381 := by
  native_decide

/-- Coefficient term 382 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0382 : Poly :=
[
  term ((645409253829534198466965805060992000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 2), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 382 for generator 9. -/
def ep_Q2_008_partial_09_0382 : Poly :=
[
  term ((1290818507659068396933931610121984000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (6, 1), (7, 2), (13, 2), (15, 2), (16, 1)],
  term ((-645409253829534198466965805060992000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 382 for generator 9. -/
theorem ep_Q2_008_partial_09_0382_valid :
    mulPoly ep_Q2_008_coefficient_09_0382
        ep_Q2_008_generator_09_0300_0399 =
      ep_Q2_008_partial_09_0382 := by
  native_decide

/-- Coefficient term 383 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0383 : Poly :=
[
  term ((11389575067580015267064102442252800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 2), (15, 2), (16, 1)]
]

/-- Partial product 383 for generator 9. -/
def ep_Q2_008_partial_09_0383 : Poly :=
[
  term ((22779150135160030534128204884505600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (6, 1), (7, 2), (15, 2), (16, 1)],
  term ((-11389575067580015267064102442252800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 383 for generator 9. -/
theorem ep_Q2_008_partial_09_0383_valid :
    mulPoly ep_Q2_008_coefficient_09_0383
        ep_Q2_008_generator_09_0300_0399 =
      ep_Q2_008_partial_09_0383 := by
  native_decide

/-- Coefficient term 384 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0384 : Poly :=
[
  term ((145646309600976375 : Rat) / 692956453614176359) [(3, 1), (5, 1), (6, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 384 for generator 9. -/
def ep_Q2_008_partial_09_0384 : Poly :=
[
  term ((291292619201952750 : Rat) / 692956453614176359) [(2, 1), (3, 1), (5, 1), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((-145646309600976375 : Rat) / 692956453614176359) [(3, 1), (5, 1), (6, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 384 for generator 9. -/
theorem ep_Q2_008_partial_09_0384_valid :
    mulPoly ep_Q2_008_coefficient_09_0384
        ep_Q2_008_generator_09_0300_0399 =
      ep_Q2_008_partial_09_0384 := by
  native_decide

/-- Coefficient term 385 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0385 : Poly :=
[
  term ((-478060622764964799693876234252168883200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (6, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 385 for generator 9. -/
def ep_Q2_008_partial_09_0385 : Poly :=
[
  term ((-956121245529929599387752468504337766400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (5, 1), (6, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((478060622764964799693876234252168883200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (6, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 385 for generator 9. -/
theorem ep_Q2_008_partial_09_0385_valid :
    mulPoly ep_Q2_008_coefficient_09_0385
        ep_Q2_008_generator_09_0300_0399 =
      ep_Q2_008_partial_09_0385 := by
  native_decide

/-- Coefficient term 386 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0386 : Poly :=
[
  term ((-32550332301823970354000043447260360675550 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (6, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 386 for generator 9. -/
def ep_Q2_008_partial_09_0386 : Poly :=
[
  term ((-65100664603647940708000086894520721351100 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (5, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((32550332301823970354000043447260360675550 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (6, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 386 for generator 9. -/
theorem ep_Q2_008_partial_09_0386_valid :
    mulPoly ep_Q2_008_coefficient_09_0386
        ep_Q2_008_generator_09_0300_0399 =
      ep_Q2_008_partial_09_0386 := by
  native_decide

/-- Coefficient term 387 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0387 : Poly :=
[
  term ((83370814993305000 : Rat) / 692956453614176359) [(3, 1), (5, 1), (6, 1), (11, 2), (16, 1)]
]

/-- Partial product 387 for generator 9. -/
def ep_Q2_008_partial_09_0387 : Poly :=
[
  term ((166741629986610000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (5, 1), (6, 1), (11, 2), (16, 1)],
  term ((-83370814993305000 : Rat) / 692956453614176359) [(3, 1), (5, 1), (6, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 387 for generator 9. -/
theorem ep_Q2_008_partial_09_0387_valid :
    mulPoly ep_Q2_008_coefficient_09_0387
        ep_Q2_008_generator_09_0300_0399 =
      ep_Q2_008_partial_09_0387 := by
  native_decide

/-- Coefficient term 388 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0388 : Poly :=
[
  term ((21527944517009055948 : Rat) / 692956453614176359) [(3, 1), (5, 1), (6, 1), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 388 for generator 9. -/
def ep_Q2_008_partial_09_0388 : Poly :=
[
  term ((43055889034018111896 : Rat) / 692956453614176359) [(2, 1), (3, 1), (5, 1), (6, 1), (12, 1), (13, 2), (16, 1)],
  term ((-21527944517009055948 : Rat) / 692956453614176359) [(3, 1), (5, 1), (6, 1), (12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 388 for generator 9. -/
theorem ep_Q2_008_partial_09_0388_valid :
    mulPoly ep_Q2_008_coefficient_09_0388
        ep_Q2_008_generator_09_0300_0399 =
      ep_Q2_008_partial_09_0388 := by
  native_decide

/-- Coefficient term 389 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0389 : Poly :=
[
  term ((19856540141026962045 : Rat) / 2771825814456705436) [(3, 1), (5, 1), (6, 1), (12, 1), (16, 1)]
]

/-- Partial product 389 for generator 9. -/
def ep_Q2_008_partial_09_0389 : Poly :=
[
  term ((19856540141026962045 : Rat) / 1385912907228352718) [(2, 1), (3, 1), (5, 1), (6, 1), (12, 1), (16, 1)],
  term ((-19856540141026962045 : Rat) / 2771825814456705436) [(3, 1), (5, 1), (6, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 389 for generator 9. -/
theorem ep_Q2_008_partial_09_0389_valid :
    mulPoly ep_Q2_008_coefficient_09_0389
        ep_Q2_008_generator_09_0300_0399 =
      ep_Q2_008_partial_09_0389 := by
  native_decide

/-- Coefficient term 390 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0390 : Poly :=
[
  term ((1575099129761377463315355664880531156158285 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (6, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 390 for generator 9. -/
def ep_Q2_008_partial_09_0390 : Poly :=
[
  term ((3150198259522754926630711329761062312316570 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (5, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1575099129761377463315355664880531156158285 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (6, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 390 for generator 9. -/
theorem ep_Q2_008_partial_09_0390_valid :
    mulPoly ep_Q2_008_coefficient_09_0390
        ep_Q2_008_generator_09_0300_0399 =
      ep_Q2_008_partial_09_0390 := by
  native_decide

/-- Coefficient term 391 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0391 : Poly :=
[
  term ((-107639722585045279740 : Rat) / 692956453614176359) [(3, 1), (5, 1), (6, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 391 for generator 9. -/
def ep_Q2_008_partial_09_0391 : Poly :=
[
  term ((-215279445170090559480 : Rat) / 692956453614176359) [(2, 1), (3, 1), (5, 1), (6, 1), (13, 2), (15, 2), (16, 1)],
  term ((107639722585045279740 : Rat) / 692956453614176359) [(3, 1), (5, 1), (6, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 391 for generator 9. -/
theorem ep_Q2_008_partial_09_0391_valid :
    mulPoly ep_Q2_008_coefficient_09_0391
        ep_Q2_008_generator_09_0300_0399 =
      ep_Q2_008_partial_09_0391 := by
  native_decide

/-- Coefficient term 392 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0392 : Poly :=
[
  term ((-29523115040774172297 : Rat) / 1385912907228352718) [(3, 1), (5, 1), (6, 1), (13, 2), (16, 1)]
]

/-- Partial product 392 for generator 9. -/
def ep_Q2_008_partial_09_0392 : Poly :=
[
  term ((-29523115040774172297 : Rat) / 692956453614176359) [(2, 1), (3, 1), (5, 1), (6, 1), (13, 2), (16, 1)],
  term ((29523115040774172297 : Rat) / 1385912907228352718) [(3, 1), (5, 1), (6, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 392 for generator 9. -/
theorem ep_Q2_008_partial_09_0392_valid :
    mulPoly ep_Q2_008_coefficient_09_0392
        ep_Q2_008_generator_09_0300_0399 =
      ep_Q2_008_partial_09_0392 := by
  native_decide

/-- Coefficient term 393 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0393 : Poly :=
[
  term ((-3064200577502922368023043764130455708609033 : Rat) / 674830407405318061502963313035932218791992) [(3, 1), (5, 1), (6, 1), (15, 2), (16, 1)]
]

/-- Partial product 393 for generator 9. -/
def ep_Q2_008_partial_09_0393 : Poly :=
[
  term ((-3064200577502922368023043764130455708609033 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (3, 1), (5, 1), (6, 1), (15, 2), (16, 1)],
  term ((3064200577502922368023043764130455708609033 : Rat) / 674830407405318061502963313035932218791992) [(3, 1), (5, 1), (6, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 393 for generator 9. -/
theorem ep_Q2_008_partial_09_0393_valid :
    mulPoly ep_Q2_008_coefficient_09_0393
        ep_Q2_008_generator_09_0300_0399 =
      ep_Q2_008_partial_09_0393 := by
  native_decide

/-- Coefficient term 394 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0394 : Poly :=
[
  term ((59581023259357560165 : Rat) / 5543651628913410872) [(3, 1), (5, 1), (6, 1), (16, 1)]
]

/-- Partial product 394 for generator 9. -/
def ep_Q2_008_partial_09_0394 : Poly :=
[
  term ((59581023259357560165 : Rat) / 2771825814456705436) [(2, 1), (3, 1), (5, 1), (6, 1), (16, 1)],
  term ((-59581023259357560165 : Rat) / 5543651628913410872) [(3, 1), (5, 1), (6, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 394 for generator 9. -/
theorem ep_Q2_008_partial_09_0394_valid :
    mulPoly ep_Q2_008_coefficient_09_0394
        ep_Q2_008_generator_09_0300_0399 =
      ep_Q2_008_partial_09_0394 := by
  native_decide

/-- Coefficient term 395 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0395 : Poly :=
[
  term ((-322704626914767099233482902530496000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 2), (7, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 395 for generator 9. -/
def ep_Q2_008_partial_09_0395 : Poly :=
[
  term ((-645409253829534198466965805060992000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (6, 2), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((322704626914767099233482902530496000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 2), (7, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 395 for generator 9. -/
theorem ep_Q2_008_partial_09_0395_valid :
    mulPoly ep_Q2_008_coefficient_09_0395
        ep_Q2_008_generator_09_0300_0399 =
      ep_Q2_008_partial_09_0395 := by
  native_decide

/-- Coefficient term 396 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0396 : Poly :=
[
  term ((-5694787533790007633532051221126400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 2), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 396 for generator 9. -/
def ep_Q2_008_partial_09_0396 : Poly :=
[
  term ((-11389575067580015267064102442252800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (6, 2), (7, 1), (15, 1), (16, 1)],
  term ((5694787533790007633532051221126400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 2), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 396 for generator 9. -/
theorem ep_Q2_008_partial_09_0396_valid :
    mulPoly ep_Q2_008_coefficient_09_0396
        ep_Q2_008_generator_09_0300_0399 =
      ep_Q2_008_partial_09_0396 := by
  native_decide

/-- Coefficient term 397 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0397 : Poly :=
[
  term ((-53819861292522639870 : Rat) / 692956453614176359) [(3, 1), (5, 1), (6, 2), (13, 2), (16, 1)]
]

/-- Partial product 397 for generator 9. -/
def ep_Q2_008_partial_09_0397 : Poly :=
[
  term ((-107639722585045279740 : Rat) / 692956453614176359) [(2, 1), (3, 1), (5, 1), (6, 2), (13, 2), (16, 1)],
  term ((53819861292522639870 : Rat) / 692956453614176359) [(3, 1), (5, 1), (6, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 397 for generator 9. -/
theorem ep_Q2_008_partial_09_0397_valid :
    mulPoly ep_Q2_008_coefficient_09_0397
        ep_Q2_008_generator_09_0300_0399 =
      ep_Q2_008_partial_09_0397 := by
  native_decide

/-- Coefficient term 398 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0398 : Poly :=
[
  term ((-5014213127946281709 : Rat) / 5543651628913410872) [(3, 1), (5, 1), (6, 2), (16, 1)]
]

/-- Partial product 398 for generator 9. -/
def ep_Q2_008_partial_09_0398 : Poly :=
[
  term ((-5014213127946281709 : Rat) / 2771825814456705436) [(2, 1), (3, 1), (5, 1), (6, 2), (16, 1)],
  term ((5014213127946281709 : Rat) / 5543651628913410872) [(3, 1), (5, 1), (6, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 398 for generator 9. -/
theorem ep_Q2_008_partial_09_0398_valid :
    mulPoly ep_Q2_008_coefficient_09_0398
        ep_Q2_008_generator_09_0300_0399 =
      ep_Q2_008_partial_09_0398 := by
  native_decide

/-- Coefficient term 399 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0399 : Poly :=
[
  term ((-419516014989197229003527773289644800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 399 for generator 9. -/
def ep_Q2_008_partial_09_0399 : Poly :=
[
  term ((-839032029978394458007055546579289600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((419516014989197229003527773289644800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 399 for generator 9. -/
theorem ep_Q2_008_partial_09_0399_valid :
    mulPoly ep_Q2_008_coefficient_09_0399
        ep_Q2_008_generator_09_0300_0399 =
      ep_Q2_008_partial_09_0399 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_008_partials_09_0300_0399 : List Poly :=
[
  ep_Q2_008_partial_09_0300,
  ep_Q2_008_partial_09_0301,
  ep_Q2_008_partial_09_0302,
  ep_Q2_008_partial_09_0303,
  ep_Q2_008_partial_09_0304,
  ep_Q2_008_partial_09_0305,
  ep_Q2_008_partial_09_0306,
  ep_Q2_008_partial_09_0307,
  ep_Q2_008_partial_09_0308,
  ep_Q2_008_partial_09_0309,
  ep_Q2_008_partial_09_0310,
  ep_Q2_008_partial_09_0311,
  ep_Q2_008_partial_09_0312,
  ep_Q2_008_partial_09_0313,
  ep_Q2_008_partial_09_0314,
  ep_Q2_008_partial_09_0315,
  ep_Q2_008_partial_09_0316,
  ep_Q2_008_partial_09_0317,
  ep_Q2_008_partial_09_0318,
  ep_Q2_008_partial_09_0319,
  ep_Q2_008_partial_09_0320,
  ep_Q2_008_partial_09_0321,
  ep_Q2_008_partial_09_0322,
  ep_Q2_008_partial_09_0323,
  ep_Q2_008_partial_09_0324,
  ep_Q2_008_partial_09_0325,
  ep_Q2_008_partial_09_0326,
  ep_Q2_008_partial_09_0327,
  ep_Q2_008_partial_09_0328,
  ep_Q2_008_partial_09_0329,
  ep_Q2_008_partial_09_0330,
  ep_Q2_008_partial_09_0331,
  ep_Q2_008_partial_09_0332,
  ep_Q2_008_partial_09_0333,
  ep_Q2_008_partial_09_0334,
  ep_Q2_008_partial_09_0335,
  ep_Q2_008_partial_09_0336,
  ep_Q2_008_partial_09_0337,
  ep_Q2_008_partial_09_0338,
  ep_Q2_008_partial_09_0339,
  ep_Q2_008_partial_09_0340,
  ep_Q2_008_partial_09_0341,
  ep_Q2_008_partial_09_0342,
  ep_Q2_008_partial_09_0343,
  ep_Q2_008_partial_09_0344,
  ep_Q2_008_partial_09_0345,
  ep_Q2_008_partial_09_0346,
  ep_Q2_008_partial_09_0347,
  ep_Q2_008_partial_09_0348,
  ep_Q2_008_partial_09_0349,
  ep_Q2_008_partial_09_0350,
  ep_Q2_008_partial_09_0351,
  ep_Q2_008_partial_09_0352,
  ep_Q2_008_partial_09_0353,
  ep_Q2_008_partial_09_0354,
  ep_Q2_008_partial_09_0355,
  ep_Q2_008_partial_09_0356,
  ep_Q2_008_partial_09_0357,
  ep_Q2_008_partial_09_0358,
  ep_Q2_008_partial_09_0359,
  ep_Q2_008_partial_09_0360,
  ep_Q2_008_partial_09_0361,
  ep_Q2_008_partial_09_0362,
  ep_Q2_008_partial_09_0363,
  ep_Q2_008_partial_09_0364,
  ep_Q2_008_partial_09_0365,
  ep_Q2_008_partial_09_0366,
  ep_Q2_008_partial_09_0367,
  ep_Q2_008_partial_09_0368,
  ep_Q2_008_partial_09_0369,
  ep_Q2_008_partial_09_0370,
  ep_Q2_008_partial_09_0371,
  ep_Q2_008_partial_09_0372,
  ep_Q2_008_partial_09_0373,
  ep_Q2_008_partial_09_0374,
  ep_Q2_008_partial_09_0375,
  ep_Q2_008_partial_09_0376,
  ep_Q2_008_partial_09_0377,
  ep_Q2_008_partial_09_0378,
  ep_Q2_008_partial_09_0379,
  ep_Q2_008_partial_09_0380,
  ep_Q2_008_partial_09_0381,
  ep_Q2_008_partial_09_0382,
  ep_Q2_008_partial_09_0383,
  ep_Q2_008_partial_09_0384,
  ep_Q2_008_partial_09_0385,
  ep_Q2_008_partial_09_0386,
  ep_Q2_008_partial_09_0387,
  ep_Q2_008_partial_09_0388,
  ep_Q2_008_partial_09_0389,
  ep_Q2_008_partial_09_0390,
  ep_Q2_008_partial_09_0391,
  ep_Q2_008_partial_09_0392,
  ep_Q2_008_partial_09_0393,
  ep_Q2_008_partial_09_0394,
  ep_Q2_008_partial_09_0395,
  ep_Q2_008_partial_09_0396,
  ep_Q2_008_partial_09_0397,
  ep_Q2_008_partial_09_0398,
  ep_Q2_008_partial_09_0399
]

/-- Sum of partial products in this block. -/
def ep_Q2_008_block_09_0300_0399 : Poly :=
[
  term ((1064925268818731427470493578350636800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (4, 1), (5, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((12338706323211683205986110979107200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (4, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((177605542265324711571 : Rat) / 692956453614176359) [(2, 1), (3, 1), (4, 1), (5, 1), (13, 2), (16, 1)],
  term ((226716461880282438369 : Rat) / 11087303257826821744) [(2, 1), (3, 1), (4, 1), (5, 1), (16, 1)],
  term ((-2032891058161444805350684951276800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (4, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((29816857424258674719539268184372800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (4, 1), (6, 1), (7, 1), (15, 2), (16, 1)],
  term ((166741629986610000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (4, 1), (6, 1), (10, 1), (11, 1), (16, 1)],
  term ((398483667050487750 : Rat) / 692956453614176359) [(2, 1), (3, 1), (4, 1), (6, 1), (10, 1), (13, 1), (16, 1)],
  term ((-956121245529929599387752468504337766400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (4, 1), (6, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-58576465092935895420021750461658590283600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (4, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((-2977529106903750 : Rat) / 23895050124626771) [(2, 1), (3, 1), (4, 1), (6, 1), (11, 1), (16, 1)],
  term ((1071122173053087783 : Rat) / 2771825814456705436) [(2, 1), (3, 1), (4, 1), (6, 1), (13, 1), (16, 1)],
  term ((956121245529929599387752468504337766400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (4, 1), (6, 1), (13, 2), (15, 1), (16, 1)],
  term ((-856393736766946513716279451750739612635859 : Rat) / 674830407405318061502963313035932218791992) [(2, 1), (3, 1), (4, 1), (6, 1), (15, 1), (16, 1)],
  term ((1309713063263939242788961168955829600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (4, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-12042986513724593559 : Rat) / 2771825814456705436) [(2, 1), (3, 1), (4, 1), (7, 1), (13, 2), (16, 1)],
  term ((-60831134801765854767554717138804784000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (4, 1), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((-85252405418669994102534877904289600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (4, 1), (7, 1), (15, 2), (16, 1)],
  term ((-675712013698157305 : Rat) / 382320801994028336) [(2, 1), (3, 1), (4, 1), (7, 1), (16, 1)],
  term ((-1675358026164136926571227068819462400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (4, 1), (7, 2), (13, 2), (15, 1), (16, 1)],
  term ((20227939171440866357876848604592000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (4, 1), (7, 2), (15, 1), (16, 1)],
  term ((78173987841078575882094280687715020800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (4, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-140649573864425400 : Rat) / 692956453614176359) [(2, 1), (3, 1), (4, 1), (9, 1), (16, 1)],
  term ((-202471979269455000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (4, 1), (10, 1), (11, 1), (16, 1)],
  term ((130289979735130959803490467812858368000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (4, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-9851589005946205500 : Rat) / 692956453614176359) [(2, 1), (3, 1), (4, 1), (10, 1), (13, 1), (16, 1)],
  term ((869201132299935999443411335003943424000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (4, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-59161612613078618693653655551145612668200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (4, 1), (10, 1), (15, 1), (16, 1)],
  term ((-5771878227521051779407029633725389854400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (4, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-39307568138348598000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (4, 1), (11, 1), (13, 2), (16, 1)],
  term ((-3254069622508807868996952045864490790400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (4, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((-1898190252673399125 : Rat) / 5543651628913410872) [(2, 1), (3, 1), (4, 1), (11, 1), (16, 1)],
  term ((43870091723907405560887831547807298121200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (4, 1), (12, 1), (15, 1), (16, 1)],
  term ((2828048633893029979996502842293557904000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (4, 1), (13, 1), (15, 2), (16, 1)],
  term ((166578576640688464947 : Rat) / 11087303257826821744) [(2, 1), (3, 1), (4, 1), (13, 1), (16, 1)],
  term ((-61713404063188281942166573704323152300800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (4, 1), (13, 2), (15, 1), (16, 1)],
  term ((1204593909789456321194254797107303210640017 : Rat) / 674830407405318061502963313035932218791992) [(2, 1), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((104416779069615799933109050276094400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (4, 2), (15, 1), (16, 1)],
  term ((258163701531813679386786322024396800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (6, 1), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((56947875337900076335320512211264000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (6, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-243287247099572642897299521553132800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (6, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((26206029632578722234877488450693454515193080 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (5, 1), (6, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1290818507659068396933931610121984000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (6, 1), (7, 1), (13, 2), (15, 3), (16, 1)],
  term ((610382247336684897903099289738727714342349 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (3, 1), (5, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((234731602944197820554250777933686400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (6, 1), (7, 1), (15, 3), (16, 1)],
  term ((1290818507659068396933931610121984000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (6, 1), (7, 2), (13, 2), (15, 2), (16, 1)],
  term ((22779150135160030534128204884505600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (6, 1), (7, 2), (15, 2), (16, 1)],
  term ((291292619201952750 : Rat) / 692956453614176359) [(2, 1), (3, 1), (5, 1), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((-956121245529929599387752468504337766400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (5, 1), (6, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-65100664603647940708000086894520721351100 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (5, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((166741629986610000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (5, 1), (6, 1), (11, 2), (16, 1)],
  term ((43055889034018111896 : Rat) / 692956453614176359) [(2, 1), (3, 1), (5, 1), (6, 1), (12, 1), (13, 2), (16, 1)],
  term ((19856540141026962045 : Rat) / 1385912907228352718) [(2, 1), (3, 1), (5, 1), (6, 1), (12, 1), (16, 1)],
  term ((3150198259522754926630711329761062312316570 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (5, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-215279445170090559480 : Rat) / 692956453614176359) [(2, 1), (3, 1), (5, 1), (6, 1), (13, 2), (15, 2), (16, 1)],
  term ((-29523115040774172297 : Rat) / 692956453614176359) [(2, 1), (3, 1), (5, 1), (6, 1), (13, 2), (16, 1)],
  term ((-3064200577502922368023043764130455708609033 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (3, 1), (5, 1), (6, 1), (15, 2), (16, 1)],
  term ((59581023259357560165 : Rat) / 2771825814456705436) [(2, 1), (3, 1), (5, 1), (6, 1), (16, 1)],
  term ((-645409253829534198466965805060992000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (6, 2), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-11389575067580015267064102442252800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (6, 2), (7, 1), (15, 1), (16, 1)],
  term ((-107639722585045279740 : Rat) / 692956453614176359) [(2, 1), (3, 1), (5, 1), (6, 2), (13, 2), (16, 1)],
  term ((-5014213127946281709 : Rat) / 2771825814456705436) [(2, 1), (3, 1), (5, 1), (6, 2), (16, 1)],
  term ((-839032029978394458007055546579289600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((18803410410932496985892709866427557920350 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-11083799995251317146644258726299583271125 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (9, 1), (15, 1), (16, 1)],
  term ((14423181750135707291662327260040033405200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (9, 1), (15, 3), (16, 1)],
  term ((10418969850877602000 : Rat) / 692956453614176359) [(2, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((2894158291910445000 : Rat) / 692956453614176359) [(2, 1), (10, 1), (12, 1), (16, 1)],
  term ((4007784707742375 : Rat) / 692956453614176359) [(2, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1033772499319014877156923414058624213092000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((-304220396304977599805193967251380198400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((608710570930428358735024014798190779990075 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (10, 1), (15, 2), (16, 1)],
  term ((-1832966918209948500 : Rat) / 692956453614176359) [(2, 1), (10, 1), (16, 1)],
  term ((5034935797694107436918514247400820297600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((4764553713739224000 : Rat) / 692956453614176359) [(2, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((3781377317970013320911736094153706481736800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((2563812429855424381633962217953841228800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (11, 1), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((-190203111777822410034369517077194951080125 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((773442834126217199712017935279189131902400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-4157495168227792917037311132093583468800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (11, 1), (13, 1), (15, 4), (16, 1)],
  term ((-3573415285304418000 : Rat) / 692956453614176359) [(2, 1), (11, 1), (13, 1), (16, 1)],
  term ((136418734184946963260620674990683630300400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-2884701503139867449302812529410960668625600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (11, 1), (13, 2), (15, 3), (16, 1)],
  term ((98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((-1972163407581095678179970936887570176000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (11, 1), (13, 3), (15, 4), (16, 1)],
  term ((-37116077819898225663389872120562644227750 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (11, 1), (15, 1), (16, 1)],
  term ((9144362709899146948734428935040000278875 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (11, 1), (15, 3), (16, 1)],
  term ((-5901778635813679521030208707116750563511985 : Rat) / 674830407405318061502963313035932218791992) [(2, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1957025244783008681222921652159444038400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((47828072579908271067309536364465423936000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-321493902582049527785834440448537089002150 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (12, 1), (15, 2), (16, 1)],
  term ((3529179131355380613 : Rat) / 5543651628913410872) [(2, 1), (12, 1), (16, 1)],
  term ((2423628158338250340915715481932147009247451 : Rat) / 1349660814810636123005926626071864437583984) [(2, 1), (13, 1), (15, 1), (16, 1)],
  term ((2695190269413799169800112585706713376692913 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (13, 1), (15, 3), (16, 1)],
  term ((2566156707349755598848410333874300700800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (13, 2), (15, 2), (16, 1)],
  term ((-34679115264387073690690337739212889177600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (13, 2), (15, 4), (16, 1)],
  term ((-639075239394064851664757191995962577125045 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (15, 2), (16, 1)],
  term ((20196228687940276989083986479503878576800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (15, 4), (16, 1)],
  term ((14671335156506179311 : Rat) / 22174606515653643488) [(2, 1), (16, 1)],
  term ((-37606820821864993971785419732855115840700 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((78173987841078575882094280687715020800 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((11083799995251317146644258726299583271125 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (9, 1), (15, 1), (16, 1)],
  term ((-28846363500271414583324654520080066810400 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (9, 1), (15, 3), (16, 1)],
  term ((-20837939701755204000 : Rat) / 692956453614176359) [(2, 2), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5788316583820890000 : Rat) / 692956453614176359) [(2, 2), (10, 1), (12, 1), (16, 1)],
  term ((-8015569415484750 : Rat) / 692956453614176359) [(2, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((2067544998638029754313846828117248426184000 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((608440792609955199610387934502760396800 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((-608710570930428358735024014798190779990075 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (10, 1), (15, 2), (16, 1)],
  term ((3665933836419897000 : Rat) / 692956453614176359) [(2, 2), (10, 1), (16, 1)],
  term ((-10069871595388214873837028494801640595200 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-9529107427478448000 : Rat) / 692956453614176359) [(2, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-7562754635940026641823472188307412963473600 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-5127624859710848763267924435907682457600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (11, 1), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((190203111777822410034369517077194951080125 : Rat) / 168707601851329515375740828258983054697998) [(2, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1546885668252434399424035870558378263804800 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((8314990336455585834074622264187166937600 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (11, 1), (13, 1), (15, 4), (16, 1)],
  term ((7146830570608836000 : Rat) / 692956453614176359) [(2, 2), (11, 1), (13, 1), (16, 1)],
  term ((-272837468369893926521241349981367260600800 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((5769403006279734898605625058821921337251200 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (11, 1), (13, 2), (15, 3), (16, 1)],
  term ((-197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((3944326815162191356359941873775140352000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (11, 1), (13, 3), (15, 4), (16, 1)],
  term ((74232155639796451326779744241125288455500 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (11, 1), (15, 1), (16, 1)],
  term ((-9144362709899146948734428935040000278875 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (11, 1), (15, 3), (16, 1)],
  term ((5901778635813679521030208707116750563511985 : Rat) / 337415203702659030751481656517966109395996) [(2, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((3914050489566017362445843304318888076800 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-95656145159816542134619072728930847872000 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((642987805164099055571668880897074178004300 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (12, 1), (15, 2), (16, 1)],
  term ((-3529179131355380613 : Rat) / 2771825814456705436) [(2, 2), (12, 1), (16, 1)],
  term ((-2423628158338250340915715481932147009247451 : Rat) / 674830407405318061502963313035932218791992) [(2, 2), (13, 1), (15, 1), (16, 1)],
  term ((-2695190269413799169800112585706713376692913 : Rat) / 168707601851329515375740828258983054697998) [(2, 2), (13, 1), (15, 3), (16, 1)],
  term ((-5132313414699511197696820667748601401600 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (13, 2), (15, 2), (16, 1)],
  term ((69358230528774147381380675478425778355200 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (13, 2), (15, 4), (16, 1)],
  term ((639075239394064851664757191995962577125045 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (15, 2), (16, 1)],
  term ((-40392457375880553978167972959007757153600 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (15, 4), (16, 1)],
  term ((-14671335156506179311 : Rat) / 11087303257826821744) [(2, 2), (16, 1)],
  term ((-532462634409365713735246789175318400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (5, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-6169353161605841602993055489553600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-177605542265324711571 : Rat) / 1385912907228352718) [(3, 1), (4, 1), (5, 1), (13, 2), (16, 1)],
  term ((-226716461880282438369 : Rat) / 22174606515653643488) [(3, 1), (4, 1), (5, 1), (16, 1)],
  term ((1016445529080722402675342475638400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-14908428712129337359769634092186400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (6, 1), (7, 1), (15, 2), (16, 1)],
  term ((-83370814993305000 : Rat) / 692956453614176359) [(3, 1), (4, 1), (6, 1), (10, 1), (11, 1), (16, 1)],
  term ((-199241833525243875 : Rat) / 692956453614176359) [(3, 1), (4, 1), (6, 1), (10, 1), (13, 1), (16, 1)],
  term ((478060622764964799693876234252168883200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (6, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((29288232546467947710010875230829295141800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((1488764553451875 : Rat) / 23895050124626771) [(3, 1), (4, 1), (6, 1), (11, 1), (16, 1)],
  term ((-1071122173053087783 : Rat) / 5543651628913410872) [(3, 1), (4, 1), (6, 1), (13, 1), (16, 1)],
  term ((-478060622764964799693876234252168883200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (6, 1), (13, 2), (15, 1), (16, 1)],
  term ((856393736766946513716279451750739612635859 : Rat) / 1349660814810636123005926626071864437583984) [(3, 1), (4, 1), (6, 1), (15, 1), (16, 1)],
  term ((-654856531631969621394480584477914800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((12042986513724593559 : Rat) / 5543651628913410872) [(3, 1), (4, 1), (7, 1), (13, 2), (16, 1)],
  term ((30415567400882927383777358569402392000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((42626202709334997051267438952144800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 1), (15, 2), (16, 1)],
  term ((675712013698157305 : Rat) / 764641603988056672) [(3, 1), (4, 1), (7, 1), (16, 1)],
  term ((837679013082068463285613534409731200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 2), (13, 2), (15, 1), (16, 1)],
  term ((-10113969585720433178938424302296000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (7, 2), (15, 1), (16, 1)],
  term ((-39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((70324786932212700 : Rat) / 692956453614176359) [(3, 1), (4, 1), (9, 1), (16, 1)],
  term ((101235989634727500 : Rat) / 692956453614176359) [(3, 1), (4, 1), (10, 1), (11, 1), (16, 1)],
  term ((-65144989867565479901745233906429184000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((4925794502973102750 : Rat) / 692956453614176359) [(3, 1), (4, 1), (10, 1), (13, 1), (16, 1)],
  term ((-434600566149967999721705667501971712000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((29580806306539309346826827775572806334100 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (10, 1), (15, 1), (16, 1)],
  term ((2885939113760525889703514816862694927200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((19653784069174299000 : Rat) / 692956453614176359) [(3, 1), (4, 1), (11, 1), (13, 2), (16, 1)],
  term ((1627034811254403934498476022932245395200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((1898190252673399125 : Rat) / 11087303257826821744) [(3, 1), (4, 1), (11, 1), (16, 1)],
  term ((-21935045861953702780443915773903649060600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1414024316946514989998251421146778952000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (13, 1), (15, 2), (16, 1)],
  term ((-166578576640688464947 : Rat) / 22174606515653643488) [(3, 1), (4, 1), (13, 1), (16, 1)],
  term ((30856702031594140971083286852161576150400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1204593909789456321194254797107303210640017 : Rat) / 1349660814810636123005926626071864437583984) [(3, 1), (4, 1), (15, 1), (16, 1)],
  term ((-52208389534807899966554525138047200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 2), (15, 1), (16, 1)],
  term ((-129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-28473937668950038167660256105632000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((121643623549786321448649760776566400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-13103014816289361117438744225346727257596540 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (6, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((645409253829534198466965805060992000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 1), (13, 2), (15, 3), (16, 1)],
  term ((-610382247336684897903099289738727714342349 : Rat) / 337415203702659030751481656517966109395996) [(3, 1), (5, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-117365801472098910277125388966843200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 1), (15, 3), (16, 1)],
  term ((-645409253829534198466965805060992000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 2), (13, 2), (15, 2), (16, 1)],
  term ((-11389575067580015267064102442252800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 1), (7, 2), (15, 2), (16, 1)],
  term ((-145646309600976375 : Rat) / 692956453614176359) [(3, 1), (5, 1), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((478060622764964799693876234252168883200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (6, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((32550332301823970354000043447260360675550 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-83370814993305000 : Rat) / 692956453614176359) [(3, 1), (5, 1), (6, 1), (11, 2), (16, 1)],
  term ((-21527944517009055948 : Rat) / 692956453614176359) [(3, 1), (5, 1), (6, 1), (12, 1), (13, 2), (16, 1)],
  term ((-19856540141026962045 : Rat) / 2771825814456705436) [(3, 1), (5, 1), (6, 1), (12, 1), (16, 1)],
  term ((-1575099129761377463315355664880531156158285 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((107639722585045279740 : Rat) / 692956453614176359) [(3, 1), (5, 1), (6, 1), (13, 2), (15, 2), (16, 1)],
  term ((29523115040774172297 : Rat) / 1385912907228352718) [(3, 1), (5, 1), (6, 1), (13, 2), (16, 1)],
  term ((3064200577502922368023043764130455708609033 : Rat) / 674830407405318061502963313035932218791992) [(3, 1), (5, 1), (6, 1), (15, 2), (16, 1)],
  term ((-59581023259357560165 : Rat) / 5543651628913410872) [(3, 1), (5, 1), (6, 1), (16, 1)],
  term ((322704626914767099233482902530496000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 2), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((5694787533790007633532051221126400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 2), (7, 1), (15, 1), (16, 1)],
  term ((53819861292522639870 : Rat) / 692956453614176359) [(3, 1), (5, 1), (6, 2), (13, 2), (16, 1)],
  term ((5014213127946281709 : Rat) / 5543651628913410872) [(3, 1), (5, 1), (6, 2), (16, 1)],
  term ((419516014989197229003527773289644800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 9, terms 300 through 399. -/
theorem ep_Q2_008_block_09_0300_0399_valid :
    checkProductSumEq ep_Q2_008_partials_09_0300_0399
      ep_Q2_008_block_09_0300_0399 = true := by
  native_decide

end EpQ2008TermShards

end Patterns

end EndpointCertificate

end Problem97
