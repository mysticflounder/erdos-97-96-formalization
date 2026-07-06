/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_024, term block 2:300-335

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_024`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2024TermShards

/-- Generator polynomial 2 for endpoint certificate `ep_Q2_024`. -/
def ep_Q2_024_generator_02_0300_0335 : Poly :=
[
  term (2 : Rat) [(0, 1), (10, 1)],
  term (2 : Rat) [(1, 1), (11, 1)],
  term (-1 : Rat) [(10, 2)],
  term (-1 : Rat) [(11, 2)]
]

/-- Coefficient term 300 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0300 : Poly :=
[
  term ((-306698979342465802324085636146780654343 : Rat) / 1799564186103715944850040292044308901985) [(11, 1), (13, 1)]
]

/-- Partial product 300 for generator 2. -/
def ep_Q2_024_partial_02_0300 : Poly :=
[
  term ((-613397958684931604648171272293561308686 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (10, 1), (11, 1), (13, 1)],
  term ((-613397958684931604648171272293561308686 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (11, 2), (13, 1)],
  term ((306698979342465802324085636146780654343 : Rat) / 1799564186103715944850040292044308901985) [(10, 2), (11, 1), (13, 1)],
  term ((306698979342465802324085636146780654343 : Rat) / 1799564186103715944850040292044308901985) [(11, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 300 for generator 2. -/
theorem ep_Q2_024_partial_02_0300_valid :
    mulPoly ep_Q2_024_coefficient_02_0300
        ep_Q2_024_generator_02_0300_0335 =
      ep_Q2_024_partial_02_0300 := by
  native_decide

/-- Coefficient term 301 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0301 : Poly :=
[
  term ((-2694544970124256243547102523240490961236 : Rat) / 599854728701238648283346764014769633995) [(11, 1), (13, 1), (14, 1)]
]

/-- Partial product 301 for generator 2. -/
def ep_Q2_024_partial_02_0301 : Poly :=
[
  term ((-5389089940248512487094205046480981922472 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((-5389089940248512487094205046480981922472 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (11, 2), (13, 1), (14, 1)],
  term ((2694544970124256243547102523240490961236 : Rat) / 599854728701238648283346764014769633995) [(10, 2), (11, 1), (13, 1), (14, 1)],
  term ((2694544970124256243547102523240490961236 : Rat) / 599854728701238648283346764014769633995) [(11, 3), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 301 for generator 2. -/
theorem ep_Q2_024_partial_02_0301_valid :
    mulPoly ep_Q2_024_coefficient_02_0301
        ep_Q2_024_generator_02_0300_0335 =
      ep_Q2_024_partial_02_0301 := by
  native_decide

/-- Coefficient term 302 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0302 : Poly :=
[
  term ((54267504900238499965814543541110615119259775310726648457 : Rat) / 1115998742558423782205728117003519076960815707896953656) [(11, 1), (13, 1), (15, 2)]
]

/-- Partial product 302 for generator 2. -/
def ep_Q2_024_partial_02_0302 : Poly :=
[
  term ((54267504900238499965814543541110615119259775310726648457 : Rat) / 557999371279211891102864058501759538480407853948476828) [(0, 1), (10, 1), (11, 1), (13, 1), (15, 2)],
  term ((54267504900238499965814543541110615119259775310726648457 : Rat) / 557999371279211891102864058501759538480407853948476828) [(1, 1), (11, 2), (13, 1), (15, 2)],
  term ((-54267504900238499965814543541110615119259775310726648457 : Rat) / 1115998742558423782205728117003519076960815707896953656) [(10, 2), (11, 1), (13, 1), (15, 2)],
  term ((-54267504900238499965814543541110615119259775310726648457 : Rat) / 1115998742558423782205728117003519076960815707896953656) [(11, 3), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 302 for generator 2. -/
theorem ep_Q2_024_partial_02_0302_valid :
    mulPoly ep_Q2_024_coefficient_02_0302
        ep_Q2_024_generator_02_0300_0335 =
      ep_Q2_024_partial_02_0302 := by
  native_decide

/-- Coefficient term 303 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0303 : Poly :=
[
  term ((-11083636152647727 : Rat) / 2325560442306386) [(11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 303 for generator 2. -/
def ep_Q2_024_partial_02_0303 : Poly :=
[
  term ((-11083636152647727 : Rat) / 1162780221153193) [(0, 1), (10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-11083636152647727 : Rat) / 1162780221153193) [(1, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((11083636152647727 : Rat) / 2325560442306386) [(10, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((11083636152647727 : Rat) / 2325560442306386) [(11, 3), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 303 for generator 2. -/
theorem ep_Q2_024_partial_02_0303_valid :
    mulPoly ep_Q2_024_coefficient_02_0303
        ep_Q2_024_generator_02_0300_0335 =
      ep_Q2_024_partial_02_0303 := by
  native_decide

/-- Coefficient term 304 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0304 : Poly :=
[
  term ((-5369752680556323263420502685502880998318630821031508314 : Rat) / 697499214099014863878580073127199423100509817435596035) [(11, 1), (13, 2), (15, 1)]
]

/-- Partial product 304 for generator 2. -/
def ep_Q2_024_partial_02_0304 : Poly :=
[
  term ((-10739505361112646526841005371005761996637261642063016628 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (10, 1), (11, 1), (13, 2), (15, 1)],
  term ((-10739505361112646526841005371005761996637261642063016628 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (11, 2), (13, 2), (15, 1)],
  term ((5369752680556323263420502685502880998318630821031508314 : Rat) / 697499214099014863878580073127199423100509817435596035) [(10, 2), (11, 1), (13, 2), (15, 1)],
  term ((5369752680556323263420502685502880998318630821031508314 : Rat) / 697499214099014863878580073127199423100509817435596035) [(11, 3), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 304 for generator 2. -/
theorem ep_Q2_024_partial_02_0304_valid :
    mulPoly ep_Q2_024_coefficient_02_0304
        ep_Q2_024_generator_02_0300_0335 =
      ep_Q2_024_partial_02_0304 := by
  native_decide

/-- Coefficient term 305 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0305 : Poly :=
[
  term ((75330592794360 : Rat) / 1162780221153193) [(11, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 305 for generator 2. -/
def ep_Q2_024_partial_02_0305 : Poly :=
[
  term ((150661185588720 : Rat) / 1162780221153193) [(0, 1), (10, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((150661185588720 : Rat) / 1162780221153193) [(1, 1), (11, 2), (13, 2), (15, 1), (16, 1)],
  term ((-75330592794360 : Rat) / 1162780221153193) [(10, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-75330592794360 : Rat) / 1162780221153193) [(11, 3), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 305 for generator 2. -/
theorem ep_Q2_024_partial_02_0305_valid :
    mulPoly ep_Q2_024_coefficient_02_0305
        ep_Q2_024_generator_02_0300_0335 =
      ep_Q2_024_partial_02_0305 := by
  native_decide

/-- Coefficient term 306 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0306 : Poly :=
[
  term ((40472928056033817116049120031239046672 : Rat) / 599854728701238648283346764014769633995) [(11, 1), (13, 3)]
]

/-- Partial product 306 for generator 2. -/
def ep_Q2_024_partial_02_0306 : Poly :=
[
  term ((80945856112067634232098240062478093344 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (10, 1), (11, 1), (13, 3)],
  term ((80945856112067634232098240062478093344 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (11, 2), (13, 3)],
  term ((-40472928056033817116049120031239046672 : Rat) / 599854728701238648283346764014769633995) [(10, 2), (11, 1), (13, 3)],
  term ((-40472928056033817116049120031239046672 : Rat) / 599854728701238648283346764014769633995) [(11, 3), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 306 for generator 2. -/
theorem ep_Q2_024_partial_02_0306_valid :
    mulPoly ep_Q2_024_coefficient_02_0306
        ep_Q2_024_generator_02_0300_0335 =
      ep_Q2_024_partial_02_0306 := by
  native_decide

/-- Coefficient term 307 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0307 : Poly :=
[
  term ((123634377194162065175984705896580339781478522958385658387 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(11, 1), (14, 1), (15, 1)]
]

/-- Partial product 307 for generator 2. -/
def ep_Q2_024_partial_02_0307 : Poly :=
[
  term ((123634377194162065175984705896580339781478522958385658387 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(0, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((123634377194162065175984705896580339781478522958385658387 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(1, 1), (11, 2), (14, 1), (15, 1)],
  term ((-123634377194162065175984705896580339781478522958385658387 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(10, 2), (11, 1), (14, 1), (15, 1)],
  term ((-123634377194162065175984705896580339781478522958385658387 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(11, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 307 for generator 2. -/
theorem ep_Q2_024_partial_02_0307_valid :
    mulPoly ep_Q2_024_coefficient_02_0307
        ep_Q2_024_generator_02_0300_0335 =
      ep_Q2_024_partial_02_0307 := by
  native_decide

/-- Coefficient term 308 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0308 : Poly :=
[
  term ((-16636019461371833 : Rat) / 2325560442306386) [(11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 308 for generator 2. -/
def ep_Q2_024_partial_02_0308 : Poly :=
[
  term ((-16636019461371833 : Rat) / 1162780221153193) [(0, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-16636019461371833 : Rat) / 1162780221153193) [(1, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((16636019461371833 : Rat) / 2325560442306386) [(10, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((16636019461371833 : Rat) / 2325560442306386) [(11, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 308 for generator 2. -/
theorem ep_Q2_024_partial_02_0308_valid :
    mulPoly ep_Q2_024_coefficient_02_0308
        ep_Q2_024_generator_02_0300_0335 =
      ep_Q2_024_partial_02_0308 := by
  native_decide

/-- Coefficient term 309 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0309 : Poly :=
[
  term ((-64885598020952966377851495215056251811814535036016934143 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(11, 1), (15, 1)]
]

/-- Partial product 309 for generator 2. -/
def ep_Q2_024_partial_02_0309 : Poly :=
[
  term ((-64885598020952966377851495215056251811814535036016934143 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(0, 1), (10, 1), (11, 1), (15, 1)],
  term ((-64885598020952966377851495215056251811814535036016934143 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(1, 1), (11, 2), (15, 1)],
  term ((64885598020952966377851495215056251811814535036016934143 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(10, 2), (11, 1), (15, 1)],
  term ((64885598020952966377851495215056251811814535036016934143 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 309 for generator 2. -/
theorem ep_Q2_024_partial_02_0309_valid :
    mulPoly ep_Q2_024_coefficient_02_0309
        ep_Q2_024_generator_02_0300_0335 =
      ep_Q2_024_partial_02_0309 := by
  native_decide

/-- Coefficient term 310 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0310 : Poly :=
[
  term ((-978162947449257 : Rat) / 1162780221153193) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 310 for generator 2. -/
def ep_Q2_024_partial_02_0310 : Poly :=
[
  term ((-1956325894898514 : Rat) / 1162780221153193) [(0, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1956325894898514 : Rat) / 1162780221153193) [(1, 1), (11, 2), (15, 1), (16, 1)],
  term ((978162947449257 : Rat) / 1162780221153193) [(10, 2), (11, 1), (15, 1), (16, 1)],
  term ((978162947449257 : Rat) / 1162780221153193) [(11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 310 for generator 2. -/
theorem ep_Q2_024_partial_02_0310_valid :
    mulPoly ep_Q2_024_coefficient_02_0310
        ep_Q2_024_generator_02_0300_0335 =
      ep_Q2_024_partial_02_0310 := by
  native_decide

/-- Coefficient term 311 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0311 : Poly :=
[
  term ((2233057704898447277337521117967487825271887127131734968 : Rat) / 697499214099014863878580073127199423100509817435596035) [(11, 1), (15, 3)]
]

/-- Partial product 311 for generator 2. -/
def ep_Q2_024_partial_02_0311 : Poly :=
[
  term ((4466115409796894554675042235934975650543774254263469936 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (10, 1), (11, 1), (15, 3)],
  term ((4466115409796894554675042235934975650543774254263469936 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (11, 2), (15, 3)],
  term ((-2233057704898447277337521117967487825271887127131734968 : Rat) / 697499214099014863878580073127199423100509817435596035) [(10, 2), (11, 1), (15, 3)],
  term ((-2233057704898447277337521117967487825271887127131734968 : Rat) / 697499214099014863878580073127199423100509817435596035) [(11, 3), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 311 for generator 2. -/
theorem ep_Q2_024_partial_02_0311_valid :
    mulPoly ep_Q2_024_coefficient_02_0311
        ep_Q2_024_generator_02_0300_0335 =
      ep_Q2_024_partial_02_0311 := by
  native_decide

/-- Coefficient term 312 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0312 : Poly :=
[
  term ((-449127554429600 : Rat) / 1162780221153193) [(11, 1), (15, 3), (16, 1)]
]

/-- Partial product 312 for generator 2. -/
def ep_Q2_024_partial_02_0312 : Poly :=
[
  term ((-898255108859200 : Rat) / 1162780221153193) [(0, 1), (10, 1), (11, 1), (15, 3), (16, 1)],
  term ((-898255108859200 : Rat) / 1162780221153193) [(1, 1), (11, 2), (15, 3), (16, 1)],
  term ((449127554429600 : Rat) / 1162780221153193) [(10, 2), (11, 1), (15, 3), (16, 1)],
  term ((449127554429600 : Rat) / 1162780221153193) [(11, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 312 for generator 2. -/
theorem ep_Q2_024_partial_02_0312_valid :
    mulPoly ep_Q2_024_coefficient_02_0312
        ep_Q2_024_generator_02_0300_0335 =
      ep_Q2_024_partial_02_0312 := by
  native_decide

/-- Coefficient term 313 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0313 : Poly :=
[
  term ((1429182194689304419382031011936884624481 : Rat) / 1799564186103715944850040292044308901985) [(11, 2)]
]

/-- Partial product 313 for generator 2. -/
def ep_Q2_024_partial_02_0313 : Poly :=
[
  term ((2858364389378608838764062023873769248962 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (10, 1), (11, 2)],
  term ((2858364389378608838764062023873769248962 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (11, 3)],
  term ((-1429182194689304419382031011936884624481 : Rat) / 1799564186103715944850040292044308901985) [(10, 2), (11, 2)],
  term ((-1429182194689304419382031011936884624481 : Rat) / 1799564186103715944850040292044308901985) [(11, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 313 for generator 2. -/
theorem ep_Q2_024_partial_02_0313_valid :
    mulPoly ep_Q2_024_coefficient_02_0313
        ep_Q2_024_generator_02_0300_0335 =
      ep_Q2_024_partial_02_0313 := by
  native_decide

/-- Coefficient term 314 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0314 : Poly :=
[
  term ((164450924956588150524026507372646906853948765195645650517 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(12, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 314 for generator 2. -/
def ep_Q2_024_partial_02_0314 : Poly :=
[
  term ((164450924956588150524026507372646906853948765195645650517 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(0, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((164450924956588150524026507372646906853948765195645650517 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(1, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-164450924956588150524026507372646906853948765195645650517 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(10, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-164450924956588150524026507372646906853948765195645650517 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(11, 2), (12, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 314 for generator 2. -/
theorem ep_Q2_024_partial_02_0314_valid :
    mulPoly ep_Q2_024_coefficient_02_0314
        ep_Q2_024_generator_02_0300_0335 =
      ep_Q2_024_partial_02_0314 := by
  native_decide

/-- Coefficient term 315 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0315 : Poly :=
[
  term ((-14038382648281759 : Rat) / 2325560442306386) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 315 for generator 2. -/
def ep_Q2_024_partial_02_0315 : Poly :=
[
  term ((-14038382648281759 : Rat) / 1162780221153193) [(0, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-14038382648281759 : Rat) / 1162780221153193) [(1, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((14038382648281759 : Rat) / 2325560442306386) [(10, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((14038382648281759 : Rat) / 2325560442306386) [(11, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 315 for generator 2. -/
theorem ep_Q2_024_partial_02_0315_valid :
    mulPoly ep_Q2_024_coefficient_02_0315
        ep_Q2_024_generator_02_0300_0335 =
      ep_Q2_024_partial_02_0315 := by
  native_decide

/-- Coefficient term 316 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0316 : Poly :=
[
  term ((-61350617706986813124438775503339210401766091872685946369 : Rat) / 3719995808528079274019093723345063589869385692989845520) [(12, 1), (13, 1), (15, 1)]
]

/-- Partial product 316 for generator 2. -/
def ep_Q2_024_partial_02_0316 : Poly :=
[
  term ((-61350617706986813124438775503339210401766091872685946369 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(0, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-61350617706986813124438775503339210401766091872685946369 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(1, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((61350617706986813124438775503339210401766091872685946369 : Rat) / 3719995808528079274019093723345063589869385692989845520) [(10, 2), (12, 1), (13, 1), (15, 1)],
  term ((61350617706986813124438775503339210401766091872685946369 : Rat) / 3719995808528079274019093723345063589869385692989845520) [(11, 2), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 316 for generator 2. -/
theorem ep_Q2_024_partial_02_0316_valid :
    mulPoly ep_Q2_024_coefficient_02_0316
        ep_Q2_024_generator_02_0300_0335 =
      ep_Q2_024_partial_02_0316 := by
  native_decide

/-- Coefficient term 317 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0317 : Poly :=
[
  term ((-106270994419078021 : Rat) / 13953362653838316) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 317 for generator 2. -/
def ep_Q2_024_partial_02_0317 : Poly :=
[
  term ((-106270994419078021 : Rat) / 6976681326919158) [(0, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-106270994419078021 : Rat) / 6976681326919158) [(1, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((106270994419078021 : Rat) / 13953362653838316) [(10, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((106270994419078021 : Rat) / 13953362653838316) [(11, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 317 for generator 2. -/
theorem ep_Q2_024_partial_02_0317_valid :
    mulPoly ep_Q2_024_coefficient_02_0317
        ep_Q2_024_generator_02_0300_0335 =
      ep_Q2_024_partial_02_0317 := by
  native_decide

/-- Coefficient term 318 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0318 : Poly :=
[
  term ((-3339024133903633157401158274483606530158 : Rat) / 1799564186103715944850040292044308901985) [(12, 1), (13, 2)]
]

/-- Partial product 318 for generator 2. -/
def ep_Q2_024_partial_02_0318 : Poly :=
[
  term ((-6678048267807266314802316548967213060316 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (10, 1), (12, 1), (13, 2)],
  term ((-6678048267807266314802316548967213060316 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (11, 1), (12, 1), (13, 2)],
  term ((3339024133903633157401158274483606530158 : Rat) / 1799564186103715944850040292044308901985) [(10, 2), (12, 1), (13, 2)],
  term ((3339024133903633157401158274483606530158 : Rat) / 1799564186103715944850040292044308901985) [(11, 2), (12, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 318 for generator 2. -/
theorem ep_Q2_024_partial_02_0318_valid :
    mulPoly ep_Q2_024_coefficient_02_0318
        ep_Q2_024_generator_02_0300_0335 =
      ep_Q2_024_partial_02_0318 := by
  native_decide

/-- Coefficient term 319 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0319 : Poly :=
[
  term ((-259451438241996968824998501993404916522 : Rat) / 199951576233746216094448921338256544665) [(12, 1), (13, 2), (14, 1)]
]

/-- Partial product 319 for generator 2. -/
def ep_Q2_024_partial_02_0319 : Poly :=
[
  term ((-518902876483993937649997003986809833044 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (10, 1), (12, 1), (13, 2), (14, 1)],
  term ((-518902876483993937649997003986809833044 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (11, 1), (12, 1), (13, 2), (14, 1)],
  term ((259451438241996968824998501993404916522 : Rat) / 199951576233746216094448921338256544665) [(10, 2), (12, 1), (13, 2), (14, 1)],
  term ((259451438241996968824998501993404916522 : Rat) / 199951576233746216094448921338256544665) [(11, 2), (12, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 319 for generator 2. -/
theorem ep_Q2_024_partial_02_0319_valid :
    mulPoly ep_Q2_024_coefficient_02_0319
        ep_Q2_024_generator_02_0300_0335 =
      ep_Q2_024_partial_02_0319 := by
  native_decide

/-- Coefficient term 320 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0320 : Poly :=
[
  term ((-228548346943902101627953017098607070723838550969230898109 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(12, 1), (15, 2)]
]

/-- Partial product 320 for generator 2. -/
def ep_Q2_024_partial_02_0320 : Poly :=
[
  term ((-228548346943902101627953017098607070723838550969230898109 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(0, 1), (10, 1), (12, 1), (15, 2)],
  term ((-228548346943902101627953017098607070723838550969230898109 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(1, 1), (11, 1), (12, 1), (15, 2)],
  term ((228548346943902101627953017098607070723838550969230898109 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(10, 2), (12, 1), (15, 2)],
  term ((228548346943902101627953017098607070723838550969230898109 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(11, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 320 for generator 2. -/
theorem ep_Q2_024_partial_02_0320_valid :
    mulPoly ep_Q2_024_coefficient_02_0320
        ep_Q2_024_generator_02_0300_0335 =
      ep_Q2_024_partial_02_0320 := by
  native_decide

/-- Coefficient term 321 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0321 : Poly :=
[
  term ((9851670194564511 : Rat) / 4651120884612772) [(12, 1), (15, 2), (16, 1)]
]

/-- Partial product 321 for generator 2. -/
def ep_Q2_024_partial_02_0321 : Poly :=
[
  term ((9851670194564511 : Rat) / 2325560442306386) [(0, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((9851670194564511 : Rat) / 2325560442306386) [(1, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-9851670194564511 : Rat) / 4651120884612772) [(10, 2), (12, 1), (15, 2), (16, 1)],
  term ((-9851670194564511 : Rat) / 4651120884612772) [(11, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 321 for generator 2. -/
theorem ep_Q2_024_partial_02_0321_valid :
    mulPoly ep_Q2_024_coefficient_02_0321
        ep_Q2_024_generator_02_0300_0335 =
      ep_Q2_024_partial_02_0321 := by
  native_decide

/-- Coefficient term 322 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0322 : Poly :=
[
  term ((-26974210883668912519839817367166225675565343026070909313 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(12, 2), (13, 1), (15, 1)]
]

/-- Partial product 322 for generator 2. -/
def ep_Q2_024_partial_02_0322 : Poly :=
[
  term ((-26974210883668912519839817367166225675565343026070909313 : Rat) / 929998952132019818504773430836265897467346423247461380) [(0, 1), (10, 1), (12, 2), (13, 1), (15, 1)],
  term ((-26974210883668912519839817367166225675565343026070909313 : Rat) / 929998952132019818504773430836265897467346423247461380) [(1, 1), (11, 1), (12, 2), (13, 1), (15, 1)],
  term ((26974210883668912519839817367166225675565343026070909313 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(10, 2), (12, 2), (13, 1), (15, 1)],
  term ((26974210883668912519839817367166225675565343026070909313 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(11, 2), (12, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 322 for generator 2. -/
theorem ep_Q2_024_partial_02_0322_valid :
    mulPoly ep_Q2_024_coefficient_02_0322
        ep_Q2_024_generator_02_0300_0335 =
      ep_Q2_024_partial_02_0322 := by
  native_decide

/-- Coefficient term 323 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0323 : Poly :=
[
  term ((5003541596661801 : Rat) / 2325560442306386) [(12, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 323 for generator 2. -/
def ep_Q2_024_partial_02_0323 : Poly :=
[
  term ((5003541596661801 : Rat) / 1162780221153193) [(0, 1), (10, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((5003541596661801 : Rat) / 1162780221153193) [(1, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-5003541596661801 : Rat) / 2325560442306386) [(10, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-5003541596661801 : Rat) / 2325560442306386) [(11, 2), (12, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 323 for generator 2. -/
theorem ep_Q2_024_partial_02_0323_valid :
    mulPoly ep_Q2_024_coefficient_02_0323
        ep_Q2_024_generator_02_0300_0335 =
      ep_Q2_024_partial_02_0323 := by
  native_decide

/-- Coefficient term 324 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0324 : Poly :=
[
  term ((124898830274193142709262456668953249078 : Rat) / 199951576233746216094448921338256544665) [(12, 2), (13, 2)]
]

/-- Partial product 324 for generator 2. -/
def ep_Q2_024_partial_02_0324 : Poly :=
[
  term ((249797660548386285418524913337906498156 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (10, 1), (12, 2), (13, 2)],
  term ((249797660548386285418524913337906498156 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (11, 1), (12, 2), (13, 2)],
  term ((-124898830274193142709262456668953249078 : Rat) / 199951576233746216094448921338256544665) [(10, 2), (12, 2), (13, 2)],
  term ((-124898830274193142709262456668953249078 : Rat) / 199951576233746216094448921338256544665) [(11, 2), (12, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 324 for generator 2. -/
theorem ep_Q2_024_partial_02_0324_valid :
    mulPoly ep_Q2_024_coefficient_02_0324
        ep_Q2_024_generator_02_0300_0335 =
      ep_Q2_024_partial_02_0324 := by
  native_decide

/-- Coefficient term 325 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0325 : Poly :=
[
  term ((229527336284499272616790565321770397804284922840156028953 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(13, 1), (14, 1), (15, 1)]
]

/-- Partial product 325 for generator 2. -/
def ep_Q2_024_partial_02_0325 : Poly :=
[
  term ((229527336284499272616790565321770397804284922840156028953 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(0, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((229527336284499272616790565321770397804284922840156028953 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(1, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-229527336284499272616790565321770397804284922840156028953 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(10, 2), (13, 1), (14, 1), (15, 1)],
  term ((-229527336284499272616790565321770397804284922840156028953 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(11, 2), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 325 for generator 2. -/
theorem ep_Q2_024_partial_02_0325_valid :
    mulPoly ep_Q2_024_coefficient_02_0325
        ep_Q2_024_generator_02_0300_0335 =
      ep_Q2_024_partial_02_0325 := by
  native_decide

/-- Coefficient term 326 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0326 : Poly :=
[
  term ((-134306340333884689 : Rat) / 13953362653838316) [(13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 326 for generator 2. -/
def ep_Q2_024_partial_02_0326 : Poly :=
[
  term ((-134306340333884689 : Rat) / 6976681326919158) [(0, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-134306340333884689 : Rat) / 6976681326919158) [(1, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((134306340333884689 : Rat) / 13953362653838316) [(10, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((134306340333884689 : Rat) / 13953362653838316) [(11, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 326 for generator 2. -/
theorem ep_Q2_024_partial_02_0326_valid :
    mulPoly ep_Q2_024_coefficient_02_0326
        ep_Q2_024_generator_02_0300_0335 =
      ep_Q2_024_partial_02_0326 := by
  native_decide

/-- Coefficient term 327 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0327 : Poly :=
[
  term ((168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(13, 1), (14, 2), (15, 1)]
]

/-- Partial product 327 for generator 2. -/
def ep_Q2_024_partial_02_0327 : Poly :=
[
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (10, 1), (13, 1), (14, 2), (15, 1)],
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((-168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(10, 2), (13, 1), (14, 2), (15, 1)],
  term ((-168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(11, 2), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 327 for generator 2. -/
theorem ep_Q2_024_partial_02_0327_valid :
    mulPoly ep_Q2_024_coefficient_02_0327
        ep_Q2_024_generator_02_0300_0335 =
      ep_Q2_024_partial_02_0327 := by
  native_decide

/-- Coefficient term 328 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0328 : Poly :=
[
  term ((416983870520476 : Rat) / 1162780221153193) [(13, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 328 for generator 2. -/
def ep_Q2_024_partial_02_0328 : Poly :=
[
  term ((833967741040952 : Rat) / 1162780221153193) [(0, 1), (10, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((833967741040952 : Rat) / 1162780221153193) [(1, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-416983870520476 : Rat) / 1162780221153193) [(10, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-416983870520476 : Rat) / 1162780221153193) [(11, 2), (13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 328 for generator 2. -/
theorem ep_Q2_024_partial_02_0328_valid :
    mulPoly ep_Q2_024_coefficient_02_0328
        ep_Q2_024_generator_02_0300_0335 =
      ep_Q2_024_partial_02_0328 := by
  native_decide

/-- Coefficient term 329 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0329 : Poly :=
[
  term ((-23067307075869547358806303988692707427719055785974047211 : Rat) / 7439991617056158548038187446690127179738771385979691040) [(13, 1), (15, 1)]
]

/-- Partial product 329 for generator 2. -/
def ep_Q2_024_partial_02_0329 : Poly :=
[
  term ((-23067307075869547358806303988692707427719055785974047211 : Rat) / 3719995808528079274019093723345063589869385692989845520) [(0, 1), (10, 1), (13, 1), (15, 1)],
  term ((-23067307075869547358806303988692707427719055785974047211 : Rat) / 3719995808528079274019093723345063589869385692989845520) [(1, 1), (11, 1), (13, 1), (15, 1)],
  term ((23067307075869547358806303988692707427719055785974047211 : Rat) / 7439991617056158548038187446690127179738771385979691040) [(10, 2), (13, 1), (15, 1)],
  term ((23067307075869547358806303988692707427719055785974047211 : Rat) / 7439991617056158548038187446690127179738771385979691040) [(11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 329 for generator 2. -/
theorem ep_Q2_024_partial_02_0329_valid :
    mulPoly ep_Q2_024_coefficient_02_0329
        ep_Q2_024_generator_02_0300_0335 =
      ep_Q2_024_partial_02_0329 := by
  native_decide

/-- Coefficient term 330 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0330 : Poly :=
[
  term ((259402566307424417 : Rat) / 27906725307676632) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 330 for generator 2. -/
def ep_Q2_024_partial_02_0330 : Poly :=
[
  term ((259402566307424417 : Rat) / 13953362653838316) [(0, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((259402566307424417 : Rat) / 13953362653838316) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-259402566307424417 : Rat) / 27906725307676632) [(10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-259402566307424417 : Rat) / 27906725307676632) [(11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 330 for generator 2. -/
theorem ep_Q2_024_partial_02_0330_valid :
    mulPoly ep_Q2_024_coefficient_02_0330
        ep_Q2_024_generator_02_0300_0335 =
      ep_Q2_024_partial_02_0330 := by
  native_decide

/-- Coefficient term 331 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0331 : Poly :=
[
  term ((2027280404596760885778613316873147423024 : Rat) / 1799564186103715944850040292044308901985) [(13, 2)]
]

/-- Partial product 331 for generator 2. -/
def ep_Q2_024_partial_02_0331 : Poly :=
[
  term ((4054560809193521771557226633746294846048 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (10, 1), (13, 2)],
  term ((4054560809193521771557226633746294846048 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (11, 1), (13, 2)],
  term ((-2027280404596760885778613316873147423024 : Rat) / 1799564186103715944850040292044308901985) [(10, 2), (13, 2)],
  term ((-2027280404596760885778613316873147423024 : Rat) / 1799564186103715944850040292044308901985) [(11, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 331 for generator 2. -/
theorem ep_Q2_024_partial_02_0331_valid :
    mulPoly ep_Q2_024_coefficient_02_0331
        ep_Q2_024_generator_02_0300_0335 =
      ep_Q2_024_partial_02_0331 := by
  native_decide

/-- Coefficient term 332 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0332 : Poly :=
[
  term ((-6627898004148186342669000713130083975168 : Rat) / 1799564186103715944850040292044308901985) [(13, 2), (14, 1)]
]

/-- Partial product 332 for generator 2. -/
def ep_Q2_024_partial_02_0332 : Poly :=
[
  term ((-13255796008296372685338001426260167950336 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (10, 1), (13, 2), (14, 1)],
  term ((-13255796008296372685338001426260167950336 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (11, 1), (13, 2), (14, 1)],
  term ((6627898004148186342669000713130083975168 : Rat) / 1799564186103715944850040292044308901985) [(10, 2), (13, 2), (14, 1)],
  term ((6627898004148186342669000713130083975168 : Rat) / 1799564186103715944850040292044308901985) [(11, 2), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 332 for generator 2. -/
theorem ep_Q2_024_partial_02_0332_valid :
    mulPoly ep_Q2_024_coefficient_02_0332
        ep_Q2_024_generator_02_0300_0335 =
      ep_Q2_024_partial_02_0332 := by
  native_decide

/-- Coefficient term 333 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0333 : Poly :=
[
  term ((2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(13, 2), (14, 2)]
]

/-- Partial product 333 for generator 2. -/
def ep_Q2_024_partial_02_0333 : Poly :=
[
  term ((4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (10, 1), (13, 2), (14, 2)],
  term ((4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (11, 1), (13, 2), (14, 2)],
  term ((-2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(10, 2), (13, 2), (14, 2)],
  term ((-2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(11, 2), (13, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 333 for generator 2. -/
theorem ep_Q2_024_partial_02_0333_valid :
    mulPoly ep_Q2_024_coefficient_02_0333
        ep_Q2_024_generator_02_0300_0335 =
      ep_Q2_024_partial_02_0333 := by
  native_decide

/-- Coefficient term 334 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0334 : Poly :=
[
  term ((228548346943902101627953017098607070723838550969230898109 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(14, 1), (15, 2)]
]

/-- Partial product 334 for generator 2. -/
def ep_Q2_024_partial_02_0334 : Poly :=
[
  term ((228548346943902101627953017098607070723838550969230898109 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(0, 1), (10, 1), (14, 1), (15, 2)],
  term ((228548346943902101627953017098607070723838550969230898109 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(1, 1), (11, 1), (14, 1), (15, 2)],
  term ((-228548346943902101627953017098607070723838550969230898109 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(10, 2), (14, 1), (15, 2)],
  term ((-228548346943902101627953017098607070723838550969230898109 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(11, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 334 for generator 2. -/
theorem ep_Q2_024_partial_02_0334_valid :
    mulPoly ep_Q2_024_coefficient_02_0334
        ep_Q2_024_generator_02_0300_0335 =
      ep_Q2_024_partial_02_0334 := by
  native_decide

/-- Coefficient term 335 from coefficient polynomial 2. -/
def ep_Q2_024_coefficient_02_0335 : Poly :=
[
  term ((-9851670194564511 : Rat) / 2325560442306386) [(14, 1), (15, 2), (16, 1)]
]

/-- Partial product 335 for generator 2. -/
def ep_Q2_024_partial_02_0335 : Poly :=
[
  term ((-9851670194564511 : Rat) / 1162780221153193) [(0, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-9851670194564511 : Rat) / 1162780221153193) [(1, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((9851670194564511 : Rat) / 2325560442306386) [(10, 2), (14, 1), (15, 2), (16, 1)],
  term ((9851670194564511 : Rat) / 2325560442306386) [(11, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 335 for generator 2. -/
theorem ep_Q2_024_partial_02_0335_valid :
    mulPoly ep_Q2_024_coefficient_02_0335
        ep_Q2_024_generator_02_0300_0335 =
      ep_Q2_024_partial_02_0335 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_024_partials_02_0300_0335 : List Poly :=
[
  ep_Q2_024_partial_02_0300,
  ep_Q2_024_partial_02_0301,
  ep_Q2_024_partial_02_0302,
  ep_Q2_024_partial_02_0303,
  ep_Q2_024_partial_02_0304,
  ep_Q2_024_partial_02_0305,
  ep_Q2_024_partial_02_0306,
  ep_Q2_024_partial_02_0307,
  ep_Q2_024_partial_02_0308,
  ep_Q2_024_partial_02_0309,
  ep_Q2_024_partial_02_0310,
  ep_Q2_024_partial_02_0311,
  ep_Q2_024_partial_02_0312,
  ep_Q2_024_partial_02_0313,
  ep_Q2_024_partial_02_0314,
  ep_Q2_024_partial_02_0315,
  ep_Q2_024_partial_02_0316,
  ep_Q2_024_partial_02_0317,
  ep_Q2_024_partial_02_0318,
  ep_Q2_024_partial_02_0319,
  ep_Q2_024_partial_02_0320,
  ep_Q2_024_partial_02_0321,
  ep_Q2_024_partial_02_0322,
  ep_Q2_024_partial_02_0323,
  ep_Q2_024_partial_02_0324,
  ep_Q2_024_partial_02_0325,
  ep_Q2_024_partial_02_0326,
  ep_Q2_024_partial_02_0327,
  ep_Q2_024_partial_02_0328,
  ep_Q2_024_partial_02_0329,
  ep_Q2_024_partial_02_0330,
  ep_Q2_024_partial_02_0331,
  ep_Q2_024_partial_02_0332,
  ep_Q2_024_partial_02_0333,
  ep_Q2_024_partial_02_0334,
  ep_Q2_024_partial_02_0335
]

/-- Sum of partial products in this block. -/
def ep_Q2_024_block_02_0300_0335 : Poly :=
[
  term ((-613397958684931604648171272293561308686 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (10, 1), (11, 1), (13, 1)],
  term ((-5389089940248512487094205046480981922472 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((54267504900238499965814543541110615119259775310726648457 : Rat) / 557999371279211891102864058501759538480407853948476828) [(0, 1), (10, 1), (11, 1), (13, 1), (15, 2)],
  term ((-11083636152647727 : Rat) / 1162780221153193) [(0, 1), (10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-10739505361112646526841005371005761996637261642063016628 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (10, 1), (11, 1), (13, 2), (15, 1)],
  term ((150661185588720 : Rat) / 1162780221153193) [(0, 1), (10, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((80945856112067634232098240062478093344 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (10, 1), (11, 1), (13, 3)],
  term ((123634377194162065175984705896580339781478522958385658387 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(0, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-16636019461371833 : Rat) / 1162780221153193) [(0, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-64885598020952966377851495215056251811814535036016934143 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(0, 1), (10, 1), (11, 1), (15, 1)],
  term ((-1956325894898514 : Rat) / 1162780221153193) [(0, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((4466115409796894554675042235934975650543774254263469936 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (10, 1), (11, 1), (15, 3)],
  term ((-898255108859200 : Rat) / 1162780221153193) [(0, 1), (10, 1), (11, 1), (15, 3), (16, 1)],
  term ((2858364389378608838764062023873769248962 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (10, 1), (11, 2)],
  term ((164450924956588150524026507372646906853948765195645650517 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(0, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-14038382648281759 : Rat) / 1162780221153193) [(0, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-61350617706986813124438775503339210401766091872685946369 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(0, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-106270994419078021 : Rat) / 6976681326919158) [(0, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-6678048267807266314802316548967213060316 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (10, 1), (12, 1), (13, 2)],
  term ((-518902876483993937649997003986809833044 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (10, 1), (12, 1), (13, 2), (14, 1)],
  term ((-228548346943902101627953017098607070723838550969230898109 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(0, 1), (10, 1), (12, 1), (15, 2)],
  term ((9851670194564511 : Rat) / 2325560442306386) [(0, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-26974210883668912519839817367166225675565343026070909313 : Rat) / 929998952132019818504773430836265897467346423247461380) [(0, 1), (10, 1), (12, 2), (13, 1), (15, 1)],
  term ((5003541596661801 : Rat) / 1162780221153193) [(0, 1), (10, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((249797660548386285418524913337906498156 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (10, 1), (12, 2), (13, 2)],
  term ((229527336284499272616790565321770397804284922840156028953 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(0, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-134306340333884689 : Rat) / 6976681326919158) [(0, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (10, 1), (13, 1), (14, 2), (15, 1)],
  term ((833967741040952 : Rat) / 1162780221153193) [(0, 1), (10, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-23067307075869547358806303988692707427719055785974047211 : Rat) / 3719995808528079274019093723345063589869385692989845520) [(0, 1), (10, 1), (13, 1), (15, 1)],
  term ((259402566307424417 : Rat) / 13953362653838316) [(0, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((4054560809193521771557226633746294846048 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (10, 1), (13, 2)],
  term ((-13255796008296372685338001426260167950336 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (10, 1), (13, 2), (14, 1)],
  term ((4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (10, 1), (13, 2), (14, 2)],
  term ((228548346943902101627953017098607070723838550969230898109 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(0, 1), (10, 1), (14, 1), (15, 2)],
  term ((-9851670194564511 : Rat) / 1162780221153193) [(0, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((164450924956588150524026507372646906853948765195645650517 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(1, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-14038382648281759 : Rat) / 1162780221153193) [(1, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-61350617706986813124438775503339210401766091872685946369 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(1, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-106270994419078021 : Rat) / 6976681326919158) [(1, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-6678048267807266314802316548967213060316 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (11, 1), (12, 1), (13, 2)],
  term ((-518902876483993937649997003986809833044 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (11, 1), (12, 1), (13, 2), (14, 1)],
  term ((-228548346943902101627953017098607070723838550969230898109 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(1, 1), (11, 1), (12, 1), (15, 2)],
  term ((9851670194564511 : Rat) / 2325560442306386) [(1, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-26974210883668912519839817367166225675565343026070909313 : Rat) / 929998952132019818504773430836265897467346423247461380) [(1, 1), (11, 1), (12, 2), (13, 1), (15, 1)],
  term ((5003541596661801 : Rat) / 1162780221153193) [(1, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((249797660548386285418524913337906498156 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (11, 1), (12, 2), (13, 2)],
  term ((229527336284499272616790565321770397804284922840156028953 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(1, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-134306340333884689 : Rat) / 6976681326919158) [(1, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((833967741040952 : Rat) / 1162780221153193) [(1, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-23067307075869547358806303988692707427719055785974047211 : Rat) / 3719995808528079274019093723345063589869385692989845520) [(1, 1), (11, 1), (13, 1), (15, 1)],
  term ((259402566307424417 : Rat) / 13953362653838316) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((4054560809193521771557226633746294846048 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (11, 1), (13, 2)],
  term ((-13255796008296372685338001426260167950336 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (11, 1), (13, 2), (14, 1)],
  term ((4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (11, 1), (13, 2), (14, 2)],
  term ((228548346943902101627953017098607070723838550969230898109 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(1, 1), (11, 1), (14, 1), (15, 2)],
  term ((-9851670194564511 : Rat) / 1162780221153193) [(1, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-613397958684931604648171272293561308686 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (11, 2), (13, 1)],
  term ((-5389089940248512487094205046480981922472 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (11, 2), (13, 1), (14, 1)],
  term ((54267504900238499965814543541110615119259775310726648457 : Rat) / 557999371279211891102864058501759538480407853948476828) [(1, 1), (11, 2), (13, 1), (15, 2)],
  term ((-11083636152647727 : Rat) / 1162780221153193) [(1, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((-10739505361112646526841005371005761996637261642063016628 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (11, 2), (13, 2), (15, 1)],
  term ((150661185588720 : Rat) / 1162780221153193) [(1, 1), (11, 2), (13, 2), (15, 1), (16, 1)],
  term ((80945856112067634232098240062478093344 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (11, 2), (13, 3)],
  term ((123634377194162065175984705896580339781478522958385658387 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(1, 1), (11, 2), (14, 1), (15, 1)],
  term ((-16636019461371833 : Rat) / 1162780221153193) [(1, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-64885598020952966377851495215056251811814535036016934143 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(1, 1), (11, 2), (15, 1)],
  term ((-1956325894898514 : Rat) / 1162780221153193) [(1, 1), (11, 2), (15, 1), (16, 1)],
  term ((4466115409796894554675042235934975650543774254263469936 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (11, 2), (15, 3)],
  term ((-898255108859200 : Rat) / 1162780221153193) [(1, 1), (11, 2), (15, 3), (16, 1)],
  term ((2858364389378608838764062023873769248962 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (11, 3)],
  term ((306698979342465802324085636146780654343 : Rat) / 1799564186103715944850040292044308901985) [(10, 2), (11, 1), (13, 1)],
  term ((2694544970124256243547102523240490961236 : Rat) / 599854728701238648283346764014769633995) [(10, 2), (11, 1), (13, 1), (14, 1)],
  term ((-54267504900238499965814543541110615119259775310726648457 : Rat) / 1115998742558423782205728117003519076960815707896953656) [(10, 2), (11, 1), (13, 1), (15, 2)],
  term ((11083636152647727 : Rat) / 2325560442306386) [(10, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((5369752680556323263420502685502880998318630821031508314 : Rat) / 697499214099014863878580073127199423100509817435596035) [(10, 2), (11, 1), (13, 2), (15, 1)],
  term ((-75330592794360 : Rat) / 1162780221153193) [(10, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-40472928056033817116049120031239046672 : Rat) / 599854728701238648283346764014769633995) [(10, 2), (11, 1), (13, 3)],
  term ((-123634377194162065175984705896580339781478522958385658387 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(10, 2), (11, 1), (14, 1), (15, 1)],
  term ((16636019461371833 : Rat) / 2325560442306386) [(10, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((64885598020952966377851495215056251811814535036016934143 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(10, 2), (11, 1), (15, 1)],
  term ((978162947449257 : Rat) / 1162780221153193) [(10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-2233057704898447277337521117967487825271887127131734968 : Rat) / 697499214099014863878580073127199423100509817435596035) [(10, 2), (11, 1), (15, 3)],
  term ((449127554429600 : Rat) / 1162780221153193) [(10, 2), (11, 1), (15, 3), (16, 1)],
  term ((-1429182194689304419382031011936884624481 : Rat) / 1799564186103715944850040292044308901985) [(10, 2), (11, 2)],
  term ((-164450924956588150524026507372646906853948765195645650517 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(10, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((14038382648281759 : Rat) / 2325560442306386) [(10, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((61350617706986813124438775503339210401766091872685946369 : Rat) / 3719995808528079274019093723345063589869385692989845520) [(10, 2), (12, 1), (13, 1), (15, 1)],
  term ((106270994419078021 : Rat) / 13953362653838316) [(10, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((3339024133903633157401158274483606530158 : Rat) / 1799564186103715944850040292044308901985) [(10, 2), (12, 1), (13, 2)],
  term ((259451438241996968824998501993404916522 : Rat) / 199951576233746216094448921338256544665) [(10, 2), (12, 1), (13, 2), (14, 1)],
  term ((228548346943902101627953017098607070723838550969230898109 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(10, 2), (12, 1), (15, 2)],
  term ((-9851670194564511 : Rat) / 4651120884612772) [(10, 2), (12, 1), (15, 2), (16, 1)],
  term ((26974210883668912519839817367166225675565343026070909313 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(10, 2), (12, 2), (13, 1), (15, 1)],
  term ((-5003541596661801 : Rat) / 2325560442306386) [(10, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-124898830274193142709262456668953249078 : Rat) / 199951576233746216094448921338256544665) [(10, 2), (12, 2), (13, 2)],
  term ((-229527336284499272616790565321770397804284922840156028953 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(10, 2), (13, 1), (14, 1), (15, 1)],
  term ((134306340333884689 : Rat) / 13953362653838316) [(10, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(10, 2), (13, 1), (14, 2), (15, 1)],
  term ((-416983870520476 : Rat) / 1162780221153193) [(10, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((23067307075869547358806303988692707427719055785974047211 : Rat) / 7439991617056158548038187446690127179738771385979691040) [(10, 2), (13, 1), (15, 1)],
  term ((-259402566307424417 : Rat) / 27906725307676632) [(10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-2027280404596760885778613316873147423024 : Rat) / 1799564186103715944850040292044308901985) [(10, 2), (13, 2)],
  term ((6627898004148186342669000713130083975168 : Rat) / 1799564186103715944850040292044308901985) [(10, 2), (13, 2), (14, 1)],
  term ((-2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(10, 2), (13, 2), (14, 2)],
  term ((-228548346943902101627953017098607070723838550969230898109 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(10, 2), (14, 1), (15, 2)],
  term ((9851670194564511 : Rat) / 2325560442306386) [(10, 2), (14, 1), (15, 2), (16, 1)],
  term ((-164450924956588150524026507372646906853948765195645650517 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(11, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((14038382648281759 : Rat) / 2325560442306386) [(11, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((61350617706986813124438775503339210401766091872685946369 : Rat) / 3719995808528079274019093723345063589869385692989845520) [(11, 2), (12, 1), (13, 1), (15, 1)],
  term ((106270994419078021 : Rat) / 13953362653838316) [(11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((3339024133903633157401158274483606530158 : Rat) / 1799564186103715944850040292044308901985) [(11, 2), (12, 1), (13, 2)],
  term ((259451438241996968824998501993404916522 : Rat) / 199951576233746216094448921338256544665) [(11, 2), (12, 1), (13, 2), (14, 1)],
  term ((228548346943902101627953017098607070723838550969230898109 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(11, 2), (12, 1), (15, 2)],
  term ((-9851670194564511 : Rat) / 4651120884612772) [(11, 2), (12, 1), (15, 2), (16, 1)],
  term ((26974210883668912519839817367166225675565343026070909313 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(11, 2), (12, 2), (13, 1), (15, 1)],
  term ((-5003541596661801 : Rat) / 2325560442306386) [(11, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-124898830274193142709262456668953249078 : Rat) / 199951576233746216094448921338256544665) [(11, 2), (12, 2), (13, 2)],
  term ((-229527336284499272616790565321770397804284922840156028953 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(11, 2), (13, 1), (14, 1), (15, 1)],
  term ((134306340333884689 : Rat) / 13953362653838316) [(11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(11, 2), (13, 1), (14, 2), (15, 1)],
  term ((-416983870520476 : Rat) / 1162780221153193) [(11, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((23067307075869547358806303988692707427719055785974047211 : Rat) / 7439991617056158548038187446690127179738771385979691040) [(11, 2), (13, 1), (15, 1)],
  term ((-259402566307424417 : Rat) / 27906725307676632) [(11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-2027280404596760885778613316873147423024 : Rat) / 1799564186103715944850040292044308901985) [(11, 2), (13, 2)],
  term ((6627898004148186342669000713130083975168 : Rat) / 1799564186103715944850040292044308901985) [(11, 2), (13, 2), (14, 1)],
  term ((-2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(11, 2), (13, 2), (14, 2)],
  term ((-228548346943902101627953017098607070723838550969230898109 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(11, 2), (14, 1), (15, 2)],
  term ((9851670194564511 : Rat) / 2325560442306386) [(11, 2), (14, 1), (15, 2), (16, 1)],
  term ((306698979342465802324085636146780654343 : Rat) / 1799564186103715944850040292044308901985) [(11, 3), (13, 1)],
  term ((2694544970124256243547102523240490961236 : Rat) / 599854728701238648283346764014769633995) [(11, 3), (13, 1), (14, 1)],
  term ((-54267504900238499965814543541110615119259775310726648457 : Rat) / 1115998742558423782205728117003519076960815707896953656) [(11, 3), (13, 1), (15, 2)],
  term ((11083636152647727 : Rat) / 2325560442306386) [(11, 3), (13, 1), (15, 2), (16, 1)],
  term ((5369752680556323263420502685502880998318630821031508314 : Rat) / 697499214099014863878580073127199423100509817435596035) [(11, 3), (13, 2), (15, 1)],
  term ((-75330592794360 : Rat) / 1162780221153193) [(11, 3), (13, 2), (15, 1), (16, 1)],
  term ((-40472928056033817116049120031239046672 : Rat) / 599854728701238648283346764014769633995) [(11, 3), (13, 3)],
  term ((-123634377194162065175984705896580339781478522958385658387 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(11, 3), (14, 1), (15, 1)],
  term ((16636019461371833 : Rat) / 2325560442306386) [(11, 3), (14, 1), (15, 1), (16, 1)],
  term ((64885598020952966377851495215056251811814535036016934143 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(11, 3), (15, 1)],
  term ((978162947449257 : Rat) / 1162780221153193) [(11, 3), (15, 1), (16, 1)],
  term ((-2233057704898447277337521117967487825271887127131734968 : Rat) / 697499214099014863878580073127199423100509817435596035) [(11, 3), (15, 3)],
  term ((449127554429600 : Rat) / 1162780221153193) [(11, 3), (15, 3), (16, 1)],
  term ((-1429182194689304419382031011936884624481 : Rat) / 1799564186103715944850040292044308901985) [(11, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 2, terms 300 through 335. -/
theorem ep_Q2_024_block_02_0300_0335_valid :
    checkProductSumEq ep_Q2_024_partials_02_0300_0335
      ep_Q2_024_block_02_0300_0335 = true := by
  native_decide

end EpQ2024TermShards

end Patterns

end EndpointCertificate

end Problem97
