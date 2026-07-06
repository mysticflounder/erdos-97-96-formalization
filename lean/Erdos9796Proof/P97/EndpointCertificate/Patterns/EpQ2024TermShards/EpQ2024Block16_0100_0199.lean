/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_024, term block 16:100-199

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_024`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2024TermShards

/-- Generator polynomial 16 for endpoint certificate `ep_Q2_024`. -/
def ep_Q2_024_generator_16_0100_0199 : Poly :=
[
  term (2 : Rat) [(2, 1), (6, 1)],
  term (-1 : Rat) [(2, 2)],
  term (2 : Rat) [(3, 1), (7, 1)],
  term (-1 : Rat) [(3, 2)]
]

/-- Coefficient term 100 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0100 : Poly :=
[
  term ((198745616475118943998092102782769635563595552220534688 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 2), (12, 1), (15, 2)]
]

/-- Partial product 100 for generator 16. -/
def ep_Q2_024_partial_16_0100 : Poly :=
[
  term ((397491232950237887996184205565539271127191104441069376 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 2), (2, 1), (6, 1), (12, 1), (15, 2)],
  term ((-198745616475118943998092102782769635563595552220534688 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 2), (2, 2), (12, 1), (15, 2)],
  term ((397491232950237887996184205565539271127191104441069376 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 2), (3, 1), (7, 1), (12, 1), (15, 2)],
  term ((-198745616475118943998092102782769635563595552220534688 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 2), (3, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 16. -/
theorem ep_Q2_024_partial_16_0100_valid :
    mulPoly ep_Q2_024_coefficient_16_0100
        ep_Q2_024_generator_16_0100_0199 =
      ep_Q2_024_partial_16_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0101 : Poly :=
[
  term ((-527210767274432 : Rat) / 1162780221153193) [(1, 2), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 101 for generator 16. -/
def ep_Q2_024_partial_16_0101 : Poly :=
[
  term ((-1054421534548864 : Rat) / 1162780221153193) [(1, 2), (2, 1), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((527210767274432 : Rat) / 1162780221153193) [(1, 2), (2, 2), (12, 1), (15, 2), (16, 1)],
  term ((-1054421534548864 : Rat) / 1162780221153193) [(1, 2), (3, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((527210767274432 : Rat) / 1162780221153193) [(1, 2), (3, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 16. -/
theorem ep_Q2_024_partial_16_0101_valid :
    mulPoly ep_Q2_024_coefficient_16_0101
        ep_Q2_024_generator_16_0100_0199 =
      ep_Q2_024_partial_16_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0102 : Poly :=
[
  term ((139330115741603796400697706988737032183292881427306533069 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(1, 2), (13, 1), (15, 1)]
]

/-- Partial product 102 for generator 16. -/
def ep_Q2_024_partial_16_0102 : Poly :=
[
  term ((139330115741603796400697706988737032183292881427306533069 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(1, 2), (2, 1), (6, 1), (13, 1), (15, 1)],
  term ((-139330115741603796400697706988737032183292881427306533069 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(1, 2), (2, 2), (13, 1), (15, 1)],
  term ((139330115741603796400697706988737032183292881427306533069 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(1, 2), (3, 1), (7, 1), (13, 1), (15, 1)],
  term ((-139330115741603796400697706988737032183292881427306533069 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(1, 2), (3, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 16. -/
theorem ep_Q2_024_partial_16_0102_valid :
    mulPoly ep_Q2_024_coefficient_16_0102
        ep_Q2_024_generator_16_0100_0199 =
      ep_Q2_024_partial_16_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0103 : Poly :=
[
  term ((4642662710302105 : Rat) / 3488340663459579) [(1, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 103 for generator 16. -/
def ep_Q2_024_partial_16_0103 : Poly :=
[
  term ((9285325420604210 : Rat) / 3488340663459579) [(1, 2), (2, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4642662710302105 : Rat) / 3488340663459579) [(1, 2), (2, 2), (13, 1), (15, 1), (16, 1)],
  term ((9285325420604210 : Rat) / 3488340663459579) [(1, 2), (3, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4642662710302105 : Rat) / 3488340663459579) [(1, 2), (3, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 16. -/
theorem ep_Q2_024_partial_16_0103_valid :
    mulPoly ep_Q2_024_coefficient_16_0103
        ep_Q2_024_generator_16_0100_0199 =
      ep_Q2_024_partial_16_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0104 : Poly :=
[
  term ((-17936041456239758391614171588491397012 : Rat) / 30501087900062982116102377831259472915) [(1, 2), (13, 2)]
]

/-- Partial product 104 for generator 16. -/
def ep_Q2_024_partial_16_0104 : Poly :=
[
  term ((-35872082912479516783228343176982794024 : Rat) / 30501087900062982116102377831259472915) [(1, 2), (2, 1), (6, 1), (13, 2)],
  term ((17936041456239758391614171588491397012 : Rat) / 30501087900062982116102377831259472915) [(1, 2), (2, 2), (13, 2)],
  term ((-35872082912479516783228343176982794024 : Rat) / 30501087900062982116102377831259472915) [(1, 2), (3, 1), (7, 1), (13, 2)],
  term ((17936041456239758391614171588491397012 : Rat) / 30501087900062982116102377831259472915) [(1, 2), (3, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 16. -/
theorem ep_Q2_024_partial_16_0104_valid :
    mulPoly ep_Q2_024_coefficient_16_0104
        ep_Q2_024_generator_16_0100_0199 =
      ep_Q2_024_partial_16_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0105 : Poly :=
[
  term ((475007208941031827388701847852448118437 : Rat) / 1799564186103715944850040292044308901985) [(1, 2), (14, 1)]
]

/-- Partial product 105 for generator 16. -/
def ep_Q2_024_partial_16_0105 : Poly :=
[
  term ((950014417882063654777403695704896236874 : Rat) / 1799564186103715944850040292044308901985) [(1, 2), (2, 1), (6, 1), (14, 1)],
  term ((-475007208941031827388701847852448118437 : Rat) / 1799564186103715944850040292044308901985) [(1, 2), (2, 2), (14, 1)],
  term ((950014417882063654777403695704896236874 : Rat) / 1799564186103715944850040292044308901985) [(1, 2), (3, 1), (7, 1), (14, 1)],
  term ((-475007208941031827388701847852448118437 : Rat) / 1799564186103715944850040292044308901985) [(1, 2), (3, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 16. -/
theorem ep_Q2_024_partial_16_0105_valid :
    mulPoly ep_Q2_024_coefficient_16_0105
        ep_Q2_024_generator_16_0100_0199 =
      ep_Q2_024_partial_16_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0106 : Poly :=
[
  term ((-48149040762380605957283223708949530656612384923649674829 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(1, 2), (15, 2)]
]

/-- Partial product 106 for generator 16. -/
def ep_Q2_024_partial_16_0106 : Poly :=
[
  term ((-48149040762380605957283223708949530656612384923649674829 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(1, 2), (2, 1), (6, 1), (15, 2)],
  term ((48149040762380605957283223708949530656612384923649674829 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(1, 2), (2, 2), (15, 2)],
  term ((-48149040762380605957283223708949530656612384923649674829 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(1, 2), (3, 1), (7, 1), (15, 2)],
  term ((48149040762380605957283223708949530656612384923649674829 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(1, 2), (3, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 16. -/
theorem ep_Q2_024_partial_16_0106_valid :
    mulPoly ep_Q2_024_coefficient_16_0106
        ep_Q2_024_generator_16_0100_0199 =
      ep_Q2_024_partial_16_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0107 : Poly :=
[
  term ((-4066964546991649 : Rat) / 3488340663459579) [(1, 2), (15, 2), (16, 1)]
]

/-- Partial product 107 for generator 16. -/
def ep_Q2_024_partial_16_0107 : Poly :=
[
  term ((-8133929093983298 : Rat) / 3488340663459579) [(1, 2), (2, 1), (6, 1), (15, 2), (16, 1)],
  term ((4066964546991649 : Rat) / 3488340663459579) [(1, 2), (2, 2), (15, 2), (16, 1)],
  term ((-8133929093983298 : Rat) / 3488340663459579) [(1, 2), (3, 1), (7, 1), (15, 2), (16, 1)],
  term ((4066964546991649 : Rat) / 3488340663459579) [(1, 2), (3, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 16. -/
theorem ep_Q2_024_partial_16_0107_valid :
    mulPoly ep_Q2_024_coefficient_16_0107
        ep_Q2_024_generator_16_0100_0199 =
      ep_Q2_024_partial_16_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0108 : Poly :=
[
  term ((-27397387055121972092483812732500414869 : Rat) / 39990315246749243218889784267651308933) [(2, 1)]
]

/-- Partial product 108 for generator 16. -/
def ep_Q2_024_partial_16_0108 : Poly :=
[
  term ((-54794774110243944184967625465000829738 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (3, 1), (7, 1)],
  term ((27397387055121972092483812732500414869 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (3, 2)],
  term ((-54794774110243944184967625465000829738 : Rat) / 39990315246749243218889784267651308933) [(2, 2), (6, 1)],
  term ((27397387055121972092483812732500414869 : Rat) / 39990315246749243218889784267651308933) [(2, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 16. -/
theorem ep_Q2_024_partial_16_0108_valid :
    mulPoly ep_Q2_024_coefficient_16_0108
        ep_Q2_024_generator_16_0100_0199 =
      ep_Q2_024_partial_16_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0109 : Poly :=
[
  term ((4281089153612859170931146538257430160 : Rat) / 119970945740247729656669352802953926799) [(2, 1), (3, 1), (9, 1)]
]

/-- Partial product 109 for generator 16. -/
def ep_Q2_024_partial_16_0109 : Poly :=
[
  term ((8562178307225718341862293076514860320 : Rat) / 119970945740247729656669352802953926799) [(2, 1), (3, 2), (7, 1), (9, 1)],
  term ((-4281089153612859170931146538257430160 : Rat) / 119970945740247729656669352802953926799) [(2, 1), (3, 3), (9, 1)],
  term ((8562178307225718341862293076514860320 : Rat) / 119970945740247729656669352802953926799) [(2, 2), (3, 1), (6, 1), (9, 1)],
  term ((-4281089153612859170931146538257430160 : Rat) / 119970945740247729656669352802953926799) [(2, 3), (3, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 16. -/
theorem ep_Q2_024_partial_16_0109_valid :
    mulPoly ep_Q2_024_coefficient_16_0109
        ep_Q2_024_generator_16_0100_0199 =
      ep_Q2_024_partial_16_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0110 : Poly :=
[
  term ((-16890983628896808743407603036576568848 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (5, 1), (9, 1)]
]

/-- Partial product 110 for generator 16. -/
def ep_Q2_024_partial_16_0110 : Poly :=
[
  term ((-33781967257793617486815206073153137696 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (3, 1), (5, 1), (7, 1), (9, 1)],
  term ((16890983628896808743407603036576568848 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (3, 2), (5, 1), (9, 1)],
  term ((-33781967257793617486815206073153137696 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (5, 1), (6, 1), (9, 1)],
  term ((16890983628896808743407603036576568848 : Rat) / 199951576233746216094448921338256544665) [(2, 3), (5, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 16. -/
theorem ep_Q2_024_partial_16_0110_valid :
    mulPoly ep_Q2_024_coefficient_16_0110
        ep_Q2_024_generator_16_0100_0199 =
      ep_Q2_024_partial_16_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0111 : Poly :=
[
  term ((-20220074797511964466058292860462341536 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (5, 1), (13, 1)]
]

/-- Partial product 111 for generator 16. -/
def ep_Q2_024_partial_16_0111 : Poly :=
[
  term ((-40440149595023928932116585720924683072 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (3, 1), (5, 1), (7, 1), (13, 1)],
  term ((20220074797511964466058292860462341536 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (3, 2), (5, 1), (13, 1)],
  term ((-40440149595023928932116585720924683072 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (5, 1), (6, 1), (13, 1)],
  term ((20220074797511964466058292860462341536 : Rat) / 199951576233746216094448921338256544665) [(2, 3), (5, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 16. -/
theorem ep_Q2_024_partial_16_0111_valid :
    mulPoly ep_Q2_024_coefficient_16_0111
        ep_Q2_024_generator_16_0100_0199 =
      ep_Q2_024_partial_16_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0112 : Poly :=
[
  term ((1086812258876365631714711692878661467835285345215957824 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 1), (5, 1), (15, 1)]
]

/-- Partial product 112 for generator 16. -/
def ep_Q2_024_partial_16_0112 : Poly :=
[
  term ((2173624517752731263429423385757322935670570690431915648 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 1), (3, 1), (5, 1), (7, 1), (15, 1)],
  term ((-1086812258876365631714711692878661467835285345215957824 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 1), (3, 2), (5, 1), (15, 1)],
  term ((2173624517752731263429423385757322935670570690431915648 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 2), (5, 1), (6, 1), (15, 1)],
  term ((-1086812258876365631714711692878661467835285345215957824 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 3), (5, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 16. -/
theorem ep_Q2_024_partial_16_0112_valid :
    mulPoly ep_Q2_024_coefficient_16_0112
        ep_Q2_024_generator_16_0100_0199 =
      ep_Q2_024_partial_16_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0113 : Poly :=
[
  term ((103470768511616 : Rat) / 1162780221153193) [(2, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 113 for generator 16. -/
def ep_Q2_024_partial_16_0113 : Poly :=
[
  term ((206941537023232 : Rat) / 1162780221153193) [(2, 1), (3, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-103470768511616 : Rat) / 1162780221153193) [(2, 1), (3, 2), (5, 1), (15, 1), (16, 1)],
  term ((206941537023232 : Rat) / 1162780221153193) [(2, 2), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-103470768511616 : Rat) / 1162780221153193) [(2, 3), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 16. -/
theorem ep_Q2_024_partial_16_0113_valid :
    mulPoly ep_Q2_024_coefficient_16_0113
        ep_Q2_024_generator_16_0100_0199 =
      ep_Q2_024_partial_16_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0114 : Poly :=
[
  term ((-94436394451067046656060653807328597532 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (7, 1), (9, 1)]
]

/-- Partial product 114 for generator 16. -/
def ep_Q2_024_partial_16_0114 : Poly :=
[
  term ((-188872788902134093312121307614657195064 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (3, 1), (7, 2), (9, 1)],
  term ((94436394451067046656060653807328597532 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (3, 2), (7, 1), (9, 1)],
  term ((-188872788902134093312121307614657195064 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (6, 1), (7, 1), (9, 1)],
  term ((94436394451067046656060653807328597532 : Rat) / 199951576233746216094448921338256544665) [(2, 3), (7, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 16. -/
theorem ep_Q2_024_partial_16_0114_valid :
    mulPoly ep_Q2_024_coefficient_16_0114
        ep_Q2_024_generator_16_0100_0199 =
      ep_Q2_024_partial_16_0114 := by
  native_decide

/-- Coefficient term 115 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0115 : Poly :=
[
  term ((-1077277655786558224075185495810441573248 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (7, 1), (13, 1)]
]

/-- Partial product 115 for generator 16. -/
def ep_Q2_024_partial_16_0115 : Poly :=
[
  term ((-2154555311573116448150370991620883146496 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (3, 1), (7, 2), (13, 1)],
  term ((1077277655786558224075185495810441573248 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (3, 2), (7, 1), (13, 1)],
  term ((-2154555311573116448150370991620883146496 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (6, 1), (7, 1), (13, 1)],
  term ((1077277655786558224075185495810441573248 : Rat) / 599854728701238648283346764014769633995) [(2, 3), (7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 115 for generator 16. -/
theorem ep_Q2_024_partial_16_0115_valid :
    mulPoly ep_Q2_024_coefficient_16_0115
        ep_Q2_024_generator_16_0100_0199 =
      ep_Q2_024_partial_16_0115 := by
  native_decide

/-- Coefficient term 116 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0116 : Poly :=
[
  term ((-37050814747583503133753456969502764146050338642007357993 : Rat) / 929998952132019818504773430836265897467346423247461380) [(2, 1), (7, 1), (15, 1)]
]

/-- Partial product 116 for generator 16. -/
def ep_Q2_024_partial_16_0116 : Poly :=
[
  term ((-37050814747583503133753456969502764146050338642007357993 : Rat) / 464999476066009909252386715418132948733673211623730690) [(2, 1), (3, 1), (7, 2), (15, 1)],
  term ((37050814747583503133753456969502764146050338642007357993 : Rat) / 929998952132019818504773430836265897467346423247461380) [(2, 1), (3, 2), (7, 1), (15, 1)],
  term ((-37050814747583503133753456969502764146050338642007357993 : Rat) / 464999476066009909252386715418132948733673211623730690) [(2, 2), (6, 1), (7, 1), (15, 1)],
  term ((37050814747583503133753456969502764146050338642007357993 : Rat) / 929998952132019818504773430836265897467346423247461380) [(2, 3), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 116 for generator 16. -/
theorem ep_Q2_024_partial_16_0116_valid :
    mulPoly ep_Q2_024_coefficient_16_0116
        ep_Q2_024_generator_16_0100_0199 =
      ep_Q2_024_partial_16_0116 := by
  native_decide

/-- Coefficient term 117 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0117 : Poly :=
[
  term ((5146839986298265 : Rat) / 1162780221153193) [(2, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 117 for generator 16. -/
def ep_Q2_024_partial_16_0117 : Poly :=
[
  term ((10293679972596530 : Rat) / 1162780221153193) [(2, 1), (3, 1), (7, 2), (15, 1), (16, 1)],
  term ((-5146839986298265 : Rat) / 1162780221153193) [(2, 1), (3, 2), (7, 1), (15, 1), (16, 1)],
  term ((10293679972596530 : Rat) / 1162780221153193) [(2, 2), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-5146839986298265 : Rat) / 1162780221153193) [(2, 3), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 117 for generator 16. -/
theorem ep_Q2_024_partial_16_0117_valid :
    mulPoly ep_Q2_024_coefficient_16_0117
        ep_Q2_024_generator_16_0100_0199 =
      ep_Q2_024_partial_16_0117 := by
  native_decide

/-- Coefficient term 118 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0118 : Poly :=
[
  term ((-49794017268134571589590260644228965512 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (9, 1), (12, 1), (13, 1)]
]

/-- Partial product 118 for generator 16. -/
def ep_Q2_024_partial_16_0118 : Poly :=
[
  term ((-99588034536269143179180521288457931024 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (3, 1), (7, 1), (9, 1), (12, 1), (13, 1)],
  term ((49794017268134571589590260644228965512 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (3, 2), (9, 1), (12, 1), (13, 1)],
  term ((-99588034536269143179180521288457931024 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (6, 1), (9, 1), (12, 1), (13, 1)],
  term ((49794017268134571589590260644228965512 : Rat) / 199951576233746216094448921338256544665) [(2, 3), (9, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 118 for generator 16. -/
theorem ep_Q2_024_partial_16_0118_valid :
    mulPoly ep_Q2_024_coefficient_16_0118
        ep_Q2_024_generator_16_0100_0199 =
      ep_Q2_024_partial_16_0118 := by
  native_decide

/-- Coefficient term 119 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0119 : Poly :=
[
  term ((550464729340465184219154740052350989658090880526284951 : Rat) / 92999895213201981850477343083626589746734642324746138) [(2, 1), (9, 1), (12, 1), (15, 1)]
]

/-- Partial product 119 for generator 16. -/
def ep_Q2_024_partial_16_0119 : Poly :=
[
  term ((550464729340465184219154740052350989658090880526284951 : Rat) / 46499947606600990925238671541813294873367321162373069) [(2, 1), (3, 1), (7, 1), (9, 1), (12, 1), (15, 1)],
  term ((-550464729340465184219154740052350989658090880526284951 : Rat) / 92999895213201981850477343083626589746734642324746138) [(2, 1), (3, 2), (9, 1), (12, 1), (15, 1)],
  term ((550464729340465184219154740052350989658090880526284951 : Rat) / 46499947606600990925238671541813294873367321162373069) [(2, 2), (6, 1), (9, 1), (12, 1), (15, 1)],
  term ((-550464729340465184219154740052350989658090880526284951 : Rat) / 92999895213201981850477343083626589746734642324746138) [(2, 3), (9, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 119 for generator 16. -/
theorem ep_Q2_024_partial_16_0119_valid :
    mulPoly ep_Q2_024_coefficient_16_0119
        ep_Q2_024_generator_16_0100_0199 =
      ep_Q2_024_partial_16_0119 := by
  native_decide

/-- Coefficient term 120 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0120 : Poly :=
[
  term ((-1303385041578966 : Rat) / 1162780221153193) [(2, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 120 for generator 16. -/
def ep_Q2_024_partial_16_0120 : Poly :=
[
  term ((-2606770083157932 : Rat) / 1162780221153193) [(2, 1), (3, 1), (7, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((1303385041578966 : Rat) / 1162780221153193) [(2, 1), (3, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2606770083157932 : Rat) / 1162780221153193) [(2, 2), (6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((1303385041578966 : Rat) / 1162780221153193) [(2, 3), (9, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 120 for generator 16. -/
theorem ep_Q2_024_partial_16_0120_valid :
    mulPoly ep_Q2_024_coefficient_16_0120
        ep_Q2_024_generator_16_0100_0199 =
      ep_Q2_024_partial_16_0120 := by
  native_decide

/-- Coefficient term 121 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0121 : Poly :=
[
  term ((2456716043408319756723570458941565219668 : Rat) / 1799564186103715944850040292044308901985) [(2, 1), (9, 1), (13, 1)]
]

/-- Partial product 121 for generator 16. -/
def ep_Q2_024_partial_16_0121 : Poly :=
[
  term ((4913432086816639513447140917883130439336 : Rat) / 1799564186103715944850040292044308901985) [(2, 1), (3, 1), (7, 1), (9, 1), (13, 1)],
  term ((-2456716043408319756723570458941565219668 : Rat) / 1799564186103715944850040292044308901985) [(2, 1), (3, 2), (9, 1), (13, 1)],
  term ((4913432086816639513447140917883130439336 : Rat) / 1799564186103715944850040292044308901985) [(2, 2), (6, 1), (9, 1), (13, 1)],
  term ((-2456716043408319756723570458941565219668 : Rat) / 1799564186103715944850040292044308901985) [(2, 3), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 121 for generator 16. -/
theorem ep_Q2_024_partial_16_0121_valid :
    mulPoly ep_Q2_024_coefficient_16_0121
        ep_Q2_024_generator_16_0100_0199 =
      ep_Q2_024_partial_16_0121 := by
  native_decide

/-- Coefficient term 122 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0122 : Poly :=
[
  term ((1332660221722390369768035740007759937168019429542401749 : Rat) / 557999371279211891102864058501759538480407853948476828) [(2, 1), (9, 1), (15, 1)]
]

/-- Partial product 122 for generator 16. -/
def ep_Q2_024_partial_16_0122 : Poly :=
[
  term ((1332660221722390369768035740007759937168019429542401749 : Rat) / 278999685639605945551432029250879769240203926974238414) [(2, 1), (3, 1), (7, 1), (9, 1), (15, 1)],
  term ((-1332660221722390369768035740007759937168019429542401749 : Rat) / 557999371279211891102864058501759538480407853948476828) [(2, 1), (3, 2), (9, 1), (15, 1)],
  term ((1332660221722390369768035740007759937168019429542401749 : Rat) / 278999685639605945551432029250879769240203926974238414) [(2, 2), (6, 1), (9, 1), (15, 1)],
  term ((-1332660221722390369768035740007759937168019429542401749 : Rat) / 557999371279211891102864058501759538480407853948476828) [(2, 3), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 122 for generator 16. -/
theorem ep_Q2_024_partial_16_0122_valid :
    mulPoly ep_Q2_024_coefficient_16_0122
        ep_Q2_024_generator_16_0100_0199 =
      ep_Q2_024_partial_16_0122 := by
  native_decide

/-- Coefficient term 123 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0123 : Poly :=
[
  term ((1276613481018839 : Rat) / 3488340663459579) [(2, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 123 for generator 16. -/
def ep_Q2_024_partial_16_0123 : Poly :=
[
  term ((2553226962037678 : Rat) / 3488340663459579) [(2, 1), (3, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-1276613481018839 : Rat) / 3488340663459579) [(2, 1), (3, 2), (9, 1), (15, 1), (16, 1)],
  term ((2553226962037678 : Rat) / 3488340663459579) [(2, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-1276613481018839 : Rat) / 3488340663459579) [(2, 3), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 123 for generator 16. -/
theorem ep_Q2_024_partial_16_0123_valid :
    mulPoly ep_Q2_024_coefficient_16_0123
        ep_Q2_024_generator_16_0100_0199 =
      ep_Q2_024_partial_16_0123 := by
  native_decide

/-- Coefficient term 124 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0124 : Poly :=
[
  term ((260035784543783065491570442772842309720 : Rat) / 119970945740247729656669352802953926799) [(2, 1), (9, 2)]
]

/-- Partial product 124 for generator 16. -/
def ep_Q2_024_partial_16_0124 : Poly :=
[
  term ((520071569087566130983140885545684619440 : Rat) / 119970945740247729656669352802953926799) [(2, 1), (3, 1), (7, 1), (9, 2)],
  term ((-260035784543783065491570442772842309720 : Rat) / 119970945740247729656669352802953926799) [(2, 1), (3, 2), (9, 2)],
  term ((520071569087566130983140885545684619440 : Rat) / 119970945740247729656669352802953926799) [(2, 2), (6, 1), (9, 2)],
  term ((-260035784543783065491570442772842309720 : Rat) / 119970945740247729656669352802953926799) [(2, 3), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 124 for generator 16. -/
theorem ep_Q2_024_partial_16_0124_valid :
    mulPoly ep_Q2_024_coefficient_16_0124
        ep_Q2_024_generator_16_0100_0199 =
      ep_Q2_024_partial_16_0124 := by
  native_decide

/-- Coefficient term 125 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0125 : Poly :=
[
  term ((-1070272288403214792732786634564357540 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (12, 1)]
]

/-- Partial product 125 for generator 16. -/
def ep_Q2_024_partial_16_0125 : Poly :=
[
  term ((-2140544576806429585465573269128715080 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (3, 1), (7, 1), (12, 1)],
  term ((1070272288403214792732786634564357540 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (3, 2), (12, 1)],
  term ((-2140544576806429585465573269128715080 : Rat) / 39990315246749243218889784267651308933) [(2, 2), (6, 1), (12, 1)],
  term ((1070272288403214792732786634564357540 : Rat) / 39990315246749243218889784267651308933) [(2, 3), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 125 for generator 16. -/
theorem ep_Q2_024_partial_16_0125_valid :
    mulPoly ep_Q2_024_coefficient_16_0125
        ep_Q2_024_generator_16_0100_0199 =
      ep_Q2_024_partial_16_0125 := by
  native_decide

/-- Coefficient term 126 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0126 : Poly :=
[
  term ((-5752536982199761423124935523247869048926344288525960482 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 1), (13, 1), (15, 1)]
]

/-- Partial product 126 for generator 16. -/
def ep_Q2_024_partial_16_0126 : Poly :=
[
  term ((-11505073964399522846249871046495738097852688577051920964 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 1), (3, 1), (7, 1), (13, 1), (15, 1)],
  term ((5752536982199761423124935523247869048926344288525960482 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 1), (3, 2), (13, 1), (15, 1)],
  term ((-11505073964399522846249871046495738097852688577051920964 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 2), (6, 1), (13, 1), (15, 1)],
  term ((5752536982199761423124935523247869048926344288525960482 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 126 for generator 16. -/
theorem ep_Q2_024_partial_16_0126_valid :
    mulPoly ep_Q2_024_coefficient_16_0126
        ep_Q2_024_generator_16_0100_0199 =
      ep_Q2_024_partial_16_0126 := by
  native_decide

/-- Coefficient term 127 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0127 : Poly :=
[
  term ((75330592794360 : Rat) / 1162780221153193) [(2, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 127 for generator 16. -/
def ep_Q2_024_partial_16_0127 : Poly :=
[
  term ((150661185588720 : Rat) / 1162780221153193) [(2, 1), (3, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-75330592794360 : Rat) / 1162780221153193) [(2, 1), (3, 2), (13, 1), (15, 1), (16, 1)],
  term ((150661185588720 : Rat) / 1162780221153193) [(2, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-75330592794360 : Rat) / 1162780221153193) [(2, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 127 for generator 16. -/
theorem ep_Q2_024_partial_16_0127_valid :
    mulPoly ep_Q2_024_coefficient_16_0127
        ep_Q2_024_generator_16_0100_0199 =
      ep_Q2_024_partial_16_0127 := by
  native_decide

/-- Coefficient term 128 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0128 : Poly :=
[
  term ((40472928056033817116049120031239046672 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (13, 2)]
]

/-- Partial product 128 for generator 16. -/
def ep_Q2_024_partial_16_0128 : Poly :=
[
  term ((80945856112067634232098240062478093344 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (3, 1), (7, 1), (13, 2)],
  term ((-40472928056033817116049120031239046672 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (3, 2), (13, 2)],
  term ((80945856112067634232098240062478093344 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (6, 1), (13, 2)],
  term ((-40472928056033817116049120031239046672 : Rat) / 599854728701238648283346764014769633995) [(2, 3), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 128 for generator 16. -/
theorem ep_Q2_024_partial_16_0128_valid :
    mulPoly ep_Q2_024_coefficient_16_0128
        ep_Q2_024_generator_16_0100_0199 =
      ep_Q2_024_partial_16_0128 := by
  native_decide

/-- Coefficient term 129 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0129 : Poly :=
[
  term ((8921151527862041881559355605928391576 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (14, 1)]
]

/-- Partial product 129 for generator 16. -/
def ep_Q2_024_partial_16_0129 : Poly :=
[
  term ((17842303055724083763118711211856783152 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (3, 1), (7, 1), (14, 1)],
  term ((-8921151527862041881559355605928391576 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (3, 2), (14, 1)],
  term ((17842303055724083763118711211856783152 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (6, 1), (14, 1)],
  term ((-8921151527862041881559355605928391576 : Rat) / 199951576233746216094448921338256544665) [(2, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 129 for generator 16. -/
theorem ep_Q2_024_partial_16_0129_valid :
    mulPoly ep_Q2_024_coefficient_16_0129
        ep_Q2_024_generator_16_0100_0199 =
      ep_Q2_024_partial_16_0129 := by
  native_decide

/-- Coefficient term 130 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0130 : Poly :=
[
  term ((5633709133854896624680034347401390035670218004313073105 : Rat) / 278999685639605945551432029250879769240203926974238414) [(2, 1), (15, 2)]
]

/-- Partial product 130 for generator 16. -/
def ep_Q2_024_partial_16_0130 : Poly :=
[
  term ((5633709133854896624680034347401390035670218004313073105 : Rat) / 139499842819802972775716014625439884620101963487119207) [(2, 1), (3, 1), (7, 1), (15, 2)],
  term ((-5633709133854896624680034347401390035670218004313073105 : Rat) / 278999685639605945551432029250879769240203926974238414) [(2, 1), (3, 2), (15, 2)],
  term ((5633709133854896624680034347401390035670218004313073105 : Rat) / 139499842819802972775716014625439884620101963487119207) [(2, 2), (6, 1), (15, 2)],
  term ((-5633709133854896624680034347401390035670218004313073105 : Rat) / 278999685639605945551432029250879769240203926974238414) [(2, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 130 for generator 16. -/
theorem ep_Q2_024_partial_16_0130_valid :
    mulPoly ep_Q2_024_coefficient_16_0130
        ep_Q2_024_generator_16_0100_0199 =
      ep_Q2_024_partial_16_0130 := by
  native_decide

/-- Coefficient term 131 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0131 : Poly :=
[
  term ((-2131658198001102 : Rat) / 1162780221153193) [(2, 1), (15, 2), (16, 1)]
]

/-- Partial product 131 for generator 16. -/
def ep_Q2_024_partial_16_0131 : Poly :=
[
  term ((-4263316396002204 : Rat) / 1162780221153193) [(2, 1), (3, 1), (7, 1), (15, 2), (16, 1)],
  term ((2131658198001102 : Rat) / 1162780221153193) [(2, 1), (3, 2), (15, 2), (16, 1)],
  term ((-4263316396002204 : Rat) / 1162780221153193) [(2, 2), (6, 1), (15, 2), (16, 1)],
  term ((2131658198001102 : Rat) / 1162780221153193) [(2, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 131 for generator 16. -/
theorem ep_Q2_024_partial_16_0131_valid :
    mulPoly ep_Q2_024_coefficient_16_0131
        ep_Q2_024_generator_16_0100_0199 =
      ep_Q2_024_partial_16_0131 := by
  native_decide

/-- Coefficient term 132 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0132 : Poly :=
[
  term ((-2930149234713651113130679487801312091016 : Rat) / 1799564186103715944850040292044308901985) [(3, 1), (4, 1), (9, 1)]
]

/-- Partial product 132 for generator 16. -/
def ep_Q2_024_partial_16_0132 : Poly :=
[
  term ((-5860298469427302226261358975602624182032 : Rat) / 1799564186103715944850040292044308901985) [(2, 1), (3, 1), (4, 1), (6, 1), (9, 1)],
  term ((2930149234713651113130679487801312091016 : Rat) / 1799564186103715944850040292044308901985) [(2, 2), (3, 1), (4, 1), (9, 1)],
  term ((-5860298469427302226261358975602624182032 : Rat) / 1799564186103715944850040292044308901985) [(3, 2), (4, 1), (7, 1), (9, 1)],
  term ((2930149234713651113130679487801312091016 : Rat) / 1799564186103715944850040292044308901985) [(3, 3), (4, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 132 for generator 16. -/
theorem ep_Q2_024_partial_16_0132_valid :
    mulPoly ep_Q2_024_coefficient_16_0132
        ep_Q2_024_generator_16_0100_0199 =
      ep_Q2_024_partial_16_0132 := by
  native_decide

/-- Coefficient term 133 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0133 : Poly :=
[
  term ((33781967257793617486815206073153137696 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (7, 1), (9, 1)]
]

/-- Partial product 133 for generator 16. -/
def ep_Q2_024_partial_16_0133 : Poly :=
[
  term ((67563934515587234973630412146306275392 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (3, 1), (5, 1), (6, 1), (7, 1), (9, 1)],
  term ((-33781967257793617486815206073153137696 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (3, 1), (5, 1), (7, 1), (9, 1)],
  term ((67563934515587234973630412146306275392 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (5, 1), (7, 2), (9, 1)],
  term ((-33781967257793617486815206073153137696 : Rat) / 199951576233746216094448921338256544665) [(3, 3), (5, 1), (7, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 133 for generator 16. -/
theorem ep_Q2_024_partial_16_0133_valid :
    mulPoly ep_Q2_024_coefficient_16_0133
        ep_Q2_024_generator_16_0100_0199 =
      ep_Q2_024_partial_16_0133 := by
  native_decide

/-- Coefficient term 134 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0134 : Poly :=
[
  term ((40440149595023928932116585720924683072 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (7, 1), (13, 1)]
]

/-- Partial product 134 for generator 16. -/
def ep_Q2_024_partial_16_0134 : Poly :=
[
  term ((80880299190047857864233171441849366144 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (3, 1), (5, 1), (6, 1), (7, 1), (13, 1)],
  term ((-40440149595023928932116585720924683072 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (3, 1), (5, 1), (7, 1), (13, 1)],
  term ((80880299190047857864233171441849366144 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (5, 1), (7, 2), (13, 1)],
  term ((-40440149595023928932116585720924683072 : Rat) / 199951576233746216094448921338256544665) [(3, 3), (5, 1), (7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 134 for generator 16. -/
theorem ep_Q2_024_partial_16_0134_valid :
    mulPoly ep_Q2_024_coefficient_16_0134
        ep_Q2_024_generator_16_0100_0199 =
      ep_Q2_024_partial_16_0134 := by
  native_decide

/-- Coefficient term 135 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0135 : Poly :=
[
  term ((-2173624517752731263429423385757322935670570690431915648 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (5, 1), (7, 1), (15, 1)]
]

/-- Partial product 135 for generator 16. -/
def ep_Q2_024_partial_16_0135 : Poly :=
[
  term ((-4347249035505462526858846771514645871341141380863831296 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 1), (3, 1), (5, 1), (6, 1), (7, 1), (15, 1)],
  term ((2173624517752731263429423385757322935670570690431915648 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 2), (3, 1), (5, 1), (7, 1), (15, 1)],
  term ((-4347249035505462526858846771514645871341141380863831296 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 2), (5, 1), (7, 2), (15, 1)],
  term ((2173624517752731263429423385757322935670570690431915648 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 3), (5, 1), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 135 for generator 16. -/
theorem ep_Q2_024_partial_16_0135_valid :
    mulPoly ep_Q2_024_coefficient_16_0135
        ep_Q2_024_generator_16_0100_0199 =
      ep_Q2_024_partial_16_0135 := by
  native_decide

/-- Coefficient term 136 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0136 : Poly :=
[
  term ((-206941537023232 : Rat) / 1162780221153193) [(3, 1), (5, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 136 for generator 16. -/
def ep_Q2_024_partial_16_0136 : Poly :=
[
  term ((-413883074046464 : Rat) / 1162780221153193) [(2, 1), (3, 1), (5, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((206941537023232 : Rat) / 1162780221153193) [(2, 2), (3, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-413883074046464 : Rat) / 1162780221153193) [(3, 2), (5, 1), (7, 2), (15, 1), (16, 1)],
  term ((206941537023232 : Rat) / 1162780221153193) [(3, 3), (5, 1), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 136 for generator 16. -/
theorem ep_Q2_024_partial_16_0136_valid :
    mulPoly ep_Q2_024_coefficient_16_0136
        ep_Q2_024_generator_16_0100_0199 =
      ep_Q2_024_partial_16_0136 := by
  native_decide

/-- Coefficient term 137 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0137 : Poly :=
[
  term ((-3082928476586153890712559966648414688 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (5, 1), (9, 1), (13, 1)]
]

/-- Partial product 137 for generator 16. -/
def ep_Q2_024_partial_16_0137 : Poly :=
[
  term ((-6165856953172307781425119933296829376 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (3, 1), (5, 1), (6, 1), (9, 1), (13, 1)],
  term ((3082928476586153890712559966648414688 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (3, 1), (5, 1), (9, 1), (13, 1)],
  term ((-6165856953172307781425119933296829376 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (5, 1), (7, 1), (9, 1), (13, 1)],
  term ((3082928476586153890712559966648414688 : Rat) / 599854728701238648283346764014769633995) [(3, 3), (5, 1), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 137 for generator 16. -/
theorem ep_Q2_024_partial_16_0137_valid :
    mulPoly ep_Q2_024_coefficient_16_0137
        ep_Q2_024_generator_16_0100_0199 =
      ep_Q2_024_partial_16_0137 := by
  native_decide

/-- Coefficient term 138 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0138 : Poly :=
[
  term ((-3319869963774812909052232810846149293107172472347692792 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (5, 1), (9, 1), (15, 1)]
]

/-- Partial product 138 for generator 16. -/
def ep_Q2_024_partial_16_0138 : Poly :=
[
  term ((-6639739927549625818104465621692298586214344944695385584 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 1), (3, 1), (5, 1), (6, 1), (9, 1), (15, 1)],
  term ((3319869963774812909052232810846149293107172472347692792 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 2), (3, 1), (5, 1), (9, 1), (15, 1)],
  term ((-6639739927549625818104465621692298586214344944695385584 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 2), (5, 1), (7, 1), (9, 1), (15, 1)],
  term ((3319869963774812909052232810846149293107172472347692792 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 3), (5, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 138 for generator 16. -/
theorem ep_Q2_024_partial_16_0138_valid :
    mulPoly ep_Q2_024_coefficient_16_0138
        ep_Q2_024_generator_16_0100_0199 =
      ep_Q2_024_partial_16_0138 := by
  native_decide

/-- Coefficient term 139 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0139 : Poly :=
[
  term ((1243911894777184 : Rat) / 3488340663459579) [(3, 1), (5, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 139 for generator 16. -/
def ep_Q2_024_partial_16_0139 : Poly :=
[
  term ((2487823789554368 : Rat) / 3488340663459579) [(2, 1), (3, 1), (5, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-1243911894777184 : Rat) / 3488340663459579) [(2, 2), (3, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((2487823789554368 : Rat) / 3488340663459579) [(3, 2), (5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-1243911894777184 : Rat) / 3488340663459579) [(3, 3), (5, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 139 for generator 16. -/
theorem ep_Q2_024_partial_16_0139_valid :
    mulPoly ep_Q2_024_coefficient_16_0139
        ep_Q2_024_generator_16_0100_0199 =
      ep_Q2_024_partial_16_0139 := by
  native_decide

/-- Coefficient term 140 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0140 : Poly :=
[
  term ((16890983628896808743407603036576568848 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (5, 1), (9, 2)]
]

/-- Partial product 140 for generator 16. -/
def ep_Q2_024_partial_16_0140 : Poly :=
[
  term ((33781967257793617486815206073153137696 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (3, 1), (5, 1), (6, 1), (9, 2)],
  term ((-16890983628896808743407603036576568848 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (3, 1), (5, 1), (9, 2)],
  term ((33781967257793617486815206073153137696 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (5, 1), (7, 1), (9, 2)],
  term ((-16890983628896808743407603036576568848 : Rat) / 599854728701238648283346764014769633995) [(3, 3), (5, 1), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 140 for generator 16. -/
theorem ep_Q2_024_partial_16_0140_valid :
    mulPoly ep_Q2_024_coefficient_16_0140
        ep_Q2_024_generator_16_0100_0199 =
      ep_Q2_024_partial_16_0140 := by
  native_decide

/-- Coefficient term 141 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0141 : Poly :=
[
  term ((56935318687050373770433198734129544818 : Rat) / 39990315246749243218889784267651308933) [(3, 1), (7, 1)]
]

/-- Partial product 141 for generator 16. -/
def ep_Q2_024_partial_16_0141 : Poly :=
[
  term ((113870637374100747540866397468259089636 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (3, 1), (6, 1), (7, 1)],
  term ((-56935318687050373770433198734129544818 : Rat) / 39990315246749243218889784267651308933) [(2, 2), (3, 1), (7, 1)],
  term ((113870637374100747540866397468259089636 : Rat) / 39990315246749243218889784267651308933) [(3, 2), (7, 2)],
  term ((-56935318687050373770433198734129544818 : Rat) / 39990315246749243218889784267651308933) [(3, 3), (7, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 141 for generator 16. -/
theorem ep_Q2_024_partial_16_0141_valid :
    mulPoly ep_Q2_024_coefficient_16_0141
        ep_Q2_024_generator_16_0100_0199 =
      ep_Q2_024_partial_16_0141 := by
  native_decide

/-- Coefficient term 142 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0142 : Poly :=
[
  term ((-156549602987398445852407283417014511808 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (7, 1), (9, 1), (13, 1)]
]

/-- Partial product 142 for generator 16. -/
def ep_Q2_024_partial_16_0142 : Poly :=
[
  term ((-313099205974796891704814566834029023616 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (3, 1), (6, 1), (7, 1), (9, 1), (13, 1)],
  term ((156549602987398445852407283417014511808 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (3, 1), (7, 1), (9, 1), (13, 1)],
  term ((-313099205974796891704814566834029023616 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (7, 2), (9, 1), (13, 1)],
  term ((156549602987398445852407283417014511808 : Rat) / 199951576233746216094448921338256544665) [(3, 3), (7, 1), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 142 for generator 16. -/
theorem ep_Q2_024_partial_16_0142_valid :
    mulPoly ep_Q2_024_coefficient_16_0142
        ep_Q2_024_generator_16_0100_0199 =
      ep_Q2_024_partial_16_0142 := by
  native_decide

/-- Coefficient term 143 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0143 : Poly :=
[
  term ((2449020209846403374712074673893548417307732695016543182 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (7, 1), (9, 1), (15, 1)]
]

/-- Partial product 143 for generator 16. -/
def ep_Q2_024_partial_16_0143 : Poly :=
[
  term ((4898040419692806749424149347787096834615465390033086364 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 1), (3, 1), (6, 1), (7, 1), (9, 1), (15, 1)],
  term ((-2449020209846403374712074673893548417307732695016543182 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 2), (3, 1), (7, 1), (9, 1), (15, 1)],
  term ((4898040419692806749424149347787096834615465390033086364 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 2), (7, 2), (9, 1), (15, 1)],
  term ((-2449020209846403374712074673893548417307732695016543182 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 3), (7, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 143 for generator 16. -/
theorem ep_Q2_024_partial_16_0143_valid :
    mulPoly ep_Q2_024_coefficient_16_0143
        ep_Q2_024_generator_16_0100_0199 =
      ep_Q2_024_partial_16_0143 := by
  native_decide

/-- Coefficient term 144 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0144 : Poly :=
[
  term ((-1495148449544936 : Rat) / 1162780221153193) [(3, 1), (7, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 144 for generator 16. -/
def ep_Q2_024_partial_16_0144 : Poly :=
[
  term ((-2990296899089872 : Rat) / 1162780221153193) [(2, 1), (3, 1), (6, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((1495148449544936 : Rat) / 1162780221153193) [(2, 2), (3, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-2990296899089872 : Rat) / 1162780221153193) [(3, 2), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((1495148449544936 : Rat) / 1162780221153193) [(3, 3), (7, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 144 for generator 16. -/
theorem ep_Q2_024_partial_16_0144_valid :
    mulPoly ep_Q2_024_coefficient_16_0144
        ep_Q2_024_generator_16_0100_0199 =
      ep_Q2_024_partial_16_0144 := by
  native_decide

/-- Coefficient term 145 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0145 : Poly :=
[
  term ((-126225064372939892662610287863400842112 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (7, 1), (9, 2)]
]

/-- Partial product 145 for generator 16. -/
def ep_Q2_024_partial_16_0145 : Poly :=
[
  term ((-252450128745879785325220575726801684224 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (3, 1), (6, 1), (7, 1), (9, 2)],
  term ((126225064372939892662610287863400842112 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (3, 1), (7, 1), (9, 2)],
  term ((-252450128745879785325220575726801684224 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (7, 2), (9, 2)],
  term ((126225064372939892662610287863400842112 : Rat) / 199951576233746216094448921338256544665) [(3, 3), (7, 1), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 145 for generator 16. -/
theorem ep_Q2_024_partial_16_0145_valid :
    mulPoly ep_Q2_024_coefficient_16_0145
        ep_Q2_024_generator_16_0100_0199 =
      ep_Q2_024_partial_16_0145 := by
  native_decide

/-- Coefficient term 146 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0146 : Poly :=
[
  term ((11505073964399522846249871046495738097852688577051920964 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (7, 1), (13, 1), (15, 1)]
]

/-- Partial product 146 for generator 16. -/
def ep_Q2_024_partial_16_0146 : Poly :=
[
  term ((23010147928799045692499742092991476195705377154103841928 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 1), (3, 1), (6, 1), (7, 1), (13, 1), (15, 1)],
  term ((-11505073964399522846249871046495738097852688577051920964 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 2), (3, 1), (7, 1), (13, 1), (15, 1)],
  term ((23010147928799045692499742092991476195705377154103841928 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 2), (7, 2), (13, 1), (15, 1)],
  term ((-11505073964399522846249871046495738097852688577051920964 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 3), (7, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 146 for generator 16. -/
theorem ep_Q2_024_partial_16_0146_valid :
    mulPoly ep_Q2_024_coefficient_16_0146
        ep_Q2_024_generator_16_0100_0199 =
      ep_Q2_024_partial_16_0146 := by
  native_decide

/-- Coefficient term 147 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0147 : Poly :=
[
  term ((-150661185588720 : Rat) / 1162780221153193) [(3, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 147 for generator 16. -/
def ep_Q2_024_partial_16_0147 : Poly :=
[
  term ((-301322371177440 : Rat) / 1162780221153193) [(2, 1), (3, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((150661185588720 : Rat) / 1162780221153193) [(2, 2), (3, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-301322371177440 : Rat) / 1162780221153193) [(3, 2), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((150661185588720 : Rat) / 1162780221153193) [(3, 3), (7, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 147 for generator 16. -/
theorem ep_Q2_024_partial_16_0147_valid :
    mulPoly ep_Q2_024_coefficient_16_0147
        ep_Q2_024_generator_16_0100_0199 =
      ep_Q2_024_partial_16_0147 := by
  native_decide

/-- Coefficient term 148 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0148 : Poly :=
[
  term ((-80945856112067634232098240062478093344 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (7, 1), (13, 2)]
]

/-- Partial product 148 for generator 16. -/
def ep_Q2_024_partial_16_0148 : Poly :=
[
  term ((-161891712224135268464196480124956186688 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (3, 1), (6, 1), (7, 1), (13, 2)],
  term ((80945856112067634232098240062478093344 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (3, 1), (7, 1), (13, 2)],
  term ((-161891712224135268464196480124956186688 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (7, 2), (13, 2)],
  term ((80945856112067634232098240062478093344 : Rat) / 599854728701238648283346764014769633995) [(3, 3), (7, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 148 for generator 16. -/
theorem ep_Q2_024_partial_16_0148_valid :
    mulPoly ep_Q2_024_coefficient_16_0148
        ep_Q2_024_generator_16_0100_0199 =
      ep_Q2_024_partial_16_0148 := by
  native_decide

/-- Coefficient term 149 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0149 : Poly :=
[
  term ((-17842303055724083763118711211856783152 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (7, 1), (14, 1)]
]

/-- Partial product 149 for generator 16. -/
def ep_Q2_024_partial_16_0149 : Poly :=
[
  term ((-35684606111448167526237422423713566304 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (3, 1), (6, 1), (7, 1), (14, 1)],
  term ((17842303055724083763118711211856783152 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (3, 1), (7, 1), (14, 1)],
  term ((-35684606111448167526237422423713566304 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (7, 2), (14, 1)],
  term ((17842303055724083763118711211856783152 : Rat) / 199951576233746216094448921338256544665) [(3, 3), (7, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 149 for generator 16. -/
theorem ep_Q2_024_partial_16_0149_valid :
    mulPoly ep_Q2_024_coefficient_16_0149
        ep_Q2_024_generator_16_0100_0199 =
      ep_Q2_024_partial_16_0149 := by
  native_decide

/-- Coefficient term 150 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0150 : Poly :=
[
  term ((-5633709133854896624680034347401390035670218004313073105 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 1), (7, 1), (15, 2)]
]

/-- Partial product 150 for generator 16. -/
def ep_Q2_024_partial_16_0150 : Poly :=
[
  term ((-11267418267709793249360068694802780071340436008626146210 : Rat) / 139499842819802972775716014625439884620101963487119207) [(2, 1), (3, 1), (6, 1), (7, 1), (15, 2)],
  term ((5633709133854896624680034347401390035670218004313073105 : Rat) / 139499842819802972775716014625439884620101963487119207) [(2, 2), (3, 1), (7, 1), (15, 2)],
  term ((-11267418267709793249360068694802780071340436008626146210 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 2), (7, 2), (15, 2)],
  term ((5633709133854896624680034347401390035670218004313073105 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 3), (7, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 150 for generator 16. -/
theorem ep_Q2_024_partial_16_0150_valid :
    mulPoly ep_Q2_024_coefficient_16_0150
        ep_Q2_024_generator_16_0100_0199 =
      ep_Q2_024_partial_16_0150 := by
  native_decide

/-- Coefficient term 151 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0151 : Poly :=
[
  term ((4263316396002204 : Rat) / 1162780221153193) [(3, 1), (7, 1), (15, 2), (16, 1)]
]

/-- Partial product 151 for generator 16. -/
def ep_Q2_024_partial_16_0151 : Poly :=
[
  term ((8526632792004408 : Rat) / 1162780221153193) [(2, 1), (3, 1), (6, 1), (7, 1), (15, 2), (16, 1)],
  term ((-4263316396002204 : Rat) / 1162780221153193) [(2, 2), (3, 1), (7, 1), (15, 2), (16, 1)],
  term ((8526632792004408 : Rat) / 1162780221153193) [(3, 2), (7, 2), (15, 2), (16, 1)],
  term ((-4263316396002204 : Rat) / 1162780221153193) [(3, 3), (7, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 151 for generator 16. -/
theorem ep_Q2_024_partial_16_0151_valid :
    mulPoly ep_Q2_024_coefficient_16_0151
        ep_Q2_024_generator_16_0100_0199 =
      ep_Q2_024_partial_16_0151 := by
  native_decide

/-- Coefficient term 152 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0152 : Poly :=
[
  term ((1652695128300478652375073904873736949728 : Rat) / 1799564186103715944850040292044308901985) [(3, 1), (8, 1), (9, 1)]
]

/-- Partial product 152 for generator 16. -/
def ep_Q2_024_partial_16_0152 : Poly :=
[
  term ((3305390256600957304750147809747473899456 : Rat) / 1799564186103715944850040292044308901985) [(2, 1), (3, 1), (6, 1), (8, 1), (9, 1)],
  term ((-1652695128300478652375073904873736949728 : Rat) / 1799564186103715944850040292044308901985) [(2, 2), (3, 1), (8, 1), (9, 1)],
  term ((3305390256600957304750147809747473899456 : Rat) / 1799564186103715944850040292044308901985) [(3, 2), (7, 1), (8, 1), (9, 1)],
  term ((-1652695128300478652375073904873736949728 : Rat) / 1799564186103715944850040292044308901985) [(3, 3), (8, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 152 for generator 16. -/
theorem ep_Q2_024_partial_16_0152_valid :
    mulPoly ep_Q2_024_coefficient_16_0152
        ep_Q2_024_generator_16_0100_0199 =
      ep_Q2_024_partial_16_0152 := by
  native_decide

/-- Coefficient term 153 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0153 : Poly :=
[
  term ((-12044493020427262308376744676896516739918 : Rat) / 5398692558311147834550120876132926705955) [(3, 1), (9, 1)]
]

/-- Partial product 153 for generator 16. -/
def ep_Q2_024_partial_16_0153 : Poly :=
[
  term ((-24088986040854524616753489353793033479836 : Rat) / 5398692558311147834550120876132926705955) [(2, 1), (3, 1), (6, 1), (9, 1)],
  term ((12044493020427262308376744676896516739918 : Rat) / 5398692558311147834550120876132926705955) [(2, 2), (3, 1), (9, 1)],
  term ((-24088986040854524616753489353793033479836 : Rat) / 5398692558311147834550120876132926705955) [(3, 2), (7, 1), (9, 1)],
  term ((12044493020427262308376744676896516739918 : Rat) / 5398692558311147834550120876132926705955) [(3, 3), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 153 for generator 16. -/
theorem ep_Q2_024_partial_16_0153_valid :
    mulPoly ep_Q2_024_coefficient_16_0153
        ep_Q2_024_generator_16_0100_0199 =
      ep_Q2_024_partial_16_0153 := by
  native_decide

/-- Coefficient term 154 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0154 : Poly :=
[
  term ((179900494408894967444133818184926615716 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (9, 1), (12, 1)]
]

/-- Partial product 154 for generator 16. -/
def ep_Q2_024_partial_16_0154 : Poly :=
[
  term ((359800988817789934888267636369853231432 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (3, 1), (6, 1), (9, 1), (12, 1)],
  term ((-179900494408894967444133818184926615716 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (3, 1), (9, 1), (12, 1)],
  term ((359800988817789934888267636369853231432 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (7, 1), (9, 1), (12, 1)],
  term ((-179900494408894967444133818184926615716 : Rat) / 599854728701238648283346764014769633995) [(3, 3), (9, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 154 for generator 16. -/
theorem ep_Q2_024_partial_16_0154_valid :
    mulPoly ep_Q2_024_coefficient_16_0154
        ep_Q2_024_generator_16_0100_0199 =
      ep_Q2_024_partial_16_0154 := by
  native_decide

/-- Coefficient term 155 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0155 : Poly :=
[
  term ((-22182620680173779953774126674016240448 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (9, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 155 for generator 16. -/
def ep_Q2_024_partial_16_0155 : Poly :=
[
  term ((-44365241360347559907548253348032480896 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (3, 1), (6, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((22182620680173779953774126674016240448 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (3, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((-44365241360347559907548253348032480896 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (7, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((22182620680173779953774126674016240448 : Rat) / 199951576233746216094448921338256544665) [(3, 3), (9, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 155 for generator 16. -/
theorem ep_Q2_024_partial_16_0155_valid :
    mulPoly ep_Q2_024_coefficient_16_0155
        ep_Q2_024_generator_16_0100_0199 =
      ep_Q2_024_partial_16_0155 := by
  native_decide

/-- Coefficient term 156 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0156 : Poly :=
[
  term ((397491232950237887996184205565539271127191104441069376 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 1), (9, 1), (12, 1), (15, 2)]
]

/-- Partial product 156 for generator 16. -/
def ep_Q2_024_partial_16_0156 : Poly :=
[
  term ((794982465900475775992368411131078542254382208882138752 : Rat) / 139499842819802972775716014625439884620101963487119207) [(2, 1), (3, 1), (6, 1), (9, 1), (12, 1), (15, 2)],
  term ((-397491232950237887996184205565539271127191104441069376 : Rat) / 139499842819802972775716014625439884620101963487119207) [(2, 2), (3, 1), (9, 1), (12, 1), (15, 2)],
  term ((794982465900475775992368411131078542254382208882138752 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 2), (7, 1), (9, 1), (12, 1), (15, 2)],
  term ((-397491232950237887996184205565539271127191104441069376 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 3), (9, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 156 for generator 16. -/
theorem ep_Q2_024_partial_16_0156_valid :
    mulPoly ep_Q2_024_coefficient_16_0156
        ep_Q2_024_generator_16_0100_0199 =
      ep_Q2_024_partial_16_0156 := by
  native_decide

/-- Coefficient term 157 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0157 : Poly :=
[
  term ((-1054421534548864 : Rat) / 1162780221153193) [(3, 1), (9, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 157 for generator 16. -/
def ep_Q2_024_partial_16_0157 : Poly :=
[
  term ((-2108843069097728 : Rat) / 1162780221153193) [(2, 1), (3, 1), (6, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((1054421534548864 : Rat) / 1162780221153193) [(2, 2), (3, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-2108843069097728 : Rat) / 1162780221153193) [(3, 2), (7, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((1054421534548864 : Rat) / 1162780221153193) [(3, 3), (9, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 157 for generator 16. -/
theorem ep_Q2_024_partial_16_0157_valid :
    mulPoly ep_Q2_024_coefficient_16_0157
        ep_Q2_024_generator_16_0100_0199 =
      ep_Q2_024_partial_16_0157 := by
  native_decide

/-- Coefficient term 158 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0158 : Poly :=
[
  term ((36326709823775404890386910227678820329661108457314367451 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(3, 1), (9, 1), (13, 1), (15, 1)]
]

/-- Partial product 158 for generator 16. -/
def ep_Q2_024_partial_16_0158 : Poly :=
[
  term ((36326709823775404890386910227678820329661108457314367451 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(2, 1), (3, 1), (6, 1), (9, 1), (13, 1), (15, 1)],
  term ((-36326709823775404890386910227678820329661108457314367451 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(2, 2), (3, 1), (9, 1), (13, 1), (15, 1)],
  term ((36326709823775404890386910227678820329661108457314367451 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(3, 2), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((-36326709823775404890386910227678820329661108457314367451 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(3, 3), (9, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 158 for generator 16. -/
theorem ep_Q2_024_partial_16_0158_valid :
    mulPoly ep_Q2_024_coefficient_16_0158
        ep_Q2_024_generator_16_0100_0199 =
      ep_Q2_024_partial_16_0158 := by
  native_decide

/-- Coefficient term 159 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0159 : Poly :=
[
  term ((-5187528714443170 : Rat) / 3488340663459579) [(3, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 159 for generator 16. -/
def ep_Q2_024_partial_16_0159 : Poly :=
[
  term ((-10375057428886340 : Rat) / 3488340663459579) [(2, 1), (3, 1), (6, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((5187528714443170 : Rat) / 3488340663459579) [(2, 2), (3, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-10375057428886340 : Rat) / 3488340663459579) [(3, 2), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((5187528714443170 : Rat) / 3488340663459579) [(3, 3), (9, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 159 for generator 16. -/
theorem ep_Q2_024_partial_16_0159_valid :
    mulPoly ep_Q2_024_coefficient_16_0159
        ep_Q2_024_generator_16_0100_0199 =
      ep_Q2_024_partial_16_0159 := by
  native_decide

/-- Coefficient term 160 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0160 : Poly :=
[
  term ((197073917525224405347438912316263103928 : Rat) / 359912837220743188970008058408861780397) [(3, 1), (9, 1), (13, 2)]
]

/-- Partial product 160 for generator 16. -/
def ep_Q2_024_partial_16_0160 : Poly :=
[
  term ((394147835050448810694877824632526207856 : Rat) / 359912837220743188970008058408861780397) [(2, 1), (3, 1), (6, 1), (9, 1), (13, 2)],
  term ((-197073917525224405347438912316263103928 : Rat) / 359912837220743188970008058408861780397) [(2, 2), (3, 1), (9, 1), (13, 2)],
  term ((394147835050448810694877824632526207856 : Rat) / 359912837220743188970008058408861780397) [(3, 2), (7, 1), (9, 1), (13, 2)],
  term ((-197073917525224405347438912316263103928 : Rat) / 359912837220743188970008058408861780397) [(3, 3), (9, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 160 for generator 16. -/
theorem ep_Q2_024_partial_16_0160_valid :
    mulPoly ep_Q2_024_coefficient_16_0160
        ep_Q2_024_generator_16_0100_0199 =
      ep_Q2_024_partial_16_0160 := by
  native_decide

/-- Coefficient term 161 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0161 : Poly :=
[
  term ((254235174577019432502708099503663666722 : Rat) / 359912837220743188970008058408861780397) [(3, 1), (9, 1), (14, 1)]
]

/-- Partial product 161 for generator 16. -/
def ep_Q2_024_partial_16_0161 : Poly :=
[
  term ((508470349154038865005416199007327333444 : Rat) / 359912837220743188970008058408861780397) [(2, 1), (3, 1), (6, 1), (9, 1), (14, 1)],
  term ((-254235174577019432502708099503663666722 : Rat) / 359912837220743188970008058408861780397) [(2, 2), (3, 1), (9, 1), (14, 1)],
  term ((508470349154038865005416199007327333444 : Rat) / 359912837220743188970008058408861780397) [(3, 2), (7, 1), (9, 1), (14, 1)],
  term ((-254235174577019432502708099503663666722 : Rat) / 359912837220743188970008058408861780397) [(3, 3), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 161 for generator 16. -/
theorem ep_Q2_024_partial_16_0161_valid :
    mulPoly ep_Q2_024_coefficient_16_0161
        ep_Q2_024_generator_16_0100_0199 =
      ep_Q2_024_partial_16_0161 := by
  native_decide

/-- Coefficient term 162 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0162 : Poly :=
[
  term ((408424516433622249313695112340266633602697230933700476949 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(3, 1), (9, 1), (15, 2)]
]

/-- Partial product 162 for generator 16. -/
def ep_Q2_024_partial_16_0162 : Poly :=
[
  term ((408424516433622249313695112340266633602697230933700476949 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(2, 1), (3, 1), (6, 1), (9, 1), (15, 2)],
  term ((-408424516433622249313695112340266633602697230933700476949 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(2, 2), (3, 1), (9, 1), (15, 2)],
  term ((408424516433622249313695112340266633602697230933700476949 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(3, 2), (7, 1), (9, 1), (15, 2)],
  term ((-408424516433622249313695112340266633602697230933700476949 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(3, 3), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 162 for generator 16. -/
theorem ep_Q2_024_partial_16_0162_valid :
    mulPoly ep_Q2_024_coefficient_16_0162
        ep_Q2_024_generator_16_0100_0199 =
      ep_Q2_024_partial_16_0162 := by
  native_decide

/-- Coefficient term 163 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0163 : Poly :=
[
  term ((-44155261447042286 : Rat) / 3488340663459579) [(3, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 163 for generator 16. -/
def ep_Q2_024_partial_16_0163 : Poly :=
[
  term ((-88310522894084572 : Rat) / 3488340663459579) [(2, 1), (3, 1), (6, 1), (9, 1), (15, 2), (16, 1)],
  term ((44155261447042286 : Rat) / 3488340663459579) [(2, 2), (3, 1), (9, 1), (15, 2), (16, 1)],
  term ((-88310522894084572 : Rat) / 3488340663459579) [(3, 2), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((44155261447042286 : Rat) / 3488340663459579) [(3, 3), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 163 for generator 16. -/
theorem ep_Q2_024_partial_16_0163_valid :
    mulPoly ep_Q2_024_coefficient_16_0163
        ep_Q2_024_generator_16_0100_0199 =
      ep_Q2_024_partial_16_0163 := by
  native_decide

/-- Coefficient term 164 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0164 : Poly :=
[
  term ((-36712442508195667296262437051940901488 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (9, 2), (13, 1)]
]

/-- Partial product 164 for generator 16. -/
def ep_Q2_024_partial_16_0164 : Poly :=
[
  term ((-73424885016391334592524874103881802976 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (3, 1), (6, 1), (9, 2), (13, 1)],
  term ((36712442508195667296262437051940901488 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (3, 1), (9, 2), (13, 1)],
  term ((-73424885016391334592524874103881802976 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (7, 1), (9, 2), (13, 1)],
  term ((36712442508195667296262437051940901488 : Rat) / 599854728701238648283346764014769633995) [(3, 3), (9, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 164 for generator 16. -/
theorem ep_Q2_024_partial_16_0164_valid :
    mulPoly ep_Q2_024_coefficient_16_0164
        ep_Q2_024_generator_16_0100_0199 =
      ep_Q2_024_partial_16_0164 := by
  native_decide

/-- Coefficient term 165 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0165 : Poly :=
[
  term ((-225792246667296571754346172666409042645220020210494517 : Rat) / 418499528459408918327148043876319653860305890461357621) [(3, 1), (9, 2), (15, 1)]
]

/-- Partial product 165 for generator 16. -/
def ep_Q2_024_partial_16_0165 : Poly :=
[
  term ((-451584493334593143508692345332818085290440040420989034 : Rat) / 418499528459408918327148043876319653860305890461357621) [(2, 1), (3, 1), (6, 1), (9, 2), (15, 1)],
  term ((225792246667296571754346172666409042645220020210494517 : Rat) / 418499528459408918327148043876319653860305890461357621) [(2, 2), (3, 1), (9, 2), (15, 1)],
  term ((-451584493334593143508692345332818085290440040420989034 : Rat) / 418499528459408918327148043876319653860305890461357621) [(3, 2), (7, 1), (9, 2), (15, 1)],
  term ((225792246667296571754346172666409042645220020210494517 : Rat) / 418499528459408918327148043876319653860305890461357621) [(3, 3), (9, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 165 for generator 16. -/
theorem ep_Q2_024_partial_16_0165_valid :
    mulPoly ep_Q2_024_coefficient_16_0165
        ep_Q2_024_generator_16_0100_0199 =
      ep_Q2_024_partial_16_0165 := by
  native_decide

/-- Coefficient term 166 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0166 : Poly :=
[
  term ((-747574224772468 : Rat) / 3488340663459579) [(3, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 166 for generator 16. -/
def ep_Q2_024_partial_16_0166 : Poly :=
[
  term ((-1495148449544936 : Rat) / 3488340663459579) [(2, 1), (3, 1), (6, 1), (9, 2), (15, 1), (16, 1)],
  term ((747574224772468 : Rat) / 3488340663459579) [(2, 2), (3, 1), (9, 2), (15, 1), (16, 1)],
  term ((-1495148449544936 : Rat) / 3488340663459579) [(3, 2), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((747574224772468 : Rat) / 3488340663459579) [(3, 3), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 166 for generator 16. -/
theorem ep_Q2_024_partial_16_0166_valid :
    mulPoly ep_Q2_024_coefficient_16_0166
        ep_Q2_024_generator_16_0100_0199 =
      ep_Q2_024_partial_16_0166 := by
  native_decide

/-- Coefficient term 167 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0167 : Poly :=
[
  term ((-63112532186469946331305143931700421056 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (9, 3)]
]

/-- Partial product 167 for generator 16. -/
def ep_Q2_024_partial_16_0167 : Poly :=
[
  term ((-126225064372939892662610287863400842112 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (3, 1), (6, 1), (9, 3)],
  term ((63112532186469946331305143931700421056 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (3, 1), (9, 3)],
  term ((-126225064372939892662610287863400842112 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (7, 1), (9, 3)],
  term ((63112532186469946331305143931700421056 : Rat) / 599854728701238648283346764014769633995) [(3, 3), (9, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 167 for generator 16. -/
theorem ep_Q2_024_partial_16_0167_valid :
    mulPoly ep_Q2_024_coefficient_16_0167
        ep_Q2_024_generator_16_0100_0199 =
      ep_Q2_024_partial_16_0167 := by
  native_decide

/-- Coefficient term 168 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0168 : Poly :=
[
  term ((-554692912219327333928584547423686149724 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (13, 1)]
]

/-- Partial product 168 for generator 16. -/
def ep_Q2_024_partial_16_0168 : Poly :=
[
  term ((-1109385824438654667857169094847372299448 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (3, 1), (6, 1), (13, 1)],
  term ((554692912219327333928584547423686149724 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (3, 1), (13, 1)],
  term ((-1109385824438654667857169094847372299448 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (7, 1), (13, 1)],
  term ((554692912219327333928584547423686149724 : Rat) / 599854728701238648283346764014769633995) [(3, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 168 for generator 16. -/
theorem ep_Q2_024_partial_16_0168_valid :
    mulPoly ep_Q2_024_coefficient_16_0168
        ep_Q2_024_generator_16_0100_0199 =
      ep_Q2_024_partial_16_0168 := by
  native_decide

/-- Coefficient term 169 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0169 : Poly :=
[
  term ((-37050814747583503133753456969502764146050338642007357993 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(3, 1), (15, 1)]
]

/-- Partial product 169 for generator 16. -/
def ep_Q2_024_partial_16_0169 : Poly :=
[
  term ((-37050814747583503133753456969502764146050338642007357993 : Rat) / 929998952132019818504773430836265897467346423247461380) [(2, 1), (3, 1), (6, 1), (15, 1)],
  term ((37050814747583503133753456969502764146050338642007357993 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(2, 2), (3, 1), (15, 1)],
  term ((-37050814747583503133753456969502764146050338642007357993 : Rat) / 929998952132019818504773430836265897467346423247461380) [(3, 2), (7, 1), (15, 1)],
  term ((37050814747583503133753456969502764146050338642007357993 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(3, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 169 for generator 16. -/
theorem ep_Q2_024_partial_16_0169_valid :
    mulPoly ep_Q2_024_coefficient_16_0169
        ep_Q2_024_generator_16_0100_0199 =
      ep_Q2_024_partial_16_0169 := by
  native_decide

/-- Coefficient term 170 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0170 : Poly :=
[
  term ((5146839986298265 : Rat) / 2325560442306386) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 170 for generator 16. -/
def ep_Q2_024_partial_16_0170 : Poly :=
[
  term ((5146839986298265 : Rat) / 1162780221153193) [(2, 1), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((-5146839986298265 : Rat) / 2325560442306386) [(2, 2), (3, 1), (15, 1), (16, 1)],
  term ((5146839986298265 : Rat) / 1162780221153193) [(3, 2), (7, 1), (15, 1), (16, 1)],
  term ((-5146839986298265 : Rat) / 2325560442306386) [(3, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 170 for generator 16. -/
theorem ep_Q2_024_partial_16_0170_valid :
    mulPoly ep_Q2_024_coefficient_16_0170
        ep_Q2_024_generator_16_0100_0199 =
      ep_Q2_024_partial_16_0170 := by
  native_decide

/-- Coefficient term 171 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0171 : Poly :=
[
  term ((-728076732914481757341890194147363826966 : Rat) / 599854728701238648283346764014769633995) [(4, 1)]
]

/-- Partial product 171 for generator 16. -/
def ep_Q2_024_partial_16_0171 : Poly :=
[
  term ((-1456153465828963514683780388294727653932 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (4, 1), (6, 1)],
  term ((728076732914481757341890194147363826966 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (4, 1)],
  term ((-1456153465828963514683780388294727653932 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (4, 1), (7, 1)],
  term ((728076732914481757341890194147363826966 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (4, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 171 for generator 16. -/
theorem ep_Q2_024_partial_16_0171_valid :
    mulPoly ep_Q2_024_coefficient_16_0171
        ep_Q2_024_generator_16_0100_0199 =
      ep_Q2_024_partial_16_0171 := by
  native_decide

/-- Coefficient term 172 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0172 : Poly :=
[
  term ((16890983628896808743407603036576568848 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (5, 1), (9, 1)]
]

/-- Partial product 172 for generator 16. -/
def ep_Q2_024_partial_16_0172 : Poly :=
[
  term ((33781967257793617486815206073153137696 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (4, 1), (5, 1), (6, 1), (9, 1)],
  term ((-16890983628896808743407603036576568848 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (4, 1), (5, 1), (9, 1)],
  term ((33781967257793617486815206073153137696 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (4, 1), (5, 1), (7, 1), (9, 1)],
  term ((-16890983628896808743407603036576568848 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (4, 1), (5, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 172 for generator 16. -/
theorem ep_Q2_024_partial_16_0172_valid :
    mulPoly ep_Q2_024_coefficient_16_0172
        ep_Q2_024_generator_16_0100_0199 =
      ep_Q2_024_partial_16_0172 := by
  native_decide

/-- Coefficient term 173 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0173 : Poly :=
[
  term ((20220074797511964466058292860462341536 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (5, 1), (13, 1)]
]

/-- Partial product 173 for generator 16. -/
def ep_Q2_024_partial_16_0173 : Poly :=
[
  term ((40440149595023928932116585720924683072 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (4, 1), (5, 1), (6, 1), (13, 1)],
  term ((-20220074797511964466058292860462341536 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (4, 1), (5, 1), (13, 1)],
  term ((40440149595023928932116585720924683072 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (4, 1), (5, 1), (7, 1), (13, 1)],
  term ((-20220074797511964466058292860462341536 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (4, 1), (5, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 173 for generator 16. -/
theorem ep_Q2_024_partial_16_0173_valid :
    mulPoly ep_Q2_024_coefficient_16_0173
        ep_Q2_024_generator_16_0100_0199 =
      ep_Q2_024_partial_16_0173 := by
  native_decide

/-- Coefficient term 174 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0174 : Poly :=
[
  term ((-1086812258876365631714711692878661467835285345215957824 : Rat) / 232499738033004954626193357709066474366836605811865345) [(4, 1), (5, 1), (15, 1)]
]

/-- Partial product 174 for generator 16. -/
def ep_Q2_024_partial_16_0174 : Poly :=
[
  term ((-2173624517752731263429423385757322935670570690431915648 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 1), (4, 1), (5, 1), (6, 1), (15, 1)],
  term ((1086812258876365631714711692878661467835285345215957824 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 2), (4, 1), (5, 1), (15, 1)],
  term ((-2173624517752731263429423385757322935670570690431915648 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (4, 1), (5, 1), (7, 1), (15, 1)],
  term ((1086812258876365631714711692878661467835285345215957824 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 2), (4, 1), (5, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 174 for generator 16. -/
theorem ep_Q2_024_partial_16_0174_valid :
    mulPoly ep_Q2_024_coefficient_16_0174
        ep_Q2_024_generator_16_0100_0199 =
      ep_Q2_024_partial_16_0174 := by
  native_decide

/-- Coefficient term 175 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0175 : Poly :=
[
  term ((-103470768511616 : Rat) / 1162780221153193) [(4, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 175 for generator 16. -/
def ep_Q2_024_partial_16_0175 : Poly :=
[
  term ((-206941537023232 : Rat) / 1162780221153193) [(2, 1), (4, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((103470768511616 : Rat) / 1162780221153193) [(2, 2), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((-206941537023232 : Rat) / 1162780221153193) [(3, 1), (4, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((103470768511616 : Rat) / 1162780221153193) [(3, 2), (4, 1), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 175 for generator 16. -/
theorem ep_Q2_024_partial_16_0175_valid :
    mulPoly ep_Q2_024_coefficient_16_0175
        ep_Q2_024_generator_16_0100_0199 =
      ep_Q2_024_partial_16_0175 := by
  native_decide

/-- Coefficient term 176 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0176 : Poly :=
[
  term ((1649296228384068576741376062426932982764 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (7, 1), (9, 1)]
]

/-- Partial product 176 for generator 16. -/
def ep_Q2_024_partial_16_0176 : Poly :=
[
  term ((3298592456768137153482752124853865965528 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (4, 1), (6, 1), (7, 1), (9, 1)],
  term ((-1649296228384068576741376062426932982764 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (4, 1), (7, 1), (9, 1)],
  term ((3298592456768137153482752124853865965528 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (4, 1), (7, 2), (9, 1)],
  term ((-1649296228384068576741376062426932982764 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (4, 1), (7, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 176 for generator 16. -/
theorem ep_Q2_024_partial_16_0176_valid :
    mulPoly ep_Q2_024_coefficient_16_0176
        ep_Q2_024_generator_16_0100_0199 =
      ep_Q2_024_partial_16_0176 := by
  native_decide

/-- Coefficient term 177 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0177 : Poly :=
[
  term ((-295622921385756576283256241424332335300 : Rat) / 119970945740247729656669352802953926799) [(4, 1), (7, 1), (13, 1)]
]

/-- Partial product 177 for generator 16. -/
def ep_Q2_024_partial_16_0177 : Poly :=
[
  term ((-591245842771513152566512482848664670600 : Rat) / 119970945740247729656669352802953926799) [(2, 1), (4, 1), (6, 1), (7, 1), (13, 1)],
  term ((295622921385756576283256241424332335300 : Rat) / 119970945740247729656669352802953926799) [(2, 2), (4, 1), (7, 1), (13, 1)],
  term ((-591245842771513152566512482848664670600 : Rat) / 119970945740247729656669352802953926799) [(3, 1), (4, 1), (7, 2), (13, 1)],
  term ((295622921385756576283256241424332335300 : Rat) / 119970945740247729656669352802953926799) [(3, 2), (4, 1), (7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 177 for generator 16. -/
theorem ep_Q2_024_partial_16_0177_valid :
    mulPoly ep_Q2_024_coefficient_16_0177
        ep_Q2_024_generator_16_0100_0199 =
      ep_Q2_024_partial_16_0177 := by
  native_decide

/-- Coefficient term 178 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0178 : Poly :=
[
  term ((1279332772588430482173835610044994821028103267071148719 : Rat) / 464999476066009909252386715418132948733673211623730690) [(4, 1), (7, 1), (15, 1)]
]

/-- Partial product 178 for generator 16. -/
def ep_Q2_024_partial_16_0178 : Poly :=
[
  term ((1279332772588430482173835610044994821028103267071148719 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 1), (4, 1), (6, 1), (7, 1), (15, 1)],
  term ((-1279332772588430482173835610044994821028103267071148719 : Rat) / 464999476066009909252386715418132948733673211623730690) [(2, 2), (4, 1), (7, 1), (15, 1)],
  term ((1279332772588430482173835610044994821028103267071148719 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (4, 1), (7, 2), (15, 1)],
  term ((-1279332772588430482173835610044994821028103267071148719 : Rat) / 464999476066009909252386715418132948733673211623730690) [(3, 2), (4, 1), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 178 for generator 16. -/
theorem ep_Q2_024_partial_16_0178_valid :
    mulPoly ep_Q2_024_coefficient_16_0178
        ep_Q2_024_generator_16_0100_0199 =
      ep_Q2_024_partial_16_0178 := by
  native_decide

/-- Coefficient term 179 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0179 : Poly :=
[
  term ((-69367473696382 : Rat) / 1162780221153193) [(4, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 179 for generator 16. -/
def ep_Q2_024_partial_16_0179 : Poly :=
[
  term ((-138734947392764 : Rat) / 1162780221153193) [(2, 1), (4, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((69367473696382 : Rat) / 1162780221153193) [(2, 2), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((-138734947392764 : Rat) / 1162780221153193) [(3, 1), (4, 1), (7, 2), (15, 1), (16, 1)],
  term ((69367473696382 : Rat) / 1162780221153193) [(3, 2), (4, 1), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 179 for generator 16. -/
theorem ep_Q2_024_partial_16_0179_valid :
    mulPoly ep_Q2_024_coefficient_16_0179
        ep_Q2_024_generator_16_0100_0199 =
      ep_Q2_024_partial_16_0179 := by
  native_decide

/-- Coefficient term 180 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0180 : Poly :=
[
  term ((-18233769251644050532624093590475302808 : Rat) / 39990315246749243218889784267651308933) [(4, 1), (9, 1), (13, 1)]
]

/-- Partial product 180 for generator 16. -/
def ep_Q2_024_partial_16_0180 : Poly :=
[
  term ((-36467538503288101065248187180950605616 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (4, 1), (6, 1), (9, 1), (13, 1)],
  term ((18233769251644050532624093590475302808 : Rat) / 39990315246749243218889784267651308933) [(2, 2), (4, 1), (9, 1), (13, 1)],
  term ((-36467538503288101065248187180950605616 : Rat) / 39990315246749243218889784267651308933) [(3, 1), (4, 1), (7, 1), (9, 1), (13, 1)],
  term ((18233769251644050532624093590475302808 : Rat) / 39990315246749243218889784267651308933) [(3, 2), (4, 1), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 180 for generator 16. -/
theorem ep_Q2_024_partial_16_0180_valid :
    mulPoly ep_Q2_024_coefficient_16_0180
        ep_Q2_024_generator_16_0100_0199 =
      ep_Q2_024_partial_16_0180 := by
  native_decide

/-- Coefficient term 181 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0181 : Poly :=
[
  term ((-346892372640590558901125075097939009577344647390977442 : Rat) / 139499842819802972775716014625439884620101963487119207) [(4, 1), (9, 1), (15, 1)]
]

/-- Partial product 181 for generator 16. -/
def ep_Q2_024_partial_16_0181 : Poly :=
[
  term ((-693784745281181117802250150195878019154689294781954884 : Rat) / 139499842819802972775716014625439884620101963487119207) [(2, 1), (4, 1), (6, 1), (9, 1), (15, 1)],
  term ((346892372640590558901125075097939009577344647390977442 : Rat) / 139499842819802972775716014625439884620101963487119207) [(2, 2), (4, 1), (9, 1), (15, 1)],
  term ((-693784745281181117802250150195878019154689294781954884 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 1), (4, 1), (7, 1), (9, 1), (15, 1)],
  term ((346892372640590558901125075097939009577344647390977442 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 2), (4, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 181 for generator 16. -/
theorem ep_Q2_024_partial_16_0181_valid :
    mulPoly ep_Q2_024_coefficient_16_0181
        ep_Q2_024_generator_16_0100_0199 =
      ep_Q2_024_partial_16_0181 := by
  native_decide

/-- Coefficient term 182 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0182 : Poly :=
[
  term ((-445555703598648 : Rat) / 1162780221153193) [(4, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 182 for generator 16. -/
def ep_Q2_024_partial_16_0182 : Poly :=
[
  term ((-891111407197296 : Rat) / 1162780221153193) [(2, 1), (4, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((445555703598648 : Rat) / 1162780221153193) [(2, 2), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((-891111407197296 : Rat) / 1162780221153193) [(3, 1), (4, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((445555703598648 : Rat) / 1162780221153193) [(3, 2), (4, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 182 for generator 16. -/
theorem ep_Q2_024_partial_16_0182_valid :
    mulPoly ep_Q2_024_coefficient_16_0182
        ep_Q2_024_generator_16_0100_0199 =
      ep_Q2_024_partial_16_0182 := by
  native_decide

/-- Coefficient term 183 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0183 : Poly :=
[
  term ((628403389435981737546357640629173338988 : Rat) / 1799564186103715944850040292044308901985) [(4, 1), (9, 2)]
]

/-- Partial product 183 for generator 16. -/
def ep_Q2_024_partial_16_0183 : Poly :=
[
  term ((1256806778871963475092715281258346677976 : Rat) / 1799564186103715944850040292044308901985) [(2, 1), (4, 1), (6, 1), (9, 2)],
  term ((-628403389435981737546357640629173338988 : Rat) / 1799564186103715944850040292044308901985) [(2, 2), (4, 1), (9, 2)],
  term ((1256806778871963475092715281258346677976 : Rat) / 1799564186103715944850040292044308901985) [(3, 1), (4, 1), (7, 1), (9, 2)],
  term ((-628403389435981737546357640629173338988 : Rat) / 1799564186103715944850040292044308901985) [(3, 2), (4, 1), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 183 for generator 16. -/
theorem ep_Q2_024_partial_16_0183_valid :
    mulPoly ep_Q2_024_coefficient_16_0183
        ep_Q2_024_generator_16_0100_0199 =
      ep_Q2_024_partial_16_0183 := by
  native_decide

/-- Coefficient term 184 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0184 : Poly :=
[
  term ((732537308678412778282669871950328022754 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (12, 1)]
]

/-- Partial product 184 for generator 16. -/
def ep_Q2_024_partial_16_0184 : Poly :=
[
  term ((1465074617356825556565339743900656045508 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (4, 1), (6, 1), (12, 1)],
  term ((-732537308678412778282669871950328022754 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (4, 1), (12, 1)],
  term ((1465074617356825556565339743900656045508 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (4, 1), (7, 1), (12, 1)],
  term ((-732537308678412778282669871950328022754 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (4, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 184 for generator 16. -/
theorem ep_Q2_024_partial_16_0184_valid :
    mulPoly ep_Q2_024_coefficient_16_0184
        ep_Q2_024_generator_16_0100_0199 =
      ep_Q2_024_partial_16_0184 := by
  native_decide

/-- Coefficient term 185 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0185 : Poly :=
[
  term ((6043130038758612655481222570993244851010042396287040947 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(4, 1), (13, 1), (15, 1)]
]

/-- Partial product 185 for generator 16. -/
def ep_Q2_024_partial_16_0185 : Poly :=
[
  term ((6043130038758612655481222570993244851010042396287040947 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 1), (4, 1), (6, 1), (13, 1), (15, 1)],
  term ((-6043130038758612655481222570993244851010042396287040947 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(2, 2), (4, 1), (13, 1), (15, 1)],
  term ((6043130038758612655481222570993244851010042396287040947 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (4, 1), (7, 1), (13, 1), (15, 1)],
  term ((-6043130038758612655481222570993244851010042396287040947 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(3, 2), (4, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 185 for generator 16. -/
theorem ep_Q2_024_partial_16_0185_valid :
    mulPoly ep_Q2_024_coefficient_16_0185
        ep_Q2_024_generator_16_0100_0199 =
      ep_Q2_024_partial_16_0185 := by
  native_decide

/-- Coefficient term 186 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0186 : Poly :=
[
  term ((224573626463806 : Rat) / 1162780221153193) [(4, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 186 for generator 16. -/
def ep_Q2_024_partial_16_0186 : Poly :=
[
  term ((449147252927612 : Rat) / 1162780221153193) [(2, 1), (4, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-224573626463806 : Rat) / 1162780221153193) [(2, 2), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((449147252927612 : Rat) / 1162780221153193) [(3, 1), (4, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-224573626463806 : Rat) / 1162780221153193) [(3, 2), (4, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 186 for generator 16. -/
theorem ep_Q2_024_partial_16_0186_valid :
    mulPoly ep_Q2_024_coefficient_16_0186
        ep_Q2_024_generator_16_0100_0199 =
      ep_Q2_024_partial_16_0186 := by
  native_decide

/-- Coefficient term 187 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0187 : Poly :=
[
  term ((-15590069403369303049264170930214981184 : Rat) / 119970945740247729656669352802953926799) [(4, 1), (13, 2)]
]

/-- Partial product 187 for generator 16. -/
def ep_Q2_024_partial_16_0187 : Poly :=
[
  term ((-31180138806738606098528341860429962368 : Rat) / 119970945740247729656669352802953926799) [(2, 1), (4, 1), (6, 1), (13, 2)],
  term ((15590069403369303049264170930214981184 : Rat) / 119970945740247729656669352802953926799) [(2, 2), (4, 1), (13, 2)],
  term ((-31180138806738606098528341860429962368 : Rat) / 119970945740247729656669352802953926799) [(3, 1), (4, 1), (7, 1), (13, 2)],
  term ((15590069403369303049264170930214981184 : Rat) / 119970945740247729656669352802953926799) [(3, 2), (4, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 187 for generator 16. -/
theorem ep_Q2_024_partial_16_0187_valid :
    mulPoly ep_Q2_024_coefficient_16_0187
        ep_Q2_024_generator_16_0100_0199 =
      ep_Q2_024_partial_16_0187 := by
  native_decide

/-- Coefficient term 188 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0188 : Poly :=
[
  term ((-4460575763931020940779677802964195788 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (14, 1)]
]

/-- Partial product 188 for generator 16. -/
def ep_Q2_024_partial_16_0188 : Poly :=
[
  term ((-8921151527862041881559355605928391576 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (4, 1), (6, 1), (14, 1)],
  term ((4460575763931020940779677802964195788 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (4, 1), (14, 1)],
  term ((-8921151527862041881559355605928391576 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (4, 1), (7, 1), (14, 1)],
  term ((4460575763931020940779677802964195788 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (4, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 188 for generator 16. -/
theorem ep_Q2_024_partial_16_0188_valid :
    mulPoly ep_Q2_024_coefficient_16_0188
        ep_Q2_024_generator_16_0100_0199 =
      ep_Q2_024_partial_16_0188 := by
  native_decide

/-- Coefficient term 189 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0189 : Poly :=
[
  term ((-3777304314129578830929172305846821658579332200799902379 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (15, 2)]
]

/-- Partial product 189 for generator 16. -/
def ep_Q2_024_partial_16_0189 : Poly :=
[
  term ((-7554608628259157661858344611693643317158664401599804758 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 1), (4, 1), (6, 1), (15, 2)],
  term ((3777304314129578830929172305846821658579332200799902379 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 2), (4, 1), (15, 2)],
  term ((-7554608628259157661858344611693643317158664401599804758 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (4, 1), (7, 1), (15, 2)],
  term ((3777304314129578830929172305846821658579332200799902379 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 2), (4, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 189 for generator 16. -/
theorem ep_Q2_024_partial_16_0189_valid :
    mulPoly ep_Q2_024_coefficient_16_0189
        ep_Q2_024_generator_16_0100_0199 =
      ep_Q2_024_partial_16_0189 := by
  native_decide

/-- Coefficient term 190 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0190 : Poly :=
[
  term ((532555266735604 : Rat) / 1162780221153193) [(4, 1), (15, 2), (16, 1)]
]

/-- Partial product 190 for generator 16. -/
def ep_Q2_024_partial_16_0190 : Poly :=
[
  term ((1065110533471208 : Rat) / 1162780221153193) [(2, 1), (4, 1), (6, 1), (15, 2), (16, 1)],
  term ((-532555266735604 : Rat) / 1162780221153193) [(2, 2), (4, 1), (15, 2), (16, 1)],
  term ((1065110533471208 : Rat) / 1162780221153193) [(3, 1), (4, 1), (7, 1), (15, 2), (16, 1)],
  term ((-532555266735604 : Rat) / 1162780221153193) [(3, 2), (4, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 190 for generator 16. -/
theorem ep_Q2_024_partial_16_0190_valid :
    mulPoly ep_Q2_024_coefficient_16_0190
        ep_Q2_024_generator_16_0100_0199 =
      ep_Q2_024_partial_16_0190 := by
  native_decide

/-- Coefficient term 191 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0191 : Poly :=
[
  term ((31193122130146647550698511492541970888 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (7, 1), (9, 1), (13, 1)]
]

/-- Partial product 191 for generator 16. -/
def ep_Q2_024_partial_16_0191 : Poly :=
[
  term ((62386244260293295101397022985083941776 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (5, 1), (6, 1), (7, 1), (9, 1), (13, 1)],
  term ((-31193122130146647550698511492541970888 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (5, 1), (7, 1), (9, 1), (13, 1)],
  term ((62386244260293295101397022985083941776 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (7, 2), (9, 1), (13, 1)],
  term ((-31193122130146647550698511492541970888 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (5, 1), (7, 1), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 191 for generator 16. -/
theorem ep_Q2_024_partial_16_0191_valid :
    mulPoly ep_Q2_024_coefficient_16_0191
        ep_Q2_024_generator_16_0100_0199 =
      ep_Q2_024_partial_16_0191 := by
  native_decide

/-- Coefficient term 192 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0192 : Poly :=
[
  term ((-1267812685805463682044380378946658808089587330947242928 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (7, 1), (9, 1), (15, 1)]
]

/-- Partial product 192 for generator 16. -/
def ep_Q2_024_partial_16_0192 : Poly :=
[
  term ((-2535625371610927364088760757893317616179174661894485856 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 1), (5, 1), (6, 1), (7, 1), (9, 1), (15, 1)],
  term ((1267812685805463682044380378946658808089587330947242928 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 2), (5, 1), (7, 1), (9, 1), (15, 1)],
  term ((-2535625371610927364088760757893317616179174661894485856 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (5, 1), (7, 2), (9, 1), (15, 1)],
  term ((1267812685805463682044380378946658808089587330947242928 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 2), (5, 1), (7, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 192 for generator 16. -/
theorem ep_Q2_024_partial_16_0192_valid :
    mulPoly ep_Q2_024_coefficient_16_0192
        ep_Q2_024_generator_16_0100_0199 =
      ep_Q2_024_partial_16_0192 := by
  native_decide

/-- Coefficient term 193 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0193 : Poly :=
[
  term ((-3160383784879872 : Rat) / 1162780221153193) [(5, 1), (7, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 193 for generator 16. -/
def ep_Q2_024_partial_16_0193 : Poly :=
[
  term ((-6320767569759744 : Rat) / 1162780221153193) [(2, 1), (5, 1), (6, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((3160383784879872 : Rat) / 1162780221153193) [(2, 2), (5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-6320767569759744 : Rat) / 1162780221153193) [(3, 1), (5, 1), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((3160383784879872 : Rat) / 1162780221153193) [(3, 2), (5, 1), (7, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 193 for generator 16. -/
theorem ep_Q2_024_partial_16_0193_valid :
    mulPoly ep_Q2_024_coefficient_16_0193
        ep_Q2_024_generator_16_0100_0199 =
      ep_Q2_024_partial_16_0193 := by
  native_decide

/-- Coefficient term 194 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0194 : Poly :=
[
  term ((106403221006853429260105512033760078472 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (7, 1), (9, 2)]
]

/-- Partial product 194 for generator 16. -/
def ep_Q2_024_partial_16_0194 : Poly :=
[
  term ((212806442013706858520211024067520156944 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (5, 1), (6, 1), (7, 1), (9, 2)],
  term ((-106403221006853429260105512033760078472 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (5, 1), (7, 1), (9, 2)],
  term ((212806442013706858520211024067520156944 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (7, 2), (9, 2)],
  term ((-106403221006853429260105512033760078472 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (5, 1), (7, 1), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 194 for generator 16. -/
theorem ep_Q2_024_partial_16_0194_valid :
    mulPoly ep_Q2_024_coefficient_16_0194
        ep_Q2_024_generator_16_0100_0199 =
      ep_Q2_024_partial_16_0194 := by
  native_decide

/-- Coefficient term 195 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0195 : Poly :=
[
  term ((1267812685805463682044380378946658808089587330947242928 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (7, 1), (13, 1), (15, 1)]
]

/-- Partial product 195 for generator 16. -/
def ep_Q2_024_partial_16_0195 : Poly :=
[
  term ((2535625371610927364088760757893317616179174661894485856 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 1), (5, 1), (6, 1), (7, 1), (13, 1), (15, 1)],
  term ((-1267812685805463682044380378946658808089587330947242928 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 2), (5, 1), (7, 1), (13, 1), (15, 1)],
  term ((2535625371610927364088760757893317616179174661894485856 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (5, 1), (7, 2), (13, 1), (15, 1)],
  term ((-1267812685805463682044380378946658808089587330947242928 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 2), (5, 1), (7, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 195 for generator 16. -/
theorem ep_Q2_024_partial_16_0195_valid :
    mulPoly ep_Q2_024_coefficient_16_0195
        ep_Q2_024_generator_16_0100_0199 =
      ep_Q2_024_partial_16_0195 := by
  native_decide

/-- Coefficient term 196 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0196 : Poly :=
[
  term ((3160383784879872 : Rat) / 1162780221153193) [(5, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 196 for generator 16. -/
def ep_Q2_024_partial_16_0196 : Poly :=
[
  term ((6320767569759744 : Rat) / 1162780221153193) [(2, 1), (5, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3160383784879872 : Rat) / 1162780221153193) [(2, 2), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((6320767569759744 : Rat) / 1162780221153193) [(3, 1), (5, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-3160383784879872 : Rat) / 1162780221153193) [(3, 2), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 196 for generator 16. -/
theorem ep_Q2_024_partial_16_0196_valid :
    mulPoly ep_Q2_024_coefficient_16_0196
        ep_Q2_024_generator_16_0100_0199 =
      ep_Q2_024_partial_16_0196 := by
  native_decide

/-- Coefficient term 197 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0197 : Poly :=
[
  term ((-27519268627400015362160804705260409872 : Rat) / 39990315246749243218889784267651308933) [(5, 1), (7, 1), (13, 2)]
]

/-- Partial product 197 for generator 16. -/
def ep_Q2_024_partial_16_0197 : Poly :=
[
  term ((-55038537254800030724321609410520819744 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (5, 1), (6, 1), (7, 1), (13, 2)],
  term ((27519268627400015362160804705260409872 : Rat) / 39990315246749243218889784267651308933) [(2, 2), (5, 1), (7, 1), (13, 2)],
  term ((-55038537254800030724321609410520819744 : Rat) / 39990315246749243218889784267651308933) [(3, 1), (5, 1), (7, 2), (13, 2)],
  term ((27519268627400015362160804705260409872 : Rat) / 39990315246749243218889784267651308933) [(3, 2), (5, 1), (7, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 197 for generator 16. -/
theorem ep_Q2_024_partial_16_0197_valid :
    mulPoly ep_Q2_024_coefficient_16_0197
        ep_Q2_024_generator_16_0100_0199 =
      ep_Q2_024_partial_16_0197 := by
  native_decide

/-- Coefficient term 198 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0198 : Poly :=
[
  term ((-4361291786440524956738346429054743746544 : Rat) / 1799564186103715944850040292044308901985) [(5, 1), (9, 1)]
]

/-- Partial product 198 for generator 16. -/
def ep_Q2_024_partial_16_0198 : Poly :=
[
  term ((-8722583572881049913476692858109487493088 : Rat) / 1799564186103715944850040292044308901985) [(2, 1), (5, 1), (6, 1), (9, 1)],
  term ((4361291786440524956738346429054743746544 : Rat) / 1799564186103715944850040292044308901985) [(2, 2), (5, 1), (9, 1)],
  term ((-8722583572881049913476692858109487493088 : Rat) / 1799564186103715944850040292044308901985) [(3, 1), (5, 1), (7, 1), (9, 1)],
  term ((4361291786440524956738346429054743746544 : Rat) / 1799564186103715944850040292044308901985) [(3, 2), (5, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 198 for generator 16. -/
theorem ep_Q2_024_partial_16_0198_valid :
    mulPoly ep_Q2_024_coefficient_16_0198
        ep_Q2_024_generator_16_0100_0199 =
      ep_Q2_024_partial_16_0198 := by
  native_decide

/-- Coefficient term 199 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0199 : Poly :=
[
  term ((84757876596661687795705327982730249764 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (9, 1), (12, 1)]
]

/-- Partial product 199 for generator 16. -/
def ep_Q2_024_partial_16_0199 : Poly :=
[
  term ((169515753193323375591410655965460499528 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (5, 1), (6, 1), (9, 1), (12, 1)],
  term ((-84757876596661687795705327982730249764 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (5, 1), (9, 1), (12, 1)],
  term ((169515753193323375591410655965460499528 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (7, 1), (9, 1), (12, 1)],
  term ((-84757876596661687795705327982730249764 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (5, 1), (9, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 199 for generator 16. -/
theorem ep_Q2_024_partial_16_0199_valid :
    mulPoly ep_Q2_024_coefficient_16_0199
        ep_Q2_024_generator_16_0100_0199 =
      ep_Q2_024_partial_16_0199 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_024_partials_16_0100_0199 : List Poly :=
[
  ep_Q2_024_partial_16_0100,
  ep_Q2_024_partial_16_0101,
  ep_Q2_024_partial_16_0102,
  ep_Q2_024_partial_16_0103,
  ep_Q2_024_partial_16_0104,
  ep_Q2_024_partial_16_0105,
  ep_Q2_024_partial_16_0106,
  ep_Q2_024_partial_16_0107,
  ep_Q2_024_partial_16_0108,
  ep_Q2_024_partial_16_0109,
  ep_Q2_024_partial_16_0110,
  ep_Q2_024_partial_16_0111,
  ep_Q2_024_partial_16_0112,
  ep_Q2_024_partial_16_0113,
  ep_Q2_024_partial_16_0114,
  ep_Q2_024_partial_16_0115,
  ep_Q2_024_partial_16_0116,
  ep_Q2_024_partial_16_0117,
  ep_Q2_024_partial_16_0118,
  ep_Q2_024_partial_16_0119,
  ep_Q2_024_partial_16_0120,
  ep_Q2_024_partial_16_0121,
  ep_Q2_024_partial_16_0122,
  ep_Q2_024_partial_16_0123,
  ep_Q2_024_partial_16_0124,
  ep_Q2_024_partial_16_0125,
  ep_Q2_024_partial_16_0126,
  ep_Q2_024_partial_16_0127,
  ep_Q2_024_partial_16_0128,
  ep_Q2_024_partial_16_0129,
  ep_Q2_024_partial_16_0130,
  ep_Q2_024_partial_16_0131,
  ep_Q2_024_partial_16_0132,
  ep_Q2_024_partial_16_0133,
  ep_Q2_024_partial_16_0134,
  ep_Q2_024_partial_16_0135,
  ep_Q2_024_partial_16_0136,
  ep_Q2_024_partial_16_0137,
  ep_Q2_024_partial_16_0138,
  ep_Q2_024_partial_16_0139,
  ep_Q2_024_partial_16_0140,
  ep_Q2_024_partial_16_0141,
  ep_Q2_024_partial_16_0142,
  ep_Q2_024_partial_16_0143,
  ep_Q2_024_partial_16_0144,
  ep_Q2_024_partial_16_0145,
  ep_Q2_024_partial_16_0146,
  ep_Q2_024_partial_16_0147,
  ep_Q2_024_partial_16_0148,
  ep_Q2_024_partial_16_0149,
  ep_Q2_024_partial_16_0150,
  ep_Q2_024_partial_16_0151,
  ep_Q2_024_partial_16_0152,
  ep_Q2_024_partial_16_0153,
  ep_Q2_024_partial_16_0154,
  ep_Q2_024_partial_16_0155,
  ep_Q2_024_partial_16_0156,
  ep_Q2_024_partial_16_0157,
  ep_Q2_024_partial_16_0158,
  ep_Q2_024_partial_16_0159,
  ep_Q2_024_partial_16_0160,
  ep_Q2_024_partial_16_0161,
  ep_Q2_024_partial_16_0162,
  ep_Q2_024_partial_16_0163,
  ep_Q2_024_partial_16_0164,
  ep_Q2_024_partial_16_0165,
  ep_Q2_024_partial_16_0166,
  ep_Q2_024_partial_16_0167,
  ep_Q2_024_partial_16_0168,
  ep_Q2_024_partial_16_0169,
  ep_Q2_024_partial_16_0170,
  ep_Q2_024_partial_16_0171,
  ep_Q2_024_partial_16_0172,
  ep_Q2_024_partial_16_0173,
  ep_Q2_024_partial_16_0174,
  ep_Q2_024_partial_16_0175,
  ep_Q2_024_partial_16_0176,
  ep_Q2_024_partial_16_0177,
  ep_Q2_024_partial_16_0178,
  ep_Q2_024_partial_16_0179,
  ep_Q2_024_partial_16_0180,
  ep_Q2_024_partial_16_0181,
  ep_Q2_024_partial_16_0182,
  ep_Q2_024_partial_16_0183,
  ep_Q2_024_partial_16_0184,
  ep_Q2_024_partial_16_0185,
  ep_Q2_024_partial_16_0186,
  ep_Q2_024_partial_16_0187,
  ep_Q2_024_partial_16_0188,
  ep_Q2_024_partial_16_0189,
  ep_Q2_024_partial_16_0190,
  ep_Q2_024_partial_16_0191,
  ep_Q2_024_partial_16_0192,
  ep_Q2_024_partial_16_0193,
  ep_Q2_024_partial_16_0194,
  ep_Q2_024_partial_16_0195,
  ep_Q2_024_partial_16_0196,
  ep_Q2_024_partial_16_0197,
  ep_Q2_024_partial_16_0198,
  ep_Q2_024_partial_16_0199
]

/-- Sum of partial products in this block. -/
def ep_Q2_024_block_16_0100_0199 : Poly :=
[
  term ((397491232950237887996184205565539271127191104441069376 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 2), (2, 1), (6, 1), (12, 1), (15, 2)],
  term ((-1054421534548864 : Rat) / 1162780221153193) [(1, 2), (2, 1), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((139330115741603796400697706988737032183292881427306533069 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(1, 2), (2, 1), (6, 1), (13, 1), (15, 1)],
  term ((9285325420604210 : Rat) / 3488340663459579) [(1, 2), (2, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-35872082912479516783228343176982794024 : Rat) / 30501087900062982116102377831259472915) [(1, 2), (2, 1), (6, 1), (13, 2)],
  term ((950014417882063654777403695704896236874 : Rat) / 1799564186103715944850040292044308901985) [(1, 2), (2, 1), (6, 1), (14, 1)],
  term ((-48149040762380605957283223708949530656612384923649674829 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(1, 2), (2, 1), (6, 1), (15, 2)],
  term ((-8133929093983298 : Rat) / 3488340663459579) [(1, 2), (2, 1), (6, 1), (15, 2), (16, 1)],
  term ((-198745616475118943998092102782769635563595552220534688 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 2), (2, 2), (12, 1), (15, 2)],
  term ((527210767274432 : Rat) / 1162780221153193) [(1, 2), (2, 2), (12, 1), (15, 2), (16, 1)],
  term ((-139330115741603796400697706988737032183292881427306533069 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(1, 2), (2, 2), (13, 1), (15, 1)],
  term ((-4642662710302105 : Rat) / 3488340663459579) [(1, 2), (2, 2), (13, 1), (15, 1), (16, 1)],
  term ((17936041456239758391614171588491397012 : Rat) / 30501087900062982116102377831259472915) [(1, 2), (2, 2), (13, 2)],
  term ((-475007208941031827388701847852448118437 : Rat) / 1799564186103715944850040292044308901985) [(1, 2), (2, 2), (14, 1)],
  term ((48149040762380605957283223708949530656612384923649674829 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(1, 2), (2, 2), (15, 2)],
  term ((4066964546991649 : Rat) / 3488340663459579) [(1, 2), (2, 2), (15, 2), (16, 1)],
  term ((397491232950237887996184205565539271127191104441069376 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 2), (3, 1), (7, 1), (12, 1), (15, 2)],
  term ((-1054421534548864 : Rat) / 1162780221153193) [(1, 2), (3, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((139330115741603796400697706988737032183292881427306533069 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(1, 2), (3, 1), (7, 1), (13, 1), (15, 1)],
  term ((9285325420604210 : Rat) / 3488340663459579) [(1, 2), (3, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-35872082912479516783228343176982794024 : Rat) / 30501087900062982116102377831259472915) [(1, 2), (3, 1), (7, 1), (13, 2)],
  term ((950014417882063654777403695704896236874 : Rat) / 1799564186103715944850040292044308901985) [(1, 2), (3, 1), (7, 1), (14, 1)],
  term ((-48149040762380605957283223708949530656612384923649674829 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(1, 2), (3, 1), (7, 1), (15, 2)],
  term ((-8133929093983298 : Rat) / 3488340663459579) [(1, 2), (3, 1), (7, 1), (15, 2), (16, 1)],
  term ((-198745616475118943998092102782769635563595552220534688 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 2), (3, 2), (12, 1), (15, 2)],
  term ((527210767274432 : Rat) / 1162780221153193) [(1, 2), (3, 2), (12, 1), (15, 2), (16, 1)],
  term ((-139330115741603796400697706988737032183292881427306533069 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(1, 2), (3, 2), (13, 1), (15, 1)],
  term ((-4642662710302105 : Rat) / 3488340663459579) [(1, 2), (3, 2), (13, 1), (15, 1), (16, 1)],
  term ((17936041456239758391614171588491397012 : Rat) / 30501087900062982116102377831259472915) [(1, 2), (3, 2), (13, 2)],
  term ((-475007208941031827388701847852448118437 : Rat) / 1799564186103715944850040292044308901985) [(1, 2), (3, 2), (14, 1)],
  term ((48149040762380605957283223708949530656612384923649674829 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(1, 2), (3, 2), (15, 2)],
  term ((4066964546991649 : Rat) / 3488340663459579) [(1, 2), (3, 2), (15, 2), (16, 1)],
  term ((-5860298469427302226261358975602624182032 : Rat) / 1799564186103715944850040292044308901985) [(2, 1), (3, 1), (4, 1), (6, 1), (9, 1)],
  term ((67563934515587234973630412146306275392 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (3, 1), (5, 1), (6, 1), (7, 1), (9, 1)],
  term ((80880299190047857864233171441849366144 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (3, 1), (5, 1), (6, 1), (7, 1), (13, 1)],
  term ((-4347249035505462526858846771514645871341141380863831296 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 1), (3, 1), (5, 1), (6, 1), (7, 1), (15, 1)],
  term ((-413883074046464 : Rat) / 1162780221153193) [(2, 1), (3, 1), (5, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-6165856953172307781425119933296829376 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (3, 1), (5, 1), (6, 1), (9, 1), (13, 1)],
  term ((-6639739927549625818104465621692298586214344944695385584 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 1), (3, 1), (5, 1), (6, 1), (9, 1), (15, 1)],
  term ((2487823789554368 : Rat) / 3488340663459579) [(2, 1), (3, 1), (5, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((33781967257793617486815206073153137696 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (3, 1), (5, 1), (6, 1), (9, 2)],
  term ((-33781967257793617486815206073153137696 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (3, 1), (5, 1), (7, 1), (9, 1)],
  term ((-40440149595023928932116585720924683072 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (3, 1), (5, 1), (7, 1), (13, 1)],
  term ((2173624517752731263429423385757322935670570690431915648 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 1), (3, 1), (5, 1), (7, 1), (15, 1)],
  term ((206941537023232 : Rat) / 1162780221153193) [(2, 1), (3, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((113870637374100747540866397468259089636 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (3, 1), (6, 1), (7, 1)],
  term ((-313099205974796891704814566834029023616 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (3, 1), (6, 1), (7, 1), (9, 1), (13, 1)],
  term ((4898040419692806749424149347787096834615465390033086364 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 1), (3, 1), (6, 1), (7, 1), (9, 1), (15, 1)],
  term ((-2990296899089872 : Rat) / 1162780221153193) [(2, 1), (3, 1), (6, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-252450128745879785325220575726801684224 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (3, 1), (6, 1), (7, 1), (9, 2)],
  term ((23010147928799045692499742092991476195705377154103841928 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 1), (3, 1), (6, 1), (7, 1), (13, 1), (15, 1)],
  term ((-301322371177440 : Rat) / 1162780221153193) [(2, 1), (3, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-161891712224135268464196480124956186688 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (3, 1), (6, 1), (7, 1), (13, 2)],
  term ((-35684606111448167526237422423713566304 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (3, 1), (6, 1), (7, 1), (14, 1)],
  term ((-11267418267709793249360068694802780071340436008626146210 : Rat) / 139499842819802972775716014625439884620101963487119207) [(2, 1), (3, 1), (6, 1), (7, 1), (15, 2)],
  term ((8526632792004408 : Rat) / 1162780221153193) [(2, 1), (3, 1), (6, 1), (7, 1), (15, 2), (16, 1)],
  term ((3305390256600957304750147809747473899456 : Rat) / 1799564186103715944850040292044308901985) [(2, 1), (3, 1), (6, 1), (8, 1), (9, 1)],
  term ((-24088986040854524616753489353793033479836 : Rat) / 5398692558311147834550120876132926705955) [(2, 1), (3, 1), (6, 1), (9, 1)],
  term ((359800988817789934888267636369853231432 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (3, 1), (6, 1), (9, 1), (12, 1)],
  term ((-44365241360347559907548253348032480896 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (3, 1), (6, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((794982465900475775992368411131078542254382208882138752 : Rat) / 139499842819802972775716014625439884620101963487119207) [(2, 1), (3, 1), (6, 1), (9, 1), (12, 1), (15, 2)],
  term ((-2108843069097728 : Rat) / 1162780221153193) [(2, 1), (3, 1), (6, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((36326709823775404890386910227678820329661108457314367451 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(2, 1), (3, 1), (6, 1), (9, 1), (13, 1), (15, 1)],
  term ((-10375057428886340 : Rat) / 3488340663459579) [(2, 1), (3, 1), (6, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((394147835050448810694877824632526207856 : Rat) / 359912837220743188970008058408861780397) [(2, 1), (3, 1), (6, 1), (9, 1), (13, 2)],
  term ((508470349154038865005416199007327333444 : Rat) / 359912837220743188970008058408861780397) [(2, 1), (3, 1), (6, 1), (9, 1), (14, 1)],
  term ((408424516433622249313695112340266633602697230933700476949 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(2, 1), (3, 1), (6, 1), (9, 1), (15, 2)],
  term ((-88310522894084572 : Rat) / 3488340663459579) [(2, 1), (3, 1), (6, 1), (9, 1), (15, 2), (16, 1)],
  term ((-73424885016391334592524874103881802976 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (3, 1), (6, 1), (9, 2), (13, 1)],
  term ((-451584493334593143508692345332818085290440040420989034 : Rat) / 418499528459408918327148043876319653860305890461357621) [(2, 1), (3, 1), (6, 1), (9, 2), (15, 1)],
  term ((-1495148449544936 : Rat) / 3488340663459579) [(2, 1), (3, 1), (6, 1), (9, 2), (15, 1), (16, 1)],
  term ((-126225064372939892662610287863400842112 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (3, 1), (6, 1), (9, 3)],
  term ((-1109385824438654667857169094847372299448 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (3, 1), (6, 1), (13, 1)],
  term ((-37050814747583503133753456969502764146050338642007357993 : Rat) / 929998952132019818504773430836265897467346423247461380) [(2, 1), (3, 1), (6, 1), (15, 1)],
  term ((5146839986298265 : Rat) / 1162780221153193) [(2, 1), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((-54794774110243944184967625465000829738 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (3, 1), (7, 1)],
  term ((-99588034536269143179180521288457931024 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (3, 1), (7, 1), (9, 1), (12, 1), (13, 1)],
  term ((550464729340465184219154740052350989658090880526284951 : Rat) / 46499947606600990925238671541813294873367321162373069) [(2, 1), (3, 1), (7, 1), (9, 1), (12, 1), (15, 1)],
  term ((-2606770083157932 : Rat) / 1162780221153193) [(2, 1), (3, 1), (7, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((4913432086816639513447140917883130439336 : Rat) / 1799564186103715944850040292044308901985) [(2, 1), (3, 1), (7, 1), (9, 1), (13, 1)],
  term ((1332660221722390369768035740007759937168019429542401749 : Rat) / 278999685639605945551432029250879769240203926974238414) [(2, 1), (3, 1), (7, 1), (9, 1), (15, 1)],
  term ((2553226962037678 : Rat) / 3488340663459579) [(2, 1), (3, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((520071569087566130983140885545684619440 : Rat) / 119970945740247729656669352802953926799) [(2, 1), (3, 1), (7, 1), (9, 2)],
  term ((-2140544576806429585465573269128715080 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (3, 1), (7, 1), (12, 1)],
  term ((-11505073964399522846249871046495738097852688577051920964 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 1), (3, 1), (7, 1), (13, 1), (15, 1)],
  term ((150661185588720 : Rat) / 1162780221153193) [(2, 1), (3, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((80945856112067634232098240062478093344 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (3, 1), (7, 1), (13, 2)],
  term ((17842303055724083763118711211856783152 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (3, 1), (7, 1), (14, 1)],
  term ((5633709133854896624680034347401390035670218004313073105 : Rat) / 139499842819802972775716014625439884620101963487119207) [(2, 1), (3, 1), (7, 1), (15, 2)],
  term ((-4263316396002204 : Rat) / 1162780221153193) [(2, 1), (3, 1), (7, 1), (15, 2), (16, 1)],
  term ((-188872788902134093312121307614657195064 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (3, 1), (7, 2), (9, 1)],
  term ((-2154555311573116448150370991620883146496 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (3, 1), (7, 2), (13, 1)],
  term ((-37050814747583503133753456969502764146050338642007357993 : Rat) / 464999476066009909252386715418132948733673211623730690) [(2, 1), (3, 1), (7, 2), (15, 1)],
  term ((10293679972596530 : Rat) / 1162780221153193) [(2, 1), (3, 1), (7, 2), (15, 1), (16, 1)],
  term ((27397387055121972092483812732500414869 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (3, 2)],
  term ((16890983628896808743407603036576568848 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (3, 2), (5, 1), (9, 1)],
  term ((20220074797511964466058292860462341536 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (3, 2), (5, 1), (13, 1)],
  term ((-1086812258876365631714711692878661467835285345215957824 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 1), (3, 2), (5, 1), (15, 1)],
  term ((-103470768511616 : Rat) / 1162780221153193) [(2, 1), (3, 2), (5, 1), (15, 1), (16, 1)],
  term ((326120074889329731677493426804560094196 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (3, 2), (7, 1), (9, 1)],
  term ((1077277655786558224075185495810441573248 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (3, 2), (7, 1), (13, 1)],
  term ((37050814747583503133753456969502764146050338642007357993 : Rat) / 929998952132019818504773430836265897467346423247461380) [(2, 1), (3, 2), (7, 1), (15, 1)],
  term ((-5146839986298265 : Rat) / 1162780221153193) [(2, 1), (3, 2), (7, 1), (15, 1), (16, 1)],
  term ((49794017268134571589590260644228965512 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (3, 2), (9, 1), (12, 1), (13, 1)],
  term ((-550464729340465184219154740052350989658090880526284951 : Rat) / 92999895213201981850477343083626589746734642324746138) [(2, 1), (3, 2), (9, 1), (12, 1), (15, 1)],
  term ((1303385041578966 : Rat) / 1162780221153193) [(2, 1), (3, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2456716043408319756723570458941565219668 : Rat) / 1799564186103715944850040292044308901985) [(2, 1), (3, 2), (9, 1), (13, 1)],
  term ((-1332660221722390369768035740007759937168019429542401749 : Rat) / 557999371279211891102864058501759538480407853948476828) [(2, 1), (3, 2), (9, 1), (15, 1)],
  term ((-1276613481018839 : Rat) / 3488340663459579) [(2, 1), (3, 2), (9, 1), (15, 1), (16, 1)],
  term ((-260035784543783065491570442772842309720 : Rat) / 119970945740247729656669352802953926799) [(2, 1), (3, 2), (9, 2)],
  term ((1070272288403214792732786634564357540 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (3, 2), (12, 1)],
  term ((5752536982199761423124935523247869048926344288525960482 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 1), (3, 2), (13, 1), (15, 1)],
  term ((-75330592794360 : Rat) / 1162780221153193) [(2, 1), (3, 2), (13, 1), (15, 1), (16, 1)],
  term ((-40472928056033817116049120031239046672 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (3, 2), (13, 2)],
  term ((-8921151527862041881559355605928391576 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (3, 2), (14, 1)],
  term ((-5633709133854896624680034347401390035670218004313073105 : Rat) / 278999685639605945551432029250879769240203926974238414) [(2, 1), (3, 2), (15, 2)],
  term ((2131658198001102 : Rat) / 1162780221153193) [(2, 1), (3, 2), (15, 2), (16, 1)],
  term ((-4281089153612859170931146538257430160 : Rat) / 119970945740247729656669352802953926799) [(2, 1), (3, 3), (9, 1)],
  term ((33781967257793617486815206073153137696 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (4, 1), (5, 1), (6, 1), (9, 1)],
  term ((40440149595023928932116585720924683072 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (4, 1), (5, 1), (6, 1), (13, 1)],
  term ((-2173624517752731263429423385757322935670570690431915648 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 1), (4, 1), (5, 1), (6, 1), (15, 1)],
  term ((-206941537023232 : Rat) / 1162780221153193) [(2, 1), (4, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-1456153465828963514683780388294727653932 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (4, 1), (6, 1)],
  term ((3298592456768137153482752124853865965528 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (4, 1), (6, 1), (7, 1), (9, 1)],
  term ((-591245842771513152566512482848664670600 : Rat) / 119970945740247729656669352802953926799) [(2, 1), (4, 1), (6, 1), (7, 1), (13, 1)],
  term ((1279332772588430482173835610044994821028103267071148719 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 1), (4, 1), (6, 1), (7, 1), (15, 1)],
  term ((-138734947392764 : Rat) / 1162780221153193) [(2, 1), (4, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-36467538503288101065248187180950605616 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (4, 1), (6, 1), (9, 1), (13, 1)],
  term ((-693784745281181117802250150195878019154689294781954884 : Rat) / 139499842819802972775716014625439884620101963487119207) [(2, 1), (4, 1), (6, 1), (9, 1), (15, 1)],
  term ((-891111407197296 : Rat) / 1162780221153193) [(2, 1), (4, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((1256806778871963475092715281258346677976 : Rat) / 1799564186103715944850040292044308901985) [(2, 1), (4, 1), (6, 1), (9, 2)],
  term ((1465074617356825556565339743900656045508 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (4, 1), (6, 1), (12, 1)],
  term ((6043130038758612655481222570993244851010042396287040947 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 1), (4, 1), (6, 1), (13, 1), (15, 1)],
  term ((449147252927612 : Rat) / 1162780221153193) [(2, 1), (4, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-31180138806738606098528341860429962368 : Rat) / 119970945740247729656669352802953926799) [(2, 1), (4, 1), (6, 1), (13, 2)],
  term ((-8921151527862041881559355605928391576 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (4, 1), (6, 1), (14, 1)],
  term ((-7554608628259157661858344611693643317158664401599804758 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 1), (4, 1), (6, 1), (15, 2)],
  term ((1065110533471208 : Rat) / 1162780221153193) [(2, 1), (4, 1), (6, 1), (15, 2), (16, 1)],
  term ((62386244260293295101397022985083941776 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (5, 1), (6, 1), (7, 1), (9, 1), (13, 1)],
  term ((-2535625371610927364088760757893317616179174661894485856 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 1), (5, 1), (6, 1), (7, 1), (9, 1), (15, 1)],
  term ((-6320767569759744 : Rat) / 1162780221153193) [(2, 1), (5, 1), (6, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((212806442013706858520211024067520156944 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (5, 1), (6, 1), (7, 1), (9, 2)],
  term ((2535625371610927364088760757893317616179174661894485856 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 1), (5, 1), (6, 1), (7, 1), (13, 1), (15, 1)],
  term ((6320767569759744 : Rat) / 1162780221153193) [(2, 1), (5, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-55038537254800030724321609410520819744 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (5, 1), (6, 1), (7, 1), (13, 2)],
  term ((-8722583572881049913476692858109487493088 : Rat) / 1799564186103715944850040292044308901985) [(2, 1), (5, 1), (6, 1), (9, 1)],
  term ((169515753193323375591410655965460499528 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (5, 1), (6, 1), (9, 1), (12, 1)],
  term ((2930149234713651113130679487801312091016 : Rat) / 1799564186103715944850040292044308901985) [(2, 2), (3, 1), (4, 1), (9, 1)],
  term ((-33781967257793617486815206073153137696 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (3, 1), (5, 1), (7, 1), (9, 1)],
  term ((-40440149595023928932116585720924683072 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (3, 1), (5, 1), (7, 1), (13, 1)],
  term ((2173624517752731263429423385757322935670570690431915648 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 2), (3, 1), (5, 1), (7, 1), (15, 1)],
  term ((206941537023232 : Rat) / 1162780221153193) [(2, 2), (3, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((3082928476586153890712559966648414688 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (3, 1), (5, 1), (9, 1), (13, 1)],
  term ((3319869963774812909052232810846149293107172472347692792 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 2), (3, 1), (5, 1), (9, 1), (15, 1)],
  term ((-1243911894777184 : Rat) / 3488340663459579) [(2, 2), (3, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((-16890983628896808743407603036576568848 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (3, 1), (5, 1), (9, 2)],
  term ((8562178307225718341862293076514860320 : Rat) / 119970945740247729656669352802953926799) [(2, 2), (3, 1), (6, 1), (9, 1)],
  term ((-56935318687050373770433198734129544818 : Rat) / 39990315246749243218889784267651308933) [(2, 2), (3, 1), (7, 1)],
  term ((156549602987398445852407283417014511808 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (3, 1), (7, 1), (9, 1), (13, 1)],
  term ((-2449020209846403374712074673893548417307732695016543182 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 2), (3, 1), (7, 1), (9, 1), (15, 1)],
  term ((1495148449544936 : Rat) / 1162780221153193) [(2, 2), (3, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((126225064372939892662610287863400842112 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (3, 1), (7, 1), (9, 2)],
  term ((-11505073964399522846249871046495738097852688577051920964 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 2), (3, 1), (7, 1), (13, 1), (15, 1)],
  term ((150661185588720 : Rat) / 1162780221153193) [(2, 2), (3, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((80945856112067634232098240062478093344 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (3, 1), (7, 1), (13, 2)],
  term ((17842303055724083763118711211856783152 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (3, 1), (7, 1), (14, 1)],
  term ((5633709133854896624680034347401390035670218004313073105 : Rat) / 139499842819802972775716014625439884620101963487119207) [(2, 2), (3, 1), (7, 1), (15, 2)],
  term ((-4263316396002204 : Rat) / 1162780221153193) [(2, 2), (3, 1), (7, 1), (15, 2), (16, 1)],
  term ((-1652695128300478652375073904873736949728 : Rat) / 1799564186103715944850040292044308901985) [(2, 2), (3, 1), (8, 1), (9, 1)],
  term ((12044493020427262308376744676896516739918 : Rat) / 5398692558311147834550120876132926705955) [(2, 2), (3, 1), (9, 1)],
  term ((-179900494408894967444133818184926615716 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (3, 1), (9, 1), (12, 1)],
  term ((22182620680173779953774126674016240448 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (3, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((-397491232950237887996184205565539271127191104441069376 : Rat) / 139499842819802972775716014625439884620101963487119207) [(2, 2), (3, 1), (9, 1), (12, 1), (15, 2)],
  term ((1054421534548864 : Rat) / 1162780221153193) [(2, 2), (3, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-36326709823775404890386910227678820329661108457314367451 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(2, 2), (3, 1), (9, 1), (13, 1), (15, 1)],
  term ((5187528714443170 : Rat) / 3488340663459579) [(2, 2), (3, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-197073917525224405347438912316263103928 : Rat) / 359912837220743188970008058408861780397) [(2, 2), (3, 1), (9, 1), (13, 2)],
  term ((-254235174577019432502708099503663666722 : Rat) / 359912837220743188970008058408861780397) [(2, 2), (3, 1), (9, 1), (14, 1)],
  term ((-408424516433622249313695112340266633602697230933700476949 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(2, 2), (3, 1), (9, 1), (15, 2)],
  term ((44155261447042286 : Rat) / 3488340663459579) [(2, 2), (3, 1), (9, 1), (15, 2), (16, 1)],
  term ((36712442508195667296262437051940901488 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (3, 1), (9, 2), (13, 1)],
  term ((225792246667296571754346172666409042645220020210494517 : Rat) / 418499528459408918327148043876319653860305890461357621) [(2, 2), (3, 1), (9, 2), (15, 1)],
  term ((747574224772468 : Rat) / 3488340663459579) [(2, 2), (3, 1), (9, 2), (15, 1), (16, 1)],
  term ((63112532186469946331305143931700421056 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (3, 1), (9, 3)],
  term ((554692912219327333928584547423686149724 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (3, 1), (13, 1)],
  term ((37050814747583503133753456969502764146050338642007357993 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(2, 2), (3, 1), (15, 1)],
  term ((-5146839986298265 : Rat) / 2325560442306386) [(2, 2), (3, 1), (15, 1), (16, 1)],
  term ((728076732914481757341890194147363826966 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (4, 1)],
  term ((-16890983628896808743407603036576568848 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (4, 1), (5, 1), (9, 1)],
  term ((-20220074797511964466058292860462341536 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (4, 1), (5, 1), (13, 1)],
  term ((1086812258876365631714711692878661467835285345215957824 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 2), (4, 1), (5, 1), (15, 1)],
  term ((103470768511616 : Rat) / 1162780221153193) [(2, 2), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((-1649296228384068576741376062426932982764 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (4, 1), (7, 1), (9, 1)],
  term ((295622921385756576283256241424332335300 : Rat) / 119970945740247729656669352802953926799) [(2, 2), (4, 1), (7, 1), (13, 1)],
  term ((-1279332772588430482173835610044994821028103267071148719 : Rat) / 464999476066009909252386715418132948733673211623730690) [(2, 2), (4, 1), (7, 1), (15, 1)],
  term ((69367473696382 : Rat) / 1162780221153193) [(2, 2), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((18233769251644050532624093590475302808 : Rat) / 39990315246749243218889784267651308933) [(2, 2), (4, 1), (9, 1), (13, 1)],
  term ((346892372640590558901125075097939009577344647390977442 : Rat) / 139499842819802972775716014625439884620101963487119207) [(2, 2), (4, 1), (9, 1), (15, 1)],
  term ((445555703598648 : Rat) / 1162780221153193) [(2, 2), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((-628403389435981737546357640629173338988 : Rat) / 1799564186103715944850040292044308901985) [(2, 2), (4, 1), (9, 2)],
  term ((-732537308678412778282669871950328022754 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (4, 1), (12, 1)],
  term ((-6043130038758612655481222570993244851010042396287040947 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(2, 2), (4, 1), (13, 1), (15, 1)],
  term ((-224573626463806 : Rat) / 1162780221153193) [(2, 2), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((15590069403369303049264170930214981184 : Rat) / 119970945740247729656669352802953926799) [(2, 2), (4, 1), (13, 2)],
  term ((4460575763931020940779677802964195788 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (4, 1), (14, 1)],
  term ((3777304314129578830929172305846821658579332200799902379 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 2), (4, 1), (15, 2)],
  term ((-532555266735604 : Rat) / 1162780221153193) [(2, 2), (4, 1), (15, 2), (16, 1)],
  term ((-33781967257793617486815206073153137696 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (5, 1), (6, 1), (9, 1)],
  term ((-40440149595023928932116585720924683072 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (5, 1), (6, 1), (13, 1)],
  term ((2173624517752731263429423385757322935670570690431915648 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 2), (5, 1), (6, 1), (15, 1)],
  term ((206941537023232 : Rat) / 1162780221153193) [(2, 2), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-31193122130146647550698511492541970888 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (5, 1), (7, 1), (9, 1), (13, 1)],
  term ((1267812685805463682044380378946658808089587330947242928 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 2), (5, 1), (7, 1), (9, 1), (15, 1)],
  term ((3160383784879872 : Rat) / 1162780221153193) [(2, 2), (5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-106403221006853429260105512033760078472 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (5, 1), (7, 1), (9, 2)],
  term ((-1267812685805463682044380378946658808089587330947242928 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 2), (5, 1), (7, 1), (13, 1), (15, 1)],
  term ((-3160383784879872 : Rat) / 1162780221153193) [(2, 2), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((27519268627400015362160804705260409872 : Rat) / 39990315246749243218889784267651308933) [(2, 2), (5, 1), (7, 1), (13, 2)],
  term ((4361291786440524956738346429054743746544 : Rat) / 1799564186103715944850040292044308901985) [(2, 2), (5, 1), (9, 1)],
  term ((-84757876596661687795705327982730249764 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (5, 1), (9, 1), (12, 1)],
  term ((-54794774110243944184967625465000829738 : Rat) / 39990315246749243218889784267651308933) [(2, 2), (6, 1)],
  term ((-188872788902134093312121307614657195064 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (6, 1), (7, 1), (9, 1)],
  term ((-2154555311573116448150370991620883146496 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (6, 1), (7, 1), (13, 1)],
  term ((-37050814747583503133753456969502764146050338642007357993 : Rat) / 464999476066009909252386715418132948733673211623730690) [(2, 2), (6, 1), (7, 1), (15, 1)],
  term ((10293679972596530 : Rat) / 1162780221153193) [(2, 2), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-99588034536269143179180521288457931024 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (6, 1), (9, 1), (12, 1), (13, 1)],
  term ((550464729340465184219154740052350989658090880526284951 : Rat) / 46499947606600990925238671541813294873367321162373069) [(2, 2), (6, 1), (9, 1), (12, 1), (15, 1)],
  term ((-2606770083157932 : Rat) / 1162780221153193) [(2, 2), (6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((4913432086816639513447140917883130439336 : Rat) / 1799564186103715944850040292044308901985) [(2, 2), (6, 1), (9, 1), (13, 1)],
  term ((1332660221722390369768035740007759937168019429542401749 : Rat) / 278999685639605945551432029250879769240203926974238414) [(2, 2), (6, 1), (9, 1), (15, 1)],
  term ((2553226962037678 : Rat) / 3488340663459579) [(2, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((520071569087566130983140885545684619440 : Rat) / 119970945740247729656669352802953926799) [(2, 2), (6, 1), (9, 2)],
  term ((-2140544576806429585465573269128715080 : Rat) / 39990315246749243218889784267651308933) [(2, 2), (6, 1), (12, 1)],
  term ((-11505073964399522846249871046495738097852688577051920964 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 2), (6, 1), (13, 1), (15, 1)],
  term ((150661185588720 : Rat) / 1162780221153193) [(2, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((80945856112067634232098240062478093344 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (6, 1), (13, 2)],
  term ((17842303055724083763118711211856783152 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (6, 1), (14, 1)],
  term ((5633709133854896624680034347401390035670218004313073105 : Rat) / 139499842819802972775716014625439884620101963487119207) [(2, 2), (6, 1), (15, 2)],
  term ((-4263316396002204 : Rat) / 1162780221153193) [(2, 2), (6, 1), (15, 2), (16, 1)],
  term ((27397387055121972092483812732500414869 : Rat) / 39990315246749243218889784267651308933) [(2, 3)],
  term ((-4281089153612859170931146538257430160 : Rat) / 119970945740247729656669352802953926799) [(2, 3), (3, 1), (9, 1)],
  term ((16890983628896808743407603036576568848 : Rat) / 199951576233746216094448921338256544665) [(2, 3), (5, 1), (9, 1)],
  term ((20220074797511964466058292860462341536 : Rat) / 199951576233746216094448921338256544665) [(2, 3), (5, 1), (13, 1)],
  term ((-1086812258876365631714711692878661467835285345215957824 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 3), (5, 1), (15, 1)],
  term ((-103470768511616 : Rat) / 1162780221153193) [(2, 3), (5, 1), (15, 1), (16, 1)],
  term ((94436394451067046656060653807328597532 : Rat) / 199951576233746216094448921338256544665) [(2, 3), (7, 1), (9, 1)],
  term ((1077277655786558224075185495810441573248 : Rat) / 599854728701238648283346764014769633995) [(2, 3), (7, 1), (13, 1)],
  term ((37050814747583503133753456969502764146050338642007357993 : Rat) / 929998952132019818504773430836265897467346423247461380) [(2, 3), (7, 1), (15, 1)],
  term ((-5146839986298265 : Rat) / 1162780221153193) [(2, 3), (7, 1), (15, 1), (16, 1)],
  term ((49794017268134571589590260644228965512 : Rat) / 199951576233746216094448921338256544665) [(2, 3), (9, 1), (12, 1), (13, 1)],
  term ((-550464729340465184219154740052350989658090880526284951 : Rat) / 92999895213201981850477343083626589746734642324746138) [(2, 3), (9, 1), (12, 1), (15, 1)],
  term ((1303385041578966 : Rat) / 1162780221153193) [(2, 3), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2456716043408319756723570458941565219668 : Rat) / 1799564186103715944850040292044308901985) [(2, 3), (9, 1), (13, 1)],
  term ((-1332660221722390369768035740007759937168019429542401749 : Rat) / 557999371279211891102864058501759538480407853948476828) [(2, 3), (9, 1), (15, 1)],
  term ((-1276613481018839 : Rat) / 3488340663459579) [(2, 3), (9, 1), (15, 1), (16, 1)],
  term ((-260035784543783065491570442772842309720 : Rat) / 119970945740247729656669352802953926799) [(2, 3), (9, 2)],
  term ((1070272288403214792732786634564357540 : Rat) / 39990315246749243218889784267651308933) [(2, 3), (12, 1)],
  term ((5752536982199761423124935523247869048926344288525960482 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 3), (13, 1), (15, 1)],
  term ((-75330592794360 : Rat) / 1162780221153193) [(2, 3), (13, 1), (15, 1), (16, 1)],
  term ((-40472928056033817116049120031239046672 : Rat) / 599854728701238648283346764014769633995) [(2, 3), (13, 2)],
  term ((-8921151527862041881559355605928391576 : Rat) / 199951576233746216094448921338256544665) [(2, 3), (14, 1)],
  term ((-5633709133854896624680034347401390035670218004313073105 : Rat) / 278999685639605945551432029250879769240203926974238414) [(2, 3), (15, 2)],
  term ((2131658198001102 : Rat) / 1162780221153193) [(2, 3), (15, 2), (16, 1)],
  term ((33781967257793617486815206073153137696 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (4, 1), (5, 1), (7, 1), (9, 1)],
  term ((40440149595023928932116585720924683072 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (4, 1), (5, 1), (7, 1), (13, 1)],
  term ((-2173624517752731263429423385757322935670570690431915648 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (4, 1), (5, 1), (7, 1), (15, 1)],
  term ((-206941537023232 : Rat) / 1162780221153193) [(3, 1), (4, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-1456153465828963514683780388294727653932 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (4, 1), (7, 1)],
  term ((-36467538503288101065248187180950605616 : Rat) / 39990315246749243218889784267651308933) [(3, 1), (4, 1), (7, 1), (9, 1), (13, 1)],
  term ((-693784745281181117802250150195878019154689294781954884 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 1), (4, 1), (7, 1), (9, 1), (15, 1)],
  term ((-891111407197296 : Rat) / 1162780221153193) [(3, 1), (4, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((1256806778871963475092715281258346677976 : Rat) / 1799564186103715944850040292044308901985) [(3, 1), (4, 1), (7, 1), (9, 2)],
  term ((1465074617356825556565339743900656045508 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (4, 1), (7, 1), (12, 1)],
  term ((6043130038758612655481222570993244851010042396287040947 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (4, 1), (7, 1), (13, 1), (15, 1)],
  term ((449147252927612 : Rat) / 1162780221153193) [(3, 1), (4, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-31180138806738606098528341860429962368 : Rat) / 119970945740247729656669352802953926799) [(3, 1), (4, 1), (7, 1), (13, 2)],
  term ((-8921151527862041881559355605928391576 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (4, 1), (7, 1), (14, 1)],
  term ((-7554608628259157661858344611693643317158664401599804758 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (4, 1), (7, 1), (15, 2)],
  term ((1065110533471208 : Rat) / 1162780221153193) [(3, 1), (4, 1), (7, 1), (15, 2), (16, 1)],
  term ((3298592456768137153482752124853865965528 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (4, 1), (7, 2), (9, 1)],
  term ((-591245842771513152566512482848664670600 : Rat) / 119970945740247729656669352802953926799) [(3, 1), (4, 1), (7, 2), (13, 1)],
  term ((1279332772588430482173835610044994821028103267071148719 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (4, 1), (7, 2), (15, 1)],
  term ((-138734947392764 : Rat) / 1162780221153193) [(3, 1), (4, 1), (7, 2), (15, 1), (16, 1)],
  term ((-8722583572881049913476692858109487493088 : Rat) / 1799564186103715944850040292044308901985) [(3, 1), (5, 1), (7, 1), (9, 1)],
  term ((169515753193323375591410655965460499528 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (7, 1), (9, 1), (12, 1)],
  term ((62386244260293295101397022985083941776 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (7, 2), (9, 1), (13, 1)],
  term ((-2535625371610927364088760757893317616179174661894485856 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (5, 1), (7, 2), (9, 1), (15, 1)],
  term ((-6320767569759744 : Rat) / 1162780221153193) [(3, 1), (5, 1), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((212806442013706858520211024067520156944 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (7, 2), (9, 2)],
  term ((2535625371610927364088760757893317616179174661894485856 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (5, 1), (7, 2), (13, 1), (15, 1)],
  term ((6320767569759744 : Rat) / 1162780221153193) [(3, 1), (5, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-55038537254800030724321609410520819744 : Rat) / 39990315246749243218889784267651308933) [(3, 1), (5, 1), (7, 2), (13, 2)],
  term ((728076732914481757341890194147363826966 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (4, 1)],
  term ((-16890983628896808743407603036576568848 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (4, 1), (5, 1), (9, 1)],
  term ((-20220074797511964466058292860462341536 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (4, 1), (5, 1), (13, 1)],
  term ((1086812258876365631714711692878661467835285345215957824 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 2), (4, 1), (5, 1), (15, 1)],
  term ((103470768511616 : Rat) / 1162780221153193) [(3, 2), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((-10808187154579507956485487162883423130324 : Rat) / 1799564186103715944850040292044308901985) [(3, 2), (4, 1), (7, 1), (9, 1)],
  term ((295622921385756576283256241424332335300 : Rat) / 119970945740247729656669352802953926799) [(3, 2), (4, 1), (7, 1), (13, 1)],
  term ((-1279332772588430482173835610044994821028103267071148719 : Rat) / 464999476066009909252386715418132948733673211623730690) [(3, 2), (4, 1), (7, 1), (15, 1)],
  term ((69367473696382 : Rat) / 1162780221153193) [(3, 2), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((18233769251644050532624093590475302808 : Rat) / 39990315246749243218889784267651308933) [(3, 2), (4, 1), (9, 1), (13, 1)],
  term ((346892372640590558901125075097939009577344647390977442 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 2), (4, 1), (9, 1), (15, 1)],
  term ((445555703598648 : Rat) / 1162780221153193) [(3, 2), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((-628403389435981737546357640629173338988 : Rat) / 1799564186103715944850040292044308901985) [(3, 2), (4, 1), (9, 2)],
  term ((-732537308678412778282669871950328022754 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (4, 1), (12, 1)],
  term ((-6043130038758612655481222570993244851010042396287040947 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(3, 2), (4, 1), (13, 1), (15, 1)],
  term ((-224573626463806 : Rat) / 1162780221153193) [(3, 2), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((15590069403369303049264170930214981184 : Rat) / 119970945740247729656669352802953926799) [(3, 2), (4, 1), (13, 2)],
  term ((4460575763931020940779677802964195788 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (4, 1), (14, 1)],
  term ((3777304314129578830929172305846821658579332200799902379 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 2), (4, 1), (15, 2)],
  term ((-532555266735604 : Rat) / 1162780221153193) [(3, 2), (4, 1), (15, 2), (16, 1)],
  term ((-19949044668722450086704130882184548408 : Rat) / 119970945740247729656669352802953926799) [(3, 2), (5, 1), (7, 1), (9, 1), (13, 1)],
  term ((-1790642413914720712020028414248546592708252537916047552 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 2), (5, 1), (7, 1), (9, 1), (15, 1)],
  term ((11968975144193984 : Rat) / 3488340663459579) [(3, 2), (5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-57085539152553334058700266005625419544 : Rat) / 119970945740247729656669352802953926799) [(3, 2), (5, 1), (7, 1), (9, 2)],
  term ((-1267812685805463682044380378946658808089587330947242928 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 2), (5, 1), (7, 1), (13, 1), (15, 1)],
  term ((-3160383784879872 : Rat) / 1162780221153193) [(3, 2), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((27519268627400015362160804705260409872 : Rat) / 39990315246749243218889784267651308933) [(3, 2), (5, 1), (7, 1), (13, 2)],
  term ((67563934515587234973630412146306275392 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (5, 1), (7, 2), (9, 1)],
  term ((80880299190047857864233171441849366144 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (5, 1), (7, 2), (13, 1)],
  term ((-4347249035505462526858846771514645871341141380863831296 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 2), (5, 1), (7, 2), (15, 1)],
  term ((-413883074046464 : Rat) / 1162780221153193) [(3, 2), (5, 1), (7, 2), (15, 1), (16, 1)],
  term ((4361291786440524956738346429054743746544 : Rat) / 1799564186103715944850040292044308901985) [(3, 2), (5, 1), (9, 1)],
  term ((-84757876596661687795705327982730249764 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (5, 1), (9, 1), (12, 1)],
  term ((3305390256600957304750147809747473899456 : Rat) / 1799564186103715944850040292044308901985) [(3, 2), (7, 1), (8, 1), (9, 1)],
  term ((-24088986040854524616753489353793033479836 : Rat) / 5398692558311147834550120876132926705955) [(3, 2), (7, 1), (9, 1)],
  term ((359800988817789934888267636369853231432 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (7, 1), (9, 1), (12, 1)],
  term ((-44365241360347559907548253348032480896 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (7, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((794982465900475775992368411131078542254382208882138752 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 2), (7, 1), (9, 1), (12, 1), (15, 2)],
  term ((-2108843069097728 : Rat) / 1162780221153193) [(3, 2), (7, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((36326709823775404890386910227678820329661108457314367451 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(3, 2), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((-10375057428886340 : Rat) / 3488340663459579) [(3, 2), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((394147835050448810694877824632526207856 : Rat) / 359912837220743188970008058408861780397) [(3, 2), (7, 1), (9, 1), (13, 2)],
  term ((508470349154038865005416199007327333444 : Rat) / 359912837220743188970008058408861780397) [(3, 2), (7, 1), (9, 1), (14, 1)],
  term ((408424516433622249313695112340266633602697230933700476949 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(3, 2), (7, 1), (9, 1), (15, 2)],
  term ((-88310522894084572 : Rat) / 3488340663459579) [(3, 2), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((-73424885016391334592524874103881802976 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (7, 1), (9, 2), (13, 1)],
  term ((-451584493334593143508692345332818085290440040420989034 : Rat) / 418499528459408918327148043876319653860305890461357621) [(3, 2), (7, 1), (9, 2), (15, 1)],
  term ((-1495148449544936 : Rat) / 3488340663459579) [(3, 2), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((-126225064372939892662610287863400842112 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (7, 1), (9, 3)],
  term ((-1109385824438654667857169094847372299448 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (7, 1), (13, 1)],
  term ((-37050814747583503133753456969502764146050338642007357993 : Rat) / 929998952132019818504773430836265897467346423247461380) [(3, 2), (7, 1), (15, 1)],
  term ((5146839986298265 : Rat) / 1162780221153193) [(3, 2), (7, 1), (15, 1), (16, 1)],
  term ((113870637374100747540866397468259089636 : Rat) / 39990315246749243218889784267651308933) [(3, 2), (7, 2)],
  term ((-313099205974796891704814566834029023616 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (7, 2), (9, 1), (13, 1)],
  term ((4898040419692806749424149347787096834615465390033086364 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 2), (7, 2), (9, 1), (15, 1)],
  term ((-2990296899089872 : Rat) / 1162780221153193) [(3, 2), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((-252450128745879785325220575726801684224 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (7, 2), (9, 2)],
  term ((23010147928799045692499742092991476195705377154103841928 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 2), (7, 2), (13, 1), (15, 1)],
  term ((-301322371177440 : Rat) / 1162780221153193) [(3, 2), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-161891712224135268464196480124956186688 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (7, 2), (13, 2)],
  term ((-35684606111448167526237422423713566304 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (7, 2), (14, 1)],
  term ((-11267418267709793249360068694802780071340436008626146210 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 2), (7, 2), (15, 2)],
  term ((8526632792004408 : Rat) / 1162780221153193) [(3, 2), (7, 2), (15, 2), (16, 1)],
  term ((2930149234713651113130679487801312091016 : Rat) / 1799564186103715944850040292044308901985) [(3, 3), (4, 1), (9, 1)],
  term ((-33781967257793617486815206073153137696 : Rat) / 199951576233746216094448921338256544665) [(3, 3), (5, 1), (7, 1), (9, 1)],
  term ((-40440149595023928932116585720924683072 : Rat) / 199951576233746216094448921338256544665) [(3, 3), (5, 1), (7, 1), (13, 1)],
  term ((2173624517752731263429423385757322935670570690431915648 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 3), (5, 1), (7, 1), (15, 1)],
  term ((206941537023232 : Rat) / 1162780221153193) [(3, 3), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((3082928476586153890712559966648414688 : Rat) / 599854728701238648283346764014769633995) [(3, 3), (5, 1), (9, 1), (13, 1)],
  term ((3319869963774812909052232810846149293107172472347692792 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 3), (5, 1), (9, 1), (15, 1)],
  term ((-1243911894777184 : Rat) / 3488340663459579) [(3, 3), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((-16890983628896808743407603036576568848 : Rat) / 599854728701238648283346764014769633995) [(3, 3), (5, 1), (9, 2)],
  term ((-56935318687050373770433198734129544818 : Rat) / 39990315246749243218889784267651308933) [(3, 3), (7, 1)],
  term ((156549602987398445852407283417014511808 : Rat) / 199951576233746216094448921338256544665) [(3, 3), (7, 1), (9, 1), (13, 1)],
  term ((-2449020209846403374712074673893548417307732695016543182 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 3), (7, 1), (9, 1), (15, 1)],
  term ((1495148449544936 : Rat) / 1162780221153193) [(3, 3), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((126225064372939892662610287863400842112 : Rat) / 199951576233746216094448921338256544665) [(3, 3), (7, 1), (9, 2)],
  term ((-11505073964399522846249871046495738097852688577051920964 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 3), (7, 1), (13, 1), (15, 1)],
  term ((150661185588720 : Rat) / 1162780221153193) [(3, 3), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((80945856112067634232098240062478093344 : Rat) / 599854728701238648283346764014769633995) [(3, 3), (7, 1), (13, 2)],
  term ((17842303055724083763118711211856783152 : Rat) / 199951576233746216094448921338256544665) [(3, 3), (7, 1), (14, 1)],
  term ((5633709133854896624680034347401390035670218004313073105 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 3), (7, 1), (15, 2)],
  term ((-4263316396002204 : Rat) / 1162780221153193) [(3, 3), (7, 1), (15, 2), (16, 1)],
  term ((-1652695128300478652375073904873736949728 : Rat) / 1799564186103715944850040292044308901985) [(3, 3), (8, 1), (9, 1)],
  term ((12044493020427262308376744676896516739918 : Rat) / 5398692558311147834550120876132926705955) [(3, 3), (9, 1)],
  term ((-179900494408894967444133818184926615716 : Rat) / 599854728701238648283346764014769633995) [(3, 3), (9, 1), (12, 1)],
  term ((22182620680173779953774126674016240448 : Rat) / 199951576233746216094448921338256544665) [(3, 3), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((-397491232950237887996184205565539271127191104441069376 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 3), (9, 1), (12, 1), (15, 2)],
  term ((1054421534548864 : Rat) / 1162780221153193) [(3, 3), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-36326709823775404890386910227678820329661108457314367451 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(3, 3), (9, 1), (13, 1), (15, 1)],
  term ((5187528714443170 : Rat) / 3488340663459579) [(3, 3), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-197073917525224405347438912316263103928 : Rat) / 359912837220743188970008058408861780397) [(3, 3), (9, 1), (13, 2)],
  term ((-254235174577019432502708099503663666722 : Rat) / 359912837220743188970008058408861780397) [(3, 3), (9, 1), (14, 1)],
  term ((-408424516433622249313695112340266633602697230933700476949 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(3, 3), (9, 1), (15, 2)],
  term ((44155261447042286 : Rat) / 3488340663459579) [(3, 3), (9, 1), (15, 2), (16, 1)],
  term ((36712442508195667296262437051940901488 : Rat) / 599854728701238648283346764014769633995) [(3, 3), (9, 2), (13, 1)],
  term ((225792246667296571754346172666409042645220020210494517 : Rat) / 418499528459408918327148043876319653860305890461357621) [(3, 3), (9, 2), (15, 1)],
  term ((747574224772468 : Rat) / 3488340663459579) [(3, 3), (9, 2), (15, 1), (16, 1)],
  term ((63112532186469946331305143931700421056 : Rat) / 599854728701238648283346764014769633995) [(3, 3), (9, 3)],
  term ((554692912219327333928584547423686149724 : Rat) / 599854728701238648283346764014769633995) [(3, 3), (13, 1)],
  term ((37050814747583503133753456969502764146050338642007357993 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(3, 3), (15, 1)],
  term ((-5146839986298265 : Rat) / 2325560442306386) [(3, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 16, terms 100 through 199. -/
theorem ep_Q2_024_block_16_0100_0199_valid :
    checkProductSumEq ep_Q2_024_partials_16_0100_0199
      ep_Q2_024_block_16_0100_0199 = true := by
  native_decide

end EpQ2024TermShards

end Patterns

end EndpointCertificate

end Problem97
