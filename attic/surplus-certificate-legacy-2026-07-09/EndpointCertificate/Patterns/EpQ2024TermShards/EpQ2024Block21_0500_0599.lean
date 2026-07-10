/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_024, term block 21:500-599

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_024`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2024TermShards

/-- Generator polynomial 21 for endpoint certificate `ep_Q2_024`. -/
def ep_Q2_024_generator_21_0500_0599 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(10, 1)]
]

/-- Coefficient term 500 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0500 : Poly :=
[
  term ((-115339596438127661687156049096618559456 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (4, 1), (12, 1), (13, 1)]
]

/-- Partial product 500 for generator 21. -/
def ep_Q2_024_partial_21_0500 : Poly :=
[
  term ((-230679192876255323374312098193237118912 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (4, 1), (10, 1), (12, 1), (13, 1)],
  term ((115339596438127661687156049096618559456 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (4, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 500 for generator 21. -/
theorem ep_Q2_024_partial_21_0500_valid :
    mulPoly ep_Q2_024_coefficient_21_0500
        ep_Q2_024_generator_21_0500_0599 =
      ep_Q2_024_partial_21_0500 := by
  native_decide

/-- Coefficient term 501 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0501 : Poly :=
[
  term ((854599457345296533016171656443809857919859483268059954 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (4, 1), (12, 1), (15, 1)]
]

/-- Partial product 501 for generator 21. -/
def ep_Q2_024_partial_21_0501 : Poly :=
[
  term ((1709198914690593066032343312887619715839718966536119908 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (4, 1), (10, 1), (12, 1), (15, 1)],
  term ((-854599457345296533016171656443809857919859483268059954 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (4, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 501 for generator 21. -/
theorem ep_Q2_024_partial_21_0501_valid :
    mulPoly ep_Q2_024_coefficient_21_0501
        ep_Q2_024_generator_21_0500_0599 =
      ep_Q2_024_partial_21_0501 := by
  native_decide

/-- Coefficient term 502 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0502 : Poly :=
[
  term ((-815359025230040 : Rat) / 1162780221153193) [(1, 1), (4, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 502 for generator 21. -/
def ep_Q2_024_partial_21_0502 : Poly :=
[
  term ((-1630718050460080 : Rat) / 1162780221153193) [(1, 1), (4, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((815359025230040 : Rat) / 1162780221153193) [(1, 1), (4, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 502 for generator 21. -/
theorem ep_Q2_024_partial_21_0502_valid :
    mulPoly ep_Q2_024_coefficient_21_0502
        ep_Q2_024_generator_21_0500_0599 =
      ep_Q2_024_partial_21_0502 := by
  native_decide

/-- Coefficient term 503 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0503 : Poly :=
[
  term ((322754652619014327413904075208344711628 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (4, 1), (13, 1)]
]

/-- Partial product 503 for generator 21. -/
def ep_Q2_024_partial_21_0503 : Poly :=
[
  term ((645509305238028654827808150416689423256 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (4, 1), (10, 1), (13, 1)],
  term ((-322754652619014327413904075208344711628 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (4, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 503 for generator 21. -/
theorem ep_Q2_024_partial_21_0503_valid :
    mulPoly ep_Q2_024_coefficient_21_0503
        ep_Q2_024_generator_21_0500_0599 =
      ep_Q2_024_partial_21_0503 := by
  native_decide

/-- Coefficient term 504 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0504 : Poly :=
[
  term ((-30267784736447798612613278086015225474391329205534420654 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(1, 1), (4, 1), (15, 1)]
]

/-- Partial product 504 for generator 21. -/
def ep_Q2_024_partial_21_0504 : Poly :=
[
  term ((-60535569472895597225226556172030450948782658411068841308 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(1, 1), (4, 1), (10, 1), (15, 1)],
  term ((30267784736447798612613278086015225474391329205534420654 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(1, 1), (4, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 504 for generator 21. -/
theorem ep_Q2_024_partial_21_0504_valid :
    mulPoly ep_Q2_024_coefficient_21_0504
        ep_Q2_024_generator_21_0500_0599 =
      ep_Q2_024_partial_21_0504 := by
  native_decide

/-- Coefficient term 505 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0505 : Poly :=
[
  term ((1958137860542752 : Rat) / 1162780221153193) [(1, 1), (4, 1), (15, 1), (16, 1)]
]

/-- Partial product 505 for generator 21. -/
def ep_Q2_024_partial_21_0505 : Poly :=
[
  term ((3916275721085504 : Rat) / 1162780221153193) [(1, 1), (4, 1), (10, 1), (15, 1), (16, 1)],
  term ((-1958137860542752 : Rat) / 1162780221153193) [(1, 1), (4, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 505 for generator 21. -/
theorem ep_Q2_024_partial_21_0505_valid :
    mulPoly ep_Q2_024_coefficient_21_0505
        ep_Q2_024_generator_21_0500_0599 =
      ep_Q2_024_partial_21_0505 := by
  native_decide

/-- Coefficient term 506 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0506 : Poly :=
[
  term ((-2527519998005839610287460742292507431023 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (5, 1)]
]

/-- Partial product 506 for generator 21. -/
def ep_Q2_024_partial_21_0506 : Poly :=
[
  term ((2527519998005839610287460742292507431023 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (5, 1)],
  term ((-5055039996011679220574921484585014862046 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (5, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 506 for generator 21. -/
theorem ep_Q2_024_partial_21_0506_valid :
    mulPoly ep_Q2_024_coefficient_21_0506
        ep_Q2_024_generator_21_0500_0599 =
      ep_Q2_024_partial_21_0506 := by
  native_decide

/-- Coefficient term 507 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0507 : Poly :=
[
  term ((7691827382884241332756558278315123043339 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (5, 1), (8, 1)]
]

/-- Partial product 507 for generator 21. -/
def ep_Q2_024_partial_21_0507 : Poly :=
[
  term ((-7691827382884241332756558278315123043339 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (5, 1), (8, 1)],
  term ((15383654765768482665513116556630246086678 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (5, 1), (8, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 507 for generator 21. -/
theorem ep_Q2_024_partial_21_0507_valid :
    mulPoly ep_Q2_024_coefficient_21_0507
        ep_Q2_024_generator_21_0500_0599 =
      ep_Q2_024_partial_21_0507 := by
  native_decide

/-- Coefficient term 508 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0508 : Poly :=
[
  term ((-51916682732587159756343578366982608688 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (8, 1), (9, 1), (12, 1), (13, 1)]
]

/-- Partial product 508 for generator 21. -/
def ep_Q2_024_partial_21_0508 : Poly :=
[
  term ((-103833365465174319512687156733965217376 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (8, 1), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((51916682732587159756343578366982608688 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (8, 1), (9, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 508 for generator 21. -/
theorem ep_Q2_024_partial_21_0508_valid :
    mulPoly ep_Q2_024_coefficient_21_0508
        ep_Q2_024_generator_21_0500_0599 =
      ep_Q2_024_partial_21_0508 := by
  native_decide

/-- Coefficient term 509 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0509 : Poly :=
[
  term ((519790077507635364246714238454931580267528154182411463 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (5, 1), (8, 1), (9, 1), (12, 1), (15, 1)]
]

/-- Partial product 509 for generator 21. -/
def ep_Q2_024_partial_21_0509 : Poly :=
[
  term ((1039580155015270728493428476909863160535056308364822926 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (5, 1), (8, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-519790077507635364246714238454931580267528154182411463 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (5, 1), (8, 1), (9, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 509 for generator 21. -/
theorem ep_Q2_024_partial_21_0509_valid :
    mulPoly ep_Q2_024_coefficient_21_0509
        ep_Q2_024_generator_21_0500_0599 =
      ep_Q2_024_partial_21_0509 := by
  native_decide

/-- Coefficient term 510 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0510 : Poly :=
[
  term ((-850957154578940 : Rat) / 1162780221153193) [(1, 1), (5, 1), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 510 for generator 21. -/
def ep_Q2_024_partial_21_0510 : Poly :=
[
  term ((-1701914309157880 : Rat) / 1162780221153193) [(1, 1), (5, 1), (8, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((850957154578940 : Rat) / 1162780221153193) [(1, 1), (5, 1), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 510 for generator 21. -/
theorem ep_Q2_024_partial_21_0510_valid :
    mulPoly ep_Q2_024_coefficient_21_0510
        ep_Q2_024_generator_21_0500_0599 =
      ep_Q2_024_partial_21_0510 := by
  native_decide

/-- Coefficient term 511 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0511 : Poly :=
[
  term ((866161346976921729008869342799551372232 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (5, 1), (8, 1), (9, 1), (13, 1)]
]

/-- Partial product 511 for generator 21. -/
def ep_Q2_024_partial_21_0511 : Poly :=
[
  term ((1732322693953843458017738685599102744464 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (5, 1), (8, 1), (9, 1), (10, 1), (13, 1)],
  term ((-866161346976921729008869342799551372232 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (5, 1), (8, 1), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 511 for generator 21. -/
theorem ep_Q2_024_partial_21_0511_valid :
    mulPoly ep_Q2_024_coefficient_21_0511
        ep_Q2_024_generator_21_0500_0599 =
      ep_Q2_024_partial_21_0511 := by
  native_decide

/-- Coefficient term 512 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0512 : Poly :=
[
  term ((24311462327325841715821792273981411838734259987160207707 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (5, 1), (8, 1), (9, 1), (15, 1)]
]

/-- Partial product 512 for generator 21. -/
def ep_Q2_024_partial_21_0512 : Poly :=
[
  term ((48622924654651683431643584547962823677468519974320415414 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (5, 1), (8, 1), (9, 1), (10, 1), (15, 1)],
  term ((-24311462327325841715821792273981411838734259987160207707 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (5, 1), (8, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 512 for generator 21. -/
theorem ep_Q2_024_partial_21_0512_valid :
    mulPoly ep_Q2_024_coefficient_21_0512
        ep_Q2_024_generator_21_0500_0599 =
      ep_Q2_024_partial_21_0512 := by
  native_decide

/-- Coefficient term 513 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0513 : Poly :=
[
  term ((-35421006354003964 : Rat) / 3488340663459579) [(1, 1), (5, 1), (8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 513 for generator 21. -/
def ep_Q2_024_partial_21_0513 : Poly :=
[
  term ((-70842012708007928 : Rat) / 3488340663459579) [(1, 1), (5, 1), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((35421006354003964 : Rat) / 3488340663459579) [(1, 1), (5, 1), (8, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 513 for generator 21. -/
theorem ep_Q2_024_partial_21_0513_valid :
    mulPoly ep_Q2_024_coefficient_21_0513
        ep_Q2_024_generator_21_0500_0599 =
      ep_Q2_024_partial_21_0513 := by
  native_decide

/-- Coefficient term 514 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0514 : Poly :=
[
  term ((-952743145992012822131987741397365806328 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (8, 1), (9, 2)]
]

/-- Partial product 514 for generator 21. -/
def ep_Q2_024_partial_21_0514 : Poly :=
[
  term ((952743145992012822131987741397365806328 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (8, 1), (9, 2)],
  term ((-1905486291984025644263975482794731612656 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (8, 1), (9, 2), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 514 for generator 21. -/
theorem ep_Q2_024_partial_21_0514_valid :
    mulPoly ep_Q2_024_coefficient_21_0514
        ep_Q2_024_generator_21_0500_0599 =
      ep_Q2_024_partial_21_0514 := by
  native_decide

/-- Coefficient term 515 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0515 : Poly :=
[
  term ((18487218660096223946260146026516252604 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (8, 1), (12, 1)]
]

/-- Partial product 515 for generator 21. -/
def ep_Q2_024_partial_21_0515 : Poly :=
[
  term ((36974437320192447892520292053032505208 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (8, 1), (10, 1), (12, 1)],
  term ((-18487218660096223946260146026516252604 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (8, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 515 for generator 21. -/
theorem ep_Q2_024_partial_21_0515_valid :
    mulPoly ep_Q2_024_coefficient_21_0515
        ep_Q2_024_generator_21_0500_0599 =
      ep_Q2_024_partial_21_0515 := by
  native_decide

/-- Coefficient term 516 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0516 : Poly :=
[
  term ((16527737784929168061123148869963794329901925980398052713 : Rat) / 557999371279211891102864058501759538480407853948476828) [(1, 1), (5, 1), (8, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 516 for generator 21. -/
def ep_Q2_024_partial_21_0516 : Poly :=
[
  term ((16527737784929168061123148869963794329901925980398052713 : Rat) / 278999685639605945551432029250879769240203926974238414) [(1, 1), (5, 1), (8, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-16527737784929168061123148869963794329901925980398052713 : Rat) / 557999371279211891102864058501759538480407853948476828) [(1, 1), (5, 1), (8, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 516 for generator 21. -/
theorem ep_Q2_024_partial_21_0516_valid :
    mulPoly ep_Q2_024_coefficient_21_0516
        ep_Q2_024_generator_21_0500_0599 =
      ep_Q2_024_partial_21_0516 := by
  native_decide

/-- Coefficient term 517 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0517 : Poly :=
[
  term ((-4569079916135479 : Rat) / 1162780221153193) [(1, 1), (5, 1), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 517 for generator 21. -/
def ep_Q2_024_partial_21_0517 : Poly :=
[
  term ((-9138159832270958 : Rat) / 1162780221153193) [(1, 1), (5, 1), (8, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((4569079916135479 : Rat) / 1162780221153193) [(1, 1), (5, 1), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 517 for generator 21. -/
theorem ep_Q2_024_partial_21_0517_valid :
    mulPoly ep_Q2_024_coefficient_21_0517
        ep_Q2_024_generator_21_0500_0599 =
      ep_Q2_024_partial_21_0517 := by
  native_decide

/-- Coefficient term 518 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0518 : Poly :=
[
  term ((-699598964377024284665984479369490528956 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (8, 1), (12, 1), (13, 2)]
]

/-- Partial product 518 for generator 21. -/
def ep_Q2_024_partial_21_0518 : Poly :=
[
  term ((-1399197928754048569331968958738981057912 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (8, 1), (10, 1), (12, 1), (13, 2)],
  term ((699598964377024284665984479369490528956 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (8, 1), (12, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 518 for generator 21. -/
theorem ep_Q2_024_partial_21_0518_valid :
    mulPoly ep_Q2_024_coefficient_21_0518
        ep_Q2_024_generator_21_0500_0599 =
      ep_Q2_024_partial_21_0518 := by
  native_decide

/-- Coefficient term 519 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0519 : Poly :=
[
  term ((-57065163418514028206963760297560614190626285699065528079 : Rat) / 929998952132019818504773430836265897467346423247461380) [(1, 1), (5, 1), (8, 1), (12, 1), (15, 2)]
]

/-- Partial product 519 for generator 21. -/
def ep_Q2_024_partial_21_0519 : Poly :=
[
  term ((-57065163418514028206963760297560614190626285699065528079 : Rat) / 464999476066009909252386715418132948733673211623730690) [(1, 1), (5, 1), (8, 1), (10, 1), (12, 1), (15, 2)],
  term ((57065163418514028206963760297560614190626285699065528079 : Rat) / 929998952132019818504773430836265897467346423247461380) [(1, 1), (5, 1), (8, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 519 for generator 21. -/
theorem ep_Q2_024_partial_21_0519_valid :
    mulPoly ep_Q2_024_coefficient_21_0519
        ep_Q2_024_generator_21_0500_0599 =
      ep_Q2_024_partial_21_0519 := by
  native_decide

/-- Coefficient term 520 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0520 : Poly :=
[
  term ((13204414907240807 : Rat) / 1162780221153193) [(1, 1), (5, 1), (8, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 520 for generator 21. -/
def ep_Q2_024_partial_21_0520 : Poly :=
[
  term ((26408829814481614 : Rat) / 1162780221153193) [(1, 1), (5, 1), (8, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-13204414907240807 : Rat) / 1162780221153193) [(1, 1), (5, 1), (8, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 520 for generator 21. -/
theorem ep_Q2_024_partial_21_0520_valid :
    mulPoly ep_Q2_024_coefficient_21_0520
        ep_Q2_024_generator_21_0500_0599 =
      ep_Q2_024_partial_21_0520 := by
  native_decide

/-- Coefficient term 521 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0521 : Poly :=
[
  term ((1681207212074162784866544631513075229980270038215301238 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (5, 1), (8, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 521 for generator 21. -/
def ep_Q2_024_partial_21_0521 : Poly :=
[
  term ((3362414424148325569733089263026150459960540076430602476 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (5, 1), (8, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-1681207212074162784866544631513075229980270038215301238 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (5, 1), (8, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 521 for generator 21. -/
theorem ep_Q2_024_partial_21_0521_valid :
    mulPoly ep_Q2_024_coefficient_21_0521
        ep_Q2_024_generator_21_0500_0599 =
      ep_Q2_024_partial_21_0521 := by
  native_decide

/-- Coefficient term 522 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0522 : Poly :=
[
  term ((833967741040952 : Rat) / 1162780221153193) [(1, 1), (5, 1), (8, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 522 for generator 21. -/
def ep_Q2_024_partial_21_0522 : Poly :=
[
  term ((1667935482081904 : Rat) / 1162780221153193) [(1, 1), (5, 1), (8, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-833967741040952 : Rat) / 1162780221153193) [(1, 1), (5, 1), (8, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 522 for generator 21. -/
theorem ep_Q2_024_partial_21_0522_valid :
    mulPoly ep_Q2_024_coefficient_21_0522
        ep_Q2_024_generator_21_0500_0599 =
      ep_Q2_024_partial_21_0522 := by
  native_decide

/-- Coefficient term 523 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0523 : Poly :=
[
  term ((-2298993319879189288962486085765995046746124666739705812891 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(1, 1), (5, 1), (8, 1), (13, 1), (15, 1)]
]

/-- Partial product 523 for generator 21. -/
def ep_Q2_024_partial_21_0523 : Poly :=
[
  term ((-2298993319879189288962486085765995046746124666739705812891 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(1, 1), (5, 1), (8, 1), (10, 1), (13, 1), (15, 1)],
  term ((2298993319879189288962486085765995046746124666739705812891 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(1, 1), (5, 1), (8, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 523 for generator 21. -/
theorem ep_Q2_024_partial_21_0523_valid :
    mulPoly ep_Q2_024_coefficient_21_0523
        ep_Q2_024_generator_21_0500_0599 =
      ep_Q2_024_partial_21_0523 := by
  native_decide

/-- Coefficient term 524 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0524 : Poly :=
[
  term ((-50972133270704143 : Rat) / 6976681326919158) [(1, 1), (5, 1), (8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 524 for generator 21. -/
def ep_Q2_024_partial_21_0524 : Poly :=
[
  term ((-50972133270704143 : Rat) / 3488340663459579) [(1, 1), (5, 1), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((50972133270704143 : Rat) / 6976681326919158) [(1, 1), (5, 1), (8, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 524 for generator 21. -/
theorem ep_Q2_024_partial_21_0524_valid :
    mulPoly ep_Q2_024_coefficient_21_0524
        ep_Q2_024_generator_21_0500_0599 =
      ep_Q2_024_partial_21_0524 := by
  native_decide

/-- Coefficient term 525 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0525 : Poly :=
[
  term ((8413519746542290140853554206891491552 : Rat) / 30501087900062982116102377831259472915) [(1, 1), (5, 1), (8, 1), (13, 2)]
]

/-- Partial product 525 for generator 21. -/
def ep_Q2_024_partial_21_0525 : Poly :=
[
  term ((16827039493084580281707108413782983104 : Rat) / 30501087900062982116102377831259472915) [(1, 1), (5, 1), (8, 1), (10, 1), (13, 2)],
  term ((-8413519746542290140853554206891491552 : Rat) / 30501087900062982116102377831259472915) [(1, 1), (5, 1), (8, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 525 for generator 21. -/
theorem ep_Q2_024_partial_21_0525_valid :
    mulPoly ep_Q2_024_coefficient_21_0525
        ep_Q2_024_generator_21_0500_0599 =
      ep_Q2_024_partial_21_0525 := by
  native_decide

/-- Coefficient term 526 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0526 : Poly :=
[
  term ((4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (8, 1), (13, 2), (14, 1)]
]

/-- Partial product 526 for generator 21. -/
def ep_Q2_024_partial_21_0526 : Poly :=
[
  term ((8486750246624093521424296941571253888 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (8, 1), (10, 1), (13, 2), (14, 1)],
  term ((-4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (8, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 526 for generator 21. -/
theorem ep_Q2_024_partial_21_0526_valid :
    mulPoly ep_Q2_024_coefficient_21_0526
        ep_Q2_024_generator_21_0500_0599 =
      ep_Q2_024_partial_21_0526 := by
  native_decide

/-- Coefficient term 527 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0527 : Poly :=
[
  term ((8921151527862041881559355605928391576 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (8, 1), (14, 1)]
]

/-- Partial product 527 for generator 21. -/
def ep_Q2_024_partial_21_0527 : Poly :=
[
  term ((17842303055724083763118711211856783152 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (8, 1), (10, 1), (14, 1)],
  term ((-8921151527862041881559355605928391576 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (8, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 527 for generator 21. -/
theorem ep_Q2_024_partial_21_0527_valid :
    mulPoly ep_Q2_024_coefficient_21_0527
        ep_Q2_024_generator_21_0500_0599 =
      ep_Q2_024_partial_21_0527 := by
  native_decide

/-- Coefficient term 528 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0528 : Poly :=
[
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (5, 1), (8, 1), (14, 1), (15, 2)]
]

/-- Partial product 528 for generator 21. -/
def ep_Q2_024_partial_21_0528 : Poly :=
[
  term ((-674456529895393409686477352003493571793009190155093372 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (5, 1), (8, 1), (10, 1), (14, 1), (15, 2)],
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (5, 1), (8, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 528 for generator 21. -/
theorem ep_Q2_024_partial_21_0528_valid :
    mulPoly ep_Q2_024_coefficient_21_0528
        ep_Q2_024_generator_21_0500_0599 =
      ep_Q2_024_partial_21_0528 := by
  native_decide

/-- Coefficient term 529 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0529 : Poly :=
[
  term ((-833967741040952 : Rat) / 1162780221153193) [(1, 1), (5, 1), (8, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 529 for generator 21. -/
def ep_Q2_024_partial_21_0529 : Poly :=
[
  term ((-1667935482081904 : Rat) / 1162780221153193) [(1, 1), (5, 1), (8, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((833967741040952 : Rat) / 1162780221153193) [(1, 1), (5, 1), (8, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 529 for generator 21. -/
theorem ep_Q2_024_partial_21_0529_valid :
    mulPoly ep_Q2_024_coefficient_21_0529
        ep_Q2_024_generator_21_0500_0599 =
      ep_Q2_024_partial_21_0529 := by
  native_decide

/-- Coefficient term 530 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0530 : Poly :=
[
  term ((546876380874813893016244252650101120235374598983391271769 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(1, 1), (5, 1), (8, 1), (15, 2)]
]

/-- Partial product 530 for generator 21. -/
def ep_Q2_024_partial_21_0530 : Poly :=
[
  term ((546876380874813893016244252650101120235374598983391271769 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(1, 1), (5, 1), (8, 1), (10, 1), (15, 2)],
  term ((-546876380874813893016244252650101120235374598983391271769 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(1, 1), (5, 1), (8, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 530 for generator 21. -/
theorem ep_Q2_024_partial_21_0530_valid :
    mulPoly ep_Q2_024_coefficient_21_0530
        ep_Q2_024_generator_21_0500_0599 =
      ep_Q2_024_partial_21_0530 := by
  native_decide

/-- Coefficient term 531 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0531 : Poly :=
[
  term ((13179894624814495 : Rat) / 6976681326919158) [(1, 1), (5, 1), (8, 1), (15, 2), (16, 1)]
]

/-- Partial product 531 for generator 21. -/
def ep_Q2_024_partial_21_0531 : Poly :=
[
  term ((13179894624814495 : Rat) / 3488340663459579) [(1, 1), (5, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((-13179894624814495 : Rat) / 6976681326919158) [(1, 1), (5, 1), (8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 531 for generator 21. -/
theorem ep_Q2_024_partial_21_0531_valid :
    mulPoly ep_Q2_024_coefficient_21_0531
        ep_Q2_024_generator_21_0500_0599 =
      ep_Q2_024_partial_21_0531 := by
  native_decide

/-- Coefficient term 532 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0532 : Poly :=
[
  term ((23549165966127120188708982684348114224 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (9, 1), (10, 1), (13, 1)]
]

/-- Partial product 532 for generator 21. -/
def ep_Q2_024_partial_21_0532 : Poly :=
[
  term ((-23549165966127120188708982684348114224 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (9, 1), (10, 1), (13, 1)],
  term ((47098331932254240377417965368696228448 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (9, 1), (10, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 532 for generator 21. -/
theorem ep_Q2_024_partial_21_0532_valid :
    mulPoly ep_Q2_024_coefficient_21_0532
        ep_Q2_024_generator_21_0500_0599 =
      ep_Q2_024_partial_21_0532 := by
  native_decide

/-- Coefficient term 533 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0533 : Poly :=
[
  term ((-2173624517752731263429423385757322935670570690431915648 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (5, 1), (9, 1), (10, 1), (15, 1)]
]

/-- Partial product 533 for generator 21. -/
def ep_Q2_024_partial_21_0533 : Poly :=
[
  term ((2173624517752731263429423385757322935670570690431915648 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (5, 1), (9, 1), (10, 1), (15, 1)],
  term ((-4347249035505462526858846771514645871341141380863831296 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (5, 1), (9, 1), (10, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 533 for generator 21. -/
theorem ep_Q2_024_partial_21_0533_valid :
    mulPoly ep_Q2_024_coefficient_21_0533
        ep_Q2_024_generator_21_0500_0599 =
      ep_Q2_024_partial_21_0533 := by
  native_decide

/-- Coefficient term 534 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0534 : Poly :=
[
  term ((-206941537023232 : Rat) / 1162780221153193) [(1, 1), (5, 1), (9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 534 for generator 21. -/
def ep_Q2_024_partial_21_0534 : Poly :=
[
  term ((206941537023232 : Rat) / 1162780221153193) [(1, 1), (5, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-413883074046464 : Rat) / 1162780221153193) [(1, 1), (5, 1), (9, 1), (10, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 534 for generator 21. -/
theorem ep_Q2_024_partial_21_0534_valid :
    mulPoly ep_Q2_024_coefficient_21_0534
        ep_Q2_024_generator_21_0500_0599 =
      ep_Q2_024_partial_21_0534 := by
  native_decide

/-- Coefficient term 535 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0535 : Poly :=
[
  term ((37157670019773862779656129906300375148 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (9, 1), (11, 1), (12, 1)]
]

/-- Partial product 535 for generator 21. -/
def ep_Q2_024_partial_21_0535 : Poly :=
[
  term ((74315340039547725559312259812600750296 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (9, 1), (10, 1), (11, 1), (12, 1)],
  term ((-37157670019773862779656129906300375148 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (9, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 535 for generator 21. -/
theorem ep_Q2_024_partial_21_0535_valid :
    mulPoly ep_Q2_024_coefficient_21_0535
        ep_Q2_024_generator_21_0500_0599 =
      ep_Q2_024_partial_21_0535 := by
  native_decide

/-- Coefficient term 536 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0536 : Poly :=
[
  term ((11774582983063560094354491342174057112 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (9, 1), (13, 1)]
]

/-- Partial product 536 for generator 21. -/
def ep_Q2_024_partial_21_0536 : Poly :=
[
  term ((23549165966127120188708982684348114224 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (9, 1), (10, 1), (13, 1)],
  term ((-11774582983063560094354491342174057112 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 536 for generator 21. -/
theorem ep_Q2_024_partial_21_0536_valid :
    mulPoly ep_Q2_024_coefficient_21_0536
        ep_Q2_024_generator_21_0500_0599 =
      ep_Q2_024_partial_21_0536 := by
  native_decide

/-- Coefficient term 537 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0537 : Poly :=
[
  term ((-1086812258876365631714711692878661467835285345215957824 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (5, 1), (9, 1), (15, 1)]
]

/-- Partial product 537 for generator 21. -/
def ep_Q2_024_partial_21_0537 : Poly :=
[
  term ((-2173624517752731263429423385757322935670570690431915648 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (5, 1), (9, 1), (10, 1), (15, 1)],
  term ((1086812258876365631714711692878661467835285345215957824 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (5, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 537 for generator 21. -/
theorem ep_Q2_024_partial_21_0537_valid :
    mulPoly ep_Q2_024_coefficient_21_0537
        ep_Q2_024_generator_21_0500_0599 =
      ep_Q2_024_partial_21_0537 := by
  native_decide

/-- Coefficient term 538 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0538 : Poly :=
[
  term ((-103470768511616 : Rat) / 1162780221153193) [(1, 1), (5, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 538 for generator 21. -/
def ep_Q2_024_partial_21_0538 : Poly :=
[
  term ((-206941537023232 : Rat) / 1162780221153193) [(1, 1), (5, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((103470768511616 : Rat) / 1162780221153193) [(1, 1), (5, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 538 for generator 21. -/
theorem ep_Q2_024_partial_21_0538_valid :
    mulPoly ep_Q2_024_coefficient_21_0538
        ep_Q2_024_generator_21_0500_0599 =
      ep_Q2_024_partial_21_0538 := by
  native_decide

/-- Coefficient term 539 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0539 : Poly :=
[
  term ((16890983628896808743407603036576568848 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (9, 2)]
]

/-- Partial product 539 for generator 21. -/
def ep_Q2_024_partial_21_0539 : Poly :=
[
  term ((-16890983628896808743407603036576568848 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (9, 2)],
  term ((33781967257793617486815206073153137696 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (9, 2), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 539 for generator 21. -/
theorem ep_Q2_024_partial_21_0539_valid :
    mulPoly ep_Q2_024_coefficient_21_0539
        ep_Q2_024_generator_21_0500_0599 =
      ep_Q2_024_partial_21_0539 := by
  native_decide

/-- Coefficient term 540 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0540 : Poly :=
[
  term ((33781967257793617486815206073153137696 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (9, 2), (10, 1)]
]

/-- Partial product 540 for generator 21. -/
def ep_Q2_024_partial_21_0540 : Poly :=
[
  term ((-33781967257793617486815206073153137696 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (9, 2), (10, 1)],
  term ((67563934515587234973630412146306275392 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (9, 2), (10, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 540 for generator 21. -/
theorem ep_Q2_024_partial_21_0540_valid :
    mulPoly ep_Q2_024_coefficient_21_0540
        ep_Q2_024_generator_21_0500_0599 =
      ep_Q2_024_partial_21_0540 := by
  native_decide

/-- Coefficient term 541 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0541 : Poly :=
[
  term ((-5055039996011679220574921484585014862046 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (5, 1), (10, 1)]
]

/-- Partial product 541 for generator 21. -/
def ep_Q2_024_partial_21_0541 : Poly :=
[
  term ((5055039996011679220574921484585014862046 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (5, 1), (10, 1)],
  term ((-10110079992023358441149842969170029724092 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (5, 1), (10, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 541 for generator 21. -/
theorem ep_Q2_024_partial_21_0541_valid :
    mulPoly ep_Q2_024_coefficient_21_0541
        ep_Q2_024_generator_21_0500_0599 =
      ep_Q2_024_partial_21_0541 := by
  native_decide

/-- Coefficient term 542 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0542 : Poly :=
[
  term ((1086812258876365631714711692878661467835285345215957824 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (5, 1), (10, 1), (13, 1), (15, 1)]
]

/-- Partial product 542 for generator 21. -/
def ep_Q2_024_partial_21_0542 : Poly :=
[
  term ((-1086812258876365631714711692878661467835285345215957824 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (5, 1), (10, 1), (13, 1), (15, 1)],
  term ((2173624517752731263429423385757322935670570690431915648 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (5, 1), (10, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 542 for generator 21. -/
theorem ep_Q2_024_partial_21_0542_valid :
    mulPoly ep_Q2_024_coefficient_21_0542
        ep_Q2_024_generator_21_0500_0599 =
      ep_Q2_024_partial_21_0542 := by
  native_decide

/-- Coefficient term 543 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0543 : Poly :=
[
  term ((103470768511616 : Rat) / 1162780221153193) [(1, 1), (5, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 543 for generator 21. -/
def ep_Q2_024_partial_21_0543 : Poly :=
[
  term ((-103470768511616 : Rat) / 1162780221153193) [(1, 1), (5, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((206941537023232 : Rat) / 1162780221153193) [(1, 1), (5, 1), (10, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 543 for generator 21. -/
theorem ep_Q2_024_partial_21_0543_valid :
    mulPoly ep_Q2_024_coefficient_21_0543
        ep_Q2_024_generator_21_0500_0599 =
      ep_Q2_024_partial_21_0543 := by
  native_decide

/-- Coefficient term 544 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0544 : Poly :=
[
  term ((-20220074797511964466058292860462341536 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (10, 1), (13, 2)]
]

/-- Partial product 544 for generator 21. -/
def ep_Q2_024_partial_21_0544 : Poly :=
[
  term ((20220074797511964466058292860462341536 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (10, 1), (13, 2)],
  term ((-40440149595023928932116585720924683072 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (10, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 544 for generator 21. -/
theorem ep_Q2_024_partial_21_0544_valid :
    mulPoly ep_Q2_024_coefficient_21_0544
        ep_Q2_024_generator_21_0500_0599 =
      ep_Q2_024_partial_21_0544 := by
  native_decide

/-- Coefficient term 545 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0545 : Poly :=
[
  term ((9407326506538999398797487783872895160 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (5, 1), (11, 1), (12, 1), (13, 1)]
]

/-- Partial product 545 for generator 21. -/
def ep_Q2_024_partial_21_0545 : Poly :=
[
  term ((18814653013077998797594975567745790320 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (5, 1), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((-9407326506538999398797487783872895160 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (5, 1), (11, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 545 for generator 21. -/
theorem ep_Q2_024_partial_21_0545_valid :
    mulPoly ep_Q2_024_coefficient_21_0545
        ep_Q2_024_generator_21_0500_0599 =
      ep_Q2_024_partial_21_0545 := by
  native_decide

/-- Coefficient term 546 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0546 : Poly :=
[
  term ((-2354726156844551479976179518884154954213556855016731652 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (5, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 546 for generator 21. -/
def ep_Q2_024_partial_21_0546 : Poly :=
[
  term ((-4709452313689102959952359037768309908427113710033463304 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (5, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((2354726156844551479976179518884154954213556855016731652 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (5, 1), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 546 for generator 21. -/
theorem ep_Q2_024_partial_21_0546_valid :
    mulPoly ep_Q2_024_coefficient_21_0546
        ep_Q2_024_generator_21_0500_0599 =
      ep_Q2_024_partial_21_0546 := by
  native_decide

/-- Coefficient term 547 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0547 : Poly :=
[
  term ((-854765176539728 : Rat) / 1162780221153193) [(1, 1), (5, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 547 for generator 21. -/
def ep_Q2_024_partial_21_0547 : Poly :=
[
  term ((-1709530353079456 : Rat) / 1162780221153193) [(1, 1), (5, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((854765176539728 : Rat) / 1162780221153193) [(1, 1), (5, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 547 for generator 21. -/
theorem ep_Q2_024_partial_21_0547_valid :
    mulPoly ep_Q2_024_coefficient_21_0547
        ep_Q2_024_generator_21_0500_0599 =
      ep_Q2_024_partial_21_0547 := by
  native_decide

/-- Coefficient term 548 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0548 : Poly :=
[
  term ((-2039266264353466269461279453205970887754 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (5, 1), (12, 1)]
]

/-- Partial product 548 for generator 21. -/
def ep_Q2_024_partial_21_0548 : Poly :=
[
  term ((-4078532528706932538922558906411941775508 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (5, 1), (10, 1), (12, 1)],
  term ((2039266264353466269461279453205970887754 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (5, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 548 for generator 21. -/
theorem ep_Q2_024_partial_21_0548_valid :
    mulPoly ep_Q2_024_coefficient_21_0548
        ep_Q2_024_generator_21_0500_0599 =
      ep_Q2_024_partial_21_0548 := by
  native_decide

/-- Coefficient term 549 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0549 : Poly :=
[
  term ((543406129438182815857355846439330733917642672607978912 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (5, 1), (13, 1), (15, 1)]
]

/-- Partial product 549 for generator 21. -/
def ep_Q2_024_partial_21_0549 : Poly :=
[
  term ((1086812258876365631714711692878661467835285345215957824 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (5, 1), (10, 1), (13, 1), (15, 1)],
  term ((-543406129438182815857355846439330733917642672607978912 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (5, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 549 for generator 21. -/
theorem ep_Q2_024_partial_21_0549_valid :
    mulPoly ep_Q2_024_coefficient_21_0549
        ep_Q2_024_generator_21_0500_0599 =
      ep_Q2_024_partial_21_0549 := by
  native_decide

/-- Coefficient term 550 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0550 : Poly :=
[
  term ((51735384255808 : Rat) / 1162780221153193) [(1, 1), (5, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 550 for generator 21. -/
def ep_Q2_024_partial_21_0550 : Poly :=
[
  term ((103470768511616 : Rat) / 1162780221153193) [(1, 1), (5, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-51735384255808 : Rat) / 1162780221153193) [(1, 1), (5, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 550 for generator 21. -/
theorem ep_Q2_024_partial_21_0550_valid :
    mulPoly ep_Q2_024_coefficient_21_0550
        ep_Q2_024_generator_21_0500_0599 =
      ep_Q2_024_partial_21_0550 := by
  native_decide

/-- Coefficient term 551 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0551 : Poly :=
[
  term ((-10110037398755982233029146430231170768 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (13, 2)]
]

/-- Partial product 551 for generator 21. -/
def ep_Q2_024_partial_21_0551 : Poly :=
[
  term ((-20220074797511964466058292860462341536 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (10, 1), (13, 2)],
  term ((10110037398755982233029146430231170768 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 551 for generator 21. -/
theorem ep_Q2_024_partial_21_0551_valid :
    mulPoly ep_Q2_024_coefficient_21_0551
        ep_Q2_024_generator_21_0500_0599 =
      ep_Q2_024_partial_21_0551 := by
  native_decide

/-- Coefficient term 552 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0552 : Poly :=
[
  term ((57424356410650916815904656776024181448 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 2), (8, 1), (9, 1)]
]

/-- Partial product 552 for generator 21. -/
def ep_Q2_024_partial_21_0552 : Poly :=
[
  term ((-57424356410650916815904656776024181448 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 2), (8, 1), (9, 1)],
  term ((114848712821301833631809313552048362896 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 2), (8, 1), (9, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 552 for generator 21. -/
theorem ep_Q2_024_partial_21_0552_valid :
    mulPoly ep_Q2_024_coefficient_21_0552
        ep_Q2_024_generator_21_0500_0599 =
      ep_Q2_024_partial_21_0552 := by
  native_decide

/-- Coefficient term 553 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0553 : Poly :=
[
  term ((319014959023338608753545314714028482032 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 2), (8, 1), (13, 1)]
]

/-- Partial product 553 for generator 21. -/
def ep_Q2_024_partial_21_0553 : Poly :=
[
  term ((638029918046677217507090629428056964064 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 2), (8, 1), (10, 1), (13, 1)],
  term ((-319014959023338608753545314714028482032 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 2), (8, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 553 for generator 21. -/
theorem ep_Q2_024_partial_21_0553_valid :
    mulPoly ep_Q2_024_coefficient_21_0553
        ep_Q2_024_generator_21_0500_0599 =
      ep_Q2_024_partial_21_0553 := by
  native_decide

/-- Coefficient term 554 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0554 : Poly :=
[
  term ((611290440484817771250536926183090648376587587301938898 : Rat) / 46499947606600990925238671541813294873367321162373069) [(1, 1), (5, 2), (8, 1), (15, 1)]
]

/-- Partial product 554 for generator 21. -/
def ep_Q2_024_partial_21_0554 : Poly :=
[
  term ((1222580880969635542501073852366181296753175174603877796 : Rat) / 46499947606600990925238671541813294873367321162373069) [(1, 1), (5, 2), (8, 1), (10, 1), (15, 1)],
  term ((-611290440484817771250536926183090648376587587301938898 : Rat) / 46499947606600990925238671541813294873367321162373069) [(1, 1), (5, 2), (8, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 554 for generator 21. -/
theorem ep_Q2_024_partial_21_0554_valid :
    mulPoly ep_Q2_024_coefficient_21_0554
        ep_Q2_024_generator_21_0500_0599 =
      ep_Q2_024_partial_21_0554 := by
  native_decide

/-- Coefficient term 555 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0555 : Poly :=
[
  term ((-2568602061245288 : Rat) / 1162780221153193) [(1, 1), (5, 2), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 555 for generator 21. -/
def ep_Q2_024_partial_21_0555 : Poly :=
[
  term ((-5137204122490576 : Rat) / 1162780221153193) [(1, 1), (5, 2), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((2568602061245288 : Rat) / 1162780221153193) [(1, 1), (5, 2), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 555 for generator 21. -/
theorem ep_Q2_024_partial_21_0555_valid :
    mulPoly ep_Q2_024_coefficient_21_0555
        ep_Q2_024_generator_21_0500_0599 =
      ep_Q2_024_partial_21_0555 := by
  native_decide

/-- Coefficient term 556 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0556 : Poly :=
[
  term ((259271587441775770073257543406488449392 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (7, 1)]
]

/-- Partial product 556 for generator 21. -/
def ep_Q2_024_partial_21_0556 : Poly :=
[
  term ((-259271587441775770073257543406488449392 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (7, 1)],
  term ((518543174883551540146515086812976898784 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (7, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 556 for generator 21. -/
theorem ep_Q2_024_partial_21_0556_valid :
    mulPoly ep_Q2_024_coefficient_21_0556
        ep_Q2_024_generator_21_0500_0599 =
      ep_Q2_024_partial_21_0556 := by
  native_decide

/-- Coefficient term 557 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0557 : Poly :=
[
  term ((129635793720887885036628771703244224696 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (7, 1), (8, 1)]
]

/-- Partial product 557 for generator 21. -/
def ep_Q2_024_partial_21_0557 : Poly :=
[
  term ((-129635793720887885036628771703244224696 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (7, 1), (8, 1)],
  term ((259271587441775770073257543406488449392 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (7, 1), (8, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 557 for generator 21. -/
theorem ep_Q2_024_partial_21_0557_valid :
    mulPoly ep_Q2_024_coefficient_21_0557
        ep_Q2_024_generator_21_0500_0599 =
      ep_Q2_024_partial_21_0557 := by
  native_decide

/-- Coefficient term 558 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0558 : Poly :=
[
  term ((518543174883551540146515086812976898784 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (7, 1), (10, 1)]
]

/-- Partial product 558 for generator 21. -/
def ep_Q2_024_partial_21_0558 : Poly :=
[
  term ((-518543174883551540146515086812976898784 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (7, 1), (10, 1)],
  term ((1037086349767103080293030173625953797568 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (7, 1), (10, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 558 for generator 21. -/
theorem ep_Q2_024_partial_21_0558_valid :
    mulPoly ep_Q2_024_coefficient_21_0558
        ep_Q2_024_generator_21_0500_0599 =
      ep_Q2_024_partial_21_0558 := by
  native_decide

/-- Coefficient term 559 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0559 : Poly :=
[
  term ((-129635793720887885036628771703244224696 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (7, 1), (12, 1)]
]

/-- Partial product 559 for generator 21. -/
def ep_Q2_024_partial_21_0559 : Poly :=
[
  term ((-259271587441775770073257543406488449392 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (7, 1), (10, 1), (12, 1)],
  term ((129635793720887885036628771703244224696 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (7, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 559 for generator 21. -/
theorem ep_Q2_024_partial_21_0559_valid :
    mulPoly ep_Q2_024_coefficient_21_0559
        ep_Q2_024_generator_21_0500_0599 =
      ep_Q2_024_partial_21_0559 := by
  native_decide

/-- Coefficient term 560 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0560 : Poly :=
[
  term ((-14273355843370170325454347843198506601153 : Rat) / 5398692558311147834550120876132926705955) [(1, 1), (8, 1), (9, 1)]
]

/-- Partial product 560 for generator 21. -/
def ep_Q2_024_partial_21_0560 : Poly :=
[
  term ((14273355843370170325454347843198506601153 : Rat) / 5398692558311147834550120876132926705955) [(1, 1), (8, 1), (9, 1)],
  term ((-28546711686740340650908695686397013202306 : Rat) / 5398692558311147834550120876132926705955) [(1, 1), (8, 1), (9, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 560 for generator 21. -/
theorem ep_Q2_024_partial_21_0560_valid :
    mulPoly ep_Q2_024_coefficient_21_0560
        ep_Q2_024_generator_21_0500_0599 =
      ep_Q2_024_partial_21_0560 := by
  native_decide

/-- Coefficient term 561 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0561 : Poly :=
[
  term ((-1583852881225004411573499758585693404262 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (8, 1), (9, 1), (12, 1)]
]

/-- Partial product 561 for generator 21. -/
def ep_Q2_024_partial_21_0561 : Poly :=
[
  term ((-3167705762450008823146999517171386808524 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (8, 1), (9, 1), (10, 1), (12, 1)],
  term ((1583852881225004411573499758585693404262 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (8, 1), (9, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 561 for generator 21. -/
theorem ep_Q2_024_partial_21_0561_valid :
    mulPoly ep_Q2_024_coefficient_21_0561
        ep_Q2_024_generator_21_0500_0599 =
      ep_Q2_024_partial_21_0561 := by
  native_decide

/-- Coefficient term 562 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0562 : Poly :=
[
  term ((-11091310340086889976887063337008120224 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 562 for generator 21. -/
def ep_Q2_024_partial_21_0562 : Poly :=
[
  term ((-22182620680173779953774126674016240448 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (8, 1), (9, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((11091310340086889976887063337008120224 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 562 for generator 21. -/
theorem ep_Q2_024_partial_21_0562_valid :
    mulPoly ep_Q2_024_coefficient_21_0562
        ep_Q2_024_generator_21_0500_0599 =
      ep_Q2_024_partial_21_0562 := by
  native_decide

/-- Coefficient term 563 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0563 : Poly :=
[
  term ((198745616475118943998092102782769635563595552220534688 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (8, 1), (9, 1), (12, 1), (15, 2)]
]

/-- Partial product 563 for generator 21. -/
def ep_Q2_024_partial_21_0563 : Poly :=
[
  term ((397491232950237887996184205565539271127191104441069376 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (8, 1), (9, 1), (10, 1), (12, 1), (15, 2)],
  term ((-198745616475118943998092102782769635563595552220534688 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (8, 1), (9, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 563 for generator 21. -/
theorem ep_Q2_024_partial_21_0563_valid :
    mulPoly ep_Q2_024_coefficient_21_0563
        ep_Q2_024_generator_21_0500_0599 =
      ep_Q2_024_partial_21_0563 := by
  native_decide

/-- Coefficient term 564 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0564 : Poly :=
[
  term ((-527210767274432 : Rat) / 1162780221153193) [(1, 1), (8, 1), (9, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 564 for generator 21. -/
def ep_Q2_024_partial_21_0564 : Poly :=
[
  term ((-1054421534548864 : Rat) / 1162780221153193) [(1, 1), (8, 1), (9, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((527210767274432 : Rat) / 1162780221153193) [(1, 1), (8, 1), (9, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 564 for generator 21. -/
theorem ep_Q2_024_partial_21_0564_valid :
    mulPoly ep_Q2_024_coefficient_21_0564
        ep_Q2_024_generator_21_0500_0599 =
      ep_Q2_024_partial_21_0564 := by
  native_decide

/-- Coefficient term 565 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0565 : Poly :=
[
  term ((-29126686030272528252131061851301363411063603590152468727 : Rat) / 1673998113837635673308592175505278615441223561845430484) [(1, 1), (8, 1), (9, 1), (13, 1), (15, 1)]
]

/-- Partial product 565 for generator 21. -/
def ep_Q2_024_partial_21_0565 : Poly :=
[
  term ((-29126686030272528252131061851301363411063603590152468727 : Rat) / 836999056918817836654296087752639307720611780922715242) [(1, 1), (8, 1), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((29126686030272528252131061851301363411063603590152468727 : Rat) / 1673998113837635673308592175505278615441223561845430484) [(1, 1), (8, 1), (9, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 565 for generator 21. -/
theorem ep_Q2_024_partial_21_0565_valid :
    mulPoly ep_Q2_024_coefficient_21_0565
        ep_Q2_024_generator_21_0500_0599 =
      ep_Q2_024_partial_21_0565 := by
  native_decide

/-- Coefficient term 566 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0566 : Poly :=
[
  term ((5546629823834425 : Rat) / 3488340663459579) [(1, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 566 for generator 21. -/
def ep_Q2_024_partial_21_0566 : Poly :=
[
  term ((11093259647668850 : Rat) / 3488340663459579) [(1, 1), (8, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5546629823834425 : Rat) / 3488340663459579) [(1, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 566 for generator 21. -/
theorem ep_Q2_024_partial_21_0566_valid :
    mulPoly ep_Q2_024_coefficient_21_0566
        ep_Q2_024_generator_21_0500_0599 =
      ep_Q2_024_partial_21_0566 := by
  native_decide

/-- Coefficient term 567 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0567 : Poly :=
[
  term ((-572551309245739939712646683346123863644 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (8, 1), (9, 1), (13, 2)]
]

/-- Partial product 567 for generator 21. -/
def ep_Q2_024_partial_21_0567 : Poly :=
[
  term ((-1145102618491479879425293366692247727288 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (8, 1), (9, 1), (10, 1), (13, 2)],
  term ((572551309245739939712646683346123863644 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (8, 1), (9, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 567 for generator 21. -/
theorem ep_Q2_024_partial_21_0567_valid :
    mulPoly ep_Q2_024_coefficient_21_0567
        ep_Q2_024_generator_21_0500_0599 =
      ep_Q2_024_partial_21_0567 := by
  native_decide

/-- Coefficient term 568 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0568 : Poly :=
[
  term ((11883398416704992841676712652672611881153 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (8, 1), (9, 1), (14, 1)]
]

/-- Partial product 568 for generator 21. -/
def ep_Q2_024_partial_21_0568 : Poly :=
[
  term ((23766796833409985683353425305345223762306 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (8, 1), (9, 1), (10, 1), (14, 1)],
  term ((-11883398416704992841676712652672611881153 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (8, 1), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 568 for generator 21. -/
theorem ep_Q2_024_partial_21_0568_valid :
    mulPoly ep_Q2_024_coefficient_21_0568
        ep_Q2_024_generator_21_0500_0599 =
      ep_Q2_024_partial_21_0568 := by
  native_decide

/-- Coefficient term 569 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0569 : Poly :=
[
  term ((12359446075906538358165715086458869266337176197137420477 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(1, 1), (8, 1), (9, 1), (15, 2)]
]

/-- Partial product 569 for generator 21. -/
def ep_Q2_024_partial_21_0569 : Poly :=
[
  term ((24718892151813076716331430172917738532674352394274840954 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(1, 1), (8, 1), (9, 1), (10, 1), (15, 2)],
  term ((-12359446075906538358165715086458869266337176197137420477 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(1, 1), (8, 1), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 569 for generator 21. -/
theorem ep_Q2_024_partial_21_0569_valid :
    mulPoly ep_Q2_024_coefficient_21_0569
        ep_Q2_024_generator_21_0500_0599 =
      ep_Q2_024_partial_21_0569 := by
  native_decide

/-- Coefficient term 570 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0570 : Poly :=
[
  term ((-5481382992466540 : Rat) / 3488340663459579) [(1, 1), (8, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 570 for generator 21. -/
def ep_Q2_024_partial_21_0570 : Poly :=
[
  term ((-10962765984933080 : Rat) / 3488340663459579) [(1, 1), (8, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((5481382992466540 : Rat) / 3488340663459579) [(1, 1), (8, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 570 for generator 21. -/
theorem ep_Q2_024_partial_21_0570_valid :
    mulPoly ep_Q2_024_coefficient_21_0570
        ep_Q2_024_generator_21_0500_0599 =
      ep_Q2_024_partial_21_0570 := by
  native_decide

/-- Coefficient term 571 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0571 : Poly :=
[
  term ((388949049229842170464178824740223553056 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (8, 1), (9, 2), (13, 1)]
]

/-- Partial product 571 for generator 21. -/
def ep_Q2_024_partial_21_0571 : Poly :=
[
  term ((777898098459684340928357649480447106112 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (8, 1), (9, 2), (10, 1), (13, 1)],
  term ((-388949049229842170464178824740223553056 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (8, 1), (9, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 571 for generator 21. -/
theorem ep_Q2_024_partial_21_0571_valid :
    mulPoly ep_Q2_024_coefficient_21_0571
        ep_Q2_024_generator_21_0500_0599 =
      ep_Q2_024_partial_21_0571 := by
  native_decide

/-- Coefficient term 572 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0572 : Poly :=
[
  term ((-12301069069469927066412623315433253195720432156430141869 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(1, 1), (8, 1), (9, 2), (15, 1)]
]

/-- Partial product 572 for generator 21. -/
def ep_Q2_024_partial_21_0572 : Poly :=
[
  term ((-12301069069469927066412623315433253195720432156430141869 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(1, 1), (8, 1), (9, 2), (10, 1), (15, 1)],
  term ((12301069069469927066412623315433253195720432156430141869 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(1, 1), (8, 1), (9, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 572 for generator 21. -/
theorem ep_Q2_024_partial_21_0572_valid :
    mulPoly ep_Q2_024_coefficient_21_0572
        ep_Q2_024_generator_21_0500_0599 =
      ep_Q2_024_partial_21_0572 := by
  native_decide

/-- Coefficient term 573 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0573 : Poly :=
[
  term ((4111658236248574 : Rat) / 3488340663459579) [(1, 1), (8, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 573 for generator 21. -/
def ep_Q2_024_partial_21_0573 : Poly :=
[
  term ((8223316472497148 : Rat) / 3488340663459579) [(1, 1), (8, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((-4111658236248574 : Rat) / 3488340663459579) [(1, 1), (8, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 573 for generator 21. -/
theorem ep_Q2_024_partial_21_0573_valid :
    mulPoly ep_Q2_024_coefficient_21_0573
        ep_Q2_024_generator_21_0500_0599 =
      ep_Q2_024_partial_21_0573 := by
  native_decide

/-- Coefficient term 574 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0574 : Poly :=
[
  term ((347118927025584704822178291624352315808 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (8, 1), (9, 3)]
]

/-- Partial product 574 for generator 21. -/
def ep_Q2_024_partial_21_0574 : Poly :=
[
  term ((-347118927025584704822178291624352315808 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (8, 1), (9, 3)],
  term ((694237854051169409644356583248704631616 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (8, 1), (9, 3), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 574 for generator 21. -/
theorem ep_Q2_024_partial_21_0574_valid :
    mulPoly ep_Q2_024_coefficient_21_0574
        ep_Q2_024_generator_21_0500_0599 =
      ep_Q2_024_partial_21_0574 := by
  native_decide

/-- Coefficient term 575 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0575 : Poly :=
[
  term ((1429182194689304419382031011936884624481 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (8, 1), (11, 1)]
]

/-- Partial product 575 for generator 21. -/
def ep_Q2_024_partial_21_0575 : Poly :=
[
  term ((2858364389378608838764062023873769248962 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (8, 1), (10, 1), (11, 1)],
  term ((-1429182194689304419382031011936884624481 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (8, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 575 for generator 21. -/
theorem ep_Q2_024_partial_21_0575_valid :
    mulPoly ep_Q2_024_coefficient_21_0575
        ep_Q2_024_generator_21_0500_0599 =
      ep_Q2_024_partial_21_0575 := by
  native_decide

/-- Coefficient term 576 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0576 : Poly :=
[
  term ((4356564189724637708906259429022804199456 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (8, 1), (12, 1), (13, 1)]
]

/-- Partial product 576 for generator 21. -/
def ep_Q2_024_partial_21_0576 : Poly :=
[
  term ((8713128379449275417812518858045608398912 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (8, 1), (10, 1), (12, 1), (13, 1)],
  term ((-4356564189724637708906259429022804199456 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (8, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 576 for generator 21. -/
theorem ep_Q2_024_partial_21_0576_valid :
    mulPoly ep_Q2_024_coefficient_21_0576
        ep_Q2_024_generator_21_0500_0599 =
      ep_Q2_024_partial_21_0576 := by
  native_decide

/-- Coefficient term 577 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0577 : Poly :=
[
  term ((-172337401456158824305693594333174250126 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (8, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 577 for generator 21. -/
def ep_Q2_024_partial_21_0577 : Poly :=
[
  term ((-344674802912317648611387188666348500252 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (8, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((172337401456158824305693594333174250126 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (8, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 577 for generator 21. -/
theorem ep_Q2_024_partial_21_0577_valid :
    mulPoly ep_Q2_024_coefficient_21_0577
        ep_Q2_024_generator_21_0500_0599 =
      ep_Q2_024_partial_21_0577 := by
  native_decide

/-- Coefficient term 578 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0578 : Poly :=
[
  term ((42897185966036484390082822956409864505349421492734777533 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(1, 1), (8, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 578 for generator 21. -/
def ep_Q2_024_partial_21_0578 : Poly :=
[
  term ((42897185966036484390082822956409864505349421492734777533 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(1, 1), (8, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-42897185966036484390082822956409864505349421492734777533 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(1, 1), (8, 1), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 578 for generator 21. -/
theorem ep_Q2_024_partial_21_0578_valid :
    mulPoly ep_Q2_024_coefficient_21_0578
        ep_Q2_024_generator_21_0500_0599 =
      ep_Q2_024_partial_21_0578 := by
  native_decide

/-- Coefficient term 579 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0579 : Poly :=
[
  term ((-277384937357655 : Rat) / 2325560442306386) [(1, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 579 for generator 21. -/
def ep_Q2_024_partial_21_0579 : Poly :=
[
  term ((-277384937357655 : Rat) / 1162780221153193) [(1, 1), (8, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((277384937357655 : Rat) / 2325560442306386) [(1, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 579 for generator 21. -/
theorem ep_Q2_024_partial_21_0579_valid :
    mulPoly ep_Q2_024_coefficient_21_0579
        ep_Q2_024_generator_21_0500_0599 =
      ep_Q2_024_partial_21_0579 := by
  native_decide

/-- Coefficient term 580 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0580 : Poly :=
[
  term ((-2790009293275740138936205997796948742986167698945351423 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(1, 1), (8, 1), (12, 1), (15, 1)]
]

/-- Partial product 580 for generator 21. -/
def ep_Q2_024_partial_21_0580 : Poly :=
[
  term ((-2790009293275740138936205997796948742986167698945351423 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(1, 1), (8, 1), (10, 1), (12, 1), (15, 1)],
  term ((2790009293275740138936205997796948742986167698945351423 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(1, 1), (8, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 580 for generator 21. -/
theorem ep_Q2_024_partial_21_0580_valid :
    mulPoly ep_Q2_024_coefficient_21_0580
        ep_Q2_024_generator_21_0500_0599 =
      ep_Q2_024_partial_21_0580 := by
  native_decide

/-- Coefficient term 581 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0581 : Poly :=
[
  term ((131503738079788567 : Rat) / 13953362653838316) [(1, 1), (8, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 581 for generator 21. -/
def ep_Q2_024_partial_21_0581 : Poly :=
[
  term ((131503738079788567 : Rat) / 6976681326919158) [(1, 1), (8, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-131503738079788567 : Rat) / 13953362653838316) [(1, 1), (8, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 581 for generator 21. -/
theorem ep_Q2_024_partial_21_0581_valid :
    mulPoly ep_Q2_024_coefficient_21_0581
        ep_Q2_024_generator_21_0500_0599 =
      ep_Q2_024_partial_21_0581 := by
  native_decide

/-- Coefficient term 582 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0582 : Poly :=
[
  term ((-124898830274193142709262456668953249078 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (8, 1), (12, 2), (13, 1)]
]

/-- Partial product 582 for generator 21. -/
def ep_Q2_024_partial_21_0582 : Poly :=
[
  term ((-249797660548386285418524913337906498156 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (8, 1), (10, 1), (12, 2), (13, 1)],
  term ((124898830274193142709262456668953249078 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (8, 1), (12, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 582 for generator 21. -/
theorem ep_Q2_024_partial_21_0582_valid :
    mulPoly ep_Q2_024_coefficient_21_0582
        ep_Q2_024_generator_21_0500_0599 =
      ep_Q2_024_partial_21_0582 := by
  native_decide

/-- Coefficient term 583 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0583 : Poly :=
[
  term ((26974210883668912519839817367166225675565343026070909313 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(1, 1), (8, 1), (12, 2), (15, 1)]
]

/-- Partial product 583 for generator 21. -/
def ep_Q2_024_partial_21_0583 : Poly :=
[
  term ((26974210883668912519839817367166225675565343026070909313 : Rat) / 929998952132019818504773430836265897467346423247461380) [(1, 1), (8, 1), (10, 1), (12, 2), (15, 1)],
  term ((-26974210883668912519839817367166225675565343026070909313 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(1, 1), (8, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 583 for generator 21. -/
theorem ep_Q2_024_partial_21_0583_valid :
    mulPoly ep_Q2_024_coefficient_21_0583
        ep_Q2_024_generator_21_0500_0599 =
      ep_Q2_024_partial_21_0583 := by
  native_decide

/-- Coefficient term 584 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0584 : Poly :=
[
  term ((-5003541596661801 : Rat) / 2325560442306386) [(1, 1), (8, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 584 for generator 21. -/
def ep_Q2_024_partial_21_0584 : Poly :=
[
  term ((-5003541596661801 : Rat) / 1162780221153193) [(1, 1), (8, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((5003541596661801 : Rat) / 2325560442306386) [(1, 1), (8, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 584 for generator 21. -/
theorem ep_Q2_024_partial_21_0584_valid :
    mulPoly ep_Q2_024_coefficient_21_0584
        ep_Q2_024_generator_21_0500_0599 =
      ep_Q2_024_partial_21_0584 := by
  native_decide

/-- Coefficient term 585 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0585 : Poly :=
[
  term ((33205499331019002408747835458120414914 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (8, 1), (13, 1)]
]

/-- Partial product 585 for generator 21. -/
def ep_Q2_024_partial_21_0585 : Poly :=
[
  term ((66410998662038004817495670916240829828 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (8, 1), (10, 1), (13, 1)],
  term ((-33205499331019002408747835458120414914 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (8, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 585 for generator 21. -/
theorem ep_Q2_024_partial_21_0585_valid :
    mulPoly ep_Q2_024_coefficient_21_0585
        ep_Q2_024_generator_21_0500_0599 =
      ep_Q2_024_partial_21_0585 := by
  native_decide

/-- Coefficient term 586 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0586 : Poly :=
[
  term ((9731724517667531014946304995107149754744 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (8, 1), (13, 1), (14, 1)]
]

/-- Partial product 586 for generator 21. -/
def ep_Q2_024_partial_21_0586 : Poly :=
[
  term ((19463449035335062029892609990214299509488 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (8, 1), (10, 1), (13, 1), (14, 1)],
  term ((-9731724517667531014946304995107149754744 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (8, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 586 for generator 21. -/
theorem ep_Q2_024_partial_21_0586_valid :
    mulPoly ep_Q2_024_coefficient_21_0586
        ep_Q2_024_generator_21_0500_0599 =
      ep_Q2_024_partial_21_0586 := by
  native_decide

/-- Coefficient term 587 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0587 : Poly :=
[
  term ((2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (8, 1), (13, 1), (14, 2)]
]

/-- Partial product 587 for generator 21. -/
def ep_Q2_024_partial_21_0587 : Poly :=
[
  term ((4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (8, 1), (10, 1), (13, 1), (14, 2)],
  term ((-2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (8, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 587 for generator 21. -/
theorem ep_Q2_024_partial_21_0587_valid :
    mulPoly ep_Q2_024_coefficient_21_0587
        ep_Q2_024_generator_21_0500_0599 =
      ep_Q2_024_partial_21_0587 := by
  native_decide

/-- Coefficient term 588 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0588 : Poly :=
[
  term ((-46606006548196236713541705654221512448 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (8, 1), (13, 1), (15, 2)]
]

/-- Partial product 588 for generator 21. -/
def ep_Q2_024_partial_21_0588 : Poly :=
[
  term ((-93212013096392473427083411308443024896 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (8, 1), (10, 1), (13, 1), (15, 2)],
  term ((46606006548196236713541705654221512448 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (8, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 588 for generator 21. -/
theorem ep_Q2_024_partial_21_0588_valid :
    mulPoly ep_Q2_024_coefficient_21_0588
        ep_Q2_024_generator_21_0500_0599 =
      ep_Q2_024_partial_21_0588 := by
  native_decide

/-- Coefficient term 589 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0589 : Poly :=
[
  term ((-86883956888373154677565351407430153815648725261687772569 : Rat) / 3719995808528079274019093723345063589869385692989845520) [(1, 1), (8, 1), (14, 1), (15, 1)]
]

/-- Partial product 589 for generator 21. -/
def ep_Q2_024_partial_21_0589 : Poly :=
[
  term ((-86883956888373154677565351407430153815648725261687772569 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(1, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((86883956888373154677565351407430153815648725261687772569 : Rat) / 3719995808528079274019093723345063589869385692989845520) [(1, 1), (8, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 589 for generator 21. -/
theorem ep_Q2_024_partial_21_0589_valid :
    mulPoly ep_Q2_024_coefficient_21_0589
        ep_Q2_024_generator_21_0500_0599 =
      ep_Q2_024_partial_21_0589 := by
  native_decide

/-- Coefficient term 590 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0590 : Poly :=
[
  term ((60129224652876851 : Rat) / 13953362653838316) [(1, 1), (8, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 590 for generator 21. -/
def ep_Q2_024_partial_21_0590 : Poly :=
[
  term ((60129224652876851 : Rat) / 6976681326919158) [(1, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-60129224652876851 : Rat) / 13953362653838316) [(1, 1), (8, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 590 for generator 21. -/
theorem ep_Q2_024_partial_21_0590_valid :
    mulPoly ep_Q2_024_coefficient_21_0590
        ep_Q2_024_generator_21_0500_0599 =
      ep_Q2_024_partial_21_0590 := by
  native_decide

/-- Coefficient term 591 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0591 : Poly :=
[
  term ((168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (8, 1), (14, 2), (15, 1)]
]

/-- Partial product 591 for generator 21. -/
def ep_Q2_024_partial_21_0591 : Poly :=
[
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (8, 1), (10, 1), (14, 2), (15, 1)],
  term ((-168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (8, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 591 for generator 21. -/
theorem ep_Q2_024_partial_21_0591_valid :
    mulPoly ep_Q2_024_coefficient_21_0591
        ep_Q2_024_generator_21_0500_0599 =
      ep_Q2_024_partial_21_0591 := by
  native_decide

/-- Coefficient term 592 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0592 : Poly :=
[
  term ((416983870520476 : Rat) / 1162780221153193) [(1, 1), (8, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 592 for generator 21. -/
def ep_Q2_024_partial_21_0592 : Poly :=
[
  term ((833967741040952 : Rat) / 1162780221153193) [(1, 1), (8, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((-416983870520476 : Rat) / 1162780221153193) [(1, 1), (8, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 592 for generator 21. -/
theorem ep_Q2_024_partial_21_0592_valid :
    mulPoly ep_Q2_024_coefficient_21_0592
        ep_Q2_024_generator_21_0500_0599 =
      ep_Q2_024_partial_21_0592 := by
  native_decide

/-- Coefficient term 593 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0593 : Poly :=
[
  term ((63235000842975854703597614395624623353546682444744162259 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(1, 1), (8, 1), (15, 1)]
]

/-- Partial product 593 for generator 21. -/
def ep_Q2_024_partial_21_0593 : Poly :=
[
  term ((63235000842975854703597614395624623353546682444744162259 : Rat) / 929998952132019818504773430836265897467346423247461380) [(1, 1), (8, 1), (10, 1), (15, 1)],
  term ((-63235000842975854703597614395624623353546682444744162259 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(1, 1), (8, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 593 for generator 21. -/
theorem ep_Q2_024_partial_21_0593_valid :
    mulPoly ep_Q2_024_coefficient_21_0593
        ep_Q2_024_generator_21_0500_0599 =
      ep_Q2_024_partial_21_0593 := by
  native_decide

/-- Coefficient term 594 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0594 : Poly :=
[
  term ((-4842600466899879 : Rat) / 2325560442306386) [(1, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 594 for generator 21. -/
def ep_Q2_024_partial_21_0594 : Poly :=
[
  term ((-4842600466899879 : Rat) / 1162780221153193) [(1, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((4842600466899879 : Rat) / 2325560442306386) [(1, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 594 for generator 21. -/
theorem ep_Q2_024_partial_21_0594_valid :
    mulPoly ep_Q2_024_coefficient_21_0594
        ep_Q2_024_generator_21_0500_0599 =
      ep_Q2_024_partial_21_0594 := by
  native_decide

/-- Coefficient term 595 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0595 : Poly :=
[
  term ((-4466115409796894554675042235934975650543774254263469936 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (8, 1), (15, 3)]
]

/-- Partial product 595 for generator 21. -/
def ep_Q2_024_partial_21_0595 : Poly :=
[
  term ((-8932230819593789109350084471869951301087548508526939872 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (8, 1), (10, 1), (15, 3)],
  term ((4466115409796894554675042235934975650543774254263469936 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (8, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 595 for generator 21. -/
theorem ep_Q2_024_partial_21_0595_valid :
    mulPoly ep_Q2_024_coefficient_21_0595
        ep_Q2_024_generator_21_0500_0599 =
      ep_Q2_024_partial_21_0595 := by
  native_decide

/-- Coefficient term 596 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0596 : Poly :=
[
  term ((898255108859200 : Rat) / 1162780221153193) [(1, 1), (8, 1), (15, 3), (16, 1)]
]

/-- Partial product 596 for generator 21. -/
def ep_Q2_024_partial_21_0596 : Poly :=
[
  term ((1796510217718400 : Rat) / 1162780221153193) [(1, 1), (8, 1), (10, 1), (15, 3), (16, 1)],
  term ((-898255108859200 : Rat) / 1162780221153193) [(1, 1), (8, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 596 for generator 21. -/
theorem ep_Q2_024_partial_21_0596_valid :
    mulPoly ep_Q2_024_coefficient_21_0596
        ep_Q2_024_generator_21_0500_0599 =
      ep_Q2_024_partial_21_0596 := by
  native_decide

/-- Coefficient term 597 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0597 : Poly :=
[
  term ((11185121374989664010869274704317749388532 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (8, 2), (9, 1)]
]

/-- Partial product 597 for generator 21. -/
def ep_Q2_024_partial_21_0597 : Poly :=
[
  term ((-11185121374989664010869274704317749388532 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (8, 2), (9, 1)],
  term ((22370242749979328021738549408635498777064 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (8, 2), (9, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 597 for generator 21. -/
theorem ep_Q2_024_partial_21_0597_valid :
    mulPoly ep_Q2_024_coefficient_21_0597
        ep_Q2_024_generator_21_0500_0599 =
      ep_Q2_024_partial_21_0597 := by
  native_decide

/-- Coefficient term 598 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0598 : Poly :=
[
  term ((24897008634067285794795130322114482756 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (8, 2), (12, 1), (13, 1)]
]

/-- Partial product 598 for generator 21. -/
def ep_Q2_024_partial_21_0598 : Poly :=
[
  term ((49794017268134571589590260644228965512 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (8, 2), (10, 1), (12, 1), (13, 1)],
  term ((-24897008634067285794795130322114482756 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (8, 2), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 598 for generator 21. -/
theorem ep_Q2_024_partial_21_0598_valid :
    mulPoly ep_Q2_024_coefficient_21_0598
        ep_Q2_024_generator_21_0500_0599 =
      ep_Q2_024_partial_21_0598 := by
  native_decide

/-- Coefficient term 599 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0599 : Poly :=
[
  term ((-917441215567441973698591233420584982763484800877141585 : Rat) / 185999790426403963700954686167253179493469284649492276) [(1, 1), (8, 2), (12, 1), (15, 1)]
]

/-- Partial product 599 for generator 21. -/
def ep_Q2_024_partial_21_0599 : Poly :=
[
  term ((-917441215567441973698591233420584982763484800877141585 : Rat) / 92999895213201981850477343083626589746734642324746138) [(1, 1), (8, 2), (10, 1), (12, 1), (15, 1)],
  term ((917441215567441973698591233420584982763484800877141585 : Rat) / 185999790426403963700954686167253179493469284649492276) [(1, 1), (8, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 599 for generator 21. -/
theorem ep_Q2_024_partial_21_0599_valid :
    mulPoly ep_Q2_024_coefficient_21_0599
        ep_Q2_024_generator_21_0500_0599 =
      ep_Q2_024_partial_21_0599 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_024_partials_21_0500_0599 : List Poly :=
[
  ep_Q2_024_partial_21_0500,
  ep_Q2_024_partial_21_0501,
  ep_Q2_024_partial_21_0502,
  ep_Q2_024_partial_21_0503,
  ep_Q2_024_partial_21_0504,
  ep_Q2_024_partial_21_0505,
  ep_Q2_024_partial_21_0506,
  ep_Q2_024_partial_21_0507,
  ep_Q2_024_partial_21_0508,
  ep_Q2_024_partial_21_0509,
  ep_Q2_024_partial_21_0510,
  ep_Q2_024_partial_21_0511,
  ep_Q2_024_partial_21_0512,
  ep_Q2_024_partial_21_0513,
  ep_Q2_024_partial_21_0514,
  ep_Q2_024_partial_21_0515,
  ep_Q2_024_partial_21_0516,
  ep_Q2_024_partial_21_0517,
  ep_Q2_024_partial_21_0518,
  ep_Q2_024_partial_21_0519,
  ep_Q2_024_partial_21_0520,
  ep_Q2_024_partial_21_0521,
  ep_Q2_024_partial_21_0522,
  ep_Q2_024_partial_21_0523,
  ep_Q2_024_partial_21_0524,
  ep_Q2_024_partial_21_0525,
  ep_Q2_024_partial_21_0526,
  ep_Q2_024_partial_21_0527,
  ep_Q2_024_partial_21_0528,
  ep_Q2_024_partial_21_0529,
  ep_Q2_024_partial_21_0530,
  ep_Q2_024_partial_21_0531,
  ep_Q2_024_partial_21_0532,
  ep_Q2_024_partial_21_0533,
  ep_Q2_024_partial_21_0534,
  ep_Q2_024_partial_21_0535,
  ep_Q2_024_partial_21_0536,
  ep_Q2_024_partial_21_0537,
  ep_Q2_024_partial_21_0538,
  ep_Q2_024_partial_21_0539,
  ep_Q2_024_partial_21_0540,
  ep_Q2_024_partial_21_0541,
  ep_Q2_024_partial_21_0542,
  ep_Q2_024_partial_21_0543,
  ep_Q2_024_partial_21_0544,
  ep_Q2_024_partial_21_0545,
  ep_Q2_024_partial_21_0546,
  ep_Q2_024_partial_21_0547,
  ep_Q2_024_partial_21_0548,
  ep_Q2_024_partial_21_0549,
  ep_Q2_024_partial_21_0550,
  ep_Q2_024_partial_21_0551,
  ep_Q2_024_partial_21_0552,
  ep_Q2_024_partial_21_0553,
  ep_Q2_024_partial_21_0554,
  ep_Q2_024_partial_21_0555,
  ep_Q2_024_partial_21_0556,
  ep_Q2_024_partial_21_0557,
  ep_Q2_024_partial_21_0558,
  ep_Q2_024_partial_21_0559,
  ep_Q2_024_partial_21_0560,
  ep_Q2_024_partial_21_0561,
  ep_Q2_024_partial_21_0562,
  ep_Q2_024_partial_21_0563,
  ep_Q2_024_partial_21_0564,
  ep_Q2_024_partial_21_0565,
  ep_Q2_024_partial_21_0566,
  ep_Q2_024_partial_21_0567,
  ep_Q2_024_partial_21_0568,
  ep_Q2_024_partial_21_0569,
  ep_Q2_024_partial_21_0570,
  ep_Q2_024_partial_21_0571,
  ep_Q2_024_partial_21_0572,
  ep_Q2_024_partial_21_0573,
  ep_Q2_024_partial_21_0574,
  ep_Q2_024_partial_21_0575,
  ep_Q2_024_partial_21_0576,
  ep_Q2_024_partial_21_0577,
  ep_Q2_024_partial_21_0578,
  ep_Q2_024_partial_21_0579,
  ep_Q2_024_partial_21_0580,
  ep_Q2_024_partial_21_0581,
  ep_Q2_024_partial_21_0582,
  ep_Q2_024_partial_21_0583,
  ep_Q2_024_partial_21_0584,
  ep_Q2_024_partial_21_0585,
  ep_Q2_024_partial_21_0586,
  ep_Q2_024_partial_21_0587,
  ep_Q2_024_partial_21_0588,
  ep_Q2_024_partial_21_0589,
  ep_Q2_024_partial_21_0590,
  ep_Q2_024_partial_21_0591,
  ep_Q2_024_partial_21_0592,
  ep_Q2_024_partial_21_0593,
  ep_Q2_024_partial_21_0594,
  ep_Q2_024_partial_21_0595,
  ep_Q2_024_partial_21_0596,
  ep_Q2_024_partial_21_0597,
  ep_Q2_024_partial_21_0598,
  ep_Q2_024_partial_21_0599
]

/-- Sum of partial products in this block. -/
def ep_Q2_024_block_21_0500_0599 : Poly :=
[
  term ((-230679192876255323374312098193237118912 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (4, 1), (10, 1), (12, 1), (13, 1)],
  term ((1709198914690593066032343312887619715839718966536119908 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (4, 1), (10, 1), (12, 1), (15, 1)],
  term ((-1630718050460080 : Rat) / 1162780221153193) [(1, 1), (4, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((645509305238028654827808150416689423256 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (4, 1), (10, 1), (13, 1)],
  term ((-60535569472895597225226556172030450948782658411068841308 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(1, 1), (4, 1), (10, 1), (15, 1)],
  term ((3916275721085504 : Rat) / 1162780221153193) [(1, 1), (4, 1), (10, 1), (15, 1), (16, 1)],
  term ((115339596438127661687156049096618559456 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (4, 1), (12, 1), (13, 1)],
  term ((-854599457345296533016171656443809857919859483268059954 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (4, 1), (12, 1), (15, 1)],
  term ((815359025230040 : Rat) / 1162780221153193) [(1, 1), (4, 1), (12, 1), (15, 1), (16, 1)],
  term ((-322754652619014327413904075208344711628 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (4, 1), (13, 1)],
  term ((30267784736447798612613278086015225474391329205534420654 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(1, 1), (4, 1), (15, 1)],
  term ((-1958137860542752 : Rat) / 1162780221153193) [(1, 1), (4, 1), (15, 1), (16, 1)],
  term ((2527519998005839610287460742292507431023 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (5, 1)],
  term ((-7691827382884241332756558278315123043339 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (5, 1), (8, 1)],
  term ((-103833365465174319512687156733965217376 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (8, 1), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((1039580155015270728493428476909863160535056308364822926 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (5, 1), (8, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-1701914309157880 : Rat) / 1162780221153193) [(1, 1), (5, 1), (8, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((1732322693953843458017738685599102744464 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (5, 1), (8, 1), (9, 1), (10, 1), (13, 1)],
  term ((48622924654651683431643584547962823677468519974320415414 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (5, 1), (8, 1), (9, 1), (10, 1), (15, 1)],
  term ((-70842012708007928 : Rat) / 3488340663459579) [(1, 1), (5, 1), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((51916682732587159756343578366982608688 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (8, 1), (9, 1), (12, 1), (13, 1)],
  term ((-519790077507635364246714238454931580267528154182411463 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (5, 1), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((850957154578940 : Rat) / 1162780221153193) [(1, 1), (5, 1), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-866161346976921729008869342799551372232 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (5, 1), (8, 1), (9, 1), (13, 1)],
  term ((-24311462327325841715821792273981411838734259987160207707 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (5, 1), (8, 1), (9, 1), (15, 1)],
  term ((35421006354003964 : Rat) / 3488340663459579) [(1, 1), (5, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((952743145992012822131987741397365806328 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (8, 1), (9, 2)],
  term ((-1905486291984025644263975482794731612656 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (8, 1), (9, 2), (10, 1)],
  term ((15383654765768482665513116556630246086678 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (5, 1), (8, 1), (10, 1)],
  term ((36974437320192447892520292053032505208 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (8, 1), (10, 1), (12, 1)],
  term ((16527737784929168061123148869963794329901925980398052713 : Rat) / 278999685639605945551432029250879769240203926974238414) [(1, 1), (5, 1), (8, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-9138159832270958 : Rat) / 1162780221153193) [(1, 1), (5, 1), (8, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1399197928754048569331968958738981057912 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (8, 1), (10, 1), (12, 1), (13, 2)],
  term ((-57065163418514028206963760297560614190626285699065528079 : Rat) / 464999476066009909252386715418132948733673211623730690) [(1, 1), (5, 1), (8, 1), (10, 1), (12, 1), (15, 2)],
  term ((26408829814481614 : Rat) / 1162780221153193) [(1, 1), (5, 1), (8, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((3362414424148325569733089263026150459960540076430602476 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (5, 1), (8, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((1667935482081904 : Rat) / 1162780221153193) [(1, 1), (5, 1), (8, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2298993319879189288962486085765995046746124666739705812891 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(1, 1), (5, 1), (8, 1), (10, 1), (13, 1), (15, 1)],
  term ((-50972133270704143 : Rat) / 3488340663459579) [(1, 1), (5, 1), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((16827039493084580281707108413782983104 : Rat) / 30501087900062982116102377831259472915) [(1, 1), (5, 1), (8, 1), (10, 1), (13, 2)],
  term ((8486750246624093521424296941571253888 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (8, 1), (10, 1), (13, 2), (14, 1)],
  term ((17842303055724083763118711211856783152 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (8, 1), (10, 1), (14, 1)],
  term ((-674456529895393409686477352003493571793009190155093372 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (5, 1), (8, 1), (10, 1), (14, 1), (15, 2)],
  term ((-1667935482081904 : Rat) / 1162780221153193) [(1, 1), (5, 1), (8, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((546876380874813893016244252650101120235374598983391271769 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(1, 1), (5, 1), (8, 1), (10, 1), (15, 2)],
  term ((13179894624814495 : Rat) / 3488340663459579) [(1, 1), (5, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((-18487218660096223946260146026516252604 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (8, 1), (12, 1)],
  term ((-16527737784929168061123148869963794329901925980398052713 : Rat) / 557999371279211891102864058501759538480407853948476828) [(1, 1), (5, 1), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((4569079916135479 : Rat) / 1162780221153193) [(1, 1), (5, 1), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((699598964377024284665984479369490528956 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (8, 1), (12, 1), (13, 2)],
  term ((57065163418514028206963760297560614190626285699065528079 : Rat) / 929998952132019818504773430836265897467346423247461380) [(1, 1), (5, 1), (8, 1), (12, 1), (15, 2)],
  term ((-13204414907240807 : Rat) / 1162780221153193) [(1, 1), (5, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-1681207212074162784866544631513075229980270038215301238 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (5, 1), (8, 1), (13, 1), (14, 1), (15, 1)],
  term ((-833967741040952 : Rat) / 1162780221153193) [(1, 1), (5, 1), (8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((2298993319879189288962486085765995046746124666739705812891 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(1, 1), (5, 1), (8, 1), (13, 1), (15, 1)],
  term ((50972133270704143 : Rat) / 6976681326919158) [(1, 1), (5, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-8413519746542290140853554206891491552 : Rat) / 30501087900062982116102377831259472915) [(1, 1), (5, 1), (8, 1), (13, 2)],
  term ((-4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (8, 1), (13, 2), (14, 1)],
  term ((-8921151527862041881559355605928391576 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (8, 1), (14, 1)],
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (5, 1), (8, 1), (14, 1), (15, 2)],
  term ((833967741040952 : Rat) / 1162780221153193) [(1, 1), (5, 1), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((-546876380874813893016244252650101120235374598983391271769 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(1, 1), (5, 1), (8, 1), (15, 2)],
  term ((-13179894624814495 : Rat) / 6976681326919158) [(1, 1), (5, 1), (8, 1), (15, 2), (16, 1)],
  term ((74315340039547725559312259812600750296 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (9, 1), (10, 1), (11, 1), (12, 1)],
  term ((47098331932254240377417965368696228448 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (9, 1), (10, 2), (13, 1)],
  term ((-4347249035505462526858846771514645871341141380863831296 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (5, 1), (9, 1), (10, 2), (15, 1)],
  term ((-413883074046464 : Rat) / 1162780221153193) [(1, 1), (5, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-37157670019773862779656129906300375148 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (9, 1), (11, 1), (12, 1)],
  term ((-11774582983063560094354491342174057112 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (9, 1), (13, 1)],
  term ((1086812258876365631714711692878661467835285345215957824 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (5, 1), (9, 1), (15, 1)],
  term ((103470768511616 : Rat) / 1162780221153193) [(1, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((-16890983628896808743407603036576568848 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (9, 2)],
  term ((67563934515587234973630412146306275392 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (9, 2), (10, 2)],
  term ((18814653013077998797594975567745790320 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (5, 1), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((-4709452313689102959952359037768309908427113710033463304 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (5, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-1709530353079456 : Rat) / 1162780221153193) [(1, 1), (5, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-4078532528706932538922558906411941775508 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (5, 1), (10, 1), (12, 1)],
  term ((-10110079992023358441149842969170029724092 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (5, 1), (10, 2)],
  term ((2173624517752731263429423385757322935670570690431915648 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (5, 1), (10, 2), (13, 1), (15, 1)],
  term ((206941537023232 : Rat) / 1162780221153193) [(1, 1), (5, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-40440149595023928932116585720924683072 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (10, 2), (13, 2)],
  term ((-9407326506538999398797487783872895160 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (5, 1), (11, 1), (12, 1), (13, 1)],
  term ((2354726156844551479976179518884154954213556855016731652 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (5, 1), (11, 1), (12, 1), (15, 1)],
  term ((854765176539728 : Rat) / 1162780221153193) [(1, 1), (5, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((2039266264353466269461279453205970887754 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (5, 1), (12, 1)],
  term ((-543406129438182815857355846439330733917642672607978912 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (5, 1), (13, 1), (15, 1)],
  term ((-51735384255808 : Rat) / 1162780221153193) [(1, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((10110037398755982233029146430231170768 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (13, 2)],
  term ((-57424356410650916815904656776024181448 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 2), (8, 1), (9, 1)],
  term ((114848712821301833631809313552048362896 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 2), (8, 1), (9, 1), (10, 1)],
  term ((638029918046677217507090629428056964064 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 2), (8, 1), (10, 1), (13, 1)],
  term ((1222580880969635542501073852366181296753175174603877796 : Rat) / 46499947606600990925238671541813294873367321162373069) [(1, 1), (5, 2), (8, 1), (10, 1), (15, 1)],
  term ((-5137204122490576 : Rat) / 1162780221153193) [(1, 1), (5, 2), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-319014959023338608753545314714028482032 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 2), (8, 1), (13, 1)],
  term ((-611290440484817771250536926183090648376587587301938898 : Rat) / 46499947606600990925238671541813294873367321162373069) [(1, 1), (5, 2), (8, 1), (15, 1)],
  term ((2568602061245288 : Rat) / 1162780221153193) [(1, 1), (5, 2), (8, 1), (15, 1), (16, 1)],
  term ((-259271587441775770073257543406488449392 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (7, 1)],
  term ((-129635793720887885036628771703244224696 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (7, 1), (8, 1)],
  term ((259271587441775770073257543406488449392 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (7, 1), (8, 1), (10, 1)],
  term ((-259271587441775770073257543406488449392 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (7, 1), (10, 1), (12, 1)],
  term ((1037086349767103080293030173625953797568 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (7, 1), (10, 2)],
  term ((129635793720887885036628771703244224696 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (7, 1), (12, 1)],
  term ((14273355843370170325454347843198506601153 : Rat) / 5398692558311147834550120876132926705955) [(1, 1), (8, 1), (9, 1)],
  term ((-28546711686740340650908695686397013202306 : Rat) / 5398692558311147834550120876132926705955) [(1, 1), (8, 1), (9, 1), (10, 1)],
  term ((-3167705762450008823146999517171386808524 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (8, 1), (9, 1), (10, 1), (12, 1)],
  term ((-22182620680173779953774126674016240448 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (8, 1), (9, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((397491232950237887996184205565539271127191104441069376 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (8, 1), (9, 1), (10, 1), (12, 1), (15, 2)],
  term ((-1054421534548864 : Rat) / 1162780221153193) [(1, 1), (8, 1), (9, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-29126686030272528252131061851301363411063603590152468727 : Rat) / 836999056918817836654296087752639307720611780922715242) [(1, 1), (8, 1), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((11093259647668850 : Rat) / 3488340663459579) [(1, 1), (8, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1145102618491479879425293366692247727288 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (8, 1), (9, 1), (10, 1), (13, 2)],
  term ((23766796833409985683353425305345223762306 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (8, 1), (9, 1), (10, 1), (14, 1)],
  term ((24718892151813076716331430172917738532674352394274840954 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(1, 1), (8, 1), (9, 1), (10, 1), (15, 2)],
  term ((-10962765984933080 : Rat) / 3488340663459579) [(1, 1), (8, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((1583852881225004411573499758585693404262 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (8, 1), (9, 1), (12, 1)],
  term ((11091310340086889976887063337008120224 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((-198745616475118943998092102782769635563595552220534688 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (8, 1), (9, 1), (12, 1), (15, 2)],
  term ((527210767274432 : Rat) / 1162780221153193) [(1, 1), (8, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((29126686030272528252131061851301363411063603590152468727 : Rat) / 1673998113837635673308592175505278615441223561845430484) [(1, 1), (8, 1), (9, 1), (13, 1), (15, 1)],
  term ((-5546629823834425 : Rat) / 3488340663459579) [(1, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((572551309245739939712646683346123863644 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (8, 1), (9, 1), (13, 2)],
  term ((-11883398416704992841676712652672611881153 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (8, 1), (9, 1), (14, 1)],
  term ((-12359446075906538358165715086458869266337176197137420477 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(1, 1), (8, 1), (9, 1), (15, 2)],
  term ((5481382992466540 : Rat) / 3488340663459579) [(1, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((777898098459684340928357649480447106112 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (8, 1), (9, 2), (10, 1), (13, 1)],
  term ((-12301069069469927066412623315433253195720432156430141869 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(1, 1), (8, 1), (9, 2), (10, 1), (15, 1)],
  term ((8223316472497148 : Rat) / 3488340663459579) [(1, 1), (8, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((-388949049229842170464178824740223553056 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (8, 1), (9, 2), (13, 1)],
  term ((12301069069469927066412623315433253195720432156430141869 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(1, 1), (8, 1), (9, 2), (15, 1)],
  term ((-4111658236248574 : Rat) / 3488340663459579) [(1, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((-347118927025584704822178291624352315808 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (8, 1), (9, 3)],
  term ((694237854051169409644356583248704631616 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (8, 1), (9, 3), (10, 1)],
  term ((2858364389378608838764062023873769248962 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (8, 1), (10, 1), (11, 1)],
  term ((8713128379449275417812518858045608398912 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (8, 1), (10, 1), (12, 1), (13, 1)],
  term ((-344674802912317648611387188666348500252 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (8, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((42897185966036484390082822956409864505349421492734777533 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(1, 1), (8, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-277384937357655 : Rat) / 1162780221153193) [(1, 1), (8, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2790009293275740138936205997796948742986167698945351423 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(1, 1), (8, 1), (10, 1), (12, 1), (15, 1)],
  term ((131503738079788567 : Rat) / 6976681326919158) [(1, 1), (8, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-249797660548386285418524913337906498156 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (8, 1), (10, 1), (12, 2), (13, 1)],
  term ((26974210883668912519839817367166225675565343026070909313 : Rat) / 929998952132019818504773430836265897467346423247461380) [(1, 1), (8, 1), (10, 1), (12, 2), (15, 1)],
  term ((-5003541596661801 : Rat) / 1162780221153193) [(1, 1), (8, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((66410998662038004817495670916240829828 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (8, 1), (10, 1), (13, 1)],
  term ((19463449035335062029892609990214299509488 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (8, 1), (10, 1), (13, 1), (14, 1)],
  term ((4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (8, 1), (10, 1), (13, 1), (14, 2)],
  term ((-93212013096392473427083411308443024896 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (8, 1), (10, 1), (13, 1), (15, 2)],
  term ((-86883956888373154677565351407430153815648725261687772569 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(1, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((60129224652876851 : Rat) / 6976681326919158) [(1, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (8, 1), (10, 1), (14, 2), (15, 1)],
  term ((833967741040952 : Rat) / 1162780221153193) [(1, 1), (8, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((63235000842975854703597614395624623353546682444744162259 : Rat) / 929998952132019818504773430836265897467346423247461380) [(1, 1), (8, 1), (10, 1), (15, 1)],
  term ((-4842600466899879 : Rat) / 1162780221153193) [(1, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-8932230819593789109350084471869951301087548508526939872 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (8, 1), (10, 1), (15, 3)],
  term ((1796510217718400 : Rat) / 1162780221153193) [(1, 1), (8, 1), (10, 1), (15, 3), (16, 1)],
  term ((-1429182194689304419382031011936884624481 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (8, 1), (11, 1)],
  term ((-4356564189724637708906259429022804199456 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (8, 1), (12, 1), (13, 1)],
  term ((172337401456158824305693594333174250126 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (8, 1), (12, 1), (13, 1), (14, 1)],
  term ((-42897185966036484390082822956409864505349421492734777533 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(1, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((277384937357655 : Rat) / 2325560442306386) [(1, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((2790009293275740138936205997796948742986167698945351423 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(1, 1), (8, 1), (12, 1), (15, 1)],
  term ((-131503738079788567 : Rat) / 13953362653838316) [(1, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((124898830274193142709262456668953249078 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (8, 1), (12, 2), (13, 1)],
  term ((-26974210883668912519839817367166225675565343026070909313 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(1, 1), (8, 1), (12, 2), (15, 1)],
  term ((5003541596661801 : Rat) / 2325560442306386) [(1, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((-33205499331019002408747835458120414914 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (8, 1), (13, 1)],
  term ((-9731724517667531014946304995107149754744 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (8, 1), (13, 1), (14, 1)],
  term ((-2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (8, 1), (13, 1), (14, 2)],
  term ((46606006548196236713541705654221512448 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (8, 1), (13, 1), (15, 2)],
  term ((86883956888373154677565351407430153815648725261687772569 : Rat) / 3719995808528079274019093723345063589869385692989845520) [(1, 1), (8, 1), (14, 1), (15, 1)],
  term ((-60129224652876851 : Rat) / 13953362653838316) [(1, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (8, 1), (14, 2), (15, 1)],
  term ((-416983870520476 : Rat) / 1162780221153193) [(1, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((-63235000842975854703597614395624623353546682444744162259 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(1, 1), (8, 1), (15, 1)],
  term ((4842600466899879 : Rat) / 2325560442306386) [(1, 1), (8, 1), (15, 1), (16, 1)],
  term ((4466115409796894554675042235934975650543774254263469936 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (8, 1), (15, 3)],
  term ((-898255108859200 : Rat) / 1162780221153193) [(1, 1), (8, 1), (15, 3), (16, 1)],
  term ((-11185121374989664010869274704317749388532 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (8, 2), (9, 1)],
  term ((22370242749979328021738549408635498777064 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (8, 2), (9, 1), (10, 1)],
  term ((49794017268134571589590260644228965512 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (8, 2), (10, 1), (12, 1), (13, 1)],
  term ((-917441215567441973698591233420584982763484800877141585 : Rat) / 92999895213201981850477343083626589746734642324746138) [(1, 1), (8, 2), (10, 1), (12, 1), (15, 1)],
  term ((-24897008634067285794795130322114482756 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (8, 2), (12, 1), (13, 1)],
  term ((917441215567441973698591233420584982763484800877141585 : Rat) / 185999790426403963700954686167253179493469284649492276) [(1, 1), (8, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 21, terms 500 through 599. -/
theorem ep_Q2_024_block_21_0500_0599_valid :
    checkProductSumEq ep_Q2_024_partials_21_0500_0599
      ep_Q2_024_block_21_0500_0599 = true := by
  native_decide

end EpQ2024TermShards

end Patterns

end EndpointCertificate

end Problem97
