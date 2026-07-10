/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_024, term block 21:400-499

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_024`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2024TermShards

/-- Generator polynomial 21 for endpoint certificate `ep_Q2_024`. -/
def ep_Q2_024_generator_21_0400_0499 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(10, 1)]
]

/-- Coefficient term 400 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0400 : Poly :=
[
  term ((49794017268134571589590260644228965512 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (8, 1), (12, 1), (13, 1)]
]

/-- Partial product 400 for generator 21. -/
def ep_Q2_024_partial_21_0400 : Poly :=
[
  term ((99588034536269143179180521288457931024 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (8, 1), (10, 1), (12, 1), (13, 1)],
  term ((-49794017268134571589590260644228965512 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (8, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 400 for generator 21. -/
theorem ep_Q2_024_partial_21_0400_valid :
    mulPoly ep_Q2_024_coefficient_21_0400
        ep_Q2_024_generator_21_0400_0499 =
      ep_Q2_024_partial_21_0400 := by
  native_decide

/-- Coefficient term 401 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0401 : Poly :=
[
  term ((-183488243113488394739718246684116996552696960175428317 : Rat) / 92999895213201981850477343083626589746734642324746138) [(1, 1), (2, 1), (8, 1), (12, 1), (15, 1)]
]

/-- Partial product 401 for generator 21. -/
def ep_Q2_024_partial_21_0401 : Poly :=
[
  term ((-183488243113488394739718246684116996552696960175428317 : Rat) / 46499947606600990925238671541813294873367321162373069) [(1, 1), (2, 1), (8, 1), (10, 1), (12, 1), (15, 1)],
  term ((183488243113488394739718246684116996552696960175428317 : Rat) / 92999895213201981850477343083626589746734642324746138) [(1, 1), (2, 1), (8, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 401 for generator 21. -/
theorem ep_Q2_024_partial_21_0401_valid :
    mulPoly ep_Q2_024_coefficient_21_0401
        ep_Q2_024_generator_21_0400_0499 =
      ep_Q2_024_partial_21_0401 := by
  native_decide

/-- Coefficient term 402 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0402 : Poly :=
[
  term ((434461680526322 : Rat) / 1162780221153193) [(1, 1), (2, 1), (8, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 402 for generator 21. -/
def ep_Q2_024_partial_21_0402 : Poly :=
[
  term ((868923361052644 : Rat) / 1162780221153193) [(1, 1), (2, 1), (8, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-434461680526322 : Rat) / 1162780221153193) [(1, 1), (2, 1), (8, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 402 for generator 21. -/
theorem ep_Q2_024_partial_21_0402_valid :
    mulPoly ep_Q2_024_coefficient_21_0402
        ep_Q2_024_generator_21_0400_0499 =
      ep_Q2_024_partial_21_0402 := by
  native_decide

/-- Coefficient term 403 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0403 : Poly :=
[
  term ((-3771909638492810717307570954181814272108 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (2, 1), (8, 1), (13, 1)]
]

/-- Partial product 403 for generator 21. -/
def ep_Q2_024_partial_21_0403 : Poly :=
[
  term ((-7543819276985621434615141908363628544216 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (2, 1), (8, 1), (10, 1), (13, 1)],
  term ((3771909638492810717307570954181814272108 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (2, 1), (8, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 403 for generator 21. -/
theorem ep_Q2_024_partial_21_0403_valid :
    mulPoly ep_Q2_024_coefficient_21_0403
        ep_Q2_024_generator_21_0400_0499 =
      ep_Q2_024_partial_21_0403 := by
  native_decide

/-- Coefficient term 404 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0404 : Poly :=
[
  term ((-39283572369200916170526061558796625062192931994435226507 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(1, 1), (2, 1), (8, 1), (15, 1)]
]

/-- Partial product 404 for generator 21. -/
def ep_Q2_024_partial_21_0404 : Poly :=
[
  term ((-39283572369200916170526061558796625062192931994435226507 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (2, 1), (8, 1), (10, 1), (15, 1)],
  term ((39283572369200916170526061558796625062192931994435226507 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(1, 1), (2, 1), (8, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 404 for generator 21. -/
theorem ep_Q2_024_partial_21_0404_valid :
    mulPoly ep_Q2_024_coefficient_21_0404
        ep_Q2_024_generator_21_0400_0499 =
      ep_Q2_024_partial_21_0404 := by
  native_decide

/-- Coefficient term 405 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0405 : Poly :=
[
  term ((-56432624242549970 : Rat) / 3488340663459579) [(1, 1), (2, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 405 for generator 21. -/
def ep_Q2_024_partial_21_0405 : Poly :=
[
  term ((-112865248485099940 : Rat) / 3488340663459579) [(1, 1), (2, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((56432624242549970 : Rat) / 3488340663459579) [(1, 1), (2, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 405 for generator 21. -/
theorem ep_Q2_024_partial_21_0405_valid :
    mulPoly ep_Q2_024_coefficient_21_0405
        ep_Q2_024_generator_21_0400_0499 =
      ep_Q2_024_partial_21_0405 := by
  native_decide

/-- Coefficient term 406 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0406 : Poly :=
[
  term ((290166291591549053397263195682554175676 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (9, 1)]
]

/-- Partial product 406 for generator 21. -/
def ep_Q2_024_partial_21_0406 : Poly :=
[
  term ((-290166291591549053397263195682554175676 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (9, 1)],
  term ((580332583183098106794526391365108351352 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (9, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 406 for generator 21. -/
theorem ep_Q2_024_partial_21_0406_valid :
    mulPoly ep_Q2_024_coefficient_21_0406
        ep_Q2_024_generator_21_0400_0499 =
      ep_Q2_024_partial_21_0406 := by
  native_decide

/-- Coefficient term 407 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0407 : Poly :=
[
  term ((580332583183098106794526391365108351352 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (9, 1), (10, 1)]
]

/-- Partial product 407 for generator 21. -/
def ep_Q2_024_partial_21_0407 : Poly :=
[
  term ((-580332583183098106794526391365108351352 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (9, 1), (10, 1)],
  term ((1160665166366196213589052782730216702704 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (9, 1), (10, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 407 for generator 21. -/
theorem ep_Q2_024_partial_21_0407_valid :
    mulPoly ep_Q2_024_coefficient_21_0407
        ep_Q2_024_generator_21_0400_0499 =
      ep_Q2_024_partial_21_0407 := by
  native_decide

/-- Coefficient term 408 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0408 : Poly :=
[
  term ((-60059846594267677279406589311277335612 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (10, 1), (12, 1), (13, 1)]
]

/-- Partial product 408 for generator 21. -/
def ep_Q2_024_partial_21_0408 : Poly :=
[
  term ((60059846594267677279406589311277335612 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (10, 1), (12, 1), (13, 1)],
  term ((-120119693188535354558813178622554671224 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (10, 2), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 408 for generator 21. -/
theorem ep_Q2_024_partial_21_0408_valid :
    mulPoly ep_Q2_024_coefficient_21_0408
        ep_Q2_024_generator_21_0400_0499 =
      ep_Q2_024_partial_21_0408 := by
  native_decide

/-- Coefficient term 409 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0409 : Poly :=
[
  term ((6544627211193844374324207850933658385537878969261824301 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(1, 1), (2, 1), (10, 1), (12, 1), (15, 1)]
]

/-- Partial product 409 for generator 21. -/
def ep_Q2_024_partial_21_0409 : Poly :=
[
  term ((-6544627211193844374324207850933658385537878969261824301 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(1, 1), (2, 1), (10, 1), (12, 1), (15, 1)],
  term ((6544627211193844374324207850933658385537878969261824301 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(1, 1), (2, 1), (10, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 409 for generator 21. -/
theorem ep_Q2_024_partial_21_0409_valid :
    mulPoly ep_Q2_024_coefficient_21_0409
        ep_Q2_024_generator_21_0400_0499 =
      ep_Q2_024_partial_21_0409 := by
  native_decide

/-- Coefficient term 410 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0410 : Poly :=
[
  term ((-448228140819559 : Rat) / 1162780221153193) [(1, 1), (2, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 410 for generator 21. -/
def ep_Q2_024_partial_21_0410 : Poly :=
[
  term ((448228140819559 : Rat) / 1162780221153193) [(1, 1), (2, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-896456281639118 : Rat) / 1162780221153193) [(1, 1), (2, 1), (10, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 410 for generator 21. -/
theorem ep_Q2_024_partial_21_0410_valid :
    mulPoly ep_Q2_024_coefficient_21_0410
        ep_Q2_024_generator_21_0400_0499 =
      ep_Q2_024_partial_21_0410 := by
  native_decide

/-- Coefficient term 411 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0411 : Poly :=
[
  term ((926134959122893448371626358467155948192 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (10, 1), (13, 1)]
]

/-- Partial product 411 for generator 21. -/
def ep_Q2_024_partial_21_0411 : Poly :=
[
  term ((-926134959122893448371626358467155948192 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (10, 1), (13, 1)],
  term ((1852269918245786896743252716934311896384 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (10, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 411 for generator 21. -/
theorem ep_Q2_024_partial_21_0411_valid :
    mulPoly ep_Q2_024_coefficient_21_0411
        ep_Q2_024_generator_21_0400_0499 =
      ep_Q2_024_partial_21_0411 := by
  native_decide

/-- Coefficient term 412 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0412 : Poly :=
[
  term ((123791873617191140105857464850579092705757151288775427373 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(1, 1), (2, 1), (10, 1), (15, 1)]
]

/-- Partial product 412 for generator 21. -/
def ep_Q2_024_partial_21_0412 : Poly :=
[
  term ((-123791873617191140105857464850579092705757151288775427373 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(1, 1), (2, 1), (10, 1), (15, 1)],
  term ((123791873617191140105857464850579092705757151288775427373 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(1, 1), (2, 1), (10, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 412 for generator 21. -/
theorem ep_Q2_024_partial_21_0412_valid :
    mulPoly ep_Q2_024_coefficient_21_0412
        ep_Q2_024_generator_21_0400_0499 =
      ep_Q2_024_partial_21_0412 := by
  native_decide

/-- Coefficient term 413 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0413 : Poly :=
[
  term ((13766191430316001 : Rat) / 2325560442306386) [(1, 1), (2, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 413 for generator 21. -/
def ep_Q2_024_partial_21_0413 : Poly :=
[
  term ((-13766191430316001 : Rat) / 2325560442306386) [(1, 1), (2, 1), (10, 1), (15, 1), (16, 1)],
  term ((13766191430316001 : Rat) / 1162780221153193) [(1, 1), (2, 1), (10, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 413 for generator 21. -/
theorem ep_Q2_024_partial_21_0413_valid :
    mulPoly ep_Q2_024_coefficient_21_0413
        ep_Q2_024_generator_21_0400_0499 =
      ep_Q2_024_partial_21_0413 := by
  native_decide

/-- Coefficient term 414 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0414 : Poly :=
[
  term ((-30029923297133838639703294655638667806 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (12, 1), (13, 1)]
]

/-- Partial product 414 for generator 21. -/
def ep_Q2_024_partial_21_0414 : Poly :=
[
  term ((-60059846594267677279406589311277335612 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (10, 1), (12, 1), (13, 1)],
  term ((30029923297133838639703294655638667806 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 414 for generator 21. -/
theorem ep_Q2_024_partial_21_0414_valid :
    mulPoly ep_Q2_024_coefficient_21_0414
        ep_Q2_024_generator_21_0400_0499 =
      ep_Q2_024_partial_21_0414 := by
  native_decide

/-- Coefficient term 415 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0415 : Poly :=
[
  term ((6544627211193844374324207850933658385537878969261824301 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(1, 1), (2, 1), (12, 1), (15, 1)]
]

/-- Partial product 415 for generator 21. -/
def ep_Q2_024_partial_21_0415 : Poly :=
[
  term ((6544627211193844374324207850933658385537878969261824301 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(1, 1), (2, 1), (10, 1), (12, 1), (15, 1)],
  term ((-6544627211193844374324207850933658385537878969261824301 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(1, 1), (2, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 415 for generator 21. -/
theorem ep_Q2_024_partial_21_0415_valid :
    mulPoly ep_Q2_024_coefficient_21_0415
        ep_Q2_024_generator_21_0400_0499 =
      ep_Q2_024_partial_21_0415 := by
  native_decide

/-- Coefficient term 416 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0416 : Poly :=
[
  term ((-448228140819559 : Rat) / 2325560442306386) [(1, 1), (2, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 416 for generator 21. -/
def ep_Q2_024_partial_21_0416 : Poly :=
[
  term ((-448228140819559 : Rat) / 1162780221153193) [(1, 1), (2, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((448228140819559 : Rat) / 2325560442306386) [(1, 1), (2, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 416 for generator 21. -/
theorem ep_Q2_024_partial_21_0416_valid :
    mulPoly ep_Q2_024_coefficient_21_0416
        ep_Q2_024_generator_21_0400_0499 =
      ep_Q2_024_partial_21_0416 := by
  native_decide

/-- Coefficient term 417 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0417 : Poly :=
[
  term ((463067479561446724185813179233577974096 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (13, 1)]
]

/-- Partial product 417 for generator 21. -/
def ep_Q2_024_partial_21_0417 : Poly :=
[
  term ((926134959122893448371626358467155948192 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (10, 1), (13, 1)],
  term ((-463067479561446724185813179233577974096 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 417 for generator 21. -/
theorem ep_Q2_024_partial_21_0417_valid :
    mulPoly ep_Q2_024_coefficient_21_0417
        ep_Q2_024_generator_21_0400_0499 =
      ep_Q2_024_partial_21_0417 := by
  native_decide

/-- Coefficient term 418 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0418 : Poly :=
[
  term ((123791873617191140105857464850579092705757151288775427373 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(1, 1), (2, 1), (15, 1)]
]

/-- Partial product 418 for generator 21. -/
def ep_Q2_024_partial_21_0418 : Poly :=
[
  term ((123791873617191140105857464850579092705757151288775427373 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(1, 1), (2, 1), (10, 1), (15, 1)],
  term ((-123791873617191140105857464850579092705757151288775427373 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(1, 1), (2, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 418 for generator 21. -/
theorem ep_Q2_024_partial_21_0418_valid :
    mulPoly ep_Q2_024_coefficient_21_0418
        ep_Q2_024_generator_21_0400_0499 =
      ep_Q2_024_partial_21_0418 := by
  native_decide

/-- Coefficient term 419 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0419 : Poly :=
[
  term ((13766191430316001 : Rat) / 4651120884612772) [(1, 1), (2, 1), (15, 1), (16, 1)]
]

/-- Partial product 419 for generator 21. -/
def ep_Q2_024_partial_21_0419 : Poly :=
[
  term ((13766191430316001 : Rat) / 2325560442306386) [(1, 1), (2, 1), (10, 1), (15, 1), (16, 1)],
  term ((-13766191430316001 : Rat) / 4651120884612772) [(1, 1), (2, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 419 for generator 21. -/
theorem ep_Q2_024_partial_21_0419_valid :
    mulPoly ep_Q2_024_coefficient_21_0419
        ep_Q2_024_generator_21_0400_0499 =
      ep_Q2_024_partial_21_0419 := by
  native_decide

/-- Coefficient term 420 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0420 : Poly :=
[
  term ((-161015996569390131355509874849465952311 : Rat) / 399903152467492432188897842676513089330) [(1, 1), (3, 1)]
]

/-- Partial product 420 for generator 21. -/
def ep_Q2_024_partial_21_0420 : Poly :=
[
  term ((161015996569390131355509874849465952311 : Rat) / 399903152467492432188897842676513089330) [(1, 1), (3, 1)],
  term ((-161015996569390131355509874849465952311 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 420 for generator 21. -/
theorem ep_Q2_024_partial_21_0420_valid :
    mulPoly ep_Q2_024_coefficient_21_0420
        ep_Q2_024_generator_21_0400_0499 =
      ep_Q2_024_partial_21_0420 := by
  native_decide

/-- Coefficient term 421 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0421 : Poly :=
[
  term ((-732537308678412778282669871950328022754 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (4, 1)]
]

/-- Partial product 421 for generator 21. -/
def ep_Q2_024_partial_21_0421 : Poly :=
[
  term ((732537308678412778282669871950328022754 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (4, 1)],
  term ((-1465074617356825556565339743900656045508 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (4, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 421 for generator 21. -/
theorem ep_Q2_024_partial_21_0421_valid :
    mulPoly ep_Q2_024_coefficient_21_0421
        ep_Q2_024_generator_21_0400_0499 =
      ep_Q2_024_partial_21_0421 := by
  native_decide

/-- Coefficient term 422 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0422 : Poly :=
[
  term ((2930149234713651113130679487801312091016 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (3, 1), (4, 1), (8, 1)]
]

/-- Partial product 422 for generator 21. -/
def ep_Q2_024_partial_21_0422 : Poly :=
[
  term ((-2930149234713651113130679487801312091016 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (3, 1), (4, 1), (8, 1)],
  term ((5860298469427302226261358975602624182032 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (3, 1), (4, 1), (8, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 422 for generator 21. -/
theorem ep_Q2_024_partial_21_0422_valid :
    mulPoly ep_Q2_024_coefficient_21_0422
        ep_Q2_024_generator_21_0400_0499 =
      ep_Q2_024_partial_21_0422 := by
  native_decide

/-- Coefficient term 423 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0423 : Poly :=
[
  term ((-1465074617356825556565339743900656045508 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (4, 1), (10, 1)]
]

/-- Partial product 423 for generator 21. -/
def ep_Q2_024_partial_21_0423 : Poly :=
[
  term ((1465074617356825556565339743900656045508 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (4, 1), (10, 1)],
  term ((-2930149234713651113130679487801312091016 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (4, 1), (10, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 423 for generator 21. -/
theorem ep_Q2_024_partial_21_0423_valid :
    mulPoly ep_Q2_024_coefficient_21_0423
        ep_Q2_024_generator_21_0400_0499 =
      ep_Q2_024_partial_21_0423 := by
  native_decide

/-- Coefficient term 424 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0424 : Poly :=
[
  term ((621528342412223766817225469165983901984 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (5, 1), (8, 1), (9, 1)]
]

/-- Partial product 424 for generator 21. -/
def ep_Q2_024_partial_21_0424 : Poly :=
[
  term ((-621528342412223766817225469165983901984 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (5, 1), (8, 1), (9, 1)],
  term ((1243056684824447533634450938331967803968 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (5, 1), (8, 1), (9, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 424 for generator 21. -/
theorem ep_Q2_024_partial_21_0424_valid :
    mulPoly ep_Q2_024_coefficient_21_0424
        ep_Q2_024_generator_21_0400_0499 =
      ep_Q2_024_partial_21_0424 := by
  native_decide

/-- Coefficient term 425 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0425 : Poly :=
[
  term ((251502867450993404308170664724114271744 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (5, 1), (8, 1), (13, 1)]
]

/-- Partial product 425 for generator 21. -/
def ep_Q2_024_partial_21_0425 : Poly :=
[
  term ((503005734901986808616341329448228543488 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (5, 1), (8, 1), (10, 1), (13, 1)],
  term ((-251502867450993404308170664724114271744 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (5, 1), (8, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 425 for generator 21. -/
theorem ep_Q2_024_partial_21_0425_valid :
    mulPoly ep_Q2_024_coefficient_21_0425
        ep_Q2_024_generator_21_0400_0499 =
      ep_Q2_024_partial_21_0425 := by
  native_decide

/-- Coefficient term 426 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0426 : Poly :=
[
  term ((-7601069847269939811265284680958365728370186546329731398 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (3, 1), (5, 1), (8, 1), (15, 1)]
]

/-- Partial product 426 for generator 21. -/
def ep_Q2_024_partial_21_0426 : Poly :=
[
  term ((-15202139694539879622530569361916731456740373092659462796 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (3, 1), (5, 1), (8, 1), (10, 1), (15, 1)],
  term ((7601069847269939811265284680958365728370186546329731398 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (3, 1), (5, 1), (8, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 426 for generator 21. -/
theorem ep_Q2_024_partial_21_0426_valid :
    mulPoly ep_Q2_024_coefficient_21_0426
        ep_Q2_024_generator_21_0400_0499 =
      ep_Q2_024_partial_21_0426 := by
  native_decide

/-- Coefficient term 427 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0427 : Poly :=
[
  term ((-18665969837312872 : Rat) / 3488340663459579) [(1, 1), (3, 1), (5, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 427 for generator 21. -/
def ep_Q2_024_partial_21_0427 : Poly :=
[
  term ((-37331939674625744 : Rat) / 3488340663459579) [(1, 1), (3, 1), (5, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((18665969837312872 : Rat) / 3488340663459579) [(1, 1), (3, 1), (5, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 427 for generator 21. -/
theorem ep_Q2_024_partial_21_0427_valid :
    mulPoly ep_Q2_024_coefficient_21_0427
        ep_Q2_024_generator_21_0400_0499 =
      ep_Q2_024_partial_21_0427 := by
  native_decide

/-- Coefficient term 428 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0428 : Poly :=
[
  term ((-12329420463575023800351311507033664732 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (3, 1), (5, 1), (9, 1)]
]

/-- Partial product 428 for generator 21. -/
def ep_Q2_024_partial_21_0428 : Poly :=
[
  term ((12329420463575023800351311507033664732 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (3, 1), (5, 1), (9, 1)],
  term ((-24658840927150047600702623014067329464 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (3, 1), (5, 1), (9, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 428 for generator 21. -/
theorem ep_Q2_024_partial_21_0428_valid :
    mulPoly ep_Q2_024_coefficient_21_0428
        ep_Q2_024_generator_21_0400_0499 =
      ep_Q2_024_partial_21_0428 := by
  native_decide

/-- Coefficient term 429 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0429 : Poly :=
[
  term ((-24658840927150047600702623014067329464 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (3, 1), (5, 1), (9, 1), (10, 1)]
]

/-- Partial product 429 for generator 21. -/
def ep_Q2_024_partial_21_0429 : Poly :=
[
  term ((24658840927150047600702623014067329464 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (3, 1), (5, 1), (9, 1), (10, 1)],
  term ((-49317681854300095201405246028134658928 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (3, 1), (5, 1), (9, 1), (10, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 429 for generator 21. -/
theorem ep_Q2_024_partial_21_0429_valid :
    mulPoly ep_Q2_024_coefficient_21_0429
        ep_Q2_024_generator_21_0400_0499 =
      ep_Q2_024_partial_21_0429 := by
  native_decide

/-- Coefficient term 430 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0430 : Poly :=
[
  term ((-157816417934512041276862316386764390896 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (5, 1), (10, 1), (13, 1)]
]

/-- Partial product 430 for generator 21. -/
def ep_Q2_024_partial_21_0430 : Poly :=
[
  term ((157816417934512041276862316386764390896 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (5, 1), (10, 1), (13, 1)],
  term ((-315632835869024082553724632773528781792 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (5, 1), (10, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 430 for generator 21. -/
theorem ep_Q2_024_partial_21_0430_valid :
    mulPoly ep_Q2_024_coefficient_21_0430
        ep_Q2_024_generator_21_0400_0499 =
      ep_Q2_024_partial_21_0430 := by
  native_decide

/-- Coefficient term 431 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0431 : Poly :=
[
  term ((905649892486912115437703091516528642319088673319023280 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (3, 1), (5, 1), (10, 1), (15, 1)]
]

/-- Partial product 431 for generator 21. -/
def ep_Q2_024_partial_21_0431 : Poly :=
[
  term ((-905649892486912115437703091516528642319088673319023280 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (3, 1), (5, 1), (10, 1), (15, 1)],
  term ((1811299784973824230875406183033057284638177346638046560 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (3, 1), (5, 1), (10, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 431 for generator 21. -/
theorem ep_Q2_024_partial_21_0431_valid :
    mulPoly ep_Q2_024_coefficient_21_0431
        ep_Q2_024_generator_21_0400_0499 =
      ep_Q2_024_partial_21_0431 := by
  native_decide

/-- Coefficient term 432 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0432 : Poly :=
[
  term ((3263854553391488 : Rat) / 1162780221153193) [(1, 1), (3, 1), (5, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 432 for generator 21. -/
def ep_Q2_024_partial_21_0432 : Poly :=
[
  term ((-3263854553391488 : Rat) / 1162780221153193) [(1, 1), (3, 1), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((6527709106782976 : Rat) / 1162780221153193) [(1, 1), (3, 1), (5, 1), (10, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 432 for generator 21. -/
theorem ep_Q2_024_partial_21_0432_valid :
    mulPoly ep_Q2_024_coefficient_21_0432
        ep_Q2_024_generator_21_0400_0499 =
      ep_Q2_024_partial_21_0432 := by
  native_decide

/-- Coefficient term 433 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0433 : Poly :=
[
  term ((-78908208967256020638431158193382195448 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (5, 1), (13, 1)]
]

/-- Partial product 433 for generator 21. -/
def ep_Q2_024_partial_21_0433 : Poly :=
[
  term ((-157816417934512041276862316386764390896 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (5, 1), (10, 1), (13, 1)],
  term ((78908208967256020638431158193382195448 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (5, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 433 for generator 21. -/
theorem ep_Q2_024_partial_21_0433_valid :
    mulPoly ep_Q2_024_coefficient_21_0433
        ep_Q2_024_generator_21_0400_0499 =
      ep_Q2_024_partial_21_0433 := by
  native_decide

/-- Coefficient term 434 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0434 : Poly :=
[
  term ((452824946243456057718851545758264321159544336659511640 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (3, 1), (5, 1), (15, 1)]
]

/-- Partial product 434 for generator 21. -/
def ep_Q2_024_partial_21_0434 : Poly :=
[
  term ((905649892486912115437703091516528642319088673319023280 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (3, 1), (5, 1), (10, 1), (15, 1)],
  term ((-452824946243456057718851545758264321159544336659511640 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (3, 1), (5, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 434 for generator 21. -/
theorem ep_Q2_024_partial_21_0434_valid :
    mulPoly ep_Q2_024_coefficient_21_0434
        ep_Q2_024_generator_21_0400_0499 =
      ep_Q2_024_partial_21_0434 := by
  native_decide

/-- Coefficient term 435 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0435 : Poly :=
[
  term ((1631927276695744 : Rat) / 1162780221153193) [(1, 1), (3, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 435 for generator 21. -/
def ep_Q2_024_partial_21_0435 : Poly :=
[
  term ((3263854553391488 : Rat) / 1162780221153193) [(1, 1), (3, 1), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((-1631927276695744 : Rat) / 1162780221153193) [(1, 1), (3, 1), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 435 for generator 21. -/
theorem ep_Q2_024_partial_21_0435_valid :
    mulPoly ep_Q2_024_coefficient_21_0435
        ep_Q2_024_generator_21_0400_0499 =
      ep_Q2_024_partial_21_0435 := by
  native_decide

/-- Coefficient term 436 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0436 : Poly :=
[
  term ((10818398912636017292589007364524963681112 : Rat) / 5398692558311147834550120876132926705955) [(1, 1), (3, 1), (8, 1)]
]

/-- Partial product 436 for generator 21. -/
def ep_Q2_024_partial_21_0436 : Poly :=
[
  term ((-10818398912636017292589007364524963681112 : Rat) / 5398692558311147834550120876132926705955) [(1, 1), (3, 1), (8, 1)],
  term ((21636797825272034585178014729049927362224 : Rat) / 5398692558311147834550120876132926705955) [(1, 1), (3, 1), (8, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 436 for generator 21. -/
theorem ep_Q2_024_partial_21_0436_valid :
    mulPoly ep_Q2_024_coefficient_21_0436
        ep_Q2_024_generator_21_0400_0499 =
      ep_Q2_024_partial_21_0436 := by
  native_decide

/-- Coefficient term 437 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0437 : Poly :=
[
  term ((36712442508195667296262437051940901488 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (8, 1), (9, 1), (13, 1)]
]

/-- Partial product 437 for generator 21. -/
def ep_Q2_024_partial_21_0437 : Poly :=
[
  term ((73424885016391334592524874103881802976 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (8, 1), (9, 1), (10, 1), (13, 1)],
  term ((-36712442508195667296262437051940901488 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (8, 1), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 437 for generator 21. -/
theorem ep_Q2_024_partial_21_0437_valid :
    mulPoly ep_Q2_024_coefficient_21_0437
        ep_Q2_024_generator_21_0400_0499 =
      ep_Q2_024_partial_21_0437 := by
  native_decide

/-- Coefficient term 438 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0438 : Poly :=
[
  term ((1145348402225584415891924281648338436161871217291525497 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(1, 1), (3, 1), (8, 1), (9, 1), (15, 1)]
]

/-- Partial product 438 for generator 21. -/
def ep_Q2_024_partial_21_0438 : Poly :=
[
  term ((2290696804451168831783848563296676872323742434583050994 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(1, 1), (3, 1), (8, 1), (9, 1), (10, 1), (15, 1)],
  term ((-1145348402225584415891924281648338436161871217291525497 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(1, 1), (3, 1), (8, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 438 for generator 21. -/
theorem ep_Q2_024_partial_21_0438_valid :
    mulPoly ep_Q2_024_coefficient_21_0438
        ep_Q2_024_generator_21_0400_0499 =
      ep_Q2_024_partial_21_0438 := by
  native_decide

/-- Coefficient term 439 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0439 : Poly :=
[
  term ((747574224772468 : Rat) / 3488340663459579) [(1, 1), (3, 1), (8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 439 for generator 21. -/
def ep_Q2_024_partial_21_0439 : Poly :=
[
  term ((1495148449544936 : Rat) / 3488340663459579) [(1, 1), (3, 1), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-747574224772468 : Rat) / 3488340663459579) [(1, 1), (3, 1), (8, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 439 for generator 21. -/
theorem ep_Q2_024_partial_21_0439_valid :
    mulPoly ep_Q2_024_coefficient_21_0439
        ep_Q2_024_generator_21_0400_0499 =
      ep_Q2_024_partial_21_0439 := by
  native_decide

/-- Coefficient term 440 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0440 : Poly :=
[
  term ((63112532186469946331305143931700421056 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (8, 1), (9, 2)]
]

/-- Partial product 440 for generator 21. -/
def ep_Q2_024_partial_21_0440 : Poly :=
[
  term ((-63112532186469946331305143931700421056 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (8, 1), (9, 2)],
  term ((126225064372939892662610287863400842112 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (8, 1), (9, 2), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 440 for generator 21. -/
theorem ep_Q2_024_partial_21_0440_valid :
    mulPoly ep_Q2_024_coefficient_21_0440
        ep_Q2_024_generator_21_0400_0499 =
      ep_Q2_024_partial_21_0440 := by
  native_decide

/-- Coefficient term 441 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0441 : Poly :=
[
  term ((826347564150239326187536952436868474864 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (8, 1), (10, 1)]
]

/-- Partial product 441 for generator 21. -/
def ep_Q2_024_partial_21_0441 : Poly :=
[
  term ((-826347564150239326187536952436868474864 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (8, 1), (10, 1)],
  term ((1652695128300478652375073904873736949728 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (8, 1), (10, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 441 for generator 21. -/
theorem ep_Q2_024_partial_21_0441_valid :
    mulPoly ep_Q2_024_coefficient_21_0441
        ep_Q2_024_generator_21_0400_0499 =
      ep_Q2_024_partial_21_0441 := by
  native_decide

/-- Coefficient term 442 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0442 : Poly :=
[
  term ((-179900494408894967444133818184926615716 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (8, 1), (12, 1)]
]

/-- Partial product 442 for generator 21. -/
def ep_Q2_024_partial_21_0442 : Poly :=
[
  term ((-359800988817789934888267636369853231432 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (8, 1), (10, 1), (12, 1)],
  term ((179900494408894967444133818184926615716 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (8, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 442 for generator 21. -/
theorem ep_Q2_024_partial_21_0442_valid :
    mulPoly ep_Q2_024_coefficient_21_0442
        ep_Q2_024_generator_21_0400_0499 =
      ep_Q2_024_partial_21_0442 := by
  native_decide

/-- Coefficient term 443 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0443 : Poly :=
[
  term ((72684193103125880932282159892496420352 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (8, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 443 for generator 21. -/
def ep_Q2_024_partial_21_0443 : Poly :=
[
  term ((145368386206251761864564319784992840704 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (8, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-72684193103125880932282159892496420352 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (8, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 443 for generator 21. -/
theorem ep_Q2_024_partial_21_0443_valid :
    mulPoly ep_Q2_024_coefficient_21_0443
        ep_Q2_024_generator_21_0400_0499 =
      ep_Q2_024_partial_21_0443 := by
  native_decide

/-- Coefficient term 444 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0444 : Poly :=
[
  term ((-6299150043976421453816837443454246044728994387384006024 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (3, 1), (8, 1), (12, 1), (15, 2)]
]

/-- Partial product 444 for generator 21. -/
def ep_Q2_024_partial_21_0444 : Poly :=
[
  term ((-12598300087952842907633674886908492089457988774768012048 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (3, 1), (8, 1), (10, 1), (12, 1), (15, 2)],
  term ((6299150043976421453816837443454246044728994387384006024 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (3, 1), (8, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 444 for generator 21. -/
theorem ep_Q2_024_partial_21_0444_valid :
    mulPoly ep_Q2_024_coefficient_21_0444
        ep_Q2_024_generator_21_0400_0499 =
      ep_Q2_024_partial_21_0444 := by
  native_decide

/-- Coefficient term 445 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0445 : Poly :=
[
  term ((2774302050180448 : Rat) / 1162780221153193) [(1, 1), (3, 1), (8, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 445 for generator 21. -/
def ep_Q2_024_partial_21_0445 : Poly :=
[
  term ((5548604100360896 : Rat) / 1162780221153193) [(1, 1), (3, 1), (8, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-2774302050180448 : Rat) / 1162780221153193) [(1, 1), (3, 1), (8, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 445 for generator 21. -/
theorem ep_Q2_024_partial_21_0445_valid :
    mulPoly ep_Q2_024_coefficient_21_0445
        ep_Q2_024_generator_21_0400_0499 =
      ep_Q2_024_partial_21_0445 := by
  native_decide

/-- Coefficient term 446 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0446 : Poly :=
[
  term ((-5982837320379845651599041426655130663707208580347239615 : Rat) / 836999056918817836654296087752639307720611780922715242) [(1, 1), (3, 1), (8, 1), (13, 1), (15, 1)]
]

/-- Partial product 446 for generator 21. -/
def ep_Q2_024_partial_21_0446 : Poly :=
[
  term ((-5982837320379845651599041426655130663707208580347239615 : Rat) / 418499528459408918327148043876319653860305890461357621) [(1, 1), (3, 1), (8, 1), (10, 1), (13, 1), (15, 1)],
  term ((5982837320379845651599041426655130663707208580347239615 : Rat) / 836999056918817836654296087752639307720611780922715242) [(1, 1), (3, 1), (8, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 446 for generator 21. -/
theorem ep_Q2_024_partial_21_0446_valid :
    mulPoly ep_Q2_024_coefficient_21_0446
        ep_Q2_024_generator_21_0400_0499 =
      ep_Q2_024_partial_21_0446 := by
  native_decide

/-- Coefficient term 447 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0447 : Poly :=
[
  term ((5187528714443170 : Rat) / 3488340663459579) [(1, 1), (3, 1), (8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 447 for generator 21. -/
def ep_Q2_024_partial_21_0447 : Poly :=
[
  term ((10375057428886340 : Rat) / 3488340663459579) [(1, 1), (3, 1), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5187528714443170 : Rat) / 3488340663459579) [(1, 1), (3, 1), (8, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 447 for generator 21. -/
theorem ep_Q2_024_partial_21_0447_valid :
    mulPoly ep_Q2_024_coefficient_21_0447
        ep_Q2_024_generator_21_0400_0499 =
      ep_Q2_024_partial_21_0447 := by
  native_decide

/-- Coefficient term 448 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0448 : Poly :=
[
  term ((-197073917525224405347438912316263103928 : Rat) / 359912837220743188970008058408861780397) [(1, 1), (3, 1), (8, 1), (13, 2)]
]

/-- Partial product 448 for generator 21. -/
def ep_Q2_024_partial_21_0448 : Poly :=
[
  term ((-394147835050448810694877824632526207856 : Rat) / 359912837220743188970008058408861780397) [(1, 1), (3, 1), (8, 1), (10, 1), (13, 2)],
  term ((197073917525224405347438912316263103928 : Rat) / 359912837220743188970008058408861780397) [(1, 1), (3, 1), (8, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 448 for generator 21. -/
theorem ep_Q2_024_partial_21_0448_valid :
    mulPoly ep_Q2_024_coefficient_21_0448
        ep_Q2_024_generator_21_0400_0499 =
      ep_Q2_024_partial_21_0448 := by
  native_decide

/-- Coefficient term 449 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0449 : Poly :=
[
  term ((-254235174577019432502708099503663666722 : Rat) / 359912837220743188970008058408861780397) [(1, 1), (3, 1), (8, 1), (14, 1)]
]

/-- Partial product 449 for generator 21. -/
def ep_Q2_024_partial_21_0449 : Poly :=
[
  term ((-508470349154038865005416199007327333444 : Rat) / 359912837220743188970008058408861780397) [(1, 1), (3, 1), (8, 1), (10, 1), (14, 1)],
  term ((254235174577019432502708099503663666722 : Rat) / 359912837220743188970008058408861780397) [(1, 1), (3, 1), (8, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 449 for generator 21. -/
theorem ep_Q2_024_partial_21_0449_valid :
    mulPoly ep_Q2_024_coefficient_21_0449
        ep_Q2_024_generator_21_0400_0499 =
      ep_Q2_024_partial_21_0449 := by
  native_decide

/-- Coefficient term 450 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0450 : Poly :=
[
  term ((41173870565625819771545039985740243970144905421913612168 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(1, 1), (3, 1), (8, 1), (15, 2)]
]

/-- Partial product 450 for generator 21. -/
def ep_Q2_024_partial_21_0450 : Poly :=
[
  term ((82347741131251639543090079971480487940289810843827224336 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(1, 1), (3, 1), (8, 1), (10, 1), (15, 2)],
  term ((-41173870565625819771545039985740243970144905421913612168 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(1, 1), (3, 1), (8, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 450 for generator 21. -/
theorem ep_Q2_024_partial_21_0450_valid :
    mulPoly ep_Q2_024_coefficient_21_0450
        ep_Q2_024_generator_21_0400_0499 =
      ep_Q2_024_partial_21_0450 := by
  native_decide

/-- Coefficient term 451 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0451 : Poly :=
[
  term ((14489628749703008 : Rat) / 3488340663459579) [(1, 1), (3, 1), (8, 1), (15, 2), (16, 1)]
]

/-- Partial product 451 for generator 21. -/
def ep_Q2_024_partial_21_0451 : Poly :=
[
  term ((28979257499406016 : Rat) / 3488340663459579) [(1, 1), (3, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((-14489628749703008 : Rat) / 3488340663459579) [(1, 1), (3, 1), (8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 451 for generator 21. -/
theorem ep_Q2_024_partial_21_0451_valid :
    mulPoly ep_Q2_024_coefficient_21_0451
        ep_Q2_024_generator_21_0400_0499 =
      ep_Q2_024_partial_21_0451 := by
  native_decide

/-- Coefficient term 452 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0452 : Poly :=
[
  term ((-1652695128300478652375073904873736949728 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (3, 1), (8, 2)]
]

/-- Partial product 452 for generator 21. -/
def ep_Q2_024_partial_21_0452 : Poly :=
[
  term ((1652695128300478652375073904873736949728 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (3, 1), (8, 2)],
  term ((-3305390256600957304750147809747473899456 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (3, 1), (8, 2), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 452 for generator 21. -/
theorem ep_Q2_024_partial_21_0452_valid :
    mulPoly ep_Q2_024_coefficient_21_0452
        ep_Q2_024_generator_21_0400_0499 =
      ep_Q2_024_partial_21_0452 := by
  native_decide

/-- Coefficient term 453 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0453 : Poly :=
[
  term ((-117412202240548834389305462562760883856 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (9, 1), (10, 1), (13, 1)]
]

/-- Partial product 453 for generator 21. -/
def ep_Q2_024_partial_21_0453 : Poly :=
[
  term ((117412202240548834389305462562760883856 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (9, 1), (10, 1), (13, 1)],
  term ((-234824404481097668778610925125521767712 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (9, 1), (10, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 453 for generator 21. -/
theorem ep_Q2_024_partial_21_0453_valid :
    mulPoly ep_Q2_024_coefficient_21_0453
        ep_Q2_024_generator_21_0400_0499 =
      ep_Q2_024_partial_21_0453 := by
  native_decide

/-- Coefficient term 454 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0454 : Poly :=
[
  term ((1222689308379968181009349179356074961661002890148376823 : Rat) / 464999476066009909252386715418132948733673211623730690) [(1, 1), (3, 1), (9, 1), (10, 1), (15, 1)]
]

/-- Partial product 454 for generator 21. -/
def ep_Q2_024_partial_21_0454 : Poly :=
[
  term ((-1222689308379968181009349179356074961661002890148376823 : Rat) / 464999476066009909252386715418132948733673211623730690) [(1, 1), (3, 1), (9, 1), (10, 1), (15, 1)],
  term ((1222689308379968181009349179356074961661002890148376823 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (3, 1), (9, 1), (10, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 454 for generator 21. -/
theorem ep_Q2_024_partial_21_0454_valid :
    mulPoly ep_Q2_024_coefficient_21_0454
        ep_Q2_024_generator_21_0400_0499 =
      ep_Q2_024_partial_21_0454 := by
  native_decide

/-- Coefficient term 455 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0455 : Poly :=
[
  term ((-1121361337158702 : Rat) / 1162780221153193) [(1, 1), (3, 1), (9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 455 for generator 21. -/
def ep_Q2_024_partial_21_0455 : Poly :=
[
  term ((1121361337158702 : Rat) / 1162780221153193) [(1, 1), (3, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-2242722674317404 : Rat) / 1162780221153193) [(1, 1), (3, 1), (9, 1), (10, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 455 for generator 21. -/
theorem ep_Q2_024_partial_21_0455_valid :
    mulPoly ep_Q2_024_coefficient_21_0455
        ep_Q2_024_generator_21_0400_0499 =
      ep_Q2_024_partial_21_0455 := by
  native_decide

/-- Coefficient term 456 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0456 : Poly :=
[
  term ((-58706101120274417194652731281380441928 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (9, 1), (13, 1)]
]

/-- Partial product 456 for generator 21. -/
def ep_Q2_024_partial_21_0456 : Poly :=
[
  term ((-117412202240548834389305462562760883856 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (9, 1), (10, 1), (13, 1)],
  term ((58706101120274417194652731281380441928 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 456 for generator 21. -/
theorem ep_Q2_024_partial_21_0456_valid :
    mulPoly ep_Q2_024_coefficient_21_0456
        ep_Q2_024_generator_21_0400_0499 =
      ep_Q2_024_partial_21_0456 := by
  native_decide

/-- Coefficient term 457 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0457 : Poly :=
[
  term ((1222689308379968181009349179356074961661002890148376823 : Rat) / 929998952132019818504773430836265897467346423247461380) [(1, 1), (3, 1), (9, 1), (15, 1)]
]

/-- Partial product 457 for generator 21. -/
def ep_Q2_024_partial_21_0457 : Poly :=
[
  term ((1222689308379968181009349179356074961661002890148376823 : Rat) / 464999476066009909252386715418132948733673211623730690) [(1, 1), (3, 1), (9, 1), (10, 1), (15, 1)],
  term ((-1222689308379968181009349179356074961661002890148376823 : Rat) / 929998952132019818504773430836265897467346423247461380) [(1, 1), (3, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 457 for generator 21. -/
theorem ep_Q2_024_partial_21_0457_valid :
    mulPoly ep_Q2_024_coefficient_21_0457
        ep_Q2_024_generator_21_0400_0499 =
      ep_Q2_024_partial_21_0457 := by
  native_decide

/-- Coefficient term 458 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0458 : Poly :=
[
  term ((-560680668579351 : Rat) / 1162780221153193) [(1, 1), (3, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 458 for generator 21. -/
def ep_Q2_024_partial_21_0458 : Poly :=
[
  term ((-1121361337158702 : Rat) / 1162780221153193) [(1, 1), (3, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((560680668579351 : Rat) / 1162780221153193) [(1, 1), (3, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 458 for generator 21. -/
theorem ep_Q2_024_partial_21_0458_valid :
    mulPoly ep_Q2_024_coefficient_21_0458
        ep_Q2_024_generator_21_0400_0499 =
      ep_Q2_024_partial_21_0458 := by
  native_decide

/-- Coefficient term 459 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0459 : Poly :=
[
  term ((-47334399139852459748478857948775315792 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (9, 2)]
]

/-- Partial product 459 for generator 21. -/
def ep_Q2_024_partial_21_0459 : Poly :=
[
  term ((47334399139852459748478857948775315792 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (9, 2)],
  term ((-94668798279704919496957715897550631584 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (9, 2), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 459 for generator 21. -/
theorem ep_Q2_024_partial_21_0459_valid :
    mulPoly ep_Q2_024_coefficient_21_0459
        ep_Q2_024_generator_21_0400_0499 =
      ep_Q2_024_partial_21_0459 := by
  native_decide

/-- Coefficient term 460 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0460 : Poly :=
[
  term ((-94668798279704919496957715897550631584 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (9, 2), (10, 1)]
]

/-- Partial product 460 for generator 21. -/
def ep_Q2_024_partial_21_0460 : Poly :=
[
  term ((94668798279704919496957715897550631584 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (9, 2), (10, 1)],
  term ((-189337596559409838993915431795101263168 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (9, 2), (10, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 460 for generator 21. -/
theorem ep_Q2_024_partial_21_0460_valid :
    mulPoly ep_Q2_024_coefficient_21_0460
        ep_Q2_024_generator_21_0400_0499 =
      ep_Q2_024_partial_21_0460 := by
  native_decide

/-- Coefficient term 461 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0461 : Poly :=
[
  term ((-161015996569390131355509874849465952311 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (10, 1)]
]

/-- Partial product 461 for generator 21. -/
def ep_Q2_024_partial_21_0461 : Poly :=
[
  term ((161015996569390131355509874849465952311 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (10, 1)],
  term ((-322031993138780262711019749698931904622 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (10, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 461 for generator 21. -/
theorem ep_Q2_024_partial_21_0461_valid :
    mulPoly ep_Q2_024_coefficient_21_0461
        ep_Q2_024_generator_21_0400_0499 =
      ep_Q2_024_partial_21_0461 := by
  native_decide

/-- Coefficient term 462 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0462 : Poly :=
[
  term ((89950247204447483722066909092463307858 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (10, 1), (12, 1)]
]

/-- Partial product 462 for generator 21. -/
def ep_Q2_024_partial_21_0462 : Poly :=
[
  term ((-89950247204447483722066909092463307858 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (10, 1), (12, 1)],
  term ((179900494408894967444133818184926615716 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (10, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 462 for generator 21. -/
theorem ep_Q2_024_partial_21_0462_valid :
    mulPoly ep_Q2_024_coefficient_21_0462
        ep_Q2_024_generator_21_0400_0499 =
      ep_Q2_024_partial_21_0462 := by
  native_decide

/-- Coefficient term 463 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0463 : Poly :=
[
  term ((-33273931020260669930661190011024360672 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (10, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 463 for generator 21. -/
def ep_Q2_024_partial_21_0463 : Poly :=
[
  term ((33273931020260669930661190011024360672 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-66547862040521339861322380022048721344 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (10, 2), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 463 for generator 21. -/
theorem ep_Q2_024_partial_21_0463_valid :
    mulPoly ep_Q2_024_coefficient_21_0463
        ep_Q2_024_generator_21_0400_0499 =
      ep_Q2_024_partial_21_0463 := by
  native_decide

/-- Coefficient term 464 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0464 : Poly :=
[
  term ((198745616475118943998092102782769635563595552220534688 : Rat) / 46499947606600990925238671541813294873367321162373069) [(1, 1), (3, 1), (10, 1), (12, 1), (15, 2)]
]

/-- Partial product 464 for generator 21. -/
def ep_Q2_024_partial_21_0464 : Poly :=
[
  term ((-198745616475118943998092102782769635563595552220534688 : Rat) / 46499947606600990925238671541813294873367321162373069) [(1, 1), (3, 1), (10, 1), (12, 1), (15, 2)],
  term ((397491232950237887996184205565539271127191104441069376 : Rat) / 46499947606600990925238671541813294873367321162373069) [(1, 1), (3, 1), (10, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 464 for generator 21. -/
theorem ep_Q2_024_partial_21_0464_valid :
    mulPoly ep_Q2_024_coefficient_21_0464
        ep_Q2_024_generator_21_0400_0499 =
      ep_Q2_024_partial_21_0464 := by
  native_decide

/-- Coefficient term 465 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0465 : Poly :=
[
  term ((-1581632301823296 : Rat) / 1162780221153193) [(1, 1), (3, 1), (10, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 465 for generator 21. -/
def ep_Q2_024_partial_21_0465 : Poly :=
[
  term ((1581632301823296 : Rat) / 1162780221153193) [(1, 1), (3, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-3163264603646592 : Rat) / 1162780221153193) [(1, 1), (3, 1), (10, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 465 for generator 21. -/
theorem ep_Q2_024_partial_21_0465_valid :
    mulPoly ep_Q2_024_coefficient_21_0465
        ep_Q2_024_generator_21_0400_0499 =
      ep_Q2_024_partial_21_0465 := by
  native_decide

/-- Coefficient term 466 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0466 : Poly :=
[
  term ((13665940368750242398805821778499109403651343582341271507 : Rat) / 929998952132019818504773430836265897467346423247461380) [(1, 1), (3, 1), (10, 1), (13, 1), (15, 1)]
]

/-- Partial product 466 for generator 21. -/
def ep_Q2_024_partial_21_0466 : Poly :=
[
  term ((-13665940368750242398805821778499109403651343582341271507 : Rat) / 929998952132019818504773430836265897467346423247461380) [(1, 1), (3, 1), (10, 1), (13, 1), (15, 1)],
  term ((13665940368750242398805821778499109403651343582341271507 : Rat) / 464999476066009909252386715418132948733673211623730690) [(1, 1), (3, 1), (10, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 466 for generator 21. -/
theorem ep_Q2_024_partial_21_0466_valid :
    mulPoly ep_Q2_024_coefficient_21_0466
        ep_Q2_024_generator_21_0400_0499 =
      ep_Q2_024_partial_21_0466 := by
  native_decide

/-- Coefficient term 467 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0467 : Poly :=
[
  term ((-106291408585995 : Rat) / 1162780221153193) [(1, 1), (3, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 467 for generator 21. -/
def ep_Q2_024_partial_21_0467 : Poly :=
[
  term ((106291408585995 : Rat) / 1162780221153193) [(1, 1), (3, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-212582817171990 : Rat) / 1162780221153193) [(1, 1), (3, 1), (10, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 467 for generator 21. -/
theorem ep_Q2_024_partial_21_0467_valid :
    mulPoly ep_Q2_024_coefficient_21_0467
        ep_Q2_024_generator_21_0400_0499 =
      ep_Q2_024_partial_21_0467 := by
  native_decide

/-- Coefficient term 468 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0468 : Poly :=
[
  term ((16187308625359244326701932651346745316 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (10, 1), (13, 2)]
]

/-- Partial product 468 for generator 21. -/
def ep_Q2_024_partial_21_0468 : Poly :=
[
  term ((-16187308625359244326701932651346745316 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (10, 1), (13, 2)],
  term ((32374617250718488653403865302693490632 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (10, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 468 for generator 21. -/
theorem ep_Q2_024_partial_21_0468_valid :
    mulPoly ep_Q2_024_coefficient_21_0468
        ep_Q2_024_generator_21_0400_0499 =
      ep_Q2_024_partial_21_0468 := by
  native_decide

/-- Coefficient term 469 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0469 : Poly :=
[
  term ((608824481858962455612092181941373992077 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (10, 1), (14, 1)]
]

/-- Partial product 469 for generator 21. -/
def ep_Q2_024_partial_21_0469 : Poly :=
[
  term ((-608824481858962455612092181941373992077 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (10, 1), (14, 1)],
  term ((1217648963717924911224184363882747984154 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (10, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 469 for generator 21. -/
theorem ep_Q2_024_partial_21_0469_valid :
    mulPoly ep_Q2_024_coefficient_21_0469
        ep_Q2_024_generator_21_0400_0499 =
      ep_Q2_024_partial_21_0469 := by
  native_decide

/-- Coefficient term 470 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0470 : Poly :=
[
  term ((-2298204085221019497339885976171791710852429622693000547 : Rat) / 47288082311797617890073225296759282922068462199023460) [(1, 1), (3, 1), (10, 1), (15, 2)]
]

/-- Partial product 470 for generator 21. -/
def ep_Q2_024_partial_21_0470 : Poly :=
[
  term ((2298204085221019497339885976171791710852429622693000547 : Rat) / 47288082311797617890073225296759282922068462199023460) [(1, 1), (3, 1), (10, 1), (15, 2)],
  term ((-2298204085221019497339885976171791710852429622693000547 : Rat) / 23644041155898808945036612648379641461034231099511730) [(1, 1), (3, 1), (10, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 470 for generator 21. -/
theorem ep_Q2_024_partial_21_0470_valid :
    mulPoly ep_Q2_024_coefficient_21_0470
        ep_Q2_024_generator_21_0400_0499 =
      ep_Q2_024_partial_21_0470 := by
  native_decide

/-- Coefficient term 471 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0471 : Poly :=
[
  term ((1048479305353675 : Rat) / 1162780221153193) [(1, 1), (3, 1), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 471 for generator 21. -/
def ep_Q2_024_partial_21_0471 : Poly :=
[
  term ((-1048479305353675 : Rat) / 1162780221153193) [(1, 1), (3, 1), (10, 1), (15, 2), (16, 1)],
  term ((2096958610707350 : Rat) / 1162780221153193) [(1, 1), (3, 1), (10, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 471 for generator 21. -/
theorem ep_Q2_024_partial_21_0471_valid :
    mulPoly ep_Q2_024_coefficient_21_0471
        ep_Q2_024_generator_21_0400_0499 =
      ep_Q2_024_partial_21_0471 := by
  native_decide

/-- Coefficient term 472 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0472 : Poly :=
[
  term ((44975123602223741861033454546231653929 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (12, 1)]
]

/-- Partial product 472 for generator 21. -/
def ep_Q2_024_partial_21_0472 : Poly :=
[
  term ((89950247204447483722066909092463307858 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (10, 1), (12, 1)],
  term ((-44975123602223741861033454546231653929 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 472 for generator 21. -/
theorem ep_Q2_024_partial_21_0472_valid :
    mulPoly ep_Q2_024_coefficient_21_0472
        ep_Q2_024_generator_21_0400_0499 =
      ep_Q2_024_partial_21_0472 := by
  native_decide

/-- Coefficient term 473 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0473 : Poly :=
[
  term ((-16636965510130334965330595005512180336 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 473 for generator 21. -/
def ep_Q2_024_partial_21_0473 : Poly :=
[
  term ((-33273931020260669930661190011024360672 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((16636965510130334965330595005512180336 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 473 for generator 21. -/
theorem ep_Q2_024_partial_21_0473_valid :
    mulPoly ep_Q2_024_coefficient_21_0473
        ep_Q2_024_generator_21_0400_0499 =
      ep_Q2_024_partial_21_0473 := by
  native_decide

/-- Coefficient term 474 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0474 : Poly :=
[
  term ((99372808237559471999046051391384817781797776110267344 : Rat) / 46499947606600990925238671541813294873367321162373069) [(1, 1), (3, 1), (12, 1), (15, 2)]
]

/-- Partial product 474 for generator 21. -/
def ep_Q2_024_partial_21_0474 : Poly :=
[
  term ((198745616475118943998092102782769635563595552220534688 : Rat) / 46499947606600990925238671541813294873367321162373069) [(1, 1), (3, 1), (10, 1), (12, 1), (15, 2)],
  term ((-99372808237559471999046051391384817781797776110267344 : Rat) / 46499947606600990925238671541813294873367321162373069) [(1, 1), (3, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 474 for generator 21. -/
theorem ep_Q2_024_partial_21_0474_valid :
    mulPoly ep_Q2_024_coefficient_21_0474
        ep_Q2_024_generator_21_0400_0499 =
      ep_Q2_024_partial_21_0474 := by
  native_decide

/-- Coefficient term 475 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0475 : Poly :=
[
  term ((-790816150911648 : Rat) / 1162780221153193) [(1, 1), (3, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 475 for generator 21. -/
def ep_Q2_024_partial_21_0475 : Poly :=
[
  term ((-1581632301823296 : Rat) / 1162780221153193) [(1, 1), (3, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((790816150911648 : Rat) / 1162780221153193) [(1, 1), (3, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 475 for generator 21. -/
theorem ep_Q2_024_partial_21_0475_valid :
    mulPoly ep_Q2_024_coefficient_21_0475
        ep_Q2_024_generator_21_0400_0499 =
      ep_Q2_024_partial_21_0475 := by
  native_decide

/-- Coefficient term 476 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0476 : Poly :=
[
  term ((13665940368750242398805821778499109403651343582341271507 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(1, 1), (3, 1), (13, 1), (15, 1)]
]

/-- Partial product 476 for generator 21. -/
def ep_Q2_024_partial_21_0476 : Poly :=
[
  term ((13665940368750242398805821778499109403651343582341271507 : Rat) / 929998952132019818504773430836265897467346423247461380) [(1, 1), (3, 1), (10, 1), (13, 1), (15, 1)],
  term ((-13665940368750242398805821778499109403651343582341271507 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(1, 1), (3, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 476 for generator 21. -/
theorem ep_Q2_024_partial_21_0476_valid :
    mulPoly ep_Q2_024_coefficient_21_0476
        ep_Q2_024_generator_21_0400_0499 =
      ep_Q2_024_partial_21_0476 := by
  native_decide

/-- Coefficient term 477 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0477 : Poly :=
[
  term ((-106291408585995 : Rat) / 2325560442306386) [(1, 1), (3, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 477 for generator 21. -/
def ep_Q2_024_partial_21_0477 : Poly :=
[
  term ((-106291408585995 : Rat) / 1162780221153193) [(1, 1), (3, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((106291408585995 : Rat) / 2325560442306386) [(1, 1), (3, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 477 for generator 21. -/
theorem ep_Q2_024_partial_21_0477_valid :
    mulPoly ep_Q2_024_coefficient_21_0477
        ep_Q2_024_generator_21_0400_0499 =
      ep_Q2_024_partial_21_0477 := by
  native_decide

/-- Coefficient term 478 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0478 : Poly :=
[
  term ((8093654312679622163350966325673372658 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (13, 2)]
]

/-- Partial product 478 for generator 21. -/
def ep_Q2_024_partial_21_0478 : Poly :=
[
  term ((16187308625359244326701932651346745316 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (10, 1), (13, 2)],
  term ((-8093654312679622163350966325673372658 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 478 for generator 21. -/
theorem ep_Q2_024_partial_21_0478_valid :
    mulPoly ep_Q2_024_coefficient_21_0478
        ep_Q2_024_generator_21_0400_0499 =
      ep_Q2_024_partial_21_0478 := by
  native_decide

/-- Coefficient term 479 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0479 : Poly :=
[
  term ((608824481858962455612092181941373992077 : Rat) / 1199709457402477296566693528029539267990) [(1, 1), (3, 1), (14, 1)]
]

/-- Partial product 479 for generator 21. -/
def ep_Q2_024_partial_21_0479 : Poly :=
[
  term ((608824481858962455612092181941373992077 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (10, 1), (14, 1)],
  term ((-608824481858962455612092181941373992077 : Rat) / 1199709457402477296566693528029539267990) [(1, 1), (3, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 479 for generator 21. -/
theorem ep_Q2_024_partial_21_0479_valid :
    mulPoly ep_Q2_024_coefficient_21_0479
        ep_Q2_024_generator_21_0400_0499 =
      ep_Q2_024_partial_21_0479 := by
  native_decide

/-- Coefficient term 480 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0480 : Poly :=
[
  term ((-2298204085221019497339885976171791710852429622693000547 : Rat) / 94576164623595235780146450593518565844136924398046920) [(1, 1), (3, 1), (15, 2)]
]

/-- Partial product 480 for generator 21. -/
def ep_Q2_024_partial_21_0480 : Poly :=
[
  term ((-2298204085221019497339885976171791710852429622693000547 : Rat) / 47288082311797617890073225296759282922068462199023460) [(1, 1), (3, 1), (10, 1), (15, 2)],
  term ((2298204085221019497339885976171791710852429622693000547 : Rat) / 94576164623595235780146450593518565844136924398046920) [(1, 1), (3, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 480 for generator 21. -/
theorem ep_Q2_024_partial_21_0480_valid :
    mulPoly ep_Q2_024_coefficient_21_0480
        ep_Q2_024_generator_21_0400_0499 =
      ep_Q2_024_partial_21_0480 := by
  native_decide

/-- Coefficient term 481 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0481 : Poly :=
[
  term ((1048479305353675 : Rat) / 2325560442306386) [(1, 1), (3, 1), (15, 2), (16, 1)]
]

/-- Partial product 481 for generator 21. -/
def ep_Q2_024_partial_21_0481 : Poly :=
[
  term ((1048479305353675 : Rat) / 1162780221153193) [(1, 1), (3, 1), (10, 1), (15, 2), (16, 1)],
  term ((-1048479305353675 : Rat) / 2325560442306386) [(1, 1), (3, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 481 for generator 21. -/
theorem ep_Q2_024_partial_21_0481_valid :
    mulPoly ep_Q2_024_coefficient_21_0481
        ep_Q2_024_generator_21_0400_0499 =
      ep_Q2_024_partial_21_0481 := by
  native_decide

/-- Coefficient term 482 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0482 : Poly :=
[
  term ((-2077934561863747246144279575515194582868 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (4, 1), (8, 1), (9, 1)]
]

/-- Partial product 482 for generator 21. -/
def ep_Q2_024_partial_21_0482 : Poly :=
[
  term ((2077934561863747246144279575515194582868 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (4, 1), (8, 1), (9, 1)],
  term ((-4155869123727494492288559151030389165736 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (4, 1), (8, 1), (9, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 482 for generator 21. -/
theorem ep_Q2_024_partial_21_0482_valid :
    mulPoly ep_Q2_024_coefficient_21_0482
        ep_Q2_024_generator_21_0400_0499 =
      ep_Q2_024_partial_21_0482 := by
  native_decide

/-- Coefficient term 483 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0483 : Poly :=
[
  term ((724495973011091570460779609691605011712 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (4, 1), (8, 1), (12, 1), (13, 1)]
]

/-- Partial product 483 for generator 21. -/
def ep_Q2_024_partial_21_0483 : Poly :=
[
  term ((1448991946022183140921559219383210023424 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (4, 1), (8, 1), (10, 1), (12, 1), (13, 1)],
  term ((-724495973011091570460779609691605011712 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (4, 1), (8, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 483 for generator 21. -/
theorem ep_Q2_024_partial_21_0483_valid :
    mulPoly ep_Q2_024_coefficient_21_0483
        ep_Q2_024_generator_21_0400_0499 =
      ep_Q2_024_partial_21_0483 := by
  native_decide

/-- Coefficient term 484 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0484 : Poly :=
[
  term ((-6514192417025367636535306533436410173200464556298441932 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (4, 1), (8, 1), (12, 1), (15, 1)]
]

/-- Partial product 484 for generator 21. -/
def ep_Q2_024_partial_21_0484 : Poly :=
[
  term ((-13028384834050735273070613066872820346400929112596883864 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (4, 1), (8, 1), (10, 1), (12, 1), (15, 1)],
  term ((6514192417025367636535306533436410173200464556298441932 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (4, 1), (8, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 484 for generator 21. -/
theorem ep_Q2_024_partial_21_0484_valid :
    mulPoly ep_Q2_024_coefficient_21_0484
        ep_Q2_024_generator_21_0400_0499 =
      ep_Q2_024_partial_21_0484 := by
  native_decide

/-- Coefficient term 485 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0485 : Poly :=
[
  term ((4786310756398640 : Rat) / 1162780221153193) [(1, 1), (4, 1), (8, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 485 for generator 21. -/
def ep_Q2_024_partial_21_0485 : Poly :=
[
  term ((9572621512797280 : Rat) / 1162780221153193) [(1, 1), (4, 1), (8, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-4786310756398640 : Rat) / 1162780221153193) [(1, 1), (4, 1), (8, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 485 for generator 21. -/
theorem ep_Q2_024_partial_21_0485_valid :
    mulPoly ep_Q2_024_coefficient_21_0485
        ep_Q2_024_generator_21_0400_0499 =
      ep_Q2_024_partial_21_0485 := by
  native_decide

/-- Coefficient term 486 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0486 : Poly :=
[
  term ((-1003379935849568169621424530668169741952 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (4, 1), (8, 1), (13, 1)]
]

/-- Partial product 486 for generator 21. -/
def ep_Q2_024_partial_21_0486 : Poly :=
[
  term ((-2006759871699136339242849061336339483904 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (4, 1), (8, 1), (10, 1), (13, 1)],
  term ((1003379935849568169621424530668169741952 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (4, 1), (8, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 486 for generator 21. -/
theorem ep_Q2_024_partial_21_0486_valid :
    mulPoly ep_Q2_024_coefficient_21_0486
        ep_Q2_024_generator_21_0400_0499 =
      ep_Q2_024_partial_21_0486 := by
  native_decide

/-- Coefficient term 487 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0487 : Poly :=
[
  term ((-4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (4, 1), (8, 1), (13, 1), (14, 1)]
]

/-- Partial product 487 for generator 21. -/
def ep_Q2_024_partial_21_0487 : Poly :=
[
  term ((-8486750246624093521424296941571253888 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (4, 1), (8, 1), (10, 1), (13, 1), (14, 1)],
  term ((4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (4, 1), (8, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 487 for generator 21. -/
theorem ep_Q2_024_partial_21_0487_valid :
    mulPoly ep_Q2_024_coefficient_21_0487
        ep_Q2_024_generator_21_0400_0499 =
      ep_Q2_024_partial_21_0487 := by
  native_decide

/-- Coefficient term 488 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0488 : Poly :=
[
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (4, 1), (8, 1), (14, 1), (15, 1)]
]

/-- Partial product 488 for generator 21. -/
def ep_Q2_024_partial_21_0488 : Poly :=
[
  term ((-674456529895393409686477352003493571793009190155093372 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (4, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (4, 1), (8, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 488 for generator 21. -/
theorem ep_Q2_024_partial_21_0488_valid :
    mulPoly ep_Q2_024_coefficient_21_0488
        ep_Q2_024_generator_21_0400_0499 =
      ep_Q2_024_partial_21_0488 := by
  native_decide

/-- Coefficient term 489 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0489 : Poly :=
[
  term ((-833967741040952 : Rat) / 1162780221153193) [(1, 1), (4, 1), (8, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 489 for generator 21. -/
def ep_Q2_024_partial_21_0489 : Poly :=
[
  term ((-1667935482081904 : Rat) / 1162780221153193) [(1, 1), (4, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((833967741040952 : Rat) / 1162780221153193) [(1, 1), (4, 1), (8, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 489 for generator 21. -/
theorem ep_Q2_024_partial_21_0489_valid :
    mulPoly ep_Q2_024_coefficient_21_0489
        ep_Q2_024_generator_21_0400_0499 =
      ep_Q2_024_partial_21_0489 := by
  native_decide

/-- Coefficient term 490 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0490 : Poly :=
[
  term ((8308199115901668756672327390880749201075506018754630941 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (4, 1), (8, 1), (15, 1)]
]

/-- Partial product 490 for generator 21. -/
def ep_Q2_024_partial_21_0490 : Poly :=
[
  term ((16616398231803337513344654781761498402151012037509261882 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (4, 1), (8, 1), (10, 1), (15, 1)],
  term ((-8308199115901668756672327390880749201075506018754630941 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (4, 1), (8, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 490 for generator 21. -/
theorem ep_Q2_024_partial_21_0490_valid :
    mulPoly ep_Q2_024_coefficient_21_0490
        ep_Q2_024_generator_21_0400_0499 =
      ep_Q2_024_partial_21_0490 := by
  native_decide

/-- Coefficient term 491 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0491 : Poly :=
[
  term ((-2207098944527060 : Rat) / 1162780221153193) [(1, 1), (4, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 491 for generator 21. -/
def ep_Q2_024_partial_21_0491 : Poly :=
[
  term ((-4414197889054120 : Rat) / 1162780221153193) [(1, 1), (4, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((2207098944527060 : Rat) / 1162780221153193) [(1, 1), (4, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 491 for generator 21. -/
theorem ep_Q2_024_partial_21_0491_valid :
    mulPoly ep_Q2_024_coefficient_21_0491
        ep_Q2_024_generator_21_0400_0499 =
      ep_Q2_024_partial_21_0491 := by
  native_decide

/-- Coefficient term 492 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0492 : Poly :=
[
  term ((39356336260818292697062851203095641530 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (4, 1), (9, 1)]
]

/-- Partial product 492 for generator 21. -/
def ep_Q2_024_partial_21_0492 : Poly :=
[
  term ((-39356336260818292697062851203095641530 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (4, 1), (9, 1)],
  term ((78712672521636585394125702406191283060 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (4, 1), (9, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 492 for generator 21. -/
theorem ep_Q2_024_partial_21_0492_valid :
    mulPoly ep_Q2_024_coefficient_21_0492
        ep_Q2_024_generator_21_0400_0499 =
      ep_Q2_024_partial_21_0492 := by
  native_decide

/-- Coefficient term 493 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0493 : Poly :=
[
  term ((78712672521636585394125702406191283060 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (4, 1), (9, 1), (10, 1)]
]

/-- Partial product 493 for generator 21. -/
def ep_Q2_024_partial_21_0493 : Poly :=
[
  term ((-78712672521636585394125702406191283060 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (4, 1), (9, 1), (10, 1)],
  term ((157425345043273170788251404812382566120 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (4, 1), (9, 1), (10, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 493 for generator 21. -/
theorem ep_Q2_024_partial_21_0493_valid :
    mulPoly ep_Q2_024_coefficient_21_0493
        ep_Q2_024_generator_21_0400_0499 =
      ep_Q2_024_partial_21_0493 := by
  native_decide

/-- Coefficient term 494 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0494 : Poly :=
[
  term ((-184073186328059086660770392539015606464 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (4, 1), (10, 1), (12, 1), (13, 1)]
]

/-- Partial product 494 for generator 21. -/
def ep_Q2_024_partial_21_0494 : Poly :=
[
  term ((184073186328059086660770392539015606464 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (4, 1), (10, 1), (12, 1), (13, 1)],
  term ((-368146372656118173321540785078031212928 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (4, 1), (10, 2), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 494 for generator 21. -/
theorem ep_Q2_024_partial_21_0494_valid :
    mulPoly ep_Q2_024_coefficient_21_0494
        ep_Q2_024_generator_21_0400_0499 =
      ep_Q2_024_partial_21_0494 := by
  native_decide

/-- Coefficient term 495 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0495 : Poly :=
[
  term ((15107545144081276730057470020692546667471041729326529716 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (4, 1), (10, 1), (12, 1), (15, 1)]
]

/-- Partial product 495 for generator 21. -/
def ep_Q2_024_partial_21_0495 : Poly :=
[
  term ((-15107545144081276730057470020692546667471041729326529716 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (4, 1), (10, 1), (12, 1), (15, 1)],
  term ((30215090288162553460114940041385093334942083458653059432 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (4, 1), (10, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 495 for generator 21. -/
theorem ep_Q2_024_partial_21_0495_valid :
    mulPoly ep_Q2_024_coefficient_21_0495
        ep_Q2_024_generator_21_0400_0499 =
      ep_Q2_024_partial_21_0495 := by
  native_decide

/-- Coefficient term 496 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0496 : Poly :=
[
  term ((-4325483377037680 : Rat) / 1162780221153193) [(1, 1), (4, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 496 for generator 21. -/
def ep_Q2_024_partial_21_0496 : Poly :=
[
  term ((4325483377037680 : Rat) / 1162780221153193) [(1, 1), (4, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-8650966754075360 : Rat) / 1162780221153193) [(1, 1), (4, 1), (10, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 496 for generator 21. -/
theorem ep_Q2_024_partial_21_0496_valid :
    mulPoly ep_Q2_024_coefficient_21_0496
        ep_Q2_024_generator_21_0400_0499 =
      ep_Q2_024_partial_21_0496 := by
  native_decide

/-- Coefficient term 497 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0497 : Poly :=
[
  term ((645509305238028654827808150416689423256 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (4, 1), (10, 1), (13, 1)]
]

/-- Partial product 497 for generator 21. -/
def ep_Q2_024_partial_21_0497 : Poly :=
[
  term ((-645509305238028654827808150416689423256 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (4, 1), (10, 1), (13, 1)],
  term ((1291018610476057309655616300833378846512 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (4, 1), (10, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 497 for generator 21. -/
theorem ep_Q2_024_partial_21_0497_valid :
    mulPoly ep_Q2_024_coefficient_21_0497
        ep_Q2_024_generator_21_0400_0499 =
      ep_Q2_024_partial_21_0497 := by
  native_decide

/-- Coefficient term 498 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0498 : Poly :=
[
  term ((-60535569472895597225226556172030450948782658411068841308 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(1, 1), (4, 1), (10, 1), (15, 1)]
]

/-- Partial product 498 for generator 21. -/
def ep_Q2_024_partial_21_0498 : Poly :=
[
  term ((60535569472895597225226556172030450948782658411068841308 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(1, 1), (4, 1), (10, 1), (15, 1)],
  term ((-121071138945791194450453112344060901897565316822137682616 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(1, 1), (4, 1), (10, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 498 for generator 21. -/
theorem ep_Q2_024_partial_21_0498_valid :
    mulPoly ep_Q2_024_coefficient_21_0498
        ep_Q2_024_generator_21_0400_0499 =
      ep_Q2_024_partial_21_0498 := by
  native_decide

/-- Coefficient term 499 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0499 : Poly :=
[
  term ((3916275721085504 : Rat) / 1162780221153193) [(1, 1), (4, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 499 for generator 21. -/
def ep_Q2_024_partial_21_0499 : Poly :=
[
  term ((-3916275721085504 : Rat) / 1162780221153193) [(1, 1), (4, 1), (10, 1), (15, 1), (16, 1)],
  term ((7832551442171008 : Rat) / 1162780221153193) [(1, 1), (4, 1), (10, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 499 for generator 21. -/
theorem ep_Q2_024_partial_21_0499_valid :
    mulPoly ep_Q2_024_coefficient_21_0499
        ep_Q2_024_generator_21_0400_0499 =
      ep_Q2_024_partial_21_0499 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_024_partials_21_0400_0499 : List Poly :=
[
  ep_Q2_024_partial_21_0400,
  ep_Q2_024_partial_21_0401,
  ep_Q2_024_partial_21_0402,
  ep_Q2_024_partial_21_0403,
  ep_Q2_024_partial_21_0404,
  ep_Q2_024_partial_21_0405,
  ep_Q2_024_partial_21_0406,
  ep_Q2_024_partial_21_0407,
  ep_Q2_024_partial_21_0408,
  ep_Q2_024_partial_21_0409,
  ep_Q2_024_partial_21_0410,
  ep_Q2_024_partial_21_0411,
  ep_Q2_024_partial_21_0412,
  ep_Q2_024_partial_21_0413,
  ep_Q2_024_partial_21_0414,
  ep_Q2_024_partial_21_0415,
  ep_Q2_024_partial_21_0416,
  ep_Q2_024_partial_21_0417,
  ep_Q2_024_partial_21_0418,
  ep_Q2_024_partial_21_0419,
  ep_Q2_024_partial_21_0420,
  ep_Q2_024_partial_21_0421,
  ep_Q2_024_partial_21_0422,
  ep_Q2_024_partial_21_0423,
  ep_Q2_024_partial_21_0424,
  ep_Q2_024_partial_21_0425,
  ep_Q2_024_partial_21_0426,
  ep_Q2_024_partial_21_0427,
  ep_Q2_024_partial_21_0428,
  ep_Q2_024_partial_21_0429,
  ep_Q2_024_partial_21_0430,
  ep_Q2_024_partial_21_0431,
  ep_Q2_024_partial_21_0432,
  ep_Q2_024_partial_21_0433,
  ep_Q2_024_partial_21_0434,
  ep_Q2_024_partial_21_0435,
  ep_Q2_024_partial_21_0436,
  ep_Q2_024_partial_21_0437,
  ep_Q2_024_partial_21_0438,
  ep_Q2_024_partial_21_0439,
  ep_Q2_024_partial_21_0440,
  ep_Q2_024_partial_21_0441,
  ep_Q2_024_partial_21_0442,
  ep_Q2_024_partial_21_0443,
  ep_Q2_024_partial_21_0444,
  ep_Q2_024_partial_21_0445,
  ep_Q2_024_partial_21_0446,
  ep_Q2_024_partial_21_0447,
  ep_Q2_024_partial_21_0448,
  ep_Q2_024_partial_21_0449,
  ep_Q2_024_partial_21_0450,
  ep_Q2_024_partial_21_0451,
  ep_Q2_024_partial_21_0452,
  ep_Q2_024_partial_21_0453,
  ep_Q2_024_partial_21_0454,
  ep_Q2_024_partial_21_0455,
  ep_Q2_024_partial_21_0456,
  ep_Q2_024_partial_21_0457,
  ep_Q2_024_partial_21_0458,
  ep_Q2_024_partial_21_0459,
  ep_Q2_024_partial_21_0460,
  ep_Q2_024_partial_21_0461,
  ep_Q2_024_partial_21_0462,
  ep_Q2_024_partial_21_0463,
  ep_Q2_024_partial_21_0464,
  ep_Q2_024_partial_21_0465,
  ep_Q2_024_partial_21_0466,
  ep_Q2_024_partial_21_0467,
  ep_Q2_024_partial_21_0468,
  ep_Q2_024_partial_21_0469,
  ep_Q2_024_partial_21_0470,
  ep_Q2_024_partial_21_0471,
  ep_Q2_024_partial_21_0472,
  ep_Q2_024_partial_21_0473,
  ep_Q2_024_partial_21_0474,
  ep_Q2_024_partial_21_0475,
  ep_Q2_024_partial_21_0476,
  ep_Q2_024_partial_21_0477,
  ep_Q2_024_partial_21_0478,
  ep_Q2_024_partial_21_0479,
  ep_Q2_024_partial_21_0480,
  ep_Q2_024_partial_21_0481,
  ep_Q2_024_partial_21_0482,
  ep_Q2_024_partial_21_0483,
  ep_Q2_024_partial_21_0484,
  ep_Q2_024_partial_21_0485,
  ep_Q2_024_partial_21_0486,
  ep_Q2_024_partial_21_0487,
  ep_Q2_024_partial_21_0488,
  ep_Q2_024_partial_21_0489,
  ep_Q2_024_partial_21_0490,
  ep_Q2_024_partial_21_0491,
  ep_Q2_024_partial_21_0492,
  ep_Q2_024_partial_21_0493,
  ep_Q2_024_partial_21_0494,
  ep_Q2_024_partial_21_0495,
  ep_Q2_024_partial_21_0496,
  ep_Q2_024_partial_21_0497,
  ep_Q2_024_partial_21_0498,
  ep_Q2_024_partial_21_0499
]

/-- Sum of partial products in this block. -/
def ep_Q2_024_block_21_0400_0499 : Poly :=
[
  term ((99588034536269143179180521288457931024 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (8, 1), (10, 1), (12, 1), (13, 1)],
  term ((-183488243113488394739718246684116996552696960175428317 : Rat) / 46499947606600990925238671541813294873367321162373069) [(1, 1), (2, 1), (8, 1), (10, 1), (12, 1), (15, 1)],
  term ((868923361052644 : Rat) / 1162780221153193) [(1, 1), (2, 1), (8, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-7543819276985621434615141908363628544216 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (2, 1), (8, 1), (10, 1), (13, 1)],
  term ((-39283572369200916170526061558796625062192931994435226507 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (2, 1), (8, 1), (10, 1), (15, 1)],
  term ((-112865248485099940 : Rat) / 3488340663459579) [(1, 1), (2, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-49794017268134571589590260644228965512 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (8, 1), (12, 1), (13, 1)],
  term ((183488243113488394739718246684116996552696960175428317 : Rat) / 92999895213201981850477343083626589746734642324746138) [(1, 1), (2, 1), (8, 1), (12, 1), (15, 1)],
  term ((-434461680526322 : Rat) / 1162780221153193) [(1, 1), (2, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((3771909638492810717307570954181814272108 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (2, 1), (8, 1), (13, 1)],
  term ((39283572369200916170526061558796625062192931994435226507 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(1, 1), (2, 1), (8, 1), (15, 1)],
  term ((56432624242549970 : Rat) / 3488340663459579) [(1, 1), (2, 1), (8, 1), (15, 1), (16, 1)],
  term ((-290166291591549053397263195682554175676 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (9, 1)],
  term ((1160665166366196213589052782730216702704 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (9, 1), (10, 2)],
  term ((-120119693188535354558813178622554671224 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (10, 2), (12, 1), (13, 1)],
  term ((6544627211193844374324207850933658385537878969261824301 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(1, 1), (2, 1), (10, 2), (12, 1), (15, 1)],
  term ((-896456281639118 : Rat) / 1162780221153193) [(1, 1), (2, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((1852269918245786896743252716934311896384 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (10, 2), (13, 1)],
  term ((123791873617191140105857464850579092705757151288775427373 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(1, 1), (2, 1), (10, 2), (15, 1)],
  term ((13766191430316001 : Rat) / 1162780221153193) [(1, 1), (2, 1), (10, 2), (15, 1), (16, 1)],
  term ((30029923297133838639703294655638667806 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (12, 1), (13, 1)],
  term ((-6544627211193844374324207850933658385537878969261824301 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(1, 1), (2, 1), (12, 1), (15, 1)],
  term ((448228140819559 : Rat) / 2325560442306386) [(1, 1), (2, 1), (12, 1), (15, 1), (16, 1)],
  term ((-463067479561446724185813179233577974096 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (13, 1)],
  term ((-123791873617191140105857464850579092705757151288775427373 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(1, 1), (2, 1), (15, 1)],
  term ((-13766191430316001 : Rat) / 4651120884612772) [(1, 1), (2, 1), (15, 1), (16, 1)],
  term ((161015996569390131355509874849465952311 : Rat) / 399903152467492432188897842676513089330) [(1, 1), (3, 1)],
  term ((732537308678412778282669871950328022754 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (4, 1)],
  term ((-2930149234713651113130679487801312091016 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (3, 1), (4, 1), (8, 1)],
  term ((5860298469427302226261358975602624182032 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (3, 1), (4, 1), (8, 1), (10, 1)],
  term ((-2930149234713651113130679487801312091016 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (4, 1), (10, 2)],
  term ((-621528342412223766817225469165983901984 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (5, 1), (8, 1), (9, 1)],
  term ((1243056684824447533634450938331967803968 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (5, 1), (8, 1), (9, 1), (10, 1)],
  term ((503005734901986808616341329448228543488 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (5, 1), (8, 1), (10, 1), (13, 1)],
  term ((-15202139694539879622530569361916731456740373092659462796 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (3, 1), (5, 1), (8, 1), (10, 1), (15, 1)],
  term ((-37331939674625744 : Rat) / 3488340663459579) [(1, 1), (3, 1), (5, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-251502867450993404308170664724114271744 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (5, 1), (8, 1), (13, 1)],
  term ((7601069847269939811265284680958365728370186546329731398 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (3, 1), (5, 1), (8, 1), (15, 1)],
  term ((18665969837312872 : Rat) / 3488340663459579) [(1, 1), (3, 1), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((12329420463575023800351311507033664732 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (3, 1), (5, 1), (9, 1)],
  term ((-49317681854300095201405246028134658928 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (3, 1), (5, 1), (9, 1), (10, 2)],
  term ((-315632835869024082553724632773528781792 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (5, 1), (10, 2), (13, 1)],
  term ((1811299784973824230875406183033057284638177346638046560 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (3, 1), (5, 1), (10, 2), (15, 1)],
  term ((6527709106782976 : Rat) / 1162780221153193) [(1, 1), (3, 1), (5, 1), (10, 2), (15, 1), (16, 1)],
  term ((78908208967256020638431158193382195448 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (5, 1), (13, 1)],
  term ((-452824946243456057718851545758264321159544336659511640 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (3, 1), (5, 1), (15, 1)],
  term ((-1631927276695744 : Rat) / 1162780221153193) [(1, 1), (3, 1), (5, 1), (15, 1), (16, 1)],
  term ((-10818398912636017292589007364524963681112 : Rat) / 5398692558311147834550120876132926705955) [(1, 1), (3, 1), (8, 1)],
  term ((73424885016391334592524874103881802976 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (8, 1), (9, 1), (10, 1), (13, 1)],
  term ((2290696804451168831783848563296676872323742434583050994 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(1, 1), (3, 1), (8, 1), (9, 1), (10, 1), (15, 1)],
  term ((1495148449544936 : Rat) / 3488340663459579) [(1, 1), (3, 1), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-36712442508195667296262437051940901488 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (8, 1), (9, 1), (13, 1)],
  term ((-1145348402225584415891924281648338436161871217291525497 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(1, 1), (3, 1), (8, 1), (9, 1), (15, 1)],
  term ((-747574224772468 : Rat) / 3488340663459579) [(1, 1), (3, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-63112532186469946331305143931700421056 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (8, 1), (9, 2)],
  term ((126225064372939892662610287863400842112 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (8, 1), (9, 2), (10, 1)],
  term ((14199669747919880649490182157118111088448 : Rat) / 5398692558311147834550120876132926705955) [(1, 1), (3, 1), (8, 1), (10, 1)],
  term ((-359800988817789934888267636369853231432 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (8, 1), (10, 1), (12, 1)],
  term ((145368386206251761864564319784992840704 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (8, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-12598300087952842907633674886908492089457988774768012048 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (3, 1), (8, 1), (10, 1), (12, 1), (15, 2)],
  term ((5548604100360896 : Rat) / 1162780221153193) [(1, 1), (3, 1), (8, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-5982837320379845651599041426655130663707208580347239615 : Rat) / 418499528459408918327148043876319653860305890461357621) [(1, 1), (3, 1), (8, 1), (10, 1), (13, 1), (15, 1)],
  term ((10375057428886340 : Rat) / 3488340663459579) [(1, 1), (3, 1), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-394147835050448810694877824632526207856 : Rat) / 359912837220743188970008058408861780397) [(1, 1), (3, 1), (8, 1), (10, 1), (13, 2)],
  term ((-508470349154038865005416199007327333444 : Rat) / 359912837220743188970008058408861780397) [(1, 1), (3, 1), (8, 1), (10, 1), (14, 1)],
  term ((82347741131251639543090079971480487940289810843827224336 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(1, 1), (3, 1), (8, 1), (10, 1), (15, 2)],
  term ((28979257499406016 : Rat) / 3488340663459579) [(1, 1), (3, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((1652695128300478652375073904873736949728 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (8, 1), (10, 2)],
  term ((179900494408894967444133818184926615716 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (8, 1), (12, 1)],
  term ((-72684193103125880932282159892496420352 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((6299150043976421453816837443454246044728994387384006024 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (3, 1), (8, 1), (12, 1), (15, 2)],
  term ((-2774302050180448 : Rat) / 1162780221153193) [(1, 1), (3, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((5982837320379845651599041426655130663707208580347239615 : Rat) / 836999056918817836654296087752639307720611780922715242) [(1, 1), (3, 1), (8, 1), (13, 1), (15, 1)],
  term ((-5187528714443170 : Rat) / 3488340663459579) [(1, 1), (3, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((197073917525224405347438912316263103928 : Rat) / 359912837220743188970008058408861780397) [(1, 1), (3, 1), (8, 1), (13, 2)],
  term ((254235174577019432502708099503663666722 : Rat) / 359912837220743188970008058408861780397) [(1, 1), (3, 1), (8, 1), (14, 1)],
  term ((-41173870565625819771545039985740243970144905421913612168 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(1, 1), (3, 1), (8, 1), (15, 2)],
  term ((-14489628749703008 : Rat) / 3488340663459579) [(1, 1), (3, 1), (8, 1), (15, 2), (16, 1)],
  term ((1652695128300478652375073904873736949728 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (3, 1), (8, 2)],
  term ((-3305390256600957304750147809747473899456 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (3, 1), (8, 2), (10, 1)],
  term ((-234824404481097668778610925125521767712 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (9, 1), (10, 2), (13, 1)],
  term ((1222689308379968181009349179356074961661002890148376823 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (3, 1), (9, 1), (10, 2), (15, 1)],
  term ((-2242722674317404 : Rat) / 1162780221153193) [(1, 1), (3, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((58706101120274417194652731281380441928 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (9, 1), (13, 1)],
  term ((-1222689308379968181009349179356074961661002890148376823 : Rat) / 929998952132019818504773430836265897467346423247461380) [(1, 1), (3, 1), (9, 1), (15, 1)],
  term ((560680668579351 : Rat) / 1162780221153193) [(1, 1), (3, 1), (9, 1), (15, 1), (16, 1)],
  term ((47334399139852459748478857948775315792 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (9, 2)],
  term ((-189337596559409838993915431795101263168 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (9, 2), (10, 2)],
  term ((-322031993138780262711019749698931904622 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (10, 2)],
  term ((179900494408894967444133818184926615716 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (10, 2), (12, 1)],
  term ((-66547862040521339861322380022048721344 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (10, 2), (12, 1), (13, 1), (15, 1)],
  term ((397491232950237887996184205565539271127191104441069376 : Rat) / 46499947606600990925238671541813294873367321162373069) [(1, 1), (3, 1), (10, 2), (12, 1), (15, 2)],
  term ((-3163264603646592 : Rat) / 1162780221153193) [(1, 1), (3, 1), (10, 2), (12, 1), (15, 2), (16, 1)],
  term ((13665940368750242398805821778499109403651343582341271507 : Rat) / 464999476066009909252386715418132948733673211623730690) [(1, 1), (3, 1), (10, 2), (13, 1), (15, 1)],
  term ((-212582817171990 : Rat) / 1162780221153193) [(1, 1), (3, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((32374617250718488653403865302693490632 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (10, 2), (13, 2)],
  term ((1217648963717924911224184363882747984154 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (10, 2), (14, 1)],
  term ((-2298204085221019497339885976171791710852429622693000547 : Rat) / 23644041155898808945036612648379641461034231099511730) [(1, 1), (3, 1), (10, 2), (15, 2)],
  term ((2096958610707350 : Rat) / 1162780221153193) [(1, 1), (3, 1), (10, 2), (15, 2), (16, 1)],
  term ((-44975123602223741861033454546231653929 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (12, 1)],
  term ((16636965510130334965330595005512180336 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (12, 1), (13, 1), (15, 1)],
  term ((-99372808237559471999046051391384817781797776110267344 : Rat) / 46499947606600990925238671541813294873367321162373069) [(1, 1), (3, 1), (12, 1), (15, 2)],
  term ((790816150911648 : Rat) / 1162780221153193) [(1, 1), (3, 1), (12, 1), (15, 2), (16, 1)],
  term ((-13665940368750242398805821778499109403651343582341271507 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(1, 1), (3, 1), (13, 1), (15, 1)],
  term ((106291408585995 : Rat) / 2325560442306386) [(1, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((-8093654312679622163350966325673372658 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (13, 2)],
  term ((-608824481858962455612092181941373992077 : Rat) / 1199709457402477296566693528029539267990) [(1, 1), (3, 1), (14, 1)],
  term ((2298204085221019497339885976171791710852429622693000547 : Rat) / 94576164623595235780146450593518565844136924398046920) [(1, 1), (3, 1), (15, 2)],
  term ((-1048479305353675 : Rat) / 2325560442306386) [(1, 1), (3, 1), (15, 2), (16, 1)],
  term ((2077934561863747246144279575515194582868 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (4, 1), (8, 1), (9, 1)],
  term ((-4155869123727494492288559151030389165736 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (4, 1), (8, 1), (9, 1), (10, 1)],
  term ((1448991946022183140921559219383210023424 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (4, 1), (8, 1), (10, 1), (12, 1), (13, 1)],
  term ((-13028384834050735273070613066872820346400929112596883864 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (4, 1), (8, 1), (10, 1), (12, 1), (15, 1)],
  term ((9572621512797280 : Rat) / 1162780221153193) [(1, 1), (4, 1), (8, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2006759871699136339242849061336339483904 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (4, 1), (8, 1), (10, 1), (13, 1)],
  term ((-8486750246624093521424296941571253888 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (4, 1), (8, 1), (10, 1), (13, 1), (14, 1)],
  term ((-674456529895393409686477352003493571793009190155093372 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (4, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((-1667935482081904 : Rat) / 1162780221153193) [(1, 1), (4, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((16616398231803337513344654781761498402151012037509261882 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (4, 1), (8, 1), (10, 1), (15, 1)],
  term ((-4414197889054120 : Rat) / 1162780221153193) [(1, 1), (4, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-724495973011091570460779609691605011712 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (4, 1), (8, 1), (12, 1), (13, 1)],
  term ((6514192417025367636535306533436410173200464556298441932 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (4, 1), (8, 1), (12, 1), (15, 1)],
  term ((-4786310756398640 : Rat) / 1162780221153193) [(1, 1), (4, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((1003379935849568169621424530668169741952 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (4, 1), (8, 1), (13, 1)],
  term ((4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (4, 1), (8, 1), (13, 1), (14, 1)],
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (4, 1), (8, 1), (14, 1), (15, 1)],
  term ((833967741040952 : Rat) / 1162780221153193) [(1, 1), (4, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-8308199115901668756672327390880749201075506018754630941 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (4, 1), (8, 1), (15, 1)],
  term ((2207098944527060 : Rat) / 1162780221153193) [(1, 1), (4, 1), (8, 1), (15, 1), (16, 1)],
  term ((-39356336260818292697062851203095641530 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (4, 1), (9, 1)],
  term ((157425345043273170788251404812382566120 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (4, 1), (9, 1), (10, 2)],
  term ((184073186328059086660770392539015606464 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (4, 1), (10, 1), (12, 1), (13, 1)],
  term ((-15107545144081276730057470020692546667471041729326529716 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (4, 1), (10, 1), (12, 1), (15, 1)],
  term ((4325483377037680 : Rat) / 1162780221153193) [(1, 1), (4, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-645509305238028654827808150416689423256 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (4, 1), (10, 1), (13, 1)],
  term ((60535569472895597225226556172030450948782658411068841308 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(1, 1), (4, 1), (10, 1), (15, 1)],
  term ((-3916275721085504 : Rat) / 1162780221153193) [(1, 1), (4, 1), (10, 1), (15, 1), (16, 1)],
  term ((-368146372656118173321540785078031212928 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (4, 1), (10, 2), (12, 1), (13, 1)],
  term ((30215090288162553460114940041385093334942083458653059432 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (4, 1), (10, 2), (12, 1), (15, 1)],
  term ((-8650966754075360 : Rat) / 1162780221153193) [(1, 1), (4, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((1291018610476057309655616300833378846512 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (4, 1), (10, 2), (13, 1)],
  term ((-121071138945791194450453112344060901897565316822137682616 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(1, 1), (4, 1), (10, 2), (15, 1)],
  term ((7832551442171008 : Rat) / 1162780221153193) [(1, 1), (4, 1), (10, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 21, terms 400 through 499. -/
theorem ep_Q2_024_block_21_0400_0499_valid :
    checkProductSumEq ep_Q2_024_partials_21_0400_0499
      ep_Q2_024_block_21_0400_0499 = true := by
  native_decide

end EpQ2024TermShards

end Patterns

end EndpointCertificate

end Problem97
