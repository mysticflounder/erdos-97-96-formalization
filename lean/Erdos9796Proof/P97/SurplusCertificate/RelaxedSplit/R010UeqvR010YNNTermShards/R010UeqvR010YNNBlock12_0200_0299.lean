/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R010:u=v:R010YNN, term block 12:200-299

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R010UeqvR010YNNTermShards

/-- Generator polynomial 12 for relaxed split surplus certificate `R010:u=v:R010YNN`. -/
def rs_R010_ueqv_R010YNN_generator_12_0200_0299 : Poly :=
[
  term (2 : Rat) [(2, 1), (12, 1)],
  term (2 : Rat) [(3, 1), (13, 1)],
  term (-1 : Rat) [(12, 2)],
  term (-1 : Rat) [(13, 2)]
]

/-- Coefficient term 200 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0200 : Poly :=
[
  term ((3473811042885370880 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (15, 4), (16, 1)]
]

/-- Partial product 200 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0200 : Poly :=
[
  term ((6947622085770741760 : Rat) / 17966088315235317) [(2, 1), (5, 1), (8, 1), (9, 1), (12, 1), (15, 4), (16, 1)],
  term ((6947622085770741760 : Rat) / 17966088315235317) [(3, 1), (5, 1), (8, 1), (9, 1), (13, 1), (15, 4), (16, 1)],
  term ((-3473811042885370880 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (12, 2), (15, 4), (16, 1)],
  term ((-3473811042885370880 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (13, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 200 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0200_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0200
        rs_R010_ueqv_R010YNN_generator_12_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_12_0200 := by
  native_decide

/-- Coefficient term 201 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0201 : Poly :=
[
  term ((1724359833124812800 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 201 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0201 : Poly :=
[
  term ((3448719666249625600 : Rat) / 5988696105078439) [(2, 1), (5, 1), (8, 1), (9, 2), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((3448719666249625600 : Rat) / 5988696105078439) [(3, 1), (5, 1), (8, 1), (9, 2), (10, 1), (13, 2), (16, 1)],
  term ((-1724359833124812800 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (10, 1), (12, 2), (13, 1), (16, 1)],
  term ((-1724359833124812800 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (10, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 201 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0201_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0201
        rs_R010_ueqv_R010YNN_generator_12_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_12_0201 := by
  native_decide

/-- Coefficient term 202 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0202 : Poly :=
[
  term ((-3448719666249625600 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 202 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0202 : Poly :=
[
  term ((-6897439332499251200 : Rat) / 5988696105078439) [(2, 1), (5, 1), (8, 1), (9, 2), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-6897439332499251200 : Rat) / 5988696105078439) [(3, 1), (5, 1), (8, 1), (9, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((3448719666249625600 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((3448719666249625600 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (10, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 202 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0202_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0202
        rs_R010_ueqv_R010YNN_generator_12_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_12_0202 := by
  native_decide

/-- Coefficient term 203 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0203 : Poly :=
[
  term ((-213269996259962880 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 203 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0203 : Poly :=
[
  term ((-426539992519925760 : Rat) / 5988696105078439) [(2, 1), (5, 1), (8, 1), (9, 2), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-426539992519925760 : Rat) / 5988696105078439) [(3, 1), (5, 1), (8, 1), (9, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((213269996259962880 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((213269996259962880 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (11, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 203 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0203_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0203
        rs_R010_ueqv_R010YNN_generator_12_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_12_0203 := by
  native_decide

/-- Coefficient term 204 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0204 : Poly :=
[
  term ((426539992519925760 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 204 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0204 : Poly :=
[
  term ((853079985039851520 : Rat) / 5988696105078439) [(2, 1), (5, 1), (8, 1), (9, 2), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((853079985039851520 : Rat) / 5988696105078439) [(3, 1), (5, 1), (8, 1), (9, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-426539992519925760 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((-426539992519925760 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (11, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 204 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0204_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0204
        rs_R010_ueqv_R010YNN_generator_12_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_12_0204 := by
  native_decide

/-- Coefficient term 205 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0205 : Poly :=
[
  term ((862179916562406400 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (11, 1), (16, 1)]
]

/-- Partial product 205 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0205 : Poly :=
[
  term ((1724359833124812800 : Rat) / 5988696105078439) [(2, 1), (5, 1), (8, 1), (9, 2), (11, 1), (12, 1), (16, 1)],
  term ((1724359833124812800 : Rat) / 5988696105078439) [(3, 1), (5, 1), (8, 1), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-862179916562406400 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (11, 1), (12, 2), (16, 1)],
  term ((-862179916562406400 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 205 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0205_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0205
        rs_R010_ueqv_R010YNN_generator_12_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_12_0205 := by
  native_decide

/-- Coefficient term 206 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0206 : Poly :=
[
  term ((-3448719666249625600 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 206 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0206 : Poly :=
[
  term ((-6897439332499251200 : Rat) / 5988696105078439) [(2, 1), (5, 1), (8, 1), (9, 2), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-6897439332499251200 : Rat) / 5988696105078439) [(3, 1), (5, 1), (8, 1), (9, 2), (13, 2), (15, 2), (16, 1)],
  term ((3448719666249625600 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((3448719666249625600 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 206 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0206_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0206
        rs_R010_ueqv_R010YNN_generator_12_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_12_0206 := by
  native_decide

/-- Coefficient term 207 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0207 : Poly :=
[
  term ((6897439332499251200 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (15, 3), (16, 1)]
]

/-- Partial product 207 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0207 : Poly :=
[
  term ((13794878664998502400 : Rat) / 5988696105078439) [(2, 1), (5, 1), (8, 1), (9, 2), (12, 1), (15, 3), (16, 1)],
  term ((13794878664998502400 : Rat) / 5988696105078439) [(3, 1), (5, 1), (8, 1), (9, 2), (13, 1), (15, 3), (16, 1)],
  term ((-6897439332499251200 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (12, 2), (15, 3), (16, 1)],
  term ((-6897439332499251200 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 207 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0207_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0207
        rs_R010_ueqv_R010YNN_generator_12_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_12_0207 := by
  native_decide

/-- Coefficient term 208 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0208 : Poly :=
[
  term ((-71154509089341440 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 3), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 208 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0208 : Poly :=
[
  term ((-142309018178682880 : Rat) / 53898264945705951) [(2, 1), (5, 1), (8, 1), (9, 3), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-142309018178682880 : Rat) / 53898264945705951) [(3, 1), (5, 1), (8, 1), (9, 3), (13, 2), (15, 1), (16, 1)],
  term ((71154509089341440 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 3), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((71154509089341440 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 3), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 208 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0208_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0208
        rs_R010_ueqv_R010YNN_generator_12_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_12_0208 := by
  native_decide

/-- Coefficient term 209 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0209 : Poly :=
[
  term ((142309018178682880 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 3), (15, 2), (16, 1)]
]

/-- Partial product 209 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0209 : Poly :=
[
  term ((284618036357365760 : Rat) / 53898264945705951) [(2, 1), (5, 1), (8, 1), (9, 3), (12, 1), (15, 2), (16, 1)],
  term ((284618036357365760 : Rat) / 53898264945705951) [(3, 1), (5, 1), (8, 1), (9, 3), (13, 1), (15, 2), (16, 1)],
  term ((-142309018178682880 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 3), (12, 2), (15, 2), (16, 1)],
  term ((-142309018178682880 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 3), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 209 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0209_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0209
        rs_R010_ueqv_R010YNN_generator_12_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_12_0209 := by
  native_decide

/-- Coefficient term 210 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0210 : Poly :=
[
  term ((491901271461279136504 : Rat) / 149717402626960975) [(5, 1), (8, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 210 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0210 : Poly :=
[
  term ((983802542922558273008 : Rat) / 149717402626960975) [(2, 1), (5, 1), (8, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((983802542922558273008 : Rat) / 149717402626960975) [(3, 1), (5, 1), (8, 1), (10, 1), (13, 2), (16, 1)],
  term ((-491901271461279136504 : Rat) / 149717402626960975) [(5, 1), (8, 1), (10, 1), (12, 2), (13, 1), (16, 1)],
  term ((-491901271461279136504 : Rat) / 149717402626960975) [(5, 1), (8, 1), (10, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 210 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0210_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0210
        rs_R010_ueqv_R010YNN_generator_12_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_12_0210 := by
  native_decide

/-- Coefficient term 211 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0211 : Poly :=
[
  term ((-983802542922558273008 : Rat) / 149717402626960975) [(5, 1), (8, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 211 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0211 : Poly :=
[
  term ((-1967605085845116546016 : Rat) / 149717402626960975) [(2, 1), (5, 1), (8, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1967605085845116546016 : Rat) / 149717402626960975) [(3, 1), (5, 1), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((983802542922558273008 : Rat) / 149717402626960975) [(5, 1), (8, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((983802542922558273008 : Rat) / 149717402626960975) [(5, 1), (8, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 211 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0211_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0211
        rs_R010_ueqv_R010YNN_generator_12_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_12_0211 := by
  native_decide

/-- Coefficient term 212 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0212 : Poly :=
[
  term ((-956932805770307263832 : Rat) / 1347456623642648775) [(5, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 212 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0212 : Poly :=
[
  term ((-1913865611540614527664 : Rat) / 1347456623642648775) [(2, 1), (5, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1913865611540614527664 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (8, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((956932805770307263832 : Rat) / 1347456623642648775) [(5, 1), (8, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((956932805770307263832 : Rat) / 1347456623642648775) [(5, 1), (8, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 212 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0212_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0212
        rs_R010_ueqv_R010YNN_generator_12_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_12_0212 := by
  native_decide

/-- Coefficient term 213 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0213 : Poly :=
[
  term ((1913865611540614527664 : Rat) / 1347456623642648775) [(5, 1), (8, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 213 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0213 : Poly :=
[
  term ((3827731223081229055328 : Rat) / 1347456623642648775) [(2, 1), (5, 1), (8, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((3827731223081229055328 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (8, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1913865611540614527664 : Rat) / 1347456623642648775) [(5, 1), (8, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((-1913865611540614527664 : Rat) / 1347456623642648775) [(5, 1), (8, 1), (11, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 213 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0213_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0213
        rs_R010_ueqv_R010YNN_generator_12_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_12_0213 := by
  native_decide

/-- Coefficient term 214 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0214 : Poly :=
[
  term ((245950635730639568252 : Rat) / 149717402626960975) [(5, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 214 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0214 : Poly :=
[
  term ((491901271461279136504 : Rat) / 149717402626960975) [(2, 1), (5, 1), (8, 1), (11, 1), (12, 1), (16, 1)],
  term ((491901271461279136504 : Rat) / 149717402626960975) [(3, 1), (5, 1), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((-245950635730639568252 : Rat) / 149717402626960975) [(5, 1), (8, 1), (11, 1), (12, 2), (16, 1)],
  term ((-245950635730639568252 : Rat) / 149717402626960975) [(5, 1), (8, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 214 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0214_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0214
        rs_R010_ueqv_R010YNN_generator_12_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_12_0214 := by
  native_decide

/-- Coefficient term 215 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0215 : Poly :=
[
  term ((-983802542922558273008 : Rat) / 149717402626960975) [(5, 1), (8, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 215 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0215 : Poly :=
[
  term ((-1967605085845116546016 : Rat) / 149717402626960975) [(2, 1), (5, 1), (8, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1967605085845116546016 : Rat) / 149717402626960975) [(3, 1), (5, 1), (8, 1), (13, 2), (15, 2), (16, 1)],
  term ((983802542922558273008 : Rat) / 149717402626960975) [(5, 1), (8, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((983802542922558273008 : Rat) / 149717402626960975) [(5, 1), (8, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 215 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0215_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0215
        rs_R010_ueqv_R010YNN_generator_12_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_12_0215 := by
  native_decide

/-- Coefficient term 216 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0216 : Poly :=
[
  term ((1967605085845116546016 : Rat) / 149717402626960975) [(5, 1), (8, 1), (15, 3), (16, 1)]
]

/-- Partial product 216 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0216 : Poly :=
[
  term ((3935210171690233092032 : Rat) / 149717402626960975) [(2, 1), (5, 1), (8, 1), (12, 1), (15, 3), (16, 1)],
  term ((3935210171690233092032 : Rat) / 149717402626960975) [(3, 1), (5, 1), (8, 1), (13, 1), (15, 3), (16, 1)],
  term ((-1967605085845116546016 : Rat) / 149717402626960975) [(5, 1), (8, 1), (12, 2), (15, 3), (16, 1)],
  term ((-1967605085845116546016 : Rat) / 149717402626960975) [(5, 1), (8, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 216 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0216_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0216
        rs_R010_ueqv_R010YNN_generator_12_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_12_0216 := by
  native_decide

/-- Coefficient term 217 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0217 : Poly :=
[
  term ((-5870580103587404800 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 217 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0217 : Poly :=
[
  term ((-11741160207174809600 : Rat) / 53898264945705951) [(2, 1), (5, 1), (9, 1), (10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-11741160207174809600 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 1), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((5870580103587404800 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((5870580103587404800 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 1), (11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 217 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0217_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0217
        rs_R010_ueqv_R010YNN_generator_12_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_12_0217 := by
  native_decide

/-- Coefficient term 218 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0218 : Poly :=
[
  term ((11741160207174809600 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 218 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0218 : Poly :=
[
  term ((23482320414349619200 : Rat) / 53898264945705951) [(2, 1), (5, 1), (9, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((23482320414349619200 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-11741160207174809600 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-11741160207174809600 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 218 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0218_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0218
        rs_R010_ueqv_R010YNN_generator_12_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_12_0218 := by
  native_decide

/-- Coefficient term 219 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0219 : Poly :=
[
  term ((106229777509048983560 : Rat) / 161694794837117853) [(5, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 219 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0219 : Poly :=
[
  term ((212459555018097967120 : Rat) / 161694794837117853) [(2, 1), (5, 1), (9, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((212459555018097967120 : Rat) / 161694794837117853) [(3, 1), (5, 1), (9, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-106229777509048983560 : Rat) / 161694794837117853) [(5, 1), (9, 1), (10, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-106229777509048983560 : Rat) / 161694794837117853) [(5, 1), (9, 1), (10, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 219 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0219_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0219
        rs_R010_ueqv_R010YNN_generator_12_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_12_0219 := by
  native_decide

/-- Coefficient term 220 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0220 : Poly :=
[
  term ((-212459555018097967120 : Rat) / 161694794837117853) [(5, 1), (9, 1), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 220 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0220 : Poly :=
[
  term ((-424919110036195934240 : Rat) / 161694794837117853) [(2, 1), (5, 1), (9, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-424919110036195934240 : Rat) / 161694794837117853) [(3, 1), (5, 1), (9, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((212459555018097967120 : Rat) / 161694794837117853) [(5, 1), (9, 1), (10, 1), (12, 2), (15, 2), (16, 1)],
  term ((212459555018097967120 : Rat) / 161694794837117853) [(5, 1), (9, 1), (10, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 220 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0220_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0220
        rs_R010_ueqv_R010YNN_generator_12_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_12_0220 := by
  native_decide

/-- Coefficient term 221 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0221 : Poly :=
[
  term ((11077155358648986880 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 221 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0221 : Poly :=
[
  term ((22154310717297973760 : Rat) / 53898264945705951) [(2, 1), (5, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((22154310717297973760 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-11077155358648986880 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-11077155358648986880 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 221 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0221_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0221
        rs_R010_ueqv_R010YNN_generator_12_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_12_0221 := by
  native_decide

/-- Coefficient term 222 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0222 : Poly :=
[
  term ((-301472804500097184344 : Rat) / 1347456623642648775) [(5, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 222 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0222 : Poly :=
[
  term ((-602945609000194368688 : Rat) / 1347456623642648775) [(2, 1), (5, 1), (9, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-602945609000194368688 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((301472804500097184344 : Rat) / 1347456623642648775) [(5, 1), (9, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((301472804500097184344 : Rat) / 1347456623642648775) [(5, 1), (9, 1), (11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 222 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0222_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0222
        rs_R010_ueqv_R010YNN_generator_12_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_12_0222 := by
  native_decide

/-- Coefficient term 223 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0223 : Poly :=
[
  term ((64471934649441939632 : Rat) / 149717402626960975) [(5, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 223 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0223 : Poly :=
[
  term ((128943869298883879264 : Rat) / 149717402626960975) [(2, 1), (5, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((128943869298883879264 : Rat) / 149717402626960975) [(3, 1), (5, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-64471934649441939632 : Rat) / 149717402626960975) [(5, 1), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-64471934649441939632 : Rat) / 149717402626960975) [(5, 1), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 223 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0223_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0223
        rs_R010_ueqv_R010YNN_generator_12_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_12_0223 := by
  native_decide

/-- Coefficient term 224 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0224 : Poly :=
[
  term ((-22154310717297973760 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 1), (15, 3), (16, 1)]
]

/-- Partial product 224 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0224 : Poly :=
[
  term ((-44308621434595947520 : Rat) / 53898264945705951) [(2, 1), (5, 1), (9, 1), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((-44308621434595947520 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((22154310717297973760 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 1), (12, 2), (15, 3), (16, 1)],
  term ((22154310717297973760 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 224 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0224_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0224
        rs_R010_ueqv_R010YNN_generator_12_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_12_0224 := by
  native_decide

/-- Coefficient term 225 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0225 : Poly :=
[
  term ((-738825248688638720 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 225 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0225 : Poly :=
[
  term ((-1477650497377277440 : Rat) / 53898264945705951) [(2, 1), (5, 1), (9, 1), (11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1477650497377277440 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 1), (11, 2), (13, 2), (15, 1), (16, 1)],
  term ((738825248688638720 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((738825248688638720 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 2), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 225 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0225_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0225
        rs_R010_ueqv_R010YNN_generator_12_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_12_0225 := by
  native_decide

/-- Coefficient term 226 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0226 : Poly :=
[
  term ((1477650497377277440 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 2), (15, 2), (16, 1)]
]

/-- Partial product 226 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0226 : Poly :=
[
  term ((2955300994754554880 : Rat) / 53898264945705951) [(2, 1), (5, 1), (9, 1), (11, 2), (12, 1), (15, 2), (16, 1)],
  term ((2955300994754554880 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((-1477650497377277440 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 2), (12, 2), (15, 2), (16, 1)],
  term ((-1477650497377277440 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 226 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0226_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0226
        rs_R010_ueqv_R010YNN_generator_12_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_12_0226 := by
  native_decide

/-- Coefficient term 227 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0227 : Poly :=
[
  term ((-2789026402405913600 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 2), (16, 1)]
]

/-- Partial product 227 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0227 : Poly :=
[
  term ((-5578052804811827200 : Rat) / 53898264945705951) [(2, 1), (5, 1), (9, 1), (11, 2), (12, 1), (16, 1)],
  term ((-5578052804811827200 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((2789026402405913600 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 2), (12, 2), (16, 1)],
  term ((2789026402405913600 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 227 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0227_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0227
        rs_R010_ueqv_R010YNN_generator_12_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_12_0227 := by
  native_decide

/-- Coefficient term 228 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0228 : Poly :=
[
  term ((-241647746952908800 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 3), (13, 1), (16, 1)]
]

/-- Partial product 228 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0228 : Poly :=
[
  term ((-483295493905817600 : Rat) / 53898264945705951) [(2, 1), (5, 1), (9, 1), (11, 3), (12, 1), (13, 1), (16, 1)],
  term ((-483295493905817600 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 1), (11, 3), (13, 2), (16, 1)],
  term ((241647746952908800 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 3), (12, 2), (13, 1), (16, 1)],
  term ((241647746952908800 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 3), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 228 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0228_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0228
        rs_R010_ueqv_R010YNN_generator_12_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_12_0228 := by
  native_decide

/-- Coefficient term 229 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0229 : Poly :=
[
  term ((483295493905817600 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 3), (15, 1), (16, 1)]
]

/-- Partial product 229 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0229 : Poly :=
[
  term ((966590987811635200 : Rat) / 53898264945705951) [(2, 1), (5, 1), (9, 1), (11, 3), (12, 1), (15, 1), (16, 1)],
  term ((966590987811635200 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 1), (11, 3), (13, 1), (15, 1), (16, 1)],
  term ((-483295493905817600 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 3), (12, 2), (15, 1), (16, 1)],
  term ((-483295493905817600 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 3), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 229 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0229_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0229
        rs_R010_ueqv_R010YNN_generator_12_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_12_0229 := by
  native_decide

/-- Coefficient term 230 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0230 : Poly :=
[
  term ((-297883139340409877816 : Rat) / 1347456623642648775) [(5, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 230 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0230 : Poly :=
[
  term ((-595766278680819755632 : Rat) / 1347456623642648775) [(2, 1), (5, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-595766278680819755632 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((297883139340409877816 : Rat) / 1347456623642648775) [(5, 1), (9, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((297883139340409877816 : Rat) / 1347456623642648775) [(5, 1), (9, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 230 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0230_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0230
        rs_R010_ueqv_R010YNN_generator_12_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_12_0230 := by
  native_decide

/-- Coefficient term 231 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0231 : Poly :=
[
  term ((3631711544834705920 : Rat) / 53898264945705951) [(5, 1), (9, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 231 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0231 : Poly :=
[
  term ((7263423089669411840 : Rat) / 53898264945705951) [(2, 1), (5, 1), (9, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((7263423089669411840 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 1), (13, 2), (15, 3), (16, 1)],
  term ((-3631711544834705920 : Rat) / 53898264945705951) [(5, 1), (9, 1), (12, 2), (13, 1), (15, 3), (16, 1)],
  term ((-3631711544834705920 : Rat) / 53898264945705951) [(5, 1), (9, 1), (13, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 231 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0231_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0231
        rs_R010_ueqv_R010YNN_generator_12_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_12_0231 := by
  native_decide

/-- Coefficient term 232 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0232 : Poly :=
[
  term ((595766278680819755632 : Rat) / 1347456623642648775) [(5, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 232 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0232 : Poly :=
[
  term ((1191532557361639511264 : Rat) / 1347456623642648775) [(2, 1), (5, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((1191532557361639511264 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-595766278680819755632 : Rat) / 1347456623642648775) [(5, 1), (9, 1), (12, 2), (15, 2), (16, 1)],
  term ((-595766278680819755632 : Rat) / 1347456623642648775) [(5, 1), (9, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 232 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0232_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0232
        rs_R010_ueqv_R010YNN_generator_12_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_12_0232 := by
  native_decide

/-- Coefficient term 233 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0233 : Poly :=
[
  term ((-7263423089669411840 : Rat) / 53898264945705951) [(5, 1), (9, 1), (15, 4), (16, 1)]
]

/-- Partial product 233 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0233 : Poly :=
[
  term ((-14526846179338823680 : Rat) / 53898264945705951) [(2, 1), (5, 1), (9, 1), (12, 1), (15, 4), (16, 1)],
  term ((-14526846179338823680 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 1), (13, 1), (15, 4), (16, 1)],
  term ((7263423089669411840 : Rat) / 53898264945705951) [(5, 1), (9, 1), (12, 2), (15, 4), (16, 1)],
  term ((7263423089669411840 : Rat) / 53898264945705951) [(5, 1), (9, 1), (13, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 233 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0233_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0233
        rs_R010_ueqv_R010YNN_generator_12_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_12_0233 := by
  native_decide

/-- Coefficient term 234 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0234 : Poly :=
[
  term ((-941858384336844800 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 234 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0234 : Poly :=
[
  term ((-1883716768673689600 : Rat) / 53898264945705951) [(2, 1), (5, 1), (9, 2), (10, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1883716768673689600 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 2), (10, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((941858384336844800 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((941858384336844800 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 234 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0234_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0234
        rs_R010_ueqv_R010YNN_generator_12_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_12_0234 := by
  native_decide

/-- Coefficient term 235 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0235 : Poly :=
[
  term ((1883716768673689600 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 235 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0235 : Poly :=
[
  term ((3767433537347379200 : Rat) / 53898264945705951) [(2, 1), (5, 1), (9, 2), (10, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((3767433537347379200 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 2), (10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1883716768673689600 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((-1883716768673689600 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (11, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 235 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0235_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0235
        rs_R010_ueqv_R010YNN_generator_12_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_12_0235 := by
  native_decide

/-- Coefficient term 236 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0236 : Poly :=
[
  term ((-1263204015594680320 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 236 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0236 : Poly :=
[
  term ((-2526408031189360640 : Rat) / 53898264945705951) [(2, 1), (5, 1), (9, 2), (10, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2526408031189360640 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 2), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((1263204015594680320 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((1263204015594680320 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 236 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0236_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0236
        rs_R010_ueqv_R010YNN_generator_12_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_12_0236 := by
  native_decide

/-- Coefficient term 237 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0237 : Poly :=
[
  term ((-407171093581226569888 : Rat) / 149717402626960975) [(5, 1), (9, 2), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 237 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0237 : Poly :=
[
  term ((-814342187162453139776 : Rat) / 149717402626960975) [(2, 1), (5, 1), (9, 2), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-814342187162453139776 : Rat) / 149717402626960975) [(3, 1), (5, 1), (9, 2), (10, 1), (13, 2), (16, 1)],
  term ((407171093581226569888 : Rat) / 149717402626960975) [(5, 1), (9, 2), (10, 1), (12, 2), (13, 1), (16, 1)],
  term ((407171093581226569888 : Rat) / 149717402626960975) [(5, 1), (9, 2), (10, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 237 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0237_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0237
        rs_R010_ueqv_R010YNN_generator_12_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_12_0237 := by
  native_decide

/-- Coefficient term 238 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0238 : Poly :=
[
  term ((814342187162453139776 : Rat) / 149717402626960975) [(5, 1), (9, 2), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 238 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0238 : Poly :=
[
  term ((1628684374324906279552 : Rat) / 149717402626960975) [(2, 1), (5, 1), (9, 2), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((1628684374324906279552 : Rat) / 149717402626960975) [(3, 1), (5, 1), (9, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-814342187162453139776 : Rat) / 149717402626960975) [(5, 1), (9, 2), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-814342187162453139776 : Rat) / 149717402626960975) [(5, 1), (9, 2), (10, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 238 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0238_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0238
        rs_R010_ueqv_R010YNN_generator_12_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_12_0238 := by
  native_decide

/-- Coefficient term 239 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0239 : Poly :=
[
  term ((2526408031189360640 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (15, 3), (16, 1)]
]

/-- Partial product 239 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0239 : Poly :=
[
  term ((5052816062378721280 : Rat) / 53898264945705951) [(2, 1), (5, 1), (9, 2), (10, 1), (12, 1), (15, 3), (16, 1)],
  term ((5052816062378721280 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 2), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((-2526408031189360640 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (12, 2), (15, 3), (16, 1)],
  term ((-2526408031189360640 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 239 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0239_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0239
        rs_R010_ueqv_R010YNN_generator_12_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_12_0239 := by
  native_decide

/-- Coefficient term 240 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0240 : Poly :=
[
  term ((2109193102494177280 : Rat) / 53898264945705951) [(5, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 240 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0240 : Poly :=
[
  term ((4218386204988354560 : Rat) / 53898264945705951) [(2, 1), (5, 1), (9, 2), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((4218386204988354560 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-2109193102494177280 : Rat) / 53898264945705951) [(5, 1), (9, 2), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-2109193102494177280 : Rat) / 53898264945705951) [(5, 1), (9, 2), (11, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 240 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0240_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0240
        rs_R010_ueqv_R010YNN_generator_12_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_12_0240 := by
  native_decide

/-- Coefficient term 241 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0241 : Poly :=
[
  term ((-4218386204988354560 : Rat) / 53898264945705951) [(5, 1), (9, 2), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 241 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0241 : Poly :=
[
  term ((-8436772409976709120 : Rat) / 53898264945705951) [(2, 1), (5, 1), (9, 2), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-8436772409976709120 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((4218386204988354560 : Rat) / 53898264945705951) [(5, 1), (9, 2), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((4218386204988354560 : Rat) / 53898264945705951) [(5, 1), (9, 2), (11, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 241 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0241_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0241
        rs_R010_ueqv_R010YNN_generator_12_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_12_0241 := by
  native_decide

/-- Coefficient term 242 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0242 : Poly :=
[
  term ((-203585546790613284944 : Rat) / 149717402626960975) [(5, 1), (9, 2), (11, 1), (16, 1)]
]

/-- Partial product 242 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0242 : Poly :=
[
  term ((-407171093581226569888 : Rat) / 149717402626960975) [(2, 1), (5, 1), (9, 2), (11, 1), (12, 1), (16, 1)],
  term ((-407171093581226569888 : Rat) / 149717402626960975) [(3, 1), (5, 1), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((203585546790613284944 : Rat) / 149717402626960975) [(5, 1), (9, 2), (11, 1), (12, 2), (16, 1)],
  term ((203585546790613284944 : Rat) / 149717402626960975) [(5, 1), (9, 2), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 242 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0242_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0242
        rs_R010_ueqv_R010YNN_generator_12_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_12_0242 := by
  native_decide

/-- Coefficient term 243 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0243 : Poly :=
[
  term ((1742573995256299520 : Rat) / 53898264945705951) [(5, 1), (9, 2), (11, 2), (13, 1), (16, 1)]
]

/-- Partial product 243 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0243 : Poly :=
[
  term ((3485147990512599040 : Rat) / 53898264945705951) [(2, 1), (5, 1), (9, 2), (11, 2), (12, 1), (13, 1), (16, 1)],
  term ((3485147990512599040 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 2), (11, 2), (13, 2), (16, 1)],
  term ((-1742573995256299520 : Rat) / 53898264945705951) [(5, 1), (9, 2), (11, 2), (12, 2), (13, 1), (16, 1)],
  term ((-1742573995256299520 : Rat) / 53898264945705951) [(5, 1), (9, 2), (11, 2), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 243 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0243_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0243
        rs_R010_ueqv_R010YNN_generator_12_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_12_0243 := by
  native_decide

/-- Coefficient term 244 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0244 : Poly :=
[
  term ((-3485147990512599040 : Rat) / 53898264945705951) [(5, 1), (9, 2), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 244 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0244 : Poly :=
[
  term ((-6970295981025198080 : Rat) / 53898264945705951) [(2, 1), (5, 1), (9, 2), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-6970295981025198080 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((3485147990512599040 : Rat) / 53898264945705951) [(5, 1), (9, 2), (11, 2), (12, 2), (15, 1), (16, 1)],
  term ((3485147990512599040 : Rat) / 53898264945705951) [(5, 1), (9, 2), (11, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 244 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0244_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0244
        rs_R010_ueqv_R010YNN_generator_12_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_12_0244 := by
  native_decide

/-- Coefficient term 245 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0245 : Poly :=
[
  term ((7360659784851945265984 : Rat) / 1347456623642648775) [(5, 1), (9, 2), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 245 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0245 : Poly :=
[
  term ((14721319569703890531968 : Rat) / 1347456623642648775) [(2, 1), (5, 1), (9, 2), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((14721319569703890531968 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (9, 2), (13, 2), (15, 2), (16, 1)],
  term ((-7360659784851945265984 : Rat) / 1347456623642648775) [(5, 1), (9, 2), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-7360659784851945265984 : Rat) / 1347456623642648775) [(5, 1), (9, 2), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 245 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0245_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0245
        rs_R010_ueqv_R010YNN_generator_12_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_12_0245 := by
  native_decide

/-- Coefficient term 246 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0246 : Poly :=
[
  term ((-14721319569703890531968 : Rat) / 1347456623642648775) [(5, 1), (9, 2), (15, 3), (16, 1)]
]

/-- Partial product 246 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0246 : Poly :=
[
  term ((-29442639139407781063936 : Rat) / 1347456623642648775) [(2, 1), (5, 1), (9, 2), (12, 1), (15, 3), (16, 1)],
  term ((-29442639139407781063936 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (9, 2), (13, 1), (15, 3), (16, 1)],
  term ((14721319569703890531968 : Rat) / 1347456623642648775) [(5, 1), (9, 2), (12, 2), (15, 3), (16, 1)],
  term ((14721319569703890531968 : Rat) / 1347456623642648775) [(5, 1), (9, 2), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 246 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0246_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0246
        rs_R010_ueqv_R010YNN_generator_12_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_12_0246 := by
  native_decide

/-- Coefficient term 247 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0247 : Poly :=
[
  term ((127103842707251200 : Rat) / 17966088315235317) [(5, 1), (9, 3), (10, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 247 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0247 : Poly :=
[
  term ((254207685414502400 : Rat) / 17966088315235317) [(2, 1), (5, 1), (9, 3), (10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((254207685414502400 : Rat) / 17966088315235317) [(3, 1), (5, 1), (9, 3), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((-127103842707251200 : Rat) / 17966088315235317) [(5, 1), (9, 3), (10, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-127103842707251200 : Rat) / 17966088315235317) [(5, 1), (9, 3), (10, 1), (11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 247 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0247_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0247
        rs_R010_ueqv_R010YNN_generator_12_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_12_0247 := by
  native_decide

/-- Coefficient term 248 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0248 : Poly :=
[
  term ((-254207685414502400 : Rat) / 17966088315235317) [(5, 1), (9, 3), (10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 248 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0248 : Poly :=
[
  term ((-508415370829004800 : Rat) / 17966088315235317) [(2, 1), (5, 1), (9, 3), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-508415370829004800 : Rat) / 17966088315235317) [(3, 1), (5, 1), (9, 3), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((254207685414502400 : Rat) / 17966088315235317) [(5, 1), (9, 3), (10, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((254207685414502400 : Rat) / 17966088315235317) [(5, 1), (9, 3), (10, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 248 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0248_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0248
        rs_R010_ueqv_R010YNN_generator_12_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_12_0248 := by
  native_decide

/-- Coefficient term 249 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0249 : Poly :=
[
  term ((4440881445547294720 : Rat) / 53898264945705951) [(5, 1), (9, 3), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 249 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0249 : Poly :=
[
  term ((8881762891094589440 : Rat) / 53898264945705951) [(2, 1), (5, 1), (9, 3), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((8881762891094589440 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 3), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-4440881445547294720 : Rat) / 53898264945705951) [(5, 1), (9, 3), (10, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-4440881445547294720 : Rat) / 53898264945705951) [(5, 1), (9, 3), (10, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 249 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0249_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0249
        rs_R010_ueqv_R010YNN_generator_12_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_12_0249 := by
  native_decide

/-- Coefficient term 250 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0250 : Poly :=
[
  term ((-8881762891094589440 : Rat) / 53898264945705951) [(5, 1), (9, 3), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 250 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0250 : Poly :=
[
  term ((-17763525782189178880 : Rat) / 53898264945705951) [(2, 1), (5, 1), (9, 3), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-17763525782189178880 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 3), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((8881762891094589440 : Rat) / 53898264945705951) [(5, 1), (9, 3), (10, 1), (12, 2), (15, 2), (16, 1)],
  term ((8881762891094589440 : Rat) / 53898264945705951) [(5, 1), (9, 3), (10, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 250 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0250_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0250
        rs_R010_ueqv_R010YNN_generator_12_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_12_0250 := by
  native_decide

/-- Coefficient term 251 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0251 : Poly :=
[
  term ((-254207685414502400 : Rat) / 17966088315235317) [(5, 1), (9, 3), (11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 251 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0251 : Poly :=
[
  term ((-508415370829004800 : Rat) / 17966088315235317) [(2, 1), (5, 1), (9, 3), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-508415370829004800 : Rat) / 17966088315235317) [(3, 1), (5, 1), (9, 3), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((254207685414502400 : Rat) / 17966088315235317) [(5, 1), (9, 3), (11, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((254207685414502400 : Rat) / 17966088315235317) [(5, 1), (9, 3), (11, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 251 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0251_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0251
        rs_R010_ueqv_R010YNN_generator_12_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_12_0251 := by
  native_decide

/-- Coefficient term 252 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0252 : Poly :=
[
  term ((-2414398072269209600 : Rat) / 53898264945705951) [(5, 1), (9, 3), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 252 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0252 : Poly :=
[
  term ((-4828796144538419200 : Rat) / 53898264945705951) [(2, 1), (5, 1), (9, 3), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-4828796144538419200 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 3), (11, 1), (13, 2), (16, 1)],
  term ((2414398072269209600 : Rat) / 53898264945705951) [(5, 1), (9, 3), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((2414398072269209600 : Rat) / 53898264945705951) [(5, 1), (9, 3), (11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 252 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0252_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0252
        rs_R010_ueqv_R010YNN_generator_12_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_12_0252 := by
  native_decide

/-- Coefficient term 253 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0253 : Poly :=
[
  term ((4828796144538419200 : Rat) / 53898264945705951) [(5, 1), (9, 3), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 253 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0253 : Poly :=
[
  term ((9657592289076838400 : Rat) / 53898264945705951) [(2, 1), (5, 1), (9, 3), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((9657592289076838400 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 3), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4828796144538419200 : Rat) / 53898264945705951) [(5, 1), (9, 3), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-4828796144538419200 : Rat) / 53898264945705951) [(5, 1), (9, 3), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 253 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0253_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0253
        rs_R010_ueqv_R010YNN_generator_12_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_12_0253 := by
  native_decide

/-- Coefficient term 254 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0254 : Poly :=
[
  term ((508415370829004800 : Rat) / 17966088315235317) [(5, 1), (9, 3), (11, 1), (15, 3), (16, 1)]
]

/-- Partial product 254 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0254 : Poly :=
[
  term ((1016830741658009600 : Rat) / 17966088315235317) [(2, 1), (5, 1), (9, 3), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((1016830741658009600 : Rat) / 17966088315235317) [(3, 1), (5, 1), (9, 3), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-508415370829004800 : Rat) / 17966088315235317) [(5, 1), (9, 3), (11, 1), (12, 2), (15, 3), (16, 1)],
  term ((-508415370829004800 : Rat) / 17966088315235317) [(5, 1), (9, 3), (11, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 254 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0254_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0254
        rs_R010_ueqv_R010YNN_generator_12_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_12_0254 := by
  native_decide

/-- Coefficient term 255 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0255 : Poly :=
[
  term ((63551921353625600 : Rat) / 17966088315235317) [(5, 1), (9, 3), (11, 2), (16, 1)]
]

/-- Partial product 255 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0255 : Poly :=
[
  term ((127103842707251200 : Rat) / 17966088315235317) [(2, 1), (5, 1), (9, 3), (11, 2), (12, 1), (16, 1)],
  term ((127103842707251200 : Rat) / 17966088315235317) [(3, 1), (5, 1), (9, 3), (11, 2), (13, 1), (16, 1)],
  term ((-63551921353625600 : Rat) / 17966088315235317) [(5, 1), (9, 3), (11, 2), (12, 2), (16, 1)],
  term ((-63551921353625600 : Rat) / 17966088315235317) [(5, 1), (9, 3), (11, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 255 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0255_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0255
        rs_R010_ueqv_R010YNN_generator_12_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_12_0255 := by
  native_decide

/-- Coefficient term 256 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0256 : Poly :=
[
  term ((-2865492524826910720 : Rat) / 53898264945705951) [(5, 1), (9, 3), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 256 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0256 : Poly :=
[
  term ((-5730985049653821440 : Rat) / 53898264945705951) [(2, 1), (5, 1), (9, 3), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5730985049653821440 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 3), (13, 2), (15, 1), (16, 1)],
  term ((2865492524826910720 : Rat) / 53898264945705951) [(5, 1), (9, 3), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((2865492524826910720 : Rat) / 53898264945705951) [(5, 1), (9, 3), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 256 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0256_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0256
        rs_R010_ueqv_R010YNN_generator_12_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_12_0256 := by
  native_decide

/-- Coefficient term 257 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0257 : Poly :=
[
  term ((5730985049653821440 : Rat) / 53898264945705951) [(5, 1), (9, 3), (15, 2), (16, 1)]
]

/-- Partial product 257 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0257 : Poly :=
[
  term ((11461970099307642880 : Rat) / 53898264945705951) [(2, 1), (5, 1), (9, 3), (12, 1), (15, 2), (16, 1)],
  term ((11461970099307642880 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 3), (13, 1), (15, 2), (16, 1)],
  term ((-5730985049653821440 : Rat) / 53898264945705951) [(5, 1), (9, 3), (12, 2), (15, 2), (16, 1)],
  term ((-5730985049653821440 : Rat) / 53898264945705951) [(5, 1), (9, 3), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 257 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0257_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0257
        rs_R010_ueqv_R010YNN_generator_12_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_12_0257 := by
  native_decide

/-- Coefficient term 258 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0258 : Poly :=
[
  term ((-1435727629753876480 : Rat) / 17966088315235317) [(5, 1), (9, 4), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 258 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0258 : Poly :=
[
  term ((-2871455259507752960 : Rat) / 17966088315235317) [(2, 1), (5, 1), (9, 4), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-2871455259507752960 : Rat) / 17966088315235317) [(3, 1), (5, 1), (9, 4), (10, 1), (13, 2), (16, 1)],
  term ((1435727629753876480 : Rat) / 17966088315235317) [(5, 1), (9, 4), (10, 1), (12, 2), (13, 1), (16, 1)],
  term ((1435727629753876480 : Rat) / 17966088315235317) [(5, 1), (9, 4), (10, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 258 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0258_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0258
        rs_R010_ueqv_R010YNN_generator_12_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_12_0258 := by
  native_decide

/-- Coefficient term 259 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0259 : Poly :=
[
  term ((2871455259507752960 : Rat) / 17966088315235317) [(5, 1), (9, 4), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 259 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0259 : Poly :=
[
  term ((5742910519015505920 : Rat) / 17966088315235317) [(2, 1), (5, 1), (9, 4), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((5742910519015505920 : Rat) / 17966088315235317) [(3, 1), (5, 1), (9, 4), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2871455259507752960 : Rat) / 17966088315235317) [(5, 1), (9, 4), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-2871455259507752960 : Rat) / 17966088315235317) [(5, 1), (9, 4), (10, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 259 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0259_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0259
        rs_R010_ueqv_R010YNN_generator_12_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_12_0259 := by
  native_decide

/-- Coefficient term 260 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0260 : Poly :=
[
  term ((-717863814876938240 : Rat) / 17966088315235317) [(5, 1), (9, 4), (11, 1), (16, 1)]
]

/-- Partial product 260 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0260 : Poly :=
[
  term ((-1435727629753876480 : Rat) / 17966088315235317) [(2, 1), (5, 1), (9, 4), (11, 1), (12, 1), (16, 1)],
  term ((-1435727629753876480 : Rat) / 17966088315235317) [(3, 1), (5, 1), (9, 4), (11, 1), (13, 1), (16, 1)],
  term ((717863814876938240 : Rat) / 17966088315235317) [(5, 1), (9, 4), (11, 1), (12, 2), (16, 1)],
  term ((717863814876938240 : Rat) / 17966088315235317) [(5, 1), (9, 4), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 260 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0260_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0260
        rs_R010_ueqv_R010YNN_generator_12_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_12_0260 := by
  native_decide

/-- Coefficient term 261 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0261 : Poly :=
[
  term ((2871455259507752960 : Rat) / 17966088315235317) [(5, 1), (9, 4), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 261 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0261 : Poly :=
[
  term ((5742910519015505920 : Rat) / 17966088315235317) [(2, 1), (5, 1), (9, 4), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((5742910519015505920 : Rat) / 17966088315235317) [(3, 1), (5, 1), (9, 4), (13, 2), (15, 2), (16, 1)],
  term ((-2871455259507752960 : Rat) / 17966088315235317) [(5, 1), (9, 4), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-2871455259507752960 : Rat) / 17966088315235317) [(5, 1), (9, 4), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 261 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0261_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0261
        rs_R010_ueqv_R010YNN_generator_12_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_12_0261 := by
  native_decide

/-- Coefficient term 262 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0262 : Poly :=
[
  term ((-5742910519015505920 : Rat) / 17966088315235317) [(5, 1), (9, 4), (15, 3), (16, 1)]
]

/-- Partial product 262 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0262 : Poly :=
[
  term ((-11485821038031011840 : Rat) / 17966088315235317) [(2, 1), (5, 1), (9, 4), (12, 1), (15, 3), (16, 1)],
  term ((-11485821038031011840 : Rat) / 17966088315235317) [(3, 1), (5, 1), (9, 4), (13, 1), (15, 3), (16, 1)],
  term ((5742910519015505920 : Rat) / 17966088315235317) [(5, 1), (9, 4), (12, 2), (15, 3), (16, 1)],
  term ((5742910519015505920 : Rat) / 17966088315235317) [(5, 1), (9, 4), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 262 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0262_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0262
        rs_R010_ueqv_R010YNN_generator_12_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_12_0262 := by
  native_decide

/-- Coefficient term 263 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0263 : Poly :=
[
  term ((1293002511747310720 : Rat) / 17966088315235317) [(5, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 263 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0263 : Poly :=
[
  term ((2586005023494621440 : Rat) / 17966088315235317) [(2, 1), (5, 1), (10, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((2586005023494621440 : Rat) / 17966088315235317) [(3, 1), (5, 1), (10, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1293002511747310720 : Rat) / 17966088315235317) [(5, 1), (10, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1293002511747310720 : Rat) / 17966088315235317) [(5, 1), (10, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 263 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0263_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0263
        rs_R010_ueqv_R010YNN_generator_12_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_12_0263 := by
  native_decide

/-- Coefficient term 264 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0264 : Poly :=
[
  term ((-2586005023494621440 : Rat) / 17966088315235317) [(5, 1), (10, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 264 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0264 : Poly :=
[
  term ((-5172010046989242880 : Rat) / 17966088315235317) [(2, 1), (5, 1), (10, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-5172010046989242880 : Rat) / 17966088315235317) [(3, 1), (5, 1), (10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((2586005023494621440 : Rat) / 17966088315235317) [(5, 1), (10, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((2586005023494621440 : Rat) / 17966088315235317) [(5, 1), (10, 1), (11, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 264 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0264_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0264
        rs_R010_ueqv_R010YNN_generator_12_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_12_0264 := by
  native_decide

/-- Coefficient term 265 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0265 : Poly :=
[
  term ((-359463415085447805712 : Rat) / 269491324728529755) [(5, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 265 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0265 : Poly :=
[
  term ((-718926830170895611424 : Rat) / 269491324728529755) [(2, 1), (5, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-718926830170895611424 : Rat) / 269491324728529755) [(3, 1), (5, 1), (10, 1), (13, 2), (16, 1)],
  term ((359463415085447805712 : Rat) / 269491324728529755) [(5, 1), (10, 1), (12, 2), (13, 1), (16, 1)],
  term ((359463415085447805712 : Rat) / 269491324728529755) [(5, 1), (10, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 265 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0265_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0265
        rs_R010_ueqv_R010YNN_generator_12_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_12_0265 := by
  native_decide

/-- Coefficient term 266 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0266 : Poly :=
[
  term ((718926830170895611424 : Rat) / 269491324728529755) [(5, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 266 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0266 : Poly :=
[
  term ((1437853660341791222848 : Rat) / 269491324728529755) [(2, 1), (5, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((1437853660341791222848 : Rat) / 269491324728529755) [(3, 1), (5, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-718926830170895611424 : Rat) / 269491324728529755) [(5, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-718926830170895611424 : Rat) / 269491324728529755) [(5, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 266 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0266_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0266
        rs_R010_ueqv_R010YNN_generator_12_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_12_0266 := by
  native_decide

/-- Coefficient term 267 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0267 : Poly :=
[
  term ((1762693781939359496 : Rat) / 53898264945705951) [(5, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 267 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0267 : Poly :=
[
  term ((3525387563878718992 : Rat) / 53898264945705951) [(2, 1), (5, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((3525387563878718992 : Rat) / 53898264945705951) [(3, 1), (5, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1762693781939359496 : Rat) / 53898264945705951) [(5, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1762693781939359496 : Rat) / 53898264945705951) [(5, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 267 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0267_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0267
        rs_R010_ueqv_R010YNN_generator_12_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_12_0267 := by
  native_decide

/-- Coefficient term 268 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0268 : Poly :=
[
  term ((-3525387563878718992 : Rat) / 53898264945705951) [(5, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 268 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0268 : Poly :=
[
  term ((-7050775127757437984 : Rat) / 53898264945705951) [(2, 1), (5, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-7050775127757437984 : Rat) / 53898264945705951) [(3, 1), (5, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((3525387563878718992 : Rat) / 53898264945705951) [(5, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((3525387563878718992 : Rat) / 53898264945705951) [(5, 1), (11, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 268 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0268_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0268
        rs_R010_ueqv_R010YNN_generator_12_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_12_0268 := by
  native_decide

/-- Coefficient term 269 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0269 : Poly :=
[
  term ((-179731707542723902856 : Rat) / 269491324728529755) [(5, 1), (11, 1), (16, 1)]
]

/-- Partial product 269 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0269 : Poly :=
[
  term ((-359463415085447805712 : Rat) / 269491324728529755) [(2, 1), (5, 1), (11, 1), (12, 1), (16, 1)],
  term ((-359463415085447805712 : Rat) / 269491324728529755) [(3, 1), (5, 1), (11, 1), (13, 1), (16, 1)],
  term ((179731707542723902856 : Rat) / 269491324728529755) [(5, 1), (11, 1), (12, 2), (16, 1)],
  term ((179731707542723902856 : Rat) / 269491324728529755) [(5, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 269 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0269_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0269
        rs_R010_ueqv_R010YNN_generator_12_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_12_0269 := by
  native_decide

/-- Coefficient term 270 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0270 : Poly :=
[
  term ((23288167546323400736 : Rat) / 1347456623642648775) [(5, 1), (11, 2), (13, 1), (16, 1)]
]

/-- Partial product 270 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0270 : Poly :=
[
  term ((46576335092646801472 : Rat) / 1347456623642648775) [(2, 1), (5, 1), (11, 2), (12, 1), (13, 1), (16, 1)],
  term ((46576335092646801472 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (11, 2), (13, 2), (16, 1)],
  term ((-23288167546323400736 : Rat) / 1347456623642648775) [(5, 1), (11, 2), (12, 2), (13, 1), (16, 1)],
  term ((-23288167546323400736 : Rat) / 1347456623642648775) [(5, 1), (11, 2), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 270 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0270_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0270
        rs_R010_ueqv_R010YNN_generator_12_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_12_0270 := by
  native_decide

/-- Coefficient term 271 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0271 : Poly :=
[
  term ((-46576335092646801472 : Rat) / 1347456623642648775) [(5, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 271 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0271 : Poly :=
[
  term ((-93152670185293602944 : Rat) / 1347456623642648775) [(2, 1), (5, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-93152670185293602944 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((46576335092646801472 : Rat) / 1347456623642648775) [(5, 1), (11, 2), (12, 2), (15, 1), (16, 1)],
  term ((46576335092646801472 : Rat) / 1347456623642648775) [(5, 1), (11, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 271 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0271_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0271
        rs_R010_ueqv_R010YNN_generator_12_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_12_0271 := by
  native_decide

/-- Coefficient term 272 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0272 : Poly :=
[
  term ((718926830170895611424 : Rat) / 269491324728529755) [(5, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 272 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0272 : Poly :=
[
  term ((1437853660341791222848 : Rat) / 269491324728529755) [(2, 1), (5, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((1437853660341791222848 : Rat) / 269491324728529755) [(3, 1), (5, 1), (13, 2), (15, 2), (16, 1)],
  term ((-718926830170895611424 : Rat) / 269491324728529755) [(5, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-718926830170895611424 : Rat) / 269491324728529755) [(5, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 272 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0272_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0272
        rs_R010_ueqv_R010YNN_generator_12_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_12_0272 := by
  native_decide

/-- Coefficient term 273 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0273 : Poly :=
[
  term (8 : Rat) [(5, 1), (13, 1), (16, 1)]
]

/-- Partial product 273 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0273 : Poly :=
[
  term (16 : Rat) [(2, 1), (5, 1), (12, 1), (13, 1), (16, 1)],
  term (16 : Rat) [(3, 1), (5, 1), (13, 2), (16, 1)],
  term (-8 : Rat) [(5, 1), (12, 2), (13, 1), (16, 1)],
  term (-8 : Rat) [(5, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 273 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0273_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0273
        rs_R010_ueqv_R010YNN_generator_12_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_12_0273 := by
  native_decide

/-- Coefficient term 274 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0274 : Poly :=
[
  term (-16 : Rat) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 274 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0274 : Poly :=
[
  term (-32 : Rat) [(2, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term (-32 : Rat) [(3, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term (16 : Rat) [(5, 1), (12, 2), (15, 1), (16, 1)],
  term (16 : Rat) [(5, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 274 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0274_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0274
        rs_R010_ueqv_R010YNN_generator_12_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_12_0274 := by
  native_decide

/-- Coefficient term 275 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0275 : Poly :=
[
  term ((-1437853660341791222848 : Rat) / 269491324728529755) [(5, 1), (15, 3), (16, 1)]
]

/-- Partial product 275 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0275 : Poly :=
[
  term ((-2875707320683582445696 : Rat) / 269491324728529755) [(2, 1), (5, 1), (12, 1), (15, 3), (16, 1)],
  term ((-2875707320683582445696 : Rat) / 269491324728529755) [(3, 1), (5, 1), (13, 1), (15, 3), (16, 1)],
  term ((1437853660341791222848 : Rat) / 269491324728529755) [(5, 1), (12, 2), (15, 3), (16, 1)],
  term ((1437853660341791222848 : Rat) / 269491324728529755) [(5, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 275 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0275_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0275
        rs_R010_ueqv_R010YNN_generator_12_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_12_0275 := by
  native_decide

/-- Coefficient term 276 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0276 : Poly :=
[
  term ((297153869582026240 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 276 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0276 : Poly :=
[
  term ((594307739164052480 : Rat) / 17966088315235317) [(2, 1), (5, 2), (6, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((594307739164052480 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 1), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-297153869582026240 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-297153869582026240 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 276 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0276_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0276
        rs_R010_ueqv_R010YNN_generator_12_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_12_0276 := by
  native_decide

/-- Coefficient term 277 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0277 : Poly :=
[
  term ((-594307739164052480 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 277 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0277 : Poly :=
[
  term ((-1188615478328104960 : Rat) / 17966088315235317) [(2, 1), (5, 2), (6, 1), (9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-1188615478328104960 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((594307739164052480 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((594307739164052480 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 1), (11, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 277 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0277_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0277
        rs_R010_ueqv_R010YNN_generator_12_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_12_0277 := by
  native_decide

/-- Coefficient term 278 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0278 : Poly :=
[
  term ((139253367632691200 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 1), (11, 2), (13, 1), (16, 1)]
]

/-- Partial product 278 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0278 : Poly :=
[
  term ((278506735265382400 : Rat) / 53898264945705951) [(2, 1), (5, 2), (6, 1), (9, 1), (11, 2), (12, 1), (13, 1), (16, 1)],
  term ((278506735265382400 : Rat) / 53898264945705951) [(3, 1), (5, 2), (6, 1), (9, 1), (11, 2), (13, 2), (16, 1)],
  term ((-139253367632691200 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 1), (11, 2), (12, 2), (13, 1), (16, 1)],
  term ((-139253367632691200 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 1), (11, 2), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 278 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0278_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0278
        rs_R010_ueqv_R010YNN_generator_12_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_12_0278 := by
  native_decide

/-- Coefficient term 279 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0279 : Poly :=
[
  term ((-278506735265382400 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 279 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0279 : Poly :=
[
  term ((-557013470530764800 : Rat) / 53898264945705951) [(2, 1), (5, 2), (6, 1), (9, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-557013470530764800 : Rat) / 53898264945705951) [(3, 1), (5, 2), (6, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((278506735265382400 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 1), (11, 2), (12, 2), (15, 1), (16, 1)],
  term ((278506735265382400 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 1), (11, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 279 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0279_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0279
        rs_R010_ueqv_R010YNN_generator_12_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_12_0279 := by
  native_decide

/-- Coefficient term 280 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0280 : Poly :=
[
  term ((-790011652830280096 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 280 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0280 : Poly :=
[
  term ((-1580023305660560192 : Rat) / 53898264945705951) [(2, 1), (5, 2), (6, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-1580023305660560192 : Rat) / 53898264945705951) [(3, 1), (5, 2), (6, 1), (9, 1), (13, 2), (16, 1)],
  term ((790011652830280096 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 1), (12, 2), (13, 1), (16, 1)],
  term ((790011652830280096 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 280 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0280_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0280
        rs_R010_ueqv_R010YNN_generator_12_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_12_0280 := by
  native_decide

/-- Coefficient term 281 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0281 : Poly :=
[
  term ((1580023305660560192 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 281 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0281 : Poly :=
[
  term ((3160046611321120384 : Rat) / 53898264945705951) [(2, 1), (5, 2), (6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((3160046611321120384 : Rat) / 53898264945705951) [(3, 1), (5, 2), (6, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1580023305660560192 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1580023305660560192 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 281 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0281_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0281
        rs_R010_ueqv_R010YNN_generator_12_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_12_0281 := by
  native_decide

/-- Coefficient term 282 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0282 : Poly :=
[
  term ((-382946760989900800 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 2), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 282 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0282 : Poly :=
[
  term ((-765893521979801600 : Rat) / 17966088315235317) [(2, 1), (5, 2), (6, 1), (9, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-765893521979801600 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 1), (9, 2), (11, 1), (13, 2), (16, 1)],
  term ((382946760989900800 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 2), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((382946760989900800 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 2), (11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 282 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0282_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0282
        rs_R010_ueqv_R010YNN_generator_12_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_12_0282 := by
  native_decide

/-- Coefficient term 283 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0283 : Poly :=
[
  term ((765893521979801600 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 283 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0283 : Poly :=
[
  term ((1531787043959603200 : Rat) / 17966088315235317) [(2, 1), (5, 2), (6, 1), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((1531787043959603200 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-765893521979801600 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-765893521979801600 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 2), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 283 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0283_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0283
        rs_R010_ueqv_R010YNN_generator_12_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_12_0283 := by
  native_decide

/-- Coefficient term 284 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0284 : Poly :=
[
  term ((-185785469175424000 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 284 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0284 : Poly :=
[
  term ((-371570938350848000 : Rat) / 17966088315235317) [(2, 1), (5, 2), (6, 1), (9, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-371570938350848000 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 1), (9, 2), (13, 2), (15, 1), (16, 1)],
  term ((185785469175424000 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((185785469175424000 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 2), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 284 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0284_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0284
        rs_R010_ueqv_R010YNN_generator_12_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_12_0284 := by
  native_decide

/-- Coefficient term 285 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0285 : Poly :=
[
  term ((371570938350848000 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 2), (15, 2), (16, 1)]
]

/-- Partial product 285 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0285 : Poly :=
[
  term ((743141876701696000 : Rat) / 17966088315235317) [(2, 1), (5, 2), (6, 1), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((743141876701696000 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 1), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((-371570938350848000 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 2), (12, 2), (15, 2), (16, 1)],
  term ((-371570938350848000 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 285 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0285_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0285
        rs_R010_ueqv_R010YNN_generator_12_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_12_0285 := by
  native_decide

/-- Coefficient term 286 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0286 : Poly :=
[
  term ((1114026941061529600 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 3), (13, 1), (16, 1)]
]

/-- Partial product 286 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0286 : Poly :=
[
  term ((2228053882123059200 : Rat) / 53898264945705951) [(2, 1), (5, 2), (6, 1), (9, 3), (12, 1), (13, 1), (16, 1)],
  term ((2228053882123059200 : Rat) / 53898264945705951) [(3, 1), (5, 2), (6, 1), (9, 3), (13, 2), (16, 1)],
  term ((-1114026941061529600 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 3), (12, 2), (13, 1), (16, 1)],
  term ((-1114026941061529600 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 3), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 286 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0286_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0286
        rs_R010_ueqv_R010YNN_generator_12_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_12_0286 := by
  native_decide

/-- Coefficient term 287 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0287 : Poly :=
[
  term ((-2228053882123059200 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 3), (15, 1), (16, 1)]
]

/-- Partial product 287 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0287 : Poly :=
[
  term ((-4456107764246118400 : Rat) / 53898264945705951) [(2, 1), (5, 2), (6, 1), (9, 3), (12, 1), (15, 1), (16, 1)],
  term ((-4456107764246118400 : Rat) / 53898264945705951) [(3, 1), (5, 2), (6, 1), (9, 3), (13, 1), (15, 1), (16, 1)],
  term ((2228053882123059200 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 3), (12, 2), (15, 1), (16, 1)],
  term ((2228053882123059200 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 3), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 287 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0287_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0287
        rs_R010_ueqv_R010YNN_generator_12_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_12_0287 := by
  native_decide

/-- Coefficient term 288 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0288 : Poly :=
[
  term ((1090714409773617968 : Rat) / 17966088315235317) [(5, 2), (6, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 288 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0288 : Poly :=
[
  term ((2181428819547235936 : Rat) / 17966088315235317) [(2, 1), (5, 2), (6, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((2181428819547235936 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 1), (11, 1), (13, 2), (16, 1)],
  term ((-1090714409773617968 : Rat) / 17966088315235317) [(5, 2), (6, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-1090714409773617968 : Rat) / 17966088315235317) [(5, 2), (6, 1), (11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 288 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0288_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0288
        rs_R010_ueqv_R010YNN_generator_12_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_12_0288 := by
  native_decide

/-- Coefficient term 289 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0289 : Poly :=
[
  term ((-2181428819547235936 : Rat) / 17966088315235317) [(5, 2), (6, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 289 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0289 : Poly :=
[
  term ((-4362857639094471872 : Rat) / 17966088315235317) [(2, 1), (5, 2), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-4362857639094471872 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((2181428819547235936 : Rat) / 17966088315235317) [(5, 2), (6, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((2181428819547235936 : Rat) / 17966088315235317) [(5, 2), (6, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 289 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0289_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0289
        rs_R010_ueqv_R010YNN_generator_12_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_12_0289 := by
  native_decide

/-- Coefficient term 290 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0290 : Poly :=
[
  term ((1700977553050764416 : Rat) / 53898264945705951) [(5, 2), (7, 1), (8, 1), (13, 1), (16, 1)]
]

/-- Partial product 290 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0290 : Poly :=
[
  term ((3401955106101528832 : Rat) / 53898264945705951) [(2, 1), (5, 2), (7, 1), (8, 1), (12, 1), (13, 1), (16, 1)],
  term ((3401955106101528832 : Rat) / 53898264945705951) [(3, 1), (5, 2), (7, 1), (8, 1), (13, 2), (16, 1)],
  term ((-1700977553050764416 : Rat) / 53898264945705951) [(5, 2), (7, 1), (8, 1), (12, 2), (13, 1), (16, 1)],
  term ((-1700977553050764416 : Rat) / 53898264945705951) [(5, 2), (7, 1), (8, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 290 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0290_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0290
        rs_R010_ueqv_R010YNN_generator_12_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_12_0290 := by
  native_decide

/-- Coefficient term 291 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0291 : Poly :=
[
  term ((-3401955106101528832 : Rat) / 53898264945705951) [(5, 2), (7, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 291 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0291 : Poly :=
[
  term ((-6803910212203057664 : Rat) / 53898264945705951) [(2, 1), (5, 2), (7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-6803910212203057664 : Rat) / 53898264945705951) [(3, 1), (5, 2), (7, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((3401955106101528832 : Rat) / 53898264945705951) [(5, 2), (7, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((3401955106101528832 : Rat) / 53898264945705951) [(5, 2), (7, 1), (8, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 291 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0291_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0291
        rs_R010_ueqv_R010YNN_generator_12_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_12_0291 := by
  native_decide

/-- Coefficient term 292 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0292 : Poly :=
[
  term ((-377625914378053734832 : Rat) / 449152207880882925) [(5, 2), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 292 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0292 : Poly :=
[
  term ((-755251828756107469664 : Rat) / 449152207880882925) [(2, 1), (5, 2), (7, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-755251828756107469664 : Rat) / 449152207880882925) [(3, 1), (5, 2), (7, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((377625914378053734832 : Rat) / 449152207880882925) [(5, 2), (7, 1), (9, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((377625914378053734832 : Rat) / 449152207880882925) [(5, 2), (7, 1), (9, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 292 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0292_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0292
        rs_R010_ueqv_R010YNN_generator_12_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_12_0292 := by
  native_decide

/-- Coefficient term 293 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0293 : Poly :=
[
  term ((755251828756107469664 : Rat) / 449152207880882925) [(5, 2), (7, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 293 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0293 : Poly :=
[
  term ((1510503657512214939328 : Rat) / 449152207880882925) [(2, 1), (5, 2), (7, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((1510503657512214939328 : Rat) / 449152207880882925) [(3, 1), (5, 2), (7, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-755251828756107469664 : Rat) / 449152207880882925) [(5, 2), (7, 1), (9, 1), (12, 2), (15, 2), (16, 1)],
  term ((-755251828756107469664 : Rat) / 449152207880882925) [(5, 2), (7, 1), (9, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 293 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0293_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0293
        rs_R010_ueqv_R010YNN_generator_12_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_12_0293 := by
  native_decide

/-- Coefficient term 294 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0294 : Poly :=
[
  term ((10403022895177344256 : Rat) / 29943480525392195) [(5, 2), (7, 1), (9, 2), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 294 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0294 : Poly :=
[
  term ((20806045790354688512 : Rat) / 29943480525392195) [(2, 1), (5, 2), (7, 1), (9, 2), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((20806045790354688512 : Rat) / 29943480525392195) [(3, 1), (5, 2), (7, 1), (9, 2), (10, 1), (13, 2), (16, 1)],
  term ((-10403022895177344256 : Rat) / 29943480525392195) [(5, 2), (7, 1), (9, 2), (10, 1), (12, 2), (13, 1), (16, 1)],
  term ((-10403022895177344256 : Rat) / 29943480525392195) [(5, 2), (7, 1), (9, 2), (10, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 294 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0294_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0294
        rs_R010_ueqv_R010YNN_generator_12_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_12_0294 := by
  native_decide

/-- Coefficient term 295 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0295 : Poly :=
[
  term ((-20806045790354688512 : Rat) / 29943480525392195) [(5, 2), (7, 1), (9, 2), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 295 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0295 : Poly :=
[
  term ((-41612091580709377024 : Rat) / 29943480525392195) [(2, 1), (5, 2), (7, 1), (9, 2), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-41612091580709377024 : Rat) / 29943480525392195) [(3, 1), (5, 2), (7, 1), (9, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((20806045790354688512 : Rat) / 29943480525392195) [(5, 2), (7, 1), (9, 2), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((20806045790354688512 : Rat) / 29943480525392195) [(5, 2), (7, 1), (9, 2), (10, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 295 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0295_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0295
        rs_R010_ueqv_R010YNN_generator_12_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_12_0295 := by
  native_decide

/-- Coefficient term 296 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0296 : Poly :=
[
  term ((-65618476060569600 : Rat) / 5988696105078439) [(5, 2), (7, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 296 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0296 : Poly :=
[
  term ((-131236952121139200 : Rat) / 5988696105078439) [(2, 1), (5, 2), (7, 1), (9, 2), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-131236952121139200 : Rat) / 5988696105078439) [(3, 1), (5, 2), (7, 1), (9, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((65618476060569600 : Rat) / 5988696105078439) [(5, 2), (7, 1), (9, 2), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((65618476060569600 : Rat) / 5988696105078439) [(5, 2), (7, 1), (9, 2), (11, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 296 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0296_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0296
        rs_R010_ueqv_R010YNN_generator_12_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_12_0296 := by
  native_decide

/-- Coefficient term 297 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0297 : Poly :=
[
  term ((131236952121139200 : Rat) / 5988696105078439) [(5, 2), (7, 1), (9, 2), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 297 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0297 : Poly :=
[
  term ((262473904242278400 : Rat) / 5988696105078439) [(2, 1), (5, 2), (7, 1), (9, 2), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((262473904242278400 : Rat) / 5988696105078439) [(3, 1), (5, 2), (7, 1), (9, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-131236952121139200 : Rat) / 5988696105078439) [(5, 2), (7, 1), (9, 2), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((-131236952121139200 : Rat) / 5988696105078439) [(5, 2), (7, 1), (9, 2), (11, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 297 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0297_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0297
        rs_R010_ueqv_R010YNN_generator_12_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_12_0297 := by
  native_decide

/-- Coefficient term 298 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0298 : Poly :=
[
  term ((5201511447588672128 : Rat) / 29943480525392195) [(5, 2), (7, 1), (9, 2), (11, 1), (16, 1)]
]

/-- Partial product 298 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0298 : Poly :=
[
  term ((10403022895177344256 : Rat) / 29943480525392195) [(2, 1), (5, 2), (7, 1), (9, 2), (11, 1), (12, 1), (16, 1)],
  term ((10403022895177344256 : Rat) / 29943480525392195) [(3, 1), (5, 2), (7, 1), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-5201511447588672128 : Rat) / 29943480525392195) [(5, 2), (7, 1), (9, 2), (11, 1), (12, 2), (16, 1)],
  term ((-5201511447588672128 : Rat) / 29943480525392195) [(5, 2), (7, 1), (9, 2), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 298 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0298_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0298
        rs_R010_ueqv_R010YNN_generator_12_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_12_0298 := by
  native_decide

/-- Coefficient term 299 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0299 : Poly :=
[
  term ((-46628087176130561536 : Rat) / 89830441576176585) [(5, 2), (7, 1), (9, 2), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 299 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0299 : Poly :=
[
  term ((-93256174352261123072 : Rat) / 89830441576176585) [(2, 1), (5, 2), (7, 1), (9, 2), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-93256174352261123072 : Rat) / 89830441576176585) [(3, 1), (5, 2), (7, 1), (9, 2), (13, 2), (15, 2), (16, 1)],
  term ((46628087176130561536 : Rat) / 89830441576176585) [(5, 2), (7, 1), (9, 2), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((46628087176130561536 : Rat) / 89830441576176585) [(5, 2), (7, 1), (9, 2), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 299 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0299_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0299
        rs_R010_ueqv_R010YNN_generator_12_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_12_0299 := by
  native_decide

/-- Partial products in this block. -/
def rs_R010_ueqv_R010YNN_partials_12_0200_0299 : List Poly :=
[
  rs_R010_ueqv_R010YNN_partial_12_0200,
  rs_R010_ueqv_R010YNN_partial_12_0201,
  rs_R010_ueqv_R010YNN_partial_12_0202,
  rs_R010_ueqv_R010YNN_partial_12_0203,
  rs_R010_ueqv_R010YNN_partial_12_0204,
  rs_R010_ueqv_R010YNN_partial_12_0205,
  rs_R010_ueqv_R010YNN_partial_12_0206,
  rs_R010_ueqv_R010YNN_partial_12_0207,
  rs_R010_ueqv_R010YNN_partial_12_0208,
  rs_R010_ueqv_R010YNN_partial_12_0209,
  rs_R010_ueqv_R010YNN_partial_12_0210,
  rs_R010_ueqv_R010YNN_partial_12_0211,
  rs_R010_ueqv_R010YNN_partial_12_0212,
  rs_R010_ueqv_R010YNN_partial_12_0213,
  rs_R010_ueqv_R010YNN_partial_12_0214,
  rs_R010_ueqv_R010YNN_partial_12_0215,
  rs_R010_ueqv_R010YNN_partial_12_0216,
  rs_R010_ueqv_R010YNN_partial_12_0217,
  rs_R010_ueqv_R010YNN_partial_12_0218,
  rs_R010_ueqv_R010YNN_partial_12_0219,
  rs_R010_ueqv_R010YNN_partial_12_0220,
  rs_R010_ueqv_R010YNN_partial_12_0221,
  rs_R010_ueqv_R010YNN_partial_12_0222,
  rs_R010_ueqv_R010YNN_partial_12_0223,
  rs_R010_ueqv_R010YNN_partial_12_0224,
  rs_R010_ueqv_R010YNN_partial_12_0225,
  rs_R010_ueqv_R010YNN_partial_12_0226,
  rs_R010_ueqv_R010YNN_partial_12_0227,
  rs_R010_ueqv_R010YNN_partial_12_0228,
  rs_R010_ueqv_R010YNN_partial_12_0229,
  rs_R010_ueqv_R010YNN_partial_12_0230,
  rs_R010_ueqv_R010YNN_partial_12_0231,
  rs_R010_ueqv_R010YNN_partial_12_0232,
  rs_R010_ueqv_R010YNN_partial_12_0233,
  rs_R010_ueqv_R010YNN_partial_12_0234,
  rs_R010_ueqv_R010YNN_partial_12_0235,
  rs_R010_ueqv_R010YNN_partial_12_0236,
  rs_R010_ueqv_R010YNN_partial_12_0237,
  rs_R010_ueqv_R010YNN_partial_12_0238,
  rs_R010_ueqv_R010YNN_partial_12_0239,
  rs_R010_ueqv_R010YNN_partial_12_0240,
  rs_R010_ueqv_R010YNN_partial_12_0241,
  rs_R010_ueqv_R010YNN_partial_12_0242,
  rs_R010_ueqv_R010YNN_partial_12_0243,
  rs_R010_ueqv_R010YNN_partial_12_0244,
  rs_R010_ueqv_R010YNN_partial_12_0245,
  rs_R010_ueqv_R010YNN_partial_12_0246,
  rs_R010_ueqv_R010YNN_partial_12_0247,
  rs_R010_ueqv_R010YNN_partial_12_0248,
  rs_R010_ueqv_R010YNN_partial_12_0249,
  rs_R010_ueqv_R010YNN_partial_12_0250,
  rs_R010_ueqv_R010YNN_partial_12_0251,
  rs_R010_ueqv_R010YNN_partial_12_0252,
  rs_R010_ueqv_R010YNN_partial_12_0253,
  rs_R010_ueqv_R010YNN_partial_12_0254,
  rs_R010_ueqv_R010YNN_partial_12_0255,
  rs_R010_ueqv_R010YNN_partial_12_0256,
  rs_R010_ueqv_R010YNN_partial_12_0257,
  rs_R010_ueqv_R010YNN_partial_12_0258,
  rs_R010_ueqv_R010YNN_partial_12_0259,
  rs_R010_ueqv_R010YNN_partial_12_0260,
  rs_R010_ueqv_R010YNN_partial_12_0261,
  rs_R010_ueqv_R010YNN_partial_12_0262,
  rs_R010_ueqv_R010YNN_partial_12_0263,
  rs_R010_ueqv_R010YNN_partial_12_0264,
  rs_R010_ueqv_R010YNN_partial_12_0265,
  rs_R010_ueqv_R010YNN_partial_12_0266,
  rs_R010_ueqv_R010YNN_partial_12_0267,
  rs_R010_ueqv_R010YNN_partial_12_0268,
  rs_R010_ueqv_R010YNN_partial_12_0269,
  rs_R010_ueqv_R010YNN_partial_12_0270,
  rs_R010_ueqv_R010YNN_partial_12_0271,
  rs_R010_ueqv_R010YNN_partial_12_0272,
  rs_R010_ueqv_R010YNN_partial_12_0273,
  rs_R010_ueqv_R010YNN_partial_12_0274,
  rs_R010_ueqv_R010YNN_partial_12_0275,
  rs_R010_ueqv_R010YNN_partial_12_0276,
  rs_R010_ueqv_R010YNN_partial_12_0277,
  rs_R010_ueqv_R010YNN_partial_12_0278,
  rs_R010_ueqv_R010YNN_partial_12_0279,
  rs_R010_ueqv_R010YNN_partial_12_0280,
  rs_R010_ueqv_R010YNN_partial_12_0281,
  rs_R010_ueqv_R010YNN_partial_12_0282,
  rs_R010_ueqv_R010YNN_partial_12_0283,
  rs_R010_ueqv_R010YNN_partial_12_0284,
  rs_R010_ueqv_R010YNN_partial_12_0285,
  rs_R010_ueqv_R010YNN_partial_12_0286,
  rs_R010_ueqv_R010YNN_partial_12_0287,
  rs_R010_ueqv_R010YNN_partial_12_0288,
  rs_R010_ueqv_R010YNN_partial_12_0289,
  rs_R010_ueqv_R010YNN_partial_12_0290,
  rs_R010_ueqv_R010YNN_partial_12_0291,
  rs_R010_ueqv_R010YNN_partial_12_0292,
  rs_R010_ueqv_R010YNN_partial_12_0293,
  rs_R010_ueqv_R010YNN_partial_12_0294,
  rs_R010_ueqv_R010YNN_partial_12_0295,
  rs_R010_ueqv_R010YNN_partial_12_0296,
  rs_R010_ueqv_R010YNN_partial_12_0297,
  rs_R010_ueqv_R010YNN_partial_12_0298,
  rs_R010_ueqv_R010YNN_partial_12_0299
]

/-- Sum of partial products in this block. -/
def rs_R010_ueqv_R010YNN_block_12_0200_0299 : Poly :=
[
  term ((6947622085770741760 : Rat) / 17966088315235317) [(2, 1), (5, 1), (8, 1), (9, 1), (12, 1), (15, 4), (16, 1)],
  term ((3448719666249625600 : Rat) / 5988696105078439) [(2, 1), (5, 1), (8, 1), (9, 2), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-6897439332499251200 : Rat) / 5988696105078439) [(2, 1), (5, 1), (8, 1), (9, 2), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-426539992519925760 : Rat) / 5988696105078439) [(2, 1), (5, 1), (8, 1), (9, 2), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((853079985039851520 : Rat) / 5988696105078439) [(2, 1), (5, 1), (8, 1), (9, 2), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((1724359833124812800 : Rat) / 5988696105078439) [(2, 1), (5, 1), (8, 1), (9, 2), (11, 1), (12, 1), (16, 1)],
  term ((-6897439332499251200 : Rat) / 5988696105078439) [(2, 1), (5, 1), (8, 1), (9, 2), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((13794878664998502400 : Rat) / 5988696105078439) [(2, 1), (5, 1), (8, 1), (9, 2), (12, 1), (15, 3), (16, 1)],
  term ((-142309018178682880 : Rat) / 53898264945705951) [(2, 1), (5, 1), (8, 1), (9, 3), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((284618036357365760 : Rat) / 53898264945705951) [(2, 1), (5, 1), (8, 1), (9, 3), (12, 1), (15, 2), (16, 1)],
  term ((983802542922558273008 : Rat) / 149717402626960975) [(2, 1), (5, 1), (8, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-1967605085845116546016 : Rat) / 149717402626960975) [(2, 1), (5, 1), (8, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1913865611540614527664 : Rat) / 1347456623642648775) [(2, 1), (5, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((3827731223081229055328 : Rat) / 1347456623642648775) [(2, 1), (5, 1), (8, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((491901271461279136504 : Rat) / 149717402626960975) [(2, 1), (5, 1), (8, 1), (11, 1), (12, 1), (16, 1)],
  term ((-1967605085845116546016 : Rat) / 149717402626960975) [(2, 1), (5, 1), (8, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((3935210171690233092032 : Rat) / 149717402626960975) [(2, 1), (5, 1), (8, 1), (12, 1), (15, 3), (16, 1)],
  term ((-11741160207174809600 : Rat) / 53898264945705951) [(2, 1), (5, 1), (9, 1), (10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((23482320414349619200 : Rat) / 53898264945705951) [(2, 1), (5, 1), (9, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((212459555018097967120 : Rat) / 161694794837117853) [(2, 1), (5, 1), (9, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-424919110036195934240 : Rat) / 161694794837117853) [(2, 1), (5, 1), (9, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((22154310717297973760 : Rat) / 53898264945705951) [(2, 1), (5, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-602945609000194368688 : Rat) / 1347456623642648775) [(2, 1), (5, 1), (9, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((128943869298883879264 : Rat) / 149717402626960975) [(2, 1), (5, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-44308621434595947520 : Rat) / 53898264945705951) [(2, 1), (5, 1), (9, 1), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((-1477650497377277440 : Rat) / 53898264945705951) [(2, 1), (5, 1), (9, 1), (11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((2955300994754554880 : Rat) / 53898264945705951) [(2, 1), (5, 1), (9, 1), (11, 2), (12, 1), (15, 2), (16, 1)],
  term ((-5578052804811827200 : Rat) / 53898264945705951) [(2, 1), (5, 1), (9, 1), (11, 2), (12, 1), (16, 1)],
  term ((-483295493905817600 : Rat) / 53898264945705951) [(2, 1), (5, 1), (9, 1), (11, 3), (12, 1), (13, 1), (16, 1)],
  term ((966590987811635200 : Rat) / 53898264945705951) [(2, 1), (5, 1), (9, 1), (11, 3), (12, 1), (15, 1), (16, 1)],
  term ((-595766278680819755632 : Rat) / 1347456623642648775) [(2, 1), (5, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((7263423089669411840 : Rat) / 53898264945705951) [(2, 1), (5, 1), (9, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((1191532557361639511264 : Rat) / 1347456623642648775) [(2, 1), (5, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-14526846179338823680 : Rat) / 53898264945705951) [(2, 1), (5, 1), (9, 1), (12, 1), (15, 4), (16, 1)],
  term ((-1883716768673689600 : Rat) / 53898264945705951) [(2, 1), (5, 1), (9, 2), (10, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((3767433537347379200 : Rat) / 53898264945705951) [(2, 1), (5, 1), (9, 2), (10, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-2526408031189360640 : Rat) / 53898264945705951) [(2, 1), (5, 1), (9, 2), (10, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-814342187162453139776 : Rat) / 149717402626960975) [(2, 1), (5, 1), (9, 2), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((1628684374324906279552 : Rat) / 149717402626960975) [(2, 1), (5, 1), (9, 2), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((5052816062378721280 : Rat) / 53898264945705951) [(2, 1), (5, 1), (9, 2), (10, 1), (12, 1), (15, 3), (16, 1)],
  term ((4218386204988354560 : Rat) / 53898264945705951) [(2, 1), (5, 1), (9, 2), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-8436772409976709120 : Rat) / 53898264945705951) [(2, 1), (5, 1), (9, 2), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-407171093581226569888 : Rat) / 149717402626960975) [(2, 1), (5, 1), (9, 2), (11, 1), (12, 1), (16, 1)],
  term ((3485147990512599040 : Rat) / 53898264945705951) [(2, 1), (5, 1), (9, 2), (11, 2), (12, 1), (13, 1), (16, 1)],
  term ((-6970295981025198080 : Rat) / 53898264945705951) [(2, 1), (5, 1), (9, 2), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((14721319569703890531968 : Rat) / 1347456623642648775) [(2, 1), (5, 1), (9, 2), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-29442639139407781063936 : Rat) / 1347456623642648775) [(2, 1), (5, 1), (9, 2), (12, 1), (15, 3), (16, 1)],
  term ((254207685414502400 : Rat) / 17966088315235317) [(2, 1), (5, 1), (9, 3), (10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-508415370829004800 : Rat) / 17966088315235317) [(2, 1), (5, 1), (9, 3), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((8881762891094589440 : Rat) / 53898264945705951) [(2, 1), (5, 1), (9, 3), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-17763525782189178880 : Rat) / 53898264945705951) [(2, 1), (5, 1), (9, 3), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-508415370829004800 : Rat) / 17966088315235317) [(2, 1), (5, 1), (9, 3), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-4828796144538419200 : Rat) / 53898264945705951) [(2, 1), (5, 1), (9, 3), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((9657592289076838400 : Rat) / 53898264945705951) [(2, 1), (5, 1), (9, 3), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((1016830741658009600 : Rat) / 17966088315235317) [(2, 1), (5, 1), (9, 3), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((127103842707251200 : Rat) / 17966088315235317) [(2, 1), (5, 1), (9, 3), (11, 2), (12, 1), (16, 1)],
  term ((-5730985049653821440 : Rat) / 53898264945705951) [(2, 1), (5, 1), (9, 3), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((11461970099307642880 : Rat) / 53898264945705951) [(2, 1), (5, 1), (9, 3), (12, 1), (15, 2), (16, 1)],
  term ((-2871455259507752960 : Rat) / 17966088315235317) [(2, 1), (5, 1), (9, 4), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((5742910519015505920 : Rat) / 17966088315235317) [(2, 1), (5, 1), (9, 4), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1435727629753876480 : Rat) / 17966088315235317) [(2, 1), (5, 1), (9, 4), (11, 1), (12, 1), (16, 1)],
  term ((5742910519015505920 : Rat) / 17966088315235317) [(2, 1), (5, 1), (9, 4), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-11485821038031011840 : Rat) / 17966088315235317) [(2, 1), (5, 1), (9, 4), (12, 1), (15, 3), (16, 1)],
  term ((2586005023494621440 : Rat) / 17966088315235317) [(2, 1), (5, 1), (10, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5172010046989242880 : Rat) / 17966088315235317) [(2, 1), (5, 1), (10, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-718926830170895611424 : Rat) / 269491324728529755) [(2, 1), (5, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((1437853660341791222848 : Rat) / 269491324728529755) [(2, 1), (5, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((3525387563878718992 : Rat) / 53898264945705951) [(2, 1), (5, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-7050775127757437984 : Rat) / 53898264945705951) [(2, 1), (5, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-359463415085447805712 : Rat) / 269491324728529755) [(2, 1), (5, 1), (11, 1), (12, 1), (16, 1)],
  term ((46576335092646801472 : Rat) / 1347456623642648775) [(2, 1), (5, 1), (11, 2), (12, 1), (13, 1), (16, 1)],
  term ((-93152670185293602944 : Rat) / 1347456623642648775) [(2, 1), (5, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((1437853660341791222848 : Rat) / 269491324728529755) [(2, 1), (5, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term (16 : Rat) [(2, 1), (5, 1), (12, 1), (13, 1), (16, 1)],
  term (-32 : Rat) [(2, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2875707320683582445696 : Rat) / 269491324728529755) [(2, 1), (5, 1), (12, 1), (15, 3), (16, 1)],
  term ((594307739164052480 : Rat) / 17966088315235317) [(2, 1), (5, 2), (6, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1188615478328104960 : Rat) / 17966088315235317) [(2, 1), (5, 2), (6, 1), (9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((278506735265382400 : Rat) / 53898264945705951) [(2, 1), (5, 2), (6, 1), (9, 1), (11, 2), (12, 1), (13, 1), (16, 1)],
  term ((-557013470530764800 : Rat) / 53898264945705951) [(2, 1), (5, 2), (6, 1), (9, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-1580023305660560192 : Rat) / 53898264945705951) [(2, 1), (5, 2), (6, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((3160046611321120384 : Rat) / 53898264945705951) [(2, 1), (5, 2), (6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-765893521979801600 : Rat) / 17966088315235317) [(2, 1), (5, 2), (6, 1), (9, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((1531787043959603200 : Rat) / 17966088315235317) [(2, 1), (5, 2), (6, 1), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-371570938350848000 : Rat) / 17966088315235317) [(2, 1), (5, 2), (6, 1), (9, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((743141876701696000 : Rat) / 17966088315235317) [(2, 1), (5, 2), (6, 1), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((2228053882123059200 : Rat) / 53898264945705951) [(2, 1), (5, 2), (6, 1), (9, 3), (12, 1), (13, 1), (16, 1)],
  term ((-4456107764246118400 : Rat) / 53898264945705951) [(2, 1), (5, 2), (6, 1), (9, 3), (12, 1), (15, 1), (16, 1)],
  term ((2181428819547235936 : Rat) / 17966088315235317) [(2, 1), (5, 2), (6, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-4362857639094471872 : Rat) / 17966088315235317) [(2, 1), (5, 2), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((3401955106101528832 : Rat) / 53898264945705951) [(2, 1), (5, 2), (7, 1), (8, 1), (12, 1), (13, 1), (16, 1)],
  term ((-6803910212203057664 : Rat) / 53898264945705951) [(2, 1), (5, 2), (7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-755251828756107469664 : Rat) / 449152207880882925) [(2, 1), (5, 2), (7, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1510503657512214939328 : Rat) / 449152207880882925) [(2, 1), (5, 2), (7, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((20806045790354688512 : Rat) / 29943480525392195) [(2, 1), (5, 2), (7, 1), (9, 2), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-41612091580709377024 : Rat) / 29943480525392195) [(2, 1), (5, 2), (7, 1), (9, 2), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-131236952121139200 : Rat) / 5988696105078439) [(2, 1), (5, 2), (7, 1), (9, 2), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((262473904242278400 : Rat) / 5988696105078439) [(2, 1), (5, 2), (7, 1), (9, 2), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((10403022895177344256 : Rat) / 29943480525392195) [(2, 1), (5, 2), (7, 1), (9, 2), (11, 1), (12, 1), (16, 1)],
  term ((-93256174352261123072 : Rat) / 89830441576176585) [(2, 1), (5, 2), (7, 1), (9, 2), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((6947622085770741760 : Rat) / 17966088315235317) [(3, 1), (5, 1), (8, 1), (9, 1), (13, 1), (15, 4), (16, 1)],
  term ((-6897439332499251200 : Rat) / 5988696105078439) [(3, 1), (5, 1), (8, 1), (9, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((3448719666249625600 : Rat) / 5988696105078439) [(3, 1), (5, 1), (8, 1), (9, 2), (10, 1), (13, 2), (16, 1)],
  term ((853079985039851520 : Rat) / 5988696105078439) [(3, 1), (5, 1), (8, 1), (9, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((1724359833124812800 : Rat) / 5988696105078439) [(3, 1), (5, 1), (8, 1), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-426539992519925760 : Rat) / 5988696105078439) [(3, 1), (5, 1), (8, 1), (9, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((13794878664998502400 : Rat) / 5988696105078439) [(3, 1), (5, 1), (8, 1), (9, 2), (13, 1), (15, 3), (16, 1)],
  term ((-6897439332499251200 : Rat) / 5988696105078439) [(3, 1), (5, 1), (8, 1), (9, 2), (13, 2), (15, 2), (16, 1)],
  term ((284618036357365760 : Rat) / 53898264945705951) [(3, 1), (5, 1), (8, 1), (9, 3), (13, 1), (15, 2), (16, 1)],
  term ((-142309018178682880 : Rat) / 53898264945705951) [(3, 1), (5, 1), (8, 1), (9, 3), (13, 2), (15, 1), (16, 1)],
  term ((-1967605085845116546016 : Rat) / 149717402626960975) [(3, 1), (5, 1), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((983802542922558273008 : Rat) / 149717402626960975) [(3, 1), (5, 1), (8, 1), (10, 1), (13, 2), (16, 1)],
  term ((3827731223081229055328 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (8, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((491901271461279136504 : Rat) / 149717402626960975) [(3, 1), (5, 1), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((-1913865611540614527664 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (8, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((3935210171690233092032 : Rat) / 149717402626960975) [(3, 1), (5, 1), (8, 1), (13, 1), (15, 3), (16, 1)],
  term ((-1967605085845116546016 : Rat) / 149717402626960975) [(3, 1), (5, 1), (8, 1), (13, 2), (15, 2), (16, 1)],
  term ((23482320414349619200 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-11741160207174809600 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 1), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((-424919110036195934240 : Rat) / 161694794837117853) [(3, 1), (5, 1), (9, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((212459555018097967120 : Rat) / 161694794837117853) [(3, 1), (5, 1), (9, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((128943869298883879264 : Rat) / 149717402626960975) [(3, 1), (5, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-44308621434595947520 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((22154310717297973760 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-602945609000194368688 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((2955300994754554880 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((-5578052804811827200 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((-1477650497377277440 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 1), (11, 2), (13, 2), (15, 1), (16, 1)],
  term ((966590987811635200 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 1), (11, 3), (13, 1), (15, 1), (16, 1)],
  term ((-483295493905817600 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 1), (11, 3), (13, 2), (16, 1)],
  term ((1191532557361639511264 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-14526846179338823680 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 1), (13, 1), (15, 4), (16, 1)],
  term ((-595766278680819755632 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((7263423089669411840 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 1), (13, 2), (15, 3), (16, 1)],
  term ((3767433537347379200 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 2), (10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1883716768673689600 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 2), (10, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((1628684374324906279552 : Rat) / 149717402626960975) [(3, 1), (5, 1), (9, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((5052816062378721280 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 2), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((-2526408031189360640 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 2), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((-814342187162453139776 : Rat) / 149717402626960975) [(3, 1), (5, 1), (9, 2), (10, 1), (13, 2), (16, 1)],
  term ((-8436772409976709120 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-407171093581226569888 : Rat) / 149717402626960975) [(3, 1), (5, 1), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((4218386204988354560 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-6970295981025198080 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((3485147990512599040 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 2), (11, 2), (13, 2), (16, 1)],
  term ((-29442639139407781063936 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (9, 2), (13, 1), (15, 3), (16, 1)],
  term ((14721319569703890531968 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (9, 2), (13, 2), (15, 2), (16, 1)],
  term ((-508415370829004800 : Rat) / 17966088315235317) [(3, 1), (5, 1), (9, 3), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((254207685414502400 : Rat) / 17966088315235317) [(3, 1), (5, 1), (9, 3), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((-17763525782189178880 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 3), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((8881762891094589440 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 3), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((9657592289076838400 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 3), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((1016830741658009600 : Rat) / 17966088315235317) [(3, 1), (5, 1), (9, 3), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-508415370829004800 : Rat) / 17966088315235317) [(3, 1), (5, 1), (9, 3), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-4828796144538419200 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 3), (11, 1), (13, 2), (16, 1)],
  term ((127103842707251200 : Rat) / 17966088315235317) [(3, 1), (5, 1), (9, 3), (11, 2), (13, 1), (16, 1)],
  term ((11461970099307642880 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 3), (13, 1), (15, 2), (16, 1)],
  term ((-5730985049653821440 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 3), (13, 2), (15, 1), (16, 1)],
  term ((5742910519015505920 : Rat) / 17966088315235317) [(3, 1), (5, 1), (9, 4), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2871455259507752960 : Rat) / 17966088315235317) [(3, 1), (5, 1), (9, 4), (10, 1), (13, 2), (16, 1)],
  term ((-1435727629753876480 : Rat) / 17966088315235317) [(3, 1), (5, 1), (9, 4), (11, 1), (13, 1), (16, 1)],
  term ((-11485821038031011840 : Rat) / 17966088315235317) [(3, 1), (5, 1), (9, 4), (13, 1), (15, 3), (16, 1)],
  term ((5742910519015505920 : Rat) / 17966088315235317) [(3, 1), (5, 1), (9, 4), (13, 2), (15, 2), (16, 1)],
  term ((-5172010046989242880 : Rat) / 17966088315235317) [(3, 1), (5, 1), (10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((2586005023494621440 : Rat) / 17966088315235317) [(3, 1), (5, 1), (10, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((1437853660341791222848 : Rat) / 269491324728529755) [(3, 1), (5, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-718926830170895611424 : Rat) / 269491324728529755) [(3, 1), (5, 1), (10, 1), (13, 2), (16, 1)],
  term ((-7050775127757437984 : Rat) / 53898264945705951) [(3, 1), (5, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-359463415085447805712 : Rat) / 269491324728529755) [(3, 1), (5, 1), (11, 1), (13, 1), (16, 1)],
  term ((3525387563878718992 : Rat) / 53898264945705951) [(3, 1), (5, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-93152670185293602944 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((46576335092646801472 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (11, 2), (13, 2), (16, 1)],
  term (-32 : Rat) [(3, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2875707320683582445696 : Rat) / 269491324728529755) [(3, 1), (5, 1), (13, 1), (15, 3), (16, 1)],
  term ((1437853660341791222848 : Rat) / 269491324728529755) [(3, 1), (5, 1), (13, 2), (15, 2), (16, 1)],
  term (16 : Rat) [(3, 1), (5, 1), (13, 2), (16, 1)],
  term ((-1188615478328104960 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((594307739164052480 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 1), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-557013470530764800 : Rat) / 53898264945705951) [(3, 1), (5, 2), (6, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((278506735265382400 : Rat) / 53898264945705951) [(3, 1), (5, 2), (6, 1), (9, 1), (11, 2), (13, 2), (16, 1)],
  term ((3160046611321120384 : Rat) / 53898264945705951) [(3, 1), (5, 2), (6, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1580023305660560192 : Rat) / 53898264945705951) [(3, 1), (5, 2), (6, 1), (9, 1), (13, 2), (16, 1)],
  term ((1531787043959603200 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-765893521979801600 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 1), (9, 2), (11, 1), (13, 2), (16, 1)],
  term ((743141876701696000 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 1), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((-371570938350848000 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 1), (9, 2), (13, 2), (15, 1), (16, 1)],
  term ((-4456107764246118400 : Rat) / 53898264945705951) [(3, 1), (5, 2), (6, 1), (9, 3), (13, 1), (15, 1), (16, 1)],
  term ((2228053882123059200 : Rat) / 53898264945705951) [(3, 1), (5, 2), (6, 1), (9, 3), (13, 2), (16, 1)],
  term ((-4362857639094471872 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((2181428819547235936 : Rat) / 17966088315235317) [(3, 1), (5, 2), (6, 1), (11, 1), (13, 2), (16, 1)],
  term ((-6803910212203057664 : Rat) / 53898264945705951) [(3, 1), (5, 2), (7, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((3401955106101528832 : Rat) / 53898264945705951) [(3, 1), (5, 2), (7, 1), (8, 1), (13, 2), (16, 1)],
  term ((1510503657512214939328 : Rat) / 449152207880882925) [(3, 1), (5, 2), (7, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-755251828756107469664 : Rat) / 449152207880882925) [(3, 1), (5, 2), (7, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-41612091580709377024 : Rat) / 29943480525392195) [(3, 1), (5, 2), (7, 1), (9, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((20806045790354688512 : Rat) / 29943480525392195) [(3, 1), (5, 2), (7, 1), (9, 2), (10, 1), (13, 2), (16, 1)],
  term ((262473904242278400 : Rat) / 5988696105078439) [(3, 1), (5, 2), (7, 1), (9, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((10403022895177344256 : Rat) / 29943480525392195) [(3, 1), (5, 2), (7, 1), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-131236952121139200 : Rat) / 5988696105078439) [(3, 1), (5, 2), (7, 1), (9, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-93256174352261123072 : Rat) / 89830441576176585) [(3, 1), (5, 2), (7, 1), (9, 2), (13, 2), (15, 2), (16, 1)],
  term ((-3473811042885370880 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (12, 2), (15, 4), (16, 1)],
  term ((-3473811042885370880 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (13, 2), (15, 4), (16, 1)],
  term ((-1724359833124812800 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (10, 1), (12, 2), (13, 1), (16, 1)],
  term ((3448719666249625600 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((3448719666249625600 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1724359833124812800 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (10, 1), (13, 3), (16, 1)],
  term ((213269996259962880 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-426539992519925760 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((-862179916562406400 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (11, 1), (12, 2), (16, 1)],
  term ((-426539992519925760 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-862179916562406400 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (11, 1), (13, 2), (16, 1)],
  term ((213269996259962880 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((3448719666249625600 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-6897439332499251200 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (12, 2), (15, 3), (16, 1)],
  term ((-6897439332499251200 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (13, 2), (15, 3), (16, 1)],
  term ((3448719666249625600 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (13, 3), (15, 2), (16, 1)],
  term ((71154509089341440 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 3), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-142309018178682880 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 3), (12, 2), (15, 2), (16, 1)],
  term ((-142309018178682880 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 3), (13, 2), (15, 2), (16, 1)],
  term ((71154509089341440 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 3), (13, 3), (15, 1), (16, 1)],
  term ((-491901271461279136504 : Rat) / 149717402626960975) [(5, 1), (8, 1), (10, 1), (12, 2), (13, 1), (16, 1)],
  term ((983802542922558273008 : Rat) / 149717402626960975) [(5, 1), (8, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((983802542922558273008 : Rat) / 149717402626960975) [(5, 1), (8, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-491901271461279136504 : Rat) / 149717402626960975) [(5, 1), (8, 1), (10, 1), (13, 3), (16, 1)],
  term ((956932805770307263832 : Rat) / 1347456623642648775) [(5, 1), (8, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1913865611540614527664 : Rat) / 1347456623642648775) [(5, 1), (8, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((-245950635730639568252 : Rat) / 149717402626960975) [(5, 1), (8, 1), (11, 1), (12, 2), (16, 1)],
  term ((-1913865611540614527664 : Rat) / 1347456623642648775) [(5, 1), (8, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-245950635730639568252 : Rat) / 149717402626960975) [(5, 1), (8, 1), (11, 1), (13, 2), (16, 1)],
  term ((956932805770307263832 : Rat) / 1347456623642648775) [(5, 1), (8, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((983802542922558273008 : Rat) / 149717402626960975) [(5, 1), (8, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-1967605085845116546016 : Rat) / 149717402626960975) [(5, 1), (8, 1), (12, 2), (15, 3), (16, 1)],
  term ((-1967605085845116546016 : Rat) / 149717402626960975) [(5, 1), (8, 1), (13, 2), (15, 3), (16, 1)],
  term ((983802542922558273008 : Rat) / 149717402626960975) [(5, 1), (8, 1), (13, 3), (15, 2), (16, 1)],
  term ((5870580103587404800 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-11741160207174809600 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-11741160207174809600 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((5870580103587404800 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 1), (11, 1), (13, 3), (16, 1)],
  term ((-106229777509048983560 : Rat) / 161694794837117853) [(5, 1), (9, 1), (10, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((212459555018097967120 : Rat) / 161694794837117853) [(5, 1), (9, 1), (10, 1), (12, 2), (15, 2), (16, 1)],
  term ((212459555018097967120 : Rat) / 161694794837117853) [(5, 1), (9, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((-106229777509048983560 : Rat) / 161694794837117853) [(5, 1), (9, 1), (10, 1), (13, 3), (15, 1), (16, 1)],
  term ((-11077155358648986880 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((301472804500097184344 : Rat) / 1347456623642648775) [(5, 1), (9, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-64471934649441939632 : Rat) / 149717402626960975) [(5, 1), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((22154310717297973760 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 1), (12, 2), (15, 3), (16, 1)],
  term ((-64471934649441939632 : Rat) / 149717402626960975) [(5, 1), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((22154310717297973760 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 1), (13, 2), (15, 3), (16, 1)],
  term ((-11077155358648986880 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((301472804500097184344 : Rat) / 1347456623642648775) [(5, 1), (9, 1), (11, 1), (13, 3), (16, 1)],
  term ((738825248688638720 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1477650497377277440 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 2), (12, 2), (15, 2), (16, 1)],
  term ((2789026402405913600 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 2), (12, 2), (16, 1)],
  term ((-1477650497377277440 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 2), (13, 2), (15, 2), (16, 1)],
  term ((2789026402405913600 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 2), (13, 2), (16, 1)],
  term ((738825248688638720 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 2), (13, 3), (15, 1), (16, 1)],
  term ((241647746952908800 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 3), (12, 2), (13, 1), (16, 1)],
  term ((-483295493905817600 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 3), (12, 2), (15, 1), (16, 1)],
  term ((-483295493905817600 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 3), (13, 2), (15, 1), (16, 1)],
  term ((241647746952908800 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 3), (13, 3), (16, 1)],
  term ((297883139340409877816 : Rat) / 1347456623642648775) [(5, 1), (9, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-3631711544834705920 : Rat) / 53898264945705951) [(5, 1), (9, 1), (12, 2), (13, 1), (15, 3), (16, 1)],
  term ((-595766278680819755632 : Rat) / 1347456623642648775) [(5, 1), (9, 1), (12, 2), (15, 2), (16, 1)],
  term ((7263423089669411840 : Rat) / 53898264945705951) [(5, 1), (9, 1), (12, 2), (15, 4), (16, 1)],
  term ((-595766278680819755632 : Rat) / 1347456623642648775) [(5, 1), (9, 1), (13, 2), (15, 2), (16, 1)],
  term ((7263423089669411840 : Rat) / 53898264945705951) [(5, 1), (9, 1), (13, 2), (15, 4), (16, 1)],
  term ((297883139340409877816 : Rat) / 1347456623642648775) [(5, 1), (9, 1), (13, 3), (15, 1), (16, 1)],
  term ((-3631711544834705920 : Rat) / 53898264945705951) [(5, 1), (9, 1), (13, 3), (15, 3), (16, 1)],
  term ((941858384336844800 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1883716768673689600 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((-1883716768673689600 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((941858384336844800 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((1263204015594680320 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((407171093581226569888 : Rat) / 149717402626960975) [(5, 1), (9, 2), (10, 1), (12, 2), (13, 1), (16, 1)],
  term ((-814342187162453139776 : Rat) / 149717402626960975) [(5, 1), (9, 2), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-2526408031189360640 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (12, 2), (15, 3), (16, 1)],
  term ((-814342187162453139776 : Rat) / 149717402626960975) [(5, 1), (9, 2), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-2526408031189360640 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (13, 2), (15, 3), (16, 1)],
  term ((1263204015594680320 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (13, 3), (15, 2), (16, 1)],
  term ((407171093581226569888 : Rat) / 149717402626960975) [(5, 1), (9, 2), (10, 1), (13, 3), (16, 1)],
  term ((-2109193102494177280 : Rat) / 53898264945705951) [(5, 1), (9, 2), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((4218386204988354560 : Rat) / 53898264945705951) [(5, 1), (9, 2), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((203585546790613284944 : Rat) / 149717402626960975) [(5, 1), (9, 2), (11, 1), (12, 2), (16, 1)],
  term ((4218386204988354560 : Rat) / 53898264945705951) [(5, 1), (9, 2), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((203585546790613284944 : Rat) / 149717402626960975) [(5, 1), (9, 2), (11, 1), (13, 2), (16, 1)],
  term ((-2109193102494177280 : Rat) / 53898264945705951) [(5, 1), (9, 2), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((-1742573995256299520 : Rat) / 53898264945705951) [(5, 1), (9, 2), (11, 2), (12, 2), (13, 1), (16, 1)],
  term ((3485147990512599040 : Rat) / 53898264945705951) [(5, 1), (9, 2), (11, 2), (12, 2), (15, 1), (16, 1)],
  term ((3485147990512599040 : Rat) / 53898264945705951) [(5, 1), (9, 2), (11, 2), (13, 2), (15, 1), (16, 1)],
  term ((-1742573995256299520 : Rat) / 53898264945705951) [(5, 1), (9, 2), (11, 2), (13, 3), (16, 1)],
  term ((-7360659784851945265984 : Rat) / 1347456623642648775) [(5, 1), (9, 2), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((14721319569703890531968 : Rat) / 1347456623642648775) [(5, 1), (9, 2), (12, 2), (15, 3), (16, 1)],
  term ((14721319569703890531968 : Rat) / 1347456623642648775) [(5, 1), (9, 2), (13, 2), (15, 3), (16, 1)],
  term ((-7360659784851945265984 : Rat) / 1347456623642648775) [(5, 1), (9, 2), (13, 3), (15, 2), (16, 1)],
  term ((-127103842707251200 : Rat) / 17966088315235317) [(5, 1), (9, 3), (10, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((254207685414502400 : Rat) / 17966088315235317) [(5, 1), (9, 3), (10, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((254207685414502400 : Rat) / 17966088315235317) [(5, 1), (9, 3), (10, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-127103842707251200 : Rat) / 17966088315235317) [(5, 1), (9, 3), (10, 1), (11, 1), (13, 3), (16, 1)],
  term ((-4440881445547294720 : Rat) / 53898264945705951) [(5, 1), (9, 3), (10, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((8881762891094589440 : Rat) / 53898264945705951) [(5, 1), (9, 3), (10, 1), (12, 2), (15, 2), (16, 1)],
  term ((8881762891094589440 : Rat) / 53898264945705951) [(5, 1), (9, 3), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((-4440881445547294720 : Rat) / 53898264945705951) [(5, 1), (9, 3), (10, 1), (13, 3), (15, 1), (16, 1)],
  term ((254207685414502400 : Rat) / 17966088315235317) [(5, 1), (9, 3), (11, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((2414398072269209600 : Rat) / 53898264945705951) [(5, 1), (9, 3), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-4828796144538419200 : Rat) / 53898264945705951) [(5, 1), (9, 3), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-508415370829004800 : Rat) / 17966088315235317) [(5, 1), (9, 3), (11, 1), (12, 2), (15, 3), (16, 1)],
  term ((-4828796144538419200 : Rat) / 53898264945705951) [(5, 1), (9, 3), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-508415370829004800 : Rat) / 17966088315235317) [(5, 1), (9, 3), (11, 1), (13, 2), (15, 3), (16, 1)],
  term ((254207685414502400 : Rat) / 17966088315235317) [(5, 1), (9, 3), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((2414398072269209600 : Rat) / 53898264945705951) [(5, 1), (9, 3), (11, 1), (13, 3), (16, 1)],
  term ((-63551921353625600 : Rat) / 17966088315235317) [(5, 1), (9, 3), (11, 2), (12, 2), (16, 1)],
  term ((-63551921353625600 : Rat) / 17966088315235317) [(5, 1), (9, 3), (11, 2), (13, 2), (16, 1)],
  term ((2865492524826910720 : Rat) / 53898264945705951) [(5, 1), (9, 3), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-5730985049653821440 : Rat) / 53898264945705951) [(5, 1), (9, 3), (12, 2), (15, 2), (16, 1)],
  term ((-5730985049653821440 : Rat) / 53898264945705951) [(5, 1), (9, 3), (13, 2), (15, 2), (16, 1)],
  term ((2865492524826910720 : Rat) / 53898264945705951) [(5, 1), (9, 3), (13, 3), (15, 1), (16, 1)],
  term ((1435727629753876480 : Rat) / 17966088315235317) [(5, 1), (9, 4), (10, 1), (12, 2), (13, 1), (16, 1)],
  term ((-2871455259507752960 : Rat) / 17966088315235317) [(5, 1), (9, 4), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-2871455259507752960 : Rat) / 17966088315235317) [(5, 1), (9, 4), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((1435727629753876480 : Rat) / 17966088315235317) [(5, 1), (9, 4), (10, 1), (13, 3), (16, 1)],
  term ((717863814876938240 : Rat) / 17966088315235317) [(5, 1), (9, 4), (11, 1), (12, 2), (16, 1)],
  term ((717863814876938240 : Rat) / 17966088315235317) [(5, 1), (9, 4), (11, 1), (13, 2), (16, 1)],
  term ((-2871455259507752960 : Rat) / 17966088315235317) [(5, 1), (9, 4), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((5742910519015505920 : Rat) / 17966088315235317) [(5, 1), (9, 4), (12, 2), (15, 3), (16, 1)],
  term ((5742910519015505920 : Rat) / 17966088315235317) [(5, 1), (9, 4), (13, 2), (15, 3), (16, 1)],
  term ((-2871455259507752960 : Rat) / 17966088315235317) [(5, 1), (9, 4), (13, 3), (15, 2), (16, 1)],
  term ((-1293002511747310720 : Rat) / 17966088315235317) [(5, 1), (10, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((2586005023494621440 : Rat) / 17966088315235317) [(5, 1), (10, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((2586005023494621440 : Rat) / 17966088315235317) [(5, 1), (10, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-1293002511747310720 : Rat) / 17966088315235317) [(5, 1), (10, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((359463415085447805712 : Rat) / 269491324728529755) [(5, 1), (10, 1), (12, 2), (13, 1), (16, 1)],
  term ((-718926830170895611424 : Rat) / 269491324728529755) [(5, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-718926830170895611424 : Rat) / 269491324728529755) [(5, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((359463415085447805712 : Rat) / 269491324728529755) [(5, 1), (10, 1), (13, 3), (16, 1)],
  term ((-1762693781939359496 : Rat) / 53898264945705951) [(5, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((3525387563878718992 : Rat) / 53898264945705951) [(5, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((179731707542723902856 : Rat) / 269491324728529755) [(5, 1), (11, 1), (12, 2), (16, 1)],
  term ((3525387563878718992 : Rat) / 53898264945705951) [(5, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((179731707542723902856 : Rat) / 269491324728529755) [(5, 1), (11, 1), (13, 2), (16, 1)],
  term ((-1762693781939359496 : Rat) / 53898264945705951) [(5, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((-23288167546323400736 : Rat) / 1347456623642648775) [(5, 1), (11, 2), (12, 2), (13, 1), (16, 1)],
  term ((46576335092646801472 : Rat) / 1347456623642648775) [(5, 1), (11, 2), (12, 2), (15, 1), (16, 1)],
  term ((46576335092646801472 : Rat) / 1347456623642648775) [(5, 1), (11, 2), (13, 2), (15, 1), (16, 1)],
  term ((-23288167546323400736 : Rat) / 1347456623642648775) [(5, 1), (11, 2), (13, 3), (16, 1)],
  term ((-718926830170895611424 : Rat) / 269491324728529755) [(5, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term (-8 : Rat) [(5, 1), (12, 2), (13, 1), (16, 1)],
  term (16 : Rat) [(5, 1), (12, 2), (15, 1), (16, 1)],
  term ((1437853660341791222848 : Rat) / 269491324728529755) [(5, 1), (12, 2), (15, 3), (16, 1)],
  term (16 : Rat) [(5, 1), (13, 2), (15, 1), (16, 1)],
  term ((1437853660341791222848 : Rat) / 269491324728529755) [(5, 1), (13, 2), (15, 3), (16, 1)],
  term ((-718926830170895611424 : Rat) / 269491324728529755) [(5, 1), (13, 3), (15, 2), (16, 1)],
  term (-8 : Rat) [(5, 1), (13, 3), (16, 1)],
  term ((-297153869582026240 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((594307739164052480 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((594307739164052480 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-297153869582026240 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((-139253367632691200 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 1), (11, 2), (12, 2), (13, 1), (16, 1)],
  term ((278506735265382400 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 1), (11, 2), (12, 2), (15, 1), (16, 1)],
  term ((278506735265382400 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 1), (11, 2), (13, 2), (15, 1), (16, 1)],
  term ((-139253367632691200 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 1), (11, 2), (13, 3), (16, 1)],
  term ((790011652830280096 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 1), (12, 2), (13, 1), (16, 1)],
  term ((-1580023305660560192 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1580023305660560192 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((790011652830280096 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 1), (13, 3), (16, 1)],
  term ((382946760989900800 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 2), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-765893521979801600 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-765893521979801600 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((382946760989900800 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 2), (11, 1), (13, 3), (16, 1)],
  term ((185785469175424000 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-371570938350848000 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 2), (12, 2), (15, 2), (16, 1)],
  term ((-371570938350848000 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 2), (13, 2), (15, 2), (16, 1)],
  term ((185785469175424000 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 2), (13, 3), (15, 1), (16, 1)],
  term ((-1114026941061529600 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 3), (12, 2), (13, 1), (16, 1)],
  term ((2228053882123059200 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 3), (12, 2), (15, 1), (16, 1)],
  term ((2228053882123059200 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 3), (13, 2), (15, 1), (16, 1)],
  term ((-1114026941061529600 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 3), (13, 3), (16, 1)],
  term ((-1090714409773617968 : Rat) / 17966088315235317) [(5, 2), (6, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((2181428819547235936 : Rat) / 17966088315235317) [(5, 2), (6, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((2181428819547235936 : Rat) / 17966088315235317) [(5, 2), (6, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1090714409773617968 : Rat) / 17966088315235317) [(5, 2), (6, 1), (11, 1), (13, 3), (16, 1)],
  term ((-1700977553050764416 : Rat) / 53898264945705951) [(5, 2), (7, 1), (8, 1), (12, 2), (13, 1), (16, 1)],
  term ((3401955106101528832 : Rat) / 53898264945705951) [(5, 2), (7, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((3401955106101528832 : Rat) / 53898264945705951) [(5, 2), (7, 1), (8, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1700977553050764416 : Rat) / 53898264945705951) [(5, 2), (7, 1), (8, 1), (13, 3), (16, 1)],
  term ((377625914378053734832 : Rat) / 449152207880882925) [(5, 2), (7, 1), (9, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-755251828756107469664 : Rat) / 449152207880882925) [(5, 2), (7, 1), (9, 1), (12, 2), (15, 2), (16, 1)],
  term ((-755251828756107469664 : Rat) / 449152207880882925) [(5, 2), (7, 1), (9, 1), (13, 2), (15, 2), (16, 1)],
  term ((377625914378053734832 : Rat) / 449152207880882925) [(5, 2), (7, 1), (9, 1), (13, 3), (15, 1), (16, 1)],
  term ((-10403022895177344256 : Rat) / 29943480525392195) [(5, 2), (7, 1), (9, 2), (10, 1), (12, 2), (13, 1), (16, 1)],
  term ((20806045790354688512 : Rat) / 29943480525392195) [(5, 2), (7, 1), (9, 2), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((20806045790354688512 : Rat) / 29943480525392195) [(5, 2), (7, 1), (9, 2), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-10403022895177344256 : Rat) / 29943480525392195) [(5, 2), (7, 1), (9, 2), (10, 1), (13, 3), (16, 1)],
  term ((65618476060569600 : Rat) / 5988696105078439) [(5, 2), (7, 1), (9, 2), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-131236952121139200 : Rat) / 5988696105078439) [(5, 2), (7, 1), (9, 2), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((-5201511447588672128 : Rat) / 29943480525392195) [(5, 2), (7, 1), (9, 2), (11, 1), (12, 2), (16, 1)],
  term ((-131236952121139200 : Rat) / 5988696105078439) [(5, 2), (7, 1), (9, 2), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-5201511447588672128 : Rat) / 29943480525392195) [(5, 2), (7, 1), (9, 2), (11, 1), (13, 2), (16, 1)],
  term ((65618476060569600 : Rat) / 5988696105078439) [(5, 2), (7, 1), (9, 2), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((46628087176130561536 : Rat) / 89830441576176585) [(5, 2), (7, 1), (9, 2), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((46628087176130561536 : Rat) / 89830441576176585) [(5, 2), (7, 1), (9, 2), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 12, terms 200 through 299. -/
theorem rs_R010_ueqv_R010YNN_block_12_0200_0299_valid :
    checkProductSumEq rs_R010_ueqv_R010YNN_partials_12_0200_0299
      rs_R010_ueqv_R010YNN_block_12_0200_0299 = true := by
  native_decide

end R010UeqvR010YNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
