/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_008, term block 9:400-499

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_008`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2008TermShards

/-- Generator polynomial 9 for endpoint certificate `ep_Q2_008`. -/
def ep_Q2_008_generator_09_0400_0499 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(2, 1)]
]

/-- Coefficient term 400 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0400 : Poly :=
[
  term ((-26575675157686702289816239031923200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 400 for generator 9. -/
def ep_Q2_008_partial_09_0400 : Poly :=
[
  term ((-53151350315373404579632478063846400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((26575675157686702289816239031923200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 400 for generator 9. -/
theorem ep_Q2_008_partial_09_0400_valid :
    mulPoly ep_Q2_008_coefficient_09_0400
        ep_Q2_008_generator_09_0400_0499 =
      ep_Q2_008_partial_09_0400 := by
  native_decide

/-- Coefficient term 401 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0401 : Poly :=
[
  term ((717013129354129657922980949094002400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 401 for generator 9. -/
def ep_Q2_008_partial_09_0401 : Poly :=
[
  term ((1434026258708259315845961898188004800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-717013129354129657922980949094002400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 401 for generator 9. -/
theorem ep_Q2_008_partial_09_0401_valid :
    mulPoly ep_Q2_008_coefficient_09_0401
        ep_Q2_008_generator_09_0400_0499 =
      ep_Q2_008_partial_09_0401 := by
  native_decide

/-- Coefficient term 402 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0402 : Poly :=
[
  term ((-4858939462685558847 : Rat) / 5543651628913410872) [(3, 1), (5, 1), (7, 1), (13, 1), (16, 1)]
]

/-- Partial product 402 for generator 9. -/
def ep_Q2_008_partial_09_0402 : Poly :=
[
  term ((-4858939462685558847 : Rat) / 2771825814456705436) [(2, 1), (3, 1), (5, 1), (7, 1), (13, 1), (16, 1)],
  term ((4858939462685558847 : Rat) / 5543651628913410872) [(3, 1), (5, 1), (7, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 402 for generator 9. -/
theorem ep_Q2_008_partial_09_0402_valid :
    mulPoly ep_Q2_008_coefficient_09_0402
        ep_Q2_008_generator_09_0400_0499 =
      ep_Q2_008_partial_09_0402 := by
  native_decide

/-- Coefficient term 403 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0403 : Poly :=
[
  term ((-25539819087116796181156375156582215252922335 : Rat) / 337415203702659030751481656517966109395996) [(3, 1), (5, 1), (7, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 403 for generator 9. -/
def ep_Q2_008_partial_09_0403 : Poly :=
[
  term ((-25539819087116796181156375156582215252922335 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (3, 1), (5, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((25539819087116796181156375156582215252922335 : Rat) / 337415203702659030751481656517966109395996) [(3, 1), (5, 1), (7, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 403 for generator 9. -/
theorem ep_Q2_008_partial_09_0403_valid :
    mulPoly ep_Q2_008_coefficient_09_0403
        ep_Q2_008_generator_09_0400_0499 =
      ep_Q2_008_partial_09_0403 := by
  native_decide

/-- Coefficient term 404 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0404 : Poly :=
[
  term ((322704626914767099233482902530496000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (13, 2), (15, 3), (16, 1)]
]

/-- Partial product 404 for generator 9. -/
def ep_Q2_008_partial_09_0404 : Poly :=
[
  term ((645409253829534198466965805060992000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (7, 1), (13, 2), (15, 3), (16, 1)],
  term ((-322704626914767099233482902530496000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 404 for generator 9. -/
theorem ep_Q2_008_partial_09_0404_valid :
    mulPoly ep_Q2_008_coefficient_09_0404
        ep_Q2_008_generator_09_0400_0499 =
      ep_Q2_008_partial_09_0404 := by
  native_decide

/-- Coefficient term 405 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0405 : Poly :=
[
  term ((27650515818984479439797598699456720000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (13, 3), (15, 2), (16, 1)]
]

/-- Partial product 405 for generator 9. -/
def ep_Q2_008_partial_09_0405 : Poly :=
[
  term ((55301031637968958879595197398913440000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (7, 1), (13, 3), (15, 2), (16, 1)],
  term ((-27650515818984479439797598699456720000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 405 for generator 9. -/
theorem ep_Q2_008_partial_09_0405_valid :
    mulPoly ep_Q2_008_coefficient_09_0405
        ep_Q2_008_generator_09_0400_0499 =
      ep_Q2_008_partial_09_0405 := by
  native_decide

/-- Coefficient term 406 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0406 : Poly :=
[
  term ((-5474084778965724345 : Rat) / 1385912907228352718) [(3, 1), (5, 1), (7, 1), (13, 3), (16, 1)]
]

/-- Partial product 406 for generator 9. -/
def ep_Q2_008_partial_09_0406 : Poly :=
[
  term ((-5474084778965724345 : Rat) / 692956453614176359) [(2, 1), (3, 1), (5, 1), (7, 1), (13, 3), (16, 1)],
  term ((5474084778965724345 : Rat) / 1385912907228352718) [(3, 1), (5, 1), (7, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 406 for generator 9. -/
theorem ep_Q2_008_partial_09_0406_valid :
    mulPoly ep_Q2_008_coefficient_09_0406
        ep_Q2_008_generator_09_0400_0499 =
      ep_Q2_008_partial_09_0406 := by
  native_decide

/-- Coefficient term 407 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0407 : Poly :=
[
  term ((-55301031637968958879595197398913440000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (13, 4), (15, 1), (16, 1)]
]

/-- Partial product 407 for generator 9. -/
def ep_Q2_008_partial_09_0407 : Poly :=
[
  term ((-110602063275937917759190394797826880000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (7, 1), (13, 4), (15, 1), (16, 1)],
  term ((55301031637968958879595197398913440000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (13, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 407 for generator 9. -/
theorem ep_Q2_008_partial_09_0407_valid :
    mulPoly ep_Q2_008_coefficient_09_0407
        ep_Q2_008_generator_09_0400_0499 =
      ep_Q2_008_partial_09_0407 := by
  native_decide

/-- Coefficient term 408 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0408 : Poly :=
[
  term ((-629272858250546574114891769925392339507131 : Rat) / 1349660814810636123005926626071864437583984) [(3, 1), (5, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 408 for generator 9. -/
def ep_Q2_008_partial_09_0408 : Poly :=
[
  term ((-629272858250546574114891769925392339507131 : Rat) / 674830407405318061502963313035932218791992) [(2, 1), (3, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((629272858250546574114891769925392339507131 : Rat) / 1349660814810636123005926626071864437583984) [(3, 1), (5, 1), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 408 for generator 9. -/
theorem ep_Q2_008_partial_09_0408_valid :
    mulPoly ep_Q2_008_coefficient_09_0408
        ep_Q2_008_generator_09_0400_0499 =
      ep_Q2_008_partial_09_0408 := by
  native_decide

/-- Coefficient term 409 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0409 : Poly :=
[
  term ((-104710718063676671091498608475451200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (15, 3), (16, 1)]
]

/-- Partial product 409 for generator 9. -/
def ep_Q2_008_partial_09_0409 : Poly :=
[
  term ((-209421436127353342182997216950902400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (7, 1), (15, 3), (16, 1)],
  term ((104710718063676671091498608475451200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 409 for generator 9. -/
theorem ep_Q2_008_partial_09_0409_valid :
    mulPoly ep_Q2_008_coefficient_09_0409
        ep_Q2_008_generator_09_0400_0499 =
      ep_Q2_008_partial_09_0409 := by
  native_decide

/-- Coefficient term 410 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0410 : Poly :=
[
  term ((-14095608860232004709948126781369600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 410 for generator 9. -/
def ep_Q2_008_partial_09_0410 : Poly :=
[
  term ((-28191217720464009419896253562739200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((14095608860232004709948126781369600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 410 for generator 9. -/
theorem ep_Q2_008_partial_09_0410_valid :
    mulPoly ep_Q2_008_coefficient_09_0410
        ep_Q2_008_generator_09_0400_0499 =
      ep_Q2_008_partial_09_0410 := by
  native_decide

/-- Coefficient term 411 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0411 : Poly :=
[
  term ((438821748614386049207983946932896000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 2), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 411 for generator 9. -/
def ep_Q2_008_partial_09_0411 : Poly :=
[
  term ((877643497228772098415967893865792000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (7, 2), (13, 2), (15, 2), (16, 1)],
  term ((-438821748614386049207983946932896000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 411 for generator 9. -/
theorem ep_Q2_008_partial_09_0411_valid :
    mulPoly ep_Q2_008_coefficient_09_0411
        ep_Q2_008_generator_09_0400_0499 =
      ep_Q2_008_partial_09_0411 := by
  native_decide

/-- Coefficient term 412 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0412 : Poly :=
[
  term ((-1523052751058306296882933698926784000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 2), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 412 for generator 9. -/
def ep_Q2_008_partial_09_0412 : Poly :=
[
  term ((-3046105502116612593765867397853568000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (7, 2), (13, 3), (15, 1), (16, 1)],
  term ((1523052751058306296882933698926784000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 2), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 412 for generator 9. -/
theorem ep_Q2_008_partial_09_0412_valid :
    mulPoly ep_Q2_008_coefficient_09_0412
        ep_Q2_008_generator_09_0400_0499 =
      ep_Q2_008_partial_09_0412 := by
  native_decide

/-- Coefficient term 413 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0413 : Poly :=
[
  term ((1353016896325994721442012169558400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 2), (15, 2), (16, 1)]
]

/-- Partial product 413 for generator 9. -/
def ep_Q2_008_partial_09_0413 : Poly :=
[
  term ((2706033792651989442884024339116800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (7, 2), (15, 2), (16, 1)],
  term ((-1353016896325994721442012169558400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 413 for generator 9. -/
theorem ep_Q2_008_partial_09_0413_valid :
    mulPoly ep_Q2_008_coefficient_09_0413
        ep_Q2_008_generator_09_0400_0499 =
      ep_Q2_008_partial_09_0413 := by
  native_decide

/-- Coefficient term 414 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0414 : Poly :=
[
  term ((6367148242202979000 : Rat) / 692956453614176359) [(3, 1), (5, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 414 for generator 9. -/
def ep_Q2_008_partial_09_0414 : Poly :=
[
  term ((12734296484405958000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (5, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-6367148242202979000 : Rat) / 692956453614176359) [(3, 1), (5, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 414 for generator 9. -/
theorem ep_Q2_008_partial_09_0414_valid :
    mulPoly ep_Q2_008_coefficient_09_0414
        ep_Q2_008_generator_09_0400_0499 =
      ep_Q2_008_partial_09_0414 := by
  native_decide

/-- Coefficient term 415 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0415 : Poly :=
[
  term ((-12734296484405958000 : Rat) / 692956453614176359) [(3, 1), (5, 1), (10, 1), (13, 2), (16, 1)]
]

/-- Partial product 415 for generator 9. -/
def ep_Q2_008_partial_09_0415 : Poly :=
[
  term ((-25468592968811916000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (5, 1), (10, 1), (13, 2), (16, 1)],
  term ((12734296484405958000 : Rat) / 692956453614176359) [(3, 1), (5, 1), (10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 415 for generator 9. -/
theorem ep_Q2_008_partial_09_0415_valid :
    mulPoly ep_Q2_008_coefficient_09_0415
        ep_Q2_008_generator_09_0400_0499 =
      ep_Q2_008_partial_09_0415 := by
  native_decide

/-- Coefficient term 416 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0416 : Poly :=
[
  term ((3073334195636893420345533500759517537600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 416 for generator 9. -/
def ep_Q2_008_partial_09_0416 : Poly :=
[
  term ((6146668391273786840691067001519035075200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (5, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-3073334195636893420345533500759517537600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 416 for generator 9. -/
theorem ep_Q2_008_partial_09_0416_valid :
    mulPoly ep_Q2_008_coefficient_09_0416
        ep_Q2_008_generator_09_0400_0499 =
      ep_Q2_008_partial_09_0416 := by
  native_decide

/-- Coefficient term 417 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0417 : Poly :=
[
  term ((-1585796188954766625 : Rat) / 2771825814456705436) [(3, 1), (5, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 417 for generator 9. -/
def ep_Q2_008_partial_09_0417 : Poly :=
[
  term ((-1585796188954766625 : Rat) / 1385912907228352718) [(2, 1), (3, 1), (5, 1), (11, 1), (13, 1), (16, 1)],
  term ((1585796188954766625 : Rat) / 2771825814456705436) [(3, 1), (5, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 417 for generator 9. -/
theorem ep_Q2_008_partial_09_0417_valid :
    mulPoly ep_Q2_008_coefficient_09_0417
        ep_Q2_008_generator_09_0400_0499 =
      ep_Q2_008_partial_09_0417 := by
  native_decide

/-- Coefficient term 418 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0418 : Poly :=
[
  term ((74795070242723435774817555158888808891600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 418 for generator 9. -/
def ep_Q2_008_partial_09_0418 : Poly :=
[
  term ((149590140485446871549635110317777617783200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-74795070242723435774817555158888808891600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 418 for generator 9. -/
theorem ep_Q2_008_partial_09_0418_valid :
    mulPoly ep_Q2_008_coefficient_09_0418
        ep_Q2_008_generator_09_0400_0499 =
      ep_Q2_008_partial_09_0418 := by
  native_decide

/-- Coefficient term 419 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0419 : Poly :=
[
  term ((1479122555685821758634978202665677632000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (11, 1), (13, 3), (15, 2), (16, 1)]
]

/-- Partial product 419 for generator 9. -/
def ep_Q2_008_partial_09_0419 : Poly :=
[
  term ((2958245111371643517269956405331355264000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((-1479122555685821758634978202665677632000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (11, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 419 for generator 9. -/
theorem ep_Q2_008_partial_09_0419_valid :
    mulPoly ep_Q2_008_coefficient_09_0419
        ep_Q2_008_generator_09_0400_0499 =
      ep_Q2_008_partial_09_0419 := by
  native_decide

/-- Coefficient term 420 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0420 : Poly :=
[
  term ((-35734152853044180000 : Rat) / 692956453614176359) [(3, 1), (5, 1), (11, 1), (13, 3), (16, 1)]
]

/-- Partial product 420 for generator 9. -/
def ep_Q2_008_partial_09_0420 : Poly :=
[
  term ((-71468305706088360000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (5, 1), (11, 1), (13, 3), (16, 1)],
  term ((35734152853044180000 : Rat) / 692956453614176359) [(3, 1), (5, 1), (11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 420 for generator 9. -/
theorem ep_Q2_008_partial_09_0420_valid :
    mulPoly ep_Q2_008_coefficient_09_0420
        ep_Q2_008_generator_09_0400_0499 =
      ep_Q2_008_partial_09_0420 := by
  native_decide

/-- Coefficient term 421 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0421 : Poly :=
[
  term ((-2958245111371643517269956405331355264000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (11, 1), (13, 4), (15, 1), (16, 1)]
]

/-- Partial product 421 for generator 9. -/
def ep_Q2_008_partial_09_0421 : Poly :=
[
  term ((-5916490222743287034539912810662710528000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (11, 1), (13, 4), (15, 1), (16, 1)],
  term ((2958245111371643517269956405331355264000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (11, 1), (13, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 421 for generator 9. -/
theorem ep_Q2_008_partial_09_0421_valid :
    mulPoly ep_Q2_008_coefficient_09_0421
        ep_Q2_008_generator_09_0400_0499 =
      ep_Q2_008_partial_09_0421 := by
  native_decide

/-- Coefficient term 422 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0422 : Poly :=
[
  term ((287781644465156882957393563816813068336075 : Rat) / 674830407405318061502963313035932218791992) [(3, 1), (5, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 422 for generator 9. -/
def ep_Q2_008_partial_09_0422 : Poly :=
[
  term ((287781644465156882957393563816813068336075 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (3, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((-287781644465156882957393563816813068336075 : Rat) / 674830407405318061502963313035932218791992) [(3, 1), (5, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 422 for generator 9. -/
theorem ep_Q2_008_partial_09_0422_valid :
    mulPoly ep_Q2_008_coefficient_09_0422
        ep_Q2_008_generator_09_0400_0499 =
      ep_Q2_008_partial_09_0422 := by
  native_decide

/-- Coefficient term 423 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0423 : Poly :=
[
  term ((-41685407496652500 : Rat) / 692956453614176359) [(3, 1), (5, 1), (11, 2), (16, 1)]
]

/-- Partial product 423 for generator 9. -/
def ep_Q2_008_partial_09_0423 : Poly :=
[
  term ((-83370814993305000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (5, 1), (11, 2), (16, 1)],
  term ((41685407496652500 : Rat) / 692956453614176359) [(3, 1), (5, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 423 for generator 9. -/
theorem ep_Q2_008_partial_09_0423_valid :
    mulPoly ep_Q2_008_coefficient_09_0423
        ep_Q2_008_generator_09_0400_0499 =
      ep_Q2_008_partial_09_0423 := by
  native_decide

/-- Coefficient term 424 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0424 : Poly :=
[
  term ((-69965819680279431831 : Rat) / 692956453614176359) [(3, 1), (5, 1), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 424 for generator 9. -/
def ep_Q2_008_partial_09_0424 : Poly :=
[
  term ((-139931639360558863662 : Rat) / 692956453614176359) [(2, 1), (3, 1), (5, 1), (12, 1), (13, 2), (16, 1)],
  term ((69965819680279431831 : Rat) / 692956453614176359) [(3, 1), (5, 1), (12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 424 for generator 9. -/
theorem ep_Q2_008_partial_09_0424_valid :
    mulPoly ep_Q2_008_coefficient_09_0424
        ep_Q2_008_generator_09_0400_0499 =
      ep_Q2_008_partial_09_0424 := by
  native_decide

/-- Coefficient term 425 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0425 : Poly :=
[
  term ((-61441337169821144829 : Rat) / 11087303257826821744) [(3, 1), (5, 1), (12, 1), (16, 1)]
]

/-- Partial product 425 for generator 9. -/
def ep_Q2_008_partial_09_0425 : Poly :=
[
  term ((-61441337169821144829 : Rat) / 5543651628913410872) [(2, 1), (3, 1), (5, 1), (12, 1), (16, 1)],
  term ((61441337169821144829 : Rat) / 11087303257826821744) [(3, 1), (5, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 425 for generator 9. -/
theorem ep_Q2_008_partial_09_0425_valid :
    mulPoly ep_Q2_008_coefficient_09_0425
        ep_Q2_008_generator_09_0400_0499 =
      ep_Q2_008_partial_09_0425 := by
  native_decide

/-- Coefficient term 426 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0426 : Poly :=
[
  term ((-8234196880166001192597465869374284590058597 : Rat) / 1349660814810636123005926626071864437583984) [(3, 1), (5, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 426 for generator 9. -/
def ep_Q2_008_partial_09_0426 : Poly :=
[
  term ((-8234196880166001192597465869374284590058597 : Rat) / 674830407405318061502963313035932218791992) [(2, 1), (3, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((8234196880166001192597465869374284590058597 : Rat) / 1349660814810636123005926626071864437583984) [(3, 1), (5, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 426 for generator 9. -/
theorem ep_Q2_008_partial_09_0426_valid :
    mulPoly ep_Q2_008_coefficient_09_0426
        ep_Q2_008_generator_09_0400_0499 =
      ep_Q2_008_partial_09_0426 := by
  native_decide

/-- Coefficient term 427 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0427 : Poly :=
[
  term ((-869937639278895207441885436235673379200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 427 for generator 9. -/
def ep_Q2_008_partial_09_0427 : Poly :=
[
  term ((-1739875278557790414883770872471346758400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (5, 1), (13, 1), (15, 3), (16, 1)],
  term ((869937639278895207441885436235673379200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 427 for generator 9. -/
theorem ep_Q2_008_partial_09_0427_valid :
    mulPoly ep_Q2_008_coefficient_09_0427
        ep_Q2_008_generator_09_0400_0499 =
      ep_Q2_008_partial_09_0427 := by
  native_decide

/-- Coefficient term 428 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0428 : Poly :=
[
  term ((6578958590964196544181354675794663614244670 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 428 for generator 9. -/
def ep_Q2_008_partial_09_0428 : Poly :=
[
  term ((13157917181928393088362709351589327228489340 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (5, 1), (13, 2), (15, 2), (16, 1)],
  term ((-6578958590964196544181354675794663614244670 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 428 for generator 9. -/
theorem ep_Q2_008_partial_09_0428_valid :
    mulPoly ep_Q2_008_coefficient_09_0428
        ep_Q2_008_generator_09_0400_0499 =
      ep_Q2_008_partial_09_0428 := by
  native_decide

/-- Coefficient term 429 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0429 : Poly :=
[
  term ((-95106792515234810787 : Rat) / 5543651628913410872) [(3, 1), (5, 1), (13, 2), (16, 1)]
]

/-- Partial product 429 for generator 9. -/
def ep_Q2_008_partial_09_0429 : Poly :=
[
  term ((-95106792515234810787 : Rat) / 2771825814456705436) [(2, 1), (3, 1), (5, 1), (13, 2), (16, 1)],
  term ((95106792515234810787 : Rat) / 5543651628913410872) [(3, 1), (5, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 429 for generator 9. -/
theorem ep_Q2_008_partial_09_0429_valid :
    mulPoly ep_Q2_008_coefficient_09_0429
        ep_Q2_008_generator_09_0400_0499 =
      ep_Q2_008_partial_09_0429 := by
  native_decide

/-- Coefficient term 430 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0430 : Poly :=
[
  term ((-51421097118124404536418161316004122662400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 430 for generator 9. -/
def ep_Q2_008_partial_09_0430 : Poly :=
[
  term ((-102842194236248809072836322632008245324800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (5, 1), (13, 3), (15, 1), (16, 1)],
  term ((51421097118124404536418161316004122662400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 430 for generator 9. -/
theorem ep_Q2_008_partial_09_0430_valid :
    mulPoly ep_Q2_008_coefficient_09_0430
        ep_Q2_008_generator_09_0400_0499 =
      ep_Q2_008_partial_09_0430 := by
  native_decide

/-- Coefficient term 431 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0431 : Poly :=
[
  term ((-258625839878818649849127289619618882679837 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (15, 2), (16, 1)]
]

/-- Partial product 431 for generator 9. -/
def ep_Q2_008_partial_09_0431 : Poly :=
[
  term ((-517251679757637299698254579239237765359674 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (5, 1), (15, 2), (16, 1)],
  term ((258625839878818649849127289619618882679837 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 431 for generator 9. -/
theorem ep_Q2_008_partial_09_0431_valid :
    mulPoly ep_Q2_008_coefficient_09_0431
        ep_Q2_008_generator_09_0400_0499 =
      ep_Q2_008_partial_09_0431 := by
  native_decide

/-- Coefficient term 432 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0432 : Poly :=
[
  term ((84315471915614805195 : Rat) / 22174606515653643488) [(3, 1), (5, 1), (16, 1)]
]

/-- Partial product 432 for generator 9. -/
def ep_Q2_008_partial_09_0432 : Poly :=
[
  term ((84315471915614805195 : Rat) / 11087303257826821744) [(2, 1), (3, 1), (5, 1), (16, 1)],
  term ((-84315471915614805195 : Rat) / 22174606515653643488) [(3, 1), (5, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 432 for generator 9. -/
theorem ep_Q2_008_partial_09_0432_valid :
    mulPoly ep_Q2_008_coefficient_09_0432
        ep_Q2_008_generator_09_0400_0499 =
      ep_Q2_008_partial_09_0432 := by
  native_decide

/-- Coefficient term 433 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0433 : Poly :=
[
  term ((17084362601370022900596153663379200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (7, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 433 for generator 9. -/
def ep_Q2_008_partial_09_0433 : Poly :=
[
  term ((34168725202740045801192307326758400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 2), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-17084362601370022900596153663379200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (7, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 433 for generator 9. -/
theorem ep_Q2_008_partial_09_0433_valid :
    mulPoly ep_Q2_008_coefficient_09_0433
        ep_Q2_008_generator_09_0400_0499 =
      ep_Q2_008_partial_09_0433 := by
  native_decide

/-- Coefficient term 434 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0434 : Poly :=
[
  term ((-484056940372150648850224353795744000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (7, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 434 for generator 9. -/
def ep_Q2_008_partial_09_0434 : Poly :=
[
  term ((-968113880744301297700448707591488000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 2), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((484056940372150648850224353795744000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (7, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 434 for generator 9. -/
theorem ep_Q2_008_partial_09_0434_valid :
    mulPoly ep_Q2_008_coefficient_09_0434
        ep_Q2_008_generator_09_0400_0499 =
      ep_Q2_008_partial_09_0434 := by
  native_decide

/-- Coefficient term 435 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0435 : Poly :=
[
  term ((968113880744301297700448707591488000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (7, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 435 for generator 9. -/
def ep_Q2_008_partial_09_0435 : Poly :=
[
  term ((1936227761488602595400897415182976000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 2), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((-968113880744301297700448707591488000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (7, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 435 for generator 9. -/
theorem ep_Q2_008_partial_09_0435_valid :
    mulPoly ep_Q2_008_coefficient_09_0435
        ep_Q2_008_generator_09_0400_0499 =
      ep_Q2_008_partial_09_0435 := by
  native_decide

/-- Coefficient term 436 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0436 : Poly :=
[
  term ((-8542181300685011450298076831689600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (7, 1), (15, 2), (16, 1)]
]

/-- Partial product 436 for generator 9. -/
def ep_Q2_008_partial_09_0436 : Poly :=
[
  term ((-17084362601370022900596153663379200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 2), (7, 1), (15, 2), (16, 1)],
  term ((8542181300685011450298076831689600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (7, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 436 for generator 9. -/
theorem ep_Q2_008_partial_09_0436_valid :
    mulPoly ep_Q2_008_coefficient_09_0436
        ep_Q2_008_generator_09_0400_0499 =
      ep_Q2_008_partial_09_0436 := by
  native_decide

/-- Coefficient term 437 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0437 : Poly :=
[
  term ((15042639383838845127 : Rat) / 5543651628913410872) [(3, 1), (5, 2), (13, 1), (16, 1)]
]

/-- Partial product 437 for generator 9. -/
def ep_Q2_008_partial_09_0437 : Poly :=
[
  term ((15042639383838845127 : Rat) / 2771825814456705436) [(2, 1), (3, 1), (5, 2), (13, 1), (16, 1)],
  term ((-15042639383838845127 : Rat) / 5543651628913410872) [(3, 1), (5, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 437 for generator 9. -/
theorem ep_Q2_008_partial_09_0437_valid :
    mulPoly ep_Q2_008_coefficient_09_0437
        ep_Q2_008_generator_09_0400_0499 =
      ep_Q2_008_partial_09_0437 := by
  native_decide

/-- Coefficient term 438 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0438 : Poly :=
[
  term ((-80729791938783959805 : Rat) / 692956453614176359) [(3, 1), (5, 2), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 438 for generator 9. -/
def ep_Q2_008_partial_09_0438 : Poly :=
[
  term ((-161459583877567919610 : Rat) / 692956453614176359) [(2, 1), (3, 1), (5, 2), (13, 2), (15, 1), (16, 1)],
  term ((80729791938783959805 : Rat) / 692956453614176359) [(3, 1), (5, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 438 for generator 9. -/
theorem ep_Q2_008_partial_09_0438_valid :
    mulPoly ep_Q2_008_coefficient_09_0438
        ep_Q2_008_generator_09_0400_0499 =
      ep_Q2_008_partial_09_0438 := by
  native_decide

/-- Coefficient term 439 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0439 : Poly :=
[
  term ((161459583877567919610 : Rat) / 692956453614176359) [(3, 1), (5, 2), (13, 3), (16, 1)]
]

/-- Partial product 439 for generator 9. -/
def ep_Q2_008_partial_09_0439 : Poly :=
[
  term ((322919167755135839220 : Rat) / 692956453614176359) [(2, 1), (3, 1), (5, 2), (13, 3), (16, 1)],
  term ((-161459583877567919610 : Rat) / 692956453614176359) [(3, 1), (5, 2), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 439 for generator 9. -/
theorem ep_Q2_008_partial_09_0439_valid :
    mulPoly ep_Q2_008_coefficient_09_0439
        ep_Q2_008_generator_09_0400_0499 =
      ep_Q2_008_partial_09_0439 := by
  native_decide

/-- Coefficient term 440 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0440 : Poly :=
[
  term ((-15042639383838845127 : Rat) / 11087303257826821744) [(3, 1), (5, 2), (15, 1), (16, 1)]
]

/-- Partial product 440 for generator 9. -/
def ep_Q2_008_partial_09_0440 : Poly :=
[
  term ((-15042639383838845127 : Rat) / 5543651628913410872) [(2, 1), (3, 1), (5, 2), (15, 1), (16, 1)],
  term ((15042639383838845127 : Rat) / 11087303257826821744) [(3, 1), (5, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 440 for generator 9. -/
theorem ep_Q2_008_partial_09_0440_valid :
    mulPoly ep_Q2_008_coefficient_09_0440
        ep_Q2_008_generator_09_0400_0499 =
      ep_Q2_008_partial_09_0440 := by
  native_decide

/-- Coefficient term 441 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0441 : Poly :=
[
  term ((-8489530989603972000 : Rat) / 692956453614176359) [(3, 1), (6, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 441 for generator 9. -/
def ep_Q2_008_partial_09_0441 : Poly :=
[
  term ((-16979061979207944000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (6, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((8489530989603972000 : Rat) / 692956453614176359) [(3, 1), (6, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 441 for generator 9. -/
theorem ep_Q2_008_partial_09_0441_valid :
    mulPoly ep_Q2_008_coefficient_09_0441
        ep_Q2_008_generator_09_0400_0499 =
      ep_Q2_008_partial_09_0441 := by
  native_decide

/-- Coefficient term 442 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0442 : Poly :=
[
  term ((-4097778927515857893794044667679356716800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (7, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 442 for generator 9. -/
def ep_Q2_008_partial_09_0442 : Poly :=
[
  term ((-8195557855031715787588089335358713433600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (6, 1), (7, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((4097778927515857893794044667679356716800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (7, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 442 for generator 9. -/
theorem ep_Q2_008_partial_09_0442_valid :
    mulPoly ep_Q2_008_coefficient_09_0442
        ep_Q2_008_generator_09_0400_0499 =
      ep_Q2_008_partial_09_0442 := by
  native_decide

/-- Coefficient term 443 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0443 : Poly :=
[
  term ((-23822768568696120000 : Rat) / 692956453614176359) [(3, 1), (6, 1), (7, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 443 for generator 9. -/
def ep_Q2_008_partial_09_0443 : Poly :=
[
  term ((-47645537137392240000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (6, 1), (7, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((23822768568696120000 : Rat) / 692956453614176359) [(3, 1), (6, 1), (7, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 443 for generator 9. -/
theorem ep_Q2_008_partial_09_0443_valid :
    mulPoly ep_Q2_008_coefficient_09_0443
        ep_Q2_008_generator_09_0400_0499 =
      ep_Q2_008_partial_09_0443 := by
  native_decide

/-- Coefficient term 444 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0444 : Poly :=
[
  term ((-1972163407581095678179970936887570176000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (11, 1), (13, 3), (15, 2), (16, 1)]
]

/-- Partial product 444 for generator 9. -/
def ep_Q2_008_partial_09_0444 : Poly :=
[
  term ((-3944326815162191356359941873775140352000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (6, 1), (7, 1), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((1972163407581095678179970936887570176000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (11, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 444 for generator 9. -/
theorem ep_Q2_008_partial_09_0444_valid :
    mulPoly ep_Q2_008_coefficient_09_0444
        ep_Q2_008_generator_09_0400_0499 =
      ep_Q2_008_partial_09_0444 := by
  native_decide

/-- Coefficient term 445 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0445 : Poly :=
[
  term ((25891905370046625 : Rat) / 1385912907228352718) [(3, 1), (6, 1), (7, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 445 for generator 9. -/
def ep_Q2_008_partial_09_0445 : Poly :=
[
  term ((25891905370046625 : Rat) / 692956453614176359) [(2, 1), (3, 1), (6, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-25891905370046625 : Rat) / 1385912907228352718) [(3, 1), (6, 1), (7, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 445 for generator 9. -/
theorem ep_Q2_008_partial_09_0445_valid :
    mulPoly ep_Q2_008_coefficient_09_0445
        ep_Q2_008_generator_09_0400_0499 =
      ep_Q2_008_partial_09_0445 := by
  native_decide

/-- Coefficient term 446 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0446 : Poly :=
[
  term ((-2437831289139806774469490815688416000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 446 for generator 9. -/
def ep_Q2_008_partial_09_0446 : Poly :=
[
  term ((-4875662578279613548938981631376832000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (6, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((2437831289139806774469490815688416000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 446 for generator 9. -/
theorem ep_Q2_008_partial_09_0446_valid :
    mulPoly ep_Q2_008_coefficient_09_0446
        ep_Q2_008_generator_09_0400_0499 =
      ep_Q2_008_partial_09_0446 := by
  native_decide

/-- Coefficient term 447 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0447 : Poly :=
[
  term ((-364938985264381623 : Rat) / 692956453614176359) [(3, 1), (6, 1), (7, 1), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 447 for generator 9. -/
def ep_Q2_008_partial_09_0447 : Poly :=
[
  term ((-729877970528763246 : Rat) / 692956453614176359) [(2, 1), (3, 1), (6, 1), (7, 1), (12, 1), (13, 2), (16, 1)],
  term ((364938985264381623 : Rat) / 692956453614176359) [(3, 1), (6, 1), (7, 1), (12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 447 for generator 9. -/
theorem ep_Q2_008_partial_09_0447_valid :
    mulPoly ep_Q2_008_coefficient_09_0447
        ep_Q2_008_generator_09_0400_0499 =
      ep_Q2_008_partial_09_0447 := by
  native_decide

/-- Coefficient term 448 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0448 : Poly :=
[
  term ((-7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (12, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 448 for generator 9. -/
def ep_Q2_008_partial_09_0448 : Poly :=
[
  term ((-14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (6, 1), (7, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (12, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 448 for generator 9. -/
theorem ep_Q2_008_partial_09_0448_valid :
    mulPoly ep_Q2_008_coefficient_09_0448
        ep_Q2_008_generator_09_0400_0499 =
      ep_Q2_008_partial_09_0448 := by
  native_decide

/-- Coefficient term 449 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0449 : Poly :=
[
  term ((77253225923807355326513694845457600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 449 for generator 9. -/
def ep_Q2_008_partial_09_0449 : Poly :=
[
  term ((154506451847614710653027389690915200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (6, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((-77253225923807355326513694845457600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 449 for generator 9. -/
theorem ep_Q2_008_partial_09_0449_valid :
    mulPoly ep_Q2_008_coefficient_09_0449
        ep_Q2_008_generator_09_0400_0499 =
      ep_Q2_008_partial_09_0449 := by
  native_decide

/-- Coefficient term 450 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0450 : Poly :=
[
  term ((-1663203050321205018 : Rat) / 692956453614176359) [(3, 1), (6, 1), (7, 1), (12, 1), (16, 1)]
]

/-- Partial product 450 for generator 9. -/
def ep_Q2_008_partial_09_0450 : Poly :=
[
  term ((-3326406100642410036 : Rat) / 692956453614176359) [(2, 1), (3, 1), (6, 1), (7, 1), (12, 1), (16, 1)],
  term ((1663203050321205018 : Rat) / 692956453614176359) [(3, 1), (6, 1), (7, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 450 for generator 9. -/
theorem ep_Q2_008_partial_09_0450_valid :
    mulPoly ep_Q2_008_coefficient_09_0450
        ep_Q2_008_generator_09_0400_0499 =
      ep_Q2_008_partial_09_0450 := by
  native_decide

/-- Coefficient term 451 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0451 : Poly :=
[
  term ((2598024942406442514197244265045679094530109 : Rat) / 337415203702659030751481656517966109395996) [(3, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 451 for generator 9. -/
def ep_Q2_008_partial_09_0451 : Poly :=
[
  term ((2598024942406442514197244265045679094530109 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (3, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2598024942406442514197244265045679094530109 : Rat) / 337415203702659030751481656517966109395996) [(3, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 451 for generator 9. -/
theorem ep_Q2_008_partial_09_0451_valid :
    mulPoly ep_Q2_008_coefficient_09_0451
        ep_Q2_008_generator_09_0400_0499 =
      ep_Q2_008_partial_09_0451 := by
  native_decide

/-- Coefficient term 452 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0452 : Poly :=
[
  term ((748115128448986530779677617726326400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 452 for generator 9. -/
def ep_Q2_008_partial_09_0452 : Poly :=
[
  term ((1496230256897973061559355235452652800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (6, 1), (7, 1), (13, 1), (15, 3), (16, 1)],
  term ((-748115128448986530779677617726326400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 452 for generator 9. -/
theorem ep_Q2_008_partial_09_0452_valid :
    mulPoly ep_Q2_008_coefficient_09_0452
        ep_Q2_008_generator_09_0400_0499 =
      ep_Q2_008_partial_09_0452 := by
  native_decide

/-- Coefficient term 453 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0453 : Poly :=
[
  term ((187370279015577848440484511650006777844915 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (7, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 453 for generator 9. -/
def ep_Q2_008_partial_09_0453 : Poly :=
[
  term ((374740558031155696880969023300013555689830 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (6, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((-187370279015577848440484511650006777844915 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (7, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 453 for generator 9. -/
theorem ep_Q2_008_partial_09_0453_valid :
    mulPoly ep_Q2_008_coefficient_09_0453
        ep_Q2_008_generator_09_0400_0499 =
      ep_Q2_008_partial_09_0453 := by
  native_decide

/-- Coefficient term 454 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0454 : Poly :=
[
  term ((364938985264381623 : Rat) / 1385912907228352718) [(3, 1), (6, 1), (7, 1), (13, 2), (16, 1)]
]

/-- Partial product 454 for generator 9. -/
def ep_Q2_008_partial_09_0454 : Poly :=
[
  term ((364938985264381623 : Rat) / 692956453614176359) [(2, 1), (3, 1), (6, 1), (7, 1), (13, 2), (16, 1)],
  term ((-364938985264381623 : Rat) / 1385912907228352718) [(3, 1), (6, 1), (7, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 454 for generator 9. -/
theorem ep_Q2_008_partial_09_0454_valid :
    mulPoly ep_Q2_008_coefficient_09_0454
        ep_Q2_008_generator_09_0400_0499 =
      ep_Q2_008_partial_09_0454 := by
  native_decide

/-- Coefficient term 455 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0455 : Poly :=
[
  term ((3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 455 for generator 9. -/
def ep_Q2_008_partial_09_0455 : Poly :=
[
  term ((7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (6, 1), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((-3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 455 for generator 9. -/
theorem ep_Q2_008_partial_09_0455_valid :
    mulPoly ep_Q2_008_coefficient_09_0455
        ep_Q2_008_generator_09_0400_0499 =
      ep_Q2_008_partial_09_0455 := by
  native_decide

/-- Coefficient term 456 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0456 : Poly :=
[
  term ((36867354425312639253063464932608960000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (13, 3), (15, 3), (16, 1)]
]

/-- Partial product 456 for generator 9. -/
def ep_Q2_008_partial_09_0456 : Poly :=
[
  term ((73734708850625278506126929865217920000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (6, 1), (7, 1), (13, 3), (15, 3), (16, 1)],
  term ((-36867354425312639253063464932608960000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (13, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 456 for generator 9. -/
theorem ep_Q2_008_partial_09_0456_valid :
    mulPoly ep_Q2_008_coefficient_09_0456
        ep_Q2_008_generator_09_0400_0499 =
      ep_Q2_008_partial_09_0456 := by
  native_decide

/-- Coefficient term 457 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0457 : Poly :=
[
  term ((277990372805232757453333537270683064271989 : Rat) / 337415203702659030751481656517966109395996) [(3, 1), (6, 1), (7, 1), (15, 2), (16, 1)]
]

/-- Partial product 457 for generator 9. -/
def ep_Q2_008_partial_09_0457 : Poly :=
[
  term ((277990372805232757453333537270683064271989 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (3, 1), (6, 1), (7, 1), (15, 2), (16, 1)],
  term ((-277990372805232757453333537270683064271989 : Rat) / 337415203702659030751481656517966109395996) [(3, 1), (6, 1), (7, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 457 for generator 9. -/
theorem ep_Q2_008_partial_09_0457_valid :
    mulPoly ep_Q2_008_coefficient_09_0457
        ep_Q2_008_generator_09_0400_0499 =
      ep_Q2_008_partial_09_0457 := by
  native_decide

/-- Coefficient term 458 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0458 : Poly :=
[
  term ((2535469192711327477 : Rat) / 692956453614176359) [(3, 1), (6, 1), (7, 1), (16, 1)]
]

/-- Partial product 458 for generator 9. -/
def ep_Q2_008_partial_09_0458 : Poly :=
[
  term ((5070938385422654954 : Rat) / 692956453614176359) [(2, 1), (3, 1), (6, 1), (7, 1), (16, 1)],
  term ((-2535469192711327477 : Rat) / 692956453614176359) [(3, 1), (6, 1), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 458 for generator 9. -/
theorem ep_Q2_008_partial_09_0458_valid :
    mulPoly ep_Q2_008_coefficient_09_0458
        ep_Q2_008_generator_09_0400_0499 =
      ep_Q2_008_partial_09_0458 := by
  native_decide

/-- Coefficient term 459 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0459 : Poly :=
[
  term ((-203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 2), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 459 for generator 9. -/
def ep_Q2_008_partial_09_0459 : Poly :=
[
  term ((-406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (6, 1), (7, 2), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 2), (12, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 459 for generator 9. -/
theorem ep_Q2_008_partial_09_0459_valid :
    mulPoly ep_Q2_008_coefficient_09_0459
        ep_Q2_008_generator_09_0400_0499 =
      ep_Q2_008_partial_09_0459 := by
  native_decide

/-- Coefficient term 460 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0460 : Poly :=
[
  term ((-82136876462536256671818072104236800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 2), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 460 for generator 9. -/
def ep_Q2_008_partial_09_0460 : Poly :=
[
  term ((-164273752925072513343636144208473600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (6, 1), (7, 2), (12, 1), (15, 1), (16, 1)],
  term ((82136876462536256671818072104236800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 460 for generator 9. -/
theorem ep_Q2_008_partial_09_0460_valid :
    mulPoly ep_Q2_008_coefficient_09_0460
        ep_Q2_008_generator_09_0400_0499 =
      ep_Q2_008_partial_09_0460 := by
  native_decide

/-- Coefficient term 461 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0461 : Poly :=
[
  term ((-815806361829355699530030226567516800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 2), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 461 for generator 9. -/
def ep_Q2_008_partial_09_0461 : Poly :=
[
  term ((-1631612723658711399060060453135033600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (6, 1), (7, 2), (13, 1), (15, 2), (16, 1)],
  term ((815806361829355699530030226567516800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 461 for generator 9. -/
theorem ep_Q2_008_partial_09_0461_valid :
    mulPoly ep_Q2_008_coefficient_09_0461
        ep_Q2_008_generator_09_0400_0499 =
      ep_Q2_008_partial_09_0461 := by
  native_decide

/-- Coefficient term 462 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0462 : Poly :=
[
  term ((-222117726596535147174890131749604785896115 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (7, 2), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 462 for generator 9. -/
def ep_Q2_008_partial_09_0462 : Poly :=
[
  term ((-444235453193070294349780263499209571792230 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (6, 1), (7, 2), (13, 2), (15, 1), (16, 1)],
  term ((222117726596535147174890131749604785896115 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (7, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 462 for generator 9. -/
theorem ep_Q2_008_partial_09_0462_valid :
    mulPoly ep_Q2_008_coefficient_09_0462
        ep_Q2_008_generator_09_0400_0499 =
      ep_Q2_008_partial_09_0462 := by
  native_decide

/-- Coefficient term 463 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0463 : Poly :=
[
  term ((1015368500705537531255289132617856000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 2), (13, 2), (15, 3), (16, 1)]
]

/-- Partial product 463 for generator 9. -/
def ep_Q2_008_partial_09_0463 : Poly :=
[
  term ((2030737001411075062510578265235712000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (6, 1), (7, 2), (13, 2), (15, 3), (16, 1)],
  term ((-1015368500705537531255289132617856000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 2), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 463 for generator 9. -/
theorem ep_Q2_008_partial_09_0463_valid :
    mulPoly ep_Q2_008_coefficient_09_0463
        ep_Q2_008_generator_09_0400_0499 =
      ep_Q2_008_partial_09_0463 := by
  native_decide

/-- Coefficient term 464 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0464 : Poly :=
[
  term ((-36867354425312639253063464932608960000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 2), (13, 3), (15, 2), (16, 1)]
]

/-- Partial product 464 for generator 9. -/
def ep_Q2_008_partial_09_0464 : Poly :=
[
  term ((-73734708850625278506126929865217920000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (6, 1), (7, 2), (13, 3), (15, 2), (16, 1)],
  term ((36867354425312639253063464932608960000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 2), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 464 for generator 9. -/
theorem ep_Q2_008_partial_09_0464_valid :
    mulPoly ep_Q2_008_coefficient_09_0464
        ep_Q2_008_generator_09_0400_0499 =
      ep_Q2_008_partial_09_0464 := by
  native_decide

/-- Coefficient term 465 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0465 : Poly :=
[
  term ((-197155837659907191554503247255695830527989 : Rat) / 337415203702659030751481656517966109395996) [(3, 1), (6, 1), (7, 2), (15, 1), (16, 1)]
]

/-- Partial product 465 for generator 9. -/
def ep_Q2_008_partial_09_0465 : Poly :=
[
  term ((-197155837659907191554503247255695830527989 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (3, 1), (6, 1), (7, 2), (15, 1), (16, 1)],
  term ((197155837659907191554503247255695830527989 : Rat) / 337415203702659030751481656517966109395996) [(3, 1), (6, 1), (7, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 465 for generator 9. -/
theorem ep_Q2_008_partial_09_0465_valid :
    mulPoly ep_Q2_008_coefficient_09_0465
        ep_Q2_008_generator_09_0400_0499 =
      ep_Q2_008_partial_09_0465 := by
  native_decide

/-- Coefficient term 466 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0466 : Poly :=
[
  term ((9397072573488003139965417854246400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 2), (15, 3), (16, 1)]
]

/-- Partial product 466 for generator 9. -/
def ep_Q2_008_partial_09_0466 : Poly :=
[
  term ((18794145146976006279930835708492800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (6, 1), (7, 2), (15, 3), (16, 1)],
  term ((-9397072573488003139965417854246400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 466 for generator 9. -/
theorem ep_Q2_008_partial_09_0466_valid :
    mulPoly ep_Q2_008_coefficient_09_0466
        ep_Q2_008_generator_09_0400_0499 =
      ep_Q2_008_partial_09_0466 := by
  native_decide

/-- Coefficient term 467 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0467 : Poly :=
[
  term ((-1015368500705537531255289132617856000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 3), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 467 for generator 9. -/
def ep_Q2_008_partial_09_0467 : Poly :=
[
  term ((-2030737001411075062510578265235712000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (6, 1), (7, 3), (13, 2), (15, 2), (16, 1)],
  term ((1015368500705537531255289132617856000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 3), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 467 for generator 9. -/
theorem ep_Q2_008_partial_09_0467_valid :
    mulPoly ep_Q2_008_coefficient_09_0467
        ep_Q2_008_generator_09_0400_0499 =
      ep_Q2_008_partial_09_0467 := by
  native_decide

/-- Coefficient term 468 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0468 : Poly :=
[
  term ((-9397072573488003139965417854246400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 3), (15, 2), (16, 1)]
]

/-- Partial product 468 for generator 9. -/
def ep_Q2_008_partial_09_0468 : Poly :=
[
  term ((-18794145146976006279930835708492800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (6, 1), (7, 3), (15, 2), (16, 1)],
  term ((9397072573488003139965417854246400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 468 for generator 9. -/
theorem ep_Q2_008_partial_09_0468_valid :
    mulPoly ep_Q2_008_coefficient_09_0468
        ep_Q2_008_generator_09_0400_0499 =
      ep_Q2_008_partial_09_0468 := by
  native_decide

/-- Coefficient term 469 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0469 : Poly :=
[
  term ((39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 469 for generator 9. -/
def ep_Q2_008_partial_09_0469 : Poly :=
[
  term ((78173987841078575882094280687715020800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (6, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 469 for generator 9. -/
theorem ep_Q2_008_partial_09_0469_valid :
    mulPoly ep_Q2_008_coefficient_09_0469
        ep_Q2_008_generator_09_0400_0499 =
      ep_Q2_008_partial_09_0469 := by
  native_decide

/-- Coefficient term 470 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0470 : Poly :=
[
  term ((-14423181750135707291662327260040033405200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 470 for generator 9. -/
def ep_Q2_008_partial_09_0470 : Poly :=
[
  term ((-28846363500271414583324654520080066810400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (6, 1), (9, 1), (15, 2), (16, 1)],
  term ((14423181750135707291662327260040033405200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 470 for generator 9. -/
theorem ep_Q2_008_partial_09_0470_valid :
    mulPoly ep_Q2_008_coefficient_09_0470
        ep_Q2_008_generator_09_0400_0499 =
      ep_Q2_008_partial_09_0470 := by
  native_decide

/-- Coefficient term 471 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0471 : Poly :=
[
  term ((-70324786932212700 : Rat) / 692956453614176359) [(3, 1), (6, 1), (9, 1), (16, 1)]
]

/-- Partial product 471 for generator 9. -/
def ep_Q2_008_partial_09_0471 : Poly :=
[
  term ((-140649573864425400 : Rat) / 692956453614176359) [(2, 1), (3, 1), (6, 1), (9, 1), (16, 1)],
  term ((70324786932212700 : Rat) / 692956453614176359) [(3, 1), (6, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 471 for generator 9. -/
theorem ep_Q2_008_partial_09_0471_valid :
    mulPoly ep_Q2_008_coefficient_09_0471
        ep_Q2_008_generator_09_0400_0499 =
      ep_Q2_008_partial_09_0471 := by
  native_decide

/-- Coefficient term 472 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0472 : Poly :=
[
  term ((-2315326633528356000 : Rat) / 692956453614176359) [(3, 1), (6, 1), (10, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 472 for generator 9. -/
def ep_Q2_008_partial_09_0472 : Poly :=
[
  term ((-4630653267056712000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (6, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((2315326633528356000 : Rat) / 692956453614176359) [(3, 1), (6, 1), (10, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 472 for generator 9. -/
theorem ep_Q2_008_partial_09_0472_valid :
    mulPoly ep_Q2_008_coefficient_09_0472
        ep_Q2_008_generator_09_0400_0499 =
      ep_Q2_008_partial_09_0472 := by
  native_decide

/-- Coefficient term 473 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0473 : Poly :=
[
  term ((1033750784322392355330289498980655403364000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (10, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 473 for generator 9. -/
def ep_Q2_008_partial_09_0473 : Poly :=
[
  term ((2067501568644784710660578997961310806728000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (6, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1033750784322392355330289498980655403364000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (10, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 473 for generator 9. -/
theorem ep_Q2_008_partial_09_0473_valid :
    mulPoly ep_Q2_008_coefficient_09_0473
        ep_Q2_008_generator_09_0400_0499 =
      ep_Q2_008_partial_09_0473 := by
  native_decide

/-- Coefficient term 474 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0474 : Poly :=
[
  term ((2701214405783082000 : Rat) / 692956453614176359) [(3, 1), (6, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 474 for generator 9. -/
def ep_Q2_008_partial_09_0474 : Poly :=
[
  term ((5402428811566164000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (6, 1), (10, 1), (13, 1), (16, 1)],
  term ((-2701214405783082000 : Rat) / 692956453614176359) [(3, 1), (6, 1), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 474 for generator 9. -/
theorem ep_Q2_008_partial_09_0474_valid :
    mulPoly ep_Q2_008_coefficient_09_0474
        ep_Q2_008_generator_09_0400_0499 =
      ep_Q2_008_partial_09_0474 := by
  native_decide

/-- Coefficient term 475 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0475 : Poly :=
[
  term ((223235790237277541753593505296429508374125 : Rat) / 168707601851329515375740828258983054697998) [(3, 1), (6, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 475 for generator 9. -/
def ep_Q2_008_partial_09_0475 : Poly :=
[
  term ((223235790237277541753593505296429508374125 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((-223235790237277541753593505296429508374125 : Rat) / 168707601851329515375740828258983054697998) [(3, 1), (6, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 475 for generator 9. -/
theorem ep_Q2_008_partial_09_0475_valid :
    mulPoly ep_Q2_008_coefficient_09_0475
        ep_Q2_008_generator_09_0400_0499 =
      ep_Q2_008_partial_09_0475 := by
  native_decide

/-- Coefficient term 476 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0476 : Poly :=
[
  term ((-4924581848236464381587163232100850451200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 476 for generator 9. -/
def ep_Q2_008_partial_09_0476 : Poly :=
[
  term ((-9849163696472928763174326464201700902400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (6, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((4924581848236464381587163232100850451200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 476 for generator 9. -/
theorem ep_Q2_008_partial_09_0476_valid :
    mulPoly ep_Q2_008_coefficient_09_0476
        ep_Q2_008_generator_09_0400_0499 =
      ep_Q2_008_partial_09_0476 := by
  native_decide

/-- Coefficient term 477 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0477 : Poly :=
[
  term ((-4764553713739224000 : Rat) / 692956453614176359) [(3, 1), (6, 1), (11, 1), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 477 for generator 9. -/
def ep_Q2_008_partial_09_0477 : Poly :=
[
  term ((-9529107427478448000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (6, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((4764553713739224000 : Rat) / 692956453614176359) [(3, 1), (6, 1), (11, 1), (12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 477 for generator 9. -/
theorem ep_Q2_008_partial_09_0477_valid :
    mulPoly ep_Q2_008_coefficient_09_0477
        ep_Q2_008_generator_09_0400_0499 =
      ep_Q2_008_partial_09_0477 := by
  native_decide

/-- Coefficient term 478 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0478 : Poly :=
[
  term ((-394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 478 for generator 9. -/
def ep_Q2_008_partial_09_0478 : Poly :=
[
  term ((-788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (6, 1), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 478 for generator 9. -/
theorem ep_Q2_008_partial_09_0478_valid :
    mulPoly ep_Q2_008_coefficient_09_0478
        ep_Q2_008_generator_09_0400_0499 =
      ep_Q2_008_partial_09_0478 := by
  native_decide

/-- Coefficient term 479 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0479 : Poly :=
[
  term ((-4371704643222131625 : Rat) / 1385912907228352718) [(3, 1), (6, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 479 for generator 9. -/
def ep_Q2_008_partial_09_0479 : Poly :=
[
  term ((-4371704643222131625 : Rat) / 692956453614176359) [(2, 1), (3, 1), (6, 1), (11, 1), (12, 1), (16, 1)],
  term ((4371704643222131625 : Rat) / 1385912907228352718) [(3, 1), (6, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 479 for generator 9. -/
theorem ep_Q2_008_partial_09_0479_valid :
    mulPoly ep_Q2_008_coefficient_09_0479
        ep_Q2_008_generator_09_0400_0499 =
      ep_Q2_008_partial_09_0479 := by
  native_decide

/-- Coefficient term 480 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0480 : Poly :=
[
  term ((-190557603267096940514680993594001700523200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 480 for generator 9. -/
def ep_Q2_008_partial_09_0480 : Poly :=
[
  term ((-381115206534193881029361987188003401046400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((190557603267096940514680993594001700523200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 480 for generator 9. -/
theorem ep_Q2_008_partial_09_0480_valid :
    mulPoly ep_Q2_008_coefficient_09_0480
        ep_Q2_008_generator_09_0400_0499 =
      ep_Q2_008_partial_09_0480 := by
  native_decide

/-- Coefficient term 481 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0481 : Poly :=
[
  term ((4157495168227792917037311132093583468800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (11, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 481 for generator 9. -/
def ep_Q2_008_partial_09_0481 : Poly :=
[
  term ((8314990336455585834074622264187166937600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (6, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-4157495168227792917037311132093583468800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (11, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 481 for generator 9. -/
theorem ep_Q2_008_partial_09_0481_valid :
    mulPoly ep_Q2_008_coefficient_09_0481
        ep_Q2_008_generator_09_0400_0499 =
      ep_Q2_008_partial_09_0481 := by
  native_decide

/-- Coefficient term 482 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0482 : Poly :=
[
  term ((2896140050903837804236256360844908575646400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (11, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 482 for generator 9. -/
def ep_Q2_008_partial_09_0482 : Poly :=
[
  term ((5792280101807675608472512721689817151292800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (6, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-2896140050903837804236256360844908575646400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (11, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 482 for generator 9. -/
theorem ep_Q2_008_partial_09_0482_valid :
    mulPoly ep_Q2_008_coefficient_09_0482
        ep_Q2_008_generator_09_0400_0499 =
      ep_Q2_008_partial_09_0482 := by
  native_decide

/-- Coefficient term 483 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0483 : Poly :=
[
  term ((2382276856869612000 : Rat) / 692956453614176359) [(3, 1), (6, 1), (11, 1), (13, 2), (16, 1)]
]

/-- Partial product 483 for generator 9. -/
def ep_Q2_008_partial_09_0483 : Poly :=
[
  term ((4764553713739224000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (6, 1), (11, 1), (13, 2), (16, 1)],
  term ((-2382276856869612000 : Rat) / 692956453614176359) [(3, 1), (6, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 483 for generator 9. -/
theorem ep_Q2_008_partial_09_0483_valid :
    mulPoly ep_Q2_008_coefficient_09_0483
        ep_Q2_008_generator_09_0400_0499 =
      ep_Q2_008_partial_09_0483 := by
  native_decide

/-- Coefficient term 484 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0484 : Poly :=
[
  term ((197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 484 for generator 9. -/
def ep_Q2_008_partial_09_0484 : Poly :=
[
  term ((394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (6, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((-197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 484 for generator 9. -/
theorem ep_Q2_008_partial_09_0484_valid :
    mulPoly ep_Q2_008_coefficient_09_0484
        ep_Q2_008_generator_09_0400_0499 =
      ep_Q2_008_partial_09_0484 := by
  native_decide

/-- Coefficient term 485 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0485 : Poly :=
[
  term ((1972163407581095678179970936887570176000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (11, 1), (13, 3), (15, 3), (16, 1)]
]

/-- Partial product 485 for generator 9. -/
def ep_Q2_008_partial_09_0485 : Poly :=
[
  term ((3944326815162191356359941873775140352000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (6, 1), (11, 1), (13, 3), (15, 3), (16, 1)],
  term ((-1972163407581095678179970936887570176000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (11, 1), (13, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 485 for generator 9. -/
theorem ep_Q2_008_partial_09_0485_valid :
    mulPoly ep_Q2_008_coefficient_09_0485
        ep_Q2_008_generator_09_0400_0499 =
      ep_Q2_008_partial_09_0485 := by
  native_decide

/-- Coefficient term 486 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0486 : Poly :=
[
  term ((-7917151444575710357469357128308539670875 : Rat) / 168707601851329515375740828258983054697998) [(3, 1), (6, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 486 for generator 9. -/
def ep_Q2_008_partial_09_0486 : Poly :=
[
  term ((-7917151444575710357469357128308539670875 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((7917151444575710357469357128308539670875 : Rat) / 168707601851329515375740828258983054697998) [(3, 1), (6, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 486 for generator 9. -/
theorem ep_Q2_008_partial_09_0486_valid :
    mulPoly ep_Q2_008_coefficient_09_0486
        ep_Q2_008_generator_09_0400_0499 =
      ep_Q2_008_partial_09_0486 := by
  native_decide

/-- Coefficient term 487 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0487 : Poly :=
[
  term ((8046829836645177375 : Rat) / 2771825814456705436) [(3, 1), (6, 1), (11, 1), (16, 1)]
]

/-- Partial product 487 for generator 9. -/
def ep_Q2_008_partial_09_0487 : Poly :=
[
  term ((8046829836645177375 : Rat) / 1385912907228352718) [(2, 1), (3, 1), (6, 1), (11, 1), (16, 1)],
  term ((-8046829836645177375 : Rat) / 2771825814456705436) [(3, 1), (6, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 487 for generator 9. -/
theorem ep_Q2_008_partial_09_0487_valid :
    mulPoly ep_Q2_008_coefficient_09_0487
        ep_Q2_008_generator_09_0400_0499 =
      ep_Q2_008_partial_09_0487 := by
  native_decide

/-- Coefficient term 488 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0488 : Poly :=
[
  term ((-141147478046391873120448006797263232000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 488 for generator 9. -/
def ep_Q2_008_partial_09_0488 : Poly :=
[
  term ((-282294956092783746240896013594526464000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (6, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((141147478046391873120448006797263232000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 488 for generator 9. -/
theorem ep_Q2_008_partial_09_0488_valid :
    mulPoly ep_Q2_008_coefficient_09_0488
        ep_Q2_008_generator_09_0400_0499 =
      ep_Q2_008_partial_09_0488 := by
  native_decide

/-- Coefficient term 489 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0489 : Poly :=
[
  term ((27279832927703925129 : Rat) / 2771825814456705436) [(3, 1), (6, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 489 for generator 9. -/
def ep_Q2_008_partial_09_0489 : Poly :=
[
  term ((27279832927703925129 : Rat) / 1385912907228352718) [(2, 1), (3, 1), (6, 1), (12, 1), (13, 1), (16, 1)],
  term ((-27279832927703925129 : Rat) / 2771825814456705436) [(3, 1), (6, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 489 for generator 9. -/
theorem ep_Q2_008_partial_09_0489_valid :
    mulPoly ep_Q2_008_coefficient_09_0489
        ep_Q2_008_generator_09_0400_0499 =
      ep_Q2_008_partial_09_0489 := by
  native_decide

/-- Coefficient term 490 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0490 : Poly :=
[
  term ((-4201465330826088668719012886041459123200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 490 for generator 9. -/
def ep_Q2_008_partial_09_0490 : Poly :=
[
  term ((-8402930661652177337438025772082918246400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (6, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((4201465330826088668719012886041459123200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 490 for generator 9. -/
theorem ep_Q2_008_partial_09_0490_valid :
    mulPoly ep_Q2_008_coefficient_09_0490
        ep_Q2_008_generator_09_0400_0499 =
      ep_Q2_008_partial_09_0490 := by
  native_decide

/-- Coefficient term 491 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0491 : Poly :=
[
  term ((-1136280120885248819804408929379000638512921 : Rat) / 674830407405318061502963313035932218791992) [(3, 1), (6, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 491 for generator 9. -/
def ep_Q2_008_partial_09_0491 : Poly :=
[
  term ((-1136280120885248819804408929379000638512921 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (3, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((1136280120885248819804408929379000638512921 : Rat) / 674830407405318061502963313035932218791992) [(3, 1), (6, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 491 for generator 9. -/
theorem ep_Q2_008_partial_09_0491_valid :
    mulPoly ep_Q2_008_coefficient_09_0491
        ep_Q2_008_generator_09_0400_0499 =
      ep_Q2_008_partial_09_0491 := by
  native_decide

/-- Coefficient term 492 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0492 : Poly :=
[
  term ((-2688687413669430799315979859294549911233713 : Rat) / 337415203702659030751481656517966109395996) [(3, 1), (6, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 492 for generator 9. -/
def ep_Q2_008_partial_09_0492 : Poly :=
[
  term ((-2688687413669430799315979859294549911233713 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (3, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((2688687413669430799315979859294549911233713 : Rat) / 337415203702659030751481656517966109395996) [(3, 1), (6, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 492 for generator 9. -/
theorem ep_Q2_008_partial_09_0492_valid :
    mulPoly ep_Q2_008_coefficient_09_0492
        ep_Q2_008_generator_09_0400_0499 =
      ep_Q2_008_partial_09_0492 := by
  native_decide

/-- Coefficient term 493 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0493 : Poly :=
[
  term ((-45924926063767302363 : Rat) / 2771825814456705436) [(3, 1), (6, 1), (13, 1), (16, 1)]
]

/-- Partial product 493 for generator 9. -/
def ep_Q2_008_partial_09_0493 : Poly :=
[
  term ((-45924926063767302363 : Rat) / 1385912907228352718) [(2, 1), (3, 1), (6, 1), (13, 1), (16, 1)],
  term ((45924926063767302363 : Rat) / 2771825814456705436) [(3, 1), (6, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 493 for generator 9. -/
theorem ep_Q2_008_partial_09_0493_valid :
    mulPoly ep_Q2_008_coefficient_09_0493
        ep_Q2_008_generator_09_0400_0499 =
      ep_Q2_008_partial_09_0493 := by
  native_decide

/-- Coefficient term 494 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0494 : Poly :=
[
  term ((-4403875230176412210347536932770120044800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 494 for generator 9. -/
def ep_Q2_008_partial_09_0494 : Poly :=
[
  term ((-8807750460352824420695073865540240089600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (6, 1), (13, 2), (15, 1), (16, 1)],
  term ((4403875230176412210347536932770120044800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 494 for generator 9. -/
theorem ep_Q2_008_partial_09_0494_valid :
    mulPoly ep_Q2_008_coefficient_09_0494
        ep_Q2_008_generator_09_0400_0499 =
      ep_Q2_008_partial_09_0494 := by
  native_decide

/-- Coefficient term 495 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0495 : Poly :=
[
  term ((34679115264387073690690337739212889177600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (13, 2), (15, 3), (16, 1)]
]

/-- Partial product 495 for generator 9. -/
def ep_Q2_008_partial_09_0495 : Poly :=
[
  term ((69358230528774147381380675478425778355200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (6, 1), (13, 2), (15, 3), (16, 1)],
  term ((-34679115264387073690690337739212889177600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 495 for generator 9. -/
theorem ep_Q2_008_partial_09_0495_valid :
    mulPoly ep_Q2_008_coefficient_09_0495
        ep_Q2_008_generator_09_0400_0499 =
      ep_Q2_008_partial_09_0495 := by
  native_decide

/-- Coefficient term 496 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0496 : Poly :=
[
  term ((866277046944514973967209175503212310393163 : Rat) / 168707601851329515375740828258983054697998) [(3, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 496 for generator 9. -/
def ep_Q2_008_partial_09_0496 : Poly :=
[
  term ((866277046944514973967209175503212310393163 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((-866277046944514973967209175503212310393163 : Rat) / 168707601851329515375740828258983054697998) [(3, 1), (6, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 496 for generator 9. -/
theorem ep_Q2_008_partial_09_0496_valid :
    mulPoly ep_Q2_008_coefficient_09_0496
        ep_Q2_008_generator_09_0400_0499 =
      ep_Q2_008_partial_09_0496 := by
  native_decide

/-- Coefficient term 497 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0497 : Poly :=
[
  term ((-20196228687940276989083986479503878576800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (15, 3), (16, 1)]
]

/-- Partial product 497 for generator 9. -/
def ep_Q2_008_partial_09_0497 : Poly :=
[
  term ((-40392457375880553978167972959007757153600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (6, 1), (15, 3), (16, 1)],
  term ((20196228687940276989083986479503878576800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 497 for generator 9. -/
theorem ep_Q2_008_partial_09_0497_valid :
    mulPoly ep_Q2_008_coefficient_09_0497
        ep_Q2_008_generator_09_0400_0499 =
      ep_Q2_008_partial_09_0497 := by
  native_decide

/-- Coefficient term 498 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0498 : Poly :=
[
  term ((374057564224493265389838808863163200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 2), (7, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 498 for generator 9. -/
def ep_Q2_008_partial_09_0498 : Poly :=
[
  term ((748115128448986530779677617726326400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (6, 2), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-374057564224493265389838808863163200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 2), (7, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 498 for generator 9. -/
theorem ep_Q2_008_partial_09_0498_valid :
    mulPoly ep_Q2_008_coefficient_09_0498
        ep_Q2_008_generator_09_0400_0499 =
      ep_Q2_008_partial_09_0498 := by
  native_decide

/-- Coefficient term 499 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_0499 : Poly :=
[
  term ((1824694926321908115 : Rat) / 1385912907228352718) [(3, 1), (6, 2), (7, 1), (13, 2), (16, 1)]
]

/-- Partial product 499 for generator 9. -/
def ep_Q2_008_partial_09_0499 : Poly :=
[
  term ((1824694926321908115 : Rat) / 692956453614176359) [(2, 1), (3, 1), (6, 2), (7, 1), (13, 2), (16, 1)],
  term ((-1824694926321908115 : Rat) / 1385912907228352718) [(3, 1), (6, 2), (7, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 499 for generator 9. -/
theorem ep_Q2_008_partial_09_0499_valid :
    mulPoly ep_Q2_008_coefficient_09_0499
        ep_Q2_008_generator_09_0400_0499 =
      ep_Q2_008_partial_09_0499 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_008_partials_09_0400_0499 : List Poly :=
[
  ep_Q2_008_partial_09_0400,
  ep_Q2_008_partial_09_0401,
  ep_Q2_008_partial_09_0402,
  ep_Q2_008_partial_09_0403,
  ep_Q2_008_partial_09_0404,
  ep_Q2_008_partial_09_0405,
  ep_Q2_008_partial_09_0406,
  ep_Q2_008_partial_09_0407,
  ep_Q2_008_partial_09_0408,
  ep_Q2_008_partial_09_0409,
  ep_Q2_008_partial_09_0410,
  ep_Q2_008_partial_09_0411,
  ep_Q2_008_partial_09_0412,
  ep_Q2_008_partial_09_0413,
  ep_Q2_008_partial_09_0414,
  ep_Q2_008_partial_09_0415,
  ep_Q2_008_partial_09_0416,
  ep_Q2_008_partial_09_0417,
  ep_Q2_008_partial_09_0418,
  ep_Q2_008_partial_09_0419,
  ep_Q2_008_partial_09_0420,
  ep_Q2_008_partial_09_0421,
  ep_Q2_008_partial_09_0422,
  ep_Q2_008_partial_09_0423,
  ep_Q2_008_partial_09_0424,
  ep_Q2_008_partial_09_0425,
  ep_Q2_008_partial_09_0426,
  ep_Q2_008_partial_09_0427,
  ep_Q2_008_partial_09_0428,
  ep_Q2_008_partial_09_0429,
  ep_Q2_008_partial_09_0430,
  ep_Q2_008_partial_09_0431,
  ep_Q2_008_partial_09_0432,
  ep_Q2_008_partial_09_0433,
  ep_Q2_008_partial_09_0434,
  ep_Q2_008_partial_09_0435,
  ep_Q2_008_partial_09_0436,
  ep_Q2_008_partial_09_0437,
  ep_Q2_008_partial_09_0438,
  ep_Q2_008_partial_09_0439,
  ep_Q2_008_partial_09_0440,
  ep_Q2_008_partial_09_0441,
  ep_Q2_008_partial_09_0442,
  ep_Q2_008_partial_09_0443,
  ep_Q2_008_partial_09_0444,
  ep_Q2_008_partial_09_0445,
  ep_Q2_008_partial_09_0446,
  ep_Q2_008_partial_09_0447,
  ep_Q2_008_partial_09_0448,
  ep_Q2_008_partial_09_0449,
  ep_Q2_008_partial_09_0450,
  ep_Q2_008_partial_09_0451,
  ep_Q2_008_partial_09_0452,
  ep_Q2_008_partial_09_0453,
  ep_Q2_008_partial_09_0454,
  ep_Q2_008_partial_09_0455,
  ep_Q2_008_partial_09_0456,
  ep_Q2_008_partial_09_0457,
  ep_Q2_008_partial_09_0458,
  ep_Q2_008_partial_09_0459,
  ep_Q2_008_partial_09_0460,
  ep_Q2_008_partial_09_0461,
  ep_Q2_008_partial_09_0462,
  ep_Q2_008_partial_09_0463,
  ep_Q2_008_partial_09_0464,
  ep_Q2_008_partial_09_0465,
  ep_Q2_008_partial_09_0466,
  ep_Q2_008_partial_09_0467,
  ep_Q2_008_partial_09_0468,
  ep_Q2_008_partial_09_0469,
  ep_Q2_008_partial_09_0470,
  ep_Q2_008_partial_09_0471,
  ep_Q2_008_partial_09_0472,
  ep_Q2_008_partial_09_0473,
  ep_Q2_008_partial_09_0474,
  ep_Q2_008_partial_09_0475,
  ep_Q2_008_partial_09_0476,
  ep_Q2_008_partial_09_0477,
  ep_Q2_008_partial_09_0478,
  ep_Q2_008_partial_09_0479,
  ep_Q2_008_partial_09_0480,
  ep_Q2_008_partial_09_0481,
  ep_Q2_008_partial_09_0482,
  ep_Q2_008_partial_09_0483,
  ep_Q2_008_partial_09_0484,
  ep_Q2_008_partial_09_0485,
  ep_Q2_008_partial_09_0486,
  ep_Q2_008_partial_09_0487,
  ep_Q2_008_partial_09_0488,
  ep_Q2_008_partial_09_0489,
  ep_Q2_008_partial_09_0490,
  ep_Q2_008_partial_09_0491,
  ep_Q2_008_partial_09_0492,
  ep_Q2_008_partial_09_0493,
  ep_Q2_008_partial_09_0494,
  ep_Q2_008_partial_09_0495,
  ep_Q2_008_partial_09_0496,
  ep_Q2_008_partial_09_0497,
  ep_Q2_008_partial_09_0498,
  ep_Q2_008_partial_09_0499
]

/-- Sum of partial products in this block. -/
def ep_Q2_008_block_09_0400_0499 : Poly :=
[
  term ((-53151350315373404579632478063846400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((1434026258708259315845961898188004800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-4858939462685558847 : Rat) / 2771825814456705436) [(2, 1), (3, 1), (5, 1), (7, 1), (13, 1), (16, 1)],
  term ((-25539819087116796181156375156582215252922335 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (3, 1), (5, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((645409253829534198466965805060992000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (7, 1), (13, 2), (15, 3), (16, 1)],
  term ((55301031637968958879595197398913440000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (7, 1), (13, 3), (15, 2), (16, 1)],
  term ((-5474084778965724345 : Rat) / 692956453614176359) [(2, 1), (3, 1), (5, 1), (7, 1), (13, 3), (16, 1)],
  term ((-110602063275937917759190394797826880000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (7, 1), (13, 4), (15, 1), (16, 1)],
  term ((-629272858250546574114891769925392339507131 : Rat) / 674830407405318061502963313035932218791992) [(2, 1), (3, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-209421436127353342182997216950902400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (7, 1), (15, 3), (16, 1)],
  term ((-28191217720464009419896253562739200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((877643497228772098415967893865792000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (7, 2), (13, 2), (15, 2), (16, 1)],
  term ((-3046105502116612593765867397853568000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (7, 2), (13, 3), (15, 1), (16, 1)],
  term ((2706033792651989442884024339116800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (7, 2), (15, 2), (16, 1)],
  term ((12734296484405958000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (5, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-25468592968811916000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (5, 1), (10, 1), (13, 2), (16, 1)],
  term ((6146668391273786840691067001519035075200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (5, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1585796188954766625 : Rat) / 1385912907228352718) [(2, 1), (3, 1), (5, 1), (11, 1), (13, 1), (16, 1)],
  term ((149590140485446871549635110317777617783200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((2958245111371643517269956405331355264000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((-71468305706088360000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (5, 1), (11, 1), (13, 3), (16, 1)],
  term ((-5916490222743287034539912810662710528000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 1), (11, 1), (13, 4), (15, 1), (16, 1)],
  term ((287781644465156882957393563816813068336075 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (3, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((-83370814993305000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (5, 1), (11, 2), (16, 1)],
  term ((-139931639360558863662 : Rat) / 692956453614176359) [(2, 1), (3, 1), (5, 1), (12, 1), (13, 2), (16, 1)],
  term ((-61441337169821144829 : Rat) / 5543651628913410872) [(2, 1), (3, 1), (5, 1), (12, 1), (16, 1)],
  term ((-8234196880166001192597465869374284590058597 : Rat) / 674830407405318061502963313035932218791992) [(2, 1), (3, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1739875278557790414883770872471346758400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (5, 1), (13, 1), (15, 3), (16, 1)],
  term ((13157917181928393088362709351589327228489340 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (5, 1), (13, 2), (15, 2), (16, 1)],
  term ((-95106792515234810787 : Rat) / 2771825814456705436) [(2, 1), (3, 1), (5, 1), (13, 2), (16, 1)],
  term ((-102842194236248809072836322632008245324800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (5, 1), (13, 3), (15, 1), (16, 1)],
  term ((-517251679757637299698254579239237765359674 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (5, 1), (15, 2), (16, 1)],
  term ((84315471915614805195 : Rat) / 11087303257826821744) [(2, 1), (3, 1), (5, 1), (16, 1)],
  term ((34168725202740045801192307326758400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 2), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-968113880744301297700448707591488000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 2), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((1936227761488602595400897415182976000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 2), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((-17084362601370022900596153663379200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (5, 2), (7, 1), (15, 2), (16, 1)],
  term ((15042639383838845127 : Rat) / 2771825814456705436) [(2, 1), (3, 1), (5, 2), (13, 1), (16, 1)],
  term ((-161459583877567919610 : Rat) / 692956453614176359) [(2, 1), (3, 1), (5, 2), (13, 2), (15, 1), (16, 1)],
  term ((322919167755135839220 : Rat) / 692956453614176359) [(2, 1), (3, 1), (5, 2), (13, 3), (16, 1)],
  term ((-15042639383838845127 : Rat) / 5543651628913410872) [(2, 1), (3, 1), (5, 2), (15, 1), (16, 1)],
  term ((-16979061979207944000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (6, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-8195557855031715787588089335358713433600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (6, 1), (7, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-47645537137392240000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (6, 1), (7, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-3944326815162191356359941873775140352000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (6, 1), (7, 1), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((25891905370046625 : Rat) / 692956453614176359) [(2, 1), (3, 1), (6, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-4875662578279613548938981631376832000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (6, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-729877970528763246 : Rat) / 692956453614176359) [(2, 1), (3, 1), (6, 1), (7, 1), (12, 1), (13, 2), (16, 1)],
  term ((-14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (6, 1), (7, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((154506451847614710653027389690915200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (6, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((-3326406100642410036 : Rat) / 692956453614176359) [(2, 1), (3, 1), (6, 1), (7, 1), (12, 1), (16, 1)],
  term ((2598024942406442514197244265045679094530109 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (3, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((1496230256897973061559355235452652800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (6, 1), (7, 1), (13, 1), (15, 3), (16, 1)],
  term ((374740558031155696880969023300013555689830 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (6, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((364938985264381623 : Rat) / 692956453614176359) [(2, 1), (3, 1), (6, 1), (7, 1), (13, 2), (16, 1)],
  term ((7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (6, 1), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((73734708850625278506126929865217920000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (6, 1), (7, 1), (13, 3), (15, 3), (16, 1)],
  term ((277990372805232757453333537270683064271989 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (3, 1), (6, 1), (7, 1), (15, 2), (16, 1)],
  term ((5070938385422654954 : Rat) / 692956453614176359) [(2, 1), (3, 1), (6, 1), (7, 1), (16, 1)],
  term ((-406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (6, 1), (7, 2), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-164273752925072513343636144208473600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (6, 1), (7, 2), (12, 1), (15, 1), (16, 1)],
  term ((-1631612723658711399060060453135033600 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (6, 1), (7, 2), (13, 1), (15, 2), (16, 1)],
  term ((-444235453193070294349780263499209571792230 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (6, 1), (7, 2), (13, 2), (15, 1), (16, 1)],
  term ((2030737001411075062510578265235712000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (6, 1), (7, 2), (13, 2), (15, 3), (16, 1)],
  term ((-73734708850625278506126929865217920000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (6, 1), (7, 2), (13, 3), (15, 2), (16, 1)],
  term ((-197155837659907191554503247255695830527989 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (3, 1), (6, 1), (7, 2), (15, 1), (16, 1)],
  term ((18794145146976006279930835708492800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (6, 1), (7, 2), (15, 3), (16, 1)],
  term ((-2030737001411075062510578265235712000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (6, 1), (7, 3), (13, 2), (15, 2), (16, 1)],
  term ((-18794145146976006279930835708492800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (6, 1), (7, 3), (15, 2), (16, 1)],
  term ((78173987841078575882094280687715020800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (6, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-28846363500271414583324654520080066810400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (6, 1), (9, 1), (15, 2), (16, 1)],
  term ((-140649573864425400 : Rat) / 692956453614176359) [(2, 1), (3, 1), (6, 1), (9, 1), (16, 1)],
  term ((-4630653267056712000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (6, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((2067501568644784710660578997961310806728000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (6, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((5402428811566164000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (6, 1), (10, 1), (13, 1), (16, 1)],
  term ((223235790237277541753593505296429508374125 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((-9849163696472928763174326464201700902400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (6, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-9529107427478448000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (6, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((-788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (6, 1), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-4371704643222131625 : Rat) / 692956453614176359) [(2, 1), (3, 1), (6, 1), (11, 1), (12, 1), (16, 1)],
  term ((-381115206534193881029361987188003401046400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((8314990336455585834074622264187166937600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (6, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((5792280101807675608472512721689817151292800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (6, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((4764553713739224000 : Rat) / 692956453614176359) [(2, 1), (3, 1), (6, 1), (11, 1), (13, 2), (16, 1)],
  term ((394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (6, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((3944326815162191356359941873775140352000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (6, 1), (11, 1), (13, 3), (15, 3), (16, 1)],
  term ((-7917151444575710357469357128308539670875 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((8046829836645177375 : Rat) / 1385912907228352718) [(2, 1), (3, 1), (6, 1), (11, 1), (16, 1)],
  term ((-282294956092783746240896013594526464000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (6, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((27279832927703925129 : Rat) / 1385912907228352718) [(2, 1), (3, 1), (6, 1), (12, 1), (13, 1), (16, 1)],
  term ((-8402930661652177337438025772082918246400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (6, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1136280120885248819804408929379000638512921 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (3, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2688687413669430799315979859294549911233713 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (3, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((-45924926063767302363 : Rat) / 1385912907228352718) [(2, 1), (3, 1), (6, 1), (13, 1), (16, 1)],
  term ((-8807750460352824420695073865540240089600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (6, 1), (13, 2), (15, 1), (16, 1)],
  term ((69358230528774147381380675478425778355200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (6, 1), (13, 2), (15, 3), (16, 1)],
  term ((866277046944514973967209175503212310393163 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((-40392457375880553978167972959007757153600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (3, 1), (6, 1), (15, 3), (16, 1)],
  term ((748115128448986530779677617726326400 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (3, 1), (6, 2), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((1824694926321908115 : Rat) / 692956453614176359) [(2, 1), (3, 1), (6, 2), (7, 1), (13, 2), (16, 1)],
  term ((26575675157686702289816239031923200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-717013129354129657922980949094002400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((4858939462685558847 : Rat) / 5543651628913410872) [(3, 1), (5, 1), (7, 1), (13, 1), (16, 1)],
  term ((25539819087116796181156375156582215252922335 : Rat) / 337415203702659030751481656517966109395996) [(3, 1), (5, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-322704626914767099233482902530496000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (13, 2), (15, 3), (16, 1)],
  term ((-27650515818984479439797598699456720000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (13, 3), (15, 2), (16, 1)],
  term ((5474084778965724345 : Rat) / 1385912907228352718) [(3, 1), (5, 1), (7, 1), (13, 3), (16, 1)],
  term ((55301031637968958879595197398913440000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (13, 4), (15, 1), (16, 1)],
  term ((629272858250546574114891769925392339507131 : Rat) / 1349660814810636123005926626071864437583984) [(3, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((104710718063676671091498608475451200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (15, 3), (16, 1)],
  term ((14095608860232004709948126781369600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-438821748614386049207983946932896000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 2), (13, 2), (15, 2), (16, 1)],
  term ((1523052751058306296882933698926784000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 2), (13, 3), (15, 1), (16, 1)],
  term ((-1353016896325994721442012169558400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 2), (15, 2), (16, 1)],
  term ((-6367148242202979000 : Rat) / 692956453614176359) [(3, 1), (5, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((12734296484405958000 : Rat) / 692956453614176359) [(3, 1), (5, 1), (10, 1), (13, 2), (16, 1)],
  term ((-3073334195636893420345533500759517537600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((1585796188954766625 : Rat) / 2771825814456705436) [(3, 1), (5, 1), (11, 1), (13, 1), (16, 1)],
  term ((-74795070242723435774817555158888808891600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1479122555685821758634978202665677632000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((35734152853044180000 : Rat) / 692956453614176359) [(3, 1), (5, 1), (11, 1), (13, 3), (16, 1)],
  term ((2958245111371643517269956405331355264000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (11, 1), (13, 4), (15, 1), (16, 1)],
  term ((-287781644465156882957393563816813068336075 : Rat) / 674830407405318061502963313035932218791992) [(3, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((41685407496652500 : Rat) / 692956453614176359) [(3, 1), (5, 1), (11, 2), (16, 1)],
  term ((69965819680279431831 : Rat) / 692956453614176359) [(3, 1), (5, 1), (12, 1), (13, 2), (16, 1)],
  term ((61441337169821144829 : Rat) / 11087303257826821744) [(3, 1), (5, 1), (12, 1), (16, 1)],
  term ((8234196880166001192597465869374284590058597 : Rat) / 1349660814810636123005926626071864437583984) [(3, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((869937639278895207441885436235673379200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (13, 1), (15, 3), (16, 1)],
  term ((-6578958590964196544181354675794663614244670 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (13, 2), (15, 2), (16, 1)],
  term ((95106792515234810787 : Rat) / 5543651628913410872) [(3, 1), (5, 1), (13, 2), (16, 1)],
  term ((51421097118124404536418161316004122662400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (13, 3), (15, 1), (16, 1)],
  term ((258625839878818649849127289619618882679837 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (15, 2), (16, 1)],
  term ((-84315471915614805195 : Rat) / 22174606515653643488) [(3, 1), (5, 1), (16, 1)],
  term ((-17084362601370022900596153663379200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((484056940372150648850224353795744000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((-968113880744301297700448707591488000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((8542181300685011450298076831689600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (7, 1), (15, 2), (16, 1)],
  term ((-15042639383838845127 : Rat) / 5543651628913410872) [(3, 1), (5, 2), (13, 1), (16, 1)],
  term ((80729791938783959805 : Rat) / 692956453614176359) [(3, 1), (5, 2), (13, 2), (15, 1), (16, 1)],
  term ((-161459583877567919610 : Rat) / 692956453614176359) [(3, 1), (5, 2), (13, 3), (16, 1)],
  term ((15042639383838845127 : Rat) / 11087303257826821744) [(3, 1), (5, 2), (15, 1), (16, 1)],
  term ((8489530989603972000 : Rat) / 692956453614176359) [(3, 1), (6, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((4097778927515857893794044667679356716800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (7, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((23822768568696120000 : Rat) / 692956453614176359) [(3, 1), (6, 1), (7, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((1972163407581095678179970936887570176000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((-25891905370046625 : Rat) / 1385912907228352718) [(3, 1), (6, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((2437831289139806774469490815688416000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((364938985264381623 : Rat) / 692956453614176359) [(3, 1), (6, 1), (7, 1), (12, 1), (13, 2), (16, 1)],
  term ((7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-77253225923807355326513694845457600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((1663203050321205018 : Rat) / 692956453614176359) [(3, 1), (6, 1), (7, 1), (12, 1), (16, 1)],
  term ((-2598024942406442514197244265045679094530109 : Rat) / 337415203702659030751481656517966109395996) [(3, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-748115128448986530779677617726326400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (13, 1), (15, 3), (16, 1)],
  term ((-187370279015577848440484511650006777844915 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((-364938985264381623 : Rat) / 1385912907228352718) [(3, 1), (6, 1), (7, 1), (13, 2), (16, 1)],
  term ((-3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((-36867354425312639253063464932608960000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (13, 3), (15, 3), (16, 1)],
  term ((-277990372805232757453333537270683064271989 : Rat) / 337415203702659030751481656517966109395996) [(3, 1), (6, 1), (7, 1), (15, 2), (16, 1)],
  term ((-2535469192711327477 : Rat) / 692956453614176359) [(3, 1), (6, 1), (7, 1), (16, 1)],
  term ((203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 2), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((82136876462536256671818072104236800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 2), (12, 1), (15, 1), (16, 1)],
  term ((815806361829355699530030226567516800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 2), (13, 1), (15, 2), (16, 1)],
  term ((222117726596535147174890131749604785896115 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (7, 2), (13, 2), (15, 1), (16, 1)],
  term ((-1015368500705537531255289132617856000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 2), (13, 2), (15, 3), (16, 1)],
  term ((36867354425312639253063464932608960000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 2), (13, 3), (15, 2), (16, 1)],
  term ((197155837659907191554503247255695830527989 : Rat) / 337415203702659030751481656517966109395996) [(3, 1), (6, 1), (7, 2), (15, 1), (16, 1)],
  term ((-9397072573488003139965417854246400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 2), (15, 3), (16, 1)],
  term ((1015368500705537531255289132617856000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 3), (13, 2), (15, 2), (16, 1)],
  term ((9397072573488003139965417854246400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 3), (15, 2), (16, 1)],
  term ((-39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((14423181750135707291662327260040033405200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (9, 1), (15, 2), (16, 1)],
  term ((70324786932212700 : Rat) / 692956453614176359) [(3, 1), (6, 1), (9, 1), (16, 1)],
  term ((2315326633528356000 : Rat) / 692956453614176359) [(3, 1), (6, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-1033750784322392355330289498980655403364000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2701214405783082000 : Rat) / 692956453614176359) [(3, 1), (6, 1), (10, 1), (13, 1), (16, 1)],
  term ((-223235790237277541753593505296429508374125 : Rat) / 168707601851329515375740828258983054697998) [(3, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((4924581848236464381587163232100850451200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((4764553713739224000 : Rat) / 692956453614176359) [(3, 1), (6, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((4371704643222131625 : Rat) / 1385912907228352718) [(3, 1), (6, 1), (11, 1), (12, 1), (16, 1)],
  term ((190557603267096940514680993594001700523200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4157495168227792917037311132093583468800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-2896140050903837804236256360844908575646400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-2382276856869612000 : Rat) / 692956453614176359) [(3, 1), (6, 1), (11, 1), (13, 2), (16, 1)],
  term ((-197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((-1972163407581095678179970936887570176000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (11, 1), (13, 3), (15, 3), (16, 1)],
  term ((7917151444575710357469357128308539670875 : Rat) / 168707601851329515375740828258983054697998) [(3, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((-8046829836645177375 : Rat) / 2771825814456705436) [(3, 1), (6, 1), (11, 1), (16, 1)],
  term ((141147478046391873120448006797263232000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-27279832927703925129 : Rat) / 2771825814456705436) [(3, 1), (6, 1), (12, 1), (13, 1), (16, 1)],
  term ((4201465330826088668719012886041459123200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((1136280120885248819804408929379000638512921 : Rat) / 674830407405318061502963313035932218791992) [(3, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((2688687413669430799315979859294549911233713 : Rat) / 337415203702659030751481656517966109395996) [(3, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((45924926063767302363 : Rat) / 2771825814456705436) [(3, 1), (6, 1), (13, 1), (16, 1)],
  term ((4403875230176412210347536932770120044800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (13, 2), (15, 1), (16, 1)],
  term ((-34679115264387073690690337739212889177600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (13, 2), (15, 3), (16, 1)],
  term ((-866277046944514973967209175503212310393163 : Rat) / 168707601851329515375740828258983054697998) [(3, 1), (6, 1), (15, 1), (16, 1)],
  term ((20196228687940276989083986479503878576800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (15, 3), (16, 1)],
  term ((-374057564224493265389838808863163200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 2), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1824694926321908115 : Rat) / 1385912907228352718) [(3, 1), (6, 2), (7, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 9, terms 400 through 499. -/
theorem ep_Q2_008_block_09_0400_0499_valid :
    checkProductSumEq ep_Q2_008_partials_09_0400_0499
      ep_Q2_008_block_09_0400_0499 = true := by
  native_decide

end EpQ2008TermShards

end Patterns

end EndpointCertificate

end Problem97
