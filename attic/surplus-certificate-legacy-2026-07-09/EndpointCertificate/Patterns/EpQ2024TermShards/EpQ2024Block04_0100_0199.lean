/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_024, term block 4:100-199

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_024`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2024TermShards

/-- Generator polynomial 4 for endpoint certificate `ep_Q2_024`. -/
def ep_Q2_024_generator_04_0100_0199 : Poly :=
[
  term (1 : Rat) [(2, 2)],
  term (1 : Rat) [(3, 2)],
  term (-1 : Rat) [(10, 2)],
  term (-1 : Rat) [(11, 2)]
]

/-- Coefficient term 100 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0100 : Poly :=
[
  term ((-4350297622763456 : Rat) / 3488340663459579) [(1, 1), (5, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 100 for generator 4. -/
def ep_Q2_024_partial_04_0100 : Poly :=
[
  term ((-4350297622763456 : Rat) / 3488340663459579) [(1, 1), (2, 2), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((-4350297622763456 : Rat) / 3488340663459579) [(1, 1), (3, 2), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((4350297622763456 : Rat) / 3488340663459579) [(1, 1), (5, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((4350297622763456 : Rat) / 3488340663459579) [(1, 1), (5, 1), (9, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 4. -/
theorem ep_Q2_024_partial_04_0100_valid :
    mulPoly ep_Q2_024_coefficient_04_0100
        ep_Q2_024_generator_04_0100_0199 =
      ep_Q2_024_partial_04_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0101 : Poly :=
[
  term ((315846430077575624766678596138973379552 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (9, 2)]
]

/-- Partial product 101 for generator 4. -/
def ep_Q2_024_partial_04_0101 : Poly :=
[
  term ((315846430077575624766678596138973379552 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 2), (5, 1), (9, 2)],
  term ((315846430077575624766678596138973379552 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 2), (5, 1), (9, 2)],
  term ((-315846430077575624766678596138973379552 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (9, 2), (10, 2)],
  term ((-315846430077575624766678596138973379552 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (9, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 4. -/
theorem ep_Q2_024_partial_04_0101_valid :
    mulPoly ep_Q2_024_coefficient_04_0101
        ep_Q2_024_generator_04_0100_0199 =
      ep_Q2_024_partial_04_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0102 : Poly :=
[
  term ((-9407326506538999398797487783872895160 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (5, 1), (11, 1), (13, 1)]
]

/-- Partial product 102 for generator 4. -/
def ep_Q2_024_partial_04_0102 : Poly :=
[
  term ((-9407326506538999398797487783872895160 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (2, 2), (5, 1), (11, 1), (13, 1)],
  term ((-9407326506538999398797487783872895160 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (3, 2), (5, 1), (11, 1), (13, 1)],
  term ((9407326506538999398797487783872895160 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (5, 1), (10, 2), (11, 1), (13, 1)],
  term ((9407326506538999398797487783872895160 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (5, 1), (11, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 4. -/
theorem ep_Q2_024_partial_04_0102_valid :
    mulPoly ep_Q2_024_coefficient_04_0102
        ep_Q2_024_generator_04_0100_0199 =
      ep_Q2_024_partial_04_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0103 : Poly :=
[
  term ((2354726156844551479976179518884154954213556855016731652 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (5, 1), (11, 1), (15, 1)]
]

/-- Partial product 103 for generator 4. -/
def ep_Q2_024_partial_04_0103 : Poly :=
[
  term ((2354726156844551479976179518884154954213556855016731652 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (2, 2), (5, 1), (11, 1), (15, 1)],
  term ((2354726156844551479976179518884154954213556855016731652 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (3, 2), (5, 1), (11, 1), (15, 1)],
  term ((-2354726156844551479976179518884154954213556855016731652 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (5, 1), (10, 2), (11, 1), (15, 1)],
  term ((-2354726156844551479976179518884154954213556855016731652 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (5, 1), (11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 4. -/
theorem ep_Q2_024_partial_04_0103_valid :
    mulPoly ep_Q2_024_coefficient_04_0103
        ep_Q2_024_generator_04_0100_0199 =
      ep_Q2_024_partial_04_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0104 : Poly :=
[
  term ((854765176539728 : Rat) / 1162780221153193) [(1, 1), (5, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 104 for generator 4. -/
def ep_Q2_024_partial_04_0104 : Poly :=
[
  term ((854765176539728 : Rat) / 1162780221153193) [(1, 1), (2, 2), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((854765176539728 : Rat) / 1162780221153193) [(1, 1), (3, 2), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((-854765176539728 : Rat) / 1162780221153193) [(1, 1), (5, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-854765176539728 : Rat) / 1162780221153193) [(1, 1), (5, 1), (11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 4. -/
theorem ep_Q2_024_partial_04_0104_valid :
    mulPoly ep_Q2_024_coefficient_04_0104
        ep_Q2_024_generator_04_0100_0199 =
      ep_Q2_024_partial_04_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0105 : Poly :=
[
  term ((6575066095859372571526548321556159041353238918460193408 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (5, 1), (13, 1), (15, 1)]
]

/-- Partial product 105 for generator 4. -/
def ep_Q2_024_partial_04_0105 : Poly :=
[
  term ((6575066095859372571526548321556159041353238918460193408 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (2, 2), (5, 1), (13, 1), (15, 1)],
  term ((6575066095859372571526548321556159041353238918460193408 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (3, 2), (5, 1), (13, 1), (15, 1)],
  term ((-6575066095859372571526548321556159041353238918460193408 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (5, 1), (10, 2), (13, 1), (15, 1)],
  term ((-6575066095859372571526548321556159041353238918460193408 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (5, 1), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 4. -/
theorem ep_Q2_024_partial_04_0105_valid :
    mulPoly ep_Q2_024_coefficient_04_0105
        ep_Q2_024_generator_04_0100_0199 =
      ep_Q2_024_partial_04_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0106 : Poly :=
[
  term ((206941537023232 : Rat) / 1162780221153193) [(1, 1), (5, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 106 for generator 4. -/
def ep_Q2_024_partial_04_0106 : Poly :=
[
  term ((206941537023232 : Rat) / 1162780221153193) [(1, 1), (2, 2), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((206941537023232 : Rat) / 1162780221153193) [(1, 1), (3, 2), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-206941537023232 : Rat) / 1162780221153193) [(1, 1), (5, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-206941537023232 : Rat) / 1162780221153193) [(1, 1), (5, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 4. -/
theorem ep_Q2_024_partial_04_0106_valid :
    mulPoly ep_Q2_024_coefficient_04_0106
        ep_Q2_024_generator_04_0100_0199 =
      ep_Q2_024_partial_04_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0107 : Poly :=
[
  term ((-40440149595023928932116585720924683072 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (13, 2)]
]

/-- Partial product 107 for generator 4. -/
def ep_Q2_024_partial_04_0107 : Poly :=
[
  term ((-40440149595023928932116585720924683072 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 2), (5, 1), (13, 2)],
  term ((-40440149595023928932116585720924683072 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 2), (5, 1), (13, 2)],
  term ((40440149595023928932116585720924683072 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (10, 2), (13, 2)],
  term ((40440149595023928932116585720924683072 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (11, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 4. -/
theorem ep_Q2_024_partial_04_0107_valid :
    mulPoly ep_Q2_024_coefficient_04_0107
        ep_Q2_024_generator_04_0100_0199 =
      ep_Q2_024_partial_04_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0108 : Poly :=
[
  term ((4466115409796894554675042235934975650543774254263469936 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (5, 1), (15, 2)]
]

/-- Partial product 108 for generator 4. -/
def ep_Q2_024_partial_04_0108 : Poly :=
[
  term ((4466115409796894554675042235934975650543774254263469936 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (2, 2), (5, 1), (15, 2)],
  term ((4466115409796894554675042235934975650543774254263469936 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (3, 2), (5, 1), (15, 2)],
  term ((-4466115409796894554675042235934975650543774254263469936 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (5, 1), (10, 2), (15, 2)],
  term ((-4466115409796894554675042235934975650543774254263469936 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (5, 1), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 4. -/
theorem ep_Q2_024_partial_04_0108_valid :
    mulPoly ep_Q2_024_coefficient_04_0108
        ep_Q2_024_generator_04_0100_0199 =
      ep_Q2_024_partial_04_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0109 : Poly :=
[
  term ((-898255108859200 : Rat) / 1162780221153193) [(1, 1), (5, 1), (15, 2), (16, 1)]
]

/-- Partial product 109 for generator 4. -/
def ep_Q2_024_partial_04_0109 : Poly :=
[
  term ((-898255108859200 : Rat) / 1162780221153193) [(1, 1), (2, 2), (5, 1), (15, 2), (16, 1)],
  term ((-898255108859200 : Rat) / 1162780221153193) [(1, 1), (3, 2), (5, 1), (15, 2), (16, 1)],
  term ((898255108859200 : Rat) / 1162780221153193) [(1, 1), (5, 1), (10, 2), (15, 2), (16, 1)],
  term ((898255108859200 : Rat) / 1162780221153193) [(1, 1), (5, 1), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 4. -/
theorem ep_Q2_024_partial_04_0109_valid :
    mulPoly ep_Q2_024_coefficient_04_0109
        ep_Q2_024_generator_04_0100_0199 =
      ep_Q2_024_partial_04_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0110 : Poly :=
[
  term ((388907381162663655109886315109732674088 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (7, 1)]
]

/-- Partial product 110 for generator 4. -/
def ep_Q2_024_partial_04_0110 : Poly :=
[
  term ((388907381162663655109886315109732674088 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 2), (7, 1)],
  term ((388907381162663655109886315109732674088 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 2), (7, 1)],
  term ((-388907381162663655109886315109732674088 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (7, 1), (10, 2)],
  term ((-388907381162663655109886315109732674088 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (7, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 4. -/
theorem ep_Q2_024_partial_04_0110_valid :
    mulPoly ep_Q2_024_coefficient_04_0110
        ep_Q2_024_generator_04_0100_0199 =
      ep_Q2_024_partial_04_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0111 : Poly :=
[
  term ((-826347564150239326187536952436868474864 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (8, 1), (9, 1)]
]

/-- Partial product 111 for generator 4. -/
def ep_Q2_024_partial_04_0111 : Poly :=
[
  term ((-826347564150239326187536952436868474864 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (2, 2), (8, 1), (9, 1)],
  term ((-826347564150239326187536952436868474864 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (3, 2), (8, 1), (9, 1)],
  term ((826347564150239326187536952436868474864 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (8, 1), (9, 1), (10, 2)],
  term ((826347564150239326187536952436868474864 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (8, 1), (9, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 4. -/
theorem ep_Q2_024_partial_04_0111_valid :
    mulPoly ep_Q2_024_coefficient_04_0111
        ep_Q2_024_generator_04_0100_0199 =
      ep_Q2_024_partial_04_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0112 : Poly :=
[
  term ((-17431738693849372302362576575459651055888 : Rat) / 5398692558311147834550120876132926705955) [(1, 1), (9, 1)]
]

/-- Partial product 112 for generator 4. -/
def ep_Q2_024_partial_04_0112 : Poly :=
[
  term ((-17431738693849372302362576575459651055888 : Rat) / 5398692558311147834550120876132926705955) [(1, 1), (2, 2), (9, 1)],
  term ((-17431738693849372302362576575459651055888 : Rat) / 5398692558311147834550120876132926705955) [(1, 1), (3, 2), (9, 1)],
  term ((17431738693849372302362576575459651055888 : Rat) / 5398692558311147834550120876132926705955) [(1, 1), (9, 1), (10, 2)],
  term ((17431738693849372302362576575459651055888 : Rat) / 5398692558311147834550120876132926705955) [(1, 1), (9, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 4. -/
theorem ep_Q2_024_partial_04_0112_valid :
    mulPoly ep_Q2_024_coefficient_04_0112
        ep_Q2_024_generator_04_0100_0199 =
      ep_Q2_024_partial_04_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0113 : Poly :=
[
  term ((84137745390860658180211860664979045196 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (9, 1), (11, 1), (15, 1)]
]

/-- Partial product 113 for generator 4. -/
def ep_Q2_024_partial_04_0113 : Poly :=
[
  term ((84137745390860658180211860664979045196 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 2), (9, 1), (11, 1), (15, 1)],
  term ((84137745390860658180211860664979045196 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 2), (9, 1), (11, 1), (15, 1)],
  term ((-84137745390860658180211860664979045196 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (9, 1), (10, 2), (11, 1), (15, 1)],
  term ((-84137745390860658180211860664979045196 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (9, 1), (11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 4. -/
theorem ep_Q2_024_partial_04_0113_valid :
    mulPoly ep_Q2_024_coefficient_04_0113
        ep_Q2_024_generator_04_0100_0199 =
      ep_Q2_024_partial_04_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0114 : Poly :=
[
  term ((1229638110307244453831799686572507368754 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (9, 1), (12, 1)]
]

/-- Partial product 114 for generator 4. -/
def ep_Q2_024_partial_04_0114 : Poly :=
[
  term ((1229638110307244453831799686572507368754 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 2), (9, 1), (12, 1)],
  term ((1229638110307244453831799686572507368754 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 2), (9, 1), (12, 1)],
  term ((-1229638110307244453831799686572507368754 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (9, 1), (10, 2), (12, 1)],
  term ((-1229638110307244453831799686572507368754 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (9, 1), (11, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 4. -/
theorem ep_Q2_024_partial_04_0114_valid :
    mulPoly ep_Q2_024_coefficient_04_0114
        ep_Q2_024_generator_04_0100_0199 =
      ep_Q2_024_partial_04_0114 := by
  native_decide

/-- Coefficient term 115 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0115 : Poly :=
[
  term ((11091310340086889976887063337008120224 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (9, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 115 for generator 4. -/
def ep_Q2_024_partial_04_0115 : Poly :=
[
  term ((11091310340086889976887063337008120224 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 2), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((11091310340086889976887063337008120224 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 2), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((-11091310340086889976887063337008120224 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (9, 1), (10, 2), (12, 1), (13, 1), (15, 1)],
  term ((-11091310340086889976887063337008120224 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (9, 1), (11, 2), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 115 for generator 4. -/
theorem ep_Q2_024_partial_04_0115_valid :
    mulPoly ep_Q2_024_coefficient_04_0115
        ep_Q2_024_generator_04_0100_0199 =
      ep_Q2_024_partial_04_0115 := by
  native_decide

/-- Coefficient term 116 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0116 : Poly :=
[
  term ((-198745616475118943998092102782769635563595552220534688 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (9, 1), (12, 1), (15, 2)]
]

/-- Partial product 116 for generator 4. -/
def ep_Q2_024_partial_04_0116 : Poly :=
[
  term ((-198745616475118943998092102782769635563595552220534688 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (2, 2), (9, 1), (12, 1), (15, 2)],
  term ((-198745616475118943998092102782769635563595552220534688 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (3, 2), (9, 1), (12, 1), (15, 2)],
  term ((198745616475118943998092102782769635563595552220534688 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (9, 1), (10, 2), (12, 1), (15, 2)],
  term ((198745616475118943998092102782769635563595552220534688 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (9, 1), (11, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 116 for generator 4. -/
theorem ep_Q2_024_partial_04_0116_valid :
    mulPoly ep_Q2_024_coefficient_04_0116
        ep_Q2_024_generator_04_0100_0199 =
      ep_Q2_024_partial_04_0116 := by
  native_decide

/-- Coefficient term 117 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0117 : Poly :=
[
  term ((527210767274432 : Rat) / 1162780221153193) [(1, 1), (9, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 117 for generator 4. -/
def ep_Q2_024_partial_04_0117 : Poly :=
[
  term ((527210767274432 : Rat) / 1162780221153193) [(1, 1), (2, 2), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((527210767274432 : Rat) / 1162780221153193) [(1, 1), (3, 2), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-527210767274432 : Rat) / 1162780221153193) [(1, 1), (9, 1), (10, 2), (12, 1), (15, 2), (16, 1)],
  term ((-527210767274432 : Rat) / 1162780221153193) [(1, 1), (9, 1), (11, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 117 for generator 4. -/
theorem ep_Q2_024_partial_04_0117_valid :
    mulPoly ep_Q2_024_coefficient_04_0117
        ep_Q2_024_generator_04_0100_0199 =
      ep_Q2_024_partial_04_0117 := by
  native_decide

/-- Coefficient term 118 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0118 : Poly :=
[
  term ((23310089130471063931483894832932188107056959617098620911 : Rat) / 1673998113837635673308592175505278615441223561845430484) [(1, 1), (9, 1), (13, 1), (15, 1)]
]

/-- Partial product 118 for generator 4. -/
def ep_Q2_024_partial_04_0118 : Poly :=
[
  term ((23310089130471063931483894832932188107056959617098620911 : Rat) / 1673998113837635673308592175505278615441223561845430484) [(1, 1), (2, 2), (9, 1), (13, 1), (15, 1)],
  term ((23310089130471063931483894832932188107056959617098620911 : Rat) / 1673998113837635673308592175505278615441223561845430484) [(1, 1), (3, 2), (9, 1), (13, 1), (15, 1)],
  term ((-23310089130471063931483894832932188107056959617098620911 : Rat) / 1673998113837635673308592175505278615441223561845430484) [(1, 1), (9, 1), (10, 2), (13, 1), (15, 1)],
  term ((-23310089130471063931483894832932188107056959617098620911 : Rat) / 1673998113837635673308592175505278615441223561845430484) [(1, 1), (9, 1), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 118 for generator 4. -/
theorem ep_Q2_024_partial_04_0118_valid :
    mulPoly ep_Q2_024_coefficient_04_0118
        ep_Q2_024_generator_04_0100_0199 =
      ep_Q2_024_partial_04_0118 := by
  native_decide

/-- Coefficient term 119 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0119 : Poly :=
[
  term ((-1061184475199617 : Rat) / 3488340663459579) [(1, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 119 for generator 4. -/
def ep_Q2_024_partial_04_0119 : Poly :=
[
  term ((-1061184475199617 : Rat) / 3488340663459579) [(1, 1), (2, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1061184475199617 : Rat) / 3488340663459579) [(1, 1), (3, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((1061184475199617 : Rat) / 3488340663459579) [(1, 1), (9, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((1061184475199617 : Rat) / 3488340663459579) [(1, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 119 for generator 4. -/
theorem ep_Q2_024_partial_04_0119_valid :
    mulPoly ep_Q2_024_coefficient_04_0119
        ep_Q2_024_generator_04_0100_0199 =
      ep_Q2_024_partial_04_0119 := by
  native_decide

/-- Coefficient term 120 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0120 : Poly :=
[
  term ((1981497736132325952384312234099254469916 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (9, 1), (13, 2)]
]

/-- Partial product 120 for generator 4. -/
def ep_Q2_024_partial_04_0120 : Poly :=
[
  term ((1981497736132325952384312234099254469916 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (2, 2), (9, 1), (13, 2)],
  term ((1981497736132325952384312234099254469916 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (3, 2), (9, 1), (13, 2)],
  term ((-1981497736132325952384312234099254469916 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (9, 1), (10, 2), (13, 2)],
  term ((-1981497736132325952384312234099254469916 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (9, 1), (11, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 120 for generator 4. -/
theorem ep_Q2_024_partial_04_0120_valid :
    mulPoly ep_Q2_024_coefficient_04_0120
        ep_Q2_024_generator_04_0100_0199 =
      ep_Q2_024_partial_04_0120 := by
  native_decide

/-- Coefficient term 121 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0121 : Poly :=
[
  term ((-22014581232155150509180716130595189439661 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (9, 1), (14, 1)]
]

/-- Partial product 121 for generator 4. -/
def ep_Q2_024_partial_04_0121 : Poly :=
[
  term ((-22014581232155150509180716130595189439661 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (2, 2), (9, 1), (14, 1)],
  term ((-22014581232155150509180716130595189439661 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (3, 2), (9, 1), (14, 1)],
  term ((22014581232155150509180716130595189439661 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (9, 1), (10, 2), (14, 1)],
  term ((22014581232155150509180716130595189439661 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (9, 1), (11, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 121 for generator 4. -/
theorem ep_Q2_024_partial_04_0121_valid :
    mulPoly ep_Q2_024_coefficient_04_0121
        ep_Q2_024_generator_04_0100_0199 =
      ep_Q2_024_partial_04_0121 := by
  native_decide

/-- Coefficient term 122 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0122 : Poly :=
[
  term ((5363707832472393008176946490880024273152821491591969510 : Rat) / 418499528459408918327148043876319653860305890461357621) [(1, 1), (9, 1), (15, 2)]
]

/-- Partial product 122 for generator 4. -/
def ep_Q2_024_partial_04_0122 : Poly :=
[
  term ((5363707832472393008176946490880024273152821491591969510 : Rat) / 418499528459408918327148043876319653860305890461357621) [(1, 1), (2, 2), (9, 1), (15, 2)],
  term ((5363707832472393008176946490880024273152821491591969510 : Rat) / 418499528459408918327148043876319653860305890461357621) [(1, 1), (3, 2), (9, 1), (15, 2)],
  term ((-5363707832472393008176946490880024273152821491591969510 : Rat) / 418499528459408918327148043876319653860305890461357621) [(1, 1), (9, 1), (10, 2), (15, 2)],
  term ((-5363707832472393008176946490880024273152821491591969510 : Rat) / 418499528459408918327148043876319653860305890461357621) [(1, 1), (9, 1), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 122 for generator 4. -/
theorem ep_Q2_024_partial_04_0122_valid :
    mulPoly ep_Q2_024_coefficient_04_0122
        ep_Q2_024_generator_04_0100_0199 =
      ep_Q2_024_partial_04_0122 := by
  native_decide

/-- Coefficient term 123 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0123 : Poly :=
[
  term ((-917902994712824 : Rat) / 3488340663459579) [(1, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 123 for generator 4. -/
def ep_Q2_024_partial_04_0123 : Poly :=
[
  term ((-917902994712824 : Rat) / 3488340663459579) [(1, 1), (2, 2), (9, 1), (15, 2), (16, 1)],
  term ((-917902994712824 : Rat) / 3488340663459579) [(1, 1), (3, 2), (9, 1), (15, 2), (16, 1)],
  term ((917902994712824 : Rat) / 3488340663459579) [(1, 1), (9, 1), (10, 2), (15, 2), (16, 1)],
  term ((917902994712824 : Rat) / 3488340663459579) [(1, 1), (9, 1), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 123 for generator 4. -/
theorem ep_Q2_024_partial_04_0123_valid :
    mulPoly ep_Q2_024_coefficient_04_0123
        ep_Q2_024_generator_04_0100_0199 =
      ep_Q2_024_partial_04_0123 := by
  native_decide

/-- Coefficient term 124 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0124 : Poly :=
[
  term ((-2054771222204498495269592230004205344 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (9, 2), (13, 1)]
]

/-- Partial product 124 for generator 4. -/
def ep_Q2_024_partial_04_0124 : Poly :=
[
  term ((-2054771222204498495269592230004205344 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (2, 2), (9, 2), (13, 1)],
  term ((-2054771222204498495269592230004205344 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (3, 2), (9, 2), (13, 1)],
  term ((2054771222204498495269592230004205344 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (9, 2), (10, 2), (13, 1)],
  term ((2054771222204498495269592230004205344 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (9, 2), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 124 for generator 4. -/
theorem ep_Q2_024_partial_04_0124_valid :
    mulPoly ep_Q2_024_coefficient_04_0124
        ep_Q2_024_generator_04_0100_0199 =
      ep_Q2_024_partial_04_0124 := by
  native_decide

/-- Coefficient term 125 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0125 : Poly :=
[
  term ((12301069069469927066412623315433253195720432156430141869 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(1, 1), (9, 2), (15, 1)]
]

/-- Partial product 125 for generator 4. -/
def ep_Q2_024_partial_04_0125 : Poly :=
[
  term ((12301069069469927066412623315433253195720432156430141869 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(1, 1), (2, 2), (9, 2), (15, 1)],
  term ((12301069069469927066412623315433253195720432156430141869 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(1, 1), (3, 2), (9, 2), (15, 1)],
  term ((-12301069069469927066412623315433253195720432156430141869 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(1, 1), (9, 2), (10, 2), (15, 1)],
  term ((-12301069069469927066412623315433253195720432156430141869 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(1, 1), (9, 2), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 125 for generator 4. -/
theorem ep_Q2_024_partial_04_0125_valid :
    mulPoly ep_Q2_024_coefficient_04_0125
        ep_Q2_024_generator_04_0100_0199 =
      ep_Q2_024_partial_04_0125 := by
  native_decide

/-- Coefficient term 126 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0126 : Poly :=
[
  term ((-4111658236248574 : Rat) / 3488340663459579) [(1, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 126 for generator 4. -/
def ep_Q2_024_partial_04_0126 : Poly :=
[
  term ((-4111658236248574 : Rat) / 3488340663459579) [(1, 1), (2, 2), (9, 2), (15, 1), (16, 1)],
  term ((-4111658236248574 : Rat) / 3488340663459579) [(1, 1), (3, 2), (9, 2), (15, 1), (16, 1)],
  term ((4111658236248574 : Rat) / 3488340663459579) [(1, 1), (9, 2), (10, 2), (15, 1), (16, 1)],
  term ((4111658236248574 : Rat) / 3488340663459579) [(1, 1), (9, 2), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 126 for generator 4. -/
theorem ep_Q2_024_partial_04_0126_valid :
    mulPoly ep_Q2_024_coefficient_04_0126
        ep_Q2_024_generator_04_0100_0199 =
      ep_Q2_024_partial_04_0126 := by
  native_decide

/-- Coefficient term 127 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0127 : Poly :=
[
  term ((-347118927025584704822178291624352315808 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (9, 3)]
]

/-- Partial product 127 for generator 4. -/
def ep_Q2_024_partial_04_0127 : Poly :=
[
  term ((-347118927025584704822178291624352315808 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 2), (9, 3)],
  term ((-347118927025584704822178291624352315808 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 2), (9, 3)],
  term ((347118927025584704822178291624352315808 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (9, 3), (10, 2)],
  term ((347118927025584704822178291624352315808 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (9, 3), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 127 for generator 4. -/
theorem ep_Q2_024_partial_04_0127_valid :
    mulPoly ep_Q2_024_coefficient_04_0127
        ep_Q2_024_generator_04_0100_0199 =
      ep_Q2_024_partial_04_0127 := by
  native_decide

/-- Coefficient term 128 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0128 : Poly :=
[
  term ((1429182194689304419382031011936884624481 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (11, 1)]
]

/-- Partial product 128 for generator 4. -/
def ep_Q2_024_partial_04_0128 : Poly :=
[
  term ((1429182194689304419382031011936884624481 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (2, 2), (11, 1)],
  term ((1429182194689304419382031011936884624481 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (3, 2), (11, 1)],
  term ((-1429182194689304419382031011936884624481 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (10, 2), (11, 1)],
  term ((-1429182194689304419382031011936884624481 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (11, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 128 for generator 4. -/
theorem ep_Q2_024_partial_04_0128_valid :
    mulPoly ep_Q2_024_coefficient_04_0128
        ep_Q2_024_generator_04_0100_0199 =
      ep_Q2_024_partial_04_0128 := by
  native_decide

/-- Coefficient term 129 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0129 : Poly :=
[
  term ((-121146326533413229489263888085127877224 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 129 for generator 4. -/
def ep_Q2_024_partial_04_0129 : Poly :=
[
  term ((-121146326533413229489263888085127877224 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 2), (11, 1), (13, 1), (15, 1)],
  term ((-121146326533413229489263888085127877224 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 2), (11, 1), (13, 1), (15, 1)],
  term ((121146326533413229489263888085127877224 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (10, 2), (11, 1), (13, 1), (15, 1)],
  term ((121146326533413229489263888085127877224 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (11, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 129 for generator 4. -/
theorem ep_Q2_024_partial_04_0129_valid :
    mulPoly ep_Q2_024_coefficient_04_0129
        ep_Q2_024_generator_04_0100_0199 =
      ep_Q2_024_partial_04_0129 := by
  native_decide

/-- Coefficient term 130 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0130 : Poly :=
[
  term ((-228548346943902101627953017098607070723838550969230898109 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(1, 1), (11, 1), (15, 2)]
]

/-- Partial product 130 for generator 4. -/
def ep_Q2_024_partial_04_0130 : Poly :=
[
  term ((-228548346943902101627953017098607070723838550969230898109 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(1, 1), (2, 2), (11, 1), (15, 2)],
  term ((-228548346943902101627953017098607070723838550969230898109 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(1, 1), (3, 2), (11, 1), (15, 2)],
  term ((228548346943902101627953017098607070723838550969230898109 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(1, 1), (10, 2), (11, 1), (15, 2)],
  term ((228548346943902101627953017098607070723838550969230898109 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(1, 1), (11, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 130 for generator 4. -/
theorem ep_Q2_024_partial_04_0130_valid :
    mulPoly ep_Q2_024_coefficient_04_0130
        ep_Q2_024_generator_04_0100_0199 =
      ep_Q2_024_partial_04_0130 := by
  native_decide

/-- Coefficient term 131 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0131 : Poly :=
[
  term ((9851670194564511 : Rat) / 2325560442306386) [(1, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 131 for generator 4. -/
def ep_Q2_024_partial_04_0131 : Poly :=
[
  term ((9851670194564511 : Rat) / 2325560442306386) [(1, 1), (2, 2), (11, 1), (15, 2), (16, 1)],
  term ((9851670194564511 : Rat) / 2325560442306386) [(1, 1), (3, 2), (11, 1), (15, 2), (16, 1)],
  term ((-9851670194564511 : Rat) / 2325560442306386) [(1, 1), (10, 2), (11, 1), (15, 2), (16, 1)],
  term ((-9851670194564511 : Rat) / 2325560442306386) [(1, 1), (11, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 131 for generator 4. -/
theorem ep_Q2_024_partial_04_0131_valid :
    mulPoly ep_Q2_024_coefficient_04_0131
        ep_Q2_024_generator_04_0100_0199 =
      ep_Q2_024_partial_04_0131 := by
  native_decide

/-- Coefficient term 132 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0132 : Poly :=
[
  term ((12048567490034960850927731169048294922094 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (12, 1), (13, 1)]
]

/-- Partial product 132 for generator 4. -/
def ep_Q2_024_partial_04_0132 : Poly :=
[
  term ((12048567490034960850927731169048294922094 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (2, 2), (12, 1), (13, 1)],
  term ((12048567490034960850927731169048294922094 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (3, 2), (12, 1), (13, 1)],
  term ((-12048567490034960850927731169048294922094 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (10, 2), (12, 1), (13, 1)],
  term ((-12048567490034960850927731169048294922094 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (11, 2), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 132 for generator 4. -/
theorem ep_Q2_024_partial_04_0132_valid :
    mulPoly ep_Q2_024_coefficient_04_0132
        ep_Q2_024_generator_04_0100_0199 =
      ep_Q2_024_partial_04_0132 := by
  native_decide

/-- Coefficient term 133 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0133 : Poly :=
[
  term ((-298117535883234413975848953549738636486 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 133 for generator 4. -/
def ep_Q2_024_partial_04_0133 : Poly :=
[
  term ((-298117535883234413975848953549738636486 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 2), (12, 1), (13, 1), (14, 1)],
  term ((-298117535883234413975848953549738636486 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 2), (12, 1), (13, 1), (14, 1)],
  term ((298117535883234413975848953549738636486 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (10, 2), (12, 1), (13, 1), (14, 1)],
  term ((298117535883234413975848953549738636486 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (11, 2), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 133 for generator 4. -/
theorem ep_Q2_024_partial_04_0133_valid :
    mulPoly ep_Q2_024_coefficient_04_0133
        ep_Q2_024_generator_04_0100_0199 =
      ep_Q2_024_partial_04_0133 := by
  native_decide

/-- Coefficient term 134 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0134 : Poly :=
[
  term ((72984140873142382040814446151801399736191225609387877649 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(1, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 134 for generator 4. -/
def ep_Q2_024_partial_04_0134 : Poly :=
[
  term ((72984140873142382040814446151801399736191225609387877649 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(1, 1), (2, 2), (12, 1), (14, 1), (15, 1)],
  term ((72984140873142382040814446151801399736191225609387877649 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(1, 1), (3, 2), (12, 1), (14, 1), (15, 1)],
  term ((-72984140873142382040814446151801399736191225609387877649 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(1, 1), (10, 2), (12, 1), (14, 1), (15, 1)],
  term ((-72984140873142382040814446151801399736191225609387877649 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(1, 1), (11, 2), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 134 for generator 4. -/
theorem ep_Q2_024_partial_04_0134_valid :
    mulPoly ep_Q2_024_coefficient_04_0134
        ep_Q2_024_generator_04_0100_0199 =
      ep_Q2_024_partial_04_0134 := by
  native_decide

/-- Coefficient term 135 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0135 : Poly :=
[
  term ((-12874820086749561 : Rat) / 2325560442306386) [(1, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 135 for generator 4. -/
def ep_Q2_024_partial_04_0135 : Poly :=
[
  term ((-12874820086749561 : Rat) / 2325560442306386) [(1, 1), (2, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-12874820086749561 : Rat) / 2325560442306386) [(1, 1), (3, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((12874820086749561 : Rat) / 2325560442306386) [(1, 1), (10, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((12874820086749561 : Rat) / 2325560442306386) [(1, 1), (11, 2), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 135 for generator 4. -/
theorem ep_Q2_024_partial_04_0135_valid :
    mulPoly ep_Q2_024_coefficient_04_0135
        ep_Q2_024_generator_04_0100_0199 =
      ep_Q2_024_partial_04_0135 := by
  native_decide

/-- Coefficient term 136 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0136 : Poly :=
[
  term ((599492349856740992469735225942126878592774963052615622381 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(1, 1), (12, 1), (15, 1)]
]

/-- Partial product 136 for generator 4. -/
def ep_Q2_024_partial_04_0136 : Poly :=
[
  term ((599492349856740992469735225942126878592774963052615622381 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(1, 1), (2, 2), (12, 1), (15, 1)],
  term ((599492349856740992469735225942126878592774963052615622381 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(1, 1), (3, 2), (12, 1), (15, 1)],
  term ((-599492349856740992469735225942126878592774963052615622381 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(1, 1), (10, 2), (12, 1), (15, 1)],
  term ((-599492349856740992469735225942126878592774963052615622381 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(1, 1), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 136 for generator 4. -/
theorem ep_Q2_024_partial_04_0136_valid :
    mulPoly ep_Q2_024_coefficient_04_0136
        ep_Q2_024_generator_04_0100_0199 =
      ep_Q2_024_partial_04_0136 := by
  native_decide

/-- Coefficient term 137 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0137 : Poly :=
[
  term ((113286569105637787 : Rat) / 13953362653838316) [(1, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 137 for generator 4. -/
def ep_Q2_024_partial_04_0137 : Poly :=
[
  term ((113286569105637787 : Rat) / 13953362653838316) [(1, 1), (2, 2), (12, 1), (15, 1), (16, 1)],
  term ((113286569105637787 : Rat) / 13953362653838316) [(1, 1), (3, 2), (12, 1), (15, 1), (16, 1)],
  term ((-113286569105637787 : Rat) / 13953362653838316) [(1, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((-113286569105637787 : Rat) / 13953362653838316) [(1, 1), (11, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 137 for generator 4. -/
theorem ep_Q2_024_partial_04_0137_valid :
    mulPoly ep_Q2_024_coefficient_04_0137
        ep_Q2_024_generator_04_0100_0199 =
      ep_Q2_024_partial_04_0137 := by
  native_decide

/-- Coefficient term 138 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0138 : Poly :=
[
  term ((150029597432773295116860635735682882826 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (12, 2), (13, 1)]
]

/-- Partial product 138 for generator 4. -/
def ep_Q2_024_partial_04_0138 : Poly :=
[
  term ((150029597432773295116860635735682882826 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 2), (12, 2), (13, 1)],
  term ((150029597432773295116860635735682882826 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 2), (12, 2), (13, 1)],
  term ((-150029597432773295116860635735682882826 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (10, 2), (12, 2), (13, 1)],
  term ((-150029597432773295116860635735682882826 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (11, 2), (12, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 138 for generator 4. -/
theorem ep_Q2_024_partial_04_0138_valid :
    mulPoly ep_Q2_024_coefficient_04_0138
        ep_Q2_024_generator_04_0100_0199 =
      ep_Q2_024_partial_04_0138 := by
  native_decide

/-- Coefficient term 139 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0139 : Poly :=
[
  term ((-34309742980469230273036227499528052253454082876746523343 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(1, 1), (12, 2), (15, 1)]
]

/-- Partial product 139 for generator 4. -/
def ep_Q2_024_partial_04_0139 : Poly :=
[
  term ((-34309742980469230273036227499528052253454082876746523343 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(1, 1), (2, 2), (12, 2), (15, 1)],
  term ((-34309742980469230273036227499528052253454082876746523343 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(1, 1), (3, 2), (12, 2), (15, 1)],
  term ((34309742980469230273036227499528052253454082876746523343 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(1, 1), (10, 2), (12, 2), (15, 1)],
  term ((34309742980469230273036227499528052253454082876746523343 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(1, 1), (11, 2), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 139 for generator 4. -/
theorem ep_Q2_024_partial_04_0139_valid :
    mulPoly ep_Q2_024_coefficient_04_0139
        ep_Q2_024_generator_04_0100_0199 =
      ep_Q2_024_partial_04_0139 := by
  native_decide

/-- Coefficient term 140 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0140 : Poly :=
[
  term ((10583180282864679 : Rat) / 2325560442306386) [(1, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 140 for generator 4. -/
def ep_Q2_024_partial_04_0140 : Poly :=
[
  term ((10583180282864679 : Rat) / 2325560442306386) [(1, 1), (2, 2), (12, 2), (15, 1), (16, 1)],
  term ((10583180282864679 : Rat) / 2325560442306386) [(1, 1), (3, 2), (12, 2), (15, 1), (16, 1)],
  term ((-10583180282864679 : Rat) / 2325560442306386) [(1, 1), (10, 2), (12, 2), (15, 1), (16, 1)],
  term ((-10583180282864679 : Rat) / 2325560442306386) [(1, 1), (11, 2), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 140 for generator 4. -/
theorem ep_Q2_024_partial_04_0140_valid :
    mulPoly ep_Q2_024_coefficient_04_0140
        ep_Q2_024_generator_04_0100_0199 =
      ep_Q2_024_partial_04_0140 := by
  native_decide

/-- Coefficient term 141 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0141 : Poly :=
[
  term ((967263607659529653252972677120516194336 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (13, 1)]
]

/-- Partial product 141 for generator 4. -/
def ep_Q2_024_partial_04_0141 : Poly :=
[
  term ((967263607659529653252972677120516194336 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 2), (13, 1)],
  term ((967263607659529653252972677120516194336 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 2), (13, 1)],
  term ((-967263607659529653252972677120516194336 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (10, 2), (13, 1)],
  term ((-967263607659529653252972677120516194336 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 141 for generator 4. -/
theorem ep_Q2_024_partial_04_0141_valid :
    mulPoly ep_Q2_024_coefficient_04_0141
        ep_Q2_024_generator_04_0100_0199 =
      ep_Q2_024_partial_04_0141 := by
  native_decide

/-- Coefficient term 142 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0142 : Poly :=
[
  term ((-2942250948635783867709597036664704350144 : Rat) / 359912837220743188970008058408861780397) [(1, 1), (13, 1), (14, 1)]
]

/-- Partial product 142 for generator 4. -/
def ep_Q2_024_partial_04_0142 : Poly :=
[
  term ((-2942250948635783867709597036664704350144 : Rat) / 359912837220743188970008058408861780397) [(1, 1), (2, 2), (13, 1), (14, 1)],
  term ((-2942250948635783867709597036664704350144 : Rat) / 359912837220743188970008058408861780397) [(1, 1), (3, 2), (13, 1), (14, 1)],
  term ((2942250948635783867709597036664704350144 : Rat) / 359912837220743188970008058408861780397) [(1, 1), (10, 2), (13, 1), (14, 1)],
  term ((2942250948635783867709597036664704350144 : Rat) / 359912837220743188970008058408861780397) [(1, 1), (11, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 142 for generator 4. -/
theorem ep_Q2_024_partial_04_0142_valid :
    mulPoly ep_Q2_024_coefficient_04_0142
        ep_Q2_024_generator_04_0100_0199 =
      ep_Q2_024_partial_04_0142 := by
  native_decide

/-- Coefficient term 143 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0143 : Poly :=
[
  term ((2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (13, 1), (14, 2)]
]

/-- Partial product 143 for generator 4. -/
def ep_Q2_024_partial_04_0143 : Poly :=
[
  term ((2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 2), (13, 1), (14, 2)],
  term ((2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 2), (13, 1), (14, 2)],
  term ((-2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (10, 2), (13, 1), (14, 2)],
  term ((-2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (11, 2), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 143 for generator 4. -/
theorem ep_Q2_024_partial_04_0143_valid :
    mulPoly ep_Q2_024_coefficient_04_0143
        ep_Q2_024_generator_04_0100_0199 =
      ep_Q2_024_partial_04_0143 := by
  native_decide

/-- Coefficient term 144 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0144 : Poly :=
[
  term ((15109217256518315323716689223387286634317328803199609516 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (13, 1), (15, 2)]
]

/-- Partial product 144 for generator 4. -/
def ep_Q2_024_partial_04_0144 : Poly :=
[
  term ((15109217256518315323716689223387286634317328803199609516 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (2, 2), (13, 1), (15, 2)],
  term ((15109217256518315323716689223387286634317328803199609516 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (3, 2), (13, 1), (15, 2)],
  term ((-15109217256518315323716689223387286634317328803199609516 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (10, 2), (13, 1), (15, 2)],
  term ((-15109217256518315323716689223387286634317328803199609516 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (11, 2), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 144 for generator 4. -/
theorem ep_Q2_024_partial_04_0144_valid :
    mulPoly ep_Q2_024_coefficient_04_0144
        ep_Q2_024_generator_04_0100_0199 =
      ep_Q2_024_partial_04_0144 := by
  native_decide

/-- Coefficient term 145 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0145 : Poly :=
[
  term ((-2130221066942416 : Rat) / 1162780221153193) [(1, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 145 for generator 4. -/
def ep_Q2_024_partial_04_0145 : Poly :=
[
  term ((-2130221066942416 : Rat) / 1162780221153193) [(1, 1), (2, 2), (13, 1), (15, 2), (16, 1)],
  term ((-2130221066942416 : Rat) / 1162780221153193) [(1, 1), (3, 2), (13, 1), (15, 2), (16, 1)],
  term ((2130221066942416 : Rat) / 1162780221153193) [(1, 1), (10, 2), (13, 1), (15, 2), (16, 1)],
  term ((2130221066942416 : Rat) / 1162780221153193) [(1, 1), (11, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 145 for generator 4. -/
theorem ep_Q2_024_partial_04_0145_valid :
    mulPoly ep_Q2_024_coefficient_04_0145
        ep_Q2_024_generator_04_0100_0199 =
      ep_Q2_024_partial_04_0145 := by
  native_decide

/-- Coefficient term 146 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0146 : Poly :=
[
  term ((-11530512132661982754025626129402130138490986283296027556 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (13, 2), (15, 1)]
]

/-- Partial product 146 for generator 4. -/
def ep_Q2_024_partial_04_0146 : Poly :=
[
  term ((-11530512132661982754025626129402130138490986283296027556 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (2, 2), (13, 2), (15, 1)],
  term ((-11530512132661982754025626129402130138490986283296027556 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (3, 2), (13, 2), (15, 1)],
  term ((11530512132661982754025626129402130138490986283296027556 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (10, 2), (13, 2), (15, 1)],
  term ((11530512132661982754025626129402130138490986283296027556 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (11, 2), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 146 for generator 4. -/
theorem ep_Q2_024_partial_04_0146_valid :
    mulPoly ep_Q2_024_coefficient_04_0146
        ep_Q2_024_generator_04_0100_0199 =
      ep_Q2_024_partial_04_0146 := by
  native_decide

/-- Coefficient term 147 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0147 : Poly :=
[
  term ((150661185588720 : Rat) / 1162780221153193) [(1, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 147 for generator 4. -/
def ep_Q2_024_partial_04_0147 : Poly :=
[
  term ((150661185588720 : Rat) / 1162780221153193) [(1, 1), (2, 2), (13, 2), (15, 1), (16, 1)],
  term ((150661185588720 : Rat) / 1162780221153193) [(1, 1), (3, 2), (13, 2), (15, 1), (16, 1)],
  term ((-150661185588720 : Rat) / 1162780221153193) [(1, 1), (10, 2), (13, 2), (15, 1), (16, 1)],
  term ((-150661185588720 : Rat) / 1162780221153193) [(1, 1), (11, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 147 for generator 4. -/
theorem ep_Q2_024_partial_04_0147_valid :
    mulPoly ep_Q2_024_coefficient_04_0147
        ep_Q2_024_generator_04_0100_0199 =
      ep_Q2_024_partial_04_0147 := by
  native_decide

/-- Coefficient term 148 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0148 : Poly :=
[
  term ((80945856112067634232098240062478093344 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (13, 3)]
]

/-- Partial product 148 for generator 4. -/
def ep_Q2_024_partial_04_0148 : Poly :=
[
  term ((80945856112067634232098240062478093344 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 2), (13, 3)],
  term ((80945856112067634232098240062478093344 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 2), (13, 3)],
  term ((-80945856112067634232098240062478093344 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (10, 2), (13, 3)],
  term ((-80945856112067634232098240062478093344 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (11, 2), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 148 for generator 4. -/
theorem ep_Q2_024_partial_04_0148_valid :
    mulPoly ep_Q2_024_coefficient_04_0148
        ep_Q2_024_generator_04_0100_0199 =
      ep_Q2_024_partial_04_0148 := by
  native_decide

/-- Coefficient term 149 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0149 : Poly :=
[
  term ((-155216583566580225900217744989856299960430278135964738511 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(1, 1), (14, 1), (15, 1)]
]

/-- Partial product 149 for generator 4. -/
def ep_Q2_024_partial_04_0149 : Poly :=
[
  term ((-155216583566580225900217744989856299960430278135964738511 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(1, 1), (2, 2), (14, 1), (15, 1)],
  term ((-155216583566580225900217744989856299960430278135964738511 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(1, 1), (3, 2), (14, 1), (15, 1)],
  term ((155216583566580225900217744989856299960430278135964738511 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(1, 1), (10, 2), (14, 1), (15, 1)],
  term ((155216583566580225900217744989856299960430278135964738511 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(1, 1), (11, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 149 for generator 4. -/
theorem ep_Q2_024_partial_04_0149_valid :
    mulPoly ep_Q2_024_coefficient_04_0149
        ep_Q2_024_generator_04_0100_0199 =
      ep_Q2_024_partial_04_0149 := by
  native_decide

/-- Coefficient term 150 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0150 : Poly :=
[
  term ((-104769794997375257 : Rat) / 13953362653838316) [(1, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 150 for generator 4. -/
def ep_Q2_024_partial_04_0150 : Poly :=
[
  term ((-104769794997375257 : Rat) / 13953362653838316) [(1, 1), (2, 2), (14, 1), (15, 1), (16, 1)],
  term ((-104769794997375257 : Rat) / 13953362653838316) [(1, 1), (3, 2), (14, 1), (15, 1), (16, 1)],
  term ((104769794997375257 : Rat) / 13953362653838316) [(1, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((104769794997375257 : Rat) / 13953362653838316) [(1, 1), (11, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 150 for generator 4. -/
theorem ep_Q2_024_partial_04_0150_valid :
    mulPoly ep_Q2_024_coefficient_04_0150
        ep_Q2_024_generator_04_0100_0199 =
      ep_Q2_024_partial_04_0150 := by
  native_decide

/-- Coefficient term 151 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0151 : Poly :=
[
  term ((168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (14, 2), (15, 1)]
]

/-- Partial product 151 for generator 4. -/
def ep_Q2_024_partial_04_0151 : Poly :=
[
  term ((168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (2, 2), (14, 2), (15, 1)],
  term ((168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (3, 2), (14, 2), (15, 1)],
  term ((-168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (10, 2), (14, 2), (15, 1)],
  term ((-168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (11, 2), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 151 for generator 4. -/
theorem ep_Q2_024_partial_04_0151_valid :
    mulPoly ep_Q2_024_coefficient_04_0151
        ep_Q2_024_generator_04_0100_0199 =
      ep_Q2_024_partial_04_0151 := by
  native_decide

/-- Coefficient term 152 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0152 : Poly :=
[
  term ((416983870520476 : Rat) / 1162780221153193) [(1, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 152 for generator 4. -/
def ep_Q2_024_partial_04_0152 : Poly :=
[
  term ((416983870520476 : Rat) / 1162780221153193) [(1, 1), (2, 2), (14, 2), (15, 1), (16, 1)],
  term ((416983870520476 : Rat) / 1162780221153193) [(1, 1), (3, 2), (14, 2), (15, 1), (16, 1)],
  term ((-416983870520476 : Rat) / 1162780221153193) [(1, 1), (10, 2), (14, 2), (15, 1), (16, 1)],
  term ((-416983870520476 : Rat) / 1162780221153193) [(1, 1), (11, 2), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 152 for generator 4. -/
theorem ep_Q2_024_partial_04_0152_valid :
    mulPoly ep_Q2_024_coefficient_04_0152
        ep_Q2_024_generator_04_0100_0199 =
      ep_Q2_024_partial_04_0152 := by
  native_decide

/-- Coefficient term 153 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0153 : Poly :=
[
  term ((-188347273819568219221983921640781695233068275354761839753 : Rat) / 13391984910701085386468737404042228923529788494763443872) [(1, 1), (15, 1)]
]

/-- Partial product 153 for generator 4. -/
def ep_Q2_024_partial_04_0153 : Poly :=
[
  term ((-188347273819568219221983921640781695233068275354761839753 : Rat) / 13391984910701085386468737404042228923529788494763443872) [(1, 1), (2, 2), (15, 1)],
  term ((-188347273819568219221983921640781695233068275354761839753 : Rat) / 13391984910701085386468737404042228923529788494763443872) [(1, 1), (3, 2), (15, 1)],
  term ((188347273819568219221983921640781695233068275354761839753 : Rat) / 13391984910701085386468737404042228923529788494763443872) [(1, 1), (10, 2), (15, 1)],
  term ((188347273819568219221983921640781695233068275354761839753 : Rat) / 13391984910701085386468737404042228923529788494763443872) [(1, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 153 for generator 4. -/
theorem ep_Q2_024_partial_04_0153_valid :
    mulPoly ep_Q2_024_coefficient_04_0153
        ep_Q2_024_generator_04_0100_0199 =
      ep_Q2_024_partial_04_0153 := by
  native_decide

/-- Coefficient term 154 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0154 : Poly :=
[
  term ((-8595027872996923 : Rat) / 9302241769225544) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 154 for generator 4. -/
def ep_Q2_024_partial_04_0154 : Poly :=
[
  term ((-8595027872996923 : Rat) / 9302241769225544) [(1, 1), (2, 2), (15, 1), (16, 1)],
  term ((-8595027872996923 : Rat) / 9302241769225544) [(1, 1), (3, 2), (15, 1), (16, 1)],
  term ((8595027872996923 : Rat) / 9302241769225544) [(1, 1), (10, 2), (15, 1), (16, 1)],
  term ((8595027872996923 : Rat) / 9302241769225544) [(1, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 154 for generator 4. -/
theorem ep_Q2_024_partial_04_0154_valid :
    mulPoly ep_Q2_024_coefficient_04_0154
        ep_Q2_024_generator_04_0100_0199 =
      ep_Q2_024_partial_04_0154 := by
  native_decide

/-- Coefficient term 155 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0155 : Poly :=
[
  term ((74315340039547725559312259812600750296 : Rat) / 199951576233746216094448921338256544665) [(1, 2), (5, 1), (9, 1)]
]

/-- Partial product 155 for generator 4. -/
def ep_Q2_024_partial_04_0155 : Poly :=
[
  term ((74315340039547725559312259812600750296 : Rat) / 199951576233746216094448921338256544665) [(1, 2), (2, 2), (5, 1), (9, 1)],
  term ((74315340039547725559312259812600750296 : Rat) / 199951576233746216094448921338256544665) [(1, 2), (3, 2), (5, 1), (9, 1)],
  term ((-74315340039547725559312259812600750296 : Rat) / 199951576233746216094448921338256544665) [(1, 2), (5, 1), (9, 1), (10, 2)],
  term ((-74315340039547725559312259812600750296 : Rat) / 199951576233746216094448921338256544665) [(1, 2), (5, 1), (9, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 155 for generator 4. -/
theorem ep_Q2_024_partial_04_0155_valid :
    mulPoly ep_Q2_024_coefficient_04_0155
        ep_Q2_024_generator_04_0100_0199 =
      ep_Q2_024_partial_04_0155 := by
  native_decide

/-- Coefficient term 156 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0156 : Poly :=
[
  term ((18814653013077998797594975567745790320 : Rat) / 39990315246749243218889784267651308933) [(1, 2), (5, 1), (13, 1)]
]

/-- Partial product 156 for generator 4. -/
def ep_Q2_024_partial_04_0156 : Poly :=
[
  term ((18814653013077998797594975567745790320 : Rat) / 39990315246749243218889784267651308933) [(1, 2), (2, 2), (5, 1), (13, 1)],
  term ((18814653013077998797594975567745790320 : Rat) / 39990315246749243218889784267651308933) [(1, 2), (3, 2), (5, 1), (13, 1)],
  term ((-18814653013077998797594975567745790320 : Rat) / 39990315246749243218889784267651308933) [(1, 2), (5, 1), (10, 2), (13, 1)],
  term ((-18814653013077998797594975567745790320 : Rat) / 39990315246749243218889784267651308933) [(1, 2), (5, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 156 for generator 4. -/
theorem ep_Q2_024_partial_04_0156_valid :
    mulPoly ep_Q2_024_coefficient_04_0156
        ep_Q2_024_generator_04_0100_0199 =
      ep_Q2_024_partial_04_0156 := by
  native_decide

/-- Coefficient term 157 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0157 : Poly :=
[
  term ((-4709452313689102959952359037768309908427113710033463304 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 2), (5, 1), (15, 1)]
]

/-- Partial product 157 for generator 4. -/
def ep_Q2_024_partial_04_0157 : Poly :=
[
  term ((-4709452313689102959952359037768309908427113710033463304 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 2), (2, 2), (5, 1), (15, 1)],
  term ((-4709452313689102959952359037768309908427113710033463304 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 2), (3, 2), (5, 1), (15, 1)],
  term ((4709452313689102959952359037768309908427113710033463304 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 2), (5, 1), (10, 2), (15, 1)],
  term ((4709452313689102959952359037768309908427113710033463304 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 2), (5, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 157 for generator 4. -/
theorem ep_Q2_024_partial_04_0157_valid :
    mulPoly ep_Q2_024_coefficient_04_0157
        ep_Q2_024_generator_04_0100_0199 =
      ep_Q2_024_partial_04_0157 := by
  native_decide

/-- Coefficient term 158 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0158 : Poly :=
[
  term ((-1709530353079456 : Rat) / 1162780221153193) [(1, 2), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 158 for generator 4. -/
def ep_Q2_024_partial_04_0158 : Poly :=
[
  term ((-1709530353079456 : Rat) / 1162780221153193) [(1, 2), (2, 2), (5, 1), (15, 1), (16, 1)],
  term ((-1709530353079456 : Rat) / 1162780221153193) [(1, 2), (3, 2), (5, 1), (15, 1), (16, 1)],
  term ((1709530353079456 : Rat) / 1162780221153193) [(1, 2), (5, 1), (10, 2), (15, 1), (16, 1)],
  term ((1709530353079456 : Rat) / 1162780221153193) [(1, 2), (5, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 158 for generator 4. -/
theorem ep_Q2_024_partial_04_0158_valid :
    mulPoly ep_Q2_024_coefficient_04_0158
        ep_Q2_024_generator_04_0100_0199 =
      ep_Q2_024_partial_04_0158 := by
  native_decide

/-- Coefficient term 159 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0159 : Poly :=
[
  term ((-168275490781721316360423721329958090392 : Rat) / 199951576233746216094448921338256544665) [(1, 2), (9, 1), (15, 1)]
]

/-- Partial product 159 for generator 4. -/
def ep_Q2_024_partial_04_0159 : Poly :=
[
  term ((-168275490781721316360423721329958090392 : Rat) / 199951576233746216094448921338256544665) [(1, 2), (2, 2), (9, 1), (15, 1)],
  term ((-168275490781721316360423721329958090392 : Rat) / 199951576233746216094448921338256544665) [(1, 2), (3, 2), (9, 1), (15, 1)],
  term ((168275490781721316360423721329958090392 : Rat) / 199951576233746216094448921338256544665) [(1, 2), (9, 1), (10, 2), (15, 1)],
  term ((168275490781721316360423721329958090392 : Rat) / 199951576233746216094448921338256544665) [(1, 2), (9, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 159 for generator 4. -/
theorem ep_Q2_024_partial_04_0159_valid :
    mulPoly ep_Q2_024_coefficient_04_0159
        ep_Q2_024_generator_04_0100_0199 =
      ep_Q2_024_partial_04_0159 := by
  native_decide

/-- Coefficient term 160 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0160 : Poly :=
[
  term ((242292653066826458978527776170255754448 : Rat) / 199951576233746216094448921338256544665) [(1, 2), (13, 1), (15, 1)]
]

/-- Partial product 160 for generator 4. -/
def ep_Q2_024_partial_04_0160 : Poly :=
[
  term ((242292653066826458978527776170255754448 : Rat) / 199951576233746216094448921338256544665) [(1, 2), (2, 2), (13, 1), (15, 1)],
  term ((242292653066826458978527776170255754448 : Rat) / 199951576233746216094448921338256544665) [(1, 2), (3, 2), (13, 1), (15, 1)],
  term ((-242292653066826458978527776170255754448 : Rat) / 199951576233746216094448921338256544665) [(1, 2), (10, 2), (13, 1), (15, 1)],
  term ((-242292653066826458978527776170255754448 : Rat) / 199951576233746216094448921338256544665) [(1, 2), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 160 for generator 4. -/
theorem ep_Q2_024_partial_04_0160_valid :
    mulPoly ep_Q2_024_coefficient_04_0160
        ep_Q2_024_generator_04_0100_0199 =
      ep_Q2_024_partial_04_0160 := by
  native_decide

/-- Coefficient term 161 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0161 : Poly :=
[
  term ((228548346943902101627953017098607070723838550969230898109 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(1, 2), (15, 2)]
]

/-- Partial product 161 for generator 4. -/
def ep_Q2_024_partial_04_0161 : Poly :=
[
  term ((228548346943902101627953017098607070723838550969230898109 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(1, 2), (2, 2), (15, 2)],
  term ((228548346943902101627953017098607070723838550969230898109 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(1, 2), (3, 2), (15, 2)],
  term ((-228548346943902101627953017098607070723838550969230898109 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(1, 2), (10, 2), (15, 2)],
  term ((-228548346943902101627953017098607070723838550969230898109 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(1, 2), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 161 for generator 4. -/
theorem ep_Q2_024_partial_04_0161_valid :
    mulPoly ep_Q2_024_coefficient_04_0161
        ep_Q2_024_generator_04_0100_0199 =
      ep_Q2_024_partial_04_0161 := by
  native_decide

/-- Coefficient term 162 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0162 : Poly :=
[
  term ((-9851670194564511 : Rat) / 1162780221153193) [(1, 2), (15, 2), (16, 1)]
]

/-- Partial product 162 for generator 4. -/
def ep_Q2_024_partial_04_0162 : Poly :=
[
  term ((-9851670194564511 : Rat) / 1162780221153193) [(1, 2), (2, 2), (15, 2), (16, 1)],
  term ((-9851670194564511 : Rat) / 1162780221153193) [(1, 2), (3, 2), (15, 2), (16, 1)],
  term ((9851670194564511 : Rat) / 1162780221153193) [(1, 2), (10, 2), (15, 2), (16, 1)],
  term ((9851670194564511 : Rat) / 1162780221153193) [(1, 2), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 162 for generator 4. -/
theorem ep_Q2_024_partial_04_0162_valid :
    mulPoly ep_Q2_024_coefficient_04_0162
        ep_Q2_024_generator_04_0100_0199 =
      ep_Q2_024_partial_04_0162 := by
  native_decide

/-- Coefficient term 163 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0163 : Poly :=
[
  term ((8838886483165088967005567625924723984461 : Rat) / 3599128372207431889700080584088617803970) [(2, 1)]
]

/-- Partial product 163 for generator 4. -/
def ep_Q2_024_partial_04_0163 : Poly :=
[
  term ((8838886483165088967005567625924723984461 : Rat) / 3599128372207431889700080584088617803970) [(2, 1), (3, 2)],
  term ((-8838886483165088967005567625924723984461 : Rat) / 3599128372207431889700080584088617803970) [(2, 1), (10, 2)],
  term ((-8838886483165088967005567625924723984461 : Rat) / 3599128372207431889700080584088617803970) [(2, 1), (11, 2)],
  term ((8838886483165088967005567625924723984461 : Rat) / 3599128372207431889700080584088617803970) [(2, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 163 for generator 4. -/
theorem ep_Q2_024_partial_04_0163_valid :
    mulPoly ep_Q2_024_coefficient_04_0163
        ep_Q2_024_generator_04_0100_0199 =
      ep_Q2_024_partial_04_0163 := by
  native_decide

/-- Coefficient term 164 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0164 : Poly :=
[
  term ((-384550739231878026724416082483894862344 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (3, 1), (9, 1)]
]

/-- Partial product 164 for generator 4. -/
def ep_Q2_024_partial_04_0164 : Poly :=
[
  term ((384550739231878026724416082483894862344 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (3, 1), (9, 1), (10, 2)],
  term ((384550739231878026724416082483894862344 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (3, 1), (9, 1), (11, 2)],
  term ((-384550739231878026724416082483894862344 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (3, 3), (9, 1)],
  term ((-384550739231878026724416082483894862344 : Rat) / 199951576233746216094448921338256544665) [(2, 3), (3, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 164 for generator 4. -/
theorem ep_Q2_024_partial_04_0164_valid :
    mulPoly ep_Q2_024_coefficient_04_0164
        ep_Q2_024_generator_04_0100_0199 =
      ep_Q2_024_partial_04_0164 := by
  native_decide

/-- Coefficient term 165 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0165 : Poly :=
[
  term ((49794017268134571589590260644228965512 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (3, 1), (12, 1), (13, 1)]
]

/-- Partial product 165 for generator 4. -/
def ep_Q2_024_partial_04_0165 : Poly :=
[
  term ((-49794017268134571589590260644228965512 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (3, 1), (10, 2), (12, 1), (13, 1)],
  term ((-49794017268134571589590260644228965512 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (3, 1), (11, 2), (12, 1), (13, 1)],
  term ((49794017268134571589590260644228965512 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (3, 3), (12, 1), (13, 1)],
  term ((49794017268134571589590260644228965512 : Rat) / 199951576233746216094448921338256544665) [(2, 3), (3, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 165 for generator 4. -/
theorem ep_Q2_024_partial_04_0165_valid :
    mulPoly ep_Q2_024_coefficient_04_0165
        ep_Q2_024_generator_04_0100_0199 =
      ep_Q2_024_partial_04_0165 := by
  native_decide

/-- Coefficient term 166 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0166 : Poly :=
[
  term ((-550464729340465184219154740052350989658090880526284951 : Rat) / 92999895213201981850477343083626589746734642324746138) [(2, 1), (3, 1), (12, 1), (15, 1)]
]

/-- Partial product 166 for generator 4. -/
def ep_Q2_024_partial_04_0166 : Poly :=
[
  term ((550464729340465184219154740052350989658090880526284951 : Rat) / 92999895213201981850477343083626589746734642324746138) [(2, 1), (3, 1), (10, 2), (12, 1), (15, 1)],
  term ((550464729340465184219154740052350989658090880526284951 : Rat) / 92999895213201981850477343083626589746734642324746138) [(2, 1), (3, 1), (11, 2), (12, 1), (15, 1)],
  term ((-550464729340465184219154740052350989658090880526284951 : Rat) / 92999895213201981850477343083626589746734642324746138) [(2, 1), (3, 3), (12, 1), (15, 1)],
  term ((-550464729340465184219154740052350989658090880526284951 : Rat) / 92999895213201981850477343083626589746734642324746138) [(2, 3), (3, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 166 for generator 4. -/
theorem ep_Q2_024_partial_04_0166_valid :
    mulPoly ep_Q2_024_coefficient_04_0166
        ep_Q2_024_generator_04_0100_0199 =
      ep_Q2_024_partial_04_0166 := by
  native_decide

/-- Coefficient term 167 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0167 : Poly :=
[
  term ((1303385041578966 : Rat) / 1162780221153193) [(2, 1), (3, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 167 for generator 4. -/
def ep_Q2_024_partial_04_0167 : Poly :=
[
  term ((-1303385041578966 : Rat) / 1162780221153193) [(2, 1), (3, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((-1303385041578966 : Rat) / 1162780221153193) [(2, 1), (3, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((1303385041578966 : Rat) / 1162780221153193) [(2, 1), (3, 3), (12, 1), (15, 1), (16, 1)],
  term ((1303385041578966 : Rat) / 1162780221153193) [(2, 3), (3, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 167 for generator 4. -/
theorem ep_Q2_024_partial_04_0167_valid :
    mulPoly ep_Q2_024_coefficient_04_0167
        ep_Q2_024_generator_04_0100_0199 =
      ep_Q2_024_partial_04_0167 := by
  native_decide

/-- Coefficient term 168 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0168 : Poly :=
[
  term ((-1752242829965026750387737683564999916532 : Rat) / 1799564186103715944850040292044308901985) [(2, 1), (3, 1), (13, 1)]
]

/-- Partial product 168 for generator 4. -/
def ep_Q2_024_partial_04_0168 : Poly :=
[
  term ((1752242829965026750387737683564999916532 : Rat) / 1799564186103715944850040292044308901985) [(2, 1), (3, 1), (10, 2), (13, 1)],
  term ((1752242829965026750387737683564999916532 : Rat) / 1799564186103715944850040292044308901985) [(2, 1), (3, 1), (11, 2), (13, 1)],
  term ((-1752242829965026750387737683564999916532 : Rat) / 1799564186103715944850040292044308901985) [(2, 1), (3, 3), (13, 1)],
  term ((-1752242829965026750387737683564999916532 : Rat) / 1799564186103715944850040292044308901985) [(2, 3), (3, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 168 for generator 4. -/
theorem ep_Q2_024_partial_04_0168_valid :
    mulPoly ep_Q2_024_coefficient_04_0168
        ep_Q2_024_generator_04_0100_0199 =
      ep_Q2_024_partial_04_0168 := by
  native_decide

/-- Coefficient term 169 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0169 : Poly :=
[
  term ((-3754221193578629608236243814291749212259078128745014103 : Rat) / 929998952132019818504773430836265897467346423247461380) [(2, 1), (3, 1), (15, 1)]
]

/-- Partial product 169 for generator 4. -/
def ep_Q2_024_partial_04_0169 : Poly :=
[
  term ((3754221193578629608236243814291749212259078128745014103 : Rat) / 929998952132019818504773430836265897467346423247461380) [(2, 1), (3, 1), (10, 2), (15, 1)],
  term ((3754221193578629608236243814291749212259078128745014103 : Rat) / 929998952132019818504773430836265897467346423247461380) [(2, 1), (3, 1), (11, 2), (15, 1)],
  term ((-3754221193578629608236243814291749212259078128745014103 : Rat) / 929998952132019818504773430836265897467346423247461380) [(2, 1), (3, 3), (15, 1)],
  term ((-3754221193578629608236243814291749212259078128745014103 : Rat) / 929998952132019818504773430836265897467346423247461380) [(2, 3), (3, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 169 for generator 4. -/
theorem ep_Q2_024_partial_04_0169_valid :
    mulPoly ep_Q2_024_coefficient_04_0169
        ep_Q2_024_generator_04_0100_0199 =
      ep_Q2_024_partial_04_0169 := by
  native_decide

/-- Coefficient term 170 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0170 : Poly :=
[
  term ((966109193298565 : Rat) / 3488340663459579) [(2, 1), (3, 1), (15, 1), (16, 1)]
]

/-- Partial product 170 for generator 4. -/
def ep_Q2_024_partial_04_0170 : Poly :=
[
  term ((-966109193298565 : Rat) / 3488340663459579) [(2, 1), (3, 1), (10, 2), (15, 1), (16, 1)],
  term ((-966109193298565 : Rat) / 3488340663459579) [(2, 1), (3, 1), (11, 2), (15, 1), (16, 1)],
  term ((966109193298565 : Rat) / 3488340663459579) [(2, 1), (3, 3), (15, 1), (16, 1)],
  term ((966109193298565 : Rat) / 3488340663459579) [(2, 3), (3, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 170 for generator 4. -/
theorem ep_Q2_024_partial_04_0170_valid :
    mulPoly ep_Q2_024_coefficient_04_0170
        ep_Q2_024_generator_04_0100_0199 =
      ep_Q2_024_partial_04_0170 := by
  native_decide

/-- Coefficient term 171 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0171 : Poly :=
[
  term ((-4281089153612859170931146538257430160 : Rat) / 119970945740247729656669352802953926799) [(2, 1), (3, 2)]
]

/-- Partial product 171 for generator 4. -/
def ep_Q2_024_partial_04_0171 : Poly :=
[
  term ((4281089153612859170931146538257430160 : Rat) / 119970945740247729656669352802953926799) [(2, 1), (3, 2), (10, 2)],
  term ((4281089153612859170931146538257430160 : Rat) / 119970945740247729656669352802953926799) [(2, 1), (3, 2), (11, 2)],
  term ((-4281089153612859170931146538257430160 : Rat) / 119970945740247729656669352802953926799) [(2, 1), (3, 4)],
  term ((-4281089153612859170931146538257430160 : Rat) / 119970945740247729656669352802953926799) [(2, 3), (3, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 171 for generator 4. -/
theorem ep_Q2_024_partial_04_0171_valid :
    mulPoly ep_Q2_024_coefficient_04_0171
        ep_Q2_024_generator_04_0100_0199 =
      ep_Q2_024_partial_04_0171 := by
  native_decide

/-- Coefficient term 172 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0172 : Poly :=
[
  term ((-732537308678412778282669871950328022754 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (4, 1)]
]

/-- Partial product 172 for generator 4. -/
def ep_Q2_024_partial_04_0172 : Poly :=
[
  term ((-732537308678412778282669871950328022754 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (3, 2), (4, 1)],
  term ((732537308678412778282669871950328022754 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (4, 1), (10, 2)],
  term ((732537308678412778282669871950328022754 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (4, 1), (11, 2)],
  term ((-732537308678412778282669871950328022754 : Rat) / 599854728701238648283346764014769633995) [(2, 3), (4, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 172 for generator 4. -/
theorem ep_Q2_024_partial_04_0172_valid :
    mulPoly ep_Q2_024_coefficient_04_0172
        ep_Q2_024_generator_04_0100_0199 =
      ep_Q2_024_partial_04_0172 := by
  native_decide

/-- Coefficient term 173 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0173 : Poly :=
[
  term ((-522235060517320235301229065697721790572 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (5, 1), (9, 1)]
]

/-- Partial product 173 for generator 4. -/
def ep_Q2_024_partial_04_0173 : Poly :=
[
  term ((-522235060517320235301229065697721790572 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (3, 2), (5, 1), (9, 1)],
  term ((522235060517320235301229065697721790572 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (5, 1), (9, 1), (10, 2)],
  term ((522235060517320235301229065697721790572 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (5, 1), (9, 1), (11, 2)],
  term ((-522235060517320235301229065697721790572 : Rat) / 199951576233746216094448921338256544665) [(2, 3), (5, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 173 for generator 4. -/
theorem ep_Q2_024_partial_04_0173_valid :
    mulPoly ep_Q2_024_coefficient_04_0173
        ep_Q2_024_generator_04_0100_0199 =
      ep_Q2_024_partial_04_0173 := by
  native_decide

/-- Coefficient term 174 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0174 : Poly :=
[
  term ((-244075067403674486867873273412360623676 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (5, 1), (11, 1)]
]

/-- Partial product 174 for generator 4. -/
def ep_Q2_024_partial_04_0174 : Poly :=
[
  term ((-244075067403674486867873273412360623676 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (3, 2), (5, 1), (11, 1)],
  term ((244075067403674486867873273412360623676 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (5, 1), (10, 2), (11, 1)],
  term ((244075067403674486867873273412360623676 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (5, 1), (11, 3)],
  term ((-244075067403674486867873273412360623676 : Rat) / 199951576233746216094448921338256544665) [(2, 3), (5, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 174 for generator 4. -/
theorem ep_Q2_024_partial_04_0174_valid :
    mulPoly ep_Q2_024_coefficient_04_0174
        ep_Q2_024_generator_04_0100_0199 =
      ep_Q2_024_partial_04_0174 := by
  native_decide

/-- Coefficient term 175 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0175 : Poly :=
[
  term ((-8978918525852651872265618308153908376 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (5, 1), (13, 1)]
]

/-- Partial product 175 for generator 4. -/
def ep_Q2_024_partial_04_0175 : Poly :=
[
  term ((-8978918525852651872265618308153908376 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (3, 2), (5, 1), (13, 1)],
  term ((8978918525852651872265618308153908376 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (5, 1), (10, 2), (13, 1)],
  term ((8978918525852651872265618308153908376 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (5, 1), (11, 2), (13, 1)],
  term ((-8978918525852651872265618308153908376 : Rat) / 199951576233746216094448921338256544665) [(2, 3), (5, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 175 for generator 4. -/
theorem ep_Q2_024_partial_04_0175_valid :
    mulPoly ep_Q2_024_coefficient_04_0175
        ep_Q2_024_generator_04_0100_0199 =
      ep_Q2_024_partial_04_0175 := by
  native_decide

/-- Coefficient term 176 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0176 : Poly :=
[
  term ((-13664629938802414707227692096020454758249240054406156697 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(2, 1), (5, 1), (15, 1)]
]

/-- Partial product 176 for generator 4. -/
def ep_Q2_024_partial_04_0176 : Poly :=
[
  term ((-13664629938802414707227692096020454758249240054406156697 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(2, 1), (3, 2), (5, 1), (15, 1)],
  term ((13664629938802414707227692096020454758249240054406156697 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(2, 1), (5, 1), (10, 2), (15, 1)],
  term ((13664629938802414707227692096020454758249240054406156697 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(2, 1), (5, 1), (11, 2), (15, 1)],
  term ((-13664629938802414707227692096020454758249240054406156697 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(2, 3), (5, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 176 for generator 4. -/
theorem ep_Q2_024_partial_04_0176_valid :
    mulPoly ep_Q2_024_coefficient_04_0176
        ep_Q2_024_generator_04_0100_0199 =
      ep_Q2_024_partial_04_0176 := by
  native_decide

/-- Coefficient term 177 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0177 : Poly :=
[
  term ((895992474518854 : Rat) / 1162780221153193) [(2, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 177 for generator 4. -/
def ep_Q2_024_partial_04_0177 : Poly :=
[
  term ((895992474518854 : Rat) / 1162780221153193) [(2, 1), (3, 2), (5, 1), (15, 1), (16, 1)],
  term ((-895992474518854 : Rat) / 1162780221153193) [(2, 1), (5, 1), (10, 2), (15, 1), (16, 1)],
  term ((-895992474518854 : Rat) / 1162780221153193) [(2, 1), (5, 1), (11, 2), (15, 1), (16, 1)],
  term ((895992474518854 : Rat) / 1162780221153193) [(2, 3), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 177 for generator 4. -/
theorem ep_Q2_024_partial_04_0177_valid :
    mulPoly ep_Q2_024_coefficient_04_0177
        ep_Q2_024_generator_04_0100_0199 =
      ep_Q2_024_partial_04_0177 := by
  native_decide

/-- Coefficient term 178 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0178 : Poly :=
[
  term ((-113934139398522877630456776717744776980 : Rat) / 119970945740247729656669352802953926799) [(2, 1), (7, 1), (9, 1)]
]

/-- Partial product 178 for generator 4. -/
def ep_Q2_024_partial_04_0178 : Poly :=
[
  term ((-113934139398522877630456776717744776980 : Rat) / 119970945740247729656669352802953926799) [(2, 1), (3, 2), (7, 1), (9, 1)],
  term ((113934139398522877630456776717744776980 : Rat) / 119970945740247729656669352802953926799) [(2, 1), (7, 1), (9, 1), (10, 2)],
  term ((113934139398522877630456776717744776980 : Rat) / 119970945740247729656669352802953926799) [(2, 1), (7, 1), (9, 1), (11, 2)],
  term ((-113934139398522877630456776717744776980 : Rat) / 119970945740247729656669352802953926799) [(2, 3), (7, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 178 for generator 4. -/
theorem ep_Q2_024_partial_04_0178_valid :
    mulPoly ep_Q2_024_coefficient_04_0178
        ep_Q2_024_generator_04_0100_0199 =
      ep_Q2_024_partial_04_0178 := by
  native_decide

/-- Coefficient term 179 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0179 : Poly :=
[
  term ((518543174883551540146515086812976898784 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (7, 1), (11, 1)]
]

/-- Partial product 179 for generator 4. -/
def ep_Q2_024_partial_04_0179 : Poly :=
[
  term ((518543174883551540146515086812976898784 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (3, 2), (7, 1), (11, 1)],
  term ((-518543174883551540146515086812976898784 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (7, 1), (10, 2), (11, 1)],
  term ((-518543174883551540146515086812976898784 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (7, 1), (11, 3)],
  term ((518543174883551540146515086812976898784 : Rat) / 599854728701238648283346764014769633995) [(2, 3), (7, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 179 for generator 4. -/
theorem ep_Q2_024_partial_04_0179_valid :
    mulPoly ep_Q2_024_coefficient_04_0179
        ep_Q2_024_generator_04_0100_0199 =
      ep_Q2_024_partial_04_0179 := by
  native_decide

/-- Coefficient term 180 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0180 : Poly :=
[
  term ((-49794017268134571589590260644228965512 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (7, 1), (12, 1), (13, 1)]
]

/-- Partial product 180 for generator 4. -/
def ep_Q2_024_partial_04_0180 : Poly :=
[
  term ((-49794017268134571589590260644228965512 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (3, 2), (7, 1), (12, 1), (13, 1)],
  term ((49794017268134571589590260644228965512 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (7, 1), (10, 2), (12, 1), (13, 1)],
  term ((49794017268134571589590260644228965512 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (7, 1), (11, 2), (12, 1), (13, 1)],
  term ((-49794017268134571589590260644228965512 : Rat) / 599854728701238648283346764014769633995) [(2, 3), (7, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 180 for generator 4. -/
theorem ep_Q2_024_partial_04_0180_valid :
    mulPoly ep_Q2_024_coefficient_04_0180
        ep_Q2_024_generator_04_0100_0199 =
      ep_Q2_024_partial_04_0180 := by
  native_decide

/-- Coefficient term 181 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0181 : Poly :=
[
  term ((183488243113488394739718246684116996552696960175428317 : Rat) / 92999895213201981850477343083626589746734642324746138) [(2, 1), (7, 1), (12, 1), (15, 1)]
]

/-- Partial product 181 for generator 4. -/
def ep_Q2_024_partial_04_0181 : Poly :=
[
  term ((183488243113488394739718246684116996552696960175428317 : Rat) / 92999895213201981850477343083626589746734642324746138) [(2, 1), (3, 2), (7, 1), (12, 1), (15, 1)],
  term ((-183488243113488394739718246684116996552696960175428317 : Rat) / 92999895213201981850477343083626589746734642324746138) [(2, 1), (7, 1), (10, 2), (12, 1), (15, 1)],
  term ((-183488243113488394739718246684116996552696960175428317 : Rat) / 92999895213201981850477343083626589746734642324746138) [(2, 1), (7, 1), (11, 2), (12, 1), (15, 1)],
  term ((183488243113488394739718246684116996552696960175428317 : Rat) / 92999895213201981850477343083626589746734642324746138) [(2, 3), (7, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 181 for generator 4. -/
theorem ep_Q2_024_partial_04_0181_valid :
    mulPoly ep_Q2_024_coefficient_04_0181
        ep_Q2_024_generator_04_0100_0199 =
      ep_Q2_024_partial_04_0181 := by
  native_decide

/-- Coefficient term 182 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0182 : Poly :=
[
  term ((-434461680526322 : Rat) / 1162780221153193) [(2, 1), (7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 182 for generator 4. -/
def ep_Q2_024_partial_04_0182 : Poly :=
[
  term ((-434461680526322 : Rat) / 1162780221153193) [(2, 1), (3, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((434461680526322 : Rat) / 1162780221153193) [(2, 1), (7, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((434461680526322 : Rat) / 1162780221153193) [(2, 1), (7, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-434461680526322 : Rat) / 1162780221153193) [(2, 3), (7, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 182 for generator 4. -/
theorem ep_Q2_024_partial_04_0182_valid :
    mulPoly ep_Q2_024_coefficient_04_0182
        ep_Q2_024_generator_04_0100_0199 =
      ep_Q2_024_partial_04_0182 := by
  native_decide

/-- Coefficient term 183 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0183 : Poly :=
[
  term ((52170129068766430306603786468421147060 : Rat) / 119970945740247729656669352802953926799) [(2, 1), (7, 1), (13, 1)]
]

/-- Partial product 183 for generator 4. -/
def ep_Q2_024_partial_04_0183 : Poly :=
[
  term ((52170129068766430306603786468421147060 : Rat) / 119970945740247729656669352802953926799) [(2, 1), (3, 2), (7, 1), (13, 1)],
  term ((-52170129068766430306603786468421147060 : Rat) / 119970945740247729656669352802953926799) [(2, 1), (7, 1), (10, 2), (13, 1)],
  term ((-52170129068766430306603786468421147060 : Rat) / 119970945740247729656669352802953926799) [(2, 1), (7, 1), (11, 2), (13, 1)],
  term ((52170129068766430306603786468421147060 : Rat) / 119970945740247729656669352802953926799) [(2, 3), (7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 183 for generator 4. -/
theorem ep_Q2_024_partial_04_0183_valid :
    mulPoly ep_Q2_024_coefficient_04_0183
        ep_Q2_024_generator_04_0100_0199 =
      ep_Q2_024_partial_04_0183 := by
  native_decide

/-- Coefficient term 184 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0184 : Poly :=
[
  term ((6179138727918710691818933835158696451312183136130255472 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 1), (7, 1), (15, 1)]
]

/-- Partial product 184 for generator 4. -/
def ep_Q2_024_partial_04_0184 : Poly :=
[
  term ((6179138727918710691818933835158696451312183136130255472 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 1), (3, 2), (7, 1), (15, 1)],
  term ((-6179138727918710691818933835158696451312183136130255472 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 1), (7, 1), (10, 2), (15, 1)],
  term ((-6179138727918710691818933835158696451312183136130255472 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 1), (7, 1), (11, 2), (15, 1)],
  term ((6179138727918710691818933835158696451312183136130255472 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 3), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 184 for generator 4. -/
theorem ep_Q2_024_partial_04_0184_valid :
    mulPoly ep_Q2_024_coefficient_04_0184
        ep_Q2_024_generator_04_0100_0199 =
      ep_Q2_024_partial_04_0184 := by
  native_decide

/-- Coefficient term 185 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0185 : Poly :=
[
  term ((6701416651161452 : Rat) / 1162780221153193) [(2, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 185 for generator 4. -/
def ep_Q2_024_partial_04_0185 : Poly :=
[
  term ((6701416651161452 : Rat) / 1162780221153193) [(2, 1), (3, 2), (7, 1), (15, 1), (16, 1)],
  term ((-6701416651161452 : Rat) / 1162780221153193) [(2, 1), (7, 1), (10, 2), (15, 1), (16, 1)],
  term ((-6701416651161452 : Rat) / 1162780221153193) [(2, 1), (7, 1), (11, 2), (15, 1), (16, 1)],
  term ((6701416651161452 : Rat) / 1162780221153193) [(2, 3), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 185 for generator 4. -/
theorem ep_Q2_024_partial_04_0185_valid :
    mulPoly ep_Q2_024_coefficient_04_0185
        ep_Q2_024_generator_04_0100_0199 =
      ep_Q2_024_partial_04_0185 := by
  native_decide

/-- Coefficient term 186 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0186 : Poly :=
[
  term ((397119697749071441202776676699968874332 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (8, 1)]
]

/-- Partial product 186 for generator 4. -/
def ep_Q2_024_partial_04_0186 : Poly :=
[
  term ((397119697749071441202776676699968874332 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (3, 2), (8, 1)],
  term ((-397119697749071441202776676699968874332 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (8, 1), (10, 2)],
  term ((-397119697749071441202776676699968874332 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (8, 1), (11, 2)],
  term ((397119697749071441202776676699968874332 : Rat) / 599854728701238648283346764014769633995) [(2, 3), (8, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 186 for generator 4. -/
theorem ep_Q2_024_partial_04_0186_valid :
    mulPoly ep_Q2_024_coefficient_04_0186
        ep_Q2_024_generator_04_0100_0199 =
      ep_Q2_024_partial_04_0186 := by
  native_decide

/-- Coefficient term 187 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0187 : Poly :=
[
  term ((-580332583183098106794526391365108351352 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (9, 1), (11, 1)]
]

/-- Partial product 187 for generator 4. -/
def ep_Q2_024_partial_04_0187 : Poly :=
[
  term ((-580332583183098106794526391365108351352 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (3, 2), (9, 1), (11, 1)],
  term ((580332583183098106794526391365108351352 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (9, 1), (10, 2), (11, 1)],
  term ((580332583183098106794526391365108351352 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (9, 1), (11, 3)],
  term ((-580332583183098106794526391365108351352 : Rat) / 599854728701238648283346764014769633995) [(2, 3), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 187 for generator 4. -/
theorem ep_Q2_024_partial_04_0187_valid :
    mulPoly ep_Q2_024_coefficient_04_0187
        ep_Q2_024_generator_04_0100_0199 =
      ep_Q2_024_partial_04_0187 := by
  native_decide

/-- Coefficient term 188 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0188 : Poly :=
[
  term ((70325675920400782969222917978325705712 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (9, 1), (12, 1), (13, 1)]
]

/-- Partial product 188 for generator 4. -/
def ep_Q2_024_partial_04_0188 : Poly :=
[
  term ((70325675920400782969222917978325705712 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (3, 2), (9, 1), (12, 1), (13, 1)],
  term ((-70325675920400782969222917978325705712 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (9, 1), (10, 2), (12, 1), (13, 1)],
  term ((-70325675920400782969222917978325705712 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (9, 1), (11, 2), (12, 1), (13, 1)],
  term ((70325675920400782969222917978325705712 : Rat) / 599854728701238648283346764014769633995) [(2, 3), (9, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 188 for generator 4. -/
theorem ep_Q2_024_partial_04_0188_valid :
    mulPoly ep_Q2_024_coefficient_04_0188
        ep_Q2_024_generator_04_0100_0199 =
      ep_Q2_024_partial_04_0188 := by
  native_decide

/-- Coefficient term 189 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0189 : Poly :=
[
  term ((-1896151782245759226614217075335951718623712283315199773 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 1), (9, 1), (12, 1), (15, 1)]
]

/-- Partial product 189 for generator 4. -/
def ep_Q2_024_partial_04_0189 : Poly :=
[
  term ((-1896151782245759226614217075335951718623712283315199773 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 1), (3, 2), (9, 1), (12, 1), (15, 1)],
  term ((1896151782245759226614217075335951718623712283315199773 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 1), (9, 1), (10, 2), (12, 1), (15, 1)],
  term ((1896151782245759226614217075335951718623712283315199773 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 1), (9, 1), (11, 2), (12, 1), (15, 1)],
  term ((-1896151782245759226614217075335951718623712283315199773 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 3), (9, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 189 for generator 4. -/
theorem ep_Q2_024_partial_04_0189_valid :
    mulPoly ep_Q2_024_coefficient_04_0189
        ep_Q2_024_generator_04_0100_0199 =
      ep_Q2_024_partial_04_0189 := by
  native_decide

/-- Coefficient term 190 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0190 : Poly :=
[
  term ((461994601112796 : Rat) / 1162780221153193) [(2, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 190 for generator 4. -/
def ep_Q2_024_partial_04_0190 : Poly :=
[
  term ((461994601112796 : Rat) / 1162780221153193) [(2, 1), (3, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-461994601112796 : Rat) / 1162780221153193) [(2, 1), (9, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((-461994601112796 : Rat) / 1162780221153193) [(2, 1), (9, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((461994601112796 : Rat) / 1162780221153193) [(2, 3), (9, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 190 for generator 4. -/
theorem ep_Q2_024_partial_04_0190_valid :
    mulPoly ep_Q2_024_coefficient_04_0190
        ep_Q2_024_generator_04_0100_0199 =
      ep_Q2_024_partial_04_0190 := by
  native_decide

/-- Coefficient term 191 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0191 : Poly :=
[
  term ((-5710469539424841299399251406564832936092 : Rat) / 1799564186103715944850040292044308901985) [(2, 1), (9, 1), (13, 1)]
]

/-- Partial product 191 for generator 4. -/
def ep_Q2_024_partial_04_0191 : Poly :=
[
  term ((-5710469539424841299399251406564832936092 : Rat) / 1799564186103715944850040292044308901985) [(2, 1), (3, 2), (9, 1), (13, 1)],
  term ((5710469539424841299399251406564832936092 : Rat) / 1799564186103715944850040292044308901985) [(2, 1), (9, 1), (10, 2), (13, 1)],
  term ((5710469539424841299399251406564832936092 : Rat) / 1799564186103715944850040292044308901985) [(2, 1), (9, 1), (11, 2), (13, 1)],
  term ((-5710469539424841299399251406564832936092 : Rat) / 1799564186103715944850040292044308901985) [(2, 3), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 191 for generator 4. -/
theorem ep_Q2_024_partial_04_0191_valid :
    mulPoly ep_Q2_024_coefficient_04_0191
        ep_Q2_024_generator_04_0100_0199 =
      ep_Q2_024_partial_04_0191 := by
  native_decide

/-- Coefficient term 192 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0192 : Poly :=
[
  term ((-7546349489404363289987077149215071141947076491465683143 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(2, 1), (9, 1), (15, 1)]
]

/-- Partial product 192 for generator 4. -/
def ep_Q2_024_partial_04_0192 : Poly :=
[
  term ((-7546349489404363289987077149215071141947076491465683143 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(2, 1), (3, 2), (9, 1), (15, 1)],
  term ((7546349489404363289987077149215071141947076491465683143 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(2, 1), (9, 1), (10, 2), (15, 1)],
  term ((7546349489404363289987077149215071141947076491465683143 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(2, 1), (9, 1), (11, 2), (15, 1)],
  term ((-7546349489404363289987077149215071141947076491465683143 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(2, 3), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 192 for generator 4. -/
theorem ep_Q2_024_partial_04_0192_valid :
    mulPoly ep_Q2_024_coefficient_04_0192
        ep_Q2_024_generator_04_0100_0199 =
      ep_Q2_024_partial_04_0192 := by
  native_decide

/-- Coefficient term 193 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0193 : Poly :=
[
  term ((6723839922911702 : Rat) / 3488340663459579) [(2, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 193 for generator 4. -/
def ep_Q2_024_partial_04_0193 : Poly :=
[
  term ((6723839922911702 : Rat) / 3488340663459579) [(2, 1), (3, 2), (9, 1), (15, 1), (16, 1)],
  term ((-6723839922911702 : Rat) / 3488340663459579) [(2, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-6723839922911702 : Rat) / 3488340663459579) [(2, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((6723839922911702 : Rat) / 3488340663459579) [(2, 3), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 193 for generator 4. -/
theorem ep_Q2_024_partial_04_0193_valid :
    mulPoly ep_Q2_024_coefficient_04_0193
        ep_Q2_024_generator_04_0100_0199 =
      ep_Q2_024_partial_04_0193 := by
  native_decide

/-- Coefficient term 194 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0194 : Poly :=
[
  term ((-709904404831437825780635961744887047748 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (9, 2)]
]

/-- Partial product 194 for generator 4. -/
def ep_Q2_024_partial_04_0194 : Poly :=
[
  term ((-709904404831437825780635961744887047748 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (3, 2), (9, 2)],
  term ((709904404831437825780635961744887047748 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (9, 2), (10, 2)],
  term ((709904404831437825780635961744887047748 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (9, 2), (11, 2)],
  term ((-709904404831437825780635961744887047748 : Rat) / 199951576233746216094448921338256544665) [(2, 3), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 194 for generator 4. -/
theorem ep_Q2_024_partial_04_0194_valid :
    mulPoly ep_Q2_024_coefficient_04_0194
        ep_Q2_024_generator_04_0100_0199 =
      ep_Q2_024_partial_04_0194 := by
  native_decide

/-- Coefficient term 195 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0195 : Poly :=
[
  term ((60059846594267677279406589311277335612 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (11, 1), (12, 1), (13, 1)]
]

/-- Partial product 195 for generator 4. -/
def ep_Q2_024_partial_04_0195 : Poly :=
[
  term ((60059846594267677279406589311277335612 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (3, 2), (11, 1), (12, 1), (13, 1)],
  term ((-60059846594267677279406589311277335612 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (10, 2), (11, 1), (12, 1), (13, 1)],
  term ((-60059846594267677279406589311277335612 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (11, 3), (12, 1), (13, 1)],
  term ((60059846594267677279406589311277335612 : Rat) / 599854728701238648283346764014769633995) [(2, 3), (11, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 195 for generator 4. -/
theorem ep_Q2_024_partial_04_0195_valid :
    mulPoly ep_Q2_024_coefficient_04_0195
        ep_Q2_024_generator_04_0100_0199 =
      ep_Q2_024_partial_04_0195 := by
  native_decide

/-- Coefficient term 196 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0196 : Poly :=
[
  term ((-6544627211193844374324207850933658385537878969261824301 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(2, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 196 for generator 4. -/
def ep_Q2_024_partial_04_0196 : Poly :=
[
  term ((-6544627211193844374324207850933658385537878969261824301 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(2, 1), (3, 2), (11, 1), (12, 1), (15, 1)],
  term ((6544627211193844374324207850933658385537878969261824301 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(2, 1), (10, 2), (11, 1), (12, 1), (15, 1)],
  term ((6544627211193844374324207850933658385537878969261824301 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(2, 1), (11, 3), (12, 1), (15, 1)],
  term ((-6544627211193844374324207850933658385537878969261824301 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(2, 3), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 196 for generator 4. -/
theorem ep_Q2_024_partial_04_0196_valid :
    mulPoly ep_Q2_024_coefficient_04_0196
        ep_Q2_024_generator_04_0100_0199 =
      ep_Q2_024_partial_04_0196 := by
  native_decide

/-- Coefficient term 197 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0197 : Poly :=
[
  term ((448228140819559 : Rat) / 1162780221153193) [(2, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 197 for generator 4. -/
def ep_Q2_024_partial_04_0197 : Poly :=
[
  term ((448228140819559 : Rat) / 1162780221153193) [(2, 1), (3, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-448228140819559 : Rat) / 1162780221153193) [(2, 1), (10, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-448228140819559 : Rat) / 1162780221153193) [(2, 1), (11, 3), (12, 1), (15, 1), (16, 1)],
  term ((448228140819559 : Rat) / 1162780221153193) [(2, 3), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 197 for generator 4. -/
theorem ep_Q2_024_partial_04_0197_valid :
    mulPoly ep_Q2_024_coefficient_04_0197
        ep_Q2_024_generator_04_0100_0199 =
      ep_Q2_024_partial_04_0197 := by
  native_decide

/-- Coefficient term 198 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0198 : Poly :=
[
  term ((-188722442315693407427840899617497803072 : Rat) / 119970945740247729656669352802953926799) [(2, 1), (11, 1), (13, 1)]
]

/-- Partial product 198 for generator 4. -/
def ep_Q2_024_partial_04_0198 : Poly :=
[
  term ((-188722442315693407427840899617497803072 : Rat) / 119970945740247729656669352802953926799) [(2, 1), (3, 2), (11, 1), (13, 1)],
  term ((188722442315693407427840899617497803072 : Rat) / 119970945740247729656669352802953926799) [(2, 1), (10, 2), (11, 1), (13, 1)],
  term ((188722442315693407427840899617497803072 : Rat) / 119970945740247729656669352802953926799) [(2, 1), (11, 3), (13, 1)],
  term ((-188722442315693407427840899617497803072 : Rat) / 119970945740247729656669352802953926799) [(2, 3), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 198 for generator 4. -/
theorem ep_Q2_024_partial_04_0198_valid :
    mulPoly ep_Q2_024_coefficient_04_0198
        ep_Q2_024_generator_04_0100_0199 =
      ep_Q2_024_partial_04_0198 := by
  native_decide

/-- Coefficient term 199 from coefficient polynomial 4. -/
def ep_Q2_024_coefficient_04_0199 : Poly :=
[
  term ((-137190219846581823769882591558384019657388474051565837181 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(2, 1), (11, 1), (15, 1)]
]

/-- Partial product 199 for generator 4. -/
def ep_Q2_024_partial_04_0199 : Poly :=
[
  term ((-137190219846581823769882591558384019657388474051565837181 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(2, 1), (3, 2), (11, 1), (15, 1)],
  term ((137190219846581823769882591558384019657388474051565837181 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(2, 1), (10, 2), (11, 1), (15, 1)],
  term ((137190219846581823769882591558384019657388474051565837181 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(2, 1), (11, 3), (15, 1)],
  term ((-137190219846581823769882591558384019657388474051565837181 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(2, 3), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 199 for generator 4. -/
theorem ep_Q2_024_partial_04_0199_valid :
    mulPoly ep_Q2_024_coefficient_04_0199
        ep_Q2_024_generator_04_0100_0199 =
      ep_Q2_024_partial_04_0199 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_024_partials_04_0100_0199 : List Poly :=
[
  ep_Q2_024_partial_04_0100,
  ep_Q2_024_partial_04_0101,
  ep_Q2_024_partial_04_0102,
  ep_Q2_024_partial_04_0103,
  ep_Q2_024_partial_04_0104,
  ep_Q2_024_partial_04_0105,
  ep_Q2_024_partial_04_0106,
  ep_Q2_024_partial_04_0107,
  ep_Q2_024_partial_04_0108,
  ep_Q2_024_partial_04_0109,
  ep_Q2_024_partial_04_0110,
  ep_Q2_024_partial_04_0111,
  ep_Q2_024_partial_04_0112,
  ep_Q2_024_partial_04_0113,
  ep_Q2_024_partial_04_0114,
  ep_Q2_024_partial_04_0115,
  ep_Q2_024_partial_04_0116,
  ep_Q2_024_partial_04_0117,
  ep_Q2_024_partial_04_0118,
  ep_Q2_024_partial_04_0119,
  ep_Q2_024_partial_04_0120,
  ep_Q2_024_partial_04_0121,
  ep_Q2_024_partial_04_0122,
  ep_Q2_024_partial_04_0123,
  ep_Q2_024_partial_04_0124,
  ep_Q2_024_partial_04_0125,
  ep_Q2_024_partial_04_0126,
  ep_Q2_024_partial_04_0127,
  ep_Q2_024_partial_04_0128,
  ep_Q2_024_partial_04_0129,
  ep_Q2_024_partial_04_0130,
  ep_Q2_024_partial_04_0131,
  ep_Q2_024_partial_04_0132,
  ep_Q2_024_partial_04_0133,
  ep_Q2_024_partial_04_0134,
  ep_Q2_024_partial_04_0135,
  ep_Q2_024_partial_04_0136,
  ep_Q2_024_partial_04_0137,
  ep_Q2_024_partial_04_0138,
  ep_Q2_024_partial_04_0139,
  ep_Q2_024_partial_04_0140,
  ep_Q2_024_partial_04_0141,
  ep_Q2_024_partial_04_0142,
  ep_Q2_024_partial_04_0143,
  ep_Q2_024_partial_04_0144,
  ep_Q2_024_partial_04_0145,
  ep_Q2_024_partial_04_0146,
  ep_Q2_024_partial_04_0147,
  ep_Q2_024_partial_04_0148,
  ep_Q2_024_partial_04_0149,
  ep_Q2_024_partial_04_0150,
  ep_Q2_024_partial_04_0151,
  ep_Q2_024_partial_04_0152,
  ep_Q2_024_partial_04_0153,
  ep_Q2_024_partial_04_0154,
  ep_Q2_024_partial_04_0155,
  ep_Q2_024_partial_04_0156,
  ep_Q2_024_partial_04_0157,
  ep_Q2_024_partial_04_0158,
  ep_Q2_024_partial_04_0159,
  ep_Q2_024_partial_04_0160,
  ep_Q2_024_partial_04_0161,
  ep_Q2_024_partial_04_0162,
  ep_Q2_024_partial_04_0163,
  ep_Q2_024_partial_04_0164,
  ep_Q2_024_partial_04_0165,
  ep_Q2_024_partial_04_0166,
  ep_Q2_024_partial_04_0167,
  ep_Q2_024_partial_04_0168,
  ep_Q2_024_partial_04_0169,
  ep_Q2_024_partial_04_0170,
  ep_Q2_024_partial_04_0171,
  ep_Q2_024_partial_04_0172,
  ep_Q2_024_partial_04_0173,
  ep_Q2_024_partial_04_0174,
  ep_Q2_024_partial_04_0175,
  ep_Q2_024_partial_04_0176,
  ep_Q2_024_partial_04_0177,
  ep_Q2_024_partial_04_0178,
  ep_Q2_024_partial_04_0179,
  ep_Q2_024_partial_04_0180,
  ep_Q2_024_partial_04_0181,
  ep_Q2_024_partial_04_0182,
  ep_Q2_024_partial_04_0183,
  ep_Q2_024_partial_04_0184,
  ep_Q2_024_partial_04_0185,
  ep_Q2_024_partial_04_0186,
  ep_Q2_024_partial_04_0187,
  ep_Q2_024_partial_04_0188,
  ep_Q2_024_partial_04_0189,
  ep_Q2_024_partial_04_0190,
  ep_Q2_024_partial_04_0191,
  ep_Q2_024_partial_04_0192,
  ep_Q2_024_partial_04_0193,
  ep_Q2_024_partial_04_0194,
  ep_Q2_024_partial_04_0195,
  ep_Q2_024_partial_04_0196,
  ep_Q2_024_partial_04_0197,
  ep_Q2_024_partial_04_0198,
  ep_Q2_024_partial_04_0199
]

/-- Sum of partial products in this block. -/
def ep_Q2_024_block_04_0100_0199 : Poly :=
[
  term ((-4350297622763456 : Rat) / 3488340663459579) [(1, 1), (2, 2), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((315846430077575624766678596138973379552 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 2), (5, 1), (9, 2)],
  term ((-9407326506538999398797487783872895160 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (2, 2), (5, 1), (11, 1), (13, 1)],
  term ((2354726156844551479976179518884154954213556855016731652 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (2, 2), (5, 1), (11, 1), (15, 1)],
  term ((854765176539728 : Rat) / 1162780221153193) [(1, 1), (2, 2), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((6575066095859372571526548321556159041353238918460193408 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (2, 2), (5, 1), (13, 1), (15, 1)],
  term ((206941537023232 : Rat) / 1162780221153193) [(1, 1), (2, 2), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-40440149595023928932116585720924683072 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 2), (5, 1), (13, 2)],
  term ((4466115409796894554675042235934975650543774254263469936 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (2, 2), (5, 1), (15, 2)],
  term ((-898255108859200 : Rat) / 1162780221153193) [(1, 1), (2, 2), (5, 1), (15, 2), (16, 1)],
  term ((388907381162663655109886315109732674088 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 2), (7, 1)],
  term ((-826347564150239326187536952436868474864 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (2, 2), (8, 1), (9, 1)],
  term ((-17431738693849372302362576575459651055888 : Rat) / 5398692558311147834550120876132926705955) [(1, 1), (2, 2), (9, 1)],
  term ((84137745390860658180211860664979045196 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 2), (9, 1), (11, 1), (15, 1)],
  term ((1229638110307244453831799686572507368754 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 2), (9, 1), (12, 1)],
  term ((11091310340086889976887063337008120224 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 2), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((-198745616475118943998092102782769635563595552220534688 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (2, 2), (9, 1), (12, 1), (15, 2)],
  term ((527210767274432 : Rat) / 1162780221153193) [(1, 1), (2, 2), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((23310089130471063931483894832932188107056959617098620911 : Rat) / 1673998113837635673308592175505278615441223561845430484) [(1, 1), (2, 2), (9, 1), (13, 1), (15, 1)],
  term ((-1061184475199617 : Rat) / 3488340663459579) [(1, 1), (2, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((1981497736132325952384312234099254469916 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (2, 2), (9, 1), (13, 2)],
  term ((-22014581232155150509180716130595189439661 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (2, 2), (9, 1), (14, 1)],
  term ((5363707832472393008176946490880024273152821491591969510 : Rat) / 418499528459408918327148043876319653860305890461357621) [(1, 1), (2, 2), (9, 1), (15, 2)],
  term ((-917902994712824 : Rat) / 3488340663459579) [(1, 1), (2, 2), (9, 1), (15, 2), (16, 1)],
  term ((-2054771222204498495269592230004205344 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (2, 2), (9, 2), (13, 1)],
  term ((12301069069469927066412623315433253195720432156430141869 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(1, 1), (2, 2), (9, 2), (15, 1)],
  term ((-4111658236248574 : Rat) / 3488340663459579) [(1, 1), (2, 2), (9, 2), (15, 1), (16, 1)],
  term ((-347118927025584704822178291624352315808 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 2), (9, 3)],
  term ((1429182194689304419382031011936884624481 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (2, 2), (11, 1)],
  term ((-121146326533413229489263888085127877224 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 2), (11, 1), (13, 1), (15, 1)],
  term ((-228548346943902101627953017098607070723838550969230898109 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(1, 1), (2, 2), (11, 1), (15, 2)],
  term ((9851670194564511 : Rat) / 2325560442306386) [(1, 1), (2, 2), (11, 1), (15, 2), (16, 1)],
  term ((12048567490034960850927731169048294922094 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (2, 2), (12, 1), (13, 1)],
  term ((-298117535883234413975848953549738636486 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 2), (12, 1), (13, 1), (14, 1)],
  term ((72984140873142382040814446151801399736191225609387877649 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(1, 1), (2, 2), (12, 1), (14, 1), (15, 1)],
  term ((-12874820086749561 : Rat) / 2325560442306386) [(1, 1), (2, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((599492349856740992469735225942126878592774963052615622381 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(1, 1), (2, 2), (12, 1), (15, 1)],
  term ((113286569105637787 : Rat) / 13953362653838316) [(1, 1), (2, 2), (12, 1), (15, 1), (16, 1)],
  term ((150029597432773295116860635735682882826 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (2, 2), (12, 2), (13, 1)],
  term ((-34309742980469230273036227499528052253454082876746523343 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(1, 1), (2, 2), (12, 2), (15, 1)],
  term ((10583180282864679 : Rat) / 2325560442306386) [(1, 1), (2, 2), (12, 2), (15, 1), (16, 1)],
  term ((967263607659529653252972677120516194336 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 2), (13, 1)],
  term ((-2942250948635783867709597036664704350144 : Rat) / 359912837220743188970008058408861780397) [(1, 1), (2, 2), (13, 1), (14, 1)],
  term ((2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 2), (13, 1), (14, 2)],
  term ((15109217256518315323716689223387286634317328803199609516 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (2, 2), (13, 1), (15, 2)],
  term ((-2130221066942416 : Rat) / 1162780221153193) [(1, 1), (2, 2), (13, 1), (15, 2), (16, 1)],
  term ((-11530512132661982754025626129402130138490986283296027556 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (2, 2), (13, 2), (15, 1)],
  term ((150661185588720 : Rat) / 1162780221153193) [(1, 1), (2, 2), (13, 2), (15, 1), (16, 1)],
  term ((80945856112067634232098240062478093344 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (2, 2), (13, 3)],
  term ((-155216583566580225900217744989856299960430278135964738511 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(1, 1), (2, 2), (14, 1), (15, 1)],
  term ((-104769794997375257 : Rat) / 13953362653838316) [(1, 1), (2, 2), (14, 1), (15, 1), (16, 1)],
  term ((168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (2, 2), (14, 2), (15, 1)],
  term ((416983870520476 : Rat) / 1162780221153193) [(1, 1), (2, 2), (14, 2), (15, 1), (16, 1)],
  term ((-188347273819568219221983921640781695233068275354761839753 : Rat) / 13391984910701085386468737404042228923529788494763443872) [(1, 1), (2, 2), (15, 1)],
  term ((-8595027872996923 : Rat) / 9302241769225544) [(1, 1), (2, 2), (15, 1), (16, 1)],
  term ((-4350297622763456 : Rat) / 3488340663459579) [(1, 1), (3, 2), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((315846430077575624766678596138973379552 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 2), (5, 1), (9, 2)],
  term ((-9407326506538999398797487783872895160 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (3, 2), (5, 1), (11, 1), (13, 1)],
  term ((2354726156844551479976179518884154954213556855016731652 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (3, 2), (5, 1), (11, 1), (15, 1)],
  term ((854765176539728 : Rat) / 1162780221153193) [(1, 1), (3, 2), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((6575066095859372571526548321556159041353238918460193408 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (3, 2), (5, 1), (13, 1), (15, 1)],
  term ((206941537023232 : Rat) / 1162780221153193) [(1, 1), (3, 2), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-40440149595023928932116585720924683072 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 2), (5, 1), (13, 2)],
  term ((4466115409796894554675042235934975650543774254263469936 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (3, 2), (5, 1), (15, 2)],
  term ((-898255108859200 : Rat) / 1162780221153193) [(1, 1), (3, 2), (5, 1), (15, 2), (16, 1)],
  term ((388907381162663655109886315109732674088 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 2), (7, 1)],
  term ((-826347564150239326187536952436868474864 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (3, 2), (8, 1), (9, 1)],
  term ((-17431738693849372302362576575459651055888 : Rat) / 5398692558311147834550120876132926705955) [(1, 1), (3, 2), (9, 1)],
  term ((84137745390860658180211860664979045196 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 2), (9, 1), (11, 1), (15, 1)],
  term ((1229638110307244453831799686572507368754 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 2), (9, 1), (12, 1)],
  term ((11091310340086889976887063337008120224 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 2), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((-198745616475118943998092102782769635563595552220534688 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (3, 2), (9, 1), (12, 1), (15, 2)],
  term ((527210767274432 : Rat) / 1162780221153193) [(1, 1), (3, 2), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((23310089130471063931483894832932188107056959617098620911 : Rat) / 1673998113837635673308592175505278615441223561845430484) [(1, 1), (3, 2), (9, 1), (13, 1), (15, 1)],
  term ((-1061184475199617 : Rat) / 3488340663459579) [(1, 1), (3, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((1981497736132325952384312234099254469916 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (3, 2), (9, 1), (13, 2)],
  term ((-22014581232155150509180716130595189439661 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (3, 2), (9, 1), (14, 1)],
  term ((5363707832472393008176946490880024273152821491591969510 : Rat) / 418499528459408918327148043876319653860305890461357621) [(1, 1), (3, 2), (9, 1), (15, 2)],
  term ((-917902994712824 : Rat) / 3488340663459579) [(1, 1), (3, 2), (9, 1), (15, 2), (16, 1)],
  term ((-2054771222204498495269592230004205344 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (3, 2), (9, 2), (13, 1)],
  term ((12301069069469927066412623315433253195720432156430141869 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(1, 1), (3, 2), (9, 2), (15, 1)],
  term ((-4111658236248574 : Rat) / 3488340663459579) [(1, 1), (3, 2), (9, 2), (15, 1), (16, 1)],
  term ((-347118927025584704822178291624352315808 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 2), (9, 3)],
  term ((1429182194689304419382031011936884624481 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (3, 2), (11, 1)],
  term ((-121146326533413229489263888085127877224 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 2), (11, 1), (13, 1), (15, 1)],
  term ((-228548346943902101627953017098607070723838550969230898109 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(1, 1), (3, 2), (11, 1), (15, 2)],
  term ((9851670194564511 : Rat) / 2325560442306386) [(1, 1), (3, 2), (11, 1), (15, 2), (16, 1)],
  term ((12048567490034960850927731169048294922094 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (3, 2), (12, 1), (13, 1)],
  term ((-298117535883234413975848953549738636486 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 2), (12, 1), (13, 1), (14, 1)],
  term ((72984140873142382040814446151801399736191225609387877649 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(1, 1), (3, 2), (12, 1), (14, 1), (15, 1)],
  term ((-12874820086749561 : Rat) / 2325560442306386) [(1, 1), (3, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((599492349856740992469735225942126878592774963052615622381 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(1, 1), (3, 2), (12, 1), (15, 1)],
  term ((113286569105637787 : Rat) / 13953362653838316) [(1, 1), (3, 2), (12, 1), (15, 1), (16, 1)],
  term ((150029597432773295116860635735682882826 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (3, 2), (12, 2), (13, 1)],
  term ((-34309742980469230273036227499528052253454082876746523343 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(1, 1), (3, 2), (12, 2), (15, 1)],
  term ((10583180282864679 : Rat) / 2325560442306386) [(1, 1), (3, 2), (12, 2), (15, 1), (16, 1)],
  term ((967263607659529653252972677120516194336 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 2), (13, 1)],
  term ((-2942250948635783867709597036664704350144 : Rat) / 359912837220743188970008058408861780397) [(1, 1), (3, 2), (13, 1), (14, 1)],
  term ((2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 2), (13, 1), (14, 2)],
  term ((15109217256518315323716689223387286634317328803199609516 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (3, 2), (13, 1), (15, 2)],
  term ((-2130221066942416 : Rat) / 1162780221153193) [(1, 1), (3, 2), (13, 1), (15, 2), (16, 1)],
  term ((-11530512132661982754025626129402130138490986283296027556 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (3, 2), (13, 2), (15, 1)],
  term ((150661185588720 : Rat) / 1162780221153193) [(1, 1), (3, 2), (13, 2), (15, 1), (16, 1)],
  term ((80945856112067634232098240062478093344 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (3, 2), (13, 3)],
  term ((-155216583566580225900217744989856299960430278135964738511 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(1, 1), (3, 2), (14, 1), (15, 1)],
  term ((-104769794997375257 : Rat) / 13953362653838316) [(1, 1), (3, 2), (14, 1), (15, 1), (16, 1)],
  term ((168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (3, 2), (14, 2), (15, 1)],
  term ((416983870520476 : Rat) / 1162780221153193) [(1, 1), (3, 2), (14, 2), (15, 1), (16, 1)],
  term ((-188347273819568219221983921640781695233068275354761839753 : Rat) / 13391984910701085386468737404042228923529788494763443872) [(1, 1), (3, 2), (15, 1)],
  term ((-8595027872996923 : Rat) / 9302241769225544) [(1, 1), (3, 2), (15, 1), (16, 1)],
  term ((4350297622763456 : Rat) / 3488340663459579) [(1, 1), (5, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((4350297622763456 : Rat) / 3488340663459579) [(1, 1), (5, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-315846430077575624766678596138973379552 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (9, 2), (10, 2)],
  term ((-315846430077575624766678596138973379552 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (5, 1), (9, 2), (11, 2)],
  term ((9407326506538999398797487783872895160 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (5, 1), (10, 2), (11, 1), (13, 1)],
  term ((-2354726156844551479976179518884154954213556855016731652 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (5, 1), (10, 2), (11, 1), (15, 1)],
  term ((-854765176539728 : Rat) / 1162780221153193) [(1, 1), (5, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-6575066095859372571526548321556159041353238918460193408 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (5, 1), (10, 2), (13, 1), (15, 1)],
  term ((-206941537023232 : Rat) / 1162780221153193) [(1, 1), (5, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((40440149595023928932116585720924683072 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (10, 2), (13, 2)],
  term ((-4466115409796894554675042235934975650543774254263469936 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (5, 1), (10, 2), (15, 2)],
  term ((898255108859200 : Rat) / 1162780221153193) [(1, 1), (5, 1), (10, 2), (15, 2), (16, 1)],
  term ((-6575066095859372571526548321556159041353238918460193408 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (5, 1), (11, 2), (13, 1), (15, 1)],
  term ((-206941537023232 : Rat) / 1162780221153193) [(1, 1), (5, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((40440149595023928932116585720924683072 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (5, 1), (11, 2), (13, 2)],
  term ((-4466115409796894554675042235934975650543774254263469936 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (5, 1), (11, 2), (15, 2)],
  term ((898255108859200 : Rat) / 1162780221153193) [(1, 1), (5, 1), (11, 2), (15, 2), (16, 1)],
  term ((9407326506538999398797487783872895160 : Rat) / 39990315246749243218889784267651308933) [(1, 1), (5, 1), (11, 3), (13, 1)],
  term ((-2354726156844551479976179518884154954213556855016731652 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (5, 1), (11, 3), (15, 1)],
  term ((-854765176539728 : Rat) / 1162780221153193) [(1, 1), (5, 1), (11, 3), (15, 1), (16, 1)],
  term ((-388907381162663655109886315109732674088 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (7, 1), (10, 2)],
  term ((-388907381162663655109886315109732674088 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (7, 1), (11, 2)],
  term ((826347564150239326187536952436868474864 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (8, 1), (9, 1), (10, 2)],
  term ((826347564150239326187536952436868474864 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (8, 1), (9, 1), (11, 2)],
  term ((17431738693849372302362576575459651055888 : Rat) / 5398692558311147834550120876132926705955) [(1, 1), (9, 1), (10, 2)],
  term ((-84137745390860658180211860664979045196 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (9, 1), (10, 2), (11, 1), (15, 1)],
  term ((-1229638110307244453831799686572507368754 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (9, 1), (10, 2), (12, 1)],
  term ((-11091310340086889976887063337008120224 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (9, 1), (10, 2), (12, 1), (13, 1), (15, 1)],
  term ((198745616475118943998092102782769635563595552220534688 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (9, 1), (10, 2), (12, 1), (15, 2)],
  term ((-527210767274432 : Rat) / 1162780221153193) [(1, 1), (9, 1), (10, 2), (12, 1), (15, 2), (16, 1)],
  term ((-23310089130471063931483894832932188107056959617098620911 : Rat) / 1673998113837635673308592175505278615441223561845430484) [(1, 1), (9, 1), (10, 2), (13, 1), (15, 1)],
  term ((1061184475199617 : Rat) / 3488340663459579) [(1, 1), (9, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1981497736132325952384312234099254469916 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (9, 1), (10, 2), (13, 2)],
  term ((22014581232155150509180716130595189439661 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (9, 1), (10, 2), (14, 1)],
  term ((-5363707832472393008176946490880024273152821491591969510 : Rat) / 418499528459408918327148043876319653860305890461357621) [(1, 1), (9, 1), (10, 2), (15, 2)],
  term ((917902994712824 : Rat) / 3488340663459579) [(1, 1), (9, 1), (10, 2), (15, 2), (16, 1)],
  term ((17431738693849372302362576575459651055888 : Rat) / 5398692558311147834550120876132926705955) [(1, 1), (9, 1), (11, 2)],
  term ((-1229638110307244453831799686572507368754 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (9, 1), (11, 2), (12, 1)],
  term ((-11091310340086889976887063337008120224 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (9, 1), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((198745616475118943998092102782769635563595552220534688 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (9, 1), (11, 2), (12, 1), (15, 2)],
  term ((-527210767274432 : Rat) / 1162780221153193) [(1, 1), (9, 1), (11, 2), (12, 1), (15, 2), (16, 1)],
  term ((-23310089130471063931483894832932188107056959617098620911 : Rat) / 1673998113837635673308592175505278615441223561845430484) [(1, 1), (9, 1), (11, 2), (13, 1), (15, 1)],
  term ((1061184475199617 : Rat) / 3488340663459579) [(1, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1981497736132325952384312234099254469916 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (9, 1), (11, 2), (13, 2)],
  term ((22014581232155150509180716130595189439661 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (9, 1), (11, 2), (14, 1)],
  term ((-5363707832472393008176946490880024273152821491591969510 : Rat) / 418499528459408918327148043876319653860305890461357621) [(1, 1), (9, 1), (11, 2), (15, 2)],
  term ((917902994712824 : Rat) / 3488340663459579) [(1, 1), (9, 1), (11, 2), (15, 2), (16, 1)],
  term ((-84137745390860658180211860664979045196 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (9, 1), (11, 3), (15, 1)],
  term ((2054771222204498495269592230004205344 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (9, 2), (10, 2), (13, 1)],
  term ((-12301069069469927066412623315433253195720432156430141869 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(1, 1), (9, 2), (10, 2), (15, 1)],
  term ((4111658236248574 : Rat) / 3488340663459579) [(1, 1), (9, 2), (10, 2), (15, 1), (16, 1)],
  term ((2054771222204498495269592230004205344 : Rat) / 119970945740247729656669352802953926799) [(1, 1), (9, 2), (11, 2), (13, 1)],
  term ((-12301069069469927066412623315433253195720432156430141869 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(1, 1), (9, 2), (11, 2), (15, 1)],
  term ((4111658236248574 : Rat) / 3488340663459579) [(1, 1), (9, 2), (11, 2), (15, 1), (16, 1)],
  term ((347118927025584704822178291624352315808 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (9, 3), (10, 2)],
  term ((347118927025584704822178291624352315808 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (9, 3), (11, 2)],
  term ((-1429182194689304419382031011936884624481 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (10, 2), (11, 1)],
  term ((121146326533413229489263888085127877224 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (10, 2), (11, 1), (13, 1), (15, 1)],
  term ((228548346943902101627953017098607070723838550969230898109 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(1, 1), (10, 2), (11, 1), (15, 2)],
  term ((-9851670194564511 : Rat) / 2325560442306386) [(1, 1), (10, 2), (11, 1), (15, 2), (16, 1)],
  term ((-12048567490034960850927731169048294922094 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (10, 2), (12, 1), (13, 1)],
  term ((298117535883234413975848953549738636486 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (10, 2), (12, 1), (13, 1), (14, 1)],
  term ((-72984140873142382040814446151801399736191225609387877649 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(1, 1), (10, 2), (12, 1), (14, 1), (15, 1)],
  term ((12874820086749561 : Rat) / 2325560442306386) [(1, 1), (10, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-599492349856740992469735225942126878592774963052615622381 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(1, 1), (10, 2), (12, 1), (15, 1)],
  term ((-113286569105637787 : Rat) / 13953362653838316) [(1, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((-150029597432773295116860635735682882826 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (10, 2), (12, 2), (13, 1)],
  term ((34309742980469230273036227499528052253454082876746523343 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(1, 1), (10, 2), (12, 2), (15, 1)],
  term ((-10583180282864679 : Rat) / 2325560442306386) [(1, 1), (10, 2), (12, 2), (15, 1), (16, 1)],
  term ((-967263607659529653252972677120516194336 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (10, 2), (13, 1)],
  term ((2942250948635783867709597036664704350144 : Rat) / 359912837220743188970008058408861780397) [(1, 1), (10, 2), (13, 1), (14, 1)],
  term ((-2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (10, 2), (13, 1), (14, 2)],
  term ((-15109217256518315323716689223387286634317328803199609516 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (10, 2), (13, 1), (15, 2)],
  term ((2130221066942416 : Rat) / 1162780221153193) [(1, 1), (10, 2), (13, 1), (15, 2), (16, 1)],
  term ((11530512132661982754025626129402130138490986283296027556 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (10, 2), (13, 2), (15, 1)],
  term ((-150661185588720 : Rat) / 1162780221153193) [(1, 1), (10, 2), (13, 2), (15, 1), (16, 1)],
  term ((-80945856112067634232098240062478093344 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (10, 2), (13, 3)],
  term ((155216583566580225900217744989856299960430278135964738511 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(1, 1), (10, 2), (14, 1), (15, 1)],
  term ((104769794997375257 : Rat) / 13953362653838316) [(1, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((-168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (10, 2), (14, 2), (15, 1)],
  term ((-416983870520476 : Rat) / 1162780221153193) [(1, 1), (10, 2), (14, 2), (15, 1), (16, 1)],
  term ((188347273819568219221983921640781695233068275354761839753 : Rat) / 13391984910701085386468737404042228923529788494763443872) [(1, 1), (10, 2), (15, 1)],
  term ((8595027872996923 : Rat) / 9302241769225544) [(1, 1), (10, 2), (15, 1), (16, 1)],
  term ((-12048567490034960850927731169048294922094 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (11, 2), (12, 1), (13, 1)],
  term ((298117535883234413975848953549738636486 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (11, 2), (12, 1), (13, 1), (14, 1)],
  term ((-72984140873142382040814446151801399736191225609387877649 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(1, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((12874820086749561 : Rat) / 2325560442306386) [(1, 1), (11, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-599492349856740992469735225942126878592774963052615622381 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(1, 1), (11, 2), (12, 1), (15, 1)],
  term ((-113286569105637787 : Rat) / 13953362653838316) [(1, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-150029597432773295116860635735682882826 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (11, 2), (12, 2), (13, 1)],
  term ((34309742980469230273036227499528052253454082876746523343 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(1, 1), (11, 2), (12, 2), (15, 1)],
  term ((-10583180282864679 : Rat) / 2325560442306386) [(1, 1), (11, 2), (12, 2), (15, 1), (16, 1)],
  term ((-967263607659529653252972677120516194336 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (11, 2), (13, 1)],
  term ((2942250948635783867709597036664704350144 : Rat) / 359912837220743188970008058408861780397) [(1, 1), (11, 2), (13, 1), (14, 1)],
  term ((-2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (11, 2), (13, 1), (14, 2)],
  term ((-15109217256518315323716689223387286634317328803199609516 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (11, 2), (13, 1), (15, 2)],
  term ((2130221066942416 : Rat) / 1162780221153193) [(1, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((11530512132661982754025626129402130138490986283296027556 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 1), (11, 2), (13, 2), (15, 1)],
  term ((-150661185588720 : Rat) / 1162780221153193) [(1, 1), (11, 2), (13, 2), (15, 1), (16, 1)],
  term ((-80945856112067634232098240062478093344 : Rat) / 599854728701238648283346764014769633995) [(1, 1), (11, 2), (13, 3)],
  term ((155216583566580225900217744989856299960430278135964738511 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(1, 1), (11, 2), (14, 1), (15, 1)],
  term ((104769794997375257 : Rat) / 13953362653838316) [(1, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(1, 1), (11, 2), (14, 2), (15, 1)],
  term ((-416983870520476 : Rat) / 1162780221153193) [(1, 1), (11, 2), (14, 2), (15, 1), (16, 1)],
  term ((188347273819568219221983921640781695233068275354761839753 : Rat) / 13391984910701085386468737404042228923529788494763443872) [(1, 1), (11, 2), (15, 1)],
  term ((8595027872996923 : Rat) / 9302241769225544) [(1, 1), (11, 2), (15, 1), (16, 1)],
  term ((-1429182194689304419382031011936884624481 : Rat) / 1799564186103715944850040292044308901985) [(1, 1), (11, 3)],
  term ((121146326533413229489263888085127877224 : Rat) / 199951576233746216094448921338256544665) [(1, 1), (11, 3), (13, 1), (15, 1)],
  term ((228548346943902101627953017098607070723838550969230898109 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(1, 1), (11, 3), (15, 2)],
  term ((-9851670194564511 : Rat) / 2325560442306386) [(1, 1), (11, 3), (15, 2), (16, 1)],
  term ((74315340039547725559312259812600750296 : Rat) / 199951576233746216094448921338256544665) [(1, 2), (2, 2), (5, 1), (9, 1)],
  term ((18814653013077998797594975567745790320 : Rat) / 39990315246749243218889784267651308933) [(1, 2), (2, 2), (5, 1), (13, 1)],
  term ((-4709452313689102959952359037768309908427113710033463304 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 2), (2, 2), (5, 1), (15, 1)],
  term ((-1709530353079456 : Rat) / 1162780221153193) [(1, 2), (2, 2), (5, 1), (15, 1), (16, 1)],
  term ((-168275490781721316360423721329958090392 : Rat) / 199951576233746216094448921338256544665) [(1, 2), (2, 2), (9, 1), (15, 1)],
  term ((242292653066826458978527776170255754448 : Rat) / 199951576233746216094448921338256544665) [(1, 2), (2, 2), (13, 1), (15, 1)],
  term ((228548346943902101627953017098607070723838550969230898109 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(1, 2), (2, 2), (15, 2)],
  term ((-9851670194564511 : Rat) / 1162780221153193) [(1, 2), (2, 2), (15, 2), (16, 1)],
  term ((74315340039547725559312259812600750296 : Rat) / 199951576233746216094448921338256544665) [(1, 2), (3, 2), (5, 1), (9, 1)],
  term ((18814653013077998797594975567745790320 : Rat) / 39990315246749243218889784267651308933) [(1, 2), (3, 2), (5, 1), (13, 1)],
  term ((-4709452313689102959952359037768309908427113710033463304 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 2), (3, 2), (5, 1), (15, 1)],
  term ((-1709530353079456 : Rat) / 1162780221153193) [(1, 2), (3, 2), (5, 1), (15, 1), (16, 1)],
  term ((-168275490781721316360423721329958090392 : Rat) / 199951576233746216094448921338256544665) [(1, 2), (3, 2), (9, 1), (15, 1)],
  term ((242292653066826458978527776170255754448 : Rat) / 199951576233746216094448921338256544665) [(1, 2), (3, 2), (13, 1), (15, 1)],
  term ((228548346943902101627953017098607070723838550969230898109 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(1, 2), (3, 2), (15, 2)],
  term ((-9851670194564511 : Rat) / 1162780221153193) [(1, 2), (3, 2), (15, 2), (16, 1)],
  term ((-74315340039547725559312259812600750296 : Rat) / 199951576233746216094448921338256544665) [(1, 2), (5, 1), (9, 1), (10, 2)],
  term ((-74315340039547725559312259812600750296 : Rat) / 199951576233746216094448921338256544665) [(1, 2), (5, 1), (9, 1), (11, 2)],
  term ((-18814653013077998797594975567745790320 : Rat) / 39990315246749243218889784267651308933) [(1, 2), (5, 1), (10, 2), (13, 1)],
  term ((4709452313689102959952359037768309908427113710033463304 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 2), (5, 1), (10, 2), (15, 1)],
  term ((1709530353079456 : Rat) / 1162780221153193) [(1, 2), (5, 1), (10, 2), (15, 1), (16, 1)],
  term ((-18814653013077998797594975567745790320 : Rat) / 39990315246749243218889784267651308933) [(1, 2), (5, 1), (11, 2), (13, 1)],
  term ((4709452313689102959952359037768309908427113710033463304 : Rat) / 697499214099014863878580073127199423100509817435596035) [(1, 2), (5, 1), (11, 2), (15, 1)],
  term ((1709530353079456 : Rat) / 1162780221153193) [(1, 2), (5, 1), (11, 2), (15, 1), (16, 1)],
  term ((168275490781721316360423721329958090392 : Rat) / 199951576233746216094448921338256544665) [(1, 2), (9, 1), (10, 2), (15, 1)],
  term ((168275490781721316360423721329958090392 : Rat) / 199951576233746216094448921338256544665) [(1, 2), (9, 1), (11, 2), (15, 1)],
  term ((-242292653066826458978527776170255754448 : Rat) / 199951576233746216094448921338256544665) [(1, 2), (10, 2), (13, 1), (15, 1)],
  term ((-228548346943902101627953017098607070723838550969230898109 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(1, 2), (10, 2), (15, 2)],
  term ((9851670194564511 : Rat) / 1162780221153193) [(1, 2), (10, 2), (15, 2), (16, 1)],
  term ((-242292653066826458978527776170255754448 : Rat) / 199951576233746216094448921338256544665) [(1, 2), (11, 2), (13, 1), (15, 1)],
  term ((-228548346943902101627953017098607070723838550969230898109 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(1, 2), (11, 2), (15, 2)],
  term ((9851670194564511 : Rat) / 1162780221153193) [(1, 2), (11, 2), (15, 2), (16, 1)],
  term ((384550739231878026724416082483894862344 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (3, 1), (9, 1), (10, 2)],
  term ((384550739231878026724416082483894862344 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (3, 1), (9, 1), (11, 2)],
  term ((-49794017268134571589590260644228965512 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (3, 1), (10, 2), (12, 1), (13, 1)],
  term ((550464729340465184219154740052350989658090880526284951 : Rat) / 92999895213201981850477343083626589746734642324746138) [(2, 1), (3, 1), (10, 2), (12, 1), (15, 1)],
  term ((-1303385041578966 : Rat) / 1162780221153193) [(2, 1), (3, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((1752242829965026750387737683564999916532 : Rat) / 1799564186103715944850040292044308901985) [(2, 1), (3, 1), (10, 2), (13, 1)],
  term ((3754221193578629608236243814291749212259078128745014103 : Rat) / 929998952132019818504773430836265897467346423247461380) [(2, 1), (3, 1), (10, 2), (15, 1)],
  term ((-966109193298565 : Rat) / 3488340663459579) [(2, 1), (3, 1), (10, 2), (15, 1), (16, 1)],
  term ((-49794017268134571589590260644228965512 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (3, 1), (11, 2), (12, 1), (13, 1)],
  term ((550464729340465184219154740052350989658090880526284951 : Rat) / 92999895213201981850477343083626589746734642324746138) [(2, 1), (3, 1), (11, 2), (12, 1), (15, 1)],
  term ((-1303385041578966 : Rat) / 1162780221153193) [(2, 1), (3, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((1752242829965026750387737683564999916532 : Rat) / 1799564186103715944850040292044308901985) [(2, 1), (3, 1), (11, 2), (13, 1)],
  term ((3754221193578629608236243814291749212259078128745014103 : Rat) / 929998952132019818504773430836265897467346423247461380) [(2, 1), (3, 1), (11, 2), (15, 1)],
  term ((-966109193298565 : Rat) / 3488340663459579) [(2, 1), (3, 1), (11, 2), (15, 1), (16, 1)],
  term ((8838886483165088967005567625924723984461 : Rat) / 3599128372207431889700080584088617803970) [(2, 1), (3, 2)],
  term ((-732537308678412778282669871950328022754 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (3, 2), (4, 1)],
  term ((-522235060517320235301229065697721790572 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (3, 2), (5, 1), (9, 1)],
  term ((-244075067403674486867873273412360623676 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (3, 2), (5, 1), (11, 1)],
  term ((-8978918525852651872265618308153908376 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (3, 2), (5, 1), (13, 1)],
  term ((-13664629938802414707227692096020454758249240054406156697 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(2, 1), (3, 2), (5, 1), (15, 1)],
  term ((895992474518854 : Rat) / 1162780221153193) [(2, 1), (3, 2), (5, 1), (15, 1), (16, 1)],
  term ((-113934139398522877630456776717744776980 : Rat) / 119970945740247729656669352802953926799) [(2, 1), (3, 2), (7, 1), (9, 1)],
  term ((518543174883551540146515086812976898784 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (3, 2), (7, 1), (11, 1)],
  term ((-49794017268134571589590260644228965512 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (3, 2), (7, 1), (12, 1), (13, 1)],
  term ((183488243113488394739718246684116996552696960175428317 : Rat) / 92999895213201981850477343083626589746734642324746138) [(2, 1), (3, 2), (7, 1), (12, 1), (15, 1)],
  term ((-434461680526322 : Rat) / 1162780221153193) [(2, 1), (3, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((52170129068766430306603786468421147060 : Rat) / 119970945740247729656669352802953926799) [(2, 1), (3, 2), (7, 1), (13, 1)],
  term ((6179138727918710691818933835158696451312183136130255472 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 1), (3, 2), (7, 1), (15, 1)],
  term ((6701416651161452 : Rat) / 1162780221153193) [(2, 1), (3, 2), (7, 1), (15, 1), (16, 1)],
  term ((397119697749071441202776676699968874332 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (3, 2), (8, 1)],
  term ((-580332583183098106794526391365108351352 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (3, 2), (9, 1), (11, 1)],
  term ((70325675920400782969222917978325705712 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (3, 2), (9, 1), (12, 1), (13, 1)],
  term ((-1896151782245759226614217075335951718623712283315199773 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 1), (3, 2), (9, 1), (12, 1), (15, 1)],
  term ((461994601112796 : Rat) / 1162780221153193) [(2, 1), (3, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-5710469539424841299399251406564832936092 : Rat) / 1799564186103715944850040292044308901985) [(2, 1), (3, 2), (9, 1), (13, 1)],
  term ((-7546349489404363289987077149215071141947076491465683143 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(2, 1), (3, 2), (9, 1), (15, 1)],
  term ((6723839922911702 : Rat) / 3488340663459579) [(2, 1), (3, 2), (9, 1), (15, 1), (16, 1)],
  term ((-709904404831437825780635961744887047748 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (3, 2), (9, 2)],
  term ((4281089153612859170931146538257430160 : Rat) / 119970945740247729656669352802953926799) [(2, 1), (3, 2), (10, 2)],
  term ((60059846594267677279406589311277335612 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (3, 2), (11, 1), (12, 1), (13, 1)],
  term ((-6544627211193844374324207850933658385537878969261824301 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(2, 1), (3, 2), (11, 1), (12, 1), (15, 1)],
  term ((448228140819559 : Rat) / 1162780221153193) [(2, 1), (3, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-188722442315693407427840899617497803072 : Rat) / 119970945740247729656669352802953926799) [(2, 1), (3, 2), (11, 1), (13, 1)],
  term ((-137190219846581823769882591558384019657388474051565837181 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(2, 1), (3, 2), (11, 1), (15, 1)],
  term ((4281089153612859170931146538257430160 : Rat) / 119970945740247729656669352802953926799) [(2, 1), (3, 2), (11, 2)],
  term ((-384550739231878026724416082483894862344 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (3, 3), (9, 1)],
  term ((49794017268134571589590260644228965512 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (3, 3), (12, 1), (13, 1)],
  term ((-550464729340465184219154740052350989658090880526284951 : Rat) / 92999895213201981850477343083626589746734642324746138) [(2, 1), (3, 3), (12, 1), (15, 1)],
  term ((1303385041578966 : Rat) / 1162780221153193) [(2, 1), (3, 3), (12, 1), (15, 1), (16, 1)],
  term ((-1752242829965026750387737683564999916532 : Rat) / 1799564186103715944850040292044308901985) [(2, 1), (3, 3), (13, 1)],
  term ((-3754221193578629608236243814291749212259078128745014103 : Rat) / 929998952132019818504773430836265897467346423247461380) [(2, 1), (3, 3), (15, 1)],
  term ((966109193298565 : Rat) / 3488340663459579) [(2, 1), (3, 3), (15, 1), (16, 1)],
  term ((-4281089153612859170931146538257430160 : Rat) / 119970945740247729656669352802953926799) [(2, 1), (3, 4)],
  term ((732537308678412778282669871950328022754 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (4, 1), (10, 2)],
  term ((732537308678412778282669871950328022754 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (4, 1), (11, 2)],
  term ((522235060517320235301229065697721790572 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (5, 1), (9, 1), (10, 2)],
  term ((522235060517320235301229065697721790572 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (5, 1), (9, 1), (11, 2)],
  term ((244075067403674486867873273412360623676 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (5, 1), (10, 2), (11, 1)],
  term ((8978918525852651872265618308153908376 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (5, 1), (10, 2), (13, 1)],
  term ((13664629938802414707227692096020454758249240054406156697 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(2, 1), (5, 1), (10, 2), (15, 1)],
  term ((-895992474518854 : Rat) / 1162780221153193) [(2, 1), (5, 1), (10, 2), (15, 1), (16, 1)],
  term ((8978918525852651872265618308153908376 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (5, 1), (11, 2), (13, 1)],
  term ((13664629938802414707227692096020454758249240054406156697 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(2, 1), (5, 1), (11, 2), (15, 1)],
  term ((-895992474518854 : Rat) / 1162780221153193) [(2, 1), (5, 1), (11, 2), (15, 1), (16, 1)],
  term ((244075067403674486867873273412360623676 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (5, 1), (11, 3)],
  term ((113934139398522877630456776717744776980 : Rat) / 119970945740247729656669352802953926799) [(2, 1), (7, 1), (9, 1), (10, 2)],
  term ((113934139398522877630456776717744776980 : Rat) / 119970945740247729656669352802953926799) [(2, 1), (7, 1), (9, 1), (11, 2)],
  term ((-518543174883551540146515086812976898784 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (7, 1), (10, 2), (11, 1)],
  term ((49794017268134571589590260644228965512 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (7, 1), (10, 2), (12, 1), (13, 1)],
  term ((-183488243113488394739718246684116996552696960175428317 : Rat) / 92999895213201981850477343083626589746734642324746138) [(2, 1), (7, 1), (10, 2), (12, 1), (15, 1)],
  term ((434461680526322 : Rat) / 1162780221153193) [(2, 1), (7, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((-52170129068766430306603786468421147060 : Rat) / 119970945740247729656669352802953926799) [(2, 1), (7, 1), (10, 2), (13, 1)],
  term ((-6179138727918710691818933835158696451312183136130255472 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 1), (7, 1), (10, 2), (15, 1)],
  term ((-6701416651161452 : Rat) / 1162780221153193) [(2, 1), (7, 1), (10, 2), (15, 1), (16, 1)],
  term ((49794017268134571589590260644228965512 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (7, 1), (11, 2), (12, 1), (13, 1)],
  term ((-183488243113488394739718246684116996552696960175428317 : Rat) / 92999895213201981850477343083626589746734642324746138) [(2, 1), (7, 1), (11, 2), (12, 1), (15, 1)],
  term ((434461680526322 : Rat) / 1162780221153193) [(2, 1), (7, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-52170129068766430306603786468421147060 : Rat) / 119970945740247729656669352802953926799) [(2, 1), (7, 1), (11, 2), (13, 1)],
  term ((-6179138727918710691818933835158696451312183136130255472 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 1), (7, 1), (11, 2), (15, 1)],
  term ((-6701416651161452 : Rat) / 1162780221153193) [(2, 1), (7, 1), (11, 2), (15, 1), (16, 1)],
  term ((-518543174883551540146515086812976898784 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (7, 1), (11, 3)],
  term ((-397119697749071441202776676699968874332 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (8, 1), (10, 2)],
  term ((-397119697749071441202776676699968874332 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (8, 1), (11, 2)],
  term ((580332583183098106794526391365108351352 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (9, 1), (10, 2), (11, 1)],
  term ((-70325675920400782969222917978325705712 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (9, 1), (10, 2), (12, 1), (13, 1)],
  term ((1896151782245759226614217075335951718623712283315199773 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 1), (9, 1), (10, 2), (12, 1), (15, 1)],
  term ((-461994601112796 : Rat) / 1162780221153193) [(2, 1), (9, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((5710469539424841299399251406564832936092 : Rat) / 1799564186103715944850040292044308901985) [(2, 1), (9, 1), (10, 2), (13, 1)],
  term ((7546349489404363289987077149215071141947076491465683143 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(2, 1), (9, 1), (10, 2), (15, 1)],
  term ((-6723839922911702 : Rat) / 3488340663459579) [(2, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-70325675920400782969222917978325705712 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (9, 1), (11, 2), (12, 1), (13, 1)],
  term ((1896151782245759226614217075335951718623712283315199773 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 1), (9, 1), (11, 2), (12, 1), (15, 1)],
  term ((-461994601112796 : Rat) / 1162780221153193) [(2, 1), (9, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((5710469539424841299399251406564832936092 : Rat) / 1799564186103715944850040292044308901985) [(2, 1), (9, 1), (11, 2), (13, 1)],
  term ((7546349489404363289987077149215071141947076491465683143 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(2, 1), (9, 1), (11, 2), (15, 1)],
  term ((-6723839922911702 : Rat) / 3488340663459579) [(2, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((580332583183098106794526391365108351352 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (9, 1), (11, 3)],
  term ((709904404831437825780635961744887047748 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (9, 2), (10, 2)],
  term ((709904404831437825780635961744887047748 : Rat) / 199951576233746216094448921338256544665) [(2, 1), (9, 2), (11, 2)],
  term ((-8838886483165088967005567625924723984461 : Rat) / 3599128372207431889700080584088617803970) [(2, 1), (10, 2)],
  term ((-60059846594267677279406589311277335612 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (10, 2), (11, 1), (12, 1), (13, 1)],
  term ((6544627211193844374324207850933658385537878969261824301 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(2, 1), (10, 2), (11, 1), (12, 1), (15, 1)],
  term ((-448228140819559 : Rat) / 1162780221153193) [(2, 1), (10, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((188722442315693407427840899617497803072 : Rat) / 119970945740247729656669352802953926799) [(2, 1), (10, 2), (11, 1), (13, 1)],
  term ((137190219846581823769882591558384019657388474051565837181 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(2, 1), (10, 2), (11, 1), (15, 1)],
  term ((-8838886483165088967005567625924723984461 : Rat) / 3599128372207431889700080584088617803970) [(2, 1), (11, 2)],
  term ((-60059846594267677279406589311277335612 : Rat) / 599854728701238648283346764014769633995) [(2, 1), (11, 3), (12, 1), (13, 1)],
  term ((6544627211193844374324207850933658385537878969261824301 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(2, 1), (11, 3), (12, 1), (15, 1)],
  term ((-448228140819559 : Rat) / 1162780221153193) [(2, 1), (11, 3), (12, 1), (15, 1), (16, 1)],
  term ((188722442315693407427840899617497803072 : Rat) / 119970945740247729656669352802953926799) [(2, 1), (11, 3), (13, 1)],
  term ((137190219846581823769882591558384019657388474051565837181 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(2, 1), (11, 3), (15, 1)],
  term ((8838886483165088967005567625924723984461 : Rat) / 3599128372207431889700080584088617803970) [(2, 3)],
  term ((-384550739231878026724416082483894862344 : Rat) / 199951576233746216094448921338256544665) [(2, 3), (3, 1), (9, 1)],
  term ((49794017268134571589590260644228965512 : Rat) / 199951576233746216094448921338256544665) [(2, 3), (3, 1), (12, 1), (13, 1)],
  term ((-550464729340465184219154740052350989658090880526284951 : Rat) / 92999895213201981850477343083626589746734642324746138) [(2, 3), (3, 1), (12, 1), (15, 1)],
  term ((1303385041578966 : Rat) / 1162780221153193) [(2, 3), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1752242829965026750387737683564999916532 : Rat) / 1799564186103715944850040292044308901985) [(2, 3), (3, 1), (13, 1)],
  term ((-3754221193578629608236243814291749212259078128745014103 : Rat) / 929998952132019818504773430836265897467346423247461380) [(2, 3), (3, 1), (15, 1)],
  term ((966109193298565 : Rat) / 3488340663459579) [(2, 3), (3, 1), (15, 1), (16, 1)],
  term ((-4281089153612859170931146538257430160 : Rat) / 119970945740247729656669352802953926799) [(2, 3), (3, 2)],
  term ((-732537308678412778282669871950328022754 : Rat) / 599854728701238648283346764014769633995) [(2, 3), (4, 1)],
  term ((-522235060517320235301229065697721790572 : Rat) / 199951576233746216094448921338256544665) [(2, 3), (5, 1), (9, 1)],
  term ((-244075067403674486867873273412360623676 : Rat) / 199951576233746216094448921338256544665) [(2, 3), (5, 1), (11, 1)],
  term ((-8978918525852651872265618308153908376 : Rat) / 199951576233746216094448921338256544665) [(2, 3), (5, 1), (13, 1)],
  term ((-13664629938802414707227692096020454758249240054406156697 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(2, 3), (5, 1), (15, 1)],
  term ((895992474518854 : Rat) / 1162780221153193) [(2, 3), (5, 1), (15, 1), (16, 1)],
  term ((-113934139398522877630456776717744776980 : Rat) / 119970945740247729656669352802953926799) [(2, 3), (7, 1), (9, 1)],
  term ((518543174883551540146515086812976898784 : Rat) / 599854728701238648283346764014769633995) [(2, 3), (7, 1), (11, 1)],
  term ((-49794017268134571589590260644228965512 : Rat) / 599854728701238648283346764014769633995) [(2, 3), (7, 1), (12, 1), (13, 1)],
  term ((183488243113488394739718246684116996552696960175428317 : Rat) / 92999895213201981850477343083626589746734642324746138) [(2, 3), (7, 1), (12, 1), (15, 1)],
  term ((-434461680526322 : Rat) / 1162780221153193) [(2, 3), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((52170129068766430306603786468421147060 : Rat) / 119970945740247729656669352802953926799) [(2, 3), (7, 1), (13, 1)],
  term ((6179138727918710691818933835158696451312183136130255472 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 3), (7, 1), (15, 1)],
  term ((6701416651161452 : Rat) / 1162780221153193) [(2, 3), (7, 1), (15, 1), (16, 1)],
  term ((397119697749071441202776676699968874332 : Rat) / 599854728701238648283346764014769633995) [(2, 3), (8, 1)],
  term ((-580332583183098106794526391365108351352 : Rat) / 599854728701238648283346764014769633995) [(2, 3), (9, 1), (11, 1)],
  term ((70325675920400782969222917978325705712 : Rat) / 599854728701238648283346764014769633995) [(2, 3), (9, 1), (12, 1), (13, 1)],
  term ((-1896151782245759226614217075335951718623712283315199773 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 3), (9, 1), (12, 1), (15, 1)],
  term ((461994601112796 : Rat) / 1162780221153193) [(2, 3), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-5710469539424841299399251406564832936092 : Rat) / 1799564186103715944850040292044308901985) [(2, 3), (9, 1), (13, 1)],
  term ((-7546349489404363289987077149215071141947076491465683143 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(2, 3), (9, 1), (15, 1)],
  term ((6723839922911702 : Rat) / 3488340663459579) [(2, 3), (9, 1), (15, 1), (16, 1)],
  term ((-709904404831437825780635961744887047748 : Rat) / 199951576233746216094448921338256544665) [(2, 3), (9, 2)],
  term ((60059846594267677279406589311277335612 : Rat) / 599854728701238648283346764014769633995) [(2, 3), (11, 1), (12, 1), (13, 1)],
  term ((-6544627211193844374324207850933658385537878969261824301 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(2, 3), (11, 1), (12, 1), (15, 1)],
  term ((448228140819559 : Rat) / 1162780221153193) [(2, 3), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-188722442315693407427840899617497803072 : Rat) / 119970945740247729656669352802953926799) [(2, 3), (11, 1), (13, 1)],
  term ((-137190219846581823769882591558384019657388474051565837181 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(2, 3), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 4, terms 100 through 199. -/
theorem ep_Q2_024_block_04_0100_0199_valid :
    checkProductSumEq ep_Q2_024_partials_04_0100_0199
      ep_Q2_024_block_04_0100_0199 = true := by
  native_decide

end EpQ2024TermShards

end Patterns

end EndpointCertificate

end Problem97
