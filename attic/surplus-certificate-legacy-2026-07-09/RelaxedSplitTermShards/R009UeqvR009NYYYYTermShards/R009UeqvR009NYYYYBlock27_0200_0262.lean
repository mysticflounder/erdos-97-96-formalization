/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NYYYY, term block 27:200-262

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NYYYYTermShards

/-- Generator polynomial 27 for relaxed split surplus certificate `R009:u=v:R009NYYYY`. -/
def rs_R009_ueqv_R009NYYYY_generator_27_0200_0262 : Poly :=
[
  term (1 : Rat) [],
  term (-2 : Rat) [(12, 1)],
  term (2 : Rat) [(12, 1), (14, 1)],
  term (2 : Rat) [(13, 1), (15, 1)],
  term (-1 : Rat) [(14, 2)],
  term (-1 : Rat) [(15, 2)]
]

/-- Coefficient term 200 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0200 : Poly :=
[
  term ((381240 : Rat) / 32699) [(10, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 200 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0200 : Poly :=
[
  term ((-381240 : Rat) / 32699) [(10, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((381240 : Rat) / 32699) [(10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-381240 : Rat) / 32699) [(10, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((762480 : Rat) / 32699) [(10, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((762480 : Rat) / 32699) [(10, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-762480 : Rat) / 32699) [(10, 1), (12, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 200 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0200_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0200
        rs_R009_ueqv_R009NYYYY_generator_27_0200_0262 =
      rs_R009_ueqv_R009NYYYY_partial_27_0200 := by
  native_decide

/-- Coefficient term 201 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0201 : Poly :=
[
  term ((-3986508072 : Rat) / 33189485) [(10, 1), (12, 1), (15, 2)]
]

/-- Partial product 201 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0201 : Poly :=
[
  term ((-7973016144 : Rat) / 33189485) [(10, 1), (12, 1), (13, 1), (15, 3)],
  term ((3986508072 : Rat) / 33189485) [(10, 1), (12, 1), (14, 2), (15, 2)],
  term ((-3986508072 : Rat) / 33189485) [(10, 1), (12, 1), (15, 2)],
  term ((3986508072 : Rat) / 33189485) [(10, 1), (12, 1), (15, 4)],
  term ((-7973016144 : Rat) / 33189485) [(10, 1), (12, 2), (14, 1), (15, 2)],
  term ((7973016144 : Rat) / 33189485) [(10, 1), (12, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 201 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0201_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0201
        rs_R009_ueqv_R009NYYYY_generator_27_0200_0262 =
      rs_R009_ueqv_R009NYYYY_partial_27_0201 := by
  native_decide

/-- Coefficient term 202 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0202 : Poly :=
[
  term ((762480 : Rat) / 32699) [(10, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 202 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0202 : Poly :=
[
  term ((1524960 : Rat) / 32699) [(10, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-762480 : Rat) / 32699) [(10, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((762480 : Rat) / 32699) [(10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-762480 : Rat) / 32699) [(10, 1), (12, 1), (15, 4), (16, 1)],
  term ((1524960 : Rat) / 32699) [(10, 1), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((-1524960 : Rat) / 32699) [(10, 1), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 202 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0202_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0202
        rs_R009_ueqv_R009NYYYY_generator_27_0200_0262 =
      rs_R009_ueqv_R009NYYYY_partial_27_0202 := by
  native_decide

/-- Coefficient term 203 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0203 : Poly :=
[
  term ((21427480887 : Rat) / 66378970) [(10, 1), (13, 1), (15, 1)]
]

/-- Partial product 203 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0203 : Poly :=
[
  term ((21427480887 : Rat) / 33189485) [(10, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-21427480887 : Rat) / 33189485) [(10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-21427480887 : Rat) / 66378970) [(10, 1), (13, 1), (14, 2), (15, 1)],
  term ((21427480887 : Rat) / 66378970) [(10, 1), (13, 1), (15, 1)],
  term ((-21427480887 : Rat) / 66378970) [(10, 1), (13, 1), (15, 3)],
  term ((21427480887 : Rat) / 33189485) [(10, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 203 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0203_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0203
        rs_R009_ueqv_R009NYYYY_generator_27_0200_0262 =
      rs_R009_ueqv_R009NYYYY_partial_27_0203 := by
  native_decide

/-- Coefficient term 204 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0204 : Poly :=
[
  term ((-2049165 : Rat) / 32699) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 204 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0204 : Poly :=
[
  term ((-4098330 : Rat) / 32699) [(10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((4098330 : Rat) / 32699) [(10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((2049165 : Rat) / 32699) [(10, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-2049165 : Rat) / 32699) [(10, 1), (13, 1), (15, 1), (16, 1)],
  term ((2049165 : Rat) / 32699) [(10, 1), (13, 1), (15, 3), (16, 1)],
  term ((-4098330 : Rat) / 32699) [(10, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 204 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0204_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0204
        rs_R009_ueqv_R009NYYYY_generator_27_0200_0262 =
      rs_R009_ueqv_R009NYYYY_partial_27_0204 := by
  native_decide

/-- Coefficient term 205 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0205 : Poly :=
[
  term ((-8969643162 : Rat) / 6637897) [(10, 1), (13, 1), (15, 3)]
]

/-- Partial product 205 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0205 : Poly :=
[
  term ((-17939286324 : Rat) / 6637897) [(10, 1), (12, 1), (13, 1), (14, 1), (15, 3)],
  term ((17939286324 : Rat) / 6637897) [(10, 1), (12, 1), (13, 1), (15, 3)],
  term ((8969643162 : Rat) / 6637897) [(10, 1), (13, 1), (14, 2), (15, 3)],
  term ((-8969643162 : Rat) / 6637897) [(10, 1), (13, 1), (15, 3)],
  term ((8969643162 : Rat) / 6637897) [(10, 1), (13, 1), (15, 5)],
  term ((-17939286324 : Rat) / 6637897) [(10, 1), (13, 2), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 205 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0205_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0205
        rs_R009_ueqv_R009NYYYY_generator_27_0200_0262 =
      rs_R009_ueqv_R009NYYYY_partial_27_0205 := by
  native_decide

/-- Coefficient term 206 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0206 : Poly :=
[
  term ((8577900 : Rat) / 32699) [(10, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 206 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0206 : Poly :=
[
  term ((17155800 : Rat) / 32699) [(10, 1), (12, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-17155800 : Rat) / 32699) [(10, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-8577900 : Rat) / 32699) [(10, 1), (13, 1), (14, 2), (15, 3), (16, 1)],
  term ((8577900 : Rat) / 32699) [(10, 1), (13, 1), (15, 3), (16, 1)],
  term ((-8577900 : Rat) / 32699) [(10, 1), (13, 1), (15, 5), (16, 1)],
  term ((17155800 : Rat) / 32699) [(10, 1), (13, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 206 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0206_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0206
        rs_R009_ueqv_R009NYYYY_generator_27_0200_0262 =
      rs_R009_ueqv_R009NYYYY_partial_27_0206 := by
  native_decide

/-- Coefficient term 207 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0207 : Poly :=
[
  term ((-3986508072 : Rat) / 33189485) [(10, 1), (13, 2), (15, 2)]
]

/-- Partial product 207 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0207 : Poly :=
[
  term ((-7973016144 : Rat) / 33189485) [(10, 1), (12, 1), (13, 2), (14, 1), (15, 2)],
  term ((7973016144 : Rat) / 33189485) [(10, 1), (12, 1), (13, 2), (15, 2)],
  term ((3986508072 : Rat) / 33189485) [(10, 1), (13, 2), (14, 2), (15, 2)],
  term ((-3986508072 : Rat) / 33189485) [(10, 1), (13, 2), (15, 2)],
  term ((3986508072 : Rat) / 33189485) [(10, 1), (13, 2), (15, 4)],
  term ((-7973016144 : Rat) / 33189485) [(10, 1), (13, 3), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 207 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0207_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0207
        rs_R009_ueqv_R009NYYYY_generator_27_0200_0262 =
      rs_R009_ueqv_R009NYYYY_partial_27_0207 := by
  native_decide

/-- Coefficient term 208 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0208 : Poly :=
[
  term ((762480 : Rat) / 32699) [(10, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 208 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0208 : Poly :=
[
  term ((1524960 : Rat) / 32699) [(10, 1), (12, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-1524960 : Rat) / 32699) [(10, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-762480 : Rat) / 32699) [(10, 1), (13, 2), (14, 2), (15, 2), (16, 1)],
  term ((762480 : Rat) / 32699) [(10, 1), (13, 2), (15, 2), (16, 1)],
  term ((-762480 : Rat) / 32699) [(10, 1), (13, 2), (15, 4), (16, 1)],
  term ((1524960 : Rat) / 32699) [(10, 1), (13, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 208 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0208_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0208
        rs_R009_ueqv_R009NYYYY_generator_27_0200_0262 =
      rs_R009_ueqv_R009NYYYY_partial_27_0208 := by
  native_decide

/-- Coefficient term 209 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0209 : Poly :=
[
  term ((82063310695 : Rat) / 159309528) [(10, 1), (15, 2)]
]

/-- Partial product 209 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0209 : Poly :=
[
  term ((82063310695 : Rat) / 79654764) [(10, 1), (12, 1), (14, 1), (15, 2)],
  term ((-82063310695 : Rat) / 79654764) [(10, 1), (12, 1), (15, 2)],
  term ((82063310695 : Rat) / 79654764) [(10, 1), (13, 1), (15, 3)],
  term ((-82063310695 : Rat) / 159309528) [(10, 1), (14, 2), (15, 2)],
  term ((82063310695 : Rat) / 159309528) [(10, 1), (15, 2)],
  term ((-82063310695 : Rat) / 159309528) [(10, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 209 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0209_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0209
        rs_R009_ueqv_R009NYYYY_generator_27_0200_0262 =
      rs_R009_ueqv_R009NYYYY_partial_27_0209 := by
  native_decide

/-- Coefficient term 210 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0210 : Poly :=
[
  term ((-19635821 : Rat) / 196194) [(10, 1), (15, 2), (16, 1)]
]

/-- Partial product 210 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0210 : Poly :=
[
  term ((-19635821 : Rat) / 98097) [(10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((19635821 : Rat) / 98097) [(10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-19635821 : Rat) / 98097) [(10, 1), (13, 1), (15, 3), (16, 1)],
  term ((19635821 : Rat) / 196194) [(10, 1), (14, 2), (15, 2), (16, 1)],
  term ((-19635821 : Rat) / 196194) [(10, 1), (15, 2), (16, 1)],
  term ((19635821 : Rat) / 196194) [(10, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 210 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0210_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0210
        rs_R009_ueqv_R009NYYYY_generator_27_0200_0262 =
      rs_R009_ueqv_R009NYYYY_partial_27_0210 := by
  native_decide

/-- Coefficient term 211 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0211 : Poly :=
[
  term ((-166104503 : Rat) / 1746815) [(10, 1), (15, 4)]
]

/-- Partial product 211 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0211 : Poly :=
[
  term ((-332209006 : Rat) / 1746815) [(10, 1), (12, 1), (14, 1), (15, 4)],
  term ((332209006 : Rat) / 1746815) [(10, 1), (12, 1), (15, 4)],
  term ((-332209006 : Rat) / 1746815) [(10, 1), (13, 1), (15, 5)],
  term ((166104503 : Rat) / 1746815) [(10, 1), (14, 2), (15, 4)],
  term ((-166104503 : Rat) / 1746815) [(10, 1), (15, 4)],
  term ((166104503 : Rat) / 1746815) [(10, 1), (15, 6)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 211 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0211_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0211
        rs_R009_ueqv_R009NYYYY_generator_27_0200_0262 =
      rs_R009_ueqv_R009NYYYY_partial_27_0211 := by
  native_decide

/-- Coefficient term 212 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0212 : Poly :=
[
  term ((31770 : Rat) / 1721) [(10, 1), (15, 4), (16, 1)]
]

/-- Partial product 212 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0212 : Poly :=
[
  term ((63540 : Rat) / 1721) [(10, 1), (12, 1), (14, 1), (15, 4), (16, 1)],
  term ((-63540 : Rat) / 1721) [(10, 1), (12, 1), (15, 4), (16, 1)],
  term ((63540 : Rat) / 1721) [(10, 1), (13, 1), (15, 5), (16, 1)],
  term ((-31770 : Rat) / 1721) [(10, 1), (14, 2), (15, 4), (16, 1)],
  term ((31770 : Rat) / 1721) [(10, 1), (15, 4), (16, 1)],
  term ((-31770 : Rat) / 1721) [(10, 1), (15, 6), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 212 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0212_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0212
        rs_R009_ueqv_R009NYYYY_generator_27_0200_0262 =
      rs_R009_ueqv_R009NYYYY_partial_27_0212 := by
  native_decide

/-- Coefficient term 213 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0213 : Poly :=
[
  term ((-2906755500 : Rat) / 6637897) [(11, 1), (12, 1), (13, 1), (15, 2)]
]

/-- Partial product 213 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0213 : Poly :=
[
  term ((2906755500 : Rat) / 6637897) [(11, 1), (12, 1), (13, 1), (14, 2), (15, 2)],
  term ((-2906755500 : Rat) / 6637897) [(11, 1), (12, 1), (13, 1), (15, 2)],
  term ((2906755500 : Rat) / 6637897) [(11, 1), (12, 1), (13, 1), (15, 4)],
  term ((-5813511000 : Rat) / 6637897) [(11, 1), (12, 1), (13, 2), (15, 3)],
  term ((-5813511000 : Rat) / 6637897) [(11, 1), (12, 2), (13, 1), (14, 1), (15, 2)],
  term ((5813511000 : Rat) / 6637897) [(11, 1), (12, 2), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 213 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0213_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0213
        rs_R009_ueqv_R009NYYYY_generator_27_0200_0262 =
      rs_R009_ueqv_R009NYYYY_partial_27_0213 := by
  native_decide

/-- Coefficient term 214 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0214 : Poly :=
[
  term ((2760000 : Rat) / 32699) [(11, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 214 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0214 : Poly :=
[
  term ((-2760000 : Rat) / 32699) [(11, 1), (12, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((2760000 : Rat) / 32699) [(11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2760000 : Rat) / 32699) [(11, 1), (12, 1), (13, 1), (15, 4), (16, 1)],
  term ((5520000 : Rat) / 32699) [(11, 1), (12, 1), (13, 2), (15, 3), (16, 1)],
  term ((5520000 : Rat) / 32699) [(11, 1), (12, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-5520000 : Rat) / 32699) [(11, 1), (12, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 214 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0214_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0214
        rs_R009_ueqv_R009NYYYY_generator_27_0200_0262 =
      rs_R009_ueqv_R009NYYYY_partial_27_0214 := by
  native_decide

/-- Coefficient term 215 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0215 : Poly :=
[
  term ((6896576970 : Rat) / 6637897) [(11, 1), (12, 1), (15, 1)]
]

/-- Partial product 215 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0215 : Poly :=
[
  term ((13793153940 : Rat) / 6637897) [(11, 1), (12, 1), (13, 1), (15, 2)],
  term ((-6896576970 : Rat) / 6637897) [(11, 1), (12, 1), (14, 2), (15, 1)],
  term ((6896576970 : Rat) / 6637897) [(11, 1), (12, 1), (15, 1)],
  term ((-6896576970 : Rat) / 6637897) [(11, 1), (12, 1), (15, 3)],
  term ((13793153940 : Rat) / 6637897) [(11, 1), (12, 2), (14, 1), (15, 1)],
  term ((-13793153940 : Rat) / 6637897) [(11, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 215 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0215_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0215
        rs_R009_ueqv_R009NYYYY_generator_27_0200_0262 =
      rs_R009_ueqv_R009NYYYY_partial_27_0215 := by
  native_decide

/-- Coefficient term 216 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0216 : Poly :=
[
  term ((-6601522 : Rat) / 32699) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 216 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0216 : Poly :=
[
  term ((-13203044 : Rat) / 32699) [(11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((6601522 : Rat) / 32699) [(11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-6601522 : Rat) / 32699) [(11, 1), (12, 1), (15, 1), (16, 1)],
  term ((6601522 : Rat) / 32699) [(11, 1), (12, 1), (15, 3), (16, 1)],
  term ((-13203044 : Rat) / 32699) [(11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((13203044 : Rat) / 32699) [(11, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 216 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0216_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0216
        rs_R009_ueqv_R009NYYYY_generator_27_0200_0262 =
      rs_R009_ueqv_R009NYYYY_partial_27_0216 := by
  native_decide

/-- Coefficient term 217 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0217 : Poly :=
[
  term ((-1778934366 : Rat) / 6637897) [(11, 1), (12, 1), (15, 3)]
]

/-- Partial product 217 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0217 : Poly :=
[
  term ((-3557868732 : Rat) / 6637897) [(11, 1), (12, 1), (13, 1), (15, 4)],
  term ((1778934366 : Rat) / 6637897) [(11, 1), (12, 1), (14, 2), (15, 3)],
  term ((-1778934366 : Rat) / 6637897) [(11, 1), (12, 1), (15, 3)],
  term ((1778934366 : Rat) / 6637897) [(11, 1), (12, 1), (15, 5)],
  term ((-3557868732 : Rat) / 6637897) [(11, 1), (12, 2), (14, 1), (15, 3)],
  term ((3557868732 : Rat) / 6637897) [(11, 1), (12, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 217 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0217_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0217
        rs_R009_ueqv_R009NYYYY_generator_27_0200_0262 =
      rs_R009_ueqv_R009NYYYY_partial_27_0217 := by
  native_decide

/-- Coefficient term 218 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0218 : Poly :=
[
  term ((1689120 : Rat) / 32699) [(11, 1), (12, 1), (15, 3), (16, 1)]
]

/-- Partial product 218 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0218 : Poly :=
[
  term ((3378240 : Rat) / 32699) [(11, 1), (12, 1), (13, 1), (15, 4), (16, 1)],
  term ((-1689120 : Rat) / 32699) [(11, 1), (12, 1), (14, 2), (15, 3), (16, 1)],
  term ((1689120 : Rat) / 32699) [(11, 1), (12, 1), (15, 3), (16, 1)],
  term ((-1689120 : Rat) / 32699) [(11, 1), (12, 1), (15, 5), (16, 1)],
  term ((3378240 : Rat) / 32699) [(11, 1), (12, 2), (14, 1), (15, 3), (16, 1)],
  term ((-3378240 : Rat) / 32699) [(11, 1), (12, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 218 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0218_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0218
        rs_R009_ueqv_R009NYYYY_generator_27_0200_0262 =
      rs_R009_ueqv_R009NYYYY_partial_27_0218 := by
  native_decide

/-- Coefficient term 219 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0219 : Poly :=
[
  term ((-285867378 : Rat) / 4741355) [(11, 1), (13, 1), (15, 2)]
]

/-- Partial product 219 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0219 : Poly :=
[
  term ((-571734756 : Rat) / 4741355) [(11, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((571734756 : Rat) / 4741355) [(11, 1), (12, 1), (13, 1), (15, 2)],
  term ((285867378 : Rat) / 4741355) [(11, 1), (13, 1), (14, 2), (15, 2)],
  term ((-285867378 : Rat) / 4741355) [(11, 1), (13, 1), (15, 2)],
  term ((285867378 : Rat) / 4741355) [(11, 1), (13, 1), (15, 4)],
  term ((-571734756 : Rat) / 4741355) [(11, 1), (13, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 219 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0219_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0219
        rs_R009_ueqv_R009NYYYY_generator_27_0200_0262 =
      rs_R009_ueqv_R009NYYYY_partial_27_0219 := by
  native_decide

/-- Coefficient term 220 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0220 : Poly :=
[
  term ((416224 : Rat) / 32699) [(11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 220 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0220 : Poly :=
[
  term ((832448 : Rat) / 32699) [(11, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-832448 : Rat) / 32699) [(11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-416224 : Rat) / 32699) [(11, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((416224 : Rat) / 32699) [(11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-416224 : Rat) / 32699) [(11, 1), (13, 1), (15, 4), (16, 1)],
  term ((832448 : Rat) / 32699) [(11, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 220 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0220_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0220
        rs_R009_ueqv_R009NYYYY_generator_27_0200_0262 =
      rs_R009_ueqv_R009NYYYY_partial_27_0220 := by
  native_decide

/-- Coefficient term 221 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0221 : Poly :=
[
  term ((-10658103500 : Rat) / 6637897) [(11, 1), (13, 1), (15, 4)]
]

/-- Partial product 221 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0221 : Poly :=
[
  term ((-21316207000 : Rat) / 6637897) [(11, 1), (12, 1), (13, 1), (14, 1), (15, 4)],
  term ((21316207000 : Rat) / 6637897) [(11, 1), (12, 1), (13, 1), (15, 4)],
  term ((10658103500 : Rat) / 6637897) [(11, 1), (13, 1), (14, 2), (15, 4)],
  term ((-10658103500 : Rat) / 6637897) [(11, 1), (13, 1), (15, 4)],
  term ((10658103500 : Rat) / 6637897) [(11, 1), (13, 1), (15, 6)],
  term ((-21316207000 : Rat) / 6637897) [(11, 1), (13, 2), (15, 5)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 221 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0221_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0221
        rs_R009_ueqv_R009NYYYY_generator_27_0200_0262 =
      rs_R009_ueqv_R009NYYYY_partial_27_0221 := by
  native_decide

/-- Coefficient term 222 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0222 : Poly :=
[
  term ((10120000 : Rat) / 32699) [(11, 1), (13, 1), (15, 4), (16, 1)]
]

/-- Partial product 222 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0222 : Poly :=
[
  term ((20240000 : Rat) / 32699) [(11, 1), (12, 1), (13, 1), (14, 1), (15, 4), (16, 1)],
  term ((-20240000 : Rat) / 32699) [(11, 1), (12, 1), (13, 1), (15, 4), (16, 1)],
  term ((-10120000 : Rat) / 32699) [(11, 1), (13, 1), (14, 2), (15, 4), (16, 1)],
  term ((10120000 : Rat) / 32699) [(11, 1), (13, 1), (15, 4), (16, 1)],
  term ((-10120000 : Rat) / 32699) [(11, 1), (13, 1), (15, 6), (16, 1)],
  term ((20240000 : Rat) / 32699) [(11, 1), (13, 2), (15, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 222 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0222_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0222
        rs_R009_ueqv_R009NYYYY_generator_27_0200_0262 =
      rs_R009_ueqv_R009NYYYY_partial_27_0222 := by
  native_decide

/-- Coefficient term 223 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0223 : Poly :=
[
  term ((-311503707161 : Rat) / 199136910) [(11, 1), (15, 1)]
]

/-- Partial product 223 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0223 : Poly :=
[
  term ((-311503707161 : Rat) / 99568455) [(11, 1), (12, 1), (14, 1), (15, 1)],
  term ((311503707161 : Rat) / 99568455) [(11, 1), (12, 1), (15, 1)],
  term ((-311503707161 : Rat) / 99568455) [(11, 1), (13, 1), (15, 2)],
  term ((311503707161 : Rat) / 199136910) [(11, 1), (14, 2), (15, 1)],
  term ((-311503707161 : Rat) / 199136910) [(11, 1), (15, 1)],
  term ((311503707161 : Rat) / 199136910) [(11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 223 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0223_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0223
        rs_R009_ueqv_R009NYYYY_generator_27_0200_0262 =
      rs_R009_ueqv_R009NYYYY_partial_27_0223 := by
  native_decide

/-- Coefficient term 224 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0224 : Poly :=
[
  term ((29807530 : Rat) / 98097) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 224 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0224 : Poly :=
[
  term ((59615060 : Rat) / 98097) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-59615060 : Rat) / 98097) [(11, 1), (12, 1), (15, 1), (16, 1)],
  term ((59615060 : Rat) / 98097) [(11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-29807530 : Rat) / 98097) [(11, 1), (14, 2), (15, 1), (16, 1)],
  term ((29807530 : Rat) / 98097) [(11, 1), (15, 1), (16, 1)],
  term ((-29807530 : Rat) / 98097) [(11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 224 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0224_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0224
        rs_R009_ueqv_R009NYYYY_generator_27_0200_0262 =
      rs_R009_ueqv_R009NYYYY_partial_27_0224 := by
  native_decide

/-- Coefficient term 225 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0225 : Poly :=
[
  term ((26613716015 : Rat) / 26551588) [(11, 1), (15, 3)]
]

/-- Partial product 225 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0225 : Poly :=
[
  term ((26613716015 : Rat) / 13275794) [(11, 1), (12, 1), (14, 1), (15, 3)],
  term ((-26613716015 : Rat) / 13275794) [(11, 1), (12, 1), (15, 3)],
  term ((26613716015 : Rat) / 13275794) [(11, 1), (13, 1), (15, 4)],
  term ((-26613716015 : Rat) / 26551588) [(11, 1), (14, 2), (15, 3)],
  term ((26613716015 : Rat) / 26551588) [(11, 1), (15, 3)],
  term ((-26613716015 : Rat) / 26551588) [(11, 1), (15, 5)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 225 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0225_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0225
        rs_R009_ueqv_R009NYYYY_generator_27_0200_0262 =
      rs_R009_ueqv_R009NYYYY_partial_27_0225 := by
  native_decide

/-- Coefficient term 226 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0226 : Poly :=
[
  term ((-6320032 : Rat) / 32699) [(11, 1), (15, 3), (16, 1)]
]

/-- Partial product 226 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0226 : Poly :=
[
  term ((-12640064 : Rat) / 32699) [(11, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((12640064 : Rat) / 32699) [(11, 1), (12, 1), (15, 3), (16, 1)],
  term ((-12640064 : Rat) / 32699) [(11, 1), (13, 1), (15, 4), (16, 1)],
  term ((6320032 : Rat) / 32699) [(11, 1), (14, 2), (15, 3), (16, 1)],
  term ((-6320032 : Rat) / 32699) [(11, 1), (15, 3), (16, 1)],
  term ((6320032 : Rat) / 32699) [(11, 1), (15, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 226 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0226_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0226
        rs_R009_ueqv_R009NYYYY_generator_27_0200_0262 =
      rs_R009_ueqv_R009NYYYY_partial_27_0226 := by
  native_decide

/-- Coefficient term 227 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0227 : Poly :=
[
  term ((6883197024 : Rat) / 33189485) [(11, 2), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 227 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0227 : Poly :=
[
  term ((-6883197024 : Rat) / 33189485) [(11, 2), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((6883197024 : Rat) / 33189485) [(11, 2), (12, 1), (13, 1), (15, 1)],
  term ((-6883197024 : Rat) / 33189485) [(11, 2), (12, 1), (13, 1), (15, 3)],
  term ((13766394048 : Rat) / 33189485) [(11, 2), (12, 1), (13, 2), (15, 2)],
  term ((13766394048 : Rat) / 33189485) [(11, 2), (12, 2), (13, 1), (14, 1), (15, 1)],
  term ((-13766394048 : Rat) / 33189485) [(11, 2), (12, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 227 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0227_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0227
        rs_R009_ueqv_R009NYYYY_generator_27_0200_0262 =
      rs_R009_ueqv_R009NYYYY_partial_27_0227 := by
  native_decide

/-- Coefficient term 228 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0228 : Poly :=
[
  term ((-1307136 : Rat) / 32699) [(11, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 228 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0228 : Poly :=
[
  term ((1307136 : Rat) / 32699) [(11, 2), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1307136 : Rat) / 32699) [(11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1307136 : Rat) / 32699) [(11, 2), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-2614272 : Rat) / 32699) [(11, 2), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-2614272 : Rat) / 32699) [(11, 2), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((2614272 : Rat) / 32699) [(11, 2), (12, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 228 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0228_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0228
        rs_R009_ueqv_R009NYYYY_generator_27_0200_0262 =
      rs_R009_ueqv_R009NYYYY_partial_27_0228 := by
  native_decide

/-- Coefficient term 229 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0229 : Poly :=
[
  term ((-2046355872 : Rat) / 6637897) [(11, 2), (12, 1), (15, 2)]
]

/-- Partial product 229 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0229 : Poly :=
[
  term ((-4092711744 : Rat) / 6637897) [(11, 2), (12, 1), (13, 1), (15, 3)],
  term ((2046355872 : Rat) / 6637897) [(11, 2), (12, 1), (14, 2), (15, 2)],
  term ((-2046355872 : Rat) / 6637897) [(11, 2), (12, 1), (15, 2)],
  term ((2046355872 : Rat) / 6637897) [(11, 2), (12, 1), (15, 4)],
  term ((-4092711744 : Rat) / 6637897) [(11, 2), (12, 2), (14, 1), (15, 2)],
  term ((4092711744 : Rat) / 6637897) [(11, 2), (12, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 229 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0229_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0229
        rs_R009_ueqv_R009NYYYY_generator_27_0200_0262 =
      rs_R009_ueqv_R009NYYYY_partial_27_0229 := by
  native_decide

/-- Coefficient term 230 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0230 : Poly :=
[
  term ((1943040 : Rat) / 32699) [(11, 2), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 230 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0230 : Poly :=
[
  term ((3886080 : Rat) / 32699) [(11, 2), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-1943040 : Rat) / 32699) [(11, 2), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((1943040 : Rat) / 32699) [(11, 2), (12, 1), (15, 2), (16, 1)],
  term ((-1943040 : Rat) / 32699) [(11, 2), (12, 1), (15, 4), (16, 1)],
  term ((3886080 : Rat) / 32699) [(11, 2), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((-3886080 : Rat) / 32699) [(11, 2), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 230 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0230_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0230
        rs_R009_ueqv_R009NYYYY_generator_27_0200_0262 =
      rs_R009_ueqv_R009NYYYY_partial_27_0230 := by
  native_decide

/-- Coefficient term 231 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0231 : Poly :=
[
  term ((-14657799068 : Rat) / 33189485) [(11, 2), (13, 1), (15, 1)]
]

/-- Partial product 231 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0231 : Poly :=
[
  term ((-29315598136 : Rat) / 33189485) [(11, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((29315598136 : Rat) / 33189485) [(11, 2), (12, 1), (13, 1), (15, 1)],
  term ((14657799068 : Rat) / 33189485) [(11, 2), (13, 1), (14, 2), (15, 1)],
  term ((-14657799068 : Rat) / 33189485) [(11, 2), (13, 1), (15, 1)],
  term ((14657799068 : Rat) / 33189485) [(11, 2), (13, 1), (15, 3)],
  term ((-29315598136 : Rat) / 33189485) [(11, 2), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 231 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0231_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0231
        rs_R009_ueqv_R009NYYYY_generator_27_0200_0262 =
      rs_R009_ueqv_R009NYYYY_partial_27_0231 := by
  native_decide

/-- Coefficient term 232 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0232 : Poly :=
[
  term ((2783552 : Rat) / 32699) [(11, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 232 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0232 : Poly :=
[
  term ((5567104 : Rat) / 32699) [(11, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5567104 : Rat) / 32699) [(11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2783552 : Rat) / 32699) [(11, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((2783552 : Rat) / 32699) [(11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-2783552 : Rat) / 32699) [(11, 2), (13, 1), (15, 3), (16, 1)],
  term ((5567104 : Rat) / 32699) [(11, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 232 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0232_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0232
        rs_R009_ueqv_R009NYYYY_generator_27_0200_0262 =
      rs_R009_ueqv_R009NYYYY_partial_27_0232 := by
  native_decide

/-- Coefficient term 233 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0233 : Poly :=
[
  term ((25517437616 : Rat) / 33189485) [(11, 2), (13, 1), (15, 3)]
]

/-- Partial product 233 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0233 : Poly :=
[
  term ((51034875232 : Rat) / 33189485) [(11, 2), (12, 1), (13, 1), (14, 1), (15, 3)],
  term ((-51034875232 : Rat) / 33189485) [(11, 2), (12, 1), (13, 1), (15, 3)],
  term ((-25517437616 : Rat) / 33189485) [(11, 2), (13, 1), (14, 2), (15, 3)],
  term ((25517437616 : Rat) / 33189485) [(11, 2), (13, 1), (15, 3)],
  term ((-25517437616 : Rat) / 33189485) [(11, 2), (13, 1), (15, 5)],
  term ((51034875232 : Rat) / 33189485) [(11, 2), (13, 2), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 233 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0233_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0233
        rs_R009_ueqv_R009NYYYY_generator_27_0200_0262 =
      rs_R009_ueqv_R009NYYYY_partial_27_0233 := by
  native_decide

/-- Coefficient term 234 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0234 : Poly :=
[
  term ((-4845824 : Rat) / 32699) [(11, 2), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 234 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0234 : Poly :=
[
  term ((-9691648 : Rat) / 32699) [(11, 2), (12, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((9691648 : Rat) / 32699) [(11, 2), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((4845824 : Rat) / 32699) [(11, 2), (13, 1), (14, 2), (15, 3), (16, 1)],
  term ((-4845824 : Rat) / 32699) [(11, 2), (13, 1), (15, 3), (16, 1)],
  term ((4845824 : Rat) / 32699) [(11, 2), (13, 1), (15, 5), (16, 1)],
  term ((-9691648 : Rat) / 32699) [(11, 2), (13, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 234 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0234_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0234
        rs_R009_ueqv_R009NYYYY_generator_27_0200_0262 =
      rs_R009_ueqv_R009NYYYY_partial_27_0234 := by
  native_decide

/-- Coefficient term 235 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0235 : Poly :=
[
  term ((18490840654 : Rat) / 33189485) [(11, 2), (15, 2)]
]

/-- Partial product 235 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0235 : Poly :=
[
  term ((36981681308 : Rat) / 33189485) [(11, 2), (12, 1), (14, 1), (15, 2)],
  term ((-36981681308 : Rat) / 33189485) [(11, 2), (12, 1), (15, 2)],
  term ((36981681308 : Rat) / 33189485) [(11, 2), (13, 1), (15, 3)],
  term ((-18490840654 : Rat) / 33189485) [(11, 2), (14, 2), (15, 2)],
  term ((18490840654 : Rat) / 33189485) [(11, 2), (15, 2)],
  term ((-18490840654 : Rat) / 33189485) [(11, 2), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 235 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0235_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0235
        rs_R009_ueqv_R009NYYYY_generator_27_0200_0262 =
      rs_R009_ueqv_R009NYYYY_partial_27_0235 := by
  native_decide

/-- Coefficient term 236 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0236 : Poly :=
[
  term ((-3511456 : Rat) / 32699) [(11, 2), (15, 2), (16, 1)]
]

/-- Partial product 236 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0236 : Poly :=
[
  term ((-7022912 : Rat) / 32699) [(11, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((7022912 : Rat) / 32699) [(11, 2), (12, 1), (15, 2), (16, 1)],
  term ((-7022912 : Rat) / 32699) [(11, 2), (13, 1), (15, 3), (16, 1)],
  term ((3511456 : Rat) / 32699) [(11, 2), (14, 2), (15, 2), (16, 1)],
  term ((-3511456 : Rat) / 32699) [(11, 2), (15, 2), (16, 1)],
  term ((3511456 : Rat) / 32699) [(11, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 236 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0236_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0236
        rs_R009_ueqv_R009NYYYY_generator_27_0200_0262 =
      rs_R009_ueqv_R009NYYYY_partial_27_0236 := by
  native_decide

/-- Coefficient term 237 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0237 : Poly :=
[
  term ((-37563032408 : Rat) / 33189485) [(11, 2), (15, 4)]
]

/-- Partial product 237 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0237 : Poly :=
[
  term ((-75126064816 : Rat) / 33189485) [(11, 2), (12, 1), (14, 1), (15, 4)],
  term ((75126064816 : Rat) / 33189485) [(11, 2), (12, 1), (15, 4)],
  term ((-75126064816 : Rat) / 33189485) [(11, 2), (13, 1), (15, 5)],
  term ((37563032408 : Rat) / 33189485) [(11, 2), (14, 2), (15, 4)],
  term ((-37563032408 : Rat) / 33189485) [(11, 2), (15, 4)],
  term ((37563032408 : Rat) / 33189485) [(11, 2), (15, 6)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 237 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0237_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0237
        rs_R009_ueqv_R009NYYYY_generator_27_0200_0262 =
      rs_R009_ueqv_R009NYYYY_partial_27_0237 := by
  native_decide

/-- Coefficient term 238 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0238 : Poly :=
[
  term ((7133312 : Rat) / 32699) [(11, 2), (15, 4), (16, 1)]
]

/-- Partial product 238 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0238 : Poly :=
[
  term ((14266624 : Rat) / 32699) [(11, 2), (12, 1), (14, 1), (15, 4), (16, 1)],
  term ((-14266624 : Rat) / 32699) [(11, 2), (12, 1), (15, 4), (16, 1)],
  term ((14266624 : Rat) / 32699) [(11, 2), (13, 1), (15, 5), (16, 1)],
  term ((-7133312 : Rat) / 32699) [(11, 2), (14, 2), (15, 4), (16, 1)],
  term ((7133312 : Rat) / 32699) [(11, 2), (15, 4), (16, 1)],
  term ((-7133312 : Rat) / 32699) [(11, 2), (15, 6), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 238 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0238_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0238
        rs_R009_ueqv_R009NYYYY_generator_27_0200_0262 =
      rs_R009_ueqv_R009NYYYY_partial_27_0238 := by
  native_decide

/-- Coefficient term 239 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0239 : Poly :=
[
  term ((372064704 : Rat) / 33189485) [(11, 3), (12, 1), (15, 1)]
]

/-- Partial product 239 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0239 : Poly :=
[
  term ((744129408 : Rat) / 33189485) [(11, 3), (12, 1), (13, 1), (15, 2)],
  term ((-372064704 : Rat) / 33189485) [(11, 3), (12, 1), (14, 2), (15, 1)],
  term ((372064704 : Rat) / 33189485) [(11, 3), (12, 1), (15, 1)],
  term ((-372064704 : Rat) / 33189485) [(11, 3), (12, 1), (15, 3)],
  term ((744129408 : Rat) / 33189485) [(11, 3), (12, 2), (14, 1), (15, 1)],
  term ((-744129408 : Rat) / 33189485) [(11, 3), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 239 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0239_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0239
        rs_R009_ueqv_R009NYYYY_generator_27_0200_0262 =
      rs_R009_ueqv_R009NYYYY_partial_27_0239 := by
  native_decide

/-- Coefficient term 240 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0240 : Poly :=
[
  term ((-70656 : Rat) / 32699) [(11, 3), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 240 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0240 : Poly :=
[
  term ((-141312 : Rat) / 32699) [(11, 3), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((70656 : Rat) / 32699) [(11, 3), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-70656 : Rat) / 32699) [(11, 3), (12, 1), (15, 1), (16, 1)],
  term ((70656 : Rat) / 32699) [(11, 3), (12, 1), (15, 3), (16, 1)],
  term ((-141312 : Rat) / 32699) [(11, 3), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((141312 : Rat) / 32699) [(11, 3), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 240 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0240_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0240
        rs_R009_ueqv_R009NYYYY_generator_27_0200_0262 =
      rs_R009_ueqv_R009NYYYY_partial_27_0240 := by
  native_decide

/-- Coefficient term 241 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0241 : Poly :=
[
  term ((-744129408 : Rat) / 33189485) [(11, 3), (13, 1), (15, 2)]
]

/-- Partial product 241 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0241 : Poly :=
[
  term ((-1488258816 : Rat) / 33189485) [(11, 3), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((1488258816 : Rat) / 33189485) [(11, 3), (12, 1), (13, 1), (15, 2)],
  term ((744129408 : Rat) / 33189485) [(11, 3), (13, 1), (14, 2), (15, 2)],
  term ((-744129408 : Rat) / 33189485) [(11, 3), (13, 1), (15, 2)],
  term ((744129408 : Rat) / 33189485) [(11, 3), (13, 1), (15, 4)],
  term ((-1488258816 : Rat) / 33189485) [(11, 3), (13, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 241 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0241_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0241
        rs_R009_ueqv_R009NYYYY_generator_27_0200_0262 =
      rs_R009_ueqv_R009NYYYY_partial_27_0241 := by
  native_decide

/-- Coefficient term 242 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0242 : Poly :=
[
  term ((141312 : Rat) / 32699) [(11, 3), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 242 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0242 : Poly :=
[
  term ((282624 : Rat) / 32699) [(11, 3), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-282624 : Rat) / 32699) [(11, 3), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-141312 : Rat) / 32699) [(11, 3), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((141312 : Rat) / 32699) [(11, 3), (13, 1), (15, 2), (16, 1)],
  term ((-141312 : Rat) / 32699) [(11, 3), (13, 1), (15, 4), (16, 1)],
  term ((282624 : Rat) / 32699) [(11, 3), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 242 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0242_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0242
        rs_R009_ueqv_R009NYYYY_generator_27_0200_0262 =
      rs_R009_ueqv_R009NYYYY_partial_27_0242 := by
  native_decide

/-- Coefficient term 243 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0243 : Poly :=
[
  term ((-248043136 : Rat) / 33189485) [(11, 3), (15, 1)]
]

/-- Partial product 243 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0243 : Poly :=
[
  term ((-496086272 : Rat) / 33189485) [(11, 3), (12, 1), (14, 1), (15, 1)],
  term ((496086272 : Rat) / 33189485) [(11, 3), (12, 1), (15, 1)],
  term ((-496086272 : Rat) / 33189485) [(11, 3), (13, 1), (15, 2)],
  term ((248043136 : Rat) / 33189485) [(11, 3), (14, 2), (15, 1)],
  term ((-248043136 : Rat) / 33189485) [(11, 3), (15, 1)],
  term ((248043136 : Rat) / 33189485) [(11, 3), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 243 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0243_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0243
        rs_R009_ueqv_R009NYYYY_generator_27_0200_0262 =
      rs_R009_ueqv_R009NYYYY_partial_27_0243 := by
  native_decide

/-- Coefficient term 244 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0244 : Poly :=
[
  term ((47104 : Rat) / 32699) [(11, 3), (15, 1), (16, 1)]
]

/-- Partial product 244 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0244 : Poly :=
[
  term ((94208 : Rat) / 32699) [(11, 3), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-94208 : Rat) / 32699) [(11, 3), (12, 1), (15, 1), (16, 1)],
  term ((94208 : Rat) / 32699) [(11, 3), (13, 1), (15, 2), (16, 1)],
  term ((-47104 : Rat) / 32699) [(11, 3), (14, 2), (15, 1), (16, 1)],
  term ((47104 : Rat) / 32699) [(11, 3), (15, 1), (16, 1)],
  term ((-47104 : Rat) / 32699) [(11, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 244 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0244_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0244
        rs_R009_ueqv_R009NYYYY_generator_27_0200_0262 =
      rs_R009_ueqv_R009NYYYY_partial_27_0244 := by
  native_decide

/-- Coefficient term 245 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0245 : Poly :=
[
  term ((186032352 : Rat) / 33189485) [(11, 3), (15, 3)]
]

/-- Partial product 245 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0245 : Poly :=
[
  term ((372064704 : Rat) / 33189485) [(11, 3), (12, 1), (14, 1), (15, 3)],
  term ((-372064704 : Rat) / 33189485) [(11, 3), (12, 1), (15, 3)],
  term ((372064704 : Rat) / 33189485) [(11, 3), (13, 1), (15, 4)],
  term ((-186032352 : Rat) / 33189485) [(11, 3), (14, 2), (15, 3)],
  term ((186032352 : Rat) / 33189485) [(11, 3), (15, 3)],
  term ((-186032352 : Rat) / 33189485) [(11, 3), (15, 5)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 245 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0245_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0245
        rs_R009_ueqv_R009NYYYY_generator_27_0200_0262 =
      rs_R009_ueqv_R009NYYYY_partial_27_0245 := by
  native_decide

/-- Coefficient term 246 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0246 : Poly :=
[
  term ((-35328 : Rat) / 32699) [(11, 3), (15, 3), (16, 1)]
]

/-- Partial product 246 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0246 : Poly :=
[
  term ((-70656 : Rat) / 32699) [(11, 3), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((70656 : Rat) / 32699) [(11, 3), (12, 1), (15, 3), (16, 1)],
  term ((-70656 : Rat) / 32699) [(11, 3), (13, 1), (15, 4), (16, 1)],
  term ((35328 : Rat) / 32699) [(11, 3), (14, 2), (15, 3), (16, 1)],
  term ((-35328 : Rat) / 32699) [(11, 3), (15, 3), (16, 1)],
  term ((35328 : Rat) / 32699) [(11, 3), (15, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 246 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0246_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0246
        rs_R009_ueqv_R009NYYYY_generator_27_0200_0262 =
      rs_R009_ueqv_R009NYYYY_partial_27_0246 := by
  native_decide

/-- Coefficient term 247 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0247 : Poly :=
[
  term ((543 : Rat) / 160) [(12, 1)]
]

/-- Partial product 247 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0247 : Poly :=
[
  term ((543 : Rat) / 160) [(12, 1)],
  term ((543 : Rat) / 80) [(12, 1), (13, 1), (15, 1)],
  term ((-543 : Rat) / 160) [(12, 1), (14, 2)],
  term ((-543 : Rat) / 160) [(12, 1), (15, 2)],
  term ((-543 : Rat) / 80) [(12, 2)],
  term ((543 : Rat) / 80) [(12, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 247 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0247_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0247
        rs_R009_ueqv_R009NYYYY_generator_27_0200_0262 =
      rs_R009_ueqv_R009NYYYY_partial_27_0247 := by
  native_decide

/-- Coefficient term 248 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0248 : Poly :=
[
  term ((416734466689 : Rat) / 265515880) [(12, 1), (13, 1), (15, 1)]
]

/-- Partial product 248 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0248 : Poly :=
[
  term ((-416734466689 : Rat) / 265515880) [(12, 1), (13, 1), (14, 2), (15, 1)],
  term ((416734466689 : Rat) / 265515880) [(12, 1), (13, 1), (15, 1)],
  term ((-416734466689 : Rat) / 265515880) [(12, 1), (13, 1), (15, 3)],
  term ((416734466689 : Rat) / 132757940) [(12, 1), (13, 2), (15, 2)],
  term ((416734466689 : Rat) / 132757940) [(12, 2), (13, 1), (14, 1), (15, 1)],
  term ((-416734466689 : Rat) / 132757940) [(12, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 248 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0248_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0248
        rs_R009_ueqv_R009NYYYY_generator_27_0200_0262 =
      rs_R009_ueqv_R009NYYYY_partial_27_0248 := by
  native_decide

/-- Coefficient term 249 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0249 : Poly :=
[
  term ((-9891583 : Rat) / 32699) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 249 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0249 : Poly :=
[
  term ((9891583 : Rat) / 32699) [(12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-9891583 : Rat) / 32699) [(12, 1), (13, 1), (15, 1), (16, 1)],
  term ((9891583 : Rat) / 32699) [(12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-19783166 : Rat) / 32699) [(12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-19783166 : Rat) / 32699) [(12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((19783166 : Rat) / 32699) [(12, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 249 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0249_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0249
        rs_R009_ueqv_R009NYYYY_generator_27_0200_0262 =
      rs_R009_ueqv_R009NYYYY_partial_27_0249 := by
  native_decide

/-- Coefficient term 250 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0250 : Poly :=
[
  term ((-38528683419 : Rat) / 27949040) [(12, 1), (15, 2)]
]

/-- Partial product 250 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0250 : Poly :=
[
  term ((-38528683419 : Rat) / 13974520) [(12, 1), (13, 1), (15, 3)],
  term ((38528683419 : Rat) / 27949040) [(12, 1), (14, 2), (15, 2)],
  term ((-38528683419 : Rat) / 27949040) [(12, 1), (15, 2)],
  term ((38528683419 : Rat) / 27949040) [(12, 1), (15, 4)],
  term ((-38528683419 : Rat) / 13974520) [(12, 2), (14, 1), (15, 2)],
  term ((38528683419 : Rat) / 13974520) [(12, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 250 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0250_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0250
        rs_R009_ueqv_R009NYYYY_generator_27_0200_0262 =
      rs_R009_ueqv_R009NYYYY_partial_27_0250 := by
  native_decide

/-- Coefficient term 251 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0251 : Poly :=
[
  term ((922037 : Rat) / 3442) [(12, 1), (15, 2), (16, 1)]
]

/-- Partial product 251 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0251 : Poly :=
[
  term ((922037 : Rat) / 1721) [(12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-922037 : Rat) / 3442) [(12, 1), (14, 2), (15, 2), (16, 1)],
  term ((922037 : Rat) / 3442) [(12, 1), (15, 2), (16, 1)],
  term ((-922037 : Rat) / 3442) [(12, 1), (15, 4), (16, 1)],
  term ((922037 : Rat) / 1721) [(12, 2), (14, 1), (15, 2), (16, 1)],
  term ((-922037 : Rat) / 1721) [(12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 251 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0251_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0251
        rs_R009_ueqv_R009NYYYY_generator_27_0200_0262 =
      rs_R009_ueqv_R009NYYYY_partial_27_0251 := by
  native_decide

/-- Coefficient term 252 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0252 : Poly :=
[
  term ((-123 : Rat) / 40) [(12, 2)]
]

/-- Partial product 252 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0252 : Poly :=
[
  term ((-123 : Rat) / 40) [(12, 2)],
  term ((-123 : Rat) / 20) [(12, 2), (13, 1), (15, 1)],
  term ((123 : Rat) / 40) [(12, 2), (14, 2)],
  term ((123 : Rat) / 40) [(12, 2), (15, 2)],
  term ((123 : Rat) / 20) [(12, 3)],
  term ((-123 : Rat) / 20) [(12, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 252 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0252_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0252
        rs_R009_ueqv_R009NYYYY_generator_27_0200_0262 =
      rs_R009_ueqv_R009NYYYY_partial_27_0252 := by
  native_decide

/-- Coefficient term 253 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0253 : Poly :=
[
  term ((-8970650648017 : Rat) / 3186190560) [(13, 1), (15, 1)]
]

/-- Partial product 253 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0253 : Poly :=
[
  term ((-8970650648017 : Rat) / 1593095280) [(12, 1), (13, 1), (14, 1), (15, 1)],
  term ((8970650648017 : Rat) / 1593095280) [(12, 1), (13, 1), (15, 1)],
  term ((8970650648017 : Rat) / 3186190560) [(13, 1), (14, 2), (15, 1)],
  term ((-8970650648017 : Rat) / 3186190560) [(13, 1), (15, 1)],
  term ((8970650648017 : Rat) / 3186190560) [(13, 1), (15, 3)],
  term ((-8970650648017 : Rat) / 1593095280) [(13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 253 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0253_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0253
        rs_R009_ueqv_R009NYYYY_generator_27_0200_0262 =
      rs_R009_ueqv_R009NYYYY_partial_27_0253 := by
  native_decide

/-- Coefficient term 254 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0254 : Poly :=
[
  term ((213710867 : Rat) / 392388) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 254 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0254 : Poly :=
[
  term ((213710867 : Rat) / 196194) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-213710867 : Rat) / 196194) [(12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-213710867 : Rat) / 392388) [(13, 1), (14, 2), (15, 1), (16, 1)],
  term ((213710867 : Rat) / 392388) [(13, 1), (15, 1), (16, 1)],
  term ((-213710867 : Rat) / 392388) [(13, 1), (15, 3), (16, 1)],
  term ((213710867 : Rat) / 196194) [(13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 254 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0254_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0254
        rs_R009_ueqv_R009NYYYY_generator_27_0200_0262 =
      rs_R009_ueqv_R009NYYYY_partial_27_0254 := by
  native_decide

/-- Coefficient term 255 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0255 : Poly :=
[
  term ((525959019343 : Rat) / 199136910) [(13, 1), (15, 3)]
]

/-- Partial product 255 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0255 : Poly :=
[
  term ((525959019343 : Rat) / 99568455) [(12, 1), (13, 1), (14, 1), (15, 3)],
  term ((-525959019343 : Rat) / 99568455) [(12, 1), (13, 1), (15, 3)],
  term ((-525959019343 : Rat) / 199136910) [(13, 1), (14, 2), (15, 3)],
  term ((525959019343 : Rat) / 199136910) [(13, 1), (15, 3)],
  term ((-525959019343 : Rat) / 199136910) [(13, 1), (15, 5)],
  term ((525959019343 : Rat) / 99568455) [(13, 2), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 255 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0255_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0255
        rs_R009_ueqv_R009NYYYY_generator_27_0200_0262 =
      rs_R009_ueqv_R009NYYYY_partial_27_0255 := by
  native_decide

/-- Coefficient term 256 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0256 : Poly :=
[
  term ((-49910882 : Rat) / 98097) [(13, 1), (15, 3), (16, 1)]
]

/-- Partial product 256 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0256 : Poly :=
[
  term ((-99821764 : Rat) / 98097) [(12, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((99821764 : Rat) / 98097) [(12, 1), (13, 1), (15, 3), (16, 1)],
  term ((49910882 : Rat) / 98097) [(13, 1), (14, 2), (15, 3), (16, 1)],
  term ((-49910882 : Rat) / 98097) [(13, 1), (15, 3), (16, 1)],
  term ((49910882 : Rat) / 98097) [(13, 1), (15, 5), (16, 1)],
  term ((-99821764 : Rat) / 98097) [(13, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 256 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0256_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0256
        rs_R009_ueqv_R009NYYYY_generator_27_0200_0262 =
      rs_R009_ueqv_R009NYYYY_partial_27_0256 := by
  native_decide

/-- Coefficient term 257 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0257 : Poly :=
[
  term ((-2657672048 : Rat) / 6637897) [(13, 2), (15, 2)]
]

/-- Partial product 257 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0257 : Poly :=
[
  term ((-5315344096 : Rat) / 6637897) [(12, 1), (13, 2), (14, 1), (15, 2)],
  term ((5315344096 : Rat) / 6637897) [(12, 1), (13, 2), (15, 2)],
  term ((2657672048 : Rat) / 6637897) [(13, 2), (14, 2), (15, 2)],
  term ((-2657672048 : Rat) / 6637897) [(13, 2), (15, 2)],
  term ((2657672048 : Rat) / 6637897) [(13, 2), (15, 4)],
  term ((-5315344096 : Rat) / 6637897) [(13, 3), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 257 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0257_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0257
        rs_R009_ueqv_R009NYYYY_generator_27_0200_0262 =
      rs_R009_ueqv_R009NYYYY_partial_27_0257 := by
  native_decide

/-- Coefficient term 258 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0258 : Poly :=
[
  term ((2541600 : Rat) / 32699) [(13, 2), (15, 2), (16, 1)]
]

/-- Partial product 258 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0258 : Poly :=
[
  term ((5083200 : Rat) / 32699) [(12, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-5083200 : Rat) / 32699) [(12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-2541600 : Rat) / 32699) [(13, 2), (14, 2), (15, 2), (16, 1)],
  term ((2541600 : Rat) / 32699) [(13, 2), (15, 2), (16, 1)],
  term ((-2541600 : Rat) / 32699) [(13, 2), (15, 4), (16, 1)],
  term ((5083200 : Rat) / 32699) [(13, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 258 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0258_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0258
        rs_R009_ueqv_R009NYYYY_generator_27_0200_0262 =
      rs_R009_ueqv_R009NYYYY_partial_27_0258 := by
  native_decide

/-- Coefficient term 259 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0259 : Poly :=
[
  term ((13402573796077 : Rat) / 6372381120) [(15, 2)]
]

/-- Partial product 259 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0259 : Poly :=
[
  term ((13402573796077 : Rat) / 3186190560) [(12, 1), (14, 1), (15, 2)],
  term ((-13402573796077 : Rat) / 3186190560) [(12, 1), (15, 2)],
  term ((13402573796077 : Rat) / 3186190560) [(13, 1), (15, 3)],
  term ((-13402573796077 : Rat) / 6372381120) [(14, 2), (15, 2)],
  term ((13402573796077 : Rat) / 6372381120) [(15, 2)],
  term ((-13402573796077 : Rat) / 6372381120) [(15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 259 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0259_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0259
        rs_R009_ueqv_R009NYYYY_generator_27_0200_0262 =
      rs_R009_ueqv_R009NYYYY_partial_27_0259 := by
  native_decide

/-- Coefficient term 260 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0260 : Poly :=
[
  term ((-321923083 : Rat) / 784776) [(15, 2), (16, 1)]
]

/-- Partial product 260 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0260 : Poly :=
[
  term ((-321923083 : Rat) / 392388) [(12, 1), (14, 1), (15, 2), (16, 1)],
  term ((321923083 : Rat) / 392388) [(12, 1), (15, 2), (16, 1)],
  term ((-321923083 : Rat) / 392388) [(13, 1), (15, 3), (16, 1)],
  term ((321923083 : Rat) / 784776) [(14, 2), (15, 2), (16, 1)],
  term ((-321923083 : Rat) / 784776) [(15, 2), (16, 1)],
  term ((321923083 : Rat) / 784776) [(15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 260 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0260_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0260
        rs_R009_ueqv_R009NYYYY_generator_27_0200_0262 =
      rs_R009_ueqv_R009NYYYY_partial_27_0260 := by
  native_decide

/-- Coefficient term 261 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0261 : Poly :=
[
  term ((-1546339601777 : Rat) / 1593095280) [(15, 4)]
]

/-- Partial product 261 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0261 : Poly :=
[
  term ((-1546339601777 : Rat) / 796547640) [(12, 1), (14, 1), (15, 4)],
  term ((1546339601777 : Rat) / 796547640) [(12, 1), (15, 4)],
  term ((-1546339601777 : Rat) / 796547640) [(13, 1), (15, 5)],
  term ((1546339601777 : Rat) / 1593095280) [(14, 2), (15, 4)],
  term ((-1546339601777 : Rat) / 1593095280) [(15, 4)],
  term ((1546339601777 : Rat) / 1593095280) [(15, 6)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 261 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0261_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0261
        rs_R009_ueqv_R009NYYYY_generator_27_0200_0262 =
      rs_R009_ueqv_R009NYYYY_partial_27_0261 := by
  native_decide

/-- Coefficient term 262 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NYYYY_coefficient_27_0262 : Poly :=
[
  term ((12320261 : Rat) / 65398) [(15, 4), (16, 1)]
]

/-- Partial product 262 for generator 27. -/
def rs_R009_ueqv_R009NYYYY_partial_27_0262 : Poly :=
[
  term ((12320261 : Rat) / 32699) [(12, 1), (14, 1), (15, 4), (16, 1)],
  term ((-12320261 : Rat) / 32699) [(12, 1), (15, 4), (16, 1)],
  term ((12320261 : Rat) / 32699) [(13, 1), (15, 5), (16, 1)],
  term ((-12320261 : Rat) / 65398) [(14, 2), (15, 4), (16, 1)],
  term ((12320261 : Rat) / 65398) [(15, 4), (16, 1)],
  term ((-12320261 : Rat) / 65398) [(15, 6), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 262 for generator 27. -/
theorem rs_R009_ueqv_R009NYYYY_partial_27_0262_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_27_0262
        rs_R009_ueqv_R009NYYYY_generator_27_0200_0262 =
      rs_R009_ueqv_R009NYYYY_partial_27_0262 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NYYYY_partials_27_0200_0262 : List Poly :=
[
  rs_R009_ueqv_R009NYYYY_partial_27_0200,
  rs_R009_ueqv_R009NYYYY_partial_27_0201,
  rs_R009_ueqv_R009NYYYY_partial_27_0202,
  rs_R009_ueqv_R009NYYYY_partial_27_0203,
  rs_R009_ueqv_R009NYYYY_partial_27_0204,
  rs_R009_ueqv_R009NYYYY_partial_27_0205,
  rs_R009_ueqv_R009NYYYY_partial_27_0206,
  rs_R009_ueqv_R009NYYYY_partial_27_0207,
  rs_R009_ueqv_R009NYYYY_partial_27_0208,
  rs_R009_ueqv_R009NYYYY_partial_27_0209,
  rs_R009_ueqv_R009NYYYY_partial_27_0210,
  rs_R009_ueqv_R009NYYYY_partial_27_0211,
  rs_R009_ueqv_R009NYYYY_partial_27_0212,
  rs_R009_ueqv_R009NYYYY_partial_27_0213,
  rs_R009_ueqv_R009NYYYY_partial_27_0214,
  rs_R009_ueqv_R009NYYYY_partial_27_0215,
  rs_R009_ueqv_R009NYYYY_partial_27_0216,
  rs_R009_ueqv_R009NYYYY_partial_27_0217,
  rs_R009_ueqv_R009NYYYY_partial_27_0218,
  rs_R009_ueqv_R009NYYYY_partial_27_0219,
  rs_R009_ueqv_R009NYYYY_partial_27_0220,
  rs_R009_ueqv_R009NYYYY_partial_27_0221,
  rs_R009_ueqv_R009NYYYY_partial_27_0222,
  rs_R009_ueqv_R009NYYYY_partial_27_0223,
  rs_R009_ueqv_R009NYYYY_partial_27_0224,
  rs_R009_ueqv_R009NYYYY_partial_27_0225,
  rs_R009_ueqv_R009NYYYY_partial_27_0226,
  rs_R009_ueqv_R009NYYYY_partial_27_0227,
  rs_R009_ueqv_R009NYYYY_partial_27_0228,
  rs_R009_ueqv_R009NYYYY_partial_27_0229,
  rs_R009_ueqv_R009NYYYY_partial_27_0230,
  rs_R009_ueqv_R009NYYYY_partial_27_0231,
  rs_R009_ueqv_R009NYYYY_partial_27_0232,
  rs_R009_ueqv_R009NYYYY_partial_27_0233,
  rs_R009_ueqv_R009NYYYY_partial_27_0234,
  rs_R009_ueqv_R009NYYYY_partial_27_0235,
  rs_R009_ueqv_R009NYYYY_partial_27_0236,
  rs_R009_ueqv_R009NYYYY_partial_27_0237,
  rs_R009_ueqv_R009NYYYY_partial_27_0238,
  rs_R009_ueqv_R009NYYYY_partial_27_0239,
  rs_R009_ueqv_R009NYYYY_partial_27_0240,
  rs_R009_ueqv_R009NYYYY_partial_27_0241,
  rs_R009_ueqv_R009NYYYY_partial_27_0242,
  rs_R009_ueqv_R009NYYYY_partial_27_0243,
  rs_R009_ueqv_R009NYYYY_partial_27_0244,
  rs_R009_ueqv_R009NYYYY_partial_27_0245,
  rs_R009_ueqv_R009NYYYY_partial_27_0246,
  rs_R009_ueqv_R009NYYYY_partial_27_0247,
  rs_R009_ueqv_R009NYYYY_partial_27_0248,
  rs_R009_ueqv_R009NYYYY_partial_27_0249,
  rs_R009_ueqv_R009NYYYY_partial_27_0250,
  rs_R009_ueqv_R009NYYYY_partial_27_0251,
  rs_R009_ueqv_R009NYYYY_partial_27_0252,
  rs_R009_ueqv_R009NYYYY_partial_27_0253,
  rs_R009_ueqv_R009NYYYY_partial_27_0254,
  rs_R009_ueqv_R009NYYYY_partial_27_0255,
  rs_R009_ueqv_R009NYYYY_partial_27_0256,
  rs_R009_ueqv_R009NYYYY_partial_27_0257,
  rs_R009_ueqv_R009NYYYY_partial_27_0258,
  rs_R009_ueqv_R009NYYYY_partial_27_0259,
  rs_R009_ueqv_R009NYYYY_partial_27_0260,
  rs_R009_ueqv_R009NYYYY_partial_27_0261,
  rs_R009_ueqv_R009NYYYY_partial_27_0262
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NYYYY_block_27_0200_0262 : Poly :=
[
  term ((21427480887 : Rat) / 33189485) [(10, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-4098330 : Rat) / 32699) [(10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-17939286324 : Rat) / 6637897) [(10, 1), (12, 1), (13, 1), (14, 1), (15, 3)],
  term ((17155800 : Rat) / 32699) [(10, 1), (12, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-381240 : Rat) / 32699) [(10, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-21427480887 : Rat) / 33189485) [(10, 1), (12, 1), (13, 1), (15, 1)],
  term ((4479570 : Rat) / 32699) [(10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((81723415476 : Rat) / 33189485) [(10, 1), (12, 1), (13, 1), (15, 3)],
  term ((-16012080 : Rat) / 32699) [(10, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-7973016144 : Rat) / 33189485) [(10, 1), (12, 1), (13, 2), (14, 1), (15, 2)],
  term ((1524960 : Rat) / 32699) [(10, 1), (12, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((7973016144 : Rat) / 33189485) [(10, 1), (12, 1), (13, 2), (15, 2)],
  term ((-762480 : Rat) / 32699) [(10, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((82063310695 : Rat) / 79654764) [(10, 1), (12, 1), (14, 1), (15, 2)],
  term ((-19635821 : Rat) / 98097) [(10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-332209006 : Rat) / 1746815) [(10, 1), (12, 1), (14, 1), (15, 4)],
  term ((63540 : Rat) / 1721) [(10, 1), (12, 1), (14, 1), (15, 4), (16, 1)],
  term ((3986508072 : Rat) / 33189485) [(10, 1), (12, 1), (14, 2), (15, 2)],
  term ((-762480 : Rat) / 32699) [(10, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((-458154650339 : Rat) / 398273820) [(10, 1), (12, 1), (15, 2)],
  term ((21923261 : Rat) / 98097) [(10, 1), (12, 1), (15, 2), (16, 1)],
  term ((10298479186 : Rat) / 33189485) [(10, 1), (12, 1), (15, 4)],
  term ((-1969740 : Rat) / 32699) [(10, 1), (12, 1), (15, 4), (16, 1)],
  term ((762480 : Rat) / 32699) [(10, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-762480 : Rat) / 32699) [(10, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-7973016144 : Rat) / 33189485) [(10, 1), (12, 2), (14, 1), (15, 2)],
  term ((1524960 : Rat) / 32699) [(10, 1), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((7973016144 : Rat) / 33189485) [(10, 1), (12, 2), (15, 2)],
  term ((-1524960 : Rat) / 32699) [(10, 1), (12, 2), (15, 2), (16, 1)],
  term ((-21427480887 : Rat) / 66378970) [(10, 1), (13, 1), (14, 2), (15, 1)],
  term ((2049165 : Rat) / 32699) [(10, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((8969643162 : Rat) / 6637897) [(10, 1), (13, 1), (14, 2), (15, 3)],
  term ((-8577900 : Rat) / 32699) [(10, 1), (13, 1), (14, 2), (15, 3), (16, 1)],
  term ((21427480887 : Rat) / 66378970) [(10, 1), (13, 1), (15, 1)],
  term ((-2049165 : Rat) / 32699) [(10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-256426921567 : Rat) / 398273820) [(10, 1), (13, 1), (15, 3)],
  term ((12245374 : Rat) / 98097) [(10, 1), (13, 1), (15, 3), (16, 1)],
  term ((1328836024 : Rat) / 1144465) [(10, 1), (13, 1), (15, 5)],
  term ((-7370640 : Rat) / 32699) [(10, 1), (13, 1), (15, 5), (16, 1)],
  term ((3986508072 : Rat) / 33189485) [(10, 1), (13, 2), (14, 2), (15, 2)],
  term ((-762480 : Rat) / 32699) [(10, 1), (13, 2), (14, 2), (15, 2), (16, 1)],
  term ((498313509 : Rat) / 948271) [(10, 1), (13, 2), (15, 2)],
  term ((-3335850 : Rat) / 32699) [(10, 1), (13, 2), (15, 2), (16, 1)],
  term ((-85709923548 : Rat) / 33189485) [(10, 1), (13, 2), (15, 4)],
  term ((16393320 : Rat) / 32699) [(10, 1), (13, 2), (15, 4), (16, 1)],
  term ((-7973016144 : Rat) / 33189485) [(10, 1), (13, 3), (15, 3)],
  term ((1524960 : Rat) / 32699) [(10, 1), (13, 3), (15, 3), (16, 1)],
  term ((-82063310695 : Rat) / 159309528) [(10, 1), (14, 2), (15, 2)],
  term ((19635821 : Rat) / 196194) [(10, 1), (14, 2), (15, 2), (16, 1)],
  term ((166104503 : Rat) / 1746815) [(10, 1), (14, 2), (15, 4)],
  term ((-31770 : Rat) / 1721) [(10, 1), (14, 2), (15, 4), (16, 1)],
  term ((82063310695 : Rat) / 159309528) [(10, 1), (15, 2)],
  term ((-19635821 : Rat) / 196194) [(10, 1), (15, 2), (16, 1)],
  term ((-486060206843 : Rat) / 796547640) [(10, 1), (15, 4)],
  term ((23257601 : Rat) / 196194) [(10, 1), (15, 4), (16, 1)],
  term ((166104503 : Rat) / 1746815) [(10, 1), (15, 6)],
  term ((-31770 : Rat) / 1721) [(10, 1), (15, 6), (16, 1)],
  term ((-571734756 : Rat) / 4741355) [(11, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((832448 : Rat) / 32699) [(11, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-21316207000 : Rat) / 6637897) [(11, 1), (12, 1), (13, 1), (14, 1), (15, 4)],
  term ((20240000 : Rat) / 32699) [(11, 1), (12, 1), (13, 1), (14, 1), (15, 4), (16, 1)],
  term ((2906755500 : Rat) / 6637897) [(11, 1), (12, 1), (13, 1), (14, 2), (15, 2)],
  term ((-2760000 : Rat) / 32699) [(11, 1), (12, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((58434135492 : Rat) / 33189485) [(11, 1), (12, 1), (13, 1), (15, 2)],
  term ((-11275492 : Rat) / 32699) [(11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((20665093768 : Rat) / 6637897) [(11, 1), (12, 1), (13, 1), (15, 4)],
  term ((-19621760 : Rat) / 32699) [(11, 1), (12, 1), (13, 1), (15, 4), (16, 1)],
  term ((-5813511000 : Rat) / 6637897) [(11, 1), (12, 1), (13, 2), (15, 3)],
  term ((5520000 : Rat) / 32699) [(11, 1), (12, 1), (13, 2), (15, 3), (16, 1)],
  term ((-311503707161 : Rat) / 99568455) [(11, 1), (12, 1), (14, 1), (15, 1)],
  term ((59615060 : Rat) / 98097) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((26613716015 : Rat) / 13275794) [(11, 1), (12, 1), (14, 1), (15, 3)],
  term ((-12640064 : Rat) / 32699) [(11, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((-6896576970 : Rat) / 6637897) [(11, 1), (12, 1), (14, 2), (15, 1)],
  term ((6601522 : Rat) / 32699) [(11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((1778934366 : Rat) / 6637897) [(11, 1), (12, 1), (14, 2), (15, 3)],
  term ((-1689120 : Rat) / 32699) [(11, 1), (12, 1), (14, 2), (15, 3), (16, 1)],
  term ((414952361711 : Rat) / 99568455) [(11, 1), (12, 1), (15, 1)],
  term ((-79419626 : Rat) / 98097) [(11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-43964738687 : Rat) / 13275794) [(11, 1), (12, 1), (15, 3)],
  term ((20930706 : Rat) / 32699) [(11, 1), (12, 1), (15, 3), (16, 1)],
  term ((1778934366 : Rat) / 6637897) [(11, 1), (12, 1), (15, 5)],
  term ((-1689120 : Rat) / 32699) [(11, 1), (12, 1), (15, 5), (16, 1)],
  term ((-5813511000 : Rat) / 6637897) [(11, 1), (12, 2), (13, 1), (14, 1), (15, 2)],
  term ((5520000 : Rat) / 32699) [(11, 1), (12, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((5813511000 : Rat) / 6637897) [(11, 1), (12, 2), (13, 1), (15, 2)],
  term ((-5520000 : Rat) / 32699) [(11, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((13793153940 : Rat) / 6637897) [(11, 1), (12, 2), (14, 1), (15, 1)],
  term ((-13203044 : Rat) / 32699) [(11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-3557868732 : Rat) / 6637897) [(11, 1), (12, 2), (14, 1), (15, 3)],
  term ((3378240 : Rat) / 32699) [(11, 1), (12, 2), (14, 1), (15, 3), (16, 1)],
  term ((-13793153940 : Rat) / 6637897) [(11, 1), (12, 2), (15, 1)],
  term ((13203044 : Rat) / 32699) [(11, 1), (12, 2), (15, 1), (16, 1)],
  term ((3557868732 : Rat) / 6637897) [(11, 1), (12, 2), (15, 3)],
  term ((-3378240 : Rat) / 32699) [(11, 1), (12, 2), (15, 3), (16, 1)],
  term ((285867378 : Rat) / 4741355) [(11, 1), (13, 1), (14, 2), (15, 2)],
  term ((-416224 : Rat) / 32699) [(11, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((10658103500 : Rat) / 6637897) [(11, 1), (13, 1), (14, 2), (15, 4)],
  term ((-10120000 : Rat) / 32699) [(11, 1), (13, 1), (14, 2), (15, 4), (16, 1)],
  term ((-317506922099 : Rat) / 99568455) [(11, 1), (13, 1), (15, 2)],
  term ((60863732 : Rat) / 98097) [(11, 1), (13, 1), (15, 2), (16, 1)],
  term ((30489688367 : Rat) / 66378970) [(11, 1), (13, 1), (15, 4)],
  term ((-2936288 : Rat) / 32699) [(11, 1), (13, 1), (15, 4), (16, 1)],
  term ((10658103500 : Rat) / 6637897) [(11, 1), (13, 1), (15, 6)],
  term ((-10120000 : Rat) / 32699) [(11, 1), (13, 1), (15, 6), (16, 1)],
  term ((-571734756 : Rat) / 4741355) [(11, 1), (13, 2), (15, 3)],
  term ((832448 : Rat) / 32699) [(11, 1), (13, 2), (15, 3), (16, 1)],
  term ((-21316207000 : Rat) / 6637897) [(11, 1), (13, 2), (15, 5)],
  term ((20240000 : Rat) / 32699) [(11, 1), (13, 2), (15, 5), (16, 1)],
  term ((311503707161 : Rat) / 199136910) [(11, 1), (14, 2), (15, 1)],
  term ((-29807530 : Rat) / 98097) [(11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-26613716015 : Rat) / 26551588) [(11, 1), (14, 2), (15, 3)],
  term ((6320032 : Rat) / 32699) [(11, 1), (14, 2), (15, 3), (16, 1)],
  term ((-311503707161 : Rat) / 199136910) [(11, 1), (15, 1)],
  term ((29807530 : Rat) / 98097) [(11, 1), (15, 1), (16, 1)],
  term ((1022213154547 : Rat) / 398273820) [(11, 1), (15, 3)],
  term ((-48767626 : Rat) / 98097) [(11, 1), (15, 3), (16, 1)],
  term ((-26613716015 : Rat) / 26551588) [(11, 1), (15, 5)],
  term ((6320032 : Rat) / 32699) [(11, 1), (15, 5), (16, 1)],
  term ((-29315598136 : Rat) / 33189485) [(11, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((5567104 : Rat) / 32699) [(11, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((51034875232 : Rat) / 33189485) [(11, 2), (12, 1), (13, 1), (14, 1), (15, 3)],
  term ((-9691648 : Rat) / 32699) [(11, 2), (12, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-6883197024 : Rat) / 33189485) [(11, 2), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((1307136 : Rat) / 32699) [(11, 2), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((7239759032 : Rat) / 6637897) [(11, 2), (12, 1), (13, 1), (15, 1)],
  term ((-6874240 : Rat) / 32699) [(11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-78381630976 : Rat) / 33189485) [(11, 2), (12, 1), (13, 1), (15, 3)],
  term ((14884864 : Rat) / 32699) [(11, 2), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((13766394048 : Rat) / 33189485) [(11, 2), (12, 1), (13, 2), (15, 2)],
  term ((-2614272 : Rat) / 32699) [(11, 2), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((36981681308 : Rat) / 33189485) [(11, 2), (12, 1), (14, 1), (15, 2)],
  term ((-7022912 : Rat) / 32699) [(11, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-75126064816 : Rat) / 33189485) [(11, 2), (12, 1), (14, 1), (15, 4)],
  term ((14266624 : Rat) / 32699) [(11, 2), (12, 1), (14, 1), (15, 4), (16, 1)],
  term ((2046355872 : Rat) / 6637897) [(11, 2), (12, 1), (14, 2), (15, 2)],
  term ((-1943040 : Rat) / 32699) [(11, 2), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((-47213460668 : Rat) / 33189485) [(11, 2), (12, 1), (15, 2)],
  term ((8965952 : Rat) / 32699) [(11, 2), (12, 1), (15, 2), (16, 1)],
  term ((85357844176 : Rat) / 33189485) [(11, 2), (12, 1), (15, 4)],
  term ((-16209664 : Rat) / 32699) [(11, 2), (12, 1), (15, 4), (16, 1)],
  term ((13766394048 : Rat) / 33189485) [(11, 2), (12, 2), (13, 1), (14, 1), (15, 1)],
  term ((-2614272 : Rat) / 32699) [(11, 2), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-13766394048 : Rat) / 33189485) [(11, 2), (12, 2), (13, 1), (15, 1)],
  term ((2614272 : Rat) / 32699) [(11, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-4092711744 : Rat) / 6637897) [(11, 2), (12, 2), (14, 1), (15, 2)],
  term ((3886080 : Rat) / 32699) [(11, 2), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((4092711744 : Rat) / 6637897) [(11, 2), (12, 2), (15, 2)],
  term ((-3886080 : Rat) / 32699) [(11, 2), (12, 2), (15, 2), (16, 1)],
  term ((14657799068 : Rat) / 33189485) [(11, 2), (13, 1), (14, 2), (15, 1)],
  term ((-2783552 : Rat) / 32699) [(11, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-25517437616 : Rat) / 33189485) [(11, 2), (13, 1), (14, 2), (15, 3)],
  term ((4845824 : Rat) / 32699) [(11, 2), (13, 1), (14, 2), (15, 3), (16, 1)],
  term ((-14657799068 : Rat) / 33189485) [(11, 2), (13, 1), (15, 1)],
  term ((2783552 : Rat) / 32699) [(11, 2), (13, 1), (15, 1), (16, 1)],
  term ((11022416856 : Rat) / 4741355) [(11, 2), (13, 1), (15, 3)],
  term ((-14652288 : Rat) / 32699) [(11, 2), (13, 1), (15, 3), (16, 1)],
  term ((-100643502432 : Rat) / 33189485) [(11, 2), (13, 1), (15, 5)],
  term ((19112448 : Rat) / 32699) [(11, 2), (13, 1), (15, 5), (16, 1)],
  term ((-29315598136 : Rat) / 33189485) [(11, 2), (13, 2), (15, 2)],
  term ((5567104 : Rat) / 32699) [(11, 2), (13, 2), (15, 2), (16, 1)],
  term ((51034875232 : Rat) / 33189485) [(11, 2), (13, 2), (15, 4)],
  term ((-9691648 : Rat) / 32699) [(11, 2), (13, 2), (15, 4), (16, 1)],
  term ((-18490840654 : Rat) / 33189485) [(11, 2), (14, 2), (15, 2)],
  term ((3511456 : Rat) / 32699) [(11, 2), (14, 2), (15, 2), (16, 1)],
  term ((37563032408 : Rat) / 33189485) [(11, 2), (14, 2), (15, 4)],
  term ((-7133312 : Rat) / 32699) [(11, 2), (14, 2), (15, 4), (16, 1)],
  term ((18490840654 : Rat) / 33189485) [(11, 2), (15, 2)],
  term ((-3511456 : Rat) / 32699) [(11, 2), (15, 2), (16, 1)],
  term ((-56053873062 : Rat) / 33189485) [(11, 2), (15, 4)],
  term ((10644768 : Rat) / 32699) [(11, 2), (15, 4), (16, 1)],
  term ((37563032408 : Rat) / 33189485) [(11, 2), (15, 6)],
  term ((-7133312 : Rat) / 32699) [(11, 2), (15, 6), (16, 1)],
  term ((-1488258816 : Rat) / 33189485) [(11, 3), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((282624 : Rat) / 32699) [(11, 3), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((2232388224 : Rat) / 33189485) [(11, 3), (12, 1), (13, 1), (15, 2)],
  term ((-423936 : Rat) / 32699) [(11, 3), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-496086272 : Rat) / 33189485) [(11, 3), (12, 1), (14, 1), (15, 1)],
  term ((94208 : Rat) / 32699) [(11, 3), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((372064704 : Rat) / 33189485) [(11, 3), (12, 1), (14, 1), (15, 3)],
  term ((-70656 : Rat) / 32699) [(11, 3), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((-372064704 : Rat) / 33189485) [(11, 3), (12, 1), (14, 2), (15, 1)],
  term ((70656 : Rat) / 32699) [(11, 3), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((124021568 : Rat) / 4741355) [(11, 3), (12, 1), (15, 1)],
  term ((-164864 : Rat) / 32699) [(11, 3), (12, 1), (15, 1), (16, 1)],
  term ((-744129408 : Rat) / 33189485) [(11, 3), (12, 1), (15, 3)],
  term ((141312 : Rat) / 32699) [(11, 3), (12, 1), (15, 3), (16, 1)],
  term ((744129408 : Rat) / 33189485) [(11, 3), (12, 2), (14, 1), (15, 1)],
  term ((-141312 : Rat) / 32699) [(11, 3), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-744129408 : Rat) / 33189485) [(11, 3), (12, 2), (15, 1)],
  term ((141312 : Rat) / 32699) [(11, 3), (12, 2), (15, 1), (16, 1)],
  term ((744129408 : Rat) / 33189485) [(11, 3), (13, 1), (14, 2), (15, 2)],
  term ((-141312 : Rat) / 32699) [(11, 3), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-248043136 : Rat) / 6637897) [(11, 3), (13, 1), (15, 2)],
  term ((235520 : Rat) / 32699) [(11, 3), (13, 1), (15, 2), (16, 1)],
  term ((1116194112 : Rat) / 33189485) [(11, 3), (13, 1), (15, 4)],
  term ((-211968 : Rat) / 32699) [(11, 3), (13, 1), (15, 4), (16, 1)],
  term ((-1488258816 : Rat) / 33189485) [(11, 3), (13, 2), (15, 3)],
  term ((282624 : Rat) / 32699) [(11, 3), (13, 2), (15, 3), (16, 1)],
  term ((248043136 : Rat) / 33189485) [(11, 3), (14, 2), (15, 1)],
  term ((-47104 : Rat) / 32699) [(11, 3), (14, 2), (15, 1), (16, 1)],
  term ((-186032352 : Rat) / 33189485) [(11, 3), (14, 2), (15, 3)],
  term ((35328 : Rat) / 32699) [(11, 3), (14, 2), (15, 3), (16, 1)],
  term ((-248043136 : Rat) / 33189485) [(11, 3), (15, 1)],
  term ((47104 : Rat) / 32699) [(11, 3), (15, 1), (16, 1)],
  term ((62010784 : Rat) / 4741355) [(11, 3), (15, 3)],
  term ((-82432 : Rat) / 32699) [(11, 3), (15, 3), (16, 1)],
  term ((-186032352 : Rat) / 33189485) [(11, 3), (15, 5)],
  term ((35328 : Rat) / 32699) [(11, 3), (15, 5), (16, 1)],
  term ((543 : Rat) / 160) [(12, 1)],
  term ((-8970650648017 : Rat) / 1593095280) [(12, 1), (13, 1), (14, 1), (15, 1)],
  term ((213710867 : Rat) / 196194) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((525959019343 : Rat) / 99568455) [(12, 1), (13, 1), (14, 1), (15, 3)],
  term ((-99821764 : Rat) / 98097) [(12, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-416734466689 : Rat) / 265515880) [(12, 1), (13, 1), (14, 2), (15, 1)],
  term ((9891583 : Rat) / 32699) [(12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((410066806513 : Rat) / 56896260) [(12, 1), (13, 1), (15, 1)],
  term ((-273060365 : Rat) / 196194) [(12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-131965698443 : Rat) / 13733580) [(12, 1), (13, 1), (15, 3)],
  term ((182052622 : Rat) / 98097) [(12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-5315344096 : Rat) / 6637897) [(12, 1), (13, 2), (14, 1), (15, 2)],
  term ((5083200 : Rat) / 32699) [(12, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((523041348609 : Rat) / 132757940) [(12, 1), (13, 2), (15, 2)],
  term ((-24866366 : Rat) / 32699) [(12, 1), (13, 2), (15, 2), (16, 1)],
  term ((13402573796077 : Rat) / 3186190560) [(12, 1), (14, 1), (15, 2)],
  term ((-321923083 : Rat) / 392388) [(12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1546339601777 : Rat) / 796547640) [(12, 1), (14, 1), (15, 4)],
  term ((12320261 : Rat) / 32699) [(12, 1), (14, 1), (15, 4), (16, 1)],
  term ((-543 : Rat) / 160) [(12, 1), (14, 2)],
  term ((38528683419 : Rat) / 27949040) [(12, 1), (14, 2), (15, 2)],
  term ((-922037 : Rat) / 3442) [(12, 1), (14, 2), (15, 2), (16, 1)],
  term ((-2225707105007 : Rat) / 398273820) [(12, 1), (15, 2)],
  term ((427035301 : Rat) / 392388) [(12, 1), (15, 2), (16, 1)],
  term ((5288814158437 : Rat) / 1593095280) [(12, 1), (15, 4)],
  term ((-42159225 : Rat) / 65398) [(12, 1), (15, 4), (16, 1)],
  term ((-789 : Rat) / 80) [(12, 2)],
  term ((416734466689 : Rat) / 132757940) [(12, 2), (13, 1), (14, 1), (15, 1)],
  term ((-19783166 : Rat) / 32699) [(12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-20877546401 : Rat) / 6637897) [(12, 2), (13, 1), (15, 1)],
  term ((19783166 : Rat) / 32699) [(12, 2), (13, 1), (15, 1), (16, 1)],
  term ((543 : Rat) / 80) [(12, 2), (14, 1)],
  term ((-38528683419 : Rat) / 13974520) [(12, 2), (14, 1), (15, 2)],
  term ((922037 : Rat) / 1721) [(12, 2), (14, 1), (15, 2), (16, 1)],
  term ((123 : Rat) / 40) [(12, 2), (14, 2)],
  term ((9642913767 : Rat) / 3493630) [(12, 2), (15, 2)],
  term ((-922037 : Rat) / 1721) [(12, 2), (15, 2), (16, 1)],
  term ((123 : Rat) / 20) [(12, 3)],
  term ((-123 : Rat) / 20) [(12, 3), (14, 1)],
  term ((8970650648017 : Rat) / 3186190560) [(13, 1), (14, 2), (15, 1)],
  term ((-213710867 : Rat) / 392388) [(13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-525959019343 : Rat) / 199136910) [(13, 1), (14, 2), (15, 3)],
  term ((49910882 : Rat) / 98097) [(13, 1), (14, 2), (15, 3), (16, 1)],
  term ((-8970650648017 : Rat) / 3186190560) [(13, 1), (15, 1)],
  term ((213710867 : Rat) / 392388) [(13, 1), (15, 1), (16, 1)],
  term ((5131428125597 : Rat) / 531031760) [(13, 1), (15, 3)],
  term ((-367638739 : Rat) / 196194) [(13, 1), (15, 3), (16, 1)],
  term ((-1216725226383 : Rat) / 265515880) [(13, 1), (15, 5)],
  term ((86871665 : Rat) / 98097) [(13, 1), (15, 5), (16, 1)],
  term ((2657672048 : Rat) / 6637897) [(13, 2), (14, 2), (15, 2)],
  term ((-2541600 : Rat) / 32699) [(13, 2), (14, 2), (15, 2), (16, 1)],
  term ((-9608491939537 : Rat) / 1593095280) [(13, 2), (15, 2)],
  term ((228960467 : Rat) / 196194) [(13, 2), (15, 2), (16, 1)],
  term ((565824100063 : Rat) / 99568455) [(13, 2), (15, 4)],
  term ((-107446564 : Rat) / 98097) [(13, 2), (15, 4), (16, 1)],
  term ((-5315344096 : Rat) / 6637897) [(13, 3), (15, 3)],
  term ((5083200 : Rat) / 32699) [(13, 3), (15, 3), (16, 1)],
  term ((-13402573796077 : Rat) / 6372381120) [(14, 2), (15, 2)],
  term ((321923083 : Rat) / 784776) [(14, 2), (15, 2), (16, 1)],
  term ((1546339601777 : Rat) / 1593095280) [(14, 2), (15, 4)],
  term ((-12320261 : Rat) / 65398) [(14, 2), (15, 4), (16, 1)],
  term ((13402573796077 : Rat) / 6372381120) [(15, 2)],
  term ((-321923083 : Rat) / 784776) [(15, 2), (16, 1)],
  term ((-1305862146879 : Rat) / 424825408) [(15, 4)],
  term ((469766215 : Rat) / 784776) [(15, 4), (16, 1)],
  term ((1546339601777 : Rat) / 1593095280) [(15, 6)],
  term ((-12320261 : Rat) / 65398) [(15, 6), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 27, terms 200 through 262. -/
theorem rs_R009_ueqv_R009NYYYY_block_27_0200_0262_valid :
    checkProductSumEq rs_R009_ueqv_R009NYYYY_partials_27_0200_0262
      rs_R009_ueqv_R009NYYYY_block_27_0200_0262 = true := by
  native_decide

end R009UeqvR009NYYYYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
