/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_024, term block 21:300-399

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_024`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2024TermShards

/-- Generator polynomial 21 for endpoint certificate `ep_Q2_024`. -/
def ep_Q2_024_generator_21_0300_0399 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(10, 1)]
]

/-- Coefficient term 300 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0300 : Poly :=
[
  term ((1495148449544936 : Rat) / 1162780221153193) [(0, 1), (9, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 300 for generator 21. -/
def ep_Q2_024_partial_21_0300 : Poly :=
[
  term ((2990296899089872 : Rat) / 1162780221153193) [(0, 1), (9, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1495148449544936 : Rat) / 1162780221153193) [(0, 1), (9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 300 for generator 21. -/
theorem ep_Q2_024_partial_21_0300_valid :
    mulPoly ep_Q2_024_coefficient_21_0300
        ep_Q2_024_generator_21_0300_0399 =
      ep_Q2_024_partial_21_0300 := by
  native_decide

/-- Coefficient term 301 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0301 : Poly :=
[
  term ((1347259645677843743910631050906865660306 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 2), (12, 1)]
]

/-- Partial product 301 for generator 21. -/
def ep_Q2_024_partial_21_0301 : Poly :=
[
  term ((2694519291355687487821262101813731320612 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 2), (10, 1), (12, 1)],
  term ((-1347259645677843743910631050906865660306 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 301 for generator 21. -/
theorem ep_Q2_024_partial_21_0301_valid :
    mulPoly ep_Q2_024_coefficient_21_0301
        ep_Q2_024_generator_21_0300_0399 =
      ep_Q2_024_partial_21_0301 := by
  native_decide

/-- Coefficient term 302 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0302 : Poly :=
[
  term ((11091310340086889976887063337008120224 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (9, 2), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 302 for generator 21. -/
def ep_Q2_024_partial_21_0302 : Poly :=
[
  term ((22182620680173779953774126674016240448 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (9, 2), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-11091310340086889976887063337008120224 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (9, 2), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 302 for generator 21. -/
theorem ep_Q2_024_partial_21_0302_valid :
    mulPoly ep_Q2_024_coefficient_21_0302
        ep_Q2_024_generator_21_0300_0399 =
      ep_Q2_024_partial_21_0302 := by
  native_decide

/-- Coefficient term 303 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0303 : Poly :=
[
  term ((-198745616475118943998092102782769635563595552220534688 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (9, 2), (12, 1), (15, 2)]
]

/-- Partial product 303 for generator 21. -/
def ep_Q2_024_partial_21_0303 : Poly :=
[
  term ((-397491232950237887996184205565539271127191104441069376 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (9, 2), (10, 1), (12, 1), (15, 2)],
  term ((198745616475118943998092102782769635563595552220534688 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (9, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 303 for generator 21. -/
theorem ep_Q2_024_partial_21_0303_valid :
    mulPoly ep_Q2_024_coefficient_21_0303
        ep_Q2_024_generator_21_0300_0399 =
      ep_Q2_024_partial_21_0303 := by
  native_decide

/-- Coefficient term 304 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0304 : Poly :=
[
  term ((527210767274432 : Rat) / 1162780221153193) [(0, 1), (9, 2), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 304 for generator 21. -/
def ep_Q2_024_partial_21_0304 : Poly :=
[
  term ((1054421534548864 : Rat) / 1162780221153193) [(0, 1), (9, 2), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-527210767274432 : Rat) / 1162780221153193) [(0, 1), (9, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 304 for generator 21. -/
theorem ep_Q2_024_partial_21_0304_valid :
    mulPoly ep_Q2_024_coefficient_21_0304
        ep_Q2_024_generator_21_0300_0399 =
      ep_Q2_024_partial_21_0304 := by
  native_decide

/-- Coefficient term 305 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0305 : Poly :=
[
  term ((29126686030272528252131061851301363411063603590152468727 : Rat) / 1673998113837635673308592175505278615441223561845430484) [(0, 1), (9, 2), (13, 1), (15, 1)]
]

/-- Partial product 305 for generator 21. -/
def ep_Q2_024_partial_21_0305 : Poly :=
[
  term ((29126686030272528252131061851301363411063603590152468727 : Rat) / 836999056918817836654296087752639307720611780922715242) [(0, 1), (9, 2), (10, 1), (13, 1), (15, 1)],
  term ((-29126686030272528252131061851301363411063603590152468727 : Rat) / 1673998113837635673308592175505278615441223561845430484) [(0, 1), (9, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 305 for generator 21. -/
theorem ep_Q2_024_partial_21_0305_valid :
    mulPoly ep_Q2_024_coefficient_21_0305
        ep_Q2_024_generator_21_0300_0399 =
      ep_Q2_024_partial_21_0305 := by
  native_decide

/-- Coefficient term 306 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0306 : Poly :=
[
  term ((-5546629823834425 : Rat) / 3488340663459579) [(0, 1), (9, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 306 for generator 21. -/
def ep_Q2_024_partial_21_0306 : Poly :=
[
  term ((-11093259647668850 : Rat) / 3488340663459579) [(0, 1), (9, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((5546629823834425 : Rat) / 3488340663459579) [(0, 1), (9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 306 for generator 21. -/
theorem ep_Q2_024_partial_21_0306_valid :
    mulPoly ep_Q2_024_coefficient_21_0306
        ep_Q2_024_generator_21_0300_0399 =
      ep_Q2_024_partial_21_0306 := by
  native_decide

/-- Coefficient term 307 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0307 : Poly :=
[
  term ((572551309245739939712646683346123863644 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (9, 2), (13, 2)]
]

/-- Partial product 307 for generator 21. -/
def ep_Q2_024_partial_21_0307 : Poly :=
[
  term ((1145102618491479879425293366692247727288 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (9, 2), (10, 1), (13, 2)],
  term ((-572551309245739939712646683346123863644 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (9, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 307 for generator 21. -/
theorem ep_Q2_024_partial_21_0307_valid :
    mulPoly ep_Q2_024_coefficient_21_0307
        ep_Q2_024_generator_21_0300_0399 =
      ep_Q2_024_partial_21_0307 := by
  native_decide

/-- Coefficient term 308 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0308 : Poly :=
[
  term ((-11883398416704992841676712652672611881153 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (9, 2), (14, 1)]
]

/-- Partial product 308 for generator 21. -/
def ep_Q2_024_partial_21_0308 : Poly :=
[
  term ((-23766796833409985683353425305345223762306 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (9, 2), (10, 1), (14, 1)],
  term ((11883398416704992841676712652672611881153 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (9, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 308 for generator 21. -/
theorem ep_Q2_024_partial_21_0308_valid :
    mulPoly ep_Q2_024_coefficient_21_0308
        ep_Q2_024_generator_21_0300_0399 =
      ep_Q2_024_partial_21_0308 := by
  native_decide

/-- Coefficient term 309 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0309 : Poly :=
[
  term ((-12359446075906538358165715086458869266337176197137420477 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(0, 1), (9, 2), (15, 2)]
]

/-- Partial product 309 for generator 21. -/
def ep_Q2_024_partial_21_0309 : Poly :=
[
  term ((-24718892151813076716331430172917738532674352394274840954 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(0, 1), (9, 2), (10, 1), (15, 2)],
  term ((12359446075906538358165715086458869266337176197137420477 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(0, 1), (9, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 309 for generator 21. -/
theorem ep_Q2_024_partial_21_0309_valid :
    mulPoly ep_Q2_024_coefficient_21_0309
        ep_Q2_024_generator_21_0300_0399 =
      ep_Q2_024_partial_21_0309 := by
  native_decide

/-- Coefficient term 310 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0310 : Poly :=
[
  term ((5481382992466540 : Rat) / 3488340663459579) [(0, 1), (9, 2), (15, 2), (16, 1)]
]

/-- Partial product 310 for generator 21. -/
def ep_Q2_024_partial_21_0310 : Poly :=
[
  term ((10962765984933080 : Rat) / 3488340663459579) [(0, 1), (9, 2), (10, 1), (15, 2), (16, 1)],
  term ((-5481382992466540 : Rat) / 3488340663459579) [(0, 1), (9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 310 for generator 21. -/
theorem ep_Q2_024_partial_21_0310_valid :
    mulPoly ep_Q2_024_coefficient_21_0310
        ep_Q2_024_generator_21_0300_0399 =
      ep_Q2_024_partial_21_0310 := by
  native_decide

/-- Coefficient term 311 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0311 : Poly :=
[
  term ((126225064372939892662610287863400842112 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (9, 3), (11, 1)]
]

/-- Partial product 311 for generator 21. -/
def ep_Q2_024_partial_21_0311 : Poly :=
[
  term ((252450128745879785325220575726801684224 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (9, 3), (10, 1), (11, 1)],
  term ((-126225064372939892662610287863400842112 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (9, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 311 for generator 21. -/
theorem ep_Q2_024_partial_21_0311_valid :
    mulPoly ep_Q2_024_coefficient_21_0311
        ep_Q2_024_generator_21_0300_0399 =
      ep_Q2_024_partial_21_0311 := by
  native_decide

/-- Coefficient term 312 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0312 : Poly :=
[
  term ((-388949049229842170464178824740223553056 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 3), (13, 1)]
]

/-- Partial product 312 for generator 21. -/
def ep_Q2_024_partial_21_0312 : Poly :=
[
  term ((-777898098459684340928357649480447106112 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 3), (10, 1), (13, 1)],
  term ((388949049229842170464178824740223553056 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 312 for generator 21. -/
theorem ep_Q2_024_partial_21_0312_valid :
    mulPoly ep_Q2_024_coefficient_21_0312
        ep_Q2_024_generator_21_0300_0399 =
      ep_Q2_024_partial_21_0312 := by
  native_decide

/-- Coefficient term 313 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0313 : Poly :=
[
  term ((12301069069469927066412623315433253195720432156430141869 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(0, 1), (9, 3), (15, 1)]
]

/-- Partial product 313 for generator 21. -/
def ep_Q2_024_partial_21_0313 : Poly :=
[
  term ((12301069069469927066412623315433253195720432156430141869 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(0, 1), (9, 3), (10, 1), (15, 1)],
  term ((-12301069069469927066412623315433253195720432156430141869 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(0, 1), (9, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 313 for generator 21. -/
theorem ep_Q2_024_partial_21_0313_valid :
    mulPoly ep_Q2_024_coefficient_21_0313
        ep_Q2_024_generator_21_0300_0399 =
      ep_Q2_024_partial_21_0313 := by
  native_decide

/-- Coefficient term 314 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0314 : Poly :=
[
  term ((-4111658236248574 : Rat) / 3488340663459579) [(0, 1), (9, 3), (15, 1), (16, 1)]
]

/-- Partial product 314 for generator 21. -/
def ep_Q2_024_partial_21_0314 : Poly :=
[
  term ((-8223316472497148 : Rat) / 3488340663459579) [(0, 1), (9, 3), (10, 1), (15, 1), (16, 1)],
  term ((4111658236248574 : Rat) / 3488340663459579) [(0, 1), (9, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 314 for generator 21. -/
theorem ep_Q2_024_partial_21_0314_valid :
    mulPoly ep_Q2_024_coefficient_21_0314
        ep_Q2_024_generator_21_0300_0399 =
      ep_Q2_024_partial_21_0314 := by
  native_decide

/-- Coefficient term 315 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0315 : Poly :=
[
  term ((-347118927025584704822178291624352315808 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 4)]
]

/-- Partial product 315 for generator 21. -/
def ep_Q2_024_partial_21_0315 : Poly :=
[
  term ((347118927025584704822178291624352315808 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 4)],
  term ((-694237854051169409644356583248704631616 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 4), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 315 for generator 21. -/
theorem ep_Q2_024_partial_21_0315_valid :
    mulPoly ep_Q2_024_coefficient_21_0315
        ep_Q2_024_generator_21_0300_0399 =
      ep_Q2_024_partial_21_0315 := by
  native_decide

/-- Coefficient term 316 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0316 : Poly :=
[
  term ((-5626786232852480596986384644012788074352480312750530851 : Rat) / 929998952132019818504773430836265897467346423247461380) [(0, 1), (10, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 316 for generator 21. -/
def ep_Q2_024_partial_21_0316 : Poly :=
[
  term ((5626786232852480596986384644012788074352480312750530851 : Rat) / 929998952132019818504773430836265897467346423247461380) [(0, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-5626786232852480596986384644012788074352480312750530851 : Rat) / 464999476066009909252386715418132948733673211623730690) [(0, 1), (10, 2), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 316 for generator 21. -/
theorem ep_Q2_024_partial_21_0316_valid :
    mulPoly ep_Q2_024_coefficient_21_0316
        ep_Q2_024_generator_21_0300_0399 =
      ep_Q2_024_partial_21_0316 := by
  native_decide

/-- Coefficient term 317 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0317 : Poly :=
[
  term ((1511632778605275 : Rat) / 1162780221153193) [(0, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 317 for generator 21. -/
def ep_Q2_024_partial_21_0317 : Poly :=
[
  term ((-1511632778605275 : Rat) / 1162780221153193) [(0, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((3023265557210550 : Rat) / 1162780221153193) [(0, 1), (10, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 317 for generator 21. -/
theorem ep_Q2_024_partial_21_0317_valid :
    mulPoly ep_Q2_024_coefficient_21_0317
        ep_Q2_024_generator_21_0300_0399 =
      ep_Q2_024_partial_21_0317 := by
  native_decide

/-- Coefficient term 318 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0318 : Poly :=
[
  term ((50147794845543336284049146931354572708 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (10, 1), (12, 1), (13, 2)]
]

/-- Partial product 318 for generator 21. -/
def ep_Q2_024_partial_21_0318 : Poly :=
[
  term ((-50147794845543336284049146931354572708 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (10, 1), (12, 1), (13, 2)],
  term ((100295589691086672568098293862709145416 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (10, 2), (12, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 318 for generator 21. -/
theorem ep_Q2_024_partial_21_0318_valid :
    mulPoly ep_Q2_024_coefficient_21_0318
        ep_Q2_024_generator_21_0300_0399 =
      ep_Q2_024_partial_21_0318 := by
  native_decide

/-- Coefficient term 319 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0319 : Poly :=
[
  term ((-43459647497705333090949826472205091833136204953312197369 : Rat) / 3719995808528079274019093723345063589869385692989845520) [(0, 1), (10, 1), (13, 1), (15, 1)]
]

/-- Partial product 319 for generator 21. -/
def ep_Q2_024_partial_21_0319 : Poly :=
[
  term ((43459647497705333090949826472205091833136204953312197369 : Rat) / 3719995808528079274019093723345063589869385692989845520) [(0, 1), (10, 1), (13, 1), (15, 1)],
  term ((-43459647497705333090949826472205091833136204953312197369 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(0, 1), (10, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 319 for generator 21. -/
theorem ep_Q2_024_partial_21_0319_valid :
    mulPoly ep_Q2_024_coefficient_21_0319
        ep_Q2_024_generator_21_0300_0399 =
      ep_Q2_024_partial_21_0319 := by
  native_decide

/-- Coefficient term 320 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0320 : Poly :=
[
  term ((15802051720330881 : Rat) / 4651120884612772) [(0, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 320 for generator 21. -/
def ep_Q2_024_partial_21_0320 : Poly :=
[
  term ((-15802051720330881 : Rat) / 4651120884612772) [(0, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((15802051720330881 : Rat) / 2325560442306386) [(0, 1), (10, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 320 for generator 21. -/
theorem ep_Q2_024_partial_21_0320_valid :
    mulPoly ep_Q2_024_coefficient_21_0320
        ep_Q2_024_generator_21_0300_0399 =
      ep_Q2_024_partial_21_0320 := by
  native_decide

/-- Coefficient term 321 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0321 : Poly :=
[
  term ((1359593368573093172905712257911441661246 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (10, 1), (13, 2)]
]

/-- Partial product 321 for generator 21. -/
def ep_Q2_024_partial_21_0321 : Poly :=
[
  term ((-1359593368573093172905712257911441661246 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (10, 1), (13, 2)],
  term ((2719186737146186345811424515822883322492 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (10, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 321 for generator 21. -/
theorem ep_Q2_024_partial_21_0321_valid :
    mulPoly ep_Q2_024_coefficient_21_0321
        ep_Q2_024_generator_21_0300_0399 =
      ep_Q2_024_partial_21_0321 := by
  native_decide

/-- Coefficient term 322 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0322 : Poly :=
[
  term ((-718155970534971513674632645733775929978 : Rat) / 119970945740247729656669352802953926799) [(0, 1), (11, 1), (12, 1), (13, 1)]
]

/-- Partial product 322 for generator 21. -/
def ep_Q2_024_partial_21_0322 : Poly :=
[
  term ((-1436311941069943027349265291467551859956 : Rat) / 119970945740247729656669352802953926799) [(0, 1), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((718155970534971513674632645733775929978 : Rat) / 119970945740247729656669352802953926799) [(0, 1), (11, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 322 for generator 21. -/
theorem ep_Q2_024_partial_21_0322_valid :
    mulPoly ep_Q2_024_coefficient_21_0322
        ep_Q2_024_generator_21_0300_0399 =
      ep_Q2_024_partial_21_0322 := by
  native_decide

/-- Coefficient term 323 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0323 : Poly :=
[
  term ((296643393949947970943582733117341809304 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (11, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 323 for generator 21. -/
def ep_Q2_024_partial_21_0323 : Poly :=
[
  term ((593286787899895941887165466234683618608 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (10, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-296643393949947970943582733117341809304 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (11, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 323 for generator 21. -/
theorem ep_Q2_024_partial_21_0323_valid :
    mulPoly ep_Q2_024_coefficient_21_0323
        ep_Q2_024_generator_21_0300_0399 =
      ep_Q2_024_partial_21_0323 := by
  native_decide

/-- Coefficient term 324 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0324 : Poly :=
[
  term ((-20252641348034408839391540692055832082022486889027059413 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(0, 1), (11, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 324 for generator 21. -/
def ep_Q2_024_partial_21_0324 : Poly :=
[
  term ((-20252641348034408839391540692055832082022486889027059413 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((20252641348034408839391540692055832082022486889027059413 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(0, 1), (11, 1), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 324 for generator 21. -/
theorem ep_Q2_024_partial_21_0324_valid :
    mulPoly ep_Q2_024_coefficient_21_0324
        ep_Q2_024_generator_21_0300_0399 =
      ep_Q2_024_partial_21_0324 := by
  native_decide

/-- Coefficient term 325 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0325 : Poly :=
[
  term ((2189297816169598 : Rat) / 1162780221153193) [(0, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 325 for generator 21. -/
def ep_Q2_024_partial_21_0325 : Poly :=
[
  term ((4378595632339196 : Rat) / 1162780221153193) [(0, 1), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2189297816169598 : Rat) / 1162780221153193) [(0, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 325 for generator 21. -/
theorem ep_Q2_024_partial_21_0325_valid :
    mulPoly ep_Q2_024_coefficient_21_0325
        ep_Q2_024_generator_21_0300_0399 =
      ep_Q2_024_partial_21_0325 := by
  native_decide

/-- Coefficient term 326 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0326 : Poly :=
[
  term ((97003339732148008443580288218011521455512563441091995157 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(0, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 326 for generator 21. -/
def ep_Q2_024_partial_21_0326 : Poly :=
[
  term ((97003339732148008443580288218011521455512563441091995157 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(0, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-97003339732148008443580288218011521455512563441091995157 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(0, 1), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 326 for generator 21. -/
theorem ep_Q2_024_partial_21_0326_valid :
    mulPoly ep_Q2_024_coefficient_21_0326
        ep_Q2_024_generator_21_0300_0399 =
      ep_Q2_024_partial_21_0326 := by
  native_decide

/-- Coefficient term 327 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0327 : Poly :=
[
  term ((-14802658555111563 : Rat) / 2325560442306386) [(0, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 327 for generator 21. -/
def ep_Q2_024_partial_21_0327 : Poly :=
[
  term ((-14802658555111563 : Rat) / 1162780221153193) [(0, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((14802658555111563 : Rat) / 2325560442306386) [(0, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 327 for generator 21. -/
theorem ep_Q2_024_partial_21_0327_valid :
    mulPoly ep_Q2_024_coefficient_21_0327
        ep_Q2_024_generator_21_0300_0399 =
      ep_Q2_024_partial_21_0327 := by
  native_decide

/-- Coefficient term 328 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0328 : Poly :=
[
  term ((-200588039591533880360942274555215410124 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (11, 1), (12, 2), (13, 1)]
]

/-- Partial product 328 for generator 21. -/
def ep_Q2_024_partial_21_0328 : Poly :=
[
  term ((-401176079183067760721884549110430820248 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (10, 1), (11, 1), (12, 2), (13, 1)],
  term ((200588039591533880360942274555215410124 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (11, 1), (12, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 328 for generator 21. -/
theorem ep_Q2_024_partial_21_0328_valid :
    mulPoly ep_Q2_024_coefficient_21_0328
        ep_Q2_024_generator_21_0300_0399 =
      ep_Q2_024_partial_21_0328 := by
  native_decide

/-- Coefficient term 329 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0329 : Poly :=
[
  term ((7919389864836281022134782793813537210206407675858005151 : Rat) / 929998952132019818504773430836265897467346423247461380) [(0, 1), (11, 1), (12, 2), (15, 1)]
]

/-- Partial product 329 for generator 21. -/
def ep_Q2_024_partial_21_0329 : Poly :=
[
  term ((7919389864836281022134782793813537210206407675858005151 : Rat) / 464999476066009909252386715418132948733673211623730690) [(0, 1), (10, 1), (11, 1), (12, 2), (15, 1)],
  term ((-7919389864836281022134782793813537210206407675858005151 : Rat) / 929998952132019818504773430836265897467346423247461380) [(0, 1), (11, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 329 for generator 21. -/
theorem ep_Q2_024_partial_21_0329_valid :
    mulPoly ep_Q2_024_coefficient_21_0329
        ep_Q2_024_generator_21_0300_0399 =
      ep_Q2_024_partial_21_0329 := by
  native_decide

/-- Coefficient term 330 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0330 : Poly :=
[
  term ((-3015157870287575 : Rat) / 1162780221153193) [(0, 1), (11, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 330 for generator 21. -/
def ep_Q2_024_partial_21_0330 : Poly :=
[
  term ((-6030315740575150 : Rat) / 1162780221153193) [(0, 1), (10, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((3015157870287575 : Rat) / 1162780221153193) [(0, 1), (11, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 330 for generator 21. -/
theorem ep_Q2_024_partial_21_0330_valid :
    mulPoly ep_Q2_024_coefficient_21_0330
        ep_Q2_024_generator_21_0300_0399 =
      ep_Q2_024_partial_21_0330 := by
  native_decide

/-- Coefficient term 331 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0331 : Poly :=
[
  term ((306698979342465802324085636146780654343 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (11, 1), (13, 1)]
]

/-- Partial product 331 for generator 21. -/
def ep_Q2_024_partial_21_0331 : Poly :=
[
  term ((613397958684931604648171272293561308686 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (10, 1), (11, 1), (13, 1)],
  term ((-306698979342465802324085636146780654343 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 331 for generator 21. -/
theorem ep_Q2_024_partial_21_0331_valid :
    mulPoly ep_Q2_024_coefficient_21_0331
        ep_Q2_024_generator_21_0300_0399 =
      ep_Q2_024_partial_21_0331 := by
  native_decide

/-- Coefficient term 332 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0332 : Poly :=
[
  term ((2694544970124256243547102523240490961236 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (11, 1), (13, 1), (14, 1)]
]

/-- Partial product 332 for generator 21. -/
def ep_Q2_024_partial_21_0332 : Poly :=
[
  term ((5389089940248512487094205046480981922472 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((-2694544970124256243547102523240490961236 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 332 for generator 21. -/
theorem ep_Q2_024_partial_21_0332_valid :
    mulPoly ep_Q2_024_coefficient_21_0332
        ep_Q2_024_generator_21_0300_0399 =
      ep_Q2_024_partial_21_0332 := by
  native_decide

/-- Coefficient term 333 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0333 : Poly :=
[
  term ((-54267504900238499965814543541110615119259775310726648457 : Rat) / 1115998742558423782205728117003519076960815707896953656) [(0, 1), (11, 1), (13, 1), (15, 2)]
]

/-- Partial product 333 for generator 21. -/
def ep_Q2_024_partial_21_0333 : Poly :=
[
  term ((-54267504900238499965814543541110615119259775310726648457 : Rat) / 557999371279211891102864058501759538480407853948476828) [(0, 1), (10, 1), (11, 1), (13, 1), (15, 2)],
  term ((54267504900238499965814543541110615119259775310726648457 : Rat) / 1115998742558423782205728117003519076960815707896953656) [(0, 1), (11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 333 for generator 21. -/
theorem ep_Q2_024_partial_21_0333_valid :
    mulPoly ep_Q2_024_coefficient_21_0333
        ep_Q2_024_generator_21_0300_0399 =
      ep_Q2_024_partial_21_0333 := by
  native_decide

/-- Coefficient term 334 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0334 : Poly :=
[
  term ((11083636152647727 : Rat) / 2325560442306386) [(0, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 334 for generator 21. -/
def ep_Q2_024_partial_21_0334 : Poly :=
[
  term ((11083636152647727 : Rat) / 1162780221153193) [(0, 1), (10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-11083636152647727 : Rat) / 2325560442306386) [(0, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 334 for generator 21. -/
theorem ep_Q2_024_partial_21_0334_valid :
    mulPoly ep_Q2_024_coefficient_21_0334
        ep_Q2_024_generator_21_0300_0399 =
      ep_Q2_024_partial_21_0334 := by
  native_decide

/-- Coefficient term 335 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0335 : Poly :=
[
  term ((5369752680556323263420502685502880998318630821031508314 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (11, 1), (13, 2), (15, 1)]
]

/-- Partial product 335 for generator 21. -/
def ep_Q2_024_partial_21_0335 : Poly :=
[
  term ((10739505361112646526841005371005761996637261642063016628 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (10, 1), (11, 1), (13, 2), (15, 1)],
  term ((-5369752680556323263420502685502880998318630821031508314 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 335 for generator 21. -/
theorem ep_Q2_024_partial_21_0335_valid :
    mulPoly ep_Q2_024_coefficient_21_0335
        ep_Q2_024_generator_21_0300_0399 =
      ep_Q2_024_partial_21_0335 := by
  native_decide

/-- Coefficient term 336 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0336 : Poly :=
[
  term ((-75330592794360 : Rat) / 1162780221153193) [(0, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 336 for generator 21. -/
def ep_Q2_024_partial_21_0336 : Poly :=
[
  term ((-150661185588720 : Rat) / 1162780221153193) [(0, 1), (10, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((75330592794360 : Rat) / 1162780221153193) [(0, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 336 for generator 21. -/
theorem ep_Q2_024_partial_21_0336_valid :
    mulPoly ep_Q2_024_coefficient_21_0336
        ep_Q2_024_generator_21_0300_0399 =
      ep_Q2_024_partial_21_0336 := by
  native_decide

/-- Coefficient term 337 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0337 : Poly :=
[
  term ((-40472928056033817116049120031239046672 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (11, 1), (13, 3)]
]

/-- Partial product 337 for generator 21. -/
def ep_Q2_024_partial_21_0337 : Poly :=
[
  term ((-80945856112067634232098240062478093344 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (10, 1), (11, 1), (13, 3)],
  term ((40472928056033817116049120031239046672 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (11, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 337 for generator 21. -/
theorem ep_Q2_024_partial_21_0337_valid :
    mulPoly ep_Q2_024_coefficient_21_0337
        ep_Q2_024_generator_21_0300_0399 =
      ep_Q2_024_partial_21_0337 := by
  native_decide

/-- Coefficient term 338 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0338 : Poly :=
[
  term ((-123634377194162065175984705896580339781478522958385658387 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(0, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 338 for generator 21. -/
def ep_Q2_024_partial_21_0338 : Poly :=
[
  term ((-123634377194162065175984705896580339781478522958385658387 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(0, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((123634377194162065175984705896580339781478522958385658387 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(0, 1), (11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 338 for generator 21. -/
theorem ep_Q2_024_partial_21_0338_valid :
    mulPoly ep_Q2_024_coefficient_21_0338
        ep_Q2_024_generator_21_0300_0399 =
      ep_Q2_024_partial_21_0338 := by
  native_decide

/-- Coefficient term 339 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0339 : Poly :=
[
  term ((16636019461371833 : Rat) / 2325560442306386) [(0, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 339 for generator 21. -/
def ep_Q2_024_partial_21_0339 : Poly :=
[
  term ((16636019461371833 : Rat) / 1162780221153193) [(0, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-16636019461371833 : Rat) / 2325560442306386) [(0, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 339 for generator 21. -/
theorem ep_Q2_024_partial_21_0339_valid :
    mulPoly ep_Q2_024_coefficient_21_0339
        ep_Q2_024_generator_21_0300_0399 =
      ep_Q2_024_partial_21_0339 := by
  native_decide

/-- Coefficient term 340 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0340 : Poly :=
[
  term ((64885598020952966377851495215056251811814535036016934143 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(0, 1), (11, 1), (15, 1)]
]

/-- Partial product 340 for generator 21. -/
def ep_Q2_024_partial_21_0340 : Poly :=
[
  term ((64885598020952966377851495215056251811814535036016934143 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(0, 1), (10, 1), (11, 1), (15, 1)],
  term ((-64885598020952966377851495215056251811814535036016934143 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(0, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 340 for generator 21. -/
theorem ep_Q2_024_partial_21_0340_valid :
    mulPoly ep_Q2_024_coefficient_21_0340
        ep_Q2_024_generator_21_0300_0399 =
      ep_Q2_024_partial_21_0340 := by
  native_decide

/-- Coefficient term 341 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0341 : Poly :=
[
  term ((978162947449257 : Rat) / 1162780221153193) [(0, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 341 for generator 21. -/
def ep_Q2_024_partial_21_0341 : Poly :=
[
  term ((1956325894898514 : Rat) / 1162780221153193) [(0, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-978162947449257 : Rat) / 1162780221153193) [(0, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 341 for generator 21. -/
theorem ep_Q2_024_partial_21_0341_valid :
    mulPoly ep_Q2_024_coefficient_21_0341
        ep_Q2_024_generator_21_0300_0399 =
      ep_Q2_024_partial_21_0341 := by
  native_decide

/-- Coefficient term 342 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0342 : Poly :=
[
  term ((-2233057704898447277337521117967487825271887127131734968 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (11, 1), (15, 3)]
]

/-- Partial product 342 for generator 21. -/
def ep_Q2_024_partial_21_0342 : Poly :=
[
  term ((-4466115409796894554675042235934975650543774254263469936 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (10, 1), (11, 1), (15, 3)],
  term ((2233057704898447277337521117967487825271887127131734968 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 342 for generator 21. -/
theorem ep_Q2_024_partial_21_0342_valid :
    mulPoly ep_Q2_024_coefficient_21_0342
        ep_Q2_024_generator_21_0300_0399 =
      ep_Q2_024_partial_21_0342 := by
  native_decide

/-- Coefficient term 343 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0343 : Poly :=
[
  term ((449127554429600 : Rat) / 1162780221153193) [(0, 1), (11, 1), (15, 3), (16, 1)]
]

/-- Partial product 343 for generator 21. -/
def ep_Q2_024_partial_21_0343 : Poly :=
[
  term ((898255108859200 : Rat) / 1162780221153193) [(0, 1), (10, 1), (11, 1), (15, 3), (16, 1)],
  term ((-449127554429600 : Rat) / 1162780221153193) [(0, 1), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 343 for generator 21. -/
theorem ep_Q2_024_partial_21_0343_valid :
    mulPoly ep_Q2_024_coefficient_21_0343
        ep_Q2_024_generator_21_0300_0399 =
      ep_Q2_024_partial_21_0343 := by
  native_decide

/-- Coefficient term 344 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0344 : Poly :=
[
  term ((-1429182194689304419382031011936884624481 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (11, 2)]
]

/-- Partial product 344 for generator 21. -/
def ep_Q2_024_partial_21_0344 : Poly :=
[
  term ((-2858364389378608838764062023873769248962 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (10, 1), (11, 2)],
  term ((1429182194689304419382031011936884624481 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 344 for generator 21. -/
theorem ep_Q2_024_partial_21_0344_valid :
    mulPoly ep_Q2_024_coefficient_21_0344
        ep_Q2_024_generator_21_0300_0399 =
      ep_Q2_024_partial_21_0344 := by
  native_decide

/-- Coefficient term 345 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0345 : Poly :=
[
  term ((28428742065267769492165929239842551361 : Rat) / 399903152467492432188897842676513089330) [(0, 1), (12, 1)]
]

/-- Partial product 345 for generator 21. -/
def ep_Q2_024_partial_21_0345 : Poly :=
[
  term ((28428742065267769492165929239842551361 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (10, 1), (12, 1)],
  term ((-28428742065267769492165929239842551361 : Rat) / 399903152467492432188897842676513089330) [(0, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 345 for generator 21. -/
theorem ep_Q2_024_partial_21_0345_valid :
    mulPoly ep_Q2_024_coefficient_21_0345
        ep_Q2_024_generator_21_0300_0399 =
      ep_Q2_024_partial_21_0345 := by
  native_decide

/-- Coefficient term 346 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0346 : Poly :=
[
  term ((-164450924956588150524026507372646906853948765195645650517 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(0, 1), (12, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 346 for generator 21. -/
def ep_Q2_024_partial_21_0346 : Poly :=
[
  term ((-164450924956588150524026507372646906853948765195645650517 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(0, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((164450924956588150524026507372646906853948765195645650517 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(0, 1), (12, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 346 for generator 21. -/
theorem ep_Q2_024_partial_21_0346_valid :
    mulPoly ep_Q2_024_coefficient_21_0346
        ep_Q2_024_generator_21_0300_0399 =
      ep_Q2_024_partial_21_0346 := by
  native_decide

/-- Coefficient term 347 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0347 : Poly :=
[
  term ((14038382648281759 : Rat) / 2325560442306386) [(0, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 347 for generator 21. -/
def ep_Q2_024_partial_21_0347 : Poly :=
[
  term ((14038382648281759 : Rat) / 1162780221153193) [(0, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-14038382648281759 : Rat) / 2325560442306386) [(0, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 347 for generator 21. -/
theorem ep_Q2_024_partial_21_0347_valid :
    mulPoly ep_Q2_024_coefficient_21_0347
        ep_Q2_024_generator_21_0300_0399 =
      ep_Q2_024_partial_21_0347 := by
  native_decide

/-- Coefficient term 348 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0348 : Poly :=
[
  term ((106682803768180824309174659190507571960536025007329229921 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(0, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 348 for generator 21. -/
def ep_Q2_024_partial_21_0348 : Poly :=
[
  term ((106682803768180824309174659190507571960536025007329229921 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(0, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-106682803768180824309174659190507571960536025007329229921 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(0, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 348 for generator 21. -/
theorem ep_Q2_024_partial_21_0348_valid :
    mulPoly ep_Q2_024_coefficient_21_0348
        ep_Q2_024_generator_21_0300_0399 =
      ep_Q2_024_partial_21_0348 := by
  native_decide

/-- Coefficient term 349 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0349 : Poly :=
[
  term ((115792774647475831 : Rat) / 13953362653838316) [(0, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 349 for generator 21. -/
def ep_Q2_024_partial_21_0349 : Poly :=
[
  term ((115792774647475831 : Rat) / 6976681326919158) [(0, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-115792774647475831 : Rat) / 13953362653838316) [(0, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 349 for generator 21. -/
theorem ep_Q2_024_partial_21_0349_valid :
    mulPoly ep_Q2_024_coefficient_21_0349
        ep_Q2_024_generator_21_0300_0399 =
      ep_Q2_024_partial_21_0349 := by
  native_decide

/-- Coefficient term 350 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0350 : Poly :=
[
  term ((3625398602792628896353453115721560677352 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (12, 1), (13, 2)]
]

/-- Partial product 350 for generator 21. -/
def ep_Q2_024_partial_21_0350 : Poly :=
[
  term ((7250797205585257792706906231443121354704 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (10, 1), (12, 1), (13, 2)],
  term ((-3625398602792628896353453115721560677352 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (12, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 350 for generator 21. -/
theorem ep_Q2_024_partial_21_0350_valid :
    mulPoly ep_Q2_024_coefficient_21_0350
        ep_Q2_024_generator_21_0300_0399 =
      ep_Q2_024_partial_21_0350 := by
  native_decide

/-- Coefficient term 351 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0351 : Poly :=
[
  term ((259451438241996968824998501993404916522 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (12, 1), (13, 2), (14, 1)]
]

/-- Partial product 351 for generator 21. -/
def ep_Q2_024_partial_21_0351 : Poly :=
[
  term ((518902876483993937649997003986809833044 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (10, 1), (12, 1), (13, 2), (14, 1)],
  term ((-259451438241996968824998501993404916522 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (12, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 351 for generator 21. -/
theorem ep_Q2_024_partial_21_0351_valid :
    mulPoly ep_Q2_024_coefficient_21_0351
        ep_Q2_024_generator_21_0300_0399 =
      ep_Q2_024_partial_21_0351 := by
  native_decide

/-- Coefficient term 352 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0352 : Poly :=
[
  term ((4460575763931020940779677802964195788 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (12, 1), (14, 1)]
]

/-- Partial product 352 for generator 21. -/
def ep_Q2_024_partial_21_0352 : Poly :=
[
  term ((8921151527862041881559355605928391576 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (10, 1), (12, 1), (14, 1)],
  term ((-4460575763931020940779677802964195788 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 352 for generator 21. -/
theorem ep_Q2_024_partial_21_0352_valid :
    mulPoly ep_Q2_024_coefficient_21_0352
        ep_Q2_024_generator_21_0300_0399 =
      ep_Q2_024_partial_21_0352 := by
  native_decide

/-- Coefficient term 353 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0353 : Poly :=
[
  term ((74345952726187858612662019219300612929374338180507452551 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(0, 1), (12, 1), (15, 2)]
]

/-- Partial product 353 for generator 21. -/
def ep_Q2_024_partial_21_0353 : Poly :=
[
  term ((74345952726187858612662019219300612929374338180507452551 : Rat) / 929998952132019818504773430836265897467346423247461380) [(0, 1), (10, 1), (12, 1), (15, 2)],
  term ((-74345952726187858612662019219300612929374338180507452551 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(0, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 353 for generator 21. -/
theorem ep_Q2_024_partial_21_0353_valid :
    mulPoly ep_Q2_024_coefficient_21_0353
        ep_Q2_024_generator_21_0300_0399 =
      ep_Q2_024_partial_21_0353 := by
  native_decide

/-- Coefficient term 354 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0354 : Poly :=
[
  term ((-9120270510317319 : Rat) / 2325560442306386) [(0, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 354 for generator 21. -/
def ep_Q2_024_partial_21_0354 : Poly :=
[
  term ((-9120270510317319 : Rat) / 1162780221153193) [(0, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((9120270510317319 : Rat) / 2325560442306386) [(0, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 354 for generator 21. -/
theorem ep_Q2_024_partial_21_0354_valid :
    mulPoly ep_Q2_024_coefficient_21_0354
        ep_Q2_024_generator_21_0300_0399 =
      ep_Q2_024_partial_21_0354 := by
  native_decide

/-- Coefficient term 355 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0355 : Poly :=
[
  term ((26974210883668912519839817367166225675565343026070909313 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(0, 1), (12, 2), (13, 1), (15, 1)]
]

/-- Partial product 355 for generator 21. -/
def ep_Q2_024_partial_21_0355 : Poly :=
[
  term ((26974210883668912519839817367166225675565343026070909313 : Rat) / 929998952132019818504773430836265897467346423247461380) [(0, 1), (10, 1), (12, 2), (13, 1), (15, 1)],
  term ((-26974210883668912519839817367166225675565343026070909313 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(0, 1), (12, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 355 for generator 21. -/
theorem ep_Q2_024_partial_21_0355_valid :
    mulPoly ep_Q2_024_coefficient_21_0355
        ep_Q2_024_generator_21_0300_0399 =
      ep_Q2_024_partial_21_0355 := by
  native_decide

/-- Coefficient term 356 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0356 : Poly :=
[
  term ((-5003541596661801 : Rat) / 2325560442306386) [(0, 1), (12, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 356 for generator 21. -/
def ep_Q2_024_partial_21_0356 : Poly :=
[
  term ((-5003541596661801 : Rat) / 1162780221153193) [(0, 1), (10, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((5003541596661801 : Rat) / 2325560442306386) [(0, 1), (12, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 356 for generator 21. -/
theorem ep_Q2_024_partial_21_0356_valid :
    mulPoly ep_Q2_024_coefficient_21_0356
        ep_Q2_024_generator_21_0300_0399 =
      ep_Q2_024_partial_21_0356 := by
  native_decide

/-- Coefficient term 357 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0357 : Poly :=
[
  term ((-124898830274193142709262456668953249078 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (12, 2), (13, 2)]
]

/-- Partial product 357 for generator 21. -/
def ep_Q2_024_partial_21_0357 : Poly :=
[
  term ((-249797660548386285418524913337906498156 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (10, 1), (12, 2), (13, 2)],
  term ((124898830274193142709262456668953249078 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (12, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 357 for generator 21. -/
theorem ep_Q2_024_partial_21_0357_valid :
    mulPoly ep_Q2_024_coefficient_21_0357
        ep_Q2_024_generator_21_0300_0399 =
      ep_Q2_024_partial_21_0357 := by
  native_decide

/-- Coefficient term 358 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0358 : Poly :=
[
  term ((-229527336284499272616790565321770397804284922840156028953 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(0, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 358 for generator 21. -/
def ep_Q2_024_partial_21_0358 : Poly :=
[
  term ((-229527336284499272616790565321770397804284922840156028953 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(0, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((229527336284499272616790565321770397804284922840156028953 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(0, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 358 for generator 21. -/
theorem ep_Q2_024_partial_21_0358_valid :
    mulPoly ep_Q2_024_coefficient_21_0358
        ep_Q2_024_generator_21_0300_0399 =
      ep_Q2_024_partial_21_0358 := by
  native_decide

/-- Coefficient term 359 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0359 : Poly :=
[
  term ((134306340333884689 : Rat) / 13953362653838316) [(0, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 359 for generator 21. -/
def ep_Q2_024_partial_21_0359 : Poly :=
[
  term ((134306340333884689 : Rat) / 6976681326919158) [(0, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-134306340333884689 : Rat) / 13953362653838316) [(0, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 359 for generator 21. -/
theorem ep_Q2_024_partial_21_0359_valid :
    mulPoly ep_Q2_024_coefficient_21_0359
        ep_Q2_024_generator_21_0300_0399 =
      ep_Q2_024_partial_21_0359 := by
  native_decide

/-- Coefficient term 360 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0360 : Poly :=
[
  term ((-168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (13, 1), (14, 2), (15, 1)]
]

/-- Partial product 360 for generator 21. -/
def ep_Q2_024_partial_21_0360 : Poly :=
[
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (10, 1), (13, 1), (14, 2), (15, 1)],
  term ((168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 360 for generator 21. -/
theorem ep_Q2_024_partial_21_0360_valid :
    mulPoly ep_Q2_024_coefficient_21_0360
        ep_Q2_024_generator_21_0300_0399 =
      ep_Q2_024_partial_21_0360 := by
  native_decide

/-- Coefficient term 361 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0361 : Poly :=
[
  term ((-416983870520476 : Rat) / 1162780221153193) [(0, 1), (13, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 361 for generator 21. -/
def ep_Q2_024_partial_21_0361 : Poly :=
[
  term ((-833967741040952 : Rat) / 1162780221153193) [(0, 1), (10, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((416983870520476 : Rat) / 1162780221153193) [(0, 1), (13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 361 for generator 21. -/
theorem ep_Q2_024_partial_21_0361_valid :
    mulPoly ep_Q2_024_coefficient_21_0361
        ep_Q2_024_generator_21_0300_0399 =
      ep_Q2_024_partial_21_0361 := by
  native_decide

/-- Coefficient term 362 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0362 : Poly :=
[
  term ((-10196170210917892866071761241756192202708574583669075079 : Rat) / 3719995808528079274019093723345063589869385692989845520) [(0, 1), (13, 1), (15, 1)]
]

/-- Partial product 362 for generator 21. -/
def ep_Q2_024_partial_21_0362 : Poly :=
[
  term ((-10196170210917892866071761241756192202708574583669075079 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(0, 1), (10, 1), (13, 1), (15, 1)],
  term ((10196170210917892866071761241756192202708574583669075079 : Rat) / 3719995808528079274019093723345063589869385692989845520) [(0, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 362 for generator 21. -/
theorem ep_Q2_024_partial_21_0362_valid :
    mulPoly ep_Q2_024_coefficient_21_0362
        ep_Q2_024_generator_21_0300_0399 =
      ep_Q2_024_partial_21_0362 := by
  native_decide

/-- Coefficient term 363 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0363 : Poly :=
[
  term ((-105998205573215887 : Rat) / 13953362653838316) [(0, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 363 for generator 21. -/
def ep_Q2_024_partial_21_0363 : Poly :=
[
  term ((-105998205573215887 : Rat) / 6976681326919158) [(0, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((105998205573215887 : Rat) / 13953362653838316) [(0, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 363 for generator 21. -/
theorem ep_Q2_024_partial_21_0363_valid :
    mulPoly ep_Q2_024_coefficient_21_0363
        ep_Q2_024_generator_21_0300_0399 =
      ep_Q2_024_partial_21_0363 := by
  native_decide

/-- Coefficient term 364 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0364 : Poly :=
[
  term ((2421929652575774715991013998803013769 : Rat) / 359912837220743188970008058408861780397) [(0, 1), (13, 2)]
]

/-- Partial product 364 for generator 21. -/
def ep_Q2_024_partial_21_0364 : Poly :=
[
  term ((4843859305151549431982027997606027538 : Rat) / 359912837220743188970008058408861780397) [(0, 1), (10, 1), (13, 2)],
  term ((-2421929652575774715991013998803013769 : Rat) / 359912837220743188970008058408861780397) [(0, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 364 for generator 21. -/
theorem ep_Q2_024_partial_21_0364_valid :
    mulPoly ep_Q2_024_coefficient_21_0364
        ep_Q2_024_generator_21_0300_0399 =
      ep_Q2_024_partial_21_0364 := by
  native_decide

/-- Coefficient term 365 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0365 : Poly :=
[
  term ((6627898004148186342669000713130083975168 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (13, 2), (14, 1)]
]

/-- Partial product 365 for generator 21. -/
def ep_Q2_024_partial_21_0365 : Poly :=
[
  term ((13255796008296372685338001426260167950336 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (10, 1), (13, 2), (14, 1)],
  term ((-6627898004148186342669000713130083975168 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 365 for generator 21. -/
theorem ep_Q2_024_partial_21_0365_valid :
    mulPoly ep_Q2_024_coefficient_21_0365
        ep_Q2_024_generator_21_0300_0399 =
      ep_Q2_024_partial_21_0365 := by
  native_decide

/-- Coefficient term 366 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0366 : Poly :=
[
  term ((-2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (13, 2), (14, 2)]
]

/-- Partial product 366 for generator 21. -/
def ep_Q2_024_partial_21_0366 : Poly :=
[
  term ((-4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (10, 1), (13, 2), (14, 2)],
  term ((2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (13, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 366 for generator 21. -/
theorem ep_Q2_024_partial_21_0366_valid :
    mulPoly ep_Q2_024_coefficient_21_0366
        ep_Q2_024_generator_21_0300_0399 =
      ep_Q2_024_partial_21_0366 := by
  native_decide

/-- Coefficient term 367 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0367 : Poly :=
[
  term ((-228548346943902101627953017098607070723838550969230898109 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(0, 1), (14, 1), (15, 2)]
]

/-- Partial product 367 for generator 21. -/
def ep_Q2_024_partial_21_0367 : Poly :=
[
  term ((-228548346943902101627953017098607070723838550969230898109 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(0, 1), (10, 1), (14, 1), (15, 2)],
  term ((228548346943902101627953017098607070723838550969230898109 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(0, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 367 for generator 21. -/
theorem ep_Q2_024_partial_21_0367_valid :
    mulPoly ep_Q2_024_coefficient_21_0367
        ep_Q2_024_generator_21_0300_0399 =
      ep_Q2_024_partial_21_0367 := by
  native_decide

/-- Coefficient term 368 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0368 : Poly :=
[
  term ((9851670194564511 : Rat) / 2325560442306386) [(0, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 368 for generator 21. -/
def ep_Q2_024_partial_21_0368 : Poly :=
[
  term ((9851670194564511 : Rat) / 1162780221153193) [(0, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-9851670194564511 : Rat) / 2325560442306386) [(0, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 368 for generator 21. -/
theorem ep_Q2_024_partial_21_0368_valid :
    mulPoly ep_Q2_024_coefficient_21_0368
        ep_Q2_024_generator_21_0300_0399 =
      ep_Q2_024_partial_21_0368 := by
  native_decide

/-- Coefficient term 369 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0369 : Poly :=
[
  term ((18578835009886931389828064953150187574 : Rat) / 199951576233746216094448921338256544665) [(0, 2), (5, 1), (9, 1)]
]

/-- Partial product 369 for generator 21. -/
def ep_Q2_024_partial_21_0369 : Poly :=
[
  term ((-18578835009886931389828064953150187574 : Rat) / 199951576233746216094448921338256544665) [(0, 2), (5, 1), (9, 1)],
  term ((37157670019773862779656129906300375148 : Rat) / 199951576233746216094448921338256544665) [(0, 2), (5, 1), (9, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 369 for generator 21. -/
theorem ep_Q2_024_partial_21_0369_valid :
    mulPoly ep_Q2_024_coefficient_21_0369
        ep_Q2_024_generator_21_0300_0399 =
      ep_Q2_024_partial_21_0369 := by
  native_decide

/-- Coefficient term 370 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0370 : Poly :=
[
  term ((4703663253269499699398743891936447580 : Rat) / 39990315246749243218889784267651308933) [(0, 2), (5, 1), (13, 1)]
]

/-- Partial product 370 for generator 21. -/
def ep_Q2_024_partial_21_0370 : Poly :=
[
  term ((9407326506538999398797487783872895160 : Rat) / 39990315246749243218889784267651308933) [(0, 2), (5, 1), (10, 1), (13, 1)],
  term ((-4703663253269499699398743891936447580 : Rat) / 39990315246749243218889784267651308933) [(0, 2), (5, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 370 for generator 21. -/
theorem ep_Q2_024_partial_21_0370_valid :
    mulPoly ep_Q2_024_coefficient_21_0370
        ep_Q2_024_generator_21_0300_0399 =
      ep_Q2_024_partial_21_0370 := by
  native_decide

/-- Coefficient term 371 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0371 : Poly :=
[
  term ((-1177363078422275739988089759442077477106778427508365826 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 2), (5, 1), (15, 1)]
]

/-- Partial product 371 for generator 21. -/
def ep_Q2_024_partial_21_0371 : Poly :=
[
  term ((-2354726156844551479976179518884154954213556855016731652 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 2), (5, 1), (10, 1), (15, 1)],
  term ((1177363078422275739988089759442077477106778427508365826 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 2), (5, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 371 for generator 21. -/
theorem ep_Q2_024_partial_21_0371_valid :
    mulPoly ep_Q2_024_coefficient_21_0371
        ep_Q2_024_generator_21_0300_0399 =
      ep_Q2_024_partial_21_0371 := by
  native_decide

/-- Coefficient term 372 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0372 : Poly :=
[
  term ((-427382588269864 : Rat) / 1162780221153193) [(0, 2), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 372 for generator 21. -/
def ep_Q2_024_partial_21_0372 : Poly :=
[
  term ((-854765176539728 : Rat) / 1162780221153193) [(0, 2), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((427382588269864 : Rat) / 1162780221153193) [(0, 2), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 372 for generator 21. -/
theorem ep_Q2_024_partial_21_0372_valid :
    mulPoly ep_Q2_024_coefficient_21_0372
        ep_Q2_024_generator_21_0300_0399 =
      ep_Q2_024_partial_21_0372 := by
  native_decide

/-- Coefficient term 373 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0373 : Poly :=
[
  term ((-18578835009886931389828064953150187574 : Rat) / 199951576233746216094448921338256544665) [(0, 2), (7, 1), (9, 1)]
]

/-- Partial product 373 for generator 21. -/
def ep_Q2_024_partial_21_0373 : Poly :=
[
  term ((18578835009886931389828064953150187574 : Rat) / 199951576233746216094448921338256544665) [(0, 2), (7, 1), (9, 1)],
  term ((-37157670019773862779656129906300375148 : Rat) / 199951576233746216094448921338256544665) [(0, 2), (7, 1), (9, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 373 for generator 21. -/
theorem ep_Q2_024_partial_21_0373_valid :
    mulPoly ep_Q2_024_coefficient_21_0373
        ep_Q2_024_generator_21_0300_0399 =
      ep_Q2_024_partial_21_0373 := by
  native_decide

/-- Coefficient term 374 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0374 : Poly :=
[
  term ((-4703663253269499699398743891936447580 : Rat) / 39990315246749243218889784267651308933) [(0, 2), (7, 1), (13, 1)]
]

/-- Partial product 374 for generator 21. -/
def ep_Q2_024_partial_21_0374 : Poly :=
[
  term ((-9407326506538999398797487783872895160 : Rat) / 39990315246749243218889784267651308933) [(0, 2), (7, 1), (10, 1), (13, 1)],
  term ((4703663253269499699398743891936447580 : Rat) / 39990315246749243218889784267651308933) [(0, 2), (7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 374 for generator 21. -/
theorem ep_Q2_024_partial_21_0374_valid :
    mulPoly ep_Q2_024_coefficient_21_0374
        ep_Q2_024_generator_21_0300_0399 =
      ep_Q2_024_partial_21_0374 := by
  native_decide

/-- Coefficient term 375 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0375 : Poly :=
[
  term ((1177363078422275739988089759442077477106778427508365826 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 2), (7, 1), (15, 1)]
]

/-- Partial product 375 for generator 21. -/
def ep_Q2_024_partial_21_0375 : Poly :=
[
  term ((2354726156844551479976179518884154954213556855016731652 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 2), (7, 1), (10, 1), (15, 1)],
  term ((-1177363078422275739988089759442077477106778427508365826 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 2), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 375 for generator 21. -/
theorem ep_Q2_024_partial_21_0375_valid :
    mulPoly ep_Q2_024_coefficient_21_0375
        ep_Q2_024_generator_21_0300_0399 =
      ep_Q2_024_partial_21_0375 := by
  native_decide

/-- Coefficient term 376 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0376 : Poly :=
[
  term ((427382588269864 : Rat) / 1162780221153193) [(0, 2), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 376 for generator 21. -/
def ep_Q2_024_partial_21_0376 : Poly :=
[
  term ((854765176539728 : Rat) / 1162780221153193) [(0, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-427382588269864 : Rat) / 1162780221153193) [(0, 2), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 376 for generator 21. -/
theorem ep_Q2_024_partial_21_0376_valid :
    mulPoly ep_Q2_024_coefficient_21_0376
        ep_Q2_024_generator_21_0300_0399 =
      ep_Q2_024_partial_21_0376 := by
  native_decide

/-- Coefficient term 377 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0377 : Poly :=
[
  term ((-60647707705317260479933995285639710172 : Rat) / 199951576233746216094448921338256544665) [(0, 2), (9, 1), (11, 1)]
]

/-- Partial product 377 for generator 21. -/
def ep_Q2_024_partial_21_0377 : Poly :=
[
  term ((-121295415410634520959867990571279420344 : Rat) / 199951576233746216094448921338256544665) [(0, 2), (9, 1), (10, 1), (11, 1)],
  term ((60647707705317260479933995285639710172 : Rat) / 199951576233746216094448921338256544665) [(0, 2), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 377 for generator 21. -/
theorem ep_Q2_024_partial_21_0377_valid :
    mulPoly ep_Q2_024_coefficient_21_0377
        ep_Q2_024_generator_21_0300_0399 =
      ep_Q2_024_partial_21_0377 := by
  native_decide

/-- Coefficient term 378 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0378 : Poly :=
[
  term ((24897008634067285794795130322114482756 : Rat) / 199951576233746216094448921338256544665) [(0, 2), (9, 1), (12, 1), (13, 1)]
]

/-- Partial product 378 for generator 21. -/
def ep_Q2_024_partial_21_0378 : Poly :=
[
  term ((49794017268134571589590260644228965512 : Rat) / 199951576233746216094448921338256544665) [(0, 2), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((-24897008634067285794795130322114482756 : Rat) / 199951576233746216094448921338256544665) [(0, 2), (9, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 378 for generator 21. -/
theorem ep_Q2_024_partial_21_0378_valid :
    mulPoly ep_Q2_024_coefficient_21_0378
        ep_Q2_024_generator_21_0300_0399 =
      ep_Q2_024_partial_21_0378 := by
  native_decide

/-- Coefficient term 379 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0379 : Poly :=
[
  term ((-550464729340465184219154740052350989658090880526284951 : Rat) / 185999790426403963700954686167253179493469284649492276) [(0, 2), (9, 1), (12, 1), (15, 1)]
]

/-- Partial product 379 for generator 21. -/
def ep_Q2_024_partial_21_0379 : Poly :=
[
  term ((-550464729340465184219154740052350989658090880526284951 : Rat) / 92999895213201981850477343083626589746734642324746138) [(0, 2), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((550464729340465184219154740052350989658090880526284951 : Rat) / 185999790426403963700954686167253179493469284649492276) [(0, 2), (9, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 379 for generator 21. -/
theorem ep_Q2_024_partial_21_0379_valid :
    mulPoly ep_Q2_024_coefficient_21_0379
        ep_Q2_024_generator_21_0300_0399 =
      ep_Q2_024_partial_21_0379 := by
  native_decide

/-- Coefficient term 380 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0380 : Poly :=
[
  term ((651692520789483 : Rat) / 1162780221153193) [(0, 2), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 380 for generator 21. -/
def ep_Q2_024_partial_21_0380 : Poly :=
[
  term ((1303385041578966 : Rat) / 1162780221153193) [(0, 2), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-651692520789483 : Rat) / 1162780221153193) [(0, 2), (9, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 380 for generator 21. -/
theorem ep_Q2_024_partial_21_0380_valid :
    mulPoly ep_Q2_024_coefficient_21_0380
        ep_Q2_024_generator_21_0300_0399 =
      ep_Q2_024_partial_21_0380 := by
  native_decide

/-- Coefficient term 381 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0381 : Poly :=
[
  term ((581364486473104330816735652970639723956 : Rat) / 359912837220743188970008058408861780397) [(0, 2), (9, 1), (13, 1)]
]

/-- Partial product 381 for generator 21. -/
def ep_Q2_024_partial_21_0381 : Poly :=
[
  term ((1162728972946208661633471305941279447912 : Rat) / 359912837220743188970008058408861780397) [(0, 2), (9, 1), (10, 1), (13, 1)],
  term ((-581364486473104330816735652970639723956 : Rat) / 359912837220743188970008058408861780397) [(0, 2), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 381 for generator 21. -/
theorem ep_Q2_024_partial_21_0381_valid :
    mulPoly ep_Q2_024_coefficient_21_0381
        ep_Q2_024_generator_21_0300_0399 =
      ep_Q2_024_partial_21_0381 := by
  native_decide

/-- Coefficient term 382 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0382 : Poly :=
[
  term ((112534542309350711313968322710665848425027876375875013807 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(0, 2), (9, 1), (15, 1)]
]

/-- Partial product 382 for generator 21. -/
def ep_Q2_024_partial_21_0382 : Poly :=
[
  term ((112534542309350711313968322710665848425027876375875013807 : Rat) / 929998952132019818504773430836265897467346423247461380) [(0, 2), (9, 1), (10, 1), (15, 1)],
  term ((-112534542309350711313968322710665848425027876375875013807 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(0, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 382 for generator 21. -/
theorem ep_Q2_024_partial_21_0382_valid :
    mulPoly ep_Q2_024_coefficient_21_0382
        ep_Q2_024_generator_21_0300_0399 =
      ep_Q2_024_partial_21_0382 := by
  native_decide

/-- Coefficient term 383 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0383 : Poly :=
[
  term ((-36885281294131109 : Rat) / 6976681326919158) [(0, 2), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 383 for generator 21. -/
def ep_Q2_024_partial_21_0383 : Poly :=
[
  term ((-36885281294131109 : Rat) / 3488340663459579) [(0, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((36885281294131109 : Rat) / 6976681326919158) [(0, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 383 for generator 21. -/
theorem ep_Q2_024_partial_21_0383_valid :
    mulPoly ep_Q2_024_coefficient_21_0383
        ep_Q2_024_generator_21_0300_0399 =
      ep_Q2_024_partial_21_0383 := by
  native_decide

/-- Coefficient term 384 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0384 : Poly :=
[
  term ((37054847000359116247638224582881700712 : Rat) / 199951576233746216094448921338256544665) [(0, 2), (11, 1), (13, 1)]
]

/-- Partial product 384 for generator 21. -/
def ep_Q2_024_partial_21_0384 : Poly :=
[
  term ((74109694000718232495276449165763401424 : Rat) / 199951576233746216094448921338256544665) [(0, 2), (10, 1), (11, 1), (13, 1)],
  term ((-37054847000359116247638224582881700712 : Rat) / 199951576233746216094448921338256544665) [(0, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 384 for generator 21. -/
theorem ep_Q2_024_partial_21_0384_valid :
    mulPoly ep_Q2_024_coefficient_21_0384
        ep_Q2_024_generator_21_0300_0399 =
      ep_Q2_024_partial_21_0384 := by
  native_decide

/-- Coefficient term 385 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0385 : Poly :=
[
  term ((49477231239731702693552490649936062071509401161872950265 : Rat) / 2231997485116847564411456234007038153921631415793907312) [(0, 2), (11, 1), (15, 1)]
]

/-- Partial product 385 for generator 21. -/
def ep_Q2_024_partial_21_0385 : Poly :=
[
  term ((49477231239731702693552490649936062071509401161872950265 : Rat) / 1115998742558423782205728117003519076960815707896953656) [(0, 2), (10, 1), (11, 1), (15, 1)],
  term ((-49477231239731702693552490649936062071509401161872950265 : Rat) / 2231997485116847564411456234007038153921631415793907312) [(0, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 385 for generator 21. -/
theorem ep_Q2_024_partial_21_0385_valid :
    mulPoly ep_Q2_024_coefficient_21_0385
        ep_Q2_024_generator_21_0300_0399 =
      ep_Q2_024_partial_21_0385 := by
  native_decide

/-- Coefficient term 386 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0386 : Poly :=
[
  term ((-8142139841485055 : Rat) / 4651120884612772) [(0, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 386 for generator 21. -/
def ep_Q2_024_partial_21_0386 : Poly :=
[
  term ((-8142139841485055 : Rat) / 2325560442306386) [(0, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((8142139841485055 : Rat) / 4651120884612772) [(0, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 386 for generator 21. -/
theorem ep_Q2_024_partial_21_0386_valid :
    mulPoly ep_Q2_024_coefficient_21_0386
        ep_Q2_024_generator_21_0300_0399 =
      ep_Q2_024_partial_21_0386 := by
  native_decide

/-- Coefficient term 387 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0387 : Poly :=
[
  term ((70466978772482239934996459597631649280840199701963986559 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(0, 2), (13, 1), (15, 1)]
]

/-- Partial product 387 for generator 21. -/
def ep_Q2_024_partial_21_0387 : Poly :=
[
  term ((70466978772482239934996459597631649280840199701963986559 : Rat) / 929998952132019818504773430836265897467346423247461380) [(0, 2), (10, 1), (13, 1), (15, 1)],
  term ((-70466978772482239934996459597631649280840199701963986559 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(0, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 387 for generator 21. -/
theorem ep_Q2_024_partial_21_0387_valid :
    mulPoly ep_Q2_024_coefficient_21_0387
        ep_Q2_024_generator_21_0300_0399 =
      ep_Q2_024_partial_21_0387 := by
  native_decide

/-- Coefficient term 388 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0388 : Poly :=
[
  term ((-11561200547643967 : Rat) / 2325560442306386) [(0, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 388 for generator 21. -/
def ep_Q2_024_partial_21_0388 : Poly :=
[
  term ((-11561200547643967 : Rat) / 1162780221153193) [(0, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((11561200547643967 : Rat) / 2325560442306386) [(0, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 388 for generator 21. -/
theorem ep_Q2_024_partial_21_0388_valid :
    mulPoly ep_Q2_024_coefficient_21_0388
        ep_Q2_024_generator_21_0300_0399 =
      ep_Q2_024_partial_21_0388 := by
  native_decide

/-- Coefficient term 389 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0389 : Poly :=
[
  term ((168182959066108226483251327004492353024 : Rat) / 199951576233746216094448921338256544665) [(0, 2), (13, 2)]
]

/-- Partial product 389 for generator 21. -/
def ep_Q2_024_partial_21_0389 : Poly :=
[
  term ((336365918132216452966502654008984706048 : Rat) / 199951576233746216094448921338256544665) [(0, 2), (10, 1), (13, 2)],
  term ((-168182959066108226483251327004492353024 : Rat) / 199951576233746216094448921338256544665) [(0, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 389 for generator 21. -/
theorem ep_Q2_024_partial_21_0389_valid :
    mulPoly ep_Q2_024_coefficient_21_0389
        ep_Q2_024_generator_21_0300_0399 =
      ep_Q2_024_partial_21_0389 := by
  native_decide

/-- Coefficient term 390 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0390 : Poly :=
[
  term ((228548346943902101627953017098607070723838550969230898109 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(0, 2), (15, 2)]
]

/-- Partial product 390 for generator 21. -/
def ep_Q2_024_partial_21_0390 : Poly :=
[
  term ((228548346943902101627953017098607070723838550969230898109 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(0, 2), (10, 1), (15, 2)],
  term ((-228548346943902101627953017098607070723838550969230898109 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(0, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 390 for generator 21. -/
theorem ep_Q2_024_partial_21_0390_valid :
    mulPoly ep_Q2_024_coefficient_21_0390
        ep_Q2_024_generator_21_0300_0399 =
      ep_Q2_024_partial_21_0390 := by
  native_decide

/-- Coefficient term 391 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0391 : Poly :=
[
  term ((-9851670194564511 : Rat) / 4651120884612772) [(0, 2), (15, 2), (16, 1)]
]

/-- Partial product 391 for generator 21. -/
def ep_Q2_024_partial_21_0391 : Poly :=
[
  term ((-9851670194564511 : Rat) / 2325560442306386) [(0, 2), (10, 1), (15, 2), (16, 1)],
  term ((9851670194564511 : Rat) / 4651120884612772) [(0, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 391 for generator 21. -/
theorem ep_Q2_024_partial_21_0391_valid :
    mulPoly ep_Q2_024_coefficient_21_0391
        ep_Q2_024_generator_21_0300_0399 =
      ep_Q2_024_partial_21_0391 := by
  native_decide

/-- Coefficient term 392 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0392 : Poly :=
[
  term ((1070272288403214792732786634564357540 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (2, 1), (3, 1)]
]

/-- Partial product 392 for generator 21. -/
def ep_Q2_024_partial_21_0392 : Poly :=
[
  term ((-1070272288403214792732786634564357540 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (2, 1), (3, 1)],
  term ((2140544576806429585465573269128715080 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (2, 1), (3, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 392 for generator 21. -/
theorem ep_Q2_024_partial_21_0392_valid :
    mulPoly ep_Q2_024_coefficient_21_0392
        ep_Q2_024_generator_21_0300_0399 =
      ep_Q2_024_partial_21_0392 := by
  native_decide

/-- Coefficient term 393 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0393 : Poly :=
[
  term ((-4281089153612859170931146538257430160 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (2, 1), (3, 1), (8, 1)]
]

/-- Partial product 393 for generator 21. -/
def ep_Q2_024_partial_21_0393 : Poly :=
[
  term ((4281089153612859170931146538257430160 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (2, 1), (3, 1), (8, 1)],
  term ((-8562178307225718341862293076514860320 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (2, 1), (3, 1), (8, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 393 for generator 21. -/
theorem ep_Q2_024_partial_21_0393_valid :
    mulPoly ep_Q2_024_coefficient_21_0393
        ep_Q2_024_generator_21_0300_0399 =
      ep_Q2_024_partial_21_0393 := by
  native_decide

/-- Coefficient term 394 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0394 : Poly :=
[
  term ((2140544576806429585465573269128715080 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (2, 1), (3, 1), (10, 1)]
]

/-- Partial product 394 for generator 21. -/
def ep_Q2_024_partial_21_0394 : Poly :=
[
  term ((-2140544576806429585465573269128715080 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (2, 1), (3, 1), (10, 1)],
  term ((4281089153612859170931146538257430160 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (2, 1), (3, 1), (10, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 394 for generator 21. -/
theorem ep_Q2_024_partial_21_0394_valid :
    mulPoly ep_Q2_024_coefficient_21_0394
        ep_Q2_024_generator_21_0300_0399 =
      ep_Q2_024_partial_21_0394 := by
  native_decide

/-- Coefficient term 395 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0395 : Poly :=
[
  term ((122037533701837243433936636706180311838 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 1), (5, 1)]
]

/-- Partial product 395 for generator 21. -/
def ep_Q2_024_partial_21_0395 : Poly :=
[
  term ((-122037533701837243433936636706180311838 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 1), (5, 1)],
  term ((244075067403674486867873273412360623676 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 1), (5, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 395 for generator 21. -/
theorem ep_Q2_024_partial_21_0395_valid :
    mulPoly ep_Q2_024_coefficient_21_0395
        ep_Q2_024_generator_21_0300_0399 =
      ep_Q2_024_partial_21_0395 := by
  native_decide

/-- Coefficient term 396 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0396 : Poly :=
[
  term ((244075067403674486867873273412360623676 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 1), (5, 1), (10, 1)]
]

/-- Partial product 396 for generator 21. -/
def ep_Q2_024_partial_21_0396 : Poly :=
[
  term ((-244075067403674486867873273412360623676 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 1), (5, 1), (10, 1)],
  term ((488150134807348973735746546824721247352 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 1), (5, 1), (10, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 396 for generator 21. -/
theorem ep_Q2_024_partial_21_0396_valid :
    mulPoly ep_Q2_024_coefficient_21_0396
        ep_Q2_024_generator_21_0300_0399 =
      ep_Q2_024_partial_21_0396 := by
  native_decide

/-- Coefficient term 397 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0397 : Poly :=
[
  term ((-259271587441775770073257543406488449392 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (7, 1)]
]

/-- Partial product 397 for generator 21. -/
def ep_Q2_024_partial_21_0397 : Poly :=
[
  term ((259271587441775770073257543406488449392 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (7, 1)],
  term ((-518543174883551540146515086812976898784 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (7, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 397 for generator 21. -/
theorem ep_Q2_024_partial_21_0397_valid :
    mulPoly ep_Q2_024_coefficient_21_0397
        ep_Q2_024_generator_21_0300_0399 =
      ep_Q2_024_partial_21_0397 := by
  native_decide

/-- Coefficient term 398 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0398 : Poly :=
[
  term ((-518543174883551540146515086812976898784 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (7, 1), (10, 1)]
]

/-- Partial product 398 for generator 21. -/
def ep_Q2_024_partial_21_0398 : Poly :=
[
  term ((518543174883551540146515086812976898784 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (7, 1), (10, 1)],
  term ((-1037086349767103080293030173625953797568 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (7, 1), (10, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 398 for generator 21. -/
theorem ep_Q2_024_partial_21_0398_valid :
    mulPoly ep_Q2_024_coefficient_21_0398
        ep_Q2_024_generator_21_0300_0399 =
      ep_Q2_024_partial_21_0398 := by
  native_decide

/-- Coefficient term 399 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0399 : Poly :=
[
  term ((51806412206066073505134446654562940732 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (2, 1), (8, 1), (9, 1)]
]

/-- Partial product 399 for generator 21. -/
def ep_Q2_024_partial_21_0399 : Poly :=
[
  term ((-51806412206066073505134446654562940732 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (2, 1), (8, 1), (9, 1)],
  term ((103612824412132147010268893309125881464 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (2, 1), (8, 1), (9, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 399 for generator 21. -/
theorem ep_Q2_024_partial_21_0399_valid :
    mulPoly ep_Q2_024_coefficient_21_0399
        ep_Q2_024_generator_21_0300_0399 =
      ep_Q2_024_partial_21_0399 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_024_partials_21_0300_0399 : List Poly :=
[
  ep_Q2_024_partial_21_0300,
  ep_Q2_024_partial_21_0301,
  ep_Q2_024_partial_21_0302,
  ep_Q2_024_partial_21_0303,
  ep_Q2_024_partial_21_0304,
  ep_Q2_024_partial_21_0305,
  ep_Q2_024_partial_21_0306,
  ep_Q2_024_partial_21_0307,
  ep_Q2_024_partial_21_0308,
  ep_Q2_024_partial_21_0309,
  ep_Q2_024_partial_21_0310,
  ep_Q2_024_partial_21_0311,
  ep_Q2_024_partial_21_0312,
  ep_Q2_024_partial_21_0313,
  ep_Q2_024_partial_21_0314,
  ep_Q2_024_partial_21_0315,
  ep_Q2_024_partial_21_0316,
  ep_Q2_024_partial_21_0317,
  ep_Q2_024_partial_21_0318,
  ep_Q2_024_partial_21_0319,
  ep_Q2_024_partial_21_0320,
  ep_Q2_024_partial_21_0321,
  ep_Q2_024_partial_21_0322,
  ep_Q2_024_partial_21_0323,
  ep_Q2_024_partial_21_0324,
  ep_Q2_024_partial_21_0325,
  ep_Q2_024_partial_21_0326,
  ep_Q2_024_partial_21_0327,
  ep_Q2_024_partial_21_0328,
  ep_Q2_024_partial_21_0329,
  ep_Q2_024_partial_21_0330,
  ep_Q2_024_partial_21_0331,
  ep_Q2_024_partial_21_0332,
  ep_Q2_024_partial_21_0333,
  ep_Q2_024_partial_21_0334,
  ep_Q2_024_partial_21_0335,
  ep_Q2_024_partial_21_0336,
  ep_Q2_024_partial_21_0337,
  ep_Q2_024_partial_21_0338,
  ep_Q2_024_partial_21_0339,
  ep_Q2_024_partial_21_0340,
  ep_Q2_024_partial_21_0341,
  ep_Q2_024_partial_21_0342,
  ep_Q2_024_partial_21_0343,
  ep_Q2_024_partial_21_0344,
  ep_Q2_024_partial_21_0345,
  ep_Q2_024_partial_21_0346,
  ep_Q2_024_partial_21_0347,
  ep_Q2_024_partial_21_0348,
  ep_Q2_024_partial_21_0349,
  ep_Q2_024_partial_21_0350,
  ep_Q2_024_partial_21_0351,
  ep_Q2_024_partial_21_0352,
  ep_Q2_024_partial_21_0353,
  ep_Q2_024_partial_21_0354,
  ep_Q2_024_partial_21_0355,
  ep_Q2_024_partial_21_0356,
  ep_Q2_024_partial_21_0357,
  ep_Q2_024_partial_21_0358,
  ep_Q2_024_partial_21_0359,
  ep_Q2_024_partial_21_0360,
  ep_Q2_024_partial_21_0361,
  ep_Q2_024_partial_21_0362,
  ep_Q2_024_partial_21_0363,
  ep_Q2_024_partial_21_0364,
  ep_Q2_024_partial_21_0365,
  ep_Q2_024_partial_21_0366,
  ep_Q2_024_partial_21_0367,
  ep_Q2_024_partial_21_0368,
  ep_Q2_024_partial_21_0369,
  ep_Q2_024_partial_21_0370,
  ep_Q2_024_partial_21_0371,
  ep_Q2_024_partial_21_0372,
  ep_Q2_024_partial_21_0373,
  ep_Q2_024_partial_21_0374,
  ep_Q2_024_partial_21_0375,
  ep_Q2_024_partial_21_0376,
  ep_Q2_024_partial_21_0377,
  ep_Q2_024_partial_21_0378,
  ep_Q2_024_partial_21_0379,
  ep_Q2_024_partial_21_0380,
  ep_Q2_024_partial_21_0381,
  ep_Q2_024_partial_21_0382,
  ep_Q2_024_partial_21_0383,
  ep_Q2_024_partial_21_0384,
  ep_Q2_024_partial_21_0385,
  ep_Q2_024_partial_21_0386,
  ep_Q2_024_partial_21_0387,
  ep_Q2_024_partial_21_0388,
  ep_Q2_024_partial_21_0389,
  ep_Q2_024_partial_21_0390,
  ep_Q2_024_partial_21_0391,
  ep_Q2_024_partial_21_0392,
  ep_Q2_024_partial_21_0393,
  ep_Q2_024_partial_21_0394,
  ep_Q2_024_partial_21_0395,
  ep_Q2_024_partial_21_0396,
  ep_Q2_024_partial_21_0397,
  ep_Q2_024_partial_21_0398,
  ep_Q2_024_partial_21_0399
]

/-- Sum of partial products in this block. -/
def ep_Q2_024_block_21_0300_0399 : Poly :=
[
  term ((2990296899089872 : Rat) / 1162780221153193) [(0, 1), (9, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((2694519291355687487821262101813731320612 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 2), (10, 1), (12, 1)],
  term ((22182620680173779953774126674016240448 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (9, 2), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-397491232950237887996184205565539271127191104441069376 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (9, 2), (10, 1), (12, 1), (15, 2)],
  term ((1054421534548864 : Rat) / 1162780221153193) [(0, 1), (9, 2), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((29126686030272528252131061851301363411063603590152468727 : Rat) / 836999056918817836654296087752639307720611780922715242) [(0, 1), (9, 2), (10, 1), (13, 1), (15, 1)],
  term ((-11093259647668850 : Rat) / 3488340663459579) [(0, 1), (9, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((1145102618491479879425293366692247727288 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (9, 2), (10, 1), (13, 2)],
  term ((-23766796833409985683353425305345223762306 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (9, 2), (10, 1), (14, 1)],
  term ((-24718892151813076716331430172917738532674352394274840954 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(0, 1), (9, 2), (10, 1), (15, 2)],
  term ((10962765984933080 : Rat) / 3488340663459579) [(0, 1), (9, 2), (10, 1), (15, 2), (16, 1)],
  term ((-1495148449544936 : Rat) / 1162780221153193) [(0, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-1347259645677843743910631050906865660306 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 2), (12, 1)],
  term ((-11091310340086889976887063337008120224 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (9, 2), (12, 1), (13, 1), (15, 1)],
  term ((198745616475118943998092102782769635563595552220534688 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (9, 2), (12, 1), (15, 2)],
  term ((-527210767274432 : Rat) / 1162780221153193) [(0, 1), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((-29126686030272528252131061851301363411063603590152468727 : Rat) / 1673998113837635673308592175505278615441223561845430484) [(0, 1), (9, 2), (13, 1), (15, 1)],
  term ((5546629823834425 : Rat) / 3488340663459579) [(0, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-572551309245739939712646683346123863644 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (9, 2), (13, 2)],
  term ((11883398416704992841676712652672611881153 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (9, 2), (14, 1)],
  term ((12359446075906538358165715086458869266337176197137420477 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(0, 1), (9, 2), (15, 2)],
  term ((-5481382992466540 : Rat) / 3488340663459579) [(0, 1), (9, 2), (15, 2), (16, 1)],
  term ((252450128745879785325220575726801684224 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (9, 3), (10, 1), (11, 1)],
  term ((-777898098459684340928357649480447106112 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 3), (10, 1), (13, 1)],
  term ((12301069069469927066412623315433253195720432156430141869 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(0, 1), (9, 3), (10, 1), (15, 1)],
  term ((-8223316472497148 : Rat) / 3488340663459579) [(0, 1), (9, 3), (10, 1), (15, 1), (16, 1)],
  term ((-126225064372939892662610287863400842112 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (9, 3), (11, 1)],
  term ((388949049229842170464178824740223553056 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 3), (13, 1)],
  term ((-12301069069469927066412623315433253195720432156430141869 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(0, 1), (9, 3), (15, 1)],
  term ((4111658236248574 : Rat) / 3488340663459579) [(0, 1), (9, 3), (15, 1), (16, 1)],
  term ((347118927025584704822178291624352315808 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 4)],
  term ((-694237854051169409644356583248704631616 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 4), (10, 1)],
  term ((-1436311941069943027349265291467551859956 : Rat) / 119970945740247729656669352802953926799) [(0, 1), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((593286787899895941887165466234683618608 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (10, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-20252641348034408839391540692055832082022486889027059413 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((4378595632339196 : Rat) / 1162780221153193) [(0, 1), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((97003339732148008443580288218011521455512563441091995157 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(0, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-14802658555111563 : Rat) / 1162780221153193) [(0, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-401176079183067760721884549110430820248 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (10, 1), (11, 1), (12, 2), (13, 1)],
  term ((7919389864836281022134782793813537210206407675858005151 : Rat) / 464999476066009909252386715418132948733673211623730690) [(0, 1), (10, 1), (11, 1), (12, 2), (15, 1)],
  term ((-6030315740575150 : Rat) / 1162780221153193) [(0, 1), (10, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((613397958684931604648171272293561308686 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (10, 1), (11, 1), (13, 1)],
  term ((5389089940248512487094205046480981922472 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((-54267504900238499965814543541110615119259775310726648457 : Rat) / 557999371279211891102864058501759538480407853948476828) [(0, 1), (10, 1), (11, 1), (13, 1), (15, 2)],
  term ((11083636152647727 : Rat) / 1162780221153193) [(0, 1), (10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((10739505361112646526841005371005761996637261642063016628 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (10, 1), (11, 1), (13, 2), (15, 1)],
  term ((-150661185588720 : Rat) / 1162780221153193) [(0, 1), (10, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-80945856112067634232098240062478093344 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (10, 1), (11, 1), (13, 3)],
  term ((-123634377194162065175984705896580339781478522958385658387 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(0, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((16636019461371833 : Rat) / 1162780221153193) [(0, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((64885598020952966377851495215056251811814535036016934143 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(0, 1), (10, 1), (11, 1), (15, 1)],
  term ((1956325894898514 : Rat) / 1162780221153193) [(0, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-4466115409796894554675042235934975650543774254263469936 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (10, 1), (11, 1), (15, 3)],
  term ((898255108859200 : Rat) / 1162780221153193) [(0, 1), (10, 1), (11, 1), (15, 3), (16, 1)],
  term ((-2858364389378608838764062023873769248962 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (10, 1), (11, 2)],
  term ((28428742065267769492165929239842551361 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (10, 1), (12, 1)],
  term ((-164450924956588150524026507372646906853948765195645650517 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(0, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((14038382648281759 : Rat) / 1162780221153193) [(0, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((2380398663818571320188016390755666108587303506505634153 : Rat) / 94576164623595235780146450593518565844136924398046920) [(0, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((106722977975844181 : Rat) / 6976681326919158) [(0, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((6799467051975367766150463909060930200332 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (10, 1), (12, 1), (13, 2)],
  term ((518902876483993937649997003986809833044 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (10, 1), (12, 1), (13, 2), (14, 1)],
  term ((8921151527862041881559355605928391576 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (10, 1), (12, 1), (14, 1)],
  term ((74345952726187858612662019219300612929374338180507452551 : Rat) / 929998952132019818504773430836265897467346423247461380) [(0, 1), (10, 1), (12, 1), (15, 2)],
  term ((-9120270510317319 : Rat) / 1162780221153193) [(0, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((26974210883668912519839817367166225675565343026070909313 : Rat) / 929998952132019818504773430836265897467346423247461380) [(0, 1), (10, 1), (12, 2), (13, 1), (15, 1)],
  term ((-5003541596661801 : Rat) / 1162780221153193) [(0, 1), (10, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-249797660548386285418524913337906498156 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (10, 1), (12, 2), (13, 2)],
  term ((-229527336284499272616790565321770397804284922840156028953 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(0, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((134306340333884689 : Rat) / 6976681326919158) [(0, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (10, 1), (13, 1), (14, 2), (15, 1)],
  term ((-833967741040952 : Rat) / 1162780221153193) [(0, 1), (10, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((23067307075869547358806303988692707427719055785974047211 : Rat) / 3719995808528079274019093723345063589869385692989845520) [(0, 1), (10, 1), (13, 1), (15, 1)],
  term ((-259402566307424417 : Rat) / 13953362653838316) [(0, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4054560809193521771557226633746294846048 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (10, 1), (13, 2)],
  term ((13255796008296372685338001426260167950336 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (10, 1), (13, 2), (14, 1)],
  term ((-4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (10, 1), (13, 2), (14, 2)],
  term ((-228548346943902101627953017098607070723838550969230898109 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(0, 1), (10, 1), (14, 1), (15, 2)],
  term ((9851670194564511 : Rat) / 1162780221153193) [(0, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-5626786232852480596986384644012788074352480312750530851 : Rat) / 464999476066009909252386715418132948733673211623730690) [(0, 1), (10, 2), (12, 1), (13, 1), (15, 1)],
  term ((3023265557210550 : Rat) / 1162780221153193) [(0, 1), (10, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((100295589691086672568098293862709145416 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (10, 2), (12, 1), (13, 2)],
  term ((-43459647497705333090949826472205091833136204953312197369 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(0, 1), (10, 2), (13, 1), (15, 1)],
  term ((15802051720330881 : Rat) / 2325560442306386) [(0, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((2719186737146186345811424515822883322492 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (10, 2), (13, 2)],
  term ((718155970534971513674632645733775929978 : Rat) / 119970945740247729656669352802953926799) [(0, 1), (11, 1), (12, 1), (13, 1)],
  term ((-296643393949947970943582733117341809304 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((20252641348034408839391540692055832082022486889027059413 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(0, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-2189297816169598 : Rat) / 1162780221153193) [(0, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-97003339732148008443580288218011521455512563441091995157 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(0, 1), (11, 1), (12, 1), (15, 1)],
  term ((14802658555111563 : Rat) / 2325560442306386) [(0, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((200588039591533880360942274555215410124 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (11, 1), (12, 2), (13, 1)],
  term ((-7919389864836281022134782793813537210206407675858005151 : Rat) / 929998952132019818504773430836265897467346423247461380) [(0, 1), (11, 1), (12, 2), (15, 1)],
  term ((3015157870287575 : Rat) / 1162780221153193) [(0, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-306698979342465802324085636146780654343 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (11, 1), (13, 1)],
  term ((-2694544970124256243547102523240490961236 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (11, 1), (13, 1), (14, 1)],
  term ((54267504900238499965814543541110615119259775310726648457 : Rat) / 1115998742558423782205728117003519076960815707896953656) [(0, 1), (11, 1), (13, 1), (15, 2)],
  term ((-11083636152647727 : Rat) / 2325560442306386) [(0, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-5369752680556323263420502685502880998318630821031508314 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (11, 1), (13, 2), (15, 1)],
  term ((75330592794360 : Rat) / 1162780221153193) [(0, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((40472928056033817116049120031239046672 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (11, 1), (13, 3)],
  term ((123634377194162065175984705896580339781478522958385658387 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(0, 1), (11, 1), (14, 1), (15, 1)],
  term ((-16636019461371833 : Rat) / 2325560442306386) [(0, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-64885598020952966377851495215056251811814535036016934143 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(0, 1), (11, 1), (15, 1)],
  term ((-978162947449257 : Rat) / 1162780221153193) [(0, 1), (11, 1), (15, 1), (16, 1)],
  term ((2233057704898447277337521117967487825271887127131734968 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (11, 1), (15, 3)],
  term ((-449127554429600 : Rat) / 1162780221153193) [(0, 1), (11, 1), (15, 3), (16, 1)],
  term ((1429182194689304419382031011936884624481 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (11, 2)],
  term ((-28428742065267769492165929239842551361 : Rat) / 399903152467492432188897842676513089330) [(0, 1), (12, 1)],
  term ((164450924956588150524026507372646906853948765195645650517 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(0, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-14038382648281759 : Rat) / 2325560442306386) [(0, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-106682803768180824309174659190507571960536025007329229921 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(0, 1), (12, 1), (13, 1), (15, 1)],
  term ((-115792774647475831 : Rat) / 13953362653838316) [(0, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3625398602792628896353453115721560677352 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (12, 1), (13, 2)],
  term ((-259451438241996968824998501993404916522 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (12, 1), (13, 2), (14, 1)],
  term ((-4460575763931020940779677802964195788 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (12, 1), (14, 1)],
  term ((-74345952726187858612662019219300612929374338180507452551 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(0, 1), (12, 1), (15, 2)],
  term ((9120270510317319 : Rat) / 2325560442306386) [(0, 1), (12, 1), (15, 2), (16, 1)],
  term ((-26974210883668912519839817367166225675565343026070909313 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(0, 1), (12, 2), (13, 1), (15, 1)],
  term ((5003541596661801 : Rat) / 2325560442306386) [(0, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((124898830274193142709262456668953249078 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (12, 2), (13, 2)],
  term ((229527336284499272616790565321770397804284922840156028953 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(0, 1), (13, 1), (14, 1), (15, 1)],
  term ((-134306340333884689 : Rat) / 13953362653838316) [(0, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (13, 1), (14, 2), (15, 1)],
  term ((416983870520476 : Rat) / 1162780221153193) [(0, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((10196170210917892866071761241756192202708574583669075079 : Rat) / 3719995808528079274019093723345063589869385692989845520) [(0, 1), (13, 1), (15, 1)],
  term ((105998205573215887 : Rat) / 13953362653838316) [(0, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2421929652575774715991013998803013769 : Rat) / 359912837220743188970008058408861780397) [(0, 1), (13, 2)],
  term ((-6627898004148186342669000713130083975168 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (13, 2), (14, 1)],
  term ((2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (13, 2), (14, 2)],
  term ((228548346943902101627953017098607070723838550969230898109 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(0, 1), (14, 1), (15, 2)],
  term ((-9851670194564511 : Rat) / 2325560442306386) [(0, 1), (14, 1), (15, 2), (16, 1)],
  term ((-18578835009886931389828064953150187574 : Rat) / 199951576233746216094448921338256544665) [(0, 2), (5, 1), (9, 1)],
  term ((37157670019773862779656129906300375148 : Rat) / 199951576233746216094448921338256544665) [(0, 2), (5, 1), (9, 1), (10, 1)],
  term ((9407326506538999398797487783872895160 : Rat) / 39990315246749243218889784267651308933) [(0, 2), (5, 1), (10, 1), (13, 1)],
  term ((-2354726156844551479976179518884154954213556855016731652 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 2), (5, 1), (10, 1), (15, 1)],
  term ((-854765176539728 : Rat) / 1162780221153193) [(0, 2), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((-4703663253269499699398743891936447580 : Rat) / 39990315246749243218889784267651308933) [(0, 2), (5, 1), (13, 1)],
  term ((1177363078422275739988089759442077477106778427508365826 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 2), (5, 1), (15, 1)],
  term ((427382588269864 : Rat) / 1162780221153193) [(0, 2), (5, 1), (15, 1), (16, 1)],
  term ((18578835009886931389828064953150187574 : Rat) / 199951576233746216094448921338256544665) [(0, 2), (7, 1), (9, 1)],
  term ((-37157670019773862779656129906300375148 : Rat) / 199951576233746216094448921338256544665) [(0, 2), (7, 1), (9, 1), (10, 1)],
  term ((-9407326506538999398797487783872895160 : Rat) / 39990315246749243218889784267651308933) [(0, 2), (7, 1), (10, 1), (13, 1)],
  term ((2354726156844551479976179518884154954213556855016731652 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 2), (7, 1), (10, 1), (15, 1)],
  term ((854765176539728 : Rat) / 1162780221153193) [(0, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((4703663253269499699398743891936447580 : Rat) / 39990315246749243218889784267651308933) [(0, 2), (7, 1), (13, 1)],
  term ((-1177363078422275739988089759442077477106778427508365826 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 2), (7, 1), (15, 1)],
  term ((-427382588269864 : Rat) / 1162780221153193) [(0, 2), (7, 1), (15, 1), (16, 1)],
  term ((-121295415410634520959867990571279420344 : Rat) / 199951576233746216094448921338256544665) [(0, 2), (9, 1), (10, 1), (11, 1)],
  term ((49794017268134571589590260644228965512 : Rat) / 199951576233746216094448921338256544665) [(0, 2), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((-550464729340465184219154740052350989658090880526284951 : Rat) / 92999895213201981850477343083626589746734642324746138) [(0, 2), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((1303385041578966 : Rat) / 1162780221153193) [(0, 2), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((1162728972946208661633471305941279447912 : Rat) / 359912837220743188970008058408861780397) [(0, 2), (9, 1), (10, 1), (13, 1)],
  term ((112534542309350711313968322710665848425027876375875013807 : Rat) / 929998952132019818504773430836265897467346423247461380) [(0, 2), (9, 1), (10, 1), (15, 1)],
  term ((-36885281294131109 : Rat) / 3488340663459579) [(0, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((60647707705317260479933995285639710172 : Rat) / 199951576233746216094448921338256544665) [(0, 2), (9, 1), (11, 1)],
  term ((-24897008634067285794795130322114482756 : Rat) / 199951576233746216094448921338256544665) [(0, 2), (9, 1), (12, 1), (13, 1)],
  term ((550464729340465184219154740052350989658090880526284951 : Rat) / 185999790426403963700954686167253179493469284649492276) [(0, 2), (9, 1), (12, 1), (15, 1)],
  term ((-651692520789483 : Rat) / 1162780221153193) [(0, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-581364486473104330816735652970639723956 : Rat) / 359912837220743188970008058408861780397) [(0, 2), (9, 1), (13, 1)],
  term ((-112534542309350711313968322710665848425027876375875013807 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(0, 2), (9, 1), (15, 1)],
  term ((36885281294131109 : Rat) / 6976681326919158) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((74109694000718232495276449165763401424 : Rat) / 199951576233746216094448921338256544665) [(0, 2), (10, 1), (11, 1), (13, 1)],
  term ((49477231239731702693552490649936062071509401161872950265 : Rat) / 1115998742558423782205728117003519076960815707896953656) [(0, 2), (10, 1), (11, 1), (15, 1)],
  term ((-8142139841485055 : Rat) / 2325560442306386) [(0, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((70466978772482239934996459597631649280840199701963986559 : Rat) / 929998952132019818504773430836265897467346423247461380) [(0, 2), (10, 1), (13, 1), (15, 1)],
  term ((-11561200547643967 : Rat) / 1162780221153193) [(0, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((336365918132216452966502654008984706048 : Rat) / 199951576233746216094448921338256544665) [(0, 2), (10, 1), (13, 2)],
  term ((228548346943902101627953017098607070723838550969230898109 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(0, 2), (10, 1), (15, 2)],
  term ((-9851670194564511 : Rat) / 2325560442306386) [(0, 2), (10, 1), (15, 2), (16, 1)],
  term ((-37054847000359116247638224582881700712 : Rat) / 199951576233746216094448921338256544665) [(0, 2), (11, 1), (13, 1)],
  term ((-49477231239731702693552490649936062071509401161872950265 : Rat) / 2231997485116847564411456234007038153921631415793907312) [(0, 2), (11, 1), (15, 1)],
  term ((8142139841485055 : Rat) / 4651120884612772) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((-70466978772482239934996459597631649280840199701963986559 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(0, 2), (13, 1), (15, 1)],
  term ((11561200547643967 : Rat) / 2325560442306386) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((-168182959066108226483251327004492353024 : Rat) / 199951576233746216094448921338256544665) [(0, 2), (13, 2)],
  term ((-228548346943902101627953017098607070723838550969230898109 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(0, 2), (15, 2)],
  term ((9851670194564511 : Rat) / 4651120884612772) [(0, 2), (15, 2), (16, 1)],
  term ((-1070272288403214792732786634564357540 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (2, 1), (3, 1)],
  term ((4281089153612859170931146538257430160 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (2, 1), (3, 1), (8, 1)],
  term ((-8562178307225718341862293076514860320 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (2, 1), (3, 1), (8, 1), (10, 1)],
  term ((4281089153612859170931146538257430160 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (2, 1), (3, 1), (10, 2)],
  term ((-122037533701837243433936636706180311838 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 1), (5, 1)],
  term ((488150134807348973735746546824721247352 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 1), (5, 1), (10, 2)],
  term ((259271587441775770073257543406488449392 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (7, 1)],
  term ((-1037086349767103080293030173625953797568 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (7, 1), (10, 2)],
  term ((-51806412206066073505134446654562940732 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (2, 1), (8, 1), (9, 1)],
  term ((103612824412132147010268893309125881464 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (2, 1), (8, 1), (9, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 21, terms 300 through 399. -/
theorem ep_Q2_024_block_21_0300_0399_valid :
    checkProductSumEq ep_Q2_024_partials_21_0300_0399
      ep_Q2_024_block_21_0300_0399 = true := by
  native_decide

end EpQ2024TermShards

end Patterns

end EndpointCertificate

end Problem97
