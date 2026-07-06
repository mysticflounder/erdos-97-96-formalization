/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_024, term block 15:1100-1199

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_024`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2024TermShards

/-- Generator polynomial 15 for endpoint certificate `ep_Q2_024`. -/
def ep_Q2_024_generator_15_1100_1199 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(6, 1)]
]

/-- Coefficient term 1100 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1100 : Poly :=
[
  term ((-37665296397180 : Rat) / 1162780221153193) [(3, 1), (5, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1100 for generator 15. -/
def ep_Q2_024_partial_15_1100 : Poly :=
[
  term ((-75330592794360 : Rat) / 1162780221153193) [(3, 1), (5, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((37665296397180 : Rat) / 1162780221153193) [(3, 1), (5, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1100 for generator 15. -/
theorem ep_Q2_024_partial_15_1100_valid :
    mulPoly ep_Q2_024_coefficient_15_1100
        ep_Q2_024_generator_15_1100_1199 =
      ep_Q2_024_partial_15_1100 := by
  native_decide

/-- Coefficient term 1101 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1101 : Poly :=
[
  term ((-20236464028016908558024560015619523336 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (5, 1), (13, 2)]
]

/-- Partial product 1101 for generator 15. -/
def ep_Q2_024_partial_15_1101 : Poly :=
[
  term ((-40472928056033817116049120031239046672 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (5, 1), (6, 1), (13, 2)],
  term ((20236464028016908558024560015619523336 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (5, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1101 for generator 15. -/
theorem ep_Q2_024_partial_15_1101_valid :
    mulPoly ep_Q2_024_coefficient_15_1101
        ep_Q2_024_generator_15_1100_1199 =
      ep_Q2_024_partial_15_1101 := by
  native_decide

/-- Coefficient term 1102 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1102 : Poly :=
[
  term ((-4460575763931020940779677802964195788 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (14, 1)]
]

/-- Partial product 1102 for generator 15. -/
def ep_Q2_024_partial_15_1102 : Poly :=
[
  term ((-8921151527862041881559355605928391576 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (6, 1), (14, 1)],
  term ((4460575763931020940779677802964195788 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1102 for generator 15. -/
theorem ep_Q2_024_partial_15_1102_valid :
    mulPoly ep_Q2_024_coefficient_15_1102
        ep_Q2_024_generator_15_1100_1199 =
      ep_Q2_024_partial_15_1102 := by
  native_decide

/-- Coefficient term 1103 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1103 : Poly :=
[
  term ((-516867537500481935785037227210837255073476165152028907 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (5, 1), (15, 2)]
]

/-- Partial product 1103 for generator 15. -/
def ep_Q2_024_partial_15_1103 : Poly :=
[
  term ((-1033735075000963871570074454421674510146952330304057814 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (5, 1), (6, 1), (15, 2)],
  term ((516867537500481935785037227210837255073476165152028907 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (5, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1103 for generator 15. -/
theorem ep_Q2_024_partial_15_1103_valid :
    mulPoly ep_Q2_024_coefficient_15_1103
        ep_Q2_024_generator_15_1100_1199 =
      ep_Q2_024_partial_15_1103 := by
  native_decide

/-- Coefficient term 1104 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1104 : Poly :=
[
  term ((636026035247220 : Rat) / 1162780221153193) [(3, 1), (5, 1), (15, 2), (16, 1)]
]

/-- Partial product 1104 for generator 15. -/
def ep_Q2_024_partial_15_1104 : Poly :=
[
  term ((1272052070494440 : Rat) / 1162780221153193) [(3, 1), (5, 1), (6, 1), (15, 2), (16, 1)],
  term ((-636026035247220 : Rat) / 1162780221153193) [(3, 1), (5, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1104 for generator 15. -/
theorem ep_Q2_024_partial_15_1104_valid :
    mulPoly ep_Q2_024_coefficient_15_1104
        ep_Q2_024_generator_15_1100_1199 =
      ep_Q2_024_partial_15_1104 := by
  native_decide

/-- Coefficient term 1105 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1105 : Poly :=
[
  term ((16890983628896808743407603036576568848 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 2), (6, 1), (9, 1)]
]

/-- Partial product 1105 for generator 15. -/
def ep_Q2_024_partial_15_1105 : Poly :=
[
  term ((-16890983628896808743407603036576568848 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 2), (6, 1), (9, 1)],
  term ((33781967257793617486815206073153137696 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 2), (6, 2), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1105 for generator 15. -/
theorem ep_Q2_024_partial_15_1105_valid :
    mulPoly ep_Q2_024_coefficient_15_1105
        ep_Q2_024_generator_15_1100_1199 =
      ep_Q2_024_partial_15_1105 := by
  native_decide

/-- Coefficient term 1106 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1106 : Poly :=
[
  term ((20220074797511964466058292860462341536 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 2), (6, 1), (13, 1)]
]

/-- Partial product 1106 for generator 15. -/
def ep_Q2_024_partial_15_1106 : Poly :=
[
  term ((-20220074797511964466058292860462341536 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 2), (6, 1), (13, 1)],
  term ((40440149595023928932116585720924683072 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 2), (6, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1106 for generator 15. -/
theorem ep_Q2_024_partial_15_1106_valid :
    mulPoly ep_Q2_024_coefficient_15_1106
        ep_Q2_024_generator_15_1100_1199 =
      ep_Q2_024_partial_15_1106 := by
  native_decide

/-- Coefficient term 1107 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1107 : Poly :=
[
  term ((-1086812258876365631714711692878661467835285345215957824 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (5, 2), (6, 1), (15, 1)]
]

/-- Partial product 1107 for generator 15. -/
def ep_Q2_024_partial_15_1107 : Poly :=
[
  term ((1086812258876365631714711692878661467835285345215957824 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (5, 2), (6, 1), (15, 1)],
  term ((-2173624517752731263429423385757322935670570690431915648 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (5, 2), (6, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1107 for generator 15. -/
theorem ep_Q2_024_partial_15_1107_valid :
    mulPoly ep_Q2_024_coefficient_15_1107
        ep_Q2_024_generator_15_1100_1199 =
      ep_Q2_024_partial_15_1107 := by
  native_decide

/-- Coefficient term 1108 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1108 : Poly :=
[
  term ((-103470768511616 : Rat) / 1162780221153193) [(3, 1), (5, 2), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 1108 for generator 15. -/
def ep_Q2_024_partial_15_1108 : Poly :=
[
  term ((103470768511616 : Rat) / 1162780221153193) [(3, 1), (5, 2), (6, 1), (15, 1), (16, 1)],
  term ((-206941537023232 : Rat) / 1162780221153193) [(3, 1), (5, 2), (6, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1108 for generator 15. -/
theorem ep_Q2_024_partial_15_1108_valid :
    mulPoly ep_Q2_024_coefficient_15_1108
        ep_Q2_024_generator_15_1100_1199 =
      ep_Q2_024_partial_15_1108 := by
  native_decide

/-- Coefficient term 1109 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1109 : Poly :=
[
  term ((-33781967257793617486815206073153137696 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 2), (8, 1), (9, 1)]
]

/-- Partial product 1109 for generator 15. -/
def ep_Q2_024_partial_15_1109 : Poly :=
[
  term ((-67563934515587234973630412146306275392 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 2), (6, 1), (8, 1), (9, 1)],
  term ((33781967257793617486815206073153137696 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 2), (8, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1109 for generator 15. -/
theorem ep_Q2_024_partial_15_1109_valid :
    mulPoly ep_Q2_024_coefficient_15_1109
        ep_Q2_024_generator_15_1100_1199 =
      ep_Q2_024_partial_15_1109 := by
  native_decide

/-- Coefficient term 1110 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1110 : Poly :=
[
  term ((-40440149595023928932116585720924683072 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 2), (8, 1), (13, 1)]
]

/-- Partial product 1110 for generator 15. -/
def ep_Q2_024_partial_15_1110 : Poly :=
[
  term ((-80880299190047857864233171441849366144 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 2), (6, 1), (8, 1), (13, 1)],
  term ((40440149595023928932116585720924683072 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 2), (8, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1110 for generator 15. -/
theorem ep_Q2_024_partial_15_1110_valid :
    mulPoly ep_Q2_024_coefficient_15_1110
        ep_Q2_024_generator_15_1100_1199 =
      ep_Q2_024_partial_15_1110 := by
  native_decide

/-- Coefficient term 1111 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1111 : Poly :=
[
  term ((2173624517752731263429423385757322935670570690431915648 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (5, 2), (8, 1), (15, 1)]
]

/-- Partial product 1111 for generator 15. -/
def ep_Q2_024_partial_15_1111 : Poly :=
[
  term ((4347249035505462526858846771514645871341141380863831296 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (5, 2), (6, 1), (8, 1), (15, 1)],
  term ((-2173624517752731263429423385757322935670570690431915648 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (5, 2), (8, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1111 for generator 15. -/
theorem ep_Q2_024_partial_15_1111_valid :
    mulPoly ep_Q2_024_coefficient_15_1111
        ep_Q2_024_generator_15_1100_1199 =
      ep_Q2_024_partial_15_1111 := by
  native_decide

/-- Coefficient term 1112 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1112 : Poly :=
[
  term ((206941537023232 : Rat) / 1162780221153193) [(3, 1), (5, 2), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 1112 for generator 15. -/
def ep_Q2_024_partial_15_1112 : Poly :=
[
  term ((413883074046464 : Rat) / 1162780221153193) [(3, 1), (5, 2), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((-206941537023232 : Rat) / 1162780221153193) [(3, 1), (5, 2), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1112 for generator 15. -/
theorem ep_Q2_024_partial_15_1112_valid :
    mulPoly ep_Q2_024_coefficient_15_1112
        ep_Q2_024_generator_15_1100_1199 =
      ep_Q2_024_partial_15_1112 := by
  native_decide

/-- Coefficient term 1113 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1113 : Poly :=
[
  term ((8445491814448404371703801518288284424 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 2), (9, 1)]
]

/-- Partial product 1113 for generator 15. -/
def ep_Q2_024_partial_15_1113 : Poly :=
[
  term ((16890983628896808743407603036576568848 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 2), (6, 1), (9, 1)],
  term ((-8445491814448404371703801518288284424 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 2), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1113 for generator 15. -/
theorem ep_Q2_024_partial_15_1113_valid :
    mulPoly ep_Q2_024_coefficient_15_1113
        ep_Q2_024_generator_15_1100_1199 =
      ep_Q2_024_partial_15_1113 := by
  native_decide

/-- Coefficient term 1114 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1114 : Poly :=
[
  term ((10110037398755982233029146430231170768 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 2), (13, 1)]
]

/-- Partial product 1114 for generator 15. -/
def ep_Q2_024_partial_15_1114 : Poly :=
[
  term ((20220074797511964466058292860462341536 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 2), (6, 1), (13, 1)],
  term ((-10110037398755982233029146430231170768 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1114 for generator 15. -/
theorem ep_Q2_024_partial_15_1114_valid :
    mulPoly ep_Q2_024_coefficient_15_1114
        ep_Q2_024_generator_15_1100_1199 =
      ep_Q2_024_partial_15_1114 := by
  native_decide

/-- Coefficient term 1115 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1115 : Poly :=
[
  term ((-543406129438182815857355846439330733917642672607978912 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (5, 2), (15, 1)]
]

/-- Partial product 1115 for generator 15. -/
def ep_Q2_024_partial_15_1115 : Poly :=
[
  term ((-1086812258876365631714711692878661467835285345215957824 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (5, 2), (6, 1), (15, 1)],
  term ((543406129438182815857355846439330733917642672607978912 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (5, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1115 for generator 15. -/
theorem ep_Q2_024_partial_15_1115_valid :
    mulPoly ep_Q2_024_coefficient_15_1115
        ep_Q2_024_generator_15_1100_1199 =
      ep_Q2_024_partial_15_1115 := by
  native_decide

/-- Coefficient term 1116 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1116 : Poly :=
[
  term ((-51735384255808 : Rat) / 1162780221153193) [(3, 1), (5, 2), (15, 1), (16, 1)]
]

/-- Partial product 1116 for generator 15. -/
def ep_Q2_024_partial_15_1116 : Poly :=
[
  term ((-103470768511616 : Rat) / 1162780221153193) [(3, 1), (5, 2), (6, 1), (15, 1), (16, 1)],
  term ((51735384255808 : Rat) / 1162780221153193) [(3, 1), (5, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1116 for generator 15. -/
theorem ep_Q2_024_partial_15_1116_valid :
    mulPoly ep_Q2_024_coefficient_15_1116
        ep_Q2_024_generator_15_1100_1199 =
      ep_Q2_024_partial_15_1116 := by
  native_decide

/-- Coefficient term 1117 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1117 : Poly :=
[
  term ((-1615678198287579510326873412820606074044 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (6, 1), (9, 1)]
]

/-- Partial product 1117 for generator 15. -/
def ep_Q2_024_partial_15_1117 : Poly :=
[
  term ((1615678198287579510326873412820606074044 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (6, 1), (9, 1)],
  term ((-3231356396575159020653746825641212148088 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (6, 2), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1117 for generator 15. -/
theorem ep_Q2_024_partial_15_1117_valid :
    mulPoly ep_Q2_024_coefficient_15_1117
        ep_Q2_024_generator_15_1100_1199 =
      ep_Q2_024_partial_15_1117 := by
  native_decide

/-- Coefficient term 1118 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1118 : Poly :=
[
  term ((1606757046759717468445314057214677682468 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (6, 1), (9, 1), (12, 1)]
]

/-- Partial product 1118 for generator 15. -/
def ep_Q2_024_partial_15_1118 : Poly :=
[
  term ((-1606757046759717468445314057214677682468 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (6, 1), (9, 1), (12, 1)],
  term ((3213514093519434936890628114429355364936 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (6, 2), (9, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1118 for generator 15. -/
theorem ep_Q2_024_partial_15_1118_valid :
    mulPoly ep_Q2_024_coefficient_15_1118
        ep_Q2_024_generator_15_1100_1199 =
      ep_Q2_024_partial_15_1118 := by
  native_decide

/-- Coefficient term 1119 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1119 : Poly :=
[
  term ((-5219157720381596191771511451173724274739044980621804946 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (6, 1), (9, 1), (13, 1), (15, 1)]
]

/-- Partial product 1119 for generator 15. -/
def ep_Q2_024_partial_15_1119 : Poly :=
[
  term ((5219157720381596191771511451173724274739044980621804946 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (6, 1), (9, 1), (13, 1), (15, 1)],
  term ((-10438315440763192383543022902347448549478089961243609892 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (6, 2), (9, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1119 for generator 15. -/
theorem ep_Q2_024_partial_15_1119_valid :
    mulPoly ep_Q2_024_coefficient_15_1119
        ep_Q2_024_generator_15_1100_1199 =
      ep_Q2_024_partial_15_1119 := by
  native_decide

/-- Coefficient term 1120 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1120 : Poly :=
[
  term ((75330592794360 : Rat) / 1162780221153193) [(3, 1), (6, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1120 for generator 15. -/
def ep_Q2_024_partial_15_1120 : Poly :=
[
  term ((-75330592794360 : Rat) / 1162780221153193) [(3, 1), (6, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((150661185588720 : Rat) / 1162780221153193) [(3, 1), (6, 2), (9, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1120 for generator 15. -/
theorem ep_Q2_024_partial_15_1120_valid :
    mulPoly ep_Q2_024_coefficient_15_1120
        ep_Q2_024_generator_15_1100_1199 =
      ep_Q2_024_partial_15_1120 := by
  native_decide

/-- Coefficient term 1121 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1121 : Poly :=
[
  term ((40472928056033817116049120031239046672 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (6, 1), (9, 1), (13, 2)]
]

/-- Partial product 1121 for generator 15. -/
def ep_Q2_024_partial_15_1121 : Poly :=
[
  term ((-40472928056033817116049120031239046672 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (6, 1), (9, 1), (13, 2)],
  term ((80945856112067634232098240062478093344 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (6, 2), (9, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1121 for generator 15. -/
theorem ep_Q2_024_partial_15_1121_valid :
    mulPoly ep_Q2_024_coefficient_15_1121
        ep_Q2_024_generator_15_1100_1199 =
      ep_Q2_024_partial_15_1121 := by
  native_decide

/-- Coefficient term 1122 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1122 : Poly :=
[
  term ((-31392739517477594675639583059712090172 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (6, 1), (9, 1), (14, 1)]
]

/-- Partial product 1122 for generator 15. -/
def ep_Q2_024_partial_15_1122 : Poly :=
[
  term ((31392739517477594675639583059712090172 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (6, 1), (9, 1), (14, 1)],
  term ((-62785479034955189351279166119424180344 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (6, 2), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1122 for generator 15. -/
theorem ep_Q2_024_partial_15_1122_valid :
    mulPoly ep_Q2_024_coefficient_15_1122
        ep_Q2_024_generator_15_1100_1199 =
      ep_Q2_024_partial_15_1122 := by
  native_decide

/-- Coefficient term 1123 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1123 : Poly :=
[
  term ((1701862806137584762382089979266698299950310568861087192 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (6, 1), (9, 1), (15, 2)]
]

/-- Partial product 1123 for generator 15. -/
def ep_Q2_024_partial_15_1123 : Poly :=
[
  term ((-1701862806137584762382089979266698299950310568861087192 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (6, 1), (9, 1), (15, 2)],
  term ((3403725612275169524764179958533396599900621137722174384 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (6, 2), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1123 for generator 15. -/
theorem ep_Q2_024_partial_15_1123_valid :
    mulPoly ep_Q2_024_coefficient_15_1123
        ep_Q2_024_generator_15_1100_1199 =
      ep_Q2_024_partial_15_1123 := by
  native_decide

/-- Coefficient term 1124 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1124 : Poly :=
[
  term ((430037916073728 : Rat) / 1162780221153193) [(3, 1), (6, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 1124 for generator 15. -/
def ep_Q2_024_partial_15_1124 : Poly :=
[
  term ((-430037916073728 : Rat) / 1162780221153193) [(3, 1), (6, 1), (9, 1), (15, 2), (16, 1)],
  term ((860075832147456 : Rat) / 1162780221153193) [(3, 1), (6, 2), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1124 for generator 15. -/
theorem ep_Q2_024_partial_15_1124_valid :
    mulPoly ep_Q2_024_coefficient_15_1124
        ep_Q2_024_generator_15_1100_1199 =
      ep_Q2_024_partial_15_1124 := by
  native_decide

/-- Coefficient term 1125 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1125 : Poly :=
[
  term ((78274801493699222926203641708507255904 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (6, 1), (9, 2), (13, 1)]
]

/-- Partial product 1125 for generator 15. -/
def ep_Q2_024_partial_15_1125 : Poly :=
[
  term ((-78274801493699222926203641708507255904 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (6, 1), (9, 2), (13, 1)],
  term ((156549602987398445852407283417014511808 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (6, 2), (9, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1125 for generator 15. -/
theorem ep_Q2_024_partial_15_1125_valid :
    mulPoly ep_Q2_024_coefficient_15_1125
        ep_Q2_024_generator_15_1100_1199 =
      ep_Q2_024_partial_15_1125 := by
  native_decide

/-- Coefficient term 1126 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1126 : Poly :=
[
  term ((-784194080123272474066747187140747888160160051635280743 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (6, 1), (9, 2), (15, 1)]
]

/-- Partial product 1126 for generator 15. -/
def ep_Q2_024_partial_15_1126 : Poly :=
[
  term ((784194080123272474066747187140747888160160051635280743 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (6, 1), (9, 2), (15, 1)],
  term ((-1568388160246544948133494374281495776320320103270561486 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (6, 2), (9, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1126 for generator 15. -/
theorem ep_Q2_024_partial_15_1126_valid :
    mulPoly ep_Q2_024_coefficient_15_1126
        ep_Q2_024_generator_15_1100_1199 =
      ep_Q2_024_partial_15_1126 := by
  native_decide

/-- Coefficient term 1127 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1127 : Poly :=
[
  term ((747574224772468 : Rat) / 1162780221153193) [(3, 1), (6, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 1127 for generator 15. -/
def ep_Q2_024_partial_15_1127 : Poly :=
[
  term ((-747574224772468 : Rat) / 1162780221153193) [(3, 1), (6, 1), (9, 2), (15, 1), (16, 1)],
  term ((1495148449544936 : Rat) / 1162780221153193) [(3, 1), (6, 2), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1127 for generator 15. -/
theorem ep_Q2_024_partial_15_1127_valid :
    mulPoly ep_Q2_024_coefficient_15_1127
        ep_Q2_024_generator_15_1100_1199 =
      ep_Q2_024_partial_15_1127 := by
  native_decide

/-- Coefficient term 1128 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1128 : Poly :=
[
  term ((63112532186469946331305143931700421056 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (6, 1), (9, 3)]
]

/-- Partial product 1128 for generator 15. -/
def ep_Q2_024_partial_15_1128 : Poly :=
[
  term ((-63112532186469946331305143931700421056 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (6, 1), (9, 3)],
  term ((126225064372939892662610287863400842112 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (6, 2), (9, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1128 for generator 15. -/
theorem ep_Q2_024_partial_15_1128_valid :
    mulPoly ep_Q2_024_coefficient_15_1128
        ep_Q2_024_generator_15_1100_1199 =
      ep_Q2_024_partial_15_1128 := by
  native_decide

/-- Coefficient term 1129 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1129 : Poly :=
[
  term ((-103548220870655574374203064328778233604 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (6, 1), (12, 1), (13, 1)]
]

/-- Partial product 1129 for generator 15. -/
def ep_Q2_024_partial_15_1129 : Poly :=
[
  term ((103548220870655574374203064328778233604 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (6, 1), (12, 1), (13, 1)],
  term ((-207096441741311148748406128657556467208 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (6, 2), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1129 for generator 15. -/
theorem ep_Q2_024_partial_15_1129_valid :
    mulPoly ep_Q2_024_coefficient_15_1129
        ep_Q2_024_generator_15_1100_1199 =
      ep_Q2_024_partial_15_1129 := by
  native_decide

/-- Coefficient term 1130 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1130 : Poly :=
[
  term ((-7361797039595291049606458569276731235884520907461058105 : Rat) / 278999685639605945551432029250879769240203926974238414) [(3, 1), (6, 1), (12, 1), (15, 1)]
]

/-- Partial product 1130 for generator 15. -/
def ep_Q2_024_partial_15_1130 : Poly :=
[
  term ((7361797039595291049606458569276731235884520907461058105 : Rat) / 278999685639605945551432029250879769240203926974238414) [(3, 1), (6, 1), (12, 1), (15, 1)],
  term ((-7361797039595291049606458569276731235884520907461058105 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 1), (6, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1130 for generator 15. -/
theorem ep_Q2_024_partial_15_1130_valid :
    mulPoly ep_Q2_024_coefficient_15_1130
        ep_Q2_024_generator_15_1100_1199 =
      ep_Q2_024_partial_15_1130 := by
  native_decide

/-- Coefficient term 1131 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1131 : Poly :=
[
  term ((-7135878331687774 : Rat) / 1162780221153193) [(3, 1), (6, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1131 for generator 15. -/
def ep_Q2_024_partial_15_1131 : Poly :=
[
  term ((7135878331687774 : Rat) / 1162780221153193) [(3, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-14271756663375548 : Rat) / 1162780221153193) [(3, 1), (6, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1131 for generator 15. -/
theorem ep_Q2_024_partial_15_1131_valid :
    mulPoly ep_Q2_024_coefficient_15_1131
        ep_Q2_024_generator_15_1100_1199 =
      ep_Q2_024_partial_15_1131 := by
  native_decide

/-- Coefficient term 1132 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1132 : Poly :=
[
  term ((49794017268134571589590260644228965512 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (6, 1), (12, 2), (13, 1)]
]

/-- Partial product 1132 for generator 15. -/
def ep_Q2_024_partial_15_1132 : Poly :=
[
  term ((-49794017268134571589590260644228965512 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (6, 1), (12, 2), (13, 1)],
  term ((99588034536269143179180521288457931024 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (6, 2), (12, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1132 for generator 15. -/
theorem ep_Q2_024_partial_15_1132_valid :
    mulPoly ep_Q2_024_coefficient_15_1132
        ep_Q2_024_generator_15_1100_1199 =
      ep_Q2_024_partial_15_1132 := by
  native_decide

/-- Coefficient term 1133 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1133 : Poly :=
[
  term ((-183488243113488394739718246684116996552696960175428317 : Rat) / 92999895213201981850477343083626589746734642324746138) [(3, 1), (6, 1), (12, 2), (15, 1)]
]

/-- Partial product 1133 for generator 15. -/
def ep_Q2_024_partial_15_1133 : Poly :=
[
  term ((183488243113488394739718246684116996552696960175428317 : Rat) / 92999895213201981850477343083626589746734642324746138) [(3, 1), (6, 1), (12, 2), (15, 1)],
  term ((-183488243113488394739718246684116996552696960175428317 : Rat) / 46499947606600990925238671541813294873367321162373069) [(3, 1), (6, 2), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1133 for generator 15. -/
theorem ep_Q2_024_partial_15_1133_valid :
    mulPoly ep_Q2_024_coefficient_15_1133
        ep_Q2_024_generator_15_1100_1199 =
      ep_Q2_024_partial_15_1133 := by
  native_decide

/-- Coefficient term 1134 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1134 : Poly :=
[
  term ((434461680526322 : Rat) / 1162780221153193) [(3, 1), (6, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 1134 for generator 15. -/
def ep_Q2_024_partial_15_1134 : Poly :=
[
  term ((-434461680526322 : Rat) / 1162780221153193) [(3, 1), (6, 1), (12, 2), (15, 1), (16, 1)],
  term ((868923361052644 : Rat) / 1162780221153193) [(3, 1), (6, 2), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1134 for generator 15. -/
theorem ep_Q2_024_partial_15_1134_valid :
    mulPoly ep_Q2_024_coefficient_15_1134
        ep_Q2_024_generator_15_1100_1199 =
      ep_Q2_024_partial_15_1134 := by
  native_decide

/-- Coefficient term 1135 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1135 : Poly :=
[
  term ((52170129068766430306603786468421147060 : Rat) / 119970945740247729656669352802953926799) [(3, 1), (6, 1), (13, 1)]
]

/-- Partial product 1135 for generator 15. -/
def ep_Q2_024_partial_15_1135 : Poly :=
[
  term ((-52170129068766430306603786468421147060 : Rat) / 119970945740247729656669352802953926799) [(3, 1), (6, 1), (13, 1)],
  term ((104340258137532860613207572936842294120 : Rat) / 119970945740247729656669352802953926799) [(3, 1), (6, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1135 for generator 15. -/
theorem ep_Q2_024_partial_15_1135_valid :
    mulPoly ep_Q2_024_coefficient_15_1135
        ep_Q2_024_generator_15_1100_1199 =
      ep_Q2_024_partial_15_1135 := by
  native_decide

/-- Coefficient term 1136 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1136 : Poly :=
[
  term ((150204747408753331133563940143506612364 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (6, 1), (13, 1), (14, 1)]
]

/-- Partial product 1136 for generator 15. -/
def ep_Q2_024_partial_15_1136 : Poly :=
[
  term ((-150204747408753331133563940143506612364 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (6, 1), (13, 1), (14, 1)],
  term ((300409494817506662267127880287013224728 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (6, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1136 for generator 15. -/
theorem ep_Q2_024_partial_15_1136_valid :
    mulPoly ep_Q2_024_coefficient_15_1136
        ep_Q2_024_generator_15_1100_1199 =
      ep_Q2_024_partial_15_1136 := by
  native_decide

/-- Coefficient term 1137 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1137 : Poly :=
[
  term ((-11505073964399522846249871046495738097852688577051920964 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (6, 1), (13, 1), (15, 2)]
]

/-- Partial product 1137 for generator 15. -/
def ep_Q2_024_partial_15_1137 : Poly :=
[
  term ((11505073964399522846249871046495738097852688577051920964 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (6, 1), (13, 1), (15, 2)],
  term ((-23010147928799045692499742092991476195705377154103841928 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (6, 2), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1137 for generator 15. -/
theorem ep_Q2_024_partial_15_1137_valid :
    mulPoly ep_Q2_024_coefficient_15_1137
        ep_Q2_024_generator_15_1100_1199 =
      ep_Q2_024_partial_15_1137 := by
  native_decide

/-- Coefficient term 1138 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1138 : Poly :=
[
  term ((150661185588720 : Rat) / 1162780221153193) [(3, 1), (6, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 1138 for generator 15. -/
def ep_Q2_024_partial_15_1138 : Poly :=
[
  term ((-150661185588720 : Rat) / 1162780221153193) [(3, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((301322371177440 : Rat) / 1162780221153193) [(3, 1), (6, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1138 for generator 15. -/
theorem ep_Q2_024_partial_15_1138_valid :
    mulPoly ep_Q2_024_coefficient_15_1138
        ep_Q2_024_generator_15_1100_1199 =
      ep_Q2_024_partial_15_1138 := by
  native_decide

/-- Coefficient term 1139 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1139 : Poly :=
[
  term ((80945856112067634232098240062478093344 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (6, 1), (13, 2), (15, 1)]
]

/-- Partial product 1139 for generator 15. -/
def ep_Q2_024_partial_15_1139 : Poly :=
[
  term ((-80945856112067634232098240062478093344 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (6, 1), (13, 2), (15, 1)],
  term ((161891712224135268464196480124956186688 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (6, 2), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1139 for generator 15. -/
theorem ep_Q2_024_partial_15_1139_valid :
    mulPoly ep_Q2_024_coefficient_15_1139
        ep_Q2_024_generator_15_1100_1199 =
      ep_Q2_024_partial_15_1139 := by
  native_decide

/-- Coefficient term 1140 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1140 : Poly :=
[
  term ((1643793228332255021187175098776411284888032943018583779 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(3, 1), (6, 1), (14, 1), (15, 1)]
]

/-- Partial product 1140 for generator 15. -/
def ep_Q2_024_partial_15_1140 : Poly :=
[
  term ((-1643793228332255021187175098776411284888032943018583779 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(3, 1), (6, 1), (14, 1), (15, 1)],
  term ((1643793228332255021187175098776411284888032943018583779 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(3, 1), (6, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1140 for generator 15. -/
theorem ep_Q2_024_partial_15_1140_valid :
    mulPoly ep_Q2_024_coefficient_15_1140
        ep_Q2_024_generator_15_1100_1199 =
      ep_Q2_024_partial_15_1140 := by
  native_decide

/-- Coefficient term 1141 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1141 : Poly :=
[
  term ((-929762167201001 : Rat) / 1162780221153193) [(3, 1), (6, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1141 for generator 15. -/
def ep_Q2_024_partial_15_1141 : Poly :=
[
  term ((929762167201001 : Rat) / 1162780221153193) [(3, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1859524334402002 : Rat) / 1162780221153193) [(3, 1), (6, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1141 for generator 15. -/
theorem ep_Q2_024_partial_15_1141_valid :
    mulPoly ep_Q2_024_coefficient_15_1141
        ep_Q2_024_generator_15_1100_1199 =
      ep_Q2_024_partial_15_1141 := by
  native_decide

/-- Coefficient term 1142 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1142 : Poly :=
[
  term ((3764988045794031994072069891791841198723921241369511226 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 1), (6, 1), (15, 1)]
]

/-- Partial product 1142 for generator 15. -/
def ep_Q2_024_partial_15_1142 : Poly :=
[
  term ((-3764988045794031994072069891791841198723921241369511226 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 1), (6, 1), (15, 1)],
  term ((7529976091588063988144139783583682397447842482739022452 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 1), (6, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1142 for generator 15. -/
theorem ep_Q2_024_partial_15_1142_valid :
    mulPoly ep_Q2_024_coefficient_15_1142
        ep_Q2_024_generator_15_1100_1199 =
      ep_Q2_024_partial_15_1142 := by
  native_decide

/-- Coefficient term 1143 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1143 : Poly :=
[
  term ((6701416651161452 : Rat) / 1162780221153193) [(3, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 1143 for generator 15. -/
def ep_Q2_024_partial_15_1143 : Poly :=
[
  term ((-6701416651161452 : Rat) / 1162780221153193) [(3, 1), (6, 1), (15, 1), (16, 1)],
  term ((13402833302322904 : Rat) / 1162780221153193) [(3, 1), (6, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1143 for generator 15. -/
theorem ep_Q2_024_partial_15_1143_valid :
    mulPoly ep_Q2_024_coefficient_15_1143
        ep_Q2_024_generator_15_1100_1199 =
      ep_Q2_024_partial_15_1143 := by
  native_decide

/-- Coefficient term 1144 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1144 : Poly :=
[
  term ((5633709133854896624680034347401390035670218004313073105 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 1), (6, 1), (15, 3)]
]

/-- Partial product 1144 for generator 15. -/
def ep_Q2_024_partial_15_1144 : Poly :=
[
  term ((-5633709133854896624680034347401390035670218004313073105 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 1), (6, 1), (15, 3)],
  term ((11267418267709793249360068694802780071340436008626146210 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 1), (6, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1144 for generator 15. -/
theorem ep_Q2_024_partial_15_1144_valid :
    mulPoly ep_Q2_024_coefficient_15_1144
        ep_Q2_024_generator_15_1100_1199 =
      ep_Q2_024_partial_15_1144 := by
  native_decide

/-- Coefficient term 1145 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1145 : Poly :=
[
  term ((-4263316396002204 : Rat) / 1162780221153193) [(3, 1), (6, 1), (15, 3), (16, 1)]
]

/-- Partial product 1145 for generator 15. -/
def ep_Q2_024_partial_15_1145 : Poly :=
[
  term ((4263316396002204 : Rat) / 1162780221153193) [(3, 1), (6, 1), (15, 3), (16, 1)],
  term ((-8526632792004408 : Rat) / 1162780221153193) [(3, 1), (6, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1145 for generator 15. -/
theorem ep_Q2_024_partial_15_1145_valid :
    mulPoly ep_Q2_024_coefficient_15_1145
        ep_Q2_024_generator_15_1100_1199 =
      ep_Q2_024_partial_15_1145 := by
  native_decide

/-- Coefficient term 1146 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1146 : Poly :=
[
  term ((148463915429989232827957433590977261265 : Rat) / 119970945740247729656669352802953926799) [(3, 1), (7, 1), (8, 1)]
]

/-- Partial product 1146 for generator 15. -/
def ep_Q2_024_partial_15_1146 : Poly :=
[
  term ((296927830859978465655914867181954522530 : Rat) / 119970945740247729656669352802953926799) [(3, 1), (6, 1), (7, 1), (8, 1)],
  term ((-148463915429989232827957433590977261265 : Rat) / 119970945740247729656669352802953926799) [(3, 1), (7, 1), (8, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1146 for generator 15. -/
theorem ep_Q2_024_partial_15_1146_valid :
    mulPoly ep_Q2_024_coefficient_15_1146
        ep_Q2_024_generator_15_1100_1199 =
      ep_Q2_024_partial_15_1146 := by
  native_decide

/-- Coefficient term 1147 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1147 : Poly :=
[
  term ((117412202240548834389305462562760883856 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (7, 1), (8, 1), (9, 1), (13, 1)]
]

/-- Partial product 1147 for generator 15. -/
def ep_Q2_024_partial_15_1147 : Poly :=
[
  term ((234824404481097668778610925125521767712 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (6, 1), (7, 1), (8, 1), (9, 1), (13, 1)],
  term ((-117412202240548834389305462562760883856 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (7, 1), (8, 1), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1147 for generator 15. -/
theorem ep_Q2_024_partial_15_1147_valid :
    mulPoly ep_Q2_024_coefficient_15_1147
        ep_Q2_024_generator_15_1100_1199 =
      ep_Q2_024_partial_15_1147 := by
  native_decide

/-- Coefficient term 1148 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1148 : Poly :=
[
  term ((-1222689308379968181009349179356074961661002890148376823 : Rat) / 464999476066009909252386715418132948733673211623730690) [(3, 1), (7, 1), (8, 1), (9, 1), (15, 1)]
]

/-- Partial product 1148 for generator 15. -/
def ep_Q2_024_partial_15_1148 : Poly :=
[
  term ((-1222689308379968181009349179356074961661002890148376823 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (6, 1), (7, 1), (8, 1), (9, 1), (15, 1)],
  term ((1222689308379968181009349179356074961661002890148376823 : Rat) / 464999476066009909252386715418132948733673211623730690) [(3, 1), (7, 1), (8, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1148 for generator 15. -/
theorem ep_Q2_024_partial_15_1148_valid :
    mulPoly ep_Q2_024_coefficient_15_1148
        ep_Q2_024_generator_15_1100_1199 =
      ep_Q2_024_partial_15_1148 := by
  native_decide

/-- Coefficient term 1149 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1149 : Poly :=
[
  term ((1121361337158702 : Rat) / 1162780221153193) [(3, 1), (7, 1), (8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 1149 for generator 15. -/
def ep_Q2_024_partial_15_1149 : Poly :=
[
  term ((2242722674317404 : Rat) / 1162780221153193) [(3, 1), (6, 1), (7, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-1121361337158702 : Rat) / 1162780221153193) [(3, 1), (7, 1), (8, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1149 for generator 15. -/
theorem ep_Q2_024_partial_15_1149_valid :
    mulPoly ep_Q2_024_coefficient_15_1149
        ep_Q2_024_generator_15_1100_1199 =
      ep_Q2_024_partial_15_1149 := by
  native_decide

/-- Coefficient term 1150 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1150 : Poly :=
[
  term ((94668798279704919496957715897550631584 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (7, 1), (8, 1), (9, 2)]
]

/-- Partial product 1150 for generator 15. -/
def ep_Q2_024_partial_15_1150 : Poly :=
[
  term ((189337596559409838993915431795101263168 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (6, 1), (7, 1), (8, 1), (9, 2)],
  term ((-94668798279704919496957715897550631584 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (7, 1), (8, 1), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1150 for generator 15. -/
theorem ep_Q2_024_partial_15_1150_valid :
    mulPoly ep_Q2_024_coefficient_15_1150
        ep_Q2_024_generator_15_1100_1199 =
      ep_Q2_024_partial_15_1150 := by
  native_decide

/-- Coefficient term 1151 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1151 : Poly :=
[
  term ((111299364507379375004267245031895710258 : Rat) / 119970945740247729656669352802953926799) [(3, 1), (7, 1), (8, 1), (12, 1)]
]

/-- Partial product 1151 for generator 15. -/
def ep_Q2_024_partial_15_1151 : Poly :=
[
  term ((222598729014758750008534490063791420516 : Rat) / 119970945740247729656669352802953926799) [(3, 1), (6, 1), (7, 1), (8, 1), (12, 1)],
  term ((-111299364507379375004267245031895710258 : Rat) / 119970945740247729656669352802953926799) [(3, 1), (7, 1), (8, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1151 for generator 15. -/
theorem ep_Q2_024_partial_15_1151_valid :
    mulPoly ep_Q2_024_coefficient_15_1151
        ep_Q2_024_generator_15_1100_1199 =
      ep_Q2_024_partial_15_1151 := by
  native_decide

/-- Coefficient term 1152 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1152 : Poly :=
[
  term ((33273931020260669930661190011024360672 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 1152 for generator 15. -/
def ep_Q2_024_partial_15_1152 : Poly :=
[
  term ((66547862040521339861322380022048721344 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (6, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((-33273931020260669930661190011024360672 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1152 for generator 15. -/
theorem ep_Q2_024_partial_15_1152_valid :
    mulPoly ep_Q2_024_coefficient_15_1152
        ep_Q2_024_generator_15_1100_1199 =
      ep_Q2_024_partial_15_1152 := by
  native_decide

/-- Coefficient term 1153 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1153 : Poly :=
[
  term ((-198745616475118943998092102782769635563595552220534688 : Rat) / 46499947606600990925238671541813294873367321162373069) [(3, 1), (7, 1), (8, 1), (12, 1), (15, 2)]
]

/-- Partial product 1153 for generator 15. -/
def ep_Q2_024_partial_15_1153 : Poly :=
[
  term ((-397491232950237887996184205565539271127191104441069376 : Rat) / 46499947606600990925238671541813294873367321162373069) [(3, 1), (6, 1), (7, 1), (8, 1), (12, 1), (15, 2)],
  term ((198745616475118943998092102782769635563595552220534688 : Rat) / 46499947606600990925238671541813294873367321162373069) [(3, 1), (7, 1), (8, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1153 for generator 15. -/
theorem ep_Q2_024_partial_15_1153_valid :
    mulPoly ep_Q2_024_coefficient_15_1153
        ep_Q2_024_generator_15_1100_1199 =
      ep_Q2_024_partial_15_1153 := by
  native_decide

/-- Coefficient term 1154 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1154 : Poly :=
[
  term ((1581632301823296 : Rat) / 1162780221153193) [(3, 1), (7, 1), (8, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1154 for generator 15. -/
def ep_Q2_024_partial_15_1154 : Poly :=
[
  term ((3163264603646592 : Rat) / 1162780221153193) [(3, 1), (6, 1), (7, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-1581632301823296 : Rat) / 1162780221153193) [(3, 1), (7, 1), (8, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1154 for generator 15. -/
theorem ep_Q2_024_partial_15_1154_valid :
    mulPoly ep_Q2_024_coefficient_15_1154
        ep_Q2_024_generator_15_1100_1199 =
      ep_Q2_024_partial_15_1154 := by
  native_decide

/-- Coefficient term 1155 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1155 : Poly :=
[
  term ((-13665940368750242398805821778499109403651343582341271507 : Rat) / 929998952132019818504773430836265897467346423247461380) [(3, 1), (7, 1), (8, 1), (13, 1), (15, 1)]
]

/-- Partial product 1155 for generator 15. -/
def ep_Q2_024_partial_15_1155 : Poly :=
[
  term ((-13665940368750242398805821778499109403651343582341271507 : Rat) / 464999476066009909252386715418132948733673211623730690) [(3, 1), (6, 1), (7, 1), (8, 1), (13, 1), (15, 1)],
  term ((13665940368750242398805821778499109403651343582341271507 : Rat) / 929998952132019818504773430836265897467346423247461380) [(3, 1), (7, 1), (8, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1155 for generator 15. -/
theorem ep_Q2_024_partial_15_1155_valid :
    mulPoly ep_Q2_024_coefficient_15_1155
        ep_Q2_024_generator_15_1100_1199 =
      ep_Q2_024_partial_15_1155 := by
  native_decide

/-- Coefficient term 1156 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1156 : Poly :=
[
  term ((106291408585995 : Rat) / 1162780221153193) [(3, 1), (7, 1), (8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1156 for generator 15. -/
def ep_Q2_024_partial_15_1156 : Poly :=
[
  term ((212582817171990 : Rat) / 1162780221153193) [(3, 1), (6, 1), (7, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-106291408585995 : Rat) / 1162780221153193) [(3, 1), (7, 1), (8, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1156 for generator 15. -/
theorem ep_Q2_024_partial_15_1156_valid :
    mulPoly ep_Q2_024_coefficient_15_1156
        ep_Q2_024_generator_15_1100_1199 =
      ep_Q2_024_partial_15_1156 := by
  native_decide

/-- Coefficient term 1157 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1157 : Poly :=
[
  term ((-16187308625359244326701932651346745316 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (7, 1), (8, 1), (13, 2)]
]

/-- Partial product 1157 for generator 15. -/
def ep_Q2_024_partial_15_1157 : Poly :=
[
  term ((-32374617250718488653403865302693490632 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (6, 1), (7, 1), (8, 1), (13, 2)],
  term ((16187308625359244326701932651346745316 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (7, 1), (8, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1157 for generator 15. -/
theorem ep_Q2_024_partial_15_1157_valid :
    mulPoly ep_Q2_024_coefficient_15_1157
        ep_Q2_024_generator_15_1100_1199 =
      ep_Q2_024_partial_15_1157 := by
  native_decide

/-- Coefficient term 1158 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1158 : Poly :=
[
  term ((-608824481858962455612092181941373992077 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (7, 1), (8, 1), (14, 1)]
]

/-- Partial product 1158 for generator 15. -/
def ep_Q2_024_partial_15_1158 : Poly :=
[
  term ((-1217648963717924911224184363882747984154 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (6, 1), (7, 1), (8, 1), (14, 1)],
  term ((608824481858962455612092181941373992077 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (7, 1), (8, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1158 for generator 15. -/
theorem ep_Q2_024_partial_15_1158_valid :
    mulPoly ep_Q2_024_coefficient_15_1158
        ep_Q2_024_generator_15_1100_1199 =
      ep_Q2_024_partial_15_1158 := by
  native_decide

/-- Coefficient term 1159 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1159 : Poly :=
[
  term ((2298204085221019497339885976171791710852429622693000547 : Rat) / 47288082311797617890073225296759282922068462199023460) [(3, 1), (7, 1), (8, 1), (15, 2)]
]

/-- Partial product 1159 for generator 15. -/
def ep_Q2_024_partial_15_1159 : Poly :=
[
  term ((2298204085221019497339885976171791710852429622693000547 : Rat) / 23644041155898808945036612648379641461034231099511730) [(3, 1), (6, 1), (7, 1), (8, 1), (15, 2)],
  term ((-2298204085221019497339885976171791710852429622693000547 : Rat) / 47288082311797617890073225296759282922068462199023460) [(3, 1), (7, 1), (8, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1159 for generator 15. -/
theorem ep_Q2_024_partial_15_1159_valid :
    mulPoly ep_Q2_024_coefficient_15_1159
        ep_Q2_024_generator_15_1100_1199 =
      ep_Q2_024_partial_15_1159 := by
  native_decide

/-- Coefficient term 1160 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1160 : Poly :=
[
  term ((-1048479305353675 : Rat) / 1162780221153193) [(3, 1), (7, 1), (8, 1), (15, 2), (16, 1)]
]

/-- Partial product 1160 for generator 15. -/
def ep_Q2_024_partial_15_1160 : Poly :=
[
  term ((-2096958610707350 : Rat) / 1162780221153193) [(3, 1), (6, 1), (7, 1), (8, 1), (15, 2), (16, 1)],
  term ((1048479305353675 : Rat) / 1162780221153193) [(3, 1), (7, 1), (8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1160 for generator 15. -/
theorem ep_Q2_024_partial_15_1160_valid :
    mulPoly ep_Q2_024_coefficient_15_1160
        ep_Q2_024_generator_15_1100_1199 =
      ep_Q2_024_partial_15_1160 := by
  native_decide

/-- Coefficient term 1161 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1161 : Poly :=
[
  term ((-826347564150239326187536952436868474864 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (7, 1), (8, 2)]
]

/-- Partial product 1161 for generator 15. -/
def ep_Q2_024_partial_15_1161 : Poly :=
[
  term ((-1652695128300478652375073904873736949728 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (6, 1), (7, 1), (8, 2)],
  term ((826347564150239326187536952436868474864 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (7, 1), (8, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1161 for generator 15. -/
theorem ep_Q2_024_partial_15_1161_valid :
    mulPoly ep_Q2_024_coefficient_15_1161
        ep_Q2_024_generator_15_1100_1199 =
      ep_Q2_024_partial_15_1161 := by
  native_decide

/-- Coefficient term 1162 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1162 : Poly :=
[
  term ((-39137400746849611463101820854253627952 : Rat) / 39990315246749243218889784267651308933) [(3, 1), (7, 1), (9, 1), (12, 1), (13, 1)]
]

/-- Partial product 1162 for generator 15. -/
def ep_Q2_024_partial_15_1162 : Poly :=
[
  term ((-78274801493699222926203641708507255904 : Rat) / 39990315246749243218889784267651308933) [(3, 1), (6, 1), (7, 1), (9, 1), (12, 1), (13, 1)],
  term ((39137400746849611463101820854253627952 : Rat) / 39990315246749243218889784267651308933) [(3, 1), (7, 1), (9, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1162 for generator 15. -/
theorem ep_Q2_024_partial_15_1162_valid :
    mulPoly ep_Q2_024_coefficient_15_1162
        ep_Q2_024_generator_15_1100_1199 =
      ep_Q2_024_partial_15_1162 := by
  native_decide

/-- Coefficient term 1163 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1163 : Poly :=
[
  term ((6117088134986307917740122211961773302290741365461673651 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(3, 1), (7, 1), (9, 1), (12, 1), (15, 1)]
]

/-- Partial product 1163 for generator 15. -/
def ep_Q2_024_partial_15_1163 : Poly :=
[
  term ((6117088134986307917740122211961773302290741365461673651 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (6, 1), (7, 1), (9, 1), (12, 1), (15, 1)],
  term ((-6117088134986307917740122211961773302290741365461673651 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(3, 1), (7, 1), (9, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1163 for generator 15. -/
theorem ep_Q2_024_partial_15_1163_valid :
    mulPoly ep_Q2_024_coefficient_15_1163
        ep_Q2_024_generator_15_1100_1199 =
      ep_Q2_024_partial_15_1163 := by
  native_decide

/-- Coefficient term 1164 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1164 : Poly :=
[
  term ((-1868935561931170 : Rat) / 1162780221153193) [(3, 1), (7, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1164 for generator 15. -/
def ep_Q2_024_partial_15_1164 : Poly :=
[
  term ((-3737871123862340 : Rat) / 1162780221153193) [(3, 1), (6, 1), (7, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((1868935561931170 : Rat) / 1162780221153193) [(3, 1), (7, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1164 for generator 15. -/
theorem ep_Q2_024_partial_15_1164_valid :
    mulPoly ep_Q2_024_coefficient_15_1164
        ep_Q2_024_generator_15_1100_1199 =
      ep_Q2_024_partial_15_1164 := by
  native_decide

/-- Coefficient term 1165 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1165 : Poly :=
[
  term ((-156549602987398445852407283417014511808 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (7, 1), (9, 1), (13, 1), (14, 1)]
]

/-- Partial product 1165 for generator 15. -/
def ep_Q2_024_partial_15_1165 : Poly :=
[
  term ((-313099205974796891704814566834029023616 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (6, 1), (7, 1), (9, 1), (13, 1), (14, 1)],
  term ((156549602987398445852407283417014511808 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (7, 1), (9, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1165 for generator 15. -/
theorem ep_Q2_024_partial_15_1165_valid :
    mulPoly ep_Q2_024_coefficient_15_1165
        ep_Q2_024_generator_15_1100_1199 =
      ep_Q2_024_partial_15_1165 := by
  native_decide

/-- Coefficient term 1166 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1166 : Poly :=
[
  term ((2449020209846403374712074673893548417307732695016543182 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (7, 1), (9, 1), (14, 1), (15, 1)]
]

/-- Partial product 1166 for generator 15. -/
def ep_Q2_024_partial_15_1166 : Poly :=
[
  term ((4898040419692806749424149347787096834615465390033086364 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (6, 1), (7, 1), (9, 1), (14, 1), (15, 1)],
  term ((-2449020209846403374712074673893548417307732695016543182 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (7, 1), (9, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1166 for generator 15. -/
theorem ep_Q2_024_partial_15_1166_valid :
    mulPoly ep_Q2_024_coefficient_15_1166
        ep_Q2_024_generator_15_1100_1199 =
      ep_Q2_024_partial_15_1166 := by
  native_decide

/-- Coefficient term 1167 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1167 : Poly :=
[
  term ((-1495148449544936 : Rat) / 1162780221153193) [(3, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1167 for generator 15. -/
def ep_Q2_024_partial_15_1167 : Poly :=
[
  term ((-2990296899089872 : Rat) / 1162780221153193) [(3, 1), (6, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((1495148449544936 : Rat) / 1162780221153193) [(3, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1167 for generator 15. -/
theorem ep_Q2_024_partial_15_1167_valid :
    mulPoly ep_Q2_024_coefficient_15_1167
        ep_Q2_024_generator_15_1100_1199 =
      ep_Q2_024_partial_15_1167 := by
  native_decide

/-- Coefficient term 1168 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1168 : Poly :=
[
  term ((-31556266093234973165652571965850210528 : Rat) / 39990315246749243218889784267651308933) [(3, 1), (7, 1), (9, 2), (12, 1)]
]

/-- Partial product 1168 for generator 15. -/
def ep_Q2_024_partial_15_1168 : Poly :=
[
  term ((-63112532186469946331305143931700421056 : Rat) / 39990315246749243218889784267651308933) [(3, 1), (6, 1), (7, 1), (9, 2), (12, 1)],
  term ((31556266093234973165652571965850210528 : Rat) / 39990315246749243218889784267651308933) [(3, 1), (7, 1), (9, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1168 for generator 15. -/
theorem ep_Q2_024_partial_15_1168_valid :
    mulPoly ep_Q2_024_coefficient_15_1168
        ep_Q2_024_generator_15_1100_1199 =
      ep_Q2_024_partial_15_1168 := by
  native_decide

/-- Coefficient term 1169 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1169 : Poly :=
[
  term ((-126225064372939892662610287863400842112 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (7, 1), (9, 2), (14, 1)]
]

/-- Partial product 1169 for generator 15. -/
def ep_Q2_024_partial_15_1169 : Poly :=
[
  term ((-252450128745879785325220575726801684224 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (6, 1), (7, 1), (9, 2), (14, 1)],
  term ((126225064372939892662610287863400842112 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (7, 1), (9, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1169 for generator 15. -/
theorem ep_Q2_024_partial_15_1169_valid :
    mulPoly ep_Q2_024_coefficient_15_1169
        ep_Q2_024_generator_15_1100_1199 =
      ep_Q2_024_partial_15_1169 := by
  native_decide

/-- Coefficient term 1170 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1170 : Poly :=
[
  term ((-474126838180308352184970268942469465357 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (7, 1), (12, 1)]
]

/-- Partial product 1170 for generator 15. -/
def ep_Q2_024_partial_15_1170 : Poly :=
[
  term ((-948253676360616704369940537884938930714 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (6, 1), (7, 1), (12, 1)],
  term ((474126838180308352184970268942469465357 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (7, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1170 for generator 15. -/
theorem ep_Q2_024_partial_15_1170_valid :
    mulPoly ep_Q2_024_coefficient_15_1170
        ep_Q2_024_generator_15_1100_1199 =
      ep_Q2_024_partial_15_1170 := by
  native_decide

/-- Coefficient term 1171 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1171 : Poly :=
[
  term ((64058845371574692704468717594301588487936003313615869633 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(3, 1), (7, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 1171 for generator 15. -/
def ep_Q2_024_partial_15_1171 : Poly :=
[
  term ((64058845371574692704468717594301588487936003313615869633 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(3, 1), (6, 1), (7, 1), (12, 1), (13, 1), (15, 1)],
  term ((-64058845371574692704468717594301588487936003313615869633 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(3, 1), (7, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1171 for generator 15. -/
theorem ep_Q2_024_partial_15_1171_valid :
    mulPoly ep_Q2_024_coefficient_15_1171
        ep_Q2_024_generator_15_1100_1199 =
      ep_Q2_024_partial_15_1171 := by
  native_decide

/-- Coefficient term 1172 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1172 : Poly :=
[
  term ((-181622001380355 : Rat) / 1162780221153193) [(3, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1172 for generator 15. -/
def ep_Q2_024_partial_15_1172 : Poly :=
[
  term ((-363244002760710 : Rat) / 1162780221153193) [(3, 1), (6, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((181622001380355 : Rat) / 1162780221153193) [(3, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1172 for generator 15. -/
theorem ep_Q2_024_partial_15_1172_valid :
    mulPoly ep_Q2_024_coefficient_15_1172
        ep_Q2_024_generator_15_1100_1199 =
      ep_Q2_024_partial_15_1172 := by
  native_decide

/-- Coefficient term 1173 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1173 : Poly :=
[
  term ((-24285619430674572789347187379892301356 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (7, 1), (12, 1), (13, 2)]
]

/-- Partial product 1173 for generator 15. -/
def ep_Q2_024_partial_15_1173 : Poly :=
[
  term ((-48571238861349145578694374759784602712 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (6, 1), (7, 1), (12, 1), (13, 2)],
  term ((24285619430674572789347187379892301356 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (7, 1), (12, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1173 for generator 15. -/
theorem ep_Q2_024_partial_15_1173_valid :
    mulPoly ep_Q2_024_coefficient_15_1173
        ep_Q2_024_generator_15_1100_1199 =
      ep_Q2_024_partial_15_1173 := by
  native_decide

/-- Coefficient term 1174 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1174 : Poly :=
[
  term ((582061027275376329967414115123588817349 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (7, 1), (12, 1), (14, 1)]
]

/-- Partial product 1174 for generator 15. -/
def ep_Q2_024_partial_15_1174 : Poly :=
[
  term ((1164122054550752659934828230247177634698 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (6, 1), (7, 1), (12, 1), (14, 1)],
  term ((-582061027275376329967414115123588817349 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (7, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1174 for generator 15. -/
theorem ep_Q2_024_partial_15_1174_valid :
    mulPoly ep_Q2_024_coefficient_15_1174
        ep_Q2_024_generator_15_1100_1199 =
      ep_Q2_024_partial_15_1174 := by
  native_decide

/-- Coefficient term 1175 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1175 : Poly :=
[
  term ((-11054165036071785399365776736060685613928533689685750087 : Rat) / 185999790426403963700954686167253179493469284649492276) [(3, 1), (7, 1), (12, 1), (15, 2)]
]

/-- Partial product 1175 for generator 15. -/
def ep_Q2_024_partial_15_1175 : Poly :=
[
  term ((-11054165036071785399365776736060685613928533689685750087 : Rat) / 92999895213201981850477343083626589746734642324746138) [(3, 1), (6, 1), (7, 1), (12, 1), (15, 2)],
  term ((11054165036071785399365776736060685613928533689685750087 : Rat) / 185999790426403963700954686167253179493469284649492276) [(3, 1), (7, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1175 for generator 15. -/
theorem ep_Q2_024_partial_15_1175_valid :
    mulPoly ep_Q2_024_coefficient_15_1175
        ep_Q2_024_generator_15_1100_1199 =
      ep_Q2_024_partial_15_1175 := by
  native_decide

/-- Coefficient term 1176 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1176 : Poly :=
[
  term ((2113589838824883 : Rat) / 1162780221153193) [(3, 1), (7, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1176 for generator 15. -/
def ep_Q2_024_partial_15_1176 : Poly :=
[
  term ((4227179677649766 : Rat) / 1162780221153193) [(3, 1), (6, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((-2113589838824883 : Rat) / 1162780221153193) [(3, 1), (7, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1176 for generator 15. -/
theorem ep_Q2_024_partial_15_1176_valid :
    mulPoly ep_Q2_024_coefficient_15_1176
        ep_Q2_024_generator_15_1100_1199 =
      ep_Q2_024_partial_15_1176 := by
  native_decide

/-- Coefficient term 1177 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1177 : Poly :=
[
  term ((89950247204447483722066909092463307858 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (7, 1), (12, 2)]
]

/-- Partial product 1177 for generator 15. -/
def ep_Q2_024_partial_15_1177 : Poly :=
[
  term ((179900494408894967444133818184926615716 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (6, 1), (7, 1), (12, 2)],
  term ((-89950247204447483722066909092463307858 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (7, 1), (12, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1177 for generator 15. -/
theorem ep_Q2_024_partial_15_1177_valid :
    mulPoly ep_Q2_024_coefficient_15_1177
        ep_Q2_024_generator_15_1100_1199 =
      ep_Q2_024_partial_15_1177 := by
  native_decide

/-- Coefficient term 1178 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1178 : Poly :=
[
  term ((-33273931020260669930661190011024360672 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (7, 1), (12, 2), (13, 1), (15, 1)]
]

/-- Partial product 1178 for generator 15. -/
def ep_Q2_024_partial_15_1178 : Poly :=
[
  term ((-66547862040521339861322380022048721344 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (6, 1), (7, 1), (12, 2), (13, 1), (15, 1)],
  term ((33273931020260669930661190011024360672 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (7, 1), (12, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1178 for generator 15. -/
theorem ep_Q2_024_partial_15_1178_valid :
    mulPoly ep_Q2_024_coefficient_15_1178
        ep_Q2_024_generator_15_1100_1199 =
      ep_Q2_024_partial_15_1178 := by
  native_decide

/-- Coefficient term 1179 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1179 : Poly :=
[
  term ((198745616475118943998092102782769635563595552220534688 : Rat) / 46499947606600990925238671541813294873367321162373069) [(3, 1), (7, 1), (12, 2), (15, 2)]
]

/-- Partial product 1179 for generator 15. -/
def ep_Q2_024_partial_15_1179 : Poly :=
[
  term ((397491232950237887996184205565539271127191104441069376 : Rat) / 46499947606600990925238671541813294873367321162373069) [(3, 1), (6, 1), (7, 1), (12, 2), (15, 2)],
  term ((-198745616475118943998092102782769635563595552220534688 : Rat) / 46499947606600990925238671541813294873367321162373069) [(3, 1), (7, 1), (12, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1179 for generator 15. -/
theorem ep_Q2_024_partial_15_1179_valid :
    mulPoly ep_Q2_024_coefficient_15_1179
        ep_Q2_024_generator_15_1100_1199 =
      ep_Q2_024_partial_15_1179 := by
  native_decide

/-- Coefficient term 1180 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1180 : Poly :=
[
  term ((-1581632301823296 : Rat) / 1162780221153193) [(3, 1), (7, 1), (12, 2), (15, 2), (16, 1)]
]

/-- Partial product 1180 for generator 15. -/
def ep_Q2_024_partial_15_1180 : Poly :=
[
  term ((-3163264603646592 : Rat) / 1162780221153193) [(3, 1), (6, 1), (7, 1), (12, 2), (15, 2), (16, 1)],
  term ((1581632301823296 : Rat) / 1162780221153193) [(3, 1), (7, 1), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1180 for generator 15. -/
theorem ep_Q2_024_partial_15_1180_valid :
    mulPoly ep_Q2_024_coefficient_15_1180
        ep_Q2_024_generator_15_1100_1199 =
      ep_Q2_024_partial_15_1180 := by
  native_decide

/-- Coefficient term 1181 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1181 : Poly :=
[
  term ((11505073964399522846249871046495738097852688577051920964 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (7, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 1181 for generator 15. -/
def ep_Q2_024_partial_15_1181 : Poly :=
[
  term ((23010147928799045692499742092991476195705377154103841928 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (6, 1), (7, 1), (13, 1), (14, 1), (15, 1)],
  term ((-11505073964399522846249871046495738097852688577051920964 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (7, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1181 for generator 15. -/
theorem ep_Q2_024_partial_15_1181_valid :
    mulPoly ep_Q2_024_coefficient_15_1181
        ep_Q2_024_generator_15_1100_1199 =
      ep_Q2_024_partial_15_1181 := by
  native_decide

/-- Coefficient term 1182 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1182 : Poly :=
[
  term ((-150661185588720 : Rat) / 1162780221153193) [(3, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1182 for generator 15. -/
def ep_Q2_024_partial_15_1182 : Poly :=
[
  term ((-301322371177440 : Rat) / 1162780221153193) [(3, 1), (6, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((150661185588720 : Rat) / 1162780221153193) [(3, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1182 for generator 15. -/
theorem ep_Q2_024_partial_15_1182_valid :
    mulPoly ep_Q2_024_coefficient_15_1182
        ep_Q2_024_generator_15_1100_1199 =
      ep_Q2_024_partial_15_1182 := by
  native_decide

/-- Coefficient term 1183 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1183 : Poly :=
[
  term ((-80945856112067634232098240062478093344 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (7, 1), (13, 2), (14, 1)]
]

/-- Partial product 1183 for generator 15. -/
def ep_Q2_024_partial_15_1183 : Poly :=
[
  term ((-161891712224135268464196480124956186688 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (6, 1), (7, 1), (13, 2), (14, 1)],
  term ((80945856112067634232098240062478093344 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (7, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1183 for generator 15. -/
theorem ep_Q2_024_partial_15_1183_valid :
    mulPoly ep_Q2_024_coefficient_15_1183
        ep_Q2_024_generator_15_1100_1199 =
      ep_Q2_024_partial_15_1183 := by
  native_decide

/-- Coefficient term 1184 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1184 : Poly :=
[
  term ((56935318687050373770433198734129544818 : Rat) / 39990315246749243218889784267651308933) [(3, 1), (7, 1), (14, 1)]
]

/-- Partial product 1184 for generator 15. -/
def ep_Q2_024_partial_15_1184 : Poly :=
[
  term ((113870637374100747540866397468259089636 : Rat) / 39990315246749243218889784267651308933) [(3, 1), (6, 1), (7, 1), (14, 1)],
  term ((-56935318687050373770433198734129544818 : Rat) / 39990315246749243218889784267651308933) [(3, 1), (7, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1184 for generator 15. -/
theorem ep_Q2_024_partial_15_1184_valid :
    mulPoly ep_Q2_024_coefficient_15_1184
        ep_Q2_024_generator_15_1100_1199 =
      ep_Q2_024_partial_15_1184 := by
  native_decide

/-- Coefficient term 1185 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1185 : Poly :=
[
  term ((-5633709133854896624680034347401390035670218004313073105 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 1), (7, 1), (14, 1), (15, 2)]
]

/-- Partial product 1185 for generator 15. -/
def ep_Q2_024_partial_15_1185 : Poly :=
[
  term ((-11267418267709793249360068694802780071340436008626146210 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 1), (6, 1), (7, 1), (14, 1), (15, 2)],
  term ((5633709133854896624680034347401390035670218004313073105 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 1), (7, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1185 for generator 15. -/
theorem ep_Q2_024_partial_15_1185_valid :
    mulPoly ep_Q2_024_coefficient_15_1185
        ep_Q2_024_generator_15_1100_1199 =
      ep_Q2_024_partial_15_1185 := by
  native_decide

/-- Coefficient term 1186 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1186 : Poly :=
[
  term ((4263316396002204 : Rat) / 1162780221153193) [(3, 1), (7, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1186 for generator 15. -/
def ep_Q2_024_partial_15_1186 : Poly :=
[
  term ((8526632792004408 : Rat) / 1162780221153193) [(3, 1), (6, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((-4263316396002204 : Rat) / 1162780221153193) [(3, 1), (7, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1186 for generator 15. -/
theorem ep_Q2_024_partial_15_1186_valid :
    mulPoly ep_Q2_024_coefficient_15_1186
        ep_Q2_024_generator_15_1100_1199 =
      ep_Q2_024_partial_15_1186 := by
  native_decide

/-- Coefficient term 1187 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1187 : Poly :=
[
  term ((-17842303055724083763118711211856783152 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (7, 1), (14, 2)]
]

/-- Partial product 1187 for generator 15. -/
def ep_Q2_024_partial_15_1187 : Poly :=
[
  term ((-35684606111448167526237422423713566304 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (6, 1), (7, 1), (14, 2)],
  term ((17842303055724083763118711211856783152 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (7, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1187 for generator 15. -/
theorem ep_Q2_024_partial_15_1187_valid :
    mulPoly ep_Q2_024_coefficient_15_1187
        ep_Q2_024_generator_15_1100_1199 =
      ep_Q2_024_partial_15_1187 := by
  native_decide

/-- Coefficient term 1188 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1188 : Poly :=
[
  term ((-2577680137987848256677737667577720516469 : Rat) / 5398692558311147834550120876132926705955) [(3, 1), (8, 1), (9, 1)]
]

/-- Partial product 1188 for generator 15. -/
def ep_Q2_024_partial_15_1188 : Poly :=
[
  term ((-5155360275975696513355475335155441032938 : Rat) / 5398692558311147834550120876132926705955) [(3, 1), (6, 1), (8, 1), (9, 1)],
  term ((2577680137987848256677737667577720516469 : Rat) / 5398692558311147834550120876132926705955) [(3, 1), (8, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1188 for generator 15. -/
theorem ep_Q2_024_partial_15_1188_valid :
    mulPoly ep_Q2_024_coefficient_15_1188
        ep_Q2_024_generator_15_1100_1199 =
      ep_Q2_024_partial_15_1188 := by
  native_decide

/-- Coefficient term 1189 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1189 : Poly :=
[
  term ((117412202240548834389305462562760883856 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (8, 1), (9, 1), (11, 1), (13, 1)]
]

/-- Partial product 1189 for generator 15. -/
def ep_Q2_024_partial_15_1189 : Poly :=
[
  term ((234824404481097668778610925125521767712 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (6, 1), (8, 1), (9, 1), (11, 1), (13, 1)],
  term ((-117412202240548834389305462562760883856 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (8, 1), (9, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1189 for generator 15. -/
theorem ep_Q2_024_partial_15_1189_valid :
    mulPoly ep_Q2_024_coefficient_15_1189
        ep_Q2_024_generator_15_1100_1199 =
      ep_Q2_024_partial_15_1189 := by
  native_decide

/-- Coefficient term 1190 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1190 : Poly :=
[
  term ((-1222689308379968181009349179356074961661002890148376823 : Rat) / 464999476066009909252386715418132948733673211623730690) [(3, 1), (8, 1), (9, 1), (11, 1), (15, 1)]
]

/-- Partial product 1190 for generator 15. -/
def ep_Q2_024_partial_15_1190 : Poly :=
[
  term ((-1222689308379968181009349179356074961661002890148376823 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (6, 1), (8, 1), (9, 1), (11, 1), (15, 1)],
  term ((1222689308379968181009349179356074961661002890148376823 : Rat) / 464999476066009909252386715418132948733673211623730690) [(3, 1), (8, 1), (9, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1190 for generator 15. -/
theorem ep_Q2_024_partial_15_1190_valid :
    mulPoly ep_Q2_024_coefficient_15_1190
        ep_Q2_024_generator_15_1100_1199 =
      ep_Q2_024_partial_15_1190 := by
  native_decide

/-- Coefficient term 1191 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1191 : Poly :=
[
  term ((1121361337158702 : Rat) / 1162780221153193) [(3, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 1191 for generator 15. -/
def ep_Q2_024_partial_15_1191 : Poly :=
[
  term ((2242722674317404 : Rat) / 1162780221153193) [(3, 1), (6, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1121361337158702 : Rat) / 1162780221153193) [(3, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1191 for generator 15. -/
theorem ep_Q2_024_partial_15_1191_valid :
    mulPoly ep_Q2_024_coefficient_15_1191
        ep_Q2_024_generator_15_1100_1199 =
      ep_Q2_024_partial_15_1191 := by
  native_decide

/-- Coefficient term 1192 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1192 : Poly :=
[
  term ((346796828366337751507431846266314199278 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (8, 1), (9, 1), (12, 1)]
]

/-- Partial product 1192 for generator 15. -/
def ep_Q2_024_partial_15_1192 : Poly :=
[
  term ((693593656732675503014863692532628398556 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (6, 1), (8, 1), (9, 1), (12, 1)],
  term ((-346796828366337751507431846266314199278 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (8, 1), (9, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1192 for generator 15. -/
theorem ep_Q2_024_partial_15_1192_valid :
    mulPoly ep_Q2_024_coefficient_15_1192
        ep_Q2_024_generator_15_1100_1199 =
      ep_Q2_024_partial_15_1192 := by
  native_decide

/-- Coefficient term 1193 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1193 : Poly :=
[
  term ((11091310340086889976887063337008120224 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 1193 for generator 15. -/
def ep_Q2_024_partial_15_1193 : Poly :=
[
  term ((22182620680173779953774126674016240448 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (6, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((-11091310340086889976887063337008120224 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1193 for generator 15. -/
theorem ep_Q2_024_partial_15_1193_valid :
    mulPoly ep_Q2_024_coefficient_15_1193
        ep_Q2_024_generator_15_1100_1199 =
      ep_Q2_024_partial_15_1193 := by
  native_decide

/-- Coefficient term 1194 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1194 : Poly :=
[
  term ((-198745616475118943998092102782769635563595552220534688 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 1), (8, 1), (9, 1), (12, 1), (15, 2)]
]

/-- Partial product 1194 for generator 15. -/
def ep_Q2_024_partial_15_1194 : Poly :=
[
  term ((-397491232950237887996184205565539271127191104441069376 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 1), (6, 1), (8, 1), (9, 1), (12, 1), (15, 2)],
  term ((198745616475118943998092102782769635563595552220534688 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 1), (8, 1), (9, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1194 for generator 15. -/
theorem ep_Q2_024_partial_15_1194_valid :
    mulPoly ep_Q2_024_coefficient_15_1194
        ep_Q2_024_generator_15_1100_1199 =
      ep_Q2_024_partial_15_1194 := by
  native_decide

/-- Coefficient term 1195 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1195 : Poly :=
[
  term ((527210767274432 : Rat) / 1162780221153193) [(3, 1), (8, 1), (9, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1195 for generator 15. -/
def ep_Q2_024_partial_15_1195 : Poly :=
[
  term ((1054421534548864 : Rat) / 1162780221153193) [(3, 1), (6, 1), (8, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-527210767274432 : Rat) / 1162780221153193) [(3, 1), (8, 1), (9, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1195 for generator 15. -/
theorem ep_Q2_024_partial_15_1195_valid :
    mulPoly ep_Q2_024_coefficient_15_1195
        ep_Q2_024_generator_15_1100_1199 =
      ep_Q2_024_partial_15_1195 := by
  native_decide

/-- Coefficient term 1196 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1196 : Poly :=
[
  term ((1712108411655918217728834922540791858411089679157655495 : Rat) / 1673998113837635673308592175505278615441223561845430484) [(3, 1), (8, 1), (9, 1), (13, 1), (15, 1)]
]

/-- Partial product 1196 for generator 15. -/
def ep_Q2_024_partial_15_1196 : Poly :=
[
  term ((1712108411655918217728834922540791858411089679157655495 : Rat) / 836999056918817836654296087752639307720611780922715242) [(3, 1), (6, 1), (8, 1), (9, 1), (13, 1), (15, 1)],
  term ((-1712108411655918217728834922540791858411089679157655495 : Rat) / 1673998113837635673308592175505278615441223561845430484) [(3, 1), (8, 1), (9, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1196 for generator 15. -/
theorem ep_Q2_024_partial_15_1196_valid :
    mulPoly ep_Q2_024_coefficient_15_1196
        ep_Q2_024_generator_15_1100_1199 =
      ep_Q2_024_partial_15_1196 := by
  native_decide

/-- Coefficient term 1197 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1197 : Poly :=
[
  term ((-5094646267068265 : Rat) / 3488340663459579) [(3, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1197 for generator 15. -/
def ep_Q2_024_partial_15_1197 : Poly :=
[
  term ((-10189292534136530 : Rat) / 3488340663459579) [(3, 1), (6, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((5094646267068265 : Rat) / 3488340663459579) [(3, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1197 for generator 15. -/
theorem ep_Q2_024_partial_15_1197_valid :
    mulPoly ep_Q2_024_coefficient_15_1197
        ep_Q2_024_generator_15_1100_1199 =
      ep_Q2_024_partial_15_1197 := by
  native_decide

/-- Coefficient term 1198 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1198 : Poly :=
[
  term ((815388877581942842408941403533558143676 : Rat) / 1799564186103715944850040292044308901985) [(3, 1), (8, 1), (9, 1), (13, 2)]
]

/-- Partial product 1198 for generator 15. -/
def ep_Q2_024_partial_15_1198 : Poly :=
[
  term ((1630777755163885684817882807067116287352 : Rat) / 1799564186103715944850040292044308901985) [(3, 1), (6, 1), (8, 1), (9, 1), (13, 2)],
  term ((-815388877581942842408941403533558143676 : Rat) / 1799564186103715944850040292044308901985) [(3, 1), (8, 1), (9, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1198 for generator 15. -/
theorem ep_Q2_024_partial_15_1198_valid :
    mulPoly ep_Q2_024_coefficient_15_1198
        ep_Q2_024_generator_15_1100_1199 =
      ep_Q2_024_partial_15_1198 := by
  native_decide

/-- Coefficient term 1199 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1199 : Poly :=
[
  term ((4322497448458887375868451465862051682379 : Rat) / 1799564186103715944850040292044308901985) [(3, 1), (8, 1), (9, 1), (14, 1)]
]

/-- Partial product 1199 for generator 15. -/
def ep_Q2_024_partial_15_1199 : Poly :=
[
  term ((8644994896917774751736902931724103364758 : Rat) / 1799564186103715944850040292044308901985) [(3, 1), (6, 1), (8, 1), (9, 1), (14, 1)],
  term ((-4322497448458887375868451465862051682379 : Rat) / 1799564186103715944850040292044308901985) [(3, 1), (8, 1), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1199 for generator 15. -/
theorem ep_Q2_024_partial_15_1199_valid :
    mulPoly ep_Q2_024_coefficient_15_1199
        ep_Q2_024_generator_15_1100_1199 =
      ep_Q2_024_partial_15_1199 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_024_partials_15_1100_1199 : List Poly :=
[
  ep_Q2_024_partial_15_1100,
  ep_Q2_024_partial_15_1101,
  ep_Q2_024_partial_15_1102,
  ep_Q2_024_partial_15_1103,
  ep_Q2_024_partial_15_1104,
  ep_Q2_024_partial_15_1105,
  ep_Q2_024_partial_15_1106,
  ep_Q2_024_partial_15_1107,
  ep_Q2_024_partial_15_1108,
  ep_Q2_024_partial_15_1109,
  ep_Q2_024_partial_15_1110,
  ep_Q2_024_partial_15_1111,
  ep_Q2_024_partial_15_1112,
  ep_Q2_024_partial_15_1113,
  ep_Q2_024_partial_15_1114,
  ep_Q2_024_partial_15_1115,
  ep_Q2_024_partial_15_1116,
  ep_Q2_024_partial_15_1117,
  ep_Q2_024_partial_15_1118,
  ep_Q2_024_partial_15_1119,
  ep_Q2_024_partial_15_1120,
  ep_Q2_024_partial_15_1121,
  ep_Q2_024_partial_15_1122,
  ep_Q2_024_partial_15_1123,
  ep_Q2_024_partial_15_1124,
  ep_Q2_024_partial_15_1125,
  ep_Q2_024_partial_15_1126,
  ep_Q2_024_partial_15_1127,
  ep_Q2_024_partial_15_1128,
  ep_Q2_024_partial_15_1129,
  ep_Q2_024_partial_15_1130,
  ep_Q2_024_partial_15_1131,
  ep_Q2_024_partial_15_1132,
  ep_Q2_024_partial_15_1133,
  ep_Q2_024_partial_15_1134,
  ep_Q2_024_partial_15_1135,
  ep_Q2_024_partial_15_1136,
  ep_Q2_024_partial_15_1137,
  ep_Q2_024_partial_15_1138,
  ep_Q2_024_partial_15_1139,
  ep_Q2_024_partial_15_1140,
  ep_Q2_024_partial_15_1141,
  ep_Q2_024_partial_15_1142,
  ep_Q2_024_partial_15_1143,
  ep_Q2_024_partial_15_1144,
  ep_Q2_024_partial_15_1145,
  ep_Q2_024_partial_15_1146,
  ep_Q2_024_partial_15_1147,
  ep_Q2_024_partial_15_1148,
  ep_Q2_024_partial_15_1149,
  ep_Q2_024_partial_15_1150,
  ep_Q2_024_partial_15_1151,
  ep_Q2_024_partial_15_1152,
  ep_Q2_024_partial_15_1153,
  ep_Q2_024_partial_15_1154,
  ep_Q2_024_partial_15_1155,
  ep_Q2_024_partial_15_1156,
  ep_Q2_024_partial_15_1157,
  ep_Q2_024_partial_15_1158,
  ep_Q2_024_partial_15_1159,
  ep_Q2_024_partial_15_1160,
  ep_Q2_024_partial_15_1161,
  ep_Q2_024_partial_15_1162,
  ep_Q2_024_partial_15_1163,
  ep_Q2_024_partial_15_1164,
  ep_Q2_024_partial_15_1165,
  ep_Q2_024_partial_15_1166,
  ep_Q2_024_partial_15_1167,
  ep_Q2_024_partial_15_1168,
  ep_Q2_024_partial_15_1169,
  ep_Q2_024_partial_15_1170,
  ep_Q2_024_partial_15_1171,
  ep_Q2_024_partial_15_1172,
  ep_Q2_024_partial_15_1173,
  ep_Q2_024_partial_15_1174,
  ep_Q2_024_partial_15_1175,
  ep_Q2_024_partial_15_1176,
  ep_Q2_024_partial_15_1177,
  ep_Q2_024_partial_15_1178,
  ep_Q2_024_partial_15_1179,
  ep_Q2_024_partial_15_1180,
  ep_Q2_024_partial_15_1181,
  ep_Q2_024_partial_15_1182,
  ep_Q2_024_partial_15_1183,
  ep_Q2_024_partial_15_1184,
  ep_Q2_024_partial_15_1185,
  ep_Q2_024_partial_15_1186,
  ep_Q2_024_partial_15_1187,
  ep_Q2_024_partial_15_1188,
  ep_Q2_024_partial_15_1189,
  ep_Q2_024_partial_15_1190,
  ep_Q2_024_partial_15_1191,
  ep_Q2_024_partial_15_1192,
  ep_Q2_024_partial_15_1193,
  ep_Q2_024_partial_15_1194,
  ep_Q2_024_partial_15_1195,
  ep_Q2_024_partial_15_1196,
  ep_Q2_024_partial_15_1197,
  ep_Q2_024_partial_15_1198,
  ep_Q2_024_partial_15_1199
]

/-- Sum of partial products in this block. -/
def ep_Q2_024_block_15_1100_1199 : Poly :=
[
  term ((-75330592794360 : Rat) / 1162780221153193) [(3, 1), (5, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-40472928056033817116049120031239046672 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (5, 1), (6, 1), (13, 2)],
  term ((-8921151527862041881559355605928391576 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (6, 1), (14, 1)],
  term ((-1033735075000963871570074454421674510146952330304057814 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (5, 1), (6, 1), (15, 2)],
  term ((1272052070494440 : Rat) / 1162780221153193) [(3, 1), (5, 1), (6, 1), (15, 2), (16, 1)],
  term ((37665296397180 : Rat) / 1162780221153193) [(3, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((20236464028016908558024560015619523336 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (5, 1), (13, 2)],
  term ((4460575763931020940779677802964195788 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 1), (14, 1)],
  term ((516867537500481935785037227210837255073476165152028907 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (5, 1), (15, 2)],
  term ((-636026035247220 : Rat) / 1162780221153193) [(3, 1), (5, 1), (15, 2), (16, 1)],
  term ((-67563934515587234973630412146306275392 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 2), (6, 1), (8, 1), (9, 1)],
  term ((-80880299190047857864233171441849366144 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 2), (6, 1), (8, 1), (13, 1)],
  term ((4347249035505462526858846771514645871341141380863831296 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (5, 2), (6, 1), (8, 1), (15, 1)],
  term ((413883074046464 : Rat) / 1162780221153193) [(3, 1), (5, 2), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((33781967257793617486815206073153137696 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 2), (6, 2), (9, 1)],
  term ((40440149595023928932116585720924683072 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 2), (6, 2), (13, 1)],
  term ((-2173624517752731263429423385757322935670570690431915648 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (5, 2), (6, 2), (15, 1)],
  term ((-206941537023232 : Rat) / 1162780221153193) [(3, 1), (5, 2), (6, 2), (15, 1), (16, 1)],
  term ((33781967257793617486815206073153137696 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 2), (8, 1), (9, 1)],
  term ((40440149595023928932116585720924683072 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 2), (8, 1), (13, 1)],
  term ((-2173624517752731263429423385757322935670570690431915648 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (5, 2), (8, 1), (15, 1)],
  term ((-206941537023232 : Rat) / 1162780221153193) [(3, 1), (5, 2), (8, 1), (15, 1), (16, 1)],
  term ((-8445491814448404371703801518288284424 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 2), (9, 1)],
  term ((-10110037398755982233029146430231170768 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (5, 2), (13, 1)],
  term ((543406129438182815857355846439330733917642672607978912 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (5, 2), (15, 1)],
  term ((51735384255808 : Rat) / 1162780221153193) [(3, 1), (5, 2), (15, 1), (16, 1)],
  term ((296927830859978465655914867181954522530 : Rat) / 119970945740247729656669352802953926799) [(3, 1), (6, 1), (7, 1), (8, 1)],
  term ((234824404481097668778610925125521767712 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (6, 1), (7, 1), (8, 1), (9, 1), (13, 1)],
  term ((-1222689308379968181009349179356074961661002890148376823 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (6, 1), (7, 1), (8, 1), (9, 1), (15, 1)],
  term ((2242722674317404 : Rat) / 1162780221153193) [(3, 1), (6, 1), (7, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((189337596559409838993915431795101263168 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (6, 1), (7, 1), (8, 1), (9, 2)],
  term ((222598729014758750008534490063791420516 : Rat) / 119970945740247729656669352802953926799) [(3, 1), (6, 1), (7, 1), (8, 1), (12, 1)],
  term ((66547862040521339861322380022048721344 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (6, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((-397491232950237887996184205565539271127191104441069376 : Rat) / 46499947606600990925238671541813294873367321162373069) [(3, 1), (6, 1), (7, 1), (8, 1), (12, 1), (15, 2)],
  term ((3163264603646592 : Rat) / 1162780221153193) [(3, 1), (6, 1), (7, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-13665940368750242398805821778499109403651343582341271507 : Rat) / 464999476066009909252386715418132948733673211623730690) [(3, 1), (6, 1), (7, 1), (8, 1), (13, 1), (15, 1)],
  term ((212582817171990 : Rat) / 1162780221153193) [(3, 1), (6, 1), (7, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-32374617250718488653403865302693490632 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (6, 1), (7, 1), (8, 1), (13, 2)],
  term ((-1217648963717924911224184363882747984154 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (6, 1), (7, 1), (8, 1), (14, 1)],
  term ((2298204085221019497339885976171791710852429622693000547 : Rat) / 23644041155898808945036612648379641461034231099511730) [(3, 1), (6, 1), (7, 1), (8, 1), (15, 2)],
  term ((-2096958610707350 : Rat) / 1162780221153193) [(3, 1), (6, 1), (7, 1), (8, 1), (15, 2), (16, 1)],
  term ((-1652695128300478652375073904873736949728 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (6, 1), (7, 1), (8, 2)],
  term ((-78274801493699222926203641708507255904 : Rat) / 39990315246749243218889784267651308933) [(3, 1), (6, 1), (7, 1), (9, 1), (12, 1), (13, 1)],
  term ((6117088134986307917740122211961773302290741365461673651 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (6, 1), (7, 1), (9, 1), (12, 1), (15, 1)],
  term ((-3737871123862340 : Rat) / 1162780221153193) [(3, 1), (6, 1), (7, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-313099205974796891704814566834029023616 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (6, 1), (7, 1), (9, 1), (13, 1), (14, 1)],
  term ((4898040419692806749424149347787096834615465390033086364 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (6, 1), (7, 1), (9, 1), (14, 1), (15, 1)],
  term ((-2990296899089872 : Rat) / 1162780221153193) [(3, 1), (6, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-63112532186469946331305143931700421056 : Rat) / 39990315246749243218889784267651308933) [(3, 1), (6, 1), (7, 1), (9, 2), (12, 1)],
  term ((-252450128745879785325220575726801684224 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (6, 1), (7, 1), (9, 2), (14, 1)],
  term ((-948253676360616704369940537884938930714 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (6, 1), (7, 1), (12, 1)],
  term ((64058845371574692704468717594301588487936003313615869633 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(3, 1), (6, 1), (7, 1), (12, 1), (13, 1), (15, 1)],
  term ((-363244002760710 : Rat) / 1162780221153193) [(3, 1), (6, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-48571238861349145578694374759784602712 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (6, 1), (7, 1), (12, 1), (13, 2)],
  term ((1164122054550752659934828230247177634698 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (6, 1), (7, 1), (12, 1), (14, 1)],
  term ((-11054165036071785399365776736060685613928533689685750087 : Rat) / 92999895213201981850477343083626589746734642324746138) [(3, 1), (6, 1), (7, 1), (12, 1), (15, 2)],
  term ((4227179677649766 : Rat) / 1162780221153193) [(3, 1), (6, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((179900494408894967444133818184926615716 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (6, 1), (7, 1), (12, 2)],
  term ((-66547862040521339861322380022048721344 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (6, 1), (7, 1), (12, 2), (13, 1), (15, 1)],
  term ((397491232950237887996184205565539271127191104441069376 : Rat) / 46499947606600990925238671541813294873367321162373069) [(3, 1), (6, 1), (7, 1), (12, 2), (15, 2)],
  term ((-3163264603646592 : Rat) / 1162780221153193) [(3, 1), (6, 1), (7, 1), (12, 2), (15, 2), (16, 1)],
  term ((23010147928799045692499742092991476195705377154103841928 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (6, 1), (7, 1), (13, 1), (14, 1), (15, 1)],
  term ((-301322371177440 : Rat) / 1162780221153193) [(3, 1), (6, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-161891712224135268464196480124956186688 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (6, 1), (7, 1), (13, 2), (14, 1)],
  term ((113870637374100747540866397468259089636 : Rat) / 39990315246749243218889784267651308933) [(3, 1), (6, 1), (7, 1), (14, 1)],
  term ((-11267418267709793249360068694802780071340436008626146210 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 1), (6, 1), (7, 1), (14, 1), (15, 2)],
  term ((8526632792004408 : Rat) / 1162780221153193) [(3, 1), (6, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((-35684606111448167526237422423713566304 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (6, 1), (7, 1), (14, 2)],
  term ((-5155360275975696513355475335155441032938 : Rat) / 5398692558311147834550120876132926705955) [(3, 1), (6, 1), (8, 1), (9, 1)],
  term ((234824404481097668778610925125521767712 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (6, 1), (8, 1), (9, 1), (11, 1), (13, 1)],
  term ((-1222689308379968181009349179356074961661002890148376823 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (6, 1), (8, 1), (9, 1), (11, 1), (15, 1)],
  term ((2242722674317404 : Rat) / 1162780221153193) [(3, 1), (6, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((693593656732675503014863692532628398556 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (6, 1), (8, 1), (9, 1), (12, 1)],
  term ((22182620680173779953774126674016240448 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (6, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((-397491232950237887996184205565539271127191104441069376 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 1), (6, 1), (8, 1), (9, 1), (12, 1), (15, 2)],
  term ((1054421534548864 : Rat) / 1162780221153193) [(3, 1), (6, 1), (8, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((1712108411655918217728834922540791858411089679157655495 : Rat) / 836999056918817836654296087752639307720611780922715242) [(3, 1), (6, 1), (8, 1), (9, 1), (13, 1), (15, 1)],
  term ((-10189292534136530 : Rat) / 3488340663459579) [(3, 1), (6, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((1630777755163885684817882807067116287352 : Rat) / 1799564186103715944850040292044308901985) [(3, 1), (6, 1), (8, 1), (9, 1), (13, 2)],
  term ((8644994896917774751736902931724103364758 : Rat) / 1799564186103715944850040292044308901985) [(3, 1), (6, 1), (8, 1), (9, 1), (14, 1)],
  term ((1615678198287579510326873412820606074044 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (6, 1), (9, 1)],
  term ((-1606757046759717468445314057214677682468 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (6, 1), (9, 1), (12, 1)],
  term ((5219157720381596191771511451173724274739044980621804946 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (6, 1), (9, 1), (13, 1), (15, 1)],
  term ((-75330592794360 : Rat) / 1162780221153193) [(3, 1), (6, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-40472928056033817116049120031239046672 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (6, 1), (9, 1), (13, 2)],
  term ((31392739517477594675639583059712090172 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (6, 1), (9, 1), (14, 1)],
  term ((-1701862806137584762382089979266698299950310568861087192 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (6, 1), (9, 1), (15, 2)],
  term ((-430037916073728 : Rat) / 1162780221153193) [(3, 1), (6, 1), (9, 1), (15, 2), (16, 1)],
  term ((-78274801493699222926203641708507255904 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (6, 1), (9, 2), (13, 1)],
  term ((784194080123272474066747187140747888160160051635280743 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (6, 1), (9, 2), (15, 1)],
  term ((-747574224772468 : Rat) / 1162780221153193) [(3, 1), (6, 1), (9, 2), (15, 1), (16, 1)],
  term ((-63112532186469946331305143931700421056 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (6, 1), (9, 3)],
  term ((103548220870655574374203064328778233604 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (6, 1), (12, 1), (13, 1)],
  term ((7361797039595291049606458569276731235884520907461058105 : Rat) / 278999685639605945551432029250879769240203926974238414) [(3, 1), (6, 1), (12, 1), (15, 1)],
  term ((7135878331687774 : Rat) / 1162780221153193) [(3, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-49794017268134571589590260644228965512 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (6, 1), (12, 2), (13, 1)],
  term ((183488243113488394739718246684116996552696960175428317 : Rat) / 92999895213201981850477343083626589746734642324746138) [(3, 1), (6, 1), (12, 2), (15, 1)],
  term ((-434461680526322 : Rat) / 1162780221153193) [(3, 1), (6, 1), (12, 2), (15, 1), (16, 1)],
  term ((-52170129068766430306603786468421147060 : Rat) / 119970945740247729656669352802953926799) [(3, 1), (6, 1), (13, 1)],
  term ((-150204747408753331133563940143506612364 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (6, 1), (13, 1), (14, 1)],
  term ((11505073964399522846249871046495738097852688577051920964 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (6, 1), (13, 1), (15, 2)],
  term ((-150661185588720 : Rat) / 1162780221153193) [(3, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((-80945856112067634232098240062478093344 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (6, 1), (13, 2), (15, 1)],
  term ((-1643793228332255021187175098776411284888032943018583779 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(3, 1), (6, 1), (14, 1), (15, 1)],
  term ((929762167201001 : Rat) / 1162780221153193) [(3, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3764988045794031994072069891791841198723921241369511226 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 1), (6, 1), (15, 1)],
  term ((-6701416651161452 : Rat) / 1162780221153193) [(3, 1), (6, 1), (15, 1), (16, 1)],
  term ((-5633709133854896624680034347401390035670218004313073105 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 1), (6, 1), (15, 3)],
  term ((4263316396002204 : Rat) / 1162780221153193) [(3, 1), (6, 1), (15, 3), (16, 1)],
  term ((-3231356396575159020653746825641212148088 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (6, 2), (9, 1)],
  term ((3213514093519434936890628114429355364936 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (6, 2), (9, 1), (12, 1)],
  term ((-10438315440763192383543022902347448549478089961243609892 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (6, 2), (9, 1), (13, 1), (15, 1)],
  term ((150661185588720 : Rat) / 1162780221153193) [(3, 1), (6, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((80945856112067634232098240062478093344 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (6, 2), (9, 1), (13, 2)],
  term ((-62785479034955189351279166119424180344 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (6, 2), (9, 1), (14, 1)],
  term ((3403725612275169524764179958533396599900621137722174384 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (6, 2), (9, 1), (15, 2)],
  term ((860075832147456 : Rat) / 1162780221153193) [(3, 1), (6, 2), (9, 1), (15, 2), (16, 1)],
  term ((156549602987398445852407283417014511808 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (6, 2), (9, 2), (13, 1)],
  term ((-1568388160246544948133494374281495776320320103270561486 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (6, 2), (9, 2), (15, 1)],
  term ((1495148449544936 : Rat) / 1162780221153193) [(3, 1), (6, 2), (9, 2), (15, 1), (16, 1)],
  term ((126225064372939892662610287863400842112 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (6, 2), (9, 3)],
  term ((-207096441741311148748406128657556467208 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (6, 2), (12, 1), (13, 1)],
  term ((-7361797039595291049606458569276731235884520907461058105 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 1), (6, 2), (12, 1), (15, 1)],
  term ((-14271756663375548 : Rat) / 1162780221153193) [(3, 1), (6, 2), (12, 1), (15, 1), (16, 1)],
  term ((99588034536269143179180521288457931024 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (6, 2), (12, 2), (13, 1)],
  term ((-183488243113488394739718246684116996552696960175428317 : Rat) / 46499947606600990925238671541813294873367321162373069) [(3, 1), (6, 2), (12, 2), (15, 1)],
  term ((868923361052644 : Rat) / 1162780221153193) [(3, 1), (6, 2), (12, 2), (15, 1), (16, 1)],
  term ((104340258137532860613207572936842294120 : Rat) / 119970945740247729656669352802953926799) [(3, 1), (6, 2), (13, 1)],
  term ((300409494817506662267127880287013224728 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (6, 2), (13, 1), (14, 1)],
  term ((-23010147928799045692499742092991476195705377154103841928 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (6, 2), (13, 1), (15, 2)],
  term ((301322371177440 : Rat) / 1162780221153193) [(3, 1), (6, 2), (13, 1), (15, 2), (16, 1)],
  term ((161891712224135268464196480124956186688 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (6, 2), (13, 2), (15, 1)],
  term ((1643793228332255021187175098776411284888032943018583779 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(3, 1), (6, 2), (14, 1), (15, 1)],
  term ((-1859524334402002 : Rat) / 1162780221153193) [(3, 1), (6, 2), (14, 1), (15, 1), (16, 1)],
  term ((7529976091588063988144139783583682397447842482739022452 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 1), (6, 2), (15, 1)],
  term ((13402833302322904 : Rat) / 1162780221153193) [(3, 1), (6, 2), (15, 1), (16, 1)],
  term ((11267418267709793249360068694802780071340436008626146210 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 1), (6, 2), (15, 3)],
  term ((-8526632792004408 : Rat) / 1162780221153193) [(3, 1), (6, 2), (15, 3), (16, 1)],
  term ((-148463915429989232827957433590977261265 : Rat) / 119970945740247729656669352802953926799) [(3, 1), (7, 1), (8, 1)],
  term ((-117412202240548834389305462562760883856 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (7, 1), (8, 1), (9, 1), (13, 1)],
  term ((1222689308379968181009349179356074961661002890148376823 : Rat) / 464999476066009909252386715418132948733673211623730690) [(3, 1), (7, 1), (8, 1), (9, 1), (15, 1)],
  term ((-1121361337158702 : Rat) / 1162780221153193) [(3, 1), (7, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-94668798279704919496957715897550631584 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (7, 1), (8, 1), (9, 2)],
  term ((-111299364507379375004267245031895710258 : Rat) / 119970945740247729656669352802953926799) [(3, 1), (7, 1), (8, 1), (12, 1)],
  term ((-33273931020260669930661190011024360672 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((198745616475118943998092102782769635563595552220534688 : Rat) / 46499947606600990925238671541813294873367321162373069) [(3, 1), (7, 1), (8, 1), (12, 1), (15, 2)],
  term ((-1581632301823296 : Rat) / 1162780221153193) [(3, 1), (7, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((13665940368750242398805821778499109403651343582341271507 : Rat) / 929998952132019818504773430836265897467346423247461380) [(3, 1), (7, 1), (8, 1), (13, 1), (15, 1)],
  term ((-106291408585995 : Rat) / 1162780221153193) [(3, 1), (7, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((16187308625359244326701932651346745316 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (7, 1), (8, 1), (13, 2)],
  term ((608824481858962455612092181941373992077 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (7, 1), (8, 1), (14, 1)],
  term ((-2298204085221019497339885976171791710852429622693000547 : Rat) / 47288082311797617890073225296759282922068462199023460) [(3, 1), (7, 1), (8, 1), (15, 2)],
  term ((1048479305353675 : Rat) / 1162780221153193) [(3, 1), (7, 1), (8, 1), (15, 2), (16, 1)],
  term ((826347564150239326187536952436868474864 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (7, 1), (8, 2)],
  term ((39137400746849611463101820854253627952 : Rat) / 39990315246749243218889784267651308933) [(3, 1), (7, 1), (9, 1), (12, 1), (13, 1)],
  term ((-6117088134986307917740122211961773302290741365461673651 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(3, 1), (7, 1), (9, 1), (12, 1), (15, 1)],
  term ((1868935561931170 : Rat) / 1162780221153193) [(3, 1), (7, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((156549602987398445852407283417014511808 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (7, 1), (9, 1), (13, 1), (14, 1)],
  term ((-2449020209846403374712074673893548417307732695016543182 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (7, 1), (9, 1), (14, 1), (15, 1)],
  term ((1495148449544936 : Rat) / 1162780221153193) [(3, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((31556266093234973165652571965850210528 : Rat) / 39990315246749243218889784267651308933) [(3, 1), (7, 1), (9, 2), (12, 1)],
  term ((126225064372939892662610287863400842112 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (7, 1), (9, 2), (14, 1)],
  term ((474126838180308352184970268942469465357 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (7, 1), (12, 1)],
  term ((-64058845371574692704468717594301588487936003313615869633 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(3, 1), (7, 1), (12, 1), (13, 1), (15, 1)],
  term ((181622001380355 : Rat) / 1162780221153193) [(3, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((24285619430674572789347187379892301356 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (7, 1), (12, 1), (13, 2)],
  term ((-582061027275376329967414115123588817349 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (7, 1), (12, 1), (14, 1)],
  term ((11054165036071785399365776736060685613928533689685750087 : Rat) / 185999790426403963700954686167253179493469284649492276) [(3, 1), (7, 1), (12, 1), (15, 2)],
  term ((-2113589838824883 : Rat) / 1162780221153193) [(3, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((-89950247204447483722066909092463307858 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (7, 1), (12, 2)],
  term ((33273931020260669930661190011024360672 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (7, 1), (12, 2), (13, 1), (15, 1)],
  term ((-198745616475118943998092102782769635563595552220534688 : Rat) / 46499947606600990925238671541813294873367321162373069) [(3, 1), (7, 1), (12, 2), (15, 2)],
  term ((1581632301823296 : Rat) / 1162780221153193) [(3, 1), (7, 1), (12, 2), (15, 2), (16, 1)],
  term ((-11505073964399522846249871046495738097852688577051920964 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (7, 1), (13, 1), (14, 1), (15, 1)],
  term ((150661185588720 : Rat) / 1162780221153193) [(3, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((80945856112067634232098240062478093344 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (7, 1), (13, 2), (14, 1)],
  term ((-56935318687050373770433198734129544818 : Rat) / 39990315246749243218889784267651308933) [(3, 1), (7, 1), (14, 1)],
  term ((5633709133854896624680034347401390035670218004313073105 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 1), (7, 1), (14, 1), (15, 2)],
  term ((-4263316396002204 : Rat) / 1162780221153193) [(3, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((17842303055724083763118711211856783152 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (7, 1), (14, 2)],
  term ((2577680137987848256677737667577720516469 : Rat) / 5398692558311147834550120876132926705955) [(3, 1), (8, 1), (9, 1)],
  term ((-117412202240548834389305462562760883856 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (8, 1), (9, 1), (11, 1), (13, 1)],
  term ((1222689308379968181009349179356074961661002890148376823 : Rat) / 464999476066009909252386715418132948733673211623730690) [(3, 1), (8, 1), (9, 1), (11, 1), (15, 1)],
  term ((-1121361337158702 : Rat) / 1162780221153193) [(3, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-346796828366337751507431846266314199278 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (8, 1), (9, 1), (12, 1)],
  term ((-11091310340086889976887063337008120224 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((198745616475118943998092102782769635563595552220534688 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 1), (8, 1), (9, 1), (12, 1), (15, 2)],
  term ((-527210767274432 : Rat) / 1162780221153193) [(3, 1), (8, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-1712108411655918217728834922540791858411089679157655495 : Rat) / 1673998113837635673308592175505278615441223561845430484) [(3, 1), (8, 1), (9, 1), (13, 1), (15, 1)],
  term ((5094646267068265 : Rat) / 3488340663459579) [(3, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-815388877581942842408941403533558143676 : Rat) / 1799564186103715944850040292044308901985) [(3, 1), (8, 1), (9, 1), (13, 2)],
  term ((-4322497448458887375868451465862051682379 : Rat) / 1799564186103715944850040292044308901985) [(3, 1), (8, 1), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 15, terms 1100 through 1199. -/
theorem ep_Q2_024_block_15_1100_1199_valid :
    checkProductSumEq ep_Q2_024_partials_15_1100_1199
      ep_Q2_024_block_15_1100_1199 = true := by
  native_decide

end EpQ2024TermShards

end Patterns

end EndpointCertificate

end Problem97
