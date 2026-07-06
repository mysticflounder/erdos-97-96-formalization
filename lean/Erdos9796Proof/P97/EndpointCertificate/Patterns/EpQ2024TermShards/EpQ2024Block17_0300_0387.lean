/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_024, term block 17:300-387

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_024`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2024TermShards

/-- Generator polynomial 17 for endpoint certificate `ep_Q2_024`. -/
def ep_Q2_024_generator_17_0300_0387 : Poly :=
[
  term (2 : Rat) [(6, 1), (14, 1)],
  term (2 : Rat) [(7, 1), (15, 1)],
  term (-1 : Rat) [(14, 2)],
  term (-1 : Rat) [(15, 2)]
]

/-- Coefficient term 300 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0300 : Poly :=
[
  term ((-49794017268134571589590260644228965512 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (12, 2), (13, 1)]
]

/-- Partial product 300 for generator 17. -/
def ep_Q2_024_partial_17_0300 : Poly :=
[
  term ((-99588034536269143179180521288457931024 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (7, 1), (12, 2), (13, 1), (14, 1)],
  term ((49794017268134571589590260644228965512 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (12, 2), (13, 1), (14, 2)],
  term ((49794017268134571589590260644228965512 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (12, 2), (13, 1), (15, 2)],
  term ((-99588034536269143179180521288457931024 : Rat) / 599854728701238648283346764014769633995) [(7, 2), (12, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 300 for generator 17. -/
theorem ep_Q2_024_partial_17_0300_valid :
    mulPoly ep_Q2_024_coefficient_17_0300
        ep_Q2_024_generator_17_0300_0387 =
      ep_Q2_024_partial_17_0300 := by
  native_decide

/-- Coefficient term 301 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0301 : Poly :=
[
  term ((183488243113488394739718246684116996552696960175428317 : Rat) / 92999895213201981850477343083626589746734642324746138) [(7, 1), (12, 2), (15, 1)]
]

/-- Partial product 301 for generator 17. -/
def ep_Q2_024_partial_17_0301 : Poly :=
[
  term ((183488243113488394739718246684116996552696960175428317 : Rat) / 46499947606600990925238671541813294873367321162373069) [(6, 1), (7, 1), (12, 2), (14, 1), (15, 1)],
  term ((-183488243113488394739718246684116996552696960175428317 : Rat) / 92999895213201981850477343083626589746734642324746138) [(7, 1), (12, 2), (14, 2), (15, 1)],
  term ((-183488243113488394739718246684116996552696960175428317 : Rat) / 92999895213201981850477343083626589746734642324746138) [(7, 1), (12, 2), (15, 3)],
  term ((183488243113488394739718246684116996552696960175428317 : Rat) / 46499947606600990925238671541813294873367321162373069) [(7, 2), (12, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 301 for generator 17. -/
theorem ep_Q2_024_partial_17_0301_valid :
    mulPoly ep_Q2_024_coefficient_17_0301
        ep_Q2_024_generator_17_0300_0387 =
      ep_Q2_024_partial_17_0301 := by
  native_decide

/-- Coefficient term 302 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0302 : Poly :=
[
  term ((-434461680526322 : Rat) / 1162780221153193) [(7, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 302 for generator 17. -/
def ep_Q2_024_partial_17_0302 : Poly :=
[
  term ((-868923361052644 : Rat) / 1162780221153193) [(6, 1), (7, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((434461680526322 : Rat) / 1162780221153193) [(7, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((434461680526322 : Rat) / 1162780221153193) [(7, 1), (12, 2), (15, 3), (16, 1)],
  term ((-868923361052644 : Rat) / 1162780221153193) [(7, 2), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 302 for generator 17. -/
theorem ep_Q2_024_partial_17_0302_valid :
    mulPoly ep_Q2_024_coefficient_17_0302
        ep_Q2_024_generator_17_0300_0387 =
      ep_Q2_024_partial_17_0302 := by
  native_decide

/-- Coefficient term 303 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0303 : Poly :=
[
  term ((-222670977423941781438890223554523312041 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (13, 1)]
]

/-- Partial product 303 for generator 17. -/
def ep_Q2_024_partial_17_0303 : Poly :=
[
  term ((-445341954847883562877780447109046624082 : Rat) / 199951576233746216094448921338256544665) [(6, 1), (7, 1), (13, 1), (14, 1)],
  term ((222670977423941781438890223554523312041 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (13, 1), (14, 2)],
  term ((222670977423941781438890223554523312041 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (13, 1), (15, 2)],
  term ((-445341954847883562877780447109046624082 : Rat) / 199951576233746216094448921338256544665) [(7, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 303 for generator 17. -/
theorem ep_Q2_024_partial_17_0303_valid :
    mulPoly ep_Q2_024_coefficient_17_0303
        ep_Q2_024_generator_17_0300_0387 =
      ep_Q2_024_partial_17_0303 := by
  native_decide

/-- Coefficient term 304 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0304 : Poly :=
[
  term ((-724312409821161271992046999236946329041 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (13, 1), (14, 1)]
]

/-- Partial product 304 for generator 17. -/
def ep_Q2_024_partial_17_0304 : Poly :=
[
  term ((-1448624819642322543984093998473892658082 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (7, 1), (13, 1), (14, 2)],
  term ((724312409821161271992046999236946329041 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (13, 1), (14, 1), (15, 2)],
  term ((724312409821161271992046999236946329041 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (13, 1), (14, 3)],
  term ((-1448624819642322543984093998473892658082 : Rat) / 599854728701238648283346764014769633995) [(7, 2), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 304 for generator 17. -/
theorem ep_Q2_024_partial_17_0304_valid :
    mulPoly ep_Q2_024_coefficient_17_0304
        ep_Q2_024_generator_17_0300_0387 =
      ep_Q2_024_partial_17_0304 := by
  native_decide

/-- Coefficient term 305 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0305 : Poly :=
[
  term ((11054165036071785399365776736060685613928533689685750087 : Rat) / 185999790426403963700954686167253179493469284649492276) [(7, 1), (13, 1), (15, 2)]
]

/-- Partial product 305 for generator 17. -/
def ep_Q2_024_partial_17_0305 : Poly :=
[
  term ((11054165036071785399365776736060685613928533689685750087 : Rat) / 92999895213201981850477343083626589746734642324746138) [(6, 1), (7, 1), (13, 1), (14, 1), (15, 2)],
  term ((-11054165036071785399365776736060685613928533689685750087 : Rat) / 185999790426403963700954686167253179493469284649492276) [(7, 1), (13, 1), (14, 2), (15, 2)],
  term ((-11054165036071785399365776736060685613928533689685750087 : Rat) / 185999790426403963700954686167253179493469284649492276) [(7, 1), (13, 1), (15, 4)],
  term ((11054165036071785399365776736060685613928533689685750087 : Rat) / 92999895213201981850477343083626589746734642324746138) [(7, 2), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 305 for generator 17. -/
theorem ep_Q2_024_partial_17_0305_valid :
    mulPoly ep_Q2_024_coefficient_17_0305
        ep_Q2_024_generator_17_0300_0387 =
      ep_Q2_024_partial_17_0305 := by
  native_decide

/-- Coefficient term 306 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0306 : Poly :=
[
  term ((-2113589838824883 : Rat) / 1162780221153193) [(7, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 306 for generator 17. -/
def ep_Q2_024_partial_17_0306 : Poly :=
[
  term ((-4227179677649766 : Rat) / 1162780221153193) [(6, 1), (7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((2113589838824883 : Rat) / 1162780221153193) [(7, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((2113589838824883 : Rat) / 1162780221153193) [(7, 1), (13, 1), (15, 4), (16, 1)],
  term ((-4227179677649766 : Rat) / 1162780221153193) [(7, 2), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 306 for generator 17. -/
theorem ep_Q2_024_partial_17_0306_valid :
    mulPoly ep_Q2_024_coefficient_17_0306
        ep_Q2_024_generator_17_0300_0387 =
      ep_Q2_024_partial_17_0306 := by
  native_decide

/-- Coefficient term 307 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0307 : Poly :=
[
  term ((-64058845371574692704468717594301588487936003313615869633 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(7, 1), (13, 2), (15, 1)]
]

/-- Partial product 307 for generator 17. -/
def ep_Q2_024_partial_17_0307 : Poly :=
[
  term ((-64058845371574692704468717594301588487936003313615869633 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(6, 1), (7, 1), (13, 2), (14, 1), (15, 1)],
  term ((64058845371574692704468717594301588487936003313615869633 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(7, 1), (13, 2), (14, 2), (15, 1)],
  term ((64058845371574692704468717594301588487936003313615869633 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(7, 1), (13, 2), (15, 3)],
  term ((-64058845371574692704468717594301588487936003313615869633 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(7, 2), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 307 for generator 17. -/
theorem ep_Q2_024_partial_17_0307_valid :
    mulPoly ep_Q2_024_coefficient_17_0307
        ep_Q2_024_generator_17_0300_0387 =
      ep_Q2_024_partial_17_0307 := by
  native_decide

/-- Coefficient term 308 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0308 : Poly :=
[
  term ((181622001380355 : Rat) / 1162780221153193) [(7, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 308 for generator 17. -/
def ep_Q2_024_partial_17_0308 : Poly :=
[
  term ((363244002760710 : Rat) / 1162780221153193) [(6, 1), (7, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-181622001380355 : Rat) / 1162780221153193) [(7, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((-181622001380355 : Rat) / 1162780221153193) [(7, 1), (13, 2), (15, 3), (16, 1)],
  term ((363244002760710 : Rat) / 1162780221153193) [(7, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 308 for generator 17. -/
theorem ep_Q2_024_partial_17_0308_valid :
    mulPoly ep_Q2_024_coefficient_17_0308
        ep_Q2_024_generator_17_0300_0387 =
      ep_Q2_024_partial_17_0308 := by
  native_decide

/-- Coefficient term 309 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0309 : Poly :=
[
  term ((24285619430674572789347187379892301356 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (13, 3)]
]

/-- Partial product 309 for generator 17. -/
def ep_Q2_024_partial_17_0309 : Poly :=
[
  term ((48571238861349145578694374759784602712 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (7, 1), (13, 3), (14, 1)],
  term ((-24285619430674572789347187379892301356 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (13, 3), (14, 2)],
  term ((-24285619430674572789347187379892301356 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (13, 3), (15, 2)],
  term ((48571238861349145578694374759784602712 : Rat) / 599854728701238648283346764014769633995) [(7, 2), (13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 309 for generator 17. -/
theorem ep_Q2_024_partial_17_0309_valid :
    mulPoly ep_Q2_024_coefficient_17_0309
        ep_Q2_024_generator_17_0300_0387 =
      ep_Q2_024_partial_17_0309 := by
  native_decide

/-- Coefficient term 310 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0310 : Poly :=
[
  term ((-20105715729045145835299038207446350531698215964122869129 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(7, 1), (14, 1), (15, 1)]
]

/-- Partial product 310 for generator 17. -/
def ep_Q2_024_partial_17_0310 : Poly :=
[
  term ((-20105715729045145835299038207446350531698215964122869129 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(6, 1), (7, 1), (14, 2), (15, 1)],
  term ((20105715729045145835299038207446350531698215964122869129 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(7, 1), (14, 1), (15, 3)],
  term ((20105715729045145835299038207446350531698215964122869129 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(7, 1), (14, 3), (15, 1)],
  term ((-20105715729045145835299038207446350531698215964122869129 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(7, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 310 for generator 17. -/
theorem ep_Q2_024_partial_17_0310_valid :
    mulPoly ep_Q2_024_coefficient_17_0310
        ep_Q2_024_generator_17_0300_0387 =
      ep_Q2_024_partial_17_0310 := by
  native_decide

/-- Coefficient term 311 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0311 : Poly :=
[
  term ((-3239154629516277 : Rat) / 1162780221153193) [(7, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 311 for generator 17. -/
def ep_Q2_024_partial_17_0311 : Poly :=
[
  term ((-6478309259032554 : Rat) / 1162780221153193) [(6, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((3239154629516277 : Rat) / 1162780221153193) [(7, 1), (14, 1), (15, 3), (16, 1)],
  term ((3239154629516277 : Rat) / 1162780221153193) [(7, 1), (14, 3), (15, 1), (16, 1)],
  term ((-6478309259032554 : Rat) / 1162780221153193) [(7, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 311 for generator 17. -/
theorem ep_Q2_024_partial_17_0311_valid :
    mulPoly ep_Q2_024_coefficient_17_0311
        ep_Q2_024_generator_17_0300_0387 =
      ep_Q2_024_partial_17_0311 := by
  native_decide

/-- Coefficient term 312 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0312 : Poly :=
[
  term ((-30514960301125684424531135215542184253408249597503293719 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (15, 1)]
]

/-- Partial product 312 for generator 17. -/
def ep_Q2_024_partial_17_0312 : Poly :=
[
  term ((-61029920602251368849062270431084368506816499195006587438 : Rat) / 697499214099014863878580073127199423100509817435596035) [(6, 1), (7, 1), (14, 1), (15, 1)],
  term ((30514960301125684424531135215542184253408249597503293719 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (14, 2), (15, 1)],
  term ((30514960301125684424531135215542184253408249597503293719 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (15, 3)],
  term ((-61029920602251368849062270431084368506816499195006587438 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 312 for generator 17. -/
theorem ep_Q2_024_partial_17_0312_valid :
    mulPoly ep_Q2_024_coefficient_17_0312
        ep_Q2_024_generator_17_0300_0387 =
      ep_Q2_024_partial_17_0312 := by
  native_decide

/-- Coefficient term 313 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0313 : Poly :=
[
  term ((-6359310750251020 : Rat) / 1162780221153193) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 313 for generator 17. -/
def ep_Q2_024_partial_17_0313 : Poly :=
[
  term ((-12718621500502040 : Rat) / 1162780221153193) [(6, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((6359310750251020 : Rat) / 1162780221153193) [(7, 1), (14, 2), (15, 1), (16, 1)],
  term ((6359310750251020 : Rat) / 1162780221153193) [(7, 1), (15, 3), (16, 1)],
  term ((-12718621500502040 : Rat) / 1162780221153193) [(7, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 313 for generator 17. -/
theorem ep_Q2_024_partial_17_0313_valid :
    mulPoly ep_Q2_024_coefficient_17_0313
        ep_Q2_024_generator_17_0300_0387 =
      ep_Q2_024_partial_17_0313 := by
  native_decide

/-- Coefficient term 314 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0314 : Poly :=
[
  term ((-4092230094817021750986965501211805014937 : Rat) / 3599128372207431889700080584088617803970) [(8, 1)]
]

/-- Partial product 314 for generator 17. -/
def ep_Q2_024_partial_17_0314 : Poly :=
[
  term ((-4092230094817021750986965501211805014937 : Rat) / 1799564186103715944850040292044308901985) [(6, 1), (8, 1), (14, 1)],
  term ((-4092230094817021750986965501211805014937 : Rat) / 1799564186103715944850040292044308901985) [(7, 1), (8, 1), (15, 1)],
  term ((4092230094817021750986965501211805014937 : Rat) / 3599128372207431889700080584088617803970) [(8, 1), (14, 2)],
  term ((4092230094817021750986965501211805014937 : Rat) / 3599128372207431889700080584088617803970) [(8, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 314 for generator 17. -/
theorem ep_Q2_024_partial_17_0314_valid :
    mulPoly ep_Q2_024_coefficient_17_0314
        ep_Q2_024_generator_17_0300_0387 =
      ep_Q2_024_partial_17_0314 := by
  native_decide

/-- Coefficient term 315 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0315 : Poly :=
[
  term ((-3746455109214513647533842907033862514196 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (9, 1), (13, 1)]
]

/-- Partial product 315 for generator 17. -/
def ep_Q2_024_partial_17_0315 : Poly :=
[
  term ((-7492910218429027295067685814067725028392 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (8, 1), (9, 1), (13, 1), (14, 1)],
  term ((-7492910218429027295067685814067725028392 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 1), (9, 1), (13, 1), (15, 1)],
  term ((3746455109214513647533842907033862514196 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (9, 1), (13, 1), (14, 2)],
  term ((3746455109214513647533842907033862514196 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (9, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 315 for generator 17. -/
theorem ep_Q2_024_partial_17_0315_valid :
    mulPoly ep_Q2_024_coefficient_17_0315
        ep_Q2_024_generator_17_0300_0387 =
      ep_Q2_024_partial_17_0315 := by
  native_decide

/-- Coefficient term 316 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0316 : Poly :=
[
  term ((6117088134986307917740122211961773302290741365461673651 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(8, 1), (9, 1), (15, 1)]
]

/-- Partial product 316 for generator 17. -/
def ep_Q2_024_partial_17_0316 : Poly :=
[
  term ((6117088134986307917740122211961773302290741365461673651 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(6, 1), (8, 1), (9, 1), (14, 1), (15, 1)],
  term ((6117088134986307917740122211961773302290741365461673651 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(7, 1), (8, 1), (9, 1), (15, 2)],
  term ((-6117088134986307917740122211961773302290741365461673651 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(8, 1), (9, 1), (14, 2), (15, 1)],
  term ((-6117088134986307917740122211961773302290741365461673651 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(8, 1), (9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 316 for generator 17. -/
theorem ep_Q2_024_partial_17_0316_valid :
    mulPoly ep_Q2_024_coefficient_17_0316
        ep_Q2_024_generator_17_0300_0387 =
      ep_Q2_024_partial_17_0316 := by
  native_decide

/-- Coefficient term 317 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0317 : Poly :=
[
  term ((-934467780965585 : Rat) / 1162780221153193) [(8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 317 for generator 17. -/
def ep_Q2_024_partial_17_0317 : Poly :=
[
  term ((-1868935561931170 : Rat) / 1162780221153193) [(6, 1), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1868935561931170 : Rat) / 1162780221153193) [(7, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((934467780965585 : Rat) / 1162780221153193) [(8, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((934467780965585 : Rat) / 1162780221153193) [(8, 1), (9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 317 for generator 17. -/
theorem ep_Q2_024_partial_17_0317_valid :
    mulPoly ep_Q2_024_coefficient_17_0317
        ep_Q2_024_generator_17_0300_0387 =
      ep_Q2_024_partial_17_0317 := by
  native_decide

/-- Coefficient term 318 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0318 : Poly :=
[
  term ((-15778133046617486582826285982925105264 : Rat) / 39990315246749243218889784267651308933) [(8, 1), (9, 2)]
]

/-- Partial product 318 for generator 17. -/
def ep_Q2_024_partial_17_0318 : Poly :=
[
  term ((-31556266093234973165652571965850210528 : Rat) / 39990315246749243218889784267651308933) [(6, 1), (8, 1), (9, 2), (14, 1)],
  term ((-31556266093234973165652571965850210528 : Rat) / 39990315246749243218889784267651308933) [(7, 1), (8, 1), (9, 2), (15, 1)],
  term ((15778133046617486582826285982925105264 : Rat) / 39990315246749243218889784267651308933) [(8, 1), (9, 2), (14, 2)],
  term ((15778133046617486582826285982925105264 : Rat) / 39990315246749243218889784267651308933) [(8, 1), (9, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 318 for generator 17. -/
theorem ep_Q2_024_partial_17_0318_valid :
    mulPoly ep_Q2_024_coefficient_17_0318
        ep_Q2_024_generator_17_0300_0387 =
      ep_Q2_024_partial_17_0318 := by
  native_decide

/-- Coefficient term 319 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0319 : Poly :=
[
  term ((548099152881790888676868839857129199219 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (12, 1)]
]

/-- Partial product 319 for generator 17. -/
def ep_Q2_024_partial_17_0319 : Poly :=
[
  term ((1096198305763581777353737679714258398438 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (8, 1), (12, 1), (14, 1)],
  term ((1096198305763581777353737679714258398438 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 1), (12, 1), (15, 1)],
  term ((-548099152881790888676868839857129199219 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (12, 1), (14, 2)],
  term ((-548099152881790888676868839857129199219 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 319 for generator 17. -/
theorem ep_Q2_024_partial_17_0319_valid :
    mulPoly ep_Q2_024_coefficient_17_0319
        ep_Q2_024_generator_17_0300_0387 =
      ep_Q2_024_partial_17_0319 := by
  native_decide

/-- Coefficient term 320 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0320 : Poly :=
[
  term ((4509825540096460287344218035091265557377562557592856533 : Rat) / 929998952132019818504773430836265897467346423247461380) [(8, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 320 for generator 17. -/
def ep_Q2_024_partial_17_0320 : Poly :=
[
  term ((4509825540096460287344218035091265557377562557592856533 : Rat) / 464999476066009909252386715418132948733673211623730690) [(6, 1), (8, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((4509825540096460287344218035091265557377562557592856533 : Rat) / 464999476066009909252386715418132948733673211623730690) [(7, 1), (8, 1), (12, 1), (13, 1), (15, 2)],
  term ((-4509825540096460287344218035091265557377562557592856533 : Rat) / 929998952132019818504773430836265897467346423247461380) [(8, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((-4509825540096460287344218035091265557377562557592856533 : Rat) / 929998952132019818504773430836265897467346423247461380) [(8, 1), (12, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 320 for generator 17. -/
theorem ep_Q2_024_partial_17_0320_valid :
    mulPoly ep_Q2_024_coefficient_17_0320
        ep_Q2_024_generator_17_0300_0387 =
      ep_Q2_024_partial_17_0320 := by
  native_decide

/-- Coefficient term 321 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0321 : Poly :=
[
  term ((-1086154201315805 : Rat) / 1162780221153193) [(8, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 321 for generator 17. -/
def ep_Q2_024_partial_17_0321 : Poly :=
[
  term ((-2172308402631610 : Rat) / 1162780221153193) [(6, 1), (8, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2172308402631610 : Rat) / 1162780221153193) [(7, 1), (8, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((1086154201315805 : Rat) / 1162780221153193) [(8, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((1086154201315805 : Rat) / 1162780221153193) [(8, 1), (12, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 321 for generator 17. -/
theorem ep_Q2_024_partial_17_0321_valid :
    mulPoly ep_Q2_024_coefficient_17_0321
        ep_Q2_024_generator_17_0300_0387 =
      ep_Q2_024_partial_17_0321 := by
  native_decide

/-- Coefficient term 322 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0322 : Poly :=
[
  term ((-24897008634067285794795130322114482756 : Rat) / 119970945740247729656669352802953926799) [(8, 1), (12, 1), (13, 2)]
]

/-- Partial product 322 for generator 17. -/
def ep_Q2_024_partial_17_0322 : Poly :=
[
  term ((-49794017268134571589590260644228965512 : Rat) / 119970945740247729656669352802953926799) [(6, 1), (8, 1), (12, 1), (13, 2), (14, 1)],
  term ((-49794017268134571589590260644228965512 : Rat) / 119970945740247729656669352802953926799) [(7, 1), (8, 1), (12, 1), (13, 2), (15, 1)],
  term ((24897008634067285794795130322114482756 : Rat) / 119970945740247729656669352802953926799) [(8, 1), (12, 1), (13, 2), (14, 2)],
  term ((24897008634067285794795130322114482756 : Rat) / 119970945740247729656669352802953926799) [(8, 1), (12, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 322 for generator 17. -/
theorem ep_Q2_024_partial_17_0322_valid :
    mulPoly ep_Q2_024_coefficient_17_0322
        ep_Q2_024_generator_17_0300_0387 =
      ep_Q2_024_partial_17_0322 := by
  native_decide

/-- Coefficient term 323 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0323 : Poly :=
[
  term ((99372808237559471999046051391384817781797776110267344 : Rat) / 46499947606600990925238671541813294873367321162373069) [(8, 1), (12, 1), (15, 2)]
]

/-- Partial product 323 for generator 17. -/
def ep_Q2_024_partial_17_0323 : Poly :=
[
  term ((198745616475118943998092102782769635563595552220534688 : Rat) / 46499947606600990925238671541813294873367321162373069) [(6, 1), (8, 1), (12, 1), (14, 1), (15, 2)],
  term ((198745616475118943998092102782769635563595552220534688 : Rat) / 46499947606600990925238671541813294873367321162373069) [(7, 1), (8, 1), (12, 1), (15, 3)],
  term ((-99372808237559471999046051391384817781797776110267344 : Rat) / 46499947606600990925238671541813294873367321162373069) [(8, 1), (12, 1), (14, 2), (15, 2)],
  term ((-99372808237559471999046051391384817781797776110267344 : Rat) / 46499947606600990925238671541813294873367321162373069) [(8, 1), (12, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 323 for generator 17. -/
theorem ep_Q2_024_partial_17_0323_valid :
    mulPoly ep_Q2_024_coefficient_17_0323
        ep_Q2_024_generator_17_0300_0387 =
      ep_Q2_024_partial_17_0323 := by
  native_decide

/-- Coefficient term 324 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0324 : Poly :=
[
  term ((-790816150911648 : Rat) / 1162780221153193) [(8, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 324 for generator 17. -/
def ep_Q2_024_partial_17_0324 : Poly :=
[
  term ((-1581632301823296 : Rat) / 1162780221153193) [(6, 1), (8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1581632301823296 : Rat) / 1162780221153193) [(7, 1), (8, 1), (12, 1), (15, 3), (16, 1)],
  term ((790816150911648 : Rat) / 1162780221153193) [(8, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((790816150911648 : Rat) / 1162780221153193) [(8, 1), (12, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 324 for generator 17. -/
theorem ep_Q2_024_partial_17_0324_valid :
    mulPoly ep_Q2_024_coefficient_17_0324
        ep_Q2_024_generator_17_0300_0387 =
      ep_Q2_024_partial_17_0324 := by
  native_decide

/-- Coefficient term 325 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0325 : Poly :=
[
  term ((-130492265467479818581261539582642010331763093778606157543 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(8, 1), (13, 1), (15, 1)]
]

/-- Partial product 325 for generator 17. -/
def ep_Q2_024_partial_17_0325 : Poly :=
[
  term ((-130492265467479818581261539582642010331763093778606157543 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(6, 1), (8, 1), (13, 1), (14, 1), (15, 1)],
  term ((-130492265467479818581261539582642010331763093778606157543 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(7, 1), (8, 1), (13, 1), (15, 2)],
  term ((130492265467479818581261539582642010331763093778606157543 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(8, 1), (13, 1), (14, 2), (15, 1)],
  term ((130492265467479818581261539582642010331763093778606157543 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(8, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 325 for generator 17. -/
theorem ep_Q2_024_partial_17_0325_valid :
    mulPoly ep_Q2_024_coefficient_17_0325
        ep_Q2_024_generator_17_0300_0387 =
      ep_Q2_024_partial_17_0325 := by
  native_decide

/-- Coefficient term 326 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0326 : Poly :=
[
  term ((16821740938963879 : Rat) / 6976681326919158) [(8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 326 for generator 17. -/
def ep_Q2_024_partial_17_0326 : Poly :=
[
  term ((16821740938963879 : Rat) / 3488340663459579) [(6, 1), (8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((16821740938963879 : Rat) / 3488340663459579) [(7, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((-16821740938963879 : Rat) / 6976681326919158) [(8, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-16821740938963879 : Rat) / 6976681326919158) [(8, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 326 for generator 17. -/
theorem ep_Q2_024_partial_17_0326_valid :
    mulPoly ep_Q2_024_coefficient_17_0326
        ep_Q2_024_generator_17_0300_0387 =
      ep_Q2_024_partial_17_0326 := by
  native_decide

/-- Coefficient term 327 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0327 : Poly :=
[
  term ((-8312137869246924751395695820057564190082 : Rat) / 1799564186103715944850040292044308901985) [(8, 1), (13, 2)]
]

/-- Partial product 327 for generator 17. -/
def ep_Q2_024_partial_17_0327 : Poly :=
[
  term ((-16624275738493849502791391640115128380164 : Rat) / 1799564186103715944850040292044308901985) [(6, 1), (8, 1), (13, 2), (14, 1)],
  term ((-16624275738493849502791391640115128380164 : Rat) / 1799564186103715944850040292044308901985) [(7, 1), (8, 1), (13, 2), (15, 1)],
  term ((8312137869246924751395695820057564190082 : Rat) / 1799564186103715944850040292044308901985) [(8, 1), (13, 2), (14, 2)],
  term ((8312137869246924751395695820057564190082 : Rat) / 1799564186103715944850040292044308901985) [(8, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 327 for generator 17. -/
theorem ep_Q2_024_partial_17_0327_valid :
    mulPoly ep_Q2_024_coefficient_17_0327
        ep_Q2_024_generator_17_0300_0387 =
      ep_Q2_024_partial_17_0327 := by
  native_decide

/-- Coefficient term 328 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0328 : Poly :=
[
  term ((582061027275376329967414115123588817349 : Rat) / 1199709457402477296566693528029539267990) [(8, 1), (14, 1)]
]

/-- Partial product 328 for generator 17. -/
def ep_Q2_024_partial_17_0328 : Poly :=
[
  term ((582061027275376329967414115123588817349 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (8, 1), (14, 2)],
  term ((582061027275376329967414115123588817349 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 1), (14, 1), (15, 1)],
  term ((-582061027275376329967414115123588817349 : Rat) / 1199709457402477296566693528029539267990) [(8, 1), (14, 1), (15, 2)],
  term ((-582061027275376329967414115123588817349 : Rat) / 1199709457402477296566693528029539267990) [(8, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 328 for generator 17. -/
theorem ep_Q2_024_partial_17_0328_valid :
    mulPoly ep_Q2_024_coefficient_17_0328
        ep_Q2_024_generator_17_0300_0387 =
      ep_Q2_024_partial_17_0328 := by
  native_decide

/-- Coefficient term 329 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0329 : Poly :=
[
  term ((-11054165036071785399365776736060685613928533689685750087 : Rat) / 371999580852807927401909372334506358986938569298984552) [(8, 1), (15, 2)]
]

/-- Partial product 329 for generator 17. -/
def ep_Q2_024_partial_17_0329 : Poly :=
[
  term ((-11054165036071785399365776736060685613928533689685750087 : Rat) / 185999790426403963700954686167253179493469284649492276) [(6, 1), (8, 1), (14, 1), (15, 2)],
  term ((-11054165036071785399365776736060685613928533689685750087 : Rat) / 185999790426403963700954686167253179493469284649492276) [(7, 1), (8, 1), (15, 3)],
  term ((11054165036071785399365776736060685613928533689685750087 : Rat) / 371999580852807927401909372334506358986938569298984552) [(8, 1), (14, 2), (15, 2)],
  term ((11054165036071785399365776736060685613928533689685750087 : Rat) / 371999580852807927401909372334506358986938569298984552) [(8, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 329 for generator 17. -/
theorem ep_Q2_024_partial_17_0329_valid :
    mulPoly ep_Q2_024_coefficient_17_0329
        ep_Q2_024_generator_17_0300_0387 =
      ep_Q2_024_partial_17_0329 := by
  native_decide

/-- Coefficient term 330 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0330 : Poly :=
[
  term ((2113589838824883 : Rat) / 2325560442306386) [(8, 1), (15, 2), (16, 1)]
]

/-- Partial product 330 for generator 17. -/
def ep_Q2_024_partial_17_0330 : Poly :=
[
  term ((2113589838824883 : Rat) / 1162780221153193) [(6, 1), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((2113589838824883 : Rat) / 1162780221153193) [(7, 1), (8, 1), (15, 3), (16, 1)],
  term ((-2113589838824883 : Rat) / 2325560442306386) [(8, 1), (14, 2), (15, 2), (16, 1)],
  term ((-2113589838824883 : Rat) / 2325560442306386) [(8, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 330 for generator 17. -/
theorem ep_Q2_024_partial_17_0330_valid :
    mulPoly ep_Q2_024_coefficient_17_0330
        ep_Q2_024_generator_17_0300_0387 =
      ep_Q2_024_partial_17_0330 := by
  native_decide

/-- Coefficient term 331 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0331 : Poly :=
[
  term ((413173782075119663093768476218434237432 : Rat) / 599854728701238648283346764014769633995) [(8, 2)]
]

/-- Partial product 331 for generator 17. -/
def ep_Q2_024_partial_17_0331 : Poly :=
[
  term ((826347564150239326187536952436868474864 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (8, 2), (14, 1)],
  term ((826347564150239326187536952436868474864 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 2), (15, 1)],
  term ((-413173782075119663093768476218434237432 : Rat) / 599854728701238648283346764014769633995) [(8, 2), (14, 2)],
  term ((-413173782075119663093768476218434237432 : Rat) / 599854728701238648283346764014769633995) [(8, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 331 for generator 17. -/
theorem ep_Q2_024_partial_17_0331_valid :
    mulPoly ep_Q2_024_coefficient_17_0331
        ep_Q2_024_generator_17_0300_0387 =
      ep_Q2_024_partial_17_0331 := by
  native_decide

/-- Coefficient term 332 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0332 : Poly :=
[
  term ((-11549611655419330099015694986370790116606 : Rat) / 1799564186103715944850040292044308901985) [(9, 1), (12, 1), (13, 1)]
]

/-- Partial product 332 for generator 17. -/
def ep_Q2_024_partial_17_0332 : Poly :=
[
  term ((-23099223310838660198031389972741580233212 : Rat) / 1799564186103715944850040292044308901985) [(6, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((-23099223310838660198031389972741580233212 : Rat) / 1799564186103715944850040292044308901985) [(7, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((11549611655419330099015694986370790116606 : Rat) / 1799564186103715944850040292044308901985) [(9, 1), (12, 1), (13, 1), (14, 2)],
  term ((11549611655419330099015694986370790116606 : Rat) / 1799564186103715944850040292044308901985) [(9, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 332 for generator 17. -/
theorem ep_Q2_024_partial_17_0332_valid :
    mulPoly ep_Q2_024_coefficient_17_0332
        ep_Q2_024_generator_17_0300_0387 =
      ep_Q2_024_partial_17_0332 := by
  native_decide

/-- Coefficient term 333 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0333 : Poly :=
[
  term ((331166220548963670495271984546875757516 : Rat) / 119970945740247729656669352802953926799) [(9, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 333 for generator 17. -/
def ep_Q2_024_partial_17_0333 : Poly :=
[
  term ((662332441097927340990543969093751515032 : Rat) / 119970945740247729656669352802953926799) [(6, 1), (9, 1), (12, 1), (13, 1), (14, 2)],
  term ((662332441097927340990543969093751515032 : Rat) / 119970945740247729656669352802953926799) [(7, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-331166220548963670495271984546875757516 : Rat) / 119970945740247729656669352802953926799) [(9, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((-331166220548963670495271984546875757516 : Rat) / 119970945740247729656669352802953926799) [(9, 1), (12, 1), (13, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 333 for generator 17. -/
theorem ep_Q2_024_partial_17_0333_valid :
    mulPoly ep_Q2_024_coefficient_17_0333
        ep_Q2_024_generator_17_0300_0387 =
      ep_Q2_024_partial_17_0333 := by
  native_decide

/-- Coefficient term 334 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0334 : Poly :=
[
  term ((-60613189104109889150602519961253961272330567250720564943 : Rat) / 929998952132019818504773430836265897467346423247461380) [(9, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 334 for generator 17. -/
def ep_Q2_024_partial_17_0334 : Poly :=
[
  term ((-60613189104109889150602519961253961272330567250720564943 : Rat) / 464999476066009909252386715418132948733673211623730690) [(6, 1), (9, 1), (12, 1), (14, 2), (15, 1)],
  term ((-60613189104109889150602519961253961272330567250720564943 : Rat) / 464999476066009909252386715418132948733673211623730690) [(7, 1), (9, 1), (12, 1), (14, 1), (15, 2)],
  term ((60613189104109889150602519961253961272330567250720564943 : Rat) / 929998952132019818504773430836265897467346423247461380) [(9, 1), (12, 1), (14, 1), (15, 3)],
  term ((60613189104109889150602519961253961272330567250720564943 : Rat) / 929998952132019818504773430836265897467346423247461380) [(9, 1), (12, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 334 for generator 17. -/
theorem ep_Q2_024_partial_17_0334_valid :
    mulPoly ep_Q2_024_coefficient_17_0334
        ep_Q2_024_generator_17_0300_0387 =
      ep_Q2_024_partial_17_0334 := by
  native_decide

/-- Coefficient term 335 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0335 : Poly :=
[
  term ((13480911334857383 : Rat) / 1162780221153193) [(9, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 335 for generator 17. -/
def ep_Q2_024_partial_17_0335 : Poly :=
[
  term ((26961822669714766 : Rat) / 1162780221153193) [(6, 1), (9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((26961822669714766 : Rat) / 1162780221153193) [(7, 1), (9, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-13480911334857383 : Rat) / 1162780221153193) [(9, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((-13480911334857383 : Rat) / 1162780221153193) [(9, 1), (12, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 335 for generator 17. -/
theorem ep_Q2_024_partial_17_0335_valid :
    mulPoly ep_Q2_024_coefficient_17_0335
        ep_Q2_024_generator_17_0300_0387 =
      ep_Q2_024_partial_17_0335 := by
  native_decide

/-- Coefficient term 336 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0336 : Poly :=
[
  term ((-40349338820983608515319706186594819802787146706132782807 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(9, 1), (12, 1), (15, 1)]
]

/-- Partial product 336 for generator 17. -/
def ep_Q2_024_partial_17_0336 : Poly :=
[
  term ((-40349338820983608515319706186594819802787146706132782807 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(6, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-40349338820983608515319706186594819802787146706132782807 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(7, 1), (9, 1), (12, 1), (15, 2)],
  term ((40349338820983608515319706186594819802787146706132782807 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(9, 1), (12, 1), (14, 2), (15, 1)],
  term ((40349338820983608515319706186594819802787146706132782807 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(9, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 336 for generator 17. -/
theorem ep_Q2_024_partial_17_0336_valid :
    mulPoly ep_Q2_024_coefficient_17_0336
        ep_Q2_024_generator_17_0300_0387 =
      ep_Q2_024_partial_17_0336 := by
  native_decide

/-- Coefficient term 337 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0337 : Poly :=
[
  term ((-19249089666788537 : Rat) / 6976681326919158) [(9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 337 for generator 17. -/
def ep_Q2_024_partial_17_0337 : Poly :=
[
  term ((-19249089666788537 : Rat) / 3488340663459579) [(6, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-19249089666788537 : Rat) / 3488340663459579) [(7, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((19249089666788537 : Rat) / 6976681326919158) [(9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((19249089666788537 : Rat) / 6976681326919158) [(9, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 337 for generator 17. -/
theorem ep_Q2_024_partial_17_0337_valid :
    mulPoly ep_Q2_024_coefficient_17_0337
        ep_Q2_024_generator_17_0300_0387 =
      ep_Q2_024_partial_17_0337 := by
  native_decide

/-- Coefficient term 338 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0338 : Poly :=
[
  term ((-24897008634067285794795130322114482756 : Rat) / 119970945740247729656669352802953926799) [(9, 1), (12, 2), (13, 1)]
]

/-- Partial product 338 for generator 17. -/
def ep_Q2_024_partial_17_0338 : Poly :=
[
  term ((-49794017268134571589590260644228965512 : Rat) / 119970945740247729656669352802953926799) [(6, 1), (9, 1), (12, 2), (13, 1), (14, 1)],
  term ((-49794017268134571589590260644228965512 : Rat) / 119970945740247729656669352802953926799) [(7, 1), (9, 1), (12, 2), (13, 1), (15, 1)],
  term ((24897008634067285794795130322114482756 : Rat) / 119970945740247729656669352802953926799) [(9, 1), (12, 2), (13, 1), (14, 2)],
  term ((24897008634067285794795130322114482756 : Rat) / 119970945740247729656669352802953926799) [(9, 1), (12, 2), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 338 for generator 17. -/
theorem ep_Q2_024_partial_17_0338_valid :
    mulPoly ep_Q2_024_coefficient_17_0338
        ep_Q2_024_generator_17_0300_0387 =
      ep_Q2_024_partial_17_0338 := by
  native_decide

/-- Coefficient term 339 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0339 : Poly :=
[
  term ((917441215567441973698591233420584982763484800877141585 : Rat) / 185999790426403963700954686167253179493469284649492276) [(9, 1), (12, 2), (15, 1)]
]

/-- Partial product 339 for generator 17. -/
def ep_Q2_024_partial_17_0339 : Poly :=
[
  term ((917441215567441973698591233420584982763484800877141585 : Rat) / 92999895213201981850477343083626589746734642324746138) [(6, 1), (9, 1), (12, 2), (14, 1), (15, 1)],
  term ((917441215567441973698591233420584982763484800877141585 : Rat) / 92999895213201981850477343083626589746734642324746138) [(7, 1), (9, 1), (12, 2), (15, 2)],
  term ((-917441215567441973698591233420584982763484800877141585 : Rat) / 185999790426403963700954686167253179493469284649492276) [(9, 1), (12, 2), (14, 2), (15, 1)],
  term ((-917441215567441973698591233420584982763484800877141585 : Rat) / 185999790426403963700954686167253179493469284649492276) [(9, 1), (12, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 339 for generator 17. -/
theorem ep_Q2_024_partial_17_0339_valid :
    mulPoly ep_Q2_024_coefficient_17_0339
        ep_Q2_024_generator_17_0300_0387 =
      ep_Q2_024_partial_17_0339 := by
  native_decide

/-- Coefficient term 340 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0340 : Poly :=
[
  term ((-1086154201315805 : Rat) / 1162780221153193) [(9, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 340 for generator 17. -/
def ep_Q2_024_partial_17_0340 : Poly :=
[
  term ((-2172308402631610 : Rat) / 1162780221153193) [(6, 1), (9, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-2172308402631610 : Rat) / 1162780221153193) [(7, 1), (9, 1), (12, 2), (15, 2), (16, 1)],
  term ((1086154201315805 : Rat) / 1162780221153193) [(9, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((1086154201315805 : Rat) / 1162780221153193) [(9, 1), (12, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 340 for generator 17. -/
theorem ep_Q2_024_partial_17_0340_valid :
    mulPoly ep_Q2_024_coefficient_17_0340
        ep_Q2_024_generator_17_0300_0387 =
      ep_Q2_024_partial_17_0340 := by
  native_decide

/-- Coefficient term 341 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0341 : Poly :=
[
  term ((-13009415374761974492970561744690072708 : Rat) / 39990315246749243218889784267651308933) [(9, 1), (13, 1)]
]

/-- Partial product 341 for generator 17. -/
def ep_Q2_024_partial_17_0341 : Poly :=
[
  term ((-26018830749523948985941123489380145416 : Rat) / 39990315246749243218889784267651308933) [(6, 1), (9, 1), (13, 1), (14, 1)],
  term ((-26018830749523948985941123489380145416 : Rat) / 39990315246749243218889784267651308933) [(7, 1), (9, 1), (13, 1), (15, 1)],
  term ((13009415374761974492970561744690072708 : Rat) / 39990315246749243218889784267651308933) [(9, 1), (13, 1), (14, 2)],
  term ((13009415374761974492970561744690072708 : Rat) / 39990315246749243218889784267651308933) [(9, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 341 for generator 17. -/
theorem ep_Q2_024_partial_17_0341_valid :
    mulPoly ep_Q2_024_coefficient_17_0341
        ep_Q2_024_generator_17_0300_0387 =
      ep_Q2_024_partial_17_0341 := by
  native_decide

/-- Coefficient term 342 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0342 : Poly :=
[
  term ((8297535464004405178236178942448345295736 : Rat) / 1799564186103715944850040292044308901985) [(9, 1), (13, 1), (14, 1)]
]

/-- Partial product 342 for generator 17. -/
def ep_Q2_024_partial_17_0342 : Poly :=
[
  term ((16595070928008810356472357884896690591472 : Rat) / 1799564186103715944850040292044308901985) [(6, 1), (9, 1), (13, 1), (14, 2)],
  term ((16595070928008810356472357884896690591472 : Rat) / 1799564186103715944850040292044308901985) [(7, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((-8297535464004405178236178942448345295736 : Rat) / 1799564186103715944850040292044308901985) [(9, 1), (13, 1), (14, 1), (15, 2)],
  term ((-8297535464004405178236178942448345295736 : Rat) / 1799564186103715944850040292044308901985) [(9, 1), (13, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 342 for generator 17. -/
theorem ep_Q2_024_partial_17_0342_valid :
    mulPoly ep_Q2_024_coefficient_17_0342
        ep_Q2_024_generator_17_0300_0387 =
      ep_Q2_024_partial_17_0342 := by
  native_decide

/-- Coefficient term 343 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0343 : Poly :=
[
  term ((-4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (13, 1), (14, 2)]
]

/-- Partial product 343 for generator 17. -/
def ep_Q2_024_partial_17_0343 : Poly :=
[
  term ((-8486750246624093521424296941571253888 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (9, 1), (13, 1), (14, 3)],
  term ((-8486750246624093521424296941571253888 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (9, 1), (13, 1), (14, 2), (15, 1)],
  term ((4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (13, 1), (14, 2), (15, 2)],
  term ((4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (13, 1), (14, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 343 for generator 17. -/
theorem ep_Q2_024_partial_17_0343_valid :
    mulPoly ep_Q2_024_coefficient_17_0343
        ep_Q2_024_generator_17_0300_0387 =
      ep_Q2_024_partial_17_0343 := by
  native_decide

/-- Coefficient term 344 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0344 : Poly :=
[
  term ((50694531120742589082227927120420509109701353756103658903 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(9, 1), (14, 1), (15, 1)]
]

/-- Partial product 344 for generator 17. -/
def ep_Q2_024_partial_17_0344 : Poly :=
[
  term ((50694531120742589082227927120420509109701353756103658903 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(6, 1), (9, 1), (14, 2), (15, 1)],
  term ((50694531120742589082227927120420509109701353756103658903 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(7, 1), (9, 1), (14, 1), (15, 2)],
  term ((-50694531120742589082227927120420509109701353756103658903 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(9, 1), (14, 1), (15, 3)],
  term ((-50694531120742589082227927120420509109701353756103658903 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(9, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 344 for generator 17. -/
theorem ep_Q2_024_partial_17_0344_valid :
    mulPoly ep_Q2_024_coefficient_17_0344
        ep_Q2_024_generator_17_0300_0387 =
      ep_Q2_024_partial_17_0344 := by
  native_decide

/-- Coefficient term 345 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0345 : Poly :=
[
  term ((91242845031671521 : Rat) / 6976681326919158) [(9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 345 for generator 17. -/
def ep_Q2_024_partial_17_0345 : Poly :=
[
  term ((91242845031671521 : Rat) / 3488340663459579) [(6, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((91242845031671521 : Rat) / 3488340663459579) [(7, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-91242845031671521 : Rat) / 6976681326919158) [(9, 1), (14, 1), (15, 3), (16, 1)],
  term ((-91242845031671521 : Rat) / 6976681326919158) [(9, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 345 for generator 17. -/
theorem ep_Q2_024_partial_17_0345_valid :
    mulPoly ep_Q2_024_coefficient_17_0345
        ep_Q2_024_generator_17_0300_0387 =
      ep_Q2_024_partial_17_0345 := by
  native_decide

/-- Coefficient term 346 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0346 : Poly :=
[
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(9, 1), (14, 2), (15, 1)]
]

/-- Partial product 346 for generator 17. -/
def ep_Q2_024_partial_17_0346 : Poly :=
[
  term ((-674456529895393409686477352003493571793009190155093372 : Rat) / 139499842819802972775716014625439884620101963487119207) [(6, 1), (9, 1), (14, 3), (15, 1)],
  term ((-674456529895393409686477352003493571793009190155093372 : Rat) / 139499842819802972775716014625439884620101963487119207) [(7, 1), (9, 1), (14, 2), (15, 2)],
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(9, 1), (14, 2), (15, 3)],
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(9, 1), (14, 4), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 346 for generator 17. -/
theorem ep_Q2_024_partial_17_0346_valid :
    mulPoly ep_Q2_024_coefficient_17_0346
        ep_Q2_024_generator_17_0300_0387 =
      ep_Q2_024_partial_17_0346 := by
  native_decide

/-- Coefficient term 347 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0347 : Poly :=
[
  term ((-833967741040952 : Rat) / 1162780221153193) [(9, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 347 for generator 17. -/
def ep_Q2_024_partial_17_0347 : Poly :=
[
  term ((-1667935482081904 : Rat) / 1162780221153193) [(6, 1), (9, 1), (14, 3), (15, 1), (16, 1)],
  term ((-1667935482081904 : Rat) / 1162780221153193) [(7, 1), (9, 1), (14, 2), (15, 2), (16, 1)],
  term ((833967741040952 : Rat) / 1162780221153193) [(9, 1), (14, 2), (15, 3), (16, 1)],
  term ((833967741040952 : Rat) / 1162780221153193) [(9, 1), (14, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 347 for generator 17. -/
theorem ep_Q2_024_partial_17_0347_valid :
    mulPoly ep_Q2_024_coefficient_17_0347
        ep_Q2_024_generator_17_0300_0387 =
      ep_Q2_024_partial_17_0347 := by
  native_decide

/-- Coefficient term 348 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0348 : Poly :=
[
  term ((-165669431708403358095974673330882519416844293512596247303 : Rat) / 3719995808528079274019093723345063589869385692989845520) [(9, 1), (15, 1)]
]

/-- Partial product 348 for generator 17. -/
def ep_Q2_024_partial_17_0348 : Poly :=
[
  term ((-165669431708403358095974673330882519416844293512596247303 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(6, 1), (9, 1), (14, 1), (15, 1)],
  term ((-165669431708403358095974673330882519416844293512596247303 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(7, 1), (9, 1), (15, 2)],
  term ((165669431708403358095974673330882519416844293512596247303 : Rat) / 3719995808528079274019093723345063589869385692989845520) [(9, 1), (14, 2), (15, 1)],
  term ((165669431708403358095974673330882519416844293512596247303 : Rat) / 3719995808528079274019093723345063589869385692989845520) [(9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 348 for generator 17. -/
theorem ep_Q2_024_partial_17_0348_valid :
    mulPoly ep_Q2_024_coefficient_17_0348
        ep_Q2_024_generator_17_0300_0387 =
      ep_Q2_024_partial_17_0348 := by
  native_decide

/-- Coefficient term 349 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0349 : Poly :=
[
  term ((6178942586223279 : Rat) / 4651120884612772) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 349 for generator 17. -/
def ep_Q2_024_partial_17_0349 : Poly :=
[
  term ((6178942586223279 : Rat) / 2325560442306386) [(6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((6178942586223279 : Rat) / 2325560442306386) [(7, 1), (9, 1), (15, 2), (16, 1)],
  term ((-6178942586223279 : Rat) / 4651120884612772) [(9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-6178942586223279 : Rat) / 4651120884612772) [(9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 349 for generator 17. -/
theorem ep_Q2_024_partial_17_0349_valid :
    mulPoly ep_Q2_024_coefficient_17_0349
        ep_Q2_024_generator_17_0300_0387 =
      ep_Q2_024_partial_17_0349 := by
  native_decide

/-- Coefficient term 350 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0350 : Poly :=
[
  term ((416799047974137257882520261913845213748 : Rat) / 599854728701238648283346764014769633995) [(9, 2)]
]

/-- Partial product 350 for generator 17. -/
def ep_Q2_024_partial_17_0350 : Poly :=
[
  term ((833598095948274515765040523827690427496 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (9, 2), (14, 1)],
  term ((833598095948274515765040523827690427496 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (9, 2), (15, 1)],
  term ((-416799047974137257882520261913845213748 : Rat) / 599854728701238648283346764014769633995) [(9, 2), (14, 2)],
  term ((-416799047974137257882520261913845213748 : Rat) / 599854728701238648283346764014769633995) [(9, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 350 for generator 17. -/
theorem ep_Q2_024_partial_17_0350_valid :
    mulPoly ep_Q2_024_coefficient_17_0350
        ep_Q2_024_generator_17_0300_0387 =
      ep_Q2_024_partial_17_0350 := by
  native_decide

/-- Coefficient term 351 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0351 : Poly :=
[
  term ((-756853079518421755959986251253677503020 : Rat) / 119970945740247729656669352802953926799) [(9, 2), (12, 1)]
]

/-- Partial product 351 for generator 17. -/
def ep_Q2_024_partial_17_0351 : Poly :=
[
  term ((-1513706159036843511919972502507355006040 : Rat) / 119970945740247729656669352802953926799) [(6, 1), (9, 2), (12, 1), (14, 1)],
  term ((-1513706159036843511919972502507355006040 : Rat) / 119970945740247729656669352802953926799) [(7, 1), (9, 2), (12, 1), (15, 1)],
  term ((756853079518421755959986251253677503020 : Rat) / 119970945740247729656669352802953926799) [(9, 2), (12, 1), (14, 2)],
  term ((756853079518421755959986251253677503020 : Rat) / 119970945740247729656669352802953926799) [(9, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 351 for generator 17. -/
theorem ep_Q2_024_partial_17_0351_valid :
    mulPoly ep_Q2_024_coefficient_17_0351
        ep_Q2_024_generator_17_0300_0387 =
      ep_Q2_024_partial_17_0351 := by
  native_decide

/-- Coefficient term 352 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0352 : Poly :=
[
  term ((45563684842479776101655148289441130296 : Rat) / 3389009766673664679566930870139941435) [(9, 2), (14, 1)]
]

/-- Partial product 352 for generator 17. -/
def ep_Q2_024_partial_17_0352 : Poly :=
[
  term ((91127369684959552203310296578882260592 : Rat) / 3389009766673664679566930870139941435) [(6, 1), (9, 2), (14, 2)],
  term ((91127369684959552203310296578882260592 : Rat) / 3389009766673664679566930870139941435) [(7, 1), (9, 2), (14, 1), (15, 1)],
  term ((-45563684842479776101655148289441130296 : Rat) / 3389009766673664679566930870139941435) [(9, 2), (14, 1), (15, 2)],
  term ((-45563684842479776101655148289441130296 : Rat) / 3389009766673664679566930870139941435) [(9, 2), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 352 for generator 17. -/
theorem ep_Q2_024_partial_17_0352_valid :
    mulPoly ep_Q2_024_coefficient_17_0352
        ep_Q2_024_generator_17_0300_0387 =
      ep_Q2_024_partial_17_0352 := by
  native_decide

/-- Coefficient term 353 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0353 : Poly :=
[
  term ((43741535203122931497691406845856717248 : Rat) / 599854728701238648283346764014769633995) [(11, 1), (12, 1), (13, 1)]
]

/-- Partial product 353 for generator 17. -/
def ep_Q2_024_partial_17_0353 : Poly :=
[
  term ((87483070406245862995382813691713434496 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((87483070406245862995382813691713434496 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-43741535203122931497691406845856717248 : Rat) / 599854728701238648283346764014769633995) [(11, 1), (12, 1), (13, 1), (14, 2)],
  term ((-43741535203122931497691406845856717248 : Rat) / 599854728701238648283346764014769633995) [(11, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 353 for generator 17. -/
theorem ep_Q2_024_partial_17_0353_valid :
    mulPoly ep_Q2_024_coefficient_17_0353
        ep_Q2_024_generator_17_0300_0387 =
      ep_Q2_024_partial_17_0353 := by
  native_decide

/-- Coefficient term 354 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0354 : Poly :=
[
  term ((8088250242351929820163091804873870410062191739236192053 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(11, 1), (12, 1), (15, 1)]
]

/-- Partial product 354 for generator 17. -/
def ep_Q2_024_partial_17_0354 : Poly :=
[
  term ((8088250242351929820163091804873870410062191739236192053 : Rat) / 697499214099014863878580073127199423100509817435596035) [(6, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((8088250242351929820163091804873870410062191739236192053 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (11, 1), (12, 1), (15, 2)],
  term ((-8088250242351929820163091804873870410062191739236192053 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(11, 1), (12, 1), (14, 2), (15, 1)],
  term ((-8088250242351929820163091804873870410062191739236192053 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(11, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 354 for generator 17. -/
theorem ep_Q2_024_partial_17_0354_valid :
    mulPoly ep_Q2_024_coefficient_17_0354
        ep_Q2_024_generator_17_0300_0387 =
      ep_Q2_024_partial_17_0354 := by
  native_decide

/-- Coefficient term 355 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0355 : Poly :=
[
  term ((28986108453490 : Rat) / 1162780221153193) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 355 for generator 17. -/
def ep_Q2_024_partial_17_0355 : Poly :=
[
  term ((57972216906980 : Rat) / 1162780221153193) [(6, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((57972216906980 : Rat) / 1162780221153193) [(7, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-28986108453490 : Rat) / 1162780221153193) [(11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-28986108453490 : Rat) / 1162780221153193) [(11, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 355 for generator 17. -/
theorem ep_Q2_024_partial_17_0355_valid :
    mulPoly ep_Q2_024_coefficient_17_0355
        ep_Q2_024_generator_17_0300_0387 =
      ep_Q2_024_partial_17_0355 := by
  native_decide

/-- Coefficient term 356 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0356 : Poly :=
[
  term ((-2256715975290250605431863812890733365038 : Rat) / 1799564186103715944850040292044308901985) [(11, 1), (13, 1)]
]

/-- Partial product 356 for generator 17. -/
def ep_Q2_024_partial_17_0356 : Poly :=
[
  term ((-4513431950580501210863727625781466730076 : Rat) / 1799564186103715944850040292044308901985) [(6, 1), (11, 1), (13, 1), (14, 1)],
  term ((-4513431950580501210863727625781466730076 : Rat) / 1799564186103715944850040292044308901985) [(7, 1), (11, 1), (13, 1), (15, 1)],
  term ((2256715975290250605431863812890733365038 : Rat) / 1799564186103715944850040292044308901985) [(11, 1), (13, 1), (14, 2)],
  term ((2256715975290250605431863812890733365038 : Rat) / 1799564186103715944850040292044308901985) [(11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 356 for generator 17. -/
theorem ep_Q2_024_partial_17_0356_valid :
    mulPoly ep_Q2_024_coefficient_17_0356
        ep_Q2_024_generator_17_0300_0387 =
      ep_Q2_024_partial_17_0356 := by
  native_decide

/-- Coefficient term 357 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0357 : Poly :=
[
  term ((-1423394947353997475535293212764471124453 : Rat) / 1799564186103715944850040292044308901985) [(12, 1)]
]

/-- Partial product 357 for generator 17. -/
def ep_Q2_024_partial_17_0357 : Poly :=
[
  term ((-2846789894707994951070586425528942248906 : Rat) / 1799564186103715944850040292044308901985) [(6, 1), (12, 1), (14, 1)],
  term ((-2846789894707994951070586425528942248906 : Rat) / 1799564186103715944850040292044308901985) [(7, 1), (12, 1), (15, 1)],
  term ((1423394947353997475535293212764471124453 : Rat) / 1799564186103715944850040292044308901985) [(12, 1), (14, 2)],
  term ((1423394947353997475535293212764471124453 : Rat) / 1799564186103715944850040292044308901985) [(12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 357 for generator 17. -/
theorem ep_Q2_024_partial_17_0357_valid :
    mulPoly ep_Q2_024_coefficient_17_0357
        ep_Q2_024_generator_17_0300_0387 =
      ep_Q2_024_partial_17_0357 := by
  native_decide

/-- Coefficient term 358 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0358 : Poly :=
[
  term ((-711263385280071340703317012247457547686834787034189212 : Rat) / 697499214099014863878580073127199423100509817435596035) [(12, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 358 for generator 17. -/
def ep_Q2_024_partial_17_0358 : Poly :=
[
  term ((-1422526770560142681406634024494915095373669574068378424 : Rat) / 697499214099014863878580073127199423100509817435596035) [(6, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((-1422526770560142681406634024494915095373669574068378424 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((711263385280071340703317012247457547686834787034189212 : Rat) / 697499214099014863878580073127199423100509817435596035) [(12, 1), (13, 1), (14, 1), (15, 3)],
  term ((711263385280071340703317012247457547686834787034189212 : Rat) / 697499214099014863878580073127199423100509817435596035) [(12, 1), (13, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 358 for generator 17. -/
theorem ep_Q2_024_partial_17_0358_valid :
    mulPoly ep_Q2_024_coefficient_17_0358
        ep_Q2_024_generator_17_0300_0387 =
      ep_Q2_024_partial_17_0358 := by
  native_decide

/-- Coefficient term 359 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0359 : Poly :=
[
  term ((-1944431909698480 : Rat) / 1162780221153193) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 359 for generator 17. -/
def ep_Q2_024_partial_17_0359 : Poly :=
[
  term ((-3888863819396960 : Rat) / 1162780221153193) [(6, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-3888863819396960 : Rat) / 1162780221153193) [(7, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((1944431909698480 : Rat) / 1162780221153193) [(12, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((1944431909698480 : Rat) / 1162780221153193) [(12, 1), (13, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 359 for generator 17. -/
theorem ep_Q2_024_partial_17_0359_valid :
    mulPoly ep_Q2_024_coefficient_17_0359
        ep_Q2_024_generator_17_0300_0387 =
      ep_Q2_024_partial_17_0359 := by
  native_decide

/-- Coefficient term 360 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0360 : Poly :=
[
  term ((146282415801435285058741788196157594914871161152352014199 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(12, 1), (13, 1), (15, 1)]
]

/-- Partial product 360 for generator 17. -/
def ep_Q2_024_partial_17_0360 : Poly :=
[
  term ((146282415801435285058741788196157594914871161152352014199 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(6, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((146282415801435285058741788196157594914871161152352014199 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(7, 1), (12, 1), (13, 1), (15, 2)],
  term ((-146282415801435285058741788196157594914871161152352014199 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(12, 1), (13, 1), (14, 2), (15, 1)],
  term ((-146282415801435285058741788196157594914871161152352014199 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(12, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 360 for generator 17. -/
theorem ep_Q2_024_partial_17_0360_valid :
    mulPoly ep_Q2_024_coefficient_17_0360
        ep_Q2_024_generator_17_0300_0387 =
      ep_Q2_024_partial_17_0360 := by
  native_decide

/-- Coefficient term 361 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0361 : Poly :=
[
  term ((-3273237810801317 : Rat) / 2325560442306386) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 361 for generator 17. -/
def ep_Q2_024_partial_17_0361 : Poly :=
[
  term ((-3273237810801317 : Rat) / 1162780221153193) [(6, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3273237810801317 : Rat) / 1162780221153193) [(7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((3273237810801317 : Rat) / 2325560442306386) [(12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((3273237810801317 : Rat) / 2325560442306386) [(12, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 361 for generator 17. -/
theorem ep_Q2_024_partial_17_0361_valid :
    mulPoly ep_Q2_024_coefficient_17_0361
        ep_Q2_024_generator_17_0300_0387 =
      ep_Q2_024_partial_17_0361 := by
  native_decide

/-- Coefficient term 362 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0362 : Poly :=
[
  term ((-79228566044561475242734815837235836414 : Rat) / 199951576233746216094448921338256544665) [(12, 1), (13, 2)]
]

/-- Partial product 362 for generator 17. -/
def ep_Q2_024_partial_17_0362 : Poly :=
[
  term ((-158457132089122950485469631674471672828 : Rat) / 199951576233746216094448921338256544665) [(6, 1), (12, 1), (13, 2), (14, 1)],
  term ((-158457132089122950485469631674471672828 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (12, 1), (13, 2), (15, 1)],
  term ((79228566044561475242734815837235836414 : Rat) / 199951576233746216094448921338256544665) [(12, 1), (13, 2), (14, 2)],
  term ((79228566044561475242734815837235836414 : Rat) / 199951576233746216094448921338256544665) [(12, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 362 for generator 17. -/
theorem ep_Q2_024_partial_17_0362_valid :
    mulPoly ep_Q2_024_coefficient_17_0362
        ep_Q2_024_generator_17_0300_0387 =
      ep_Q2_024_partial_17_0362 := by
  native_decide

/-- Coefficient term 363 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0363 : Poly :=
[
  term ((-22370519732554535961701071237261233856 : Rat) / 119970945740247729656669352802953926799) [(12, 1), (13, 2), (14, 1)]
]

/-- Partial product 363 for generator 17. -/
def ep_Q2_024_partial_17_0363 : Poly :=
[
  term ((-44741039465109071923402142474522467712 : Rat) / 119970945740247729656669352802953926799) [(6, 1), (12, 1), (13, 2), (14, 2)],
  term ((-44741039465109071923402142474522467712 : Rat) / 119970945740247729656669352802953926799) [(7, 1), (12, 1), (13, 2), (14, 1), (15, 1)],
  term ((22370519732554535961701071237261233856 : Rat) / 119970945740247729656669352802953926799) [(12, 1), (13, 2), (14, 1), (15, 2)],
  term ((22370519732554535961701071237261233856 : Rat) / 119970945740247729656669352802953926799) [(12, 1), (13, 2), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 363 for generator 17. -/
theorem ep_Q2_024_partial_17_0363_valid :
    mulPoly ep_Q2_024_coefficient_17_0363
        ep_Q2_024_generator_17_0300_0387 =
      ep_Q2_024_partial_17_0363 := by
  native_decide

/-- Coefficient term 364 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0364 : Poly :=
[
  term ((555297572691790204322736048305803642621 : Rat) / 1199709457402477296566693528029539267990) [(12, 1), (14, 1)]
]

/-- Partial product 364 for generator 17. -/
def ep_Q2_024_partial_17_0364 : Poly :=
[
  term ((555297572691790204322736048305803642621 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (12, 1), (14, 2)],
  term ((555297572691790204322736048305803642621 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (12, 1), (14, 1), (15, 1)],
  term ((-555297572691790204322736048305803642621 : Rat) / 1199709457402477296566693528029539267990) [(12, 1), (14, 1), (15, 2)],
  term ((-555297572691790204322736048305803642621 : Rat) / 1199709457402477296566693528029539267990) [(12, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 364 for generator 17. -/
theorem ep_Q2_024_partial_17_0364_valid :
    mulPoly ep_Q2_024_coefficient_17_0364
        ep_Q2_024_generator_17_0300_0387 =
      ep_Q2_024_partial_17_0364 := by
  native_decide

/-- Coefficient term 365 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0365 : Poly :=
[
  term ((-58402937808909823415415747455066287363114737333131056647 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(12, 1), (15, 2)]
]

/-- Partial product 365 for generator 17. -/
def ep_Q2_024_partial_17_0365 : Poly :=
[
  term ((-58402937808909823415415747455066287363114737333131056647 : Rat) / 929998952132019818504773430836265897467346423247461380) [(6, 1), (12, 1), (14, 1), (15, 2)],
  term ((-58402937808909823415415747455066287363114737333131056647 : Rat) / 929998952132019818504773430836265897467346423247461380) [(7, 1), (12, 1), (15, 3)],
  term ((58402937808909823415415747455066287363114737333131056647 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(12, 1), (14, 2), (15, 2)],
  term ((58402937808909823415415747455066287363114737333131056647 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(12, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 365 for generator 17. -/
theorem ep_Q2_024_partial_17_0365_valid :
    mulPoly ep_Q2_024_coefficient_17_0365
        ep_Q2_024_generator_17_0300_0387 =
      ep_Q2_024_partial_17_0365 := by
  native_decide

/-- Coefficient term 366 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0366 : Poly :=
[
  term ((4686632705057719 : Rat) / 2325560442306386) [(12, 1), (15, 2), (16, 1)]
]

/-- Partial product 366 for generator 17. -/
def ep_Q2_024_partial_17_0366 : Poly :=
[
  term ((4686632705057719 : Rat) / 1162780221153193) [(6, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((4686632705057719 : Rat) / 1162780221153193) [(7, 1), (12, 1), (15, 3), (16, 1)],
  term ((-4686632705057719 : Rat) / 2325560442306386) [(12, 1), (14, 2), (15, 2), (16, 1)],
  term ((-4686632705057719 : Rat) / 2325560442306386) [(12, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 366 for generator 17. -/
theorem ep_Q2_024_partial_17_0366_valid :
    mulPoly ep_Q2_024_coefficient_17_0366
        ep_Q2_024_generator_17_0300_0387 =
      ep_Q2_024_partial_17_0366 := by
  native_decide

/-- Coefficient term 367 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0367 : Poly :=
[
  term ((44975123602223741861033454546231653929 : Rat) / 199951576233746216094448921338256544665) [(12, 2)]
]

/-- Partial product 367 for generator 17. -/
def ep_Q2_024_partial_17_0367 : Poly :=
[
  term ((89950247204447483722066909092463307858 : Rat) / 199951576233746216094448921338256544665) [(6, 1), (12, 2), (14, 1)],
  term ((89950247204447483722066909092463307858 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (12, 2), (15, 1)],
  term ((-44975123602223741861033454546231653929 : Rat) / 199951576233746216094448921338256544665) [(12, 2), (14, 2)],
  term ((-44975123602223741861033454546231653929 : Rat) / 199951576233746216094448921338256544665) [(12, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 367 for generator 17. -/
theorem ep_Q2_024_partial_17_0367_valid :
    mulPoly ep_Q2_024_coefficient_17_0367
        ep_Q2_024_generator_17_0300_0387 =
      ep_Q2_024_partial_17_0367 := by
  native_decide

/-- Coefficient term 368 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0368 : Poly :=
[
  term ((-707925749578171130110167924943710236709971281898758868 : Rat) / 232499738033004954626193357709066474366836605811865345) [(12, 2), (13, 1), (15, 1)]
]

/-- Partial product 368 for generator 17. -/
def ep_Q2_024_partial_17_0368 : Poly :=
[
  term ((-1415851499156342260220335849887420473419942563797517736 : Rat) / 232499738033004954626193357709066474366836605811865345) [(6, 1), (12, 2), (13, 1), (14, 1), (15, 1)],
  term ((-1415851499156342260220335849887420473419942563797517736 : Rat) / 232499738033004954626193357709066474366836605811865345) [(7, 1), (12, 2), (13, 1), (15, 2)],
  term ((707925749578171130110167924943710236709971281898758868 : Rat) / 232499738033004954626193357709066474366836605811865345) [(12, 2), (13, 1), (14, 2), (15, 1)],
  term ((707925749578171130110167924943710236709971281898758868 : Rat) / 232499738033004954626193357709066474366836605811865345) [(12, 2), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 368 for generator 17. -/
theorem ep_Q2_024_partial_17_0368_valid :
    mulPoly ep_Q2_024_coefficient_17_0368
        ep_Q2_024_generator_17_0300_0387 =
      ep_Q2_024_partial_17_0368 := by
  native_decide

/-- Coefficient term 369 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0369 : Poly :=
[
  term ((-1269203461259312 : Rat) / 1162780221153193) [(12, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 369 for generator 17. -/
def ep_Q2_024_partial_17_0369 : Poly :=
[
  term ((-2538406922518624 : Rat) / 1162780221153193) [(6, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2538406922518624 : Rat) / 1162780221153193) [(7, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((1269203461259312 : Rat) / 1162780221153193) [(12, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((1269203461259312 : Rat) / 1162780221153193) [(12, 2), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 369 for generator 17. -/
theorem ep_Q2_024_partial_17_0369_valid :
    mulPoly ep_Q2_024_coefficient_17_0369
        ep_Q2_024_generator_17_0300_0387 =
      ep_Q2_024_partial_17_0369 := by
  native_decide

/-- Coefficient term 370 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0370 : Poly :=
[
  term ((98886758962730543340771375054612478048 : Rat) / 599854728701238648283346764014769633995) [(12, 2), (13, 2)]
]

/-- Partial product 370 for generator 17. -/
def ep_Q2_024_partial_17_0370 : Poly :=
[
  term ((197773517925461086681542750109224956096 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (12, 2), (13, 2), (14, 1)],
  term ((197773517925461086681542750109224956096 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (12, 2), (13, 2), (15, 1)],
  term ((-98886758962730543340771375054612478048 : Rat) / 599854728701238648283346764014769633995) [(12, 2), (13, 2), (14, 2)],
  term ((-98886758962730543340771375054612478048 : Rat) / 599854728701238648283346764014769633995) [(12, 2), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 370 for generator 17. -/
theorem ep_Q2_024_partial_17_0370_valid :
    mulPoly ep_Q2_024_coefficient_17_0370
        ep_Q2_024_generator_17_0300_0387 =
      ep_Q2_024_partial_17_0370 := by
  native_decide

/-- Coefficient term 371 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0371 : Poly :=
[
  term ((99372808237559471999046051391384817781797776110267344 : Rat) / 46499947606600990925238671541813294873367321162373069) [(12, 2), (15, 2)]
]

/-- Partial product 371 for generator 17. -/
def ep_Q2_024_partial_17_0371 : Poly :=
[
  term ((198745616475118943998092102782769635563595552220534688 : Rat) / 46499947606600990925238671541813294873367321162373069) [(6, 1), (12, 2), (14, 1), (15, 2)],
  term ((198745616475118943998092102782769635563595552220534688 : Rat) / 46499947606600990925238671541813294873367321162373069) [(7, 1), (12, 2), (15, 3)],
  term ((-99372808237559471999046051391384817781797776110267344 : Rat) / 46499947606600990925238671541813294873367321162373069) [(12, 2), (14, 2), (15, 2)],
  term ((-99372808237559471999046051391384817781797776110267344 : Rat) / 46499947606600990925238671541813294873367321162373069) [(12, 2), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 371 for generator 17. -/
theorem ep_Q2_024_partial_17_0371_valid :
    mulPoly ep_Q2_024_coefficient_17_0371
        ep_Q2_024_generator_17_0300_0387 =
      ep_Q2_024_partial_17_0371 := by
  native_decide

/-- Coefficient term 372 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0372 : Poly :=
[
  term ((-790816150911648 : Rat) / 1162780221153193) [(12, 2), (15, 2), (16, 1)]
]

/-- Partial product 372 for generator 17. -/
def ep_Q2_024_partial_17_0372 : Poly :=
[
  term ((-1581632301823296 : Rat) / 1162780221153193) [(6, 1), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((-1581632301823296 : Rat) / 1162780221153193) [(7, 1), (12, 2), (15, 3), (16, 1)],
  term ((790816150911648 : Rat) / 1162780221153193) [(12, 2), (14, 2), (15, 2), (16, 1)],
  term ((790816150911648 : Rat) / 1162780221153193) [(12, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 372 for generator 17. -/
theorem ep_Q2_024_partial_17_0372_valid :
    mulPoly ep_Q2_024_coefficient_17_0372
        ep_Q2_024_generator_17_0300_0387 =
      ep_Q2_024_partial_17_0372 := by
  native_decide

/-- Coefficient term 373 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0373 : Poly :=
[
  term ((-45115300623382422580924426910039717272296550294439422837 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(13, 1), (14, 1), (15, 1)]
]

/-- Partial product 373 for generator 17. -/
def ep_Q2_024_partial_17_0373 : Poly :=
[
  term ((-45115300623382422580924426910039717272296550294439422837 : Rat) / 697499214099014863878580073127199423100509817435596035) [(6, 1), (13, 1), (14, 2), (15, 1)],
  term ((-45115300623382422580924426910039717272296550294439422837 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (13, 1), (14, 1), (15, 2)],
  term ((45115300623382422580924426910039717272296550294439422837 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(13, 1), (14, 1), (15, 3)],
  term ((45115300623382422580924426910039717272296550294439422837 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(13, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 373 for generator 17. -/
theorem ep_Q2_024_partial_17_0373_valid :
    mulPoly ep_Q2_024_coefficient_17_0373
        ep_Q2_024_generator_17_0300_0387 =
      ep_Q2_024_partial_17_0373 := by
  native_decide

/-- Coefficient term 374 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0374 : Poly :=
[
  term ((8791250455854670 : Rat) / 1162780221153193) [(13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 374 for generator 17. -/
def ep_Q2_024_partial_17_0374 : Poly :=
[
  term ((17582500911709340 : Rat) / 1162780221153193) [(6, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((17582500911709340 : Rat) / 1162780221153193) [(7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-8791250455854670 : Rat) / 1162780221153193) [(13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-8791250455854670 : Rat) / 1162780221153193) [(13, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 374 for generator 17. -/
theorem ep_Q2_024_partial_17_0374_valid :
    mulPoly ep_Q2_024_coefficient_17_0374
        ep_Q2_024_generator_17_0300_0387 =
      ep_Q2_024_partial_17_0374 := by
  native_decide

/-- Coefficient term 375 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0375 : Poly :=
[
  term ((11868288096862354702854848791393147597315845764302095669 : Rat) / 464999476066009909252386715418132948733673211623730690) [(13, 1), (15, 1)]
]

/-- Partial product 375 for generator 17. -/
def ep_Q2_024_partial_17_0375 : Poly :=
[
  term ((11868288096862354702854848791393147597315845764302095669 : Rat) / 232499738033004954626193357709066474366836605811865345) [(6, 1), (13, 1), (14, 1), (15, 1)],
  term ((11868288096862354702854848791393147597315845764302095669 : Rat) / 232499738033004954626193357709066474366836605811865345) [(7, 1), (13, 1), (15, 2)],
  term ((-11868288096862354702854848791393147597315845764302095669 : Rat) / 464999476066009909252386715418132948733673211623730690) [(13, 1), (14, 2), (15, 1)],
  term ((-11868288096862354702854848791393147597315845764302095669 : Rat) / 464999476066009909252386715418132948733673211623730690) [(13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 375 for generator 17. -/
theorem ep_Q2_024_partial_17_0375_valid :
    mulPoly ep_Q2_024_coefficient_17_0375
        ep_Q2_024_generator_17_0300_0387 =
      ep_Q2_024_partial_17_0375 := by
  native_decide

/-- Coefficient term 376 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0376 : Poly :=
[
  term ((-1240762952788724 : Rat) / 1162780221153193) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 376 for generator 17. -/
def ep_Q2_024_partial_17_0376 : Poly :=
[
  term ((-2481525905577448 : Rat) / 1162780221153193) [(6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2481525905577448 : Rat) / 1162780221153193) [(7, 1), (13, 1), (15, 2), (16, 1)],
  term ((1240762952788724 : Rat) / 1162780221153193) [(13, 1), (14, 2), (15, 1), (16, 1)],
  term ((1240762952788724 : Rat) / 1162780221153193) [(13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 376 for generator 17. -/
theorem ep_Q2_024_partial_17_0376_valid :
    mulPoly ep_Q2_024_coefficient_17_0376
        ep_Q2_024_generator_17_0300_0387 =
      ep_Q2_024_partial_17_0376 := by
  native_decide

/-- Coefficient term 377 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0377 : Poly :=
[
  term ((407259749318200436404260924407160795406 : Rat) / 199951576233746216094448921338256544665) [(13, 2)]
]

/-- Partial product 377 for generator 17. -/
def ep_Q2_024_partial_17_0377 : Poly :=
[
  term ((814519498636400872808521848814321590812 : Rat) / 199951576233746216094448921338256544665) [(6, 1), (13, 2), (14, 1)],
  term ((814519498636400872808521848814321590812 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (13, 2), (15, 1)],
  term ((-407259749318200436404260924407160795406 : Rat) / 199951576233746216094448921338256544665) [(13, 2), (14, 2)],
  term ((-407259749318200436404260924407160795406 : Rat) / 199951576233746216094448921338256544665) [(13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 377 for generator 17. -/
theorem ep_Q2_024_partial_17_0377_valid :
    mulPoly ep_Q2_024_coefficient_17_0377
        ep_Q2_024_generator_17_0300_0387 =
      ep_Q2_024_partial_17_0377 := by
  native_decide

/-- Coefficient term 378 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0378 : Poly :=
[
  term ((151317972860363025090370273254143207504 : Rat) / 199951576233746216094448921338256544665) [(13, 2), (14, 1)]
]

/-- Partial product 378 for generator 17. -/
def ep_Q2_024_partial_17_0378 : Poly :=
[
  term ((302635945720726050180740546508286415008 : Rat) / 199951576233746216094448921338256544665) [(6, 1), (13, 2), (14, 2)],
  term ((302635945720726050180740546508286415008 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (13, 2), (14, 1), (15, 1)],
  term ((-151317972860363025090370273254143207504 : Rat) / 199951576233746216094448921338256544665) [(13, 2), (14, 1), (15, 2)],
  term ((-151317972860363025090370273254143207504 : Rat) / 199951576233746216094448921338256544665) [(13, 2), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 378 for generator 17. -/
theorem ep_Q2_024_partial_17_0378_valid :
    mulPoly ep_Q2_024_coefficient_17_0378
        ep_Q2_024_generator_17_0300_0387 =
      ep_Q2_024_partial_17_0378 := by
  native_decide

/-- Coefficient term 379 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0379 : Poly :=
[
  term ((4466115409796894554675042235934975650543774254263469936 : Rat) / 697499214099014863878580073127199423100509817435596035) [(13, 2), (15, 2)]
]

/-- Partial product 379 for generator 17. -/
def ep_Q2_024_partial_17_0379 : Poly :=
[
  term ((8932230819593789109350084471869951301087548508526939872 : Rat) / 697499214099014863878580073127199423100509817435596035) [(6, 1), (13, 2), (14, 1), (15, 2)],
  term ((8932230819593789109350084471869951301087548508526939872 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (13, 2), (15, 3)],
  term ((-4466115409796894554675042235934975650543774254263469936 : Rat) / 697499214099014863878580073127199423100509817435596035) [(13, 2), (14, 2), (15, 2)],
  term ((-4466115409796894554675042235934975650543774254263469936 : Rat) / 697499214099014863878580073127199423100509817435596035) [(13, 2), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 379 for generator 17. -/
theorem ep_Q2_024_partial_17_0379_valid :
    mulPoly ep_Q2_024_coefficient_17_0379
        ep_Q2_024_generator_17_0300_0387 =
      ep_Q2_024_partial_17_0379 := by
  native_decide

/-- Coefficient term 380 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0380 : Poly :=
[
  term ((-898255108859200 : Rat) / 1162780221153193) [(13, 2), (15, 2), (16, 1)]
]

/-- Partial product 380 for generator 17. -/
def ep_Q2_024_partial_17_0380 : Poly :=
[
  term ((-1796510217718400 : Rat) / 1162780221153193) [(6, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-1796510217718400 : Rat) / 1162780221153193) [(7, 1), (13, 2), (15, 3), (16, 1)],
  term ((898255108859200 : Rat) / 1162780221153193) [(13, 2), (14, 2), (15, 2), (16, 1)],
  term ((898255108859200 : Rat) / 1162780221153193) [(13, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 380 for generator 17. -/
theorem ep_Q2_024_partial_17_0380_valid :
    mulPoly ep_Q2_024_coefficient_17_0380
        ep_Q2_024_generator_17_0300_0387 =
      ep_Q2_024_partial_17_0380 := by
  native_decide

/-- Coefficient term 381 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0381 : Poly :=
[
  term ((46606006548196236713541705654221512448 : Rat) / 599854728701238648283346764014769633995) [(13, 3), (15, 1)]
]

/-- Partial product 381 for generator 17. -/
def ep_Q2_024_partial_17_0381 : Poly :=
[
  term ((93212013096392473427083411308443024896 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (13, 3), (14, 1), (15, 1)],
  term ((93212013096392473427083411308443024896 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (13, 3), (15, 2)],
  term ((-46606006548196236713541705654221512448 : Rat) / 599854728701238648283346764014769633995) [(13, 3), (14, 2), (15, 1)],
  term ((-46606006548196236713541705654221512448 : Rat) / 599854728701238648283346764014769633995) [(13, 3), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 381 for generator 17. -/
theorem ep_Q2_024_partial_17_0381_valid :
    mulPoly ep_Q2_024_coefficient_17_0381
        ep_Q2_024_generator_17_0300_0387 =
      ep_Q2_024_partial_17_0381 := by
  native_decide

/-- Coefficient term 382 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0382 : Poly :=
[
  term ((-3577111490160321821674806970093662780341 : Rat) / 3599128372207431889700080584088617803970) [(14, 1)]
]

/-- Partial product 382 for generator 17. -/
def ep_Q2_024_partial_17_0382 : Poly :=
[
  term ((-3577111490160321821674806970093662780341 : Rat) / 1799564186103715944850040292044308901985) [(6, 1), (14, 2)],
  term ((-3577111490160321821674806970093662780341 : Rat) / 1799564186103715944850040292044308901985) [(7, 1), (14, 1), (15, 1)],
  term ((3577111490160321821674806970093662780341 : Rat) / 3599128372207431889700080584088617803970) [(14, 1), (15, 2)],
  term ((3577111490160321821674806970093662780341 : Rat) / 3599128372207431889700080584088617803970) [(14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 382 for generator 17. -/
theorem ep_Q2_024_partial_17_0382_valid :
    mulPoly ep_Q2_024_coefficient_17_0382
        ep_Q2_024_generator_17_0300_0387 =
      ep_Q2_024_partial_17_0382 := by
  native_decide

/-- Coefficient term 383 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0383 : Poly :=
[
  term ((-7967277282016241738385056278657778161612371326959150132 : Rat) / 697499214099014863878580073127199423100509817435596035) [(14, 1), (15, 2)]
]

/-- Partial product 383 for generator 17. -/
def ep_Q2_024_partial_17_0383 : Poly :=
[
  term ((-15934554564032483476770112557315556323224742653918300264 : Rat) / 697499214099014863878580073127199423100509817435596035) [(6, 1), (14, 2), (15, 2)],
  term ((-15934554564032483476770112557315556323224742653918300264 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (14, 1), (15, 3)],
  term ((7967277282016241738385056278657778161612371326959150132 : Rat) / 697499214099014863878580073127199423100509817435596035) [(14, 1), (15, 4)],
  term ((7967277282016241738385056278657778161612371326959150132 : Rat) / 697499214099014863878580073127199423100509817435596035) [(14, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 383 for generator 17. -/
theorem ep_Q2_024_partial_17_0383_valid :
    mulPoly ep_Q2_024_coefficient_17_0383
        ep_Q2_024_generator_17_0300_0387 =
      ep_Q2_024_partial_17_0383 := by
  native_decide

/-- Coefficient term 384 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0384 : Poly :=
[
  term ((1425956555474960 : Rat) / 1162780221153193) [(14, 1), (15, 2), (16, 1)]
]

/-- Partial product 384 for generator 17. -/
def ep_Q2_024_partial_17_0384 : Poly :=
[
  term ((2851913110949920 : Rat) / 1162780221153193) [(6, 1), (14, 2), (15, 2), (16, 1)],
  term ((2851913110949920 : Rat) / 1162780221153193) [(7, 1), (14, 1), (15, 3), (16, 1)],
  term ((-1425956555474960 : Rat) / 1162780221153193) [(14, 1), (15, 4), (16, 1)],
  term ((-1425956555474960 : Rat) / 1162780221153193) [(14, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 384 for generator 17. -/
theorem ep_Q2_024_partial_17_0384_valid :
    mulPoly ep_Q2_024_coefficient_17_0384
        ep_Q2_024_generator_17_0300_0387 =
      ep_Q2_024_partial_17_0384 := by
  native_decide

/-- Coefficient term 385 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0385 : Poly :=
[
  term ((-8921151527862041881559355605928391576 : Rat) / 199951576233746216094448921338256544665) [(14, 2)]
]

/-- Partial product 385 for generator 17. -/
def ep_Q2_024_partial_17_0385 : Poly :=
[
  term ((-17842303055724083763118711211856783152 : Rat) / 199951576233746216094448921338256544665) [(6, 1), (14, 3)],
  term ((-17842303055724083763118711211856783152 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (14, 2), (15, 1)],
  term ((8921151527862041881559355605928391576 : Rat) / 199951576233746216094448921338256544665) [(14, 2), (15, 2)],
  term ((8921151527862041881559355605928391576 : Rat) / 199951576233746216094448921338256544665) [(14, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 385 for generator 17. -/
theorem ep_Q2_024_partial_17_0385_valid :
    mulPoly ep_Q2_024_coefficient_17_0385
        ep_Q2_024_generator_17_0300_0387 =
      ep_Q2_024_partial_17_0385 := by
  native_decide

/-- Coefficient term 386 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0386 : Poly :=
[
  term ((60960581363215442445716423680062301386360299798519214209 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(15, 2)]
]

/-- Partial product 386 for generator 17. -/
def ep_Q2_024_partial_17_0386 : Poly :=
[
  term ((60960581363215442445716423680062301386360299798519214209 : Rat) / 697499214099014863878580073127199423100509817435596035) [(6, 1), (14, 1), (15, 2)],
  term ((60960581363215442445716423680062301386360299798519214209 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (15, 3)],
  term ((-60960581363215442445716423680062301386360299798519214209 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(14, 2), (15, 2)],
  term ((-60960581363215442445716423680062301386360299798519214209 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 386 for generator 17. -/
theorem ep_Q2_024_partial_17_0386_valid :
    mulPoly ep_Q2_024_coefficient_17_0386
        ep_Q2_024_generator_17_0300_0387 =
      ep_Q2_024_partial_17_0386 := by
  native_decide

/-- Coefficient term 387 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0387 : Poly :=
[
  term ((-2004829471725978 : Rat) / 1162780221153193) [(15, 2), (16, 1)]
]

/-- Partial product 387 for generator 17. -/
def ep_Q2_024_partial_17_0387 : Poly :=
[
  term ((-4009658943451956 : Rat) / 1162780221153193) [(6, 1), (14, 1), (15, 2), (16, 1)],
  term ((-4009658943451956 : Rat) / 1162780221153193) [(7, 1), (15, 3), (16, 1)],
  term ((2004829471725978 : Rat) / 1162780221153193) [(14, 2), (15, 2), (16, 1)],
  term ((2004829471725978 : Rat) / 1162780221153193) [(15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 387 for generator 17. -/
theorem ep_Q2_024_partial_17_0387_valid :
    mulPoly ep_Q2_024_coefficient_17_0387
        ep_Q2_024_generator_17_0300_0387 =
      ep_Q2_024_partial_17_0387 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_024_partials_17_0300_0387 : List Poly :=
[
  ep_Q2_024_partial_17_0300,
  ep_Q2_024_partial_17_0301,
  ep_Q2_024_partial_17_0302,
  ep_Q2_024_partial_17_0303,
  ep_Q2_024_partial_17_0304,
  ep_Q2_024_partial_17_0305,
  ep_Q2_024_partial_17_0306,
  ep_Q2_024_partial_17_0307,
  ep_Q2_024_partial_17_0308,
  ep_Q2_024_partial_17_0309,
  ep_Q2_024_partial_17_0310,
  ep_Q2_024_partial_17_0311,
  ep_Q2_024_partial_17_0312,
  ep_Q2_024_partial_17_0313,
  ep_Q2_024_partial_17_0314,
  ep_Q2_024_partial_17_0315,
  ep_Q2_024_partial_17_0316,
  ep_Q2_024_partial_17_0317,
  ep_Q2_024_partial_17_0318,
  ep_Q2_024_partial_17_0319,
  ep_Q2_024_partial_17_0320,
  ep_Q2_024_partial_17_0321,
  ep_Q2_024_partial_17_0322,
  ep_Q2_024_partial_17_0323,
  ep_Q2_024_partial_17_0324,
  ep_Q2_024_partial_17_0325,
  ep_Q2_024_partial_17_0326,
  ep_Q2_024_partial_17_0327,
  ep_Q2_024_partial_17_0328,
  ep_Q2_024_partial_17_0329,
  ep_Q2_024_partial_17_0330,
  ep_Q2_024_partial_17_0331,
  ep_Q2_024_partial_17_0332,
  ep_Q2_024_partial_17_0333,
  ep_Q2_024_partial_17_0334,
  ep_Q2_024_partial_17_0335,
  ep_Q2_024_partial_17_0336,
  ep_Q2_024_partial_17_0337,
  ep_Q2_024_partial_17_0338,
  ep_Q2_024_partial_17_0339,
  ep_Q2_024_partial_17_0340,
  ep_Q2_024_partial_17_0341,
  ep_Q2_024_partial_17_0342,
  ep_Q2_024_partial_17_0343,
  ep_Q2_024_partial_17_0344,
  ep_Q2_024_partial_17_0345,
  ep_Q2_024_partial_17_0346,
  ep_Q2_024_partial_17_0347,
  ep_Q2_024_partial_17_0348,
  ep_Q2_024_partial_17_0349,
  ep_Q2_024_partial_17_0350,
  ep_Q2_024_partial_17_0351,
  ep_Q2_024_partial_17_0352,
  ep_Q2_024_partial_17_0353,
  ep_Q2_024_partial_17_0354,
  ep_Q2_024_partial_17_0355,
  ep_Q2_024_partial_17_0356,
  ep_Q2_024_partial_17_0357,
  ep_Q2_024_partial_17_0358,
  ep_Q2_024_partial_17_0359,
  ep_Q2_024_partial_17_0360,
  ep_Q2_024_partial_17_0361,
  ep_Q2_024_partial_17_0362,
  ep_Q2_024_partial_17_0363,
  ep_Q2_024_partial_17_0364,
  ep_Q2_024_partial_17_0365,
  ep_Q2_024_partial_17_0366,
  ep_Q2_024_partial_17_0367,
  ep_Q2_024_partial_17_0368,
  ep_Q2_024_partial_17_0369,
  ep_Q2_024_partial_17_0370,
  ep_Q2_024_partial_17_0371,
  ep_Q2_024_partial_17_0372,
  ep_Q2_024_partial_17_0373,
  ep_Q2_024_partial_17_0374,
  ep_Q2_024_partial_17_0375,
  ep_Q2_024_partial_17_0376,
  ep_Q2_024_partial_17_0377,
  ep_Q2_024_partial_17_0378,
  ep_Q2_024_partial_17_0379,
  ep_Q2_024_partial_17_0380,
  ep_Q2_024_partial_17_0381,
  ep_Q2_024_partial_17_0382,
  ep_Q2_024_partial_17_0383,
  ep_Q2_024_partial_17_0384,
  ep_Q2_024_partial_17_0385,
  ep_Q2_024_partial_17_0386,
  ep_Q2_024_partial_17_0387
]

/-- Sum of partial products in this block. -/
def ep_Q2_024_block_17_0300_0387 : Poly :=
[
  term ((-99588034536269143179180521288457931024 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (7, 1), (12, 2), (13, 1), (14, 1)],
  term ((183488243113488394739718246684116996552696960175428317 : Rat) / 46499947606600990925238671541813294873367321162373069) [(6, 1), (7, 1), (12, 2), (14, 1), (15, 1)],
  term ((-868923361052644 : Rat) / 1162780221153193) [(6, 1), (7, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-445341954847883562877780447109046624082 : Rat) / 199951576233746216094448921338256544665) [(6, 1), (7, 1), (13, 1), (14, 1)],
  term ((11054165036071785399365776736060685613928533689685750087 : Rat) / 92999895213201981850477343083626589746734642324746138) [(6, 1), (7, 1), (13, 1), (14, 1), (15, 2)],
  term ((-4227179677649766 : Rat) / 1162780221153193) [(6, 1), (7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1448624819642322543984093998473892658082 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (7, 1), (13, 1), (14, 2)],
  term ((-64058845371574692704468717594301588487936003313615869633 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(6, 1), (7, 1), (13, 2), (14, 1), (15, 1)],
  term ((363244002760710 : Rat) / 1162780221153193) [(6, 1), (7, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((48571238861349145578694374759784602712 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (7, 1), (13, 3), (14, 1)],
  term ((-61029920602251368849062270431084368506816499195006587438 : Rat) / 697499214099014863878580073127199423100509817435596035) [(6, 1), (7, 1), (14, 1), (15, 1)],
  term ((-12718621500502040 : Rat) / 1162780221153193) [(6, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-20105715729045145835299038207446350531698215964122869129 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(6, 1), (7, 1), (14, 2), (15, 1)],
  term ((-6478309259032554 : Rat) / 1162780221153193) [(6, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-7492910218429027295067685814067725028392 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (8, 1), (9, 1), (13, 1), (14, 1)],
  term ((6117088134986307917740122211961773302290741365461673651 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(6, 1), (8, 1), (9, 1), (14, 1), (15, 1)],
  term ((-1868935561931170 : Rat) / 1162780221153193) [(6, 1), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-31556266093234973165652571965850210528 : Rat) / 39990315246749243218889784267651308933) [(6, 1), (8, 1), (9, 2), (14, 1)],
  term ((4509825540096460287344218035091265557377562557592856533 : Rat) / 464999476066009909252386715418132948733673211623730690) [(6, 1), (8, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-2172308402631610 : Rat) / 1162780221153193) [(6, 1), (8, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-49794017268134571589590260644228965512 : Rat) / 119970945740247729656669352802953926799) [(6, 1), (8, 1), (12, 1), (13, 2), (14, 1)],
  term ((1096198305763581777353737679714258398438 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (8, 1), (12, 1), (14, 1)],
  term ((198745616475118943998092102782769635563595552220534688 : Rat) / 46499947606600990925238671541813294873367321162373069) [(6, 1), (8, 1), (12, 1), (14, 1), (15, 2)],
  term ((-1581632301823296 : Rat) / 1162780221153193) [(6, 1), (8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-130492265467479818581261539582642010331763093778606157543 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(6, 1), (8, 1), (13, 1), (14, 1), (15, 1)],
  term ((16821740938963879 : Rat) / 3488340663459579) [(6, 1), (8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-16624275738493849502791391640115128380164 : Rat) / 1799564186103715944850040292044308901985) [(6, 1), (8, 1), (13, 2), (14, 1)],
  term ((-4092230094817021750986965501211805014937 : Rat) / 1799564186103715944850040292044308901985) [(6, 1), (8, 1), (14, 1)],
  term ((-11054165036071785399365776736060685613928533689685750087 : Rat) / 185999790426403963700954686167253179493469284649492276) [(6, 1), (8, 1), (14, 1), (15, 2)],
  term ((2113589838824883 : Rat) / 1162780221153193) [(6, 1), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((582061027275376329967414115123588817349 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (8, 1), (14, 2)],
  term ((826347564150239326187536952436868474864 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (8, 2), (14, 1)],
  term ((-23099223310838660198031389972741580233212 : Rat) / 1799564186103715944850040292044308901985) [(6, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((662332441097927340990543969093751515032 : Rat) / 119970945740247729656669352802953926799) [(6, 1), (9, 1), (12, 1), (13, 1), (14, 2)],
  term ((-40349338820983608515319706186594819802787146706132782807 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(6, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-19249089666788537 : Rat) / 3488340663459579) [(6, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-60613189104109889150602519961253961272330567250720564943 : Rat) / 464999476066009909252386715418132948733673211623730690) [(6, 1), (9, 1), (12, 1), (14, 2), (15, 1)],
  term ((26961822669714766 : Rat) / 1162780221153193) [(6, 1), (9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-49794017268134571589590260644228965512 : Rat) / 119970945740247729656669352802953926799) [(6, 1), (9, 1), (12, 2), (13, 1), (14, 1)],
  term ((917441215567441973698591233420584982763484800877141585 : Rat) / 92999895213201981850477343083626589746734642324746138) [(6, 1), (9, 1), (12, 2), (14, 1), (15, 1)],
  term ((-2172308402631610 : Rat) / 1162780221153193) [(6, 1), (9, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-26018830749523948985941123489380145416 : Rat) / 39990315246749243218889784267651308933) [(6, 1), (9, 1), (13, 1), (14, 1)],
  term ((16595070928008810356472357884896690591472 : Rat) / 1799564186103715944850040292044308901985) [(6, 1), (9, 1), (13, 1), (14, 2)],
  term ((-8486750246624093521424296941571253888 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (9, 1), (13, 1), (14, 3)],
  term ((-165669431708403358095974673330882519416844293512596247303 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(6, 1), (9, 1), (14, 1), (15, 1)],
  term ((6178942586223279 : Rat) / 2325560442306386) [(6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((50694531120742589082227927120420509109701353756103658903 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(6, 1), (9, 1), (14, 2), (15, 1)],
  term ((91242845031671521 : Rat) / 3488340663459579) [(6, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-674456529895393409686477352003493571793009190155093372 : Rat) / 139499842819802972775716014625439884620101963487119207) [(6, 1), (9, 1), (14, 3), (15, 1)],
  term ((-1667935482081904 : Rat) / 1162780221153193) [(6, 1), (9, 1), (14, 3), (15, 1), (16, 1)],
  term ((-1513706159036843511919972502507355006040 : Rat) / 119970945740247729656669352802953926799) [(6, 1), (9, 2), (12, 1), (14, 1)],
  term ((833598095948274515765040523827690427496 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (9, 2), (14, 1)],
  term ((91127369684959552203310296578882260592 : Rat) / 3389009766673664679566930870139941435) [(6, 1), (9, 2), (14, 2)],
  term ((87483070406245862995382813691713434496 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((8088250242351929820163091804873870410062191739236192053 : Rat) / 697499214099014863878580073127199423100509817435596035) [(6, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((57972216906980 : Rat) / 1162780221153193) [(6, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4513431950580501210863727625781466730076 : Rat) / 1799564186103715944850040292044308901985) [(6, 1), (11, 1), (13, 1), (14, 1)],
  term ((146282415801435285058741788196157594914871161152352014199 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(6, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-3273237810801317 : Rat) / 1162780221153193) [(6, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1422526770560142681406634024494915095373669574068378424 : Rat) / 697499214099014863878580073127199423100509817435596035) [(6, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((-3888863819396960 : Rat) / 1162780221153193) [(6, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-158457132089122950485469631674471672828 : Rat) / 199951576233746216094448921338256544665) [(6, 1), (12, 1), (13, 2), (14, 1)],
  term ((-44741039465109071923402142474522467712 : Rat) / 119970945740247729656669352802953926799) [(6, 1), (12, 1), (13, 2), (14, 2)],
  term ((-2846789894707994951070586425528942248906 : Rat) / 1799564186103715944850040292044308901985) [(6, 1), (12, 1), (14, 1)],
  term ((-58402937808909823415415747455066287363114737333131056647 : Rat) / 929998952132019818504773430836265897467346423247461380) [(6, 1), (12, 1), (14, 1), (15, 2)],
  term ((4686632705057719 : Rat) / 1162780221153193) [(6, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((555297572691790204322736048305803642621 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (12, 1), (14, 2)],
  term ((-1415851499156342260220335849887420473419942563797517736 : Rat) / 232499738033004954626193357709066474366836605811865345) [(6, 1), (12, 2), (13, 1), (14, 1), (15, 1)],
  term ((-2538406922518624 : Rat) / 1162780221153193) [(6, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((197773517925461086681542750109224956096 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (12, 2), (13, 2), (14, 1)],
  term ((89950247204447483722066909092463307858 : Rat) / 199951576233746216094448921338256544665) [(6, 1), (12, 2), (14, 1)],
  term ((198745616475118943998092102782769635563595552220534688 : Rat) / 46499947606600990925238671541813294873367321162373069) [(6, 1), (12, 2), (14, 1), (15, 2)],
  term ((-1581632301823296 : Rat) / 1162780221153193) [(6, 1), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((11868288096862354702854848791393147597315845764302095669 : Rat) / 232499738033004954626193357709066474366836605811865345) [(6, 1), (13, 1), (14, 1), (15, 1)],
  term ((-2481525905577448 : Rat) / 1162780221153193) [(6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-45115300623382422580924426910039717272296550294439422837 : Rat) / 697499214099014863878580073127199423100509817435596035) [(6, 1), (13, 1), (14, 2), (15, 1)],
  term ((17582500911709340 : Rat) / 1162780221153193) [(6, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((814519498636400872808521848814321590812 : Rat) / 199951576233746216094448921338256544665) [(6, 1), (13, 2), (14, 1)],
  term ((8932230819593789109350084471869951301087548508526939872 : Rat) / 697499214099014863878580073127199423100509817435596035) [(6, 1), (13, 2), (14, 1), (15, 2)],
  term ((-1796510217718400 : Rat) / 1162780221153193) [(6, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((302635945720726050180740546508286415008 : Rat) / 199951576233746216094448921338256544665) [(6, 1), (13, 2), (14, 2)],
  term ((93212013096392473427083411308443024896 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (13, 3), (14, 1), (15, 1)],
  term ((60960581363215442445716423680062301386360299798519214209 : Rat) / 697499214099014863878580073127199423100509817435596035) [(6, 1), (14, 1), (15, 2)],
  term ((-4009658943451956 : Rat) / 1162780221153193) [(6, 1), (14, 1), (15, 2), (16, 1)],
  term ((-3577111490160321821674806970093662780341 : Rat) / 1799564186103715944850040292044308901985) [(6, 1), (14, 2)],
  term ((-15934554564032483476770112557315556323224742653918300264 : Rat) / 697499214099014863878580073127199423100509817435596035) [(6, 1), (14, 2), (15, 2)],
  term ((2851913110949920 : Rat) / 1162780221153193) [(6, 1), (14, 2), (15, 2), (16, 1)],
  term ((-17842303055724083763118711211856783152 : Rat) / 199951576233746216094448921338256544665) [(6, 1), (14, 3)],
  term ((-7492910218429027295067685814067725028392 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 1), (9, 1), (13, 1), (15, 1)],
  term ((6117088134986307917740122211961773302290741365461673651 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(7, 1), (8, 1), (9, 1), (15, 2)],
  term ((-1868935561931170 : Rat) / 1162780221153193) [(7, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((-31556266093234973165652571965850210528 : Rat) / 39990315246749243218889784267651308933) [(7, 1), (8, 1), (9, 2), (15, 1)],
  term ((4509825540096460287344218035091265557377562557592856533 : Rat) / 464999476066009909252386715418132948733673211623730690) [(7, 1), (8, 1), (12, 1), (13, 1), (15, 2)],
  term ((-2172308402631610 : Rat) / 1162780221153193) [(7, 1), (8, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-49794017268134571589590260644228965512 : Rat) / 119970945740247729656669352802953926799) [(7, 1), (8, 1), (12, 1), (13, 2), (15, 1)],
  term ((1096198305763581777353737679714258398438 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 1), (12, 1), (15, 1)],
  term ((198745616475118943998092102782769635563595552220534688 : Rat) / 46499947606600990925238671541813294873367321162373069) [(7, 1), (8, 1), (12, 1), (15, 3)],
  term ((-1581632301823296 : Rat) / 1162780221153193) [(7, 1), (8, 1), (12, 1), (15, 3), (16, 1)],
  term ((-130492265467479818581261539582642010331763093778606157543 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(7, 1), (8, 1), (13, 1), (15, 2)],
  term ((16821740938963879 : Rat) / 3488340663459579) [(7, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((-16624275738493849502791391640115128380164 : Rat) / 1799564186103715944850040292044308901985) [(7, 1), (8, 1), (13, 2), (15, 1)],
  term ((582061027275376329967414115123588817349 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 1), (14, 1), (15, 1)],
  term ((-4092230094817021750986965501211805014937 : Rat) / 1799564186103715944850040292044308901985) [(7, 1), (8, 1), (15, 1)],
  term ((-11054165036071785399365776736060685613928533689685750087 : Rat) / 185999790426403963700954686167253179493469284649492276) [(7, 1), (8, 1), (15, 3)],
  term ((2113589838824883 : Rat) / 1162780221153193) [(7, 1), (8, 1), (15, 3), (16, 1)],
  term ((826347564150239326187536952436868474864 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 2), (15, 1)],
  term ((662332441097927340990543969093751515032 : Rat) / 119970945740247729656669352802953926799) [(7, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-23099223310838660198031389972741580233212 : Rat) / 1799564186103715944850040292044308901985) [(7, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((-60613189104109889150602519961253961272330567250720564943 : Rat) / 464999476066009909252386715418132948733673211623730690) [(7, 1), (9, 1), (12, 1), (14, 1), (15, 2)],
  term ((26961822669714766 : Rat) / 1162780221153193) [(7, 1), (9, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-40349338820983608515319706186594819802787146706132782807 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(7, 1), (9, 1), (12, 1), (15, 2)],
  term ((-19249089666788537 : Rat) / 3488340663459579) [(7, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-49794017268134571589590260644228965512 : Rat) / 119970945740247729656669352802953926799) [(7, 1), (9, 1), (12, 2), (13, 1), (15, 1)],
  term ((917441215567441973698591233420584982763484800877141585 : Rat) / 92999895213201981850477343083626589746734642324746138) [(7, 1), (9, 1), (12, 2), (15, 2)],
  term ((-2172308402631610 : Rat) / 1162780221153193) [(7, 1), (9, 1), (12, 2), (15, 2), (16, 1)],
  term ((16595070928008810356472357884896690591472 : Rat) / 1799564186103715944850040292044308901985) [(7, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((-8486750246624093521424296941571253888 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (9, 1), (13, 1), (14, 2), (15, 1)],
  term ((-26018830749523948985941123489380145416 : Rat) / 39990315246749243218889784267651308933) [(7, 1), (9, 1), (13, 1), (15, 1)],
  term ((50694531120742589082227927120420509109701353756103658903 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(7, 1), (9, 1), (14, 1), (15, 2)],
  term ((91242845031671521 : Rat) / 3488340663459579) [(7, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-674456529895393409686477352003493571793009190155093372 : Rat) / 139499842819802972775716014625439884620101963487119207) [(7, 1), (9, 1), (14, 2), (15, 2)],
  term ((-1667935482081904 : Rat) / 1162780221153193) [(7, 1), (9, 1), (14, 2), (15, 2), (16, 1)],
  term ((-165669431708403358095974673330882519416844293512596247303 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(7, 1), (9, 1), (15, 2)],
  term ((6178942586223279 : Rat) / 2325560442306386) [(7, 1), (9, 1), (15, 2), (16, 1)],
  term ((-1513706159036843511919972502507355006040 : Rat) / 119970945740247729656669352802953926799) [(7, 1), (9, 2), (12, 1), (15, 1)],
  term ((91127369684959552203310296578882260592 : Rat) / 3389009766673664679566930870139941435) [(7, 1), (9, 2), (14, 1), (15, 1)],
  term ((833598095948274515765040523827690427496 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (9, 2), (15, 1)],
  term ((87483070406245862995382813691713434496 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((8088250242351929820163091804873870410062191739236192053 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (11, 1), (12, 1), (15, 2)],
  term ((57972216906980 : Rat) / 1162780221153193) [(7, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-4513431950580501210863727625781466730076 : Rat) / 1799564186103715944850040292044308901985) [(7, 1), (11, 1), (13, 1), (15, 1)],
  term ((-1422526770560142681406634024494915095373669574068378424 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((-3888863819396960 : Rat) / 1162780221153193) [(7, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((146282415801435285058741788196157594914871161152352014199 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(7, 1), (12, 1), (13, 1), (15, 2)],
  term ((-3273237810801317 : Rat) / 1162780221153193) [(7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-44741039465109071923402142474522467712 : Rat) / 119970945740247729656669352802953926799) [(7, 1), (12, 1), (13, 2), (14, 1), (15, 1)],
  term ((-158457132089122950485469631674471672828 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (12, 1), (13, 2), (15, 1)],
  term ((555297572691790204322736048305803642621 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (12, 1), (14, 1), (15, 1)],
  term ((-2846789894707994951070586425528942248906 : Rat) / 1799564186103715944850040292044308901985) [(7, 1), (12, 1), (15, 1)],
  term ((-58402937808909823415415747455066287363114737333131056647 : Rat) / 929998952132019818504773430836265897467346423247461380) [(7, 1), (12, 1), (15, 3)],
  term ((4686632705057719 : Rat) / 1162780221153193) [(7, 1), (12, 1), (15, 3), (16, 1)],
  term ((49794017268134571589590260644228965512 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (12, 2), (13, 1), (14, 2)],
  term ((-4189654999057879352362966125665393160568311585326873392 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (12, 2), (13, 1), (15, 2)],
  term ((-2538406922518624 : Rat) / 1162780221153193) [(7, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((197773517925461086681542750109224956096 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (12, 2), (13, 2), (15, 1)],
  term ((-183488243113488394739718246684116996552696960175428317 : Rat) / 92999895213201981850477343083626589746734642324746138) [(7, 1), (12, 2), (14, 2), (15, 1)],
  term ((434461680526322 : Rat) / 1162780221153193) [(7, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((89950247204447483722066909092463307858 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (12, 2), (15, 1)],
  term ((214002989836749493256465958881422274574494144265641059 : Rat) / 92999895213201981850477343083626589746734642324746138) [(7, 1), (12, 2), (15, 3)],
  term ((-1147170621296974 : Rat) / 1162780221153193) [(7, 1), (12, 2), (15, 3), (16, 1)],
  term ((-44273084479306570515603140231284316332495012077393644924 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (13, 1), (14, 1), (15, 2)],
  term ((17582500911709340 : Rat) / 1162780221153193) [(7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((222670977423941781438890223554523312041 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (13, 1), (14, 2)],
  term ((-11054165036071785399365776736060685613928533689685750087 : Rat) / 185999790426403963700954686167253179493469284649492276) [(7, 1), (13, 1), (14, 2), (15, 2)],
  term ((2113589838824883 : Rat) / 1162780221153193) [(7, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((724312409821161271992046999236946329041 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (13, 1), (14, 3)],
  term ((12127205505235763373212001176856583529657519795104592582 : Rat) / 232499738033004954626193357709066474366836605811865345) [(7, 1), (13, 1), (15, 2)],
  term ((-2481525905577448 : Rat) / 1162780221153193) [(7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-11054165036071785399365776736060685613928533689685750087 : Rat) / 185999790426403963700954686167253179493469284649492276) [(7, 1), (13, 1), (15, 4)],
  term ((2113589838824883 : Rat) / 1162780221153193) [(7, 1), (13, 1), (15, 4), (16, 1)],
  term ((302635945720726050180740546508286415008 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (13, 2), (14, 1), (15, 1)],
  term ((64058845371574692704468717594301588487936003313615869633 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(7, 1), (13, 2), (14, 2), (15, 1)],
  term ((-181622001380355 : Rat) / 1162780221153193) [(7, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((814519498636400872808521848814321590812 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (13, 2), (15, 1)],
  term ((33262589549983283047289685160593797897428732449241209707 : Rat) / 929998952132019818504773430836265897467346423247461380) [(7, 1), (13, 2), (15, 3)],
  term ((-1978132219098755 : Rat) / 1162780221153193) [(7, 1), (13, 2), (15, 3), (16, 1)],
  term ((-24285619430674572789347187379892301356 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (13, 3), (14, 2)],
  term ((13785278733143580127547244785710144708 : Rat) / 119970945740247729656669352802953926799) [(7, 1), (13, 3), (15, 2)],
  term ((-3577111490160321821674806970093662780341 : Rat) / 1799564186103715944850040292044308901985) [(7, 1), (14, 1), (15, 1)],
  term ((-43632502527084788071781412021815874761200754651550331927 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(7, 1), (14, 1), (15, 3)],
  term ((6091067740466197 : Rat) / 1162780221153193) [(7, 1), (14, 1), (15, 3), (16, 1)],
  term ((30452720269846633000435783536833939894826720759183080711 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (14, 2), (15, 1)],
  term ((6359310750251020 : Rat) / 1162780221153193) [(7, 1), (14, 2), (15, 1), (16, 1)],
  term ((20105715729045145835299038207446350531698215964122869129 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(7, 1), (14, 3), (15, 1)],
  term ((3239154629516277 : Rat) / 1162780221153193) [(7, 1), (14, 3), (15, 1), (16, 1)],
  term ((91475541664341126870247558895604485639768549396022507928 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (15, 3)],
  term ((2349651806799064 : Rat) / 1162780221153193) [(7, 1), (15, 3), (16, 1)],
  term ((-99588034536269143179180521288457931024 : Rat) / 599854728701238648283346764014769633995) [(7, 2), (12, 2), (13, 1), (15, 1)],
  term ((183488243113488394739718246684116996552696960175428317 : Rat) / 46499947606600990925238671541813294873367321162373069) [(7, 2), (12, 2), (15, 2)],
  term ((-868923361052644 : Rat) / 1162780221153193) [(7, 2), (12, 2), (15, 2), (16, 1)],
  term ((-1448624819642322543984093998473892658082 : Rat) / 599854728701238648283346764014769633995) [(7, 2), (13, 1), (14, 1), (15, 1)],
  term ((-445341954847883562877780447109046624082 : Rat) / 199951576233746216094448921338256544665) [(7, 2), (13, 1), (15, 1)],
  term ((11054165036071785399365776736060685613928533689685750087 : Rat) / 92999895213201981850477343083626589746734642324746138) [(7, 2), (13, 1), (15, 3)],
  term ((-4227179677649766 : Rat) / 1162780221153193) [(7, 2), (13, 1), (15, 3), (16, 1)],
  term ((-64058845371574692704468717594301588487936003313615869633 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(7, 2), (13, 2), (15, 2)],
  term ((363244002760710 : Rat) / 1162780221153193) [(7, 2), (13, 2), (15, 2), (16, 1)],
  term ((48571238861349145578694374759784602712 : Rat) / 599854728701238648283346764014769633995) [(7, 2), (13, 3), (15, 1)],
  term ((-20105715729045145835299038207446350531698215964122869129 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(7, 2), (14, 1), (15, 2)],
  term ((-6478309259032554 : Rat) / 1162780221153193) [(7, 2), (14, 1), (15, 2), (16, 1)],
  term ((-61029920602251368849062270431084368506816499195006587438 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 2), (15, 2)],
  term ((-12718621500502040 : Rat) / 1162780221153193) [(7, 2), (15, 2), (16, 1)],
  term ((3746455109214513647533842907033862514196 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (9, 1), (13, 1), (14, 2)],
  term ((3746455109214513647533842907033862514196 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (9, 1), (13, 1), (15, 2)],
  term ((-6117088134986307917740122211961773302290741365461673651 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(8, 1), (9, 1), (14, 2), (15, 1)],
  term ((934467780965585 : Rat) / 1162780221153193) [(8, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-6117088134986307917740122211961773302290741365461673651 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(8, 1), (9, 1), (15, 3)],
  term ((934467780965585 : Rat) / 1162780221153193) [(8, 1), (9, 1), (15, 3), (16, 1)],
  term ((15778133046617486582826285982925105264 : Rat) / 39990315246749243218889784267651308933) [(8, 1), (9, 2), (14, 2)],
  term ((15778133046617486582826285982925105264 : Rat) / 39990315246749243218889784267651308933) [(8, 1), (9, 2), (15, 2)],
  term ((-4509825540096460287344218035091265557377562557592856533 : Rat) / 929998952132019818504773430836265897467346423247461380) [(8, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((1086154201315805 : Rat) / 1162780221153193) [(8, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-4509825540096460287344218035091265557377562557592856533 : Rat) / 929998952132019818504773430836265897467346423247461380) [(8, 1), (12, 1), (13, 1), (15, 3)],
  term ((1086154201315805 : Rat) / 1162780221153193) [(8, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((24897008634067285794795130322114482756 : Rat) / 119970945740247729656669352802953926799) [(8, 1), (12, 1), (13, 2), (14, 2)],
  term ((24897008634067285794795130322114482756 : Rat) / 119970945740247729656669352802953926799) [(8, 1), (12, 1), (13, 2), (15, 2)],
  term ((-548099152881790888676868839857129199219 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (12, 1), (14, 2)],
  term ((-99372808237559471999046051391384817781797776110267344 : Rat) / 46499947606600990925238671541813294873367321162373069) [(8, 1), (12, 1), (14, 2), (15, 2)],
  term ((790816150911648 : Rat) / 1162780221153193) [(8, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((-548099152881790888676868839857129199219 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (12, 1), (15, 2)],
  term ((-99372808237559471999046051391384817781797776110267344 : Rat) / 46499947606600990925238671541813294873367321162373069) [(8, 1), (12, 1), (15, 4)],
  term ((790816150911648 : Rat) / 1162780221153193) [(8, 1), (12, 1), (15, 4), (16, 1)],
  term ((130492265467479818581261539582642010331763093778606157543 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(8, 1), (13, 1), (14, 2), (15, 1)],
  term ((-16821740938963879 : Rat) / 6976681326919158) [(8, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((130492265467479818581261539582642010331763093778606157543 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(8, 1), (13, 1), (15, 3)],
  term ((-16821740938963879 : Rat) / 6976681326919158) [(8, 1), (13, 1), (15, 3), (16, 1)],
  term ((8312137869246924751395695820057564190082 : Rat) / 1799564186103715944850040292044308901985) [(8, 1), (13, 2), (14, 2)],
  term ((8312137869246924751395695820057564190082 : Rat) / 1799564186103715944850040292044308901985) [(8, 1), (13, 2), (15, 2)],
  term ((-582061027275376329967414115123588817349 : Rat) / 1199709457402477296566693528029539267990) [(8, 1), (14, 1), (15, 2)],
  term ((4092230094817021750986965501211805014937 : Rat) / 3599128372207431889700080584088617803970) [(8, 1), (14, 2)],
  term ((11054165036071785399365776736060685613928533689685750087 : Rat) / 371999580852807927401909372334506358986938569298984552) [(8, 1), (14, 2), (15, 2)],
  term ((-2113589838824883 : Rat) / 2325560442306386) [(8, 1), (14, 2), (15, 2), (16, 1)],
  term ((-582061027275376329967414115123588817349 : Rat) / 1199709457402477296566693528029539267990) [(8, 1), (14, 3)],
  term ((4092230094817021750986965501211805014937 : Rat) / 3599128372207431889700080584088617803970) [(8, 1), (15, 2)],
  term ((11054165036071785399365776736060685613928533689685750087 : Rat) / 371999580852807927401909372334506358986938569298984552) [(8, 1), (15, 4)],
  term ((-2113589838824883 : Rat) / 2325560442306386) [(8, 1), (15, 4), (16, 1)],
  term ((-413173782075119663093768476218434237432 : Rat) / 599854728701238648283346764014769633995) [(8, 2), (14, 2)],
  term ((-413173782075119663093768476218434237432 : Rat) / 599854728701238648283346764014769633995) [(8, 2), (15, 2)],
  term ((-331166220548963670495271984546875757516 : Rat) / 119970945740247729656669352802953926799) [(9, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((11549611655419330099015694986370790116606 : Rat) / 1799564186103715944850040292044308901985) [(9, 1), (12, 1), (13, 1), (14, 2)],
  term ((-331166220548963670495271984546875757516 : Rat) / 119970945740247729656669352802953926799) [(9, 1), (12, 1), (13, 1), (14, 3)],
  term ((11549611655419330099015694986370790116606 : Rat) / 1799564186103715944850040292044308901985) [(9, 1), (12, 1), (13, 1), (15, 2)],
  term ((60613189104109889150602519961253961272330567250720564943 : Rat) / 929998952132019818504773430836265897467346423247461380) [(9, 1), (12, 1), (14, 1), (15, 3)],
  term ((-13480911334857383 : Rat) / 1162780221153193) [(9, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((40349338820983608515319706186594819802787146706132782807 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(9, 1), (12, 1), (14, 2), (15, 1)],
  term ((19249089666788537 : Rat) / 6976681326919158) [(9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((60613189104109889150602519961253961272330567250720564943 : Rat) / 929998952132019818504773430836265897467346423247461380) [(9, 1), (12, 1), (14, 3), (15, 1)],
  term ((-13480911334857383 : Rat) / 1162780221153193) [(9, 1), (12, 1), (14, 3), (15, 1), (16, 1)],
  term ((40349338820983608515319706186594819802787146706132782807 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(9, 1), (12, 1), (15, 3)],
  term ((19249089666788537 : Rat) / 6976681326919158) [(9, 1), (12, 1), (15, 3), (16, 1)],
  term ((24897008634067285794795130322114482756 : Rat) / 119970945740247729656669352802953926799) [(9, 1), (12, 2), (13, 1), (14, 2)],
  term ((24897008634067285794795130322114482756 : Rat) / 119970945740247729656669352802953926799) [(9, 1), (12, 2), (13, 1), (15, 2)],
  term ((-917441215567441973698591233420584982763484800877141585 : Rat) / 185999790426403963700954686167253179493469284649492276) [(9, 1), (12, 2), (14, 2), (15, 1)],
  term ((1086154201315805 : Rat) / 1162780221153193) [(9, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((-917441215567441973698591233420584982763484800877141585 : Rat) / 185999790426403963700954686167253179493469284649492276) [(9, 1), (12, 2), (15, 3)],
  term ((1086154201315805 : Rat) / 1162780221153193) [(9, 1), (12, 2), (15, 3), (16, 1)],
  term ((-8297535464004405178236178942448345295736 : Rat) / 1799564186103715944850040292044308901985) [(9, 1), (13, 1), (14, 1), (15, 2)],
  term ((13009415374761974492970561744690072708 : Rat) / 39990315246749243218889784267651308933) [(9, 1), (13, 1), (14, 2)],
  term ((4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (13, 1), (14, 2), (15, 2)],
  term ((-8297535464004405178236178942448345295736 : Rat) / 1799564186103715944850040292044308901985) [(9, 1), (13, 1), (14, 3)],
  term ((4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (13, 1), (14, 4)],
  term ((13009415374761974492970561744690072708 : Rat) / 39990315246749243218889784267651308933) [(9, 1), (13, 1), (15, 2)],
  term ((-50694531120742589082227927120420509109701353756103658903 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(9, 1), (14, 1), (15, 3)],
  term ((-91242845031671521 : Rat) / 6976681326919158) [(9, 1), (14, 1), (15, 3), (16, 1)],
  term ((165669431708403358095974673330882519416844293512596247303 : Rat) / 3719995808528079274019093723345063589869385692989845520) [(9, 1), (14, 2), (15, 1)],
  term ((-6178942586223279 : Rat) / 4651120884612772) [(9, 1), (14, 2), (15, 1), (16, 1)],
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(9, 1), (14, 2), (15, 3)],
  term ((833967741040952 : Rat) / 1162780221153193) [(9, 1), (14, 2), (15, 3), (16, 1)],
  term ((-50694531120742589082227927120420509109701353756103658903 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(9, 1), (14, 3), (15, 1)],
  term ((-91242845031671521 : Rat) / 6976681326919158) [(9, 1), (14, 3), (15, 1), (16, 1)],
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(9, 1), (14, 4), (15, 1)],
  term ((833967741040952 : Rat) / 1162780221153193) [(9, 1), (14, 4), (15, 1), (16, 1)],
  term ((165669431708403358095974673330882519416844293512596247303 : Rat) / 3719995808528079274019093723345063589869385692989845520) [(9, 1), (15, 3)],
  term ((-6178942586223279 : Rat) / 4651120884612772) [(9, 1), (15, 3), (16, 1)],
  term ((756853079518421755959986251253677503020 : Rat) / 119970945740247729656669352802953926799) [(9, 2), (12, 1), (14, 2)],
  term ((756853079518421755959986251253677503020 : Rat) / 119970945740247729656669352802953926799) [(9, 2), (12, 1), (15, 2)],
  term ((-45563684842479776101655148289441130296 : Rat) / 3389009766673664679566930870139941435) [(9, 2), (14, 1), (15, 2)],
  term ((-416799047974137257882520261913845213748 : Rat) / 599854728701238648283346764014769633995) [(9, 2), (14, 2)],
  term ((-45563684842479776101655148289441130296 : Rat) / 3389009766673664679566930870139941435) [(9, 2), (14, 3)],
  term ((-416799047974137257882520261913845213748 : Rat) / 599854728701238648283346764014769633995) [(9, 2), (15, 2)],
  term ((-43741535203122931497691406845856717248 : Rat) / 599854728701238648283346764014769633995) [(11, 1), (12, 1), (13, 1), (14, 2)],
  term ((-43741535203122931497691406845856717248 : Rat) / 599854728701238648283346764014769633995) [(11, 1), (12, 1), (13, 1), (15, 2)],
  term ((-8088250242351929820163091804873870410062191739236192053 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(11, 1), (12, 1), (14, 2), (15, 1)],
  term ((-28986108453490 : Rat) / 1162780221153193) [(11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-8088250242351929820163091804873870410062191739236192053 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(11, 1), (12, 1), (15, 3)],
  term ((-28986108453490 : Rat) / 1162780221153193) [(11, 1), (12, 1), (15, 3), (16, 1)],
  term ((2256715975290250605431863812890733365038 : Rat) / 1799564186103715944850040292044308901985) [(11, 1), (13, 1), (14, 2)],
  term ((2256715975290250605431863812890733365038 : Rat) / 1799564186103715944850040292044308901985) [(11, 1), (13, 1), (15, 2)],
  term ((711263385280071340703317012247457547686834787034189212 : Rat) / 697499214099014863878580073127199423100509817435596035) [(12, 1), (13, 1), (14, 1), (15, 3)],
  term ((1944431909698480 : Rat) / 1162780221153193) [(12, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-146282415801435285058741788196157594914871161152352014199 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(12, 1), (13, 1), (14, 2), (15, 1)],
  term ((3273237810801317 : Rat) / 2325560442306386) [(12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((711263385280071340703317012247457547686834787034189212 : Rat) / 697499214099014863878580073127199423100509817435596035) [(12, 1), (13, 1), (14, 3), (15, 1)],
  term ((1944431909698480 : Rat) / 1162780221153193) [(12, 1), (13, 1), (14, 3), (15, 1), (16, 1)],
  term ((-146282415801435285058741788196157594914871161152352014199 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(12, 1), (13, 1), (15, 3)],
  term ((3273237810801317 : Rat) / 2325560442306386) [(12, 1), (13, 1), (15, 3), (16, 1)],
  term ((22370519732554535961701071237261233856 : Rat) / 119970945740247729656669352802953926799) [(12, 1), (13, 2), (14, 1), (15, 2)],
  term ((79228566044561475242734815837235836414 : Rat) / 199951576233746216094448921338256544665) [(12, 1), (13, 2), (14, 2)],
  term ((22370519732554535961701071237261233856 : Rat) / 119970945740247729656669352802953926799) [(12, 1), (13, 2), (14, 3)],
  term ((79228566044561475242734815837235836414 : Rat) / 199951576233746216094448921338256544665) [(12, 1), (13, 2), (15, 2)],
  term ((-555297572691790204322736048305803642621 : Rat) / 1199709457402477296566693528029539267990) [(12, 1), (14, 1), (15, 2)],
  term ((1423394947353997475535293212764471124453 : Rat) / 1799564186103715944850040292044308901985) [(12, 1), (14, 2)],
  term ((58402937808909823415415747455066287363114737333131056647 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(12, 1), (14, 2), (15, 2)],
  term ((-4686632705057719 : Rat) / 2325560442306386) [(12, 1), (14, 2), (15, 2), (16, 1)],
  term ((-555297572691790204322736048305803642621 : Rat) / 1199709457402477296566693528029539267990) [(12, 1), (14, 3)],
  term ((1423394947353997475535293212764471124453 : Rat) / 1799564186103715944850040292044308901985) [(12, 1), (15, 2)],
  term ((58402937808909823415415747455066287363114737333131056647 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(12, 1), (15, 4)],
  term ((-4686632705057719 : Rat) / 2325560442306386) [(12, 1), (15, 4), (16, 1)],
  term ((707925749578171130110167924943710236709971281898758868 : Rat) / 232499738033004954626193357709066474366836605811865345) [(12, 2), (13, 1), (14, 2), (15, 1)],
  term ((1269203461259312 : Rat) / 1162780221153193) [(12, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((707925749578171130110167924943710236709971281898758868 : Rat) / 232499738033004954626193357709066474366836605811865345) [(12, 2), (13, 1), (15, 3)],
  term ((1269203461259312 : Rat) / 1162780221153193) [(12, 2), (13, 1), (15, 3), (16, 1)],
  term ((-98886758962730543340771375054612478048 : Rat) / 599854728701238648283346764014769633995) [(12, 2), (13, 2), (14, 2)],
  term ((-98886758962730543340771375054612478048 : Rat) / 599854728701238648283346764014769633995) [(12, 2), (13, 2), (15, 2)],
  term ((-44975123602223741861033454546231653929 : Rat) / 199951576233746216094448921338256544665) [(12, 2), (14, 2)],
  term ((-99372808237559471999046051391384817781797776110267344 : Rat) / 46499947606600990925238671541813294873367321162373069) [(12, 2), (14, 2), (15, 2)],
  term ((790816150911648 : Rat) / 1162780221153193) [(12, 2), (14, 2), (15, 2), (16, 1)],
  term ((-44975123602223741861033454546231653929 : Rat) / 199951576233746216094448921338256544665) [(12, 2), (15, 2)],
  term ((-99372808237559471999046051391384817781797776110267344 : Rat) / 46499947606600990925238671541813294873367321162373069) [(12, 2), (15, 4)],
  term ((790816150911648 : Rat) / 1162780221153193) [(12, 2), (15, 4), (16, 1)],
  term ((45115300623382422580924426910039717272296550294439422837 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(13, 1), (14, 1), (15, 3)],
  term ((-8791250455854670 : Rat) / 1162780221153193) [(13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-11868288096862354702854848791393147597315845764302095669 : Rat) / 464999476066009909252386715418132948733673211623730690) [(13, 1), (14, 2), (15, 1)],
  term ((1240762952788724 : Rat) / 1162780221153193) [(13, 1), (14, 2), (15, 1), (16, 1)],
  term ((45115300623382422580924426910039717272296550294439422837 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(13, 1), (14, 3), (15, 1)],
  term ((-8791250455854670 : Rat) / 1162780221153193) [(13, 1), (14, 3), (15, 1), (16, 1)],
  term ((-11868288096862354702854848791393147597315845764302095669 : Rat) / 464999476066009909252386715418132948733673211623730690) [(13, 1), (15, 3)],
  term ((1240762952788724 : Rat) / 1162780221153193) [(13, 1), (15, 3), (16, 1)],
  term ((-151317972860363025090370273254143207504 : Rat) / 199951576233746216094448921338256544665) [(13, 2), (14, 1), (15, 2)],
  term ((-407259749318200436404260924407160795406 : Rat) / 199951576233746216094448921338256544665) [(13, 2), (14, 2)],
  term ((-4466115409796894554675042235934975650543774254263469936 : Rat) / 697499214099014863878580073127199423100509817435596035) [(13, 2), (14, 2), (15, 2)],
  term ((898255108859200 : Rat) / 1162780221153193) [(13, 2), (14, 2), (15, 2), (16, 1)],
  term ((-151317972860363025090370273254143207504 : Rat) / 199951576233746216094448921338256544665) [(13, 2), (14, 3)],
  term ((-407259749318200436404260924407160795406 : Rat) / 199951576233746216094448921338256544665) [(13, 2), (15, 2)],
  term ((-4466115409796894554675042235934975650543774254263469936 : Rat) / 697499214099014863878580073127199423100509817435596035) [(13, 2), (15, 4)],
  term ((898255108859200 : Rat) / 1162780221153193) [(13, 2), (15, 4), (16, 1)],
  term ((-46606006548196236713541705654221512448 : Rat) / 599854728701238648283346764014769633995) [(13, 3), (14, 2), (15, 1)],
  term ((-46606006548196236713541705654221512448 : Rat) / 599854728701238648283346764014769633995) [(13, 3), (15, 3)],
  term ((3577111490160321821674806970093662780341 : Rat) / 3599128372207431889700080584088617803970) [(14, 1), (15, 2)],
  term ((7967277282016241738385056278657778161612371326959150132 : Rat) / 697499214099014863878580073127199423100509817435596035) [(14, 1), (15, 4)],
  term ((-1425956555474960 : Rat) / 1162780221153193) [(14, 1), (15, 4), (16, 1)],
  term ((-60898341331936391021621072001354057027778770960199001201 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(14, 2), (15, 2)],
  term ((2004829471725978 : Rat) / 1162780221153193) [(14, 2), (15, 2), (16, 1)],
  term ((3577111490160321821674806970093662780341 : Rat) / 3599128372207431889700080584088617803970) [(14, 3)],
  term ((7967277282016241738385056278657778161612371326959150132 : Rat) / 697499214099014863878580073127199423100509817435596035) [(14, 3), (15, 2)],
  term ((-1425956555474960 : Rat) / 1162780221153193) [(14, 3), (15, 2), (16, 1)],
  term ((8921151527862041881559355605928391576 : Rat) / 199951576233746216094448921338256544665) [(14, 4)],
  term ((-60960581363215442445716423680062301386360299798519214209 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(15, 4)],
  term ((2004829471725978 : Rat) / 1162780221153193) [(15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 17, terms 300 through 387. -/
theorem ep_Q2_024_block_17_0300_0387_valid :
    checkProductSumEq ep_Q2_024_partials_17_0300_0387
      ep_Q2_024_block_17_0300_0387 = true := by
  native_decide

end EpQ2024TermShards

end Patterns

end EndpointCertificate

end Problem97
