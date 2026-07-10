/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009YNNNN, term block 8:200-231

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009YNNNNTermShards

/-- Generator polynomial 8 for relaxed split surplus certificate `R009:u=v:R009YNNNN`. -/
def rs_R009_ueqv_R009YNNNN_generator_08_0200_0231 : Poly :=
[
  term (-2 : Rat) [(0, 1), (2, 1)],
  term (2 : Rat) [(0, 1), (10, 1)],
  term (-2 : Rat) [(1, 1), (3, 1)],
  term (2 : Rat) [(1, 1), (11, 1)],
  term (1 : Rat) [(2, 2)],
  term (1 : Rat) [(3, 2)],
  term (-1 : Rat) [(10, 2)],
  term (-1 : Rat) [(11, 2)]
]

/-- Coefficient term 200 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0200 : Poly :=
[
  term ((-128159902247 : Rat) / 5138997696) [(9, 2)]
]

/-- Partial product 200 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0200 : Poly :=
[
  term ((128159902247 : Rat) / 2569498848) [(0, 1), (2, 1), (9, 2)],
  term ((-128159902247 : Rat) / 2569498848) [(0, 1), (9, 2), (10, 1)],
  term ((128159902247 : Rat) / 2569498848) [(1, 1), (3, 1), (9, 2)],
  term ((-128159902247 : Rat) / 2569498848) [(1, 1), (9, 2), (11, 1)],
  term ((-128159902247 : Rat) / 5138997696) [(2, 2), (9, 2)],
  term ((-128159902247 : Rat) / 5138997696) [(3, 2), (9, 2)],
  term ((128159902247 : Rat) / 5138997696) [(9, 2), (10, 2)],
  term ((128159902247 : Rat) / 5138997696) [(9, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 200 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0200_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0200
        rs_R009_ueqv_R009YNNNN_generator_08_0200_0231 =
      rs_R009_ueqv_R009YNNNN_partial_08_0200 := by
  native_decide

/-- Coefficient term 201 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0201 : Poly :=
[
  term ((210703568101 : Rat) / 2997748656) [(9, 2), (10, 1)]
]

/-- Partial product 201 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0201 : Poly :=
[
  term ((-210703568101 : Rat) / 1498874328) [(0, 1), (2, 1), (9, 2), (10, 1)],
  term ((210703568101 : Rat) / 1498874328) [(0, 1), (9, 2), (10, 2)],
  term ((-210703568101 : Rat) / 1498874328) [(1, 1), (3, 1), (9, 2), (10, 1)],
  term ((210703568101 : Rat) / 1498874328) [(1, 1), (9, 2), (10, 1), (11, 1)],
  term ((210703568101 : Rat) / 2997748656) [(2, 2), (9, 2), (10, 1)],
  term ((210703568101 : Rat) / 2997748656) [(3, 2), (9, 2), (10, 1)],
  term ((-210703568101 : Rat) / 2997748656) [(9, 2), (10, 1), (11, 2)],
  term ((-210703568101 : Rat) / 2997748656) [(9, 2), (10, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 201 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0201_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0201
        rs_R009_ueqv_R009YNNNN_generator_08_0200_0231 =
      rs_R009_ueqv_R009YNNNN_partial_08_0201 := by
  native_decide

/-- Coefficient term 202 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0202 : Poly :=
[
  term ((1209916365281 : Rat) / 5995497312) [(9, 2), (14, 1)]
]

/-- Partial product 202 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0202 : Poly :=
[
  term ((-1209916365281 : Rat) / 2997748656) [(0, 1), (2, 1), (9, 2), (14, 1)],
  term ((1209916365281 : Rat) / 2997748656) [(0, 1), (9, 2), (10, 1), (14, 1)],
  term ((-1209916365281 : Rat) / 2997748656) [(1, 1), (3, 1), (9, 2), (14, 1)],
  term ((1209916365281 : Rat) / 2997748656) [(1, 1), (9, 2), (11, 1), (14, 1)],
  term ((1209916365281 : Rat) / 5995497312) [(2, 2), (9, 2), (14, 1)],
  term ((1209916365281 : Rat) / 5995497312) [(3, 2), (9, 2), (14, 1)],
  term ((-1209916365281 : Rat) / 5995497312) [(9, 2), (10, 2), (14, 1)],
  term ((-1209916365281 : Rat) / 5995497312) [(9, 2), (11, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 202 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0202_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0202
        rs_R009_ueqv_R009YNNNN_generator_08_0200_0231 =
      rs_R009_ueqv_R009YNNNN_partial_08_0202 := by
  native_decide

/-- Coefficient term 203 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0203 : Poly :=
[
  term ((-9984 : Rat) / 553) [(10, 1)]
]

/-- Partial product 203 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0203 : Poly :=
[
  term ((19968 : Rat) / 553) [(0, 1), (2, 1), (10, 1)],
  term ((-19968 : Rat) / 553) [(0, 1), (10, 2)],
  term ((19968 : Rat) / 553) [(1, 1), (3, 1), (10, 1)],
  term ((-19968 : Rat) / 553) [(1, 1), (10, 1), (11, 1)],
  term ((-9984 : Rat) / 553) [(2, 2), (10, 1)],
  term ((-9984 : Rat) / 553) [(3, 2), (10, 1)],
  term ((9984 : Rat) / 553) [(10, 1), (11, 2)],
  term ((9984 : Rat) / 553) [(10, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 203 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0203_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0203
        rs_R009_ueqv_R009YNNNN_generator_08_0200_0231 =
      rs_R009_ueqv_R009YNNNN_partial_08_0203 := by
  native_decide

/-- Coefficient term 204 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0204 : Poly :=
[
  term ((645098127729415 : Rat) / 932487191307) [(10, 1), (11, 1), (15, 1)]
]

/-- Partial product 204 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0204 : Poly :=
[
  term ((-1290196255458830 : Rat) / 932487191307) [(0, 1), (2, 1), (10, 1), (11, 1), (15, 1)],
  term ((1290196255458830 : Rat) / 932487191307) [(0, 1), (10, 2), (11, 1), (15, 1)],
  term ((-1290196255458830 : Rat) / 932487191307) [(1, 1), (3, 1), (10, 1), (11, 1), (15, 1)],
  term ((1290196255458830 : Rat) / 932487191307) [(1, 1), (10, 1), (11, 2), (15, 1)],
  term ((645098127729415 : Rat) / 932487191307) [(2, 2), (10, 1), (11, 1), (15, 1)],
  term ((645098127729415 : Rat) / 932487191307) [(3, 2), (10, 1), (11, 1), (15, 1)],
  term ((-645098127729415 : Rat) / 932487191307) [(10, 1), (11, 3), (15, 1)],
  term ((-645098127729415 : Rat) / 932487191307) [(10, 3), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 204 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0204_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0204
        rs_R009_ueqv_R009YNNNN_generator_08_0200_0231 =
      rs_R009_ueqv_R009YNNNN_partial_08_0204 := by
  native_decide

/-- Coefficient term 205 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0205 : Poly :=
[
  term ((-623465237564147 : Rat) / 913456840464) [(10, 1), (13, 1), (15, 1)]
]

/-- Partial product 205 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0205 : Poly :=
[
  term ((623465237564147 : Rat) / 456728420232) [(0, 1), (2, 1), (10, 1), (13, 1), (15, 1)],
  term ((-623465237564147 : Rat) / 456728420232) [(0, 1), (10, 2), (13, 1), (15, 1)],
  term ((623465237564147 : Rat) / 456728420232) [(1, 1), (3, 1), (10, 1), (13, 1), (15, 1)],
  term ((-623465237564147 : Rat) / 456728420232) [(1, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-623465237564147 : Rat) / 913456840464) [(2, 2), (10, 1), (13, 1), (15, 1)],
  term ((-623465237564147 : Rat) / 913456840464) [(3, 2), (10, 1), (13, 1), (15, 1)],
  term ((623465237564147 : Rat) / 913456840464) [(10, 1), (11, 2), (13, 1), (15, 1)],
  term ((623465237564147 : Rat) / 913456840464) [(10, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 205 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0205_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0205
        rs_R009_ueqv_R009YNNNN_generator_08_0200_0231 =
      rs_R009_ueqv_R009YNNNN_partial_08_0205 := by
  native_decide

/-- Coefficient term 206 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0206 : Poly :=
[
  term ((10985 : Rat) / 504) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 206 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0206 : Poly :=
[
  term ((-10985 : Rat) / 252) [(0, 1), (2, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((10985 : Rat) / 252) [(0, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-10985 : Rat) / 252) [(1, 1), (3, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((10985 : Rat) / 252) [(1, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((10985 : Rat) / 504) [(2, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((10985 : Rat) / 504) [(3, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-10985 : Rat) / 504) [(10, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-10985 : Rat) / 504) [(10, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 206 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0206_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0206
        rs_R009_ueqv_R009YNNNN_generator_08_0200_0231 =
      rs_R009_ueqv_R009YNNNN_partial_08_0206 := by
  native_decide

/-- Coefficient term 207 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0207 : Poly :=
[
  term ((-3968051523467 : Rat) / 88808303934) [(10, 1), (14, 1)]
]

/-- Partial product 207 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0207 : Poly :=
[
  term ((3968051523467 : Rat) / 44404151967) [(0, 1), (2, 1), (10, 1), (14, 1)],
  term ((-3968051523467 : Rat) / 44404151967) [(0, 1), (10, 2), (14, 1)],
  term ((3968051523467 : Rat) / 44404151967) [(1, 1), (3, 1), (10, 1), (14, 1)],
  term ((-3968051523467 : Rat) / 44404151967) [(1, 1), (10, 1), (11, 1), (14, 1)],
  term ((-3968051523467 : Rat) / 88808303934) [(2, 2), (10, 1), (14, 1)],
  term ((-3968051523467 : Rat) / 88808303934) [(3, 2), (10, 1), (14, 1)],
  term ((3968051523467 : Rat) / 88808303934) [(10, 1), (11, 2), (14, 1)],
  term ((3968051523467 : Rat) / 88808303934) [(10, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 207 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0207_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0207
        rs_R009_ueqv_R009YNNNN_generator_08_0200_0231 =
      rs_R009_ueqv_R009YNNNN_partial_08_0207 := by
  native_decide

/-- Coefficient term 208 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0208 : Poly :=
[
  term ((618151682419606 : Rat) / 932487191307) [(10, 1), (15, 2)]
]

/-- Partial product 208 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0208 : Poly :=
[
  term ((-1236303364839212 : Rat) / 932487191307) [(0, 1), (2, 1), (10, 1), (15, 2)],
  term ((1236303364839212 : Rat) / 932487191307) [(0, 1), (10, 2), (15, 2)],
  term ((-1236303364839212 : Rat) / 932487191307) [(1, 1), (3, 1), (10, 1), (15, 2)],
  term ((1236303364839212 : Rat) / 932487191307) [(1, 1), (10, 1), (11, 1), (15, 2)],
  term ((618151682419606 : Rat) / 932487191307) [(2, 2), (10, 1), (15, 2)],
  term ((618151682419606 : Rat) / 932487191307) [(3, 2), (10, 1), (15, 2)],
  term ((-618151682419606 : Rat) / 932487191307) [(10, 1), (11, 2), (15, 2)],
  term ((-618151682419606 : Rat) / 932487191307) [(10, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 208 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0208_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0208
        rs_R009_ueqv_R009YNNNN_generator_08_0200_0231 =
      rs_R009_ueqv_R009YNNNN_partial_08_0208 := by
  native_decide

/-- Coefficient term 209 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0209 : Poly :=
[
  term ((-311 : Rat) / 18) [(10, 1), (15, 2), (16, 1)]
]

/-- Partial product 209 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0209 : Poly :=
[
  term ((311 : Rat) / 9) [(0, 1), (2, 1), (10, 1), (15, 2), (16, 1)],
  term ((-311 : Rat) / 9) [(0, 1), (10, 2), (15, 2), (16, 1)],
  term ((311 : Rat) / 9) [(1, 1), (3, 1), (10, 1), (15, 2), (16, 1)],
  term ((-311 : Rat) / 9) [(1, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-311 : Rat) / 18) [(2, 2), (10, 1), (15, 2), (16, 1)],
  term ((-311 : Rat) / 18) [(3, 2), (10, 1), (15, 2), (16, 1)],
  term ((311 : Rat) / 18) [(10, 1), (11, 2), (15, 2), (16, 1)],
  term ((311 : Rat) / 18) [(10, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 209 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0209_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0209
        rs_R009_ueqv_R009YNNNN_generator_08_0200_0231 =
      rs_R009_ueqv_R009YNNNN_partial_08_0209 := by
  native_decide

/-- Coefficient term 210 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0210 : Poly :=
[
  term ((-7651499822842913 : Rat) / 104438565426384) [(11, 1), (13, 1)]
]

/-- Partial product 210 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0210 : Poly :=
[
  term ((7651499822842913 : Rat) / 52219282713192) [(0, 1), (2, 1), (11, 1), (13, 1)],
  term ((-7651499822842913 : Rat) / 52219282713192) [(0, 1), (10, 1), (11, 1), (13, 1)],
  term ((7651499822842913 : Rat) / 52219282713192) [(1, 1), (3, 1), (11, 1), (13, 1)],
  term ((-7651499822842913 : Rat) / 52219282713192) [(1, 1), (11, 2), (13, 1)],
  term ((-7651499822842913 : Rat) / 104438565426384) [(2, 2), (11, 1), (13, 1)],
  term ((-7651499822842913 : Rat) / 104438565426384) [(3, 2), (11, 1), (13, 1)],
  term ((7651499822842913 : Rat) / 104438565426384) [(10, 2), (11, 1), (13, 1)],
  term ((7651499822842913 : Rat) / 104438565426384) [(11, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 210 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0210_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0210
        rs_R009_ueqv_R009YNNNN_generator_08_0200_0231 =
      rs_R009_ueqv_R009YNNNN_partial_08_0210 := by
  native_decide

/-- Coefficient term 211 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0211 : Poly :=
[
  term ((623465237564147 : Rat) / 913456840464) [(11, 1), (13, 1), (14, 1)]
]

/-- Partial product 211 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0211 : Poly :=
[
  term ((-623465237564147 : Rat) / 456728420232) [(0, 1), (2, 1), (11, 1), (13, 1), (14, 1)],
  term ((623465237564147 : Rat) / 456728420232) [(0, 1), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((-623465237564147 : Rat) / 456728420232) [(1, 1), (3, 1), (11, 1), (13, 1), (14, 1)],
  term ((623465237564147 : Rat) / 456728420232) [(1, 1), (11, 2), (13, 1), (14, 1)],
  term ((623465237564147 : Rat) / 913456840464) [(2, 2), (11, 1), (13, 1), (14, 1)],
  term ((623465237564147 : Rat) / 913456840464) [(3, 2), (11, 1), (13, 1), (14, 1)],
  term ((-623465237564147 : Rat) / 913456840464) [(10, 2), (11, 1), (13, 1), (14, 1)],
  term ((-623465237564147 : Rat) / 913456840464) [(11, 3), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 211 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0211_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0211
        rs_R009_ueqv_R009YNNNN_generator_08_0200_0231 =
      rs_R009_ueqv_R009YNNNN_partial_08_0211 := by
  native_decide

/-- Coefficient term 212 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0212 : Poly :=
[
  term ((-10985 : Rat) / 504) [(11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 212 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0212 : Poly :=
[
  term ((10985 : Rat) / 252) [(0, 1), (2, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-10985 : Rat) / 252) [(0, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((10985 : Rat) / 252) [(1, 1), (3, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-10985 : Rat) / 252) [(1, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((-10985 : Rat) / 504) [(2, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-10985 : Rat) / 504) [(3, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((10985 : Rat) / 504) [(10, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((10985 : Rat) / 504) [(11, 3), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 212 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0212_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0212
        rs_R009_ueqv_R009YNNNN_generator_08_0200_0231 =
      rs_R009_ueqv_R009YNNNN_partial_08_0212 := by
  native_decide

/-- Coefficient term 213 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0213 : Poly :=
[
  term ((-305 : Rat) / 56) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 213 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0213 : Poly :=
[
  term ((305 : Rat) / 28) [(0, 1), (2, 1), (11, 1), (13, 1), (16, 1)],
  term ((-305 : Rat) / 28) [(0, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((305 : Rat) / 28) [(1, 1), (3, 1), (11, 1), (13, 1), (16, 1)],
  term ((-305 : Rat) / 28) [(1, 1), (11, 2), (13, 1), (16, 1)],
  term ((-305 : Rat) / 56) [(2, 2), (11, 1), (13, 1), (16, 1)],
  term ((-305 : Rat) / 56) [(3, 2), (11, 1), (13, 1), (16, 1)],
  term ((305 : Rat) / 56) [(10, 2), (11, 1), (13, 1), (16, 1)],
  term ((305 : Rat) / 56) [(11, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 213 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0213_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0213
        rs_R009_ueqv_R009YNNNN_generator_08_0200_0231 =
      rs_R009_ueqv_R009YNNNN_partial_08_0213 := by
  native_decide

/-- Coefficient term 214 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0214 : Poly :=
[
  term ((-2493721871115877 : Rat) / 967023753948) [(11, 1), (14, 1), (15, 1)]
]

/-- Partial product 214 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0214 : Poly :=
[
  term ((2493721871115877 : Rat) / 483511876974) [(0, 1), (2, 1), (11, 1), (14, 1), (15, 1)],
  term ((-2493721871115877 : Rat) / 483511876974) [(0, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((2493721871115877 : Rat) / 483511876974) [(1, 1), (3, 1), (11, 1), (14, 1), (15, 1)],
  term ((-2493721871115877 : Rat) / 483511876974) [(1, 1), (11, 2), (14, 1), (15, 1)],
  term ((-2493721871115877 : Rat) / 967023753948) [(2, 2), (11, 1), (14, 1), (15, 1)],
  term ((-2493721871115877 : Rat) / 967023753948) [(3, 2), (11, 1), (14, 1), (15, 1)],
  term ((2493721871115877 : Rat) / 967023753948) [(10, 2), (11, 1), (14, 1), (15, 1)],
  term ((2493721871115877 : Rat) / 967023753948) [(11, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 214 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0214_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0214
        rs_R009_ueqv_R009YNNNN_generator_08_0200_0231 =
      rs_R009_ueqv_R009YNNNN_partial_08_0214 := by
  native_decide

/-- Coefficient term 215 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0215 : Poly :=
[
  term ((311 : Rat) / 18) [(11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 215 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0215 : Poly :=
[
  term ((-311 : Rat) / 9) [(0, 1), (2, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((311 : Rat) / 9) [(0, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-311 : Rat) / 9) [(1, 1), (3, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((311 : Rat) / 9) [(1, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((311 : Rat) / 18) [(2, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((311 : Rat) / 18) [(3, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-311 : Rat) / 18) [(10, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-311 : Rat) / 18) [(11, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 215 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0215_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0215
        rs_R009_ueqv_R009YNNNN_generator_08_0200_0231 =
      rs_R009_ueqv_R009YNNNN_partial_08_0215 := by
  native_decide

/-- Coefficient term 216 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0216 : Poly :=
[
  term ((-1277785343964475 : Rat) / 17406427571064) [(11, 1), (15, 1)]
]

/-- Partial product 216 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0216 : Poly :=
[
  term ((1277785343964475 : Rat) / 8703213785532) [(0, 1), (2, 1), (11, 1), (15, 1)],
  term ((-1277785343964475 : Rat) / 8703213785532) [(0, 1), (10, 1), (11, 1), (15, 1)],
  term ((1277785343964475 : Rat) / 8703213785532) [(1, 1), (3, 1), (11, 1), (15, 1)],
  term ((-1277785343964475 : Rat) / 8703213785532) [(1, 1), (11, 2), (15, 1)],
  term ((-1277785343964475 : Rat) / 17406427571064) [(2, 2), (11, 1), (15, 1)],
  term ((-1277785343964475 : Rat) / 17406427571064) [(3, 2), (11, 1), (15, 1)],
  term ((1277785343964475 : Rat) / 17406427571064) [(10, 2), (11, 1), (15, 1)],
  term ((1277785343964475 : Rat) / 17406427571064) [(11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 216 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0216_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0216
        rs_R009_ueqv_R009YNNNN_generator_08_0200_0231 =
      rs_R009_ueqv_R009YNNNN_partial_08_0216 := by
  native_decide

/-- Coefficient term 217 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0217 : Poly :=
[
  term ((65 : Rat) / 14) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 217 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0217 : Poly :=
[
  term ((-65 : Rat) / 7) [(0, 1), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((65 : Rat) / 7) [(0, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-65 : Rat) / 7) [(1, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((65 : Rat) / 7) [(1, 1), (11, 2), (15, 1), (16, 1)],
  term ((65 : Rat) / 14) [(2, 2), (11, 1), (15, 1), (16, 1)],
  term ((65 : Rat) / 14) [(3, 2), (11, 1), (15, 1), (16, 1)],
  term ((-65 : Rat) / 14) [(10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-65 : Rat) / 14) [(11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 217 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0217_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0217
        rs_R009_ueqv_R009YNNNN_generator_08_0200_0231 =
      rs_R009_ueqv_R009YNNNN_partial_08_0217 := by
  native_decide

/-- Coefficient term 218 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0218 : Poly :=
[
  term ((-59904 : Rat) / 553) [(11, 2)]
]

/-- Partial product 218 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0218 : Poly :=
[
  term ((119808 : Rat) / 553) [(0, 1), (2, 1), (11, 2)],
  term ((-119808 : Rat) / 553) [(0, 1), (10, 1), (11, 2)],
  term ((119808 : Rat) / 553) [(1, 1), (3, 1), (11, 2)],
  term ((-119808 : Rat) / 553) [(1, 1), (11, 3)],
  term ((-59904 : Rat) / 553) [(2, 2), (11, 2)],
  term ((-59904 : Rat) / 553) [(3, 2), (11, 2)],
  term ((59904 : Rat) / 553) [(10, 2), (11, 2)],
  term ((59904 : Rat) / 553) [(11, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 218 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0218_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0218
        rs_R009_ueqv_R009YNNNN_generator_08_0200_0231 =
      rs_R009_ueqv_R009YNNNN_partial_08_0218 := by
  native_decide

/-- Coefficient term 219 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0219 : Poly :=
[
  term ((-645098127729415 : Rat) / 932487191307) [(11, 2), (14, 1)]
]

/-- Partial product 219 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0219 : Poly :=
[
  term ((1290196255458830 : Rat) / 932487191307) [(0, 1), (2, 1), (11, 2), (14, 1)],
  term ((-1290196255458830 : Rat) / 932487191307) [(0, 1), (10, 1), (11, 2), (14, 1)],
  term ((1290196255458830 : Rat) / 932487191307) [(1, 1), (3, 1), (11, 2), (14, 1)],
  term ((-1290196255458830 : Rat) / 932487191307) [(1, 1), (11, 3), (14, 1)],
  term ((-645098127729415 : Rat) / 932487191307) [(2, 2), (11, 2), (14, 1)],
  term ((-645098127729415 : Rat) / 932487191307) [(3, 2), (11, 2), (14, 1)],
  term ((645098127729415 : Rat) / 932487191307) [(10, 2), (11, 2), (14, 1)],
  term ((645098127729415 : Rat) / 932487191307) [(11, 4), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 219 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0219_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0219
        rs_R009_ueqv_R009YNNNN_generator_08_0200_0231 =
      rs_R009_ueqv_R009YNNNN_partial_08_0219 := by
  native_decide

/-- Coefficient term 220 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0220 : Poly :=
[
  term ((-80463466287596191 : Rat) / 156657848139576) [(13, 1), (14, 1), (15, 1)]
]

/-- Partial product 220 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0220 : Poly :=
[
  term ((80463466287596191 : Rat) / 78328924069788) [(0, 1), (2, 1), (13, 1), (14, 1), (15, 1)],
  term ((-80463466287596191 : Rat) / 78328924069788) [(0, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((80463466287596191 : Rat) / 78328924069788) [(1, 1), (3, 1), (13, 1), (14, 1), (15, 1)],
  term ((-80463466287596191 : Rat) / 78328924069788) [(1, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-80463466287596191 : Rat) / 156657848139576) [(2, 2), (13, 1), (14, 1), (15, 1)],
  term ((-80463466287596191 : Rat) / 156657848139576) [(3, 2), (13, 1), (14, 1), (15, 1)],
  term ((80463466287596191 : Rat) / 156657848139576) [(10, 2), (13, 1), (14, 1), (15, 1)],
  term ((80463466287596191 : Rat) / 156657848139576) [(11, 2), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 220 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0220_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0220
        rs_R009_ueqv_R009YNNNN_generator_08_0200_0231 =
      rs_R009_ueqv_R009YNNNN_partial_08_0220 := by
  native_decide

/-- Coefficient term 221 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0221 : Poly :=
[
  term ((-1745 : Rat) / 252) [(13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 221 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0221 : Poly :=
[
  term ((1745 : Rat) / 126) [(0, 1), (2, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1745 : Rat) / 126) [(0, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1745 : Rat) / 126) [(1, 1), (3, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1745 : Rat) / 126) [(1, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1745 : Rat) / 252) [(2, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1745 : Rat) / 252) [(3, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1745 : Rat) / 252) [(10, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1745 : Rat) / 252) [(11, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 221 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0221_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0221
        rs_R009_ueqv_R009YNNNN_generator_08_0200_0231 =
      rs_R009_ueqv_R009YNNNN_partial_08_0221 := by
  native_decide

/-- Coefficient term 222 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0222 : Poly :=
[
  term ((-11479226768967563 : Rat) / 14919795060912) [(13, 1), (15, 1)]
]

/-- Partial product 222 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0222 : Poly :=
[
  term ((11479226768967563 : Rat) / 7459897530456) [(0, 1), (2, 1), (13, 1), (15, 1)],
  term ((-11479226768967563 : Rat) / 7459897530456) [(0, 1), (10, 1), (13, 1), (15, 1)],
  term ((11479226768967563 : Rat) / 7459897530456) [(1, 1), (3, 1), (13, 1), (15, 1)],
  term ((-11479226768967563 : Rat) / 7459897530456) [(1, 1), (11, 1), (13, 1), (15, 1)],
  term ((-11479226768967563 : Rat) / 14919795060912) [(2, 2), (13, 1), (15, 1)],
  term ((-11479226768967563 : Rat) / 14919795060912) [(3, 2), (13, 1), (15, 1)],
  term ((11479226768967563 : Rat) / 14919795060912) [(10, 2), (13, 1), (15, 1)],
  term ((11479226768967563 : Rat) / 14919795060912) [(11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 222 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0222_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0222
        rs_R009_ueqv_R009YNNNN_generator_08_0200_0231 =
      rs_R009_ueqv_R009YNNNN_partial_08_0222 := by
  native_decide

/-- Coefficient term 223 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0223 : Poly :=
[
  term ((23755 : Rat) / 504) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 223 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0223 : Poly :=
[
  term ((-23755 : Rat) / 252) [(0, 1), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((23755 : Rat) / 252) [(0, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-23755 : Rat) / 252) [(1, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((23755 : Rat) / 252) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((23755 : Rat) / 504) [(2, 2), (13, 1), (15, 1), (16, 1)],
  term ((23755 : Rat) / 504) [(3, 2), (13, 1), (15, 1), (16, 1)],
  term ((-23755 : Rat) / 504) [(10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-23755 : Rat) / 504) [(11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 223 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0223_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0223
        rs_R009_ueqv_R009YNNNN_generator_08_0200_0231 =
      rs_R009_ueqv_R009YNNNN_partial_08_0223 := by
  native_decide

/-- Coefficient term 224 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0224 : Poly :=
[
  term ((2596385212779769 : Rat) / 6394197883248) [(13, 2)]
]

/-- Partial product 224 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0224 : Poly :=
[
  term ((-2596385212779769 : Rat) / 3197098941624) [(0, 1), (2, 1), (13, 2)],
  term ((2596385212779769 : Rat) / 3197098941624) [(0, 1), (10, 1), (13, 2)],
  term ((-2596385212779769 : Rat) / 3197098941624) [(1, 1), (3, 1), (13, 2)],
  term ((2596385212779769 : Rat) / 3197098941624) [(1, 1), (11, 1), (13, 2)],
  term ((2596385212779769 : Rat) / 6394197883248) [(2, 2), (13, 2)],
  term ((2596385212779769 : Rat) / 6394197883248) [(3, 2), (13, 2)],
  term ((-2596385212779769 : Rat) / 6394197883248) [(10, 2), (13, 2)],
  term ((-2596385212779769 : Rat) / 6394197883248) [(11, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 224 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0224_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0224
        rs_R009_ueqv_R009YNNNN_generator_08_0200_0231 =
      rs_R009_ueqv_R009YNNNN_partial_08_0224 := by
  native_decide

/-- Coefficient term 225 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0225 : Poly :=
[
  term ((-7285 : Rat) / 504) [(13, 2), (16, 1)]
]

/-- Partial product 225 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0225 : Poly :=
[
  term ((7285 : Rat) / 252) [(0, 1), (2, 1), (13, 2), (16, 1)],
  term ((-7285 : Rat) / 252) [(0, 1), (10, 1), (13, 2), (16, 1)],
  term ((7285 : Rat) / 252) [(1, 1), (3, 1), (13, 2), (16, 1)],
  term ((-7285 : Rat) / 252) [(1, 1), (11, 1), (13, 2), (16, 1)],
  term ((-7285 : Rat) / 504) [(2, 2), (13, 2), (16, 1)],
  term ((-7285 : Rat) / 504) [(3, 2), (13, 2), (16, 1)],
  term ((7285 : Rat) / 504) [(10, 2), (13, 2), (16, 1)],
  term ((7285 : Rat) / 504) [(11, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 225 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0225_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0225
        rs_R009_ueqv_R009YNNNN_generator_08_0200_0231 =
      rs_R009_ueqv_R009YNNNN_partial_08_0225 := by
  native_decide

/-- Coefficient term 226 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0226 : Poly :=
[
  term ((-18503830616066851 : Rat) / 104438565426384) [(14, 1)]
]

/-- Partial product 226 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0226 : Poly :=
[
  term ((18503830616066851 : Rat) / 52219282713192) [(0, 1), (2, 1), (14, 1)],
  term ((-18503830616066851 : Rat) / 52219282713192) [(0, 1), (10, 1), (14, 1)],
  term ((18503830616066851 : Rat) / 52219282713192) [(1, 1), (3, 1), (14, 1)],
  term ((-18503830616066851 : Rat) / 52219282713192) [(1, 1), (11, 1), (14, 1)],
  term ((-18503830616066851 : Rat) / 104438565426384) [(2, 2), (14, 1)],
  term ((-18503830616066851 : Rat) / 104438565426384) [(3, 2), (14, 1)],
  term ((18503830616066851 : Rat) / 104438565426384) [(10, 2), (14, 1)],
  term ((18503830616066851 : Rat) / 104438565426384) [(11, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 226 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0226_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0226
        rs_R009_ueqv_R009YNNNN_generator_08_0200_0231 =
      rs_R009_ueqv_R009YNNNN_partial_08_0226 := by
  native_decide

/-- Coefficient term 227 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0227 : Poly :=
[
  term ((23349621713951129 : Rat) / 13054820678298) [(14, 1), (15, 2)]
]

/-- Partial product 227 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0227 : Poly :=
[
  term ((-23349621713951129 : Rat) / 6527410339149) [(0, 1), (2, 1), (14, 1), (15, 2)],
  term ((23349621713951129 : Rat) / 6527410339149) [(0, 1), (10, 1), (14, 1), (15, 2)],
  term ((-23349621713951129 : Rat) / 6527410339149) [(1, 1), (3, 1), (14, 1), (15, 2)],
  term ((23349621713951129 : Rat) / 6527410339149) [(1, 1), (11, 1), (14, 1), (15, 2)],
  term ((23349621713951129 : Rat) / 13054820678298) [(2, 2), (14, 1), (15, 2)],
  term ((23349621713951129 : Rat) / 13054820678298) [(3, 2), (14, 1), (15, 2)],
  term ((-23349621713951129 : Rat) / 13054820678298) [(10, 2), (14, 1), (15, 2)],
  term ((-23349621713951129 : Rat) / 13054820678298) [(11, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 227 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0227_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0227
        rs_R009_ueqv_R009YNNNN_generator_08_0200_0231 =
      rs_R009_ueqv_R009YNNNN_partial_08_0227 := by
  native_decide

/-- Coefficient term 228 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0228 : Poly :=
[
  term ((425 : Rat) / 63) [(14, 1), (15, 2), (16, 1)]
]

/-- Partial product 228 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0228 : Poly :=
[
  term ((-850 : Rat) / 63) [(0, 1), (2, 1), (14, 1), (15, 2), (16, 1)],
  term ((850 : Rat) / 63) [(0, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-850 : Rat) / 63) [(1, 1), (3, 1), (14, 1), (15, 2), (16, 1)],
  term ((850 : Rat) / 63) [(1, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((425 : Rat) / 63) [(2, 2), (14, 1), (15, 2), (16, 1)],
  term ((425 : Rat) / 63) [(3, 2), (14, 1), (15, 2), (16, 1)],
  term ((-425 : Rat) / 63) [(10, 2), (14, 1), (15, 2), (16, 1)],
  term ((-425 : Rat) / 63) [(11, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 228 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0228_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0228
        rs_R009_ueqv_R009YNNNN_generator_08_0200_0231 =
      rs_R009_ueqv_R009YNNNN_partial_08_0228 := by
  native_decide

/-- Coefficient term 229 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0229 : Poly :=
[
  term ((2431355462795051 : Rat) / 14919795060912) [(14, 2)]
]

/-- Partial product 229 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0229 : Poly :=
[
  term ((-2431355462795051 : Rat) / 7459897530456) [(0, 1), (2, 1), (14, 2)],
  term ((2431355462795051 : Rat) / 7459897530456) [(0, 1), (10, 1), (14, 2)],
  term ((-2431355462795051 : Rat) / 7459897530456) [(1, 1), (3, 1), (14, 2)],
  term ((2431355462795051 : Rat) / 7459897530456) [(1, 1), (11, 1), (14, 2)],
  term ((2431355462795051 : Rat) / 14919795060912) [(2, 2), (14, 2)],
  term ((2431355462795051 : Rat) / 14919795060912) [(3, 2), (14, 2)],
  term ((-2431355462795051 : Rat) / 14919795060912) [(10, 2), (14, 2)],
  term ((-2431355462795051 : Rat) / 14919795060912) [(11, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 229 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0229_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0229
        rs_R009_ueqv_R009YNNNN_generator_08_0200_0231 =
      rs_R009_ueqv_R009YNNNN_partial_08_0229 := by
  native_decide

/-- Coefficient term 230 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0230 : Poly :=
[
  term ((10774977888478831 : Rat) / 14919795060912) [(15, 2)]
]

/-- Partial product 230 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0230 : Poly :=
[
  term ((-10774977888478831 : Rat) / 7459897530456) [(0, 1), (2, 1), (15, 2)],
  term ((10774977888478831 : Rat) / 7459897530456) [(0, 1), (10, 1), (15, 2)],
  term ((-10774977888478831 : Rat) / 7459897530456) [(1, 1), (3, 1), (15, 2)],
  term ((10774977888478831 : Rat) / 7459897530456) [(1, 1), (11, 1), (15, 2)],
  term ((10774977888478831 : Rat) / 14919795060912) [(2, 2), (15, 2)],
  term ((10774977888478831 : Rat) / 14919795060912) [(3, 2), (15, 2)],
  term ((-10774977888478831 : Rat) / 14919795060912) [(10, 2), (15, 2)],
  term ((-10774977888478831 : Rat) / 14919795060912) [(11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 230 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0230_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0230
        rs_R009_ueqv_R009YNNNN_generator_08_0200_0231 =
      rs_R009_ueqv_R009YNNNN_partial_08_0230 := by
  native_decide

/-- Coefficient term 231 from coefficient polynomial 8. -/
def rs_R009_ueqv_R009YNNNN_coefficient_08_0231 : Poly :=
[
  term ((-415 : Rat) / 14) [(15, 2), (16, 1)]
]

/-- Partial product 231 for generator 8. -/
def rs_R009_ueqv_R009YNNNN_partial_08_0231 : Poly :=
[
  term ((415 : Rat) / 7) [(0, 1), (2, 1), (15, 2), (16, 1)],
  term ((-415 : Rat) / 7) [(0, 1), (10, 1), (15, 2), (16, 1)],
  term ((415 : Rat) / 7) [(1, 1), (3, 1), (15, 2), (16, 1)],
  term ((-415 : Rat) / 7) [(1, 1), (11, 1), (15, 2), (16, 1)],
  term ((-415 : Rat) / 14) [(2, 2), (15, 2), (16, 1)],
  term ((-415 : Rat) / 14) [(3, 2), (15, 2), (16, 1)],
  term ((415 : Rat) / 14) [(10, 2), (15, 2), (16, 1)],
  term ((415 : Rat) / 14) [(11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 231 for generator 8. -/
theorem rs_R009_ueqv_R009YNNNN_partial_08_0231_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_08_0231
        rs_R009_ueqv_R009YNNNN_generator_08_0200_0231 =
      rs_R009_ueqv_R009YNNNN_partial_08_0231 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009YNNNN_partials_08_0200_0231 : List Poly :=
[
  rs_R009_ueqv_R009YNNNN_partial_08_0200,
  rs_R009_ueqv_R009YNNNN_partial_08_0201,
  rs_R009_ueqv_R009YNNNN_partial_08_0202,
  rs_R009_ueqv_R009YNNNN_partial_08_0203,
  rs_R009_ueqv_R009YNNNN_partial_08_0204,
  rs_R009_ueqv_R009YNNNN_partial_08_0205,
  rs_R009_ueqv_R009YNNNN_partial_08_0206,
  rs_R009_ueqv_R009YNNNN_partial_08_0207,
  rs_R009_ueqv_R009YNNNN_partial_08_0208,
  rs_R009_ueqv_R009YNNNN_partial_08_0209,
  rs_R009_ueqv_R009YNNNN_partial_08_0210,
  rs_R009_ueqv_R009YNNNN_partial_08_0211,
  rs_R009_ueqv_R009YNNNN_partial_08_0212,
  rs_R009_ueqv_R009YNNNN_partial_08_0213,
  rs_R009_ueqv_R009YNNNN_partial_08_0214,
  rs_R009_ueqv_R009YNNNN_partial_08_0215,
  rs_R009_ueqv_R009YNNNN_partial_08_0216,
  rs_R009_ueqv_R009YNNNN_partial_08_0217,
  rs_R009_ueqv_R009YNNNN_partial_08_0218,
  rs_R009_ueqv_R009YNNNN_partial_08_0219,
  rs_R009_ueqv_R009YNNNN_partial_08_0220,
  rs_R009_ueqv_R009YNNNN_partial_08_0221,
  rs_R009_ueqv_R009YNNNN_partial_08_0222,
  rs_R009_ueqv_R009YNNNN_partial_08_0223,
  rs_R009_ueqv_R009YNNNN_partial_08_0224,
  rs_R009_ueqv_R009YNNNN_partial_08_0225,
  rs_R009_ueqv_R009YNNNN_partial_08_0226,
  rs_R009_ueqv_R009YNNNN_partial_08_0227,
  rs_R009_ueqv_R009YNNNN_partial_08_0228,
  rs_R009_ueqv_R009YNNNN_partial_08_0229,
  rs_R009_ueqv_R009YNNNN_partial_08_0230,
  rs_R009_ueqv_R009YNNNN_partial_08_0231
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009YNNNN_block_08_0200_0231 : Poly :=
[
  term ((128159902247 : Rat) / 2569498848) [(0, 1), (2, 1), (9, 2)],
  term ((-210703568101 : Rat) / 1498874328) [(0, 1), (2, 1), (9, 2), (10, 1)],
  term ((-1209916365281 : Rat) / 2997748656) [(0, 1), (2, 1), (9, 2), (14, 1)],
  term ((19968 : Rat) / 553) [(0, 1), (2, 1), (10, 1)],
  term ((-1290196255458830 : Rat) / 932487191307) [(0, 1), (2, 1), (10, 1), (11, 1), (15, 1)],
  term ((623465237564147 : Rat) / 456728420232) [(0, 1), (2, 1), (10, 1), (13, 1), (15, 1)],
  term ((-10985 : Rat) / 252) [(0, 1), (2, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((3968051523467 : Rat) / 44404151967) [(0, 1), (2, 1), (10, 1), (14, 1)],
  term ((-1236303364839212 : Rat) / 932487191307) [(0, 1), (2, 1), (10, 1), (15, 2)],
  term ((311 : Rat) / 9) [(0, 1), (2, 1), (10, 1), (15, 2), (16, 1)],
  term ((7651499822842913 : Rat) / 52219282713192) [(0, 1), (2, 1), (11, 1), (13, 1)],
  term ((-623465237564147 : Rat) / 456728420232) [(0, 1), (2, 1), (11, 1), (13, 1), (14, 1)],
  term ((10985 : Rat) / 252) [(0, 1), (2, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((305 : Rat) / 28) [(0, 1), (2, 1), (11, 1), (13, 1), (16, 1)],
  term ((2493721871115877 : Rat) / 483511876974) [(0, 1), (2, 1), (11, 1), (14, 1), (15, 1)],
  term ((-311 : Rat) / 9) [(0, 1), (2, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((1277785343964475 : Rat) / 8703213785532) [(0, 1), (2, 1), (11, 1), (15, 1)],
  term ((-65 : Rat) / 7) [(0, 1), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((119808 : Rat) / 553) [(0, 1), (2, 1), (11, 2)],
  term ((1290196255458830 : Rat) / 932487191307) [(0, 1), (2, 1), (11, 2), (14, 1)],
  term ((80463466287596191 : Rat) / 78328924069788) [(0, 1), (2, 1), (13, 1), (14, 1), (15, 1)],
  term ((1745 : Rat) / 126) [(0, 1), (2, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((11479226768967563 : Rat) / 7459897530456) [(0, 1), (2, 1), (13, 1), (15, 1)],
  term ((-23755 : Rat) / 252) [(0, 1), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2596385212779769 : Rat) / 3197098941624) [(0, 1), (2, 1), (13, 2)],
  term ((7285 : Rat) / 252) [(0, 1), (2, 1), (13, 2), (16, 1)],
  term ((18503830616066851 : Rat) / 52219282713192) [(0, 1), (2, 1), (14, 1)],
  term ((-23349621713951129 : Rat) / 6527410339149) [(0, 1), (2, 1), (14, 1), (15, 2)],
  term ((-850 : Rat) / 63) [(0, 1), (2, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2431355462795051 : Rat) / 7459897530456) [(0, 1), (2, 1), (14, 2)],
  term ((-10774977888478831 : Rat) / 7459897530456) [(0, 1), (2, 1), (15, 2)],
  term ((415 : Rat) / 7) [(0, 1), (2, 1), (15, 2), (16, 1)],
  term ((-128159902247 : Rat) / 2569498848) [(0, 1), (9, 2), (10, 1)],
  term ((1209916365281 : Rat) / 2997748656) [(0, 1), (9, 2), (10, 1), (14, 1)],
  term ((210703568101 : Rat) / 1498874328) [(0, 1), (9, 2), (10, 2)],
  term ((-7651499822842913 : Rat) / 52219282713192) [(0, 1), (10, 1), (11, 1), (13, 1)],
  term ((623465237564147 : Rat) / 456728420232) [(0, 1), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((-10985 : Rat) / 252) [(0, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-305 : Rat) / 28) [(0, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-2493721871115877 : Rat) / 483511876974) [(0, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((311 : Rat) / 9) [(0, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1277785343964475 : Rat) / 8703213785532) [(0, 1), (10, 1), (11, 1), (15, 1)],
  term ((65 : Rat) / 7) [(0, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-119808 : Rat) / 553) [(0, 1), (10, 1), (11, 2)],
  term ((-1290196255458830 : Rat) / 932487191307) [(0, 1), (10, 1), (11, 2), (14, 1)],
  term ((-80463466287596191 : Rat) / 78328924069788) [(0, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-1745 : Rat) / 126) [(0, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-11479226768967563 : Rat) / 7459897530456) [(0, 1), (10, 1), (13, 1), (15, 1)],
  term ((23755 : Rat) / 252) [(0, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((2596385212779769 : Rat) / 3197098941624) [(0, 1), (10, 1), (13, 2)],
  term ((-7285 : Rat) / 252) [(0, 1), (10, 1), (13, 2), (16, 1)],
  term ((-18503830616066851 : Rat) / 52219282713192) [(0, 1), (10, 1), (14, 1)],
  term ((23349621713951129 : Rat) / 6527410339149) [(0, 1), (10, 1), (14, 1), (15, 2)],
  term ((850 : Rat) / 63) [(0, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((2431355462795051 : Rat) / 7459897530456) [(0, 1), (10, 1), (14, 2)],
  term ((10774977888478831 : Rat) / 7459897530456) [(0, 1), (10, 1), (15, 2)],
  term ((-415 : Rat) / 7) [(0, 1), (10, 1), (15, 2), (16, 1)],
  term ((-19968 : Rat) / 553) [(0, 1), (10, 2)],
  term ((1290196255458830 : Rat) / 932487191307) [(0, 1), (10, 2), (11, 1), (15, 1)],
  term ((-623465237564147 : Rat) / 456728420232) [(0, 1), (10, 2), (13, 1), (15, 1)],
  term ((10985 : Rat) / 252) [(0, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-3968051523467 : Rat) / 44404151967) [(0, 1), (10, 2), (14, 1)],
  term ((1236303364839212 : Rat) / 932487191307) [(0, 1), (10, 2), (15, 2)],
  term ((-311 : Rat) / 9) [(0, 1), (10, 2), (15, 2), (16, 1)],
  term ((128159902247 : Rat) / 2569498848) [(1, 1), (3, 1), (9, 2)],
  term ((-210703568101 : Rat) / 1498874328) [(1, 1), (3, 1), (9, 2), (10, 1)],
  term ((-1209916365281 : Rat) / 2997748656) [(1, 1), (3, 1), (9, 2), (14, 1)],
  term ((19968 : Rat) / 553) [(1, 1), (3, 1), (10, 1)],
  term ((-1290196255458830 : Rat) / 932487191307) [(1, 1), (3, 1), (10, 1), (11, 1), (15, 1)],
  term ((623465237564147 : Rat) / 456728420232) [(1, 1), (3, 1), (10, 1), (13, 1), (15, 1)],
  term ((-10985 : Rat) / 252) [(1, 1), (3, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((3968051523467 : Rat) / 44404151967) [(1, 1), (3, 1), (10, 1), (14, 1)],
  term ((-1236303364839212 : Rat) / 932487191307) [(1, 1), (3, 1), (10, 1), (15, 2)],
  term ((311 : Rat) / 9) [(1, 1), (3, 1), (10, 1), (15, 2), (16, 1)],
  term ((7651499822842913 : Rat) / 52219282713192) [(1, 1), (3, 1), (11, 1), (13, 1)],
  term ((-623465237564147 : Rat) / 456728420232) [(1, 1), (3, 1), (11, 1), (13, 1), (14, 1)],
  term ((10985 : Rat) / 252) [(1, 1), (3, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((305 : Rat) / 28) [(1, 1), (3, 1), (11, 1), (13, 1), (16, 1)],
  term ((2493721871115877 : Rat) / 483511876974) [(1, 1), (3, 1), (11, 1), (14, 1), (15, 1)],
  term ((-311 : Rat) / 9) [(1, 1), (3, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((1277785343964475 : Rat) / 8703213785532) [(1, 1), (3, 1), (11, 1), (15, 1)],
  term ((-65 : Rat) / 7) [(1, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((119808 : Rat) / 553) [(1, 1), (3, 1), (11, 2)],
  term ((1290196255458830 : Rat) / 932487191307) [(1, 1), (3, 1), (11, 2), (14, 1)],
  term ((80463466287596191 : Rat) / 78328924069788) [(1, 1), (3, 1), (13, 1), (14, 1), (15, 1)],
  term ((1745 : Rat) / 126) [(1, 1), (3, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((11479226768967563 : Rat) / 7459897530456) [(1, 1), (3, 1), (13, 1), (15, 1)],
  term ((-23755 : Rat) / 252) [(1, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2596385212779769 : Rat) / 3197098941624) [(1, 1), (3, 1), (13, 2)],
  term ((7285 : Rat) / 252) [(1, 1), (3, 1), (13, 2), (16, 1)],
  term ((18503830616066851 : Rat) / 52219282713192) [(1, 1), (3, 1), (14, 1)],
  term ((-23349621713951129 : Rat) / 6527410339149) [(1, 1), (3, 1), (14, 1), (15, 2)],
  term ((-850 : Rat) / 63) [(1, 1), (3, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2431355462795051 : Rat) / 7459897530456) [(1, 1), (3, 1), (14, 2)],
  term ((-10774977888478831 : Rat) / 7459897530456) [(1, 1), (3, 1), (15, 2)],
  term ((415 : Rat) / 7) [(1, 1), (3, 1), (15, 2), (16, 1)],
  term ((210703568101 : Rat) / 1498874328) [(1, 1), (9, 2), (10, 1), (11, 1)],
  term ((-128159902247 : Rat) / 2569498848) [(1, 1), (9, 2), (11, 1)],
  term ((1209916365281 : Rat) / 2997748656) [(1, 1), (9, 2), (11, 1), (14, 1)],
  term ((-19968 : Rat) / 553) [(1, 1), (10, 1), (11, 1)],
  term ((-623465237564147 : Rat) / 456728420232) [(1, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((10985 : Rat) / 252) [(1, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3968051523467 : Rat) / 44404151967) [(1, 1), (10, 1), (11, 1), (14, 1)],
  term ((1236303364839212 : Rat) / 932487191307) [(1, 1), (10, 1), (11, 1), (15, 2)],
  term ((-311 : Rat) / 9) [(1, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((1290196255458830 : Rat) / 932487191307) [(1, 1), (10, 1), (11, 2), (15, 1)],
  term ((-80463466287596191 : Rat) / 78328924069788) [(1, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-1745 : Rat) / 126) [(1, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-11479226768967563 : Rat) / 7459897530456) [(1, 1), (11, 1), (13, 1), (15, 1)],
  term ((23755 : Rat) / 252) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((2596385212779769 : Rat) / 3197098941624) [(1, 1), (11, 1), (13, 2)],
  term ((-7285 : Rat) / 252) [(1, 1), (11, 1), (13, 2), (16, 1)],
  term ((-18503830616066851 : Rat) / 52219282713192) [(1, 1), (11, 1), (14, 1)],
  term ((23349621713951129 : Rat) / 6527410339149) [(1, 1), (11, 1), (14, 1), (15, 2)],
  term ((850 : Rat) / 63) [(1, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((2431355462795051 : Rat) / 7459897530456) [(1, 1), (11, 1), (14, 2)],
  term ((10774977888478831 : Rat) / 7459897530456) [(1, 1), (11, 1), (15, 2)],
  term ((-415 : Rat) / 7) [(1, 1), (11, 1), (15, 2), (16, 1)],
  term ((-7651499822842913 : Rat) / 52219282713192) [(1, 1), (11, 2), (13, 1)],
  term ((623465237564147 : Rat) / 456728420232) [(1, 1), (11, 2), (13, 1), (14, 1)],
  term ((-10985 : Rat) / 252) [(1, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((-305 : Rat) / 28) [(1, 1), (11, 2), (13, 1), (16, 1)],
  term ((-2493721871115877 : Rat) / 483511876974) [(1, 1), (11, 2), (14, 1), (15, 1)],
  term ((311 : Rat) / 9) [(1, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1277785343964475 : Rat) / 8703213785532) [(1, 1), (11, 2), (15, 1)],
  term ((65 : Rat) / 7) [(1, 1), (11, 2), (15, 1), (16, 1)],
  term ((-119808 : Rat) / 553) [(1, 1), (11, 3)],
  term ((-1290196255458830 : Rat) / 932487191307) [(1, 1), (11, 3), (14, 1)],
  term ((-128159902247 : Rat) / 5138997696) [(2, 2), (9, 2)],
  term ((210703568101 : Rat) / 2997748656) [(2, 2), (9, 2), (10, 1)],
  term ((1209916365281 : Rat) / 5995497312) [(2, 2), (9, 2), (14, 1)],
  term ((-9984 : Rat) / 553) [(2, 2), (10, 1)],
  term ((645098127729415 : Rat) / 932487191307) [(2, 2), (10, 1), (11, 1), (15, 1)],
  term ((-623465237564147 : Rat) / 913456840464) [(2, 2), (10, 1), (13, 1), (15, 1)],
  term ((10985 : Rat) / 504) [(2, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3968051523467 : Rat) / 88808303934) [(2, 2), (10, 1), (14, 1)],
  term ((618151682419606 : Rat) / 932487191307) [(2, 2), (10, 1), (15, 2)],
  term ((-311 : Rat) / 18) [(2, 2), (10, 1), (15, 2), (16, 1)],
  term ((-7651499822842913 : Rat) / 104438565426384) [(2, 2), (11, 1), (13, 1)],
  term ((623465237564147 : Rat) / 913456840464) [(2, 2), (11, 1), (13, 1), (14, 1)],
  term ((-10985 : Rat) / 504) [(2, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-305 : Rat) / 56) [(2, 2), (11, 1), (13, 1), (16, 1)],
  term ((-2493721871115877 : Rat) / 967023753948) [(2, 2), (11, 1), (14, 1), (15, 1)],
  term ((311 : Rat) / 18) [(2, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1277785343964475 : Rat) / 17406427571064) [(2, 2), (11, 1), (15, 1)],
  term ((65 : Rat) / 14) [(2, 2), (11, 1), (15, 1), (16, 1)],
  term ((-59904 : Rat) / 553) [(2, 2), (11, 2)],
  term ((-645098127729415 : Rat) / 932487191307) [(2, 2), (11, 2), (14, 1)],
  term ((-80463466287596191 : Rat) / 156657848139576) [(2, 2), (13, 1), (14, 1), (15, 1)],
  term ((-1745 : Rat) / 252) [(2, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-11479226768967563 : Rat) / 14919795060912) [(2, 2), (13, 1), (15, 1)],
  term ((23755 : Rat) / 504) [(2, 2), (13, 1), (15, 1), (16, 1)],
  term ((2596385212779769 : Rat) / 6394197883248) [(2, 2), (13, 2)],
  term ((-7285 : Rat) / 504) [(2, 2), (13, 2), (16, 1)],
  term ((-18503830616066851 : Rat) / 104438565426384) [(2, 2), (14, 1)],
  term ((23349621713951129 : Rat) / 13054820678298) [(2, 2), (14, 1), (15, 2)],
  term ((425 : Rat) / 63) [(2, 2), (14, 1), (15, 2), (16, 1)],
  term ((2431355462795051 : Rat) / 14919795060912) [(2, 2), (14, 2)],
  term ((10774977888478831 : Rat) / 14919795060912) [(2, 2), (15, 2)],
  term ((-415 : Rat) / 14) [(2, 2), (15, 2), (16, 1)],
  term ((-128159902247 : Rat) / 5138997696) [(3, 2), (9, 2)],
  term ((210703568101 : Rat) / 2997748656) [(3, 2), (9, 2), (10, 1)],
  term ((1209916365281 : Rat) / 5995497312) [(3, 2), (9, 2), (14, 1)],
  term ((-9984 : Rat) / 553) [(3, 2), (10, 1)],
  term ((645098127729415 : Rat) / 932487191307) [(3, 2), (10, 1), (11, 1), (15, 1)],
  term ((-623465237564147 : Rat) / 913456840464) [(3, 2), (10, 1), (13, 1), (15, 1)],
  term ((10985 : Rat) / 504) [(3, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3968051523467 : Rat) / 88808303934) [(3, 2), (10, 1), (14, 1)],
  term ((618151682419606 : Rat) / 932487191307) [(3, 2), (10, 1), (15, 2)],
  term ((-311 : Rat) / 18) [(3, 2), (10, 1), (15, 2), (16, 1)],
  term ((-7651499822842913 : Rat) / 104438565426384) [(3, 2), (11, 1), (13, 1)],
  term ((623465237564147 : Rat) / 913456840464) [(3, 2), (11, 1), (13, 1), (14, 1)],
  term ((-10985 : Rat) / 504) [(3, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-305 : Rat) / 56) [(3, 2), (11, 1), (13, 1), (16, 1)],
  term ((-2493721871115877 : Rat) / 967023753948) [(3, 2), (11, 1), (14, 1), (15, 1)],
  term ((311 : Rat) / 18) [(3, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1277785343964475 : Rat) / 17406427571064) [(3, 2), (11, 1), (15, 1)],
  term ((65 : Rat) / 14) [(3, 2), (11, 1), (15, 1), (16, 1)],
  term ((-59904 : Rat) / 553) [(3, 2), (11, 2)],
  term ((-645098127729415 : Rat) / 932487191307) [(3, 2), (11, 2), (14, 1)],
  term ((-80463466287596191 : Rat) / 156657848139576) [(3, 2), (13, 1), (14, 1), (15, 1)],
  term ((-1745 : Rat) / 252) [(3, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-11479226768967563 : Rat) / 14919795060912) [(3, 2), (13, 1), (15, 1)],
  term ((23755 : Rat) / 504) [(3, 2), (13, 1), (15, 1), (16, 1)],
  term ((2596385212779769 : Rat) / 6394197883248) [(3, 2), (13, 2)],
  term ((-7285 : Rat) / 504) [(3, 2), (13, 2), (16, 1)],
  term ((-18503830616066851 : Rat) / 104438565426384) [(3, 2), (14, 1)],
  term ((23349621713951129 : Rat) / 13054820678298) [(3, 2), (14, 1), (15, 2)],
  term ((425 : Rat) / 63) [(3, 2), (14, 1), (15, 2), (16, 1)],
  term ((2431355462795051 : Rat) / 14919795060912) [(3, 2), (14, 2)],
  term ((10774977888478831 : Rat) / 14919795060912) [(3, 2), (15, 2)],
  term ((-415 : Rat) / 14) [(3, 2), (15, 2), (16, 1)],
  term ((-210703568101 : Rat) / 2997748656) [(9, 2), (10, 1), (11, 2)],
  term ((128159902247 : Rat) / 5138997696) [(9, 2), (10, 2)],
  term ((-1209916365281 : Rat) / 5995497312) [(9, 2), (10, 2), (14, 1)],
  term ((-210703568101 : Rat) / 2997748656) [(9, 2), (10, 3)],
  term ((128159902247 : Rat) / 5138997696) [(9, 2), (11, 2)],
  term ((-1209916365281 : Rat) / 5995497312) [(9, 2), (11, 2), (14, 1)],
  term ((9984 : Rat) / 553) [(10, 1), (11, 2)],
  term ((623465237564147 : Rat) / 913456840464) [(10, 1), (11, 2), (13, 1), (15, 1)],
  term ((-10985 : Rat) / 504) [(10, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((3968051523467 : Rat) / 88808303934) [(10, 1), (11, 2), (14, 1)],
  term ((-618151682419606 : Rat) / 932487191307) [(10, 1), (11, 2), (15, 2)],
  term ((311 : Rat) / 18) [(10, 1), (11, 2), (15, 2), (16, 1)],
  term ((-645098127729415 : Rat) / 932487191307) [(10, 1), (11, 3), (15, 1)],
  term ((7651499822842913 : Rat) / 104438565426384) [(10, 2), (11, 1), (13, 1)],
  term ((-623465237564147 : Rat) / 913456840464) [(10, 2), (11, 1), (13, 1), (14, 1)],
  term ((10985 : Rat) / 504) [(10, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((305 : Rat) / 56) [(10, 2), (11, 1), (13, 1), (16, 1)],
  term ((2493721871115877 : Rat) / 967023753948) [(10, 2), (11, 1), (14, 1), (15, 1)],
  term ((-311 : Rat) / 18) [(10, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((1277785343964475 : Rat) / 17406427571064) [(10, 2), (11, 1), (15, 1)],
  term ((-65 : Rat) / 14) [(10, 2), (11, 1), (15, 1), (16, 1)],
  term ((59904 : Rat) / 553) [(10, 2), (11, 2)],
  term ((645098127729415 : Rat) / 932487191307) [(10, 2), (11, 2), (14, 1)],
  term ((80463466287596191 : Rat) / 156657848139576) [(10, 2), (13, 1), (14, 1), (15, 1)],
  term ((1745 : Rat) / 252) [(10, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((11479226768967563 : Rat) / 14919795060912) [(10, 2), (13, 1), (15, 1)],
  term ((-23755 : Rat) / 504) [(10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-2596385212779769 : Rat) / 6394197883248) [(10, 2), (13, 2)],
  term ((7285 : Rat) / 504) [(10, 2), (13, 2), (16, 1)],
  term ((18503830616066851 : Rat) / 104438565426384) [(10, 2), (14, 1)],
  term ((-23349621713951129 : Rat) / 13054820678298) [(10, 2), (14, 1), (15, 2)],
  term ((-425 : Rat) / 63) [(10, 2), (14, 1), (15, 2), (16, 1)],
  term ((-2431355462795051 : Rat) / 14919795060912) [(10, 2), (14, 2)],
  term ((-10774977888478831 : Rat) / 14919795060912) [(10, 2), (15, 2)],
  term ((415 : Rat) / 14) [(10, 2), (15, 2), (16, 1)],
  term ((9984 : Rat) / 553) [(10, 3)],
  term ((-645098127729415 : Rat) / 932487191307) [(10, 3), (11, 1), (15, 1)],
  term ((623465237564147 : Rat) / 913456840464) [(10, 3), (13, 1), (15, 1)],
  term ((-10985 : Rat) / 504) [(10, 3), (13, 1), (15, 1), (16, 1)],
  term ((3968051523467 : Rat) / 88808303934) [(10, 3), (14, 1)],
  term ((-618151682419606 : Rat) / 932487191307) [(10, 3), (15, 2)],
  term ((311 : Rat) / 18) [(10, 3), (15, 2), (16, 1)],
  term ((80463466287596191 : Rat) / 156657848139576) [(11, 2), (13, 1), (14, 1), (15, 1)],
  term ((1745 : Rat) / 252) [(11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((11479226768967563 : Rat) / 14919795060912) [(11, 2), (13, 1), (15, 1)],
  term ((-23755 : Rat) / 504) [(11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-2596385212779769 : Rat) / 6394197883248) [(11, 2), (13, 2)],
  term ((7285 : Rat) / 504) [(11, 2), (13, 2), (16, 1)],
  term ((18503830616066851 : Rat) / 104438565426384) [(11, 2), (14, 1)],
  term ((-23349621713951129 : Rat) / 13054820678298) [(11, 2), (14, 1), (15, 2)],
  term ((-425 : Rat) / 63) [(11, 2), (14, 1), (15, 2), (16, 1)],
  term ((-2431355462795051 : Rat) / 14919795060912) [(11, 2), (14, 2)],
  term ((-10774977888478831 : Rat) / 14919795060912) [(11, 2), (15, 2)],
  term ((415 : Rat) / 14) [(11, 2), (15, 2), (16, 1)],
  term ((7651499822842913 : Rat) / 104438565426384) [(11, 3), (13, 1)],
  term ((-623465237564147 : Rat) / 913456840464) [(11, 3), (13, 1), (14, 1)],
  term ((10985 : Rat) / 504) [(11, 3), (13, 1), (14, 1), (16, 1)],
  term ((305 : Rat) / 56) [(11, 3), (13, 1), (16, 1)],
  term ((2493721871115877 : Rat) / 967023753948) [(11, 3), (14, 1), (15, 1)],
  term ((-311 : Rat) / 18) [(11, 3), (14, 1), (15, 1), (16, 1)],
  term ((1277785343964475 : Rat) / 17406427571064) [(11, 3), (15, 1)],
  term ((-65 : Rat) / 14) [(11, 3), (15, 1), (16, 1)],
  term ((59904 : Rat) / 553) [(11, 4)],
  term ((645098127729415 : Rat) / 932487191307) [(11, 4), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 8, terms 200 through 231. -/
theorem rs_R009_ueqv_R009YNNNN_block_08_0200_0231_valid :
    checkProductSumEq rs_R009_ueqv_R009YNNNN_partials_08_0200_0231
      rs_R009_ueqv_R009YNNNN_block_08_0200_0231 = true := by
  native_decide

end R009UeqvR009YNNNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
