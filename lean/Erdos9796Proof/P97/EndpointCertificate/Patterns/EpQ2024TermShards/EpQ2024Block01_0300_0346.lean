/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_024, term block 1:300-346

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_024`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2024TermShards

/-- Generator polynomial 1 for endpoint certificate `ep_Q2_024`. -/
def ep_Q2_024_generator_01_0300_0346 : Poly :=
[
  term (2 : Rat) [(0, 1), (6, 1)],
  term (2 : Rat) [(1, 1), (7, 1)],
  term (-1 : Rat) [(6, 2)],
  term (-1 : Rat) [(7, 2)]
]

/-- Coefficient term 300 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0300 : Poly :=
[
  term ((312453969237411213640799544201573540344 : Rat) / 599854728701238648283346764014769633995) [(11, 1), (12, 2), (13, 1)]
]

/-- Partial product 300 for generator 1. -/
def ep_Q2_024_partial_01_0300 : Poly :=
[
  term ((624907938474822427281599088403147080688 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (6, 1), (11, 1), (12, 2), (13, 1)],
  term ((624907938474822427281599088403147080688 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (7, 1), (11, 1), (12, 2), (13, 1)],
  term ((-312453969237411213640799544201573540344 : Rat) / 599854728701238648283346764014769633995) [(6, 2), (11, 1), (12, 2), (13, 1)],
  term ((-312453969237411213640799544201573540344 : Rat) / 599854728701238648283346764014769633995) [(7, 2), (11, 1), (12, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 300 for generator 1. -/
theorem ep_Q2_024_partial_01_0300_valid :
    mulPoly ep_Q2_024_coefficient_01_0300
        ep_Q2_024_generator_01_0300_0346 =
      ep_Q2_024_partial_01_0300 := by
  native_decide

/-- Coefficient term 301 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0301 : Poly :=
[
  term ((-5596751201457925662836715300015825190436979755421300347 : Rat) / 464999476066009909252386715418132948733673211623730690) [(11, 1), (12, 2), (15, 1)]
]

/-- Partial product 301 for generator 1. -/
def ep_Q2_024_partial_01_0301 : Poly :=
[
  term ((-5596751201457925662836715300015825190436979755421300347 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (6, 1), (11, 1), (12, 2), (15, 1)],
  term ((-5596751201457925662836715300015825190436979755421300347 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (7, 1), (11, 1), (12, 2), (15, 1)],
  term ((5596751201457925662836715300015825190436979755421300347 : Rat) / 464999476066009909252386715418132948733673211623730690) [(6, 2), (11, 1), (12, 2), (15, 1)],
  term ((5596751201457925662836715300015825190436979755421300347 : Rat) / 464999476066009909252386715418132948733673211623730690) [(7, 2), (11, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 301 for generator 1. -/
theorem ep_Q2_024_partial_01_0301_valid :
    mulPoly ep_Q2_024_coefficient_01_0301
        ep_Q2_024_generator_01_0300_0346 =
      ep_Q2_024_partial_01_0301 := by
  native_decide

/-- Coefficient term 302 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0302 : Poly :=
[
  term ((1958693697672998 : Rat) / 1162780221153193) [(11, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 302 for generator 1. -/
def ep_Q2_024_partial_01_0302 : Poly :=
[
  term ((3917387395345996 : Rat) / 1162780221153193) [(0, 1), (6, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((3917387395345996 : Rat) / 1162780221153193) [(1, 1), (7, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1958693697672998 : Rat) / 1162780221153193) [(6, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1958693697672998 : Rat) / 1162780221153193) [(7, 2), (11, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 302 for generator 1. -/
theorem ep_Q2_024_partial_01_0302_valid :
    mulPoly ep_Q2_024_coefficient_01_0302
        ep_Q2_024_generator_01_0300_0346 =
      ep_Q2_024_partial_01_0302 := by
  native_decide

/-- Coefficient term 303 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0303 : Poly :=
[
  term ((1246500628449369573311884488585868966718 : Rat) / 1799564186103715944850040292044308901985) [(11, 1), (13, 1)]
]

/-- Partial product 303 for generator 1. -/
def ep_Q2_024_partial_01_0303 : Poly :=
[
  term ((2493001256898739146623768977171737933436 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (6, 1), (11, 1), (13, 1)],
  term ((2493001256898739146623768977171737933436 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (7, 1), (11, 1), (13, 1)],
  term ((-1246500628449369573311884488585868966718 : Rat) / 1799564186103715944850040292044308901985) [(6, 2), (11, 1), (13, 1)],
  term ((-1246500628449369573311884488585868966718 : Rat) / 1799564186103715944850040292044308901985) [(7, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 303 for generator 1. -/
theorem ep_Q2_024_partial_01_0303_valid :
    mulPoly ep_Q2_024_coefficient_01_0303
        ep_Q2_024_generator_01_0300_0346 =
      ep_Q2_024_partial_01_0303 := by
  native_decide

/-- Coefficient term 304 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0304 : Poly :=
[
  term ((-6726269385995931222631702436044558592986424804977428136 : Rat) / 697499214099014863878580073127199423100509817435596035) [(11, 1), (13, 1), (15, 2)]
]

/-- Partial product 304 for generator 1. -/
def ep_Q2_024_partial_01_0304 : Poly :=
[
  term ((-13452538771991862445263404872089117185972849609954856272 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (6, 1), (11, 1), (13, 1), (15, 2)],
  term ((-13452538771991862445263404872089117185972849609954856272 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (7, 1), (11, 1), (13, 1), (15, 2)],
  term ((6726269385995931222631702436044558592986424804977428136 : Rat) / 697499214099014863878580073127199423100509817435596035) [(6, 2), (11, 1), (13, 1), (15, 2)],
  term ((6726269385995931222631702436044558592986424804977428136 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 2), (11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 304 for generator 1. -/
theorem ep_Q2_024_partial_01_0304_valid :
    mulPoly ep_Q2_024_coefficient_01_0304
        ep_Q2_024_generator_01_0300_0346 =
      ep_Q2_024_partial_01_0304 := by
  native_decide

/-- Coefficient term 305 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0305 : Poly :=
[
  term ((1347382663288800 : Rat) / 1162780221153193) [(11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 305 for generator 1. -/
def ep_Q2_024_partial_01_0305 : Poly :=
[
  term ((2694765326577600 : Rat) / 1162780221153193) [(0, 1), (6, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((2694765326577600 : Rat) / 1162780221153193) [(1, 1), (7, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1347382663288800 : Rat) / 1162780221153193) [(6, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1347382663288800 : Rat) / 1162780221153193) [(7, 2), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 305 for generator 1. -/
theorem ep_Q2_024_partial_01_0305_valid :
    mulPoly ep_Q2_024_coefficient_01_0305
        ep_Q2_024_generator_01_0300_0346 =
      ep_Q2_024_partial_01_0305 := by
  native_decide

/-- Coefficient term 306 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0306 : Poly :=
[
  term ((-23303003274098118356770852827110756224 : Rat) / 199951576233746216094448921338256544665) [(11, 1), (13, 2), (15, 1)]
]

/-- Partial product 306 for generator 1. -/
def ep_Q2_024_partial_01_0306 : Poly :=
[
  term ((-46606006548196236713541705654221512448 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (6, 1), (11, 1), (13, 2), (15, 1)],
  term ((-46606006548196236713541705654221512448 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (7, 1), (11, 1), (13, 2), (15, 1)],
  term ((23303003274098118356770852827110756224 : Rat) / 199951576233746216094448921338256544665) [(6, 2), (11, 1), (13, 2), (15, 1)],
  term ((23303003274098118356770852827110756224 : Rat) / 199951576233746216094448921338256544665) [(7, 2), (11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 306 for generator 1. -/
theorem ep_Q2_024_partial_01_0306_valid :
    mulPoly ep_Q2_024_coefficient_01_0306
        ep_Q2_024_generator_01_0300_0346 =
      ep_Q2_024_partial_01_0306 := by
  native_decide

/-- Coefficient term 307 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0307 : Poly :=
[
  term ((-192310281104939503004456638320760459762053553695717730571 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(11, 1), (15, 1)]
]

/-- Partial product 307 for generator 1. -/
def ep_Q2_024_partial_01_0307 : Poly :=
[
  term ((-192310281104939503004456638320760459762053553695717730571 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(0, 1), (6, 1), (11, 1), (15, 1)],
  term ((-192310281104939503004456638320760459762053553695717730571 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(1, 1), (7, 1), (11, 1), (15, 1)],
  term ((192310281104939503004456638320760459762053553695717730571 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(6, 2), (11, 1), (15, 1)],
  term ((192310281104939503004456638320760459762053553695717730571 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(7, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 307 for generator 1. -/
theorem ep_Q2_024_partial_01_0307_valid :
    mulPoly ep_Q2_024_coefficient_01_0307
        ep_Q2_024_generator_01_0300_0346 =
      ep_Q2_024_partial_01_0307 := by
  native_decide

/-- Coefficient term 308 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0308 : Poly :=
[
  term ((-1731142516245691 : Rat) / 1162780221153193) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 308 for generator 1. -/
def ep_Q2_024_partial_01_0308 : Poly :=
[
  term ((-3462285032491382 : Rat) / 1162780221153193) [(0, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3462285032491382 : Rat) / 1162780221153193) [(1, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((1731142516245691 : Rat) / 1162780221153193) [(6, 2), (11, 1), (15, 1), (16, 1)],
  term ((1731142516245691 : Rat) / 1162780221153193) [(7, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 308 for generator 1. -/
theorem ep_Q2_024_partial_01_0308_valid :
    mulPoly ep_Q2_024_coefficient_01_0308
        ep_Q2_024_generator_01_0300_0346 =
      ep_Q2_024_partial_01_0308 := by
  native_decide

/-- Coefficient term 309 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0309 : Poly :=
[
  term ((-2233057704898447277337521117967487825271887127131734968 : Rat) / 697499214099014863878580073127199423100509817435596035) [(11, 1), (15, 3)]
]

/-- Partial product 309 for generator 1. -/
def ep_Q2_024_partial_01_0309 : Poly :=
[
  term ((-4466115409796894554675042235934975650543774254263469936 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (6, 1), (11, 1), (15, 3)],
  term ((-4466115409796894554675042235934975650543774254263469936 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (7, 1), (11, 1), (15, 3)],
  term ((2233057704898447277337521117967487825271887127131734968 : Rat) / 697499214099014863878580073127199423100509817435596035) [(6, 2), (11, 1), (15, 3)],
  term ((2233057704898447277337521117967487825271887127131734968 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 2), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 309 for generator 1. -/
theorem ep_Q2_024_partial_01_0309_valid :
    mulPoly ep_Q2_024_coefficient_01_0309
        ep_Q2_024_generator_01_0300_0346 =
      ep_Q2_024_partial_01_0309 := by
  native_decide

/-- Coefficient term 310 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0310 : Poly :=
[
  term ((449127554429600 : Rat) / 1162780221153193) [(11, 1), (15, 3), (16, 1)]
]

/-- Partial product 310 for generator 1. -/
def ep_Q2_024_partial_01_0310 : Poly :=
[
  term ((898255108859200 : Rat) / 1162780221153193) [(0, 1), (6, 1), (11, 1), (15, 3), (16, 1)],
  term ((898255108859200 : Rat) / 1162780221153193) [(1, 1), (7, 1), (11, 1), (15, 3), (16, 1)],
  term ((-449127554429600 : Rat) / 1162780221153193) [(6, 2), (11, 1), (15, 3), (16, 1)],
  term ((-449127554429600 : Rat) / 1162780221153193) [(7, 2), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 310 for generator 1. -/
theorem ep_Q2_024_partial_01_0310_valid :
    mulPoly ep_Q2_024_coefficient_01_0310
        ep_Q2_024_generator_01_0300_0346 =
      ep_Q2_024_partial_01_0310 := by
  native_decide

/-- Coefficient term 311 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0311 : Poly :=
[
  term ((-1429182194689304419382031011936884624481 : Rat) / 1799564186103715944850040292044308901985) [(11, 2)]
]

/-- Partial product 311 for generator 1. -/
def ep_Q2_024_partial_01_0311 : Poly :=
[
  term ((-2858364389378608838764062023873769248962 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (6, 1), (11, 2)],
  term ((-2858364389378608838764062023873769248962 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (7, 1), (11, 2)],
  term ((1429182194689304419382031011936884624481 : Rat) / 1799564186103715944850040292044308901985) [(6, 2), (11, 2)],
  term ((1429182194689304419382031011936884624481 : Rat) / 1799564186103715944850040292044308901985) [(7, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 311 for generator 1. -/
theorem ep_Q2_024_partial_01_0311_valid :
    mulPoly ep_Q2_024_coefficient_01_0311
        ep_Q2_024_generator_01_0300_0346 =
      ep_Q2_024_partial_01_0311 := by
  native_decide

/-- Coefficient term 312 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0312 : Poly :=
[
  term ((84782883764518120948021859280784483835006937782370880283 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(12, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 312 for generator 1. -/
def ep_Q2_024_partial_01_0312 : Poly :=
[
  term ((84782883764518120948021859280784483835006937782370880283 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(0, 1), (6, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((84782883764518120948021859280784483835006937782370880283 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(1, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-84782883764518120948021859280784483835006937782370880283 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(6, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-84782883764518120948021859280784483835006937782370880283 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(7, 2), (12, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 312 for generator 1. -/
theorem ep_Q2_024_partial_01_0312_valid :
    mulPoly ep_Q2_024_coefficient_01_0312
        ep_Q2_024_generator_01_0300_0346 =
      ep_Q2_024_partial_01_0312 := by
  native_decide

/-- Coefficient term 313 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0313 : Poly :=
[
  term ((-2449693339989265 : Rat) / 2325560442306386) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 313 for generator 1. -/
def ep_Q2_024_partial_01_0313 : Poly :=
[
  term ((-2449693339989265 : Rat) / 1162780221153193) [(0, 1), (6, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2449693339989265 : Rat) / 1162780221153193) [(1, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((2449693339989265 : Rat) / 2325560442306386) [(6, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((2449693339989265 : Rat) / 2325560442306386) [(7, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 313 for generator 1. -/
theorem ep_Q2_024_partial_01_0313_valid :
    mulPoly ep_Q2_024_coefficient_01_0313
        ep_Q2_024_generator_01_0300_0346 =
      ep_Q2_024_partial_01_0313 := by
  native_decide

/-- Coefficient term 314 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0314 : Poly :=
[
  term ((-214387558702680330369969064415226255543635584708941282077 : Rat) / 33479962276752713466171843510105572308824471236908609680) [(12, 1), (13, 1), (15, 1)]
]

/-- Partial product 314 for generator 1. -/
def ep_Q2_024_partial_01_0314 : Poly :=
[
  term ((-214387558702680330369969064415226255543635584708941282077 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(0, 1), (6, 1), (12, 1), (13, 1), (15, 1)],
  term ((-214387558702680330369969064415226255543635584708941282077 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(1, 1), (7, 1), (12, 1), (13, 1), (15, 1)],
  term ((214387558702680330369969064415226255543635584708941282077 : Rat) / 33479962276752713466171843510105572308824471236908609680) [(6, 2), (12, 1), (13, 1), (15, 1)],
  term ((214387558702680330369969064415226255543635584708941282077 : Rat) / 33479962276752713466171843510105572308824471236908609680) [(7, 2), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 314 for generator 1. -/
theorem ep_Q2_024_partial_01_0314_valid :
    mulPoly ep_Q2_024_coefficient_01_0314
        ep_Q2_024_generator_01_0300_0346 =
      ep_Q2_024_partial_01_0314 := by
  native_decide

/-- Coefficient term 315 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0315 : Poly :=
[
  term ((131503738079788567 : Rat) / 13953362653838316) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 315 for generator 1. -/
def ep_Q2_024_partial_01_0315 : Poly :=
[
  term ((131503738079788567 : Rat) / 6976681326919158) [(0, 1), (6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((131503738079788567 : Rat) / 6976681326919158) [(1, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-131503738079788567 : Rat) / 13953362653838316) [(6, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-131503738079788567 : Rat) / 13953362653838316) [(7, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 315 for generator 1. -/
theorem ep_Q2_024_partial_01_0315_valid :
    mulPoly ep_Q2_024_coefficient_01_0315
        ep_Q2_024_generator_01_0300_0346 =
      ep_Q2_024_partial_01_0315 := by
  native_decide

/-- Coefficient term 316 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0316 : Poly :=
[
  term ((4356564189724637708906259429022804199456 : Rat) / 1799564186103715944850040292044308901985) [(12, 1), (13, 2)]
]

/-- Partial product 316 for generator 1. -/
def ep_Q2_024_partial_01_0316 : Poly :=
[
  term ((8713128379449275417812518858045608398912 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (6, 1), (12, 1), (13, 2)],
  term ((8713128379449275417812518858045608398912 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (7, 1), (12, 1), (13, 2)],
  term ((-4356564189724637708906259429022804199456 : Rat) / 1799564186103715944850040292044308901985) [(6, 2), (12, 1), (13, 2)],
  term ((-4356564189724637708906259429022804199456 : Rat) / 1799564186103715944850040292044308901985) [(7, 2), (12, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 316 for generator 1. -/
theorem ep_Q2_024_partial_01_0316_valid :
    mulPoly ep_Q2_024_coefficient_01_0316
        ep_Q2_024_generator_01_0300_0346 =
      ep_Q2_024_partial_01_0316 := by
  native_decide

/-- Coefficient term 317 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0317 : Poly :=
[
  term ((-296822444626495253279669245943746663906 : Rat) / 599854728701238648283346764014769633995) [(12, 1), (13, 2), (14, 1)]
]

/-- Partial product 317 for generator 1. -/
def ep_Q2_024_partial_01_0317 : Poly :=
[
  term ((-593644889252990506559338491887493327812 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (6, 1), (12, 1), (13, 2), (14, 1)],
  term ((-593644889252990506559338491887493327812 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (7, 1), (12, 1), (13, 2), (14, 1)],
  term ((296822444626495253279669245943746663906 : Rat) / 599854728701238648283346764014769633995) [(6, 2), (12, 1), (13, 2), (14, 1)],
  term ((296822444626495253279669245943746663906 : Rat) / 599854728701238648283346764014769633995) [(7, 2), (12, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 317 for generator 1. -/
theorem ep_Q2_024_partial_01_0317_valid :
    mulPoly ep_Q2_024_coefficient_01_0317
        ep_Q2_024_generator_01_0300_0346 =
      ep_Q2_024_partial_01_0317 := by
  native_decide

/-- Coefficient term 318 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0318 : Poly :=
[
  term ((-184684620853449952814620827932751714007739040900298451677 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(12, 1), (14, 1), (15, 2)]
]

/-- Partial product 318 for generator 1. -/
def ep_Q2_024_partial_01_0318 : Poly :=
[
  term ((-184684620853449952814620827932751714007739040900298451677 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(0, 1), (6, 1), (12, 1), (14, 1), (15, 2)],
  term ((-184684620853449952814620827932751714007739040900298451677 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(1, 1), (7, 1), (12, 1), (14, 1), (15, 2)],
  term ((184684620853449952814620827932751714007739040900298451677 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(6, 2), (12, 1), (14, 1), (15, 2)],
  term ((184684620853449952814620827932751714007739040900298451677 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(7, 2), (12, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 318 for generator 1. -/
theorem ep_Q2_024_partial_01_0318_valid :
    mulPoly ep_Q2_024_coefficient_01_0318
        ep_Q2_024_generator_01_0300_0346 =
      ep_Q2_024_partial_01_0318 := by
  native_decide

/-- Coefficient term 319 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0319 : Poly :=
[
  term ((11536479425158903 : Rat) / 1162780221153193) [(12, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 319 for generator 1. -/
def ep_Q2_024_partial_01_0319 : Poly :=
[
  term ((23072958850317806 : Rat) / 1162780221153193) [(0, 1), (6, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((23072958850317806 : Rat) / 1162780221153193) [(1, 1), (7, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-11536479425158903 : Rat) / 1162780221153193) [(6, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-11536479425158903 : Rat) / 1162780221153193) [(7, 2), (12, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 319 for generator 1. -/
theorem ep_Q2_024_partial_01_0319_valid :
    mulPoly ep_Q2_024_coefficient_01_0319
        ep_Q2_024_generator_01_0300_0346 =
      ep_Q2_024_partial_01_0319 := by
  native_decide

/-- Coefficient term 320 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0320 : Poly :=
[
  term ((447481119309076194849599014937502304786099349969962623757 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(12, 1), (15, 2)]
]

/-- Partial product 320 for generator 1. -/
def ep_Q2_024_partial_01_0320 : Poly :=
[
  term ((447481119309076194849599014937502304786099349969962623757 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(0, 1), (6, 1), (12, 1), (15, 2)],
  term ((447481119309076194849599014937502304786099349969962623757 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(1, 1), (7, 1), (12, 1), (15, 2)],
  term ((-447481119309076194849599014937502304786099349969962623757 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(6, 2), (12, 1), (15, 2)],
  term ((-447481119309076194849599014937502304786099349969962623757 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(7, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 320 for generator 1. -/
theorem ep_Q2_024_partial_01_0320_valid :
    mulPoly ep_Q2_024_coefficient_01_0320
        ep_Q2_024_generator_01_0300_0346 =
      ep_Q2_024_partial_01_0320 := by
  native_decide

/-- Coefficient term 321 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0321 : Poly :=
[
  term ((42043259958870211 : Rat) / 6976681326919158) [(12, 1), (15, 2), (16, 1)]
]

/-- Partial product 321 for generator 1. -/
def ep_Q2_024_partial_01_0321 : Poly :=
[
  term ((42043259958870211 : Rat) / 3488340663459579) [(0, 1), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((42043259958870211 : Rat) / 3488340663459579) [(1, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((-42043259958870211 : Rat) / 6976681326919158) [(6, 2), (12, 1), (15, 2), (16, 1)],
  term ((-42043259958870211 : Rat) / 6976681326919158) [(7, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 321 for generator 1. -/
theorem ep_Q2_024_partial_01_0321_valid :
    mulPoly ep_Q2_024_coefficient_01_0321
        ep_Q2_024_generator_01_0300_0346 =
      ep_Q2_024_partial_01_0321 := by
  native_decide

/-- Coefficient term 322 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0322 : Poly :=
[
  term ((15951623849570376126102007844198250293244693592701822535 : Rat) / 1115998742558423782205728117003519076960815707896953656) [(12, 2), (13, 1), (15, 1)]
]

/-- Partial product 322 for generator 1. -/
def ep_Q2_024_partial_01_0322 : Poly :=
[
  term ((15951623849570376126102007844198250293244693592701822535 : Rat) / 557999371279211891102864058501759538480407853948476828) [(0, 1), (6, 1), (12, 2), (13, 1), (15, 1)],
  term ((15951623849570376126102007844198250293244693592701822535 : Rat) / 557999371279211891102864058501759538480407853948476828) [(1, 1), (7, 1), (12, 2), (13, 1), (15, 1)],
  term ((-15951623849570376126102007844198250293244693592701822535 : Rat) / 1115998742558423782205728117003519076960815707896953656) [(6, 2), (12, 2), (13, 1), (15, 1)],
  term ((-15951623849570376126102007844198250293244693592701822535 : Rat) / 1115998742558423782205728117003519076960815707896953656) [(7, 2), (12, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 322 for generator 1. -/
theorem ep_Q2_024_partial_01_0322_valid :
    mulPoly ep_Q2_024_coefficient_01_0322
        ep_Q2_024_generator_01_0300_0346 =
      ep_Q2_024_partial_01_0322 := by
  native_decide

/-- Coefficient term 323 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0323 : Poly :=
[
  term ((-5003541596661801 : Rat) / 2325560442306386) [(12, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 323 for generator 1. -/
def ep_Q2_024_partial_01_0323 : Poly :=
[
  term ((-5003541596661801 : Rat) / 1162780221153193) [(0, 1), (6, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-5003541596661801 : Rat) / 1162780221153193) [(1, 1), (7, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((5003541596661801 : Rat) / 2325560442306386) [(6, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((5003541596661801 : Rat) / 2325560442306386) [(7, 2), (12, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 323 for generator 1. -/
theorem ep_Q2_024_partial_01_0323_valid :
    mulPoly ep_Q2_024_coefficient_01_0323
        ep_Q2_024_generator_01_0300_0346 =
      ep_Q2_024_partial_01_0323 := by
  native_decide

/-- Coefficient term 324 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0324 : Poly :=
[
  term ((-124898830274193142709262456668953249078 : Rat) / 199951576233746216094448921338256544665) [(12, 2), (13, 2)]
]

/-- Partial product 324 for generator 1. -/
def ep_Q2_024_partial_01_0324 : Poly :=
[
  term ((-249797660548386285418524913337906498156 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (6, 1), (12, 2), (13, 2)],
  term ((-249797660548386285418524913337906498156 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (7, 1), (12, 2), (13, 2)],
  term ((124898830274193142709262456668953249078 : Rat) / 199951576233746216094448921338256544665) [(6, 2), (12, 2), (13, 2)],
  term ((124898830274193142709262456668953249078 : Rat) / 199951576233746216094448921338256544665) [(7, 2), (12, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 324 for generator 1. -/
theorem ep_Q2_024_partial_01_0324_valid :
    mulPoly ep_Q2_024_coefficient_01_0324
        ep_Q2_024_generator_01_0300_0346 =
      ep_Q2_024_partial_01_0324 := by
  native_decide

/-- Coefficient term 325 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0325 : Poly :=
[
  term ((1100529695907008564799077506604416650894267905418418037 : Rat) / 185999790426403963700954686167253179493469284649492276) [(12, 2), (15, 2)]
]

/-- Partial product 325 for generator 1. -/
def ep_Q2_024_partial_01_0325 : Poly :=
[
  term ((1100529695907008564799077506604416650894267905418418037 : Rat) / 92999895213201981850477343083626589746734642324746138) [(0, 1), (6, 1), (12, 2), (15, 2)],
  term ((1100529695907008564799077506604416650894267905418418037 : Rat) / 92999895213201981850477343083626589746734642324746138) [(1, 1), (7, 1), (12, 2), (15, 2)],
  term ((-1100529695907008564799077506604416650894267905418418037 : Rat) / 185999790426403963700954686167253179493469284649492276) [(6, 2), (12, 2), (15, 2)],
  term ((-1100529695907008564799077506604416650894267905418418037 : Rat) / 185999790426403963700954686167253179493469284649492276) [(7, 2), (12, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 325 for generator 1. -/
theorem ep_Q2_024_partial_01_0325_valid :
    mulPoly ep_Q2_024_coefficient_01_0325
        ep_Q2_024_generator_01_0300_0346 =
      ep_Q2_024_partial_01_0325 := by
  native_decide

/-- Coefficient term 326 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0326 : Poly :=
[
  term ((-3224281023627761 : Rat) / 1162780221153193) [(12, 2), (15, 2), (16, 1)]
]

/-- Partial product 326 for generator 1. -/
def ep_Q2_024_partial_01_0326 : Poly :=
[
  term ((-6448562047255522 : Rat) / 1162780221153193) [(0, 1), (6, 1), (12, 2), (15, 2), (16, 1)],
  term ((-6448562047255522 : Rat) / 1162780221153193) [(1, 1), (7, 1), (12, 2), (15, 2), (16, 1)],
  term ((3224281023627761 : Rat) / 1162780221153193) [(6, 2), (12, 2), (15, 2), (16, 1)],
  term ((3224281023627761 : Rat) / 1162780221153193) [(7, 2), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 326 for generator 1. -/
theorem ep_Q2_024_partial_01_0326_valid :
    mulPoly ep_Q2_024_coefficient_01_0326
        ep_Q2_024_generator_01_0300_0346 =
      ep_Q2_024_partial_01_0326 := by
  native_decide

/-- Coefficient term 327 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0327 : Poly :=
[
  term ((-1707583491439306856734350504558197990982731300436663247697 : Rat) / 33479962276752713466171843510105572308824471236908609680) [(13, 1), (14, 1), (15, 1)]
]

/-- Partial product 327 for generator 1. -/
def ep_Q2_024_partial_01_0327 : Poly :=
[
  term ((-1707583491439306856734350504558197990982731300436663247697 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(0, 1), (6, 1), (13, 1), (14, 1), (15, 1)],
  term ((-1707583491439306856734350504558197990982731300436663247697 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(1, 1), (7, 1), (13, 1), (14, 1), (15, 1)],
  term ((1707583491439306856734350504558197990982731300436663247697 : Rat) / 33479962276752713466171843510105572308824471236908609680) [(6, 2), (13, 1), (14, 1), (15, 1)],
  term ((1707583491439306856734350504558197990982731300436663247697 : Rat) / 33479962276752713466171843510105572308824471236908609680) [(7, 2), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 327 for generator 1. -/
theorem ep_Q2_024_partial_01_0327_valid :
    mulPoly ep_Q2_024_coefficient_01_0327
        ep_Q2_024_generator_01_0300_0346 =
      ep_Q2_024_partial_01_0327 := by
  native_decide

/-- Coefficient term 328 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0328 : Poly :=
[
  term ((94862438539086739 : Rat) / 13953362653838316) [(13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 328 for generator 1. -/
def ep_Q2_024_partial_01_0328 : Poly :=
[
  term ((94862438539086739 : Rat) / 6976681326919158) [(0, 1), (6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((94862438539086739 : Rat) / 6976681326919158) [(1, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-94862438539086739 : Rat) / 13953362653838316) [(6, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-94862438539086739 : Rat) / 13953362653838316) [(7, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 328 for generator 1. -/
theorem ep_Q2_024_partial_01_0328_valid :
    mulPoly ep_Q2_024_coefficient_01_0328
        ep_Q2_024_generator_01_0300_0346 =
      ep_Q2_024_partial_01_0328 := by
  native_decide

/-- Coefficient term 329 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0329 : Poly :=
[
  term ((279378849901640340919482647169569421746336183507144841 : Rat) / 232499738033004954626193357709066474366836605811865345) [(13, 1), (14, 2), (15, 1)]
]

/-- Partial product 329 for generator 1. -/
def ep_Q2_024_partial_01_0329 : Poly :=
[
  term ((558757699803280681838965294339138843492672367014289682 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (6, 1), (13, 1), (14, 2), (15, 1)],
  term ((558757699803280681838965294339138843492672367014289682 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (7, 1), (13, 1), (14, 2), (15, 1)],
  term ((-279378849901640340919482647169569421746336183507144841 : Rat) / 232499738033004954626193357709066474366836605811865345) [(6, 2), (13, 1), (14, 2), (15, 1)],
  term ((-279378849901640340919482647169569421746336183507144841 : Rat) / 232499738033004954626193357709066474366836605811865345) [(7, 2), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 329 for generator 1. -/
theorem ep_Q2_024_partial_01_0329_valid :
    mulPoly ep_Q2_024_coefficient_01_0329
        ep_Q2_024_generator_01_0300_0346 =
      ep_Q2_024_partial_01_0329 := by
  native_decide

/-- Coefficient term 330 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0330 : Poly :=
[
  term ((416983870520476 : Rat) / 1162780221153193) [(13, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 330 for generator 1. -/
def ep_Q2_024_partial_01_0330 : Poly :=
[
  term ((833967741040952 : Rat) / 1162780221153193) [(0, 1), (6, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((833967741040952 : Rat) / 1162780221153193) [(1, 1), (7, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-416983870520476 : Rat) / 1162780221153193) [(6, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-416983870520476 : Rat) / 1162780221153193) [(7, 2), (13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 330 for generator 1. -/
theorem ep_Q2_024_partial_01_0330_valid :
    mulPoly ep_Q2_024_coefficient_01_0330
        ep_Q2_024_generator_01_0300_0346 =
      ep_Q2_024_partial_01_0330 := by
  native_decide

/-- Coefficient term 331 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0331 : Poly :=
[
  term ((73027560841323976186528451446920322779404106358001197863 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(13, 1), (15, 1)]
]

/-- Partial product 331 for generator 1. -/
def ep_Q2_024_partial_01_0331 : Poly :=
[
  term ((73027560841323976186528451446920322779404106358001197863 : Rat) / 929998952132019818504773430836265897467346423247461380) [(0, 1), (6, 1), (13, 1), (15, 1)],
  term ((73027560841323976186528451446920322779404106358001197863 : Rat) / 929998952132019818504773430836265897467346423247461380) [(1, 1), (7, 1), (13, 1), (15, 1)],
  term ((-73027560841323976186528451446920322779404106358001197863 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(6, 2), (13, 1), (15, 1)],
  term ((-73027560841323976186528451446920322779404106358001197863 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(7, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 331 for generator 1. -/
theorem ep_Q2_024_partial_01_0331_valid :
    mulPoly ep_Q2_024_coefficient_01_0331
        ep_Q2_024_generator_01_0300_0346 =
      ep_Q2_024_partial_01_0331 := by
  native_decide

/-- Coefficient term 332 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0332 : Poly :=
[
  term ((-5571771468103243 : Rat) / 2325560442306386) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 332 for generator 1. -/
def ep_Q2_024_partial_01_0332 : Poly :=
[
  term ((-5571771468103243 : Rat) / 1162780221153193) [(0, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5571771468103243 : Rat) / 1162780221153193) [(1, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((5571771468103243 : Rat) / 2325560442306386) [(6, 2), (13, 1), (15, 1), (16, 1)],
  term ((5571771468103243 : Rat) / 2325560442306386) [(7, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 332 for generator 1. -/
theorem ep_Q2_024_partial_01_0332_valid :
    mulPoly ep_Q2_024_coefficient_01_0332
        ep_Q2_024_generator_01_0300_0346 =
      ep_Q2_024_partial_01_0332 := by
  native_decide

/-- Coefficient term 333 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0333 : Poly :=
[
  term ((-15109217256518315323716689223387286634317328803199609516 : Rat) / 697499214099014863878580073127199423100509817435596035) [(13, 1), (15, 3)]
]

/-- Partial product 333 for generator 1. -/
def ep_Q2_024_partial_01_0333 : Poly :=
[
  term ((-30218434513036630647433378446774573268634657606399219032 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (6, 1), (13, 1), (15, 3)],
  term ((-30218434513036630647433378446774573268634657606399219032 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (7, 1), (13, 1), (15, 3)],
  term ((15109217256518315323716689223387286634317328803199609516 : Rat) / 697499214099014863878580073127199423100509817435596035) [(6, 2), (13, 1), (15, 3)],
  term ((15109217256518315323716689223387286634317328803199609516 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 2), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 333 for generator 1. -/
theorem ep_Q2_024_partial_01_0333_valid :
    mulPoly ep_Q2_024_coefficient_01_0333
        ep_Q2_024_generator_01_0300_0346 =
      ep_Q2_024_partial_01_0333 := by
  native_decide

/-- Coefficient term 334 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0334 : Poly :=
[
  term ((2130221066942416 : Rat) / 1162780221153193) [(13, 1), (15, 3), (16, 1)]
]

/-- Partial product 334 for generator 1. -/
def ep_Q2_024_partial_01_0334 : Poly :=
[
  term ((4260442133884832 : Rat) / 1162780221153193) [(0, 1), (6, 1), (13, 1), (15, 3), (16, 1)],
  term ((4260442133884832 : Rat) / 1162780221153193) [(1, 1), (7, 1), (13, 1), (15, 3), (16, 1)],
  term ((-2130221066942416 : Rat) / 1162780221153193) [(6, 2), (13, 1), (15, 3), (16, 1)],
  term ((-2130221066942416 : Rat) / 1162780221153193) [(7, 2), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 334 for generator 1. -/
theorem ep_Q2_024_partial_01_0334_valid :
    mulPoly ep_Q2_024_coefficient_01_0334
        ep_Q2_024_generator_01_0300_0346 =
      ep_Q2_024_partial_01_0334 := by
  native_decide

/-- Coefficient term 335 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0335 : Poly :=
[
  term ((-120446728144359541295066030314103179834 : Rat) / 599854728701238648283346764014769633995) [(13, 2)]
]

/-- Partial product 335 for generator 1. -/
def ep_Q2_024_partial_01_0335 : Poly :=
[
  term ((-240893456288719082590132060628206359668 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (6, 1), (13, 2)],
  term ((-240893456288719082590132060628206359668 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (7, 1), (13, 2)],
  term ((120446728144359541295066030314103179834 : Rat) / 599854728701238648283346764014769633995) [(6, 2), (13, 2)],
  term ((120446728144359541295066030314103179834 : Rat) / 599854728701238648283346764014769633995) [(7, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 335 for generator 1. -/
theorem ep_Q2_024_partial_01_0335_valid :
    mulPoly ep_Q2_024_coefficient_01_0335
        ep_Q2_024_generator_01_0300_0346 =
      ep_Q2_024_partial_01_0335 := by
  native_decide

/-- Coefficient term 336 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0336 : Poly :=
[
  term ((1456015077566618122734629956119424016696 : Rat) / 1799564186103715944850040292044308901985) [(13, 2), (14, 1)]
]

/-- Partial product 336 for generator 1. -/
def ep_Q2_024_partial_01_0336 : Poly :=
[
  term ((2912030155133236245469259912238848033392 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (6, 1), (13, 2), (14, 1)],
  term ((2912030155133236245469259912238848033392 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (7, 1), (13, 2), (14, 1)],
  term ((-1456015077566618122734629956119424016696 : Rat) / 1799564186103715944850040292044308901985) [(6, 2), (13, 2), (14, 1)],
  term ((-1456015077566618122734629956119424016696 : Rat) / 1799564186103715944850040292044308901985) [(7, 2), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 336 for generator 1. -/
theorem ep_Q2_024_partial_01_0336_valid :
    mulPoly ep_Q2_024_coefficient_01_0336
        ep_Q2_024_generator_01_0300_0346 =
      ep_Q2_024_partial_01_0336 := by
  native_decide

/-- Coefficient term 337 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0337 : Poly :=
[
  term ((2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(13, 2), (14, 2)]
]

/-- Partial product 337 for generator 1. -/
def ep_Q2_024_partial_01_0337 : Poly :=
[
  term ((4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (6, 1), (13, 2), (14, 2)],
  term ((4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (7, 1), (13, 2), (14, 2)],
  term ((-2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(6, 2), (13, 2), (14, 2)],
  term ((-2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(7, 2), (13, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 337 for generator 1. -/
theorem ep_Q2_024_partial_01_0337_valid :
    mulPoly ep_Q2_024_coefficient_01_0337
        ep_Q2_024_generator_01_0300_0346 =
      ep_Q2_024_partial_01_0337 := by
  native_decide

/-- Coefficient term 338 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0338 : Poly :=
[
  term ((11530512132661982754025626129402130138490986283296027556 : Rat) / 697499214099014863878580073127199423100509817435596035) [(13, 2), (15, 2)]
]

/-- Partial product 338 for generator 1. -/
def ep_Q2_024_partial_01_0338 : Poly :=
[
  term ((23061024265323965508051252258804260276981972566592055112 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (6, 1), (13, 2), (15, 2)],
  term ((23061024265323965508051252258804260276981972566592055112 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (7, 1), (13, 2), (15, 2)],
  term ((-11530512132661982754025626129402130138490986283296027556 : Rat) / 697499214099014863878580073127199423100509817435596035) [(6, 2), (13, 2), (15, 2)],
  term ((-11530512132661982754025626129402130138490986283296027556 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 2), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 338 for generator 1. -/
theorem ep_Q2_024_partial_01_0338_valid :
    mulPoly ep_Q2_024_coefficient_01_0338
        ep_Q2_024_generator_01_0300_0346 =
      ep_Q2_024_partial_01_0338 := by
  native_decide

/-- Coefficient term 339 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0339 : Poly :=
[
  term ((-150661185588720 : Rat) / 1162780221153193) [(13, 2), (15, 2), (16, 1)]
]

/-- Partial product 339 for generator 1. -/
def ep_Q2_024_partial_01_0339 : Poly :=
[
  term ((-301322371177440 : Rat) / 1162780221153193) [(0, 1), (6, 1), (13, 2), (15, 2), (16, 1)],
  term ((-301322371177440 : Rat) / 1162780221153193) [(1, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((150661185588720 : Rat) / 1162780221153193) [(6, 2), (13, 2), (15, 2), (16, 1)],
  term ((150661185588720 : Rat) / 1162780221153193) [(7, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 339 for generator 1. -/
theorem ep_Q2_024_partial_01_0339_valid :
    mulPoly ep_Q2_024_coefficient_01_0339
        ep_Q2_024_generator_01_0300_0346 =
      ep_Q2_024_partial_01_0339 := by
  native_decide

/-- Coefficient term 340 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0340 : Poly :=
[
  term ((-80945856112067634232098240062478093344 : Rat) / 599854728701238648283346764014769633995) [(13, 3), (15, 1)]
]

/-- Partial product 340 for generator 1. -/
def ep_Q2_024_partial_01_0340 : Poly :=
[
  term ((-161891712224135268464196480124956186688 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (6, 1), (13, 3), (15, 1)],
  term ((-161891712224135268464196480124956186688 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (7, 1), (13, 3), (15, 1)],
  term ((80945856112067634232098240062478093344 : Rat) / 599854728701238648283346764014769633995) [(6, 2), (13, 3), (15, 1)],
  term ((80945856112067634232098240062478093344 : Rat) / 599854728701238648283346764014769633995) [(7, 2), (13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 340 for generator 1. -/
theorem ep_Q2_024_partial_01_0340_valid :
    mulPoly ep_Q2_024_coefficient_01_0340
        ep_Q2_024_generator_01_0300_0346 =
      ep_Q2_024_partial_01_0340 := by
  native_decide

/-- Coefficient term 341 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0341 : Poly :=
[
  term ((-249562434230076519877457627355935784697985556458557189433 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(14, 1), (15, 2)]
]

/-- Partial product 341 for generator 1. -/
def ep_Q2_024_partial_01_0341 : Poly :=
[
  term ((-249562434230076519877457627355935784697985556458557189433 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(0, 1), (6, 1), (14, 1), (15, 2)],
  term ((-249562434230076519877457627355935784697985556458557189433 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(1, 1), (7, 1), (14, 1), (15, 2)],
  term ((249562434230076519877457627355935784697985556458557189433 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(6, 2), (14, 1), (15, 2)],
  term ((249562434230076519877457627355935784697985556458557189433 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(7, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 341 for generator 1. -/
theorem ep_Q2_024_partial_01_0341_valid :
    mulPoly ep_Q2_024_coefficient_01_0341
        ep_Q2_024_generator_01_0300_0346 =
      ep_Q2_024_partial_01_0341 := by
  native_decide

/-- Coefficient term 342 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0342 : Poly :=
[
  term ((138348488323751089 : Rat) / 6976681326919158) [(14, 1), (15, 2), (16, 1)]
]

/-- Partial product 342 for generator 1. -/
def ep_Q2_024_partial_01_0342 : Poly :=
[
  term ((138348488323751089 : Rat) / 3488340663459579) [(0, 1), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((138348488323751089 : Rat) / 3488340663459579) [(1, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((-138348488323751089 : Rat) / 6976681326919158) [(6, 2), (14, 1), (15, 2), (16, 1)],
  term ((-138348488323751089 : Rat) / 6976681326919158) [(7, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 342 for generator 1. -/
theorem ep_Q2_024_partial_01_0342_valid :
    mulPoly ep_Q2_024_coefficient_01_0342
        ep_Q2_024_generator_01_0300_0346 =
      ep_Q2_024_partial_01_0342 := by
  native_decide

/-- Coefficient term 343 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0343 : Poly :=
[
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(14, 2), (15, 2)]
]

/-- Partial product 343 for generator 1. -/
def ep_Q2_024_partial_01_0343 : Poly :=
[
  term ((-674456529895393409686477352003493571793009190155093372 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (6, 1), (14, 2), (15, 2)],
  term ((-674456529895393409686477352003493571793009190155093372 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (7, 1), (14, 2), (15, 2)],
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(6, 2), (14, 2), (15, 2)],
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(7, 2), (14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 343 for generator 1. -/
theorem ep_Q2_024_partial_01_0343_valid :
    mulPoly ep_Q2_024_coefficient_01_0343
        ep_Q2_024_generator_01_0300_0346 =
      ep_Q2_024_partial_01_0343 := by
  native_decide

/-- Coefficient term 344 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0344 : Poly :=
[
  term ((-833967741040952 : Rat) / 1162780221153193) [(14, 2), (15, 2), (16, 1)]
]

/-- Partial product 344 for generator 1. -/
def ep_Q2_024_partial_01_0344 : Poly :=
[
  term ((-1667935482081904 : Rat) / 1162780221153193) [(0, 1), (6, 1), (14, 2), (15, 2), (16, 1)],
  term ((-1667935482081904 : Rat) / 1162780221153193) [(1, 1), (7, 1), (14, 2), (15, 2), (16, 1)],
  term ((833967741040952 : Rat) / 1162780221153193) [(6, 2), (14, 2), (15, 2), (16, 1)],
  term ((833967741040952 : Rat) / 1162780221153193) [(7, 2), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 344 for generator 1. -/
theorem ep_Q2_024_partial_01_0344_valid :
    mulPoly ep_Q2_024_coefficient_01_0344
        ep_Q2_024_generator_01_0300_0346 =
      ep_Q2_024_partial_01_0344 := by
  native_decide

/-- Coefficient term 345 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0345 : Poly :=
[
  term ((-303197347720279522945960624054822934173231987169673121843 : Rat) / 3719995808528079274019093723345063589869385692989845520) [(15, 2)]
]

/-- Partial product 345 for generator 1. -/
def ep_Q2_024_partial_01_0345 : Poly :=
[
  term ((-303197347720279522945960624054822934173231987169673121843 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(0, 1), (6, 1), (15, 2)],
  term ((-303197347720279522945960624054822934173231987169673121843 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(1, 1), (7, 1), (15, 2)],
  term ((303197347720279522945960624054822934173231987169673121843 : Rat) / 3719995808528079274019093723345063589869385692989845520) [(6, 2), (15, 2)],
  term ((303197347720279522945960624054822934173231987169673121843 : Rat) / 3719995808528079274019093723345063589869385692989845520) [(7, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 345 for generator 1. -/
theorem ep_Q2_024_partial_01_0345_valid :
    mulPoly ep_Q2_024_coefficient_01_0345
        ep_Q2_024_generator_01_0300_0346 =
      ep_Q2_024_partial_01_0345 := by
  native_decide

/-- Coefficient term 346 from coefficient polynomial 1. -/
def ep_Q2_024_coefficient_01_0346 : Poly :=
[
  term ((-46761063904070125 : Rat) / 4651120884612772) [(15, 2), (16, 1)]
]

/-- Partial product 346 for generator 1. -/
def ep_Q2_024_partial_01_0346 : Poly :=
[
  term ((-46761063904070125 : Rat) / 2325560442306386) [(0, 1), (6, 1), (15, 2), (16, 1)],
  term ((-46761063904070125 : Rat) / 2325560442306386) [(1, 1), (7, 1), (15, 2), (16, 1)],
  term ((46761063904070125 : Rat) / 4651120884612772) [(6, 2), (15, 2), (16, 1)],
  term ((46761063904070125 : Rat) / 4651120884612772) [(7, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 346 for generator 1. -/
theorem ep_Q2_024_partial_01_0346_valid :
    mulPoly ep_Q2_024_coefficient_01_0346
        ep_Q2_024_generator_01_0300_0346 =
      ep_Q2_024_partial_01_0346 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_024_partials_01_0300_0346 : List Poly :=
[
  ep_Q2_024_partial_01_0300,
  ep_Q2_024_partial_01_0301,
  ep_Q2_024_partial_01_0302,
  ep_Q2_024_partial_01_0303,
  ep_Q2_024_partial_01_0304,
  ep_Q2_024_partial_01_0305,
  ep_Q2_024_partial_01_0306,
  ep_Q2_024_partial_01_0307,
  ep_Q2_024_partial_01_0308,
  ep_Q2_024_partial_01_0309,
  ep_Q2_024_partial_01_0310,
  ep_Q2_024_partial_01_0311,
  ep_Q2_024_partial_01_0312,
  ep_Q2_024_partial_01_0313,
  ep_Q2_024_partial_01_0314,
  ep_Q2_024_partial_01_0315,
  ep_Q2_024_partial_01_0316,
  ep_Q2_024_partial_01_0317,
  ep_Q2_024_partial_01_0318,
  ep_Q2_024_partial_01_0319,
  ep_Q2_024_partial_01_0320,
  ep_Q2_024_partial_01_0321,
  ep_Q2_024_partial_01_0322,
  ep_Q2_024_partial_01_0323,
  ep_Q2_024_partial_01_0324,
  ep_Q2_024_partial_01_0325,
  ep_Q2_024_partial_01_0326,
  ep_Q2_024_partial_01_0327,
  ep_Q2_024_partial_01_0328,
  ep_Q2_024_partial_01_0329,
  ep_Q2_024_partial_01_0330,
  ep_Q2_024_partial_01_0331,
  ep_Q2_024_partial_01_0332,
  ep_Q2_024_partial_01_0333,
  ep_Q2_024_partial_01_0334,
  ep_Q2_024_partial_01_0335,
  ep_Q2_024_partial_01_0336,
  ep_Q2_024_partial_01_0337,
  ep_Q2_024_partial_01_0338,
  ep_Q2_024_partial_01_0339,
  ep_Q2_024_partial_01_0340,
  ep_Q2_024_partial_01_0341,
  ep_Q2_024_partial_01_0342,
  ep_Q2_024_partial_01_0343,
  ep_Q2_024_partial_01_0344,
  ep_Q2_024_partial_01_0345,
  ep_Q2_024_partial_01_0346
]

/-- Sum of partial products in this block. -/
def ep_Q2_024_block_01_0300_0346 : Poly :=
[
  term ((624907938474822427281599088403147080688 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (6, 1), (11, 1), (12, 2), (13, 1)],
  term ((-5596751201457925662836715300015825190436979755421300347 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (6, 1), (11, 1), (12, 2), (15, 1)],
  term ((3917387395345996 : Rat) / 1162780221153193) [(0, 1), (6, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((2493001256898739146623768977171737933436 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (6, 1), (11, 1), (13, 1)],
  term ((-13452538771991862445263404872089117185972849609954856272 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (6, 1), (11, 1), (13, 1), (15, 2)],
  term ((2694765326577600 : Rat) / 1162780221153193) [(0, 1), (6, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-46606006548196236713541705654221512448 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (6, 1), (11, 1), (13, 2), (15, 1)],
  term ((-192310281104939503004456638320760459762053553695717730571 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(0, 1), (6, 1), (11, 1), (15, 1)],
  term ((-3462285032491382 : Rat) / 1162780221153193) [(0, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-4466115409796894554675042235934975650543774254263469936 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (6, 1), (11, 1), (15, 3)],
  term ((898255108859200 : Rat) / 1162780221153193) [(0, 1), (6, 1), (11, 1), (15, 3), (16, 1)],
  term ((-2858364389378608838764062023873769248962 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (6, 1), (11, 2)],
  term ((84782883764518120948021859280784483835006937782370880283 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(0, 1), (6, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-2449693339989265 : Rat) / 1162780221153193) [(0, 1), (6, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-214387558702680330369969064415226255543635584708941282077 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(0, 1), (6, 1), (12, 1), (13, 1), (15, 1)],
  term ((131503738079788567 : Rat) / 6976681326919158) [(0, 1), (6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((8713128379449275417812518858045608398912 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (6, 1), (12, 1), (13, 2)],
  term ((-593644889252990506559338491887493327812 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (6, 1), (12, 1), (13, 2), (14, 1)],
  term ((-184684620853449952814620827932751714007739040900298451677 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(0, 1), (6, 1), (12, 1), (14, 1), (15, 2)],
  term ((23072958850317806 : Rat) / 1162780221153193) [(0, 1), (6, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((447481119309076194849599014937502304786099349969962623757 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(0, 1), (6, 1), (12, 1), (15, 2)],
  term ((42043259958870211 : Rat) / 3488340663459579) [(0, 1), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((15951623849570376126102007844198250293244693592701822535 : Rat) / 557999371279211891102864058501759538480407853948476828) [(0, 1), (6, 1), (12, 2), (13, 1), (15, 1)],
  term ((-5003541596661801 : Rat) / 1162780221153193) [(0, 1), (6, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-249797660548386285418524913337906498156 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (6, 1), (12, 2), (13, 2)],
  term ((1100529695907008564799077506604416650894267905418418037 : Rat) / 92999895213201981850477343083626589746734642324746138) [(0, 1), (6, 1), (12, 2), (15, 2)],
  term ((-6448562047255522 : Rat) / 1162780221153193) [(0, 1), (6, 1), (12, 2), (15, 2), (16, 1)],
  term ((-1707583491439306856734350504558197990982731300436663247697 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(0, 1), (6, 1), (13, 1), (14, 1), (15, 1)],
  term ((94862438539086739 : Rat) / 6976681326919158) [(0, 1), (6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((558757699803280681838965294339138843492672367014289682 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (6, 1), (13, 1), (14, 2), (15, 1)],
  term ((833967741040952 : Rat) / 1162780221153193) [(0, 1), (6, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((73027560841323976186528451446920322779404106358001197863 : Rat) / 929998952132019818504773430836265897467346423247461380) [(0, 1), (6, 1), (13, 1), (15, 1)],
  term ((-5571771468103243 : Rat) / 1162780221153193) [(0, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-30218434513036630647433378446774573268634657606399219032 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (6, 1), (13, 1), (15, 3)],
  term ((4260442133884832 : Rat) / 1162780221153193) [(0, 1), (6, 1), (13, 1), (15, 3), (16, 1)],
  term ((-240893456288719082590132060628206359668 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (6, 1), (13, 2)],
  term ((2912030155133236245469259912238848033392 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (6, 1), (13, 2), (14, 1)],
  term ((4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (6, 1), (13, 2), (14, 2)],
  term ((23061024265323965508051252258804260276981972566592055112 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (6, 1), (13, 2), (15, 2)],
  term ((-301322371177440 : Rat) / 1162780221153193) [(0, 1), (6, 1), (13, 2), (15, 2), (16, 1)],
  term ((-161891712224135268464196480124956186688 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (6, 1), (13, 3), (15, 1)],
  term ((-249562434230076519877457627355935784697985556458557189433 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(0, 1), (6, 1), (14, 1), (15, 2)],
  term ((138348488323751089 : Rat) / 3488340663459579) [(0, 1), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((-674456529895393409686477352003493571793009190155093372 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (6, 1), (14, 2), (15, 2)],
  term ((-1667935482081904 : Rat) / 1162780221153193) [(0, 1), (6, 1), (14, 2), (15, 2), (16, 1)],
  term ((-303197347720279522945960624054822934173231987169673121843 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(0, 1), (6, 1), (15, 2)],
  term ((-46761063904070125 : Rat) / 2325560442306386) [(0, 1), (6, 1), (15, 2), (16, 1)],
  term ((624907938474822427281599088403147080688 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (7, 1), (11, 1), (12, 2), (13, 1)],
  term ((-5596751201457925662836715300015825190436979755421300347 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (7, 1), (11, 1), (12, 2), (15, 1)],
  term ((3917387395345996 : Rat) / 1162780221153193) [(1, 1), (7, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((2493001256898739146623768977171737933436 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (7, 1), (11, 1), (13, 1)],
  term ((-13452538771991862445263404872089117185972849609954856272 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (7, 1), (11, 1), (13, 1), (15, 2)],
  term ((2694765326577600 : Rat) / 1162780221153193) [(1, 1), (7, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-46606006548196236713541705654221512448 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (7, 1), (11, 1), (13, 2), (15, 1)],
  term ((-192310281104939503004456638320760459762053553695717730571 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(1, 1), (7, 1), (11, 1), (15, 1)],
  term ((-3462285032491382 : Rat) / 1162780221153193) [(1, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-4466115409796894554675042235934975650543774254263469936 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (7, 1), (11, 1), (15, 3)],
  term ((898255108859200 : Rat) / 1162780221153193) [(1, 1), (7, 1), (11, 1), (15, 3), (16, 1)],
  term ((-2858364389378608838764062023873769248962 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (7, 1), (11, 2)],
  term ((84782883764518120948021859280784483835006937782370880283 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(1, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-2449693339989265 : Rat) / 1162780221153193) [(1, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-214387558702680330369969064415226255543635584708941282077 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(1, 1), (7, 1), (12, 1), (13, 1), (15, 1)],
  term ((131503738079788567 : Rat) / 6976681326919158) [(1, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((8713128379449275417812518858045608398912 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (7, 1), (12, 1), (13, 2)],
  term ((-593644889252990506559338491887493327812 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (7, 1), (12, 1), (13, 2), (14, 1)],
  term ((-184684620853449952814620827932751714007739040900298451677 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(1, 1), (7, 1), (12, 1), (14, 1), (15, 2)],
  term ((23072958850317806 : Rat) / 1162780221153193) [(1, 1), (7, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((447481119309076194849599014937502304786099349969962623757 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(1, 1), (7, 1), (12, 1), (15, 2)],
  term ((42043259958870211 : Rat) / 3488340663459579) [(1, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((15951623849570376126102007844198250293244693592701822535 : Rat) / 557999371279211891102864058501759538480407853948476828) [(1, 1), (7, 1), (12, 2), (13, 1), (15, 1)],
  term ((-5003541596661801 : Rat) / 1162780221153193) [(1, 1), (7, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-249797660548386285418524913337906498156 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (7, 1), (12, 2), (13, 2)],
  term ((1100529695907008564799077506604416650894267905418418037 : Rat) / 92999895213201981850477343083626589746734642324746138) [(1, 1), (7, 1), (12, 2), (15, 2)],
  term ((-6448562047255522 : Rat) / 1162780221153193) [(1, 1), (7, 1), (12, 2), (15, 2), (16, 1)],
  term ((-1707583491439306856734350504558197990982731300436663247697 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(1, 1), (7, 1), (13, 1), (14, 1), (15, 1)],
  term ((94862438539086739 : Rat) / 6976681326919158) [(1, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((558757699803280681838965294339138843492672367014289682 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (7, 1), (13, 1), (14, 2), (15, 1)],
  term ((833967741040952 : Rat) / 1162780221153193) [(1, 1), (7, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((73027560841323976186528451446920322779404106358001197863 : Rat) / 929998952132019818504773430836265897467346423247461380) [(1, 1), (7, 1), (13, 1), (15, 1)],
  term ((-5571771468103243 : Rat) / 1162780221153193) [(1, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-30218434513036630647433378446774573268634657606399219032 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (7, 1), (13, 1), (15, 3)],
  term ((4260442133884832 : Rat) / 1162780221153193) [(1, 1), (7, 1), (13, 1), (15, 3), (16, 1)],
  term ((-240893456288719082590132060628206359668 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (7, 1), (13, 2)],
  term ((2912030155133236245469259912238848033392 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (7, 1), (13, 2), (14, 1)],
  term ((4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (7, 1), (13, 2), (14, 2)],
  term ((23061024265323965508051252258804260276981972566592055112 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (7, 1), (13, 2), (15, 2)],
  term ((-301322371177440 : Rat) / 1162780221153193) [(1, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((-161891712224135268464196480124956186688 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (7, 1), (13, 3), (15, 1)],
  term ((-249562434230076519877457627355935784697985556458557189433 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(1, 1), (7, 1), (14, 1), (15, 2)],
  term ((138348488323751089 : Rat) / 3488340663459579) [(1, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((-674456529895393409686477352003493571793009190155093372 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (7, 1), (14, 2), (15, 2)],
  term ((-1667935482081904 : Rat) / 1162780221153193) [(1, 1), (7, 1), (14, 2), (15, 2), (16, 1)],
  term ((-303197347720279522945960624054822934173231987169673121843 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(1, 1), (7, 1), (15, 2)],
  term ((-46761063904070125 : Rat) / 2325560442306386) [(1, 1), (7, 1), (15, 2), (16, 1)],
  term ((-312453969237411213640799544201573540344 : Rat) / 599854728701238648283346764014769633995) [(6, 2), (11, 1), (12, 2), (13, 1)],
  term ((5596751201457925662836715300015825190436979755421300347 : Rat) / 464999476066009909252386715418132948733673211623730690) [(6, 2), (11, 1), (12, 2), (15, 1)],
  term ((-1958693697672998 : Rat) / 1162780221153193) [(6, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1246500628449369573311884488585868966718 : Rat) / 1799564186103715944850040292044308901985) [(6, 2), (11, 1), (13, 1)],
  term ((6726269385995931222631702436044558592986424804977428136 : Rat) / 697499214099014863878580073127199423100509817435596035) [(6, 2), (11, 1), (13, 1), (15, 2)],
  term ((-1347382663288800 : Rat) / 1162780221153193) [(6, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((23303003274098118356770852827110756224 : Rat) / 199951576233746216094448921338256544665) [(6, 2), (11, 1), (13, 2), (15, 1)],
  term ((192310281104939503004456638320760459762053553695717730571 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(6, 2), (11, 1), (15, 1)],
  term ((1731142516245691 : Rat) / 1162780221153193) [(6, 2), (11, 1), (15, 1), (16, 1)],
  term ((2233057704898447277337521117967487825271887127131734968 : Rat) / 697499214099014863878580073127199423100509817435596035) [(6, 2), (11, 1), (15, 3)],
  term ((-449127554429600 : Rat) / 1162780221153193) [(6, 2), (11, 1), (15, 3), (16, 1)],
  term ((1429182194689304419382031011936884624481 : Rat) / 1799564186103715944850040292044308901985) [(6, 2), (11, 2)],
  term ((-84782883764518120948021859280784483835006937782370880283 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(6, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((2449693339989265 : Rat) / 2325560442306386) [(6, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((214387558702680330369969064415226255543635584708941282077 : Rat) / 33479962276752713466171843510105572308824471236908609680) [(6, 2), (12, 1), (13, 1), (15, 1)],
  term ((-131503738079788567 : Rat) / 13953362653838316) [(6, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4356564189724637708906259429022804199456 : Rat) / 1799564186103715944850040292044308901985) [(6, 2), (12, 1), (13, 2)],
  term ((296822444626495253279669245943746663906 : Rat) / 599854728701238648283346764014769633995) [(6, 2), (12, 1), (13, 2), (14, 1)],
  term ((184684620853449952814620827932751714007739040900298451677 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(6, 2), (12, 1), (14, 1), (15, 2)],
  term ((-11536479425158903 : Rat) / 1162780221153193) [(6, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-447481119309076194849599014937502304786099349969962623757 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(6, 2), (12, 1), (15, 2)],
  term ((-42043259958870211 : Rat) / 6976681326919158) [(6, 2), (12, 1), (15, 2), (16, 1)],
  term ((-15951623849570376126102007844198250293244693592701822535 : Rat) / 1115998742558423782205728117003519076960815707896953656) [(6, 2), (12, 2), (13, 1), (15, 1)],
  term ((5003541596661801 : Rat) / 2325560442306386) [(6, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((124898830274193142709262456668953249078 : Rat) / 199951576233746216094448921338256544665) [(6, 2), (12, 2), (13, 2)],
  term ((-1100529695907008564799077506604416650894267905418418037 : Rat) / 185999790426403963700954686167253179493469284649492276) [(6, 2), (12, 2), (15, 2)],
  term ((3224281023627761 : Rat) / 1162780221153193) [(6, 2), (12, 2), (15, 2), (16, 1)],
  term ((1707583491439306856734350504558197990982731300436663247697 : Rat) / 33479962276752713466171843510105572308824471236908609680) [(6, 2), (13, 1), (14, 1), (15, 1)],
  term ((-94862438539086739 : Rat) / 13953362653838316) [(6, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-279378849901640340919482647169569421746336183507144841 : Rat) / 232499738033004954626193357709066474366836605811865345) [(6, 2), (13, 1), (14, 2), (15, 1)],
  term ((-416983870520476 : Rat) / 1162780221153193) [(6, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-73027560841323976186528451446920322779404106358001197863 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(6, 2), (13, 1), (15, 1)],
  term ((5571771468103243 : Rat) / 2325560442306386) [(6, 2), (13, 1), (15, 1), (16, 1)],
  term ((15109217256518315323716689223387286634317328803199609516 : Rat) / 697499214099014863878580073127199423100509817435596035) [(6, 2), (13, 1), (15, 3)],
  term ((-2130221066942416 : Rat) / 1162780221153193) [(6, 2), (13, 1), (15, 3), (16, 1)],
  term ((120446728144359541295066030314103179834 : Rat) / 599854728701238648283346764014769633995) [(6, 2), (13, 2)],
  term ((-1456015077566618122734629956119424016696 : Rat) / 1799564186103715944850040292044308901985) [(6, 2), (13, 2), (14, 1)],
  term ((-2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(6, 2), (13, 2), (14, 2)],
  term ((-11530512132661982754025626129402130138490986283296027556 : Rat) / 697499214099014863878580073127199423100509817435596035) [(6, 2), (13, 2), (15, 2)],
  term ((150661185588720 : Rat) / 1162780221153193) [(6, 2), (13, 2), (15, 2), (16, 1)],
  term ((80945856112067634232098240062478093344 : Rat) / 599854728701238648283346764014769633995) [(6, 2), (13, 3), (15, 1)],
  term ((249562434230076519877457627355935784697985556458557189433 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(6, 2), (14, 1), (15, 2)],
  term ((-138348488323751089 : Rat) / 6976681326919158) [(6, 2), (14, 1), (15, 2), (16, 1)],
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(6, 2), (14, 2), (15, 2)],
  term ((833967741040952 : Rat) / 1162780221153193) [(6, 2), (14, 2), (15, 2), (16, 1)],
  term ((303197347720279522945960624054822934173231987169673121843 : Rat) / 3719995808528079274019093723345063589869385692989845520) [(6, 2), (15, 2)],
  term ((46761063904070125 : Rat) / 4651120884612772) [(6, 2), (15, 2), (16, 1)],
  term ((-312453969237411213640799544201573540344 : Rat) / 599854728701238648283346764014769633995) [(7, 2), (11, 1), (12, 2), (13, 1)],
  term ((5596751201457925662836715300015825190436979755421300347 : Rat) / 464999476066009909252386715418132948733673211623730690) [(7, 2), (11, 1), (12, 2), (15, 1)],
  term ((-1958693697672998 : Rat) / 1162780221153193) [(7, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1246500628449369573311884488585868966718 : Rat) / 1799564186103715944850040292044308901985) [(7, 2), (11, 1), (13, 1)],
  term ((6726269385995931222631702436044558592986424804977428136 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 2), (11, 1), (13, 1), (15, 2)],
  term ((-1347382663288800 : Rat) / 1162780221153193) [(7, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((23303003274098118356770852827110756224 : Rat) / 199951576233746216094448921338256544665) [(7, 2), (11, 1), (13, 2), (15, 1)],
  term ((192310281104939503004456638320760459762053553695717730571 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(7, 2), (11, 1), (15, 1)],
  term ((1731142516245691 : Rat) / 1162780221153193) [(7, 2), (11, 1), (15, 1), (16, 1)],
  term ((2233057704898447277337521117967487825271887127131734968 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 2), (11, 1), (15, 3)],
  term ((-449127554429600 : Rat) / 1162780221153193) [(7, 2), (11, 1), (15, 3), (16, 1)],
  term ((1429182194689304419382031011936884624481 : Rat) / 1799564186103715944850040292044308901985) [(7, 2), (11, 2)],
  term ((-84782883764518120948021859280784483835006937782370880283 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(7, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((2449693339989265 : Rat) / 2325560442306386) [(7, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((214387558702680330369969064415226255543635584708941282077 : Rat) / 33479962276752713466171843510105572308824471236908609680) [(7, 2), (12, 1), (13, 1), (15, 1)],
  term ((-131503738079788567 : Rat) / 13953362653838316) [(7, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4356564189724637708906259429022804199456 : Rat) / 1799564186103715944850040292044308901985) [(7, 2), (12, 1), (13, 2)],
  term ((296822444626495253279669245943746663906 : Rat) / 599854728701238648283346764014769633995) [(7, 2), (12, 1), (13, 2), (14, 1)],
  term ((184684620853449952814620827932751714007739040900298451677 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(7, 2), (12, 1), (14, 1), (15, 2)],
  term ((-11536479425158903 : Rat) / 1162780221153193) [(7, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-447481119309076194849599014937502304786099349969962623757 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(7, 2), (12, 1), (15, 2)],
  term ((-42043259958870211 : Rat) / 6976681326919158) [(7, 2), (12, 1), (15, 2), (16, 1)],
  term ((-15951623849570376126102007844198250293244693592701822535 : Rat) / 1115998742558423782205728117003519076960815707896953656) [(7, 2), (12, 2), (13, 1), (15, 1)],
  term ((5003541596661801 : Rat) / 2325560442306386) [(7, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((124898830274193142709262456668953249078 : Rat) / 199951576233746216094448921338256544665) [(7, 2), (12, 2), (13, 2)],
  term ((-1100529695907008564799077506604416650894267905418418037 : Rat) / 185999790426403963700954686167253179493469284649492276) [(7, 2), (12, 2), (15, 2)],
  term ((3224281023627761 : Rat) / 1162780221153193) [(7, 2), (12, 2), (15, 2), (16, 1)],
  term ((1707583491439306856734350504558197990982731300436663247697 : Rat) / 33479962276752713466171843510105572308824471236908609680) [(7, 2), (13, 1), (14, 1), (15, 1)],
  term ((-94862438539086739 : Rat) / 13953362653838316) [(7, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-279378849901640340919482647169569421746336183507144841 : Rat) / 232499738033004954626193357709066474366836605811865345) [(7, 2), (13, 1), (14, 2), (15, 1)],
  term ((-416983870520476 : Rat) / 1162780221153193) [(7, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-73027560841323976186528451446920322779404106358001197863 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(7, 2), (13, 1), (15, 1)],
  term ((5571771468103243 : Rat) / 2325560442306386) [(7, 2), (13, 1), (15, 1), (16, 1)],
  term ((15109217256518315323716689223387286634317328803199609516 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 2), (13, 1), (15, 3)],
  term ((-2130221066942416 : Rat) / 1162780221153193) [(7, 2), (13, 1), (15, 3), (16, 1)],
  term ((120446728144359541295066030314103179834 : Rat) / 599854728701238648283346764014769633995) [(7, 2), (13, 2)],
  term ((-1456015077566618122734629956119424016696 : Rat) / 1799564186103715944850040292044308901985) [(7, 2), (13, 2), (14, 1)],
  term ((-2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(7, 2), (13, 2), (14, 2)],
  term ((-11530512132661982754025626129402130138490986283296027556 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 2), (13, 2), (15, 2)],
  term ((150661185588720 : Rat) / 1162780221153193) [(7, 2), (13, 2), (15, 2), (16, 1)],
  term ((80945856112067634232098240062478093344 : Rat) / 599854728701238648283346764014769633995) [(7, 2), (13, 3), (15, 1)],
  term ((249562434230076519877457627355935784697985556458557189433 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(7, 2), (14, 1), (15, 2)],
  term ((-138348488323751089 : Rat) / 6976681326919158) [(7, 2), (14, 1), (15, 2), (16, 1)],
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(7, 2), (14, 2), (15, 2)],
  term ((833967741040952 : Rat) / 1162780221153193) [(7, 2), (14, 2), (15, 2), (16, 1)],
  term ((303197347720279522945960624054822934173231987169673121843 : Rat) / 3719995808528079274019093723345063589869385692989845520) [(7, 2), (15, 2)],
  term ((46761063904070125 : Rat) / 4651120884612772) [(7, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 1, terms 300 through 346. -/
theorem ep_Q2_024_block_01_0300_0346_valid :
    checkProductSumEq ep_Q2_024_partials_01_0300_0346
      ep_Q2_024_block_01_0300_0346 = true := by
  native_decide

end EpQ2024TermShards

end Patterns

end EndpointCertificate

end Problem97
