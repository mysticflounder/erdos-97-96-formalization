/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_024, term block 23:100-199

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_024`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2024TermShards

/-- Generator polynomial 23 for endpoint certificate `ep_Q2_024`. -/
def ep_Q2_024_generator_23_0100_0199 : Poly :=
[
  term (2 : Rat) [(10, 1), (12, 1)],
  term (2 : Rat) [(11, 1), (13, 1)],
  term (-1 : Rat) [(12, 2)],
  term (-1 : Rat) [(13, 2)]
]

/-- Coefficient term 100 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0100 : Poly :=
[
  term ((-751294408028112 : Rat) / 1162780221153193) [(5, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 100 for generator 23. -/
def ep_Q2_024_partial_23_0100 : Poly :=
[
  term ((-1502588816056224 : Rat) / 1162780221153193) [(5, 1), (9, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((751294408028112 : Rat) / 1162780221153193) [(5, 1), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((751294408028112 : Rat) / 1162780221153193) [(5, 1), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1502588816056224 : Rat) / 1162780221153193) [(5, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 23. -/
theorem ep_Q2_024_partial_23_0100_valid :
    mulPoly ep_Q2_024_coefficient_23_0100
        ep_Q2_024_generator_23_0100_0199 =
      ep_Q2_024_partial_23_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0101 : Poly :=
[
  term ((4053337278175410807249705373944761260 : Rat) / 39990315246749243218889784267651308933) [(5, 1), (9, 2), (11, 1)]
]

/-- Partial product 101 for generator 23. -/
def ep_Q2_024_partial_23_0101 : Poly :=
[
  term ((8106674556350821614499410747889522520 : Rat) / 39990315246749243218889784267651308933) [(5, 1), (9, 2), (10, 1), (11, 1), (12, 1)],
  term ((-4053337278175410807249705373944761260 : Rat) / 39990315246749243218889784267651308933) [(5, 1), (9, 2), (11, 1), (12, 2)],
  term ((-4053337278175410807249705373944761260 : Rat) / 39990315246749243218889784267651308933) [(5, 1), (9, 2), (11, 1), (13, 2)],
  term ((8106674556350821614499410747889522520 : Rat) / 39990315246749243218889784267651308933) [(5, 1), (9, 2), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 23. -/
theorem ep_Q2_024_partial_23_0101_valid :
    mulPoly ep_Q2_024_coefficient_23_0101
        ep_Q2_024_generator_23_0100_0199 =
      ep_Q2_024_partial_23_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0102 : Poly :=
[
  term ((-58584860508959984548273744671715578336 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (12, 1), (13, 1)]
]

/-- Partial product 102 for generator 23. -/
def ep_Q2_024_partial_23_0102 : Poly :=
[
  term ((-117169721017919969096547489343431156672 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (10, 1), (12, 2), (13, 1)],
  term ((-117169721017919969096547489343431156672 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (11, 1), (12, 1), (13, 2)],
  term ((58584860508959984548273744671715578336 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (12, 1), (13, 3)],
  term ((58584860508959984548273744671715578336 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (12, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 23. -/
theorem ep_Q2_024_partial_23_0102_valid :
    mulPoly ep_Q2_024_coefficient_23_0102
        ep_Q2_024_generator_23_0100_0199 =
      ep_Q2_024_partial_23_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0103 : Poly :=
[
  term ((5396288850334692873317446482465112039389870266563526977 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (12, 1), (15, 1)]
]

/-- Partial product 103 for generator 23. -/
def ep_Q2_024_partial_23_0103 : Poly :=
[
  term ((10792577700669385746634892964930224078779740533127053954 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (10, 1), (12, 2), (15, 1)],
  term ((10792577700669385746634892964930224078779740533127053954 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-5396288850334692873317446482465112039389870266563526977 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (12, 1), (13, 2), (15, 1)],
  term ((-5396288850334692873317446482465112039389870266563526977 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 23. -/
theorem ep_Q2_024_partial_23_0103_valid :
    mulPoly ep_Q2_024_coefficient_23_0103
        ep_Q2_024_generator_23_0100_0199 =
      ep_Q2_024_partial_23_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0104 : Poly :=
[
  term ((-1547430374826924 : Rat) / 1162780221153193) [(5, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 104 for generator 23. -/
def ep_Q2_024_partial_23_0104 : Poly :=
[
  term ((-3094860749653848 : Rat) / 1162780221153193) [(5, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-3094860749653848 : Rat) / 1162780221153193) [(5, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1547430374826924 : Rat) / 1162780221153193) [(5, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((1547430374826924 : Rat) / 1162780221153193) [(5, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 23. -/
theorem ep_Q2_024_partial_23_0104_valid :
    mulPoly ep_Q2_024_coefficient_23_0104
        ep_Q2_024_generator_23_0100_0199 =
      ep_Q2_024_partial_23_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0105 : Poly :=
[
  term ((7113448570382486634585561621360051752 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (13, 1)]
]

/-- Partial product 105 for generator 23. -/
def ep_Q2_024_partial_23_0105 : Poly :=
[
  term ((14226897140764973269171123242720103504 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (10, 1), (12, 1), (13, 1)],
  term ((14226897140764973269171123242720103504 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (11, 1), (13, 2)],
  term ((-7113448570382486634585561621360051752 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (12, 2), (13, 1)],
  term ((-7113448570382486634585561621360051752 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 23. -/
theorem ep_Q2_024_partial_23_0105_valid :
    mulPoly ep_Q2_024_coefficient_23_0105
        ep_Q2_024_generator_23_0100_0199 =
      ep_Q2_024_partial_23_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0106 : Poly :=
[
  term ((1060843780828011690178037117696406736 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (13, 1), (14, 1)]
]

/-- Partial product 106 for generator 23. -/
def ep_Q2_024_partial_23_0106 : Poly :=
[
  term ((2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (11, 1), (13, 2), (14, 1)],
  term ((-1060843780828011690178037117696406736 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (12, 2), (13, 1), (14, 1)],
  term ((-1060843780828011690178037117696406736 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (13, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 23. -/
theorem ep_Q2_024_partial_23_0106_valid :
    mulPoly ep_Q2_024_coefficient_23_0106
        ep_Q2_024_generator_23_0100_0199 =
      ep_Q2_024_partial_23_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0107 : Poly :=
[
  term ((168614132473848352421619338000873392948252297538773343 : Rat) / 278999685639605945551432029250879769240203926974238414) [(5, 1), (14, 1), (15, 1)]
]

/-- Partial product 107 for generator 23. -/
def ep_Q2_024_partial_23_0107 : Poly :=
[
  term ((168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-168614132473848352421619338000873392948252297538773343 : Rat) / 278999685639605945551432029250879769240203926974238414) [(5, 1), (12, 2), (14, 1), (15, 1)],
  term ((-168614132473848352421619338000873392948252297538773343 : Rat) / 278999685639605945551432029250879769240203926974238414) [(5, 1), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 23. -/
theorem ep_Q2_024_partial_23_0107_valid :
    mulPoly ep_Q2_024_coefficient_23_0107
        ep_Q2_024_generator_23_0100_0199 =
      ep_Q2_024_partial_23_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0108 : Poly :=
[
  term ((208491935260238 : Rat) / 1162780221153193) [(5, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 108 for generator 23. -/
def ep_Q2_024_partial_23_0108 : Poly :=
[
  term ((416983870520476 : Rat) / 1162780221153193) [(5, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((416983870520476 : Rat) / 1162780221153193) [(5, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-208491935260238 : Rat) / 1162780221153193) [(5, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-208491935260238 : Rat) / 1162780221153193) [(5, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 23. -/
theorem ep_Q2_024_partial_23_0108_valid :
    mulPoly ep_Q2_024_coefficient_23_0108
        ep_Q2_024_generator_23_0100_0199 =
      ep_Q2_024_partial_23_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0109 : Poly :=
[
  term ((184744853828697913697888159497283137409990300367651351 : Rat) / 92999895213201981850477343083626589746734642324746138) [(5, 1), (15, 1)]
]

/-- Partial product 109 for generator 23. -/
def ep_Q2_024_partial_23_0109 : Poly :=
[
  term ((184744853828697913697888159497283137409990300367651351 : Rat) / 46499947606600990925238671541813294873367321162373069) [(5, 1), (10, 1), (12, 1), (15, 1)],
  term ((184744853828697913697888159497283137409990300367651351 : Rat) / 46499947606600990925238671541813294873367321162373069) [(5, 1), (11, 1), (13, 1), (15, 1)],
  term ((-184744853828697913697888159497283137409990300367651351 : Rat) / 92999895213201981850477343083626589746734642324746138) [(5, 1), (12, 2), (15, 1)],
  term ((-184744853828697913697888159497283137409990300367651351 : Rat) / 92999895213201981850477343083626589746734642324746138) [(5, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 23. -/
theorem ep_Q2_024_partial_23_0109_valid :
    mulPoly ep_Q2_024_coefficient_23_0109
        ep_Q2_024_generator_23_0100_0199 =
      ep_Q2_024_partial_23_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0110 : Poly :=
[
  term ((-89752913403374 : Rat) / 1162780221153193) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 110 for generator 23. -/
def ep_Q2_024_partial_23_0110 : Poly :=
[
  term ((-179505826806748 : Rat) / 1162780221153193) [(5, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-179505826806748 : Rat) / 1162780221153193) [(5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((89752913403374 : Rat) / 1162780221153193) [(5, 1), (12, 2), (15, 1), (16, 1)],
  term ((89752913403374 : Rat) / 1162780221153193) [(5, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 23. -/
theorem ep_Q2_024_partial_23_0110_valid :
    mulPoly ep_Q2_024_coefficient_23_0110
        ep_Q2_024_generator_23_0100_0199 =
      ep_Q2_024_partial_23_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0111 : Poly :=
[
  term ((-1225265322114654679026622704559141817402 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 1), (9, 1)]
]

/-- Partial product 111 for generator 23. -/
def ep_Q2_024_partial_23_0111 : Poly :=
[
  term ((-2450530644229309358053245409118283634804 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 1), (9, 1), (10, 1), (12, 1)],
  term ((-2450530644229309358053245409118283634804 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 1), (9, 1), (11, 1), (13, 1)],
  term ((1225265322114654679026622704559141817402 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 1), (9, 1), (12, 2)],
  term ((1225265322114654679026622704559141817402 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 1), (9, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 23. -/
theorem ep_Q2_024_partial_23_0111_valid :
    mulPoly ep_Q2_024_coefficient_23_0111
        ep_Q2_024_generator_23_0100_0199 =
      ep_Q2_024_partial_23_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0112 : Poly :=
[
  term ((-25298165874506516766865488992203696292 : Rat) / 119970945740247729656669352802953926799) [(7, 1), (8, 1), (12, 1), (13, 1)]
]

/-- Partial product 112 for generator 23. -/
def ep_Q2_024_partial_23_0112 : Poly :=
[
  term ((-50596331749013033533730977984407392584 : Rat) / 119970945740247729656669352802953926799) [(7, 1), (8, 1), (10, 1), (12, 2), (13, 1)],
  term ((-50596331749013033533730977984407392584 : Rat) / 119970945740247729656669352802953926799) [(7, 1), (8, 1), (11, 1), (12, 1), (13, 2)],
  term ((25298165874506516766865488992203696292 : Rat) / 119970945740247729656669352802953926799) [(7, 1), (8, 1), (12, 1), (13, 3)],
  term ((25298165874506516766865488992203696292 : Rat) / 119970945740247729656669352802953926799) [(7, 1), (8, 1), (12, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 23. -/
theorem ep_Q2_024_partial_23_0112_valid :
    mulPoly ep_Q2_024_coefficient_23_0112
        ep_Q2_024_generator_23_0100_0199 =
      ep_Q2_024_partial_23_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0113 : Poly :=
[
  term ((4678910223116561885498892093094954879251581098910006897 : Rat) / 929998952132019818504773430836265897467346423247461380) [(7, 1), (8, 1), (12, 1), (15, 1)]
]

/-- Partial product 113 for generator 23. -/
def ep_Q2_024_partial_23_0113 : Poly :=
[
  term ((4678910223116561885498892093094954879251581098910006897 : Rat) / 464999476066009909252386715418132948733673211623730690) [(7, 1), (8, 1), (10, 1), (12, 2), (15, 1)],
  term ((4678910223116561885498892093094954879251581098910006897 : Rat) / 464999476066009909252386715418132948733673211623730690) [(7, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-4678910223116561885498892093094954879251581098910006897 : Rat) / 929998952132019818504773430836265897467346423247461380) [(7, 1), (8, 1), (12, 1), (13, 2), (15, 1)],
  term ((-4678910223116561885498892093094954879251581098910006897 : Rat) / 929998952132019818504773430836265897467346423247461380) [(7, 1), (8, 1), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 23. -/
theorem ep_Q2_024_partial_23_0113_valid :
    mulPoly ep_Q2_024_coefficient_23_0113
        ep_Q2_024_generator_23_0100_0199 =
      ep_Q2_024_partial_23_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0114 : Poly :=
[
  term ((-1146295204983097 : Rat) / 1162780221153193) [(7, 1), (8, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 114 for generator 23. -/
def ep_Q2_024_partial_23_0114 : Poly :=
[
  term ((-2292590409966194 : Rat) / 1162780221153193) [(7, 1), (8, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-2292590409966194 : Rat) / 1162780221153193) [(7, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1146295204983097 : Rat) / 1162780221153193) [(7, 1), (8, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((1146295204983097 : Rat) / 1162780221153193) [(7, 1), (8, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 23. -/
theorem ep_Q2_024_partial_23_0114_valid :
    mulPoly ep_Q2_024_coefficient_23_0114
        ep_Q2_024_generator_23_0100_0199 =
      ep_Q2_024_partial_23_0114 := by
  native_decide

/-- Coefficient term 115 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0115 : Poly :=
[
  term ((84493850184000825786514095782442813484 : Rat) / 119970945740247729656669352802953926799) [(7, 1), (8, 1), (13, 1)]
]

/-- Partial product 115 for generator 23. -/
def ep_Q2_024_partial_23_0115 : Poly :=
[
  term ((168987700368001651573028191564885626968 : Rat) / 119970945740247729656669352802953926799) [(7, 1), (8, 1), (10, 1), (12, 1), (13, 1)],
  term ((168987700368001651573028191564885626968 : Rat) / 119970945740247729656669352802953926799) [(7, 1), (8, 1), (11, 1), (13, 2)],
  term ((-84493850184000825786514095782442813484 : Rat) / 119970945740247729656669352802953926799) [(7, 1), (8, 1), (12, 2), (13, 1)],
  term ((-84493850184000825786514095782442813484 : Rat) / 119970945740247729656669352802953926799) [(7, 1), (8, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 115 for generator 23. -/
theorem ep_Q2_024_partial_23_0115_valid :
    mulPoly ep_Q2_024_coefficient_23_0115
        ep_Q2_024_generator_23_0100_0199 =
      ep_Q2_024_partial_23_0115 := by
  native_decide

/-- Coefficient term 116 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0116 : Poly :=
[
  term ((177146052459990833086843034621145881016452606292749398931 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(7, 1), (8, 1), (15, 1)]
]

/-- Partial product 116 for generator 23. -/
def ep_Q2_024_partial_23_0116 : Poly :=
[
  term ((177146052459990833086843034621145881016452606292749398931 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(7, 1), (8, 1), (10, 1), (12, 1), (15, 1)],
  term ((177146052459990833086843034621145881016452606292749398931 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(7, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((-177146052459990833086843034621145881016452606292749398931 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(7, 1), (8, 1), (12, 2), (15, 1)],
  term ((-177146052459990833086843034621145881016452606292749398931 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(7, 1), (8, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 116 for generator 23. -/
theorem ep_Q2_024_partial_23_0116_valid :
    mulPoly ep_Q2_024_coefficient_23_0116
        ep_Q2_024_generator_23_0100_0199 =
      ep_Q2_024_partial_23_0116 := by
  native_decide

/-- Coefficient term 117 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0117 : Poly :=
[
  term ((-1082535559364413 : Rat) / 2325560442306386) [(7, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 117 for generator 23. -/
def ep_Q2_024_partial_23_0117 : Poly :=
[
  term ((-1082535559364413 : Rat) / 1162780221153193) [(7, 1), (8, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1082535559364413 : Rat) / 1162780221153193) [(7, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((1082535559364413 : Rat) / 2325560442306386) [(7, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((1082535559364413 : Rat) / 2325560442306386) [(7, 1), (8, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 117 for generator 23. -/
theorem ep_Q2_024_partial_23_0117_valid :
    mulPoly ep_Q2_024_coefficient_23_0117
        ep_Q2_024_generator_23_0100_0199 =
      ep_Q2_024_partial_23_0117 := by
  native_decide

/-- Coefficient term 118 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0118 : Poly :=
[
  term ((-459611831851322940129223789282031031587 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (9, 1)]
]

/-- Partial product 118 for generator 23. -/
def ep_Q2_024_partial_23_0118 : Poly :=
[
  term ((-919223663702645880258447578564062063174 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (9, 1), (10, 1), (12, 1)],
  term ((-919223663702645880258447578564062063174 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (9, 1), (11, 1), (13, 1)],
  term ((459611831851322940129223789282031031587 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (9, 1), (12, 2)],
  term ((459611831851322940129223789282031031587 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (9, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 118 for generator 23. -/
theorem ep_Q2_024_partial_23_0118_valid :
    mulPoly ep_Q2_024_coefficient_23_0118
        ep_Q2_024_generator_23_0100_0199 =
      ep_Q2_024_partial_23_0118 := by
  native_decide

/-- Coefficient term 119 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0119 : Poly :=
[
  term ((3993831043486647702866554363354132024 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (9, 1), (12, 1)]
]

/-- Partial product 119 for generator 23. -/
def ep_Q2_024_partial_23_0119 : Poly :=
[
  term ((7987662086973295405733108726708264048 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (9, 1), (10, 1), (12, 2)],
  term ((7987662086973295405733108726708264048 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((-3993831043486647702866554363354132024 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (9, 1), (12, 1), (13, 2)],
  term ((-3993831043486647702866554363354132024 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (9, 1), (12, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 119 for generator 23. -/
theorem ep_Q2_024_partial_23_0119_valid :
    mulPoly ep_Q2_024_coefficient_23_0119
        ep_Q2_024_generator_23_0100_0199 =
      ep_Q2_024_partial_23_0119 := by
  native_decide

/-- Coefficient term 120 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0120 : Poly :=
[
  term ((-676213086050591368592897368991884456 : Rat) / 39990315246749243218889784267651308933) [(7, 1), (9, 1), (14, 1)]
]

/-- Partial product 120 for generator 23. -/
def ep_Q2_024_partial_23_0120 : Poly :=
[
  term ((-1352426172101182737185794737983768912 : Rat) / 39990315246749243218889784267651308933) [(7, 1), (9, 1), (10, 1), (12, 1), (14, 1)],
  term ((-1352426172101182737185794737983768912 : Rat) / 39990315246749243218889784267651308933) [(7, 1), (9, 1), (11, 1), (13, 1), (14, 1)],
  term ((676213086050591368592897368991884456 : Rat) / 39990315246749243218889784267651308933) [(7, 1), (9, 1), (12, 2), (14, 1)],
  term ((676213086050591368592897368991884456 : Rat) / 39990315246749243218889784267651308933) [(7, 1), (9, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 120 for generator 23. -/
theorem ep_Q2_024_partial_23_0120_valid :
    mulPoly ep_Q2_024_coefficient_23_0120
        ep_Q2_024_generator_23_0100_0199 =
      ep_Q2_024_partial_23_0120 := by
  native_decide

/-- Coefficient term 121 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0121 : Poly :=
[
  term ((87483070406245862995382813691713434496 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 121 for generator 23. -/
def ep_Q2_024_partial_23_0121 : Poly :=
[
  term ((174966140812491725990765627383426868992 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (10, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-87483070406245862995382813691713434496 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (11, 1), (12, 2), (13, 1), (15, 1)],
  term ((-87483070406245862995382813691713434496 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (11, 1), (13, 3), (15, 1)],
  term ((174966140812491725990765627383426868992 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (11, 2), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 121 for generator 23. -/
theorem ep_Q2_024_partial_23_0121_valid :
    mulPoly ep_Q2_024_coefficient_23_0121
        ep_Q2_024_generator_23_0100_0199 =
      ep_Q2_024_partial_23_0121 := by
  native_decide

/-- Coefficient term 122 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0122 : Poly :=
[
  term ((8088250242351929820163091804873870410062191739236192053 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (11, 1), (15, 2)]
]

/-- Partial product 122 for generator 23. -/
def ep_Q2_024_partial_23_0122 : Poly :=
[
  term ((16176500484703859640326183609747740820124383478472384106 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (10, 1), (11, 1), (12, 1), (15, 2)],
  term ((-8088250242351929820163091804873870410062191739236192053 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (11, 1), (12, 2), (15, 2)],
  term ((-8088250242351929820163091804873870410062191739236192053 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (11, 1), (13, 2), (15, 2)],
  term ((16176500484703859640326183609747740820124383478472384106 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (11, 2), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 122 for generator 23. -/
theorem ep_Q2_024_partial_23_0122_valid :
    mulPoly ep_Q2_024_coefficient_23_0122
        ep_Q2_024_generator_23_0100_0199 =
      ep_Q2_024_partial_23_0122 := by
  native_decide

/-- Coefficient term 123 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0123 : Poly :=
[
  term ((57972216906980 : Rat) / 1162780221153193) [(7, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 123 for generator 23. -/
def ep_Q2_024_partial_23_0123 : Poly :=
[
  term ((115944433813960 : Rat) / 1162780221153193) [(7, 1), (10, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-57972216906980 : Rat) / 1162780221153193) [(7, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((-57972216906980 : Rat) / 1162780221153193) [(7, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((115944433813960 : Rat) / 1162780221153193) [(7, 1), (11, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 123 for generator 23. -/
theorem ep_Q2_024_partial_23_0123_valid :
    mulPoly ep_Q2_024_coefficient_23_0123
        ep_Q2_024_generator_23_0100_0199 =
      ep_Q2_024_partial_23_0123 := by
  native_decide

/-- Coefficient term 124 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0124 : Poly :=
[
  term ((-402670849258123873243703868377101222618 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (12, 1), (13, 1)]
]

/-- Partial product 124 for generator 23. -/
def ep_Q2_024_partial_23_0124 : Poly :=
[
  term ((-805341698516247746487407736754202445236 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (10, 1), (12, 2), (13, 1)],
  term ((-805341698516247746487407736754202445236 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (11, 1), (12, 1), (13, 2)],
  term ((402670849258123873243703868377101222618 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (12, 1), (13, 3)],
  term ((402670849258123873243703868377101222618 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (12, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 124 for generator 23. -/
theorem ep_Q2_024_partial_23_0124_valid :
    mulPoly ep_Q2_024_coefficient_23_0124
        ep_Q2_024_generator_23_0100_0199 =
      ep_Q2_024_partial_23_0124 := by
  native_decide

/-- Coefficient term 125 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0125 : Poly :=
[
  term ((-3590785172512544607755272603180906352 : Rat) / 39990315246749243218889784267651308933) [(7, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 125 for generator 23. -/
def ep_Q2_024_partial_23_0125 : Poly :=
[
  term ((-7181570345025089215510545206361812704 : Rat) / 39990315246749243218889784267651308933) [(7, 1), (10, 1), (12, 2), (13, 1), (14, 1)],
  term ((-7181570345025089215510545206361812704 : Rat) / 39990315246749243218889784267651308933) [(7, 1), (11, 1), (12, 1), (13, 2), (14, 1)],
  term ((3590785172512544607755272603180906352 : Rat) / 39990315246749243218889784267651308933) [(7, 1), (12, 1), (13, 3), (14, 1)],
  term ((3590785172512544607755272603180906352 : Rat) / 39990315246749243218889784267651308933) [(7, 1), (12, 3), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 125 for generator 23. -/
theorem ep_Q2_024_partial_23_0125_valid :
    mulPoly ep_Q2_024_coefficient_23_0125
        ep_Q2_024_generator_23_0100_0199 =
      ep_Q2_024_partial_23_0125 := by
  native_decide

/-- Coefficient term 126 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0126 : Poly :=
[
  term ((2037240126095306036741680361023274517638948450580027006 : Rat) / 232499738033004954626193357709066474366836605811865345) [(7, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 126 for generator 23. -/
def ep_Q2_024_partial_23_0126 : Poly :=
[
  term ((4074480252190612073483360722046549035277896901160054012 : Rat) / 232499738033004954626193357709066474366836605811865345) [(7, 1), (10, 1), (12, 2), (14, 1), (15, 1)],
  term ((4074480252190612073483360722046549035277896901160054012 : Rat) / 232499738033004954626193357709066474366836605811865345) [(7, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-2037240126095306036741680361023274517638948450580027006 : Rat) / 232499738033004954626193357709066474366836605811865345) [(7, 1), (12, 1), (13, 2), (14, 1), (15, 1)],
  term ((-2037240126095306036741680361023274517638948450580027006 : Rat) / 232499738033004954626193357709066474366836605811865345) [(7, 1), (12, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 126 for generator 23. -/
theorem ep_Q2_024_partial_23_0126_valid :
    mulPoly ep_Q2_024_coefficient_23_0126
        ep_Q2_024_generator_23_0100_0199 =
      ep_Q2_024_partial_23_0126 := by
  native_decide

/-- Coefficient term 127 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0127 : Poly :=
[
  term ((-3012139900347352 : Rat) / 1162780221153193) [(7, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 127 for generator 23. -/
def ep_Q2_024_partial_23_0127 : Poly :=
[
  term ((-6024279800694704 : Rat) / 1162780221153193) [(7, 1), (10, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-6024279800694704 : Rat) / 1162780221153193) [(7, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((3012139900347352 : Rat) / 1162780221153193) [(7, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((3012139900347352 : Rat) / 1162780221153193) [(7, 1), (12, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 127 for generator 23. -/
theorem ep_Q2_024_partial_23_0127_valid :
    mulPoly ep_Q2_024_coefficient_23_0127
        ep_Q2_024_generator_23_0100_0199 =
      ep_Q2_024_partial_23_0127 := by
  native_decide

/-- Coefficient term 128 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0128 : Poly :=
[
  term ((63266169461659354395606229885235433260289045114720801271 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(7, 1), (12, 1), (15, 1)]
]

/-- Partial product 128 for generator 23. -/
def ep_Q2_024_partial_23_0128 : Poly :=
[
  term ((63266169461659354395606229885235433260289045114720801271 : Rat) / 929998952132019818504773430836265897467346423247461380) [(7, 1), (10, 1), (12, 2), (15, 1)],
  term ((63266169461659354395606229885235433260289045114720801271 : Rat) / 929998952132019818504773430836265897467346423247461380) [(7, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-63266169461659354395606229885235433260289045114720801271 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(7, 1), (12, 1), (13, 2), (15, 1)],
  term ((-63266169461659354395606229885235433260289045114720801271 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(7, 1), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 128 for generator 23. -/
theorem ep_Q2_024_partial_23_0128_valid :
    mulPoly ep_Q2_024_coefficient_23_0128
        ep_Q2_024_generator_23_0100_0199 =
      ep_Q2_024_partial_23_0128 := by
  native_decide

/-- Coefficient term 129 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0129 : Poly :=
[
  term ((-6533280838736367 : Rat) / 2325560442306386) [(7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 129 for generator 23. -/
def ep_Q2_024_partial_23_0129 : Poly :=
[
  term ((-6533280838736367 : Rat) / 1162780221153193) [(7, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-6533280838736367 : Rat) / 1162780221153193) [(7, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((6533280838736367 : Rat) / 2325560442306386) [(7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((6533280838736367 : Rat) / 2325560442306386) [(7, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 129 for generator 23. -/
theorem ep_Q2_024_partial_23_0129_valid :
    mulPoly ep_Q2_024_coefficient_23_0129
        ep_Q2_024_generator_23_0100_0199 =
      ep_Q2_024_partial_23_0129 := by
  native_decide

/-- Coefficient term 130 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0130 : Poly :=
[
  term ((788213614432342792766430899416648875488 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (12, 2), (13, 1)]
]

/-- Partial product 130 for generator 23. -/
def ep_Q2_024_partial_23_0130 : Poly :=
[
  term ((1576427228864685585532861798833297750976 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (10, 1), (12, 3), (13, 1)],
  term ((1576427228864685585532861798833297750976 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (11, 1), (12, 2), (13, 2)],
  term ((-788213614432342792766430899416648875488 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (12, 2), (13, 3)],
  term ((-788213614432342792766430899416648875488 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (12, 4), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 130 for generator 23. -/
theorem ep_Q2_024_partial_23_0130_valid :
    mulPoly ep_Q2_024_coefficient_23_0130
        ep_Q2_024_generator_23_0100_0199 =
      ep_Q2_024_partial_23_0130 := by
  native_decide

/-- Coefficient term 131 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0131 : Poly :=
[
  term ((-7095251845643878279999055380386123506564735392041769998 : Rat) / 232499738033004954626193357709066474366836605811865345) [(7, 1), (12, 2), (15, 1)]
]

/-- Partial product 131 for generator 23. -/
def ep_Q2_024_partial_23_0131 : Poly :=
[
  term ((-14190503691287756559998110760772247013129470784083539996 : Rat) / 232499738033004954626193357709066474366836605811865345) [(7, 1), (10, 1), (12, 3), (15, 1)],
  term ((-14190503691287756559998110760772247013129470784083539996 : Rat) / 232499738033004954626193357709066474366836605811865345) [(7, 1), (11, 1), (12, 2), (13, 1), (15, 1)],
  term ((7095251845643878279999055380386123506564735392041769998 : Rat) / 232499738033004954626193357709066474366836605811865345) [(7, 1), (12, 2), (13, 2), (15, 1)],
  term ((7095251845643878279999055380386123506564735392041769998 : Rat) / 232499738033004954626193357709066474366836605811865345) [(7, 1), (12, 4), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 131 for generator 23. -/
theorem ep_Q2_024_partial_23_0131_valid :
    mulPoly ep_Q2_024_coefficient_23_0131
        ep_Q2_024_generator_23_0100_0199 =
      ep_Q2_024_partial_23_0131 := by
  native_decide

/-- Coefficient term 132 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0132 : Poly :=
[
  term ((5285404992210680 : Rat) / 1162780221153193) [(7, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 132 for generator 23. -/
def ep_Q2_024_partial_23_0132 : Poly :=
[
  term ((10570809984421360 : Rat) / 1162780221153193) [(7, 1), (10, 1), (12, 3), (15, 1), (16, 1)],
  term ((10570809984421360 : Rat) / 1162780221153193) [(7, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-5285404992210680 : Rat) / 1162780221153193) [(7, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((-5285404992210680 : Rat) / 1162780221153193) [(7, 1), (12, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 132 for generator 23. -/
theorem ep_Q2_024_partial_23_0132_valid :
    mulPoly ep_Q2_024_coefficient_23_0132
        ep_Q2_024_generator_23_0100_0199 =
      ep_Q2_024_partial_23_0132 := by
  native_decide

/-- Coefficient term 133 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0133 : Poly :=
[
  term ((1964085486715778448984320958955741085701 : Rat) / 1799564186103715944850040292044308901985) [(7, 1), (13, 1)]
]

/-- Partial product 133 for generator 23. -/
def ep_Q2_024_partial_23_0133 : Poly :=
[
  term ((3928170973431556897968641917911482171402 : Rat) / 1799564186103715944850040292044308901985) [(7, 1), (10, 1), (12, 1), (13, 1)],
  term ((3928170973431556897968641917911482171402 : Rat) / 1799564186103715944850040292044308901985) [(7, 1), (11, 1), (13, 2)],
  term ((-1964085486715778448984320958955741085701 : Rat) / 1799564186103715944850040292044308901985) [(7, 1), (12, 2), (13, 1)],
  term ((-1964085486715778448984320958955741085701 : Rat) / 1799564186103715944850040292044308901985) [(7, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 133 for generator 23. -/
theorem ep_Q2_024_partial_23_0133_valid :
    mulPoly ep_Q2_024_coefficient_23_0133
        ep_Q2_024_generator_23_0100_0199 =
      ep_Q2_024_partial_23_0133 := by
  native_decide

/-- Coefficient term 134 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0134 : Poly :=
[
  term ((-8141645059018279550062865804762825616 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (13, 1), (14, 1)]
]

/-- Partial product 134 for generator 23. -/
def ep_Q2_024_partial_23_0134 : Poly :=
[
  term ((-16283290118036559100125731609525651232 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((-16283290118036559100125731609525651232 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (11, 1), (13, 2), (14, 1)],
  term ((8141645059018279550062865804762825616 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (12, 2), (13, 1), (14, 1)],
  term ((8141645059018279550062865804762825616 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (13, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 134 for generator 23. -/
theorem ep_Q2_024_partial_23_0134_valid :
    mulPoly ep_Q2_024_coefficient_23_0134
        ep_Q2_024_generator_23_0100_0199 =
      ep_Q2_024_partial_23_0134 := by
  native_decide

/-- Coefficient term 135 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0135 : Poly :=
[
  term ((-12993854568522293920978843515494007592 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (13, 1), (14, 2)]
]

/-- Partial product 135 for generator 23. -/
def ep_Q2_024_partial_23_0135 : Poly :=
[
  term ((-25987709137044587841957687030988015184 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (10, 1), (12, 1), (13, 1), (14, 2)],
  term ((-25987709137044587841957687030988015184 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (11, 1), (13, 2), (14, 2)],
  term ((12993854568522293920978843515494007592 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (12, 2), (13, 1), (14, 2)],
  term ((12993854568522293920978843515494007592 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (13, 3), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 135 for generator 23. -/
theorem ep_Q2_024_partial_23_0135_valid :
    mulPoly ep_Q2_024_coefficient_23_0135
        ep_Q2_024_generator_23_0100_0199 =
      ep_Q2_024_partial_23_0135 := by
  native_decide

/-- Coefficient term 136 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0136 : Poly :=
[
  term ((-3970579869320046188890854025519078292100922916260815664 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (13, 1), (15, 2)]
]

/-- Partial product 136 for generator 23. -/
def ep_Q2_024_partial_23_0136 : Poly :=
[
  term ((-7941159738640092377781708051038156584201845832521631328 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (10, 1), (12, 1), (13, 1), (15, 2)],
  term ((-7941159738640092377781708051038156584201845832521631328 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (11, 1), (13, 2), (15, 2)],
  term ((3970579869320046188890854025519078292100922916260815664 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (12, 2), (13, 1), (15, 2)],
  term ((3970579869320046188890854025519078292100922916260815664 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (13, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 136 for generator 23. -/
theorem ep_Q2_024_partial_23_0136_valid :
    mulPoly ep_Q2_024_coefficient_23_0136
        ep_Q2_024_generator_23_0100_0199 =
      ep_Q2_024_partial_23_0136 := by
  native_decide

/-- Coefficient term 137 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0137 : Poly :=
[
  term ((547402423131936 : Rat) / 1162780221153193) [(7, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 137 for generator 23. -/
def ep_Q2_024_partial_23_0137 : Poly :=
[
  term ((1094804846263872 : Rat) / 1162780221153193) [(7, 1), (10, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((1094804846263872 : Rat) / 1162780221153193) [(7, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-547402423131936 : Rat) / 1162780221153193) [(7, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-547402423131936 : Rat) / 1162780221153193) [(7, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 137 for generator 23. -/
theorem ep_Q2_024_partial_23_0137_valid :
    mulPoly ep_Q2_024_coefficient_23_0137
        ep_Q2_024_generator_23_0100_0199 =
      ep_Q2_024_partial_23_0137 := by
  native_decide

/-- Coefficient term 138 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0138 : Poly :=
[
  term ((-13745531607434432581056012415488998176 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (13, 2), (15, 1)]
]

/-- Partial product 138 for generator 23. -/
def ep_Q2_024_partial_23_0138 : Poly :=
[
  term ((-27491063214868865162112024830977996352 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (10, 1), (12, 1), (13, 2), (15, 1)],
  term ((-27491063214868865162112024830977996352 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (11, 1), (13, 3), (15, 1)],
  term ((13745531607434432581056012415488998176 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (12, 2), (13, 2), (15, 1)],
  term ((13745531607434432581056012415488998176 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (13, 4), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 138 for generator 23. -/
theorem ep_Q2_024_partial_23_0138_valid :
    mulPoly ep_Q2_024_coefficient_23_0138
        ep_Q2_024_generator_23_0100_0199 =
      ep_Q2_024_partial_23_0138 := by
  native_decide

/-- Coefficient term 139 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0139 : Poly :=
[
  term ((53824762600716421491094410962189703401457332436241210747 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(7, 1), (14, 1), (15, 1)]
]

/-- Partial product 139 for generator 23. -/
def ep_Q2_024_partial_23_0139 : Poly :=
[
  term ((53824762600716421491094410962189703401457332436241210747 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((53824762600716421491094410962189703401457332436241210747 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-53824762600716421491094410962189703401457332436241210747 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(7, 1), (12, 2), (14, 1), (15, 1)],
  term ((-53824762600716421491094410962189703401457332436241210747 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(7, 1), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 139 for generator 23. -/
theorem ep_Q2_024_partial_23_0139_valid :
    mulPoly ep_Q2_024_coefficient_23_0139
        ep_Q2_024_generator_23_0100_0199 =
      ep_Q2_024_partial_23_0139 := by
  native_decide

/-- Coefficient term 140 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0140 : Poly :=
[
  term ((-3756917212699698 : Rat) / 1162780221153193) [(7, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 140 for generator 23. -/
def ep_Q2_024_partial_23_0140 : Poly :=
[
  term ((-7513834425399396 : Rat) / 1162780221153193) [(7, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7513834425399396 : Rat) / 1162780221153193) [(7, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((3756917212699698 : Rat) / 1162780221153193) [(7, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((3756917212699698 : Rat) / 1162780221153193) [(7, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 140 for generator 23. -/
theorem ep_Q2_024_partial_23_0140_valid :
    mulPoly ep_Q2_024_coefficient_23_0140
        ep_Q2_024_generator_23_0100_0199 =
      ep_Q2_024_partial_23_0140 := by
  native_decide

/-- Coefficient term 141 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0141 : Poly :=
[
  term ((-1244189986840640425147752204580695015008324025900791366 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (14, 2), (15, 1)]
]

/-- Partial product 141 for generator 23. -/
def ep_Q2_024_partial_23_0141 : Poly :=
[
  term ((-2488379973681280850295504409161390030016648051801582732 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (10, 1), (12, 1), (14, 2), (15, 1)],
  term ((-2488379973681280850295504409161390030016648051801582732 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((1244189986840640425147752204580695015008324025900791366 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (12, 2), (14, 2), (15, 1)],
  term ((1244189986840640425147752204580695015008324025900791366 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (13, 2), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 141 for generator 23. -/
theorem ep_Q2_024_partial_23_0141_valid :
    mulPoly ep_Q2_024_coefficient_23_0141
        ep_Q2_024_generator_23_0100_0199 =
      ep_Q2_024_partial_23_0141 := by
  native_decide

/-- Coefficient term 142 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0142 : Poly :=
[
  term ((312276948646616 : Rat) / 1162780221153193) [(7, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 142 for generator 23. -/
def ep_Q2_024_partial_23_0142 : Poly :=
[
  term ((624553897293232 : Rat) / 1162780221153193) [(7, 1), (10, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((624553897293232 : Rat) / 1162780221153193) [(7, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-312276948646616 : Rat) / 1162780221153193) [(7, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((-312276948646616 : Rat) / 1162780221153193) [(7, 1), (13, 2), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 142 for generator 23. -/
theorem ep_Q2_024_partial_23_0142_valid :
    mulPoly ep_Q2_024_coefficient_23_0142
        ep_Q2_024_generator_23_0100_0199 =
      ep_Q2_024_partial_23_0142 := by
  native_decide

/-- Coefficient term 143 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0143 : Poly :=
[
  term ((-814726240890892284181068227080131452530875400483914284347 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(7, 1), (15, 1)]
]

/-- Partial product 143 for generator 23. -/
def ep_Q2_024_partial_23_0143 : Poly :=
[
  term ((-814726240890892284181068227080131452530875400483914284347 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(7, 1), (10, 1), (12, 1), (15, 1)],
  term ((-814726240890892284181068227080131452530875400483914284347 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(7, 1), (11, 1), (13, 1), (15, 1)],
  term ((814726240890892284181068227080131452530875400483914284347 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(7, 1), (12, 2), (15, 1)],
  term ((814726240890892284181068227080131452530875400483914284347 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(7, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 143 for generator 23. -/
theorem ep_Q2_024_partial_23_0143_valid :
    mulPoly ep_Q2_024_coefficient_23_0143
        ep_Q2_024_generator_23_0100_0199 =
      ep_Q2_024_partial_23_0143 := by
  native_decide

/-- Coefficient term 144 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0144 : Poly :=
[
  term ((14078238642132395 : Rat) / 2325560442306386) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 144 for generator 23. -/
def ep_Q2_024_partial_23_0144 : Poly :=
[
  term ((14078238642132395 : Rat) / 1162780221153193) [(7, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((14078238642132395 : Rat) / 1162780221153193) [(7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-14078238642132395 : Rat) / 2325560442306386) [(7, 1), (12, 2), (15, 1), (16, 1)],
  term ((-14078238642132395 : Rat) / 2325560442306386) [(7, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 144 for generator 23. -/
theorem ep_Q2_024_partial_23_0144_valid :
    mulPoly ep_Q2_024_coefficient_23_0144
        ep_Q2_024_generator_23_0100_0199 =
      ep_Q2_024_partial_23_0144 := by
  native_decide

/-- Coefficient term 145 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0145 : Poly :=
[
  term ((-1244189986840640425147752204580695015008324025900791366 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (15, 3)]
]

/-- Partial product 145 for generator 23. -/
def ep_Q2_024_partial_23_0145 : Poly :=
[
  term ((-2488379973681280850295504409161390030016648051801582732 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (10, 1), (12, 1), (15, 3)],
  term ((-2488379973681280850295504409161390030016648051801582732 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (11, 1), (13, 1), (15, 3)],
  term ((1244189986840640425147752204580695015008324025900791366 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (12, 2), (15, 3)],
  term ((1244189986840640425147752204580695015008324025900791366 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (13, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 145 for generator 23. -/
theorem ep_Q2_024_partial_23_0145_valid :
    mulPoly ep_Q2_024_coefficient_23_0145
        ep_Q2_024_generator_23_0100_0199 =
      ep_Q2_024_partial_23_0145 := by
  native_decide

/-- Coefficient term 146 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0146 : Poly :=
[
  term ((312276948646616 : Rat) / 1162780221153193) [(7, 1), (15, 3), (16, 1)]
]

/-- Partial product 146 for generator 23. -/
def ep_Q2_024_partial_23_0146 : Poly :=
[
  term ((624553897293232 : Rat) / 1162780221153193) [(7, 1), (10, 1), (12, 1), (15, 3), (16, 1)],
  term ((624553897293232 : Rat) / 1162780221153193) [(7, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-312276948646616 : Rat) / 1162780221153193) [(7, 1), (12, 2), (15, 3), (16, 1)],
  term ((-312276948646616 : Rat) / 1162780221153193) [(7, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 146 for generator 23. -/
theorem ep_Q2_024_partial_23_0146_valid :
    mulPoly ep_Q2_024_coefficient_23_0146
        ep_Q2_024_generator_23_0100_0199 =
      ep_Q2_024_partial_23_0146 := by
  native_decide

/-- Coefficient term 147 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0147 : Poly :=
[
  term ((-1345057098603944281387491986161871628158 : Rat) / 1799564186103715944850040292044308901985) [(8, 1)]
]

/-- Partial product 147 for generator 23. -/
def ep_Q2_024_partial_23_0147 : Poly :=
[
  term ((-2690114197207888562774983972323743256316 : Rat) / 1799564186103715944850040292044308901985) [(8, 1), (10, 1), (12, 1)],
  term ((-2690114197207888562774983972323743256316 : Rat) / 1799564186103715944850040292044308901985) [(8, 1), (11, 1), (13, 1)],
  term ((1345057098603944281387491986161871628158 : Rat) / 1799564186103715944850040292044308901985) [(8, 1), (12, 2)],
  term ((1345057098603944281387491986161871628158 : Rat) / 1799564186103715944850040292044308901985) [(8, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 147 for generator 23. -/
theorem ep_Q2_024_partial_23_0147_valid :
    mulPoly ep_Q2_024_coefficient_23_0147
        ep_Q2_024_generator_23_0100_0199 =
      ep_Q2_024_partial_23_0147 := by
  native_decide

/-- Coefficient term 148 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0148 : Poly :=
[
  term ((-121588940735489082070848072049143946532 : Rat) / 39990315246749243218889784267651308933) [(8, 1), (9, 1), (11, 1)]
]

/-- Partial product 148 for generator 23. -/
def ep_Q2_024_partial_23_0148 : Poly :=
[
  term ((-243177881470978164141696144098287893064 : Rat) / 39990315246749243218889784267651308933) [(8, 1), (9, 1), (10, 1), (11, 1), (12, 1)],
  term ((121588940735489082070848072049143946532 : Rat) / 39990315246749243218889784267651308933) [(8, 1), (9, 1), (11, 1), (12, 2)],
  term ((121588940735489082070848072049143946532 : Rat) / 39990315246749243218889784267651308933) [(8, 1), (9, 1), (11, 1), (13, 2)],
  term ((-243177881470978164141696144098287893064 : Rat) / 39990315246749243218889784267651308933) [(8, 1), (9, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 148 for generator 23. -/
theorem ep_Q2_024_partial_23_0148_valid :
    mulPoly ep_Q2_024_coefficient_23_0148
        ep_Q2_024_generator_23_0100_0199 =
      ep_Q2_024_partial_23_0148 := by
  native_decide

/-- Coefficient term 149 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0149 : Poly :=
[
  term ((25958341366293579878171789183491304344 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (9, 1), (12, 1), (13, 1)]
]

/-- Partial product 149 for generator 23. -/
def ep_Q2_024_partial_23_0149 : Poly :=
[
  term ((51916682732587159756343578366982608688 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (9, 1), (10, 1), (12, 2), (13, 1)],
  term ((51916682732587159756343578366982608688 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (9, 1), (11, 1), (12, 1), (13, 2)],
  term ((-25958341366293579878171789183491304344 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (9, 1), (12, 1), (13, 3)],
  term ((-25958341366293579878171789183491304344 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (9, 1), (12, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 149 for generator 23. -/
theorem ep_Q2_024_partial_23_0149_valid :
    mulPoly ep_Q2_024_coefficient_23_0149
        ep_Q2_024_generator_23_0100_0199 =
      ep_Q2_024_partial_23_0149 := by
  native_decide

/-- Coefficient term 150 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0150 : Poly :=
[
  term ((-519790077507635364246714238454931580267528154182411463 : Rat) / 464999476066009909252386715418132948733673211623730690) [(8, 1), (9, 1), (12, 1), (15, 1)]
]

/-- Partial product 150 for generator 23. -/
def ep_Q2_024_partial_23_0150 : Poly :=
[
  term ((-519790077507635364246714238454931580267528154182411463 : Rat) / 232499738033004954626193357709066474366836605811865345) [(8, 1), (9, 1), (10, 1), (12, 2), (15, 1)],
  term ((-519790077507635364246714238454931580267528154182411463 : Rat) / 232499738033004954626193357709066474366836605811865345) [(8, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((519790077507635364246714238454931580267528154182411463 : Rat) / 464999476066009909252386715418132948733673211623730690) [(8, 1), (9, 1), (12, 1), (13, 2), (15, 1)],
  term ((519790077507635364246714238454931580267528154182411463 : Rat) / 464999476066009909252386715418132948733673211623730690) [(8, 1), (9, 1), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 150 for generator 23. -/
theorem ep_Q2_024_partial_23_0150_valid :
    mulPoly ep_Q2_024_coefficient_23_0150
        ep_Q2_024_generator_23_0100_0199 =
      ep_Q2_024_partial_23_0150 := by
  native_decide

/-- Coefficient term 151 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0151 : Poly :=
[
  term ((425478577289470 : Rat) / 1162780221153193) [(8, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 151 for generator 23. -/
def ep_Q2_024_partial_23_0151 : Poly :=
[
  term ((850957154578940 : Rat) / 1162780221153193) [(8, 1), (9, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((850957154578940 : Rat) / 1162780221153193) [(8, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-425478577289470 : Rat) / 1162780221153193) [(8, 1), (9, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-425478577289470 : Rat) / 1162780221153193) [(8, 1), (9, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 151 for generator 23. -/
theorem ep_Q2_024_partial_23_0151_valid :
    mulPoly ep_Q2_024_coefficient_23_0151
        ep_Q2_024_generator_23_0100_0199 =
      ep_Q2_024_partial_23_0151 := by
  native_decide

/-- Coefficient term 152 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0152 : Poly :=
[
  term ((-10347266473503896845092264681791793988 : Rat) / 119970945740247729656669352802953926799) [(8, 1), (9, 1), (13, 1)]
]

/-- Partial product 152 for generator 23. -/
def ep_Q2_024_partial_23_0152 : Poly :=
[
  term ((-20694532947007793690184529363583587976 : Rat) / 119970945740247729656669352802953926799) [(8, 1), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((-20694532947007793690184529363583587976 : Rat) / 119970945740247729656669352802953926799) [(8, 1), (9, 1), (11, 1), (13, 2)],
  term ((10347266473503896845092264681791793988 : Rat) / 119970945740247729656669352802953926799) [(8, 1), (9, 1), (12, 2), (13, 1)],
  term ((10347266473503896845092264681791793988 : Rat) / 119970945740247729656669352802953926799) [(8, 1), (9, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 152 for generator 23. -/
theorem ep_Q2_024_partial_23_0152_valid :
    mulPoly ep_Q2_024_coefficient_23_0152
        ep_Q2_024_generator_23_0100_0199 =
      ep_Q2_024_partial_23_0152 := by
  native_decide

/-- Coefficient term 153 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0153 : Poly :=
[
  term ((-54925684334525674385194901172966691552873949315078298611 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(8, 1), (9, 1), (15, 1)]
]

/-- Partial product 153 for generator 23. -/
def ep_Q2_024_partial_23_0153 : Poly :=
[
  term ((-54925684334525674385194901172966691552873949315078298611 : Rat) / 697499214099014863878580073127199423100509817435596035) [(8, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-54925684334525674385194901172966691552873949315078298611 : Rat) / 697499214099014863878580073127199423100509817435596035) [(8, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((54925684334525674385194901172966691552873949315078298611 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(8, 1), (9, 1), (12, 2), (15, 1)],
  term ((54925684334525674385194901172966691552873949315078298611 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(8, 1), (9, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 153 for generator 23. -/
theorem ep_Q2_024_partial_23_0153_valid :
    mulPoly ep_Q2_024_coefficient_23_0153
        ep_Q2_024_generator_23_0100_0199 =
      ep_Q2_024_partial_23_0153 := by
  native_decide

/-- Coefficient term 154 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0154 : Poly :=
[
  term ((7376124887567038 : Rat) / 1162780221153193) [(8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 154 for generator 23. -/
def ep_Q2_024_partial_23_0154 : Poly :=
[
  term ((14752249775134076 : Rat) / 1162780221153193) [(8, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((14752249775134076 : Rat) / 1162780221153193) [(8, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-7376124887567038 : Rat) / 1162780221153193) [(8, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-7376124887567038 : Rat) / 1162780221153193) [(8, 1), (9, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 154 for generator 23. -/
theorem ep_Q2_024_partial_23_0154_valid :
    mulPoly ep_Q2_024_coefficient_23_0154
        ep_Q2_024_generator_23_0100_0199 =
      ep_Q2_024_partial_23_0154 := by
  native_decide

/-- Coefficient term 155 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0155 : Poly :=
[
  term ((507785954516628437676570004424297476556 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (9, 2)]
]

/-- Partial product 155 for generator 23. -/
def ep_Q2_024_partial_23_0155 : Poly :=
[
  term ((1015571909033256875353140008848594953112 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (9, 2), (10, 1), (12, 1)],
  term ((1015571909033256875353140008848594953112 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (9, 2), (11, 1), (13, 1)],
  term ((-507785954516628437676570004424297476556 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (9, 2), (12, 2)],
  term ((-507785954516628437676570004424297476556 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (9, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 155 for generator 23. -/
theorem ep_Q2_024_partial_23_0155_valid :
    mulPoly ep_Q2_024_coefficient_23_0155
        ep_Q2_024_generator_23_0100_0199 =
      ep_Q2_024_partial_23_0155 := by
  native_decide

/-- Coefficient term 156 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0156 : Poly :=
[
  term ((-37522401739805311039422138626734527732 : Rat) / 199951576233746216094448921338256544665) [(8, 1), (11, 1), (12, 1), (13, 1)]
]

/-- Partial product 156 for generator 23. -/
def ep_Q2_024_partial_23_0156 : Poly :=
[
  term ((-75044803479610622078844277253469055464 : Rat) / 199951576233746216094448921338256544665) [(8, 1), (10, 1), (11, 1), (12, 2), (13, 1)],
  term ((37522401739805311039422138626734527732 : Rat) / 199951576233746216094448921338256544665) [(8, 1), (11, 1), (12, 1), (13, 3)],
  term ((37522401739805311039422138626734527732 : Rat) / 199951576233746216094448921338256544665) [(8, 1), (11, 1), (12, 3), (13, 1)],
  term ((-75044803479610622078844277253469055464 : Rat) / 199951576233746216094448921338256544665) [(8, 1), (11, 2), (12, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 156 for generator 23. -/
theorem ep_Q2_024_partial_23_0156_valid :
    mulPoly ep_Q2_024_coefficient_23_0156
        ep_Q2_024_generator_23_0100_0199 =
      ep_Q2_024_partial_23_0156 := by
  native_decide

/-- Coefficient term 157 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0157 : Poly :=
[
  term ((4189554939777403259041079172137271511321467357690977803 : Rat) / 929998952132019818504773430836265897467346423247461380) [(8, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 157 for generator 23. -/
def ep_Q2_024_partial_23_0157 : Poly :=
[
  term ((4189554939777403259041079172137271511321467357690977803 : Rat) / 464999476066009909252386715418132948733673211623730690) [(8, 1), (10, 1), (11, 1), (12, 2), (15, 1)],
  term ((-4189554939777403259041079172137271511321467357690977803 : Rat) / 929998952132019818504773430836265897467346423247461380) [(8, 1), (11, 1), (12, 1), (13, 2), (15, 1)],
  term ((-4189554939777403259041079172137271511321467357690977803 : Rat) / 929998952132019818504773430836265897467346423247461380) [(8, 1), (11, 1), (12, 3), (15, 1)],
  term ((4189554939777403259041079172137271511321467357690977803 : Rat) / 464999476066009909252386715418132948733673211623730690) [(8, 1), (11, 2), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 157 for generator 23. -/
theorem ep_Q2_024_partial_23_0157_valid :
    mulPoly ep_Q2_024_coefficient_23_0157
        ep_Q2_024_generator_23_0100_0199 =
      ep_Q2_024_partial_23_0157 := by
  native_decide

/-- Coefficient term 158 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0158 : Poly :=
[
  term ((-1081662649697379 : Rat) / 1162780221153193) [(8, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 158 for generator 23. -/
def ep_Q2_024_partial_23_0158 : Poly :=
[
  term ((-2163325299394758 : Rat) / 1162780221153193) [(8, 1), (10, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((1081662649697379 : Rat) / 1162780221153193) [(8, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((1081662649697379 : Rat) / 1162780221153193) [(8, 1), (11, 1), (12, 3), (15, 1), (16, 1)],
  term ((-2163325299394758 : Rat) / 1162780221153193) [(8, 1), (11, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 158 for generator 23. -/
theorem ep_Q2_024_partial_23_0158_valid :
    mulPoly ep_Q2_024_coefficient_23_0158
        ep_Q2_024_generator_23_0100_0199 =
      ep_Q2_024_partial_23_0158 := by
  native_decide

/-- Coefficient term 159 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0159 : Poly :=
[
  term ((-268960383009799888998053315503991709830 : Rat) / 119970945740247729656669352802953926799) [(8, 1), (11, 1), (13, 1)]
]

/-- Partial product 159 for generator 23. -/
def ep_Q2_024_partial_23_0159 : Poly :=
[
  term ((-537920766019599777996106631007983419660 : Rat) / 119970945740247729656669352802953926799) [(8, 1), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((268960383009799888998053315503991709830 : Rat) / 119970945740247729656669352802953926799) [(8, 1), (11, 1), (12, 2), (13, 1)],
  term ((268960383009799888998053315503991709830 : Rat) / 119970945740247729656669352802953926799) [(8, 1), (11, 1), (13, 3)],
  term ((-537920766019599777996106631007983419660 : Rat) / 119970945740247729656669352802953926799) [(8, 1), (11, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 159 for generator 23. -/
theorem ep_Q2_024_partial_23_0159_valid :
    mulPoly ep_Q2_024_coefficient_23_0159
        ep_Q2_024_generator_23_0100_0199 =
      ep_Q2_024_partial_23_0159 := by
  native_decide

/-- Coefficient term 160 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0160 : Poly :=
[
  term ((-93287772980208889667188405400887339674285091873046133733 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(8, 1), (11, 1), (15, 1)]
]

/-- Partial product 160 for generator 23. -/
def ep_Q2_024_partial_23_0160 : Poly :=
[
  term ((-93287772980208889667188405400887339674285091873046133733 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(8, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((93287772980208889667188405400887339674285091873046133733 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(8, 1), (11, 1), (12, 2), (15, 1)],
  term ((93287772980208889667188405400887339674285091873046133733 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(8, 1), (11, 1), (13, 2), (15, 1)],
  term ((-93287772980208889667188405400887339674285091873046133733 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(8, 1), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 160 for generator 23. -/
theorem ep_Q2_024_partial_23_0160_valid :
    mulPoly ep_Q2_024_coefficient_23_0160
        ep_Q2_024_generator_23_0100_0199 =
      ep_Q2_024_partial_23_0160 := by
  native_decide

/-- Coefficient term 161 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0161 : Poly :=
[
  term ((-4815941933934353 : Rat) / 4651120884612772) [(8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 161 for generator 23. -/
def ep_Q2_024_partial_23_0161 : Poly :=
[
  term ((-4815941933934353 : Rat) / 2325560442306386) [(8, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((4815941933934353 : Rat) / 4651120884612772) [(8, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((4815941933934353 : Rat) / 4651120884612772) [(8, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-4815941933934353 : Rat) / 2325560442306386) [(8, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 161 for generator 23. -/
theorem ep_Q2_024_partial_23_0161_valid :
    mulPoly ep_Q2_024_coefficient_23_0161
        ep_Q2_024_generator_23_0100_0199 =
      ep_Q2_024_partial_23_0161 := by
  native_decide

/-- Coefficient term 162 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0162 : Poly :=
[
  term ((-177185337931838149406074150707289692132570132462235395 : Rat) / 46499947606600990925238671541813294873367321162373069) [(8, 1), (13, 1), (15, 1)]
]

/-- Partial product 162 for generator 23. -/
def ep_Q2_024_partial_23_0162 : Poly :=
[
  term ((-354370675863676298812148301414579384265140264924470790 : Rat) / 46499947606600990925238671541813294873367321162373069) [(8, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-354370675863676298812148301414579384265140264924470790 : Rat) / 46499947606600990925238671541813294873367321162373069) [(8, 1), (11, 1), (13, 2), (15, 1)],
  term ((177185337931838149406074150707289692132570132462235395 : Rat) / 46499947606600990925238671541813294873367321162373069) [(8, 1), (12, 2), (13, 1), (15, 1)],
  term ((177185337931838149406074150707289692132570132462235395 : Rat) / 46499947606600990925238671541813294873367321162373069) [(8, 1), (13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 162 for generator 23. -/
theorem ep_Q2_024_partial_23_0162_valid :
    mulPoly ep_Q2_024_coefficient_23_0162
        ep_Q2_024_generator_23_0100_0199 =
      ep_Q2_024_partial_23_0162 := by
  native_decide

/-- Coefficient term 163 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0163 : Poly :=
[
  term ((37665296397180 : Rat) / 1162780221153193) [(8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 163 for generator 23. -/
def ep_Q2_024_partial_23_0163 : Poly :=
[
  term ((75330592794360 : Rat) / 1162780221153193) [(8, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((75330592794360 : Rat) / 1162780221153193) [(8, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-37665296397180 : Rat) / 1162780221153193) [(8, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-37665296397180 : Rat) / 1162780221153193) [(8, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 163 for generator 23. -/
theorem ep_Q2_024_partial_23_0163_valid :
    mulPoly ep_Q2_024_coefficient_23_0163
        ep_Q2_024_generator_23_0100_0199 =
      ep_Q2_024_partial_23_0163 := by
  native_decide

/-- Coefficient term 164 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0164 : Poly :=
[
  term ((20236464028016908558024560015619523336 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (13, 2)]
]

/-- Partial product 164 for generator 23. -/
def ep_Q2_024_partial_23_0164 : Poly :=
[
  term ((40472928056033817116049120031239046672 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (10, 1), (12, 1), (13, 2)],
  term ((40472928056033817116049120031239046672 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (11, 1), (13, 3)],
  term ((-20236464028016908558024560015619523336 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (12, 2), (13, 2)],
  term ((-20236464028016908558024560015619523336 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (13, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 164 for generator 23. -/
theorem ep_Q2_024_partial_23_0164_valid :
    mulPoly ep_Q2_024_coefficient_23_0164
        ep_Q2_024_generator_23_0100_0199 =
      ep_Q2_024_partial_23_0164 := by
  native_decide

/-- Coefficient term 165 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0165 : Poly :=
[
  term ((4460575763931020940779677802964195788 : Rat) / 199951576233746216094448921338256544665) [(8, 1), (14, 1)]
]

/-- Partial product 165 for generator 23. -/
def ep_Q2_024_partial_23_0165 : Poly :=
[
  term ((8921151527862041881559355605928391576 : Rat) / 199951576233746216094448921338256544665) [(8, 1), (10, 1), (12, 1), (14, 1)],
  term ((8921151527862041881559355605928391576 : Rat) / 199951576233746216094448921338256544665) [(8, 1), (11, 1), (13, 1), (14, 1)],
  term ((-4460575763931020940779677802964195788 : Rat) / 199951576233746216094448921338256544665) [(8, 1), (12, 2), (14, 1)],
  term ((-4460575763931020940779677802964195788 : Rat) / 199951576233746216094448921338256544665) [(8, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 165 for generator 23. -/
theorem ep_Q2_024_partial_23_0165_valid :
    mulPoly ep_Q2_024_coefficient_23_0165
        ep_Q2_024_generator_23_0100_0199 =
      ep_Q2_024_partial_23_0165 := by
  native_decide

/-- Coefficient term 166 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0166 : Poly :=
[
  term ((306849677609162941141519942935896119863282963199083215917 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(8, 1), (15, 2)]
]

/-- Partial product 166 for generator 23. -/
def ep_Q2_024_partial_23_0166 : Poly :=
[
  term ((306849677609162941141519942935896119863282963199083215917 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(8, 1), (10, 1), (12, 1), (15, 2)],
  term ((306849677609162941141519942935896119863282963199083215917 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(8, 1), (11, 1), (13, 1), (15, 2)],
  term ((-306849677609162941141519942935896119863282963199083215917 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(8, 1), (12, 2), (15, 2)],
  term ((-306849677609162941141519942935896119863282963199083215917 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(8, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 166 for generator 23. -/
theorem ep_Q2_024_partial_23_0166_valid :
    mulPoly ep_Q2_024_coefficient_23_0166
        ep_Q2_024_generator_23_0100_0199 =
      ep_Q2_024_partial_23_0166 := by
  native_decide

/-- Coefficient term 167 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0167 : Poly :=
[
  term ((-12880146370366127 : Rat) / 4651120884612772) [(8, 1), (15, 2), (16, 1)]
]

/-- Partial product 167 for generator 23. -/
def ep_Q2_024_partial_23_0167 : Poly :=
[
  term ((-12880146370366127 : Rat) / 2325560442306386) [(8, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-12880146370366127 : Rat) / 2325560442306386) [(8, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((12880146370366127 : Rat) / 4651120884612772) [(8, 1), (12, 2), (15, 2), (16, 1)],
  term ((12880146370366127 : Rat) / 4651120884612772) [(8, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 167 for generator 23. -/
theorem ep_Q2_024_partial_23_0167_valid :
    mulPoly ep_Q2_024_coefficient_23_0167
        ep_Q2_024_generator_23_0100_0199 =
      ep_Q2_024_partial_23_0167 := by
  native_decide

/-- Coefficient term 168 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0168 : Poly :=
[
  term ((-2162710809249107709696910021948465857902 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (11, 1)]
]

/-- Partial product 168 for generator 23. -/
def ep_Q2_024_partial_23_0168 : Poly :=
[
  term ((-4325421618498215419393820043896931715804 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (10, 1), (11, 1), (12, 1)],
  term ((2162710809249107709696910021948465857902 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (11, 1), (12, 2)],
  term ((2162710809249107709696910021948465857902 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (11, 1), (13, 2)],
  term ((-4325421618498215419393820043896931715804 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 168 for generator 23. -/
theorem ep_Q2_024_partial_23_0168_valid :
    mulPoly ep_Q2_024_coefficient_23_0168
        ep_Q2_024_generator_23_0100_0199 =
      ep_Q2_024_partial_23_0168 := by
  native_decide

/-- Coefficient term 169 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0169 : Poly :=
[
  term ((-28480226649915404613451229443364578284 : Rat) / 199951576233746216094448921338256544665) [(9, 1), (11, 1), (12, 1)]
]

/-- Partial product 169 for generator 23. -/
def ep_Q2_024_partial_23_0169 : Poly :=
[
  term ((-56960453299830809226902458886729156568 : Rat) / 199951576233746216094448921338256544665) [(9, 1), (10, 1), (11, 1), (12, 2)],
  term ((28480226649915404613451229443364578284 : Rat) / 199951576233746216094448921338256544665) [(9, 1), (11, 1), (12, 1), (13, 2)],
  term ((28480226649915404613451229443364578284 : Rat) / 199951576233746216094448921338256544665) [(9, 1), (11, 1), (12, 3)],
  term ((-56960453299830809226902458886729156568 : Rat) / 199951576233746216094448921338256544665) [(9, 1), (11, 2), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 169 for generator 23. -/
theorem ep_Q2_024_partial_23_0169_valid :
    mulPoly ep_Q2_024_coefficient_23_0169
        ep_Q2_024_generator_23_0100_0199 =
      ep_Q2_024_partial_23_0169 := by
  native_decide

/-- Coefficient term 170 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0170 : Poly :=
[
  term ((-5546103577164003709519065548508593986367472517022776538 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 170 for generator 23. -/
def ep_Q2_024_partial_23_0170 : Poly :=
[
  term ((-11092207154328007419038131097017187972734945034045553076 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 1), (10, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((5546103577164003709519065548508593986367472517022776538 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 1), (11, 1), (12, 2), (13, 1), (15, 1)],
  term ((5546103577164003709519065548508593986367472517022776538 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 1), (11, 1), (13, 3), (15, 1)],
  term ((-11092207154328007419038131097017187972734945034045553076 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 1), (11, 2), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 170 for generator 23. -/
theorem ep_Q2_024_partial_23_0170_valid :
    mulPoly ep_Q2_024_coefficient_23_0170
        ep_Q2_024_generator_23_0100_0199 =
      ep_Q2_024_partial_23_0170 := by
  native_decide

/-- Coefficient term 171 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0171 : Poly :=
[
  term ((75330592794360 : Rat) / 1162780221153193) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 171 for generator 23. -/
def ep_Q2_024_partial_23_0171 : Poly :=
[
  term ((150661185588720 : Rat) / 1162780221153193) [(9, 1), (10, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-75330592794360 : Rat) / 1162780221153193) [(9, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-75330592794360 : Rat) / 1162780221153193) [(9, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((150661185588720 : Rat) / 1162780221153193) [(9, 1), (11, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 171 for generator 23. -/
theorem ep_Q2_024_partial_23_0171_valid :
    mulPoly ep_Q2_024_coefficient_23_0171
        ep_Q2_024_generator_23_0100_0199 =
      ep_Q2_024_partial_23_0171 := by
  native_decide

/-- Coefficient term 172 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0172 : Poly :=
[
  term ((40472928056033817116049120031239046672 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (11, 1), (13, 2)]
]

/-- Partial product 172 for generator 23. -/
def ep_Q2_024_partial_23_0172 : Poly :=
[
  term ((80945856112067634232098240062478093344 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (10, 1), (11, 1), (12, 1), (13, 2)],
  term ((-40472928056033817116049120031239046672 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (11, 1), (12, 2), (13, 2)],
  term ((-40472928056033817116049120031239046672 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (11, 1), (13, 4)],
  term ((80945856112067634232098240062478093344 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (11, 2), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 172 for generator 23. -/
theorem ep_Q2_024_partial_23_0172_valid :
    mulPoly ep_Q2_024_coefficient_23_0172
        ep_Q2_024_generator_23_0100_0199 =
      ep_Q2_024_partial_23_0172 := by
  native_decide

/-- Coefficient term 173 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0173 : Poly :=
[
  term ((8921151527862041881559355605928391576 : Rat) / 199951576233746216094448921338256544665) [(9, 1), (11, 1), (14, 1)]
]

/-- Partial product 173 for generator 23. -/
def ep_Q2_024_partial_23_0173 : Poly :=
[
  term ((17842303055724083763118711211856783152 : Rat) / 199951576233746216094448921338256544665) [(9, 1), (10, 1), (11, 1), (12, 1), (14, 1)],
  term ((-8921151527862041881559355605928391576 : Rat) / 199951576233746216094448921338256544665) [(9, 1), (11, 1), (12, 2), (14, 1)],
  term ((-8921151527862041881559355605928391576 : Rat) / 199951576233746216094448921338256544665) [(9, 1), (11, 1), (13, 2), (14, 1)],
  term ((17842303055724083763118711211856783152 : Rat) / 199951576233746216094448921338256544665) [(9, 1), (11, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 173 for generator 23. -/
theorem ep_Q2_024_partial_23_0173_valid :
    mulPoly ep_Q2_024_coefficient_23_0173
        ep_Q2_024_generator_23_0100_0199 =
      ep_Q2_024_partial_23_0173 := by
  native_decide

/-- Coefficient term 174 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0174 : Poly :=
[
  term ((31914642418468897160042061022834858140022559670850052665 : Rat) / 1115998742558423782205728117003519076960815707896953656) [(9, 1), (11, 1), (15, 2)]
]

/-- Partial product 174 for generator 23. -/
def ep_Q2_024_partial_23_0174 : Poly :=
[
  term ((31914642418468897160042061022834858140022559670850052665 : Rat) / 557999371279211891102864058501759538480407853948476828) [(9, 1), (10, 1), (11, 1), (12, 1), (15, 2)],
  term ((-31914642418468897160042061022834858140022559670850052665 : Rat) / 1115998742558423782205728117003519076960815707896953656) [(9, 1), (11, 1), (12, 2), (15, 2)],
  term ((-31914642418468897160042061022834858140022559670850052665 : Rat) / 1115998742558423782205728117003519076960815707896953656) [(9, 1), (11, 1), (13, 2), (15, 2)],
  term ((31914642418468897160042061022834858140022559670850052665 : Rat) / 557999371279211891102864058501759538480407853948476828) [(9, 1), (11, 2), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 174 for generator 23. -/
theorem ep_Q2_024_partial_23_0174_valid :
    mulPoly ep_Q2_024_coefficient_23_0174
        ep_Q2_024_generator_23_0100_0199 =
      ep_Q2_024_partial_23_0174 := by
  native_decide

/-- Coefficient term 175 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0175 : Poly :=
[
  term ((-12213780129134847 : Rat) / 2325560442306386) [(9, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 175 for generator 23. -/
def ep_Q2_024_partial_23_0175 : Poly :=
[
  term ((-12213780129134847 : Rat) / 1162780221153193) [(9, 1), (10, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((12213780129134847 : Rat) / 2325560442306386) [(9, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((12213780129134847 : Rat) / 2325560442306386) [(9, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-12213780129134847 : Rat) / 1162780221153193) [(9, 1), (11, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 175 for generator 23. -/
theorem ep_Q2_024_partial_23_0175_valid :
    mulPoly ep_Q2_024_coefficient_23_0175
        ep_Q2_024_generator_23_0100_0199 =
      ep_Q2_024_partial_23_0175 := by
  native_decide

/-- Coefficient term 176 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0176 : Poly :=
[
  term ((94227648864374396515392027612290592682 : Rat) / 1799564186103715944850040292044308901985) [(9, 1), (12, 1), (13, 1)]
]

/-- Partial product 176 for generator 23. -/
def ep_Q2_024_partial_23_0176 : Poly :=
[
  term ((188455297728748793030784055224581185364 : Rat) / 1799564186103715944850040292044308901985) [(9, 1), (10, 1), (12, 2), (13, 1)],
  term ((188455297728748793030784055224581185364 : Rat) / 1799564186103715944850040292044308901985) [(9, 1), (11, 1), (12, 1), (13, 2)],
  term ((-94227648864374396515392027612290592682 : Rat) / 1799564186103715944850040292044308901985) [(9, 1), (12, 1), (13, 3)],
  term ((-94227648864374396515392027612290592682 : Rat) / 1799564186103715944850040292044308901985) [(9, 1), (12, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 176 for generator 23. -/
theorem ep_Q2_024_partial_23_0176_valid :
    mulPoly ep_Q2_024_coefficient_23_0176
        ep_Q2_024_generator_23_0100_0199 =
      ep_Q2_024_partial_23_0176 := by
  native_decide

/-- Coefficient term 177 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0177 : Poly :=
[
  term ((-929744700358931504225654635255748641054 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 177 for generator 23. -/
def ep_Q2_024_partial_23_0177 : Poly :=
[
  term ((-1859489400717863008451309270511497282108 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (10, 1), (12, 2), (13, 1), (14, 1)],
  term ((-1859489400717863008451309270511497282108 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (11, 1), (12, 1), (13, 2), (14, 1)],
  term ((929744700358931504225654635255748641054 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (12, 1), (13, 3), (14, 1)],
  term ((929744700358931504225654635255748641054 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (12, 3), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 177 for generator 23. -/
theorem ep_Q2_024_partial_23_0177_valid :
    mulPoly ep_Q2_024_coefficient_23_0177
        ep_Q2_024_generator_23_0100_0199 =
      ep_Q2_024_partial_23_0177 := by
  native_decide

/-- Coefficient term 178 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0178 : Poly :=
[
  term ((7263731563565507622614412820708822571625937066404132075 : Rat) / 371999580852807927401909372334506358986938569298984552) [(9, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 178 for generator 23. -/
def ep_Q2_024_partial_23_0178 : Poly :=
[
  term ((7263731563565507622614412820708822571625937066404132075 : Rat) / 185999790426403963700954686167253179493469284649492276) [(9, 1), (10, 1), (12, 2), (14, 1), (15, 1)],
  term ((7263731563565507622614412820708822571625937066404132075 : Rat) / 185999790426403963700954686167253179493469284649492276) [(9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-7263731563565507622614412820708822571625937066404132075 : Rat) / 371999580852807927401909372334506358986938569298984552) [(9, 1), (12, 1), (13, 2), (14, 1), (15, 1)],
  term ((-7263731563565507622614412820708822571625937066404132075 : Rat) / 371999580852807927401909372334506358986938569298984552) [(9, 1), (12, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 178 for generator 23. -/
theorem ep_Q2_024_partial_23_0178_valid :
    mulPoly ep_Q2_024_coefficient_23_0178
        ep_Q2_024_generator_23_0100_0199 =
      ep_Q2_024_partial_23_0178 := by
  native_decide

/-- Coefficient term 179 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0179 : Poly :=
[
  term ((-7650512415470575 : Rat) / 2325560442306386) [(9, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 179 for generator 23. -/
def ep_Q2_024_partial_23_0179 : Poly :=
[
  term ((-7650512415470575 : Rat) / 1162780221153193) [(9, 1), (10, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-7650512415470575 : Rat) / 1162780221153193) [(9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((7650512415470575 : Rat) / 2325560442306386) [(9, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((7650512415470575 : Rat) / 2325560442306386) [(9, 1), (12, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 179 for generator 23. -/
theorem ep_Q2_024_partial_23_0179_valid :
    mulPoly ep_Q2_024_coefficient_23_0179
        ep_Q2_024_generator_23_0100_0199 =
      ep_Q2_024_partial_23_0179 := by
  native_decide

/-- Coefficient term 180 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0180 : Poly :=
[
  term ((-709323818797893594593761837643243035840193531554982145883 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(9, 1), (12, 1), (15, 1)]
]

/-- Partial product 180 for generator 23. -/
def ep_Q2_024_partial_23_0180 : Poly :=
[
  term ((-709323818797893594593761837643243035840193531554982145883 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(9, 1), (10, 1), (12, 2), (15, 1)],
  term ((-709323818797893594593761837643243035840193531554982145883 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((709323818797893594593761837643243035840193531554982145883 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(9, 1), (12, 1), (13, 2), (15, 1)],
  term ((709323818797893594593761837643243035840193531554982145883 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(9, 1), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 180 for generator 23. -/
theorem ep_Q2_024_partial_23_0180_valid :
    mulPoly ep_Q2_024_coefficient_23_0180
        ep_Q2_024_generator_23_0100_0199 =
      ep_Q2_024_partial_23_0180 := by
  native_decide

/-- Coefficient term 181 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0181 : Poly :=
[
  term ((-41617713752934061 : Rat) / 13953362653838316) [(9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 181 for generator 23. -/
def ep_Q2_024_partial_23_0181 : Poly :=
[
  term ((-41617713752934061 : Rat) / 6976681326919158) [(9, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-41617713752934061 : Rat) / 6976681326919158) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((41617713752934061 : Rat) / 13953362653838316) [(9, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((41617713752934061 : Rat) / 13953362653838316) [(9, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 181 for generator 23. -/
theorem ep_Q2_024_partial_23_0181_valid :
    mulPoly ep_Q2_024_coefficient_23_0181
        ep_Q2_024_generator_23_0100_0199 =
      ep_Q2_024_partial_23_0181 := by
  native_decide

/-- Coefficient term 182 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0182 : Poly :=
[
  term ((-349799482188512142332992239684745264478 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (12, 2), (13, 1)]
]

/-- Partial product 182 for generator 23. -/
def ep_Q2_024_partial_23_0182 : Poly :=
[
  term ((-699598964377024284665984479369490528956 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (10, 1), (12, 3), (13, 1)],
  term ((-699598964377024284665984479369490528956 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (11, 1), (12, 2), (13, 2)],
  term ((349799482188512142332992239684745264478 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (12, 2), (13, 3)],
  term ((349799482188512142332992239684745264478 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (12, 4), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 182 for generator 23. -/
theorem ep_Q2_024_partial_23_0182_valid :
    mulPoly ep_Q2_024_coefficient_23_0182
        ep_Q2_024_generator_23_0100_0199 =
      ep_Q2_024_partial_23_0182 := by
  native_decide

/-- Coefficient term 183 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0183 : Poly :=
[
  term ((25139328452534028572442634900325055710038373424316626143 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(9, 1), (12, 2), (15, 1)]
]

/-- Partial product 183 for generator 23. -/
def ep_Q2_024_partial_23_0183 : Poly :=
[
  term ((25139328452534028572442634900325055710038373424316626143 : Rat) / 929998952132019818504773430836265897467346423247461380) [(9, 1), (10, 1), (12, 3), (15, 1)],
  term ((25139328452534028572442634900325055710038373424316626143 : Rat) / 929998952132019818504773430836265897467346423247461380) [(9, 1), (11, 1), (12, 2), (13, 1), (15, 1)],
  term ((-25139328452534028572442634900325055710038373424316626143 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(9, 1), (12, 2), (13, 2), (15, 1)],
  term ((-25139328452534028572442634900325055710038373424316626143 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(9, 1), (12, 4), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 183 for generator 23. -/
theorem ep_Q2_024_partial_23_0183_valid :
    mulPoly ep_Q2_024_coefficient_23_0183
        ep_Q2_024_generator_23_0100_0199 =
      ep_Q2_024_partial_23_0183 := by
  native_decide

/-- Coefficient term 184 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0184 : Poly :=
[
  term ((-4569079916135479 : Rat) / 2325560442306386) [(9, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 184 for generator 23. -/
def ep_Q2_024_partial_23_0184 : Poly :=
[
  term ((-4569079916135479 : Rat) / 1162780221153193) [(9, 1), (10, 1), (12, 3), (15, 1), (16, 1)],
  term ((-4569079916135479 : Rat) / 1162780221153193) [(9, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((4569079916135479 : Rat) / 2325560442306386) [(9, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((4569079916135479 : Rat) / 2325560442306386) [(9, 1), (12, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 184 for generator 23. -/
theorem ep_Q2_024_partial_23_0184_valid :
    mulPoly ep_Q2_024_coefficient_23_0184
        ep_Q2_024_generator_23_0100_0199 =
      ep_Q2_024_partial_23_0184 := by
  native_decide

/-- Coefficient term 185 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0185 : Poly :=
[
  term ((5746390132445502506002581648277378060469 : Rat) / 1799564186103715944850040292044308901985) [(9, 1), (13, 1)]
]

/-- Partial product 185 for generator 23. -/
def ep_Q2_024_partial_23_0185 : Poly :=
[
  term ((11492780264891005012005163296554756120938 : Rat) / 1799564186103715944850040292044308901985) [(9, 1), (10, 1), (12, 1), (13, 1)],
  term ((11492780264891005012005163296554756120938 : Rat) / 1799564186103715944850040292044308901985) [(9, 1), (11, 1), (13, 2)],
  term ((-5746390132445502506002581648277378060469 : Rat) / 1799564186103715944850040292044308901985) [(9, 1), (12, 2), (13, 1)],
  term ((-5746390132445502506002581648277378060469 : Rat) / 1799564186103715944850040292044308901985) [(9, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 185 for generator 23. -/
theorem ep_Q2_024_partial_23_0185_valid :
    mulPoly ep_Q2_024_coefficient_23_0185
        ep_Q2_024_generator_23_0100_0199 =
      ep_Q2_024_partial_23_0185 := by
  native_decide

/-- Coefficient term 186 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0186 : Poly :=
[
  term ((-1273564752141997878177319114529954515984 : Rat) / 359912837220743188970008058408861780397) [(9, 1), (13, 1), (14, 1)]
]

/-- Partial product 186 for generator 23. -/
def ep_Q2_024_partial_23_0186 : Poly :=
[
  term ((-2547129504283995756354638229059909031968 : Rat) / 359912837220743188970008058408861780397) [(9, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((-2547129504283995756354638229059909031968 : Rat) / 359912837220743188970008058408861780397) [(9, 1), (11, 1), (13, 2), (14, 1)],
  term ((1273564752141997878177319114529954515984 : Rat) / 359912837220743188970008058408861780397) [(9, 1), (12, 2), (13, 1), (14, 1)],
  term ((1273564752141997878177319114529954515984 : Rat) / 359912837220743188970008058408861780397) [(9, 1), (13, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 186 for generator 23. -/
theorem ep_Q2_024_partial_23_0186_valid :
    mulPoly ep_Q2_024_coefficient_23_0186
        ep_Q2_024_generator_23_0100_0199 =
      ep_Q2_024_partial_23_0186 := by
  native_decide

/-- Coefficient term 187 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0187 : Poly :=
[
  term ((28109396698700611222313761266380828656 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (13, 1), (14, 2)]
]

/-- Partial product 187 for generator 23. -/
def ep_Q2_024_partial_23_0187 : Poly :=
[
  term ((56218793397401222444627522532761657312 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (10, 1), (12, 1), (13, 1), (14, 2)],
  term ((56218793397401222444627522532761657312 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (11, 1), (13, 2), (14, 2)],
  term ((-28109396698700611222313761266380828656 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (12, 2), (13, 1), (14, 2)],
  term ((-28109396698700611222313761266380828656 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (13, 3), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 187 for generator 23. -/
theorem ep_Q2_024_partial_23_0187_valid :
    mulPoly ep_Q2_024_coefficient_23_0187
        ep_Q2_024_generator_23_0100_0199 =
      ep_Q2_024_partial_23_0187 := by
  native_decide

/-- Coefficient term 188 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0188 : Poly :=
[
  term ((-9923301900547485840918460892701746017973251184532248416 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 1), (13, 1), (15, 2)]
]

/-- Partial product 188 for generator 23. -/
def ep_Q2_024_partial_23_0188 : Poly :=
[
  term ((-19846603801094971681836921785403492035946502369064496832 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 1), (10, 1), (12, 1), (13, 1), (15, 2)],
  term ((-19846603801094971681836921785403492035946502369064496832 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 1), (11, 1), (13, 2), (15, 2)],
  term ((9923301900547485840918460892701746017973251184532248416 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 1), (12, 2), (13, 1), (15, 2)],
  term ((9923301900547485840918460892701746017973251184532248416 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 1), (13, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 188 for generator 23. -/
theorem ep_Q2_024_partial_23_0188_valid :
    mulPoly ep_Q2_024_coefficient_23_0188
        ep_Q2_024_generator_23_0100_0199 =
      ep_Q2_024_partial_23_0188 := by
  native_decide

/-- Coefficient term 189 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0189 : Poly :=
[
  term ((2498215589172928 : Rat) / 1162780221153193) [(9, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 189 for generator 23. -/
def ep_Q2_024_partial_23_0189 : Poly :=
[
  term ((4996431178345856 : Rat) / 1162780221153193) [(9, 1), (10, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((4996431178345856 : Rat) / 1162780221153193) [(9, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-2498215589172928 : Rat) / 1162780221153193) [(9, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-2498215589172928 : Rat) / 1162780221153193) [(9, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 189 for generator 23. -/
theorem ep_Q2_024_partial_23_0189_valid :
    mulPoly ep_Q2_024_coefficient_23_0189
        ep_Q2_024_generator_23_0100_0199 =
      ep_Q2_024_partial_23_0189 := by
  native_decide

/-- Coefficient term 190 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0190 : Poly :=
[
  term ((-103950836548178351367830748123952060736 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (13, 2), (15, 1)]
]

/-- Partial product 190 for generator 23. -/
def ep_Q2_024_partial_23_0190 : Poly :=
[
  term ((-207901673096356702735661496247904121472 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (10, 1), (12, 1), (13, 2), (15, 1)],
  term ((-207901673096356702735661496247904121472 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (11, 1), (13, 3), (15, 1)],
  term ((103950836548178351367830748123952060736 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (12, 2), (13, 2), (15, 1)],
  term ((103950836548178351367830748123952060736 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (13, 4), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 190 for generator 23. -/
theorem ep_Q2_024_partial_23_0190_valid :
    mulPoly ep_Q2_024_coefficient_23_0190
        ep_Q2_024_generator_23_0100_0199 =
      ep_Q2_024_partial_23_0190 := by
  native_decide

/-- Coefficient term 191 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0191 : Poly :=
[
  term ((-125109722716038263779515583490660891561614725169745090549 : Rat) / 3719995808528079274019093723345063589869385692989845520) [(9, 1), (14, 1), (15, 1)]
]

/-- Partial product 191 for generator 23. -/
def ep_Q2_024_partial_23_0191 : Poly :=
[
  term ((-125109722716038263779515583490660891561614725169745090549 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(9, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-125109722716038263779515583490660891561614725169745090549 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((125109722716038263779515583490660891561614725169745090549 : Rat) / 3719995808528079274019093723345063589869385692989845520) [(9, 1), (12, 2), (14, 1), (15, 1)],
  term ((125109722716038263779515583490660891561614725169745090549 : Rat) / 3719995808528079274019093723345063589869385692989845520) [(9, 1), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 191 for generator 23. -/
theorem ep_Q2_024_partial_23_0191_valid :
    mulPoly ep_Q2_024_coefficient_23_0191
        ep_Q2_024_generator_23_0100_0199 =
      ep_Q2_024_partial_23_0191 := by
  native_decide

/-- Coefficient term 192 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0192 : Poly :=
[
  term ((-83635389120201241 : Rat) / 13953362653838316) [(9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 192 for generator 23. -/
def ep_Q2_024_partial_23_0192 : Poly :=
[
  term ((-83635389120201241 : Rat) / 6976681326919158) [(9, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-83635389120201241 : Rat) / 6976681326919158) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((83635389120201241 : Rat) / 13953362653838316) [(9, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((83635389120201241 : Rat) / 13953362653838316) [(9, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 192 for generator 23. -/
theorem ep_Q2_024_partial_23_0192_valid :
    mulPoly ep_Q2_024_coefficient_23_0192
        ep_Q2_024_generator_23_0100_0199 =
      ep_Q2_024_partial_23_0192 := by
  native_decide

/-- Coefficient term 193 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0193 : Poly :=
[
  term ((3331450636050522612403601099165756994757909539495449447 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 1), (14, 2), (15, 1)]
]

/-- Partial product 193 for generator 23. -/
def ep_Q2_024_partial_23_0193 : Poly :=
[
  term ((6662901272101045224807202198331513989515819078990898894 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 1), (10, 1), (12, 1), (14, 2), (15, 1)],
  term ((6662901272101045224807202198331513989515819078990898894 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((-3331450636050522612403601099165756994757909539495449447 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 1), (12, 2), (14, 2), (15, 1)],
  term ((-3331450636050522612403601099165756994757909539495449447 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 1), (13, 2), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 193 for generator 23. -/
theorem ep_Q2_024_partial_23_0193_valid :
    mulPoly ep_Q2_024_coefficient_23_0193
        ep_Q2_024_generator_23_0100_0199 =
      ep_Q2_024_partial_23_0193 := by
  native_decide

/-- Coefficient term 194 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0194 : Poly :=
[
  term ((-207570026772756 : Rat) / 1162780221153193) [(9, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 194 for generator 23. -/
def ep_Q2_024_partial_23_0194 : Poly :=
[
  term ((-415140053545512 : Rat) / 1162780221153193) [(9, 1), (10, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-415140053545512 : Rat) / 1162780221153193) [(9, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((207570026772756 : Rat) / 1162780221153193) [(9, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((207570026772756 : Rat) / 1162780221153193) [(9, 1), (13, 2), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 194 for generator 23. -/
theorem ep_Q2_024_partial_23_0194_valid :
    mulPoly ep_Q2_024_coefficient_23_0194
        ep_Q2_024_generator_23_0100_0199 =
      ep_Q2_024_partial_23_0194 := by
  native_decide

/-- Coefficient term 195 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0195 : Poly :=
[
  term ((76119288641052222185073485225852923838335133327637973191 : Rat) / 1487998323411231709607637489338025435947754277195938208) [(9, 1), (15, 1)]
]

/-- Partial product 195 for generator 23. -/
def ep_Q2_024_partial_23_0195 : Poly :=
[
  term ((76119288641052222185073485225852923838335133327637973191 : Rat) / 743999161705615854803818744669012717973877138597969104) [(9, 1), (10, 1), (12, 1), (15, 1)],
  term ((76119288641052222185073485225852923838335133327637973191 : Rat) / 743999161705615854803818744669012717973877138597969104) [(9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-76119288641052222185073485225852923838335133327637973191 : Rat) / 1487998323411231709607637489338025435947754277195938208) [(9, 1), (12, 2), (15, 1)],
  term ((-76119288641052222185073485225852923838335133327637973191 : Rat) / 1487998323411231709607637489338025435947754277195938208) [(9, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 195 for generator 23. -/
theorem ep_Q2_024_partial_23_0195_valid :
    mulPoly ep_Q2_024_coefficient_23_0195
        ep_Q2_024_generator_23_0100_0199 =
      ep_Q2_024_partial_23_0195 := by
  native_decide

/-- Coefficient term 196 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0196 : Poly :=
[
  term ((120480583543931879 : Rat) / 27906725307676632) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 196 for generator 23. -/
def ep_Q2_024_partial_23_0196 : Poly :=
[
  term ((120480583543931879 : Rat) / 13953362653838316) [(9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((120480583543931879 : Rat) / 13953362653838316) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-120480583543931879 : Rat) / 27906725307676632) [(9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-120480583543931879 : Rat) / 27906725307676632) [(9, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 196 for generator 23. -/
theorem ep_Q2_024_partial_23_0196_valid :
    mulPoly ep_Q2_024_coefficient_23_0196
        ep_Q2_024_generator_23_0100_0199 =
      ep_Q2_024_partial_23_0196 := by
  native_decide

/-- Coefficient term 197 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0197 : Poly :=
[
  term ((2488379973681280850295504409161390030016648051801582732 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 1), (15, 3)]
]

/-- Partial product 197 for generator 23. -/
def ep_Q2_024_partial_23_0197 : Poly :=
[
  term ((4976759947362561700591008818322780060033296103603165464 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 1), (10, 1), (12, 1), (15, 3)],
  term ((4976759947362561700591008818322780060033296103603165464 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 1), (11, 1), (13, 1), (15, 3)],
  term ((-2488379973681280850295504409161390030016648051801582732 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 1), (12, 2), (15, 3)],
  term ((-2488379973681280850295504409161390030016648051801582732 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 1), (13, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 197 for generator 23. -/
theorem ep_Q2_024_partial_23_0197_valid :
    mulPoly ep_Q2_024_coefficient_23_0197
        ep_Q2_024_generator_23_0100_0199 =
      ep_Q2_024_partial_23_0197 := by
  native_decide

/-- Coefficient term 198 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0198 : Poly :=
[
  term ((-624553897293232 : Rat) / 1162780221153193) [(9, 1), (15, 3), (16, 1)]
]

/-- Partial product 198 for generator 23. -/
def ep_Q2_024_partial_23_0198 : Poly :=
[
  term ((-1249107794586464 : Rat) / 1162780221153193) [(9, 1), (10, 1), (12, 1), (15, 3), (16, 1)],
  term ((-1249107794586464 : Rat) / 1162780221153193) [(9, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((624553897293232 : Rat) / 1162780221153193) [(9, 1), (12, 2), (15, 3), (16, 1)],
  term ((624553897293232 : Rat) / 1162780221153193) [(9, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 198 for generator 23. -/
theorem ep_Q2_024_partial_23_0198_valid :
    mulPoly ep_Q2_024_coefficient_23_0198
        ep_Q2_024_generator_23_0100_0199 =
      ep_Q2_024_partial_23_0198 := by
  native_decide

/-- Coefficient term 199 from coefficient polynomial 23. -/
def ep_Q2_024_coefficient_23_0199 : Poly :=
[
  term ((2791330681261295623207173738354068538581 : Rat) / 599854728701238648283346764014769633995) [(9, 2)]
]

/-- Partial product 199 for generator 23. -/
def ep_Q2_024_partial_23_0199 : Poly :=
[
  term ((5582661362522591246414347476708137077162 : Rat) / 599854728701238648283346764014769633995) [(9, 2), (10, 1), (12, 1)],
  term ((5582661362522591246414347476708137077162 : Rat) / 599854728701238648283346764014769633995) [(9, 2), (11, 1), (13, 1)],
  term ((-2791330681261295623207173738354068538581 : Rat) / 599854728701238648283346764014769633995) [(9, 2), (12, 2)],
  term ((-2791330681261295623207173738354068538581 : Rat) / 599854728701238648283346764014769633995) [(9, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 199 for generator 23. -/
theorem ep_Q2_024_partial_23_0199_valid :
    mulPoly ep_Q2_024_coefficient_23_0199
        ep_Q2_024_generator_23_0100_0199 =
      ep_Q2_024_partial_23_0199 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_024_partials_23_0100_0199 : List Poly :=
[
  ep_Q2_024_partial_23_0100,
  ep_Q2_024_partial_23_0101,
  ep_Q2_024_partial_23_0102,
  ep_Q2_024_partial_23_0103,
  ep_Q2_024_partial_23_0104,
  ep_Q2_024_partial_23_0105,
  ep_Q2_024_partial_23_0106,
  ep_Q2_024_partial_23_0107,
  ep_Q2_024_partial_23_0108,
  ep_Q2_024_partial_23_0109,
  ep_Q2_024_partial_23_0110,
  ep_Q2_024_partial_23_0111,
  ep_Q2_024_partial_23_0112,
  ep_Q2_024_partial_23_0113,
  ep_Q2_024_partial_23_0114,
  ep_Q2_024_partial_23_0115,
  ep_Q2_024_partial_23_0116,
  ep_Q2_024_partial_23_0117,
  ep_Q2_024_partial_23_0118,
  ep_Q2_024_partial_23_0119,
  ep_Q2_024_partial_23_0120,
  ep_Q2_024_partial_23_0121,
  ep_Q2_024_partial_23_0122,
  ep_Q2_024_partial_23_0123,
  ep_Q2_024_partial_23_0124,
  ep_Q2_024_partial_23_0125,
  ep_Q2_024_partial_23_0126,
  ep_Q2_024_partial_23_0127,
  ep_Q2_024_partial_23_0128,
  ep_Q2_024_partial_23_0129,
  ep_Q2_024_partial_23_0130,
  ep_Q2_024_partial_23_0131,
  ep_Q2_024_partial_23_0132,
  ep_Q2_024_partial_23_0133,
  ep_Q2_024_partial_23_0134,
  ep_Q2_024_partial_23_0135,
  ep_Q2_024_partial_23_0136,
  ep_Q2_024_partial_23_0137,
  ep_Q2_024_partial_23_0138,
  ep_Q2_024_partial_23_0139,
  ep_Q2_024_partial_23_0140,
  ep_Q2_024_partial_23_0141,
  ep_Q2_024_partial_23_0142,
  ep_Q2_024_partial_23_0143,
  ep_Q2_024_partial_23_0144,
  ep_Q2_024_partial_23_0145,
  ep_Q2_024_partial_23_0146,
  ep_Q2_024_partial_23_0147,
  ep_Q2_024_partial_23_0148,
  ep_Q2_024_partial_23_0149,
  ep_Q2_024_partial_23_0150,
  ep_Q2_024_partial_23_0151,
  ep_Q2_024_partial_23_0152,
  ep_Q2_024_partial_23_0153,
  ep_Q2_024_partial_23_0154,
  ep_Q2_024_partial_23_0155,
  ep_Q2_024_partial_23_0156,
  ep_Q2_024_partial_23_0157,
  ep_Q2_024_partial_23_0158,
  ep_Q2_024_partial_23_0159,
  ep_Q2_024_partial_23_0160,
  ep_Q2_024_partial_23_0161,
  ep_Q2_024_partial_23_0162,
  ep_Q2_024_partial_23_0163,
  ep_Q2_024_partial_23_0164,
  ep_Q2_024_partial_23_0165,
  ep_Q2_024_partial_23_0166,
  ep_Q2_024_partial_23_0167,
  ep_Q2_024_partial_23_0168,
  ep_Q2_024_partial_23_0169,
  ep_Q2_024_partial_23_0170,
  ep_Q2_024_partial_23_0171,
  ep_Q2_024_partial_23_0172,
  ep_Q2_024_partial_23_0173,
  ep_Q2_024_partial_23_0174,
  ep_Q2_024_partial_23_0175,
  ep_Q2_024_partial_23_0176,
  ep_Q2_024_partial_23_0177,
  ep_Q2_024_partial_23_0178,
  ep_Q2_024_partial_23_0179,
  ep_Q2_024_partial_23_0180,
  ep_Q2_024_partial_23_0181,
  ep_Q2_024_partial_23_0182,
  ep_Q2_024_partial_23_0183,
  ep_Q2_024_partial_23_0184,
  ep_Q2_024_partial_23_0185,
  ep_Q2_024_partial_23_0186,
  ep_Q2_024_partial_23_0187,
  ep_Q2_024_partial_23_0188,
  ep_Q2_024_partial_23_0189,
  ep_Q2_024_partial_23_0190,
  ep_Q2_024_partial_23_0191,
  ep_Q2_024_partial_23_0192,
  ep_Q2_024_partial_23_0193,
  ep_Q2_024_partial_23_0194,
  ep_Q2_024_partial_23_0195,
  ep_Q2_024_partial_23_0196,
  ep_Q2_024_partial_23_0197,
  ep_Q2_024_partial_23_0198,
  ep_Q2_024_partial_23_0199
]

/-- Sum of partial products in this block. -/
def ep_Q2_024_block_23_0100_0199 : Poly :=
[
  term ((-1502588816056224 : Rat) / 1162780221153193) [(5, 1), (9, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((751294408028112 : Rat) / 1162780221153193) [(5, 1), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((751294408028112 : Rat) / 1162780221153193) [(5, 1), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1502588816056224 : Rat) / 1162780221153193) [(5, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((8106674556350821614499410747889522520 : Rat) / 39990315246749243218889784267651308933) [(5, 1), (9, 2), (10, 1), (11, 1), (12, 1)],
  term ((-4053337278175410807249705373944761260 : Rat) / 39990315246749243218889784267651308933) [(5, 1), (9, 2), (11, 1), (12, 2)],
  term ((-4053337278175410807249705373944761260 : Rat) / 39990315246749243218889784267651308933) [(5, 1), (9, 2), (11, 1), (13, 2)],
  term ((8106674556350821614499410747889522520 : Rat) / 39990315246749243218889784267651308933) [(5, 1), (9, 2), (11, 2), (13, 1)],
  term ((14226897140764973269171123242720103504 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (10, 1), (12, 1), (13, 1)],
  term ((2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((416983870520476 : Rat) / 1162780221153193) [(5, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((184744853828697913697888159497283137409990300367651351 : Rat) / 46499947606600990925238671541813294873367321162373069) [(5, 1), (10, 1), (12, 1), (15, 1)],
  term ((-179505826806748 : Rat) / 1162780221153193) [(5, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-117169721017919969096547489343431156672 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (10, 1), (12, 2), (13, 1)],
  term ((10792577700669385746634892964930224078779740533127053954 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (10, 1), (12, 2), (15, 1)],
  term ((-3094860749653848 : Rat) / 1162780221153193) [(5, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((10792577700669385746634892964930224078779740533127053954 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-3094860749653848 : Rat) / 1162780221153193) [(5, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-117169721017919969096547489343431156672 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (11, 1), (12, 1), (13, 2)],
  term ((168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((416983870520476 : Rat) / 1162780221153193) [(5, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((184744853828697913697888159497283137409990300367651351 : Rat) / 46499947606600990925238671541813294873367321162373069) [(5, 1), (11, 1), (13, 1), (15, 1)],
  term ((-179505826806748 : Rat) / 1162780221153193) [(5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((14226897140764973269171123242720103504 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (11, 1), (13, 2)],
  term ((2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (11, 1), (13, 2), (14, 1)],
  term ((-5396288850334692873317446482465112039389870266563526977 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (12, 1), (13, 2), (15, 1)],
  term ((1547430374826924 : Rat) / 1162780221153193) [(5, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((58584860508959984548273744671715578336 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (12, 1), (13, 3)],
  term ((-7113448570382486634585561621360051752 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (12, 2), (13, 1)],
  term ((-1060843780828011690178037117696406736 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (12, 2), (13, 1), (14, 1)],
  term ((-168614132473848352421619338000873392948252297538773343 : Rat) / 278999685639605945551432029250879769240203926974238414) [(5, 1), (12, 2), (14, 1), (15, 1)],
  term ((-208491935260238 : Rat) / 1162780221153193) [(5, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-184744853828697913697888159497283137409990300367651351 : Rat) / 92999895213201981850477343083626589746734642324746138) [(5, 1), (12, 2), (15, 1)],
  term ((89752913403374 : Rat) / 1162780221153193) [(5, 1), (12, 2), (15, 1), (16, 1)],
  term ((58584860508959984548273744671715578336 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (12, 3), (13, 1)],
  term ((-5396288850334692873317446482465112039389870266563526977 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (12, 3), (15, 1)],
  term ((1547430374826924 : Rat) / 1162780221153193) [(5, 1), (12, 3), (15, 1), (16, 1)],
  term ((-168614132473848352421619338000873392948252297538773343 : Rat) / 278999685639605945551432029250879769240203926974238414) [(5, 1), (13, 2), (14, 1), (15, 1)],
  term ((-208491935260238 : Rat) / 1162780221153193) [(5, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-184744853828697913697888159497283137409990300367651351 : Rat) / 92999895213201981850477343083626589746734642324746138) [(5, 1), (13, 2), (15, 1)],
  term ((89752913403374 : Rat) / 1162780221153193) [(5, 1), (13, 2), (15, 1), (16, 1)],
  term ((-7113448570382486634585561621360051752 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (13, 3)],
  term ((-1060843780828011690178037117696406736 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (13, 3), (14, 1)],
  term ((-2450530644229309358053245409118283634804 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 1), (9, 1), (10, 1), (12, 1)],
  term ((-2450530644229309358053245409118283634804 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 1), (9, 1), (11, 1), (13, 1)],
  term ((1225265322114654679026622704559141817402 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 1), (9, 1), (12, 2)],
  term ((1225265322114654679026622704559141817402 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 1), (9, 1), (13, 2)],
  term ((168987700368001651573028191564885626968 : Rat) / 119970945740247729656669352802953926799) [(7, 1), (8, 1), (10, 1), (12, 1), (13, 1)],
  term ((177146052459990833086843034621145881016452606292749398931 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(7, 1), (8, 1), (10, 1), (12, 1), (15, 1)],
  term ((-1082535559364413 : Rat) / 1162780221153193) [(7, 1), (8, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-50596331749013033533730977984407392584 : Rat) / 119970945740247729656669352802953926799) [(7, 1), (8, 1), (10, 1), (12, 2), (13, 1)],
  term ((4678910223116561885498892093094954879251581098910006897 : Rat) / 464999476066009909252386715418132948733673211623730690) [(7, 1), (8, 1), (10, 1), (12, 2), (15, 1)],
  term ((-2292590409966194 : Rat) / 1162780221153193) [(7, 1), (8, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((4678910223116561885498892093094954879251581098910006897 : Rat) / 464999476066009909252386715418132948733673211623730690) [(7, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-2292590409966194 : Rat) / 1162780221153193) [(7, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-50596331749013033533730977984407392584 : Rat) / 119970945740247729656669352802953926799) [(7, 1), (8, 1), (11, 1), (12, 1), (13, 2)],
  term ((177146052459990833086843034621145881016452606292749398931 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(7, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((-1082535559364413 : Rat) / 1162780221153193) [(7, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((168987700368001651573028191564885626968 : Rat) / 119970945740247729656669352802953926799) [(7, 1), (8, 1), (11, 1), (13, 2)],
  term ((-4678910223116561885498892093094954879251581098910006897 : Rat) / 929998952132019818504773430836265897467346423247461380) [(7, 1), (8, 1), (12, 1), (13, 2), (15, 1)],
  term ((1146295204983097 : Rat) / 1162780221153193) [(7, 1), (8, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((25298165874506516766865488992203696292 : Rat) / 119970945740247729656669352802953926799) [(7, 1), (8, 1), (12, 1), (13, 3)],
  term ((-84493850184000825786514095782442813484 : Rat) / 119970945740247729656669352802953926799) [(7, 1), (8, 1), (12, 2), (13, 1)],
  term ((-177146052459990833086843034621145881016452606292749398931 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(7, 1), (8, 1), (12, 2), (15, 1)],
  term ((1082535559364413 : Rat) / 2325560442306386) [(7, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((25298165874506516766865488992203696292 : Rat) / 119970945740247729656669352802953926799) [(7, 1), (8, 1), (12, 3), (13, 1)],
  term ((-4678910223116561885498892093094954879251581098910006897 : Rat) / 929998952132019818504773430836265897467346423247461380) [(7, 1), (8, 1), (12, 3), (15, 1)],
  term ((1146295204983097 : Rat) / 1162780221153193) [(7, 1), (8, 1), (12, 3), (15, 1), (16, 1)],
  term ((-177146052459990833086843034621145881016452606292749398931 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(7, 1), (8, 1), (13, 2), (15, 1)],
  term ((1082535559364413 : Rat) / 2325560442306386) [(7, 1), (8, 1), (13, 2), (15, 1), (16, 1)],
  term ((-84493850184000825786514095782442813484 : Rat) / 119970945740247729656669352802953926799) [(7, 1), (8, 1), (13, 3)],
  term ((-919223663702645880258447578564062063174 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (9, 1), (10, 1), (12, 1)],
  term ((-1352426172101182737185794737983768912 : Rat) / 39990315246749243218889784267651308933) [(7, 1), (9, 1), (10, 1), (12, 1), (14, 1)],
  term ((7987662086973295405733108726708264048 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (9, 1), (10, 1), (12, 2)],
  term ((7987662086973295405733108726708264048 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((-919223663702645880258447578564062063174 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (9, 1), (11, 1), (13, 1)],
  term ((-1352426172101182737185794737983768912 : Rat) / 39990315246749243218889784267651308933) [(7, 1), (9, 1), (11, 1), (13, 1), (14, 1)],
  term ((-3993831043486647702866554363354132024 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (9, 1), (12, 1), (13, 2)],
  term ((459611831851322940129223789282031031587 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (9, 1), (12, 2)],
  term ((676213086050591368592897368991884456 : Rat) / 39990315246749243218889784267651308933) [(7, 1), (9, 1), (12, 2), (14, 1)],
  term ((-3993831043486647702866554363354132024 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (9, 1), (12, 3)],
  term ((459611831851322940129223789282031031587 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (9, 1), (13, 2)],
  term ((676213086050591368592897368991884456 : Rat) / 39990315246749243218889784267651308933) [(7, 1), (9, 1), (13, 2), (14, 1)],
  term ((174966140812491725990765627383426868992 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (10, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((16176500484703859640326183609747740820124383478472384106 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (10, 1), (11, 1), (12, 1), (15, 2)],
  term ((115944433813960 : Rat) / 1162780221153193) [(7, 1), (10, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((3928170973431556897968641917911482171402 : Rat) / 1799564186103715944850040292044308901985) [(7, 1), (10, 1), (12, 1), (13, 1)],
  term ((-16283290118036559100125731609525651232 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((-25987709137044587841957687030988015184 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (10, 1), (12, 1), (13, 1), (14, 2)],
  term ((-7941159738640092377781708051038156584201845832521631328 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (10, 1), (12, 1), (13, 1), (15, 2)],
  term ((1094804846263872 : Rat) / 1162780221153193) [(7, 1), (10, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-27491063214868865162112024830977996352 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (10, 1), (12, 1), (13, 2), (15, 1)],
  term ((53824762600716421491094410962189703401457332436241210747 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-7513834425399396 : Rat) / 1162780221153193) [(7, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2488379973681280850295504409161390030016648051801582732 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (10, 1), (12, 1), (14, 2), (15, 1)],
  term ((624553897293232 : Rat) / 1162780221153193) [(7, 1), (10, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-814726240890892284181068227080131452530875400483914284347 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(7, 1), (10, 1), (12, 1), (15, 1)],
  term ((14078238642132395 : Rat) / 1162780221153193) [(7, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2488379973681280850295504409161390030016648051801582732 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (10, 1), (12, 1), (15, 3)],
  term ((624553897293232 : Rat) / 1162780221153193) [(7, 1), (10, 1), (12, 1), (15, 3), (16, 1)],
  term ((-805341698516247746487407736754202445236 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (10, 1), (12, 2), (13, 1)],
  term ((-7181570345025089215510545206361812704 : Rat) / 39990315246749243218889784267651308933) [(7, 1), (10, 1), (12, 2), (13, 1), (14, 1)],
  term ((4074480252190612073483360722046549035277896901160054012 : Rat) / 232499738033004954626193357709066474366836605811865345) [(7, 1), (10, 1), (12, 2), (14, 1), (15, 1)],
  term ((-6024279800694704 : Rat) / 1162780221153193) [(7, 1), (10, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((63266169461659354395606229885235433260289045114720801271 : Rat) / 929998952132019818504773430836265897467346423247461380) [(7, 1), (10, 1), (12, 2), (15, 1)],
  term ((-6533280838736367 : Rat) / 1162780221153193) [(7, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((1576427228864685585532861798833297750976 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (10, 1), (12, 3), (13, 1)],
  term ((-14190503691287756559998110760772247013129470784083539996 : Rat) / 232499738033004954626193357709066474366836605811865345) [(7, 1), (10, 1), (12, 3), (15, 1)],
  term ((10570809984421360 : Rat) / 1162780221153193) [(7, 1), (10, 1), (12, 3), (15, 1), (16, 1)],
  term ((4074480252190612073483360722046549035277896901160054012 : Rat) / 232499738033004954626193357709066474366836605811865345) [(7, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-6024279800694704 : Rat) / 1162780221153193) [(7, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((63266169461659354395606229885235433260289045114720801271 : Rat) / 929998952132019818504773430836265897467346423247461380) [(7, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-6533280838736367 : Rat) / 1162780221153193) [(7, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-805341698516247746487407736754202445236 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (11, 1), (12, 1), (13, 2)],
  term ((-7181570345025089215510545206361812704 : Rat) / 39990315246749243218889784267651308933) [(7, 1), (11, 1), (12, 1), (13, 2), (14, 1)],
  term ((-42673234657817404598353183254890645091998214912037365716 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (11, 1), (12, 2), (13, 1), (15, 1)],
  term ((10570809984421360 : Rat) / 1162780221153193) [(7, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((1576427228864685585532861798833297750976 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (11, 1), (12, 2), (13, 2)],
  term ((-8088250242351929820163091804873870410062191739236192053 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (11, 1), (12, 2), (15, 2)],
  term ((-57972216906980 : Rat) / 1162780221153193) [(7, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((53824762600716421491094410962189703401457332436241210747 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-7513834425399396 : Rat) / 1162780221153193) [(7, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2488379973681280850295504409161390030016648051801582732 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((624553897293232 : Rat) / 1162780221153193) [(7, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-814726240890892284181068227080131452530875400483914284347 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(7, 1), (11, 1), (13, 1), (15, 1)],
  term ((14078238642132395 : Rat) / 1162780221153193) [(7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2488379973681280850295504409161390030016648051801582732 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (11, 1), (13, 1), (15, 3)],
  term ((624553897293232 : Rat) / 1162780221153193) [(7, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((3928170973431556897968641917911482171402 : Rat) / 1799564186103715944850040292044308901985) [(7, 1), (11, 1), (13, 2)],
  term ((-16283290118036559100125731609525651232 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (11, 1), (13, 2), (14, 1)],
  term ((-25987709137044587841957687030988015184 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (11, 1), (13, 2), (14, 2)],
  term ((-5343136660330674065981599951970675664754679190585941127 : Rat) / 232499738033004954626193357709066474366836605811865345) [(7, 1), (11, 1), (13, 2), (15, 2)],
  term ((1036832629356892 : Rat) / 1162780221153193) [(7, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-169956260050852458481718888184647423552 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (11, 1), (13, 3), (15, 1)],
  term ((16176500484703859640326183609747740820124383478472384106 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (11, 2), (13, 1), (15, 2)],
  term ((115944433813960 : Rat) / 1162780221153193) [(7, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((174966140812491725990765627383426868992 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (11, 2), (13, 2), (15, 1)],
  term ((-2037240126095306036741680361023274517638948450580027006 : Rat) / 232499738033004954626193357709066474366836605811865345) [(7, 1), (12, 1), (13, 2), (14, 1), (15, 1)],
  term ((3012139900347352 : Rat) / 1162780221153193) [(7, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-63266169461659354395606229885235433260289045114720801271 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(7, 1), (12, 1), (13, 2), (15, 1)],
  term ((6533280838736367 : Rat) / 2325560442306386) [(7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((402670849258123873243703868377101222618 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (12, 1), (13, 3)],
  term ((3590785172512544607755272603180906352 : Rat) / 39990315246749243218889784267651308933) [(7, 1), (12, 1), (13, 3), (14, 1)],
  term ((-1964085486715778448984320958955741085701 : Rat) / 1799564186103715944850040292044308901985) [(7, 1), (12, 2), (13, 1)],
  term ((8141645059018279550062865804762825616 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (12, 2), (13, 1), (14, 1)],
  term ((12993854568522293920978843515494007592 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (12, 2), (13, 1), (14, 2)],
  term ((3970579869320046188890854025519078292100922916260815664 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (12, 2), (13, 1), (15, 2)],
  term ((-547402423131936 : Rat) / 1162780221153193) [(7, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((7111234877926239093982202993946374261396859275035345966 : Rat) / 232499738033004954626193357709066474366836605811865345) [(7, 1), (12, 2), (13, 2), (15, 1)],
  term ((-5285404992210680 : Rat) / 1162780221153193) [(7, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((-788213614432342792766430899416648875488 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (12, 2), (13, 3)],
  term ((-53824762600716421491094410962189703401457332436241210747 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(7, 1), (12, 2), (14, 1), (15, 1)],
  term ((3756917212699698 : Rat) / 1162780221153193) [(7, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((1244189986840640425147752204580695015008324025900791366 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (12, 2), (14, 2), (15, 1)],
  term ((-312276948646616 : Rat) / 1162780221153193) [(7, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((814726240890892284181068227080131452530875400483914284347 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(7, 1), (12, 2), (15, 1)],
  term ((-14078238642132395 : Rat) / 2325560442306386) [(7, 1), (12, 2), (15, 1), (16, 1)],
  term ((1244189986840640425147752204580695015008324025900791366 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (12, 2), (15, 3)],
  term ((-312276948646616 : Rat) / 1162780221153193) [(7, 1), (12, 2), (15, 3), (16, 1)],
  term ((402670849258123873243703868377101222618 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (12, 3), (13, 1)],
  term ((3590785172512544607755272603180906352 : Rat) / 39990315246749243218889784267651308933) [(7, 1), (12, 3), (13, 1), (14, 1)],
  term ((-2037240126095306036741680361023274517638948450580027006 : Rat) / 232499738033004954626193357709066474366836605811865345) [(7, 1), (12, 3), (14, 1), (15, 1)],
  term ((3012139900347352 : Rat) / 1162780221153193) [(7, 1), (12, 3), (14, 1), (15, 1), (16, 1)],
  term ((-63266169461659354395606229885235433260289045114720801271 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(7, 1), (12, 3), (15, 1)],
  term ((6533280838736367 : Rat) / 2325560442306386) [(7, 1), (12, 3), (15, 1), (16, 1)],
  term ((-788213614432342792766430899416648875488 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (12, 4), (13, 1)],
  term ((7095251845643878279999055380386123506564735392041769998 : Rat) / 232499738033004954626193357709066474366836605811865345) [(7, 1), (12, 4), (15, 1)],
  term ((-5285404992210680 : Rat) / 1162780221153193) [(7, 1), (12, 4), (15, 1), (16, 1)],
  term ((-53824762600716421491094410962189703401457332436241210747 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(7, 1), (13, 2), (14, 1), (15, 1)],
  term ((3756917212699698 : Rat) / 1162780221153193) [(7, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((1244189986840640425147752204580695015008324025900791366 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (13, 2), (14, 2), (15, 1)],
  term ((-312276948646616 : Rat) / 1162780221153193) [(7, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((814726240890892284181068227080131452530875400483914284347 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(7, 1), (13, 2), (15, 1)],
  term ((-14078238642132395 : Rat) / 2325560442306386) [(7, 1), (13, 2), (15, 1), (16, 1)],
  term ((1244189986840640425147752204580695015008324025900791366 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (13, 2), (15, 3)],
  term ((-312276948646616 : Rat) / 1162780221153193) [(7, 1), (13, 2), (15, 3), (16, 1)],
  term ((-1964085486715778448984320958955741085701 : Rat) / 1799564186103715944850040292044308901985) [(7, 1), (13, 3)],
  term ((8141645059018279550062865804762825616 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (13, 3), (14, 1)],
  term ((12993854568522293920978843515494007592 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (13, 3), (14, 2)],
  term ((3970579869320046188890854025519078292100922916260815664 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (13, 3), (15, 2)],
  term ((-547402423131936 : Rat) / 1162780221153193) [(7, 1), (13, 3), (15, 2), (16, 1)],
  term ((13745531607434432581056012415488998176 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (13, 4), (15, 1)],
  term ((-243177881470978164141696144098287893064 : Rat) / 39990315246749243218889784267651308933) [(8, 1), (9, 1), (10, 1), (11, 1), (12, 1)],
  term ((-20694532947007793690184529363583587976 : Rat) / 119970945740247729656669352802953926799) [(8, 1), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((-54925684334525674385194901172966691552873949315078298611 : Rat) / 697499214099014863878580073127199423100509817435596035) [(8, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((14752249775134076 : Rat) / 1162780221153193) [(8, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((51916682732587159756343578366982608688 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (9, 1), (10, 1), (12, 2), (13, 1)],
  term ((-519790077507635364246714238454931580267528154182411463 : Rat) / 232499738033004954626193357709066474366836605811865345) [(8, 1), (9, 1), (10, 1), (12, 2), (15, 1)],
  term ((850957154578940 : Rat) / 1162780221153193) [(8, 1), (9, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-519790077507635364246714238454931580267528154182411463 : Rat) / 232499738033004954626193357709066474366836605811865345) [(8, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((850957154578940 : Rat) / 1162780221153193) [(8, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((51916682732587159756343578366982608688 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (9, 1), (11, 1), (12, 1), (13, 2)],
  term ((121588940735489082070848072049143946532 : Rat) / 39990315246749243218889784267651308933) [(8, 1), (9, 1), (11, 1), (12, 2)],
  term ((-54925684334525674385194901172966691552873949315078298611 : Rat) / 697499214099014863878580073127199423100509817435596035) [(8, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((14752249775134076 : Rat) / 1162780221153193) [(8, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((344072289259459452522359686783848251620 : Rat) / 119970945740247729656669352802953926799) [(8, 1), (9, 1), (11, 1), (13, 2)],
  term ((-243177881470978164141696144098287893064 : Rat) / 39990315246749243218889784267651308933) [(8, 1), (9, 1), (11, 2), (13, 1)],
  term ((519790077507635364246714238454931580267528154182411463 : Rat) / 464999476066009909252386715418132948733673211623730690) [(8, 1), (9, 1), (12, 1), (13, 2), (15, 1)],
  term ((-425478577289470 : Rat) / 1162780221153193) [(8, 1), (9, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-25958341366293579878171789183491304344 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (9, 1), (12, 1), (13, 3)],
  term ((10347266473503896845092264681791793988 : Rat) / 119970945740247729656669352802953926799) [(8, 1), (9, 1), (12, 2), (13, 1)],
  term ((54925684334525674385194901172966691552873949315078298611 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(8, 1), (9, 1), (12, 2), (15, 1)],
  term ((-7376124887567038 : Rat) / 1162780221153193) [(8, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-25958341366293579878171789183491304344 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (9, 1), (12, 3), (13, 1)],
  term ((519790077507635364246714238454931580267528154182411463 : Rat) / 464999476066009909252386715418132948733673211623730690) [(8, 1), (9, 1), (12, 3), (15, 1)],
  term ((-425478577289470 : Rat) / 1162780221153193) [(8, 1), (9, 1), (12, 3), (15, 1), (16, 1)],
  term ((54925684334525674385194901172966691552873949315078298611 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(8, 1), (9, 1), (13, 2), (15, 1)],
  term ((-7376124887567038 : Rat) / 1162780221153193) [(8, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((10347266473503896845092264681791793988 : Rat) / 119970945740247729656669352802953926799) [(8, 1), (9, 1), (13, 3)],
  term ((1015571909033256875353140008848594953112 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (9, 2), (10, 1), (12, 1)],
  term ((1015571909033256875353140008848594953112 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (9, 2), (11, 1), (13, 1)],
  term ((-507785954516628437676570004424297476556 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (9, 2), (12, 2)],
  term ((-507785954516628437676570004424297476556 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (9, 2), (13, 2)],
  term ((-537920766019599777996106631007983419660 : Rat) / 119970945740247729656669352802953926799) [(8, 1), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((-93287772980208889667188405400887339674285091873046133733 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(8, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-4815941933934353 : Rat) / 2325560442306386) [(8, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-75044803479610622078844277253469055464 : Rat) / 199951576233746216094448921338256544665) [(8, 1), (10, 1), (11, 1), (12, 2), (13, 1)],
  term ((4189554939777403259041079172137271511321467357690977803 : Rat) / 464999476066009909252386715418132948733673211623730690) [(8, 1), (10, 1), (11, 1), (12, 2), (15, 1)],
  term ((-2163325299394758 : Rat) / 1162780221153193) [(8, 1), (10, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-2690114197207888562774983972323743256316 : Rat) / 1799564186103715944850040292044308901985) [(8, 1), (10, 1), (12, 1)],
  term ((-354370675863676298812148301414579384265140264924470790 : Rat) / 46499947606600990925238671541813294873367321162373069) [(8, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((75330592794360 : Rat) / 1162780221153193) [(8, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((40472928056033817116049120031239046672 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (10, 1), (12, 1), (13, 2)],
  term ((8921151527862041881559355605928391576 : Rat) / 199951576233746216094448921338256544665) [(8, 1), (10, 1), (12, 1), (14, 1)],
  term ((306849677609162941141519942935896119863282963199083215917 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(8, 1), (10, 1), (12, 1), (15, 2)],
  term ((-12880146370366127 : Rat) / 2325560442306386) [(8, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-4189554939777403259041079172137271511321467357690977803 : Rat) / 929998952132019818504773430836265897467346423247461380) [(8, 1), (11, 1), (12, 1), (13, 2), (15, 1)],
  term ((1081662649697379 : Rat) / 1162780221153193) [(8, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((37522401739805311039422138626734527732 : Rat) / 199951576233746216094448921338256544665) [(8, 1), (11, 1), (12, 1), (13, 3)],
  term ((268960383009799888998053315503991709830 : Rat) / 119970945740247729656669352802953926799) [(8, 1), (11, 1), (12, 2), (13, 1)],
  term ((93287772980208889667188405400887339674285091873046133733 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(8, 1), (11, 1), (12, 2), (15, 1)],
  term ((4815941933934353 : Rat) / 4651120884612772) [(8, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((37522401739805311039422138626734527732 : Rat) / 199951576233746216094448921338256544665) [(8, 1), (11, 1), (12, 3), (13, 1)],
  term ((-4189554939777403259041079172137271511321467357690977803 : Rat) / 929998952132019818504773430836265897467346423247461380) [(8, 1), (11, 1), (12, 3), (15, 1)],
  term ((1081662649697379 : Rat) / 1162780221153193) [(8, 1), (11, 1), (12, 3), (15, 1), (16, 1)],
  term ((-2690114197207888562774983972323743256316 : Rat) / 1799564186103715944850040292044308901985) [(8, 1), (11, 1), (13, 1)],
  term ((8921151527862041881559355605928391576 : Rat) / 199951576233746216094448921338256544665) [(8, 1), (11, 1), (13, 1), (14, 1)],
  term ((306849677609162941141519942935896119863282963199083215917 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(8, 1), (11, 1), (13, 1), (15, 2)],
  term ((-12880146370366127 : Rat) / 2325560442306386) [(8, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((8238810772926577952272813061388287450651428291173144133 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(8, 1), (11, 1), (13, 2), (15, 1)],
  term ((5117264305111793 : Rat) / 4651120884612772) [(8, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((1385274843105033262106315697551197595822 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (11, 1), (13, 3)],
  term ((4189554939777403259041079172137271511321467357690977803 : Rat) / 464999476066009909252386715418132948733673211623730690) [(8, 1), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((-2163325299394758 : Rat) / 1162780221153193) [(8, 1), (11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-75044803479610622078844277253469055464 : Rat) / 199951576233746216094448921338256544665) [(8, 1), (11, 2), (12, 1), (13, 2)],
  term ((-93287772980208889667188405400887339674285091873046133733 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(8, 1), (11, 2), (13, 1), (15, 1)],
  term ((-4815941933934353 : Rat) / 2325560442306386) [(8, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-537920766019599777996106631007983419660 : Rat) / 119970945740247729656669352802953926799) [(8, 1), (11, 2), (13, 2)],
  term ((1345057098603944281387491986161871628158 : Rat) / 1799564186103715944850040292044308901985) [(8, 1), (12, 2)],
  term ((177185337931838149406074150707289692132570132462235395 : Rat) / 46499947606600990925238671541813294873367321162373069) [(8, 1), (12, 2), (13, 1), (15, 1)],
  term ((-37665296397180 : Rat) / 1162780221153193) [(8, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-20236464028016908558024560015619523336 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (12, 2), (13, 2)],
  term ((-4460575763931020940779677802964195788 : Rat) / 199951576233746216094448921338256544665) [(8, 1), (12, 2), (14, 1)],
  term ((-306849677609162941141519942935896119863282963199083215917 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(8, 1), (12, 2), (15, 2)],
  term ((12880146370366127 : Rat) / 4651120884612772) [(8, 1), (12, 2), (15, 2), (16, 1)],
  term ((1345057098603944281387491986161871628158 : Rat) / 1799564186103715944850040292044308901985) [(8, 1), (13, 2)],
  term ((-4460575763931020940779677802964195788 : Rat) / 199951576233746216094448921338256544665) [(8, 1), (13, 2), (14, 1)],
  term ((-306849677609162941141519942935896119863282963199083215917 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(8, 1), (13, 2), (15, 2)],
  term ((12880146370366127 : Rat) / 4651120884612772) [(8, 1), (13, 2), (15, 2), (16, 1)],
  term ((177185337931838149406074150707289692132570132462235395 : Rat) / 46499947606600990925238671541813294873367321162373069) [(8, 1), (13, 3), (15, 1)],
  term ((-37665296397180 : Rat) / 1162780221153193) [(8, 1), (13, 3), (15, 1), (16, 1)],
  term ((-20236464028016908558024560015619523336 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (13, 4)],
  term ((-4325421618498215419393820043896931715804 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (10, 1), (11, 1), (12, 1)],
  term ((-11092207154328007419038131097017187972734945034045553076 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 1), (10, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((150661185588720 : Rat) / 1162780221153193) [(9, 1), (10, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((80945856112067634232098240062478093344 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (10, 1), (11, 1), (12, 1), (13, 2)],
  term ((17842303055724083763118711211856783152 : Rat) / 199951576233746216094448921338256544665) [(9, 1), (10, 1), (11, 1), (12, 1), (14, 1)],
  term ((31914642418468897160042061022834858140022559670850052665 : Rat) / 557999371279211891102864058501759538480407853948476828) [(9, 1), (10, 1), (11, 1), (12, 1), (15, 2)],
  term ((-12213780129134847 : Rat) / 1162780221153193) [(9, 1), (10, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-56960453299830809226902458886729156568 : Rat) / 199951576233746216094448921338256544665) [(9, 1), (10, 1), (11, 1), (12, 2)],
  term ((11492780264891005012005163296554756120938 : Rat) / 1799564186103715944850040292044308901985) [(9, 1), (10, 1), (12, 1), (13, 1)],
  term ((-2547129504283995756354638229059909031968 : Rat) / 359912837220743188970008058408861780397) [(9, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((56218793397401222444627522532761657312 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (10, 1), (12, 1), (13, 1), (14, 2)],
  term ((-19846603801094971681836921785403492035946502369064496832 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 1), (10, 1), (12, 1), (13, 1), (15, 2)],
  term ((4996431178345856 : Rat) / 1162780221153193) [(9, 1), (10, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-207901673096356702735661496247904121472 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (10, 1), (12, 1), (13, 2), (15, 1)],
  term ((-125109722716038263779515583490660891561614725169745090549 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(9, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-83635389120201241 : Rat) / 6976681326919158) [(9, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((6662901272101045224807202198331513989515819078990898894 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 1), (10, 1), (12, 1), (14, 2), (15, 1)],
  term ((-415140053545512 : Rat) / 1162780221153193) [(9, 1), (10, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((76119288641052222185073485225852923838335133327637973191 : Rat) / 743999161705615854803818744669012717973877138597969104) [(9, 1), (10, 1), (12, 1), (15, 1)],
  term ((120480583543931879 : Rat) / 13953362653838316) [(9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((4976759947362561700591008818322780060033296103603165464 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 1), (10, 1), (12, 1), (15, 3)],
  term ((-1249107794586464 : Rat) / 1162780221153193) [(9, 1), (10, 1), (12, 1), (15, 3), (16, 1)],
  term ((188455297728748793030784055224581185364 : Rat) / 1799564186103715944850040292044308901985) [(9, 1), (10, 1), (12, 2), (13, 1)],
  term ((-1859489400717863008451309270511497282108 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (10, 1), (12, 2), (13, 1), (14, 1)],
  term ((7263731563565507622614412820708822571625937066404132075 : Rat) / 185999790426403963700954686167253179493469284649492276) [(9, 1), (10, 1), (12, 2), (14, 1), (15, 1)],
  term ((-7650512415470575 : Rat) / 1162780221153193) [(9, 1), (10, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-709323818797893594593761837643243035840193531554982145883 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(9, 1), (10, 1), (12, 2), (15, 1)],
  term ((-41617713752934061 : Rat) / 6976681326919158) [(9, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-699598964377024284665984479369490528956 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (10, 1), (12, 3), (13, 1)],
  term ((25139328452534028572442634900325055710038373424316626143 : Rat) / 929998952132019818504773430836265897467346423247461380) [(9, 1), (10, 1), (12, 3), (15, 1)],
  term ((-4569079916135479 : Rat) / 1162780221153193) [(9, 1), (10, 1), (12, 3), (15, 1), (16, 1)],
  term ((7263731563565507622614412820708822571625937066404132075 : Rat) / 185999790426403963700954686167253179493469284649492276) [(9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-7650512415470575 : Rat) / 1162780221153193) [(9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-709323818797893594593761837643243035840193531554982145883 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-41617713752934061 : Rat) / 6976681326919158) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((88955467515597486910369024042972477984 : Rat) / 359912837220743188970008058408861780397) [(9, 1), (11, 1), (12, 1), (13, 2)],
  term ((-1859489400717863008451309270511497282108 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (11, 1), (12, 1), (13, 2), (14, 1)],
  term ((2162710809249107709696910021948465857902 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (11, 1), (12, 2)],
  term ((97602399666258100555404166895009543075585010341040984581 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(9, 1), (11, 1), (12, 2), (13, 1), (15, 1)],
  term ((-4644410508929839 : Rat) / 1162780221153193) [(9, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-740071892433058101782033599400729575628 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (11, 1), (12, 2), (13, 2)],
  term ((-8921151527862041881559355605928391576 : Rat) / 199951576233746216094448921338256544665) [(9, 1), (11, 1), (12, 2), (14, 1)],
  term ((-31914642418468897160042061022834858140022559670850052665 : Rat) / 1115998742558423782205728117003519076960815707896953656) [(9, 1), (11, 1), (12, 2), (15, 2)],
  term ((12213780129134847 : Rat) / 2325560442306386) [(9, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((28480226649915404613451229443364578284 : Rat) / 199951576233746216094448921338256544665) [(9, 1), (11, 1), (12, 3)],
  term ((-125109722716038263779515583490660891561614725169745090549 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-83635389120201241 : Rat) / 6976681326919158) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((6662901272101045224807202198331513989515819078990898894 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((-415140053545512 : Rat) / 1162780221153193) [(9, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((76119288641052222185073485225852923838335133327637973191 : Rat) / 743999161705615854803818744669012717973877138597969104) [(9, 1), (11, 1), (13, 1), (15, 1)],
  term ((120480583543931879 : Rat) / 13953362653838316) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((4976759947362561700591008818322780060033296103603165464 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 1), (11, 1), (13, 1), (15, 3)],
  term ((-1249107794586464 : Rat) / 1162780221153193) [(9, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((17980912692638328141095893362400153694644 : Rat) / 1799564186103715944850040292044308901985) [(9, 1), (11, 1), (13, 2)],
  term ((-12815937885170737158707225345752900684024 : Rat) / 1799564186103715944850040292044308901985) [(9, 1), (11, 1), (13, 2), (14, 1)],
  term ((56218793397401222444627522532761657312 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (11, 1), (13, 2), (14, 2)],
  term ((-318346042501104259254905679397402226987684817306766237981 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(9, 1), (11, 1), (13, 2), (15, 2)],
  term ((22206642485826559 : Rat) / 2325560442306386) [(9, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((5304359623742903227410611596958081169620744335630116442 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 1), (11, 1), (13, 3), (15, 1)],
  term ((-75330592794360 : Rat) / 1162780221153193) [(9, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((-40472928056033817116049120031239046672 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (11, 1), (13, 4)],
  term ((-56960453299830809226902458886729156568 : Rat) / 199951576233746216094448921338256544665) [(9, 1), (11, 2), (12, 1), (13, 1)],
  term ((-4325421618498215419393820043896931715804 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (11, 2), (13, 1)],
  term ((17842303055724083763118711211856783152 : Rat) / 199951576233746216094448921338256544665) [(9, 1), (11, 2), (13, 1), (14, 1)],
  term ((31914642418468897160042061022834858140022559670850052665 : Rat) / 557999371279211891102864058501759538480407853948476828) [(9, 1), (11, 2), (13, 1), (15, 2)],
  term ((-12213780129134847 : Rat) / 1162780221153193) [(9, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((-11092207154328007419038131097017187972734945034045553076 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 1), (11, 2), (13, 2), (15, 1)],
  term ((150661185588720 : Rat) / 1162780221153193) [(9, 1), (11, 2), (13, 2), (15, 1), (16, 1)],
  term ((80945856112067634232098240062478093344 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (11, 2), (13, 3)],
  term ((-7263731563565507622614412820708822571625937066404132075 : Rat) / 371999580852807927401909372334506358986938569298984552) [(9, 1), (12, 1), (13, 2), (14, 1), (15, 1)],
  term ((7650512415470575 : Rat) / 2325560442306386) [(9, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((709323818797893594593761837643243035840193531554982145883 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(9, 1), (12, 1), (13, 2), (15, 1)],
  term ((41617713752934061 : Rat) / 13953362653838316) [(9, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-94227648864374396515392027612290592682 : Rat) / 1799564186103715944850040292044308901985) [(9, 1), (12, 1), (13, 3)],
  term ((929744700358931504225654635255748641054 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (12, 1), (13, 3), (14, 1)],
  term ((-5746390132445502506002581648277378060469 : Rat) / 1799564186103715944850040292044308901985) [(9, 1), (12, 2), (13, 1)],
  term ((1273564752141997878177319114529954515984 : Rat) / 359912837220743188970008058408861780397) [(9, 1), (12, 2), (13, 1), (14, 1)],
  term ((-28109396698700611222313761266380828656 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (12, 2), (13, 1), (14, 2)],
  term ((9923301900547485840918460892701746017973251184532248416 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 1), (12, 2), (13, 1), (15, 2)],
  term ((-2498215589172928 : Rat) / 1162780221153193) [(9, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-14890201908783536757778817778954623172625641509475847609 : Rat) / 1115998742558423782205728117003519076960815707896953656) [(9, 1), (12, 2), (13, 2), (15, 1)],
  term ((4569079916135479 : Rat) / 2325560442306386) [(9, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((349799482188512142332992239684745264478 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (12, 2), (13, 3)],
  term ((125109722716038263779515583490660891561614725169745090549 : Rat) / 3719995808528079274019093723345063589869385692989845520) [(9, 1), (12, 2), (14, 1), (15, 1)],
  term ((83635389120201241 : Rat) / 13953362653838316) [(9, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-3331450636050522612403601099165756994757909539495449447 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 1), (12, 2), (14, 2), (15, 1)],
  term ((207570026772756 : Rat) / 1162780221153193) [(9, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((-76119288641052222185073485225852923838335133327637973191 : Rat) / 1487998323411231709607637489338025435947754277195938208) [(9, 1), (12, 2), (15, 1)],
  term ((-120480583543931879 : Rat) / 27906725307676632) [(9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-2488379973681280850295504409161390030016648051801582732 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 1), (12, 2), (15, 3)],
  term ((624553897293232 : Rat) / 1162780221153193) [(9, 1), (12, 2), (15, 3), (16, 1)],
  term ((-94227648864374396515392027612290592682 : Rat) / 1799564186103715944850040292044308901985) [(9, 1), (12, 3), (13, 1)],
  term ((929744700358931504225654635255748641054 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (12, 3), (13, 1), (14, 1)],
  term ((-7263731563565507622614412820708822571625937066404132075 : Rat) / 371999580852807927401909372334506358986938569298984552) [(9, 1), (12, 3), (14, 1), (15, 1)],
  term ((7650512415470575 : Rat) / 2325560442306386) [(9, 1), (12, 3), (14, 1), (15, 1), (16, 1)],
  term ((709323818797893594593761837643243035840193531554982145883 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(9, 1), (12, 3), (15, 1)],
  term ((41617713752934061 : Rat) / 13953362653838316) [(9, 1), (12, 3), (15, 1), (16, 1)],
  term ((349799482188512142332992239684745264478 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (12, 4), (13, 1)],
  term ((-25139328452534028572442634900325055710038373424316626143 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(9, 1), (12, 4), (15, 1)],
  term ((4569079916135479 : Rat) / 2325560442306386) [(9, 1), (12, 4), (15, 1), (16, 1)],
  term ((125109722716038263779515583490660891561614725169745090549 : Rat) / 3719995808528079274019093723345063589869385692989845520) [(9, 1), (13, 2), (14, 1), (15, 1)],
  term ((83635389120201241 : Rat) / 13953362653838316) [(9, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-3331450636050522612403601099165756994757909539495449447 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 1), (13, 2), (14, 2), (15, 1)],
  term ((207570026772756 : Rat) / 1162780221153193) [(9, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((-76119288641052222185073485225852923838335133327637973191 : Rat) / 1487998323411231709607637489338025435947754277195938208) [(9, 1), (13, 2), (15, 1)],
  term ((-120480583543931879 : Rat) / 27906725307676632) [(9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-2488379973681280850295504409161390030016648051801582732 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 1), (13, 2), (15, 3)],
  term ((624553897293232 : Rat) / 1162780221153193) [(9, 1), (13, 2), (15, 3), (16, 1)],
  term ((-5746390132445502506002581648277378060469 : Rat) / 1799564186103715944850040292044308901985) [(9, 1), (13, 3)],
  term ((1273564752141997878177319114529954515984 : Rat) / 359912837220743188970008058408861780397) [(9, 1), (13, 3), (14, 1)],
  term ((-28109396698700611222313761266380828656 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (13, 3), (14, 2)],
  term ((9923301900547485840918460892701746017973251184532248416 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 1), (13, 3), (15, 2)],
  term ((-2498215589172928 : Rat) / 1162780221153193) [(9, 1), (13, 3), (15, 2), (16, 1)],
  term ((103950836548178351367830748123952060736 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (13, 4), (15, 1)],
  term ((5582661362522591246414347476708137077162 : Rat) / 599854728701238648283346764014769633995) [(9, 2), (10, 1), (12, 1)],
  term ((5582661362522591246414347476708137077162 : Rat) / 599854728701238648283346764014769633995) [(9, 2), (11, 1), (13, 1)],
  term ((-2791330681261295623207173738354068538581 : Rat) / 599854728701238648283346764014769633995) [(9, 2), (12, 2)],
  term ((-2791330681261295623207173738354068538581 : Rat) / 599854728701238648283346764014769633995) [(9, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 23, terms 100 through 199. -/
theorem ep_Q2_024_block_23_0100_0199_valid :
    checkProductSumEq ep_Q2_024_partials_23_0100_0199
      ep_Q2_024_block_23_0100_0199 = true := by
  native_decide

end EpQ2024TermShards

end Patterns

end EndpointCertificate

end Problem97
