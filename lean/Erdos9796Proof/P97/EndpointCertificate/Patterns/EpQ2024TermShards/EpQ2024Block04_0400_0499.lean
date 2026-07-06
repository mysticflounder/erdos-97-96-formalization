/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_024, term block 4:400-499

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_024`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2024TermShards

/-- Generator polynomial 4 for endpoint certificate `ep_Q2_024`. -/
def ep_Q2_024_generator_04_0400_0499 : Poly :=
[
  term (1 : Rat) [(2, 2)],
  term (1 : Rat) [(3, 2)],
  term (-1 : Rat) [(10, 2)],
  term (-1 : Rat) [(11, 2)]
]

/-- Coefficient term 400 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0400 : Poly :=
[
  term ((-699598964377024284665984479369490528956 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (12, 1), (13, 2), (15, 1)]
]

/-- Partial product 400 for generator 4. -/
def ep_Q2_024_partial_04_0400 : Poly :=
[
  term ((-699598964377024284665984479369490528956 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (5, 1), (12, 1), (13, 2), (15, 1)],
  term ((-699598964377024284665984479369490528956 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (5, 1), (12, 1), (13, 2), (15, 1)],
  term ((699598964377024284665984479369490528956 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (10, 2), (12, 1), (13, 2), (15, 1)],
  term ((699598964377024284665984479369490528956 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (11, 2), (12, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 400 for generator 4. -/
theorem ep_Q2_024_partial_04_0400_valid :
    mulPoly ep_Q2_024_coefficient_04_0400
        ep_Q2_024_generator_04_0400_0499 =
      ep_Q2_024_partial_04_0400 := by
  native_decide

/-- Coefficient term 401 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0401 : Poly :=
[
  term ((-5998517674585019096440487702853772295167493695424703559 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (12, 1), (15, 1)]
]

/-- Partial product 401 for generator 4. -/
def ep_Q2_024_partial_04_0401 : Poly :=
[
  term ((-5998517674585019096440487702853772295167493695424703559 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 2), (5, 1), (12, 1), (15, 1)],
  term ((-5998517674585019096440487702853772295167493695424703559 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 2), (5, 1), (12, 1), (15, 1)],
  term ((5998517674585019096440487702853772295167493695424703559 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (10, 2), (12, 1), (15, 1)],
  term ((5998517674585019096440487702853772295167493695424703559 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 401 for generator 4. -/
theorem ep_Q2_024_partial_04_0401_valid :
    mulPoly ep_Q2_024_coefficient_04_0401
        ep_Q2_024_generator_04_0400_0499 =
      ep_Q2_024_partial_04_0401 := by
  native_decide

/-- Coefficient term 402 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0402 : Poly :=
[
  term ((769195100829796 : Rat) / 1162780221153193) [(5, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 402 for generator 4. -/
def ep_Q2_024_partial_04_0402 : Poly :=
[
  term ((769195100829796 : Rat) / 1162780221153193) [(2, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((769195100829796 : Rat) / 1162780221153193) [(3, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-769195100829796 : Rat) / 1162780221153193) [(5, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((-769195100829796 : Rat) / 1162780221153193) [(5, 1), (11, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 402 for generator 4. -/
theorem ep_Q2_024_partial_04_0402_valid :
    mulPoly ep_Q2_024_coefficient_04_0402
        ep_Q2_024_generator_04_0400_0499 =
      ep_Q2_024_partial_04_0402 := by
  native_decide

/-- Coefficient term 403 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0403 : Poly :=
[
  term ((-57065163418514028206963760297560614190626285699065528079 : Rat) / 929998952132019818504773430836265897467346423247461380) [(5, 1), (12, 1), (15, 3)]
]

/-- Partial product 403 for generator 4. -/
def ep_Q2_024_partial_04_0403 : Poly :=
[
  term ((-57065163418514028206963760297560614190626285699065528079 : Rat) / 929998952132019818504773430836265897467346423247461380) [(2, 2), (5, 1), (12, 1), (15, 3)],
  term ((-57065163418514028206963760297560614190626285699065528079 : Rat) / 929998952132019818504773430836265897467346423247461380) [(3, 2), (5, 1), (12, 1), (15, 3)],
  term ((57065163418514028206963760297560614190626285699065528079 : Rat) / 929998952132019818504773430836265897467346423247461380) [(5, 1), (10, 2), (12, 1), (15, 3)],
  term ((57065163418514028206963760297560614190626285699065528079 : Rat) / 929998952132019818504773430836265897467346423247461380) [(5, 1), (11, 2), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 403 for generator 4. -/
theorem ep_Q2_024_partial_04_0403_valid :
    mulPoly ep_Q2_024_coefficient_04_0403
        ep_Q2_024_generator_04_0400_0499 =
      ep_Q2_024_partial_04_0403 := by
  native_decide

/-- Coefficient term 404 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0404 : Poly :=
[
  term ((13204414907240807 : Rat) / 1162780221153193) [(5, 1), (12, 1), (15, 3), (16, 1)]
]

/-- Partial product 404 for generator 4. -/
def ep_Q2_024_partial_04_0404 : Poly :=
[
  term ((13204414907240807 : Rat) / 1162780221153193) [(2, 2), (5, 1), (12, 1), (15, 3), (16, 1)],
  term ((13204414907240807 : Rat) / 1162780221153193) [(3, 2), (5, 1), (12, 1), (15, 3), (16, 1)],
  term ((-13204414907240807 : Rat) / 1162780221153193) [(5, 1), (10, 2), (12, 1), (15, 3), (16, 1)],
  term ((-13204414907240807 : Rat) / 1162780221153193) [(5, 1), (11, 2), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 404 for generator 4. -/
theorem ep_Q2_024_partial_04_0404_valid :
    mulPoly ep_Q2_024_coefficient_04_0404
        ep_Q2_024_generator_04_0400_0499 =
      ep_Q2_024_partial_04_0404 := by
  native_decide

/-- Coefficient term 405 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0405 : Poly :=
[
  term ((-17856730383433244702599366065510184172 : Rat) / 119970945740247729656669352802953926799) [(5, 1), (13, 1)]
]

/-- Partial product 405 for generator 4. -/
def ep_Q2_024_partial_04_0405 : Poly :=
[
  term ((-17856730383433244702599366065510184172 : Rat) / 119970945740247729656669352802953926799) [(2, 2), (5, 1), (13, 1)],
  term ((-17856730383433244702599366065510184172 : Rat) / 119970945740247729656669352802953926799) [(3, 2), (5, 1), (13, 1)],
  term ((17856730383433244702599366065510184172 : Rat) / 119970945740247729656669352802953926799) [(5, 1), (10, 2), (13, 1)],
  term ((17856730383433244702599366065510184172 : Rat) / 119970945740247729656669352802953926799) [(5, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 405 for generator 4. -/
theorem ep_Q2_024_partial_04_0405_valid :
    mulPoly ep_Q2_024_coefficient_04_0405
        ep_Q2_024_generator_04_0400_0499 =
      ep_Q2_024_partial_04_0405 := by
  native_decide

/-- Coefficient term 406 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0406 : Poly :=
[
  term ((21617868347627211728051505817229271432 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (13, 1), (14, 1)]
]

/-- Partial product 406 for generator 4. -/
def ep_Q2_024_partial_04_0406 : Poly :=
[
  term ((21617868347627211728051505817229271432 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (5, 1), (13, 1), (14, 1)],
  term ((21617868347627211728051505817229271432 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (5, 1), (13, 1), (14, 1)],
  term ((-21617868347627211728051505817229271432 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (10, 2), (13, 1), (14, 1)],
  term ((-21617868347627211728051505817229271432 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (11, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 406 for generator 4. -/
theorem ep_Q2_024_partial_04_0406_valid :
    mulPoly ep_Q2_024_coefficient_04_0406
        ep_Q2_024_generator_04_0400_0499 =
      ep_Q2_024_partial_04_0406 := by
  native_decide

/-- Coefficient term 407 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0407 : Poly :=
[
  term ((1681207212074162784866544631513075229980270038215301238 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (13, 1), (14, 1), (15, 2)]
]

/-- Partial product 407 for generator 4. -/
def ep_Q2_024_partial_04_0407 : Poly :=
[
  term ((1681207212074162784866544631513075229980270038215301238 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 2), (5, 1), (13, 1), (14, 1), (15, 2)],
  term ((1681207212074162784866544631513075229980270038215301238 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 2), (5, 1), (13, 1), (14, 1), (15, 2)],
  term ((-1681207212074162784866544631513075229980270038215301238 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (10, 2), (13, 1), (14, 1), (15, 2)],
  term ((-1681207212074162784866544631513075229980270038215301238 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (11, 2), (13, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 407 for generator 4. -/
theorem ep_Q2_024_partial_04_0407_valid :
    mulPoly ep_Q2_024_coefficient_04_0407
        ep_Q2_024_generator_04_0400_0499 =
      ep_Q2_024_partial_04_0407 := by
  native_decide

/-- Coefficient term 408 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0408 : Poly :=
[
  term ((833967741040952 : Rat) / 1162780221153193) [(5, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 408 for generator 4. -/
def ep_Q2_024_partial_04_0408 : Poly :=
[
  term ((833967741040952 : Rat) / 1162780221153193) [(2, 2), (5, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((833967741040952 : Rat) / 1162780221153193) [(3, 2), (5, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-833967741040952 : Rat) / 1162780221153193) [(5, 1), (10, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-833967741040952 : Rat) / 1162780221153193) [(5, 1), (11, 2), (13, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 408 for generator 4. -/
theorem ep_Q2_024_partial_04_0408_valid :
    mulPoly ep_Q2_024_coefficient_04_0408
        ep_Q2_024_generator_04_0400_0499 =
      ep_Q2_024_partial_04_0408 := by
  native_decide

/-- Coefficient term 409 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0409 : Poly :=
[
  term ((-2578326853107933456558538464757287301318301626202703904507 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(5, 1), (13, 1), (15, 2)]
]

/-- Partial product 409 for generator 4. -/
def ep_Q2_024_partial_04_0409 : Poly :=
[
  term ((-2578326853107933456558538464757287301318301626202703904507 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(2, 2), (5, 1), (13, 1), (15, 2)],
  term ((-2578326853107933456558538464757287301318301626202703904507 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(3, 2), (5, 1), (13, 1), (15, 2)],
  term ((2578326853107933456558538464757287301318301626202703904507 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(5, 1), (10, 2), (13, 1), (15, 2)],
  term ((2578326853107933456558538464757287301318301626202703904507 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(5, 1), (11, 2), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 409 for generator 4. -/
theorem ep_Q2_024_partial_04_0409_valid :
    mulPoly ep_Q2_024_coefficient_04_0409
        ep_Q2_024_generator_04_0400_0499 =
      ep_Q2_024_partial_04_0409 := by
  native_decide

/-- Coefficient term 410 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0410 : Poly :=
[
  term ((-50068166157171823 : Rat) / 6976681326919158) [(5, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 410 for generator 4. -/
def ep_Q2_024_partial_04_0410 : Poly :=
[
  term ((-50068166157171823 : Rat) / 6976681326919158) [(2, 2), (5, 1), (13, 1), (15, 2), (16, 1)],
  term ((-50068166157171823 : Rat) / 6976681326919158) [(3, 2), (5, 1), (13, 1), (15, 2), (16, 1)],
  term ((50068166157171823 : Rat) / 6976681326919158) [(5, 1), (10, 2), (13, 1), (15, 2), (16, 1)],
  term ((50068166157171823 : Rat) / 6976681326919158) [(5, 1), (11, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 410 for generator 4. -/
theorem ep_Q2_024_partial_04_0410_valid :
    mulPoly ep_Q2_024_coefficient_04_0410
        ep_Q2_024_generator_04_0400_0499 =
      ep_Q2_024_partial_04_0410 := by
  native_decide

/-- Coefficient term 411 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0411 : Poly :=
[
  term ((4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (13, 2), (14, 1), (15, 1)]
]

/-- Partial product 411 for generator 4. -/
def ep_Q2_024_partial_04_0411 : Poly :=
[
  term ((4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (5, 1), (13, 2), (14, 1), (15, 1)],
  term ((4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (5, 1), (13, 2), (14, 1), (15, 1)],
  term ((-4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (10, 2), (13, 2), (14, 1), (15, 1)],
  term ((-4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (11, 2), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 411 for generator 4. -/
theorem ep_Q2_024_partial_04_0411_valid :
    mulPoly ep_Q2_024_coefficient_04_0411
        ep_Q2_024_generator_04_0400_0499 =
      ep_Q2_024_partial_04_0411 := by
  native_decide

/-- Coefficient term 412 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0412 : Poly :=
[
  term ((147847046676439604201330883678806456320 : Rat) / 359912837220743188970008058408861780397) [(5, 1), (13, 2), (15, 1)]
]

/-- Partial product 412 for generator 4. -/
def ep_Q2_024_partial_04_0412 : Poly :=
[
  term ((147847046676439604201330883678806456320 : Rat) / 359912837220743188970008058408861780397) [(2, 2), (5, 1), (13, 2), (15, 1)],
  term ((147847046676439604201330883678806456320 : Rat) / 359912837220743188970008058408861780397) [(3, 2), (5, 1), (13, 2), (15, 1)],
  term ((-147847046676439604201330883678806456320 : Rat) / 359912837220743188970008058408861780397) [(5, 1), (10, 2), (13, 2), (15, 1)],
  term ((-147847046676439604201330883678806456320 : Rat) / 359912837220743188970008058408861780397) [(5, 1), (11, 2), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 412 for generator 4. -/
theorem ep_Q2_024_partial_04_0412_valid :
    mulPoly ep_Q2_024_coefficient_04_0412
        ep_Q2_024_generator_04_0400_0499 =
      ep_Q2_024_partial_04_0412 := by
  native_decide

/-- Coefficient term 413 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0413 : Poly :=
[
  term ((-15947492711747053841607119528059672869962592746542302313 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(5, 1), (14, 1), (15, 1)]
]

/-- Partial product 413 for generator 4. -/
def ep_Q2_024_partial_04_0413 : Poly :=
[
  term ((-15947492711747053841607119528059672869962592746542302313 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(2, 2), (5, 1), (14, 1), (15, 1)],
  term ((-15947492711747053841607119528059672869962592746542302313 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(3, 2), (5, 1), (14, 1), (15, 1)],
  term ((15947492711747053841607119528059672869962592746542302313 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(5, 1), (10, 2), (14, 1), (15, 1)],
  term ((15947492711747053841607119528059672869962592746542302313 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(5, 1), (11, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 413 for generator 4. -/
theorem ep_Q2_024_partial_04_0413_valid :
    mulPoly ep_Q2_024_coefficient_04_0413
        ep_Q2_024_generator_04_0400_0499 =
      ep_Q2_024_partial_04_0413 := by
  native_decide

/-- Coefficient term 414 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0414 : Poly :=
[
  term ((1759640940265062 : Rat) / 1162780221153193) [(5, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 414 for generator 4. -/
def ep_Q2_024_partial_04_0414 : Poly :=
[
  term ((1759640940265062 : Rat) / 1162780221153193) [(2, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((1759640940265062 : Rat) / 1162780221153193) [(3, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1759640940265062 : Rat) / 1162780221153193) [(5, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1759640940265062 : Rat) / 1162780221153193) [(5, 1), (11, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 414 for generator 4. -/
theorem ep_Q2_024_partial_04_0414_valid :
    mulPoly ep_Q2_024_coefficient_04_0414
        ep_Q2_024_generator_04_0400_0499 =
      ep_Q2_024_partial_04_0414 := by
  native_decide

/-- Coefficient term 415 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0415 : Poly :=
[
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 1), (14, 1), (15, 3)]
]

/-- Partial product 415 for generator 4. -/
def ep_Q2_024_partial_04_0415 : Poly :=
[
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(2, 2), (5, 1), (14, 1), (15, 3)],
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 2), (5, 1), (14, 1), (15, 3)],
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 1), (10, 2), (14, 1), (15, 3)],
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 1), (11, 2), (14, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 415 for generator 4. -/
theorem ep_Q2_024_partial_04_0415_valid :
    mulPoly ep_Q2_024_coefficient_04_0415
        ep_Q2_024_generator_04_0400_0499 =
      ep_Q2_024_partial_04_0415 := by
  native_decide

/-- Coefficient term 416 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0416 : Poly :=
[
  term ((-833967741040952 : Rat) / 1162780221153193) [(5, 1), (14, 1), (15, 3), (16, 1)]
]

/-- Partial product 416 for generator 4. -/
def ep_Q2_024_partial_04_0416 : Poly :=
[
  term ((-833967741040952 : Rat) / 1162780221153193) [(2, 2), (5, 1), (14, 1), (15, 3), (16, 1)],
  term ((-833967741040952 : Rat) / 1162780221153193) [(3, 2), (5, 1), (14, 1), (15, 3), (16, 1)],
  term ((833967741040952 : Rat) / 1162780221153193) [(5, 1), (10, 2), (14, 1), (15, 3), (16, 1)],
  term ((833967741040952 : Rat) / 1162780221153193) [(5, 1), (11, 2), (14, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 416 for generator 4. -/
theorem ep_Q2_024_partial_04_0416_valid :
    mulPoly ep_Q2_024_coefficient_04_0416
        ep_Q2_024_generator_04_0400_0499 =
      ep_Q2_024_partial_04_0416 := by
  native_decide

/-- Coefficient term 417 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0417 : Poly :=
[
  term ((29627779009332143284283226421001764576646541097643147056 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(5, 1), (15, 1)]
]

/-- Partial product 417 for generator 4. -/
def ep_Q2_024_partial_04_0417 : Poly :=
[
  term ((29627779009332143284283226421001764576646541097643147056 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(2, 2), (5, 1), (15, 1)],
  term ((29627779009332143284283226421001764576646541097643147056 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(3, 2), (5, 1), (15, 1)],
  term ((-29627779009332143284283226421001764576646541097643147056 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(5, 1), (10, 2), (15, 1)],
  term ((-29627779009332143284283226421001764576646541097643147056 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(5, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 417 for generator 4. -/
theorem ep_Q2_024_partial_04_0417_valid :
    mulPoly ep_Q2_024_coefficient_04_0417
        ep_Q2_024_generator_04_0400_0499 =
      ep_Q2_024_partial_04_0417 := by
  native_decide

/-- Coefficient term 418 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0418 : Poly :=
[
  term ((-1827859283520988 : Rat) / 1162780221153193) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 418 for generator 4. -/
def ep_Q2_024_partial_04_0418 : Poly :=
[
  term ((-1827859283520988 : Rat) / 1162780221153193) [(2, 2), (5, 1), (15, 1), (16, 1)],
  term ((-1827859283520988 : Rat) / 1162780221153193) [(3, 2), (5, 1), (15, 1), (16, 1)],
  term ((1827859283520988 : Rat) / 1162780221153193) [(5, 1), (10, 2), (15, 1), (16, 1)],
  term ((1827859283520988 : Rat) / 1162780221153193) [(5, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 418 for generator 4. -/
theorem ep_Q2_024_partial_04_0418_valid :
    mulPoly ep_Q2_024_coefficient_04_0418
        ep_Q2_024_generator_04_0400_0499 =
      ep_Q2_024_partial_04_0418 := by
  native_decide

/-- Coefficient term 419 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0419 : Poly :=
[
  term ((596292272370210102731177090662239802901212841340772628921 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(5, 1), (15, 3)]
]

/-- Partial product 419 for generator 4. -/
def ep_Q2_024_partial_04_0419 : Poly :=
[
  term ((596292272370210102731177090662239802901212841340772628921 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(2, 2), (5, 1), (15, 3)],
  term ((596292272370210102731177090662239802901212841340772628921 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(3, 2), (5, 1), (15, 3)],
  term ((-596292272370210102731177090662239802901212841340772628921 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(5, 1), (10, 2), (15, 3)],
  term ((-596292272370210102731177090662239802901212841340772628921 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(5, 1), (11, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 419 for generator 4. -/
theorem ep_Q2_024_partial_04_0419_valid :
    mulPoly ep_Q2_024_coefficient_04_0419
        ep_Q2_024_generator_04_0400_0499 =
      ep_Q2_024_partial_04_0419 := by
  native_decide

/-- Coefficient term 420 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0420 : Poly :=
[
  term ((11177629529470399 : Rat) / 6976681326919158) [(5, 1), (15, 3), (16, 1)]
]

/-- Partial product 420 for generator 4. -/
def ep_Q2_024_partial_04_0420 : Poly :=
[
  term ((11177629529470399 : Rat) / 6976681326919158) [(2, 2), (5, 1), (15, 3), (16, 1)],
  term ((11177629529470399 : Rat) / 6976681326919158) [(3, 2), (5, 1), (15, 3), (16, 1)],
  term ((-11177629529470399 : Rat) / 6976681326919158) [(5, 1), (10, 2), (15, 3), (16, 1)],
  term ((-11177629529470399 : Rat) / 6976681326919158) [(5, 1), (11, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 420 for generator 4. -/
theorem ep_Q2_024_partial_04_0420_valid :
    mulPoly ep_Q2_024_coefficient_04_0420
        ep_Q2_024_generator_04_0400_0499 =
      ep_Q2_024_partial_04_0420 := by
  native_decide

/-- Coefficient term 421 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0421 : Poly :=
[
  term ((-319014959023338608753545314714028482032 : Rat) / 599854728701238648283346764014769633995) [(5, 2), (9, 1), (13, 1)]
]

/-- Partial product 421 for generator 4. -/
def ep_Q2_024_partial_04_0421 : Poly :=
[
  term ((-319014959023338608753545314714028482032 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (5, 2), (9, 1), (13, 1)],
  term ((-319014959023338608753545314714028482032 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (5, 2), (9, 1), (13, 1)],
  term ((319014959023338608753545314714028482032 : Rat) / 599854728701238648283346764014769633995) [(5, 2), (9, 1), (10, 2), (13, 1)],
  term ((319014959023338608753545314714028482032 : Rat) / 599854728701238648283346764014769633995) [(5, 2), (9, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 421 for generator 4. -/
theorem ep_Q2_024_partial_04_0421_valid :
    mulPoly ep_Q2_024_coefficient_04_0421
        ep_Q2_024_generator_04_0400_0499 =
      ep_Q2_024_partial_04_0421 := by
  native_decide

/-- Coefficient term 422 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0422 : Poly :=
[
  term ((-3028961299936339594435849179442279044072961783512194354 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 2), (9, 1), (15, 1)]
]

/-- Partial product 422 for generator 4. -/
def ep_Q2_024_partial_04_0422 : Poly :=
[
  term ((-3028961299936339594435849179442279044072961783512194354 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 2), (5, 2), (9, 1), (15, 1)],
  term ((-3028961299936339594435849179442279044072961783512194354 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 2), (5, 2), (9, 1), (15, 1)],
  term ((3028961299936339594435849179442279044072961783512194354 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 2), (9, 1), (10, 2), (15, 1)],
  term ((3028961299936339594435849179442279044072961783512194354 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 2), (9, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 422 for generator 4. -/
theorem ep_Q2_024_partial_04_0422_valid :
    mulPoly ep_Q2_024_coefficient_04_0422
        ep_Q2_024_generator_04_0400_0499 =
      ep_Q2_024_partial_04_0422 := by
  native_decide

/-- Coefficient term 423 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0423 : Poly :=
[
  term ((2568602061245288 : Rat) / 1162780221153193) [(5, 2), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 423 for generator 4. -/
def ep_Q2_024_partial_04_0423 : Poly :=
[
  term ((2568602061245288 : Rat) / 1162780221153193) [(2, 2), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((2568602061245288 : Rat) / 1162780221153193) [(3, 2), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((-2568602061245288 : Rat) / 1162780221153193) [(5, 2), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-2568602061245288 : Rat) / 1162780221153193) [(5, 2), (9, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 423 for generator 4. -/
theorem ep_Q2_024_partial_04_0423_valid :
    mulPoly ep_Q2_024_coefficient_04_0423
        ep_Q2_024_generator_04_0400_0499 =
      ep_Q2_024_partial_04_0423 := by
  native_decide

/-- Coefficient term 424 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0424 : Poly :=
[
  term ((-57424356410650916815904656776024181448 : Rat) / 199951576233746216094448921338256544665) [(5, 2), (9, 2)]
]

/-- Partial product 424 for generator 4. -/
def ep_Q2_024_partial_04_0424 : Poly :=
[
  term ((-57424356410650916815904656776024181448 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (5, 2), (9, 2)],
  term ((-57424356410650916815904656776024181448 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (5, 2), (9, 2)],
  term ((57424356410650916815904656776024181448 : Rat) / 199951576233746216094448921338256544665) [(5, 2), (9, 2), (10, 2)],
  term ((57424356410650916815904656776024181448 : Rat) / 199951576233746216094448921338256544665) [(5, 2), (9, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 424 for generator 4. -/
theorem ep_Q2_024_partial_04_0424_valid :
    mulPoly ep_Q2_024_coefficient_04_0424
        ep_Q2_024_generator_04_0400_0499 =
      ep_Q2_024_partial_04_0424 := by
  native_decide

/-- Coefficient term 425 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0425 : Poly :=
[
  term ((197694510238266821957195557551254432816 : Rat) / 599854728701238648283346764014769633995) [(5, 2), (13, 1), (15, 1)]
]

/-- Partial product 425 for generator 4. -/
def ep_Q2_024_partial_04_0425 : Poly :=
[
  term ((197694510238266821957195557551254432816 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (5, 2), (13, 1), (15, 1)],
  term ((197694510238266821957195557551254432816 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (5, 2), (13, 1), (15, 1)],
  term ((-197694510238266821957195557551254432816 : Rat) / 599854728701238648283346764014769633995) [(5, 2), (10, 2), (13, 1), (15, 1)],
  term ((-197694510238266821957195557551254432816 : Rat) / 599854728701238648283346764014769633995) [(5, 2), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 425 for generator 4. -/
theorem ep_Q2_024_partial_04_0425_valid :
    mulPoly ep_Q2_024_coefficient_04_0425
        ep_Q2_024_generator_04_0400_0499 =
      ep_Q2_024_partial_04_0425 := by
  native_decide

/-- Coefficient term 426 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0426 : Poly :=
[
  term ((5230076720176820119682108016672776177553508626941610138 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 2), (15, 2)]
]

/-- Partial product 426 for generator 4. -/
def ep_Q2_024_partial_04_0426 : Poly :=
[
  term ((5230076720176820119682108016672776177553508626941610138 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 2), (5, 2), (15, 2)],
  term ((5230076720176820119682108016672776177553508626941610138 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 2), (5, 2), (15, 2)],
  term ((-5230076720176820119682108016672776177553508626941610138 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 2), (10, 2), (15, 2)],
  term ((-5230076720176820119682108016672776177553508626941610138 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 2), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 426 for generator 4. -/
theorem ep_Q2_024_partial_04_0426_valid :
    mulPoly ep_Q2_024_coefficient_04_0426
        ep_Q2_024_generator_04_0400_0499 =
      ep_Q2_024_partial_04_0426 := by
  native_decide

/-- Coefficient term 427 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0427 : Poly :=
[
  term ((-2361660524222056 : Rat) / 1162780221153193) [(5, 2), (15, 2), (16, 1)]
]

/-- Partial product 427 for generator 4. -/
def ep_Q2_024_partial_04_0427 : Poly :=
[
  term ((-2361660524222056 : Rat) / 1162780221153193) [(2, 2), (5, 2), (15, 2), (16, 1)],
  term ((-2361660524222056 : Rat) / 1162780221153193) [(3, 2), (5, 2), (15, 2), (16, 1)],
  term ((2361660524222056 : Rat) / 1162780221153193) [(5, 2), (10, 2), (15, 2), (16, 1)],
  term ((2361660524222056 : Rat) / 1162780221153193) [(5, 2), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 427 for generator 4. -/
theorem ep_Q2_024_partial_04_0427_valid :
    mulPoly ep_Q2_024_coefficient_04_0427
        ep_Q2_024_generator_04_0400_0499 =
      ep_Q2_024_partial_04_0427 := by
  native_decide

/-- Coefficient term 428 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0428 : Poly :=
[
  term ((-206558578118461759089806144263373422486 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 1), (9, 1)]
]

/-- Partial product 428 for generator 4. -/
def ep_Q2_024_partial_04_0428 : Poly :=
[
  term ((-206558578118461759089806144263373422486 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (7, 1), (8, 1), (9, 1)],
  term ((-206558578118461759089806144263373422486 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (7, 1), (8, 1), (9, 1)],
  term ((206558578118461759089806144263373422486 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 1), (9, 1), (10, 2)],
  term ((206558578118461759089806144263373422486 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 1), (9, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 428 for generator 4. -/
theorem ep_Q2_024_partial_04_0428_valid :
    mulPoly ep_Q2_024_coefficient_04_0428
        ep_Q2_024_generator_04_0400_0499 =
      ep_Q2_024_partial_04_0428 := by
  native_decide

/-- Coefficient term 429 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0429 : Poly :=
[
  term ((-12979170683146789939085894591745652172 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 1), (12, 1), (13, 1)]
]

/-- Partial product 429 for generator 4. -/
def ep_Q2_024_partial_04_0429 : Poly :=
[
  term ((-12979170683146789939085894591745652172 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (7, 1), (8, 1), (12, 1), (13, 1)],
  term ((-12979170683146789939085894591745652172 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (7, 1), (8, 1), (12, 1), (13, 1)],
  term ((12979170683146789939085894591745652172 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 1), (10, 2), (12, 1), (13, 1)],
  term ((12979170683146789939085894591745652172 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 1), (11, 2), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 429 for generator 4. -/
theorem ep_Q2_024_partial_04_0429_valid :
    mulPoly ep_Q2_024_coefficient_04_0429
        ep_Q2_024_generator_04_0400_0499 =
      ep_Q2_024_partial_04_0429 := by
  native_decide

/-- Coefficient term 430 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0430 : Poly :=
[
  term ((519790077507635364246714238454931580267528154182411463 : Rat) / 929998952132019818504773430836265897467346423247461380) [(7, 1), (8, 1), (12, 1), (15, 1)]
]

/-- Partial product 430 for generator 4. -/
def ep_Q2_024_partial_04_0430 : Poly :=
[
  term ((519790077507635364246714238454931580267528154182411463 : Rat) / 929998952132019818504773430836265897467346423247461380) [(2, 2), (7, 1), (8, 1), (12, 1), (15, 1)],
  term ((519790077507635364246714238454931580267528154182411463 : Rat) / 929998952132019818504773430836265897467346423247461380) [(3, 2), (7, 1), (8, 1), (12, 1), (15, 1)],
  term ((-519790077507635364246714238454931580267528154182411463 : Rat) / 929998952132019818504773430836265897467346423247461380) [(7, 1), (8, 1), (10, 2), (12, 1), (15, 1)],
  term ((-519790077507635364246714238454931580267528154182411463 : Rat) / 929998952132019818504773430836265897467346423247461380) [(7, 1), (8, 1), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 430 for generator 4. -/
theorem ep_Q2_024_partial_04_0430_valid :
    mulPoly ep_Q2_024_coefficient_04_0430
        ep_Q2_024_generator_04_0400_0499 =
      ep_Q2_024_partial_04_0430 := by
  native_decide

/-- Coefficient term 431 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0431 : Poly :=
[
  term ((-212739288644735 : Rat) / 1162780221153193) [(7, 1), (8, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 431 for generator 4. -/
def ep_Q2_024_partial_04_0431 : Poly :=
[
  term ((-212739288644735 : Rat) / 1162780221153193) [(2, 2), (7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-212739288644735 : Rat) / 1162780221153193) [(3, 2), (7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((212739288644735 : Rat) / 1162780221153193) [(7, 1), (8, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((212739288644735 : Rat) / 1162780221153193) [(7, 1), (8, 1), (11, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 431 for generator 4. -/
theorem ep_Q2_024_partial_04_0431_valid :
    mulPoly ep_Q2_024_coefficient_04_0431
        ep_Q2_024_generator_04_0400_0499 =
      ep_Q2_024_partial_04_0431 := by
  native_decide

/-- Coefficient term 432 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0432 : Poly :=
[
  term ((84574267304034159307383392985859926898 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 1), (13, 1)]
]

/-- Partial product 432 for generator 4. -/
def ep_Q2_024_partial_04_0432 : Poly :=
[
  term ((84574267304034159307383392985859926898 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (7, 1), (8, 1), (13, 1)],
  term ((84574267304034159307383392985859926898 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (7, 1), (8, 1), (13, 1)],
  term ((-84574267304034159307383392985859926898 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 1), (10, 2), (13, 1)],
  term ((-84574267304034159307383392985859926898 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 432 for generator 4. -/
theorem ep_Q2_024_partial_04_0432_valid :
    mulPoly ep_Q2_024_coefficient_04_0432
        ep_Q2_024_generator_04_0400_0499 =
      ep_Q2_024_partial_04_0432 := by
  native_decide

/-- Coefficient term 433 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0433 : Poly :=
[
  term ((12391057674363913550311122299423538521421896682288632882 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (8, 1), (15, 1)]
]

/-- Partial product 433 for generator 4. -/
def ep_Q2_024_partial_04_0433 : Poly :=
[
  term ((12391057674363913550311122299423538521421896682288632882 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 2), (7, 1), (8, 1), (15, 1)],
  term ((12391057674363913550311122299423538521421896682288632882 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 2), (7, 1), (8, 1), (15, 1)],
  term ((-12391057674363913550311122299423538521421896682288632882 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (8, 1), (10, 2), (15, 1)],
  term ((-12391057674363913550311122299423538521421896682288632882 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (8, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 433 for generator 4. -/
theorem ep_Q2_024_partial_04_0433_valid :
    mulPoly ep_Q2_024_coefficient_04_0433
        ep_Q2_024_generator_04_0400_0499 =
      ep_Q2_024_partial_04_0433 := by
  native_decide

/-- Coefficient term 434 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0434 : Poly :=
[
  term ((-3501168887590402 : Rat) / 1162780221153193) [(7, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 434 for generator 4. -/
def ep_Q2_024_partial_04_0434 : Poly :=
[
  term ((-3501168887590402 : Rat) / 1162780221153193) [(2, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-3501168887590402 : Rat) / 1162780221153193) [(3, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((3501168887590402 : Rat) / 1162780221153193) [(7, 1), (8, 1), (10, 2), (15, 1), (16, 1)],
  term ((3501168887590402 : Rat) / 1162780221153193) [(7, 1), (8, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 434 for generator 4. -/
theorem ep_Q2_024_partial_04_0434_valid :
    mulPoly ep_Q2_024_coefficient_04_0434
        ep_Q2_024_generator_04_0400_0499 =
      ep_Q2_024_partial_04_0434 := by
  native_decide

/-- Coefficient term 435 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0435 : Poly :=
[
  term ((4238978574830944812688785943010145075721 : Rat) / 1799564186103715944850040292044308901985) [(7, 1), (9, 1)]
]

/-- Partial product 435 for generator 4. -/
def ep_Q2_024_partial_04_0435 : Poly :=
[
  term ((4238978574830944812688785943010145075721 : Rat) / 1799564186103715944850040292044308901985) [(2, 2), (7, 1), (9, 1)],
  term ((4238978574830944812688785943010145075721 : Rat) / 1799564186103715944850040292044308901985) [(3, 2), (7, 1), (9, 1)],
  term ((-4238978574830944812688785943010145075721 : Rat) / 1799564186103715944850040292044308901985) [(7, 1), (9, 1), (10, 2)],
  term ((-4238978574830944812688785943010145075721 : Rat) / 1799564186103715944850040292044308901985) [(7, 1), (9, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 435 for generator 4. -/
theorem ep_Q2_024_partial_04_0435_valid :
    mulPoly ep_Q2_024_coefficient_04_0435
        ep_Q2_024_generator_04_0400_0499 =
      ep_Q2_024_partial_04_0435 := by
  native_decide

/-- Coefficient term 436 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0436 : Poly :=
[
  term ((-886145460922430421280018592403483917716 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (9, 1), (12, 1)]
]

/-- Partial product 436 for generator 4. -/
def ep_Q2_024_partial_04_0436 : Poly :=
[
  term ((-886145460922430421280018592403483917716 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (7, 1), (9, 1), (12, 1)],
  term ((-886145460922430421280018592403483917716 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (7, 1), (9, 1), (12, 1)],
  term ((886145460922430421280018592403483917716 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (9, 1), (10, 2), (12, 1)],
  term ((886145460922430421280018592403483917716 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (9, 1), (11, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 436 for generator 4. -/
theorem ep_Q2_024_partial_04_0436_valid :
    mulPoly ep_Q2_024_coefficient_04_0436
        ep_Q2_024_generator_04_0400_0499 =
      ep_Q2_024_partial_04_0436 := by
  native_decide

/-- Coefficient term 437 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0437 : Poly :=
[
  term ((798582412409743722368367385112215430768 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (9, 1), (13, 1), (15, 1)]
]

/-- Partial product 437 for generator 4. -/
def ep_Q2_024_partial_04_0437 : Poly :=
[
  term ((798582412409743722368367385112215430768 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((798582412409743722368367385112215430768 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((-798582412409743722368367385112215430768 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (9, 1), (10, 2), (13, 1), (15, 1)],
  term ((-798582412409743722368367385112215430768 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (9, 1), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 437 for generator 4. -/
theorem ep_Q2_024_partial_04_0437_valid :
    mulPoly ep_Q2_024_coefficient_04_0437
        ep_Q2_024_generator_04_0400_0499 =
      ep_Q2_024_partial_04_0437 := by
  native_decide

/-- Coefficient term 438 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0438 : Poly :=
[
  term ((2234691451781231325421589515033267771336 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (9, 1), (14, 1)]
]

/-- Partial product 438 for generator 4. -/
def ep_Q2_024_partial_04_0438 : Poly :=
[
  term ((2234691451781231325421589515033267771336 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (7, 1), (9, 1), (14, 1)],
  term ((2234691451781231325421589515033267771336 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (7, 1), (9, 1), (14, 1)],
  term ((-2234691451781231325421589515033267771336 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (9, 1), (10, 2), (14, 1)],
  term ((-2234691451781231325421589515033267771336 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (9, 1), (11, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 438 for generator 4. -/
theorem ep_Q2_024_partial_04_0438_valid :
    mulPoly ep_Q2_024_coefficient_04_0438
        ep_Q2_024_generator_04_0400_0499 =
      ep_Q2_024_partial_04_0438 := by
  native_decide

/-- Coefficient term 439 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0439 : Poly :=
[
  term ((-4344074584876535282375746373930099123380749438247228923 : Rat) / 464999476066009909252386715418132948733673211623730690) [(7, 1), (9, 1), (15, 2)]
]

/-- Partial product 439 for generator 4. -/
def ep_Q2_024_partial_04_0439 : Poly :=
[
  term ((-4344074584876535282375746373930099123380749438247228923 : Rat) / 464999476066009909252386715418132948733673211623730690) [(2, 2), (7, 1), (9, 1), (15, 2)],
  term ((-4344074584876535282375746373930099123380749438247228923 : Rat) / 464999476066009909252386715418132948733673211623730690) [(3, 2), (7, 1), (9, 1), (15, 2)],
  term ((4344074584876535282375746373930099123380749438247228923 : Rat) / 464999476066009909252386715418132948733673211623730690) [(7, 1), (9, 1), (10, 2), (15, 2)],
  term ((4344074584876535282375746373930099123380749438247228923 : Rat) / 464999476066009909252386715418132948733673211623730690) [(7, 1), (9, 1), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 439 for generator 4. -/
theorem ep_Q2_024_partial_04_0439_valid :
    mulPoly ep_Q2_024_coefficient_04_0439
        ep_Q2_024_generator_04_0400_0499 =
      ep_Q2_024_partial_04_0439 := by
  native_decide

/-- Coefficient term 440 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0440 : Poly :=
[
  term ((3065637341133238 : Rat) / 1162780221153193) [(7, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 440 for generator 4. -/
def ep_Q2_024_partial_04_0440 : Poly :=
[
  term ((3065637341133238 : Rat) / 1162780221153193) [(2, 2), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((3065637341133238 : Rat) / 1162780221153193) [(3, 2), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((-3065637341133238 : Rat) / 1162780221153193) [(7, 1), (9, 1), (10, 2), (15, 2), (16, 1)],
  term ((-3065637341133238 : Rat) / 1162780221153193) [(7, 1), (9, 1), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 440 for generator 4. -/
theorem ep_Q2_024_partial_04_0440_valid :
    mulPoly ep_Q2_024_coefficient_04_0440
        ep_Q2_024_generator_04_0400_0499 =
      ep_Q2_024_partial_04_0440 := by
  native_decide

/-- Coefficient term 441 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0441 : Poly :=
[
  term ((220893862652644812159568003760951473696 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (9, 2), (15, 1)]
]

/-- Partial product 441 for generator 4. -/
def ep_Q2_024_partial_04_0441 : Poly :=
[
  term ((220893862652644812159568003760951473696 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (7, 1), (9, 2), (15, 1)],
  term ((220893862652644812159568003760951473696 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (7, 1), (9, 2), (15, 1)],
  term ((-220893862652644812159568003760951473696 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (9, 2), (10, 2), (15, 1)],
  term ((-220893862652644812159568003760951473696 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (9, 2), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 441 for generator 4. -/
theorem ep_Q2_024_partial_04_0441_valid :
    mulPoly ep_Q2_024_coefficient_04_0441
        ep_Q2_024_generator_04_0400_0499 =
      ep_Q2_024_partial_04_0441 := by
  native_decide

/-- Coefficient term 442 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0442 : Poly :=
[
  term ((-518543174883551540146515086812976898784 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (11, 1)]
]

/-- Partial product 442 for generator 4. -/
def ep_Q2_024_partial_04_0442 : Poly :=
[
  term ((-518543174883551540146515086812976898784 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (7, 1), (11, 1)],
  term ((-518543174883551540146515086812976898784 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (7, 1), (11, 1)],
  term ((518543174883551540146515086812976898784 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (10, 2), (11, 1)],
  term ((518543174883551540146515086812976898784 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (11, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 442 for generator 4. -/
theorem ep_Q2_024_partial_04_0442_valid :
    mulPoly ep_Q2_024_coefficient_04_0442
        ep_Q2_024_generator_04_0400_0499 =
      ep_Q2_024_partial_04_0442 := by
  native_decide

/-- Coefficient term 443 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0443 : Poly :=
[
  term ((-89547604594084105807568793286655194652 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (12, 1), (13, 1)]
]

/-- Partial product 443 for generator 4. -/
def ep_Q2_024_partial_04_0443 : Poly :=
[
  term ((-89547604594084105807568793286655194652 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (7, 1), (12, 1), (13, 1)],
  term ((-89547604594084105807568793286655194652 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (7, 1), (12, 1), (13, 1)],
  term ((89547604594084105807568793286655194652 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (10, 2), (12, 1), (13, 1)],
  term ((89547604594084105807568793286655194652 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (11, 2), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 443 for generator 4. -/
theorem ep_Q2_024_partial_04_0443_valid :
    mulPoly ep_Q2_024_coefficient_04_0443
        ep_Q2_024_generator_04_0400_0499 =
      ep_Q2_024_partial_04_0443 := by
  native_decide

/-- Coefficient term 444 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0444 : Poly :=
[
  term ((48438423129215560676143065672187698824 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 444 for generator 4. -/
def ep_Q2_024_partial_04_0444 : Poly :=
[
  term ((48438423129215560676143065672187698824 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((48438423129215560676143065672187698824 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((-48438423129215560676143065672187698824 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (10, 2), (12, 1), (13, 1), (14, 1)],
  term ((-48438423129215560676143065672187698824 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (11, 2), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 444 for generator 4. -/
theorem ep_Q2_024_partial_04_0444_valid :
    mulPoly ep_Q2_024_coefficient_04_0444
        ep_Q2_024_generator_04_0400_0499 =
      ep_Q2_024_partial_04_0444 := by
  native_decide

/-- Coefficient term 445 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0445 : Poly :=
[
  term ((33273931020260669930661190011024360672 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (12, 1), (13, 1), (15, 2)]
]

/-- Partial product 445 for generator 4. -/
def ep_Q2_024_partial_04_0445 : Poly :=
[
  term ((33273931020260669930661190011024360672 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (7, 1), (12, 1), (13, 1), (15, 2)],
  term ((33273931020260669930661190011024360672 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (7, 1), (12, 1), (13, 1), (15, 2)],
  term ((-33273931020260669930661190011024360672 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (10, 2), (12, 1), (13, 1), (15, 2)],
  term ((-33273931020260669930661190011024360672 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (11, 2), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 445 for generator 4. -/
theorem ep_Q2_024_partial_04_0445_valid :
    mulPoly ep_Q2_024_coefficient_04_0445
        ep_Q2_024_generator_04_0400_0499 =
      ep_Q2_024_partial_04_0445 := by
  native_decide

/-- Coefficient term 446 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0446 : Poly :=
[
  term ((-838411973319437252533717745383941150125364404896314437 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(7, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 446 for generator 4. -/
def ep_Q2_024_partial_04_0446 : Poly :=
[
  term ((-838411973319437252533717745383941150125364404896314437 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(2, 2), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((-838411973319437252533717745383941150125364404896314437 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(3, 2), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((838411973319437252533717745383941150125364404896314437 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(7, 1), (10, 2), (12, 1), (14, 1), (15, 1)],
  term ((838411973319437252533717745383941150125364404896314437 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(7, 1), (11, 2), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 446 for generator 4. -/
theorem ep_Q2_024_partial_04_0446_valid :
    mulPoly ep_Q2_024_coefficient_04_0446
        ep_Q2_024_generator_04_0400_0499 =
      ep_Q2_024_partial_04_0446 := by
  native_decide

/-- Coefficient term 447 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0447 : Poly :=
[
  term ((-1274781574709922 : Rat) / 1162780221153193) [(7, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 447 for generator 4. -/
def ep_Q2_024_partial_04_0447 : Poly :=
[
  term ((-1274781574709922 : Rat) / 1162780221153193) [(2, 2), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1274781574709922 : Rat) / 1162780221153193) [(3, 2), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1274781574709922 : Rat) / 1162780221153193) [(7, 1), (10, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1274781574709922 : Rat) / 1162780221153193) [(7, 1), (11, 2), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 447 for generator 4. -/
theorem ep_Q2_024_partial_04_0447_valid :
    mulPoly ep_Q2_024_coefficient_04_0447
        ep_Q2_024_generator_04_0400_0499 =
      ep_Q2_024_partial_04_0447 := by
  native_decide

/-- Coefficient term 448 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0448 : Poly :=
[
  term ((29037040217161627543541343141623393529291908260485924539 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (12, 1), (15, 1)]
]

/-- Partial product 448 for generator 4. -/
def ep_Q2_024_partial_04_0448 : Poly :=
[
  term ((29037040217161627543541343141623393529291908260485924539 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 2), (7, 1), (12, 1), (15, 1)],
  term ((29037040217161627543541343141623393529291908260485924539 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 2), (7, 1), (12, 1), (15, 1)],
  term ((-29037040217161627543541343141623393529291908260485924539 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (10, 2), (12, 1), (15, 1)],
  term ((-29037040217161627543541343141623393529291908260485924539 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 448 for generator 4. -/
theorem ep_Q2_024_partial_04_0448_valid :
    mulPoly ep_Q2_024_coefficient_04_0448
        ep_Q2_024_generator_04_0400_0499 =
      ep_Q2_024_partial_04_0448 := by
  native_decide

/-- Coefficient term 449 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0449 : Poly :=
[
  term ((757043177666604 : Rat) / 1162780221153193) [(7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 449 for generator 4. -/
def ep_Q2_024_partial_04_0449 : Poly :=
[
  term ((757043177666604 : Rat) / 1162780221153193) [(2, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((757043177666604 : Rat) / 1162780221153193) [(3, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-757043177666604 : Rat) / 1162780221153193) [(7, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((-757043177666604 : Rat) / 1162780221153193) [(7, 1), (11, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 449 for generator 4. -/
theorem ep_Q2_024_partial_04_0449_valid :
    mulPoly ep_Q2_024_coefficient_04_0449
        ep_Q2_024_generator_04_0400_0499 =
      ep_Q2_024_partial_04_0449 := by
  native_decide

/-- Coefficient term 450 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0450 : Poly :=
[
  term ((-198745616475118943998092102782769635563595552220534688 : Rat) / 46499947606600990925238671541813294873367321162373069) [(7, 1), (12, 1), (15, 3)]
]

/-- Partial product 450 for generator 4. -/
def ep_Q2_024_partial_04_0450 : Poly :=
[
  term ((-198745616475118943998092102782769635563595552220534688 : Rat) / 46499947606600990925238671541813294873367321162373069) [(2, 2), (7, 1), (12, 1), (15, 3)],
  term ((-198745616475118943998092102782769635563595552220534688 : Rat) / 46499947606600990925238671541813294873367321162373069) [(3, 2), (7, 1), (12, 1), (15, 3)],
  term ((198745616475118943998092102782769635563595552220534688 : Rat) / 46499947606600990925238671541813294873367321162373069) [(7, 1), (10, 2), (12, 1), (15, 3)],
  term ((198745616475118943998092102782769635563595552220534688 : Rat) / 46499947606600990925238671541813294873367321162373069) [(7, 1), (11, 2), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 450 for generator 4. -/
theorem ep_Q2_024_partial_04_0450_valid :
    mulPoly ep_Q2_024_coefficient_04_0450
        ep_Q2_024_generator_04_0400_0499 =
      ep_Q2_024_partial_04_0450 := by
  native_decide

/-- Coefficient term 451 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0451 : Poly :=
[
  term ((1581632301823296 : Rat) / 1162780221153193) [(7, 1), (12, 1), (15, 3), (16, 1)]
]

/-- Partial product 451 for generator 4. -/
def ep_Q2_024_partial_04_0451 : Poly :=
[
  term ((1581632301823296 : Rat) / 1162780221153193) [(2, 2), (7, 1), (12, 1), (15, 3), (16, 1)],
  term ((1581632301823296 : Rat) / 1162780221153193) [(3, 2), (7, 1), (12, 1), (15, 3), (16, 1)],
  term ((-1581632301823296 : Rat) / 1162780221153193) [(7, 1), (10, 2), (12, 1), (15, 3), (16, 1)],
  term ((-1581632301823296 : Rat) / 1162780221153193) [(7, 1), (11, 2), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 451 for generator 4. -/
theorem ep_Q2_024_partial_04_0451_valid :
    mulPoly ep_Q2_024_coefficient_04_0451
        ep_Q2_024_generator_04_0400_0499 =
      ep_Q2_024_partial_04_0451 := by
  native_decide

/-- Coefficient term 452 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0452 : Poly :=
[
  term ((361897348718776485311185231728879779368 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (12, 2), (13, 1)]
]

/-- Partial product 452 for generator 4. -/
def ep_Q2_024_partial_04_0452 : Poly :=
[
  term ((361897348718776485311185231728879779368 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (7, 1), (12, 2), (13, 1)],
  term ((361897348718776485311185231728879779368 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (7, 1), (12, 2), (13, 1)],
  term ((-361897348718776485311185231728879779368 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (10, 2), (12, 2), (13, 1)],
  term ((-361897348718776485311185231728879779368 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (11, 2), (12, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 452 for generator 4. -/
theorem ep_Q2_024_partial_04_0452_valid :
    mulPoly ep_Q2_024_coefficient_04_0452
        ep_Q2_024_generator_04_0400_0499 =
      ep_Q2_024_partial_04_0452 := by
  native_decide

/-- Coefficient term 453 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0453 : Poly :=
[
  term ((-6285331816600909397659698691956620588036985675621846367 : Rat) / 464999476066009909252386715418132948733673211623730690) [(7, 1), (12, 2), (15, 1)]
]

/-- Partial product 453 for generator 4. -/
def ep_Q2_024_partial_04_0453 : Poly :=
[
  term ((-6285331816600909397659698691956620588036985675621846367 : Rat) / 464999476066009909252386715418132948733673211623730690) [(2, 2), (7, 1), (12, 2), (15, 1)],
  term ((-6285331816600909397659698691956620588036985675621846367 : Rat) / 464999476066009909252386715418132948733673211623730690) [(3, 2), (7, 1), (12, 2), (15, 1)],
  term ((6285331816600909397659698691956620588036985675621846367 : Rat) / 464999476066009909252386715418132948733673211623730690) [(7, 1), (10, 2), (12, 2), (15, 1)],
  term ((6285331816600909397659698691956620588036985675621846367 : Rat) / 464999476066009909252386715418132948733673211623730690) [(7, 1), (11, 2), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 453 for generator 4. -/
theorem ep_Q2_024_partial_04_0453_valid :
    mulPoly ep_Q2_024_coefficient_04_0453
        ep_Q2_024_generator_04_0400_0499 =
      ep_Q2_024_partial_04_0453 := by
  native_decide

/-- Coefficient term 454 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0454 : Poly :=
[
  term ((1324091967043342 : Rat) / 1162780221153193) [(7, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 454 for generator 4. -/
def ep_Q2_024_partial_04_0454 : Poly :=
[
  term ((1324091967043342 : Rat) / 1162780221153193) [(2, 2), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((1324091967043342 : Rat) / 1162780221153193) [(3, 2), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1324091967043342 : Rat) / 1162780221153193) [(7, 1), (10, 2), (12, 2), (15, 1), (16, 1)],
  term ((-1324091967043342 : Rat) / 1162780221153193) [(7, 1), (11, 2), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 454 for generator 4. -/
theorem ep_Q2_024_partial_04_0454_valid :
    mulPoly ep_Q2_024_coefficient_04_0454
        ep_Q2_024_generator_04_0400_0499 =
      ep_Q2_024_partial_04_0454 := by
  native_decide

/-- Coefficient term 455 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0455 : Poly :=
[
  term ((-599984196030905917187784991017220141898 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (13, 1)]
]

/-- Partial product 455 for generator 4. -/
def ep_Q2_024_partial_04_0455 : Poly :=
[
  term ((-599984196030905917187784991017220141898 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (7, 1), (13, 1)],
  term ((-599984196030905917187784991017220141898 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (7, 1), (13, 1)],
  term ((599984196030905917187784991017220141898 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (10, 2), (13, 1)],
  term ((599984196030905917187784991017220141898 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 455 for generator 4. -/
theorem ep_Q2_024_partial_04_0455_valid :
    mulPoly ep_Q2_024_coefficient_04_0455
        ep_Q2_024_generator_04_0400_0499 =
      ep_Q2_024_partial_04_0455 := by
  native_decide

/-- Coefficient term 456 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0456 : Poly :=
[
  term ((-903084356647818576853574366344410520372 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (13, 1), (14, 1)]
]

/-- Partial product 456 for generator 4. -/
def ep_Q2_024_partial_04_0456 : Poly :=
[
  term ((-903084356647818576853574366344410520372 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (7, 1), (13, 1), (14, 1)],
  term ((-903084356647818576853574366344410520372 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (7, 1), (13, 1), (14, 1)],
  term ((903084356647818576853574366344410520372 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (10, 2), (13, 1), (14, 1)],
  term ((903084356647818576853574366344410520372 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (11, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 456 for generator 4. -/
theorem ep_Q2_024_partial_04_0456_valid :
    mulPoly ep_Q2_024_coefficient_04_0456
        ep_Q2_024_generator_04_0400_0499 =
      ep_Q2_024_partial_04_0456 := by
  native_decide

/-- Coefficient term 457 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0457 : Poly :=
[
  term ((-19358917253490364062047066221672448008 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (13, 1), (14, 2)]
]

/-- Partial product 457 for generator 4. -/
def ep_Q2_024_partial_04_0457 : Poly :=
[
  term ((-19358917253490364062047066221672448008 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (7, 1), (13, 1), (14, 2)],
  term ((-19358917253490364062047066221672448008 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (7, 1), (13, 1), (14, 2)],
  term ((19358917253490364062047066221672448008 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (10, 2), (13, 1), (14, 2)],
  term ((19358917253490364062047066221672448008 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (11, 2), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 457 for generator 4. -/
theorem ep_Q2_024_partial_04_0457_valid :
    mulPoly ep_Q2_024_coefficient_04_0457
        ep_Q2_024_generator_04_0400_0499 =
      ep_Q2_024_partial_04_0457 := by
  native_decide

/-- Coefficient term 458 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0458 : Poly :=
[
  term ((-94155537895141594327780228805357359980550026461185294441 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(7, 1), (13, 1), (15, 2)]
]

/-- Partial product 458 for generator 4. -/
def ep_Q2_024_partial_04_0458 : Poly :=
[
  term ((-94155537895141594327780228805357359980550026461185294441 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(2, 2), (7, 1), (13, 1), (15, 2)],
  term ((-94155537895141594327780228805357359980550026461185294441 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(3, 2), (7, 1), (13, 1), (15, 2)],
  term ((94155537895141594327780228805357359980550026461185294441 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(7, 1), (10, 2), (13, 1), (15, 2)],
  term ((94155537895141594327780228805357359980550026461185294441 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(7, 1), (11, 2), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 458 for generator 4. -/
theorem ep_Q2_024_partial_04_0458_valid :
    mulPoly ep_Q2_024_coefficient_04_0458
        ep_Q2_024_generator_04_0400_0499 =
      ep_Q2_024_partial_04_0458 := by
  native_decide

/-- Coefficient term 459 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0459 : Poly :=
[
  term ((355227462877051 : Rat) / 1162780221153193) [(7, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 459 for generator 4. -/
def ep_Q2_024_partial_04_0459 : Poly :=
[
  term ((355227462877051 : Rat) / 1162780221153193) [(2, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((355227462877051 : Rat) / 1162780221153193) [(3, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-355227462877051 : Rat) / 1162780221153193) [(7, 1), (10, 2), (13, 1), (15, 2), (16, 1)],
  term ((-355227462877051 : Rat) / 1162780221153193) [(7, 1), (11, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 459 for generator 4. -/
theorem ep_Q2_024_partial_04_0459_valid :
    mulPoly ep_Q2_024_coefficient_04_0459
        ep_Q2_024_generator_04_0400_0499 =
      ep_Q2_024_partial_04_0459 := by
  native_decide

/-- Coefficient term 460 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0460 : Poly :=
[
  term ((46824955938503210518999122991775109724 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (13, 2), (15, 1)]
]

/-- Partial product 460 for generator 4. -/
def ep_Q2_024_partial_04_0460 : Poly :=
[
  term ((46824955938503210518999122991775109724 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (7, 1), (13, 2), (15, 1)],
  term ((46824955938503210518999122991775109724 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (7, 1), (13, 2), (15, 1)],
  term ((-46824955938503210518999122991775109724 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (10, 2), (13, 2), (15, 1)],
  term ((-46824955938503210518999122991775109724 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (11, 2), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 460 for generator 4. -/
theorem ep_Q2_024_partial_04_0460_valid :
    mulPoly ep_Q2_024_coefficient_04_0460
        ep_Q2_024_generator_04_0400_0499 =
      ep_Q2_024_partial_04_0460 := by
  native_decide

/-- Coefficient term 461 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0461 : Poly :=
[
  term ((-152747837075665191647550940228390518739988190776522320643 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(7, 1), (14, 1), (15, 1)]
]

/-- Partial product 461 for generator 4. -/
def ep_Q2_024_partial_04_0461 : Poly :=
[
  term ((-152747837075665191647550940228390518739988190776522320643 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(2, 2), (7, 1), (14, 1), (15, 1)],
  term ((-152747837075665191647550940228390518739988190776522320643 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(3, 2), (7, 1), (14, 1), (15, 1)],
  term ((152747837075665191647550940228390518739988190776522320643 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(7, 1), (10, 2), (14, 1), (15, 1)],
  term ((152747837075665191647550940228390518739988190776522320643 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(7, 1), (11, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 461 for generator 4. -/
theorem ep_Q2_024_partial_04_0461_valid :
    mulPoly ep_Q2_024_coefficient_04_0461
        ep_Q2_024_generator_04_0400_0499 =
      ep_Q2_024_partial_04_0461 := by
  native_decide

/-- Coefficient term 462 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0462 : Poly :=
[
  term ((2483128441501057 : Rat) / 1162780221153193) [(7, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 462 for generator 4. -/
def ep_Q2_024_partial_04_0462 : Poly :=
[
  term ((2483128441501057 : Rat) / 1162780221153193) [(2, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((2483128441501057 : Rat) / 1162780221153193) [(3, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2483128441501057 : Rat) / 1162780221153193) [(7, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((-2483128441501057 : Rat) / 1162780221153193) [(7, 1), (11, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 462 for generator 4. -/
theorem ep_Q2_024_partial_04_0462_valid :
    mulPoly ep_Q2_024_coefficient_04_0462
        ep_Q2_024_generator_04_0400_0499 =
      ep_Q2_024_partial_04_0462 := by
  native_decide

/-- Coefficient term 463 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0463 : Poly :=
[
  term ((-3773401973948365711472042274593795909232108488982391511 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (14, 2), (15, 1)]
]

/-- Partial product 463 for generator 4. -/
def ep_Q2_024_partial_04_0463 : Poly :=
[
  term ((-3773401973948365711472042274593795909232108488982391511 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 2), (7, 1), (14, 2), (15, 1)],
  term ((-3773401973948365711472042274593795909232108488982391511 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 2), (7, 1), (14, 2), (15, 1)],
  term ((3773401973948365711472042274593795909232108488982391511 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (10, 2), (14, 2), (15, 1)],
  term ((3773401973948365711472042274593795909232108488982391511 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (11, 2), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 463 for generator 4. -/
theorem ep_Q2_024_partial_04_0463_valid :
    mulPoly ep_Q2_024_coefficient_04_0463
        ep_Q2_024_generator_04_0400_0499 =
      ep_Q2_024_partial_04_0463 := by
  native_decide

/-- Coefficient term 464 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0464 : Poly :=
[
  term ((-938674662914812 : Rat) / 1162780221153193) [(7, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 464 for generator 4. -/
def ep_Q2_024_partial_04_0464 : Poly :=
[
  term ((-938674662914812 : Rat) / 1162780221153193) [(2, 2), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-938674662914812 : Rat) / 1162780221153193) [(3, 2), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((938674662914812 : Rat) / 1162780221153193) [(7, 1), (10, 2), (14, 2), (15, 1), (16, 1)],
  term ((938674662914812 : Rat) / 1162780221153193) [(7, 1), (11, 2), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 464 for generator 4. -/
theorem ep_Q2_024_partial_04_0464_valid :
    mulPoly ep_Q2_024_coefficient_04_0464
        ep_Q2_024_generator_04_0400_0499 =
      ep_Q2_024_partial_04_0464 := by
  native_decide

/-- Coefficient term 465 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0465 : Poly :=
[
  term ((-19939264653645454550844396512708814820467810798252762778 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(7, 1), (15, 1)]
]

/-- Partial product 465 for generator 4. -/
def ep_Q2_024_partial_04_0465 : Poly :=
[
  term ((-19939264653645454550844396512708814820467810798252762778 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(2, 2), (7, 1), (15, 1)],
  term ((-19939264653645454550844396512708814820467810798252762778 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(3, 2), (7, 1), (15, 1)],
  term ((19939264653645454550844396512708814820467810798252762778 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(7, 1), (10, 2), (15, 1)],
  term ((19939264653645454550844396512708814820467810798252762778 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(7, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 465 for generator 4. -/
theorem ep_Q2_024_partial_04_0465_valid :
    mulPoly ep_Q2_024_coefficient_04_0465
        ep_Q2_024_generator_04_0400_0499 =
      ep_Q2_024_partial_04_0465 := by
  native_decide

/-- Coefficient term 466 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0466 : Poly :=
[
  term ((-5527295484604502 : Rat) / 1162780221153193) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 466 for generator 4. -/
def ep_Q2_024_partial_04_0466 : Poly :=
[
  term ((-5527295484604502 : Rat) / 1162780221153193) [(2, 2), (7, 1), (15, 1), (16, 1)],
  term ((-5527295484604502 : Rat) / 1162780221153193) [(3, 2), (7, 1), (15, 1), (16, 1)],
  term ((5527295484604502 : Rat) / 1162780221153193) [(7, 1), (10, 2), (15, 1), (16, 1)],
  term ((5527295484604502 : Rat) / 1162780221153193) [(7, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 466 for generator 4. -/
theorem ep_Q2_024_partial_04_0466_valid :
    mulPoly ep_Q2_024_coefficient_04_0466
        ep_Q2_024_generator_04_0400_0499 =
      ep_Q2_024_partial_04_0466 := by
  native_decide

/-- Coefficient term 467 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0467 : Poly :=
[
  term ((182587976773348285098138707057166213218449056697193285789 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(7, 1), (15, 3)]
]

/-- Partial product 467 for generator 4. -/
def ep_Q2_024_partial_04_0467 : Poly :=
[
  term ((182587976773348285098138707057166213218449056697193285789 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(2, 2), (7, 1), (15, 3)],
  term ((182587976773348285098138707057166213218449056697193285789 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(3, 2), (7, 1), (15, 3)],
  term ((-182587976773348285098138707057166213218449056697193285789 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(7, 1), (10, 2), (15, 3)],
  term ((-182587976773348285098138707057166213218449056697193285789 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(7, 1), (11, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 467 for generator 4. -/
theorem ep_Q2_024_partial_04_0467_valid :
    mulPoly ep_Q2_024_coefficient_04_0467
        ep_Q2_024_generator_04_0400_0499 =
      ep_Q2_024_partial_04_0467 := by
  native_decide

/-- Coefficient term 468 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0468 : Poly :=
[
  term ((-4478221057214655 : Rat) / 1162780221153193) [(7, 1), (15, 3), (16, 1)]
]

/-- Partial product 468 for generator 4. -/
def ep_Q2_024_partial_04_0468 : Poly :=
[
  term ((-4478221057214655 : Rat) / 1162780221153193) [(2, 2), (7, 1), (15, 3), (16, 1)],
  term ((-4478221057214655 : Rat) / 1162780221153193) [(3, 2), (7, 1), (15, 3), (16, 1)],
  term ((4478221057214655 : Rat) / 1162780221153193) [(7, 1), (10, 2), (15, 3), (16, 1)],
  term ((4478221057214655 : Rat) / 1162780221153193) [(7, 1), (11, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 468 for generator 4. -/
theorem ep_Q2_024_partial_04_0468_valid :
    mulPoly ep_Q2_024_coefficient_04_0468
        ep_Q2_024_generator_04_0400_0499 =
      ep_Q2_024_partial_04_0468 := by
  native_decide

/-- Coefficient term 469 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0469 : Poly :=
[
  term ((-3709776815823037082149296919241914084111 : Rat) / 3599128372207431889700080584088617803970) [(8, 1)]
]

/-- Partial product 469 for generator 4. -/
def ep_Q2_024_partial_04_0469 : Poly :=
[
  term ((-3709776815823037082149296919241914084111 : Rat) / 3599128372207431889700080584088617803970) [(2, 2), (8, 1)],
  term ((-3709776815823037082149296919241914084111 : Rat) / 3599128372207431889700080584088617803970) [(3, 2), (8, 1)],
  term ((3709776815823037082149296919241914084111 : Rat) / 3599128372207431889700080584088617803970) [(8, 1), (10, 2)],
  term ((3709776815823037082149296919241914084111 : Rat) / 3599128372207431889700080584088617803970) [(8, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 469 for generator 4. -/
theorem ep_Q2_024_partial_04_0469_valid :
    mulPoly ep_Q2_024_coefficient_04_0469
        ep_Q2_024_generator_04_0400_0499 =
      ep_Q2_024_partial_04_0469 := by
  native_decide

/-- Coefficient term 470 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0470 : Poly :=
[
  term ((-1225265322114654679026622704559141817402 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (9, 1), (11, 1)]
]

/-- Partial product 470 for generator 4. -/
def ep_Q2_024_partial_04_0470 : Poly :=
[
  term ((-1225265322114654679026622704559141817402 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (8, 1), (9, 1), (11, 1)],
  term ((-1225265322114654679026622704559141817402 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (8, 1), (9, 1), (11, 1)],
  term ((1225265322114654679026622704559141817402 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (9, 1), (10, 2), (11, 1)],
  term ((1225265322114654679026622704559141817402 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (9, 1), (11, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 470 for generator 4. -/
theorem ep_Q2_024_partial_04_0470_valid :
    mulPoly ep_Q2_024_coefficient_04_0470
        ep_Q2_024_generator_04_0400_0499 =
      ep_Q2_024_partial_04_0470 := by
  native_decide

/-- Coefficient term 471 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0471 : Poly :=
[
  term ((100649367268495437262557180149834752612 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (9, 1), (12, 1), (13, 1)]
]

/-- Partial product 471 for generator 4. -/
def ep_Q2_024_partial_04_0471 : Poly :=
[
  term ((100649367268495437262557180149834752612 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (8, 1), (9, 1), (12, 1), (13, 1)],
  term ((100649367268495437262557180149834752612 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (8, 1), (9, 1), (12, 1), (13, 1)],
  term ((-100649367268495437262557180149834752612 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (9, 1), (10, 2), (12, 1), (13, 1)],
  term ((-100649367268495437262557180149834752612 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (9, 1), (11, 2), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 471 for generator 4. -/
theorem ep_Q2_024_partial_04_0471_valid :
    mulPoly ep_Q2_024_coefficient_04_0471
        ep_Q2_024_generator_04_0400_0499 =
      ep_Q2_024_partial_04_0471 := by
  native_decide

/-- Coefficient term 472 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0472 : Poly :=
[
  term ((-3791903801717596649589202177171618108825510710996247681 : Rat) / 929998952132019818504773430836265897467346423247461380) [(8, 1), (9, 1), (12, 1), (15, 1)]
]

/-- Partial product 472 for generator 4. -/
def ep_Q2_024_partial_04_0472 : Poly :=
[
  term ((-3791903801717596649589202177171618108825510710996247681 : Rat) / 929998952132019818504773430836265897467346423247461380) [(2, 2), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((-3791903801717596649589202177171618108825510710996247681 : Rat) / 929998952132019818504773430836265897467346423247461380) [(3, 2), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((3791903801717596649589202177171618108825510710996247681 : Rat) / 929998952132019818504773430836265897467346423247461380) [(8, 1), (9, 1), (10, 2), (12, 1), (15, 1)],
  term ((3791903801717596649589202177171618108825510710996247681 : Rat) / 929998952132019818504773430836265897467346423247461380) [(8, 1), (9, 1), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 472 for generator 4. -/
theorem ep_Q2_024_partial_04_0472_valid :
    mulPoly ep_Q2_024_coefficient_04_0472
        ep_Q2_024_generator_04_0400_0499 =
      ep_Q2_024_partial_04_0472 := by
  native_decide

/-- Coefficient term 473 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0473 : Poly :=
[
  term ((1077171098078953 : Rat) / 1162780221153193) [(8, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 473 for generator 4. -/
def ep_Q2_024_partial_04_0473 : Poly :=
[
  term ((1077171098078953 : Rat) / 1162780221153193) [(2, 2), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((1077171098078953 : Rat) / 1162780221153193) [(3, 2), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1077171098078953 : Rat) / 1162780221153193) [(8, 1), (9, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((-1077171098078953 : Rat) / 1162780221153193) [(8, 1), (9, 1), (11, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 473 for generator 4. -/
theorem ep_Q2_024_partial_04_0473_valid :
    mulPoly ep_Q2_024_coefficient_04_0473
        ep_Q2_024_generator_04_0400_0499 =
      ep_Q2_024_partial_04_0473 := by
  native_decide

/-- Coefficient term 474 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0474 : Poly :=
[
  term ((-1524202640719892156703221734547370372184 : Rat) / 359912837220743188970008058408861780397) [(8, 1), (9, 1), (13, 1)]
]

/-- Partial product 474 for generator 4. -/
def ep_Q2_024_partial_04_0474 : Poly :=
[
  term ((-1524202640719892156703221734547370372184 : Rat) / 359912837220743188970008058408861780397) [(2, 2), (8, 1), (9, 1), (13, 1)],
  term ((-1524202640719892156703221734547370372184 : Rat) / 359912837220743188970008058408861780397) [(3, 2), (8, 1), (9, 1), (13, 1)],
  term ((1524202640719892156703221734547370372184 : Rat) / 359912837220743188970008058408861780397) [(8, 1), (9, 1), (10, 2), (13, 1)],
  term ((1524202640719892156703221734547370372184 : Rat) / 359912837220743188970008058408861780397) [(8, 1), (9, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 474 for generator 4. -/
theorem ep_Q2_024_partial_04_0474_valid :
    mulPoly ep_Q2_024_coefficient_04_0474
        ep_Q2_024_generator_04_0400_0499 =
      ep_Q2_024_partial_04_0474 := by
  native_decide

/-- Coefficient term 475 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0475 : Poly :=
[
  term ((-42007933134393570098098441505839879027279619930823223123 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(8, 1), (9, 1), (15, 1)]
]

/-- Partial product 475 for generator 4. -/
def ep_Q2_024_partial_04_0475 : Poly :=
[
  term ((-42007933134393570098098441505839879027279619930823223123 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(2, 2), (8, 1), (9, 1), (15, 1)],
  term ((-42007933134393570098098441505839879027279619930823223123 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(3, 2), (8, 1), (9, 1), (15, 1)],
  term ((42007933134393570098098441505839879027279619930823223123 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(8, 1), (9, 1), (10, 2), (15, 1)],
  term ((42007933134393570098098441505839879027279619930823223123 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(8, 1), (9, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 475 for generator 4. -/
theorem ep_Q2_024_partial_04_0475_valid :
    mulPoly ep_Q2_024_coefficient_04_0475
        ep_Q2_024_generator_04_0400_0499 =
      ep_Q2_024_partial_04_0475 := by
  native_decide

/-- Coefficient term 476 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0476 : Poly :=
[
  term ((46392130127971129 : Rat) / 6976681326919158) [(8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 476 for generator 4. -/
def ep_Q2_024_partial_04_0476 : Poly :=
[
  term ((46392130127971129 : Rat) / 6976681326919158) [(2, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((46392130127971129 : Rat) / 6976681326919158) [(3, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-46392130127971129 : Rat) / 6976681326919158) [(8, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-46392130127971129 : Rat) / 6976681326919158) [(8, 1), (9, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 476 for generator 4. -/
theorem ep_Q2_024_partial_04_0476_valid :
    mulPoly ep_Q2_024_coefficient_04_0476
        ep_Q2_024_generator_04_0400_0499 =
      ep_Q2_024_partial_04_0476 := by
  native_decide

/-- Coefficient term 477 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0477 : Poly :=
[
  term ((1603924857658599305697727240107443115236 : Rat) / 1799564186103715944850040292044308901985) [(8, 1), (9, 2)]
]

/-- Partial product 477 for generator 4. -/
def ep_Q2_024_partial_04_0477 : Poly :=
[
  term ((1603924857658599305697727240107443115236 : Rat) / 1799564186103715944850040292044308901985) [(2, 2), (8, 1), (9, 2)],
  term ((1603924857658599305697727240107443115236 : Rat) / 1799564186103715944850040292044308901985) [(3, 2), (8, 1), (9, 2)],
  term ((-1603924857658599305697727240107443115236 : Rat) / 1799564186103715944850040292044308901985) [(8, 1), (9, 2), (10, 2)],
  term ((-1603924857658599305697727240107443115236 : Rat) / 1799564186103715944850040292044308901985) [(8, 1), (9, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 477 for generator 4. -/
theorem ep_Q2_024_partial_04_0477_valid :
    mulPoly ep_Q2_024_coefficient_04_0477
        ep_Q2_024_generator_04_0400_0499 =
      ep_Q2_024_partial_04_0477 := by
  native_decide

/-- Coefficient term 478 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0478 : Poly :=
[
  term ((-25298165874506516766865488992203696292 : Rat) / 119970945740247729656669352802953926799) [(8, 1), (11, 1), (12, 1), (13, 1)]
]

/-- Partial product 478 for generator 4. -/
def ep_Q2_024_partial_04_0478 : Poly :=
[
  term ((-25298165874506516766865488992203696292 : Rat) / 119970945740247729656669352802953926799) [(2, 2), (8, 1), (11, 1), (12, 1), (13, 1)],
  term ((-25298165874506516766865488992203696292 : Rat) / 119970945740247729656669352802953926799) [(3, 2), (8, 1), (11, 1), (12, 1), (13, 1)],
  term ((25298165874506516766865488992203696292 : Rat) / 119970945740247729656669352802953926799) [(8, 1), (10, 2), (11, 1), (12, 1), (13, 1)],
  term ((25298165874506516766865488992203696292 : Rat) / 119970945740247729656669352802953926799) [(8, 1), (11, 3), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 478 for generator 4. -/
theorem ep_Q2_024_partial_04_0478_valid :
    mulPoly ep_Q2_024_coefficient_04_0478
        ep_Q2_024_generator_04_0400_0499 =
      ep_Q2_024_partial_04_0478 := by
  native_decide

/-- Coefficient term 479 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0479 : Poly :=
[
  term ((4678910223116561885498892093094954879251581098910006897 : Rat) / 929998952132019818504773430836265897467346423247461380) [(8, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 479 for generator 4. -/
def ep_Q2_024_partial_04_0479 : Poly :=
[
  term ((4678910223116561885498892093094954879251581098910006897 : Rat) / 929998952132019818504773430836265897467346423247461380) [(2, 2), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((4678910223116561885498892093094954879251581098910006897 : Rat) / 929998952132019818504773430836265897467346423247461380) [(3, 2), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((-4678910223116561885498892093094954879251581098910006897 : Rat) / 929998952132019818504773430836265897467346423247461380) [(8, 1), (10, 2), (11, 1), (12, 1), (15, 1)],
  term ((-4678910223116561885498892093094954879251581098910006897 : Rat) / 929998952132019818504773430836265897467346423247461380) [(8, 1), (11, 3), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 479 for generator 4. -/
theorem ep_Q2_024_partial_04_0479_valid :
    mulPoly ep_Q2_024_coefficient_04_0479
        ep_Q2_024_generator_04_0400_0499 =
      ep_Q2_024_partial_04_0479 := by
  native_decide

/-- Coefficient term 480 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0480 : Poly :=
[
  term ((-1146295204983097 : Rat) / 1162780221153193) [(8, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 480 for generator 4. -/
def ep_Q2_024_partial_04_0480 : Poly :=
[
  term ((-1146295204983097 : Rat) / 1162780221153193) [(2, 2), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1146295204983097 : Rat) / 1162780221153193) [(3, 2), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((1146295204983097 : Rat) / 1162780221153193) [(8, 1), (10, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((1146295204983097 : Rat) / 1162780221153193) [(8, 1), (11, 3), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 480 for generator 4. -/
theorem ep_Q2_024_partial_04_0480_valid :
    mulPoly ep_Q2_024_coefficient_04_0480
        ep_Q2_024_generator_04_0400_0499 =
      ep_Q2_024_partial_04_0480 := by
  native_decide

/-- Coefficient term 481 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0481 : Poly :=
[
  term ((84493850184000825786514095782442813484 : Rat) / 119970945740247729656669352802953926799) [(8, 1), (11, 1), (13, 1)]
]

/-- Partial product 481 for generator 4. -/
def ep_Q2_024_partial_04_0481 : Poly :=
[
  term ((84493850184000825786514095782442813484 : Rat) / 119970945740247729656669352802953926799) [(2, 2), (8, 1), (11, 1), (13, 1)],
  term ((84493850184000825786514095782442813484 : Rat) / 119970945740247729656669352802953926799) [(3, 2), (8, 1), (11, 1), (13, 1)],
  term ((-84493850184000825786514095782442813484 : Rat) / 119970945740247729656669352802953926799) [(8, 1), (10, 2), (11, 1), (13, 1)],
  term ((-84493850184000825786514095782442813484 : Rat) / 119970945740247729656669352802953926799) [(8, 1), (11, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 481 for generator 4. -/
theorem ep_Q2_024_partial_04_0481_valid :
    mulPoly ep_Q2_024_coefficient_04_0481
        ep_Q2_024_generator_04_0400_0499 =
      ep_Q2_024_partial_04_0481 := by
  native_decide

/-- Coefficient term 482 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0482 : Poly :=
[
  term ((177146052459990833086843034621145881016452606292749398931 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(8, 1), (11, 1), (15, 1)]
]

/-- Partial product 482 for generator 4. -/
def ep_Q2_024_partial_04_0482 : Poly :=
[
  term ((177146052459990833086843034621145881016452606292749398931 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(2, 2), (8, 1), (11, 1), (15, 1)],
  term ((177146052459990833086843034621145881016452606292749398931 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(3, 2), (8, 1), (11, 1), (15, 1)],
  term ((-177146052459990833086843034621145881016452606292749398931 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(8, 1), (10, 2), (11, 1), (15, 1)],
  term ((-177146052459990833086843034621145881016452606292749398931 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(8, 1), (11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 482 for generator 4. -/
theorem ep_Q2_024_partial_04_0482_valid :
    mulPoly ep_Q2_024_coefficient_04_0482
        ep_Q2_024_generator_04_0400_0499 =
      ep_Q2_024_partial_04_0482 := by
  native_decide

/-- Coefficient term 483 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0483 : Poly :=
[
  term ((-1082535559364413 : Rat) / 2325560442306386) [(8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 483 for generator 4. -/
def ep_Q2_024_partial_04_0483 : Poly :=
[
  term ((-1082535559364413 : Rat) / 2325560442306386) [(2, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1082535559364413 : Rat) / 2325560442306386) [(3, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((1082535559364413 : Rat) / 2325560442306386) [(8, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((1082535559364413 : Rat) / 2325560442306386) [(8, 1), (11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 483 for generator 4. -/
theorem ep_Q2_024_partial_04_0483_valid :
    mulPoly ep_Q2_024_coefficient_04_0483
        ep_Q2_024_generator_04_0400_0499 =
      ep_Q2_024_partial_04_0483 := by
  native_decide

/-- Coefficient term 484 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0484 : Poly :=
[
  term ((-44975123602223741861033454546231653929 : Rat) / 199951576233746216094448921338256544665) [(8, 1), (12, 1)]
]

/-- Partial product 484 for generator 4. -/
def ep_Q2_024_partial_04_0484 : Poly :=
[
  term ((-44975123602223741861033454546231653929 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (8, 1), (12, 1)],
  term ((-44975123602223741861033454546231653929 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (8, 1), (12, 1)],
  term ((44975123602223741861033454546231653929 : Rat) / 199951576233746216094448921338256544665) [(8, 1), (10, 2), (12, 1)],
  term ((44975123602223741861033454546231653929 : Rat) / 199951576233746216094448921338256544665) [(8, 1), (11, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 484 for generator 4. -/
theorem ep_Q2_024_partial_04_0484_valid :
    mulPoly ep_Q2_024_coefficient_04_0484
        ep_Q2_024_generator_04_0400_0499 =
      ep_Q2_024_partial_04_0484 := by
  native_decide

/-- Coefficient term 485 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0485 : Poly :=
[
  term ((1883588680345343461100563594004714957639800719944512754 : Rat) / 232499738033004954626193357709066474366836605811865345) [(8, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 485 for generator 4. -/
def ep_Q2_024_partial_04_0485 : Poly :=
[
  term ((1883588680345343461100563594004714957639800719944512754 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 2), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((1883588680345343461100563594004714957639800719944512754 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 2), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((-1883588680345343461100563594004714957639800719944512754 : Rat) / 232499738033004954626193357709066474366836605811865345) [(8, 1), (10, 2), (12, 1), (13, 1), (15, 1)],
  term ((-1883588680345343461100563594004714957639800719944512754 : Rat) / 232499738033004954626193357709066474366836605811865345) [(8, 1), (11, 2), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 485 for generator 4. -/
theorem ep_Q2_024_partial_04_0485_valid :
    mulPoly ep_Q2_024_coefficient_04_0485
        ep_Q2_024_generator_04_0400_0499 =
      ep_Q2_024_partial_04_0485 := by
  native_decide

/-- Coefficient term 486 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0486 : Poly :=
[
  term ((-1737846722105288 : Rat) / 1162780221153193) [(8, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 486 for generator 4. -/
def ep_Q2_024_partial_04_0486 : Poly :=
[
  term ((-1737846722105288 : Rat) / 1162780221153193) [(2, 2), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1737846722105288 : Rat) / 1162780221153193) [(3, 2), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1737846722105288 : Rat) / 1162780221153193) [(8, 1), (10, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1737846722105288 : Rat) / 1162780221153193) [(8, 1), (11, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 486 for generator 4. -/
theorem ep_Q2_024_partial_04_0486_valid :
    mulPoly ep_Q2_024_coefficient_04_0486
        ep_Q2_024_generator_04_0400_0499 =
      ep_Q2_024_partial_04_0486 := by
  native_decide

/-- Coefficient term 487 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0487 : Poly :=
[
  term ((-199176069072538286358361042576915862048 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (12, 1), (13, 2)]
]

/-- Partial product 487 for generator 4. -/
def ep_Q2_024_partial_04_0487 : Poly :=
[
  term ((-199176069072538286358361042576915862048 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (8, 1), (12, 1), (13, 2)],
  term ((-199176069072538286358361042576915862048 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (8, 1), (12, 1), (13, 2)],
  term ((199176069072538286358361042576915862048 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (10, 2), (12, 1), (13, 2)],
  term ((199176069072538286358361042576915862048 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (11, 2), (12, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 487 for generator 4. -/
theorem ep_Q2_024_partial_04_0487_valid :
    mulPoly ep_Q2_024_coefficient_04_0487
        ep_Q2_024_generator_04_0400_0499 =
      ep_Q2_024_partial_04_0487 := by
  native_decide

/-- Coefficient term 488 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0488 : Poly :=
[
  term ((-1215479687725336028967882992894682370424495358081113244 : Rat) / 232499738033004954626193357709066474366836605811865345) [(8, 1), (12, 1), (15, 2)]
]

/-- Partial product 488 for generator 4. -/
def ep_Q2_024_partial_04_0488 : Poly :=
[
  term ((-1215479687725336028967882992894682370424495358081113244 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 2), (8, 1), (12, 1), (15, 2)],
  term ((-1215479687725336028967882992894682370424495358081113244 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 2), (8, 1), (12, 1), (15, 2)],
  term ((1215479687725336028967882992894682370424495358081113244 : Rat) / 232499738033004954626193357709066474366836605811865345) [(8, 1), (10, 2), (12, 1), (15, 2)],
  term ((1215479687725336028967882992894682370424495358081113244 : Rat) / 232499738033004954626193357709066474366836605811865345) [(8, 1), (11, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 488 for generator 4. -/
theorem ep_Q2_024_partial_04_0488_valid :
    mulPoly ep_Q2_024_coefficient_04_0488
        ep_Q2_024_generator_04_0400_0499 =
      ep_Q2_024_partial_04_0488 := by
  native_decide

/-- Coefficient term 489 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0489 : Poly :=
[
  term ((1650756408727440 : Rat) / 1162780221153193) [(8, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 489 for generator 4. -/
def ep_Q2_024_partial_04_0489 : Poly :=
[
  term ((1650756408727440 : Rat) / 1162780221153193) [(2, 2), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((1650756408727440 : Rat) / 1162780221153193) [(3, 2), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-1650756408727440 : Rat) / 1162780221153193) [(8, 1), (10, 2), (12, 1), (15, 2), (16, 1)],
  term ((-1650756408727440 : Rat) / 1162780221153193) [(8, 1), (11, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 489 for generator 4. -/
theorem ep_Q2_024_partial_04_0489_valid :
    mulPoly ep_Q2_024_coefficient_04_0489
        ep_Q2_024_generator_04_0400_0499 =
      ep_Q2_024_partial_04_0489 := by
  native_decide

/-- Coefficient term 490 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0490 : Poly :=
[
  term ((-78137961675158770308670494504548355711276460585054496433 : Rat) / 929998952132019818504773430836265897467346423247461380) [(8, 1), (13, 1), (15, 1)]
]

/-- Partial product 490 for generator 4. -/
def ep_Q2_024_partial_04_0490 : Poly :=
[
  term ((-78137961675158770308670494504548355711276460585054496433 : Rat) / 929998952132019818504773430836265897467346423247461380) [(2, 2), (8, 1), (13, 1), (15, 1)],
  term ((-78137961675158770308670494504548355711276460585054496433 : Rat) / 929998952132019818504773430836265897467346423247461380) [(3, 2), (8, 1), (13, 1), (15, 1)],
  term ((78137961675158770308670494504548355711276460585054496433 : Rat) / 929998952132019818504773430836265897467346423247461380) [(8, 1), (10, 2), (13, 1), (15, 1)],
  term ((78137961675158770308670494504548355711276460585054496433 : Rat) / 929998952132019818504773430836265897467346423247461380) [(8, 1), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 490 for generator 4. -/
theorem ep_Q2_024_partial_04_0490_valid :
    mulPoly ep_Q2_024_coefficient_04_0490
        ep_Q2_024_generator_04_0400_0499 =
      ep_Q2_024_partial_04_0490 := by
  native_decide

/-- Coefficient term 491 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0491 : Poly :=
[
  term ((4835838994492525 : Rat) / 1162780221153193) [(8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 491 for generator 4. -/
def ep_Q2_024_partial_04_0491 : Poly :=
[
  term ((4835838994492525 : Rat) / 1162780221153193) [(2, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((4835838994492525 : Rat) / 1162780221153193) [(3, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4835838994492525 : Rat) / 1162780221153193) [(8, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-4835838994492525 : Rat) / 1162780221153193) [(8, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 491 for generator 4. -/
theorem ep_Q2_024_partial_04_0491_valid :
    mulPoly ep_Q2_024_coefficient_04_0491
        ep_Q2_024_generator_04_0400_0499 =
      ep_Q2_024_partial_04_0491 := by
  native_decide

/-- Coefficient term 492 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0492 : Poly :=
[
  term ((-2765663698878662287968528107259212708074 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (13, 2)]
]

/-- Partial product 492 for generator 4. -/
def ep_Q2_024_partial_04_0492 : Poly :=
[
  term ((-2765663698878662287968528107259212708074 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (8, 1), (13, 2)],
  term ((-2765663698878662287968528107259212708074 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (8, 1), (13, 2)],
  term ((2765663698878662287968528107259212708074 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (10, 2), (13, 2)],
  term ((2765663698878662287968528107259212708074 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (11, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 492 for generator 4. -/
theorem ep_Q2_024_partial_04_0492_valid :
    mulPoly ep_Q2_024_coefficient_04_0492
        ep_Q2_024_generator_04_0400_0499 =
      ep_Q2_024_partial_04_0492 := by
  native_decide

/-- Coefficient term 493 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0493 : Poly :=
[
  term ((-1301354773091271153576238800289316593301 : Rat) / 1199709457402477296566693528029539267990) [(8, 1), (14, 1)]
]

/-- Partial product 493 for generator 4. -/
def ep_Q2_024_partial_04_0493 : Poly :=
[
  term ((-1301354773091271153576238800289316593301 : Rat) / 1199709457402477296566693528029539267990) [(2, 2), (8, 1), (14, 1)],
  term ((-1301354773091271153576238800289316593301 : Rat) / 1199709457402477296566693528029539267990) [(3, 2), (8, 1), (14, 1)],
  term ((1301354773091271153576238800289316593301 : Rat) / 1199709457402477296566693528029539267990) [(8, 1), (10, 2), (14, 1)],
  term ((1301354773091271153576238800289316593301 : Rat) / 1199709457402477296566693528029539267990) [(8, 1), (11, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 493 for generator 4. -/
theorem ep_Q2_024_partial_04_0493_valid :
    mulPoly ep_Q2_024_coefficient_04_0493
        ep_Q2_024_generator_04_0400_0499 =
      ep_Q2_024_partial_04_0493 := by
  native_decide

/-- Coefficient term 494 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0494 : Poly :=
[
  term ((7755439550448526920834443980136689352949563266798521611 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(8, 1), (15, 2)]
]

/-- Partial product 494 for generator 4. -/
def ep_Q2_024_partial_04_0494 : Poly :=
[
  term ((7755439550448526920834443980136689352949563266798521611 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(2, 2), (8, 1), (15, 2)],
  term ((7755439550448526920834443980136689352949563266798521611 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(3, 2), (8, 1), (15, 2)],
  term ((-7755439550448526920834443980136689352949563266798521611 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(8, 1), (10, 2), (15, 2)],
  term ((-7755439550448526920834443980136689352949563266798521611 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(8, 1), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 494 for generator 4. -/
theorem ep_Q2_024_partial_04_0494_valid :
    mulPoly ep_Q2_024_coefficient_04_0494
        ep_Q2_024_generator_04_0400_0499 =
      ep_Q2_024_partial_04_0494 := by
  native_decide

/-- Coefficient term 495 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0495 : Poly :=
[
  term ((4821831915259055 : Rat) / 1162780221153193) [(8, 1), (15, 2), (16, 1)]
]

/-- Partial product 495 for generator 4. -/
def ep_Q2_024_partial_04_0495 : Poly :=
[
  term ((4821831915259055 : Rat) / 1162780221153193) [(2, 2), (8, 1), (15, 2), (16, 1)],
  term ((4821831915259055 : Rat) / 1162780221153193) [(3, 2), (8, 1), (15, 2), (16, 1)],
  term ((-4821831915259055 : Rat) / 1162780221153193) [(8, 1), (10, 2), (15, 2), (16, 1)],
  term ((-4821831915259055 : Rat) / 1162780221153193) [(8, 1), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 495 for generator 4. -/
theorem ep_Q2_024_partial_04_0495_valid :
    mulPoly ep_Q2_024_coefficient_04_0495
        ep_Q2_024_generator_04_0400_0499 =
      ep_Q2_024_partial_04_0495 := by
  native_decide

/-- Coefficient term 496 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0496 : Poly :=
[
  term ((-413173782075119663093768476218434237432 : Rat) / 599854728701238648283346764014769633995) [(8, 2)]
]

/-- Partial product 496 for generator 4. -/
def ep_Q2_024_partial_04_0496 : Poly :=
[
  term ((-413173782075119663093768476218434237432 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (8, 2)],
  term ((-413173782075119663093768476218434237432 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (8, 2)],
  term ((413173782075119663093768476218434237432 : Rat) / 599854728701238648283346764014769633995) [(8, 2), (10, 2)],
  term ((413173782075119663093768476218434237432 : Rat) / 599854728701238648283346764014769633995) [(8, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 496 for generator 4. -/
theorem ep_Q2_024_partial_04_0496_valid :
    mulPoly ep_Q2_024_coefficient_04_0496
        ep_Q2_024_generator_04_0400_0499 =
      ep_Q2_024_partial_04_0496 := by
  native_decide

/-- Coefficient term 497 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0497 : Poly :=
[
  term ((-2076391380081452377857175484385810270668 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (11, 1)]
]

/-- Partial product 497 for generator 4. -/
def ep_Q2_024_partial_04_0497 : Poly :=
[
  term ((-2076391380081452377857175484385810270668 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (9, 1), (11, 1)],
  term ((-2076391380081452377857175484385810270668 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (9, 1), (11, 1)],
  term ((2076391380081452377857175484385810270668 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (10, 2), (11, 1)],
  term ((2076391380081452377857175484385810270668 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (11, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 497 for generator 4. -/
theorem ep_Q2_024_partial_04_0497_valid :
    mulPoly ep_Q2_024_coefficient_04_0497
        ep_Q2_024_generator_04_0400_0499 =
      ep_Q2_024_partial_04_0497 := by
  native_decide

/-- Coefficient term 498 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0498 : Poly :=
[
  term ((-136801893773485553175290412901622223086 : Rat) / 119970945740247729656669352802953926799) [(9, 1), (11, 1), (12, 1)]
]

/-- Partial product 498 for generator 4. -/
def ep_Q2_024_partial_04_0498 : Poly :=
[
  term ((-136801893773485553175290412901622223086 : Rat) / 119970945740247729656669352802953926799) [(2, 2), (9, 1), (11, 1), (12, 1)],
  term ((-136801893773485553175290412901622223086 : Rat) / 119970945740247729656669352802953926799) [(3, 2), (9, 1), (11, 1), (12, 1)],
  term ((136801893773485553175290412901622223086 : Rat) / 119970945740247729656669352802953926799) [(9, 1), (10, 2), (11, 1), (12, 1)],
  term ((136801893773485553175290412901622223086 : Rat) / 119970945740247729656669352802953926799) [(9, 1), (11, 3), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 498 for generator 4. -/
theorem ep_Q2_024_partial_04_0498_valid :
    mulPoly ep_Q2_024_coefficient_04_0498
        ep_Q2_024_generator_04_0400_0499 =
      ep_Q2_024_partial_04_0498 := by
  native_decide

/-- Coefficient term 499 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0499 : Poly :=
[
  term ((-3383012150111964721625057355309145856761125781838205059 : Rat) / 232499738033004954626193357709066474366836605811865345) [(9, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 499 for generator 4. -/
def ep_Q2_024_partial_04_0499 : Poly :=
[
  term ((-3383012150111964721625057355309145856761125781838205059 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-3383012150111964721625057355309145856761125781838205059 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((3383012150111964721625057355309145856761125781838205059 : Rat) / 232499738033004954626193357709066474366836605811865345) [(9, 1), (10, 2), (11, 1), (13, 1), (15, 1)],
  term ((3383012150111964721625057355309145856761125781838205059 : Rat) / 232499738033004954626193357709066474366836605811865345) [(9, 1), (11, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 499 for generator 4. -/
theorem ep_Q2_024_partial_04_0499_valid :
    mulPoly ep_Q2_024_coefficient_04_0499
        ep_Q2_024_generator_04_0400_0499 =
      ep_Q2_024_partial_04_0499 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_024_partials_04_0400_0499 : List Poly :=
[
  ep_Q2_024_partial_04_0400,
  ep_Q2_024_partial_04_0401,
  ep_Q2_024_partial_04_0402,
  ep_Q2_024_partial_04_0403,
  ep_Q2_024_partial_04_0404,
  ep_Q2_024_partial_04_0405,
  ep_Q2_024_partial_04_0406,
  ep_Q2_024_partial_04_0407,
  ep_Q2_024_partial_04_0408,
  ep_Q2_024_partial_04_0409,
  ep_Q2_024_partial_04_0410,
  ep_Q2_024_partial_04_0411,
  ep_Q2_024_partial_04_0412,
  ep_Q2_024_partial_04_0413,
  ep_Q2_024_partial_04_0414,
  ep_Q2_024_partial_04_0415,
  ep_Q2_024_partial_04_0416,
  ep_Q2_024_partial_04_0417,
  ep_Q2_024_partial_04_0418,
  ep_Q2_024_partial_04_0419,
  ep_Q2_024_partial_04_0420,
  ep_Q2_024_partial_04_0421,
  ep_Q2_024_partial_04_0422,
  ep_Q2_024_partial_04_0423,
  ep_Q2_024_partial_04_0424,
  ep_Q2_024_partial_04_0425,
  ep_Q2_024_partial_04_0426,
  ep_Q2_024_partial_04_0427,
  ep_Q2_024_partial_04_0428,
  ep_Q2_024_partial_04_0429,
  ep_Q2_024_partial_04_0430,
  ep_Q2_024_partial_04_0431,
  ep_Q2_024_partial_04_0432,
  ep_Q2_024_partial_04_0433,
  ep_Q2_024_partial_04_0434,
  ep_Q2_024_partial_04_0435,
  ep_Q2_024_partial_04_0436,
  ep_Q2_024_partial_04_0437,
  ep_Q2_024_partial_04_0438,
  ep_Q2_024_partial_04_0439,
  ep_Q2_024_partial_04_0440,
  ep_Q2_024_partial_04_0441,
  ep_Q2_024_partial_04_0442,
  ep_Q2_024_partial_04_0443,
  ep_Q2_024_partial_04_0444,
  ep_Q2_024_partial_04_0445,
  ep_Q2_024_partial_04_0446,
  ep_Q2_024_partial_04_0447,
  ep_Q2_024_partial_04_0448,
  ep_Q2_024_partial_04_0449,
  ep_Q2_024_partial_04_0450,
  ep_Q2_024_partial_04_0451,
  ep_Q2_024_partial_04_0452,
  ep_Q2_024_partial_04_0453,
  ep_Q2_024_partial_04_0454,
  ep_Q2_024_partial_04_0455,
  ep_Q2_024_partial_04_0456,
  ep_Q2_024_partial_04_0457,
  ep_Q2_024_partial_04_0458,
  ep_Q2_024_partial_04_0459,
  ep_Q2_024_partial_04_0460,
  ep_Q2_024_partial_04_0461,
  ep_Q2_024_partial_04_0462,
  ep_Q2_024_partial_04_0463,
  ep_Q2_024_partial_04_0464,
  ep_Q2_024_partial_04_0465,
  ep_Q2_024_partial_04_0466,
  ep_Q2_024_partial_04_0467,
  ep_Q2_024_partial_04_0468,
  ep_Q2_024_partial_04_0469,
  ep_Q2_024_partial_04_0470,
  ep_Q2_024_partial_04_0471,
  ep_Q2_024_partial_04_0472,
  ep_Q2_024_partial_04_0473,
  ep_Q2_024_partial_04_0474,
  ep_Q2_024_partial_04_0475,
  ep_Q2_024_partial_04_0476,
  ep_Q2_024_partial_04_0477,
  ep_Q2_024_partial_04_0478,
  ep_Q2_024_partial_04_0479,
  ep_Q2_024_partial_04_0480,
  ep_Q2_024_partial_04_0481,
  ep_Q2_024_partial_04_0482,
  ep_Q2_024_partial_04_0483,
  ep_Q2_024_partial_04_0484,
  ep_Q2_024_partial_04_0485,
  ep_Q2_024_partial_04_0486,
  ep_Q2_024_partial_04_0487,
  ep_Q2_024_partial_04_0488,
  ep_Q2_024_partial_04_0489,
  ep_Q2_024_partial_04_0490,
  ep_Q2_024_partial_04_0491,
  ep_Q2_024_partial_04_0492,
  ep_Q2_024_partial_04_0493,
  ep_Q2_024_partial_04_0494,
  ep_Q2_024_partial_04_0495,
  ep_Q2_024_partial_04_0496,
  ep_Q2_024_partial_04_0497,
  ep_Q2_024_partial_04_0498,
  ep_Q2_024_partial_04_0499
]

/-- Sum of partial products in this block. -/
def ep_Q2_024_block_04_0400_0499 : Poly :=
[
  term ((-699598964377024284665984479369490528956 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (5, 1), (12, 1), (13, 2), (15, 1)],
  term ((-5998517674585019096440487702853772295167493695424703559 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 2), (5, 1), (12, 1), (15, 1)],
  term ((769195100829796 : Rat) / 1162780221153193) [(2, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-57065163418514028206963760297560614190626285699065528079 : Rat) / 929998952132019818504773430836265897467346423247461380) [(2, 2), (5, 1), (12, 1), (15, 3)],
  term ((13204414907240807 : Rat) / 1162780221153193) [(2, 2), (5, 1), (12, 1), (15, 3), (16, 1)],
  term ((-17856730383433244702599366065510184172 : Rat) / 119970945740247729656669352802953926799) [(2, 2), (5, 1), (13, 1)],
  term ((21617868347627211728051505817229271432 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (5, 1), (13, 1), (14, 1)],
  term ((1681207212074162784866544631513075229980270038215301238 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 2), (5, 1), (13, 1), (14, 1), (15, 2)],
  term ((833967741040952 : Rat) / 1162780221153193) [(2, 2), (5, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2578326853107933456558538464757287301318301626202703904507 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(2, 2), (5, 1), (13, 1), (15, 2)],
  term ((-50068166157171823 : Rat) / 6976681326919158) [(2, 2), (5, 1), (13, 1), (15, 2), (16, 1)],
  term ((4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (5, 1), (13, 2), (14, 1), (15, 1)],
  term ((147847046676439604201330883678806456320 : Rat) / 359912837220743188970008058408861780397) [(2, 2), (5, 1), (13, 2), (15, 1)],
  term ((-15947492711747053841607119528059672869962592746542302313 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(2, 2), (5, 1), (14, 1), (15, 1)],
  term ((1759640940265062 : Rat) / 1162780221153193) [(2, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(2, 2), (5, 1), (14, 1), (15, 3)],
  term ((-833967741040952 : Rat) / 1162780221153193) [(2, 2), (5, 1), (14, 1), (15, 3), (16, 1)],
  term ((29627779009332143284283226421001764576646541097643147056 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(2, 2), (5, 1), (15, 1)],
  term ((-1827859283520988 : Rat) / 1162780221153193) [(2, 2), (5, 1), (15, 1), (16, 1)],
  term ((596292272370210102731177090662239802901212841340772628921 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(2, 2), (5, 1), (15, 3)],
  term ((11177629529470399 : Rat) / 6976681326919158) [(2, 2), (5, 1), (15, 3), (16, 1)],
  term ((-319014959023338608753545314714028482032 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (5, 2), (9, 1), (13, 1)],
  term ((-3028961299936339594435849179442279044072961783512194354 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 2), (5, 2), (9, 1), (15, 1)],
  term ((2568602061245288 : Rat) / 1162780221153193) [(2, 2), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((-57424356410650916815904656776024181448 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (5, 2), (9, 2)],
  term ((197694510238266821957195557551254432816 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (5, 2), (13, 1), (15, 1)],
  term ((5230076720176820119682108016672776177553508626941610138 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 2), (5, 2), (15, 2)],
  term ((-2361660524222056 : Rat) / 1162780221153193) [(2, 2), (5, 2), (15, 2), (16, 1)],
  term ((-206558578118461759089806144263373422486 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (7, 1), (8, 1), (9, 1)],
  term ((-12979170683146789939085894591745652172 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (7, 1), (8, 1), (12, 1), (13, 1)],
  term ((519790077507635364246714238454931580267528154182411463 : Rat) / 929998952132019818504773430836265897467346423247461380) [(2, 2), (7, 1), (8, 1), (12, 1), (15, 1)],
  term ((-212739288644735 : Rat) / 1162780221153193) [(2, 2), (7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((84574267304034159307383392985859926898 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (7, 1), (8, 1), (13, 1)],
  term ((12391057674363913550311122299423538521421896682288632882 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 2), (7, 1), (8, 1), (15, 1)],
  term ((-3501168887590402 : Rat) / 1162780221153193) [(2, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((4238978574830944812688785943010145075721 : Rat) / 1799564186103715944850040292044308901985) [(2, 2), (7, 1), (9, 1)],
  term ((-886145460922430421280018592403483917716 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (7, 1), (9, 1), (12, 1)],
  term ((798582412409743722368367385112215430768 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((2234691451781231325421589515033267771336 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (7, 1), (9, 1), (14, 1)],
  term ((-4344074584876535282375746373930099123380749438247228923 : Rat) / 464999476066009909252386715418132948733673211623730690) [(2, 2), (7, 1), (9, 1), (15, 2)],
  term ((3065637341133238 : Rat) / 1162780221153193) [(2, 2), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((220893862652644812159568003760951473696 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (7, 1), (9, 2), (15, 1)],
  term ((-518543174883551540146515086812976898784 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (7, 1), (11, 1)],
  term ((-89547604594084105807568793286655194652 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (7, 1), (12, 1), (13, 1)],
  term ((48438423129215560676143065672187698824 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((33273931020260669930661190011024360672 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (7, 1), (12, 1), (13, 1), (15, 2)],
  term ((-838411973319437252533717745383941150125364404896314437 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(2, 2), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((-1274781574709922 : Rat) / 1162780221153193) [(2, 2), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((29037040217161627543541343141623393529291908260485924539 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 2), (7, 1), (12, 1), (15, 1)],
  term ((757043177666604 : Rat) / 1162780221153193) [(2, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-198745616475118943998092102782769635563595552220534688 : Rat) / 46499947606600990925238671541813294873367321162373069) [(2, 2), (7, 1), (12, 1), (15, 3)],
  term ((1581632301823296 : Rat) / 1162780221153193) [(2, 2), (7, 1), (12, 1), (15, 3), (16, 1)],
  term ((361897348718776485311185231728879779368 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (7, 1), (12, 2), (13, 1)],
  term ((-6285331816600909397659698691956620588036985675621846367 : Rat) / 464999476066009909252386715418132948733673211623730690) [(2, 2), (7, 1), (12, 2), (15, 1)],
  term ((1324091967043342 : Rat) / 1162780221153193) [(2, 2), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((-599984196030905917187784991017220141898 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (7, 1), (13, 1)],
  term ((-903084356647818576853574366344410520372 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (7, 1), (13, 1), (14, 1)],
  term ((-19358917253490364062047066221672448008 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (7, 1), (13, 1), (14, 2)],
  term ((-94155537895141594327780228805357359980550026461185294441 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(2, 2), (7, 1), (13, 1), (15, 2)],
  term ((355227462877051 : Rat) / 1162780221153193) [(2, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((46824955938503210518999122991775109724 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (7, 1), (13, 2), (15, 1)],
  term ((-152747837075665191647550940228390518739988190776522320643 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(2, 2), (7, 1), (14, 1), (15, 1)],
  term ((2483128441501057 : Rat) / 1162780221153193) [(2, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3773401973948365711472042274593795909232108488982391511 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 2), (7, 1), (14, 2), (15, 1)],
  term ((-938674662914812 : Rat) / 1162780221153193) [(2, 2), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-19939264653645454550844396512708814820467810798252762778 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(2, 2), (7, 1), (15, 1)],
  term ((-5527295484604502 : Rat) / 1162780221153193) [(2, 2), (7, 1), (15, 1), (16, 1)],
  term ((182587976773348285098138707057166213218449056697193285789 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(2, 2), (7, 1), (15, 3)],
  term ((-4478221057214655 : Rat) / 1162780221153193) [(2, 2), (7, 1), (15, 3), (16, 1)],
  term ((-3709776815823037082149296919241914084111 : Rat) / 3599128372207431889700080584088617803970) [(2, 2), (8, 1)],
  term ((-1225265322114654679026622704559141817402 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (8, 1), (9, 1), (11, 1)],
  term ((100649367268495437262557180149834752612 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (8, 1), (9, 1), (12, 1), (13, 1)],
  term ((-3791903801717596649589202177171618108825510710996247681 : Rat) / 929998952132019818504773430836265897467346423247461380) [(2, 2), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((1077171098078953 : Rat) / 1162780221153193) [(2, 2), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1524202640719892156703221734547370372184 : Rat) / 359912837220743188970008058408861780397) [(2, 2), (8, 1), (9, 1), (13, 1)],
  term ((-42007933134393570098098441505839879027279619930823223123 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(2, 2), (8, 1), (9, 1), (15, 1)],
  term ((46392130127971129 : Rat) / 6976681326919158) [(2, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((1603924857658599305697727240107443115236 : Rat) / 1799564186103715944850040292044308901985) [(2, 2), (8, 1), (9, 2)],
  term ((-25298165874506516766865488992203696292 : Rat) / 119970945740247729656669352802953926799) [(2, 2), (8, 1), (11, 1), (12, 1), (13, 1)],
  term ((4678910223116561885498892093094954879251581098910006897 : Rat) / 929998952132019818504773430836265897467346423247461380) [(2, 2), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((-1146295204983097 : Rat) / 1162780221153193) [(2, 2), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((84493850184000825786514095782442813484 : Rat) / 119970945740247729656669352802953926799) [(2, 2), (8, 1), (11, 1), (13, 1)],
  term ((177146052459990833086843034621145881016452606292749398931 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(2, 2), (8, 1), (11, 1), (15, 1)],
  term ((-1082535559364413 : Rat) / 2325560442306386) [(2, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-44975123602223741861033454546231653929 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (8, 1), (12, 1)],
  term ((1883588680345343461100563594004714957639800719944512754 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 2), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((-1737846722105288 : Rat) / 1162780221153193) [(2, 2), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-199176069072538286358361042576915862048 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (8, 1), (12, 1), (13, 2)],
  term ((-1215479687725336028967882992894682370424495358081113244 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 2), (8, 1), (12, 1), (15, 2)],
  term ((1650756408727440 : Rat) / 1162780221153193) [(2, 2), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-78137961675158770308670494504548355711276460585054496433 : Rat) / 929998952132019818504773430836265897467346423247461380) [(2, 2), (8, 1), (13, 1), (15, 1)],
  term ((4835838994492525 : Rat) / 1162780221153193) [(2, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2765663698878662287968528107259212708074 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (8, 1), (13, 2)],
  term ((-1301354773091271153576238800289316593301 : Rat) / 1199709457402477296566693528029539267990) [(2, 2), (8, 1), (14, 1)],
  term ((7755439550448526920834443980136689352949563266798521611 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(2, 2), (8, 1), (15, 2)],
  term ((4821831915259055 : Rat) / 1162780221153193) [(2, 2), (8, 1), (15, 2), (16, 1)],
  term ((-413173782075119663093768476218434237432 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (8, 2)],
  term ((-2076391380081452377857175484385810270668 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (9, 1), (11, 1)],
  term ((-136801893773485553175290412901622223086 : Rat) / 119970945740247729656669352802953926799) [(2, 2), (9, 1), (11, 1), (12, 1)],
  term ((-3383012150111964721625057355309145856761125781838205059 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-699598964377024284665984479369490528956 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (5, 1), (12, 1), (13, 2), (15, 1)],
  term ((-5998517674585019096440487702853772295167493695424703559 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 2), (5, 1), (12, 1), (15, 1)],
  term ((769195100829796 : Rat) / 1162780221153193) [(3, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-57065163418514028206963760297560614190626285699065528079 : Rat) / 929998952132019818504773430836265897467346423247461380) [(3, 2), (5, 1), (12, 1), (15, 3)],
  term ((13204414907240807 : Rat) / 1162780221153193) [(3, 2), (5, 1), (12, 1), (15, 3), (16, 1)],
  term ((-17856730383433244702599366065510184172 : Rat) / 119970945740247729656669352802953926799) [(3, 2), (5, 1), (13, 1)],
  term ((21617868347627211728051505817229271432 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (5, 1), (13, 1), (14, 1)],
  term ((1681207212074162784866544631513075229980270038215301238 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 2), (5, 1), (13, 1), (14, 1), (15, 2)],
  term ((833967741040952 : Rat) / 1162780221153193) [(3, 2), (5, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2578326853107933456558538464757287301318301626202703904507 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(3, 2), (5, 1), (13, 1), (15, 2)],
  term ((-50068166157171823 : Rat) / 6976681326919158) [(3, 2), (5, 1), (13, 1), (15, 2), (16, 1)],
  term ((4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (5, 1), (13, 2), (14, 1), (15, 1)],
  term ((147847046676439604201330883678806456320 : Rat) / 359912837220743188970008058408861780397) [(3, 2), (5, 1), (13, 2), (15, 1)],
  term ((-15947492711747053841607119528059672869962592746542302313 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(3, 2), (5, 1), (14, 1), (15, 1)],
  term ((1759640940265062 : Rat) / 1162780221153193) [(3, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 2), (5, 1), (14, 1), (15, 3)],
  term ((-833967741040952 : Rat) / 1162780221153193) [(3, 2), (5, 1), (14, 1), (15, 3), (16, 1)],
  term ((29627779009332143284283226421001764576646541097643147056 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(3, 2), (5, 1), (15, 1)],
  term ((-1827859283520988 : Rat) / 1162780221153193) [(3, 2), (5, 1), (15, 1), (16, 1)],
  term ((596292272370210102731177090662239802901212841340772628921 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(3, 2), (5, 1), (15, 3)],
  term ((11177629529470399 : Rat) / 6976681326919158) [(3, 2), (5, 1), (15, 3), (16, 1)],
  term ((-319014959023338608753545314714028482032 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (5, 2), (9, 1), (13, 1)],
  term ((-3028961299936339594435849179442279044072961783512194354 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 2), (5, 2), (9, 1), (15, 1)],
  term ((2568602061245288 : Rat) / 1162780221153193) [(3, 2), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((-57424356410650916815904656776024181448 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (5, 2), (9, 2)],
  term ((197694510238266821957195557551254432816 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (5, 2), (13, 1), (15, 1)],
  term ((5230076720176820119682108016672776177553508626941610138 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 2), (5, 2), (15, 2)],
  term ((-2361660524222056 : Rat) / 1162780221153193) [(3, 2), (5, 2), (15, 2), (16, 1)],
  term ((-206558578118461759089806144263373422486 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (7, 1), (8, 1), (9, 1)],
  term ((-12979170683146789939085894591745652172 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (7, 1), (8, 1), (12, 1), (13, 1)],
  term ((519790077507635364246714238454931580267528154182411463 : Rat) / 929998952132019818504773430836265897467346423247461380) [(3, 2), (7, 1), (8, 1), (12, 1), (15, 1)],
  term ((-212739288644735 : Rat) / 1162780221153193) [(3, 2), (7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((84574267304034159307383392985859926898 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (7, 1), (8, 1), (13, 1)],
  term ((12391057674363913550311122299423538521421896682288632882 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 2), (7, 1), (8, 1), (15, 1)],
  term ((-3501168887590402 : Rat) / 1162780221153193) [(3, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((4238978574830944812688785943010145075721 : Rat) / 1799564186103715944850040292044308901985) [(3, 2), (7, 1), (9, 1)],
  term ((-886145460922430421280018592403483917716 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (7, 1), (9, 1), (12, 1)],
  term ((798582412409743722368367385112215430768 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((2234691451781231325421589515033267771336 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (7, 1), (9, 1), (14, 1)],
  term ((-4344074584876535282375746373930099123380749438247228923 : Rat) / 464999476066009909252386715418132948733673211623730690) [(3, 2), (7, 1), (9, 1), (15, 2)],
  term ((3065637341133238 : Rat) / 1162780221153193) [(3, 2), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((220893862652644812159568003760951473696 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (7, 1), (9, 2), (15, 1)],
  term ((-518543174883551540146515086812976898784 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (7, 1), (11, 1)],
  term ((-89547604594084105807568793286655194652 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (7, 1), (12, 1), (13, 1)],
  term ((48438423129215560676143065672187698824 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((33273931020260669930661190011024360672 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (7, 1), (12, 1), (13, 1), (15, 2)],
  term ((-838411973319437252533717745383941150125364404896314437 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(3, 2), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((-1274781574709922 : Rat) / 1162780221153193) [(3, 2), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((29037040217161627543541343141623393529291908260485924539 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 2), (7, 1), (12, 1), (15, 1)],
  term ((757043177666604 : Rat) / 1162780221153193) [(3, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-198745616475118943998092102782769635563595552220534688 : Rat) / 46499947606600990925238671541813294873367321162373069) [(3, 2), (7, 1), (12, 1), (15, 3)],
  term ((1581632301823296 : Rat) / 1162780221153193) [(3, 2), (7, 1), (12, 1), (15, 3), (16, 1)],
  term ((361897348718776485311185231728879779368 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (7, 1), (12, 2), (13, 1)],
  term ((-6285331816600909397659698691956620588036985675621846367 : Rat) / 464999476066009909252386715418132948733673211623730690) [(3, 2), (7, 1), (12, 2), (15, 1)],
  term ((1324091967043342 : Rat) / 1162780221153193) [(3, 2), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((-599984196030905917187784991017220141898 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (7, 1), (13, 1)],
  term ((-903084356647818576853574366344410520372 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (7, 1), (13, 1), (14, 1)],
  term ((-19358917253490364062047066221672448008 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (7, 1), (13, 1), (14, 2)],
  term ((-94155537895141594327780228805357359980550026461185294441 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(3, 2), (7, 1), (13, 1), (15, 2)],
  term ((355227462877051 : Rat) / 1162780221153193) [(3, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((46824955938503210518999122991775109724 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (7, 1), (13, 2), (15, 1)],
  term ((-152747837075665191647550940228390518739988190776522320643 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(3, 2), (7, 1), (14, 1), (15, 1)],
  term ((2483128441501057 : Rat) / 1162780221153193) [(3, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3773401973948365711472042274593795909232108488982391511 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 2), (7, 1), (14, 2), (15, 1)],
  term ((-938674662914812 : Rat) / 1162780221153193) [(3, 2), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-19939264653645454550844396512708814820467810798252762778 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(3, 2), (7, 1), (15, 1)],
  term ((-5527295484604502 : Rat) / 1162780221153193) [(3, 2), (7, 1), (15, 1), (16, 1)],
  term ((182587976773348285098138707057166213218449056697193285789 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(3, 2), (7, 1), (15, 3)],
  term ((-4478221057214655 : Rat) / 1162780221153193) [(3, 2), (7, 1), (15, 3), (16, 1)],
  term ((-3709776815823037082149296919241914084111 : Rat) / 3599128372207431889700080584088617803970) [(3, 2), (8, 1)],
  term ((-1225265322114654679026622704559141817402 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (8, 1), (9, 1), (11, 1)],
  term ((100649367268495437262557180149834752612 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (8, 1), (9, 1), (12, 1), (13, 1)],
  term ((-3791903801717596649589202177171618108825510710996247681 : Rat) / 929998952132019818504773430836265897467346423247461380) [(3, 2), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((1077171098078953 : Rat) / 1162780221153193) [(3, 2), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1524202640719892156703221734547370372184 : Rat) / 359912837220743188970008058408861780397) [(3, 2), (8, 1), (9, 1), (13, 1)],
  term ((-42007933134393570098098441505839879027279619930823223123 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(3, 2), (8, 1), (9, 1), (15, 1)],
  term ((46392130127971129 : Rat) / 6976681326919158) [(3, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((1603924857658599305697727240107443115236 : Rat) / 1799564186103715944850040292044308901985) [(3, 2), (8, 1), (9, 2)],
  term ((-25298165874506516766865488992203696292 : Rat) / 119970945740247729656669352802953926799) [(3, 2), (8, 1), (11, 1), (12, 1), (13, 1)],
  term ((4678910223116561885498892093094954879251581098910006897 : Rat) / 929998952132019818504773430836265897467346423247461380) [(3, 2), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((-1146295204983097 : Rat) / 1162780221153193) [(3, 2), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((84493850184000825786514095782442813484 : Rat) / 119970945740247729656669352802953926799) [(3, 2), (8, 1), (11, 1), (13, 1)],
  term ((177146052459990833086843034621145881016452606292749398931 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(3, 2), (8, 1), (11, 1), (15, 1)],
  term ((-1082535559364413 : Rat) / 2325560442306386) [(3, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-44975123602223741861033454546231653929 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (8, 1), (12, 1)],
  term ((1883588680345343461100563594004714957639800719944512754 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 2), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((-1737846722105288 : Rat) / 1162780221153193) [(3, 2), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-199176069072538286358361042576915862048 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (8, 1), (12, 1), (13, 2)],
  term ((-1215479687725336028967882992894682370424495358081113244 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 2), (8, 1), (12, 1), (15, 2)],
  term ((1650756408727440 : Rat) / 1162780221153193) [(3, 2), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-78137961675158770308670494504548355711276460585054496433 : Rat) / 929998952132019818504773430836265897467346423247461380) [(3, 2), (8, 1), (13, 1), (15, 1)],
  term ((4835838994492525 : Rat) / 1162780221153193) [(3, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2765663698878662287968528107259212708074 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (8, 1), (13, 2)],
  term ((-1301354773091271153576238800289316593301 : Rat) / 1199709457402477296566693528029539267990) [(3, 2), (8, 1), (14, 1)],
  term ((7755439550448526920834443980136689352949563266798521611 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(3, 2), (8, 1), (15, 2)],
  term ((4821831915259055 : Rat) / 1162780221153193) [(3, 2), (8, 1), (15, 2), (16, 1)],
  term ((-413173782075119663093768476218434237432 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (8, 2)],
  term ((-2076391380081452377857175484385810270668 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (9, 1), (11, 1)],
  term ((-136801893773485553175290412901622223086 : Rat) / 119970945740247729656669352802953926799) [(3, 2), (9, 1), (11, 1), (12, 1)],
  term ((-3383012150111964721625057355309145856761125781838205059 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((699598964377024284665984479369490528956 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (10, 2), (12, 1), (13, 2), (15, 1)],
  term ((5998517674585019096440487702853772295167493695424703559 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (10, 2), (12, 1), (15, 1)],
  term ((-769195100829796 : Rat) / 1162780221153193) [(5, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((57065163418514028206963760297560614190626285699065528079 : Rat) / 929998952132019818504773430836265897467346423247461380) [(5, 1), (10, 2), (12, 1), (15, 3)],
  term ((-13204414907240807 : Rat) / 1162780221153193) [(5, 1), (10, 2), (12, 1), (15, 3), (16, 1)],
  term ((17856730383433244702599366065510184172 : Rat) / 119970945740247729656669352802953926799) [(5, 1), (10, 2), (13, 1)],
  term ((-21617868347627211728051505817229271432 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (10, 2), (13, 1), (14, 1)],
  term ((-1681207212074162784866544631513075229980270038215301238 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (10, 2), (13, 1), (14, 1), (15, 2)],
  term ((-833967741040952 : Rat) / 1162780221153193) [(5, 1), (10, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((2578326853107933456558538464757287301318301626202703904507 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(5, 1), (10, 2), (13, 1), (15, 2)],
  term ((50068166157171823 : Rat) / 6976681326919158) [(5, 1), (10, 2), (13, 1), (15, 2), (16, 1)],
  term ((-4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (10, 2), (13, 2), (14, 1), (15, 1)],
  term ((-147847046676439604201330883678806456320 : Rat) / 359912837220743188970008058408861780397) [(5, 1), (10, 2), (13, 2), (15, 1)],
  term ((15947492711747053841607119528059672869962592746542302313 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(5, 1), (10, 2), (14, 1), (15, 1)],
  term ((-1759640940265062 : Rat) / 1162780221153193) [(5, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 1), (10, 2), (14, 1), (15, 3)],
  term ((833967741040952 : Rat) / 1162780221153193) [(5, 1), (10, 2), (14, 1), (15, 3), (16, 1)],
  term ((-29627779009332143284283226421001764576646541097643147056 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(5, 1), (10, 2), (15, 1)],
  term ((1827859283520988 : Rat) / 1162780221153193) [(5, 1), (10, 2), (15, 1), (16, 1)],
  term ((-596292272370210102731177090662239802901212841340772628921 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(5, 1), (10, 2), (15, 3)],
  term ((-11177629529470399 : Rat) / 6976681326919158) [(5, 1), (10, 2), (15, 3), (16, 1)],
  term ((699598964377024284665984479369490528956 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (11, 2), (12, 1), (13, 2), (15, 1)],
  term ((5998517674585019096440487702853772295167493695424703559 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (11, 2), (12, 1), (15, 1)],
  term ((-769195100829796 : Rat) / 1162780221153193) [(5, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((57065163418514028206963760297560614190626285699065528079 : Rat) / 929998952132019818504773430836265897467346423247461380) [(5, 1), (11, 2), (12, 1), (15, 3)],
  term ((-13204414907240807 : Rat) / 1162780221153193) [(5, 1), (11, 2), (12, 1), (15, 3), (16, 1)],
  term ((17856730383433244702599366065510184172 : Rat) / 119970945740247729656669352802953926799) [(5, 1), (11, 2), (13, 1)],
  term ((-21617868347627211728051505817229271432 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (11, 2), (13, 1), (14, 1)],
  term ((-1681207212074162784866544631513075229980270038215301238 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (11, 2), (13, 1), (14, 1), (15, 2)],
  term ((-833967741040952 : Rat) / 1162780221153193) [(5, 1), (11, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((2578326853107933456558538464757287301318301626202703904507 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(5, 1), (11, 2), (13, 1), (15, 2)],
  term ((50068166157171823 : Rat) / 6976681326919158) [(5, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((-4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (11, 2), (13, 2), (14, 1), (15, 1)],
  term ((-147847046676439604201330883678806456320 : Rat) / 359912837220743188970008058408861780397) [(5, 1), (11, 2), (13, 2), (15, 1)],
  term ((15947492711747053841607119528059672869962592746542302313 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(5, 1), (11, 2), (14, 1), (15, 1)],
  term ((-1759640940265062 : Rat) / 1162780221153193) [(5, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 1), (11, 2), (14, 1), (15, 3)],
  term ((833967741040952 : Rat) / 1162780221153193) [(5, 1), (11, 2), (14, 1), (15, 3), (16, 1)],
  term ((-29627779009332143284283226421001764576646541097643147056 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(5, 1), (11, 2), (15, 1)],
  term ((1827859283520988 : Rat) / 1162780221153193) [(5, 1), (11, 2), (15, 1), (16, 1)],
  term ((-596292272370210102731177090662239802901212841340772628921 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(5, 1), (11, 2), (15, 3)],
  term ((-11177629529470399 : Rat) / 6976681326919158) [(5, 1), (11, 2), (15, 3), (16, 1)],
  term ((319014959023338608753545314714028482032 : Rat) / 599854728701238648283346764014769633995) [(5, 2), (9, 1), (10, 2), (13, 1)],
  term ((3028961299936339594435849179442279044072961783512194354 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 2), (9, 1), (10, 2), (15, 1)],
  term ((-2568602061245288 : Rat) / 1162780221153193) [(5, 2), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((319014959023338608753545314714028482032 : Rat) / 599854728701238648283346764014769633995) [(5, 2), (9, 1), (11, 2), (13, 1)],
  term ((3028961299936339594435849179442279044072961783512194354 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 2), (9, 1), (11, 2), (15, 1)],
  term ((-2568602061245288 : Rat) / 1162780221153193) [(5, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((57424356410650916815904656776024181448 : Rat) / 199951576233746216094448921338256544665) [(5, 2), (9, 2), (10, 2)],
  term ((57424356410650916815904656776024181448 : Rat) / 199951576233746216094448921338256544665) [(5, 2), (9, 2), (11, 2)],
  term ((-197694510238266821957195557551254432816 : Rat) / 599854728701238648283346764014769633995) [(5, 2), (10, 2), (13, 1), (15, 1)],
  term ((-5230076720176820119682108016672776177553508626941610138 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 2), (10, 2), (15, 2)],
  term ((2361660524222056 : Rat) / 1162780221153193) [(5, 2), (10, 2), (15, 2), (16, 1)],
  term ((-197694510238266821957195557551254432816 : Rat) / 599854728701238648283346764014769633995) [(5, 2), (11, 2), (13, 1), (15, 1)],
  term ((-5230076720176820119682108016672776177553508626941610138 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 2), (11, 2), (15, 2)],
  term ((2361660524222056 : Rat) / 1162780221153193) [(5, 2), (11, 2), (15, 2), (16, 1)],
  term ((206558578118461759089806144263373422486 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 1), (9, 1), (10, 2)],
  term ((206558578118461759089806144263373422486 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 1), (9, 1), (11, 2)],
  term ((12979170683146789939085894591745652172 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 1), (10, 2), (12, 1), (13, 1)],
  term ((-519790077507635364246714238454931580267528154182411463 : Rat) / 929998952132019818504773430836265897467346423247461380) [(7, 1), (8, 1), (10, 2), (12, 1), (15, 1)],
  term ((212739288644735 : Rat) / 1162780221153193) [(7, 1), (8, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((-84574267304034159307383392985859926898 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 1), (10, 2), (13, 1)],
  term ((-12391057674363913550311122299423538521421896682288632882 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (8, 1), (10, 2), (15, 1)],
  term ((3501168887590402 : Rat) / 1162780221153193) [(7, 1), (8, 1), (10, 2), (15, 1), (16, 1)],
  term ((12979170683146789939085894591745652172 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 1), (11, 2), (12, 1), (13, 1)],
  term ((-519790077507635364246714238454931580267528154182411463 : Rat) / 929998952132019818504773430836265897467346423247461380) [(7, 1), (8, 1), (11, 2), (12, 1), (15, 1)],
  term ((212739288644735 : Rat) / 1162780221153193) [(7, 1), (8, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-84574267304034159307383392985859926898 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 1), (11, 2), (13, 1)],
  term ((-12391057674363913550311122299423538521421896682288632882 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (8, 1), (11, 2), (15, 1)],
  term ((3501168887590402 : Rat) / 1162780221153193) [(7, 1), (8, 1), (11, 2), (15, 1), (16, 1)],
  term ((-4238978574830944812688785943010145075721 : Rat) / 1799564186103715944850040292044308901985) [(7, 1), (9, 1), (10, 2)],
  term ((886145460922430421280018592403483917716 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (9, 1), (10, 2), (12, 1)],
  term ((-798582412409743722368367385112215430768 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (9, 1), (10, 2), (13, 1), (15, 1)],
  term ((-2234691451781231325421589515033267771336 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (9, 1), (10, 2), (14, 1)],
  term ((4344074584876535282375746373930099123380749438247228923 : Rat) / 464999476066009909252386715418132948733673211623730690) [(7, 1), (9, 1), (10, 2), (15, 2)],
  term ((-3065637341133238 : Rat) / 1162780221153193) [(7, 1), (9, 1), (10, 2), (15, 2), (16, 1)],
  term ((-4238978574830944812688785943010145075721 : Rat) / 1799564186103715944850040292044308901985) [(7, 1), (9, 1), (11, 2)],
  term ((886145460922430421280018592403483917716 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (9, 1), (11, 2), (12, 1)],
  term ((-798582412409743722368367385112215430768 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (9, 1), (11, 2), (13, 1), (15, 1)],
  term ((-2234691451781231325421589515033267771336 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (9, 1), (11, 2), (14, 1)],
  term ((4344074584876535282375746373930099123380749438247228923 : Rat) / 464999476066009909252386715418132948733673211623730690) [(7, 1), (9, 1), (11, 2), (15, 2)],
  term ((-3065637341133238 : Rat) / 1162780221153193) [(7, 1), (9, 1), (11, 2), (15, 2), (16, 1)],
  term ((-220893862652644812159568003760951473696 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (9, 2), (10, 2), (15, 1)],
  term ((-220893862652644812159568003760951473696 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (9, 2), (11, 2), (15, 1)],
  term ((518543174883551540146515086812976898784 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (10, 2), (11, 1)],
  term ((89547604594084105807568793286655194652 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (10, 2), (12, 1), (13, 1)],
  term ((-48438423129215560676143065672187698824 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (10, 2), (12, 1), (13, 1), (14, 1)],
  term ((-33273931020260669930661190011024360672 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (10, 2), (12, 1), (13, 1), (15, 2)],
  term ((838411973319437252533717745383941150125364404896314437 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(7, 1), (10, 2), (12, 1), (14, 1), (15, 1)],
  term ((1274781574709922 : Rat) / 1162780221153193) [(7, 1), (10, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-29037040217161627543541343141623393529291908260485924539 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (10, 2), (12, 1), (15, 1)],
  term ((-757043177666604 : Rat) / 1162780221153193) [(7, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((198745616475118943998092102782769635563595552220534688 : Rat) / 46499947606600990925238671541813294873367321162373069) [(7, 1), (10, 2), (12, 1), (15, 3)],
  term ((-1581632301823296 : Rat) / 1162780221153193) [(7, 1), (10, 2), (12, 1), (15, 3), (16, 1)],
  term ((-361897348718776485311185231728879779368 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (10, 2), (12, 2), (13, 1)],
  term ((6285331816600909397659698691956620588036985675621846367 : Rat) / 464999476066009909252386715418132948733673211623730690) [(7, 1), (10, 2), (12, 2), (15, 1)],
  term ((-1324091967043342 : Rat) / 1162780221153193) [(7, 1), (10, 2), (12, 2), (15, 1), (16, 1)],
  term ((599984196030905917187784991017220141898 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (10, 2), (13, 1)],
  term ((903084356647818576853574366344410520372 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (10, 2), (13, 1), (14, 1)],
  term ((19358917253490364062047066221672448008 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (10, 2), (13, 1), (14, 2)],
  term ((94155537895141594327780228805357359980550026461185294441 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(7, 1), (10, 2), (13, 1), (15, 2)],
  term ((-355227462877051 : Rat) / 1162780221153193) [(7, 1), (10, 2), (13, 1), (15, 2), (16, 1)],
  term ((-46824955938503210518999122991775109724 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (10, 2), (13, 2), (15, 1)],
  term ((152747837075665191647550940228390518739988190776522320643 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(7, 1), (10, 2), (14, 1), (15, 1)],
  term ((-2483128441501057 : Rat) / 1162780221153193) [(7, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((3773401973948365711472042274593795909232108488982391511 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (10, 2), (14, 2), (15, 1)],
  term ((938674662914812 : Rat) / 1162780221153193) [(7, 1), (10, 2), (14, 2), (15, 1), (16, 1)],
  term ((19939264653645454550844396512708814820467810798252762778 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(7, 1), (10, 2), (15, 1)],
  term ((5527295484604502 : Rat) / 1162780221153193) [(7, 1), (10, 2), (15, 1), (16, 1)],
  term ((-182587976773348285098138707057166213218449056697193285789 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(7, 1), (10, 2), (15, 3)],
  term ((4478221057214655 : Rat) / 1162780221153193) [(7, 1), (10, 2), (15, 3), (16, 1)],
  term ((89547604594084105807568793286655194652 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (11, 2), (12, 1), (13, 1)],
  term ((-48438423129215560676143065672187698824 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (11, 2), (12, 1), (13, 1), (14, 1)],
  term ((-33273931020260669930661190011024360672 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (11, 2), (12, 1), (13, 1), (15, 2)],
  term ((838411973319437252533717745383941150125364404896314437 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(7, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((1274781574709922 : Rat) / 1162780221153193) [(7, 1), (11, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-29037040217161627543541343141623393529291908260485924539 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (11, 2), (12, 1), (15, 1)],
  term ((-757043177666604 : Rat) / 1162780221153193) [(7, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((198745616475118943998092102782769635563595552220534688 : Rat) / 46499947606600990925238671541813294873367321162373069) [(7, 1), (11, 2), (12, 1), (15, 3)],
  term ((-1581632301823296 : Rat) / 1162780221153193) [(7, 1), (11, 2), (12, 1), (15, 3), (16, 1)],
  term ((-361897348718776485311185231728879779368 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (11, 2), (12, 2), (13, 1)],
  term ((6285331816600909397659698691956620588036985675621846367 : Rat) / 464999476066009909252386715418132948733673211623730690) [(7, 1), (11, 2), (12, 2), (15, 1)],
  term ((-1324091967043342 : Rat) / 1162780221153193) [(7, 1), (11, 2), (12, 2), (15, 1), (16, 1)],
  term ((599984196030905917187784991017220141898 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (11, 2), (13, 1)],
  term ((903084356647818576853574366344410520372 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (11, 2), (13, 1), (14, 1)],
  term ((19358917253490364062047066221672448008 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (11, 2), (13, 1), (14, 2)],
  term ((94155537895141594327780228805357359980550026461185294441 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(7, 1), (11, 2), (13, 1), (15, 2)],
  term ((-355227462877051 : Rat) / 1162780221153193) [(7, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((-46824955938503210518999122991775109724 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (11, 2), (13, 2), (15, 1)],
  term ((152747837075665191647550940228390518739988190776522320643 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(7, 1), (11, 2), (14, 1), (15, 1)],
  term ((-2483128441501057 : Rat) / 1162780221153193) [(7, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((3773401973948365711472042274593795909232108488982391511 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (11, 2), (14, 2), (15, 1)],
  term ((938674662914812 : Rat) / 1162780221153193) [(7, 1), (11, 2), (14, 2), (15, 1), (16, 1)],
  term ((19939264653645454550844396512708814820467810798252762778 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(7, 1), (11, 2), (15, 1)],
  term ((5527295484604502 : Rat) / 1162780221153193) [(7, 1), (11, 2), (15, 1), (16, 1)],
  term ((-182587976773348285098138707057166213218449056697193285789 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(7, 1), (11, 2), (15, 3)],
  term ((4478221057214655 : Rat) / 1162780221153193) [(7, 1), (11, 2), (15, 3), (16, 1)],
  term ((518543174883551540146515086812976898784 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (11, 3)],
  term ((1225265322114654679026622704559141817402 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (9, 1), (10, 2), (11, 1)],
  term ((-100649367268495437262557180149834752612 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (9, 1), (10, 2), (12, 1), (13, 1)],
  term ((3791903801717596649589202177171618108825510710996247681 : Rat) / 929998952132019818504773430836265897467346423247461380) [(8, 1), (9, 1), (10, 2), (12, 1), (15, 1)],
  term ((-1077171098078953 : Rat) / 1162780221153193) [(8, 1), (9, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((1524202640719892156703221734547370372184 : Rat) / 359912837220743188970008058408861780397) [(8, 1), (9, 1), (10, 2), (13, 1)],
  term ((42007933134393570098098441505839879027279619930823223123 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(8, 1), (9, 1), (10, 2), (15, 1)],
  term ((-46392130127971129 : Rat) / 6976681326919158) [(8, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-100649367268495437262557180149834752612 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (9, 1), (11, 2), (12, 1), (13, 1)],
  term ((3791903801717596649589202177171618108825510710996247681 : Rat) / 929998952132019818504773430836265897467346423247461380) [(8, 1), (9, 1), (11, 2), (12, 1), (15, 1)],
  term ((-1077171098078953 : Rat) / 1162780221153193) [(8, 1), (9, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((1524202640719892156703221734547370372184 : Rat) / 359912837220743188970008058408861780397) [(8, 1), (9, 1), (11, 2), (13, 1)],
  term ((42007933134393570098098441505839879027279619930823223123 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(8, 1), (9, 1), (11, 2), (15, 1)],
  term ((-46392130127971129 : Rat) / 6976681326919158) [(8, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((1225265322114654679026622704559141817402 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (9, 1), (11, 3)],
  term ((-1603924857658599305697727240107443115236 : Rat) / 1799564186103715944850040292044308901985) [(8, 1), (9, 2), (10, 2)],
  term ((-1603924857658599305697727240107443115236 : Rat) / 1799564186103715944850040292044308901985) [(8, 1), (9, 2), (11, 2)],
  term ((3709776815823037082149296919241914084111 : Rat) / 3599128372207431889700080584088617803970) [(8, 1), (10, 2)],
  term ((25298165874506516766865488992203696292 : Rat) / 119970945740247729656669352802953926799) [(8, 1), (10, 2), (11, 1), (12, 1), (13, 1)],
  term ((-4678910223116561885498892093094954879251581098910006897 : Rat) / 929998952132019818504773430836265897467346423247461380) [(8, 1), (10, 2), (11, 1), (12, 1), (15, 1)],
  term ((1146295204983097 : Rat) / 1162780221153193) [(8, 1), (10, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-84493850184000825786514095782442813484 : Rat) / 119970945740247729656669352802953926799) [(8, 1), (10, 2), (11, 1), (13, 1)],
  term ((-177146052459990833086843034621145881016452606292749398931 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(8, 1), (10, 2), (11, 1), (15, 1)],
  term ((1082535559364413 : Rat) / 2325560442306386) [(8, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((44975123602223741861033454546231653929 : Rat) / 199951576233746216094448921338256544665) [(8, 1), (10, 2), (12, 1)],
  term ((-1883588680345343461100563594004714957639800719944512754 : Rat) / 232499738033004954626193357709066474366836605811865345) [(8, 1), (10, 2), (12, 1), (13, 1), (15, 1)],
  term ((1737846722105288 : Rat) / 1162780221153193) [(8, 1), (10, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((199176069072538286358361042576915862048 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (10, 2), (12, 1), (13, 2)],
  term ((1215479687725336028967882992894682370424495358081113244 : Rat) / 232499738033004954626193357709066474366836605811865345) [(8, 1), (10, 2), (12, 1), (15, 2)],
  term ((-1650756408727440 : Rat) / 1162780221153193) [(8, 1), (10, 2), (12, 1), (15, 2), (16, 1)],
  term ((78137961675158770308670494504548355711276460585054496433 : Rat) / 929998952132019818504773430836265897467346423247461380) [(8, 1), (10, 2), (13, 1), (15, 1)],
  term ((-4835838994492525 : Rat) / 1162780221153193) [(8, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((2765663698878662287968528107259212708074 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (10, 2), (13, 2)],
  term ((1301354773091271153576238800289316593301 : Rat) / 1199709457402477296566693528029539267990) [(8, 1), (10, 2), (14, 1)],
  term ((-7755439550448526920834443980136689352949563266798521611 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(8, 1), (10, 2), (15, 2)],
  term ((-4821831915259055 : Rat) / 1162780221153193) [(8, 1), (10, 2), (15, 2), (16, 1)],
  term ((3709776815823037082149296919241914084111 : Rat) / 3599128372207431889700080584088617803970) [(8, 1), (11, 2)],
  term ((44975123602223741861033454546231653929 : Rat) / 199951576233746216094448921338256544665) [(8, 1), (11, 2), (12, 1)],
  term ((-1883588680345343461100563594004714957639800719944512754 : Rat) / 232499738033004954626193357709066474366836605811865345) [(8, 1), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((1737846722105288 : Rat) / 1162780221153193) [(8, 1), (11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((199176069072538286358361042576915862048 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (11, 2), (12, 1), (13, 2)],
  term ((1215479687725336028967882992894682370424495358081113244 : Rat) / 232499738033004954626193357709066474366836605811865345) [(8, 1), (11, 2), (12, 1), (15, 2)],
  term ((-1650756408727440 : Rat) / 1162780221153193) [(8, 1), (11, 2), (12, 1), (15, 2), (16, 1)],
  term ((78137961675158770308670494504548355711276460585054496433 : Rat) / 929998952132019818504773430836265897467346423247461380) [(8, 1), (11, 2), (13, 1), (15, 1)],
  term ((-4835838994492525 : Rat) / 1162780221153193) [(8, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((2765663698878662287968528107259212708074 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (11, 2), (13, 2)],
  term ((1301354773091271153576238800289316593301 : Rat) / 1199709457402477296566693528029539267990) [(8, 1), (11, 2), (14, 1)],
  term ((-7755439550448526920834443980136689352949563266798521611 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(8, 1), (11, 2), (15, 2)],
  term ((-4821831915259055 : Rat) / 1162780221153193) [(8, 1), (11, 2), (15, 2), (16, 1)],
  term ((25298165874506516766865488992203696292 : Rat) / 119970945740247729656669352802953926799) [(8, 1), (11, 3), (12, 1), (13, 1)],
  term ((-4678910223116561885498892093094954879251581098910006897 : Rat) / 929998952132019818504773430836265897467346423247461380) [(8, 1), (11, 3), (12, 1), (15, 1)],
  term ((1146295204983097 : Rat) / 1162780221153193) [(8, 1), (11, 3), (12, 1), (15, 1), (16, 1)],
  term ((-84493850184000825786514095782442813484 : Rat) / 119970945740247729656669352802953926799) [(8, 1), (11, 3), (13, 1)],
  term ((-177146052459990833086843034621145881016452606292749398931 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(8, 1), (11, 3), (15, 1)],
  term ((1082535559364413 : Rat) / 2325560442306386) [(8, 1), (11, 3), (15, 1), (16, 1)],
  term ((413173782075119663093768476218434237432 : Rat) / 599854728701238648283346764014769633995) [(8, 2), (10, 2)],
  term ((413173782075119663093768476218434237432 : Rat) / 599854728701238648283346764014769633995) [(8, 2), (11, 2)],
  term ((2076391380081452377857175484385810270668 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (10, 2), (11, 1)],
  term ((136801893773485553175290412901622223086 : Rat) / 119970945740247729656669352802953926799) [(9, 1), (10, 2), (11, 1), (12, 1)],
  term ((3383012150111964721625057355309145856761125781838205059 : Rat) / 232499738033004954626193357709066474366836605811865345) [(9, 1), (10, 2), (11, 1), (13, 1), (15, 1)],
  term ((2076391380081452377857175484385810270668 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (11, 3)],
  term ((136801893773485553175290412901622223086 : Rat) / 119970945740247729656669352802953926799) [(9, 1), (11, 3), (12, 1)],
  term ((3383012150111964721625057355309145856761125781838205059 : Rat) / 232499738033004954626193357709066474366836605811865345) [(9, 1), (11, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 4, terms 400 through 499. -/
theorem ep_Q2_024_block_04_0400_0499_valid :
    checkProductSumEq ep_Q2_024_partials_04_0400_0499
      ep_Q2_024_block_04_0400_0499 = true := by
  native_decide

end EpQ2024TermShards

end Patterns

end EndpointCertificate

end Problem97
