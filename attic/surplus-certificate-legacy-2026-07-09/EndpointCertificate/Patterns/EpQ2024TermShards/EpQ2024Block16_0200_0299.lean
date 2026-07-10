/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_024, term block 16:200-299

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_024`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2024TermShards

/-- Generator polynomial 16 for endpoint certificate `ep_Q2_024`. -/
def ep_Q2_024_generator_16_0200_0299 : Poly :=
[
  term (2 : Rat) [(2, 1), (6, 1)],
  term (-1 : Rat) [(2, 2)],
  term (2 : Rat) [(3, 1), (7, 1)],
  term (-1 : Rat) [(3, 2)]
]

/-- Coefficient term 200 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0200 : Poly :=
[
  term ((-3879632405954780105500727485990170202391346659208306828 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 1), (9, 1), (13, 1), (15, 1)]
]

/-- Partial product 200 for generator 16. -/
def ep_Q2_024_partial_16_0200 : Poly :=
[
  term ((-7759264811909560211001454971980340404782693318416613656 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 1), (5, 1), (6, 1), (9, 1), (13, 1), (15, 1)],
  term ((3879632405954780105500727485990170202391346659208306828 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 2), (5, 1), (9, 1), (13, 1), (15, 1)],
  term ((-7759264811909560211001454971980340404782693318416613656 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (5, 1), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((3879632405954780105500727485990170202391346659208306828 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 2), (5, 1), (9, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 200 for generator 16. -/
theorem ep_Q2_024_partial_16_0200_valid :
    mulPoly ep_Q2_024_coefficient_16_0200
        ep_Q2_024_generator_16_0200_0299 =
      ep_Q2_024_partial_16_0200 := by
  native_decide

/-- Coefficient term 201 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0201 : Poly :=
[
  term ((150661185588720 : Rat) / 1162780221153193) [(5, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 201 for generator 16. -/
def ep_Q2_024_partial_16_0201 : Poly :=
[
  term ((301322371177440 : Rat) / 1162780221153193) [(2, 1), (5, 1), (6, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-150661185588720 : Rat) / 1162780221153193) [(2, 2), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((301322371177440 : Rat) / 1162780221153193) [(3, 1), (5, 1), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-150661185588720 : Rat) / 1162780221153193) [(3, 2), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 201 for generator 16. -/
theorem ep_Q2_024_partial_16_0201_valid :
    mulPoly ep_Q2_024_coefficient_16_0201
        ep_Q2_024_generator_16_0200_0299 =
      ep_Q2_024_partial_16_0201 := by
  native_decide

/-- Coefficient term 202 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0202 : Poly :=
[
  term ((80945856112067634232098240062478093344 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (9, 1), (13, 2)]
]

/-- Partial product 202 for generator 16. -/
def ep_Q2_024_partial_16_0202 : Poly :=
[
  term ((161891712224135268464196480124956186688 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (5, 1), (6, 1), (9, 1), (13, 2)],
  term ((-80945856112067634232098240062478093344 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (5, 1), (9, 1), (13, 2)],
  term ((161891712224135268464196480124956186688 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (5, 1), (7, 1), (9, 1), (13, 2)],
  term ((-80945856112067634232098240062478093344 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (5, 1), (9, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 202 for generator 16. -/
theorem ep_Q2_024_partial_16_0202_valid :
    mulPoly ep_Q2_024_coefficient_16_0202
        ep_Q2_024_generator_16_0200_0299 =
      ep_Q2_024_partial_16_0202 := by
  native_decide

/-- Coefficient term 203 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0203 : Poly :=
[
  term ((17842303055724083763118711211856783152 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (9, 1), (14, 1)]
]

/-- Partial product 203 for generator 16. -/
def ep_Q2_024_partial_16_0203 : Poly :=
[
  term ((35684606111448167526237422423713566304 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (5, 1), (6, 1), (9, 1), (14, 1)],
  term ((-17842303055724083763118711211856783152 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (5, 1), (9, 1), (14, 1)],
  term ((35684606111448167526237422423713566304 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (7, 1), (9, 1), (14, 1)],
  term ((-17842303055724083763118711211856783152 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (5, 1), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 203 for generator 16. -/
theorem ep_Q2_024_partial_16_0203_valid :
    mulPoly ep_Q2_024_coefficient_16_0203
        ep_Q2_024_generator_16_0200_0299 =
      ep_Q2_024_partial_16_0203 := by
  native_decide

/-- Coefficient term 204 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0204 : Poly :=
[
  term ((2058995478974842071455534917172445111076593431557556548 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 1), (9, 1), (15, 2)]
]

/-- Partial product 204 for generator 16. -/
def ep_Q2_024_partial_16_0204 : Poly :=
[
  term ((4117990957949684142911069834344890222153186863115113096 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 1), (5, 1), (6, 1), (9, 1), (15, 2)],
  term ((-2058995478974842071455534917172445111076593431557556548 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 2), (5, 1), (9, 1), (15, 2)],
  term ((4117990957949684142911069834344890222153186863115113096 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (5, 1), (7, 1), (9, 1), (15, 2)],
  term ((-2058995478974842071455534917172445111076593431557556548 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 2), (5, 1), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 204 for generator 16. -/
theorem ep_Q2_024_partial_16_0204_valid :
    mulPoly ep_Q2_024_coefficient_16_0204
        ep_Q2_024_generator_16_0200_0299 =
      ep_Q2_024_partial_16_0204 := by
  native_decide

/-- Coefficient term 205 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0205 : Poly :=
[
  term ((-333710849224016 : Rat) / 1162780221153193) [(5, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 205 for generator 16. -/
def ep_Q2_024_partial_16_0205 : Poly :=
[
  term ((-667421698448032 : Rat) / 1162780221153193) [(2, 1), (5, 1), (6, 1), (9, 1), (15, 2), (16, 1)],
  term ((333710849224016 : Rat) / 1162780221153193) [(2, 2), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((-667421698448032 : Rat) / 1162780221153193) [(3, 1), (5, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((333710849224016 : Rat) / 1162780221153193) [(3, 2), (5, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 205 for generator 16. -/
theorem ep_Q2_024_partial_16_0205_valid :
    mulPoly ep_Q2_024_coefficient_16_0205
        ep_Q2_024_generator_16_0200_0299 =
      ep_Q2_024_partial_16_0205 := by
  native_decide

/-- Coefficient term 206 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0206 : Poly :=
[
  term ((436235768289341236967421850993701608432 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (9, 2), (13, 1)]
]

/-- Partial product 206 for generator 16. -/
def ep_Q2_024_partial_16_0206 : Poly :=
[
  term ((872471536578682473934843701987403216864 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (5, 1), (6, 1), (9, 2), (13, 1)],
  term ((-436235768289341236967421850993701608432 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (5, 1), (9, 2), (13, 1)],
  term ((872471536578682473934843701987403216864 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (5, 1), (7, 1), (9, 2), (13, 1)],
  term ((-436235768289341236967421850993701608432 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (5, 1), (9, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 206 for generator 16. -/
theorem ep_Q2_024_partial_16_0206_valid :
    mulPoly ep_Q2_024_coefficient_16_0206
        ep_Q2_024_generator_16_0200_0299 =
      ep_Q2_024_partial_16_0206 := by
  native_decide

/-- Coefficient term 207 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0207 : Poly :=
[
  term ((-4138671785306667836192239945421705508661977149540299238 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (9, 2), (15, 1)]
]

/-- Partial product 207 for generator 16. -/
def ep_Q2_024_partial_16_0207 : Poly :=
[
  term ((-8277343570613335672384479890843411017323954299080598476 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 1), (5, 1), (6, 1), (9, 2), (15, 1)],
  term ((4138671785306667836192239945421705508661977149540299238 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 2), (5, 1), (9, 2), (15, 1)],
  term ((-8277343570613335672384479890843411017323954299080598476 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (5, 1), (7, 1), (9, 2), (15, 1)],
  term ((4138671785306667836192239945421705508661977149540299238 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 2), (5, 1), (9, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 207 for generator 16. -/
theorem ep_Q2_024_partial_16_0207_valid :
    mulPoly ep_Q2_024_coefficient_16_0207
        ep_Q2_024_generator_16_0200_0299 =
      ep_Q2_024_partial_16_0207 := by
  native_decide

/-- Coefficient term 208 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0208 : Poly :=
[
  term ((5884563396179416 : Rat) / 3488340663459579) [(5, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 208 for generator 16. -/
def ep_Q2_024_partial_16_0208 : Poly :=
[
  term ((11769126792358832 : Rat) / 3488340663459579) [(2, 1), (5, 1), (6, 1), (9, 2), (15, 1), (16, 1)],
  term ((-5884563396179416 : Rat) / 3488340663459579) [(2, 2), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((11769126792358832 : Rat) / 3488340663459579) [(3, 1), (5, 1), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((-5884563396179416 : Rat) / 3488340663459579) [(3, 2), (5, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 208 for generator 16. -/
theorem ep_Q2_024_partial_16_0208_valid :
    mulPoly ep_Q2_024_coefficient_16_0208
        ep_Q2_024_generator_16_0200_0299 =
      ep_Q2_024_partial_16_0208 := by
  native_decide

/-- Coefficient term 209 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0209 : Poly :=
[
  term ((370229701304371273616127062071914241912 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (9, 3)]
]

/-- Partial product 209 for generator 16. -/
def ep_Q2_024_partial_16_0209 : Poly :=
[
  term ((740459402608742547232254124143828483824 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (5, 1), (6, 1), (9, 3)],
  term ((-370229701304371273616127062071914241912 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (5, 1), (9, 3)],
  term ((740459402608742547232254124143828483824 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (5, 1), (7, 1), (9, 3)],
  term ((-370229701304371273616127062071914241912 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (5, 1), (9, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 209 for generator 16. -/
theorem ep_Q2_024_partial_16_0209_valid :
    mulPoly ep_Q2_024_coefficient_16_0209
        ep_Q2_024_generator_16_0200_0299 =
      ep_Q2_024_partial_16_0209 := by
  native_decide

/-- Coefficient term 210 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0210 : Poly :=
[
  term ((81290644555437604448825923303096311096 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (12, 1), (13, 1)]
]

/-- Partial product 210 for generator 16. -/
def ep_Q2_024_partial_16_0210 : Poly :=
[
  term ((162581289110875208897651846606192622192 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (5, 1), (6, 1), (12, 1), (13, 1)],
  term ((-81290644555437604448825923303096311096 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (5, 1), (12, 1), (13, 1)],
  term ((162581289110875208897651846606192622192 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (7, 1), (12, 1), (13, 1)],
  term ((-81290644555437604448825923303096311096 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (5, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 210 for generator 16. -/
theorem ep_Q2_024_partial_16_0210_valid :
    mulPoly ep_Q2_024_coefficient_16_0210
        ep_Q2_024_generator_16_0200_0299 =
      ep_Q2_024_partial_16_0210 := by
  native_decide

/-- Coefficient term 211 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0211 : Poly :=
[
  term ((841370064793335292522429127601806091814441540587938077 : Rat) / 278999685639605945551432029250879769240203926974238414) [(5, 1), (12, 1), (15, 1)]
]

/-- Partial product 211 for generator 16. -/
def ep_Q2_024_partial_16_0211 : Poly :=
[
  term ((841370064793335292522429127601806091814441540587938077 : Rat) / 139499842819802972775716014625439884620101963487119207) [(2, 1), (5, 1), (6, 1), (12, 1), (15, 1)],
  term ((-841370064793335292522429127601806091814441540587938077 : Rat) / 278999685639605945551432029250879769240203926974238414) [(2, 2), (5, 1), (12, 1), (15, 1)],
  term ((841370064793335292522429127601806091814441540587938077 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 1), (5, 1), (7, 1), (12, 1), (15, 1)],
  term ((-841370064793335292522429127601806091814441540587938077 : Rat) / 278999685639605945551432029250879769240203926974238414) [(3, 2), (5, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 211 for generator 16. -/
theorem ep_Q2_024_partial_16_0211_valid :
    mulPoly ep_Q2_024_coefficient_16_0211
        ep_Q2_024_generator_16_0200_0299 =
      ep_Q2_024_partial_16_0211 := by
  native_decide

/-- Coefficient term 212 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0212 : Poly :=
[
  term ((-1880096111698102 : Rat) / 1162780221153193) [(5, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 212 for generator 16. -/
def ep_Q2_024_partial_16_0212 : Poly :=
[
  term ((-3760192223396204 : Rat) / 1162780221153193) [(2, 1), (5, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((1880096111698102 : Rat) / 1162780221153193) [(2, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3760192223396204 : Rat) / 1162780221153193) [(3, 1), (5, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((1880096111698102 : Rat) / 1162780221153193) [(3, 2), (5, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 212 for generator 16. -/
theorem ep_Q2_024_partial_16_0212_valid :
    mulPoly ep_Q2_024_coefficient_16_0212
        ep_Q2_024_generator_16_0200_0299 =
      ep_Q2_024_partial_16_0212 := by
  native_decide

/-- Coefficient term 213 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0213 : Poly :=
[
  term ((-234950782138450771464918414303360541712 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (13, 1)]
]

/-- Partial product 213 for generator 16. -/
def ep_Q2_024_partial_16_0213 : Poly :=
[
  term ((-469901564276901542929836828606721083424 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (5, 1), (6, 1), (13, 1)],
  term ((234950782138450771464918414303360541712 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (5, 1), (13, 1)],
  term ((-469901564276901542929836828606721083424 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (5, 1), (7, 1), (13, 1)],
  term ((234950782138450771464918414303360541712 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (5, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 213 for generator 16. -/
theorem ep_Q2_024_partial_16_0213_valid :
    mulPoly ep_Q2_024_coefficient_16_0213
        ep_Q2_024_generator_16_0200_0299 =
      ep_Q2_024_partial_16_0213 := by
  native_decide

/-- Coefficient term 214 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0214 : Poly :=
[
  term ((40423760364518984840150318565767501272 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (13, 1), (14, 1)]
]

/-- Partial product 214 for generator 16. -/
def ep_Q2_024_partial_16_0214 : Poly :=
[
  term ((80847520729037969680300637131535002544 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (5, 1), (6, 1), (13, 1), (14, 1)],
  term ((-40423760364518984840150318565767501272 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (5, 1), (13, 1), (14, 1)],
  term ((80847520729037969680300637131535002544 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (5, 1), (7, 1), (13, 1), (14, 1)],
  term ((-40423760364518984840150318565767501272 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (5, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 214 for generator 16. -/
theorem ep_Q2_024_partial_16_0214_valid :
    mulPoly ep_Q2_024_coefficient_16_0214
        ep_Q2_024_generator_16_0200_0299 =
      ep_Q2_024_partial_16_0214 := by
  native_decide

/-- Coefficient term 215 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0215 : Poly :=
[
  term ((-427717756781907914922890628895589920671501510102299927 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (14, 1), (15, 1)]
]

/-- Partial product 215 for generator 16. -/
def ep_Q2_024_partial_16_0215 : Poly :=
[
  term ((-855435513563815829845781257791179841343003020204599854 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 1), (5, 1), (6, 1), (14, 1), (15, 1)],
  term ((427717756781907914922890628895589920671501510102299927 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 2), (5, 1), (14, 1), (15, 1)],
  term ((-855435513563815829845781257791179841343003020204599854 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (5, 1), (7, 1), (14, 1), (15, 1)],
  term ((427717756781907914922890628895589920671501510102299927 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 2), (5, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 215 for generator 16. -/
theorem ep_Q2_024_partial_16_0215_valid :
    mulPoly ep_Q2_024_coefficient_16_0215
        ep_Q2_024_generator_16_0200_0299 =
      ep_Q2_024_partial_16_0215 := by
  native_decide

/-- Coefficient term 216 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0216 : Poly :=
[
  term ((-141136064908796 : Rat) / 1162780221153193) [(5, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 216 for generator 16. -/
def ep_Q2_024_partial_16_0216 : Poly :=
[
  term ((-282272129817592 : Rat) / 1162780221153193) [(2, 1), (5, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((141136064908796 : Rat) / 1162780221153193) [(2, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-282272129817592 : Rat) / 1162780221153193) [(3, 1), (5, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((141136064908796 : Rat) / 1162780221153193) [(3, 2), (5, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 216 for generator 16. -/
theorem ep_Q2_024_partial_16_0216_valid :
    mulPoly ep_Q2_024_coefficient_16_0216
        ep_Q2_024_generator_16_0200_0299 =
      ep_Q2_024_partial_16_0216 := by
  native_decide

/-- Coefficient term 217 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0217 : Poly :=
[
  term ((-1395367882291219773749009470590983002070566030055428683 : Rat) / 464999476066009909252386715418132948733673211623730690) [(5, 1), (15, 1)]
]

/-- Partial product 217 for generator 16. -/
def ep_Q2_024_partial_16_0217 : Poly :=
[
  term ((-1395367882291219773749009470590983002070566030055428683 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 1), (5, 1), (6, 1), (15, 1)],
  term ((1395367882291219773749009470590983002070566030055428683 : Rat) / 464999476066009909252386715418132948733673211623730690) [(2, 2), (5, 1), (15, 1)],
  term ((-1395367882291219773749009470590983002070566030055428683 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (5, 1), (7, 1), (15, 1)],
  term ((1395367882291219773749009470590983002070566030055428683 : Rat) / 464999476066009909252386715418132948733673211623730690) [(3, 2), (5, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 217 for generator 16. -/
theorem ep_Q2_024_partial_16_0217_valid :
    mulPoly ep_Q2_024_coefficient_16_0217
        ep_Q2_024_generator_16_0200_0299 =
      ep_Q2_024_partial_16_0217 := by
  native_decide

/-- Coefficient term 218 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0218 : Poly :=
[
  term ((1880096111698102 : Rat) / 1162780221153193) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 218 for generator 16. -/
def ep_Q2_024_partial_16_0218 : Poly :=
[
  term ((3760192223396204 : Rat) / 1162780221153193) [(2, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-1880096111698102 : Rat) / 1162780221153193) [(2, 2), (5, 1), (15, 1), (16, 1)],
  term ((3760192223396204 : Rat) / 1162780221153193) [(3, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-1880096111698102 : Rat) / 1162780221153193) [(3, 2), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 218 for generator 16. -/
theorem ep_Q2_024_partial_16_0218_valid :
    mulPoly ep_Q2_024_coefficient_16_0218
        ep_Q2_024_generator_16_0200_0299 =
      ep_Q2_024_partial_16_0218 := by
  native_decide

/-- Coefficient term 219 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0219 : Poly :=
[
  term ((-40440149595023928932116585720924683072 : Rat) / 199951576233746216094448921338256544665) [(5, 2), (9, 1), (13, 1)]
]

/-- Partial product 219 for generator 16. -/
def ep_Q2_024_partial_16_0219 : Poly :=
[
  term ((-80880299190047857864233171441849366144 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (5, 2), (6, 1), (9, 1), (13, 1)],
  term ((40440149595023928932116585720924683072 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (5, 2), (9, 1), (13, 1)],
  term ((-80880299190047857864233171441849366144 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 2), (7, 1), (9, 1), (13, 1)],
  term ((40440149595023928932116585720924683072 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (5, 2), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 219 for generator 16. -/
theorem ep_Q2_024_partial_16_0219_valid :
    mulPoly ep_Q2_024_coefficient_16_0219
        ep_Q2_024_generator_16_0200_0299 =
      ep_Q2_024_partial_16_0219 := by
  native_decide

/-- Coefficient term 220 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0220 : Poly :=
[
  term ((2173624517752731263429423385757322935670570690431915648 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 2), (9, 1), (15, 1)]
]

/-- Partial product 220 for generator 16. -/
def ep_Q2_024_partial_16_0220 : Poly :=
[
  term ((4347249035505462526858846771514645871341141380863831296 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 1), (5, 2), (6, 1), (9, 1), (15, 1)],
  term ((-2173624517752731263429423385757322935670570690431915648 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 2), (5, 2), (9, 1), (15, 1)],
  term ((4347249035505462526858846771514645871341141380863831296 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (5, 2), (7, 1), (9, 1), (15, 1)],
  term ((-2173624517752731263429423385757322935670570690431915648 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 2), (5, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 220 for generator 16. -/
theorem ep_Q2_024_partial_16_0220_valid :
    mulPoly ep_Q2_024_coefficient_16_0220
        ep_Q2_024_generator_16_0200_0299 =
      ep_Q2_024_partial_16_0220 := by
  native_decide

/-- Coefficient term 221 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0221 : Poly :=
[
  term ((206941537023232 : Rat) / 1162780221153193) [(5, 2), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 221 for generator 16. -/
def ep_Q2_024_partial_16_0221 : Poly :=
[
  term ((413883074046464 : Rat) / 1162780221153193) [(2, 1), (5, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-206941537023232 : Rat) / 1162780221153193) [(2, 2), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((413883074046464 : Rat) / 1162780221153193) [(3, 1), (5, 2), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-206941537023232 : Rat) / 1162780221153193) [(3, 2), (5, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 221 for generator 16. -/
theorem ep_Q2_024_partial_16_0221_valid :
    mulPoly ep_Q2_024_coefficient_16_0221
        ep_Q2_024_generator_16_0200_0299 =
      ep_Q2_024_partial_16_0221 := by
  native_decide

/-- Coefficient term 222 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0222 : Poly :=
[
  term ((-33781967257793617486815206073153137696 : Rat) / 199951576233746216094448921338256544665) [(5, 2), (9, 2)]
]

/-- Partial product 222 for generator 16. -/
def ep_Q2_024_partial_16_0222 : Poly :=
[
  term ((-67563934515587234973630412146306275392 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (5, 2), (6, 1), (9, 2)],
  term ((33781967257793617486815206073153137696 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (5, 2), (9, 2)],
  term ((-67563934515587234973630412146306275392 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 2), (7, 1), (9, 2)],
  term ((33781967257793617486815206073153137696 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (5, 2), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 222 for generator 16. -/
theorem ep_Q2_024_partial_16_0222_valid :
    mulPoly ep_Q2_024_coefficient_16_0222
        ep_Q2_024_generator_16_0200_0299 =
      ep_Q2_024_partial_16_0222 := by
  native_decide

/-- Coefficient term 223 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0223 : Poly :=
[
  term ((-826347564150239326187536952436868474864 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 1), (9, 1)]
]

/-- Partial product 223 for generator 16. -/
def ep_Q2_024_partial_16_0223 : Poly :=
[
  term ((-1652695128300478652375073904873736949728 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (6, 1), (7, 1), (8, 1), (9, 1)],
  term ((826347564150239326187536952436868474864 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (7, 1), (8, 1), (9, 1)],
  term ((-1652695128300478652375073904873736949728 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (7, 2), (8, 1), (9, 1)],
  term ((826347564150239326187536952436868474864 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (7, 1), (8, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 223 for generator 16. -/
theorem ep_Q2_024_partial_16_0223_valid :
    mulPoly ep_Q2_024_coefficient_16_0223
        ep_Q2_024_generator_16_0200_0299 =
      ep_Q2_024_partial_16_0223 := by
  native_decide

/-- Coefficient term 224 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0224 : Poly :=
[
  term ((826347564150239326187536952436868474864 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 1), (13, 1)]
]

/-- Partial product 224 for generator 16. -/
def ep_Q2_024_partial_16_0224 : Poly :=
[
  term ((1652695128300478652375073904873736949728 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (6, 1), (7, 1), (8, 1), (13, 1)],
  term ((-826347564150239326187536952436868474864 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (7, 1), (8, 1), (13, 1)],
  term ((1652695128300478652375073904873736949728 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (7, 2), (8, 1), (13, 1)],
  term ((-826347564150239326187536952436868474864 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (7, 1), (8, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 224 for generator 16. -/
theorem ep_Q2_024_partial_16_0224_valid :
    mulPoly ep_Q2_024_coefficient_16_0224
        ep_Q2_024_generator_16_0200_0299 =
      ep_Q2_024_partial_16_0224 := by
  native_decide

/-- Coefficient term 225 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0225 : Poly :=
[
  term ((-291119540379211115395695414955239922573 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (9, 1)]
]

/-- Partial product 225 for generator 16. -/
def ep_Q2_024_partial_16_0225 : Poly :=
[
  term ((-582239080758422230791390829910479845146 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (6, 1), (7, 1), (9, 1)],
  term ((291119540379211115395695414955239922573 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (7, 1), (9, 1)],
  term ((-582239080758422230791390829910479845146 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (7, 2), (9, 1)],
  term ((291119540379211115395695414955239922573 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (7, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 225 for generator 16. -/
theorem ep_Q2_024_partial_16_0225_valid :
    mulPoly ep_Q2_024_coefficient_16_0225
        ep_Q2_024_generator_16_0200_0299 =
      ep_Q2_024_partial_16_0225 := by
  native_decide

/-- Coefficient term 226 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0226 : Poly :=
[
  term ((1336906305146375017279113329937287758894 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (9, 1), (12, 1)]
]

/-- Partial product 226 for generator 16. -/
def ep_Q2_024_partial_16_0226 : Poly :=
[
  term ((2673812610292750034558226659874575517788 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (6, 1), (7, 1), (9, 1), (12, 1)],
  term ((-1336906305146375017279113329937287758894 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (7, 1), (9, 1), (12, 1)],
  term ((2673812610292750034558226659874575517788 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (7, 2), (9, 1), (12, 1)],
  term ((-1336906305146375017279113329937287758894 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (7, 1), (9, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 226 for generator 16. -/
theorem ep_Q2_024_partial_16_0226_valid :
    mulPoly ep_Q2_024_coefficient_16_0226
        ep_Q2_024_generator_16_0200_0299 =
      ep_Q2_024_partial_16_0226 := by
  native_decide

/-- Coefficient term 227 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0227 : Poly :=
[
  term ((33273931020260669930661190011024360672 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (9, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 227 for generator 16. -/
def ep_Q2_024_partial_16_0227 : Poly :=
[
  term ((66547862040521339861322380022048721344 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (6, 1), (7, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((-33273931020260669930661190011024360672 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (7, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((66547862040521339861322380022048721344 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (7, 2), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((-33273931020260669930661190011024360672 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (7, 1), (9, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 227 for generator 16. -/
theorem ep_Q2_024_partial_16_0227_valid :
    mulPoly ep_Q2_024_coefficient_16_0227
        ep_Q2_024_generator_16_0200_0299 =
      ep_Q2_024_partial_16_0227 := by
  native_decide

/-- Coefficient term 228 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0228 : Poly :=
[
  term ((-198745616475118943998092102782769635563595552220534688 : Rat) / 46499947606600990925238671541813294873367321162373069) [(7, 1), (9, 1), (12, 1), (15, 2)]
]

/-- Partial product 228 for generator 16. -/
def ep_Q2_024_partial_16_0228 : Poly :=
[
  term ((-397491232950237887996184205565539271127191104441069376 : Rat) / 46499947606600990925238671541813294873367321162373069) [(2, 1), (6, 1), (7, 1), (9, 1), (12, 1), (15, 2)],
  term ((198745616475118943998092102782769635563595552220534688 : Rat) / 46499947606600990925238671541813294873367321162373069) [(2, 2), (7, 1), (9, 1), (12, 1), (15, 2)],
  term ((-397491232950237887996184205565539271127191104441069376 : Rat) / 46499947606600990925238671541813294873367321162373069) [(3, 1), (7, 2), (9, 1), (12, 1), (15, 2)],
  term ((198745616475118943998092102782769635563595552220534688 : Rat) / 46499947606600990925238671541813294873367321162373069) [(3, 2), (7, 1), (9, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 228 for generator 16. -/
theorem ep_Q2_024_partial_16_0228_valid :
    mulPoly ep_Q2_024_coefficient_16_0228
        ep_Q2_024_generator_16_0200_0299 =
      ep_Q2_024_partial_16_0228 := by
  native_decide

/-- Coefficient term 229 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0229 : Poly :=
[
  term ((1581632301823296 : Rat) / 1162780221153193) [(7, 1), (9, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 229 for generator 16. -/
def ep_Q2_024_partial_16_0229 : Poly :=
[
  term ((3163264603646592 : Rat) / 1162780221153193) [(2, 1), (6, 1), (7, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-1581632301823296 : Rat) / 1162780221153193) [(2, 2), (7, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((3163264603646592 : Rat) / 1162780221153193) [(3, 1), (7, 2), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-1581632301823296 : Rat) / 1162780221153193) [(3, 2), (7, 1), (9, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 229 for generator 16. -/
theorem ep_Q2_024_partial_16_0229_valid :
    mulPoly ep_Q2_024_coefficient_16_0229
        ep_Q2_024_generator_16_0200_0299 =
      ep_Q2_024_partial_16_0229 := by
  native_decide

/-- Coefficient term 230 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0230 : Poly :=
[
  term ((-51824669101602076868988473170378041883354520582692522331 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(7, 1), (9, 1), (13, 1), (15, 1)]
]

/-- Partial product 230 for generator 16. -/
def ep_Q2_024_partial_16_0230 : Poly :=
[
  term ((-51824669101602076868988473170378041883354520582692522331 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(2, 1), (6, 1), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((51824669101602076868988473170378041883354520582692522331 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(2, 2), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((-51824669101602076868988473170378041883354520582692522331 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(3, 1), (7, 2), (9, 1), (13, 1), (15, 1)],
  term ((51824669101602076868988473170378041883354520582692522331 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(3, 2), (7, 1), (9, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 230 for generator 16. -/
theorem ep_Q2_024_partial_16_0230_valid :
    mulPoly ep_Q2_024_coefficient_16_0230
        ep_Q2_024_generator_16_0200_0299 =
      ep_Q2_024_partial_16_0230 := by
  native_decide

/-- Coefficient term 231 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0231 : Poly :=
[
  term ((-1687313560550815 : Rat) / 1162780221153193) [(7, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 231 for generator 16. -/
def ep_Q2_024_partial_16_0231 : Poly :=
[
  term ((-3374627121101630 : Rat) / 1162780221153193) [(2, 1), (6, 1), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((1687313560550815 : Rat) / 1162780221153193) [(2, 2), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3374627121101630 : Rat) / 1162780221153193) [(3, 1), (7, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((1687313560550815 : Rat) / 1162780221153193) [(3, 2), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 231 for generator 16. -/
theorem ep_Q2_024_partial_16_0231_valid :
    mulPoly ep_Q2_024_coefficient_16_0231
        ep_Q2_024_generator_16_0200_0299 =
      ep_Q2_024_partial_16_0231 := by
  native_decide

/-- Coefficient term 232 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0232 : Poly :=
[
  term ((-562775391772069599157180125433912117924 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (9, 1), (13, 2)]
]

/-- Partial product 232 for generator 16. -/
def ep_Q2_024_partial_16_0232 : Poly :=
[
  term ((-1125550783544139198314360250867824235848 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (6, 1), (7, 1), (9, 1), (13, 2)],
  term ((562775391772069599157180125433912117924 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (7, 1), (9, 1), (13, 2)],
  term ((-1125550783544139198314360250867824235848 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (7, 2), (9, 1), (13, 2)],
  term ((562775391772069599157180125433912117924 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (7, 1), (9, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 232 for generator 16. -/
theorem ep_Q2_024_partial_16_0232_valid :
    mulPoly ep_Q2_024_coefficient_16_0232
        ep_Q2_024_generator_16_0200_0299 =
      ep_Q2_024_partial_16_0232 := by
  native_decide

/-- Coefficient term 233 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0233 : Poly :=
[
  term ((-703002700411395239639010931120510262593 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (9, 1), (14, 1)]
]

/-- Partial product 233 for generator 16. -/
def ep_Q2_024_partial_16_0233 : Poly :=
[
  term ((-1406005400822790479278021862241020525186 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (6, 1), (7, 1), (9, 1), (14, 1)],
  term ((703002700411395239639010931120510262593 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (7, 1), (9, 1), (14, 1)],
  term ((-1406005400822790479278021862241020525186 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (7, 2), (9, 1), (14, 1)],
  term ((703002700411395239639010931120510262593 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (7, 1), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 233 for generator 16. -/
theorem ep_Q2_024_partial_16_0233_valid :
    mulPoly ep_Q2_024_coefficient_16_0233
        ep_Q2_024_generator_16_0200_0299 =
      ep_Q2_024_partial_16_0233 := by
  native_decide

/-- Coefficient term 234 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0234 : Poly :=
[
  term ((11054165036071785399365776736060685613928533689685750087 : Rat) / 185999790426403963700954686167253179493469284649492276) [(7, 1), (9, 1), (15, 2)]
]

/-- Partial product 234 for generator 16. -/
def ep_Q2_024_partial_16_0234 : Poly :=
[
  term ((11054165036071785399365776736060685613928533689685750087 : Rat) / 92999895213201981850477343083626589746734642324746138) [(2, 1), (6, 1), (7, 1), (9, 1), (15, 2)],
  term ((-11054165036071785399365776736060685613928533689685750087 : Rat) / 185999790426403963700954686167253179493469284649492276) [(2, 2), (7, 1), (9, 1), (15, 2)],
  term ((11054165036071785399365776736060685613928533689685750087 : Rat) / 92999895213201981850477343083626589746734642324746138) [(3, 1), (7, 2), (9, 1), (15, 2)],
  term ((-11054165036071785399365776736060685613928533689685750087 : Rat) / 185999790426403963700954686167253179493469284649492276) [(3, 2), (7, 1), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 234 for generator 16. -/
theorem ep_Q2_024_partial_16_0234_valid :
    mulPoly ep_Q2_024_coefficient_16_0234
        ep_Q2_024_generator_16_0200_0299 =
      ep_Q2_024_partial_16_0234 := by
  native_decide

/-- Coefficient term 235 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0235 : Poly :=
[
  term ((-2113589838824883 : Rat) / 1162780221153193) [(7, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 235 for generator 16. -/
def ep_Q2_024_partial_16_0235 : Poly :=
[
  term ((-4227179677649766 : Rat) / 1162780221153193) [(2, 1), (6, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((2113589838824883 : Rat) / 1162780221153193) [(2, 2), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((-4227179677649766 : Rat) / 1162780221153193) [(3, 1), (7, 2), (9, 1), (15, 2), (16, 1)],
  term ((2113589838824883 : Rat) / 1162780221153193) [(3, 2), (7, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 235 for generator 16. -/
theorem ep_Q2_024_partial_16_0235_valid :
    mulPoly ep_Q2_024_coefficient_16_0235
        ep_Q2_024_generator_16_0200_0299 =
      ep_Q2_024_partial_16_0235 := by
  native_decide

/-- Coefficient term 236 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0236 : Poly :=
[
  term ((7581134653614638297449248888403417424 : Rat) / 39990315246749243218889784267651308933) [(7, 1), (9, 2), (13, 1)]
]

/-- Partial product 236 for generator 16. -/
def ep_Q2_024_partial_16_0236 : Poly :=
[
  term ((15162269307229276594898497776806834848 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (6, 1), (7, 1), (9, 2), (13, 1)],
  term ((-7581134653614638297449248888403417424 : Rat) / 39990315246749243218889784267651308933) [(2, 2), (7, 1), (9, 2), (13, 1)],
  term ((15162269307229276594898497776806834848 : Rat) / 39990315246749243218889784267651308933) [(3, 1), (7, 2), (9, 2), (13, 1)],
  term ((-7581134653614638297449248888403417424 : Rat) / 39990315246749243218889784267651308933) [(3, 2), (7, 1), (9, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 236 for generator 16. -/
theorem ep_Q2_024_partial_16_0236_valid :
    mulPoly ep_Q2_024_coefficient_16_0236
        ep_Q2_024_generator_16_0200_0299 =
      ep_Q2_024_partial_16_0236 := by
  native_decide

/-- Coefficient term 237 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0237 : Poly :=
[
  term ((-6117088134986307917740122211961773302290741365461673651 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(7, 1), (9, 2), (15, 1)]
]

/-- Partial product 237 for generator 16. -/
def ep_Q2_024_partial_16_0237 : Poly :=
[
  term ((-6117088134986307917740122211961773302290741365461673651 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 1), (6, 1), (7, 1), (9, 2), (15, 1)],
  term ((6117088134986307917740122211961773302290741365461673651 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(2, 2), (7, 1), (9, 2), (15, 1)],
  term ((-6117088134986307917740122211961773302290741365461673651 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (7, 2), (9, 2), (15, 1)],
  term ((6117088134986307917740122211961773302290741365461673651 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(3, 2), (7, 1), (9, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 237 for generator 16. -/
theorem ep_Q2_024_partial_16_0237_valid :
    mulPoly ep_Q2_024_coefficient_16_0237
        ep_Q2_024_generator_16_0200_0299 =
      ep_Q2_024_partial_16_0237 := by
  native_decide

/-- Coefficient term 238 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0238 : Poly :=
[
  term ((1868935561931170 : Rat) / 1162780221153193) [(7, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 238 for generator 16. -/
def ep_Q2_024_partial_16_0238 : Poly :=
[
  term ((3737871123862340 : Rat) / 1162780221153193) [(2, 1), (6, 1), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((-1868935561931170 : Rat) / 1162780221153193) [(2, 2), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((3737871123862340 : Rat) / 1162780221153193) [(3, 1), (7, 2), (9, 2), (15, 1), (16, 1)],
  term ((-1868935561931170 : Rat) / 1162780221153193) [(3, 2), (7, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 238 for generator 16. -/
theorem ep_Q2_024_partial_16_0238_valid :
    mulPoly ep_Q2_024_coefficient_16_0238
        ep_Q2_024_generator_16_0200_0299 =
      ep_Q2_024_partial_16_0238 := by
  native_decide

/-- Coefficient term 239 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0239 : Poly :=
[
  term ((31556266093234973165652571965850210528 : Rat) / 39990315246749243218889784267651308933) [(7, 1), (9, 3)]
]

/-- Partial product 239 for generator 16. -/
def ep_Q2_024_partial_16_0239 : Poly :=
[
  term ((63112532186469946331305143931700421056 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (6, 1), (7, 1), (9, 3)],
  term ((-31556266093234973165652571965850210528 : Rat) / 39990315246749243218889784267651308933) [(2, 2), (7, 1), (9, 3)],
  term ((63112532186469946331305143931700421056 : Rat) / 39990315246749243218889784267651308933) [(3, 1), (7, 2), (9, 3)],
  term ((-31556266093234973165652571965850210528 : Rat) / 39990315246749243218889784267651308933) [(3, 2), (7, 1), (9, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 239 for generator 16. -/
theorem ep_Q2_024_partial_16_0239_valid :
    mulPoly ep_Q2_024_coefficient_16_0239
        ep_Q2_024_generator_16_0200_0299 =
      ep_Q2_024_partial_16_0239 := by
  native_decide

/-- Coefficient term 240 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0240 : Poly :=
[
  term ((-13597973666208090652136155236314925746 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (12, 1), (13, 1)]
]

/-- Partial product 240 for generator 16. -/
def ep_Q2_024_partial_16_0240 : Poly :=
[
  term ((-27195947332416181304272310472629851492 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (6, 1), (7, 1), (12, 1), (13, 1)],
  term ((13597973666208090652136155236314925746 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (7, 1), (12, 1), (13, 1)],
  term ((-27195947332416181304272310472629851492 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (7, 2), (12, 1), (13, 1)],
  term ((13597973666208090652136155236314925746 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (7, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 240 for generator 16. -/
theorem ep_Q2_024_partial_16_0240_valid :
    mulPoly ep_Q2_024_coefficient_16_0240
        ep_Q2_024_generator_16_0200_0299 =
      ep_Q2_024_partial_16_0240 := by
  native_decide

/-- Coefficient term 241 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0241 : Poly :=
[
  term ((198745616475118943998092102782769635563595552220534688 : Rat) / 46499947606600990925238671541813294873367321162373069) [(7, 1), (12, 1), (13, 1), (15, 2)]
]

/-- Partial product 241 for generator 16. -/
def ep_Q2_024_partial_16_0241 : Poly :=
[
  term ((397491232950237887996184205565539271127191104441069376 : Rat) / 46499947606600990925238671541813294873367321162373069) [(2, 1), (6, 1), (7, 1), (12, 1), (13, 1), (15, 2)],
  term ((-198745616475118943998092102782769635563595552220534688 : Rat) / 46499947606600990925238671541813294873367321162373069) [(2, 2), (7, 1), (12, 1), (13, 1), (15, 2)],
  term ((397491232950237887996184205565539271127191104441069376 : Rat) / 46499947606600990925238671541813294873367321162373069) [(3, 1), (7, 2), (12, 1), (13, 1), (15, 2)],
  term ((-198745616475118943998092102782769635563595552220534688 : Rat) / 46499947606600990925238671541813294873367321162373069) [(3, 2), (7, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 241 for generator 16. -/
theorem ep_Q2_024_partial_16_0241_valid :
    mulPoly ep_Q2_024_coefficient_16_0241
        ep_Q2_024_generator_16_0200_0299 =
      ep_Q2_024_partial_16_0241 := by
  native_decide

/-- Coefficient term 242 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0242 : Poly :=
[
  term ((-1581632301823296 : Rat) / 1162780221153193) [(7, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 242 for generator 16. -/
def ep_Q2_024_partial_16_0242 : Poly :=
[
  term ((-3163264603646592 : Rat) / 1162780221153193) [(2, 1), (6, 1), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((1581632301823296 : Rat) / 1162780221153193) [(2, 2), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-3163264603646592 : Rat) / 1162780221153193) [(3, 1), (7, 2), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((1581632301823296 : Rat) / 1162780221153193) [(3, 2), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 242 for generator 16. -/
theorem ep_Q2_024_partial_16_0242_valid :
    mulPoly ep_Q2_024_coefficient_16_0242
        ep_Q2_024_generator_16_0200_0299 =
      ep_Q2_024_partial_16_0242 := by
  native_decide

/-- Coefficient term 243 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0243 : Poly :=
[
  term ((-33273931020260669930661190011024360672 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (12, 1), (13, 2), (15, 1)]
]

/-- Partial product 243 for generator 16. -/
def ep_Q2_024_partial_16_0243 : Poly :=
[
  term ((-66547862040521339861322380022048721344 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (6, 1), (7, 1), (12, 1), (13, 2), (15, 1)],
  term ((33273931020260669930661190011024360672 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (7, 1), (12, 1), (13, 2), (15, 1)],
  term ((-66547862040521339861322380022048721344 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (7, 2), (12, 1), (13, 2), (15, 1)],
  term ((33273931020260669930661190011024360672 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (7, 1), (12, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 243 for generator 16. -/
theorem ep_Q2_024_partial_16_0243_valid :
    mulPoly ep_Q2_024_coefficient_16_0243
        ep_Q2_024_generator_16_0200_0299 =
      ep_Q2_024_partial_16_0243 := by
  native_decide

/-- Coefficient term 244 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0244 : Poly :=
[
  term ((-7361797039595291049606458569276731235884520907461058105 : Rat) / 278999685639605945551432029250879769240203926974238414) [(7, 1), (12, 1), (15, 1)]
]

/-- Partial product 244 for generator 16. -/
def ep_Q2_024_partial_16_0244 : Poly :=
[
  term ((-7361797039595291049606458569276731235884520907461058105 : Rat) / 139499842819802972775716014625439884620101963487119207) [(2, 1), (6, 1), (7, 1), (12, 1), (15, 1)],
  term ((7361797039595291049606458569276731235884520907461058105 : Rat) / 278999685639605945551432029250879769240203926974238414) [(2, 2), (7, 1), (12, 1), (15, 1)],
  term ((-7361797039595291049606458569276731235884520907461058105 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 1), (7, 2), (12, 1), (15, 1)],
  term ((7361797039595291049606458569276731235884520907461058105 : Rat) / 278999685639605945551432029250879769240203926974238414) [(3, 2), (7, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 244 for generator 16. -/
theorem ep_Q2_024_partial_16_0244_valid :
    mulPoly ep_Q2_024_coefficient_16_0244
        ep_Q2_024_generator_16_0200_0299 =
      ep_Q2_024_partial_16_0244 := by
  native_decide

/-- Coefficient term 245 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0245 : Poly :=
[
  term ((-7135878331687774 : Rat) / 1162780221153193) [(7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 245 for generator 16. -/
def ep_Q2_024_partial_16_0245 : Poly :=
[
  term ((-14271756663375548 : Rat) / 1162780221153193) [(2, 1), (6, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((7135878331687774 : Rat) / 1162780221153193) [(2, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-14271756663375548 : Rat) / 1162780221153193) [(3, 1), (7, 2), (12, 1), (15, 1), (16, 1)],
  term ((7135878331687774 : Rat) / 1162780221153193) [(3, 2), (7, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 245 for generator 16. -/
theorem ep_Q2_024_partial_16_0245_valid :
    mulPoly ep_Q2_024_coefficient_16_0245
        ep_Q2_024_generator_16_0200_0299 =
      ep_Q2_024_partial_16_0245 := by
  native_decide

/-- Coefficient term 246 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0246 : Poly :=
[
  term ((49794017268134571589590260644228965512 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (12, 2), (13, 1)]
]

/-- Partial product 246 for generator 16. -/
def ep_Q2_024_partial_16_0246 : Poly :=
[
  term ((99588034536269143179180521288457931024 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (6, 1), (7, 1), (12, 2), (13, 1)],
  term ((-49794017268134571589590260644228965512 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (7, 1), (12, 2), (13, 1)],
  term ((99588034536269143179180521288457931024 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (7, 2), (12, 2), (13, 1)],
  term ((-49794017268134571589590260644228965512 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (7, 1), (12, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 246 for generator 16. -/
theorem ep_Q2_024_partial_16_0246_valid :
    mulPoly ep_Q2_024_coefficient_16_0246
        ep_Q2_024_generator_16_0200_0299 =
      ep_Q2_024_partial_16_0246 := by
  native_decide

/-- Coefficient term 247 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0247 : Poly :=
[
  term ((-183488243113488394739718246684116996552696960175428317 : Rat) / 92999895213201981850477343083626589746734642324746138) [(7, 1), (12, 2), (15, 1)]
]

/-- Partial product 247 for generator 16. -/
def ep_Q2_024_partial_16_0247 : Poly :=
[
  term ((-183488243113488394739718246684116996552696960175428317 : Rat) / 46499947606600990925238671541813294873367321162373069) [(2, 1), (6, 1), (7, 1), (12, 2), (15, 1)],
  term ((183488243113488394739718246684116996552696960175428317 : Rat) / 92999895213201981850477343083626589746734642324746138) [(2, 2), (7, 1), (12, 2), (15, 1)],
  term ((-183488243113488394739718246684116996552696960175428317 : Rat) / 46499947606600990925238671541813294873367321162373069) [(3, 1), (7, 2), (12, 2), (15, 1)],
  term ((183488243113488394739718246684116996552696960175428317 : Rat) / 92999895213201981850477343083626589746734642324746138) [(3, 2), (7, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 247 for generator 16. -/
theorem ep_Q2_024_partial_16_0247_valid :
    mulPoly ep_Q2_024_coefficient_16_0247
        ep_Q2_024_generator_16_0200_0299 =
      ep_Q2_024_partial_16_0247 := by
  native_decide

/-- Coefficient term 248 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0248 : Poly :=
[
  term ((434461680526322 : Rat) / 1162780221153193) [(7, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 248 for generator 16. -/
def ep_Q2_024_partial_16_0248 : Poly :=
[
  term ((868923361052644 : Rat) / 1162780221153193) [(2, 1), (6, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((-434461680526322 : Rat) / 1162780221153193) [(2, 2), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((868923361052644 : Rat) / 1162780221153193) [(3, 1), (7, 2), (12, 2), (15, 1), (16, 1)],
  term ((-434461680526322 : Rat) / 1162780221153193) [(3, 2), (7, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 248 for generator 16. -/
theorem ep_Q2_024_partial_16_0248_valid :
    mulPoly ep_Q2_024_coefficient_16_0248
        ep_Q2_024_generator_16_0200_0299 =
      ep_Q2_024_partial_16_0248 := by
  native_decide

/-- Coefficient term 249 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0249 : Poly :=
[
  term ((-213276192836476200651951336600363730057 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (13, 1)]
]

/-- Partial product 249 for generator 16. -/
def ep_Q2_024_partial_16_0249 : Poly :=
[
  term ((-426552385672952401303902673200727460114 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (6, 1), (7, 1), (13, 1)],
  term ((213276192836476200651951336600363730057 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (7, 1), (13, 1)],
  term ((-426552385672952401303902673200727460114 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (7, 2), (13, 1)],
  term ((213276192836476200651951336600363730057 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 249 for generator 16. -/
theorem ep_Q2_024_partial_16_0249_valid :
    mulPoly ep_Q2_024_coefficient_16_0249
        ep_Q2_024_generator_16_0200_0299 =
      ep_Q2_024_partial_16_0249 := by
  native_decide

/-- Coefficient term 250 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0250 : Poly :=
[
  term ((732265774684129661100978055267095429713 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (13, 1), (14, 1)]
]

/-- Partial product 250 for generator 16. -/
def ep_Q2_024_partial_16_0250 : Poly :=
[
  term ((1464531549368259322201956110534190859426 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (6, 1), (7, 1), (13, 1), (14, 1)],
  term ((-732265774684129661100978055267095429713 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (7, 1), (13, 1), (14, 1)],
  term ((1464531549368259322201956110534190859426 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (7, 2), (13, 1), (14, 1)],
  term ((-732265774684129661100978055267095429713 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (7, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 250 for generator 16. -/
theorem ep_Q2_024_partial_16_0250_valid :
    mulPoly ep_Q2_024_coefficient_16_0250
        ep_Q2_024_generator_16_0200_0299 =
      ep_Q2_024_partial_16_0250 := by
  native_decide

/-- Coefficient term 251 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0251 : Poly :=
[
  term ((-11054165036071785399365776736060685613928533689685750087 : Rat) / 185999790426403963700954686167253179493469284649492276) [(7, 1), (13, 1), (15, 2)]
]

/-- Partial product 251 for generator 16. -/
def ep_Q2_024_partial_16_0251 : Poly :=
[
  term ((-11054165036071785399365776736060685613928533689685750087 : Rat) / 92999895213201981850477343083626589746734642324746138) [(2, 1), (6, 1), (7, 1), (13, 1), (15, 2)],
  term ((11054165036071785399365776736060685613928533689685750087 : Rat) / 185999790426403963700954686167253179493469284649492276) [(2, 2), (7, 1), (13, 1), (15, 2)],
  term ((-11054165036071785399365776736060685613928533689685750087 : Rat) / 92999895213201981850477343083626589746734642324746138) [(3, 1), (7, 2), (13, 1), (15, 2)],
  term ((11054165036071785399365776736060685613928533689685750087 : Rat) / 185999790426403963700954686167253179493469284649492276) [(3, 2), (7, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 251 for generator 16. -/
theorem ep_Q2_024_partial_16_0251_valid :
    mulPoly ep_Q2_024_coefficient_16_0251
        ep_Q2_024_generator_16_0200_0299 =
      ep_Q2_024_partial_16_0251 := by
  native_decide

/-- Coefficient term 252 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0252 : Poly :=
[
  term ((2113589838824883 : Rat) / 1162780221153193) [(7, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 252 for generator 16. -/
def ep_Q2_024_partial_16_0252 : Poly :=
[
  term ((4227179677649766 : Rat) / 1162780221153193) [(2, 1), (6, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2113589838824883 : Rat) / 1162780221153193) [(2, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((4227179677649766 : Rat) / 1162780221153193) [(3, 1), (7, 2), (13, 1), (15, 2), (16, 1)],
  term ((-2113589838824883 : Rat) / 1162780221153193) [(3, 2), (7, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 252 for generator 16. -/
theorem ep_Q2_024_partial_16_0252_valid :
    mulPoly ep_Q2_024_coefficient_16_0252
        ep_Q2_024_generator_16_0200_0299 =
      ep_Q2_024_partial_16_0252 := by
  native_decide

/-- Coefficient term 253 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0253 : Poly :=
[
  term ((64058845371574692704468717594301588487936003313615869633 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(7, 1), (13, 2), (15, 1)]
]

/-- Partial product 253 for generator 16. -/
def ep_Q2_024_partial_16_0253 : Poly :=
[
  term ((64058845371574692704468717594301588487936003313615869633 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(2, 1), (6, 1), (7, 1), (13, 2), (15, 1)],
  term ((-64058845371574692704468717594301588487936003313615869633 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(2, 2), (7, 1), (13, 2), (15, 1)],
  term ((64058845371574692704468717594301588487936003313615869633 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(3, 1), (7, 2), (13, 2), (15, 1)],
  term ((-64058845371574692704468717594301588487936003313615869633 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(3, 2), (7, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 253 for generator 16. -/
theorem ep_Q2_024_partial_16_0253_valid :
    mulPoly ep_Q2_024_coefficient_16_0253
        ep_Q2_024_generator_16_0200_0299 =
      ep_Q2_024_partial_16_0253 := by
  native_decide

/-- Coefficient term 254 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0254 : Poly :=
[
  term ((-181622001380355 : Rat) / 1162780221153193) [(7, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 254 for generator 16. -/
def ep_Q2_024_partial_16_0254 : Poly :=
[
  term ((-363244002760710 : Rat) / 1162780221153193) [(2, 1), (6, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((181622001380355 : Rat) / 1162780221153193) [(2, 2), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-363244002760710 : Rat) / 1162780221153193) [(3, 1), (7, 2), (13, 2), (15, 1), (16, 1)],
  term ((181622001380355 : Rat) / 1162780221153193) [(3, 2), (7, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 254 for generator 16. -/
theorem ep_Q2_024_partial_16_0254_valid :
    mulPoly ep_Q2_024_coefficient_16_0254
        ep_Q2_024_generator_16_0200_0299 =
      ep_Q2_024_partial_16_0254 := by
  native_decide

/-- Coefficient term 255 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0255 : Poly :=
[
  term ((-24285619430674572789347187379892301356 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (13, 3)]
]

/-- Partial product 255 for generator 16. -/
def ep_Q2_024_partial_16_0255 : Poly :=
[
  term ((-48571238861349145578694374759784602712 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (6, 1), (7, 1), (13, 3)],
  term ((24285619430674572789347187379892301356 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (7, 1), (13, 3)],
  term ((-48571238861349145578694374759784602712 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (7, 2), (13, 3)],
  term ((24285619430674572789347187379892301356 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (7, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 255 for generator 16. -/
theorem ep_Q2_024_partial_16_0255_valid :
    mulPoly ep_Q2_024_coefficient_16_0255
        ep_Q2_024_generator_16_0200_0299 =
      ep_Q2_024_partial_16_0255 := by
  native_decide

/-- Coefficient term 256 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0256 : Poly :=
[
  term ((1394833103216049324805768383943433850561917589737731747 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(7, 1), (14, 1), (15, 1)]
]

/-- Partial product 256 for generator 16. -/
def ep_Q2_024_partial_16_0256 : Poly :=
[
  term ((1394833103216049324805768383943433850561917589737731747 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(2, 1), (6, 1), (7, 1), (14, 1), (15, 1)],
  term ((-1394833103216049324805768383943433850561917589737731747 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(2, 2), (7, 1), (14, 1), (15, 1)],
  term ((1394833103216049324805768383943433850561917589737731747 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(3, 1), (7, 2), (14, 1), (15, 1)],
  term ((-1394833103216049324805768383943433850561917589737731747 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(3, 2), (7, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 256 for generator 16. -/
theorem ep_Q2_024_partial_16_0256_valid :
    mulPoly ep_Q2_024_coefficient_16_0256
        ep_Q2_024_generator_16_0200_0299 =
      ep_Q2_024_partial_16_0256 := by
  native_decide

/-- Coefficient term 257 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0257 : Poly :=
[
  term ((-929762167201001 : Rat) / 1162780221153193) [(7, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 257 for generator 16. -/
def ep_Q2_024_partial_16_0257 : Poly :=
[
  term ((-1859524334402002 : Rat) / 1162780221153193) [(2, 1), (6, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((929762167201001 : Rat) / 1162780221153193) [(2, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1859524334402002 : Rat) / 1162780221153193) [(3, 1), (7, 2), (14, 1), (15, 1), (16, 1)],
  term ((929762167201001 : Rat) / 1162780221153193) [(3, 2), (7, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 257 for generator 16. -/
theorem ep_Q2_024_partial_16_0257_valid :
    mulPoly ep_Q2_024_coefficient_16_0257
        ep_Q2_024_generator_16_0200_0299 =
      ep_Q2_024_partial_16_0257 := by
  native_decide

/-- Coefficient term 258 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0258 : Poly :=
[
  term ((3963597833157099861251696569788307334863264097781422848 : Rat) / 139499842819802972775716014625439884620101963487119207) [(7, 1), (15, 1)]
]

/-- Partial product 258 for generator 16. -/
def ep_Q2_024_partial_16_0258 : Poly :=
[
  term ((7927195666314199722503393139576614669726528195562845696 : Rat) / 139499842819802972775716014625439884620101963487119207) [(2, 1), (6, 1), (7, 1), (15, 1)],
  term ((-3963597833157099861251696569788307334863264097781422848 : Rat) / 139499842819802972775716014625439884620101963487119207) [(2, 2), (7, 1), (15, 1)],
  term ((7927195666314199722503393139576614669726528195562845696 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 1), (7, 2), (15, 1)],
  term ((-3963597833157099861251696569788307334863264097781422848 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 2), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 258 for generator 16. -/
theorem ep_Q2_024_partial_16_0258_valid :
    mulPoly ep_Q2_024_coefficient_16_0258
        ep_Q2_024_generator_16_0200_0299 =
      ep_Q2_024_partial_16_0258 := by
  native_decide

/-- Coefficient term 259 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0259 : Poly :=
[
  term ((6701416651161452 : Rat) / 1162780221153193) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 259 for generator 16. -/
def ep_Q2_024_partial_16_0259 : Poly :=
[
  term ((13402833302322904 : Rat) / 1162780221153193) [(2, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-6701416651161452 : Rat) / 1162780221153193) [(2, 2), (7, 1), (15, 1), (16, 1)],
  term ((13402833302322904 : Rat) / 1162780221153193) [(3, 1), (7, 2), (15, 1), (16, 1)],
  term ((-6701416651161452 : Rat) / 1162780221153193) [(3, 2), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 259 for generator 16. -/
theorem ep_Q2_024_partial_16_0259_valid :
    mulPoly ep_Q2_024_coefficient_16_0259
        ep_Q2_024_generator_16_0200_0299 =
      ep_Q2_024_partial_16_0259 := by
  native_decide

/-- Coefficient term 260 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0260 : Poly :=
[
  term ((413173782075119663093768476218434237432 : Rat) / 599854728701238648283346764014769633995) [(8, 1)]
]

/-- Partial product 260 for generator 16. -/
def ep_Q2_024_partial_16_0260 : Poly :=
[
  term ((826347564150239326187536952436868474864 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (6, 1), (8, 1)],
  term ((-413173782075119663093768476218434237432 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (8, 1)],
  term ((826347564150239326187536952436868474864 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (7, 1), (8, 1)],
  term ((-413173782075119663093768476218434237432 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (8, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 260 for generator 16. -/
theorem ep_Q2_024_partial_16_0260_valid :
    mulPoly ep_Q2_024_coefficient_16_0260
        ep_Q2_024_generator_16_0200_0299 =
      ep_Q2_024_partial_16_0260 := by
  native_decide

/-- Coefficient term 261 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0261 : Poly :=
[
  term ((24897008634067285794795130322114482756 : Rat) / 199951576233746216094448921338256544665) [(8, 1), (9, 1), (12, 1), (13, 1)]
]

/-- Partial product 261 for generator 16. -/
def ep_Q2_024_partial_16_0261 : Poly :=
[
  term ((49794017268134571589590260644228965512 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (6, 1), (8, 1), (9, 1), (12, 1), (13, 1)],
  term ((-24897008634067285794795130322114482756 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (8, 1), (9, 1), (12, 1), (13, 1)],
  term ((49794017268134571589590260644228965512 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (7, 1), (8, 1), (9, 1), (12, 1), (13, 1)],
  term ((-24897008634067285794795130322114482756 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (8, 1), (9, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 261 for generator 16. -/
theorem ep_Q2_024_partial_16_0261_valid :
    mulPoly ep_Q2_024_coefficient_16_0261
        ep_Q2_024_generator_16_0200_0299 =
      ep_Q2_024_partial_16_0261 := by
  native_decide

/-- Coefficient term 262 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0262 : Poly :=
[
  term ((-550464729340465184219154740052350989658090880526284951 : Rat) / 185999790426403963700954686167253179493469284649492276) [(8, 1), (9, 1), (12, 1), (15, 1)]
]

/-- Partial product 262 for generator 16. -/
def ep_Q2_024_partial_16_0262 : Poly :=
[
  term ((-550464729340465184219154740052350989658090880526284951 : Rat) / 92999895213201981850477343083626589746734642324746138) [(2, 1), (6, 1), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((550464729340465184219154740052350989658090880526284951 : Rat) / 185999790426403963700954686167253179493469284649492276) [(2, 2), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((-550464729340465184219154740052350989658090880526284951 : Rat) / 92999895213201981850477343083626589746734642324746138) [(3, 1), (7, 1), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((550464729340465184219154740052350989658090880526284951 : Rat) / 185999790426403963700954686167253179493469284649492276) [(3, 2), (8, 1), (9, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 262 for generator 16. -/
theorem ep_Q2_024_partial_16_0262_valid :
    mulPoly ep_Q2_024_coefficient_16_0262
        ep_Q2_024_generator_16_0200_0299 =
      ep_Q2_024_partial_16_0262 := by
  native_decide

/-- Coefficient term 263 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0263 : Poly :=
[
  term ((651692520789483 : Rat) / 1162780221153193) [(8, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 263 for generator 16. -/
def ep_Q2_024_partial_16_0263 : Poly :=
[
  term ((1303385041578966 : Rat) / 1162780221153193) [(2, 1), (6, 1), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-651692520789483 : Rat) / 1162780221153193) [(2, 2), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((1303385041578966 : Rat) / 1162780221153193) [(3, 1), (7, 1), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-651692520789483 : Rat) / 1162780221153193) [(3, 2), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 263 for generator 16. -/
theorem ep_Q2_024_partial_16_0263_valid :
    mulPoly ep_Q2_024_coefficient_16_0263
        ep_Q2_024_generator_16_0200_0299 =
      ep_Q2_024_partial_16_0263 := by
  native_decide

/-- Coefficient term 264 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0264 : Poly :=
[
  term ((955668267373466586418472917085351378944 : Rat) / 1799564186103715944850040292044308901985) [(8, 1), (9, 1), (13, 1)]
]

/-- Partial product 264 for generator 16. -/
def ep_Q2_024_partial_16_0264 : Poly :=
[
  term ((1911336534746933172836945834170702757888 : Rat) / 1799564186103715944850040292044308901985) [(2, 1), (6, 1), (8, 1), (9, 1), (13, 1)],
  term ((-955668267373466586418472917085351378944 : Rat) / 1799564186103715944850040292044308901985) [(2, 2), (8, 1), (9, 1), (13, 1)],
  term ((1911336534746933172836945834170702757888 : Rat) / 1799564186103715944850040292044308901985) [(3, 1), (7, 1), (8, 1), (9, 1), (13, 1)],
  term ((-955668267373466586418472917085351378944 : Rat) / 1799564186103715944850040292044308901985) [(3, 2), (8, 1), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 264 for generator 16. -/
theorem ep_Q2_024_partial_16_0264_valid :
    mulPoly ep_Q2_024_coefficient_16_0264
        ep_Q2_024_generator_16_0200_0299 =
      ep_Q2_024_partial_16_0264 := by
  native_decide

/-- Coefficient term 265 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0265 : Poly :=
[
  term ((112367354585249277159269751704270049391015638612863684701 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(8, 1), (9, 1), (15, 1)]
]

/-- Partial product 265 for generator 16. -/
def ep_Q2_024_partial_16_0265 : Poly :=
[
  term ((112367354585249277159269751704270049391015638612863684701 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(2, 1), (6, 1), (8, 1), (9, 1), (15, 1)],
  term ((-112367354585249277159269751704270049391015638612863684701 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(2, 2), (8, 1), (9, 1), (15, 1)],
  term ((112367354585249277159269751704270049391015638612863684701 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(3, 1), (7, 1), (8, 1), (9, 1), (15, 1)],
  term ((-112367354585249277159269751704270049391015638612863684701 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(3, 2), (8, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 265 for generator 16. -/
theorem ep_Q2_024_partial_16_0265_valid :
    mulPoly ep_Q2_024_coefficient_16_0265
        ep_Q2_024_generator_16_0200_0299 =
      ep_Q2_024_partial_16_0265 := by
  native_decide

/-- Coefficient term 266 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0266 : Poly :=
[
  term ((-10199593906176821 : Rat) / 6976681326919158) [(8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 266 for generator 16. -/
def ep_Q2_024_partial_16_0266 : Poly :=
[
  term ((-10199593906176821 : Rat) / 3488340663459579) [(2, 1), (6, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((10199593906176821 : Rat) / 6976681326919158) [(2, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-10199593906176821 : Rat) / 3488340663459579) [(3, 1), (7, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((10199593906176821 : Rat) / 6976681326919158) [(3, 2), (8, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 266 for generator 16. -/
theorem ep_Q2_024_partial_16_0266_valid :
    mulPoly ep_Q2_024_coefficient_16_0266
        ep_Q2_024_generator_16_0200_0299 =
      ep_Q2_024_partial_16_0266 := by
  native_decide

/-- Coefficient term 267 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0267 : Poly :=
[
  term ((-1481468177506417179031785085475034735568 : Rat) / 1799564186103715944850040292044308901985) [(8, 1), (9, 2)]
]

/-- Partial product 267 for generator 16. -/
def ep_Q2_024_partial_16_0267 : Poly :=
[
  term ((-2962936355012834358063570170950069471136 : Rat) / 1799564186103715944850040292044308901985) [(2, 1), (6, 1), (8, 1), (9, 2)],
  term ((1481468177506417179031785085475034735568 : Rat) / 1799564186103715944850040292044308901985) [(2, 2), (8, 1), (9, 2)],
  term ((-2962936355012834358063570170950069471136 : Rat) / 1799564186103715944850040292044308901985) [(3, 1), (7, 1), (8, 1), (9, 2)],
  term ((1481468177506417179031785085475034735568 : Rat) / 1799564186103715944850040292044308901985) [(3, 2), (8, 1), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 267 for generator 16. -/
theorem ep_Q2_024_partial_16_0267_valid :
    mulPoly ep_Q2_024_coefficient_16_0267
        ep_Q2_024_generator_16_0200_0299 =
      ep_Q2_024_partial_16_0267 := by
  native_decide

/-- Coefficient term 268 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0268 : Poly :=
[
  term ((-413173782075119663093768476218434237432 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (12, 1)]
]

/-- Partial product 268 for generator 16. -/
def ep_Q2_024_partial_16_0268 : Poly :=
[
  term ((-826347564150239326187536952436868474864 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (6, 1), (8, 1), (12, 1)],
  term ((413173782075119663093768476218434237432 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (8, 1), (12, 1)],
  term ((-826347564150239326187536952436868474864 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (7, 1), (8, 1), (12, 1)],
  term ((413173782075119663093768476218434237432 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (8, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 268 for generator 16. -/
theorem ep_Q2_024_partial_16_0268_valid :
    mulPoly ep_Q2_024_coefficient_16_0268
        ep_Q2_024_generator_16_0200_0299 =
      ep_Q2_024_partial_16_0268 := by
  native_decide

/-- Coefficient term 269 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0269 : Poly :=
[
  term ((550464729340465184219154740052350989658090880526284951 : Rat) / 185999790426403963700954686167253179493469284649492276) [(8, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 269 for generator 16. -/
def ep_Q2_024_partial_16_0269 : Poly :=
[
  term ((550464729340465184219154740052350989658090880526284951 : Rat) / 92999895213201981850477343083626589746734642324746138) [(2, 1), (6, 1), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((-550464729340465184219154740052350989658090880526284951 : Rat) / 185999790426403963700954686167253179493469284649492276) [(2, 2), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((550464729340465184219154740052350989658090880526284951 : Rat) / 92999895213201981850477343083626589746734642324746138) [(3, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((-550464729340465184219154740052350989658090880526284951 : Rat) / 185999790426403963700954686167253179493469284649492276) [(3, 2), (8, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 269 for generator 16. -/
theorem ep_Q2_024_partial_16_0269_valid :
    mulPoly ep_Q2_024_coefficient_16_0269
        ep_Q2_024_generator_16_0200_0299 =
      ep_Q2_024_partial_16_0269 := by
  native_decide

/-- Coefficient term 270 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0270 : Poly :=
[
  term ((-651692520789483 : Rat) / 1162780221153193) [(8, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 270 for generator 16. -/
def ep_Q2_024_partial_16_0270 : Poly :=
[
  term ((-1303385041578966 : Rat) / 1162780221153193) [(2, 1), (6, 1), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((651692520789483 : Rat) / 1162780221153193) [(2, 2), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1303385041578966 : Rat) / 1162780221153193) [(3, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((651692520789483 : Rat) / 1162780221153193) [(3, 2), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 270 for generator 16. -/
theorem ep_Q2_024_partial_16_0270_valid :
    mulPoly ep_Q2_024_coefficient_16_0270
        ep_Q2_024_generator_16_0200_0299 =
      ep_Q2_024_partial_16_0270 := by
  native_decide

/-- Coefficient term 271 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0271 : Poly :=
[
  term ((-24897008634067285794795130322114482756 : Rat) / 199951576233746216094448921338256544665) [(8, 1), (12, 1), (13, 2)]
]

/-- Partial product 271 for generator 16. -/
def ep_Q2_024_partial_16_0271 : Poly :=
[
  term ((-49794017268134571589590260644228965512 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (6, 1), (8, 1), (12, 1), (13, 2)],
  term ((24897008634067285794795130322114482756 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (8, 1), (12, 1), (13, 2)],
  term ((-49794017268134571589590260644228965512 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (7, 1), (8, 1), (12, 1), (13, 2)],
  term ((24897008634067285794795130322114482756 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (8, 1), (12, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 271 for generator 16. -/
theorem ep_Q2_024_partial_16_0271_valid :
    mulPoly ep_Q2_024_coefficient_16_0271
        ep_Q2_024_generator_16_0200_0299 =
      ep_Q2_024_partial_16_0271 := by
  native_decide

/-- Coefficient term 272 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0272 : Poly :=
[
  term ((-112367354585249277159269751704270049391015638612863684701 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(8, 1), (13, 1), (15, 1)]
]

/-- Partial product 272 for generator 16. -/
def ep_Q2_024_partial_16_0272 : Poly :=
[
  term ((-112367354585249277159269751704270049391015638612863684701 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(2, 1), (6, 1), (8, 1), (13, 1), (15, 1)],
  term ((112367354585249277159269751704270049391015638612863684701 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(2, 2), (8, 1), (13, 1), (15, 1)],
  term ((-112367354585249277159269751704270049391015638612863684701 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(3, 1), (7, 1), (8, 1), (13, 1), (15, 1)],
  term ((112367354585249277159269751704270049391015638612863684701 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(3, 2), (8, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 272 for generator 16. -/
theorem ep_Q2_024_partial_16_0272_valid :
    mulPoly ep_Q2_024_coefficient_16_0272
        ep_Q2_024_generator_16_0200_0299 =
      ep_Q2_024_partial_16_0272 := by
  native_decide

/-- Coefficient term 273 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0273 : Poly :=
[
  term ((10199593906176821 : Rat) / 6976681326919158) [(8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 273 for generator 16. -/
def ep_Q2_024_partial_16_0273 : Poly :=
[
  term ((10199593906176821 : Rat) / 3488340663459579) [(2, 1), (6, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-10199593906176821 : Rat) / 6976681326919158) [(2, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((10199593906176821 : Rat) / 3488340663459579) [(3, 1), (7, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-10199593906176821 : Rat) / 6976681326919158) [(3, 2), (8, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 273 for generator 16. -/
theorem ep_Q2_024_partial_16_0273_valid :
    mulPoly ep_Q2_024_coefficient_16_0273
        ep_Q2_024_generator_16_0200_0299 =
      ep_Q2_024_partial_16_0273 := by
  native_decide

/-- Coefficient term 274 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0274 : Poly :=
[
  term ((-60109530803457746714844956809437023648 : Rat) / 359912837220743188970008058408861780397) [(8, 1), (13, 2)]
]

/-- Partial product 274 for generator 16. -/
def ep_Q2_024_partial_16_0274 : Poly :=
[
  term ((-120219061606915493429689913618874047296 : Rat) / 359912837220743188970008058408861780397) [(2, 1), (6, 1), (8, 1), (13, 2)],
  term ((60109530803457746714844956809437023648 : Rat) / 359912837220743188970008058408861780397) [(2, 2), (8, 1), (13, 2)],
  term ((-120219061606915493429689913618874047296 : Rat) / 359912837220743188970008058408861780397) [(3, 1), (7, 1), (8, 1), (13, 2)],
  term ((60109530803457746714844956809437023648 : Rat) / 359912837220743188970008058408861780397) [(3, 2), (8, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 274 for generator 16. -/
theorem ep_Q2_024_partial_16_0274_valid :
    mulPoly ep_Q2_024_coefficient_16_0274
        ep_Q2_024_generator_16_0200_0299 =
      ep_Q2_024_partial_16_0274 := by
  native_decide

/-- Coefficient term 275 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0275 : Poly :=
[
  term ((819515684482632755033446851073124410634 : Rat) / 1799564186103715944850040292044308901985) [(9, 1), (12, 1), (13, 1)]
]

/-- Partial product 275 for generator 16. -/
def ep_Q2_024_partial_16_0275 : Poly :=
[
  term ((1639031368965265510066893702146248821268 : Rat) / 1799564186103715944850040292044308901985) [(2, 1), (6, 1), (9, 1), (12, 1), (13, 1)],
  term ((-819515684482632755033446851073124410634 : Rat) / 1799564186103715944850040292044308901985) [(2, 2), (9, 1), (12, 1), (13, 1)],
  term ((1639031368965265510066893702146248821268 : Rat) / 1799564186103715944850040292044308901985) [(3, 1), (7, 1), (9, 1), (12, 1), (13, 1)],
  term ((-819515684482632755033446851073124410634 : Rat) / 1799564186103715944850040292044308901985) [(3, 2), (9, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 275 for generator 16. -/
theorem ep_Q2_024_partial_16_0275_valid :
    mulPoly ep_Q2_024_coefficient_16_0275
        ep_Q2_024_generator_16_0200_0299 =
      ep_Q2_024_partial_16_0275 := by
  native_decide

/-- Coefficient term 276 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0276 : Poly :=
[
  term ((-35538863163306260263364324695043568543574204480893638831 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(9, 1), (12, 1), (15, 1)]
]

/-- Partial product 276 for generator 16. -/
def ep_Q2_024_partial_16_0276 : Poly :=
[
  term ((-35538863163306260263364324695043568543574204480893638831 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 1), (6, 1), (9, 1), (12, 1), (15, 1)],
  term ((35538863163306260263364324695043568543574204480893638831 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(2, 2), (9, 1), (12, 1), (15, 1)],
  term ((-35538863163306260263364324695043568543574204480893638831 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (7, 1), (9, 1), (12, 1), (15, 1)],
  term ((35538863163306260263364324695043568543574204480893638831 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(3, 2), (9, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 276 for generator 16. -/
theorem ep_Q2_024_partial_16_0276_valid :
    mulPoly ep_Q2_024_coefficient_16_0276
        ep_Q2_024_generator_16_0200_0299 =
      ep_Q2_024_partial_16_0276 := by
  native_decide

/-- Coefficient term 277 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0277 : Poly :=
[
  term ((9878927548793470 : Rat) / 3488340663459579) [(9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 277 for generator 16. -/
def ep_Q2_024_partial_16_0277 : Poly :=
[
  term ((19757855097586940 : Rat) / 3488340663459579) [(2, 1), (6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-9878927548793470 : Rat) / 3488340663459579) [(2, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((19757855097586940 : Rat) / 3488340663459579) [(3, 1), (7, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-9878927548793470 : Rat) / 3488340663459579) [(3, 2), (9, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 277 for generator 16. -/
theorem ep_Q2_024_partial_16_0277_valid :
    mulPoly ep_Q2_024_coefficient_16_0277
        ep_Q2_024_generator_16_0200_0299 =
      ep_Q2_024_partial_16_0277 := by
  native_decide

/-- Coefficient term 278 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0278 : Poly :=
[
  term ((-24897008634067285794795130322114482756 : Rat) / 199951576233746216094448921338256544665) [(9, 1), (12, 2), (13, 1)]
]

/-- Partial product 278 for generator 16. -/
def ep_Q2_024_partial_16_0278 : Poly :=
[
  term ((-49794017268134571589590260644228965512 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (6, 1), (9, 1), (12, 2), (13, 1)],
  term ((24897008634067285794795130322114482756 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (9, 1), (12, 2), (13, 1)],
  term ((-49794017268134571589590260644228965512 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (7, 1), (9, 1), (12, 2), (13, 1)],
  term ((24897008634067285794795130322114482756 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (9, 1), (12, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 278 for generator 16. -/
theorem ep_Q2_024_partial_16_0278_valid :
    mulPoly ep_Q2_024_coefficient_16_0278
        ep_Q2_024_generator_16_0200_0299 =
      ep_Q2_024_partial_16_0278 := by
  native_decide

/-- Coefficient term 279 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0279 : Poly :=
[
  term ((550464729340465184219154740052350989658090880526284951 : Rat) / 185999790426403963700954686167253179493469284649492276) [(9, 1), (12, 2), (15, 1)]
]

/-- Partial product 279 for generator 16. -/
def ep_Q2_024_partial_16_0279 : Poly :=
[
  term ((550464729340465184219154740052350989658090880526284951 : Rat) / 92999895213201981850477343083626589746734642324746138) [(2, 1), (6, 1), (9, 1), (12, 2), (15, 1)],
  term ((-550464729340465184219154740052350989658090880526284951 : Rat) / 185999790426403963700954686167253179493469284649492276) [(2, 2), (9, 1), (12, 2), (15, 1)],
  term ((550464729340465184219154740052350989658090880526284951 : Rat) / 92999895213201981850477343083626589746734642324746138) [(3, 1), (7, 1), (9, 1), (12, 2), (15, 1)],
  term ((-550464729340465184219154740052350989658090880526284951 : Rat) / 185999790426403963700954686167253179493469284649492276) [(3, 2), (9, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 279 for generator 16. -/
theorem ep_Q2_024_partial_16_0279_valid :
    mulPoly ep_Q2_024_coefficient_16_0279
        ep_Q2_024_generator_16_0200_0299 =
      ep_Q2_024_partial_16_0279 := by
  native_decide

/-- Coefficient term 280 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0280 : Poly :=
[
  term ((-651692520789483 : Rat) / 1162780221153193) [(9, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 280 for generator 16. -/
def ep_Q2_024_partial_16_0280 : Poly :=
[
  term ((-1303385041578966 : Rat) / 1162780221153193) [(2, 1), (6, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((651692520789483 : Rat) / 1162780221153193) [(2, 2), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1303385041578966 : Rat) / 1162780221153193) [(3, 1), (7, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((651692520789483 : Rat) / 1162780221153193) [(3, 2), (9, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 280 for generator 16. -/
theorem ep_Q2_024_partial_16_0280_valid :
    mulPoly ep_Q2_024_coefficient_16_0280
        ep_Q2_024_generator_16_0200_0299 =
      ep_Q2_024_partial_16_0280 := by
  native_decide

/-- Coefficient term 281 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0281 : Poly :=
[
  term ((805949358000796349913126552030420092932 : Rat) / 1799564186103715944850040292044308901985) [(9, 1), (13, 1)]
]

/-- Partial product 281 for generator 16. -/
def ep_Q2_024_partial_16_0281 : Poly :=
[
  term ((1611898716001592699826253104060840185864 : Rat) / 1799564186103715944850040292044308901985) [(2, 1), (6, 1), (9, 1), (13, 1)],
  term ((-805949358000796349913126552030420092932 : Rat) / 1799564186103715944850040292044308901985) [(2, 2), (9, 1), (13, 1)],
  term ((1611898716001592699826253104060840185864 : Rat) / 1799564186103715944850040292044308901985) [(3, 1), (7, 1), (9, 1), (13, 1)],
  term ((-805949358000796349913126552030420092932 : Rat) / 1799564186103715944850040292044308901985) [(3, 2), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 281 for generator 16. -/
theorem ep_Q2_024_partial_16_0281_valid :
    mulPoly ep_Q2_024_coefficient_16_0281
        ep_Q2_024_generator_16_0200_0299 =
      ep_Q2_024_partial_16_0281 := by
  native_decide

/-- Coefficient term 282 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0282 : Poly :=
[
  term ((80627782090679273114397877331280963496 : Rat) / 199951576233746216094448921338256544665) [(9, 1), (13, 1), (14, 1)]
]

/-- Partial product 282 for generator 16. -/
def ep_Q2_024_partial_16_0282 : Poly :=
[
  term ((161255564181358546228795754662561926992 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (6, 1), (9, 1), (13, 1), (14, 1)],
  term ((-80627782090679273114397877331280963496 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (9, 1), (13, 1), (14, 1)],
  term ((161255564181358546228795754662561926992 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (7, 1), (9, 1), (13, 1), (14, 1)],
  term ((-80627782090679273114397877331280963496 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (9, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 282 for generator 16. -/
theorem ep_Q2_024_partial_16_0282_valid :
    mulPoly ep_Q2_024_coefficient_16_0282
        ep_Q2_024_generator_16_0200_0299 =
      ep_Q2_024_partial_16_0282 := by
  native_decide

/-- Coefficient term 283 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0283 : Poly :=
[
  term ((272594809814001542933094722250079094468097718750174307369 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(9, 1), (15, 1)]
]

/-- Partial product 283 for generator 16. -/
def ep_Q2_024_partial_16_0283 : Poly :=
[
  term ((272594809814001542933094722250079094468097718750174307369 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(2, 1), (6, 1), (9, 1), (15, 1)],
  term ((-272594809814001542933094722250079094468097718750174307369 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(2, 2), (9, 1), (15, 1)],
  term ((272594809814001542933094722250079094468097718750174307369 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(3, 1), (7, 1), (9, 1), (15, 1)],
  term ((-272594809814001542933094722250079094468097718750174307369 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(3, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 283 for generator 16. -/
theorem ep_Q2_024_partial_16_0283_valid :
    mulPoly ep_Q2_024_coefficient_16_0283
        ep_Q2_024_generator_16_0200_0299 =
      ep_Q2_024_partial_16_0283 := by
  native_decide

/-- Coefficient term 284 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0284 : Poly :=
[
  term ((-30681801572986753 : Rat) / 13953362653838316) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 284 for generator 16. -/
def ep_Q2_024_partial_16_0284 : Poly :=
[
  term ((-30681801572986753 : Rat) / 6976681326919158) [(2, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((30681801572986753 : Rat) / 13953362653838316) [(2, 2), (9, 1), (15, 1), (16, 1)],
  term ((-30681801572986753 : Rat) / 6976681326919158) [(3, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((30681801572986753 : Rat) / 13953362653838316) [(3, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 284 for generator 16. -/
theorem ep_Q2_024_partial_16_0284_valid :
    mulPoly ep_Q2_024_coefficient_16_0284
        ep_Q2_024_generator_16_0200_0299 =
      ep_Q2_024_partial_16_0284 := by
  native_decide

/-- Coefficient term 285 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0285 : Poly :=
[
  term ((-2387626961939987510672639906547731859643 : Rat) / 1079738511662229566910024175226585341191) [(9, 2)]
]

/-- Partial product 285 for generator 16. -/
def ep_Q2_024_partial_16_0285 : Poly :=
[
  term ((-4775253923879975021345279813095463719286 : Rat) / 1079738511662229566910024175226585341191) [(2, 1), (6, 1), (9, 2)],
  term ((2387626961939987510672639906547731859643 : Rat) / 1079738511662229566910024175226585341191) [(2, 2), (9, 2)],
  term ((-4775253923879975021345279813095463719286 : Rat) / 1079738511662229566910024175226585341191) [(3, 1), (7, 1), (9, 2)],
  term ((2387626961939987510672639906547731859643 : Rat) / 1079738511662229566910024175226585341191) [(3, 2), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 285 for generator 16. -/
theorem ep_Q2_024_partial_16_0285_valid :
    mulPoly ep_Q2_024_coefficient_16_0285
        ep_Q2_024_generator_16_0200_0299 =
      ep_Q2_024_partial_16_0285 := by
  native_decide

/-- Coefficient term 286 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0286 : Poly :=
[
  term ((73019057256041486527015351666160404934 : Rat) / 119970945740247729656669352802953926799) [(9, 2), (12, 1)]
]

/-- Partial product 286 for generator 16. -/
def ep_Q2_024_partial_16_0286 : Poly :=
[
  term ((146038114512082973054030703332320809868 : Rat) / 119970945740247729656669352802953926799) [(2, 1), (6, 1), (9, 2), (12, 1)],
  term ((-73019057256041486527015351666160404934 : Rat) / 119970945740247729656669352802953926799) [(2, 2), (9, 2), (12, 1)],
  term ((146038114512082973054030703332320809868 : Rat) / 119970945740247729656669352802953926799) [(3, 1), (7, 1), (9, 2), (12, 1)],
  term ((-73019057256041486527015351666160404934 : Rat) / 119970945740247729656669352802953926799) [(3, 2), (9, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 286 for generator 16. -/
theorem ep_Q2_024_partial_16_0286_valid :
    mulPoly ep_Q2_024_coefficient_16_0286
        ep_Q2_024_generator_16_0200_0299 =
      ep_Q2_024_partial_16_0286 := by
  native_decide

/-- Coefficient term 287 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0287 : Poly :=
[
  term ((11091310340086889976887063337008120224 : Rat) / 199951576233746216094448921338256544665) [(9, 2), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 287 for generator 16. -/
def ep_Q2_024_partial_16_0287 : Poly :=
[
  term ((22182620680173779953774126674016240448 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (6, 1), (9, 2), (12, 1), (13, 1), (15, 1)],
  term ((-11091310340086889976887063337008120224 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (9, 2), (12, 1), (13, 1), (15, 1)],
  term ((22182620680173779953774126674016240448 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (7, 1), (9, 2), (12, 1), (13, 1), (15, 1)],
  term ((-11091310340086889976887063337008120224 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (9, 2), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 287 for generator 16. -/
theorem ep_Q2_024_partial_16_0287_valid :
    mulPoly ep_Q2_024_coefficient_16_0287
        ep_Q2_024_generator_16_0200_0299 =
      ep_Q2_024_partial_16_0287 := by
  native_decide

/-- Coefficient term 288 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0288 : Poly :=
[
  term ((-198745616475118943998092102782769635563595552220534688 : Rat) / 139499842819802972775716014625439884620101963487119207) [(9, 2), (12, 1), (15, 2)]
]

/-- Partial product 288 for generator 16. -/
def ep_Q2_024_partial_16_0288 : Poly :=
[
  term ((-397491232950237887996184205565539271127191104441069376 : Rat) / 139499842819802972775716014625439884620101963487119207) [(2, 1), (6, 1), (9, 2), (12, 1), (15, 2)],
  term ((198745616475118943998092102782769635563595552220534688 : Rat) / 139499842819802972775716014625439884620101963487119207) [(2, 2), (9, 2), (12, 1), (15, 2)],
  term ((-397491232950237887996184205565539271127191104441069376 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 1), (7, 1), (9, 2), (12, 1), (15, 2)],
  term ((198745616475118943998092102782769635563595552220534688 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 2), (9, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 288 for generator 16. -/
theorem ep_Q2_024_partial_16_0288_valid :
    mulPoly ep_Q2_024_coefficient_16_0288
        ep_Q2_024_generator_16_0200_0299 =
      ep_Q2_024_partial_16_0288 := by
  native_decide

/-- Coefficient term 289 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0289 : Poly :=
[
  term ((527210767274432 : Rat) / 1162780221153193) [(9, 2), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 289 for generator 16. -/
def ep_Q2_024_partial_16_0289 : Poly :=
[
  term ((1054421534548864 : Rat) / 1162780221153193) [(2, 1), (6, 1), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((-527210767274432 : Rat) / 1162780221153193) [(2, 2), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((1054421534548864 : Rat) / 1162780221153193) [(3, 1), (7, 1), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((-527210767274432 : Rat) / 1162780221153193) [(3, 2), (9, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 289 for generator 16. -/
theorem ep_Q2_024_partial_16_0289_valid :
    mulPoly ep_Q2_024_coefficient_16_0289
        ep_Q2_024_generator_16_0200_0299 =
      ep_Q2_024_partial_16_0289 := by
  native_decide

/-- Coefficient term 290 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0290 : Poly :=
[
  term ((-1269228168809522245699254430788175009060618502683481501 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(9, 2), (13, 1), (15, 1)]
]

/-- Partial product 290 for generator 16. -/
def ep_Q2_024_partial_16_0290 : Poly :=
[
  term ((-1269228168809522245699254430788175009060618502683481501 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(2, 1), (6, 1), (9, 2), (13, 1), (15, 1)],
  term ((1269228168809522245699254430788175009060618502683481501 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(2, 2), (9, 2), (13, 1), (15, 1)],
  term ((-1269228168809522245699254430788175009060618502683481501 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(3, 1), (7, 1), (9, 2), (13, 1), (15, 1)],
  term ((1269228168809522245699254430788175009060618502683481501 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(3, 2), (9, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 290 for generator 16. -/
theorem ep_Q2_024_partial_16_0290_valid :
    mulPoly ep_Q2_024_coefficient_16_0290
        ep_Q2_024_generator_16_0200_0299 =
      ep_Q2_024_partial_16_0290 := by
  native_decide

/-- Coefficient term 291 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0291 : Poly :=
[
  term ((-5094646267068265 : Rat) / 3488340663459579) [(9, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 291 for generator 16. -/
def ep_Q2_024_partial_16_0291 : Poly :=
[
  term ((-10189292534136530 : Rat) / 3488340663459579) [(2, 1), (6, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((5094646267068265 : Rat) / 3488340663459579) [(2, 2), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-10189292534136530 : Rat) / 3488340663459579) [(3, 1), (7, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((5094646267068265 : Rat) / 3488340663459579) [(3, 2), (9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 291 for generator 16. -/
theorem ep_Q2_024_partial_16_0291_valid :
    mulPoly ep_Q2_024_coefficient_16_0291
        ep_Q2_024_generator_16_0200_0299 =
      ep_Q2_024_partial_16_0291 := by
  native_decide

/-- Coefficient term 292 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0292 : Poly :=
[
  term ((815388877581942842408941403533558143676 : Rat) / 1799564186103715944850040292044308901985) [(9, 2), (13, 2)]
]

/-- Partial product 292 for generator 16. -/
def ep_Q2_024_partial_16_0292 : Poly :=
[
  term ((1630777755163885684817882807067116287352 : Rat) / 1799564186103715944850040292044308901985) [(2, 1), (6, 1), (9, 2), (13, 2)],
  term ((-815388877581942842408941403533558143676 : Rat) / 1799564186103715944850040292044308901985) [(2, 2), (9, 2), (13, 2)],
  term ((1630777755163885684817882807067116287352 : Rat) / 1799564186103715944850040292044308901985) [(3, 1), (7, 1), (9, 2), (13, 2)],
  term ((-815388877581942842408941403533558143676 : Rat) / 1799564186103715944850040292044308901985) [(3, 2), (9, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 292 for generator 16. -/
theorem ep_Q2_024_partial_16_0292_valid :
    mulPoly ep_Q2_024_coefficient_16_0292
        ep_Q2_024_generator_16_0200_0299 =
      ep_Q2_024_partial_16_0292 := by
  native_decide

/-- Coefficient term 293 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0293 : Poly :=
[
  term ((-127117587288509716251354049751831833361 : Rat) / 359912837220743188970008058408861780397) [(9, 2), (14, 1)]
]

/-- Partial product 293 for generator 16. -/
def ep_Q2_024_partial_16_0293 : Poly :=
[
  term ((-254235174577019432502708099503663666722 : Rat) / 359912837220743188970008058408861780397) [(2, 1), (6, 1), (9, 2), (14, 1)],
  term ((127117587288509716251354049751831833361 : Rat) / 359912837220743188970008058408861780397) [(2, 2), (9, 2), (14, 1)],
  term ((-254235174577019432502708099503663666722 : Rat) / 359912837220743188970008058408861780397) [(3, 1), (7, 1), (9, 2), (14, 1)],
  term ((127117587288509716251354049751831833361 : Rat) / 359912837220743188970008058408861780397) [(3, 2), (9, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 293 for generator 16. -/
theorem ep_Q2_024_partial_16_0293_valid :
    mulPoly ep_Q2_024_coefficient_16_0293
        ep_Q2_024_generator_16_0200_0299 =
      ep_Q2_024_partial_16_0293 := by
  native_decide

/-- Coefficient term 294 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0294 : Poly :=
[
  term ((-289873507268913191523518837135133871483600695335134711471 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(9, 2), (15, 2)]
]

/-- Partial product 294 for generator 16. -/
def ep_Q2_024_partial_16_0294 : Poly :=
[
  term ((-289873507268913191523518837135133871483600695335134711471 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(2, 1), (6, 1), (9, 2), (15, 2)],
  term ((289873507268913191523518837135133871483600695335134711471 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(2, 2), (9, 2), (15, 2)],
  term ((-289873507268913191523518837135133871483600695335134711471 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(3, 1), (7, 1), (9, 2), (15, 2)],
  term ((289873507268913191523518837135133871483600695335134711471 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(3, 2), (9, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 294 for generator 16. -/
theorem ep_Q2_024_partial_16_0294_valid :
    mulPoly ep_Q2_024_coefficient_16_0294
        ep_Q2_024_generator_16_0200_0299 =
      ep_Q2_024_partial_16_0294 := by
  native_decide

/-- Coefficient term 295 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0295 : Poly :=
[
  term ((16856913734998261 : Rat) / 3488340663459579) [(9, 2), (15, 2), (16, 1)]
]

/-- Partial product 295 for generator 16. -/
def ep_Q2_024_partial_16_0295 : Poly :=
[
  term ((33713827469996522 : Rat) / 3488340663459579) [(2, 1), (6, 1), (9, 2), (15, 2), (16, 1)],
  term ((-16856913734998261 : Rat) / 3488340663459579) [(2, 2), (9, 2), (15, 2), (16, 1)],
  term ((33713827469996522 : Rat) / 3488340663459579) [(3, 1), (7, 1), (9, 2), (15, 2), (16, 1)],
  term ((-16856913734998261 : Rat) / 3488340663459579) [(3, 2), (9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 295 for generator 16. -/
theorem ep_Q2_024_partial_16_0295_valid :
    mulPoly ep_Q2_024_coefficient_16_0295
        ep_Q2_024_generator_16_0200_0299 =
      ep_Q2_024_partial_16_0295 := by
  native_decide

/-- Coefficient term 296 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0296 : Poly :=
[
  term ((80699759732353167093043025510819982368 : Rat) / 599854728701238648283346764014769633995) [(9, 3), (13, 1)]
]

/-- Partial product 296 for generator 16. -/
def ep_Q2_024_partial_16_0296 : Poly :=
[
  term ((161399519464706334186086051021639964736 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (6, 1), (9, 3), (13, 1)],
  term ((-80699759732353167093043025510819982368 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (9, 3), (13, 1)],
  term ((161399519464706334186086051021639964736 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (7, 1), (9, 3), (13, 1)],
  term ((-80699759732353167093043025510819982368 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (9, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 296 for generator 16. -/
theorem ep_Q2_024_partial_16_0296_valid :
    mulPoly ep_Q2_024_coefficient_16_0296
        ep_Q2_024_generator_16_0200_0299 =
      ep_Q2_024_partial_16_0296 := by
  native_decide

/-- Coefficient term 297 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0297 : Poly :=
[
  term ((225792246667296571754346172666409042645220020210494517 : Rat) / 836999056918817836654296087752639307720611780922715242) [(9, 3), (15, 1)]
]

/-- Partial product 297 for generator 16. -/
def ep_Q2_024_partial_16_0297 : Poly :=
[
  term ((225792246667296571754346172666409042645220020210494517 : Rat) / 418499528459408918327148043876319653860305890461357621) [(2, 1), (6, 1), (9, 3), (15, 1)],
  term ((-225792246667296571754346172666409042645220020210494517 : Rat) / 836999056918817836654296087752639307720611780922715242) [(2, 2), (9, 3), (15, 1)],
  term ((225792246667296571754346172666409042645220020210494517 : Rat) / 418499528459408918327148043876319653860305890461357621) [(3, 1), (7, 1), (9, 3), (15, 1)],
  term ((-225792246667296571754346172666409042645220020210494517 : Rat) / 836999056918817836654296087752639307720611780922715242) [(3, 2), (9, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 297 for generator 16. -/
theorem ep_Q2_024_partial_16_0297_valid :
    mulPoly ep_Q2_024_coefficient_16_0297
        ep_Q2_024_generator_16_0200_0299 =
      ep_Q2_024_partial_16_0297 := by
  native_decide

/-- Coefficient term 298 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0298 : Poly :=
[
  term ((373787112386234 : Rat) / 3488340663459579) [(9, 3), (15, 1), (16, 1)]
]

/-- Partial product 298 for generator 16. -/
def ep_Q2_024_partial_16_0298 : Poly :=
[
  term ((747574224772468 : Rat) / 3488340663459579) [(2, 1), (6, 1), (9, 3), (15, 1), (16, 1)],
  term ((-373787112386234 : Rat) / 3488340663459579) [(2, 2), (9, 3), (15, 1), (16, 1)],
  term ((747574224772468 : Rat) / 3488340663459579) [(3, 1), (7, 1), (9, 3), (15, 1), (16, 1)],
  term ((-373787112386234 : Rat) / 3488340663459579) [(3, 2), (9, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 298 for generator 16. -/
theorem ep_Q2_024_partial_16_0298_valid :
    mulPoly ep_Q2_024_coefficient_16_0298
        ep_Q2_024_generator_16_0200_0299 =
      ep_Q2_024_partial_16_0298 := by
  native_decide

/-- Coefficient term 299 from coefficient polynomial 16. -/
def ep_Q2_024_coefficient_16_0299 : Poly :=
[
  term ((31556266093234973165652571965850210528 : Rat) / 599854728701238648283346764014769633995) [(9, 4)]
]

/-- Partial product 299 for generator 16. -/
def ep_Q2_024_partial_16_0299 : Poly :=
[
  term ((63112532186469946331305143931700421056 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (6, 1), (9, 4)],
  term ((-31556266093234973165652571965850210528 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (9, 4)],
  term ((63112532186469946331305143931700421056 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (7, 1), (9, 4)],
  term ((-31556266093234973165652571965850210528 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (9, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 299 for generator 16. -/
theorem ep_Q2_024_partial_16_0299_valid :
    mulPoly ep_Q2_024_coefficient_16_0299
        ep_Q2_024_generator_16_0200_0299 =
      ep_Q2_024_partial_16_0299 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_024_partials_16_0200_0299 : List Poly :=
[
  ep_Q2_024_partial_16_0200,
  ep_Q2_024_partial_16_0201,
  ep_Q2_024_partial_16_0202,
  ep_Q2_024_partial_16_0203,
  ep_Q2_024_partial_16_0204,
  ep_Q2_024_partial_16_0205,
  ep_Q2_024_partial_16_0206,
  ep_Q2_024_partial_16_0207,
  ep_Q2_024_partial_16_0208,
  ep_Q2_024_partial_16_0209,
  ep_Q2_024_partial_16_0210,
  ep_Q2_024_partial_16_0211,
  ep_Q2_024_partial_16_0212,
  ep_Q2_024_partial_16_0213,
  ep_Q2_024_partial_16_0214,
  ep_Q2_024_partial_16_0215,
  ep_Q2_024_partial_16_0216,
  ep_Q2_024_partial_16_0217,
  ep_Q2_024_partial_16_0218,
  ep_Q2_024_partial_16_0219,
  ep_Q2_024_partial_16_0220,
  ep_Q2_024_partial_16_0221,
  ep_Q2_024_partial_16_0222,
  ep_Q2_024_partial_16_0223,
  ep_Q2_024_partial_16_0224,
  ep_Q2_024_partial_16_0225,
  ep_Q2_024_partial_16_0226,
  ep_Q2_024_partial_16_0227,
  ep_Q2_024_partial_16_0228,
  ep_Q2_024_partial_16_0229,
  ep_Q2_024_partial_16_0230,
  ep_Q2_024_partial_16_0231,
  ep_Q2_024_partial_16_0232,
  ep_Q2_024_partial_16_0233,
  ep_Q2_024_partial_16_0234,
  ep_Q2_024_partial_16_0235,
  ep_Q2_024_partial_16_0236,
  ep_Q2_024_partial_16_0237,
  ep_Q2_024_partial_16_0238,
  ep_Q2_024_partial_16_0239,
  ep_Q2_024_partial_16_0240,
  ep_Q2_024_partial_16_0241,
  ep_Q2_024_partial_16_0242,
  ep_Q2_024_partial_16_0243,
  ep_Q2_024_partial_16_0244,
  ep_Q2_024_partial_16_0245,
  ep_Q2_024_partial_16_0246,
  ep_Q2_024_partial_16_0247,
  ep_Q2_024_partial_16_0248,
  ep_Q2_024_partial_16_0249,
  ep_Q2_024_partial_16_0250,
  ep_Q2_024_partial_16_0251,
  ep_Q2_024_partial_16_0252,
  ep_Q2_024_partial_16_0253,
  ep_Q2_024_partial_16_0254,
  ep_Q2_024_partial_16_0255,
  ep_Q2_024_partial_16_0256,
  ep_Q2_024_partial_16_0257,
  ep_Q2_024_partial_16_0258,
  ep_Q2_024_partial_16_0259,
  ep_Q2_024_partial_16_0260,
  ep_Q2_024_partial_16_0261,
  ep_Q2_024_partial_16_0262,
  ep_Q2_024_partial_16_0263,
  ep_Q2_024_partial_16_0264,
  ep_Q2_024_partial_16_0265,
  ep_Q2_024_partial_16_0266,
  ep_Q2_024_partial_16_0267,
  ep_Q2_024_partial_16_0268,
  ep_Q2_024_partial_16_0269,
  ep_Q2_024_partial_16_0270,
  ep_Q2_024_partial_16_0271,
  ep_Q2_024_partial_16_0272,
  ep_Q2_024_partial_16_0273,
  ep_Q2_024_partial_16_0274,
  ep_Q2_024_partial_16_0275,
  ep_Q2_024_partial_16_0276,
  ep_Q2_024_partial_16_0277,
  ep_Q2_024_partial_16_0278,
  ep_Q2_024_partial_16_0279,
  ep_Q2_024_partial_16_0280,
  ep_Q2_024_partial_16_0281,
  ep_Q2_024_partial_16_0282,
  ep_Q2_024_partial_16_0283,
  ep_Q2_024_partial_16_0284,
  ep_Q2_024_partial_16_0285,
  ep_Q2_024_partial_16_0286,
  ep_Q2_024_partial_16_0287,
  ep_Q2_024_partial_16_0288,
  ep_Q2_024_partial_16_0289,
  ep_Q2_024_partial_16_0290,
  ep_Q2_024_partial_16_0291,
  ep_Q2_024_partial_16_0292,
  ep_Q2_024_partial_16_0293,
  ep_Q2_024_partial_16_0294,
  ep_Q2_024_partial_16_0295,
  ep_Q2_024_partial_16_0296,
  ep_Q2_024_partial_16_0297,
  ep_Q2_024_partial_16_0298,
  ep_Q2_024_partial_16_0299
]

/-- Sum of partial products in this block. -/
def ep_Q2_024_block_16_0200_0299 : Poly :=
[
  term ((-7759264811909560211001454971980340404782693318416613656 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 1), (5, 1), (6, 1), (9, 1), (13, 1), (15, 1)],
  term ((301322371177440 : Rat) / 1162780221153193) [(2, 1), (5, 1), (6, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((161891712224135268464196480124956186688 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (5, 1), (6, 1), (9, 1), (13, 2)],
  term ((35684606111448167526237422423713566304 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (5, 1), (6, 1), (9, 1), (14, 1)],
  term ((4117990957949684142911069834344890222153186863115113096 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 1), (5, 1), (6, 1), (9, 1), (15, 2)],
  term ((-667421698448032 : Rat) / 1162780221153193) [(2, 1), (5, 1), (6, 1), (9, 1), (15, 2), (16, 1)],
  term ((872471536578682473934843701987403216864 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (5, 1), (6, 1), (9, 2), (13, 1)],
  term ((-8277343570613335672384479890843411017323954299080598476 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 1), (5, 1), (6, 1), (9, 2), (15, 1)],
  term ((11769126792358832 : Rat) / 3488340663459579) [(2, 1), (5, 1), (6, 1), (9, 2), (15, 1), (16, 1)],
  term ((740459402608742547232254124143828483824 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (5, 1), (6, 1), (9, 3)],
  term ((162581289110875208897651846606192622192 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (5, 1), (6, 1), (12, 1), (13, 1)],
  term ((841370064793335292522429127601806091814441540587938077 : Rat) / 139499842819802972775716014625439884620101963487119207) [(2, 1), (5, 1), (6, 1), (12, 1), (15, 1)],
  term ((-3760192223396204 : Rat) / 1162780221153193) [(2, 1), (5, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-469901564276901542929836828606721083424 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (5, 1), (6, 1), (13, 1)],
  term ((80847520729037969680300637131535002544 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (5, 1), (6, 1), (13, 1), (14, 1)],
  term ((-855435513563815829845781257791179841343003020204599854 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 1), (5, 1), (6, 1), (14, 1), (15, 1)],
  term ((-282272129817592 : Rat) / 1162780221153193) [(2, 1), (5, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1395367882291219773749009470590983002070566030055428683 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 1), (5, 1), (6, 1), (15, 1)],
  term ((3760192223396204 : Rat) / 1162780221153193) [(2, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-80880299190047857864233171441849366144 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (5, 2), (6, 1), (9, 1), (13, 1)],
  term ((4347249035505462526858846771514645871341141380863831296 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 1), (5, 2), (6, 1), (9, 1), (15, 1)],
  term ((413883074046464 : Rat) / 1162780221153193) [(2, 1), (5, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-67563934515587234973630412146306275392 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (5, 2), (6, 1), (9, 2)],
  term ((-1652695128300478652375073904873736949728 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (6, 1), (7, 1), (8, 1), (9, 1)],
  term ((1652695128300478652375073904873736949728 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (6, 1), (7, 1), (8, 1), (13, 1)],
  term ((-582239080758422230791390829910479845146 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (6, 1), (7, 1), (9, 1)],
  term ((2673812610292750034558226659874575517788 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (6, 1), (7, 1), (9, 1), (12, 1)],
  term ((66547862040521339861322380022048721344 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (6, 1), (7, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((-397491232950237887996184205565539271127191104441069376 : Rat) / 46499947606600990925238671541813294873367321162373069) [(2, 1), (6, 1), (7, 1), (9, 1), (12, 1), (15, 2)],
  term ((3163264603646592 : Rat) / 1162780221153193) [(2, 1), (6, 1), (7, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-51824669101602076868988473170378041883354520582692522331 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(2, 1), (6, 1), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((-3374627121101630 : Rat) / 1162780221153193) [(2, 1), (6, 1), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1125550783544139198314360250867824235848 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (6, 1), (7, 1), (9, 1), (13, 2)],
  term ((-1406005400822790479278021862241020525186 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (6, 1), (7, 1), (9, 1), (14, 1)],
  term ((11054165036071785399365776736060685613928533689685750087 : Rat) / 92999895213201981850477343083626589746734642324746138) [(2, 1), (6, 1), (7, 1), (9, 1), (15, 2)],
  term ((-4227179677649766 : Rat) / 1162780221153193) [(2, 1), (6, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((15162269307229276594898497776806834848 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (6, 1), (7, 1), (9, 2), (13, 1)],
  term ((-6117088134986307917740122211961773302290741365461673651 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 1), (6, 1), (7, 1), (9, 2), (15, 1)],
  term ((3737871123862340 : Rat) / 1162780221153193) [(2, 1), (6, 1), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((63112532186469946331305143931700421056 : Rat) / 39990315246749243218889784267651308933) [(2, 1), (6, 1), (7, 1), (9, 3)],
  term ((-27195947332416181304272310472629851492 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (6, 1), (7, 1), (12, 1), (13, 1)],
  term ((397491232950237887996184205565539271127191104441069376 : Rat) / 46499947606600990925238671541813294873367321162373069) [(2, 1), (6, 1), (7, 1), (12, 1), (13, 1), (15, 2)],
  term ((-3163264603646592 : Rat) / 1162780221153193) [(2, 1), (6, 1), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-66547862040521339861322380022048721344 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (6, 1), (7, 1), (12, 1), (13, 2), (15, 1)],
  term ((-7361797039595291049606458569276731235884520907461058105 : Rat) / 139499842819802972775716014625439884620101963487119207) [(2, 1), (6, 1), (7, 1), (12, 1), (15, 1)],
  term ((-14271756663375548 : Rat) / 1162780221153193) [(2, 1), (6, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((99588034536269143179180521288457931024 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (6, 1), (7, 1), (12, 2), (13, 1)],
  term ((-183488243113488394739718246684116996552696960175428317 : Rat) / 46499947606600990925238671541813294873367321162373069) [(2, 1), (6, 1), (7, 1), (12, 2), (15, 1)],
  term ((868923361052644 : Rat) / 1162780221153193) [(2, 1), (6, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((-426552385672952401303902673200727460114 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (6, 1), (7, 1), (13, 1)],
  term ((1464531549368259322201956110534190859426 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (6, 1), (7, 1), (13, 1), (14, 1)],
  term ((-11054165036071785399365776736060685613928533689685750087 : Rat) / 92999895213201981850477343083626589746734642324746138) [(2, 1), (6, 1), (7, 1), (13, 1), (15, 2)],
  term ((4227179677649766 : Rat) / 1162780221153193) [(2, 1), (6, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((64058845371574692704468717594301588487936003313615869633 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(2, 1), (6, 1), (7, 1), (13, 2), (15, 1)],
  term ((-363244002760710 : Rat) / 1162780221153193) [(2, 1), (6, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-48571238861349145578694374759784602712 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (6, 1), (7, 1), (13, 3)],
  term ((1394833103216049324805768383943433850561917589737731747 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(2, 1), (6, 1), (7, 1), (14, 1), (15, 1)],
  term ((-1859524334402002 : Rat) / 1162780221153193) [(2, 1), (6, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((7927195666314199722503393139576614669726528195562845696 : Rat) / 139499842819802972775716014625439884620101963487119207) [(2, 1), (6, 1), (7, 1), (15, 1)],
  term ((13402833302322904 : Rat) / 1162780221153193) [(2, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((826347564150239326187536952436868474864 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (6, 1), (8, 1)],
  term ((49794017268134571589590260644228965512 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (6, 1), (8, 1), (9, 1), (12, 1), (13, 1)],
  term ((-550464729340465184219154740052350989658090880526284951 : Rat) / 92999895213201981850477343083626589746734642324746138) [(2, 1), (6, 1), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((1303385041578966 : Rat) / 1162780221153193) [(2, 1), (6, 1), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((1911336534746933172836945834170702757888 : Rat) / 1799564186103715944850040292044308901985) [(2, 1), (6, 1), (8, 1), (9, 1), (13, 1)],
  term ((112367354585249277159269751704270049391015638612863684701 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(2, 1), (6, 1), (8, 1), (9, 1), (15, 1)],
  term ((-10199593906176821 : Rat) / 3488340663459579) [(2, 1), (6, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-2962936355012834358063570170950069471136 : Rat) / 1799564186103715944850040292044308901985) [(2, 1), (6, 1), (8, 1), (9, 2)],
  term ((-826347564150239326187536952436868474864 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (6, 1), (8, 1), (12, 1)],
  term ((550464729340465184219154740052350989658090880526284951 : Rat) / 92999895213201981850477343083626589746734642324746138) [(2, 1), (6, 1), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((-1303385041578966 : Rat) / 1162780221153193) [(2, 1), (6, 1), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-49794017268134571589590260644228965512 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (6, 1), (8, 1), (12, 1), (13, 2)],
  term ((-112367354585249277159269751704270049391015638612863684701 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(2, 1), (6, 1), (8, 1), (13, 1), (15, 1)],
  term ((10199593906176821 : Rat) / 3488340663459579) [(2, 1), (6, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-120219061606915493429689913618874047296 : Rat) / 359912837220743188970008058408861780397) [(2, 1), (6, 1), (8, 1), (13, 2)],
  term ((1639031368965265510066893702146248821268 : Rat) / 1799564186103715944850040292044308901985) [(2, 1), (6, 1), (9, 1), (12, 1), (13, 1)],
  term ((-35538863163306260263364324695043568543574204480893638831 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 1), (6, 1), (9, 1), (12, 1), (15, 1)],
  term ((19757855097586940 : Rat) / 3488340663459579) [(2, 1), (6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-49794017268134571589590260644228965512 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (6, 1), (9, 1), (12, 2), (13, 1)],
  term ((550464729340465184219154740052350989658090880526284951 : Rat) / 92999895213201981850477343083626589746734642324746138) [(2, 1), (6, 1), (9, 1), (12, 2), (15, 1)],
  term ((-1303385041578966 : Rat) / 1162780221153193) [(2, 1), (6, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((1611898716001592699826253104060840185864 : Rat) / 1799564186103715944850040292044308901985) [(2, 1), (6, 1), (9, 1), (13, 1)],
  term ((161255564181358546228795754662561926992 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (6, 1), (9, 1), (13, 1), (14, 1)],
  term ((272594809814001542933094722250079094468097718750174307369 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(2, 1), (6, 1), (9, 1), (15, 1)],
  term ((-30681801572986753 : Rat) / 6976681326919158) [(2, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-4775253923879975021345279813095463719286 : Rat) / 1079738511662229566910024175226585341191) [(2, 1), (6, 1), (9, 2)],
  term ((146038114512082973054030703332320809868 : Rat) / 119970945740247729656669352802953926799) [(2, 1), (6, 1), (9, 2), (12, 1)],
  term ((22182620680173779953774126674016240448 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (6, 1), (9, 2), (12, 1), (13, 1), (15, 1)],
  term ((-397491232950237887996184205565539271127191104441069376 : Rat) / 139499842819802972775716014625439884620101963487119207) [(2, 1), (6, 1), (9, 2), (12, 1), (15, 2)],
  term ((1054421534548864 : Rat) / 1162780221153193) [(2, 1), (6, 1), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((-1269228168809522245699254430788175009060618502683481501 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(2, 1), (6, 1), (9, 2), (13, 1), (15, 1)],
  term ((-10189292534136530 : Rat) / 3488340663459579) [(2, 1), (6, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((1630777755163885684817882807067116287352 : Rat) / 1799564186103715944850040292044308901985) [(2, 1), (6, 1), (9, 2), (13, 2)],
  term ((-254235174577019432502708099503663666722 : Rat) / 359912837220743188970008058408861780397) [(2, 1), (6, 1), (9, 2), (14, 1)],
  term ((-289873507268913191523518837135133871483600695335134711471 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(2, 1), (6, 1), (9, 2), (15, 2)],
  term ((33713827469996522 : Rat) / 3488340663459579) [(2, 1), (6, 1), (9, 2), (15, 2), (16, 1)],
  term ((161399519464706334186086051021639964736 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (6, 1), (9, 3), (13, 1)],
  term ((225792246667296571754346172666409042645220020210494517 : Rat) / 418499528459408918327148043876319653860305890461357621) [(2, 1), (6, 1), (9, 3), (15, 1)],
  term ((747574224772468 : Rat) / 3488340663459579) [(2, 1), (6, 1), (9, 3), (15, 1), (16, 1)],
  term ((63112532186469946331305143931700421056 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (6, 1), (9, 4)],
  term ((3879632405954780105500727485990170202391346659208306828 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 2), (5, 1), (9, 1), (13, 1), (15, 1)],
  term ((-150661185588720 : Rat) / 1162780221153193) [(2, 2), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-80945856112067634232098240062478093344 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (5, 1), (9, 1), (13, 2)],
  term ((-17842303055724083763118711211856783152 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (5, 1), (9, 1), (14, 1)],
  term ((-2058995478974842071455534917172445111076593431557556548 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 2), (5, 1), (9, 1), (15, 2)],
  term ((333710849224016 : Rat) / 1162780221153193) [(2, 2), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((-436235768289341236967421850993701608432 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (5, 1), (9, 2), (13, 1)],
  term ((4138671785306667836192239945421705508661977149540299238 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 2), (5, 1), (9, 2), (15, 1)],
  term ((-5884563396179416 : Rat) / 3488340663459579) [(2, 2), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((-370229701304371273616127062071914241912 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (5, 1), (9, 3)],
  term ((-81290644555437604448825923303096311096 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (5, 1), (12, 1), (13, 1)],
  term ((-841370064793335292522429127601806091814441540587938077 : Rat) / 278999685639605945551432029250879769240203926974238414) [(2, 2), (5, 1), (12, 1), (15, 1)],
  term ((1880096111698102 : Rat) / 1162780221153193) [(2, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((234950782138450771464918414303360541712 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (5, 1), (13, 1)],
  term ((-40423760364518984840150318565767501272 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (5, 1), (13, 1), (14, 1)],
  term ((427717756781907914922890628895589920671501510102299927 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 2), (5, 1), (14, 1), (15, 1)],
  term ((141136064908796 : Rat) / 1162780221153193) [(2, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((1395367882291219773749009470590983002070566030055428683 : Rat) / 464999476066009909252386715418132948733673211623730690) [(2, 2), (5, 1), (15, 1)],
  term ((-1880096111698102 : Rat) / 1162780221153193) [(2, 2), (5, 1), (15, 1), (16, 1)],
  term ((40440149595023928932116585720924683072 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (5, 2), (9, 1), (13, 1)],
  term ((-2173624517752731263429423385757322935670570690431915648 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 2), (5, 2), (9, 1), (15, 1)],
  term ((-206941537023232 : Rat) / 1162780221153193) [(2, 2), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((33781967257793617486815206073153137696 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (5, 2), (9, 2)],
  term ((826347564150239326187536952436868474864 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (7, 1), (8, 1), (9, 1)],
  term ((-826347564150239326187536952436868474864 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (7, 1), (8, 1), (13, 1)],
  term ((291119540379211115395695414955239922573 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (7, 1), (9, 1)],
  term ((-1336906305146375017279113329937287758894 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (7, 1), (9, 1), (12, 1)],
  term ((-33273931020260669930661190011024360672 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (7, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((198745616475118943998092102782769635563595552220534688 : Rat) / 46499947606600990925238671541813294873367321162373069) [(2, 2), (7, 1), (9, 1), (12, 1), (15, 2)],
  term ((-1581632301823296 : Rat) / 1162780221153193) [(2, 2), (7, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((51824669101602076868988473170378041883354520582692522331 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(2, 2), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((1687313560550815 : Rat) / 1162780221153193) [(2, 2), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((562775391772069599157180125433912117924 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (7, 1), (9, 1), (13, 2)],
  term ((703002700411395239639010931120510262593 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (7, 1), (9, 1), (14, 1)],
  term ((-11054165036071785399365776736060685613928533689685750087 : Rat) / 185999790426403963700954686167253179493469284649492276) [(2, 2), (7, 1), (9, 1), (15, 2)],
  term ((2113589838824883 : Rat) / 1162780221153193) [(2, 2), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((-7581134653614638297449248888403417424 : Rat) / 39990315246749243218889784267651308933) [(2, 2), (7, 1), (9, 2), (13, 1)],
  term ((6117088134986307917740122211961773302290741365461673651 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(2, 2), (7, 1), (9, 2), (15, 1)],
  term ((-1868935561931170 : Rat) / 1162780221153193) [(2, 2), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((-31556266093234973165652571965850210528 : Rat) / 39990315246749243218889784267651308933) [(2, 2), (7, 1), (9, 3)],
  term ((13597973666208090652136155236314925746 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (7, 1), (12, 1), (13, 1)],
  term ((-198745616475118943998092102782769635563595552220534688 : Rat) / 46499947606600990925238671541813294873367321162373069) [(2, 2), (7, 1), (12, 1), (13, 1), (15, 2)],
  term ((1581632301823296 : Rat) / 1162780221153193) [(2, 2), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((33273931020260669930661190011024360672 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (7, 1), (12, 1), (13, 2), (15, 1)],
  term ((7361797039595291049606458569276731235884520907461058105 : Rat) / 278999685639605945551432029250879769240203926974238414) [(2, 2), (7, 1), (12, 1), (15, 1)],
  term ((7135878331687774 : Rat) / 1162780221153193) [(2, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-49794017268134571589590260644228965512 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (7, 1), (12, 2), (13, 1)],
  term ((183488243113488394739718246684116996552696960175428317 : Rat) / 92999895213201981850477343083626589746734642324746138) [(2, 2), (7, 1), (12, 2), (15, 1)],
  term ((-434461680526322 : Rat) / 1162780221153193) [(2, 2), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((213276192836476200651951336600363730057 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (7, 1), (13, 1)],
  term ((-732265774684129661100978055267095429713 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (7, 1), (13, 1), (14, 1)],
  term ((11054165036071785399365776736060685613928533689685750087 : Rat) / 185999790426403963700954686167253179493469284649492276) [(2, 2), (7, 1), (13, 1), (15, 2)],
  term ((-2113589838824883 : Rat) / 1162780221153193) [(2, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-64058845371574692704468717594301588487936003313615869633 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(2, 2), (7, 1), (13, 2), (15, 1)],
  term ((181622001380355 : Rat) / 1162780221153193) [(2, 2), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((24285619430674572789347187379892301356 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (7, 1), (13, 3)],
  term ((-1394833103216049324805768383943433850561917589737731747 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(2, 2), (7, 1), (14, 1), (15, 1)],
  term ((929762167201001 : Rat) / 1162780221153193) [(2, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3963597833157099861251696569788307334863264097781422848 : Rat) / 139499842819802972775716014625439884620101963487119207) [(2, 2), (7, 1), (15, 1)],
  term ((-6701416651161452 : Rat) / 1162780221153193) [(2, 2), (7, 1), (15, 1), (16, 1)],
  term ((-413173782075119663093768476218434237432 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (8, 1)],
  term ((-24897008634067285794795130322114482756 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (8, 1), (9, 1), (12, 1), (13, 1)],
  term ((550464729340465184219154740052350989658090880526284951 : Rat) / 185999790426403963700954686167253179493469284649492276) [(2, 2), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((-651692520789483 : Rat) / 1162780221153193) [(2, 2), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-955668267373466586418472917085351378944 : Rat) / 1799564186103715944850040292044308901985) [(2, 2), (8, 1), (9, 1), (13, 1)],
  term ((-112367354585249277159269751704270049391015638612863684701 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(2, 2), (8, 1), (9, 1), (15, 1)],
  term ((10199593906176821 : Rat) / 6976681326919158) [(2, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((1481468177506417179031785085475034735568 : Rat) / 1799564186103715944850040292044308901985) [(2, 2), (8, 1), (9, 2)],
  term ((413173782075119663093768476218434237432 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (8, 1), (12, 1)],
  term ((-550464729340465184219154740052350989658090880526284951 : Rat) / 185999790426403963700954686167253179493469284649492276) [(2, 2), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((651692520789483 : Rat) / 1162780221153193) [(2, 2), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((24897008634067285794795130322114482756 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (8, 1), (12, 1), (13, 2)],
  term ((112367354585249277159269751704270049391015638612863684701 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(2, 2), (8, 1), (13, 1), (15, 1)],
  term ((-10199593906176821 : Rat) / 6976681326919158) [(2, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((60109530803457746714844956809437023648 : Rat) / 359912837220743188970008058408861780397) [(2, 2), (8, 1), (13, 2)],
  term ((-819515684482632755033446851073124410634 : Rat) / 1799564186103715944850040292044308901985) [(2, 2), (9, 1), (12, 1), (13, 1)],
  term ((35538863163306260263364324695043568543574204480893638831 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(2, 2), (9, 1), (12, 1), (15, 1)],
  term ((-9878927548793470 : Rat) / 3488340663459579) [(2, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((24897008634067285794795130322114482756 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (9, 1), (12, 2), (13, 1)],
  term ((-550464729340465184219154740052350989658090880526284951 : Rat) / 185999790426403963700954686167253179493469284649492276) [(2, 2), (9, 1), (12, 2), (15, 1)],
  term ((651692520789483 : Rat) / 1162780221153193) [(2, 2), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-805949358000796349913126552030420092932 : Rat) / 1799564186103715944850040292044308901985) [(2, 2), (9, 1), (13, 1)],
  term ((-80627782090679273114397877331280963496 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (9, 1), (13, 1), (14, 1)],
  term ((-272594809814001542933094722250079094468097718750174307369 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(2, 2), (9, 1), (15, 1)],
  term ((30681801572986753 : Rat) / 13953362653838316) [(2, 2), (9, 1), (15, 1), (16, 1)],
  term ((2387626961939987510672639906547731859643 : Rat) / 1079738511662229566910024175226585341191) [(2, 2), (9, 2)],
  term ((-73019057256041486527015351666160404934 : Rat) / 119970945740247729656669352802953926799) [(2, 2), (9, 2), (12, 1)],
  term ((-11091310340086889976887063337008120224 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (9, 2), (12, 1), (13, 1), (15, 1)],
  term ((198745616475118943998092102782769635563595552220534688 : Rat) / 139499842819802972775716014625439884620101963487119207) [(2, 2), (9, 2), (12, 1), (15, 2)],
  term ((-527210767274432 : Rat) / 1162780221153193) [(2, 2), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((1269228168809522245699254430788175009060618502683481501 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(2, 2), (9, 2), (13, 1), (15, 1)],
  term ((5094646267068265 : Rat) / 3488340663459579) [(2, 2), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-815388877581942842408941403533558143676 : Rat) / 1799564186103715944850040292044308901985) [(2, 2), (9, 2), (13, 2)],
  term ((127117587288509716251354049751831833361 : Rat) / 359912837220743188970008058408861780397) [(2, 2), (9, 2), (14, 1)],
  term ((289873507268913191523518837135133871483600695335134711471 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(2, 2), (9, 2), (15, 2)],
  term ((-16856913734998261 : Rat) / 3488340663459579) [(2, 2), (9, 2), (15, 2), (16, 1)],
  term ((-80699759732353167093043025510819982368 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (9, 3), (13, 1)],
  term ((-225792246667296571754346172666409042645220020210494517 : Rat) / 836999056918817836654296087752639307720611780922715242) [(2, 2), (9, 3), (15, 1)],
  term ((-373787112386234 : Rat) / 3488340663459579) [(2, 2), (9, 3), (15, 1), (16, 1)],
  term ((-31556266093234973165652571965850210528 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (9, 4)],
  term ((-7759264811909560211001454971980340404782693318416613656 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (5, 1), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((301322371177440 : Rat) / 1162780221153193) [(3, 1), (5, 1), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((161891712224135268464196480124956186688 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (5, 1), (7, 1), (9, 1), (13, 2)],
  term ((35684606111448167526237422423713566304 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (7, 1), (9, 1), (14, 1)],
  term ((4117990957949684142911069834344890222153186863115113096 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (5, 1), (7, 1), (9, 1), (15, 2)],
  term ((-667421698448032 : Rat) / 1162780221153193) [(3, 1), (5, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((872471536578682473934843701987403216864 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (5, 1), (7, 1), (9, 2), (13, 1)],
  term ((-8277343570613335672384479890843411017323954299080598476 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (5, 1), (7, 1), (9, 2), (15, 1)],
  term ((11769126792358832 : Rat) / 3488340663459579) [(3, 1), (5, 1), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((740459402608742547232254124143828483824 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (5, 1), (7, 1), (9, 3)],
  term ((162581289110875208897651846606192622192 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (7, 1), (12, 1), (13, 1)],
  term ((841370064793335292522429127601806091814441540587938077 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 1), (5, 1), (7, 1), (12, 1), (15, 1)],
  term ((-3760192223396204 : Rat) / 1162780221153193) [(3, 1), (5, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-469901564276901542929836828606721083424 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (5, 1), (7, 1), (13, 1)],
  term ((80847520729037969680300637131535002544 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (5, 1), (7, 1), (13, 1), (14, 1)],
  term ((-855435513563815829845781257791179841343003020204599854 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (5, 1), (7, 1), (14, 1), (15, 1)],
  term ((-282272129817592 : Rat) / 1162780221153193) [(3, 1), (5, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1395367882291219773749009470590983002070566030055428683 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (5, 1), (7, 1), (15, 1)],
  term ((3760192223396204 : Rat) / 1162780221153193) [(3, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-80880299190047857864233171441849366144 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 2), (7, 1), (9, 1), (13, 1)],
  term ((4347249035505462526858846771514645871341141380863831296 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (5, 2), (7, 1), (9, 1), (15, 1)],
  term ((413883074046464 : Rat) / 1162780221153193) [(3, 1), (5, 2), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-67563934515587234973630412146306275392 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 2), (7, 1), (9, 2)],
  term ((826347564150239326187536952436868474864 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (7, 1), (8, 1)],
  term ((49794017268134571589590260644228965512 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (7, 1), (8, 1), (9, 1), (12, 1), (13, 1)],
  term ((-550464729340465184219154740052350989658090880526284951 : Rat) / 92999895213201981850477343083626589746734642324746138) [(3, 1), (7, 1), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((1303385041578966 : Rat) / 1162780221153193) [(3, 1), (7, 1), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((1911336534746933172836945834170702757888 : Rat) / 1799564186103715944850040292044308901985) [(3, 1), (7, 1), (8, 1), (9, 1), (13, 1)],
  term ((112367354585249277159269751704270049391015638612863684701 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(3, 1), (7, 1), (8, 1), (9, 1), (15, 1)],
  term ((-10199593906176821 : Rat) / 3488340663459579) [(3, 1), (7, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-2962936355012834358063570170950069471136 : Rat) / 1799564186103715944850040292044308901985) [(3, 1), (7, 1), (8, 1), (9, 2)],
  term ((-826347564150239326187536952436868474864 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (7, 1), (8, 1), (12, 1)],
  term ((550464729340465184219154740052350989658090880526284951 : Rat) / 92999895213201981850477343083626589746734642324746138) [(3, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((-1303385041578966 : Rat) / 1162780221153193) [(3, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-49794017268134571589590260644228965512 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (7, 1), (8, 1), (12, 1), (13, 2)],
  term ((-112367354585249277159269751704270049391015638612863684701 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(3, 1), (7, 1), (8, 1), (13, 1), (15, 1)],
  term ((10199593906176821 : Rat) / 3488340663459579) [(3, 1), (7, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-120219061606915493429689913618874047296 : Rat) / 359912837220743188970008058408861780397) [(3, 1), (7, 1), (8, 1), (13, 2)],
  term ((1639031368965265510066893702146248821268 : Rat) / 1799564186103715944850040292044308901985) [(3, 1), (7, 1), (9, 1), (12, 1), (13, 1)],
  term ((-35538863163306260263364324695043568543574204480893638831 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (7, 1), (9, 1), (12, 1), (15, 1)],
  term ((19757855097586940 : Rat) / 3488340663459579) [(3, 1), (7, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-49794017268134571589590260644228965512 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (7, 1), (9, 1), (12, 2), (13, 1)],
  term ((550464729340465184219154740052350989658090880526284951 : Rat) / 92999895213201981850477343083626589746734642324746138) [(3, 1), (7, 1), (9, 1), (12, 2), (15, 1)],
  term ((-1303385041578966 : Rat) / 1162780221153193) [(3, 1), (7, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((1611898716001592699826253104060840185864 : Rat) / 1799564186103715944850040292044308901985) [(3, 1), (7, 1), (9, 1), (13, 1)],
  term ((161255564181358546228795754662561926992 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (7, 1), (9, 1), (13, 1), (14, 1)],
  term ((272594809814001542933094722250079094468097718750174307369 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(3, 1), (7, 1), (9, 1), (15, 1)],
  term ((-30681801572986753 : Rat) / 6976681326919158) [(3, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-4775253923879975021345279813095463719286 : Rat) / 1079738511662229566910024175226585341191) [(3, 1), (7, 1), (9, 2)],
  term ((146038114512082973054030703332320809868 : Rat) / 119970945740247729656669352802953926799) [(3, 1), (7, 1), (9, 2), (12, 1)],
  term ((22182620680173779953774126674016240448 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (7, 1), (9, 2), (12, 1), (13, 1), (15, 1)],
  term ((-397491232950237887996184205565539271127191104441069376 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 1), (7, 1), (9, 2), (12, 1), (15, 2)],
  term ((1054421534548864 : Rat) / 1162780221153193) [(3, 1), (7, 1), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((-1269228168809522245699254430788175009060618502683481501 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(3, 1), (7, 1), (9, 2), (13, 1), (15, 1)],
  term ((-10189292534136530 : Rat) / 3488340663459579) [(3, 1), (7, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((1630777755163885684817882807067116287352 : Rat) / 1799564186103715944850040292044308901985) [(3, 1), (7, 1), (9, 2), (13, 2)],
  term ((-254235174577019432502708099503663666722 : Rat) / 359912837220743188970008058408861780397) [(3, 1), (7, 1), (9, 2), (14, 1)],
  term ((-289873507268913191523518837135133871483600695335134711471 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(3, 1), (7, 1), (9, 2), (15, 2)],
  term ((33713827469996522 : Rat) / 3488340663459579) [(3, 1), (7, 1), (9, 2), (15, 2), (16, 1)],
  term ((161399519464706334186086051021639964736 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (7, 1), (9, 3), (13, 1)],
  term ((225792246667296571754346172666409042645220020210494517 : Rat) / 418499528459408918327148043876319653860305890461357621) [(3, 1), (7, 1), (9, 3), (15, 1)],
  term ((747574224772468 : Rat) / 3488340663459579) [(3, 1), (7, 1), (9, 3), (15, 1), (16, 1)],
  term ((63112532186469946331305143931700421056 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (7, 1), (9, 4)],
  term ((-1652695128300478652375073904873736949728 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (7, 2), (8, 1), (9, 1)],
  term ((1652695128300478652375073904873736949728 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (7, 2), (8, 1), (13, 1)],
  term ((-582239080758422230791390829910479845146 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (7, 2), (9, 1)],
  term ((2673812610292750034558226659874575517788 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (7, 2), (9, 1), (12, 1)],
  term ((66547862040521339861322380022048721344 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (7, 2), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((-397491232950237887996184205565539271127191104441069376 : Rat) / 46499947606600990925238671541813294873367321162373069) [(3, 1), (7, 2), (9, 1), (12, 1), (15, 2)],
  term ((3163264603646592 : Rat) / 1162780221153193) [(3, 1), (7, 2), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-51824669101602076868988473170378041883354520582692522331 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(3, 1), (7, 2), (9, 1), (13, 1), (15, 1)],
  term ((-3374627121101630 : Rat) / 1162780221153193) [(3, 1), (7, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1125550783544139198314360250867824235848 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (7, 2), (9, 1), (13, 2)],
  term ((-1406005400822790479278021862241020525186 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (7, 2), (9, 1), (14, 1)],
  term ((11054165036071785399365776736060685613928533689685750087 : Rat) / 92999895213201981850477343083626589746734642324746138) [(3, 1), (7, 2), (9, 1), (15, 2)],
  term ((-4227179677649766 : Rat) / 1162780221153193) [(3, 1), (7, 2), (9, 1), (15, 2), (16, 1)],
  term ((15162269307229276594898497776806834848 : Rat) / 39990315246749243218889784267651308933) [(3, 1), (7, 2), (9, 2), (13, 1)],
  term ((-6117088134986307917740122211961773302290741365461673651 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (7, 2), (9, 2), (15, 1)],
  term ((3737871123862340 : Rat) / 1162780221153193) [(3, 1), (7, 2), (9, 2), (15, 1), (16, 1)],
  term ((63112532186469946331305143931700421056 : Rat) / 39990315246749243218889784267651308933) [(3, 1), (7, 2), (9, 3)],
  term ((-27195947332416181304272310472629851492 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (7, 2), (12, 1), (13, 1)],
  term ((397491232950237887996184205565539271127191104441069376 : Rat) / 46499947606600990925238671541813294873367321162373069) [(3, 1), (7, 2), (12, 1), (13, 1), (15, 2)],
  term ((-3163264603646592 : Rat) / 1162780221153193) [(3, 1), (7, 2), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-66547862040521339861322380022048721344 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (7, 2), (12, 1), (13, 2), (15, 1)],
  term ((-7361797039595291049606458569276731235884520907461058105 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 1), (7, 2), (12, 1), (15, 1)],
  term ((-14271756663375548 : Rat) / 1162780221153193) [(3, 1), (7, 2), (12, 1), (15, 1), (16, 1)],
  term ((99588034536269143179180521288457931024 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (7, 2), (12, 2), (13, 1)],
  term ((-183488243113488394739718246684116996552696960175428317 : Rat) / 46499947606600990925238671541813294873367321162373069) [(3, 1), (7, 2), (12, 2), (15, 1)],
  term ((868923361052644 : Rat) / 1162780221153193) [(3, 1), (7, 2), (12, 2), (15, 1), (16, 1)],
  term ((-426552385672952401303902673200727460114 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (7, 2), (13, 1)],
  term ((1464531549368259322201956110534190859426 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (7, 2), (13, 1), (14, 1)],
  term ((-11054165036071785399365776736060685613928533689685750087 : Rat) / 92999895213201981850477343083626589746734642324746138) [(3, 1), (7, 2), (13, 1), (15, 2)],
  term ((4227179677649766 : Rat) / 1162780221153193) [(3, 1), (7, 2), (13, 1), (15, 2), (16, 1)],
  term ((64058845371574692704468717594301588487936003313615869633 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(3, 1), (7, 2), (13, 2), (15, 1)],
  term ((-363244002760710 : Rat) / 1162780221153193) [(3, 1), (7, 2), (13, 2), (15, 1), (16, 1)],
  term ((-48571238861349145578694374759784602712 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (7, 2), (13, 3)],
  term ((1394833103216049324805768383943433850561917589737731747 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(3, 1), (7, 2), (14, 1), (15, 1)],
  term ((-1859524334402002 : Rat) / 1162780221153193) [(3, 1), (7, 2), (14, 1), (15, 1), (16, 1)],
  term ((7927195666314199722503393139576614669726528195562845696 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 1), (7, 2), (15, 1)],
  term ((13402833302322904 : Rat) / 1162780221153193) [(3, 1), (7, 2), (15, 1), (16, 1)],
  term ((3879632405954780105500727485990170202391346659208306828 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 2), (5, 1), (9, 1), (13, 1), (15, 1)],
  term ((-150661185588720 : Rat) / 1162780221153193) [(3, 2), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-80945856112067634232098240062478093344 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (5, 1), (9, 1), (13, 2)],
  term ((-17842303055724083763118711211856783152 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (5, 1), (9, 1), (14, 1)],
  term ((-2058995478974842071455534917172445111076593431557556548 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 2), (5, 1), (9, 1), (15, 2)],
  term ((333710849224016 : Rat) / 1162780221153193) [(3, 2), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((-436235768289341236967421850993701608432 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (5, 1), (9, 2), (13, 1)],
  term ((4138671785306667836192239945421705508661977149540299238 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 2), (5, 1), (9, 2), (15, 1)],
  term ((-5884563396179416 : Rat) / 3488340663459579) [(3, 2), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((-370229701304371273616127062071914241912 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (5, 1), (9, 3)],
  term ((-81290644555437604448825923303096311096 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (5, 1), (12, 1), (13, 1)],
  term ((-841370064793335292522429127601806091814441540587938077 : Rat) / 278999685639605945551432029250879769240203926974238414) [(3, 2), (5, 1), (12, 1), (15, 1)],
  term ((1880096111698102 : Rat) / 1162780221153193) [(3, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((234950782138450771464918414303360541712 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (5, 1), (13, 1)],
  term ((-40423760364518984840150318565767501272 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (5, 1), (13, 1), (14, 1)],
  term ((427717756781907914922890628895589920671501510102299927 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 2), (5, 1), (14, 1), (15, 1)],
  term ((141136064908796 : Rat) / 1162780221153193) [(3, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((1395367882291219773749009470590983002070566030055428683 : Rat) / 464999476066009909252386715418132948733673211623730690) [(3, 2), (5, 1), (15, 1)],
  term ((-1880096111698102 : Rat) / 1162780221153193) [(3, 2), (5, 1), (15, 1), (16, 1)],
  term ((40440149595023928932116585720924683072 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (5, 2), (9, 1), (13, 1)],
  term ((-2173624517752731263429423385757322935670570690431915648 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 2), (5, 2), (9, 1), (15, 1)],
  term ((-206941537023232 : Rat) / 1162780221153193) [(3, 2), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((33781967257793617486815206073153137696 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (5, 2), (9, 2)],
  term ((826347564150239326187536952436868474864 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (7, 1), (8, 1), (9, 1)],
  term ((-826347564150239326187536952436868474864 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (7, 1), (8, 1), (13, 1)],
  term ((291119540379211115395695414955239922573 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (7, 1), (9, 1)],
  term ((-1336906305146375017279113329937287758894 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (7, 1), (9, 1), (12, 1)],
  term ((-33273931020260669930661190011024360672 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (7, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((198745616475118943998092102782769635563595552220534688 : Rat) / 46499947606600990925238671541813294873367321162373069) [(3, 2), (7, 1), (9, 1), (12, 1), (15, 2)],
  term ((-1581632301823296 : Rat) / 1162780221153193) [(3, 2), (7, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((51824669101602076868988473170378041883354520582692522331 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(3, 2), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((1687313560550815 : Rat) / 1162780221153193) [(3, 2), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((562775391772069599157180125433912117924 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (7, 1), (9, 1), (13, 2)],
  term ((703002700411395239639010931120510262593 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (7, 1), (9, 1), (14, 1)],
  term ((-11054165036071785399365776736060685613928533689685750087 : Rat) / 185999790426403963700954686167253179493469284649492276) [(3, 2), (7, 1), (9, 1), (15, 2)],
  term ((2113589838824883 : Rat) / 1162780221153193) [(3, 2), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((-7581134653614638297449248888403417424 : Rat) / 39990315246749243218889784267651308933) [(3, 2), (7, 1), (9, 2), (13, 1)],
  term ((6117088134986307917740122211961773302290741365461673651 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(3, 2), (7, 1), (9, 2), (15, 1)],
  term ((-1868935561931170 : Rat) / 1162780221153193) [(3, 2), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((-31556266093234973165652571965850210528 : Rat) / 39990315246749243218889784267651308933) [(3, 2), (7, 1), (9, 3)],
  term ((13597973666208090652136155236314925746 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (7, 1), (12, 1), (13, 1)],
  term ((-198745616475118943998092102782769635563595552220534688 : Rat) / 46499947606600990925238671541813294873367321162373069) [(3, 2), (7, 1), (12, 1), (13, 1), (15, 2)],
  term ((1581632301823296 : Rat) / 1162780221153193) [(3, 2), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((33273931020260669930661190011024360672 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (7, 1), (12, 1), (13, 2), (15, 1)],
  term ((7361797039595291049606458569276731235884520907461058105 : Rat) / 278999685639605945551432029250879769240203926974238414) [(3, 2), (7, 1), (12, 1), (15, 1)],
  term ((7135878331687774 : Rat) / 1162780221153193) [(3, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-49794017268134571589590260644228965512 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (7, 1), (12, 2), (13, 1)],
  term ((183488243113488394739718246684116996552696960175428317 : Rat) / 92999895213201981850477343083626589746734642324746138) [(3, 2), (7, 1), (12, 2), (15, 1)],
  term ((-434461680526322 : Rat) / 1162780221153193) [(3, 2), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((213276192836476200651951336600363730057 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (7, 1), (13, 1)],
  term ((-732265774684129661100978055267095429713 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (7, 1), (13, 1), (14, 1)],
  term ((11054165036071785399365776736060685613928533689685750087 : Rat) / 185999790426403963700954686167253179493469284649492276) [(3, 2), (7, 1), (13, 1), (15, 2)],
  term ((-2113589838824883 : Rat) / 1162780221153193) [(3, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-64058845371574692704468717594301588487936003313615869633 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(3, 2), (7, 1), (13, 2), (15, 1)],
  term ((181622001380355 : Rat) / 1162780221153193) [(3, 2), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((24285619430674572789347187379892301356 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (7, 1), (13, 3)],
  term ((-1394833103216049324805768383943433850561917589737731747 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(3, 2), (7, 1), (14, 1), (15, 1)],
  term ((929762167201001 : Rat) / 1162780221153193) [(3, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3963597833157099861251696569788307334863264097781422848 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 2), (7, 1), (15, 1)],
  term ((-6701416651161452 : Rat) / 1162780221153193) [(3, 2), (7, 1), (15, 1), (16, 1)],
  term ((-413173782075119663093768476218434237432 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (8, 1)],
  term ((-24897008634067285794795130322114482756 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (8, 1), (9, 1), (12, 1), (13, 1)],
  term ((550464729340465184219154740052350989658090880526284951 : Rat) / 185999790426403963700954686167253179493469284649492276) [(3, 2), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((-651692520789483 : Rat) / 1162780221153193) [(3, 2), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-955668267373466586418472917085351378944 : Rat) / 1799564186103715944850040292044308901985) [(3, 2), (8, 1), (9, 1), (13, 1)],
  term ((-112367354585249277159269751704270049391015638612863684701 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(3, 2), (8, 1), (9, 1), (15, 1)],
  term ((10199593906176821 : Rat) / 6976681326919158) [(3, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((1481468177506417179031785085475034735568 : Rat) / 1799564186103715944850040292044308901985) [(3, 2), (8, 1), (9, 2)],
  term ((413173782075119663093768476218434237432 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (8, 1), (12, 1)],
  term ((-550464729340465184219154740052350989658090880526284951 : Rat) / 185999790426403963700954686167253179493469284649492276) [(3, 2), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((651692520789483 : Rat) / 1162780221153193) [(3, 2), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((24897008634067285794795130322114482756 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (8, 1), (12, 1), (13, 2)],
  term ((112367354585249277159269751704270049391015638612863684701 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(3, 2), (8, 1), (13, 1), (15, 1)],
  term ((-10199593906176821 : Rat) / 6976681326919158) [(3, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((60109530803457746714844956809437023648 : Rat) / 359912837220743188970008058408861780397) [(3, 2), (8, 1), (13, 2)],
  term ((-819515684482632755033446851073124410634 : Rat) / 1799564186103715944850040292044308901985) [(3, 2), (9, 1), (12, 1), (13, 1)],
  term ((35538863163306260263364324695043568543574204480893638831 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(3, 2), (9, 1), (12, 1), (15, 1)],
  term ((-9878927548793470 : Rat) / 3488340663459579) [(3, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((24897008634067285794795130322114482756 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (9, 1), (12, 2), (13, 1)],
  term ((-550464729340465184219154740052350989658090880526284951 : Rat) / 185999790426403963700954686167253179493469284649492276) [(3, 2), (9, 1), (12, 2), (15, 1)],
  term ((651692520789483 : Rat) / 1162780221153193) [(3, 2), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-805949358000796349913126552030420092932 : Rat) / 1799564186103715944850040292044308901985) [(3, 2), (9, 1), (13, 1)],
  term ((-80627782090679273114397877331280963496 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (9, 1), (13, 1), (14, 1)],
  term ((-272594809814001542933094722250079094468097718750174307369 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(3, 2), (9, 1), (15, 1)],
  term ((30681801572986753 : Rat) / 13953362653838316) [(3, 2), (9, 1), (15, 1), (16, 1)],
  term ((2387626961939987510672639906547731859643 : Rat) / 1079738511662229566910024175226585341191) [(3, 2), (9, 2)],
  term ((-73019057256041486527015351666160404934 : Rat) / 119970945740247729656669352802953926799) [(3, 2), (9, 2), (12, 1)],
  term ((-11091310340086889976887063337008120224 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (9, 2), (12, 1), (13, 1), (15, 1)],
  term ((198745616475118943998092102782769635563595552220534688 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 2), (9, 2), (12, 1), (15, 2)],
  term ((-527210767274432 : Rat) / 1162780221153193) [(3, 2), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((1269228168809522245699254430788175009060618502683481501 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(3, 2), (9, 2), (13, 1), (15, 1)],
  term ((5094646267068265 : Rat) / 3488340663459579) [(3, 2), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-815388877581942842408941403533558143676 : Rat) / 1799564186103715944850040292044308901985) [(3, 2), (9, 2), (13, 2)],
  term ((127117587288509716251354049751831833361 : Rat) / 359912837220743188970008058408861780397) [(3, 2), (9, 2), (14, 1)],
  term ((289873507268913191523518837135133871483600695335134711471 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(3, 2), (9, 2), (15, 2)],
  term ((-16856913734998261 : Rat) / 3488340663459579) [(3, 2), (9, 2), (15, 2), (16, 1)],
  term ((-80699759732353167093043025510819982368 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (9, 3), (13, 1)],
  term ((-225792246667296571754346172666409042645220020210494517 : Rat) / 836999056918817836654296087752639307720611780922715242) [(3, 2), (9, 3), (15, 1)],
  term ((-373787112386234 : Rat) / 3488340663459579) [(3, 2), (9, 3), (15, 1), (16, 1)],
  term ((-31556266093234973165652571965850210528 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (9, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 16, terms 200 through 299. -/
theorem ep_Q2_024_block_16_0200_0299_valid :
    checkProductSumEq ep_Q2_024_partials_16_0200_0299
      ep_Q2_024_block_16_0200_0299 = true := by
  native_decide

end EpQ2024TermShards

end Patterns

end EndpointCertificate

end Problem97
