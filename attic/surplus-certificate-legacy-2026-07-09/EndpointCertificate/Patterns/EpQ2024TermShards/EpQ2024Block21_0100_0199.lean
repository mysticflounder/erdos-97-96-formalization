/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_024, term block 21:100-199

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_024`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2024TermShards

/-- Generator polynomial 21 for endpoint certificate `ep_Q2_024`. -/
def ep_Q2_024_generator_21_0100_0199 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(10, 1)]
]

/-- Coefficient term 100 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0100 : Poly :=
[
  term ((-1048479305353675 : Rat) / 1162780221153193) [(0, 1), (3, 1), (7, 1), (15, 2), (16, 1)]
]

/-- Partial product 100 for generator 21. -/
def ep_Q2_024_partial_21_0100 : Poly :=
[
  term ((-2096958610707350 : Rat) / 1162780221153193) [(0, 1), (3, 1), (7, 1), (10, 1), (15, 2), (16, 1)],
  term ((1048479305353675 : Rat) / 1162780221153193) [(0, 1), (3, 1), (7, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 21. -/
theorem ep_Q2_024_partial_21_0100_valid :
    mulPoly ep_Q2_024_coefficient_21_0100
        ep_Q2_024_generator_21_0100_0199 =
      ep_Q2_024_partial_21_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0101 : Poly :=
[
  term ((1652695128300478652375073904873736949728 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (3, 1), (8, 1), (9, 1)]
]

/-- Partial product 101 for generator 21. -/
def ep_Q2_024_partial_21_0101 : Poly :=
[
  term ((-1652695128300478652375073904873736949728 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (3, 1), (8, 1), (9, 1)],
  term ((3305390256600957304750147809747473899456 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (3, 1), (8, 1), (9, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 21. -/
theorem ep_Q2_024_partial_21_0101_valid :
    mulPoly ep_Q2_024_coefficient_21_0101
        ep_Q2_024_generator_21_0100_0199 =
      ep_Q2_024_partial_21_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0102 : Poly :=
[
  term ((-826347564150239326187536952436868474864 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 1), (8, 1), (11, 1)]
]

/-- Partial product 102 for generator 21. -/
def ep_Q2_024_partial_21_0102 : Poly :=
[
  term ((-1652695128300478652375073904873736949728 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 1), (8, 1), (10, 1), (11, 1)],
  term ((826347564150239326187536952436868474864 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 1), (8, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 21. -/
theorem ep_Q2_024_partial_21_0102_valid :
    mulPoly ep_Q2_024_coefficient_21_0102
        ep_Q2_024_generator_21_0100_0199 =
      ep_Q2_024_partial_21_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0103 : Poly :=
[
  term ((-9711331498283881805320459839702043125308 : Rat) / 5398692558311147834550120876132926705955) [(0, 1), (3, 1), (9, 1)]
]

/-- Partial product 103 for generator 21. -/
def ep_Q2_024_partial_21_0103 : Poly :=
[
  term ((9711331498283881805320459839702043125308 : Rat) / 5398692558311147834550120876132926705955) [(0, 1), (3, 1), (9, 1)],
  term ((-19422662996567763610640919679404086250616 : Rat) / 5398692558311147834550120876132926705955) [(0, 1), (3, 1), (9, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 21. -/
theorem ep_Q2_024_partial_21_0103_valid :
    mulPoly ep_Q2_024_coefficient_21_0103
        ep_Q2_024_generator_21_0100_0199 =
      ep_Q2_024_partial_21_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0104 : Poly :=
[
  term ((117412202240548834389305462562760883856 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 1), (9, 1), (11, 1), (13, 1)]
]

/-- Partial product 104 for generator 21. -/
def ep_Q2_024_partial_21_0104 : Poly :=
[
  term ((234824404481097668778610925125521767712 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 1), (9, 1), (10, 1), (11, 1), (13, 1)],
  term ((-117412202240548834389305462562760883856 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 1), (9, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 21. -/
theorem ep_Q2_024_partial_21_0104_valid :
    mulPoly ep_Q2_024_coefficient_21_0104
        ep_Q2_024_generator_21_0100_0199 =
      ep_Q2_024_partial_21_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0105 : Poly :=
[
  term ((-1222689308379968181009349179356074961661002890148376823 : Rat) / 464999476066009909252386715418132948733673211623730690) [(0, 1), (3, 1), (9, 1), (11, 1), (15, 1)]
]

/-- Partial product 105 for generator 21. -/
def ep_Q2_024_partial_21_0105 : Poly :=
[
  term ((-1222689308379968181009349179356074961661002890148376823 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (3, 1), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((1222689308379968181009349179356074961661002890148376823 : Rat) / 464999476066009909252386715418132948733673211623730690) [(0, 1), (3, 1), (9, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 21. -/
theorem ep_Q2_024_partial_21_0105_valid :
    mulPoly ep_Q2_024_coefficient_21_0105
        ep_Q2_024_generator_21_0100_0199 =
      ep_Q2_024_partial_21_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0106 : Poly :=
[
  term ((1121361337158702 : Rat) / 1162780221153193) [(0, 1), (3, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 106 for generator 21. -/
def ep_Q2_024_partial_21_0106 : Poly :=
[
  term ((2242722674317404 : Rat) / 1162780221153193) [(0, 1), (3, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1121361337158702 : Rat) / 1162780221153193) [(0, 1), (3, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 21. -/
theorem ep_Q2_024_partial_21_0106_valid :
    mulPoly ep_Q2_024_coefficient_21_0106
        ep_Q2_024_generator_21_0100_0199 =
      ep_Q2_024_partial_21_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0107 : Poly :=
[
  term ((179900494408894967444133818184926615716 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 1), (9, 1), (12, 1)]
]

/-- Partial product 107 for generator 21. -/
def ep_Q2_024_partial_21_0107 : Poly :=
[
  term ((359800988817789934888267636369853231432 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 1), (9, 1), (10, 1), (12, 1)],
  term ((-179900494408894967444133818184926615716 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 1), (9, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 21. -/
theorem ep_Q2_024_partial_21_0107_valid :
    mulPoly ep_Q2_024_coefficient_21_0107
        ep_Q2_024_generator_21_0100_0199 =
      ep_Q2_024_partial_21_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0108 : Poly :=
[
  term ((-72684193103125880932282159892496420352 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 1), (9, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 108 for generator 21. -/
def ep_Q2_024_partial_21_0108 : Poly :=
[
  term ((-145368386206251761864564319784992840704 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 1), (9, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((72684193103125880932282159892496420352 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 1), (9, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 21. -/
theorem ep_Q2_024_partial_21_0108_valid :
    mulPoly ep_Q2_024_coefficient_21_0108
        ep_Q2_024_generator_21_0100_0199 =
      ep_Q2_024_partial_21_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0109 : Poly :=
[
  term ((6299150043976421453816837443454246044728994387384006024 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (3, 1), (9, 1), (12, 1), (15, 2)]
]

/-- Partial product 109 for generator 21. -/
def ep_Q2_024_partial_21_0109 : Poly :=
[
  term ((12598300087952842907633674886908492089457988774768012048 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (3, 1), (9, 1), (10, 1), (12, 1), (15, 2)],
  term ((-6299150043976421453816837443454246044728994387384006024 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (3, 1), (9, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 21. -/
theorem ep_Q2_024_partial_21_0109_valid :
    mulPoly ep_Q2_024_coefficient_21_0109
        ep_Q2_024_generator_21_0100_0199 =
      ep_Q2_024_partial_21_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0110 : Poly :=
[
  term ((-2774302050180448 : Rat) / 1162780221153193) [(0, 1), (3, 1), (9, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 110 for generator 21. -/
def ep_Q2_024_partial_21_0110 : Poly :=
[
  term ((-5548604100360896 : Rat) / 1162780221153193) [(0, 1), (3, 1), (9, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((2774302050180448 : Rat) / 1162780221153193) [(0, 1), (3, 1), (9, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 21. -/
theorem ep_Q2_024_partial_21_0110_valid :
    mulPoly ep_Q2_024_coefficient_21_0110
        ep_Q2_024_generator_21_0100_0199 =
      ep_Q2_024_partial_21_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0111 : Poly :=
[
  term ((5982837320379845651599041426655130663707208580347239615 : Rat) / 836999056918817836654296087752639307720611780922715242) [(0, 1), (3, 1), (9, 1), (13, 1), (15, 1)]
]

/-- Partial product 111 for generator 21. -/
def ep_Q2_024_partial_21_0111 : Poly :=
[
  term ((5982837320379845651599041426655130663707208580347239615 : Rat) / 418499528459408918327148043876319653860305890461357621) [(0, 1), (3, 1), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((-5982837320379845651599041426655130663707208580347239615 : Rat) / 836999056918817836654296087752639307720611780922715242) [(0, 1), (3, 1), (9, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 21. -/
theorem ep_Q2_024_partial_21_0111_valid :
    mulPoly ep_Q2_024_coefficient_21_0111
        ep_Q2_024_generator_21_0100_0199 =
      ep_Q2_024_partial_21_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0112 : Poly :=
[
  term ((-5187528714443170 : Rat) / 3488340663459579) [(0, 1), (3, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 112 for generator 21. -/
def ep_Q2_024_partial_21_0112 : Poly :=
[
  term ((-10375057428886340 : Rat) / 3488340663459579) [(0, 1), (3, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((5187528714443170 : Rat) / 3488340663459579) [(0, 1), (3, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 21. -/
theorem ep_Q2_024_partial_21_0112_valid :
    mulPoly ep_Q2_024_coefficient_21_0112
        ep_Q2_024_generator_21_0100_0199 =
      ep_Q2_024_partial_21_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0113 : Poly :=
[
  term ((197073917525224405347438912316263103928 : Rat) / 359912837220743188970008058408861780397) [(0, 1), (3, 1), (9, 1), (13, 2)]
]

/-- Partial product 113 for generator 21. -/
def ep_Q2_024_partial_21_0113 : Poly :=
[
  term ((394147835050448810694877824632526207856 : Rat) / 359912837220743188970008058408861780397) [(0, 1), (3, 1), (9, 1), (10, 1), (13, 2)],
  term ((-197073917525224405347438912316263103928 : Rat) / 359912837220743188970008058408861780397) [(0, 1), (3, 1), (9, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 21. -/
theorem ep_Q2_024_partial_21_0113_valid :
    mulPoly ep_Q2_024_coefficient_21_0113
        ep_Q2_024_generator_21_0100_0199 =
      ep_Q2_024_partial_21_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0114 : Poly :=
[
  term ((254235174577019432502708099503663666722 : Rat) / 359912837220743188970008058408861780397) [(0, 1), (3, 1), (9, 1), (14, 1)]
]

/-- Partial product 114 for generator 21. -/
def ep_Q2_024_partial_21_0114 : Poly :=
[
  term ((508470349154038865005416199007327333444 : Rat) / 359912837220743188970008058408861780397) [(0, 1), (3, 1), (9, 1), (10, 1), (14, 1)],
  term ((-254235174577019432502708099503663666722 : Rat) / 359912837220743188970008058408861780397) [(0, 1), (3, 1), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 21. -/
theorem ep_Q2_024_partial_21_0114_valid :
    mulPoly ep_Q2_024_coefficient_21_0114
        ep_Q2_024_generator_21_0100_0199 =
      ep_Q2_024_partial_21_0114 := by
  native_decide

/-- Coefficient term 115 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0115 : Poly :=
[
  term ((-41173870565625819771545039985740243970144905421913612168 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(0, 1), (3, 1), (9, 1), (15, 2)]
]

/-- Partial product 115 for generator 21. -/
def ep_Q2_024_partial_21_0115 : Poly :=
[
  term ((-82347741131251639543090079971480487940289810843827224336 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(0, 1), (3, 1), (9, 1), (10, 1), (15, 2)],
  term ((41173870565625819771545039985740243970144905421913612168 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(0, 1), (3, 1), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 115 for generator 21. -/
theorem ep_Q2_024_partial_21_0115_valid :
    mulPoly ep_Q2_024_coefficient_21_0115
        ep_Q2_024_generator_21_0100_0199 =
      ep_Q2_024_partial_21_0115 := by
  native_decide

/-- Coefficient term 116 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0116 : Poly :=
[
  term ((-14489628749703008 : Rat) / 3488340663459579) [(0, 1), (3, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 116 for generator 21. -/
def ep_Q2_024_partial_21_0116 : Poly :=
[
  term ((-28979257499406016 : Rat) / 3488340663459579) [(0, 1), (3, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((14489628749703008 : Rat) / 3488340663459579) [(0, 1), (3, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 116 for generator 21. -/
theorem ep_Q2_024_partial_21_0116_valid :
    mulPoly ep_Q2_024_coefficient_21_0116
        ep_Q2_024_generator_21_0100_0199 =
      ep_Q2_024_partial_21_0116 := by
  native_decide

/-- Coefficient term 117 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0117 : Poly :=
[
  term ((94668798279704919496957715897550631584 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 1), (9, 2), (11, 1)]
]

/-- Partial product 117 for generator 21. -/
def ep_Q2_024_partial_21_0117 : Poly :=
[
  term ((189337596559409838993915431795101263168 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 1), (9, 2), (10, 1), (11, 1)],
  term ((-94668798279704919496957715897550631584 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 1), (9, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 117 for generator 21. -/
theorem ep_Q2_024_partial_21_0117_valid :
    mulPoly ep_Q2_024_coefficient_21_0117
        ep_Q2_024_generator_21_0100_0199 =
      ep_Q2_024_partial_21_0117 := by
  native_decide

/-- Coefficient term 118 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0118 : Poly :=
[
  term ((-36712442508195667296262437051940901488 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 1), (9, 2), (13, 1)]
]

/-- Partial product 118 for generator 21. -/
def ep_Q2_024_partial_21_0118 : Poly :=
[
  term ((-73424885016391334592524874103881802976 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 1), (9, 2), (10, 1), (13, 1)],
  term ((36712442508195667296262437051940901488 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 1), (9, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 118 for generator 21. -/
theorem ep_Q2_024_partial_21_0118_valid :
    mulPoly ep_Q2_024_coefficient_21_0118
        ep_Q2_024_generator_21_0100_0199 =
      ep_Q2_024_partial_21_0118 := by
  native_decide

/-- Coefficient term 119 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0119 : Poly :=
[
  term ((-1145348402225584415891924281648338436161871217291525497 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(0, 1), (3, 1), (9, 2), (15, 1)]
]

/-- Partial product 119 for generator 21. -/
def ep_Q2_024_partial_21_0119 : Poly :=
[
  term ((-2290696804451168831783848563296676872323742434583050994 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(0, 1), (3, 1), (9, 2), (10, 1), (15, 1)],
  term ((1145348402225584415891924281648338436161871217291525497 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(0, 1), (3, 1), (9, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 119 for generator 21. -/
theorem ep_Q2_024_partial_21_0119_valid :
    mulPoly ep_Q2_024_coefficient_21_0119
        ep_Q2_024_generator_21_0100_0199 =
      ep_Q2_024_partial_21_0119 := by
  native_decide

/-- Coefficient term 120 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0120 : Poly :=
[
  term ((-747574224772468 : Rat) / 3488340663459579) [(0, 1), (3, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 120 for generator 21. -/
def ep_Q2_024_partial_21_0120 : Poly :=
[
  term ((-1495148449544936 : Rat) / 3488340663459579) [(0, 1), (3, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((747574224772468 : Rat) / 3488340663459579) [(0, 1), (3, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 120 for generator 21. -/
theorem ep_Q2_024_partial_21_0120_valid :
    mulPoly ep_Q2_024_coefficient_21_0120
        ep_Q2_024_generator_21_0100_0199 =
      ep_Q2_024_partial_21_0120 := by
  native_decide

/-- Coefficient term 121 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0121 : Poly :=
[
  term ((-63112532186469946331305143931700421056 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 1), (9, 3)]
]

/-- Partial product 121 for generator 21. -/
def ep_Q2_024_partial_21_0121 : Poly :=
[
  term ((63112532186469946331305143931700421056 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 1), (9, 3)],
  term ((-126225064372939892662610287863400842112 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 1), (9, 3), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 121 for generator 21. -/
theorem ep_Q2_024_partial_21_0121_valid :
    mulPoly ep_Q2_024_coefficient_21_0121
        ep_Q2_024_generator_21_0100_0199 =
      ep_Q2_024_partial_21_0121 := by
  native_decide

/-- Coefficient term 122 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0122 : Poly :=
[
  term ((161015996569390131355509874849465952311 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 1), (11, 1)]
]

/-- Partial product 122 for generator 21. -/
def ep_Q2_024_partial_21_0122 : Poly :=
[
  term ((322031993138780262711019749698931904622 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 1), (10, 1), (11, 1)],
  term ((-161015996569390131355509874849465952311 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 122 for generator 21. -/
theorem ep_Q2_024_partial_21_0122_valid :
    mulPoly ep_Q2_024_coefficient_21_0122
        ep_Q2_024_generator_21_0100_0199 =
      ep_Q2_024_partial_21_0122 := by
  native_decide

/-- Coefficient term 123 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0123 : Poly :=
[
  term ((-89950247204447483722066909092463307858 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 1), (11, 1), (12, 1)]
]

/-- Partial product 123 for generator 21. -/
def ep_Q2_024_partial_21_0123 : Poly :=
[
  term ((-179900494408894967444133818184926615716 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 1), (10, 1), (11, 1), (12, 1)],
  term ((89950247204447483722066909092463307858 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 123 for generator 21. -/
theorem ep_Q2_024_partial_21_0123_valid :
    mulPoly ep_Q2_024_coefficient_21_0123
        ep_Q2_024_generator_21_0100_0199 =
      ep_Q2_024_partial_21_0123 := by
  native_decide

/-- Coefficient term 124 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0124 : Poly :=
[
  term ((33273931020260669930661190011024360672 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 1), (11, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 124 for generator 21. -/
def ep_Q2_024_partial_21_0124 : Poly :=
[
  term ((66547862040521339861322380022048721344 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 1), (10, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-33273931020260669930661190011024360672 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 1), (11, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 124 for generator 21. -/
theorem ep_Q2_024_partial_21_0124_valid :
    mulPoly ep_Q2_024_coefficient_21_0124
        ep_Q2_024_generator_21_0100_0199 =
      ep_Q2_024_partial_21_0124 := by
  native_decide

/-- Coefficient term 125 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0125 : Poly :=
[
  term ((-198745616475118943998092102782769635563595552220534688 : Rat) / 46499947606600990925238671541813294873367321162373069) [(0, 1), (3, 1), (11, 1), (12, 1), (15, 2)]
]

/-- Partial product 125 for generator 21. -/
def ep_Q2_024_partial_21_0125 : Poly :=
[
  term ((-397491232950237887996184205565539271127191104441069376 : Rat) / 46499947606600990925238671541813294873367321162373069) [(0, 1), (3, 1), (10, 1), (11, 1), (12, 1), (15, 2)],
  term ((198745616475118943998092102782769635563595552220534688 : Rat) / 46499947606600990925238671541813294873367321162373069) [(0, 1), (3, 1), (11, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 125 for generator 21. -/
theorem ep_Q2_024_partial_21_0125_valid :
    mulPoly ep_Q2_024_coefficient_21_0125
        ep_Q2_024_generator_21_0100_0199 =
      ep_Q2_024_partial_21_0125 := by
  native_decide

/-- Coefficient term 126 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0126 : Poly :=
[
  term ((1581632301823296 : Rat) / 1162780221153193) [(0, 1), (3, 1), (11, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 126 for generator 21. -/
def ep_Q2_024_partial_21_0126 : Poly :=
[
  term ((3163264603646592 : Rat) / 1162780221153193) [(0, 1), (3, 1), (10, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-1581632301823296 : Rat) / 1162780221153193) [(0, 1), (3, 1), (11, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 126 for generator 21. -/
theorem ep_Q2_024_partial_21_0126_valid :
    mulPoly ep_Q2_024_coefficient_21_0126
        ep_Q2_024_generator_21_0100_0199 =
      ep_Q2_024_partial_21_0126 := by
  native_decide

/-- Coefficient term 127 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0127 : Poly :=
[
  term ((-13665940368750242398805821778499109403651343582341271507 : Rat) / 929998952132019818504773430836265897467346423247461380) [(0, 1), (3, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 127 for generator 21. -/
def ep_Q2_024_partial_21_0127 : Poly :=
[
  term ((-13665940368750242398805821778499109403651343582341271507 : Rat) / 464999476066009909252386715418132948733673211623730690) [(0, 1), (3, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((13665940368750242398805821778499109403651343582341271507 : Rat) / 929998952132019818504773430836265897467346423247461380) [(0, 1), (3, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 127 for generator 21. -/
theorem ep_Q2_024_partial_21_0127_valid :
    mulPoly ep_Q2_024_coefficient_21_0127
        ep_Q2_024_generator_21_0100_0199 =
      ep_Q2_024_partial_21_0127 := by
  native_decide

/-- Coefficient term 128 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0128 : Poly :=
[
  term ((106291408585995 : Rat) / 1162780221153193) [(0, 1), (3, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 128 for generator 21. -/
def ep_Q2_024_partial_21_0128 : Poly :=
[
  term ((212582817171990 : Rat) / 1162780221153193) [(0, 1), (3, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-106291408585995 : Rat) / 1162780221153193) [(0, 1), (3, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 128 for generator 21. -/
theorem ep_Q2_024_partial_21_0128_valid :
    mulPoly ep_Q2_024_coefficient_21_0128
        ep_Q2_024_generator_21_0100_0199 =
      ep_Q2_024_partial_21_0128 := by
  native_decide

/-- Coefficient term 129 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0129 : Poly :=
[
  term ((-16187308625359244326701932651346745316 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 1), (11, 1), (13, 2)]
]

/-- Partial product 129 for generator 21. -/
def ep_Q2_024_partial_21_0129 : Poly :=
[
  term ((-32374617250718488653403865302693490632 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 1), (10, 1), (11, 1), (13, 2)],
  term ((16187308625359244326701932651346745316 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 129 for generator 21. -/
theorem ep_Q2_024_partial_21_0129_valid :
    mulPoly ep_Q2_024_coefficient_21_0129
        ep_Q2_024_generator_21_0100_0199 =
      ep_Q2_024_partial_21_0129 := by
  native_decide

/-- Coefficient term 130 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0130 : Poly :=
[
  term ((-608824481858962455612092181941373992077 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 1), (11, 1), (14, 1)]
]

/-- Partial product 130 for generator 21. -/
def ep_Q2_024_partial_21_0130 : Poly :=
[
  term ((-1217648963717924911224184363882747984154 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 1), (10, 1), (11, 1), (14, 1)],
  term ((608824481858962455612092181941373992077 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 130 for generator 21. -/
theorem ep_Q2_024_partial_21_0130_valid :
    mulPoly ep_Q2_024_coefficient_21_0130
        ep_Q2_024_generator_21_0100_0199 =
      ep_Q2_024_partial_21_0130 := by
  native_decide

/-- Coefficient term 131 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0131 : Poly :=
[
  term ((2298204085221019497339885976171791710852429622693000547 : Rat) / 47288082311797617890073225296759282922068462199023460) [(0, 1), (3, 1), (11, 1), (15, 2)]
]

/-- Partial product 131 for generator 21. -/
def ep_Q2_024_partial_21_0131 : Poly :=
[
  term ((2298204085221019497339885976171791710852429622693000547 : Rat) / 23644041155898808945036612648379641461034231099511730) [(0, 1), (3, 1), (10, 1), (11, 1), (15, 2)],
  term ((-2298204085221019497339885976171791710852429622693000547 : Rat) / 47288082311797617890073225296759282922068462199023460) [(0, 1), (3, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 131 for generator 21. -/
theorem ep_Q2_024_partial_21_0131_valid :
    mulPoly ep_Q2_024_coefficient_21_0131
        ep_Q2_024_generator_21_0100_0199 =
      ep_Q2_024_partial_21_0131 := by
  native_decide

/-- Coefficient term 132 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0132 : Poly :=
[
  term ((-1048479305353675 : Rat) / 1162780221153193) [(0, 1), (3, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 132 for generator 21. -/
def ep_Q2_024_partial_21_0132 : Poly :=
[
  term ((-2096958610707350 : Rat) / 1162780221153193) [(0, 1), (3, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((1048479305353675 : Rat) / 1162780221153193) [(0, 1), (3, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 132 for generator 21. -/
theorem ep_Q2_024_partial_21_0132_valid :
    mulPoly ep_Q2_024_coefficient_21_0132
        ep_Q2_024_generator_21_0100_0199 =
      ep_Q2_024_partial_21_0132 := by
  native_decide

/-- Coefficient term 133 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0133 : Poly :=
[
  term ((30029923297133838639703294655638667806 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 1), (12, 1), (13, 1)]
]

/-- Partial product 133 for generator 21. -/
def ep_Q2_024_partial_21_0133 : Poly :=
[
  term ((60059846594267677279406589311277335612 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 1), (10, 1), (12, 1), (13, 1)],
  term ((-30029923297133838639703294655638667806 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 133 for generator 21. -/
theorem ep_Q2_024_partial_21_0133_valid :
    mulPoly ep_Q2_024_coefficient_21_0133
        ep_Q2_024_generator_21_0100_0199 =
      ep_Q2_024_partial_21_0133 := by
  native_decide

/-- Coefficient term 134 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0134 : Poly :=
[
  term ((-6544627211193844374324207850933658385537878969261824301 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(0, 1), (3, 1), (12, 1), (15, 1)]
]

/-- Partial product 134 for generator 21. -/
def ep_Q2_024_partial_21_0134 : Poly :=
[
  term ((-6544627211193844374324207850933658385537878969261824301 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(0, 1), (3, 1), (10, 1), (12, 1), (15, 1)],
  term ((6544627211193844374324207850933658385537878969261824301 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(0, 1), (3, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 134 for generator 21. -/
theorem ep_Q2_024_partial_21_0134_valid :
    mulPoly ep_Q2_024_coefficient_21_0134
        ep_Q2_024_generator_21_0100_0199 =
      ep_Q2_024_partial_21_0134 := by
  native_decide

/-- Coefficient term 135 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0135 : Poly :=
[
  term ((448228140819559 : Rat) / 2325560442306386) [(0, 1), (3, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 135 for generator 21. -/
def ep_Q2_024_partial_21_0135 : Poly :=
[
  term ((448228140819559 : Rat) / 1162780221153193) [(0, 1), (3, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-448228140819559 : Rat) / 2325560442306386) [(0, 1), (3, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 135 for generator 21. -/
theorem ep_Q2_024_partial_21_0135_valid :
    mulPoly ep_Q2_024_coefficient_21_0135
        ep_Q2_024_generator_21_0100_0199 =
      ep_Q2_024_partial_21_0135 := by
  native_decide

/-- Coefficient term 136 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0136 : Poly :=
[
  term ((-94361221157846703713920449808748901536 : Rat) / 119970945740247729656669352802953926799) [(0, 1), (3, 1), (13, 1)]
]

/-- Partial product 136 for generator 21. -/
def ep_Q2_024_partial_21_0136 : Poly :=
[
  term ((-188722442315693407427840899617497803072 : Rat) / 119970945740247729656669352802953926799) [(0, 1), (3, 1), (10, 1), (13, 1)],
  term ((94361221157846703713920449808748901536 : Rat) / 119970945740247729656669352802953926799) [(0, 1), (3, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 136 for generator 21. -/
theorem ep_Q2_024_partial_21_0136_valid :
    mulPoly ep_Q2_024_coefficient_21_0136
        ep_Q2_024_generator_21_0100_0199 =
      ep_Q2_024_partial_21_0136 := by
  native_decide

/-- Coefficient term 137 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0137 : Poly :=
[
  term ((-137190219846581823769882591558384019657388474051565837181 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(0, 1), (3, 1), (15, 1)]
]

/-- Partial product 137 for generator 21. -/
def ep_Q2_024_partial_21_0137 : Poly :=
[
  term ((-137190219846581823769882591558384019657388474051565837181 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(0, 1), (3, 1), (10, 1), (15, 1)],
  term ((137190219846581823769882591558384019657388474051565837181 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(0, 1), (3, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 137 for generator 21. -/
theorem ep_Q2_024_partial_21_0137_valid :
    mulPoly ep_Q2_024_coefficient_21_0137
        ep_Q2_024_generator_21_0100_0199 =
      ep_Q2_024_partial_21_0137 := by
  native_decide

/-- Coefficient term 138 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0138 : Poly :=
[
  term ((-13092500098671601 : Rat) / 4651120884612772) [(0, 1), (3, 1), (15, 1), (16, 1)]
]

/-- Partial product 138 for generator 21. -/
def ep_Q2_024_partial_21_0138 : Poly :=
[
  term ((-13092500098671601 : Rat) / 2325560442306386) [(0, 1), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((13092500098671601 : Rat) / 4651120884612772) [(0, 1), (3, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 138 for generator 21. -/
theorem ep_Q2_024_partial_21_0138_valid :
    mulPoly ep_Q2_024_coefficient_21_0138
        ep_Q2_024_generator_21_0100_0199 =
      ep_Q2_024_partial_21_0138 := by
  native_decide

/-- Coefficient term 139 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0139 : Poly :=
[
  term ((1429182194689304419382031011936884624481 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (4, 1)]
]

/-- Partial product 139 for generator 21. -/
def ep_Q2_024_partial_21_0139 : Poly :=
[
  term ((-1429182194689304419382031011936884624481 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (4, 1)],
  term ((2858364389378608838764062023873769248962 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (4, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 139 for generator 21. -/
theorem ep_Q2_024_partial_21_0139_valid :
    mulPoly ep_Q2_024_coefficient_21_0139
        ep_Q2_024_generator_21_0100_0199 =
      ep_Q2_024_partial_21_0139 := by
  native_decide

/-- Coefficient term 140 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0140 : Poly :=
[
  term ((-78712672521636585394125702406191283060 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (4, 1), (9, 1), (11, 1)]
]

/-- Partial product 140 for generator 21. -/
def ep_Q2_024_partial_21_0140 : Poly :=
[
  term ((-157425345043273170788251404812382566120 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (4, 1), (9, 1), (10, 1), (11, 1)],
  term ((78712672521636585394125702406191283060 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (4, 1), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 140 for generator 21. -/
theorem ep_Q2_024_partial_21_0140_valid :
    mulPoly ep_Q2_024_coefficient_21_0140
        ep_Q2_024_generator_21_0100_0199 =
      ep_Q2_024_partial_21_0140 := by
  native_decide

/-- Coefficient term 141 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0141 : Poly :=
[
  term ((-724495973011091570460779609691605011712 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (4, 1), (9, 1), (12, 1), (13, 1)]
]

/-- Partial product 141 for generator 21. -/
def ep_Q2_024_partial_21_0141 : Poly :=
[
  term ((-1448991946022183140921559219383210023424 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (4, 1), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((724495973011091570460779609691605011712 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (4, 1), (9, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 141 for generator 21. -/
theorem ep_Q2_024_partial_21_0141_valid :
    mulPoly ep_Q2_024_coefficient_21_0141
        ep_Q2_024_generator_21_0100_0199 =
      ep_Q2_024_partial_21_0141 := by
  native_decide

/-- Coefficient term 142 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0142 : Poly :=
[
  term ((6514192417025367636535306533436410173200464556298441932 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (4, 1), (9, 1), (12, 1), (15, 1)]
]

/-- Partial product 142 for generator 21. -/
def ep_Q2_024_partial_21_0142 : Poly :=
[
  term ((13028384834050735273070613066872820346400929112596883864 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (4, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-6514192417025367636535306533436410173200464556298441932 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (4, 1), (9, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 142 for generator 21. -/
theorem ep_Q2_024_partial_21_0142_valid :
    mulPoly ep_Q2_024_coefficient_21_0142
        ep_Q2_024_generator_21_0100_0199 =
      ep_Q2_024_partial_21_0142 := by
  native_decide

/-- Coefficient term 143 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0143 : Poly :=
[
  term ((-4786310756398640 : Rat) / 1162780221153193) [(0, 1), (4, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 143 for generator 21. -/
def ep_Q2_024_partial_21_0143 : Poly :=
[
  term ((-9572621512797280 : Rat) / 1162780221153193) [(0, 1), (4, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((4786310756398640 : Rat) / 1162780221153193) [(0, 1), (4, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 143 for generator 21. -/
theorem ep_Q2_024_partial_21_0143_valid :
    mulPoly ep_Q2_024_coefficient_21_0143
        ep_Q2_024_generator_21_0100_0199 =
      ep_Q2_024_partial_21_0143 := by
  native_decide

/-- Coefficient term 144 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0144 : Poly :=
[
  term ((1003379935849568169621424530668169741952 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (4, 1), (9, 1), (13, 1)]
]

/-- Partial product 144 for generator 21. -/
def ep_Q2_024_partial_21_0144 : Poly :=
[
  term ((2006759871699136339242849061336339483904 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (4, 1), (9, 1), (10, 1), (13, 1)],
  term ((-1003379935849568169621424530668169741952 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (4, 1), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 144 for generator 21. -/
theorem ep_Q2_024_partial_21_0144_valid :
    mulPoly ep_Q2_024_coefficient_21_0144
        ep_Q2_024_generator_21_0100_0199 =
      ep_Q2_024_partial_21_0144 := by
  native_decide

/-- Coefficient term 145 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0145 : Poly :=
[
  term ((4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (4, 1), (9, 1), (13, 1), (14, 1)]
]

/-- Partial product 145 for generator 21. -/
def ep_Q2_024_partial_21_0145 : Poly :=
[
  term ((8486750246624093521424296941571253888 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (4, 1), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((-4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (4, 1), (9, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 145 for generator 21. -/
theorem ep_Q2_024_partial_21_0145_valid :
    mulPoly ep_Q2_024_coefficient_21_0145
        ep_Q2_024_generator_21_0100_0199 =
      ep_Q2_024_partial_21_0145 := by
  native_decide

/-- Coefficient term 146 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0146 : Poly :=
[
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (4, 1), (9, 1), (14, 1), (15, 1)]
]

/-- Partial product 146 for generator 21. -/
def ep_Q2_024_partial_21_0146 : Poly :=
[
  term ((674456529895393409686477352003493571793009190155093372 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (4, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (4, 1), (9, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 146 for generator 21. -/
theorem ep_Q2_024_partial_21_0146_valid :
    mulPoly ep_Q2_024_coefficient_21_0146
        ep_Q2_024_generator_21_0100_0199 =
      ep_Q2_024_partial_21_0146 := by
  native_decide

/-- Coefficient term 147 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0147 : Poly :=
[
  term ((833967741040952 : Rat) / 1162780221153193) [(0, 1), (4, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 147 for generator 21. -/
def ep_Q2_024_partial_21_0147 : Poly :=
[
  term ((1667935482081904 : Rat) / 1162780221153193) [(0, 1), (4, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-833967741040952 : Rat) / 1162780221153193) [(0, 1), (4, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 147 for generator 21. -/
theorem ep_Q2_024_partial_21_0147_valid :
    mulPoly ep_Q2_024_coefficient_21_0147
        ep_Q2_024_generator_21_0100_0199 =
      ep_Q2_024_partial_21_0147 := by
  native_decide

/-- Coefficient term 148 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0148 : Poly :=
[
  term ((-8308199115901668756672327390880749201075506018754630941 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (4, 1), (9, 1), (15, 1)]
]

/-- Partial product 148 for generator 21. -/
def ep_Q2_024_partial_21_0148 : Poly :=
[
  term ((-16616398231803337513344654781761498402151012037509261882 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (4, 1), (9, 1), (10, 1), (15, 1)],
  term ((8308199115901668756672327390880749201075506018754630941 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (4, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 148 for generator 21. -/
theorem ep_Q2_024_partial_21_0148_valid :
    mulPoly ep_Q2_024_coefficient_21_0148
        ep_Q2_024_generator_21_0100_0199 =
      ep_Q2_024_partial_21_0148 := by
  native_decide

/-- Coefficient term 149 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0149 : Poly :=
[
  term ((2207098944527060 : Rat) / 1162780221153193) [(0, 1), (4, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 149 for generator 21. -/
def ep_Q2_024_partial_21_0149 : Poly :=
[
  term ((4414197889054120 : Rat) / 1162780221153193) [(0, 1), (4, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-2207098944527060 : Rat) / 1162780221153193) [(0, 1), (4, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 149 for generator 21. -/
theorem ep_Q2_024_partial_21_0149_valid :
    mulPoly ep_Q2_024_coefficient_21_0149
        ep_Q2_024_generator_21_0100_0199 =
      ep_Q2_024_partial_21_0149 := by
  native_decide

/-- Coefficient term 150 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0150 : Poly :=
[
  term ((2077934561863747246144279575515194582868 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (4, 1), (9, 2)]
]

/-- Partial product 150 for generator 21. -/
def ep_Q2_024_partial_21_0150 : Poly :=
[
  term ((-2077934561863747246144279575515194582868 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (4, 1), (9, 2)],
  term ((4155869123727494492288559151030389165736 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (4, 1), (9, 2), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 150 for generator 21. -/
theorem ep_Q2_024_partial_21_0150_valid :
    mulPoly ep_Q2_024_coefficient_21_0150
        ep_Q2_024_generator_21_0100_0199 =
      ep_Q2_024_partial_21_0150 := by
  native_decide

/-- Coefficient term 151 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0151 : Poly :=
[
  term ((184073186328059086660770392539015606464 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (4, 1), (11, 1), (12, 1), (13, 1)]
]

/-- Partial product 151 for generator 21. -/
def ep_Q2_024_partial_21_0151 : Poly :=
[
  term ((368146372656118173321540785078031212928 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (4, 1), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((-184073186328059086660770392539015606464 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (4, 1), (11, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 151 for generator 21. -/
theorem ep_Q2_024_partial_21_0151_valid :
    mulPoly ep_Q2_024_coefficient_21_0151
        ep_Q2_024_generator_21_0100_0199 =
      ep_Q2_024_partial_21_0151 := by
  native_decide

/-- Coefficient term 152 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0152 : Poly :=
[
  term ((-15107545144081276730057470020692546667471041729326529716 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (4, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 152 for generator 21. -/
def ep_Q2_024_partial_21_0152 : Poly :=
[
  term ((-30215090288162553460114940041385093334942083458653059432 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (4, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((15107545144081276730057470020692546667471041729326529716 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (4, 1), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 152 for generator 21. -/
theorem ep_Q2_024_partial_21_0152_valid :
    mulPoly ep_Q2_024_coefficient_21_0152
        ep_Q2_024_generator_21_0100_0199 =
      ep_Q2_024_partial_21_0152 := by
  native_decide

/-- Coefficient term 153 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0153 : Poly :=
[
  term ((4325483377037680 : Rat) / 1162780221153193) [(0, 1), (4, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 153 for generator 21. -/
def ep_Q2_024_partial_21_0153 : Poly :=
[
  term ((8650966754075360 : Rat) / 1162780221153193) [(0, 1), (4, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-4325483377037680 : Rat) / 1162780221153193) [(0, 1), (4, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 153 for generator 21. -/
theorem ep_Q2_024_partial_21_0153_valid :
    mulPoly ep_Q2_024_coefficient_21_0153
        ep_Q2_024_generator_21_0100_0199 =
      ep_Q2_024_partial_21_0153 := by
  native_decide

/-- Coefficient term 154 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0154 : Poly :=
[
  term ((-645509305238028654827808150416689423256 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (4, 1), (11, 1), (13, 1)]
]

/-- Partial product 154 for generator 21. -/
def ep_Q2_024_partial_21_0154 : Poly :=
[
  term ((-1291018610476057309655616300833378846512 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (4, 1), (10, 1), (11, 1), (13, 1)],
  term ((645509305238028654827808150416689423256 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (4, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 154 for generator 21. -/
theorem ep_Q2_024_partial_21_0154_valid :
    mulPoly ep_Q2_024_coefficient_21_0154
        ep_Q2_024_generator_21_0100_0199 =
      ep_Q2_024_partial_21_0154 := by
  native_decide

/-- Coefficient term 155 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0155 : Poly :=
[
  term ((60535569472895597225226556172030450948782658411068841308 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(0, 1), (4, 1), (11, 1), (15, 1)]
]

/-- Partial product 155 for generator 21. -/
def ep_Q2_024_partial_21_0155 : Poly :=
[
  term ((121071138945791194450453112344060901897565316822137682616 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(0, 1), (4, 1), (10, 1), (11, 1), (15, 1)],
  term ((-60535569472895597225226556172030450948782658411068841308 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(0, 1), (4, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 155 for generator 21. -/
theorem ep_Q2_024_partial_21_0155_valid :
    mulPoly ep_Q2_024_coefficient_21_0155
        ep_Q2_024_generator_21_0100_0199 =
      ep_Q2_024_partial_21_0155 := by
  native_decide

/-- Coefficient term 156 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0156 : Poly :=
[
  term ((-3916275721085504 : Rat) / 1162780221153193) [(0, 1), (4, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 156 for generator 21. -/
def ep_Q2_024_partial_21_0156 : Poly :=
[
  term ((-7832551442171008 : Rat) / 1162780221153193) [(0, 1), (4, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((3916275721085504 : Rat) / 1162780221153193) [(0, 1), (4, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 156 for generator 21. -/
theorem ep_Q2_024_partial_21_0156_valid :
    mulPoly ep_Q2_024_coefficient_21_0156
        ep_Q2_024_generator_21_0100_0199 =
      ep_Q2_024_partial_21_0156 := by
  native_decide

/-- Coefficient term 157 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0157 : Poly :=
[
  term ((2233057704898447277337521117967487825271887127131734968 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (4, 1), (13, 1), (15, 1)]
]

/-- Partial product 157 for generator 21. -/
def ep_Q2_024_partial_21_0157 : Poly :=
[
  term ((4466115409796894554675042235934975650543774254263469936 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (4, 1), (10, 1), (13, 1), (15, 1)],
  term ((-2233057704898447277337521117967487825271887127131734968 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (4, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 157 for generator 21. -/
theorem ep_Q2_024_partial_21_0157_valid :
    mulPoly ep_Q2_024_coefficient_21_0157
        ep_Q2_024_generator_21_0100_0199 =
      ep_Q2_024_partial_21_0157 := by
  native_decide

/-- Coefficient term 158 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0158 : Poly :=
[
  term ((-1347382663288800 : Rat) / 1162780221153193) [(0, 1), (4, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 158 for generator 21. -/
def ep_Q2_024_partial_21_0158 : Poly :=
[
  term ((-2694765326577600 : Rat) / 1162780221153193) [(0, 1), (4, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((1347382663288800 : Rat) / 1162780221153193) [(0, 1), (4, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 158 for generator 21. -/
theorem ep_Q2_024_partial_21_0158_valid :
    mulPoly ep_Q2_024_coefficient_21_0158
        ep_Q2_024_generator_21_0100_0199 =
      ep_Q2_024_partial_21_0158 := by
  native_decide

/-- Coefficient term 159 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0159 : Poly :=
[
  term ((23303003274098118356770852827110756224 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (4, 1), (13, 2)]
]

/-- Partial product 159 for generator 21. -/
def ep_Q2_024_partial_21_0159 : Poly :=
[
  term ((46606006548196236713541705654221512448 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (4, 1), (10, 1), (13, 2)],
  term ((-23303003274098118356770852827110756224 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (4, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 159 for generator 21. -/
theorem ep_Q2_024_partial_21_0159_valid :
    mulPoly ep_Q2_024_coefficient_21_0159
        ep_Q2_024_generator_21_0100_0199 =
      ep_Q2_024_partial_21_0159 := by
  native_decide

/-- Coefficient term 160 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0160 : Poly :=
[
  term ((16890983628896808743407603036576568848 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (5, 1), (8, 1), (9, 1)]
]

/-- Partial product 160 for generator 21. -/
def ep_Q2_024_partial_21_0160 : Poly :=
[
  term ((-16890983628896808743407603036576568848 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (5, 1), (8, 1), (9, 1)],
  term ((33781967257793617486815206073153137696 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (5, 1), (8, 1), (9, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 160 for generator 21. -/
theorem ep_Q2_024_partial_21_0160_valid :
    mulPoly ep_Q2_024_coefficient_21_0160
        ep_Q2_024_generator_21_0100_0199 =
      ep_Q2_024_partial_21_0160 := by
  native_decide

/-- Coefficient term 161 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0161 : Poly :=
[
  term ((20220074797511964466058292860462341536 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (5, 1), (8, 1), (13, 1)]
]

/-- Partial product 161 for generator 21. -/
def ep_Q2_024_partial_21_0161 : Poly :=
[
  term ((40440149595023928932116585720924683072 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (5, 1), (8, 1), (10, 1), (13, 1)],
  term ((-20220074797511964466058292860462341536 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (5, 1), (8, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 161 for generator 21. -/
theorem ep_Q2_024_partial_21_0161_valid :
    mulPoly ep_Q2_024_coefficient_21_0161
        ep_Q2_024_generator_21_0100_0199 =
      ep_Q2_024_partial_21_0161 := by
  native_decide

/-- Coefficient term 162 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0162 : Poly :=
[
  term ((-1086812258876365631714711692878661467835285345215957824 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (5, 1), (8, 1), (15, 1)]
]

/-- Partial product 162 for generator 21. -/
def ep_Q2_024_partial_21_0162 : Poly :=
[
  term ((-2173624517752731263429423385757322935670570690431915648 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (5, 1), (8, 1), (10, 1), (15, 1)],
  term ((1086812258876365631714711692878661467835285345215957824 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (5, 1), (8, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 162 for generator 21. -/
theorem ep_Q2_024_partial_21_0162_valid :
    mulPoly ep_Q2_024_coefficient_21_0162
        ep_Q2_024_generator_21_0100_0199 =
      ep_Q2_024_partial_21_0162 := by
  native_decide

/-- Coefficient term 163 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0163 : Poly :=
[
  term ((-103470768511616 : Rat) / 1162780221153193) [(0, 1), (5, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 163 for generator 21. -/
def ep_Q2_024_partial_21_0163 : Poly :=
[
  term ((-206941537023232 : Rat) / 1162780221153193) [(0, 1), (5, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((103470768511616 : Rat) / 1162780221153193) [(0, 1), (5, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 163 for generator 21. -/
theorem ep_Q2_024_partial_21_0163_valid :
    mulPoly ep_Q2_024_coefficient_21_0163
        ep_Q2_024_generator_21_0100_0199 =
      ep_Q2_024_partial_21_0163 := by
  native_decide

/-- Coefficient term 164 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0164 : Poly :=
[
  term ((-9462862514621064504124386582454426912189 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (5, 1), (9, 1)]
]

/-- Partial product 164 for generator 21. -/
def ep_Q2_024_partial_21_0164 : Poly :=
[
  term ((9462862514621064504124386582454426912189 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (5, 1), (9, 1)],
  term ((-18925725029242129008248773164908853824378 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (5, 1), (9, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 164 for generator 21. -/
theorem ep_Q2_024_partial_21_0164_valid :
    mulPoly ep_Q2_024_coefficient_21_0164
        ep_Q2_024_generator_21_0100_0199 =
      ep_Q2_024_partial_21_0164 := by
  native_decide

/-- Coefficient term 165 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0165 : Poly :=
[
  term ((-60706835985900982968365112590648489372 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (5, 1), (9, 1), (11, 1), (13, 1)]
]

/-- Partial product 165 for generator 21. -/
def ep_Q2_024_partial_21_0165 : Poly :=
[
  term ((-121413671971801965936730225181296978744 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (5, 1), (9, 1), (10, 1), (11, 1), (13, 1)],
  term ((60706835985900982968365112590648489372 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (5, 1), (9, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 165 for generator 21. -/
theorem ep_Q2_024_partial_21_0165_valid :
    mulPoly ep_Q2_024_coefficient_21_0165
        ep_Q2_024_generator_21_0100_0199 =
      ep_Q2_024_partial_21_0165 := by
  native_decide

/-- Coefficient term 166 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0166 : Poly :=
[
  term ((2173624517752731263429423385757322935670570690431915648 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (5, 1), (9, 1), (11, 1), (15, 1)]
]

/-- Partial product 166 for generator 21. -/
def ep_Q2_024_partial_21_0166 : Poly :=
[
  term ((4347249035505462526858846771514645871341141380863831296 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (5, 1), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((-2173624517752731263429423385757322935670570690431915648 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (5, 1), (9, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 166 for generator 21. -/
theorem ep_Q2_024_partial_21_0166_valid :
    mulPoly ep_Q2_024_coefficient_21_0166
        ep_Q2_024_generator_21_0100_0199 =
      ep_Q2_024_partial_21_0166 := by
  native_decide

/-- Coefficient term 167 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0167 : Poly :=
[
  term ((206941537023232 : Rat) / 1162780221153193) [(0, 1), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 167 for generator 21. -/
def ep_Q2_024_partial_21_0167 : Poly :=
[
  term ((413883074046464 : Rat) / 1162780221153193) [(0, 1), (5, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-206941537023232 : Rat) / 1162780221153193) [(0, 1), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 167 for generator 21. -/
theorem ep_Q2_024_partial_21_0167_valid :
    mulPoly ep_Q2_024_coefficient_21_0167
        ep_Q2_024_generator_21_0100_0199 =
      ep_Q2_024_partial_21_0167 := by
  native_decide

/-- Coefficient term 168 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0168 : Poly :=
[
  term ((2044991909045846892338436472299167624 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (5, 1), (9, 1), (12, 1)]
]

/-- Partial product 168 for generator 21. -/
def ep_Q2_024_partial_21_0168 : Poly :=
[
  term ((4089983818091693784676872944598335248 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (5, 1), (9, 1), (10, 1), (12, 1)],
  term ((-2044991909045846892338436472299167624 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (5, 1), (9, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 168 for generator 21. -/
theorem ep_Q2_024_partial_21_0168_valid :
    mulPoly ep_Q2_024_coefficient_21_0168
        ep_Q2_024_generator_21_0100_0199 =
      ep_Q2_024_partial_21_0168 := by
  native_decide

/-- Coefficient term 169 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0169 : Poly :=
[
  term ((-16527737784929168061123148869963794329901925980398052713 : Rat) / 557999371279211891102864058501759538480407853948476828) [(0, 1), (5, 1), (9, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 169 for generator 21. -/
def ep_Q2_024_partial_21_0169 : Poly :=
[
  term ((-16527737784929168061123148869963794329901925980398052713 : Rat) / 278999685639605945551432029250879769240203926974238414) [(0, 1), (5, 1), (9, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((16527737784929168061123148869963794329901925980398052713 : Rat) / 557999371279211891102864058501759538480407853948476828) [(0, 1), (5, 1), (9, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 169 for generator 21. -/
theorem ep_Q2_024_partial_21_0169_valid :
    mulPoly ep_Q2_024_coefficient_21_0169
        ep_Q2_024_generator_21_0100_0199 =
      ep_Q2_024_partial_21_0169 := by
  native_decide

/-- Coefficient term 170 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0170 : Poly :=
[
  term ((4569079916135479 : Rat) / 1162780221153193) [(0, 1), (5, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 170 for generator 21. -/
def ep_Q2_024_partial_21_0170 : Poly :=
[
  term ((9138159832270958 : Rat) / 1162780221153193) [(0, 1), (5, 1), (9, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4569079916135479 : Rat) / 1162780221153193) [(0, 1), (5, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 170 for generator 21. -/
theorem ep_Q2_024_partial_21_0170_valid :
    mulPoly ep_Q2_024_coefficient_21_0170
        ep_Q2_024_generator_21_0100_0199 =
      ep_Q2_024_partial_21_0170 := by
  native_decide

/-- Coefficient term 171 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0171 : Poly :=
[
  term ((699598964377024284665984479369490528956 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (5, 1), (9, 1), (12, 1), (13, 2)]
]

/-- Partial product 171 for generator 21. -/
def ep_Q2_024_partial_21_0171 : Poly :=
[
  term ((1399197928754048569331968958738981057912 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (5, 1), (9, 1), (10, 1), (12, 1), (13, 2)],
  term ((-699598964377024284665984479369490528956 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (5, 1), (9, 1), (12, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 171 for generator 21. -/
theorem ep_Q2_024_partial_21_0171_valid :
    mulPoly ep_Q2_024_coefficient_21_0171
        ep_Q2_024_generator_21_0100_0199 =
      ep_Q2_024_partial_21_0171 := by
  native_decide

/-- Coefficient term 172 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0172 : Poly :=
[
  term ((57065163418514028206963760297560614190626285699065528079 : Rat) / 929998952132019818504773430836265897467346423247461380) [(0, 1), (5, 1), (9, 1), (12, 1), (15, 2)]
]

/-- Partial product 172 for generator 21. -/
def ep_Q2_024_partial_21_0172 : Poly :=
[
  term ((57065163418514028206963760297560614190626285699065528079 : Rat) / 464999476066009909252386715418132948733673211623730690) [(0, 1), (5, 1), (9, 1), (10, 1), (12, 1), (15, 2)],
  term ((-57065163418514028206963760297560614190626285699065528079 : Rat) / 929998952132019818504773430836265897467346423247461380) [(0, 1), (5, 1), (9, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 172 for generator 21. -/
theorem ep_Q2_024_partial_21_0172_valid :
    mulPoly ep_Q2_024_coefficient_21_0172
        ep_Q2_024_generator_21_0100_0199 =
      ep_Q2_024_partial_21_0172 := by
  native_decide

/-- Coefficient term 173 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0173 : Poly :=
[
  term ((-13204414907240807 : Rat) / 1162780221153193) [(0, 1), (5, 1), (9, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 173 for generator 21. -/
def ep_Q2_024_partial_21_0173 : Poly :=
[
  term ((-26408829814481614 : Rat) / 1162780221153193) [(0, 1), (5, 1), (9, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((13204414907240807 : Rat) / 1162780221153193) [(0, 1), (5, 1), (9, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 173 for generator 21. -/
theorem ep_Q2_024_partial_21_0173_valid :
    mulPoly ep_Q2_024_coefficient_21_0173
        ep_Q2_024_generator_21_0100_0199 =
      ep_Q2_024_partial_21_0173 := by
  native_decide

/-- Coefficient term 174 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0174 : Poly :=
[
  term ((-1681207212074162784866544631513075229980270038215301238 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (5, 1), (9, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 174 for generator 21. -/
def ep_Q2_024_partial_21_0174 : Poly :=
[
  term ((-3362414424148325569733089263026150459960540076430602476 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (5, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((1681207212074162784866544631513075229980270038215301238 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (5, 1), (9, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 174 for generator 21. -/
theorem ep_Q2_024_partial_21_0174_valid :
    mulPoly ep_Q2_024_coefficient_21_0174
        ep_Q2_024_generator_21_0100_0199 =
      ep_Q2_024_partial_21_0174 := by
  native_decide

/-- Coefficient term 175 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0175 : Poly :=
[
  term ((-833967741040952 : Rat) / 1162780221153193) [(0, 1), (5, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 175 for generator 21. -/
def ep_Q2_024_partial_21_0175 : Poly :=
[
  term ((-1667935482081904 : Rat) / 1162780221153193) [(0, 1), (5, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((833967741040952 : Rat) / 1162780221153193) [(0, 1), (5, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 175 for generator 21. -/
theorem ep_Q2_024_partial_21_0175_valid :
    mulPoly ep_Q2_024_coefficient_21_0175
        ep_Q2_024_generator_21_0100_0199 =
      ep_Q2_024_partial_21_0175 := by
  native_decide

/-- Coefficient term 176 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0176 : Poly :=
[
  term ((2298993319879189288962486085765995046746124666739705812891 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(0, 1), (5, 1), (9, 1), (13, 1), (15, 1)]
]

/-- Partial product 176 for generator 21. -/
def ep_Q2_024_partial_21_0176 : Poly :=
[
  term ((2298993319879189288962486085765995046746124666739705812891 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(0, 1), (5, 1), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((-2298993319879189288962486085765995046746124666739705812891 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(0, 1), (5, 1), (9, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 176 for generator 21. -/
theorem ep_Q2_024_partial_21_0176_valid :
    mulPoly ep_Q2_024_coefficient_21_0176
        ep_Q2_024_generator_21_0100_0199 =
      ep_Q2_024_partial_21_0176 := by
  native_decide

/-- Coefficient term 177 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0177 : Poly :=
[
  term ((50972133270704143 : Rat) / 6976681326919158) [(0, 1), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 177 for generator 21. -/
def ep_Q2_024_partial_21_0177 : Poly :=
[
  term ((50972133270704143 : Rat) / 3488340663459579) [(0, 1), (5, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-50972133270704143 : Rat) / 6976681326919158) [(0, 1), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 177 for generator 21. -/
theorem ep_Q2_024_partial_21_0177_valid :
    mulPoly ep_Q2_024_coefficient_21_0177
        ep_Q2_024_generator_21_0100_0199 =
      ep_Q2_024_partial_21_0177 := by
  native_decide

/-- Coefficient term 178 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0178 : Poly :=
[
  term ((-8413519746542290140853554206891491552 : Rat) / 30501087900062982116102377831259472915) [(0, 1), (5, 1), (9, 1), (13, 2)]
]

/-- Partial product 178 for generator 21. -/
def ep_Q2_024_partial_21_0178 : Poly :=
[
  term ((-16827039493084580281707108413782983104 : Rat) / 30501087900062982116102377831259472915) [(0, 1), (5, 1), (9, 1), (10, 1), (13, 2)],
  term ((8413519746542290140853554206891491552 : Rat) / 30501087900062982116102377831259472915) [(0, 1), (5, 1), (9, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 178 for generator 21. -/
theorem ep_Q2_024_partial_21_0178_valid :
    mulPoly ep_Q2_024_coefficient_21_0178
        ep_Q2_024_generator_21_0100_0199 =
      ep_Q2_024_partial_21_0178 := by
  native_decide

/-- Coefficient term 179 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0179 : Poly :=
[
  term ((-4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (5, 1), (9, 1), (13, 2), (14, 1)]
]

/-- Partial product 179 for generator 21. -/
def ep_Q2_024_partial_21_0179 : Poly :=
[
  term ((-8486750246624093521424296941571253888 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (5, 1), (9, 1), (10, 1), (13, 2), (14, 1)],
  term ((4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (5, 1), (9, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 179 for generator 21. -/
theorem ep_Q2_024_partial_21_0179_valid :
    mulPoly ep_Q2_024_coefficient_21_0179
        ep_Q2_024_generator_21_0100_0199 =
      ep_Q2_024_partial_21_0179 := by
  native_decide

/-- Coefficient term 180 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0180 : Poly :=
[
  term ((-46078821547635904661215485512228766724 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (5, 1), (9, 1), (14, 1)]
]

/-- Partial product 180 for generator 21. -/
def ep_Q2_024_partial_21_0180 : Poly :=
[
  term ((-92157643095271809322430971024457533448 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (5, 1), (9, 1), (10, 1), (14, 1)],
  term ((46078821547635904661215485512228766724 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (5, 1), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 180 for generator 21. -/
theorem ep_Q2_024_partial_21_0180_valid :
    mulPoly ep_Q2_024_coefficient_21_0180
        ep_Q2_024_generator_21_0100_0199 =
      ep_Q2_024_partial_21_0180 := by
  native_decide

/-- Coefficient term 181 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0181 : Poly :=
[
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (5, 1), (9, 1), (14, 1), (15, 2)]
]

/-- Partial product 181 for generator 21. -/
def ep_Q2_024_partial_21_0181 : Poly :=
[
  term ((674456529895393409686477352003493571793009190155093372 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (5, 1), (9, 1), (10, 1), (14, 1), (15, 2)],
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (5, 1), (9, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 181 for generator 21. -/
theorem ep_Q2_024_partial_21_0181_valid :
    mulPoly ep_Q2_024_coefficient_21_0181
        ep_Q2_024_generator_21_0100_0199 =
      ep_Q2_024_partial_21_0181 := by
  native_decide

/-- Coefficient term 182 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0182 : Poly :=
[
  term ((833967741040952 : Rat) / 1162780221153193) [(0, 1), (5, 1), (9, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 182 for generator 21. -/
def ep_Q2_024_partial_21_0182 : Poly :=
[
  term ((1667935482081904 : Rat) / 1162780221153193) [(0, 1), (5, 1), (9, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-833967741040952 : Rat) / 1162780221153193) [(0, 1), (5, 1), (9, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 182 for generator 21. -/
theorem ep_Q2_024_partial_21_0182_valid :
    mulPoly ep_Q2_024_coefficient_21_0182
        ep_Q2_024_generator_21_0100_0199 =
      ep_Q2_024_partial_21_0182 := by
  native_decide

/-- Coefficient term 183 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0183 : Poly :=
[
  term ((-546876380874813893016244252650101120235374598983391271769 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(0, 1), (5, 1), (9, 1), (15, 2)]
]

/-- Partial product 183 for generator 21. -/
def ep_Q2_024_partial_21_0183 : Poly :=
[
  term ((-546876380874813893016244252650101120235374598983391271769 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(0, 1), (5, 1), (9, 1), (10, 1), (15, 2)],
  term ((546876380874813893016244252650101120235374598983391271769 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(0, 1), (5, 1), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 183 for generator 21. -/
theorem ep_Q2_024_partial_21_0183_valid :
    mulPoly ep_Q2_024_coefficient_21_0183
        ep_Q2_024_generator_21_0100_0199 =
      ep_Q2_024_partial_21_0183 := by
  native_decide

/-- Coefficient term 184 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0184 : Poly :=
[
  term ((-13179894624814495 : Rat) / 6976681326919158) [(0, 1), (5, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 184 for generator 21. -/
def ep_Q2_024_partial_21_0184 : Poly :=
[
  term ((-13179894624814495 : Rat) / 3488340663459579) [(0, 1), (5, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((13179894624814495 : Rat) / 6976681326919158) [(0, 1), (5, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 184 for generator 21. -/
theorem ep_Q2_024_partial_21_0184_valid :
    mulPoly ep_Q2_024_coefficient_21_0184
        ep_Q2_024_generator_21_0100_0199 =
      ep_Q2_024_partial_21_0184 := by
  native_decide

/-- Coefficient term 185 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0185 : Poly :=
[
  term ((-33781967257793617486815206073153137696 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (5, 1), (9, 2), (11, 1)]
]

/-- Partial product 185 for generator 21. -/
def ep_Q2_024_partial_21_0185 : Poly :=
[
  term ((-67563934515587234973630412146306275392 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (5, 1), (9, 2), (10, 1), (11, 1)],
  term ((33781967257793617486815206073153137696 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (5, 1), (9, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 185 for generator 21. -/
theorem ep_Q2_024_partial_21_0185_valid :
    mulPoly ep_Q2_024_coefficient_21_0185
        ep_Q2_024_generator_21_0100_0199 =
      ep_Q2_024_partial_21_0185 := by
  native_decide

/-- Coefficient term 186 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0186 : Poly :=
[
  term ((51916682732587159756343578366982608688 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (5, 1), (9, 2), (12, 1), (13, 1)]
]

/-- Partial product 186 for generator 21. -/
def ep_Q2_024_partial_21_0186 : Poly :=
[
  term ((103833365465174319512687156733965217376 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (5, 1), (9, 2), (10, 1), (12, 1), (13, 1)],
  term ((-51916682732587159756343578366982608688 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (5, 1), (9, 2), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 186 for generator 21. -/
theorem ep_Q2_024_partial_21_0186_valid :
    mulPoly ep_Q2_024_coefficient_21_0186
        ep_Q2_024_generator_21_0100_0199 =
      ep_Q2_024_partial_21_0186 := by
  native_decide

/-- Coefficient term 187 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0187 : Poly :=
[
  term ((-519790077507635364246714238454931580267528154182411463 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (5, 1), (9, 2), (12, 1), (15, 1)]
]

/-- Partial product 187 for generator 21. -/
def ep_Q2_024_partial_21_0187 : Poly :=
[
  term ((-1039580155015270728493428476909863160535056308364822926 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (5, 1), (9, 2), (10, 1), (12, 1), (15, 1)],
  term ((519790077507635364246714238454931580267528154182411463 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (5, 1), (9, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 187 for generator 21. -/
theorem ep_Q2_024_partial_21_0187_valid :
    mulPoly ep_Q2_024_coefficient_21_0187
        ep_Q2_024_generator_21_0100_0199 =
      ep_Q2_024_partial_21_0187 := by
  native_decide

/-- Coefficient term 188 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0188 : Poly :=
[
  term ((850957154578940 : Rat) / 1162780221153193) [(0, 1), (5, 1), (9, 2), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 188 for generator 21. -/
def ep_Q2_024_partial_21_0188 : Poly :=
[
  term ((1701914309157880 : Rat) / 1162780221153193) [(0, 1), (5, 1), (9, 2), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-850957154578940 : Rat) / 1162780221153193) [(0, 1), (5, 1), (9, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 188 for generator 21. -/
theorem ep_Q2_024_partial_21_0188_valid :
    mulPoly ep_Q2_024_coefficient_21_0188
        ep_Q2_024_generator_21_0100_0199 =
      ep_Q2_024_partial_21_0188 := by
  native_decide

/-- Coefficient term 189 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0189 : Poly :=
[
  term ((-866161346976921729008869342799551372232 : Rat) / 119970945740247729656669352802953926799) [(0, 1), (5, 1), (9, 2), (13, 1)]
]

/-- Partial product 189 for generator 21. -/
def ep_Q2_024_partial_21_0189 : Poly :=
[
  term ((-1732322693953843458017738685599102744464 : Rat) / 119970945740247729656669352802953926799) [(0, 1), (5, 1), (9, 2), (10, 1), (13, 1)],
  term ((866161346976921729008869342799551372232 : Rat) / 119970945740247729656669352802953926799) [(0, 1), (5, 1), (9, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 189 for generator 21. -/
theorem ep_Q2_024_partial_21_0189_valid :
    mulPoly ep_Q2_024_coefficient_21_0189
        ep_Q2_024_generator_21_0100_0199 =
      ep_Q2_024_partial_21_0189 := by
  native_decide

/-- Coefficient term 190 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0190 : Poly :=
[
  term ((-24311462327325841715821792273981411838734259987160207707 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (5, 1), (9, 2), (15, 1)]
]

/-- Partial product 190 for generator 21. -/
def ep_Q2_024_partial_21_0190 : Poly :=
[
  term ((-48622924654651683431643584547962823677468519974320415414 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (5, 1), (9, 2), (10, 1), (15, 1)],
  term ((24311462327325841715821792273981411838734259987160207707 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (5, 1), (9, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 190 for generator 21. -/
theorem ep_Q2_024_partial_21_0190_valid :
    mulPoly ep_Q2_024_coefficient_21_0190
        ep_Q2_024_generator_21_0100_0199 =
      ep_Q2_024_partial_21_0190 := by
  native_decide

/-- Coefficient term 191 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0191 : Poly :=
[
  term ((35421006354003964 : Rat) / 3488340663459579) [(0, 1), (5, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 191 for generator 21. -/
def ep_Q2_024_partial_21_0191 : Poly :=
[
  term ((70842012708007928 : Rat) / 3488340663459579) [(0, 1), (5, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((-35421006354003964 : Rat) / 3488340663459579) [(0, 1), (5, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 191 for generator 21. -/
theorem ep_Q2_024_partial_21_0191_valid :
    mulPoly ep_Q2_024_coefficient_21_0191
        ep_Q2_024_generator_21_0100_0199 =
      ep_Q2_024_partial_21_0191 := by
  native_decide

/-- Coefficient term 192 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0192 : Poly :=
[
  term ((952743145992012822131987741397365806328 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (5, 1), (9, 3)]
]

/-- Partial product 192 for generator 21. -/
def ep_Q2_024_partial_21_0192 : Poly :=
[
  term ((-952743145992012822131987741397365806328 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (5, 1), (9, 3)],
  term ((1905486291984025644263975482794731612656 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (5, 1), (9, 3), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 192 for generator 21. -/
theorem ep_Q2_024_partial_21_0192_valid :
    mulPoly ep_Q2_024_coefficient_21_0192
        ep_Q2_024_generator_21_0100_0199 =
      ep_Q2_024_partial_21_0192 := by
  native_decide

/-- Coefficient term 193 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0193 : Poly :=
[
  term ((5055039996011679220574921484585014862046 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (5, 1), (11, 1)]
]

/-- Partial product 193 for generator 21. -/
def ep_Q2_024_partial_21_0193 : Poly :=
[
  term ((10110079992023358441149842969170029724092 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (5, 1), (10, 1), (11, 1)],
  term ((-5055039996011679220574921484585014862046 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (5, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 193 for generator 21. -/
theorem ep_Q2_024_partial_21_0193_valid :
    mulPoly ep_Q2_024_coefficient_21_0193
        ep_Q2_024_generator_21_0100_0199 =
      ep_Q2_024_partial_21_0193 := by
  native_decide

/-- Coefficient term 194 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0194 : Poly :=
[
  term ((-181142123956909083033591111950365889858459836126228364 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (5, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 194 for generator 21. -/
def ep_Q2_024_partial_21_0194 : Poly :=
[
  term ((-362284247913818166067182223900731779716919672252456728 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (5, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((181142123956909083033591111950365889858459836126228364 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (5, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 194 for generator 21. -/
theorem ep_Q2_024_partial_21_0194_valid :
    mulPoly ep_Q2_024_coefficient_21_0194
        ep_Q2_024_generator_21_0100_0199 =
      ep_Q2_024_partial_21_0194 := by
  native_decide

/-- Coefficient term 195 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0195 : Poly :=
[
  term ((751294408028112 : Rat) / 1162780221153193) [(0, 1), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 195 for generator 21. -/
def ep_Q2_024_partial_21_0195 : Poly :=
[
  term ((1502588816056224 : Rat) / 1162780221153193) [(0, 1), (5, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-751294408028112 : Rat) / 1162780221153193) [(0, 1), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 195 for generator 21. -/
theorem ep_Q2_024_partial_21_0195_valid :
    mulPoly ep_Q2_024_coefficient_21_0195
        ep_Q2_024_generator_21_0100_0199 =
      ep_Q2_024_partial_21_0195 := by
  native_decide

/-- Coefficient term 196 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0196 : Poly :=
[
  term ((-26816557735183032527929146058902134264 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (5, 1), (11, 1), (13, 2)]
]

/-- Partial product 196 for generator 21. -/
def ep_Q2_024_partial_21_0196 : Poly :=
[
  term ((-53633115470366065055858292117804268528 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (5, 1), (10, 1), (11, 1), (13, 2)],
  term ((26816557735183032527929146058902134264 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (5, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 196 for generator 21. -/
theorem ep_Q2_024_partial_21_0196_valid :
    mulPoly ep_Q2_024_coefficient_21_0196
        ep_Q2_024_generator_21_0100_0199 =
      ep_Q2_024_partial_21_0196 := by
  native_decide

/-- Coefficient term 197 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0197 : Poly :=
[
  term ((128963188297968558091343488758641108264 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (5, 1), (12, 1), (13, 1)]
]

/-- Partial product 197 for generator 21. -/
def ep_Q2_024_partial_21_0197 : Poly :=
[
  term ((257926376595937116182686977517282216528 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (5, 1), (10, 1), (12, 1), (13, 1)],
  term ((-128963188297968558091343488758641108264 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (5, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 197 for generator 21. -/
theorem ep_Q2_024_partial_21_0197_valid :
    mulPoly ep_Q2_024_coefficient_21_0197
        ep_Q2_024_generator_21_0100_0199 =
      ep_Q2_024_partial_21_0197 := by
  native_decide

/-- Coefficient term 198 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0198 : Poly :=
[
  term ((-8278280340570641397432846989912436086196149701856059774 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (5, 1), (12, 1), (15, 1)]
]

/-- Partial product 198 for generator 21. -/
def ep_Q2_024_partial_21_0198 : Poly :=
[
  term ((-16556560681141282794865693979824872172392299403712119548 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (5, 1), (10, 1), (12, 1), (15, 1)],
  term ((8278280340570641397432846989912436086196149701856059774 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (5, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 198 for generator 21. -/
theorem ep_Q2_024_partial_21_0198_valid :
    mulPoly ep_Q2_024_coefficient_21_0198
        ep_Q2_024_generator_21_0100_0199 =
      ep_Q2_024_partial_21_0198 := by
  native_decide

/-- Coefficient term 199 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_0199 : Poly :=
[
  term ((1359711896234920 : Rat) / 1162780221153193) [(0, 1), (5, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 199 for generator 21. -/
def ep_Q2_024_partial_21_0199 : Poly :=
[
  term ((2719423792469840 : Rat) / 1162780221153193) [(0, 1), (5, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1359711896234920 : Rat) / 1162780221153193) [(0, 1), (5, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 199 for generator 21. -/
theorem ep_Q2_024_partial_21_0199_valid :
    mulPoly ep_Q2_024_coefficient_21_0199
        ep_Q2_024_generator_21_0100_0199 =
      ep_Q2_024_partial_21_0199 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_024_partials_21_0100_0199 : List Poly :=
[
  ep_Q2_024_partial_21_0100,
  ep_Q2_024_partial_21_0101,
  ep_Q2_024_partial_21_0102,
  ep_Q2_024_partial_21_0103,
  ep_Q2_024_partial_21_0104,
  ep_Q2_024_partial_21_0105,
  ep_Q2_024_partial_21_0106,
  ep_Q2_024_partial_21_0107,
  ep_Q2_024_partial_21_0108,
  ep_Q2_024_partial_21_0109,
  ep_Q2_024_partial_21_0110,
  ep_Q2_024_partial_21_0111,
  ep_Q2_024_partial_21_0112,
  ep_Q2_024_partial_21_0113,
  ep_Q2_024_partial_21_0114,
  ep_Q2_024_partial_21_0115,
  ep_Q2_024_partial_21_0116,
  ep_Q2_024_partial_21_0117,
  ep_Q2_024_partial_21_0118,
  ep_Q2_024_partial_21_0119,
  ep_Q2_024_partial_21_0120,
  ep_Q2_024_partial_21_0121,
  ep_Q2_024_partial_21_0122,
  ep_Q2_024_partial_21_0123,
  ep_Q2_024_partial_21_0124,
  ep_Q2_024_partial_21_0125,
  ep_Q2_024_partial_21_0126,
  ep_Q2_024_partial_21_0127,
  ep_Q2_024_partial_21_0128,
  ep_Q2_024_partial_21_0129,
  ep_Q2_024_partial_21_0130,
  ep_Q2_024_partial_21_0131,
  ep_Q2_024_partial_21_0132,
  ep_Q2_024_partial_21_0133,
  ep_Q2_024_partial_21_0134,
  ep_Q2_024_partial_21_0135,
  ep_Q2_024_partial_21_0136,
  ep_Q2_024_partial_21_0137,
  ep_Q2_024_partial_21_0138,
  ep_Q2_024_partial_21_0139,
  ep_Q2_024_partial_21_0140,
  ep_Q2_024_partial_21_0141,
  ep_Q2_024_partial_21_0142,
  ep_Q2_024_partial_21_0143,
  ep_Q2_024_partial_21_0144,
  ep_Q2_024_partial_21_0145,
  ep_Q2_024_partial_21_0146,
  ep_Q2_024_partial_21_0147,
  ep_Q2_024_partial_21_0148,
  ep_Q2_024_partial_21_0149,
  ep_Q2_024_partial_21_0150,
  ep_Q2_024_partial_21_0151,
  ep_Q2_024_partial_21_0152,
  ep_Q2_024_partial_21_0153,
  ep_Q2_024_partial_21_0154,
  ep_Q2_024_partial_21_0155,
  ep_Q2_024_partial_21_0156,
  ep_Q2_024_partial_21_0157,
  ep_Q2_024_partial_21_0158,
  ep_Q2_024_partial_21_0159,
  ep_Q2_024_partial_21_0160,
  ep_Q2_024_partial_21_0161,
  ep_Q2_024_partial_21_0162,
  ep_Q2_024_partial_21_0163,
  ep_Q2_024_partial_21_0164,
  ep_Q2_024_partial_21_0165,
  ep_Q2_024_partial_21_0166,
  ep_Q2_024_partial_21_0167,
  ep_Q2_024_partial_21_0168,
  ep_Q2_024_partial_21_0169,
  ep_Q2_024_partial_21_0170,
  ep_Q2_024_partial_21_0171,
  ep_Q2_024_partial_21_0172,
  ep_Q2_024_partial_21_0173,
  ep_Q2_024_partial_21_0174,
  ep_Q2_024_partial_21_0175,
  ep_Q2_024_partial_21_0176,
  ep_Q2_024_partial_21_0177,
  ep_Q2_024_partial_21_0178,
  ep_Q2_024_partial_21_0179,
  ep_Q2_024_partial_21_0180,
  ep_Q2_024_partial_21_0181,
  ep_Q2_024_partial_21_0182,
  ep_Q2_024_partial_21_0183,
  ep_Q2_024_partial_21_0184,
  ep_Q2_024_partial_21_0185,
  ep_Q2_024_partial_21_0186,
  ep_Q2_024_partial_21_0187,
  ep_Q2_024_partial_21_0188,
  ep_Q2_024_partial_21_0189,
  ep_Q2_024_partial_21_0190,
  ep_Q2_024_partial_21_0191,
  ep_Q2_024_partial_21_0192,
  ep_Q2_024_partial_21_0193,
  ep_Q2_024_partial_21_0194,
  ep_Q2_024_partial_21_0195,
  ep_Q2_024_partial_21_0196,
  ep_Q2_024_partial_21_0197,
  ep_Q2_024_partial_21_0198,
  ep_Q2_024_partial_21_0199
]

/-- Sum of partial products in this block. -/
def ep_Q2_024_block_21_0100_0199 : Poly :=
[
  term ((-2096958610707350 : Rat) / 1162780221153193) [(0, 1), (3, 1), (7, 1), (10, 1), (15, 2), (16, 1)],
  term ((1048479305353675 : Rat) / 1162780221153193) [(0, 1), (3, 1), (7, 1), (15, 2), (16, 1)],
  term ((-1652695128300478652375073904873736949728 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (3, 1), (8, 1), (9, 1)],
  term ((3305390256600957304750147809747473899456 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (3, 1), (8, 1), (9, 1), (10, 1)],
  term ((-1652695128300478652375073904873736949728 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 1), (8, 1), (10, 1), (11, 1)],
  term ((826347564150239326187536952436868474864 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 1), (8, 1), (11, 1)],
  term ((9711331498283881805320459839702043125308 : Rat) / 5398692558311147834550120876132926705955) [(0, 1), (3, 1), (9, 1)],
  term ((-19422662996567763610640919679404086250616 : Rat) / 5398692558311147834550120876132926705955) [(0, 1), (3, 1), (9, 1), (10, 1)],
  term ((234824404481097668778610925125521767712 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 1), (9, 1), (10, 1), (11, 1), (13, 1)],
  term ((-1222689308379968181009349179356074961661002890148376823 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (3, 1), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((2242722674317404 : Rat) / 1162780221153193) [(0, 1), (3, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((359800988817789934888267636369853231432 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 1), (9, 1), (10, 1), (12, 1)],
  term ((-145368386206251761864564319784992840704 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 1), (9, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((12598300087952842907633674886908492089457988774768012048 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (3, 1), (9, 1), (10, 1), (12, 1), (15, 2)],
  term ((-5548604100360896 : Rat) / 1162780221153193) [(0, 1), (3, 1), (9, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((5982837320379845651599041426655130663707208580347239615 : Rat) / 418499528459408918327148043876319653860305890461357621) [(0, 1), (3, 1), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((-10375057428886340 : Rat) / 3488340663459579) [(0, 1), (3, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((394147835050448810694877824632526207856 : Rat) / 359912837220743188970008058408861780397) [(0, 1), (3, 1), (9, 1), (10, 1), (13, 2)],
  term ((508470349154038865005416199007327333444 : Rat) / 359912837220743188970008058408861780397) [(0, 1), (3, 1), (9, 1), (10, 1), (14, 1)],
  term ((-82347741131251639543090079971480487940289810843827224336 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(0, 1), (3, 1), (9, 1), (10, 1), (15, 2)],
  term ((-28979257499406016 : Rat) / 3488340663459579) [(0, 1), (3, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((-117412202240548834389305462562760883856 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 1), (9, 1), (11, 1), (13, 1)],
  term ((1222689308379968181009349179356074961661002890148376823 : Rat) / 464999476066009909252386715418132948733673211623730690) [(0, 1), (3, 1), (9, 1), (11, 1), (15, 1)],
  term ((-1121361337158702 : Rat) / 1162780221153193) [(0, 1), (3, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-179900494408894967444133818184926615716 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 1), (9, 1), (12, 1)],
  term ((72684193103125880932282159892496420352 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((-6299150043976421453816837443454246044728994387384006024 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (3, 1), (9, 1), (12, 1), (15, 2)],
  term ((2774302050180448 : Rat) / 1162780221153193) [(0, 1), (3, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-5982837320379845651599041426655130663707208580347239615 : Rat) / 836999056918817836654296087752639307720611780922715242) [(0, 1), (3, 1), (9, 1), (13, 1), (15, 1)],
  term ((5187528714443170 : Rat) / 3488340663459579) [(0, 1), (3, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-197073917525224405347438912316263103928 : Rat) / 359912837220743188970008058408861780397) [(0, 1), (3, 1), (9, 1), (13, 2)],
  term ((-254235174577019432502708099503663666722 : Rat) / 359912837220743188970008058408861780397) [(0, 1), (3, 1), (9, 1), (14, 1)],
  term ((41173870565625819771545039985740243970144905421913612168 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(0, 1), (3, 1), (9, 1), (15, 2)],
  term ((14489628749703008 : Rat) / 3488340663459579) [(0, 1), (3, 1), (9, 1), (15, 2), (16, 1)],
  term ((189337596559409838993915431795101263168 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 1), (9, 2), (10, 1), (11, 1)],
  term ((-73424885016391334592524874103881802976 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 1), (9, 2), (10, 1), (13, 1)],
  term ((-2290696804451168831783848563296676872323742434583050994 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(0, 1), (3, 1), (9, 2), (10, 1), (15, 1)],
  term ((-1495148449544936 : Rat) / 3488340663459579) [(0, 1), (3, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((-94668798279704919496957715897550631584 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 1), (9, 2), (11, 1)],
  term ((36712442508195667296262437051940901488 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 1), (9, 2), (13, 1)],
  term ((1145348402225584415891924281648338436161871217291525497 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(0, 1), (3, 1), (9, 2), (15, 1)],
  term ((747574224772468 : Rat) / 3488340663459579) [(0, 1), (3, 1), (9, 2), (15, 1), (16, 1)],
  term ((63112532186469946331305143931700421056 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 1), (9, 3)],
  term ((-126225064372939892662610287863400842112 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 1), (9, 3), (10, 1)],
  term ((322031993138780262711019749698931904622 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 1), (10, 1), (11, 1)],
  term ((-179900494408894967444133818184926615716 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 1), (10, 1), (11, 1), (12, 1)],
  term ((66547862040521339861322380022048721344 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 1), (10, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-397491232950237887996184205565539271127191104441069376 : Rat) / 46499947606600990925238671541813294873367321162373069) [(0, 1), (3, 1), (10, 1), (11, 1), (12, 1), (15, 2)],
  term ((3163264603646592 : Rat) / 1162780221153193) [(0, 1), (3, 1), (10, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-13665940368750242398805821778499109403651343582341271507 : Rat) / 464999476066009909252386715418132948733673211623730690) [(0, 1), (3, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((212582817171990 : Rat) / 1162780221153193) [(0, 1), (3, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-32374617250718488653403865302693490632 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 1), (10, 1), (11, 1), (13, 2)],
  term ((-1217648963717924911224184363882747984154 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 1), (10, 1), (11, 1), (14, 1)],
  term ((2298204085221019497339885976171791710852429622693000547 : Rat) / 23644041155898808945036612648379641461034231099511730) [(0, 1), (3, 1), (10, 1), (11, 1), (15, 2)],
  term ((-2096958610707350 : Rat) / 1162780221153193) [(0, 1), (3, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((60059846594267677279406589311277335612 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 1), (10, 1), (12, 1), (13, 1)],
  term ((-6544627211193844374324207850933658385537878969261824301 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(0, 1), (3, 1), (10, 1), (12, 1), (15, 1)],
  term ((448228140819559 : Rat) / 1162780221153193) [(0, 1), (3, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-188722442315693407427840899617497803072 : Rat) / 119970945740247729656669352802953926799) [(0, 1), (3, 1), (10, 1), (13, 1)],
  term ((-137190219846581823769882591558384019657388474051565837181 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(0, 1), (3, 1), (10, 1), (15, 1)],
  term ((-13092500098671601 : Rat) / 2325560442306386) [(0, 1), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((-161015996569390131355509874849465952311 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 1), (11, 1)],
  term ((89950247204447483722066909092463307858 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 1), (11, 1), (12, 1)],
  term ((-33273931020260669930661190011024360672 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((198745616475118943998092102782769635563595552220534688 : Rat) / 46499947606600990925238671541813294873367321162373069) [(0, 1), (3, 1), (11, 1), (12, 1), (15, 2)],
  term ((-1581632301823296 : Rat) / 1162780221153193) [(0, 1), (3, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((13665940368750242398805821778499109403651343582341271507 : Rat) / 929998952132019818504773430836265897467346423247461380) [(0, 1), (3, 1), (11, 1), (13, 1), (15, 1)],
  term ((-106291408585995 : Rat) / 1162780221153193) [(0, 1), (3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((16187308625359244326701932651346745316 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 1), (11, 1), (13, 2)],
  term ((608824481858962455612092181941373992077 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 1), (11, 1), (14, 1)],
  term ((-2298204085221019497339885976171791710852429622693000547 : Rat) / 47288082311797617890073225296759282922068462199023460) [(0, 1), (3, 1), (11, 1), (15, 2)],
  term ((1048479305353675 : Rat) / 1162780221153193) [(0, 1), (3, 1), (11, 1), (15, 2), (16, 1)],
  term ((-30029923297133838639703294655638667806 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 1), (12, 1), (13, 1)],
  term ((6544627211193844374324207850933658385537878969261824301 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(0, 1), (3, 1), (12, 1), (15, 1)],
  term ((-448228140819559 : Rat) / 2325560442306386) [(0, 1), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((94361221157846703713920449808748901536 : Rat) / 119970945740247729656669352802953926799) [(0, 1), (3, 1), (13, 1)],
  term ((137190219846581823769882591558384019657388474051565837181 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(0, 1), (3, 1), (15, 1)],
  term ((13092500098671601 : Rat) / 4651120884612772) [(0, 1), (3, 1), (15, 1), (16, 1)],
  term ((-1429182194689304419382031011936884624481 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (4, 1)],
  term ((-157425345043273170788251404812382566120 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (4, 1), (9, 1), (10, 1), (11, 1)],
  term ((-1448991946022183140921559219383210023424 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (4, 1), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((13028384834050735273070613066872820346400929112596883864 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (4, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-9572621512797280 : Rat) / 1162780221153193) [(0, 1), (4, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((2006759871699136339242849061336339483904 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (4, 1), (9, 1), (10, 1), (13, 1)],
  term ((8486750246624093521424296941571253888 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (4, 1), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((674456529895393409686477352003493571793009190155093372 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (4, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((1667935482081904 : Rat) / 1162780221153193) [(0, 1), (4, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-16616398231803337513344654781761498402151012037509261882 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (4, 1), (9, 1), (10, 1), (15, 1)],
  term ((4414197889054120 : Rat) / 1162780221153193) [(0, 1), (4, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((78712672521636585394125702406191283060 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (4, 1), (9, 1), (11, 1)],
  term ((724495973011091570460779609691605011712 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (4, 1), (9, 1), (12, 1), (13, 1)],
  term ((-6514192417025367636535306533436410173200464556298441932 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (4, 1), (9, 1), (12, 1), (15, 1)],
  term ((4786310756398640 : Rat) / 1162780221153193) [(0, 1), (4, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1003379935849568169621424530668169741952 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (4, 1), (9, 1), (13, 1)],
  term ((-4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (4, 1), (9, 1), (13, 1), (14, 1)],
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (4, 1), (9, 1), (14, 1), (15, 1)],
  term ((-833967741040952 : Rat) / 1162780221153193) [(0, 1), (4, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((8308199115901668756672327390880749201075506018754630941 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (4, 1), (9, 1), (15, 1)],
  term ((-2207098944527060 : Rat) / 1162780221153193) [(0, 1), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((-2077934561863747246144279575515194582868 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (4, 1), (9, 2)],
  term ((4155869123727494492288559151030389165736 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (4, 1), (9, 2), (10, 1)],
  term ((2858364389378608838764062023873769248962 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (4, 1), (10, 1)],
  term ((368146372656118173321540785078031212928 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (4, 1), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((-30215090288162553460114940041385093334942083458653059432 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (4, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((8650966754075360 : Rat) / 1162780221153193) [(0, 1), (4, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1291018610476057309655616300833378846512 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (4, 1), (10, 1), (11, 1), (13, 1)],
  term ((121071138945791194450453112344060901897565316822137682616 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(0, 1), (4, 1), (10, 1), (11, 1), (15, 1)],
  term ((-7832551442171008 : Rat) / 1162780221153193) [(0, 1), (4, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((4466115409796894554675042235934975650543774254263469936 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (4, 1), (10, 1), (13, 1), (15, 1)],
  term ((-2694765326577600 : Rat) / 1162780221153193) [(0, 1), (4, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((46606006548196236713541705654221512448 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (4, 1), (10, 1), (13, 2)],
  term ((-184073186328059086660770392539015606464 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (4, 1), (11, 1), (12, 1), (13, 1)],
  term ((15107545144081276730057470020692546667471041729326529716 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (4, 1), (11, 1), (12, 1), (15, 1)],
  term ((-4325483377037680 : Rat) / 1162780221153193) [(0, 1), (4, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((645509305238028654827808150416689423256 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (4, 1), (11, 1), (13, 1)],
  term ((-60535569472895597225226556172030450948782658411068841308 : Rat) / 2092497642297044591635740219381598269301529452306788105) [(0, 1), (4, 1), (11, 1), (15, 1)],
  term ((3916275721085504 : Rat) / 1162780221153193) [(0, 1), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((-2233057704898447277337521117967487825271887127131734968 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (4, 1), (13, 1), (15, 1)],
  term ((1347382663288800 : Rat) / 1162780221153193) [(0, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-23303003274098118356770852827110756224 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (4, 1), (13, 2)],
  term ((-16890983628896808743407603036576568848 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (5, 1), (8, 1), (9, 1)],
  term ((33781967257793617486815206073153137696 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (5, 1), (8, 1), (9, 1), (10, 1)],
  term ((40440149595023928932116585720924683072 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (5, 1), (8, 1), (10, 1), (13, 1)],
  term ((-2173624517752731263429423385757322935670570690431915648 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (5, 1), (8, 1), (10, 1), (15, 1)],
  term ((-206941537023232 : Rat) / 1162780221153193) [(0, 1), (5, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-20220074797511964466058292860462341536 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (5, 1), (8, 1), (13, 1)],
  term ((1086812258876365631714711692878661467835285345215957824 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (5, 1), (8, 1), (15, 1)],
  term ((103470768511616 : Rat) / 1162780221153193) [(0, 1), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((9462862514621064504124386582454426912189 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (5, 1), (9, 1)],
  term ((-18925725029242129008248773164908853824378 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (5, 1), (9, 1), (10, 1)],
  term ((-121413671971801965936730225181296978744 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (5, 1), (9, 1), (10, 1), (11, 1), (13, 1)],
  term ((4347249035505462526858846771514645871341141380863831296 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (5, 1), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((413883074046464 : Rat) / 1162780221153193) [(0, 1), (5, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((4089983818091693784676872944598335248 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (5, 1), (9, 1), (10, 1), (12, 1)],
  term ((-16527737784929168061123148869963794329901925980398052713 : Rat) / 278999685639605945551432029250879769240203926974238414) [(0, 1), (5, 1), (9, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((9138159832270958 : Rat) / 1162780221153193) [(0, 1), (5, 1), (9, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1399197928754048569331968958738981057912 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (5, 1), (9, 1), (10, 1), (12, 1), (13, 2)],
  term ((57065163418514028206963760297560614190626285699065528079 : Rat) / 464999476066009909252386715418132948733673211623730690) [(0, 1), (5, 1), (9, 1), (10, 1), (12, 1), (15, 2)],
  term ((-26408829814481614 : Rat) / 1162780221153193) [(0, 1), (5, 1), (9, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-3362414424148325569733089263026150459960540076430602476 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (5, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-1667935482081904 : Rat) / 1162780221153193) [(0, 1), (5, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((2298993319879189288962486085765995046746124666739705812891 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(0, 1), (5, 1), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((50972133270704143 : Rat) / 3488340663459579) [(0, 1), (5, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-16827039493084580281707108413782983104 : Rat) / 30501087900062982116102377831259472915) [(0, 1), (5, 1), (9, 1), (10, 1), (13, 2)],
  term ((-8486750246624093521424296941571253888 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (5, 1), (9, 1), (10, 1), (13, 2), (14, 1)],
  term ((-92157643095271809322430971024457533448 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (5, 1), (9, 1), (10, 1), (14, 1)],
  term ((674456529895393409686477352003493571793009190155093372 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (5, 1), (9, 1), (10, 1), (14, 1), (15, 2)],
  term ((1667935482081904 : Rat) / 1162780221153193) [(0, 1), (5, 1), (9, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-546876380874813893016244252650101120235374598983391271769 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(0, 1), (5, 1), (9, 1), (10, 1), (15, 2)],
  term ((-13179894624814495 : Rat) / 3488340663459579) [(0, 1), (5, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((60706835985900982968365112590648489372 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (5, 1), (9, 1), (11, 1), (13, 1)],
  term ((-2173624517752731263429423385757322935670570690431915648 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (5, 1), (9, 1), (11, 1), (15, 1)],
  term ((-206941537023232 : Rat) / 1162780221153193) [(0, 1), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-2044991909045846892338436472299167624 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (5, 1), (9, 1), (12, 1)],
  term ((16527737784929168061123148869963794329901925980398052713 : Rat) / 557999371279211891102864058501759538480407853948476828) [(0, 1), (5, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((-4569079916135479 : Rat) / 1162780221153193) [(0, 1), (5, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-699598964377024284665984479369490528956 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (5, 1), (9, 1), (12, 1), (13, 2)],
  term ((-57065163418514028206963760297560614190626285699065528079 : Rat) / 929998952132019818504773430836265897467346423247461380) [(0, 1), (5, 1), (9, 1), (12, 1), (15, 2)],
  term ((13204414907240807 : Rat) / 1162780221153193) [(0, 1), (5, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((1681207212074162784866544631513075229980270038215301238 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (5, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((833967741040952 : Rat) / 1162780221153193) [(0, 1), (5, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2298993319879189288962486085765995046746124666739705812891 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(0, 1), (5, 1), (9, 1), (13, 1), (15, 1)],
  term ((-50972133270704143 : Rat) / 6976681326919158) [(0, 1), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((8413519746542290140853554206891491552 : Rat) / 30501087900062982116102377831259472915) [(0, 1), (5, 1), (9, 1), (13, 2)],
  term ((4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (5, 1), (9, 1), (13, 2), (14, 1)],
  term ((46078821547635904661215485512228766724 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (5, 1), (9, 1), (14, 1)],
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (5, 1), (9, 1), (14, 1), (15, 2)],
  term ((-833967741040952 : Rat) / 1162780221153193) [(0, 1), (5, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((546876380874813893016244252650101120235374598983391271769 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(0, 1), (5, 1), (9, 1), (15, 2)],
  term ((13179894624814495 : Rat) / 6976681326919158) [(0, 1), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((-67563934515587234973630412146306275392 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (5, 1), (9, 2), (10, 1), (11, 1)],
  term ((103833365465174319512687156733965217376 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (5, 1), (9, 2), (10, 1), (12, 1), (13, 1)],
  term ((-1039580155015270728493428476909863160535056308364822926 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (5, 1), (9, 2), (10, 1), (12, 1), (15, 1)],
  term ((1701914309157880 : Rat) / 1162780221153193) [(0, 1), (5, 1), (9, 2), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1732322693953843458017738685599102744464 : Rat) / 119970945740247729656669352802953926799) [(0, 1), (5, 1), (9, 2), (10, 1), (13, 1)],
  term ((-48622924654651683431643584547962823677468519974320415414 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (5, 1), (9, 2), (10, 1), (15, 1)],
  term ((70842012708007928 : Rat) / 3488340663459579) [(0, 1), (5, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((33781967257793617486815206073153137696 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (5, 1), (9, 2), (11, 1)],
  term ((-51916682732587159756343578366982608688 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (5, 1), (9, 2), (12, 1), (13, 1)],
  term ((519790077507635364246714238454931580267528154182411463 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (5, 1), (9, 2), (12, 1), (15, 1)],
  term ((-850957154578940 : Rat) / 1162780221153193) [(0, 1), (5, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((866161346976921729008869342799551372232 : Rat) / 119970945740247729656669352802953926799) [(0, 1), (5, 1), (9, 2), (13, 1)],
  term ((24311462327325841715821792273981411838734259987160207707 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (5, 1), (9, 2), (15, 1)],
  term ((-35421006354003964 : Rat) / 3488340663459579) [(0, 1), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((-952743145992012822131987741397365806328 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (5, 1), (9, 3)],
  term ((1905486291984025644263975482794731612656 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (5, 1), (9, 3), (10, 1)],
  term ((10110079992023358441149842969170029724092 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (5, 1), (10, 1), (11, 1)],
  term ((-362284247913818166067182223900731779716919672252456728 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (5, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((1502588816056224 : Rat) / 1162780221153193) [(0, 1), (5, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-53633115470366065055858292117804268528 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (5, 1), (10, 1), (11, 1), (13, 2)],
  term ((257926376595937116182686977517282216528 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (5, 1), (10, 1), (12, 1), (13, 1)],
  term ((-16556560681141282794865693979824872172392299403712119548 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (5, 1), (10, 1), (12, 1), (15, 1)],
  term ((2719423792469840 : Rat) / 1162780221153193) [(0, 1), (5, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-5055039996011679220574921484585014862046 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (5, 1), (11, 1)],
  term ((181142123956909083033591111950365889858459836126228364 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (5, 1), (11, 1), (13, 1), (15, 1)],
  term ((-751294408028112 : Rat) / 1162780221153193) [(0, 1), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((26816557735183032527929146058902134264 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (5, 1), (11, 1), (13, 2)],
  term ((-128963188297968558091343488758641108264 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (5, 1), (12, 1), (13, 1)],
  term ((8278280340570641397432846989912436086196149701856059774 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (5, 1), (12, 1), (15, 1)],
  term ((-1359711896234920 : Rat) / 1162780221153193) [(0, 1), (5, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 21, terms 100 through 199. -/
theorem ep_Q2_024_block_21_0100_0199_valid :
    checkProductSumEq ep_Q2_024_partials_21_0100_0199
      ep_Q2_024_block_21_0100_0199 = true := by
  native_decide

end EpQ2024TermShards

end Patterns

end EndpointCertificate

end Problem97
