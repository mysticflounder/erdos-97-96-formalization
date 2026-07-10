/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_024, term block 15:300-399

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_024`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2024TermShards

/-- Generator polynomial 15 for endpoint certificate `ep_Q2_024`. -/
def ep_Q2_024_generator_15_0300_0399 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(6, 1)]
]

/-- Coefficient term 300 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0300 : Poly :=
[
  term ((4626080026086592 : Rat) / 1162780221153193) [(0, 1), (7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 300 for generator 15. -/
def ep_Q2_024_partial_15_0300 : Poly :=
[
  term ((9252160052173184 : Rat) / 1162780221153193) [(0, 1), (6, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-4626080026086592 : Rat) / 1162780221153193) [(0, 1), (7, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 300 for generator 15. -/
theorem ep_Q2_024_partial_15_0300_valid :
    mulPoly ep_Q2_024_coefficient_15_0300
        ep_Q2_024_generator_15_0300_0399 =
      ep_Q2_024_partial_15_0300 := by
  native_decide

/-- Coefficient term 301 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0301 : Poly :=
[
  term ((-387144995139613071025184935167916988612 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (12, 2), (13, 1)]
]

/-- Partial product 301 for generator 15. -/
def ep_Q2_024_partial_15_0301 : Poly :=
[
  term ((-774289990279226142050369870335833977224 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (6, 1), (7, 1), (12, 2), (13, 1)],
  term ((387144995139613071025184935167916988612 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (12, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 301 for generator 15. -/
theorem ep_Q2_024_partial_15_0301_valid :
    mulPoly ep_Q2_024_coefficient_15_0301
        ep_Q2_024_generator_15_0300_0399 =
      ep_Q2_024_partial_15_0301 := by
  native_decide

/-- Coefficient term 302 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0302 : Poly :=
[
  term ((13945826049618177246769204300293405329164413913474025449 : Rat) / 929998952132019818504773430836265897467346423247461380) [(0, 1), (7, 1), (12, 2), (15, 1)]
]

/-- Partial product 302 for generator 15. -/
def ep_Q2_024_partial_15_0302 : Poly :=
[
  term ((13945826049618177246769204300293405329164413913474025449 : Rat) / 464999476066009909252386715418132948733673211623730690) [(0, 1), (6, 1), (7, 1), (12, 2), (15, 1)],
  term ((-13945826049618177246769204300293405329164413913474025449 : Rat) / 929998952132019818504773430836265897467346423247461380) [(0, 1), (7, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 302 for generator 15. -/
theorem ep_Q2_024_partial_15_0302_valid :
    mulPoly ep_Q2_024_coefficient_15_0302
        ep_Q2_024_generator_15_0300_0399 =
      ep_Q2_024_partial_15_0302 := by
  native_decide

/-- Coefficient term 303 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0303 : Poly :=
[
  term ((-2610386218462481 : Rat) / 1162780221153193) [(0, 1), (7, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 303 for generator 15. -/
def ep_Q2_024_partial_15_0303 : Poly :=
[
  term ((-5220772436924962 : Rat) / 1162780221153193) [(0, 1), (6, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((2610386218462481 : Rat) / 1162780221153193) [(0, 1), (7, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 303 for generator 15. -/
theorem ep_Q2_024_partial_15_0303_valid :
    mulPoly ep_Q2_024_coefficient_15_0303
        ep_Q2_024_generator_15_0300_0399 =
      ep_Q2_024_partial_15_0303 := by
  native_decide

/-- Coefficient term 304 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0304 : Poly :=
[
  term ((-33330114742951384695238648668304638695 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (7, 1), (13, 1)]
]

/-- Partial product 304 for generator 15. -/
def ep_Q2_024_partial_15_0304 : Poly :=
[
  term ((-66660229485902769390477297336609277390 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (6, 1), (7, 1), (13, 1)],
  term ((33330114742951384695238648668304638695 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 304 for generator 15. -/
theorem ep_Q2_024_partial_15_0304_valid :
    mulPoly ep_Q2_024_coefficient_15_0304
        ep_Q2_024_generator_15_0300_0399 =
      ep_Q2_024_partial_15_0304 := by
  native_decide

/-- Coefficient term 305 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0305 : Poly :=
[
  term ((-247810655771874826682077469121100104308 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (13, 1), (14, 1)]
]

/-- Partial product 305 for generator 15. -/
def ep_Q2_024_partial_15_0305 : Poly :=
[
  term ((-495621311543749653364154938242200208616 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (6, 1), (7, 1), (13, 1), (14, 1)],
  term ((247810655771874826682077469121100104308 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 305 for generator 15. -/
theorem ep_Q2_024_partial_15_0305_valid :
    mulPoly ep_Q2_024_coefficient_15_0305
        ep_Q2_024_generator_15_0300_0399 =
      ep_Q2_024_partial_15_0305 := by
  native_decide

/-- Coefficient term 306 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0306 : Poly :=
[
  term ((-2233057704898447277337521117967487825271887127131734968 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (7, 1), (13, 1), (15, 2)]
]

/-- Partial product 306 for generator 15. -/
def ep_Q2_024_partial_15_0306 : Poly :=
[
  term ((-4466115409796894554675042235934975650543774254263469936 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (6, 1), (7, 1), (13, 1), (15, 2)],
  term ((2233057704898447277337521117967487825271887127131734968 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (7, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 306 for generator 15. -/
theorem ep_Q2_024_partial_15_0306_valid :
    mulPoly ep_Q2_024_coefficient_15_0306
        ep_Q2_024_generator_15_0300_0399 =
      ep_Q2_024_partial_15_0306 := by
  native_decide

/-- Coefficient term 307 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0307 : Poly :=
[
  term ((449127554429600 : Rat) / 1162780221153193) [(0, 1), (7, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 307 for generator 15. -/
def ep_Q2_024_partial_15_0307 : Poly :=
[
  term ((898255108859200 : Rat) / 1162780221153193) [(0, 1), (6, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-449127554429600 : Rat) / 1162780221153193) [(0, 1), (7, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 307 for generator 15. -/
theorem ep_Q2_024_partial_15_0307_valid :
    mulPoly ep_Q2_024_coefficient_15_0307
        ep_Q2_024_generator_15_0300_0399 =
      ep_Q2_024_partial_15_0307 := by
  native_decide

/-- Coefficient term 308 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0308 : Poly :=
[
  term ((-23303003274098118356770852827110756224 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (13, 2), (15, 1)]
]

/-- Partial product 308 for generator 15. -/
def ep_Q2_024_partial_15_0308 : Poly :=
[
  term ((-46606006548196236713541705654221512448 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (6, 1), (7, 1), (13, 2), (15, 1)],
  term ((23303003274098118356770852827110756224 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 308 for generator 15. -/
theorem ep_Q2_024_partial_15_0308_valid :
    mulPoly ep_Q2_024_coefficient_15_0308
        ep_Q2_024_generator_15_0300_0399 =
      ep_Q2_024_partial_15_0308 := by
  native_decide

/-- Coefficient term 309 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0309 : Poly :=
[
  term ((-43399307162444072615649573376780395590797368741150161437 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(0, 1), (7, 1), (14, 1), (15, 1)]
]

/-- Partial product 309 for generator 15. -/
def ep_Q2_024_partial_15_0309 : Poly :=
[
  term ((-43399307162444072615649573376780395590797368741150161437 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (6, 1), (7, 1), (14, 1), (15, 1)],
  term ((43399307162444072615649573376780395590797368741150161437 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(0, 1), (7, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 309 for generator 15. -/
theorem ep_Q2_024_partial_15_0309_valid :
    mulPoly ep_Q2_024_coefficient_15_0309
        ep_Q2_024_generator_15_0300_0399 =
      ep_Q2_024_partial_15_0309 := by
  native_decide

/-- Coefficient term 310 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0310 : Poly :=
[
  term ((-6632049177465070 : Rat) / 1162780221153193) [(0, 1), (7, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 310 for generator 15. -/
def ep_Q2_024_partial_15_0310 : Poly :=
[
  term ((-13264098354930140 : Rat) / 1162780221153193) [(0, 1), (6, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((6632049177465070 : Rat) / 1162780221153193) [(0, 1), (7, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 310 for generator 15. -/
theorem ep_Q2_024_partial_15_0310_valid :
    mulPoly ep_Q2_024_coefficient_15_0310
        ep_Q2_024_generator_15_0300_0399 =
      ep_Q2_024_partial_15_0310 := by
  native_decide

/-- Coefficient term 311 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0311 : Poly :=
[
  term ((15834538621916634249952253233390088032099793442886131547 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (7, 1), (15, 1)]
]

/-- Partial product 311 for generator 15. -/
def ep_Q2_024_partial_15_0311 : Poly :=
[
  term ((31669077243833268499904506466780176064199586885772263094 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (6, 1), (7, 1), (15, 1)],
  term ((-15834538621916634249952253233390088032099793442886131547 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 311 for generator 15. -/
theorem ep_Q2_024_partial_15_0311_valid :
    mulPoly ep_Q2_024_coefficient_15_0311
        ep_Q2_024_generator_15_0300_0399 =
      ep_Q2_024_partial_15_0311 := by
  native_decide

/-- Coefficient term 312 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0312 : Poly :=
[
  term ((-2314053073690208 : Rat) / 1162780221153193) [(0, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 312 for generator 15. -/
def ep_Q2_024_partial_15_0312 : Poly :=
[
  term ((-4628106147380416 : Rat) / 1162780221153193) [(0, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((2314053073690208 : Rat) / 1162780221153193) [(0, 1), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 312 for generator 15. -/
theorem ep_Q2_024_partial_15_0312_valid :
    mulPoly ep_Q2_024_coefficient_15_0312
        ep_Q2_024_generator_15_0300_0399 =
      ep_Q2_024_partial_15_0312 := by
  native_decide

/-- Coefficient term 313 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0313 : Poly :=
[
  term ((-767004222895898018304123064203650935328 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (8, 1), (9, 1), (11, 1)]
]

/-- Partial product 313 for generator 15. -/
def ep_Q2_024_partial_15_0313 : Poly :=
[
  term ((-1534008445791796036608246128407301870656 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (6, 1), (8, 1), (9, 1), (11, 1)],
  term ((767004222895898018304123064203650935328 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (8, 1), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 313 for generator 15. -/
theorem ep_Q2_024_partial_15_0313_valid :
    mulPoly ep_Q2_024_coefficient_15_0313
        ep_Q2_024_generator_15_0300_0399 =
      ep_Q2_024_partial_15_0313 := by
  native_decide

/-- Coefficient term 314 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0314 : Poly :=
[
  term ((-72717458725663034642374466497815895100 : Rat) / 119970945740247729656669352802953926799) [(0, 1), (8, 1), (9, 1), (13, 1)]
]

/-- Partial product 314 for generator 15. -/
def ep_Q2_024_partial_15_0314 : Poly :=
[
  term ((-145434917451326069284748932995631790200 : Rat) / 119970945740247729656669352802953926799) [(0, 1), (6, 1), (8, 1), (9, 1), (13, 1)],
  term ((72717458725663034642374466497815895100 : Rat) / 119970945740247729656669352802953926799) [(0, 1), (8, 1), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 314 for generator 15. -/
theorem ep_Q2_024_partial_15_0314_valid :
    mulPoly ep_Q2_024_coefficient_15_0314
        ep_Q2_024_generator_15_0300_0399 =
      ep_Q2_024_partial_15_0314 := by
  native_decide

/-- Coefficient term 315 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0315 : Poly :=
[
  term ((-506392371480795721717351563439032240952 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (8, 1), (9, 1), (15, 1)]
]

/-- Partial product 315 for generator 15. -/
def ep_Q2_024_partial_15_0315 : Poly :=
[
  term ((-1012784742961591443434703126878064481904 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (6, 1), (8, 1), (9, 1), (15, 1)],
  term ((506392371480795721717351563439032240952 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (8, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 315 for generator 15. -/
theorem ep_Q2_024_partial_15_0315_valid :
    mulPoly ep_Q2_024_coefficient_15_0315
        ep_Q2_024_generator_15_0300_0399 =
      ep_Q2_024_partial_15_0315 := by
  native_decide

/-- Coefficient term 316 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0316 : Poly :=
[
  term ((-24897008634067285794795130322114482756 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (8, 1), (11, 1), (12, 1), (13, 1)]
]

/-- Partial product 316 for generator 15. -/
def ep_Q2_024_partial_15_0316 : Poly :=
[
  term ((-49794017268134571589590260644228965512 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (6, 1), (8, 1), (11, 1), (12, 1), (13, 1)],
  term ((24897008634067285794795130322114482756 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (8, 1), (11, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 316 for generator 15. -/
theorem ep_Q2_024_partial_15_0316_valid :
    mulPoly ep_Q2_024_coefficient_15_0316
        ep_Q2_024_generator_15_0300_0399 =
      ep_Q2_024_partial_15_0316 := by
  native_decide

/-- Coefficient term 317 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0317 : Poly :=
[
  term ((183488243113488394739718246684116996552696960175428317 : Rat) / 185999790426403963700954686167253179493469284649492276) [(0, 1), (8, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 317 for generator 15. -/
def ep_Q2_024_partial_15_0317 : Poly :=
[
  term ((183488243113488394739718246684116996552696960175428317 : Rat) / 92999895213201981850477343083626589746734642324746138) [(0, 1), (6, 1), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((-183488243113488394739718246684116996552696960175428317 : Rat) / 185999790426403963700954686167253179493469284649492276) [(0, 1), (8, 1), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 317 for generator 15. -/
theorem ep_Q2_024_partial_15_0317_valid :
    mulPoly ep_Q2_024_coefficient_15_0317
        ep_Q2_024_generator_15_0300_0399 =
      ep_Q2_024_partial_15_0317 := by
  native_decide

/-- Coefficient term 318 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0318 : Poly :=
[
  term ((-217230840263161 : Rat) / 1162780221153193) [(0, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 318 for generator 15. -/
def ep_Q2_024_partial_15_0318 : Poly :=
[
  term ((-434461680526322 : Rat) / 1162780221153193) [(0, 1), (6, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((217230840263161 : Rat) / 1162780221153193) [(0, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 318 for generator 15. -/
theorem ep_Q2_024_partial_15_0318_valid :
    mulPoly ep_Q2_024_coefficient_15_0318
        ep_Q2_024_generator_15_0300_0399 =
      ep_Q2_024_partial_15_0318 := by
  native_decide

/-- Coefficient term 319 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0319 : Poly :=
[
  term ((53350379086894917850057576181503338454 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (8, 1), (11, 1), (13, 1)]
]

/-- Partial product 319 for generator 15. -/
def ep_Q2_024_partial_15_0319 : Poly :=
[
  term ((106700758173789835700115152363006676908 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (6, 1), (8, 1), (11, 1), (13, 1)],
  term ((-53350379086894917850057576181503338454 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (8, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 319 for generator 15. -/
theorem ep_Q2_024_partial_15_0319_valid :
    mulPoly ep_Q2_024_coefficient_15_0319
        ep_Q2_024_generator_15_0300_0399 =
      ep_Q2_024_partial_15_0319 := by
  native_decide

/-- Coefficient term 320 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0320 : Poly :=
[
  term ((48108759476133175575601932414548705499224482451183624741 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(0, 1), (8, 1), (11, 1), (15, 1)]
]

/-- Partial product 320 for generator 15. -/
def ep_Q2_024_partial_15_0320 : Poly :=
[
  term ((48108759476133175575601932414548705499224482451183624741 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(0, 1), (6, 1), (8, 1), (11, 1), (15, 1)],
  term ((-48108759476133175575601932414548705499224482451183624741 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(0, 1), (8, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 320 for generator 15. -/
theorem ep_Q2_024_partial_15_0320_valid :
    mulPoly ep_Q2_024_coefficient_15_0320
        ep_Q2_024_generator_15_0300_0399 =
      ep_Q2_024_partial_15_0320 := by
  native_decide

/-- Coefficient term 321 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0321 : Poly :=
[
  term ((3743407177002399 : Rat) / 1162780221153193) [(0, 1), (8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 321 for generator 15. -/
def ep_Q2_024_partial_15_0321 : Poly :=
[
  term ((7486814354004798 : Rat) / 1162780221153193) [(0, 1), (6, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3743407177002399 : Rat) / 1162780221153193) [(0, 1), (8, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 321 for generator 15. -/
theorem ep_Q2_024_partial_15_0321_valid :
    mulPoly ep_Q2_024_coefficient_15_0321
        ep_Q2_024_generator_15_0300_0399 =
      ep_Q2_024_partial_15_0321 := by
  native_decide

/-- Coefficient term 322 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0322 : Poly :=
[
  term ((799996756466353500033804856778064370752021774909074641 : Rat) / 464999476066009909252386715418132948733673211623730690) [(0, 1), (8, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 322 for generator 15. -/
def ep_Q2_024_partial_15_0322 : Poly :=
[
  term ((799996756466353500033804856778064370752021774909074641 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (6, 1), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((-799996756466353500033804856778064370752021774909074641 : Rat) / 464999476066009909252386715418132948733673211623730690) [(0, 1), (8, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 322 for generator 15. -/
theorem ep_Q2_024_partial_15_0322_valid :
    mulPoly ep_Q2_024_coefficient_15_0322
        ep_Q2_024_generator_15_0300_0399 =
      ep_Q2_024_partial_15_0322 := by
  native_decide

/-- Coefficient term 323 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0323 : Poly :=
[
  term ((-434461680526322 : Rat) / 1162780221153193) [(0, 1), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 323 for generator 15. -/
def ep_Q2_024_partial_15_0323 : Poly :=
[
  term ((-868923361052644 : Rat) / 1162780221153193) [(0, 1), (6, 1), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((434461680526322 : Rat) / 1162780221153193) [(0, 1), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 323 for generator 15. -/
theorem ep_Q2_024_partial_15_0323_valid :
    mulPoly ep_Q2_024_coefficient_15_0323
        ep_Q2_024_generator_15_0300_0399 =
      ep_Q2_024_partial_15_0323 := by
  native_decide

/-- Coefficient term 324 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0324 : Poly :=
[
  term ((-49794017268134571589590260644228965512 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (8, 1), (12, 1), (13, 2)]
]

/-- Partial product 324 for generator 15. -/
def ep_Q2_024_partial_15_0324 : Poly :=
[
  term ((-99588034536269143179180521288457931024 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (6, 1), (8, 1), (12, 1), (13, 2)],
  term ((49794017268134571589590260644228965512 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (8, 1), (12, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 324 for generator 15. -/
theorem ep_Q2_024_partial_15_0324_valid :
    mulPoly ep_Q2_024_coefficient_15_0324
        ep_Q2_024_generator_15_0300_0399 =
      ep_Q2_024_partial_15_0324 := by
  native_decide

/-- Coefficient term 325 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0325 : Poly :=
[
  term ((1437231293075077337945305471875516563031012955059553048 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (8, 1), (12, 1), (15, 2)]
]

/-- Partial product 325 for generator 15. -/
def ep_Q2_024_partial_15_0325 : Poly :=
[
  term ((2874462586150154675890610943751033126062025910119106096 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (6, 1), (8, 1), (12, 1), (15, 2)],
  term ((-1437231293075077337945305471875516563031012955059553048 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (8, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 325 for generator 15. -/
theorem ep_Q2_024_partial_15_0325_valid :
    mulPoly ep_Q2_024_coefficient_15_0325
        ep_Q2_024_generator_15_0300_0399 =
      ep_Q2_024_partial_15_0325 := by
  native_decide

/-- Coefficient term 326 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0326 : Poly :=
[
  term ((-1719880515631584 : Rat) / 1162780221153193) [(0, 1), (8, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 326 for generator 15. -/
def ep_Q2_024_partial_15_0326 : Poly :=
[
  term ((-3439761031263168 : Rat) / 1162780221153193) [(0, 1), (6, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((1719880515631584 : Rat) / 1162780221153193) [(0, 1), (8, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 326 for generator 15. -/
theorem ep_Q2_024_partial_15_0326_valid :
    mulPoly ep_Q2_024_coefficient_15_0326
        ep_Q2_024_generator_15_0300_0399 =
      ep_Q2_024_partial_15_0326 := by
  native_decide

/-- Coefficient term 327 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0327 : Poly :=
[
  term ((65566409211952490903089322679846938896396436902847475191 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(0, 1), (8, 1), (13, 1), (15, 1)]
]

/-- Partial product 327 for generator 15. -/
def ep_Q2_024_partial_15_0327 : Poly :=
[
  term ((65566409211952490903089322679846938896396436902847475191 : Rat) / 929998952132019818504773430836265897467346423247461380) [(0, 1), (6, 1), (8, 1), (13, 1), (15, 1)],
  term ((-65566409211952490903089322679846938896396436902847475191 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(0, 1), (8, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 327 for generator 15. -/
theorem ep_Q2_024_partial_15_0327_valid :
    mulPoly ep_Q2_024_coefficient_15_0327
        ep_Q2_024_generator_15_0300_0399 =
      ep_Q2_024_partial_15_0327 := by
  native_decide

/-- Coefficient term 328 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0328 : Poly :=
[
  term ((-12052735889401519 : Rat) / 2325560442306386) [(0, 1), (8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 328 for generator 15. -/
def ep_Q2_024_partial_15_0328 : Poly :=
[
  term ((-12052735889401519 : Rat) / 1162780221153193) [(0, 1), (6, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((12052735889401519 : Rat) / 2325560442306386) [(0, 1), (8, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 328 for generator 15. -/
theorem ep_Q2_024_partial_15_0328_valid :
    mulPoly ep_Q2_024_coefficient_15_0328
        ep_Q2_024_generator_15_0300_0399 =
      ep_Q2_024_partial_15_0328 := by
  native_decide

/-- Coefficient term 329 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0329 : Poly :=
[
  term ((869174923315278713922140276349427500028 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (8, 1), (13, 2)]
]

/-- Partial product 329 for generator 15. -/
def ep_Q2_024_partial_15_0329 : Poly :=
[
  term ((1738349846630557427844280552698855000056 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (6, 1), (8, 1), (13, 2)],
  term ((-869174923315278713922140276349427500028 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (8, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 329 for generator 15. -/
theorem ep_Q2_024_partial_15_0329_valid :
    mulPoly ep_Q2_024_coefficient_15_0329
        ep_Q2_024_generator_15_0300_0399 =
      ep_Q2_024_partial_15_0329 := by
  native_decide

/-- Coefficient term 330 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0330 : Poly :=
[
  term ((401768618619887927735386102003931834017905121420943644301 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(0, 1), (8, 1), (15, 2)]
]

/-- Partial product 330 for generator 15. -/
def ep_Q2_024_partial_15_0330 : Poly :=
[
  term ((401768618619887927735386102003931834017905121420943644301 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(0, 1), (6, 1), (8, 1), (15, 2)],
  term ((-401768618619887927735386102003931834017905121420943644301 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(0, 1), (8, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 330 for generator 15. -/
theorem ep_Q2_024_partial_15_0330_valid :
    mulPoly ep_Q2_024_coefficient_15_0330
        ep_Q2_024_generator_15_0300_0399 =
      ep_Q2_024_partial_15_0330 := by
  native_decide

/-- Coefficient term 331 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0331 : Poly :=
[
  term ((-21350434125877295 : Rat) / 1162780221153193) [(0, 1), (8, 1), (15, 2), (16, 1)]
]

/-- Partial product 331 for generator 15. -/
def ep_Q2_024_partial_15_0331 : Poly :=
[
  term ((-42700868251754590 : Rat) / 1162780221153193) [(0, 1), (6, 1), (8, 1), (15, 2), (16, 1)],
  term ((21350434125877295 : Rat) / 1162780221153193) [(0, 1), (8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 331 for generator 15. -/
theorem ep_Q2_024_partial_15_0331_valid :
    mulPoly ep_Q2_024_coefficient_15_0331
        ep_Q2_024_generator_15_0300_0399 =
      ep_Q2_024_partial_15_0331 := by
  native_decide

/-- Coefficient term 332 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0332 : Poly :=
[
  term ((-2447319735340607314285149947135665212406 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (9, 1), (11, 1)]
]

/-- Partial product 332 for generator 15. -/
def ep_Q2_024_partial_15_0332 : Poly :=
[
  term ((-4894639470681214628570299894271330424812 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (6, 1), (9, 1), (11, 1)],
  term ((2447319735340607314285149947135665212406 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 332 for generator 15. -/
theorem ep_Q2_024_partial_15_0332_valid :
    mulPoly ep_Q2_024_coefficient_15_0332
        ep_Q2_024_generator_15_0300_0399 =
      ep_Q2_024_partial_15_0332 := by
  native_decide

/-- Coefficient term 333 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0333 : Poly :=
[
  term ((533815861733911924426634903247527072798 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (9, 1), (11, 1), (12, 1)]
]

/-- Partial product 333 for generator 15. -/
def ep_Q2_024_partial_15_0333 : Poly :=
[
  term ((1067631723467823848853269806495054145596 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (6, 1), (9, 1), (11, 1), (12, 1)],
  term ((-533815861733911924426634903247527072798 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (9, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 333 for generator 15. -/
theorem ep_Q2_024_partial_15_0333_valid :
    mulPoly ep_Q2_024_coefficient_15_0333
        ep_Q2_024_generator_15_0300_0399 =
      ep_Q2_024_partial_15_0333 := by
  native_decide

/-- Coefficient term 334 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0334 : Poly :=
[
  term ((6807794318018258181718731298492163559866 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (9, 1), (12, 1), (13, 1)]
]

/-- Partial product 334 for generator 15. -/
def ep_Q2_024_partial_15_0334 : Poly :=
[
  term ((13615588636036516363437462596984327119732 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (6, 1), (9, 1), (12, 1), (13, 1)],
  term ((-6807794318018258181718731298492163559866 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (9, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 334 for generator 15. -/
theorem ep_Q2_024_partial_15_0334_valid :
    mulPoly ep_Q2_024_coefficient_15_0334
        ep_Q2_024_generator_15_0300_0399 =
      ep_Q2_024_partial_15_0334 := by
  native_decide

/-- Coefficient term 335 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0335 : Poly :=
[
  term ((-20832684187302521370169494677733710414 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 335 for generator 15. -/
def ep_Q2_024_partial_15_0335 : Poly :=
[
  term ((-41665368374605042740338989355467420828 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (6, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((20832684187302521370169494677733710414 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 335 for generator 15. -/
theorem ep_Q2_024_partial_15_0335_valid :
    mulPoly ep_Q2_024_coefficient_15_0335
        ep_Q2_024_generator_15_0300_0399 =
      ep_Q2_024_partial_15_0335 := by
  native_decide

/-- Coefficient term 336 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0336 : Poly :=
[
  term ((142434490376858106430432061549109610044154416462805159 : Rat) / 94576164623595235780146450593518565844136924398046920) [(0, 1), (9, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 336 for generator 15. -/
def ep_Q2_024_partial_15_0336 : Poly :=
[
  term ((142434490376858106430432061549109610044154416462805159 : Rat) / 47288082311797617890073225296759282922068462199023460) [(0, 1), (6, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-142434490376858106430432061549109610044154416462805159 : Rat) / 94576164623595235780146450593518565844136924398046920) [(0, 1), (9, 1), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 336 for generator 15. -/
theorem ep_Q2_024_partial_15_0336_valid :
    mulPoly ep_Q2_024_coefficient_15_0336
        ep_Q2_024_generator_15_0300_0399 =
      ep_Q2_024_partial_15_0336 := by
  native_decide

/-- Coefficient term 337 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0337 : Poly :=
[
  term ((3162376093905513 : Rat) / 2325560442306386) [(0, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 337 for generator 15. -/
def ep_Q2_024_partial_15_0337 : Poly :=
[
  term ((3162376093905513 : Rat) / 1162780221153193) [(0, 1), (6, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3162376093905513 : Rat) / 2325560442306386) [(0, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 337 for generator 15. -/
theorem ep_Q2_024_partial_15_0337_valid :
    mulPoly ep_Q2_024_coefficient_15_0337
        ep_Q2_024_generator_15_0300_0399 =
      ep_Q2_024_partial_15_0337 := by
  native_decide

/-- Coefficient term 338 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0338 : Poly :=
[
  term ((-38480239436271484493086503340147890731077967162510275301 : Rat) / 3719995808528079274019093723345063589869385692989845520) [(0, 1), (9, 1), (12, 1), (15, 1)]
]

/-- Partial product 338 for generator 15. -/
def ep_Q2_024_partial_15_0338 : Poly :=
[
  term ((-38480239436271484493086503340147890731077967162510275301 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(0, 1), (6, 1), (9, 1), (12, 1), (15, 1)],
  term ((38480239436271484493086503340147890731077967162510275301 : Rat) / 3719995808528079274019093723345063589869385692989845520) [(0, 1), (9, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 338 for generator 15. -/
theorem ep_Q2_024_partial_15_0338_valid :
    mulPoly ep_Q2_024_coefficient_15_0338
        ep_Q2_024_generator_15_0300_0399 =
      ep_Q2_024_partial_15_0338 := by
  native_decide

/-- Coefficient term 339 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0339 : Poly :=
[
  term ((205123538457776647 : Rat) / 13953362653838316) [(0, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 339 for generator 15. -/
def ep_Q2_024_partial_15_0339 : Poly :=
[
  term ((205123538457776647 : Rat) / 6976681326919158) [(0, 1), (6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-205123538457776647 : Rat) / 13953362653838316) [(0, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 339 for generator 15. -/
theorem ep_Q2_024_partial_15_0339_valid :
    mulPoly ep_Q2_024_coefficient_15_0339
        ep_Q2_024_generator_15_0300_0399 =
      ep_Q2_024_partial_15_0339 := by
  native_decide

/-- Coefficient term 340 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0340 : Poly :=
[
  term ((-324902473554444856538197109362630781722 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 1), (12, 2), (13, 1)]
]

/-- Partial product 340 for generator 15. -/
def ep_Q2_024_partial_15_0340 : Poly :=
[
  term ((-649804947108889713076394218725261563444 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (6, 1), (9, 1), (12, 2), (13, 1)],
  term ((324902473554444856538197109362630781722 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 1), (12, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 340 for generator 15. -/
theorem ep_Q2_024_partial_15_0340_valid :
    mulPoly ep_Q2_024_coefficient_15_0340
        ep_Q2_024_generator_15_0300_0399 =
      ep_Q2_024_partial_15_0340 := by
  native_decide

/-- Coefficient term 341 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0341 : Poly :=
[
  term ((394990610532188891949922922601421792279854302077327847 : Rat) / 31525388207865078593382150197839521948045641466015640) [(0, 1), (9, 1), (12, 2), (15, 1)]
]

/-- Partial product 341 for generator 15. -/
def ep_Q2_024_partial_15_0341 : Poly :=
[
  term ((394990610532188891949922922601421792279854302077327847 : Rat) / 15762694103932539296691075098919760974022820733007820) [(0, 1), (6, 1), (9, 1), (12, 2), (15, 1)],
  term ((-394990610532188891949922922601421792279854302077327847 : Rat) / 31525388207865078593382150197839521948045641466015640) [(0, 1), (9, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 341 for generator 15. -/
theorem ep_Q2_024_partial_15_0341_valid :
    mulPoly ep_Q2_024_coefficient_15_0341
        ep_Q2_024_generator_15_0300_0399 =
      ep_Q2_024_partial_15_0341 := by
  native_decide

/-- Coefficient term 342 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0342 : Poly :=
[
  term ((-4134618235609157 : Rat) / 2325560442306386) [(0, 1), (9, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 342 for generator 15. -/
def ep_Q2_024_partial_15_0342 : Poly :=
[
  term ((-4134618235609157 : Rat) / 1162780221153193) [(0, 1), (6, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((4134618235609157 : Rat) / 2325560442306386) [(0, 1), (9, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 342 for generator 15. -/
theorem ep_Q2_024_partial_15_0342_valid :
    mulPoly ep_Q2_024_coefficient_15_0342
        ep_Q2_024_generator_15_0300_0399 =
      ep_Q2_024_partial_15_0342 := by
  native_decide

/-- Coefficient term 343 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0343 : Poly :=
[
  term ((1531933021081709072119717957739118589378 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 1), (13, 1)]
]

/-- Partial product 343 for generator 15. -/
def ep_Q2_024_partial_15_0343 : Poly :=
[
  term ((3063866042163418144239435915478237178756 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (6, 1), (9, 1), (13, 1)],
  term ((-1531933021081709072119717957739118589378 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 343 for generator 15. -/
theorem ep_Q2_024_partial_15_0343_valid :
    mulPoly ep_Q2_024_coefficient_15_0343
        ep_Q2_024_generator_15_0300_0399 =
      ep_Q2_024_partial_15_0343 := by
  native_decide

/-- Coefficient term 344 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0344 : Poly :=
[
  term ((-16713983635061800295710944182463693526988 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (9, 1), (13, 1), (14, 1)]
]

/-- Partial product 344 for generator 15. -/
def ep_Q2_024_partial_15_0344 : Poly :=
[
  term ((-33427967270123600591421888364927387053976 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (6, 1), (9, 1), (13, 1), (14, 1)],
  term ((16713983635061800295710944182463693526988 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (9, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 344 for generator 15. -/
theorem ep_Q2_024_partial_15_0344_valid :
    mulPoly ep_Q2_024_coefficient_15_0344
        ep_Q2_024_generator_15_0300_0399 =
      ep_Q2_024_partial_15_0344 := by
  native_decide

/-- Coefficient term 345 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0345 : Poly :=
[
  term ((2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 1), (13, 1), (14, 2)]
]

/-- Partial product 345 for generator 15. -/
def ep_Q2_024_partial_15_0345 : Poly :=
[
  term ((4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (6, 1), (9, 1), (13, 1), (14, 2)],
  term ((-2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 345 for generator 15. -/
theorem ep_Q2_024_partial_15_0345_valid :
    mulPoly ep_Q2_024_coefficient_15_0345
        ep_Q2_024_generator_15_0300_0399 =
      ep_Q2_024_partial_15_0345 := by
  native_decide

/-- Coefficient term 346 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0346 : Poly :=
[
  term ((-834404250815860718650117612725912883883086514060329882 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (9, 1), (13, 1), (15, 2)]
]

/-- Partial product 346 for generator 15. -/
def ep_Q2_024_partial_15_0346 : Poly :=
[
  term ((-1668808501631721437300235225451825767766173028120659764 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (6, 1), (9, 1), (13, 1), (15, 2)],
  term ((834404250815860718650117612725912883883086514060329882 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (9, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 346 for generator 15. -/
theorem ep_Q2_024_partial_15_0346_valid :
    mulPoly ep_Q2_024_coefficient_15_0346
        ep_Q2_024_generator_15_0300_0399 =
      ep_Q2_024_partial_15_0346 := by
  native_decide

/-- Coefficient term 347 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0347 : Poly :=
[
  term ((1495148449544936 : Rat) / 1162780221153193) [(0, 1), (9, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 347 for generator 15. -/
def ep_Q2_024_partial_15_0347 : Poly :=
[
  term ((2990296899089872 : Rat) / 1162780221153193) [(0, 1), (6, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1495148449544936 : Rat) / 1162780221153193) [(0, 1), (9, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 347 for generator 15. -/
theorem ep_Q2_024_partial_15_0347_valid :
    mulPoly ep_Q2_024_coefficient_15_0347
        ep_Q2_024_generator_15_0300_0399 =
      ep_Q2_024_partial_15_0347 := by
  native_decide

/-- Coefficient term 348 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0348 : Poly :=
[
  term ((156549602987398445852407283417014511808 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (9, 1), (13, 2), (15, 1)]
]

/-- Partial product 348 for generator 15. -/
def ep_Q2_024_partial_15_0348 : Poly :=
[
  term ((313099205974796891704814566834029023616 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (6, 1), (9, 1), (13, 2), (15, 1)],
  term ((-156549602987398445852407283417014511808 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (9, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 348 for generator 15. -/
theorem ep_Q2_024_partial_15_0348_valid :
    mulPoly ep_Q2_024_coefficient_15_0348
        ep_Q2_024_generator_15_0300_0399 =
      ep_Q2_024_partial_15_0348 := by
  native_decide

/-- Coefficient term 349 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0349 : Poly :=
[
  term ((-2002418325474702165940954778303900632785470807616778676351 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(0, 1), (9, 1), (14, 1), (15, 1)]
]

/-- Partial product 349 for generator 15. -/
def ep_Q2_024_partial_15_0349 : Poly :=
[
  term ((-2002418325474702165940954778303900632785470807616778676351 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(0, 1), (6, 1), (9, 1), (14, 1), (15, 1)],
  term ((2002418325474702165940954778303900632785470807616778676351 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(0, 1), (9, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 349 for generator 15. -/
theorem ep_Q2_024_partial_15_0349_valid :
    mulPoly ep_Q2_024_coefficient_15_0349
        ep_Q2_024_generator_15_0300_0399 =
      ep_Q2_024_partial_15_0349 := by
  native_decide

/-- Coefficient term 350 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0350 : Poly :=
[
  term ((316334434163404391 : Rat) / 13953362653838316) [(0, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 350 for generator 15. -/
def ep_Q2_024_partial_15_0350 : Poly :=
[
  term ((316334434163404391 : Rat) / 6976681326919158) [(0, 1), (6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-316334434163404391 : Rat) / 13953362653838316) [(0, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 350 for generator 15. -/
theorem ep_Q2_024_partial_15_0350_valid :
    mulPoly ep_Q2_024_coefficient_15_0350
        ep_Q2_024_generator_15_0300_0399 =
      ep_Q2_024_partial_15_0350 := by
  native_decide

/-- Coefficient term 351 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0351 : Poly :=
[
  term ((168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (9, 1), (14, 2), (15, 1)]
]

/-- Partial product 351 for generator 15. -/
def ep_Q2_024_partial_15_0351 : Poly :=
[
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (6, 1), (9, 1), (14, 2), (15, 1)],
  term ((-168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (9, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 351 for generator 15. -/
theorem ep_Q2_024_partial_15_0351_valid :
    mulPoly ep_Q2_024_coefficient_15_0351
        ep_Q2_024_generator_15_0300_0399 =
      ep_Q2_024_partial_15_0351 := by
  native_decide

/-- Coefficient term 352 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0352 : Poly :=
[
  term ((416983870520476 : Rat) / 1162780221153193) [(0, 1), (9, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 352 for generator 15. -/
def ep_Q2_024_partial_15_0352 : Poly :=
[
  term ((833967741040952 : Rat) / 1162780221153193) [(0, 1), (6, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-416983870520476 : Rat) / 1162780221153193) [(0, 1), (9, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 352 for generator 15. -/
theorem ep_Q2_024_partial_15_0352_valid :
    mulPoly ep_Q2_024_coefficient_15_0352
        ep_Q2_024_generator_15_0300_0399 =
      ep_Q2_024_partial_15_0352 := by
  native_decide

/-- Coefficient term 353 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0353 : Poly :=
[
  term ((1550507484768727951433704660965347082752825908852624715 : Rat) / 92999895213201981850477343083626589746734642324746138) [(0, 1), (9, 1), (15, 1)]
]

/-- Partial product 353 for generator 15. -/
def ep_Q2_024_partial_15_0353 : Poly :=
[
  term ((1550507484768727951433704660965347082752825908852624715 : Rat) / 46499947606600990925238671541813294873367321162373069) [(0, 1), (6, 1), (9, 1), (15, 1)],
  term ((-1550507484768727951433704660965347082752825908852624715 : Rat) / 92999895213201981850477343083626589746734642324746138) [(0, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 353 for generator 15. -/
theorem ep_Q2_024_partial_15_0353_valid :
    mulPoly ep_Q2_024_coefficient_15_0353
        ep_Q2_024_generator_15_0300_0399 =
      ep_Q2_024_partial_15_0353 := by
  native_decide

/-- Coefficient term 354 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0354 : Poly :=
[
  term ((-4293003821951139 : Rat) / 1162780221153193) [(0, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 354 for generator 15. -/
def ep_Q2_024_partial_15_0354 : Poly :=
[
  term ((-8586007643902278 : Rat) / 1162780221153193) [(0, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((4293003821951139 : Rat) / 1162780221153193) [(0, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 354 for generator 15. -/
theorem ep_Q2_024_partial_15_0354_valid :
    mulPoly ep_Q2_024_coefficient_15_0354
        ep_Q2_024_generator_15_0300_0399 =
      ep_Q2_024_partial_15_0354 := by
  native_decide

/-- Coefficient term 355 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0355 : Poly :=
[
  term ((-4466115409796894554675042235934975650543774254263469936 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (9, 1), (15, 3)]
]

/-- Partial product 355 for generator 15. -/
def ep_Q2_024_partial_15_0355 : Poly :=
[
  term ((-8932230819593789109350084471869951301087548508526939872 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (6, 1), (9, 1), (15, 3)],
  term ((4466115409796894554675042235934975650543774254263469936 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 355 for generator 15. -/
theorem ep_Q2_024_partial_15_0355_valid :
    mulPoly ep_Q2_024_coefficient_15_0355
        ep_Q2_024_generator_15_0300_0399 =
      ep_Q2_024_partial_15_0355 := by
  native_decide

/-- Coefficient term 356 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0356 : Poly :=
[
  term ((898255108859200 : Rat) / 1162780221153193) [(0, 1), (9, 1), (15, 3), (16, 1)]
]

/-- Partial product 356 for generator 15. -/
def ep_Q2_024_partial_15_0356 : Poly :=
[
  term ((1796510217718400 : Rat) / 1162780221153193) [(0, 1), (6, 1), (9, 1), (15, 3), (16, 1)],
  term ((-898255108859200 : Rat) / 1162780221153193) [(0, 1), (9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 356 for generator 15. -/
theorem ep_Q2_024_partial_15_0356_valid :
    mulPoly ep_Q2_024_coefficient_15_0356
        ep_Q2_024_generator_15_0300_0399 =
      ep_Q2_024_partial_15_0356 := by
  native_decide

/-- Coefficient term 357 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0357 : Poly :=
[
  term ((-1027163776190926062080157947196258556214 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 2)]
]

/-- Partial product 357 for generator 15. -/
def ep_Q2_024_partial_15_0357 : Poly :=
[
  term ((-2054327552381852124160315894392517112428 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (6, 1), (9, 2)],
  term ((1027163776190926062080157947196258556214 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 357 for generator 15. -/
theorem ep_Q2_024_partial_15_0357_valid :
    mulPoly ep_Q2_024_coefficient_15_0357
        ep_Q2_024_generator_15_0300_0399 =
      ep_Q2_024_partial_15_0357 := by
  native_decide

/-- Coefficient term 358 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0358 : Poly :=
[
  term ((-87347722320075781472246289012605149108 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (9, 2), (12, 1)]
]

/-- Partial product 358 for generator 15. -/
def ep_Q2_024_partial_15_0358 : Poly :=
[
  term ((-174695444640151562944492578025210298216 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (6, 1), (9, 2), (12, 1)],
  term ((87347722320075781472246289012605149108 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (9, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 358 for generator 15. -/
theorem ep_Q2_024_partial_15_0358_valid :
    mulPoly ep_Q2_024_coefficient_15_0358
        ep_Q2_024_generator_15_0300_0399 =
      ep_Q2_024_partial_15_0358 := by
  native_decide

/-- Coefficient term 359 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0359 : Poly :=
[
  term ((126225064372939892662610287863400842112 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (9, 2), (13, 1), (15, 1)]
]

/-- Partial product 359 for generator 15. -/
def ep_Q2_024_partial_15_0359 : Poly :=
[
  term ((252450128745879785325220575726801684224 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (6, 1), (9, 2), (13, 1), (15, 1)],
  term ((-126225064372939892662610287863400842112 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (9, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 359 for generator 15. -/
theorem ep_Q2_024_partial_15_0359_valid :
    mulPoly ep_Q2_024_coefficient_15_0359
        ep_Q2_024_generator_15_0300_0399 =
      ep_Q2_024_partial_15_0359 := by
  native_decide

/-- Coefficient term 360 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0360 : Poly :=
[
  term ((1738306788454232111334226452662003537172 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (9, 2), (14, 1)]
]

/-- Partial product 360 for generator 15. -/
def ep_Q2_024_partial_15_0360 : Poly :=
[
  term ((3476613576908464222668452905324007074344 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (6, 1), (9, 2), (14, 1)],
  term ((-1738306788454232111334226452662003537172 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (9, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 360 for generator 15. -/
theorem ep_Q2_024_partial_15_0360_valid :
    mulPoly ep_Q2_024_coefficient_15_0360
        ep_Q2_024_generator_15_0300_0399 =
      ep_Q2_024_partial_15_0360 := by
  native_decide

/-- Coefficient term 361 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0361 : Poly :=
[
  term ((56122364078813941405209503783771030930 : Rat) / 119970945740247729656669352802953926799) [(0, 1), (11, 1), (12, 1), (13, 1)]
]

/-- Partial product 361 for generator 15. -/
def ep_Q2_024_partial_15_0361 : Poly :=
[
  term ((112244728157627882810419007567542061860 : Rat) / 119970945740247729656669352802953926799) [(0, 1), (6, 1), (11, 1), (12, 1), (13, 1)],
  term ((-56122364078813941405209503783771030930 : Rat) / 119970945740247729656669352802953926799) [(0, 1), (11, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 361 for generator 15. -/
theorem ep_Q2_024_partial_15_0361_valid :
    mulPoly ep_Q2_024_coefficient_15_0361
        ep_Q2_024_generator_15_0300_0399 =
      ep_Q2_024_partial_15_0361 := by
  native_decide

/-- Coefficient term 362 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0362 : Poly :=
[
  term ((2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (11, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 362 for generator 15. -/
def ep_Q2_024_partial_15_0362 : Poly :=
[
  term ((4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (6, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (11, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 362 for generator 15. -/
theorem ep_Q2_024_partial_15_0362_valid :
    mulPoly ep_Q2_024_coefficient_15_0362
        ep_Q2_024_generator_15_0300_0399 =
      ep_Q2_024_partial_15_0362 := by
  native_decide

/-- Coefficient term 363 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0363 : Poly :=
[
  term ((168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (11, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 363 for generator 15. -/
def ep_Q2_024_partial_15_0363 : Poly :=
[
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (6, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (11, 1), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 363 for generator 15. -/
theorem ep_Q2_024_partial_15_0363_valid :
    mulPoly ep_Q2_024_coefficient_15_0363
        ep_Q2_024_generator_15_0300_0399 =
      ep_Q2_024_partial_15_0363 := by
  native_decide

/-- Coefficient term 364 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0364 : Poly :=
[
  term ((416983870520476 : Rat) / 1162780221153193) [(0, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 364 for generator 15. -/
def ep_Q2_024_partial_15_0364 : Poly :=
[
  term ((833967741040952 : Rat) / 1162780221153193) [(0, 1), (6, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-416983870520476 : Rat) / 1162780221153193) [(0, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 364 for generator 15. -/
theorem ep_Q2_024_partial_15_0364_valid :
    mulPoly ep_Q2_024_coefficient_15_0364
        ep_Q2_024_generator_15_0300_0399 =
      ep_Q2_024_partial_15_0364 := by
  native_decide

/-- Coefficient term 365 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0365 : Poly :=
[
  term ((-114695310985533139865253928542252323661837342530380210877 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(0, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 365 for generator 15. -/
def ep_Q2_024_partial_15_0365 : Poly :=
[
  term ((-114695310985533139865253928542252323661837342530380210877 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(0, 1), (6, 1), (11, 1), (12, 1), (15, 1)],
  term ((114695310985533139865253928542252323661837342530380210877 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(0, 1), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 365 for generator 15. -/
theorem ep_Q2_024_partial_15_0365_valid :
    mulPoly ep_Q2_024_coefficient_15_0365
        ep_Q2_024_generator_15_0300_0399 =
      ep_Q2_024_partial_15_0365 := by
  native_decide

/-- Coefficient term 366 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0366 : Poly :=
[
  term ((-4574440624287119 : Rat) / 1162780221153193) [(0, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 366 for generator 15. -/
def ep_Q2_024_partial_15_0366 : Poly :=
[
  term ((-9148881248574238 : Rat) / 1162780221153193) [(0, 1), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((4574440624287119 : Rat) / 1162780221153193) [(0, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 366 for generator 15. -/
theorem ep_Q2_024_partial_15_0366_valid :
    mulPoly ep_Q2_024_coefficient_15_0366
        ep_Q2_024_generator_15_0300_0399 =
      ep_Q2_024_partial_15_0366 := by
  native_decide

/-- Coefficient term 367 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0367 : Poly :=
[
  term ((-287556960603343927846004413879459057588 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (11, 1), (12, 2), (13, 1)]
]

/-- Partial product 367 for generator 15. -/
def ep_Q2_024_partial_15_0367 : Poly :=
[
  term ((-575113921206687855692008827758918115176 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (6, 1), (11, 1), (12, 2), (13, 1)],
  term ((287556960603343927846004413879459057588 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (11, 1), (12, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 367 for generator 15. -/
theorem ep_Q2_024_partial_15_0367_valid :
    mulPoly ep_Q2_024_coefficient_15_0367
        ep_Q2_024_generator_15_0300_0399 =
      ep_Q2_024_partial_15_0367 := by
  native_decide

/-- Coefficient term 368 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0368 : Poly :=
[
  term ((10276061187348409351974839366611065398110474709965459109 : Rat) / 929998952132019818504773430836265897467346423247461380) [(0, 1), (11, 1), (12, 2), (15, 1)]
]

/-- Partial product 368 for generator 15. -/
def ep_Q2_024_partial_15_0368 : Poly :=
[
  term ((10276061187348409351974839366611065398110474709965459109 : Rat) / 464999476066009909252386715418132948733673211623730690) [(0, 1), (6, 1), (11, 1), (12, 2), (15, 1)],
  term ((-10276061187348409351974839366611065398110474709965459109 : Rat) / 929998952132019818504773430836265897467346423247461380) [(0, 1), (11, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 368 for generator 15. -/
theorem ep_Q2_024_partial_15_0368_valid :
    mulPoly ep_Q2_024_coefficient_15_0368
        ep_Q2_024_generator_15_0300_0399 =
      ep_Q2_024_partial_15_0368 := by
  native_decide

/-- Coefficient term 369 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0369 : Poly :=
[
  term ((-1741462857409837 : Rat) / 1162780221153193) [(0, 1), (11, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 369 for generator 15. -/
def ep_Q2_024_partial_15_0369 : Poly :=
[
  term ((-3482925714819674 : Rat) / 1162780221153193) [(0, 1), (6, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((1741462857409837 : Rat) / 1162780221153193) [(0, 1), (11, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 369 for generator 15. -/
theorem ep_Q2_024_partial_15_0369_valid :
    mulPoly ep_Q2_024_coefficient_15_0369
        ep_Q2_024_generator_15_0300_0399 =
      ep_Q2_024_partial_15_0369 := by
  native_decide

/-- Coefficient term 370 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0370 : Poly :=
[
  term ((-1246500628449369573311884488585868966718 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (11, 1), (13, 1)]
]

/-- Partial product 370 for generator 15. -/
def ep_Q2_024_partial_15_0370 : Poly :=
[
  term ((-2493001256898739146623768977171737933436 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (6, 1), (11, 1), (13, 1)],
  term ((1246500628449369573311884488585868966718 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 370 for generator 15. -/
theorem ep_Q2_024_partial_15_0370_valid :
    mulPoly ep_Q2_024_coefficient_15_0370
        ep_Q2_024_generator_15_0300_0399 =
      ep_Q2_024_partial_15_0370 := by
  native_decide

/-- Coefficient term 371 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0371 : Poly :=
[
  term ((6726269385995931222631702436044558592986424804977428136 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (11, 1), (13, 1), (15, 2)]
]

/-- Partial product 371 for generator 15. -/
def ep_Q2_024_partial_15_0371 : Poly :=
[
  term ((13452538771991862445263404872089117185972849609954856272 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (6, 1), (11, 1), (13, 1), (15, 2)],
  term ((-6726269385995931222631702436044558592986424804977428136 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 371 for generator 15. -/
theorem ep_Q2_024_partial_15_0371_valid :
    mulPoly ep_Q2_024_coefficient_15_0371
        ep_Q2_024_generator_15_0300_0399 =
      ep_Q2_024_partial_15_0371 := by
  native_decide

/-- Coefficient term 372 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0372 : Poly :=
[
  term ((-1347382663288800 : Rat) / 1162780221153193) [(0, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 372 for generator 15. -/
def ep_Q2_024_partial_15_0372 : Poly :=
[
  term ((-2694765326577600 : Rat) / 1162780221153193) [(0, 1), (6, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((1347382663288800 : Rat) / 1162780221153193) [(0, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 372 for generator 15. -/
theorem ep_Q2_024_partial_15_0372_valid :
    mulPoly ep_Q2_024_coefficient_15_0372
        ep_Q2_024_generator_15_0300_0399 =
      ep_Q2_024_partial_15_0372 := by
  native_decide

/-- Coefficient term 373 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0373 : Poly :=
[
  term ((23303003274098118356770852827110756224 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (11, 1), (13, 2), (15, 1)]
]

/-- Partial product 373 for generator 15. -/
def ep_Q2_024_partial_15_0373 : Poly :=
[
  term ((46606006548196236713541705654221512448 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (6, 1), (11, 1), (13, 2), (15, 1)],
  term ((-23303003274098118356770852827110756224 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 373 for generator 15. -/
theorem ep_Q2_024_partial_15_0373_valid :
    mulPoly ep_Q2_024_coefficient_15_0373
        ep_Q2_024_generator_15_0300_0399 =
      ep_Q2_024_partial_15_0373 := by
  native_decide

/-- Coefficient term 374 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0374 : Poly :=
[
  term ((192310281104939503004456638320760459762053553695717730571 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(0, 1), (11, 1), (15, 1)]
]

/-- Partial product 374 for generator 15. -/
def ep_Q2_024_partial_15_0374 : Poly :=
[
  term ((192310281104939503004456638320760459762053553695717730571 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(0, 1), (6, 1), (11, 1), (15, 1)],
  term ((-192310281104939503004456638320760459762053553695717730571 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(0, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 374 for generator 15. -/
theorem ep_Q2_024_partial_15_0374_valid :
    mulPoly ep_Q2_024_coefficient_15_0374
        ep_Q2_024_generator_15_0300_0399 =
      ep_Q2_024_partial_15_0374 := by
  native_decide

/-- Coefficient term 375 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0375 : Poly :=
[
  term ((1731142516245691 : Rat) / 1162780221153193) [(0, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 375 for generator 15. -/
def ep_Q2_024_partial_15_0375 : Poly :=
[
  term ((3462285032491382 : Rat) / 1162780221153193) [(0, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1731142516245691 : Rat) / 1162780221153193) [(0, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 375 for generator 15. -/
theorem ep_Q2_024_partial_15_0375_valid :
    mulPoly ep_Q2_024_coefficient_15_0375
        ep_Q2_024_generator_15_0300_0399 =
      ep_Q2_024_partial_15_0375 := by
  native_decide

/-- Coefficient term 376 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0376 : Poly :=
[
  term ((2233057704898447277337521117967487825271887127131734968 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (11, 1), (15, 3)]
]

/-- Partial product 376 for generator 15. -/
def ep_Q2_024_partial_15_0376 : Poly :=
[
  term ((4466115409796894554675042235934975650543774254263469936 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (6, 1), (11, 1), (15, 3)],
  term ((-2233057704898447277337521117967487825271887127131734968 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 376 for generator 15. -/
theorem ep_Q2_024_partial_15_0376_valid :
    mulPoly ep_Q2_024_coefficient_15_0376
        ep_Q2_024_generator_15_0300_0399 =
      ep_Q2_024_partial_15_0376 := by
  native_decide

/-- Coefficient term 377 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0377 : Poly :=
[
  term ((-449127554429600 : Rat) / 1162780221153193) [(0, 1), (11, 1), (15, 3), (16, 1)]
]

/-- Partial product 377 for generator 15. -/
def ep_Q2_024_partial_15_0377 : Poly :=
[
  term ((-898255108859200 : Rat) / 1162780221153193) [(0, 1), (6, 1), (11, 1), (15, 3), (16, 1)],
  term ((449127554429600 : Rat) / 1162780221153193) [(0, 1), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 377 for generator 15. -/
theorem ep_Q2_024_partial_15_0377_valid :
    mulPoly ep_Q2_024_coefficient_15_0377
        ep_Q2_024_generator_15_0300_0399 =
      ep_Q2_024_partial_15_0377 := by
  native_decide

/-- Coefficient term 378 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0378 : Poly :=
[
  term ((1429182194689304419382031011936884624481 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (11, 2)]
]

/-- Partial product 378 for generator 15. -/
def ep_Q2_024_partial_15_0378 : Poly :=
[
  term ((2858364389378608838764062023873769248962 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (6, 1), (11, 2)],
  term ((-1429182194689304419382031011936884624481 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 378 for generator 15. -/
theorem ep_Q2_024_partial_15_0378_valid :
    mulPoly ep_Q2_024_coefficient_15_0378
        ep_Q2_024_generator_15_0300_0399 =
      ep_Q2_024_partial_15_0378 := by
  native_decide

/-- Coefficient term 379 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0379 : Poly :=
[
  term ((-747507090074398257610601351060497253034447613575961541 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(0, 1), (12, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 379 for generator 15. -/
def ep_Q2_024_partial_15_0379 : Poly :=
[
  term ((-747507090074398257610601351060497253034447613575961541 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(0, 1), (6, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((747507090074398257610601351060497253034447613575961541 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(0, 1), (12, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 379 for generator 15. -/
theorem ep_Q2_024_partial_15_0379_valid :
    mulPoly ep_Q2_024_coefficient_15_0379
        ep_Q2_024_generator_15_0300_0399 =
      ep_Q2_024_partial_15_0379 := by
  native_decide

/-- Coefficient term 380 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0380 : Poly :=
[
  term ((-4900222816010801 : Rat) / 2325560442306386) [(0, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 380 for generator 15. -/
def ep_Q2_024_partial_15_0380 : Poly :=
[
  term ((-4900222816010801 : Rat) / 1162780221153193) [(0, 1), (6, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((4900222816010801 : Rat) / 2325560442306386) [(0, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 380 for generator 15. -/
theorem ep_Q2_024_partial_15_0380_valid :
    mulPoly ep_Q2_024_coefficient_15_0380
        ep_Q2_024_generator_15_0300_0399 =
      ep_Q2_024_partial_15_0380 := by
  native_decide

/-- Coefficient term 381 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0381 : Poly :=
[
  term ((298230117964300205315009387784857810430822590434274396203 : Rat) / 33479962276752713466171843510105572308824471236908609680) [(0, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 381 for generator 15. -/
def ep_Q2_024_partial_15_0381 : Poly :=
[
  term ((298230117964300205315009387784857810430822590434274396203 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(0, 1), (6, 1), (12, 1), (13, 1), (15, 1)],
  term ((-298230117964300205315009387784857810430822590434274396203 : Rat) / 33479962276752713466171843510105572308824471236908609680) [(0, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 381 for generator 15. -/
theorem ep_Q2_024_partial_15_0381_valid :
    mulPoly ep_Q2_024_coefficient_15_0381
        ep_Q2_024_generator_15_0300_0399 =
      ep_Q2_024_partial_15_0381 := by
  native_decide

/-- Coefficient term 382 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0382 : Poly :=
[
  term ((-130200353038209601 : Rat) / 13953362653838316) [(0, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 382 for generator 15. -/
def ep_Q2_024_partial_15_0382 : Poly :=
[
  term ((-130200353038209601 : Rat) / 6976681326919158) [(0, 1), (6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((130200353038209601 : Rat) / 13953362653838316) [(0, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 382 for generator 15. -/
theorem ep_Q2_024_partial_15_0382_valid :
    mulPoly ep_Q2_024_coefficient_15_0382
        ep_Q2_024_generator_15_0300_0399 =
      ep_Q2_024_partial_15_0382 := by
  native_decide

/-- Coefficient term 383 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0383 : Poly :=
[
  term ((-4319218676773536780214066733539632475322 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (12, 1), (13, 2)]
]

/-- Partial product 383 for generator 15. -/
def ep_Q2_024_partial_15_0383 : Poly :=
[
  term ((-8638437353547073560428133467079264950644 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (6, 1), (12, 1), (13, 2)],
  term ((4319218676773536780214066733539632475322 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (12, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 383 for generator 15. -/
theorem ep_Q2_024_partial_15_0383_valid :
    mulPoly ep_Q2_024_coefficient_15_0383
        ep_Q2_024_generator_15_0300_0399 =
      ep_Q2_024_partial_15_0383 := by
  native_decide

/-- Coefficient term 384 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0384 : Poly :=
[
  term ((-15751070069793324361802205322144844122 : Rat) / 119970945740247729656669352802953926799) [(0, 1), (12, 1), (13, 2), (14, 1)]
]

/-- Partial product 384 for generator 15. -/
def ep_Q2_024_partial_15_0384 : Poly :=
[
  term ((-31502140139586648723604410644289688244 : Rat) / 119970945740247729656669352802953926799) [(0, 1), (6, 1), (12, 1), (13, 2), (14, 1)],
  term ((15751070069793324361802205322144844122 : Rat) / 119970945740247729656669352802953926799) [(0, 1), (12, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 384 for generator 15. -/
theorem ep_Q2_024_partial_15_0384_valid :
    mulPoly ep_Q2_024_coefficient_15_0384
        ep_Q2_024_generator_15_0300_0399 =
      ep_Q2_024_partial_15_0384 := by
  native_decide

/-- Coefficient term 385 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0385 : Poly :=
[
  term ((184684620853449952814620827932751714007739040900298451677 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(0, 1), (12, 1), (14, 1), (15, 2)]
]

/-- Partial product 385 for generator 15. -/
def ep_Q2_024_partial_15_0385 : Poly :=
[
  term ((184684620853449952814620827932751714007739040900298451677 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(0, 1), (6, 1), (12, 1), (14, 1), (15, 2)],
  term ((-184684620853449952814620827932751714007739040900298451677 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(0, 1), (12, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 385 for generator 15. -/
theorem ep_Q2_024_partial_15_0385_valid :
    mulPoly ep_Q2_024_coefficient_15_0385
        ep_Q2_024_generator_15_0300_0399 =
      ep_Q2_024_partial_15_0385 := by
  native_decide

/-- Coefficient term 386 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0386 : Poly :=
[
  term ((-11536479425158903 : Rat) / 1162780221153193) [(0, 1), (12, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 386 for generator 15. -/
def ep_Q2_024_partial_15_0386 : Poly :=
[
  term ((-23072958850317806 : Rat) / 1162780221153193) [(0, 1), (6, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((11536479425158903 : Rat) / 1162780221153193) [(0, 1), (12, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 386 for generator 15. -/
theorem ep_Q2_024_partial_15_0386_valid :
    mulPoly ep_Q2_024_coefficient_15_0386
        ep_Q2_024_generator_15_0300_0399 =
      ep_Q2_024_partial_15_0386 := by
  native_decide

/-- Coefficient term 387 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0387 : Poly :=
[
  term ((-173920503054278190397387858281993655395126209367377802395 : Rat) / 1115998742558423782205728117003519076960815707896953656) [(0, 1), (12, 1), (15, 2)]
]

/-- Partial product 387 for generator 15. -/
def ep_Q2_024_partial_15_0387 : Poly :=
[
  term ((-173920503054278190397387858281993655395126209367377802395 : Rat) / 557999371279211891102864058501759538480407853948476828) [(0, 1), (6, 1), (12, 1), (15, 2)],
  term ((173920503054278190397387858281993655395126209367377802395 : Rat) / 1115998742558423782205728117003519076960815707896953656) [(0, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 387 for generator 15. -/
theorem ep_Q2_024_partial_15_0387_valid :
    mulPoly ep_Q2_024_coefficient_15_0387
        ep_Q2_024_generator_15_0300_0399 =
      ep_Q2_024_partial_15_0387 := by
  native_decide

/-- Coefficient term 388 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0388 : Poly :=
[
  term ((-82084319791568657 : Rat) / 6976681326919158) [(0, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 388 for generator 15. -/
def ep_Q2_024_partial_15_0388 : Poly :=
[
  term ((-82084319791568657 : Rat) / 3488340663459579) [(0, 1), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((82084319791568657 : Rat) / 6976681326919158) [(0, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 388 for generator 15. -/
theorem ep_Q2_024_partial_15_0388_valid :
    mulPoly ep_Q2_024_coefficient_15_0388
        ep_Q2_024_generator_15_0300_0399 =
      ep_Q2_024_partial_15_0388 := by
  native_decide

/-- Coefficient term 389 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0389 : Poly :=
[
  term ((-76264403795837511527803111437393746773191331833527835971 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(0, 1), (12, 2), (13, 1), (15, 1)]
]

/-- Partial product 389 for generator 15. -/
def ep_Q2_024_partial_15_0389 : Poly :=
[
  term ((-76264403795837511527803111437393746773191331833527835971 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(0, 1), (6, 1), (12, 2), (13, 1), (15, 1)],
  term ((76264403795837511527803111437393746773191331833527835971 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(0, 1), (12, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 389 for generator 15. -/
theorem ep_Q2_024_partial_15_0389_valid :
    mulPoly ep_Q2_024_coefficient_15_0389
        ep_Q2_024_generator_15_0300_0399 =
      ep_Q2_024_partial_15_0389 := by
  native_decide

/-- Coefficient term 390 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0390 : Poly :=
[
  term ((5003541596661801 : Rat) / 2325560442306386) [(0, 1), (12, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 390 for generator 15. -/
def ep_Q2_024_partial_15_0390 : Poly :=
[
  term ((5003541596661801 : Rat) / 1162780221153193) [(0, 1), (6, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-5003541596661801 : Rat) / 2325560442306386) [(0, 1), (12, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 390 for generator 15. -/
theorem ep_Q2_024_partial_15_0390_valid :
    mulPoly ep_Q2_024_coefficient_15_0390
        ep_Q2_024_generator_15_0300_0399 =
      ep_Q2_024_partial_15_0390 := by
  native_decide

/-- Coefficient term 391 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0391 : Poly :=
[
  term ((124898830274193142709262456668953249078 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (12, 2), (13, 2)]
]

/-- Partial product 391 for generator 15. -/
def ep_Q2_024_partial_15_0391 : Poly :=
[
  term ((249797660548386285418524913337906498156 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (6, 1), (12, 2), (13, 2)],
  term ((-124898830274193142709262456668953249078 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (12, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 391 for generator 15. -/
theorem ep_Q2_024_partial_15_0391_valid :
    mulPoly ep_Q2_024_coefficient_15_0391
        ep_Q2_024_generator_15_0300_0399 =
      ep_Q2_024_partial_15_0391 := by
  native_decide

/-- Coefficient term 392 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0392 : Poly :=
[
  term ((-9754272295971164969531965260654707175733377277612288321 : Rat) / 464999476066009909252386715418132948733673211623730690) [(0, 1), (12, 2), (15, 2)]
]

/-- Partial product 392 for generator 15. -/
def ep_Q2_024_partial_15_0392 : Poly :=
[
  term ((-9754272295971164969531965260654707175733377277612288321 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (6, 1), (12, 2), (15, 2)],
  term ((9754272295971164969531965260654707175733377277612288321 : Rat) / 464999476066009909252386715418132948733673211623730690) [(0, 1), (12, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 392 for generator 15. -/
theorem ep_Q2_024_partial_15_0392_valid :
    mulPoly ep_Q2_024_coefficient_15_0392
        ep_Q2_024_generator_15_0300_0399 =
      ep_Q2_024_partial_15_0392 := by
  native_decide

/-- Coefficient term 393 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0393 : Poly :=
[
  term ((6899239101627794 : Rat) / 1162780221153193) [(0, 1), (12, 2), (15, 2), (16, 1)]
]

/-- Partial product 393 for generator 15. -/
def ep_Q2_024_partial_15_0393 : Poly :=
[
  term ((13798478203255588 : Rat) / 1162780221153193) [(0, 1), (6, 1), (12, 2), (15, 2), (16, 1)],
  term ((-6899239101627794 : Rat) / 1162780221153193) [(0, 1), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 393 for generator 15. -/
theorem ep_Q2_024_partial_15_0393_valid :
    mulPoly ep_Q2_024_coefficient_15_0393
        ep_Q2_024_generator_15_0300_0399 =
      ep_Q2_024_partial_15_0393 := by
  native_decide

/-- Coefficient term 394 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0394 : Poly :=
[
  term ((4488363601155088394610802813092423997537606420840418588561 : Rat) / 33479962276752713466171843510105572308824471236908609680) [(0, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 394 for generator 15. -/
def ep_Q2_024_partial_15_0394 : Poly :=
[
  term ((4488363601155088394610802813092423997537606420840418588561 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(0, 1), (6, 1), (13, 1), (14, 1), (15, 1)],
  term ((-4488363601155088394610802813092423997537606420840418588561 : Rat) / 33479962276752713466171843510105572308824471236908609680) [(0, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 394 for generator 15. -/
theorem ep_Q2_024_partial_15_0394_valid :
    mulPoly ep_Q2_024_coefficient_15_0394
        ep_Q2_024_generator_15_0300_0399 =
      ep_Q2_024_partial_15_0394 := by
  native_decide

/-- Coefficient term 395 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0395 : Poly :=
[
  term ((-28166150263158179 : Rat) / 13953362653838316) [(0, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 395 for generator 15. -/
def ep_Q2_024_partial_15_0395 : Poly :=
[
  term ((-28166150263158179 : Rat) / 6976681326919158) [(0, 1), (6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((28166150263158179 : Rat) / 13953362653838316) [(0, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 395 for generator 15. -/
theorem ep_Q2_024_partial_15_0395_valid :
    mulPoly ep_Q2_024_coefficient_15_0395
        ep_Q2_024_generator_15_0300_0399 =
      ep_Q2_024_partial_15_0395 := by
  native_decide

/-- Coefficient term 396 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0396 : Poly :=
[
  term ((-279378849901640340919482647169569421746336183507144841 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (13, 1), (14, 2), (15, 1)]
]

/-- Partial product 396 for generator 15. -/
def ep_Q2_024_partial_15_0396 : Poly :=
[
  term ((-558757699803280681838965294339138843492672367014289682 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (6, 1), (13, 1), (14, 2), (15, 1)],
  term ((279378849901640340919482647169569421746336183507144841 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 396 for generator 15. -/
theorem ep_Q2_024_partial_15_0396_valid :
    mulPoly ep_Q2_024_coefficient_15_0396
        ep_Q2_024_generator_15_0300_0399 =
      ep_Q2_024_partial_15_0396 := by
  native_decide

/-- Coefficient term 397 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0397 : Poly :=
[
  term ((-416983870520476 : Rat) / 1162780221153193) [(0, 1), (13, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 397 for generator 15. -/
def ep_Q2_024_partial_15_0397 : Poly :=
[
  term ((-833967741040952 : Rat) / 1162780221153193) [(0, 1), (6, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((416983870520476 : Rat) / 1162780221153193) [(0, 1), (13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 397 for generator 15. -/
theorem ep_Q2_024_partial_15_0397_valid :
    mulPoly ep_Q2_024_coefficient_15_0397
        ep_Q2_024_generator_15_0300_0399 =
      ep_Q2_024_partial_15_0397 := by
  native_decide

/-- Coefficient term 398 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0398 : Poly :=
[
  term ((-68849915941643162268946587258962204745981081790280696127 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(0, 1), (13, 1), (15, 1)]
]

/-- Partial product 398 for generator 15. -/
def ep_Q2_024_partial_15_0398 : Poly :=
[
  term ((-68849915941643162268946587258962204745981081790280696127 : Rat) / 929998952132019818504773430836265897467346423247461380) [(0, 1), (6, 1), (13, 1), (15, 1)],
  term ((68849915941643162268946587258962204745981081790280696127 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(0, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 398 for generator 15. -/
theorem ep_Q2_024_partial_15_0398_valid :
    mulPoly ep_Q2_024_coefficient_15_0398
        ep_Q2_024_generator_15_0300_0399 =
      ep_Q2_024_partial_15_0398 := by
  native_decide

/-- Coefficient term 399 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_0399 : Poly :=
[
  term ((4760736652382185 : Rat) / 2325560442306386) [(0, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 399 for generator 15. -/
def ep_Q2_024_partial_15_0399 : Poly :=
[
  term ((4760736652382185 : Rat) / 1162780221153193) [(0, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4760736652382185 : Rat) / 2325560442306386) [(0, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 399 for generator 15. -/
theorem ep_Q2_024_partial_15_0399_valid :
    mulPoly ep_Q2_024_coefficient_15_0399
        ep_Q2_024_generator_15_0300_0399 =
      ep_Q2_024_partial_15_0399 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_024_partials_15_0300_0399 : List Poly :=
[
  ep_Q2_024_partial_15_0300,
  ep_Q2_024_partial_15_0301,
  ep_Q2_024_partial_15_0302,
  ep_Q2_024_partial_15_0303,
  ep_Q2_024_partial_15_0304,
  ep_Q2_024_partial_15_0305,
  ep_Q2_024_partial_15_0306,
  ep_Q2_024_partial_15_0307,
  ep_Q2_024_partial_15_0308,
  ep_Q2_024_partial_15_0309,
  ep_Q2_024_partial_15_0310,
  ep_Q2_024_partial_15_0311,
  ep_Q2_024_partial_15_0312,
  ep_Q2_024_partial_15_0313,
  ep_Q2_024_partial_15_0314,
  ep_Q2_024_partial_15_0315,
  ep_Q2_024_partial_15_0316,
  ep_Q2_024_partial_15_0317,
  ep_Q2_024_partial_15_0318,
  ep_Q2_024_partial_15_0319,
  ep_Q2_024_partial_15_0320,
  ep_Q2_024_partial_15_0321,
  ep_Q2_024_partial_15_0322,
  ep_Q2_024_partial_15_0323,
  ep_Q2_024_partial_15_0324,
  ep_Q2_024_partial_15_0325,
  ep_Q2_024_partial_15_0326,
  ep_Q2_024_partial_15_0327,
  ep_Q2_024_partial_15_0328,
  ep_Q2_024_partial_15_0329,
  ep_Q2_024_partial_15_0330,
  ep_Q2_024_partial_15_0331,
  ep_Q2_024_partial_15_0332,
  ep_Q2_024_partial_15_0333,
  ep_Q2_024_partial_15_0334,
  ep_Q2_024_partial_15_0335,
  ep_Q2_024_partial_15_0336,
  ep_Q2_024_partial_15_0337,
  ep_Q2_024_partial_15_0338,
  ep_Q2_024_partial_15_0339,
  ep_Q2_024_partial_15_0340,
  ep_Q2_024_partial_15_0341,
  ep_Q2_024_partial_15_0342,
  ep_Q2_024_partial_15_0343,
  ep_Q2_024_partial_15_0344,
  ep_Q2_024_partial_15_0345,
  ep_Q2_024_partial_15_0346,
  ep_Q2_024_partial_15_0347,
  ep_Q2_024_partial_15_0348,
  ep_Q2_024_partial_15_0349,
  ep_Q2_024_partial_15_0350,
  ep_Q2_024_partial_15_0351,
  ep_Q2_024_partial_15_0352,
  ep_Q2_024_partial_15_0353,
  ep_Q2_024_partial_15_0354,
  ep_Q2_024_partial_15_0355,
  ep_Q2_024_partial_15_0356,
  ep_Q2_024_partial_15_0357,
  ep_Q2_024_partial_15_0358,
  ep_Q2_024_partial_15_0359,
  ep_Q2_024_partial_15_0360,
  ep_Q2_024_partial_15_0361,
  ep_Q2_024_partial_15_0362,
  ep_Q2_024_partial_15_0363,
  ep_Q2_024_partial_15_0364,
  ep_Q2_024_partial_15_0365,
  ep_Q2_024_partial_15_0366,
  ep_Q2_024_partial_15_0367,
  ep_Q2_024_partial_15_0368,
  ep_Q2_024_partial_15_0369,
  ep_Q2_024_partial_15_0370,
  ep_Q2_024_partial_15_0371,
  ep_Q2_024_partial_15_0372,
  ep_Q2_024_partial_15_0373,
  ep_Q2_024_partial_15_0374,
  ep_Q2_024_partial_15_0375,
  ep_Q2_024_partial_15_0376,
  ep_Q2_024_partial_15_0377,
  ep_Q2_024_partial_15_0378,
  ep_Q2_024_partial_15_0379,
  ep_Q2_024_partial_15_0380,
  ep_Q2_024_partial_15_0381,
  ep_Q2_024_partial_15_0382,
  ep_Q2_024_partial_15_0383,
  ep_Q2_024_partial_15_0384,
  ep_Q2_024_partial_15_0385,
  ep_Q2_024_partial_15_0386,
  ep_Q2_024_partial_15_0387,
  ep_Q2_024_partial_15_0388,
  ep_Q2_024_partial_15_0389,
  ep_Q2_024_partial_15_0390,
  ep_Q2_024_partial_15_0391,
  ep_Q2_024_partial_15_0392,
  ep_Q2_024_partial_15_0393,
  ep_Q2_024_partial_15_0394,
  ep_Q2_024_partial_15_0395,
  ep_Q2_024_partial_15_0396,
  ep_Q2_024_partial_15_0397,
  ep_Q2_024_partial_15_0398,
  ep_Q2_024_partial_15_0399
]

/-- Sum of partial products in this block. -/
def ep_Q2_024_block_15_0300_0399 : Poly :=
[
  term ((9252160052173184 : Rat) / 1162780221153193) [(0, 1), (6, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-774289990279226142050369870335833977224 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (6, 1), (7, 1), (12, 2), (13, 1)],
  term ((13945826049618177246769204300293405329164413913474025449 : Rat) / 464999476066009909252386715418132948733673211623730690) [(0, 1), (6, 1), (7, 1), (12, 2), (15, 1)],
  term ((-5220772436924962 : Rat) / 1162780221153193) [(0, 1), (6, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((-66660229485902769390477297336609277390 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (6, 1), (7, 1), (13, 1)],
  term ((-495621311543749653364154938242200208616 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (6, 1), (7, 1), (13, 1), (14, 1)],
  term ((-4466115409796894554675042235934975650543774254263469936 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (6, 1), (7, 1), (13, 1), (15, 2)],
  term ((898255108859200 : Rat) / 1162780221153193) [(0, 1), (6, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-46606006548196236713541705654221512448 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (6, 1), (7, 1), (13, 2), (15, 1)],
  term ((-43399307162444072615649573376780395590797368741150161437 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (6, 1), (7, 1), (14, 1), (15, 1)],
  term ((-13264098354930140 : Rat) / 1162780221153193) [(0, 1), (6, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((31669077243833268499904506466780176064199586885772263094 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (6, 1), (7, 1), (15, 1)],
  term ((-4628106147380416 : Rat) / 1162780221153193) [(0, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-1534008445791796036608246128407301870656 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (6, 1), (8, 1), (9, 1), (11, 1)],
  term ((-145434917451326069284748932995631790200 : Rat) / 119970945740247729656669352802953926799) [(0, 1), (6, 1), (8, 1), (9, 1), (13, 1)],
  term ((-1012784742961591443434703126878064481904 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (6, 1), (8, 1), (9, 1), (15, 1)],
  term ((-49794017268134571589590260644228965512 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (6, 1), (8, 1), (11, 1), (12, 1), (13, 1)],
  term ((183488243113488394739718246684116996552696960175428317 : Rat) / 92999895213201981850477343083626589746734642324746138) [(0, 1), (6, 1), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((-434461680526322 : Rat) / 1162780221153193) [(0, 1), (6, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((106700758173789835700115152363006676908 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (6, 1), (8, 1), (11, 1), (13, 1)],
  term ((48108759476133175575601932414548705499224482451183624741 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(0, 1), (6, 1), (8, 1), (11, 1), (15, 1)],
  term ((7486814354004798 : Rat) / 1162780221153193) [(0, 1), (6, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((799996756466353500033804856778064370752021774909074641 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (6, 1), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((-868923361052644 : Rat) / 1162780221153193) [(0, 1), (6, 1), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-99588034536269143179180521288457931024 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (6, 1), (8, 1), (12, 1), (13, 2)],
  term ((2874462586150154675890610943751033126062025910119106096 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (6, 1), (8, 1), (12, 1), (15, 2)],
  term ((-3439761031263168 : Rat) / 1162780221153193) [(0, 1), (6, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((65566409211952490903089322679846938896396436902847475191 : Rat) / 929998952132019818504773430836265897467346423247461380) [(0, 1), (6, 1), (8, 1), (13, 1), (15, 1)],
  term ((-12052735889401519 : Rat) / 1162780221153193) [(0, 1), (6, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((1738349846630557427844280552698855000056 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (6, 1), (8, 1), (13, 2)],
  term ((401768618619887927735386102003931834017905121420943644301 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(0, 1), (6, 1), (8, 1), (15, 2)],
  term ((-42700868251754590 : Rat) / 1162780221153193) [(0, 1), (6, 1), (8, 1), (15, 2), (16, 1)],
  term ((-4894639470681214628570299894271330424812 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (6, 1), (9, 1), (11, 1)],
  term ((1067631723467823848853269806495054145596 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (6, 1), (9, 1), (11, 1), (12, 1)],
  term ((13615588636036516363437462596984327119732 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (6, 1), (9, 1), (12, 1), (13, 1)],
  term ((-41665368374605042740338989355467420828 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (6, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((142434490376858106430432061549109610044154416462805159 : Rat) / 47288082311797617890073225296759282922068462199023460) [(0, 1), (6, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((3162376093905513 : Rat) / 1162780221153193) [(0, 1), (6, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-38480239436271484493086503340147890731077967162510275301 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(0, 1), (6, 1), (9, 1), (12, 1), (15, 1)],
  term ((205123538457776647 : Rat) / 6976681326919158) [(0, 1), (6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-649804947108889713076394218725261563444 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (6, 1), (9, 1), (12, 2), (13, 1)],
  term ((394990610532188891949922922601421792279854302077327847 : Rat) / 15762694103932539296691075098919760974022820733007820) [(0, 1), (6, 1), (9, 1), (12, 2), (15, 1)],
  term ((-4134618235609157 : Rat) / 1162780221153193) [(0, 1), (6, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((3063866042163418144239435915478237178756 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (6, 1), (9, 1), (13, 1)],
  term ((-33427967270123600591421888364927387053976 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (6, 1), (9, 1), (13, 1), (14, 1)],
  term ((4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (6, 1), (9, 1), (13, 1), (14, 2)],
  term ((-1668808501631721437300235225451825767766173028120659764 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (6, 1), (9, 1), (13, 1), (15, 2)],
  term ((2990296899089872 : Rat) / 1162780221153193) [(0, 1), (6, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((313099205974796891704814566834029023616 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (6, 1), (9, 1), (13, 2), (15, 1)],
  term ((-2002418325474702165940954778303900632785470807616778676351 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(0, 1), (6, 1), (9, 1), (14, 1), (15, 1)],
  term ((316334434163404391 : Rat) / 6976681326919158) [(0, 1), (6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (6, 1), (9, 1), (14, 2), (15, 1)],
  term ((833967741040952 : Rat) / 1162780221153193) [(0, 1), (6, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((1550507484768727951433704660965347082752825908852624715 : Rat) / 46499947606600990925238671541813294873367321162373069) [(0, 1), (6, 1), (9, 1), (15, 1)],
  term ((-8586007643902278 : Rat) / 1162780221153193) [(0, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-8932230819593789109350084471869951301087548508526939872 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (6, 1), (9, 1), (15, 3)],
  term ((1796510217718400 : Rat) / 1162780221153193) [(0, 1), (6, 1), (9, 1), (15, 3), (16, 1)],
  term ((-2054327552381852124160315894392517112428 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (6, 1), (9, 2)],
  term ((-174695444640151562944492578025210298216 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (6, 1), (9, 2), (12, 1)],
  term ((252450128745879785325220575726801684224 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (6, 1), (9, 2), (13, 1), (15, 1)],
  term ((3476613576908464222668452905324007074344 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (6, 1), (9, 2), (14, 1)],
  term ((112244728157627882810419007567542061860 : Rat) / 119970945740247729656669352802953926799) [(0, 1), (6, 1), (11, 1), (12, 1), (13, 1)],
  term ((4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (6, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (6, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((833967741040952 : Rat) / 1162780221153193) [(0, 1), (6, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-114695310985533139865253928542252323661837342530380210877 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(0, 1), (6, 1), (11, 1), (12, 1), (15, 1)],
  term ((-9148881248574238 : Rat) / 1162780221153193) [(0, 1), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-575113921206687855692008827758918115176 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (6, 1), (11, 1), (12, 2), (13, 1)],
  term ((10276061187348409351974839366611065398110474709965459109 : Rat) / 464999476066009909252386715418132948733673211623730690) [(0, 1), (6, 1), (11, 1), (12, 2), (15, 1)],
  term ((-3482925714819674 : Rat) / 1162780221153193) [(0, 1), (6, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-2493001256898739146623768977171737933436 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (6, 1), (11, 1), (13, 1)],
  term ((13452538771991862445263404872089117185972849609954856272 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (6, 1), (11, 1), (13, 1), (15, 2)],
  term ((-2694765326577600 : Rat) / 1162780221153193) [(0, 1), (6, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((46606006548196236713541705654221512448 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (6, 1), (11, 1), (13, 2), (15, 1)],
  term ((192310281104939503004456638320760459762053553695717730571 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(0, 1), (6, 1), (11, 1), (15, 1)],
  term ((3462285032491382 : Rat) / 1162780221153193) [(0, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((4466115409796894554675042235934975650543774254263469936 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (6, 1), (11, 1), (15, 3)],
  term ((-898255108859200 : Rat) / 1162780221153193) [(0, 1), (6, 1), (11, 1), (15, 3), (16, 1)],
  term ((2858364389378608838764062023873769248962 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (6, 1), (11, 2)],
  term ((-747507090074398257610601351060497253034447613575961541 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(0, 1), (6, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-4900222816010801 : Rat) / 1162780221153193) [(0, 1), (6, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((298230117964300205315009387784857810430822590434274396203 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(0, 1), (6, 1), (12, 1), (13, 1), (15, 1)],
  term ((-130200353038209601 : Rat) / 6976681326919158) [(0, 1), (6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-8638437353547073560428133467079264950644 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (6, 1), (12, 1), (13, 2)],
  term ((-31502140139586648723604410644289688244 : Rat) / 119970945740247729656669352802953926799) [(0, 1), (6, 1), (12, 1), (13, 2), (14, 1)],
  term ((184684620853449952814620827932751714007739040900298451677 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(0, 1), (6, 1), (12, 1), (14, 1), (15, 2)],
  term ((-23072958850317806 : Rat) / 1162780221153193) [(0, 1), (6, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-173920503054278190397387858281993655395126209367377802395 : Rat) / 557999371279211891102864058501759538480407853948476828) [(0, 1), (6, 1), (12, 1), (15, 2)],
  term ((-82084319791568657 : Rat) / 3488340663459579) [(0, 1), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((-76264403795837511527803111437393746773191331833527835971 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(0, 1), (6, 1), (12, 2), (13, 1), (15, 1)],
  term ((5003541596661801 : Rat) / 1162780221153193) [(0, 1), (6, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((249797660548386285418524913337906498156 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (6, 1), (12, 2), (13, 2)],
  term ((-9754272295971164969531965260654707175733377277612288321 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (6, 1), (12, 2), (15, 2)],
  term ((13798478203255588 : Rat) / 1162780221153193) [(0, 1), (6, 1), (12, 2), (15, 2), (16, 1)],
  term ((4488363601155088394610802813092423997537606420840418588561 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(0, 1), (6, 1), (13, 1), (14, 1), (15, 1)],
  term ((-28166150263158179 : Rat) / 6976681326919158) [(0, 1), (6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-558757699803280681838965294339138843492672367014289682 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (6, 1), (13, 1), (14, 2), (15, 1)],
  term ((-833967741040952 : Rat) / 1162780221153193) [(0, 1), (6, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-68849915941643162268946587258962204745981081790280696127 : Rat) / 929998952132019818504773430836265897467346423247461380) [(0, 1), (6, 1), (13, 1), (15, 1)],
  term ((4760736652382185 : Rat) / 1162780221153193) [(0, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4626080026086592 : Rat) / 1162780221153193) [(0, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((387144995139613071025184935167916988612 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (12, 2), (13, 1)],
  term ((-13945826049618177246769204300293405329164413913474025449 : Rat) / 929998952132019818504773430836265897467346423247461380) [(0, 1), (7, 1), (12, 2), (15, 1)],
  term ((2610386218462481 : Rat) / 1162780221153193) [(0, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((33330114742951384695238648668304638695 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (7, 1), (13, 1)],
  term ((247810655771874826682077469121100104308 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (13, 1), (14, 1)],
  term ((2233057704898447277337521117967487825271887127131734968 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (7, 1), (13, 1), (15, 2)],
  term ((-449127554429600 : Rat) / 1162780221153193) [(0, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((23303003274098118356770852827110756224 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (13, 2), (15, 1)],
  term ((43399307162444072615649573376780395590797368741150161437 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(0, 1), (7, 1), (14, 1), (15, 1)],
  term ((6632049177465070 : Rat) / 1162780221153193) [(0, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-15834538621916634249952253233390088032099793442886131547 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (7, 1), (15, 1)],
  term ((2314053073690208 : Rat) / 1162780221153193) [(0, 1), (7, 1), (15, 1), (16, 1)],
  term ((767004222895898018304123064203650935328 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (8, 1), (9, 1), (11, 1)],
  term ((72717458725663034642374466497815895100 : Rat) / 119970945740247729656669352802953926799) [(0, 1), (8, 1), (9, 1), (13, 1)],
  term ((506392371480795721717351563439032240952 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (8, 1), (9, 1), (15, 1)],
  term ((24897008634067285794795130322114482756 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (8, 1), (11, 1), (12, 1), (13, 1)],
  term ((-183488243113488394739718246684116996552696960175428317 : Rat) / 185999790426403963700954686167253179493469284649492276) [(0, 1), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((217230840263161 : Rat) / 1162780221153193) [(0, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-53350379086894917850057576181503338454 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (8, 1), (11, 1), (13, 1)],
  term ((-48108759476133175575601932414548705499224482451183624741 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(0, 1), (8, 1), (11, 1), (15, 1)],
  term ((-3743407177002399 : Rat) / 1162780221153193) [(0, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-799996756466353500033804856778064370752021774909074641 : Rat) / 464999476066009909252386715418132948733673211623730690) [(0, 1), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((434461680526322 : Rat) / 1162780221153193) [(0, 1), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((49794017268134571589590260644228965512 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (8, 1), (12, 1), (13, 2)],
  term ((-1437231293075077337945305471875516563031012955059553048 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (8, 1), (12, 1), (15, 2)],
  term ((1719880515631584 : Rat) / 1162780221153193) [(0, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-65566409211952490903089322679846938896396436902847475191 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(0, 1), (8, 1), (13, 1), (15, 1)],
  term ((12052735889401519 : Rat) / 2325560442306386) [(0, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-869174923315278713922140276349427500028 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (8, 1), (13, 2)],
  term ((-401768618619887927735386102003931834017905121420943644301 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(0, 1), (8, 1), (15, 2)],
  term ((21350434125877295 : Rat) / 1162780221153193) [(0, 1), (8, 1), (15, 2), (16, 1)],
  term ((2447319735340607314285149947135665212406 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (9, 1), (11, 1)],
  term ((-533815861733911924426634903247527072798 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (9, 1), (11, 1), (12, 1)],
  term ((-6807794318018258181718731298492163559866 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (9, 1), (12, 1), (13, 1)],
  term ((20832684187302521370169494677733710414 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((-142434490376858106430432061549109610044154416462805159 : Rat) / 94576164623595235780146450593518565844136924398046920) [(0, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-3162376093905513 : Rat) / 2325560442306386) [(0, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((38480239436271484493086503340147890731077967162510275301 : Rat) / 3719995808528079274019093723345063589869385692989845520) [(0, 1), (9, 1), (12, 1), (15, 1)],
  term ((-205123538457776647 : Rat) / 13953362653838316) [(0, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((324902473554444856538197109362630781722 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 1), (12, 2), (13, 1)],
  term ((-394990610532188891949922922601421792279854302077327847 : Rat) / 31525388207865078593382150197839521948045641466015640) [(0, 1), (9, 1), (12, 2), (15, 1)],
  term ((4134618235609157 : Rat) / 2325560442306386) [(0, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1531933021081709072119717957739118589378 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 1), (13, 1)],
  term ((16713983635061800295710944182463693526988 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (9, 1), (13, 1), (14, 1)],
  term ((-2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 1), (13, 1), (14, 2)],
  term ((834404250815860718650117612725912883883086514060329882 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (9, 1), (13, 1), (15, 2)],
  term ((-1495148449544936 : Rat) / 1162780221153193) [(0, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-156549602987398445852407283417014511808 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (9, 1), (13, 2), (15, 1)],
  term ((2002418325474702165940954778303900632785470807616778676351 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(0, 1), (9, 1), (14, 1), (15, 1)],
  term ((-316334434163404391 : Rat) / 13953362653838316) [(0, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (9, 1), (14, 2), (15, 1)],
  term ((-416983870520476 : Rat) / 1162780221153193) [(0, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1550507484768727951433704660965347082752825908852624715 : Rat) / 92999895213201981850477343083626589746734642324746138) [(0, 1), (9, 1), (15, 1)],
  term ((4293003821951139 : Rat) / 1162780221153193) [(0, 1), (9, 1), (15, 1), (16, 1)],
  term ((4466115409796894554675042235934975650543774254263469936 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (9, 1), (15, 3)],
  term ((-898255108859200 : Rat) / 1162780221153193) [(0, 1), (9, 1), (15, 3), (16, 1)],
  term ((1027163776190926062080157947196258556214 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 2)],
  term ((87347722320075781472246289012605149108 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (9, 2), (12, 1)],
  term ((-126225064372939892662610287863400842112 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (9, 2), (13, 1), (15, 1)],
  term ((-1738306788454232111334226452662003537172 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (9, 2), (14, 1)],
  term ((-56122364078813941405209503783771030930 : Rat) / 119970945740247729656669352802953926799) [(0, 1), (11, 1), (12, 1), (13, 1)],
  term ((-2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-416983870520476 : Rat) / 1162780221153193) [(0, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((114695310985533139865253928542252323661837342530380210877 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(0, 1), (11, 1), (12, 1), (15, 1)],
  term ((4574440624287119 : Rat) / 1162780221153193) [(0, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((287556960603343927846004413879459057588 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (11, 1), (12, 2), (13, 1)],
  term ((-10276061187348409351974839366611065398110474709965459109 : Rat) / 929998952132019818504773430836265897467346423247461380) [(0, 1), (11, 1), (12, 2), (15, 1)],
  term ((1741462857409837 : Rat) / 1162780221153193) [(0, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((1246500628449369573311884488585868966718 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (11, 1), (13, 1)],
  term ((-6726269385995931222631702436044558592986424804977428136 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (11, 1), (13, 1), (15, 2)],
  term ((1347382663288800 : Rat) / 1162780221153193) [(0, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-23303003274098118356770852827110756224 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (11, 1), (13, 2), (15, 1)],
  term ((-192310281104939503004456638320760459762053553695717730571 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(0, 1), (11, 1), (15, 1)],
  term ((-1731142516245691 : Rat) / 1162780221153193) [(0, 1), (11, 1), (15, 1), (16, 1)],
  term ((-2233057704898447277337521117967487825271887127131734968 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (11, 1), (15, 3)],
  term ((449127554429600 : Rat) / 1162780221153193) [(0, 1), (11, 1), (15, 3), (16, 1)],
  term ((-1429182194689304419382031011936884624481 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (11, 2)],
  term ((747507090074398257610601351060497253034447613575961541 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(0, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((4900222816010801 : Rat) / 2325560442306386) [(0, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-298230117964300205315009387784857810430822590434274396203 : Rat) / 33479962276752713466171843510105572308824471236908609680) [(0, 1), (12, 1), (13, 1), (15, 1)],
  term ((130200353038209601 : Rat) / 13953362653838316) [(0, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((4319218676773536780214066733539632475322 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (12, 1), (13, 2)],
  term ((15751070069793324361802205322144844122 : Rat) / 119970945740247729656669352802953926799) [(0, 1), (12, 1), (13, 2), (14, 1)],
  term ((-184684620853449952814620827932751714007739040900298451677 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(0, 1), (12, 1), (14, 1), (15, 2)],
  term ((11536479425158903 : Rat) / 1162780221153193) [(0, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((173920503054278190397387858281993655395126209367377802395 : Rat) / 1115998742558423782205728117003519076960815707896953656) [(0, 1), (12, 1), (15, 2)],
  term ((82084319791568657 : Rat) / 6976681326919158) [(0, 1), (12, 1), (15, 2), (16, 1)],
  term ((76264403795837511527803111437393746773191331833527835971 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(0, 1), (12, 2), (13, 1), (15, 1)],
  term ((-5003541596661801 : Rat) / 2325560442306386) [(0, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-124898830274193142709262456668953249078 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (12, 2), (13, 2)],
  term ((9754272295971164969531965260654707175733377277612288321 : Rat) / 464999476066009909252386715418132948733673211623730690) [(0, 1), (12, 2), (15, 2)],
  term ((-6899239101627794 : Rat) / 1162780221153193) [(0, 1), (12, 2), (15, 2), (16, 1)],
  term ((-4488363601155088394610802813092423997537606420840418588561 : Rat) / 33479962276752713466171843510105572308824471236908609680) [(0, 1), (13, 1), (14, 1), (15, 1)],
  term ((28166150263158179 : Rat) / 13953362653838316) [(0, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((279378849901640340919482647169569421746336183507144841 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (13, 1), (14, 2), (15, 1)],
  term ((416983870520476 : Rat) / 1162780221153193) [(0, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((68849915941643162268946587258962204745981081790280696127 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(0, 1), (13, 1), (15, 1)],
  term ((-4760736652382185 : Rat) / 2325560442306386) [(0, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 15, terms 300 through 399. -/
theorem ep_Q2_024_block_15_0300_0399_valid :
    checkProductSumEq ep_Q2_024_partials_15_0300_0399
      ep_Q2_024_block_15_0300_0399 = true := by
  native_decide

end EpQ2024TermShards

end Patterns

end EndpointCertificate

end Problem97
