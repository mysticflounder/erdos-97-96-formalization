/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_024, term block 5:400-497

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_024`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2024TermShards

/-- Generator polynomial 5 for endpoint certificate `ep_Q2_024`. -/
def ep_Q2_024_generator_05_0400_0497 : Poly :=
[
  term (1 : Rat) [(2, 2)],
  term (1 : Rat) [(3, 2)],
  term (-1 : Rat) [(14, 2)],
  term (-1 : Rat) [(15, 2)]
]

/-- Coefficient term 400 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0400 : Poly :=
[
  term ((-35844411776756629 : Rat) / 4651120884612772) [(8, 1), (15, 2), (16, 1)]
]

/-- Partial product 400 for generator 5. -/
def ep_Q2_024_partial_05_0400 : Poly :=
[
  term ((-35844411776756629 : Rat) / 4651120884612772) [(2, 2), (8, 1), (15, 2), (16, 1)],
  term ((-35844411776756629 : Rat) / 4651120884612772) [(3, 2), (8, 1), (15, 2), (16, 1)],
  term ((35844411776756629 : Rat) / 4651120884612772) [(8, 1), (14, 2), (15, 2), (16, 1)],
  term ((35844411776756629 : Rat) / 4651120884612772) [(8, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 400 for generator 5. -/
theorem ep_Q2_024_partial_05_0400_valid :
    mulPoly ep_Q2_024_coefficient_05_0400
        ep_Q2_024_generator_05_0400_0497 =
      ep_Q2_024_partial_05_0400 := by
  native_decide

/-- Coefficient term 401 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0401 : Poly :=
[
  term ((-413173782075119663093768476218434237432 : Rat) / 599854728701238648283346764014769633995) [(8, 2)]
]

/-- Partial product 401 for generator 5. -/
def ep_Q2_024_partial_05_0401 : Poly :=
[
  term ((-413173782075119663093768476218434237432 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (8, 2)],
  term ((-413173782075119663093768476218434237432 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (8, 2)],
  term ((413173782075119663093768476218434237432 : Rat) / 599854728701238648283346764014769633995) [(8, 2), (14, 2)],
  term ((413173782075119663093768476218434237432 : Rat) / 599854728701238648283346764014769633995) [(8, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 401 for generator 5. -/
theorem ep_Q2_024_partial_05_0401_valid :
    mulPoly ep_Q2_024_coefficient_05_0401
        ep_Q2_024_generator_05_0400_0497 =
      ep_Q2_024_partial_05_0401 := by
  native_decide

/-- Coefficient term 402 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0402 : Poly :=
[
  term ((1753247794556348176873481968091066377084 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (11, 1)]
]

/-- Partial product 402 for generator 5. -/
def ep_Q2_024_partial_05_0402 : Poly :=
[
  term ((1753247794556348176873481968091066377084 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (9, 1), (11, 1)],
  term ((1753247794556348176873481968091066377084 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (9, 1), (11, 1)],
  term ((-1753247794556348176873481968091066377084 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (11, 1), (14, 2)],
  term ((-1753247794556348176873481968091066377084 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 402 for generator 5. -/
theorem ep_Q2_024_partial_05_0402_valid :
    mulPoly ep_Q2_024_coefficient_05_0402
        ep_Q2_024_generator_05_0400_0497 =
      ep_Q2_024_partial_05_0402 := by
  native_decide

/-- Coefficient term 403 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0403 : Poly :=
[
  term ((28480226649915404613451229443364578284 : Rat) / 199951576233746216094448921338256544665) [(9, 1), (11, 1), (12, 1)]
]

/-- Partial product 403 for generator 5. -/
def ep_Q2_024_partial_05_0403 : Poly :=
[
  term ((28480226649915404613451229443364578284 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (9, 1), (11, 1), (12, 1)],
  term ((28480226649915404613451229443364578284 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (9, 1), (11, 1), (12, 1)],
  term ((-28480226649915404613451229443364578284 : Rat) / 199951576233746216094448921338256544665) [(9, 1), (11, 1), (12, 1), (14, 2)],
  term ((-28480226649915404613451229443364578284 : Rat) / 199951576233746216094448921338256544665) [(9, 1), (11, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 403 for generator 5. -/
theorem ep_Q2_024_partial_05_0403_valid :
    mulPoly ep_Q2_024_coefficient_05_0403
        ep_Q2_024_generator_05_0400_0497 =
      ep_Q2_024_partial_05_0403 := by
  native_decide

/-- Coefficient term 404 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0404 : Poly :=
[
  term ((5546103577164003709519065548508593986367472517022776538 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 404 for generator 5. -/
def ep_Q2_024_partial_05_0404 : Poly :=
[
  term ((5546103577164003709519065548508593986367472517022776538 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((5546103577164003709519065548508593986367472517022776538 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-5546103577164003709519065548508593986367472517022776538 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((-5546103577164003709519065548508593986367472517022776538 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 1), (11, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 404 for generator 5. -/
theorem ep_Q2_024_partial_05_0404_valid :
    mulPoly ep_Q2_024_coefficient_05_0404
        ep_Q2_024_generator_05_0400_0497 =
      ep_Q2_024_partial_05_0404 := by
  native_decide

/-- Coefficient term 405 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0405 : Poly :=
[
  term ((-75330592794360 : Rat) / 1162780221153193) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 405 for generator 5. -/
def ep_Q2_024_partial_05_0405 : Poly :=
[
  term ((-75330592794360 : Rat) / 1162780221153193) [(2, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-75330592794360 : Rat) / 1162780221153193) [(3, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((75330592794360 : Rat) / 1162780221153193) [(9, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((75330592794360 : Rat) / 1162780221153193) [(9, 1), (11, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 405 for generator 5. -/
theorem ep_Q2_024_partial_05_0405_valid :
    mulPoly ep_Q2_024_coefficient_05_0405
        ep_Q2_024_generator_05_0400_0497 =
      ep_Q2_024_partial_05_0405 := by
  native_decide

/-- Coefficient term 406 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0406 : Poly :=
[
  term ((-40472928056033817116049120031239046672 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (11, 1), (13, 2)]
]

/-- Partial product 406 for generator 5. -/
def ep_Q2_024_partial_05_0406 : Poly :=
[
  term ((-40472928056033817116049120031239046672 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (9, 1), (11, 1), (13, 2)],
  term ((-40472928056033817116049120031239046672 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (9, 1), (11, 1), (13, 2)],
  term ((40472928056033817116049120031239046672 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (11, 1), (13, 2), (14, 2)],
  term ((40472928056033817116049120031239046672 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (11, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 406 for generator 5. -/
theorem ep_Q2_024_partial_05_0406_valid :
    mulPoly ep_Q2_024_coefficient_05_0406
        ep_Q2_024_generator_05_0400_0497 =
      ep_Q2_024_partial_05_0406 := by
  native_decide

/-- Coefficient term 407 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0407 : Poly :=
[
  term ((-8921151527862041881559355605928391576 : Rat) / 199951576233746216094448921338256544665) [(9, 1), (11, 1), (14, 1)]
]

/-- Partial product 407 for generator 5. -/
def ep_Q2_024_partial_05_0407 : Poly :=
[
  term ((-8921151527862041881559355605928391576 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (9, 1), (11, 1), (14, 1)],
  term ((-8921151527862041881559355605928391576 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (9, 1), (11, 1), (14, 1)],
  term ((8921151527862041881559355605928391576 : Rat) / 199951576233746216094448921338256544665) [(9, 1), (11, 1), (14, 1), (15, 2)],
  term ((8921151527862041881559355605928391576 : Rat) / 199951576233746216094448921338256544665) [(9, 1), (11, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 407 for generator 5. -/
theorem ep_Q2_024_partial_05_0407_valid :
    mulPoly ep_Q2_024_coefficient_05_0407
        ep_Q2_024_generator_05_0400_0497 =
      ep_Q2_024_partial_05_0407 := by
  native_decide

/-- Coefficient term 408 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0408 : Poly :=
[
  term ((-31914642418468897160042061022834858140022559670850052665 : Rat) / 1115998742558423782205728117003519076960815707896953656) [(9, 1), (11, 1), (15, 2)]
]

/-- Partial product 408 for generator 5. -/
def ep_Q2_024_partial_05_0408 : Poly :=
[
  term ((-31914642418468897160042061022834858140022559670850052665 : Rat) / 1115998742558423782205728117003519076960815707896953656) [(2, 2), (9, 1), (11, 1), (15, 2)],
  term ((-31914642418468897160042061022834858140022559670850052665 : Rat) / 1115998742558423782205728117003519076960815707896953656) [(3, 2), (9, 1), (11, 1), (15, 2)],
  term ((31914642418468897160042061022834858140022559670850052665 : Rat) / 1115998742558423782205728117003519076960815707896953656) [(9, 1), (11, 1), (14, 2), (15, 2)],
  term ((31914642418468897160042061022834858140022559670850052665 : Rat) / 1115998742558423782205728117003519076960815707896953656) [(9, 1), (11, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 408 for generator 5. -/
theorem ep_Q2_024_partial_05_0408_valid :
    mulPoly ep_Q2_024_coefficient_05_0408
        ep_Q2_024_generator_05_0400_0497 =
      ep_Q2_024_partial_05_0408 := by
  native_decide

/-- Coefficient term 409 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0409 : Poly :=
[
  term ((12213780129134847 : Rat) / 2325560442306386) [(9, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 409 for generator 5. -/
def ep_Q2_024_partial_05_0409 : Poly :=
[
  term ((12213780129134847 : Rat) / 2325560442306386) [(2, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((12213780129134847 : Rat) / 2325560442306386) [(3, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-12213780129134847 : Rat) / 2325560442306386) [(9, 1), (11, 1), (14, 2), (15, 2), (16, 1)],
  term ((-12213780129134847 : Rat) / 2325560442306386) [(9, 1), (11, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 409 for generator 5. -/
theorem ep_Q2_024_partial_05_0409_valid :
    mulPoly ep_Q2_024_coefficient_05_0409
        ep_Q2_024_generator_05_0400_0497 =
      ep_Q2_024_partial_05_0409 := by
  native_decide

/-- Coefficient term 410 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0410 : Poly :=
[
  term ((11926969586755832197683769228778754503452 : Rat) / 1799564186103715944850040292044308901985) [(9, 1), (12, 1), (13, 1)]
]

/-- Partial product 410 for generator 5. -/
def ep_Q2_024_partial_05_0410 : Poly :=
[
  term ((11926969586755832197683769228778754503452 : Rat) / 1799564186103715944850040292044308901985) [(2, 2), (9, 1), (12, 1), (13, 1)],
  term ((11926969586755832197683769228778754503452 : Rat) / 1799564186103715944850040292044308901985) [(3, 2), (9, 1), (12, 1), (13, 1)],
  term ((-11926969586755832197683769228778754503452 : Rat) / 1799564186103715944850040292044308901985) [(9, 1), (12, 1), (13, 1), (14, 2)],
  term ((-11926969586755832197683769228778754503452 : Rat) / 1799564186103715944850040292044308901985) [(9, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 410 for generator 5. -/
theorem ep_Q2_024_partial_05_0410_valid :
    mulPoly ep_Q2_024_coefficient_05_0410
        ep_Q2_024_generator_05_0400_0497 =
      ep_Q2_024_partial_05_0410 := by
  native_decide

/-- Coefficient term 411 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0411 : Poly :=
[
  term ((-726086402385886848250705287478630146526 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 411 for generator 5. -/
def ep_Q2_024_partial_05_0411 : Poly :=
[
  term ((-726086402385886848250705287478630146526 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((-726086402385886848250705287478630146526 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((726086402385886848250705287478630146526 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((726086402385886848250705287478630146526 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (12, 1), (13, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 411 for generator 5. -/
theorem ep_Q2_024_partial_05_0411_valid :
    mulPoly ep_Q2_024_coefficient_05_0411
        ep_Q2_024_generator_05_0400_0497 =
      ep_Q2_024_partial_05_0411 := by
  native_decide

/-- Coefficient term 412 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0412 : Poly :=
[
  term ((84907720390392240188132975818963809686531449169420469511 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(9, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 412 for generator 5. -/
def ep_Q2_024_partial_05_0412 : Poly :=
[
  term ((84907720390392240188132975818963809686531449169420469511 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(2, 2), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((84907720390392240188132975818963809686531449169420469511 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(3, 2), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-84907720390392240188132975818963809686531449169420469511 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(9, 1), (12, 1), (14, 1), (15, 3)],
  term ((-84907720390392240188132975818963809686531449169420469511 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(9, 1), (12, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 412 for generator 5. -/
theorem ep_Q2_024_partial_05_0412_valid :
    mulPoly ep_Q2_024_coefficient_05_0412
        ep_Q2_024_generator_05_0400_0497 =
      ep_Q2_024_partial_05_0412 := by
  native_decide

/-- Coefficient term 413 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0413 : Poly :=
[
  term ((-19311310254244191 : Rat) / 2325560442306386) [(9, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 413 for generator 5. -/
def ep_Q2_024_partial_05_0413 : Poly :=
[
  term ((-19311310254244191 : Rat) / 2325560442306386) [(2, 2), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-19311310254244191 : Rat) / 2325560442306386) [(3, 2), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((19311310254244191 : Rat) / 2325560442306386) [(9, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((19311310254244191 : Rat) / 2325560442306386) [(9, 1), (12, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 413 for generator 5. -/
theorem ep_Q2_024_partial_05_0413_valid :
    mulPoly ep_Q2_024_coefficient_05_0413
        ep_Q2_024_generator_05_0400_0497 =
      ep_Q2_024_partial_05_0413 := by
  native_decide

/-- Coefficient term 414 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0414 : Poly :=
[
  term ((248523726730771764189736002550968372967476746874908271187 : Rat) / 3719995808528079274019093723345063589869385692989845520) [(9, 1), (12, 1), (15, 1)]
]

/-- Partial product 414 for generator 5. -/
def ep_Q2_024_partial_05_0414 : Poly :=
[
  term ((248523726730771764189736002550968372967476746874908271187 : Rat) / 3719995808528079274019093723345063589869385692989845520) [(2, 2), (9, 1), (12, 1), (15, 1)],
  term ((248523726730771764189736002550968372967476746874908271187 : Rat) / 3719995808528079274019093723345063589869385692989845520) [(3, 2), (9, 1), (12, 1), (15, 1)],
  term ((-248523726730771764189736002550968372967476746874908271187 : Rat) / 3719995808528079274019093723345063589869385692989845520) [(9, 1), (12, 1), (14, 2), (15, 1)],
  term ((-248523726730771764189736002550968372967476746874908271187 : Rat) / 3719995808528079274019093723345063589869385692989845520) [(9, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 414 for generator 5. -/
theorem ep_Q2_024_partial_05_0414_valid :
    mulPoly ep_Q2_024_coefficient_05_0414
        ep_Q2_024_generator_05_0400_0497 =
      ep_Q2_024_partial_05_0414 := by
  native_decide

/-- Coefficient term 415 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0415 : Poly :=
[
  term ((91709861079541295 : Rat) / 13953362653838316) [(9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 415 for generator 5. -/
def ep_Q2_024_partial_05_0415 : Poly :=
[
  term ((91709861079541295 : Rat) / 13953362653838316) [(2, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((91709861079541295 : Rat) / 13953362653838316) [(3, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-91709861079541295 : Rat) / 13953362653838316) [(9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-91709861079541295 : Rat) / 13953362653838316) [(9, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 415 for generator 5. -/
theorem ep_Q2_024_partial_05_0415_valid :
    mulPoly ep_Q2_024_coefficient_05_0415
        ep_Q2_024_generator_05_0400_0497 =
      ep_Q2_024_partial_05_0415 := by
  native_decide

/-- Coefficient term 416 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0416 : Poly :=
[
  term ((474284525358848571306967891295317678258 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (12, 2), (13, 1)]
]

/-- Partial product 416 for generator 5. -/
def ep_Q2_024_partial_05_0416 : Poly :=
[
  term ((474284525358848571306967891295317678258 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (9, 1), (12, 2), (13, 1)],
  term ((474284525358848571306967891295317678258 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (9, 1), (12, 2), (13, 1)],
  term ((-474284525358848571306967891295317678258 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (12, 2), (13, 1), (14, 2)],
  term ((-474284525358848571306967891295317678258 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (12, 2), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 416 for generator 5. -/
theorem ep_Q2_024_partial_05_0416_valid :
    mulPoly ep_Q2_024_coefficient_05_0416
        ep_Q2_024_generator_05_0400_0497 =
      ep_Q2_024_partial_05_0416 := by
  native_decide

/-- Coefficient term 417 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0417 : Poly :=
[
  term ((-34313740608208448309428547234530905537673221433088041993 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(9, 1), (12, 2), (15, 1)]
]

/-- Partial product 417 for generator 5. -/
def ep_Q2_024_partial_05_0417 : Poly :=
[
  term ((-34313740608208448309428547234530905537673221433088041993 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(2, 2), (9, 1), (12, 2), (15, 1)],
  term ((-34313740608208448309428547234530905537673221433088041993 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(3, 2), (9, 1), (12, 2), (15, 1)],
  term ((34313740608208448309428547234530905537673221433088041993 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(9, 1), (12, 2), (14, 2), (15, 1)],
  term ((34313740608208448309428547234530905537673221433088041993 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(9, 1), (12, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 417 for generator 5. -/
theorem ep_Q2_024_partial_05_0417_valid :
    mulPoly ep_Q2_024_coefficient_05_0417
        ep_Q2_024_generator_05_0400_0497 =
      ep_Q2_024_partial_05_0417 := by
  native_decide

/-- Coefficient term 418 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0418 : Poly :=
[
  term ((6741388318767089 : Rat) / 2325560442306386) [(9, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 418 for generator 5. -/
def ep_Q2_024_partial_05_0418 : Poly :=
[
  term ((6741388318767089 : Rat) / 2325560442306386) [(2, 2), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((6741388318767089 : Rat) / 2325560442306386) [(3, 2), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-6741388318767089 : Rat) / 2325560442306386) [(9, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((-6741388318767089 : Rat) / 2325560442306386) [(9, 1), (12, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 418 for generator 5. -/
theorem ep_Q2_024_partial_05_0418_valid :
    mulPoly ep_Q2_024_coefficient_05_0418
        ep_Q2_024_generator_05_0400_0497 =
      ep_Q2_024_partial_05_0418 := by
  native_decide

/-- Coefficient term 419 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0419 : Poly :=
[
  term ((-2013386073169527812662537607303091687587 : Rat) / 1799564186103715944850040292044308901985) [(9, 1), (13, 1)]
]

/-- Partial product 419 for generator 5. -/
def ep_Q2_024_partial_05_0419 : Poly :=
[
  term ((-2013386073169527812662537607303091687587 : Rat) / 1799564186103715944850040292044308901985) [(2, 2), (9, 1), (13, 1)],
  term ((-2013386073169527812662537607303091687587 : Rat) / 1799564186103715944850040292044308901985) [(3, 2), (9, 1), (13, 1)],
  term ((2013386073169527812662537607303091687587 : Rat) / 1799564186103715944850040292044308901985) [(9, 1), (13, 1), (14, 2)],
  term ((2013386073169527812662537607303091687587 : Rat) / 1799564186103715944850040292044308901985) [(9, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 419 for generator 5. -/
theorem ep_Q2_024_partial_05_0419_valid :
    mulPoly ep_Q2_024_coefficient_05_0419
        ep_Q2_024_generator_05_0400_0497 =
      ep_Q2_024_partial_05_0419 := by
  native_decide

/-- Coefficient term 420 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0420 : Poly :=
[
  term ((-5895490980511794805588325849139779196848 : Rat) / 1799564186103715944850040292044308901985) [(9, 1), (13, 1), (14, 1)]
]

/-- Partial product 420 for generator 5. -/
def ep_Q2_024_partial_05_0420 : Poly :=
[
  term ((-5895490980511794805588325849139779196848 : Rat) / 1799564186103715944850040292044308901985) [(2, 2), (9, 1), (13, 1), (14, 1)],
  term ((-5895490980511794805588325849139779196848 : Rat) / 1799564186103715944850040292044308901985) [(3, 2), (9, 1), (13, 1), (14, 1)],
  term ((5895490980511794805588325849139779196848 : Rat) / 1799564186103715944850040292044308901985) [(9, 1), (13, 1), (14, 1), (15, 2)],
  term ((5895490980511794805588325849139779196848 : Rat) / 1799564186103715944850040292044308901985) [(9, 1), (13, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 420 for generator 5. -/
theorem ep_Q2_024_partial_05_0420_valid :
    mulPoly ep_Q2_024_coefficient_05_0420
        ep_Q2_024_generator_05_0400_0497 =
      ep_Q2_024_partial_05_0420 := by
  native_decide

/-- Coefficient term 421 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0421 : Poly :=
[
  term ((-7955340525129521487200537598531733904 : Rat) / 199951576233746216094448921338256544665) [(9, 1), (13, 1), (14, 2)]
]

/-- Partial product 421 for generator 5. -/
def ep_Q2_024_partial_05_0421 : Poly :=
[
  term ((-7955340525129521487200537598531733904 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (9, 1), (13, 1), (14, 2)],
  term ((-7955340525129521487200537598531733904 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (9, 1), (13, 1), (14, 2)],
  term ((7955340525129521487200537598531733904 : Rat) / 199951576233746216094448921338256544665) [(9, 1), (13, 1), (14, 2), (15, 2)],
  term ((7955340525129521487200537598531733904 : Rat) / 199951576233746216094448921338256544665) [(9, 1), (13, 1), (14, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 421 for generator 5. -/
theorem ep_Q2_024_partial_05_0421_valid :
    mulPoly ep_Q2_024_coefficient_05_0421
        ep_Q2_024_generator_05_0400_0497 =
      ep_Q2_024_partial_05_0421 := by
  native_decide

/-- Coefficient term 422 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0422 : Poly :=
[
  term ((9923301900547485840918460892701746017973251184532248416 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 1), (13, 1), (15, 2)]
]

/-- Partial product 422 for generator 5. -/
def ep_Q2_024_partial_05_0422 : Poly :=
[
  term ((9923301900547485840918460892701746017973251184532248416 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 2), (9, 1), (13, 1), (15, 2)],
  term ((9923301900547485840918460892701746017973251184532248416 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 2), (9, 1), (13, 1), (15, 2)],
  term ((-9923301900547485840918460892701746017973251184532248416 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 1), (13, 1), (14, 2), (15, 2)],
  term ((-9923301900547485840918460892701746017973251184532248416 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 1), (13, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 422 for generator 5. -/
theorem ep_Q2_024_partial_05_0422_valid :
    mulPoly ep_Q2_024_coefficient_05_0422
        ep_Q2_024_generator_05_0400_0497 =
      ep_Q2_024_partial_05_0422 := by
  native_decide

/-- Coefficient term 423 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0423 : Poly :=
[
  term ((-2498215589172928 : Rat) / 1162780221153193) [(9, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 423 for generator 5. -/
def ep_Q2_024_partial_05_0423 : Poly :=
[
  term ((-2498215589172928 : Rat) / 1162780221153193) [(2, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2498215589172928 : Rat) / 1162780221153193) [(3, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((2498215589172928 : Rat) / 1162780221153193) [(9, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((2498215589172928 : Rat) / 1162780221153193) [(9, 1), (13, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 423 for generator 5. -/
theorem ep_Q2_024_partial_05_0423_valid :
    mulPoly ep_Q2_024_coefficient_05_0423
        ep_Q2_024_generator_05_0400_0497 =
      ep_Q2_024_partial_05_0423 := by
  native_decide

/-- Coefficient term 424 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0424 : Poly :=
[
  term ((103950836548178351367830748123952060736 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (13, 2), (15, 1)]
]

/-- Partial product 424 for generator 5. -/
def ep_Q2_024_partial_05_0424 : Poly :=
[
  term ((103950836548178351367830748123952060736 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (9, 1), (13, 2), (15, 1)],
  term ((103950836548178351367830748123952060736 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (9, 1), (13, 2), (15, 1)],
  term ((-103950836548178351367830748123952060736 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (13, 2), (14, 2), (15, 1)],
  term ((-103950836548178351367830748123952060736 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (13, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 424 for generator 5. -/
theorem ep_Q2_024_partial_05_0424_valid :
    mulPoly ep_Q2_024_coefficient_05_0424
        ep_Q2_024_generator_05_0400_0497 =
      ep_Q2_024_partial_05_0424 := by
  native_decide

/-- Coefficient term 425 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0425 : Poly :=
[
  term ((-110088994381681774001089747653480182916443815709101505167 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(9, 1), (14, 1), (15, 1)]
]

/-- Partial product 425 for generator 5. -/
def ep_Q2_024_partial_05_0425 : Poly :=
[
  term ((-110088994381681774001089747653480182916443815709101505167 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(2, 2), (9, 1), (14, 1), (15, 1)],
  term ((-110088994381681774001089747653480182916443815709101505167 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(3, 2), (9, 1), (14, 1), (15, 1)],
  term ((110088994381681774001089747653480182916443815709101505167 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(9, 1), (14, 1), (15, 3)],
  term ((110088994381681774001089747653480182916443815709101505167 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(9, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 425 for generator 5. -/
theorem ep_Q2_024_partial_05_0425_valid :
    mulPoly ep_Q2_024_coefficient_05_0425
        ep_Q2_024_generator_05_0400_0497 =
      ep_Q2_024_partial_05_0425 := by
  native_decide

/-- Coefficient term 426 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0426 : Poly :=
[
  term ((-68747841827265385 : Rat) / 13953362653838316) [(9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 426 for generator 5. -/
def ep_Q2_024_partial_05_0426 : Poly :=
[
  term ((-68747841827265385 : Rat) / 13953362653838316) [(2, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-68747841827265385 : Rat) / 13953362653838316) [(3, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((68747841827265385 : Rat) / 13953362653838316) [(9, 1), (14, 1), (15, 3), (16, 1)],
  term ((68747841827265385 : Rat) / 13953362653838316) [(9, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 426 for generator 5. -/
theorem ep_Q2_024_partial_05_0426_valid :
    mulPoly ep_Q2_024_coefficient_05_0426
        ep_Q2_024_generator_05_0400_0497 =
      ep_Q2_024_partial_05_0426 := by
  native_decide

/-- Coefficient term 427 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0427 : Poly :=
[
  term ((-548436437104013029395802573052341021758462188035905339 : Rat) / 232499738033004954626193357709066474366836605811865345) [(9, 1), (14, 2), (15, 1)]
]

/-- Partial product 427 for generator 5. -/
def ep_Q2_024_partial_05_0427 : Poly :=
[
  term ((-548436437104013029395802573052341021758462188035905339 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 2), (9, 1), (14, 2), (15, 1)],
  term ((-548436437104013029395802573052341021758462188035905339 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 2), (9, 1), (14, 2), (15, 1)],
  term ((548436437104013029395802573052341021758462188035905339 : Rat) / 232499738033004954626193357709066474366836605811865345) [(9, 1), (14, 2), (15, 3)],
  term ((548436437104013029395802573052341021758462188035905339 : Rat) / 232499738033004954626193357709066474366836605811865345) [(9, 1), (14, 4), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 427 for generator 5. -/
theorem ep_Q2_024_partial_05_0427_valid :
    mulPoly ep_Q2_024_coefficient_05_0427
        ep_Q2_024_generator_05_0400_0497 =
      ep_Q2_024_partial_05_0427 := by
  native_decide

/-- Coefficient term 428 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0428 : Poly :=
[
  term ((1041537767813708 : Rat) / 1162780221153193) [(9, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 428 for generator 5. -/
def ep_Q2_024_partial_05_0428 : Poly :=
[
  term ((1041537767813708 : Rat) / 1162780221153193) [(2, 2), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((1041537767813708 : Rat) / 1162780221153193) [(3, 2), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1041537767813708 : Rat) / 1162780221153193) [(9, 1), (14, 2), (15, 3), (16, 1)],
  term ((-1041537767813708 : Rat) / 1162780221153193) [(9, 1), (14, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 428 for generator 5. -/
theorem ep_Q2_024_partial_05_0428_valid :
    mulPoly ep_Q2_024_coefficient_05_0428
        ep_Q2_024_generator_05_0400_0497 =
      ep_Q2_024_partial_05_0428 := by
  native_decide

/-- Coefficient term 429 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0429 : Poly :=
[
  term ((-397295641880784247508347219842045668316341654816422090055 : Rat) / 13391984910701085386468737404042228923529788494763443872) [(9, 1), (15, 1)]
]

/-- Partial product 429 for generator 5. -/
def ep_Q2_024_partial_05_0429 : Poly :=
[
  term ((-397295641880784247508347219842045668316341654816422090055 : Rat) / 13391984910701085386468737404042228923529788494763443872) [(2, 2), (9, 1), (15, 1)],
  term ((-397295641880784247508347219842045668316341654816422090055 : Rat) / 13391984910701085386468737404042228923529788494763443872) [(3, 2), (9, 1), (15, 1)],
  term ((397295641880784247508347219842045668316341654816422090055 : Rat) / 13391984910701085386468737404042228923529788494763443872) [(9, 1), (14, 2), (15, 1)],
  term ((397295641880784247508347219842045668316341654816422090055 : Rat) / 13391984910701085386468737404042228923529788494763443872) [(9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 429 for generator 5. -/
theorem ep_Q2_024_partial_05_0429_valid :
    mulPoly ep_Q2_024_coefficient_05_0429
        ep_Q2_024_generator_05_0400_0497 =
      ep_Q2_024_partial_05_0429 := by
  native_decide

/-- Coefficient term 430 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0430 : Poly :=
[
  term ((-20946044051252447 : Rat) / 27906725307676632) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 430 for generator 5. -/
def ep_Q2_024_partial_05_0430 : Poly :=
[
  term ((-20946044051252447 : Rat) / 27906725307676632) [(2, 2), (9, 1), (15, 1), (16, 1)],
  term ((-20946044051252447 : Rat) / 27906725307676632) [(3, 2), (9, 1), (15, 1), (16, 1)],
  term ((20946044051252447 : Rat) / 27906725307676632) [(9, 1), (14, 2), (15, 1), (16, 1)],
  term ((20946044051252447 : Rat) / 27906725307676632) [(9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 430 for generator 5. -/
theorem ep_Q2_024_partial_05_0430_valid :
    mulPoly ep_Q2_024_coefficient_05_0430
        ep_Q2_024_generator_05_0400_0497 =
      ep_Q2_024_partial_05_0430 := by
  native_decide

/-- Coefficient term 431 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0431 : Poly :=
[
  term ((-2488379973681280850295504409161390030016648051801582732 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 1), (15, 3)]
]

/-- Partial product 431 for generator 5. -/
def ep_Q2_024_partial_05_0431 : Poly :=
[
  term ((-2488379973681280850295504409161390030016648051801582732 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 2), (9, 1), (15, 3)],
  term ((-2488379973681280850295504409161390030016648051801582732 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 2), (9, 1), (15, 3)],
  term ((2488379973681280850295504409161390030016648051801582732 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 1), (14, 2), (15, 3)],
  term ((2488379973681280850295504409161390030016648051801582732 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 1), (15, 5)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 431 for generator 5. -/
theorem ep_Q2_024_partial_05_0431_valid :
    mulPoly ep_Q2_024_coefficient_05_0431
        ep_Q2_024_generator_05_0400_0497 =
      ep_Q2_024_partial_05_0431 := by
  native_decide

/-- Coefficient term 432 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0432 : Poly :=
[
  term ((624553897293232 : Rat) / 1162780221153193) [(9, 1), (15, 3), (16, 1)]
]

/-- Partial product 432 for generator 5. -/
def ep_Q2_024_partial_05_0432 : Poly :=
[
  term ((624553897293232 : Rat) / 1162780221153193) [(2, 2), (9, 1), (15, 3), (16, 1)],
  term ((624553897293232 : Rat) / 1162780221153193) [(3, 2), (9, 1), (15, 3), (16, 1)],
  term ((-624553897293232 : Rat) / 1162780221153193) [(9, 1), (14, 2), (15, 3), (16, 1)],
  term ((-624553897293232 : Rat) / 1162780221153193) [(9, 1), (15, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 432 for generator 5. -/
theorem ep_Q2_024_partial_05_0432_valid :
    mulPoly ep_Q2_024_coefficient_05_0432
        ep_Q2_024_generator_05_0400_0497 =
      ep_Q2_024_partial_05_0432 := by
  native_decide

/-- Coefficient term 433 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0433 : Poly :=
[
  term ((-170572344013320366183864099443365560581 : Rat) / 39990315246749243218889784267651308933) [(9, 2)]
]

/-- Partial product 433 for generator 5. -/
def ep_Q2_024_partial_05_0433 : Poly :=
[
  term ((-170572344013320366183864099443365560581 : Rat) / 39990315246749243218889784267651308933) [(2, 2), (9, 2)],
  term ((-170572344013320366183864099443365560581 : Rat) / 39990315246749243218889784267651308933) [(3, 2), (9, 2)],
  term ((170572344013320366183864099443365560581 : Rat) / 39990315246749243218889784267651308933) [(9, 2), (14, 2)],
  term ((170572344013320366183864099443365560581 : Rat) / 39990315246749243218889784267651308933) [(9, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 433 for generator 5. -/
theorem ep_Q2_024_partial_05_0433_valid :
    mulPoly ep_Q2_024_coefficient_05_0433
        ep_Q2_024_generator_05_0400_0497 =
      ep_Q2_024_partial_05_0433 := by
  native_decide

/-- Coefficient term 434 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0434 : Poly :=
[
  term ((-78274801493699222926203641708507255904 : Rat) / 199951576233746216094448921338256544665) [(9, 2), (11, 1), (13, 1)]
]

/-- Partial product 434 for generator 5. -/
def ep_Q2_024_partial_05_0434 : Poly :=
[
  term ((-78274801493699222926203641708507255904 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (9, 2), (11, 1), (13, 1)],
  term ((-78274801493699222926203641708507255904 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (9, 2), (11, 1), (13, 1)],
  term ((78274801493699222926203641708507255904 : Rat) / 199951576233746216094448921338256544665) [(9, 2), (11, 1), (13, 1), (14, 2)],
  term ((78274801493699222926203641708507255904 : Rat) / 199951576233746216094448921338256544665) [(9, 2), (11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 434 for generator 5. -/
theorem ep_Q2_024_partial_05_0434_valid :
    mulPoly ep_Q2_024_coefficient_05_0434
        ep_Q2_024_generator_05_0400_0497 =
      ep_Q2_024_partial_05_0434 := by
  native_decide

/-- Coefficient term 435 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0435 : Poly :=
[
  term ((303602244700389938148400060577022883753307671413680815 : Rat) / 139499842819802972775716014625439884620101963487119207) [(9, 2), (11, 1), (15, 1)]
]

/-- Partial product 435 for generator 5. -/
def ep_Q2_024_partial_05_0435 : Poly :=
[
  term ((303602244700389938148400060577022883753307671413680815 : Rat) / 139499842819802972775716014625439884620101963487119207) [(2, 2), (9, 2), (11, 1), (15, 1)],
  term ((303602244700389938148400060577022883753307671413680815 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 2), (9, 2), (11, 1), (15, 1)],
  term ((-303602244700389938148400060577022883753307671413680815 : Rat) / 139499842819802972775716014625439884620101963487119207) [(9, 2), (11, 1), (14, 2), (15, 1)],
  term ((-303602244700389938148400060577022883753307671413680815 : Rat) / 139499842819802972775716014625439884620101963487119207) [(9, 2), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 435 for generator 5. -/
theorem ep_Q2_024_partial_05_0435_valid :
    mulPoly ep_Q2_024_coefficient_05_0435
        ep_Q2_024_generator_05_0400_0497 =
      ep_Q2_024_partial_05_0435 := by
  native_decide

/-- Coefficient term 436 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0436 : Poly :=
[
  term ((-747574224772468 : Rat) / 1162780221153193) [(9, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 436 for generator 5. -/
def ep_Q2_024_partial_05_0436 : Poly :=
[
  term ((-747574224772468 : Rat) / 1162780221153193) [(2, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-747574224772468 : Rat) / 1162780221153193) [(3, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((747574224772468 : Rat) / 1162780221153193) [(9, 2), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((747574224772468 : Rat) / 1162780221153193) [(9, 2), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 436 for generator 5. -/
theorem ep_Q2_024_partial_05_0436_valid :
    mulPoly ep_Q2_024_coefficient_05_0436
        ep_Q2_024_generator_05_0400_0497 =
      ep_Q2_024_partial_05_0436 := by
  native_decide

/-- Coefficient term 437 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0437 : Poly :=
[
  term ((625790500700729343046154158325193498956 : Rat) / 199951576233746216094448921338256544665) [(9, 2), (12, 1)]
]

/-- Partial product 437 for generator 5. -/
def ep_Q2_024_partial_05_0437 : Poly :=
[
  term ((625790500700729343046154158325193498956 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (9, 2), (12, 1)],
  term ((625790500700729343046154158325193498956 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (9, 2), (12, 1)],
  term ((-625790500700729343046154158325193498956 : Rat) / 199951576233746216094448921338256544665) [(9, 2), (12, 1), (14, 2)],
  term ((-625790500700729343046154158325193498956 : Rat) / 199951576233746216094448921338256544665) [(9, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 437 for generator 5. -/
theorem ep_Q2_024_partial_05_0437_valid :
    mulPoly ep_Q2_024_coefficient_05_0437
        ep_Q2_024_generator_05_0400_0497 =
      ep_Q2_024_partial_05_0437 := by
  native_decide

/-- Coefficient term 438 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0438 : Poly :=
[
  term ((-22781842421239888050827574144720565148 : Rat) / 3389009766673664679566930870139941435) [(9, 2), (14, 1)]
]

/-- Partial product 438 for generator 5. -/
def ep_Q2_024_partial_05_0438 : Poly :=
[
  term ((-22781842421239888050827574144720565148 : Rat) / 3389009766673664679566930870139941435) [(2, 2), (9, 2), (14, 1)],
  term ((-22781842421239888050827574144720565148 : Rat) / 3389009766673664679566930870139941435) [(3, 2), (9, 2), (14, 1)],
  term ((22781842421239888050827574144720565148 : Rat) / 3389009766673664679566930870139941435) [(9, 2), (14, 1), (15, 2)],
  term ((22781842421239888050827574144720565148 : Rat) / 3389009766673664679566930870139941435) [(9, 2), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 438 for generator 5. -/
theorem ep_Q2_024_partial_05_0438_valid :
    mulPoly ep_Q2_024_coefficient_05_0438
        ep_Q2_024_generator_05_0400_0497 =
      ep_Q2_024_partial_05_0438 := by
  native_decide

/-- Coefficient term 439 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0439 : Poly :=
[
  term ((-63112532186469946331305143931700421056 : Rat) / 199951576233746216094448921338256544665) [(9, 3), (11, 1)]
]

/-- Partial product 439 for generator 5. -/
def ep_Q2_024_partial_05_0439 : Poly :=
[
  term ((-63112532186469946331305143931700421056 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (9, 3), (11, 1)],
  term ((-63112532186469946331305143931700421056 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (9, 3), (11, 1)],
  term ((63112532186469946331305143931700421056 : Rat) / 199951576233746216094448921338256544665) [(9, 3), (11, 1), (14, 2)],
  term ((63112532186469946331305143931700421056 : Rat) / 199951576233746216094448921338256544665) [(9, 3), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 439 for generator 5. -/
theorem ep_Q2_024_partial_05_0439_valid :
    mulPoly ep_Q2_024_coefficient_05_0439
        ep_Q2_024_generator_05_0400_0497 =
      ep_Q2_024_partial_05_0439 := by
  native_decide

/-- Coefficient term 440 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0440 : Poly :=
[
  term ((316353002527898531835282773808724949038 : Rat) / 199951576233746216094448921338256544665) [(11, 1), (12, 1), (13, 1)]
]

/-- Partial product 440 for generator 5. -/
def ep_Q2_024_partial_05_0440 : Poly :=
[
  term ((316353002527898531835282773808724949038 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (11, 1), (12, 1), (13, 1)],
  term ((316353002527898531835282773808724949038 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (11, 1), (12, 1), (13, 1)],
  term ((-316353002527898531835282773808724949038 : Rat) / 199951576233746216094448921338256544665) [(11, 1), (12, 1), (13, 1), (14, 2)],
  term ((-316353002527898531835282773808724949038 : Rat) / 199951576233746216094448921338256544665) [(11, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 440 for generator 5. -/
theorem ep_Q2_024_partial_05_0440_valid :
    mulPoly ep_Q2_024_coefficient_05_0440
        ep_Q2_024_generator_05_0400_0497 =
      ep_Q2_024_partial_05_0440 := by
  native_decide

/-- Coefficient term 441 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0441 : Poly :=
[
  term ((-19768893485083958971076886544613861104 : Rat) / 599854728701238648283346764014769633995) [(11, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 441 for generator 5. -/
def ep_Q2_024_partial_05_0441 : Poly :=
[
  term ((-19768893485083958971076886544613861104 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-19768893485083958971076886544613861104 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((19768893485083958971076886544613861104 : Rat) / 599854728701238648283346764014769633995) [(11, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((19768893485083958971076886544613861104 : Rat) / 599854728701238648283346764014769633995) [(11, 1), (12, 1), (13, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 441 for generator 5. -/
theorem ep_Q2_024_partial_05_0441_valid :
    mulPoly ep_Q2_024_coefficient_05_0441
        ep_Q2_024_generator_05_0400_0497 =
      ep_Q2_024_partial_05_0441 := by
  native_decide

/-- Coefficient term 442 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0442 : Poly :=
[
  term ((-3112802776304060341198986185252181743629064431456884731 : Rat) / 697499214099014863878580073127199423100509817435596035) [(11, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 442 for generator 5. -/
def ep_Q2_024_partial_05_0442 : Poly :=
[
  term ((-3112802776304060341198986185252181743629064431456884731 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-3112802776304060341198986185252181743629064431456884731 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((3112802776304060341198986185252181743629064431456884731 : Rat) / 697499214099014863878580073127199423100509817435596035) [(11, 1), (12, 1), (14, 1), (15, 3)],
  term ((3112802776304060341198986185252181743629064431456884731 : Rat) / 697499214099014863878580073127199423100509817435596035) [(11, 1), (12, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 442 for generator 5. -/
theorem ep_Q2_024_partial_05_0442_valid :
    mulPoly ep_Q2_024_coefficient_05_0442
        ep_Q2_024_generator_05_0400_0497 =
      ep_Q2_024_partial_05_0442 := by
  native_decide

/-- Coefficient term 443 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0443 : Poly :=
[
  term ((2569183513052036 : Rat) / 1162780221153193) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 443 for generator 5. -/
def ep_Q2_024_partial_05_0443 : Poly :=
[
  term ((2569183513052036 : Rat) / 1162780221153193) [(2, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((2569183513052036 : Rat) / 1162780221153193) [(3, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2569183513052036 : Rat) / 1162780221153193) [(11, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((-2569183513052036 : Rat) / 1162780221153193) [(11, 1), (12, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 443 for generator 5. -/
theorem ep_Q2_024_partial_05_0443_valid :
    mulPoly ep_Q2_024_coefficient_05_0443
        ep_Q2_024_generator_05_0400_0497 =
      ep_Q2_024_partial_05_0443 := by
  native_decide

/-- Coefficient term 444 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0444 : Poly :=
[
  term ((-75986013507316469500030836804192564809868316919394187633 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(11, 1), (12, 1), (15, 1)]
]

/-- Partial product 444 for generator 5. -/
def ep_Q2_024_partial_05_0444 : Poly :=
[
  term ((-75986013507316469500030836804192564809868316919394187633 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(2, 2), (11, 1), (12, 1), (15, 1)],
  term ((-75986013507316469500030836804192564809868316919394187633 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(3, 2), (11, 1), (12, 1), (15, 1)],
  term ((75986013507316469500030836804192564809868316919394187633 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(11, 1), (12, 1), (14, 2), (15, 1)],
  term ((75986013507316469500030836804192564809868316919394187633 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(11, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 444 for generator 5. -/
theorem ep_Q2_024_partial_05_0444_valid :
    mulPoly ep_Q2_024_coefficient_05_0444
        ep_Q2_024_generator_05_0400_0497 =
      ep_Q2_024_partial_05_0444 := by
  native_decide

/-- Coefficient term 445 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0445 : Poly :=
[
  term ((8919896007320729 : Rat) / 2325560442306386) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 445 for generator 5. -/
def ep_Q2_024_partial_05_0445 : Poly :=
[
  term ((8919896007320729 : Rat) / 2325560442306386) [(2, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((8919896007320729 : Rat) / 2325560442306386) [(3, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-8919896007320729 : Rat) / 2325560442306386) [(11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-8919896007320729 : Rat) / 2325560442306386) [(11, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 445 for generator 5. -/
theorem ep_Q2_024_partial_05_0445_valid :
    mulPoly ep_Q2_024_coefficient_05_0445
        ep_Q2_024_generator_05_0400_0497 =
      ep_Q2_024_partial_05_0445 := by
  native_decide

/-- Coefficient term 446 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0446 : Poly :=
[
  term ((-27446091065794070460051699491540582992 : Rat) / 39990315246749243218889784267651308933) [(11, 1), (12, 2), (13, 1)]
]

/-- Partial product 446 for generator 5. -/
def ep_Q2_024_partial_05_0446 : Poly :=
[
  term ((-27446091065794070460051699491540582992 : Rat) / 39990315246749243218889784267651308933) [(2, 2), (11, 1), (12, 2), (13, 1)],
  term ((-27446091065794070460051699491540582992 : Rat) / 39990315246749243218889784267651308933) [(3, 2), (11, 1), (12, 2), (13, 1)],
  term ((27446091065794070460051699491540582992 : Rat) / 39990315246749243218889784267651308933) [(11, 1), (12, 2), (13, 1), (14, 2)],
  term ((27446091065794070460051699491540582992 : Rat) / 39990315246749243218889784267651308933) [(11, 1), (12, 2), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 446 for generator 5. -/
theorem ep_Q2_024_partial_05_0446_valid :
    mulPoly ep_Q2_024_coefficient_05_0446
        ep_Q2_024_generator_05_0400_0497 =
      ep_Q2_024_partial_05_0446 := by
  native_decide

/-- Coefficient term 447 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0447 : Poly :=
[
  term ((3601386516084175685679144962688602785400235238249493976 : Rat) / 232499738033004954626193357709066474366836605811865345) [(11, 1), (12, 2), (15, 1)]
]

/-- Partial product 447 for generator 5. -/
def ep_Q2_024_partial_05_0447 : Poly :=
[
  term ((3601386516084175685679144962688602785400235238249493976 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 2), (11, 1), (12, 2), (15, 1)],
  term ((3601386516084175685679144962688602785400235238249493976 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 2), (11, 1), (12, 2), (15, 1)],
  term ((-3601386516084175685679144962688602785400235238249493976 : Rat) / 232499738033004954626193357709066474366836605811865345) [(11, 1), (12, 2), (14, 2), (15, 1)],
  term ((-3601386516084175685679144962688602785400235238249493976 : Rat) / 232499738033004954626193357709066474366836605811865345) [(11, 1), (12, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 447 for generator 5. -/
theorem ep_Q2_024_partial_05_0447_valid :
    mulPoly ep_Q2_024_coefficient_05_0447
        ep_Q2_024_generator_05_0400_0497 =
      ep_Q2_024_partial_05_0447 := by
  native_decide

/-- Coefficient term 448 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0448 : Poly :=
[
  term ((-1758553647569664 : Rat) / 1162780221153193) [(11, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 448 for generator 5. -/
def ep_Q2_024_partial_05_0448 : Poly :=
[
  term ((-1758553647569664 : Rat) / 1162780221153193) [(2, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1758553647569664 : Rat) / 1162780221153193) [(3, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((1758553647569664 : Rat) / 1162780221153193) [(11, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((1758553647569664 : Rat) / 1162780221153193) [(11, 1), (12, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 448 for generator 5. -/
theorem ep_Q2_024_partial_05_0448_valid :
    mulPoly ep_Q2_024_coefficient_05_0448
        ep_Q2_024_generator_05_0400_0497 =
      ep_Q2_024_partial_05_0448 := by
  native_decide

/-- Coefficient term 449 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0449 : Poly :=
[
  term ((-296378677015613838257420355009770391884 : Rat) / 599854728701238648283346764014769633995) [(11, 1), (13, 1)]
]

/-- Partial product 449 for generator 5. -/
def ep_Q2_024_partial_05_0449 : Poly :=
[
  term ((-296378677015613838257420355009770391884 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (11, 1), (13, 1)],
  term ((-296378677015613838257420355009770391884 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (11, 1), (13, 1)],
  term ((296378677015613838257420355009770391884 : Rat) / 599854728701238648283346764014769633995) [(11, 1), (13, 1), (14, 2)],
  term ((296378677015613838257420355009770391884 : Rat) / 599854728701238648283346764014769633995) [(11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 449 for generator 5. -/
theorem ep_Q2_024_partial_05_0449_valid :
    mulPoly ep_Q2_024_coefficient_05_0449
        ep_Q2_024_generator_05_0400_0497 =
      ep_Q2_024_partial_05_0449 := by
  native_decide

/-- Coefficient term 450 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0450 : Poly :=
[
  term ((-1243763130392125774176160097274830816 : Rat) / 119970945740247729656669352802953926799) [(11, 1), (13, 1), (14, 1)]
]

/-- Partial product 450 for generator 5. -/
def ep_Q2_024_partial_05_0450 : Poly :=
[
  term ((-1243763130392125774176160097274830816 : Rat) / 119970945740247729656669352802953926799) [(2, 2), (11, 1), (13, 1), (14, 1)],
  term ((-1243763130392125774176160097274830816 : Rat) / 119970945740247729656669352802953926799) [(3, 2), (11, 1), (13, 1), (14, 1)],
  term ((1243763130392125774176160097274830816 : Rat) / 119970945740247729656669352802953926799) [(11, 1), (13, 1), (14, 1), (15, 2)],
  term ((1243763130392125774176160097274830816 : Rat) / 119970945740247729656669352802953926799) [(11, 1), (13, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 450 for generator 5. -/
theorem ep_Q2_024_partial_05_0450_valid :
    mulPoly ep_Q2_024_coefficient_05_0450
        ep_Q2_024_generator_05_0400_0497 =
      ep_Q2_024_partial_05_0450 := by
  native_decide

/-- Coefficient term 451 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0451 : Poly :=
[
  term ((12993854568522293920978843515494007592 : Rat) / 599854728701238648283346764014769633995) [(11, 1), (13, 1), (14, 2)]
]

/-- Partial product 451 for generator 5. -/
def ep_Q2_024_partial_05_0451 : Poly :=
[
  term ((12993854568522293920978843515494007592 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (11, 1), (13, 1), (14, 2)],
  term ((12993854568522293920978843515494007592 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (11, 1), (13, 1), (14, 2)],
  term ((-12993854568522293920978843515494007592 : Rat) / 599854728701238648283346764014769633995) [(11, 1), (13, 1), (14, 2), (15, 2)],
  term ((-12993854568522293920978843515494007592 : Rat) / 599854728701238648283346764014769633995) [(11, 1), (13, 1), (14, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 451 for generator 5. -/
theorem ep_Q2_024_partial_05_0451_valid :
    mulPoly ep_Q2_024_coefficient_05_0451
        ep_Q2_024_generator_05_0400_0497 =
      ep_Q2_024_partial_05_0451 := by
  native_decide

/-- Coefficient term 452 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0452 : Poly :=
[
  term ((-23371209139876049838122935174066101654382896197870243282 : Rat) / 697499214099014863878580073127199423100509817435596035) [(11, 1), (13, 1), (15, 2)]
]

/-- Partial product 452 for generator 5. -/
def ep_Q2_024_partial_05_0452 : Poly :=
[
  term ((-23371209139876049838122935174066101654382896197870243282 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 2), (11, 1), (13, 1), (15, 2)],
  term ((-23371209139876049838122935174066101654382896197870243282 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 2), (11, 1), (13, 1), (15, 2)],
  term ((23371209139876049838122935174066101654382896197870243282 : Rat) / 697499214099014863878580073127199423100509817435596035) [(11, 1), (13, 1), (14, 2), (15, 2)],
  term ((23371209139876049838122935174066101654382896197870243282 : Rat) / 697499214099014863878580073127199423100509817435596035) [(11, 1), (13, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 452 for generator 5. -/
theorem ep_Q2_024_partial_05_0452_valid :
    mulPoly ep_Q2_024_coefficient_05_0452
        ep_Q2_024_generator_05_0400_0497 =
      ep_Q2_024_partial_05_0452 := by
  native_decide

/-- Coefficient term 453 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0453 : Poly :=
[
  term ((1582290915202104 : Rat) / 1162780221153193) [(11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 453 for generator 5. -/
def ep_Q2_024_partial_05_0453 : Poly :=
[
  term ((1582290915202104 : Rat) / 1162780221153193) [(2, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((1582290915202104 : Rat) / 1162780221153193) [(3, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1582290915202104 : Rat) / 1162780221153193) [(11, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-1582290915202104 : Rat) / 1162780221153193) [(11, 1), (13, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 453 for generator 5. -/
theorem ep_Q2_024_partial_05_0453_valid :
    mulPoly ep_Q2_024_coefficient_05_0453
        ep_Q2_024_generator_05_0400_0497 =
      ep_Q2_024_partial_05_0453 := by
  native_decide

/-- Coefficient term 454 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0454 : Poly :=
[
  term ((-83414854120226340010483951424171218528 : Rat) / 199951576233746216094448921338256544665) [(11, 1), (13, 2), (15, 1)]
]

/-- Partial product 454 for generator 5. -/
def ep_Q2_024_partial_05_0454 : Poly :=
[
  term ((-83414854120226340010483951424171218528 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (11, 1), (13, 2), (15, 1)],
  term ((-83414854120226340010483951424171218528 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (11, 1), (13, 2), (15, 1)],
  term ((83414854120226340010483951424171218528 : Rat) / 199951576233746216094448921338256544665) [(11, 1), (13, 2), (14, 2), (15, 1)],
  term ((83414854120226340010483951424171218528 : Rat) / 199951576233746216094448921338256544665) [(11, 1), (13, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 454 for generator 5. -/
theorem ep_Q2_024_partial_05_0454_valid :
    mulPoly ep_Q2_024_coefficient_05_0454
        ep_Q2_024_generator_05_0400_0497 =
      ep_Q2_024_partial_05_0454 := by
  native_decide

/-- Coefficient term 455 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0455 : Poly :=
[
  term ((624422802622779490903481776090791713612416379655301999 : Rat) / 697499214099014863878580073127199423100509817435596035) [(11, 1), (14, 1), (15, 1)]
]

/-- Partial product 455 for generator 5. -/
def ep_Q2_024_partial_05_0455 : Poly :=
[
  term ((624422802622779490903481776090791713612416379655301999 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 2), (11, 1), (14, 1), (15, 1)],
  term ((624422802622779490903481776090791713612416379655301999 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 2), (11, 1), (14, 1), (15, 1)],
  term ((-624422802622779490903481776090791713612416379655301999 : Rat) / 697499214099014863878580073127199423100509817435596035) [(11, 1), (14, 1), (15, 3)],
  term ((-624422802622779490903481776090791713612416379655301999 : Rat) / 697499214099014863878580073127199423100509817435596035) [(11, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 455 for generator 5. -/
theorem ep_Q2_024_partial_05_0455_valid :
    mulPoly ep_Q2_024_coefficient_05_0455
        ep_Q2_024_generator_05_0400_0497 =
      ep_Q2_024_partial_05_0455 := by
  native_decide

/-- Coefficient term 456 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0456 : Poly :=
[
  term ((-1944629615758804 : Rat) / 1162780221153193) [(11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 456 for generator 5. -/
def ep_Q2_024_partial_05_0456 : Poly :=
[
  term ((-1944629615758804 : Rat) / 1162780221153193) [(2, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1944629615758804 : Rat) / 1162780221153193) [(3, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((1944629615758804 : Rat) / 1162780221153193) [(11, 1), (14, 1), (15, 3), (16, 1)],
  term ((1944629615758804 : Rat) / 1162780221153193) [(11, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 456 for generator 5. -/
theorem ep_Q2_024_partial_05_0456_valid :
    mulPoly ep_Q2_024_coefficient_05_0456
        ep_Q2_024_generator_05_0400_0497 =
      ep_Q2_024_partial_05_0456 := by
  native_decide

/-- Coefficient term 457 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0457 : Poly :=
[
  term ((1244189986840640425147752204580695015008324025900791366 : Rat) / 697499214099014863878580073127199423100509817435596035) [(11, 1), (14, 2), (15, 1)]
]

/-- Partial product 457 for generator 5. -/
def ep_Q2_024_partial_05_0457 : Poly :=
[
  term ((1244189986840640425147752204580695015008324025900791366 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 2), (11, 1), (14, 2), (15, 1)],
  term ((1244189986840640425147752204580695015008324025900791366 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 2), (11, 1), (14, 2), (15, 1)],
  term ((-1244189986840640425147752204580695015008324025900791366 : Rat) / 697499214099014863878580073127199423100509817435596035) [(11, 1), (14, 2), (15, 3)],
  term ((-1244189986840640425147752204580695015008324025900791366 : Rat) / 697499214099014863878580073127199423100509817435596035) [(11, 1), (14, 4), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 457 for generator 5. -/
theorem ep_Q2_024_partial_05_0457_valid :
    mulPoly ep_Q2_024_coefficient_05_0457
        ep_Q2_024_generator_05_0400_0497 =
      ep_Q2_024_partial_05_0457 := by
  native_decide

/-- Coefficient term 458 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0458 : Poly :=
[
  term ((-312276948646616 : Rat) / 1162780221153193) [(11, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 458 for generator 5. -/
def ep_Q2_024_partial_05_0458 : Poly :=
[
  term ((-312276948646616 : Rat) / 1162780221153193) [(2, 2), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-312276948646616 : Rat) / 1162780221153193) [(3, 2), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((312276948646616 : Rat) / 1162780221153193) [(11, 1), (14, 2), (15, 3), (16, 1)],
  term ((312276948646616 : Rat) / 1162780221153193) [(11, 1), (14, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 458 for generator 5. -/
theorem ep_Q2_024_partial_05_0458_valid :
    mulPoly ep_Q2_024_coefficient_05_0458
        ep_Q2_024_generator_05_0400_0497 =
      ep_Q2_024_partial_05_0458 := by
  native_decide

/-- Coefficient term 459 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0459 : Poly :=
[
  term ((149792142705915831920758855564688053770583374272013304973 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(11, 1), (15, 1)]
]

/-- Partial product 459 for generator 5. -/
def ep_Q2_024_partial_05_0459 : Poly :=
[
  term ((149792142705915831920758855564688053770583374272013304973 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(2, 2), (11, 1), (15, 1)],
  term ((149792142705915831920758855564688053770583374272013304973 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(3, 2), (11, 1), (15, 1)],
  term ((-149792142705915831920758855564688053770583374272013304973 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(11, 1), (14, 2), (15, 1)],
  term ((-149792142705915831920758855564688053770583374272013304973 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 459 for generator 5. -/
theorem ep_Q2_024_partial_05_0459_valid :
    mulPoly ep_Q2_024_coefficient_05_0459
        ep_Q2_024_generator_05_0400_0497 =
      ep_Q2_024_partial_05_0459 := by
  native_decide

/-- Coefficient term 460 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0460 : Poly :=
[
  term ((-6235834544734871 : Rat) / 2325560442306386) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 460 for generator 5. -/
def ep_Q2_024_partial_05_0460 : Poly :=
[
  term ((-6235834544734871 : Rat) / 2325560442306386) [(2, 2), (11, 1), (15, 1), (16, 1)],
  term ((-6235834544734871 : Rat) / 2325560442306386) [(3, 2), (11, 1), (15, 1), (16, 1)],
  term ((6235834544734871 : Rat) / 2325560442306386) [(11, 1), (14, 2), (15, 1), (16, 1)],
  term ((6235834544734871 : Rat) / 2325560442306386) [(11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 460 for generator 5. -/
theorem ep_Q2_024_partial_05_0460_valid :
    mulPoly ep_Q2_024_coefficient_05_0460
        ep_Q2_024_generator_05_0400_0497 =
      ep_Q2_024_partial_05_0460 := by
  native_decide

/-- Coefficient term 461 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0461 : Poly :=
[
  term ((1244189986840640425147752204580695015008324025900791366 : Rat) / 697499214099014863878580073127199423100509817435596035) [(11, 1), (15, 3)]
]

/-- Partial product 461 for generator 5. -/
def ep_Q2_024_partial_05_0461 : Poly :=
[
  term ((1244189986840640425147752204580695015008324025900791366 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 2), (11, 1), (15, 3)],
  term ((1244189986840640425147752204580695015008324025900791366 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 2), (11, 1), (15, 3)],
  term ((-1244189986840640425147752204580695015008324025900791366 : Rat) / 697499214099014863878580073127199423100509817435596035) [(11, 1), (14, 2), (15, 3)],
  term ((-1244189986840640425147752204580695015008324025900791366 : Rat) / 697499214099014863878580073127199423100509817435596035) [(11, 1), (15, 5)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 461 for generator 5. -/
theorem ep_Q2_024_partial_05_0461_valid :
    mulPoly ep_Q2_024_coefficient_05_0461
        ep_Q2_024_generator_05_0400_0497 =
      ep_Q2_024_partial_05_0461 := by
  native_decide

/-- Coefficient term 462 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0462 : Poly :=
[
  term ((-312276948646616 : Rat) / 1162780221153193) [(11, 1), (15, 3), (16, 1)]
]

/-- Partial product 462 for generator 5. -/
def ep_Q2_024_partial_05_0462 : Poly :=
[
  term ((-312276948646616 : Rat) / 1162780221153193) [(2, 2), (11, 1), (15, 3), (16, 1)],
  term ((-312276948646616 : Rat) / 1162780221153193) [(3, 2), (11, 1), (15, 3), (16, 1)],
  term ((312276948646616 : Rat) / 1162780221153193) [(11, 1), (14, 2), (15, 3), (16, 1)],
  term ((312276948646616 : Rat) / 1162780221153193) [(11, 1), (15, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 462 for generator 5. -/
theorem ep_Q2_024_partial_05_0462_valid :
    mulPoly ep_Q2_024_coefficient_05_0462
        ep_Q2_024_generator_05_0400_0497 =
      ep_Q2_024_partial_05_0462 := by
  native_decide

/-- Coefficient term 463 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0463 : Poly :=
[
  term ((-87483070406245862995382813691713434496 : Rat) / 599854728701238648283346764014769633995) [(11, 2), (13, 1), (15, 1)]
]

/-- Partial product 463 for generator 5. -/
def ep_Q2_024_partial_05_0463 : Poly :=
[
  term ((-87483070406245862995382813691713434496 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (11, 2), (13, 1), (15, 1)],
  term ((-87483070406245862995382813691713434496 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (11, 2), (13, 1), (15, 1)],
  term ((87483070406245862995382813691713434496 : Rat) / 599854728701238648283346764014769633995) [(11, 2), (13, 1), (14, 2), (15, 1)],
  term ((87483070406245862995382813691713434496 : Rat) / 599854728701238648283346764014769633995) [(11, 2), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 463 for generator 5. -/
theorem ep_Q2_024_partial_05_0463_valid :
    mulPoly ep_Q2_024_coefficient_05_0463
        ep_Q2_024_generator_05_0400_0497 =
      ep_Q2_024_partial_05_0463 := by
  native_decide

/-- Coefficient term 464 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0464 : Poly :=
[
  term ((-8088250242351929820163091804873870410062191739236192053 : Rat) / 697499214099014863878580073127199423100509817435596035) [(11, 2), (15, 2)]
]

/-- Partial product 464 for generator 5. -/
def ep_Q2_024_partial_05_0464 : Poly :=
[
  term ((-8088250242351929820163091804873870410062191739236192053 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 2), (11, 2), (15, 2)],
  term ((-8088250242351929820163091804873870410062191739236192053 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 2), (11, 2), (15, 2)],
  term ((8088250242351929820163091804873870410062191739236192053 : Rat) / 697499214099014863878580073127199423100509817435596035) [(11, 2), (14, 2), (15, 2)],
  term ((8088250242351929820163091804873870410062191739236192053 : Rat) / 697499214099014863878580073127199423100509817435596035) [(11, 2), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 464 for generator 5. -/
theorem ep_Q2_024_partial_05_0464_valid :
    mulPoly ep_Q2_024_coefficient_05_0464
        ep_Q2_024_generator_05_0400_0497 =
      ep_Q2_024_partial_05_0464 := by
  native_decide

/-- Coefficient term 465 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0465 : Poly :=
[
  term ((-57972216906980 : Rat) / 1162780221153193) [(11, 2), (15, 2), (16, 1)]
]

/-- Partial product 465 for generator 5. -/
def ep_Q2_024_partial_05_0465 : Poly :=
[
  term ((-57972216906980 : Rat) / 1162780221153193) [(2, 2), (11, 2), (15, 2), (16, 1)],
  term ((-57972216906980 : Rat) / 1162780221153193) [(3, 2), (11, 2), (15, 2), (16, 1)],
  term ((57972216906980 : Rat) / 1162780221153193) [(11, 2), (14, 2), (15, 2), (16, 1)],
  term ((57972216906980 : Rat) / 1162780221153193) [(11, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 465 for generator 5. -/
theorem ep_Q2_024_partial_05_0465_valid :
    mulPoly ep_Q2_024_coefficient_05_0465
        ep_Q2_024_generator_05_0400_0497 =
      ep_Q2_024_partial_05_0465 := by
  native_decide

/-- Coefficient term 466 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0466 : Poly :=
[
  term ((99141020761620709838758816793105852819 : Rat) / 1199709457402477296566693528029539267990) [(12, 1)]
]

/-- Partial product 466 for generator 5. -/
def ep_Q2_024_partial_05_0466 : Poly :=
[
  term ((99141020761620709838758816793105852819 : Rat) / 1199709457402477296566693528029539267990) [(2, 2), (12, 1)],
  term ((99141020761620709838758816793105852819 : Rat) / 1199709457402477296566693528029539267990) [(3, 2), (12, 1)],
  term ((-99141020761620709838758816793105852819 : Rat) / 1199709457402477296566693528029539267990) [(12, 1), (14, 2)],
  term ((-99141020761620709838758816793105852819 : Rat) / 1199709457402477296566693528029539267990) [(12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 466 for generator 5. -/
theorem ep_Q2_024_partial_05_0466_valid :
    mulPoly ep_Q2_024_coefficient_05_0466
        ep_Q2_024_generator_05_0400_0497 =
      ep_Q2_024_partial_05_0466 := by
  native_decide

/-- Coefficient term 467 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0467 : Poly :=
[
  term ((-1604628961756923888281434680356854144 : Rat) / 39990315246749243218889784267651308933) [(12, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 467 for generator 5. -/
def ep_Q2_024_partial_05_0467 : Poly :=
[
  term ((-1604628961756923888281434680356854144 : Rat) / 39990315246749243218889784267651308933) [(2, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-1604628961756923888281434680356854144 : Rat) / 39990315246749243218889784267651308933) [(3, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((1604628961756923888281434680356854144 : Rat) / 39990315246749243218889784267651308933) [(12, 1), (13, 1), (14, 1), (15, 3)],
  term ((1604628961756923888281434680356854144 : Rat) / 39990315246749243218889784267651308933) [(12, 1), (13, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 467 for generator 5. -/
theorem ep_Q2_024_partial_05_0467_valid :
    mulPoly ep_Q2_024_coefficient_05_0467
        ep_Q2_024_generator_05_0400_0497 =
      ep_Q2_024_partial_05_0467 := by
  native_decide

/-- Coefficient term 468 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0468 : Poly :=
[
  term ((-13619839016680653425565021786594389739434802085427963077 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(12, 1), (13, 1), (15, 1)]
]

/-- Partial product 468 for generator 5. -/
def ep_Q2_024_partial_05_0468 : Poly :=
[
  term ((-13619839016680653425565021786594389739434802085427963077 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(2, 2), (12, 1), (13, 1), (15, 1)],
  term ((-13619839016680653425565021786594389739434802085427963077 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(3, 2), (12, 1), (13, 1), (15, 1)],
  term ((13619839016680653425565021786594389739434802085427963077 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(12, 1), (13, 1), (14, 2), (15, 1)],
  term ((13619839016680653425565021786594389739434802085427963077 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(12, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 468 for generator 5. -/
theorem ep_Q2_024_partial_05_0468_valid :
    mulPoly ep_Q2_024_coefficient_05_0468
        ep_Q2_024_generator_05_0400_0497 =
      ep_Q2_024_partial_05_0468 := by
  native_decide

/-- Coefficient term 469 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0469 : Poly :=
[
  term ((-2798779609083699 : Rat) / 2325560442306386) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 469 for generator 5. -/
def ep_Q2_024_partial_05_0469 : Poly :=
[
  term ((-2798779609083699 : Rat) / 2325560442306386) [(2, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2798779609083699 : Rat) / 2325560442306386) [(3, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((2798779609083699 : Rat) / 2325560442306386) [(12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((2798779609083699 : Rat) / 2325560442306386) [(12, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 469 for generator 5. -/
theorem ep_Q2_024_partial_05_0469_valid :
    mulPoly ep_Q2_024_coefficient_05_0469
        ep_Q2_024_generator_05_0400_0497 =
      ep_Q2_024_partial_05_0469 := by
  native_decide

/-- Coefficient term 470 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0470 : Poly :=
[
  term ((-240841702176304855609935555837304487782 : Rat) / 599854728701238648283346764014769633995) [(12, 1), (13, 2)]
]

/-- Partial product 470 for generator 5. -/
def ep_Q2_024_partial_05_0470 : Poly :=
[
  term ((-240841702176304855609935555837304487782 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (12, 1), (13, 2)],
  term ((-240841702176304855609935555837304487782 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (12, 1), (13, 2)],
  term ((240841702176304855609935555837304487782 : Rat) / 599854728701238648283346764014769633995) [(12, 1), (13, 2), (14, 2)],
  term ((240841702176304855609935555837304487782 : Rat) / 599854728701238648283346764014769633995) [(12, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 470 for generator 5. -/
theorem ep_Q2_024_partial_05_0470_valid :
    mulPoly ep_Q2_024_coefficient_05_0470
        ep_Q2_024_generator_05_0400_0497 =
      ep_Q2_024_partial_05_0470 := by
  native_decide

/-- Coefficient term 471 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0471 : Poly :=
[
  term ((-15596089465105301990334593751023795473 : Rat) / 1199709457402477296566693528029539267990) [(12, 1), (14, 1)]
]

/-- Partial product 471 for generator 5. -/
def ep_Q2_024_partial_05_0471 : Poly :=
[
  term ((-15596089465105301990334593751023795473 : Rat) / 1199709457402477296566693528029539267990) [(2, 2), (12, 1), (14, 1)],
  term ((-15596089465105301990334593751023795473 : Rat) / 1199709457402477296566693528029539267990) [(3, 2), (12, 1), (14, 1)],
  term ((15596089465105301990334593751023795473 : Rat) / 1199709457402477296566693528029539267990) [(12, 1), (14, 1), (15, 2)],
  term ((15596089465105301990334593751023795473 : Rat) / 1199709457402477296566693528029539267990) [(12, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 471 for generator 5. -/
theorem ep_Q2_024_partial_05_0471_valid :
    mulPoly ep_Q2_024_coefficient_05_0471
        ep_Q2_024_generator_05_0400_0497 =
      ep_Q2_024_partial_05_0471 := by
  native_decide

/-- Coefficient term 472 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0472 : Poly :=
[
  term ((275112435838056051017807777976089896302471283572896916 : Rat) / 232499738033004954626193357709066474366836605811865345) [(12, 1), (14, 1), (15, 2)]
]

/-- Partial product 472 for generator 5. -/
def ep_Q2_024_partial_05_0472 : Poly :=
[
  term ((275112435838056051017807777976089896302471283572896916 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 2), (12, 1), (14, 1), (15, 2)],
  term ((275112435838056051017807777976089896302471283572896916 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 2), (12, 1), (14, 1), (15, 2)],
  term ((-275112435838056051017807777976089896302471283572896916 : Rat) / 232499738033004954626193357709066474366836605811865345) [(12, 1), (14, 1), (15, 4)],
  term ((-275112435838056051017807777976089896302471283572896916 : Rat) / 232499738033004954626193357709066474366836605811865345) [(12, 1), (14, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 472 for generator 5. -/
theorem ep_Q2_024_partial_05_0472_valid :
    mulPoly ep_Q2_024_coefficient_05_0472
        ep_Q2_024_generator_05_0400_0497 =
      ep_Q2_024_partial_05_0472 := by
  native_decide

/-- Coefficient term 473 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0473 : Poly :=
[
  term ((-721692044007504 : Rat) / 1162780221153193) [(12, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 473 for generator 5. -/
def ep_Q2_024_partial_05_0473 : Poly :=
[
  term ((-721692044007504 : Rat) / 1162780221153193) [(2, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-721692044007504 : Rat) / 1162780221153193) [(3, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((721692044007504 : Rat) / 1162780221153193) [(12, 1), (14, 1), (15, 4), (16, 1)],
  term ((721692044007504 : Rat) / 1162780221153193) [(12, 1), (14, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 473 for generator 5. -/
theorem ep_Q2_024_partial_05_0473_valid :
    mulPoly ep_Q2_024_coefficient_05_0473
        ep_Q2_024_generator_05_0400_0497 =
      ep_Q2_024_partial_05_0473 := by
  native_decide

/-- Coefficient term 474 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0474 : Poly :=
[
  term ((71165203091627255309374792566493097150848821898399796359 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(12, 1), (15, 2)]
]

/-- Partial product 474 for generator 5. -/
def ep_Q2_024_partial_05_0474 : Poly :=
[
  term ((71165203091627255309374792566493097150848821898399796359 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(2, 2), (12, 1), (15, 2)],
  term ((71165203091627255309374792566493097150848821898399796359 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(3, 2), (12, 1), (15, 2)],
  term ((-71165203091627255309374792566493097150848821898399796359 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(12, 1), (14, 2), (15, 2)],
  term ((-71165203091627255309374792566493097150848821898399796359 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(12, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 474 for generator 5. -/
theorem ep_Q2_024_partial_05_0474_valid :
    mulPoly ep_Q2_024_coefficient_05_0474
        ep_Q2_024_generator_05_0400_0497 =
      ep_Q2_024_partial_05_0474 := by
  native_decide

/-- Coefficient term 475 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0475 : Poly :=
[
  term ((6756892559585107 : Rat) / 2325560442306386) [(12, 1), (15, 2), (16, 1)]
]

/-- Partial product 475 for generator 5. -/
def ep_Q2_024_partial_05_0475 : Poly :=
[
  term ((6756892559585107 : Rat) / 2325560442306386) [(2, 2), (12, 1), (15, 2), (16, 1)],
  term ((6756892559585107 : Rat) / 2325560442306386) [(3, 2), (12, 1), (15, 2), (16, 1)],
  term ((-6756892559585107 : Rat) / 2325560442306386) [(12, 1), (14, 2), (15, 2), (16, 1)],
  term ((-6756892559585107 : Rat) / 2325560442306386) [(12, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 475 for generator 5. -/
theorem ep_Q2_024_partial_05_0475_valid :
    mulPoly ep_Q2_024_coefficient_05_0475
        ep_Q2_024_generator_05_0400_0497 =
      ep_Q2_024_partial_05_0475 := by
  native_decide

/-- Coefficient term 476 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0476 : Poly :=
[
  term ((-44975123602223741861033454546231653929 : Rat) / 199951576233746216094448921338256544665) [(12, 2)]
]

/-- Partial product 476 for generator 5. -/
def ep_Q2_024_partial_05_0476 : Poly :=
[
  term ((-44975123602223741861033454546231653929 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (12, 2)],
  term ((-44975123602223741861033454546231653929 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (12, 2)],
  term ((44975123602223741861033454546231653929 : Rat) / 199951576233746216094448921338256544665) [(12, 2), (14, 2)],
  term ((44975123602223741861033454546231653929 : Rat) / 199951576233746216094448921338256544665) [(12, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 476 for generator 5. -/
theorem ep_Q2_024_partial_05_0476_valid :
    mulPoly ep_Q2_024_coefficient_05_0476
        ep_Q2_024_generator_05_0400_0497 =
      ep_Q2_024_partial_05_0476 := by
  native_decide

/-- Coefficient term 477 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0477 : Poly :=
[
  term ((16636965510130334965330595005512180336 : Rat) / 199951576233746216094448921338256544665) [(12, 2), (13, 1), (15, 1)]
]

/-- Partial product 477 for generator 5. -/
def ep_Q2_024_partial_05_0477 : Poly :=
[
  term ((16636965510130334965330595005512180336 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (12, 2), (13, 1), (15, 1)],
  term ((16636965510130334965330595005512180336 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (12, 2), (13, 1), (15, 1)],
  term ((-16636965510130334965330595005512180336 : Rat) / 199951576233746216094448921338256544665) [(12, 2), (13, 1), (14, 2), (15, 1)],
  term ((-16636965510130334965330595005512180336 : Rat) / 199951576233746216094448921338256544665) [(12, 2), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 477 for generator 5. -/
theorem ep_Q2_024_partial_05_0477_valid :
    mulPoly ep_Q2_024_coefficient_05_0477
        ep_Q2_024_generator_05_0400_0497 =
      ep_Q2_024_partial_05_0477 := by
  native_decide

/-- Coefficient term 478 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0478 : Poly :=
[
  term ((-99372808237559471999046051391384817781797776110267344 : Rat) / 46499947606600990925238671541813294873367321162373069) [(12, 2), (15, 2)]
]

/-- Partial product 478 for generator 5. -/
def ep_Q2_024_partial_05_0478 : Poly :=
[
  term ((-99372808237559471999046051391384817781797776110267344 : Rat) / 46499947606600990925238671541813294873367321162373069) [(2, 2), (12, 2), (15, 2)],
  term ((-99372808237559471999046051391384817781797776110267344 : Rat) / 46499947606600990925238671541813294873367321162373069) [(3, 2), (12, 2), (15, 2)],
  term ((99372808237559471999046051391384817781797776110267344 : Rat) / 46499947606600990925238671541813294873367321162373069) [(12, 2), (14, 2), (15, 2)],
  term ((99372808237559471999046051391384817781797776110267344 : Rat) / 46499947606600990925238671541813294873367321162373069) [(12, 2), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 478 for generator 5. -/
theorem ep_Q2_024_partial_05_0478_valid :
    mulPoly ep_Q2_024_coefficient_05_0478
        ep_Q2_024_generator_05_0400_0497 =
      ep_Q2_024_partial_05_0478 := by
  native_decide

/-- Coefficient term 479 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0479 : Poly :=
[
  term ((790816150911648 : Rat) / 1162780221153193) [(12, 2), (15, 2), (16, 1)]
]

/-- Partial product 479 for generator 5. -/
def ep_Q2_024_partial_05_0479 : Poly :=
[
  term ((790816150911648 : Rat) / 1162780221153193) [(2, 2), (12, 2), (15, 2), (16, 1)],
  term ((790816150911648 : Rat) / 1162780221153193) [(3, 2), (12, 2), (15, 2), (16, 1)],
  term ((-790816150911648 : Rat) / 1162780221153193) [(12, 2), (14, 2), (15, 2), (16, 1)],
  term ((-790816150911648 : Rat) / 1162780221153193) [(12, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 479 for generator 5. -/
theorem ep_Q2_024_partial_05_0479_valid :
    mulPoly ep_Q2_024_coefficient_05_0479
        ep_Q2_024_generator_05_0400_0497 =
      ep_Q2_024_partial_05_0479 := by
  native_decide

/-- Coefficient term 480 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0480 : Poly :=
[
  term ((704703829528358037043156562699363533975466586592246773 : Rat) / 15762694103932539296691075098919760974022820733007820) [(13, 1), (14, 1), (15, 1)]
]

/-- Partial product 480 for generator 5. -/
def ep_Q2_024_partial_05_0480 : Poly :=
[
  term ((704703829528358037043156562699363533975466586592246773 : Rat) / 15762694103932539296691075098919760974022820733007820) [(2, 2), (13, 1), (14, 1), (15, 1)],
  term ((704703829528358037043156562699363533975466586592246773 : Rat) / 15762694103932539296691075098919760974022820733007820) [(3, 2), (13, 1), (14, 1), (15, 1)],
  term ((-704703829528358037043156562699363533975466586592246773 : Rat) / 15762694103932539296691075098919760974022820733007820) [(13, 1), (14, 1), (15, 3)],
  term ((-704703829528358037043156562699363533975466586592246773 : Rat) / 15762694103932539296691075098919760974022820733007820) [(13, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 480 for generator 5. -/
theorem ep_Q2_024_partial_05_0480_valid :
    mulPoly ep_Q2_024_coefficient_05_0480
        ep_Q2_024_generator_05_0400_0497 =
      ep_Q2_024_partial_05_0480 := by
  native_decide

/-- Coefficient term 481 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0481 : Poly :=
[
  term ((1325143909639537 : Rat) / 1162780221153193) [(13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 481 for generator 5. -/
def ep_Q2_024_partial_05_0481 : Poly :=
[
  term ((1325143909639537 : Rat) / 1162780221153193) [(2, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1325143909639537 : Rat) / 1162780221153193) [(3, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1325143909639537 : Rat) / 1162780221153193) [(13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-1325143909639537 : Rat) / 1162780221153193) [(13, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 481 for generator 5. -/
theorem ep_Q2_024_partial_05_0481_valid :
    mulPoly ep_Q2_024_coefficient_05_0481
        ep_Q2_024_generator_05_0400_0497 =
      ep_Q2_024_partial_05_0481 := by
  native_decide

/-- Coefficient term 482 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0482 : Poly :=
[
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 46499947606600990925238671541813294873367321162373069) [(13, 1), (14, 2), (15, 1)]
]

/-- Partial product 482 for generator 5. -/
def ep_Q2_024_partial_05_0482 : Poly :=
[
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 46499947606600990925238671541813294873367321162373069) [(2, 2), (13, 1), (14, 2), (15, 1)],
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 46499947606600990925238671541813294873367321162373069) [(3, 2), (13, 1), (14, 2), (15, 1)],
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 46499947606600990925238671541813294873367321162373069) [(13, 1), (14, 2), (15, 3)],
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 46499947606600990925238671541813294873367321162373069) [(13, 1), (14, 4), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 482 for generator 5. -/
theorem ep_Q2_024_partial_05_0482_valid :
    mulPoly ep_Q2_024_coefficient_05_0482
        ep_Q2_024_generator_05_0400_0497 =
      ep_Q2_024_partial_05_0482 := by
  native_decide

/-- Coefficient term 483 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0483 : Poly :=
[
  term ((-2501903223122856 : Rat) / 1162780221153193) [(13, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 483 for generator 5. -/
def ep_Q2_024_partial_05_0483 : Poly :=
[
  term ((-2501903223122856 : Rat) / 1162780221153193) [(2, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-2501903223122856 : Rat) / 1162780221153193) [(3, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((2501903223122856 : Rat) / 1162780221153193) [(13, 1), (14, 2), (15, 3), (16, 1)],
  term ((2501903223122856 : Rat) / 1162780221153193) [(13, 1), (14, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 483 for generator 5. -/
theorem ep_Q2_024_partial_05_0483_valid :
    mulPoly ep_Q2_024_coefficient_05_0483
        ep_Q2_024_generator_05_0400_0497 =
      ep_Q2_024_partial_05_0483 := by
  native_decide

/-- Coefficient term 484 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0484 : Poly :=
[
  term ((-53144296062387733312659946948264119483833810283989519062 : Rat) / 697499214099014863878580073127199423100509817435596035) [(13, 1), (15, 1)]
]

/-- Partial product 484 for generator 5. -/
def ep_Q2_024_partial_05_0484 : Poly :=
[
  term ((-53144296062387733312659946948264119483833810283989519062 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 2), (13, 1), (15, 1)],
  term ((-53144296062387733312659946948264119483833810283989519062 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 2), (13, 1), (15, 1)],
  term ((53144296062387733312659946948264119483833810283989519062 : Rat) / 697499214099014863878580073127199423100509817435596035) [(13, 1), (14, 2), (15, 1)],
  term ((53144296062387733312659946948264119483833810283989519062 : Rat) / 697499214099014863878580073127199423100509817435596035) [(13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 484 for generator 5. -/
theorem ep_Q2_024_partial_05_0484_valid :
    mulPoly ep_Q2_024_coefficient_05_0484
        ep_Q2_024_generator_05_0400_0497 =
      ep_Q2_024_partial_05_0484 := by
  native_decide

/-- Coefficient term 485 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0485 : Poly :=
[
  term ((819259254004138 : Rat) / 1162780221153193) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 485 for generator 5. -/
def ep_Q2_024_partial_05_0485 : Poly :=
[
  term ((819259254004138 : Rat) / 1162780221153193) [(2, 2), (13, 1), (15, 1), (16, 1)],
  term ((819259254004138 : Rat) / 1162780221153193) [(3, 2), (13, 1), (15, 1), (16, 1)],
  term ((-819259254004138 : Rat) / 1162780221153193) [(13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-819259254004138 : Rat) / 1162780221153193) [(13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 485 for generator 5. -/
theorem ep_Q2_024_partial_05_0485_valid :
    mulPoly ep_Q2_024_coefficient_05_0485
        ep_Q2_024_generator_05_0400_0497 =
      ep_Q2_024_partial_05_0485 := by
  native_decide

/-- Coefficient term 486 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0486 : Poly :=
[
  term ((-1411028888900427473198385602032644033180051691814836514 : Rat) / 232499738033004954626193357709066474366836605811865345) [(13, 1), (15, 3)]
]

/-- Partial product 486 for generator 5. -/
def ep_Q2_024_partial_05_0486 : Poly :=
[
  term ((-1411028888900427473198385602032644033180051691814836514 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 2), (13, 1), (15, 3)],
  term ((-1411028888900427473198385602032644033180051691814836514 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 2), (13, 1), (15, 3)],
  term ((1411028888900427473198385602032644033180051691814836514 : Rat) / 232499738033004954626193357709066474366836605811865345) [(13, 1), (14, 2), (15, 3)],
  term ((1411028888900427473198385602032644033180051691814836514 : Rat) / 232499738033004954626193357709066474366836605811865345) [(13, 1), (15, 5)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 486 for generator 5. -/
theorem ep_Q2_024_partial_05_0486_valid :
    mulPoly ep_Q2_024_coefficient_05_0486
        ep_Q2_024_generator_05_0400_0497 =
      ep_Q2_024_partial_05_0486 := by
  native_decide

/-- Coefficient term 487 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0487 : Poly :=
[
  term ((-3223595267130360 : Rat) / 1162780221153193) [(13, 1), (15, 3), (16, 1)]
]

/-- Partial product 487 for generator 5. -/
def ep_Q2_024_partial_05_0487 : Poly :=
[
  term ((-3223595267130360 : Rat) / 1162780221153193) [(2, 2), (13, 1), (15, 3), (16, 1)],
  term ((-3223595267130360 : Rat) / 1162780221153193) [(3, 2), (13, 1), (15, 3), (16, 1)],
  term ((3223595267130360 : Rat) / 1162780221153193) [(13, 1), (14, 2), (15, 3), (16, 1)],
  term ((3223595267130360 : Rat) / 1162780221153193) [(13, 1), (15, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 487 for generator 5. -/
theorem ep_Q2_024_partial_05_0487_valid :
    mulPoly ep_Q2_024_coefficient_05_0487
        ep_Q2_024_generator_05_0400_0497 =
      ep_Q2_024_partial_05_0487 := by
  native_decide

/-- Coefficient term 488 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0488 : Poly :=
[
  term ((329626831396182096141663715688747363482 : Rat) / 599854728701238648283346764014769633995) [(13, 2)]
]

/-- Partial product 488 for generator 5. -/
def ep_Q2_024_partial_05_0488 : Poly :=
[
  term ((329626831396182096141663715688747363482 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (13, 2)],
  term ((329626831396182096141663715688747363482 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (13, 2)],
  term ((-329626831396182096141663715688747363482 : Rat) / 599854728701238648283346764014769633995) [(13, 2), (14, 2)],
  term ((-329626831396182096141663715688747363482 : Rat) / 599854728701238648283346764014769633995) [(13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 488 for generator 5. -/
theorem ep_Q2_024_partial_05_0488_valid :
    mulPoly ep_Q2_024_coefficient_05_0488
        ep_Q2_024_generator_05_0400_0497 =
      ep_Q2_024_partial_05_0488 := by
  native_decide

/-- Coefficient term 489 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0489 : Poly :=
[
  term ((-557206966667435226620916722677085744644 : Rat) / 599854728701238648283346764014769633995) [(13, 2), (14, 1)]
]

/-- Partial product 489 for generator 5. -/
def ep_Q2_024_partial_05_0489 : Poly :=
[
  term ((-557206966667435226620916722677085744644 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (13, 2), (14, 1)],
  term ((-557206966667435226620916722677085744644 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (13, 2), (14, 1)],
  term ((557206966667435226620916722677085744644 : Rat) / 599854728701238648283346764014769633995) [(13, 2), (14, 1), (15, 2)],
  term ((557206966667435226620916722677085744644 : Rat) / 599854728701238648283346764014769633995) [(13, 2), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 489 for generator 5. -/
theorem ep_Q2_024_partial_05_0489_valid :
    mulPoly ep_Q2_024_coefficient_05_0489
        ep_Q2_024_generator_05_0400_0497 =
      ep_Q2_024_partial_05_0489 := by
  native_decide

/-- Coefficient term 490 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0490 : Poly :=
[
  term ((-4243375123312046760712148470785626944 : Rat) / 199951576233746216094448921338256544665) [(13, 2), (14, 2)]
]

/-- Partial product 490 for generator 5. -/
def ep_Q2_024_partial_05_0490 : Poly :=
[
  term ((-4243375123312046760712148470785626944 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (13, 2), (14, 2)],
  term ((-4243375123312046760712148470785626944 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (13, 2), (14, 2)],
  term ((4243375123312046760712148470785626944 : Rat) / 199951576233746216094448921338256544665) [(13, 2), (14, 2), (15, 2)],
  term ((4243375123312046760712148470785626944 : Rat) / 199951576233746216094448921338256544665) [(13, 2), (14, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 490 for generator 5. -/
theorem ep_Q2_024_partial_05_0490_valid :
    mulPoly ep_Q2_024_coefficient_05_0490
        ep_Q2_024_generator_05_0400_0497 =
      ep_Q2_024_partial_05_0490 := by
  native_decide

/-- Coefficient term 491 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0491 : Poly :=
[
  term ((-12266519932096666202119321872569897664 : Rat) / 199951576233746216094448921338256544665) [(13, 2), (15, 2)]
]

/-- Partial product 491 for generator 5. -/
def ep_Q2_024_partial_05_0491 : Poly :=
[
  term ((-12266519932096666202119321872569897664 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (13, 2), (15, 2)],
  term ((-12266519932096666202119321872569897664 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (13, 2), (15, 2)],
  term ((12266519932096666202119321872569897664 : Rat) / 199951576233746216094448921338256544665) [(13, 2), (14, 2), (15, 2)],
  term ((12266519932096666202119321872569897664 : Rat) / 199951576233746216094448921338256544665) [(13, 2), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 491 for generator 5. -/
theorem ep_Q2_024_partial_05_0491_valid :
    mulPoly ep_Q2_024_coefficient_05_0491
        ep_Q2_024_generator_05_0400_0497 =
      ep_Q2_024_partial_05_0491 := by
  native_decide

/-- Coefficient term 492 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0492 : Poly :=
[
  term ((-11202785202209872306793098782972401791333 : Rat) / 7198256744414863779400161168177235607940) [(14, 1)]
]

/-- Partial product 492 for generator 5. -/
def ep_Q2_024_partial_05_0492 : Poly :=
[
  term ((-11202785202209872306793098782972401791333 : Rat) / 7198256744414863779400161168177235607940) [(2, 2), (14, 1)],
  term ((-11202785202209872306793098782972401791333 : Rat) / 7198256744414863779400161168177235607940) [(3, 2), (14, 1)],
  term ((11202785202209872306793098782972401791333 : Rat) / 7198256744414863779400161168177235607940) [(14, 1), (15, 2)],
  term ((11202785202209872306793098782972401791333 : Rat) / 7198256744414863779400161168177235607940) [(14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 492 for generator 5. -/
theorem ep_Q2_024_partial_05_0492_valid :
    mulPoly ep_Q2_024_coefficient_05_0492
        ep_Q2_024_generator_05_0400_0497 =
      ep_Q2_024_partial_05_0492 := by
  native_decide

/-- Coefficient term 493 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0493 : Poly :=
[
  term ((53530531076168690104052623820349481218623251063743802 : Rat) / 11822020577949404472518306324189820730517115549755865) [(14, 1), (15, 2)]
]

/-- Partial product 493 for generator 5. -/
def ep_Q2_024_partial_05_0493 : Poly :=
[
  term ((53530531076168690104052623820349481218623251063743802 : Rat) / 11822020577949404472518306324189820730517115549755865) [(2, 2), (14, 1), (15, 2)],
  term ((53530531076168690104052623820349481218623251063743802 : Rat) / 11822020577949404472518306324189820730517115549755865) [(3, 2), (14, 1), (15, 2)],
  term ((-53530531076168690104052623820349481218623251063743802 : Rat) / 11822020577949404472518306324189820730517115549755865) [(14, 1), (15, 4)],
  term ((-53530531076168690104052623820349481218623251063743802 : Rat) / 11822020577949404472518306324189820730517115549755865) [(14, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 493 for generator 5. -/
theorem ep_Q2_024_partial_05_0493_valid :
    mulPoly ep_Q2_024_coefficient_05_0493
        ep_Q2_024_generator_05_0400_0497 =
      ep_Q2_024_partial_05_0493 := by
  native_decide

/-- Coefficient term 494 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0494 : Poly :=
[
  term ((8713766270024 : Rat) / 1162780221153193) [(14, 1), (15, 2), (16, 1)]
]

/-- Partial product 494 for generator 5. -/
def ep_Q2_024_partial_05_0494 : Poly :=
[
  term ((8713766270024 : Rat) / 1162780221153193) [(2, 2), (14, 1), (15, 2), (16, 1)],
  term ((8713766270024 : Rat) / 1162780221153193) [(3, 2), (14, 1), (15, 2), (16, 1)],
  term ((-8713766270024 : Rat) / 1162780221153193) [(14, 1), (15, 4), (16, 1)],
  term ((-8713766270024 : Rat) / 1162780221153193) [(14, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 494 for generator 5. -/
theorem ep_Q2_024_partial_05_0494_valid :
    mulPoly ep_Q2_024_coefficient_05_0494
        ep_Q2_024_generator_05_0400_0497 =
      ep_Q2_024_partial_05_0494 := by
  native_decide

/-- Coefficient term 495 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0495 : Poly :=
[
  term ((582061027275376329967414115123588817349 : Rat) / 599854728701238648283346764014769633995) [(14, 2)]
]

/-- Partial product 495 for generator 5. -/
def ep_Q2_024_partial_05_0495 : Poly :=
[
  term ((582061027275376329967414115123588817349 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (14, 2)],
  term ((582061027275376329967414115123588817349 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (14, 2)],
  term ((-582061027275376329967414115123588817349 : Rat) / 599854728701238648283346764014769633995) [(14, 2), (15, 2)],
  term ((-582061027275376329967414115123588817349 : Rat) / 599854728701238648283346764014769633995) [(14, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 495 for generator 5. -/
theorem ep_Q2_024_partial_05_0495_valid :
    mulPoly ep_Q2_024_coefficient_05_0495
        ep_Q2_024_generator_05_0400_0497 =
      ep_Q2_024_partial_05_0495 := by
  native_decide

/-- Coefficient term 496 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0496 : Poly :=
[
  term ((-19764730765455540819432634179918886158446943647893112029 : Rat) / 929998952132019818504773430836265897467346423247461380) [(15, 2)]
]

/-- Partial product 496 for generator 5. -/
def ep_Q2_024_partial_05_0496 : Poly :=
[
  term ((-19764730765455540819432634179918886158446943647893112029 : Rat) / 929998952132019818504773430836265897467346423247461380) [(2, 2), (15, 2)],
  term ((-19764730765455540819432634179918886158446943647893112029 : Rat) / 929998952132019818504773430836265897467346423247461380) [(3, 2), (15, 2)],
  term ((19764730765455540819432634179918886158446943647893112029 : Rat) / 929998952132019818504773430836265897467346423247461380) [(14, 2), (15, 2)],
  term ((19764730765455540819432634179918886158446943647893112029 : Rat) / 929998952132019818504773430836265897467346423247461380) [(15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 496 for generator 5. -/
theorem ep_Q2_024_partial_05_0496_valid :
    mulPoly ep_Q2_024_coefficient_05_0496
        ep_Q2_024_generator_05_0400_0497 =
      ep_Q2_024_partial_05_0496 := by
  native_decide

/-- Coefficient term 497 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0497 : Poly :=
[
  term ((-1072044132596291 : Rat) / 1162780221153193) [(15, 2), (16, 1)]
]

/-- Partial product 497 for generator 5. -/
def ep_Q2_024_partial_05_0497 : Poly :=
[
  term ((-1072044132596291 : Rat) / 1162780221153193) [(2, 2), (15, 2), (16, 1)],
  term ((-1072044132596291 : Rat) / 1162780221153193) [(3, 2), (15, 2), (16, 1)],
  term ((1072044132596291 : Rat) / 1162780221153193) [(14, 2), (15, 2), (16, 1)],
  term ((1072044132596291 : Rat) / 1162780221153193) [(15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 497 for generator 5. -/
theorem ep_Q2_024_partial_05_0497_valid :
    mulPoly ep_Q2_024_coefficient_05_0497
        ep_Q2_024_generator_05_0400_0497 =
      ep_Q2_024_partial_05_0497 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_024_partials_05_0400_0497 : List Poly :=
[
  ep_Q2_024_partial_05_0400,
  ep_Q2_024_partial_05_0401,
  ep_Q2_024_partial_05_0402,
  ep_Q2_024_partial_05_0403,
  ep_Q2_024_partial_05_0404,
  ep_Q2_024_partial_05_0405,
  ep_Q2_024_partial_05_0406,
  ep_Q2_024_partial_05_0407,
  ep_Q2_024_partial_05_0408,
  ep_Q2_024_partial_05_0409,
  ep_Q2_024_partial_05_0410,
  ep_Q2_024_partial_05_0411,
  ep_Q2_024_partial_05_0412,
  ep_Q2_024_partial_05_0413,
  ep_Q2_024_partial_05_0414,
  ep_Q2_024_partial_05_0415,
  ep_Q2_024_partial_05_0416,
  ep_Q2_024_partial_05_0417,
  ep_Q2_024_partial_05_0418,
  ep_Q2_024_partial_05_0419,
  ep_Q2_024_partial_05_0420,
  ep_Q2_024_partial_05_0421,
  ep_Q2_024_partial_05_0422,
  ep_Q2_024_partial_05_0423,
  ep_Q2_024_partial_05_0424,
  ep_Q2_024_partial_05_0425,
  ep_Q2_024_partial_05_0426,
  ep_Q2_024_partial_05_0427,
  ep_Q2_024_partial_05_0428,
  ep_Q2_024_partial_05_0429,
  ep_Q2_024_partial_05_0430,
  ep_Q2_024_partial_05_0431,
  ep_Q2_024_partial_05_0432,
  ep_Q2_024_partial_05_0433,
  ep_Q2_024_partial_05_0434,
  ep_Q2_024_partial_05_0435,
  ep_Q2_024_partial_05_0436,
  ep_Q2_024_partial_05_0437,
  ep_Q2_024_partial_05_0438,
  ep_Q2_024_partial_05_0439,
  ep_Q2_024_partial_05_0440,
  ep_Q2_024_partial_05_0441,
  ep_Q2_024_partial_05_0442,
  ep_Q2_024_partial_05_0443,
  ep_Q2_024_partial_05_0444,
  ep_Q2_024_partial_05_0445,
  ep_Q2_024_partial_05_0446,
  ep_Q2_024_partial_05_0447,
  ep_Q2_024_partial_05_0448,
  ep_Q2_024_partial_05_0449,
  ep_Q2_024_partial_05_0450,
  ep_Q2_024_partial_05_0451,
  ep_Q2_024_partial_05_0452,
  ep_Q2_024_partial_05_0453,
  ep_Q2_024_partial_05_0454,
  ep_Q2_024_partial_05_0455,
  ep_Q2_024_partial_05_0456,
  ep_Q2_024_partial_05_0457,
  ep_Q2_024_partial_05_0458,
  ep_Q2_024_partial_05_0459,
  ep_Q2_024_partial_05_0460,
  ep_Q2_024_partial_05_0461,
  ep_Q2_024_partial_05_0462,
  ep_Q2_024_partial_05_0463,
  ep_Q2_024_partial_05_0464,
  ep_Q2_024_partial_05_0465,
  ep_Q2_024_partial_05_0466,
  ep_Q2_024_partial_05_0467,
  ep_Q2_024_partial_05_0468,
  ep_Q2_024_partial_05_0469,
  ep_Q2_024_partial_05_0470,
  ep_Q2_024_partial_05_0471,
  ep_Q2_024_partial_05_0472,
  ep_Q2_024_partial_05_0473,
  ep_Q2_024_partial_05_0474,
  ep_Q2_024_partial_05_0475,
  ep_Q2_024_partial_05_0476,
  ep_Q2_024_partial_05_0477,
  ep_Q2_024_partial_05_0478,
  ep_Q2_024_partial_05_0479,
  ep_Q2_024_partial_05_0480,
  ep_Q2_024_partial_05_0481,
  ep_Q2_024_partial_05_0482,
  ep_Q2_024_partial_05_0483,
  ep_Q2_024_partial_05_0484,
  ep_Q2_024_partial_05_0485,
  ep_Q2_024_partial_05_0486,
  ep_Q2_024_partial_05_0487,
  ep_Q2_024_partial_05_0488,
  ep_Q2_024_partial_05_0489,
  ep_Q2_024_partial_05_0490,
  ep_Q2_024_partial_05_0491,
  ep_Q2_024_partial_05_0492,
  ep_Q2_024_partial_05_0493,
  ep_Q2_024_partial_05_0494,
  ep_Q2_024_partial_05_0495,
  ep_Q2_024_partial_05_0496,
  ep_Q2_024_partial_05_0497
]

/-- Sum of partial products in this block. -/
def ep_Q2_024_block_05_0400_0497 : Poly :=
[
  term ((-35844411776756629 : Rat) / 4651120884612772) [(2, 2), (8, 1), (15, 2), (16, 1)],
  term ((-413173782075119663093768476218434237432 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (8, 2)],
  term ((1753247794556348176873481968091066377084 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (9, 1), (11, 1)],
  term ((28480226649915404613451229443364578284 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (9, 1), (11, 1), (12, 1)],
  term ((5546103577164003709519065548508593986367472517022776538 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-75330592794360 : Rat) / 1162780221153193) [(2, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-40472928056033817116049120031239046672 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (9, 1), (11, 1), (13, 2)],
  term ((-8921151527862041881559355605928391576 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (9, 1), (11, 1), (14, 1)],
  term ((-31914642418468897160042061022834858140022559670850052665 : Rat) / 1115998742558423782205728117003519076960815707896953656) [(2, 2), (9, 1), (11, 1), (15, 2)],
  term ((12213780129134847 : Rat) / 2325560442306386) [(2, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((11926969586755832197683769228778754503452 : Rat) / 1799564186103715944850040292044308901985) [(2, 2), (9, 1), (12, 1), (13, 1)],
  term ((-726086402385886848250705287478630146526 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((84907720390392240188132975818963809686531449169420469511 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(2, 2), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-19311310254244191 : Rat) / 2325560442306386) [(2, 2), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((248523726730771764189736002550968372967476746874908271187 : Rat) / 3719995808528079274019093723345063589869385692989845520) [(2, 2), (9, 1), (12, 1), (15, 1)],
  term ((91709861079541295 : Rat) / 13953362653838316) [(2, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((474284525358848571306967891295317678258 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (9, 1), (12, 2), (13, 1)],
  term ((-34313740608208448309428547234530905537673221433088041993 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(2, 2), (9, 1), (12, 2), (15, 1)],
  term ((6741388318767089 : Rat) / 2325560442306386) [(2, 2), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-2013386073169527812662537607303091687587 : Rat) / 1799564186103715944850040292044308901985) [(2, 2), (9, 1), (13, 1)],
  term ((-5895490980511794805588325849139779196848 : Rat) / 1799564186103715944850040292044308901985) [(2, 2), (9, 1), (13, 1), (14, 1)],
  term ((-7955340525129521487200537598531733904 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (9, 1), (13, 1), (14, 2)],
  term ((9923301900547485840918460892701746017973251184532248416 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 2), (9, 1), (13, 1), (15, 2)],
  term ((-2498215589172928 : Rat) / 1162780221153193) [(2, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((103950836548178351367830748123952060736 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (9, 1), (13, 2), (15, 1)],
  term ((-110088994381681774001089747653480182916443815709101505167 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(2, 2), (9, 1), (14, 1), (15, 1)],
  term ((-68747841827265385 : Rat) / 13953362653838316) [(2, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-548436437104013029395802573052341021758462188035905339 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 2), (9, 1), (14, 2), (15, 1)],
  term ((1041537767813708 : Rat) / 1162780221153193) [(2, 2), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-397295641880784247508347219842045668316341654816422090055 : Rat) / 13391984910701085386468737404042228923529788494763443872) [(2, 2), (9, 1), (15, 1)],
  term ((-20946044051252447 : Rat) / 27906725307676632) [(2, 2), (9, 1), (15, 1), (16, 1)],
  term ((-2488379973681280850295504409161390030016648051801582732 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 2), (9, 1), (15, 3)],
  term ((624553897293232 : Rat) / 1162780221153193) [(2, 2), (9, 1), (15, 3), (16, 1)],
  term ((-170572344013320366183864099443365560581 : Rat) / 39990315246749243218889784267651308933) [(2, 2), (9, 2)],
  term ((-78274801493699222926203641708507255904 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (9, 2), (11, 1), (13, 1)],
  term ((303602244700389938148400060577022883753307671413680815 : Rat) / 139499842819802972775716014625439884620101963487119207) [(2, 2), (9, 2), (11, 1), (15, 1)],
  term ((-747574224772468 : Rat) / 1162780221153193) [(2, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((625790500700729343046154158325193498956 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (9, 2), (12, 1)],
  term ((-22781842421239888050827574144720565148 : Rat) / 3389009766673664679566930870139941435) [(2, 2), (9, 2), (14, 1)],
  term ((-63112532186469946331305143931700421056 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (9, 3), (11, 1)],
  term ((316353002527898531835282773808724949038 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (11, 1), (12, 1), (13, 1)],
  term ((-19768893485083958971076886544613861104 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-3112802776304060341198986185252181743629064431456884731 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((2569183513052036 : Rat) / 1162780221153193) [(2, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-75986013507316469500030836804192564809868316919394187633 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(2, 2), (11, 1), (12, 1), (15, 1)],
  term ((8919896007320729 : Rat) / 2325560442306386) [(2, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-27446091065794070460051699491540582992 : Rat) / 39990315246749243218889784267651308933) [(2, 2), (11, 1), (12, 2), (13, 1)],
  term ((3601386516084175685679144962688602785400235238249493976 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 2), (11, 1), (12, 2), (15, 1)],
  term ((-1758553647569664 : Rat) / 1162780221153193) [(2, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-296378677015613838257420355009770391884 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (11, 1), (13, 1)],
  term ((-1243763130392125774176160097274830816 : Rat) / 119970945740247729656669352802953926799) [(2, 2), (11, 1), (13, 1), (14, 1)],
  term ((12993854568522293920978843515494007592 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (11, 1), (13, 1), (14, 2)],
  term ((-23371209139876049838122935174066101654382896197870243282 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 2), (11, 1), (13, 1), (15, 2)],
  term ((1582290915202104 : Rat) / 1162780221153193) [(2, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-83414854120226340010483951424171218528 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (11, 1), (13, 2), (15, 1)],
  term ((624422802622779490903481776090791713612416379655301999 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 2), (11, 1), (14, 1), (15, 1)],
  term ((-1944629615758804 : Rat) / 1162780221153193) [(2, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((1244189986840640425147752204580695015008324025900791366 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 2), (11, 1), (14, 2), (15, 1)],
  term ((-312276948646616 : Rat) / 1162780221153193) [(2, 2), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((149792142705915831920758855564688053770583374272013304973 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(2, 2), (11, 1), (15, 1)],
  term ((-6235834544734871 : Rat) / 2325560442306386) [(2, 2), (11, 1), (15, 1), (16, 1)],
  term ((1244189986840640425147752204580695015008324025900791366 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 2), (11, 1), (15, 3)],
  term ((-312276948646616 : Rat) / 1162780221153193) [(2, 2), (11, 1), (15, 3), (16, 1)],
  term ((-87483070406245862995382813691713434496 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (11, 2), (13, 1), (15, 1)],
  term ((-8088250242351929820163091804873870410062191739236192053 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 2), (11, 2), (15, 2)],
  term ((-57972216906980 : Rat) / 1162780221153193) [(2, 2), (11, 2), (15, 2), (16, 1)],
  term ((99141020761620709838758816793105852819 : Rat) / 1199709457402477296566693528029539267990) [(2, 2), (12, 1)],
  term ((-1604628961756923888281434680356854144 : Rat) / 39990315246749243218889784267651308933) [(2, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-13619839016680653425565021786594389739434802085427963077 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(2, 2), (12, 1), (13, 1), (15, 1)],
  term ((-2798779609083699 : Rat) / 2325560442306386) [(2, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-240841702176304855609935555837304487782 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (12, 1), (13, 2)],
  term ((-15596089465105301990334593751023795473 : Rat) / 1199709457402477296566693528029539267990) [(2, 2), (12, 1), (14, 1)],
  term ((275112435838056051017807777976089896302471283572896916 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 2), (12, 1), (14, 1), (15, 2)],
  term ((-721692044007504 : Rat) / 1162780221153193) [(2, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((71165203091627255309374792566493097150848821898399796359 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(2, 2), (12, 1), (15, 2)],
  term ((6756892559585107 : Rat) / 2325560442306386) [(2, 2), (12, 1), (15, 2), (16, 1)],
  term ((-44975123602223741861033454546231653929 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (12, 2)],
  term ((16636965510130334965330595005512180336 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (12, 2), (13, 1), (15, 1)],
  term ((-99372808237559471999046051391384817781797776110267344 : Rat) / 46499947606600990925238671541813294873367321162373069) [(2, 2), (12, 2), (15, 2)],
  term ((790816150911648 : Rat) / 1162780221153193) [(2, 2), (12, 2), (15, 2), (16, 1)],
  term ((704703829528358037043156562699363533975466586592246773 : Rat) / 15762694103932539296691075098919760974022820733007820) [(2, 2), (13, 1), (14, 1), (15, 1)],
  term ((1325143909639537 : Rat) / 1162780221153193) [(2, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 46499947606600990925238671541813294873367321162373069) [(2, 2), (13, 1), (14, 2), (15, 1)],
  term ((-2501903223122856 : Rat) / 1162780221153193) [(2, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-53144296062387733312659946948264119483833810283989519062 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 2), (13, 1), (15, 1)],
  term ((819259254004138 : Rat) / 1162780221153193) [(2, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1411028888900427473198385602032644033180051691814836514 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 2), (13, 1), (15, 3)],
  term ((-3223595267130360 : Rat) / 1162780221153193) [(2, 2), (13, 1), (15, 3), (16, 1)],
  term ((329626831396182096141663715688747363482 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (13, 2)],
  term ((-557206966667435226620916722677085744644 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (13, 2), (14, 1)],
  term ((-4243375123312046760712148470785626944 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (13, 2), (14, 2)],
  term ((-12266519932096666202119321872569897664 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (13, 2), (15, 2)],
  term ((-11202785202209872306793098782972401791333 : Rat) / 7198256744414863779400161168177235607940) [(2, 2), (14, 1)],
  term ((53530531076168690104052623820349481218623251063743802 : Rat) / 11822020577949404472518306324189820730517115549755865) [(2, 2), (14, 1), (15, 2)],
  term ((8713766270024 : Rat) / 1162780221153193) [(2, 2), (14, 1), (15, 2), (16, 1)],
  term ((582061027275376329967414115123588817349 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (14, 2)],
  term ((-19764730765455540819432634179918886158446943647893112029 : Rat) / 929998952132019818504773430836265897467346423247461380) [(2, 2), (15, 2)],
  term ((-1072044132596291 : Rat) / 1162780221153193) [(2, 2), (15, 2), (16, 1)],
  term ((-35844411776756629 : Rat) / 4651120884612772) [(3, 2), (8, 1), (15, 2), (16, 1)],
  term ((-413173782075119663093768476218434237432 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (8, 2)],
  term ((1753247794556348176873481968091066377084 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (9, 1), (11, 1)],
  term ((28480226649915404613451229443364578284 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (9, 1), (11, 1), (12, 1)],
  term ((5546103577164003709519065548508593986367472517022776538 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-75330592794360 : Rat) / 1162780221153193) [(3, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-40472928056033817116049120031239046672 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (9, 1), (11, 1), (13, 2)],
  term ((-8921151527862041881559355605928391576 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (9, 1), (11, 1), (14, 1)],
  term ((-31914642418468897160042061022834858140022559670850052665 : Rat) / 1115998742558423782205728117003519076960815707896953656) [(3, 2), (9, 1), (11, 1), (15, 2)],
  term ((12213780129134847 : Rat) / 2325560442306386) [(3, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((11926969586755832197683769228778754503452 : Rat) / 1799564186103715944850040292044308901985) [(3, 2), (9, 1), (12, 1), (13, 1)],
  term ((-726086402385886848250705287478630146526 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((84907720390392240188132975818963809686531449169420469511 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(3, 2), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-19311310254244191 : Rat) / 2325560442306386) [(3, 2), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((248523726730771764189736002550968372967476746874908271187 : Rat) / 3719995808528079274019093723345063589869385692989845520) [(3, 2), (9, 1), (12, 1), (15, 1)],
  term ((91709861079541295 : Rat) / 13953362653838316) [(3, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((474284525358848571306967891295317678258 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (9, 1), (12, 2), (13, 1)],
  term ((-34313740608208448309428547234530905537673221433088041993 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(3, 2), (9, 1), (12, 2), (15, 1)],
  term ((6741388318767089 : Rat) / 2325560442306386) [(3, 2), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-2013386073169527812662537607303091687587 : Rat) / 1799564186103715944850040292044308901985) [(3, 2), (9, 1), (13, 1)],
  term ((-5895490980511794805588325849139779196848 : Rat) / 1799564186103715944850040292044308901985) [(3, 2), (9, 1), (13, 1), (14, 1)],
  term ((-7955340525129521487200537598531733904 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (9, 1), (13, 1), (14, 2)],
  term ((9923301900547485840918460892701746017973251184532248416 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 2), (9, 1), (13, 1), (15, 2)],
  term ((-2498215589172928 : Rat) / 1162780221153193) [(3, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((103950836548178351367830748123952060736 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (9, 1), (13, 2), (15, 1)],
  term ((-110088994381681774001089747653480182916443815709101505167 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(3, 2), (9, 1), (14, 1), (15, 1)],
  term ((-68747841827265385 : Rat) / 13953362653838316) [(3, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-548436437104013029395802573052341021758462188035905339 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 2), (9, 1), (14, 2), (15, 1)],
  term ((1041537767813708 : Rat) / 1162780221153193) [(3, 2), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-397295641880784247508347219842045668316341654816422090055 : Rat) / 13391984910701085386468737404042228923529788494763443872) [(3, 2), (9, 1), (15, 1)],
  term ((-20946044051252447 : Rat) / 27906725307676632) [(3, 2), (9, 1), (15, 1), (16, 1)],
  term ((-2488379973681280850295504409161390030016648051801582732 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 2), (9, 1), (15, 3)],
  term ((624553897293232 : Rat) / 1162780221153193) [(3, 2), (9, 1), (15, 3), (16, 1)],
  term ((-170572344013320366183864099443365560581 : Rat) / 39990315246749243218889784267651308933) [(3, 2), (9, 2)],
  term ((-78274801493699222926203641708507255904 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (9, 2), (11, 1), (13, 1)],
  term ((303602244700389938148400060577022883753307671413680815 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 2), (9, 2), (11, 1), (15, 1)],
  term ((-747574224772468 : Rat) / 1162780221153193) [(3, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((625790500700729343046154158325193498956 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (9, 2), (12, 1)],
  term ((-22781842421239888050827574144720565148 : Rat) / 3389009766673664679566930870139941435) [(3, 2), (9, 2), (14, 1)],
  term ((-63112532186469946331305143931700421056 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (9, 3), (11, 1)],
  term ((316353002527898531835282773808724949038 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (11, 1), (12, 1), (13, 1)],
  term ((-19768893485083958971076886544613861104 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-3112802776304060341198986185252181743629064431456884731 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((2569183513052036 : Rat) / 1162780221153193) [(3, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-75986013507316469500030836804192564809868316919394187633 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(3, 2), (11, 1), (12, 1), (15, 1)],
  term ((8919896007320729 : Rat) / 2325560442306386) [(3, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-27446091065794070460051699491540582992 : Rat) / 39990315246749243218889784267651308933) [(3, 2), (11, 1), (12, 2), (13, 1)],
  term ((3601386516084175685679144962688602785400235238249493976 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 2), (11, 1), (12, 2), (15, 1)],
  term ((-1758553647569664 : Rat) / 1162780221153193) [(3, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-296378677015613838257420355009770391884 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (11, 1), (13, 1)],
  term ((-1243763130392125774176160097274830816 : Rat) / 119970945740247729656669352802953926799) [(3, 2), (11, 1), (13, 1), (14, 1)],
  term ((12993854568522293920978843515494007592 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (11, 1), (13, 1), (14, 2)],
  term ((-23371209139876049838122935174066101654382896197870243282 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 2), (11, 1), (13, 1), (15, 2)],
  term ((1582290915202104 : Rat) / 1162780221153193) [(3, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-83414854120226340010483951424171218528 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (11, 1), (13, 2), (15, 1)],
  term ((624422802622779490903481776090791713612416379655301999 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 2), (11, 1), (14, 1), (15, 1)],
  term ((-1944629615758804 : Rat) / 1162780221153193) [(3, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((1244189986840640425147752204580695015008324025900791366 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 2), (11, 1), (14, 2), (15, 1)],
  term ((-312276948646616 : Rat) / 1162780221153193) [(3, 2), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((149792142705915831920758855564688053770583374272013304973 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(3, 2), (11, 1), (15, 1)],
  term ((-6235834544734871 : Rat) / 2325560442306386) [(3, 2), (11, 1), (15, 1), (16, 1)],
  term ((1244189986840640425147752204580695015008324025900791366 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 2), (11, 1), (15, 3)],
  term ((-312276948646616 : Rat) / 1162780221153193) [(3, 2), (11, 1), (15, 3), (16, 1)],
  term ((-87483070406245862995382813691713434496 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (11, 2), (13, 1), (15, 1)],
  term ((-8088250242351929820163091804873870410062191739236192053 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 2), (11, 2), (15, 2)],
  term ((-57972216906980 : Rat) / 1162780221153193) [(3, 2), (11, 2), (15, 2), (16, 1)],
  term ((99141020761620709838758816793105852819 : Rat) / 1199709457402477296566693528029539267990) [(3, 2), (12, 1)],
  term ((-1604628961756923888281434680356854144 : Rat) / 39990315246749243218889784267651308933) [(3, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-13619839016680653425565021786594389739434802085427963077 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(3, 2), (12, 1), (13, 1), (15, 1)],
  term ((-2798779609083699 : Rat) / 2325560442306386) [(3, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-240841702176304855609935555837304487782 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (12, 1), (13, 2)],
  term ((-15596089465105301990334593751023795473 : Rat) / 1199709457402477296566693528029539267990) [(3, 2), (12, 1), (14, 1)],
  term ((275112435838056051017807777976089896302471283572896916 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 2), (12, 1), (14, 1), (15, 2)],
  term ((-721692044007504 : Rat) / 1162780221153193) [(3, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((71165203091627255309374792566493097150848821898399796359 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(3, 2), (12, 1), (15, 2)],
  term ((6756892559585107 : Rat) / 2325560442306386) [(3, 2), (12, 1), (15, 2), (16, 1)],
  term ((-44975123602223741861033454546231653929 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (12, 2)],
  term ((16636965510130334965330595005512180336 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (12, 2), (13, 1), (15, 1)],
  term ((-99372808237559471999046051391384817781797776110267344 : Rat) / 46499947606600990925238671541813294873367321162373069) [(3, 2), (12, 2), (15, 2)],
  term ((790816150911648 : Rat) / 1162780221153193) [(3, 2), (12, 2), (15, 2), (16, 1)],
  term ((704703829528358037043156562699363533975466586592246773 : Rat) / 15762694103932539296691075098919760974022820733007820) [(3, 2), (13, 1), (14, 1), (15, 1)],
  term ((1325143909639537 : Rat) / 1162780221153193) [(3, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 46499947606600990925238671541813294873367321162373069) [(3, 2), (13, 1), (14, 2), (15, 1)],
  term ((-2501903223122856 : Rat) / 1162780221153193) [(3, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-53144296062387733312659946948264119483833810283989519062 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 2), (13, 1), (15, 1)],
  term ((819259254004138 : Rat) / 1162780221153193) [(3, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1411028888900427473198385602032644033180051691814836514 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 2), (13, 1), (15, 3)],
  term ((-3223595267130360 : Rat) / 1162780221153193) [(3, 2), (13, 1), (15, 3), (16, 1)],
  term ((329626831396182096141663715688747363482 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (13, 2)],
  term ((-557206966667435226620916722677085744644 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (13, 2), (14, 1)],
  term ((-4243375123312046760712148470785626944 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (13, 2), (14, 2)],
  term ((-12266519932096666202119321872569897664 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (13, 2), (15, 2)],
  term ((-11202785202209872306793098782972401791333 : Rat) / 7198256744414863779400161168177235607940) [(3, 2), (14, 1)],
  term ((53530531076168690104052623820349481218623251063743802 : Rat) / 11822020577949404472518306324189820730517115549755865) [(3, 2), (14, 1), (15, 2)],
  term ((8713766270024 : Rat) / 1162780221153193) [(3, 2), (14, 1), (15, 2), (16, 1)],
  term ((582061027275376329967414115123588817349 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (14, 2)],
  term ((-19764730765455540819432634179918886158446943647893112029 : Rat) / 929998952132019818504773430836265897467346423247461380) [(3, 2), (15, 2)],
  term ((-1072044132596291 : Rat) / 1162780221153193) [(3, 2), (15, 2), (16, 1)],
  term ((35844411776756629 : Rat) / 4651120884612772) [(8, 1), (14, 2), (15, 2), (16, 1)],
  term ((35844411776756629 : Rat) / 4651120884612772) [(8, 1), (15, 4), (16, 1)],
  term ((413173782075119663093768476218434237432 : Rat) / 599854728701238648283346764014769633995) [(8, 2), (14, 2)],
  term ((413173782075119663093768476218434237432 : Rat) / 599854728701238648283346764014769633995) [(8, 2), (15, 2)],
  term ((-28480226649915404613451229443364578284 : Rat) / 199951576233746216094448921338256544665) [(9, 1), (11, 1), (12, 1), (14, 2)],
  term ((-28480226649915404613451229443364578284 : Rat) / 199951576233746216094448921338256544665) [(9, 1), (11, 1), (12, 1), (15, 2)],
  term ((-5546103577164003709519065548508593986367472517022776538 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((75330592794360 : Rat) / 1162780221153193) [(9, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-5546103577164003709519065548508593986367472517022776538 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 1), (11, 1), (13, 1), (15, 3)],
  term ((75330592794360 : Rat) / 1162780221153193) [(9, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((40472928056033817116049120031239046672 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (11, 1), (13, 2), (14, 2)],
  term ((40472928056033817116049120031239046672 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (11, 1), (13, 2), (15, 2)],
  term ((8921151527862041881559355605928391576 : Rat) / 199951576233746216094448921338256544665) [(9, 1), (11, 1), (14, 1), (15, 2)],
  term ((-1753247794556348176873481968091066377084 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (11, 1), (14, 2)],
  term ((31914642418468897160042061022834858140022559670850052665 : Rat) / 1115998742558423782205728117003519076960815707896953656) [(9, 1), (11, 1), (14, 2), (15, 2)],
  term ((-12213780129134847 : Rat) / 2325560442306386) [(9, 1), (11, 1), (14, 2), (15, 2), (16, 1)],
  term ((8921151527862041881559355605928391576 : Rat) / 199951576233746216094448921338256544665) [(9, 1), (11, 1), (14, 3)],
  term ((-1753247794556348176873481968091066377084 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (11, 1), (15, 2)],
  term ((31914642418468897160042061022834858140022559670850052665 : Rat) / 1115998742558423782205728117003519076960815707896953656) [(9, 1), (11, 1), (15, 4)],
  term ((-12213780129134847 : Rat) / 2325560442306386) [(9, 1), (11, 1), (15, 4), (16, 1)],
  term ((726086402385886848250705287478630146526 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((-11926969586755832197683769228778754503452 : Rat) / 1799564186103715944850040292044308901985) [(9, 1), (12, 1), (13, 1), (14, 2)],
  term ((726086402385886848250705287478630146526 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (12, 1), (13, 1), (14, 3)],
  term ((-11926969586755832197683769228778754503452 : Rat) / 1799564186103715944850040292044308901985) [(9, 1), (12, 1), (13, 1), (15, 2)],
  term ((-84907720390392240188132975818963809686531449169420469511 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(9, 1), (12, 1), (14, 1), (15, 3)],
  term ((19311310254244191 : Rat) / 2325560442306386) [(9, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((-248523726730771764189736002550968372967476746874908271187 : Rat) / 3719995808528079274019093723345063589869385692989845520) [(9, 1), (12, 1), (14, 2), (15, 1)],
  term ((-91709861079541295 : Rat) / 13953362653838316) [(9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-84907720390392240188132975818963809686531449169420469511 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(9, 1), (12, 1), (14, 3), (15, 1)],
  term ((19311310254244191 : Rat) / 2325560442306386) [(9, 1), (12, 1), (14, 3), (15, 1), (16, 1)],
  term ((-248523726730771764189736002550968372967476746874908271187 : Rat) / 3719995808528079274019093723345063589869385692989845520) [(9, 1), (12, 1), (15, 3)],
  term ((-91709861079541295 : Rat) / 13953362653838316) [(9, 1), (12, 1), (15, 3), (16, 1)],
  term ((-474284525358848571306967891295317678258 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (12, 2), (13, 1), (14, 2)],
  term ((-474284525358848571306967891295317678258 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (12, 2), (13, 1), (15, 2)],
  term ((34313740608208448309428547234530905537673221433088041993 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(9, 1), (12, 2), (14, 2), (15, 1)],
  term ((-6741388318767089 : Rat) / 2325560442306386) [(9, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((34313740608208448309428547234530905537673221433088041993 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(9, 1), (12, 2), (15, 3)],
  term ((-6741388318767089 : Rat) / 2325560442306386) [(9, 1), (12, 2), (15, 3), (16, 1)],
  term ((5895490980511794805588325849139779196848 : Rat) / 1799564186103715944850040292044308901985) [(9, 1), (13, 1), (14, 1), (15, 2)],
  term ((2013386073169527812662537607303091687587 : Rat) / 1799564186103715944850040292044308901985) [(9, 1), (13, 1), (14, 2)],
  term ((-1979110192540401730065945704601152253126207326088876400 : Rat) / 139499842819802972775716014625439884620101963487119207) [(9, 1), (13, 1), (14, 2), (15, 2)],
  term ((2498215589172928 : Rat) / 1162780221153193) [(9, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((5895490980511794805588325849139779196848 : Rat) / 1799564186103715944850040292044308901985) [(9, 1), (13, 1), (14, 3)],
  term ((7955340525129521487200537598531733904 : Rat) / 199951576233746216094448921338256544665) [(9, 1), (13, 1), (14, 4)],
  term ((2013386073169527812662537607303091687587 : Rat) / 1799564186103715944850040292044308901985) [(9, 1), (13, 1), (15, 2)],
  term ((-9923301900547485840918460892701746017973251184532248416 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 1), (13, 1), (15, 4)],
  term ((2498215589172928 : Rat) / 1162780221153193) [(9, 1), (13, 1), (15, 4), (16, 1)],
  term ((-103950836548178351367830748123952060736 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (13, 2), (14, 2), (15, 1)],
  term ((-103950836548178351367830748123952060736 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (13, 2), (15, 3)],
  term ((110088994381681774001089747653480182916443815709101505167 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(9, 1), (14, 1), (15, 3)],
  term ((68747841827265385 : Rat) / 13953362653838316) [(9, 1), (14, 1), (15, 3), (16, 1)],
  term ((397295641880784247508347219842045668316341654816422090055 : Rat) / 13391984910701085386468737404042228923529788494763443872) [(9, 1), (14, 2), (15, 1)],
  term ((20946044051252447 : Rat) / 27906725307676632) [(9, 1), (14, 2), (15, 1), (16, 1)],
  term ((4133689284993319938482912128318413095292034615909298749 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 1), (14, 2), (15, 3)],
  term ((-1666091665106940 : Rat) / 1162780221153193) [(9, 1), (14, 2), (15, 3), (16, 1)],
  term ((110088994381681774001089747653480182916443815709101505167 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(9, 1), (14, 3), (15, 1)],
  term ((68747841827265385 : Rat) / 13953362653838316) [(9, 1), (14, 3), (15, 1), (16, 1)],
  term ((548436437104013029395802573052341021758462188035905339 : Rat) / 232499738033004954626193357709066474366836605811865345) [(9, 1), (14, 4), (15, 1)],
  term ((-1041537767813708 : Rat) / 1162780221153193) [(9, 1), (14, 4), (15, 1), (16, 1)],
  term ((397295641880784247508347219842045668316341654816422090055 : Rat) / 13391984910701085386468737404042228923529788494763443872) [(9, 1), (15, 3)],
  term ((20946044051252447 : Rat) / 27906725307676632) [(9, 1), (15, 3), (16, 1)],
  term ((2488379973681280850295504409161390030016648051801582732 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 1), (15, 5)],
  term ((-624553897293232 : Rat) / 1162780221153193) [(9, 1), (15, 5), (16, 1)],
  term ((78274801493699222926203641708507255904 : Rat) / 199951576233746216094448921338256544665) [(9, 2), (11, 1), (13, 1), (14, 2)],
  term ((78274801493699222926203641708507255904 : Rat) / 199951576233746216094448921338256544665) [(9, 2), (11, 1), (13, 1), (15, 2)],
  term ((-303602244700389938148400060577022883753307671413680815 : Rat) / 139499842819802972775716014625439884620101963487119207) [(9, 2), (11, 1), (14, 2), (15, 1)],
  term ((747574224772468 : Rat) / 1162780221153193) [(9, 2), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-303602244700389938148400060577022883753307671413680815 : Rat) / 139499842819802972775716014625439884620101963487119207) [(9, 2), (11, 1), (15, 3)],
  term ((747574224772468 : Rat) / 1162780221153193) [(9, 2), (11, 1), (15, 3), (16, 1)],
  term ((-625790500700729343046154158325193498956 : Rat) / 199951576233746216094448921338256544665) [(9, 2), (12, 1), (14, 2)],
  term ((-625790500700729343046154158325193498956 : Rat) / 199951576233746216094448921338256544665) [(9, 2), (12, 1), (15, 2)],
  term ((22781842421239888050827574144720565148 : Rat) / 3389009766673664679566930870139941435) [(9, 2), (14, 1), (15, 2)],
  term ((170572344013320366183864099443365560581 : Rat) / 39990315246749243218889784267651308933) [(9, 2), (14, 2)],
  term ((22781842421239888050827574144720565148 : Rat) / 3389009766673664679566930870139941435) [(9, 2), (14, 3)],
  term ((170572344013320366183864099443365560581 : Rat) / 39990315246749243218889784267651308933) [(9, 2), (15, 2)],
  term ((63112532186469946331305143931700421056 : Rat) / 199951576233746216094448921338256544665) [(9, 3), (11, 1), (14, 2)],
  term ((63112532186469946331305143931700421056 : Rat) / 199951576233746216094448921338256544665) [(9, 3), (11, 1), (15, 2)],
  term ((19768893485083958971076886544613861104 : Rat) / 599854728701238648283346764014769633995) [(11, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((-316353002527898531835282773808724949038 : Rat) / 199951576233746216094448921338256544665) [(11, 1), (12, 1), (13, 1), (14, 2)],
  term ((19768893485083958971076886544613861104 : Rat) / 599854728701238648283346764014769633995) [(11, 1), (12, 1), (13, 1), (14, 3)],
  term ((-316353002527898531835282773808724949038 : Rat) / 199951576233746216094448921338256544665) [(11, 1), (12, 1), (13, 1), (15, 2)],
  term ((3112802776304060341198986185252181743629064431456884731 : Rat) / 697499214099014863878580073127199423100509817435596035) [(11, 1), (12, 1), (14, 1), (15, 3)],
  term ((-2569183513052036 : Rat) / 1162780221153193) [(11, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((75986013507316469500030836804192564809868316919394187633 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(11, 1), (12, 1), (14, 2), (15, 1)],
  term ((-8919896007320729 : Rat) / 2325560442306386) [(11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((3112802776304060341198986185252181743629064431456884731 : Rat) / 697499214099014863878580073127199423100509817435596035) [(11, 1), (12, 1), (14, 3), (15, 1)],
  term ((-2569183513052036 : Rat) / 1162780221153193) [(11, 1), (12, 1), (14, 3), (15, 1), (16, 1)],
  term ((75986013507316469500030836804192564809868316919394187633 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(11, 1), (12, 1), (15, 3)],
  term ((-8919896007320729 : Rat) / 2325560442306386) [(11, 1), (12, 1), (15, 3), (16, 1)],
  term ((27446091065794070460051699491540582992 : Rat) / 39990315246749243218889784267651308933) [(11, 1), (12, 2), (13, 1), (14, 2)],
  term ((27446091065794070460051699491540582992 : Rat) / 39990315246749243218889784267651308933) [(11, 1), (12, 2), (13, 1), (15, 2)],
  term ((-3601386516084175685679144962688602785400235238249493976 : Rat) / 232499738033004954626193357709066474366836605811865345) [(11, 1), (12, 2), (14, 2), (15, 1)],
  term ((1758553647569664 : Rat) / 1162780221153193) [(11, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((-3601386516084175685679144962688602785400235238249493976 : Rat) / 232499738033004954626193357709066474366836605811865345) [(11, 1), (12, 2), (15, 3)],
  term ((1758553647569664 : Rat) / 1162780221153193) [(11, 1), (12, 2), (15, 3), (16, 1)],
  term ((1243763130392125774176160097274830816 : Rat) / 119970945740247729656669352802953926799) [(11, 1), (13, 1), (14, 1), (15, 2)],
  term ((296378677015613838257420355009770391884 : Rat) / 599854728701238648283346764014769633995) [(11, 1), (13, 1), (14, 2)],
  term ((23356100142787231057991156802094194603336225686533202026 : Rat) / 697499214099014863878580073127199423100509817435596035) [(11, 1), (13, 1), (14, 2), (15, 2)],
  term ((-1582290915202104 : Rat) / 1162780221153193) [(11, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((1243763130392125774176160097274830816 : Rat) / 119970945740247729656669352802953926799) [(11, 1), (13, 1), (14, 3)],
  term ((-12993854568522293920978843515494007592 : Rat) / 599854728701238648283346764014769633995) [(11, 1), (13, 1), (14, 4)],
  term ((296378677015613838257420355009770391884 : Rat) / 599854728701238648283346764014769633995) [(11, 1), (13, 1), (15, 2)],
  term ((23371209139876049838122935174066101654382896197870243282 : Rat) / 697499214099014863878580073127199423100509817435596035) [(11, 1), (13, 1), (15, 4)],
  term ((-1582290915202104 : Rat) / 1162780221153193) [(11, 1), (13, 1), (15, 4), (16, 1)],
  term ((83414854120226340010483951424171218528 : Rat) / 199951576233746216094448921338256544665) [(11, 1), (13, 2), (14, 2), (15, 1)],
  term ((83414854120226340010483951424171218528 : Rat) / 199951576233746216094448921338256544665) [(11, 1), (13, 2), (15, 3)],
  term ((-624422802622779490903481776090791713612416379655301999 : Rat) / 697499214099014863878580073127199423100509817435596035) [(11, 1), (14, 1), (15, 3)],
  term ((1944629615758804 : Rat) / 1162780221153193) [(11, 1), (14, 1), (15, 3), (16, 1)],
  term ((-149792142705915831920758855564688053770583374272013304973 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(11, 1), (14, 2), (15, 1)],
  term ((6235834544734871 : Rat) / 2325560442306386) [(11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-2488379973681280850295504409161390030016648051801582732 : Rat) / 697499214099014863878580073127199423100509817435596035) [(11, 1), (14, 2), (15, 3)],
  term ((624553897293232 : Rat) / 1162780221153193) [(11, 1), (14, 2), (15, 3), (16, 1)],
  term ((-624422802622779490903481776090791713612416379655301999 : Rat) / 697499214099014863878580073127199423100509817435596035) [(11, 1), (14, 3), (15, 1)],
  term ((1944629615758804 : Rat) / 1162780221153193) [(11, 1), (14, 3), (15, 1), (16, 1)],
  term ((-1244189986840640425147752204580695015008324025900791366 : Rat) / 697499214099014863878580073127199423100509817435596035) [(11, 1), (14, 4), (15, 1)],
  term ((312276948646616 : Rat) / 1162780221153193) [(11, 1), (14, 4), (15, 1), (16, 1)],
  term ((-149792142705915831920758855564688053770583374272013304973 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(11, 1), (15, 3)],
  term ((6235834544734871 : Rat) / 2325560442306386) [(11, 1), (15, 3), (16, 1)],
  term ((-1244189986840640425147752204580695015008324025900791366 : Rat) / 697499214099014863878580073127199423100509817435596035) [(11, 1), (15, 5)],
  term ((312276948646616 : Rat) / 1162780221153193) [(11, 1), (15, 5), (16, 1)],
  term ((87483070406245862995382813691713434496 : Rat) / 599854728701238648283346764014769633995) [(11, 2), (13, 1), (14, 2), (15, 1)],
  term ((87483070406245862995382813691713434496 : Rat) / 599854728701238648283346764014769633995) [(11, 2), (13, 1), (15, 3)],
  term ((8088250242351929820163091804873870410062191739236192053 : Rat) / 697499214099014863878580073127199423100509817435596035) [(11, 2), (14, 2), (15, 2)],
  term ((57972216906980 : Rat) / 1162780221153193) [(11, 2), (14, 2), (15, 2), (16, 1)],
  term ((8088250242351929820163091804873870410062191739236192053 : Rat) / 697499214099014863878580073127199423100509817435596035) [(11, 2), (15, 4)],
  term ((57972216906980 : Rat) / 1162780221153193) [(11, 2), (15, 4), (16, 1)],
  term ((1604628961756923888281434680356854144 : Rat) / 39990315246749243218889784267651308933) [(12, 1), (13, 1), (14, 1), (15, 3)],
  term ((13619839016680653425565021786594389739434802085427963077 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(12, 1), (13, 1), (14, 2), (15, 1)],
  term ((2798779609083699 : Rat) / 2325560442306386) [(12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((1604628961756923888281434680356854144 : Rat) / 39990315246749243218889784267651308933) [(12, 1), (13, 1), (14, 3), (15, 1)],
  term ((13619839016680653425565021786594389739434802085427963077 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(12, 1), (13, 1), (15, 3)],
  term ((2798779609083699 : Rat) / 2325560442306386) [(12, 1), (13, 1), (15, 3), (16, 1)],
  term ((240841702176304855609935555837304487782 : Rat) / 599854728701238648283346764014769633995) [(12, 1), (13, 2), (14, 2)],
  term ((240841702176304855609935555837304487782 : Rat) / 599854728701238648283346764014769633995) [(12, 1), (13, 2), (15, 2)],
  term ((15596089465105301990334593751023795473 : Rat) / 1199709457402477296566693528029539267990) [(12, 1), (14, 1), (15, 2)],
  term ((-275112435838056051017807777976089896302471283572896916 : Rat) / 232499738033004954626193357709066474366836605811865345) [(12, 1), (14, 1), (15, 4)],
  term ((721692044007504 : Rat) / 1162780221153193) [(12, 1), (14, 1), (15, 4), (16, 1)],
  term ((-99141020761620709838758816793105852819 : Rat) / 1199709457402477296566693528029539267990) [(12, 1), (14, 2)],
  term ((-71165203091627255309374792566493097150848821898399796359 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(12, 1), (14, 2), (15, 2)],
  term ((-6756892559585107 : Rat) / 2325560442306386) [(12, 1), (14, 2), (15, 2), (16, 1)],
  term ((15596089465105301990334593751023795473 : Rat) / 1199709457402477296566693528029539267990) [(12, 1), (14, 3)],
  term ((-275112435838056051017807777976089896302471283572896916 : Rat) / 232499738033004954626193357709066474366836605811865345) [(12, 1), (14, 3), (15, 2)],
  term ((721692044007504 : Rat) / 1162780221153193) [(12, 1), (14, 3), (15, 2), (16, 1)],
  term ((-99141020761620709838758816793105852819 : Rat) / 1199709457402477296566693528029539267990) [(12, 1), (15, 2)],
  term ((-71165203091627255309374792566493097150848821898399796359 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(12, 1), (15, 4)],
  term ((-6756892559585107 : Rat) / 2325560442306386) [(12, 1), (15, 4), (16, 1)],
  term ((-16636965510130334965330595005512180336 : Rat) / 199951576233746216094448921338256544665) [(12, 2), (13, 1), (14, 2), (15, 1)],
  term ((-16636965510130334965330595005512180336 : Rat) / 199951576233746216094448921338256544665) [(12, 2), (13, 1), (15, 3)],
  term ((44975123602223741861033454546231653929 : Rat) / 199951576233746216094448921338256544665) [(12, 2), (14, 2)],
  term ((99372808237559471999046051391384817781797776110267344 : Rat) / 46499947606600990925238671541813294873367321162373069) [(12, 2), (14, 2), (15, 2)],
  term ((-790816150911648 : Rat) / 1162780221153193) [(12, 2), (14, 2), (15, 2), (16, 1)],
  term ((44975123602223741861033454546231653929 : Rat) / 199951576233746216094448921338256544665) [(12, 2), (15, 2)],
  term ((99372808237559471999046051391384817781797776110267344 : Rat) / 46499947606600990925238671541813294873367321162373069) [(12, 2), (15, 4)],
  term ((-790816150911648 : Rat) / 1162780221153193) [(12, 2), (15, 4), (16, 1)],
  term ((-704703829528358037043156562699363533975466586592246773 : Rat) / 15762694103932539296691075098919760974022820733007820) [(13, 1), (14, 1), (15, 3)],
  term ((-1325143909639537 : Rat) / 1162780221153193) [(13, 1), (14, 1), (15, 3), (16, 1)],
  term ((53144296062387733312659946948264119483833810283989519062 : Rat) / 697499214099014863878580073127199423100509817435596035) [(13, 1), (14, 2), (15, 1)],
  term ((-819259254004138 : Rat) / 1162780221153193) [(13, 1), (14, 2), (15, 1), (16, 1)],
  term ((3097170213638910997414578982041377962662574667202569944 : Rat) / 232499738033004954626193357709066474366836605811865345) [(13, 1), (14, 2), (15, 3)],
  term ((5725498490253216 : Rat) / 1162780221153193) [(13, 1), (14, 2), (15, 3), (16, 1)],
  term ((-704703829528358037043156562699363533975466586592246773 : Rat) / 15762694103932539296691075098919760974022820733007820) [(13, 1), (14, 3), (15, 1)],
  term ((-1325143909639537 : Rat) / 1162780221153193) [(13, 1), (14, 3), (15, 1), (16, 1)],
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 46499947606600990925238671541813294873367321162373069) [(13, 1), (14, 4), (15, 1)],
  term ((2501903223122856 : Rat) / 1162780221153193) [(13, 1), (14, 4), (15, 1), (16, 1)],
  term ((53144296062387733312659946948264119483833810283989519062 : Rat) / 697499214099014863878580073127199423100509817435596035) [(13, 1), (15, 3)],
  term ((-819259254004138 : Rat) / 1162780221153193) [(13, 1), (15, 3), (16, 1)],
  term ((1411028888900427473198385602032644033180051691814836514 : Rat) / 232499738033004954626193357709066474366836605811865345) [(13, 1), (15, 5)],
  term ((3223595267130360 : Rat) / 1162780221153193) [(13, 1), (15, 5), (16, 1)],
  term ((557206966667435226620916722677085744644 : Rat) / 599854728701238648283346764014769633995) [(13, 2), (14, 1), (15, 2)],
  term ((-329626831396182096141663715688747363482 : Rat) / 599854728701238648283346764014769633995) [(13, 2), (14, 2)],
  term ((16509895055408712962831470343355524608 : Rat) / 199951576233746216094448921338256544665) [(13, 2), (14, 2), (15, 2)],
  term ((557206966667435226620916722677085744644 : Rat) / 599854728701238648283346764014769633995) [(13, 2), (14, 3)],
  term ((4243375123312046760712148470785626944 : Rat) / 199951576233746216094448921338256544665) [(13, 2), (14, 4)],
  term ((-329626831396182096141663715688747363482 : Rat) / 599854728701238648283346764014769633995) [(13, 2), (15, 2)],
  term ((12266519932096666202119321872569897664 : Rat) / 199951576233746216094448921338256544665) [(13, 2), (15, 4)],
  term ((11202785202209872306793098782972401791333 : Rat) / 7198256744414863779400161168177235607940) [(14, 1), (15, 2)],
  term ((-53530531076168690104052623820349481218623251063743802 : Rat) / 11822020577949404472518306324189820730517115549755865) [(14, 1), (15, 4)],
  term ((-8713766270024 : Rat) / 1162780221153193) [(14, 1), (15, 4), (16, 1)],
  term ((56586956096286955291221600804962162003787523760378754659 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(14, 2), (15, 2)],
  term ((1072044132596291 : Rat) / 1162780221153193) [(14, 2), (15, 2), (16, 1)],
  term ((11202785202209872306793098782972401791333 : Rat) / 7198256744414863779400161168177235607940) [(14, 3)],
  term ((-53530531076168690104052623820349481218623251063743802 : Rat) / 11822020577949404472518306324189820730517115549755865) [(14, 3), (15, 2)],
  term ((-8713766270024 : Rat) / 1162780221153193) [(14, 3), (15, 2), (16, 1)],
  term ((-582061027275376329967414115123588817349 : Rat) / 599854728701238648283346764014769633995) [(14, 4)],
  term ((19764730765455540819432634179918886158446943647893112029 : Rat) / 929998952132019818504773430836265897467346423247461380) [(15, 4)],
  term ((1072044132596291 : Rat) / 1162780221153193) [(15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 5, terms 400 through 497. -/
theorem ep_Q2_024_block_05_0400_0497_valid :
    checkProductSumEq ep_Q2_024_partials_05_0400_0497
      ep_Q2_024_block_05_0400_0497 = true := by
  native_decide

end EpQ2024TermShards

end Patterns

end EndpointCertificate

end Problem97
