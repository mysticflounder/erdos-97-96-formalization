/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_024, term block 3:0-99

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_024`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2024TermShards

/-- Generator polynomial 3 for endpoint certificate `ep_Q2_024`. -/
def ep_Q2_024_generator_03_0000_0099 : Poly :=
[
  term (1 : Rat) [(2, 2)],
  term (1 : Rat) [(3, 2)],
  term (-1 : Rat) [(8, 2)],
  term (-1 : Rat) [(9, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0000 : Poly :=
[
  term ((-4813427164942288903845205437181808436889 : Rat) / 7198256744414863779400161168177235607940) []
]

/-- Partial product 0 for generator 3. -/
def ep_Q2_024_partial_03_0000 : Poly :=
[
  term ((-4813427164942288903845205437181808436889 : Rat) / 7198256744414863779400161168177235607940) [(2, 2)],
  term ((-4813427164942288903845205437181808436889 : Rat) / 7198256744414863779400161168177235607940) [(3, 2)],
  term ((4813427164942288903845205437181808436889 : Rat) / 7198256744414863779400161168177235607940) [(8, 2)],
  term ((4813427164942288903845205437181808436889 : Rat) / 7198256744414863779400161168177235607940) [(9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 3. -/
theorem ep_Q2_024_partial_03_0000_valid :
    mulPoly ep_Q2_024_coefficient_03_0000
        ep_Q2_024_generator_03_0000_0099 =
      ep_Q2_024_partial_03_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0001 : Poly :=
[
  term ((620018877790052386773331331077332292259 : Rat) / 239941891480495459313338705605907853598) [(0, 1)]
]

/-- Partial product 1 for generator 3. -/
def ep_Q2_024_partial_03_0001 : Poly :=
[
  term ((620018877790052386773331331077332292259 : Rat) / 239941891480495459313338705605907853598) [(0, 1), (2, 2)],
  term ((620018877790052386773331331077332292259 : Rat) / 239941891480495459313338705605907853598) [(0, 1), (3, 2)],
  term ((-620018877790052386773331331077332292259 : Rat) / 239941891480495459313338705605907853598) [(0, 1), (8, 2)],
  term ((-620018877790052386773331331077332292259 : Rat) / 239941891480495459313338705605907853598) [(0, 1), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 3. -/
theorem ep_Q2_024_partial_03_0001_valid :
    mulPoly ep_Q2_024_coefficient_03_0001
        ep_Q2_024_generator_03_0000_0099 =
      ep_Q2_024_partial_03_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0002 : Poly :=
[
  term ((46980075371086795400555730758678670048 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (1, 1), (9, 1)]
]

/-- Partial product 2 for generator 3. -/
def ep_Q2_024_partial_03_0002 : Poly :=
[
  term ((46980075371086795400555730758678670048 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (1, 1), (2, 2), (9, 1)],
  term ((46980075371086795400555730758678670048 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (1, 1), (3, 2), (9, 1)],
  term ((-46980075371086795400555730758678670048 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (1, 1), (8, 2), (9, 1)],
  term ((-46980075371086795400555730758678670048 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (1, 1), (9, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 3. -/
theorem ep_Q2_024_partial_03_0002_valid :
    mulPoly ep_Q2_024_coefficient_03_0002
        ep_Q2_024_generator_03_0000_0099 =
      ep_Q2_024_partial_03_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0003 : Poly :=
[
  term ((-24897008634067285794795130322114482756 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (1, 1), (12, 1), (13, 1)]
]

/-- Partial product 3 for generator 3. -/
def ep_Q2_024_partial_03_0003 : Poly :=
[
  term ((-24897008634067285794795130322114482756 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (1, 1), (2, 2), (12, 1), (13, 1)],
  term ((-24897008634067285794795130322114482756 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (1, 1), (3, 2), (12, 1), (13, 1)],
  term ((24897008634067285794795130322114482756 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (1, 1), (8, 2), (12, 1), (13, 1)],
  term ((24897008634067285794795130322114482756 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (1, 1), (9, 2), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 3. -/
theorem ep_Q2_024_partial_03_0003_valid :
    mulPoly ep_Q2_024_coefficient_03_0003
        ep_Q2_024_generator_03_0000_0099 =
      ep_Q2_024_partial_03_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0004 : Poly :=
[
  term ((550464729340465184219154740052350989658090880526284951 : Rat) / 185999790426403963700954686167253179493469284649492276) [(0, 1), (1, 1), (12, 1), (15, 1)]
]

/-- Partial product 4 for generator 3. -/
def ep_Q2_024_partial_03_0004 : Poly :=
[
  term ((550464729340465184219154740052350989658090880526284951 : Rat) / 185999790426403963700954686167253179493469284649492276) [(0, 1), (1, 1), (2, 2), (12, 1), (15, 1)],
  term ((550464729340465184219154740052350989658090880526284951 : Rat) / 185999790426403963700954686167253179493469284649492276) [(0, 1), (1, 1), (3, 2), (12, 1), (15, 1)],
  term ((-550464729340465184219154740052350989658090880526284951 : Rat) / 185999790426403963700954686167253179493469284649492276) [(0, 1), (1, 1), (8, 2), (12, 1), (15, 1)],
  term ((-550464729340465184219154740052350989658090880526284951 : Rat) / 185999790426403963700954686167253179493469284649492276) [(0, 1), (1, 1), (9, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 3. -/
theorem ep_Q2_024_partial_03_0004_valid :
    mulPoly ep_Q2_024_coefficient_03_0004
        ep_Q2_024_generator_03_0000_0099 =
      ep_Q2_024_partial_03_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0005 : Poly :=
[
  term ((-651692520789483 : Rat) / 1162780221153193) [(0, 1), (1, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 5 for generator 3. -/
def ep_Q2_024_partial_03_0005 : Poly :=
[
  term ((-651692520789483 : Rat) / 1162780221153193) [(0, 1), (1, 1), (2, 2), (12, 1), (15, 1), (16, 1)],
  term ((-651692520789483 : Rat) / 1162780221153193) [(0, 1), (1, 1), (3, 2), (12, 1), (15, 1), (16, 1)],
  term ((651692520789483 : Rat) / 1162780221153193) [(0, 1), (1, 1), (8, 2), (12, 1), (15, 1), (16, 1)],
  term ((651692520789483 : Rat) / 1162780221153193) [(0, 1), (1, 1), (9, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 3. -/
theorem ep_Q2_024_partial_03_0005_valid :
    mulPoly ep_Q2_024_coefficient_03_0005
        ep_Q2_024_generator_03_0000_0099 =
      ep_Q2_024_partial_03_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0006 : Poly :=
[
  term ((-4843289742300276851037941784721737827428 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (1, 1), (13, 1)]
]

/-- Partial product 6 for generator 3. -/
def ep_Q2_024_partial_03_0006 : Poly :=
[
  term ((-4843289742300276851037941784721737827428 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (1, 1), (2, 2), (13, 1)],
  term ((-4843289742300276851037941784721737827428 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (1, 1), (3, 2), (13, 1)],
  term ((4843289742300276851037941784721737827428 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (1, 1), (8, 2), (13, 1)],
  term ((4843289742300276851037941784721737827428 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (1, 1), (9, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 3. -/
theorem ep_Q2_024_partial_03_0006_valid :
    mulPoly ep_Q2_024_coefficient_03_0006
        ep_Q2_024_generator_03_0000_0099 =
      ep_Q2_024_partial_03_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0007 : Poly :=
[
  term ((-18282938969717093858119746698109491240188813776498753875 : Rat) / 185999790426403963700954686167253179493469284649492276) [(0, 1), (1, 1), (15, 1)]
]

/-- Partial product 7 for generator 3. -/
def ep_Q2_024_partial_03_0007 : Poly :=
[
  term ((-18282938969717093858119746698109491240188813776498753875 : Rat) / 185999790426403963700954686167253179493469284649492276) [(0, 1), (1, 1), (2, 2), (15, 1)],
  term ((-18282938969717093858119746698109491240188813776498753875 : Rat) / 185999790426403963700954686167253179493469284649492276) [(0, 1), (1, 1), (3, 2), (15, 1)],
  term ((18282938969717093858119746698109491240188813776498753875 : Rat) / 185999790426403963700954686167253179493469284649492276) [(0, 1), (1, 1), (8, 2), (15, 1)],
  term ((18282938969717093858119746698109491240188813776498753875 : Rat) / 185999790426403963700954686167253179493469284649492276) [(0, 1), (1, 1), (9, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 3. -/
theorem ep_Q2_024_partial_03_0007_valid :
    mulPoly ep_Q2_024_coefficient_03_0007
        ep_Q2_024_generator_03_0000_0099 =
      ep_Q2_024_partial_03_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0008 : Poly :=
[
  term ((35784441468531505 : Rat) / 3488340663459579) [(0, 1), (1, 1), (15, 1), (16, 1)]
]

/-- Partial product 8 for generator 3. -/
def ep_Q2_024_partial_03_0008 : Poly :=
[
  term ((35784441468531505 : Rat) / 3488340663459579) [(0, 1), (1, 1), (2, 2), (15, 1), (16, 1)],
  term ((35784441468531505 : Rat) / 3488340663459579) [(0, 1), (1, 1), (3, 2), (15, 1), (16, 1)],
  term ((-35784441468531505 : Rat) / 3488340663459579) [(0, 1), (1, 1), (8, 2), (15, 1), (16, 1)],
  term ((-35784441468531505 : Rat) / 3488340663459579) [(0, 1), (1, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 3. -/
theorem ep_Q2_024_partial_03_0008_valid :
    mulPoly ep_Q2_024_coefficient_03_0008
        ep_Q2_024_generator_03_0000_0099 =
      ep_Q2_024_partial_03_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0009 : Poly :=
[
  term ((41276134642755216267924528242976248536 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (3, 1), (9, 1)]
]

/-- Partial product 9 for generator 3. -/
def ep_Q2_024_partial_03_0009 : Poly :=
[
  term ((41276134642755216267924528242976248536 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (2, 2), (3, 1), (9, 1)],
  term ((-41276134642755216267924528242976248536 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (3, 1), (8, 2), (9, 1)],
  term ((-41276134642755216267924528242976248536 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (3, 1), (9, 3)],
  term ((41276134642755216267924528242976248536 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (3, 3), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 3. -/
theorem ep_Q2_024_partial_03_0009_valid :
    mulPoly ep_Q2_024_coefficient_03_0009
        ep_Q2_024_generator_03_0000_0099 =
      ep_Q2_024_partial_03_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0010 : Poly :=
[
  term ((195023789415967152069120310871486602252 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 1), (13, 1)]
]

/-- Partial product 10 for generator 3. -/
def ep_Q2_024_partial_03_0010 : Poly :=
[
  term ((195023789415967152069120310871486602252 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (2, 2), (3, 1), (13, 1)],
  term ((-195023789415967152069120310871486602252 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 1), (8, 2), (13, 1)],
  term ((-195023789415967152069120310871486602252 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 1), (9, 2), (13, 1)],
  term ((195023789415967152069120310871486602252 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 3. -/
theorem ep_Q2_024_partial_03_0010_valid :
    mulPoly ep_Q2_024_coefficient_03_0010
        ep_Q2_024_generator_03_0000_0099 =
      ep_Q2_024_partial_03_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0011 : Poly :=
[
  term ((10669507037097572145932700518880018146640653987630543209 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (3, 1), (15, 1)]
]

/-- Partial product 11 for generator 3. -/
def ep_Q2_024_partial_03_0011 : Poly :=
[
  term ((10669507037097572145932700518880018146640653987630543209 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (2, 2), (3, 1), (15, 1)],
  term ((-10669507037097572145932700518880018146640653987630543209 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (3, 1), (8, 2), (15, 1)],
  term ((-10669507037097572145932700518880018146640653987630543209 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (3, 1), (9, 2), (15, 1)],
  term ((10669507037097572145932700518880018146640653987630543209 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (3, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 3. -/
theorem ep_Q2_024_partial_03_0011_valid :
    mulPoly ep_Q2_024_coefficient_03_0011
        ep_Q2_024_generator_03_0000_0099 =
      ep_Q2_024_partial_03_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0012 : Poly :=
[
  term ((-2323450189880028 : Rat) / 1162780221153193) [(0, 1), (3, 1), (15, 1), (16, 1)]
]

/-- Partial product 12 for generator 3. -/
def ep_Q2_024_partial_03_0012 : Poly :=
[
  term ((-2323450189880028 : Rat) / 1162780221153193) [(0, 1), (2, 2), (3, 1), (15, 1), (16, 1)],
  term ((2323450189880028 : Rat) / 1162780221153193) [(0, 1), (3, 1), (8, 2), (15, 1), (16, 1)],
  term ((2323450189880028 : Rat) / 1162780221153193) [(0, 1), (3, 1), (9, 2), (15, 1), (16, 1)],
  term ((-2323450189880028 : Rat) / 1162780221153193) [(0, 1), (3, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 3. -/
theorem ep_Q2_024_partial_03_0012_valid :
    mulPoly ep_Q2_024_coefficient_03_0012
        ep_Q2_024_generator_03_0000_0099 =
      ep_Q2_024_partial_03_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0013 : Poly :=
[
  term ((11821194576428649664544725351435521876 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (5, 1), (9, 1)]
]

/-- Partial product 13 for generator 3. -/
def ep_Q2_024_partial_03_0013 : Poly :=
[
  term ((11821194576428649664544725351435521876 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (2, 2), (5, 1), (9, 1)],
  term ((11821194576428649664544725351435521876 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 2), (5, 1), (9, 1)],
  term ((-11821194576428649664544725351435521876 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (5, 1), (8, 2), (9, 1)],
  term ((-11821194576428649664544725351435521876 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (5, 1), (9, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 3. -/
theorem ep_Q2_024_partial_03_0013_valid :
    mulPoly ep_Q2_024_coefficient_03_0013
        ep_Q2_024_generator_03_0000_0099 =
      ep_Q2_024_partial_03_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0014 : Poly :=
[
  term ((98847255119133410978597778775627216408 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (5, 1), (13, 1)]
]

/-- Partial product 14 for generator 3. -/
def ep_Q2_024_partial_03_0014 : Poly :=
[
  term ((98847255119133410978597778775627216408 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (2, 2), (5, 1), (13, 1)],
  term ((98847255119133410978597778775627216408 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 2), (5, 1), (13, 1)],
  term ((-98847255119133410978597778775627216408 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (5, 1), (8, 2), (13, 1)],
  term ((-98847255119133410978597778775627216408 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (5, 1), (9, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 3. -/
theorem ep_Q2_024_partial_03_0014_valid :
    mulPoly ep_Q2_024_coefficient_03_0014
        ep_Q2_024_generator_03_0000_0099 =
      ep_Q2_024_partial_03_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0015 : Poly :=
[
  term ((2615038360088410059841054008336388088776754313470805069 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (5, 1), (15, 1)]
]

/-- Partial product 15 for generator 3. -/
def ep_Q2_024_partial_03_0015 : Poly :=
[
  term ((2615038360088410059841054008336388088776754313470805069 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (2, 2), (5, 1), (15, 1)],
  term ((2615038360088410059841054008336388088776754313470805069 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (3, 2), (5, 1), (15, 1)],
  term ((-2615038360088410059841054008336388088776754313470805069 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (5, 1), (8, 2), (15, 1)],
  term ((-2615038360088410059841054008336388088776754313470805069 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (5, 1), (9, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 3. -/
theorem ep_Q2_024_partial_03_0015_valid :
    mulPoly ep_Q2_024_coefficient_03_0015
        ep_Q2_024_generator_03_0000_0099 =
      ep_Q2_024_partial_03_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0016 : Poly :=
[
  term ((-1180830262111028 : Rat) / 1162780221153193) [(0, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 16 for generator 3. -/
def ep_Q2_024_partial_03_0016 : Poly :=
[
  term ((-1180830262111028 : Rat) / 1162780221153193) [(0, 1), (2, 2), (5, 1), (15, 1), (16, 1)],
  term ((-1180830262111028 : Rat) / 1162780221153193) [(0, 1), (3, 2), (5, 1), (15, 1), (16, 1)],
  term ((1180830262111028 : Rat) / 1162780221153193) [(0, 1), (5, 1), (8, 2), (15, 1), (16, 1)],
  term ((1180830262111028 : Rat) / 1162780221153193) [(0, 1), (5, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 3. -/
theorem ep_Q2_024_partial_03_0016_valid :
    mulPoly ep_Q2_024_coefficient_03_0016
        ep_Q2_024_generator_03_0000_0099 =
      ep_Q2_024_partial_03_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0017 : Poly :=
[
  term ((870723073074723173190931317782461097548 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (9, 1)]
]

/-- Partial product 17 for generator 3. -/
def ep_Q2_024_partial_03_0017 : Poly :=
[
  term ((870723073074723173190931317782461097548 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (2, 2), (7, 1), (9, 1)],
  term ((870723073074723173190931317782461097548 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 2), (7, 1), (9, 1)],
  term ((-870723073074723173190931317782461097548 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (8, 2), (9, 1)],
  term ((-870723073074723173190931317782461097548 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (9, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 3. -/
theorem ep_Q2_024_partial_03_0017_valid :
    mulPoly ep_Q2_024_coefficient_03_0017
        ep_Q2_024_generator_03_0000_0099 =
      ep_Q2_024_partial_03_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0018 : Poly :=
[
  term ((49794017268134571589590260644228965512 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (12, 1), (13, 1)]
]

/-- Partial product 18 for generator 3. -/
def ep_Q2_024_partial_03_0018 : Poly :=
[
  term ((49794017268134571589590260644228965512 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (2, 2), (7, 1), (12, 1), (13, 1)],
  term ((49794017268134571589590260644228965512 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 2), (7, 1), (12, 1), (13, 1)],
  term ((-49794017268134571589590260644228965512 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (8, 2), (12, 1), (13, 1)],
  term ((-49794017268134571589590260644228965512 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (9, 2), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 3. -/
theorem ep_Q2_024_partial_03_0018_valid :
    mulPoly ep_Q2_024_coefficient_03_0018
        ep_Q2_024_generator_03_0000_0099 =
      ep_Q2_024_partial_03_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0019 : Poly :=
[
  term ((-183488243113488394739718246684116996552696960175428317 : Rat) / 92999895213201981850477343083626589746734642324746138) [(0, 1), (7, 1), (12, 1), (15, 1)]
]

/-- Partial product 19 for generator 3. -/
def ep_Q2_024_partial_03_0019 : Poly :=
[
  term ((-183488243113488394739718246684116996552696960175428317 : Rat) / 92999895213201981850477343083626589746734642324746138) [(0, 1), (2, 2), (7, 1), (12, 1), (15, 1)],
  term ((-183488243113488394739718246684116996552696960175428317 : Rat) / 92999895213201981850477343083626589746734642324746138) [(0, 1), (3, 2), (7, 1), (12, 1), (15, 1)],
  term ((183488243113488394739718246684116996552696960175428317 : Rat) / 92999895213201981850477343083626589746734642324746138) [(0, 1), (7, 1), (8, 2), (12, 1), (15, 1)],
  term ((183488243113488394739718246684116996552696960175428317 : Rat) / 92999895213201981850477343083626589746734642324746138) [(0, 1), (7, 1), (9, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 3. -/
theorem ep_Q2_024_partial_03_0019_valid :
    mulPoly ep_Q2_024_coefficient_03_0019
        ep_Q2_024_generator_03_0000_0099 =
      ep_Q2_024_partial_03_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0020 : Poly :=
[
  term ((434461680526322 : Rat) / 1162780221153193) [(0, 1), (7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 20 for generator 3. -/
def ep_Q2_024_partial_03_0020 : Poly :=
[
  term ((434461680526322 : Rat) / 1162780221153193) [(0, 1), (2, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((434461680526322 : Rat) / 1162780221153193) [(0, 1), (3, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-434461680526322 : Rat) / 1162780221153193) [(0, 1), (7, 1), (8, 2), (12, 1), (15, 1), (16, 1)],
  term ((-434461680526322 : Rat) / 1162780221153193) [(0, 1), (7, 1), (9, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 3. -/
theorem ep_Q2_024_partial_03_0020_valid :
    mulPoly ep_Q2_024_coefficient_03_0020
        ep_Q2_024_generator_03_0000_0099 =
      ep_Q2_024_partial_03_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0021 : Poly :=
[
  term ((-241994577617827318033166200814862032728 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (13, 1)]
]

/-- Partial product 21 for generator 3. -/
def ep_Q2_024_partial_03_0021 : Poly :=
[
  term ((-241994577617827318033166200814862032728 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (2, 2), (7, 1), (13, 1)],
  term ((-241994577617827318033166200814862032728 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 2), (7, 1), (13, 1)],
  term ((241994577617827318033166200814862032728 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (8, 2), (13, 1)],
  term ((241994577617827318033166200814862032728 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (9, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 3. -/
theorem ep_Q2_024_partial_03_0021_valid :
    mulPoly ep_Q2_024_coefficient_03_0021
        ep_Q2_024_generator_03_0000_0099 =
      ep_Q2_024_partial_03_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0022 : Poly :=
[
  term ((-2134597985326118962685167669289112352375872463958511867 : Rat) / 185999790426403963700954686167253179493469284649492276) [(0, 1), (7, 1), (15, 1)]
]

/-- Partial product 22 for generator 3. -/
def ep_Q2_024_partial_03_0022 : Poly :=
[
  term ((-2134597985326118962685167669289112352375872463958511867 : Rat) / 185999790426403963700954686167253179493469284649492276) [(0, 1), (2, 2), (7, 1), (15, 1)],
  term ((-2134597985326118962685167669289112352375872463958511867 : Rat) / 185999790426403963700954686167253179493469284649492276) [(0, 1), (3, 2), (7, 1), (15, 1)],
  term ((2134597985326118962685167669289112352375872463958511867 : Rat) / 185999790426403963700954686167253179493469284649492276) [(0, 1), (7, 1), (8, 2), (15, 1)],
  term ((2134597985326118962685167669289112352375872463958511867 : Rat) / 185999790426403963700954686167253179493469284649492276) [(0, 1), (7, 1), (9, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 3. -/
theorem ep_Q2_024_partial_03_0022_valid :
    mulPoly ep_Q2_024_coefficient_03_0022
        ep_Q2_024_generator_03_0000_0099 =
      ep_Q2_024_partial_03_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0023 : Poly :=
[
  term ((-4127059404453593 : Rat) / 1162780221153193) [(0, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 23 for generator 3. -/
def ep_Q2_024_partial_03_0023 : Poly :=
[
  term ((-4127059404453593 : Rat) / 1162780221153193) [(0, 1), (2, 2), (7, 1), (15, 1), (16, 1)],
  term ((-4127059404453593 : Rat) / 1162780221153193) [(0, 1), (3, 2), (7, 1), (15, 1), (16, 1)],
  term ((4127059404453593 : Rat) / 1162780221153193) [(0, 1), (7, 1), (8, 2), (15, 1), (16, 1)],
  term ((4127059404453593 : Rat) / 1162780221153193) [(0, 1), (7, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 3. -/
theorem ep_Q2_024_partial_03_0023_valid :
    mulPoly ep_Q2_024_coefficient_03_0023
        ep_Q2_024_generator_03_0000_0099 =
      ep_Q2_024_partial_03_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0024 : Poly :=
[
  term ((1243844609397769429462846732657866526588 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 1), (11, 1)]
]

/-- Partial product 24 for generator 3. -/
def ep_Q2_024_partial_03_0024 : Poly :=
[
  term ((1243844609397769429462846732657866526588 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (2, 2), (9, 1), (11, 1)],
  term ((1243844609397769429462846732657866526588 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 2), (9, 1), (11, 1)],
  term ((-1243844609397769429462846732657866526588 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (8, 2), (9, 1), (11, 1)],
  term ((-1243844609397769429462846732657866526588 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 3. -/
theorem ep_Q2_024_partial_03_0024_valid :
    mulPoly ep_Q2_024_coefficient_03_0024
        ep_Q2_024_generator_03_0000_0099 =
      ep_Q2_024_partial_03_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0025 : Poly :=
[
  term ((-25958341366293579878171789183491304344 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 1), (12, 1), (13, 1)]
]

/-- Partial product 25 for generator 3. -/
def ep_Q2_024_partial_03_0025 : Poly :=
[
  term ((-25958341366293579878171789183491304344 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (2, 2), (9, 1), (12, 1), (13, 1)],
  term ((-25958341366293579878171789183491304344 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 2), (9, 1), (12, 1), (13, 1)],
  term ((25958341366293579878171789183491304344 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (8, 2), (9, 1), (12, 1), (13, 1)],
  term ((25958341366293579878171789183491304344 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 3), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 3. -/
theorem ep_Q2_024_partial_03_0025_valid :
    mulPoly ep_Q2_024_coefficient_03_0025
        ep_Q2_024_generator_03_0000_0099 =
      ep_Q2_024_partial_03_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0026 : Poly :=
[
  term ((519790077507635364246714238454931580267528154182411463 : Rat) / 464999476066009909252386715418132948733673211623730690) [(0, 1), (9, 1), (12, 1), (15, 1)]
]

/-- Partial product 26 for generator 3. -/
def ep_Q2_024_partial_03_0026 : Poly :=
[
  term ((519790077507635364246714238454931580267528154182411463 : Rat) / 464999476066009909252386715418132948733673211623730690) [(0, 1), (2, 2), (9, 1), (12, 1), (15, 1)],
  term ((519790077507635364246714238454931580267528154182411463 : Rat) / 464999476066009909252386715418132948733673211623730690) [(0, 1), (3, 2), (9, 1), (12, 1), (15, 1)],
  term ((-519790077507635364246714238454931580267528154182411463 : Rat) / 464999476066009909252386715418132948733673211623730690) [(0, 1), (8, 2), (9, 1), (12, 1), (15, 1)],
  term ((-519790077507635364246714238454931580267528154182411463 : Rat) / 464999476066009909252386715418132948733673211623730690) [(0, 1), (9, 3), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 3. -/
theorem ep_Q2_024_partial_03_0026_valid :
    mulPoly ep_Q2_024_coefficient_03_0026
        ep_Q2_024_generator_03_0000_0099 =
      ep_Q2_024_partial_03_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0027 : Poly :=
[
  term ((-425478577289470 : Rat) / 1162780221153193) [(0, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 27 for generator 3. -/
def ep_Q2_024_partial_03_0027 : Poly :=
[
  term ((-425478577289470 : Rat) / 1162780221153193) [(0, 1), (2, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-425478577289470 : Rat) / 1162780221153193) [(0, 1), (3, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((425478577289470 : Rat) / 1162780221153193) [(0, 1), (8, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((425478577289470 : Rat) / 1162780221153193) [(0, 1), (9, 3), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 3. -/
theorem ep_Q2_024_partial_03_0027_valid :
    mulPoly ep_Q2_024_coefficient_03_0027
        ep_Q2_024_generator_03_0000_0099 =
      ep_Q2_024_partial_03_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0028 : Poly :=
[
  term ((166041505019859393725937584129177270348 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (9, 1), (13, 1)]
]

/-- Partial product 28 for generator 3. -/
def ep_Q2_024_partial_03_0028 : Poly :=
[
  term ((166041505019859393725937584129177270348 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (2, 2), (9, 1), (13, 1)],
  term ((166041505019859393725937584129177270348 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (3, 2), (9, 1), (13, 1)],
  term ((-166041505019859393725937584129177270348 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (8, 2), (9, 1), (13, 1)],
  term ((-166041505019859393725937584129177270348 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (9, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 3. -/
theorem ep_Q2_024_partial_03_0028_valid :
    mulPoly ep_Q2_024_coefficient_03_0028
        ep_Q2_024_generator_03_0000_0099 =
      ep_Q2_024_partial_03_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0029 : Poly :=
[
  term ((47768935360192191977162658530735750073185056767546939811 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(0, 1), (9, 1), (15, 1)]
]

/-- Partial product 29 for generator 3. -/
def ep_Q2_024_partial_03_0029 : Poly :=
[
  term ((47768935360192191977162658530735750073185056767546939811 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(0, 1), (2, 2), (9, 1), (15, 1)],
  term ((47768935360192191977162658530735750073185056767546939811 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(0, 1), (3, 2), (9, 1), (15, 1)],
  term ((-47768935360192191977162658530735750073185056767546939811 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(0, 1), (8, 2), (9, 1), (15, 1)],
  term ((-47768935360192191977162658530735750073185056767546939811 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(0, 1), (9, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 3. -/
theorem ep_Q2_024_partial_03_0029_valid :
    mulPoly ep_Q2_024_coefficient_03_0029
        ep_Q2_024_generator_03_0000_0099 =
      ep_Q2_024_partial_03_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0030 : Poly :=
[
  term ((-5880976438022102 : Rat) / 1162780221153193) [(0, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 30 for generator 3. -/
def ep_Q2_024_partial_03_0030 : Poly :=
[
  term ((-5880976438022102 : Rat) / 1162780221153193) [(0, 1), (2, 2), (9, 1), (15, 1), (16, 1)],
  term ((-5880976438022102 : Rat) / 1162780221153193) [(0, 1), (3, 2), (9, 1), (15, 1), (16, 1)],
  term ((5880976438022102 : Rat) / 1162780221153193) [(0, 1), (8, 2), (9, 1), (15, 1), (16, 1)],
  term ((5880976438022102 : Rat) / 1162780221153193) [(0, 1), (9, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 3. -/
theorem ep_Q2_024_partial_03_0030_valid :
    mulPoly ep_Q2_024_coefficient_03_0030
        ep_Q2_024_generator_03_0000_0099 =
      ep_Q2_024_partial_03_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0031 : Poly :=
[
  term ((-25822152279561751937747828166818990044 : Rat) / 119970945740247729656669352802953926799) [(0, 1), (9, 2)]
]

/-- Partial product 31 for generator 3. -/
def ep_Q2_024_partial_03_0031 : Poly :=
[
  term ((-25822152279561751937747828166818990044 : Rat) / 119970945740247729656669352802953926799) [(0, 1), (2, 2), (9, 2)],
  term ((-25822152279561751937747828166818990044 : Rat) / 119970945740247729656669352802953926799) [(0, 1), (3, 2), (9, 2)],
  term ((25822152279561751937747828166818990044 : Rat) / 119970945740247729656669352802953926799) [(0, 1), (8, 2), (9, 2)],
  term ((25822152279561751937747828166818990044 : Rat) / 119970945740247729656669352802953926799) [(0, 1), (9, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 3. -/
theorem ep_Q2_024_partial_03_0031_valid :
    mulPoly ep_Q2_024_coefficient_03_0031
        ep_Q2_024_generator_03_0000_0099 =
      ep_Q2_024_partial_03_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0032 : Poly :=
[
  term ((125546375902562723057352310471949235368 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (11, 1), (12, 1), (13, 1)]
]

/-- Partial product 32 for generator 3. -/
def ep_Q2_024_partial_03_0032 : Poly :=
[
  term ((125546375902562723057352310471949235368 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (2, 2), (11, 1), (12, 1), (13, 1)],
  term ((125546375902562723057352310471949235368 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 2), (11, 1), (12, 1), (13, 1)],
  term ((-125546375902562723057352310471949235368 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (8, 2), (11, 1), (12, 1), (13, 1)],
  term ((-125546375902562723057352310471949235368 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 2), (11, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 3. -/
theorem ep_Q2_024_partial_03_0032_valid :
    mulPoly ep_Q2_024_coefficient_03_0032
        ep_Q2_024_generator_03_0000_0099 =
      ep_Q2_024_partial_03_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0033 : Poly :=
[
  term ((-2354672508642519311643896705296101545794497755936694633 : Rat) / 464999476066009909252386715418132948733673211623730690) [(0, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 33 for generator 3. -/
def ep_Q2_024_partial_03_0033 : Poly :=
[
  term ((-2354672508642519311643896705296101545794497755936694633 : Rat) / 464999476066009909252386715418132948733673211623730690) [(0, 1), (2, 2), (11, 1), (12, 1), (15, 1)],
  term ((-2354672508642519311643896705296101545794497755936694633 : Rat) / 464999476066009909252386715418132948733673211623730690) [(0, 1), (3, 2), (11, 1), (12, 1), (15, 1)],
  term ((2354672508642519311643896705296101545794497755936694633 : Rat) / 464999476066009909252386715418132948733673211623730690) [(0, 1), (8, 2), (11, 1), (12, 1), (15, 1)],
  term ((2354672508642519311643896705296101545794497755936694633 : Rat) / 464999476066009909252386715418132948733673211623730690) [(0, 1), (9, 2), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 3. -/
theorem ep_Q2_024_partial_03_0033_valid :
    mulPoly ep_Q2_024_coefficient_03_0033
        ep_Q2_024_generator_03_0000_0099 =
      ep_Q2_024_partial_03_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0034 : Poly :=
[
  term ((1294401938342114 : Rat) / 1162780221153193) [(0, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 34 for generator 3. -/
def ep_Q2_024_partial_03_0034 : Poly :=
[
  term ((1294401938342114 : Rat) / 1162780221153193) [(0, 1), (2, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((1294401938342114 : Rat) / 1162780221153193) [(0, 1), (3, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1294401938342114 : Rat) / 1162780221153193) [(0, 1), (8, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1294401938342114 : Rat) / 1162780221153193) [(0, 1), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 3. -/
theorem ep_Q2_024_partial_03_0034_valid :
    mulPoly ep_Q2_024_coefficient_03_0034
        ep_Q2_024_generator_03_0000_0099 =
      ep_Q2_024_partial_03_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0035 : Poly :=
[
  term ((1301779206658910742012855160344299897564 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (11, 1), (13, 1)]
]

/-- Partial product 35 for generator 3. -/
def ep_Q2_024_partial_03_0035 : Poly :=
[
  term ((1301779206658910742012855160344299897564 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (2, 2), (11, 1), (13, 1)],
  term ((1301779206658910742012855160344299897564 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 2), (11, 1), (13, 1)],
  term ((-1301779206658910742012855160344299897564 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (8, 2), (11, 1), (13, 1)],
  term ((-1301779206658910742012855160344299897564 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 3. -/
theorem ep_Q2_024_partial_03_0035_valid :
    mulPoly ep_Q2_024_coefficient_03_0035
        ep_Q2_024_generator_03_0000_0099 =
      ep_Q2_024_partial_03_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0036 : Poly :=
[
  term ((-15444171732270150869850350250675063655004807572047237039 : Rat) / 929998952132019818504773430836265897467346423247461380) [(0, 1), (11, 1), (15, 1)]
]

/-- Partial product 36 for generator 3. -/
def ep_Q2_024_partial_03_0036 : Poly :=
[
  term ((-15444171732270150869850350250675063655004807572047237039 : Rat) / 929998952132019818504773430836265897467346423247461380) [(0, 1), (2, 2), (11, 1), (15, 1)],
  term ((-15444171732270150869850350250675063655004807572047237039 : Rat) / 929998952132019818504773430836265897467346423247461380) [(0, 1), (3, 2), (11, 1), (15, 1)],
  term ((15444171732270150869850350250675063655004807572047237039 : Rat) / 929998952132019818504773430836265897467346423247461380) [(0, 1), (8, 2), (11, 1), (15, 1)],
  term ((15444171732270150869850350250675063655004807572047237039 : Rat) / 929998952132019818504773430836265897467346423247461380) [(0, 1), (9, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 3. -/
theorem ep_Q2_024_partial_03_0036_valid :
    mulPoly ep_Q2_024_coefficient_03_0036
        ep_Q2_024_generator_03_0000_0099 =
      ep_Q2_024_partial_03_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0037 : Poly :=
[
  term ((9729455067456383 : Rat) / 1162780221153193) [(0, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 37 for generator 3. -/
def ep_Q2_024_partial_03_0037 : Poly :=
[
  term ((9729455067456383 : Rat) / 1162780221153193) [(0, 1), (2, 2), (11, 1), (15, 1), (16, 1)],
  term ((9729455067456383 : Rat) / 1162780221153193) [(0, 1), (3, 2), (11, 1), (15, 1), (16, 1)],
  term ((-9729455067456383 : Rat) / 1162780221153193) [(0, 1), (8, 2), (11, 1), (15, 1), (16, 1)],
  term ((-9729455067456383 : Rat) / 1162780221153193) [(0, 1), (9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 3. -/
theorem ep_Q2_024_partial_03_0037_valid :
    mulPoly ep_Q2_024_coefficient_03_0037
        ep_Q2_024_generator_03_0000_0099 =
      ep_Q2_024_partial_03_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0038 : Poly :=
[
  term ((9243609330048111973130073013258126302 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (12, 1)]
]

/-- Partial product 38 for generator 3. -/
def ep_Q2_024_partial_03_0038 : Poly :=
[
  term ((9243609330048111973130073013258126302 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (2, 2), (12, 1)],
  term ((9243609330048111973130073013258126302 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 2), (12, 1)],
  term ((-9243609330048111973130073013258126302 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (8, 2), (12, 1)],
  term ((-9243609330048111973130073013258126302 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (9, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 3. -/
theorem ep_Q2_024_partial_03_0038_valid :
    mulPoly ep_Q2_024_coefficient_03_0038
        ep_Q2_024_generator_03_0000_0099 =
      ep_Q2_024_partial_03_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0039 : Poly :=
[
  term ((80776032201816360897666197610026482783610529624868265581 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(0, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 39 for generator 3. -/
def ep_Q2_024_partial_03_0039 : Poly :=
[
  term ((80776032201816360897666197610026482783610529624868265581 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(0, 1), (2, 2), (12, 1), (13, 1), (15, 1)],
  term ((80776032201816360897666197610026482783610529624868265581 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(0, 1), (3, 2), (12, 1), (13, 1), (15, 1)],
  term ((-80776032201816360897666197610026482783610529624868265581 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(0, 1), (8, 2), (12, 1), (13, 1), (15, 1)],
  term ((-80776032201816360897666197610026482783610529624868265581 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(0, 1), (9, 2), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 3. -/
theorem ep_Q2_024_partial_03_0039_valid :
    mulPoly ep_Q2_024_coefficient_03_0039
        ep_Q2_024_generator_03_0000_0099 =
      ep_Q2_024_partial_03_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0040 : Poly :=
[
  term ((-4569079916135479 : Rat) / 2325560442306386) [(0, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 40 for generator 3. -/
def ep_Q2_024_partial_03_0040 : Poly :=
[
  term ((-4569079916135479 : Rat) / 2325560442306386) [(0, 1), (2, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4569079916135479 : Rat) / 2325560442306386) [(0, 1), (3, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((4569079916135479 : Rat) / 2325560442306386) [(0, 1), (8, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((4569079916135479 : Rat) / 2325560442306386) [(0, 1), (9, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 3. -/
theorem ep_Q2_024_partial_03_0040_valid :
    mulPoly ep_Q2_024_coefficient_03_0040
        ep_Q2_024_generator_03_0000_0099 =
      ep_Q2_024_partial_03_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0041 : Poly :=
[
  term ((-349799482188512142332992239684745264478 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (12, 1), (13, 2)]
]

/-- Partial product 41 for generator 3. -/
def ep_Q2_024_partial_03_0041 : Poly :=
[
  term ((-349799482188512142332992239684745264478 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (2, 2), (12, 1), (13, 2)],
  term ((-349799482188512142332992239684745264478 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 2), (12, 1), (13, 2)],
  term ((349799482188512142332992239684745264478 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (8, 2), (12, 1), (13, 2)],
  term ((349799482188512142332992239684745264478 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 2), (12, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 3. -/
theorem ep_Q2_024_partial_03_0041_valid :
    mulPoly ep_Q2_024_coefficient_03_0041
        ep_Q2_024_generator_03_0000_0099 =
      ep_Q2_024_partial_03_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0042 : Poly :=
[
  term ((-42141826090539299118196626075852698110867385870055900037 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(0, 1), (12, 1), (15, 2)]
]

/-- Partial product 42 for generator 3. -/
def ep_Q2_024_partial_03_0042 : Poly :=
[
  term ((-42141826090539299118196626075852698110867385870055900037 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(0, 1), (2, 2), (12, 1), (15, 2)],
  term ((-42141826090539299118196626075852698110867385870055900037 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(0, 1), (3, 2), (12, 1), (15, 2)],
  term ((42141826090539299118196626075852698110867385870055900037 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(0, 1), (8, 2), (12, 1), (15, 2)],
  term ((42141826090539299118196626075852698110867385870055900037 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(0, 1), (9, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 3. -/
theorem ep_Q2_024_partial_03_0042_valid :
    mulPoly ep_Q2_024_coefficient_03_0042
        ep_Q2_024_generator_03_0000_0099 =
      ep_Q2_024_partial_03_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0043 : Poly :=
[
  term ((9312225988977613 : Rat) / 2325560442306386) [(0, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 43 for generator 3. -/
def ep_Q2_024_partial_03_0043 : Poly :=
[
  term ((9312225988977613 : Rat) / 2325560442306386) [(0, 1), (2, 2), (12, 1), (15, 2), (16, 1)],
  term ((9312225988977613 : Rat) / 2325560442306386) [(0, 1), (3, 2), (12, 1), (15, 2), (16, 1)],
  term ((-9312225988977613 : Rat) / 2325560442306386) [(0, 1), (8, 2), (12, 1), (15, 2), (16, 1)],
  term ((-9312225988977613 : Rat) / 2325560442306386) [(0, 1), (9, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 3. -/
theorem ep_Q2_024_partial_03_0043_valid :
    mulPoly ep_Q2_024_coefficient_03_0043
        ep_Q2_024_generator_03_0000_0099 =
      ep_Q2_024_partial_03_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0044 : Poly :=
[
  term ((840603606037081392433272315756537614990135019107650619 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 44 for generator 3. -/
def ep_Q2_024_partial_03_0044 : Poly :=
[
  term ((840603606037081392433272315756537614990135019107650619 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (2, 2), (13, 1), (14, 1), (15, 1)],
  term ((840603606037081392433272315756537614990135019107650619 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (3, 2), (13, 1), (14, 1), (15, 1)],
  term ((-840603606037081392433272315756537614990135019107650619 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (8, 2), (13, 1), (14, 1), (15, 1)],
  term ((-840603606037081392433272315756537614990135019107650619 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (9, 2), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 3. -/
theorem ep_Q2_024_partial_03_0044_valid :
    mulPoly ep_Q2_024_coefficient_03_0044
        ep_Q2_024_generator_03_0000_0099 =
      ep_Q2_024_partial_03_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0045 : Poly :=
[
  term ((416983870520476 : Rat) / 1162780221153193) [(0, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 45 for generator 3. -/
def ep_Q2_024_partial_03_0045 : Poly :=
[
  term ((416983870520476 : Rat) / 1162780221153193) [(0, 1), (2, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((416983870520476 : Rat) / 1162780221153193) [(0, 1), (3, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-416983870520476 : Rat) / 1162780221153193) [(0, 1), (8, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-416983870520476 : Rat) / 1162780221153193) [(0, 1), (9, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 3. -/
theorem ep_Q2_024_partial_03_0045_valid :
    mulPoly ep_Q2_024_coefficient_03_0045
        ep_Q2_024_generator_03_0000_0099 =
      ep_Q2_024_partial_03_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0046 : Poly :=
[
  term ((-871030873588004056398805260665924086282740216698965969361 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(0, 1), (13, 1), (15, 1)]
]

/-- Partial product 46 for generator 3. -/
def ep_Q2_024_partial_03_0046 : Poly :=
[
  term ((-871030873588004056398805260665924086282740216698965969361 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(0, 1), (2, 2), (13, 1), (15, 1)],
  term ((-871030873588004056398805260665924086282740216698965969361 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(0, 1), (3, 2), (13, 1), (15, 1)],
  term ((871030873588004056398805260665924086282740216698965969361 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(0, 1), (8, 2), (13, 1), (15, 1)],
  term ((871030873588004056398805260665924086282740216698965969361 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(0, 1), (9, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 3. -/
theorem ep_Q2_024_partial_03_0046_valid :
    mulPoly ep_Q2_024_coefficient_03_0046
        ep_Q2_024_generator_03_0000_0099 =
      ep_Q2_024_partial_03_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0047 : Poly :=
[
  term ((-59713253052701383 : Rat) / 13953362653838316) [(0, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 47 for generator 3. -/
def ep_Q2_024_partial_03_0047 : Poly :=
[
  term ((-59713253052701383 : Rat) / 13953362653838316) [(0, 1), (2, 2), (13, 1), (15, 1), (16, 1)],
  term ((-59713253052701383 : Rat) / 13953362653838316) [(0, 1), (3, 2), (13, 1), (15, 1), (16, 1)],
  term ((59713253052701383 : Rat) / 13953362653838316) [(0, 1), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((59713253052701383 : Rat) / 13953362653838316) [(0, 1), (9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 3. -/
theorem ep_Q2_024_partial_03_0047_valid :
    mulPoly ep_Q2_024_coefficient_03_0047
        ep_Q2_024_generator_03_0000_0099 =
      ep_Q2_024_partial_03_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0048 : Poly :=
[
  term ((49684067318092044303267553663585312256 : Rat) / 359912837220743188970008058408861780397) [(0, 1), (13, 2)]
]

/-- Partial product 48 for generator 3. -/
def ep_Q2_024_partial_03_0048 : Poly :=
[
  term ((49684067318092044303267553663585312256 : Rat) / 359912837220743188970008058408861780397) [(0, 1), (2, 2), (13, 2)],
  term ((49684067318092044303267553663585312256 : Rat) / 359912837220743188970008058408861780397) [(0, 1), (3, 2), (13, 2)],
  term ((-49684067318092044303267553663585312256 : Rat) / 359912837220743188970008058408861780397) [(0, 1), (8, 2), (13, 2)],
  term ((-49684067318092044303267553663585312256 : Rat) / 359912837220743188970008058408861780397) [(0, 1), (9, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 3. -/
theorem ep_Q2_024_partial_03_0048_valid :
    mulPoly ep_Q2_024_coefficient_03_0048
        ep_Q2_024_generator_03_0000_0099 =
      ep_Q2_024_partial_03_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0049 : Poly :=
[
  term ((2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (13, 2), (14, 1)]
]

/-- Partial product 49 for generator 3. -/
def ep_Q2_024_partial_03_0049 : Poly :=
[
  term ((2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (2, 2), (13, 2), (14, 1)],
  term ((2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 2), (13, 2), (14, 1)],
  term ((-2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (8, 2), (13, 2), (14, 1)],
  term ((-2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 2), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 3. -/
theorem ep_Q2_024_partial_03_0049_valid :
    mulPoly ep_Q2_024_coefficient_03_0049
        ep_Q2_024_generator_03_0000_0099 =
      ep_Q2_024_partial_03_0049 := by
  native_decide

/-- Coefficient term 50 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0050 : Poly :=
[
  term ((13381727291793062822339033408892587364 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (14, 1)]
]

/-- Partial product 50 for generator 3. -/
def ep_Q2_024_partial_03_0050 : Poly :=
[
  term ((13381727291793062822339033408892587364 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (2, 2), (14, 1)],
  term ((13381727291793062822339033408892587364 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 2), (14, 1)],
  term ((-13381727291793062822339033408892587364 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (8, 2), (14, 1)],
  term ((-13381727291793062822339033408892587364 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (9, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 50 for generator 3. -/
theorem ep_Q2_024_partial_03_0050_valid :
    mulPoly ep_Q2_024_coefficient_03_0050
        ep_Q2_024_generator_03_0000_0099 =
      ep_Q2_024_partial_03_0050 := by
  native_decide

/-- Coefficient term 51 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0051 : Poly :=
[
  term ((-168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (14, 1), (15, 2)]
]

/-- Partial product 51 for generator 3. -/
def ep_Q2_024_partial_03_0051 : Poly :=
[
  term ((-168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (2, 2), (14, 1), (15, 2)],
  term ((-168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (3, 2), (14, 1), (15, 2)],
  term ((168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (8, 2), (14, 1), (15, 2)],
  term ((168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (9, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 51 for generator 3. -/
theorem ep_Q2_024_partial_03_0051_valid :
    mulPoly ep_Q2_024_coefficient_03_0051
        ep_Q2_024_generator_03_0000_0099 =
      ep_Q2_024_partial_03_0051 := by
  native_decide

/-- Coefficient term 52 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0052 : Poly :=
[
  term ((-416983870520476 : Rat) / 1162780221153193) [(0, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 52 for generator 3. -/
def ep_Q2_024_partial_03_0052 : Poly :=
[
  term ((-416983870520476 : Rat) / 1162780221153193) [(0, 1), (2, 2), (14, 1), (15, 2), (16, 1)],
  term ((-416983870520476 : Rat) / 1162780221153193) [(0, 1), (3, 2), (14, 1), (15, 2), (16, 1)],
  term ((416983870520476 : Rat) / 1162780221153193) [(0, 1), (8, 2), (14, 1), (15, 2), (16, 1)],
  term ((416983870520476 : Rat) / 1162780221153193) [(0, 1), (9, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 52 for generator 3. -/
theorem ep_Q2_024_partial_03_0052_valid :
    mulPoly ep_Q2_024_coefficient_03_0052
        ep_Q2_024_generator_03_0000_0099 =
      ep_Q2_024_partial_03_0052 := by
  native_decide

/-- Coefficient term 53 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0053 : Poly :=
[
  term ((378140816046550639901341128715218179294153440979964802061 : Rat) / 3719995808528079274019093723345063589869385692989845520) [(0, 1), (15, 2)]
]

/-- Partial product 53 for generator 3. -/
def ep_Q2_024_partial_03_0053 : Poly :=
[
  term ((378140816046550639901341128715218179294153440979964802061 : Rat) / 3719995808528079274019093723345063589869385692989845520) [(0, 1), (2, 2), (15, 2)],
  term ((378140816046550639901341128715218179294153440979964802061 : Rat) / 3719995808528079274019093723345063589869385692989845520) [(0, 1), (3, 2), (15, 2)],
  term ((-378140816046550639901341128715218179294153440979964802061 : Rat) / 3719995808528079274019093723345063589869385692989845520) [(0, 1), (8, 2), (15, 2)],
  term ((-378140816046550639901341128715218179294153440979964802061 : Rat) / 3719995808528079274019093723345063589869385692989845520) [(0, 1), (9, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 53 for generator 3. -/
theorem ep_Q2_024_partial_03_0053_valid :
    mulPoly ep_Q2_024_coefficient_03_0053
        ep_Q2_024_generator_03_0000_0099 =
      ep_Q2_024_partial_03_0053 := by
  native_decide

/-- Coefficient term 54 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0054 : Poly :=
[
  term ((-33123369544357749 : Rat) / 4651120884612772) [(0, 1), (15, 2), (16, 1)]
]

/-- Partial product 54 for generator 3. -/
def ep_Q2_024_partial_03_0054 : Poly :=
[
  term ((-33123369544357749 : Rat) / 4651120884612772) [(0, 1), (2, 2), (15, 2), (16, 1)],
  term ((-33123369544357749 : Rat) / 4651120884612772) [(0, 1), (3, 2), (15, 2), (16, 1)],
  term ((33123369544357749 : Rat) / 4651120884612772) [(0, 1), (8, 2), (15, 2), (16, 1)],
  term ((33123369544357749 : Rat) / 4651120884612772) [(0, 1), (9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 54 for generator 3. -/
theorem ep_Q2_024_partial_03_0054_valid :
    mulPoly ep_Q2_024_coefficient_03_0054
        ep_Q2_024_generator_03_0000_0099 =
      ep_Q2_024_partial_03_0054 := by
  native_decide

/-- Coefficient term 55 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0055 : Poly :=
[
  term ((-2140544576806429585465573269128715080 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (2, 1), (3, 1)]
]

/-- Partial product 55 for generator 3. -/
def ep_Q2_024_partial_03_0055 : Poly :=
[
  term ((2140544576806429585465573269128715080 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (2, 1), (3, 1), (8, 2)],
  term ((2140544576806429585465573269128715080 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (2, 1), (3, 1), (9, 2)],
  term ((-2140544576806429585465573269128715080 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (2, 1), (3, 3)],
  term ((-2140544576806429585465573269128715080 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (2, 3), (3, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 55 for generator 3. -/
theorem ep_Q2_024_partial_03_0055_valid :
    mulPoly ep_Q2_024_coefficient_03_0055
        ep_Q2_024_generator_03_0000_0099 =
      ep_Q2_024_partial_03_0055 := by
  native_decide

/-- Coefficient term 56 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0056 : Poly :=
[
  term ((-1089174789518067368825554324911160015476 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 1), (9, 1)]
]

/-- Partial product 56 for generator 3. -/
def ep_Q2_024_partial_03_0056 : Poly :=
[
  term ((-1089174789518067368825554324911160015476 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 1), (3, 2), (9, 1)],
  term ((1089174789518067368825554324911160015476 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 1), (8, 2), (9, 1)],
  term ((1089174789518067368825554324911160015476 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 1), (9, 3)],
  term ((-1089174789518067368825554324911160015476 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 3), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 56 for generator 3. -/
theorem ep_Q2_024_partial_03_0056_valid :
    mulPoly ep_Q2_024_coefficient_03_0056
        ep_Q2_024_generator_03_0000_0099 =
      ep_Q2_024_partial_03_0056 := by
  native_decide

/-- Coefficient term 57 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0057 : Poly :=
[
  term ((24897008634067285794795130322114482756 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (12, 1), (13, 1)]
]

/-- Partial product 57 for generator 3. -/
def ep_Q2_024_partial_03_0057 : Poly :=
[
  term ((24897008634067285794795130322114482756 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (3, 2), (12, 1), (13, 1)],
  term ((-24897008634067285794795130322114482756 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (8, 2), (12, 1), (13, 1)],
  term ((-24897008634067285794795130322114482756 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (9, 2), (12, 1), (13, 1)],
  term ((24897008634067285794795130322114482756 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 3), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 57 for generator 3. -/
theorem ep_Q2_024_partial_03_0057_valid :
    mulPoly ep_Q2_024_coefficient_03_0057
        ep_Q2_024_generator_03_0000_0099 =
      ep_Q2_024_partial_03_0057 := by
  native_decide

/-- Coefficient term 58 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0058 : Poly :=
[
  term ((-183488243113488394739718246684116996552696960175428317 : Rat) / 185999790426403963700954686167253179493469284649492276) [(1, 1), (2, 1), (12, 1), (15, 1)]
]

/-- Partial product 58 for generator 3. -/
def ep_Q2_024_partial_03_0058 : Poly :=
[
  term ((-183488243113488394739718246684116996552696960175428317 : Rat) / 185999790426403963700954686167253179493469284649492276) [(1, 1), (2, 1), (3, 2), (12, 1), (15, 1)],
  term ((183488243113488394739718246684116996552696960175428317 : Rat) / 185999790426403963700954686167253179493469284649492276) [(1, 1), (2, 1), (8, 2), (12, 1), (15, 1)],
  term ((183488243113488394739718246684116996552696960175428317 : Rat) / 185999790426403963700954686167253179493469284649492276) [(1, 1), (2, 1), (9, 2), (12, 1), (15, 1)],
  term ((-183488243113488394739718246684116996552696960175428317 : Rat) / 185999790426403963700954686167253179493469284649492276) [(1, 1), (2, 3), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 58 for generator 3. -/
theorem ep_Q2_024_partial_03_0058_valid :
    mulPoly ep_Q2_024_coefficient_03_0058
        ep_Q2_024_generator_03_0000_0099 =
      ep_Q2_024_partial_03_0058 := by
  native_decide

/-- Coefficient term 59 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0059 : Poly :=
[
  term ((217230840263161 : Rat) / 1162780221153193) [(1, 1), (2, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 59 for generator 3. -/
def ep_Q2_024_partial_03_0059 : Poly :=
[
  term ((217230840263161 : Rat) / 1162780221153193) [(1, 1), (2, 1), (3, 2), (12, 1), (15, 1), (16, 1)],
  term ((-217230840263161 : Rat) / 1162780221153193) [(1, 1), (2, 1), (8, 2), (12, 1), (15, 1), (16, 1)],
  term ((-217230840263161 : Rat) / 1162780221153193) [(1, 1), (2, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((217230840263161 : Rat) / 1162780221153193) [(1, 1), (2, 3), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 59 for generator 3. -/
theorem ep_Q2_024_partial_03_0059_valid :
    mulPoly ep_Q2_024_coefficient_03_0059
        ep_Q2_024_generator_03_0000_0099 =
      ep_Q2_024_partial_03_0059 := by
  native_decide

/-- Coefficient term 60 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0060 : Poly :=
[
  term ((-672896789764989056308682593313834106604 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (13, 1)]
]

/-- Partial product 60 for generator 3. -/
def ep_Q2_024_partial_03_0060 : Poly :=
[
  term ((-672896789764989056308682593313834106604 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (3, 2), (13, 1)],
  term ((672896789764989056308682593313834106604 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (8, 2), (13, 1)],
  term ((672896789764989056308682593313834106604 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (9, 2), (13, 1)],
  term ((-672896789764989056308682593313834106604 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 60 for generator 3. -/
theorem ep_Q2_024_partial_03_0060_valid :
    mulPoly ep_Q2_024_coefficient_03_0060
        ep_Q2_024_generator_03_0000_0099 =
      ep_Q2_024_partial_03_0060 := by
  native_decide

/-- Coefficient term 61 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0061 : Poly :=
[
  term ((83274961275595767083854644591474693698433734006356255887 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(1, 1), (2, 1), (15, 1)]
]

/-- Partial product 61 for generator 3. -/
def ep_Q2_024_partial_03_0061 : Poly :=
[
  term ((83274961275595767083854644591474693698433734006356255887 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(1, 1), (2, 1), (3, 2), (15, 1)],
  term ((-83274961275595767083854644591474693698433734006356255887 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(1, 1), (2, 1), (8, 2), (15, 1)],
  term ((-83274961275595767083854644591474693698433734006356255887 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(1, 1), (2, 1), (9, 2), (15, 1)],
  term ((83274961275595767083854644591474693698433734006356255887 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(1, 1), (2, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 61 for generator 3. -/
theorem ep_Q2_024_partial_03_0061_valid :
    mulPoly ep_Q2_024_coefficient_03_0061
        ep_Q2_024_generator_03_0000_0099 =
      ep_Q2_024_partial_03_0061 := by
  native_decide

/-- Coefficient term 62 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0062 : Poly :=
[
  term ((-13616139087263447 : Rat) / 2325560442306386) [(1, 1), (2, 1), (15, 1), (16, 1)]
]

/-- Partial product 62 for generator 3. -/
def ep_Q2_024_partial_03_0062 : Poly :=
[
  term ((-13616139087263447 : Rat) / 2325560442306386) [(1, 1), (2, 1), (3, 2), (15, 1), (16, 1)],
  term ((13616139087263447 : Rat) / 2325560442306386) [(1, 1), (2, 1), (8, 2), (15, 1), (16, 1)],
  term ((13616139087263447 : Rat) / 2325560442306386) [(1, 1), (2, 1), (9, 2), (15, 1), (16, 1)],
  term ((-13616139087263447 : Rat) / 2325560442306386) [(1, 1), (2, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 62 for generator 3. -/
theorem ep_Q2_024_partial_03_0062_valid :
    mulPoly ep_Q2_024_coefficient_03_0062
        ep_Q2_024_generator_03_0000_0099 =
      ep_Q2_024_partial_03_0062 := by
  native_decide

/-- Coefficient term 63 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0063 : Poly :=
[
  term ((315758814253318183574532856800326951347 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (3, 1)]
]

/-- Partial product 63 for generator 3. -/
def ep_Q2_024_partial_03_0063 : Poly :=
[
  term ((315758814253318183574532856800326951347 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (2, 2), (3, 1)],
  term ((-315758814253318183574532856800326951347 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (3, 1), (8, 2)],
  term ((-315758814253318183574532856800326951347 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (3, 1), (9, 2)],
  term ((315758814253318183574532856800326951347 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (3, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 63 for generator 3. -/
theorem ep_Q2_024_partial_03_0063_valid :
    mulPoly ep_Q2_024_coefficient_03_0063
        ep_Q2_024_generator_03_0000_0099 =
      ep_Q2_024_partial_03_0063 := by
  native_decide

/-- Coefficient term 64 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0064 : Poly :=
[
  term ((1465074617356825556565339743900656045508 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (4, 1)]
]

/-- Partial product 64 for generator 3. -/
def ep_Q2_024_partial_03_0064 : Poly :=
[
  term ((1465074617356825556565339743900656045508 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 2), (3, 1), (4, 1)],
  term ((-1465074617356825556565339743900656045508 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (4, 1), (8, 2)],
  term ((-1465074617356825556565339743900656045508 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (4, 1), (9, 2)],
  term ((1465074617356825556565339743900656045508 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 3), (4, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 64 for generator 3. -/
theorem ep_Q2_024_partial_03_0064_valid :
    mulPoly ep_Q2_024_coefficient_03_0064
        ep_Q2_024_generator_03_0000_0099 =
      ep_Q2_024_partial_03_0064 := by
  native_decide

/-- Coefficient term 65 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0065 : Poly :=
[
  term ((170578982941464836661692016476078734824 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (5, 1), (9, 1)]
]

/-- Partial product 65 for generator 3. -/
def ep_Q2_024_partial_03_0065 : Poly :=
[
  term ((170578982941464836661692016476078734824 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 2), (3, 1), (5, 1), (9, 1)],
  term ((-170578982941464836661692016476078734824 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (5, 1), (8, 2), (9, 1)],
  term ((-170578982941464836661692016476078734824 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (5, 1), (9, 3)],
  term ((170578982941464836661692016476078734824 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 3), (5, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 65 for generator 3. -/
theorem ep_Q2_024_partial_03_0065_valid :
    mulPoly ep_Q2_024_coefficient_03_0065
        ep_Q2_024_generator_03_0000_0099 =
      ep_Q2_024_partial_03_0065 := by
  native_decide

/-- Coefficient term 66 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0066 : Poly :=
[
  term ((599775112895054325538362237752226839024 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (5, 1), (13, 1)]
]

/-- Partial product 66 for generator 3. -/
def ep_Q2_024_partial_03_0066 : Poly :=
[
  term ((599775112895054325538362237752226839024 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 2), (3, 1), (5, 1), (13, 1)],
  term ((-599775112895054325538362237752226839024 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (5, 1), (8, 2), (13, 1)],
  term ((-599775112895054325538362237752226839024 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (5, 1), (9, 2), (13, 1)],
  term ((599775112895054325538362237752226839024 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 3), (5, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 66 for generator 3. -/
theorem ep_Q2_024_partial_03_0066_valid :
    mulPoly ep_Q2_024_coefficient_03_0066
        ep_Q2_024_generator_03_0000_0099 =
      ep_Q2_024_partial_03_0066 := by
  native_decide

/-- Coefficient term 67 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0067 : Poly :=
[
  term ((-184656524631467365497145319680970267514181261970516034 : Rat) / 46499947606600990925238671541813294873367321162373069) [(1, 1), (3, 1), (5, 1), (15, 1)]
]

/-- Partial product 67 for generator 3. -/
def ep_Q2_024_partial_03_0067 : Poly :=
[
  term ((-184656524631467365497145319680970267514181261970516034 : Rat) / 46499947606600990925238671541813294873367321162373069) [(1, 1), (2, 2), (3, 1), (5, 1), (15, 1)],
  term ((184656524631467365497145319680970267514181261970516034 : Rat) / 46499947606600990925238671541813294873367321162373069) [(1, 1), (3, 1), (5, 1), (8, 2), (15, 1)],
  term ((184656524631467365497145319680970267514181261970516034 : Rat) / 46499947606600990925238671541813294873367321162373069) [(1, 1), (3, 1), (5, 1), (9, 2), (15, 1)],
  term ((-184656524631467365497145319680970267514181261970516034 : Rat) / 46499947606600990925238671541813294873367321162373069) [(1, 1), (3, 3), (5, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 67 for generator 3. -/
theorem ep_Q2_024_partial_03_0067_valid :
    mulPoly ep_Q2_024_coefficient_03_0067
        ep_Q2_024_generator_03_0000_0099 =
      ep_Q2_024_partial_03_0067 := by
  native_decide

/-- Coefficient term 68 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0068 : Poly :=
[
  term ((-5548675726232856 : Rat) / 1162780221153193) [(1, 1), (3, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 68 for generator 3. -/
def ep_Q2_024_partial_03_0068 : Poly :=
[
  term ((-5548675726232856 : Rat) / 1162780221153193) [(1, 1), (2, 2), (3, 1), (5, 1), (15, 1), (16, 1)],
  term ((5548675726232856 : Rat) / 1162780221153193) [(1, 1), (3, 1), (5, 1), (8, 2), (15, 1), (16, 1)],
  term ((5548675726232856 : Rat) / 1162780221153193) [(1, 1), (3, 1), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((-5548675726232856 : Rat) / 1162780221153193) [(1, 1), (3, 3), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 68 for generator 3. -/
theorem ep_Q2_024_partial_03_0068_valid :
    mulPoly ep_Q2_024_coefficient_03_0068
        ep_Q2_024_generator_03_0000_0099 =
      ep_Q2_024_partial_03_0068 := by
  native_decide

/-- Coefficient term 69 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0069 : Poly :=
[
  term ((-826347564150239326187536952436868474864 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (8, 1)]
]

/-- Partial product 69 for generator 3. -/
def ep_Q2_024_partial_03_0069 : Poly :=
[
  term ((-826347564150239326187536952436868474864 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 2), (3, 1), (8, 1)],
  term ((826347564150239326187536952436868474864 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (8, 1), (9, 2)],
  term ((826347564150239326187536952436868474864 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (8, 3)],
  term ((-826347564150239326187536952436868474864 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 3), (8, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 69 for generator 3. -/
theorem ep_Q2_024_partial_03_0069_valid :
    mulPoly ep_Q2_024_coefficient_03_0069
        ep_Q2_024_generator_03_0000_0099 =
      ep_Q2_024_partial_03_0069 := by
  native_decide

/-- Coefficient term 70 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0070 : Poly :=
[
  term ((39137400746849611463101820854253627952 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (3, 1), (9, 1), (13, 1)]
]

/-- Partial product 70 for generator 3. -/
def ep_Q2_024_partial_03_0070 : Poly :=
[
  term ((39137400746849611463101820854253627952 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (2, 2), (3, 1), (9, 1), (13, 1)],
  term ((-39137400746849611463101820854253627952 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (3, 1), (8, 2), (9, 1), (13, 1)],
  term ((-39137400746849611463101820854253627952 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (3, 1), (9, 3), (13, 1)],
  term ((39137400746849611463101820854253627952 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (3, 3), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 70 for generator 3. -/
theorem ep_Q2_024_partial_03_0070_valid :
    mulPoly ep_Q2_024_coefficient_03_0070
        ep_Q2_024_generator_03_0000_0099 =
      ep_Q2_024_partial_03_0070 := by
  native_decide

/-- Coefficient term 71 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0071 : Poly :=
[
  term ((-3758154407096922852572289538910856139432184544821245171 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(1, 1), (3, 1), (9, 1), (15, 1)]
]

/-- Partial product 71 for generator 3. -/
def ep_Q2_024_partial_03_0071 : Poly :=
[
  term ((-3758154407096922852572289538910856139432184544821245171 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(1, 1), (2, 2), (3, 1), (9, 1), (15, 1)],
  term ((3758154407096922852572289538910856139432184544821245171 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(1, 1), (3, 1), (8, 2), (9, 1), (15, 1)],
  term ((3758154407096922852572289538910856139432184544821245171 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(1, 1), (3, 1), (9, 3), (15, 1)],
  term ((-3758154407096922852572289538910856139432184544821245171 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(1, 1), (3, 3), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 71 for generator 3. -/
theorem ep_Q2_024_partial_03_0071_valid :
    mulPoly ep_Q2_024_coefficient_03_0071
        ep_Q2_024_generator_03_0000_0099 =
      ep_Q2_024_partial_03_0071 := by
  native_decide

/-- Coefficient term 72 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0072 : Poly :=
[
  term ((1868935561931170 : Rat) / 1162780221153193) [(1, 1), (3, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 72 for generator 3. -/
def ep_Q2_024_partial_03_0072 : Poly :=
[
  term ((1868935561931170 : Rat) / 1162780221153193) [(1, 1), (2, 2), (3, 1), (9, 1), (15, 1), (16, 1)],
  term ((-1868935561931170 : Rat) / 1162780221153193) [(1, 1), (3, 1), (8, 2), (9, 1), (15, 1), (16, 1)],
  term ((-1868935561931170 : Rat) / 1162780221153193) [(1, 1), (3, 1), (9, 3), (15, 1), (16, 1)],
  term ((1868935561931170 : Rat) / 1162780221153193) [(1, 1), (3, 3), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 72 for generator 3. -/
theorem ep_Q2_024_partial_03_0072_valid :
    mulPoly ep_Q2_024_coefficient_03_0072
        ep_Q2_024_generator_03_0000_0099 =
      ep_Q2_024_partial_03_0072 := by
  native_decide

/-- Coefficient term 73 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0073 : Poly :=
[
  term ((31556266093234973165652571965850210528 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (3, 1), (9, 2)]
]

/-- Partial product 73 for generator 3. -/
def ep_Q2_024_partial_03_0073 : Poly :=
[
  term ((31556266093234973165652571965850210528 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (2, 2), (3, 1), (9, 2)],
  term ((-31556266093234973165652571965850210528 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (3, 1), (8, 2), (9, 2)],
  term ((-31556266093234973165652571965850210528 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (3, 1), (9, 4)],
  term ((31556266093234973165652571965850210528 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (3, 3), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 73 for generator 3. -/
theorem ep_Q2_024_partial_03_0073_valid :
    mulPoly ep_Q2_024_coefficient_03_0073
        ep_Q2_024_generator_03_0000_0099 =
      ep_Q2_024_partial_03_0073 := by
  native_decide

/-- Coefficient term 74 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0074 : Poly :=
[
  term ((-89950247204447483722066909092463307858 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (12, 1)]
]

/-- Partial product 74 for generator 3. -/
def ep_Q2_024_partial_03_0074 : Poly :=
[
  term ((-89950247204447483722066909092463307858 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 2), (3, 1), (12, 1)],
  term ((89950247204447483722066909092463307858 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (8, 2), (12, 1)],
  term ((89950247204447483722066909092463307858 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (9, 2), (12, 1)],
  term ((-89950247204447483722066909092463307858 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 3), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 74 for generator 3. -/
theorem ep_Q2_024_partial_03_0074_valid :
    mulPoly ep_Q2_024_coefficient_03_0074
        ep_Q2_024_generator_03_0000_0099 =
      ep_Q2_024_partial_03_0074 := by
  native_decide

/-- Coefficient term 75 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0075 : Poly :=
[
  term ((83775503443212770909169223229504540576 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 75 for generator 3. -/
def ep_Q2_024_partial_03_0075 : Poly :=
[
  term ((83775503443212770909169223229504540576 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 2), (3, 1), (12, 1), (13, 1), (15, 1)],
  term ((-83775503443212770909169223229504540576 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (8, 2), (12, 1), (13, 1), (15, 1)],
  term ((-83775503443212770909169223229504540576 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (9, 2), (12, 1), (13, 1), (15, 1)],
  term ((83775503443212770909169223229504540576 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 3), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 75 for generator 3. -/
theorem ep_Q2_024_partial_03_0075_valid :
    mulPoly ep_Q2_024_coefficient_03_0075
        ep_Q2_024_generator_03_0000_0099 =
      ep_Q2_024_partial_03_0075 := by
  native_decide

/-- Coefficient term 76 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0076 : Poly :=
[
  term ((-2430959375450672057935765985789364740848990716162226488 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (3, 1), (12, 1), (15, 2)]
]

/-- Partial product 76 for generator 3. -/
def ep_Q2_024_partial_03_0076 : Poly :=
[
  term ((-2430959375450672057935765985789364740848990716162226488 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (2, 2), (3, 1), (12, 1), (15, 2)],
  term ((2430959375450672057935765985789364740848990716162226488 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (3, 1), (8, 2), (12, 1), (15, 2)],
  term ((2430959375450672057935765985789364740848990716162226488 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (3, 1), (9, 2), (12, 1), (15, 2)],
  term ((-2430959375450672057935765985789364740848990716162226488 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (3, 3), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 76 for generator 3. -/
theorem ep_Q2_024_partial_03_0076_valid :
    mulPoly ep_Q2_024_coefficient_03_0076
        ep_Q2_024_generator_03_0000_0099 =
      ep_Q2_024_partial_03_0076 := by
  native_decide

/-- Coefficient term 77 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0077 : Poly :=
[
  term ((3301512817454880 : Rat) / 1162780221153193) [(1, 1), (3, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 77 for generator 3. -/
def ep_Q2_024_partial_03_0077 : Poly :=
[
  term ((3301512817454880 : Rat) / 1162780221153193) [(1, 1), (2, 2), (3, 1), (12, 1), (15, 2), (16, 1)],
  term ((-3301512817454880 : Rat) / 1162780221153193) [(1, 1), (3, 1), (8, 2), (12, 1), (15, 2), (16, 1)],
  term ((-3301512817454880 : Rat) / 1162780221153193) [(1, 1), (3, 1), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((3301512817454880 : Rat) / 1162780221153193) [(1, 1), (3, 3), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 77 for generator 3. -/
theorem ep_Q2_024_partial_03_0077_valid :
    mulPoly ep_Q2_024_coefficient_03_0077
        ep_Q2_024_generator_03_0000_0099 =
      ep_Q2_024_partial_03_0077 := by
  native_decide

/-- Coefficient term 78 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0078 : Poly :=
[
  term ((-66386162981800750972229373751762779606788322410259643073 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(1, 1), (3, 1), (13, 1), (15, 1)]
]

/-- Partial product 78 for generator 3. -/
def ep_Q2_024_partial_03_0078 : Poly :=
[
  term ((-66386162981800750972229373751762779606788322410259643073 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(1, 1), (2, 2), (3, 1), (13, 1), (15, 1)],
  term ((66386162981800750972229373751762779606788322410259643073 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(1, 1), (3, 1), (8, 2), (13, 1), (15, 1)],
  term ((66386162981800750972229373751762779606788322410259643073 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(1, 1), (3, 1), (9, 2), (13, 1), (15, 1)],
  term ((-66386162981800750972229373751762779606788322410259643073 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(1, 1), (3, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 78 for generator 3. -/
theorem ep_Q2_024_partial_03_0078_valid :
    mulPoly ep_Q2_024_coefficient_03_0078
        ep_Q2_024_generator_03_0000_0099 =
      ep_Q2_024_partial_03_0078 := by
  native_decide

/-- Coefficient term 79 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0079 : Poly :=
[
  term ((181622001380355 : Rat) / 1162780221153193) [(1, 1), (3, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 79 for generator 3. -/
def ep_Q2_024_partial_03_0079 : Poly :=
[
  term ((181622001380355 : Rat) / 1162780221153193) [(1, 1), (2, 2), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((-181622001380355 : Rat) / 1162780221153193) [(1, 1), (3, 1), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((-181622001380355 : Rat) / 1162780221153193) [(1, 1), (3, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((181622001380355 : Rat) / 1162780221153193) [(1, 1), (3, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 79 for generator 3. -/
theorem ep_Q2_024_partial_03_0079_valid :
    mulPoly ep_Q2_024_coefficient_03_0079
        ep_Q2_024_generator_03_0000_0099 =
      ep_Q2_024_partial_03_0079 := by
  native_decide

/-- Coefficient term 80 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0080 : Poly :=
[
  term ((24285619430674572789347187379892301356 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (13, 2)]
]

/-- Partial product 80 for generator 3. -/
def ep_Q2_024_partial_03_0080 : Poly :=
[
  term ((24285619430674572789347187379892301356 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 2), (3, 1), (13, 2)],
  term ((-24285619430674572789347187379892301356 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (8, 2), (13, 2)],
  term ((-24285619430674572789347187379892301356 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (9, 2), (13, 2)],
  term ((24285619430674572789347187379892301356 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 3), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 80 for generator 3. -/
theorem ep_Q2_024_partial_03_0080_valid :
    mulPoly ep_Q2_024_coefficient_03_0080
        ep_Q2_024_generator_03_0000_0099 =
      ep_Q2_024_partial_03_0080 := by
  native_decide

/-- Coefficient term 81 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0081 : Poly :=
[
  term ((-582061027275376329967414115123588817349 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (14, 1)]
]

/-- Partial product 81 for generator 3. -/
def ep_Q2_024_partial_03_0081 : Poly :=
[
  term ((-582061027275376329967414115123588817349 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 2), (3, 1), (14, 1)],
  term ((582061027275376329967414115123588817349 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (8, 2), (14, 1)],
  term ((582061027275376329967414115123588817349 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (9, 2), (14, 1)],
  term ((-582061027275376329967414115123588817349 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 81 for generator 3. -/
theorem ep_Q2_024_partial_03_0081_valid :
    mulPoly ep_Q2_024_coefficient_03_0081
        ep_Q2_024_generator_03_0000_0099 =
      ep_Q2_024_partial_03_0081 := by
  native_decide

/-- Coefficient term 82 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0082 : Poly :=
[
  term ((70948174341627961681154461217303502179064002203768041167 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(1, 1), (3, 1), (15, 2)]
]

/-- Partial product 82 for generator 3. -/
def ep_Q2_024_partial_03_0082 : Poly :=
[
  term ((70948174341627961681154461217303502179064002203768041167 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(1, 1), (2, 2), (3, 1), (15, 2)],
  term ((-70948174341627961681154461217303502179064002203768041167 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(1, 1), (3, 1), (8, 2), (15, 2)],
  term ((-70948174341627961681154461217303502179064002203768041167 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(1, 1), (3, 1), (9, 2), (15, 2)],
  term ((70948174341627961681154461217303502179064002203768041167 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(1, 1), (3, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 82 for generator 3. -/
theorem ep_Q2_024_partial_03_0082_valid :
    mulPoly ep_Q2_024_coefficient_03_0082
        ep_Q2_024_generator_03_0000_0099 =
      ep_Q2_024_partial_03_0082 := by
  native_decide

/-- Coefficient term 83 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0083 : Poly :=
[
  term ((6185531098898219 : Rat) / 1162780221153193) [(1, 1), (3, 1), (15, 2), (16, 1)]
]

/-- Partial product 83 for generator 3. -/
def ep_Q2_024_partial_03_0083 : Poly :=
[
  term ((6185531098898219 : Rat) / 1162780221153193) [(1, 1), (2, 2), (3, 1), (15, 2), (16, 1)],
  term ((-6185531098898219 : Rat) / 1162780221153193) [(1, 1), (3, 1), (8, 2), (15, 2), (16, 1)],
  term ((-6185531098898219 : Rat) / 1162780221153193) [(1, 1), (3, 1), (9, 2), (15, 2), (16, 1)],
  term ((6185531098898219 : Rat) / 1162780221153193) [(1, 1), (3, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 83 for generator 3. -/
theorem ep_Q2_024_partial_03_0083_valid :
    mulPoly ep_Q2_024_coefficient_03_0083
        ep_Q2_024_generator_03_0000_0099 =
      ep_Q2_024_partial_03_0083 := by
  native_decide

/-- Coefficient term 84 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0084 : Poly :=
[
  term ((-1465074617356825556565339743900656045508 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (4, 1), (9, 1)]
]

/-- Partial product 84 for generator 3. -/
def ep_Q2_024_partial_03_0084 : Poly :=
[
  term ((-1465074617356825556565339743900656045508 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (2, 2), (4, 1), (9, 1)],
  term ((-1465074617356825556565339743900656045508 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (3, 2), (4, 1), (9, 1)],
  term ((1465074617356825556565339743900656045508 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (4, 1), (8, 2), (9, 1)],
  term ((1465074617356825556565339743900656045508 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (4, 1), (9, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 84 for generator 3. -/
theorem ep_Q2_024_partial_03_0084_valid :
    mulPoly ep_Q2_024_coefficient_03_0084
        ep_Q2_024_generator_03_0000_0099 =
      ep_Q2_024_partial_03_0084 := by
  native_decide

/-- Coefficient term 85 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0085 : Poly :=
[
  term ((781230546615652314315611763365815318071 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1)]
]

/-- Partial product 85 for generator 3. -/
def ep_Q2_024_partial_03_0085 : Poly :=
[
  term ((781230546615652314315611763365815318071 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 2), (5, 1)],
  term ((781230546615652314315611763365815318071 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 2), (5, 1)],
  term ((-781230546615652314315611763365815318071 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (8, 2)],
  term ((-781230546615652314315611763365815318071 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 85 for generator 3. -/
theorem ep_Q2_024_partial_03_0085_valid :
    mulPoly ep_Q2_024_coefficient_03_0085
        ep_Q2_024_generator_03_0000_0099 =
      ep_Q2_024_partial_03_0085 := by
  native_decide

/-- Coefficient term 86 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0086 : Poly :=
[
  term ((-51916682732587159756343578366982608688 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (9, 1), (12, 1), (13, 1)]
]

/-- Partial product 86 for generator 3. -/
def ep_Q2_024_partial_03_0086 : Poly :=
[
  term ((-51916682732587159756343578366982608688 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 2), (5, 1), (9, 1), (12, 1), (13, 1)],
  term ((-51916682732587159756343578366982608688 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 2), (5, 1), (9, 1), (12, 1), (13, 1)],
  term ((51916682732587159756343578366982608688 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (8, 2), (9, 1), (12, 1), (13, 1)],
  term ((51916682732587159756343578366982608688 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (9, 3), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 86 for generator 3. -/
theorem ep_Q2_024_partial_03_0086_valid :
    mulPoly ep_Q2_024_coefficient_03_0086
        ep_Q2_024_generator_03_0000_0099 =
      ep_Q2_024_partial_03_0086 := by
  native_decide

/-- Coefficient term 87 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0087 : Poly :=
[
  term ((519790077507635364246714238454931580267528154182411463 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (5, 1), (9, 1), (12, 1), (15, 1)]
]

/-- Partial product 87 for generator 3. -/
def ep_Q2_024_partial_03_0087 : Poly :=
[
  term ((519790077507635364246714238454931580267528154182411463 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (2, 2), (5, 1), (9, 1), (12, 1), (15, 1)],
  term ((519790077507635364246714238454931580267528154182411463 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (3, 2), (5, 1), (9, 1), (12, 1), (15, 1)],
  term ((-519790077507635364246714238454931580267528154182411463 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (5, 1), (8, 2), (9, 1), (12, 1), (15, 1)],
  term ((-519790077507635364246714238454931580267528154182411463 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (5, 1), (9, 3), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 87 for generator 3. -/
theorem ep_Q2_024_partial_03_0087_valid :
    mulPoly ep_Q2_024_coefficient_03_0087
        ep_Q2_024_generator_03_0000_0099 =
      ep_Q2_024_partial_03_0087 := by
  native_decide

/-- Coefficient term 88 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0088 : Poly :=
[
  term ((-850957154578940 : Rat) / 1162780221153193) [(1, 1), (5, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 88 for generator 3. -/
def ep_Q2_024_partial_03_0088 : Poly :=
[
  term ((-850957154578940 : Rat) / 1162780221153193) [(1, 1), (2, 2), (5, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-850957154578940 : Rat) / 1162780221153193) [(1, 1), (3, 2), (5, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((850957154578940 : Rat) / 1162780221153193) [(1, 1), (5, 1), (8, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((850957154578940 : Rat) / 1162780221153193) [(1, 1), (5, 1), (9, 3), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 88 for generator 3. -/
theorem ep_Q2_024_partial_03_0088_valid :
    mulPoly ep_Q2_024_coefficient_03_0088
        ep_Q2_024_generator_03_0000_0099 =
      ep_Q2_024_partial_03_0088 := by
  native_decide

/-- Coefficient term 89 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0089 : Poly :=
[
  term ((866161346976921729008869342799551372232 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (5, 1), (9, 1), (13, 1)]
]

/-- Partial product 89 for generator 3. -/
def ep_Q2_024_partial_03_0089 : Poly :=
[
  term ((866161346976921729008869342799551372232 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (2, 2), (5, 1), (9, 1), (13, 1)],
  term ((866161346976921729008869342799551372232 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (3, 2), (5, 1), (9, 1), (13, 1)],
  term ((-866161346976921729008869342799551372232 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (5, 1), (8, 2), (9, 1), (13, 1)],
  term ((-866161346976921729008869342799551372232 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (5, 1), (9, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 89 for generator 3. -/
theorem ep_Q2_024_partial_03_0089_valid :
    mulPoly ep_Q2_024_coefficient_03_0089
        ep_Q2_024_generator_03_0000_0099 =
      ep_Q2_024_partial_03_0089 := by
  native_decide

/-- Coefficient term 90 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0090 : Poly :=
[
  term ((24311462327325841715821792273981411838734259987160207707 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (5, 1), (9, 1), (15, 1)]
]

/-- Partial product 90 for generator 3. -/
def ep_Q2_024_partial_03_0090 : Poly :=
[
  term ((24311462327325841715821792273981411838734259987160207707 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (2, 2), (5, 1), (9, 1), (15, 1)],
  term ((24311462327325841715821792273981411838734259987160207707 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (3, 2), (5, 1), (9, 1), (15, 1)],
  term ((-24311462327325841715821792273981411838734259987160207707 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (5, 1), (8, 2), (9, 1), (15, 1)],
  term ((-24311462327325841715821792273981411838734259987160207707 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (5, 1), (9, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 90 for generator 3. -/
theorem ep_Q2_024_partial_03_0090_valid :
    mulPoly ep_Q2_024_coefficient_03_0090
        ep_Q2_024_generator_03_0000_0099 =
      ep_Q2_024_partial_03_0090 := by
  native_decide

/-- Coefficient term 91 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0091 : Poly :=
[
  term ((-35421006354003964 : Rat) / 3488340663459579) [(1, 1), (5, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 91 for generator 3. -/
def ep_Q2_024_partial_03_0091 : Poly :=
[
  term ((-35421006354003964 : Rat) / 3488340663459579) [(1, 1), (2, 2), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((-35421006354003964 : Rat) / 3488340663459579) [(1, 1), (3, 2), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((35421006354003964 : Rat) / 3488340663459579) [(1, 1), (5, 1), (8, 2), (9, 1), (15, 1), (16, 1)],
  term ((35421006354003964 : Rat) / 3488340663459579) [(1, 1), (5, 1), (9, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 91 for generator 3. -/
theorem ep_Q2_024_partial_03_0091_valid :
    mulPoly ep_Q2_024_coefficient_03_0091
        ep_Q2_024_generator_03_0000_0099 =
      ep_Q2_024_partial_03_0091 := by
  native_decide

/-- Coefficient term 92 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0092 : Poly :=
[
  term ((-952743145992012822131987741397365806328 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (9, 2)]
]

/-- Partial product 92 for generator 3. -/
def ep_Q2_024_partial_03_0092 : Poly :=
[
  term ((-952743145992012822131987741397365806328 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 2), (5, 1), (9, 2)],
  term ((-952743145992012822131987741397365806328 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 2), (5, 1), (9, 2)],
  term ((952743145992012822131987741397365806328 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (8, 2), (9, 2)],
  term ((952743145992012822131987741397365806328 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (9, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 92 for generator 3. -/
theorem ep_Q2_024_partial_03_0092_valid :
    mulPoly ep_Q2_024_coefficient_03_0092
        ep_Q2_024_generator_03_0000_0099 =
      ep_Q2_024_partial_03_0092 := by
  native_decide

/-- Coefficient term 93 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0093 : Poly :=
[
  term ((18487218660096223946260146026516252604 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (12, 1)]
]

/-- Partial product 93 for generator 3. -/
def ep_Q2_024_partial_03_0093 : Poly :=
[
  term ((18487218660096223946260146026516252604 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 2), (5, 1), (12, 1)],
  term ((18487218660096223946260146026516252604 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 2), (5, 1), (12, 1)],
  term ((-18487218660096223946260146026516252604 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (8, 2), (12, 1)],
  term ((-18487218660096223946260146026516252604 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (9, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 93 for generator 3. -/
theorem ep_Q2_024_partial_03_0093_valid :
    mulPoly ep_Q2_024_coefficient_03_0093
        ep_Q2_024_generator_03_0000_0099 =
      ep_Q2_024_partial_03_0093 := by
  native_decide

/-- Coefficient term 94 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0094 : Poly :=
[
  term ((16527737784929168061123148869963794329901925980398052713 : Rat) / 557999371279211891102864058501759538480407853948476828) [(1, 1), (5, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 94 for generator 3. -/
def ep_Q2_024_partial_03_0094 : Poly :=
[
  term ((16527737784929168061123148869963794329901925980398052713 : Rat) / 557999371279211891102864058501759538480407853948476828) [(1, 1), (2, 2), (5, 1), (12, 1), (13, 1), (15, 1)],
  term ((16527737784929168061123148869963794329901925980398052713 : Rat) / 557999371279211891102864058501759538480407853948476828) [(1, 1), (3, 2), (5, 1), (12, 1), (13, 1), (15, 1)],
  term ((-16527737784929168061123148869963794329901925980398052713 : Rat) / 557999371279211891102864058501759538480407853948476828) [(1, 1), (5, 1), (8, 2), (12, 1), (13, 1), (15, 1)],
  term ((-16527737784929168061123148869963794329901925980398052713 : Rat) / 557999371279211891102864058501759538480407853948476828) [(1, 1), (5, 1), (9, 2), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 94 for generator 3. -/
theorem ep_Q2_024_partial_03_0094_valid :
    mulPoly ep_Q2_024_coefficient_03_0094
        ep_Q2_024_generator_03_0000_0099 =
      ep_Q2_024_partial_03_0094 := by
  native_decide

/-- Coefficient term 95 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0095 : Poly :=
[
  term ((-4569079916135479 : Rat) / 1162780221153193) [(1, 1), (5, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 95 for generator 3. -/
def ep_Q2_024_partial_03_0095 : Poly :=
[
  term ((-4569079916135479 : Rat) / 1162780221153193) [(1, 1), (2, 2), (5, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4569079916135479 : Rat) / 1162780221153193) [(1, 1), (3, 2), (5, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((4569079916135479 : Rat) / 1162780221153193) [(1, 1), (5, 1), (8, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((4569079916135479 : Rat) / 1162780221153193) [(1, 1), (5, 1), (9, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 95 for generator 3. -/
theorem ep_Q2_024_partial_03_0095_valid :
    mulPoly ep_Q2_024_coefficient_03_0095
        ep_Q2_024_generator_03_0000_0099 =
      ep_Q2_024_partial_03_0095 := by
  native_decide

/-- Coefficient term 96 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0096 : Poly :=
[
  term ((-699598964377024284665984479369490528956 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (12, 1), (13, 2)]
]

/-- Partial product 96 for generator 3. -/
def ep_Q2_024_partial_03_0096 : Poly :=
[
  term ((-699598964377024284665984479369490528956 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 2), (5, 1), (12, 1), (13, 2)],
  term ((-699598964377024284665984479369490528956 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 2), (5, 1), (12, 1), (13, 2)],
  term ((699598964377024284665984479369490528956 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (8, 2), (12, 1), (13, 2)],
  term ((699598964377024284665984479369490528956 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (9, 2), (12, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 96 for generator 3. -/
theorem ep_Q2_024_partial_03_0096_valid :
    mulPoly ep_Q2_024_coefficient_03_0096
        ep_Q2_024_generator_03_0000_0099 =
      ep_Q2_024_partial_03_0096 := by
  native_decide

/-- Coefficient term 97 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0097 : Poly :=
[
  term ((-57065163418514028206963760297560614190626285699065528079 : Rat) / 929998952132019818504773430836265897467346423247461380) [(1, 1), (5, 1), (12, 1), (15, 2)]
]

/-- Partial product 97 for generator 3. -/
def ep_Q2_024_partial_03_0097 : Poly :=
[
  term ((-57065163418514028206963760297560614190626285699065528079 : Rat) / 929998952132019818504773430836265897467346423247461380) [(1, 1), (2, 2), (5, 1), (12, 1), (15, 2)],
  term ((-57065163418514028206963760297560614190626285699065528079 : Rat) / 929998952132019818504773430836265897467346423247461380) [(1, 1), (3, 2), (5, 1), (12, 1), (15, 2)],
  term ((57065163418514028206963760297560614190626285699065528079 : Rat) / 929998952132019818504773430836265897467346423247461380) [(1, 1), (5, 1), (8, 2), (12, 1), (15, 2)],
  term ((57065163418514028206963760297560614190626285699065528079 : Rat) / 929998952132019818504773430836265897467346423247461380) [(1, 1), (5, 1), (9, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 97 for generator 3. -/
theorem ep_Q2_024_partial_03_0097_valid :
    mulPoly ep_Q2_024_coefficient_03_0097
        ep_Q2_024_generator_03_0000_0099 =
      ep_Q2_024_partial_03_0097 := by
  native_decide

/-- Coefficient term 98 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0098 : Poly :=
[
  term ((13204414907240807 : Rat) / 1162780221153193) [(1, 1), (5, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 98 for generator 3. -/
def ep_Q2_024_partial_03_0098 : Poly :=
[
  term ((13204414907240807 : Rat) / 1162780221153193) [(1, 1), (2, 2), (5, 1), (12, 1), (15, 2), (16, 1)],
  term ((13204414907240807 : Rat) / 1162780221153193) [(1, 1), (3, 2), (5, 1), (12, 1), (15, 2), (16, 1)],
  term ((-13204414907240807 : Rat) / 1162780221153193) [(1, 1), (5, 1), (8, 2), (12, 1), (15, 2), (16, 1)],
  term ((-13204414907240807 : Rat) / 1162780221153193) [(1, 1), (5, 1), (9, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 98 for generator 3. -/
theorem ep_Q2_024_partial_03_0098_valid :
    mulPoly ep_Q2_024_coefficient_03_0098
        ep_Q2_024_generator_03_0000_0099 =
      ep_Q2_024_partial_03_0098 := by
  native_decide

/-- Coefficient term 99 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0099 : Poly :=
[
  term ((1681207212074162784866544631513075229980270038215301238 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (5, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 99 for generator 3. -/
def ep_Q2_024_partial_03_0099 : Poly :=
[
  term ((1681207212074162784866544631513075229980270038215301238 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (2, 2), (5, 1), (13, 1), (14, 1), (15, 1)],
  term ((1681207212074162784866544631513075229980270038215301238 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (3, 2), (5, 1), (13, 1), (14, 1), (15, 1)],
  term ((-1681207212074162784866544631513075229980270038215301238 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (5, 1), (8, 2), (13, 1), (14, 1), (15, 1)],
  term ((-1681207212074162784866544631513075229980270038215301238 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (5, 1), (9, 2), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 99 for generator 3. -/
theorem ep_Q2_024_partial_03_0099_valid :
    mulPoly ep_Q2_024_coefficient_03_0099
        ep_Q2_024_generator_03_0000_0099 =
      ep_Q2_024_partial_03_0099 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_024_partials_03_0000_0099 : List Poly :=
[
  ep_Q2_024_partial_03_0000,
  ep_Q2_024_partial_03_0001,
  ep_Q2_024_partial_03_0002,
  ep_Q2_024_partial_03_0003,
  ep_Q2_024_partial_03_0004,
  ep_Q2_024_partial_03_0005,
  ep_Q2_024_partial_03_0006,
  ep_Q2_024_partial_03_0007,
  ep_Q2_024_partial_03_0008,
  ep_Q2_024_partial_03_0009,
  ep_Q2_024_partial_03_0010,
  ep_Q2_024_partial_03_0011,
  ep_Q2_024_partial_03_0012,
  ep_Q2_024_partial_03_0013,
  ep_Q2_024_partial_03_0014,
  ep_Q2_024_partial_03_0015,
  ep_Q2_024_partial_03_0016,
  ep_Q2_024_partial_03_0017,
  ep_Q2_024_partial_03_0018,
  ep_Q2_024_partial_03_0019,
  ep_Q2_024_partial_03_0020,
  ep_Q2_024_partial_03_0021,
  ep_Q2_024_partial_03_0022,
  ep_Q2_024_partial_03_0023,
  ep_Q2_024_partial_03_0024,
  ep_Q2_024_partial_03_0025,
  ep_Q2_024_partial_03_0026,
  ep_Q2_024_partial_03_0027,
  ep_Q2_024_partial_03_0028,
  ep_Q2_024_partial_03_0029,
  ep_Q2_024_partial_03_0030,
  ep_Q2_024_partial_03_0031,
  ep_Q2_024_partial_03_0032,
  ep_Q2_024_partial_03_0033,
  ep_Q2_024_partial_03_0034,
  ep_Q2_024_partial_03_0035,
  ep_Q2_024_partial_03_0036,
  ep_Q2_024_partial_03_0037,
  ep_Q2_024_partial_03_0038,
  ep_Q2_024_partial_03_0039,
  ep_Q2_024_partial_03_0040,
  ep_Q2_024_partial_03_0041,
  ep_Q2_024_partial_03_0042,
  ep_Q2_024_partial_03_0043,
  ep_Q2_024_partial_03_0044,
  ep_Q2_024_partial_03_0045,
  ep_Q2_024_partial_03_0046,
  ep_Q2_024_partial_03_0047,
  ep_Q2_024_partial_03_0048,
  ep_Q2_024_partial_03_0049,
  ep_Q2_024_partial_03_0050,
  ep_Q2_024_partial_03_0051,
  ep_Q2_024_partial_03_0052,
  ep_Q2_024_partial_03_0053,
  ep_Q2_024_partial_03_0054,
  ep_Q2_024_partial_03_0055,
  ep_Q2_024_partial_03_0056,
  ep_Q2_024_partial_03_0057,
  ep_Q2_024_partial_03_0058,
  ep_Q2_024_partial_03_0059,
  ep_Q2_024_partial_03_0060,
  ep_Q2_024_partial_03_0061,
  ep_Q2_024_partial_03_0062,
  ep_Q2_024_partial_03_0063,
  ep_Q2_024_partial_03_0064,
  ep_Q2_024_partial_03_0065,
  ep_Q2_024_partial_03_0066,
  ep_Q2_024_partial_03_0067,
  ep_Q2_024_partial_03_0068,
  ep_Q2_024_partial_03_0069,
  ep_Q2_024_partial_03_0070,
  ep_Q2_024_partial_03_0071,
  ep_Q2_024_partial_03_0072,
  ep_Q2_024_partial_03_0073,
  ep_Q2_024_partial_03_0074,
  ep_Q2_024_partial_03_0075,
  ep_Q2_024_partial_03_0076,
  ep_Q2_024_partial_03_0077,
  ep_Q2_024_partial_03_0078,
  ep_Q2_024_partial_03_0079,
  ep_Q2_024_partial_03_0080,
  ep_Q2_024_partial_03_0081,
  ep_Q2_024_partial_03_0082,
  ep_Q2_024_partial_03_0083,
  ep_Q2_024_partial_03_0084,
  ep_Q2_024_partial_03_0085,
  ep_Q2_024_partial_03_0086,
  ep_Q2_024_partial_03_0087,
  ep_Q2_024_partial_03_0088,
  ep_Q2_024_partial_03_0089,
  ep_Q2_024_partial_03_0090,
  ep_Q2_024_partial_03_0091,
  ep_Q2_024_partial_03_0092,
  ep_Q2_024_partial_03_0093,
  ep_Q2_024_partial_03_0094,
  ep_Q2_024_partial_03_0095,
  ep_Q2_024_partial_03_0096,
  ep_Q2_024_partial_03_0097,
  ep_Q2_024_partial_03_0098,
  ep_Q2_024_partial_03_0099
]

/-- Sum of partial products in this block. -/
def ep_Q2_024_block_03_0000_0099 : Poly :=
[
  term ((46980075371086795400555730758678670048 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (1, 1), (2, 2), (9, 1)],
  term ((-24897008634067285794795130322114482756 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (1, 1), (2, 2), (12, 1), (13, 1)],
  term ((550464729340465184219154740052350989658090880526284951 : Rat) / 185999790426403963700954686167253179493469284649492276) [(0, 1), (1, 1), (2, 2), (12, 1), (15, 1)],
  term ((-651692520789483 : Rat) / 1162780221153193) [(0, 1), (1, 1), (2, 2), (12, 1), (15, 1), (16, 1)],
  term ((-4843289742300276851037941784721737827428 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (1, 1), (2, 2), (13, 1)],
  term ((-18282938969717093858119746698109491240188813776498753875 : Rat) / 185999790426403963700954686167253179493469284649492276) [(0, 1), (1, 1), (2, 2), (15, 1)],
  term ((35784441468531505 : Rat) / 3488340663459579) [(0, 1), (1, 1), (2, 2), (15, 1), (16, 1)],
  term ((46980075371086795400555730758678670048 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (1, 1), (3, 2), (9, 1)],
  term ((-24897008634067285794795130322114482756 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (1, 1), (3, 2), (12, 1), (13, 1)],
  term ((550464729340465184219154740052350989658090880526284951 : Rat) / 185999790426403963700954686167253179493469284649492276) [(0, 1), (1, 1), (3, 2), (12, 1), (15, 1)],
  term ((-651692520789483 : Rat) / 1162780221153193) [(0, 1), (1, 1), (3, 2), (12, 1), (15, 1), (16, 1)],
  term ((-4843289742300276851037941784721737827428 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (1, 1), (3, 2), (13, 1)],
  term ((-18282938969717093858119746698109491240188813776498753875 : Rat) / 185999790426403963700954686167253179493469284649492276) [(0, 1), (1, 1), (3, 2), (15, 1)],
  term ((35784441468531505 : Rat) / 3488340663459579) [(0, 1), (1, 1), (3, 2), (15, 1), (16, 1)],
  term ((-46980075371086795400555730758678670048 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (1, 1), (8, 2), (9, 1)],
  term ((24897008634067285794795130322114482756 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (1, 1), (8, 2), (12, 1), (13, 1)],
  term ((-550464729340465184219154740052350989658090880526284951 : Rat) / 185999790426403963700954686167253179493469284649492276) [(0, 1), (1, 1), (8, 2), (12, 1), (15, 1)],
  term ((651692520789483 : Rat) / 1162780221153193) [(0, 1), (1, 1), (8, 2), (12, 1), (15, 1), (16, 1)],
  term ((4843289742300276851037941784721737827428 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (1, 1), (8, 2), (13, 1)],
  term ((18282938969717093858119746698109491240188813776498753875 : Rat) / 185999790426403963700954686167253179493469284649492276) [(0, 1), (1, 1), (8, 2), (15, 1)],
  term ((-35784441468531505 : Rat) / 3488340663459579) [(0, 1), (1, 1), (8, 2), (15, 1), (16, 1)],
  term ((24897008634067285794795130322114482756 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (1, 1), (9, 2), (12, 1), (13, 1)],
  term ((-550464729340465184219154740052350989658090880526284951 : Rat) / 185999790426403963700954686167253179493469284649492276) [(0, 1), (1, 1), (9, 2), (12, 1), (15, 1)],
  term ((651692520789483 : Rat) / 1162780221153193) [(0, 1), (1, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((4843289742300276851037941784721737827428 : Rat) / 1799564186103715944850040292044308901985) [(0, 1), (1, 1), (9, 2), (13, 1)],
  term ((18282938969717093858119746698109491240188813776498753875 : Rat) / 185999790426403963700954686167253179493469284649492276) [(0, 1), (1, 1), (9, 2), (15, 1)],
  term ((-35784441468531505 : Rat) / 3488340663459579) [(0, 1), (1, 1), (9, 2), (15, 1), (16, 1)],
  term ((-46980075371086795400555730758678670048 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (1, 1), (9, 3)],
  term ((620018877790052386773331331077332292259 : Rat) / 239941891480495459313338705605907853598) [(0, 1), (2, 2)],
  term ((41276134642755216267924528242976248536 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (2, 2), (3, 1), (9, 1)],
  term ((195023789415967152069120310871486602252 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (2, 2), (3, 1), (13, 1)],
  term ((10669507037097572145932700518880018146640653987630543209 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (2, 2), (3, 1), (15, 1)],
  term ((-2323450189880028 : Rat) / 1162780221153193) [(0, 1), (2, 2), (3, 1), (15, 1), (16, 1)],
  term ((11821194576428649664544725351435521876 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (2, 2), (5, 1), (9, 1)],
  term ((98847255119133410978597778775627216408 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (2, 2), (5, 1), (13, 1)],
  term ((2615038360088410059841054008336388088776754313470805069 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (2, 2), (5, 1), (15, 1)],
  term ((-1180830262111028 : Rat) / 1162780221153193) [(0, 1), (2, 2), (5, 1), (15, 1), (16, 1)],
  term ((870723073074723173190931317782461097548 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (2, 2), (7, 1), (9, 1)],
  term ((49794017268134571589590260644228965512 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (2, 2), (7, 1), (12, 1), (13, 1)],
  term ((-183488243113488394739718246684116996552696960175428317 : Rat) / 92999895213201981850477343083626589746734642324746138) [(0, 1), (2, 2), (7, 1), (12, 1), (15, 1)],
  term ((434461680526322 : Rat) / 1162780221153193) [(0, 1), (2, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-241994577617827318033166200814862032728 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (2, 2), (7, 1), (13, 1)],
  term ((-2134597985326118962685167669289112352375872463958511867 : Rat) / 185999790426403963700954686167253179493469284649492276) [(0, 1), (2, 2), (7, 1), (15, 1)],
  term ((-4127059404453593 : Rat) / 1162780221153193) [(0, 1), (2, 2), (7, 1), (15, 1), (16, 1)],
  term ((1243844609397769429462846732657866526588 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (2, 2), (9, 1), (11, 1)],
  term ((-25958341366293579878171789183491304344 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (2, 2), (9, 1), (12, 1), (13, 1)],
  term ((519790077507635364246714238454931580267528154182411463 : Rat) / 464999476066009909252386715418132948733673211623730690) [(0, 1), (2, 2), (9, 1), (12, 1), (15, 1)],
  term ((-425478577289470 : Rat) / 1162780221153193) [(0, 1), (2, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((166041505019859393725937584129177270348 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (2, 2), (9, 1), (13, 1)],
  term ((47768935360192191977162658530735750073185056767546939811 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(0, 1), (2, 2), (9, 1), (15, 1)],
  term ((-5880976438022102 : Rat) / 1162780221153193) [(0, 1), (2, 2), (9, 1), (15, 1), (16, 1)],
  term ((-25822152279561751937747828166818990044 : Rat) / 119970945740247729656669352802953926799) [(0, 1), (2, 2), (9, 2)],
  term ((125546375902562723057352310471949235368 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (2, 2), (11, 1), (12, 1), (13, 1)],
  term ((-2354672508642519311643896705296101545794497755936694633 : Rat) / 464999476066009909252386715418132948733673211623730690) [(0, 1), (2, 2), (11, 1), (12, 1), (15, 1)],
  term ((1294401938342114 : Rat) / 1162780221153193) [(0, 1), (2, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((1301779206658910742012855160344299897564 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (2, 2), (11, 1), (13, 1)],
  term ((-15444171732270150869850350250675063655004807572047237039 : Rat) / 929998952132019818504773430836265897467346423247461380) [(0, 1), (2, 2), (11, 1), (15, 1)],
  term ((9729455067456383 : Rat) / 1162780221153193) [(0, 1), (2, 2), (11, 1), (15, 1), (16, 1)],
  term ((9243609330048111973130073013258126302 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (2, 2), (12, 1)],
  term ((80776032201816360897666197610026482783610529624868265581 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(0, 1), (2, 2), (12, 1), (13, 1), (15, 1)],
  term ((-4569079916135479 : Rat) / 2325560442306386) [(0, 1), (2, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-349799482188512142332992239684745264478 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (2, 2), (12, 1), (13, 2)],
  term ((-42141826090539299118196626075852698110867385870055900037 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(0, 1), (2, 2), (12, 1), (15, 2)],
  term ((9312225988977613 : Rat) / 2325560442306386) [(0, 1), (2, 2), (12, 1), (15, 2), (16, 1)],
  term ((840603606037081392433272315756537614990135019107650619 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (2, 2), (13, 1), (14, 1), (15, 1)],
  term ((416983870520476 : Rat) / 1162780221153193) [(0, 1), (2, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-871030873588004056398805260665924086282740216698965969361 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(0, 1), (2, 2), (13, 1), (15, 1)],
  term ((-59713253052701383 : Rat) / 13953362653838316) [(0, 1), (2, 2), (13, 1), (15, 1), (16, 1)],
  term ((49684067318092044303267553663585312256 : Rat) / 359912837220743188970008058408861780397) [(0, 1), (2, 2), (13, 2)],
  term ((2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (2, 2), (13, 2), (14, 1)],
  term ((13381727291793062822339033408892587364 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (2, 2), (14, 1)],
  term ((-168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (2, 2), (14, 1), (15, 2)],
  term ((-416983870520476 : Rat) / 1162780221153193) [(0, 1), (2, 2), (14, 1), (15, 2), (16, 1)],
  term ((378140816046550639901341128715218179294153440979964802061 : Rat) / 3719995808528079274019093723345063589869385692989845520) [(0, 1), (2, 2), (15, 2)],
  term ((-33123369544357749 : Rat) / 4651120884612772) [(0, 1), (2, 2), (15, 2), (16, 1)],
  term ((-41276134642755216267924528242976248536 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (3, 1), (8, 2), (9, 1)],
  term ((-195023789415967152069120310871486602252 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 1), (8, 2), (13, 1)],
  term ((-10669507037097572145932700518880018146640653987630543209 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (3, 1), (8, 2), (15, 1)],
  term ((2323450189880028 : Rat) / 1162780221153193) [(0, 1), (3, 1), (8, 2), (15, 1), (16, 1)],
  term ((-195023789415967152069120310871486602252 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 1), (9, 2), (13, 1)],
  term ((-10669507037097572145932700518880018146640653987630543209 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (3, 1), (9, 2), (15, 1)],
  term ((2323450189880028 : Rat) / 1162780221153193) [(0, 1), (3, 1), (9, 2), (15, 1), (16, 1)],
  term ((-41276134642755216267924528242976248536 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (3, 1), (9, 3)],
  term ((620018877790052386773331331077332292259 : Rat) / 239941891480495459313338705605907853598) [(0, 1), (3, 2)],
  term ((11821194576428649664544725351435521876 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 2), (5, 1), (9, 1)],
  term ((98847255119133410978597778775627216408 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 2), (5, 1), (13, 1)],
  term ((2615038360088410059841054008336388088776754313470805069 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (3, 2), (5, 1), (15, 1)],
  term ((-1180830262111028 : Rat) / 1162780221153193) [(0, 1), (3, 2), (5, 1), (15, 1), (16, 1)],
  term ((870723073074723173190931317782461097548 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 2), (7, 1), (9, 1)],
  term ((49794017268134571589590260644228965512 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 2), (7, 1), (12, 1), (13, 1)],
  term ((-183488243113488394739718246684116996552696960175428317 : Rat) / 92999895213201981850477343083626589746734642324746138) [(0, 1), (3, 2), (7, 1), (12, 1), (15, 1)],
  term ((434461680526322 : Rat) / 1162780221153193) [(0, 1), (3, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-241994577617827318033166200814862032728 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 2), (7, 1), (13, 1)],
  term ((-2134597985326118962685167669289112352375872463958511867 : Rat) / 185999790426403963700954686167253179493469284649492276) [(0, 1), (3, 2), (7, 1), (15, 1)],
  term ((-4127059404453593 : Rat) / 1162780221153193) [(0, 1), (3, 2), (7, 1), (15, 1), (16, 1)],
  term ((1243844609397769429462846732657866526588 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 2), (9, 1), (11, 1)],
  term ((-25958341366293579878171789183491304344 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 2), (9, 1), (12, 1), (13, 1)],
  term ((519790077507635364246714238454931580267528154182411463 : Rat) / 464999476066009909252386715418132948733673211623730690) [(0, 1), (3, 2), (9, 1), (12, 1), (15, 1)],
  term ((-425478577289470 : Rat) / 1162780221153193) [(0, 1), (3, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((166041505019859393725937584129177270348 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (3, 2), (9, 1), (13, 1)],
  term ((47768935360192191977162658530735750073185056767546939811 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(0, 1), (3, 2), (9, 1), (15, 1)],
  term ((-5880976438022102 : Rat) / 1162780221153193) [(0, 1), (3, 2), (9, 1), (15, 1), (16, 1)],
  term ((-25822152279561751937747828166818990044 : Rat) / 119970945740247729656669352802953926799) [(0, 1), (3, 2), (9, 2)],
  term ((125546375902562723057352310471949235368 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 2), (11, 1), (12, 1), (13, 1)],
  term ((-2354672508642519311643896705296101545794497755936694633 : Rat) / 464999476066009909252386715418132948733673211623730690) [(0, 1), (3, 2), (11, 1), (12, 1), (15, 1)],
  term ((1294401938342114 : Rat) / 1162780221153193) [(0, 1), (3, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((1301779206658910742012855160344299897564 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 2), (11, 1), (13, 1)],
  term ((-15444171732270150869850350250675063655004807572047237039 : Rat) / 929998952132019818504773430836265897467346423247461380) [(0, 1), (3, 2), (11, 1), (15, 1)],
  term ((9729455067456383 : Rat) / 1162780221153193) [(0, 1), (3, 2), (11, 1), (15, 1), (16, 1)],
  term ((9243609330048111973130073013258126302 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 2), (12, 1)],
  term ((80776032201816360897666197610026482783610529624868265581 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(0, 1), (3, 2), (12, 1), (13, 1), (15, 1)],
  term ((-4569079916135479 : Rat) / 2325560442306386) [(0, 1), (3, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-349799482188512142332992239684745264478 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 2), (12, 1), (13, 2)],
  term ((-42141826090539299118196626075852698110867385870055900037 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(0, 1), (3, 2), (12, 1), (15, 2)],
  term ((9312225988977613 : Rat) / 2325560442306386) [(0, 1), (3, 2), (12, 1), (15, 2), (16, 1)],
  term ((840603606037081392433272315756537614990135019107650619 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (3, 2), (13, 1), (14, 1), (15, 1)],
  term ((416983870520476 : Rat) / 1162780221153193) [(0, 1), (3, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-871030873588004056398805260665924086282740216698965969361 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(0, 1), (3, 2), (13, 1), (15, 1)],
  term ((-59713253052701383 : Rat) / 13953362653838316) [(0, 1), (3, 2), (13, 1), (15, 1), (16, 1)],
  term ((49684067318092044303267553663585312256 : Rat) / 359912837220743188970008058408861780397) [(0, 1), (3, 2), (13, 2)],
  term ((2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (3, 2), (13, 2), (14, 1)],
  term ((13381727291793062822339033408892587364 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 2), (14, 1)],
  term ((-168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (3, 2), (14, 1), (15, 2)],
  term ((-416983870520476 : Rat) / 1162780221153193) [(0, 1), (3, 2), (14, 1), (15, 2), (16, 1)],
  term ((378140816046550639901341128715218179294153440979964802061 : Rat) / 3719995808528079274019093723345063589869385692989845520) [(0, 1), (3, 2), (15, 2)],
  term ((-33123369544357749 : Rat) / 4651120884612772) [(0, 1), (3, 2), (15, 2), (16, 1)],
  term ((41276134642755216267924528242976248536 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (3, 3), (9, 1)],
  term ((195023789415967152069120310871486602252 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (3, 3), (13, 1)],
  term ((10669507037097572145932700518880018146640653987630543209 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (3, 3), (15, 1)],
  term ((-2323450189880028 : Rat) / 1162780221153193) [(0, 1), (3, 3), (15, 1), (16, 1)],
  term ((-11821194576428649664544725351435521876 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (5, 1), (8, 2), (9, 1)],
  term ((-98847255119133410978597778775627216408 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (5, 1), (8, 2), (13, 1)],
  term ((-2615038360088410059841054008336388088776754313470805069 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (5, 1), (8, 2), (15, 1)],
  term ((1180830262111028 : Rat) / 1162780221153193) [(0, 1), (5, 1), (8, 2), (15, 1), (16, 1)],
  term ((-98847255119133410978597778775627216408 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (5, 1), (9, 2), (13, 1)],
  term ((-2615038360088410059841054008336388088776754313470805069 : Rat) / 232499738033004954626193357709066474366836605811865345) [(0, 1), (5, 1), (9, 2), (15, 1)],
  term ((1180830262111028 : Rat) / 1162780221153193) [(0, 1), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((-11821194576428649664544725351435521876 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (5, 1), (9, 3)],
  term ((-870723073074723173190931317782461097548 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (8, 2), (9, 1)],
  term ((-49794017268134571589590260644228965512 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (8, 2), (12, 1), (13, 1)],
  term ((183488243113488394739718246684116996552696960175428317 : Rat) / 92999895213201981850477343083626589746734642324746138) [(0, 1), (7, 1), (8, 2), (12, 1), (15, 1)],
  term ((-434461680526322 : Rat) / 1162780221153193) [(0, 1), (7, 1), (8, 2), (12, 1), (15, 1), (16, 1)],
  term ((241994577617827318033166200814862032728 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (8, 2), (13, 1)],
  term ((2134597985326118962685167669289112352375872463958511867 : Rat) / 185999790426403963700954686167253179493469284649492276) [(0, 1), (7, 1), (8, 2), (15, 1)],
  term ((4127059404453593 : Rat) / 1162780221153193) [(0, 1), (7, 1), (8, 2), (15, 1), (16, 1)],
  term ((-49794017268134571589590260644228965512 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (9, 2), (12, 1), (13, 1)],
  term ((183488243113488394739718246684116996552696960175428317 : Rat) / 92999895213201981850477343083626589746734642324746138) [(0, 1), (7, 1), (9, 2), (12, 1), (15, 1)],
  term ((-434461680526322 : Rat) / 1162780221153193) [(0, 1), (7, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((241994577617827318033166200814862032728 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (9, 2), (13, 1)],
  term ((2134597985326118962685167669289112352375872463958511867 : Rat) / 185999790426403963700954686167253179493469284649492276) [(0, 1), (7, 1), (9, 2), (15, 1)],
  term ((4127059404453593 : Rat) / 1162780221153193) [(0, 1), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((-870723073074723173190931317782461097548 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (7, 1), (9, 3)],
  term ((-620018877790052386773331331077332292259 : Rat) / 239941891480495459313338705605907853598) [(0, 1), (8, 2)],
  term ((-1243844609397769429462846732657866526588 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (8, 2), (9, 1), (11, 1)],
  term ((25958341366293579878171789183491304344 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (8, 2), (9, 1), (12, 1), (13, 1)],
  term ((-519790077507635364246714238454931580267528154182411463 : Rat) / 464999476066009909252386715418132948733673211623730690) [(0, 1), (8, 2), (9, 1), (12, 1), (15, 1)],
  term ((425478577289470 : Rat) / 1162780221153193) [(0, 1), (8, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-166041505019859393725937584129177270348 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (8, 2), (9, 1), (13, 1)],
  term ((-47768935360192191977162658530735750073185056767546939811 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(0, 1), (8, 2), (9, 1), (15, 1)],
  term ((5880976438022102 : Rat) / 1162780221153193) [(0, 1), (8, 2), (9, 1), (15, 1), (16, 1)],
  term ((25822152279561751937747828166818990044 : Rat) / 119970945740247729656669352802953926799) [(0, 1), (8, 2), (9, 2)],
  term ((-125546375902562723057352310471949235368 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (8, 2), (11, 1), (12, 1), (13, 1)],
  term ((2354672508642519311643896705296101545794497755936694633 : Rat) / 464999476066009909252386715418132948733673211623730690) [(0, 1), (8, 2), (11, 1), (12, 1), (15, 1)],
  term ((-1294401938342114 : Rat) / 1162780221153193) [(0, 1), (8, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1301779206658910742012855160344299897564 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (8, 2), (11, 1), (13, 1)],
  term ((15444171732270150869850350250675063655004807572047237039 : Rat) / 929998952132019818504773430836265897467346423247461380) [(0, 1), (8, 2), (11, 1), (15, 1)],
  term ((-9729455067456383 : Rat) / 1162780221153193) [(0, 1), (8, 2), (11, 1), (15, 1), (16, 1)],
  term ((-9243609330048111973130073013258126302 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (8, 2), (12, 1)],
  term ((-80776032201816360897666197610026482783610529624868265581 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(0, 1), (8, 2), (12, 1), (13, 1), (15, 1)],
  term ((4569079916135479 : Rat) / 2325560442306386) [(0, 1), (8, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((349799482188512142332992239684745264478 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (8, 2), (12, 1), (13, 2)],
  term ((42141826090539299118196626075852698110867385870055900037 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(0, 1), (8, 2), (12, 1), (15, 2)],
  term ((-9312225988977613 : Rat) / 2325560442306386) [(0, 1), (8, 2), (12, 1), (15, 2), (16, 1)],
  term ((-840603606037081392433272315756537614990135019107650619 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (8, 2), (13, 1), (14, 1), (15, 1)],
  term ((-416983870520476 : Rat) / 1162780221153193) [(0, 1), (8, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((871030873588004056398805260665924086282740216698965969361 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(0, 1), (8, 2), (13, 1), (15, 1)],
  term ((59713253052701383 : Rat) / 13953362653838316) [(0, 1), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((-49684067318092044303267553663585312256 : Rat) / 359912837220743188970008058408861780397) [(0, 1), (8, 2), (13, 2)],
  term ((-2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (8, 2), (13, 2), (14, 1)],
  term ((-13381727291793062822339033408892587364 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (8, 2), (14, 1)],
  term ((168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (8, 2), (14, 1), (15, 2)],
  term ((416983870520476 : Rat) / 1162780221153193) [(0, 1), (8, 2), (14, 1), (15, 2), (16, 1)],
  term ((-378140816046550639901341128715218179294153440979964802061 : Rat) / 3719995808528079274019093723345063589869385692989845520) [(0, 1), (8, 2), (15, 2)],
  term ((33123369544357749 : Rat) / 4651120884612772) [(0, 1), (8, 2), (15, 2), (16, 1)],
  term ((-620018877790052386773331331077332292259 : Rat) / 239941891480495459313338705605907853598) [(0, 1), (9, 2)],
  term ((-125546375902562723057352310471949235368 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 2), (11, 1), (12, 1), (13, 1)],
  term ((2354672508642519311643896705296101545794497755936694633 : Rat) / 464999476066009909252386715418132948733673211623730690) [(0, 1), (9, 2), (11, 1), (12, 1), (15, 1)],
  term ((-1294401938342114 : Rat) / 1162780221153193) [(0, 1), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1301779206658910742012855160344299897564 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 2), (11, 1), (13, 1)],
  term ((15444171732270150869850350250675063655004807572047237039 : Rat) / 929998952132019818504773430836265897467346423247461380) [(0, 1), (9, 2), (11, 1), (15, 1)],
  term ((-9729455067456383 : Rat) / 1162780221153193) [(0, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-9243609330048111973130073013258126302 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (9, 2), (12, 1)],
  term ((-80776032201816360897666197610026482783610529624868265581 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(0, 1), (9, 2), (12, 1), (13, 1), (15, 1)],
  term ((4569079916135479 : Rat) / 2325560442306386) [(0, 1), (9, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((349799482188512142332992239684745264478 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 2), (12, 1), (13, 2)],
  term ((42141826090539299118196626075852698110867385870055900037 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(0, 1), (9, 2), (12, 1), (15, 2)],
  term ((-9312225988977613 : Rat) / 2325560442306386) [(0, 1), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((-840603606037081392433272315756537614990135019107650619 : Rat) / 697499214099014863878580073127199423100509817435596035) [(0, 1), (9, 2), (13, 1), (14, 1), (15, 1)],
  term ((-416983870520476 : Rat) / 1162780221153193) [(0, 1), (9, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((871030873588004056398805260665924086282740216698965969361 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(0, 1), (9, 2), (13, 1), (15, 1)],
  term ((59713253052701383 : Rat) / 13953362653838316) [(0, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-49684067318092044303267553663585312256 : Rat) / 359912837220743188970008058408861780397) [(0, 1), (9, 2), (13, 2)],
  term ((-2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 2), (13, 2), (14, 1)],
  term ((-13381727291793062822339033408892587364 : Rat) / 199951576233746216094448921338256544665) [(0, 1), (9, 2), (14, 1)],
  term ((168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(0, 1), (9, 2), (14, 1), (15, 2)],
  term ((416983870520476 : Rat) / 1162780221153193) [(0, 1), (9, 2), (14, 1), (15, 2), (16, 1)],
  term ((-378140816046550639901341128715218179294153440979964802061 : Rat) / 3719995808528079274019093723345063589869385692989845520) [(0, 1), (9, 2), (15, 2)],
  term ((33123369544357749 : Rat) / 4651120884612772) [(0, 1), (9, 2), (15, 2), (16, 1)],
  term ((-1243844609397769429462846732657866526588 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 3), (11, 1)],
  term ((25958341366293579878171789183491304344 : Rat) / 599854728701238648283346764014769633995) [(0, 1), (9, 3), (12, 1), (13, 1)],
  term ((-519790077507635364246714238454931580267528154182411463 : Rat) / 464999476066009909252386715418132948733673211623730690) [(0, 1), (9, 3), (12, 1), (15, 1)],
  term ((425478577289470 : Rat) / 1162780221153193) [(0, 1), (9, 3), (12, 1), (15, 1), (16, 1)],
  term ((-166041505019859393725937584129177270348 : Rat) / 39990315246749243218889784267651308933) [(0, 1), (9, 3), (13, 1)],
  term ((-47768935360192191977162658530735750073185056767546939811 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(0, 1), (9, 3), (15, 1)],
  term ((5880976438022102 : Rat) / 1162780221153193) [(0, 1), (9, 3), (15, 1), (16, 1)],
  term ((25822152279561751937747828166818990044 : Rat) / 119970945740247729656669352802953926799) [(0, 1), (9, 4)],
  term ((2140544576806429585465573269128715080 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (2, 1), (3, 1), (8, 2)],
  term ((2140544576806429585465573269128715080 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (2, 1), (3, 1), (9, 2)],
  term ((-1089174789518067368825554324911160015476 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 1), (3, 2), (9, 1)],
  term ((24897008634067285794795130322114482756 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (3, 2), (12, 1), (13, 1)],
  term ((-183488243113488394739718246684116996552696960175428317 : Rat) / 185999790426403963700954686167253179493469284649492276) [(1, 1), (2, 1), (3, 2), (12, 1), (15, 1)],
  term ((217230840263161 : Rat) / 1162780221153193) [(1, 1), (2, 1), (3, 2), (12, 1), (15, 1), (16, 1)],
  term ((-672896789764989056308682593313834106604 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (3, 2), (13, 1)],
  term ((83274961275595767083854644591474693698433734006356255887 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(1, 1), (2, 1), (3, 2), (15, 1)],
  term ((-13616139087263447 : Rat) / 2325560442306386) [(1, 1), (2, 1), (3, 2), (15, 1), (16, 1)],
  term ((-2140544576806429585465573269128715080 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (2, 1), (3, 3)],
  term ((1089174789518067368825554324911160015476 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 1), (8, 2), (9, 1)],
  term ((-24897008634067285794795130322114482756 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (8, 2), (12, 1), (13, 1)],
  term ((183488243113488394739718246684116996552696960175428317 : Rat) / 185999790426403963700954686167253179493469284649492276) [(1, 1), (2, 1), (8, 2), (12, 1), (15, 1)],
  term ((-217230840263161 : Rat) / 1162780221153193) [(1, 1), (2, 1), (8, 2), (12, 1), (15, 1), (16, 1)],
  term ((672896789764989056308682593313834106604 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (8, 2), (13, 1)],
  term ((-83274961275595767083854644591474693698433734006356255887 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(1, 1), (2, 1), (8, 2), (15, 1)],
  term ((13616139087263447 : Rat) / 2325560442306386) [(1, 1), (2, 1), (8, 2), (15, 1), (16, 1)],
  term ((-24897008634067285794795130322114482756 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (9, 2), (12, 1), (13, 1)],
  term ((183488243113488394739718246684116996552696960175428317 : Rat) / 185999790426403963700954686167253179493469284649492276) [(1, 1), (2, 1), (9, 2), (12, 1), (15, 1)],
  term ((-217230840263161 : Rat) / 1162780221153193) [(1, 1), (2, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((672896789764989056308682593313834106604 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 1), (9, 2), (13, 1)],
  term ((-83274961275595767083854644591474693698433734006356255887 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(1, 1), (2, 1), (9, 2), (15, 1)],
  term ((13616139087263447 : Rat) / 2325560442306386) [(1, 1), (2, 1), (9, 2), (15, 1), (16, 1)],
  term ((1089174789518067368825554324911160015476 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 1), (9, 3)],
  term ((315758814253318183574532856800326951347 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (2, 2), (3, 1)],
  term ((1465074617356825556565339743900656045508 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 2), (3, 1), (4, 1)],
  term ((170578982941464836661692016476078734824 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 2), (3, 1), (5, 1), (9, 1)],
  term ((599775112895054325538362237752226839024 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 2), (3, 1), (5, 1), (13, 1)],
  term ((-184656524631467365497145319680970267514181261970516034 : Rat) / 46499947606600990925238671541813294873367321162373069) [(1, 1), (2, 2), (3, 1), (5, 1), (15, 1)],
  term ((-5548675726232856 : Rat) / 1162780221153193) [(1, 1), (2, 2), (3, 1), (5, 1), (15, 1), (16, 1)],
  term ((-826347564150239326187536952436868474864 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 2), (3, 1), (8, 1)],
  term ((39137400746849611463101820854253627952 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (2, 2), (3, 1), (9, 1), (13, 1)],
  term ((-3758154407096922852572289538910856139432184544821245171 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(1, 1), (2, 2), (3, 1), (9, 1), (15, 1)],
  term ((1868935561931170 : Rat) / 1162780221153193) [(1, 1), (2, 2), (3, 1), (9, 1), (15, 1), (16, 1)],
  term ((31556266093234973165652571965850210528 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (2, 2), (3, 1), (9, 2)],
  term ((-89950247204447483722066909092463307858 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 2), (3, 1), (12, 1)],
  term ((83775503443212770909169223229504540576 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 2), (3, 1), (12, 1), (13, 1), (15, 1)],
  term ((-2430959375450672057935765985789364740848990716162226488 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (2, 2), (3, 1), (12, 1), (15, 2)],
  term ((3301512817454880 : Rat) / 1162780221153193) [(1, 1), (2, 2), (3, 1), (12, 1), (15, 2), (16, 1)],
  term ((-66386162981800750972229373751762779606788322410259643073 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(1, 1), (2, 2), (3, 1), (13, 1), (15, 1)],
  term ((181622001380355 : Rat) / 1162780221153193) [(1, 1), (2, 2), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((24285619430674572789347187379892301356 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 2), (3, 1), (13, 2)],
  term ((-582061027275376329967414115123588817349 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 2), (3, 1), (14, 1)],
  term ((70948174341627961681154461217303502179064002203768041167 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(1, 1), (2, 2), (3, 1), (15, 2)],
  term ((6185531098898219 : Rat) / 1162780221153193) [(1, 1), (2, 2), (3, 1), (15, 2), (16, 1)],
  term ((-1465074617356825556565339743900656045508 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (2, 2), (4, 1), (9, 1)],
  term ((781230546615652314315611763365815318071 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 2), (5, 1)],
  term ((-51916682732587159756343578366982608688 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 2), (5, 1), (9, 1), (12, 1), (13, 1)],
  term ((519790077507635364246714238454931580267528154182411463 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (2, 2), (5, 1), (9, 1), (12, 1), (15, 1)],
  term ((-850957154578940 : Rat) / 1162780221153193) [(1, 1), (2, 2), (5, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((866161346976921729008869342799551372232 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (2, 2), (5, 1), (9, 1), (13, 1)],
  term ((24311462327325841715821792273981411838734259987160207707 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (2, 2), (5, 1), (9, 1), (15, 1)],
  term ((-35421006354003964 : Rat) / 3488340663459579) [(1, 1), (2, 2), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((-952743145992012822131987741397365806328 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 2), (5, 1), (9, 2)],
  term ((18487218660096223946260146026516252604 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 2), (5, 1), (12, 1)],
  term ((16527737784929168061123148869963794329901925980398052713 : Rat) / 557999371279211891102864058501759538480407853948476828) [(1, 1), (2, 2), (5, 1), (12, 1), (13, 1), (15, 1)],
  term ((-4569079916135479 : Rat) / 1162780221153193) [(1, 1), (2, 2), (5, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-699598964377024284665984479369490528956 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 2), (5, 1), (12, 1), (13, 2)],
  term ((-57065163418514028206963760297560614190626285699065528079 : Rat) / 929998952132019818504773430836265897467346423247461380) [(1, 1), (2, 2), (5, 1), (12, 1), (15, 2)],
  term ((13204414907240807 : Rat) / 1162780221153193) [(1, 1), (2, 2), (5, 1), (12, 1), (15, 2), (16, 1)],
  term ((1681207212074162784866544631513075229980270038215301238 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (2, 2), (5, 1), (13, 1), (14, 1), (15, 1)],
  term ((-2140544576806429585465573269128715080 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (2, 3), (3, 1)],
  term ((-1089174789518067368825554324911160015476 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 3), (9, 1)],
  term ((24897008634067285794795130322114482756 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 3), (12, 1), (13, 1)],
  term ((-183488243113488394739718246684116996552696960175428317 : Rat) / 185999790426403963700954686167253179493469284649492276) [(1, 1), (2, 3), (12, 1), (15, 1)],
  term ((217230840263161 : Rat) / 1162780221153193) [(1, 1), (2, 3), (12, 1), (15, 1), (16, 1)],
  term ((-672896789764989056308682593313834106604 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 3), (13, 1)],
  term ((83274961275595767083854644591474693698433734006356255887 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(1, 1), (2, 3), (15, 1)],
  term ((-13616139087263447 : Rat) / 2325560442306386) [(1, 1), (2, 3), (15, 1), (16, 1)],
  term ((-1465074617356825556565339743900656045508 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (4, 1), (8, 2)],
  term ((-1465074617356825556565339743900656045508 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (4, 1), (9, 2)],
  term ((-170578982941464836661692016476078734824 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (5, 1), (8, 2), (9, 1)],
  term ((-599775112895054325538362237752226839024 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (5, 1), (8, 2), (13, 1)],
  term ((184656524631467365497145319680970267514181261970516034 : Rat) / 46499947606600990925238671541813294873367321162373069) [(1, 1), (3, 1), (5, 1), (8, 2), (15, 1)],
  term ((5548675726232856 : Rat) / 1162780221153193) [(1, 1), (3, 1), (5, 1), (8, 2), (15, 1), (16, 1)],
  term ((-599775112895054325538362237752226839024 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (5, 1), (9, 2), (13, 1)],
  term ((184656524631467365497145319680970267514181261970516034 : Rat) / 46499947606600990925238671541813294873367321162373069) [(1, 1), (3, 1), (5, 1), (9, 2), (15, 1)],
  term ((5548675726232856 : Rat) / 1162780221153193) [(1, 1), (3, 1), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((-170578982941464836661692016476078734824 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (5, 1), (9, 3)],
  term ((826347564150239326187536952436868474864 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (8, 1), (9, 2)],
  term ((-315758814253318183574532856800326951347 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (3, 1), (8, 2)],
  term ((-39137400746849611463101820854253627952 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (3, 1), (8, 2), (9, 1), (13, 1)],
  term ((3758154407096922852572289538910856139432184544821245171 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(1, 1), (3, 1), (8, 2), (9, 1), (15, 1)],
  term ((-1868935561931170 : Rat) / 1162780221153193) [(1, 1), (3, 1), (8, 2), (9, 1), (15, 1), (16, 1)],
  term ((-31556266093234973165652571965850210528 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (3, 1), (8, 2), (9, 2)],
  term ((89950247204447483722066909092463307858 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (8, 2), (12, 1)],
  term ((-83775503443212770909169223229504540576 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (8, 2), (12, 1), (13, 1), (15, 1)],
  term ((2430959375450672057935765985789364740848990716162226488 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (3, 1), (8, 2), (12, 1), (15, 2)],
  term ((-3301512817454880 : Rat) / 1162780221153193) [(1, 1), (3, 1), (8, 2), (12, 1), (15, 2), (16, 1)],
  term ((66386162981800750972229373751762779606788322410259643073 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(1, 1), (3, 1), (8, 2), (13, 1), (15, 1)],
  term ((-181622001380355 : Rat) / 1162780221153193) [(1, 1), (3, 1), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((-24285619430674572789347187379892301356 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (8, 2), (13, 2)],
  term ((582061027275376329967414115123588817349 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (8, 2), (14, 1)],
  term ((-70948174341627961681154461217303502179064002203768041167 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(1, 1), (3, 1), (8, 2), (15, 2)],
  term ((-6185531098898219 : Rat) / 1162780221153193) [(1, 1), (3, 1), (8, 2), (15, 2), (16, 1)],
  term ((826347564150239326187536952436868474864 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (8, 3)],
  term ((-315758814253318183574532856800326951347 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (3, 1), (9, 2)],
  term ((89950247204447483722066909092463307858 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (9, 2), (12, 1)],
  term ((-83775503443212770909169223229504540576 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 1), (9, 2), (12, 1), (13, 1), (15, 1)],
  term ((2430959375450672057935765985789364740848990716162226488 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (3, 1), (9, 2), (12, 1), (15, 2)],
  term ((-3301512817454880 : Rat) / 1162780221153193) [(1, 1), (3, 1), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((66386162981800750972229373751762779606788322410259643073 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(1, 1), (3, 1), (9, 2), (13, 1), (15, 1)],
  term ((-181622001380355 : Rat) / 1162780221153193) [(1, 1), (3, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-24285619430674572789347187379892301356 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (9, 2), (13, 2)],
  term ((582061027275376329967414115123588817349 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 1), (9, 2), (14, 1)],
  term ((-70948174341627961681154461217303502179064002203768041167 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(1, 1), (3, 1), (9, 2), (15, 2)],
  term ((-6185531098898219 : Rat) / 1162780221153193) [(1, 1), (3, 1), (9, 2), (15, 2), (16, 1)],
  term ((-39137400746849611463101820854253627952 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (3, 1), (9, 3), (13, 1)],
  term ((3758154407096922852572289538910856139432184544821245171 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(1, 1), (3, 1), (9, 3), (15, 1)],
  term ((-1868935561931170 : Rat) / 1162780221153193) [(1, 1), (3, 1), (9, 3), (15, 1), (16, 1)],
  term ((-31556266093234973165652571965850210528 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (3, 1), (9, 4)],
  term ((-1465074617356825556565339743900656045508 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (3, 2), (4, 1), (9, 1)],
  term ((781230546615652314315611763365815318071 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 2), (5, 1)],
  term ((-51916682732587159756343578366982608688 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 2), (5, 1), (9, 1), (12, 1), (13, 1)],
  term ((519790077507635364246714238454931580267528154182411463 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (3, 2), (5, 1), (9, 1), (12, 1), (15, 1)],
  term ((-850957154578940 : Rat) / 1162780221153193) [(1, 1), (3, 2), (5, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((866161346976921729008869342799551372232 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (3, 2), (5, 1), (9, 1), (13, 1)],
  term ((24311462327325841715821792273981411838734259987160207707 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (3, 2), (5, 1), (9, 1), (15, 1)],
  term ((-35421006354003964 : Rat) / 3488340663459579) [(1, 1), (3, 2), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((-952743145992012822131987741397365806328 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 2), (5, 1), (9, 2)],
  term ((18487218660096223946260146026516252604 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 2), (5, 1), (12, 1)],
  term ((16527737784929168061123148869963794329901925980398052713 : Rat) / 557999371279211891102864058501759538480407853948476828) [(1, 1), (3, 2), (5, 1), (12, 1), (13, 1), (15, 1)],
  term ((-4569079916135479 : Rat) / 1162780221153193) [(1, 1), (3, 2), (5, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-699598964377024284665984479369490528956 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 2), (5, 1), (12, 1), (13, 2)],
  term ((-57065163418514028206963760297560614190626285699065528079 : Rat) / 929998952132019818504773430836265897467346423247461380) [(1, 1), (3, 2), (5, 1), (12, 1), (15, 2)],
  term ((13204414907240807 : Rat) / 1162780221153193) [(1, 1), (3, 2), (5, 1), (12, 1), (15, 2), (16, 1)],
  term ((1681207212074162784866544631513075229980270038215301238 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (3, 2), (5, 1), (13, 1), (14, 1), (15, 1)],
  term ((315758814253318183574532856800326951347 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (3, 3)],
  term ((1465074617356825556565339743900656045508 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 3), (4, 1)],
  term ((170578982941464836661692016476078734824 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 3), (5, 1), (9, 1)],
  term ((599775112895054325538362237752226839024 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 3), (5, 1), (13, 1)],
  term ((-184656524631467365497145319680970267514181261970516034 : Rat) / 46499947606600990925238671541813294873367321162373069) [(1, 1), (3, 3), (5, 1), (15, 1)],
  term ((-5548675726232856 : Rat) / 1162780221153193) [(1, 1), (3, 3), (5, 1), (15, 1), (16, 1)],
  term ((-826347564150239326187536952436868474864 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 3), (8, 1)],
  term ((39137400746849611463101820854253627952 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (3, 3), (9, 1), (13, 1)],
  term ((-3758154407096922852572289538910856139432184544821245171 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(1, 1), (3, 3), (9, 1), (15, 1)],
  term ((1868935561931170 : Rat) / 1162780221153193) [(1, 1), (3, 3), (9, 1), (15, 1), (16, 1)],
  term ((31556266093234973165652571965850210528 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (3, 3), (9, 2)],
  term ((-89950247204447483722066909092463307858 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 3), (12, 1)],
  term ((83775503443212770909169223229504540576 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 3), (12, 1), (13, 1), (15, 1)],
  term ((-2430959375450672057935765985789364740848990716162226488 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (3, 3), (12, 1), (15, 2)],
  term ((3301512817454880 : Rat) / 1162780221153193) [(1, 1), (3, 3), (12, 1), (15, 2), (16, 1)],
  term ((-66386162981800750972229373751762779606788322410259643073 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(1, 1), (3, 3), (13, 1), (15, 1)],
  term ((181622001380355 : Rat) / 1162780221153193) [(1, 1), (3, 3), (13, 1), (15, 1), (16, 1)],
  term ((24285619430674572789347187379892301356 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 3), (13, 2)],
  term ((-582061027275376329967414115123588817349 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 3), (14, 1)],
  term ((70948174341627961681154461217303502179064002203768041167 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(1, 1), (3, 3), (15, 2)],
  term ((6185531098898219 : Rat) / 1162780221153193) [(1, 1), (3, 3), (15, 2), (16, 1)],
  term ((1465074617356825556565339743900656045508 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (4, 1), (8, 2), (9, 1)],
  term ((1465074617356825556565339743900656045508 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (4, 1), (9, 3)],
  term ((-781230546615652314315611763365815318071 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (8, 2)],
  term ((51916682732587159756343578366982608688 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (8, 2), (9, 1), (12, 1), (13, 1)],
  term ((-519790077507635364246714238454931580267528154182411463 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (5, 1), (8, 2), (9, 1), (12, 1), (15, 1)],
  term ((850957154578940 : Rat) / 1162780221153193) [(1, 1), (5, 1), (8, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-866161346976921729008869342799551372232 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (5, 1), (8, 2), (9, 1), (13, 1)],
  term ((-24311462327325841715821792273981411838734259987160207707 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (5, 1), (8, 2), (9, 1), (15, 1)],
  term ((35421006354003964 : Rat) / 3488340663459579) [(1, 1), (5, 1), (8, 2), (9, 1), (15, 1), (16, 1)],
  term ((952743145992012822131987741397365806328 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (8, 2), (9, 2)],
  term ((-18487218660096223946260146026516252604 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (8, 2), (12, 1)],
  term ((-16527737784929168061123148869963794329901925980398052713 : Rat) / 557999371279211891102864058501759538480407853948476828) [(1, 1), (5, 1), (8, 2), (12, 1), (13, 1), (15, 1)],
  term ((4569079916135479 : Rat) / 1162780221153193) [(1, 1), (5, 1), (8, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((699598964377024284665984479369490528956 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (8, 2), (12, 1), (13, 2)],
  term ((57065163418514028206963760297560614190626285699065528079 : Rat) / 929998952132019818504773430836265897467346423247461380) [(1, 1), (5, 1), (8, 2), (12, 1), (15, 2)],
  term ((-13204414907240807 : Rat) / 1162780221153193) [(1, 1), (5, 1), (8, 2), (12, 1), (15, 2), (16, 1)],
  term ((-1681207212074162784866544631513075229980270038215301238 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (5, 1), (8, 2), (13, 1), (14, 1), (15, 1)],
  term ((-781230546615652314315611763365815318071 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (9, 2)],
  term ((-18487218660096223946260146026516252604 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (9, 2), (12, 1)],
  term ((-16527737784929168061123148869963794329901925980398052713 : Rat) / 557999371279211891102864058501759538480407853948476828) [(1, 1), (5, 1), (9, 2), (12, 1), (13, 1), (15, 1)],
  term ((4569079916135479 : Rat) / 1162780221153193) [(1, 1), (5, 1), (9, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((699598964377024284665984479369490528956 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (9, 2), (12, 1), (13, 2)],
  term ((57065163418514028206963760297560614190626285699065528079 : Rat) / 929998952132019818504773430836265897467346423247461380) [(1, 1), (5, 1), (9, 2), (12, 1), (15, 2)],
  term ((-13204414907240807 : Rat) / 1162780221153193) [(1, 1), (5, 1), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((-1681207212074162784866544631513075229980270038215301238 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (5, 1), (9, 2), (13, 1), (14, 1), (15, 1)],
  term ((51916682732587159756343578366982608688 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (9, 3), (12, 1), (13, 1)],
  term ((-519790077507635364246714238454931580267528154182411463 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (5, 1), (9, 3), (12, 1), (15, 1)],
  term ((850957154578940 : Rat) / 1162780221153193) [(1, 1), (5, 1), (9, 3), (12, 1), (15, 1), (16, 1)],
  term ((-866161346976921729008869342799551372232 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (5, 1), (9, 3), (13, 1)],
  term ((-24311462327325841715821792273981411838734259987160207707 : Rat) / 232499738033004954626193357709066474366836605811865345) [(1, 1), (5, 1), (9, 3), (15, 1)],
  term ((35421006354003964 : Rat) / 3488340663459579) [(1, 1), (5, 1), (9, 3), (15, 1), (16, 1)],
  term ((952743145992012822131987741397365806328 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (9, 4)],
  term ((-4813427164942288903845205437181808436889 : Rat) / 7198256744414863779400161168177235607940) [(2, 2)],
  term ((-4813427164942288903845205437181808436889 : Rat) / 7198256744414863779400161168177235607940) [(3, 2)],
  term ((4813427164942288903845205437181808436889 : Rat) / 7198256744414863779400161168177235607940) [(8, 2)],
  term ((4813427164942288903845205437181808436889 : Rat) / 7198256744414863779400161168177235607940) [(9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 3, terms 0 through 99. -/
theorem ep_Q2_024_block_03_0000_0099_valid :
    checkProductSumEq ep_Q2_024_partials_03_0000_0099
      ep_Q2_024_block_03_0000_0099 = true := by
  native_decide

end EpQ2024TermShards

end Patterns

end EndpointCertificate

end Problem97
