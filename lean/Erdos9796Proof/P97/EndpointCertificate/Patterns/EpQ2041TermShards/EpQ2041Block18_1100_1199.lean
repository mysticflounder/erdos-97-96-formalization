/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_041, term block 18:1100-1199

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_041`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2041TermShards

/-- Generator polynomial 18 for endpoint certificate `ep_Q2_041`. -/
def ep_Q2_041_generator_18_1100_1199 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(8, 1)]
]

/-- Coefficient term 1100 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1100 : Poly :=
[
  term ((-288850003873957601440 : Rat) / 259001945121800951) [(1, 1), (8, 1), (13, 3), (14, 1)]
]

/-- Partial product 1100 for generator 18. -/
def ep_Q2_041_partial_18_1100 : Poly :=
[
  term ((288850003873957601440 : Rat) / 259001945121800951) [(1, 1), (8, 1), (13, 3), (14, 1)],
  term ((-577700007747915202880 : Rat) / 259001945121800951) [(1, 1), (8, 2), (13, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1100 for generator 18. -/
theorem ep_Q2_041_partial_18_1100_valid :
    mulPoly ep_Q2_041_coefficient_18_1100
        ep_Q2_041_generator_18_1100_1199 =
      ep_Q2_041_partial_18_1100 := by
  native_decide

/-- Coefficient term 1101 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1101 : Poly :=
[
  term ((971195574405240844817825225567645738834683308963096097391642220 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (13, 3), (14, 1), (15, 2)]
]

/-- Partial product 1101 for generator 18. -/
def ep_Q2_041_partial_18_1101 : Poly :=
[
  term ((-971195574405240844817825225567645738834683308963096097391642220 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (13, 3), (14, 1), (15, 2)],
  term ((1942391148810481689635650451135291477669366617926192194783284440 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 2), (13, 3), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1101 for generator 18. -/
theorem ep_Q2_041_partial_18_1101_valid :
    mulPoly ep_Q2_041_coefficient_18_1101
        ep_Q2_041_generator_18_1100_1199 =
      ep_Q2_041_partial_18_1101 := by
  native_decide

/-- Coefficient term 1102 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1102 : Poly :=
[
  term ((-20338086400 : Rat) / 151763803) [(1, 1), (8, 1), (13, 3), (14, 1), (16, 1)]
]

/-- Partial product 1102 for generator 18. -/
def ep_Q2_041_partial_18_1102 : Poly :=
[
  term ((20338086400 : Rat) / 151763803) [(1, 1), (8, 1), (13, 3), (14, 1), (16, 1)],
  term ((-40676172800 : Rat) / 151763803) [(1, 1), (8, 2), (13, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1102 for generator 18. -/
theorem ep_Q2_041_partial_18_1102_valid :
    mulPoly ep_Q2_041_coefficient_18_1102
        ep_Q2_041_generator_18_1100_1199 =
      ep_Q2_041_partial_18_1102 := by
  native_decide

/-- Coefficient term 1103 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1103 : Poly :=
[
  term ((1654814057236459200468639324301719495730231770333596445434708360 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (13, 3), (15, 2)]
]

/-- Partial product 1103 for generator 18. -/
def ep_Q2_041_partial_18_1103 : Poly :=
[
  term ((-1654814057236459200468639324301719495730231770333596445434708360 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (13, 3), (15, 2)],
  term ((3309628114472918400937278648603438991460463540667192890869416720 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 2), (13, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1103 for generator 18. -/
theorem ep_Q2_041_partial_18_1103_valid :
    mulPoly ep_Q2_041_coefficient_18_1103
        ep_Q2_041_generator_18_1100_1199 =
      ep_Q2_041_partial_18_1103 := by
  native_decide

/-- Coefficient term 1104 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1104 : Poly :=
[
  term ((4776774240 : Rat) / 151763803) [(1, 1), (8, 1), (13, 3), (16, 1)]
]

/-- Partial product 1104 for generator 18. -/
def ep_Q2_041_partial_18_1104 : Poly :=
[
  term ((-4776774240 : Rat) / 151763803) [(1, 1), (8, 1), (13, 3), (16, 1)],
  term ((9553548480 : Rat) / 151763803) [(1, 1), (8, 2), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1104 for generator 18. -/
theorem ep_Q2_041_partial_18_1104_valid :
    mulPoly ep_Q2_041_coefficient_18_1104
        ep_Q2_041_generator_18_1100_1199 =
      ep_Q2_041_partial_18_1104 := by
  native_decide

/-- Coefficient term 1105 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1105 : Poly :=
[
  term ((933924829044415307378838360469393158278907638149213397193600 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (13, 4), (14, 1), (15, 1)]
]

/-- Partial product 1105 for generator 18. -/
def ep_Q2_041_partial_18_1105 : Poly :=
[
  term ((-933924829044415307378838360469393158278907638149213397193600 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (13, 4), (14, 1), (15, 1)],
  term ((1867849658088830614757676720938786316557815276298426794387200 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 2), (13, 4), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1105 for generator 18. -/
theorem ep_Q2_041_partial_18_1105_valid :
    mulPoly ep_Q2_041_coefficient_18_1105
        ep_Q2_041_generator_18_1100_1199 =
      ep_Q2_041_partial_18_1105 := by
  native_decide

/-- Coefficient term 1106 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1106 : Poly :=
[
  term ((-31335635711358671497579444989433586231726506280006502142680 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (8, 1), (13, 4), (15, 1)]
]

/-- Partial product 1106 for generator 18. -/
def ep_Q2_041_partial_18_1106 : Poly :=
[
  term ((31335635711358671497579444989433586231726506280006502142680 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (8, 1), (13, 4), (15, 1)],
  term ((-62671271422717342995158889978867172463453012560013004285360 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (8, 2), (13, 4), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1106 for generator 18. -/
theorem ep_Q2_041_partial_18_1106_valid :
    mulPoly ep_Q2_041_coefficient_18_1106
        ep_Q2_041_generator_18_1100_1199 =
      ep_Q2_041_partial_18_1106 := by
  native_decide

/-- Coefficient term 1107 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1107 : Poly :=
[
  term ((1020653184882203832451 : Rat) / 1554011670730805706) [(1, 1), (8, 1), (14, 1), (15, 1)]
]

/-- Partial product 1107 for generator 18. -/
def ep_Q2_041_partial_18_1107 : Poly :=
[
  term ((-1020653184882203832451 : Rat) / 1554011670730805706) [(1, 1), (8, 1), (14, 1), (15, 1)],
  term ((1020653184882203832451 : Rat) / 777005835365402853) [(1, 1), (8, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1107 for generator 18. -/
theorem ep_Q2_041_partial_18_1107_valid :
    mulPoly ep_Q2_041_coefficient_18_1107
        ep_Q2_041_generator_18_1100_1199 =
      ep_Q2_041_partial_18_1107 := by
  native_decide

/-- Coefficient term 1108 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1108 : Poly :=
[
  term ((12088160975 : Rat) / 151763803) [(1, 1), (8, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1108 for generator 18. -/
def ep_Q2_041_partial_18_1108 : Poly :=
[
  term ((-12088160975 : Rat) / 151763803) [(1, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((24176321950 : Rat) / 151763803) [(1, 1), (8, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1108 for generator 18. -/
theorem ep_Q2_041_partial_18_1108_valid :
    mulPoly ep_Q2_041_coefficient_18_1108
        ep_Q2_041_generator_18_1100_1199 =
      ep_Q2_041_partial_18_1108 := by
  native_decide

/-- Coefficient term 1109 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1109 : Poly :=
[
  term ((-8124426726235107295747457781070385711781354334216594642247301184637905 : Rat) / 1768021246369032699354887595084416698163356187370448855844164303273054) [(1, 1), (8, 1), (14, 1), (15, 3)]
]

/-- Partial product 1109 for generator 18. -/
def ep_Q2_041_partial_18_1109 : Poly :=
[
  term ((8124426726235107295747457781070385711781354334216594642247301184637905 : Rat) / 1768021246369032699354887595084416698163356187370448855844164303273054) [(1, 1), (8, 1), (14, 1), (15, 3)],
  term ((-8124426726235107295747457781070385711781354334216594642247301184637905 : Rat) / 884010623184516349677443797542208349081678093685224427922082151636527) [(1, 1), (8, 2), (14, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1109 for generator 18. -/
theorem ep_Q2_041_partial_18_1109_valid :
    mulPoly ep_Q2_041_coefficient_18_1109
        ep_Q2_041_generator_18_1100_1199 =
      ep_Q2_041_partial_18_1109 := by
  native_decide

/-- Coefficient term 1110 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1110 : Poly :=
[
  term ((-28070317670304 : Rat) / 275754830051) [(1, 1), (8, 1), (14, 1), (15, 3), (16, 1)]
]

/-- Partial product 1110 for generator 18. -/
def ep_Q2_041_partial_18_1110 : Poly :=
[
  term ((28070317670304 : Rat) / 275754830051) [(1, 1), (8, 1), (14, 1), (15, 3), (16, 1)],
  term ((-56140635340608 : Rat) / 275754830051) [(1, 1), (8, 2), (14, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1110 for generator 18. -/
theorem ep_Q2_041_partial_18_1110_valid :
    mulPoly ep_Q2_041_coefficient_18_1110
        ep_Q2_041_generator_18_1100_1199 =
      ep_Q2_041_partial_18_1110 := by
  native_decide

/-- Coefficient term 1111 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1111 : Poly :=
[
  term ((15315890480686479743 : Rat) / 777005835365402853) [(1, 1), (8, 1), (14, 2), (15, 1)]
]

/-- Partial product 1111 for generator 18. -/
def ep_Q2_041_partial_18_1111 : Poly :=
[
  term ((-15315890480686479743 : Rat) / 777005835365402853) [(1, 1), (8, 1), (14, 2), (15, 1)],
  term ((30631780961372959486 : Rat) / 777005835365402853) [(1, 1), (8, 2), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1111 for generator 18. -/
theorem ep_Q2_041_partial_18_1111_valid :
    mulPoly ep_Q2_041_coefficient_18_1111
        ep_Q2_041_generator_18_1100_1199 =
      ep_Q2_041_partial_18_1111 := by
  native_decide

/-- Coefficient term 1112 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1112 : Poly :=
[
  term ((1558887598 : Rat) / 151763803) [(1, 1), (8, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 1112 for generator 18. -/
def ep_Q2_041_partial_18_1112 : Poly :=
[
  term ((-1558887598 : Rat) / 151763803) [(1, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((3117775196 : Rat) / 151763803) [(1, 1), (8, 2), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1112 for generator 18. -/
theorem ep_Q2_041_partial_18_1112_valid :
    mulPoly ep_Q2_041_coefficient_18_1112
        ep_Q2_041_generator_18_1100_1199 =
      ep_Q2_041_partial_18_1112 := by
  native_decide

/-- Coefficient term 1113 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1113 : Poly :=
[
  term ((-387290158069589283455 : Rat) / 1554011670730805706) [(1, 1), (8, 1), (15, 1)]
]

/-- Partial product 1113 for generator 18. -/
def ep_Q2_041_partial_18_1113 : Poly :=
[
  term ((387290158069589283455 : Rat) / 1554011670730805706) [(1, 1), (8, 1), (15, 1)],
  term ((-387290158069589283455 : Rat) / 777005835365402853) [(1, 1), (8, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1113 for generator 18. -/
theorem ep_Q2_041_partial_18_1113_valid :
    mulPoly ep_Q2_041_coefficient_18_1113
        ep_Q2_041_generator_18_1100_1199 =
      ep_Q2_041_partial_18_1113 := by
  native_decide

/-- Coefficient term 1114 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1114 : Poly :=
[
  term ((-6953879391 : Rat) / 151763803) [(1, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 1114 for generator 18. -/
def ep_Q2_041_partial_18_1114 : Poly :=
[
  term ((6953879391 : Rat) / 151763803) [(1, 1), (8, 1), (15, 1), (16, 1)],
  term ((-13907758782 : Rat) / 151763803) [(1, 1), (8, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1114 for generator 18. -/
theorem ep_Q2_041_partial_18_1114_valid :
    mulPoly ep_Q2_041_coefficient_18_1114
        ep_Q2_041_generator_18_1100_1199 =
      ep_Q2_041_partial_18_1114 := by
  native_decide

/-- Coefficient term 1115 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1115 : Poly :=
[
  term ((-1613176194980541548812486443689241334931813221102754244091262491188225569 : Rat) / 24752297449166457790968426331181833774286986623186283981818300245822756) [(1, 1), (8, 1), (15, 3)]
]

/-- Partial product 1115 for generator 18. -/
def ep_Q2_041_partial_18_1115 : Poly :=
[
  term ((1613176194980541548812486443689241334931813221102754244091262491188225569 : Rat) / 24752297449166457790968426331181833774286986623186283981818300245822756) [(1, 1), (8, 1), (15, 3)],
  term ((-1613176194980541548812486443689241334931813221102754244091262491188225569 : Rat) / 12376148724583228895484213165590916887143493311593141990909150122911378) [(1, 1), (8, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1115 for generator 18. -/
theorem ep_Q2_041_partial_18_1115_valid :
    mulPoly ep_Q2_041_coefficient_18_1115
        ep_Q2_041_generator_18_1100_1199 =
      ep_Q2_041_partial_18_1115 := by
  native_decide

/-- Coefficient term 1116 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1116 : Poly :=
[
  term ((-4305278510468 : Rat) / 275754830051) [(1, 1), (8, 1), (15, 3), (16, 1)]
]

/-- Partial product 1116 for generator 18. -/
def ep_Q2_041_partial_18_1116 : Poly :=
[
  term ((4305278510468 : Rat) / 275754830051) [(1, 1), (8, 1), (15, 3), (16, 1)],
  term ((-8610557020936 : Rat) / 275754830051) [(1, 1), (8, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1116 for generator 18. -/
theorem ep_Q2_041_partial_18_1116_valid :
    mulPoly ep_Q2_041_coefficient_18_1116
        ep_Q2_041_generator_18_1100_1199 =
      ep_Q2_041_partial_18_1116 := by
  native_decide

/-- Coefficient term 1117 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1117 : Poly :=
[
  term ((-27779284645264200487 : Rat) / 74000555749085986) [(1, 1), (9, 1), (10, 1)]
]

/-- Partial product 1117 for generator 18. -/
def ep_Q2_041_partial_18_1117 : Poly :=
[
  term ((-27779284645264200487 : Rat) / 37000277874542993) [(1, 1), (8, 1), (9, 1), (10, 1)],
  term ((27779284645264200487 : Rat) / 74000555749085986) [(1, 1), (9, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1117 for generator 18. -/
theorem ep_Q2_041_partial_18_1117_valid :
    mulPoly ep_Q2_041_coefficient_18_1117
        ep_Q2_041_generator_18_1100_1199 =
      ep_Q2_041_partial_18_1117 := by
  native_decide

/-- Coefficient term 1118 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1118 : Poly :=
[
  term ((1392596184373973255487865277044305670481628261627191109496541840 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (9, 1), (10, 1), (11, 1), (12, 1), (13, 1), (15, 2)]
]

/-- Partial product 1118 for generator 18. -/
def ep_Q2_041_partial_18_1118 : Poly :=
[
  term ((2785192368747946510975730554088611340963256523254382218993083680 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (9, 1), (10, 1), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((-1392596184373973255487865277044305670481628261627191109496541840 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (9, 1), (10, 1), (11, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1118 for generator 18. -/
theorem ep_Q2_041_partial_18_1118_valid :
    mulPoly ep_Q2_041_coefficient_18_1118
        ep_Q2_041_generator_18_1100_1199 =
      ep_Q2_041_partial_18_1118 := by
  native_decide

/-- Coefficient term 1119 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1119 : Poly :=
[
  term ((5602353231352808801862689670583915311734492002641676810702560 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (9, 1), (10, 1), (11, 1), (12, 1), (13, 2), (15, 1)]
]

/-- Partial product 1119 for generator 18. -/
def ep_Q2_041_partial_18_1119 : Poly :=
[
  term ((11204706462705617603725379341167830623468984005283353621405120 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (9, 1), (10, 1), (11, 1), (12, 1), (13, 2), (15, 1)],
  term ((-5602353231352808801862689670583915311734492002641676810702560 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (9, 1), (10, 1), (11, 1), (12, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1119 for generator 18. -/
theorem ep_Q2_041_partial_18_1119_valid :
    mulPoly ep_Q2_041_coefficient_18_1119
        ep_Q2_041_generator_18_1100_1199 =
      ep_Q2_041_partial_18_1119 := by
  native_decide

/-- Coefficient term 1120 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1120 : Poly :=
[
  term ((-3018634665283163176046371142343260594390621690987193469871200 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (9, 1), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 1120 for generator 18. -/
def ep_Q2_041_partial_18_1120 : Poly :=
[
  term ((-6037269330566326352092742284686521188781243381974386939742400 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (9, 1), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((3018634665283163176046371142343260594390621690987193469871200 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (9, 1), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1120 for generator 18. -/
theorem ep_Q2_041_partial_18_1120_valid :
    mulPoly ep_Q2_041_coefficient_18_1120
        ep_Q2_041_generator_18_1100_1199 =
      ep_Q2_041_partial_18_1120 := by
  native_decide

/-- Coefficient term 1121 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1121 : Poly :=
[
  term ((313499187588550145727311972416892987387060065187190408542437559276306945 : Rat) / 12376148724583228895484213165590916887143493311593141990909150122911378) [(1, 1), (9, 1), (10, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 1121 for generator 18. -/
def ep_Q2_041_partial_18_1121 : Poly :=
[
  term ((313499187588550145727311972416892987387060065187190408542437559276306945 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (8, 1), (9, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-313499187588550145727311972416892987387060065187190408542437559276306945 : Rat) / 12376148724583228895484213165590916887143493311593141990909150122911378) [(1, 1), (9, 1), (10, 1), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1121 for generator 18. -/
theorem ep_Q2_041_partial_18_1121_valid :
    mulPoly ep_Q2_041_coefficient_18_1121
        ep_Q2_041_generator_18_1100_1199 =
      ep_Q2_041_partial_18_1121 := by
  native_decide

/-- Coefficient term 1122 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1122 : Poly :=
[
  term ((-7265669363232 : Rat) / 275754830051) [(1, 1), (9, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1122 for generator 18. -/
def ep_Q2_041_partial_18_1122 : Poly :=
[
  term ((-14531338726464 : Rat) / 275754830051) [(1, 1), (8, 1), (9, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((7265669363232 : Rat) / 275754830051) [(1, 1), (9, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1122 for generator 18. -/
theorem ep_Q2_041_partial_18_1122_valid :
    mulPoly ep_Q2_041_coefficient_18_1122
        ep_Q2_041_generator_18_1100_1199 =
      ep_Q2_041_partial_18_1122 := by
  native_decide

/-- Coefficient term 1123 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1123 : Poly :=
[
  term ((162794038786342233280564166145196439884251821680580488658583800 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (9, 1), (10, 1), (11, 1), (12, 1), (15, 3)]
]

/-- Partial product 1123 for generator 18. -/
def ep_Q2_041_partial_18_1123 : Poly :=
[
  term ((325588077572684466561128332290392879768503643361160977317167600 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (8, 1), (9, 1), (10, 1), (11, 1), (12, 1), (15, 3)],
  term ((-162794038786342233280564166145196439884251821680580488658583800 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (9, 1), (10, 1), (11, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1123 for generator 18. -/
theorem ep_Q2_041_partial_18_1123_valid :
    mulPoly ep_Q2_041_coefficient_18_1123
        ep_Q2_041_generator_18_1100_1199 =
      ep_Q2_041_partial_18_1123 := by
  native_decide

/-- Coefficient term 1124 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1124 : Poly :=
[
  term ((1627194213394870392743744173327491971634384616751676110710880 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (9, 1), (10, 1), (11, 1), (12, 2), (15, 1)]
]

/-- Partial product 1124 for generator 18. -/
def ep_Q2_041_partial_18_1124 : Poly :=
[
  term ((3254388426789740785487488346654983943268769233503352221421760 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (9, 1), (10, 1), (11, 1), (12, 2), (15, 1)],
  term ((-1627194213394870392743744173327491971634384616751676110710880 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (9, 1), (10, 1), (11, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1124 for generator 18. -/
theorem ep_Q2_041_partial_18_1124_valid :
    mulPoly ep_Q2_041_coefficient_18_1124
        ep_Q2_041_generator_18_1100_1199 =
      ep_Q2_041_partial_18_1124 := by
  native_decide

/-- Coefficient term 1125 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1125 : Poly :=
[
  term ((4750822432137460550 : Rat) / 259001945121800951) [(1, 1), (9, 1), (10, 1), (11, 1), (13, 1)]
]

/-- Partial product 1125 for generator 18. -/
def ep_Q2_041_partial_18_1125 : Poly :=
[
  term ((9501644864274921100 : Rat) / 259001945121800951) [(1, 1), (8, 1), (9, 1), (10, 1), (11, 1), (13, 1)],
  term ((-4750822432137460550 : Rat) / 259001945121800951) [(1, 1), (9, 1), (10, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1125 for generator 18. -/
theorem ep_Q2_041_partial_18_1125_valid :
    mulPoly ep_Q2_041_coefficient_18_1125
        ep_Q2_041_generator_18_1100_1199 =
      ep_Q2_041_partial_18_1125 := by
  native_decide

/-- Coefficient term 1126 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1126 : Poly :=
[
  term ((-20523552906833829576 : Rat) / 259001945121800951) [(1, 1), (9, 1), (10, 1), (11, 1), (13, 1), (14, 1)]
]

/-- Partial product 1126 for generator 18. -/
def ep_Q2_041_partial_18_1126 : Poly :=
[
  term ((-41047105813667659152 : Rat) / 259001945121800951) [(1, 1), (8, 1), (9, 1), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((20523552906833829576 : Rat) / 259001945121800951) [(1, 1), (9, 1), (10, 1), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1126 for generator 18. -/
theorem ep_Q2_041_partial_18_1126_valid :
    mulPoly ep_Q2_041_coefficient_18_1126
        ep_Q2_041_generator_18_1100_1199 =
      ep_Q2_041_partial_18_1126 := by
  native_decide

/-- Coefficient term 1127 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1127 : Poly :=
[
  term ((10450690244585241744067510818540900381968101167284836166019261520 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (9, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 2)]
]

/-- Partial product 1127 for generator 18. -/
def ep_Q2_041_partial_18_1127 : Poly :=
[
  term ((20901380489170483488135021637081800763936202334569672332038523040 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (9, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((-10450690244585241744067510818540900381968101167284836166019261520 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (9, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1127 for generator 18. -/
theorem ep_Q2_041_partial_18_1127_valid :
    mulPoly ep_Q2_041_coefficient_18_1127
        ep_Q2_041_generator_18_1100_1199 =
      ep_Q2_041_partial_18_1127 := by
  native_decide

/-- Coefficient term 1128 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1128 : Poly :=
[
  term ((-1445074560 : Rat) / 151763803) [(1, 1), (9, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1128 for generator 18. -/
def ep_Q2_041_partial_18_1128 : Poly :=
[
  term ((-2890149120 : Rat) / 151763803) [(1, 1), (8, 1), (9, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((1445074560 : Rat) / 151763803) [(1, 1), (9, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1128 for generator 18. -/
theorem ep_Q2_041_partial_18_1128_valid :
    mulPoly ep_Q2_041_coefficient_18_1128
        ep_Q2_041_generator_18_1100_1199 =
      ep_Q2_041_partial_18_1128 := by
  native_decide

/-- Coefficient term 1129 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1129 : Poly :=
[
  term ((-13853769435238050316271908487032551594844023765081320885085629540 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 2)]
]

/-- Partial product 1129 for generator 18. -/
def ep_Q2_041_partial_18_1129 : Poly :=
[
  term ((-27707538870476100632543816974065103189688047530162641770171259080 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 2)],
  term ((13853769435238050316271908487032551594844023765081320885085629540 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1129 for generator 18. -/
theorem ep_Q2_041_partial_18_1129_valid :
    mulPoly ep_Q2_041_coefficient_18_1129
        ep_Q2_041_generator_18_1100_1199 =
      ep_Q2_041_partial_18_1129 := by
  native_decide

/-- Coefficient term 1130 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1130 : Poly :=
[
  term ((334508000 : Rat) / 151763803) [(1, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 1130 for generator 18. -/
def ep_Q2_041_partial_18_1130 : Poly :=
[
  term ((669016000 : Rat) / 151763803) [(1, 1), (8, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-334508000 : Rat) / 151763803) [(1, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1130 for generator 18. -/
theorem ep_Q2_041_partial_18_1130_valid :
    mulPoly ep_Q2_041_coefficient_18_1130
        ep_Q2_041_generator_18_1100_1199 =
      ep_Q2_041_partial_18_1130 := by
  native_decide

/-- Coefficient term 1131 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1131 : Poly :=
[
  term ((-13835777979519408707246092187941939203155442760140966377576320 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (9, 1), (10, 1), (11, 1), (13, 2), (14, 1), (15, 1)]
]

/-- Partial product 1131 for generator 18. -/
def ep_Q2_041_partial_18_1131 : Poly :=
[
  term ((-27671555959038817414492184375883878406310885520281932755152640 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (9, 1), (10, 1), (11, 1), (13, 2), (14, 1), (15, 1)],
  term ((13835777979519408707246092187941939203155442760140966377576320 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (9, 1), (10, 1), (11, 1), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1131 for generator 18. -/
theorem ep_Q2_041_partial_18_1131_valid :
    mulPoly ep_Q2_041_coefficient_18_1131
        ep_Q2_041_generator_18_1100_1199 =
      ep_Q2_041_partial_18_1131 := by
  native_decide

/-- Coefficient term 1132 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1132 : Poly :=
[
  term ((156936797229998397001945251387663285164004428034688679101320 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (9, 1), (10, 1), (11, 1), (13, 2), (15, 1)]
]

/-- Partial product 1132 for generator 18. -/
def ep_Q2_041_partial_18_1132 : Poly :=
[
  term ((313873594459996794003890502775326570328008856069377358202640 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (8, 1), (9, 1), (10, 1), (11, 1), (13, 2), (15, 1)],
  term ((-156936797229998397001945251387663285164004428034688679101320 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (9, 1), (10, 1), (11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1132 for generator 18. -/
theorem ep_Q2_041_partial_18_1132_valid :
    mulPoly ep_Q2_041_coefficient_18_1132
        ep_Q2_041_generator_18_1100_1199 =
      ep_Q2_041_partial_18_1132 := by
  native_decide

/-- Coefficient term 1133 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1133 : Poly :=
[
  term ((6584585359961192311969769008987079802814113226381007316870339082029191465 : Rat) / 24752297449166457790968426331181833774286986623186283981818300245822756) [(1, 1), (9, 1), (10, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 1133 for generator 18. -/
def ep_Q2_041_partial_18_1133 : Poly :=
[
  term ((6584585359961192311969769008987079802814113226381007316870339082029191465 : Rat) / 12376148724583228895484213165590916887143493311593141990909150122911378) [(1, 1), (8, 1), (9, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-6584585359961192311969769008987079802814113226381007316870339082029191465 : Rat) / 24752297449166457790968426331181833774286986623186283981818300245822756) [(1, 1), (9, 1), (10, 1), (11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1133 for generator 18. -/
theorem ep_Q2_041_partial_18_1133_valid :
    mulPoly ep_Q2_041_coefficient_18_1133
        ep_Q2_041_generator_18_1100_1199 =
      ep_Q2_041_partial_18_1133 := by
  native_decide

/-- Coefficient term 1134 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1134 : Poly :=
[
  term ((-34769992886160 : Rat) / 275754830051) [(1, 1), (9, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1134 for generator 18. -/
def ep_Q2_041_partial_18_1134 : Poly :=
[
  term ((-69539985772320 : Rat) / 275754830051) [(1, 1), (8, 1), (9, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((34769992886160 : Rat) / 275754830051) [(1, 1), (9, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1134 for generator 18. -/
theorem ep_Q2_041_partial_18_1134_valid :
    mulPoly ep_Q2_041_coefficient_18_1134
        ep_Q2_041_generator_18_1100_1199 =
      ep_Q2_041_partial_18_1134 := by
  native_decide

/-- Coefficient term 1135 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1135 : Poly :=
[
  term ((105963794350208468501477720019743037285846155508415227362156800 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(1, 1), (9, 1), (10, 1), (11, 1), (14, 1), (15, 3)]
]

/-- Partial product 1135 for generator 18. -/
def ep_Q2_041_partial_18_1135 : Poly :=
[
  term ((211927588700416937002955440039486074571692311016830454724313600 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(1, 1), (8, 1), (9, 1), (10, 1), (11, 1), (14, 1), (15, 3)],
  term ((-105963794350208468501477720019743037285846155508415227362156800 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(1, 1), (9, 1), (10, 1), (11, 1), (14, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1135 for generator 18. -/
theorem ep_Q2_041_partial_18_1135_valid :
    mulPoly ep_Q2_041_coefficient_18_1135
        ep_Q2_041_generator_18_1100_1199 =
      ep_Q2_041_partial_18_1135 := by
  native_decide

/-- Coefficient term 1136 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1136 : Poly :=
[
  term ((-284376770368012844281103309249155775884206584144245351509320 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (9, 1), (10, 1), (11, 1), (14, 2), (15, 1)]
]

/-- Partial product 1136 for generator 18. -/
def ep_Q2_041_partial_18_1136 : Poly :=
[
  term ((-568753540736025688562206618498311551768413168288490703018640 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (9, 1), (10, 1), (11, 1), (14, 2), (15, 1)],
  term ((284376770368012844281103309249155775884206584144245351509320 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (9, 1), (10, 1), (11, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1136 for generator 18. -/
theorem ep_Q2_041_partial_18_1136_valid :
    mulPoly ep_Q2_041_coefficient_18_1136
        ep_Q2_041_generator_18_1100_1199 =
      ep_Q2_041_partial_18_1136 := by
  native_decide

/-- Coefficient term 1137 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1137 : Poly :=
[
  term ((-894728263354175887616311818352871700792566536592300877167781201724279344 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (9, 1), (10, 1), (11, 1), (15, 1)]
]

/-- Partial product 1137 for generator 18. -/
def ep_Q2_041_partial_18_1137 : Poly :=
[
  term ((-1789456526708351775232623636705743401585133073184601754335562403448558688 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (8, 1), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((894728263354175887616311818352871700792566536592300877167781201724279344 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (9, 1), (10, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1137 for generator 18. -/
theorem ep_Q2_041_partial_18_1137_valid :
    mulPoly ep_Q2_041_coefficient_18_1137
        ep_Q2_041_generator_18_1100_1199 =
      ep_Q2_041_partial_18_1137 := by
  native_decide

/-- Coefficient term 1138 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1138 : Poly :=
[
  term ((3657639684080 : Rat) / 275754830051) [(1, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 1138 for generator 18. -/
def ep_Q2_041_partial_18_1138 : Poly :=
[
  term ((7315279368160 : Rat) / 275754830051) [(1, 1), (8, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3657639684080 : Rat) / 275754830051) [(1, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1138 for generator 18. -/
theorem ep_Q2_041_partial_18_1138_valid :
    mulPoly ep_Q2_041_coefficient_18_1138
        ep_Q2_041_generator_18_1100_1199 =
      ep_Q2_041_partial_18_1138 := by
  native_decide

/-- Coefficient term 1139 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1139 : Poly :=
[
  term ((209845211286819568052941029612366594088025980422220069055503720 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(1, 1), (9, 1), (10, 1), (11, 1), (15, 3)]
]

/-- Partial product 1139 for generator 18. -/
def ep_Q2_041_partial_18_1139 : Poly :=
[
  term ((419690422573639136105882059224733188176051960844440138111007440 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(1, 1), (8, 1), (9, 1), (10, 1), (11, 1), (15, 3)],
  term ((-209845211286819568052941029612366594088025980422220069055503720 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(1, 1), (9, 1), (10, 1), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1139 for generator 18. -/
theorem ep_Q2_041_partial_18_1139_valid :
    mulPoly ep_Q2_041_coefficient_18_1139
        ep_Q2_041_generator_18_1100_1199 =
      ep_Q2_041_partial_18_1139 := by
  native_decide

/-- Coefficient term 1140 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1140 : Poly :=
[
  term ((130396324635349441390754255125646626119491426161960292454951400 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (9, 1), (10, 1), (11, 2), (12, 1), (15, 2)]
]

/-- Partial product 1140 for generator 18. -/
def ep_Q2_041_partial_18_1140 : Poly :=
[
  term ((260792649270698882781508510251293252238982852323920584909902800 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (8, 1), (9, 1), (10, 1), (11, 2), (12, 1), (15, 2)],
  term ((-130396324635349441390754255125646626119491426161960292454951400 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (9, 1), (10, 1), (11, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1140 for generator 18. -/
theorem ep_Q2_041_partial_18_1140_valid :
    mulPoly ep_Q2_041_coefficient_18_1140
        ep_Q2_041_generator_18_1100_1199 =
      ep_Q2_041_partial_18_1140 := by
  native_decide

/-- Coefficient term 1141 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1141 : Poly :=
[
  term ((-589721392773979873880283123219359506498367579225439664284480 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (9, 1), (10, 1), (11, 2), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 1141 for generator 18. -/
def ep_Q2_041_partial_18_1141 : Poly :=
[
  term ((-1179442785547959747760566246438719012996735158450879328568960 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (9, 1), (10, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((589721392773979873880283123219359506498367579225439664284480 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (9, 1), (10, 1), (11, 2), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1141 for generator 18. -/
theorem ep_Q2_041_partial_18_1141_valid :
    mulPoly ep_Q2_041_coefficient_18_1141
        ep_Q2_041_generator_18_1100_1199 =
      ep_Q2_041_partial_18_1141 := by
  native_decide

/-- Coefficient term 1142 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1142 : Poly :=
[
  term ((136509581660643489324139611856333219096844347042925848214000 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (9, 1), (10, 1), (11, 2), (13, 1), (15, 1)]
]

/-- Partial product 1142 for generator 18. -/
def ep_Q2_041_partial_18_1142 : Poly :=
[
  term ((273019163321286978648279223712666438193688694085851696428000 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (9, 1), (10, 1), (11, 2), (13, 1), (15, 1)],
  term ((-136509581660643489324139611856333219096844347042925848214000 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (9, 1), (10, 1), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1142 for generator 18. -/
theorem ep_Q2_041_partial_18_1142_valid :
    mulPoly ep_Q2_041_coefficient_18_1142
        ep_Q2_041_generator_18_1100_1199 =
      ep_Q2_041_partial_18_1142 := by
  native_decide

/-- Coefficient term 1143 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1143 : Poly :=
[
  term ((624013983198334921137291725369643857665170877772318558093444500 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (9, 1), (10, 1), (11, 2), (14, 1), (15, 2)]
]

/-- Partial product 1143 for generator 18. -/
def ep_Q2_041_partial_18_1143 : Poly :=
[
  term ((1248027966396669842274583450739287715330341755544637116186889000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (8, 1), (9, 1), (10, 1), (11, 2), (14, 1), (15, 2)],
  term ((-624013983198334921137291725369643857665170877772318558093444500 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (9, 1), (10, 1), (11, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1143 for generator 18. -/
theorem ep_Q2_041_partial_18_1143_valid :
    mulPoly ep_Q2_041_coefficient_18_1143
        ep_Q2_041_generator_18_1100_1199 =
      ep_Q2_041_partial_18_1143 := by
  native_decide

/-- Coefficient term 1144 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1144 : Poly :=
[
  term ((-133676261920204998742149039273158358008878312933385009662628640 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (9, 1), (10, 1), (11, 2), (15, 2)]
]

/-- Partial product 1144 for generator 18. -/
def ep_Q2_041_partial_18_1144 : Poly :=
[
  term ((-267352523840409997484298078546316716017756625866770019325257280 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (8, 1), (9, 1), (10, 1), (11, 2), (15, 2)],
  term ((133676261920204998742149039273158358008878312933385009662628640 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (9, 1), (10, 1), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1144 for generator 18. -/
theorem ep_Q2_041_partial_18_1144_valid :
    mulPoly ep_Q2_041_coefficient_18_1144
        ep_Q2_041_generator_18_1100_1199 =
      ep_Q2_041_partial_18_1144 := by
  native_decide

/-- Coefficient term 1145 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1145 : Poly :=
[
  term ((4303138586394816740 : Rat) / 37000277874542993) [(1, 1), (9, 1), (10, 1), (12, 1)]
]

/-- Partial product 1145 for generator 18. -/
def ep_Q2_041_partial_18_1145 : Poly :=
[
  term ((8606277172789633480 : Rat) / 37000277874542993) [(1, 1), (8, 1), (9, 1), (10, 1), (12, 1)],
  term ((-4303138586394816740 : Rat) / 37000277874542993) [(1, 1), (9, 1), (10, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1145 for generator 18. -/
theorem ep_Q2_041_partial_18_1145_valid :
    mulPoly ep_Q2_041_coefficient_18_1145
        ep_Q2_041_generator_18_1100_1199 =
      ep_Q2_041_partial_18_1145 := by
  native_decide

/-- Coefficient term 1146 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1146 : Poly :=
[
  term ((264899172985886956097947570243176817762212212092034969813280 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (9, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 1146 for generator 18. -/
def ep_Q2_041_partial_18_1146 : Poly :=
[
  term ((529798345971773912195895140486353635524424424184069939626560 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (9, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-264899172985886956097947570243176817762212212092034969813280 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (9, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1146 for generator 18. -/
theorem ep_Q2_041_partial_18_1146_valid :
    mulPoly ep_Q2_041_coefficient_18_1146
        ep_Q2_041_generator_18_1100_1199 =
      ep_Q2_041_partial_18_1146 := by
  native_decide

/-- Coefficient term 1147 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1147 : Poly :=
[
  term ((2388850339823794632109000514130909857068734021317918151642645279105533773 : Rat) / 12376148724583228895484213165590916887143493311593141990909150122911378) [(1, 1), (9, 1), (10, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 1147 for generator 18. -/
def ep_Q2_041_partial_18_1147 : Poly :=
[
  term ((2388850339823794632109000514130909857068734021317918151642645279105533773 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (8, 1), (9, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-2388850339823794632109000514130909857068734021317918151642645279105533773 : Rat) / 12376148724583228895484213165590916887143493311593141990909150122911378) [(1, 1), (9, 1), (10, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1147 for generator 18. -/
theorem ep_Q2_041_partial_18_1147_valid :
    mulPoly ep_Q2_041_coefficient_18_1147
        ep_Q2_041_generator_18_1100_1199 =
      ep_Q2_041_partial_18_1147 := by
  native_decide

/-- Coefficient term 1148 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1148 : Poly :=
[
  term ((9199718713632 : Rat) / 275754830051) [(1, 1), (9, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1148 for generator 18. -/
def ep_Q2_041_partial_18_1148 : Poly :=
[
  term ((18399437427264 : Rat) / 275754830051) [(1, 1), (8, 1), (9, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-9199718713632 : Rat) / 275754830051) [(1, 1), (9, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1148 for generator 18. -/
theorem ep_Q2_041_partial_18_1148_valid :
    mulPoly ep_Q2_041_coefficient_18_1148
        ep_Q2_041_generator_18_1100_1199 =
      ep_Q2_041_partial_18_1148 := by
  native_decide

/-- Coefficient term 1149 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1149 : Poly :=
[
  term ((51357096622871113494640378079006376582597550355331322344017960 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (9, 1), (10, 1), (12, 1), (13, 1), (15, 3)]
]

/-- Partial product 1149 for generator 18. -/
def ep_Q2_041_partial_18_1149 : Poly :=
[
  term ((102714193245742226989280756158012753165195100710662644688035920 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (9, 1), (10, 1), (12, 1), (13, 1), (15, 3)],
  term ((-51357096622871113494640378079006376582597550355331322344017960 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (9, 1), (10, 1), (12, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1149 for generator 18. -/
theorem ep_Q2_041_partial_18_1149_valid :
    mulPoly ep_Q2_041_coefficient_18_1149
        ep_Q2_041_generator_18_1100_1199 =
      ep_Q2_041_partial_18_1149 := by
  native_decide

/-- Coefficient term 1150 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1150 : Poly :=
[
  term ((194973752614921380972 : Rat) / 259001945121800951) [(1, 1), (9, 1), (10, 1), (12, 1), (13, 2)]
]

/-- Partial product 1150 for generator 18. -/
def ep_Q2_041_partial_18_1150 : Poly :=
[
  term ((389947505229842761944 : Rat) / 259001945121800951) [(1, 1), (8, 1), (9, 1), (10, 1), (12, 1), (13, 2)],
  term ((-194973752614921380972 : Rat) / 259001945121800951) [(1, 1), (9, 1), (10, 1), (12, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1150 for generator 18. -/
theorem ep_Q2_041_partial_18_1150_valid :
    mulPoly ep_Q2_041_coefficient_18_1150
        ep_Q2_041_generator_18_1100_1199 =
      ep_Q2_041_partial_18_1150 := by
  native_decide

/-- Coefficient term 1151 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1151 : Poly :=
[
  term ((-304606657626804022680436030707441421435065324772678242035525560 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (9, 1), (10, 1), (12, 1), (13, 2), (15, 2)]
]

/-- Partial product 1151 for generator 18. -/
def ep_Q2_041_partial_18_1151 : Poly :=
[
  term ((-609213315253608045360872061414882842870130649545356484071051120 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (9, 1), (10, 1), (12, 1), (13, 2), (15, 2)],
  term ((304606657626804022680436030707441421435065324772678242035525560 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (9, 1), (10, 1), (12, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1151 for generator 18. -/
theorem ep_Q2_041_partial_18_1151_valid :
    mulPoly ep_Q2_041_coefficient_18_1151
        ep_Q2_041_generator_18_1100_1199 =
      ep_Q2_041_partial_18_1151 := by
  native_decide

/-- Coefficient term 1152 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1152 : Poly :=
[
  term ((13728208320 : Rat) / 151763803) [(1, 1), (9, 1), (10, 1), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 1152 for generator 18. -/
def ep_Q2_041_partial_18_1152 : Poly :=
[
  term ((27456416640 : Rat) / 151763803) [(1, 1), (8, 1), (9, 1), (10, 1), (12, 1), (13, 2), (16, 1)],
  term ((-13728208320 : Rat) / 151763803) [(1, 1), (9, 1), (10, 1), (12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1152 for generator 18. -/
theorem ep_Q2_041_partial_18_1152_valid :
    mulPoly ep_Q2_041_coefficient_18_1152
        ep_Q2_041_generator_18_1100_1199 =
      ep_Q2_041_partial_18_1152 := by
  native_decide

/-- Coefficient term 1153 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1153 : Poly :=
[
  term ((-630399259604980332480715893316840381838262655750719043105680 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (9, 1), (10, 1), (12, 1), (13, 3), (15, 1)]
]

/-- Partial product 1153 for generator 18. -/
def ep_Q2_041_partial_18_1153 : Poly :=
[
  term ((-1260798519209960664961431786633680763676525311501438086211360 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (9, 1), (10, 1), (12, 1), (13, 3), (15, 1)],
  term ((630399259604980332480715893316840381838262655750719043105680 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (9, 1), (10, 1), (12, 1), (13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1153 for generator 18. -/
theorem ep_Q2_041_partial_18_1153_valid :
    mulPoly ep_Q2_041_coefficient_18_1153
        ep_Q2_041_generator_18_1100_1199 =
      ep_Q2_041_partial_18_1153 := by
  native_decide

/-- Coefficient term 1154 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1154 : Poly :=
[
  term ((-140789015189085531384 : Rat) / 259001945121800951) [(1, 1), (9, 1), (10, 1), (12, 1), (14, 1)]
]

/-- Partial product 1154 for generator 18. -/
def ep_Q2_041_partial_18_1154 : Poly :=
[
  term ((-281578030378171062768 : Rat) / 259001945121800951) [(1, 1), (8, 1), (9, 1), (10, 1), (12, 1), (14, 1)],
  term ((140789015189085531384 : Rat) / 259001945121800951) [(1, 1), (9, 1), (10, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1154 for generator 18. -/
theorem ep_Q2_041_partial_18_1154_valid :
    mulPoly ep_Q2_041_coefficient_18_1154
        ep_Q2_041_generator_18_1100_1199 =
      ep_Q2_041_partial_18_1154 := by
  native_decide

/-- Coefficient term 1155 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1155 : Poly :=
[
  term ((-12269198320 : Rat) / 151763803) [(1, 1), (9, 1), (10, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 1155 for generator 18. -/
def ep_Q2_041_partial_18_1155 : Poly :=
[
  term ((-24538396640 : Rat) / 151763803) [(1, 1), (8, 1), (9, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((12269198320 : Rat) / 151763803) [(1, 1), (9, 1), (10, 1), (12, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1155 for generator 18. -/
theorem ep_Q2_041_partial_18_1155_valid :
    mulPoly ep_Q2_041_coefficient_18_1155
        ep_Q2_041_generator_18_1100_1199 =
      ep_Q2_041_partial_18_1155 := by
  native_decide

/-- Coefficient term 1156 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1156 : Poly :=
[
  term ((-9147753424426605534016194954403023074078444791621563441451460455279875 : Rat) / 1768021246369032699354887595084416698163356187370448855844164303273054) [(1, 1), (9, 1), (10, 1), (12, 1), (15, 2)]
]

/-- Partial product 1156 for generator 18. -/
def ep_Q2_041_partial_18_1156 : Poly :=
[
  term ((-9147753424426605534016194954403023074078444791621563441451460455279875 : Rat) / 884010623184516349677443797542208349081678093685224427922082151636527) [(1, 1), (8, 1), (9, 1), (10, 1), (12, 1), (15, 2)],
  term ((9147753424426605534016194954403023074078444791621563441451460455279875 : Rat) / 1768021246369032699354887595084416698163356187370448855844164303273054) [(1, 1), (9, 1), (10, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1156 for generator 18. -/
theorem ep_Q2_041_partial_18_1156_valid :
    mulPoly ep_Q2_041_coefficient_18_1156
        ep_Q2_041_generator_18_1100_1199 =
      ep_Q2_041_partial_18_1156 := by
  native_decide

/-- Coefficient term 1157 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1157 : Poly :=
[
  term ((-9070866555744 : Rat) / 275754830051) [(1, 1), (9, 1), (10, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1157 for generator 18. -/
def ep_Q2_041_partial_18_1157 : Poly :=
[
  term ((-18141733111488 : Rat) / 275754830051) [(1, 1), (8, 1), (9, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((9070866555744 : Rat) / 275754830051) [(1, 1), (9, 1), (10, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1157 for generator 18. -/
theorem ep_Q2_041_partial_18_1157_valid :
    mulPoly ep_Q2_041_coefficient_18_1157
        ep_Q2_041_generator_18_1100_1199 =
      ep_Q2_041_partial_18_1157 := by
  native_decide

/-- Coefficient term 1158 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1158 : Poly :=
[
  term ((3209503736 : Rat) / 151763803) [(1, 1), (9, 1), (10, 1), (12, 1), (16, 1)]
]

/-- Partial product 1158 for generator 18. -/
def ep_Q2_041_partial_18_1158 : Poly :=
[
  term ((6419007472 : Rat) / 151763803) [(1, 1), (8, 1), (9, 1), (10, 1), (12, 1), (16, 1)],
  term ((-3209503736 : Rat) / 151763803) [(1, 1), (9, 1), (10, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1158 for generator 18. -/
theorem ep_Q2_041_partial_18_1158_valid :
    mulPoly ep_Q2_041_coefficient_18_1158
        ep_Q2_041_generator_18_1100_1199 =
      ep_Q2_041_partial_18_1158 := by
  native_decide

/-- Coefficient term 1159 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1159 : Poly :=
[
  term ((56629803391078529756 : Rat) / 259001945121800951) [(1, 1), (9, 1), (10, 1), (12, 2)]
]

/-- Partial product 1159 for generator 18. -/
def ep_Q2_041_partial_18_1159 : Poly :=
[
  term ((113259606782157059512 : Rat) / 259001945121800951) [(1, 1), (8, 1), (9, 1), (10, 1), (12, 2)],
  term ((-56629803391078529756 : Rat) / 259001945121800951) [(1, 1), (9, 1), (10, 1), (12, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1159 for generator 18. -/
theorem ep_Q2_041_partial_18_1159_valid :
    mulPoly ep_Q2_041_coefficient_18_1159
        ep_Q2_041_generator_18_1100_1199 =
      ep_Q2_041_partial_18_1159 := by
  native_decide

/-- Coefficient term 1160 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1160 : Poly :=
[
  term ((-183098420431076158946640678565709974452048997479253679186640 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (9, 1), (10, 1), (12, 2), (13, 1), (15, 1)]
]

/-- Partial product 1160 for generator 18. -/
def ep_Q2_041_partial_18_1160 : Poly :=
[
  term ((-366196840862152317893281357131419948904097994958507358373280 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (9, 1), (10, 1), (12, 2), (13, 1), (15, 1)],
  term ((183098420431076158946640678565709974452048997479253679186640 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (9, 1), (10, 1), (12, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1160 for generator 18. -/
theorem ep_Q2_041_partial_18_1160_valid :
    mulPoly ep_Q2_041_coefficient_18_1160
        ep_Q2_041_generator_18_1100_1199 =
      ep_Q2_041_partial_18_1160 := by
  native_decide

/-- Coefficient term 1161 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1161 : Poly :=
[
  term ((3987335360 : Rat) / 151763803) [(1, 1), (9, 1), (10, 1), (12, 2), (16, 1)]
]

/-- Partial product 1161 for generator 18. -/
def ep_Q2_041_partial_18_1161 : Poly :=
[
  term ((7974670720 : Rat) / 151763803) [(1, 1), (8, 1), (9, 1), (10, 1), (12, 2), (16, 1)],
  term ((-3987335360 : Rat) / 151763803) [(1, 1), (9, 1), (10, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1161 for generator 18. -/
theorem ep_Q2_041_partial_18_1161_valid :
    mulPoly ep_Q2_041_coefficient_18_1161
        ep_Q2_041_generator_18_1100_1199 =
      ep_Q2_041_partial_18_1161 := by
  native_decide

/-- Coefficient term 1162 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1162 : Poly :=
[
  term ((3491197727636813969285573543039763443608002817694559165809857530864297047 : Rat) / 24752297449166457790968426331181833774286986623186283981818300245822756) [(1, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 1162 for generator 18. -/
def ep_Q2_041_partial_18_1162 : Poly :=
[
  term ((3491197727636813969285573543039763443608002817694559165809857530864297047 : Rat) / 12376148724583228895484213165590916887143493311593141990909150122911378) [(1, 1), (8, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-3491197727636813969285573543039763443608002817694559165809857530864297047 : Rat) / 24752297449166457790968426331181833774286986623186283981818300245822756) [(1, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1162 for generator 18. -/
theorem ep_Q2_041_partial_18_1162_valid :
    mulPoly ep_Q2_041_coefficient_18_1162
        ep_Q2_041_generator_18_1100_1199 =
      ep_Q2_041_partial_18_1162 := by
  native_decide

/-- Coefficient term 1163 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1163 : Poly :=
[
  term ((-12463897719920 : Rat) / 275754830051) [(1, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1163 for generator 18. -/
def ep_Q2_041_partial_18_1163 : Poly :=
[
  term ((-24927795439840 : Rat) / 275754830051) [(1, 1), (8, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((12463897719920 : Rat) / 275754830051) [(1, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1163 for generator 18. -/
theorem ep_Q2_041_partial_18_1163_valid :
    mulPoly ep_Q2_041_coefficient_18_1163
        ep_Q2_041_generator_18_1100_1199 =
      ep_Q2_041_partial_18_1163 := by
  native_decide

/-- Coefficient term 1164 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1164 : Poly :=
[
  term ((33428698406530730279084226303212506802526387916829183977634560 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(1, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 3)]
]

/-- Partial product 1164 for generator 18. -/
def ep_Q2_041_partial_18_1164 : Poly :=
[
  term ((66857396813061460558168452606425013605052775833658367955269120 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(1, 1), (8, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 3)],
  term ((-33428698406530730279084226303212506802526387916829183977634560 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(1, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1164 for generator 18. -/
theorem ep_Q2_041_partial_18_1164_valid :
    mulPoly ep_Q2_041_coefficient_18_1164
        ep_Q2_041_generator_18_1100_1199 =
      ep_Q2_041_partial_18_1164 := by
  native_decide

/-- Coefficient term 1165 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1165 : Poly :=
[
  term ((204706239512370084934237541460434925236726067905232470990880 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (9, 1), (10, 1), (13, 1), (14, 2), (15, 1)]
]

/-- Partial product 1165 for generator 18. -/
def ep_Q2_041_partial_18_1165 : Poly :=
[
  term ((409412479024740169868475082920869850473452135810464941981760 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (9, 1), (10, 1), (13, 1), (14, 2), (15, 1)],
  term ((-204706239512370084934237541460434925236726067905232470990880 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (9, 1), (10, 1), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1165 for generator 18. -/
theorem ep_Q2_041_partial_18_1165_valid :
    mulPoly ep_Q2_041_coefficient_18_1165
        ep_Q2_041_generator_18_1100_1199 =
      ep_Q2_041_partial_18_1165 := by
  native_decide

/-- Coefficient term 1166 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1166 : Poly :=
[
  term ((-2617784252870486456038770011849426445169311295346496580895786992033436297 : Rat) / 24752297449166457790968426331181833774286986623186283981818300245822756) [(1, 1), (9, 1), (10, 1), (13, 1), (15, 1)]
]

/-- Partial product 1166 for generator 18. -/
def ep_Q2_041_partial_18_1166 : Poly :=
[
  term ((-2617784252870486456038770011849426445169311295346496580895786992033436297 : Rat) / 12376148724583228895484213165590916887143493311593141990909150122911378) [(1, 1), (8, 1), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((2617784252870486456038770011849426445169311295346496580895786992033436297 : Rat) / 24752297449166457790968426331181833774286986623186283981818300245822756) [(1, 1), (9, 1), (10, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1166 for generator 18. -/
theorem ep_Q2_041_partial_18_1166_valid :
    mulPoly ep_Q2_041_coefficient_18_1166
        ep_Q2_041_generator_18_1100_1199 =
      ep_Q2_041_partial_18_1166 := by
  native_decide

/-- Coefficient term 1167 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1167 : Poly :=
[
  term ((26444715482996 : Rat) / 275754830051) [(1, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1167 for generator 18. -/
def ep_Q2_041_partial_18_1167 : Poly :=
[
  term ((52889430965992 : Rat) / 275754830051) [(1, 1), (8, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-26444715482996 : Rat) / 275754830051) [(1, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1167 for generator 18. -/
theorem ep_Q2_041_partial_18_1167_valid :
    mulPoly ep_Q2_041_coefficient_18_1167
        ep_Q2_041_generator_18_1100_1199 =
      ep_Q2_041_partial_18_1167 := by
  native_decide

/-- Coefficient term 1168 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1168 : Poly :=
[
  term ((-52316377059412165614547651544182628498443041944563837524045560 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (9, 1), (10, 1), (13, 1), (15, 3)]
]

/-- Partial product 1168 for generator 18. -/
def ep_Q2_041_partial_18_1168 : Poly :=
[
  term ((-104632754118824331229095303088365256996886083889127675048091120 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (9, 1), (10, 1), (13, 1), (15, 3)],
  term ((52316377059412165614547651544182628498443041944563837524045560 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (9, 1), (10, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1168 for generator 18. -/
theorem ep_Q2_041_partial_18_1168_valid :
    mulPoly ep_Q2_041_coefficient_18_1168
        ep_Q2_041_generator_18_1100_1199 =
      ep_Q2_041_partial_18_1168 := by
  native_decide

/-- Coefficient term 1169 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1169 : Poly :=
[
  term ((38766711046241678088 : Rat) / 259001945121800951) [(1, 1), (9, 1), (10, 1), (13, 2)]
]

/-- Partial product 1169 for generator 18. -/
def ep_Q2_041_partial_18_1169 : Poly :=
[
  term ((77533422092483356176 : Rat) / 259001945121800951) [(1, 1), (8, 1), (9, 1), (10, 1), (13, 2)],
  term ((-38766711046241678088 : Rat) / 259001945121800951) [(1, 1), (9, 1), (10, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1169 for generator 18. -/
theorem ep_Q2_041_partial_18_1169_valid :
    mulPoly ep_Q2_041_coefficient_18_1169
        ep_Q2_041_generator_18_1100_1199 =
      ep_Q2_041_partial_18_1169 := by
  native_decide

/-- Coefficient term 1170 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1170 : Poly :=
[
  term ((-483823756488878982412 : Rat) / 259001945121800951) [(1, 1), (9, 1), (10, 1), (13, 2), (14, 1)]
]

/-- Partial product 1170 for generator 18. -/
def ep_Q2_041_partial_18_1170 : Poly :=
[
  term ((-967647512977757964824 : Rat) / 259001945121800951) [(1, 1), (8, 1), (9, 1), (10, 1), (13, 2), (14, 1)],
  term ((483823756488878982412 : Rat) / 259001945121800951) [(1, 1), (9, 1), (10, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1170 for generator 18. -/
theorem ep_Q2_041_partial_18_1170_valid :
    mulPoly ep_Q2_041_coefficient_18_1170
        ep_Q2_041_generator_18_1100_1199 =
      ep_Q2_041_partial_18_1170 := by
  native_decide

/-- Coefficient term 1171 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1171 : Poly :=
[
  term ((-179994876088552637773833144033232003312474282571018718784546460 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (9, 1), (10, 1), (13, 2), (14, 1), (15, 2)]
]

/-- Partial product 1171 for generator 18. -/
def ep_Q2_041_partial_18_1171 : Poly :=
[
  term ((-359989752177105275547666288066464006624948565142037437569092920 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (9, 1), (10, 1), (13, 2), (14, 1), (15, 2)],
  term ((179994876088552637773833144033232003312474282571018718784546460 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (9, 1), (10, 1), (13, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1171 for generator 18. -/
theorem ep_Q2_041_partial_18_1171_valid :
    mulPoly ep_Q2_041_coefficient_18_1171
        ep_Q2_041_generator_18_1100_1199 =
      ep_Q2_041_partial_18_1171 := by
  native_decide

/-- Coefficient term 1172 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1172 : Poly :=
[
  term ((-34066294720 : Rat) / 151763803) [(1, 1), (9, 1), (10, 1), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 1172 for generator 18. -/
def ep_Q2_041_partial_18_1172 : Poly :=
[
  term ((-68132589440 : Rat) / 151763803) [(1, 1), (8, 1), (9, 1), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((34066294720 : Rat) / 151763803) [(1, 1), (9, 1), (10, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1172 for generator 18. -/
theorem ep_Q2_041_partial_18_1172_valid :
    mulPoly ep_Q2_041_coefficient_18_1172
        ep_Q2_041_generator_18_1100_1199 =
      ep_Q2_041_partial_18_1172 := by
  native_decide

/-- Coefficient term 1173 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1173 : Poly :=
[
  term ((67583196369042088506668082811719492223729856849750660564769700 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (9, 1), (10, 1), (13, 2), (15, 2)]
]

/-- Partial product 1173 for generator 18. -/
def ep_Q2_041_partial_18_1173 : Poly :=
[
  term ((135166392738084177013336165623438984447459713699501321129539400 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (9, 1), (10, 1), (13, 2), (15, 2)],
  term ((-67583196369042088506668082811719492223729856849750660564769700 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (9, 1), (10, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1173 for generator 18. -/
theorem ep_Q2_041_partial_18_1173_valid :
    mulPoly ep_Q2_041_coefficient_18_1173
        ep_Q2_041_generator_18_1100_1199 =
      ep_Q2_041_partial_18_1173 := by
  native_decide

/-- Coefficient term 1174 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1174 : Poly :=
[
  term ((2729585280 : Rat) / 151763803) [(1, 1), (9, 1), (10, 1), (13, 2), (16, 1)]
]

/-- Partial product 1174 for generator 18. -/
def ep_Q2_041_partial_18_1174 : Poly :=
[
  term ((5459170560 : Rat) / 151763803) [(1, 1), (8, 1), (9, 1), (10, 1), (13, 2), (16, 1)],
  term ((-2729585280 : Rat) / 151763803) [(1, 1), (9, 1), (10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1174 for generator 18. -/
theorem ep_Q2_041_partial_18_1174_valid :
    mulPoly ep_Q2_041_coefficient_18_1174
        ep_Q2_041_generator_18_1100_1199 =
      ep_Q2_041_partial_18_1174 := by
  native_decide

/-- Coefficient term 1175 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1175 : Poly :=
[
  term ((1564324088649395639859554253786233540117170293899932440299280 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (9, 1), (10, 1), (13, 3), (14, 1), (15, 1)]
]

/-- Partial product 1175 for generator 18. -/
def ep_Q2_041_partial_18_1175 : Poly :=
[
  term ((3128648177298791279719108507572467080234340587799864880598560 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (9, 1), (10, 1), (13, 3), (14, 1), (15, 1)],
  term ((-1564324088649395639859554253786233540117170293899932440299280 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (9, 1), (10, 1), (13, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1175 for generator 18. -/
theorem ep_Q2_041_partial_18_1175_valid :
    mulPoly ep_Q2_041_coefficient_18_1175
        ep_Q2_041_generator_18_1100_1199 =
      ep_Q2_041_partial_18_1175 := by
  native_decide

/-- Coefficient term 1176 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1176 : Poly :=
[
  term ((-125342542845434685990317779957734344926906025120026008570720 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (9, 1), (10, 1), (13, 3), (15, 1)]
]

/-- Partial product 1176 for generator 18. -/
def ep_Q2_041_partial_18_1176 : Poly :=
[
  term ((-250685085690869371980635559915468689853812050240052017141440 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (9, 1), (10, 1), (13, 3), (15, 1)],
  term ((125342542845434685990317779957734344926906025120026008570720 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (9, 1), (10, 1), (13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1176 for generator 18. -/
theorem ep_Q2_041_partial_18_1176_valid :
    mulPoly ep_Q2_041_coefficient_18_1176
        ep_Q2_041_generator_18_1100_1199 =
      ep_Q2_041_partial_18_1176 := by
  native_decide

/-- Coefficient term 1177 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1177 : Poly :=
[
  term ((25959683771918163107 : Rat) / 37000277874542993) [(1, 1), (9, 1), (10, 1), (14, 1)]
]

/-- Partial product 1177 for generator 18. -/
def ep_Q2_041_partial_18_1177 : Poly :=
[
  term ((51919367543836326214 : Rat) / 37000277874542993) [(1, 1), (8, 1), (9, 1), (10, 1), (14, 1)],
  term ((-25959683771918163107 : Rat) / 37000277874542993) [(1, 1), (9, 1), (10, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1177 for generator 18. -/
theorem ep_Q2_041_partial_18_1177_valid :
    mulPoly ep_Q2_041_coefficient_18_1177
        ep_Q2_041_generator_18_1100_1199 =
      ep_Q2_041_partial_18_1177 := by
  native_decide

/-- Coefficient term 1178 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1178 : Poly :=
[
  term ((-40265439798590295367088031635908706862812325259848164568404973591886240 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (9, 1), (10, 1), (14, 1), (15, 2)]
]

/-- Partial product 1178 for generator 18. -/
def ep_Q2_041_partial_18_1178 : Poly :=
[
  term ((-80530879597180590734176063271817413725624650519696329136809947183772480 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (8, 1), (9, 1), (10, 1), (14, 1), (15, 2)],
  term ((40265439798590295367088031635908706862812325259848164568404973591886240 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (9, 1), (10, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1178 for generator 18. -/
theorem ep_Q2_041_partial_18_1178_valid :
    mulPoly ep_Q2_041_coefficient_18_1178
        ep_Q2_041_generator_18_1100_1199 =
      ep_Q2_041_partial_18_1178 := by
  native_decide

/-- Coefficient term 1179 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1179 : Poly :=
[
  term ((-41330039589888 : Rat) / 275754830051) [(1, 1), (9, 1), (10, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1179 for generator 18. -/
def ep_Q2_041_partial_18_1179 : Poly :=
[
  term ((-82660079179776 : Rat) / 275754830051) [(1, 1), (8, 1), (9, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((41330039589888 : Rat) / 275754830051) [(1, 1), (9, 1), (10, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1179 for generator 18. -/
theorem ep_Q2_041_partial_18_1179_valid :
    mulPoly ep_Q2_041_coefficient_18_1179
        ep_Q2_041_generator_18_1100_1199 =
      ep_Q2_041_partial_18_1179 := by
  native_decide

/-- Coefficient term 1180 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1180 : Poly :=
[
  term ((5813054774 : Rat) / 151763803) [(1, 1), (9, 1), (10, 1), (14, 1), (16, 1)]
]

/-- Partial product 1180 for generator 18. -/
def ep_Q2_041_partial_18_1180 : Poly :=
[
  term ((11626109548 : Rat) / 151763803) [(1, 1), (8, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((-5813054774 : Rat) / 151763803) [(1, 1), (9, 1), (10, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1180 for generator 18. -/
theorem ep_Q2_041_partial_18_1180_valid :
    mulPoly ep_Q2_041_coefficient_18_1180
        ep_Q2_041_generator_18_1100_1199 =
      ep_Q2_041_partial_18_1180 := by
  native_decide

/-- Coefficient term 1181 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1181 : Poly :=
[
  term ((412385603089025465 : Rat) / 37000277874542993) [(1, 1), (9, 1), (10, 1), (14, 2)]
]

/-- Partial product 1181 for generator 18. -/
def ep_Q2_041_partial_18_1181 : Poly :=
[
  term ((824771206178050930 : Rat) / 37000277874542993) [(1, 1), (8, 1), (9, 1), (10, 1), (14, 2)],
  term ((-412385603089025465 : Rat) / 37000277874542993) [(1, 1), (9, 1), (10, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1181 for generator 18. -/
theorem ep_Q2_041_partial_18_1181_valid :
    mulPoly ep_Q2_041_coefficient_18_1181
        ep_Q2_041_generator_18_1100_1199 =
      ep_Q2_041_partial_18_1181 := by
  native_decide

/-- Coefficient term 1182 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1182 : Poly :=
[
  term ((2837110754 : Rat) / 151763803) [(1, 1), (9, 1), (10, 1), (14, 2), (16, 1)]
]

/-- Partial product 1182 for generator 18. -/
def ep_Q2_041_partial_18_1182 : Poly :=
[
  term ((5674221508 : Rat) / 151763803) [(1, 1), (8, 1), (9, 1), (10, 1), (14, 2), (16, 1)],
  term ((-2837110754 : Rat) / 151763803) [(1, 1), (9, 1), (10, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1182 for generator 18. -/
theorem ep_Q2_041_partial_18_1182_valid :
    mulPoly ep_Q2_041_coefficient_18_1182
        ep_Q2_041_generator_18_1100_1199 =
      ep_Q2_041_partial_18_1182 := by
  native_decide

/-- Coefficient term 1183 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1183 : Poly :=
[
  term ((2549159168501509187866170141980459034757357062809989460193010093933064725 : Rat) / 24752297449166457790968426331181833774286986623186283981818300245822756) [(1, 1), (9, 1), (10, 1), (15, 2)]
]

/-- Partial product 1183 for generator 18. -/
def ep_Q2_041_partial_18_1183 : Poly :=
[
  term ((2549159168501509187866170141980459034757357062809989460193010093933064725 : Rat) / 12376148724583228895484213165590916887143493311593141990909150122911378) [(1, 1), (8, 1), (9, 1), (10, 1), (15, 2)],
  term ((-2549159168501509187866170141980459034757357062809989460193010093933064725 : Rat) / 24752297449166457790968426331181833774286986623186283981818300245822756) [(1, 1), (9, 1), (10, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1183 for generator 18. -/
theorem ep_Q2_041_partial_18_1183_valid :
    mulPoly ep_Q2_041_coefficient_18_1183
        ep_Q2_041_generator_18_1100_1199 =
      ep_Q2_041_partial_18_1183 := by
  native_decide

/-- Coefficient term 1184 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1184 : Poly :=
[
  term ((-72949689305672 : Rat) / 275754830051) [(1, 1), (9, 1), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 1184 for generator 18. -/
def ep_Q2_041_partial_18_1184 : Poly :=
[
  term ((-145899378611344 : Rat) / 275754830051) [(1, 1), (8, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((72949689305672 : Rat) / 275754830051) [(1, 1), (9, 1), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1184 for generator 18. -/
theorem ep_Q2_041_partial_18_1184_valid :
    mulPoly ep_Q2_041_coefficient_18_1184
        ep_Q2_041_generator_18_1100_1199 =
      ep_Q2_041_partial_18_1184 := by
  native_decide

/-- Coefficient term 1185 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1185 : Poly :=
[
  term ((-5788375401 : Rat) / 151763803) [(1, 1), (9, 1), (10, 1), (16, 1)]
]

/-- Partial product 1185 for generator 18. -/
def ep_Q2_041_partial_18_1185 : Poly :=
[
  term ((-11576750802 : Rat) / 151763803) [(1, 1), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((5788375401 : Rat) / 151763803) [(1, 1), (9, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1185 for generator 18. -/
theorem ep_Q2_041_partial_18_1185_valid :
    mulPoly ep_Q2_041_coefficient_18_1185
        ep_Q2_041_generator_18_1100_1199 =
      ep_Q2_041_partial_18_1185 := by
  native_decide

/-- Coefficient term 1186 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1186 : Poly :=
[
  term ((-6985696753566031486 : Rat) / 37000277874542993) [(1, 1), (9, 1), (10, 2)]
]

/-- Partial product 1186 for generator 18. -/
def ep_Q2_041_partial_18_1186 : Poly :=
[
  term ((-13971393507132062972 : Rat) / 37000277874542993) [(1, 1), (8, 1), (9, 1), (10, 2)],
  term ((6985696753566031486 : Rat) / 37000277874542993) [(1, 1), (9, 1), (10, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1186 for generator 18. -/
theorem ep_Q2_041_partial_18_1186_valid :
    mulPoly ep_Q2_041_coefficient_18_1186
        ep_Q2_041_generator_18_1100_1199 =
      ep_Q2_041_partial_18_1186 := by
  native_decide

/-- Coefficient term 1187 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1187 : Poly :=
[
  term ((-28141485490105910864488796107832096938629520911132357368840 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (9, 1), (10, 2), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 1187 for generator 18. -/
def ep_Q2_041_partial_18_1187 : Poly :=
[
  term ((-56282970980211821728977592215664193877259041822264714737680 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (8, 1), (9, 1), (10, 2), (11, 1), (12, 1), (15, 1)],
  term ((28141485490105910864488796107832096938629520911132357368840 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (9, 1), (10, 2), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1187 for generator 18. -/
theorem ep_Q2_041_partial_18_1187_valid :
    mulPoly ep_Q2_041_coefficient_18_1187
        ep_Q2_041_generator_18_1100_1199 =
      ep_Q2_041_partial_18_1187 := by
  native_decide

/-- Coefficient term 1188 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1188 : Poly :=
[
  term ((589721392773979873880283123219359506498367579225439664284480 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (9, 1), (10, 2), (11, 1), (13, 1), (15, 2)]
]

/-- Partial product 1188 for generator 18. -/
def ep_Q2_041_partial_18_1188 : Poly :=
[
  term ((1179442785547959747760566246438719012996735158450879328568960 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (9, 1), (10, 2), (11, 1), (13, 1), (15, 2)],
  term ((-589721392773979873880283123219359506498367579225439664284480 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (9, 1), (10, 2), (11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1188 for generator 18. -/
theorem ep_Q2_041_partial_18_1188_valid :
    mulPoly ep_Q2_041_coefficient_18_1188
        ep_Q2_041_generator_18_1100_1199 =
      ep_Q2_041_partial_18_1188 := by
  native_decide

/-- Coefficient term 1189 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1189 : Poly :=
[
  term ((-110733224240005311322248134089613324090887490483430126861080 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (9, 1), (10, 2), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 1189 for generator 18. -/
def ep_Q2_041_partial_18_1189 : Poly :=
[
  term ((-221466448480010622644496268179226648181774980966860253722160 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (9, 1), (10, 2), (11, 1), (14, 1), (15, 1)],
  term ((110733224240005311322248134089613324090887490483430126861080 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (9, 1), (10, 2), (11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1189 for generator 18. -/
theorem ep_Q2_041_partial_18_1189_valid :
    mulPoly ep_Q2_041_coefficient_18_1189
        ep_Q2_041_generator_18_1100_1199 =
      ep_Q2_041_partial_18_1189 := by
  native_decide

/-- Coefficient term 1190 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1190 : Poly :=
[
  term ((-1078217268802902955200357157544261834138890336542354812905370 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (9, 1), (10, 2), (11, 1), (15, 1)]
]

/-- Partial product 1190 for generator 18. -/
def ep_Q2_041_partial_18_1190 : Poly :=
[
  term ((-2156434537605805910400714315088523668277780673084709625810740 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (9, 1), (10, 2), (11, 1), (15, 1)],
  term ((1078217268802902955200357157544261834138890336542354812905370 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (9, 1), (10, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1190 for generator 18. -/
theorem ep_Q2_041_partial_18_1190_valid :
    mulPoly ep_Q2_041_coefficient_18_1190
        ep_Q2_041_generator_18_1100_1199 =
      ep_Q2_041_partial_18_1190 := by
  native_decide

/-- Coefficient term 1191 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1191 : Poly :=
[
  term ((-643166223055551654464416921386725791769200503852386850876807300 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (9, 1), (10, 2), (11, 1), (15, 3)]
]

/-- Partial product 1191 for generator 18. -/
def ep_Q2_041_partial_18_1191 : Poly :=
[
  term ((-1286332446111103308928833842773451583538401007704773701753614600 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (8, 1), (9, 1), (10, 2), (11, 1), (15, 3)],
  term ((643166223055551654464416921386725791769200503852386850876807300 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (9, 1), (10, 2), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1191 for generator 18. -/
theorem ep_Q2_041_partial_18_1191_valid :
    mulPoly ep_Q2_041_coefficient_18_1191
        ep_Q2_041_generator_18_1100_1199 =
      ep_Q2_041_partial_18_1191 := by
  native_decide

/-- Coefficient term 1192 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1192 : Poly :=
[
  term ((-20836401579622699433 : Rat) / 259001945121800951) [(1, 1), (9, 1), (10, 2), (12, 1)]
]

/-- Partial product 1192 for generator 18. -/
def ep_Q2_041_partial_18_1192 : Poly :=
[
  term ((-41672803159245398866 : Rat) / 259001945121800951) [(1, 1), (8, 1), (9, 1), (10, 2), (12, 1)],
  term ((20836401579622699433 : Rat) / 259001945121800951) [(1, 1), (9, 1), (10, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1192 for generator 18. -/
theorem ep_Q2_041_partial_18_1192_valid :
    mulPoly ep_Q2_041_coefficient_18_1192
        ep_Q2_041_generator_18_1100_1199 =
      ep_Q2_041_partial_18_1192 := by
  native_decide

/-- Coefficient term 1193 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1193 : Poly :=
[
  term ((45599887597959813589266870936863464887364592830676130011280 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (9, 1), (10, 2), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 1193 for generator 18. -/
def ep_Q2_041_partial_18_1193 : Poly :=
[
  term ((91199775195919627178533741873726929774729185661352260022560 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (9, 1), (10, 2), (12, 1), (13, 1), (15, 1)],
  term ((-45599887597959813589266870936863464887364592830676130011280 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (9, 1), (10, 2), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1193 for generator 18. -/
theorem ep_Q2_041_partial_18_1193_valid :
    mulPoly ep_Q2_041_coefficient_18_1193
        ep_Q2_041_generator_18_1100_1199 =
      ep_Q2_041_partial_18_1193 := by
  native_decide

/-- Coefficient term 1194 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1194 : Poly :=
[
  term ((-1305153278 : Rat) / 151763803) [(1, 1), (9, 1), (10, 2), (12, 1), (16, 1)]
]

/-- Partial product 1194 for generator 18. -/
def ep_Q2_041_partial_18_1194 : Poly :=
[
  term ((-2610306556 : Rat) / 151763803) [(1, 1), (8, 1), (9, 1), (10, 2), (12, 1), (16, 1)],
  term ((1305153278 : Rat) / 151763803) [(1, 1), (9, 1), (10, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1194 for generator 18. -/
theorem ep_Q2_041_partial_18_1194_valid :
    mulPoly ep_Q2_041_coefficient_18_1194
        ep_Q2_041_generator_18_1100_1199 =
      ep_Q2_041_partial_18_1194 := by
  native_decide

/-- Coefficient term 1195 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1195 : Poly :=
[
  term ((8884145307687447092982338464602696271401710418533541965640 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (9, 1), (10, 2), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 1195 for generator 18. -/
def ep_Q2_041_partial_18_1195 : Poly :=
[
  term ((17768290615374894185964676929205392542803420837067083931280 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (9, 1), (10, 2), (13, 1), (14, 1), (15, 1)],
  term ((-8884145307687447092982338464602696271401710418533541965640 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (9, 1), (10, 2), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1195 for generator 18. -/
theorem ep_Q2_041_partial_18_1195_valid :
    mulPoly ep_Q2_041_coefficient_18_1195
        ep_Q2_041_generator_18_1100_1199 =
      ep_Q2_041_partial_18_1195 := by
  native_decide

/-- Coefficient term 1196 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1196 : Poly :=
[
  term ((288702271543931233664251974187353540515935349520981033965427444497322 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(1, 1), (9, 1), (10, 2), (13, 1), (15, 1)]
]

/-- Partial product 1196 for generator 18. -/
def ep_Q2_041_partial_18_1196 : Poly :=
[
  term ((577404543087862467328503948374707081031870699041962067930854888994644 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(1, 1), (8, 1), (9, 1), (10, 2), (13, 1), (15, 1)],
  term ((-288702271543931233664251974187353540515935349520981033965427444497322 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(1, 1), (9, 1), (10, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1196 for generator 18. -/
theorem ep_Q2_041_partial_18_1196_valid :
    mulPoly ep_Q2_041_coefficient_18_1196
        ep_Q2_041_generator_18_1100_1199 =
      ep_Q2_041_partial_18_1196 := by
  native_decide

/-- Coefficient term 1197 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1197 : Poly :=
[
  term ((1445074560 : Rat) / 151763803) [(1, 1), (9, 1), (10, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1197 for generator 18. -/
def ep_Q2_041_partial_18_1197 : Poly :=
[
  term ((2890149120 : Rat) / 151763803) [(1, 1), (8, 1), (9, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1445074560 : Rat) / 151763803) [(1, 1), (9, 1), (10, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1197 for generator 18. -/
theorem ep_Q2_041_partial_18_1197_valid :
    mulPoly ep_Q2_041_coefficient_18_1197
        ep_Q2_041_generator_18_1100_1199 =
      ep_Q2_041_partial_18_1197 := by
  native_decide

/-- Coefficient term 1198 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1198 : Poly :=
[
  term ((-202901470522409707052904385412193142007057336794166326566951660 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (9, 1), (10, 2), (13, 1), (15, 3)]
]

/-- Partial product 1198 for generator 18. -/
def ep_Q2_041_partial_18_1198 : Poly :=
[
  term ((-405802941044819414105808770824386284014114673588332653133903320 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (9, 1), (10, 2), (13, 1), (15, 3)],
  term ((202901470522409707052904385412193142007057336794166326566951660 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (9, 1), (10, 2), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1198 for generator 18. -/
theorem ep_Q2_041_partial_18_1198_valid :
    mulPoly ep_Q2_041_coefficient_18_1198
        ep_Q2_041_generator_18_1100_1199 =
      ep_Q2_041_partial_18_1198 := by
  native_decide

/-- Coefficient term 1199 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1199 : Poly :=
[
  term ((-66357816800524245524285883507035829667185542710602004537440 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (9, 1), (10, 2), (13, 2), (15, 2)]
]

/-- Partial product 1199 for generator 18. -/
def ep_Q2_041_partial_18_1199 : Poly :=
[
  term ((-132715633601048491048571767014071659334371085421204009074880 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (9, 1), (10, 2), (13, 2), (15, 2)],
  term ((66357816800524245524285883507035829667185542710602004537440 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (9, 1), (10, 2), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1199 for generator 18. -/
theorem ep_Q2_041_partial_18_1199_valid :
    mulPoly ep_Q2_041_coefficient_18_1199
        ep_Q2_041_generator_18_1100_1199 =
      ep_Q2_041_partial_18_1199 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_041_partials_18_1100_1199 : List Poly :=
[
  ep_Q2_041_partial_18_1100,
  ep_Q2_041_partial_18_1101,
  ep_Q2_041_partial_18_1102,
  ep_Q2_041_partial_18_1103,
  ep_Q2_041_partial_18_1104,
  ep_Q2_041_partial_18_1105,
  ep_Q2_041_partial_18_1106,
  ep_Q2_041_partial_18_1107,
  ep_Q2_041_partial_18_1108,
  ep_Q2_041_partial_18_1109,
  ep_Q2_041_partial_18_1110,
  ep_Q2_041_partial_18_1111,
  ep_Q2_041_partial_18_1112,
  ep_Q2_041_partial_18_1113,
  ep_Q2_041_partial_18_1114,
  ep_Q2_041_partial_18_1115,
  ep_Q2_041_partial_18_1116,
  ep_Q2_041_partial_18_1117,
  ep_Q2_041_partial_18_1118,
  ep_Q2_041_partial_18_1119,
  ep_Q2_041_partial_18_1120,
  ep_Q2_041_partial_18_1121,
  ep_Q2_041_partial_18_1122,
  ep_Q2_041_partial_18_1123,
  ep_Q2_041_partial_18_1124,
  ep_Q2_041_partial_18_1125,
  ep_Q2_041_partial_18_1126,
  ep_Q2_041_partial_18_1127,
  ep_Q2_041_partial_18_1128,
  ep_Q2_041_partial_18_1129,
  ep_Q2_041_partial_18_1130,
  ep_Q2_041_partial_18_1131,
  ep_Q2_041_partial_18_1132,
  ep_Q2_041_partial_18_1133,
  ep_Q2_041_partial_18_1134,
  ep_Q2_041_partial_18_1135,
  ep_Q2_041_partial_18_1136,
  ep_Q2_041_partial_18_1137,
  ep_Q2_041_partial_18_1138,
  ep_Q2_041_partial_18_1139,
  ep_Q2_041_partial_18_1140,
  ep_Q2_041_partial_18_1141,
  ep_Q2_041_partial_18_1142,
  ep_Q2_041_partial_18_1143,
  ep_Q2_041_partial_18_1144,
  ep_Q2_041_partial_18_1145,
  ep_Q2_041_partial_18_1146,
  ep_Q2_041_partial_18_1147,
  ep_Q2_041_partial_18_1148,
  ep_Q2_041_partial_18_1149,
  ep_Q2_041_partial_18_1150,
  ep_Q2_041_partial_18_1151,
  ep_Q2_041_partial_18_1152,
  ep_Q2_041_partial_18_1153,
  ep_Q2_041_partial_18_1154,
  ep_Q2_041_partial_18_1155,
  ep_Q2_041_partial_18_1156,
  ep_Q2_041_partial_18_1157,
  ep_Q2_041_partial_18_1158,
  ep_Q2_041_partial_18_1159,
  ep_Q2_041_partial_18_1160,
  ep_Q2_041_partial_18_1161,
  ep_Q2_041_partial_18_1162,
  ep_Q2_041_partial_18_1163,
  ep_Q2_041_partial_18_1164,
  ep_Q2_041_partial_18_1165,
  ep_Q2_041_partial_18_1166,
  ep_Q2_041_partial_18_1167,
  ep_Q2_041_partial_18_1168,
  ep_Q2_041_partial_18_1169,
  ep_Q2_041_partial_18_1170,
  ep_Q2_041_partial_18_1171,
  ep_Q2_041_partial_18_1172,
  ep_Q2_041_partial_18_1173,
  ep_Q2_041_partial_18_1174,
  ep_Q2_041_partial_18_1175,
  ep_Q2_041_partial_18_1176,
  ep_Q2_041_partial_18_1177,
  ep_Q2_041_partial_18_1178,
  ep_Q2_041_partial_18_1179,
  ep_Q2_041_partial_18_1180,
  ep_Q2_041_partial_18_1181,
  ep_Q2_041_partial_18_1182,
  ep_Q2_041_partial_18_1183,
  ep_Q2_041_partial_18_1184,
  ep_Q2_041_partial_18_1185,
  ep_Q2_041_partial_18_1186,
  ep_Q2_041_partial_18_1187,
  ep_Q2_041_partial_18_1188,
  ep_Q2_041_partial_18_1189,
  ep_Q2_041_partial_18_1190,
  ep_Q2_041_partial_18_1191,
  ep_Q2_041_partial_18_1192,
  ep_Q2_041_partial_18_1193,
  ep_Q2_041_partial_18_1194,
  ep_Q2_041_partial_18_1195,
  ep_Q2_041_partial_18_1196,
  ep_Q2_041_partial_18_1197,
  ep_Q2_041_partial_18_1198,
  ep_Q2_041_partial_18_1199
]

/-- Sum of partial products in this block. -/
def ep_Q2_041_block_18_1100_1199 : Poly :=
[
  term ((-27779284645264200487 : Rat) / 37000277874542993) [(1, 1), (8, 1), (9, 1), (10, 1)],
  term ((2785192368747946510975730554088611340963256523254382218993083680 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (9, 1), (10, 1), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((11204706462705617603725379341167830623468984005283353621405120 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (9, 1), (10, 1), (11, 1), (12, 1), (13, 2), (15, 1)],
  term ((-6037269330566326352092742284686521188781243381974386939742400 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (9, 1), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((313499187588550145727311972416892987387060065187190408542437559276306945 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (8, 1), (9, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-14531338726464 : Rat) / 275754830051) [(1, 1), (8, 1), (9, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((325588077572684466561128332290392879768503643361160977317167600 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (8, 1), (9, 1), (10, 1), (11, 1), (12, 1), (15, 3)],
  term ((3254388426789740785487488346654983943268769233503352221421760 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (9, 1), (10, 1), (11, 1), (12, 2), (15, 1)],
  term ((9501644864274921100 : Rat) / 259001945121800951) [(1, 1), (8, 1), (9, 1), (10, 1), (11, 1), (13, 1)],
  term ((-41047105813667659152 : Rat) / 259001945121800951) [(1, 1), (8, 1), (9, 1), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((20901380489170483488135021637081800763936202334569672332038523040 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (9, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((-2890149120 : Rat) / 151763803) [(1, 1), (8, 1), (9, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-27707538870476100632543816974065103189688047530162641770171259080 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 2)],
  term ((669016000 : Rat) / 151763803) [(1, 1), (8, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-27671555959038817414492184375883878406310885520281932755152640 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (9, 1), (10, 1), (11, 1), (13, 2), (14, 1), (15, 1)],
  term ((313873594459996794003890502775326570328008856069377358202640 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (8, 1), (9, 1), (10, 1), (11, 1), (13, 2), (15, 1)],
  term ((6584585359961192311969769008987079802814113226381007316870339082029191465 : Rat) / 12376148724583228895484213165590916887143493311593141990909150122911378) [(1, 1), (8, 1), (9, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-69539985772320 : Rat) / 275754830051) [(1, 1), (8, 1), (9, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((211927588700416937002955440039486074571692311016830454724313600 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(1, 1), (8, 1), (9, 1), (10, 1), (11, 1), (14, 1), (15, 3)],
  term ((-568753540736025688562206618498311551768413168288490703018640 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (9, 1), (10, 1), (11, 1), (14, 2), (15, 1)],
  term ((-1789456526708351775232623636705743401585133073184601754335562403448558688 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (8, 1), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((7315279368160 : Rat) / 275754830051) [(1, 1), (8, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((419690422573639136105882059224733188176051960844440138111007440 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(1, 1), (8, 1), (9, 1), (10, 1), (11, 1), (15, 3)],
  term ((260792649270698882781508510251293252238982852323920584909902800 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (8, 1), (9, 1), (10, 1), (11, 2), (12, 1), (15, 2)],
  term ((-1179442785547959747760566246438719012996735158450879328568960 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (9, 1), (10, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((273019163321286978648279223712666438193688694085851696428000 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (9, 1), (10, 1), (11, 2), (13, 1), (15, 1)],
  term ((1248027966396669842274583450739287715330341755544637116186889000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (8, 1), (9, 1), (10, 1), (11, 2), (14, 1), (15, 2)],
  term ((-267352523840409997484298078546316716017756625866770019325257280 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (8, 1), (9, 1), (10, 1), (11, 2), (15, 2)],
  term ((8606277172789633480 : Rat) / 37000277874542993) [(1, 1), (8, 1), (9, 1), (10, 1), (12, 1)],
  term ((529798345971773912195895140486353635524424424184069939626560 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (9, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((2388850339823794632109000514130909857068734021317918151642645279105533773 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (8, 1), (9, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((18399437427264 : Rat) / 275754830051) [(1, 1), (8, 1), (9, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((102714193245742226989280756158012753165195100710662644688035920 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (9, 1), (10, 1), (12, 1), (13, 1), (15, 3)],
  term ((389947505229842761944 : Rat) / 259001945121800951) [(1, 1), (8, 1), (9, 1), (10, 1), (12, 1), (13, 2)],
  term ((-609213315253608045360872061414882842870130649545356484071051120 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (9, 1), (10, 1), (12, 1), (13, 2), (15, 2)],
  term ((27456416640 : Rat) / 151763803) [(1, 1), (8, 1), (9, 1), (10, 1), (12, 1), (13, 2), (16, 1)],
  term ((-1260798519209960664961431786633680763676525311501438086211360 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (9, 1), (10, 1), (12, 1), (13, 3), (15, 1)],
  term ((-281578030378171062768 : Rat) / 259001945121800951) [(1, 1), (8, 1), (9, 1), (10, 1), (12, 1), (14, 1)],
  term ((-24538396640 : Rat) / 151763803) [(1, 1), (8, 1), (9, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-9147753424426605534016194954403023074078444791621563441451460455279875 : Rat) / 884010623184516349677443797542208349081678093685224427922082151636527) [(1, 1), (8, 1), (9, 1), (10, 1), (12, 1), (15, 2)],
  term ((-18141733111488 : Rat) / 275754830051) [(1, 1), (8, 1), (9, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((6419007472 : Rat) / 151763803) [(1, 1), (8, 1), (9, 1), (10, 1), (12, 1), (16, 1)],
  term ((113259606782157059512 : Rat) / 259001945121800951) [(1, 1), (8, 1), (9, 1), (10, 1), (12, 2)],
  term ((-366196840862152317893281357131419948904097994958507358373280 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (9, 1), (10, 1), (12, 2), (13, 1), (15, 1)],
  term ((7974670720 : Rat) / 151763803) [(1, 1), (8, 1), (9, 1), (10, 1), (12, 2), (16, 1)],
  term ((3491197727636813969285573543039763443608002817694559165809857530864297047 : Rat) / 12376148724583228895484213165590916887143493311593141990909150122911378) [(1, 1), (8, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-24927795439840 : Rat) / 275754830051) [(1, 1), (8, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((66857396813061460558168452606425013605052775833658367955269120 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(1, 1), (8, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 3)],
  term ((409412479024740169868475082920869850473452135810464941981760 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (9, 1), (10, 1), (13, 1), (14, 2), (15, 1)],
  term ((-2617784252870486456038770011849426445169311295346496580895786992033436297 : Rat) / 12376148724583228895484213165590916887143493311593141990909150122911378) [(1, 1), (8, 1), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((52889430965992 : Rat) / 275754830051) [(1, 1), (8, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-104632754118824331229095303088365256996886083889127675048091120 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (9, 1), (10, 1), (13, 1), (15, 3)],
  term ((77533422092483356176 : Rat) / 259001945121800951) [(1, 1), (8, 1), (9, 1), (10, 1), (13, 2)],
  term ((-967647512977757964824 : Rat) / 259001945121800951) [(1, 1), (8, 1), (9, 1), (10, 1), (13, 2), (14, 1)],
  term ((-359989752177105275547666288066464006624948565142037437569092920 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (9, 1), (10, 1), (13, 2), (14, 1), (15, 2)],
  term ((-68132589440 : Rat) / 151763803) [(1, 1), (8, 1), (9, 1), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((135166392738084177013336165623438984447459713699501321129539400 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (9, 1), (10, 1), (13, 2), (15, 2)],
  term ((5459170560 : Rat) / 151763803) [(1, 1), (8, 1), (9, 1), (10, 1), (13, 2), (16, 1)],
  term ((3128648177298791279719108507572467080234340587799864880598560 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (9, 1), (10, 1), (13, 3), (14, 1), (15, 1)],
  term ((-250685085690869371980635559915468689853812050240052017141440 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (9, 1), (10, 1), (13, 3), (15, 1)],
  term ((51919367543836326214 : Rat) / 37000277874542993) [(1, 1), (8, 1), (9, 1), (10, 1), (14, 1)],
  term ((-80530879597180590734176063271817413725624650519696329136809947183772480 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (8, 1), (9, 1), (10, 1), (14, 1), (15, 2)],
  term ((-82660079179776 : Rat) / 275754830051) [(1, 1), (8, 1), (9, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((11626109548 : Rat) / 151763803) [(1, 1), (8, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((824771206178050930 : Rat) / 37000277874542993) [(1, 1), (8, 1), (9, 1), (10, 1), (14, 2)],
  term ((5674221508 : Rat) / 151763803) [(1, 1), (8, 1), (9, 1), (10, 1), (14, 2), (16, 1)],
  term ((2549159168501509187866170141980459034757357062809989460193010093933064725 : Rat) / 12376148724583228895484213165590916887143493311593141990909150122911378) [(1, 1), (8, 1), (9, 1), (10, 1), (15, 2)],
  term ((-145899378611344 : Rat) / 275754830051) [(1, 1), (8, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((-11576750802 : Rat) / 151763803) [(1, 1), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((-13971393507132062972 : Rat) / 37000277874542993) [(1, 1), (8, 1), (9, 1), (10, 2)],
  term ((-56282970980211821728977592215664193877259041822264714737680 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (8, 1), (9, 1), (10, 2), (11, 1), (12, 1), (15, 1)],
  term ((1179442785547959747760566246438719012996735158450879328568960 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (9, 1), (10, 2), (11, 1), (13, 1), (15, 2)],
  term ((-221466448480010622644496268179226648181774980966860253722160 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (9, 1), (10, 2), (11, 1), (14, 1), (15, 1)],
  term ((-2156434537605805910400714315088523668277780673084709625810740 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (9, 1), (10, 2), (11, 1), (15, 1)],
  term ((-1286332446111103308928833842773451583538401007704773701753614600 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (8, 1), (9, 1), (10, 2), (11, 1), (15, 3)],
  term ((-41672803159245398866 : Rat) / 259001945121800951) [(1, 1), (8, 1), (9, 1), (10, 2), (12, 1)],
  term ((91199775195919627178533741873726929774729185661352260022560 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (9, 1), (10, 2), (12, 1), (13, 1), (15, 1)],
  term ((-2610306556 : Rat) / 151763803) [(1, 1), (8, 1), (9, 1), (10, 2), (12, 1), (16, 1)],
  term ((17768290615374894185964676929205392542803420837067083931280 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (9, 1), (10, 2), (13, 1), (14, 1), (15, 1)],
  term ((577404543087862467328503948374707081031870699041962067930854888994644 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(1, 1), (8, 1), (9, 1), (10, 2), (13, 1), (15, 1)],
  term ((2890149120 : Rat) / 151763803) [(1, 1), (8, 1), (9, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-405802941044819414105808770824386284014114673588332653133903320 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (9, 1), (10, 2), (13, 1), (15, 3)],
  term ((-132715633601048491048571767014071659334371085421204009074880 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (9, 1), (10, 2), (13, 2), (15, 2)],
  term ((288850003873957601440 : Rat) / 259001945121800951) [(1, 1), (8, 1), (13, 3), (14, 1)],
  term ((-971195574405240844817825225567645738834683308963096097391642220 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (13, 3), (14, 1), (15, 2)],
  term ((20338086400 : Rat) / 151763803) [(1, 1), (8, 1), (13, 3), (14, 1), (16, 1)],
  term ((-1654814057236459200468639324301719495730231770333596445434708360 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (13, 3), (15, 2)],
  term ((-4776774240 : Rat) / 151763803) [(1, 1), (8, 1), (13, 3), (16, 1)],
  term ((-933924829044415307378838360469393158278907638149213397193600 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (13, 4), (14, 1), (15, 1)],
  term ((31335635711358671497579444989433586231726506280006502142680 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (8, 1), (13, 4), (15, 1)],
  term ((-1020653184882203832451 : Rat) / 1554011670730805706) [(1, 1), (8, 1), (14, 1), (15, 1)],
  term ((-12088160975 : Rat) / 151763803) [(1, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((8124426726235107295747457781070385711781354334216594642247301184637905 : Rat) / 1768021246369032699354887595084416698163356187370448855844164303273054) [(1, 1), (8, 1), (14, 1), (15, 3)],
  term ((28070317670304 : Rat) / 275754830051) [(1, 1), (8, 1), (14, 1), (15, 3), (16, 1)],
  term ((-15315890480686479743 : Rat) / 777005835365402853) [(1, 1), (8, 1), (14, 2), (15, 1)],
  term ((-1558887598 : Rat) / 151763803) [(1, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((387290158069589283455 : Rat) / 1554011670730805706) [(1, 1), (8, 1), (15, 1)],
  term ((6953879391 : Rat) / 151763803) [(1, 1), (8, 1), (15, 1), (16, 1)],
  term ((1613176194980541548812486443689241334931813221102754244091262491188225569 : Rat) / 24752297449166457790968426331181833774286986623186283981818300245822756) [(1, 1), (8, 1), (15, 3)],
  term ((4305278510468 : Rat) / 275754830051) [(1, 1), (8, 1), (15, 3), (16, 1)],
  term ((-577700007747915202880 : Rat) / 259001945121800951) [(1, 1), (8, 2), (13, 3), (14, 1)],
  term ((1942391148810481689635650451135291477669366617926192194783284440 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 2), (13, 3), (14, 1), (15, 2)],
  term ((-40676172800 : Rat) / 151763803) [(1, 1), (8, 2), (13, 3), (14, 1), (16, 1)],
  term ((3309628114472918400937278648603438991460463540667192890869416720 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 2), (13, 3), (15, 2)],
  term ((9553548480 : Rat) / 151763803) [(1, 1), (8, 2), (13, 3), (16, 1)],
  term ((1867849658088830614757676720938786316557815276298426794387200 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 2), (13, 4), (14, 1), (15, 1)],
  term ((-62671271422717342995158889978867172463453012560013004285360 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (8, 2), (13, 4), (15, 1)],
  term ((1020653184882203832451 : Rat) / 777005835365402853) [(1, 1), (8, 2), (14, 1), (15, 1)],
  term ((24176321950 : Rat) / 151763803) [(1, 1), (8, 2), (14, 1), (15, 1), (16, 1)],
  term ((-8124426726235107295747457781070385711781354334216594642247301184637905 : Rat) / 884010623184516349677443797542208349081678093685224427922082151636527) [(1, 1), (8, 2), (14, 1), (15, 3)],
  term ((-56140635340608 : Rat) / 275754830051) [(1, 1), (8, 2), (14, 1), (15, 3), (16, 1)],
  term ((30631780961372959486 : Rat) / 777005835365402853) [(1, 1), (8, 2), (14, 2), (15, 1)],
  term ((3117775196 : Rat) / 151763803) [(1, 1), (8, 2), (14, 2), (15, 1), (16, 1)],
  term ((-387290158069589283455 : Rat) / 777005835365402853) [(1, 1), (8, 2), (15, 1)],
  term ((-13907758782 : Rat) / 151763803) [(1, 1), (8, 2), (15, 1), (16, 1)],
  term ((-1613176194980541548812486443689241334931813221102754244091262491188225569 : Rat) / 12376148724583228895484213165590916887143493311593141990909150122911378) [(1, 1), (8, 2), (15, 3)],
  term ((-8610557020936 : Rat) / 275754830051) [(1, 1), (8, 2), (15, 3), (16, 1)],
  term ((27779284645264200487 : Rat) / 74000555749085986) [(1, 1), (9, 1), (10, 1)],
  term ((-1392596184373973255487865277044305670481628261627191109496541840 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (9, 1), (10, 1), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((-5602353231352808801862689670583915311734492002641676810702560 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (9, 1), (10, 1), (11, 1), (12, 1), (13, 2), (15, 1)],
  term ((3018634665283163176046371142343260594390621690987193469871200 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (9, 1), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-313499187588550145727311972416892987387060065187190408542437559276306945 : Rat) / 12376148724583228895484213165590916887143493311593141990909150122911378) [(1, 1), (9, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((7265669363232 : Rat) / 275754830051) [(1, 1), (9, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-162794038786342233280564166145196439884251821680580488658583800 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (9, 1), (10, 1), (11, 1), (12, 1), (15, 3)],
  term ((-1627194213394870392743744173327491971634384616751676110710880 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (9, 1), (10, 1), (11, 1), (12, 2), (15, 1)],
  term ((-4750822432137460550 : Rat) / 259001945121800951) [(1, 1), (9, 1), (10, 1), (11, 1), (13, 1)],
  term ((20523552906833829576 : Rat) / 259001945121800951) [(1, 1), (9, 1), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((-10450690244585241744067510818540900381968101167284836166019261520 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (9, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((1445074560 : Rat) / 151763803) [(1, 1), (9, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((13853769435238050316271908487032551594844023765081320885085629540 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 2)],
  term ((-334508000 : Rat) / 151763803) [(1, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((13835777979519408707246092187941939203155442760140966377576320 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (9, 1), (10, 1), (11, 1), (13, 2), (14, 1), (15, 1)],
  term ((-156936797229998397001945251387663285164004428034688679101320 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (9, 1), (10, 1), (11, 1), (13, 2), (15, 1)],
  term ((-6584585359961192311969769008987079802814113226381007316870339082029191465 : Rat) / 24752297449166457790968426331181833774286986623186283981818300245822756) [(1, 1), (9, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((34769992886160 : Rat) / 275754830051) [(1, 1), (9, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-105963794350208468501477720019743037285846155508415227362156800 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(1, 1), (9, 1), (10, 1), (11, 1), (14, 1), (15, 3)],
  term ((284376770368012844281103309249155775884206584144245351509320 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (9, 1), (10, 1), (11, 1), (14, 2), (15, 1)],
  term ((894728263354175887616311818352871700792566536592300877167781201724279344 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((-3657639684080 : Rat) / 275754830051) [(1, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-209845211286819568052941029612366594088025980422220069055503720 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(1, 1), (9, 1), (10, 1), (11, 1), (15, 3)],
  term ((-130396324635349441390754255125646626119491426161960292454951400 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (9, 1), (10, 1), (11, 2), (12, 1), (15, 2)],
  term ((589721392773979873880283123219359506498367579225439664284480 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (9, 1), (10, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((-136509581660643489324139611856333219096844347042925848214000 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (9, 1), (10, 1), (11, 2), (13, 1), (15, 1)],
  term ((-624013983198334921137291725369643857665170877772318558093444500 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (9, 1), (10, 1), (11, 2), (14, 1), (15, 2)],
  term ((133676261920204998742149039273158358008878312933385009662628640 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (9, 1), (10, 1), (11, 2), (15, 2)],
  term ((-4303138586394816740 : Rat) / 37000277874542993) [(1, 1), (9, 1), (10, 1), (12, 1)],
  term ((-264899172985886956097947570243176817762212212092034969813280 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (9, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-2388850339823794632109000514130909857068734021317918151642645279105533773 : Rat) / 12376148724583228895484213165590916887143493311593141990909150122911378) [(1, 1), (9, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-9199718713632 : Rat) / 275754830051) [(1, 1), (9, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-51357096622871113494640378079006376582597550355331322344017960 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (9, 1), (10, 1), (12, 1), (13, 1), (15, 3)],
  term ((-194973752614921380972 : Rat) / 259001945121800951) [(1, 1), (9, 1), (10, 1), (12, 1), (13, 2)],
  term ((304606657626804022680436030707441421435065324772678242035525560 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (9, 1), (10, 1), (12, 1), (13, 2), (15, 2)],
  term ((-13728208320 : Rat) / 151763803) [(1, 1), (9, 1), (10, 1), (12, 1), (13, 2), (16, 1)],
  term ((630399259604980332480715893316840381838262655750719043105680 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (9, 1), (10, 1), (12, 1), (13, 3), (15, 1)],
  term ((140789015189085531384 : Rat) / 259001945121800951) [(1, 1), (9, 1), (10, 1), (12, 1), (14, 1)],
  term ((12269198320 : Rat) / 151763803) [(1, 1), (9, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((9147753424426605534016194954403023074078444791621563441451460455279875 : Rat) / 1768021246369032699354887595084416698163356187370448855844164303273054) [(1, 1), (9, 1), (10, 1), (12, 1), (15, 2)],
  term ((9070866555744 : Rat) / 275754830051) [(1, 1), (9, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-3209503736 : Rat) / 151763803) [(1, 1), (9, 1), (10, 1), (12, 1), (16, 1)],
  term ((-56629803391078529756 : Rat) / 259001945121800951) [(1, 1), (9, 1), (10, 1), (12, 2)],
  term ((183098420431076158946640678565709974452048997479253679186640 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (9, 1), (10, 1), (12, 2), (13, 1), (15, 1)],
  term ((-3987335360 : Rat) / 151763803) [(1, 1), (9, 1), (10, 1), (12, 2), (16, 1)],
  term ((-3491197727636813969285573543039763443608002817694559165809857530864297047 : Rat) / 24752297449166457790968426331181833774286986623186283981818300245822756) [(1, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((12463897719920 : Rat) / 275754830051) [(1, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-33428698406530730279084226303212506802526387916829183977634560 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(1, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 3)],
  term ((-204706239512370084934237541460434925236726067905232470990880 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (9, 1), (10, 1), (13, 1), (14, 2), (15, 1)],
  term ((2617784252870486456038770011849426445169311295346496580895786992033436297 : Rat) / 24752297449166457790968426331181833774286986623186283981818300245822756) [(1, 1), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((-26444715482996 : Rat) / 275754830051) [(1, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((52316377059412165614547651544182628498443041944563837524045560 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (9, 1), (10, 1), (13, 1), (15, 3)],
  term ((-38766711046241678088 : Rat) / 259001945121800951) [(1, 1), (9, 1), (10, 1), (13, 2)],
  term ((483823756488878982412 : Rat) / 259001945121800951) [(1, 1), (9, 1), (10, 1), (13, 2), (14, 1)],
  term ((179994876088552637773833144033232003312474282571018718784546460 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (9, 1), (10, 1), (13, 2), (14, 1), (15, 2)],
  term ((34066294720 : Rat) / 151763803) [(1, 1), (9, 1), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((-67583196369042088506668082811719492223729856849750660564769700 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (9, 1), (10, 1), (13, 2), (15, 2)],
  term ((-2729585280 : Rat) / 151763803) [(1, 1), (9, 1), (10, 1), (13, 2), (16, 1)],
  term ((-1564324088649395639859554253786233540117170293899932440299280 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (9, 1), (10, 1), (13, 3), (14, 1), (15, 1)],
  term ((125342542845434685990317779957734344926906025120026008570720 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (9, 1), (10, 1), (13, 3), (15, 1)],
  term ((-25959683771918163107 : Rat) / 37000277874542993) [(1, 1), (9, 1), (10, 1), (14, 1)],
  term ((40265439798590295367088031635908706862812325259848164568404973591886240 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (9, 1), (10, 1), (14, 1), (15, 2)],
  term ((41330039589888 : Rat) / 275754830051) [(1, 1), (9, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-5813054774 : Rat) / 151763803) [(1, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((-412385603089025465 : Rat) / 37000277874542993) [(1, 1), (9, 1), (10, 1), (14, 2)],
  term ((-2837110754 : Rat) / 151763803) [(1, 1), (9, 1), (10, 1), (14, 2), (16, 1)],
  term ((-2549159168501509187866170141980459034757357062809989460193010093933064725 : Rat) / 24752297449166457790968426331181833774286986623186283981818300245822756) [(1, 1), (9, 1), (10, 1), (15, 2)],
  term ((72949689305672 : Rat) / 275754830051) [(1, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((5788375401 : Rat) / 151763803) [(1, 1), (9, 1), (10, 1), (16, 1)],
  term ((6985696753566031486 : Rat) / 37000277874542993) [(1, 1), (9, 1), (10, 2)],
  term ((28141485490105910864488796107832096938629520911132357368840 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (9, 1), (10, 2), (11, 1), (12, 1), (15, 1)],
  term ((-589721392773979873880283123219359506498367579225439664284480 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (9, 1), (10, 2), (11, 1), (13, 1), (15, 2)],
  term ((110733224240005311322248134089613324090887490483430126861080 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (9, 1), (10, 2), (11, 1), (14, 1), (15, 1)],
  term ((1078217268802902955200357157544261834138890336542354812905370 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (9, 1), (10, 2), (11, 1), (15, 1)],
  term ((643166223055551654464416921386725791769200503852386850876807300 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (9, 1), (10, 2), (11, 1), (15, 3)],
  term ((20836401579622699433 : Rat) / 259001945121800951) [(1, 1), (9, 1), (10, 2), (12, 1)],
  term ((-45599887597959813589266870936863464887364592830676130011280 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (9, 1), (10, 2), (12, 1), (13, 1), (15, 1)],
  term ((1305153278 : Rat) / 151763803) [(1, 1), (9, 1), (10, 2), (12, 1), (16, 1)],
  term ((-8884145307687447092982338464602696271401710418533541965640 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (9, 1), (10, 2), (13, 1), (14, 1), (15, 1)],
  term ((-288702271543931233664251974187353540515935349520981033965427444497322 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(1, 1), (9, 1), (10, 2), (13, 1), (15, 1)],
  term ((-1445074560 : Rat) / 151763803) [(1, 1), (9, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((202901470522409707052904385412193142007057336794166326566951660 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (9, 1), (10, 2), (13, 1), (15, 3)],
  term ((66357816800524245524285883507035829667185542710602004537440 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (9, 1), (10, 2), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 18, terms 1100 through 1199. -/
theorem ep_Q2_041_block_18_1100_1199_valid :
    checkProductSumEq ep_Q2_041_partials_18_1100_1199
      ep_Q2_041_block_18_1100_1199 = true := by
  native_decide

end EpQ2041TermShards

end Patterns

end EndpointCertificate

end Problem97
