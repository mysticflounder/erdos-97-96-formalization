/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009YNNNN, term block 5:300-399

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009YNNNNTermShards

/-- Generator polynomial 5 for relaxed split surplus certificate `R009:u=v:R009YNNNN`. -/
def rs_R009_ueqv_R009YNNNN_generator_05_0300_0399 : Poly :=
[
  term (-2 : Rat) [(4, 1)],
  term (1 : Rat) [(4, 2)],
  term (1 : Rat) [(5, 2)],
  term (2 : Rat) [(14, 1)],
  term (-1 : Rat) [(14, 2)],
  term (-1 : Rat) [(15, 2)]
]

/-- Coefficient term 300 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0300 : Poly :=
[
  term ((-2224986028928059 : Rat) / 3197098941624) [(7, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 300 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0300 : Poly :=
[
  term ((2224986028928059 : Rat) / 1598549470812) [(4, 1), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((-2224986028928059 : Rat) / 3197098941624) [(4, 2), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((-2224986028928059 : Rat) / 3197098941624) [(5, 2), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((2224986028928059 : Rat) / 3197098941624) [(7, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((-2224986028928059 : Rat) / 1598549470812) [(7, 1), (12, 1), (13, 1), (14, 2)],
  term ((2224986028928059 : Rat) / 3197098941624) [(7, 1), (12, 1), (13, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 300 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0300_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0300
        rs_R009_ueqv_R009YNNNN_generator_05_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_05_0300 := by
  native_decide

/-- Coefficient term 301 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0301 : Poly :=
[
  term ((1495 : Rat) / 252) [(7, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 301 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0301 : Poly :=
[
  term ((-1495 : Rat) / 126) [(4, 1), (7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((1495 : Rat) / 252) [(4, 2), (7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((1495 : Rat) / 252) [(5, 2), (7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1495 : Rat) / 252) [(7, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((1495 : Rat) / 126) [(7, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-1495 : Rat) / 252) [(7, 1), (12, 1), (13, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 301 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0301_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0301
        rs_R009_ueqv_R009YNNNN_generator_05_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_05_0301 := by
  native_decide

/-- Coefficient term 302 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0302 : Poly :=
[
  term ((-725 : Rat) / 168) [(7, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 302 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0302 : Poly :=
[
  term ((725 : Rat) / 84) [(4, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-725 : Rat) / 168) [(4, 2), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-725 : Rat) / 168) [(5, 2), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-725 : Rat) / 84) [(7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((725 : Rat) / 168) [(7, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((725 : Rat) / 168) [(7, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 302 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0302_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0302
        rs_R009_ueqv_R009YNNNN_generator_05_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_05_0302 := by
  native_decide

/-- Coefficient term 303 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0303 : Poly :=
[
  term ((150142660556857 : Rat) / 330501789324) [(7, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 303 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0303 : Poly :=
[
  term ((-150142660556857 : Rat) / 165250894662) [(4, 1), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((150142660556857 : Rat) / 330501789324) [(4, 2), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((150142660556857 : Rat) / 330501789324) [(5, 2), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((-150142660556857 : Rat) / 330501789324) [(7, 1), (12, 1), (14, 1), (15, 3)],
  term ((150142660556857 : Rat) / 165250894662) [(7, 1), (12, 1), (14, 2), (15, 1)],
  term ((-150142660556857 : Rat) / 330501789324) [(7, 1), (12, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 303 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0303_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0303
        rs_R009_ueqv_R009YNNNN_generator_05_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_05_0303 := by
  native_decide

/-- Coefficient term 304 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0304 : Poly :=
[
  term ((-247 : Rat) / 63) [(7, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 304 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0304 : Poly :=
[
  term ((494 : Rat) / 63) [(4, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-247 : Rat) / 63) [(4, 2), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-247 : Rat) / 63) [(5, 2), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((247 : Rat) / 63) [(7, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((-494 : Rat) / 63) [(7, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((247 : Rat) / 63) [(7, 1), (12, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 304 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0304_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0304
        rs_R009_ueqv_R009YNNNN_generator_05_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_05_0304 := by
  native_decide

/-- Coefficient term 305 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0305 : Poly :=
[
  term ((-1532199782809 : Rat) / 26861770943) [(7, 1), (12, 1), (14, 2), (15, 1)]
]

/-- Partial product 305 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0305 : Poly :=
[
  term ((3064399565618 : Rat) / 26861770943) [(4, 1), (7, 1), (12, 1), (14, 2), (15, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(4, 2), (7, 1), (12, 1), (14, 2), (15, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(5, 2), (7, 1), (12, 1), (14, 2), (15, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(7, 1), (12, 1), (14, 2), (15, 3)],
  term ((-3064399565618 : Rat) / 26861770943) [(7, 1), (12, 1), (14, 3), (15, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(7, 1), (12, 1), (14, 4), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 305 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0305_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0305
        rs_R009_ueqv_R009YNNNN_generator_05_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_05_0305 := by
  native_decide

/-- Coefficient term 306 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0306 : Poly :=
[
  term ((148780745730977 : Rat) / 5802142523688) [(7, 1), (12, 1), (15, 1)]
]

/-- Partial product 306 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0306 : Poly :=
[
  term ((-148780745730977 : Rat) / 2901071261844) [(4, 1), (7, 1), (12, 1), (15, 1)],
  term ((148780745730977 : Rat) / 5802142523688) [(4, 2), (7, 1), (12, 1), (15, 1)],
  term ((148780745730977 : Rat) / 5802142523688) [(5, 2), (7, 1), (12, 1), (15, 1)],
  term ((148780745730977 : Rat) / 2901071261844) [(7, 1), (12, 1), (14, 1), (15, 1)],
  term ((-148780745730977 : Rat) / 5802142523688) [(7, 1), (12, 1), (14, 2), (15, 1)],
  term ((-148780745730977 : Rat) / 5802142523688) [(7, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 306 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0306_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0306
        rs_R009_ueqv_R009YNNNN_generator_05_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_05_0306 := by
  native_decide

/-- Coefficient term 307 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0307 : Poly :=
[
  term ((157 : Rat) / 42) [(7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 307 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0307 : Poly :=
[
  term ((-157 : Rat) / 21) [(4, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((157 : Rat) / 42) [(4, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((157 : Rat) / 42) [(5, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((157 : Rat) / 21) [(7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-157 : Rat) / 42) [(7, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-157 : Rat) / 42) [(7, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 307 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0307_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0307
        rs_R009_ueqv_R009YNNNN_generator_05_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_05_0307 := by
  native_decide

/-- Coefficient term 308 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0308 : Poly :=
[
  term ((-206820899571954011 : Rat) / 313315696279152) [(7, 1), (13, 1)]
]

/-- Partial product 308 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0308 : Poly :=
[
  term ((206820899571954011 : Rat) / 156657848139576) [(4, 1), (7, 1), (13, 1)],
  term ((-206820899571954011 : Rat) / 313315696279152) [(4, 2), (7, 1), (13, 1)],
  term ((-206820899571954011 : Rat) / 313315696279152) [(5, 2), (7, 1), (13, 1)],
  term ((-206820899571954011 : Rat) / 156657848139576) [(7, 1), (13, 1), (14, 1)],
  term ((206820899571954011 : Rat) / 313315696279152) [(7, 1), (13, 1), (14, 2)],
  term ((206820899571954011 : Rat) / 313315696279152) [(7, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 308 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0308_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0308
        rs_R009_ueqv_R009YNNNN_generator_05_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_05_0308 := by
  native_decide

/-- Coefficient term 309 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0309 : Poly :=
[
  term ((9616667667025831 : Rat) / 5802142523688) [(7, 1), (13, 1), (14, 1)]
]

/-- Partial product 309 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0309 : Poly :=
[
  term ((-9616667667025831 : Rat) / 2901071261844) [(4, 1), (7, 1), (13, 1), (14, 1)],
  term ((9616667667025831 : Rat) / 5802142523688) [(4, 2), (7, 1), (13, 1), (14, 1)],
  term ((9616667667025831 : Rat) / 5802142523688) [(5, 2), (7, 1), (13, 1), (14, 1)],
  term ((-9616667667025831 : Rat) / 5802142523688) [(7, 1), (13, 1), (14, 1), (15, 2)],
  term ((9616667667025831 : Rat) / 2901071261844) [(7, 1), (13, 1), (14, 2)],
  term ((-9616667667025831 : Rat) / 5802142523688) [(7, 1), (13, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 309 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0309_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0309
        rs_R009_ueqv_R009YNNNN_generator_05_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_05_0309 := by
  native_decide

/-- Coefficient term 310 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0310 : Poly :=
[
  term ((-1495 : Rat) / 84) [(7, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 310 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0310 : Poly :=
[
  term ((1495 : Rat) / 42) [(4, 1), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1495 : Rat) / 84) [(4, 2), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1495 : Rat) / 84) [(5, 2), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((1495 : Rat) / 84) [(7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1495 : Rat) / 42) [(7, 1), (13, 1), (14, 2), (16, 1)],
  term ((1495 : Rat) / 84) [(7, 1), (13, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 310 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0310_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0310
        rs_R009_ueqv_R009YNNNN_generator_05_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_05_0310 := by
  native_decide

/-- Coefficient term 311 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0311 : Poly :=
[
  term ((1532199782809 : Rat) / 53723541886) [(7, 1), (13, 1), (14, 2)]
]

/-- Partial product 311 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0311 : Poly :=
[
  term ((-1532199782809 : Rat) / 26861770943) [(4, 1), (7, 1), (13, 1), (14, 2)],
  term ((1532199782809 : Rat) / 53723541886) [(4, 2), (7, 1), (13, 1), (14, 2)],
  term ((1532199782809 : Rat) / 53723541886) [(5, 2), (7, 1), (13, 1), (14, 2)],
  term ((-1532199782809 : Rat) / 53723541886) [(7, 1), (13, 1), (14, 2), (15, 2)],
  term ((1532199782809 : Rat) / 26861770943) [(7, 1), (13, 1), (14, 3)],
  term ((-1532199782809 : Rat) / 53723541886) [(7, 1), (13, 1), (14, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 311 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0311_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0311
        rs_R009_ueqv_R009YNNNN_generator_05_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_05_0311 := by
  native_decide

/-- Coefficient term 312 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0312 : Poly :=
[
  term ((5165 : Rat) / 504) [(7, 1), (13, 1), (16, 1)]
]

/-- Partial product 312 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0312 : Poly :=
[
  term ((-5165 : Rat) / 252) [(4, 1), (7, 1), (13, 1), (16, 1)],
  term ((5165 : Rat) / 504) [(4, 2), (7, 1), (13, 1), (16, 1)],
  term ((5165 : Rat) / 504) [(5, 2), (7, 1), (13, 1), (16, 1)],
  term ((5165 : Rat) / 252) [(7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-5165 : Rat) / 504) [(7, 1), (13, 1), (14, 2), (16, 1)],
  term ((-5165 : Rat) / 504) [(7, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 312 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0312_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0312
        rs_R009_ueqv_R009YNNNN_generator_05_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_05_0312 := by
  native_decide

/-- Coefficient term 313 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0313 : Poly :=
[
  term ((-15082361810461453 : Rat) / 8703213785532) [(7, 1), (14, 1), (15, 1)]
]

/-- Partial product 313 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0313 : Poly :=
[
  term ((15082361810461453 : Rat) / 4351606892766) [(4, 1), (7, 1), (14, 1), (15, 1)],
  term ((-15082361810461453 : Rat) / 8703213785532) [(4, 2), (7, 1), (14, 1), (15, 1)],
  term ((-15082361810461453 : Rat) / 8703213785532) [(5, 2), (7, 1), (14, 1), (15, 1)],
  term ((15082361810461453 : Rat) / 8703213785532) [(7, 1), (14, 1), (15, 3)],
  term ((-15082361810461453 : Rat) / 4351606892766) [(7, 1), (14, 2), (15, 1)],
  term ((15082361810461453 : Rat) / 8703213785532) [(7, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 313 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0313_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0313
        rs_R009_ueqv_R009YNNNN_generator_05_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_05_0313 := by
  native_decide

/-- Coefficient term 314 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0314 : Poly :=
[
  term ((247 : Rat) / 21) [(7, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 314 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0314 : Poly :=
[
  term ((-494 : Rat) / 21) [(4, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((247 : Rat) / 21) [(4, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((247 : Rat) / 21) [(5, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-247 : Rat) / 21) [(7, 1), (14, 1), (15, 3), (16, 1)],
  term ((494 : Rat) / 21) [(7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-247 : Rat) / 21) [(7, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 314 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0314_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0314
        rs_R009_ueqv_R009YNNNN_generator_05_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_05_0314 := by
  native_decide

/-- Coefficient term 315 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0315 : Poly :=
[
  term ((4596599348427 : Rat) / 26861770943) [(7, 1), (14, 2), (15, 1)]
]

/-- Partial product 315 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0315 : Poly :=
[
  term ((-9193198696854 : Rat) / 26861770943) [(4, 1), (7, 1), (14, 2), (15, 1)],
  term ((4596599348427 : Rat) / 26861770943) [(4, 2), (7, 1), (14, 2), (15, 1)],
  term ((4596599348427 : Rat) / 26861770943) [(5, 2), (7, 1), (14, 2), (15, 1)],
  term ((-4596599348427 : Rat) / 26861770943) [(7, 1), (14, 2), (15, 3)],
  term ((9193198696854 : Rat) / 26861770943) [(7, 1), (14, 3), (15, 1)],
  term ((-4596599348427 : Rat) / 26861770943) [(7, 1), (14, 4), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 315 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0315_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0315
        rs_R009_ueqv_R009YNNNN_generator_05_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_05_0315 := by
  native_decide

/-- Coefficient term 316 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0316 : Poly :=
[
  term ((14705001849908465 : Rat) / 17406427571064) [(7, 1), (15, 1)]
]

/-- Partial product 316 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0316 : Poly :=
[
  term ((-14705001849908465 : Rat) / 8703213785532) [(4, 1), (7, 1), (15, 1)],
  term ((14705001849908465 : Rat) / 17406427571064) [(4, 2), (7, 1), (15, 1)],
  term ((14705001849908465 : Rat) / 17406427571064) [(5, 2), (7, 1), (15, 1)],
  term ((14705001849908465 : Rat) / 8703213785532) [(7, 1), (14, 1), (15, 1)],
  term ((-14705001849908465 : Rat) / 17406427571064) [(7, 1), (14, 2), (15, 1)],
  term ((-14705001849908465 : Rat) / 17406427571064) [(7, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 316 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0316_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0316
        rs_R009_ueqv_R009YNNNN_generator_05_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_05_0316 := by
  native_decide

/-- Coefficient term 317 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0317 : Poly :=
[
  term ((-965 : Rat) / 126) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 317 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0317 : Poly :=
[
  term ((965 : Rat) / 63) [(4, 1), (7, 1), (15, 1), (16, 1)],
  term ((-965 : Rat) / 126) [(4, 2), (7, 1), (15, 1), (16, 1)],
  term ((-965 : Rat) / 126) [(5, 2), (7, 1), (15, 1), (16, 1)],
  term ((-965 : Rat) / 63) [(7, 1), (14, 1), (15, 1), (16, 1)],
  term ((965 : Rat) / 126) [(7, 1), (14, 2), (15, 1), (16, 1)],
  term ((965 : Rat) / 126) [(7, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 317 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0317_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0317
        rs_R009_ueqv_R009YNNNN_generator_05_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_05_0317 := by
  native_decide

/-- Coefficient term 318 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0318 : Poly :=
[
  term ((-22724054978840279 : Rat) / 26109641356596) [(7, 2)]
]

/-- Partial product 318 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0318 : Poly :=
[
  term ((22724054978840279 : Rat) / 13054820678298) [(4, 1), (7, 2)],
  term ((-22724054978840279 : Rat) / 26109641356596) [(4, 2), (7, 2)],
  term ((-22724054978840279 : Rat) / 26109641356596) [(5, 2), (7, 2)],
  term ((-22724054978840279 : Rat) / 13054820678298) [(7, 2), (14, 1)],
  term ((22724054978840279 : Rat) / 26109641356596) [(7, 2), (14, 2)],
  term ((22724054978840279 : Rat) / 26109641356596) [(7, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 318 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0318_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0318
        rs_R009_ueqv_R009YNNNN_generator_05_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_05_0318 := by
  native_decide

/-- Coefficient term 319 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0319 : Poly :=
[
  term ((-2600143031426873 : Rat) / 13054820678298) [(7, 2), (10, 1)]
]

/-- Partial product 319 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0319 : Poly :=
[
  term ((2600143031426873 : Rat) / 6527410339149) [(4, 1), (7, 2), (10, 1)],
  term ((-2600143031426873 : Rat) / 13054820678298) [(4, 2), (7, 2), (10, 1)],
  term ((-2600143031426873 : Rat) / 13054820678298) [(5, 2), (7, 2), (10, 1)],
  term ((-2600143031426873 : Rat) / 6527410339149) [(7, 2), (10, 1), (14, 1)],
  term ((2600143031426873 : Rat) / 13054820678298) [(7, 2), (10, 1), (14, 2)],
  term ((2600143031426873 : Rat) / 13054820678298) [(7, 2), (10, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 319 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0319_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0319
        rs_R009_ueqv_R009YNNNN_generator_05_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_05_0319 := by
  native_decide

/-- Coefficient term 320 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0320 : Poly :=
[
  term ((-1532199782809 : Rat) / 322341251316) [(7, 2), (12, 1)]
]

/-- Partial product 320 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0320 : Poly :=
[
  term ((1532199782809 : Rat) / 161170625658) [(4, 1), (7, 2), (12, 1)],
  term ((-1532199782809 : Rat) / 322341251316) [(4, 2), (7, 2), (12, 1)],
  term ((-1532199782809 : Rat) / 322341251316) [(5, 2), (7, 2), (12, 1)],
  term ((-1532199782809 : Rat) / 161170625658) [(7, 2), (12, 1), (14, 1)],
  term ((1532199782809 : Rat) / 322341251316) [(7, 2), (12, 1), (14, 2)],
  term ((1532199782809 : Rat) / 322341251316) [(7, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 320 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0320_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0320
        rs_R009_ueqv_R009YNNNN_generator_05_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_05_0320 := by
  native_decide

/-- Coefficient term 321 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0321 : Poly :=
[
  term ((-4349915183394751 : Rat) / 13054820678298) [(7, 2), (12, 1), (14, 1)]
]

/-- Partial product 321 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0321 : Poly :=
[
  term ((4349915183394751 : Rat) / 6527410339149) [(4, 1), (7, 2), (12, 1), (14, 1)],
  term ((-4349915183394751 : Rat) / 13054820678298) [(4, 2), (7, 2), (12, 1), (14, 1)],
  term ((-4349915183394751 : Rat) / 13054820678298) [(5, 2), (7, 2), (12, 1), (14, 1)],
  term ((4349915183394751 : Rat) / 13054820678298) [(7, 2), (12, 1), (14, 1), (15, 2)],
  term ((-4349915183394751 : Rat) / 6527410339149) [(7, 2), (12, 1), (14, 2)],
  term ((4349915183394751 : Rat) / 13054820678298) [(7, 2), (12, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 321 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0321_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0321
        rs_R009_ueqv_R009YNNNN_generator_05_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_05_0321 := by
  native_decide

/-- Coefficient term 322 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0322 : Poly :=
[
  term ((4349915183394751 : Rat) / 4351606892766) [(7, 2), (14, 1)]
]

/-- Partial product 322 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0322 : Poly :=
[
  term ((-4349915183394751 : Rat) / 2175803446383) [(4, 1), (7, 2), (14, 1)],
  term ((4349915183394751 : Rat) / 4351606892766) [(4, 2), (7, 2), (14, 1)],
  term ((4349915183394751 : Rat) / 4351606892766) [(5, 2), (7, 2), (14, 1)],
  term ((-4349915183394751 : Rat) / 4351606892766) [(7, 2), (14, 1), (15, 2)],
  term ((4349915183394751 : Rat) / 2175803446383) [(7, 2), (14, 2)],
  term ((-4349915183394751 : Rat) / 4351606892766) [(7, 2), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 322 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0322_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0322
        rs_R009_ueqv_R009YNNNN_generator_05_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_05_0322 := by
  native_decide

/-- Coefficient term 323 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0323 : Poly :=
[
  term ((9792711872593 : Rat) / 26313571536) [(9, 1), (10, 1), (11, 1)]
]

/-- Partial product 323 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0323 : Poly :=
[
  term ((-9792711872593 : Rat) / 13156785768) [(4, 1), (9, 1), (10, 1), (11, 1)],
  term ((9792711872593 : Rat) / 26313571536) [(4, 2), (9, 1), (10, 1), (11, 1)],
  term ((9792711872593 : Rat) / 26313571536) [(5, 2), (9, 1), (10, 1), (11, 1)],
  term ((9792711872593 : Rat) / 13156785768) [(9, 1), (10, 1), (11, 1), (14, 1)],
  term ((-9792711872593 : Rat) / 26313571536) [(9, 1), (10, 1), (11, 1), (14, 2)],
  term ((-9792711872593 : Rat) / 26313571536) [(9, 1), (10, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 323 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0323_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0323
        rs_R009_ueqv_R009YNNNN_generator_05_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_05_0323 := by
  native_decide

/-- Coefficient term 324 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0324 : Poly :=
[
  term ((-4992 : Rat) / 553) [(9, 1), (10, 1), (11, 1), (12, 1)]
]

/-- Partial product 324 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0324 : Poly :=
[
  term ((9984 : Rat) / 553) [(4, 1), (9, 1), (10, 1), (11, 1), (12, 1)],
  term ((-4992 : Rat) / 553) [(4, 2), (9, 1), (10, 1), (11, 1), (12, 1)],
  term ((-4992 : Rat) / 553) [(5, 2), (9, 1), (10, 1), (11, 1), (12, 1)],
  term ((-9984 : Rat) / 553) [(9, 1), (10, 1), (11, 1), (12, 1), (14, 1)],
  term ((4992 : Rat) / 553) [(9, 1), (10, 1), (11, 1), (12, 1), (14, 2)],
  term ((4992 : Rat) / 553) [(9, 1), (10, 1), (11, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 324 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0324_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0324
        rs_R009_ueqv_R009YNNNN_generator_05_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_05_0324 := by
  native_decide

/-- Coefficient term 325 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0325 : Poly :=
[
  term ((-29952 : Rat) / 553) [(9, 1), (10, 1), (11, 1), (14, 1)]
]

/-- Partial product 325 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0325 : Poly :=
[
  term ((59904 : Rat) / 553) [(4, 1), (9, 1), (10, 1), (11, 1), (14, 1)],
  term ((-29952 : Rat) / 553) [(4, 2), (9, 1), (10, 1), (11, 1), (14, 1)],
  term ((-29952 : Rat) / 553) [(5, 2), (9, 1), (10, 1), (11, 1), (14, 1)],
  term ((29952 : Rat) / 553) [(9, 1), (10, 1), (11, 1), (14, 1), (15, 2)],
  term ((-59904 : Rat) / 553) [(9, 1), (10, 1), (11, 1), (14, 2)],
  term ((29952 : Rat) / 553) [(9, 1), (10, 1), (11, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 325 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0325_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0325
        rs_R009_ueqv_R009YNNNN_generator_05_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_05_0325 := by
  native_decide

/-- Coefficient term 326 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0326 : Poly :=
[
  term ((6090608323475 : Rat) / 532849823604) [(9, 1), (10, 1), (12, 1), (13, 1)]
]

/-- Partial product 326 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0326 : Poly :=
[
  term ((-6090608323475 : Rat) / 266424911802) [(4, 1), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((6090608323475 : Rat) / 532849823604) [(4, 2), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((6090608323475 : Rat) / 532849823604) [(5, 2), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((6090608323475 : Rat) / 266424911802) [(9, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((-6090608323475 : Rat) / 532849823604) [(9, 1), (10, 1), (12, 1), (13, 1), (14, 2)],
  term ((-6090608323475 : Rat) / 532849823604) [(9, 1), (10, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 326 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0326_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0326
        rs_R009_ueqv_R009YNNNN_generator_05_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_05_0326 := by
  native_decide

/-- Coefficient term 327 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0327 : Poly :=
[
  term ((-5 : Rat) / 6) [(9, 1), (10, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 327 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0327 : Poly :=
[
  term ((5 : Rat) / 3) [(4, 1), (9, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-5 : Rat) / 6) [(4, 2), (9, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-5 : Rat) / 6) [(5, 2), (9, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-5 : Rat) / 3) [(9, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((5 : Rat) / 6) [(9, 1), (10, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((5 : Rat) / 6) [(9, 1), (10, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 327 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0327_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0327
        rs_R009_ueqv_R009YNNNN_generator_05_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_05_0327 := by
  native_decide

/-- Coefficient term 328 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0328 : Poly :=
[
  term ((-30188368622915 : Rat) / 355233215736) [(9, 1), (10, 1), (12, 1), (15, 1)]
]

/-- Partial product 328 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0328 : Poly :=
[
  term ((30188368622915 : Rat) / 177616607868) [(4, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-30188368622915 : Rat) / 355233215736) [(4, 2), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-30188368622915 : Rat) / 355233215736) [(5, 2), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-30188368622915 : Rat) / 177616607868) [(9, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((30188368622915 : Rat) / 355233215736) [(9, 1), (10, 1), (12, 1), (14, 2), (15, 1)],
  term ((30188368622915 : Rat) / 355233215736) [(9, 1), (10, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 328 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0328_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0328
        rs_R009_ueqv_R009YNNNN_generator_05_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_05_0328 := by
  native_decide

/-- Coefficient term 329 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0329 : Poly :=
[
  term ((16 : Rat) / 21) [(9, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 329 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0329 : Poly :=
[
  term ((-32 : Rat) / 21) [(4, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((16 : Rat) / 21) [(4, 2), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((16 : Rat) / 21) [(5, 2), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 21) [(9, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-16 : Rat) / 21) [(9, 1), (10, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-16 : Rat) / 21) [(9, 1), (10, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 329 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0329_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0329
        rs_R009_ueqv_R009YNNNN_generator_05_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_05_0329 := by
  native_decide

/-- Coefficient term 330 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0330 : Poly :=
[
  term ((1048432325617 : Rat) / 532849823604) [(9, 1), (10, 1), (13, 1)]
]

/-- Partial product 330 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0330 : Poly :=
[
  term ((-1048432325617 : Rat) / 266424911802) [(4, 1), (9, 1), (10, 1), (13, 1)],
  term ((1048432325617 : Rat) / 532849823604) [(4, 2), (9, 1), (10, 1), (13, 1)],
  term ((1048432325617 : Rat) / 532849823604) [(5, 2), (9, 1), (10, 1), (13, 1)],
  term ((1048432325617 : Rat) / 266424911802) [(9, 1), (10, 1), (13, 1), (14, 1)],
  term ((-1048432325617 : Rat) / 532849823604) [(9, 1), (10, 1), (13, 1), (14, 2)],
  term ((-1048432325617 : Rat) / 532849823604) [(9, 1), (10, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 330 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0330_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0330
        rs_R009_ueqv_R009YNNNN_generator_05_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_05_0330 := by
  native_decide

/-- Coefficient term 331 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0331 : Poly :=
[
  term ((-8926828802611 : Rat) / 532849823604) [(9, 1), (10, 1), (13, 1), (14, 1)]
]

/-- Partial product 331 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0331 : Poly :=
[
  term ((8926828802611 : Rat) / 266424911802) [(4, 1), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((-8926828802611 : Rat) / 532849823604) [(4, 2), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((-8926828802611 : Rat) / 532849823604) [(5, 2), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((8926828802611 : Rat) / 532849823604) [(9, 1), (10, 1), (13, 1), (14, 1), (15, 2)],
  term ((-8926828802611 : Rat) / 266424911802) [(9, 1), (10, 1), (13, 1), (14, 2)],
  term ((8926828802611 : Rat) / 532849823604) [(9, 1), (10, 1), (13, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 331 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0331_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0331
        rs_R009_ueqv_R009YNNNN_generator_05_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_05_0331 := by
  native_decide

/-- Coefficient term 332 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0332 : Poly :=
[
  term ((-55 : Rat) / 28) [(9, 1), (10, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 332 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0332 : Poly :=
[
  term ((55 : Rat) / 14) [(4, 1), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-55 : Rat) / 28) [(4, 2), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-55 : Rat) / 28) [(5, 2), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((55 : Rat) / 28) [(9, 1), (10, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-55 : Rat) / 14) [(9, 1), (10, 1), (13, 1), (14, 2), (16, 1)],
  term ((55 : Rat) / 28) [(9, 1), (10, 1), (13, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 332 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0332_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0332
        rs_R009_ueqv_R009YNNNN_generator_05_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_05_0332 := by
  native_decide

/-- Coefficient term 333 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0333 : Poly :=
[
  term ((1375 : Rat) / 168) [(9, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 333 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0333 : Poly :=
[
  term ((-1375 : Rat) / 84) [(4, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((1375 : Rat) / 168) [(4, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((1375 : Rat) / 168) [(5, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((1375 : Rat) / 84) [(9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1375 : Rat) / 168) [(9, 1), (10, 1), (13, 1), (14, 2), (16, 1)],
  term ((-1375 : Rat) / 168) [(9, 1), (10, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 333 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0333_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0333
        rs_R009_ueqv_R009YNNNN_generator_05_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_05_0333 := by
  native_decide

/-- Coefficient term 334 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0334 : Poly :=
[
  term ((170525183774905 : Rat) / 710466431472) [(9, 1), (10, 1), (14, 1), (15, 1)]
]

/-- Partial product 334 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0334 : Poly :=
[
  term ((-170525183774905 : Rat) / 355233215736) [(4, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((170525183774905 : Rat) / 710466431472) [(4, 2), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((170525183774905 : Rat) / 710466431472) [(5, 2), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-170525183774905 : Rat) / 710466431472) [(9, 1), (10, 1), (14, 1), (15, 3)],
  term ((170525183774905 : Rat) / 355233215736) [(9, 1), (10, 1), (14, 2), (15, 1)],
  term ((-170525183774905 : Rat) / 710466431472) [(9, 1), (10, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 334 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0334_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0334
        rs_R009_ueqv_R009YNNNN_generator_05_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_05_0334 := by
  native_decide

/-- Coefficient term 335 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0335 : Poly :=
[
  term ((11 : Rat) / 7) [(9, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 335 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0335 : Poly :=
[
  term ((-22 : Rat) / 7) [(4, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((11 : Rat) / 7) [(4, 2), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((11 : Rat) / 7) [(5, 2), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-11 : Rat) / 7) [(9, 1), (10, 1), (14, 1), (15, 3), (16, 1)],
  term ((22 : Rat) / 7) [(9, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((-11 : Rat) / 7) [(9, 1), (10, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 335 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0335_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0335
        rs_R009_ueqv_R009YNNNN_generator_05_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_05_0335 := by
  native_decide

/-- Coefficient term 336 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0336 : Poly :=
[
  term ((8379467626016089 : Rat) / 25576791532992) [(9, 1), (10, 1), (15, 1)]
]

/-- Partial product 336 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0336 : Poly :=
[
  term ((-8379467626016089 : Rat) / 12788395766496) [(4, 1), (9, 1), (10, 1), (15, 1)],
  term ((8379467626016089 : Rat) / 25576791532992) [(4, 2), (9, 1), (10, 1), (15, 1)],
  term ((8379467626016089 : Rat) / 25576791532992) [(5, 2), (9, 1), (10, 1), (15, 1)],
  term ((8379467626016089 : Rat) / 12788395766496) [(9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-8379467626016089 : Rat) / 25576791532992) [(9, 1), (10, 1), (14, 2), (15, 1)],
  term ((-8379467626016089 : Rat) / 25576791532992) [(9, 1), (10, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 336 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0336_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0336
        rs_R009_ueqv_R009YNNNN_generator_05_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_05_0336 := by
  native_decide

/-- Coefficient term 337 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0337 : Poly :=
[
  term ((-43 : Rat) / 6) [(9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 337 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0337 : Poly :=
[
  term ((43 : Rat) / 3) [(4, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-43 : Rat) / 6) [(4, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-43 : Rat) / 6) [(5, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-43 : Rat) / 3) [(9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((43 : Rat) / 6) [(9, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((43 : Rat) / 6) [(9, 1), (10, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 337 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0337_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0337
        rs_R009_ueqv_R009YNNNN_generator_05_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_05_0337 := by
  native_decide

/-- Coefficient term 338 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0338 : Poly :=
[
  term ((2646018989102969 : Rat) / 8525597177664) [(9, 1), (11, 1)]
]

/-- Partial product 338 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0338 : Poly :=
[
  term ((-2646018989102969 : Rat) / 4262798588832) [(4, 1), (9, 1), (11, 1)],
  term ((2646018989102969 : Rat) / 8525597177664) [(4, 2), (9, 1), (11, 1)],
  term ((2646018989102969 : Rat) / 8525597177664) [(5, 2), (9, 1), (11, 1)],
  term ((2646018989102969 : Rat) / 4262798588832) [(9, 1), (11, 1), (14, 1)],
  term ((-2646018989102969 : Rat) / 8525597177664) [(9, 1), (11, 1), (14, 2)],
  term ((-2646018989102969 : Rat) / 8525597177664) [(9, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 338 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0338_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0338
        rs_R009_ueqv_R009YNNNN_generator_05_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_05_0338 := by
  native_decide

/-- Coefficient term 339 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0339 : Poly :=
[
  term ((16612902868000 : Rat) / 133212455901) [(9, 1), (11, 1), (12, 1)]
]

/-- Partial product 339 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0339 : Poly :=
[
  term ((-33225805736000 : Rat) / 133212455901) [(4, 1), (9, 1), (11, 1), (12, 1)],
  term ((16612902868000 : Rat) / 133212455901) [(4, 2), (9, 1), (11, 1), (12, 1)],
  term ((16612902868000 : Rat) / 133212455901) [(5, 2), (9, 1), (11, 1), (12, 1)],
  term ((33225805736000 : Rat) / 133212455901) [(9, 1), (11, 1), (12, 1), (14, 1)],
  term ((-16612902868000 : Rat) / 133212455901) [(9, 1), (11, 1), (12, 1), (14, 2)],
  term ((-16612902868000 : Rat) / 133212455901) [(9, 1), (11, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 339 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0339_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0339
        rs_R009_ueqv_R009YNNNN_generator_05_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_05_0339 := by
  native_decide

/-- Coefficient term 340 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0340 : Poly :=
[
  term ((14792437532950093 : Rat) / 25576791532992) [(9, 1), (11, 1), (14, 1)]
]

/-- Partial product 340 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0340 : Poly :=
[
  term ((-14792437532950093 : Rat) / 12788395766496) [(4, 1), (9, 1), (11, 1), (14, 1)],
  term ((14792437532950093 : Rat) / 25576791532992) [(4, 2), (9, 1), (11, 1), (14, 1)],
  term ((14792437532950093 : Rat) / 25576791532992) [(5, 2), (9, 1), (11, 1), (14, 1)],
  term ((-14792437532950093 : Rat) / 25576791532992) [(9, 1), (11, 1), (14, 1), (15, 2)],
  term ((14792437532950093 : Rat) / 12788395766496) [(9, 1), (11, 1), (14, 2)],
  term ((-14792437532950093 : Rat) / 25576791532992) [(9, 1), (11, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 340 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0340_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0340
        rs_R009_ueqv_R009YNNNN_generator_05_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_05_0340 := by
  native_decide

/-- Coefficient term 341 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0341 : Poly :=
[
  term ((-59904 : Rat) / 553) [(9, 1), (11, 1), (14, 2)]
]

/-- Partial product 341 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0341 : Poly :=
[
  term ((119808 : Rat) / 553) [(4, 1), (9, 1), (11, 1), (14, 2)],
  term ((-59904 : Rat) / 553) [(4, 2), (9, 1), (11, 1), (14, 2)],
  term ((-59904 : Rat) / 553) [(5, 2), (9, 1), (11, 1), (14, 2)],
  term ((59904 : Rat) / 553) [(9, 1), (11, 1), (14, 2), (15, 2)],
  term ((-119808 : Rat) / 553) [(9, 1), (11, 1), (14, 3)],
  term ((59904 : Rat) / 553) [(9, 1), (11, 1), (14, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 341 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0341_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0341
        rs_R009_ueqv_R009YNNNN_generator_05_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_05_0341 := by
  native_decide

/-- Coefficient term 342 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0342 : Poly :=
[
  term ((9008294618453 : Rat) / 236822143824) [(9, 1), (11, 1), (15, 2)]
]

/-- Partial product 342 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0342 : Poly :=
[
  term ((-9008294618453 : Rat) / 118411071912) [(4, 1), (9, 1), (11, 1), (15, 2)],
  term ((9008294618453 : Rat) / 236822143824) [(4, 2), (9, 1), (11, 1), (15, 2)],
  term ((9008294618453 : Rat) / 236822143824) [(5, 2), (9, 1), (11, 1), (15, 2)],
  term ((9008294618453 : Rat) / 118411071912) [(9, 1), (11, 1), (14, 1), (15, 2)],
  term ((-9008294618453 : Rat) / 236822143824) [(9, 1), (11, 1), (14, 2), (15, 2)],
  term ((-9008294618453 : Rat) / 236822143824) [(9, 1), (11, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 342 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0342_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0342
        rs_R009_ueqv_R009YNNNN_generator_05_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_05_0342 := by
  native_decide

/-- Coefficient term 343 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0343 : Poly :=
[
  term ((-97923607474811 : Rat) / 1065699647208) [(9, 1), (12, 1), (13, 1)]
]

/-- Partial product 343 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0343 : Poly :=
[
  term ((97923607474811 : Rat) / 532849823604) [(4, 1), (9, 1), (12, 1), (13, 1)],
  term ((-97923607474811 : Rat) / 1065699647208) [(4, 2), (9, 1), (12, 1), (13, 1)],
  term ((-97923607474811 : Rat) / 1065699647208) [(5, 2), (9, 1), (12, 1), (13, 1)],
  term ((-97923607474811 : Rat) / 532849823604) [(9, 1), (12, 1), (13, 1), (14, 1)],
  term ((97923607474811 : Rat) / 1065699647208) [(9, 1), (12, 1), (13, 1), (14, 2)],
  term ((97923607474811 : Rat) / 1065699647208) [(9, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 343 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0343_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0343
        rs_R009_ueqv_R009YNNNN_generator_05_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_05_0343 := by
  native_decide

/-- Coefficient term 344 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0344 : Poly :=
[
  term ((475 : Rat) / 84) [(9, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 344 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0344 : Poly :=
[
  term ((-475 : Rat) / 42) [(4, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((475 : Rat) / 84) [(4, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((475 : Rat) / 84) [(5, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((475 : Rat) / 42) [(9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-475 : Rat) / 84) [(9, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-475 : Rat) / 84) [(9, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 344 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0344_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0344
        rs_R009_ueqv_R009YNNNN_generator_05_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_05_0344 := by
  native_decide

/-- Coefficient term 345 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0345 : Poly :=
[
  term ((-2172201733 : Rat) / 666166368) [(9, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 345 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0345 : Poly :=
[
  term ((2172201733 : Rat) / 333083184) [(4, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-2172201733 : Rat) / 666166368) [(4, 2), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-2172201733 : Rat) / 666166368) [(5, 2), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((2172201733 : Rat) / 666166368) [(9, 1), (12, 1), (14, 1), (15, 3)],
  term ((-2172201733 : Rat) / 333083184) [(9, 1), (12, 1), (14, 2), (15, 1)],
  term ((2172201733 : Rat) / 666166368) [(9, 1), (12, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 345 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0345_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0345
        rs_R009_ueqv_R009YNNNN_generator_05_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_05_0345 := by
  native_decide

/-- Coefficient term 346 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0346 : Poly :=
[
  term ((10110568816218515 : Rat) / 139251420568512) [(9, 1), (12, 1), (15, 1)]
]

/-- Partial product 346 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0346 : Poly :=
[
  term ((-10110568816218515 : Rat) / 69625710284256) [(4, 1), (9, 1), (12, 1), (15, 1)],
  term ((10110568816218515 : Rat) / 139251420568512) [(4, 2), (9, 1), (12, 1), (15, 1)],
  term ((10110568816218515 : Rat) / 139251420568512) [(5, 2), (9, 1), (12, 1), (15, 1)],
  term ((10110568816218515 : Rat) / 69625710284256) [(9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-10110568816218515 : Rat) / 139251420568512) [(9, 1), (12, 1), (14, 2), (15, 1)],
  term ((-10110568816218515 : Rat) / 139251420568512) [(9, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 346 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0346_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0346
        rs_R009_ueqv_R009YNNNN_generator_05_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_05_0346 := by
  native_decide

/-- Coefficient term 347 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0347 : Poly :=
[
  term ((-32 : Rat) / 7) [(9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 347 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0347 : Poly :=
[
  term ((64 : Rat) / 7) [(4, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 7) [(4, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 7) [(5, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-64 : Rat) / 7) [(9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 7) [(9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((32 : Rat) / 7) [(9, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 347 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0347_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0347
        rs_R009_ueqv_R009YNNNN_generator_05_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_05_0347 := by
  native_decide

/-- Coefficient term 348 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0348 : Poly :=
[
  term ((521450111883941 : Rat) / 8525597177664) [(9, 1), (13, 1)]
]

/-- Partial product 348 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0348 : Poly :=
[
  term ((-521450111883941 : Rat) / 4262798588832) [(4, 1), (9, 1), (13, 1)],
  term ((521450111883941 : Rat) / 8525597177664) [(4, 2), (9, 1), (13, 1)],
  term ((521450111883941 : Rat) / 8525597177664) [(5, 2), (9, 1), (13, 1)],
  term ((521450111883941 : Rat) / 4262798588832) [(9, 1), (13, 1), (14, 1)],
  term ((-521450111883941 : Rat) / 8525597177664) [(9, 1), (13, 1), (14, 2)],
  term ((-521450111883941 : Rat) / 8525597177664) [(9, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 348 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0348_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0348
        rs_R009_ueqv_R009YNNNN_generator_05_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_05_0348 := by
  native_decide

/-- Coefficient term 349 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0349 : Poly :=
[
  term ((15738021822006055 : Rat) / 25576791532992) [(9, 1), (13, 1), (14, 1)]
]

/-- Partial product 349 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0349 : Poly :=
[
  term ((-15738021822006055 : Rat) / 12788395766496) [(4, 1), (9, 1), (13, 1), (14, 1)],
  term ((15738021822006055 : Rat) / 25576791532992) [(4, 2), (9, 1), (13, 1), (14, 1)],
  term ((15738021822006055 : Rat) / 25576791532992) [(5, 2), (9, 1), (13, 1), (14, 1)],
  term ((-15738021822006055 : Rat) / 25576791532992) [(9, 1), (13, 1), (14, 1), (15, 2)],
  term ((15738021822006055 : Rat) / 12788395766496) [(9, 1), (13, 1), (14, 2)],
  term ((-15738021822006055 : Rat) / 25576791532992) [(9, 1), (13, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 349 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0349_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0349
        rs_R009_ueqv_R009YNNNN_generator_05_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_05_0349 := by
  native_decide

/-- Coefficient term 350 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0350 : Poly :=
[
  term ((1105 : Rat) / 84) [(9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 350 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0350 : Poly :=
[
  term ((-1105 : Rat) / 42) [(4, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((1105 : Rat) / 84) [(4, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((1105 : Rat) / 84) [(5, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1105 : Rat) / 84) [(9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((1105 : Rat) / 42) [(9, 1), (13, 1), (14, 2), (16, 1)],
  term ((-1105 : Rat) / 84) [(9, 1), (13, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 350 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0350_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0350
        rs_R009_ueqv_R009YNNNN_generator_05_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_05_0350 := by
  native_decide

/-- Coefficient term 351 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0351 : Poly :=
[
  term ((6422908767787 : Rat) / 157881429216) [(9, 1), (13, 1), (14, 2)]
]

/-- Partial product 351 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0351 : Poly :=
[
  term ((-6422908767787 : Rat) / 78940714608) [(4, 1), (9, 1), (13, 1), (14, 2)],
  term ((6422908767787 : Rat) / 157881429216) [(4, 2), (9, 1), (13, 1), (14, 2)],
  term ((6422908767787 : Rat) / 157881429216) [(5, 2), (9, 1), (13, 1), (14, 2)],
  term ((-6422908767787 : Rat) / 157881429216) [(9, 1), (13, 1), (14, 2), (15, 2)],
  term ((6422908767787 : Rat) / 78940714608) [(9, 1), (13, 1), (14, 3)],
  term ((-6422908767787 : Rat) / 157881429216) [(9, 1), (13, 1), (14, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 351 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0351_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0351
        rs_R009_ueqv_R009YNNNN_generator_05_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_05_0351 := by
  native_decide

/-- Coefficient term 352 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0352 : Poly :=
[
  term ((-305 : Rat) / 56) [(9, 1), (13, 1), (14, 2), (16, 1)]
]

/-- Partial product 352 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0352 : Poly :=
[
  term ((305 : Rat) / 28) [(4, 1), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((-305 : Rat) / 56) [(4, 2), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((-305 : Rat) / 56) [(5, 2), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((305 : Rat) / 56) [(9, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-305 : Rat) / 28) [(9, 1), (13, 1), (14, 3), (16, 1)],
  term ((305 : Rat) / 56) [(9, 1), (13, 1), (14, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 352 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0352_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0352
        rs_R009_ueqv_R009YNNNN_generator_05_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_05_0352 := by
  native_decide

/-- Coefficient term 353 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0353 : Poly :=
[
  term ((-2954048478533 : Rat) / 78940714608) [(9, 1), (13, 1), (15, 2)]
]

/-- Partial product 353 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0353 : Poly :=
[
  term ((2954048478533 : Rat) / 39470357304) [(4, 1), (9, 1), (13, 1), (15, 2)],
  term ((-2954048478533 : Rat) / 78940714608) [(4, 2), (9, 1), (13, 1), (15, 2)],
  term ((-2954048478533 : Rat) / 78940714608) [(5, 2), (9, 1), (13, 1), (15, 2)],
  term ((-2954048478533 : Rat) / 39470357304) [(9, 1), (13, 1), (14, 1), (15, 2)],
  term ((2954048478533 : Rat) / 78940714608) [(9, 1), (13, 1), (14, 2), (15, 2)],
  term ((2954048478533 : Rat) / 78940714608) [(9, 1), (13, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 353 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0353_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0353
        rs_R009_ueqv_R009YNNNN_generator_05_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_05_0353 := by
  native_decide

/-- Coefficient term 354 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0354 : Poly :=
[
  term ((305 : Rat) / 56) [(9, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 354 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0354 : Poly :=
[
  term ((-305 : Rat) / 28) [(4, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((305 : Rat) / 56) [(4, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((305 : Rat) / 56) [(5, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((305 : Rat) / 28) [(9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-305 : Rat) / 56) [(9, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-305 : Rat) / 56) [(9, 1), (13, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 354 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0354_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0354
        rs_R009_ueqv_R009YNNNN_generator_05_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_05_0354 := by
  native_decide

/-- Coefficient term 355 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0355 : Poly :=
[
  term ((-745 : Rat) / 336) [(9, 1), (13, 1), (16, 1)]
]

/-- Partial product 355 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0355 : Poly :=
[
  term ((745 : Rat) / 168) [(4, 1), (9, 1), (13, 1), (16, 1)],
  term ((-745 : Rat) / 336) [(4, 2), (9, 1), (13, 1), (16, 1)],
  term ((-745 : Rat) / 336) [(5, 2), (9, 1), (13, 1), (16, 1)],
  term ((-745 : Rat) / 168) [(9, 1), (13, 1), (14, 1), (16, 1)],
  term ((745 : Rat) / 336) [(9, 1), (13, 1), (14, 2), (16, 1)],
  term ((745 : Rat) / 336) [(9, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 355 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0355_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0355
        rs_R009_ueqv_R009YNNNN_generator_05_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_05_0355 := by
  native_decide

/-- Coefficient term 356 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0356 : Poly :=
[
  term ((107701373402531 : Rat) / 725267815461) [(9, 1), (14, 1), (15, 1)]
]

/-- Partial product 356 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0356 : Poly :=
[
  term ((-215402746805062 : Rat) / 725267815461) [(4, 1), (9, 1), (14, 1), (15, 1)],
  term ((107701373402531 : Rat) / 725267815461) [(4, 2), (9, 1), (14, 1), (15, 1)],
  term ((107701373402531 : Rat) / 725267815461) [(5, 2), (9, 1), (14, 1), (15, 1)],
  term ((-107701373402531 : Rat) / 725267815461) [(9, 1), (14, 1), (15, 3)],
  term ((215402746805062 : Rat) / 725267815461) [(9, 1), (14, 2), (15, 1)],
  term ((-107701373402531 : Rat) / 725267815461) [(9, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 356 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0356_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0356
        rs_R009_ueqv_R009YNNNN_generator_05_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_05_0356 := by
  native_decide

/-- Coefficient term 357 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0357 : Poly :=
[
  term ((-227 : Rat) / 21) [(9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 357 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0357 : Poly :=
[
  term ((454 : Rat) / 21) [(4, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-227 : Rat) / 21) [(4, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-227 : Rat) / 21) [(5, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((227 : Rat) / 21) [(9, 1), (14, 1), (15, 3), (16, 1)],
  term ((-454 : Rat) / 21) [(9, 1), (14, 2), (15, 1), (16, 1)],
  term ((227 : Rat) / 21) [(9, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 357 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0357_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0357
        rs_R009_ueqv_R009YNNNN_generator_05_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_05_0357 := by
  native_decide

/-- Coefficient term 358 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0358 : Poly :=
[
  term ((-3366906314273 : Rat) / 59205535956) [(9, 1), (14, 2), (15, 1)]
]

/-- Partial product 358 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0358 : Poly :=
[
  term ((3366906314273 : Rat) / 29602767978) [(4, 1), (9, 1), (14, 2), (15, 1)],
  term ((-3366906314273 : Rat) / 59205535956) [(4, 2), (9, 1), (14, 2), (15, 1)],
  term ((-3366906314273 : Rat) / 59205535956) [(5, 2), (9, 1), (14, 2), (15, 1)],
  term ((3366906314273 : Rat) / 59205535956) [(9, 1), (14, 2), (15, 3)],
  term ((-3366906314273 : Rat) / 29602767978) [(9, 1), (14, 3), (15, 1)],
  term ((3366906314273 : Rat) / 59205535956) [(9, 1), (14, 4), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 358 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0358_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0358
        rs_R009_ueqv_R009YNNNN_generator_05_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_05_0358 := by
  native_decide

/-- Coefficient term 359 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0359 : Poly :=
[
  term ((65 : Rat) / 14) [(9, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 359 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0359 : Poly :=
[
  term ((-65 : Rat) / 7) [(4, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((65 : Rat) / 14) [(4, 2), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((65 : Rat) / 14) [(5, 2), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-65 : Rat) / 14) [(9, 1), (14, 2), (15, 3), (16, 1)],
  term ((65 : Rat) / 7) [(9, 1), (14, 3), (15, 1), (16, 1)],
  term ((-65 : Rat) / 14) [(9, 1), (14, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 359 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0359_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0359
        rs_R009_ueqv_R009YNNNN_generator_05_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_05_0359 := by
  native_decide

/-- Coefficient term 360 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0360 : Poly :=
[
  term ((-539299417941477509 : Rat) / 626631392558304) [(9, 1), (15, 1)]
]

/-- Partial product 360 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0360 : Poly :=
[
  term ((539299417941477509 : Rat) / 313315696279152) [(4, 1), (9, 1), (15, 1)],
  term ((-539299417941477509 : Rat) / 626631392558304) [(4, 2), (9, 1), (15, 1)],
  term ((-539299417941477509 : Rat) / 626631392558304) [(5, 2), (9, 1), (15, 1)],
  term ((-539299417941477509 : Rat) / 313315696279152) [(9, 1), (14, 1), (15, 1)],
  term ((539299417941477509 : Rat) / 626631392558304) [(9, 1), (14, 2), (15, 1)],
  term ((539299417941477509 : Rat) / 626631392558304) [(9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 360 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0360_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0360
        rs_R009_ueqv_R009YNNNN_generator_05_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_05_0360 := by
  native_decide

/-- Coefficient term 361 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0361 : Poly :=
[
  term ((241 : Rat) / 84) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 361 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0361 : Poly :=
[
  term ((-241 : Rat) / 42) [(4, 1), (9, 1), (15, 1), (16, 1)],
  term ((241 : Rat) / 84) [(4, 2), (9, 1), (15, 1), (16, 1)],
  term ((241 : Rat) / 84) [(5, 2), (9, 1), (15, 1), (16, 1)],
  term ((241 : Rat) / 42) [(9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-241 : Rat) / 84) [(9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-241 : Rat) / 84) [(9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 361 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0361_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0361
        rs_R009_ueqv_R009YNNNN_generator_05_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_05_0361 := by
  native_decide

/-- Coefficient term 362 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0362 : Poly :=
[
  term ((3366906314273 : Rat) / 59205535956) [(9, 1), (15, 3)]
]

/-- Partial product 362 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0362 : Poly :=
[
  term ((-3366906314273 : Rat) / 29602767978) [(4, 1), (9, 1), (15, 3)],
  term ((3366906314273 : Rat) / 59205535956) [(4, 2), (9, 1), (15, 3)],
  term ((3366906314273 : Rat) / 59205535956) [(5, 2), (9, 1), (15, 3)],
  term ((3366906314273 : Rat) / 29602767978) [(9, 1), (14, 1), (15, 3)],
  term ((-3366906314273 : Rat) / 59205535956) [(9, 1), (14, 2), (15, 3)],
  term ((-3366906314273 : Rat) / 59205535956) [(9, 1), (15, 5)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 362 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0362_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0362
        rs_R009_ueqv_R009YNNNN_generator_05_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_05_0362 := by
  native_decide

/-- Coefficient term 363 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0363 : Poly :=
[
  term ((-65 : Rat) / 14) [(9, 1), (15, 3), (16, 1)]
]

/-- Partial product 363 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0363 : Poly :=
[
  term ((65 : Rat) / 7) [(4, 1), (9, 1), (15, 3), (16, 1)],
  term ((-65 : Rat) / 14) [(4, 2), (9, 1), (15, 3), (16, 1)],
  term ((-65 : Rat) / 14) [(5, 2), (9, 1), (15, 3), (16, 1)],
  term ((-65 : Rat) / 7) [(9, 1), (14, 1), (15, 3), (16, 1)],
  term ((65 : Rat) / 14) [(9, 1), (14, 2), (15, 3), (16, 1)],
  term ((65 : Rat) / 14) [(9, 1), (15, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 363 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0363_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0363
        rs_R009_ueqv_R009YNNNN_generator_05_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_05_0363 := by
  native_decide

/-- Coefficient term 364 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0364 : Poly :=
[
  term ((-79857096087821 : Rat) / 405980817984) [(9, 2)]
]

/-- Partial product 364 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0364 : Poly :=
[
  term ((79857096087821 : Rat) / 202990408992) [(4, 1), (9, 2)],
  term ((-79857096087821 : Rat) / 405980817984) [(4, 2), (9, 2)],
  term ((-79857096087821 : Rat) / 405980817984) [(5, 2), (9, 2)],
  term ((-79857096087821 : Rat) / 202990408992) [(9, 2), (14, 1)],
  term ((79857096087821 : Rat) / 405980817984) [(9, 2), (14, 2)],
  term ((79857096087821 : Rat) / 405980817984) [(9, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 364 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0364_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0364
        rs_R009_ueqv_R009YNNNN_generator_05_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_05_0364 := by
  native_decide

/-- Coefficient term 365 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0365 : Poly :=
[
  term ((-158570726509 : Rat) / 17986491936) [(9, 2), (10, 1)]
]

/-- Partial product 365 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0365 : Poly :=
[
  term ((158570726509 : Rat) / 8993245968) [(4, 1), (9, 2), (10, 1)],
  term ((-158570726509 : Rat) / 17986491936) [(4, 2), (9, 2), (10, 1)],
  term ((-158570726509 : Rat) / 17986491936) [(5, 2), (9, 2), (10, 1)],
  term ((-158570726509 : Rat) / 8993245968) [(9, 2), (10, 1), (14, 1)],
  term ((158570726509 : Rat) / 17986491936) [(9, 2), (10, 1), (14, 2)],
  term ((158570726509 : Rat) / 17986491936) [(9, 2), (10, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 365 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0365_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0365
        rs_R009_ueqv_R009YNNNN_generator_05_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_05_0365 := by
  native_decide

/-- Coefficient term 366 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0366 : Poly :=
[
  term ((-67338253723 : Rat) / 4496622984) [(9, 2), (10, 1), (12, 1)]
]

/-- Partial product 366 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0366 : Poly :=
[
  term ((67338253723 : Rat) / 2248311492) [(4, 1), (9, 2), (10, 1), (12, 1)],
  term ((-67338253723 : Rat) / 4496622984) [(4, 2), (9, 2), (10, 1), (12, 1)],
  term ((-67338253723 : Rat) / 4496622984) [(5, 2), (9, 2), (10, 1), (12, 1)],
  term ((-67338253723 : Rat) / 2248311492) [(9, 2), (10, 1), (12, 1), (14, 1)],
  term ((67338253723 : Rat) / 4496622984) [(9, 2), (10, 1), (12, 1), (14, 2)],
  term ((67338253723 : Rat) / 4496622984) [(9, 2), (10, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 366 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0366_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0366
        rs_R009_ueqv_R009YNNNN_generator_05_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_05_0366 := by
  native_decide

/-- Coefficient term 367 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0367 : Poly :=
[
  term ((2172201733 : Rat) / 333083184) [(9, 2), (10, 1), (14, 1)]
]

/-- Partial product 367 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0367 : Poly :=
[
  term ((-2172201733 : Rat) / 166541592) [(4, 1), (9, 2), (10, 1), (14, 1)],
  term ((2172201733 : Rat) / 333083184) [(4, 2), (9, 2), (10, 1), (14, 1)],
  term ((2172201733 : Rat) / 333083184) [(5, 2), (9, 2), (10, 1), (14, 1)],
  term ((-2172201733 : Rat) / 333083184) [(9, 2), (10, 1), (14, 1), (15, 2)],
  term ((2172201733 : Rat) / 166541592) [(9, 2), (10, 1), (14, 2)],
  term ((-2172201733 : Rat) / 333083184) [(9, 2), (10, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 367 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0367_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0367
        rs_R009_ueqv_R009YNNNN_generator_05_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_05_0367 := by
  native_decide

/-- Coefficient term 368 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0368 : Poly :=
[
  term ((997316410233 : Rat) / 8771190512) [(9, 2), (12, 1)]
]

/-- Partial product 368 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0368 : Poly :=
[
  term ((-997316410233 : Rat) / 4385595256) [(4, 1), (9, 2), (12, 1)],
  term ((997316410233 : Rat) / 8771190512) [(4, 2), (9, 2), (12, 1)],
  term ((997316410233 : Rat) / 8771190512) [(5, 2), (9, 2), (12, 1)],
  term ((997316410233 : Rat) / 4385595256) [(9, 2), (12, 1), (14, 1)],
  term ((-997316410233 : Rat) / 8771190512) [(9, 2), (12, 1), (14, 2)],
  term ((-997316410233 : Rat) / 8771190512) [(9, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 368 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0368_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0368
        rs_R009_ueqv_R009YNNNN_generator_05_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_05_0368 := by
  native_decide

/-- Coefficient term 369 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0369 : Poly :=
[
  term ((8129680847544803 : Rat) / 34812855142128) [(9, 2), (14, 1)]
]

/-- Partial product 369 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0369 : Poly :=
[
  term ((-8129680847544803 : Rat) / 17406427571064) [(4, 1), (9, 2), (14, 1)],
  term ((8129680847544803 : Rat) / 34812855142128) [(4, 2), (9, 2), (14, 1)],
  term ((8129680847544803 : Rat) / 34812855142128) [(5, 2), (9, 2), (14, 1)],
  term ((-8129680847544803 : Rat) / 34812855142128) [(9, 2), (14, 1), (15, 2)],
  term ((8129680847544803 : Rat) / 17406427571064) [(9, 2), (14, 2)],
  term ((-8129680847544803 : Rat) / 34812855142128) [(9, 2), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 369 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0369_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0369
        rs_R009_ueqv_R009YNNNN_generator_05_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_05_0369 := by
  native_decide

/-- Coefficient term 370 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0370 : Poly :=
[
  term ((-210703568101 : Rat) / 5995497312) [(9, 2), (14, 2)]
]

/-- Partial product 370 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0370 : Poly :=
[
  term ((210703568101 : Rat) / 2997748656) [(4, 1), (9, 2), (14, 2)],
  term ((-210703568101 : Rat) / 5995497312) [(4, 2), (9, 2), (14, 2)],
  term ((-210703568101 : Rat) / 5995497312) [(5, 2), (9, 2), (14, 2)],
  term ((210703568101 : Rat) / 5995497312) [(9, 2), (14, 2), (15, 2)],
  term ((-210703568101 : Rat) / 2997748656) [(9, 2), (14, 3)],
  term ((210703568101 : Rat) / 5995497312) [(9, 2), (14, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 370 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0370_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0370
        rs_R009_ueqv_R009YNNNN_generator_05_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_05_0370 := by
  native_decide

/-- Coefficient term 371 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0371 : Poly :=
[
  term ((210703568101 : Rat) / 5995497312) [(9, 2), (15, 2)]
]

/-- Partial product 371 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0371 : Poly :=
[
  term ((-210703568101 : Rat) / 2997748656) [(4, 1), (9, 2), (15, 2)],
  term ((210703568101 : Rat) / 5995497312) [(4, 2), (9, 2), (15, 2)],
  term ((210703568101 : Rat) / 5995497312) [(5, 2), (9, 2), (15, 2)],
  term ((210703568101 : Rat) / 2997748656) [(9, 2), (14, 1), (15, 2)],
  term ((-210703568101 : Rat) / 5995497312) [(9, 2), (14, 2), (15, 2)],
  term ((-210703568101 : Rat) / 5995497312) [(9, 2), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 371 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0371_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0371
        rs_R009_ueqv_R009YNNNN_generator_05_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_05_0371 := by
  native_decide

/-- Coefficient term 372 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0372 : Poly :=
[
  term ((-31532 : Rat) / 1659) [(10, 1)]
]

/-- Partial product 372 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0372 : Poly :=
[
  term ((63064 : Rat) / 1659) [(4, 1), (10, 1)],
  term ((-31532 : Rat) / 1659) [(4, 2), (10, 1)],
  term ((-31532 : Rat) / 1659) [(5, 2), (10, 1)],
  term ((-63064 : Rat) / 1659) [(10, 1), (14, 1)],
  term ((31532 : Rat) / 1659) [(10, 1), (14, 2)],
  term ((31532 : Rat) / 1659) [(10, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 372 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0372_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0372
        rs_R009_ueqv_R009YNNNN_generator_05_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_05_0372 := by
  native_decide

/-- Coefficient term 373 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0373 : Poly :=
[
  term ((-74880 : Rat) / 553) [(10, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 373 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0373 : Poly :=
[
  term ((149760 : Rat) / 553) [(4, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-74880 : Rat) / 553) [(4, 2), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-74880 : Rat) / 553) [(5, 2), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-149760 : Rat) / 553) [(10, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((74880 : Rat) / 553) [(10, 1), (11, 1), (12, 1), (14, 2), (15, 1)],
  term ((74880 : Rat) / 553) [(10, 1), (11, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 373 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0373_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0373
        rs_R009_ueqv_R009YNNNN_generator_05_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_05_0373 := by
  native_decide

/-- Coefficient term 374 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0374 : Poly :=
[
  term ((-32582181535333 : Rat) / 118411071912) [(10, 1), (11, 1), (13, 1)]
]

/-- Partial product 374 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0374 : Poly :=
[
  term ((32582181535333 : Rat) / 59205535956) [(4, 1), (10, 1), (11, 1), (13, 1)],
  term ((-32582181535333 : Rat) / 118411071912) [(4, 2), (10, 1), (11, 1), (13, 1)],
  term ((-32582181535333 : Rat) / 118411071912) [(5, 2), (10, 1), (11, 1), (13, 1)],
  term ((-32582181535333 : Rat) / 59205535956) [(10, 1), (11, 1), (13, 1), (14, 1)],
  term ((32582181535333 : Rat) / 118411071912) [(10, 1), (11, 1), (13, 1), (14, 2)],
  term ((32582181535333 : Rat) / 118411071912) [(10, 1), (11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 374 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0374_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0374
        rs_R009_ueqv_R009YNNNN_generator_05_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_05_0374 := by
  native_decide

/-- Coefficient term 375 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0375 : Poly :=
[
  term ((74880 : Rat) / 553) [(10, 1), (11, 1), (13, 1), (14, 1)]
]

/-- Partial product 375 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0375 : Poly :=
[
  term ((-149760 : Rat) / 553) [(4, 1), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((74880 : Rat) / 553) [(4, 2), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((74880 : Rat) / 553) [(5, 2), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((-74880 : Rat) / 553) [(10, 1), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((149760 : Rat) / 553) [(10, 1), (11, 1), (13, 1), (14, 2)],
  term ((-74880 : Rat) / 553) [(10, 1), (11, 1), (13, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 375 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0375_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0375
        rs_R009_ueqv_R009YNNNN_generator_05_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_05_0375 := by
  native_decide

/-- Coefficient term 376 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0376 : Poly :=
[
  term ((-165 : Rat) / 28) [(10, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 376 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0376 : Poly :=
[
  term ((165 : Rat) / 14) [(4, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-165 : Rat) / 28) [(4, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-165 : Rat) / 28) [(5, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-165 : Rat) / 14) [(10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((165 : Rat) / 28) [(10, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((165 : Rat) / 28) [(10, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 376 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0376_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0376
        rs_R009_ueqv_R009YNNNN_generator_05_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_05_0376 := by
  native_decide

/-- Coefficient term 377 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0377 : Poly :=
[
  term ((119808 : Rat) / 553) [(10, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 377 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0377 : Poly :=
[
  term ((-239616 : Rat) / 553) [(4, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((119808 : Rat) / 553) [(4, 2), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((119808 : Rat) / 553) [(5, 2), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-119808 : Rat) / 553) [(10, 1), (11, 1), (14, 1), (15, 3)],
  term ((239616 : Rat) / 553) [(10, 1), (11, 1), (14, 2), (15, 1)],
  term ((-119808 : Rat) / 553) [(10, 1), (11, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 377 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0377_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0377
        rs_R009_ueqv_R009YNNNN_generator_05_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_05_0377 := by
  native_decide

/-- Coefficient term 378 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0378 : Poly :=
[
  term ((4859302377380188 : Rat) / 6527410339149) [(10, 1), (11, 1), (15, 1)]
]

/-- Partial product 378 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0378 : Poly :=
[
  term ((-9718604754760376 : Rat) / 6527410339149) [(4, 1), (10, 1), (11, 1), (15, 1)],
  term ((4859302377380188 : Rat) / 6527410339149) [(4, 2), (10, 1), (11, 1), (15, 1)],
  term ((4859302377380188 : Rat) / 6527410339149) [(5, 2), (10, 1), (11, 1), (15, 1)],
  term ((9718604754760376 : Rat) / 6527410339149) [(10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-4859302377380188 : Rat) / 6527410339149) [(10, 1), (11, 1), (14, 2), (15, 1)],
  term ((-4859302377380188 : Rat) / 6527410339149) [(10, 1), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 378 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0378_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0378
        rs_R009_ueqv_R009YNNNN_generator_05_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_05_0378 := by
  native_decide

/-- Coefficient term 379 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0379 : Poly :=
[
  term ((37 : Rat) / 7) [(10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 379 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0379 : Poly :=
[
  term ((-74 : Rat) / 7) [(4, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((37 : Rat) / 7) [(4, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((37 : Rat) / 7) [(5, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((74 : Rat) / 7) [(10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-37 : Rat) / 7) [(10, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-37 : Rat) / 7) [(10, 1), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 379 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0379_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0379
        rs_R009_ueqv_R009YNNNN_generator_05_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_05_0379 := by
  native_decide

/-- Coefficient term 380 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0380 : Poly :=
[
  term ((-119808 : Rat) / 553) [(10, 1), (11, 2)]
]

/-- Partial product 380 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0380 : Poly :=
[
  term ((239616 : Rat) / 553) [(4, 1), (10, 1), (11, 2)],
  term ((-119808 : Rat) / 553) [(4, 2), (10, 1), (11, 2)],
  term ((-119808 : Rat) / 553) [(5, 2), (10, 1), (11, 2)],
  term ((-239616 : Rat) / 553) [(10, 1), (11, 2), (14, 1)],
  term ((119808 : Rat) / 553) [(10, 1), (11, 2), (14, 2)],
  term ((119808 : Rat) / 553) [(10, 1), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 380 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0380_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0380
        rs_R009_ueqv_R009YNNNN_generator_05_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_05_0380 := by
  native_decide

/-- Coefficient term 381 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0381 : Poly :=
[
  term ((-40 : Rat) / 21) [(10, 1), (12, 1)]
]

/-- Partial product 381 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0381 : Poly :=
[
  term ((80 : Rat) / 21) [(4, 1), (10, 1), (12, 1)],
  term ((-40 : Rat) / 21) [(4, 2), (10, 1), (12, 1)],
  term ((-40 : Rat) / 21) [(5, 2), (10, 1), (12, 1)],
  term ((-80 : Rat) / 21) [(10, 1), (12, 1), (14, 1)],
  term ((40 : Rat) / 21) [(10, 1), (12, 1), (14, 2)],
  term ((40 : Rat) / 21) [(10, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 381 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0381_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0381
        rs_R009_ueqv_R009YNNNN_generator_05_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_05_0381 := by
  native_decide

/-- Coefficient term 382 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0382 : Poly :=
[
  term ((-2926995536123 : Rat) / 532849823604) [(10, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 382 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0382 : Poly :=
[
  term ((2926995536123 : Rat) / 266424911802) [(4, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-2926995536123 : Rat) / 532849823604) [(4, 2), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-2926995536123 : Rat) / 532849823604) [(5, 2), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-2926995536123 : Rat) / 266424911802) [(10, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((2926995536123 : Rat) / 532849823604) [(10, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((2926995536123 : Rat) / 532849823604) [(10, 1), (12, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 382 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0382_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0382
        rs_R009_ueqv_R009YNNNN_generator_05_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_05_0382 := by
  native_decide

/-- Coefficient term 383 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0383 : Poly :=
[
  term ((-55 : Rat) / 14) [(10, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 383 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0383 : Poly :=
[
  term ((55 : Rat) / 7) [(4, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-55 : Rat) / 14) [(4, 2), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-55 : Rat) / 14) [(5, 2), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-55 : Rat) / 7) [(10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((55 : Rat) / 14) [(10, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((55 : Rat) / 14) [(10, 1), (12, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 383 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0383_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0383
        rs_R009_ueqv_R009YNNNN_generator_05_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_05_0383 := by
  native_decide

/-- Coefficient term 384 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0384 : Poly :=
[
  term ((122667682763 : Rat) / 44404151967) [(10, 1), (12, 1), (15, 2)]
]

/-- Partial product 384 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0384 : Poly :=
[
  term ((-245335365526 : Rat) / 44404151967) [(4, 1), (10, 1), (12, 1), (15, 2)],
  term ((122667682763 : Rat) / 44404151967) [(4, 2), (10, 1), (12, 1), (15, 2)],
  term ((122667682763 : Rat) / 44404151967) [(5, 2), (10, 1), (12, 1), (15, 2)],
  term ((245335365526 : Rat) / 44404151967) [(10, 1), (12, 1), (14, 1), (15, 2)],
  term ((-122667682763 : Rat) / 44404151967) [(10, 1), (12, 1), (14, 2), (15, 2)],
  term ((-122667682763 : Rat) / 44404151967) [(10, 1), (12, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 384 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0384_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0384
        rs_R009_ueqv_R009YNNNN_generator_05_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_05_0384 := by
  native_decide

/-- Coefficient term 385 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0385 : Poly :=
[
  term ((24 : Rat) / 7) [(10, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 385 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0385 : Poly :=
[
  term ((-48 : Rat) / 7) [(4, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((24 : Rat) / 7) [(4, 2), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((24 : Rat) / 7) [(5, 2), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((48 : Rat) / 7) [(10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-24 : Rat) / 7) [(10, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((-24 : Rat) / 7) [(10, 1), (12, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 385 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0385_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0385
        rs_R009_ueqv_R009YNNNN_generator_05_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_05_0385 := by
  native_decide

/-- Coefficient term 386 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0386 : Poly :=
[
  term ((-27567777768901 : Rat) / 355233215736) [(10, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 386 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0386 : Poly :=
[
  term ((27567777768901 : Rat) / 177616607868) [(4, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-27567777768901 : Rat) / 355233215736) [(4, 2), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-27567777768901 : Rat) / 355233215736) [(5, 2), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((27567777768901 : Rat) / 355233215736) [(10, 1), (13, 1), (14, 1), (15, 3)],
  term ((-27567777768901 : Rat) / 177616607868) [(10, 1), (13, 1), (14, 2), (15, 1)],
  term ((27567777768901 : Rat) / 355233215736) [(10, 1), (13, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 386 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0386_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0386
        rs_R009_ueqv_R009YNNNN_generator_05_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_05_0386 := by
  native_decide

/-- Coefficient term 387 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0387 : Poly :=
[
  term ((209 : Rat) / 28) [(10, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 387 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0387 : Poly :=
[
  term ((-209 : Rat) / 14) [(4, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((209 : Rat) / 28) [(4, 2), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((209 : Rat) / 28) [(5, 2), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-209 : Rat) / 28) [(10, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((209 : Rat) / 14) [(10, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-209 : Rat) / 28) [(10, 1), (13, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 387 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0387_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0387
        rs_R009_ueqv_R009YNNNN_generator_05_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_05_0387 := by
  native_decide

/-- Coefficient term 388 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0388 : Poly :=
[
  term ((-4401433677504181 : Rat) / 12788395766496) [(10, 1), (13, 1), (15, 1)]
]

/-- Partial product 388 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0388 : Poly :=
[
  term ((4401433677504181 : Rat) / 6394197883248) [(4, 1), (10, 1), (13, 1), (15, 1)],
  term ((-4401433677504181 : Rat) / 12788395766496) [(4, 2), (10, 1), (13, 1), (15, 1)],
  term ((-4401433677504181 : Rat) / 12788395766496) [(5, 2), (10, 1), (13, 1), (15, 1)],
  term ((-4401433677504181 : Rat) / 6394197883248) [(10, 1), (13, 1), (14, 1), (15, 1)],
  term ((4401433677504181 : Rat) / 12788395766496) [(10, 1), (13, 1), (14, 2), (15, 1)],
  term ((4401433677504181 : Rat) / 12788395766496) [(10, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 388 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0388_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0388
        rs_R009_ueqv_R009YNNNN_generator_05_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_05_0388 := by
  native_decide

/-- Coefficient term 389 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0389 : Poly :=
[
  term ((-5015 : Rat) / 1008) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 389 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0389 : Poly :=
[
  term ((5015 : Rat) / 504) [(4, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5015 : Rat) / 1008) [(4, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5015 : Rat) / 1008) [(5, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5015 : Rat) / 504) [(10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((5015 : Rat) / 1008) [(10, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((5015 : Rat) / 1008) [(10, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 389 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0389_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0389
        rs_R009_ueqv_R009YNNNN_generator_05_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_05_0389 := by
  native_decide

/-- Coefficient term 390 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0390 : Poly :=
[
  term ((236617251229 : Rat) / 1065699647208) [(10, 1), (13, 2)]
]

/-- Partial product 390 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0390 : Poly :=
[
  term ((-236617251229 : Rat) / 532849823604) [(4, 1), (10, 1), (13, 2)],
  term ((236617251229 : Rat) / 1065699647208) [(4, 2), (10, 1), (13, 2)],
  term ((236617251229 : Rat) / 1065699647208) [(5, 2), (10, 1), (13, 2)],
  term ((236617251229 : Rat) / 532849823604) [(10, 1), (13, 2), (14, 1)],
  term ((-236617251229 : Rat) / 1065699647208) [(10, 1), (13, 2), (14, 2)],
  term ((-236617251229 : Rat) / 1065699647208) [(10, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 390 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0390_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0390
        rs_R009_ueqv_R009YNNNN_generator_05_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_05_0390 := by
  native_decide

/-- Coefficient term 391 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0391 : Poly :=
[
  term ((2926995536123 : Rat) / 532849823604) [(10, 1), (13, 2), (14, 1)]
]

/-- Partial product 391 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0391 : Poly :=
[
  term ((-2926995536123 : Rat) / 266424911802) [(4, 1), (10, 1), (13, 2), (14, 1)],
  term ((2926995536123 : Rat) / 532849823604) [(4, 2), (10, 1), (13, 2), (14, 1)],
  term ((2926995536123 : Rat) / 532849823604) [(5, 2), (10, 1), (13, 2), (14, 1)],
  term ((-2926995536123 : Rat) / 532849823604) [(10, 1), (13, 2), (14, 1), (15, 2)],
  term ((2926995536123 : Rat) / 266424911802) [(10, 1), (13, 2), (14, 2)],
  term ((-2926995536123 : Rat) / 532849823604) [(10, 1), (13, 2), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 391 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0391_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0391
        rs_R009_ueqv_R009YNNNN_generator_05_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_05_0391 := by
  native_decide

/-- Coefficient term 392 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0392 : Poly :=
[
  term ((55 : Rat) / 14) [(10, 1), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 392 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0392 : Poly :=
[
  term ((-55 : Rat) / 7) [(4, 1), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((55 : Rat) / 14) [(4, 2), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((55 : Rat) / 14) [(5, 2), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((-55 : Rat) / 14) [(10, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((55 : Rat) / 7) [(10, 1), (13, 2), (14, 2), (16, 1)],
  term ((-55 : Rat) / 14) [(10, 1), (13, 2), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 392 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0392_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0392
        rs_R009_ueqv_R009YNNNN_generator_05_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_05_0392 := by
  native_decide

/-- Coefficient term 393 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0393 : Poly :=
[
  term ((-365 : Rat) / 84) [(10, 1), (13, 2), (16, 1)]
]

/-- Partial product 393 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0393 : Poly :=
[
  term ((365 : Rat) / 42) [(4, 1), (10, 1), (13, 2), (16, 1)],
  term ((-365 : Rat) / 84) [(4, 2), (10, 1), (13, 2), (16, 1)],
  term ((-365 : Rat) / 84) [(5, 2), (10, 1), (13, 2), (16, 1)],
  term ((-365 : Rat) / 42) [(10, 1), (13, 2), (14, 1), (16, 1)],
  term ((365 : Rat) / 84) [(10, 1), (13, 2), (14, 2), (16, 1)],
  term ((365 : Rat) / 84) [(10, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 393 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0393_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0393
        rs_R009_ueqv_R009YNNNN_generator_05_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_05_0393 := by
  native_decide

/-- Coefficient term 394 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0394 : Poly :=
[
  term ((-48535455874683739 : Rat) / 69625710284256) [(10, 1), (14, 1)]
]

/-- Partial product 394 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0394 : Poly :=
[
  term ((48535455874683739 : Rat) / 34812855142128) [(4, 1), (10, 1), (14, 1)],
  term ((-48535455874683739 : Rat) / 69625710284256) [(4, 2), (10, 1), (14, 1)],
  term ((-48535455874683739 : Rat) / 69625710284256) [(5, 2), (10, 1), (14, 1)],
  term ((48535455874683739 : Rat) / 69625710284256) [(10, 1), (14, 1), (15, 2)],
  term ((-48535455874683739 : Rat) / 34812855142128) [(10, 1), (14, 2)],
  term ((48535455874683739 : Rat) / 69625710284256) [(10, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 394 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0394_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0394
        rs_R009_ueqv_R009YNNNN_generator_05_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_05_0394 := by
  native_decide

/-- Coefficient term 395 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0395 : Poly :=
[
  term ((3366906314273 : Rat) / 29602767978) [(10, 1), (14, 1), (15, 2)]
]

/-- Partial product 395 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0395 : Poly :=
[
  term ((-3366906314273 : Rat) / 14801383989) [(4, 1), (10, 1), (14, 1), (15, 2)],
  term ((3366906314273 : Rat) / 29602767978) [(4, 2), (10, 1), (14, 1), (15, 2)],
  term ((3366906314273 : Rat) / 29602767978) [(5, 2), (10, 1), (14, 1), (15, 2)],
  term ((-3366906314273 : Rat) / 29602767978) [(10, 1), (14, 1), (15, 4)],
  term ((3366906314273 : Rat) / 14801383989) [(10, 1), (14, 2), (15, 2)],
  term ((-3366906314273 : Rat) / 29602767978) [(10, 1), (14, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 395 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0395_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0395
        rs_R009_ueqv_R009YNNNN_generator_05_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_05_0395 := by
  native_decide

/-- Coefficient term 396 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0396 : Poly :=
[
  term ((-65 : Rat) / 7) [(10, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 396 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0396 : Poly :=
[
  term ((130 : Rat) / 7) [(4, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-65 : Rat) / 7) [(4, 2), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-65 : Rat) / 7) [(5, 2), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((65 : Rat) / 7) [(10, 1), (14, 1), (15, 4), (16, 1)],
  term ((-130 : Rat) / 7) [(10, 1), (14, 2), (15, 2), (16, 1)],
  term ((65 : Rat) / 7) [(10, 1), (14, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 396 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0396_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0396
        rs_R009_ueqv_R009YNNNN_generator_05_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_05_0396 := by
  native_decide

/-- Coefficient term 397 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0397 : Poly :=
[
  term ((7183625070497 : Rat) / 73444842072) [(10, 1), (14, 2)]
]

/-- Partial product 397 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0397 : Poly :=
[
  term ((-7183625070497 : Rat) / 36722421036) [(4, 1), (10, 1), (14, 2)],
  term ((7183625070497 : Rat) / 73444842072) [(4, 2), (10, 1), (14, 2)],
  term ((7183625070497 : Rat) / 73444842072) [(5, 2), (10, 1), (14, 2)],
  term ((-7183625070497 : Rat) / 73444842072) [(10, 1), (14, 2), (15, 2)],
  term ((7183625070497 : Rat) / 36722421036) [(10, 1), (14, 3)],
  term ((-7183625070497 : Rat) / 73444842072) [(10, 1), (14, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 397 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0397_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0397
        rs_R009_ueqv_R009YNNNN_generator_05_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_05_0397 := by
  native_decide

/-- Coefficient term 398 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0398 : Poly :=
[
  term ((6935202247883849 : Rat) / 52219282713192) [(10, 1), (15, 2)]
]

/-- Partial product 398 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0398 : Poly :=
[
  term ((-6935202247883849 : Rat) / 26109641356596) [(4, 1), (10, 1), (15, 2)],
  term ((6935202247883849 : Rat) / 52219282713192) [(4, 2), (10, 1), (15, 2)],
  term ((6935202247883849 : Rat) / 52219282713192) [(5, 2), (10, 1), (15, 2)],
  term ((6935202247883849 : Rat) / 26109641356596) [(10, 1), (14, 1), (15, 2)],
  term ((-6935202247883849 : Rat) / 52219282713192) [(10, 1), (14, 2), (15, 2)],
  term ((-6935202247883849 : Rat) / 52219282713192) [(10, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 398 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0398_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0398
        rs_R009_ueqv_R009YNNNN_generator_05_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_05_0398 := by
  native_decide

/-- Coefficient term 399 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0399 : Poly :=
[
  term ((2099 : Rat) / 252) [(10, 1), (15, 2), (16, 1)]
]

/-- Partial product 399 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0399 : Poly :=
[
  term ((-2099 : Rat) / 126) [(4, 1), (10, 1), (15, 2), (16, 1)],
  term ((2099 : Rat) / 252) [(4, 2), (10, 1), (15, 2), (16, 1)],
  term ((2099 : Rat) / 252) [(5, 2), (10, 1), (15, 2), (16, 1)],
  term ((2099 : Rat) / 126) [(10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2099 : Rat) / 252) [(10, 1), (14, 2), (15, 2), (16, 1)],
  term ((-2099 : Rat) / 252) [(10, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 399 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0399_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0399
        rs_R009_ueqv_R009YNNNN_generator_05_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_05_0399 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009YNNNN_partials_05_0300_0399 : List Poly :=
[
  rs_R009_ueqv_R009YNNNN_partial_05_0300,
  rs_R009_ueqv_R009YNNNN_partial_05_0301,
  rs_R009_ueqv_R009YNNNN_partial_05_0302,
  rs_R009_ueqv_R009YNNNN_partial_05_0303,
  rs_R009_ueqv_R009YNNNN_partial_05_0304,
  rs_R009_ueqv_R009YNNNN_partial_05_0305,
  rs_R009_ueqv_R009YNNNN_partial_05_0306,
  rs_R009_ueqv_R009YNNNN_partial_05_0307,
  rs_R009_ueqv_R009YNNNN_partial_05_0308,
  rs_R009_ueqv_R009YNNNN_partial_05_0309,
  rs_R009_ueqv_R009YNNNN_partial_05_0310,
  rs_R009_ueqv_R009YNNNN_partial_05_0311,
  rs_R009_ueqv_R009YNNNN_partial_05_0312,
  rs_R009_ueqv_R009YNNNN_partial_05_0313,
  rs_R009_ueqv_R009YNNNN_partial_05_0314,
  rs_R009_ueqv_R009YNNNN_partial_05_0315,
  rs_R009_ueqv_R009YNNNN_partial_05_0316,
  rs_R009_ueqv_R009YNNNN_partial_05_0317,
  rs_R009_ueqv_R009YNNNN_partial_05_0318,
  rs_R009_ueqv_R009YNNNN_partial_05_0319,
  rs_R009_ueqv_R009YNNNN_partial_05_0320,
  rs_R009_ueqv_R009YNNNN_partial_05_0321,
  rs_R009_ueqv_R009YNNNN_partial_05_0322,
  rs_R009_ueqv_R009YNNNN_partial_05_0323,
  rs_R009_ueqv_R009YNNNN_partial_05_0324,
  rs_R009_ueqv_R009YNNNN_partial_05_0325,
  rs_R009_ueqv_R009YNNNN_partial_05_0326,
  rs_R009_ueqv_R009YNNNN_partial_05_0327,
  rs_R009_ueqv_R009YNNNN_partial_05_0328,
  rs_R009_ueqv_R009YNNNN_partial_05_0329,
  rs_R009_ueqv_R009YNNNN_partial_05_0330,
  rs_R009_ueqv_R009YNNNN_partial_05_0331,
  rs_R009_ueqv_R009YNNNN_partial_05_0332,
  rs_R009_ueqv_R009YNNNN_partial_05_0333,
  rs_R009_ueqv_R009YNNNN_partial_05_0334,
  rs_R009_ueqv_R009YNNNN_partial_05_0335,
  rs_R009_ueqv_R009YNNNN_partial_05_0336,
  rs_R009_ueqv_R009YNNNN_partial_05_0337,
  rs_R009_ueqv_R009YNNNN_partial_05_0338,
  rs_R009_ueqv_R009YNNNN_partial_05_0339,
  rs_R009_ueqv_R009YNNNN_partial_05_0340,
  rs_R009_ueqv_R009YNNNN_partial_05_0341,
  rs_R009_ueqv_R009YNNNN_partial_05_0342,
  rs_R009_ueqv_R009YNNNN_partial_05_0343,
  rs_R009_ueqv_R009YNNNN_partial_05_0344,
  rs_R009_ueqv_R009YNNNN_partial_05_0345,
  rs_R009_ueqv_R009YNNNN_partial_05_0346,
  rs_R009_ueqv_R009YNNNN_partial_05_0347,
  rs_R009_ueqv_R009YNNNN_partial_05_0348,
  rs_R009_ueqv_R009YNNNN_partial_05_0349,
  rs_R009_ueqv_R009YNNNN_partial_05_0350,
  rs_R009_ueqv_R009YNNNN_partial_05_0351,
  rs_R009_ueqv_R009YNNNN_partial_05_0352,
  rs_R009_ueqv_R009YNNNN_partial_05_0353,
  rs_R009_ueqv_R009YNNNN_partial_05_0354,
  rs_R009_ueqv_R009YNNNN_partial_05_0355,
  rs_R009_ueqv_R009YNNNN_partial_05_0356,
  rs_R009_ueqv_R009YNNNN_partial_05_0357,
  rs_R009_ueqv_R009YNNNN_partial_05_0358,
  rs_R009_ueqv_R009YNNNN_partial_05_0359,
  rs_R009_ueqv_R009YNNNN_partial_05_0360,
  rs_R009_ueqv_R009YNNNN_partial_05_0361,
  rs_R009_ueqv_R009YNNNN_partial_05_0362,
  rs_R009_ueqv_R009YNNNN_partial_05_0363,
  rs_R009_ueqv_R009YNNNN_partial_05_0364,
  rs_R009_ueqv_R009YNNNN_partial_05_0365,
  rs_R009_ueqv_R009YNNNN_partial_05_0366,
  rs_R009_ueqv_R009YNNNN_partial_05_0367,
  rs_R009_ueqv_R009YNNNN_partial_05_0368,
  rs_R009_ueqv_R009YNNNN_partial_05_0369,
  rs_R009_ueqv_R009YNNNN_partial_05_0370,
  rs_R009_ueqv_R009YNNNN_partial_05_0371,
  rs_R009_ueqv_R009YNNNN_partial_05_0372,
  rs_R009_ueqv_R009YNNNN_partial_05_0373,
  rs_R009_ueqv_R009YNNNN_partial_05_0374,
  rs_R009_ueqv_R009YNNNN_partial_05_0375,
  rs_R009_ueqv_R009YNNNN_partial_05_0376,
  rs_R009_ueqv_R009YNNNN_partial_05_0377,
  rs_R009_ueqv_R009YNNNN_partial_05_0378,
  rs_R009_ueqv_R009YNNNN_partial_05_0379,
  rs_R009_ueqv_R009YNNNN_partial_05_0380,
  rs_R009_ueqv_R009YNNNN_partial_05_0381,
  rs_R009_ueqv_R009YNNNN_partial_05_0382,
  rs_R009_ueqv_R009YNNNN_partial_05_0383,
  rs_R009_ueqv_R009YNNNN_partial_05_0384,
  rs_R009_ueqv_R009YNNNN_partial_05_0385,
  rs_R009_ueqv_R009YNNNN_partial_05_0386,
  rs_R009_ueqv_R009YNNNN_partial_05_0387,
  rs_R009_ueqv_R009YNNNN_partial_05_0388,
  rs_R009_ueqv_R009YNNNN_partial_05_0389,
  rs_R009_ueqv_R009YNNNN_partial_05_0390,
  rs_R009_ueqv_R009YNNNN_partial_05_0391,
  rs_R009_ueqv_R009YNNNN_partial_05_0392,
  rs_R009_ueqv_R009YNNNN_partial_05_0393,
  rs_R009_ueqv_R009YNNNN_partial_05_0394,
  rs_R009_ueqv_R009YNNNN_partial_05_0395,
  rs_R009_ueqv_R009YNNNN_partial_05_0396,
  rs_R009_ueqv_R009YNNNN_partial_05_0397,
  rs_R009_ueqv_R009YNNNN_partial_05_0398,
  rs_R009_ueqv_R009YNNNN_partial_05_0399
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009YNNNN_block_05_0300_0399 : Poly :=
[
  term ((2224986028928059 : Rat) / 1598549470812) [(4, 1), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((-1495 : Rat) / 126) [(4, 1), (7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((725 : Rat) / 84) [(4, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-150142660556857 : Rat) / 165250894662) [(4, 1), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((494 : Rat) / 63) [(4, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(4, 1), (7, 1), (12, 1), (14, 2), (15, 1)],
  term ((-148780745730977 : Rat) / 2901071261844) [(4, 1), (7, 1), (12, 1), (15, 1)],
  term ((-157 : Rat) / 21) [(4, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((206820899571954011 : Rat) / 156657848139576) [(4, 1), (7, 1), (13, 1)],
  term ((-9616667667025831 : Rat) / 2901071261844) [(4, 1), (7, 1), (13, 1), (14, 1)],
  term ((1495 : Rat) / 42) [(4, 1), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(4, 1), (7, 1), (13, 1), (14, 2)],
  term ((-5165 : Rat) / 252) [(4, 1), (7, 1), (13, 1), (16, 1)],
  term ((15082361810461453 : Rat) / 4351606892766) [(4, 1), (7, 1), (14, 1), (15, 1)],
  term ((-494 : Rat) / 21) [(4, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-9193198696854 : Rat) / 26861770943) [(4, 1), (7, 1), (14, 2), (15, 1)],
  term ((-14705001849908465 : Rat) / 8703213785532) [(4, 1), (7, 1), (15, 1)],
  term ((965 : Rat) / 63) [(4, 1), (7, 1), (15, 1), (16, 1)],
  term ((22724054978840279 : Rat) / 13054820678298) [(4, 1), (7, 2)],
  term ((2600143031426873 : Rat) / 6527410339149) [(4, 1), (7, 2), (10, 1)],
  term ((1532199782809 : Rat) / 161170625658) [(4, 1), (7, 2), (12, 1)],
  term ((4349915183394751 : Rat) / 6527410339149) [(4, 1), (7, 2), (12, 1), (14, 1)],
  term ((-4349915183394751 : Rat) / 2175803446383) [(4, 1), (7, 2), (14, 1)],
  term ((-9792711872593 : Rat) / 13156785768) [(4, 1), (9, 1), (10, 1), (11, 1)],
  term ((9984 : Rat) / 553) [(4, 1), (9, 1), (10, 1), (11, 1), (12, 1)],
  term ((59904 : Rat) / 553) [(4, 1), (9, 1), (10, 1), (11, 1), (14, 1)],
  term ((-6090608323475 : Rat) / 266424911802) [(4, 1), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((5 : Rat) / 3) [(4, 1), (9, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((30188368622915 : Rat) / 177616607868) [(4, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-32 : Rat) / 21) [(4, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1048432325617 : Rat) / 266424911802) [(4, 1), (9, 1), (10, 1), (13, 1)],
  term ((8926828802611 : Rat) / 266424911802) [(4, 1), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((55 : Rat) / 14) [(4, 1), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1375 : Rat) / 84) [(4, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-170525183774905 : Rat) / 355233215736) [(4, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-22 : Rat) / 7) [(4, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-8379467626016089 : Rat) / 12788395766496) [(4, 1), (9, 1), (10, 1), (15, 1)],
  term ((43 : Rat) / 3) [(4, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-2646018989102969 : Rat) / 4262798588832) [(4, 1), (9, 1), (11, 1)],
  term ((-33225805736000 : Rat) / 133212455901) [(4, 1), (9, 1), (11, 1), (12, 1)],
  term ((-14792437532950093 : Rat) / 12788395766496) [(4, 1), (9, 1), (11, 1), (14, 1)],
  term ((119808 : Rat) / 553) [(4, 1), (9, 1), (11, 1), (14, 2)],
  term ((-9008294618453 : Rat) / 118411071912) [(4, 1), (9, 1), (11, 1), (15, 2)],
  term ((97923607474811 : Rat) / 532849823604) [(4, 1), (9, 1), (12, 1), (13, 1)],
  term ((-475 : Rat) / 42) [(4, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((2172201733 : Rat) / 333083184) [(4, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-10110568816218515 : Rat) / 69625710284256) [(4, 1), (9, 1), (12, 1), (15, 1)],
  term ((64 : Rat) / 7) [(4, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-521450111883941 : Rat) / 4262798588832) [(4, 1), (9, 1), (13, 1)],
  term ((-15738021822006055 : Rat) / 12788395766496) [(4, 1), (9, 1), (13, 1), (14, 1)],
  term ((-1105 : Rat) / 42) [(4, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-6422908767787 : Rat) / 78940714608) [(4, 1), (9, 1), (13, 1), (14, 2)],
  term ((305 : Rat) / 28) [(4, 1), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((2954048478533 : Rat) / 39470357304) [(4, 1), (9, 1), (13, 1), (15, 2)],
  term ((-305 : Rat) / 28) [(4, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((745 : Rat) / 168) [(4, 1), (9, 1), (13, 1), (16, 1)],
  term ((-215402746805062 : Rat) / 725267815461) [(4, 1), (9, 1), (14, 1), (15, 1)],
  term ((454 : Rat) / 21) [(4, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((3366906314273 : Rat) / 29602767978) [(4, 1), (9, 1), (14, 2), (15, 1)],
  term ((-65 : Rat) / 7) [(4, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((539299417941477509 : Rat) / 313315696279152) [(4, 1), (9, 1), (15, 1)],
  term ((-241 : Rat) / 42) [(4, 1), (9, 1), (15, 1), (16, 1)],
  term ((-3366906314273 : Rat) / 29602767978) [(4, 1), (9, 1), (15, 3)],
  term ((65 : Rat) / 7) [(4, 1), (9, 1), (15, 3), (16, 1)],
  term ((79857096087821 : Rat) / 202990408992) [(4, 1), (9, 2)],
  term ((158570726509 : Rat) / 8993245968) [(4, 1), (9, 2), (10, 1)],
  term ((67338253723 : Rat) / 2248311492) [(4, 1), (9, 2), (10, 1), (12, 1)],
  term ((-2172201733 : Rat) / 166541592) [(4, 1), (9, 2), (10, 1), (14, 1)],
  term ((-997316410233 : Rat) / 4385595256) [(4, 1), (9, 2), (12, 1)],
  term ((-8129680847544803 : Rat) / 17406427571064) [(4, 1), (9, 2), (14, 1)],
  term ((210703568101 : Rat) / 2997748656) [(4, 1), (9, 2), (14, 2)],
  term ((-210703568101 : Rat) / 2997748656) [(4, 1), (9, 2), (15, 2)],
  term ((63064 : Rat) / 1659) [(4, 1), (10, 1)],
  term ((149760 : Rat) / 553) [(4, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((32582181535333 : Rat) / 59205535956) [(4, 1), (10, 1), (11, 1), (13, 1)],
  term ((-149760 : Rat) / 553) [(4, 1), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((165 : Rat) / 14) [(4, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-239616 : Rat) / 553) [(4, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-9718604754760376 : Rat) / 6527410339149) [(4, 1), (10, 1), (11, 1), (15, 1)],
  term ((-74 : Rat) / 7) [(4, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((239616 : Rat) / 553) [(4, 1), (10, 1), (11, 2)],
  term ((80 : Rat) / 21) [(4, 1), (10, 1), (12, 1)],
  term ((2926995536123 : Rat) / 266424911802) [(4, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((55 : Rat) / 7) [(4, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-245335365526 : Rat) / 44404151967) [(4, 1), (10, 1), (12, 1), (15, 2)],
  term ((-48 : Rat) / 7) [(4, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((27567777768901 : Rat) / 177616607868) [(4, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-209 : Rat) / 14) [(4, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((4401433677504181 : Rat) / 6394197883248) [(4, 1), (10, 1), (13, 1), (15, 1)],
  term ((5015 : Rat) / 504) [(4, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-236617251229 : Rat) / 532849823604) [(4, 1), (10, 1), (13, 2)],
  term ((-2926995536123 : Rat) / 266424911802) [(4, 1), (10, 1), (13, 2), (14, 1)],
  term ((-55 : Rat) / 7) [(4, 1), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((365 : Rat) / 42) [(4, 1), (10, 1), (13, 2), (16, 1)],
  term ((48535455874683739 : Rat) / 34812855142128) [(4, 1), (10, 1), (14, 1)],
  term ((-3366906314273 : Rat) / 14801383989) [(4, 1), (10, 1), (14, 1), (15, 2)],
  term ((130 : Rat) / 7) [(4, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-7183625070497 : Rat) / 36722421036) [(4, 1), (10, 1), (14, 2)],
  term ((-6935202247883849 : Rat) / 26109641356596) [(4, 1), (10, 1), (15, 2)],
  term ((-2099 : Rat) / 126) [(4, 1), (10, 1), (15, 2), (16, 1)],
  term ((-2224986028928059 : Rat) / 3197098941624) [(4, 2), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((1495 : Rat) / 252) [(4, 2), (7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-725 : Rat) / 168) [(4, 2), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((150142660556857 : Rat) / 330501789324) [(4, 2), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((-247 : Rat) / 63) [(4, 2), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(4, 2), (7, 1), (12, 1), (14, 2), (15, 1)],
  term ((148780745730977 : Rat) / 5802142523688) [(4, 2), (7, 1), (12, 1), (15, 1)],
  term ((157 : Rat) / 42) [(4, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-206820899571954011 : Rat) / 313315696279152) [(4, 2), (7, 1), (13, 1)],
  term ((9616667667025831 : Rat) / 5802142523688) [(4, 2), (7, 1), (13, 1), (14, 1)],
  term ((-1495 : Rat) / 84) [(4, 2), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((1532199782809 : Rat) / 53723541886) [(4, 2), (7, 1), (13, 1), (14, 2)],
  term ((5165 : Rat) / 504) [(4, 2), (7, 1), (13, 1), (16, 1)],
  term ((-15082361810461453 : Rat) / 8703213785532) [(4, 2), (7, 1), (14, 1), (15, 1)],
  term ((247 : Rat) / 21) [(4, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((4596599348427 : Rat) / 26861770943) [(4, 2), (7, 1), (14, 2), (15, 1)],
  term ((14705001849908465 : Rat) / 17406427571064) [(4, 2), (7, 1), (15, 1)],
  term ((-965 : Rat) / 126) [(4, 2), (7, 1), (15, 1), (16, 1)],
  term ((-22724054978840279 : Rat) / 26109641356596) [(4, 2), (7, 2)],
  term ((-2600143031426873 : Rat) / 13054820678298) [(4, 2), (7, 2), (10, 1)],
  term ((-1532199782809 : Rat) / 322341251316) [(4, 2), (7, 2), (12, 1)],
  term ((-4349915183394751 : Rat) / 13054820678298) [(4, 2), (7, 2), (12, 1), (14, 1)],
  term ((4349915183394751 : Rat) / 4351606892766) [(4, 2), (7, 2), (14, 1)],
  term ((9792711872593 : Rat) / 26313571536) [(4, 2), (9, 1), (10, 1), (11, 1)],
  term ((-4992 : Rat) / 553) [(4, 2), (9, 1), (10, 1), (11, 1), (12, 1)],
  term ((-29952 : Rat) / 553) [(4, 2), (9, 1), (10, 1), (11, 1), (14, 1)],
  term ((6090608323475 : Rat) / 532849823604) [(4, 2), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((-5 : Rat) / 6) [(4, 2), (9, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-30188368622915 : Rat) / 355233215736) [(4, 2), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((16 : Rat) / 21) [(4, 2), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((1048432325617 : Rat) / 532849823604) [(4, 2), (9, 1), (10, 1), (13, 1)],
  term ((-8926828802611 : Rat) / 532849823604) [(4, 2), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((-55 : Rat) / 28) [(4, 2), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((1375 : Rat) / 168) [(4, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((170525183774905 : Rat) / 710466431472) [(4, 2), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((11 : Rat) / 7) [(4, 2), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((8379467626016089 : Rat) / 25576791532992) [(4, 2), (9, 1), (10, 1), (15, 1)],
  term ((-43 : Rat) / 6) [(4, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((2646018989102969 : Rat) / 8525597177664) [(4, 2), (9, 1), (11, 1)],
  term ((16612902868000 : Rat) / 133212455901) [(4, 2), (9, 1), (11, 1), (12, 1)],
  term ((14792437532950093 : Rat) / 25576791532992) [(4, 2), (9, 1), (11, 1), (14, 1)],
  term ((-59904 : Rat) / 553) [(4, 2), (9, 1), (11, 1), (14, 2)],
  term ((9008294618453 : Rat) / 236822143824) [(4, 2), (9, 1), (11, 1), (15, 2)],
  term ((-97923607474811 : Rat) / 1065699647208) [(4, 2), (9, 1), (12, 1), (13, 1)],
  term ((475 : Rat) / 84) [(4, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-2172201733 : Rat) / 666166368) [(4, 2), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((10110568816218515 : Rat) / 139251420568512) [(4, 2), (9, 1), (12, 1), (15, 1)],
  term ((-32 : Rat) / 7) [(4, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((521450111883941 : Rat) / 8525597177664) [(4, 2), (9, 1), (13, 1)],
  term ((15738021822006055 : Rat) / 25576791532992) [(4, 2), (9, 1), (13, 1), (14, 1)],
  term ((1105 : Rat) / 84) [(4, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((6422908767787 : Rat) / 157881429216) [(4, 2), (9, 1), (13, 1), (14, 2)],
  term ((-305 : Rat) / 56) [(4, 2), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((-2954048478533 : Rat) / 78940714608) [(4, 2), (9, 1), (13, 1), (15, 2)],
  term ((305 : Rat) / 56) [(4, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-745 : Rat) / 336) [(4, 2), (9, 1), (13, 1), (16, 1)],
  term ((107701373402531 : Rat) / 725267815461) [(4, 2), (9, 1), (14, 1), (15, 1)],
  term ((-227 : Rat) / 21) [(4, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3366906314273 : Rat) / 59205535956) [(4, 2), (9, 1), (14, 2), (15, 1)],
  term ((65 : Rat) / 14) [(4, 2), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-539299417941477509 : Rat) / 626631392558304) [(4, 2), (9, 1), (15, 1)],
  term ((241 : Rat) / 84) [(4, 2), (9, 1), (15, 1), (16, 1)],
  term ((3366906314273 : Rat) / 59205535956) [(4, 2), (9, 1), (15, 3)],
  term ((-65 : Rat) / 14) [(4, 2), (9, 1), (15, 3), (16, 1)],
  term ((-79857096087821 : Rat) / 405980817984) [(4, 2), (9, 2)],
  term ((-158570726509 : Rat) / 17986491936) [(4, 2), (9, 2), (10, 1)],
  term ((-67338253723 : Rat) / 4496622984) [(4, 2), (9, 2), (10, 1), (12, 1)],
  term ((2172201733 : Rat) / 333083184) [(4, 2), (9, 2), (10, 1), (14, 1)],
  term ((997316410233 : Rat) / 8771190512) [(4, 2), (9, 2), (12, 1)],
  term ((8129680847544803 : Rat) / 34812855142128) [(4, 2), (9, 2), (14, 1)],
  term ((-210703568101 : Rat) / 5995497312) [(4, 2), (9, 2), (14, 2)],
  term ((210703568101 : Rat) / 5995497312) [(4, 2), (9, 2), (15, 2)],
  term ((-31532 : Rat) / 1659) [(4, 2), (10, 1)],
  term ((-74880 : Rat) / 553) [(4, 2), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-32582181535333 : Rat) / 118411071912) [(4, 2), (10, 1), (11, 1), (13, 1)],
  term ((74880 : Rat) / 553) [(4, 2), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((-165 : Rat) / 28) [(4, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((119808 : Rat) / 553) [(4, 2), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((4859302377380188 : Rat) / 6527410339149) [(4, 2), (10, 1), (11, 1), (15, 1)],
  term ((37 : Rat) / 7) [(4, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-119808 : Rat) / 553) [(4, 2), (10, 1), (11, 2)],
  term ((-40 : Rat) / 21) [(4, 2), (10, 1), (12, 1)],
  term ((-2926995536123 : Rat) / 532849823604) [(4, 2), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-55 : Rat) / 14) [(4, 2), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((122667682763 : Rat) / 44404151967) [(4, 2), (10, 1), (12, 1), (15, 2)],
  term ((24 : Rat) / 7) [(4, 2), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-27567777768901 : Rat) / 355233215736) [(4, 2), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((209 : Rat) / 28) [(4, 2), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4401433677504181 : Rat) / 12788395766496) [(4, 2), (10, 1), (13, 1), (15, 1)],
  term ((-5015 : Rat) / 1008) [(4, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((236617251229 : Rat) / 1065699647208) [(4, 2), (10, 1), (13, 2)],
  term ((2926995536123 : Rat) / 532849823604) [(4, 2), (10, 1), (13, 2), (14, 1)],
  term ((55 : Rat) / 14) [(4, 2), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((-365 : Rat) / 84) [(4, 2), (10, 1), (13, 2), (16, 1)],
  term ((-48535455874683739 : Rat) / 69625710284256) [(4, 2), (10, 1), (14, 1)],
  term ((3366906314273 : Rat) / 29602767978) [(4, 2), (10, 1), (14, 1), (15, 2)],
  term ((-65 : Rat) / 7) [(4, 2), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((7183625070497 : Rat) / 73444842072) [(4, 2), (10, 1), (14, 2)],
  term ((6935202247883849 : Rat) / 52219282713192) [(4, 2), (10, 1), (15, 2)],
  term ((2099 : Rat) / 252) [(4, 2), (10, 1), (15, 2), (16, 1)],
  term ((-2224986028928059 : Rat) / 3197098941624) [(5, 2), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((1495 : Rat) / 252) [(5, 2), (7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-725 : Rat) / 168) [(5, 2), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((150142660556857 : Rat) / 330501789324) [(5, 2), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((-247 : Rat) / 63) [(5, 2), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(5, 2), (7, 1), (12, 1), (14, 2), (15, 1)],
  term ((148780745730977 : Rat) / 5802142523688) [(5, 2), (7, 1), (12, 1), (15, 1)],
  term ((157 : Rat) / 42) [(5, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-206820899571954011 : Rat) / 313315696279152) [(5, 2), (7, 1), (13, 1)],
  term ((9616667667025831 : Rat) / 5802142523688) [(5, 2), (7, 1), (13, 1), (14, 1)],
  term ((-1495 : Rat) / 84) [(5, 2), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((1532199782809 : Rat) / 53723541886) [(5, 2), (7, 1), (13, 1), (14, 2)],
  term ((5165 : Rat) / 504) [(5, 2), (7, 1), (13, 1), (16, 1)],
  term ((-15082361810461453 : Rat) / 8703213785532) [(5, 2), (7, 1), (14, 1), (15, 1)],
  term ((247 : Rat) / 21) [(5, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((4596599348427 : Rat) / 26861770943) [(5, 2), (7, 1), (14, 2), (15, 1)],
  term ((14705001849908465 : Rat) / 17406427571064) [(5, 2), (7, 1), (15, 1)],
  term ((-965 : Rat) / 126) [(5, 2), (7, 1), (15, 1), (16, 1)],
  term ((-22724054978840279 : Rat) / 26109641356596) [(5, 2), (7, 2)],
  term ((-2600143031426873 : Rat) / 13054820678298) [(5, 2), (7, 2), (10, 1)],
  term ((-1532199782809 : Rat) / 322341251316) [(5, 2), (7, 2), (12, 1)],
  term ((-4349915183394751 : Rat) / 13054820678298) [(5, 2), (7, 2), (12, 1), (14, 1)],
  term ((4349915183394751 : Rat) / 4351606892766) [(5, 2), (7, 2), (14, 1)],
  term ((9792711872593 : Rat) / 26313571536) [(5, 2), (9, 1), (10, 1), (11, 1)],
  term ((-4992 : Rat) / 553) [(5, 2), (9, 1), (10, 1), (11, 1), (12, 1)],
  term ((-29952 : Rat) / 553) [(5, 2), (9, 1), (10, 1), (11, 1), (14, 1)],
  term ((6090608323475 : Rat) / 532849823604) [(5, 2), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((-5 : Rat) / 6) [(5, 2), (9, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-30188368622915 : Rat) / 355233215736) [(5, 2), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((16 : Rat) / 21) [(5, 2), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((1048432325617 : Rat) / 532849823604) [(5, 2), (9, 1), (10, 1), (13, 1)],
  term ((-8926828802611 : Rat) / 532849823604) [(5, 2), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((-55 : Rat) / 28) [(5, 2), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((1375 : Rat) / 168) [(5, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((170525183774905 : Rat) / 710466431472) [(5, 2), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((11 : Rat) / 7) [(5, 2), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((8379467626016089 : Rat) / 25576791532992) [(5, 2), (9, 1), (10, 1), (15, 1)],
  term ((-43 : Rat) / 6) [(5, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((2646018989102969 : Rat) / 8525597177664) [(5, 2), (9, 1), (11, 1)],
  term ((16612902868000 : Rat) / 133212455901) [(5, 2), (9, 1), (11, 1), (12, 1)],
  term ((14792437532950093 : Rat) / 25576791532992) [(5, 2), (9, 1), (11, 1), (14, 1)],
  term ((-59904 : Rat) / 553) [(5, 2), (9, 1), (11, 1), (14, 2)],
  term ((9008294618453 : Rat) / 236822143824) [(5, 2), (9, 1), (11, 1), (15, 2)],
  term ((-97923607474811 : Rat) / 1065699647208) [(5, 2), (9, 1), (12, 1), (13, 1)],
  term ((475 : Rat) / 84) [(5, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-2172201733 : Rat) / 666166368) [(5, 2), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((10110568816218515 : Rat) / 139251420568512) [(5, 2), (9, 1), (12, 1), (15, 1)],
  term ((-32 : Rat) / 7) [(5, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((521450111883941 : Rat) / 8525597177664) [(5, 2), (9, 1), (13, 1)],
  term ((15738021822006055 : Rat) / 25576791532992) [(5, 2), (9, 1), (13, 1), (14, 1)],
  term ((1105 : Rat) / 84) [(5, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((6422908767787 : Rat) / 157881429216) [(5, 2), (9, 1), (13, 1), (14, 2)],
  term ((-305 : Rat) / 56) [(5, 2), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((-2954048478533 : Rat) / 78940714608) [(5, 2), (9, 1), (13, 1), (15, 2)],
  term ((305 : Rat) / 56) [(5, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-745 : Rat) / 336) [(5, 2), (9, 1), (13, 1), (16, 1)],
  term ((107701373402531 : Rat) / 725267815461) [(5, 2), (9, 1), (14, 1), (15, 1)],
  term ((-227 : Rat) / 21) [(5, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3366906314273 : Rat) / 59205535956) [(5, 2), (9, 1), (14, 2), (15, 1)],
  term ((65 : Rat) / 14) [(5, 2), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-539299417941477509 : Rat) / 626631392558304) [(5, 2), (9, 1), (15, 1)],
  term ((241 : Rat) / 84) [(5, 2), (9, 1), (15, 1), (16, 1)],
  term ((3366906314273 : Rat) / 59205535956) [(5, 2), (9, 1), (15, 3)],
  term ((-65 : Rat) / 14) [(5, 2), (9, 1), (15, 3), (16, 1)],
  term ((-79857096087821 : Rat) / 405980817984) [(5, 2), (9, 2)],
  term ((-158570726509 : Rat) / 17986491936) [(5, 2), (9, 2), (10, 1)],
  term ((-67338253723 : Rat) / 4496622984) [(5, 2), (9, 2), (10, 1), (12, 1)],
  term ((2172201733 : Rat) / 333083184) [(5, 2), (9, 2), (10, 1), (14, 1)],
  term ((997316410233 : Rat) / 8771190512) [(5, 2), (9, 2), (12, 1)],
  term ((8129680847544803 : Rat) / 34812855142128) [(5, 2), (9, 2), (14, 1)],
  term ((-210703568101 : Rat) / 5995497312) [(5, 2), (9, 2), (14, 2)],
  term ((210703568101 : Rat) / 5995497312) [(5, 2), (9, 2), (15, 2)],
  term ((-31532 : Rat) / 1659) [(5, 2), (10, 1)],
  term ((-74880 : Rat) / 553) [(5, 2), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-32582181535333 : Rat) / 118411071912) [(5, 2), (10, 1), (11, 1), (13, 1)],
  term ((74880 : Rat) / 553) [(5, 2), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((-165 : Rat) / 28) [(5, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((119808 : Rat) / 553) [(5, 2), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((4859302377380188 : Rat) / 6527410339149) [(5, 2), (10, 1), (11, 1), (15, 1)],
  term ((37 : Rat) / 7) [(5, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-119808 : Rat) / 553) [(5, 2), (10, 1), (11, 2)],
  term ((-40 : Rat) / 21) [(5, 2), (10, 1), (12, 1)],
  term ((-2926995536123 : Rat) / 532849823604) [(5, 2), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-55 : Rat) / 14) [(5, 2), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((122667682763 : Rat) / 44404151967) [(5, 2), (10, 1), (12, 1), (15, 2)],
  term ((24 : Rat) / 7) [(5, 2), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-27567777768901 : Rat) / 355233215736) [(5, 2), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((209 : Rat) / 28) [(5, 2), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4401433677504181 : Rat) / 12788395766496) [(5, 2), (10, 1), (13, 1), (15, 1)],
  term ((-5015 : Rat) / 1008) [(5, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((236617251229 : Rat) / 1065699647208) [(5, 2), (10, 1), (13, 2)],
  term ((2926995536123 : Rat) / 532849823604) [(5, 2), (10, 1), (13, 2), (14, 1)],
  term ((55 : Rat) / 14) [(5, 2), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((-365 : Rat) / 84) [(5, 2), (10, 1), (13, 2), (16, 1)],
  term ((-48535455874683739 : Rat) / 69625710284256) [(5, 2), (10, 1), (14, 1)],
  term ((3366906314273 : Rat) / 29602767978) [(5, 2), (10, 1), (14, 1), (15, 2)],
  term ((-65 : Rat) / 7) [(5, 2), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((7183625070497 : Rat) / 73444842072) [(5, 2), (10, 1), (14, 2)],
  term ((6935202247883849 : Rat) / 52219282713192) [(5, 2), (10, 1), (15, 2)],
  term ((2099 : Rat) / 252) [(5, 2), (10, 1), (15, 2), (16, 1)],
  term ((2224986028928059 : Rat) / 3197098941624) [(7, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((-1495 : Rat) / 252) [(7, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-725 : Rat) / 84) [(7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2224986028928059 : Rat) / 1598549470812) [(7, 1), (12, 1), (13, 1), (14, 2)],
  term ((1165 : Rat) / 72) [(7, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((2224986028928059 : Rat) / 3197098941624) [(7, 1), (12, 1), (13, 1), (14, 3)],
  term ((-1495 : Rat) / 252) [(7, 1), (12, 1), (13, 1), (14, 3), (16, 1)],
  term ((725 : Rat) / 168) [(7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((148780745730977 : Rat) / 2901071261844) [(7, 1), (12, 1), (14, 1), (15, 1)],
  term ((157 : Rat) / 21) [(7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-150142660556857 : Rat) / 330501789324) [(7, 1), (12, 1), (14, 1), (15, 3)],
  term ((247 : Rat) / 63) [(7, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((46106054024388019 : Rat) / 52219282713192) [(7, 1), (12, 1), (14, 2), (15, 1)],
  term ((-1459 : Rat) / 126) [(7, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(7, 1), (12, 1), (14, 2), (15, 3)],
  term ((-2119980937396057 : Rat) / 3729948765228) [(7, 1), (12, 1), (14, 3), (15, 1)],
  term ((247 : Rat) / 63) [(7, 1), (12, 1), (14, 3), (15, 1), (16, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(7, 1), (12, 1), (14, 4), (15, 1)],
  term ((-148780745730977 : Rat) / 5802142523688) [(7, 1), (12, 1), (15, 3)],
  term ((-157 : Rat) / 42) [(7, 1), (12, 1), (15, 3), (16, 1)],
  term ((-206820899571954011 : Rat) / 156657848139576) [(7, 1), (13, 1), (14, 1)],
  term ((-9616667667025831 : Rat) / 5802142523688) [(7, 1), (13, 1), (14, 1), (15, 2)],
  term ((1495 : Rat) / 84) [(7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((5165 : Rat) / 252) [(7, 1), (13, 1), (14, 1), (16, 1)],
  term ((1245421007610743759 : Rat) / 313315696279152) [(7, 1), (13, 1), (14, 2)],
  term ((-1532199782809 : Rat) / 53723541886) [(7, 1), (13, 1), (14, 2), (15, 2)],
  term ((-23105 : Rat) / 504) [(7, 1), (13, 1), (14, 2), (16, 1)],
  term ((-9285712513939087 : Rat) / 5802142523688) [(7, 1), (13, 1), (14, 3)],
  term ((1495 : Rat) / 84) [(7, 1), (13, 1), (14, 3), (16, 1)],
  term ((-1532199782809 : Rat) / 53723541886) [(7, 1), (13, 1), (14, 4)],
  term ((206820899571954011 : Rat) / 313315696279152) [(7, 1), (13, 1), (15, 2)],
  term ((-5165 : Rat) / 504) [(7, 1), (13, 1), (15, 2), (16, 1)],
  term ((14705001849908465 : Rat) / 8703213785532) [(7, 1), (14, 1), (15, 1)],
  term ((-965 : Rat) / 63) [(7, 1), (14, 1), (15, 1), (16, 1)],
  term ((15082361810461453 : Rat) / 8703213785532) [(7, 1), (14, 1), (15, 3)],
  term ((-247 : Rat) / 21) [(7, 1), (14, 1), (15, 3), (16, 1)],
  term ((-25011483030584759 : Rat) / 5802142523688) [(7, 1), (14, 2), (15, 1)],
  term ((3929 : Rat) / 126) [(7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-4596599348427 : Rat) / 26861770943) [(7, 1), (14, 2), (15, 3)],
  term ((18060958188242149 : Rat) / 8703213785532) [(7, 1), (14, 3), (15, 1)],
  term ((-247 : Rat) / 21) [(7, 1), (14, 3), (15, 1), (16, 1)],
  term ((-4596599348427 : Rat) / 26861770943) [(7, 1), (14, 4), (15, 1)],
  term ((-14705001849908465 : Rat) / 17406427571064) [(7, 1), (15, 3)],
  term ((965 : Rat) / 126) [(7, 1), (15, 3), (16, 1)],
  term ((-2600143031426873 : Rat) / 6527410339149) [(7, 2), (10, 1), (14, 1)],
  term ((2600143031426873 : Rat) / 13054820678298) [(7, 2), (10, 1), (14, 2)],
  term ((2600143031426873 : Rat) / 13054820678298) [(7, 2), (10, 1), (15, 2)],
  term ((-1532199782809 : Rat) / 161170625658) [(7, 2), (12, 1), (14, 1)],
  term ((4349915183394751 : Rat) / 13054820678298) [(7, 2), (12, 1), (14, 1), (15, 2)],
  term ((-17275552551171475 : Rat) / 26109641356596) [(7, 2), (12, 1), (14, 2)],
  term ((4349915183394751 : Rat) / 13054820678298) [(7, 2), (12, 1), (14, 3)],
  term ((1532199782809 : Rat) / 322341251316) [(7, 2), (12, 1), (15, 2)],
  term ((-22724054978840279 : Rat) / 13054820678298) [(7, 2), (14, 1)],
  term ((-4349915183394751 : Rat) / 4351606892766) [(7, 2), (14, 1), (15, 2)],
  term ((74923037179577291 : Rat) / 26109641356596) [(7, 2), (14, 2)],
  term ((-4349915183394751 : Rat) / 4351606892766) [(7, 2), (14, 3)],
  term ((22724054978840279 : Rat) / 26109641356596) [(7, 2), (15, 2)],
  term ((-9984 : Rat) / 553) [(9, 1), (10, 1), (11, 1), (12, 1), (14, 1)],
  term ((4992 : Rat) / 553) [(9, 1), (10, 1), (11, 1), (12, 1), (14, 2)],
  term ((4992 : Rat) / 553) [(9, 1), (10, 1), (11, 1), (12, 1), (15, 2)],
  term ((9792711872593 : Rat) / 13156785768) [(9, 1), (10, 1), (11, 1), (14, 1)],
  term ((29952 : Rat) / 553) [(9, 1), (10, 1), (11, 1), (14, 1), (15, 2)],
  term ((-160039779679 : Rat) / 333083184) [(9, 1), (10, 1), (11, 1), (14, 2)],
  term ((29952 : Rat) / 553) [(9, 1), (10, 1), (11, 1), (14, 3)],
  term ((-9792711872593 : Rat) / 26313571536) [(9, 1), (10, 1), (11, 1), (15, 2)],
  term ((6090608323475 : Rat) / 266424911802) [(9, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((-5 : Rat) / 3) [(9, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-6090608323475 : Rat) / 532849823604) [(9, 1), (10, 1), (12, 1), (13, 1), (14, 2)],
  term ((5 : Rat) / 6) [(9, 1), (10, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-6090608323475 : Rat) / 532849823604) [(9, 1), (10, 1), (12, 1), (13, 1), (15, 2)],
  term ((5 : Rat) / 6) [(9, 1), (10, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-30188368622915 : Rat) / 177616607868) [(9, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((32 : Rat) / 21) [(9, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((30188368622915 : Rat) / 355233215736) [(9, 1), (10, 1), (12, 1), (14, 2), (15, 1)],
  term ((-16 : Rat) / 21) [(9, 1), (10, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((30188368622915 : Rat) / 355233215736) [(9, 1), (10, 1), (12, 1), (15, 3)],
  term ((-16 : Rat) / 21) [(9, 1), (10, 1), (12, 1), (15, 3), (16, 1)],
  term ((1048432325617 : Rat) / 266424911802) [(9, 1), (10, 1), (13, 1), (14, 1)],
  term ((8926828802611 : Rat) / 532849823604) [(9, 1), (10, 1), (13, 1), (14, 1), (15, 2)],
  term ((55 : Rat) / 28) [(9, 1), (10, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((1375 : Rat) / 84) [(9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-6300696643613 : Rat) / 177616607868) [(9, 1), (10, 1), (13, 1), (14, 2)],
  term ((-2035 : Rat) / 168) [(9, 1), (10, 1), (13, 1), (14, 2), (16, 1)],
  term ((8926828802611 : Rat) / 532849823604) [(9, 1), (10, 1), (13, 1), (14, 3)],
  term ((55 : Rat) / 28) [(9, 1), (10, 1), (13, 1), (14, 3), (16, 1)],
  term ((-1048432325617 : Rat) / 532849823604) [(9, 1), (10, 1), (13, 1), (15, 2)],
  term ((-1375 : Rat) / 168) [(9, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((8379467626016089 : Rat) / 12788395766496) [(9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-43 : Rat) / 3) [(9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-170525183774905 : Rat) / 710466431472) [(9, 1), (10, 1), (14, 1), (15, 3)],
  term ((-11 : Rat) / 7) [(9, 1), (10, 1), (14, 1), (15, 3), (16, 1)],
  term ((3898345605777071 : Rat) / 25576791532992) [(9, 1), (10, 1), (14, 2), (15, 1)],
  term ((433 : Rat) / 42) [(9, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((-170525183774905 : Rat) / 710466431472) [(9, 1), (10, 1), (14, 3), (15, 1)],
  term ((-11 : Rat) / 7) [(9, 1), (10, 1), (14, 3), (15, 1), (16, 1)],
  term ((-8379467626016089 : Rat) / 25576791532992) [(9, 1), (10, 1), (15, 3)],
  term ((43 : Rat) / 6) [(9, 1), (10, 1), (15, 3), (16, 1)],
  term ((33225805736000 : Rat) / 133212455901) [(9, 1), (11, 1), (12, 1), (14, 1)],
  term ((-16612902868000 : Rat) / 133212455901) [(9, 1), (11, 1), (12, 1), (14, 2)],
  term ((-16612902868000 : Rat) / 133212455901) [(9, 1), (11, 1), (12, 1), (15, 2)],
  term ((2646018989102969 : Rat) / 4262798588832) [(9, 1), (11, 1), (14, 1)],
  term ((-12846645895364245 : Rat) / 25576791532992) [(9, 1), (11, 1), (14, 1), (15, 2)],
  term ((21646818098591279 : Rat) / 25576791532992) [(9, 1), (11, 1), (14, 2)],
  term ((210703568101 : Rat) / 2997748656) [(9, 1), (11, 1), (14, 2), (15, 2)],
  term ((-257388289324195 : Rat) / 323756854848) [(9, 1), (11, 1), (14, 3)],
  term ((59904 : Rat) / 553) [(9, 1), (11, 1), (14, 4)],
  term ((-2646018989102969 : Rat) / 8525597177664) [(9, 1), (11, 1), (15, 2)],
  term ((-9008294618453 : Rat) / 236822143824) [(9, 1), (11, 1), (15, 4)],
  term ((-97923607474811 : Rat) / 532849823604) [(9, 1), (12, 1), (13, 1), (14, 1)],
  term ((475 : Rat) / 42) [(9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((97923607474811 : Rat) / 1065699647208) [(9, 1), (12, 1), (13, 1), (14, 2)],
  term ((-475 : Rat) / 84) [(9, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((97923607474811 : Rat) / 1065699647208) [(9, 1), (12, 1), (13, 1), (15, 2)],
  term ((-475 : Rat) / 84) [(9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((10110568816218515 : Rat) / 69625710284256) [(9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-64 : Rat) / 7) [(9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((2172201733 : Rat) / 666166368) [(9, 1), (12, 1), (14, 1), (15, 3)],
  term ((-11018696850330359 : Rat) / 139251420568512) [(9, 1), (12, 1), (14, 2), (15, 1)],
  term ((32 : Rat) / 7) [(9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((2172201733 : Rat) / 666166368) [(9, 1), (12, 1), (14, 3), (15, 1)],
  term ((-10110568816218515 : Rat) / 139251420568512) [(9, 1), (12, 1), (15, 3)],
  term ((32 : Rat) / 7) [(9, 1), (12, 1), (15, 3), (16, 1)],
  term ((521450111883941 : Rat) / 4262798588832) [(9, 1), (13, 1), (14, 1)],
  term ((-17652245236095439 : Rat) / 25576791532992) [(9, 1), (13, 1), (14, 1), (15, 2)],
  term ((-95 : Rat) / 42) [(9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-745 : Rat) / 168) [(9, 1), (13, 1), (14, 1), (16, 1)],
  term ((29911693308360287 : Rat) / 25576791532992) [(9, 1), (13, 1), (14, 2)],
  term ((-2172201733 : Rat) / 666166368) [(9, 1), (13, 1), (14, 2), (15, 2)],
  term ((3195 : Rat) / 112) [(9, 1), (13, 1), (14, 2), (16, 1)],
  term ((-13656999381243067 : Rat) / 25576791532992) [(9, 1), (13, 1), (14, 3)],
  term ((-505 : Rat) / 21) [(9, 1), (13, 1), (14, 3), (16, 1)],
  term ((-6422908767787 : Rat) / 157881429216) [(9, 1), (13, 1), (14, 4)],
  term ((305 : Rat) / 56) [(9, 1), (13, 1), (14, 4), (16, 1)],
  term ((-521450111883941 : Rat) / 8525597177664) [(9, 1), (13, 1), (15, 2)],
  term ((745 : Rat) / 336) [(9, 1), (13, 1), (15, 2), (16, 1)],
  term ((2954048478533 : Rat) / 78940714608) [(9, 1), (13, 1), (15, 4)],
  term ((-305 : Rat) / 56) [(9, 1), (13, 1), (15, 4), (16, 1)],
  term ((-539299417941477509 : Rat) / 313315696279152) [(9, 1), (14, 1), (15, 1)],
  term ((241 : Rat) / 42) [(9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-50424337405685 : Rat) / 1450535630922) [(9, 1), (14, 1), (15, 3)],
  term ((32 : Rat) / 21) [(9, 1), (14, 1), (15, 3), (16, 1)],
  term ((725407391181051077 : Rat) / 626631392558304) [(9, 1), (14, 2), (15, 1)],
  term ((-2057 : Rat) / 84) [(9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-126793718734813 : Rat) / 483511876974) [(9, 1), (14, 3), (15, 1)],
  term ((422 : Rat) / 21) [(9, 1), (14, 3), (15, 1), (16, 1)],
  term ((3366906314273 : Rat) / 59205535956) [(9, 1), (14, 4), (15, 1)],
  term ((-65 : Rat) / 14) [(9, 1), (14, 4), (15, 1), (16, 1)],
  term ((539299417941477509 : Rat) / 626631392558304) [(9, 1), (15, 3)],
  term ((-241 : Rat) / 84) [(9, 1), (15, 3), (16, 1)],
  term ((-3366906314273 : Rat) / 59205535956) [(9, 1), (15, 5)],
  term ((65 : Rat) / 14) [(9, 1), (15, 5), (16, 1)],
  term ((-67338253723 : Rat) / 2248311492) [(9, 2), (10, 1), (12, 1), (14, 1)],
  term ((67338253723 : Rat) / 4496622984) [(9, 2), (10, 1), (12, 1), (14, 2)],
  term ((67338253723 : Rat) / 4496622984) [(9, 2), (10, 1), (12, 1), (15, 2)],
  term ((-158570726509 : Rat) / 8993245968) [(9, 2), (10, 1), (14, 1)],
  term ((-2172201733 : Rat) / 333083184) [(9, 2), (10, 1), (14, 1), (15, 2)],
  term ((393168513673 : Rat) / 17986491936) [(9, 2), (10, 1), (14, 2)],
  term ((-2172201733 : Rat) / 333083184) [(9, 2), (10, 1), (14, 3)],
  term ((158570726509 : Rat) / 17986491936) [(9, 2), (10, 1), (15, 2)],
  term ((997316410233 : Rat) / 4385595256) [(9, 2), (12, 1), (14, 1)],
  term ((-997316410233 : Rat) / 8771190512) [(9, 2), (12, 1), (14, 2)],
  term ((-997316410233 : Rat) / 8771190512) [(9, 2), (12, 1), (15, 2)],
  term ((-79857096087821 : Rat) / 202990408992) [(9, 2), (14, 1)],
  term ((-2841390155593945 : Rat) / 17406427571064) [(9, 2), (14, 1), (15, 2)],
  term ((10269825637609003 : Rat) / 15472380063168) [(9, 2), (14, 2)],
  term ((-2644145345975429 : Rat) / 8703213785532) [(9, 2), (14, 3)],
  term ((210703568101 : Rat) / 5995497312) [(9, 2), (14, 4)],
  term ((79857096087821 : Rat) / 405980817984) [(9, 2), (15, 2)],
  term ((-210703568101 : Rat) / 5995497312) [(9, 2), (15, 4)],
  term ((-149760 : Rat) / 553) [(10, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((74880 : Rat) / 553) [(10, 1), (11, 1), (12, 1), (14, 2), (15, 1)],
  term ((74880 : Rat) / 553) [(10, 1), (11, 1), (12, 1), (15, 3)],
  term ((-32582181535333 : Rat) / 59205535956) [(10, 1), (11, 1), (13, 1), (14, 1)],
  term ((-74880 : Rat) / 553) [(10, 1), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((-165 : Rat) / 14) [(10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((64649527158373 : Rat) / 118411071912) [(10, 1), (11, 1), (13, 1), (14, 2)],
  term ((165 : Rat) / 28) [(10, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-74880 : Rat) / 553) [(10, 1), (11, 1), (13, 1), (14, 3)],
  term ((32582181535333 : Rat) / 118411071912) [(10, 1), (11, 1), (13, 1), (15, 2)],
  term ((165 : Rat) / 28) [(10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((9718604754760376 : Rat) / 6527410339149) [(10, 1), (11, 1), (14, 1), (15, 1)],
  term ((74 : Rat) / 7) [(10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-119808 : Rat) / 553) [(10, 1), (11, 1), (14, 1), (15, 3)],
  term ((-2030962493428060 : Rat) / 6527410339149) [(10, 1), (11, 1), (14, 2), (15, 1)],
  term ((-37 : Rat) / 7) [(10, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-119808 : Rat) / 553) [(10, 1), (11, 1), (14, 3), (15, 1)],
  term ((-4859302377380188 : Rat) / 6527410339149) [(10, 1), (11, 1), (15, 3)],
  term ((-37 : Rat) / 7) [(10, 1), (11, 1), (15, 3), (16, 1)],
  term ((-239616 : Rat) / 553) [(10, 1), (11, 2), (14, 1)],
  term ((119808 : Rat) / 553) [(10, 1), (11, 2), (14, 2)],
  term ((119808 : Rat) / 553) [(10, 1), (11, 2), (15, 2)],
  term ((-2926995536123 : Rat) / 266424911802) [(10, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-55 : Rat) / 7) [(10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((2926995536123 : Rat) / 532849823604) [(10, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((55 : Rat) / 14) [(10, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((2926995536123 : Rat) / 532849823604) [(10, 1), (12, 1), (13, 1), (15, 3)],
  term ((55 : Rat) / 14) [(10, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-80 : Rat) / 21) [(10, 1), (12, 1), (14, 1)],
  term ((245335365526 : Rat) / 44404151967) [(10, 1), (12, 1), (14, 1), (15, 2)],
  term ((48 : Rat) / 7) [(10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((40 : Rat) / 21) [(10, 1), (12, 1), (14, 2)],
  term ((-122667682763 : Rat) / 44404151967) [(10, 1), (12, 1), (14, 2), (15, 2)],
  term ((-24 : Rat) / 7) [(10, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((40 : Rat) / 21) [(10, 1), (12, 1), (15, 2)],
  term ((-122667682763 : Rat) / 44404151967) [(10, 1), (12, 1), (15, 4)],
  term ((-24 : Rat) / 7) [(10, 1), (12, 1), (15, 4), (16, 1)],
  term ((-4401433677504181 : Rat) / 6394197883248) [(10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-5015 : Rat) / 504) [(10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((27567777768901 : Rat) / 355233215736) [(10, 1), (13, 1), (14, 1), (15, 3)],
  term ((-209 : Rat) / 28) [(10, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((2416553678143309 : Rat) / 12788395766496) [(10, 1), (13, 1), (14, 2), (15, 1)],
  term ((20063 : Rat) / 1008) [(10, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((27567777768901 : Rat) / 355233215736) [(10, 1), (13, 1), (14, 3), (15, 1)],
  term ((-209 : Rat) / 28) [(10, 1), (13, 1), (14, 3), (15, 1), (16, 1)],
  term ((4401433677504181 : Rat) / 12788395766496) [(10, 1), (13, 1), (15, 3)],
  term ((5015 : Rat) / 1008) [(10, 1), (13, 1), (15, 3), (16, 1)],
  term ((236617251229 : Rat) / 532849823604) [(10, 1), (13, 2), (14, 1)],
  term ((-2926995536123 : Rat) / 532849823604) [(10, 1), (13, 2), (14, 1), (15, 2)],
  term ((-55 : Rat) / 14) [(10, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-365 : Rat) / 42) [(10, 1), (13, 2), (14, 1), (16, 1)],
  term ((11471364893263 : Rat) / 1065699647208) [(10, 1), (13, 2), (14, 2)],
  term ((1025 : Rat) / 84) [(10, 1), (13, 2), (14, 2), (16, 1)],
  term ((-2926995536123 : Rat) / 532849823604) [(10, 1), (13, 2), (14, 3)],
  term ((-55 : Rat) / 14) [(10, 1), (13, 2), (14, 3), (16, 1)],
  term ((-236617251229 : Rat) / 1065699647208) [(10, 1), (13, 2), (15, 2)],
  term ((365 : Rat) / 84) [(10, 1), (13, 2), (15, 2), (16, 1)],
  term ((-63064 : Rat) / 1659) [(10, 1), (14, 1)],
  term ((201087985607122009 : Rat) / 208877130852768) [(10, 1), (14, 1), (15, 2)],
  term ((2099 : Rat) / 126) [(10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-3366906314273 : Rat) / 29602767978) [(10, 1), (14, 1), (15, 4)],
  term ((65 : Rat) / 7) [(10, 1), (14, 1), (15, 4), (16, 1)],
  term ((-47873780800336795 : Rat) / 34812855142128) [(10, 1), (14, 2)],
  term ((-20539274531509 : Rat) / 6527410339149) [(10, 1), (14, 2), (15, 2)],
  term ((-6779 : Rat) / 252) [(10, 1), (14, 2), (15, 2), (16, 1)],
  term ((62155609008346051 : Rat) / 69625710284256) [(10, 1), (14, 3)],
  term ((-3366906314273 : Rat) / 29602767978) [(10, 1), (14, 3), (15, 2)],
  term ((65 : Rat) / 7) [(10, 1), (14, 3), (15, 2), (16, 1)],
  term ((-7183625070497 : Rat) / 73444842072) [(10, 1), (14, 4)],
  term ((31532 : Rat) / 1659) [(10, 1), (15, 2)],
  term ((-6935202247883849 : Rat) / 52219282713192) [(10, 1), (15, 4)],
  term ((-2099 : Rat) / 252) [(10, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 5, terms 300 through 399. -/
theorem rs_R009_ueqv_R009YNNNN_block_05_0300_0399_valid :
    checkProductSumEq rs_R009_ueqv_R009YNNNN_partials_05_0300_0399
      rs_R009_ueqv_R009YNNNN_block_05_0300_0399 = true := by
  native_decide

end R009UeqvR009YNNNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
