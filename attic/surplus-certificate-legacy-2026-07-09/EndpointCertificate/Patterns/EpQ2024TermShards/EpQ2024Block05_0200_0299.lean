/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_024, term block 5:200-299

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_024`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2024TermShards

/-- Generator polynomial 5 for endpoint certificate `ep_Q2_024`. -/
def ep_Q2_024_generator_05_0200_0299 : Poly :=
[
  term (1 : Rat) [(2, 2)],
  term (1 : Rat) [(3, 2)],
  term (-1 : Rat) [(14, 2)],
  term (-1 : Rat) [(15, 2)]
]

/-- Coefficient term 200 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0200 : Poly :=
[
  term ((-75330592794360 : Rat) / 1162780221153193) [(3, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 200 for generator 5. -/
def ep_Q2_024_partial_05_0200 : Poly :=
[
  term ((-75330592794360 : Rat) / 1162780221153193) [(2, 2), (3, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((75330592794360 : Rat) / 1162780221153193) [(3, 1), (7, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((75330592794360 : Rat) / 1162780221153193) [(3, 1), (7, 1), (13, 1), (15, 3), (16, 1)],
  term ((-75330592794360 : Rat) / 1162780221153193) [(3, 3), (7, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 200 for generator 5. -/
theorem ep_Q2_024_partial_05_0200_valid :
    mulPoly ep_Q2_024_coefficient_05_0200
        ep_Q2_024_generator_05_0200_0299 =
      ep_Q2_024_partial_05_0200 := by
  native_decide

/-- Coefficient term 201 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0201 : Poly :=
[
  term ((-40472928056033817116049120031239046672 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (7, 1), (13, 2)]
]

/-- Partial product 201 for generator 5. -/
def ep_Q2_024_partial_05_0201 : Poly :=
[
  term ((-40472928056033817116049120031239046672 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (3, 1), (7, 1), (13, 2)],
  term ((40472928056033817116049120031239046672 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (7, 1), (13, 2), (14, 2)],
  term ((40472928056033817116049120031239046672 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (7, 1), (13, 2), (15, 2)],
  term ((-40472928056033817116049120031239046672 : Rat) / 599854728701238648283346764014769633995) [(3, 3), (7, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 201 for generator 5. -/
theorem ep_Q2_024_partial_05_0201_valid :
    mulPoly ep_Q2_024_coefficient_05_0201
        ep_Q2_024_generator_05_0200_0299 =
      ep_Q2_024_partial_05_0201 := by
  native_decide

/-- Coefficient term 202 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0202 : Poly :=
[
  term ((-8921151527862041881559355605928391576 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (7, 1), (14, 1)]
]

/-- Partial product 202 for generator 5. -/
def ep_Q2_024_partial_05_0202 : Poly :=
[
  term ((-8921151527862041881559355605928391576 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (3, 1), (7, 1), (14, 1)],
  term ((8921151527862041881559355605928391576 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (7, 1), (14, 1), (15, 2)],
  term ((8921151527862041881559355605928391576 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (7, 1), (14, 3)],
  term ((-8921151527862041881559355605928391576 : Rat) / 199951576233746216094448921338256544665) [(3, 3), (7, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 202 for generator 5. -/
theorem ep_Q2_024_partial_05_0202_valid :
    mulPoly ep_Q2_024_coefficient_05_0202
        ep_Q2_024_generator_05_0200_0299 =
      ep_Q2_024_partial_05_0202 := by
  native_decide

/-- Coefficient term 203 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0203 : Poly :=
[
  term ((-6871312347005108487180609041771102287064141873321853589 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (7, 1), (15, 2)]
]

/-- Partial product 203 for generator 5. -/
def ep_Q2_024_partial_05_0203 : Poly :=
[
  term ((-6871312347005108487180609041771102287064141873321853589 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 2), (3, 1), (7, 1), (15, 2)],
  term ((6871312347005108487180609041771102287064141873321853589 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (7, 1), (14, 2), (15, 2)],
  term ((6871312347005108487180609041771102287064141873321853589 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (7, 1), (15, 4)],
  term ((-6871312347005108487180609041771102287064141873321853589 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 3), (7, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 203 for generator 5. -/
theorem ep_Q2_024_partial_05_0203_valid :
    mulPoly ep_Q2_024_coefficient_05_0203
        ep_Q2_024_generator_05_0200_0299 =
      ep_Q2_024_partial_05_0203 := by
  native_decide

/-- Coefficient term 204 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0204 : Poly :=
[
  term ((3198205862530996 : Rat) / 1162780221153193) [(3, 1), (7, 1), (15, 2), (16, 1)]
]

/-- Partial product 204 for generator 5. -/
def ep_Q2_024_partial_05_0204 : Poly :=
[
  term ((3198205862530996 : Rat) / 1162780221153193) [(2, 2), (3, 1), (7, 1), (15, 2), (16, 1)],
  term ((-3198205862530996 : Rat) / 1162780221153193) [(3, 1), (7, 1), (14, 2), (15, 2), (16, 1)],
  term ((-3198205862530996 : Rat) / 1162780221153193) [(3, 1), (7, 1), (15, 4), (16, 1)],
  term ((3198205862530996 : Rat) / 1162780221153193) [(3, 3), (7, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 204 for generator 5. -/
theorem ep_Q2_024_partial_05_0204_valid :
    mulPoly ep_Q2_024_coefficient_05_0204
        ep_Q2_024_generator_05_0200_0299 =
      ep_Q2_024_partial_05_0204 := by
  native_decide

/-- Coefficient term 205 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0205 : Poly :=
[
  term ((1652695128300478652375073904873736949728 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (8, 1), (9, 1)]
]

/-- Partial product 205 for generator 5. -/
def ep_Q2_024_partial_05_0205 : Poly :=
[
  term ((1652695128300478652375073904873736949728 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (3, 1), (8, 1), (9, 1)],
  term ((-1652695128300478652375073904873736949728 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (8, 1), (9, 1), (14, 2)],
  term ((-1652695128300478652375073904873736949728 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (8, 1), (9, 1), (15, 2)],
  term ((1652695128300478652375073904873736949728 : Rat) / 599854728701238648283346764014769633995) [(3, 3), (8, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 205 for generator 5. -/
theorem ep_Q2_024_partial_05_0205_valid :
    mulPoly ep_Q2_024_coefficient_05_0205
        ep_Q2_024_generator_05_0200_0299 =
      ep_Q2_024_partial_05_0205 := by
  native_decide

/-- Coefficient term 206 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0206 : Poly :=
[
  term ((-1417328201287324005548875358914343460668 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (9, 1)]
]

/-- Partial product 206 for generator 5. -/
def ep_Q2_024_partial_05_0206 : Poly :=
[
  term ((-1417328201287324005548875358914343460668 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (3, 1), (9, 1)],
  term ((1417328201287324005548875358914343460668 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (9, 1), (14, 2)],
  term ((1417328201287324005548875358914343460668 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (9, 1), (15, 2)],
  term ((-1417328201287324005548875358914343460668 : Rat) / 599854728701238648283346764014769633995) [(3, 3), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 206 for generator 5. -/
theorem ep_Q2_024_partial_05_0206_valid :
    mulPoly ep_Q2_024_coefficient_05_0206
        ep_Q2_024_generator_05_0200_0299 =
      ep_Q2_024_partial_05_0206 := by
  native_decide

/-- Coefficient term 207 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0207 : Poly :=
[
  term ((211456760502129940609786390150776826244 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (9, 1), (12, 1)]
]

/-- Partial product 207 for generator 5. -/
def ep_Q2_024_partial_05_0207 : Poly :=
[
  term ((211456760502129940609786390150776826244 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (3, 1), (9, 1), (12, 1)],
  term ((-211456760502129940609786390150776826244 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (9, 1), (12, 1), (14, 2)],
  term ((-211456760502129940609786390150776826244 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (9, 1), (12, 1), (15, 2)],
  term ((211456760502129940609786390150776826244 : Rat) / 199951576233746216094448921338256544665) [(3, 3), (9, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 207 for generator 5. -/
theorem ep_Q2_024_partial_05_0207_valid :
    mulPoly ep_Q2_024_coefficient_05_0207
        ep_Q2_024_generator_05_0200_0299 =
      ep_Q2_024_partial_05_0207 := by
  native_decide

/-- Coefficient term 208 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0208 : Poly :=
[
  term ((-3209257923513847776562869360713708288 : Rat) / 39990315246749243218889784267651308933) [(3, 1), (9, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 208 for generator 5. -/
def ep_Q2_024_partial_05_0208 : Poly :=
[
  term ((-3209257923513847776562869360713708288 : Rat) / 39990315246749243218889784267651308933) [(2, 2), (3, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((3209257923513847776562869360713708288 : Rat) / 39990315246749243218889784267651308933) [(3, 1), (9, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((3209257923513847776562869360713708288 : Rat) / 39990315246749243218889784267651308933) [(3, 1), (9, 1), (12, 1), (13, 1), (15, 3)],
  term ((-3209257923513847776562869360713708288 : Rat) / 39990315246749243218889784267651308933) [(3, 3), (9, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 208 for generator 5. -/
theorem ep_Q2_024_partial_05_0208_valid :
    mulPoly ep_Q2_024_coefficient_05_0208
        ep_Q2_024_generator_05_0200_0299 =
      ep_Q2_024_partial_05_0208 := by
  native_decide

/-- Coefficient term 209 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0209 : Poly :=
[
  term ((550224871676112102035615555952179792604942567145793832 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (9, 1), (12, 1), (15, 2)]
]

/-- Partial product 209 for generator 5. -/
def ep_Q2_024_partial_05_0209 : Poly :=
[
  term ((550224871676112102035615555952179792604942567145793832 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 2), (3, 1), (9, 1), (12, 1), (15, 2)],
  term ((-550224871676112102035615555952179792604942567145793832 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (9, 1), (12, 1), (14, 2), (15, 2)],
  term ((-550224871676112102035615555952179792604942567145793832 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (9, 1), (12, 1), (15, 4)],
  term ((550224871676112102035615555952179792604942567145793832 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 3), (9, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 209 for generator 5. -/
theorem ep_Q2_024_partial_05_0209_valid :
    mulPoly ep_Q2_024_coefficient_05_0209
        ep_Q2_024_generator_05_0200_0299 =
      ep_Q2_024_partial_05_0209 := by
  native_decide

/-- Coefficient term 210 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0210 : Poly :=
[
  term ((-1443384088015008 : Rat) / 1162780221153193) [(3, 1), (9, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 210 for generator 5. -/
def ep_Q2_024_partial_05_0210 : Poly :=
[
  term ((-1443384088015008 : Rat) / 1162780221153193) [(2, 2), (3, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((1443384088015008 : Rat) / 1162780221153193) [(3, 1), (9, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((1443384088015008 : Rat) / 1162780221153193) [(3, 1), (9, 1), (12, 1), (15, 4), (16, 1)],
  term ((-1443384088015008 : Rat) / 1162780221153193) [(3, 3), (9, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 210 for generator 5. -/
theorem ep_Q2_024_partial_05_0210_valid :
    mulPoly ep_Q2_024_coefficient_05_0210
        ep_Q2_024_generator_05_0200_0299 =
      ep_Q2_024_partial_05_0210 := by
  native_decide

/-- Coefficient term 211 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0211 : Poly :=
[
  term ((43135328846876119407214699700298383881329052598883204313 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(3, 1), (9, 1), (13, 1), (15, 1)]
]

/-- Partial product 211 for generator 5. -/
def ep_Q2_024_partial_05_0211 : Poly :=
[
  term ((43135328846876119407214699700298383881329052598883204313 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(2, 2), (3, 1), (9, 1), (13, 1), (15, 1)],
  term ((-43135328846876119407214699700298383881329052598883204313 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(3, 1), (9, 1), (13, 1), (14, 2), (15, 1)],
  term ((-43135328846876119407214699700298383881329052598883204313 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(3, 1), (9, 1), (13, 1), (15, 3)],
  term ((43135328846876119407214699700298383881329052598883204313 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(3, 3), (9, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 211 for generator 5. -/
theorem ep_Q2_024_partial_05_0211_valid :
    mulPoly ep_Q2_024_coefficient_05_0211
        ep_Q2_024_generator_05_0200_0299 =
      ep_Q2_024_partial_05_0211 := by
  native_decide

/-- Coefficient term 212 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0212 : Poly :=
[
  term ((-212582817171990 : Rat) / 1162780221153193) [(3, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 212 for generator 5. -/
def ep_Q2_024_partial_05_0212 : Poly :=
[
  term ((-212582817171990 : Rat) / 1162780221153193) [(2, 2), (3, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((212582817171990 : Rat) / 1162780221153193) [(3, 1), (9, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((212582817171990 : Rat) / 1162780221153193) [(3, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((-212582817171990 : Rat) / 1162780221153193) [(3, 3), (9, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 212 for generator 5. -/
theorem ep_Q2_024_partial_05_0212_valid :
    mulPoly ep_Q2_024_coefficient_05_0212
        ep_Q2_024_generator_05_0200_0299 =
      ep_Q2_024_partial_05_0212 := by
  native_decide

/-- Coefficient term 213 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0213 : Poly :=
[
  term ((32374617250718488653403865302693490632 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (9, 1), (13, 2)]
]

/-- Partial product 213 for generator 5. -/
def ep_Q2_024_partial_05_0213 : Poly :=
[
  term ((32374617250718488653403865302693490632 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (3, 1), (9, 1), (13, 2)],
  term ((-32374617250718488653403865302693490632 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (9, 1), (13, 2), (14, 2)],
  term ((-32374617250718488653403865302693490632 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (9, 1), (13, 2), (15, 2)],
  term ((32374617250718488653403865302693490632 : Rat) / 599854728701238648283346764014769633995) [(3, 3), (9, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 213 for generator 5. -/
theorem ep_Q2_024_partial_05_0213_valid :
    mulPoly ep_Q2_024_coefficient_05_0213
        ep_Q2_024_generator_05_0200_0299 =
      ep_Q2_024_partial_05_0213 := by
  native_decide

/-- Coefficient term 214 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0214 : Poly :=
[
  term ((1217648963717924911224184363882747984154 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (9, 1), (14, 1)]
]

/-- Partial product 214 for generator 5. -/
def ep_Q2_024_partial_05_0214 : Poly :=
[
  term ((1217648963717924911224184363882747984154 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (3, 1), (9, 1), (14, 1)],
  term ((-1217648963717924911224184363882747984154 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (9, 1), (14, 1), (15, 2)],
  term ((-1217648963717924911224184363882747984154 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (9, 1), (14, 3)],
  term ((1217648963717924911224184363882747984154 : Rat) / 599854728701238648283346764014769633995) [(3, 3), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 214 for generator 5. -/
theorem ep_Q2_024_partial_05_0214_valid :
    mulPoly ep_Q2_024_coefficient_05_0214
        ep_Q2_024_generator_05_0200_0299 =
      ep_Q2_024_partial_05_0214 := by
  native_decide

/-- Coefficient term 215 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0215 : Poly :=
[
  term ((4666118582264079879312520807185554929005944364492589137 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (9, 1), (15, 2)]
]

/-- Partial product 215 for generator 5. -/
def ep_Q2_024_partial_05_0215 : Poly :=
[
  term ((4666118582264079879312520807185554929005944364492589137 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 2), (3, 1), (9, 1), (15, 2)],
  term ((-4666118582264079879312520807185554929005944364492589137 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (9, 1), (14, 2), (15, 2)],
  term ((-4666118582264079879312520807185554929005944364492589137 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (9, 1), (15, 4)],
  term ((4666118582264079879312520807185554929005944364492589137 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 3), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 215 for generator 5. -/
theorem ep_Q2_024_partial_05_0215_valid :
    mulPoly ep_Q2_024_coefficient_05_0215
        ep_Q2_024_generator_05_0200_0299 =
      ep_Q2_024_partial_05_0215 := by
  native_decide

/-- Coefficient term 216 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0216 : Poly :=
[
  term ((-7791585621739076 : Rat) / 1162780221153193) [(3, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 216 for generator 5. -/
def ep_Q2_024_partial_05_0216 : Poly :=
[
  term ((-7791585621739076 : Rat) / 1162780221153193) [(2, 2), (3, 1), (9, 1), (15, 2), (16, 1)],
  term ((7791585621739076 : Rat) / 1162780221153193) [(3, 1), (9, 1), (14, 2), (15, 2), (16, 1)],
  term ((7791585621739076 : Rat) / 1162780221153193) [(3, 1), (9, 1), (15, 4), (16, 1)],
  term ((-7791585621739076 : Rat) / 1162780221153193) [(3, 3), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 216 for generator 5. -/
theorem ep_Q2_024_partial_05_0216_valid :
    mulPoly ep_Q2_024_coefficient_05_0216
        ep_Q2_024_generator_05_0200_0299 =
      ep_Q2_024_partial_05_0216 := by
  native_decide

/-- Coefficient term 217 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0217 : Poly :=
[
  term ((-234824404481097668778610925125521767712 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (9, 2), (13, 1)]
]

/-- Partial product 217 for generator 5. -/
def ep_Q2_024_partial_05_0217 : Poly :=
[
  term ((-234824404481097668778610925125521767712 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (3, 1), (9, 2), (13, 1)],
  term ((234824404481097668778610925125521767712 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (9, 2), (13, 1), (14, 2)],
  term ((234824404481097668778610925125521767712 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (9, 2), (13, 1), (15, 2)],
  term ((-234824404481097668778610925125521767712 : Rat) / 199951576233746216094448921338256544665) [(3, 3), (9, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 217 for generator 5. -/
theorem ep_Q2_024_partial_05_0217_valid :
    mulPoly ep_Q2_024_coefficient_05_0217
        ep_Q2_024_generator_05_0200_0299 =
      ep_Q2_024_partial_05_0217 := by
  native_decide

/-- Coefficient term 218 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0218 : Poly :=
[
  term ((1224510104923201687356037336946774208653866347508271591 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (9, 2), (15, 1)]
]

/-- Partial product 218 for generator 5. -/
def ep_Q2_024_partial_05_0218 : Poly :=
[
  term ((1224510104923201687356037336946774208653866347508271591 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 2), (3, 1), (9, 2), (15, 1)],
  term ((-1224510104923201687356037336946774208653866347508271591 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (9, 2), (14, 2), (15, 1)],
  term ((-1224510104923201687356037336946774208653866347508271591 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (9, 2), (15, 3)],
  term ((1224510104923201687356037336946774208653866347508271591 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 3), (9, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 218 for generator 5. -/
theorem ep_Q2_024_partial_05_0218_valid :
    mulPoly ep_Q2_024_coefficient_05_0218
        ep_Q2_024_generator_05_0200_0299 =
      ep_Q2_024_partial_05_0218 := by
  native_decide

/-- Coefficient term 219 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0219 : Poly :=
[
  term ((-2242722674317404 : Rat) / 1162780221153193) [(3, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 219 for generator 5. -/
def ep_Q2_024_partial_05_0219 : Poly :=
[
  term ((-2242722674317404 : Rat) / 1162780221153193) [(2, 2), (3, 1), (9, 2), (15, 1), (16, 1)],
  term ((2242722674317404 : Rat) / 1162780221153193) [(3, 1), (9, 2), (14, 2), (15, 1), (16, 1)],
  term ((2242722674317404 : Rat) / 1162780221153193) [(3, 1), (9, 2), (15, 3), (16, 1)],
  term ((-2242722674317404 : Rat) / 1162780221153193) [(3, 3), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 219 for generator 5. -/
theorem ep_Q2_024_partial_05_0219_valid :
    mulPoly ep_Q2_024_coefficient_05_0219
        ep_Q2_024_generator_05_0200_0299 =
      ep_Q2_024_partial_05_0219 := by
  native_decide

/-- Coefficient term 220 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0220 : Poly :=
[
  term ((-189337596559409838993915431795101263168 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (9, 3)]
]

/-- Partial product 220 for generator 5. -/
def ep_Q2_024_partial_05_0220 : Poly :=
[
  term ((-189337596559409838993915431795101263168 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (3, 1), (9, 3)],
  term ((189337596559409838993915431795101263168 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (9, 3), (14, 2)],
  term ((189337596559409838993915431795101263168 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (9, 3), (15, 2)],
  term ((-189337596559409838993915431795101263168 : Rat) / 199951576233746216094448921338256544665) [(3, 3), (9, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 220 for generator 5. -/
theorem ep_Q2_024_partial_05_0220_valid :
    mulPoly ep_Q2_024_coefficient_05_0220
        ep_Q2_024_generator_05_0200_0299 =
      ep_Q2_024_partial_05_0220 := by
  native_decide

/-- Coefficient term 221 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0221 : Poly :=
[
  term ((12492472986937566043423911539945286416 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (12, 1), (13, 1)]
]

/-- Partial product 221 for generator 5. -/
def ep_Q2_024_partial_05_0221 : Poly :=
[
  term ((12492472986937566043423911539945286416 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (3, 1), (12, 1), (13, 1)],
  term ((-12492472986937566043423911539945286416 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (12, 1), (13, 1), (14, 2)],
  term ((-12492472986937566043423911539945286416 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (12, 1), (13, 1), (15, 2)],
  term ((12492472986937566043423911539945286416 : Rat) / 199951576233746216094448921338256544665) [(3, 3), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 221 for generator 5. -/
theorem ep_Q2_024_partial_05_0221_valid :
    mulPoly ep_Q2_024_coefficient_05_0221
        ep_Q2_024_generator_05_0200_0299 =
      ep_Q2_024_partial_05_0221 := by
  native_decide

/-- Coefficient term 222 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0222 : Poly :=
[
  term ((5474663009772140144656526016955689267161795033886933313 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(3, 1), (12, 1), (15, 1)]
]

/-- Partial product 222 for generator 5. -/
def ep_Q2_024_partial_05_0222 : Poly :=
[
  term ((5474663009772140144656526016955689267161795033886933313 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(2, 2), (3, 1), (12, 1), (15, 1)],
  term ((-5474663009772140144656526016955689267161795033886933313 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(3, 1), (12, 1), (14, 2), (15, 1)],
  term ((-5474663009772140144656526016955689267161795033886933313 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(3, 1), (12, 1), (15, 3)],
  term ((5474663009772140144656526016955689267161795033886933313 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(3, 3), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 222 for generator 5. -/
theorem ep_Q2_024_partial_05_0222_valid :
    mulPoly ep_Q2_024_coefficient_05_0222
        ep_Q2_024_generator_05_0200_0299 =
      ep_Q2_024_partial_05_0222 := by
  native_decide

/-- Coefficient term 223 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0223 : Poly :=
[
  term ((-299904219258166 : Rat) / 1162780221153193) [(3, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 223 for generator 5. -/
def ep_Q2_024_partial_05_0223 : Poly :=
[
  term ((-299904219258166 : Rat) / 1162780221153193) [(2, 2), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((299904219258166 : Rat) / 1162780221153193) [(3, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((299904219258166 : Rat) / 1162780221153193) [(3, 1), (12, 1), (15, 3), (16, 1)],
  term ((-299904219258166 : Rat) / 1162780221153193) [(3, 3), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 223 for generator 5. -/
theorem ep_Q2_024_partial_05_0223_valid :
    mulPoly ep_Q2_024_coefficient_05_0223
        ep_Q2_024_generator_05_0200_0299 =
      ep_Q2_024_partial_05_0223 := by
  native_decide

/-- Coefficient term 224 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0224 : Poly :=
[
  term ((-203545545408235787656366621830933929642 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (13, 1)]
]

/-- Partial product 224 for generator 5. -/
def ep_Q2_024_partial_05_0224 : Poly :=
[
  term ((-203545545408235787656366621830933929642 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (3, 1), (13, 1)],
  term ((203545545408235787656366621830933929642 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (13, 1), (14, 2)],
  term ((203545545408235787656366621830933929642 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (13, 1), (15, 2)],
  term ((-203545545408235787656366621830933929642 : Rat) / 599854728701238648283346764014769633995) [(3, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 224 for generator 5. -/
theorem ep_Q2_024_partial_05_0224_valid :
    mulPoly ep_Q2_024_coefficient_05_0224
        ep_Q2_024_generator_05_0200_0299 =
      ep_Q2_024_partial_05_0224 := by
  native_decide

/-- Coefficient term 225 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0225 : Poly :=
[
  term ((40423760364518984840150318565767501272 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (13, 1), (14, 1)]
]

/-- Partial product 225 for generator 5. -/
def ep_Q2_024_partial_05_0225 : Poly :=
[
  term ((40423760364518984840150318565767501272 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (3, 1), (13, 1), (14, 1)],
  term ((-40423760364518984840150318565767501272 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (13, 1), (14, 1), (15, 2)],
  term ((-40423760364518984840150318565767501272 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (13, 1), (14, 3)],
  term ((40423760364518984840150318565767501272 : Rat) / 599854728701238648283346764014769633995) [(3, 3), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 225 for generator 5. -/
theorem ep_Q2_024_partial_05_0225_valid :
    mulPoly ep_Q2_024_coefficient_05_0225
        ep_Q2_024_generator_05_0200_0299 =
      ep_Q2_024_partial_05_0225 := by
  native_decide

/-- Coefficient term 226 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0226 : Poly :=
[
  term ((-427717756781907914922890628895589920671501510102299927 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (14, 1), (15, 1)]
]

/-- Partial product 226 for generator 5. -/
def ep_Q2_024_partial_05_0226 : Poly :=
[
  term ((-427717756781907914922890628895589920671501510102299927 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 2), (3, 1), (14, 1), (15, 1)],
  term ((427717756781907914922890628895589920671501510102299927 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (14, 1), (15, 3)],
  term ((427717756781907914922890628895589920671501510102299927 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (14, 3), (15, 1)],
  term ((-427717756781907914922890628895589920671501510102299927 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 226 for generator 5. -/
theorem ep_Q2_024_partial_05_0226_valid :
    mulPoly ep_Q2_024_coefficient_05_0226
        ep_Q2_024_generator_05_0200_0299 =
      ep_Q2_024_partial_05_0226 := by
  native_decide

/-- Coefficient term 227 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0227 : Poly :=
[
  term ((-141136064908796 : Rat) / 1162780221153193) [(3, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 227 for generator 5. -/
def ep_Q2_024_partial_05_0227 : Poly :=
[
  term ((-141136064908796 : Rat) / 1162780221153193) [(2, 2), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((141136064908796 : Rat) / 1162780221153193) [(3, 1), (14, 1), (15, 3), (16, 1)],
  term ((141136064908796 : Rat) / 1162780221153193) [(3, 1), (14, 3), (15, 1), (16, 1)],
  term ((-141136064908796 : Rat) / 1162780221153193) [(3, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 227 for generator 5. -/
theorem ep_Q2_024_partial_05_0227_valid :
    mulPoly ep_Q2_024_coefficient_05_0227
        ep_Q2_024_generator_05_0200_0299 =
      ep_Q2_024_partial_05_0227 := by
  native_decide

/-- Coefficient term 228 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0228 : Poly :=
[
  term ((-5127349422671957138224600028120682800758849034148764083 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(3, 1), (15, 1)]
]

/-- Partial product 228 for generator 5. -/
def ep_Q2_024_partial_05_0228 : Poly :=
[
  term ((-5127349422671957138224600028120682800758849034148764083 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(2, 2), (3, 1), (15, 1)],
  term ((5127349422671957138224600028120682800758849034148764083 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(3, 1), (14, 2), (15, 1)],
  term ((5127349422671957138224600028120682800758849034148764083 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(3, 1), (15, 3)],
  term ((-5127349422671957138224600028120682800758849034148764083 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(3, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 228 for generator 5. -/
theorem ep_Q2_024_partial_05_0228_valid :
    mulPoly ep_Q2_024_coefficient_05_0228
        ep_Q2_024_generator_05_0200_0299 =
      ep_Q2_024_partial_05_0228 := by
  native_decide

/-- Coefficient term 229 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0229 : Poly :=
[
  term ((2056449568955337 : Rat) / 2325560442306386) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 229 for generator 5. -/
def ep_Q2_024_partial_05_0229 : Poly :=
[
  term ((2056449568955337 : Rat) / 2325560442306386) [(2, 2), (3, 1), (15, 1), (16, 1)],
  term ((-2056449568955337 : Rat) / 2325560442306386) [(3, 1), (14, 2), (15, 1), (16, 1)],
  term ((-2056449568955337 : Rat) / 2325560442306386) [(3, 1), (15, 3), (16, 1)],
  term ((2056449568955337 : Rat) / 2325560442306386) [(3, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 229 for generator 5. -/
theorem ep_Q2_024_partial_05_0229_valid :
    mulPoly ep_Q2_024_coefficient_05_0229
        ep_Q2_024_generator_05_0200_0299 =
      ep_Q2_024_partial_05_0229 := by
  native_decide

/-- Coefficient term 230 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0230 : Poly :=
[
  term ((-2754238630492206819387885567193033316329 : Rat) / 3599128372207431889700080584088617803970) [(4, 1)]
]

/-- Partial product 230 for generator 5. -/
def ep_Q2_024_partial_05_0230 : Poly :=
[
  term ((-2754238630492206819387885567193033316329 : Rat) / 3599128372207431889700080584088617803970) [(2, 2), (4, 1)],
  term ((-2754238630492206819387885567193033316329 : Rat) / 3599128372207431889700080584088617803970) [(3, 2), (4, 1)],
  term ((2754238630492206819387885567193033316329 : Rat) / 3599128372207431889700080584088617803970) [(4, 1), (14, 2)],
  term ((2754238630492206819387885567193033316329 : Rat) / 3599128372207431889700080584088617803970) [(4, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 230 for generator 5. -/
theorem ep_Q2_024_partial_05_0230_valid :
    mulPoly ep_Q2_024_coefficient_05_0230
        ep_Q2_024_generator_05_0200_0299 =
      ep_Q2_024_partial_05_0230 := by
  native_decide

/-- Coefficient term 231 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0231 : Poly :=
[
  term ((16890983628896808743407603036576568848 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (5, 1), (9, 1)]
]

/-- Partial product 231 for generator 5. -/
def ep_Q2_024_partial_05_0231 : Poly :=
[
  term ((16890983628896808743407603036576568848 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (4, 1), (5, 1), (9, 1)],
  term ((16890983628896808743407603036576568848 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (4, 1), (5, 1), (9, 1)],
  term ((-16890983628896808743407603036576568848 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (5, 1), (9, 1), (14, 2)],
  term ((-16890983628896808743407603036576568848 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (5, 1), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 231 for generator 5. -/
theorem ep_Q2_024_partial_05_0231_valid :
    mulPoly ep_Q2_024_coefficient_05_0231
        ep_Q2_024_generator_05_0200_0299 =
      ep_Q2_024_partial_05_0231 := by
  native_decide

/-- Coefficient term 232 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0232 : Poly :=
[
  term ((20220074797511964466058292860462341536 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (5, 1), (13, 1)]
]

/-- Partial product 232 for generator 5. -/
def ep_Q2_024_partial_05_0232 : Poly :=
[
  term ((20220074797511964466058292860462341536 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (4, 1), (5, 1), (13, 1)],
  term ((20220074797511964466058292860462341536 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (4, 1), (5, 1), (13, 1)],
  term ((-20220074797511964466058292860462341536 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (5, 1), (13, 1), (14, 2)],
  term ((-20220074797511964466058292860462341536 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (5, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 232 for generator 5. -/
theorem ep_Q2_024_partial_05_0232_valid :
    mulPoly ep_Q2_024_coefficient_05_0232
        ep_Q2_024_generator_05_0200_0299 =
      ep_Q2_024_partial_05_0232 := by
  native_decide

/-- Coefficient term 233 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0233 : Poly :=
[
  term ((-1086812258876365631714711692878661467835285345215957824 : Rat) / 232499738033004954626193357709066474366836605811865345) [(4, 1), (5, 1), (15, 1)]
]

/-- Partial product 233 for generator 5. -/
def ep_Q2_024_partial_05_0233 : Poly :=
[
  term ((-1086812258876365631714711692878661467835285345215957824 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 2), (4, 1), (5, 1), (15, 1)],
  term ((-1086812258876365631714711692878661467835285345215957824 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 2), (4, 1), (5, 1), (15, 1)],
  term ((1086812258876365631714711692878661467835285345215957824 : Rat) / 232499738033004954626193357709066474366836605811865345) [(4, 1), (5, 1), (14, 2), (15, 1)],
  term ((1086812258876365631714711692878661467835285345215957824 : Rat) / 232499738033004954626193357709066474366836605811865345) [(4, 1), (5, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 233 for generator 5. -/
theorem ep_Q2_024_partial_05_0233_valid :
    mulPoly ep_Q2_024_coefficient_05_0233
        ep_Q2_024_generator_05_0200_0299 =
      ep_Q2_024_partial_05_0233 := by
  native_decide

/-- Coefficient term 234 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0234 : Poly :=
[
  term ((-103470768511616 : Rat) / 1162780221153193) [(4, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 234 for generator 5. -/
def ep_Q2_024_partial_05_0234 : Poly :=
[
  term ((-103470768511616 : Rat) / 1162780221153193) [(2, 2), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((-103470768511616 : Rat) / 1162780221153193) [(3, 2), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((103470768511616 : Rat) / 1162780221153193) [(4, 1), (5, 1), (14, 2), (15, 1), (16, 1)],
  term ((103470768511616 : Rat) / 1162780221153193) [(4, 1), (5, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 234 for generator 5. -/
theorem ep_Q2_024_partial_05_0234_valid :
    mulPoly ep_Q2_024_coefficient_05_0234
        ep_Q2_024_generator_05_0200_0299 =
      ep_Q2_024_partial_05_0234 := by
  native_decide

/-- Coefficient term 235 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0235 : Poly :=
[
  term ((1629839434123293200787041539811013234524 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (7, 1), (9, 1)]
]

/-- Partial product 235 for generator 5. -/
def ep_Q2_024_partial_05_0235 : Poly :=
[
  term ((1629839434123293200787041539811013234524 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (4, 1), (7, 1), (9, 1)],
  term ((1629839434123293200787041539811013234524 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (4, 1), (7, 1), (9, 1)],
  term ((-1629839434123293200787041539811013234524 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (7, 1), (9, 1), (14, 2)],
  term ((-1629839434123293200787041539811013234524 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (7, 1), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 235 for generator 5. -/
theorem ep_Q2_024_partial_05_0235_valid :
    mulPoly ep_Q2_024_coefficient_05_0235
        ep_Q2_024_generator_05_0200_0299 =
      ep_Q2_024_partial_05_0235 := by
  native_decide

/-- Coefficient term 236 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0236 : Poly :=
[
  term ((362247986505545785230389804845802505856 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (7, 1), (12, 1), (13, 1)]
]

/-- Partial product 236 for generator 5. -/
def ep_Q2_024_partial_05_0236 : Poly :=
[
  term ((362247986505545785230389804845802505856 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (4, 1), (7, 1), (12, 1), (13, 1)],
  term ((362247986505545785230389804845802505856 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (4, 1), (7, 1), (12, 1), (13, 1)],
  term ((-362247986505545785230389804845802505856 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (7, 1), (12, 1), (13, 1), (14, 2)],
  term ((-362247986505545785230389804845802505856 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (7, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 236 for generator 5. -/
theorem ep_Q2_024_partial_05_0236_valid :
    mulPoly ep_Q2_024_coefficient_05_0236
        ep_Q2_024_generator_05_0200_0299 =
      ep_Q2_024_partial_05_0236 := by
  native_decide

/-- Coefficient term 237 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0237 : Poly :=
[
  term ((-3257096208512683818267653266718205086600232278149220966 : Rat) / 232499738033004954626193357709066474366836605811865345) [(4, 1), (7, 1), (12, 1), (15, 1)]
]

/-- Partial product 237 for generator 5. -/
def ep_Q2_024_partial_05_0237 : Poly :=
[
  term ((-3257096208512683818267653266718205086600232278149220966 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 2), (4, 1), (7, 1), (12, 1), (15, 1)],
  term ((-3257096208512683818267653266718205086600232278149220966 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 2), (4, 1), (7, 1), (12, 1), (15, 1)],
  term ((3257096208512683818267653266718205086600232278149220966 : Rat) / 232499738033004954626193357709066474366836605811865345) [(4, 1), (7, 1), (12, 1), (14, 2), (15, 1)],
  term ((3257096208512683818267653266718205086600232278149220966 : Rat) / 232499738033004954626193357709066474366836605811865345) [(4, 1), (7, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 237 for generator 5. -/
theorem ep_Q2_024_partial_05_0237_valid :
    mulPoly ep_Q2_024_coefficient_05_0237
        ep_Q2_024_generator_05_0200_0299 =
      ep_Q2_024_partial_05_0237 := by
  native_decide

/-- Coefficient term 238 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0238 : Poly :=
[
  term ((2393155378199320 : Rat) / 1162780221153193) [(4, 1), (7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 238 for generator 5. -/
def ep_Q2_024_partial_05_0238 : Poly :=
[
  term ((2393155378199320 : Rat) / 1162780221153193) [(2, 2), (4, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((2393155378199320 : Rat) / 1162780221153193) [(3, 2), (4, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2393155378199320 : Rat) / 1162780221153193) [(4, 1), (7, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-2393155378199320 : Rat) / 1162780221153193) [(4, 1), (7, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 238 for generator 5. -/
theorem ep_Q2_024_partial_05_0238_valid :
    mulPoly ep_Q2_024_coefficient_05_0238
        ep_Q2_024_generator_05_0200_0299 =
      ep_Q2_024_partial_05_0238 := by
  native_decide

/-- Coefficient term 239 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0239 : Poly :=
[
  term ((-1972742673473057919187321411288895958404 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (7, 1), (13, 1)]
]

/-- Partial product 239 for generator 5. -/
def ep_Q2_024_partial_05_0239 : Poly :=
[
  term ((-1972742673473057919187321411288895958404 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (4, 1), (7, 1), (13, 1)],
  term ((-1972742673473057919187321411288895958404 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (4, 1), (7, 1), (13, 1)],
  term ((1972742673473057919187321411288895958404 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (7, 1), (13, 1), (14, 2)],
  term ((1972742673473057919187321411288895958404 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (7, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 239 for generator 5. -/
theorem ep_Q2_024_partial_05_0239_valid :
    mulPoly ep_Q2_024_coefficient_05_0239
        ep_Q2_024_generator_05_0200_0299 =
      ep_Q2_024_partial_05_0239 := by
  native_decide

/-- Coefficient term 240 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0240 : Poly :=
[
  term ((-2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (7, 1), (13, 1), (14, 1)]
]

/-- Partial product 240 for generator 5. -/
def ep_Q2_024_partial_05_0240 : Poly :=
[
  term ((-2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (4, 1), (7, 1), (13, 1), (14, 1)],
  term ((-2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (4, 1), (7, 1), (13, 1), (14, 1)],
  term ((2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (7, 1), (13, 1), (14, 1), (15, 2)],
  term ((2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (7, 1), (13, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 240 for generator 5. -/
theorem ep_Q2_024_partial_05_0240_valid :
    mulPoly ep_Q2_024_coefficient_05_0240
        ep_Q2_024_generator_05_0200_0299 =
      ep_Q2_024_partial_05_0240 := by
  native_decide

/-- Coefficient term 241 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0241 : Poly :=
[
  term ((-168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(4, 1), (7, 1), (14, 1), (15, 1)]
]

/-- Partial product 241 for generator 5. -/
def ep_Q2_024_partial_05_0241 : Poly :=
[
  term ((-168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(2, 2), (4, 1), (7, 1), (14, 1), (15, 1)],
  term ((-168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 2), (4, 1), (7, 1), (14, 1), (15, 1)],
  term ((168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(4, 1), (7, 1), (14, 1), (15, 3)],
  term ((168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(4, 1), (7, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 241 for generator 5. -/
theorem ep_Q2_024_partial_05_0241_valid :
    mulPoly ep_Q2_024_coefficient_05_0241
        ep_Q2_024_generator_05_0200_0299 =
      ep_Q2_024_partial_05_0241 := by
  native_decide

/-- Coefficient term 242 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0242 : Poly :=
[
  term ((-416983870520476 : Rat) / 1162780221153193) [(4, 1), (7, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 242 for generator 5. -/
def ep_Q2_024_partial_05_0242 : Poly :=
[
  term ((-416983870520476 : Rat) / 1162780221153193) [(2, 2), (4, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-416983870520476 : Rat) / 1162780221153193) [(3, 2), (4, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((416983870520476 : Rat) / 1162780221153193) [(4, 1), (7, 1), (14, 1), (15, 3), (16, 1)],
  term ((416983870520476 : Rat) / 1162780221153193) [(4, 1), (7, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 242 for generator 5. -/
theorem ep_Q2_024_partial_05_0242_valid :
    mulPoly ep_Q2_024_coefficient_05_0242
        ep_Q2_024_generator_05_0200_0299 =
      ep_Q2_024_partial_05_0242 := by
  native_decide

/-- Coefficient term 243 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0243 : Poly :=
[
  term ((29469476512772711839687201219835898272519754682615684141 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(4, 1), (7, 1), (15, 1)]
]

/-- Partial product 243 for generator 5. -/
def ep_Q2_024_partial_05_0243 : Poly :=
[
  term ((29469476512772711839687201219835898272519754682615684141 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(2, 2), (4, 1), (7, 1), (15, 1)],
  term ((29469476512772711839687201219835898272519754682615684141 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(3, 2), (4, 1), (7, 1), (15, 1)],
  term ((-29469476512772711839687201219835898272519754682615684141 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(4, 1), (7, 1), (14, 2), (15, 1)],
  term ((-29469476512772711839687201219835898272519754682615684141 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(4, 1), (7, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 243 for generator 5. -/
theorem ep_Q2_024_partial_05_0243_valid :
    mulPoly ep_Q2_024_coefficient_05_0243
        ep_Q2_024_generator_05_0200_0299 =
      ep_Q2_024_partial_05_0243 := by
  native_decide

/-- Coefficient term 244 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0244 : Poly :=
[
  term ((-2336587756741262 : Rat) / 1162780221153193) [(4, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 244 for generator 5. -/
def ep_Q2_024_partial_05_0244 : Poly :=
[
  term ((-2336587756741262 : Rat) / 1162780221153193) [(2, 2), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((-2336587756741262 : Rat) / 1162780221153193) [(3, 2), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((2336587756741262 : Rat) / 1162780221153193) [(4, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((2336587756741262 : Rat) / 1162780221153193) [(4, 1), (7, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 244 for generator 5. -/
theorem ep_Q2_024_partial_05_0244_valid :
    mulPoly ep_Q2_024_coefficient_05_0244
        ep_Q2_024_generator_05_0200_0299 =
      ep_Q2_024_partial_05_0244 := by
  native_decide

/-- Coefficient term 245 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0245 : Poly :=
[
  term ((732537308678412778282669871950328022754 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (8, 1)]
]

/-- Partial product 245 for generator 5. -/
def ep_Q2_024_partial_05_0245 : Poly :=
[
  term ((732537308678412778282669871950328022754 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (4, 1), (8, 1)],
  term ((732537308678412778282669871950328022754 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (4, 1), (8, 1)],
  term ((-732537308678412778282669871950328022754 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (8, 1), (14, 2)],
  term ((-732537308678412778282669871950328022754 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (8, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 245 for generator 5. -/
theorem ep_Q2_024_partial_05_0245_valid :
    mulPoly ep_Q2_024_coefficient_05_0245
        ep_Q2_024_generator_05_0200_0299 =
      ep_Q2_024_partial_05_0245 := by
  native_decide

/-- Coefficient term 246 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0246 : Poly :=
[
  term ((-379943144957262949503842745542488627072 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (9, 1), (12, 1), (13, 1)]
]

/-- Partial product 246 for generator 5. -/
def ep_Q2_024_partial_05_0246 : Poly :=
[
  term ((-379943144957262949503842745542488627072 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (4, 1), (9, 1), (12, 1), (13, 1)],
  term ((-379943144957262949503842745542488627072 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (4, 1), (9, 1), (12, 1), (13, 1)],
  term ((379943144957262949503842745542488627072 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (9, 1), (12, 1), (13, 1), (14, 2)],
  term ((379943144957262949503842745542488627072 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (9, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 246 for generator 5. -/
theorem ep_Q2_024_partial_05_0246_valid :
    mulPoly ep_Q2_024_coefficient_05_0246
        ep_Q2_024_generator_05_0200_0299 =
      ep_Q2_024_partial_05_0246 := by
  native_decide

/-- Coefficient term 247 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0247 : Poly :=
[
  term ((10672513037086450550509020441075862815340689789757733636 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (9, 1), (12, 1), (15, 1)]
]

/-- Partial product 247 for generator 5. -/
def ep_Q2_024_partial_05_0247 : Poly :=
[
  term ((10672513037086450550509020441075862815340689789757733636 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 2), (4, 1), (9, 1), (12, 1), (15, 1)],
  term ((10672513037086450550509020441075862815340689789757733636 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 2), (4, 1), (9, 1), (12, 1), (15, 1)],
  term ((-10672513037086450550509020441075862815340689789757733636 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (9, 1), (12, 1), (14, 2), (15, 1)],
  term ((-10672513037086450550509020441075862815340689789757733636 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (9, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 247 for generator 5. -/
theorem ep_Q2_024_partial_05_0247_valid :
    mulPoly ep_Q2_024_coefficient_05_0247
        ep_Q2_024_generator_05_0200_0299 =
      ep_Q2_024_partial_05_0247 := by
  native_decide

/-- Coefficient term 248 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0248 : Poly :=
[
  term ((-3864655997676720 : Rat) / 1162780221153193) [(4, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 248 for generator 5. -/
def ep_Q2_024_partial_05_0248 : Poly :=
[
  term ((-3864655997676720 : Rat) / 1162780221153193) [(2, 2), (4, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3864655997676720 : Rat) / 1162780221153193) [(3, 2), (4, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((3864655997676720 : Rat) / 1162780221153193) [(4, 1), (9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((3864655997676720 : Rat) / 1162780221153193) [(4, 1), (9, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 248 for generator 5. -/
theorem ep_Q2_024_partial_05_0248_valid :
    mulPoly ep_Q2_024_coefficient_05_0248
        ep_Q2_024_generator_05_0200_0299 =
      ep_Q2_024_partial_05_0248 := by
  native_decide

/-- Coefficient term 249 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0249 : Poly :=
[
  term ((-13326027153172854450637112482178104304 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (9, 1), (13, 1)]
]

/-- Partial product 249 for generator 5. -/
def ep_Q2_024_partial_05_0249 : Poly :=
[
  term ((-13326027153172854450637112482178104304 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (4, 1), (9, 1), (13, 1)],
  term ((-13326027153172854450637112482178104304 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (4, 1), (9, 1), (13, 1)],
  term ((13326027153172854450637112482178104304 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (9, 1), (13, 1), (14, 2)],
  term ((13326027153172854450637112482178104304 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (9, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 249 for generator 5. -/
theorem ep_Q2_024_partial_05_0249_valid :
    mulPoly ep_Q2_024_coefficient_05_0249
        ep_Q2_024_generator_05_0200_0299 =
      ep_Q2_024_partial_05_0249 := by
  native_decide

/-- Coefficient term 250 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0250 : Poly :=
[
  term ((-4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (9, 1), (13, 1), (14, 1)]
]

/-- Partial product 250 for generator 5. -/
def ep_Q2_024_partial_05_0250 : Poly :=
[
  term ((-4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (4, 1), (9, 1), (13, 1), (14, 1)],
  term ((-4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (4, 1), (9, 1), (13, 1), (14, 1)],
  term ((4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (9, 1), (13, 1), (14, 1), (15, 2)],
  term ((4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (9, 1), (13, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 250 for generator 5. -/
theorem ep_Q2_024_partial_05_0250_valid :
    mulPoly ep_Q2_024_coefficient_05_0250
        ep_Q2_024_generator_05_0200_0299 =
      ep_Q2_024_partial_05_0250 := by
  native_decide

/-- Coefficient term 251 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0251 : Poly :=
[
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(4, 1), (9, 1), (14, 1), (15, 1)]
]

/-- Partial product 251 for generator 5. -/
def ep_Q2_024_partial_05_0251 : Poly :=
[
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(2, 2), (4, 1), (9, 1), (14, 1), (15, 1)],
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 2), (4, 1), (9, 1), (14, 1), (15, 1)],
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(4, 1), (9, 1), (14, 1), (15, 3)],
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(4, 1), (9, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 251 for generator 5. -/
theorem ep_Q2_024_partial_05_0251_valid :
    mulPoly ep_Q2_024_coefficient_05_0251
        ep_Q2_024_generator_05_0200_0299 =
      ep_Q2_024_partial_05_0251 := by
  native_decide

/-- Coefficient term 252 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0252 : Poly :=
[
  term ((-833967741040952 : Rat) / 1162780221153193) [(4, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 252 for generator 5. -/
def ep_Q2_024_partial_05_0252 : Poly :=
[
  term ((-833967741040952 : Rat) / 1162780221153193) [(2, 2), (4, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-833967741040952 : Rat) / 1162780221153193) [(3, 2), (4, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((833967741040952 : Rat) / 1162780221153193) [(4, 1), (9, 1), (14, 1), (15, 3), (16, 1)],
  term ((833967741040952 : Rat) / 1162780221153193) [(4, 1), (9, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 252 for generator 5. -/
theorem ep_Q2_024_partial_05_0252_valid :
    mulPoly ep_Q2_024_coefficient_05_0252
        ep_Q2_024_generator_05_0200_0299 =
      ep_Q2_024_partial_05_0252 := by
  native_decide

/-- Coefficient term 253 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0253 : Poly :=
[
  term ((-10823665347390105096389390636919670678420376652206031682 : Rat) / 418499528459408918327148043876319653860305890461357621) [(4, 1), (9, 1), (15, 1)]
]

/-- Partial product 253 for generator 5. -/
def ep_Q2_024_partial_05_0253 : Poly :=
[
  term ((-10823665347390105096389390636919670678420376652206031682 : Rat) / 418499528459408918327148043876319653860305890461357621) [(2, 2), (4, 1), (9, 1), (15, 1)],
  term ((-10823665347390105096389390636919670678420376652206031682 : Rat) / 418499528459408918327148043876319653860305890461357621) [(3, 2), (4, 1), (9, 1), (15, 1)],
  term ((10823665347390105096389390636919670678420376652206031682 : Rat) / 418499528459408918327148043876319653860305890461357621) [(4, 1), (9, 1), (14, 2), (15, 1)],
  term ((10823665347390105096389390636919670678420376652206031682 : Rat) / 418499528459408918327148043876319653860305890461357621) [(4, 1), (9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 253 for generator 5. -/
theorem ep_Q2_024_partial_05_0253_valid :
    mulPoly ep_Q2_024_coefficient_05_0253
        ep_Q2_024_generator_05_0200_0299 =
      ep_Q2_024_partial_05_0253 := by
  native_decide

/-- Coefficient term 254 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0254 : Poly :=
[
  term ((4762912923524824 : Rat) / 1162780221153193) [(4, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 254 for generator 5. -/
def ep_Q2_024_partial_05_0254 : Poly :=
[
  term ((4762912923524824 : Rat) / 1162780221153193) [(2, 2), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((4762912923524824 : Rat) / 1162780221153193) [(3, 2), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((-4762912923524824 : Rat) / 1162780221153193) [(4, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-4762912923524824 : Rat) / 1162780221153193) [(4, 1), (9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 254 for generator 5. -/
theorem ep_Q2_024_partial_05_0254_valid :
    mulPoly ep_Q2_024_coefficient_05_0254
        ep_Q2_024_generator_05_0200_0299 =
      ep_Q2_024_partial_05_0254 := by
  native_decide

/-- Coefficient term 255 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0255 : Poly :=
[
  term ((125213541211545048374964250703804316256 : Rat) / 39990315246749243218889784267651308933) [(4, 1), (9, 2)]
]

/-- Partial product 255 for generator 5. -/
def ep_Q2_024_partial_05_0255 : Poly :=
[
  term ((125213541211545048374964250703804316256 : Rat) / 39990315246749243218889784267651308933) [(2, 2), (4, 1), (9, 2)],
  term ((125213541211545048374964250703804316256 : Rat) / 39990315246749243218889784267651308933) [(3, 2), (4, 1), (9, 2)],
  term ((-125213541211545048374964250703804316256 : Rat) / 39990315246749243218889784267651308933) [(4, 1), (9, 2), (14, 2)],
  term ((-125213541211545048374964250703804316256 : Rat) / 39990315246749243218889784267651308933) [(4, 1), (9, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 255 for generator 5. -/
theorem ep_Q2_024_partial_05_0255_valid :
    mulPoly ep_Q2_024_coefficient_05_0255
        ep_Q2_024_generator_05_0200_0299 =
      ep_Q2_024_partial_05_0255 := by
  native_decide

/-- Coefficient term 256 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0256 : Poly :=
[
  term ((1060843780828011690178037117696406736 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (11, 1), (13, 1)]
]

/-- Partial product 256 for generator 5. -/
def ep_Q2_024_partial_05_0256 : Poly :=
[
  term ((1060843780828011690178037117696406736 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (4, 1), (11, 1), (13, 1)],
  term ((1060843780828011690178037117696406736 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (4, 1), (11, 1), (13, 1)],
  term ((-1060843780828011690178037117696406736 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (11, 1), (13, 1), (14, 2)],
  term ((-1060843780828011690178037117696406736 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 256 for generator 5. -/
theorem ep_Q2_024_partial_05_0256_valid :
    mulPoly ep_Q2_024_coefficient_05_0256
        ep_Q2_024_generator_05_0200_0299 =
      ep_Q2_024_partial_05_0256 := by
  native_decide

/-- Coefficient term 257 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0257 : Poly :=
[
  term ((168614132473848352421619338000873392948252297538773343 : Rat) / 278999685639605945551432029250879769240203926974238414) [(4, 1), (11, 1), (15, 1)]
]

/-- Partial product 257 for generator 5. -/
def ep_Q2_024_partial_05_0257 : Poly :=
[
  term ((168614132473848352421619338000873392948252297538773343 : Rat) / 278999685639605945551432029250879769240203926974238414) [(2, 2), (4, 1), (11, 1), (15, 1)],
  term ((168614132473848352421619338000873392948252297538773343 : Rat) / 278999685639605945551432029250879769240203926974238414) [(3, 2), (4, 1), (11, 1), (15, 1)],
  term ((-168614132473848352421619338000873392948252297538773343 : Rat) / 278999685639605945551432029250879769240203926974238414) [(4, 1), (11, 1), (14, 2), (15, 1)],
  term ((-168614132473848352421619338000873392948252297538773343 : Rat) / 278999685639605945551432029250879769240203926974238414) [(4, 1), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 257 for generator 5. -/
theorem ep_Q2_024_partial_05_0257_valid :
    mulPoly ep_Q2_024_coefficient_05_0257
        ep_Q2_024_generator_05_0200_0299 =
      ep_Q2_024_partial_05_0257 := by
  native_decide

/-- Coefficient term 258 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0258 : Poly :=
[
  term ((208491935260238 : Rat) / 1162780221153193) [(4, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 258 for generator 5. -/
def ep_Q2_024_partial_05_0258 : Poly :=
[
  term ((208491935260238 : Rat) / 1162780221153193) [(2, 2), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((208491935260238 : Rat) / 1162780221153193) [(3, 2), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((-208491935260238 : Rat) / 1162780221153193) [(4, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-208491935260238 : Rat) / 1162780221153193) [(4, 1), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 258 for generator 5. -/
theorem ep_Q2_024_partial_05_0258_valid :
    mulPoly ep_Q2_024_coefficient_05_0258
        ep_Q2_024_generator_05_0200_0299 =
      ep_Q2_024_partial_05_0258 := by
  native_decide

/-- Coefficient term 259 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0259 : Poly :=
[
  term ((148291692041254964032845845511251282866 : Rat) / 119970945740247729656669352802953926799) [(4, 1), (12, 1)]
]

/-- Partial product 259 for generator 5. -/
def ep_Q2_024_partial_05_0259 : Poly :=
[
  term ((148291692041254964032845845511251282866 : Rat) / 119970945740247729656669352802953926799) [(2, 2), (4, 1), (12, 1)],
  term ((148291692041254964032845845511251282866 : Rat) / 119970945740247729656669352802953926799) [(3, 2), (4, 1), (12, 1)],
  term ((-148291692041254964032845845511251282866 : Rat) / 119970945740247729656669352802953926799) [(4, 1), (12, 1), (14, 2)],
  term ((-148291692041254964032845845511251282866 : Rat) / 119970945740247729656669352802953926799) [(4, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 259 for generator 5. -/
theorem ep_Q2_024_partial_05_0259_valid :
    mulPoly ep_Q2_024_coefficient_05_0259
        ep_Q2_024_generator_05_0200_0299 =
      ep_Q2_024_partial_05_0259 := by
  native_decide

/-- Coefficient term 260 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0260 : Poly :=
[
  term ((-10309544944822748557611889928110861240220236337789184721 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(4, 1), (13, 1), (15, 1)]
]

/-- Partial product 260 for generator 5. -/
def ep_Q2_024_partial_05_0260 : Poly :=
[
  term ((-10309544944822748557611889928110861240220236337789184721 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(2, 2), (4, 1), (13, 1), (15, 1)],
  term ((-10309544944822748557611889928110861240220236337789184721 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(3, 2), (4, 1), (13, 1), (15, 1)],
  term ((10309544944822748557611889928110861240220236337789184721 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(4, 1), (13, 1), (14, 2), (15, 1)],
  term ((10309544944822748557611889928110861240220236337789184721 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(4, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 260 for generator 5. -/
theorem ep_Q2_024_partial_05_0260_valid :
    mulPoly ep_Q2_024_coefficient_05_0260
        ep_Q2_024_generator_05_0200_0299 =
      ep_Q2_024_partial_05_0260 := by
  native_decide

/-- Coefficient term 261 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0261 : Poly :=
[
  term ((2669464388918934 : Rat) / 1162780221153193) [(4, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 261 for generator 5. -/
def ep_Q2_024_partial_05_0261 : Poly :=
[
  term ((2669464388918934 : Rat) / 1162780221153193) [(2, 2), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((2669464388918934 : Rat) / 1162780221153193) [(3, 2), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2669464388918934 : Rat) / 1162780221153193) [(4, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-2669464388918934 : Rat) / 1162780221153193) [(4, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 261 for generator 5. -/
theorem ep_Q2_024_partial_05_0261_valid :
    mulPoly ep_Q2_024_coefficient_05_0261
        ep_Q2_024_generator_05_0200_0299 =
      ep_Q2_024_partial_05_0261 := by
  native_decide

/-- Coefficient term 262 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0262 : Poly :=
[
  term ((84655842430810441094993836968011362544 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (13, 2)]
]

/-- Partial product 262 for generator 5. -/
def ep_Q2_024_partial_05_0262 : Poly :=
[
  term ((84655842430810441094993836968011362544 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (4, 1), (13, 2)],
  term ((84655842430810441094993836968011362544 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (4, 1), (13, 2)],
  term ((-84655842430810441094993836968011362544 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (13, 2), (14, 2)],
  term ((-84655842430810441094993836968011362544 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 262 for generator 5. -/
theorem ep_Q2_024_partial_05_0262_valid :
    mulPoly ep_Q2_024_coefficient_05_0262
        ep_Q2_024_generator_05_0200_0299 =
      ep_Q2_024_partial_05_0262 := by
  native_decide

/-- Coefficient term 263 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0263 : Poly :=
[
  term ((-1478456344648618619387678777309548632872 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (14, 1)]
]

/-- Partial product 263 for generator 5. -/
def ep_Q2_024_partial_05_0263 : Poly :=
[
  term ((-1478456344648618619387678777309548632872 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (4, 1), (14, 1)],
  term ((-1478456344648618619387678777309548632872 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (4, 1), (14, 1)],
  term ((1478456344648618619387678777309548632872 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (14, 1), (15, 2)],
  term ((1478456344648618619387678777309548632872 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 263 for generator 5. -/
theorem ep_Q2_024_partial_05_0263_valid :
    mulPoly ep_Q2_024_coefficient_05_0263
        ep_Q2_024_generator_05_0200_0299 =
      ep_Q2_024_partial_05_0263 := by
  native_decide

/-- Coefficient term 264 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0264 : Poly :=
[
  term ((-2147085925815030383357104766528829456826404182975965643 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (15, 2)]
]

/-- Partial product 264 for generator 5. -/
def ep_Q2_024_partial_05_0264 : Poly :=
[
  term ((-2147085925815030383357104766528829456826404182975965643 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 2), (4, 1), (15, 2)],
  term ((-2147085925815030383357104766528829456826404182975965643 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 2), (4, 1), (15, 2)],
  term ((2147085925815030383357104766528829456826404182975965643 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (14, 2), (15, 2)],
  term ((2147085925815030383357104766528829456826404182975965643 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 264 for generator 5. -/
theorem ep_Q2_024_partial_05_0264_valid :
    mulPoly ep_Q2_024_coefficient_05_0264
        ep_Q2_024_generator_05_0200_0299 =
      ep_Q2_024_partial_05_0264 := by
  native_decide

/-- Coefficient term 265 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0265 : Poly :=
[
  term ((584290650991412 : Rat) / 1162780221153193) [(4, 1), (15, 2), (16, 1)]
]

/-- Partial product 265 for generator 5. -/
def ep_Q2_024_partial_05_0265 : Poly :=
[
  term ((584290650991412 : Rat) / 1162780221153193) [(2, 2), (4, 1), (15, 2), (16, 1)],
  term ((584290650991412 : Rat) / 1162780221153193) [(3, 2), (4, 1), (15, 2), (16, 1)],
  term ((-584290650991412 : Rat) / 1162780221153193) [(4, 1), (14, 2), (15, 2), (16, 1)],
  term ((-584290650991412 : Rat) / 1162780221153193) [(4, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 265 for generator 5. -/
theorem ep_Q2_024_partial_05_0265_valid :
    mulPoly ep_Q2_024_coefficient_05_0265
        ep_Q2_024_generator_05_0200_0299 =
      ep_Q2_024_partial_05_0265 := by
  native_decide

/-- Coefficient term 266 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0266 : Poly :=
[
  term ((3835115182457325678732377184857873892259 : Rat) / 1799564186103715944850040292044308901985) [(5, 1), (7, 1)]
]

/-- Partial product 266 for generator 5. -/
def ep_Q2_024_partial_05_0266 : Poly :=
[
  term ((3835115182457325678732377184857873892259 : Rat) / 1799564186103715944850040292044308901985) [(2, 2), (5, 1), (7, 1)],
  term ((3835115182457325678732377184857873892259 : Rat) / 1799564186103715944850040292044308901985) [(3, 2), (5, 1), (7, 1)],
  term ((-3835115182457325678732377184857873892259 : Rat) / 1799564186103715944850040292044308901985) [(5, 1), (7, 1), (14, 2)],
  term ((-3835115182457325678732377184857873892259 : Rat) / 1799564186103715944850040292044308901985) [(5, 1), (7, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 266 for generator 5. -/
theorem ep_Q2_024_partial_05_0266_valid :
    mulPoly ep_Q2_024_coefficient_05_0266
        ep_Q2_024_generator_05_0200_0299 =
      ep_Q2_024_partial_05_0266 := by
  native_decide

/-- Coefficient term 267 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0267 : Poly :=
[
  term ((31193122130146647550698511492541970888 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (7, 1), (9, 1), (13, 1)]
]

/-- Partial product 267 for generator 5. -/
def ep_Q2_024_partial_05_0267 : Poly :=
[
  term ((31193122130146647550698511492541970888 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (5, 1), (7, 1), (9, 1), (13, 1)],
  term ((31193122130146647550698511492541970888 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (5, 1), (7, 1), (9, 1), (13, 1)],
  term ((-31193122130146647550698511492541970888 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (7, 1), (9, 1), (13, 1), (14, 2)],
  term ((-31193122130146647550698511492541970888 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (7, 1), (9, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 267 for generator 5. -/
theorem ep_Q2_024_partial_05_0267_valid :
    mulPoly ep_Q2_024_coefficient_05_0267
        ep_Q2_024_generator_05_0200_0299 =
      ep_Q2_024_partial_05_0267 := by
  native_decide

/-- Coefficient term 268 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0268 : Poly :=
[
  term ((-1208891180766952900908632937625319963868143041788647936 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (7, 1), (9, 1), (15, 1)]
]

/-- Partial product 268 for generator 5. -/
def ep_Q2_024_partial_05_0268 : Poly :=
[
  term ((-1208891180766952900908632937625319963868143041788647936 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 2), (5, 1), (7, 1), (9, 1), (15, 1)],
  term ((-1208891180766952900908632937625319963868143041788647936 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 2), (5, 1), (7, 1), (9, 1), (15, 1)],
  term ((1208891180766952900908632937625319963868143041788647936 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (7, 1), (9, 1), (14, 2), (15, 1)],
  term ((1208891180766952900908632937625319963868143041788647936 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (7, 1), (9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 268 for generator 5. -/
theorem ep_Q2_024_partial_05_0268_valid :
    mulPoly ep_Q2_024_coefficient_05_0268
        ep_Q2_024_generator_05_0200_0299 =
      ep_Q2_024_partial_05_0268 := by
  native_decide

/-- Coefficient term 269 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0269 : Poly :=
[
  term ((-3160383784879872 : Rat) / 1162780221153193) [(5, 1), (7, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 269 for generator 5. -/
def ep_Q2_024_partial_05_0269 : Poly :=
[
  term ((-3160383784879872 : Rat) / 1162780221153193) [(2, 2), (5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-3160383784879872 : Rat) / 1162780221153193) [(3, 2), (5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((3160383784879872 : Rat) / 1162780221153193) [(5, 1), (7, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((3160383784879872 : Rat) / 1162780221153193) [(5, 1), (7, 1), (9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 269 for generator 5. -/
theorem ep_Q2_024_partial_05_0269_valid :
    mulPoly ep_Q2_024_coefficient_05_0269
        ep_Q2_024_generator_05_0200_0299 =
      ep_Q2_024_partial_05_0269 := by
  native_decide

/-- Coefficient term 270 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0270 : Poly :=
[
  term ((106403221006853429260105512033760078472 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (7, 1), (9, 2)]
]

/-- Partial product 270 for generator 5. -/
def ep_Q2_024_partial_05_0270 : Poly :=
[
  term ((106403221006853429260105512033760078472 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (5, 1), (7, 1), (9, 2)],
  term ((106403221006853429260105512033760078472 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (5, 1), (7, 1), (9, 2)],
  term ((-106403221006853429260105512033760078472 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (7, 1), (9, 2), (14, 2)],
  term ((-106403221006853429260105512033760078472 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (7, 1), (9, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 270 for generator 5. -/
theorem ep_Q2_024_partial_05_0270_valid :
    mulPoly ep_Q2_024_coefficient_05_0270
        ep_Q2_024_generator_05_0200_0299 =
      ep_Q2_024_partial_05_0270 := by
  native_decide

/-- Coefficient term 271 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0271 : Poly :=
[
  term ((1338347194939818880675708356377518783224328431776016272 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (7, 1), (13, 1), (15, 1)]
]

/-- Partial product 271 for generator 5. -/
def ep_Q2_024_partial_05_0271 : Poly :=
[
  term ((1338347194939818880675708356377518783224328431776016272 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 2), (5, 1), (7, 1), (13, 1), (15, 1)],
  term ((1338347194939818880675708356377518783224328431776016272 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 2), (5, 1), (7, 1), (13, 1), (15, 1)],
  term ((-1338347194939818880675708356377518783224328431776016272 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (7, 1), (13, 1), (14, 2), (15, 1)],
  term ((-1338347194939818880675708356377518783224328431776016272 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (7, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 271 for generator 5. -/
theorem ep_Q2_024_partial_05_0271_valid :
    mulPoly ep_Q2_024_coefficient_05_0271
        ep_Q2_024_generator_05_0200_0299 =
      ep_Q2_024_partial_05_0271 := by
  native_decide

/-- Coefficient term 272 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0272 : Poly :=
[
  term ((3160383784879872 : Rat) / 1162780221153193) [(5, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 272 for generator 5. -/
def ep_Q2_024_partial_05_0272 : Poly :=
[
  term ((3160383784879872 : Rat) / 1162780221153193) [(2, 2), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((3160383784879872 : Rat) / 1162780221153193) [(3, 2), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3160383784879872 : Rat) / 1162780221153193) [(5, 1), (7, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-3160383784879872 : Rat) / 1162780221153193) [(5, 1), (7, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 272 for generator 5. -/
theorem ep_Q2_024_partial_05_0272_valid :
    mulPoly ep_Q2_024_coefficient_05_0272
        ep_Q2_024_generator_05_0200_0299 =
      ep_Q2_024_partial_05_0272 := by
  native_decide

/-- Coefficient term 273 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0273 : Poly :=
[
  term ((-27519268627400015362160804705260409872 : Rat) / 39990315246749243218889784267651308933) [(5, 1), (7, 1), (13, 2)]
]

/-- Partial product 273 for generator 5. -/
def ep_Q2_024_partial_05_0273 : Poly :=
[
  term ((-27519268627400015362160804705260409872 : Rat) / 39990315246749243218889784267651308933) [(2, 2), (5, 1), (7, 1), (13, 2)],
  term ((-27519268627400015362160804705260409872 : Rat) / 39990315246749243218889784267651308933) [(3, 2), (5, 1), (7, 1), (13, 2)],
  term ((27519268627400015362160804705260409872 : Rat) / 39990315246749243218889784267651308933) [(5, 1), (7, 1), (13, 2), (14, 2)],
  term ((27519268627400015362160804705260409872 : Rat) / 39990315246749243218889784267651308933) [(5, 1), (7, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 273 for generator 5. -/
theorem ep_Q2_024_partial_05_0273_valid :
    mulPoly ep_Q2_024_coefficient_05_0273
        ep_Q2_024_generator_05_0200_0299 =
      ep_Q2_024_partial_05_0273 := by
  native_decide

/-- Coefficient term 274 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0274 : Poly :=
[
  term ((-1086812258876365631714711692878661467835285345215957824 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 1), (7, 1), (15, 2)]
]

/-- Partial product 274 for generator 5. -/
def ep_Q2_024_partial_05_0274 : Poly :=
[
  term ((-1086812258876365631714711692878661467835285345215957824 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 2), (5, 1), (7, 1), (15, 2)],
  term ((-1086812258876365631714711692878661467835285345215957824 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 2), (5, 1), (7, 1), (15, 2)],
  term ((1086812258876365631714711692878661467835285345215957824 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 1), (7, 1), (14, 2), (15, 2)],
  term ((1086812258876365631714711692878661467835285345215957824 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 1), (7, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 274 for generator 5. -/
theorem ep_Q2_024_partial_05_0274_valid :
    mulPoly ep_Q2_024_coefficient_05_0274
        ep_Q2_024_generator_05_0200_0299 =
      ep_Q2_024_partial_05_0274 := by
  native_decide

/-- Coefficient term 275 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0275 : Poly :=
[
  term ((-103470768511616 : Rat) / 1162780221153193) [(5, 1), (7, 1), (15, 2), (16, 1)]
]

/-- Partial product 275 for generator 5. -/
def ep_Q2_024_partial_05_0275 : Poly :=
[
  term ((-103470768511616 : Rat) / 1162780221153193) [(2, 2), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((-103470768511616 : Rat) / 1162780221153193) [(3, 2), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((103470768511616 : Rat) / 1162780221153193) [(5, 1), (7, 1), (14, 2), (15, 2), (16, 1)],
  term ((103470768511616 : Rat) / 1162780221153193) [(5, 1), (7, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 275 for generator 5. -/
theorem ep_Q2_024_partial_05_0275_valid :
    mulPoly ep_Q2_024_coefficient_05_0275
        ep_Q2_024_generator_05_0200_0299 =
      ep_Q2_024_partial_05_0275 := by
  native_decide

/-- Coefficient term 276 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0276 : Poly :=
[
  term ((48138056360456346690791370267159183058 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (8, 1), (9, 1)]
]

/-- Partial product 276 for generator 5. -/
def ep_Q2_024_partial_05_0276 : Poly :=
[
  term ((48138056360456346690791370267159183058 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (5, 1), (8, 1), (9, 1)],
  term ((48138056360456346690791370267159183058 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (5, 1), (8, 1), (9, 1)],
  term ((-48138056360456346690791370267159183058 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (8, 1), (9, 1), (14, 2)],
  term ((-48138056360456346690791370267159183058 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (8, 1), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 276 for generator 5. -/
theorem ep_Q2_024_partial_05_0276_valid :
    mulPoly ep_Q2_024_coefficient_05_0276
        ep_Q2_024_generator_05_0200_0299 =
      ep_Q2_024_partial_05_0276 := by
  native_decide

/-- Coefficient term 277 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0277 : Poly :=
[
  term ((178832029047636332318143270131866820236 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (8, 1), (13, 1)]
]

/-- Partial product 277 for generator 5. -/
def ep_Q2_024_partial_05_0277 : Poly :=
[
  term ((178832029047636332318143270131866820236 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (5, 1), (8, 1), (13, 1)],
  term ((178832029047636332318143270131866820236 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (5, 1), (8, 1), (13, 1)],
  term ((-178832029047636332318143270131866820236 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (8, 1), (13, 1), (14, 2)],
  term ((-178832029047636332318143270131866820236 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (8, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 277 for generator 5. -/
theorem ep_Q2_024_partial_05_0277_valid :
    mulPoly ep_Q2_024_coefficient_05_0277
        ep_Q2_024_generator_05_0200_0299 =
      ep_Q2_024_partial_05_0277 := by
  native_decide

/-- Coefficient term 278 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0278 : Poly :=
[
  term ((-2013352258384651181460743152350227739500255000732759229 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 1), (8, 1), (15, 1)]
]

/-- Partial product 278 for generator 5. -/
def ep_Q2_024_partial_05_0278 : Poly :=
[
  term ((-2013352258384651181460743152350227739500255000732759229 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 2), (5, 1), (8, 1), (15, 1)],
  term ((-2013352258384651181460743152350227739500255000732759229 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 2), (5, 1), (8, 1), (15, 1)],
  term ((2013352258384651181460743152350227739500255000732759229 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 1), (8, 1), (14, 2), (15, 1)],
  term ((2013352258384651181460743152350227739500255000732759229 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 1), (8, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 278 for generator 5. -/
theorem ep_Q2_024_partial_05_0278_valid :
    mulPoly ep_Q2_024_coefficient_05_0278
        ep_Q2_024_generator_05_0200_0299 =
      ep_Q2_024_partial_05_0278 := by
  native_decide

/-- Coefficient term 279 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0279 : Poly :=
[
  term ((-191472562644716 : Rat) / 1162780221153193) [(5, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 279 for generator 5. -/
def ep_Q2_024_partial_05_0279 : Poly :=
[
  term ((-191472562644716 : Rat) / 1162780221153193) [(2, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-191472562644716 : Rat) / 1162780221153193) [(3, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((191472562644716 : Rat) / 1162780221153193) [(5, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((191472562644716 : Rat) / 1162780221153193) [(5, 1), (8, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 279 for generator 5. -/
theorem ep_Q2_024_partial_05_0279_valid :
    mulPoly ep_Q2_024_coefficient_05_0279
        ep_Q2_024_generator_05_0200_0299 =
      ep_Q2_024_partial_05_0279 := by
  native_decide

/-- Coefficient term 280 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0280 : Poly :=
[
  term ((-8945695978403823378185260446717037161 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (9, 1)]
]

/-- Partial product 280 for generator 5. -/
def ep_Q2_024_partial_05_0280 : Poly :=
[
  term ((-8945695978403823378185260446717037161 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (5, 1), (9, 1)],
  term ((-8945695978403823378185260446717037161 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (5, 1), (9, 1)],
  term ((8945695978403823378185260446717037161 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (9, 1), (14, 2)],
  term ((8945695978403823378185260446717037161 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 280 for generator 5. -/
theorem ep_Q2_024_partial_05_0280_valid :
    mulPoly ep_Q2_024_coefficient_05_0280
        ep_Q2_024_generator_05_0200_0299 =
      ep_Q2_024_partial_05_0280 := by
  native_decide

/-- Coefficient term 281 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0281 : Poly :=
[
  term ((-26816557735183032527929146058902134264 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (9, 1), (11, 1), (13, 1)]
]

/-- Partial product 281 for generator 5. -/
def ep_Q2_024_partial_05_0281 : Poly :=
[
  term ((-26816557735183032527929146058902134264 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (5, 1), (9, 1), (11, 1), (13, 1)],
  term ((-26816557735183032527929146058902134264 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (5, 1), (9, 1), (11, 1), (13, 1)],
  term ((26816557735183032527929146058902134264 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (9, 1), (11, 1), (13, 1), (14, 2)],
  term ((26816557735183032527929146058902134264 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (9, 1), (11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 281 for generator 5. -/
theorem ep_Q2_024_partial_05_0281_valid :
    mulPoly ep_Q2_024_coefficient_05_0281
        ep_Q2_024_generator_05_0200_0299 =
      ep_Q2_024_partial_05_0281 := by
  native_decide

/-- Coefficient term 282 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0282 : Poly :=
[
  term ((-181142123956909083033591111950365889858459836126228364 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 1), (9, 1), (11, 1), (15, 1)]
]

/-- Partial product 282 for generator 5. -/
def ep_Q2_024_partial_05_0282 : Poly :=
[
  term ((-181142123956909083033591111950365889858459836126228364 : Rat) / 139499842819802972775716014625439884620101963487119207) [(2, 2), (5, 1), (9, 1), (11, 1), (15, 1)],
  term ((-181142123956909083033591111950365889858459836126228364 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 2), (5, 1), (9, 1), (11, 1), (15, 1)],
  term ((181142123956909083033591111950365889858459836126228364 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 1), (9, 1), (11, 1), (14, 2), (15, 1)],
  term ((181142123956909083033591111950365889858459836126228364 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 1), (9, 1), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 282 for generator 5. -/
theorem ep_Q2_024_partial_05_0282_valid :
    mulPoly ep_Q2_024_coefficient_05_0282
        ep_Q2_024_generator_05_0200_0299 =
      ep_Q2_024_partial_05_0282 := by
  native_decide

/-- Coefficient term 283 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0283 : Poly :=
[
  term ((751294408028112 : Rat) / 1162780221153193) [(5, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 283 for generator 5. -/
def ep_Q2_024_partial_05_0283 : Poly :=
[
  term ((751294408028112 : Rat) / 1162780221153193) [(2, 2), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((751294408028112 : Rat) / 1162780221153193) [(3, 2), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-751294408028112 : Rat) / 1162780221153193) [(5, 1), (9, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-751294408028112 : Rat) / 1162780221153193) [(5, 1), (9, 1), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 283 for generator 5. -/
theorem ep_Q2_024_partial_05_0283_valid :
    mulPoly ep_Q2_024_coefficient_05_0283
        ep_Q2_024_generator_05_0200_0299 =
      ep_Q2_024_partial_05_0283 := by
  native_decide

/-- Coefficient term 284 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0284 : Poly :=
[
  term ((94799603442309507370261672490958217944 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (9, 1), (12, 1)]
]

/-- Partial product 284 for generator 5. -/
def ep_Q2_024_partial_05_0284 : Poly :=
[
  term ((94799603442309507370261672490958217944 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (5, 1), (9, 1), (12, 1)],
  term ((94799603442309507370261672490958217944 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (5, 1), (9, 1), (12, 1)],
  term ((-94799603442309507370261672490958217944 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (9, 1), (12, 1), (14, 2)],
  term ((-94799603442309507370261672490958217944 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (9, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 284 for generator 5. -/
theorem ep_Q2_024_partial_05_0284_valid :
    mulPoly ep_Q2_024_coefficient_05_0284
        ep_Q2_024_generator_05_0200_0299 =
      ep_Q2_024_partial_05_0284 := by
  native_decide

/-- Coefficient term 285 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0285 : Poly :=
[
  term ((16527737784929168061123148869963794329901925980398052713 : Rat) / 557999371279211891102864058501759538480407853948476828) [(5, 1), (9, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 285 for generator 5. -/
def ep_Q2_024_partial_05_0285 : Poly :=
[
  term ((16527737784929168061123148869963794329901925980398052713 : Rat) / 557999371279211891102864058501759538480407853948476828) [(2, 2), (5, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((16527737784929168061123148869963794329901925980398052713 : Rat) / 557999371279211891102864058501759538480407853948476828) [(3, 2), (5, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((-16527737784929168061123148869963794329901925980398052713 : Rat) / 557999371279211891102864058501759538480407853948476828) [(5, 1), (9, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((-16527737784929168061123148869963794329901925980398052713 : Rat) / 557999371279211891102864058501759538480407853948476828) [(5, 1), (9, 1), (12, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 285 for generator 5. -/
theorem ep_Q2_024_partial_05_0285_valid :
    mulPoly ep_Q2_024_coefficient_05_0285
        ep_Q2_024_generator_05_0200_0299 =
      ep_Q2_024_partial_05_0285 := by
  native_decide

/-- Coefficient term 286 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0286 : Poly :=
[
  term ((-4569079916135479 : Rat) / 1162780221153193) [(5, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 286 for generator 5. -/
def ep_Q2_024_partial_05_0286 : Poly :=
[
  term ((-4569079916135479 : Rat) / 1162780221153193) [(2, 2), (5, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4569079916135479 : Rat) / 1162780221153193) [(3, 2), (5, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((4569079916135479 : Rat) / 1162780221153193) [(5, 1), (9, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((4569079916135479 : Rat) / 1162780221153193) [(5, 1), (9, 1), (12, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 286 for generator 5. -/
theorem ep_Q2_024_partial_05_0286_valid :
    mulPoly ep_Q2_024_coefficient_05_0286
        ep_Q2_024_generator_05_0200_0299 =
      ep_Q2_024_partial_05_0286 := by
  native_decide

/-- Coefficient term 287 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0287 : Poly :=
[
  term ((-699598964377024284665984479369490528956 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (9, 1), (12, 1), (13, 2)]
]

/-- Partial product 287 for generator 5. -/
def ep_Q2_024_partial_05_0287 : Poly :=
[
  term ((-699598964377024284665984479369490528956 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (5, 1), (9, 1), (12, 1), (13, 2)],
  term ((-699598964377024284665984479369490528956 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (5, 1), (9, 1), (12, 1), (13, 2)],
  term ((699598964377024284665984479369490528956 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (9, 1), (12, 1), (13, 2), (14, 2)],
  term ((699598964377024284665984479369490528956 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (9, 1), (12, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 287 for generator 5. -/
theorem ep_Q2_024_partial_05_0287_valid :
    mulPoly ep_Q2_024_coefficient_05_0287
        ep_Q2_024_generator_05_0200_0299 =
      ep_Q2_024_partial_05_0287 := by
  native_decide

/-- Coefficient term 288 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0288 : Poly :=
[
  term ((-57065163418514028206963760297560614190626285699065528079 : Rat) / 929998952132019818504773430836265897467346423247461380) [(5, 1), (9, 1), (12, 1), (15, 2)]
]

/-- Partial product 288 for generator 5. -/
def ep_Q2_024_partial_05_0288 : Poly :=
[
  term ((-57065163418514028206963760297560614190626285699065528079 : Rat) / 929998952132019818504773430836265897467346423247461380) [(2, 2), (5, 1), (9, 1), (12, 1), (15, 2)],
  term ((-57065163418514028206963760297560614190626285699065528079 : Rat) / 929998952132019818504773430836265897467346423247461380) [(3, 2), (5, 1), (9, 1), (12, 1), (15, 2)],
  term ((57065163418514028206963760297560614190626285699065528079 : Rat) / 929998952132019818504773430836265897467346423247461380) [(5, 1), (9, 1), (12, 1), (14, 2), (15, 2)],
  term ((57065163418514028206963760297560614190626285699065528079 : Rat) / 929998952132019818504773430836265897467346423247461380) [(5, 1), (9, 1), (12, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 288 for generator 5. -/
theorem ep_Q2_024_partial_05_0288_valid :
    mulPoly ep_Q2_024_coefficient_05_0288
        ep_Q2_024_generator_05_0200_0299 =
      ep_Q2_024_partial_05_0288 := by
  native_decide

/-- Coefficient term 289 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0289 : Poly :=
[
  term ((13204414907240807 : Rat) / 1162780221153193) [(5, 1), (9, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 289 for generator 5. -/
def ep_Q2_024_partial_05_0289 : Poly :=
[
  term ((13204414907240807 : Rat) / 1162780221153193) [(2, 2), (5, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((13204414907240807 : Rat) / 1162780221153193) [(3, 2), (5, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-13204414907240807 : Rat) / 1162780221153193) [(5, 1), (9, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((-13204414907240807 : Rat) / 1162780221153193) [(5, 1), (9, 1), (12, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 289 for generator 5. -/
theorem ep_Q2_024_partial_05_0289_valid :
    mulPoly ep_Q2_024_coefficient_05_0289
        ep_Q2_024_generator_05_0200_0299 =
      ep_Q2_024_partial_05_0289 := by
  native_decide

/-- Coefficient term 290 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0290 : Poly :=
[
  term ((1681207212074162784866544631513075229980270038215301238 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (9, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 290 for generator 5. -/
def ep_Q2_024_partial_05_0290 : Poly :=
[
  term ((1681207212074162784866544631513075229980270038215301238 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 2), (5, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((1681207212074162784866544631513075229980270038215301238 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 2), (5, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((-1681207212074162784866544631513075229980270038215301238 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (9, 1), (13, 1), (14, 1), (15, 3)],
  term ((-1681207212074162784866544631513075229980270038215301238 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (9, 1), (13, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 290 for generator 5. -/
theorem ep_Q2_024_partial_05_0290_valid :
    mulPoly ep_Q2_024_coefficient_05_0290
        ep_Q2_024_generator_05_0200_0299 =
      ep_Q2_024_partial_05_0290 := by
  native_decide

/-- Coefficient term 291 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0291 : Poly :=
[
  term ((833967741040952 : Rat) / 1162780221153193) [(5, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 291 for generator 5. -/
def ep_Q2_024_partial_05_0291 : Poly :=
[
  term ((833967741040952 : Rat) / 1162780221153193) [(2, 2), (5, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((833967741040952 : Rat) / 1162780221153193) [(3, 2), (5, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-833967741040952 : Rat) / 1162780221153193) [(5, 1), (9, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-833967741040952 : Rat) / 1162780221153193) [(5, 1), (9, 1), (13, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 291 for generator 5. -/
theorem ep_Q2_024_partial_05_0291_valid :
    mulPoly ep_Q2_024_coefficient_05_0291
        ep_Q2_024_generator_05_0200_0299 =
      ep_Q2_024_partial_05_0291 := by
  native_decide

/-- Coefficient term 292 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0292 : Poly :=
[
  term ((-2578326853107933456558538464757287301318301626202703904507 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(5, 1), (9, 1), (13, 1), (15, 1)]
]

/-- Partial product 292 for generator 5. -/
def ep_Q2_024_partial_05_0292 : Poly :=
[
  term ((-2578326853107933456558538464757287301318301626202703904507 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(2, 2), (5, 1), (9, 1), (13, 1), (15, 1)],
  term ((-2578326853107933456558538464757287301318301626202703904507 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(3, 2), (5, 1), (9, 1), (13, 1), (15, 1)],
  term ((2578326853107933456558538464757287301318301626202703904507 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(5, 1), (9, 1), (13, 1), (14, 2), (15, 1)],
  term ((2578326853107933456558538464757287301318301626202703904507 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(5, 1), (9, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 292 for generator 5. -/
theorem ep_Q2_024_partial_05_0292_valid :
    mulPoly ep_Q2_024_coefficient_05_0292
        ep_Q2_024_generator_05_0200_0299 =
      ep_Q2_024_partial_05_0292 := by
  native_decide

/-- Coefficient term 293 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0293 : Poly :=
[
  term ((-50068166157171823 : Rat) / 6976681326919158) [(5, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 293 for generator 5. -/
def ep_Q2_024_partial_05_0293 : Poly :=
[
  term ((-50068166157171823 : Rat) / 6976681326919158) [(2, 2), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-50068166157171823 : Rat) / 6976681326919158) [(3, 2), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((50068166157171823 : Rat) / 6976681326919158) [(5, 1), (9, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((50068166157171823 : Rat) / 6976681326919158) [(5, 1), (9, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 293 for generator 5. -/
theorem ep_Q2_024_partial_05_0293_valid :
    mulPoly ep_Q2_024_coefficient_05_0293
        ep_Q2_024_generator_05_0200_0299 =
      ep_Q2_024_partial_05_0293 := by
  native_decide

/-- Coefficient term 294 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0294 : Poly :=
[
  term ((147847046676439604201330883678806456320 : Rat) / 359912837220743188970008058408861780397) [(5, 1), (9, 1), (13, 2)]
]

/-- Partial product 294 for generator 5. -/
def ep_Q2_024_partial_05_0294 : Poly :=
[
  term ((147847046676439604201330883678806456320 : Rat) / 359912837220743188970008058408861780397) [(2, 2), (5, 1), (9, 1), (13, 2)],
  term ((147847046676439604201330883678806456320 : Rat) / 359912837220743188970008058408861780397) [(3, 2), (5, 1), (9, 1), (13, 2)],
  term ((-147847046676439604201330883678806456320 : Rat) / 359912837220743188970008058408861780397) [(5, 1), (9, 1), (13, 2), (14, 2)],
  term ((-147847046676439604201330883678806456320 : Rat) / 359912837220743188970008058408861780397) [(5, 1), (9, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 294 for generator 5. -/
theorem ep_Q2_024_partial_05_0294_valid :
    mulPoly ep_Q2_024_coefficient_05_0294
        ep_Q2_024_generator_05_0200_0299 =
      ep_Q2_024_partial_05_0294 := by
  native_decide

/-- Coefficient term 295 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0295 : Poly :=
[
  term ((4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (9, 1), (13, 2), (14, 1)]
]

/-- Partial product 295 for generator 5. -/
def ep_Q2_024_partial_05_0295 : Poly :=
[
  term ((4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (5, 1), (9, 1), (13, 2), (14, 1)],
  term ((4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (5, 1), (9, 1), (13, 2), (14, 1)],
  term ((-4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (9, 1), (13, 2), (14, 1), (15, 2)],
  term ((-4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (9, 1), (13, 2), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 295 for generator 5. -/
theorem ep_Q2_024_partial_05_0295_valid :
    mulPoly ep_Q2_024_coefficient_05_0295
        ep_Q2_024_generator_05_0200_0299 =
      ep_Q2_024_partial_05_0295 := by
  native_decide

/-- Coefficient term 296 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0296 : Poly :=
[
  term ((26763454583586125644678066817785174728 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (9, 1), (14, 1)]
]

/-- Partial product 296 for generator 5. -/
def ep_Q2_024_partial_05_0296 : Poly :=
[
  term ((26763454583586125644678066817785174728 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (5, 1), (9, 1), (14, 1)],
  term ((26763454583586125644678066817785174728 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (5, 1), (9, 1), (14, 1)],
  term ((-26763454583586125644678066817785174728 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (9, 1), (14, 1), (15, 2)],
  term ((-26763454583586125644678066817785174728 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (9, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 296 for generator 5. -/
theorem ep_Q2_024_partial_05_0296_valid :
    mulPoly ep_Q2_024_coefficient_05_0296
        ep_Q2_024_generator_05_0200_0299 =
      ep_Q2_024_partial_05_0296 := by
  native_decide

/-- Coefficient term 297 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0297 : Poly :=
[
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 1), (9, 1), (14, 1), (15, 2)]
]

/-- Partial product 297 for generator 5. -/
def ep_Q2_024_partial_05_0297 : Poly :=
[
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(2, 2), (5, 1), (9, 1), (14, 1), (15, 2)],
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 2), (5, 1), (9, 1), (14, 1), (15, 2)],
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 1), (9, 1), (14, 1), (15, 4)],
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 1), (9, 1), (14, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 297 for generator 5. -/
theorem ep_Q2_024_partial_05_0297_valid :
    mulPoly ep_Q2_024_coefficient_05_0297
        ep_Q2_024_generator_05_0200_0299 =
      ep_Q2_024_partial_05_0297 := by
  native_decide

/-- Coefficient term 298 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0298 : Poly :=
[
  term ((-833967741040952 : Rat) / 1162780221153193) [(5, 1), (9, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 298 for generator 5. -/
def ep_Q2_024_partial_05_0298 : Poly :=
[
  term ((-833967741040952 : Rat) / 1162780221153193) [(2, 2), (5, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-833967741040952 : Rat) / 1162780221153193) [(3, 2), (5, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((833967741040952 : Rat) / 1162780221153193) [(5, 1), (9, 1), (14, 1), (15, 4), (16, 1)],
  term ((833967741040952 : Rat) / 1162780221153193) [(5, 1), (9, 1), (14, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 298 for generator 5. -/
theorem ep_Q2_024_partial_05_0298_valid :
    mulPoly ep_Q2_024_coefficient_05_0298
        ep_Q2_024_generator_05_0200_0299 =
      ep_Q2_024_partial_05_0298 := by
  native_decide

/-- Coefficient term 299 from coefficient polynomial 5. -/
def ep_Q2_024_coefficient_05_0299 : Poly :=
[
  term ((596292272370210102731177090662239802901212841340772628921 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(5, 1), (9, 1), (15, 2)]
]

/-- Partial product 299 for generator 5. -/
def ep_Q2_024_partial_05_0299 : Poly :=
[
  term ((596292272370210102731177090662239802901212841340772628921 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(2, 2), (5, 1), (9, 1), (15, 2)],
  term ((596292272370210102731177090662239802901212841340772628921 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(3, 2), (5, 1), (9, 1), (15, 2)],
  term ((-596292272370210102731177090662239802901212841340772628921 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(5, 1), (9, 1), (14, 2), (15, 2)],
  term ((-596292272370210102731177090662239802901212841340772628921 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(5, 1), (9, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 299 for generator 5. -/
theorem ep_Q2_024_partial_05_0299_valid :
    mulPoly ep_Q2_024_coefficient_05_0299
        ep_Q2_024_generator_05_0200_0299 =
      ep_Q2_024_partial_05_0299 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_024_partials_05_0200_0299 : List Poly :=
[
  ep_Q2_024_partial_05_0200,
  ep_Q2_024_partial_05_0201,
  ep_Q2_024_partial_05_0202,
  ep_Q2_024_partial_05_0203,
  ep_Q2_024_partial_05_0204,
  ep_Q2_024_partial_05_0205,
  ep_Q2_024_partial_05_0206,
  ep_Q2_024_partial_05_0207,
  ep_Q2_024_partial_05_0208,
  ep_Q2_024_partial_05_0209,
  ep_Q2_024_partial_05_0210,
  ep_Q2_024_partial_05_0211,
  ep_Q2_024_partial_05_0212,
  ep_Q2_024_partial_05_0213,
  ep_Q2_024_partial_05_0214,
  ep_Q2_024_partial_05_0215,
  ep_Q2_024_partial_05_0216,
  ep_Q2_024_partial_05_0217,
  ep_Q2_024_partial_05_0218,
  ep_Q2_024_partial_05_0219,
  ep_Q2_024_partial_05_0220,
  ep_Q2_024_partial_05_0221,
  ep_Q2_024_partial_05_0222,
  ep_Q2_024_partial_05_0223,
  ep_Q2_024_partial_05_0224,
  ep_Q2_024_partial_05_0225,
  ep_Q2_024_partial_05_0226,
  ep_Q2_024_partial_05_0227,
  ep_Q2_024_partial_05_0228,
  ep_Q2_024_partial_05_0229,
  ep_Q2_024_partial_05_0230,
  ep_Q2_024_partial_05_0231,
  ep_Q2_024_partial_05_0232,
  ep_Q2_024_partial_05_0233,
  ep_Q2_024_partial_05_0234,
  ep_Q2_024_partial_05_0235,
  ep_Q2_024_partial_05_0236,
  ep_Q2_024_partial_05_0237,
  ep_Q2_024_partial_05_0238,
  ep_Q2_024_partial_05_0239,
  ep_Q2_024_partial_05_0240,
  ep_Q2_024_partial_05_0241,
  ep_Q2_024_partial_05_0242,
  ep_Q2_024_partial_05_0243,
  ep_Q2_024_partial_05_0244,
  ep_Q2_024_partial_05_0245,
  ep_Q2_024_partial_05_0246,
  ep_Q2_024_partial_05_0247,
  ep_Q2_024_partial_05_0248,
  ep_Q2_024_partial_05_0249,
  ep_Q2_024_partial_05_0250,
  ep_Q2_024_partial_05_0251,
  ep_Q2_024_partial_05_0252,
  ep_Q2_024_partial_05_0253,
  ep_Q2_024_partial_05_0254,
  ep_Q2_024_partial_05_0255,
  ep_Q2_024_partial_05_0256,
  ep_Q2_024_partial_05_0257,
  ep_Q2_024_partial_05_0258,
  ep_Q2_024_partial_05_0259,
  ep_Q2_024_partial_05_0260,
  ep_Q2_024_partial_05_0261,
  ep_Q2_024_partial_05_0262,
  ep_Q2_024_partial_05_0263,
  ep_Q2_024_partial_05_0264,
  ep_Q2_024_partial_05_0265,
  ep_Q2_024_partial_05_0266,
  ep_Q2_024_partial_05_0267,
  ep_Q2_024_partial_05_0268,
  ep_Q2_024_partial_05_0269,
  ep_Q2_024_partial_05_0270,
  ep_Q2_024_partial_05_0271,
  ep_Q2_024_partial_05_0272,
  ep_Q2_024_partial_05_0273,
  ep_Q2_024_partial_05_0274,
  ep_Q2_024_partial_05_0275,
  ep_Q2_024_partial_05_0276,
  ep_Q2_024_partial_05_0277,
  ep_Q2_024_partial_05_0278,
  ep_Q2_024_partial_05_0279,
  ep_Q2_024_partial_05_0280,
  ep_Q2_024_partial_05_0281,
  ep_Q2_024_partial_05_0282,
  ep_Q2_024_partial_05_0283,
  ep_Q2_024_partial_05_0284,
  ep_Q2_024_partial_05_0285,
  ep_Q2_024_partial_05_0286,
  ep_Q2_024_partial_05_0287,
  ep_Q2_024_partial_05_0288,
  ep_Q2_024_partial_05_0289,
  ep_Q2_024_partial_05_0290,
  ep_Q2_024_partial_05_0291,
  ep_Q2_024_partial_05_0292,
  ep_Q2_024_partial_05_0293,
  ep_Q2_024_partial_05_0294,
  ep_Q2_024_partial_05_0295,
  ep_Q2_024_partial_05_0296,
  ep_Q2_024_partial_05_0297,
  ep_Q2_024_partial_05_0298,
  ep_Q2_024_partial_05_0299
]

/-- Sum of partial products in this block. -/
def ep_Q2_024_block_05_0200_0299 : Poly :=
[
  term ((-75330592794360 : Rat) / 1162780221153193) [(2, 2), (3, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-40472928056033817116049120031239046672 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (3, 1), (7, 1), (13, 2)],
  term ((-8921151527862041881559355605928391576 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (3, 1), (7, 1), (14, 1)],
  term ((-6871312347005108487180609041771102287064141873321853589 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 2), (3, 1), (7, 1), (15, 2)],
  term ((3198205862530996 : Rat) / 1162780221153193) [(2, 2), (3, 1), (7, 1), (15, 2), (16, 1)],
  term ((1652695128300478652375073904873736949728 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (3, 1), (8, 1), (9, 1)],
  term ((-1417328201287324005548875358914343460668 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (3, 1), (9, 1)],
  term ((211456760502129940609786390150776826244 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (3, 1), (9, 1), (12, 1)],
  term ((-3209257923513847776562869360713708288 : Rat) / 39990315246749243218889784267651308933) [(2, 2), (3, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((550224871676112102035615555952179792604942567145793832 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 2), (3, 1), (9, 1), (12, 1), (15, 2)],
  term ((-1443384088015008 : Rat) / 1162780221153193) [(2, 2), (3, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((43135328846876119407214699700298383881329052598883204313 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(2, 2), (3, 1), (9, 1), (13, 1), (15, 1)],
  term ((-212582817171990 : Rat) / 1162780221153193) [(2, 2), (3, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((32374617250718488653403865302693490632 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (3, 1), (9, 1), (13, 2)],
  term ((1217648963717924911224184363882747984154 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (3, 1), (9, 1), (14, 1)],
  term ((4666118582264079879312520807185554929005944364492589137 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 2), (3, 1), (9, 1), (15, 2)],
  term ((-7791585621739076 : Rat) / 1162780221153193) [(2, 2), (3, 1), (9, 1), (15, 2), (16, 1)],
  term ((-234824404481097668778610925125521767712 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (3, 1), (9, 2), (13, 1)],
  term ((1224510104923201687356037336946774208653866347508271591 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 2), (3, 1), (9, 2), (15, 1)],
  term ((-2242722674317404 : Rat) / 1162780221153193) [(2, 2), (3, 1), (9, 2), (15, 1), (16, 1)],
  term ((-189337596559409838993915431795101263168 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (3, 1), (9, 3)],
  term ((12492472986937566043423911539945286416 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (3, 1), (12, 1), (13, 1)],
  term ((5474663009772140144656526016955689267161795033886933313 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(2, 2), (3, 1), (12, 1), (15, 1)],
  term ((-299904219258166 : Rat) / 1162780221153193) [(2, 2), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((-203545545408235787656366621830933929642 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (3, 1), (13, 1)],
  term ((40423760364518984840150318565767501272 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (3, 1), (13, 1), (14, 1)],
  term ((-427717756781907914922890628895589920671501510102299927 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 2), (3, 1), (14, 1), (15, 1)],
  term ((-141136064908796 : Rat) / 1162780221153193) [(2, 2), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5127349422671957138224600028120682800758849034148764083 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(2, 2), (3, 1), (15, 1)],
  term ((2056449568955337 : Rat) / 2325560442306386) [(2, 2), (3, 1), (15, 1), (16, 1)],
  term ((-2754238630492206819387885567193033316329 : Rat) / 3599128372207431889700080584088617803970) [(2, 2), (4, 1)],
  term ((16890983628896808743407603036576568848 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (4, 1), (5, 1), (9, 1)],
  term ((20220074797511964466058292860462341536 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (4, 1), (5, 1), (13, 1)],
  term ((-1086812258876365631714711692878661467835285345215957824 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 2), (4, 1), (5, 1), (15, 1)],
  term ((-103470768511616 : Rat) / 1162780221153193) [(2, 2), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((1629839434123293200787041539811013234524 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (4, 1), (7, 1), (9, 1)],
  term ((362247986505545785230389804845802505856 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (4, 1), (7, 1), (12, 1), (13, 1)],
  term ((-3257096208512683818267653266718205086600232278149220966 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 2), (4, 1), (7, 1), (12, 1), (15, 1)],
  term ((2393155378199320 : Rat) / 1162780221153193) [(2, 2), (4, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1972742673473057919187321411288895958404 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (4, 1), (7, 1), (13, 1)],
  term ((-2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (4, 1), (7, 1), (13, 1), (14, 1)],
  term ((-168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(2, 2), (4, 1), (7, 1), (14, 1), (15, 1)],
  term ((-416983870520476 : Rat) / 1162780221153193) [(2, 2), (4, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((29469476512772711839687201219835898272519754682615684141 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(2, 2), (4, 1), (7, 1), (15, 1)],
  term ((-2336587756741262 : Rat) / 1162780221153193) [(2, 2), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((732537308678412778282669871950328022754 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (4, 1), (8, 1)],
  term ((-379943144957262949503842745542488627072 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (4, 1), (9, 1), (12, 1), (13, 1)],
  term ((10672513037086450550509020441075862815340689789757733636 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 2), (4, 1), (9, 1), (12, 1), (15, 1)],
  term ((-3864655997676720 : Rat) / 1162780221153193) [(2, 2), (4, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-13326027153172854450637112482178104304 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (4, 1), (9, 1), (13, 1)],
  term ((-4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (4, 1), (9, 1), (13, 1), (14, 1)],
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(2, 2), (4, 1), (9, 1), (14, 1), (15, 1)],
  term ((-833967741040952 : Rat) / 1162780221153193) [(2, 2), (4, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-10823665347390105096389390636919670678420376652206031682 : Rat) / 418499528459408918327148043876319653860305890461357621) [(2, 2), (4, 1), (9, 1), (15, 1)],
  term ((4762912923524824 : Rat) / 1162780221153193) [(2, 2), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((125213541211545048374964250703804316256 : Rat) / 39990315246749243218889784267651308933) [(2, 2), (4, 1), (9, 2)],
  term ((1060843780828011690178037117696406736 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (4, 1), (11, 1), (13, 1)],
  term ((168614132473848352421619338000873392948252297538773343 : Rat) / 278999685639605945551432029250879769240203926974238414) [(2, 2), (4, 1), (11, 1), (15, 1)],
  term ((208491935260238 : Rat) / 1162780221153193) [(2, 2), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((148291692041254964032845845511251282866 : Rat) / 119970945740247729656669352802953926799) [(2, 2), (4, 1), (12, 1)],
  term ((-10309544944822748557611889928110861240220236337789184721 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(2, 2), (4, 1), (13, 1), (15, 1)],
  term ((2669464388918934 : Rat) / 1162780221153193) [(2, 2), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((84655842430810441094993836968011362544 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (4, 1), (13, 2)],
  term ((-1478456344648618619387678777309548632872 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (4, 1), (14, 1)],
  term ((-2147085925815030383357104766528829456826404182975965643 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 2), (4, 1), (15, 2)],
  term ((584290650991412 : Rat) / 1162780221153193) [(2, 2), (4, 1), (15, 2), (16, 1)],
  term ((3835115182457325678732377184857873892259 : Rat) / 1799564186103715944850040292044308901985) [(2, 2), (5, 1), (7, 1)],
  term ((31193122130146647550698511492541970888 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (5, 1), (7, 1), (9, 1), (13, 1)],
  term ((-1208891180766952900908632937625319963868143041788647936 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 2), (5, 1), (7, 1), (9, 1), (15, 1)],
  term ((-3160383784879872 : Rat) / 1162780221153193) [(2, 2), (5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((106403221006853429260105512033760078472 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (5, 1), (7, 1), (9, 2)],
  term ((1338347194939818880675708356377518783224328431776016272 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 2), (5, 1), (7, 1), (13, 1), (15, 1)],
  term ((3160383784879872 : Rat) / 1162780221153193) [(2, 2), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-27519268627400015362160804705260409872 : Rat) / 39990315246749243218889784267651308933) [(2, 2), (5, 1), (7, 1), (13, 2)],
  term ((-1086812258876365631714711692878661467835285345215957824 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 2), (5, 1), (7, 1), (15, 2)],
  term ((-103470768511616 : Rat) / 1162780221153193) [(2, 2), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((48138056360456346690791370267159183058 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (5, 1), (8, 1), (9, 1)],
  term ((178832029047636332318143270131866820236 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (5, 1), (8, 1), (13, 1)],
  term ((-2013352258384651181460743152350227739500255000732759229 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 2), (5, 1), (8, 1), (15, 1)],
  term ((-191472562644716 : Rat) / 1162780221153193) [(2, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-8945695978403823378185260446717037161 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (5, 1), (9, 1)],
  term ((-26816557735183032527929146058902134264 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (5, 1), (9, 1), (11, 1), (13, 1)],
  term ((-181142123956909083033591111950365889858459836126228364 : Rat) / 139499842819802972775716014625439884620101963487119207) [(2, 2), (5, 1), (9, 1), (11, 1), (15, 1)],
  term ((751294408028112 : Rat) / 1162780221153193) [(2, 2), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((94799603442309507370261672490958217944 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (5, 1), (9, 1), (12, 1)],
  term ((16527737784929168061123148869963794329901925980398052713 : Rat) / 557999371279211891102864058501759538480407853948476828) [(2, 2), (5, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((-4569079916135479 : Rat) / 1162780221153193) [(2, 2), (5, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-699598964377024284665984479369490528956 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (5, 1), (9, 1), (12, 1), (13, 2)],
  term ((-57065163418514028206963760297560614190626285699065528079 : Rat) / 929998952132019818504773430836265897467346423247461380) [(2, 2), (5, 1), (9, 1), (12, 1), (15, 2)],
  term ((13204414907240807 : Rat) / 1162780221153193) [(2, 2), (5, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((1681207212074162784866544631513075229980270038215301238 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 2), (5, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((833967741040952 : Rat) / 1162780221153193) [(2, 2), (5, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2578326853107933456558538464757287301318301626202703904507 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(2, 2), (5, 1), (9, 1), (13, 1), (15, 1)],
  term ((-50068166157171823 : Rat) / 6976681326919158) [(2, 2), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((147847046676439604201330883678806456320 : Rat) / 359912837220743188970008058408861780397) [(2, 2), (5, 1), (9, 1), (13, 2)],
  term ((4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (5, 1), (9, 1), (13, 2), (14, 1)],
  term ((26763454583586125644678066817785174728 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (5, 1), (9, 1), (14, 1)],
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(2, 2), (5, 1), (9, 1), (14, 1), (15, 2)],
  term ((-833967741040952 : Rat) / 1162780221153193) [(2, 2), (5, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((596292272370210102731177090662239802901212841340772628921 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(2, 2), (5, 1), (9, 1), (15, 2)],
  term ((75330592794360 : Rat) / 1162780221153193) [(3, 1), (7, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((75330592794360 : Rat) / 1162780221153193) [(3, 1), (7, 1), (13, 1), (15, 3), (16, 1)],
  term ((40472928056033817116049120031239046672 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (7, 1), (13, 2), (14, 2)],
  term ((40472928056033817116049120031239046672 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (7, 1), (13, 2), (15, 2)],
  term ((8921151527862041881559355605928391576 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (7, 1), (14, 1), (15, 2)],
  term ((6871312347005108487180609041771102287064141873321853589 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (7, 1), (14, 2), (15, 2)],
  term ((-3198205862530996 : Rat) / 1162780221153193) [(3, 1), (7, 1), (14, 2), (15, 2), (16, 1)],
  term ((8921151527862041881559355605928391576 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (7, 1), (14, 3)],
  term ((6871312347005108487180609041771102287064141873321853589 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (7, 1), (15, 4)],
  term ((-3198205862530996 : Rat) / 1162780221153193) [(3, 1), (7, 1), (15, 4), (16, 1)],
  term ((-1652695128300478652375073904873736949728 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (8, 1), (9, 1), (14, 2)],
  term ((-1652695128300478652375073904873736949728 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (8, 1), (9, 1), (15, 2)],
  term ((3209257923513847776562869360713708288 : Rat) / 39990315246749243218889784267651308933) [(3, 1), (9, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((3209257923513847776562869360713708288 : Rat) / 39990315246749243218889784267651308933) [(3, 1), (9, 1), (12, 1), (13, 1), (15, 3)],
  term ((-211456760502129940609786390150776826244 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (9, 1), (12, 1), (14, 2)],
  term ((-550224871676112102035615555952179792604942567145793832 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (9, 1), (12, 1), (14, 2), (15, 2)],
  term ((1443384088015008 : Rat) / 1162780221153193) [(3, 1), (9, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((-211456760502129940609786390150776826244 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (9, 1), (12, 1), (15, 2)],
  term ((-550224871676112102035615555952179792604942567145793832 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (9, 1), (12, 1), (15, 4)],
  term ((1443384088015008 : Rat) / 1162780221153193) [(3, 1), (9, 1), (12, 1), (15, 4), (16, 1)],
  term ((-43135328846876119407214699700298383881329052598883204313 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(3, 1), (9, 1), (13, 1), (14, 2), (15, 1)],
  term ((212582817171990 : Rat) / 1162780221153193) [(3, 1), (9, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-43135328846876119407214699700298383881329052598883204313 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(3, 1), (9, 1), (13, 1), (15, 3)],
  term ((212582817171990 : Rat) / 1162780221153193) [(3, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((-32374617250718488653403865302693490632 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (9, 1), (13, 2), (14, 2)],
  term ((-32374617250718488653403865302693490632 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (9, 1), (13, 2), (15, 2)],
  term ((-1217648963717924911224184363882747984154 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (9, 1), (14, 1), (15, 2)],
  term ((1417328201287324005548875358914343460668 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (9, 1), (14, 2)],
  term ((-4666118582264079879312520807185554929005944364492589137 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (9, 1), (14, 2), (15, 2)],
  term ((7791585621739076 : Rat) / 1162780221153193) [(3, 1), (9, 1), (14, 2), (15, 2), (16, 1)],
  term ((-1217648963717924911224184363882747984154 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (9, 1), (14, 3)],
  term ((1417328201287324005548875358914343460668 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (9, 1), (15, 2)],
  term ((-4666118582264079879312520807185554929005944364492589137 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (9, 1), (15, 4)],
  term ((7791585621739076 : Rat) / 1162780221153193) [(3, 1), (9, 1), (15, 4), (16, 1)],
  term ((234824404481097668778610925125521767712 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (9, 2), (13, 1), (14, 2)],
  term ((234824404481097668778610925125521767712 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (9, 2), (13, 1), (15, 2)],
  term ((-1224510104923201687356037336946774208653866347508271591 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (9, 2), (14, 2), (15, 1)],
  term ((2242722674317404 : Rat) / 1162780221153193) [(3, 1), (9, 2), (14, 2), (15, 1), (16, 1)],
  term ((-1224510104923201687356037336946774208653866347508271591 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 1), (9, 2), (15, 3)],
  term ((2242722674317404 : Rat) / 1162780221153193) [(3, 1), (9, 2), (15, 3), (16, 1)],
  term ((189337596559409838993915431795101263168 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (9, 3), (14, 2)],
  term ((189337596559409838993915431795101263168 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (9, 3), (15, 2)],
  term ((-12492472986937566043423911539945286416 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (12, 1), (13, 1), (14, 2)],
  term ((-12492472986937566043423911539945286416 : Rat) / 199951576233746216094448921338256544665) [(3, 1), (12, 1), (13, 1), (15, 2)],
  term ((-5474663009772140144656526016955689267161795033886933313 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(3, 1), (12, 1), (14, 2), (15, 1)],
  term ((299904219258166 : Rat) / 1162780221153193) [(3, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-5474663009772140144656526016955689267161795033886933313 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(3, 1), (12, 1), (15, 3)],
  term ((299904219258166 : Rat) / 1162780221153193) [(3, 1), (12, 1), (15, 3), (16, 1)],
  term ((-40423760364518984840150318565767501272 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (13, 1), (14, 1), (15, 2)],
  term ((203545545408235787656366621830933929642 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (13, 1), (14, 2)],
  term ((-40423760364518984840150318565767501272 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (13, 1), (14, 3)],
  term ((203545545408235787656366621830933929642 : Rat) / 599854728701238648283346764014769633995) [(3, 1), (13, 1), (15, 2)],
  term ((427717756781907914922890628895589920671501510102299927 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (14, 1), (15, 3)],
  term ((141136064908796 : Rat) / 1162780221153193) [(3, 1), (14, 1), (15, 3), (16, 1)],
  term ((5127349422671957138224600028120682800758849034148764083 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(3, 1), (14, 2), (15, 1)],
  term ((-2056449568955337 : Rat) / 2325560442306386) [(3, 1), (14, 2), (15, 1), (16, 1)],
  term ((427717756781907914922890628895589920671501510102299927 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 1), (14, 3), (15, 1)],
  term ((141136064908796 : Rat) / 1162780221153193) [(3, 1), (14, 3), (15, 1), (16, 1)],
  term ((5127349422671957138224600028120682800758849034148764083 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(3, 1), (15, 3)],
  term ((-2056449568955337 : Rat) / 2325560442306386) [(3, 1), (15, 3), (16, 1)],
  term ((-2754238630492206819387885567193033316329 : Rat) / 3599128372207431889700080584088617803970) [(3, 2), (4, 1)],
  term ((16890983628896808743407603036576568848 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (4, 1), (5, 1), (9, 1)],
  term ((20220074797511964466058292860462341536 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (4, 1), (5, 1), (13, 1)],
  term ((-1086812258876365631714711692878661467835285345215957824 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 2), (4, 1), (5, 1), (15, 1)],
  term ((-103470768511616 : Rat) / 1162780221153193) [(3, 2), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((1629839434123293200787041539811013234524 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (4, 1), (7, 1), (9, 1)],
  term ((362247986505545785230389804845802505856 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (4, 1), (7, 1), (12, 1), (13, 1)],
  term ((-3257096208512683818267653266718205086600232278149220966 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 2), (4, 1), (7, 1), (12, 1), (15, 1)],
  term ((2393155378199320 : Rat) / 1162780221153193) [(3, 2), (4, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1972742673473057919187321411288895958404 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (4, 1), (7, 1), (13, 1)],
  term ((-2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (4, 1), (7, 1), (13, 1), (14, 1)],
  term ((-168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 2), (4, 1), (7, 1), (14, 1), (15, 1)],
  term ((-416983870520476 : Rat) / 1162780221153193) [(3, 2), (4, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((29469476512772711839687201219835898272519754682615684141 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(3, 2), (4, 1), (7, 1), (15, 1)],
  term ((-2336587756741262 : Rat) / 1162780221153193) [(3, 2), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((732537308678412778282669871950328022754 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (4, 1), (8, 1)],
  term ((-379943144957262949503842745542488627072 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (4, 1), (9, 1), (12, 1), (13, 1)],
  term ((10672513037086450550509020441075862815340689789757733636 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 2), (4, 1), (9, 1), (12, 1), (15, 1)],
  term ((-3864655997676720 : Rat) / 1162780221153193) [(3, 2), (4, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-13326027153172854450637112482178104304 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (4, 1), (9, 1), (13, 1)],
  term ((-4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (4, 1), (9, 1), (13, 1), (14, 1)],
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 2), (4, 1), (9, 1), (14, 1), (15, 1)],
  term ((-833967741040952 : Rat) / 1162780221153193) [(3, 2), (4, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-10823665347390105096389390636919670678420376652206031682 : Rat) / 418499528459408918327148043876319653860305890461357621) [(3, 2), (4, 1), (9, 1), (15, 1)],
  term ((4762912923524824 : Rat) / 1162780221153193) [(3, 2), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((125213541211545048374964250703804316256 : Rat) / 39990315246749243218889784267651308933) [(3, 2), (4, 1), (9, 2)],
  term ((1060843780828011690178037117696406736 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (4, 1), (11, 1), (13, 1)],
  term ((168614132473848352421619338000873392948252297538773343 : Rat) / 278999685639605945551432029250879769240203926974238414) [(3, 2), (4, 1), (11, 1), (15, 1)],
  term ((208491935260238 : Rat) / 1162780221153193) [(3, 2), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((148291692041254964032845845511251282866 : Rat) / 119970945740247729656669352802953926799) [(3, 2), (4, 1), (12, 1)],
  term ((-10309544944822748557611889928110861240220236337789184721 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(3, 2), (4, 1), (13, 1), (15, 1)],
  term ((2669464388918934 : Rat) / 1162780221153193) [(3, 2), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((84655842430810441094993836968011362544 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (4, 1), (13, 2)],
  term ((-1478456344648618619387678777309548632872 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (4, 1), (14, 1)],
  term ((-2147085925815030383357104766528829456826404182975965643 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 2), (4, 1), (15, 2)],
  term ((584290650991412 : Rat) / 1162780221153193) [(3, 2), (4, 1), (15, 2), (16, 1)],
  term ((3835115182457325678732377184857873892259 : Rat) / 1799564186103715944850040292044308901985) [(3, 2), (5, 1), (7, 1)],
  term ((31193122130146647550698511492541970888 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (5, 1), (7, 1), (9, 1), (13, 1)],
  term ((-1208891180766952900908632937625319963868143041788647936 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 2), (5, 1), (7, 1), (9, 1), (15, 1)],
  term ((-3160383784879872 : Rat) / 1162780221153193) [(3, 2), (5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((106403221006853429260105512033760078472 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (5, 1), (7, 1), (9, 2)],
  term ((1338347194939818880675708356377518783224328431776016272 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 2), (5, 1), (7, 1), (13, 1), (15, 1)],
  term ((3160383784879872 : Rat) / 1162780221153193) [(3, 2), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-27519268627400015362160804705260409872 : Rat) / 39990315246749243218889784267651308933) [(3, 2), (5, 1), (7, 1), (13, 2)],
  term ((-1086812258876365631714711692878661467835285345215957824 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 2), (5, 1), (7, 1), (15, 2)],
  term ((-103470768511616 : Rat) / 1162780221153193) [(3, 2), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((48138056360456346690791370267159183058 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (5, 1), (8, 1), (9, 1)],
  term ((178832029047636332318143270131866820236 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (5, 1), (8, 1), (13, 1)],
  term ((-2013352258384651181460743152350227739500255000732759229 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 2), (5, 1), (8, 1), (15, 1)],
  term ((-191472562644716 : Rat) / 1162780221153193) [(3, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-8945695978403823378185260446717037161 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (5, 1), (9, 1)],
  term ((-26816557735183032527929146058902134264 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (5, 1), (9, 1), (11, 1), (13, 1)],
  term ((-181142123956909083033591111950365889858459836126228364 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 2), (5, 1), (9, 1), (11, 1), (15, 1)],
  term ((751294408028112 : Rat) / 1162780221153193) [(3, 2), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((94799603442309507370261672490958217944 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (5, 1), (9, 1), (12, 1)],
  term ((16527737784929168061123148869963794329901925980398052713 : Rat) / 557999371279211891102864058501759538480407853948476828) [(3, 2), (5, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((-4569079916135479 : Rat) / 1162780221153193) [(3, 2), (5, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-699598964377024284665984479369490528956 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (5, 1), (9, 1), (12, 1), (13, 2)],
  term ((-57065163418514028206963760297560614190626285699065528079 : Rat) / 929998952132019818504773430836265897467346423247461380) [(3, 2), (5, 1), (9, 1), (12, 1), (15, 2)],
  term ((13204414907240807 : Rat) / 1162780221153193) [(3, 2), (5, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((1681207212074162784866544631513075229980270038215301238 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 2), (5, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((833967741040952 : Rat) / 1162780221153193) [(3, 2), (5, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2578326853107933456558538464757287301318301626202703904507 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(3, 2), (5, 1), (9, 1), (13, 1), (15, 1)],
  term ((-50068166157171823 : Rat) / 6976681326919158) [(3, 2), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((147847046676439604201330883678806456320 : Rat) / 359912837220743188970008058408861780397) [(3, 2), (5, 1), (9, 1), (13, 2)],
  term ((4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (5, 1), (9, 1), (13, 2), (14, 1)],
  term ((26763454583586125644678066817785174728 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (5, 1), (9, 1), (14, 1)],
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(3, 2), (5, 1), (9, 1), (14, 1), (15, 2)],
  term ((-833967741040952 : Rat) / 1162780221153193) [(3, 2), (5, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((596292272370210102731177090662239802901212841340772628921 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(3, 2), (5, 1), (9, 1), (15, 2)],
  term ((-75330592794360 : Rat) / 1162780221153193) [(3, 3), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-40472928056033817116049120031239046672 : Rat) / 599854728701238648283346764014769633995) [(3, 3), (7, 1), (13, 2)],
  term ((-8921151527862041881559355605928391576 : Rat) / 199951576233746216094448921338256544665) [(3, 3), (7, 1), (14, 1)],
  term ((-6871312347005108487180609041771102287064141873321853589 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 3), (7, 1), (15, 2)],
  term ((3198205862530996 : Rat) / 1162780221153193) [(3, 3), (7, 1), (15, 2), (16, 1)],
  term ((1652695128300478652375073904873736949728 : Rat) / 599854728701238648283346764014769633995) [(3, 3), (8, 1), (9, 1)],
  term ((-1417328201287324005548875358914343460668 : Rat) / 599854728701238648283346764014769633995) [(3, 3), (9, 1)],
  term ((211456760502129940609786390150776826244 : Rat) / 199951576233746216094448921338256544665) [(3, 3), (9, 1), (12, 1)],
  term ((-3209257923513847776562869360713708288 : Rat) / 39990315246749243218889784267651308933) [(3, 3), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((550224871676112102035615555952179792604942567145793832 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 3), (9, 1), (12, 1), (15, 2)],
  term ((-1443384088015008 : Rat) / 1162780221153193) [(3, 3), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((43135328846876119407214699700298383881329052598883204313 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(3, 3), (9, 1), (13, 1), (15, 1)],
  term ((-212582817171990 : Rat) / 1162780221153193) [(3, 3), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((32374617250718488653403865302693490632 : Rat) / 599854728701238648283346764014769633995) [(3, 3), (9, 1), (13, 2)],
  term ((1217648963717924911224184363882747984154 : Rat) / 599854728701238648283346764014769633995) [(3, 3), (9, 1), (14, 1)],
  term ((4666118582264079879312520807185554929005944364492589137 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 3), (9, 1), (15, 2)],
  term ((-7791585621739076 : Rat) / 1162780221153193) [(3, 3), (9, 1), (15, 2), (16, 1)],
  term ((-234824404481097668778610925125521767712 : Rat) / 199951576233746216094448921338256544665) [(3, 3), (9, 2), (13, 1)],
  term ((1224510104923201687356037336946774208653866347508271591 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 3), (9, 2), (15, 1)],
  term ((-2242722674317404 : Rat) / 1162780221153193) [(3, 3), (9, 2), (15, 1), (16, 1)],
  term ((-189337596559409838993915431795101263168 : Rat) / 199951576233746216094448921338256544665) [(3, 3), (9, 3)],
  term ((12492472986937566043423911539945286416 : Rat) / 199951576233746216094448921338256544665) [(3, 3), (12, 1), (13, 1)],
  term ((5474663009772140144656526016955689267161795033886933313 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(3, 3), (12, 1), (15, 1)],
  term ((-299904219258166 : Rat) / 1162780221153193) [(3, 3), (12, 1), (15, 1), (16, 1)],
  term ((-203545545408235787656366621830933929642 : Rat) / 599854728701238648283346764014769633995) [(3, 3), (13, 1)],
  term ((40423760364518984840150318565767501272 : Rat) / 599854728701238648283346764014769633995) [(3, 3), (13, 1), (14, 1)],
  term ((-427717756781907914922890628895589920671501510102299927 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 3), (14, 1), (15, 1)],
  term ((-141136064908796 : Rat) / 1162780221153193) [(3, 3), (14, 1), (15, 1), (16, 1)],
  term ((-5127349422671957138224600028120682800758849034148764083 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(3, 3), (15, 1)],
  term ((2056449568955337 : Rat) / 2325560442306386) [(3, 3), (15, 1), (16, 1)],
  term ((-16890983628896808743407603036576568848 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (5, 1), (9, 1), (14, 2)],
  term ((-16890983628896808743407603036576568848 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (5, 1), (9, 1), (15, 2)],
  term ((-20220074797511964466058292860462341536 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (5, 1), (13, 1), (14, 2)],
  term ((-20220074797511964466058292860462341536 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (5, 1), (13, 1), (15, 2)],
  term ((1086812258876365631714711692878661467835285345215957824 : Rat) / 232499738033004954626193357709066474366836605811865345) [(4, 1), (5, 1), (14, 2), (15, 1)],
  term ((103470768511616 : Rat) / 1162780221153193) [(4, 1), (5, 1), (14, 2), (15, 1), (16, 1)],
  term ((1086812258876365631714711692878661467835285345215957824 : Rat) / 232499738033004954626193357709066474366836605811865345) [(4, 1), (5, 1), (15, 3)],
  term ((103470768511616 : Rat) / 1162780221153193) [(4, 1), (5, 1), (15, 3), (16, 1)],
  term ((-1629839434123293200787041539811013234524 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (7, 1), (9, 1), (14, 2)],
  term ((-1629839434123293200787041539811013234524 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (7, 1), (9, 1), (15, 2)],
  term ((-362247986505545785230389804845802505856 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (7, 1), (12, 1), (13, 1), (14, 2)],
  term ((-362247986505545785230389804845802505856 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (7, 1), (12, 1), (13, 1), (15, 2)],
  term ((3257096208512683818267653266718205086600232278149220966 : Rat) / 232499738033004954626193357709066474366836605811865345) [(4, 1), (7, 1), (12, 1), (14, 2), (15, 1)],
  term ((-2393155378199320 : Rat) / 1162780221153193) [(4, 1), (7, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((3257096208512683818267653266718205086600232278149220966 : Rat) / 232499738033004954626193357709066474366836605811865345) [(4, 1), (7, 1), (12, 1), (15, 3)],
  term ((-2393155378199320 : Rat) / 1162780221153193) [(4, 1), (7, 1), (12, 1), (15, 3), (16, 1)],
  term ((2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (7, 1), (13, 1), (14, 1), (15, 2)],
  term ((1972742673473057919187321411288895958404 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (7, 1), (13, 1), (14, 2)],
  term ((2121687561656023380356074235392813472 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (7, 1), (13, 1), (14, 3)],
  term ((1972742673473057919187321411288895958404 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (7, 1), (13, 1), (15, 2)],
  term ((168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(4, 1), (7, 1), (14, 1), (15, 3)],
  term ((416983870520476 : Rat) / 1162780221153193) [(4, 1), (7, 1), (14, 1), (15, 3), (16, 1)],
  term ((-29469476512772711839687201219835898272519754682615684141 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(4, 1), (7, 1), (14, 2), (15, 1)],
  term ((2336587756741262 : Rat) / 1162780221153193) [(4, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((168614132473848352421619338000873392948252297538773343 : Rat) / 139499842819802972775716014625439884620101963487119207) [(4, 1), (7, 1), (14, 3), (15, 1)],
  term ((416983870520476 : Rat) / 1162780221153193) [(4, 1), (7, 1), (14, 3), (15, 1), (16, 1)],
  term ((-29469476512772711839687201219835898272519754682615684141 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(4, 1), (7, 1), (15, 3)],
  term ((2336587756741262 : Rat) / 1162780221153193) [(4, 1), (7, 1), (15, 3), (16, 1)],
  term ((-732537308678412778282669871950328022754 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (8, 1), (14, 2)],
  term ((-732537308678412778282669871950328022754 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (8, 1), (15, 2)],
  term ((379943144957262949503842745542488627072 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (9, 1), (12, 1), (13, 1), (14, 2)],
  term ((379943144957262949503842745542488627072 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (9, 1), (12, 1), (13, 1), (15, 2)],
  term ((-10672513037086450550509020441075862815340689789757733636 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (9, 1), (12, 1), (14, 2), (15, 1)],
  term ((3864655997676720 : Rat) / 1162780221153193) [(4, 1), (9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-10672513037086450550509020441075862815340689789757733636 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (9, 1), (12, 1), (15, 3)],
  term ((3864655997676720 : Rat) / 1162780221153193) [(4, 1), (9, 1), (12, 1), (15, 3), (16, 1)],
  term ((4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (9, 1), (13, 1), (14, 1), (15, 2)],
  term ((13326027153172854450637112482178104304 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (9, 1), (13, 1), (14, 2)],
  term ((4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (9, 1), (13, 1), (14, 3)],
  term ((13326027153172854450637112482178104304 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (9, 1), (13, 1), (15, 2)],
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(4, 1), (9, 1), (14, 1), (15, 3)],
  term ((833967741040952 : Rat) / 1162780221153193) [(4, 1), (9, 1), (14, 1), (15, 3), (16, 1)],
  term ((10823665347390105096389390636919670678420376652206031682 : Rat) / 418499528459408918327148043876319653860305890461357621) [(4, 1), (9, 1), (14, 2), (15, 1)],
  term ((-4762912923524824 : Rat) / 1162780221153193) [(4, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(4, 1), (9, 1), (14, 3), (15, 1)],
  term ((833967741040952 : Rat) / 1162780221153193) [(4, 1), (9, 1), (14, 3), (15, 1), (16, 1)],
  term ((10823665347390105096389390636919670678420376652206031682 : Rat) / 418499528459408918327148043876319653860305890461357621) [(4, 1), (9, 1), (15, 3)],
  term ((-4762912923524824 : Rat) / 1162780221153193) [(4, 1), (9, 1), (15, 3), (16, 1)],
  term ((-125213541211545048374964250703804316256 : Rat) / 39990315246749243218889784267651308933) [(4, 1), (9, 2), (14, 2)],
  term ((-125213541211545048374964250703804316256 : Rat) / 39990315246749243218889784267651308933) [(4, 1), (9, 2), (15, 2)],
  term ((-1060843780828011690178037117696406736 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (11, 1), (13, 1), (14, 2)],
  term ((-1060843780828011690178037117696406736 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (11, 1), (13, 1), (15, 2)],
  term ((-168614132473848352421619338000873392948252297538773343 : Rat) / 278999685639605945551432029250879769240203926974238414) [(4, 1), (11, 1), (14, 2), (15, 1)],
  term ((-208491935260238 : Rat) / 1162780221153193) [(4, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-168614132473848352421619338000873392948252297538773343 : Rat) / 278999685639605945551432029250879769240203926974238414) [(4, 1), (11, 1), (15, 3)],
  term ((-208491935260238 : Rat) / 1162780221153193) [(4, 1), (11, 1), (15, 3), (16, 1)],
  term ((-148291692041254964032845845511251282866 : Rat) / 119970945740247729656669352802953926799) [(4, 1), (12, 1), (14, 2)],
  term ((-148291692041254964032845845511251282866 : Rat) / 119970945740247729656669352802953926799) [(4, 1), (12, 1), (15, 2)],
  term ((10309544944822748557611889928110861240220236337789184721 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(4, 1), (13, 1), (14, 2), (15, 1)],
  term ((-2669464388918934 : Rat) / 1162780221153193) [(4, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((10309544944822748557611889928110861240220236337789184721 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(4, 1), (13, 1), (15, 3)],
  term ((-2669464388918934 : Rat) / 1162780221153193) [(4, 1), (13, 1), (15, 3), (16, 1)],
  term ((-84655842430810441094993836968011362544 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (13, 2), (14, 2)],
  term ((-84655842430810441094993836968011362544 : Rat) / 199951576233746216094448921338256544665) [(4, 1), (13, 2), (15, 2)],
  term ((1478456344648618619387678777309548632872 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (14, 1), (15, 2)],
  term ((2754238630492206819387885567193033316329 : Rat) / 3599128372207431889700080584088617803970) [(4, 1), (14, 2)],
  term ((2147085925815030383357104766528829456826404182975965643 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (14, 2), (15, 2)],
  term ((-584290650991412 : Rat) / 1162780221153193) [(4, 1), (14, 2), (15, 2), (16, 1)],
  term ((1478456344648618619387678777309548632872 : Rat) / 599854728701238648283346764014769633995) [(4, 1), (14, 3)],
  term ((2754238630492206819387885567193033316329 : Rat) / 3599128372207431889700080584088617803970) [(4, 1), (15, 2)],
  term ((2147085925815030383357104766528829456826404182975965643 : Rat) / 697499214099014863878580073127199423100509817435596035) [(4, 1), (15, 4)],
  term ((-584290650991412 : Rat) / 1162780221153193) [(4, 1), (15, 4), (16, 1)],
  term ((-31193122130146647550698511492541970888 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (7, 1), (9, 1), (13, 1), (14, 2)],
  term ((-31193122130146647550698511492541970888 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (7, 1), (9, 1), (13, 1), (15, 2)],
  term ((1208891180766952900908632937625319963868143041788647936 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (7, 1), (9, 1), (14, 2), (15, 1)],
  term ((3160383784879872 : Rat) / 1162780221153193) [(5, 1), (7, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((1208891180766952900908632937625319963868143041788647936 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (7, 1), (9, 1), (15, 3)],
  term ((3160383784879872 : Rat) / 1162780221153193) [(5, 1), (7, 1), (9, 1), (15, 3), (16, 1)],
  term ((-106403221006853429260105512033760078472 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (7, 1), (9, 2), (14, 2)],
  term ((-106403221006853429260105512033760078472 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (7, 1), (9, 2), (15, 2)],
  term ((-1338347194939818880675708356377518783224328431776016272 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (7, 1), (13, 1), (14, 2), (15, 1)],
  term ((-3160383784879872 : Rat) / 1162780221153193) [(5, 1), (7, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1338347194939818880675708356377518783224328431776016272 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (7, 1), (13, 1), (15, 3)],
  term ((-3160383784879872 : Rat) / 1162780221153193) [(5, 1), (7, 1), (13, 1), (15, 3), (16, 1)],
  term ((27519268627400015362160804705260409872 : Rat) / 39990315246749243218889784267651308933) [(5, 1), (7, 1), (13, 2), (14, 2)],
  term ((27519268627400015362160804705260409872 : Rat) / 39990315246749243218889784267651308933) [(5, 1), (7, 1), (13, 2), (15, 2)],
  term ((-3835115182457325678732377184857873892259 : Rat) / 1799564186103715944850040292044308901985) [(5, 1), (7, 1), (14, 2)],
  term ((1086812258876365631714711692878661467835285345215957824 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 1), (7, 1), (14, 2), (15, 2)],
  term ((103470768511616 : Rat) / 1162780221153193) [(5, 1), (7, 1), (14, 2), (15, 2), (16, 1)],
  term ((-3835115182457325678732377184857873892259 : Rat) / 1799564186103715944850040292044308901985) [(5, 1), (7, 1), (15, 2)],
  term ((1086812258876365631714711692878661467835285345215957824 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 1), (7, 1), (15, 4)],
  term ((103470768511616 : Rat) / 1162780221153193) [(5, 1), (7, 1), (15, 4), (16, 1)],
  term ((-48138056360456346690791370267159183058 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (8, 1), (9, 1), (14, 2)],
  term ((-48138056360456346690791370267159183058 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (8, 1), (9, 1), (15, 2)],
  term ((-178832029047636332318143270131866820236 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (8, 1), (13, 1), (14, 2)],
  term ((-178832029047636332318143270131866820236 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (8, 1), (13, 1), (15, 2)],
  term ((2013352258384651181460743152350227739500255000732759229 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 1), (8, 1), (14, 2), (15, 1)],
  term ((191472562644716 : Rat) / 1162780221153193) [(5, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((2013352258384651181460743152350227739500255000732759229 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 1), (8, 1), (15, 3)],
  term ((191472562644716 : Rat) / 1162780221153193) [(5, 1), (8, 1), (15, 3), (16, 1)],
  term ((26816557735183032527929146058902134264 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (9, 1), (11, 1), (13, 1), (14, 2)],
  term ((26816557735183032527929146058902134264 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (9, 1), (11, 1), (13, 1), (15, 2)],
  term ((181142123956909083033591111950365889858459836126228364 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 1), (9, 1), (11, 1), (14, 2), (15, 1)],
  term ((-751294408028112 : Rat) / 1162780221153193) [(5, 1), (9, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((181142123956909083033591111950365889858459836126228364 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 1), (9, 1), (11, 1), (15, 3)],
  term ((-751294408028112 : Rat) / 1162780221153193) [(5, 1), (9, 1), (11, 1), (15, 3), (16, 1)],
  term ((-16527737784929168061123148869963794329901925980398052713 : Rat) / 557999371279211891102864058501759538480407853948476828) [(5, 1), (9, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((4569079916135479 : Rat) / 1162780221153193) [(5, 1), (9, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-16527737784929168061123148869963794329901925980398052713 : Rat) / 557999371279211891102864058501759538480407853948476828) [(5, 1), (9, 1), (12, 1), (13, 1), (15, 3)],
  term ((4569079916135479 : Rat) / 1162780221153193) [(5, 1), (9, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((699598964377024284665984479369490528956 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (9, 1), (12, 1), (13, 2), (14, 2)],
  term ((699598964377024284665984479369490528956 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (9, 1), (12, 1), (13, 2), (15, 2)],
  term ((-94799603442309507370261672490958217944 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (9, 1), (12, 1), (14, 2)],
  term ((57065163418514028206963760297560614190626285699065528079 : Rat) / 929998952132019818504773430836265897467346423247461380) [(5, 1), (9, 1), (12, 1), (14, 2), (15, 2)],
  term ((-13204414907240807 : Rat) / 1162780221153193) [(5, 1), (9, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((-94799603442309507370261672490958217944 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (9, 1), (12, 1), (15, 2)],
  term ((57065163418514028206963760297560614190626285699065528079 : Rat) / 929998952132019818504773430836265897467346423247461380) [(5, 1), (9, 1), (12, 1), (15, 4)],
  term ((-13204414907240807 : Rat) / 1162780221153193) [(5, 1), (9, 1), (12, 1), (15, 4), (16, 1)],
  term ((-1681207212074162784866544631513075229980270038215301238 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (9, 1), (13, 1), (14, 1), (15, 3)],
  term ((-833967741040952 : Rat) / 1162780221153193) [(5, 1), (9, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((2578326853107933456558538464757287301318301626202703904507 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(5, 1), (9, 1), (13, 1), (14, 2), (15, 1)],
  term ((50068166157171823 : Rat) / 6976681326919158) [(5, 1), (9, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1681207212074162784866544631513075229980270038215301238 : Rat) / 697499214099014863878580073127199423100509817435596035) [(5, 1), (9, 1), (13, 1), (14, 3), (15, 1)],
  term ((-833967741040952 : Rat) / 1162780221153193) [(5, 1), (9, 1), (13, 1), (14, 3), (15, 1), (16, 1)],
  term ((2578326853107933456558538464757287301318301626202703904507 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(5, 1), (9, 1), (13, 1), (15, 3)],
  term ((50068166157171823 : Rat) / 6976681326919158) [(5, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((-4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (9, 1), (13, 2), (14, 1), (15, 2)],
  term ((-147847046676439604201330883678806456320 : Rat) / 359912837220743188970008058408861780397) [(5, 1), (9, 1), (13, 2), (14, 2)],
  term ((-4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(5, 1), (9, 1), (13, 2), (14, 3)],
  term ((-147847046676439604201330883678806456320 : Rat) / 359912837220743188970008058408861780397) [(5, 1), (9, 1), (13, 2), (15, 2)],
  term ((-26763454583586125644678066817785174728 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (9, 1), (14, 1), (15, 2)],
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 1), (9, 1), (14, 1), (15, 4)],
  term ((833967741040952 : Rat) / 1162780221153193) [(5, 1), (9, 1), (14, 1), (15, 4), (16, 1)],
  term ((8945695978403823378185260446717037161 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (9, 1), (14, 2)],
  term ((-596292272370210102731177090662239802901212841340772628921 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(5, 1), (9, 1), (14, 2), (15, 2)],
  term ((-26763454583586125644678066817785174728 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (9, 1), (14, 3)],
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(5, 1), (9, 1), (14, 3), (15, 2)],
  term ((833967741040952 : Rat) / 1162780221153193) [(5, 1), (9, 1), (14, 3), (15, 2), (16, 1)],
  term ((8945695978403823378185260446717037161 : Rat) / 199951576233746216094448921338256544665) [(5, 1), (9, 1), (15, 2)],
  term ((-596292272370210102731177090662239802901212841340772628921 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(5, 1), (9, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 5, terms 200 through 299. -/
theorem ep_Q2_024_block_05_0200_0299_valid :
    checkProductSumEq ep_Q2_024_partials_05_0200_0299
      ep_Q2_024_block_05_0200_0299 = true := by
  native_decide

end EpQ2024TermShards

end Patterns

end EndpointCertificate

end Problem97
