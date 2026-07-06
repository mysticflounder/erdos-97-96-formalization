/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_024, term block 17:100-199

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_024`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2024TermShards

/-- Generator polynomial 17 for endpoint certificate `ep_Q2_024`. -/
def ep_Q2_024_generator_17_0100_0199 : Poly :=
[
  term (2 : Rat) [(6, 1), (14, 1)],
  term (2 : Rat) [(7, 1), (15, 1)],
  term (-1 : Rat) [(14, 2)],
  term (-1 : Rat) [(15, 2)]
]

/-- Coefficient term 100 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0100 : Poly :=
[
  term ((-2568602061245288 : Rat) / 1162780221153193) [(1, 1), (5, 2), (15, 1), (16, 1)]
]

/-- Partial product 100 for generator 17. -/
def ep_Q2_024_partial_17_0100 : Poly :=
[
  term ((-5137204122490576 : Rat) / 1162780221153193) [(1, 1), (5, 2), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5137204122490576 : Rat) / 1162780221153193) [(1, 1), (5, 2), (7, 1), (15, 2), (16, 1)],
  term ((2568602061245288 : Rat) / 1162780221153193) [(1, 1), (5, 2), (14, 2), (15, 1), (16, 1)],
  term ((2568602061245288 : Rat) / 1162780221153193) [(1, 1), (5, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 17. -/
theorem ep_Q2_024_partial_17_0100_valid :
    mulPoly ep_Q2_024_coefficient_17_0100
        ep_Q2_024_generator_17_0100_0199 =
      ep_Q2_024_partial_17_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0101 : Poly :=
[
  term ((259271587441775770073257543406488449392 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (7, 1)]
]

/-- Partial product 101 for generator 17. -/
def ep_Q2_024_partial_17_0101 : Poly :=
[
  term ((518543174883551540146515086812976898784 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (6, 1), (7, 1), (14, 1)],
  term ((-259271587441775770073257543406488449392 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (7, 1), (14, 2)],
  term ((-259271587441775770073257543406488449392 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (7, 1), (15, 2)],
  term ((518543174883551540146515086812976898784 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (7, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 17. -/
theorem ep_Q2_024_partial_17_0101_valid :
    mulPoly ep_Q2_024_coefficient_17_0101
        ep_Q2_024_generator_17_0100_0199 =
      ep_Q2_024_partial_17_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0102 : Poly :=
[
  term ((3452924603613141561560579250626960304556 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (8, 1), (9, 1)]
]

/-- Partial product 102 for generator 17. -/
def ep_Q2_024_partial_17_0102 : Poly :=
[
  term ((6905849207226283123121158501253920609112 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (6, 1), (8, 1), (9, 1), (14, 1)],
  term ((6905849207226283123121158501253920609112 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (7, 1), (8, 1), (9, 1), (15, 1)],
  term ((-3452924603613141561560579250626960304556 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (8, 1), (9, 1), (14, 2)],
  term ((-3452924603613141561560579250626960304556 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (8, 1), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 17. -/
theorem ep_Q2_024_partial_17_0102_valid :
    mulPoly ep_Q2_024_coefficient_17_0102
        ep_Q2_024_generator_17_0100_0199 =
      ep_Q2_024_partial_17_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0103 : Poly :=
[
  term ((24897008634067285794795130322114482756 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (8, 1), (12, 1), (13, 1)]
]

/-- Partial product 103 for generator 17. -/
def ep_Q2_024_partial_17_0103 : Poly :=
[
  term ((49794017268134571589590260644228965512 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (6, 1), (8, 1), (12, 1), (13, 1), (14, 1)],
  term ((49794017268134571589590260644228965512 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((-24897008634067285794795130322114482756 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (8, 1), (12, 1), (13, 1), (14, 2)],
  term ((-24897008634067285794795130322114482756 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (8, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 17. -/
theorem ep_Q2_024_partial_17_0103_valid :
    mulPoly ep_Q2_024_coefficient_17_0103
        ep_Q2_024_generator_17_0100_0199 =
      ep_Q2_024_partial_17_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0104 : Poly :=
[
  term ((-917441215567441973698591233420584982763484800877141585 : Rat) / 185999790426403963700954686167253179493469284649492276) [(1, 1), (8, 1), (12, 1), (15, 1)]
]

/-- Partial product 104 for generator 17. -/
def ep_Q2_024_partial_17_0104 : Poly :=
[
  term ((-917441215567441973698591233420584982763484800877141585 : Rat) / 92999895213201981850477343083626589746734642324746138) [(1, 1), (6, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((-917441215567441973698591233420584982763484800877141585 : Rat) / 92999895213201981850477343083626589746734642324746138) [(1, 1), (7, 1), (8, 1), (12, 1), (15, 2)],
  term ((917441215567441973698591233420584982763484800877141585 : Rat) / 185999790426403963700954686167253179493469284649492276) [(1, 1), (8, 1), (12, 1), (14, 2), (15, 1)],
  term ((917441215567441973698591233420584982763484800877141585 : Rat) / 185999790426403963700954686167253179493469284649492276) [(1, 1), (8, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 17. -/
theorem ep_Q2_024_partial_17_0104_valid :
    mulPoly ep_Q2_024_coefficient_17_0104
        ep_Q2_024_generator_17_0100_0199 =
      ep_Q2_024_partial_17_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0105 : Poly :=
[
  term ((1086154201315805 : Rat) / 1162780221153193) [(1, 1), (8, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 105 for generator 17. -/
def ep_Q2_024_partial_17_0105 : Poly :=
[
  term ((2172308402631610 : Rat) / 1162780221153193) [(1, 1), (6, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((2172308402631610 : Rat) / 1162780221153193) [(1, 1), (7, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-1086154201315805 : Rat) / 1162780221153193) [(1, 1), (8, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1086154201315805 : Rat) / 1162780221153193) [(1, 1), (8, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 17. -/
theorem ep_Q2_024_partial_17_0105_valid :
    mulPoly ep_Q2_024_coefficient_17_0105
        ep_Q2_024_generator_17_0100_0199 =
      ep_Q2_024_partial_17_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0106 : Poly :=
[
  term ((8275709440100912892211675038987725738048 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (8, 1), (13, 1)]
]

/-- Partial product 106 for generator 17. -/
def ep_Q2_024_partial_17_0106 : Poly :=
[
  term ((16551418880201825784423350077975451476096 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (6, 1), (8, 1), (13, 1), (14, 1)],
  term ((16551418880201825784423350077975451476096 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (7, 1), (8, 1), (13, 1), (15, 1)],
  term ((-8275709440100912892211675038987725738048 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (8, 1), (13, 1), (14, 2)],
  term ((-8275709440100912892211675038987725738048 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (8, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 17. -/
theorem ep_Q2_024_partial_17_0106_valid :
    mulPoly ep_Q2_024_coefficient_17_0106
        ep_Q2_024_generator_17_0100_0199 =
      ep_Q2_024_partial_17_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0107 : Poly :=
[
  term ((8106296284960604636905427382372649950820795712175917799 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (8, 1), (15, 1)]
]

/-- Partial product 107 for generator 17. -/
def ep_Q2_024_partial_17_0107 : Poly :=
[
  term ((16212592569921209273810854764745299901641591424351835598 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (6, 1), (8, 1), (14, 1), (15, 1)],
  term ((16212592569921209273810854764745299901641591424351835598 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (7, 1), (8, 1), (15, 2)],
  term ((-8106296284960604636905427382372649950820795712175917799 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (8, 1), (14, 2), (15, 1)],
  term ((-8106296284960604636905427382372649950820795712175917799 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (8, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 17. -/
theorem ep_Q2_024_partial_17_0107_valid :
    mulPoly ep_Q2_024_coefficient_17_0107
        ep_Q2_024_generator_17_0100_0199 =
      ep_Q2_024_partial_17_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0108 : Poly :=
[
  term ((-8683303471552472 : Rat) / 3488340663459579) [(1, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 108 for generator 17. -/
def ep_Q2_024_partial_17_0108 : Poly :=
[
  term ((-17366606943104944 : Rat) / 3488340663459579) [(1, 1), (6, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-17366606943104944 : Rat) / 3488340663459579) [(1, 1), (7, 1), (8, 1), (15, 2), (16, 1)],
  term ((8683303471552472 : Rat) / 3488340663459579) [(1, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((8683303471552472 : Rat) / 3488340663459579) [(1, 1), (8, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 17. -/
theorem ep_Q2_024_partial_17_0108_valid :
    mulPoly ep_Q2_024_coefficient_17_0108
        ep_Q2_024_generator_17_0100_0199 =
      ep_Q2_024_partial_17_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0109 : Poly :=
[
  term ((-1503200724195832143731226559734825965246 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (9, 1)]
]

/-- Partial product 109 for generator 17. -/
def ep_Q2_024_partial_17_0109 : Poly :=
[
  term ((-3006401448391664287462453119469651930492 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (6, 1), (9, 1), (14, 1)],
  term ((-3006401448391664287462453119469651930492 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (7, 1), (9, 1), (15, 1)],
  term ((1503200724195832143731226559734825965246 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (9, 1), (14, 2)],
  term ((1503200724195832143731226559734825965246 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 17. -/
theorem ep_Q2_024_partial_17_0109_valid :
    mulPoly ep_Q2_024_coefficient_17_0109
        ep_Q2_024_generator_17_0100_0199 =
      ep_Q2_024_partial_17_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0110 : Poly :=
[
  term ((2271262458814062768019053450394331541204 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (9, 1), (12, 1)]
]

/-- Partial product 110 for generator 17. -/
def ep_Q2_024_partial_17_0110 : Poly :=
[
  term ((4542524917628125536038106900788663082408 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (6, 1), (9, 1), (12, 1), (14, 1)],
  term ((4542524917628125536038106900788663082408 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (7, 1), (9, 1), (12, 1), (15, 1)],
  term ((-2271262458814062768019053450394331541204 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (9, 1), (12, 1), (14, 2)],
  term ((-2271262458814062768019053450394331541204 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (9, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 17. -/
theorem ep_Q2_024_partial_17_0110_valid :
    mulPoly ep_Q2_024_coefficient_17_0110
        ep_Q2_024_generator_17_0100_0199 =
      ep_Q2_024_partial_17_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0111 : Poly :=
[
  term ((-2449020209846403374712074673893548417307732695016543182 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (9, 1), (13, 1), (15, 1)]
]

/-- Partial product 111 for generator 17. -/
def ep_Q2_024_partial_17_0111 : Poly :=
[
  term ((-4898040419692806749424149347787096834615465390033086364 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (6, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((-4898040419692806749424149347787096834615465390033086364 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (7, 1), (9, 1), (13, 1), (15, 2)],
  term ((2449020209846403374712074673893548417307732695016543182 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (9, 1), (13, 1), (14, 2), (15, 1)],
  term ((2449020209846403374712074673893548417307732695016543182 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (9, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 17. -/
theorem ep_Q2_024_partial_17_0111_valid :
    mulPoly ep_Q2_024_coefficient_17_0111
        ep_Q2_024_generator_17_0100_0199 =
      ep_Q2_024_partial_17_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0112 : Poly :=
[
  term ((1495148449544936 : Rat) / 1162780221153193) [(1, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 112 for generator 17. -/
def ep_Q2_024_partial_17_0112 : Poly :=
[
  term ((2990296899089872 : Rat) / 1162780221153193) [(1, 1), (6, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((2990296899089872 : Rat) / 1162780221153193) [(1, 1), (7, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1495148449544936 : Rat) / 1162780221153193) [(1, 1), (9, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1495148449544936 : Rat) / 1162780221153193) [(1, 1), (9, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 17. -/
theorem ep_Q2_024_partial_17_0112_valid :
    mulPoly ep_Q2_024_coefficient_17_0112
        ep_Q2_024_generator_17_0100_0199 =
      ep_Q2_024_partial_17_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0113 : Poly :=
[
  term ((156549602987398445852407283417014511808 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (9, 1), (13, 2)]
]

/-- Partial product 113 for generator 17. -/
def ep_Q2_024_partial_17_0113 : Poly :=
[
  term ((313099205974796891704814566834029023616 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (6, 1), (9, 1), (13, 2), (14, 1)],
  term ((313099205974796891704814566834029023616 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (7, 1), (9, 1), (13, 2), (15, 1)],
  term ((-156549602987398445852407283417014511808 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (9, 1), (13, 2), (14, 2)],
  term ((-156549602987398445852407283417014511808 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (9, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 17. -/
theorem ep_Q2_024_partial_17_0113_valid :
    mulPoly ep_Q2_024_coefficient_17_0113
        ep_Q2_024_generator_17_0100_0199 =
      ep_Q2_024_partial_17_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0114 : Poly :=
[
  term ((-482650611438740466194406210179930591592 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (9, 1), (14, 1)]
]

/-- Partial product 114 for generator 17. -/
def ep_Q2_024_partial_17_0114 : Poly :=
[
  term ((-965301222877480932388812420359861183184 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (6, 1), (9, 1), (14, 2)],
  term ((-965301222877480932388812420359861183184 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (7, 1), (9, 1), (14, 1), (15, 1)],
  term ((482650611438740466194406210179930591592 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (9, 1), (14, 1), (15, 2)],
  term ((482650611438740466194406210179930591592 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (9, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 17. -/
theorem ep_Q2_024_partial_17_0114_valid :
    mulPoly ep_Q2_024_coefficient_17_0114
        ep_Q2_024_generator_17_0100_0199 =
      ep_Q2_024_partial_17_0114 := by
  native_decide

/-- Coefficient term 115 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0115 : Poly :=
[
  term ((126225064372939892662610287863400842112 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (9, 2), (13, 1)]
]

/-- Partial product 115 for generator 17. -/
def ep_Q2_024_partial_17_0115 : Poly :=
[
  term ((252450128745879785325220575726801684224 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (6, 1), (9, 2), (13, 1), (14, 1)],
  term ((252450128745879785325220575726801684224 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (7, 1), (9, 2), (13, 1), (15, 1)],
  term ((-126225064372939892662610287863400842112 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (9, 2), (13, 1), (14, 2)],
  term ((-126225064372939892662610287863400842112 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (9, 2), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 115 for generator 17. -/
theorem ep_Q2_024_partial_17_0115_valid :
    mulPoly ep_Q2_024_coefficient_17_0115
        ep_Q2_024_generator_17_0100_0199 =
      ep_Q2_024_partial_17_0115 := by
  native_decide

/-- Coefficient term 116 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0116 : Poly :=
[
  term ((2858364389378608838764062023873769248962 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (11, 1)]
]

/-- Partial product 116 for generator 17. -/
def ep_Q2_024_partial_17_0116 : Poly :=
[
  term ((5716728778757217677528124047747538497924 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (6, 1), (11, 1), (14, 1)],
  term ((5716728778757217677528124047747538497924 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (7, 1), (11, 1), (15, 1)],
  term ((-2858364389378608838764062023873769248962 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (11, 1), (14, 2)],
  term ((-2858364389378608838764062023873769248962 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 116 for generator 17. -/
theorem ep_Q2_024_partial_17_0116_valid :
    mulPoly ep_Q2_024_coefficient_17_0116
        ep_Q2_024_generator_17_0100_0199 =
      ep_Q2_024_partial_17_0116 := by
  native_decide

/-- Coefficient term 117 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0117 : Poly :=
[
  term ((11073542052218937979739640011845762562066 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (12, 1), (13, 1)]
]

/-- Partial product 117 for generator 17. -/
def ep_Q2_024_partial_17_0117 : Poly :=
[
  term ((22147084104437875959479280023691525124132 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (6, 1), (12, 1), (13, 1), (14, 1)],
  term ((22147084104437875959479280023691525124132 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (7, 1), (12, 1), (13, 1), (15, 1)],
  term ((-11073542052218937979739640011845762562066 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (12, 1), (13, 1), (14, 2)],
  term ((-11073542052218937979739640011845762562066 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 117 for generator 17. -/
theorem ep_Q2_024_partial_17_0117_valid :
    mulPoly ep_Q2_024_coefficient_17_0117
        ep_Q2_024_generator_17_0100_0199 =
      ep_Q2_024_partial_17_0117 := by
  native_decide

/-- Coefficient term 118 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0118 : Poly :=
[
  term ((-102931900272136378177856971103204841220 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 118 for generator 17. -/
def ep_Q2_024_partial_17_0118 : Poly :=
[
  term ((-205863800544272756355713942206409682440 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (6, 1), (12, 1), (13, 1), (14, 2)],
  term ((-205863800544272756355713942206409682440 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((102931900272136378177856971103204841220 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((102931900272136378177856971103204841220 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (12, 1), (13, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 118 for generator 17. -/
theorem ep_Q2_024_partial_17_0118_valid :
    mulPoly ep_Q2_024_coefficient_17_0118
        ep_Q2_024_generator_17_0100_0199 =
      ep_Q2_024_partial_17_0118 := by
  native_decide

/-- Coefficient term 119 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0119 : Poly :=
[
  term ((184684620853449952814620827932751714007739040900298451677 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(1, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 119 for generator 17. -/
def ep_Q2_024_partial_17_0119 : Poly :=
[
  term ((184684620853449952814620827932751714007739040900298451677 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(1, 1), (6, 1), (12, 1), (14, 2), (15, 1)],
  term ((184684620853449952814620827932751714007739040900298451677 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(1, 1), (7, 1), (12, 1), (14, 1), (15, 2)],
  term ((-184684620853449952814620827932751714007739040900298451677 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(1, 1), (12, 1), (14, 1), (15, 3)],
  term ((-184684620853449952814620827932751714007739040900298451677 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(1, 1), (12, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 119 for generator 17. -/
theorem ep_Q2_024_partial_17_0119_valid :
    mulPoly ep_Q2_024_coefficient_17_0119
        ep_Q2_024_generator_17_0100_0199 =
      ep_Q2_024_partial_17_0119 := by
  native_decide

/-- Coefficient term 120 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0120 : Poly :=
[
  term ((-11536479425158903 : Rat) / 1162780221153193) [(1, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 120 for generator 17. -/
def ep_Q2_024_partial_17_0120 : Poly :=
[
  term ((-23072958850317806 : Rat) / 1162780221153193) [(1, 1), (6, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-23072958850317806 : Rat) / 1162780221153193) [(1, 1), (7, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((11536479425158903 : Rat) / 1162780221153193) [(1, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((11536479425158903 : Rat) / 1162780221153193) [(1, 1), (12, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 120 for generator 17. -/
theorem ep_Q2_024_partial_17_0120_valid :
    mulPoly ep_Q2_024_coefficient_17_0120
        ep_Q2_024_generator_17_0100_0199 =
      ep_Q2_024_partial_17_0120 := by
  native_decide

/-- Coefficient term 121 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0121 : Poly :=
[
  term ((-447481119309076194849599014937502304786099349969962623757 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(1, 1), (12, 1), (15, 1)]
]

/-- Partial product 121 for generator 17. -/
def ep_Q2_024_partial_17_0121 : Poly :=
[
  term ((-447481119309076194849599014937502304786099349969962623757 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(1, 1), (6, 1), (12, 1), (14, 1), (15, 1)],
  term ((-447481119309076194849599014937502304786099349969962623757 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(1, 1), (7, 1), (12, 1), (15, 2)],
  term ((447481119309076194849599014937502304786099349969962623757 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(1, 1), (12, 1), (14, 2), (15, 1)],
  term ((447481119309076194849599014937502304786099349969962623757 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(1, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 121 for generator 17. -/
theorem ep_Q2_024_partial_17_0121_valid :
    mulPoly ep_Q2_024_coefficient_17_0121
        ep_Q2_024_generator_17_0100_0199 =
      ep_Q2_024_partial_17_0121 := by
  native_decide

/-- Coefficient term 122 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0122 : Poly :=
[
  term ((-42043259958870211 : Rat) / 6976681326919158) [(1, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 122 for generator 17. -/
def ep_Q2_024_partial_17_0122 : Poly :=
[
  term ((-42043259958870211 : Rat) / 3488340663459579) [(1, 1), (6, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-42043259958870211 : Rat) / 3488340663459579) [(1, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((42043259958870211 : Rat) / 6976681326919158) [(1, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((42043259958870211 : Rat) / 6976681326919158) [(1, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 122 for generator 17. -/
theorem ep_Q2_024_partial_17_0122_valid :
    mulPoly ep_Q2_024_coefficient_17_0122
        ep_Q2_024_generator_17_0100_0199 =
      ep_Q2_024_partial_17_0122 := by
  native_decide

/-- Coefficient term 123 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0123 : Poly :=
[
  term ((125186318743875028812384797844417866756 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (12, 2), (13, 1)]
]

/-- Partial product 123 for generator 17. -/
def ep_Q2_024_partial_17_0123 : Poly :=
[
  term ((250372637487750057624769595688835733512 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (6, 1), (12, 2), (13, 1), (14, 1)],
  term ((250372637487750057624769595688835733512 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (7, 1), (12, 2), (13, 1), (15, 1)],
  term ((-125186318743875028812384797844417866756 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (12, 2), (13, 1), (14, 2)],
  term ((-125186318743875028812384797844417866756 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (12, 2), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 123 for generator 17. -/
theorem ep_Q2_024_partial_17_0123_valid :
    mulPoly ep_Q2_024_coefficient_17_0123
        ep_Q2_024_generator_17_0100_0199 =
      ep_Q2_024_partial_17_0123 := by
  native_decide

/-- Coefficient term 124 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0124 : Poly :=
[
  term ((-1100529695907008564799077506604416650894267905418418037 : Rat) / 185999790426403963700954686167253179493469284649492276) [(1, 1), (12, 2), (15, 1)]
]

/-- Partial product 124 for generator 17. -/
def ep_Q2_024_partial_17_0124 : Poly :=
[
  term ((-1100529695907008564799077506604416650894267905418418037 : Rat) / 92999895213201981850477343083626589746734642324746138) [(1, 1), (6, 1), (12, 2), (14, 1), (15, 1)],
  term ((-1100529695907008564799077506604416650894267905418418037 : Rat) / 92999895213201981850477343083626589746734642324746138) [(1, 1), (7, 1), (12, 2), (15, 2)],
  term ((1100529695907008564799077506604416650894267905418418037 : Rat) / 185999790426403963700954686167253179493469284649492276) [(1, 1), (12, 2), (14, 2), (15, 1)],
  term ((1100529695907008564799077506604416650894267905418418037 : Rat) / 185999790426403963700954686167253179493469284649492276) [(1, 1), (12, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 124 for generator 17. -/
theorem ep_Q2_024_partial_17_0124_valid :
    mulPoly ep_Q2_024_coefficient_17_0124
        ep_Q2_024_generator_17_0100_0199 =
      ep_Q2_024_partial_17_0124 := by
  native_decide

/-- Coefficient term 125 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0125 : Poly :=
[
  term ((3224281023627761 : Rat) / 1162780221153193) [(1, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 125 for generator 17. -/
def ep_Q2_024_partial_17_0125 : Poly :=
[
  term ((6448562047255522 : Rat) / 1162780221153193) [(1, 1), (6, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((6448562047255522 : Rat) / 1162780221153193) [(1, 1), (7, 1), (12, 2), (15, 2), (16, 1)],
  term ((-3224281023627761 : Rat) / 1162780221153193) [(1, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((-3224281023627761 : Rat) / 1162780221153193) [(1, 1), (12, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 125 for generator 17. -/
theorem ep_Q2_024_partial_17_0125_valid :
    mulPoly ep_Q2_024_coefficient_17_0125
        ep_Q2_024_generator_17_0100_0199 =
      ep_Q2_024_partial_17_0125 := by
  native_decide

/-- Coefficient term 126 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0126 : Poly :=
[
  term ((1240673144173263294135418501165956189218 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (13, 1)]
]

/-- Partial product 126 for generator 17. -/
def ep_Q2_024_partial_17_0126 : Poly :=
[
  term ((2481346288346526588270837002331912378436 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (6, 1), (13, 1), (14, 1)],
  term ((2481346288346526588270837002331912378436 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (7, 1), (13, 1), (15, 1)],
  term ((-1240673144173263294135418501165956189218 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (13, 1), (14, 2)],
  term ((-1240673144173263294135418501165956189218 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 126 for generator 17. -/
theorem ep_Q2_024_partial_17_0126_valid :
    mulPoly ep_Q2_024_coefficient_17_0126
        ep_Q2_024_generator_17_0100_0199 =
      ep_Q2_024_partial_17_0126 := by
  native_decide

/-- Coefficient term 127 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0127 : Poly :=
[
  term ((-2598070353212282879772892837526291699792 : Rat) / 359912837220743188970008058408861780397) [(1, 1), (13, 1), (14, 1)]
]

/-- Partial product 127 for generator 17. -/
def ep_Q2_024_partial_17_0127 : Poly :=
[
  term ((-5196140706424565759545785675052583399584 : Rat) / 359912837220743188970008058408861780397) [(1, 1), (6, 1), (13, 1), (14, 2)],
  term ((-5196140706424565759545785675052583399584 : Rat) / 359912837220743188970008058408861780397) [(1, 1), (7, 1), (13, 1), (14, 1), (15, 1)],
  term ((2598070353212282879772892837526291699792 : Rat) / 359912837220743188970008058408861780397) [(1, 1), (13, 1), (14, 1), (15, 2)],
  term ((2598070353212282879772892837526291699792 : Rat) / 359912837220743188970008058408861780397) [(1, 1), (13, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 127 for generator 17. -/
theorem ep_Q2_024_partial_17_0127_valid :
    mulPoly ep_Q2_024_coefficient_17_0127
        ep_Q2_024_generator_17_0100_0199 =
      ep_Q2_024_partial_17_0127 := by
  native_decide

/-- Coefficient term 128 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0128 : Poly :=
[
  term ((4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (13, 1), (14, 2)]
]

/-- Partial product 128 for generator 17. -/
def ep_Q2_024_partial_17_0128 : Poly :=
[
  term ((8486750246624093521424296941571253888 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (6, 1), (13, 1), (14, 3)],
  term ((8486750246624093521424296941571253888 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (7, 1), (13, 1), (14, 2), (15, 1)],
  term ((-4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (13, 1), (14, 2), (15, 2)],
  term ((-4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (13, 1), (14, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 128 for generator 17. -/
theorem ep_Q2_024_partial_17_0128_valid :
    mulPoly ep_Q2_024_coefficient_17_0128
        ep_Q2_024_generator_17_0100_0199 =
      ep_Q2_024_partial_17_0128 := by
  native_decide

/-- Coefficient term 129 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0129 : Poly :=
[
  term ((2128620369344284153808329397490462196754710909787227916 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (13, 1), (15, 2)]
]

/-- Partial product 129 for generator 17. -/
def ep_Q2_024_partial_17_0129 : Poly :=
[
  term ((4257240738688568307616658794980924393509421819574455832 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (6, 1), (13, 1), (14, 1), (15, 2)],
  term ((4257240738688568307616658794980924393509421819574455832 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (7, 1), (13, 1), (15, 3)],
  term ((-2128620369344284153808329397490462196754710909787227916 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (13, 1), (14, 2), (15, 2)],
  term ((-2128620369344284153808329397490462196754710909787227916 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (13, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 129 for generator 17. -/
theorem ep_Q2_024_partial_17_0129_valid :
    mulPoly ep_Q2_024_coefficient_17_0129
        ep_Q2_024_generator_17_0100_0199 =
      ep_Q2_024_partial_17_0129 := by
  native_decide

/-- Coefficient term 130 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0130 : Poly :=
[
  term ((-1231965958083216 : Rat) / 1162780221153193) [(1, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 130 for generator 17. -/
def ep_Q2_024_partial_17_0130 : Poly :=
[
  term ((-2463931916166432 : Rat) / 1162780221153193) [(1, 1), (6, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2463931916166432 : Rat) / 1162780221153193) [(1, 1), (7, 1), (13, 1), (15, 3), (16, 1)],
  term ((1231965958083216 : Rat) / 1162780221153193) [(1, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((1231965958083216 : Rat) / 1162780221153193) [(1, 1), (13, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 130 for generator 17. -/
theorem ep_Q2_024_partial_17_0130_valid :
    mulPoly ep_Q2_024_coefficient_17_0130
        ep_Q2_024_generator_17_0100_0199 =
      ep_Q2_024_partial_17_0130 := by
  native_decide

/-- Coefficient term 131 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0131 : Poly :=
[
  term ((-2316940935052632307052780858737264074566502626092094804 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (13, 2), (15, 1)]
]

/-- Partial product 131 for generator 17. -/
def ep_Q2_024_partial_17_0131 : Poly :=
[
  term ((-4633881870105264614105561717474528149133005252184189608 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (6, 1), (13, 2), (14, 1), (15, 1)],
  term ((-4633881870105264614105561717474528149133005252184189608 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (7, 1), (13, 2), (15, 2)],
  term ((2316940935052632307052780858737264074566502626092094804 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (13, 2), (14, 2), (15, 1)],
  term ((2316940935052632307052780858737264074566502626092094804 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (13, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 131 for generator 17. -/
theorem ep_Q2_024_partial_17_0131_valid :
    mulPoly ep_Q2_024_coefficient_17_0131
        ep_Q2_024_generator_17_0100_0199 =
      ep_Q2_024_partial_17_0131 := by
  native_decide

/-- Coefficient term 132 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0132 : Poly :=
[
  term ((150661185588720 : Rat) / 1162780221153193) [(1, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 132 for generator 17. -/
def ep_Q2_024_partial_17_0132 : Poly :=
[
  term ((301322371177440 : Rat) / 1162780221153193) [(1, 1), (6, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((301322371177440 : Rat) / 1162780221153193) [(1, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((-150661185588720 : Rat) / 1162780221153193) [(1, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((-150661185588720 : Rat) / 1162780221153193) [(1, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 132 for generator 17. -/
theorem ep_Q2_024_partial_17_0132_valid :
    mulPoly ep_Q2_024_coefficient_17_0132
        ep_Q2_024_generator_17_0100_0199 =
      ep_Q2_024_partial_17_0132 := by
  native_decide

/-- Coefficient term 133 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0133 : Poly :=
[
  term ((80945856112067634232098240062478093344 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (13, 3)]
]

/-- Partial product 133 for generator 17. -/
def ep_Q2_024_partial_17_0133 : Poly :=
[
  term ((161891712224135268464196480124956186688 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (6, 1), (13, 3), (14, 1)],
  term ((161891712224135268464196480124956186688 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (7, 1), (13, 3), (15, 1)],
  term ((-80945856112067634232098240062478093344 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (13, 3), (14, 2)],
  term ((-80945856112067634232098240062478093344 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (13, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 133 for generator 17. -/
theorem ep_Q2_024_partial_17_0133_valid :
    mulPoly ep_Q2_024_coefficient_17_0133
        ep_Q2_024_generator_17_0100_0199 =
      ep_Q2_024_partial_17_0133 := by
  native_decide

/-- Coefficient term 134 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0134 : Poly :=
[
  term ((249562434230076519877457627355935784697985556458557189433 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(1, 1), (14, 1), (15, 1)]
]

/-- Partial product 134 for generator 17. -/
def ep_Q2_024_partial_17_0134 : Poly :=
[
  term ((249562434230076519877457627355935784697985556458557189433 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(1, 1), (6, 1), (14, 2), (15, 1)],
  term ((249562434230076519877457627355935784697985556458557189433 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(1, 1), (7, 1), (14, 1), (15, 2)],
  term ((-249562434230076519877457627355935784697985556458557189433 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(1, 1), (14, 1), (15, 3)],
  term ((-249562434230076519877457627355935784697985556458557189433 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(1, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 134 for generator 17. -/
theorem ep_Q2_024_partial_17_0134_valid :
    mulPoly ep_Q2_024_coefficient_17_0134
        ep_Q2_024_generator_17_0100_0199 =
      ep_Q2_024_partial_17_0134 := by
  native_decide

/-- Coefficient term 135 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0135 : Poly :=
[
  term ((-138348488323751089 : Rat) / 6976681326919158) [(1, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 135 for generator 17. -/
def ep_Q2_024_partial_17_0135 : Poly :=
[
  term ((-138348488323751089 : Rat) / 3488340663459579) [(1, 1), (6, 1), (14, 2), (15, 1), (16, 1)],
  term ((-138348488323751089 : Rat) / 3488340663459579) [(1, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((138348488323751089 : Rat) / 6976681326919158) [(1, 1), (14, 1), (15, 3), (16, 1)],
  term ((138348488323751089 : Rat) / 6976681326919158) [(1, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 135 for generator 17. -/
theorem ep_Q2_024_partial_17_0135_valid :
    mulPoly ep_Q2_024_coefficient_17_0135
        ep_Q2_024_generator_17_0100_0199 =
      ep_Q2_024_partial_17_0135 := by
  native_decide

/-- Coefficient term 136 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0136 : Poly :=
[
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (14, 2), (15, 1)]
]

/-- Partial product 136 for generator 17. -/
def ep_Q2_024_partial_17_0136 : Poly :=
[
  term ((674456529895393409686477352003493571793009190155093372 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (6, 1), (14, 3), (15, 1)],
  term ((674456529895393409686477352003493571793009190155093372 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (7, 1), (14, 2), (15, 2)],
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (14, 2), (15, 3)],
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (14, 4), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 136 for generator 17. -/
theorem ep_Q2_024_partial_17_0136_valid :
    mulPoly ep_Q2_024_coefficient_17_0136
        ep_Q2_024_generator_17_0100_0199 =
      ep_Q2_024_partial_17_0136 := by
  native_decide

/-- Coefficient term 137 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0137 : Poly :=
[
  term ((833967741040952 : Rat) / 1162780221153193) [(1, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 137 for generator 17. -/
def ep_Q2_024_partial_17_0137 : Poly :=
[
  term ((1667935482081904 : Rat) / 1162780221153193) [(1, 1), (6, 1), (14, 3), (15, 1), (16, 1)],
  term ((1667935482081904 : Rat) / 1162780221153193) [(1, 1), (7, 1), (14, 2), (15, 2), (16, 1)],
  term ((-833967741040952 : Rat) / 1162780221153193) [(1, 1), (14, 2), (15, 3), (16, 1)],
  term ((-833967741040952 : Rat) / 1162780221153193) [(1, 1), (14, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 137 for generator 17. -/
theorem ep_Q2_024_partial_17_0137_valid :
    mulPoly ep_Q2_024_coefficient_17_0137
        ep_Q2_024_generator_17_0100_0199 =
      ep_Q2_024_partial_17_0137 := by
  native_decide

/-- Coefficient term 138 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0138 : Poly :=
[
  term ((303197347720279522945960624054822934173231987169673121843 : Rat) / 3719995808528079274019093723345063589869385692989845520) [(1, 1), (15, 1)]
]

/-- Partial product 138 for generator 17. -/
def ep_Q2_024_partial_17_0138 : Poly :=
[
  term ((303197347720279522945960624054822934173231987169673121843 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(1, 1), (6, 1), (14, 1), (15, 1)],
  term ((303197347720279522945960624054822934173231987169673121843 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(1, 1), (7, 1), (15, 2)],
  term ((-303197347720279522945960624054822934173231987169673121843 : Rat) / 3719995808528079274019093723345063589869385692989845520) [(1, 1), (14, 2), (15, 1)],
  term ((-303197347720279522945960624054822934173231987169673121843 : Rat) / 3719995808528079274019093723345063589869385692989845520) [(1, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 138 for generator 17. -/
theorem ep_Q2_024_partial_17_0138_valid :
    mulPoly ep_Q2_024_coefficient_17_0138
        ep_Q2_024_generator_17_0100_0199 =
      ep_Q2_024_partial_17_0138 := by
  native_decide

/-- Coefficient term 139 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0139 : Poly :=
[
  term ((46761063904070125 : Rat) / 4651120884612772) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 139 for generator 17. -/
def ep_Q2_024_partial_17_0139 : Poly :=
[
  term ((46761063904070125 : Rat) / 2325560442306386) [(1, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((46761063904070125 : Rat) / 2325560442306386) [(1, 1), (7, 1), (15, 2), (16, 1)],
  term ((-46761063904070125 : Rat) / 4651120884612772) [(1, 1), (14, 2), (15, 1), (16, 1)],
  term ((-46761063904070125 : Rat) / 4651120884612772) [(1, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 139 for generator 17. -/
theorem ep_Q2_024_partial_17_0139_valid :
    mulPoly ep_Q2_024_coefficient_17_0139
        ep_Q2_024_generator_17_0100_0199 =
      ep_Q2_024_partial_17_0139 := by
  native_decide

/-- Coefficient term 140 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0140 : Poly :=
[
  term ((-2140544576806429585465573269128715080 : Rat) / 39990315246749243218889784267651308933) [(2, 1)]
]

/-- Partial product 140 for generator 17. -/
def ep_Q2_024_partial_17_0140 : Poly :=
[
  term ((-4281089153612859170931146538257430160 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (6, 1), (14, 1)],
  term ((-4281089153612859170931146538257430160 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (7, 1), (15, 1)],
  term ((2140544576806429585465573269128715080 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (14, 2)],
  term ((2140544576806429585465573269128715080 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 140 for generator 17. -/
theorem ep_Q2_024_partial_17_0140_valid :
    mulPoly ep_Q2_024_coefficient_17_0140
        ep_Q2_024_generator_17_0100_0199 =
      ep_Q2_024_partial_17_0140 := by
  native_decide

/-- Coefficient term 141 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0141 : Poly :=
[
  term ((-4281089153612859170931146538257430160 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (3, 1), (9, 1)]
]

/-- Partial product 141 for generator 17. -/
def ep_Q2_024_partial_17_0141 : Poly :=
[
  term ((-8562178307225718341862293076514860320 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (3, 1), (6, 1), (9, 1), (14, 1)],
  term ((-8562178307225718341862293076514860320 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (3, 1), (7, 1), (9, 1), (15, 1)],
  term ((4281089153612859170931146538257430160 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (3, 1), (9, 1), (14, 2)],
  term ((4281089153612859170931146538257430160 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (3, 1), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 141 for generator 17. -/
theorem ep_Q2_024_partial_17_0141_valid :
    mulPoly ep_Q2_024_coefficient_17_0141
        ep_Q2_024_generator_17_0100_0199 =
      ep_Q2_024_partial_17_0141 := by
  native_decide

/-- Coefficient term 142 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0142 : Poly :=
[
  term ((-488150134807348973735746546824721247352 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (5, 1), (9, 1)]
]

/-- Partial product 142 for generator 17. -/
def ep_Q2_024_partial_17_0142 : Poly :=
[
  term ((-976300269614697947471493093649442494704 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (5, 1), (6, 1), (9, 1), (14, 1)],
  term ((-976300269614697947471493093649442494704 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (5, 1), (7, 1), (9, 1), (15, 1)],
  term ((488150134807348973735746546824721247352 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (5, 1), (9, 1), (14, 2)],
  term ((488150134807348973735746546824721247352 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (5, 1), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 142 for generator 17. -/
theorem ep_Q2_024_partial_17_0142_valid :
    mulPoly ep_Q2_024_coefficient_17_0142
        ep_Q2_024_generator_17_0100_0199 =
      ep_Q2_024_partial_17_0142 := by
  native_decide

/-- Coefficient term 143 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0143 : Poly :=
[
  term ((1320395533120304220261212135047939590164 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (7, 1), (9, 1)]
]

/-- Partial product 143 for generator 17. -/
def ep_Q2_024_partial_17_0143 : Poly :=
[
  term ((2640791066240608440522424270095879180328 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (6, 1), (7, 1), (9, 1), (14, 1)],
  term ((-1320395533120304220261212135047939590164 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (7, 1), (9, 1), (14, 2)],
  term ((-1320395533120304220261212135047939590164 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (7, 1), (9, 1), (15, 2)],
  term ((2640791066240608440522424270095879180328 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (7, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 143 for generator 17. -/
theorem ep_Q2_024_partial_17_0143_valid :
    mulPoly ep_Q2_024_coefficient_17_0143
        ep_Q2_024_generator_17_0100_0199 =
      ep_Q2_024_partial_17_0143 := by
  native_decide

/-- Coefficient term 144 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0144 : Poly :=
[
  term ((1077277655786558224075185495810441573248 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (7, 1), (13, 1)]
]

/-- Partial product 144 for generator 17. -/
def ep_Q2_024_partial_17_0144 : Poly :=
[
  term ((2154555311573116448150370991620883146496 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (6, 1), (7, 1), (13, 1), (14, 1)],
  term ((-1077277655786558224075185495810441573248 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (7, 1), (13, 1), (14, 2)],
  term ((-1077277655786558224075185495810441573248 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (7, 1), (13, 1), (15, 2)],
  term ((2154555311573116448150370991620883146496 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (7, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 144 for generator 17. -/
theorem ep_Q2_024_partial_17_0144_valid :
    mulPoly ep_Q2_024_coefficient_17_0144
        ep_Q2_024_generator_17_0100_0199 =
      ep_Q2_024_partial_17_0144 := by
  native_decide

/-- Coefficient term 145 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0145 : Poly :=
[
  term ((37050814747583503133753456969502764146050338642007357993 : Rat) / 929998952132019818504773430836265897467346423247461380) [(2, 1), (7, 1), (15, 1)]
]

/-- Partial product 145 for generator 17. -/
def ep_Q2_024_partial_17_0145 : Poly :=
[
  term ((37050814747583503133753456969502764146050338642007357993 : Rat) / 464999476066009909252386715418132948733673211623730690) [(2, 1), (6, 1), (7, 1), (14, 1), (15, 1)],
  term ((-37050814747583503133753456969502764146050338642007357993 : Rat) / 929998952132019818504773430836265897467346423247461380) [(2, 1), (7, 1), (14, 2), (15, 1)],
  term ((-37050814747583503133753456969502764146050338642007357993 : Rat) / 929998952132019818504773430836265897467346423247461380) [(2, 1), (7, 1), (15, 3)],
  term ((37050814747583503133753456969502764146050338642007357993 : Rat) / 464999476066009909252386715418132948733673211623730690) [(2, 1), (7, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 145 for generator 17. -/
theorem ep_Q2_024_partial_17_0145_valid :
    mulPoly ep_Q2_024_coefficient_17_0145
        ep_Q2_024_generator_17_0100_0199 =
      ep_Q2_024_partial_17_0145 := by
  native_decide

/-- Coefficient term 146 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0146 : Poly :=
[
  term ((-5146839986298265 : Rat) / 1162780221153193) [(2, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 146 for generator 17. -/
def ep_Q2_024_partial_17_0146 : Poly :=
[
  term ((-10293679972596530 : Rat) / 1162780221153193) [(2, 1), (6, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((5146839986298265 : Rat) / 1162780221153193) [(2, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((5146839986298265 : Rat) / 1162780221153193) [(2, 1), (7, 1), (15, 3), (16, 1)],
  term ((-10293679972596530 : Rat) / 1162780221153193) [(2, 1), (7, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 146 for generator 17. -/
theorem ep_Q2_024_partial_17_0146_valid :
    mulPoly ep_Q2_024_coefficient_17_0146
        ep_Q2_024_generator_17_0100_0199 =
      ep_Q2_024_partial_17_0146 := by
  native_decide

/-- Coefficient term 147 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0147 : Poly :=
[
  term ((1070272288403214792732786634564357540 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (8, 1)]
]

/-- Partial product 147 for generator 17. -/
def ep_Q2_024_partial_17_0147 : Poly :=
[
  term ((2140544576806429585465573269128715080 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (6, 1), (8, 1), (14, 1)],
  term ((2140544576806429585465573269128715080 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (7, 1), (8, 1), (15, 1)],
  term ((-1070272288403214792732786634564357540 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (8, 1), (14, 2)],
  term ((-1070272288403214792732786634564357540 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (8, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 147 for generator 17. -/
theorem ep_Q2_024_partial_17_0147_valid :
    mulPoly ep_Q2_024_coefficient_17_0147
        ep_Q2_024_generator_17_0100_0199 =
      ep_Q2_024_partial_17_0147 := by
  native_decide

/-- Coefficient term 148 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0148 : Poly :=
[
  term ((219707727724804497737993699911012602248 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (9, 1), (12, 1), (13, 1)]
]

/-- Partial product 148 for generator 17. -/
def ep_Q2_024_partial_17_0148 : Poly :=
[
  term ((439415455449608995475987399822025204496 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (6, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((439415455449608995475987399822025204496 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (7, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((-219707727724804497737993699911012602248 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (9, 1), (12, 1), (13, 1), (14, 2)],
  term ((-219707727724804497737993699911012602248 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (9, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 148 for generator 17. -/
theorem ep_Q2_024_partial_17_0148_valid :
    mulPoly ep_Q2_024_coefficient_17_0148
        ep_Q2_024_generator_17_0100_0199 =
      ep_Q2_024_partial_17_0148 := by
  native_decide

/-- Coefficient term 149 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0149 : Poly :=
[
  term ((-12049274504598496216515755251457168282118787774524673811 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(2, 1), (9, 1), (12, 1), (15, 1)]
]

/-- Partial product 149 for generator 17. -/
def ep_Q2_024_partial_17_0149 : Poly :=
[
  term ((-12049274504598496216515755251457168282118787774524673811 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 1), (6, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-12049274504598496216515755251457168282118787774524673811 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 1), (7, 1), (9, 1), (12, 1), (15, 2)],
  term ((12049274504598496216515755251457168282118787774524673811 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(2, 1), (9, 1), (12, 1), (14, 2), (15, 1)],
  term ((12049274504598496216515755251457168282118787774524673811 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(2, 1), (9, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 149 for generator 17. -/
theorem ep_Q2_024_partial_17_0149_valid :
    mulPoly ep_Q2_024_coefficient_17_0149
        ep_Q2_024_generator_17_0100_0199 =
      ep_Q2_024_partial_17_0149 := by
  native_decide

/-- Coefficient term 150 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0150 : Poly :=
[
  term ((1765379642691762 : Rat) / 1162780221153193) [(2, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 150 for generator 17. -/
def ep_Q2_024_partial_17_0150 : Poly :=
[
  term ((3530759285383524 : Rat) / 1162780221153193) [(2, 1), (6, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((3530759285383524 : Rat) / 1162780221153193) [(2, 1), (7, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-1765379642691762 : Rat) / 1162780221153193) [(2, 1), (9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1765379642691762 : Rat) / 1162780221153193) [(2, 1), (9, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 150 for generator 17. -/
theorem ep_Q2_024_partial_17_0150_valid :
    mulPoly ep_Q2_024_coefficient_17_0150
        ep_Q2_024_generator_17_0100_0199 =
      ep_Q2_024_partial_17_0150 := by
  native_decide

/-- Coefficient term 151 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0151 : Poly :=
[
  term ((-1179047648736525574436641626728707111192 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (9, 1), (13, 1)]
]

/-- Partial product 151 for generator 17. -/
def ep_Q2_024_partial_17_0151 : Poly :=
[
  term ((-2358095297473051148873283253457414222384 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (6, 1), (9, 1), (13, 1), (14, 1)],
  term ((-2358095297473051148873283253457414222384 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((1179047648736525574436641626728707111192 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (9, 1), (13, 1), (14, 2)],
  term ((1179047648736525574436641626728707111192 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (9, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 151 for generator 17. -/
theorem ep_Q2_024_partial_17_0151_valid :
    mulPoly ep_Q2_024_coefficient_17_0151
        ep_Q2_024_generator_17_0100_0199 =
      ep_Q2_024_partial_17_0151 := by
  native_decide

/-- Coefficient term 152 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0152 : Poly :=
[
  term ((-14196517601773516590767417445202934775456712459412517367 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 1), (9, 1), (15, 1)]
]

/-- Partial product 152 for generator 17. -/
def ep_Q2_024_partial_17_0152 : Poly :=
[
  term ((-28393035203547033181534834890405869550913424918825034734 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 1), (6, 1), (9, 1), (14, 1), (15, 1)],
  term ((-28393035203547033181534834890405869550913424918825034734 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 1), (7, 1), (9, 1), (15, 2)],
  term ((14196517601773516590767417445202934775456712459412517367 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 1), (9, 1), (14, 2), (15, 1)],
  term ((14196517601773516590767417445202934775456712459412517367 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 1), (9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 152 for generator 17. -/
theorem ep_Q2_024_partial_17_0152_valid :
    mulPoly ep_Q2_024_coefficient_17_0152
        ep_Q2_024_generator_17_0100_0199 =
      ep_Q2_024_partial_17_0152 := by
  native_decide

/-- Coefficient term 153 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0153 : Poly :=
[
  term ((5366719714966844 : Rat) / 1162780221153193) [(2, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 153 for generator 17. -/
def ep_Q2_024_partial_17_0153 : Poly :=
[
  term ((10733439429933688 : Rat) / 1162780221153193) [(2, 1), (6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((10733439429933688 : Rat) / 1162780221153193) [(2, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((-5366719714966844 : Rat) / 1162780221153193) [(2, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-5366719714966844 : Rat) / 1162780221153193) [(2, 1), (9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 153 for generator 17. -/
theorem ep_Q2_024_partial_17_0153_valid :
    mulPoly ep_Q2_024_coefficient_17_0153
        ep_Q2_024_generator_17_0100_0199 =
      ep_Q2_024_partial_17_0153 := by
  native_decide

/-- Coefficient term 154 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0154 : Poly :=
[
  term ((-2530538553556032069578661798072141691796 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (9, 2)]
]

/-- Partial product 154 for generator 17. -/
def ep_Q2_024_partial_17_0154 : Poly :=
[
  term ((-5061077107112064139157323596144283383592 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (6, 1), (9, 2), (14, 1)],
  term ((-5061077107112064139157323596144283383592 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (7, 1), (9, 2), (15, 1)],
  term ((2530538553556032069578661798072141691796 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (9, 2), (14, 2)],
  term ((2530538553556032069578661798072141691796 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (9, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 154 for generator 17. -/
theorem ep_Q2_024_partial_17_0154_valid :
    mulPoly ep_Q2_024_coefficient_17_0154
        ep_Q2_024_generator_17_0100_0199 =
      ep_Q2_024_partial_17_0154 := by
  native_decide

/-- Coefficient term 155 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0155 : Poly :=
[
  term ((1070272288403214792732786634564357540 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (12, 1)]
]

/-- Partial product 155 for generator 17. -/
def ep_Q2_024_partial_17_0155 : Poly :=
[
  term ((2140544576806429585465573269128715080 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (6, 1), (12, 1), (14, 1)],
  term ((2140544576806429585465573269128715080 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (7, 1), (12, 1), (15, 1)],
  term ((-1070272288403214792732786634564357540 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (12, 1), (14, 2)],
  term ((-1070272288403214792732786634564357540 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 155 for generator 17. -/
theorem ep_Q2_024_partial_17_0155_valid :
    mulPoly ep_Q2_024_coefficient_17_0155
        ep_Q2_024_generator_17_0100_0199 =
      ep_Q2_024_partial_17_0155 := by
  native_decide

/-- Coefficient term 156 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0156 : Poly :=
[
  term ((4460575763931020940779677802964195788 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (14, 1)]
]

/-- Partial product 156 for generator 17. -/
def ep_Q2_024_partial_17_0156 : Poly :=
[
  term ((8921151527862041881559355605928391576 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (6, 1), (14, 2)],
  term ((8921151527862041881559355605928391576 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (7, 1), (14, 1), (15, 1)],
  term ((-4460575763931020940779677802964195788 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (14, 1), (15, 2)],
  term ((-4460575763931020940779677802964195788 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 156 for generator 17. -/
theorem ep_Q2_024_partial_17_0156_valid :
    mulPoly ep_Q2_024_coefficient_17_0156
        ep_Q2_024_generator_17_0100_0199 =
      ep_Q2_024_partial_17_0156 := by
  native_decide

/-- Coefficient term 157 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0157 : Poly :=
[
  term ((2930149234713651113130679487801312091016 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (4, 1), (9, 1)]
]

/-- Partial product 157 for generator 17. -/
def ep_Q2_024_partial_17_0157 : Poly :=
[
  term ((5860298469427302226261358975602624182032 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (4, 1), (6, 1), (9, 1), (14, 1)],
  term ((5860298469427302226261358975602624182032 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (4, 1), (7, 1), (9, 1), (15, 1)],
  term ((-2930149234713651113130679487801312091016 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (4, 1), (9, 1), (14, 2)],
  term ((-2930149234713651113130679487801312091016 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (4, 1), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 157 for generator 17. -/
theorem ep_Q2_024_partial_17_0157_valid :
    mulPoly ep_Q2_024_coefficient_17_0157
        ep_Q2_024_generator_17_0100_0199 =
      ep_Q2_024_partial_17_0157 := by
  native_decide

/-- Coefficient term 158 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0158 : Poly :=
[
  term ((-33781967257793617486815206073153137696 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (7, 1), (9, 1)]
]

/-- Partial product 158 for generator 17. -/
def ep_Q2_024_partial_17_0158 : Poly :=
[
  term ((-67563934515587234973630412146306275392 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (6, 1), (7, 1), (9, 1), (14, 1)],
  term ((33781967257793617486815206073153137696 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (7, 1), (9, 1), (14, 2)],
  term ((33781967257793617486815206073153137696 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (7, 1), (9, 1), (15, 2)],
  term ((-67563934515587234973630412146306275392 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (7, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 158 for generator 17. -/
theorem ep_Q2_024_partial_17_0158_valid :
    mulPoly ep_Q2_024_coefficient_17_0158
        ep_Q2_024_generator_17_0100_0199 =
      ep_Q2_024_partial_17_0158 := by
  native_decide

/-- Coefficient term 159 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0159 : Poly :=
[
  term ((-40440149595023928932116585720924683072 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (7, 1), (13, 1)]
]

/-- Partial product 159 for generator 17. -/
def ep_Q2_024_partial_17_0159 : Poly :=
[
  term ((-80880299190047857864233171441849366144 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (6, 1), (7, 1), (13, 1), (14, 1)],
  term ((40440149595023928932116585720924683072 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (7, 1), (13, 1), (14, 2)],
  term ((40440149595023928932116585720924683072 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (7, 1), (13, 1), (15, 2)],
  term ((-80880299190047857864233171441849366144 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (7, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 159 for generator 17. -/
theorem ep_Q2_024_partial_17_0159_valid :
    mulPoly ep_Q2_024_coefficient_17_0159
        ep_Q2_024_generator_17_0100_0199 =
      ep_Q2_024_partial_17_0159 := by
  native_decide

/-- Coefficient term 160 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0160 : Poly :=
[
  term ((2173624517752731263429423385757322935670570690431915648 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (5, 1), (7, 1), (15, 1)]
]

/-- Partial product 160 for generator 17. -/
def ep_Q2_024_partial_17_0160 : Poly :=
[
  term ((4347249035505462526858846771514645871341141380863831296 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (5, 1), (6, 1), (7, 1), (14, 1), (15, 1)],
  term ((-2173624517752731263429423385757322935670570690431915648 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (5, 1), (7, 1), (14, 2), (15, 1)],
  term ((-2173624517752731263429423385757322935670570690431915648 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (5, 1), (7, 1), (15, 3)],
  term ((4347249035505462526858846771514645871341141380863831296 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (5, 1), (7, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 160 for generator 17. -/
theorem ep_Q2_024_partial_17_0160_valid :
    mulPoly ep_Q2_024_coefficient_17_0160
        ep_Q2_024_generator_17_0100_0199 =
      ep_Q2_024_partial_17_0160 := by
  native_decide

/-- Coefficient term 161 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0161 : Poly :=
[
  term ((206941537023232 : Rat) / 1162780221153193) [(3, 1), (5, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 161 for generator 17. -/
def ep_Q2_024_partial_17_0161 : Poly :=
[
  term ((413883074046464 : Rat) / 1162780221153193) [(3, 1), (5, 1), (6, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-206941537023232 : Rat) / 1162780221153193) [(3, 1), (5, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-206941537023232 : Rat) / 1162780221153193) [(3, 1), (5, 1), (7, 1), (15, 3), (16, 1)],
  term ((413883074046464 : Rat) / 1162780221153193) [(3, 1), (5, 1), (7, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 161 for generator 17. -/
theorem ep_Q2_024_partial_17_0161_valid :
    mulPoly ep_Q2_024_coefficient_17_0161
        ep_Q2_024_generator_17_0100_0199 =
      ep_Q2_024_partial_17_0161 := by
  native_decide

/-- Coefficient term 162 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0162 : Poly :=
[
  term ((195472833730678188627374464114891944832 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (5, 1), (9, 1), (13, 1)]
]

/-- Partial product 162 for generator 17. -/
def ep_Q2_024_partial_17_0162 : Poly :=
[
  term ((390945667461356377254748928229783889664 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (5, 1), (6, 1), (9, 1), (13, 1), (14, 1)],
  term ((390945667461356377254748928229783889664 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (5, 1), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((-195472833730678188627374464114891944832 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (5, 1), (9, 1), (13, 1), (14, 2)],
  term ((-195472833730678188627374464114891944832 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (5, 1), (9, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 162 for generator 17. -/
theorem ep_Q2_024_partial_17_0162_valid :
    mulPoly ep_Q2_024_coefficient_17_0162
        ep_Q2_024_generator_17_0100_0199 =
      ep_Q2_024_partial_17_0162 := by
  native_decide

/-- Coefficient term 163 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0163 : Poly :=
[
  term ((372888177235126313188097315327845719657294457097438278 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 1), (5, 1), (9, 1), (15, 1)]
]

/-- Partial product 163 for generator 17. -/
def ep_Q2_024_partial_17_0163 : Poly :=
[
  term ((745776354470252626376194630655691439314588914194876556 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 1), (5, 1), (6, 1), (9, 1), (14, 1), (15, 1)],
  term ((745776354470252626376194630655691439314588914194876556 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 1), (5, 1), (7, 1), (9, 1), (15, 2)],
  term ((-372888177235126313188097315327845719657294457097438278 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 1), (5, 1), (9, 1), (14, 2), (15, 1)],
  term ((-372888177235126313188097315327845719657294457097438278 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 1), (5, 1), (9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 163 for generator 17. -/
theorem ep_Q2_024_partial_17_0163_valid :
    mulPoly ep_Q2_024_coefficient_17_0163
        ep_Q2_024_generator_17_0100_0199 =
      ep_Q2_024_partial_17_0163 := by
  native_decide

/-- Coefficient term 164 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0164 : Poly :=
[
  term ((-720356459271080 : Rat) / 1162780221153193) [(3, 1), (5, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 164 for generator 17. -/
def ep_Q2_024_partial_17_0164 : Poly :=
[
  term ((-1440712918542160 : Rat) / 1162780221153193) [(3, 1), (5, 1), (6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1440712918542160 : Rat) / 1162780221153193) [(3, 1), (5, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((720356459271080 : Rat) / 1162780221153193) [(3, 1), (5, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((720356459271080 : Rat) / 1162780221153193) [(3, 1), (5, 1), (9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 164 for generator 17. -/
theorem ep_Q2_024_partial_17_0164_valid :
    mulPoly ep_Q2_024_coefficient_17_0164
        ep_Q2_024_generator_17_0100_0199 =
      ep_Q2_024_partial_17_0164 := by
  native_decide

/-- Coefficient term 165 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0165 : Poly :=
[
  term ((33781967257793617486815206073153137696 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (9, 2)]
]

/-- Partial product 165 for generator 17. -/
def ep_Q2_024_partial_17_0165 : Poly :=
[
  term ((67563934515587234973630412146306275392 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (6, 1), (9, 2), (14, 1)],
  term ((67563934515587234973630412146306275392 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (7, 1), (9, 2), (15, 1)],
  term ((-33781967257793617486815206073153137696 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (9, 2), (14, 2)],
  term ((-33781967257793617486815206073153137696 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (9, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 165 for generator 17. -/
theorem ep_Q2_024_partial_17_0165_valid :
    mulPoly ep_Q2_024_coefficient_17_0165
        ep_Q2_024_generator_17_0100_0199 =
      ep_Q2_024_partial_17_0165 := by
  native_decide

/-- Coefficient term 166 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0166 : Poly :=
[
  term ((-56935318687050373770433198734129544818 : Rat) / 39990315246749243218889784267651308933) [(3, 1), (7, 1)]
]

/-- Partial product 166 for generator 17. -/
def ep_Q2_024_partial_17_0166 : Poly :=
[
  term ((-113870637374100747540866397468259089636 : Rat) / 39990315246749243218889784267651308933) [(3, 1), (6, 1), (7, 1), (14, 1)],
  term ((56935318687050373770433198734129544818 : Rat) / 39990315246749243218889784267651308933) [(3, 1), (7, 1), (14, 2)],
  term ((56935318687050373770433198734129544818 : Rat) / 39990315246749243218889784267651308933) [(3, 1), (7, 1), (15, 2)],
  term ((-113870637374100747540866397468259089636 : Rat) / 39990315246749243218889784267651308933) [(3, 1), (7, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 166 for generator 17. -/
theorem ep_Q2_024_partial_17_0166_valid :
    mulPoly ep_Q2_024_coefficient_17_0166
        ep_Q2_024_generator_17_0100_0199 =
      ep_Q2_024_partial_17_0166 := by
  native_decide

/-- Coefficient term 167 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0167 : Poly :=
[
  term ((156549602987398445852407283417014511808 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (7, 1), (9, 1), (13, 1)]
]

/-- Partial product 167 for generator 17. -/
def ep_Q2_024_partial_17_0167 : Poly :=
[
  term ((313099205974796891704814566834029023616 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (6, 1), (7, 1), (9, 1), (13, 1), (14, 1)],
  term ((-156549602987398445852407283417014511808 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (7, 1), (9, 1), (13, 1), (14, 2)],
  term ((-156549602987398445852407283417014511808 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (7, 1), (9, 1), (13, 1), (15, 2)],
  term ((313099205974796891704814566834029023616 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (7, 2), (9, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 167 for generator 17. -/
theorem ep_Q2_024_partial_17_0167_valid :
    mulPoly ep_Q2_024_coefficient_17_0167
        ep_Q2_024_generator_17_0100_0199 =
      ep_Q2_024_partial_17_0167 := by
  native_decide

/-- Coefficient term 168 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0168 : Poly :=
[
  term ((-2449020209846403374712074673893548417307732695016543182 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (7, 1), (9, 1), (15, 1)]
]

/-- Partial product 168 for generator 17. -/
def ep_Q2_024_partial_17_0168 : Poly :=
[
  term ((-4898040419692806749424149347787096834615465390033086364 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (6, 1), (7, 1), (9, 1), (14, 1), (15, 1)],
  term ((2449020209846403374712074673893548417307732695016543182 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (7, 1), (9, 1), (14, 2), (15, 1)],
  term ((2449020209846403374712074673893548417307732695016543182 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (7, 1), (9, 1), (15, 3)],
  term ((-4898040419692806749424149347787096834615465390033086364 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (7, 2), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 168 for generator 17. -/
theorem ep_Q2_024_partial_17_0168_valid :
    mulPoly ep_Q2_024_coefficient_17_0168
        ep_Q2_024_generator_17_0100_0199 =
      ep_Q2_024_partial_17_0168 := by
  native_decide

/-- Coefficient term 169 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0169 : Poly :=
[
  term ((1495148449544936 : Rat) / 1162780221153193) [(3, 1), (7, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 169 for generator 17. -/
def ep_Q2_024_partial_17_0169 : Poly :=
[
  term ((2990296899089872 : Rat) / 1162780221153193) [(3, 1), (6, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1495148449544936 : Rat) / 1162780221153193) [(3, 1), (7, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1495148449544936 : Rat) / 1162780221153193) [(3, 1), (7, 1), (9, 1), (15, 3), (16, 1)],
  term ((2990296899089872 : Rat) / 1162780221153193) [(3, 1), (7, 2), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 169 for generator 17. -/
theorem ep_Q2_024_partial_17_0169_valid :
    mulPoly ep_Q2_024_coefficient_17_0169
        ep_Q2_024_generator_17_0100_0199 =
      ep_Q2_024_partial_17_0169 := by
  native_decide

/-- Coefficient term 170 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0170 : Poly :=
[
  term ((126225064372939892662610287863400842112 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (7, 1), (9, 2)]
]

/-- Partial product 170 for generator 17. -/
def ep_Q2_024_partial_17_0170 : Poly :=
[
  term ((252450128745879785325220575726801684224 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (6, 1), (7, 1), (9, 2), (14, 1)],
  term ((-126225064372939892662610287863400842112 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (7, 1), (9, 2), (14, 2)],
  term ((-126225064372939892662610287863400842112 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (7, 1), (9, 2), (15, 2)],
  term ((252450128745879785325220575726801684224 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (7, 2), (9, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 170 for generator 17. -/
theorem ep_Q2_024_partial_17_0170_valid :
    mulPoly ep_Q2_024_coefficient_17_0170
        ep_Q2_024_generator_17_0100_0199 =
      ep_Q2_024_partial_17_0170 := by
  native_decide

/-- Coefficient term 171 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0171 : Poly :=
[
  term ((-11505073964399522846249871046495738097852688577051920964 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (7, 1), (13, 1), (15, 1)]
]

/-- Partial product 171 for generator 17. -/
def ep_Q2_024_partial_17_0171 : Poly :=
[
  term ((-23010147928799045692499742092991476195705377154103841928 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (6, 1), (7, 1), (13, 1), (14, 1), (15, 1)],
  term ((11505073964399522846249871046495738097852688577051920964 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (7, 1), (13, 1), (14, 2), (15, 1)],
  term ((11505073964399522846249871046495738097852688577051920964 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (7, 1), (13, 1), (15, 3)],
  term ((-23010147928799045692499742092991476195705377154103841928 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (7, 2), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 171 for generator 17. -/
theorem ep_Q2_024_partial_17_0171_valid :
    mulPoly ep_Q2_024_coefficient_17_0171
        ep_Q2_024_generator_17_0100_0199 =
      ep_Q2_024_partial_17_0171 := by
  native_decide

/-- Coefficient term 172 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0172 : Poly :=
[
  term ((150661185588720 : Rat) / 1162780221153193) [(3, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 172 for generator 17. -/
def ep_Q2_024_partial_17_0172 : Poly :=
[
  term ((301322371177440 : Rat) / 1162780221153193) [(3, 1), (6, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-150661185588720 : Rat) / 1162780221153193) [(3, 1), (7, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-150661185588720 : Rat) / 1162780221153193) [(3, 1), (7, 1), (13, 1), (15, 3), (16, 1)],
  term ((301322371177440 : Rat) / 1162780221153193) [(3, 1), (7, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 172 for generator 17. -/
theorem ep_Q2_024_partial_17_0172_valid :
    mulPoly ep_Q2_024_coefficient_17_0172
        ep_Q2_024_generator_17_0100_0199 =
      ep_Q2_024_partial_17_0172 := by
  native_decide

/-- Coefficient term 173 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0173 : Poly :=
[
  term ((80945856112067634232098240062478093344 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (7, 1), (13, 2)]
]

/-- Partial product 173 for generator 17. -/
def ep_Q2_024_partial_17_0173 : Poly :=
[
  term ((161891712224135268464196480124956186688 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (6, 1), (7, 1), (13, 2), (14, 1)],
  term ((-80945856112067634232098240062478093344 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (7, 1), (13, 2), (14, 2)],
  term ((-80945856112067634232098240062478093344 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (7, 1), (13, 2), (15, 2)],
  term ((161891712224135268464196480124956186688 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (7, 2), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 173 for generator 17. -/
theorem ep_Q2_024_partial_17_0173_valid :
    mulPoly ep_Q2_024_coefficient_17_0173
        ep_Q2_024_generator_17_0100_0199 =
      ep_Q2_024_partial_17_0173 := by
  native_decide

/-- Coefficient term 174 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0174 : Poly :=
[
  term ((17842303055724083763118711211856783152 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (7, 1), (14, 1)]
]

/-- Partial product 174 for generator 17. -/
def ep_Q2_024_partial_17_0174 : Poly :=
[
  term ((35684606111448167526237422423713566304 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (6, 1), (7, 1), (14, 2)],
  term ((-17842303055724083763118711211856783152 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (7, 1), (14, 1), (15, 2)],
  term ((-17842303055724083763118711211856783152 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (7, 1), (14, 3)],
  term ((35684606111448167526237422423713566304 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (7, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 174 for generator 17. -/
theorem ep_Q2_024_partial_17_0174_valid :
    mulPoly ep_Q2_024_coefficient_17_0174
        ep_Q2_024_generator_17_0100_0199 =
      ep_Q2_024_partial_17_0174 := by
  native_decide

/-- Coefficient term 175 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0175 : Poly :=
[
  term ((5633709133854896624680034347401390035670218004313073105 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 1), (7, 1), (15, 2)]
]

/-- Partial product 175 for generator 17. -/
def ep_Q2_024_partial_17_0175 : Poly :=
[
  term ((11267418267709793249360068694802780071340436008626146210 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 1), (6, 1), (7, 1), (14, 1), (15, 2)],
  term ((-5633709133854896624680034347401390035670218004313073105 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 1), (7, 1), (14, 2), (15, 2)],
  term ((-5633709133854896624680034347401390035670218004313073105 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 1), (7, 1), (15, 4)],
  term ((11267418267709793249360068694802780071340436008626146210 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 1), (7, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 175 for generator 17. -/
theorem ep_Q2_024_partial_17_0175_valid :
    mulPoly ep_Q2_024_coefficient_17_0175
        ep_Q2_024_generator_17_0100_0199 =
      ep_Q2_024_partial_17_0175 := by
  native_decide

/-- Coefficient term 176 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0176 : Poly :=
[
  term ((-4263316396002204 : Rat) / 1162780221153193) [(3, 1), (7, 1), (15, 2), (16, 1)]
]

/-- Partial product 176 for generator 17. -/
def ep_Q2_024_partial_17_0176 : Poly :=
[
  term ((-8526632792004408 : Rat) / 1162780221153193) [(3, 1), (6, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((4263316396002204 : Rat) / 1162780221153193) [(3, 1), (7, 1), (14, 2), (15, 2), (16, 1)],
  term ((4263316396002204 : Rat) / 1162780221153193) [(3, 1), (7, 1), (15, 4), (16, 1)],
  term ((-8526632792004408 : Rat) / 1162780221153193) [(3, 1), (7, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 176 for generator 17. -/
theorem ep_Q2_024_partial_17_0176_valid :
    mulPoly ep_Q2_024_coefficient_17_0176
        ep_Q2_024_generator_17_0100_0199 =
      ep_Q2_024_partial_17_0176 := by
  native_decide

/-- Coefficient term 177 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0177 : Poly :=
[
  term ((-1652695128300478652375073904873736949728 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (8, 1), (9, 1)]
]

/-- Partial product 177 for generator 17. -/
def ep_Q2_024_partial_17_0177 : Poly :=
[
  term ((-3305390256600957304750147809747473899456 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (6, 1), (8, 1), (9, 1), (14, 1)],
  term ((-3305390256600957304750147809747473899456 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (7, 1), (8, 1), (9, 1), (15, 1)],
  term ((1652695128300478652375073904873736949728 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (8, 1), (9, 1), (14, 2)],
  term ((1652695128300478652375073904873736949728 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (8, 1), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 177 for generator 17. -/
theorem ep_Q2_024_partial_17_0177_valid :
    mulPoly ep_Q2_024_coefficient_17_0177
        ep_Q2_024_generator_17_0100_0199 =
      ep_Q2_024_partial_17_0177 := by
  native_decide

/-- Coefficient term 178 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0178 : Poly :=
[
  term ((1265214758912177429154822639424997249612 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (9, 1)]
]

/-- Partial product 178 for generator 17. -/
def ep_Q2_024_partial_17_0178 : Poly :=
[
  term ((2530429517824354858309645278849994499224 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (6, 1), (9, 1), (14, 1)],
  term ((2530429517824354858309645278849994499224 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (7, 1), (9, 1), (15, 1)],
  term ((-1265214758912177429154822639424997249612 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (9, 1), (14, 2)],
  term ((-1265214758912177429154822639424997249612 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 178 for generator 17. -/
theorem ep_Q2_024_partial_17_0178_valid :
    mulPoly ep_Q2_024_coefficient_17_0178
        ep_Q2_024_generator_17_0100_0199 =
      ep_Q2_024_partial_17_0178 := by
  native_decide

/-- Coefficient term 179 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0179 : Poly :=
[
  term ((-179900494408894967444133818184926615716 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (9, 1), (12, 1)]
]

/-- Partial product 179 for generator 17. -/
def ep_Q2_024_partial_17_0179 : Poly :=
[
  term ((-359800988817789934888267636369853231432 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (6, 1), (9, 1), (12, 1), (14, 1)],
  term ((-359800988817789934888267636369853231432 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (7, 1), (9, 1), (12, 1), (15, 1)],
  term ((179900494408894967444133818184926615716 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (9, 1), (12, 1), (14, 2)],
  term ((179900494408894967444133818184926615716 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (9, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 179 for generator 17. -/
theorem ep_Q2_024_partial_17_0179_valid :
    mulPoly ep_Q2_024_coefficient_17_0179
        ep_Q2_024_generator_17_0100_0199 =
      ep_Q2_024_partial_17_0179 := by
  native_decide

/-- Coefficient term 180 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0180 : Poly :=
[
  term ((3209257923513847776562869360713708288 : Rat) / 39990315246749243218889784267651308933) [(3, 1), (9, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 180 for generator 17. -/
def ep_Q2_024_partial_17_0180 : Poly :=
[
  term ((6418515847027695553125738721427416576 : Rat) / 39990315246749243218889784267651308933) [(3, 1), (6, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((6418515847027695553125738721427416576 : Rat) / 39990315246749243218889784267651308933) [(3, 1), (7, 1), (9, 1), (12, 1), (13, 1), (15, 2)],
  term ((-3209257923513847776562869360713708288 : Rat) / 39990315246749243218889784267651308933) [(3, 1), (9, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((-3209257923513847776562869360713708288 : Rat) / 39990315246749243218889784267651308933) [(3, 1), (9, 1), (12, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 180 for generator 17. -/
theorem ep_Q2_024_partial_17_0180_valid :
    mulPoly ep_Q2_024_coefficient_17_0180
        ep_Q2_024_generator_17_0100_0199 =
      ep_Q2_024_partial_17_0180 := by
  native_decide

/-- Coefficient term 181 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0181 : Poly :=
[
  term ((-550224871676112102035615555952179792604942567145793832 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (9, 1), (12, 1), (15, 2)]
]

/-- Partial product 181 for generator 17. -/
def ep_Q2_024_partial_17_0181 : Poly :=
[
  term ((-1100449743352224204071231111904359585209885134291587664 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (6, 1), (9, 1), (12, 1), (14, 1), (15, 2)],
  term ((-1100449743352224204071231111904359585209885134291587664 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (7, 1), (9, 1), (12, 1), (15, 3)],
  term ((550224871676112102035615555952179792604942567145793832 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (9, 1), (12, 1), (14, 2), (15, 2)],
  term ((550224871676112102035615555952179792604942567145793832 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (9, 1), (12, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 181 for generator 17. -/
theorem ep_Q2_024_partial_17_0181_valid :
    mulPoly ep_Q2_024_coefficient_17_0181
        ep_Q2_024_generator_17_0100_0199 =
      ep_Q2_024_partial_17_0181 := by
  native_decide

/-- Coefficient term 182 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0182 : Poly :=
[
  term ((1443384088015008 : Rat) / 1162780221153193) [(3, 1), (9, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 182 for generator 17. -/
def ep_Q2_024_partial_17_0182 : Poly :=
[
  term ((2886768176030016 : Rat) / 1162780221153193) [(3, 1), (6, 1), (9, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((2886768176030016 : Rat) / 1162780221153193) [(3, 1), (7, 1), (9, 1), (12, 1), (15, 3), (16, 1)],
  term ((-1443384088015008 : Rat) / 1162780221153193) [(3, 1), (9, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((-1443384088015008 : Rat) / 1162780221153193) [(3, 1), (9, 1), (12, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 182 for generator 17. -/
theorem ep_Q2_024_partial_17_0182_valid :
    mulPoly ep_Q2_024_coefficient_17_0182
        ep_Q2_024_generator_17_0100_0199 =
      ep_Q2_024_partial_17_0182 := by
  native_decide

/-- Coefficient term 183 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0183 : Poly :=
[
  term ((-43135328846876119407214699700298383881329052598883204313 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(3, 1), (9, 1), (13, 1), (15, 1)]
]

/-- Partial product 183 for generator 17. -/
def ep_Q2_024_partial_17_0183 : Poly :=
[
  term ((-43135328846876119407214699700298383881329052598883204313 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (6, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((-43135328846876119407214699700298383881329052598883204313 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (7, 1), (9, 1), (13, 1), (15, 2)],
  term ((43135328846876119407214699700298383881329052598883204313 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(3, 1), (9, 1), (13, 1), (14, 2), (15, 1)],
  term ((43135328846876119407214699700298383881329052598883204313 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(3, 1), (9, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 183 for generator 17. -/
theorem ep_Q2_024_partial_17_0183_valid :
    mulPoly ep_Q2_024_coefficient_17_0183
        ep_Q2_024_generator_17_0100_0199 =
      ep_Q2_024_partial_17_0183 := by
  native_decide

/-- Coefficient term 184 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0184 : Poly :=
[
  term ((212582817171990 : Rat) / 1162780221153193) [(3, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 184 for generator 17. -/
def ep_Q2_024_partial_17_0184 : Poly :=
[
  term ((425165634343980 : Rat) / 1162780221153193) [(3, 1), (6, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((425165634343980 : Rat) / 1162780221153193) [(3, 1), (7, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-212582817171990 : Rat) / 1162780221153193) [(3, 1), (9, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-212582817171990 : Rat) / 1162780221153193) [(3, 1), (9, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 184 for generator 17. -/
theorem ep_Q2_024_partial_17_0184_valid :
    mulPoly ep_Q2_024_coefficient_17_0184
        ep_Q2_024_generator_17_0100_0199 =
      ep_Q2_024_partial_17_0184 := by
  native_decide

/-- Coefficient term 185 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0185 : Poly :=
[
  term ((-32374617250718488653403865302693490632 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (9, 1), (13, 2)]
]

/-- Partial product 185 for generator 17. -/
def ep_Q2_024_partial_17_0185 : Poly :=
[
  term ((-64749234501436977306807730605386981264 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (6, 1), (9, 1), (13, 2), (14, 1)],
  term ((-64749234501436977306807730605386981264 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (7, 1), (9, 1), (13, 2), (15, 1)],
  term ((32374617250718488653403865302693490632 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (9, 1), (13, 2), (14, 2)],
  term ((32374617250718488653403865302693490632 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (9, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 185 for generator 17. -/
theorem ep_Q2_024_partial_17_0185_valid :
    mulPoly ep_Q2_024_coefficient_17_0185
        ep_Q2_024_generator_17_0100_0199 =
      ep_Q2_024_partial_17_0185 := by
  native_decide

/-- Coefficient term 186 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0186 : Poly :=
[
  term ((-1217648963717924911224184363882747984154 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (9, 1), (14, 1)]
]

/-- Partial product 186 for generator 17. -/
def ep_Q2_024_partial_17_0186 : Poly :=
[
  term ((-2435297927435849822448368727765495968308 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (6, 1), (9, 1), (14, 2)],
  term ((-2435297927435849822448368727765495968308 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (7, 1), (9, 1), (14, 1), (15, 1)],
  term ((1217648963717924911224184363882747984154 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (9, 1), (14, 1), (15, 2)],
  term ((1217648963717924911224184363882747984154 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (9, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 186 for generator 17. -/
theorem ep_Q2_024_partial_17_0186_valid :
    mulPoly ep_Q2_024_coefficient_17_0186
        ep_Q2_024_generator_17_0100_0199 =
      ep_Q2_024_partial_17_0186 := by
  native_decide

/-- Coefficient term 187 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0187 : Poly :=
[
  term ((-4666118582264079879312520807185554929005944364492589137 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (9, 1), (15, 2)]
]

/-- Partial product 187 for generator 17. -/
def ep_Q2_024_partial_17_0187 : Poly :=
[
  term ((-9332237164528159758625041614371109858011888728985178274 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (6, 1), (9, 1), (14, 1), (15, 2)],
  term ((-9332237164528159758625041614371109858011888728985178274 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (7, 1), (9, 1), (15, 3)],
  term ((4666118582264079879312520807185554929005944364492589137 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (9, 1), (14, 2), (15, 2)],
  term ((4666118582264079879312520807185554929005944364492589137 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (9, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 187 for generator 17. -/
theorem ep_Q2_024_partial_17_0187_valid :
    mulPoly ep_Q2_024_coefficient_17_0187
        ep_Q2_024_generator_17_0100_0199 =
      ep_Q2_024_partial_17_0187 := by
  native_decide

/-- Coefficient term 188 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0188 : Poly :=
[
  term ((7791585621739076 : Rat) / 1162780221153193) [(3, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 188 for generator 17. -/
def ep_Q2_024_partial_17_0188 : Poly :=
[
  term ((15583171243478152 : Rat) / 1162780221153193) [(3, 1), (6, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((15583171243478152 : Rat) / 1162780221153193) [(3, 1), (7, 1), (9, 1), (15, 3), (16, 1)],
  term ((-7791585621739076 : Rat) / 1162780221153193) [(3, 1), (9, 1), (14, 2), (15, 2), (16, 1)],
  term ((-7791585621739076 : Rat) / 1162780221153193) [(3, 1), (9, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 188 for generator 17. -/
theorem ep_Q2_024_partial_17_0188_valid :
    mulPoly ep_Q2_024_coefficient_17_0188
        ep_Q2_024_generator_17_0100_0199 =
      ep_Q2_024_partial_17_0188 := by
  native_decide

/-- Coefficient term 189 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0189 : Poly :=
[
  term ((234824404481097668778610925125521767712 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (9, 2), (13, 1)]
]

/-- Partial product 189 for generator 17. -/
def ep_Q2_024_partial_17_0189 : Poly :=
[
  term ((469648808962195337557221850251043535424 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (6, 1), (9, 2), (13, 1), (14, 1)],
  term ((469648808962195337557221850251043535424 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (7, 1), (9, 2), (13, 1), (15, 1)],
  term ((-234824404481097668778610925125521767712 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (9, 2), (13, 1), (14, 2)],
  term ((-234824404481097668778610925125521767712 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (9, 2), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 189 for generator 17. -/
theorem ep_Q2_024_partial_17_0189_valid :
    mulPoly ep_Q2_024_coefficient_17_0189
        ep_Q2_024_generator_17_0100_0199 =
      ep_Q2_024_partial_17_0189 := by
  native_decide

/-- Coefficient term 190 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0190 : Poly :=
[
  term ((-1224510104923201687356037336946774208653866347508271591 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (9, 2), (15, 1)]
]

/-- Partial product 190 for generator 17. -/
def ep_Q2_024_partial_17_0190 : Poly :=
[
  term ((-2449020209846403374712074673893548417307732695016543182 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (6, 1), (9, 2), (14, 1), (15, 1)],
  term ((-2449020209846403374712074673893548417307732695016543182 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (7, 1), (9, 2), (15, 2)],
  term ((1224510104923201687356037336946774208653866347508271591 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (9, 2), (14, 2), (15, 1)],
  term ((1224510104923201687356037336946774208653866347508271591 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (9, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 190 for generator 17. -/
theorem ep_Q2_024_partial_17_0190_valid :
    mulPoly ep_Q2_024_coefficient_17_0190
        ep_Q2_024_generator_17_0100_0199 =
      ep_Q2_024_partial_17_0190 := by
  native_decide

/-- Coefficient term 191 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0191 : Poly :=
[
  term ((2242722674317404 : Rat) / 1162780221153193) [(3, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 191 for generator 17. -/
def ep_Q2_024_partial_17_0191 : Poly :=
[
  term ((4485445348634808 : Rat) / 1162780221153193) [(3, 1), (6, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((4485445348634808 : Rat) / 1162780221153193) [(3, 1), (7, 1), (9, 2), (15, 2), (16, 1)],
  term ((-2242722674317404 : Rat) / 1162780221153193) [(3, 1), (9, 2), (14, 2), (15, 1), (16, 1)],
  term ((-2242722674317404 : Rat) / 1162780221153193) [(3, 1), (9, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 191 for generator 17. -/
theorem ep_Q2_024_partial_17_0191_valid :
    mulPoly ep_Q2_024_coefficient_17_0191
        ep_Q2_024_generator_17_0100_0199 =
      ep_Q2_024_partial_17_0191 := by
  native_decide

/-- Coefficient term 192 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0192 : Poly :=
[
  term ((189337596559409838993915431795101263168 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (9, 3)]
]

/-- Partial product 192 for generator 17. -/
def ep_Q2_024_partial_17_0192 : Poly :=
[
  term ((378675193118819677987830863590202526336 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (6, 1), (9, 3), (14, 1)],
  term ((378675193118819677987830863590202526336 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (7, 1), (9, 3), (15, 1)],
  term ((-189337596559409838993915431795101263168 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (9, 3), (14, 2)],
  term ((-189337596559409838993915431795101263168 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (9, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 192 for generator 17. -/
theorem ep_Q2_024_partial_17_0192_valid :
    mulPoly ep_Q2_024_coefficient_17_0192
        ep_Q2_024_generator_17_0100_0199 =
      ep_Q2_024_partial_17_0192 := by
  native_decide

/-- Coefficient term 193 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0193 : Poly :=
[
  term ((75102373704376665566781970071753306182 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (13, 1)]
]

/-- Partial product 193 for generator 17. -/
def ep_Q2_024_partial_17_0193 : Poly :=
[
  term ((150204747408753331133563940143506612364 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (6, 1), (13, 1), (14, 1)],
  term ((150204747408753331133563940143506612364 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (7, 1), (13, 1), (15, 1)],
  term ((-75102373704376665566781970071753306182 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (13, 1), (14, 2)],
  term ((-75102373704376665566781970071753306182 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 193 for generator 17. -/
theorem ep_Q2_024_partial_17_0193_valid :
    mulPoly ep_Q2_024_coefficient_17_0193
        ep_Q2_024_generator_17_0100_0199 =
      ep_Q2_024_partial_17_0193 := by
  native_decide

/-- Coefficient term 194 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0194 : Poly :=
[
  term ((608738527203217246998674594652026665011498996856867553 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(3, 1), (15, 1)]
]

/-- Partial product 194 for generator 17. -/
def ep_Q2_024_partial_17_0194 : Poly :=
[
  term ((608738527203217246998674594652026665011498996856867553 : Rat) / 929998952132019818504773430836265897467346423247461380) [(3, 1), (6, 1), (14, 1), (15, 1)],
  term ((608738527203217246998674594652026665011498996856867553 : Rat) / 929998952132019818504773430836265897467346423247461380) [(3, 1), (7, 1), (15, 2)],
  term ((-608738527203217246998674594652026665011498996856867553 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(3, 1), (14, 2), (15, 1)],
  term ((-608738527203217246998674594652026665011498996856867553 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(3, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 194 for generator 17. -/
theorem ep_Q2_024_partial_17_0194_valid :
    mulPoly ep_Q2_024_coefficient_17_0194
        ep_Q2_024_generator_17_0100_0199 =
      ep_Q2_024_partial_17_0194 := by
  native_decide

/-- Coefficient term 195 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0195 : Poly :=
[
  term ((-929762167201001 : Rat) / 2325560442306386) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 195 for generator 17. -/
def ep_Q2_024_partial_17_0195 : Poly :=
[
  term ((-929762167201001 : Rat) / 1162780221153193) [(3, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-929762167201001 : Rat) / 1162780221153193) [(3, 1), (7, 1), (15, 2), (16, 1)],
  term ((929762167201001 : Rat) / 2325560442306386) [(3, 1), (14, 2), (15, 1), (16, 1)],
  term ((929762167201001 : Rat) / 2325560442306386) [(3, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 195 for generator 17. -/
theorem ep_Q2_024_partial_17_0195_valid :
    mulPoly ep_Q2_024_coefficient_17_0195
        ep_Q2_024_generator_17_0100_0199 =
      ep_Q2_024_partial_17_0195 := by
  native_decide

/-- Coefficient term 196 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0196 : Poly :=
[
  term ((1225111300858164315655691858443514096 : Rat) / 677801953334732935913386174027988287) [(4, 1)]
]

/-- Partial product 196 for generator 17. -/
def ep_Q2_024_partial_17_0196 : Poly :=
[
  term ((2450222601716328631311383716887028192 : Rat) / 677801953334732935913386174027988287) [(4, 1), (6, 1), (14, 1)],
  term ((2450222601716328631311383716887028192 : Rat) / 677801953334732935913386174027988287) [(4, 1), (7, 1), (15, 1)],
  term ((-1225111300858164315655691858443514096 : Rat) / 677801953334732935913386174027988287) [(4, 1), (14, 2)],
  term ((-1225111300858164315655691858443514096 : Rat) / 677801953334732935913386174027988287) [(4, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 196 for generator 17. -/
theorem ep_Q2_024_partial_17_0196_valid :
    mulPoly ep_Q2_024_coefficient_17_0196
        ep_Q2_024_generator_17_0100_0199 =
      ep_Q2_024_partial_17_0196 := by
  native_decide

/-- Coefficient term 197 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0197 : Poly :=
[
  term ((-16890983628896808743407603036576568848 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (5, 1), (9, 1)]
]

/-- Partial product 197 for generator 17. -/
def ep_Q2_024_partial_17_0197 : Poly :=
[
  term ((-33781967257793617486815206073153137696 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (5, 1), (6, 1), (9, 1), (14, 1)],
  term ((-33781967257793617486815206073153137696 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (5, 1), (7, 1), (9, 1), (15, 1)],
  term ((16890983628896808743407603036576568848 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (5, 1), (9, 1), (14, 2)],
  term ((16890983628896808743407603036576568848 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (5, 1), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 197 for generator 17. -/
theorem ep_Q2_024_partial_17_0197_valid :
    mulPoly ep_Q2_024_coefficient_17_0197
        ep_Q2_024_generator_17_0100_0199 =
      ep_Q2_024_partial_17_0197 := by
  native_decide

/-- Coefficient term 198 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0198 : Poly :=
[
  term ((-20220074797511964466058292860462341536 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (5, 1), (13, 1)]
]

/-- Partial product 198 for generator 17. -/
def ep_Q2_024_partial_17_0198 : Poly :=
[
  term ((-40440149595023928932116585720924683072 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (5, 1), (6, 1), (13, 1), (14, 1)],
  term ((-40440149595023928932116585720924683072 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (5, 1), (7, 1), (13, 1), (15, 1)],
  term ((20220074797511964466058292860462341536 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (5, 1), (13, 1), (14, 2)],
  term ((20220074797511964466058292860462341536 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (5, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 198 for generator 17. -/
theorem ep_Q2_024_partial_17_0198_valid :
    mulPoly ep_Q2_024_coefficient_17_0198
        ep_Q2_024_generator_17_0100_0199 =
      ep_Q2_024_partial_17_0198 := by
  native_decide

/-- Coefficient term 199 from coefficient polynomial 17. -/
def ep_Q2_024_coefficient_17_0199 : Poly :=
[
  term ((1086812258876365631714711692878661467835285345215957824 : Rat) / 232499738033004954626193357709066474366836605811865345) [(4, 1), (5, 1), (15, 1)]
]

/-- Partial product 199 for generator 17. -/
def ep_Q2_024_partial_17_0199 : Poly :=
[
  term ((2173624517752731263429423385757322935670570690431915648 : Rat) / 232499738033004954626193357709066474366836605811865345) [(4, 1), (5, 1), (6, 1), (14, 1), (15, 1)],
  term ((2173624517752731263429423385757322935670570690431915648 : Rat) / 232499738033004954626193357709066474366836605811865345) [(4, 1), (5, 1), (7, 1), (15, 2)],
  term ((-1086812258876365631714711692878661467835285345215957824 : Rat) / 232499738033004954626193357709066474366836605811865345) [(4, 1), (5, 1), (14, 2), (15, 1)],
  term ((-1086812258876365631714711692878661467835285345215957824 : Rat) / 232499738033004954626193357709066474366836605811865345) [(4, 1), (5, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 199 for generator 17. -/
theorem ep_Q2_024_partial_17_0199_valid :
    mulPoly ep_Q2_024_coefficient_17_0199
        ep_Q2_024_generator_17_0100_0199 =
      ep_Q2_024_partial_17_0199 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_024_partials_17_0100_0199 : List Poly :=
[
  ep_Q2_024_partial_17_0100,
  ep_Q2_024_partial_17_0101,
  ep_Q2_024_partial_17_0102,
  ep_Q2_024_partial_17_0103,
  ep_Q2_024_partial_17_0104,
  ep_Q2_024_partial_17_0105,
  ep_Q2_024_partial_17_0106,
  ep_Q2_024_partial_17_0107,
  ep_Q2_024_partial_17_0108,
  ep_Q2_024_partial_17_0109,
  ep_Q2_024_partial_17_0110,
  ep_Q2_024_partial_17_0111,
  ep_Q2_024_partial_17_0112,
  ep_Q2_024_partial_17_0113,
  ep_Q2_024_partial_17_0114,
  ep_Q2_024_partial_17_0115,
  ep_Q2_024_partial_17_0116,
  ep_Q2_024_partial_17_0117,
  ep_Q2_024_partial_17_0118,
  ep_Q2_024_partial_17_0119,
  ep_Q2_024_partial_17_0120,
  ep_Q2_024_partial_17_0121,
  ep_Q2_024_partial_17_0122,
  ep_Q2_024_partial_17_0123,
  ep_Q2_024_partial_17_0124,
  ep_Q2_024_partial_17_0125,
  ep_Q2_024_partial_17_0126,
  ep_Q2_024_partial_17_0127,
  ep_Q2_024_partial_17_0128,
  ep_Q2_024_partial_17_0129,
  ep_Q2_024_partial_17_0130,
  ep_Q2_024_partial_17_0131,
  ep_Q2_024_partial_17_0132,
  ep_Q2_024_partial_17_0133,
  ep_Q2_024_partial_17_0134,
  ep_Q2_024_partial_17_0135,
  ep_Q2_024_partial_17_0136,
  ep_Q2_024_partial_17_0137,
  ep_Q2_024_partial_17_0138,
  ep_Q2_024_partial_17_0139,
  ep_Q2_024_partial_17_0140,
  ep_Q2_024_partial_17_0141,
  ep_Q2_024_partial_17_0142,
  ep_Q2_024_partial_17_0143,
  ep_Q2_024_partial_17_0144,
  ep_Q2_024_partial_17_0145,
  ep_Q2_024_partial_17_0146,
  ep_Q2_024_partial_17_0147,
  ep_Q2_024_partial_17_0148,
  ep_Q2_024_partial_17_0149,
  ep_Q2_024_partial_17_0150,
  ep_Q2_024_partial_17_0151,
  ep_Q2_024_partial_17_0152,
  ep_Q2_024_partial_17_0153,
  ep_Q2_024_partial_17_0154,
  ep_Q2_024_partial_17_0155,
  ep_Q2_024_partial_17_0156,
  ep_Q2_024_partial_17_0157,
  ep_Q2_024_partial_17_0158,
  ep_Q2_024_partial_17_0159,
  ep_Q2_024_partial_17_0160,
  ep_Q2_024_partial_17_0161,
  ep_Q2_024_partial_17_0162,
  ep_Q2_024_partial_17_0163,
  ep_Q2_024_partial_17_0164,
  ep_Q2_024_partial_17_0165,
  ep_Q2_024_partial_17_0166,
  ep_Q2_024_partial_17_0167,
  ep_Q2_024_partial_17_0168,
  ep_Q2_024_partial_17_0169,
  ep_Q2_024_partial_17_0170,
  ep_Q2_024_partial_17_0171,
  ep_Q2_024_partial_17_0172,
  ep_Q2_024_partial_17_0173,
  ep_Q2_024_partial_17_0174,
  ep_Q2_024_partial_17_0175,
  ep_Q2_024_partial_17_0176,
  ep_Q2_024_partial_17_0177,
  ep_Q2_024_partial_17_0178,
  ep_Q2_024_partial_17_0179,
  ep_Q2_024_partial_17_0180,
  ep_Q2_024_partial_17_0181,
  ep_Q2_024_partial_17_0182,
  ep_Q2_024_partial_17_0183,
  ep_Q2_024_partial_17_0184,
  ep_Q2_024_partial_17_0185,
  ep_Q2_024_partial_17_0186,
  ep_Q2_024_partial_17_0187,
  ep_Q2_024_partial_17_0188,
  ep_Q2_024_partial_17_0189,
  ep_Q2_024_partial_17_0190,
  ep_Q2_024_partial_17_0191,
  ep_Q2_024_partial_17_0192,
  ep_Q2_024_partial_17_0193,
  ep_Q2_024_partial_17_0194,
  ep_Q2_024_partial_17_0195,
  ep_Q2_024_partial_17_0196,
  ep_Q2_024_partial_17_0197,
  ep_Q2_024_partial_17_0198,
  ep_Q2_024_partial_17_0199
]

/-- Sum of partial products in this block. -/
def ep_Q2_024_block_17_0100_0199 : Poly :=
[
  term ((-5137204122490576 : Rat) / 1162780221153193) [(1, 1), (5, 2), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5137204122490576 : Rat) / 1162780221153193) [(1, 1), (5, 2), (7, 1), (15, 2), (16, 1)],
  term ((2568602061245288 : Rat) / 1162780221153193) [(1, 1), (5, 2), (14, 2), (15, 1), (16, 1)],
  term ((2568602061245288 : Rat) / 1162780221153193) [(1, 1), (5, 2), (15, 3), (16, 1)],
  term ((518543174883551540146515086812976898784 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (6, 1), (7, 1), (14, 1)],
  term ((6905849207226283123121158501253920609112 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (6, 1), (8, 1), (9, 1), (14, 1)],
  term ((49794017268134571589590260644228965512 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (6, 1), (8, 1), (12, 1), (13, 1), (14, 1)],
  term ((-917441215567441973698591233420584982763484800877141585 : Rat) / 92999895213201981850477343083626589746734642324746138) [(1, 1), (6, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((2172308402631610 : Rat) / 1162780221153193) [(1, 1), (6, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((16551418880201825784423350077975451476096 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (6, 1), (8, 1), (13, 1), (14, 1)],
  term ((16212592569921209273810854764745299901641591424351835598 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (6, 1), (8, 1), (14, 1), (15, 1)],
  term ((-17366606943104944 : Rat) / 3488340663459579) [(1, 1), (6, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((4542524917628125536038106900788663082408 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (6, 1), (9, 1), (12, 1), (14, 1)],
  term ((-4898040419692806749424149347787096834615465390033086364 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (6, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((2990296899089872 : Rat) / 1162780221153193) [(1, 1), (6, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((313099205974796891704814566834029023616 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (6, 1), (9, 1), (13, 2), (14, 1)],
  term ((-3006401448391664287462453119469651930492 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (6, 1), (9, 1), (14, 1)],
  term ((-965301222877480932388812420359861183184 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (6, 1), (9, 1), (14, 2)],
  term ((252450128745879785325220575726801684224 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (6, 1), (9, 2), (13, 1), (14, 1)],
  term ((5716728778757217677528124047747538497924 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (6, 1), (11, 1), (14, 1)],
  term ((22147084104437875959479280023691525124132 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (6, 1), (12, 1), (13, 1), (14, 1)],
  term ((-205863800544272756355713942206409682440 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (6, 1), (12, 1), (13, 1), (14, 2)],
  term ((-447481119309076194849599014937502304786099349969962623757 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(1, 1), (6, 1), (12, 1), (14, 1), (15, 1)],
  term ((-42043259958870211 : Rat) / 3488340663459579) [(1, 1), (6, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((184684620853449952814620827932751714007739040900298451677 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(1, 1), (6, 1), (12, 1), (14, 2), (15, 1)],
  term ((-23072958850317806 : Rat) / 1162780221153193) [(1, 1), (6, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((250372637487750057624769595688835733512 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (6, 1), (12, 2), (13, 1), (14, 1)],
  term ((-1100529695907008564799077506604416650894267905418418037 : Rat) / 92999895213201981850477343083626589746734642324746138) [(1, 1), (6, 1), (12, 2), (14, 1), (15, 1)],
  term ((6448562047255522 : Rat) / 1162780221153193) [(1, 1), (6, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((2481346288346526588270837002331912378436 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (6, 1), (13, 1), (14, 1)],
  term ((4257240738688568307616658794980924393509421819574455832 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (6, 1), (13, 1), (14, 1), (15, 2)],
  term ((-2463931916166432 : Rat) / 1162780221153193) [(1, 1), (6, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-5196140706424565759545785675052583399584 : Rat) / 359912837220743188970008058408861780397) [(1, 1), (6, 1), (13, 1), (14, 2)],
  term ((8486750246624093521424296941571253888 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (6, 1), (13, 1), (14, 3)],
  term ((-4633881870105264614105561717474528149133005252184189608 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (6, 1), (13, 2), (14, 1), (15, 1)],
  term ((301322371177440 : Rat) / 1162780221153193) [(1, 1), (6, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((161891712224135268464196480124956186688 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (6, 1), (13, 3), (14, 1)],
  term ((303197347720279522945960624054822934173231987169673121843 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(1, 1), (6, 1), (14, 1), (15, 1)],
  term ((46761063904070125 : Rat) / 2325560442306386) [(1, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((249562434230076519877457627355935784697985556458557189433 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(1, 1), (6, 1), (14, 2), (15, 1)],
  term ((-138348488323751089 : Rat) / 3488340663459579) [(1, 1), (6, 1), (14, 2), (15, 1), (16, 1)],
  term ((674456529895393409686477352003493571793009190155093372 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (6, 1), (14, 3), (15, 1)],
  term ((1667935482081904 : Rat) / 1162780221153193) [(1, 1), (6, 1), (14, 3), (15, 1), (16, 1)],
  term ((6905849207226283123121158501253920609112 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (7, 1), (8, 1), (9, 1), (15, 1)],
  term ((49794017268134571589590260644228965512 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((-917441215567441973698591233420584982763484800877141585 : Rat) / 92999895213201981850477343083626589746734642324746138) [(1, 1), (7, 1), (8, 1), (12, 1), (15, 2)],
  term ((2172308402631610 : Rat) / 1162780221153193) [(1, 1), (7, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((16551418880201825784423350077975451476096 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (7, 1), (8, 1), (13, 1), (15, 1)],
  term ((16212592569921209273810854764745299901641591424351835598 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (7, 1), (8, 1), (15, 2)],
  term ((-17366606943104944 : Rat) / 3488340663459579) [(1, 1), (7, 1), (8, 1), (15, 2), (16, 1)],
  term ((4542524917628125536038106900788663082408 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (7, 1), (9, 1), (12, 1), (15, 1)],
  term ((-4898040419692806749424149347787096834615465390033086364 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (7, 1), (9, 1), (13, 1), (15, 2)],
  term ((2990296899089872 : Rat) / 1162780221153193) [(1, 1), (7, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((313099205974796891704814566834029023616 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (7, 1), (9, 1), (13, 2), (15, 1)],
  term ((-965301222877480932388812420359861183184 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (7, 1), (9, 1), (14, 1), (15, 1)],
  term ((-3006401448391664287462453119469651930492 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (7, 1), (9, 1), (15, 1)],
  term ((252450128745879785325220575726801684224 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (7, 1), (9, 2), (13, 1), (15, 1)],
  term ((5716728778757217677528124047747538497924 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (7, 1), (11, 1), (15, 1)],
  term ((-205863800544272756355713942206409682440 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((22147084104437875959479280023691525124132 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (7, 1), (12, 1), (13, 1), (15, 1)],
  term ((184684620853449952814620827932751714007739040900298451677 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(1, 1), (7, 1), (12, 1), (14, 1), (15, 2)],
  term ((-23072958850317806 : Rat) / 1162780221153193) [(1, 1), (7, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-447481119309076194849599014937502304786099349969962623757 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(1, 1), (7, 1), (12, 1), (15, 2)],
  term ((-42043259958870211 : Rat) / 3488340663459579) [(1, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((250372637487750057624769595688835733512 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (7, 1), (12, 2), (13, 1), (15, 1)],
  term ((-1100529695907008564799077506604416650894267905418418037 : Rat) / 92999895213201981850477343083626589746734642324746138) [(1, 1), (7, 1), (12, 2), (15, 2)],
  term ((6448562047255522 : Rat) / 1162780221153193) [(1, 1), (7, 1), (12, 2), (15, 2), (16, 1)],
  term ((-5196140706424565759545785675052583399584 : Rat) / 359912837220743188970008058408861780397) [(1, 1), (7, 1), (13, 1), (14, 1), (15, 1)],
  term ((8486750246624093521424296941571253888 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (7, 1), (13, 1), (14, 2), (15, 1)],
  term ((2481346288346526588270837002331912378436 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (7, 1), (13, 1), (15, 1)],
  term ((4257240738688568307616658794980924393509421819574455832 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (7, 1), (13, 1), (15, 3)],
  term ((-2463931916166432 : Rat) / 1162780221153193) [(1, 1), (7, 1), (13, 1), (15, 3), (16, 1)],
  term ((-4633881870105264614105561717474528149133005252184189608 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (7, 1), (13, 2), (15, 2)],
  term ((301322371177440 : Rat) / 1162780221153193) [(1, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((161891712224135268464196480124956186688 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (7, 1), (13, 3), (15, 1)],
  term ((249562434230076519877457627355935784697985556458557189433 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(1, 1), (7, 1), (14, 1), (15, 2)],
  term ((-138348488323751089 : Rat) / 3488340663459579) [(1, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((-259271587441775770073257543406488449392 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (7, 1), (14, 2)],
  term ((674456529895393409686477352003493571793009190155093372 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (7, 1), (14, 2), (15, 2)],
  term ((1667935482081904 : Rat) / 1162780221153193) [(1, 1), (7, 1), (14, 2), (15, 2), (16, 1)],
  term ((60157108146001044674227011934073472794862321816879090519 : Rat) / 371999580852807927401909372334506358986938569298984552) [(1, 1), (7, 1), (15, 2)],
  term ((46761063904070125 : Rat) / 2325560442306386) [(1, 1), (7, 1), (15, 2), (16, 1)],
  term ((518543174883551540146515086812976898784 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (7, 2), (15, 1)],
  term ((-3452924603613141561560579250626960304556 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (8, 1), (9, 1), (14, 2)],
  term ((-3452924603613141561560579250626960304556 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (8, 1), (9, 1), (15, 2)],
  term ((-24897008634067285794795130322114482756 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (8, 1), (12, 1), (13, 1), (14, 2)],
  term ((-24897008634067285794795130322114482756 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (8, 1), (12, 1), (13, 1), (15, 2)],
  term ((917441215567441973698591233420584982763484800877141585 : Rat) / 185999790426403963700954686167253179493469284649492276) [(1, 1), (8, 1), (12, 1), (14, 2), (15, 1)],
  term ((-1086154201315805 : Rat) / 1162780221153193) [(1, 1), (8, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((917441215567441973698591233420584982763484800877141585 : Rat) / 185999790426403963700954686167253179493469284649492276) [(1, 1), (8, 1), (12, 1), (15, 3)],
  term ((-1086154201315805 : Rat) / 1162780221153193) [(1, 1), (8, 1), (12, 1), (15, 3), (16, 1)],
  term ((-8275709440100912892211675038987725738048 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (8, 1), (13, 1), (14, 2)],
  term ((-8275709440100912892211675038987725738048 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (8, 1), (13, 1), (15, 2)],
  term ((-8106296284960604636905427382372649950820795712175917799 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (8, 1), (14, 2), (15, 1)],
  term ((8683303471552472 : Rat) / 3488340663459579) [(1, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((-8106296284960604636905427382372649950820795712175917799 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (8, 1), (15, 3)],
  term ((8683303471552472 : Rat) / 3488340663459579) [(1, 1), (8, 1), (15, 3), (16, 1)],
  term ((-2271262458814062768019053450394331541204 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (9, 1), (12, 1), (14, 2)],
  term ((-2271262458814062768019053450394331541204 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (9, 1), (12, 1), (15, 2)],
  term ((2449020209846403374712074673893548417307732695016543182 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (9, 1), (13, 1), (14, 2), (15, 1)],
  term ((-1495148449544936 : Rat) / 1162780221153193) [(1, 1), (9, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((2449020209846403374712074673893548417307732695016543182 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (9, 1), (13, 1), (15, 3)],
  term ((-1495148449544936 : Rat) / 1162780221153193) [(1, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((-156549602987398445852407283417014511808 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (9, 1), (13, 2), (14, 2)],
  term ((-156549602987398445852407283417014511808 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (9, 1), (13, 2), (15, 2)],
  term ((482650611438740466194406210179930591592 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (9, 1), (14, 1), (15, 2)],
  term ((1503200724195832143731226559734825965246 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (9, 1), (14, 2)],
  term ((482650611438740466194406210179930591592 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (9, 1), (14, 3)],
  term ((1503200724195832143731226559734825965246 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (9, 1), (15, 2)],
  term ((-126225064372939892662610287863400842112 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (9, 2), (13, 1), (14, 2)],
  term ((-126225064372939892662610287863400842112 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (9, 2), (13, 1), (15, 2)],
  term ((-2858364389378608838764062023873769248962 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (11, 1), (14, 2)],
  term ((-2858364389378608838764062023873769248962 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (11, 1), (15, 2)],
  term ((102931900272136378177856971103204841220 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((-11073542052218937979739640011845762562066 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (12, 1), (13, 1), (14, 2)],
  term ((102931900272136378177856971103204841220 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (12, 1), (13, 1), (14, 3)],
  term ((-11073542052218937979739640011845762562066 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (12, 1), (13, 1), (15, 2)],
  term ((-184684620853449952814620827932751714007739040900298451677 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(1, 1), (12, 1), (14, 1), (15, 3)],
  term ((11536479425158903 : Rat) / 1162780221153193) [(1, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((447481119309076194849599014937502304786099349969962623757 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(1, 1), (12, 1), (14, 2), (15, 1)],
  term ((42043259958870211 : Rat) / 6976681326919158) [(1, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-184684620853449952814620827932751714007739040900298451677 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(1, 1), (12, 1), (14, 3), (15, 1)],
  term ((11536479425158903 : Rat) / 1162780221153193) [(1, 1), (12, 1), (14, 3), (15, 1), (16, 1)],
  term ((447481119309076194849599014937502304786099349969962623757 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(1, 1), (12, 1), (15, 3)],
  term ((42043259958870211 : Rat) / 6976681326919158) [(1, 1), (12, 1), (15, 3), (16, 1)],
  term ((-125186318743875028812384797844417866756 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (12, 2), (13, 1), (14, 2)],
  term ((-125186318743875028812384797844417866756 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (12, 2), (13, 1), (15, 2)],
  term ((1100529695907008564799077506604416650894267905418418037 : Rat) / 185999790426403963700954686167253179493469284649492276) [(1, 1), (12, 2), (14, 2), (15, 1)],
  term ((-3224281023627761 : Rat) / 1162780221153193) [(1, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((1100529695907008564799077506604416650894267905418418037 : Rat) / 185999790426403963700954686167253179493469284649492276) [(1, 1), (12, 2), (15, 3)],
  term ((-3224281023627761 : Rat) / 1162780221153193) [(1, 1), (12, 2), (15, 3), (16, 1)],
  term ((2598070353212282879772892837526291699792 : Rat) / 359912837220743188970008058408861780397) [(1, 1), (13, 1), (14, 1), (15, 2)],
  term ((-1240673144173263294135418501165956189218 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (13, 1), (14, 2)],
  term ((-10648035959385741508391295735947969683275807486108571772 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (13, 1), (14, 2), (15, 2)],
  term ((1231965958083216 : Rat) / 1162780221153193) [(1, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((2598070353212282879772892837526291699792 : Rat) / 359912837220743188970008058408861780397) [(1, 1), (13, 1), (14, 3)],
  term ((-4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (13, 1), (14, 4)],
  term ((-1240673144173263294135418501165956189218 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (13, 1), (15, 2)],
  term ((-2128620369344284153808329397490462196754710909787227916 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (13, 1), (15, 4)],
  term ((1231965958083216 : Rat) / 1162780221153193) [(1, 1), (13, 1), (15, 4), (16, 1)],
  term ((2316940935052632307052780858737264074566502626092094804 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (13, 2), (14, 2), (15, 1)],
  term ((-150661185588720 : Rat) / 1162780221153193) [(1, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((2316940935052632307052780858737264074566502626092094804 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (13, 2), (15, 3)],
  term ((-150661185588720 : Rat) / 1162780221153193) [(1, 1), (13, 2), (15, 3), (16, 1)],
  term ((-80945856112067634232098240062478093344 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (13, 3), (14, 2)],
  term ((-80945856112067634232098240062478093344 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (13, 3), (15, 2)],
  term ((-249562434230076519877457627355935784697985556458557189433 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(1, 1), (14, 1), (15, 3)],
  term ((138348488323751089 : Rat) / 6976681326919158) [(1, 1), (14, 1), (15, 3), (16, 1)],
  term ((-303197347720279522945960624054822934173231987169673121843 : Rat) / 3719995808528079274019093723345063589869385692989845520) [(1, 1), (14, 2), (15, 1)],
  term ((-46761063904070125 : Rat) / 4651120884612772) [(1, 1), (14, 2), (15, 1), (16, 1)],
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (14, 2), (15, 3)],
  term ((-833967741040952 : Rat) / 1162780221153193) [(1, 1), (14, 2), (15, 3), (16, 1)],
  term ((-249562434230076519877457627355935784697985556458557189433 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(1, 1), (14, 3), (15, 1)],
  term ((138348488323751089 : Rat) / 6976681326919158) [(1, 1), (14, 3), (15, 1), (16, 1)],
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (14, 4), (15, 1)],
  term ((-833967741040952 : Rat) / 1162780221153193) [(1, 1), (14, 4), (15, 1), (16, 1)],
  term ((-303197347720279522945960624054822934173231987169673121843 : Rat) / 3719995808528079274019093723345063589869385692989845520) [(1, 1), (15, 3)],
  term ((-46761063904070125 : Rat) / 4651120884612772) [(1, 1), (15, 3), (16, 1)],
  term ((-8562178307225718341862293076514860320 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (3, 1), (6, 1), (9, 1), (14, 1)],
  term ((-8562178307225718341862293076514860320 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (3, 1), (7, 1), (9, 1), (15, 1)],
  term ((4281089153612859170931146538257430160 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (3, 1), (9, 1), (14, 2)],
  term ((4281089153612859170931146538257430160 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (3, 1), (9, 1), (15, 2)],
  term ((-976300269614697947471493093649442494704 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (5, 1), (6, 1), (9, 1), (14, 1)],
  term ((-976300269614697947471493093649442494704 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (5, 1), (7, 1), (9, 1), (15, 1)],
  term ((488150134807348973735746546824721247352 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (5, 1), (9, 1), (14, 2)],
  term ((488150134807348973735746546824721247352 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (5, 1), (9, 1), (15, 2)],
  term ((2640791066240608440522424270095879180328 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (6, 1), (7, 1), (9, 1), (14, 1)],
  term ((2154555311573116448150370991620883146496 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (6, 1), (7, 1), (13, 1), (14, 1)],
  term ((37050814747583503133753456969502764146050338642007357993 : Rat) / 464999476066009909252386715418132948733673211623730690) [(2, 1), (6, 1), (7, 1), (14, 1), (15, 1)],
  term ((-10293679972596530 : Rat) / 1162780221153193) [(2, 1), (6, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((2140544576806429585465573269128715080 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (6, 1), (8, 1), (14, 1)],
  term ((439415455449608995475987399822025204496 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (6, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((-12049274504598496216515755251457168282118787774524673811 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 1), (6, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((3530759285383524 : Rat) / 1162780221153193) [(2, 1), (6, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2358095297473051148873283253457414222384 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (6, 1), (9, 1), (13, 1), (14, 1)],
  term ((-28393035203547033181534834890405869550913424918825034734 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 1), (6, 1), (9, 1), (14, 1), (15, 1)],
  term ((10733439429933688 : Rat) / 1162780221153193) [(2, 1), (6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5061077107112064139157323596144283383592 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (6, 1), (9, 2), (14, 1)],
  term ((2140544576806429585465573269128715080 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (6, 1), (12, 1), (14, 1)],
  term ((-4281089153612859170931146538257430160 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (6, 1), (14, 1)],
  term ((8921151527862041881559355605928391576 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (6, 1), (14, 2)],
  term ((2140544576806429585465573269128715080 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (7, 1), (8, 1), (15, 1)],
  term ((439415455449608995475987399822025204496 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (7, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((-12049274504598496216515755251457168282118787774524673811 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 1), (7, 1), (9, 1), (12, 1), (15, 2)],
  term ((3530759285383524 : Rat) / 1162780221153193) [(2, 1), (7, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-2358095297473051148873283253457414222384 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((-1320395533120304220261212135047939590164 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (7, 1), (9, 1), (14, 2)],
  term ((-29928365013558348695262698578939270463763369274705028386 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 1), (7, 1), (9, 1), (15, 2)],
  term ((10733439429933688 : Rat) / 1162780221153193) [(2, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((-5061077107112064139157323596144283383592 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (7, 1), (9, 2), (15, 1)],
  term ((2140544576806429585465573269128715080 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (7, 1), (12, 1), (15, 1)],
  term ((-1077277655786558224075185495810441573248 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (7, 1), (13, 1), (14, 2)],
  term ((-1077277655786558224075185495810441573248 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (7, 1), (13, 1), (15, 2)],
  term ((8921151527862041881559355605928391576 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (7, 1), (14, 1), (15, 1)],
  term ((-37050814747583503133753456969502764146050338642007357993 : Rat) / 929998952132019818504773430836265897467346423247461380) [(2, 1), (7, 1), (14, 2), (15, 1)],
  term ((5146839986298265 : Rat) / 1162780221153193) [(2, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-4281089153612859170931146538257430160 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (7, 1), (15, 1)],
  term ((-37050814747583503133753456969502764146050338642007357993 : Rat) / 929998952132019818504773430836265897467346423247461380) [(2, 1), (7, 1), (15, 3)],
  term ((5146839986298265 : Rat) / 1162780221153193) [(2, 1), (7, 1), (15, 3), (16, 1)],
  term ((2640791066240608440522424270095879180328 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (7, 2), (9, 1), (15, 1)],
  term ((2154555311573116448150370991620883146496 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (7, 2), (13, 1), (15, 1)],
  term ((37050814747583503133753456969502764146050338642007357993 : Rat) / 464999476066009909252386715418132948733673211623730690) [(2, 1), (7, 2), (15, 2)],
  term ((-10293679972596530 : Rat) / 1162780221153193) [(2, 1), (7, 2), (15, 2), (16, 1)],
  term ((-1070272288403214792732786634564357540 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (8, 1), (14, 2)],
  term ((-1070272288403214792732786634564357540 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (8, 1), (15, 2)],
  term ((-219707727724804497737993699911012602248 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (9, 1), (12, 1), (13, 1), (14, 2)],
  term ((-219707727724804497737993699911012602248 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (9, 1), (12, 1), (13, 1), (15, 2)],
  term ((12049274504598496216515755251457168282118787774524673811 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(2, 1), (9, 1), (12, 1), (14, 2), (15, 1)],
  term ((-1765379642691762 : Rat) / 1162780221153193) [(2, 1), (9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((12049274504598496216515755251457168282118787774524673811 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(2, 1), (9, 1), (12, 1), (15, 3)],
  term ((-1765379642691762 : Rat) / 1162780221153193) [(2, 1), (9, 1), (12, 1), (15, 3), (16, 1)],
  term ((1179047648736525574436641626728707111192 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (9, 1), (13, 1), (14, 2)],
  term ((1179047648736525574436641626728707111192 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (9, 1), (13, 1), (15, 2)],
  term ((14196517601773516590767417445202934775456712459412517367 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 1), (9, 1), (14, 2), (15, 1)],
  term ((-5366719714966844 : Rat) / 1162780221153193) [(2, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((14196517601773516590767417445202934775456712459412517367 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 1), (9, 1), (15, 3)],
  term ((-5366719714966844 : Rat) / 1162780221153193) [(2, 1), (9, 1), (15, 3), (16, 1)],
  term ((2530538553556032069578661798072141691796 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (9, 2), (14, 2)],
  term ((2530538553556032069578661798072141691796 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (9, 2), (15, 2)],
  term ((-1070272288403214792732786634564357540 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (12, 1), (14, 2)],
  term ((-1070272288403214792732786634564357540 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (12, 1), (15, 2)],
  term ((-4460575763931020940779677802964195788 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (14, 1), (15, 2)],
  term ((2140544576806429585465573269128715080 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (14, 2)],
  term ((-4460575763931020940779677802964195788 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (14, 3)],
  term ((2140544576806429585465573269128715080 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (15, 2)],
  term ((5860298469427302226261358975602624182032 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (4, 1), (6, 1), (9, 1), (14, 1)],
  term ((5860298469427302226261358975602624182032 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (4, 1), (7, 1), (9, 1), (15, 1)],
  term ((-2930149234713651113130679487801312091016 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (4, 1), (9, 1), (14, 2)],
  term ((-2930149234713651113130679487801312091016 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (4, 1), (9, 1), (15, 2)],
  term ((-67563934515587234973630412146306275392 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (6, 1), (7, 1), (9, 1), (14, 1)],
  term ((-80880299190047857864233171441849366144 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (6, 1), (7, 1), (13, 1), (14, 1)],
  term ((4347249035505462526858846771514645871341141380863831296 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (5, 1), (6, 1), (7, 1), (14, 1), (15, 1)],
  term ((413883074046464 : Rat) / 1162780221153193) [(3, 1), (5, 1), (6, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((390945667461356377254748928229783889664 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (5, 1), (6, 1), (9, 1), (13, 1), (14, 1)],
  term ((745776354470252626376194630655691439314588914194876556 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 1), (5, 1), (6, 1), (9, 1), (14, 1), (15, 1)],
  term ((-1440712918542160 : Rat) / 1162780221153193) [(3, 1), (5, 1), (6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((67563934515587234973630412146306275392 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (6, 1), (9, 2), (14, 1)],
  term ((390945667461356377254748928229783889664 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (5, 1), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((33781967257793617486815206073153137696 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (7, 1), (9, 1), (14, 2)],
  term ((3846724782428284694152468035921134885015833149291572764 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (5, 1), (7, 1), (9, 1), (15, 2)],
  term ((-1440712918542160 : Rat) / 1162780221153193) [(3, 1), (5, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((67563934515587234973630412146306275392 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (7, 1), (9, 2), (15, 1)],
  term ((40440149595023928932116585720924683072 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (7, 1), (13, 1), (14, 2)],
  term ((40440149595023928932116585720924683072 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (7, 1), (13, 1), (15, 2)],
  term ((-2173624517752731263429423385757322935670570690431915648 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (5, 1), (7, 1), (14, 2), (15, 1)],
  term ((-206941537023232 : Rat) / 1162780221153193) [(3, 1), (5, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-2173624517752731263429423385757322935670570690431915648 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (5, 1), (7, 1), (15, 3)],
  term ((-206941537023232 : Rat) / 1162780221153193) [(3, 1), (5, 1), (7, 1), (15, 3), (16, 1)],
  term ((-67563934515587234973630412146306275392 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (7, 2), (9, 1), (15, 1)],
  term ((-80880299190047857864233171441849366144 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (7, 2), (13, 1), (15, 1)],
  term ((4347249035505462526858846771514645871341141380863831296 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (5, 1), (7, 2), (15, 2)],
  term ((413883074046464 : Rat) / 1162780221153193) [(3, 1), (5, 1), (7, 2), (15, 2), (16, 1)],
  term ((-195472833730678188627374464114891944832 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (5, 1), (9, 1), (13, 1), (14, 2)],
  term ((-195472833730678188627374464114891944832 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (5, 1), (9, 1), (13, 1), (15, 2)],
  term ((-372888177235126313188097315327845719657294457097438278 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 1), (5, 1), (9, 1), (14, 2), (15, 1)],
  term ((720356459271080 : Rat) / 1162780221153193) [(3, 1), (5, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-372888177235126313188097315327845719657294457097438278 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 1), (5, 1), (9, 1), (15, 3)],
  term ((720356459271080 : Rat) / 1162780221153193) [(3, 1), (5, 1), (9, 1), (15, 3), (16, 1)],
  term ((-33781967257793617486815206073153137696 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (9, 2), (14, 2)],
  term ((-33781967257793617486815206073153137696 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (9, 2), (15, 2)],
  term ((313099205974796891704814566834029023616 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (6, 1), (7, 1), (9, 1), (13, 1), (14, 1)],
  term ((-4898040419692806749424149347787096834615465390033086364 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (6, 1), (7, 1), (9, 1), (14, 1), (15, 1)],
  term ((2990296899089872 : Rat) / 1162780221153193) [(3, 1), (6, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((252450128745879785325220575726801684224 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (6, 1), (7, 1), (9, 2), (14, 1)],
  term ((-23010147928799045692499742092991476195705377154103841928 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (6, 1), (7, 1), (13, 1), (14, 1), (15, 1)],
  term ((301322371177440 : Rat) / 1162780221153193) [(3, 1), (6, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((161891712224135268464196480124956186688 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (6, 1), (7, 1), (13, 2), (14, 1)],
  term ((-113870637374100747540866397468259089636 : Rat) / 39990315246749243218889784267651308933) [(3, 1), (6, 1), (7, 1), (14, 1)],
  term ((11267418267709793249360068694802780071340436008626146210 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 1), (6, 1), (7, 1), (14, 1), (15, 2)],
  term ((-8526632792004408 : Rat) / 1162780221153193) [(3, 1), (6, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((35684606111448167526237422423713566304 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (6, 1), (7, 1), (14, 2)],
  term ((-3305390256600957304750147809747473899456 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (6, 1), (8, 1), (9, 1), (14, 1)],
  term ((6418515847027695553125738721427416576 : Rat) / 39990315246749243218889784267651308933) [(3, 1), (6, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-359800988817789934888267636369853231432 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (6, 1), (9, 1), (12, 1), (14, 1)],
  term ((-1100449743352224204071231111904359585209885134291587664 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (6, 1), (9, 1), (12, 1), (14, 1), (15, 2)],
  term ((2886768176030016 : Rat) / 1162780221153193) [(3, 1), (6, 1), (9, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-43135328846876119407214699700298383881329052598883204313 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (6, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((425165634343980 : Rat) / 1162780221153193) [(3, 1), (6, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-64749234501436977306807730605386981264 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (6, 1), (9, 1), (13, 2), (14, 1)],
  term ((2530429517824354858309645278849994499224 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (6, 1), (9, 1), (14, 1)],
  term ((-9332237164528159758625041614371109858011888728985178274 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (6, 1), (9, 1), (14, 1), (15, 2)],
  term ((15583171243478152 : Rat) / 1162780221153193) [(3, 1), (6, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2435297927435849822448368727765495968308 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (6, 1), (9, 1), (14, 2)],
  term ((469648808962195337557221850251043535424 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (6, 1), (9, 2), (13, 1), (14, 1)],
  term ((-2449020209846403374712074673893548417307732695016543182 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (6, 1), (9, 2), (14, 1), (15, 1)],
  term ((4485445348634808 : Rat) / 1162780221153193) [(3, 1), (6, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((378675193118819677987830863590202526336 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (6, 1), (9, 3), (14, 1)],
  term ((150204747408753331133563940143506612364 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (6, 1), (13, 1), (14, 1)],
  term ((608738527203217246998674594652026665011498996856867553 : Rat) / 929998952132019818504773430836265897467346423247461380) [(3, 1), (6, 1), (14, 1), (15, 1)],
  term ((-929762167201001 : Rat) / 1162780221153193) [(3, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3305390256600957304750147809747473899456 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (7, 1), (8, 1), (9, 1), (15, 1)],
  term ((6418515847027695553125738721427416576 : Rat) / 39990315246749243218889784267651308933) [(3, 1), (7, 1), (9, 1), (12, 1), (13, 1), (15, 2)],
  term ((-359800988817789934888267636369853231432 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (7, 1), (9, 1), (12, 1), (15, 1)],
  term ((-1100449743352224204071231111904359585209885134291587664 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (7, 1), (9, 1), (12, 1), (15, 3)],
  term ((2886768176030016 : Rat) / 1162780221153193) [(3, 1), (7, 1), (9, 1), (12, 1), (15, 3), (16, 1)],
  term ((-156549602987398445852407283417014511808 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (7, 1), (9, 1), (13, 1), (14, 2)],
  term ((-8736285438565102918491200262765144935167100151981882629 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 1), (7, 1), (9, 1), (13, 1), (15, 2)],
  term ((425165634343980 : Rat) / 1162780221153193) [(3, 1), (7, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-64749234501436977306807730605386981264 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (7, 1), (9, 1), (13, 2), (15, 1)],
  term ((-2435297927435849822448368727765495968308 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (7, 1), (9, 1), (14, 1), (15, 1)],
  term ((2449020209846403374712074673893548417307732695016543182 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (7, 1), (9, 1), (14, 2), (15, 1)],
  term ((-1495148449544936 : Rat) / 1162780221153193) [(3, 1), (7, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((2530429517824354858309645278849994499224 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (7, 1), (9, 1), (15, 1)],
  term ((-5109538256747615180232610033843956231345586698387798328 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 1), (7, 1), (9, 1), (15, 3)],
  term ((14088022793933216 : Rat) / 1162780221153193) [(3, 1), (7, 1), (9, 1), (15, 3), (16, 1)],
  term ((469648808962195337557221850251043535424 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (7, 1), (9, 2), (13, 1), (15, 1)],
  term ((-126225064372939892662610287863400842112 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (7, 1), (9, 2), (14, 2)],
  term ((-2595792218113046445808504723828890524138968126974206798 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (7, 1), (9, 2), (15, 2)],
  term ((4485445348634808 : Rat) / 1162780221153193) [(3, 1), (7, 1), (9, 2), (15, 2), (16, 1)],
  term ((378675193118819677987830863590202526336 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (7, 1), (9, 3), (15, 1)],
  term ((11505073964399522846249871046495738097852688577051920964 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (7, 1), (13, 1), (14, 2), (15, 1)],
  term ((-150661185588720 : Rat) / 1162780221153193) [(3, 1), (7, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((150204747408753331133563940143506612364 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (7, 1), (13, 1), (15, 1)],
  term ((11505073964399522846249871046495738097852688577051920964 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (7, 1), (13, 1), (15, 3)],
  term ((-150661185588720 : Rat) / 1162780221153193) [(3, 1), (7, 1), (13, 1), (15, 3), (16, 1)],
  term ((-80945856112067634232098240062478093344 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (7, 1), (13, 2), (14, 2)],
  term ((-80945856112067634232098240062478093344 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (7, 1), (13, 2), (15, 2)],
  term ((-17842303055724083763118711211856783152 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (7, 1), (14, 1), (15, 2)],
  term ((56935318687050373770433198734129544818 : Rat) / 39990315246749243218889784267651308933) [(3, 1), (7, 1), (14, 2)],
  term ((-5633709133854896624680034347401390035670218004313073105 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 1), (7, 1), (14, 2), (15, 2)],
  term ((4263316396002204 : Rat) / 1162780221153193) [(3, 1), (7, 1), (14, 2), (15, 2), (16, 1)],
  term ((-17842303055724083763118711211856783152 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (7, 1), (14, 3)],
  term ((1932803776290336361529519114628467572607118039602945033 : Rat) / 929998952132019818504773430836265897467346423247461380) [(3, 1), (7, 1), (15, 2)],
  term ((-929762167201001 : Rat) / 1162780221153193) [(3, 1), (7, 1), (15, 2), (16, 1)],
  term ((-5633709133854896624680034347401390035670218004313073105 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 1), (7, 1), (15, 4)],
  term ((4263316396002204 : Rat) / 1162780221153193) [(3, 1), (7, 1), (15, 4), (16, 1)],
  term ((313099205974796891704814566834029023616 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (7, 2), (9, 1), (13, 1), (15, 1)],
  term ((-4898040419692806749424149347787096834615465390033086364 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (7, 2), (9, 1), (15, 2)],
  term ((2990296899089872 : Rat) / 1162780221153193) [(3, 1), (7, 2), (9, 1), (15, 2), (16, 1)],
  term ((252450128745879785325220575726801684224 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (7, 2), (9, 2), (15, 1)],
  term ((-23010147928799045692499742092991476195705377154103841928 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (7, 2), (13, 1), (15, 2)],
  term ((301322371177440 : Rat) / 1162780221153193) [(3, 1), (7, 2), (13, 1), (15, 2), (16, 1)],
  term ((161891712224135268464196480124956186688 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (7, 2), (13, 2), (15, 1)],
  term ((35684606111448167526237422423713566304 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (7, 2), (14, 1), (15, 1)],
  term ((-113870637374100747540866397468259089636 : Rat) / 39990315246749243218889784267651308933) [(3, 1), (7, 2), (15, 1)],
  term ((11267418267709793249360068694802780071340436008626146210 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 1), (7, 2), (15, 3)],
  term ((-8526632792004408 : Rat) / 1162780221153193) [(3, 1), (7, 2), (15, 3), (16, 1)],
  term ((1652695128300478652375073904873736949728 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (8, 1), (9, 1), (14, 2)],
  term ((1652695128300478652375073904873736949728 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (8, 1), (9, 1), (15, 2)],
  term ((-3209257923513847776562869360713708288 : Rat) / 39990315246749243218889784267651308933) [(3, 1), (9, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((-3209257923513847776562869360713708288 : Rat) / 39990315246749243218889784267651308933) [(3, 1), (9, 1), (12, 1), (13, 1), (15, 3)],
  term ((179900494408894967444133818184926615716 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (9, 1), (12, 1), (14, 2)],
  term ((550224871676112102035615555952179792604942567145793832 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (9, 1), (12, 1), (14, 2), (15, 2)],
  term ((-1443384088015008 : Rat) / 1162780221153193) [(3, 1), (9, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((179900494408894967444133818184926615716 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (9, 1), (12, 1), (15, 2)],
  term ((550224871676112102035615555952179792604942567145793832 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (9, 1), (12, 1), (15, 4)],
  term ((-1443384088015008 : Rat) / 1162780221153193) [(3, 1), (9, 1), (12, 1), (15, 4), (16, 1)],
  term ((43135328846876119407214699700298383881329052598883204313 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(3, 1), (9, 1), (13, 1), (14, 2), (15, 1)],
  term ((-212582817171990 : Rat) / 1162780221153193) [(3, 1), (9, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((43135328846876119407214699700298383881329052598883204313 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(3, 1), (9, 1), (13, 1), (15, 3)],
  term ((-212582817171990 : Rat) / 1162780221153193) [(3, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((32374617250718488653403865302693490632 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (9, 1), (13, 2), (14, 2)],
  term ((32374617250718488653403865302693490632 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (9, 1), (13, 2), (15, 2)],
  term ((1217648963717924911224184363882747984154 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (9, 1), (14, 1), (15, 2)],
  term ((-1265214758912177429154822639424997249612 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (9, 1), (14, 2)],
  term ((4666118582264079879312520807185554929005944364492589137 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (9, 1), (14, 2), (15, 2)],
  term ((-7791585621739076 : Rat) / 1162780221153193) [(3, 1), (9, 1), (14, 2), (15, 2), (16, 1)],
  term ((1217648963717924911224184363882747984154 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (9, 1), (14, 3)],
  term ((-1265214758912177429154822639424997249612 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (9, 1), (15, 2)],
  term ((4666118582264079879312520807185554929005944364492589137 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (9, 1), (15, 4)],
  term ((-7791585621739076 : Rat) / 1162780221153193) [(3, 1), (9, 1), (15, 4), (16, 1)],
  term ((-234824404481097668778610925125521767712 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (9, 2), (13, 1), (14, 2)],
  term ((-234824404481097668778610925125521767712 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (9, 2), (13, 1), (15, 2)],
  term ((1224510104923201687356037336946774208653866347508271591 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (9, 2), (14, 2), (15, 1)],
  term ((-2242722674317404 : Rat) / 1162780221153193) [(3, 1), (9, 2), (14, 2), (15, 1), (16, 1)],
  term ((1224510104923201687356037336946774208653866347508271591 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (9, 2), (15, 3)],
  term ((-2242722674317404 : Rat) / 1162780221153193) [(3, 1), (9, 2), (15, 3), (16, 1)],
  term ((-189337596559409838993915431795101263168 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (9, 3), (14, 2)],
  term ((-189337596559409838993915431795101263168 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (9, 3), (15, 2)],
  term ((-75102373704376665566781970071753306182 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (13, 1), (14, 2)],
  term ((-75102373704376665566781970071753306182 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (13, 1), (15, 2)],
  term ((-608738527203217246998674594652026665011498996856867553 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(3, 1), (14, 2), (15, 1)],
  term ((929762167201001 : Rat) / 2325560442306386) [(3, 1), (14, 2), (15, 1), (16, 1)],
  term ((-608738527203217246998674594652026665011498996856867553 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(3, 1), (15, 3)],
  term ((929762167201001 : Rat) / 2325560442306386) [(3, 1), (15, 3), (16, 1)],
  term ((-33781967257793617486815206073153137696 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (5, 1), (6, 1), (9, 1), (14, 1)],
  term ((-40440149595023928932116585720924683072 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (5, 1), (6, 1), (13, 1), (14, 1)],
  term ((2173624517752731263429423385757322935670570690431915648 : Rat) / 232499738033004954626193357709066474366836605811865345) [(4, 1), (5, 1), (6, 1), (14, 1), (15, 1)],
  term ((-33781967257793617486815206073153137696 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (5, 1), (7, 1), (9, 1), (15, 1)],
  term ((-40440149595023928932116585720924683072 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (5, 1), (7, 1), (13, 1), (15, 1)],
  term ((2173624517752731263429423385757322935670570690431915648 : Rat) / 232499738033004954626193357709066474366836605811865345) [(4, 1), (5, 1), (7, 1), (15, 2)],
  term ((16890983628896808743407603036576568848 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (5, 1), (9, 1), (14, 2)],
  term ((16890983628896808743407603036576568848 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (5, 1), (9, 1), (15, 2)],
  term ((20220074797511964466058292860462341536 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (5, 1), (13, 1), (14, 2)],
  term ((20220074797511964466058292860462341536 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (5, 1), (13, 1), (15, 2)],
  term ((-1086812258876365631714711692878661467835285345215957824 : Rat) / 232499738033004954626193357709066474366836605811865345) [(4, 1), (5, 1), (14, 2), (15, 1)],
  term ((-1086812258876365631714711692878661467835285345215957824 : Rat) / 232499738033004954626193357709066474366836605811865345) [(4, 1), (5, 1), (15, 3)],
  term ((2450222601716328631311383716887028192 : Rat) / 677801953334732935913386174027988287) [(4, 1), (6, 1), (14, 1)],
  term ((2450222601716328631311383716887028192 : Rat) / 677801953334732935913386174027988287) [(4, 1), (7, 1), (15, 1)],
  term ((-1225111300858164315655691858443514096 : Rat) / 677801953334732935913386174027988287) [(4, 1), (14, 2)],
  term ((-1225111300858164315655691858443514096 : Rat) / 677801953334732935913386174027988287) [(4, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 17, terms 100 through 199. -/
theorem ep_Q2_024_block_17_0100_0199_valid :
    checkProductSumEq ep_Q2_024_partials_17_0100_0199
      ep_Q2_024_block_17_0100_0199 = true := by
  native_decide

end EpQ2024TermShards

end Patterns

end EndpointCertificate

end Problem97
