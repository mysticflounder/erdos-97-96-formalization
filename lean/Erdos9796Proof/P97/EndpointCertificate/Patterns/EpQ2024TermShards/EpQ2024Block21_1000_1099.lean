/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_024, term block 21:1000-1099

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_024`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2024TermShards

/-- Generator polynomial 21 for endpoint certificate `ep_Q2_024`. -/
def ep_Q2_024_generator_21_1000_1099 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(10, 1)]
]

/-- Coefficient term 1000 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1000 : Poly :=
[
  term ((-87483070406245862995382813691713434496 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (11, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 1000 for generator 21. -/
def ep_Q2_024_partial_21_1000 : Poly :=
[
  term ((-174966140812491725990765627383426868992 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (10, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((87483070406245862995382813691713434496 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (11, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1000 for generator 21. -/
theorem ep_Q2_024_partial_21_1000_valid :
    mulPoly ep_Q2_024_coefficient_21_1000
        ep_Q2_024_generator_21_1000_1099 =
      ep_Q2_024_partial_21_1000 := by
  native_decide

/-- Coefficient term 1001 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1001 : Poly :=
[
  term ((-8088250242351929820163091804873870410062191739236192053 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (11, 1), (12, 1), (15, 2)]
]

/-- Partial product 1001 for generator 21. -/
def ep_Q2_024_partial_21_1001 : Poly :=
[
  term ((-16176500484703859640326183609747740820124383478472384106 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (10, 1), (11, 1), (12, 1), (15, 2)],
  term ((8088250242351929820163091804873870410062191739236192053 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (11, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1001 for generator 21. -/
theorem ep_Q2_024_partial_21_1001_valid :
    mulPoly ep_Q2_024_coefficient_21_1001
        ep_Q2_024_generator_21_1000_1099 =
      ep_Q2_024_partial_21_1001 := by
  native_decide

/-- Coefficient term 1002 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1002 : Poly :=
[
  term ((-57972216906980 : Rat) / 1162780221153193) [(7, 1), (11, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1002 for generator 21. -/
def ep_Q2_024_partial_21_1002 : Poly :=
[
  term ((-115944433813960 : Rat) / 1162780221153193) [(7, 1), (10, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((57972216906980 : Rat) / 1162780221153193) [(7, 1), (11, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1002 for generator 21. -/
theorem ep_Q2_024_partial_21_1002_valid :
    mulPoly ep_Q2_024_coefficient_21_1002
        ep_Q2_024_generator_21_1000_1099 =
      ep_Q2_024_partial_21_1002 := by
  native_decide

/-- Coefficient term 1003 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1003 : Poly :=
[
  term ((-1964085486715778448984320958955741085701 : Rat) / 1799564186103715944850040292044308901985) [(7, 1), (12, 1), (13, 1)]
]

/-- Partial product 1003 for generator 21. -/
def ep_Q2_024_partial_21_1003 : Poly :=
[
  term ((-3928170973431556897968641917911482171402 : Rat) / 1799564186103715944850040292044308901985) [(7, 1), (10, 1), (12, 1), (13, 1)],
  term ((1964085486715778448984320958955741085701 : Rat) / 1799564186103715944850040292044308901985) [(7, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1003 for generator 21. -/
theorem ep_Q2_024_partial_21_1003_valid :
    mulPoly ep_Q2_024_coefficient_21_1003
        ep_Q2_024_generator_21_1000_1099 =
      ep_Q2_024_partial_21_1003 := by
  native_decide

/-- Coefficient term 1004 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1004 : Poly :=
[
  term ((8141645059018279550062865804762825616 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 1004 for generator 21. -/
def ep_Q2_024_partial_21_1004 : Poly :=
[
  term ((16283290118036559100125731609525651232 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((-8141645059018279550062865804762825616 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1004 for generator 21. -/
theorem ep_Q2_024_partial_21_1004_valid :
    mulPoly ep_Q2_024_coefficient_21_1004
        ep_Q2_024_generator_21_1000_1099 =
      ep_Q2_024_partial_21_1004 := by
  native_decide

/-- Coefficient term 1005 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1005 : Poly :=
[
  term ((12993854568522293920978843515494007592 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (12, 1), (13, 1), (14, 2)]
]

/-- Partial product 1005 for generator 21. -/
def ep_Q2_024_partial_21_1005 : Poly :=
[
  term ((25987709137044587841957687030988015184 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (10, 1), (12, 1), (13, 1), (14, 2)],
  term ((-12993854568522293920978843515494007592 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (12, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1005 for generator 21. -/
theorem ep_Q2_024_partial_21_1005_valid :
    mulPoly ep_Q2_024_coefficient_21_1005
        ep_Q2_024_generator_21_1000_1099 =
      ep_Q2_024_partial_21_1005 := by
  native_decide

/-- Coefficient term 1006 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1006 : Poly :=
[
  term ((3970579869320046188890854025519078292100922916260815664 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (12, 1), (13, 1), (15, 2)]
]

/-- Partial product 1006 for generator 21. -/
def ep_Q2_024_partial_21_1006 : Poly :=
[
  term ((7941159738640092377781708051038156584201845832521631328 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (10, 1), (12, 1), (13, 1), (15, 2)],
  term ((-3970579869320046188890854025519078292100922916260815664 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1006 for generator 21. -/
theorem ep_Q2_024_partial_21_1006_valid :
    mulPoly ep_Q2_024_coefficient_21_1006
        ep_Q2_024_generator_21_1000_1099 =
      ep_Q2_024_partial_21_1006 := by
  native_decide

/-- Coefficient term 1007 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1007 : Poly :=
[
  term ((-547402423131936 : Rat) / 1162780221153193) [(7, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 1007 for generator 21. -/
def ep_Q2_024_partial_21_1007 : Poly :=
[
  term ((-1094804846263872 : Rat) / 1162780221153193) [(7, 1), (10, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((547402423131936 : Rat) / 1162780221153193) [(7, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1007 for generator 21. -/
theorem ep_Q2_024_partial_21_1007_valid :
    mulPoly ep_Q2_024_coefficient_21_1007
        ep_Q2_024_generator_21_1000_1099 =
      ep_Q2_024_partial_21_1007 := by
  native_decide

/-- Coefficient term 1008 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1008 : Poly :=
[
  term ((13745531607434432581056012415488998176 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (12, 1), (13, 2), (15, 1)]
]

/-- Partial product 1008 for generator 21. -/
def ep_Q2_024_partial_21_1008 : Poly :=
[
  term ((27491063214868865162112024830977996352 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (10, 1), (12, 1), (13, 2), (15, 1)],
  term ((-13745531607434432581056012415488998176 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (12, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1008 for generator 21. -/
theorem ep_Q2_024_partial_21_1008_valid :
    mulPoly ep_Q2_024_coefficient_21_1008
        ep_Q2_024_generator_21_1000_1099 =
      ep_Q2_024_partial_21_1008 := by
  native_decide

/-- Coefficient term 1009 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1009 : Poly :=
[
  term ((-53824762600716421491094410962189703401457332436241210747 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(7, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 1009 for generator 21. -/
def ep_Q2_024_partial_21_1009 : Poly :=
[
  term ((-53824762600716421491094410962189703401457332436241210747 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((53824762600716421491094410962189703401457332436241210747 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(7, 1), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1009 for generator 21. -/
theorem ep_Q2_024_partial_21_1009_valid :
    mulPoly ep_Q2_024_coefficient_21_1009
        ep_Q2_024_generator_21_1000_1099 =
      ep_Q2_024_partial_21_1009 := by
  native_decide

/-- Coefficient term 1010 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1010 : Poly :=
[
  term ((3756917212699698 : Rat) / 1162780221153193) [(7, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1010 for generator 21. -/
def ep_Q2_024_partial_21_1010 : Poly :=
[
  term ((7513834425399396 : Rat) / 1162780221153193) [(7, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3756917212699698 : Rat) / 1162780221153193) [(7, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1010 for generator 21. -/
theorem ep_Q2_024_partial_21_1010_valid :
    mulPoly ep_Q2_024_coefficient_21_1010
        ep_Q2_024_generator_21_1000_1099 =
      ep_Q2_024_partial_21_1010 := by
  native_decide

/-- Coefficient term 1011 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1011 : Poly :=
[
  term ((1244189986840640425147752204580695015008324025900791366 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (12, 1), (14, 2), (15, 1)]
]

/-- Partial product 1011 for generator 21. -/
def ep_Q2_024_partial_21_1011 : Poly :=
[
  term ((2488379973681280850295504409161390030016648051801582732 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (10, 1), (12, 1), (14, 2), (15, 1)],
  term ((-1244189986840640425147752204580695015008324025900791366 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (12, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1011 for generator 21. -/
theorem ep_Q2_024_partial_21_1011_valid :
    mulPoly ep_Q2_024_coefficient_21_1011
        ep_Q2_024_generator_21_1000_1099 =
      ep_Q2_024_partial_21_1011 := by
  native_decide

/-- Coefficient term 1012 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1012 : Poly :=
[
  term ((-312276948646616 : Rat) / 1162780221153193) [(7, 1), (12, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 1012 for generator 21. -/
def ep_Q2_024_partial_21_1012 : Poly :=
[
  term ((-624553897293232 : Rat) / 1162780221153193) [(7, 1), (10, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((312276948646616 : Rat) / 1162780221153193) [(7, 1), (12, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1012 for generator 21. -/
theorem ep_Q2_024_partial_21_1012_valid :
    mulPoly ep_Q2_024_coefficient_21_1012
        ep_Q2_024_generator_21_1000_1099 =
      ep_Q2_024_partial_21_1012 := by
  native_decide

/-- Coefficient term 1013 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1013 : Poly :=
[
  term ((814726240890892284181068227080131452530875400483914284347 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(7, 1), (12, 1), (15, 1)]
]

/-- Partial product 1013 for generator 21. -/
def ep_Q2_024_partial_21_1013 : Poly :=
[
  term ((814726240890892284181068227080131452530875400483914284347 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(7, 1), (10, 1), (12, 1), (15, 1)],
  term ((-814726240890892284181068227080131452530875400483914284347 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(7, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1013 for generator 21. -/
theorem ep_Q2_024_partial_21_1013_valid :
    mulPoly ep_Q2_024_coefficient_21_1013
        ep_Q2_024_generator_21_1000_1099 =
      ep_Q2_024_partial_21_1013 := by
  native_decide

/-- Coefficient term 1014 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1014 : Poly :=
[
  term ((-14078238642132395 : Rat) / 2325560442306386) [(7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1014 for generator 21. -/
def ep_Q2_024_partial_21_1014 : Poly :=
[
  term ((-14078238642132395 : Rat) / 1162780221153193) [(7, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((14078238642132395 : Rat) / 2325560442306386) [(7, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1014 for generator 21. -/
theorem ep_Q2_024_partial_21_1014_valid :
    mulPoly ep_Q2_024_coefficient_21_1014
        ep_Q2_024_generator_21_1000_1099 =
      ep_Q2_024_partial_21_1014 := by
  native_decide

/-- Coefficient term 1015 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1015 : Poly :=
[
  term ((1244189986840640425147752204580695015008324025900791366 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (12, 1), (15, 3)]
]

/-- Partial product 1015 for generator 21. -/
def ep_Q2_024_partial_21_1015 : Poly :=
[
  term ((2488379973681280850295504409161390030016648051801582732 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (10, 1), (12, 1), (15, 3)],
  term ((-1244189986840640425147752204580695015008324025900791366 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1015 for generator 21. -/
theorem ep_Q2_024_partial_21_1015_valid :
    mulPoly ep_Q2_024_coefficient_21_1015
        ep_Q2_024_generator_21_1000_1099 =
      ep_Q2_024_partial_21_1015 := by
  native_decide

/-- Coefficient term 1016 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1016 : Poly :=
[
  term ((-312276948646616 : Rat) / 1162780221153193) [(7, 1), (12, 1), (15, 3), (16, 1)]
]

/-- Partial product 1016 for generator 21. -/
def ep_Q2_024_partial_21_1016 : Poly :=
[
  term ((-624553897293232 : Rat) / 1162780221153193) [(7, 1), (10, 1), (12, 1), (15, 3), (16, 1)],
  term ((312276948646616 : Rat) / 1162780221153193) [(7, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1016 for generator 21. -/
theorem ep_Q2_024_partial_21_1016_valid :
    mulPoly ep_Q2_024_coefficient_21_1016
        ep_Q2_024_generator_21_1000_1099 =
      ep_Q2_024_partial_21_1016 := by
  native_decide

/-- Coefficient term 1017 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1017 : Poly :=
[
  term ((402670849258123873243703868377101222618 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (12, 2), (13, 1)]
]

/-- Partial product 1017 for generator 21. -/
def ep_Q2_024_partial_21_1017 : Poly :=
[
  term ((805341698516247746487407736754202445236 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (10, 1), (12, 2), (13, 1)],
  term ((-402670849258123873243703868377101222618 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (12, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1017 for generator 21. -/
theorem ep_Q2_024_partial_21_1017_valid :
    mulPoly ep_Q2_024_coefficient_21_1017
        ep_Q2_024_generator_21_1000_1099 =
      ep_Q2_024_partial_21_1017 := by
  native_decide

/-- Coefficient term 1018 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1018 : Poly :=
[
  term ((3590785172512544607755272603180906352 : Rat) / 39990315246749243218889784267651308933) [(7, 1), (12, 2), (13, 1), (14, 1)]
]

/-- Partial product 1018 for generator 21. -/
def ep_Q2_024_partial_21_1018 : Poly :=
[
  term ((7181570345025089215510545206361812704 : Rat) / 39990315246749243218889784267651308933) [(7, 1), (10, 1), (12, 2), (13, 1), (14, 1)],
  term ((-3590785172512544607755272603180906352 : Rat) / 39990315246749243218889784267651308933) [(7, 1), (12, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1018 for generator 21. -/
theorem ep_Q2_024_partial_21_1018_valid :
    mulPoly ep_Q2_024_coefficient_21_1018
        ep_Q2_024_generator_21_1000_1099 =
      ep_Q2_024_partial_21_1018 := by
  native_decide

/-- Coefficient term 1019 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1019 : Poly :=
[
  term ((-2037240126095306036741680361023274517638948450580027006 : Rat) / 232499738033004954626193357709066474366836605811865345) [(7, 1), (12, 2), (14, 1), (15, 1)]
]

/-- Partial product 1019 for generator 21. -/
def ep_Q2_024_partial_21_1019 : Poly :=
[
  term ((-4074480252190612073483360722046549035277896901160054012 : Rat) / 232499738033004954626193357709066474366836605811865345) [(7, 1), (10, 1), (12, 2), (14, 1), (15, 1)],
  term ((2037240126095306036741680361023274517638948450580027006 : Rat) / 232499738033004954626193357709066474366836605811865345) [(7, 1), (12, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1019 for generator 21. -/
theorem ep_Q2_024_partial_21_1019_valid :
    mulPoly ep_Q2_024_coefficient_21_1019
        ep_Q2_024_generator_21_1000_1099 =
      ep_Q2_024_partial_21_1019 := by
  native_decide

/-- Coefficient term 1020 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1020 : Poly :=
[
  term ((3012139900347352 : Rat) / 1162780221153193) [(7, 1), (12, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1020 for generator 21. -/
def ep_Q2_024_partial_21_1020 : Poly :=
[
  term ((6024279800694704 : Rat) / 1162780221153193) [(7, 1), (10, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-3012139900347352 : Rat) / 1162780221153193) [(7, 1), (12, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1020 for generator 21. -/
theorem ep_Q2_024_partial_21_1020_valid :
    mulPoly ep_Q2_024_coefficient_21_1020
        ep_Q2_024_generator_21_1000_1099 =
      ep_Q2_024_partial_21_1020 := by
  native_decide

/-- Coefficient term 1021 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1021 : Poly :=
[
  term ((-63266169461659354395606229885235433260289045114720801271 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(7, 1), (12, 2), (15, 1)]
]

/-- Partial product 1021 for generator 21. -/
def ep_Q2_024_partial_21_1021 : Poly :=
[
  term ((-63266169461659354395606229885235433260289045114720801271 : Rat) / 929998952132019818504773430836265897467346423247461380) [(7, 1), (10, 1), (12, 2), (15, 1)],
  term ((63266169461659354395606229885235433260289045114720801271 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(7, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1021 for generator 21. -/
theorem ep_Q2_024_partial_21_1021_valid :
    mulPoly ep_Q2_024_coefficient_21_1021
        ep_Q2_024_generator_21_1000_1099 =
      ep_Q2_024_partial_21_1021 := by
  native_decide

/-- Coefficient term 1022 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1022 : Poly :=
[
  term ((6533280838736367 : Rat) / 2325560442306386) [(7, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 1022 for generator 21. -/
def ep_Q2_024_partial_21_1022 : Poly :=
[
  term ((6533280838736367 : Rat) / 1162780221153193) [(7, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-6533280838736367 : Rat) / 2325560442306386) [(7, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1022 for generator 21. -/
theorem ep_Q2_024_partial_21_1022_valid :
    mulPoly ep_Q2_024_coefficient_21_1022
        ep_Q2_024_generator_21_1000_1099 =
      ep_Q2_024_partial_21_1022 := by
  native_decide

/-- Coefficient term 1023 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1023 : Poly :=
[
  term ((-788213614432342792766430899416648875488 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (12, 3), (13, 1)]
]

/-- Partial product 1023 for generator 21. -/
def ep_Q2_024_partial_21_1023 : Poly :=
[
  term ((-1576427228864685585532861798833297750976 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (10, 1), (12, 3), (13, 1)],
  term ((788213614432342792766430899416648875488 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (12, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1023 for generator 21. -/
theorem ep_Q2_024_partial_21_1023_valid :
    mulPoly ep_Q2_024_coefficient_21_1023
        ep_Q2_024_generator_21_1000_1099 =
      ep_Q2_024_partial_21_1023 := by
  native_decide

/-- Coefficient term 1024 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1024 : Poly :=
[
  term ((7095251845643878279999055380386123506564735392041769998 : Rat) / 232499738033004954626193357709066474366836605811865345) [(7, 1), (12, 3), (15, 1)]
]

/-- Partial product 1024 for generator 21. -/
def ep_Q2_024_partial_21_1024 : Poly :=
[
  term ((14190503691287756559998110760772247013129470784083539996 : Rat) / 232499738033004954626193357709066474366836605811865345) [(7, 1), (10, 1), (12, 3), (15, 1)],
  term ((-7095251845643878279999055380386123506564735392041769998 : Rat) / 232499738033004954626193357709066474366836605811865345) [(7, 1), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1024 for generator 21. -/
theorem ep_Q2_024_partial_21_1024_valid :
    mulPoly ep_Q2_024_coefficient_21_1024
        ep_Q2_024_generator_21_1000_1099 =
      ep_Q2_024_partial_21_1024 := by
  native_decide

/-- Coefficient term 1025 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1025 : Poly :=
[
  term ((-5285404992210680 : Rat) / 1162780221153193) [(7, 1), (12, 3), (15, 1), (16, 1)]
]

/-- Partial product 1025 for generator 21. -/
def ep_Q2_024_partial_21_1025 : Poly :=
[
  term ((-10570809984421360 : Rat) / 1162780221153193) [(7, 1), (10, 1), (12, 3), (15, 1), (16, 1)],
  term ((5285404992210680 : Rat) / 1162780221153193) [(7, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1025 for generator 21. -/
theorem ep_Q2_024_partial_21_1025_valid :
    mulPoly ep_Q2_024_coefficient_21_1025
        ep_Q2_024_generator_21_1000_1099 =
      ep_Q2_024_partial_21_1025 := by
  native_decide

/-- Coefficient term 1026 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1026 : Poly :=
[
  term ((68683134185722016339438835171477217443 : Rat) / 39990315246749243218889784267651308933) [(8, 1)]
]

/-- Partial product 1026 for generator 21. -/
def ep_Q2_024_partial_21_1026 : Poly :=
[
  term ((-68683134185722016339438835171477217443 : Rat) / 39990315246749243218889784267651308933) [(8, 1)],
  term ((137366268371444032678877670342954434886 : Rat) / 39990315246749243218889784267651308933) [(8, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1026 for generator 21. -/
theorem ep_Q2_024_partial_21_1026_valid :
    mulPoly ep_Q2_024_coefficient_21_1026
        ep_Q2_024_generator_21_1000_1099 =
      ep_Q2_024_partial_21_1026 := by
  native_decide

/-- Coefficient term 1027 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1027 : Poly :=
[
  term ((37522401739805311039422138626734527732 : Rat) / 199951576233746216094448921338256544665) [(8, 1), (9, 1), (10, 1), (12, 1), (13, 1)]
]

/-- Partial product 1027 for generator 21. -/
def ep_Q2_024_partial_21_1027 : Poly :=
[
  term ((-37522401739805311039422138626734527732 : Rat) / 199951576233746216094448921338256544665) [(8, 1), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((75044803479610622078844277253469055464 : Rat) / 199951576233746216094448921338256544665) [(8, 1), (9, 1), (10, 2), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1027 for generator 21. -/
theorem ep_Q2_024_partial_21_1027_valid :
    mulPoly ep_Q2_024_coefficient_21_1027
        ep_Q2_024_generator_21_1000_1099 =
      ep_Q2_024_partial_21_1027 := by
  native_decide

/-- Coefficient term 1028 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1028 : Poly :=
[
  term ((-4189554939777403259041079172137271511321467357690977803 : Rat) / 929998952132019818504773430836265897467346423247461380) [(8, 1), (9, 1), (10, 1), (12, 1), (15, 1)]
]

/-- Partial product 1028 for generator 21. -/
def ep_Q2_024_partial_21_1028 : Poly :=
[
  term ((4189554939777403259041079172137271511321467357690977803 : Rat) / 929998952132019818504773430836265897467346423247461380) [(8, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-4189554939777403259041079172137271511321467357690977803 : Rat) / 464999476066009909252386715418132948733673211623730690) [(8, 1), (9, 1), (10, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1028 for generator 21. -/
theorem ep_Q2_024_partial_21_1028_valid :
    mulPoly ep_Q2_024_coefficient_21_1028
        ep_Q2_024_generator_21_1000_1099 =
      ep_Q2_024_partial_21_1028 := by
  native_decide

/-- Coefficient term 1029 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1029 : Poly :=
[
  term ((1081662649697379 : Rat) / 1162780221153193) [(8, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1029 for generator 21. -/
def ep_Q2_024_partial_21_1029 : Poly :=
[
  term ((-1081662649697379 : Rat) / 1162780221153193) [(8, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((2163325299394758 : Rat) / 1162780221153193) [(8, 1), (9, 1), (10, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1029 for generator 21. -/
theorem ep_Q2_024_partial_21_1029_valid :
    mulPoly ep_Q2_024_coefficient_21_1029
        ep_Q2_024_generator_21_1000_1099 =
      ep_Q2_024_partial_21_1029 := by
  native_decide

/-- Coefficient term 1030 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1030 : Poly :=
[
  term ((-95806439196667357214490900643440129766 : Rat) / 119970945740247729656669352802953926799) [(8, 1), (9, 1), (10, 1), (13, 1)]
]

/-- Partial product 1030 for generator 21. -/
def ep_Q2_024_partial_21_1030 : Poly :=
[
  term ((95806439196667357214490900643440129766 : Rat) / 119970945740247729656669352802953926799) [(8, 1), (9, 1), (10, 1), (13, 1)],
  term ((-191612878393334714428981801286880259532 : Rat) / 119970945740247729656669352802953926799) [(8, 1), (9, 1), (10, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1030 for generator 21. -/
theorem ep_Q2_024_partial_21_1030_valid :
    mulPoly ep_Q2_024_coefficient_21_1030
        ep_Q2_024_generator_21_1000_1099 =
      ep_Q2_024_partial_21_1030 := by
  native_decide

/-- Coefficient term 1031 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1031 : Poly :=
[
  term ((93287772980208889667188405400887339674285091873046133733 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(8, 1), (9, 1), (10, 1), (15, 1)]
]

/-- Partial product 1031 for generator 21. -/
def ep_Q2_024_partial_21_1031 : Poly :=
[
  term ((-93287772980208889667188405400887339674285091873046133733 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(8, 1), (9, 1), (10, 1), (15, 1)],
  term ((93287772980208889667188405400887339674285091873046133733 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(8, 1), (9, 1), (10, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1031 for generator 21. -/
theorem ep_Q2_024_partial_21_1031_valid :
    mulPoly ep_Q2_024_coefficient_21_1031
        ep_Q2_024_generator_21_1000_1099 =
      ep_Q2_024_partial_21_1031 := by
  native_decide

/-- Coefficient term 1032 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1032 : Poly :=
[
  term ((4815941933934353 : Rat) / 4651120884612772) [(8, 1), (9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 1032 for generator 21. -/
def ep_Q2_024_partial_21_1032 : Poly :=
[
  term ((-4815941933934353 : Rat) / 4651120884612772) [(8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((4815941933934353 : Rat) / 2325560442306386) [(8, 1), (9, 1), (10, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1032 for generator 21. -/
theorem ep_Q2_024_partial_21_1032_valid :
    mulPoly ep_Q2_024_coefficient_21_1032
        ep_Q2_024_generator_21_1000_1099 =
      ep_Q2_024_partial_21_1032 := by
  native_decide

/-- Coefficient term 1033 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1033 : Poly :=
[
  term ((-131711637110091608483143622364996059198 : Rat) / 199951576233746216094448921338256544665) [(8, 1), (9, 1), (11, 1)]
]

/-- Partial product 1033 for generator 21. -/
def ep_Q2_024_partial_21_1033 : Poly :=
[
  term ((-263423274220183216966287244729992118396 : Rat) / 199951576233746216094448921338256544665) [(8, 1), (9, 1), (10, 1), (11, 1)],
  term ((131711637110091608483143622364996059198 : Rat) / 199951576233746216094448921338256544665) [(8, 1), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1033 for generator 21. -/
theorem ep_Q2_024_partial_21_1033_valid :
    mulPoly ep_Q2_024_coefficient_21_1033
        ep_Q2_024_generator_21_1000_1099 =
      ep_Q2_024_partial_21_1033 := by
  native_decide

/-- Coefficient term 1034 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1034 : Poly :=
[
  term ((3324564260415976275352684960403619820418 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (9, 1), (11, 1), (12, 1)]
]

/-- Partial product 1034 for generator 21. -/
def ep_Q2_024_partial_21_1034 : Poly :=
[
  term ((6649128520831952550705369920807239640836 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (9, 1), (10, 1), (11, 1), (12, 1)],
  term ((-3324564260415976275352684960403619820418 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (9, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1034 for generator 21. -/
theorem ep_Q2_024_partial_21_1034_valid :
    mulPoly ep_Q2_024_coefficient_21_1034
        ep_Q2_024_generator_21_1000_1099 =
      ep_Q2_024_partial_21_1034 := by
  native_decide

/-- Coefficient term 1035 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1035 : Poly :=
[
  term ((4602932873171890455356106517418843583915904828491838639 : Rat) / 697499214099014863878580073127199423100509817435596035) [(8, 1), (9, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 1035 for generator 21. -/
def ep_Q2_024_partial_21_1035 : Poly :=
[
  term ((9205865746343780910712213034837687167831809656983677278 : Rat) / 697499214099014863878580073127199423100509817435596035) [(8, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-4602932873171890455356106517418843583915904828491838639 : Rat) / 697499214099014863878580073127199423100509817435596035) [(8, 1), (9, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1035 for generator 21. -/
theorem ep_Q2_024_partial_21_1035_valid :
    mulPoly ep_Q2_024_coefficient_21_1035
        ep_Q2_024_generator_21_1000_1099 =
      ep_Q2_024_partial_21_1035 := by
  native_decide

/-- Coefficient term 1036 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1036 : Poly :=
[
  term ((672243631978108 : Rat) / 1162780221153193) [(8, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1036 for generator 21. -/
def ep_Q2_024_partial_21_1036 : Poly :=
[
  term ((1344487263956216 : Rat) / 1162780221153193) [(8, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-672243631978108 : Rat) / 1162780221153193) [(8, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1036 for generator 21. -/
theorem ep_Q2_024_partial_21_1036_valid :
    mulPoly ep_Q2_024_coefficient_21_1036
        ep_Q2_024_generator_21_1000_1099 =
      ep_Q2_024_partial_21_1036 := by
  native_decide

/-- Coefficient term 1037 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1037 : Poly :=
[
  term ((38870295285012770332512361018856544208 : Rat) / 119970945740247729656669352802953926799) [(8, 1), (9, 1), (11, 1), (13, 2)]
]

/-- Partial product 1037 for generator 21. -/
def ep_Q2_024_partial_21_1037 : Poly :=
[
  term ((77740590570025540665024722037713088416 : Rat) / 119970945740247729656669352802953926799) [(8, 1), (9, 1), (10, 1), (11, 1), (13, 2)],
  term ((-38870295285012770332512361018856544208 : Rat) / 119970945740247729656669352802953926799) [(8, 1), (9, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1037 for generator 21. -/
theorem ep_Q2_024_partial_21_1037_valid :
    mulPoly ep_Q2_024_coefficient_21_1037
        ep_Q2_024_generator_21_1000_1099 =
      ep_Q2_024_partial_21_1037 := by
  native_decide

/-- Coefficient term 1038 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1038 : Poly :=
[
  term ((-1228191624313005819433004562942327279176 : Rat) / 199951576233746216094448921338256544665) [(8, 1), (9, 1), (11, 1), (14, 1)]
]

/-- Partial product 1038 for generator 21. -/
def ep_Q2_024_partial_21_1038 : Poly :=
[
  term ((-2456383248626011638866009125884654558352 : Rat) / 199951576233746216094448921338256544665) [(8, 1), (9, 1), (10, 1), (11, 1), (14, 1)],
  term ((1228191624313005819433004562942327279176 : Rat) / 199951576233746216094448921338256544665) [(8, 1), (9, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1038 for generator 21. -/
theorem ep_Q2_024_partial_21_1038_valid :
    mulPoly ep_Q2_024_coefficient_21_1038
        ep_Q2_024_generator_21_1000_1099 =
      ep_Q2_024_partial_21_1038 := by
  native_decide

/-- Coefficient term 1039 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1039 : Poly :=
[
  term ((80145240988429012696951992263099464806083996848861676521 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(8, 1), (9, 1), (11, 1), (15, 2)]
]

/-- Partial product 1039 for generator 21. -/
def ep_Q2_024_partial_21_1039 : Poly :=
[
  term ((80145240988429012696951992263099464806083996848861676521 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(8, 1), (9, 1), (10, 1), (11, 1), (15, 2)],
  term ((-80145240988429012696951992263099464806083996848861676521 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(8, 1), (9, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1039 for generator 21. -/
theorem ep_Q2_024_partial_21_1039_valid :
    mulPoly ep_Q2_024_coefficient_21_1039
        ep_Q2_024_generator_21_1000_1099 =
      ep_Q2_024_partial_21_1039 := by
  native_decide

/-- Coefficient term 1040 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1040 : Poly :=
[
  term ((-3791843580843907 : Rat) / 2325560442306386) [(8, 1), (9, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 1040 for generator 21. -/
def ep_Q2_024_partial_21_1040 : Poly :=
[
  term ((-3791843580843907 : Rat) / 1162780221153193) [(8, 1), (9, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((3791843580843907 : Rat) / 2325560442306386) [(8, 1), (9, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1040 for generator 21. -/
theorem ep_Q2_024_partial_21_1040_valid :
    mulPoly ep_Q2_024_coefficient_21_1040
        ep_Q2_024_generator_21_1000_1099 =
      ep_Q2_024_partial_21_1040 := by
  native_decide

/-- Coefficient term 1041 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1041 : Poly :=
[
  term ((1904463440303157692414788364619514345046 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (9, 1), (12, 1), (13, 1)]
]

/-- Partial product 1041 for generator 21. -/
def ep_Q2_024_partial_21_1041 : Poly :=
[
  term ((3808926880606315384829576729239028690092 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((-1904463440303157692414788364619514345046 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (9, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1041 for generator 21. -/
theorem ep_Q2_024_partial_21_1041_valid :
    mulPoly ep_Q2_024_coefficient_21_1041
        ep_Q2_024_generator_21_1000_1099 =
      ep_Q2_024_partial_21_1041 := by
  native_decide

/-- Coefficient term 1042 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1042 : Poly :=
[
  term ((211738051562760810647250929624122359248807207391856790053 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(8, 1), (9, 1), (12, 1), (15, 1)]
]

/-- Partial product 1042 for generator 21. -/
def ep_Q2_024_partial_21_1042 : Poly :=
[
  term ((211738051562760810647250929624122359248807207391856790053 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(8, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-211738051562760810647250929624122359248807207391856790053 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(8, 1), (9, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1042 for generator 21. -/
theorem ep_Q2_024_partial_21_1042_valid :
    mulPoly ep_Q2_024_coefficient_21_1042
        ep_Q2_024_generator_21_1000_1099 =
      ep_Q2_024_partial_21_1042 := by
  native_decide

/-- Coefficient term 1043 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1043 : Poly :=
[
  term ((-14353528794923447 : Rat) / 2325560442306386) [(8, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1043 for generator 21. -/
def ep_Q2_024_partial_21_1043 : Poly :=
[
  term ((-14353528794923447 : Rat) / 1162780221153193) [(8, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((14353528794923447 : Rat) / 2325560442306386) [(8, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1043 for generator 21. -/
theorem ep_Q2_024_partial_21_1043_valid :
    mulPoly ep_Q2_024_coefficient_21_1043
        ep_Q2_024_generator_21_1000_1099 =
      ep_Q2_024_partial_21_1043 := by
  native_decide

/-- Coefficient term 1044 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1044 : Poly :=
[
  term ((-25958341366293579878171789183491304344 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (9, 1), (12, 2), (13, 1)]
]

/-- Partial product 1044 for generator 21. -/
def ep_Q2_024_partial_21_1044 : Poly :=
[
  term ((-51916682732587159756343578366982608688 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (9, 1), (10, 1), (12, 2), (13, 1)],
  term ((25958341366293579878171789183491304344 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (9, 1), (12, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1044 for generator 21. -/
theorem ep_Q2_024_partial_21_1044_valid :
    mulPoly ep_Q2_024_coefficient_21_1044
        ep_Q2_024_generator_21_1000_1099 =
      ep_Q2_024_partial_21_1044 := by
  native_decide

/-- Coefficient term 1045 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1045 : Poly :=
[
  term ((519790077507635364246714238454931580267528154182411463 : Rat) / 464999476066009909252386715418132948733673211623730690) [(8, 1), (9, 1), (12, 2), (15, 1)]
]

/-- Partial product 1045 for generator 21. -/
def ep_Q2_024_partial_21_1045 : Poly :=
[
  term ((519790077507635364246714238454931580267528154182411463 : Rat) / 232499738033004954626193357709066474366836605811865345) [(8, 1), (9, 1), (10, 1), (12, 2), (15, 1)],
  term ((-519790077507635364246714238454931580267528154182411463 : Rat) / 464999476066009909252386715418132948733673211623730690) [(8, 1), (9, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1045 for generator 21. -/
theorem ep_Q2_024_partial_21_1045_valid :
    mulPoly ep_Q2_024_coefficient_21_1045
        ep_Q2_024_generator_21_1000_1099 =
      ep_Q2_024_partial_21_1045 := by
  native_decide

/-- Coefficient term 1046 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1046 : Poly :=
[
  term ((-425478577289470 : Rat) / 1162780221153193) [(8, 1), (9, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 1046 for generator 21. -/
def ep_Q2_024_partial_21_1046 : Poly :=
[
  term ((-850957154578940 : Rat) / 1162780221153193) [(8, 1), (9, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((425478577289470 : Rat) / 1162780221153193) [(8, 1), (9, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1046 for generator 21. -/
theorem ep_Q2_024_partial_21_1046_valid :
    mulPoly ep_Q2_024_coefficient_21_1046
        ep_Q2_024_generator_21_1000_1099 =
      ep_Q2_024_partial_21_1046 := by
  native_decide

/-- Coefficient term 1047 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1047 : Poly :=
[
  term ((1668179000285125443209527958529381905881 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (9, 1), (13, 1)]
]

/-- Partial product 1047 for generator 21. -/
def ep_Q2_024_partial_21_1047 : Poly :=
[
  term ((3336358000570250886419055917058763811762 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (9, 1), (10, 1), (13, 1)],
  term ((-1668179000285125443209527958529381905881 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1047 for generator 21. -/
theorem ep_Q2_024_partial_21_1047_valid :
    mulPoly ep_Q2_024_coefficient_21_1047
        ep_Q2_024_generator_21_1000_1099 =
      ep_Q2_024_partial_21_1047 := by
  native_decide

/-- Coefficient term 1048 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1048 : Poly :=
[
  term ((-1466468607802226347916739725850393373636 : Rat) / 199951576233746216094448921338256544665) [(8, 1), (9, 1), (13, 1), (14, 1)]
]

/-- Partial product 1048 for generator 21. -/
def ep_Q2_024_partial_21_1048 : Poly :=
[
  term ((-2932937215604452695833479451700786747272 : Rat) / 199951576233746216094448921338256544665) [(8, 1), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((1466468607802226347916739725850393373636 : Rat) / 199951576233746216094448921338256544665) [(8, 1), (9, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1048 for generator 21. -/
theorem ep_Q2_024_partial_21_1048_valid :
    mulPoly ep_Q2_024_coefficient_21_1048
        ep_Q2_024_generator_21_1000_1099 =
      ep_Q2_024_partial_21_1048 := by
  native_decide

/-- Coefficient term 1049 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1049 : Poly :=
[
  term ((-303602244700389938148400060577022883753307671413680815 : Rat) / 139499842819802972775716014625439884620101963487119207) [(8, 1), (9, 1), (14, 1), (15, 1)]
]

/-- Partial product 1049 for generator 21. -/
def ep_Q2_024_partial_21_1049 : Poly :=
[
  term ((-607204489400779876296800121154045767506615342827361630 : Rat) / 139499842819802972775716014625439884620101963487119207) [(8, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((303602244700389938148400060577022883753307671413680815 : Rat) / 139499842819802972775716014625439884620101963487119207) [(8, 1), (9, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1049 for generator 21. -/
theorem ep_Q2_024_partial_21_1049_valid :
    mulPoly ep_Q2_024_coefficient_21_1049
        ep_Q2_024_generator_21_1000_1099 =
      ep_Q2_024_partial_21_1049 := by
  native_decide

/-- Coefficient term 1050 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1050 : Poly :=
[
  term ((747574224772468 : Rat) / 1162780221153193) [(8, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1050 for generator 21. -/
def ep_Q2_024_partial_21_1050 : Poly :=
[
  term ((1495148449544936 : Rat) / 1162780221153193) [(8, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-747574224772468 : Rat) / 1162780221153193) [(8, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1050 for generator 21. -/
theorem ep_Q2_024_partial_21_1050_valid :
    mulPoly ep_Q2_024_coefficient_21_1050
        ep_Q2_024_generator_21_1000_1099 =
      ep_Q2_024_partial_21_1050 := by
  native_decide

/-- Coefficient term 1051 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1051 : Poly :=
[
  term ((-177146052459990833086843034621145881016452606292749398931 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(8, 1), (9, 1), (15, 1)]
]

/-- Partial product 1051 for generator 21. -/
def ep_Q2_024_partial_21_1051 : Poly :=
[
  term ((-177146052459990833086843034621145881016452606292749398931 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(8, 1), (9, 1), (10, 1), (15, 1)],
  term ((177146052459990833086843034621145881016452606292749398931 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(8, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1051 for generator 21. -/
theorem ep_Q2_024_partial_21_1051_valid :
    mulPoly ep_Q2_024_coefficient_21_1051
        ep_Q2_024_generator_21_1000_1099 =
      ep_Q2_024_partial_21_1051 := by
  native_decide

/-- Coefficient term 1052 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1052 : Poly :=
[
  term ((1082535559364413 : Rat) / 4651120884612772) [(8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 1052 for generator 21. -/
def ep_Q2_024_partial_21_1052 : Poly :=
[
  term ((1082535559364413 : Rat) / 2325560442306386) [(8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-1082535559364413 : Rat) / 4651120884612772) [(8, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1052 for generator 21. -/
theorem ep_Q2_024_partial_21_1052_valid :
    mulPoly ep_Q2_024_coefficient_21_1052
        ep_Q2_024_generator_21_1000_1099 =
      ep_Q2_024_partial_21_1052 := by
  native_decide

/-- Coefficient term 1053 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1053 : Poly :=
[
  term ((612632661057327339513311352279570908701 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (9, 2)]
]

/-- Partial product 1053 for generator 21. -/
def ep_Q2_024_partial_21_1053 : Poly :=
[
  term ((-612632661057327339513311352279570908701 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (9, 2)],
  term ((1225265322114654679026622704559141817402 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (9, 2), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1053 for generator 21. -/
theorem ep_Q2_024_partial_21_1053_valid :
    mulPoly ep_Q2_024_coefficient_21_1053
        ep_Q2_024_generator_21_1000_1099 =
      ep_Q2_024_partial_21_1053 := by
  native_decide

/-- Coefficient term 1054 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1054 : Poly :=
[
  term ((121588940735489082070848072049143946532 : Rat) / 39990315246749243218889784267651308933) [(8, 1), (9, 2), (10, 1)]
]

/-- Partial product 1054 for generator 21. -/
def ep_Q2_024_partial_21_1054 : Poly :=
[
  term ((-121588940735489082070848072049143946532 : Rat) / 39990315246749243218889784267651308933) [(8, 1), (9, 2), (10, 1)],
  term ((243177881470978164141696144098287893064 : Rat) / 39990315246749243218889784267651308933) [(8, 1), (9, 2), (10, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1054 for generator 21. -/
theorem ep_Q2_024_partial_21_1054_valid :
    mulPoly ep_Q2_024_coefficient_21_1054
        ep_Q2_024_generator_21_1000_1099 =
      ep_Q2_024_partial_21_1054 := by
  native_decide

/-- Coefficient term 1055 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1055 : Poly :=
[
  term ((-15162269307229276594898497776806834848 : Rat) / 199951576233746216094448921338256544665) [(8, 1), (9, 2), (11, 1), (13, 1)]
]

/-- Partial product 1055 for generator 21. -/
def ep_Q2_024_partial_21_1055 : Poly :=
[
  term ((-30324538614458553189796995553613669696 : Rat) / 199951576233746216094448921338256544665) [(8, 1), (9, 2), (10, 1), (11, 1), (13, 1)],
  term ((15162269307229276594898497776806834848 : Rat) / 199951576233746216094448921338256544665) [(8, 1), (9, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1055 for generator 21. -/
theorem ep_Q2_024_partial_21_1055_valid :
    mulPoly ep_Q2_024_coefficient_21_1055
        ep_Q2_024_generator_21_1000_1099 =
      ep_Q2_024_partial_21_1055 := by
  native_decide

/-- Coefficient term 1056 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1056 : Poly :=
[
  term ((931008986344453683970074371008433998541194337948139107 : Rat) / 697499214099014863878580073127199423100509817435596035) [(8, 1), (9, 2), (11, 1), (15, 1)]
]

/-- Partial product 1056 for generator 21. -/
def ep_Q2_024_partial_21_1056 : Poly :=
[
  term ((1862017972688907367940148742016867997082388675896278214 : Rat) / 697499214099014863878580073127199423100509817435596035) [(8, 1), (9, 2), (10, 1), (11, 1), (15, 1)],
  term ((-931008986344453683970074371008433998541194337948139107 : Rat) / 697499214099014863878580073127199423100509817435596035) [(8, 1), (9, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1056 for generator 21. -/
theorem ep_Q2_024_partial_21_1056_valid :
    mulPoly ep_Q2_024_coefficient_21_1056
        ep_Q2_024_generator_21_1000_1099 =
      ep_Q2_024_partial_21_1056 := by
  native_decide

/-- Coefficient term 1057 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1057 : Poly :=
[
  term ((-747574224772468 : Rat) / 1162780221153193) [(8, 1), (9, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 1057 for generator 21. -/
def ep_Q2_024_partial_21_1057 : Poly :=
[
  term ((-1495148449544936 : Rat) / 1162780221153193) [(8, 1), (9, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((747574224772468 : Rat) / 1162780221153193) [(8, 1), (9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1057 for generator 21. -/
theorem ep_Q2_024_partial_21_1057_valid :
    mulPoly ep_Q2_024_coefficient_21_1057
        ep_Q2_024_generator_21_1000_1099 =
      ep_Q2_024_partial_21_1057 := by
  native_decide

/-- Coefficient term 1058 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1058 : Poly :=
[
  term ((-120490950559266671434705544064369621628 : Rat) / 119970945740247729656669352802953926799) [(8, 1), (9, 2), (12, 1)]
]

/-- Partial product 1058 for generator 21. -/
def ep_Q2_024_partial_21_1058 : Poly :=
[
  term ((-240981901118533342869411088128739243256 : Rat) / 119970945740247729656669352802953926799) [(8, 1), (9, 2), (10, 1), (12, 1)],
  term ((120490950559266671434705544064369621628 : Rat) / 119970945740247729656669352802953926799) [(8, 1), (9, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1058 for generator 21. -/
theorem ep_Q2_024_partial_21_1058_valid :
    mulPoly ep_Q2_024_coefficient_21_1058
        ep_Q2_024_generator_21_1000_1099 =
      ep_Q2_024_partial_21_1058 := by
  native_decide

/-- Coefficient term 1059 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1059 : Poly :=
[
  term ((63112532186469946331305143931700421056 : Rat) / 199951576233746216094448921338256544665) [(8, 1), (9, 2), (14, 1)]
]

/-- Partial product 1059 for generator 21. -/
def ep_Q2_024_partial_21_1059 : Poly :=
[
  term ((126225064372939892662610287863400842112 : Rat) / 199951576233746216094448921338256544665) [(8, 1), (9, 2), (10, 1), (14, 1)],
  term ((-63112532186469946331305143931700421056 : Rat) / 199951576233746216094448921338256544665) [(8, 1), (9, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1059 for generator 21. -/
theorem ep_Q2_024_partial_21_1059_valid :
    mulPoly ep_Q2_024_coefficient_21_1059
        ep_Q2_024_generator_21_1000_1099 =
      ep_Q2_024_partial_21_1059 := by
  native_decide

/-- Coefficient term 1060 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1060 : Poly :=
[
  term ((-63112532186469946331305143931700421056 : Rat) / 199951576233746216094448921338256544665) [(8, 1), (9, 3), (11, 1)]
]

/-- Partial product 1060 for generator 21. -/
def ep_Q2_024_partial_21_1060 : Poly :=
[
  term ((-126225064372939892662610287863400842112 : Rat) / 199951576233746216094448921338256544665) [(8, 1), (9, 3), (10, 1), (11, 1)],
  term ((63112532186469946331305143931700421056 : Rat) / 199951576233746216094448921338256544665) [(8, 1), (9, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1060 for generator 21. -/
theorem ep_Q2_024_partial_21_1060_valid :
    mulPoly ep_Q2_024_coefficient_21_1060
        ep_Q2_024_generator_21_1000_1099 =
      ep_Q2_024_partial_21_1060 := by
  native_decide

/-- Coefficient term 1061 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1061 : Poly :=
[
  term ((4189554939777403259041079172137271511321467357690977803 : Rat) / 929998952132019818504773430836265897467346423247461380) [(8, 1), (10, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 1061 for generator 21. -/
def ep_Q2_024_partial_21_1061 : Poly :=
[
  term ((-4189554939777403259041079172137271511321467357690977803 : Rat) / 929998952132019818504773430836265897467346423247461380) [(8, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((4189554939777403259041079172137271511321467357690977803 : Rat) / 464999476066009909252386715418132948733673211623730690) [(8, 1), (10, 2), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1061 for generator 21. -/
theorem ep_Q2_024_partial_21_1061_valid :
    mulPoly ep_Q2_024_coefficient_21_1061
        ep_Q2_024_generator_21_1000_1099 =
      ep_Q2_024_partial_21_1061 := by
  native_decide

/-- Coefficient term 1062 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1062 : Poly :=
[
  term ((-1081662649697379 : Rat) / 1162780221153193) [(8, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1062 for generator 21. -/
def ep_Q2_024_partial_21_1062 : Poly :=
[
  term ((1081662649697379 : Rat) / 1162780221153193) [(8, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2163325299394758 : Rat) / 1162780221153193) [(8, 1), (10, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1062 for generator 21. -/
theorem ep_Q2_024_partial_21_1062_valid :
    mulPoly ep_Q2_024_coefficient_21_1062
        ep_Q2_024_generator_21_1000_1099 =
      ep_Q2_024_partial_21_1062 := by
  native_decide

/-- Coefficient term 1063 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1063 : Poly :=
[
  term ((-37522401739805311039422138626734527732 : Rat) / 199951576233746216094448921338256544665) [(8, 1), (10, 1), (12, 1), (13, 2)]
]

/-- Partial product 1063 for generator 21. -/
def ep_Q2_024_partial_21_1063 : Poly :=
[
  term ((37522401739805311039422138626734527732 : Rat) / 199951576233746216094448921338256544665) [(8, 1), (10, 1), (12, 1), (13, 2)],
  term ((-75044803479610622078844277253469055464 : Rat) / 199951576233746216094448921338256544665) [(8, 1), (10, 2), (12, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1063 for generator 21. -/
theorem ep_Q2_024_partial_21_1063_valid :
    mulPoly ep_Q2_024_coefficient_21_1063
        ep_Q2_024_generator_21_1000_1099 =
      ep_Q2_024_partial_21_1063 := by
  native_decide

/-- Coefficient term 1064 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1064 : Poly :=
[
  term ((-93287772980208889667188405400887339674285091873046133733 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(8, 1), (10, 1), (13, 1), (15, 1)]
]

/-- Partial product 1064 for generator 21. -/
def ep_Q2_024_partial_21_1064 : Poly :=
[
  term ((93287772980208889667188405400887339674285091873046133733 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(8, 1), (10, 1), (13, 1), (15, 1)],
  term ((-93287772980208889667188405400887339674285091873046133733 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(8, 1), (10, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1064 for generator 21. -/
theorem ep_Q2_024_partial_21_1064_valid :
    mulPoly ep_Q2_024_coefficient_21_1064
        ep_Q2_024_generator_21_1000_1099 =
      ep_Q2_024_partial_21_1064 := by
  native_decide

/-- Coefficient term 1065 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1065 : Poly :=
[
  term ((-4815941933934353 : Rat) / 4651120884612772) [(8, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1065 for generator 21. -/
def ep_Q2_024_partial_21_1065 : Poly :=
[
  term ((4815941933934353 : Rat) / 4651120884612772) [(8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4815941933934353 : Rat) / 2325560442306386) [(8, 1), (10, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1065 for generator 21. -/
theorem ep_Q2_024_partial_21_1065_valid :
    mulPoly ep_Q2_024_coefficient_21_1065
        ep_Q2_024_generator_21_1000_1099 =
      ep_Q2_024_partial_21_1065 := by
  native_decide

/-- Coefficient term 1066 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1066 : Poly :=
[
  term ((-268960383009799888998053315503991709830 : Rat) / 119970945740247729656669352802953926799) [(8, 1), (10, 1), (13, 2)]
]

/-- Partial product 1066 for generator 21. -/
def ep_Q2_024_partial_21_1066 : Poly :=
[
  term ((268960383009799888998053315503991709830 : Rat) / 119970945740247729656669352802953926799) [(8, 1), (10, 1), (13, 2)],
  term ((-537920766019599777996106631007983419660 : Rat) / 119970945740247729656669352802953926799) [(8, 1), (10, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1066 for generator 21. -/
theorem ep_Q2_024_partial_21_1066_valid :
    mulPoly ep_Q2_024_coefficient_21_1066
        ep_Q2_024_generator_21_1000_1099 =
      ep_Q2_024_partial_21_1066 := by
  native_decide

/-- Coefficient term 1067 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1067 : Poly :=
[
  term ((487013702179234220676681145452250237226 : Rat) / 119970945740247729656669352802953926799) [(8, 1), (11, 1), (12, 1), (13, 1)]
]

/-- Partial product 1067 for generator 21. -/
def ep_Q2_024_partial_21_1067 : Poly :=
[
  term ((974027404358468441353362290904500474452 : Rat) / 119970945740247729656669352802953926799) [(8, 1), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((-487013702179234220676681145452250237226 : Rat) / 119970945740247729656669352802953926799) [(8, 1), (11, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1067 for generator 21. -/
theorem ep_Q2_024_partial_21_1067_valid :
    mulPoly ep_Q2_024_coefficient_21_1067
        ep_Q2_024_generator_21_1000_1099 =
      ep_Q2_024_partial_21_1067 := by
  native_decide

/-- Coefficient term 1068 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1068 : Poly :=
[
  term ((-55374900092972802394501169314545589640 : Rat) / 119970945740247729656669352802953926799) [(8, 1), (11, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 1068 for generator 21. -/
def ep_Q2_024_partial_21_1068 : Poly :=
[
  term ((-110749800185945604789002338629091179280 : Rat) / 119970945740247729656669352802953926799) [(8, 1), (10, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((55374900092972802394501169314545589640 : Rat) / 119970945740247729656669352802953926799) [(8, 1), (11, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1068 for generator 21. -/
theorem ep_Q2_024_partial_21_1068_valid :
    mulPoly ep_Q2_024_coefficient_21_1068
        ep_Q2_024_generator_21_1000_1099 =
      ep_Q2_024_partial_21_1068 := by
  native_decide

/-- Coefficient term 1069 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1069 : Poly :=
[
  term ((5295649380128505904357902612512039113856123150388165775 : Rat) / 278999685639605945551432029250879769240203926974238414) [(8, 1), (11, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 1069 for generator 21. -/
def ep_Q2_024_partial_21_1069 : Poly :=
[
  term ((5295649380128505904357902612512039113856123150388165775 : Rat) / 139499842819802972775716014625439884620101963487119207) [(8, 1), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-5295649380128505904357902612512039113856123150388165775 : Rat) / 278999685639605945551432029250879769240203926974238414) [(8, 1), (11, 1), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1069 for generator 21. -/
theorem ep_Q2_024_partial_21_1069_valid :
    mulPoly ep_Q2_024_coefficient_21_1069
        ep_Q2_024_generator_21_1000_1099 =
      ep_Q2_024_partial_21_1069 := by
  native_decide

/-- Coefficient term 1070 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1070 : Poly :=
[
  term ((-4758481329221634 : Rat) / 1162780221153193) [(8, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1070 for generator 21. -/
def ep_Q2_024_partial_21_1070 : Poly :=
[
  term ((-9516962658443268 : Rat) / 1162780221153193) [(8, 1), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((4758481329221634 : Rat) / 1162780221153193) [(8, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1070 for generator 21. -/
theorem ep_Q2_024_partial_21_1070_valid :
    mulPoly ep_Q2_024_coefficient_21_1070
        ep_Q2_024_generator_21_1000_1099 =
      ep_Q2_024_partial_21_1070 := by
  native_decide

/-- Coefficient term 1071 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1071 : Poly :=
[
  term ((57913372968060056025729613357645187010803079867607559243 : Rat) / 1115998742558423782205728117003519076960815707896953656) [(8, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 1071 for generator 21. -/
def ep_Q2_024_partial_21_1071 : Poly :=
[
  term ((57913372968060056025729613357645187010803079867607559243 : Rat) / 557999371279211891102864058501759538480407853948476828) [(8, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-57913372968060056025729613357645187010803079867607559243 : Rat) / 1115998742558423782205728117003519076960815707896953656) [(8, 1), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1071 for generator 21. -/
theorem ep_Q2_024_partial_21_1071_valid :
    mulPoly ep_Q2_024_coefficient_21_1071
        ep_Q2_024_generator_21_1000_1099 =
      ep_Q2_024_partial_21_1071 := by
  native_decide

/-- Coefficient term 1072 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1072 : Poly :=
[
  term ((-3024116125309401 : Rat) / 2325560442306386) [(8, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1072 for generator 21. -/
def ep_Q2_024_partial_21_1072 : Poly :=
[
  term ((-3024116125309401 : Rat) / 1162780221153193) [(8, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((3024116125309401 : Rat) / 2325560442306386) [(8, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1072 for generator 21. -/
theorem ep_Q2_024_partial_21_1072_valid :
    mulPoly ep_Q2_024_coefficient_21_1072
        ep_Q2_024_generator_21_1000_1099 =
      ep_Q2_024_partial_21_1072 := by
  native_decide

/-- Coefficient term 1073 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1073 : Poly :=
[
  term ((574403226261230861527836742014464020076 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (11, 1), (12, 2), (13, 1)]
]

/-- Partial product 1073 for generator 21. -/
def ep_Q2_024_partial_21_1073 : Poly :=
[
  term ((1148806452522461723055673484028928040152 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (10, 1), (11, 1), (12, 2), (13, 1)],
  term ((-574403226261230861527836742014464020076 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (11, 1), (12, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1073 for generator 21. -/
theorem ep_Q2_024_partial_21_1073_valid :
    mulPoly ep_Q2_024_coefficient_21_1073
        ep_Q2_024_generator_21_1000_1099 =
      ep_Q2_024_partial_21_1073 := by
  native_decide

/-- Coefficient term 1074 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1074 : Poly :=
[
  term ((-20887704636097906426906057172692431788776335673796428007 : Rat) / 929998952132019818504773430836265897467346423247461380) [(8, 1), (11, 1), (12, 2), (15, 1)]
]

/-- Partial product 1074 for generator 21. -/
def ep_Q2_024_partial_21_1074 : Poly :=
[
  term ((-20887704636097906426906057172692431788776335673796428007 : Rat) / 464999476066009909252386715418132948733673211623730690) [(8, 1), (10, 1), (11, 1), (12, 2), (15, 1)],
  term ((20887704636097906426906057172692431788776335673796428007 : Rat) / 929998952132019818504773430836265897467346423247461380) [(8, 1), (11, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1074 for generator 21. -/
theorem ep_Q2_024_partial_21_1074_valid :
    mulPoly ep_Q2_024_coefficient_21_1074
        ep_Q2_024_generator_21_1000_1099 =
      ep_Q2_024_partial_21_1074 := by
  native_decide

/-- Coefficient term 1075 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1075 : Poly :=
[
  term ((4343741388949343 : Rat) / 1162780221153193) [(8, 1), (11, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 1075 for generator 21. -/
def ep_Q2_024_partial_21_1075 : Poly :=
[
  term ((8687482777898686 : Rat) / 1162780221153193) [(8, 1), (10, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-4343741388949343 : Rat) / 1162780221153193) [(8, 1), (11, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1075 for generator 21. -/
theorem ep_Q2_024_partial_21_1075_valid :
    mulPoly ep_Q2_024_coefficient_21_1075
        ep_Q2_024_generator_21_1000_1099 =
      ep_Q2_024_partial_21_1075 := by
  native_decide

/-- Coefficient term 1076 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1076 : Poly :=
[
  term ((-135517810690668909170318243612539613079 : Rat) / 39990315246749243218889784267651308933) [(8, 1), (11, 1), (13, 1)]
]

/-- Partial product 1076 for generator 21. -/
def ep_Q2_024_partial_21_1076 : Poly :=
[
  term ((-271035621381337818340636487225079226158 : Rat) / 39990315246749243218889784267651308933) [(8, 1), (10, 1), (11, 1), (13, 1)],
  term ((135517810690668909170318243612539613079 : Rat) / 39990315246749243218889784267651308933) [(8, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1076 for generator 21. -/
theorem ep_Q2_024_partial_21_1076_valid :
    mulPoly ep_Q2_024_coefficient_21_1076
        ep_Q2_024_generator_21_1000_1099 =
      ep_Q2_024_partial_21_1076 := by
  native_decide

/-- Coefficient term 1077 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1077 : Poly :=
[
  term ((-9109373934547347806732351476733628476 : Rat) / 2033405860004198807740158522083964861) [(8, 1), (11, 1), (13, 1), (14, 1)]
]

/-- Partial product 1077 for generator 21. -/
def ep_Q2_024_partial_21_1077 : Poly :=
[
  term ((-18218747869094695613464702953467256952 : Rat) / 2033405860004198807740158522083964861) [(8, 1), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((9109373934547347806732351476733628476 : Rat) / 2033405860004198807740158522083964861) [(8, 1), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1077 for generator 21. -/
theorem ep_Q2_024_partial_21_1077_valid :
    mulPoly ep_Q2_024_coefficient_21_1077
        ep_Q2_024_generator_21_1000_1099 =
      ep_Q2_024_partial_21_1077 := by
  native_decide

/-- Coefficient term 1078 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1078 : Poly :=
[
  term ((-12993854568522293920978843515494007592 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (11, 1), (13, 1), (14, 2)]
]

/-- Partial product 1078 for generator 21. -/
def ep_Q2_024_partial_21_1078 : Poly :=
[
  term ((-25987709137044587841957687030988015184 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (10, 1), (11, 1), (13, 1), (14, 2)],
  term ((12993854568522293920978843515494007592 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (11, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1078 for generator 21. -/
theorem ep_Q2_024_partial_21_1078_valid :
    mulPoly ep_Q2_024_coefficient_21_1078
        ep_Q2_024_generator_21_1000_1099 =
      ep_Q2_024_partial_21_1078 := by
  native_decide

/-- Coefficient term 1079 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1079 : Poly :=
[
  term ((13298879324329276285922484089474535713958127365402469523 : Rat) / 371999580852807927401909372334506358986938569298984552) [(8, 1), (11, 1), (13, 1), (15, 2)]
]

/-- Partial product 1079 for generator 21. -/
def ep_Q2_024_partial_21_1079 : Poly :=
[
  term ((13298879324329276285922484089474535713958127365402469523 : Rat) / 185999790426403963700954686167253179493469284649492276) [(8, 1), (10, 1), (11, 1), (13, 1), (15, 2)],
  term ((-13298879324329276285922484089474535713958127365402469523 : Rat) / 371999580852807927401909372334506358986938569298984552) [(8, 1), (11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1079 for generator 21. -/
theorem ep_Q2_024_partial_21_1079_valid :
    mulPoly ep_Q2_024_coefficient_21_1079
        ep_Q2_024_generator_21_1000_1099 =
      ep_Q2_024_partial_21_1079 := by
  native_decide

/-- Coefficient term 1080 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1080 : Poly :=
[
  term ((-14711995718307775 : Rat) / 2325560442306386) [(8, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 1080 for generator 21. -/
def ep_Q2_024_partial_21_1080 : Poly :=
[
  term ((-14711995718307775 : Rat) / 1162780221153193) [(8, 1), (10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((14711995718307775 : Rat) / 2325560442306386) [(8, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1080 for generator 21. -/
theorem ep_Q2_024_partial_21_1080_valid :
    mulPoly ep_Q2_024_coefficient_21_1080
        ep_Q2_024_generator_21_1000_1099 =
      ep_Q2_024_partial_21_1080 := by
  native_decide

/-- Coefficient term 1081 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1081 : Poly :=
[
  term ((-5485667588808728588991952060620965782180790471674611514 : Rat) / 697499214099014863878580073127199423100509817435596035) [(8, 1), (11, 1), (13, 2), (15, 1)]
]

/-- Partial product 1081 for generator 21. -/
def ep_Q2_024_partial_21_1081 : Poly :=
[
  term ((-10971335177617457177983904121241931564361580943349223028 : Rat) / 697499214099014863878580073127199423100509817435596035) [(8, 1), (10, 1), (11, 1), (13, 2), (15, 1)],
  term ((5485667588808728588991952060620965782180790471674611514 : Rat) / 697499214099014863878580073127199423100509817435596035) [(8, 1), (11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1081 for generator 21. -/
theorem ep_Q2_024_partial_21_1081_valid :
    mulPoly ep_Q2_024_coefficient_21_1081
        ep_Q2_024_generator_21_1000_1099 =
      ep_Q2_024_partial_21_1081 := by
  native_decide

/-- Coefficient term 1082 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1082 : Poly :=
[
  term ((75330592794360 : Rat) / 1162780221153193) [(8, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 1082 for generator 21. -/
def ep_Q2_024_partial_21_1082 : Poly :=
[
  term ((150661185588720 : Rat) / 1162780221153193) [(8, 1), (10, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-75330592794360 : Rat) / 1162780221153193) [(8, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1082 for generator 21. -/
theorem ep_Q2_024_partial_21_1082_valid :
    mulPoly ep_Q2_024_coefficient_21_1082
        ep_Q2_024_generator_21_1000_1099 =
      ep_Q2_024_partial_21_1082 := by
  native_decide

/-- Coefficient term 1083 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1083 : Poly :=
[
  term ((40472928056033817116049120031239046672 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (11, 1), (13, 3)]
]

/-- Partial product 1083 for generator 21. -/
def ep_Q2_024_partial_21_1083 : Poly :=
[
  term ((80945856112067634232098240062478093344 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (10, 1), (11, 1), (13, 3)],
  term ((-40472928056033817116049120031239046672 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (11, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1083 for generator 21. -/
theorem ep_Q2_024_partial_21_1083_valid :
    mulPoly ep_Q2_024_coefficient_21_1083
        ep_Q2_024_generator_21_1000_1099 =
      ep_Q2_024_partial_21_1083 := by
  native_decide

/-- Coefficient term 1084 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1084 : Poly :=
[
  term ((8134085161510453086479282563191431595436282524794580617 : Rat) / 371999580852807927401909372334506358986938569298984552) [(8, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 1084 for generator 21. -/
def ep_Q2_024_partial_21_1084 : Poly :=
[
  term ((8134085161510453086479282563191431595436282524794580617 : Rat) / 185999790426403963700954686167253179493469284649492276) [(8, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-8134085161510453086479282563191431595436282524794580617 : Rat) / 371999580852807927401909372334506358986938569298984552) [(8, 1), (11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1084 for generator 21. -/
theorem ep_Q2_024_partial_21_1084_valid :
    mulPoly ep_Q2_024_coefficient_21_1084
        ep_Q2_024_generator_21_1000_1099 =
      ep_Q2_024_partial_21_1084 := by
  native_decide

/-- Coefficient term 1085 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1085 : Poly :=
[
  term ((-12329776359333749 : Rat) / 2325560442306386) [(8, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1085 for generator 21. -/
def ep_Q2_024_partial_21_1085 : Poly :=
[
  term ((-12329776359333749 : Rat) / 1162780221153193) [(8, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((12329776359333749 : Rat) / 2325560442306386) [(8, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1085 for generator 21. -/
theorem ep_Q2_024_partial_21_1085_valid :
    mulPoly ep_Q2_024_coefficient_21_1085
        ep_Q2_024_generator_21_1000_1099 =
      ep_Q2_024_partial_21_1085 := by
  native_decide

/-- Coefficient term 1086 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1086 : Poly :=
[
  term ((-1244189986840640425147752204580695015008324025900791366 : Rat) / 697499214099014863878580073127199423100509817435596035) [(8, 1), (11, 1), (14, 2), (15, 1)]
]

/-- Partial product 1086 for generator 21. -/
def ep_Q2_024_partial_21_1086 : Poly :=
[
  term ((-2488379973681280850295504409161390030016648051801582732 : Rat) / 697499214099014863878580073127199423100509817435596035) [(8, 1), (10, 1), (11, 1), (14, 2), (15, 1)],
  term ((1244189986840640425147752204580695015008324025900791366 : Rat) / 697499214099014863878580073127199423100509817435596035) [(8, 1), (11, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1086 for generator 21. -/
theorem ep_Q2_024_partial_21_1086_valid :
    mulPoly ep_Q2_024_coefficient_21_1086
        ep_Q2_024_generator_21_1000_1099 =
      ep_Q2_024_partial_21_1086 := by
  native_decide

/-- Coefficient term 1087 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1087 : Poly :=
[
  term ((312276948646616 : Rat) / 1162780221153193) [(8, 1), (11, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 1087 for generator 21. -/
def ep_Q2_024_partial_21_1087 : Poly :=
[
  term ((624553897293232 : Rat) / 1162780221153193) [(8, 1), (10, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-312276948646616 : Rat) / 1162780221153193) [(8, 1), (11, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1087 for generator 21. -/
theorem ep_Q2_024_partial_21_1087_valid :
    mulPoly ep_Q2_024_coefficient_21_1087
        ep_Q2_024_generator_21_1000_1099 =
      ep_Q2_024_partial_21_1087 := by
  native_decide

/-- Coefficient term 1088 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1088 : Poly :=
[
  term ((-99104402996943989439342730908244621140002902954621176395 : Rat) / 1673998113837635673308592175505278615441223561845430484) [(8, 1), (11, 1), (15, 1)]
]

/-- Partial product 1088 for generator 21. -/
def ep_Q2_024_partial_21_1088 : Poly :=
[
  term ((-99104402996943989439342730908244621140002902954621176395 : Rat) / 836999056918817836654296087752639307720611780922715242) [(8, 1), (10, 1), (11, 1), (15, 1)],
  term ((99104402996943989439342730908244621140002902954621176395 : Rat) / 1673998113837635673308592175505278615441223561845430484) [(8, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1088 for generator 21. -/
theorem ep_Q2_024_partial_21_1088_valid :
    mulPoly ep_Q2_024_coefficient_21_1088
        ep_Q2_024_generator_21_1000_1099 =
      ep_Q2_024_partial_21_1088 := by
  native_decide

/-- Coefficient term 1089 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1089 : Poly :=
[
  term ((4660408732381323 : Rat) / 1162780221153193) [(8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 1089 for generator 21. -/
def ep_Q2_024_partial_21_1089 : Poly :=
[
  term ((9320817464762646 : Rat) / 1162780221153193) [(8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-4660408732381323 : Rat) / 1162780221153193) [(8, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1089 for generator 21. -/
theorem ep_Q2_024_partial_21_1089_valid :
    mulPoly ep_Q2_024_coefficient_21_1089
        ep_Q2_024_generator_21_1000_1099 =
      ep_Q2_024_partial_21_1089 := by
  native_decide

/-- Coefficient term 1090 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1090 : Poly :=
[
  term ((329622572685935617396589637795597603421187700410314534 : Rat) / 232499738033004954626193357709066474366836605811865345) [(8, 1), (11, 1), (15, 3)]
]

/-- Partial product 1090 for generator 21. -/
def ep_Q2_024_partial_21_1090 : Poly :=
[
  term ((659245145371871234793179275591195206842375400820629068 : Rat) / 232499738033004954626193357709066474366836605811865345) [(8, 1), (10, 1), (11, 1), (15, 3)],
  term ((-329622572685935617396589637795597603421187700410314534 : Rat) / 232499738033004954626193357709066474366836605811865345) [(8, 1), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1090 for generator 21. -/
theorem ep_Q2_024_partial_21_1090_valid :
    mulPoly ep_Q2_024_coefficient_21_1090
        ep_Q2_024_generator_21_1000_1099 =
      ep_Q2_024_partial_21_1090 := by
  native_decide

/-- Coefficient term 1091 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1091 : Poly :=
[
  term ((-136850605782984 : Rat) / 1162780221153193) [(8, 1), (11, 1), (15, 3), (16, 1)]
]

/-- Partial product 1091 for generator 21. -/
def ep_Q2_024_partial_21_1091 : Poly :=
[
  term ((-273701211565968 : Rat) / 1162780221153193) [(8, 1), (10, 1), (11, 1), (15, 3), (16, 1)],
  term ((136850605782984 : Rat) / 1162780221153193) [(8, 1), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1091 for generator 21. -/
theorem ep_Q2_024_partial_21_1091_valid :
    mulPoly ep_Q2_024_coefficient_21_1091
        ep_Q2_024_generator_21_1000_1099 =
      ep_Q2_024_partial_21_1091 := by
  native_decide

/-- Coefficient term 1092 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1092 : Poly :=
[
  term ((1429182194689304419382031011936884624481 : Rat) / 1799564186103715944850040292044308901985) [(8, 1), (11, 2)]
]

/-- Partial product 1092 for generator 21. -/
def ep_Q2_024_partial_21_1092 : Poly :=
[
  term ((2858364389378608838764062023873769248962 : Rat) / 1799564186103715944850040292044308901985) [(8, 1), (10, 1), (11, 2)],
  term ((-1429182194689304419382031011936884624481 : Rat) / 1799564186103715944850040292044308901985) [(8, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1092 for generator 21. -/
theorem ep_Q2_024_partial_21_1092_valid :
    mulPoly ep_Q2_024_coefficient_21_1092
        ep_Q2_024_generator_21_1000_1099 =
      ep_Q2_024_partial_21_1092 := by
  native_decide

/-- Coefficient term 1093 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1093 : Poly :=
[
  term ((87483070406245862995382813691713434496 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (11, 2), (13, 1), (15, 1)]
]

/-- Partial product 1093 for generator 21. -/
def ep_Q2_024_partial_21_1093 : Poly :=
[
  term ((174966140812491725990765627383426868992 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (10, 1), (11, 2), (13, 1), (15, 1)],
  term ((-87483070406245862995382813691713434496 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1093 for generator 21. -/
theorem ep_Q2_024_partial_21_1093_valid :
    mulPoly ep_Q2_024_coefficient_21_1093
        ep_Q2_024_generator_21_1000_1099 =
      ep_Q2_024_partial_21_1093 := by
  native_decide

/-- Coefficient term 1094 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1094 : Poly :=
[
  term ((8088250242351929820163091804873870410062191739236192053 : Rat) / 697499214099014863878580073127199423100509817435596035) [(8, 1), (11, 2), (15, 2)]
]

/-- Partial product 1094 for generator 21. -/
def ep_Q2_024_partial_21_1094 : Poly :=
[
  term ((16176500484703859640326183609747740820124383478472384106 : Rat) / 697499214099014863878580073127199423100509817435596035) [(8, 1), (10, 1), (11, 2), (15, 2)],
  term ((-8088250242351929820163091804873870410062191739236192053 : Rat) / 697499214099014863878580073127199423100509817435596035) [(8, 1), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1094 for generator 21. -/
theorem ep_Q2_024_partial_21_1094_valid :
    mulPoly ep_Q2_024_coefficient_21_1094
        ep_Q2_024_generator_21_1000_1099 =
      ep_Q2_024_partial_21_1094 := by
  native_decide

/-- Coefficient term 1095 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1095 : Poly :=
[
  term ((57972216906980 : Rat) / 1162780221153193) [(8, 1), (11, 2), (15, 2), (16, 1)]
]

/-- Partial product 1095 for generator 21. -/
def ep_Q2_024_partial_21_1095 : Poly :=
[
  term ((115944433813960 : Rat) / 1162780221153193) [(8, 1), (10, 1), (11, 2), (15, 2), (16, 1)],
  term ((-57972216906980 : Rat) / 1162780221153193) [(8, 1), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1095 for generator 21. -/
theorem ep_Q2_024_partial_21_1095_valid :
    mulPoly ep_Q2_024_coefficient_21_1095
        ep_Q2_024_generator_21_1000_1099 =
      ep_Q2_024_partial_21_1095 := by
  native_decide

/-- Coefficient term 1096 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1096 : Poly :=
[
  term ((1320672864537162143279261457550502790863 : Rat) / 1799564186103715944850040292044308901985) [(8, 1), (12, 1)]
]

/-- Partial product 1096 for generator 21. -/
def ep_Q2_024_partial_21_1096 : Poly :=
[
  term ((2641345729074324286558522915101005581726 : Rat) / 1799564186103715944850040292044308901985) [(8, 1), (10, 1), (12, 1)],
  term ((-1320672864537162143279261457550502790863 : Rat) / 1799564186103715944850040292044308901985) [(8, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1096 for generator 21. -/
theorem ep_Q2_024_partial_21_1096_valid :
    mulPoly ep_Q2_024_coefficient_21_1096
        ep_Q2_024_generator_21_1000_1099 =
      ep_Q2_024_partial_21_1096 := by
  native_decide

/-- Coefficient term 1097 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1097 : Poly :=
[
  term ((7263731563565507622614412820708822571625937066404132075 : Rat) / 371999580852807927401909372334506358986938569298984552) [(8, 1), (12, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 1097 for generator 21. -/
def ep_Q2_024_partial_21_1097 : Poly :=
[
  term ((7263731563565507622614412820708822571625937066404132075 : Rat) / 185999790426403963700954686167253179493469284649492276) [(8, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-7263731563565507622614412820708822571625937066404132075 : Rat) / 371999580852807927401909372334506358986938569298984552) [(8, 1), (12, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1097 for generator 21. -/
theorem ep_Q2_024_partial_21_1097_valid :
    mulPoly ep_Q2_024_coefficient_21_1097
        ep_Q2_024_generator_21_1000_1099 =
      ep_Q2_024_partial_21_1097 := by
  native_decide

/-- Coefficient term 1098 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1098 : Poly :=
[
  term ((-7650512415470575 : Rat) / 2325560442306386) [(8, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1098 for generator 21. -/
def ep_Q2_024_partial_21_1098 : Poly :=
[
  term ((-7650512415470575 : Rat) / 1162780221153193) [(8, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((7650512415470575 : Rat) / 2325560442306386) [(8, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1098 for generator 21. -/
theorem ep_Q2_024_partial_21_1098_valid :
    mulPoly ep_Q2_024_coefficient_21_1098
        ep_Q2_024_generator_21_1000_1099 =
      ep_Q2_024_partial_21_1098 := by
  native_decide

/-- Coefficient term 1099 from coefficient polynomial 21. -/
def ep_Q2_024_coefficient_21_1099 : Poly :=
[
  term ((-598920756781542148199646657613783593611264956438305503609 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(8, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 1099 for generator 21. -/
def ep_Q2_024_partial_21_1099 : Poly :=
[
  term ((-598920756781542148199646657613783593611264956438305503609 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(8, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((598920756781542148199646657613783593611264956438305503609 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(8, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1099 for generator 21. -/
theorem ep_Q2_024_partial_21_1099_valid :
    mulPoly ep_Q2_024_coefficient_21_1099
        ep_Q2_024_generator_21_1000_1099 =
      ep_Q2_024_partial_21_1099 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_024_partials_21_1000_1099 : List Poly :=
[
  ep_Q2_024_partial_21_1000,
  ep_Q2_024_partial_21_1001,
  ep_Q2_024_partial_21_1002,
  ep_Q2_024_partial_21_1003,
  ep_Q2_024_partial_21_1004,
  ep_Q2_024_partial_21_1005,
  ep_Q2_024_partial_21_1006,
  ep_Q2_024_partial_21_1007,
  ep_Q2_024_partial_21_1008,
  ep_Q2_024_partial_21_1009,
  ep_Q2_024_partial_21_1010,
  ep_Q2_024_partial_21_1011,
  ep_Q2_024_partial_21_1012,
  ep_Q2_024_partial_21_1013,
  ep_Q2_024_partial_21_1014,
  ep_Q2_024_partial_21_1015,
  ep_Q2_024_partial_21_1016,
  ep_Q2_024_partial_21_1017,
  ep_Q2_024_partial_21_1018,
  ep_Q2_024_partial_21_1019,
  ep_Q2_024_partial_21_1020,
  ep_Q2_024_partial_21_1021,
  ep_Q2_024_partial_21_1022,
  ep_Q2_024_partial_21_1023,
  ep_Q2_024_partial_21_1024,
  ep_Q2_024_partial_21_1025,
  ep_Q2_024_partial_21_1026,
  ep_Q2_024_partial_21_1027,
  ep_Q2_024_partial_21_1028,
  ep_Q2_024_partial_21_1029,
  ep_Q2_024_partial_21_1030,
  ep_Q2_024_partial_21_1031,
  ep_Q2_024_partial_21_1032,
  ep_Q2_024_partial_21_1033,
  ep_Q2_024_partial_21_1034,
  ep_Q2_024_partial_21_1035,
  ep_Q2_024_partial_21_1036,
  ep_Q2_024_partial_21_1037,
  ep_Q2_024_partial_21_1038,
  ep_Q2_024_partial_21_1039,
  ep_Q2_024_partial_21_1040,
  ep_Q2_024_partial_21_1041,
  ep_Q2_024_partial_21_1042,
  ep_Q2_024_partial_21_1043,
  ep_Q2_024_partial_21_1044,
  ep_Q2_024_partial_21_1045,
  ep_Q2_024_partial_21_1046,
  ep_Q2_024_partial_21_1047,
  ep_Q2_024_partial_21_1048,
  ep_Q2_024_partial_21_1049,
  ep_Q2_024_partial_21_1050,
  ep_Q2_024_partial_21_1051,
  ep_Q2_024_partial_21_1052,
  ep_Q2_024_partial_21_1053,
  ep_Q2_024_partial_21_1054,
  ep_Q2_024_partial_21_1055,
  ep_Q2_024_partial_21_1056,
  ep_Q2_024_partial_21_1057,
  ep_Q2_024_partial_21_1058,
  ep_Q2_024_partial_21_1059,
  ep_Q2_024_partial_21_1060,
  ep_Q2_024_partial_21_1061,
  ep_Q2_024_partial_21_1062,
  ep_Q2_024_partial_21_1063,
  ep_Q2_024_partial_21_1064,
  ep_Q2_024_partial_21_1065,
  ep_Q2_024_partial_21_1066,
  ep_Q2_024_partial_21_1067,
  ep_Q2_024_partial_21_1068,
  ep_Q2_024_partial_21_1069,
  ep_Q2_024_partial_21_1070,
  ep_Q2_024_partial_21_1071,
  ep_Q2_024_partial_21_1072,
  ep_Q2_024_partial_21_1073,
  ep_Q2_024_partial_21_1074,
  ep_Q2_024_partial_21_1075,
  ep_Q2_024_partial_21_1076,
  ep_Q2_024_partial_21_1077,
  ep_Q2_024_partial_21_1078,
  ep_Q2_024_partial_21_1079,
  ep_Q2_024_partial_21_1080,
  ep_Q2_024_partial_21_1081,
  ep_Q2_024_partial_21_1082,
  ep_Q2_024_partial_21_1083,
  ep_Q2_024_partial_21_1084,
  ep_Q2_024_partial_21_1085,
  ep_Q2_024_partial_21_1086,
  ep_Q2_024_partial_21_1087,
  ep_Q2_024_partial_21_1088,
  ep_Q2_024_partial_21_1089,
  ep_Q2_024_partial_21_1090,
  ep_Q2_024_partial_21_1091,
  ep_Q2_024_partial_21_1092,
  ep_Q2_024_partial_21_1093,
  ep_Q2_024_partial_21_1094,
  ep_Q2_024_partial_21_1095,
  ep_Q2_024_partial_21_1096,
  ep_Q2_024_partial_21_1097,
  ep_Q2_024_partial_21_1098,
  ep_Q2_024_partial_21_1099
]

/-- Sum of partial products in this block. -/
def ep_Q2_024_block_21_1000_1099 : Poly :=
[
  term ((-174966140812491725990765627383426868992 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (10, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-16176500484703859640326183609747740820124383478472384106 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (10, 1), (11, 1), (12, 1), (15, 2)],
  term ((-115944433813960 : Rat) / 1162780221153193) [(7, 1), (10, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-3928170973431556897968641917911482171402 : Rat) / 1799564186103715944850040292044308901985) [(7, 1), (10, 1), (12, 1), (13, 1)],
  term ((16283290118036559100125731609525651232 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((25987709137044587841957687030988015184 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (10, 1), (12, 1), (13, 1), (14, 2)],
  term ((7941159738640092377781708051038156584201845832521631328 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (10, 1), (12, 1), (13, 1), (15, 2)],
  term ((-1094804846263872 : Rat) / 1162780221153193) [(7, 1), (10, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((27491063214868865162112024830977996352 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (10, 1), (12, 1), (13, 2), (15, 1)],
  term ((-53824762600716421491094410962189703401457332436241210747 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((7513834425399396 : Rat) / 1162780221153193) [(7, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((2488379973681280850295504409161390030016648051801582732 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (10, 1), (12, 1), (14, 2), (15, 1)],
  term ((-624553897293232 : Rat) / 1162780221153193) [(7, 1), (10, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((814726240890892284181068227080131452530875400483914284347 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(7, 1), (10, 1), (12, 1), (15, 1)],
  term ((-14078238642132395 : Rat) / 1162780221153193) [(7, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((2488379973681280850295504409161390030016648051801582732 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (10, 1), (12, 1), (15, 3)],
  term ((-624553897293232 : Rat) / 1162780221153193) [(7, 1), (10, 1), (12, 1), (15, 3), (16, 1)],
  term ((805341698516247746487407736754202445236 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (10, 1), (12, 2), (13, 1)],
  term ((7181570345025089215510545206361812704 : Rat) / 39990315246749243218889784267651308933) [(7, 1), (10, 1), (12, 2), (13, 1), (14, 1)],
  term ((-4074480252190612073483360722046549035277896901160054012 : Rat) / 232499738033004954626193357709066474366836605811865345) [(7, 1), (10, 1), (12, 2), (14, 1), (15, 1)],
  term ((6024279800694704 : Rat) / 1162780221153193) [(7, 1), (10, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-63266169461659354395606229885235433260289045114720801271 : Rat) / 929998952132019818504773430836265897467346423247461380) [(7, 1), (10, 1), (12, 2), (15, 1)],
  term ((6533280838736367 : Rat) / 1162780221153193) [(7, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1576427228864685585532861798833297750976 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (10, 1), (12, 3), (13, 1)],
  term ((14190503691287756559998110760772247013129470784083539996 : Rat) / 232499738033004954626193357709066474366836605811865345) [(7, 1), (10, 1), (12, 3), (15, 1)],
  term ((-10570809984421360 : Rat) / 1162780221153193) [(7, 1), (10, 1), (12, 3), (15, 1), (16, 1)],
  term ((87483070406245862995382813691713434496 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((8088250242351929820163091804873870410062191739236192053 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (11, 1), (12, 1), (15, 2)],
  term ((57972216906980 : Rat) / 1162780221153193) [(7, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((1964085486715778448984320958955741085701 : Rat) / 1799564186103715944850040292044308901985) [(7, 1), (12, 1), (13, 1)],
  term ((-8141645059018279550062865804762825616 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (12, 1), (13, 1), (14, 1)],
  term ((-12993854568522293920978843515494007592 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (12, 1), (13, 1), (14, 2)],
  term ((-3970579869320046188890854025519078292100922916260815664 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (12, 1), (13, 1), (15, 2)],
  term ((547402423131936 : Rat) / 1162780221153193) [(7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-13745531607434432581056012415488998176 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (12, 1), (13, 2), (15, 1)],
  term ((53824762600716421491094410962189703401457332436241210747 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(7, 1), (12, 1), (14, 1), (15, 1)],
  term ((-3756917212699698 : Rat) / 1162780221153193) [(7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1244189986840640425147752204580695015008324025900791366 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (12, 1), (14, 2), (15, 1)],
  term ((312276948646616 : Rat) / 1162780221153193) [(7, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-814726240890892284181068227080131452530875400483914284347 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(7, 1), (12, 1), (15, 1)],
  term ((14078238642132395 : Rat) / 2325560442306386) [(7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1244189986840640425147752204580695015008324025900791366 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (12, 1), (15, 3)],
  term ((312276948646616 : Rat) / 1162780221153193) [(7, 1), (12, 1), (15, 3), (16, 1)],
  term ((-402670849258123873243703868377101222618 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (12, 2), (13, 1)],
  term ((-3590785172512544607755272603180906352 : Rat) / 39990315246749243218889784267651308933) [(7, 1), (12, 2), (13, 1), (14, 1)],
  term ((2037240126095306036741680361023274517638948450580027006 : Rat) / 232499738033004954626193357709066474366836605811865345) [(7, 1), (12, 2), (14, 1), (15, 1)],
  term ((-3012139900347352 : Rat) / 1162780221153193) [(7, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((63266169461659354395606229885235433260289045114720801271 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(7, 1), (12, 2), (15, 1)],
  term ((-6533280838736367 : Rat) / 2325560442306386) [(7, 1), (12, 2), (15, 1), (16, 1)],
  term ((788213614432342792766430899416648875488 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (12, 3), (13, 1)],
  term ((-7095251845643878279999055380386123506564735392041769998 : Rat) / 232499738033004954626193357709066474366836605811865345) [(7, 1), (12, 3), (15, 1)],
  term ((5285404992210680 : Rat) / 1162780221153193) [(7, 1), (12, 3), (15, 1), (16, 1)],
  term ((-68683134185722016339438835171477217443 : Rat) / 39990315246749243218889784267651308933) [(8, 1)],
  term ((-263423274220183216966287244729992118396 : Rat) / 199951576233746216094448921338256544665) [(8, 1), (9, 1), (10, 1), (11, 1)],
  term ((6649128520831952550705369920807239640836 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (9, 1), (10, 1), (11, 1), (12, 1)],
  term ((9205865746343780910712213034837687167831809656983677278 : Rat) / 697499214099014863878580073127199423100509817435596035) [(8, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((1344487263956216 : Rat) / 1162780221153193) [(8, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((77740590570025540665024722037713088416 : Rat) / 119970945740247729656669352802953926799) [(8, 1), (9, 1), (10, 1), (11, 1), (13, 2)],
  term ((-2456383248626011638866009125884654558352 : Rat) / 199951576233746216094448921338256544665) [(8, 1), (9, 1), (10, 1), (11, 1), (14, 1)],
  term ((80145240988429012696951992263099464806083996848861676521 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(8, 1), (9, 1), (10, 1), (11, 1), (15, 2)],
  term ((-3791843580843907 : Rat) / 1162780221153193) [(8, 1), (9, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((3696359675386899451711310313358825106896 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((112153358191046510212187083570267086891385804732464861731 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(8, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-15435191444620826 : Rat) / 1162780221153193) [(8, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-51916682732587159756343578366982608688 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (9, 1), (10, 1), (12, 2), (13, 1)],
  term ((519790077507635364246714238454931580267528154182411463 : Rat) / 232499738033004954626193357709066474366836605811865345) [(8, 1), (9, 1), (10, 1), (12, 2), (15, 1)],
  term ((-850957154578940 : Rat) / 1162780221153193) [(8, 1), (9, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((3815390196553587672491510420275964460592 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (9, 1), (10, 1), (13, 1)],
  term ((-2932937215604452695833479451700786747272 : Rat) / 199951576233746216094448921338256544665) [(8, 1), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((-607204489400779876296800121154045767506615342827361630 : Rat) / 139499842819802972775716014625439884620101963487119207) [(8, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((1495148449544936 : Rat) / 1162780221153193) [(8, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-89515975580038111168174894928635820341438060891708986319 : Rat) / 2231997485116847564411456234007038153921631415793907312) [(8, 1), (9, 1), (10, 1), (15, 1)],
  term ((-2650870815205527 : Rat) / 4651120884612772) [(8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((75044803479610622078844277253469055464 : Rat) / 199951576233746216094448921338256544665) [(8, 1), (9, 1), (10, 2), (12, 1), (13, 1)],
  term ((-4189554939777403259041079172137271511321467357690977803 : Rat) / 464999476066009909252386715418132948733673211623730690) [(8, 1), (9, 1), (10, 2), (12, 1), (15, 1)],
  term ((2163325299394758 : Rat) / 1162780221153193) [(8, 1), (9, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((-191612878393334714428981801286880259532 : Rat) / 119970945740247729656669352802953926799) [(8, 1), (9, 1), (10, 2), (13, 1)],
  term ((93287772980208889667188405400887339674285091873046133733 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(8, 1), (9, 1), (10, 2), (15, 1)],
  term ((4815941933934353 : Rat) / 2325560442306386) [(8, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((131711637110091608483143622364996059198 : Rat) / 199951576233746216094448921338256544665) [(8, 1), (9, 1), (11, 1)],
  term ((-3324564260415976275352684960403619820418 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (9, 1), (11, 1), (12, 1)],
  term ((-4602932873171890455356106517418843583915904828491838639 : Rat) / 697499214099014863878580073127199423100509817435596035) [(8, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-672243631978108 : Rat) / 1162780221153193) [(8, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-38870295285012770332512361018856544208 : Rat) / 119970945740247729656669352802953926799) [(8, 1), (9, 1), (11, 1), (13, 2)],
  term ((1228191624313005819433004562942327279176 : Rat) / 199951576233746216094448921338256544665) [(8, 1), (9, 1), (11, 1), (14, 1)],
  term ((-80145240988429012696951992263099464806083996848861676521 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(8, 1), (9, 1), (11, 1), (15, 2)],
  term ((3791843580843907 : Rat) / 2325560442306386) [(8, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-1904463440303157692414788364619514345046 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (9, 1), (12, 1), (13, 1)],
  term ((-211738051562760810647250929624122359248807207391856790053 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(8, 1), (9, 1), (12, 1), (15, 1)],
  term ((14353528794923447 : Rat) / 2325560442306386) [(8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((25958341366293579878171789183491304344 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (9, 1), (12, 2), (13, 1)],
  term ((-519790077507635364246714238454931580267528154182411463 : Rat) / 464999476066009909252386715418132948733673211623730690) [(8, 1), (9, 1), (12, 2), (15, 1)],
  term ((425478577289470 : Rat) / 1162780221153193) [(8, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1668179000285125443209527958529381905881 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (9, 1), (13, 1)],
  term ((1466468607802226347916739725850393373636 : Rat) / 199951576233746216094448921338256544665) [(8, 1), (9, 1), (13, 1), (14, 1)],
  term ((303602244700389938148400060577022883753307671413680815 : Rat) / 139499842819802972775716014625439884620101963487119207) [(8, 1), (9, 1), (14, 1), (15, 1)],
  term ((-747574224772468 : Rat) / 1162780221153193) [(8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((177146052459990833086843034621145881016452606292749398931 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(8, 1), (9, 1), (15, 1)],
  term ((-1082535559364413 : Rat) / 4651120884612772) [(8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-612632661057327339513311352279570908701 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (9, 2)],
  term ((-598568788917681552036098376178017380578 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (9, 2), (10, 1)],
  term ((-30324538614458553189796995553613669696 : Rat) / 199951576233746216094448921338256544665) [(8, 1), (9, 2), (10, 1), (11, 1), (13, 1)],
  term ((1862017972688907367940148742016867997082388675896278214 : Rat) / 697499214099014863878580073127199423100509817435596035) [(8, 1), (9, 2), (10, 1), (11, 1), (15, 1)],
  term ((-1495148449544936 : Rat) / 1162780221153193) [(8, 1), (9, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-240981901118533342869411088128739243256 : Rat) / 119970945740247729656669352802953926799) [(8, 1), (9, 2), (10, 1), (12, 1)],
  term ((126225064372939892662610287863400842112 : Rat) / 199951576233746216094448921338256544665) [(8, 1), (9, 2), (10, 1), (14, 1)],
  term ((243177881470978164141696144098287893064 : Rat) / 39990315246749243218889784267651308933) [(8, 1), (9, 2), (10, 2)],
  term ((15162269307229276594898497776806834848 : Rat) / 199951576233746216094448921338256544665) [(8, 1), (9, 2), (11, 1), (13, 1)],
  term ((-931008986344453683970074371008433998541194337948139107 : Rat) / 697499214099014863878580073127199423100509817435596035) [(8, 1), (9, 2), (11, 1), (15, 1)],
  term ((747574224772468 : Rat) / 1162780221153193) [(8, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((120490950559266671434705544064369621628 : Rat) / 119970945740247729656669352802953926799) [(8, 1), (9, 2), (12, 1)],
  term ((-63112532186469946331305143931700421056 : Rat) / 199951576233746216094448921338256544665) [(8, 1), (9, 2), (14, 1)],
  term ((-126225064372939892662610287863400842112 : Rat) / 199951576233746216094448921338256544665) [(8, 1), (9, 3), (10, 1), (11, 1)],
  term ((63112532186469946331305143931700421056 : Rat) / 199951576233746216094448921338256544665) [(8, 1), (9, 3), (11, 1)],
  term ((137366268371444032678877670342954434886 : Rat) / 39990315246749243218889784267651308933) [(8, 1), (10, 1)],
  term ((974027404358468441353362290904500474452 : Rat) / 119970945740247729656669352802953926799) [(8, 1), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((-110749800185945604789002338629091179280 : Rat) / 119970945740247729656669352802953926799) [(8, 1), (10, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((5295649380128505904357902612512039113856123150388165775 : Rat) / 139499842819802972775716014625439884620101963487119207) [(8, 1), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-9516962658443268 : Rat) / 1162780221153193) [(8, 1), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((57913372968060056025729613357645187010803079867607559243 : Rat) / 557999371279211891102864058501759538480407853948476828) [(8, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-3024116125309401 : Rat) / 1162780221153193) [(8, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((1148806452522461723055673484028928040152 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (10, 1), (11, 1), (12, 2), (13, 1)],
  term ((-20887704636097906426906057172692431788776335673796428007 : Rat) / 464999476066009909252386715418132948733673211623730690) [(8, 1), (10, 1), (11, 1), (12, 2), (15, 1)],
  term ((8687482777898686 : Rat) / 1162780221153193) [(8, 1), (10, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-271035621381337818340636487225079226158 : Rat) / 39990315246749243218889784267651308933) [(8, 1), (10, 1), (11, 1), (13, 1)],
  term ((-18218747869094695613464702953467256952 : Rat) / 2033405860004198807740158522083964861) [(8, 1), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((-25987709137044587841957687030988015184 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (10, 1), (11, 1), (13, 1), (14, 2)],
  term ((13298879324329276285922484089474535713958127365402469523 : Rat) / 185999790426403963700954686167253179493469284649492276) [(8, 1), (10, 1), (11, 1), (13, 1), (15, 2)],
  term ((-14711995718307775 : Rat) / 1162780221153193) [(8, 1), (10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-10971335177617457177983904121241931564361580943349223028 : Rat) / 697499214099014863878580073127199423100509817435596035) [(8, 1), (10, 1), (11, 1), (13, 2), (15, 1)],
  term ((150661185588720 : Rat) / 1162780221153193) [(8, 1), (10, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((80945856112067634232098240062478093344 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (10, 1), (11, 1), (13, 3)],
  term ((8134085161510453086479282563191431595436282524794580617 : Rat) / 185999790426403963700954686167253179493469284649492276) [(8, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-12329776359333749 : Rat) / 1162780221153193) [(8, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2488379973681280850295504409161390030016648051801582732 : Rat) / 697499214099014863878580073127199423100509817435596035) [(8, 1), (10, 1), (11, 1), (14, 2), (15, 1)],
  term ((624553897293232 : Rat) / 1162780221153193) [(8, 1), (10, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-99104402996943989439342730908244621140002902954621176395 : Rat) / 836999056918817836654296087752639307720611780922715242) [(8, 1), (10, 1), (11, 1), (15, 1)],
  term ((9320817464762646 : Rat) / 1162780221153193) [(8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((659245145371871234793179275591195206842375400820629068 : Rat) / 232499738033004954626193357709066474366836605811865345) [(8, 1), (10, 1), (11, 1), (15, 3)],
  term ((-273701211565968 : Rat) / 1162780221153193) [(8, 1), (10, 1), (11, 1), (15, 3), (16, 1)],
  term ((2858364389378608838764062023873769248962 : Rat) / 1799564186103715944850040292044308901985) [(8, 1), (10, 1), (11, 2)],
  term ((174966140812491725990765627383426868992 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (10, 1), (11, 2), (13, 1), (15, 1)],
  term ((16176500484703859640326183609747740820124383478472384106 : Rat) / 697499214099014863878580073127199423100509817435596035) [(8, 1), (10, 1), (11, 2), (15, 2)],
  term ((115944433813960 : Rat) / 1162780221153193) [(8, 1), (10, 1), (11, 2), (15, 2), (16, 1)],
  term ((2641345729074324286558522915101005581726 : Rat) / 1799564186103715944850040292044308901985) [(8, 1), (10, 1), (12, 1)],
  term ((7263731563565507622614412820708822571625937066404132075 : Rat) / 185999790426403963700954686167253179493469284649492276) [(8, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-7650512415470575 : Rat) / 1162780221153193) [(8, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-624058086420206567753893132646607222679193760584451370427 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(8, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((1081662649697379 : Rat) / 1162780221153193) [(8, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((37522401739805311039422138626734527732 : Rat) / 199951576233746216094448921338256544665) [(8, 1), (10, 1), (12, 1), (13, 2)],
  term ((93287772980208889667188405400887339674285091873046133733 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(8, 1), (10, 1), (13, 1), (15, 1)],
  term ((4815941933934353 : Rat) / 4651120884612772) [(8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((268960383009799888998053315503991709830 : Rat) / 119970945740247729656669352802953926799) [(8, 1), (10, 1), (13, 2)],
  term ((4189554939777403259041079172137271511321467357690977803 : Rat) / 464999476066009909252386715418132948733673211623730690) [(8, 1), (10, 2), (12, 1), (13, 1), (15, 1)],
  term ((-2163325299394758 : Rat) / 1162780221153193) [(8, 1), (10, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-75044803479610622078844277253469055464 : Rat) / 199951576233746216094448921338256544665) [(8, 1), (10, 2), (12, 1), (13, 2)],
  term ((-93287772980208889667188405400887339674285091873046133733 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(8, 1), (10, 2), (13, 1), (15, 1)],
  term ((-4815941933934353 : Rat) / 2325560442306386) [(8, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-537920766019599777996106631007983419660 : Rat) / 119970945740247729656669352802953926799) [(8, 1), (10, 2), (13, 2)],
  term ((-487013702179234220676681145452250237226 : Rat) / 119970945740247729656669352802953926799) [(8, 1), (11, 1), (12, 1), (13, 1)],
  term ((55374900092972802394501169314545589640 : Rat) / 119970945740247729656669352802953926799) [(8, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-5295649380128505904357902612512039113856123150388165775 : Rat) / 278999685639605945551432029250879769240203926974238414) [(8, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((4758481329221634 : Rat) / 1162780221153193) [(8, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-57913372968060056025729613357645187010803079867607559243 : Rat) / 1115998742558423782205728117003519076960815707896953656) [(8, 1), (11, 1), (12, 1), (15, 1)],
  term ((3024116125309401 : Rat) / 2325560442306386) [(8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-574403226261230861527836742014464020076 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (11, 1), (12, 2), (13, 1)],
  term ((20887704636097906426906057172692431788776335673796428007 : Rat) / 929998952132019818504773430836265897467346423247461380) [(8, 1), (11, 1), (12, 2), (15, 1)],
  term ((-4343741388949343 : Rat) / 1162780221153193) [(8, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((135517810690668909170318243612539613079 : Rat) / 39990315246749243218889784267651308933) [(8, 1), (11, 1), (13, 1)],
  term ((9109373934547347806732351476733628476 : Rat) / 2033405860004198807740158522083964861) [(8, 1), (11, 1), (13, 1), (14, 1)],
  term ((12993854568522293920978843515494007592 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (11, 1), (13, 1), (14, 2)],
  term ((-13298879324329276285922484089474535713958127365402469523 : Rat) / 371999580852807927401909372334506358986938569298984552) [(8, 1), (11, 1), (13, 1), (15, 2)],
  term ((14711995718307775 : Rat) / 2325560442306386) [(8, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((5485667588808728588991952060620965782180790471674611514 : Rat) / 697499214099014863878580073127199423100509817435596035) [(8, 1), (11, 1), (13, 2), (15, 1)],
  term ((-75330592794360 : Rat) / 1162780221153193) [(8, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-40472928056033817116049120031239046672 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (11, 1), (13, 3)],
  term ((-8134085161510453086479282563191431595436282524794580617 : Rat) / 371999580852807927401909372334506358986938569298984552) [(8, 1), (11, 1), (14, 1), (15, 1)],
  term ((12329776359333749 : Rat) / 2325560442306386) [(8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((1244189986840640425147752204580695015008324025900791366 : Rat) / 697499214099014863878580073127199423100509817435596035) [(8, 1), (11, 1), (14, 2), (15, 1)],
  term ((-312276948646616 : Rat) / 1162780221153193) [(8, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((99104402996943989439342730908244621140002902954621176395 : Rat) / 1673998113837635673308592175505278615441223561845430484) [(8, 1), (11, 1), (15, 1)],
  term ((-4660408732381323 : Rat) / 1162780221153193) [(8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-329622572685935617396589637795597603421187700410314534 : Rat) / 232499738033004954626193357709066474366836605811865345) [(8, 1), (11, 1), (15, 3)],
  term ((136850605782984 : Rat) / 1162780221153193) [(8, 1), (11, 1), (15, 3), (16, 1)],
  term ((-1429182194689304419382031011936884624481 : Rat) / 1799564186103715944850040292044308901985) [(8, 1), (11, 2)],
  term ((-87483070406245862995382813691713434496 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (11, 2), (13, 1), (15, 1)],
  term ((-8088250242351929820163091804873870410062191739236192053 : Rat) / 697499214099014863878580073127199423100509817435596035) [(8, 1), (11, 2), (15, 2)],
  term ((-57972216906980 : Rat) / 1162780221153193) [(8, 1), (11, 2), (15, 2), (16, 1)],
  term ((-1320672864537162143279261457550502790863 : Rat) / 1799564186103715944850040292044308901985) [(8, 1), (12, 1)],
  term ((-7263731563565507622614412820708822571625937066404132075 : Rat) / 371999580852807927401909372334506358986938569298984552) [(8, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((7650512415470575 : Rat) / 2325560442306386) [(8, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((598920756781542148199646657613783593611264956438305503609 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(8, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 21, terms 1000 through 1099. -/
theorem ep_Q2_024_block_21_1000_1099_valid :
    checkProductSumEq ep_Q2_024_partials_21_1000_1099
      ep_Q2_024_block_21_1000_1099 = true := by
  native_decide

end EpQ2024TermShards

end Patterns

end EndpointCertificate

end Problem97
