/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009YNNNN, term block 3:200-238

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009YNNNNTermShards

/-- Generator polynomial 3 for relaxed split surplus certificate `R009:u=v:R009YNNNN`. -/
def rs_R009_ueqv_R009YNNNN_generator_03_0200_0238 : Poly :=
[
  term (-2 : Rat) [(4, 1)],
  term (1 : Rat) [(4, 2)],
  term (1 : Rat) [(5, 2)],
  term (2 : Rat) [(8, 1)],
  term (-1 : Rat) [(8, 2)],
  term (-1 : Rat) [(9, 2)]
]

/-- Coefficient term 200 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009YNNNN_coefficient_03_0200 : Poly :=
[
  term ((5016822311914507 : Rat) / 12788395766496) [(10, 1), (13, 1), (15, 1)]
]

/-- Partial product 200 for generator 3. -/
def rs_R009_ueqv_R009YNNNN_partial_03_0200 : Poly :=
[
  term ((-5016822311914507 : Rat) / 6394197883248) [(4, 1), (10, 1), (13, 1), (15, 1)],
  term ((5016822311914507 : Rat) / 12788395766496) [(4, 2), (10, 1), (13, 1), (15, 1)],
  term ((5016822311914507 : Rat) / 12788395766496) [(5, 2), (10, 1), (13, 1), (15, 1)],
  term ((5016822311914507 : Rat) / 6394197883248) [(8, 1), (10, 1), (13, 1), (15, 1)],
  term ((-5016822311914507 : Rat) / 12788395766496) [(8, 2), (10, 1), (13, 1), (15, 1)],
  term ((-5016822311914507 : Rat) / 12788395766496) [(9, 2), (10, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 200 for generator 3. -/
theorem rs_R009_ueqv_R009YNNNN_partial_03_0200_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_03_0200
        rs_R009_ueqv_R009YNNNN_generator_03_0200_0238 =
      rs_R009_ueqv_R009YNNNN_partial_03_0200 := by
  native_decide

/-- Coefficient term 201 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009YNNNN_coefficient_03_0201 : Poly :=
[
  term ((3641 : Rat) / 1008) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 201 for generator 3. -/
def rs_R009_ueqv_R009YNNNN_partial_03_0201 : Poly :=
[
  term ((-3641 : Rat) / 504) [(4, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((3641 : Rat) / 1008) [(4, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((3641 : Rat) / 1008) [(5, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((3641 : Rat) / 504) [(8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3641 : Rat) / 1008) [(8, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3641 : Rat) / 1008) [(9, 2), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 201 for generator 3. -/
theorem rs_R009_ueqv_R009YNNNN_partial_03_0201_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_03_0201
        rs_R009_ueqv_R009YNNNN_generator_03_0200_0238 =
      rs_R009_ueqv_R009YNNNN_partial_03_0201 := by
  native_decide

/-- Coefficient term 202 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009YNNNN_coefficient_03_0202 : Poly :=
[
  term ((-3254745666 : Rat) / 548199407) [(10, 1), (13, 2)]
]

/-- Partial product 202 for generator 3. -/
def rs_R009_ueqv_R009YNNNN_partial_03_0202 : Poly :=
[
  term ((6509491332 : Rat) / 548199407) [(4, 1), (10, 1), (13, 2)],
  term ((-3254745666 : Rat) / 548199407) [(4, 2), (10, 1), (13, 2)],
  term ((-3254745666 : Rat) / 548199407) [(5, 2), (10, 1), (13, 2)],
  term ((-6509491332 : Rat) / 548199407) [(8, 1), (10, 1), (13, 2)],
  term ((3254745666 : Rat) / 548199407) [(8, 2), (10, 1), (13, 2)],
  term ((3254745666 : Rat) / 548199407) [(9, 2), (10, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 202 for generator 3. -/
theorem rs_R009_ueqv_R009YNNNN_partial_03_0202_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_03_0202
        rs_R009_ueqv_R009YNNNN_generator_03_0200_0238 =
      rs_R009_ueqv_R009YNNNN_partial_03_0202 := by
  native_decide

/-- Coefficient term 203 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009YNNNN_coefficient_03_0203 : Poly :=
[
  term ((100 : Rat) / 21) [(10, 1), (13, 2), (16, 1)]
]

/-- Partial product 203 for generator 3. -/
def rs_R009_ueqv_R009YNNNN_partial_03_0203 : Poly :=
[
  term ((-200 : Rat) / 21) [(4, 1), (10, 1), (13, 2), (16, 1)],
  term ((100 : Rat) / 21) [(4, 2), (10, 1), (13, 2), (16, 1)],
  term ((100 : Rat) / 21) [(5, 2), (10, 1), (13, 2), (16, 1)],
  term ((200 : Rat) / 21) [(8, 1), (10, 1), (13, 2), (16, 1)],
  term ((-100 : Rat) / 21) [(8, 2), (10, 1), (13, 2), (16, 1)],
  term ((-100 : Rat) / 21) [(9, 2), (10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 203 for generator 3. -/
theorem rs_R009_ueqv_R009YNNNN_partial_03_0203_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_03_0203
        rs_R009_ueqv_R009YNNNN_generator_03_0200_0238 =
      rs_R009_ueqv_R009YNNNN_partial_03_0203 := by
  native_decide

/-- Coefficient term 204 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009YNNNN_coefficient_03_0204 : Poly :=
[
  term ((2480257240307321 : Rat) / 17406427571064) [(10, 1), (14, 1)]
]

/-- Partial product 204 for generator 3. -/
def rs_R009_ueqv_R009YNNNN_partial_03_0204 : Poly :=
[
  term ((-2480257240307321 : Rat) / 8703213785532) [(4, 1), (10, 1), (14, 1)],
  term ((2480257240307321 : Rat) / 17406427571064) [(4, 2), (10, 1), (14, 1)],
  term ((2480257240307321 : Rat) / 17406427571064) [(5, 2), (10, 1), (14, 1)],
  term ((2480257240307321 : Rat) / 8703213785532) [(8, 1), (10, 1), (14, 1)],
  term ((-2480257240307321 : Rat) / 17406427571064) [(8, 2), (10, 1), (14, 1)],
  term ((-2480257240307321 : Rat) / 17406427571064) [(9, 2), (10, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 204 for generator 3. -/
theorem rs_R009_ueqv_R009YNNNN_partial_03_0204_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_03_0204
        rs_R009_ueqv_R009YNNNN_generator_03_0200_0238 =
      rs_R009_ueqv_R009YNNNN_partial_03_0204 := by
  native_decide

/-- Coefficient term 205 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009YNNNN_coefficient_03_0205 : Poly :=
[
  term ((-11294698751879279 : Rat) / 52219282713192) [(10, 1), (15, 2)]
]

/-- Partial product 205 for generator 3. -/
def rs_R009_ueqv_R009YNNNN_partial_03_0205 : Poly :=
[
  term ((11294698751879279 : Rat) / 26109641356596) [(4, 1), (10, 1), (15, 2)],
  term ((-11294698751879279 : Rat) / 52219282713192) [(4, 2), (10, 1), (15, 2)],
  term ((-11294698751879279 : Rat) / 52219282713192) [(5, 2), (10, 1), (15, 2)],
  term ((-11294698751879279 : Rat) / 26109641356596) [(8, 1), (10, 1), (15, 2)],
  term ((11294698751879279 : Rat) / 52219282713192) [(8, 2), (10, 1), (15, 2)],
  term ((11294698751879279 : Rat) / 52219282713192) [(9, 2), (10, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 205 for generator 3. -/
theorem rs_R009_ueqv_R009YNNNN_partial_03_0205_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_03_0205
        rs_R009_ueqv_R009YNNNN_generator_03_0200_0238 =
      rs_R009_ueqv_R009YNNNN_partial_03_0205 := by
  native_decide

/-- Coefficient term 206 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009YNNNN_coefficient_03_0206 : Poly :=
[
  term ((-1865 : Rat) / 252) [(10, 1), (15, 2), (16, 1)]
]

/-- Partial product 206 for generator 3. -/
def rs_R009_ueqv_R009YNNNN_partial_03_0206 : Poly :=
[
  term ((1865 : Rat) / 126) [(4, 1), (10, 1), (15, 2), (16, 1)],
  term ((-1865 : Rat) / 252) [(4, 2), (10, 1), (15, 2), (16, 1)],
  term ((-1865 : Rat) / 252) [(5, 2), (10, 1), (15, 2), (16, 1)],
  term ((-1865 : Rat) / 126) [(8, 1), (10, 1), (15, 2), (16, 1)],
  term ((1865 : Rat) / 252) [(8, 2), (10, 1), (15, 2), (16, 1)],
  term ((1865 : Rat) / 252) [(9, 2), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 206 for generator 3. -/
theorem rs_R009_ueqv_R009YNNNN_partial_03_0206_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_03_0206
        rs_R009_ueqv_R009YNNNN_generator_03_0200_0238 =
      rs_R009_ueqv_R009YNNNN_partial_03_0206 := by
  native_decide

/-- Coefficient term 207 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009YNNNN_coefficient_03_0207 : Poly :=
[
  term ((52317935595517 : Rat) / 177616607868) [(11, 1), (13, 1)]
]

/-- Partial product 207 for generator 3. -/
def rs_R009_ueqv_R009YNNNN_partial_03_0207 : Poly :=
[
  term ((-52317935595517 : Rat) / 88808303934) [(4, 1), (11, 1), (13, 1)],
  term ((52317935595517 : Rat) / 177616607868) [(4, 2), (11, 1), (13, 1)],
  term ((52317935595517 : Rat) / 177616607868) [(5, 2), (11, 1), (13, 1)],
  term ((52317935595517 : Rat) / 88808303934) [(8, 1), (11, 1), (13, 1)],
  term ((-52317935595517 : Rat) / 177616607868) [(8, 2), (11, 1), (13, 1)],
  term ((-52317935595517 : Rat) / 177616607868) [(9, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 207 for generator 3. -/
theorem rs_R009_ueqv_R009YNNNN_partial_03_0207_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_03_0207
        rs_R009_ueqv_R009YNNNN_generator_03_0200_0238 =
      rs_R009_ueqv_R009YNNNN_partial_03_0207 := by
  native_decide

/-- Coefficient term 208 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009YNNNN_coefficient_03_0208 : Poly :=
[
  term ((359787347343969493 : Rat) / 626631392558304) [(11, 1), (13, 1), (14, 1)]
]

/-- Partial product 208 for generator 3. -/
def rs_R009_ueqv_R009YNNNN_partial_03_0208 : Poly :=
[
  term ((-359787347343969493 : Rat) / 313315696279152) [(4, 1), (11, 1), (13, 1), (14, 1)],
  term ((359787347343969493 : Rat) / 626631392558304) [(4, 2), (11, 1), (13, 1), (14, 1)],
  term ((359787347343969493 : Rat) / 626631392558304) [(5, 2), (11, 1), (13, 1), (14, 1)],
  term ((359787347343969493 : Rat) / 313315696279152) [(8, 1), (11, 1), (13, 1), (14, 1)],
  term ((-359787347343969493 : Rat) / 626631392558304) [(8, 2), (11, 1), (13, 1), (14, 1)],
  term ((-359787347343969493 : Rat) / 626631392558304) [(9, 2), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 208 for generator 3. -/
theorem rs_R009_ueqv_R009YNNNN_partial_03_0208_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_03_0208
        rs_R009_ueqv_R009YNNNN_generator_03_0200_0238 =
      rs_R009_ueqv_R009YNNNN_partial_03_0208 := by
  native_decide

/-- Coefficient term 209 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009YNNNN_coefficient_03_0209 : Poly :=
[
  term ((-29545 : Rat) / 1008) [(11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 209 for generator 3. -/
def rs_R009_ueqv_R009YNNNN_partial_03_0209 : Poly :=
[
  term ((29545 : Rat) / 504) [(4, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-29545 : Rat) / 1008) [(4, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-29545 : Rat) / 1008) [(5, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-29545 : Rat) / 504) [(8, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((29545 : Rat) / 1008) [(8, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((29545 : Rat) / 1008) [(9, 2), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 209 for generator 3. -/
theorem rs_R009_ueqv_R009YNNNN_partial_03_0209_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_03_0209
        rs_R009_ueqv_R009YNNNN_generator_03_0200_0238 =
      rs_R009_ueqv_R009YNNNN_partial_03_0209 := by
  native_decide

/-- Coefficient term 210 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009YNNNN_coefficient_03_0210 : Poly :=
[
  term ((-2954048478533 : Rat) / 19735178652) [(11, 1), (13, 1), (15, 2)]
]

/-- Partial product 210 for generator 3. -/
def rs_R009_ueqv_R009YNNNN_partial_03_0210 : Poly :=
[
  term ((2954048478533 : Rat) / 9867589326) [(4, 1), (11, 1), (13, 1), (15, 2)],
  term ((-2954048478533 : Rat) / 19735178652) [(4, 2), (11, 1), (13, 1), (15, 2)],
  term ((-2954048478533 : Rat) / 19735178652) [(5, 2), (11, 1), (13, 1), (15, 2)],
  term ((-2954048478533 : Rat) / 9867589326) [(8, 1), (11, 1), (13, 1), (15, 2)],
  term ((2954048478533 : Rat) / 19735178652) [(8, 2), (11, 1), (13, 1), (15, 2)],
  term ((2954048478533 : Rat) / 19735178652) [(9, 2), (11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 210 for generator 3. -/
theorem rs_R009_ueqv_R009YNNNN_partial_03_0210_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_03_0210
        rs_R009_ueqv_R009YNNNN_generator_03_0200_0238 =
      rs_R009_ueqv_R009YNNNN_partial_03_0210 := by
  native_decide

/-- Coefficient term 211 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009YNNNN_coefficient_03_0211 : Poly :=
[
  term ((305 : Rat) / 14) [(11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 211 for generator 3. -/
def rs_R009_ueqv_R009YNNNN_partial_03_0211 : Poly :=
[
  term ((-305 : Rat) / 7) [(4, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((305 : Rat) / 14) [(4, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((305 : Rat) / 14) [(5, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((305 : Rat) / 7) [(8, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-305 : Rat) / 14) [(8, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-305 : Rat) / 14) [(9, 2), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 211 for generator 3. -/
theorem rs_R009_ueqv_R009YNNNN_partial_03_0211_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_03_0211
        rs_R009_ueqv_R009YNNNN_generator_03_0200_0238 =
      rs_R009_ueqv_R009YNNNN_partial_03_0211 := by
  native_decide

/-- Coefficient term 212 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009YNNNN_coefficient_03_0212 : Poly :=
[
  term ((-115 : Rat) / 42) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 212 for generator 3. -/
def rs_R009_ueqv_R009YNNNN_partial_03_0212 : Poly :=
[
  term ((115 : Rat) / 21) [(4, 1), (11, 1), (13, 1), (16, 1)],
  term ((-115 : Rat) / 42) [(4, 2), (11, 1), (13, 1), (16, 1)],
  term ((-115 : Rat) / 42) [(5, 2), (11, 1), (13, 1), (16, 1)],
  term ((-115 : Rat) / 21) [(8, 1), (11, 1), (13, 1), (16, 1)],
  term ((115 : Rat) / 42) [(8, 2), (11, 1), (13, 1), (16, 1)],
  term ((115 : Rat) / 42) [(9, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 212 for generator 3. -/
theorem rs_R009_ueqv_R009YNNNN_partial_03_0212_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_03_0212
        rs_R009_ueqv_R009YNNNN_generator_03_0200_0238 =
      rs_R009_ueqv_R009YNNNN_partial_03_0212 := by
  native_decide

/-- Coefficient term 213 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009YNNNN_coefficient_03_0213 : Poly :=
[
  term ((23338993993919833 : Rat) / 52219282713192) [(11, 1), (14, 1), (15, 1)]
]

/-- Partial product 213 for generator 3. -/
def rs_R009_ueqv_R009YNNNN_partial_03_0213 : Poly :=
[
  term ((-23338993993919833 : Rat) / 26109641356596) [(4, 1), (11, 1), (14, 1), (15, 1)],
  term ((23338993993919833 : Rat) / 52219282713192) [(4, 2), (11, 1), (14, 1), (15, 1)],
  term ((23338993993919833 : Rat) / 52219282713192) [(5, 2), (11, 1), (14, 1), (15, 1)],
  term ((23338993993919833 : Rat) / 26109641356596) [(8, 1), (11, 1), (14, 1), (15, 1)],
  term ((-23338993993919833 : Rat) / 52219282713192) [(8, 2), (11, 1), (14, 1), (15, 1)],
  term ((-23338993993919833 : Rat) / 52219282713192) [(9, 2), (11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 213 for generator 3. -/
theorem rs_R009_ueqv_R009YNNNN_partial_03_0213_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_03_0213
        rs_R009_ueqv_R009YNNNN_generator_03_0200_0238 =
      rs_R009_ueqv_R009YNNNN_partial_03_0213 := by
  native_decide

/-- Coefficient term 214 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009YNNNN_coefficient_03_0214 : Poly :=
[
  term ((6313 : Rat) / 252) [(11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 214 for generator 3. -/
def rs_R009_ueqv_R009YNNNN_partial_03_0214 : Poly :=
[
  term ((-6313 : Rat) / 126) [(4, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((6313 : Rat) / 252) [(4, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((6313 : Rat) / 252) [(5, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((6313 : Rat) / 126) [(8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6313 : Rat) / 252) [(8, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6313 : Rat) / 252) [(9, 2), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 214 for generator 3. -/
theorem rs_R009_ueqv_R009YNNNN_partial_03_0214_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_03_0214
        rs_R009_ueqv_R009YNNNN_generator_03_0200_0238 =
      rs_R009_ueqv_R009YNNNN_partial_03_0214 := by
  native_decide

/-- Coefficient term 215 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009YNNNN_coefficient_03_0215 : Poly :=
[
  term ((3064399565618 : Rat) / 26861770943) [(11, 1), (14, 2), (15, 1)]
]

/-- Partial product 215 for generator 3. -/
def rs_R009_ueqv_R009YNNNN_partial_03_0215 : Poly :=
[
  term ((-6128799131236 : Rat) / 26861770943) [(4, 1), (11, 1), (14, 2), (15, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(4, 2), (11, 1), (14, 2), (15, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(5, 2), (11, 1), (14, 2), (15, 1)],
  term ((6128799131236 : Rat) / 26861770943) [(8, 1), (11, 1), (14, 2), (15, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(8, 2), (11, 1), (14, 2), (15, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(9, 2), (11, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 215 for generator 3. -/
theorem rs_R009_ueqv_R009YNNNN_partial_03_0215_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_03_0215
        rs_R009_ueqv_R009YNNNN_generator_03_0200_0238 =
      rs_R009_ueqv_R009YNNNN_partial_03_0215 := by
  native_decide

/-- Coefficient term 216 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009YNNNN_coefficient_03_0216 : Poly :=
[
  term ((48309879215974223 : Rat) / 52219282713192) [(11, 1), (15, 1)]
]

/-- Partial product 216 for generator 3. -/
def rs_R009_ueqv_R009YNNNN_partial_03_0216 : Poly :=
[
  term ((-48309879215974223 : Rat) / 26109641356596) [(4, 1), (11, 1), (15, 1)],
  term ((48309879215974223 : Rat) / 52219282713192) [(4, 2), (11, 1), (15, 1)],
  term ((48309879215974223 : Rat) / 52219282713192) [(5, 2), (11, 1), (15, 1)],
  term ((48309879215974223 : Rat) / 26109641356596) [(8, 1), (11, 1), (15, 1)],
  term ((-48309879215974223 : Rat) / 52219282713192) [(8, 2), (11, 1), (15, 1)],
  term ((-48309879215974223 : Rat) / 52219282713192) [(9, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 216 for generator 3. -/
theorem rs_R009_ueqv_R009YNNNN_partial_03_0216_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_03_0216
        rs_R009_ueqv_R009YNNNN_generator_03_0200_0238 =
      rs_R009_ueqv_R009YNNNN_partial_03_0216 := by
  native_decide

/-- Coefficient term 217 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009YNNNN_coefficient_03_0217 : Poly :=
[
  term ((38 : Rat) / 21) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 217 for generator 3. -/
def rs_R009_ueqv_R009YNNNN_partial_03_0217 : Poly :=
[
  term ((-76 : Rat) / 21) [(4, 1), (11, 1), (15, 1), (16, 1)],
  term ((38 : Rat) / 21) [(4, 2), (11, 1), (15, 1), (16, 1)],
  term ((38 : Rat) / 21) [(5, 2), (11, 1), (15, 1), (16, 1)],
  term ((76 : Rat) / 21) [(8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-38 : Rat) / 21) [(8, 2), (11, 1), (15, 1), (16, 1)],
  term ((-38 : Rat) / 21) [(9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 217 for generator 3. -/
theorem rs_R009_ueqv_R009YNNNN_partial_03_0217_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_03_0217
        rs_R009_ueqv_R009YNNNN_generator_03_0200_0238 =
      rs_R009_ueqv_R009YNNNN_partial_03_0217 := by
  native_decide

/-- Coefficient term 218 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009YNNNN_coefficient_03_0218 : Poly :=
[
  term ((3366906314273 : Rat) / 14801383989) [(11, 1), (15, 3)]
]

/-- Partial product 218 for generator 3. -/
def rs_R009_ueqv_R009YNNNN_partial_03_0218 : Poly :=
[
  term ((-6733812628546 : Rat) / 14801383989) [(4, 1), (11, 1), (15, 3)],
  term ((3366906314273 : Rat) / 14801383989) [(4, 2), (11, 1), (15, 3)],
  term ((3366906314273 : Rat) / 14801383989) [(5, 2), (11, 1), (15, 3)],
  term ((6733812628546 : Rat) / 14801383989) [(8, 1), (11, 1), (15, 3)],
  term ((-3366906314273 : Rat) / 14801383989) [(8, 2), (11, 1), (15, 3)],
  term ((-3366906314273 : Rat) / 14801383989) [(9, 2), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 218 for generator 3. -/
theorem rs_R009_ueqv_R009YNNNN_partial_03_0218_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_03_0218
        rs_R009_ueqv_R009YNNNN_generator_03_0200_0238 =
      rs_R009_ueqv_R009YNNNN_partial_03_0218 := by
  native_decide

/-- Coefficient term 219 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009YNNNN_coefficient_03_0219 : Poly :=
[
  term ((-130 : Rat) / 7) [(11, 1), (15, 3), (16, 1)]
]

/-- Partial product 219 for generator 3. -/
def rs_R009_ueqv_R009YNNNN_partial_03_0219 : Poly :=
[
  term ((260 : Rat) / 7) [(4, 1), (11, 1), (15, 3), (16, 1)],
  term ((-130 : Rat) / 7) [(4, 2), (11, 1), (15, 3), (16, 1)],
  term ((-130 : Rat) / 7) [(5, 2), (11, 1), (15, 3), (16, 1)],
  term ((-260 : Rat) / 7) [(8, 1), (11, 1), (15, 3), (16, 1)],
  term ((130 : Rat) / 7) [(8, 2), (11, 1), (15, 3), (16, 1)],
  term ((130 : Rat) / 7) [(9, 2), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 219 for generator 3. -/
theorem rs_R009_ueqv_R009YNNNN_partial_03_0219_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_03_0219
        rs_R009_ueqv_R009YNNNN_generator_03_0200_0238 =
      rs_R009_ueqv_R009YNNNN_partial_03_0219 := by
  native_decide

/-- Coefficient term 220 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009YNNNN_coefficient_03_0220 : Poly :=
[
  term ((3647943062005 : Rat) / 44404151967) [(11, 2)]
]

/-- Partial product 220 for generator 3. -/
def rs_R009_ueqv_R009YNNNN_partial_03_0220 : Poly :=
[
  term ((-7295886124010 : Rat) / 44404151967) [(4, 1), (11, 2)],
  term ((3647943062005 : Rat) / 44404151967) [(4, 2), (11, 2)],
  term ((3647943062005 : Rat) / 44404151967) [(5, 2), (11, 2)],
  term ((7295886124010 : Rat) / 44404151967) [(8, 1), (11, 2)],
  term ((-3647943062005 : Rat) / 44404151967) [(8, 2), (11, 2)],
  term ((-3647943062005 : Rat) / 44404151967) [(9, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 220 for generator 3. -/
theorem rs_R009_ueqv_R009YNNNN_partial_03_0220_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_03_0220
        rs_R009_ueqv_R009YNNNN_generator_03_0200_0238 =
      rs_R009_ueqv_R009YNNNN_partial_03_0220 := by
  native_decide

/-- Coefficient term 221 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009YNNNN_coefficient_03_0221 : Poly :=
[
  term ((-37506352303719283 : Rat) / 26109641356596) [(11, 2), (14, 1)]
]

/-- Partial product 221 for generator 3. -/
def rs_R009_ueqv_R009YNNNN_partial_03_0221 : Poly :=
[
  term ((37506352303719283 : Rat) / 13054820678298) [(4, 1), (11, 2), (14, 1)],
  term ((-37506352303719283 : Rat) / 26109641356596) [(4, 2), (11, 2), (14, 1)],
  term ((-37506352303719283 : Rat) / 26109641356596) [(5, 2), (11, 2), (14, 1)],
  term ((-37506352303719283 : Rat) / 13054820678298) [(8, 1), (11, 2), (14, 1)],
  term ((37506352303719283 : Rat) / 26109641356596) [(8, 2), (11, 2), (14, 1)],
  term ((37506352303719283 : Rat) / 26109641356596) [(9, 2), (11, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 221 for generator 3. -/
theorem rs_R009_ueqv_R009YNNNN_partial_03_0221_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_03_0221
        rs_R009_ueqv_R009YNNNN_generator_03_0200_0238 =
      rs_R009_ueqv_R009YNNNN_partial_03_0221 := by
  native_decide

/-- Coefficient term 222 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009YNNNN_coefficient_03_0222 : Poly :=
[
  term ((239616 : Rat) / 553) [(11, 2), (15, 2)]
]

/-- Partial product 222 for generator 3. -/
def rs_R009_ueqv_R009YNNNN_partial_03_0222 : Poly :=
[
  term ((-479232 : Rat) / 553) [(4, 1), (11, 2), (15, 2)],
  term ((239616 : Rat) / 553) [(4, 2), (11, 2), (15, 2)],
  term ((239616 : Rat) / 553) [(5, 2), (11, 2), (15, 2)],
  term ((479232 : Rat) / 553) [(8, 1), (11, 2), (15, 2)],
  term ((-239616 : Rat) / 553) [(8, 2), (11, 2), (15, 2)],
  term ((-239616 : Rat) / 553) [(9, 2), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 222 for generator 3. -/
theorem rs_R009_ueqv_R009YNNNN_partial_03_0222_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_03_0222
        rs_R009_ueqv_R009YNNNN_generator_03_0200_0238 =
      rs_R009_ueqv_R009YNNNN_partial_03_0222 := by
  native_decide

/-- Coefficient term 223 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009YNNNN_coefficient_03_0223 : Poly :=
[
  term ((-58090426399911553 : Rat) / 104438565426384) [(13, 1), (14, 1), (15, 1)]
]

/-- Partial product 223 for generator 3. -/
def rs_R009_ueqv_R009YNNNN_partial_03_0223 : Poly :=
[
  term ((58090426399911553 : Rat) / 52219282713192) [(4, 1), (13, 1), (14, 1), (15, 1)],
  term ((-58090426399911553 : Rat) / 104438565426384) [(4, 2), (13, 1), (14, 1), (15, 1)],
  term ((-58090426399911553 : Rat) / 104438565426384) [(5, 2), (13, 1), (14, 1), (15, 1)],
  term ((-58090426399911553 : Rat) / 52219282713192) [(8, 1), (13, 1), (14, 1), (15, 1)],
  term ((58090426399911553 : Rat) / 104438565426384) [(8, 2), (13, 1), (14, 1), (15, 1)],
  term ((58090426399911553 : Rat) / 104438565426384) [(9, 2), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 223 for generator 3. -/
theorem rs_R009_ueqv_R009YNNNN_partial_03_0223_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_03_0223
        rs_R009_ueqv_R009YNNNN_generator_03_0200_0238 =
      rs_R009_ueqv_R009YNNNN_partial_03_0223 := by
  native_decide

/-- Coefficient term 224 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009YNNNN_coefficient_03_0224 : Poly :=
[
  term ((-3397 : Rat) / 504) [(13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 224 for generator 3. -/
def rs_R009_ueqv_R009YNNNN_partial_03_0224 : Poly :=
[
  term ((3397 : Rat) / 252) [(4, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3397 : Rat) / 504) [(4, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3397 : Rat) / 504) [(5, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3397 : Rat) / 252) [(8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((3397 : Rat) / 504) [(8, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((3397 : Rat) / 504) [(9, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 224 for generator 3. -/
theorem rs_R009_ueqv_R009YNNNN_partial_03_0224_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_03_0224
        rs_R009_ueqv_R009YNNNN_generator_03_0200_0238 =
      rs_R009_ueqv_R009YNNNN_partial_03_0224 := by
  native_decide

/-- Coefficient term 225 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009YNNNN_coefficient_03_0225 : Poly :=
[
  term ((1532199782809 : Rat) / 26861770943) [(13, 1), (14, 2), (15, 1)]
]

/-- Partial product 225 for generator 3. -/
def rs_R009_ueqv_R009YNNNN_partial_03_0225 : Poly :=
[
  term ((-3064399565618 : Rat) / 26861770943) [(4, 1), (13, 1), (14, 2), (15, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(4, 2), (13, 1), (14, 2), (15, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(5, 2), (13, 1), (14, 2), (15, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(8, 1), (13, 1), (14, 2), (15, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(8, 2), (13, 1), (14, 2), (15, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(9, 2), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 225 for generator 3. -/
theorem rs_R009_ueqv_R009YNNNN_partial_03_0225_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_03_0225
        rs_R009_ueqv_R009YNNNN_generator_03_0200_0238 =
      rs_R009_ueqv_R009YNNNN_partial_03_0225 := by
  native_decide

/-- Coefficient term 226 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009YNNNN_coefficient_03_0226 : Poly :=
[
  term ((30743539824851429 : Rat) / 626631392558304) [(13, 1), (15, 1)]
]

/-- Partial product 226 for generator 3. -/
def rs_R009_ueqv_R009YNNNN_partial_03_0226 : Poly :=
[
  term ((-30743539824851429 : Rat) / 313315696279152) [(4, 1), (13, 1), (15, 1)],
  term ((30743539824851429 : Rat) / 626631392558304) [(4, 2), (13, 1), (15, 1)],
  term ((30743539824851429 : Rat) / 626631392558304) [(5, 2), (13, 1), (15, 1)],
  term ((30743539824851429 : Rat) / 313315696279152) [(8, 1), (13, 1), (15, 1)],
  term ((-30743539824851429 : Rat) / 626631392558304) [(8, 2), (13, 1), (15, 1)],
  term ((-30743539824851429 : Rat) / 626631392558304) [(9, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 226 for generator 3. -/
theorem rs_R009_ueqv_R009YNNNN_partial_03_0226_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_03_0226
        rs_R009_ueqv_R009YNNNN_generator_03_0200_0238 =
      rs_R009_ueqv_R009YNNNN_partial_03_0226 := by
  native_decide

/-- Coefficient term 227 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009YNNNN_coefficient_03_0227 : Poly :=
[
  term ((-4079 : Rat) / 1008) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 227 for generator 3. -/
def rs_R009_ueqv_R009YNNNN_partial_03_0227 : Poly :=
[
  term ((4079 : Rat) / 504) [(4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4079 : Rat) / 1008) [(4, 2), (13, 1), (15, 1), (16, 1)],
  term ((-4079 : Rat) / 1008) [(5, 2), (13, 1), (15, 1), (16, 1)],
  term ((-4079 : Rat) / 504) [(8, 1), (13, 1), (15, 1), (16, 1)],
  term ((4079 : Rat) / 1008) [(8, 2), (13, 1), (15, 1), (16, 1)],
  term ((4079 : Rat) / 1008) [(9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 227 for generator 3. -/
theorem rs_R009_ueqv_R009YNNNN_partial_03_0227_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_03_0227
        rs_R009_ueqv_R009YNNNN_generator_03_0200_0238 =
      rs_R009_ueqv_R009YNNNN_partial_03_0227 := by
  native_decide

/-- Coefficient term 228 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009YNNNN_coefficient_03_0228 : Poly :=
[
  term ((-10598888540929 : Rat) / 1420932862944) [(13, 2)]
]

/-- Partial product 228 for generator 3. -/
def rs_R009_ueqv_R009YNNNN_partial_03_0228 : Poly :=
[
  term ((10598888540929 : Rat) / 710466431472) [(4, 1), (13, 2)],
  term ((-10598888540929 : Rat) / 1420932862944) [(4, 2), (13, 2)],
  term ((-10598888540929 : Rat) / 1420932862944) [(5, 2), (13, 2)],
  term ((-10598888540929 : Rat) / 710466431472) [(8, 1), (13, 2)],
  term ((10598888540929 : Rat) / 1420932862944) [(8, 2), (13, 2)],
  term ((10598888540929 : Rat) / 1420932862944) [(9, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 228 for generator 3. -/
theorem rs_R009_ueqv_R009YNNNN_partial_03_0228_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_03_0228
        rs_R009_ueqv_R009YNNNN_generator_03_0200_0238 =
      rs_R009_ueqv_R009YNNNN_partial_03_0228 := by
  native_decide

/-- Coefficient term 229 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009YNNNN_coefficient_03_0229 : Poly :=
[
  term ((4520970782140121 : Rat) / 6394197883248) [(13, 2), (14, 1)]
]

/-- Partial product 229 for generator 3. -/
def rs_R009_ueqv_R009YNNNN_partial_03_0229 : Poly :=
[
  term ((-4520970782140121 : Rat) / 3197098941624) [(4, 1), (13, 2), (14, 1)],
  term ((4520970782140121 : Rat) / 6394197883248) [(4, 2), (13, 2), (14, 1)],
  term ((4520970782140121 : Rat) / 6394197883248) [(5, 2), (13, 2), (14, 1)],
  term ((4520970782140121 : Rat) / 3197098941624) [(8, 1), (13, 2), (14, 1)],
  term ((-4520970782140121 : Rat) / 6394197883248) [(8, 2), (13, 2), (14, 1)],
  term ((-4520970782140121 : Rat) / 6394197883248) [(9, 2), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 229 for generator 3. -/
theorem rs_R009_ueqv_R009YNNNN_partial_03_0229_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_03_0229
        rs_R009_ueqv_R009YNNNN_generator_03_0200_0238 =
      rs_R009_ueqv_R009YNNNN_partial_03_0229 := by
  native_decide

/-- Coefficient term 230 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009YNNNN_coefficient_03_0230 : Poly :=
[
  term ((115 : Rat) / 504) [(13, 2), (14, 1), (16, 1)]
]

/-- Partial product 230 for generator 3. -/
def rs_R009_ueqv_R009YNNNN_partial_03_0230 : Poly :=
[
  term ((-115 : Rat) / 252) [(4, 1), (13, 2), (14, 1), (16, 1)],
  term ((115 : Rat) / 504) [(4, 2), (13, 2), (14, 1), (16, 1)],
  term ((115 : Rat) / 504) [(5, 2), (13, 2), (14, 1), (16, 1)],
  term ((115 : Rat) / 252) [(8, 1), (13, 2), (14, 1), (16, 1)],
  term ((-115 : Rat) / 504) [(8, 2), (13, 2), (14, 1), (16, 1)],
  term ((-115 : Rat) / 504) [(9, 2), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 230 for generator 3. -/
theorem rs_R009_ueqv_R009YNNNN_partial_03_0230_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_03_0230
        rs_R009_ueqv_R009YNNNN_generator_03_0200_0238 =
      rs_R009_ueqv_R009YNNNN_partial_03_0230 := by
  native_decide

/-- Coefficient term 231 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009YNNNN_coefficient_03_0231 : Poly :=
[
  term ((725 : Rat) / 112) [(13, 2), (16, 1)]
]

/-- Partial product 231 for generator 3. -/
def rs_R009_ueqv_R009YNNNN_partial_03_0231 : Poly :=
[
  term ((-725 : Rat) / 56) [(4, 1), (13, 2), (16, 1)],
  term ((725 : Rat) / 112) [(4, 2), (13, 2), (16, 1)],
  term ((725 : Rat) / 112) [(5, 2), (13, 2), (16, 1)],
  term ((725 : Rat) / 56) [(8, 1), (13, 2), (16, 1)],
  term ((-725 : Rat) / 112) [(8, 2), (13, 2), (16, 1)],
  term ((-725 : Rat) / 112) [(9, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 231 for generator 3. -/
theorem rs_R009_ueqv_R009YNNNN_partial_03_0231_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_03_0231
        rs_R009_ueqv_R009YNNNN_generator_03_0200_0238 =
      rs_R009_ueqv_R009YNNNN_partial_03_0231 := by
  native_decide

/-- Coefficient term 232 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009YNNNN_coefficient_03_0232 : Poly :=
[
  term ((3298638563597305 : Rat) / 29839590121824) [(14, 1)]
]

/-- Partial product 232 for generator 3. -/
def rs_R009_ueqv_R009YNNNN_partial_03_0232 : Poly :=
[
  term ((-3298638563597305 : Rat) / 14919795060912) [(4, 1), (14, 1)],
  term ((3298638563597305 : Rat) / 29839590121824) [(4, 2), (14, 1)],
  term ((3298638563597305 : Rat) / 29839590121824) [(5, 2), (14, 1)],
  term ((3298638563597305 : Rat) / 14919795060912) [(8, 1), (14, 1)],
  term ((-3298638563597305 : Rat) / 29839590121824) [(8, 2), (14, 1)],
  term ((-3298638563597305 : Rat) / 29839590121824) [(9, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 232 for generator 3. -/
theorem rs_R009_ueqv_R009YNNNN_partial_03_0232_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_03_0232
        rs_R009_ueqv_R009YNNNN_generator_03_0200_0238 =
      rs_R009_ueqv_R009YNNNN_partial_03_0232 := by
  native_decide

/-- Coefficient term 233 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009YNNNN_coefficient_03_0233 : Poly :=
[
  term ((-413194774214435 : Rat) / 2901071261844) [(14, 1), (15, 2)]
]

/-- Partial product 233 for generator 3. -/
def rs_R009_ueqv_R009YNNNN_partial_03_0233 : Poly :=
[
  term ((413194774214435 : Rat) / 1450535630922) [(4, 1), (14, 1), (15, 2)],
  term ((-413194774214435 : Rat) / 2901071261844) [(4, 2), (14, 1), (15, 2)],
  term ((-413194774214435 : Rat) / 2901071261844) [(5, 2), (14, 1), (15, 2)],
  term ((-413194774214435 : Rat) / 1450535630922) [(8, 1), (14, 1), (15, 2)],
  term ((413194774214435 : Rat) / 2901071261844) [(8, 2), (14, 1), (15, 2)],
  term ((413194774214435 : Rat) / 2901071261844) [(9, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 233 for generator 3. -/
theorem rs_R009_ueqv_R009YNNNN_partial_03_0233_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_03_0233
        rs_R009_ueqv_R009YNNNN_generator_03_0200_0238 =
      rs_R009_ueqv_R009YNNNN_partial_03_0233 := by
  native_decide

/-- Coefficient term 234 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009YNNNN_coefficient_03_0234 : Poly :=
[
  term ((65 : Rat) / 14) [(14, 1), (15, 2), (16, 1)]
]

/-- Partial product 234 for generator 3. -/
def rs_R009_ueqv_R009YNNNN_partial_03_0234 : Poly :=
[
  term ((-65 : Rat) / 7) [(4, 1), (14, 1), (15, 2), (16, 1)],
  term ((65 : Rat) / 14) [(4, 2), (14, 1), (15, 2), (16, 1)],
  term ((65 : Rat) / 14) [(5, 2), (14, 1), (15, 2), (16, 1)],
  term ((65 : Rat) / 7) [(8, 1), (14, 1), (15, 2), (16, 1)],
  term ((-65 : Rat) / 14) [(8, 2), (14, 1), (15, 2), (16, 1)],
  term ((-65 : Rat) / 14) [(9, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 234 for generator 3. -/
theorem rs_R009_ueqv_R009YNNNN_partial_03_0234_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_03_0234
        rs_R009_ueqv_R009YNNNN_generator_03_0200_0238 =
      rs_R009_ueqv_R009YNNNN_partial_03_0234 := by
  native_decide

/-- Coefficient term 235 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009YNNNN_coefficient_03_0235 : Poly :=
[
  term ((-16 : Rat) / 21) [(14, 1), (16, 1)]
]

/-- Partial product 235 for generator 3. -/
def rs_R009_ueqv_R009YNNNN_partial_03_0235 : Poly :=
[
  term ((32 : Rat) / 21) [(4, 1), (14, 1), (16, 1)],
  term ((-16 : Rat) / 21) [(4, 2), (14, 1), (16, 1)],
  term ((-16 : Rat) / 21) [(5, 2), (14, 1), (16, 1)],
  term ((-32 : Rat) / 21) [(8, 1), (14, 1), (16, 1)],
  term ((16 : Rat) / 21) [(8, 2), (14, 1), (16, 1)],
  term ((16 : Rat) / 21) [(9, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 235 for generator 3. -/
theorem rs_R009_ueqv_R009YNNNN_partial_03_0235_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_03_0235
        rs_R009_ueqv_R009YNNNN_generator_03_0200_0238 =
      rs_R009_ueqv_R009YNNNN_partial_03_0235 := by
  native_decide

/-- Coefficient term 236 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009YNNNN_coefficient_03_0236 : Poly :=
[
  term ((-122681445924503923 : Rat) / 208877130852768) [(14, 2)]
]

/-- Partial product 236 for generator 3. -/
def rs_R009_ueqv_R009YNNNN_partial_03_0236 : Poly :=
[
  term ((122681445924503923 : Rat) / 104438565426384) [(4, 1), (14, 2)],
  term ((-122681445924503923 : Rat) / 208877130852768) [(4, 2), (14, 2)],
  term ((-122681445924503923 : Rat) / 208877130852768) [(5, 2), (14, 2)],
  term ((-122681445924503923 : Rat) / 104438565426384) [(8, 1), (14, 2)],
  term ((122681445924503923 : Rat) / 208877130852768) [(8, 2), (14, 2)],
  term ((122681445924503923 : Rat) / 208877130852768) [(9, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 236 for generator 3. -/
theorem rs_R009_ueqv_R009YNNNN_partial_03_0236_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_03_0236
        rs_R009_ueqv_R009YNNNN_generator_03_0200_0238 =
      rs_R009_ueqv_R009YNNNN_partial_03_0236 := by
  native_decide

/-- Coefficient term 237 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009YNNNN_coefficient_03_0237 : Poly :=
[
  term ((-158982611033841695 : Rat) / 208877130852768) [(15, 2)]
]

/-- Partial product 237 for generator 3. -/
def rs_R009_ueqv_R009YNNNN_partial_03_0237 : Poly :=
[
  term ((158982611033841695 : Rat) / 104438565426384) [(4, 1), (15, 2)],
  term ((-158982611033841695 : Rat) / 208877130852768) [(4, 2), (15, 2)],
  term ((-158982611033841695 : Rat) / 208877130852768) [(5, 2), (15, 2)],
  term ((-158982611033841695 : Rat) / 104438565426384) [(8, 1), (15, 2)],
  term ((158982611033841695 : Rat) / 208877130852768) [(8, 2), (15, 2)],
  term ((158982611033841695 : Rat) / 208877130852768) [(9, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 237 for generator 3. -/
theorem rs_R009_ueqv_R009YNNNN_partial_03_0237_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_03_0237
        rs_R009_ueqv_R009YNNNN_generator_03_0200_0238 =
      rs_R009_ueqv_R009YNNNN_partial_03_0237 := by
  native_decide

/-- Coefficient term 238 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009YNNNN_coefficient_03_0238 : Poly :=
[
  term ((407 : Rat) / 252) [(15, 2), (16, 1)]
]

/-- Partial product 238 for generator 3. -/
def rs_R009_ueqv_R009YNNNN_partial_03_0238 : Poly :=
[
  term ((-407 : Rat) / 126) [(4, 1), (15, 2), (16, 1)],
  term ((407 : Rat) / 252) [(4, 2), (15, 2), (16, 1)],
  term ((407 : Rat) / 252) [(5, 2), (15, 2), (16, 1)],
  term ((407 : Rat) / 126) [(8, 1), (15, 2), (16, 1)],
  term ((-407 : Rat) / 252) [(8, 2), (15, 2), (16, 1)],
  term ((-407 : Rat) / 252) [(9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 238 for generator 3. -/
theorem rs_R009_ueqv_R009YNNNN_partial_03_0238_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_03_0238
        rs_R009_ueqv_R009YNNNN_generator_03_0200_0238 =
      rs_R009_ueqv_R009YNNNN_partial_03_0238 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009YNNNN_partials_03_0200_0238 : List Poly :=
[
  rs_R009_ueqv_R009YNNNN_partial_03_0200,
  rs_R009_ueqv_R009YNNNN_partial_03_0201,
  rs_R009_ueqv_R009YNNNN_partial_03_0202,
  rs_R009_ueqv_R009YNNNN_partial_03_0203,
  rs_R009_ueqv_R009YNNNN_partial_03_0204,
  rs_R009_ueqv_R009YNNNN_partial_03_0205,
  rs_R009_ueqv_R009YNNNN_partial_03_0206,
  rs_R009_ueqv_R009YNNNN_partial_03_0207,
  rs_R009_ueqv_R009YNNNN_partial_03_0208,
  rs_R009_ueqv_R009YNNNN_partial_03_0209,
  rs_R009_ueqv_R009YNNNN_partial_03_0210,
  rs_R009_ueqv_R009YNNNN_partial_03_0211,
  rs_R009_ueqv_R009YNNNN_partial_03_0212,
  rs_R009_ueqv_R009YNNNN_partial_03_0213,
  rs_R009_ueqv_R009YNNNN_partial_03_0214,
  rs_R009_ueqv_R009YNNNN_partial_03_0215,
  rs_R009_ueqv_R009YNNNN_partial_03_0216,
  rs_R009_ueqv_R009YNNNN_partial_03_0217,
  rs_R009_ueqv_R009YNNNN_partial_03_0218,
  rs_R009_ueqv_R009YNNNN_partial_03_0219,
  rs_R009_ueqv_R009YNNNN_partial_03_0220,
  rs_R009_ueqv_R009YNNNN_partial_03_0221,
  rs_R009_ueqv_R009YNNNN_partial_03_0222,
  rs_R009_ueqv_R009YNNNN_partial_03_0223,
  rs_R009_ueqv_R009YNNNN_partial_03_0224,
  rs_R009_ueqv_R009YNNNN_partial_03_0225,
  rs_R009_ueqv_R009YNNNN_partial_03_0226,
  rs_R009_ueqv_R009YNNNN_partial_03_0227,
  rs_R009_ueqv_R009YNNNN_partial_03_0228,
  rs_R009_ueqv_R009YNNNN_partial_03_0229,
  rs_R009_ueqv_R009YNNNN_partial_03_0230,
  rs_R009_ueqv_R009YNNNN_partial_03_0231,
  rs_R009_ueqv_R009YNNNN_partial_03_0232,
  rs_R009_ueqv_R009YNNNN_partial_03_0233,
  rs_R009_ueqv_R009YNNNN_partial_03_0234,
  rs_R009_ueqv_R009YNNNN_partial_03_0235,
  rs_R009_ueqv_R009YNNNN_partial_03_0236,
  rs_R009_ueqv_R009YNNNN_partial_03_0237,
  rs_R009_ueqv_R009YNNNN_partial_03_0238
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009YNNNN_block_03_0200_0238 : Poly :=
[
  term ((-5016822311914507 : Rat) / 6394197883248) [(4, 1), (10, 1), (13, 1), (15, 1)],
  term ((-3641 : Rat) / 504) [(4, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((6509491332 : Rat) / 548199407) [(4, 1), (10, 1), (13, 2)],
  term ((-200 : Rat) / 21) [(4, 1), (10, 1), (13, 2), (16, 1)],
  term ((-2480257240307321 : Rat) / 8703213785532) [(4, 1), (10, 1), (14, 1)],
  term ((11294698751879279 : Rat) / 26109641356596) [(4, 1), (10, 1), (15, 2)],
  term ((1865 : Rat) / 126) [(4, 1), (10, 1), (15, 2), (16, 1)],
  term ((-52317935595517 : Rat) / 88808303934) [(4, 1), (11, 1), (13, 1)],
  term ((-359787347343969493 : Rat) / 313315696279152) [(4, 1), (11, 1), (13, 1), (14, 1)],
  term ((29545 : Rat) / 504) [(4, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((2954048478533 : Rat) / 9867589326) [(4, 1), (11, 1), (13, 1), (15, 2)],
  term ((-305 : Rat) / 7) [(4, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((115 : Rat) / 21) [(4, 1), (11, 1), (13, 1), (16, 1)],
  term ((-23338993993919833 : Rat) / 26109641356596) [(4, 1), (11, 1), (14, 1), (15, 1)],
  term ((-6313 : Rat) / 126) [(4, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6128799131236 : Rat) / 26861770943) [(4, 1), (11, 1), (14, 2), (15, 1)],
  term ((-48309879215974223 : Rat) / 26109641356596) [(4, 1), (11, 1), (15, 1)],
  term ((-76 : Rat) / 21) [(4, 1), (11, 1), (15, 1), (16, 1)],
  term ((-6733812628546 : Rat) / 14801383989) [(4, 1), (11, 1), (15, 3)],
  term ((260 : Rat) / 7) [(4, 1), (11, 1), (15, 3), (16, 1)],
  term ((-7295886124010 : Rat) / 44404151967) [(4, 1), (11, 2)],
  term ((37506352303719283 : Rat) / 13054820678298) [(4, 1), (11, 2), (14, 1)],
  term ((-479232 : Rat) / 553) [(4, 1), (11, 2), (15, 2)],
  term ((58090426399911553 : Rat) / 52219282713192) [(4, 1), (13, 1), (14, 1), (15, 1)],
  term ((3397 : Rat) / 252) [(4, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(4, 1), (13, 1), (14, 2), (15, 1)],
  term ((-30743539824851429 : Rat) / 313315696279152) [(4, 1), (13, 1), (15, 1)],
  term ((4079 : Rat) / 504) [(4, 1), (13, 1), (15, 1), (16, 1)],
  term ((10598888540929 : Rat) / 710466431472) [(4, 1), (13, 2)],
  term ((-4520970782140121 : Rat) / 3197098941624) [(4, 1), (13, 2), (14, 1)],
  term ((-115 : Rat) / 252) [(4, 1), (13, 2), (14, 1), (16, 1)],
  term ((-725 : Rat) / 56) [(4, 1), (13, 2), (16, 1)],
  term ((-3298638563597305 : Rat) / 14919795060912) [(4, 1), (14, 1)],
  term ((413194774214435 : Rat) / 1450535630922) [(4, 1), (14, 1), (15, 2)],
  term ((-65 : Rat) / 7) [(4, 1), (14, 1), (15, 2), (16, 1)],
  term ((32 : Rat) / 21) [(4, 1), (14, 1), (16, 1)],
  term ((122681445924503923 : Rat) / 104438565426384) [(4, 1), (14, 2)],
  term ((158982611033841695 : Rat) / 104438565426384) [(4, 1), (15, 2)],
  term ((-407 : Rat) / 126) [(4, 1), (15, 2), (16, 1)],
  term ((5016822311914507 : Rat) / 12788395766496) [(4, 2), (10, 1), (13, 1), (15, 1)],
  term ((3641 : Rat) / 1008) [(4, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3254745666 : Rat) / 548199407) [(4, 2), (10, 1), (13, 2)],
  term ((100 : Rat) / 21) [(4, 2), (10, 1), (13, 2), (16, 1)],
  term ((2480257240307321 : Rat) / 17406427571064) [(4, 2), (10, 1), (14, 1)],
  term ((-11294698751879279 : Rat) / 52219282713192) [(4, 2), (10, 1), (15, 2)],
  term ((-1865 : Rat) / 252) [(4, 2), (10, 1), (15, 2), (16, 1)],
  term ((52317935595517 : Rat) / 177616607868) [(4, 2), (11, 1), (13, 1)],
  term ((359787347343969493 : Rat) / 626631392558304) [(4, 2), (11, 1), (13, 1), (14, 1)],
  term ((-29545 : Rat) / 1008) [(4, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2954048478533 : Rat) / 19735178652) [(4, 2), (11, 1), (13, 1), (15, 2)],
  term ((305 : Rat) / 14) [(4, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-115 : Rat) / 42) [(4, 2), (11, 1), (13, 1), (16, 1)],
  term ((23338993993919833 : Rat) / 52219282713192) [(4, 2), (11, 1), (14, 1), (15, 1)],
  term ((6313 : Rat) / 252) [(4, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(4, 2), (11, 1), (14, 2), (15, 1)],
  term ((48309879215974223 : Rat) / 52219282713192) [(4, 2), (11, 1), (15, 1)],
  term ((38 : Rat) / 21) [(4, 2), (11, 1), (15, 1), (16, 1)],
  term ((3366906314273 : Rat) / 14801383989) [(4, 2), (11, 1), (15, 3)],
  term ((-130 : Rat) / 7) [(4, 2), (11, 1), (15, 3), (16, 1)],
  term ((3647943062005 : Rat) / 44404151967) [(4, 2), (11, 2)],
  term ((-37506352303719283 : Rat) / 26109641356596) [(4, 2), (11, 2), (14, 1)],
  term ((239616 : Rat) / 553) [(4, 2), (11, 2), (15, 2)],
  term ((-58090426399911553 : Rat) / 104438565426384) [(4, 2), (13, 1), (14, 1), (15, 1)],
  term ((-3397 : Rat) / 504) [(4, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(4, 2), (13, 1), (14, 2), (15, 1)],
  term ((30743539824851429 : Rat) / 626631392558304) [(4, 2), (13, 1), (15, 1)],
  term ((-4079 : Rat) / 1008) [(4, 2), (13, 1), (15, 1), (16, 1)],
  term ((-10598888540929 : Rat) / 1420932862944) [(4, 2), (13, 2)],
  term ((4520970782140121 : Rat) / 6394197883248) [(4, 2), (13, 2), (14, 1)],
  term ((115 : Rat) / 504) [(4, 2), (13, 2), (14, 1), (16, 1)],
  term ((725 : Rat) / 112) [(4, 2), (13, 2), (16, 1)],
  term ((3298638563597305 : Rat) / 29839590121824) [(4, 2), (14, 1)],
  term ((-413194774214435 : Rat) / 2901071261844) [(4, 2), (14, 1), (15, 2)],
  term ((65 : Rat) / 14) [(4, 2), (14, 1), (15, 2), (16, 1)],
  term ((-16 : Rat) / 21) [(4, 2), (14, 1), (16, 1)],
  term ((-122681445924503923 : Rat) / 208877130852768) [(4, 2), (14, 2)],
  term ((-158982611033841695 : Rat) / 208877130852768) [(4, 2), (15, 2)],
  term ((407 : Rat) / 252) [(4, 2), (15, 2), (16, 1)],
  term ((5016822311914507 : Rat) / 12788395766496) [(5, 2), (10, 1), (13, 1), (15, 1)],
  term ((3641 : Rat) / 1008) [(5, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3254745666 : Rat) / 548199407) [(5, 2), (10, 1), (13, 2)],
  term ((100 : Rat) / 21) [(5, 2), (10, 1), (13, 2), (16, 1)],
  term ((2480257240307321 : Rat) / 17406427571064) [(5, 2), (10, 1), (14, 1)],
  term ((-11294698751879279 : Rat) / 52219282713192) [(5, 2), (10, 1), (15, 2)],
  term ((-1865 : Rat) / 252) [(5, 2), (10, 1), (15, 2), (16, 1)],
  term ((52317935595517 : Rat) / 177616607868) [(5, 2), (11, 1), (13, 1)],
  term ((359787347343969493 : Rat) / 626631392558304) [(5, 2), (11, 1), (13, 1), (14, 1)],
  term ((-29545 : Rat) / 1008) [(5, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2954048478533 : Rat) / 19735178652) [(5, 2), (11, 1), (13, 1), (15, 2)],
  term ((305 : Rat) / 14) [(5, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-115 : Rat) / 42) [(5, 2), (11, 1), (13, 1), (16, 1)],
  term ((23338993993919833 : Rat) / 52219282713192) [(5, 2), (11, 1), (14, 1), (15, 1)],
  term ((6313 : Rat) / 252) [(5, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(5, 2), (11, 1), (14, 2), (15, 1)],
  term ((48309879215974223 : Rat) / 52219282713192) [(5, 2), (11, 1), (15, 1)],
  term ((38 : Rat) / 21) [(5, 2), (11, 1), (15, 1), (16, 1)],
  term ((3366906314273 : Rat) / 14801383989) [(5, 2), (11, 1), (15, 3)],
  term ((-130 : Rat) / 7) [(5, 2), (11, 1), (15, 3), (16, 1)],
  term ((3647943062005 : Rat) / 44404151967) [(5, 2), (11, 2)],
  term ((-37506352303719283 : Rat) / 26109641356596) [(5, 2), (11, 2), (14, 1)],
  term ((239616 : Rat) / 553) [(5, 2), (11, 2), (15, 2)],
  term ((-58090426399911553 : Rat) / 104438565426384) [(5, 2), (13, 1), (14, 1), (15, 1)],
  term ((-3397 : Rat) / 504) [(5, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(5, 2), (13, 1), (14, 2), (15, 1)],
  term ((30743539824851429 : Rat) / 626631392558304) [(5, 2), (13, 1), (15, 1)],
  term ((-4079 : Rat) / 1008) [(5, 2), (13, 1), (15, 1), (16, 1)],
  term ((-10598888540929 : Rat) / 1420932862944) [(5, 2), (13, 2)],
  term ((4520970782140121 : Rat) / 6394197883248) [(5, 2), (13, 2), (14, 1)],
  term ((115 : Rat) / 504) [(5, 2), (13, 2), (14, 1), (16, 1)],
  term ((725 : Rat) / 112) [(5, 2), (13, 2), (16, 1)],
  term ((3298638563597305 : Rat) / 29839590121824) [(5, 2), (14, 1)],
  term ((-413194774214435 : Rat) / 2901071261844) [(5, 2), (14, 1), (15, 2)],
  term ((65 : Rat) / 14) [(5, 2), (14, 1), (15, 2), (16, 1)],
  term ((-16 : Rat) / 21) [(5, 2), (14, 1), (16, 1)],
  term ((-122681445924503923 : Rat) / 208877130852768) [(5, 2), (14, 2)],
  term ((-158982611033841695 : Rat) / 208877130852768) [(5, 2), (15, 2)],
  term ((407 : Rat) / 252) [(5, 2), (15, 2), (16, 1)],
  term ((5016822311914507 : Rat) / 6394197883248) [(8, 1), (10, 1), (13, 1), (15, 1)],
  term ((3641 : Rat) / 504) [(8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-6509491332 : Rat) / 548199407) [(8, 1), (10, 1), (13, 2)],
  term ((200 : Rat) / 21) [(8, 1), (10, 1), (13, 2), (16, 1)],
  term ((2480257240307321 : Rat) / 8703213785532) [(8, 1), (10, 1), (14, 1)],
  term ((-11294698751879279 : Rat) / 26109641356596) [(8, 1), (10, 1), (15, 2)],
  term ((-1865 : Rat) / 126) [(8, 1), (10, 1), (15, 2), (16, 1)],
  term ((52317935595517 : Rat) / 88808303934) [(8, 1), (11, 1), (13, 1)],
  term ((359787347343969493 : Rat) / 313315696279152) [(8, 1), (11, 1), (13, 1), (14, 1)],
  term ((-29545 : Rat) / 504) [(8, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2954048478533 : Rat) / 9867589326) [(8, 1), (11, 1), (13, 1), (15, 2)],
  term ((305 : Rat) / 7) [(8, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-115 : Rat) / 21) [(8, 1), (11, 1), (13, 1), (16, 1)],
  term ((23338993993919833 : Rat) / 26109641356596) [(8, 1), (11, 1), (14, 1), (15, 1)],
  term ((6313 : Rat) / 126) [(8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((6128799131236 : Rat) / 26861770943) [(8, 1), (11, 1), (14, 2), (15, 1)],
  term ((48309879215974223 : Rat) / 26109641356596) [(8, 1), (11, 1), (15, 1)],
  term ((76 : Rat) / 21) [(8, 1), (11, 1), (15, 1), (16, 1)],
  term ((6733812628546 : Rat) / 14801383989) [(8, 1), (11, 1), (15, 3)],
  term ((-260 : Rat) / 7) [(8, 1), (11, 1), (15, 3), (16, 1)],
  term ((7295886124010 : Rat) / 44404151967) [(8, 1), (11, 2)],
  term ((-37506352303719283 : Rat) / 13054820678298) [(8, 1), (11, 2), (14, 1)],
  term ((479232 : Rat) / 553) [(8, 1), (11, 2), (15, 2)],
  term ((-58090426399911553 : Rat) / 52219282713192) [(8, 1), (13, 1), (14, 1), (15, 1)],
  term ((-3397 : Rat) / 252) [(8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(8, 1), (13, 1), (14, 2), (15, 1)],
  term ((30743539824851429 : Rat) / 313315696279152) [(8, 1), (13, 1), (15, 1)],
  term ((-4079 : Rat) / 504) [(8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-10598888540929 : Rat) / 710466431472) [(8, 1), (13, 2)],
  term ((4520970782140121 : Rat) / 3197098941624) [(8, 1), (13, 2), (14, 1)],
  term ((115 : Rat) / 252) [(8, 1), (13, 2), (14, 1), (16, 1)],
  term ((725 : Rat) / 56) [(8, 1), (13, 2), (16, 1)],
  term ((3298638563597305 : Rat) / 14919795060912) [(8, 1), (14, 1)],
  term ((-413194774214435 : Rat) / 1450535630922) [(8, 1), (14, 1), (15, 2)],
  term ((65 : Rat) / 7) [(8, 1), (14, 1), (15, 2), (16, 1)],
  term ((-32 : Rat) / 21) [(8, 1), (14, 1), (16, 1)],
  term ((-122681445924503923 : Rat) / 104438565426384) [(8, 1), (14, 2)],
  term ((-158982611033841695 : Rat) / 104438565426384) [(8, 1), (15, 2)],
  term ((407 : Rat) / 126) [(8, 1), (15, 2), (16, 1)],
  term ((-5016822311914507 : Rat) / 12788395766496) [(8, 2), (10, 1), (13, 1), (15, 1)],
  term ((-3641 : Rat) / 1008) [(8, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((3254745666 : Rat) / 548199407) [(8, 2), (10, 1), (13, 2)],
  term ((-100 : Rat) / 21) [(8, 2), (10, 1), (13, 2), (16, 1)],
  term ((-2480257240307321 : Rat) / 17406427571064) [(8, 2), (10, 1), (14, 1)],
  term ((11294698751879279 : Rat) / 52219282713192) [(8, 2), (10, 1), (15, 2)],
  term ((1865 : Rat) / 252) [(8, 2), (10, 1), (15, 2), (16, 1)],
  term ((-52317935595517 : Rat) / 177616607868) [(8, 2), (11, 1), (13, 1)],
  term ((-359787347343969493 : Rat) / 626631392558304) [(8, 2), (11, 1), (13, 1), (14, 1)],
  term ((29545 : Rat) / 1008) [(8, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((2954048478533 : Rat) / 19735178652) [(8, 2), (11, 1), (13, 1), (15, 2)],
  term ((-305 : Rat) / 14) [(8, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((115 : Rat) / 42) [(8, 2), (11, 1), (13, 1), (16, 1)],
  term ((-23338993993919833 : Rat) / 52219282713192) [(8, 2), (11, 1), (14, 1), (15, 1)],
  term ((-6313 : Rat) / 252) [(8, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(8, 2), (11, 1), (14, 2), (15, 1)],
  term ((-48309879215974223 : Rat) / 52219282713192) [(8, 2), (11, 1), (15, 1)],
  term ((-38 : Rat) / 21) [(8, 2), (11, 1), (15, 1), (16, 1)],
  term ((-3366906314273 : Rat) / 14801383989) [(8, 2), (11, 1), (15, 3)],
  term ((130 : Rat) / 7) [(8, 2), (11, 1), (15, 3), (16, 1)],
  term ((-3647943062005 : Rat) / 44404151967) [(8, 2), (11, 2)],
  term ((37506352303719283 : Rat) / 26109641356596) [(8, 2), (11, 2), (14, 1)],
  term ((-239616 : Rat) / 553) [(8, 2), (11, 2), (15, 2)],
  term ((58090426399911553 : Rat) / 104438565426384) [(8, 2), (13, 1), (14, 1), (15, 1)],
  term ((3397 : Rat) / 504) [(8, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(8, 2), (13, 1), (14, 2), (15, 1)],
  term ((-30743539824851429 : Rat) / 626631392558304) [(8, 2), (13, 1), (15, 1)],
  term ((4079 : Rat) / 1008) [(8, 2), (13, 1), (15, 1), (16, 1)],
  term ((10598888540929 : Rat) / 1420932862944) [(8, 2), (13, 2)],
  term ((-4520970782140121 : Rat) / 6394197883248) [(8, 2), (13, 2), (14, 1)],
  term ((-115 : Rat) / 504) [(8, 2), (13, 2), (14, 1), (16, 1)],
  term ((-725 : Rat) / 112) [(8, 2), (13, 2), (16, 1)],
  term ((-3298638563597305 : Rat) / 29839590121824) [(8, 2), (14, 1)],
  term ((413194774214435 : Rat) / 2901071261844) [(8, 2), (14, 1), (15, 2)],
  term ((-65 : Rat) / 14) [(8, 2), (14, 1), (15, 2), (16, 1)],
  term ((16 : Rat) / 21) [(8, 2), (14, 1), (16, 1)],
  term ((122681445924503923 : Rat) / 208877130852768) [(8, 2), (14, 2)],
  term ((158982611033841695 : Rat) / 208877130852768) [(8, 2), (15, 2)],
  term ((-407 : Rat) / 252) [(8, 2), (15, 2), (16, 1)],
  term ((-5016822311914507 : Rat) / 12788395766496) [(9, 2), (10, 1), (13, 1), (15, 1)],
  term ((-3641 : Rat) / 1008) [(9, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((3254745666 : Rat) / 548199407) [(9, 2), (10, 1), (13, 2)],
  term ((-100 : Rat) / 21) [(9, 2), (10, 1), (13, 2), (16, 1)],
  term ((-2480257240307321 : Rat) / 17406427571064) [(9, 2), (10, 1), (14, 1)],
  term ((11294698751879279 : Rat) / 52219282713192) [(9, 2), (10, 1), (15, 2)],
  term ((1865 : Rat) / 252) [(9, 2), (10, 1), (15, 2), (16, 1)],
  term ((-52317935595517 : Rat) / 177616607868) [(9, 2), (11, 1), (13, 1)],
  term ((-359787347343969493 : Rat) / 626631392558304) [(9, 2), (11, 1), (13, 1), (14, 1)],
  term ((29545 : Rat) / 1008) [(9, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((2954048478533 : Rat) / 19735178652) [(9, 2), (11, 1), (13, 1), (15, 2)],
  term ((-305 : Rat) / 14) [(9, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((115 : Rat) / 42) [(9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-23338993993919833 : Rat) / 52219282713192) [(9, 2), (11, 1), (14, 1), (15, 1)],
  term ((-6313 : Rat) / 252) [(9, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(9, 2), (11, 1), (14, 2), (15, 1)],
  term ((-48309879215974223 : Rat) / 52219282713192) [(9, 2), (11, 1), (15, 1)],
  term ((-38 : Rat) / 21) [(9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-3366906314273 : Rat) / 14801383989) [(9, 2), (11, 1), (15, 3)],
  term ((130 : Rat) / 7) [(9, 2), (11, 1), (15, 3), (16, 1)],
  term ((-3647943062005 : Rat) / 44404151967) [(9, 2), (11, 2)],
  term ((37506352303719283 : Rat) / 26109641356596) [(9, 2), (11, 2), (14, 1)],
  term ((-239616 : Rat) / 553) [(9, 2), (11, 2), (15, 2)],
  term ((58090426399911553 : Rat) / 104438565426384) [(9, 2), (13, 1), (14, 1), (15, 1)],
  term ((3397 : Rat) / 504) [(9, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(9, 2), (13, 1), (14, 2), (15, 1)],
  term ((-30743539824851429 : Rat) / 626631392558304) [(9, 2), (13, 1), (15, 1)],
  term ((4079 : Rat) / 1008) [(9, 2), (13, 1), (15, 1), (16, 1)],
  term ((10598888540929 : Rat) / 1420932862944) [(9, 2), (13, 2)],
  term ((-4520970782140121 : Rat) / 6394197883248) [(9, 2), (13, 2), (14, 1)],
  term ((-115 : Rat) / 504) [(9, 2), (13, 2), (14, 1), (16, 1)],
  term ((-725 : Rat) / 112) [(9, 2), (13, 2), (16, 1)],
  term ((-3298638563597305 : Rat) / 29839590121824) [(9, 2), (14, 1)],
  term ((413194774214435 : Rat) / 2901071261844) [(9, 2), (14, 1), (15, 2)],
  term ((-65 : Rat) / 14) [(9, 2), (14, 1), (15, 2), (16, 1)],
  term ((16 : Rat) / 21) [(9, 2), (14, 1), (16, 1)],
  term ((122681445924503923 : Rat) / 208877130852768) [(9, 2), (14, 2)],
  term ((158982611033841695 : Rat) / 208877130852768) [(9, 2), (15, 2)],
  term ((-407 : Rat) / 252) [(9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 3, terms 200 through 238. -/
theorem rs_R009_ueqv_R009YNNNN_block_03_0200_0238_valid :
    checkProductSumEq rs_R009_ueqv_R009YNNNN_partials_03_0200_0238
      rs_R009_ueqv_R009YNNNN_block_03_0200_0238 = true := by
  native_decide

end R009UeqvR009YNNNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
