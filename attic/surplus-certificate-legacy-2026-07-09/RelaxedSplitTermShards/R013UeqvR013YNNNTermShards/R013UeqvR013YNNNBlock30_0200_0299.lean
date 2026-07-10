/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R013:u=v:R013YNNN, term block 30:200-299

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R013UeqvR013YNNNTermShards

/-- Generator polynomial 30 for relaxed split surplus certificate `R013:u=v:R013YNNN`. -/
def rs_R013_ueqv_R013YNNN_generator_30_0200_0299 : Poly :=
[
  term (2 : Rat) [(12, 1), (14, 1)],
  term (-1 : Rat) [(12, 2)],
  term (2 : Rat) [(13, 1), (15, 1)],
  term (-1 : Rat) [(13, 2)]
]

/-- Coefficient term 200 from coefficient polynomial 30. -/
def rs_R013_ueqv_R013YNNN_coefficient_30_0200 : Poly :=
[
  term ((239598272125548555 : Rat) / 5152734910838036) [(1, 1), (11, 2), (14, 2), (15, 1)]
]

/-- Partial product 200 for generator 30. -/
def rs_R013_ueqv_R013YNNN_partial_30_0200 : Poly :=
[
  term ((239598272125548555 : Rat) / 2576367455419018) [(1, 1), (11, 2), (12, 1), (14, 3), (15, 1)],
  term ((-239598272125548555 : Rat) / 5152734910838036) [(1, 1), (11, 2), (12, 2), (14, 2), (15, 1)],
  term ((239598272125548555 : Rat) / 2576367455419018) [(1, 1), (11, 2), (13, 1), (14, 2), (15, 2)],
  term ((-239598272125548555 : Rat) / 5152734910838036) [(1, 1), (11, 2), (13, 2), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 200 for generator 30. -/
theorem rs_R013_ueqv_R013YNNN_partial_30_0200_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_30_0200
        rs_R013_ueqv_R013YNNN_generator_30_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_30_0200 := by
  native_decide

/-- Coefficient term 201 from coefficient polynomial 30. -/
def rs_R013_ueqv_R013YNNN_coefficient_30_0201 : Poly :=
[
  term ((-42453538021107519 : Rat) / 5152734910838036) [(1, 1), (11, 2), (15, 1)]
]

/-- Partial product 201 for generator 30. -/
def rs_R013_ueqv_R013YNNN_partial_30_0201 : Poly :=
[
  term ((-42453538021107519 : Rat) / 2576367455419018) [(1, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((42453538021107519 : Rat) / 5152734910838036) [(1, 1), (11, 2), (12, 2), (15, 1)],
  term ((-42453538021107519 : Rat) / 2576367455419018) [(1, 1), (11, 2), (13, 1), (15, 2)],
  term ((42453538021107519 : Rat) / 5152734910838036) [(1, 1), (11, 2), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 201 for generator 30. -/
theorem rs_R013_ueqv_R013YNNN_partial_30_0201_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_30_0201
        rs_R013_ueqv_R013YNNN_generator_30_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_30_0201 := by
  native_decide

/-- Coefficient term 202 from coefficient polynomial 30. -/
def rs_R013_ueqv_R013YNNN_coefficient_30_0202 : Poly :=
[
  term ((239598272125548555 : Rat) / 5152734910838036) [(1, 1), (11, 2), (15, 3)]
]

/-- Partial product 202 for generator 30. -/
def rs_R013_ueqv_R013YNNN_partial_30_0202 : Poly :=
[
  term ((239598272125548555 : Rat) / 2576367455419018) [(1, 1), (11, 2), (12, 1), (14, 1), (15, 3)],
  term ((-239598272125548555 : Rat) / 5152734910838036) [(1, 1), (11, 2), (12, 2), (15, 3)],
  term ((239598272125548555 : Rat) / 2576367455419018) [(1, 1), (11, 2), (13, 1), (15, 4)],
  term ((-239598272125548555 : Rat) / 5152734910838036) [(1, 1), (11, 2), (13, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 202 for generator 30. -/
theorem rs_R013_ueqv_R013YNNN_partial_30_0202_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_30_0202
        rs_R013_ueqv_R013YNNN_generator_30_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_30_0202 := by
  native_decide

/-- Coefficient term 203 from coefficient polynomial 30. -/
def rs_R013_ueqv_R013YNNN_coefficient_30_0203 : Poly :=
[
  term ((-1131676349127866250 : Rat) / 1288183727709509) [(1, 1), (11, 3), (13, 1), (15, 1)]
]

/-- Partial product 203 for generator 30. -/
def rs_R013_ueqv_R013YNNN_partial_30_0203 : Poly :=
[
  term ((-2263352698255732500 : Rat) / 1288183727709509) [(1, 1), (11, 3), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((1131676349127866250 : Rat) / 1288183727709509) [(1, 1), (11, 3), (12, 2), (13, 1), (15, 1)],
  term ((-2263352698255732500 : Rat) / 1288183727709509) [(1, 1), (11, 3), (13, 2), (15, 2)],
  term ((1131676349127866250 : Rat) / 1288183727709509) [(1, 1), (11, 3), (13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 203 for generator 30. -/
theorem rs_R013_ueqv_R013YNNN_partial_30_0203_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_30_0203
        rs_R013_ueqv_R013YNNN_generator_30_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_30_0203 := by
  native_decide

/-- Coefficient term 204 from coefficient polynomial 30. -/
def rs_R013_ueqv_R013YNNN_coefficient_30_0204 : Poly :=
[
  term ((21736316955409677501 : Rat) / 1288183727709509) [(1, 1), (11, 3), (15, 2)]
]

/-- Partial product 204 for generator 30. -/
def rs_R013_ueqv_R013YNNN_partial_30_0204 : Poly :=
[
  term ((43472633910819355002 : Rat) / 1288183727709509) [(1, 1), (11, 3), (12, 1), (14, 1), (15, 2)],
  term ((-21736316955409677501 : Rat) / 1288183727709509) [(1, 1), (11, 3), (12, 2), (15, 2)],
  term ((43472633910819355002 : Rat) / 1288183727709509) [(1, 1), (11, 3), (13, 1), (15, 3)],
  term ((-21736316955409677501 : Rat) / 1288183727709509) [(1, 1), (11, 3), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 204 for generator 30. -/
theorem rs_R013_ueqv_R013YNNN_partial_30_0204_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_30_0204
        rs_R013_ueqv_R013YNNN_generator_30_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_30_0204 := by
  native_decide

/-- Coefficient term 205 from coefficient polynomial 30. -/
def rs_R013_ueqv_R013YNNN_coefficient_30_0205 : Poly :=
[
  term ((-376935478 : Rat) / 436173) [(1, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 205 for generator 30. -/
def rs_R013_ueqv_R013YNNN_partial_30_0205 : Poly :=
[
  term ((-753870956 : Rat) / 436173) [(1, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((376935478 : Rat) / 436173) [(1, 1), (12, 1), (13, 2), (14, 1), (15, 1)],
  term ((-753870956 : Rat) / 436173) [(1, 1), (12, 2), (14, 2), (15, 1)],
  term ((376935478 : Rat) / 436173) [(1, 1), (12, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 205 for generator 30. -/
theorem rs_R013_ueqv_R013YNNN_partial_30_0205_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_30_0205
        rs_R013_ueqv_R013YNNN_generator_30_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_30_0205 := by
  native_decide

/-- Coefficient term 206 from coefficient polynomial 30. -/
def rs_R013_ueqv_R013YNNN_coefficient_30_0206 : Poly :=
[
  term ((-214578122193 : Rat) / 17156138) [(1, 1), (12, 1), (15, 1)]
]

/-- Partial product 206 for generator 30. -/
def rs_R013_ueqv_R013YNNN_partial_30_0206 : Poly :=
[
  term ((-214578122193 : Rat) / 8578069) [(1, 1), (12, 1), (13, 1), (15, 2)],
  term ((214578122193 : Rat) / 17156138) [(1, 1), (12, 1), (13, 2), (15, 1)],
  term ((-214578122193 : Rat) / 8578069) [(1, 1), (12, 2), (14, 1), (15, 1)],
  term ((214578122193 : Rat) / 17156138) [(1, 1), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 206 for generator 30. -/
theorem rs_R013_ueqv_R013YNNN_partial_30_0206_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_30_0206
        rs_R013_ueqv_R013YNNN_generator_30_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_30_0206 := by
  native_decide

/-- Coefficient term 207 from coefficient polynomial 30. -/
def rs_R013_ueqv_R013YNNN_coefficient_30_0207 : Poly :=
[
  term ((-21756460858 : Rat) / 8578069) [(1, 1), (12, 2), (15, 1)]
]

/-- Partial product 207 for generator 30. -/
def rs_R013_ueqv_R013YNNN_partial_30_0207 : Poly :=
[
  term ((-43512921716 : Rat) / 8578069) [(1, 1), (12, 2), (13, 1), (15, 2)],
  term ((21756460858 : Rat) / 8578069) [(1, 1), (12, 2), (13, 2), (15, 1)],
  term ((-43512921716 : Rat) / 8578069) [(1, 1), (12, 3), (14, 1), (15, 1)],
  term ((21756460858 : Rat) / 8578069) [(1, 1), (12, 4), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 207 for generator 30. -/
theorem rs_R013_ueqv_R013YNNN_partial_30_0207_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_30_0207
        rs_R013_ueqv_R013YNNN_generator_30_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_30_0207 := by
  native_decide

/-- Coefficient term 208 from coefficient polynomial 30. -/
def rs_R013_ueqv_R013YNNN_coefficient_30_0208 : Poly :=
[
  term ((-104768482801 : Rat) / 51468414) [(1, 1), (13, 1), (15, 2)]
]

/-- Partial product 208 for generator 30. -/
def rs_R013_ueqv_R013YNNN_partial_30_0208 : Poly :=
[
  term ((-104768482801 : Rat) / 25734207) [(1, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((104768482801 : Rat) / 51468414) [(1, 1), (12, 2), (13, 1), (15, 2)],
  term ((-104768482801 : Rat) / 25734207) [(1, 1), (13, 2), (15, 3)],
  term ((104768482801 : Rat) / 51468414) [(1, 1), (13, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 208 for generator 30. -/
theorem rs_R013_ueqv_R013YNNN_partial_30_0208_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_30_0208
        rs_R013_ueqv_R013YNNN_generator_30_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_30_0208 := by
  native_decide

/-- Coefficient term 209 from coefficient polynomial 30. -/
def rs_R013_ueqv_R013YNNN_coefficient_30_0209 : Poly :=
[
  term ((59538115150 : Rat) / 25734207) [(1, 1), (13, 2), (15, 1)]
]

/-- Partial product 209 for generator 30. -/
def rs_R013_ueqv_R013YNNN_partial_30_0209 : Poly :=
[
  term ((119076230300 : Rat) / 25734207) [(1, 1), (12, 1), (13, 2), (14, 1), (15, 1)],
  term ((-59538115150 : Rat) / 25734207) [(1, 1), (12, 2), (13, 2), (15, 1)],
  term ((119076230300 : Rat) / 25734207) [(1, 1), (13, 3), (15, 2)],
  term ((-59538115150 : Rat) / 25734207) [(1, 1), (13, 4), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 209 for generator 30. -/
theorem rs_R013_ueqv_R013YNNN_partial_30_0209_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_30_0209
        rs_R013_ueqv_R013YNNN_generator_30_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_30_0209 := by
  native_decide

/-- Coefficient term 210 from coefficient polynomial 30. -/
def rs_R013_ueqv_R013YNNN_coefficient_30_0210 : Poly :=
[
  term ((63345093248 : Rat) / 25734207) [(1, 1), (14, 1), (15, 1)]
]

/-- Partial product 210 for generator 30. -/
def rs_R013_ueqv_R013YNNN_partial_30_0210 : Poly :=
[
  term ((126690186496 : Rat) / 25734207) [(1, 1), (12, 1), (14, 2), (15, 1)],
  term ((-63345093248 : Rat) / 25734207) [(1, 1), (12, 2), (14, 1), (15, 1)],
  term ((126690186496 : Rat) / 25734207) [(1, 1), (13, 1), (14, 1), (15, 2)],
  term ((-63345093248 : Rat) / 25734207) [(1, 1), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 210 for generator 30. -/
theorem rs_R013_ueqv_R013YNNN_partial_30_0210_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_30_0210
        rs_R013_ueqv_R013YNNN_generator_30_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_30_0210 := by
  native_decide

/-- Coefficient term 211 from coefficient polynomial 30. -/
def rs_R013_ueqv_R013YNNN_coefficient_30_0211 : Poly :=
[
  term ((-4990114821 : Rat) / 8578069) [(1, 1), (14, 2), (15, 1)]
]

/-- Partial product 211 for generator 30. -/
def rs_R013_ueqv_R013YNNN_partial_30_0211 : Poly :=
[
  term ((-9980229642 : Rat) / 8578069) [(1, 1), (12, 1), (14, 3), (15, 1)],
  term ((4990114821 : Rat) / 8578069) [(1, 1), (12, 2), (14, 2), (15, 1)],
  term ((-9980229642 : Rat) / 8578069) [(1, 1), (13, 1), (14, 2), (15, 2)],
  term ((4990114821 : Rat) / 8578069) [(1, 1), (13, 2), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 211 for generator 30. -/
theorem rs_R013_ueqv_R013YNNN_partial_30_0211_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_30_0211
        rs_R013_ueqv_R013YNNN_generator_30_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_30_0211 := by
  native_decide

/-- Coefficient term 212 from coefficient polynomial 30. -/
def rs_R013_ueqv_R013YNNN_coefficient_30_0212 : Poly :=
[
  term ((-33282322983 : Rat) / 34312276) [(1, 1), (15, 1)]
]

/-- Partial product 212 for generator 30. -/
def rs_R013_ueqv_R013YNNN_partial_30_0212 : Poly :=
[
  term ((-33282322983 : Rat) / 17156138) [(1, 1), (12, 1), (14, 1), (15, 1)],
  term ((33282322983 : Rat) / 34312276) [(1, 1), (12, 2), (15, 1)],
  term ((-33282322983 : Rat) / 17156138) [(1, 1), (13, 1), (15, 2)],
  term ((33282322983 : Rat) / 34312276) [(1, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 212 for generator 30. -/
theorem rs_R013_ueqv_R013YNNN_partial_30_0212_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_30_0212
        rs_R013_ueqv_R013YNNN_generator_30_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_30_0212 := by
  native_decide

/-- Coefficient term 213 from coefficient polynomial 30. -/
def rs_R013_ueqv_R013YNNN_coefficient_30_0213 : Poly :=
[
  term ((-4990114821 : Rat) / 8578069) [(1, 1), (15, 3)]
]

/-- Partial product 213 for generator 30. -/
def rs_R013_ueqv_R013YNNN_partial_30_0213 : Poly :=
[
  term ((-9980229642 : Rat) / 8578069) [(1, 1), (12, 1), (14, 1), (15, 3)],
  term ((4990114821 : Rat) / 8578069) [(1, 1), (12, 2), (15, 3)],
  term ((-9980229642 : Rat) / 8578069) [(1, 1), (13, 1), (15, 4)],
  term ((4990114821 : Rat) / 8578069) [(1, 1), (13, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 213 for generator 30. -/
theorem rs_R013_ueqv_R013YNNN_partial_30_0213_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_30_0213
        rs_R013_ueqv_R013YNNN_generator_30_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_30_0213 := by
  native_decide

/-- Coefficient term 214 from coefficient polynomial 30. -/
def rs_R013_ueqv_R013YNNN_coefficient_30_0214 : Poly :=
[
  term ((50016153600 : Rat) / 150171761) [(1, 2), (2, 1), (11, 1), (13, 1)]
]

/-- Partial product 214 for generator 30. -/
def rs_R013_ueqv_R013YNNN_partial_30_0214 : Poly :=
[
  term ((100032307200 : Rat) / 150171761) [(1, 2), (2, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-50016153600 : Rat) / 150171761) [(1, 2), (2, 1), (11, 1), (12, 2), (13, 1)],
  term ((100032307200 : Rat) / 150171761) [(1, 2), (2, 1), (11, 1), (13, 2), (15, 1)],
  term ((-50016153600 : Rat) / 150171761) [(1, 2), (2, 1), (11, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 214 for generator 30. -/
theorem rs_R013_ueqv_R013YNNN_partial_30_0214_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_30_0214
        rs_R013_ueqv_R013YNNN_generator_30_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_30_0214 := by
  native_decide

/-- Coefficient term 215 from coefficient polynomial 30. -/
def rs_R013_ueqv_R013YNNN_coefficient_30_0215 : Poly :=
[
  term ((3178262016 : Rat) / 8578069) [(1, 2), (2, 1), (11, 1), (15, 1)]
]

/-- Partial product 215 for generator 30. -/
def rs_R013_ueqv_R013YNNN_partial_30_0215 : Poly :=
[
  term ((6356524032 : Rat) / 8578069) [(1, 2), (2, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-3178262016 : Rat) / 8578069) [(1, 2), (2, 1), (11, 1), (12, 2), (15, 1)],
  term ((6356524032 : Rat) / 8578069) [(1, 2), (2, 1), (11, 1), (13, 1), (15, 2)],
  term ((-3178262016 : Rat) / 8578069) [(1, 2), (2, 1), (11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 215 for generator 30. -/
theorem rs_R013_ueqv_R013YNNN_partial_30_0215_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_30_0215
        rs_R013_ueqv_R013YNNN_generator_30_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_30_0215 := by
  native_decide

/-- Coefficient term 216 from coefficient polynomial 30. -/
def rs_R013_ueqv_R013YNNN_coefficient_30_0216 : Poly :=
[
  term ((-50016153600 : Rat) / 150171761) [(1, 2), (2, 1), (11, 2)]
]

/-- Partial product 216 for generator 30. -/
def rs_R013_ueqv_R013YNNN_partial_30_0216 : Poly :=
[
  term ((-100032307200 : Rat) / 150171761) [(1, 2), (2, 1), (11, 2), (12, 1), (14, 1)],
  term ((50016153600 : Rat) / 150171761) [(1, 2), (2, 1), (11, 2), (12, 2)],
  term ((-100032307200 : Rat) / 150171761) [(1, 2), (2, 1), (11, 2), (13, 1), (15, 1)],
  term ((50016153600 : Rat) / 150171761) [(1, 2), (2, 1), (11, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 216 for generator 30. -/
theorem rs_R013_ueqv_R013YNNN_partial_30_0216_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_30_0216
        rs_R013_ueqv_R013YNNN_generator_30_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_30_0216 := by
  native_decide

/-- Coefficient term 217 from coefficient polynomial 30. -/
def rs_R013_ueqv_R013YNNN_coefficient_30_0217 : Poly :=
[
  term ((2409286822347928320 : Rat) / 1288183727709509) [(1, 2), (2, 1), (11, 2), (13, 1), (15, 1)]
]

/-- Partial product 217 for generator 30. -/
def rs_R013_ueqv_R013YNNN_partial_30_0217 : Poly :=
[
  term ((4818573644695856640 : Rat) / 1288183727709509) [(1, 2), (2, 1), (11, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-2409286822347928320 : Rat) / 1288183727709509) [(1, 2), (2, 1), (11, 2), (12, 2), (13, 1), (15, 1)],
  term ((4818573644695856640 : Rat) / 1288183727709509) [(1, 2), (2, 1), (11, 2), (13, 2), (15, 2)],
  term ((-2409286822347928320 : Rat) / 1288183727709509) [(1, 2), (2, 1), (11, 2), (13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 217 for generator 30. -/
theorem rs_R013_ueqv_R013YNNN_partial_30_0217_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_30_0217
        rs_R013_ueqv_R013YNNN_generator_30_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_30_0217 := by
  native_decide

/-- Coefficient term 218 from coefficient polynomial 30. -/
def rs_R013_ueqv_R013YNNN_coefficient_30_0218 : Poly :=
[
  term ((-2409286822347928320 : Rat) / 1288183727709509) [(1, 2), (2, 1), (11, 3), (15, 1)]
]

/-- Partial product 218 for generator 30. -/
def rs_R013_ueqv_R013YNNN_partial_30_0218 : Poly :=
[
  term ((-4818573644695856640 : Rat) / 1288183727709509) [(1, 2), (2, 1), (11, 3), (12, 1), (14, 1), (15, 1)],
  term ((2409286822347928320 : Rat) / 1288183727709509) [(1, 2), (2, 1), (11, 3), (12, 2), (15, 1)],
  term ((-4818573644695856640 : Rat) / 1288183727709509) [(1, 2), (2, 1), (11, 3), (13, 1), (15, 2)],
  term ((2409286822347928320 : Rat) / 1288183727709509) [(1, 2), (2, 1), (11, 3), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 218 for generator 30. -/
theorem rs_R013_ueqv_R013YNNN_partial_30_0218_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_30_0218
        rs_R013_ueqv_R013YNNN_generator_30_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_30_0218 := by
  native_decide

/-- Coefficient term 219 from coefficient polynomial 30. -/
def rs_R013_ueqv_R013YNNN_coefficient_30_0219 : Poly :=
[
  term ((-3178262016 : Rat) / 8578069) [(1, 2), (2, 1), (13, 1), (15, 1)]
]

/-- Partial product 219 for generator 30. -/
def rs_R013_ueqv_R013YNNN_partial_30_0219 : Poly :=
[
  term ((-6356524032 : Rat) / 8578069) [(1, 2), (2, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((3178262016 : Rat) / 8578069) [(1, 2), (2, 1), (12, 2), (13, 1), (15, 1)],
  term ((-6356524032 : Rat) / 8578069) [(1, 2), (2, 1), (13, 2), (15, 2)],
  term ((3178262016 : Rat) / 8578069) [(1, 2), (2, 1), (13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 219 for generator 30. -/
theorem rs_R013_ueqv_R013YNNN_partial_30_0219_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_30_0219
        rs_R013_ueqv_R013YNNN_generator_30_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_30_0219 := by
  native_decide

/-- Coefficient term 220 from coefficient polynomial 30. -/
def rs_R013_ueqv_R013YNNN_coefficient_30_0220 : Poly :=
[
  term (576 : Rat) [(1, 2), (7, 1), (11, 1)]
]

/-- Partial product 220 for generator 30. -/
def rs_R013_ueqv_R013YNNN_partial_30_0220 : Poly :=
[
  term (1152 : Rat) [(1, 2), (7, 1), (11, 1), (12, 1), (14, 1)],
  term (-576 : Rat) [(1, 2), (7, 1), (11, 1), (12, 2)],
  term (1152 : Rat) [(1, 2), (7, 1), (11, 1), (13, 1), (15, 1)],
  term (-576 : Rat) [(1, 2), (7, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 220 for generator 30. -/
theorem rs_R013_ueqv_R013YNNN_partial_30_0220_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_30_0220
        rs_R013_ueqv_R013YNNN_generator_30_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_30_0220 := by
  native_decide

/-- Coefficient term 221 from coefficient polynomial 30. -/
def rs_R013_ueqv_R013YNNN_coefficient_30_0221 : Poly :=
[
  term (-576 : Rat) [(1, 2), (7, 1), (13, 1)]
]

/-- Partial product 221 for generator 30. -/
def rs_R013_ueqv_R013YNNN_partial_30_0221 : Poly :=
[
  term (-1152 : Rat) [(1, 2), (7, 1), (12, 1), (13, 1), (14, 1)],
  term (576 : Rat) [(1, 2), (7, 1), (12, 2), (13, 1)],
  term (-1152 : Rat) [(1, 2), (7, 1), (13, 2), (15, 1)],
  term (576 : Rat) [(1, 2), (7, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 221 for generator 30. -/
theorem rs_R013_ueqv_R013YNNN_partial_30_0221_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_30_0221
        rs_R013_ueqv_R013YNNN_generator_30_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_30_0221 := by
  native_decide

/-- Coefficient term 222 from coefficient polynomial 30. -/
def rs_R013_ueqv_R013YNNN_coefficient_30_0222 : Poly :=
[
  term ((-7894118400 : Rat) / 150171761) [(1, 2), (11, 1), (12, 1), (13, 1)]
]

/-- Partial product 222 for generator 30. -/
def rs_R013_ueqv_R013YNNN_partial_30_0222 : Poly :=
[
  term ((-15788236800 : Rat) / 150171761) [(1, 2), (11, 1), (12, 1), (13, 2), (15, 1)],
  term ((7894118400 : Rat) / 150171761) [(1, 2), (11, 1), (12, 1), (13, 3)],
  term ((-15788236800 : Rat) / 150171761) [(1, 2), (11, 1), (12, 2), (13, 1), (14, 1)],
  term ((7894118400 : Rat) / 150171761) [(1, 2), (11, 1), (12, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 222 for generator 30. -/
theorem rs_R013_ueqv_R013YNNN_partial_30_0222_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_30_0222
        rs_R013_ueqv_R013YNNN_generator_30_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_30_0222 := by
  native_decide

/-- Coefficient term 223 from coefficient polynomial 30. -/
def rs_R013_ueqv_R013YNNN_coefficient_30_0223 : Poly :=
[
  term ((32513214976 : Rat) / 8578069) [(1, 2), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 223 for generator 30. -/
def rs_R013_ueqv_R013YNNN_partial_30_0223 : Poly :=
[
  term ((65026429952 : Rat) / 8578069) [(1, 2), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((-32513214976 : Rat) / 8578069) [(1, 2), (11, 1), (12, 1), (13, 2), (15, 1)],
  term ((65026429952 : Rat) / 8578069) [(1, 2), (11, 1), (12, 2), (14, 1), (15, 1)],
  term ((-32513214976 : Rat) / 8578069) [(1, 2), (11, 1), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 223 for generator 30. -/
theorem rs_R013_ueqv_R013YNNN_partial_30_0223_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_30_0223
        rs_R013_ueqv_R013YNNN_generator_30_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_30_0223 := by
  native_decide

/-- Coefficient term 224 from coefficient polynomial 30. -/
def rs_R013_ueqv_R013YNNN_coefficient_30_0224 : Poly :=
[
  term ((-11607423360 : Rat) / 150171761) [(1, 2), (11, 1), (13, 1)]
]

/-- Partial product 224 for generator 30. -/
def rs_R013_ueqv_R013YNNN_partial_30_0224 : Poly :=
[
  term ((-23214846720 : Rat) / 150171761) [(1, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((11607423360 : Rat) / 150171761) [(1, 2), (11, 1), (12, 2), (13, 1)],
  term ((-23214846720 : Rat) / 150171761) [(1, 2), (11, 1), (13, 2), (15, 1)],
  term ((11607423360 : Rat) / 150171761) [(1, 2), (11, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 224 for generator 30. -/
theorem rs_R013_ueqv_R013YNNN_partial_30_0224_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_30_0224
        rs_R013_ueqv_R013YNNN_generator_30_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_30_0224 := by
  native_decide

/-- Coefficient term 225 from coefficient polynomial 30. -/
def rs_R013_ueqv_R013YNNN_coefficient_30_0225 : Poly :=
[
  term ((-33053710229 : Rat) / 17156138) [(1, 2), (11, 1), (15, 1)]
]

/-- Partial product 225 for generator 30. -/
def rs_R013_ueqv_R013YNNN_partial_30_0225 : Poly :=
[
  term ((-33053710229 : Rat) / 8578069) [(1, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((33053710229 : Rat) / 17156138) [(1, 2), (11, 1), (12, 2), (15, 1)],
  term ((-33053710229 : Rat) / 8578069) [(1, 2), (11, 1), (13, 1), (15, 2)],
  term ((33053710229 : Rat) / 17156138) [(1, 2), (11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 225 for generator 30. -/
theorem rs_R013_ueqv_R013YNNN_partial_30_0225_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_30_0225
        rs_R013_ueqv_R013YNNN_generator_30_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_30_0225 := by
  native_decide

/-- Coefficient term 226 from coefficient polynomial 30. -/
def rs_R013_ueqv_R013YNNN_coefficient_30_0226 : Poly :=
[
  term ((11607423360 : Rat) / 150171761) [(1, 2), (11, 2)]
]

/-- Partial product 226 for generator 30. -/
def rs_R013_ueqv_R013YNNN_partial_30_0226 : Poly :=
[
  term ((23214846720 : Rat) / 150171761) [(1, 2), (11, 2), (12, 1), (14, 1)],
  term ((-11607423360 : Rat) / 150171761) [(1, 2), (11, 2), (12, 2)],
  term ((23214846720 : Rat) / 150171761) [(1, 2), (11, 2), (13, 1), (15, 1)],
  term ((-11607423360 : Rat) / 150171761) [(1, 2), (11, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 226 for generator 30. -/
theorem rs_R013_ueqv_R013YNNN_partial_30_0226_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_30_0226
        rs_R013_ueqv_R013YNNN_generator_30_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_30_0226 := by
  native_decide

/-- Coefficient term 227 from coefficient polynomial 30. -/
def rs_R013_ueqv_R013YNNN_coefficient_30_0227 : Poly :=
[
  term ((7894118400 : Rat) / 150171761) [(1, 2), (11, 2), (12, 1)]
]

/-- Partial product 227 for generator 30. -/
def rs_R013_ueqv_R013YNNN_partial_30_0227 : Poly :=
[
  term ((15788236800 : Rat) / 150171761) [(1, 2), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((-7894118400 : Rat) / 150171761) [(1, 2), (11, 2), (12, 1), (13, 2)],
  term ((15788236800 : Rat) / 150171761) [(1, 2), (11, 2), (12, 2), (14, 1)],
  term ((-7894118400 : Rat) / 150171761) [(1, 2), (11, 2), (12, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 227 for generator 30. -/
theorem rs_R013_ueqv_R013YNNN_partial_30_0227_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_30_0227
        rs_R013_ueqv_R013YNNN_generator_30_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_30_0227 := by
  native_decide

/-- Coefficient term 228 from coefficient polynomial 30. -/
def rs_R013_ueqv_R013YNNN_coefficient_30_0228 : Poly :=
[
  term ((-380261057003278080 : Rat) / 1288183727709509) [(1, 2), (11, 2), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 228 for generator 30. -/
def rs_R013_ueqv_R013YNNN_partial_30_0228 : Poly :=
[
  term ((-760522114006556160 : Rat) / 1288183727709509) [(1, 2), (11, 2), (12, 1), (13, 2), (15, 2)],
  term ((380261057003278080 : Rat) / 1288183727709509) [(1, 2), (11, 2), (12, 1), (13, 3), (15, 1)],
  term ((-760522114006556160 : Rat) / 1288183727709509) [(1, 2), (11, 2), (12, 2), (13, 1), (14, 1), (15, 1)],
  term ((380261057003278080 : Rat) / 1288183727709509) [(1, 2), (11, 2), (12, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 228 for generator 30. -/
theorem rs_R013_ueqv_R013YNNN_partial_30_0228_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_30_0228
        rs_R013_ueqv_R013YNNN_generator_30_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_30_0228 := by
  native_decide

/-- Coefficient term 229 from coefficient polynomial 30. -/
def rs_R013_ueqv_R013YNNN_coefficient_30_0229 : Poly :=
[
  term ((-559131603087957432 : Rat) / 1288183727709509) [(1, 2), (11, 2), (13, 1), (15, 1)]
]

/-- Partial product 229 for generator 30. -/
def rs_R013_ueqv_R013YNNN_partial_30_0229 : Poly :=
[
  term ((-1118263206175914864 : Rat) / 1288183727709509) [(1, 2), (11, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((559131603087957432 : Rat) / 1288183727709509) [(1, 2), (11, 2), (12, 2), (13, 1), (15, 1)],
  term ((-1118263206175914864 : Rat) / 1288183727709509) [(1, 2), (11, 2), (13, 2), (15, 2)],
  term ((559131603087957432 : Rat) / 1288183727709509) [(1, 2), (11, 2), (13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 229 for generator 30. -/
theorem rs_R013_ueqv_R013YNNN_partial_30_0229_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_30_0229
        rs_R013_ueqv_R013YNNN_generator_30_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_30_0229 := by
  native_decide

/-- Coefficient term 230 from coefficient polynomial 30. -/
def rs_R013_ueqv_R013YNNN_coefficient_30_0230 : Poly :=
[
  term ((380261057003278080 : Rat) / 1288183727709509) [(1, 2), (11, 3), (12, 1), (15, 1)]
]

/-- Partial product 230 for generator 30. -/
def rs_R013_ueqv_R013YNNN_partial_30_0230 : Poly :=
[
  term ((760522114006556160 : Rat) / 1288183727709509) [(1, 2), (11, 3), (12, 1), (13, 1), (15, 2)],
  term ((-380261057003278080 : Rat) / 1288183727709509) [(1, 2), (11, 3), (12, 1), (13, 2), (15, 1)],
  term ((760522114006556160 : Rat) / 1288183727709509) [(1, 2), (11, 3), (12, 2), (14, 1), (15, 1)],
  term ((-380261057003278080 : Rat) / 1288183727709509) [(1, 2), (11, 3), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 230 for generator 30. -/
theorem rs_R013_ueqv_R013YNNN_partial_30_0230_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_30_0230
        rs_R013_ueqv_R013YNNN_generator_30_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_30_0230 := by
  native_decide

/-- Coefficient term 231 from coefficient polynomial 30. -/
def rs_R013_ueqv_R013YNNN_coefficient_30_0231 : Poly :=
[
  term ((559131603087957432 : Rat) / 1288183727709509) [(1, 2), (11, 3), (15, 1)]
]

/-- Partial product 231 for generator 30. -/
def rs_R013_ueqv_R013YNNN_partial_30_0231 : Poly :=
[
  term ((1118263206175914864 : Rat) / 1288183727709509) [(1, 2), (11, 3), (12, 1), (14, 1), (15, 1)],
  term ((-559131603087957432 : Rat) / 1288183727709509) [(1, 2), (11, 3), (12, 2), (15, 1)],
  term ((1118263206175914864 : Rat) / 1288183727709509) [(1, 2), (11, 3), (13, 1), (15, 2)],
  term ((-559131603087957432 : Rat) / 1288183727709509) [(1, 2), (11, 3), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 231 for generator 30. -/
theorem rs_R013_ueqv_R013YNNN_partial_30_0231_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_30_0231
        rs_R013_ueqv_R013YNNN_generator_30_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_30_0231 := by
  native_decide

/-- Coefficient term 232 from coefficient polynomial 30. -/
def rs_R013_ueqv_R013YNNN_coefficient_30_0232 : Poly :=
[
  term ((-32513214976 : Rat) / 8578069) [(1, 2), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 232 for generator 30. -/
def rs_R013_ueqv_R013YNNN_partial_30_0232 : Poly :=
[
  term ((-65026429952 : Rat) / 8578069) [(1, 2), (12, 1), (13, 2), (15, 2)],
  term ((32513214976 : Rat) / 8578069) [(1, 2), (12, 1), (13, 3), (15, 1)],
  term ((-65026429952 : Rat) / 8578069) [(1, 2), (12, 2), (13, 1), (14, 1), (15, 1)],
  term ((32513214976 : Rat) / 8578069) [(1, 2), (12, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 232 for generator 30. -/
theorem rs_R013_ueqv_R013YNNN_partial_30_0232_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_30_0232
        rs_R013_ueqv_R013YNNN_generator_30_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_30_0232 := by
  native_decide

/-- Coefficient term 233 from coefficient polynomial 30. -/
def rs_R013_ueqv_R013YNNN_coefficient_30_0233 : Poly :=
[
  term ((33053710229 : Rat) / 17156138) [(1, 2), (13, 1), (15, 1)]
]

/-- Partial product 233 for generator 30. -/
def rs_R013_ueqv_R013YNNN_partial_30_0233 : Poly :=
[
  term ((33053710229 : Rat) / 8578069) [(1, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-33053710229 : Rat) / 17156138) [(1, 2), (12, 2), (13, 1), (15, 1)],
  term ((33053710229 : Rat) / 8578069) [(1, 2), (13, 2), (15, 2)],
  term ((-33053710229 : Rat) / 17156138) [(1, 2), (13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 233 for generator 30. -/
theorem rs_R013_ueqv_R013YNNN_partial_30_0233_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_30_0233
        rs_R013_ueqv_R013YNNN_generator_30_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_30_0233 := by
  native_decide

/-- Coefficient term 234 from coefficient polynomial 30. -/
def rs_R013_ueqv_R013YNNN_coefficient_30_0234 : Poly :=
[
  term ((-15873657200 : Rat) / 150171761) [(2, 1), (3, 1), (4, 1), (11, 1)]
]

/-- Partial product 234 for generator 30. -/
def rs_R013_ueqv_R013YNNN_partial_30_0234 : Poly :=
[
  term ((-31747314400 : Rat) / 150171761) [(2, 1), (3, 1), (4, 1), (11, 1), (12, 1), (14, 1)],
  term ((15873657200 : Rat) / 150171761) [(2, 1), (3, 1), (4, 1), (11, 1), (12, 2)],
  term ((-31747314400 : Rat) / 150171761) [(2, 1), (3, 1), (4, 1), (11, 1), (13, 1), (15, 1)],
  term ((15873657200 : Rat) / 150171761) [(2, 1), (3, 1), (4, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 234 for generator 30. -/
theorem rs_R013_ueqv_R013YNNN_partial_30_0234_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_30_0234
        rs_R013_ueqv_R013YNNN_generator_30_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_30_0234 := by
  native_decide

/-- Coefficient term 235 from coefficient polynomial 30. -/
def rs_R013_ueqv_R013YNNN_coefficient_30_0235 : Poly :=
[
  term ((-764636829538773515 : Rat) / 1288183727709509) [(2, 1), (3, 1), (4, 1), (11, 2), (15, 1)]
]

/-- Partial product 235 for generator 30. -/
def rs_R013_ueqv_R013YNNN_partial_30_0235 : Poly :=
[
  term ((-1529273659077547030 : Rat) / 1288183727709509) [(2, 1), (3, 1), (4, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((764636829538773515 : Rat) / 1288183727709509) [(2, 1), (3, 1), (4, 1), (11, 2), (12, 2), (15, 1)],
  term ((-1529273659077547030 : Rat) / 1288183727709509) [(2, 1), (3, 1), (4, 1), (11, 2), (13, 1), (15, 2)],
  term ((764636829538773515 : Rat) / 1288183727709509) [(2, 1), (3, 1), (4, 1), (11, 2), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 235 for generator 30. -/
theorem rs_R013_ueqv_R013YNNN_partial_30_0235_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_30_0235
        rs_R013_ueqv_R013YNNN_generator_30_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_30_0235 := by
  native_decide

/-- Coefficient term 236 from coefficient polynomial 30. -/
def rs_R013_ueqv_R013YNNN_coefficient_30_0236 : Poly :=
[
  term ((-12926066884 : Rat) / 25734207) [(2, 1), (3, 1), (4, 1), (15, 1)]
]

/-- Partial product 236 for generator 30. -/
def rs_R013_ueqv_R013YNNN_partial_30_0236 : Poly :=
[
  term ((-25852133768 : Rat) / 25734207) [(2, 1), (3, 1), (4, 1), (12, 1), (14, 1), (15, 1)],
  term ((12926066884 : Rat) / 25734207) [(2, 1), (3, 1), (4, 1), (12, 2), (15, 1)],
  term ((-25852133768 : Rat) / 25734207) [(2, 1), (3, 1), (4, 1), (13, 1), (15, 2)],
  term ((12926066884 : Rat) / 25734207) [(2, 1), (3, 1), (4, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 236 for generator 30. -/
theorem rs_R013_ueqv_R013YNNN_partial_30_0236_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_30_0236
        rs_R013_ueqv_R013YNNN_generator_30_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_30_0236 := by
  native_decide

/-- Coefficient term 237 from coefficient polynomial 30. -/
def rs_R013_ueqv_R013YNNN_coefficient_30_0237 : Poly :=
[
  term ((-435180808400 : Rat) / 150171761) [(2, 1), (3, 1), (11, 1)]
]

/-- Partial product 237 for generator 30. -/
def rs_R013_ueqv_R013YNNN_partial_30_0237 : Poly :=
[
  term ((-870361616800 : Rat) / 150171761) [(2, 1), (3, 1), (11, 1), (12, 1), (14, 1)],
  term ((435180808400 : Rat) / 150171761) [(2, 1), (3, 1), (11, 1), (12, 2)],
  term ((-870361616800 : Rat) / 150171761) [(2, 1), (3, 1), (11, 1), (13, 1), (15, 1)],
  term ((435180808400 : Rat) / 150171761) [(2, 1), (3, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 237 for generator 30. -/
theorem rs_R013_ueqv_R013YNNN_partial_30_0237_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_30_0237
        rs_R013_ueqv_R013YNNN_generator_30_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_30_0237 := by
  native_decide

/-- Coefficient term 238 from coefficient polynomial 30. -/
def rs_R013_ueqv_R013YNNN_coefficient_30_0238 : Poly :=
[
  term ((-415631664000 : Rat) / 150171761) [(2, 1), (3, 1), (11, 1), (12, 1)]
]

/-- Partial product 238 for generator 30. -/
def rs_R013_ueqv_R013YNNN_partial_30_0238 : Poly :=
[
  term ((-831263328000 : Rat) / 150171761) [(2, 1), (3, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((415631664000 : Rat) / 150171761) [(2, 1), (3, 1), (11, 1), (12, 1), (13, 2)],
  term ((-831263328000 : Rat) / 150171761) [(2, 1), (3, 1), (11, 1), (12, 2), (14, 1)],
  term ((415631664000 : Rat) / 150171761) [(2, 1), (3, 1), (11, 1), (12, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 238 for generator 30. -/
theorem rs_R013_ueqv_R013YNNN_partial_30_0238_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_30_0238
        rs_R013_ueqv_R013YNNN_generator_30_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_30_0238 := by
  native_decide

/-- Coefficient term 239 from coefficient polynomial 30. -/
def rs_R013_ueqv_R013YNNN_coefficient_30_0239 : Poly :=
[
  term ((12476476400 : Rat) / 150171761) [(2, 1), (3, 1), (11, 1), (14, 1)]
]

/-- Partial product 239 for generator 30. -/
def rs_R013_ueqv_R013YNNN_partial_30_0239 : Poly :=
[
  term ((24952952800 : Rat) / 150171761) [(2, 1), (3, 1), (11, 1), (12, 1), (14, 2)],
  term ((-12476476400 : Rat) / 150171761) [(2, 1), (3, 1), (11, 1), (12, 2), (14, 1)],
  term ((24952952800 : Rat) / 150171761) [(2, 1), (3, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-12476476400 : Rat) / 150171761) [(2, 1), (3, 1), (11, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 239 for generator 30. -/
theorem rs_R013_ueqv_R013YNNN_partial_30_0239_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_30_0239
        rs_R013_ueqv_R013YNNN_generator_30_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_30_0239 := by
  native_decide

/-- Coefficient term 240 from coefficient polynomial 30. -/
def rs_R013_ueqv_R013YNNN_coefficient_30_0240 : Poly :=
[
  term ((-20021049579984931800 : Rat) / 1288183727709509) [(2, 1), (3, 1), (11, 2), (12, 1), (15, 1)]
]

/-- Partial product 240 for generator 30. -/
def rs_R013_ueqv_R013YNNN_partial_30_0240 : Poly :=
[
  term ((-40042099159969863600 : Rat) / 1288183727709509) [(2, 1), (3, 1), (11, 2), (12, 1), (13, 1), (15, 2)],
  term ((20021049579984931800 : Rat) / 1288183727709509) [(2, 1), (3, 1), (11, 2), (12, 1), (13, 2), (15, 1)],
  term ((-40042099159969863600 : Rat) / 1288183727709509) [(2, 1), (3, 1), (11, 2), (12, 2), (14, 1), (15, 1)],
  term ((20021049579984931800 : Rat) / 1288183727709509) [(2, 1), (3, 1), (11, 2), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 240 for generator 30. -/
theorem rs_R013_ueqv_R013YNNN_partial_30_0240_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_30_0240
        rs_R013_ueqv_R013YNNN_generator_30_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_30_0240 := by
  native_decide

/-- Coefficient term 241 from coefficient polynomial 30. -/
def rs_R013_ueqv_R013YNNN_coefficient_30_0241 : Poly :=
[
  term ((600994039250849555 : Rat) / 1288183727709509) [(2, 1), (3, 1), (11, 2), (14, 1), (15, 1)]
]

/-- Partial product 241 for generator 30. -/
def rs_R013_ueqv_R013YNNN_partial_30_0241 : Poly :=
[
  term ((1201988078501699110 : Rat) / 1288183727709509) [(2, 1), (3, 1), (11, 2), (12, 1), (14, 2), (15, 1)],
  term ((-600994039250849555 : Rat) / 1288183727709509) [(2, 1), (3, 1), (11, 2), (12, 2), (14, 1), (15, 1)],
  term ((1201988078501699110 : Rat) / 1288183727709509) [(2, 1), (3, 1), (11, 2), (13, 1), (14, 1), (15, 2)],
  term ((-600994039250849555 : Rat) / 1288183727709509) [(2, 1), (3, 1), (11, 2), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 241 for generator 30. -/
theorem rs_R013_ueqv_R013YNNN_partial_30_0241_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_30_0241
        rs_R013_ueqv_R013YNNN_generator_30_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_30_0241 := by
  native_decide

/-- Coefficient term 242 from coefficient polynomial 30. -/
def rs_R013_ueqv_R013YNNN_coefficient_30_0242 : Poly :=
[
  term ((-20962735267528421705 : Rat) / 1288183727709509) [(2, 1), (3, 1), (11, 2), (15, 1)]
]

/-- Partial product 242 for generator 30. -/
def rs_R013_ueqv_R013YNNN_partial_30_0242 : Poly :=
[
  term ((-41925470535056843410 : Rat) / 1288183727709509) [(2, 1), (3, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((20962735267528421705 : Rat) / 1288183727709509) [(2, 1), (3, 1), (11, 2), (12, 2), (15, 1)],
  term ((-41925470535056843410 : Rat) / 1288183727709509) [(2, 1), (3, 1), (11, 2), (13, 1), (15, 2)],
  term ((20962735267528421705 : Rat) / 1288183727709509) [(2, 1), (3, 1), (11, 2), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 242 for generator 30. -/
theorem rs_R013_ueqv_R013YNNN_partial_30_0242_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_30_0242
        rs_R013_ueqv_R013YNNN_generator_30_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_30_0242 := by
  native_decide

/-- Coefficient term 243 from coefficient polynomial 30. -/
def rs_R013_ueqv_R013YNNN_coefficient_30_0243 : Poly :=
[
  term ((-33018305440 : Rat) / 8578069) [(2, 1), (3, 1), (12, 1), (15, 1)]
]

/-- Partial product 243 for generator 30. -/
def rs_R013_ueqv_R013YNNN_partial_30_0243 : Poly :=
[
  term ((-66036610880 : Rat) / 8578069) [(2, 1), (3, 1), (12, 1), (13, 1), (15, 2)],
  term ((33018305440 : Rat) / 8578069) [(2, 1), (3, 1), (12, 1), (13, 2), (15, 1)],
  term ((-66036610880 : Rat) / 8578069) [(2, 1), (3, 1), (12, 2), (14, 1), (15, 1)],
  term ((33018305440 : Rat) / 8578069) [(2, 1), (3, 1), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 243 for generator 30. -/
theorem rs_R013_ueqv_R013YNNN_partial_30_0243_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_30_0243
        rs_R013_ueqv_R013YNNN_generator_30_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_30_0243 := by
  native_decide

/-- Coefficient term 244 from coefficient polynomial 30. -/
def rs_R013_ueqv_R013YNNN_coefficient_30_0244 : Poly :=
[
  term ((8342117668 : Rat) / 25734207) [(2, 1), (3, 1), (14, 1), (15, 1)]
]

/-- Partial product 244 for generator 30. -/
def rs_R013_ueqv_R013YNNN_partial_30_0244 : Poly :=
[
  term ((16684235336 : Rat) / 25734207) [(2, 1), (3, 1), (12, 1), (14, 2), (15, 1)],
  term ((-8342117668 : Rat) / 25734207) [(2, 1), (3, 1), (12, 2), (14, 1), (15, 1)],
  term ((16684235336 : Rat) / 25734207) [(2, 1), (3, 1), (13, 1), (14, 1), (15, 2)],
  term ((-8342117668 : Rat) / 25734207) [(2, 1), (3, 1), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 244 for generator 30. -/
theorem rs_R013_ueqv_R013YNNN_partial_30_0244_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_30_0244
        rs_R013_ueqv_R013YNNN_generator_30_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_30_0244 := by
  native_decide

/-- Coefficient term 245 from coefficient polynomial 30. -/
def rs_R013_ueqv_R013YNNN_coefficient_30_0245 : Poly :=
[
  term ((-93090311548 : Rat) / 25734207) [(2, 1), (3, 1), (15, 1)]
]

/-- Partial product 245 for generator 30. -/
def rs_R013_ueqv_R013YNNN_partial_30_0245 : Poly :=
[
  term ((-186180623096 : Rat) / 25734207) [(2, 1), (3, 1), (12, 1), (14, 1), (15, 1)],
  term ((93090311548 : Rat) / 25734207) [(2, 1), (3, 1), (12, 2), (15, 1)],
  term ((-186180623096 : Rat) / 25734207) [(2, 1), (3, 1), (13, 1), (15, 2)],
  term ((93090311548 : Rat) / 25734207) [(2, 1), (3, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 245 for generator 30. -/
theorem rs_R013_ueqv_R013YNNN_partial_30_0245_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_30_0245
        rs_R013_ueqv_R013YNNN_generator_30_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_30_0245 := by
  native_decide

/-- Coefficient term 246 from coefficient polynomial 30. -/
def rs_R013_ueqv_R013YNNN_coefficient_30_0246 : Poly :=
[
  term ((-13422316800 : Rat) / 150171761) [(2, 1), (4, 1), (7, 1), (11, 1)]
]

/-- Partial product 246 for generator 30. -/
def rs_R013_ueqv_R013YNNN_partial_30_0246 : Poly :=
[
  term ((-26844633600 : Rat) / 150171761) [(2, 1), (4, 1), (7, 1), (11, 1), (12, 1), (14, 1)],
  term ((13422316800 : Rat) / 150171761) [(2, 1), (4, 1), (7, 1), (11, 1), (12, 2)],
  term ((-26844633600 : Rat) / 150171761) [(2, 1), (4, 1), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((13422316800 : Rat) / 150171761) [(2, 1), (4, 1), (7, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 246 for generator 30. -/
theorem rs_R013_ueqv_R013YNNN_partial_30_0246_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_30_0246
        rs_R013_ueqv_R013YNNN_generator_30_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_30_0246 := by
  native_decide

/-- Coefficient term 247 from coefficient polynomial 30. -/
def rs_R013_ueqv_R013YNNN_coefficient_30_0247 : Poly :=
[
  term ((-646555335906902160 : Rat) / 1288183727709509) [(2, 1), (4, 1), (7, 1), (11, 2), (15, 1)]
]

/-- Partial product 247 for generator 30. -/
def rs_R013_ueqv_R013YNNN_partial_30_0247 : Poly :=
[
  term ((-1293110671813804320 : Rat) / 1288183727709509) [(2, 1), (4, 1), (7, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((646555335906902160 : Rat) / 1288183727709509) [(2, 1), (4, 1), (7, 1), (11, 2), (12, 2), (15, 1)],
  term ((-1293110671813804320 : Rat) / 1288183727709509) [(2, 1), (4, 1), (7, 1), (11, 2), (13, 1), (15, 2)],
  term ((646555335906902160 : Rat) / 1288183727709509) [(2, 1), (4, 1), (7, 1), (11, 2), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 247 for generator 30. -/
theorem rs_R013_ueqv_R013YNNN_partial_30_0247_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_30_0247
        rs_R013_ueqv_R013YNNN_generator_30_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_30_0247 := by
  native_decide

/-- Coefficient term 248 from coefficient polynomial 30. -/
def rs_R013_ueqv_R013YNNN_coefficient_30_0248 : Poly :=
[
  term ((541374848 : Rat) / 8578069) [(2, 1), (4, 1), (7, 1), (15, 1)]
]

/-- Partial product 248 for generator 30. -/
def rs_R013_ueqv_R013YNNN_partial_30_0248 : Poly :=
[
  term ((1082749696 : Rat) / 8578069) [(2, 1), (4, 1), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((-541374848 : Rat) / 8578069) [(2, 1), (4, 1), (7, 1), (12, 2), (15, 1)],
  term ((1082749696 : Rat) / 8578069) [(2, 1), (4, 1), (7, 1), (13, 1), (15, 2)],
  term ((-541374848 : Rat) / 8578069) [(2, 1), (4, 1), (7, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 248 for generator 30. -/
theorem rs_R013_ueqv_R013YNNN_partial_30_0248_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_30_0248
        rs_R013_ueqv_R013YNNN_generator_30_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_30_0248 := by
  native_decide

/-- Coefficient term 249 from coefficient polynomial 30. -/
def rs_R013_ueqv_R013YNNN_coefficient_30_0249 : Poly :=
[
  term ((-259185746400 : Rat) / 150171761) [(2, 1), (4, 1), (11, 1), (13, 1)]
]

/-- Partial product 249 for generator 30. -/
def rs_R013_ueqv_R013YNNN_partial_30_0249 : Poly :=
[
  term ((-518371492800 : Rat) / 150171761) [(2, 1), (4, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((259185746400 : Rat) / 150171761) [(2, 1), (4, 1), (11, 1), (12, 2), (13, 1)],
  term ((-518371492800 : Rat) / 150171761) [(2, 1), (4, 1), (11, 1), (13, 2), (15, 1)],
  term ((259185746400 : Rat) / 150171761) [(2, 1), (4, 1), (11, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 249 for generator 30. -/
theorem rs_R013_ueqv_R013YNNN_partial_30_0249_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_30_0249
        rs_R013_ueqv_R013YNNN_generator_30_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_30_0249 := by
  native_decide

/-- Coefficient term 250 from coefficient polynomial 30. -/
def rs_R013_ueqv_R013YNNN_coefficient_30_0250 : Poly :=
[
  term ((-27832625600 : Rat) / 150171761) [(2, 1), (4, 1), (11, 1), (15, 1)]
]

/-- Partial product 250 for generator 30. -/
def rs_R013_ueqv_R013YNNN_partial_30_0250 : Poly :=
[
  term ((-55665251200 : Rat) / 150171761) [(2, 1), (4, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((27832625600 : Rat) / 150171761) [(2, 1), (4, 1), (11, 1), (12, 2), (15, 1)],
  term ((-55665251200 : Rat) / 150171761) [(2, 1), (4, 1), (11, 1), (13, 1), (15, 2)],
  term ((27832625600 : Rat) / 150171761) [(2, 1), (4, 1), (11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 250 for generator 30. -/
theorem rs_R013_ueqv_R013YNNN_partial_30_0250_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_30_0250
        rs_R013_ueqv_R013YNNN_generator_30_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_30_0250 := by
  native_decide

/-- Coefficient term 251 from coefficient polynomial 30. -/
def rs_R013_ueqv_R013YNNN_coefficient_30_0251 : Poly :=
[
  term ((-12485022505647695430 : Rat) / 1288183727709509) [(2, 1), (4, 1), (11, 2), (13, 1), (15, 1)]
]

/-- Partial product 251 for generator 30. -/
def rs_R013_ueqv_R013YNNN_partial_30_0251 : Poly :=
[
  term ((-24970045011295390860 : Rat) / 1288183727709509) [(2, 1), (4, 1), (11, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((12485022505647695430 : Rat) / 1288183727709509) [(2, 1), (4, 1), (11, 2), (12, 2), (13, 1), (15, 1)],
  term ((-24970045011295390860 : Rat) / 1288183727709509) [(2, 1), (4, 1), (11, 2), (13, 2), (15, 2)],
  term ((12485022505647695430 : Rat) / 1288183727709509) [(2, 1), (4, 1), (11, 2), (13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 251 for generator 30. -/
theorem rs_R013_ueqv_R013YNNN_partial_30_0251_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_30_0251
        rs_R013_ueqv_R013YNNN_generator_30_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_30_0251 := by
  native_decide

/-- Coefficient term 252 from coefficient polynomial 30. -/
def rs_R013_ueqv_R013YNNN_coefficient_30_0252 : Poly :=
[
  term ((-1340702418376762220 : Rat) / 1288183727709509) [(2, 1), (4, 1), (11, 2), (15, 2)]
]

/-- Partial product 252 for generator 30. -/
def rs_R013_ueqv_R013YNNN_partial_30_0252 : Poly :=
[
  term ((-2681404836753524440 : Rat) / 1288183727709509) [(2, 1), (4, 1), (11, 2), (12, 1), (14, 1), (15, 2)],
  term ((1340702418376762220 : Rat) / 1288183727709509) [(2, 1), (4, 1), (11, 2), (12, 2), (15, 2)],
  term ((-2681404836753524440 : Rat) / 1288183727709509) [(2, 1), (4, 1), (11, 2), (13, 1), (15, 3)],
  term ((1340702418376762220 : Rat) / 1288183727709509) [(2, 1), (4, 1), (11, 2), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 252 for generator 30. -/
theorem rs_R013_ueqv_R013YNNN_partial_30_0252_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_30_0252
        rs_R013_ueqv_R013YNNN_generator_30_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_30_0252 := by
  native_decide

/-- Coefficient term 253 from coefficient polynomial 30. -/
def rs_R013_ueqv_R013YNNN_coefficient_30_0253 : Poly :=
[
  term ((-21751615576 : Rat) / 8578069) [(2, 1), (4, 1), (13, 1), (15, 1)]
]

/-- Partial product 253 for generator 30. -/
def rs_R013_ueqv_R013YNNN_partial_30_0253 : Poly :=
[
  term ((-43503231152 : Rat) / 8578069) [(2, 1), (4, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((21751615576 : Rat) / 8578069) [(2, 1), (4, 1), (12, 2), (13, 1), (15, 1)],
  term ((-43503231152 : Rat) / 8578069) [(2, 1), (4, 1), (13, 2), (15, 2)],
  term ((21751615576 : Rat) / 8578069) [(2, 1), (4, 1), (13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 253 for generator 30. -/
theorem rs_R013_ueqv_R013YNNN_partial_30_0253_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_30_0253
        rs_R013_ueqv_R013YNNN_generator_30_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_30_0253 := by
  native_decide

/-- Coefficient term 254 from coefficient polynomial 30. -/
def rs_R013_ueqv_R013YNNN_coefficient_30_0254 : Poly :=
[
  term ((-10314168592 : Rat) / 25734207) [(2, 1), (4, 1), (15, 2)]
]

/-- Partial product 254 for generator 30. -/
def rs_R013_ueqv_R013YNNN_partial_30_0254 : Poly :=
[
  term ((-20628337184 : Rat) / 25734207) [(2, 1), (4, 1), (12, 1), (14, 1), (15, 2)],
  term ((10314168592 : Rat) / 25734207) [(2, 1), (4, 1), (12, 2), (15, 2)],
  term ((-20628337184 : Rat) / 25734207) [(2, 1), (4, 1), (13, 1), (15, 3)],
  term ((10314168592 : Rat) / 25734207) [(2, 1), (4, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 254 for generator 30. -/
theorem rs_R013_ueqv_R013YNNN_partial_30_0254_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_30_0254
        rs_R013_ueqv_R013YNNN_generator_30_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_30_0254 := by
  native_decide

/-- Coefficient term 255 from coefficient polynomial 30. -/
def rs_R013_ueqv_R013YNNN_coefficient_30_0255 : Poly :=
[
  term ((4436000000 : Rat) / 6529207) [(2, 1), (5, 1), (11, 1)]
]

/-- Partial product 255 for generator 30. -/
def rs_R013_ueqv_R013YNNN_partial_30_0255 : Poly :=
[
  term ((8872000000 : Rat) / 6529207) [(2, 1), (5, 1), (11, 1), (12, 1), (14, 1)],
  term ((-4436000000 : Rat) / 6529207) [(2, 1), (5, 1), (11, 1), (12, 2)],
  term ((8872000000 : Rat) / 6529207) [(2, 1), (5, 1), (11, 1), (13, 1), (15, 1)],
  term ((-4436000000 : Rat) / 6529207) [(2, 1), (5, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 255 for generator 30. -/
theorem rs_R013_ueqv_R013YNNN_partial_30_0255_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_30_0255
        rs_R013_ueqv_R013YNNN_generator_30_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_30_0255 := by
  native_decide

/-- Coefficient term 256 from coefficient polynomial 30. -/
def rs_R013_ueqv_R013YNNN_coefficient_30_0256 : Poly :=
[
  term ((236003993200 : Rat) / 150171761) [(2, 1), (5, 1), (11, 1), (12, 1)]
]

/-- Partial product 256 for generator 30. -/
def rs_R013_ueqv_R013YNNN_partial_30_0256 : Poly :=
[
  term ((472007986400 : Rat) / 150171761) [(2, 1), (5, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-236003993200 : Rat) / 150171761) [(2, 1), (5, 1), (11, 1), (12, 1), (13, 2)],
  term ((472007986400 : Rat) / 150171761) [(2, 1), (5, 1), (11, 1), (12, 2), (14, 1)],
  term ((-236003993200 : Rat) / 150171761) [(2, 1), (5, 1), (11, 1), (12, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 256 for generator 30. -/
theorem rs_R013_ueqv_R013YNNN_partial_30_0256_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_30_0256
        rs_R013_ueqv_R013YNNN_generator_30_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_30_0256 := by
  native_decide

/-- Coefficient term 257 from coefficient polynomial 30. -/
def rs_R013_ueqv_R013YNNN_coefficient_30_0257 : Poly :=
[
  term ((-76033158400 : Rat) / 150171761) [(2, 1), (5, 1), (11, 1), (14, 1)]
]

/-- Partial product 257 for generator 30. -/
def rs_R013_ueqv_R013YNNN_partial_30_0257 : Poly :=
[
  term ((-152066316800 : Rat) / 150171761) [(2, 1), (5, 1), (11, 1), (12, 1), (14, 2)],
  term ((76033158400 : Rat) / 150171761) [(2, 1), (5, 1), (11, 1), (12, 2), (14, 1)],
  term ((-152066316800 : Rat) / 150171761) [(2, 1), (5, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((76033158400 : Rat) / 150171761) [(2, 1), (5, 1), (11, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 257 for generator 30. -/
theorem rs_R013_ueqv_R013YNNN_partial_30_0257_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_30_0257
        rs_R013_ueqv_R013YNNN_generator_30_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_30_0257 := by
  native_decide

/-- Coefficient term 258 from coefficient polynomial 30. -/
def rs_R013_ueqv_R013YNNN_coefficient_30_0258 : Poly :=
[
  term ((11368353420088866715 : Rat) / 1288183727709509) [(2, 1), (5, 1), (11, 2), (12, 1), (15, 1)]
]

/-- Partial product 258 for generator 30. -/
def rs_R013_ueqv_R013YNNN_partial_30_0258 : Poly :=
[
  term ((22736706840177733430 : Rat) / 1288183727709509) [(2, 1), (5, 1), (11, 2), (12, 1), (13, 1), (15, 2)],
  term ((-11368353420088866715 : Rat) / 1288183727709509) [(2, 1), (5, 1), (11, 2), (12, 1), (13, 2), (15, 1)],
  term ((22736706840177733430 : Rat) / 1288183727709509) [(2, 1), (5, 1), (11, 2), (12, 2), (14, 1), (15, 1)],
  term ((-11368353420088866715 : Rat) / 1288183727709509) [(2, 1), (5, 1), (11, 2), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 258 for generator 30. -/
theorem rs_R013_ueqv_R013YNNN_partial_30_0258_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_30_0258
        rs_R013_ueqv_R013YNNN_generator_30_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_30_0258 := by
  native_decide

/-- Coefficient term 259 from coefficient polynomial 30. -/
def rs_R013_ueqv_R013YNNN_coefficient_30_0259 : Poly :=
[
  term ((-62076787641491120 : Rat) / 21833622503551) [(2, 1), (5, 1), (11, 2), (14, 1), (15, 1)]
]

/-- Partial product 259 for generator 30. -/
def rs_R013_ueqv_R013YNNN_partial_30_0259 : Poly :=
[
  term ((-124153575282982240 : Rat) / 21833622503551) [(2, 1), (5, 1), (11, 2), (12, 1), (14, 2), (15, 1)],
  term ((62076787641491120 : Rat) / 21833622503551) [(2, 1), (5, 1), (11, 2), (12, 2), (14, 1), (15, 1)],
  term ((-124153575282982240 : Rat) / 21833622503551) [(2, 1), (5, 1), (11, 2), (13, 1), (14, 1), (15, 2)],
  term ((62076787641491120 : Rat) / 21833622503551) [(2, 1), (5, 1), (11, 2), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 259 for generator 30. -/
theorem rs_R013_ueqv_R013YNNN_partial_30_0259_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_30_0259
        rs_R013_ueqv_R013YNNN_generator_30_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_30_0259 := by
  native_decide

/-- Coefficient term 260 from coefficient polynomial 30. -/
def rs_R013_ueqv_R013YNNN_coefficient_30_0260 : Poly :=
[
  term ((213682891919450000 : Rat) / 56007988161283) [(2, 1), (5, 1), (11, 2), (15, 1)]
]

/-- Partial product 260 for generator 30. -/
def rs_R013_ueqv_R013YNNN_partial_30_0260 : Poly :=
[
  term ((427365783838900000 : Rat) / 56007988161283) [(2, 1), (5, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((-213682891919450000 : Rat) / 56007988161283) [(2, 1), (5, 1), (11, 2), (12, 2), (15, 1)],
  term ((427365783838900000 : Rat) / 56007988161283) [(2, 1), (5, 1), (11, 2), (13, 1), (15, 2)],
  term ((-213682891919450000 : Rat) / 56007988161283) [(2, 1), (5, 1), (11, 2), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 260 for generator 30. -/
theorem rs_R013_ueqv_R013YNNN_partial_30_0260_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_30_0260
        rs_R013_ueqv_R013YNNN_generator_30_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_30_0260 := by
  native_decide

/-- Coefficient term 261 from coefficient polynomial 30. -/
def rs_R013_ueqv_R013YNNN_coefficient_30_0261 : Poly :=
[
  term ((92840109284 : Rat) / 25734207) [(2, 1), (5, 1), (12, 1), (15, 1)]
]

/-- Partial product 261 for generator 30. -/
def rs_R013_ueqv_R013YNNN_partial_30_0261 : Poly :=
[
  term ((185680218568 : Rat) / 25734207) [(2, 1), (5, 1), (12, 1), (13, 1), (15, 2)],
  term ((-92840109284 : Rat) / 25734207) [(2, 1), (5, 1), (12, 1), (13, 2), (15, 1)],
  term ((185680218568 : Rat) / 25734207) [(2, 1), (5, 1), (12, 2), (14, 1), (15, 1)],
  term ((-92840109284 : Rat) / 25734207) [(2, 1), (5, 1), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 261 for generator 30. -/
theorem rs_R013_ueqv_R013YNNN_partial_30_0261_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_30_0261
        rs_R013_ueqv_R013YNNN_generator_30_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_30_0261 := by
  native_decide

/-- Coefficient term 262 from coefficient polynomial 30. -/
def rs_R013_ueqv_R013YNNN_coefficient_30_0262 : Poly :=
[
  term ((107563328 : Rat) / 436173) [(2, 1), (5, 1), (14, 1), (15, 1)]
]

/-- Partial product 262 for generator 30. -/
def rs_R013_ueqv_R013YNNN_partial_30_0262 : Poly :=
[
  term ((215126656 : Rat) / 436173) [(2, 1), (5, 1), (12, 1), (14, 2), (15, 1)],
  term ((-107563328 : Rat) / 436173) [(2, 1), (5, 1), (12, 2), (14, 1), (15, 1)],
  term ((215126656 : Rat) / 436173) [(2, 1), (5, 1), (13, 1), (14, 1), (15, 2)],
  term ((-107563328 : Rat) / 436173) [(2, 1), (5, 1), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 262 for generator 30. -/
theorem rs_R013_ueqv_R013YNNN_partial_30_0262_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_30_0262
        rs_R013_ueqv_R013YNNN_generator_30_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_30_0262 := by
  native_decide

/-- Coefficient term 263 from coefficient polynomial 30. -/
def rs_R013_ueqv_R013YNNN_coefficient_30_0263 : Poly :=
[
  term ((25783664960 : Rat) / 25734207) [(2, 1), (5, 1), (15, 1)]
]

/-- Partial product 263 for generator 30. -/
def rs_R013_ueqv_R013YNNN_partial_30_0263 : Poly :=
[
  term ((51567329920 : Rat) / 25734207) [(2, 1), (5, 1), (12, 1), (14, 1), (15, 1)],
  term ((-25783664960 : Rat) / 25734207) [(2, 1), (5, 1), (12, 2), (15, 1)],
  term ((51567329920 : Rat) / 25734207) [(2, 1), (5, 1), (13, 1), (15, 2)],
  term ((-25783664960 : Rat) / 25734207) [(2, 1), (5, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 263 for generator 30. -/
theorem rs_R013_ueqv_R013YNNN_partial_30_0263_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_30_0263
        rs_R013_ueqv_R013YNNN_generator_30_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_30_0263 := by
  native_decide

/-- Coefficient term 264 from coefficient polynomial 30. -/
def rs_R013_ueqv_R013YNNN_coefficient_30_0264 : Poly :=
[
  term ((96765103600 : Rat) / 150171761) [(2, 1), (7, 1), (11, 1)]
]

/-- Partial product 264 for generator 30. -/
def rs_R013_ueqv_R013YNNN_partial_30_0264 : Poly :=
[
  term ((193530207200 : Rat) / 150171761) [(2, 1), (7, 1), (11, 1), (12, 1), (14, 1)],
  term ((-96765103600 : Rat) / 150171761) [(2, 1), (7, 1), (11, 1), (12, 2)],
  term ((193530207200 : Rat) / 150171761) [(2, 1), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((-96765103600 : Rat) / 150171761) [(2, 1), (7, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 264 for generator 30. -/
theorem rs_R013_ueqv_R013YNNN_partial_30_0264_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_30_0264
        rs_R013_ueqv_R013YNNN_generator_30_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_30_0264 := by
  native_decide

/-- Coefficient term 265 from coefficient polynomial 30. -/
def rs_R013_ueqv_R013YNNN_coefficient_30_0265 : Poly :=
[
  term ((-20732281800 : Rat) / 150171761) [(2, 1), (7, 1), (11, 1), (12, 1)]
]

/-- Partial product 265 for generator 30. -/
def rs_R013_ueqv_R013YNNN_partial_30_0265 : Poly :=
[
  term ((-41464563600 : Rat) / 150171761) [(2, 1), (7, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((20732281800 : Rat) / 150171761) [(2, 1), (7, 1), (11, 1), (12, 1), (13, 2)],
  term ((-41464563600 : Rat) / 150171761) [(2, 1), (7, 1), (11, 1), (12, 2), (14, 1)],
  term ((20732281800 : Rat) / 150171761) [(2, 1), (7, 1), (11, 1), (12, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 265 for generator 30. -/
theorem rs_R013_ueqv_R013YNNN_partial_30_0265_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_30_0265
        rs_R013_ueqv_R013YNNN_generator_30_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_30_0265 := by
  native_decide

/-- Coefficient term 266 from coefficient polynomial 30. -/
def rs_R013_ueqv_R013YNNN_coefficient_30_0266 : Poly :=
[
  term ((15669817600 : Rat) / 150171761) [(2, 1), (7, 1), (11, 1), (14, 1)]
]

/-- Partial product 266 for generator 30. -/
def rs_R013_ueqv_R013YNNN_partial_30_0266 : Poly :=
[
  term ((31339635200 : Rat) / 150171761) [(2, 1), (7, 1), (11, 1), (12, 1), (14, 2)],
  term ((-15669817600 : Rat) / 150171761) [(2, 1), (7, 1), (11, 1), (12, 2), (14, 1)],
  term ((31339635200 : Rat) / 150171761) [(2, 1), (7, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-15669817600 : Rat) / 150171761) [(2, 1), (7, 1), (11, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 266 for generator 30. -/
theorem rs_R013_ueqv_R013YNNN_partial_30_0266_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_30_0266
        rs_R013_ueqv_R013YNNN_generator_30_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_30_0266 := by
  native_decide

/-- Coefficient term 267 from coefficient polynomial 30. -/
def rs_R013_ueqv_R013YNNN_coefficient_30_0267 : Poly :=
[
  term ((-1997355243964373445 : Rat) / 2576367455419018) [(2, 1), (7, 1), (11, 2), (12, 1), (15, 1)]
]

/-- Partial product 267 for generator 30. -/
def rs_R013_ueqv_R013YNNN_partial_30_0267 : Poly :=
[
  term ((-1997355243964373445 : Rat) / 1288183727709509) [(2, 1), (7, 1), (11, 2), (12, 1), (13, 1), (15, 2)],
  term ((1997355243964373445 : Rat) / 2576367455419018) [(2, 1), (7, 1), (11, 2), (12, 1), (13, 2), (15, 1)],
  term ((-1997355243964373445 : Rat) / 1288183727709509) [(2, 1), (7, 1), (11, 2), (12, 2), (14, 1), (15, 1)],
  term ((1997355243964373445 : Rat) / 2576367455419018) [(2, 1), (7, 1), (11, 2), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 267 for generator 30. -/
theorem rs_R013_ueqv_R013YNNN_partial_30_0267_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_30_0267
        rs_R013_ueqv_R013YNNN_generator_30_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_30_0267 := by
  native_decide

/-- Coefficient term 268 from coefficient polynomial 30. -/
def rs_R013_ueqv_R013YNNN_coefficient_30_0268 : Poly :=
[
  term ((754817840536135120 : Rat) / 1288183727709509) [(2, 1), (7, 1), (11, 2), (14, 1), (15, 1)]
]

/-- Partial product 268 for generator 30. -/
def rs_R013_ueqv_R013YNNN_partial_30_0268 : Poly :=
[
  term ((1509635681072270240 : Rat) / 1288183727709509) [(2, 1), (7, 1), (11, 2), (12, 1), (14, 2), (15, 1)],
  term ((-754817840536135120 : Rat) / 1288183727709509) [(2, 1), (7, 1), (11, 2), (12, 2), (14, 1), (15, 1)],
  term ((1509635681072270240 : Rat) / 1288183727709509) [(2, 1), (7, 1), (11, 2), (13, 1), (14, 1), (15, 2)],
  term ((-754817840536135120 : Rat) / 1288183727709509) [(2, 1), (7, 1), (11, 2), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 268 for generator 30. -/
theorem rs_R013_ueqv_R013YNNN_partial_30_0268_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_30_0268
        rs_R013_ueqv_R013YNNN_generator_30_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_30_0268 := by
  native_decide

/-- Coefficient term 269 from coefficient polynomial 30. -/
def rs_R013_ueqv_R013YNNN_coefficient_30_0269 : Poly :=
[
  term ((4661191878749590195 : Rat) / 1288183727709509) [(2, 1), (7, 1), (11, 2), (15, 1)]
]

/-- Partial product 269 for generator 30. -/
def rs_R013_ueqv_R013YNNN_partial_30_0269 : Poly :=
[
  term ((9322383757499180390 : Rat) / 1288183727709509) [(2, 1), (7, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((-4661191878749590195 : Rat) / 1288183727709509) [(2, 1), (7, 1), (11, 2), (12, 2), (15, 1)],
  term ((9322383757499180390 : Rat) / 1288183727709509) [(2, 1), (7, 1), (11, 2), (13, 1), (15, 2)],
  term ((-4661191878749590195 : Rat) / 1288183727709509) [(2, 1), (7, 1), (11, 2), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 269 for generator 30. -/
theorem rs_R013_ueqv_R013YNNN_partial_30_0269_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_30_0269
        rs_R013_ueqv_R013YNNN_generator_30_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_30_0269 := by
  native_decide

/-- Coefficient term 270 from coefficient polynomial 30. -/
def rs_R013_ueqv_R013YNNN_coefficient_30_0270 : Poly :=
[
  term ((-2186581802 : Rat) / 8578069) [(2, 1), (7, 1), (12, 1), (15, 1)]
]

/-- Partial product 270 for generator 30. -/
def rs_R013_ueqv_R013YNNN_partial_30_0270 : Poly :=
[
  term ((-4373163604 : Rat) / 8578069) [(2, 1), (7, 1), (12, 1), (13, 1), (15, 2)],
  term ((2186581802 : Rat) / 8578069) [(2, 1), (7, 1), (12, 1), (13, 2), (15, 1)],
  term ((-4373163604 : Rat) / 8578069) [(2, 1), (7, 1), (12, 2), (14, 1), (15, 1)],
  term ((2186581802 : Rat) / 8578069) [(2, 1), (7, 1), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 270 for generator 30. -/
theorem rs_R013_ueqv_R013YNNN_partial_30_0270_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_30_0270
        rs_R013_ueqv_R013YNNN_generator_30_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_30_0270 := by
  native_decide

/-- Coefficient term 271 from coefficient polynomial 30. -/
def rs_R013_ueqv_R013YNNN_coefficient_30_0271 : Poly :=
[
  term ((-12808589248 : Rat) / 25734207) [(2, 1), (7, 1), (14, 1), (15, 1)]
]

/-- Partial product 271 for generator 30. -/
def rs_R013_ueqv_R013YNNN_partial_30_0271 : Poly :=
[
  term ((-25617178496 : Rat) / 25734207) [(2, 1), (7, 1), (12, 1), (14, 2), (15, 1)],
  term ((12808589248 : Rat) / 25734207) [(2, 1), (7, 1), (12, 2), (14, 1), (15, 1)],
  term ((-25617178496 : Rat) / 25734207) [(2, 1), (7, 1), (13, 1), (14, 1), (15, 2)],
  term ((12808589248 : Rat) / 25734207) [(2, 1), (7, 1), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 271 for generator 30. -/
theorem rs_R013_ueqv_R013YNNN_partial_30_0271_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_30_0271
        rs_R013_ueqv_R013YNNN_generator_30_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_30_0271 := by
  native_decide

/-- Coefficient term 272 from coefficient polynomial 30. -/
def rs_R013_ueqv_R013YNNN_coefficient_30_0272 : Poly :=
[
  term ((-7204093468 : Rat) / 25734207) [(2, 1), (7, 1), (15, 1)]
]

/-- Partial product 272 for generator 30. -/
def rs_R013_ueqv_R013YNNN_partial_30_0272 : Poly :=
[
  term ((-14408186936 : Rat) / 25734207) [(2, 1), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((7204093468 : Rat) / 25734207) [(2, 1), (7, 1), (12, 2), (15, 1)],
  term ((-14408186936 : Rat) / 25734207) [(2, 1), (7, 1), (13, 1), (15, 2)],
  term ((7204093468 : Rat) / 25734207) [(2, 1), (7, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 272 for generator 30. -/
theorem rs_R013_ueqv_R013YNNN_partial_30_0272_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_30_0272
        rs_R013_ueqv_R013YNNN_generator_30_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_30_0272 := by
  native_decide

/-- Coefficient term 273 from coefficient polynomial 30. -/
def rs_R013_ueqv_R013YNNN_coefficient_30_0273 : Poly :=
[
  term ((38554118400 : Rat) / 150171761) [(2, 1), (9, 1), (10, 1), (11, 1)]
]

/-- Partial product 273 for generator 30. -/
def rs_R013_ueqv_R013YNNN_partial_30_0273 : Poly :=
[
  term ((77108236800 : Rat) / 150171761) [(2, 1), (9, 1), (10, 1), (11, 1), (12, 1), (14, 1)],
  term ((-38554118400 : Rat) / 150171761) [(2, 1), (9, 1), (10, 1), (11, 1), (12, 2)],
  term ((77108236800 : Rat) / 150171761) [(2, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-38554118400 : Rat) / 150171761) [(2, 1), (9, 1), (10, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 273 for generator 30. -/
theorem rs_R013_ueqv_R013YNNN_partial_30_0273_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_30_0273
        rs_R013_ueqv_R013YNNN_generator_30_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_30_0273 := by
  native_decide

/-- Coefficient term 274 from coefficient polynomial 30. -/
def rs_R013_ueqv_R013YNNN_coefficient_30_0274 : Poly :=
[
  term ((1857158592226528080 : Rat) / 1288183727709509) [(2, 1), (9, 1), (10, 1), (11, 2), (15, 1)]
]

/-- Partial product 274 for generator 30. -/
def rs_R013_ueqv_R013YNNN_partial_30_0274 : Poly :=
[
  term ((3714317184453056160 : Rat) / 1288183727709509) [(2, 1), (9, 1), (10, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((-1857158592226528080 : Rat) / 1288183727709509) [(2, 1), (9, 1), (10, 1), (11, 2), (12, 2), (15, 1)],
  term ((3714317184453056160 : Rat) / 1288183727709509) [(2, 1), (9, 1), (10, 1), (11, 2), (13, 1), (15, 2)],
  term ((-1857158592226528080 : Rat) / 1288183727709509) [(2, 1), (9, 1), (10, 1), (11, 2), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 274 for generator 30. -/
theorem rs_R013_ueqv_R013YNNN_partial_30_0274_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_30_0274
        rs_R013_ueqv_R013YNNN_generator_30_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_30_0274 := by
  native_decide

/-- Coefficient term 275 from coefficient polynomial 30. -/
def rs_R013_ueqv_R013YNNN_coefficient_30_0275 : Poly :=
[
  term ((-2449910304 : Rat) / 8578069) [(2, 1), (9, 1), (10, 1), (15, 1)]
]

/-- Partial product 275 for generator 30. -/
def rs_R013_ueqv_R013YNNN_partial_30_0275 : Poly :=
[
  term ((-4899820608 : Rat) / 8578069) [(2, 1), (9, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((2449910304 : Rat) / 8578069) [(2, 1), (9, 1), (10, 1), (12, 2), (15, 1)],
  term ((-4899820608 : Rat) / 8578069) [(2, 1), (9, 1), (10, 1), (13, 1), (15, 2)],
  term ((2449910304 : Rat) / 8578069) [(2, 1), (9, 1), (10, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 275 for generator 30. -/
theorem rs_R013_ueqv_R013YNNN_partial_30_0275_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_30_0275
        rs_R013_ueqv_R013YNNN_generator_30_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_30_0275 := by
  native_decide

/-- Coefficient term 276 from coefficient polynomial 30. -/
def rs_R013_ueqv_R013YNNN_coefficient_30_0276 : Poly :=
[
  term ((-12504038400 : Rat) / 150171761) [(2, 1), (9, 1), (10, 2), (11, 1)]
]

/-- Partial product 276 for generator 30. -/
def rs_R013_ueqv_R013YNNN_partial_30_0276 : Poly :=
[
  term ((-25008076800 : Rat) / 150171761) [(2, 1), (9, 1), (10, 2), (11, 1), (12, 1), (14, 1)],
  term ((12504038400 : Rat) / 150171761) [(2, 1), (9, 1), (10, 2), (11, 1), (12, 2)],
  term ((-25008076800 : Rat) / 150171761) [(2, 1), (9, 1), (10, 2), (11, 1), (13, 1), (15, 1)],
  term ((12504038400 : Rat) / 150171761) [(2, 1), (9, 1), (10, 2), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 276 for generator 30. -/
theorem rs_R013_ueqv_R013YNNN_partial_30_0276_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_30_0276
        rs_R013_ueqv_R013YNNN_generator_30_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_30_0276 := by
  native_decide

/-- Coefficient term 277 from coefficient polynomial 30. -/
def rs_R013_ueqv_R013YNNN_coefficient_30_0277 : Poly :=
[
  term ((-602321705586982080 : Rat) / 1288183727709509) [(2, 1), (9, 1), (10, 2), (11, 2), (15, 1)]
]

/-- Partial product 277 for generator 30. -/
def rs_R013_ueqv_R013YNNN_partial_30_0277 : Poly :=
[
  term ((-1204643411173964160 : Rat) / 1288183727709509) [(2, 1), (9, 1), (10, 2), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((602321705586982080 : Rat) / 1288183727709509) [(2, 1), (9, 1), (10, 2), (11, 2), (12, 2), (15, 1)],
  term ((-1204643411173964160 : Rat) / 1288183727709509) [(2, 1), (9, 1), (10, 2), (11, 2), (13, 1), (15, 2)],
  term ((602321705586982080 : Rat) / 1288183727709509) [(2, 1), (9, 1), (10, 2), (11, 2), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 277 for generator 30. -/
theorem rs_R013_ueqv_R013YNNN_partial_30_0277_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_30_0277
        rs_R013_ueqv_R013YNNN_generator_30_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_30_0277 := by
  native_decide

/-- Coefficient term 278 from coefficient polynomial 30. -/
def rs_R013_ueqv_R013YNNN_coefficient_30_0278 : Poly :=
[
  term ((794565504 : Rat) / 8578069) [(2, 1), (9, 1), (10, 2), (15, 1)]
]

/-- Partial product 278 for generator 30. -/
def rs_R013_ueqv_R013YNNN_partial_30_0278 : Poly :=
[
  term ((1589131008 : Rat) / 8578069) [(2, 1), (9, 1), (10, 2), (12, 1), (14, 1), (15, 1)],
  term ((-794565504 : Rat) / 8578069) [(2, 1), (9, 1), (10, 2), (12, 2), (15, 1)],
  term ((1589131008 : Rat) / 8578069) [(2, 1), (9, 1), (10, 2), (13, 1), (15, 2)],
  term ((-794565504 : Rat) / 8578069) [(2, 1), (9, 1), (10, 2), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 278 for generator 30. -/
theorem rs_R013_ueqv_R013YNNN_partial_30_0278_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_30_0278
        rs_R013_ueqv_R013YNNN_generator_30_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_30_0278 := by
  native_decide

/-- Coefficient term 279 from coefficient polynomial 30. -/
def rs_R013_ueqv_R013YNNN_coefficient_30_0279 : Poly :=
[
  term ((-41680128000 : Rat) / 150171761) [(2, 1), (9, 1), (11, 1)]
]

/-- Partial product 279 for generator 30. -/
def rs_R013_ueqv_R013YNNN_partial_30_0279 : Poly :=
[
  term ((-83360256000 : Rat) / 150171761) [(2, 1), (9, 1), (11, 1), (12, 1), (14, 1)],
  term ((41680128000 : Rat) / 150171761) [(2, 1), (9, 1), (11, 1), (12, 2)],
  term ((-83360256000 : Rat) / 150171761) [(2, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((41680128000 : Rat) / 150171761) [(2, 1), (9, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 279 for generator 30. -/
theorem rs_R013_ueqv_R013YNNN_partial_30_0279_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_30_0279
        rs_R013_ueqv_R013YNNN_generator_30_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_30_0279 := by
  native_decide

/-- Coefficient term 280 from coefficient polynomial 30. -/
def rs_R013_ueqv_R013YNNN_coefficient_30_0280 : Poly :=
[
  term ((-2007739018623273600 : Rat) / 1288183727709509) [(2, 1), (9, 1), (11, 2), (15, 1)]
]

/-- Partial product 280 for generator 30. -/
def rs_R013_ueqv_R013YNNN_partial_30_0280 : Poly :=
[
  term ((-4015478037246547200 : Rat) / 1288183727709509) [(2, 1), (9, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((2007739018623273600 : Rat) / 1288183727709509) [(2, 1), (9, 1), (11, 2), (12, 2), (15, 1)],
  term ((-4015478037246547200 : Rat) / 1288183727709509) [(2, 1), (9, 1), (11, 2), (13, 1), (15, 2)],
  term ((2007739018623273600 : Rat) / 1288183727709509) [(2, 1), (9, 1), (11, 2), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 280 for generator 30. -/
theorem rs_R013_ueqv_R013YNNN_partial_30_0280_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_30_0280
        rs_R013_ueqv_R013YNNN_generator_30_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_30_0280 := by
  native_decide

/-- Coefficient term 281 from coefficient polynomial 30. -/
def rs_R013_ueqv_R013YNNN_coefficient_30_0281 : Poly :=
[
  term ((2648551680 : Rat) / 8578069) [(2, 1), (9, 1), (15, 1)]
]

/-- Partial product 281 for generator 30. -/
def rs_R013_ueqv_R013YNNN_partial_30_0281 : Poly :=
[
  term ((5297103360 : Rat) / 8578069) [(2, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-2648551680 : Rat) / 8578069) [(2, 1), (9, 1), (12, 2), (15, 1)],
  term ((5297103360 : Rat) / 8578069) [(2, 1), (9, 1), (13, 1), (15, 2)],
  term ((-2648551680 : Rat) / 8578069) [(2, 1), (9, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 281 for generator 30. -/
theorem rs_R013_ueqv_R013YNNN_partial_30_0281_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_30_0281
        rs_R013_ueqv_R013YNNN_generator_30_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_30_0281 := by
  native_decide

/-- Coefficient term 282 from coefficient polynomial 30. -/
def rs_R013_ueqv_R013YNNN_coefficient_30_0282 : Poly :=
[
  term ((-794565504 : Rat) / 8578069) [(2, 1), (10, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 282 for generator 30. -/
def rs_R013_ueqv_R013YNNN_partial_30_0282 : Poly :=
[
  term ((-1589131008 : Rat) / 8578069) [(2, 1), (10, 1), (11, 1), (12, 1), (14, 2), (15, 1)],
  term ((794565504 : Rat) / 8578069) [(2, 1), (10, 1), (11, 1), (12, 2), (14, 1), (15, 1)],
  term ((-1589131008 : Rat) / 8578069) [(2, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((794565504 : Rat) / 8578069) [(2, 1), (10, 1), (11, 1), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 282 for generator 30. -/
theorem rs_R013_ueqv_R013YNNN_partial_30_0282_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_30_0282
        rs_R013_ueqv_R013YNNN_generator_30_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_30_0282 := by
  native_decide

/-- Coefficient term 283 from coefficient polynomial 30. -/
def rs_R013_ueqv_R013YNNN_coefficient_30_0283 : Poly :=
[
  term ((163798733212753728 : Rat) / 1288183727709509) [(2, 1), (10, 1), (11, 1), (15, 1)]
]

/-- Partial product 283 for generator 30. -/
def rs_R013_ueqv_R013YNNN_partial_30_0283 : Poly :=
[
  term ((327597466425507456 : Rat) / 1288183727709509) [(2, 1), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-163798733212753728 : Rat) / 1288183727709509) [(2, 1), (10, 1), (11, 1), (12, 2), (15, 1)],
  term ((327597466425507456 : Rat) / 1288183727709509) [(2, 1), (10, 1), (11, 1), (13, 1), (15, 2)],
  term ((-163798733212753728 : Rat) / 1288183727709509) [(2, 1), (10, 1), (11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 283 for generator 30. -/
theorem rs_R013_ueqv_R013YNNN_partial_30_0283_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_30_0283
        rs_R013_ueqv_R013YNNN_generator_30_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_30_0283 := by
  native_decide

/-- Coefficient term 284 from coefficient polynomial 30. -/
def rs_R013_ueqv_R013YNNN_coefficient_30_0284 : Poly :=
[
  term ((6252019200 : Rat) / 150171761) [(2, 1), (10, 1), (11, 2)]
]

/-- Partial product 284 for generator 30. -/
def rs_R013_ueqv_R013YNNN_partial_30_0284 : Poly :=
[
  term ((12504038400 : Rat) / 150171761) [(2, 1), (10, 1), (11, 2), (12, 1), (14, 1)],
  term ((-6252019200 : Rat) / 150171761) [(2, 1), (10, 1), (11, 2), (12, 2)],
  term ((12504038400 : Rat) / 150171761) [(2, 1), (10, 1), (11, 2), (13, 1), (15, 1)],
  term ((-6252019200 : Rat) / 150171761) [(2, 1), (10, 1), (11, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 284 for generator 30. -/
theorem rs_R013_ueqv_R013YNNN_partial_30_0284_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_30_0284
        rs_R013_ueqv_R013YNNN_generator_30_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_30_0284 := by
  native_decide

/-- Coefficient term 285 from coefficient polynomial 30. -/
def rs_R013_ueqv_R013YNNN_coefficient_30_0285 : Poly :=
[
  term ((12504038400 : Rat) / 150171761) [(2, 1), (10, 1), (11, 2), (14, 1)]
]

/-- Partial product 285 for generator 30. -/
def rs_R013_ueqv_R013YNNN_partial_30_0285 : Poly :=
[
  term ((25008076800 : Rat) / 150171761) [(2, 1), (10, 1), (11, 2), (12, 1), (14, 2)],
  term ((-12504038400 : Rat) / 150171761) [(2, 1), (10, 1), (11, 2), (12, 2), (14, 1)],
  term ((25008076800 : Rat) / 150171761) [(2, 1), (10, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((-12504038400 : Rat) / 150171761) [(2, 1), (10, 1), (11, 2), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 285 for generator 30. -/
theorem rs_R013_ueqv_R013YNNN_partial_30_0285_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_30_0285
        rs_R013_ueqv_R013YNNN_generator_30_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_30_0285 := by
  native_decide

/-- Coefficient term 286 from coefficient polynomial 30. -/
def rs_R013_ueqv_R013YNNN_coefficient_30_0286 : Poly :=
[
  term ((1254836886639546000 : Rat) / 1288183727709509) [(2, 1), (10, 1), (11, 2), (15, 2)]
]

/-- Partial product 286 for generator 30. -/
def rs_R013_ueqv_R013YNNN_partial_30_0286 : Poly :=
[
  term ((2509673773279092000 : Rat) / 1288183727709509) [(2, 1), (10, 1), (11, 2), (12, 1), (14, 1), (15, 2)],
  term ((-1254836886639546000 : Rat) / 1288183727709509) [(2, 1), (10, 1), (11, 2), (12, 2), (15, 2)],
  term ((2509673773279092000 : Rat) / 1288183727709509) [(2, 1), (10, 1), (11, 2), (13, 1), (15, 3)],
  term ((-1254836886639546000 : Rat) / 1288183727709509) [(2, 1), (10, 1), (11, 2), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 286 for generator 30. -/
theorem rs_R013_ueqv_R013YNNN_partial_30_0286_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_30_0286
        rs_R013_ueqv_R013YNNN_generator_30_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_30_0286 := by
  native_decide

/-- Coefficient term 287 from coefficient polynomial 30. -/
def rs_R013_ueqv_R013YNNN_coefficient_30_0287 : Poly :=
[
  term ((602321705586982080 : Rat) / 1288183727709509) [(2, 1), (10, 1), (11, 3), (14, 1), (15, 1)]
]

/-- Partial product 287 for generator 30. -/
def rs_R013_ueqv_R013YNNN_partial_30_0287 : Poly :=
[
  term ((1204643411173964160 : Rat) / 1288183727709509) [(2, 1), (10, 1), (11, 3), (12, 1), (14, 2), (15, 1)],
  term ((-602321705586982080 : Rat) / 1288183727709509) [(2, 1), (10, 1), (11, 3), (12, 2), (14, 1), (15, 1)],
  term ((1204643411173964160 : Rat) / 1288183727709509) [(2, 1), (10, 1), (11, 3), (13, 1), (14, 1), (15, 2)],
  term ((-602321705586982080 : Rat) / 1288183727709509) [(2, 1), (10, 1), (11, 3), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 287 for generator 30. -/
theorem rs_R013_ueqv_R013YNNN_partial_30_0287_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_30_0287
        rs_R013_ueqv_R013YNNN_generator_30_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_30_0287 := by
  native_decide

/-- Coefficient term 288 from coefficient polynomial 30. -/
def rs_R013_ueqv_R013YNNN_coefficient_30_0288 : Poly :=
[
  term ((301160852793491040 : Rat) / 1288183727709509) [(2, 1), (10, 1), (11, 3), (15, 1)]
]

/-- Partial product 288 for generator 30. -/
def rs_R013_ueqv_R013YNNN_partial_30_0288 : Poly :=
[
  term ((602321705586982080 : Rat) / 1288183727709509) [(2, 1), (10, 1), (11, 3), (12, 1), (14, 1), (15, 1)],
  term ((-301160852793491040 : Rat) / 1288183727709509) [(2, 1), (10, 1), (11, 3), (12, 2), (15, 1)],
  term ((602321705586982080 : Rat) / 1288183727709509) [(2, 1), (10, 1), (11, 3), (13, 1), (15, 2)],
  term ((-301160852793491040 : Rat) / 1288183727709509) [(2, 1), (10, 1), (11, 3), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 288 for generator 30. -/
theorem rs_R013_ueqv_R013YNNN_partial_30_0288_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_30_0288
        rs_R013_ueqv_R013YNNN_generator_30_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_30_0288 := by
  native_decide

/-- Coefficient term 289 from coefficient polynomial 30. -/
def rs_R013_ueqv_R013YNNN_coefficient_30_0289 : Poly :=
[
  term ((-1655344800 : Rat) / 8578069) [(2, 1), (10, 1), (15, 2)]
]

/-- Partial product 289 for generator 30. -/
def rs_R013_ueqv_R013YNNN_partial_30_0289 : Poly :=
[
  term ((-3310689600 : Rat) / 8578069) [(2, 1), (10, 1), (12, 1), (14, 1), (15, 2)],
  term ((1655344800 : Rat) / 8578069) [(2, 1), (10, 1), (12, 2), (15, 2)],
  term ((-3310689600 : Rat) / 8578069) [(2, 1), (10, 1), (13, 1), (15, 3)],
  term ((1655344800 : Rat) / 8578069) [(2, 1), (10, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 289 for generator 30. -/
theorem rs_R013_ueqv_R013YNNN_partial_30_0289_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_30_0289
        rs_R013_ueqv_R013YNNN_generator_30_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_30_0289 := by
  native_decide

/-- Coefficient term 290 from coefficient polynomial 30. -/
def rs_R013_ueqv_R013YNNN_coefficient_30_0290 : Poly :=
[
  term ((-12504038400 : Rat) / 150171761) [(2, 1), (10, 2), (11, 1), (15, 1)]
]

/-- Partial product 290 for generator 30. -/
def rs_R013_ueqv_R013YNNN_partial_30_0290 : Poly :=
[
  term ((-25008076800 : Rat) / 150171761) [(2, 1), (10, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((12504038400 : Rat) / 150171761) [(2, 1), (10, 2), (11, 1), (12, 2), (15, 1)],
  term ((-25008076800 : Rat) / 150171761) [(2, 1), (10, 2), (11, 1), (13, 1), (15, 2)],
  term ((12504038400 : Rat) / 150171761) [(2, 1), (10, 2), (11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 290 for generator 30. -/
theorem rs_R013_ueqv_R013YNNN_partial_30_0290_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_30_0290
        rs_R013_ueqv_R013YNNN_generator_30_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_30_0290 := by
  native_decide

/-- Coefficient term 291 from coefficient polynomial 30. -/
def rs_R013_ueqv_R013YNNN_coefficient_30_0291 : Poly :=
[
  term ((-602321705586982080 : Rat) / 1288183727709509) [(2, 1), (10, 2), (11, 2), (15, 2)]
]

/-- Partial product 291 for generator 30. -/
def rs_R013_ueqv_R013YNNN_partial_30_0291 : Poly :=
[
  term ((-1204643411173964160 : Rat) / 1288183727709509) [(2, 1), (10, 2), (11, 2), (12, 1), (14, 1), (15, 2)],
  term ((602321705586982080 : Rat) / 1288183727709509) [(2, 1), (10, 2), (11, 2), (12, 2), (15, 2)],
  term ((-1204643411173964160 : Rat) / 1288183727709509) [(2, 1), (10, 2), (11, 2), (13, 1), (15, 3)],
  term ((602321705586982080 : Rat) / 1288183727709509) [(2, 1), (10, 2), (11, 2), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 291 for generator 30. -/
theorem rs_R013_ueqv_R013YNNN_partial_30_0291_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_30_0291
        rs_R013_ueqv_R013YNNN_generator_30_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_30_0291 := by
  native_decide

/-- Coefficient term 292 from coefficient polynomial 30. -/
def rs_R013_ueqv_R013YNNN_coefficient_30_0292 : Poly :=
[
  term ((794565504 : Rat) / 8578069) [(2, 1), (10, 2), (15, 2)]
]

/-- Partial product 292 for generator 30. -/
def rs_R013_ueqv_R013YNNN_partial_30_0292 : Poly :=
[
  term ((1589131008 : Rat) / 8578069) [(2, 1), (10, 2), (12, 1), (14, 1), (15, 2)],
  term ((-794565504 : Rat) / 8578069) [(2, 1), (10, 2), (12, 2), (15, 2)],
  term ((1589131008 : Rat) / 8578069) [(2, 1), (10, 2), (13, 1), (15, 3)],
  term ((-794565504 : Rat) / 8578069) [(2, 1), (10, 2), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 292 for generator 30. -/
theorem rs_R013_ueqv_R013YNNN_partial_30_0292_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_30_0292
        rs_R013_ueqv_R013YNNN_generator_30_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_30_0292 := by
  native_decide

/-- Coefficient term 293 from coefficient polynomial 30. -/
def rs_R013_ueqv_R013YNNN_coefficient_30_0293 : Poly :=
[
  term ((418075516000 : Rat) / 150171761) [(2, 1), (11, 1), (12, 1), (13, 1)]
]

/-- Partial product 293 for generator 30. -/
def rs_R013_ueqv_R013YNNN_partial_30_0293 : Poly :=
[
  term ((836151032000 : Rat) / 150171761) [(2, 1), (11, 1), (12, 1), (13, 2), (15, 1)],
  term ((-418075516000 : Rat) / 150171761) [(2, 1), (11, 1), (12, 1), (13, 3)],
  term ((836151032000 : Rat) / 150171761) [(2, 1), (11, 1), (12, 2), (13, 1), (14, 1)],
  term ((-418075516000 : Rat) / 150171761) [(2, 1), (11, 1), (12, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 293 for generator 30. -/
theorem rs_R013_ueqv_R013YNNN_partial_30_0293_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_30_0293
        rs_R013_ueqv_R013YNNN_generator_30_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_30_0293 := by
  native_decide

/-- Coefficient term 294 from coefficient polynomial 30. -/
def rs_R013_ueqv_R013YNNN_coefficient_30_0294 : Poly :=
[
  term ((130668638400 : Rat) / 150171761) [(2, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 294 for generator 30. -/
def rs_R013_ueqv_R013YNNN_partial_30_0294 : Poly :=
[
  term ((261337276800 : Rat) / 150171761) [(2, 1), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((-130668638400 : Rat) / 150171761) [(2, 1), (11, 1), (12, 1), (13, 2), (15, 1)],
  term ((261337276800 : Rat) / 150171761) [(2, 1), (11, 1), (12, 2), (14, 1), (15, 1)],
  term ((-130668638400 : Rat) / 150171761) [(2, 1), (11, 1), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 294 for generator 30. -/
theorem rs_R013_ueqv_R013YNNN_partial_30_0294_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_30_0294
        rs_R013_ueqv_R013YNNN_generator_30_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_30_0294 := by
  native_decide

/-- Coefficient term 295 from coefficient polynomial 30. -/
def rs_R013_ueqv_R013YNNN_coefficient_30_0295 : Poly :=
[
  term ((84302703800 : Rat) / 150171761) [(2, 1), (11, 1), (13, 1)]
]

/-- Partial product 295 for generator 30. -/
def rs_R013_ueqv_R013YNNN_partial_30_0295 : Poly :=
[
  term ((168605407600 : Rat) / 150171761) [(2, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-84302703800 : Rat) / 150171761) [(2, 1), (11, 1), (12, 2), (13, 1)],
  term ((168605407600 : Rat) / 150171761) [(2, 1), (11, 1), (13, 2), (15, 1)],
  term ((-84302703800 : Rat) / 150171761) [(2, 1), (11, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 295 for generator 30. -/
theorem rs_R013_ueqv_R013YNNN_partial_30_0295_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_30_0295
        rs_R013_ueqv_R013YNNN_generator_30_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_30_0295 := by
  native_decide

/-- Coefficient term 296 from coefficient polynomial 30. -/
def rs_R013_ueqv_R013YNNN_coefficient_30_0296 : Poly :=
[
  term ((-130189680400 : Rat) / 150171761) [(2, 1), (11, 1), (13, 1), (14, 1)]
]

/-- Partial product 296 for generator 30. -/
def rs_R013_ueqv_R013YNNN_partial_30_0296 : Poly :=
[
  term ((-260379360800 : Rat) / 150171761) [(2, 1), (11, 1), (12, 1), (13, 1), (14, 2)],
  term ((130189680400 : Rat) / 150171761) [(2, 1), (11, 1), (12, 2), (13, 1), (14, 1)],
  term ((-260379360800 : Rat) / 150171761) [(2, 1), (11, 1), (13, 2), (14, 1), (15, 1)],
  term ((130189680400 : Rat) / 150171761) [(2, 1), (11, 1), (13, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 296 for generator 30. -/
theorem rs_R013_ueqv_R013YNNN_partial_30_0296_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_30_0296
        rs_R013_ueqv_R013YNNN_generator_30_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_30_0296 := by
  native_decide

/-- Coefficient term 297 from coefficient polynomial 30. -/
def rs_R013_ueqv_R013YNNN_coefficient_30_0297 : Poly :=
[
  term ((696708778395854144 : Rat) / 1288183727709509) [(2, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 297 for generator 30. -/
def rs_R013_ueqv_R013YNNN_partial_30_0297 : Poly :=
[
  term ((1393417556791708288 : Rat) / 1288183727709509) [(2, 1), (11, 1), (12, 1), (14, 2), (15, 1)],
  term ((-696708778395854144 : Rat) / 1288183727709509) [(2, 1), (11, 1), (12, 2), (14, 1), (15, 1)],
  term ((1393417556791708288 : Rat) / 1288183727709509) [(2, 1), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((-696708778395854144 : Rat) / 1288183727709509) [(2, 1), (11, 1), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 297 for generator 30. -/
theorem rs_R013_ueqv_R013YNNN_partial_30_0297_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_30_0297
        rs_R013_ueqv_R013YNNN_generator_30_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_30_0297 := by
  native_decide

/-- Coefficient term 298 from coefficient polynomial 30. -/
def rs_R013_ueqv_R013YNNN_coefficient_30_0298 : Poly :=
[
  term ((-5891310171214138656 : Rat) / 1288183727709509) [(2, 1), (11, 1), (15, 1)]
]

/-- Partial product 298 for generator 30. -/
def rs_R013_ueqv_R013YNNN_partial_30_0298 : Poly :=
[
  term ((-11782620342428277312 : Rat) / 1288183727709509) [(2, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((5891310171214138656 : Rat) / 1288183727709509) [(2, 1), (11, 1), (12, 2), (15, 1)],
  term ((-11782620342428277312 : Rat) / 1288183727709509) [(2, 1), (11, 1), (13, 1), (15, 2)],
  term ((5891310171214138656 : Rat) / 1288183727709509) [(2, 1), (11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 298 for generator 30. -/
theorem rs_R013_ueqv_R013YNNN_partial_30_0298_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_30_0298
        rs_R013_ueqv_R013YNNN_generator_30_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_30_0298 := by
  native_decide

/-- Coefficient term 299 from coefficient polynomial 30. -/
def rs_R013_ueqv_R013YNNN_coefficient_30_0299 : Poly :=
[
  term ((521001600 : Rat) / 150171761) [(2, 1), (11, 2)]
]

/-- Partial product 299 for generator 30. -/
def rs_R013_ueqv_R013YNNN_partial_30_0299 : Poly :=
[
  term ((1042003200 : Rat) / 150171761) [(2, 1), (11, 2), (12, 1), (14, 1)],
  term ((-521001600 : Rat) / 150171761) [(2, 1), (11, 2), (12, 2)],
  term ((1042003200 : Rat) / 150171761) [(2, 1), (11, 2), (13, 1), (15, 1)],
  term ((-521001600 : Rat) / 150171761) [(2, 1), (11, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 299 for generator 30. -/
theorem rs_R013_ueqv_R013YNNN_partial_30_0299_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_30_0299
        rs_R013_ueqv_R013YNNN_generator_30_0200_0299 =
      rs_R013_ueqv_R013YNNN_partial_30_0299 := by
  native_decide

/-- Partial products in this block. -/
def rs_R013_ueqv_R013YNNN_partials_30_0200_0299 : List Poly :=
[
  rs_R013_ueqv_R013YNNN_partial_30_0200,
  rs_R013_ueqv_R013YNNN_partial_30_0201,
  rs_R013_ueqv_R013YNNN_partial_30_0202,
  rs_R013_ueqv_R013YNNN_partial_30_0203,
  rs_R013_ueqv_R013YNNN_partial_30_0204,
  rs_R013_ueqv_R013YNNN_partial_30_0205,
  rs_R013_ueqv_R013YNNN_partial_30_0206,
  rs_R013_ueqv_R013YNNN_partial_30_0207,
  rs_R013_ueqv_R013YNNN_partial_30_0208,
  rs_R013_ueqv_R013YNNN_partial_30_0209,
  rs_R013_ueqv_R013YNNN_partial_30_0210,
  rs_R013_ueqv_R013YNNN_partial_30_0211,
  rs_R013_ueqv_R013YNNN_partial_30_0212,
  rs_R013_ueqv_R013YNNN_partial_30_0213,
  rs_R013_ueqv_R013YNNN_partial_30_0214,
  rs_R013_ueqv_R013YNNN_partial_30_0215,
  rs_R013_ueqv_R013YNNN_partial_30_0216,
  rs_R013_ueqv_R013YNNN_partial_30_0217,
  rs_R013_ueqv_R013YNNN_partial_30_0218,
  rs_R013_ueqv_R013YNNN_partial_30_0219,
  rs_R013_ueqv_R013YNNN_partial_30_0220,
  rs_R013_ueqv_R013YNNN_partial_30_0221,
  rs_R013_ueqv_R013YNNN_partial_30_0222,
  rs_R013_ueqv_R013YNNN_partial_30_0223,
  rs_R013_ueqv_R013YNNN_partial_30_0224,
  rs_R013_ueqv_R013YNNN_partial_30_0225,
  rs_R013_ueqv_R013YNNN_partial_30_0226,
  rs_R013_ueqv_R013YNNN_partial_30_0227,
  rs_R013_ueqv_R013YNNN_partial_30_0228,
  rs_R013_ueqv_R013YNNN_partial_30_0229,
  rs_R013_ueqv_R013YNNN_partial_30_0230,
  rs_R013_ueqv_R013YNNN_partial_30_0231,
  rs_R013_ueqv_R013YNNN_partial_30_0232,
  rs_R013_ueqv_R013YNNN_partial_30_0233,
  rs_R013_ueqv_R013YNNN_partial_30_0234,
  rs_R013_ueqv_R013YNNN_partial_30_0235,
  rs_R013_ueqv_R013YNNN_partial_30_0236,
  rs_R013_ueqv_R013YNNN_partial_30_0237,
  rs_R013_ueqv_R013YNNN_partial_30_0238,
  rs_R013_ueqv_R013YNNN_partial_30_0239,
  rs_R013_ueqv_R013YNNN_partial_30_0240,
  rs_R013_ueqv_R013YNNN_partial_30_0241,
  rs_R013_ueqv_R013YNNN_partial_30_0242,
  rs_R013_ueqv_R013YNNN_partial_30_0243,
  rs_R013_ueqv_R013YNNN_partial_30_0244,
  rs_R013_ueqv_R013YNNN_partial_30_0245,
  rs_R013_ueqv_R013YNNN_partial_30_0246,
  rs_R013_ueqv_R013YNNN_partial_30_0247,
  rs_R013_ueqv_R013YNNN_partial_30_0248,
  rs_R013_ueqv_R013YNNN_partial_30_0249,
  rs_R013_ueqv_R013YNNN_partial_30_0250,
  rs_R013_ueqv_R013YNNN_partial_30_0251,
  rs_R013_ueqv_R013YNNN_partial_30_0252,
  rs_R013_ueqv_R013YNNN_partial_30_0253,
  rs_R013_ueqv_R013YNNN_partial_30_0254,
  rs_R013_ueqv_R013YNNN_partial_30_0255,
  rs_R013_ueqv_R013YNNN_partial_30_0256,
  rs_R013_ueqv_R013YNNN_partial_30_0257,
  rs_R013_ueqv_R013YNNN_partial_30_0258,
  rs_R013_ueqv_R013YNNN_partial_30_0259,
  rs_R013_ueqv_R013YNNN_partial_30_0260,
  rs_R013_ueqv_R013YNNN_partial_30_0261,
  rs_R013_ueqv_R013YNNN_partial_30_0262,
  rs_R013_ueqv_R013YNNN_partial_30_0263,
  rs_R013_ueqv_R013YNNN_partial_30_0264,
  rs_R013_ueqv_R013YNNN_partial_30_0265,
  rs_R013_ueqv_R013YNNN_partial_30_0266,
  rs_R013_ueqv_R013YNNN_partial_30_0267,
  rs_R013_ueqv_R013YNNN_partial_30_0268,
  rs_R013_ueqv_R013YNNN_partial_30_0269,
  rs_R013_ueqv_R013YNNN_partial_30_0270,
  rs_R013_ueqv_R013YNNN_partial_30_0271,
  rs_R013_ueqv_R013YNNN_partial_30_0272,
  rs_R013_ueqv_R013YNNN_partial_30_0273,
  rs_R013_ueqv_R013YNNN_partial_30_0274,
  rs_R013_ueqv_R013YNNN_partial_30_0275,
  rs_R013_ueqv_R013YNNN_partial_30_0276,
  rs_R013_ueqv_R013YNNN_partial_30_0277,
  rs_R013_ueqv_R013YNNN_partial_30_0278,
  rs_R013_ueqv_R013YNNN_partial_30_0279,
  rs_R013_ueqv_R013YNNN_partial_30_0280,
  rs_R013_ueqv_R013YNNN_partial_30_0281,
  rs_R013_ueqv_R013YNNN_partial_30_0282,
  rs_R013_ueqv_R013YNNN_partial_30_0283,
  rs_R013_ueqv_R013YNNN_partial_30_0284,
  rs_R013_ueqv_R013YNNN_partial_30_0285,
  rs_R013_ueqv_R013YNNN_partial_30_0286,
  rs_R013_ueqv_R013YNNN_partial_30_0287,
  rs_R013_ueqv_R013YNNN_partial_30_0288,
  rs_R013_ueqv_R013YNNN_partial_30_0289,
  rs_R013_ueqv_R013YNNN_partial_30_0290,
  rs_R013_ueqv_R013YNNN_partial_30_0291,
  rs_R013_ueqv_R013YNNN_partial_30_0292,
  rs_R013_ueqv_R013YNNN_partial_30_0293,
  rs_R013_ueqv_R013YNNN_partial_30_0294,
  rs_R013_ueqv_R013YNNN_partial_30_0295,
  rs_R013_ueqv_R013YNNN_partial_30_0296,
  rs_R013_ueqv_R013YNNN_partial_30_0297,
  rs_R013_ueqv_R013YNNN_partial_30_0298,
  rs_R013_ueqv_R013YNNN_partial_30_0299
]

/-- Sum of partial products in this block. -/
def rs_R013_ueqv_R013YNNN_block_30_0200_0299 : Poly :=
[
  term ((-42453538021107519 : Rat) / 2576367455419018) [(1, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((239598272125548555 : Rat) / 2576367455419018) [(1, 1), (11, 2), (12, 1), (14, 1), (15, 3)],
  term ((239598272125548555 : Rat) / 2576367455419018) [(1, 1), (11, 2), (12, 1), (14, 3), (15, 1)],
  term ((-239598272125548555 : Rat) / 5152734910838036) [(1, 1), (11, 2), (12, 2), (14, 2), (15, 1)],
  term ((42453538021107519 : Rat) / 5152734910838036) [(1, 1), (11, 2), (12, 2), (15, 1)],
  term ((-239598272125548555 : Rat) / 5152734910838036) [(1, 1), (11, 2), (12, 2), (15, 3)],
  term ((239598272125548555 : Rat) / 2576367455419018) [(1, 1), (11, 2), (13, 1), (14, 2), (15, 2)],
  term ((-42453538021107519 : Rat) / 2576367455419018) [(1, 1), (11, 2), (13, 1), (15, 2)],
  term ((239598272125548555 : Rat) / 2576367455419018) [(1, 1), (11, 2), (13, 1), (15, 4)],
  term ((-239598272125548555 : Rat) / 5152734910838036) [(1, 1), (11, 2), (13, 2), (14, 2), (15, 1)],
  term ((42453538021107519 : Rat) / 5152734910838036) [(1, 1), (11, 2), (13, 2), (15, 1)],
  term ((-239598272125548555 : Rat) / 5152734910838036) [(1, 1), (11, 2), (13, 2), (15, 3)],
  term ((-2263352698255732500 : Rat) / 1288183727709509) [(1, 1), (11, 3), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((43472633910819355002 : Rat) / 1288183727709509) [(1, 1), (11, 3), (12, 1), (14, 1), (15, 2)],
  term ((1131676349127866250 : Rat) / 1288183727709509) [(1, 1), (11, 3), (12, 2), (13, 1), (15, 1)],
  term ((-21736316955409677501 : Rat) / 1288183727709509) [(1, 1), (11, 3), (12, 2), (15, 2)],
  term ((43472633910819355002 : Rat) / 1288183727709509) [(1, 1), (11, 3), (13, 1), (15, 3)],
  term ((-23999669653665410001 : Rat) / 1288183727709509) [(1, 1), (11, 3), (13, 2), (15, 2)],
  term ((1131676349127866250 : Rat) / 1288183727709509) [(1, 1), (11, 3), (13, 3), (15, 1)],
  term ((-149246869205 : Rat) / 25734207) [(1, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((-214578122193 : Rat) / 8578069) [(1, 1), (12, 1), (13, 1), (15, 2)],
  term ((141315423502 : Rat) / 25734207) [(1, 1), (12, 1), (13, 2), (14, 1), (15, 1)],
  term ((214578122193 : Rat) / 17156138) [(1, 1), (12, 1), (13, 2), (15, 1)],
  term ((-33282322983 : Rat) / 17156138) [(1, 1), (12, 1), (14, 1), (15, 1)],
  term ((-9980229642 : Rat) / 8578069) [(1, 1), (12, 1), (14, 1), (15, 3)],
  term ((126690186496 : Rat) / 25734207) [(1, 1), (12, 1), (14, 2), (15, 1)],
  term ((-9980229642 : Rat) / 8578069) [(1, 1), (12, 1), (14, 3), (15, 1)],
  term ((-156309047495 : Rat) / 51468414) [(1, 1), (12, 2), (13, 1), (15, 2)],
  term ((5731267424 : Rat) / 25734207) [(1, 1), (12, 2), (13, 2), (15, 1)],
  term ((-707079459827 : Rat) / 25734207) [(1, 1), (12, 2), (14, 1), (15, 1)],
  term ((-29508041941 : Rat) / 25734207) [(1, 1), (12, 2), (14, 2), (15, 1)],
  term ((33282322983 : Rat) / 34312276) [(1, 1), (12, 2), (15, 1)],
  term ((4990114821 : Rat) / 8578069) [(1, 1), (12, 2), (15, 3)],
  term ((-108299571946 : Rat) / 25734207) [(1, 1), (12, 3), (14, 1), (15, 1)],
  term ((214578122193 : Rat) / 17156138) [(1, 1), (12, 3), (15, 1)],
  term ((21756460858 : Rat) / 8578069) [(1, 1), (12, 4), (15, 1)],
  term ((126690186496 : Rat) / 25734207) [(1, 1), (13, 1), (14, 1), (15, 2)],
  term ((-9980229642 : Rat) / 8578069) [(1, 1), (13, 1), (14, 2), (15, 2)],
  term ((-33282322983 : Rat) / 17156138) [(1, 1), (13, 1), (15, 2)],
  term ((-9980229642 : Rat) / 8578069) [(1, 1), (13, 1), (15, 4)],
  term ((-63345093248 : Rat) / 25734207) [(1, 1), (13, 2), (14, 1), (15, 1)],
  term ((4990114821 : Rat) / 8578069) [(1, 1), (13, 2), (14, 2), (15, 1)],
  term ((33282322983 : Rat) / 34312276) [(1, 1), (13, 2), (15, 1)],
  term ((-89798138338 : Rat) / 25734207) [(1, 1), (13, 2), (15, 3)],
  term ((342920943401 : Rat) / 51468414) [(1, 1), (13, 3), (15, 2)],
  term ((-59538115150 : Rat) / 25734207) [(1, 1), (13, 4), (15, 1)],
  term ((100032307200 : Rat) / 150171761) [(1, 2), (2, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((6356524032 : Rat) / 8578069) [(1, 2), (2, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-50016153600 : Rat) / 150171761) [(1, 2), (2, 1), (11, 1), (12, 2), (13, 1)],
  term ((-3178262016 : Rat) / 8578069) [(1, 2), (2, 1), (11, 1), (12, 2), (15, 1)],
  term ((6356524032 : Rat) / 8578069) [(1, 2), (2, 1), (11, 1), (13, 1), (15, 2)],
  term ((380798829528666624 : Rat) / 1288183727709509) [(1, 2), (2, 1), (11, 1), (13, 2), (15, 1)],
  term ((-50016153600 : Rat) / 150171761) [(1, 2), (2, 1), (11, 1), (13, 3)],
  term ((4818573644695856640 : Rat) / 1288183727709509) [(1, 2), (2, 1), (11, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-100032307200 : Rat) / 150171761) [(1, 2), (2, 1), (11, 2), (12, 1), (14, 1)],
  term ((50016153600 : Rat) / 150171761) [(1, 2), (2, 1), (11, 2), (12, 2)],
  term ((-2409286822347928320 : Rat) / 1288183727709509) [(1, 2), (2, 1), (11, 2), (12, 2), (13, 1), (15, 1)],
  term ((-100032307200 : Rat) / 150171761) [(1, 2), (2, 1), (11, 2), (13, 1), (15, 1)],
  term ((50016153600 : Rat) / 150171761) [(1, 2), (2, 1), (11, 2), (13, 2)],
  term ((4818573644695856640 : Rat) / 1288183727709509) [(1, 2), (2, 1), (11, 2), (13, 2), (15, 2)],
  term ((-2409286822347928320 : Rat) / 1288183727709509) [(1, 2), (2, 1), (11, 2), (13, 3), (15, 1)],
  term ((-4818573644695856640 : Rat) / 1288183727709509) [(1, 2), (2, 1), (11, 3), (12, 1), (14, 1), (15, 1)],
  term ((2409286822347928320 : Rat) / 1288183727709509) [(1, 2), (2, 1), (11, 3), (12, 2), (15, 1)],
  term ((-4818573644695856640 : Rat) / 1288183727709509) [(1, 2), (2, 1), (11, 3), (13, 1), (15, 2)],
  term ((2409286822347928320 : Rat) / 1288183727709509) [(1, 2), (2, 1), (11, 3), (13, 2), (15, 1)],
  term ((-6356524032 : Rat) / 8578069) [(1, 2), (2, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((3178262016 : Rat) / 8578069) [(1, 2), (2, 1), (12, 2), (13, 1), (15, 1)],
  term ((-6356524032 : Rat) / 8578069) [(1, 2), (2, 1), (13, 2), (15, 2)],
  term ((3178262016 : Rat) / 8578069) [(1, 2), (2, 1), (13, 3), (15, 1)],
  term (1152 : Rat) [(1, 2), (7, 1), (11, 1), (12, 1), (14, 1)],
  term (-576 : Rat) [(1, 2), (7, 1), (11, 1), (12, 2)],
  term (1152 : Rat) [(1, 2), (7, 1), (11, 1), (13, 1), (15, 1)],
  term (-576 : Rat) [(1, 2), (7, 1), (11, 1), (13, 2)],
  term (-1152 : Rat) [(1, 2), (7, 1), (12, 1), (13, 1), (14, 1)],
  term (576 : Rat) [(1, 2), (7, 1), (12, 2), (13, 1)],
  term (-1152 : Rat) [(1, 2), (7, 1), (13, 2), (15, 1)],
  term (576 : Rat) [(1, 2), (7, 1), (13, 3)],
  term ((-23214846720 : Rat) / 150171761) [(1, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((65026429952 : Rat) / 8578069) [(1, 2), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((-5017999333376231936 : Rat) / 1288183727709509) [(1, 2), (11, 1), (12, 1), (13, 2), (15, 1)],
  term ((7894118400 : Rat) / 150171761) [(1, 2), (11, 1), (12, 1), (13, 3)],
  term ((-33053710229 : Rat) / 8578069) [(1, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((11607423360 : Rat) / 150171761) [(1, 2), (11, 1), (12, 2), (13, 1)],
  term ((-15788236800 : Rat) / 150171761) [(1, 2), (11, 1), (12, 2), (13, 1), (14, 1)],
  term ((65026429952 : Rat) / 8578069) [(1, 2), (11, 1), (12, 2), (14, 1), (15, 1)],
  term ((33053710229 : Rat) / 17156138) [(1, 2), (11, 1), (12, 2), (15, 1)],
  term ((7894118400 : Rat) / 150171761) [(1, 2), (11, 1), (12, 3), (13, 1)],
  term ((-32513214976 : Rat) / 8578069) [(1, 2), (11, 1), (12, 3), (15, 1)],
  term ((-33053710229 : Rat) / 8578069) [(1, 2), (11, 1), (13, 1), (15, 2)],
  term ((4565456758695475909 : Rat) / 2576367455419018) [(1, 2), (11, 1), (13, 2), (15, 1)],
  term ((11607423360 : Rat) / 150171761) [(1, 2), (11, 1), (13, 3)],
  term ((-1118263206175914864 : Rat) / 1288183727709509) [(1, 2), (11, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((15788236800 : Rat) / 150171761) [(1, 2), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((-7894118400 : Rat) / 150171761) [(1, 2), (11, 2), (12, 1), (13, 2)],
  term ((-760522114006556160 : Rat) / 1288183727709509) [(1, 2), (11, 2), (12, 1), (13, 2), (15, 2)],
  term ((380261057003278080 : Rat) / 1288183727709509) [(1, 2), (11, 2), (12, 1), (13, 3), (15, 1)],
  term ((23214846720 : Rat) / 150171761) [(1, 2), (11, 2), (12, 1), (14, 1)],
  term ((-11607423360 : Rat) / 150171761) [(1, 2), (11, 2), (12, 2)],
  term ((-760522114006556160 : Rat) / 1288183727709509) [(1, 2), (11, 2), (12, 2), (13, 1), (14, 1), (15, 1)],
  term ((559131603087957432 : Rat) / 1288183727709509) [(1, 2), (11, 2), (12, 2), (13, 1), (15, 1)],
  term ((15788236800 : Rat) / 150171761) [(1, 2), (11, 2), (12, 2), (14, 1)],
  term ((-7894118400 : Rat) / 150171761) [(1, 2), (11, 2), (12, 3)],
  term ((380261057003278080 : Rat) / 1288183727709509) [(1, 2), (11, 2), (12, 3), (13, 1), (15, 1)],
  term ((23214846720 : Rat) / 150171761) [(1, 2), (11, 2), (13, 1), (15, 1)],
  term ((-11607423360 : Rat) / 150171761) [(1, 2), (11, 2), (13, 2)],
  term ((-1118263206175914864 : Rat) / 1288183727709509) [(1, 2), (11, 2), (13, 2), (15, 2)],
  term ((559131603087957432 : Rat) / 1288183727709509) [(1, 2), (11, 2), (13, 3), (15, 1)],
  term ((760522114006556160 : Rat) / 1288183727709509) [(1, 2), (11, 3), (12, 1), (13, 1), (15, 2)],
  term ((-380261057003278080 : Rat) / 1288183727709509) [(1, 2), (11, 3), (12, 1), (13, 2), (15, 1)],
  term ((1118263206175914864 : Rat) / 1288183727709509) [(1, 2), (11, 3), (12, 1), (14, 1), (15, 1)],
  term ((760522114006556160 : Rat) / 1288183727709509) [(1, 2), (11, 3), (12, 2), (14, 1), (15, 1)],
  term ((-559131603087957432 : Rat) / 1288183727709509) [(1, 2), (11, 3), (12, 2), (15, 1)],
  term ((-380261057003278080 : Rat) / 1288183727709509) [(1, 2), (11, 3), (12, 3), (15, 1)],
  term ((1118263206175914864 : Rat) / 1288183727709509) [(1, 2), (11, 3), (13, 1), (15, 2)],
  term ((-559131603087957432 : Rat) / 1288183727709509) [(1, 2), (11, 3), (13, 2), (15, 1)],
  term ((33053710229 : Rat) / 8578069) [(1, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-65026429952 : Rat) / 8578069) [(1, 2), (12, 1), (13, 2), (15, 2)],
  term ((32513214976 : Rat) / 8578069) [(1, 2), (12, 1), (13, 3), (15, 1)],
  term ((-65026429952 : Rat) / 8578069) [(1, 2), (12, 2), (13, 1), (14, 1), (15, 1)],
  term ((-33053710229 : Rat) / 17156138) [(1, 2), (12, 2), (13, 1), (15, 1)],
  term ((32513214976 : Rat) / 8578069) [(1, 2), (12, 3), (13, 1), (15, 1)],
  term ((33053710229 : Rat) / 8578069) [(1, 2), (13, 2), (15, 2)],
  term ((-33053710229 : Rat) / 17156138) [(1, 2), (13, 3), (15, 1)],
  term ((-31747314400 : Rat) / 150171761) [(2, 1), (3, 1), (4, 1), (11, 1), (12, 1), (14, 1)],
  term ((15873657200 : Rat) / 150171761) [(2, 1), (3, 1), (4, 1), (11, 1), (12, 2)],
  term ((-31747314400 : Rat) / 150171761) [(2, 1), (3, 1), (4, 1), (11, 1), (13, 1), (15, 1)],
  term ((15873657200 : Rat) / 150171761) [(2, 1), (3, 1), (4, 1), (11, 1), (13, 2)],
  term ((-1529273659077547030 : Rat) / 1288183727709509) [(2, 1), (3, 1), (4, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((764636829538773515 : Rat) / 1288183727709509) [(2, 1), (3, 1), (4, 1), (11, 2), (12, 2), (15, 1)],
  term ((-1529273659077547030 : Rat) / 1288183727709509) [(2, 1), (3, 1), (4, 1), (11, 2), (13, 1), (15, 2)],
  term ((764636829538773515 : Rat) / 1288183727709509) [(2, 1), (3, 1), (4, 1), (11, 2), (13, 2), (15, 1)],
  term ((-25852133768 : Rat) / 25734207) [(2, 1), (3, 1), (4, 1), (12, 1), (14, 1), (15, 1)],
  term ((12926066884 : Rat) / 25734207) [(2, 1), (3, 1), (4, 1), (12, 2), (15, 1)],
  term ((-25852133768 : Rat) / 25734207) [(2, 1), (3, 1), (4, 1), (13, 1), (15, 2)],
  term ((12926066884 : Rat) / 25734207) [(2, 1), (3, 1), (4, 1), (13, 2), (15, 1)],
  term ((-831263328000 : Rat) / 150171761) [(2, 1), (3, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((415631664000 : Rat) / 150171761) [(2, 1), (3, 1), (11, 1), (12, 1), (13, 2)],
  term ((-870361616800 : Rat) / 150171761) [(2, 1), (3, 1), (11, 1), (12, 1), (14, 1)],
  term ((24952952800 : Rat) / 150171761) [(2, 1), (3, 1), (11, 1), (12, 1), (14, 2)],
  term ((435180808400 : Rat) / 150171761) [(2, 1), (3, 1), (11, 1), (12, 2)],
  term ((-49631753200 : Rat) / 8833633) [(2, 1), (3, 1), (11, 1), (12, 2), (14, 1)],
  term ((415631664000 : Rat) / 150171761) [(2, 1), (3, 1), (11, 1), (12, 3)],
  term ((24952952800 : Rat) / 150171761) [(2, 1), (3, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-870361616800 : Rat) / 150171761) [(2, 1), (3, 1), (11, 1), (13, 1), (15, 1)],
  term ((435180808400 : Rat) / 150171761) [(2, 1), (3, 1), (11, 1), (13, 2)],
  term ((-12476476400 : Rat) / 150171761) [(2, 1), (3, 1), (11, 1), (13, 2), (14, 1)],
  term ((-40042099159969863600 : Rat) / 1288183727709509) [(2, 1), (3, 1), (11, 2), (12, 1), (13, 1), (15, 2)],
  term ((20021049579984931800 : Rat) / 1288183727709509) [(2, 1), (3, 1), (11, 2), (12, 1), (13, 2), (15, 1)],
  term ((-41925470535056843410 : Rat) / 1288183727709509) [(2, 1), (3, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((1201988078501699110 : Rat) / 1288183727709509) [(2, 1), (3, 1), (11, 2), (12, 1), (14, 2), (15, 1)],
  term ((-2390770188189453715 : Rat) / 75775513394677) [(2, 1), (3, 1), (11, 2), (12, 2), (14, 1), (15, 1)],
  term ((20962735267528421705 : Rat) / 1288183727709509) [(2, 1), (3, 1), (11, 2), (12, 2), (15, 1)],
  term ((20021049579984931800 : Rat) / 1288183727709509) [(2, 1), (3, 1), (11, 2), (12, 3), (15, 1)],
  term ((1201988078501699110 : Rat) / 1288183727709509) [(2, 1), (3, 1), (11, 2), (13, 1), (14, 1), (15, 2)],
  term ((-41925470535056843410 : Rat) / 1288183727709509) [(2, 1), (3, 1), (11, 2), (13, 1), (15, 2)],
  term ((-600994039250849555 : Rat) / 1288183727709509) [(2, 1), (3, 1), (11, 2), (13, 2), (14, 1), (15, 1)],
  term ((20962735267528421705 : Rat) / 1288183727709509) [(2, 1), (3, 1), (11, 2), (13, 2), (15, 1)],
  term ((-66036610880 : Rat) / 8578069) [(2, 1), (3, 1), (12, 1), (13, 1), (15, 2)],
  term ((33018305440 : Rat) / 8578069) [(2, 1), (3, 1), (12, 1), (13, 2), (15, 1)],
  term ((-186180623096 : Rat) / 25734207) [(2, 1), (3, 1), (12, 1), (14, 1), (15, 1)],
  term ((16684235336 : Rat) / 25734207) [(2, 1), (3, 1), (12, 1), (14, 2), (15, 1)],
  term ((-206451950308 : Rat) / 25734207) [(2, 1), (3, 1), (12, 2), (14, 1), (15, 1)],
  term ((93090311548 : Rat) / 25734207) [(2, 1), (3, 1), (12, 2), (15, 1)],
  term ((33018305440 : Rat) / 8578069) [(2, 1), (3, 1), (12, 3), (15, 1)],
  term ((16684235336 : Rat) / 25734207) [(2, 1), (3, 1), (13, 1), (14, 1), (15, 2)],
  term ((-186180623096 : Rat) / 25734207) [(2, 1), (3, 1), (13, 1), (15, 2)],
  term ((-8342117668 : Rat) / 25734207) [(2, 1), (3, 1), (13, 2), (14, 1), (15, 1)],
  term ((93090311548 : Rat) / 25734207) [(2, 1), (3, 1), (13, 2), (15, 1)],
  term ((-26844633600 : Rat) / 150171761) [(2, 1), (4, 1), (7, 1), (11, 1), (12, 1), (14, 1)],
  term ((13422316800 : Rat) / 150171761) [(2, 1), (4, 1), (7, 1), (11, 1), (12, 2)],
  term ((-26844633600 : Rat) / 150171761) [(2, 1), (4, 1), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((13422316800 : Rat) / 150171761) [(2, 1), (4, 1), (7, 1), (11, 1), (13, 2)],
  term ((-1293110671813804320 : Rat) / 1288183727709509) [(2, 1), (4, 1), (7, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((646555335906902160 : Rat) / 1288183727709509) [(2, 1), (4, 1), (7, 1), (11, 2), (12, 2), (15, 1)],
  term ((-1293110671813804320 : Rat) / 1288183727709509) [(2, 1), (4, 1), (7, 1), (11, 2), (13, 1), (15, 2)],
  term ((646555335906902160 : Rat) / 1288183727709509) [(2, 1), (4, 1), (7, 1), (11, 2), (13, 2), (15, 1)],
  term ((1082749696 : Rat) / 8578069) [(2, 1), (4, 1), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((-541374848 : Rat) / 8578069) [(2, 1), (4, 1), (7, 1), (12, 2), (15, 1)],
  term ((1082749696 : Rat) / 8578069) [(2, 1), (4, 1), (7, 1), (13, 1), (15, 2)],
  term ((-541374848 : Rat) / 8578069) [(2, 1), (4, 1), (7, 1), (13, 2), (15, 1)],
  term ((-518371492800 : Rat) / 150171761) [(2, 1), (4, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-55665251200 : Rat) / 150171761) [(2, 1), (4, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((259185746400 : Rat) / 150171761) [(2, 1), (4, 1), (11, 1), (12, 2), (13, 1)],
  term ((27832625600 : Rat) / 150171761) [(2, 1), (4, 1), (11, 1), (12, 2), (15, 1)],
  term ((-55665251200 : Rat) / 150171761) [(2, 1), (4, 1), (11, 1), (13, 1), (15, 2)],
  term ((-490538867200 : Rat) / 150171761) [(2, 1), (4, 1), (11, 1), (13, 2), (15, 1)],
  term ((259185746400 : Rat) / 150171761) [(2, 1), (4, 1), (11, 1), (13, 3)],
  term ((-24970045011295390860 : Rat) / 1288183727709509) [(2, 1), (4, 1), (11, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-2681404836753524440 : Rat) / 1288183727709509) [(2, 1), (4, 1), (11, 2), (12, 1), (14, 1), (15, 2)],
  term ((12485022505647695430 : Rat) / 1288183727709509) [(2, 1), (4, 1), (11, 2), (12, 2), (13, 1), (15, 1)],
  term ((1340702418376762220 : Rat) / 1288183727709509) [(2, 1), (4, 1), (11, 2), (12, 2), (15, 2)],
  term ((-2681404836753524440 : Rat) / 1288183727709509) [(2, 1), (4, 1), (11, 2), (13, 1), (15, 3)],
  term ((-23629342592918628640 : Rat) / 1288183727709509) [(2, 1), (4, 1), (11, 2), (13, 2), (15, 2)],
  term ((12485022505647695430 : Rat) / 1288183727709509) [(2, 1), (4, 1), (11, 2), (13, 3), (15, 1)],
  term ((-43503231152 : Rat) / 8578069) [(2, 1), (4, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-20628337184 : Rat) / 25734207) [(2, 1), (4, 1), (12, 1), (14, 1), (15, 2)],
  term ((21751615576 : Rat) / 8578069) [(2, 1), (4, 1), (12, 2), (13, 1), (15, 1)],
  term ((10314168592 : Rat) / 25734207) [(2, 1), (4, 1), (12, 2), (15, 2)],
  term ((-20628337184 : Rat) / 25734207) [(2, 1), (4, 1), (13, 1), (15, 3)],
  term ((-120195524864 : Rat) / 25734207) [(2, 1), (4, 1), (13, 2), (15, 2)],
  term ((21751615576 : Rat) / 8578069) [(2, 1), (4, 1), (13, 3), (15, 1)],
  term ((472007986400 : Rat) / 150171761) [(2, 1), (5, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-236003993200 : Rat) / 150171761) [(2, 1), (5, 1), (11, 1), (12, 1), (13, 2)],
  term ((8872000000 : Rat) / 6529207) [(2, 1), (5, 1), (11, 1), (12, 1), (14, 1)],
  term ((-152066316800 : Rat) / 150171761) [(2, 1), (5, 1), (11, 1), (12, 1), (14, 2)],
  term ((-4436000000 : Rat) / 6529207) [(2, 1), (5, 1), (11, 1), (12, 2)],
  term ((32237714400 : Rat) / 8833633) [(2, 1), (5, 1), (11, 1), (12, 2), (14, 1)],
  term ((-236003993200 : Rat) / 150171761) [(2, 1), (5, 1), (11, 1), (12, 3)],
  term ((-152066316800 : Rat) / 150171761) [(2, 1), (5, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((8872000000 : Rat) / 6529207) [(2, 1), (5, 1), (11, 1), (13, 1), (15, 1)],
  term ((-4436000000 : Rat) / 6529207) [(2, 1), (5, 1), (11, 1), (13, 2)],
  term ((76033158400 : Rat) / 150171761) [(2, 1), (5, 1), (11, 1), (13, 2), (14, 1)],
  term ((22736706840177733430 : Rat) / 1288183727709509) [(2, 1), (5, 1), (11, 2), (12, 1), (13, 1), (15, 2)],
  term ((-11368353420088866715 : Rat) / 1288183727709509) [(2, 1), (5, 1), (11, 2), (12, 1), (13, 2), (15, 1)],
  term ((427365783838900000 : Rat) / 56007988161283) [(2, 1), (5, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((-124153575282982240 : Rat) / 21833622503551) [(2, 1), (5, 1), (11, 2), (12, 1), (14, 2), (15, 1)],
  term ((1552896312413277030 : Rat) / 75775513394677) [(2, 1), (5, 1), (11, 2), (12, 2), (14, 1), (15, 1)],
  term ((-213682891919450000 : Rat) / 56007988161283) [(2, 1), (5, 1), (11, 2), (12, 2), (15, 1)],
  term ((-11368353420088866715 : Rat) / 1288183727709509) [(2, 1), (5, 1), (11, 2), (12, 3), (15, 1)],
  term ((-124153575282982240 : Rat) / 21833622503551) [(2, 1), (5, 1), (11, 2), (13, 1), (14, 1), (15, 2)],
  term ((427365783838900000 : Rat) / 56007988161283) [(2, 1), (5, 1), (11, 2), (13, 1), (15, 2)],
  term ((62076787641491120 : Rat) / 21833622503551) [(2, 1), (5, 1), (11, 2), (13, 2), (14, 1), (15, 1)],
  term ((-213682891919450000 : Rat) / 56007988161283) [(2, 1), (5, 1), (11, 2), (13, 2), (15, 1)],
  term ((185680218568 : Rat) / 25734207) [(2, 1), (5, 1), (12, 1), (13, 1), (15, 2)],
  term ((-92840109284 : Rat) / 25734207) [(2, 1), (5, 1), (12, 1), (13, 2), (15, 1)],
  term ((51567329920 : Rat) / 25734207) [(2, 1), (5, 1), (12, 1), (14, 1), (15, 1)],
  term ((215126656 : Rat) / 436173) [(2, 1), (5, 1), (12, 1), (14, 2), (15, 1)],
  term ((59777994072 : Rat) / 8578069) [(2, 1), (5, 1), (12, 2), (14, 1), (15, 1)],
  term ((-25783664960 : Rat) / 25734207) [(2, 1), (5, 1), (12, 2), (15, 1)],
  term ((-92840109284 : Rat) / 25734207) [(2, 1), (5, 1), (12, 3), (15, 1)],
  term ((215126656 : Rat) / 436173) [(2, 1), (5, 1), (13, 1), (14, 1), (15, 2)],
  term ((51567329920 : Rat) / 25734207) [(2, 1), (5, 1), (13, 1), (15, 2)],
  term ((-107563328 : Rat) / 436173) [(2, 1), (5, 1), (13, 2), (14, 1), (15, 1)],
  term ((-25783664960 : Rat) / 25734207) [(2, 1), (5, 1), (13, 2), (15, 1)],
  term ((-41464563600 : Rat) / 150171761) [(2, 1), (7, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((20732281800 : Rat) / 150171761) [(2, 1), (7, 1), (11, 1), (12, 1), (13, 2)],
  term ((193530207200 : Rat) / 150171761) [(2, 1), (7, 1), (11, 1), (12, 1), (14, 1)],
  term ((31339635200 : Rat) / 150171761) [(2, 1), (7, 1), (11, 1), (12, 1), (14, 2)],
  term ((-96765103600 : Rat) / 150171761) [(2, 1), (7, 1), (11, 1), (12, 2)],
  term ((-57134381200 : Rat) / 150171761) [(2, 1), (7, 1), (11, 1), (12, 2), (14, 1)],
  term ((20732281800 : Rat) / 150171761) [(2, 1), (7, 1), (11, 1), (12, 3)],
  term ((31339635200 : Rat) / 150171761) [(2, 1), (7, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((193530207200 : Rat) / 150171761) [(2, 1), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((-96765103600 : Rat) / 150171761) [(2, 1), (7, 1), (11, 1), (13, 2)],
  term ((-15669817600 : Rat) / 150171761) [(2, 1), (7, 1), (11, 1), (13, 2), (14, 1)],
  term ((-1997355243964373445 : Rat) / 1288183727709509) [(2, 1), (7, 1), (11, 2), (12, 1), (13, 1), (15, 2)],
  term ((1997355243964373445 : Rat) / 2576367455419018) [(2, 1), (7, 1), (11, 2), (12, 1), (13, 2), (15, 1)],
  term ((9322383757499180390 : Rat) / 1288183727709509) [(2, 1), (7, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((1509635681072270240 : Rat) / 1288183727709509) [(2, 1), (7, 1), (11, 2), (12, 1), (14, 2), (15, 1)],
  term ((-2752173084500508565 : Rat) / 1288183727709509) [(2, 1), (7, 1), (11, 2), (12, 2), (14, 1), (15, 1)],
  term ((-4661191878749590195 : Rat) / 1288183727709509) [(2, 1), (7, 1), (11, 2), (12, 2), (15, 1)],
  term ((1997355243964373445 : Rat) / 2576367455419018) [(2, 1), (7, 1), (11, 2), (12, 3), (15, 1)],
  term ((1509635681072270240 : Rat) / 1288183727709509) [(2, 1), (7, 1), (11, 2), (13, 1), (14, 1), (15, 2)],
  term ((9322383757499180390 : Rat) / 1288183727709509) [(2, 1), (7, 1), (11, 2), (13, 1), (15, 2)],
  term ((-754817840536135120 : Rat) / 1288183727709509) [(2, 1), (7, 1), (11, 2), (13, 2), (14, 1), (15, 1)],
  term ((-4661191878749590195 : Rat) / 1288183727709509) [(2, 1), (7, 1), (11, 2), (13, 2), (15, 1)],
  term ((-4373163604 : Rat) / 8578069) [(2, 1), (7, 1), (12, 1), (13, 1), (15, 2)],
  term ((2186581802 : Rat) / 8578069) [(2, 1), (7, 1), (12, 1), (13, 2), (15, 1)],
  term ((-14408186936 : Rat) / 25734207) [(2, 1), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((-25617178496 : Rat) / 25734207) [(2, 1), (7, 1), (12, 1), (14, 2), (15, 1)],
  term ((-310901564 : Rat) / 25734207) [(2, 1), (7, 1), (12, 2), (14, 1), (15, 1)],
  term ((7204093468 : Rat) / 25734207) [(2, 1), (7, 1), (12, 2), (15, 1)],
  term ((2186581802 : Rat) / 8578069) [(2, 1), (7, 1), (12, 3), (15, 1)],
  term ((-25617178496 : Rat) / 25734207) [(2, 1), (7, 1), (13, 1), (14, 1), (15, 2)],
  term ((-14408186936 : Rat) / 25734207) [(2, 1), (7, 1), (13, 1), (15, 2)],
  term ((12808589248 : Rat) / 25734207) [(2, 1), (7, 1), (13, 2), (14, 1), (15, 1)],
  term ((7204093468 : Rat) / 25734207) [(2, 1), (7, 1), (13, 2), (15, 1)],
  term ((77108236800 : Rat) / 150171761) [(2, 1), (9, 1), (10, 1), (11, 1), (12, 1), (14, 1)],
  term ((-38554118400 : Rat) / 150171761) [(2, 1), (9, 1), (10, 1), (11, 1), (12, 2)],
  term ((77108236800 : Rat) / 150171761) [(2, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-38554118400 : Rat) / 150171761) [(2, 1), (9, 1), (10, 1), (11, 1), (13, 2)],
  term ((3714317184453056160 : Rat) / 1288183727709509) [(2, 1), (9, 1), (10, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((-1857158592226528080 : Rat) / 1288183727709509) [(2, 1), (9, 1), (10, 1), (11, 2), (12, 2), (15, 1)],
  term ((3714317184453056160 : Rat) / 1288183727709509) [(2, 1), (9, 1), (10, 1), (11, 2), (13, 1), (15, 2)],
  term ((-1857158592226528080 : Rat) / 1288183727709509) [(2, 1), (9, 1), (10, 1), (11, 2), (13, 2), (15, 1)],
  term ((-4899820608 : Rat) / 8578069) [(2, 1), (9, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((2449910304 : Rat) / 8578069) [(2, 1), (9, 1), (10, 1), (12, 2), (15, 1)],
  term ((-4899820608 : Rat) / 8578069) [(2, 1), (9, 1), (10, 1), (13, 1), (15, 2)],
  term ((2449910304 : Rat) / 8578069) [(2, 1), (9, 1), (10, 1), (13, 2), (15, 1)],
  term ((-25008076800 : Rat) / 150171761) [(2, 1), (9, 1), (10, 2), (11, 1), (12, 1), (14, 1)],
  term ((12504038400 : Rat) / 150171761) [(2, 1), (9, 1), (10, 2), (11, 1), (12, 2)],
  term ((-25008076800 : Rat) / 150171761) [(2, 1), (9, 1), (10, 2), (11, 1), (13, 1), (15, 1)],
  term ((12504038400 : Rat) / 150171761) [(2, 1), (9, 1), (10, 2), (11, 1), (13, 2)],
  term ((-1204643411173964160 : Rat) / 1288183727709509) [(2, 1), (9, 1), (10, 2), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((602321705586982080 : Rat) / 1288183727709509) [(2, 1), (9, 1), (10, 2), (11, 2), (12, 2), (15, 1)],
  term ((-1204643411173964160 : Rat) / 1288183727709509) [(2, 1), (9, 1), (10, 2), (11, 2), (13, 1), (15, 2)],
  term ((602321705586982080 : Rat) / 1288183727709509) [(2, 1), (9, 1), (10, 2), (11, 2), (13, 2), (15, 1)],
  term ((1589131008 : Rat) / 8578069) [(2, 1), (9, 1), (10, 2), (12, 1), (14, 1), (15, 1)],
  term ((-794565504 : Rat) / 8578069) [(2, 1), (9, 1), (10, 2), (12, 2), (15, 1)],
  term ((1589131008 : Rat) / 8578069) [(2, 1), (9, 1), (10, 2), (13, 1), (15, 2)],
  term ((-794565504 : Rat) / 8578069) [(2, 1), (9, 1), (10, 2), (13, 2), (15, 1)],
  term ((-83360256000 : Rat) / 150171761) [(2, 1), (9, 1), (11, 1), (12, 1), (14, 1)],
  term ((41680128000 : Rat) / 150171761) [(2, 1), (9, 1), (11, 1), (12, 2)],
  term ((-83360256000 : Rat) / 150171761) [(2, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((41680128000 : Rat) / 150171761) [(2, 1), (9, 1), (11, 1), (13, 2)],
  term ((-4015478037246547200 : Rat) / 1288183727709509) [(2, 1), (9, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((2007739018623273600 : Rat) / 1288183727709509) [(2, 1), (9, 1), (11, 2), (12, 2), (15, 1)],
  term ((-4015478037246547200 : Rat) / 1288183727709509) [(2, 1), (9, 1), (11, 2), (13, 1), (15, 2)],
  term ((2007739018623273600 : Rat) / 1288183727709509) [(2, 1), (9, 1), (11, 2), (13, 2), (15, 1)],
  term ((5297103360 : Rat) / 8578069) [(2, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-2648551680 : Rat) / 8578069) [(2, 1), (9, 1), (12, 2), (15, 1)],
  term ((5297103360 : Rat) / 8578069) [(2, 1), (9, 1), (13, 1), (15, 2)],
  term ((-2648551680 : Rat) / 8578069) [(2, 1), (9, 1), (13, 2), (15, 1)],
  term ((327597466425507456 : Rat) / 1288183727709509) [(2, 1), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-1589131008 : Rat) / 8578069) [(2, 1), (10, 1), (11, 1), (12, 1), (14, 2), (15, 1)],
  term ((794565504 : Rat) / 8578069) [(2, 1), (10, 1), (11, 1), (12, 2), (14, 1), (15, 1)],
  term ((-163798733212753728 : Rat) / 1288183727709509) [(2, 1), (10, 1), (11, 1), (12, 2), (15, 1)],
  term ((-1589131008 : Rat) / 8578069) [(2, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((327597466425507456 : Rat) / 1288183727709509) [(2, 1), (10, 1), (11, 1), (13, 1), (15, 2)],
  term ((794565504 : Rat) / 8578069) [(2, 1), (10, 1), (11, 1), (13, 2), (14, 1), (15, 1)],
  term ((-163798733212753728 : Rat) / 1288183727709509) [(2, 1), (10, 1), (11, 1), (13, 2), (15, 1)],
  term ((12504038400 : Rat) / 150171761) [(2, 1), (10, 1), (11, 2), (12, 1), (14, 1)],
  term ((2509673773279092000 : Rat) / 1288183727709509) [(2, 1), (10, 1), (11, 2), (12, 1), (14, 1), (15, 2)],
  term ((25008076800 : Rat) / 150171761) [(2, 1), (10, 1), (11, 2), (12, 1), (14, 2)],
  term ((-6252019200 : Rat) / 150171761) [(2, 1), (10, 1), (11, 2), (12, 2)],
  term ((-12504038400 : Rat) / 150171761) [(2, 1), (10, 1), (11, 2), (12, 2), (14, 1)],
  term ((-1254836886639546000 : Rat) / 1288183727709509) [(2, 1), (10, 1), (11, 2), (12, 2), (15, 2)],
  term ((25008076800 : Rat) / 150171761) [(2, 1), (10, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((12504038400 : Rat) / 150171761) [(2, 1), (10, 1), (11, 2), (13, 1), (15, 1)],
  term ((2509673773279092000 : Rat) / 1288183727709509) [(2, 1), (10, 1), (11, 2), (13, 1), (15, 3)],
  term ((-6252019200 : Rat) / 150171761) [(2, 1), (10, 1), (11, 2), (13, 2)],
  term ((-12504038400 : Rat) / 150171761) [(2, 1), (10, 1), (11, 2), (13, 2), (14, 1)],
  term ((-1254836886639546000 : Rat) / 1288183727709509) [(2, 1), (10, 1), (11, 2), (13, 2), (15, 2)],
  term ((602321705586982080 : Rat) / 1288183727709509) [(2, 1), (10, 1), (11, 3), (12, 1), (14, 1), (15, 1)],
  term ((1204643411173964160 : Rat) / 1288183727709509) [(2, 1), (10, 1), (11, 3), (12, 1), (14, 2), (15, 1)],
  term ((-602321705586982080 : Rat) / 1288183727709509) [(2, 1), (10, 1), (11, 3), (12, 2), (14, 1), (15, 1)],
  term ((-301160852793491040 : Rat) / 1288183727709509) [(2, 1), (10, 1), (11, 3), (12, 2), (15, 1)],
  term ((1204643411173964160 : Rat) / 1288183727709509) [(2, 1), (10, 1), (11, 3), (13, 1), (14, 1), (15, 2)],
  term ((602321705586982080 : Rat) / 1288183727709509) [(2, 1), (10, 1), (11, 3), (13, 1), (15, 2)],
  term ((-602321705586982080 : Rat) / 1288183727709509) [(2, 1), (10, 1), (11, 3), (13, 2), (14, 1), (15, 1)],
  term ((-301160852793491040 : Rat) / 1288183727709509) [(2, 1), (10, 1), (11, 3), (13, 2), (15, 1)],
  term ((-3310689600 : Rat) / 8578069) [(2, 1), (10, 1), (12, 1), (14, 1), (15, 2)],
  term ((1655344800 : Rat) / 8578069) [(2, 1), (10, 1), (12, 2), (15, 2)],
  term ((-3310689600 : Rat) / 8578069) [(2, 1), (10, 1), (13, 1), (15, 3)],
  term ((1655344800 : Rat) / 8578069) [(2, 1), (10, 1), (13, 2), (15, 2)],
  term ((-25008076800 : Rat) / 150171761) [(2, 1), (10, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((12504038400 : Rat) / 150171761) [(2, 1), (10, 2), (11, 1), (12, 2), (15, 1)],
  term ((-25008076800 : Rat) / 150171761) [(2, 1), (10, 2), (11, 1), (13, 1), (15, 2)],
  term ((12504038400 : Rat) / 150171761) [(2, 1), (10, 2), (11, 1), (13, 2), (15, 1)],
  term ((-1204643411173964160 : Rat) / 1288183727709509) [(2, 1), (10, 2), (11, 2), (12, 1), (14, 1), (15, 2)],
  term ((602321705586982080 : Rat) / 1288183727709509) [(2, 1), (10, 2), (11, 2), (12, 2), (15, 2)],
  term ((-1204643411173964160 : Rat) / 1288183727709509) [(2, 1), (10, 2), (11, 2), (13, 1), (15, 3)],
  term ((602321705586982080 : Rat) / 1288183727709509) [(2, 1), (10, 2), (11, 2), (13, 2), (15, 2)],
  term ((1589131008 : Rat) / 8578069) [(2, 1), (10, 2), (12, 1), (14, 1), (15, 2)],
  term ((-794565504 : Rat) / 8578069) [(2, 1), (10, 2), (12, 2), (15, 2)],
  term ((1589131008 : Rat) / 8578069) [(2, 1), (10, 2), (13, 1), (15, 3)],
  term ((-794565504 : Rat) / 8578069) [(2, 1), (10, 2), (13, 2), (15, 2)],
  term ((168605407600 : Rat) / 150171761) [(2, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-260379360800 : Rat) / 150171761) [(2, 1), (11, 1), (12, 1), (13, 1), (14, 2)],
  term ((261337276800 : Rat) / 150171761) [(2, 1), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((705482393600 : Rat) / 150171761) [(2, 1), (11, 1), (12, 1), (13, 2), (15, 1)],
  term ((-418075516000 : Rat) / 150171761) [(2, 1), (11, 1), (12, 1), (13, 3)],
  term ((-11782620342428277312 : Rat) / 1288183727709509) [(2, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((1393417556791708288 : Rat) / 1288183727709509) [(2, 1), (11, 1), (12, 1), (14, 2), (15, 1)],
  term ((-84302703800 : Rat) / 150171761) [(2, 1), (11, 1), (12, 2), (13, 1)],
  term ((966340712400 : Rat) / 150171761) [(2, 1), (11, 1), (12, 2), (13, 1), (14, 1)],
  term ((1545060414266645056 : Rat) / 1288183727709509) [(2, 1), (11, 1), (12, 2), (14, 1), (15, 1)],
  term ((5891310171214138656 : Rat) / 1288183727709509) [(2, 1), (11, 1), (12, 2), (15, 1)],
  term ((-418075516000 : Rat) / 150171761) [(2, 1), (11, 1), (12, 3), (13, 1)],
  term ((-130668638400 : Rat) / 150171761) [(2, 1), (11, 1), (12, 3), (15, 1)],
  term ((1393417556791708288 : Rat) / 1288183727709509) [(2, 1), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((-11782620342428277312 : Rat) / 1288183727709509) [(2, 1), (11, 1), (13, 1), (15, 2)],
  term ((-2930260901514149344 : Rat) / 1288183727709509) [(2, 1), (11, 1), (13, 2), (14, 1), (15, 1)],
  term ((7337618991380063056 : Rat) / 1288183727709509) [(2, 1), (11, 1), (13, 2), (15, 1)],
  term ((-84302703800 : Rat) / 150171761) [(2, 1), (11, 1), (13, 3)],
  term ((130189680400 : Rat) / 150171761) [(2, 1), (11, 1), (13, 3), (14, 1)],
  term ((1042003200 : Rat) / 150171761) [(2, 1), (11, 2), (12, 1), (14, 1)],
  term ((-521001600 : Rat) / 150171761) [(2, 1), (11, 2), (12, 2)],
  term ((1042003200 : Rat) / 150171761) [(2, 1), (11, 2), (13, 1), (15, 1)],
  term ((-521001600 : Rat) / 150171761) [(2, 1), (11, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 30, terms 200 through 299. -/
theorem rs_R013_ueqv_R013YNNN_block_30_0200_0299_valid :
    checkProductSumEq rs_R013_ueqv_R013YNNN_partials_30_0200_0299
      rs_R013_ueqv_R013YNNN_block_30_0200_0299 = true := by
  native_decide

end R013UeqvR013YNNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
