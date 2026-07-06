/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_024, term block 15:1000-1099

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_024`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2024TermShards

/-- Generator polynomial 15 for endpoint certificate `ep_Q2_024`. -/
def ep_Q2_024_generator_15_1000_1099 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(6, 1)]
]

/-- Coefficient term 1000 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1000 : Poly :=
[
  term ((-1276613481018839 : Rat) / 3488340663459579) [(2, 2), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 1000 for generator 15. -/
def ep_Q2_024_partial_15_1000 : Poly :=
[
  term ((-2553226962037678 : Rat) / 3488340663459579) [(2, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((1276613481018839 : Rat) / 3488340663459579) [(2, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1000 for generator 15. -/
theorem ep_Q2_024_partial_15_1000_valid :
    mulPoly ep_Q2_024_coefficient_15_1000
        ep_Q2_024_generator_15_1000_1099 =
      ep_Q2_024_partial_15_1000 := by
  native_decide

/-- Coefficient term 1001 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1001 : Poly :=
[
  term ((-260035784543783065491570442772842309720 : Rat) / 119970945740247729656669352802953926799) [(2, 2), (9, 2)]
]

/-- Partial product 1001 for generator 15. -/
def ep_Q2_024_partial_15_1001 : Poly :=
[
  term ((-520071569087566130983140885545684619440 : Rat) / 119970945740247729656669352802953926799) [(2, 2), (6, 1), (9, 2)],
  term ((260035784543783065491570442772842309720 : Rat) / 119970945740247729656669352802953926799) [(2, 2), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1001 for generator 15. -/
theorem ep_Q2_024_partial_15_1001_valid :
    mulPoly ep_Q2_024_coefficient_15_1001
        ep_Q2_024_generator_15_1000_1099 =
      ep_Q2_024_partial_15_1001 := by
  native_decide

/-- Coefficient term 1002 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1002 : Poly :=
[
  term ((2140544576806429585465573269128715080 : Rat) / 39990315246749243218889784267651308933) [(2, 2), (12, 1)]
]

/-- Partial product 1002 for generator 15. -/
def ep_Q2_024_partial_15_1002 : Poly :=
[
  term ((4281089153612859170931146538257430160 : Rat) / 39990315246749243218889784267651308933) [(2, 2), (6, 1), (12, 1)],
  term ((-2140544576806429585465573269128715080 : Rat) / 39990315246749243218889784267651308933) [(2, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1002 for generator 15. -/
theorem ep_Q2_024_partial_15_1002_valid :
    mulPoly ep_Q2_024_coefficient_15_1002
        ep_Q2_024_generator_15_1000_1099 =
      ep_Q2_024_partial_15_1002 := by
  native_decide

/-- Coefficient term 1003 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1003 : Poly :=
[
  term ((5752536982199761423124935523247869048926344288525960482 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 2), (13, 1), (15, 1)]
]

/-- Partial product 1003 for generator 15. -/
def ep_Q2_024_partial_15_1003 : Poly :=
[
  term ((11505073964399522846249871046495738097852688577051920964 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 2), (6, 1), (13, 1), (15, 1)],
  term ((-5752536982199761423124935523247869048926344288525960482 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1003 for generator 15. -/
theorem ep_Q2_024_partial_15_1003_valid :
    mulPoly ep_Q2_024_coefficient_15_1003
        ep_Q2_024_generator_15_1000_1099 =
      ep_Q2_024_partial_15_1003 := by
  native_decide

/-- Coefficient term 1004 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1004 : Poly :=
[
  term ((-75330592794360 : Rat) / 1162780221153193) [(2, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1004 for generator 15. -/
def ep_Q2_024_partial_15_1004 : Poly :=
[
  term ((-150661185588720 : Rat) / 1162780221153193) [(2, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((75330592794360 : Rat) / 1162780221153193) [(2, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1004 for generator 15. -/
theorem ep_Q2_024_partial_15_1004_valid :
    mulPoly ep_Q2_024_coefficient_15_1004
        ep_Q2_024_generator_15_1000_1099 =
      ep_Q2_024_partial_15_1004 := by
  native_decide

/-- Coefficient term 1005 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1005 : Poly :=
[
  term ((-40472928056033817116049120031239046672 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (13, 2)]
]

/-- Partial product 1005 for generator 15. -/
def ep_Q2_024_partial_15_1005 : Poly :=
[
  term ((-80945856112067634232098240062478093344 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (6, 1), (13, 2)],
  term ((40472928056033817116049120031239046672 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1005 for generator 15. -/
theorem ep_Q2_024_partial_15_1005_valid :
    mulPoly ep_Q2_024_coefficient_15_1005
        ep_Q2_024_generator_15_1000_1099 =
      ep_Q2_024_partial_15_1005 := by
  native_decide

/-- Coefficient term 1006 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1006 : Poly :=
[
  term ((-8921151527862041881559355605928391576 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (14, 1)]
]

/-- Partial product 1006 for generator 15. -/
def ep_Q2_024_partial_15_1006 : Poly :=
[
  term ((-17842303055724083763118711211856783152 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (6, 1), (14, 1)],
  term ((8921151527862041881559355605928391576 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1006 for generator 15. -/
theorem ep_Q2_024_partial_15_1006_valid :
    mulPoly ep_Q2_024_coefficient_15_1006
        ep_Q2_024_generator_15_1000_1099 =
      ep_Q2_024_partial_15_1006 := by
  native_decide

/-- Coefficient term 1007 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1007 : Poly :=
[
  term ((-5633709133854896624680034347401390035670218004313073105 : Rat) / 278999685639605945551432029250879769240203926974238414) [(2, 2), (15, 2)]
]

/-- Partial product 1007 for generator 15. -/
def ep_Q2_024_partial_15_1007 : Poly :=
[
  term ((-5633709133854896624680034347401390035670218004313073105 : Rat) / 139499842819802972775716014625439884620101963487119207) [(2, 2), (6, 1), (15, 2)],
  term ((5633709133854896624680034347401390035670218004313073105 : Rat) / 278999685639605945551432029250879769240203926974238414) [(2, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1007 for generator 15. -/
theorem ep_Q2_024_partial_15_1007_valid :
    mulPoly ep_Q2_024_coefficient_15_1007
        ep_Q2_024_generator_15_1000_1099 =
      ep_Q2_024_partial_15_1007 := by
  native_decide

/-- Coefficient term 1008 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1008 : Poly :=
[
  term ((2131658198001102 : Rat) / 1162780221153193) [(2, 2), (15, 2), (16, 1)]
]

/-- Partial product 1008 for generator 15. -/
def ep_Q2_024_partial_15_1008 : Poly :=
[
  term ((4263316396002204 : Rat) / 1162780221153193) [(2, 2), (6, 1), (15, 2), (16, 1)],
  term ((-2131658198001102 : Rat) / 1162780221153193) [(2, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1008 for generator 15. -/
theorem ep_Q2_024_partial_15_1008_valid :
    mulPoly ep_Q2_024_coefficient_15_1008
        ep_Q2_024_generator_15_1000_1099 =
      ep_Q2_024_partial_15_1008 := by
  native_decide

/-- Coefficient term 1009 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1009 : Poly :=
[
  term ((-16890983628896808743407603036576568848 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (4, 1), (5, 1), (7, 1), (9, 1)]
]

/-- Partial product 1009 for generator 15. -/
def ep_Q2_024_partial_15_1009 : Poly :=
[
  term ((-33781967257793617486815206073153137696 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (4, 1), (5, 1), (6, 1), (7, 1), (9, 1)],
  term ((16890983628896808743407603036576568848 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (4, 1), (5, 1), (7, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1009 for generator 15. -/
theorem ep_Q2_024_partial_15_1009_valid :
    mulPoly ep_Q2_024_coefficient_15_1009
        ep_Q2_024_generator_15_1000_1099 =
      ep_Q2_024_partial_15_1009 := by
  native_decide

/-- Coefficient term 1010 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1010 : Poly :=
[
  term ((-20220074797511964466058292860462341536 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (4, 1), (5, 1), (7, 1), (13, 1)]
]

/-- Partial product 1010 for generator 15. -/
def ep_Q2_024_partial_15_1010 : Poly :=
[
  term ((-40440149595023928932116585720924683072 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (4, 1), (5, 1), (6, 1), (7, 1), (13, 1)],
  term ((20220074797511964466058292860462341536 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (4, 1), (5, 1), (7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1010 for generator 15. -/
theorem ep_Q2_024_partial_15_1010_valid :
    mulPoly ep_Q2_024_coefficient_15_1010
        ep_Q2_024_generator_15_1000_1099 =
      ep_Q2_024_partial_15_1010 := by
  native_decide

/-- Coefficient term 1011 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1011 : Poly :=
[
  term ((1086812258876365631714711692878661467835285345215957824 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (4, 1), (5, 1), (7, 1), (15, 1)]
]

/-- Partial product 1011 for generator 15. -/
def ep_Q2_024_partial_15_1011 : Poly :=
[
  term ((2173624517752731263429423385757322935670570690431915648 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (4, 1), (5, 1), (6, 1), (7, 1), (15, 1)],
  term ((-1086812258876365631714711692878661467835285345215957824 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (4, 1), (5, 1), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1011 for generator 15. -/
theorem ep_Q2_024_partial_15_1011_valid :
    mulPoly ep_Q2_024_coefficient_15_1011
        ep_Q2_024_generator_15_1000_1099 =
      ep_Q2_024_partial_15_1011 := by
  native_decide

/-- Coefficient term 1012 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1012 : Poly :=
[
  term ((103470768511616 : Rat) / 1162780221153193) [(3, 1), (4, 1), (5, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 1012 for generator 15. -/
def ep_Q2_024_partial_15_1012 : Poly :=
[
  term ((206941537023232 : Rat) / 1162780221153193) [(3, 1), (4, 1), (5, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-103470768511616 : Rat) / 1162780221153193) [(3, 1), (4, 1), (5, 1), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1012 for generator 15. -/
theorem ep_Q2_024_partial_15_1012_valid :
    mulPoly ep_Q2_024_coefficient_15_1012
        ep_Q2_024_generator_15_1000_1099 =
      ep_Q2_024_partial_15_1012 := by
  native_decide

/-- Coefficient term 1013 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1013 : Poly :=
[
  term ((61407203675747673392012106175425645752 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (4, 1), (6, 1), (9, 1)]
]

/-- Partial product 1013 for generator 15. -/
def ep_Q2_024_partial_15_1013 : Poly :=
[
  term ((-61407203675747673392012106175425645752 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (4, 1), (6, 1), (9, 1)],
  term ((122814407351495346784024212350851291504 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (4, 1), (6, 2), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1013 for generator 15. -/
theorem ep_Q2_024_partial_15_1013_valid :
    mulPoly ep_Q2_024_coefficient_15_1013
        ep_Q2_024_generator_15_1000_1099 =
      ep_Q2_024_partial_15_1013 := by
  native_decide

/-- Coefficient term 1014 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1014 : Poly :=
[
  term ((-13039989571957324850941463221005630992 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (4, 1), (6, 1), (13, 1)]
]

/-- Partial product 1014 for generator 15. -/
def ep_Q2_024_partial_15_1014 : Poly :=
[
  term ((13039989571957324850941463221005630992 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (4, 1), (6, 1), (13, 1)],
  term ((-26079979143914649701882926442011261984 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (4, 1), (6, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1014 for generator 15. -/
theorem ep_Q2_024_partial_15_1014_valid :
    mulPoly ep_Q2_024_coefficient_15_1014
        ep_Q2_024_generator_15_1000_1099 =
      ep_Q2_024_partial_15_1014 := by
  native_decide

/-- Coefficient term 1015 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1015 : Poly :=
[
  term ((1279332772588430482173835610044994821028103267071148719 : Rat) / 464999476066009909252386715418132948733673211623730690) [(3, 1), (4, 1), (6, 1), (15, 1)]
]

/-- Partial product 1015 for generator 15. -/
def ep_Q2_024_partial_15_1015 : Poly :=
[
  term ((-1279332772588430482173835610044994821028103267071148719 : Rat) / 464999476066009909252386715418132948733673211623730690) [(3, 1), (4, 1), (6, 1), (15, 1)],
  term ((1279332772588430482173835610044994821028103267071148719 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (4, 1), (6, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1015 for generator 15. -/
theorem ep_Q2_024_partial_15_1015_valid :
    mulPoly ep_Q2_024_coefficient_15_1015
        ep_Q2_024_generator_15_1000_1099 =
      ep_Q2_024_partial_15_1015 := by
  native_decide

/-- Coefficient term 1016 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1016 : Poly :=
[
  term ((-69367473696382 : Rat) / 1162780221153193) [(3, 1), (4, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 1016 for generator 15. -/
def ep_Q2_024_partial_15_1016 : Poly :=
[
  term ((69367473696382 : Rat) / 1162780221153193) [(3, 1), (4, 1), (6, 1), (15, 1), (16, 1)],
  term ((-138734947392764 : Rat) / 1162780221153193) [(3, 1), (4, 1), (6, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1016 for generator 15. -/
theorem ep_Q2_024_partial_15_1016_valid :
    mulPoly ep_Q2_024_coefficient_15_1016
        ep_Q2_024_generator_15_1000_1099 =
      ep_Q2_024_partial_15_1016 := by
  native_decide

/-- Coefficient term 1017 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1017 : Poly :=
[
  term ((-8921151527862041881559355605928391576 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (4, 1), (7, 1)]
]

/-- Partial product 1017 for generator 15. -/
def ep_Q2_024_partial_15_1017 : Poly :=
[
  term ((-17842303055724083763118711211856783152 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (4, 1), (6, 1), (7, 1)],
  term ((8921151527862041881559355605928391576 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (4, 1), (7, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1017 for generator 15. -/
theorem ep_Q2_024_partial_15_1017_valid :
    mulPoly ep_Q2_024_coefficient_15_1017
        ep_Q2_024_generator_15_1000_1099 =
      ep_Q2_024_partial_15_1017 := by
  native_decide

/-- Coefficient term 1018 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1018 : Poly :=
[
  term ((1465074617356825556565339743900656045508 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (4, 1), (7, 1), (8, 1)]
]

/-- Partial product 1018 for generator 15. -/
def ep_Q2_024_partial_15_1018 : Poly :=
[
  term ((2930149234713651113130679487801312091016 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (4, 1), (6, 1), (7, 1), (8, 1)],
  term ((-1465074617356825556565339743900656045508 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (4, 1), (7, 1), (8, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1018 for generator 15. -/
theorem ep_Q2_024_partial_15_1018_valid :
    mulPoly ep_Q2_024_coefficient_15_1018
        ep_Q2_024_generator_15_1000_1099 =
      ep_Q2_024_partial_15_1018 := by
  native_decide

/-- Coefficient term 1019 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1019 : Poly :=
[
  term ((78274801493699222926203641708507255904 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (4, 1), (7, 1), (9, 1), (13, 1)]
]

/-- Partial product 1019 for generator 15. -/
def ep_Q2_024_partial_15_1019 : Poly :=
[
  term ((156549602987398445852407283417014511808 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (4, 1), (6, 1), (7, 1), (9, 1), (13, 1)],
  term ((-78274801493699222926203641708507255904 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (4, 1), (7, 1), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1019 for generator 15. -/
theorem ep_Q2_024_partial_15_1019_valid :
    mulPoly ep_Q2_024_coefficient_15_1019
        ep_Q2_024_generator_15_1000_1099 =
      ep_Q2_024_partial_15_1019 := by
  native_decide

/-- Coefficient term 1020 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1020 : Poly :=
[
  term ((-1224510104923201687356037336946774208653866347508271591 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (4, 1), (7, 1), (9, 1), (15, 1)]
]

/-- Partial product 1020 for generator 15. -/
def ep_Q2_024_partial_15_1020 : Poly :=
[
  term ((-2449020209846403374712074673893548417307732695016543182 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (4, 1), (6, 1), (7, 1), (9, 1), (15, 1)],
  term ((1224510104923201687356037336946774208653866347508271591 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (4, 1), (7, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1020 for generator 15. -/
theorem ep_Q2_024_partial_15_1020_valid :
    mulPoly ep_Q2_024_coefficient_15_1020
        ep_Q2_024_generator_15_1000_1099 =
      ep_Q2_024_partial_15_1020 := by
  native_decide

/-- Coefficient term 1021 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1021 : Poly :=
[
  term ((747574224772468 : Rat) / 1162780221153193) [(3, 1), (4, 1), (7, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 1021 for generator 15. -/
def ep_Q2_024_partial_15_1021 : Poly :=
[
  term ((1495148449544936 : Rat) / 1162780221153193) [(3, 1), (4, 1), (6, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-747574224772468 : Rat) / 1162780221153193) [(3, 1), (4, 1), (7, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1021 for generator 15. -/
theorem ep_Q2_024_partial_15_1021_valid :
    mulPoly ep_Q2_024_coefficient_15_1021
        ep_Q2_024_generator_15_1000_1099 =
      ep_Q2_024_partial_15_1021 := by
  native_decide

/-- Coefficient term 1022 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1022 : Poly :=
[
  term ((63112532186469946331305143931700421056 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (4, 1), (7, 1), (9, 2)]
]

/-- Partial product 1022 for generator 15. -/
def ep_Q2_024_partial_15_1022 : Poly :=
[
  term ((126225064372939892662610287863400842112 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (4, 1), (6, 1), (7, 1), (9, 2)],
  term ((-63112532186469946331305143931700421056 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (4, 1), (7, 1), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1022 for generator 15. -/
theorem ep_Q2_024_partial_15_1022_valid :
    mulPoly ep_Q2_024_coefficient_15_1022
        ep_Q2_024_generator_15_1000_1099 =
      ep_Q2_024_partial_15_1022 := by
  native_decide

/-- Coefficient term 1023 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1023 : Poly :=
[
  term ((-1465074617356825556565339743900656045508 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (4, 1), (7, 1), (12, 1)]
]

/-- Partial product 1023 for generator 15. -/
def ep_Q2_024_partial_15_1023 : Poly :=
[
  term ((-2930149234713651113130679487801312091016 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (4, 1), (6, 1), (7, 1), (12, 1)],
  term ((1465074617356825556565339743900656045508 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (4, 1), (7, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1023 for generator 15. -/
theorem ep_Q2_024_partial_15_1023_valid :
    mulPoly ep_Q2_024_coefficient_15_1023
        ep_Q2_024_generator_15_1000_1099 =
      ep_Q2_024_partial_15_1023 := by
  native_decide

/-- Coefficient term 1024 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1024 : Poly :=
[
  term ((-5765256066330991377012813064701065069245493141648013778 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (4, 1), (7, 1), (13, 1), (15, 1)]
]

/-- Partial product 1024 for generator 15. -/
def ep_Q2_024_partial_15_1024 : Poly :=
[
  term ((-11530512132661982754025626129402130138490986283296027556 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (4, 1), (6, 1), (7, 1), (13, 1), (15, 1)],
  term ((5765256066330991377012813064701065069245493141648013778 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (4, 1), (7, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1024 for generator 15. -/
theorem ep_Q2_024_partial_15_1024_valid :
    mulPoly ep_Q2_024_coefficient_15_1024
        ep_Q2_024_generator_15_1000_1099 =
      ep_Q2_024_partial_15_1024 := by
  native_decide

/-- Coefficient term 1025 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1025 : Poly :=
[
  term ((75330592794360 : Rat) / 1162780221153193) [(3, 1), (4, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1025 for generator 15. -/
def ep_Q2_024_partial_15_1025 : Poly :=
[
  term ((150661185588720 : Rat) / 1162780221153193) [(3, 1), (4, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-75330592794360 : Rat) / 1162780221153193) [(3, 1), (4, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1025 for generator 15. -/
theorem ep_Q2_024_partial_15_1025_valid :
    mulPoly ep_Q2_024_coefficient_15_1025
        ep_Q2_024_generator_15_1000_1099 =
      ep_Q2_024_partial_15_1025 := by
  native_decide

/-- Coefficient term 1026 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1026 : Poly :=
[
  term ((40472928056033817116049120031239046672 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (4, 1), (7, 1), (13, 2)]
]

/-- Partial product 1026 for generator 15. -/
def ep_Q2_024_partial_15_1026 : Poly :=
[
  term ((80945856112067634232098240062478093344 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (4, 1), (6, 1), (7, 1), (13, 2)],
  term ((-40472928056033817116049120031239046672 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (4, 1), (7, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1026 for generator 15. -/
theorem ep_Q2_024_partial_15_1026_valid :
    mulPoly ep_Q2_024_coefficient_15_1026
        ep_Q2_024_generator_15_1000_1099 =
      ep_Q2_024_partial_15_1026 := by
  native_decide

/-- Coefficient term 1027 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1027 : Poly :=
[
  term ((8921151527862041881559355605928391576 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (4, 1), (7, 1), (14, 1)]
]

/-- Partial product 1027 for generator 15. -/
def ep_Q2_024_partial_15_1027 : Poly :=
[
  term ((17842303055724083763118711211856783152 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (4, 1), (6, 1), (7, 1), (14, 1)],
  term ((-8921151527862041881559355605928391576 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (4, 1), (7, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1027 for generator 15. -/
theorem ep_Q2_024_partial_15_1027_valid :
    mulPoly ep_Q2_024_coefficient_15_1027
        ep_Q2_024_generator_15_1000_1099 =
      ep_Q2_024_partial_15_1027 := by
  native_decide

/-- Coefficient term 1028 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1028 : Poly :=
[
  term ((7554608628259157661858344611693643317158664401599804758 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (4, 1), (7, 1), (15, 2)]
]

/-- Partial product 1028 for generator 15. -/
def ep_Q2_024_partial_15_1028 : Poly :=
[
  term ((15109217256518315323716689223387286634317328803199609516 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (4, 1), (6, 1), (7, 1), (15, 2)],
  term ((-7554608628259157661858344611693643317158664401599804758 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (4, 1), (7, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1028 for generator 15. -/
theorem ep_Q2_024_partial_15_1028_valid :
    mulPoly ep_Q2_024_coefficient_15_1028
        ep_Q2_024_generator_15_1000_1099 =
      ep_Q2_024_partial_15_1028 := by
  native_decide

/-- Coefficient term 1029 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1029 : Poly :=
[
  term ((-1065110533471208 : Rat) / 1162780221153193) [(3, 1), (4, 1), (7, 1), (15, 2), (16, 1)]
]

/-- Partial product 1029 for generator 15. -/
def ep_Q2_024_partial_15_1029 : Poly :=
[
  term ((-2130221066942416 : Rat) / 1162780221153193) [(3, 1), (4, 1), (6, 1), (7, 1), (15, 2), (16, 1)],
  term ((1065110533471208 : Rat) / 1162780221153193) [(3, 1), (4, 1), (7, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1029 for generator 15. -/
theorem ep_Q2_024_partial_15_1029_valid :
    mulPoly ep_Q2_024_coefficient_15_1029
        ep_Q2_024_generator_15_1000_1099 =
      ep_Q2_024_partial_15_1029 := by
  native_decide

/-- Coefficient term 1030 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1030 : Poly :=
[
  term ((182481956855019299207446157664365046748 : Rat) / 359912837220743188970008058408861780397) [(3, 1), (4, 1), (8, 1), (9, 1)]
]

/-- Partial product 1030 for generator 15. -/
def ep_Q2_024_partial_15_1030 : Poly :=
[
  term ((364963913710038598414892315328730093496 : Rat) / 359912837220743188970008058408861780397) [(3, 1), (4, 1), (6, 1), (8, 1), (9, 1)],
  term ((-182481956855019299207446157664365046748 : Rat) / 359912837220743188970008058408861780397) [(3, 1), (4, 1), (8, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1030 for generator 15. -/
theorem ep_Q2_024_partial_15_1030_valid :
    mulPoly ep_Q2_024_coefficient_15_1030
        ep_Q2_024_generator_15_1000_1099 =
      ep_Q2_024_partial_15_1030 := by
  native_decide

/-- Coefficient term 1031 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1031 : Poly :=
[
  term ((1465074617356825556565339743900656045508 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (4, 1), (8, 1), (11, 1)]
]

/-- Partial product 1031 for generator 15. -/
def ep_Q2_024_partial_15_1031 : Poly :=
[
  term ((2930149234713651113130679487801312091016 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (4, 1), (6, 1), (8, 1), (11, 1)],
  term ((-1465074617356825556565339743900656045508 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (4, 1), (8, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1031 for generator 15. -/
theorem ep_Q2_024_partial_15_1031_valid :
    mulPoly ep_Q2_024_coefficient_15_1031
        ep_Q2_024_generator_15_1000_1099 =
      ep_Q2_024_partial_15_1031 := by
  native_decide

/-- Coefficient term 1032 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1032 : Poly :=
[
  term ((17821249978825436563697260595591044088 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (4, 1), (8, 1), (13, 1)]
]

/-- Partial product 1032 for generator 15. -/
def ep_Q2_024_partial_15_1032 : Poly :=
[
  term ((35642499957650873127394521191182088176 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (4, 1), (6, 1), (8, 1), (13, 1)],
  term ((-17821249978825436563697260595591044088 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (4, 1), (8, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1032 for generator 15. -/
theorem ep_Q2_024_partial_15_1032_valid :
    mulPoly ep_Q2_024_coefficient_15_1032
        ep_Q2_024_generator_15_1000_1099 =
      ep_Q2_024_partial_15_1032 := by
  native_decide

/-- Coefficient term 1033 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1033 : Poly :=
[
  term ((424161063795057930629132723086609003137058634794396433 : Rat) / 278999685639605945551432029250879769240203926974238414) [(3, 1), (4, 1), (8, 1), (15, 1)]
]

/-- Partial product 1033 for generator 15. -/
def ep_Q2_024_partial_15_1033 : Poly :=
[
  term ((424161063795057930629132723086609003137058634794396433 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 1), (4, 1), (6, 1), (8, 1), (15, 1)],
  term ((-424161063795057930629132723086609003137058634794396433 : Rat) / 278999685639605945551432029250879769240203926974238414) [(3, 1), (4, 1), (8, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1033 for generator 15. -/
theorem ep_Q2_024_partial_15_1033_valid :
    mulPoly ep_Q2_024_coefficient_15_1033
        ep_Q2_024_generator_15_1000_1099 =
      ep_Q2_024_partial_15_1033 := by
  native_decide

/-- Coefficient term 1034 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1034 : Poly :=
[
  term ((-71768591212414 : Rat) / 1162780221153193) [(3, 1), (4, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 1034 for generator 15. -/
def ep_Q2_024_partial_15_1034 : Poly :=
[
  term ((-143537182424828 : Rat) / 1162780221153193) [(3, 1), (4, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((71768591212414 : Rat) / 1162780221153193) [(3, 1), (4, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1034 for generator 15. -/
theorem ep_Q2_024_partial_15_1034_valid :
    mulPoly ep_Q2_024_coefficient_15_1034
        ep_Q2_024_generator_15_1000_1099 =
      ep_Q2_024_partial_15_1034 := by
  native_decide

/-- Coefficient term 1035 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1035 : Poly :=
[
  term ((-31556266093234973165652571965850210528 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (4, 1), (9, 1)]
]

/-- Partial product 1035 for generator 15. -/
def ep_Q2_024_partial_15_1035 : Poly :=
[
  term ((-63112532186469946331305143931700421056 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (4, 1), (6, 1), (9, 1)],
  term ((31556266093234973165652571965850210528 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (4, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1035 for generator 15. -/
theorem ep_Q2_024_partial_15_1035_valid :
    mulPoly ep_Q2_024_coefficient_15_1035
        ep_Q2_024_generator_15_1000_1099 =
      ep_Q2_024_partial_15_1035 := by
  native_decide

/-- Coefficient term 1036 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1036 : Poly :=
[
  term ((-38296429396961104598063335727863719648 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (4, 1), (9, 1), (12, 1)]
]

/-- Partial product 1036 for generator 15. -/
def ep_Q2_024_partial_15_1036 : Poly :=
[
  term ((-76592858793922209196126671455727439296 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (4, 1), (6, 1), (9, 1), (12, 1)],
  term ((38296429396961104598063335727863719648 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (4, 1), (9, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1036 for generator 15. -/
theorem ep_Q2_024_partial_15_1036_valid :
    mulPoly ep_Q2_024_coefficient_15_1036
        ep_Q2_024_generator_15_1000_1099 =
      ep_Q2_024_partial_15_1036 := by
  native_decide

/-- Coefficient term 1037 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1037 : Poly :=
[
  term ((-2930149234713651113130679487801312091016 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (4, 1), (9, 1), (14, 1)]
]

/-- Partial product 1037 for generator 15. -/
def ep_Q2_024_partial_15_1037 : Poly :=
[
  term ((-5860298469427302226261358975602624182032 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (4, 1), (6, 1), (9, 1), (14, 1)],
  term ((2930149234713651113130679487801312091016 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (4, 1), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1037 for generator 15. -/
theorem ep_Q2_024_partial_15_1037_valid :
    mulPoly ep_Q2_024_coefficient_15_1037
        ep_Q2_024_generator_15_1000_1099 =
      ep_Q2_024_partial_15_1037 := by
  native_decide

/-- Coefficient term 1038 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1038 : Poly :=
[
  term ((-20236464028016908558024560015619523336 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (4, 1), (12, 1), (13, 1)]
]

/-- Partial product 1038 for generator 15. -/
def ep_Q2_024_partial_15_1038 : Poly :=
[
  term ((-40472928056033817116049120031239046672 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (4, 1), (6, 1), (12, 1), (13, 1)],
  term ((20236464028016908558024560015619523336 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (4, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1038 for generator 15. -/
theorem ep_Q2_024_partial_15_1038_valid :
    mulPoly ep_Q2_024_coefficient_15_1038
        ep_Q2_024_generator_15_1000_1099 =
      ep_Q2_024_partial_15_1038 := by
  native_decide

/-- Coefficient term 1039 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1039 : Poly :=
[
  term ((2876268491099880711562467761623934524463172144262980241 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (4, 1), (12, 1), (15, 1)]
]

/-- Partial product 1039 for generator 15. -/
def ep_Q2_024_partial_15_1039 : Poly :=
[
  term ((5752536982199761423124935523247869048926344288525960482 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (4, 1), (6, 1), (12, 1), (15, 1)],
  term ((-2876268491099880711562467761623934524463172144262980241 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (4, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1039 for generator 15. -/
theorem ep_Q2_024_partial_15_1039_valid :
    mulPoly ep_Q2_024_coefficient_15_1039
        ep_Q2_024_generator_15_1000_1099 =
      ep_Q2_024_partial_15_1039 := by
  native_decide

/-- Coefficient term 1040 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1040 : Poly :=
[
  term ((-37665296397180 : Rat) / 1162780221153193) [(3, 1), (4, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1040 for generator 15. -/
def ep_Q2_024_partial_15_1040 : Poly :=
[
  term ((-75330592794360 : Rat) / 1162780221153193) [(3, 1), (4, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((37665296397180 : Rat) / 1162780221153193) [(3, 1), (4, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1040 for generator 15. -/
theorem ep_Q2_024_partial_15_1040_valid :
    mulPoly ep_Q2_024_coefficient_15_1040
        ep_Q2_024_generator_15_1000_1099 =
      ep_Q2_024_partial_15_1040 := by
  native_decide

/-- Coefficient term 1041 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1041 : Poly :=
[
  term ((-12492472986937566043423911539945286416 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (4, 1), (13, 1)]
]

/-- Partial product 1041 for generator 15. -/
def ep_Q2_024_partial_15_1041 : Poly :=
[
  term ((-24984945973875132086847823079890572832 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (4, 1), (6, 1), (13, 1)],
  term ((12492472986937566043423911539945286416 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (4, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1041 for generator 15. -/
theorem ep_Q2_024_partial_15_1041_valid :
    mulPoly ep_Q2_024_coefficient_15_1041
        ep_Q2_024_generator_15_1000_1099 =
      ep_Q2_024_partial_15_1041 := by
  native_decide

/-- Coefficient term 1042 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1042 : Poly :=
[
  term ((40423760364518984840150318565767501272 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (4, 1), (13, 1), (14, 1)]
]

/-- Partial product 1042 for generator 15. -/
def ep_Q2_024_partial_15_1042 : Poly :=
[
  term ((80847520729037969680300637131535002544 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (4, 1), (6, 1), (13, 1), (14, 1)],
  term ((-40423760364518984840150318565767501272 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (4, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1042 for generator 15. -/
theorem ep_Q2_024_partial_15_1042_valid :
    mulPoly ep_Q2_024_coefficient_15_1042
        ep_Q2_024_generator_15_1000_1099 =
      ep_Q2_024_partial_15_1042 := by
  native_decide

/-- Coefficient term 1043 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1043 : Poly :=
[
  term ((-427717756781907914922890628895589920671501510102299927 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (4, 1), (14, 1), (15, 1)]
]

/-- Partial product 1043 for generator 15. -/
def ep_Q2_024_partial_15_1043 : Poly :=
[
  term ((-855435513563815829845781257791179841343003020204599854 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (4, 1), (6, 1), (14, 1), (15, 1)],
  term ((427717756781907914922890628895589920671501510102299927 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (4, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1043 for generator 15. -/
theorem ep_Q2_024_partial_15_1043_valid :
    mulPoly ep_Q2_024_coefficient_15_1043
        ep_Q2_024_generator_15_1000_1099 =
      ep_Q2_024_partial_15_1043 := by
  native_decide

/-- Coefficient term 1044 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1044 : Poly :=
[
  term ((-141136064908796 : Rat) / 1162780221153193) [(3, 1), (4, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1044 for generator 15. -/
def ep_Q2_024_partial_15_1044 : Poly :=
[
  term ((-282272129817592 : Rat) / 1162780221153193) [(3, 1), (4, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((141136064908796 : Rat) / 1162780221153193) [(3, 1), (4, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1044 for generator 15. -/
theorem ep_Q2_024_partial_15_1044_valid :
    mulPoly ep_Q2_024_coefficient_15_1044
        ep_Q2_024_generator_15_1000_1099 =
      ep_Q2_024_partial_15_1044 := by
  native_decide

/-- Coefficient term 1045 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1045 : Poly :=
[
  term ((-5453916332679123003291408790719607814301285421113528977 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(3, 1), (4, 1), (15, 1)]
]

/-- Partial product 1045 for generator 15. -/
def ep_Q2_024_partial_15_1045 : Poly :=
[
  term ((-5453916332679123003291408790719607814301285421113528977 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (4, 1), (6, 1), (15, 1)],
  term ((5453916332679123003291408790719607814301285421113528977 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(3, 1), (4, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1045 for generator 15. -/
theorem ep_Q2_024_partial_15_1045_valid :
    mulPoly ep_Q2_024_coefficient_15_1045
        ep_Q2_024_generator_15_1000_1099 =
      ep_Q2_024_partial_15_1045 := by
  native_decide

/-- Coefficient term 1046 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1046 : Poly :=
[
  term ((299904219258166 : Rat) / 1162780221153193) [(3, 1), (4, 1), (15, 1), (16, 1)]
]

/-- Partial product 1046 for generator 15. -/
def ep_Q2_024_partial_15_1046 : Poly :=
[
  term ((599808438516332 : Rat) / 1162780221153193) [(3, 1), (4, 1), (6, 1), (15, 1), (16, 1)],
  term ((-299904219258166 : Rat) / 1162780221153193) [(3, 1), (4, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1046 for generator 15. -/
theorem ep_Q2_024_partial_15_1046_valid :
    mulPoly ep_Q2_024_coefficient_15_1046
        ep_Q2_024_generator_15_1000_1099 =
      ep_Q2_024_partial_15_1046 := by
  native_decide

/-- Coefficient term 1047 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1047 : Poly :=
[
  term ((8445491814448404371703801518288284424 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (4, 2), (9, 1)]
]

/-- Partial product 1047 for generator 15. -/
def ep_Q2_024_partial_15_1047 : Poly :=
[
  term ((16890983628896808743407603036576568848 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (4, 2), (6, 1), (9, 1)],
  term ((-8445491814448404371703801518288284424 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (4, 2), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1047 for generator 15. -/
theorem ep_Q2_024_partial_15_1047_valid :
    mulPoly ep_Q2_024_coefficient_15_1047
        ep_Q2_024_generator_15_1000_1099 =
      ep_Q2_024_partial_15_1047 := by
  native_decide

/-- Coefficient term 1048 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1048 : Poly :=
[
  term ((10110037398755982233029146430231170768 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (4, 2), (13, 1)]
]

/-- Partial product 1048 for generator 15. -/
def ep_Q2_024_partial_15_1048 : Poly :=
[
  term ((20220074797511964466058292860462341536 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (4, 2), (6, 1), (13, 1)],
  term ((-10110037398755982233029146430231170768 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (4, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1048 for generator 15. -/
theorem ep_Q2_024_partial_15_1048_valid :
    mulPoly ep_Q2_024_coefficient_15_1048
        ep_Q2_024_generator_15_1000_1099 =
      ep_Q2_024_partial_15_1048 := by
  native_decide

/-- Coefficient term 1049 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1049 : Poly :=
[
  term ((-543406129438182815857355846439330733917642672607978912 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (4, 2), (15, 1)]
]

/-- Partial product 1049 for generator 15. -/
def ep_Q2_024_partial_15_1049 : Poly :=
[
  term ((-1086812258876365631714711692878661467835285345215957824 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (4, 2), (6, 1), (15, 1)],
  term ((543406129438182815857355846439330733917642672607978912 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (4, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1049 for generator 15. -/
theorem ep_Q2_024_partial_15_1049_valid :
    mulPoly ep_Q2_024_coefficient_15_1049
        ep_Q2_024_generator_15_1000_1099 =
      ep_Q2_024_partial_15_1049 := by
  native_decide

/-- Coefficient term 1050 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1050 : Poly :=
[
  term ((-51735384255808 : Rat) / 1162780221153193) [(3, 1), (4, 2), (15, 1), (16, 1)]
]

/-- Partial product 1050 for generator 15. -/
def ep_Q2_024_partial_15_1050 : Poly :=
[
  term ((-103470768511616 : Rat) / 1162780221153193) [(3, 1), (4, 2), (6, 1), (15, 1), (16, 1)],
  term ((51735384255808 : Rat) / 1162780221153193) [(3, 1), (4, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1050 for generator 15. -/
theorem ep_Q2_024_partial_15_1050_valid :
    mulPoly ep_Q2_024_coefficient_15_1050
        ep_Q2_024_generator_15_1000_1099 =
      ep_Q2_024_partial_15_1050 := by
  native_decide

/-- Coefficient term 1051 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1051 : Poly :=
[
  term ((4460575763931020940779677802964195788 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (5, 1)]
]

/-- Partial product 1051 for generator 15. -/
def ep_Q2_024_partial_15_1051 : Poly :=
[
  term ((-4460575763931020940779677802964195788 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (5, 1)],
  term ((8921151527862041881559355605928391576 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (5, 1), (6, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1051 for generator 15. -/
theorem ep_Q2_024_partial_15_1051_valid :
    mulPoly ep_Q2_024_coefficient_15_1051
        ep_Q2_024_generator_15_1000_1099 =
      ep_Q2_024_partial_15_1051 := by
  native_decide

/-- Coefficient term 1052 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1052 : Poly :=
[
  term ((8921151527862041881559355605928391576 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (5, 1), (6, 1)]
]

/-- Partial product 1052 for generator 15. -/
def ep_Q2_024_partial_15_1052 : Poly :=
[
  term ((-8921151527862041881559355605928391576 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (5, 1), (6, 1)],
  term ((17842303055724083763118711211856783152 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (5, 1), (6, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1052 for generator 15. -/
theorem ep_Q2_024_partial_15_1052_valid :
    mulPoly ep_Q2_024_coefficient_15_1052
        ep_Q2_024_generator_15_1000_1099 =
      ep_Q2_024_partial_15_1052 := by
  native_decide

/-- Coefficient term 1053 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1053 : Poly :=
[
  term ((-19698975258242237478452386913793919488 : Rat) / 39990315246749243218889784267651308933) [(3, 1), (5, 1), (6, 1), (9, 1), (13, 1)]
]

/-- Partial product 1053 for generator 15. -/
def ep_Q2_024_partial_15_1053 : Poly :=
[
  term ((19698975258242237478452386913793919488 : Rat) / 39990315246749243218889784267651308933) [(3, 1), (5, 1), (6, 1), (9, 1), (13, 1)],
  term ((-39397950516484474956904773827587838976 : Rat) / 39990315246749243218889784267651308933) [(3, 1), (5, 1), (6, 2), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1053 for generator 15. -/
theorem ep_Q2_024_partial_15_1053_valid :
    mulPoly ep_Q2_024_coefficient_15_1053
        ep_Q2_024_generator_15_1000_1099 =
      ep_Q2_024_partial_15_1053 := by
  native_decide

/-- Coefficient term 1054 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1054 : Poly :=
[
  term ((4367103871475277020228677532940080923716833804838955079 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (5, 1), (6, 1), (9, 1), (15, 1)]
]

/-- Partial product 1054 for generator 15. -/
def ep_Q2_024_partial_15_1054 : Poly :=
[
  term ((-4367103871475277020228677532940080923716833804838955079 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (5, 1), (6, 1), (9, 1), (15, 1)],
  term ((8734207742950554040457355065880161847433667609677910158 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (5, 1), (6, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1054 for generator 15. -/
theorem ep_Q2_024_partial_15_1054_valid :
    mulPoly ep_Q2_024_coefficient_15_1054
        ep_Q2_024_generator_15_1000_1099 =
      ep_Q2_024_partial_15_1054 := by
  native_decide

/-- Coefficient term 1055 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1055 : Poly :=
[
  term ((-644103456260852 : Rat) / 1162780221153193) [(3, 1), (5, 1), (6, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 1055 for generator 15. -/
def ep_Q2_024_partial_15_1055 : Poly :=
[
  term ((644103456260852 : Rat) / 1162780221153193) [(3, 1), (5, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-1288206912521704 : Rat) / 1162780221153193) [(3, 1), (5, 1), (6, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1055 for generator 15. -/
theorem ep_Q2_024_partial_15_1055_valid :
    mulPoly ep_Q2_024_coefficient_15_1055
        ep_Q2_024_generator_15_1000_1099 =
      ep_Q2_024_partial_15_1055 := by
  native_decide

/-- Coefficient term 1056 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1056 : Poly :=
[
  term ((-80003515815366755074712746968276989904 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (6, 1), (9, 2)]
]

/-- Partial product 1056 for generator 15. -/
def ep_Q2_024_partial_15_1056 : Poly :=
[
  term ((80003515815366755074712746968276989904 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (6, 1), (9, 2)],
  term ((-160007031630733510149425493936553979808 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (6, 2), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1056 for generator 15. -/
theorem ep_Q2_024_partial_15_1056_valid :
    mulPoly ep_Q2_024_coefficient_15_1056
        ep_Q2_024_generator_15_1000_1099 =
      ep_Q2_024_partial_15_1056 := by
  native_decide

/-- Coefficient term 1057 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1057 : Poly :=
[
  term ((1124837409612456195950031421967869023795202187998093418 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 1), (5, 1), (6, 1), (13, 1), (15, 1)]
]

/-- Partial product 1057 for generator 15. -/
def ep_Q2_024_partial_15_1057 : Poly :=
[
  term ((-1124837409612456195950031421967869023795202187998093418 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 1), (5, 1), (6, 1), (13, 1), (15, 1)],
  term ((2249674819224912391900062843935738047590404375996186836 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 1), (5, 1), (6, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1057 for generator 15. -/
theorem ep_Q2_024_partial_15_1057_valid :
    mulPoly ep_Q2_024_coefficient_15_1057
        ep_Q2_024_generator_15_1000_1099 =
      ep_Q2_024_partial_15_1057 := by
  native_decide

/-- Coefficient term 1058 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1058 : Poly :=
[
  term ((-75330592794360 : Rat) / 1162780221153193) [(3, 1), (5, 1), (6, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1058 for generator 15. -/
def ep_Q2_024_partial_15_1058 : Poly :=
[
  term ((75330592794360 : Rat) / 1162780221153193) [(3, 1), (5, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-150661185588720 : Rat) / 1162780221153193) [(3, 1), (5, 1), (6, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1058 for generator 15. -/
theorem ep_Q2_024_partial_15_1058_valid :
    mulPoly ep_Q2_024_coefficient_15_1058
        ep_Q2_024_generator_15_1000_1099 =
      ep_Q2_024_partial_15_1058 := by
  native_decide

/-- Coefficient term 1059 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1059 : Poly :=
[
  term ((-40472928056033817116049120031239046672 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (5, 1), (6, 1), (13, 2)]
]

/-- Partial product 1059 for generator 15. -/
def ep_Q2_024_partial_15_1059 : Poly :=
[
  term ((40472928056033817116049120031239046672 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (5, 1), (6, 1), (13, 2)],
  term ((-80945856112067634232098240062478093344 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (5, 1), (6, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1059 for generator 15. -/
theorem ep_Q2_024_partial_15_1059_valid :
    mulPoly ep_Q2_024_coefficient_15_1059
        ep_Q2_024_generator_15_1000_1099 =
      ep_Q2_024_partial_15_1059 := by
  native_decide

/-- Coefficient term 1060 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1060 : Poly :=
[
  term ((-8921151527862041881559355605928391576 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (6, 1), (14, 1)]
]

/-- Partial product 1060 for generator 15. -/
def ep_Q2_024_partial_15_1060 : Poly :=
[
  term ((8921151527862041881559355605928391576 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (6, 1), (14, 1)],
  term ((-17842303055724083763118711211856783152 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (6, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1060 for generator 15. -/
theorem ep_Q2_024_partial_15_1060_valid :
    mulPoly ep_Q2_024_coefficient_15_1060
        ep_Q2_024_generator_15_1000_1099 =
      ep_Q2_024_partial_15_1060 := by
  native_decide

/-- Coefficient term 1061 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1061 : Poly :=
[
  term ((-1033735075000963871570074454421674510146952330304057814 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (5, 1), (6, 1), (15, 2)]
]

/-- Partial product 1061 for generator 15. -/
def ep_Q2_024_partial_15_1061 : Poly :=
[
  term ((1033735075000963871570074454421674510146952330304057814 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (5, 1), (6, 1), (15, 2)],
  term ((-2067470150001927743140148908843349020293904660608115628 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (5, 1), (6, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1061 for generator 15. -/
theorem ep_Q2_024_partial_15_1061_valid :
    mulPoly ep_Q2_024_coefficient_15_1061
        ep_Q2_024_generator_15_1000_1099 =
      ep_Q2_024_partial_15_1061 := by
  native_decide

/-- Coefficient term 1062 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1062 : Poly :=
[
  term ((1272052070494440 : Rat) / 1162780221153193) [(3, 1), (5, 1), (6, 1), (15, 2), (16, 1)]
]

/-- Partial product 1062 for generator 15. -/
def ep_Q2_024_partial_15_1062 : Poly :=
[
  term ((-1272052070494440 : Rat) / 1162780221153193) [(3, 1), (5, 1), (6, 1), (15, 2), (16, 1)],
  term ((2544104140988880 : Rat) / 1162780221153193) [(3, 1), (5, 1), (6, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1062 for generator 15. -/
theorem ep_Q2_024_partial_15_1062_valid :
    mulPoly ep_Q2_024_coefficient_15_1062
        ep_Q2_024_generator_15_1000_1099 =
      ep_Q2_024_partial_15_1062 := by
  native_decide

/-- Coefficient term 1063 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1063 : Poly :=
[
  term ((24658840927150047600702623014067329464 : Rat) / 39990315246749243218889784267651308933) [(3, 1), (5, 1), (7, 1), (8, 1), (9, 1)]
]

/-- Partial product 1063 for generator 15. -/
def ep_Q2_024_partial_15_1063 : Poly :=
[
  term ((49317681854300095201405246028134658928 : Rat) / 39990315246749243218889784267651308933) [(3, 1), (5, 1), (6, 1), (7, 1), (8, 1), (9, 1)],
  term ((-24658840927150047600702623014067329464 : Rat) / 39990315246749243218889784267651308933) [(3, 1), (5, 1), (7, 1), (8, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1063 for generator 15. -/
theorem ep_Q2_024_partial_15_1063_valid :
    mulPoly ep_Q2_024_coefficient_15_1063
        ep_Q2_024_generator_15_1000_1099 =
      ep_Q2_024_partial_15_1063 := by
  native_decide

/-- Coefficient term 1064 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1064 : Poly :=
[
  term ((157816417934512041276862316386764390896 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (7, 1), (8, 1), (13, 1)]
]

/-- Partial product 1064 for generator 15. -/
def ep_Q2_024_partial_15_1064 : Poly :=
[
  term ((315632835869024082553724632773528781792 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (6, 1), (7, 1), (8, 1), (13, 1)],
  term ((-157816417934512041276862316386764390896 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (7, 1), (8, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1064 for generator 15. -/
theorem ep_Q2_024_partial_15_1064_valid :
    mulPoly ep_Q2_024_coefficient_15_1064
        ep_Q2_024_generator_15_1000_1099 =
      ep_Q2_024_partial_15_1064 := by
  native_decide

/-- Coefficient term 1065 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1065 : Poly :=
[
  term ((-905649892486912115437703091516528642319088673319023280 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 1), (5, 1), (7, 1), (8, 1), (15, 1)]
]

/-- Partial product 1065 for generator 15. -/
def ep_Q2_024_partial_15_1065 : Poly :=
[
  term ((-1811299784973824230875406183033057284638177346638046560 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 1), (5, 1), (6, 1), (7, 1), (8, 1), (15, 1)],
  term ((905649892486912115437703091516528642319088673319023280 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 1), (5, 1), (7, 1), (8, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1065 for generator 15. -/
theorem ep_Q2_024_partial_15_1065_valid :
    mulPoly ep_Q2_024_coefficient_15_1065
        ep_Q2_024_generator_15_1000_1099 =
      ep_Q2_024_partial_15_1065 := by
  native_decide

/-- Coefficient term 1066 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1066 : Poly :=
[
  term ((-3263854553391488 : Rat) / 1162780221153193) [(3, 1), (5, 1), (7, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 1066 for generator 15. -/
def ep_Q2_024_partial_15_1066 : Poly :=
[
  term ((-6527709106782976 : Rat) / 1162780221153193) [(3, 1), (5, 1), (6, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((3263854553391488 : Rat) / 1162780221153193) [(3, 1), (5, 1), (7, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1066 for generator 15. -/
theorem ep_Q2_024_partial_15_1066_valid :
    mulPoly ep_Q2_024_coefficient_15_1066
        ep_Q2_024_generator_15_1000_1099 =
      ep_Q2_024_partial_15_1066 := by
  native_decide

/-- Coefficient term 1067 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1067 : Poly :=
[
  term ((-106403221006853429260105512033760078472 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (7, 1), (9, 1), (12, 1)]
]

/-- Partial product 1067 for generator 15. -/
def ep_Q2_024_partial_15_1067 : Poly :=
[
  term ((-212806442013706858520211024067520156944 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (6, 1), (7, 1), (9, 1), (12, 1)],
  term ((106403221006853429260105512033760078472 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (7, 1), (9, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1067 for generator 15. -/
theorem ep_Q2_024_partial_15_1067_valid :
    mulPoly ep_Q2_024_coefficient_15_1067
        ep_Q2_024_generator_15_1000_1099 =
      ep_Q2_024_partial_15_1067 := by
  native_decide

/-- Coefficient term 1068 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1068 : Poly :=
[
  term ((33781967257793617486815206073153137696 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (7, 1), (9, 1), (14, 1)]
]

/-- Partial product 1068 for generator 15. -/
def ep_Q2_024_partial_15_1068 : Poly :=
[
  term ((67563934515587234973630412146306275392 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (6, 1), (7, 1), (9, 1), (14, 1)],
  term ((-33781967257793617486815206073153137696 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (7, 1), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1068 for generator 15. -/
theorem ep_Q2_024_partial_15_1068_valid :
    mulPoly ep_Q2_024_coefficient_15_1068
        ep_Q2_024_generator_15_1000_1099 =
      ep_Q2_024_partial_15_1068 := by
  native_decide

/-- Coefficient term 1069 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1069 : Poly :=
[
  term ((-27519268627400015362160804705260409872 : Rat) / 39990315246749243218889784267651308933) [(3, 1), (5, 1), (7, 1), (12, 1), (13, 1)]
]

/-- Partial product 1069 for generator 15. -/
def ep_Q2_024_partial_15_1069 : Poly :=
[
  term ((-55038537254800030724321609410520819744 : Rat) / 39990315246749243218889784267651308933) [(3, 1), (5, 1), (6, 1), (7, 1), (12, 1), (13, 1)],
  term ((27519268627400015362160804705260409872 : Rat) / 39990315246749243218889784267651308933) [(3, 1), (5, 1), (7, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1069 for generator 15. -/
theorem ep_Q2_024_partial_15_1069_valid :
    mulPoly ep_Q2_024_coefficient_15_1069
        ep_Q2_024_generator_15_1000_1099 =
      ep_Q2_024_partial_15_1069 := by
  native_decide

/-- Coefficient term 1070 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1070 : Poly :=
[
  term ((1267812685805463682044380378946658808089587330947242928 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (5, 1), (7, 1), (12, 1), (15, 1)]
]

/-- Partial product 1070 for generator 15. -/
def ep_Q2_024_partial_15_1070 : Poly :=
[
  term ((2535625371610927364088760757893317616179174661894485856 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (5, 1), (6, 1), (7, 1), (12, 1), (15, 1)],
  term ((-1267812685805463682044380378946658808089587330947242928 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (5, 1), (7, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1070 for generator 15. -/
theorem ep_Q2_024_partial_15_1070_valid :
    mulPoly ep_Q2_024_coefficient_15_1070
        ep_Q2_024_generator_15_1000_1099 =
      ep_Q2_024_partial_15_1070 := by
  native_decide

/-- Coefficient term 1071 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1071 : Poly :=
[
  term ((3160383784879872 : Rat) / 1162780221153193) [(3, 1), (5, 1), (7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1071 for generator 15. -/
def ep_Q2_024_partial_15_1071 : Poly :=
[
  term ((6320767569759744 : Rat) / 1162780221153193) [(3, 1), (5, 1), (6, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3160383784879872 : Rat) / 1162780221153193) [(3, 1), (5, 1), (7, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1071 for generator 15. -/
theorem ep_Q2_024_partial_15_1071_valid :
    mulPoly ep_Q2_024_coefficient_15_1071
        ep_Q2_024_generator_15_1000_1099 =
      ep_Q2_024_partial_15_1071 := by
  native_decide

/-- Coefficient term 1072 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1072 : Poly :=
[
  term ((40440149595023928932116585720924683072 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (7, 1), (13, 1), (14, 1)]
]

/-- Partial product 1072 for generator 15. -/
def ep_Q2_024_partial_15_1072 : Poly :=
[
  term ((80880299190047857864233171441849366144 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (6, 1), (7, 1), (13, 1), (14, 1)],
  term ((-40440149595023928932116585720924683072 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (7, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1072 for generator 15. -/
theorem ep_Q2_024_partial_15_1072_valid :
    mulPoly ep_Q2_024_coefficient_15_1072
        ep_Q2_024_generator_15_1000_1099 =
      ep_Q2_024_partial_15_1072 := by
  native_decide

/-- Coefficient term 1073 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1073 : Poly :=
[
  term ((-2173624517752731263429423385757322935670570690431915648 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (5, 1), (7, 1), (14, 1), (15, 1)]
]

/-- Partial product 1073 for generator 15. -/
def ep_Q2_024_partial_15_1073 : Poly :=
[
  term ((-4347249035505462526858846771514645871341141380863831296 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (5, 1), (6, 1), (7, 1), (14, 1), (15, 1)],
  term ((2173624517752731263429423385757322935670570690431915648 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (5, 1), (7, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1073 for generator 15. -/
theorem ep_Q2_024_partial_15_1073_valid :
    mulPoly ep_Q2_024_coefficient_15_1073
        ep_Q2_024_generator_15_1000_1099 =
      ep_Q2_024_partial_15_1073 := by
  native_decide

/-- Coefficient term 1074 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1074 : Poly :=
[
  term ((-206941537023232 : Rat) / 1162780221153193) [(3, 1), (5, 1), (7, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1074 for generator 15. -/
def ep_Q2_024_partial_15_1074 : Poly :=
[
  term ((-413883074046464 : Rat) / 1162780221153193) [(3, 1), (5, 1), (6, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((206941537023232 : Rat) / 1162780221153193) [(3, 1), (5, 1), (7, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1074 for generator 15. -/
theorem ep_Q2_024_partial_15_1074_valid :
    mulPoly ep_Q2_024_coefficient_15_1074
        ep_Q2_024_generator_15_1000_1099 =
      ep_Q2_024_partial_15_1074 := by
  native_decide

/-- Coefficient term 1075 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1075 : Poly :=
[
  term ((-3598470897070569766576998477210171498668 : Rat) / 1799564186103715944850040292044308901985) [(3, 1), (5, 1), (8, 1)]
]

/-- Partial product 1075 for generator 15. -/
def ep_Q2_024_partial_15_1075 : Poly :=
[
  term ((-7196941794141139533153996954420342997336 : Rat) / 1799564186103715944850040292044308901985) [(3, 1), (5, 1), (6, 1), (8, 1)],
  term ((3598470897070569766576998477210171498668 : Rat) / 1799564186103715944850040292044308901985) [(3, 1), (5, 1), (8, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1075 for generator 15. -/
theorem ep_Q2_024_partial_15_1075_valid :
    mulPoly ep_Q2_024_coefficient_15_1075
        ep_Q2_024_generator_15_1000_1099 =
      ep_Q2_024_partial_15_1075 := by
  native_decide

/-- Coefficient term 1076 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1076 : Poly :=
[
  term ((24658840927150047600702623014067329464 : Rat) / 39990315246749243218889784267651308933) [(3, 1), (5, 1), (8, 1), (9, 1), (11, 1)]
]

/-- Partial product 1076 for generator 15. -/
def ep_Q2_024_partial_15_1076 : Poly :=
[
  term ((49317681854300095201405246028134658928 : Rat) / 39990315246749243218889784267651308933) [(3, 1), (5, 1), (6, 1), (8, 1), (9, 1), (11, 1)],
  term ((-24658840927150047600702623014067329464 : Rat) / 39990315246749243218889784267651308933) [(3, 1), (5, 1), (8, 1), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1076 for generator 15. -/
theorem ep_Q2_024_partial_15_1076_valid :
    mulPoly ep_Q2_024_coefficient_15_1076
        ep_Q2_024_generator_15_1000_1099 =
      ep_Q2_024_partial_15_1076 := by
  native_decide

/-- Coefficient term 1077 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1077 : Poly :=
[
  term ((436235768289341236967421850993701608432 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (5, 1), (8, 1), (9, 1), (13, 1)]
]

/-- Partial product 1077 for generator 15. -/
def ep_Q2_024_partial_15_1077 : Poly :=
[
  term ((872471536578682473934843701987403216864 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (5, 1), (6, 1), (8, 1), (9, 1), (13, 1)],
  term ((-436235768289341236967421850993701608432 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (5, 1), (8, 1), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1077 for generator 15. -/
theorem ep_Q2_024_partial_15_1077_valid :
    mulPoly ep_Q2_024_coefficient_15_1077
        ep_Q2_024_generator_15_1000_1099 =
      ep_Q2_024_partial_15_1077 := by
  native_decide

/-- Coefficient term 1078 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1078 : Poly :=
[
  term ((-4020828775229646273920745062779027820219088571223109254 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (5, 1), (8, 1), (9, 1), (15, 1)]
]

/-- Partial product 1078 for generator 15. -/
def ep_Q2_024_partial_15_1078 : Poly :=
[
  term ((-8041657550459292547841490125558055640438177142446218508 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (5, 1), (6, 1), (8, 1), (9, 1), (15, 1)],
  term ((4020828775229646273920745062779027820219088571223109254 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (5, 1), (8, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1078 for generator 15. -/
theorem ep_Q2_024_partial_15_1078_valid :
    mulPoly ep_Q2_024_coefficient_15_1078
        ep_Q2_024_generator_15_1000_1099 =
      ep_Q2_024_partial_15_1078 := by
  native_decide

/-- Coefficient term 1079 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1079 : Poly :=
[
  term ((5884563396179416 : Rat) / 3488340663459579) [(3, 1), (5, 1), (8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 1079 for generator 15. -/
def ep_Q2_024_partial_15_1079 : Poly :=
[
  term ((11769126792358832 : Rat) / 3488340663459579) [(3, 1), (5, 1), (6, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-5884563396179416 : Rat) / 3488340663459579) [(3, 1), (5, 1), (8, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1079 for generator 15. -/
theorem ep_Q2_024_partial_15_1079_valid :
    mulPoly ep_Q2_024_coefficient_15_1079
        ep_Q2_024_generator_15_1000_1099 =
      ep_Q2_024_partial_15_1079 := by
  native_decide

/-- Coefficient term 1080 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1080 : Poly :=
[
  term ((370229701304371273616127062071914241912 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (5, 1), (8, 1), (9, 2)]
]

/-- Partial product 1080 for generator 15. -/
def ep_Q2_024_partial_15_1080 : Poly :=
[
  term ((740459402608742547232254124143828483824 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (5, 1), (6, 1), (8, 1), (9, 2)],
  term ((-370229701304371273616127062071914241912 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (5, 1), (8, 1), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1080 for generator 15. -/
theorem ep_Q2_024_partial_15_1080_valid :
    mulPoly ep_Q2_024_coefficient_15_1080
        ep_Q2_024_generator_15_1000_1099 =
      ep_Q2_024_partial_15_1080 := by
  native_decide

/-- Coefficient term 1081 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1081 : Poly :=
[
  term ((157816417934512041276862316386764390896 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (8, 1), (11, 1), (13, 1)]
]

/-- Partial product 1081 for generator 15. -/
def ep_Q2_024_partial_15_1081 : Poly :=
[
  term ((315632835869024082553724632773528781792 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (6, 1), (8, 1), (11, 1), (13, 1)],
  term ((-157816417934512041276862316386764390896 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (8, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1081 for generator 15. -/
theorem ep_Q2_024_partial_15_1081_valid :
    mulPoly ep_Q2_024_coefficient_15_1081
        ep_Q2_024_generator_15_1000_1099 =
      ep_Q2_024_partial_15_1081 := by
  native_decide

/-- Coefficient term 1082 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1082 : Poly :=
[
  term ((-905649892486912115437703091516528642319088673319023280 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 1), (5, 1), (8, 1), (11, 1), (15, 1)]
]

/-- Partial product 1082 for generator 15. -/
def ep_Q2_024_partial_15_1082 : Poly :=
[
  term ((-1811299784973824230875406183033057284638177346638046560 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 1), (5, 1), (6, 1), (8, 1), (11, 1), (15, 1)],
  term ((905649892486912115437703091516528642319088673319023280 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 1), (5, 1), (8, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1082 for generator 15. -/
theorem ep_Q2_024_partial_15_1082_valid :
    mulPoly ep_Q2_024_coefficient_15_1082
        ep_Q2_024_generator_15_1000_1099 =
      ep_Q2_024_partial_15_1082 := by
  native_decide

/-- Coefficient term 1083 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1083 : Poly :=
[
  term ((-3263854553391488 : Rat) / 1162780221153193) [(3, 1), (5, 1), (8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 1083 for generator 15. -/
def ep_Q2_024_partial_15_1083 : Poly :=
[
  term ((-6527709106782976 : Rat) / 1162780221153193) [(3, 1), (5, 1), (6, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((3263854553391488 : Rat) / 1162780221153193) [(3, 1), (5, 1), (8, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1083 for generator 15. -/
theorem ep_Q2_024_partial_15_1083_valid :
    mulPoly ep_Q2_024_coefficient_15_1083
        ep_Q2_024_generator_15_1000_1099 =
      ep_Q2_024_partial_15_1083 := by
  native_decide

/-- Coefficient term 1084 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1084 : Poly :=
[
  term ((-11411605273029541008032460508186846605890014568048271908 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (5, 1), (8, 1), (13, 1), (15, 1)]
]

/-- Partial product 1084 for generator 15. -/
def ep_Q2_024_partial_15_1084 : Poly :=
[
  term ((-22823210546059082016064921016373693211780029136096543816 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (5, 1), (6, 1), (8, 1), (13, 1), (15, 1)],
  term ((11411605273029541008032460508186846605890014568048271908 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (5, 1), (8, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1084 for generator 15. -/
theorem ep_Q2_024_partial_15_1084_valid :
    mulPoly ep_Q2_024_coefficient_15_1084
        ep_Q2_024_generator_15_1000_1099 =
      ep_Q2_024_partial_15_1084 := by
  native_decide

/-- Coefficient term 1085 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1085 : Poly :=
[
  term ((150661185588720 : Rat) / 1162780221153193) [(3, 1), (5, 1), (8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1085 for generator 15. -/
def ep_Q2_024_partial_15_1085 : Poly :=
[
  term ((301322371177440 : Rat) / 1162780221153193) [(3, 1), (5, 1), (6, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-150661185588720 : Rat) / 1162780221153193) [(3, 1), (5, 1), (8, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1085 for generator 15. -/
theorem ep_Q2_024_partial_15_1085_valid :
    mulPoly ep_Q2_024_coefficient_15_1085
        ep_Q2_024_generator_15_1000_1099 =
      ep_Q2_024_partial_15_1085 := by
  native_decide

/-- Coefficient term 1086 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1086 : Poly :=
[
  term ((80945856112067634232098240062478093344 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (5, 1), (8, 1), (13, 2)]
]

/-- Partial product 1086 for generator 15. -/
def ep_Q2_024_partial_15_1086 : Poly :=
[
  term ((161891712224135268464196480124956186688 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (5, 1), (6, 1), (8, 1), (13, 2)],
  term ((-80945856112067634232098240062478093344 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (5, 1), (8, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1086 for generator 15. -/
theorem ep_Q2_024_partial_15_1086_valid :
    mulPoly ep_Q2_024_coefficient_15_1086
        ep_Q2_024_generator_15_1000_1099 =
      ep_Q2_024_partial_15_1086 := by
  native_decide

/-- Coefficient term 1087 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1087 : Poly :=
[
  term ((17842303055724083763118711211856783152 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (8, 1), (14, 1)]
]

/-- Partial product 1087 for generator 15. -/
def ep_Q2_024_partial_15_1087 : Poly :=
[
  term ((35684606111448167526237422423713566304 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (6, 1), (8, 1), (14, 1)],
  term ((-17842303055724083763118711211856783152 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (8, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1087 for generator 15. -/
theorem ep_Q2_024_partial_15_1087_valid :
    mulPoly ep_Q2_024_coefficient_15_1087
        ep_Q2_024_generator_15_1000_1099 =
      ep_Q2_024_partial_15_1087 := by
  native_decide

/-- Coefficient term 1088 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1088 : Poly :=
[
  term ((8041427323100157780307091328156563931516252580159861034 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (5, 1), (8, 1), (15, 2)]
]

/-- Partial product 1088 for generator 15. -/
def ep_Q2_024_partial_15_1088 : Poly :=
[
  term ((16082854646200315560614182656313127863032505160319722068 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (5, 1), (6, 1), (8, 1), (15, 2)],
  term ((-8041427323100157780307091328156563931516252580159861034 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (5, 1), (8, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1088 for generator 15. -/
theorem ep_Q2_024_partial_15_1088_valid :
    mulPoly ep_Q2_024_coefficient_15_1088
        ep_Q2_024_generator_15_1000_1099 =
      ep_Q2_024_partial_15_1088 := by
  native_decide

/-- Coefficient term 1089 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1089 : Poly :=
[
  term ((-1054067308495096 : Rat) / 1162780221153193) [(3, 1), (5, 1), (8, 1), (15, 2), (16, 1)]
]

/-- Partial product 1089 for generator 15. -/
def ep_Q2_024_partial_15_1089 : Poly :=
[
  term ((-2108134616990192 : Rat) / 1162780221153193) [(3, 1), (5, 1), (6, 1), (8, 1), (15, 2), (16, 1)],
  term ((1054067308495096 : Rat) / 1162780221153193) [(3, 1), (5, 1), (8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1089 for generator 15. -/
theorem ep_Q2_024_partial_15_1089_valid :
    mulPoly ep_Q2_024_coefficient_15_1089
        ep_Q2_024_generator_15_1000_1099 =
      ep_Q2_024_partial_15_1089 := by
  native_decide

/-- Coefficient term 1090 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1090 : Poly :=
[
  term ((-9849487629121118739226193456896959744 : Rat) / 39990315246749243218889784267651308933) [(3, 1), (5, 1), (9, 1), (13, 1)]
]

/-- Partial product 1090 for generator 15. -/
def ep_Q2_024_partial_15_1090 : Poly :=
[
  term ((-19698975258242237478452386913793919488 : Rat) / 39990315246749243218889784267651308933) [(3, 1), (5, 1), (6, 1), (9, 1), (13, 1)],
  term ((9849487629121118739226193456896959744 : Rat) / 39990315246749243218889784267651308933) [(3, 1), (5, 1), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1090 for generator 15. -/
theorem ep_Q2_024_partial_15_1090_valid :
    mulPoly ep_Q2_024_coefficient_15_1090
        ep_Q2_024_generator_15_1000_1099 =
      ep_Q2_024_partial_15_1090 := by
  native_decide

/-- Coefficient term 1091 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1091 : Poly :=
[
  term ((-195472833730678188627374464114891944832 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (5, 1), (9, 1), (13, 1), (14, 1)]
]

/-- Partial product 1091 for generator 15. -/
def ep_Q2_024_partial_15_1091 : Poly :=
[
  term ((-390945667461356377254748928229783889664 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (5, 1), (6, 1), (9, 1), (13, 1), (14, 1)],
  term ((195472833730678188627374464114891944832 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (5, 1), (9, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1091 for generator 15. -/
theorem ep_Q2_024_partial_15_1091_valid :
    mulPoly ep_Q2_024_coefficient_15_1091
        ep_Q2_024_generator_15_1000_1099 =
      ep_Q2_024_partial_15_1091 := by
  native_decide

/-- Coefficient term 1092 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1092 : Poly :=
[
  term ((-372888177235126313188097315327845719657294457097438278 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 1), (5, 1), (9, 1), (14, 1), (15, 1)]
]

/-- Partial product 1092 for generator 15. -/
def ep_Q2_024_partial_15_1092 : Poly :=
[
  term ((-745776354470252626376194630655691439314588914194876556 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 1), (5, 1), (6, 1), (9, 1), (14, 1), (15, 1)],
  term ((372888177235126313188097315327845719657294457097438278 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 1), (5, 1), (9, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1092 for generator 15. -/
theorem ep_Q2_024_partial_15_1092_valid :
    mulPoly ep_Q2_024_coefficient_15_1092
        ep_Q2_024_generator_15_1000_1099 =
      ep_Q2_024_partial_15_1092 := by
  native_decide

/-- Coefficient term 1093 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1093 : Poly :=
[
  term ((720356459271080 : Rat) / 1162780221153193) [(3, 1), (5, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1093 for generator 15. -/
def ep_Q2_024_partial_15_1093 : Poly :=
[
  term ((1440712918542160 : Rat) / 1162780221153193) [(3, 1), (5, 1), (6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-720356459271080 : Rat) / 1162780221153193) [(3, 1), (5, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1093 for generator 15. -/
theorem ep_Q2_024_partial_15_1093_valid :
    mulPoly ep_Q2_024_coefficient_15_1093
        ep_Q2_024_generator_15_1000_1099 =
      ep_Q2_024_partial_15_1093 := by
  native_decide

/-- Coefficient term 1094 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1094 : Poly :=
[
  term ((4367103871475277020228677532940080923716833804838955079 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(3, 1), (5, 1), (9, 1), (15, 1)]
]

/-- Partial product 1094 for generator 15. -/
def ep_Q2_024_partial_15_1094 : Poly :=
[
  term ((4367103871475277020228677532940080923716833804838955079 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (5, 1), (6, 1), (9, 1), (15, 1)],
  term ((-4367103871475277020228677532940080923716833804838955079 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(3, 1), (5, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1094 for generator 15. -/
theorem ep_Q2_024_partial_15_1094_valid :
    mulPoly ep_Q2_024_coefficient_15_1094
        ep_Q2_024_generator_15_1000_1099 =
      ep_Q2_024_partial_15_1094 := by
  native_decide

/-- Coefficient term 1095 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1095 : Poly :=
[
  term ((-322051728130426 : Rat) / 1162780221153193) [(3, 1), (5, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 1095 for generator 15. -/
def ep_Q2_024_partial_15_1095 : Poly :=
[
  term ((-644103456260852 : Rat) / 1162780221153193) [(3, 1), (5, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((322051728130426 : Rat) / 1162780221153193) [(3, 1), (5, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1095 for generator 15. -/
theorem ep_Q2_024_partial_15_1095_valid :
    mulPoly ep_Q2_024_coefficient_15_1095
        ep_Q2_024_generator_15_1000_1099 =
      ep_Q2_024_partial_15_1095 := by
  native_decide

/-- Coefficient term 1096 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1096 : Poly :=
[
  term ((-40001757907683377537356373484138494952 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (9, 2)]
]

/-- Partial product 1096 for generator 15. -/
def ep_Q2_024_partial_15_1096 : Poly :=
[
  term ((-80003515815366755074712746968276989904 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (6, 1), (9, 2)],
  term ((40001757907683377537356373484138494952 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1096 for generator 15. -/
theorem ep_Q2_024_partial_15_1096_valid :
    mulPoly ep_Q2_024_coefficient_15_1096
        ep_Q2_024_generator_15_1000_1099 =
      ep_Q2_024_partial_15_1096 := by
  native_decide

/-- Coefficient term 1097 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1097 : Poly :=
[
  term ((-33781967257793617486815206073153137696 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (9, 2), (14, 1)]
]

/-- Partial product 1097 for generator 15. -/
def ep_Q2_024_partial_15_1097 : Poly :=
[
  term ((-67563934515587234973630412146306275392 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (6, 1), (9, 2), (14, 1)],
  term ((33781967257793617486815206073153137696 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (9, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1097 for generator 15. -/
theorem ep_Q2_024_partial_15_1097_valid :
    mulPoly ep_Q2_024_coefficient_15_1097
        ep_Q2_024_generator_15_1000_1099 =
      ep_Q2_024_partial_15_1097 := by
  native_decide

/-- Coefficient term 1098 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1098 : Poly :=
[
  term ((8921151527862041881559355605928391576 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (5, 1), (12, 1)]
]

/-- Partial product 1098 for generator 15. -/
def ep_Q2_024_partial_15_1098 : Poly :=
[
  term ((17842303055724083763118711211856783152 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (5, 1), (6, 1), (12, 1)],
  term ((-8921151527862041881559355605928391576 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (5, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1098 for generator 15. -/
theorem ep_Q2_024_partial_15_1098_valid :
    mulPoly ep_Q2_024_coefficient_15_1098
        ep_Q2_024_generator_15_1000_1099 =
      ep_Q2_024_partial_15_1098 := by
  native_decide

/-- Coefficient term 1099 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1099 : Poly :=
[
  term ((562418704806228097975015710983934511897601093999046709 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 1), (5, 1), (13, 1), (15, 1)]
]

/-- Partial product 1099 for generator 15. -/
def ep_Q2_024_partial_15_1099 : Poly :=
[
  term ((1124837409612456195950031421967869023795202187998093418 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 1), (5, 1), (6, 1), (13, 1), (15, 1)],
  term ((-562418704806228097975015710983934511897601093999046709 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 1), (5, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1099 for generator 15. -/
theorem ep_Q2_024_partial_15_1099_valid :
    mulPoly ep_Q2_024_coefficient_15_1099
        ep_Q2_024_generator_15_1000_1099 =
      ep_Q2_024_partial_15_1099 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_024_partials_15_1000_1099 : List Poly :=
[
  ep_Q2_024_partial_15_1000,
  ep_Q2_024_partial_15_1001,
  ep_Q2_024_partial_15_1002,
  ep_Q2_024_partial_15_1003,
  ep_Q2_024_partial_15_1004,
  ep_Q2_024_partial_15_1005,
  ep_Q2_024_partial_15_1006,
  ep_Q2_024_partial_15_1007,
  ep_Q2_024_partial_15_1008,
  ep_Q2_024_partial_15_1009,
  ep_Q2_024_partial_15_1010,
  ep_Q2_024_partial_15_1011,
  ep_Q2_024_partial_15_1012,
  ep_Q2_024_partial_15_1013,
  ep_Q2_024_partial_15_1014,
  ep_Q2_024_partial_15_1015,
  ep_Q2_024_partial_15_1016,
  ep_Q2_024_partial_15_1017,
  ep_Q2_024_partial_15_1018,
  ep_Q2_024_partial_15_1019,
  ep_Q2_024_partial_15_1020,
  ep_Q2_024_partial_15_1021,
  ep_Q2_024_partial_15_1022,
  ep_Q2_024_partial_15_1023,
  ep_Q2_024_partial_15_1024,
  ep_Q2_024_partial_15_1025,
  ep_Q2_024_partial_15_1026,
  ep_Q2_024_partial_15_1027,
  ep_Q2_024_partial_15_1028,
  ep_Q2_024_partial_15_1029,
  ep_Q2_024_partial_15_1030,
  ep_Q2_024_partial_15_1031,
  ep_Q2_024_partial_15_1032,
  ep_Q2_024_partial_15_1033,
  ep_Q2_024_partial_15_1034,
  ep_Q2_024_partial_15_1035,
  ep_Q2_024_partial_15_1036,
  ep_Q2_024_partial_15_1037,
  ep_Q2_024_partial_15_1038,
  ep_Q2_024_partial_15_1039,
  ep_Q2_024_partial_15_1040,
  ep_Q2_024_partial_15_1041,
  ep_Q2_024_partial_15_1042,
  ep_Q2_024_partial_15_1043,
  ep_Q2_024_partial_15_1044,
  ep_Q2_024_partial_15_1045,
  ep_Q2_024_partial_15_1046,
  ep_Q2_024_partial_15_1047,
  ep_Q2_024_partial_15_1048,
  ep_Q2_024_partial_15_1049,
  ep_Q2_024_partial_15_1050,
  ep_Q2_024_partial_15_1051,
  ep_Q2_024_partial_15_1052,
  ep_Q2_024_partial_15_1053,
  ep_Q2_024_partial_15_1054,
  ep_Q2_024_partial_15_1055,
  ep_Q2_024_partial_15_1056,
  ep_Q2_024_partial_15_1057,
  ep_Q2_024_partial_15_1058,
  ep_Q2_024_partial_15_1059,
  ep_Q2_024_partial_15_1060,
  ep_Q2_024_partial_15_1061,
  ep_Q2_024_partial_15_1062,
  ep_Q2_024_partial_15_1063,
  ep_Q2_024_partial_15_1064,
  ep_Q2_024_partial_15_1065,
  ep_Q2_024_partial_15_1066,
  ep_Q2_024_partial_15_1067,
  ep_Q2_024_partial_15_1068,
  ep_Q2_024_partial_15_1069,
  ep_Q2_024_partial_15_1070,
  ep_Q2_024_partial_15_1071,
  ep_Q2_024_partial_15_1072,
  ep_Q2_024_partial_15_1073,
  ep_Q2_024_partial_15_1074,
  ep_Q2_024_partial_15_1075,
  ep_Q2_024_partial_15_1076,
  ep_Q2_024_partial_15_1077,
  ep_Q2_024_partial_15_1078,
  ep_Q2_024_partial_15_1079,
  ep_Q2_024_partial_15_1080,
  ep_Q2_024_partial_15_1081,
  ep_Q2_024_partial_15_1082,
  ep_Q2_024_partial_15_1083,
  ep_Q2_024_partial_15_1084,
  ep_Q2_024_partial_15_1085,
  ep_Q2_024_partial_15_1086,
  ep_Q2_024_partial_15_1087,
  ep_Q2_024_partial_15_1088,
  ep_Q2_024_partial_15_1089,
  ep_Q2_024_partial_15_1090,
  ep_Q2_024_partial_15_1091,
  ep_Q2_024_partial_15_1092,
  ep_Q2_024_partial_15_1093,
  ep_Q2_024_partial_15_1094,
  ep_Q2_024_partial_15_1095,
  ep_Q2_024_partial_15_1096,
  ep_Q2_024_partial_15_1097,
  ep_Q2_024_partial_15_1098,
  ep_Q2_024_partial_15_1099
]

/-- Sum of partial products in this block. -/
def ep_Q2_024_block_15_1000_1099 : Poly :=
[
  term ((-2553226962037678 : Rat) / 3488340663459579) [(2, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-520071569087566130983140885545684619440 : Rat) / 119970945740247729656669352802953926799) [(2, 2), (6, 1), (9, 2)],
  term ((4281089153612859170931146538257430160 : Rat) / 39990315246749243218889784267651308933) [(2, 2), (6, 1), (12, 1)],
  term ((11505073964399522846249871046495738097852688577051920964 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 2), (6, 1), (13, 1), (15, 1)],
  term ((-150661185588720 : Rat) / 1162780221153193) [(2, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-80945856112067634232098240062478093344 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (6, 1), (13, 2)],
  term ((-17842303055724083763118711211856783152 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (6, 1), (14, 1)],
  term ((-5633709133854896624680034347401390035670218004313073105 : Rat) / 139499842819802972775716014625439884620101963487119207) [(2, 2), (6, 1), (15, 2)],
  term ((4263316396002204 : Rat) / 1162780221153193) [(2, 2), (6, 1), (15, 2), (16, 1)],
  term ((1276613481018839 : Rat) / 3488340663459579) [(2, 2), (9, 1), (15, 1), (16, 1)],
  term ((260035784543783065491570442772842309720 : Rat) / 119970945740247729656669352802953926799) [(2, 2), (9, 2)],
  term ((-2140544576806429585465573269128715080 : Rat) / 39990315246749243218889784267651308933) [(2, 2), (12, 1)],
  term ((-5752536982199761423124935523247869048926344288525960482 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 2), (13, 1), (15, 1)],
  term ((75330592794360 : Rat) / 1162780221153193) [(2, 2), (13, 1), (15, 1), (16, 1)],
  term ((40472928056033817116049120031239046672 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (13, 2)],
  term ((8921151527862041881559355605928391576 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (14, 1)],
  term ((5633709133854896624680034347401390035670218004313073105 : Rat) / 278999685639605945551432029250879769240203926974238414) [(2, 2), (15, 2)],
  term ((-2131658198001102 : Rat) / 1162780221153193) [(2, 2), (15, 2), (16, 1)],
  term ((-33781967257793617486815206073153137696 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (4, 1), (5, 1), (6, 1), (7, 1), (9, 1)],
  term ((-40440149595023928932116585720924683072 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (4, 1), (5, 1), (6, 1), (7, 1), (13, 1)],
  term ((2173624517752731263429423385757322935670570690431915648 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (4, 1), (5, 1), (6, 1), (7, 1), (15, 1)],
  term ((206941537023232 : Rat) / 1162780221153193) [(3, 1), (4, 1), (5, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((16890983628896808743407603036576568848 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (4, 1), (5, 1), (7, 1), (9, 1)],
  term ((20220074797511964466058292860462341536 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (4, 1), (5, 1), (7, 1), (13, 1)],
  term ((-1086812258876365631714711692878661467835285345215957824 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (4, 1), (5, 1), (7, 1), (15, 1)],
  term ((-103470768511616 : Rat) / 1162780221153193) [(3, 1), (4, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-17842303055724083763118711211856783152 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (4, 1), (6, 1), (7, 1)],
  term ((2930149234713651113130679487801312091016 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (4, 1), (6, 1), (7, 1), (8, 1)],
  term ((156549602987398445852407283417014511808 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (4, 1), (6, 1), (7, 1), (9, 1), (13, 1)],
  term ((-2449020209846403374712074673893548417307732695016543182 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (4, 1), (6, 1), (7, 1), (9, 1), (15, 1)],
  term ((1495148449544936 : Rat) / 1162780221153193) [(3, 1), (4, 1), (6, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((126225064372939892662610287863400842112 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (4, 1), (6, 1), (7, 1), (9, 2)],
  term ((-2930149234713651113130679487801312091016 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (4, 1), (6, 1), (7, 1), (12, 1)],
  term ((-11530512132661982754025626129402130138490986283296027556 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (4, 1), (6, 1), (7, 1), (13, 1), (15, 1)],
  term ((150661185588720 : Rat) / 1162780221153193) [(3, 1), (4, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((80945856112067634232098240062478093344 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (4, 1), (6, 1), (7, 1), (13, 2)],
  term ((17842303055724083763118711211856783152 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (4, 1), (6, 1), (7, 1), (14, 1)],
  term ((15109217256518315323716689223387286634317328803199609516 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (4, 1), (6, 1), (7, 1), (15, 2)],
  term ((-2130221066942416 : Rat) / 1162780221153193) [(3, 1), (4, 1), (6, 1), (7, 1), (15, 2), (16, 1)],
  term ((364963913710038598414892315328730093496 : Rat) / 359912837220743188970008058408861780397) [(3, 1), (4, 1), (6, 1), (8, 1), (9, 1)],
  term ((2930149234713651113130679487801312091016 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (4, 1), (6, 1), (8, 1), (11, 1)],
  term ((35642499957650873127394521191182088176 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (4, 1), (6, 1), (8, 1), (13, 1)],
  term ((424161063795057930629132723086609003137058634794396433 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 1), (4, 1), (6, 1), (8, 1), (15, 1)],
  term ((-143537182424828 : Rat) / 1162780221153193) [(3, 1), (4, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((-124519735862217619723317250107126066808 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (4, 1), (6, 1), (9, 1)],
  term ((-76592858793922209196126671455727439296 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (4, 1), (6, 1), (9, 1), (12, 1)],
  term ((-5860298469427302226261358975602624182032 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (4, 1), (6, 1), (9, 1), (14, 1)],
  term ((-40472928056033817116049120031239046672 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (4, 1), (6, 1), (12, 1), (13, 1)],
  term ((5752536982199761423124935523247869048926344288525960482 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (4, 1), (6, 1), (12, 1), (15, 1)],
  term ((-75330592794360 : Rat) / 1162780221153193) [(3, 1), (4, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-61914848349668071409602006018666087504 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (4, 1), (6, 1), (13, 1)],
  term ((80847520729037969680300637131535002544 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (4, 1), (6, 1), (13, 1), (14, 1)],
  term ((-855435513563815829845781257791179841343003020204599854 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (4, 1), (6, 1), (14, 1), (15, 1)],
  term ((-282272129817592 : Rat) / 1162780221153193) [(3, 1), (4, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-14745830983123537453104324411574200091686880643440504111 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(3, 1), (4, 1), (6, 1), (15, 1)],
  term ((669175912212714 : Rat) / 1162780221153193) [(3, 1), (4, 1), (6, 1), (15, 1), (16, 1)],
  term ((122814407351495346784024212350851291504 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (4, 1), (6, 2), (9, 1)],
  term ((-26079979143914649701882926442011261984 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (4, 1), (6, 2), (13, 1)],
  term ((1279332772588430482173835610044994821028103267071148719 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (4, 1), (6, 2), (15, 1)],
  term ((-138734947392764 : Rat) / 1162780221153193) [(3, 1), (4, 1), (6, 2), (15, 1), (16, 1)],
  term ((8921151527862041881559355605928391576 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (4, 1), (7, 1)],
  term ((-1465074617356825556565339743900656045508 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (4, 1), (7, 1), (8, 1)],
  term ((-78274801493699222926203641708507255904 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (4, 1), (7, 1), (9, 1), (13, 1)],
  term ((1224510104923201687356037336946774208653866347508271591 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (4, 1), (7, 1), (9, 1), (15, 1)],
  term ((-747574224772468 : Rat) / 1162780221153193) [(3, 1), (4, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-63112532186469946331305143931700421056 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (4, 1), (7, 1), (9, 2)],
  term ((1465074617356825556565339743900656045508 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (4, 1), (7, 1), (12, 1)],
  term ((5765256066330991377012813064701065069245493141648013778 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (4, 1), (7, 1), (13, 1), (15, 1)],
  term ((-75330592794360 : Rat) / 1162780221153193) [(3, 1), (4, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-40472928056033817116049120031239046672 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (4, 1), (7, 1), (13, 2)],
  term ((-8921151527862041881559355605928391576 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (4, 1), (7, 1), (14, 1)],
  term ((-7554608628259157661858344611693643317158664401599804758 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (4, 1), (7, 1), (15, 2)],
  term ((1065110533471208 : Rat) / 1162780221153193) [(3, 1), (4, 1), (7, 1), (15, 2), (16, 1)],
  term ((-182481956855019299207446157664365046748 : Rat) / 359912837220743188970008058408861780397) [(3, 1), (4, 1), (8, 1), (9, 1)],
  term ((-1465074617356825556565339743900656045508 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (4, 1), (8, 1), (11, 1)],
  term ((-17821249978825436563697260595591044088 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (4, 1), (8, 1), (13, 1)],
  term ((-424161063795057930629132723086609003137058634794396433 : Rat) / 278999685639605945551432029250879769240203926974238414) [(3, 1), (4, 1), (8, 1), (15, 1)],
  term ((71768591212414 : Rat) / 1162780221153193) [(3, 1), (4, 1), (8, 1), (15, 1), (16, 1)],
  term ((31556266093234973165652571965850210528 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (4, 1), (9, 1)],
  term ((38296429396961104598063335727863719648 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (4, 1), (9, 1), (12, 1)],
  term ((2930149234713651113130679487801312091016 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (4, 1), (9, 1), (14, 1)],
  term ((20236464028016908558024560015619523336 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (4, 1), (12, 1), (13, 1)],
  term ((-2876268491099880711562467761623934524463172144262980241 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (4, 1), (12, 1), (15, 1)],
  term ((37665296397180 : Rat) / 1162780221153193) [(3, 1), (4, 1), (12, 1), (15, 1), (16, 1)],
  term ((12492472986937566043423911539945286416 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (4, 1), (13, 1)],
  term ((-40423760364518984840150318565767501272 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (4, 1), (13, 1), (14, 1)],
  term ((427717756781907914922890628895589920671501510102299927 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (4, 1), (14, 1), (15, 1)],
  term ((141136064908796 : Rat) / 1162780221153193) [(3, 1), (4, 1), (14, 1), (15, 1), (16, 1)],
  term ((5453916332679123003291408790719607814301285421113528977 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(3, 1), (4, 1), (15, 1)],
  term ((-299904219258166 : Rat) / 1162780221153193) [(3, 1), (4, 1), (15, 1), (16, 1)],
  term ((16890983628896808743407603036576568848 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (4, 2), (6, 1), (9, 1)],
  term ((20220074797511964466058292860462341536 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (4, 2), (6, 1), (13, 1)],
  term ((-1086812258876365631714711692878661467835285345215957824 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (4, 2), (6, 1), (15, 1)],
  term ((-103470768511616 : Rat) / 1162780221153193) [(3, 1), (4, 2), (6, 1), (15, 1), (16, 1)],
  term ((-8445491814448404371703801518288284424 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (4, 2), (9, 1)],
  term ((-10110037398755982233029146430231170768 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (4, 2), (13, 1)],
  term ((543406129438182815857355846439330733917642672607978912 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (4, 2), (15, 1)],
  term ((51735384255808 : Rat) / 1162780221153193) [(3, 1), (4, 2), (15, 1), (16, 1)],
  term ((-4460575763931020940779677802964195788 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (5, 1)],
  term ((49317681854300095201405246028134658928 : Rat) / 39990315246749243218889784267651308933) [(3, 1), (5, 1), (6, 1), (7, 1), (8, 1), (9, 1)],
  term ((315632835869024082553724632773528781792 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (6, 1), (7, 1), (8, 1), (13, 1)],
  term ((-1811299784973824230875406183033057284638177346638046560 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 1), (5, 1), (6, 1), (7, 1), (8, 1), (15, 1)],
  term ((-6527709106782976 : Rat) / 1162780221153193) [(3, 1), (5, 1), (6, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-212806442013706858520211024067520156944 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (6, 1), (7, 1), (9, 1), (12, 1)],
  term ((67563934515587234973630412146306275392 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (6, 1), (7, 1), (9, 1), (14, 1)],
  term ((-55038537254800030724321609410520819744 : Rat) / 39990315246749243218889784267651308933) [(3, 1), (5, 1), (6, 1), (7, 1), (12, 1), (13, 1)],
  term ((2535625371610927364088760757893317616179174661894485856 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (5, 1), (6, 1), (7, 1), (12, 1), (15, 1)],
  term ((6320767569759744 : Rat) / 1162780221153193) [(3, 1), (5, 1), (6, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((80880299190047857864233171441849366144 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (6, 1), (7, 1), (13, 1), (14, 1)],
  term ((-4347249035505462526858846771514645871341141380863831296 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (5, 1), (6, 1), (7, 1), (14, 1), (15, 1)],
  term ((-413883074046464 : Rat) / 1162780221153193) [(3, 1), (5, 1), (6, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7196941794141139533153996954420342997336 : Rat) / 1799564186103715944850040292044308901985) [(3, 1), (5, 1), (6, 1), (8, 1)],
  term ((49317681854300095201405246028134658928 : Rat) / 39990315246749243218889784267651308933) [(3, 1), (5, 1), (6, 1), (8, 1), (9, 1), (11, 1)],
  term ((872471536578682473934843701987403216864 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (5, 1), (6, 1), (8, 1), (9, 1), (13, 1)],
  term ((-8041657550459292547841490125558055640438177142446218508 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (5, 1), (6, 1), (8, 1), (9, 1), (15, 1)],
  term ((11769126792358832 : Rat) / 3488340663459579) [(3, 1), (5, 1), (6, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((740459402608742547232254124143828483824 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (5, 1), (6, 1), (8, 1), (9, 2)],
  term ((315632835869024082553724632773528781792 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (6, 1), (8, 1), (11, 1), (13, 1)],
  term ((-1811299784973824230875406183033057284638177346638046560 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 1), (5, 1), (6, 1), (8, 1), (11, 1), (15, 1)],
  term ((-6527709106782976 : Rat) / 1162780221153193) [(3, 1), (5, 1), (6, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-22823210546059082016064921016373693211780029136096543816 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (5, 1), (6, 1), (8, 1), (13, 1), (15, 1)],
  term ((301322371177440 : Rat) / 1162780221153193) [(3, 1), (5, 1), (6, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((161891712224135268464196480124956186688 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (5, 1), (6, 1), (8, 1), (13, 2)],
  term ((35684606111448167526237422423713566304 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (6, 1), (8, 1), (14, 1)],
  term ((16082854646200315560614182656313127863032505160319722068 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (5, 1), (6, 1), (8, 1), (15, 2)],
  term ((-2108134616990192 : Rat) / 1162780221153193) [(3, 1), (5, 1), (6, 1), (8, 1), (15, 2), (16, 1)],
  term ((-390945667461356377254748928229783889664 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (5, 1), (6, 1), (9, 1), (13, 1), (14, 1)],
  term ((-745776354470252626376194630655691439314588914194876556 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 1), (5, 1), (6, 1), (9, 1), (14, 1), (15, 1)],
  term ((1440712918542160 : Rat) / 1162780221153193) [(3, 1), (5, 1), (6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-67563934515587234973630412146306275392 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (6, 1), (9, 2), (14, 1)],
  term ((17842303055724083763118711211856783152 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (5, 1), (6, 1), (12, 1)],
  term ((75330592794360 : Rat) / 1162780221153193) [(3, 1), (5, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((40472928056033817116049120031239046672 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (5, 1), (6, 1), (13, 2)],
  term ((8921151527862041881559355605928391576 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (6, 1), (14, 1)],
  term ((1033735075000963871570074454421674510146952330304057814 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (5, 1), (6, 1), (15, 2)],
  term ((-1272052070494440 : Rat) / 1162780221153193) [(3, 1), (5, 1), (6, 1), (15, 2), (16, 1)],
  term ((17842303055724083763118711211856783152 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (5, 1), (6, 2)],
  term ((-39397950516484474956904773827587838976 : Rat) / 39990315246749243218889784267651308933) [(3, 1), (5, 1), (6, 2), (9, 1), (13, 1)],
  term ((8734207742950554040457355065880161847433667609677910158 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (5, 1), (6, 2), (9, 1), (15, 1)],
  term ((-1288206912521704 : Rat) / 1162780221153193) [(3, 1), (5, 1), (6, 2), (9, 1), (15, 1), (16, 1)],
  term ((-160007031630733510149425493936553979808 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (6, 2), (9, 2)],
  term ((2249674819224912391900062843935738047590404375996186836 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 1), (5, 1), (6, 2), (13, 1), (15, 1)],
  term ((-150661185588720 : Rat) / 1162780221153193) [(3, 1), (5, 1), (6, 2), (13, 1), (15, 1), (16, 1)],
  term ((-80945856112067634232098240062478093344 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (5, 1), (6, 2), (13, 2)],
  term ((-17842303055724083763118711211856783152 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (6, 2), (14, 1)],
  term ((-2067470150001927743140148908843349020293904660608115628 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (5, 1), (6, 2), (15, 2)],
  term ((2544104140988880 : Rat) / 1162780221153193) [(3, 1), (5, 1), (6, 2), (15, 2), (16, 1)],
  term ((-24658840927150047600702623014067329464 : Rat) / 39990315246749243218889784267651308933) [(3, 1), (5, 1), (7, 1), (8, 1), (9, 1)],
  term ((-157816417934512041276862316386764390896 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (7, 1), (8, 1), (13, 1)],
  term ((905649892486912115437703091516528642319088673319023280 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 1), (5, 1), (7, 1), (8, 1), (15, 1)],
  term ((3263854553391488 : Rat) / 1162780221153193) [(3, 1), (5, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((106403221006853429260105512033760078472 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (7, 1), (9, 1), (12, 1)],
  term ((-33781967257793617486815206073153137696 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (7, 1), (9, 1), (14, 1)],
  term ((27519268627400015362160804705260409872 : Rat) / 39990315246749243218889784267651308933) [(3, 1), (5, 1), (7, 1), (12, 1), (13, 1)],
  term ((-1267812685805463682044380378946658808089587330947242928 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (5, 1), (7, 1), (12, 1), (15, 1)],
  term ((-3160383784879872 : Rat) / 1162780221153193) [(3, 1), (5, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-40440149595023928932116585720924683072 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (7, 1), (13, 1), (14, 1)],
  term ((2173624517752731263429423385757322935670570690431915648 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (5, 1), (7, 1), (14, 1), (15, 1)],
  term ((206941537023232 : Rat) / 1162780221153193) [(3, 1), (5, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((3598470897070569766576998477210171498668 : Rat) / 1799564186103715944850040292044308901985) [(3, 1), (5, 1), (8, 1)],
  term ((-24658840927150047600702623014067329464 : Rat) / 39990315246749243218889784267651308933) [(3, 1), (5, 1), (8, 1), (9, 1), (11, 1)],
  term ((-436235768289341236967421850993701608432 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (5, 1), (8, 1), (9, 1), (13, 1)],
  term ((4020828775229646273920745062779027820219088571223109254 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (5, 1), (8, 1), (9, 1), (15, 1)],
  term ((-5884563396179416 : Rat) / 3488340663459579) [(3, 1), (5, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-370229701304371273616127062071914241912 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (5, 1), (8, 1), (9, 2)],
  term ((-157816417934512041276862316386764390896 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (8, 1), (11, 1), (13, 1)],
  term ((905649892486912115437703091516528642319088673319023280 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 1), (5, 1), (8, 1), (11, 1), (15, 1)],
  term ((3263854553391488 : Rat) / 1162780221153193) [(3, 1), (5, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((11411605273029541008032460508186846605890014568048271908 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (5, 1), (8, 1), (13, 1), (15, 1)],
  term ((-150661185588720 : Rat) / 1162780221153193) [(3, 1), (5, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-80945856112067634232098240062478093344 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (5, 1), (8, 1), (13, 2)],
  term ((-17842303055724083763118711211856783152 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (8, 1), (14, 1)],
  term ((-8041427323100157780307091328156563931516252580159861034 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (5, 1), (8, 1), (15, 2)],
  term ((1054067308495096 : Rat) / 1162780221153193) [(3, 1), (5, 1), (8, 1), (15, 2), (16, 1)],
  term ((9849487629121118739226193456896959744 : Rat) / 39990315246749243218889784267651308933) [(3, 1), (5, 1), (9, 1), (13, 1)],
  term ((195472833730678188627374464114891944832 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (5, 1), (9, 1), (13, 1), (14, 1)],
  term ((372888177235126313188097315327845719657294457097438278 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 1), (5, 1), (9, 1), (14, 1), (15, 1)],
  term ((-720356459271080 : Rat) / 1162780221153193) [(3, 1), (5, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4367103871475277020228677532940080923716833804838955079 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(3, 1), (5, 1), (9, 1), (15, 1)],
  term ((322051728130426 : Rat) / 1162780221153193) [(3, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((40001757907683377537356373484138494952 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (9, 2)],
  term ((33781967257793617486815206073153137696 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (9, 2), (14, 1)],
  term ((-8921151527862041881559355605928391576 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (5, 1), (12, 1)],
  term ((-562418704806228097975015710983934511897601093999046709 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 1), (5, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 15, terms 1000 through 1099. -/
theorem ep_Q2_024_block_15_1000_1099_valid :
    checkProductSumEq ep_Q2_024_partials_15_1000_1099
      ep_Q2_024_block_15_1000_1099 = true := by
  native_decide

end EpQ2024TermShards

end Patterns

end EndpointCertificate

end Problem97
