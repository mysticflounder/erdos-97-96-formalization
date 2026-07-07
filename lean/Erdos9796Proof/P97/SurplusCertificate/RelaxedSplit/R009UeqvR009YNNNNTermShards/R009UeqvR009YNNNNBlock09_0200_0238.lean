/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009YNNNN, term block 9:200-238

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009YNNNNTermShards

/-- Generator polynomial 9 for relaxed split surplus certificate `R009:u=v:R009YNNNN`. -/
def rs_R009_ueqv_R009YNNNN_generator_09_0200_0238 : Poly :=
[
  term (-2 : Rat) [(0, 1), (2, 1)],
  term (2 : Rat) [(0, 1), (12, 1)],
  term (-2 : Rat) [(1, 1), (3, 1)],
  term (2 : Rat) [(1, 1), (13, 1)],
  term (1 : Rat) [(2, 2)],
  term (1 : Rat) [(3, 2)],
  term (-1 : Rat) [(12, 2)],
  term (-1 : Rat) [(13, 2)]
]

/-- Coefficient term 200 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YNNNN_coefficient_09_0200 : Poly :=
[
  term ((-2845284778971053 : Rat) / 3653827361856) [(9, 1), (15, 1)]
]

/-- Partial product 200 for generator 9. -/
def rs_R009_ueqv_R009YNNNN_partial_09_0200 : Poly :=
[
  term ((2845284778971053 : Rat) / 1826913680928) [(0, 1), (2, 1), (9, 1), (15, 1)],
  term ((-2845284778971053 : Rat) / 1826913680928) [(0, 1), (9, 1), (12, 1), (15, 1)],
  term ((2845284778971053 : Rat) / 1826913680928) [(1, 1), (3, 1), (9, 1), (15, 1)],
  term ((-2845284778971053 : Rat) / 1826913680928) [(1, 1), (9, 1), (13, 1), (15, 1)],
  term ((-2845284778971053 : Rat) / 3653827361856) [(2, 2), (9, 1), (15, 1)],
  term ((-2845284778971053 : Rat) / 3653827361856) [(3, 2), (9, 1), (15, 1)],
  term ((2845284778971053 : Rat) / 3653827361856) [(9, 1), (12, 2), (15, 1)],
  term ((2845284778971053 : Rat) / 3653827361856) [(9, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 200 for generator 9. -/
theorem rs_R009_ueqv_R009YNNNN_partial_09_0200_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_09_0200
        rs_R009_ueqv_R009YNNNN_generator_09_0200_0238 =
      rs_R009_ueqv_R009YNNNN_partial_09_0200 := by
  native_decide

/-- Coefficient term 201 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YNNNN_coefficient_09_0201 : Poly :=
[
  term ((85 : Rat) / 28) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 201 for generator 9. -/
def rs_R009_ueqv_R009YNNNN_partial_09_0201 : Poly :=
[
  term ((-85 : Rat) / 14) [(0, 1), (2, 1), (9, 1), (15, 1), (16, 1)],
  term ((85 : Rat) / 14) [(0, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-85 : Rat) / 14) [(1, 1), (3, 1), (9, 1), (15, 1), (16, 1)],
  term ((85 : Rat) / 14) [(1, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((85 : Rat) / 28) [(2, 2), (9, 1), (15, 1), (16, 1)],
  term ((85 : Rat) / 28) [(3, 2), (9, 1), (15, 1), (16, 1)],
  term ((-85 : Rat) / 28) [(9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-85 : Rat) / 28) [(9, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 201 for generator 9. -/
theorem rs_R009_ueqv_R009YNNNN_partial_09_0201_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_09_0201
        rs_R009_ueqv_R009YNNNN_generator_09_0200_0238 =
      rs_R009_ueqv_R009YNNNN_partial_09_0201 := by
  native_decide

/-- Coefficient term 202 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YNNNN_coefficient_09_0202 : Poly :=
[
  term ((128159902247 : Rat) / 5138997696) [(9, 2)]
]

/-- Partial product 202 for generator 9. -/
def rs_R009_ueqv_R009YNNNN_partial_09_0202 : Poly :=
[
  term ((-128159902247 : Rat) / 2569498848) [(0, 1), (2, 1), (9, 2)],
  term ((128159902247 : Rat) / 2569498848) [(0, 1), (9, 2), (12, 1)],
  term ((-128159902247 : Rat) / 2569498848) [(1, 1), (3, 1), (9, 2)],
  term ((128159902247 : Rat) / 2569498848) [(1, 1), (9, 2), (13, 1)],
  term ((128159902247 : Rat) / 5138997696) [(2, 2), (9, 2)],
  term ((128159902247 : Rat) / 5138997696) [(3, 2), (9, 2)],
  term ((-128159902247 : Rat) / 5138997696) [(9, 2), (12, 2)],
  term ((-128159902247 : Rat) / 5138997696) [(9, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 202 for generator 9. -/
theorem rs_R009_ueqv_R009YNNNN_partial_09_0202_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_09_0202
        rs_R009_ueqv_R009YNNNN_generator_09_0200_0238 =
      rs_R009_ueqv_R009YNNNN_partial_09_0202 := by
  native_decide

/-- Coefficient term 203 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YNNNN_coefficient_09_0203 : Poly :=
[
  term ((-210703568101 : Rat) / 2997748656) [(9, 2), (10, 1)]
]

/-- Partial product 203 for generator 9. -/
def rs_R009_ueqv_R009YNNNN_partial_09_0203 : Poly :=
[
  term ((210703568101 : Rat) / 1498874328) [(0, 1), (2, 1), (9, 2), (10, 1)],
  term ((-210703568101 : Rat) / 1498874328) [(0, 1), (9, 2), (10, 1), (12, 1)],
  term ((210703568101 : Rat) / 1498874328) [(1, 1), (3, 1), (9, 2), (10, 1)],
  term ((-210703568101 : Rat) / 1498874328) [(1, 1), (9, 2), (10, 1), (13, 1)],
  term ((-210703568101 : Rat) / 2997748656) [(2, 2), (9, 2), (10, 1)],
  term ((-210703568101 : Rat) / 2997748656) [(3, 2), (9, 2), (10, 1)],
  term ((210703568101 : Rat) / 2997748656) [(9, 2), (10, 1), (12, 2)],
  term ((210703568101 : Rat) / 2997748656) [(9, 2), (10, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 203 for generator 9. -/
theorem rs_R009_ueqv_R009YNNNN_partial_09_0203_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_09_0203
        rs_R009_ueqv_R009YNNNN_generator_09_0200_0238 =
      rs_R009_ueqv_R009YNNNN_partial_09_0203 := by
  native_decide

/-- Coefficient term 204 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YNNNN_coefficient_09_0204 : Poly :=
[
  term ((-1209916365281 : Rat) / 5995497312) [(9, 2), (14, 1)]
]

/-- Partial product 204 for generator 9. -/
def rs_R009_ueqv_R009YNNNN_partial_09_0204 : Poly :=
[
  term ((1209916365281 : Rat) / 2997748656) [(0, 1), (2, 1), (9, 2), (14, 1)],
  term ((-1209916365281 : Rat) / 2997748656) [(0, 1), (9, 2), (12, 1), (14, 1)],
  term ((1209916365281 : Rat) / 2997748656) [(1, 1), (3, 1), (9, 2), (14, 1)],
  term ((-1209916365281 : Rat) / 2997748656) [(1, 1), (9, 2), (13, 1), (14, 1)],
  term ((-1209916365281 : Rat) / 5995497312) [(2, 2), (9, 2), (14, 1)],
  term ((-1209916365281 : Rat) / 5995497312) [(3, 2), (9, 2), (14, 1)],
  term ((1209916365281 : Rat) / 5995497312) [(9, 2), (12, 2), (14, 1)],
  term ((1209916365281 : Rat) / 5995497312) [(9, 2), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 204 for generator 9. -/
theorem rs_R009_ueqv_R009YNNNN_partial_09_0204_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_09_0204
        rs_R009_ueqv_R009YNNNN_generator_09_0200_0238 =
      rs_R009_ueqv_R009YNNNN_partial_09_0204 := by
  native_decide

/-- Coefficient term 205 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YNNNN_coefficient_09_0205 : Poly :=
[
  term ((111265302766141 : Rat) / 8703213785532) [(10, 1)]
]

/-- Partial product 205 for generator 9. -/
def rs_R009_ueqv_R009YNNNN_partial_09_0205 : Poly :=
[
  term ((-111265302766141 : Rat) / 4351606892766) [(0, 1), (2, 1), (10, 1)],
  term ((111265302766141 : Rat) / 4351606892766) [(0, 1), (10, 1), (12, 1)],
  term ((-111265302766141 : Rat) / 4351606892766) [(1, 1), (3, 1), (10, 1)],
  term ((111265302766141 : Rat) / 4351606892766) [(1, 1), (10, 1), (13, 1)],
  term ((111265302766141 : Rat) / 8703213785532) [(2, 2), (10, 1)],
  term ((111265302766141 : Rat) / 8703213785532) [(3, 2), (10, 1)],
  term ((-111265302766141 : Rat) / 8703213785532) [(10, 1), (12, 2)],
  term ((-111265302766141 : Rat) / 8703213785532) [(10, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 205 for generator 9. -/
theorem rs_R009_ueqv_R009YNNNN_partial_09_0205_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_09_0205
        rs_R009_ueqv_R009YNNNN_generator_09_0200_0238 =
      rs_R009_ueqv_R009YNNNN_partial_09_0205 := by
  native_decide

/-- Coefficient term 206 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YNNNN_coefficient_09_0206 : Poly :=
[
  term ((3846346517369 : Rat) / 19735178652) [(10, 1), (11, 1), (13, 1)]
]

/-- Partial product 206 for generator 9. -/
def rs_R009_ueqv_R009YNNNN_partial_09_0206 : Poly :=
[
  term ((-3846346517369 : Rat) / 9867589326) [(0, 1), (2, 1), (10, 1), (11, 1), (13, 1)],
  term ((3846346517369 : Rat) / 9867589326) [(0, 1), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((-3846346517369 : Rat) / 9867589326) [(1, 1), (3, 1), (10, 1), (11, 1), (13, 1)],
  term ((3846346517369 : Rat) / 9867589326) [(1, 1), (10, 1), (11, 1), (13, 2)],
  term ((3846346517369 : Rat) / 19735178652) [(2, 2), (10, 1), (11, 1), (13, 1)],
  term ((3846346517369 : Rat) / 19735178652) [(3, 2), (10, 1), (11, 1), (13, 1)],
  term ((-3846346517369 : Rat) / 19735178652) [(10, 1), (11, 1), (12, 2), (13, 1)],
  term ((-3846346517369 : Rat) / 19735178652) [(10, 1), (11, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 206 for generator 9. -/
theorem rs_R009_ueqv_R009YNNNN_partial_09_0206_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_09_0206
        rs_R009_ueqv_R009YNNNN_generator_09_0200_0238 =
      rs_R009_ueqv_R009YNNNN_partial_09_0206 := by
  native_decide

/-- Coefficient term 207 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YNNNN_coefficient_09_0207 : Poly :=
[
  term ((5 : Rat) / 2) [(10, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 207 for generator 9. -/
def rs_R009_ueqv_R009YNNNN_partial_09_0207 : Poly :=
[
  term (-5 : Rat) [(0, 1), (2, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term (5 : Rat) [(0, 1), (10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term (-5 : Rat) [(1, 1), (3, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term (5 : Rat) [(1, 1), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((5 : Rat) / 2) [(2, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((5 : Rat) / 2) [(3, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-5 : Rat) / 2) [(10, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-5 : Rat) / 2) [(10, 1), (11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 207 for generator 9. -/
theorem rs_R009_ueqv_R009YNNNN_partial_09_0207_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_09_0207
        rs_R009_ueqv_R009YNNNN_generator_09_0200_0238 =
      rs_R009_ueqv_R009YNNNN_partial_09_0207 := by
  native_decide

/-- Coefficient term 208 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YNNNN_coefficient_09_0208 : Poly :=
[
  term ((-6912890523443677 : Rat) / 6527410339149) [(10, 1), (11, 1), (15, 1)]
]

/-- Partial product 208 for generator 9. -/
def rs_R009_ueqv_R009YNNNN_partial_09_0208 : Poly :=
[
  term ((13825781046887354 : Rat) / 6527410339149) [(0, 1), (2, 1), (10, 1), (11, 1), (15, 1)],
  term ((-13825781046887354 : Rat) / 6527410339149) [(0, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((13825781046887354 : Rat) / 6527410339149) [(1, 1), (3, 1), (10, 1), (11, 1), (15, 1)],
  term ((-13825781046887354 : Rat) / 6527410339149) [(1, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-6912890523443677 : Rat) / 6527410339149) [(2, 2), (10, 1), (11, 1), (15, 1)],
  term ((-6912890523443677 : Rat) / 6527410339149) [(3, 2), (10, 1), (11, 1), (15, 1)],
  term ((6912890523443677 : Rat) / 6527410339149) [(10, 1), (11, 1), (12, 2), (15, 1)],
  term ((6912890523443677 : Rat) / 6527410339149) [(10, 1), (11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 208 for generator 9. -/
theorem rs_R009_ueqv_R009YNNNN_partial_09_0208_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_09_0208
        rs_R009_ueqv_R009YNNNN_generator_09_0200_0238 =
      rs_R009_ueqv_R009YNNNN_partial_09_0208 := by
  native_decide

/-- Coefficient term 209 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YNNNN_coefficient_09_0209 : Poly :=
[
  term ((-18 : Rat) / 7) [(10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 209 for generator 9. -/
def rs_R009_ueqv_R009YNNNN_partial_09_0209 : Poly :=
[
  term ((36 : Rat) / 7) [(0, 1), (2, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-36 : Rat) / 7) [(0, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((36 : Rat) / 7) [(1, 1), (3, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-36 : Rat) / 7) [(1, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-18 : Rat) / 7) [(2, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-18 : Rat) / 7) [(3, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((18 : Rat) / 7) [(10, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((18 : Rat) / 7) [(10, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 209 for generator 9. -/
theorem rs_R009_ueqv_R009YNNNN_partial_09_0209_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_09_0209
        rs_R009_ueqv_R009YNNNN_generator_09_0200_0238 =
      rs_R009_ueqv_R009YNNNN_partial_09_0209 := by
  native_decide

/-- Coefficient term 210 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YNNNN_coefficient_09_0210 : Poly :=
[
  term ((119808 : Rat) / 553) [(10, 1), (11, 2)]
]

/-- Partial product 210 for generator 9. -/
def rs_R009_ueqv_R009YNNNN_partial_09_0210 : Poly :=
[
  term ((-239616 : Rat) / 553) [(0, 1), (2, 1), (10, 1), (11, 2)],
  term ((239616 : Rat) / 553) [(0, 1), (10, 1), (11, 2), (12, 1)],
  term ((-239616 : Rat) / 553) [(1, 1), (3, 1), (10, 1), (11, 2)],
  term ((239616 : Rat) / 553) [(1, 1), (10, 1), (11, 2), (13, 1)],
  term ((119808 : Rat) / 553) [(2, 2), (10, 1), (11, 2)],
  term ((119808 : Rat) / 553) [(3, 2), (10, 1), (11, 2)],
  term ((-119808 : Rat) / 553) [(10, 1), (11, 2), (12, 2)],
  term ((-119808 : Rat) / 553) [(10, 1), (11, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 210 for generator 9. -/
theorem rs_R009_ueqv_R009YNNNN_partial_09_0210_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_09_0210
        rs_R009_ueqv_R009YNNNN_generator_09_0200_0238 =
      rs_R009_ueqv_R009YNNNN_partial_09_0210 := by
  native_decide

/-- Coefficient term 211 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YNNNN_coefficient_09_0211 : Poly :=
[
  term ((623465237564147 : Rat) / 913456840464) [(10, 1), (13, 1), (15, 1)]
]

/-- Partial product 211 for generator 9. -/
def rs_R009_ueqv_R009YNNNN_partial_09_0211 : Poly :=
[
  term ((-623465237564147 : Rat) / 456728420232) [(0, 1), (2, 1), (10, 1), (13, 1), (15, 1)],
  term ((623465237564147 : Rat) / 456728420232) [(0, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-623465237564147 : Rat) / 456728420232) [(1, 1), (3, 1), (10, 1), (13, 1), (15, 1)],
  term ((623465237564147 : Rat) / 456728420232) [(1, 1), (10, 1), (13, 2), (15, 1)],
  term ((623465237564147 : Rat) / 913456840464) [(2, 2), (10, 1), (13, 1), (15, 1)],
  term ((623465237564147 : Rat) / 913456840464) [(3, 2), (10, 1), (13, 1), (15, 1)],
  term ((-623465237564147 : Rat) / 913456840464) [(10, 1), (12, 2), (13, 1), (15, 1)],
  term ((-623465237564147 : Rat) / 913456840464) [(10, 1), (13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 211 for generator 9. -/
theorem rs_R009_ueqv_R009YNNNN_partial_09_0211_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_09_0211
        rs_R009_ueqv_R009YNNNN_generator_09_0200_0238 =
      rs_R009_ueqv_R009YNNNN_partial_09_0211 := by
  native_decide

/-- Coefficient term 212 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YNNNN_coefficient_09_0212 : Poly :=
[
  term ((-10985 : Rat) / 504) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 212 for generator 9. -/
def rs_R009_ueqv_R009YNNNN_partial_09_0212 : Poly :=
[
  term ((10985 : Rat) / 252) [(0, 1), (2, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-10985 : Rat) / 252) [(0, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((10985 : Rat) / 252) [(1, 1), (3, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-10985 : Rat) / 252) [(1, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-10985 : Rat) / 504) [(2, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-10985 : Rat) / 504) [(3, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((10985 : Rat) / 504) [(10, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((10985 : Rat) / 504) [(10, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 212 for generator 9. -/
theorem rs_R009_ueqv_R009YNNNN_partial_09_0212_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_09_0212
        rs_R009_ueqv_R009YNNNN_generator_09_0200_0238 =
      rs_R009_ueqv_R009YNNNN_partial_09_0212 := by
  native_decide

/-- Coefficient term 213 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YNNNN_coefficient_09_0213 : Poly :=
[
  term ((3968051523467 : Rat) / 88808303934) [(10, 1), (14, 1)]
]

/-- Partial product 213 for generator 9. -/
def rs_R009_ueqv_R009YNNNN_partial_09_0213 : Poly :=
[
  term ((-3968051523467 : Rat) / 44404151967) [(0, 1), (2, 1), (10, 1), (14, 1)],
  term ((3968051523467 : Rat) / 44404151967) [(0, 1), (10, 1), (12, 1), (14, 1)],
  term ((-3968051523467 : Rat) / 44404151967) [(1, 1), (3, 1), (10, 1), (14, 1)],
  term ((3968051523467 : Rat) / 44404151967) [(1, 1), (10, 1), (13, 1), (14, 1)],
  term ((3968051523467 : Rat) / 88808303934) [(2, 2), (10, 1), (14, 1)],
  term ((3968051523467 : Rat) / 88808303934) [(3, 2), (10, 1), (14, 1)],
  term ((-3968051523467 : Rat) / 88808303934) [(10, 1), (12, 2), (14, 1)],
  term ((-3968051523467 : Rat) / 88808303934) [(10, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 213 for generator 9. -/
theorem rs_R009_ueqv_R009YNNNN_partial_09_0213_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_09_0213
        rs_R009_ueqv_R009YNNNN_generator_09_0200_0238 =
      rs_R009_ueqv_R009YNNNN_partial_09_0213 := by
  native_decide

/-- Coefficient term 214 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YNNNN_coefficient_09_0214 : Poly :=
[
  term ((-618151682419606 : Rat) / 932487191307) [(10, 1), (15, 2)]
]

/-- Partial product 214 for generator 9. -/
def rs_R009_ueqv_R009YNNNN_partial_09_0214 : Poly :=
[
  term ((1236303364839212 : Rat) / 932487191307) [(0, 1), (2, 1), (10, 1), (15, 2)],
  term ((-1236303364839212 : Rat) / 932487191307) [(0, 1), (10, 1), (12, 1), (15, 2)],
  term ((1236303364839212 : Rat) / 932487191307) [(1, 1), (3, 1), (10, 1), (15, 2)],
  term ((-1236303364839212 : Rat) / 932487191307) [(1, 1), (10, 1), (13, 1), (15, 2)],
  term ((-618151682419606 : Rat) / 932487191307) [(2, 2), (10, 1), (15, 2)],
  term ((-618151682419606 : Rat) / 932487191307) [(3, 2), (10, 1), (15, 2)],
  term ((618151682419606 : Rat) / 932487191307) [(10, 1), (12, 2), (15, 2)],
  term ((618151682419606 : Rat) / 932487191307) [(10, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 214 for generator 9. -/
theorem rs_R009_ueqv_R009YNNNN_partial_09_0214_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_09_0214
        rs_R009_ueqv_R009YNNNN_generator_09_0200_0238 =
      rs_R009_ueqv_R009YNNNN_partial_09_0214 := by
  native_decide

/-- Coefficient term 215 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YNNNN_coefficient_09_0215 : Poly :=
[
  term ((311 : Rat) / 18) [(10, 1), (15, 2), (16, 1)]
]

/-- Partial product 215 for generator 9. -/
def rs_R009_ueqv_R009YNNNN_partial_09_0215 : Poly :=
[
  term ((-311 : Rat) / 9) [(0, 1), (2, 1), (10, 1), (15, 2), (16, 1)],
  term ((311 : Rat) / 9) [(0, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-311 : Rat) / 9) [(1, 1), (3, 1), (10, 1), (15, 2), (16, 1)],
  term ((311 : Rat) / 9) [(1, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((311 : Rat) / 18) [(2, 2), (10, 1), (15, 2), (16, 1)],
  term ((311 : Rat) / 18) [(3, 2), (10, 1), (15, 2), (16, 1)],
  term ((-311 : Rat) / 18) [(10, 1), (12, 2), (15, 2), (16, 1)],
  term ((-311 : Rat) / 18) [(10, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 215 for generator 9. -/
theorem rs_R009_ueqv_R009YNNNN_partial_09_0215_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_09_0215
        rs_R009_ueqv_R009YNNNN_generator_09_0200_0238 =
      rs_R009_ueqv_R009YNNNN_partial_09_0215 := by
  native_decide

/-- Coefficient term 216 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YNNNN_coefficient_09_0216 : Poly :=
[
  term ((27954940475476267 : Rat) / 52219282713192) [(11, 1), (13, 1)]
]

/-- Partial product 216 for generator 9. -/
def rs_R009_ueqv_R009YNNNN_partial_09_0216 : Poly :=
[
  term ((-27954940475476267 : Rat) / 26109641356596) [(0, 1), (2, 1), (11, 1), (13, 1)],
  term ((27954940475476267 : Rat) / 26109641356596) [(0, 1), (11, 1), (12, 1), (13, 1)],
  term ((-27954940475476267 : Rat) / 26109641356596) [(1, 1), (3, 1), (11, 1), (13, 1)],
  term ((27954940475476267 : Rat) / 26109641356596) [(1, 1), (11, 1), (13, 2)],
  term ((27954940475476267 : Rat) / 52219282713192) [(2, 2), (11, 1), (13, 1)],
  term ((27954940475476267 : Rat) / 52219282713192) [(3, 2), (11, 1), (13, 1)],
  term ((-27954940475476267 : Rat) / 52219282713192) [(11, 1), (12, 2), (13, 1)],
  term ((-27954940475476267 : Rat) / 52219282713192) [(11, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 216 for generator 9. -/
theorem rs_R009_ueqv_R009YNNNN_partial_09_0216_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_09_0216
        rs_R009_ueqv_R009YNNNN_generator_09_0200_0238 =
      rs_R009_ueqv_R009YNNNN_partial_09_0216 := by
  native_decide

/-- Coefficient term 217 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YNNNN_coefficient_09_0217 : Poly :=
[
  term ((-1848692002911661 : Rat) / 6394197883248) [(11, 1), (13, 1), (14, 1)]
]

/-- Partial product 217 for generator 9. -/
def rs_R009_ueqv_R009YNNNN_partial_09_0217 : Poly :=
[
  term ((1848692002911661 : Rat) / 3197098941624) [(0, 1), (2, 1), (11, 1), (13, 1), (14, 1)],
  term ((-1848692002911661 : Rat) / 3197098941624) [(0, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((1848692002911661 : Rat) / 3197098941624) [(1, 1), (3, 1), (11, 1), (13, 1), (14, 1)],
  term ((-1848692002911661 : Rat) / 3197098941624) [(1, 1), (11, 1), (13, 2), (14, 1)],
  term ((-1848692002911661 : Rat) / 6394197883248) [(2, 2), (11, 1), (13, 1), (14, 1)],
  term ((-1848692002911661 : Rat) / 6394197883248) [(3, 2), (11, 1), (13, 1), (14, 1)],
  term ((1848692002911661 : Rat) / 6394197883248) [(11, 1), (12, 2), (13, 1), (14, 1)],
  term ((1848692002911661 : Rat) / 6394197883248) [(11, 1), (13, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 217 for generator 9. -/
theorem rs_R009_ueqv_R009YNNNN_partial_09_0217_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_09_0217
        rs_R009_ueqv_R009YNNNN_generator_09_0200_0238 =
      rs_R009_ueqv_R009YNNNN_partial_09_0217 := by
  native_decide

/-- Coefficient term 218 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YNNNN_coefficient_09_0218 : Poly :=
[
  term ((10225 : Rat) / 504) [(11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 218 for generator 9. -/
def rs_R009_ueqv_R009YNNNN_partial_09_0218 : Poly :=
[
  term ((-10225 : Rat) / 252) [(0, 1), (2, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((10225 : Rat) / 252) [(0, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-10225 : Rat) / 252) [(1, 1), (3, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((10225 : Rat) / 252) [(1, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((10225 : Rat) / 504) [(2, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((10225 : Rat) / 504) [(3, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-10225 : Rat) / 504) [(11, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-10225 : Rat) / 504) [(11, 1), (13, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 218 for generator 9. -/
theorem rs_R009_ueqv_R009YNNNN_partial_09_0218_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_09_0218
        rs_R009_ueqv_R009YNNNN_generator_09_0200_0238 =
      rs_R009_ueqv_R009YNNNN_partial_09_0218 := by
  native_decide

/-- Coefficient term 219 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YNNNN_coefficient_09_0219 : Poly :=
[
  term ((-425 : Rat) / 28) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 219 for generator 9. -/
def rs_R009_ueqv_R009YNNNN_partial_09_0219 : Poly :=
[
  term ((425 : Rat) / 14) [(0, 1), (2, 1), (11, 1), (13, 1), (16, 1)],
  term ((-425 : Rat) / 14) [(0, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((425 : Rat) / 14) [(1, 1), (3, 1), (11, 1), (13, 1), (16, 1)],
  term ((-425 : Rat) / 14) [(1, 1), (11, 1), (13, 2), (16, 1)],
  term ((-425 : Rat) / 28) [(2, 2), (11, 1), (13, 1), (16, 1)],
  term ((-425 : Rat) / 28) [(3, 2), (11, 1), (13, 1), (16, 1)],
  term ((425 : Rat) / 28) [(11, 1), (12, 2), (13, 1), (16, 1)],
  term ((425 : Rat) / 28) [(11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 219 for generator 9. -/
theorem rs_R009_ueqv_R009YNNNN_partial_09_0219_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_09_0219
        rs_R009_ueqv_R009YNNNN_generator_09_0200_0238 =
      rs_R009_ueqv_R009YNNNN_partial_09_0219 := by
  native_decide

/-- Coefficient term 220 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YNNNN_coefficient_09_0220 : Poly :=
[
  term ((88872484203048523 : Rat) / 26109641356596) [(11, 1), (14, 1), (15, 1)]
]

/-- Partial product 220 for generator 9. -/
def rs_R009_ueqv_R009YNNNN_partial_09_0220 : Poly :=
[
  term ((-88872484203048523 : Rat) / 13054820678298) [(0, 1), (2, 1), (11, 1), (14, 1), (15, 1)],
  term ((88872484203048523 : Rat) / 13054820678298) [(0, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-88872484203048523 : Rat) / 13054820678298) [(1, 1), (3, 1), (11, 1), (14, 1), (15, 1)],
  term ((88872484203048523 : Rat) / 13054820678298) [(1, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((88872484203048523 : Rat) / 26109641356596) [(2, 2), (11, 1), (14, 1), (15, 1)],
  term ((88872484203048523 : Rat) / 26109641356596) [(3, 2), (11, 1), (14, 1), (15, 1)],
  term ((-88872484203048523 : Rat) / 26109641356596) [(11, 1), (12, 2), (14, 1), (15, 1)],
  term ((-88872484203048523 : Rat) / 26109641356596) [(11, 1), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 220 for generator 9. -/
theorem rs_R009_ueqv_R009YNNNN_partial_09_0220_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_09_0220
        rs_R009_ueqv_R009YNNNN_generator_09_0200_0238 =
      rs_R009_ueqv_R009YNNNN_partial_09_0220 := by
  native_decide

/-- Coefficient term 221 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YNNNN_coefficient_09_0221 : Poly :=
[
  term ((-2113 : Rat) / 126) [(11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 221 for generator 9. -/
def rs_R009_ueqv_R009YNNNN_partial_09_0221 : Poly :=
[
  term ((2113 : Rat) / 63) [(0, 1), (2, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2113 : Rat) / 63) [(0, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((2113 : Rat) / 63) [(1, 1), (3, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2113 : Rat) / 63) [(1, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2113 : Rat) / 126) [(2, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2113 : Rat) / 126) [(3, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((2113 : Rat) / 126) [(11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((2113 : Rat) / 126) [(11, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 221 for generator 9. -/
theorem rs_R009_ueqv_R009YNNNN_partial_09_0221_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_09_0221
        rs_R009_ueqv_R009YNNNN_generator_09_0200_0238 =
      rs_R009_ueqv_R009YNNNN_partial_09_0221 := by
  native_decide

/-- Coefficient term 222 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YNNNN_coefficient_09_0222 : Poly :=
[
  term ((3064399565618 : Rat) / 26861770943) [(11, 1), (14, 2), (15, 1)]
]

/-- Partial product 222 for generator 9. -/
def rs_R009_ueqv_R009YNNNN_partial_09_0222 : Poly :=
[
  term ((-6128799131236 : Rat) / 26861770943) [(0, 1), (2, 1), (11, 1), (14, 2), (15, 1)],
  term ((6128799131236 : Rat) / 26861770943) [(0, 1), (11, 1), (12, 1), (14, 2), (15, 1)],
  term ((-6128799131236 : Rat) / 26861770943) [(1, 1), (3, 1), (11, 1), (14, 2), (15, 1)],
  term ((6128799131236 : Rat) / 26861770943) [(1, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(2, 2), (11, 1), (14, 2), (15, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(3, 2), (11, 1), (14, 2), (15, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(11, 1), (12, 2), (14, 2), (15, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(11, 1), (13, 2), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 222 for generator 9. -/
theorem rs_R009_ueqv_R009YNNNN_partial_09_0222_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_09_0222
        rs_R009_ueqv_R009YNNNN_generator_09_0200_0238 =
      rs_R009_ueqv_R009YNNNN_partial_09_0222 := by
  native_decide

/-- Coefficient term 223 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YNNNN_coefficient_09_0223 : Poly :=
[
  term ((40189669187402131 : Rat) / 26109641356596) [(11, 1), (15, 1)]
]

/-- Partial product 223 for generator 9. -/
def rs_R009_ueqv_R009YNNNN_partial_09_0223 : Poly :=
[
  term ((-40189669187402131 : Rat) / 13054820678298) [(0, 1), (2, 1), (11, 1), (15, 1)],
  term ((40189669187402131 : Rat) / 13054820678298) [(0, 1), (11, 1), (12, 1), (15, 1)],
  term ((-40189669187402131 : Rat) / 13054820678298) [(1, 1), (3, 1), (11, 1), (15, 1)],
  term ((40189669187402131 : Rat) / 13054820678298) [(1, 1), (11, 1), (13, 1), (15, 1)],
  term ((40189669187402131 : Rat) / 26109641356596) [(2, 2), (11, 1), (15, 1)],
  term ((40189669187402131 : Rat) / 26109641356596) [(3, 2), (11, 1), (15, 1)],
  term ((-40189669187402131 : Rat) / 26109641356596) [(11, 1), (12, 2), (15, 1)],
  term ((-40189669187402131 : Rat) / 26109641356596) [(11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 223 for generator 9. -/
theorem rs_R009_ueqv_R009YNNNN_partial_09_0223_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_09_0223
        rs_R009_ueqv_R009YNNNN_generator_09_0200_0238 =
      rs_R009_ueqv_R009YNNNN_partial_09_0223 := by
  native_decide

/-- Coefficient term 224 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YNNNN_coefficient_09_0224 : Poly :=
[
  term ((85 : Rat) / 7) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 224 for generator 9. -/
def rs_R009_ueqv_R009YNNNN_partial_09_0224 : Poly :=
[
  term ((-170 : Rat) / 7) [(0, 1), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((170 : Rat) / 7) [(0, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-170 : Rat) / 7) [(1, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((170 : Rat) / 7) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((85 : Rat) / 7) [(2, 2), (11, 1), (15, 1), (16, 1)],
  term ((85 : Rat) / 7) [(3, 2), (11, 1), (15, 1), (16, 1)],
  term ((-85 : Rat) / 7) [(11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-85 : Rat) / 7) [(11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 224 for generator 9. -/
theorem rs_R009_ueqv_R009YNNNN_partial_09_0224_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_09_0224
        rs_R009_ueqv_R009YNNNN_generator_09_0200_0238 =
      rs_R009_ueqv_R009YNNNN_partial_09_0224 := by
  native_decide

/-- Coefficient term 225 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YNNNN_coefficient_09_0225 : Poly :=
[
  term ((8146155654445411 : Rat) / 17406427571064) [(11, 2)]
]

/-- Partial product 225 for generator 9. -/
def rs_R009_ueqv_R009YNNNN_partial_09_0225 : Poly :=
[
  term ((-8146155654445411 : Rat) / 8703213785532) [(0, 1), (2, 1), (11, 2)],
  term ((8146155654445411 : Rat) / 8703213785532) [(0, 1), (11, 2), (12, 1)],
  term ((-8146155654445411 : Rat) / 8703213785532) [(1, 1), (3, 1), (11, 2)],
  term ((8146155654445411 : Rat) / 8703213785532) [(1, 1), (11, 2), (13, 1)],
  term ((8146155654445411 : Rat) / 17406427571064) [(2, 2), (11, 2)],
  term ((8146155654445411 : Rat) / 17406427571064) [(3, 2), (11, 2)],
  term ((-8146155654445411 : Rat) / 17406427571064) [(11, 2), (12, 2)],
  term ((-8146155654445411 : Rat) / 17406427571064) [(11, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 225 for generator 9. -/
theorem rs_R009_ueqv_R009YNNNN_partial_09_0225_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_09_0225
        rs_R009_ueqv_R009YNNNN_generator_09_0200_0238 =
      rs_R009_ueqv_R009YNNNN_partial_09_0225 := by
  native_decide

/-- Coefficient term 226 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YNNNN_coefficient_09_0226 : Poly :=
[
  term ((-15822413193419635 : Rat) / 26109641356596) [(11, 2), (14, 1)]
]

/-- Partial product 226 for generator 9. -/
def rs_R009_ueqv_R009YNNNN_partial_09_0226 : Poly :=
[
  term ((15822413193419635 : Rat) / 13054820678298) [(0, 1), (2, 1), (11, 2), (14, 1)],
  term ((-15822413193419635 : Rat) / 13054820678298) [(0, 1), (11, 2), (12, 1), (14, 1)],
  term ((15822413193419635 : Rat) / 13054820678298) [(1, 1), (3, 1), (11, 2), (14, 1)],
  term ((-15822413193419635 : Rat) / 13054820678298) [(1, 1), (11, 2), (13, 1), (14, 1)],
  term ((-15822413193419635 : Rat) / 26109641356596) [(2, 2), (11, 2), (14, 1)],
  term ((-15822413193419635 : Rat) / 26109641356596) [(3, 2), (11, 2), (14, 1)],
  term ((15822413193419635 : Rat) / 26109641356596) [(11, 2), (12, 2), (14, 1)],
  term ((15822413193419635 : Rat) / 26109641356596) [(11, 2), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 226 for generator 9. -/
theorem rs_R009_ueqv_R009YNNNN_partial_09_0226_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_09_0226
        rs_R009_ueqv_R009YNNNN_generator_09_0200_0238 =
      rs_R009_ueqv_R009YNNNN_partial_09_0226 := by
  native_decide

/-- Coefficient term 227 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YNNNN_coefficient_09_0227 : Poly :=
[
  term ((30161339870263123 : Rat) / 39164462034894) [(13, 1), (14, 1), (15, 1)]
]

/-- Partial product 227 for generator 9. -/
def rs_R009_ueqv_R009YNNNN_partial_09_0227 : Poly :=
[
  term ((-30161339870263123 : Rat) / 19582231017447) [(0, 1), (2, 1), (13, 1), (14, 1), (15, 1)],
  term ((30161339870263123 : Rat) / 19582231017447) [(0, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-30161339870263123 : Rat) / 19582231017447) [(1, 1), (3, 1), (13, 1), (14, 1), (15, 1)],
  term ((30161339870263123 : Rat) / 19582231017447) [(1, 1), (13, 2), (14, 1), (15, 1)],
  term ((30161339870263123 : Rat) / 39164462034894) [(2, 2), (13, 1), (14, 1), (15, 1)],
  term ((30161339870263123 : Rat) / 39164462034894) [(3, 2), (13, 1), (14, 1), (15, 1)],
  term ((-30161339870263123 : Rat) / 39164462034894) [(12, 2), (13, 1), (14, 1), (15, 1)],
  term ((-30161339870263123 : Rat) / 39164462034894) [(13, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 227 for generator 9. -/
theorem rs_R009_ueqv_R009YNNNN_partial_09_0227_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_09_0227
        rs_R009_ueqv_R009YNNNN_generator_09_0200_0238 =
      rs_R009_ueqv_R009YNNNN_partial_09_0227 := by
  native_decide

/-- Coefficient term 228 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YNNNN_coefficient_09_0228 : Poly :=
[
  term ((260 : Rat) / 63) [(13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 228 for generator 9. -/
def rs_R009_ueqv_R009YNNNN_partial_09_0228 : Poly :=
[
  term ((-520 : Rat) / 63) [(0, 1), (2, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((520 : Rat) / 63) [(0, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-520 : Rat) / 63) [(1, 1), (3, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((520 : Rat) / 63) [(1, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((260 : Rat) / 63) [(2, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((260 : Rat) / 63) [(3, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-260 : Rat) / 63) [(12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-260 : Rat) / 63) [(13, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 228 for generator 9. -/
theorem rs_R009_ueqv_R009YNNNN_partial_09_0228_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_09_0228
        rs_R009_ueqv_R009YNNNN_generator_09_0200_0238 =
      rs_R009_ueqv_R009YNNNN_partial_09_0228 := by
  native_decide

/-- Coefficient term 229 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YNNNN_coefficient_09_0229 : Poly :=
[
  term ((110213299130123465 : Rat) / 89518770365472) [(13, 1), (15, 1)]
]

/-- Partial product 229 for generator 9. -/
def rs_R009_ueqv_R009YNNNN_partial_09_0229 : Poly :=
[
  term ((-110213299130123465 : Rat) / 44759385182736) [(0, 1), (2, 1), (13, 1), (15, 1)],
  term ((110213299130123465 : Rat) / 44759385182736) [(0, 1), (12, 1), (13, 1), (15, 1)],
  term ((-110213299130123465 : Rat) / 44759385182736) [(1, 1), (3, 1), (13, 1), (15, 1)],
  term ((110213299130123465 : Rat) / 44759385182736) [(1, 1), (13, 2), (15, 1)],
  term ((110213299130123465 : Rat) / 89518770365472) [(2, 2), (13, 1), (15, 1)],
  term ((110213299130123465 : Rat) / 89518770365472) [(3, 2), (13, 1), (15, 1)],
  term ((-110213299130123465 : Rat) / 89518770365472) [(12, 2), (13, 1), (15, 1)],
  term ((-110213299130123465 : Rat) / 89518770365472) [(13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 229 for generator 9. -/
theorem rs_R009_ueqv_R009YNNNN_partial_09_0229_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_09_0229
        rs_R009_ueqv_R009YNNNN_generator_09_0200_0238 =
      rs_R009_ueqv_R009YNNNN_partial_09_0229 := by
  native_decide

/-- Coefficient term 230 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YNNNN_coefficient_09_0230 : Poly :=
[
  term ((-49195 : Rat) / 1008) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 230 for generator 9. -/
def rs_R009_ueqv_R009YNNNN_partial_09_0230 : Poly :=
[
  term ((49195 : Rat) / 504) [(0, 1), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((-49195 : Rat) / 504) [(0, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((49195 : Rat) / 504) [(1, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((-49195 : Rat) / 504) [(1, 1), (13, 2), (15, 1), (16, 1)],
  term ((-49195 : Rat) / 1008) [(2, 2), (13, 1), (15, 1), (16, 1)],
  term ((-49195 : Rat) / 1008) [(3, 2), (13, 1), (15, 1), (16, 1)],
  term ((49195 : Rat) / 1008) [(12, 2), (13, 1), (15, 1), (16, 1)],
  term ((49195 : Rat) / 1008) [(13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 230 for generator 9. -/
theorem rs_R009_ueqv_R009YNNNN_partial_09_0230_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_09_0230
        rs_R009_ueqv_R009YNNNN_generator_09_0200_0238 =
      rs_R009_ueqv_R009YNNNN_partial_09_0230 := by
  native_decide

/-- Coefficient term 231 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YNNNN_coefficient_09_0231 : Poly :=
[
  term ((-2596385212779769 : Rat) / 6394197883248) [(13, 2)]
]

/-- Partial product 231 for generator 9. -/
def rs_R009_ueqv_R009YNNNN_partial_09_0231 : Poly :=
[
  term ((2596385212779769 : Rat) / 3197098941624) [(0, 1), (2, 1), (13, 2)],
  term ((-2596385212779769 : Rat) / 3197098941624) [(0, 1), (12, 1), (13, 2)],
  term ((2596385212779769 : Rat) / 3197098941624) [(1, 1), (3, 1), (13, 2)],
  term ((-2596385212779769 : Rat) / 3197098941624) [(1, 1), (13, 3)],
  term ((-2596385212779769 : Rat) / 6394197883248) [(2, 2), (13, 2)],
  term ((-2596385212779769 : Rat) / 6394197883248) [(3, 2), (13, 2)],
  term ((2596385212779769 : Rat) / 6394197883248) [(12, 2), (13, 2)],
  term ((2596385212779769 : Rat) / 6394197883248) [(13, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 231 for generator 9. -/
theorem rs_R009_ueqv_R009YNNNN_partial_09_0231_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_09_0231
        rs_R009_ueqv_R009YNNNN_generator_09_0200_0238 =
      rs_R009_ueqv_R009YNNNN_partial_09_0231 := by
  native_decide

/-- Coefficient term 232 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YNNNN_coefficient_09_0232 : Poly :=
[
  term ((7285 : Rat) / 504) [(13, 2), (16, 1)]
]

/-- Partial product 232 for generator 9. -/
def rs_R009_ueqv_R009YNNNN_partial_09_0232 : Poly :=
[
  term ((-7285 : Rat) / 252) [(0, 1), (2, 1), (13, 2), (16, 1)],
  term ((7285 : Rat) / 252) [(0, 1), (12, 1), (13, 2), (16, 1)],
  term ((-7285 : Rat) / 252) [(1, 1), (3, 1), (13, 2), (16, 1)],
  term ((7285 : Rat) / 252) [(1, 1), (13, 3), (16, 1)],
  term ((7285 : Rat) / 504) [(2, 2), (13, 2), (16, 1)],
  term ((7285 : Rat) / 504) [(3, 2), (13, 2), (16, 1)],
  term ((-7285 : Rat) / 504) [(12, 2), (13, 2), (16, 1)],
  term ((-7285 : Rat) / 504) [(13, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 232 for generator 9. -/
theorem rs_R009_ueqv_R009YNNNN_partial_09_0232_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_09_0232
        rs_R009_ueqv_R009YNNNN_generator_09_0200_0238 =
      rs_R009_ueqv_R009YNNNN_partial_09_0232 := by
  native_decide

/-- Coefficient term 233 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YNNNN_coefficient_09_0233 : Poly :=
[
  term ((15828609795282337 : Rat) / 104438565426384) [(14, 1)]
]

/-- Partial product 233 for generator 9. -/
def rs_R009_ueqv_R009YNNNN_partial_09_0233 : Poly :=
[
  term ((-15828609795282337 : Rat) / 52219282713192) [(0, 1), (2, 1), (14, 1)],
  term ((15828609795282337 : Rat) / 52219282713192) [(0, 1), (12, 1), (14, 1)],
  term ((-15828609795282337 : Rat) / 52219282713192) [(1, 1), (3, 1), (14, 1)],
  term ((15828609795282337 : Rat) / 52219282713192) [(1, 1), (13, 1), (14, 1)],
  term ((15828609795282337 : Rat) / 104438565426384) [(2, 2), (14, 1)],
  term ((15828609795282337 : Rat) / 104438565426384) [(3, 2), (14, 1)],
  term ((-15828609795282337 : Rat) / 104438565426384) [(12, 2), (14, 1)],
  term ((-15828609795282337 : Rat) / 104438565426384) [(13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 233 for generator 9. -/
theorem rs_R009_ueqv_R009YNNNN_partial_09_0233_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_09_0233
        rs_R009_ueqv_R009YNNNN_generator_09_0200_0238 =
      rs_R009_ueqv_R009YNNNN_partial_09_0233 := by
  native_decide

/-- Coefficient term 234 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YNNNN_coefficient_09_0234 : Poly :=
[
  term ((-26197421906329391 : Rat) / 13054820678298) [(14, 1), (15, 2)]
]

/-- Partial product 234 for generator 9. -/
def rs_R009_ueqv_R009YNNNN_partial_09_0234 : Poly :=
[
  term ((26197421906329391 : Rat) / 6527410339149) [(0, 1), (2, 1), (14, 1), (15, 2)],
  term ((-26197421906329391 : Rat) / 6527410339149) [(0, 1), (12, 1), (14, 1), (15, 2)],
  term ((26197421906329391 : Rat) / 6527410339149) [(1, 1), (3, 1), (14, 1), (15, 2)],
  term ((-26197421906329391 : Rat) / 6527410339149) [(1, 1), (13, 1), (14, 1), (15, 2)],
  term ((-26197421906329391 : Rat) / 13054820678298) [(2, 2), (14, 1), (15, 2)],
  term ((-26197421906329391 : Rat) / 13054820678298) [(3, 2), (14, 1), (15, 2)],
  term ((26197421906329391 : Rat) / 13054820678298) [(12, 2), (14, 1), (15, 2)],
  term ((26197421906329391 : Rat) / 13054820678298) [(13, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 234 for generator 9. -/
theorem rs_R009_ueqv_R009YNNNN_partial_09_0234_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_09_0234
        rs_R009_ueqv_R009YNNNN_generator_09_0200_0238 =
      rs_R009_ueqv_R009YNNNN_partial_09_0234 := by
  native_decide

/-- Coefficient term 235 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YNNNN_coefficient_09_0235 : Poly :=
[
  term ((-296 : Rat) / 63) [(14, 1), (15, 2), (16, 1)]
]

/-- Partial product 235 for generator 9. -/
def rs_R009_ueqv_R009YNNNN_partial_09_0235 : Poly :=
[
  term ((592 : Rat) / 63) [(0, 1), (2, 1), (14, 1), (15, 2), (16, 1)],
  term ((-592 : Rat) / 63) [(0, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((592 : Rat) / 63) [(1, 1), (3, 1), (14, 1), (15, 2), (16, 1)],
  term ((-592 : Rat) / 63) [(1, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-296 : Rat) / 63) [(2, 2), (14, 1), (15, 2), (16, 1)],
  term ((-296 : Rat) / 63) [(3, 2), (14, 1), (15, 2), (16, 1)],
  term ((296 : Rat) / 63) [(12, 2), (14, 1), (15, 2), (16, 1)],
  term ((296 : Rat) / 63) [(13, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 235 for generator 9. -/
theorem rs_R009_ueqv_R009YNNNN_partial_09_0235_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_09_0235
        rs_R009_ueqv_R009YNNNN_generator_09_0200_0238 =
      rs_R009_ueqv_R009YNNNN_partial_09_0235 := by
  native_decide

/-- Coefficient term 236 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YNNNN_coefficient_09_0236 : Poly :=
[
  term ((-2431355462795051 : Rat) / 14919795060912) [(14, 2)]
]

/-- Partial product 236 for generator 9. -/
def rs_R009_ueqv_R009YNNNN_partial_09_0236 : Poly :=
[
  term ((2431355462795051 : Rat) / 7459897530456) [(0, 1), (2, 1), (14, 2)],
  term ((-2431355462795051 : Rat) / 7459897530456) [(0, 1), (12, 1), (14, 2)],
  term ((2431355462795051 : Rat) / 7459897530456) [(1, 1), (3, 1), (14, 2)],
  term ((-2431355462795051 : Rat) / 7459897530456) [(1, 1), (13, 1), (14, 2)],
  term ((-2431355462795051 : Rat) / 14919795060912) [(2, 2), (14, 2)],
  term ((-2431355462795051 : Rat) / 14919795060912) [(3, 2), (14, 2)],
  term ((2431355462795051 : Rat) / 14919795060912) [(12, 2), (14, 2)],
  term ((2431355462795051 : Rat) / 14919795060912) [(13, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 236 for generator 9. -/
theorem rs_R009_ueqv_R009YNNNN_partial_09_0236_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_09_0236
        rs_R009_ueqv_R009YNNNN_generator_09_0200_0238 =
      rs_R009_ueqv_R009YNNNN_partial_09_0236 := by
  native_decide

/-- Coefficient term 237 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YNNNN_coefficient_09_0237 : Poly :=
[
  term ((-234180512446582829 : Rat) / 104438565426384) [(15, 2)]
]

/-- Partial product 237 for generator 9. -/
def rs_R009_ueqv_R009YNNNN_partial_09_0237 : Poly :=
[
  term ((234180512446582829 : Rat) / 52219282713192) [(0, 1), (2, 1), (15, 2)],
  term ((-234180512446582829 : Rat) / 52219282713192) [(0, 1), (12, 1), (15, 2)],
  term ((234180512446582829 : Rat) / 52219282713192) [(1, 1), (3, 1), (15, 2)],
  term ((-234180512446582829 : Rat) / 52219282713192) [(1, 1), (13, 1), (15, 2)],
  term ((-234180512446582829 : Rat) / 104438565426384) [(2, 2), (15, 2)],
  term ((-234180512446582829 : Rat) / 104438565426384) [(3, 2), (15, 2)],
  term ((234180512446582829 : Rat) / 104438565426384) [(12, 2), (15, 2)],
  term ((234180512446582829 : Rat) / 104438565426384) [(13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 237 for generator 9. -/
theorem rs_R009_ueqv_R009YNNNN_partial_09_0237_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_09_0237
        rs_R009_ueqv_R009YNNNN_generator_09_0200_0238 =
      rs_R009_ueqv_R009YNNNN_partial_09_0237 := by
  native_decide

/-- Coefficient term 238 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YNNNN_coefficient_09_0238 : Poly :=
[
  term ((7619 : Rat) / 252) [(15, 2), (16, 1)]
]

/-- Partial product 238 for generator 9. -/
def rs_R009_ueqv_R009YNNNN_partial_09_0238 : Poly :=
[
  term ((-7619 : Rat) / 126) [(0, 1), (2, 1), (15, 2), (16, 1)],
  term ((7619 : Rat) / 126) [(0, 1), (12, 1), (15, 2), (16, 1)],
  term ((-7619 : Rat) / 126) [(1, 1), (3, 1), (15, 2), (16, 1)],
  term ((7619 : Rat) / 126) [(1, 1), (13, 1), (15, 2), (16, 1)],
  term ((7619 : Rat) / 252) [(2, 2), (15, 2), (16, 1)],
  term ((7619 : Rat) / 252) [(3, 2), (15, 2), (16, 1)],
  term ((-7619 : Rat) / 252) [(12, 2), (15, 2), (16, 1)],
  term ((-7619 : Rat) / 252) [(13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 238 for generator 9. -/
theorem rs_R009_ueqv_R009YNNNN_partial_09_0238_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_09_0238
        rs_R009_ueqv_R009YNNNN_generator_09_0200_0238 =
      rs_R009_ueqv_R009YNNNN_partial_09_0238 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009YNNNN_partials_09_0200_0238 : List Poly :=
[
  rs_R009_ueqv_R009YNNNN_partial_09_0200,
  rs_R009_ueqv_R009YNNNN_partial_09_0201,
  rs_R009_ueqv_R009YNNNN_partial_09_0202,
  rs_R009_ueqv_R009YNNNN_partial_09_0203,
  rs_R009_ueqv_R009YNNNN_partial_09_0204,
  rs_R009_ueqv_R009YNNNN_partial_09_0205,
  rs_R009_ueqv_R009YNNNN_partial_09_0206,
  rs_R009_ueqv_R009YNNNN_partial_09_0207,
  rs_R009_ueqv_R009YNNNN_partial_09_0208,
  rs_R009_ueqv_R009YNNNN_partial_09_0209,
  rs_R009_ueqv_R009YNNNN_partial_09_0210,
  rs_R009_ueqv_R009YNNNN_partial_09_0211,
  rs_R009_ueqv_R009YNNNN_partial_09_0212,
  rs_R009_ueqv_R009YNNNN_partial_09_0213,
  rs_R009_ueqv_R009YNNNN_partial_09_0214,
  rs_R009_ueqv_R009YNNNN_partial_09_0215,
  rs_R009_ueqv_R009YNNNN_partial_09_0216,
  rs_R009_ueqv_R009YNNNN_partial_09_0217,
  rs_R009_ueqv_R009YNNNN_partial_09_0218,
  rs_R009_ueqv_R009YNNNN_partial_09_0219,
  rs_R009_ueqv_R009YNNNN_partial_09_0220,
  rs_R009_ueqv_R009YNNNN_partial_09_0221,
  rs_R009_ueqv_R009YNNNN_partial_09_0222,
  rs_R009_ueqv_R009YNNNN_partial_09_0223,
  rs_R009_ueqv_R009YNNNN_partial_09_0224,
  rs_R009_ueqv_R009YNNNN_partial_09_0225,
  rs_R009_ueqv_R009YNNNN_partial_09_0226,
  rs_R009_ueqv_R009YNNNN_partial_09_0227,
  rs_R009_ueqv_R009YNNNN_partial_09_0228,
  rs_R009_ueqv_R009YNNNN_partial_09_0229,
  rs_R009_ueqv_R009YNNNN_partial_09_0230,
  rs_R009_ueqv_R009YNNNN_partial_09_0231,
  rs_R009_ueqv_R009YNNNN_partial_09_0232,
  rs_R009_ueqv_R009YNNNN_partial_09_0233,
  rs_R009_ueqv_R009YNNNN_partial_09_0234,
  rs_R009_ueqv_R009YNNNN_partial_09_0235,
  rs_R009_ueqv_R009YNNNN_partial_09_0236,
  rs_R009_ueqv_R009YNNNN_partial_09_0237,
  rs_R009_ueqv_R009YNNNN_partial_09_0238
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009YNNNN_block_09_0200_0238 : Poly :=
[
  term ((2845284778971053 : Rat) / 1826913680928) [(0, 1), (2, 1), (9, 1), (15, 1)],
  term ((-85 : Rat) / 14) [(0, 1), (2, 1), (9, 1), (15, 1), (16, 1)],
  term ((-128159902247 : Rat) / 2569498848) [(0, 1), (2, 1), (9, 2)],
  term ((210703568101 : Rat) / 1498874328) [(0, 1), (2, 1), (9, 2), (10, 1)],
  term ((1209916365281 : Rat) / 2997748656) [(0, 1), (2, 1), (9, 2), (14, 1)],
  term ((-111265302766141 : Rat) / 4351606892766) [(0, 1), (2, 1), (10, 1)],
  term ((-3846346517369 : Rat) / 9867589326) [(0, 1), (2, 1), (10, 1), (11, 1), (13, 1)],
  term (-5 : Rat) [(0, 1), (2, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((13825781046887354 : Rat) / 6527410339149) [(0, 1), (2, 1), (10, 1), (11, 1), (15, 1)],
  term ((36 : Rat) / 7) [(0, 1), (2, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-239616 : Rat) / 553) [(0, 1), (2, 1), (10, 1), (11, 2)],
  term ((-623465237564147 : Rat) / 456728420232) [(0, 1), (2, 1), (10, 1), (13, 1), (15, 1)],
  term ((10985 : Rat) / 252) [(0, 1), (2, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3968051523467 : Rat) / 44404151967) [(0, 1), (2, 1), (10, 1), (14, 1)],
  term ((1236303364839212 : Rat) / 932487191307) [(0, 1), (2, 1), (10, 1), (15, 2)],
  term ((-311 : Rat) / 9) [(0, 1), (2, 1), (10, 1), (15, 2), (16, 1)],
  term ((-27954940475476267 : Rat) / 26109641356596) [(0, 1), (2, 1), (11, 1), (13, 1)],
  term ((1848692002911661 : Rat) / 3197098941624) [(0, 1), (2, 1), (11, 1), (13, 1), (14, 1)],
  term ((-10225 : Rat) / 252) [(0, 1), (2, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((425 : Rat) / 14) [(0, 1), (2, 1), (11, 1), (13, 1), (16, 1)],
  term ((-88872484203048523 : Rat) / 13054820678298) [(0, 1), (2, 1), (11, 1), (14, 1), (15, 1)],
  term ((2113 : Rat) / 63) [(0, 1), (2, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6128799131236 : Rat) / 26861770943) [(0, 1), (2, 1), (11, 1), (14, 2), (15, 1)],
  term ((-40189669187402131 : Rat) / 13054820678298) [(0, 1), (2, 1), (11, 1), (15, 1)],
  term ((-170 : Rat) / 7) [(0, 1), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((-8146155654445411 : Rat) / 8703213785532) [(0, 1), (2, 1), (11, 2)],
  term ((15822413193419635 : Rat) / 13054820678298) [(0, 1), (2, 1), (11, 2), (14, 1)],
  term ((-30161339870263123 : Rat) / 19582231017447) [(0, 1), (2, 1), (13, 1), (14, 1), (15, 1)],
  term ((-520 : Rat) / 63) [(0, 1), (2, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-110213299130123465 : Rat) / 44759385182736) [(0, 1), (2, 1), (13, 1), (15, 1)],
  term ((49195 : Rat) / 504) [(0, 1), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((2596385212779769 : Rat) / 3197098941624) [(0, 1), (2, 1), (13, 2)],
  term ((-7285 : Rat) / 252) [(0, 1), (2, 1), (13, 2), (16, 1)],
  term ((-15828609795282337 : Rat) / 52219282713192) [(0, 1), (2, 1), (14, 1)],
  term ((26197421906329391 : Rat) / 6527410339149) [(0, 1), (2, 1), (14, 1), (15, 2)],
  term ((592 : Rat) / 63) [(0, 1), (2, 1), (14, 1), (15, 2), (16, 1)],
  term ((2431355462795051 : Rat) / 7459897530456) [(0, 1), (2, 1), (14, 2)],
  term ((234180512446582829 : Rat) / 52219282713192) [(0, 1), (2, 1), (15, 2)],
  term ((-7619 : Rat) / 126) [(0, 1), (2, 1), (15, 2), (16, 1)],
  term ((-2845284778971053 : Rat) / 1826913680928) [(0, 1), (9, 1), (12, 1), (15, 1)],
  term ((85 : Rat) / 14) [(0, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-210703568101 : Rat) / 1498874328) [(0, 1), (9, 2), (10, 1), (12, 1)],
  term ((128159902247 : Rat) / 2569498848) [(0, 1), (9, 2), (12, 1)],
  term ((-1209916365281 : Rat) / 2997748656) [(0, 1), (9, 2), (12, 1), (14, 1)],
  term ((3846346517369 : Rat) / 9867589326) [(0, 1), (10, 1), (11, 1), (12, 1), (13, 1)],
  term (5 : Rat) [(0, 1), (10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-13825781046887354 : Rat) / 6527410339149) [(0, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-36 : Rat) / 7) [(0, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((239616 : Rat) / 553) [(0, 1), (10, 1), (11, 2), (12, 1)],
  term ((111265302766141 : Rat) / 4351606892766) [(0, 1), (10, 1), (12, 1)],
  term ((623465237564147 : Rat) / 456728420232) [(0, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-10985 : Rat) / 252) [(0, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((3968051523467 : Rat) / 44404151967) [(0, 1), (10, 1), (12, 1), (14, 1)],
  term ((-1236303364839212 : Rat) / 932487191307) [(0, 1), (10, 1), (12, 1), (15, 2)],
  term ((311 : Rat) / 9) [(0, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((27954940475476267 : Rat) / 26109641356596) [(0, 1), (11, 1), (12, 1), (13, 1)],
  term ((-1848692002911661 : Rat) / 3197098941624) [(0, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((10225 : Rat) / 252) [(0, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-425 : Rat) / 14) [(0, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((88872484203048523 : Rat) / 13054820678298) [(0, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-2113 : Rat) / 63) [(0, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((6128799131236 : Rat) / 26861770943) [(0, 1), (11, 1), (12, 1), (14, 2), (15, 1)],
  term ((40189669187402131 : Rat) / 13054820678298) [(0, 1), (11, 1), (12, 1), (15, 1)],
  term ((170 : Rat) / 7) [(0, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((8146155654445411 : Rat) / 8703213785532) [(0, 1), (11, 2), (12, 1)],
  term ((-15822413193419635 : Rat) / 13054820678298) [(0, 1), (11, 2), (12, 1), (14, 1)],
  term ((30161339870263123 : Rat) / 19582231017447) [(0, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((520 : Rat) / 63) [(0, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((110213299130123465 : Rat) / 44759385182736) [(0, 1), (12, 1), (13, 1), (15, 1)],
  term ((-49195 : Rat) / 504) [(0, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2596385212779769 : Rat) / 3197098941624) [(0, 1), (12, 1), (13, 2)],
  term ((7285 : Rat) / 252) [(0, 1), (12, 1), (13, 2), (16, 1)],
  term ((15828609795282337 : Rat) / 52219282713192) [(0, 1), (12, 1), (14, 1)],
  term ((-26197421906329391 : Rat) / 6527410339149) [(0, 1), (12, 1), (14, 1), (15, 2)],
  term ((-592 : Rat) / 63) [(0, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2431355462795051 : Rat) / 7459897530456) [(0, 1), (12, 1), (14, 2)],
  term ((-234180512446582829 : Rat) / 52219282713192) [(0, 1), (12, 1), (15, 2)],
  term ((7619 : Rat) / 126) [(0, 1), (12, 1), (15, 2), (16, 1)],
  term ((2845284778971053 : Rat) / 1826913680928) [(1, 1), (3, 1), (9, 1), (15, 1)],
  term ((-85 : Rat) / 14) [(1, 1), (3, 1), (9, 1), (15, 1), (16, 1)],
  term ((-128159902247 : Rat) / 2569498848) [(1, 1), (3, 1), (9, 2)],
  term ((210703568101 : Rat) / 1498874328) [(1, 1), (3, 1), (9, 2), (10, 1)],
  term ((1209916365281 : Rat) / 2997748656) [(1, 1), (3, 1), (9, 2), (14, 1)],
  term ((-111265302766141 : Rat) / 4351606892766) [(1, 1), (3, 1), (10, 1)],
  term ((-3846346517369 : Rat) / 9867589326) [(1, 1), (3, 1), (10, 1), (11, 1), (13, 1)],
  term (-5 : Rat) [(1, 1), (3, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((13825781046887354 : Rat) / 6527410339149) [(1, 1), (3, 1), (10, 1), (11, 1), (15, 1)],
  term ((36 : Rat) / 7) [(1, 1), (3, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-239616 : Rat) / 553) [(1, 1), (3, 1), (10, 1), (11, 2)],
  term ((-623465237564147 : Rat) / 456728420232) [(1, 1), (3, 1), (10, 1), (13, 1), (15, 1)],
  term ((10985 : Rat) / 252) [(1, 1), (3, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3968051523467 : Rat) / 44404151967) [(1, 1), (3, 1), (10, 1), (14, 1)],
  term ((1236303364839212 : Rat) / 932487191307) [(1, 1), (3, 1), (10, 1), (15, 2)],
  term ((-311 : Rat) / 9) [(1, 1), (3, 1), (10, 1), (15, 2), (16, 1)],
  term ((-27954940475476267 : Rat) / 26109641356596) [(1, 1), (3, 1), (11, 1), (13, 1)],
  term ((1848692002911661 : Rat) / 3197098941624) [(1, 1), (3, 1), (11, 1), (13, 1), (14, 1)],
  term ((-10225 : Rat) / 252) [(1, 1), (3, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((425 : Rat) / 14) [(1, 1), (3, 1), (11, 1), (13, 1), (16, 1)],
  term ((-88872484203048523 : Rat) / 13054820678298) [(1, 1), (3, 1), (11, 1), (14, 1), (15, 1)],
  term ((2113 : Rat) / 63) [(1, 1), (3, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6128799131236 : Rat) / 26861770943) [(1, 1), (3, 1), (11, 1), (14, 2), (15, 1)],
  term ((-40189669187402131 : Rat) / 13054820678298) [(1, 1), (3, 1), (11, 1), (15, 1)],
  term ((-170 : Rat) / 7) [(1, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((-8146155654445411 : Rat) / 8703213785532) [(1, 1), (3, 1), (11, 2)],
  term ((15822413193419635 : Rat) / 13054820678298) [(1, 1), (3, 1), (11, 2), (14, 1)],
  term ((-30161339870263123 : Rat) / 19582231017447) [(1, 1), (3, 1), (13, 1), (14, 1), (15, 1)],
  term ((-520 : Rat) / 63) [(1, 1), (3, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-110213299130123465 : Rat) / 44759385182736) [(1, 1), (3, 1), (13, 1), (15, 1)],
  term ((49195 : Rat) / 504) [(1, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((2596385212779769 : Rat) / 3197098941624) [(1, 1), (3, 1), (13, 2)],
  term ((-7285 : Rat) / 252) [(1, 1), (3, 1), (13, 2), (16, 1)],
  term ((-15828609795282337 : Rat) / 52219282713192) [(1, 1), (3, 1), (14, 1)],
  term ((26197421906329391 : Rat) / 6527410339149) [(1, 1), (3, 1), (14, 1), (15, 2)],
  term ((592 : Rat) / 63) [(1, 1), (3, 1), (14, 1), (15, 2), (16, 1)],
  term ((2431355462795051 : Rat) / 7459897530456) [(1, 1), (3, 1), (14, 2)],
  term ((234180512446582829 : Rat) / 52219282713192) [(1, 1), (3, 1), (15, 2)],
  term ((-7619 : Rat) / 126) [(1, 1), (3, 1), (15, 2), (16, 1)],
  term ((-2845284778971053 : Rat) / 1826913680928) [(1, 1), (9, 1), (13, 1), (15, 1)],
  term ((85 : Rat) / 14) [(1, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-210703568101 : Rat) / 1498874328) [(1, 1), (9, 2), (10, 1), (13, 1)],
  term ((128159902247 : Rat) / 2569498848) [(1, 1), (9, 2), (13, 1)],
  term ((-1209916365281 : Rat) / 2997748656) [(1, 1), (9, 2), (13, 1), (14, 1)],
  term ((-13825781046887354 : Rat) / 6527410339149) [(1, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-36 : Rat) / 7) [(1, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((3846346517369 : Rat) / 9867589326) [(1, 1), (10, 1), (11, 1), (13, 2)],
  term (5 : Rat) [(1, 1), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((239616 : Rat) / 553) [(1, 1), (10, 1), (11, 2), (13, 1)],
  term ((111265302766141 : Rat) / 4351606892766) [(1, 1), (10, 1), (13, 1)],
  term ((3968051523467 : Rat) / 44404151967) [(1, 1), (10, 1), (13, 1), (14, 1)],
  term ((-1236303364839212 : Rat) / 932487191307) [(1, 1), (10, 1), (13, 1), (15, 2)],
  term ((311 : Rat) / 9) [(1, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((623465237564147 : Rat) / 456728420232) [(1, 1), (10, 1), (13, 2), (15, 1)],
  term ((-10985 : Rat) / 252) [(1, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((88872484203048523 : Rat) / 13054820678298) [(1, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-2113 : Rat) / 63) [(1, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((6128799131236 : Rat) / 26861770943) [(1, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((40189669187402131 : Rat) / 13054820678298) [(1, 1), (11, 1), (13, 1), (15, 1)],
  term ((170 : Rat) / 7) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((27954940475476267 : Rat) / 26109641356596) [(1, 1), (11, 1), (13, 2)],
  term ((-1848692002911661 : Rat) / 3197098941624) [(1, 1), (11, 1), (13, 2), (14, 1)],
  term ((10225 : Rat) / 252) [(1, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-425 : Rat) / 14) [(1, 1), (11, 1), (13, 2), (16, 1)],
  term ((8146155654445411 : Rat) / 8703213785532) [(1, 1), (11, 2), (13, 1)],
  term ((-15822413193419635 : Rat) / 13054820678298) [(1, 1), (11, 2), (13, 1), (14, 1)],
  term ((15828609795282337 : Rat) / 52219282713192) [(1, 1), (13, 1), (14, 1)],
  term ((-26197421906329391 : Rat) / 6527410339149) [(1, 1), (13, 1), (14, 1), (15, 2)],
  term ((-592 : Rat) / 63) [(1, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2431355462795051 : Rat) / 7459897530456) [(1, 1), (13, 1), (14, 2)],
  term ((-234180512446582829 : Rat) / 52219282713192) [(1, 1), (13, 1), (15, 2)],
  term ((7619 : Rat) / 126) [(1, 1), (13, 1), (15, 2), (16, 1)],
  term ((30161339870263123 : Rat) / 19582231017447) [(1, 1), (13, 2), (14, 1), (15, 1)],
  term ((520 : Rat) / 63) [(1, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((110213299130123465 : Rat) / 44759385182736) [(1, 1), (13, 2), (15, 1)],
  term ((-49195 : Rat) / 504) [(1, 1), (13, 2), (15, 1), (16, 1)],
  term ((-2596385212779769 : Rat) / 3197098941624) [(1, 1), (13, 3)],
  term ((7285 : Rat) / 252) [(1, 1), (13, 3), (16, 1)],
  term ((-2845284778971053 : Rat) / 3653827361856) [(2, 2), (9, 1), (15, 1)],
  term ((85 : Rat) / 28) [(2, 2), (9, 1), (15, 1), (16, 1)],
  term ((128159902247 : Rat) / 5138997696) [(2, 2), (9, 2)],
  term ((-210703568101 : Rat) / 2997748656) [(2, 2), (9, 2), (10, 1)],
  term ((-1209916365281 : Rat) / 5995497312) [(2, 2), (9, 2), (14, 1)],
  term ((111265302766141 : Rat) / 8703213785532) [(2, 2), (10, 1)],
  term ((3846346517369 : Rat) / 19735178652) [(2, 2), (10, 1), (11, 1), (13, 1)],
  term ((5 : Rat) / 2) [(2, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-6912890523443677 : Rat) / 6527410339149) [(2, 2), (10, 1), (11, 1), (15, 1)],
  term ((-18 : Rat) / 7) [(2, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((119808 : Rat) / 553) [(2, 2), (10, 1), (11, 2)],
  term ((623465237564147 : Rat) / 913456840464) [(2, 2), (10, 1), (13, 1), (15, 1)],
  term ((-10985 : Rat) / 504) [(2, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((3968051523467 : Rat) / 88808303934) [(2, 2), (10, 1), (14, 1)],
  term ((-618151682419606 : Rat) / 932487191307) [(2, 2), (10, 1), (15, 2)],
  term ((311 : Rat) / 18) [(2, 2), (10, 1), (15, 2), (16, 1)],
  term ((27954940475476267 : Rat) / 52219282713192) [(2, 2), (11, 1), (13, 1)],
  term ((-1848692002911661 : Rat) / 6394197883248) [(2, 2), (11, 1), (13, 1), (14, 1)],
  term ((10225 : Rat) / 504) [(2, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-425 : Rat) / 28) [(2, 2), (11, 1), (13, 1), (16, 1)],
  term ((88872484203048523 : Rat) / 26109641356596) [(2, 2), (11, 1), (14, 1), (15, 1)],
  term ((-2113 : Rat) / 126) [(2, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(2, 2), (11, 1), (14, 2), (15, 1)],
  term ((40189669187402131 : Rat) / 26109641356596) [(2, 2), (11, 1), (15, 1)],
  term ((85 : Rat) / 7) [(2, 2), (11, 1), (15, 1), (16, 1)],
  term ((8146155654445411 : Rat) / 17406427571064) [(2, 2), (11, 2)],
  term ((-15822413193419635 : Rat) / 26109641356596) [(2, 2), (11, 2), (14, 1)],
  term ((30161339870263123 : Rat) / 39164462034894) [(2, 2), (13, 1), (14, 1), (15, 1)],
  term ((260 : Rat) / 63) [(2, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((110213299130123465 : Rat) / 89518770365472) [(2, 2), (13, 1), (15, 1)],
  term ((-49195 : Rat) / 1008) [(2, 2), (13, 1), (15, 1), (16, 1)],
  term ((-2596385212779769 : Rat) / 6394197883248) [(2, 2), (13, 2)],
  term ((7285 : Rat) / 504) [(2, 2), (13, 2), (16, 1)],
  term ((15828609795282337 : Rat) / 104438565426384) [(2, 2), (14, 1)],
  term ((-26197421906329391 : Rat) / 13054820678298) [(2, 2), (14, 1), (15, 2)],
  term ((-296 : Rat) / 63) [(2, 2), (14, 1), (15, 2), (16, 1)],
  term ((-2431355462795051 : Rat) / 14919795060912) [(2, 2), (14, 2)],
  term ((-234180512446582829 : Rat) / 104438565426384) [(2, 2), (15, 2)],
  term ((7619 : Rat) / 252) [(2, 2), (15, 2), (16, 1)],
  term ((-2845284778971053 : Rat) / 3653827361856) [(3, 2), (9, 1), (15, 1)],
  term ((85 : Rat) / 28) [(3, 2), (9, 1), (15, 1), (16, 1)],
  term ((128159902247 : Rat) / 5138997696) [(3, 2), (9, 2)],
  term ((-210703568101 : Rat) / 2997748656) [(3, 2), (9, 2), (10, 1)],
  term ((-1209916365281 : Rat) / 5995497312) [(3, 2), (9, 2), (14, 1)],
  term ((111265302766141 : Rat) / 8703213785532) [(3, 2), (10, 1)],
  term ((3846346517369 : Rat) / 19735178652) [(3, 2), (10, 1), (11, 1), (13, 1)],
  term ((5 : Rat) / 2) [(3, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-6912890523443677 : Rat) / 6527410339149) [(3, 2), (10, 1), (11, 1), (15, 1)],
  term ((-18 : Rat) / 7) [(3, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((119808 : Rat) / 553) [(3, 2), (10, 1), (11, 2)],
  term ((623465237564147 : Rat) / 913456840464) [(3, 2), (10, 1), (13, 1), (15, 1)],
  term ((-10985 : Rat) / 504) [(3, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((3968051523467 : Rat) / 88808303934) [(3, 2), (10, 1), (14, 1)],
  term ((-618151682419606 : Rat) / 932487191307) [(3, 2), (10, 1), (15, 2)],
  term ((311 : Rat) / 18) [(3, 2), (10, 1), (15, 2), (16, 1)],
  term ((27954940475476267 : Rat) / 52219282713192) [(3, 2), (11, 1), (13, 1)],
  term ((-1848692002911661 : Rat) / 6394197883248) [(3, 2), (11, 1), (13, 1), (14, 1)],
  term ((10225 : Rat) / 504) [(3, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-425 : Rat) / 28) [(3, 2), (11, 1), (13, 1), (16, 1)],
  term ((88872484203048523 : Rat) / 26109641356596) [(3, 2), (11, 1), (14, 1), (15, 1)],
  term ((-2113 : Rat) / 126) [(3, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(3, 2), (11, 1), (14, 2), (15, 1)],
  term ((40189669187402131 : Rat) / 26109641356596) [(3, 2), (11, 1), (15, 1)],
  term ((85 : Rat) / 7) [(3, 2), (11, 1), (15, 1), (16, 1)],
  term ((8146155654445411 : Rat) / 17406427571064) [(3, 2), (11, 2)],
  term ((-15822413193419635 : Rat) / 26109641356596) [(3, 2), (11, 2), (14, 1)],
  term ((30161339870263123 : Rat) / 39164462034894) [(3, 2), (13, 1), (14, 1), (15, 1)],
  term ((260 : Rat) / 63) [(3, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((110213299130123465 : Rat) / 89518770365472) [(3, 2), (13, 1), (15, 1)],
  term ((-49195 : Rat) / 1008) [(3, 2), (13, 1), (15, 1), (16, 1)],
  term ((-2596385212779769 : Rat) / 6394197883248) [(3, 2), (13, 2)],
  term ((7285 : Rat) / 504) [(3, 2), (13, 2), (16, 1)],
  term ((15828609795282337 : Rat) / 104438565426384) [(3, 2), (14, 1)],
  term ((-26197421906329391 : Rat) / 13054820678298) [(3, 2), (14, 1), (15, 2)],
  term ((-296 : Rat) / 63) [(3, 2), (14, 1), (15, 2), (16, 1)],
  term ((-2431355462795051 : Rat) / 14919795060912) [(3, 2), (14, 2)],
  term ((-234180512446582829 : Rat) / 104438565426384) [(3, 2), (15, 2)],
  term ((7619 : Rat) / 252) [(3, 2), (15, 2), (16, 1)],
  term ((2845284778971053 : Rat) / 3653827361856) [(9, 1), (12, 2), (15, 1)],
  term ((-85 : Rat) / 28) [(9, 1), (12, 2), (15, 1), (16, 1)],
  term ((2845284778971053 : Rat) / 3653827361856) [(9, 1), (13, 2), (15, 1)],
  term ((-85 : Rat) / 28) [(9, 1), (13, 2), (15, 1), (16, 1)],
  term ((210703568101 : Rat) / 2997748656) [(9, 2), (10, 1), (12, 2)],
  term ((210703568101 : Rat) / 2997748656) [(9, 2), (10, 1), (13, 2)],
  term ((-128159902247 : Rat) / 5138997696) [(9, 2), (12, 2)],
  term ((1209916365281 : Rat) / 5995497312) [(9, 2), (12, 2), (14, 1)],
  term ((-128159902247 : Rat) / 5138997696) [(9, 2), (13, 2)],
  term ((1209916365281 : Rat) / 5995497312) [(9, 2), (13, 2), (14, 1)],
  term ((-3846346517369 : Rat) / 19735178652) [(10, 1), (11, 1), (12, 2), (13, 1)],
  term ((-5 : Rat) / 2) [(10, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((6912890523443677 : Rat) / 6527410339149) [(10, 1), (11, 1), (12, 2), (15, 1)],
  term ((18 : Rat) / 7) [(10, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((6912890523443677 : Rat) / 6527410339149) [(10, 1), (11, 1), (13, 2), (15, 1)],
  term ((18 : Rat) / 7) [(10, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-3846346517369 : Rat) / 19735178652) [(10, 1), (11, 1), (13, 3)],
  term ((-5 : Rat) / 2) [(10, 1), (11, 1), (13, 3), (16, 1)],
  term ((-119808 : Rat) / 553) [(10, 1), (11, 2), (12, 2)],
  term ((-119808 : Rat) / 553) [(10, 1), (11, 2), (13, 2)],
  term ((-111265302766141 : Rat) / 8703213785532) [(10, 1), (12, 2)],
  term ((-623465237564147 : Rat) / 913456840464) [(10, 1), (12, 2), (13, 1), (15, 1)],
  term ((10985 : Rat) / 504) [(10, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-3968051523467 : Rat) / 88808303934) [(10, 1), (12, 2), (14, 1)],
  term ((618151682419606 : Rat) / 932487191307) [(10, 1), (12, 2), (15, 2)],
  term ((-311 : Rat) / 18) [(10, 1), (12, 2), (15, 2), (16, 1)],
  term ((-111265302766141 : Rat) / 8703213785532) [(10, 1), (13, 2)],
  term ((-3968051523467 : Rat) / 88808303934) [(10, 1), (13, 2), (14, 1)],
  term ((618151682419606 : Rat) / 932487191307) [(10, 1), (13, 2), (15, 2)],
  term ((-311 : Rat) / 18) [(10, 1), (13, 2), (15, 2), (16, 1)],
  term ((-623465237564147 : Rat) / 913456840464) [(10, 1), (13, 3), (15, 1)],
  term ((10985 : Rat) / 504) [(10, 1), (13, 3), (15, 1), (16, 1)],
  term ((-27954940475476267 : Rat) / 52219282713192) [(11, 1), (12, 2), (13, 1)],
  term ((1848692002911661 : Rat) / 6394197883248) [(11, 1), (12, 2), (13, 1), (14, 1)],
  term ((-10225 : Rat) / 504) [(11, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((425 : Rat) / 28) [(11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-88872484203048523 : Rat) / 26109641356596) [(11, 1), (12, 2), (14, 1), (15, 1)],
  term ((2113 : Rat) / 126) [(11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(11, 1), (12, 2), (14, 2), (15, 1)],
  term ((-40189669187402131 : Rat) / 26109641356596) [(11, 1), (12, 2), (15, 1)],
  term ((-85 : Rat) / 7) [(11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-88872484203048523 : Rat) / 26109641356596) [(11, 1), (13, 2), (14, 1), (15, 1)],
  term ((2113 : Rat) / 126) [(11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(11, 1), (13, 2), (14, 2), (15, 1)],
  term ((-40189669187402131 : Rat) / 26109641356596) [(11, 1), (13, 2), (15, 1)],
  term ((-85 : Rat) / 7) [(11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-27954940475476267 : Rat) / 52219282713192) [(11, 1), (13, 3)],
  term ((1848692002911661 : Rat) / 6394197883248) [(11, 1), (13, 3), (14, 1)],
  term ((-10225 : Rat) / 504) [(11, 1), (13, 3), (14, 1), (16, 1)],
  term ((425 : Rat) / 28) [(11, 1), (13, 3), (16, 1)],
  term ((-8146155654445411 : Rat) / 17406427571064) [(11, 2), (12, 2)],
  term ((15822413193419635 : Rat) / 26109641356596) [(11, 2), (12, 2), (14, 1)],
  term ((-8146155654445411 : Rat) / 17406427571064) [(11, 2), (13, 2)],
  term ((15822413193419635 : Rat) / 26109641356596) [(11, 2), (13, 2), (14, 1)],
  term ((-30161339870263123 : Rat) / 39164462034894) [(12, 2), (13, 1), (14, 1), (15, 1)],
  term ((-260 : Rat) / 63) [(12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-110213299130123465 : Rat) / 89518770365472) [(12, 2), (13, 1), (15, 1)],
  term ((49195 : Rat) / 1008) [(12, 2), (13, 1), (15, 1), (16, 1)],
  term ((2596385212779769 : Rat) / 6394197883248) [(12, 2), (13, 2)],
  term ((-7285 : Rat) / 504) [(12, 2), (13, 2), (16, 1)],
  term ((-15828609795282337 : Rat) / 104438565426384) [(12, 2), (14, 1)],
  term ((26197421906329391 : Rat) / 13054820678298) [(12, 2), (14, 1), (15, 2)],
  term ((296 : Rat) / 63) [(12, 2), (14, 1), (15, 2), (16, 1)],
  term ((2431355462795051 : Rat) / 14919795060912) [(12, 2), (14, 2)],
  term ((234180512446582829 : Rat) / 104438565426384) [(12, 2), (15, 2)],
  term ((-7619 : Rat) / 252) [(12, 2), (15, 2), (16, 1)],
  term ((-15828609795282337 : Rat) / 104438565426384) [(13, 2), (14, 1)],
  term ((26197421906329391 : Rat) / 13054820678298) [(13, 2), (14, 1), (15, 2)],
  term ((296 : Rat) / 63) [(13, 2), (14, 1), (15, 2), (16, 1)],
  term ((2431355462795051 : Rat) / 14919795060912) [(13, 2), (14, 2)],
  term ((234180512446582829 : Rat) / 104438565426384) [(13, 2), (15, 2)],
  term ((-7619 : Rat) / 252) [(13, 2), (15, 2), (16, 1)],
  term ((-30161339870263123 : Rat) / 39164462034894) [(13, 3), (14, 1), (15, 1)],
  term ((-260 : Rat) / 63) [(13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-110213299130123465 : Rat) / 89518770365472) [(13, 3), (15, 1)],
  term ((49195 : Rat) / 1008) [(13, 3), (15, 1), (16, 1)],
  term ((2596385212779769 : Rat) / 6394197883248) [(13, 4)],
  term ((-7285 : Rat) / 504) [(13, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 9, terms 200 through 238. -/
theorem rs_R009_ueqv_R009YNNNN_block_09_0200_0238_valid :
    checkProductSumEq rs_R009_ueqv_R009YNNNN_partials_09_0200_0238
      rs_R009_ueqv_R009YNNNN_block_09_0200_0238 = true := by
  native_decide

end R009UeqvR009YNNNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
