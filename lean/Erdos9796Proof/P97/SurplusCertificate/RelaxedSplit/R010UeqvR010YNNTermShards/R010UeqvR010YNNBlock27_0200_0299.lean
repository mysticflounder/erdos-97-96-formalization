/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R010:u=v:R010YNN, term block 27:200-299

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R010UeqvR010YNNTermShards

/-- Generator polynomial 27 for relaxed split surplus certificate `R010:u=v:R010YNN`. -/
def rs_R010_ueqv_R010YNN_generator_27_0200_0299 : Poly :=
[
  term (2 : Rat) [(12, 1), (14, 1)],
  term (2 : Rat) [(13, 1), (15, 1)],
  term (-1 : Rat) [(14, 2)],
  term (-1 : Rat) [(15, 2)]
]

/-- Coefficient term 200 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0200 : Poly :=
[
  term ((1897029392614988480 : Rat) / 53898264945705951) [(1, 1), (4, 1), (5, 1), (14, 1), (16, 1)]
]

/-- Partial product 200 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0200 : Poly :=
[
  term ((3794058785229976960 : Rat) / 53898264945705951) [(1, 1), (4, 1), (5, 1), (12, 1), (14, 2), (16, 1)],
  term ((3794058785229976960 : Rat) / 53898264945705951) [(1, 1), (4, 1), (5, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1897029392614988480 : Rat) / 53898264945705951) [(1, 1), (4, 1), (5, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1897029392614988480 : Rat) / 53898264945705951) [(1, 1), (4, 1), (5, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 200 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0200_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0200
        rs_R010_ueqv_R010YNN_generator_27_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_27_0200 := by
  native_decide

/-- Coefficient term 201 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0201 : Poly :=
[
  term ((-948514696307494240 : Rat) / 53898264945705951) [(1, 1), (4, 1), (5, 1), (16, 1)]
]

/-- Partial product 201 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0201 : Poly :=
[
  term ((-1897029392614988480 : Rat) / 53898264945705951) [(1, 1), (4, 1), (5, 1), (12, 1), (14, 1), (16, 1)],
  term ((-1897029392614988480 : Rat) / 53898264945705951) [(1, 1), (4, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((948514696307494240 : Rat) / 53898264945705951) [(1, 1), (4, 1), (5, 1), (14, 2), (16, 1)],
  term ((948514696307494240 : Rat) / 53898264945705951) [(1, 1), (4, 1), (5, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 201 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0201_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0201
        rs_R010_ueqv_R010YNN_generator_27_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_27_0201 := by
  native_decide

/-- Coefficient term 202 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0202 : Poly :=
[
  term (-2 : Rat) [(1, 1), (4, 1), (13, 1), (16, 1)]
]

/-- Partial product 202 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0202 : Poly :=
[
  term (-4 : Rat) [(1, 1), (4, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term (2 : Rat) [(1, 1), (4, 1), (13, 1), (14, 2), (16, 1)],
  term (2 : Rat) [(1, 1), (4, 1), (13, 1), (15, 2), (16, 1)],
  term (-4 : Rat) [(1, 1), (4, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 202 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0202_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0202
        rs_R010_ueqv_R010YNN_generator_27_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_27_0202 := by
  native_decide

/-- Coefficient term 203 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0203 : Poly :=
[
  term ((-425244388262691104 : Rat) / 53898264945705951) [(1, 1), (5, 1), (6, 1), (8, 1), (16, 1)]
]

/-- Partial product 203 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0203 : Poly :=
[
  term ((-850488776525382208 : Rat) / 53898264945705951) [(1, 1), (5, 1), (6, 1), (8, 1), (12, 1), (14, 1), (16, 1)],
  term ((-850488776525382208 : Rat) / 53898264945705951) [(1, 1), (5, 1), (6, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((425244388262691104 : Rat) / 53898264945705951) [(1, 1), (5, 1), (6, 1), (8, 1), (14, 2), (16, 1)],
  term ((425244388262691104 : Rat) / 53898264945705951) [(1, 1), (5, 1), (6, 1), (8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 203 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0203_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0203
        rs_R010_ueqv_R010YNN_generator_27_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_27_0203 := by
  native_decide

/-- Coefficient term 204 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0204 : Poly :=
[
  term ((-2003340489680661256 : Rat) / 53898264945705951) [(1, 1), (5, 1), (6, 1), (14, 1), (16, 1)]
]

/-- Partial product 204 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0204 : Poly :=
[
  term ((-4006680979361322512 : Rat) / 53898264945705951) [(1, 1), (5, 1), (6, 1), (12, 1), (14, 2), (16, 1)],
  term ((-4006680979361322512 : Rat) / 53898264945705951) [(1, 1), (5, 1), (6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((2003340489680661256 : Rat) / 53898264945705951) [(1, 1), (5, 1), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((2003340489680661256 : Rat) / 53898264945705951) [(1, 1), (5, 1), (6, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 204 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0204_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0204
        rs_R010_ueqv_R010YNN_generator_27_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_27_0204 := by
  native_decide

/-- Coefficient term 205 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0205 : Poly :=
[
  term ((269842764215928040 : Rat) / 5988696105078439) [(1, 1), (5, 1), (6, 1), (16, 1)]
]

/-- Partial product 205 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0205 : Poly :=
[
  term ((539685528431856080 : Rat) / 5988696105078439) [(1, 1), (5, 1), (6, 1), (12, 1), (14, 1), (16, 1)],
  term ((539685528431856080 : Rat) / 5988696105078439) [(1, 1), (5, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-269842764215928040 : Rat) / 5988696105078439) [(1, 1), (5, 1), (6, 1), (14, 2), (16, 1)],
  term ((-269842764215928040 : Rat) / 5988696105078439) [(1, 1), (5, 1), (6, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 205 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0205_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0205
        rs_R010_ueqv_R010YNN_generator_27_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_27_0205 := by
  native_decide

/-- Coefficient term 206 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0206 : Poly :=
[
  term ((850488776525382208 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (8, 1), (13, 1), (16, 1)]
]

/-- Partial product 206 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0206 : Poly :=
[
  term ((1700977553050764416 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (8, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-850488776525382208 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (8, 1), (13, 1), (14, 2), (16, 1)],
  term ((-850488776525382208 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((1700977553050764416 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (8, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 206 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0206_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0206
        rs_R010_ueqv_R010YNN_generator_27_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_27_0206 := by
  native_decide

/-- Coefficient term 207 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0207 : Poly :=
[
  term ((-188812957189026867416 : Rat) / 449152207880882925) [(1, 1), (5, 1), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 207 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0207 : Poly :=
[
  term ((-377625914378053734832 : Rat) / 449152207880882925) [(1, 1), (5, 1), (7, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((188812957189026867416 : Rat) / 449152207880882925) [(1, 1), (5, 1), (7, 1), (9, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((188812957189026867416 : Rat) / 449152207880882925) [(1, 1), (5, 1), (7, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((-377625914378053734832 : Rat) / 449152207880882925) [(1, 1), (5, 1), (7, 1), (9, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 207 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0207_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0207
        rs_R010_ueqv_R010YNN_generator_27_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_27_0207 := by
  native_decide

/-- Coefficient term 208 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0208 : Poly :=
[
  term ((-32809238030284800 : Rat) / 5988696105078439) [(1, 1), (5, 1), (7, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 208 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0208 : Poly :=
[
  term ((-65618476060569600 : Rat) / 5988696105078439) [(1, 1), (5, 1), (7, 1), (9, 2), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((32809238030284800 : Rat) / 5988696105078439) [(1, 1), (5, 1), (7, 1), (9, 2), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((32809238030284800 : Rat) / 5988696105078439) [(1, 1), (5, 1), (7, 1), (9, 2), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-65618476060569600 : Rat) / 5988696105078439) [(1, 1), (5, 1), (7, 1), (9, 2), (11, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 208 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0208_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0208
        rs_R010_ueqv_R010YNN_generator_27_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_27_0208 := by
  native_decide

/-- Coefficient term 209 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0209 : Poly :=
[
  term ((1579005019493350400 : Rat) / 17966088315235317) [(1, 1), (5, 1), (7, 1), (9, 2), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 209 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0209 : Poly :=
[
  term ((3158010038986700800 : Rat) / 17966088315235317) [(1, 1), (5, 1), (7, 1), (9, 2), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1579005019493350400 : Rat) / 17966088315235317) [(1, 1), (5, 1), (7, 1), (9, 2), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-1579005019493350400 : Rat) / 17966088315235317) [(1, 1), (5, 1), (7, 1), (9, 2), (13, 1), (15, 4), (16, 1)],
  term ((3158010038986700800 : Rat) / 17966088315235317) [(1, 1), (5, 1), (7, 1), (9, 2), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 209 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0209_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0209
        rs_R010_ueqv_R010YNN_generator_27_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_27_0209 := by
  native_decide

/-- Coefficient term 210 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0210 : Poly :=
[
  term ((-1050741408711393280 : Rat) / 17966088315235317) [(1, 1), (5, 1), (7, 1), (9, 3), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 210 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0210 : Poly :=
[
  term ((-2101482817422786560 : Rat) / 17966088315235317) [(1, 1), (5, 1), (7, 1), (9, 3), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1050741408711393280 : Rat) / 17966088315235317) [(1, 1), (5, 1), (7, 1), (9, 3), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((1050741408711393280 : Rat) / 17966088315235317) [(1, 1), (5, 1), (7, 1), (9, 3), (13, 1), (15, 3), (16, 1)],
  term ((-2101482817422786560 : Rat) / 17966088315235317) [(1, 1), (5, 1), (7, 1), (9, 3), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 210 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0210_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0210
        rs_R010_ueqv_R010YNN_generator_27_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_27_0210 := by
  native_decide

/-- Coefficient term 211 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0211 : Poly :=
[
  term ((-425244388262691104 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (13, 1), (16, 1)]
]

/-- Partial product 211 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0211 : Poly :=
[
  term ((-850488776525382208 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((425244388262691104 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (13, 1), (14, 2), (16, 1)],
  term ((425244388262691104 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-850488776525382208 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 211 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0211_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0211
        rs_R010_ueqv_R010YNN_generator_27_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_27_0211 := by
  native_decide

/-- Coefficient term 212 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0212 : Poly :=
[
  term ((-1243448445288249442 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 212 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0212 : Poly :=
[
  term ((-2486896890576498884 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2486896890576498884 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((1243448445288249442 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((1243448445288249442 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 212 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0212_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0212
        rs_R010_ueqv_R010YNN_generator_27_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_27_0212 := by
  native_decide

/-- Coefficient term 213 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0213 : Poly :=
[
  term ((7831198803583590400 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 213 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0213 : Poly :=
[
  term ((15662397607167180800 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7831198803583590400 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (9, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-7831198803583590400 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (9, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((15662397607167180800 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (9, 1), (11, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 213 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0213_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0213
        rs_R010_ueqv_R010YNN_generator_27_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_27_0213 := by
  native_decide

/-- Coefficient term 214 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0214 : Poly :=
[
  term ((868452760721342720 : Rat) / 17966088315235317) [(1, 1), (5, 1), (8, 1), (9, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 214 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0214 : Poly :=
[
  term ((1736905521442685440 : Rat) / 17966088315235317) [(1, 1), (5, 1), (8, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-868452760721342720 : Rat) / 17966088315235317) [(1, 1), (5, 1), (8, 1), (9, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-868452760721342720 : Rat) / 17966088315235317) [(1, 1), (5, 1), (8, 1), (9, 1), (13, 1), (15, 4), (16, 1)],
  term ((1736905521442685440 : Rat) / 17966088315235317) [(1, 1), (5, 1), (8, 1), (9, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 214 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0214_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0214
        rs_R010_ueqv_R010YNN_generator_27_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_27_0214 := by
  native_decide

/-- Coefficient term 215 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0215 : Poly :=
[
  term ((63007953097779200 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 215 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0215 : Poly :=
[
  term ((126015906195558400 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-63007953097779200 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((-63007953097779200 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((126015906195558400 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (9, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 215 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0215_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0215
        rs_R010_ueqv_R010YNN_generator_27_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_27_0215 := by
  native_decide

/-- Coefficient term 216 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0216 : Poly :=
[
  term ((1739797505789306880 : Rat) / 5988696105078439) [(1, 1), (5, 1), (8, 1), (9, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 216 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0216 : Poly :=
[
  term ((3479595011578613760 : Rat) / 5988696105078439) [(1, 1), (5, 1), (8, 1), (9, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1739797505789306880 : Rat) / 5988696105078439) [(1, 1), (5, 1), (8, 1), (9, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1739797505789306880 : Rat) / 5988696105078439) [(1, 1), (5, 1), (8, 1), (9, 2), (13, 1), (15, 3), (16, 1)],
  term ((3479595011578613760 : Rat) / 5988696105078439) [(1, 1), (5, 1), (8, 1), (9, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 216 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0216_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0216
        rs_R010_ueqv_R010YNN_generator_27_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_27_0216 := by
  native_decide

/-- Coefficient term 217 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0217 : Poly :=
[
  term ((126868663456640000 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 217 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0217 : Poly :=
[
  term ((253737326913280000 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-126868663456640000 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-126868663456640000 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((253737326913280000 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 217 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0217_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0217
        rs_R010_ueqv_R010YNN_generator_27_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_27_0217 := by
  native_decide

/-- Coefficient term 218 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0218 : Poly :=
[
  term ((908334855128950136848 : Rat) / 269491324728529755) [(1, 1), (5, 1), (8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 218 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0218 : Poly :=
[
  term ((1816669710257900273696 : Rat) / 269491324728529755) [(1, 1), (5, 1), (8, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-908334855128950136848 : Rat) / 269491324728529755) [(1, 1), (5, 1), (8, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-908334855128950136848 : Rat) / 269491324728529755) [(1, 1), (5, 1), (8, 1), (13, 1), (15, 3), (16, 1)],
  term ((1816669710257900273696 : Rat) / 269491324728529755) [(1, 1), (5, 1), (8, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 218 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0218_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0218
        rs_R010_ueqv_R010YNN_generator_27_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_27_0218 := by
  native_decide

/-- Coefficient term 219 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0219 : Poly :=
[
  term ((-15751988274444800 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (14, 1), (16, 1)]
]

/-- Partial product 219 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0219 : Poly :=
[
  term ((-31503976548889600 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (12, 1), (14, 2), (16, 1)],
  term ((-31503976548889600 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((15751988274444800 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((15751988274444800 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 219 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0219_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0219
        rs_R010_ueqv_R010YNN_generator_27_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_27_0219 := by
  native_decide

/-- Coefficient term 220 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0220 : Poly :=
[
  term ((220498188268567952 : Rat) / 17966088315235317) [(1, 1), (5, 1), (8, 1), (16, 1)]
]

/-- Partial product 220 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0220 : Poly :=
[
  term ((440996376537135904 : Rat) / 17966088315235317) [(1, 1), (5, 1), (8, 1), (12, 1), (14, 1), (16, 1)],
  term ((440996376537135904 : Rat) / 17966088315235317) [(1, 1), (5, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-220498188268567952 : Rat) / 17966088315235317) [(1, 1), (5, 1), (8, 1), (14, 2), (16, 1)],
  term ((-220498188268567952 : Rat) / 17966088315235317) [(1, 1), (5, 1), (8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 220 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0220_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0220
        rs_R010_ueqv_R010YNN_generator_27_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_27_0220 := by
  native_decide

/-- Coefficient term 221 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0221 : Poly :=
[
  term ((-6353754591670528000 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 221 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0221 : Poly :=
[
  term ((-12707509183341056000 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((6353754591670528000 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((6353754591670528000 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-12707509183341056000 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (11, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 221 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0221_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0221
        rs_R010_ueqv_R010YNN_generator_27_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_27_0221 := by
  native_decide

/-- Coefficient term 222 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0222 : Poly :=
[
  term ((-185604519786022400 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 222 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0222 : Poly :=
[
  term ((-371209039572044800 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((-371209039572044800 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((185604519786022400 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((185604519786022400 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (11, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 222 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0222_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0222
        rs_R010_ueqv_R010YNN_generator_27_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_27_0222 := by
  native_decide

/-- Coefficient term 223 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0223 : Poly :=
[
  term ((-3224185560780800 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 223 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0223 : Poly :=
[
  term ((-6448371121561600 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-6448371121561600 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((3224185560780800 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 1), (11, 1), (14, 2), (15, 2), (16, 1)],
  term ((3224185560780800 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 1), (11, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 223 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0223_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0223
        rs_R010_ueqv_R010YNN_generator_27_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_27_0223 := by
  native_decide

/-- Coefficient term 224 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0224 : Poly :=
[
  term ((22855848387814400 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 224 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0224 : Poly :=
[
  term ((45711696775628800 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((45711696775628800 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-22855848387814400 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((-22855848387814400 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 224 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0224_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0224
        rs_R010_ueqv_R010YNN_generator_27_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_27_0224 := by
  native_decide

/-- Coefficient term 225 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0225 : Poly :=
[
  term ((806046390195200 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (11, 2), (13, 1), (16, 1)]
]

/-- Partial product 225 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0225 : Poly :=
[
  term ((1612092780390400 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (11, 2), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-806046390195200 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (11, 2), (13, 1), (14, 2), (16, 1)],
  term ((-806046390195200 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((1612092780390400 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (11, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 225 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0225_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0225
        rs_R010_ueqv_R010YNN_generator_27_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_27_0225 := by
  native_decide

/-- Coefficient term 226 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0226 : Poly :=
[
  term ((1612092780390400 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 226 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0226 : Poly :=
[
  term ((3224185560780800 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 1), (11, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((3224185560780800 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((-1612092780390400 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 1), (11, 2), (14, 2), (15, 1), (16, 1)],
  term ((-1612092780390400 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 1), (11, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 226 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0226_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0226
        rs_R010_ueqv_R010YNN_generator_27_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_27_0226 := by
  native_decide

/-- Coefficient term 227 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0227 : Poly :=
[
  term ((-2289557278265358080 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 227 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0227 : Poly :=
[
  term ((-4579114556530716160 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((2289557278265358080 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((2289557278265358080 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (13, 1), (15, 4), (16, 1)],
  term ((-4579114556530716160 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 227 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0227_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0227
        rs_R010_ueqv_R010YNN_generator_27_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_27_0227 := by
  native_decide

/-- Coefficient term 228 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0228 : Poly :=
[
  term ((1443647330661760 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 228 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0228 : Poly :=
[
  term ((2887294661323520 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1443647330661760 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((-1443647330661760 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((2887294661323520 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 228 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0228_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0228
        rs_R010_ueqv_R010YNN_generator_27_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_27_0228 := by
  native_decide

/-- Coefficient term 229 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0229 : Poly :=
[
  term ((-69081469602834080 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 229 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0229 : Poly :=
[
  term ((-138162939205668160 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-138162939205668160 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((69081469602834080 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (14, 1), (15, 3), (16, 1)],
  term ((69081469602834080 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 229 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0229_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0229
        rs_R010_ueqv_R010YNN_generator_27_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_27_0229 := by
  native_decide

/-- Coefficient term 230 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0230 : Poly :=
[
  term ((-520962778603358714264 : Rat) / 4042369870927946325) [(1, 1), (5, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 230 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0230 : Poly :=
[
  term ((-1041925557206717428528 : Rat) / 4042369870927946325) [(1, 1), (5, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1041925557206717428528 : Rat) / 4042369870927946325) [(1, 1), (5, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((520962778603358714264 : Rat) / 4042369870927946325) [(1, 1), (5, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((520962778603358714264 : Rat) / 4042369870927946325) [(1, 1), (5, 1), (9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 230 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0230_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0230
        rs_R010_ueqv_R010YNN_generator_27_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_27_0230 := by
  native_decide

/-- Coefficient term 231 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0231 : Poly :=
[
  term ((593756640942080 : Rat) / 5988696105078439) [(1, 1), (5, 1), (9, 2), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 231 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0231 : Poly :=
[
  term ((1187513281884160 : Rat) / 5988696105078439) [(1, 1), (5, 1), (9, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-593756640942080 : Rat) / 5988696105078439) [(1, 1), (5, 1), (9, 2), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-593756640942080 : Rat) / 5988696105078439) [(1, 1), (5, 1), (9, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((1187513281884160 : Rat) / 5988696105078439) [(1, 1), (5, 1), (9, 2), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 231 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0231_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0231
        rs_R010_ueqv_R010YNN_generator_27_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_27_0231 := by
  native_decide

/-- Coefficient term 232 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0232 : Poly :=
[
  term ((185951920631429120 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 232 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0232 : Poly :=
[
  term ((371903841262858240 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((371903841262858240 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-185951920631429120 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 2), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-185951920631429120 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 2), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 232 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0232_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0232
        rs_R010_ueqv_R010YNN_generator_27_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_27_0232 := by
  native_decide

/-- Coefficient term 233 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0233 : Poly :=
[
  term ((-1225089569658141021664 : Rat) / 449152207880882925) [(1, 1), (5, 1), (9, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 233 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0233 : Poly :=
[
  term ((-2450179139316282043328 : Rat) / 449152207880882925) [(1, 1), (5, 1), (9, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1225089569658141021664 : Rat) / 449152207880882925) [(1, 1), (5, 1), (9, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((1225089569658141021664 : Rat) / 449152207880882925) [(1, 1), (5, 1), (9, 2), (13, 1), (15, 3), (16, 1)],
  term ((-2450179139316282043328 : Rat) / 449152207880882925) [(1, 1), (5, 1), (9, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 233 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0233_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0233
        rs_R010_ueqv_R010YNN_generator_27_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_27_0233 := by
  native_decide

/-- Coefficient term 234 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0234 : Poly :=
[
  term ((-28965917103719680 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 2), (14, 1), (16, 1)]
]

/-- Partial product 234 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0234 : Poly :=
[
  term ((-57931834207439360 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 2), (12, 1), (14, 2), (16, 1)],
  term ((-57931834207439360 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((28965917103719680 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 2), (14, 1), (15, 2), (16, 1)],
  term ((28965917103719680 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 2), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 234 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0234_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0234
        rs_R010_ueqv_R010YNN_generator_27_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_27_0234 := by
  native_decide

/-- Coefficient term 235 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0235 : Poly :=
[
  term ((-7125079691304960 : Rat) / 5988696105078439) [(1, 1), (5, 1), (9, 2), (15, 2), (16, 1)]
]

/-- Partial product 235 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0235 : Poly :=
[
  term ((-14250159382609920 : Rat) / 5988696105078439) [(1, 1), (5, 1), (9, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-14250159382609920 : Rat) / 5988696105078439) [(1, 1), (5, 1), (9, 2), (13, 1), (15, 3), (16, 1)],
  term ((7125079691304960 : Rat) / 5988696105078439) [(1, 1), (5, 1), (9, 2), (14, 2), (15, 2), (16, 1)],
  term ((7125079691304960 : Rat) / 5988696105078439) [(1, 1), (5, 1), (9, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 235 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0235_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0235
        rs_R010_ueqv_R010YNN_generator_27_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_27_0235 := by
  native_decide

/-- Coefficient term 236 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0236 : Poly :=
[
  term ((-7692851207896960 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 2), (16, 1)]
]

/-- Partial product 236 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0236 : Poly :=
[
  term ((-15385702415793920 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 2), (12, 1), (14, 1), (16, 1)],
  term ((-15385702415793920 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((7692851207896960 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 2), (14, 2), (16, 1)],
  term ((7692851207896960 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 236 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0236_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0236
        rs_R010_ueqv_R010YNN_generator_27_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_27_0236 := by
  native_decide

/-- Coefficient term 237 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0237 : Poly :=
[
  term ((127103842707251200 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 3), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 237 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0237 : Poly :=
[
  term ((254207685414502400 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 3), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-127103842707251200 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 3), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-127103842707251200 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 3), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((254207685414502400 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 3), (11, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 237 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0237_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0237
        rs_R010_ueqv_R010YNN_generator_27_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_27_0237 := by
  native_decide

/-- Coefficient term 238 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0238 : Poly :=
[
  term ((-508414149220311040 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 3), (15, 1), (16, 1)]
]

/-- Partial product 238 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0238 : Poly :=
[
  term ((-1016828298440622080 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 3), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1016828298440622080 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 3), (13, 1), (15, 2), (16, 1)],
  term ((508414149220311040 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 3), (14, 2), (15, 1), (16, 1)],
  term ((508414149220311040 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 238 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0238_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0238
        rs_R010_ueqv_R010YNN_generator_27_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_27_0238 := by
  native_decide

/-- Coefficient term 239 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0239 : Poly :=
[
  term ((-1435727629753876480 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 4), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 239 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0239 : Poly :=
[
  term ((-2871455259507752960 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 4), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1435727629753876480 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 4), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((1435727629753876480 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 4), (13, 1), (15, 3), (16, 1)],
  term ((-2871455259507752960 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 4), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 239 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0239_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0239
        rs_R010_ueqv_R010YNN_generator_27_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_27_0239 := by
  native_decide

/-- Coefficient term 240 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0240 : Poly :=
[
  term ((-195893711407505972 : Rat) / 53898264945705951) [(1, 1), (5, 1), (10, 1), (14, 1), (16, 1)]
]

/-- Partial product 240 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0240 : Poly :=
[
  term ((-391787422815011944 : Rat) / 53898264945705951) [(1, 1), (5, 1), (10, 1), (12, 1), (14, 2), (16, 1)],
  term ((-391787422815011944 : Rat) / 53898264945705951) [(1, 1), (5, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((195893711407505972 : Rat) / 53898264945705951) [(1, 1), (5, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((195893711407505972 : Rat) / 53898264945705951) [(1, 1), (5, 1), (10, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 240 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0240_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0240
        rs_R010_ueqv_R010YNN_generator_27_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_27_0240 := by
  native_decide

/-- Coefficient term 241 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0241 : Poly :=
[
  term ((97946855703752986 : Rat) / 17966088315235317) [(1, 1), (5, 1), (10, 1), (16, 1)]
]

/-- Partial product 241 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0241 : Poly :=
[
  term ((195893711407505972 : Rat) / 17966088315235317) [(1, 1), (5, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((195893711407505972 : Rat) / 17966088315235317) [(1, 1), (5, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-97946855703752986 : Rat) / 17966088315235317) [(1, 1), (5, 1), (10, 1), (14, 2), (16, 1)],
  term ((-97946855703752986 : Rat) / 17966088315235317) [(1, 1), (5, 1), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 241 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0241_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0241
        rs_R010_ueqv_R010YNN_generator_27_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_27_0241 := by
  native_decide

/-- Coefficient term 242 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0242 : Poly :=
[
  term ((-91630242065062467196 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 242 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0242 : Poly :=
[
  term ((-183260484130124934392 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((91630242065062467196 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((91630242065062467196 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-183260484130124934392 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 242 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0242_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0242
        rs_R010_ueqv_R010YNN_generator_27_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_27_0242 := by
  native_decide

/-- Coefficient term 243 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0243 : Poly :=
[
  term ((-46067668528567529192 : Rat) / 449152207880882925) [(1, 1), (5, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 243 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0243 : Poly :=
[
  term ((-92135337057135058384 : Rat) / 449152207880882925) [(1, 1), (5, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-92135337057135058384 : Rat) / 449152207880882925) [(1, 1), (5, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((46067668528567529192 : Rat) / 449152207880882925) [(1, 1), (5, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((46067668528567529192 : Rat) / 449152207880882925) [(1, 1), (5, 1), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 243 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0243_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0243
        rs_R010_ueqv_R010YNN_generator_27_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_27_0243 := by
  native_decide

/-- Coefficient term 244 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0244 : Poly :=
[
  term ((1897029392614988480 : Rat) / 53898264945705951) [(1, 1), (5, 1), (11, 2), (16, 1)]
]

/-- Partial product 244 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0244 : Poly :=
[
  term ((3794058785229976960 : Rat) / 53898264945705951) [(1, 1), (5, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((3794058785229976960 : Rat) / 53898264945705951) [(1, 1), (5, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1897029392614988480 : Rat) / 53898264945705951) [(1, 1), (5, 1), (11, 2), (14, 2), (16, 1)],
  term ((-1897029392614988480 : Rat) / 53898264945705951) [(1, 1), (5, 1), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 244 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0244_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0244
        rs_R010_ueqv_R010YNN_generator_27_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_27_0244 := by
  native_decide

/-- Coefficient term 245 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0245 : Poly :=
[
  term ((-1639774503533655504644 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 245 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0245 : Poly :=
[
  term ((-3279549007067311009288 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1639774503533655504644 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((1639774503533655504644 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (13, 1), (15, 3), (16, 1)],
  term ((-3279549007067311009288 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 245 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0245_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0245
        rs_R010_ueqv_R010YNN_generator_27_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_27_0245 := by
  native_decide

/-- Coefficient term 246 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0246 : Poly :=
[
  term ((-25886781388493365967 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (14, 1), (16, 1)]
]

/-- Partial product 246 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0246 : Poly :=
[
  term ((-51773562776986731934 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (12, 1), (14, 2), (16, 1)],
  term ((-51773562776986731934 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((25886781388493365967 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (14, 1), (15, 2), (16, 1)],
  term ((25886781388493365967 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 246 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0246_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0246
        rs_R010_ueqv_R010YNN_generator_27_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_27_0246 := by
  native_decide

/-- Coefficient term 247 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0247 : Poly :=
[
  term ((38215477719382175152 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (15, 2), (16, 1)]
]

/-- Partial product 247 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0247 : Poly :=
[
  term ((76430955438764350304 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((76430955438764350304 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (13, 1), (15, 3), (16, 1)],
  term ((-38215477719382175152 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (14, 2), (15, 2), (16, 1)],
  term ((-38215477719382175152 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 247 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0247_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0247
        rs_R010_ueqv_R010YNN_generator_27_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_27_0247 := by
  native_decide

/-- Coefficient term 248 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0248 : Poly :=
[
  term ((133032009543595945033 : Rat) / 2694913247285297550) [(1, 1), (5, 1), (16, 1)]
]

/-- Partial product 248 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0248 : Poly :=
[
  term ((133032009543595945033 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (12, 1), (14, 1), (16, 1)],
  term ((133032009543595945033 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-133032009543595945033 : Rat) / 2694913247285297550) [(1, 1), (5, 1), (14, 2), (16, 1)],
  term ((-133032009543595945033 : Rat) / 2694913247285297550) [(1, 1), (5, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 248 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0248_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0248
        rs_R010_ueqv_R010YNN_generator_27_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_27_0248 := by
  native_decide

/-- Coefficient term 249 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0249 : Poly :=
[
  term ((-74245600271068160 : Rat) / 5988696105078439) [(1, 1), (5, 2), (6, 1), (8, 1), (9, 1), (16, 1)]
]

/-- Partial product 249 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0249 : Poly :=
[
  term ((-148491200542136320 : Rat) / 5988696105078439) [(1, 1), (5, 2), (6, 1), (8, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((-148491200542136320 : Rat) / 5988696105078439) [(1, 1), (5, 2), (6, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((74245600271068160 : Rat) / 5988696105078439) [(1, 1), (5, 2), (6, 1), (8, 1), (9, 1), (14, 2), (16, 1)],
  term ((74245600271068160 : Rat) / 5988696105078439) [(1, 1), (5, 2), (6, 1), (8, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 249 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0249_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0249
        rs_R010_ueqv_R010YNN_generator_27_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_27_0249 := by
  native_decide

/-- Coefficient term 250 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0250 : Poly :=
[
  term ((-18561400067767040 : Rat) / 5988696105078439) [(1, 1), (5, 2), (6, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 250 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0250 : Poly :=
[
  term ((-37122800135534080 : Rat) / 5988696105078439) [(1, 1), (5, 2), (6, 1), (9, 1), (12, 1), (14, 2), (16, 1)],
  term ((-37122800135534080 : Rat) / 5988696105078439) [(1, 1), (5, 2), (6, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((18561400067767040 : Rat) / 5988696105078439) [(1, 1), (5, 2), (6, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((18561400067767040 : Rat) / 5988696105078439) [(1, 1), (5, 2), (6, 1), (9, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 250 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0250_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0250
        rs_R010_ueqv_R010YNN_generator_27_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_27_0250 := by
  native_decide

/-- Coefficient term 251 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0251 : Poly :=
[
  term ((92807000338835200 : Rat) / 5988696105078439) [(1, 1), (5, 2), (6, 1), (9, 1), (16, 1)]
]

/-- Partial product 251 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0251 : Poly :=
[
  term ((185614000677670400 : Rat) / 5988696105078439) [(1, 1), (5, 2), (6, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((185614000677670400 : Rat) / 5988696105078439) [(1, 1), (5, 2), (6, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-92807000338835200 : Rat) / 5988696105078439) [(1, 1), (5, 2), (6, 1), (9, 1), (14, 2), (16, 1)],
  term ((-92807000338835200 : Rat) / 5988696105078439) [(1, 1), (5, 2), (6, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 251 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0251_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0251
        rs_R010_ueqv_R010YNN_generator_27_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_27_0251 := by
  native_decide

/-- Coefficient term 252 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0252 : Poly :=
[
  term ((148491200542136320 : Rat) / 5988696105078439) [(1, 1), (5, 2), (7, 1), (8, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 252 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0252 : Poly :=
[
  term ((296982401084272640 : Rat) / 5988696105078439) [(1, 1), (5, 2), (7, 1), (8, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-148491200542136320 : Rat) / 5988696105078439) [(1, 1), (5, 2), (7, 1), (8, 1), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((-148491200542136320 : Rat) / 5988696105078439) [(1, 1), (5, 2), (7, 1), (8, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((296982401084272640 : Rat) / 5988696105078439) [(1, 1), (5, 2), (7, 1), (8, 1), (9, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 252 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0252_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0252
        rs_R010_ueqv_R010YNN_generator_27_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_27_0252 := by
  native_decide

/-- Coefficient term 253 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0253 : Poly :=
[
  term ((-74245600271068160 : Rat) / 5988696105078439) [(1, 1), (5, 2), (7, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 253 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0253 : Poly :=
[
  term ((-148491200542136320 : Rat) / 5988696105078439) [(1, 1), (5, 2), (7, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((74245600271068160 : Rat) / 5988696105078439) [(1, 1), (5, 2), (7, 1), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((74245600271068160 : Rat) / 5988696105078439) [(1, 1), (5, 2), (7, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-148491200542136320 : Rat) / 5988696105078439) [(1, 1), (5, 2), (7, 1), (9, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 253 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0253_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0253
        rs_R010_ueqv_R010YNN_generator_27_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_27_0253 := by
  native_decide

/-- Coefficient term 254 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0254 : Poly :=
[
  term ((-88166650321893440 : Rat) / 17966088315235317) [(1, 1), (5, 2), (7, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 254 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0254 : Poly :=
[
  term ((-176333300643786880 : Rat) / 17966088315235317) [(1, 1), (5, 2), (7, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-176333300643786880 : Rat) / 17966088315235317) [(1, 1), (5, 2), (7, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((88166650321893440 : Rat) / 17966088315235317) [(1, 1), (5, 2), (7, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((88166650321893440 : Rat) / 17966088315235317) [(1, 1), (5, 2), (7, 1), (9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 254 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0254_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0254
        rs_R010_ueqv_R010YNN_generator_27_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_27_0254 := by
  native_decide

/-- Coefficient term 255 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0255 : Poly :=
[
  term ((10403022895177344256 : Rat) / 29943480525392195) [(1, 1), (5, 2), (7, 1), (9, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 255 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0255 : Poly :=
[
  term ((20806045790354688512 : Rat) / 29943480525392195) [(1, 1), (5, 2), (7, 1), (9, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-10403022895177344256 : Rat) / 29943480525392195) [(1, 1), (5, 2), (7, 1), (9, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-10403022895177344256 : Rat) / 29943480525392195) [(1, 1), (5, 2), (7, 1), (9, 2), (13, 1), (15, 3), (16, 1)],
  term ((20806045790354688512 : Rat) / 29943480525392195) [(1, 1), (5, 2), (7, 1), (9, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 255 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0255_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0255
        rs_R010_ueqv_R010YNN_generator_27_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_27_0255 := by
  native_decide

/-- Coefficient term 256 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0256 : Poly :=
[
  term ((113315924951282679296 : Rat) / 53898264945705951) [(1, 1), (5, 2), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 256 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0256 : Poly :=
[
  term ((226631849902565358592 : Rat) / 53898264945705951) [(1, 1), (5, 2), (8, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-113315924951282679296 : Rat) / 53898264945705951) [(1, 1), (5, 2), (8, 1), (9, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-113315924951282679296 : Rat) / 53898264945705951) [(1, 1), (5, 2), (8, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((226631849902565358592 : Rat) / 53898264945705951) [(1, 1), (5, 2), (8, 1), (9, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 256 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0256_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0256
        rs_R010_ueqv_R010YNN_generator_27_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_27_0256 := by
  native_decide

/-- Coefficient term 257 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0257 : Poly :=
[
  term ((111368400406602240 : Rat) / 5988696105078439) [(1, 1), (5, 2), (8, 1), (9, 1), (16, 1)]
]

/-- Partial product 257 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0257 : Poly :=
[
  term ((222736800813204480 : Rat) / 5988696105078439) [(1, 1), (5, 2), (8, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((222736800813204480 : Rat) / 5988696105078439) [(1, 1), (5, 2), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-111368400406602240 : Rat) / 5988696105078439) [(1, 1), (5, 2), (8, 1), (9, 1), (14, 2), (16, 1)],
  term ((-111368400406602240 : Rat) / 5988696105078439) [(1, 1), (5, 2), (8, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 257 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0257_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0257
        rs_R010_ueqv_R010YNN_generator_27_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_27_0257 := by
  native_decide

/-- Coefficient term 258 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0258 : Poly :=
[
  term ((-2055402032620518080 : Rat) / 53898264945705951) [(1, 1), (5, 2), (8, 1), (13, 1), (16, 1)]
]

/-- Partial product 258 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0258 : Poly :=
[
  term ((-4110804065241036160 : Rat) / 53898264945705951) [(1, 1), (5, 2), (8, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((2055402032620518080 : Rat) / 53898264945705951) [(1, 1), (5, 2), (8, 1), (13, 1), (14, 2), (16, 1)],
  term ((2055402032620518080 : Rat) / 53898264945705951) [(1, 1), (5, 2), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((-4110804065241036160 : Rat) / 53898264945705951) [(1, 1), (5, 2), (8, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 258 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0258_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0258
        rs_R010_ueqv_R010YNN_generator_27_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_27_0258 := by
  native_decide

/-- Coefficient term 259 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0259 : Poly :=
[
  term ((9280700033883520 : Rat) / 5988696105078439) [(1, 1), (5, 2), (9, 1), (10, 1), (14, 1), (16, 1)]
]

/-- Partial product 259 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0259 : Poly :=
[
  term ((18561400067767040 : Rat) / 5988696105078439) [(1, 1), (5, 2), (9, 1), (10, 1), (12, 1), (14, 2), (16, 1)],
  term ((18561400067767040 : Rat) / 5988696105078439) [(1, 1), (5, 2), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-9280700033883520 : Rat) / 5988696105078439) [(1, 1), (5, 2), (9, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-9280700033883520 : Rat) / 5988696105078439) [(1, 1), (5, 2), (9, 1), (10, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 259 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0259_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0259
        rs_R010_ueqv_R010YNN_generator_27_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_27_0259 := by
  native_decide

/-- Coefficient term 260 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0260 : Poly :=
[
  term ((-13921050050825280 : Rat) / 5988696105078439) [(1, 1), (5, 2), (9, 1), (10, 1), (16, 1)]
]

/-- Partial product 260 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0260 : Poly :=
[
  term ((-27842100101650560 : Rat) / 5988696105078439) [(1, 1), (5, 2), (9, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-27842100101650560 : Rat) / 5988696105078439) [(1, 1), (5, 2), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((13921050050825280 : Rat) / 5988696105078439) [(1, 1), (5, 2), (9, 1), (10, 1), (14, 2), (16, 1)],
  term ((13921050050825280 : Rat) / 5988696105078439) [(1, 1), (5, 2), (9, 1), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 260 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0260_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0260
        rs_R010_ueqv_R010YNN_generator_27_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_27_0260 := by
  native_decide

/-- Coefficient term 261 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0261 : Poly :=
[
  term ((870888013407246208 : Rat) / 269491324728529755) [(1, 1), (5, 2), (9, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 261 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0261 : Poly :=
[
  term ((1741776026814492416 : Rat) / 269491324728529755) [(1, 1), (5, 2), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-870888013407246208 : Rat) / 269491324728529755) [(1, 1), (5, 2), (9, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-870888013407246208 : Rat) / 269491324728529755) [(1, 1), (5, 2), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((1741776026814492416 : Rat) / 269491324728529755) [(1, 1), (5, 2), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 261 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0261_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0261
        rs_R010_ueqv_R010YNN_generator_27_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_27_0261 := by
  native_decide

/-- Coefficient term 262 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0262 : Poly :=
[
  term ((-3857484920233728 : Rat) / 29943480525392195) [(1, 1), (5, 2), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 262 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0262 : Poly :=
[
  term ((-7714969840467456 : Rat) / 29943480525392195) [(1, 1), (5, 2), (9, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7714969840467456 : Rat) / 29943480525392195) [(1, 1), (5, 2), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((3857484920233728 : Rat) / 29943480525392195) [(1, 1), (5, 2), (9, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((3857484920233728 : Rat) / 29943480525392195) [(1, 1), (5, 2), (9, 1), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 262 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0262_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0262
        rs_R010_ueqv_R010YNN_generator_27_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_27_0262 := by
  native_decide

/-- Coefficient term 263 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0263 : Poly :=
[
  term ((-213058300879169054288 : Rat) / 269491324728529755) [(1, 1), (5, 2), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 263 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0263 : Poly :=
[
  term ((-426116601758338108576 : Rat) / 269491324728529755) [(1, 1), (5, 2), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((213058300879169054288 : Rat) / 269491324728529755) [(1, 1), (5, 2), (9, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((213058300879169054288 : Rat) / 269491324728529755) [(1, 1), (5, 2), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((-426116601758338108576 : Rat) / 269491324728529755) [(1, 1), (5, 2), (9, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 263 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0263_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0263
        rs_R010_ueqv_R010YNN_generator_27_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_27_0263 := by
  native_decide

/-- Coefficient term 264 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0264 : Poly :=
[
  term ((-22059066061424749984 : Rat) / 269491324728529755) [(1, 1), (5, 2), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 264 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0264 : Poly :=
[
  term ((-44118132122849499968 : Rat) / 269491324728529755) [(1, 1), (5, 2), (9, 1), (12, 1), (14, 2), (16, 1)],
  term ((-44118132122849499968 : Rat) / 269491324728529755) [(1, 1), (5, 2), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((22059066061424749984 : Rat) / 269491324728529755) [(1, 1), (5, 2), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((22059066061424749984 : Rat) / 269491324728529755) [(1, 1), (5, 2), (9, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 264 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0264_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0264
        rs_R010_ueqv_R010YNN_generator_27_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_27_0264 := by
  native_decide

/-- Coefficient term 265 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0265 : Poly :=
[
  term ((-110258185823109632 : Rat) / 89830441576176585) [(1, 1), (5, 2), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 265 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0265 : Poly :=
[
  term ((-220516371646219264 : Rat) / 89830441576176585) [(1, 1), (5, 2), (9, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-220516371646219264 : Rat) / 89830441576176585) [(1, 1), (5, 2), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((110258185823109632 : Rat) / 89830441576176585) [(1, 1), (5, 2), (9, 1), (14, 2), (15, 2), (16, 1)],
  term ((110258185823109632 : Rat) / 89830441576176585) [(1, 1), (5, 2), (9, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 265 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0265_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0265
        rs_R010_ueqv_R010YNN_generator_27_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_27_0265 := by
  native_decide

/-- Coefficient term 266 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0266 : Poly :=
[
  term ((13029814451987297008 : Rat) / 269491324728529755) [(1, 1), (5, 2), (9, 1), (16, 1)]
]

/-- Partial product 266 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0266 : Poly :=
[
  term ((26059628903974594016 : Rat) / 269491324728529755) [(1, 1), (5, 2), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((26059628903974594016 : Rat) / 269491324728529755) [(1, 1), (5, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-13029814451987297008 : Rat) / 269491324728529755) [(1, 1), (5, 2), (9, 1), (14, 2), (16, 1)],
  term ((-13029814451987297008 : Rat) / 269491324728529755) [(1, 1), (5, 2), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 266 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0266_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0266
        rs_R010_ueqv_R010YNN_generator_27_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_27_0266 := by
  native_decide

/-- Coefficient term 267 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0267 : Poly :=
[
  term ((237860916618752000 : Rat) / 17966088315235317) [(1, 1), (5, 2), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 267 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0267 : Poly :=
[
  term ((475721833237504000 : Rat) / 17966088315235317) [(1, 1), (5, 2), (9, 2), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-237860916618752000 : Rat) / 17966088315235317) [(1, 1), (5, 2), (9, 2), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-237860916618752000 : Rat) / 17966088315235317) [(1, 1), (5, 2), (9, 2), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((475721833237504000 : Rat) / 17966088315235317) [(1, 1), (5, 2), (9, 2), (11, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 267 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0267_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0267
        rs_R010_ueqv_R010YNN_generator_27_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_27_0267 := by
  native_decide

/-- Coefficient term 268 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0268 : Poly :=
[
  term ((1187513281884160 : Rat) / 5988696105078439) [(1, 1), (5, 2), (9, 2), (13, 1), (16, 1)]
]

/-- Partial product 268 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0268 : Poly :=
[
  term ((2375026563768320 : Rat) / 5988696105078439) [(1, 1), (5, 2), (9, 2), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1187513281884160 : Rat) / 5988696105078439) [(1, 1), (5, 2), (9, 2), (13, 1), (14, 2), (16, 1)],
  term ((-1187513281884160 : Rat) / 5988696105078439) [(1, 1), (5, 2), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((2375026563768320 : Rat) / 5988696105078439) [(1, 1), (5, 2), (9, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 268 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0268_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0268
        rs_R010_ueqv_R010YNN_generator_27_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_27_0268 := by
  native_decide

/-- Coefficient term 269 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0269 : Poly :=
[
  term ((-7154464669782030592 : Rat) / 89830441576176585) [(1, 1), (5, 2), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 269 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0269 : Poly :=
[
  term ((-14308929339564061184 : Rat) / 89830441576176585) [(1, 1), (5, 2), (9, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-14308929339564061184 : Rat) / 89830441576176585) [(1, 1), (5, 2), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((7154464669782030592 : Rat) / 89830441576176585) [(1, 1), (5, 2), (9, 2), (14, 2), (15, 1), (16, 1)],
  term ((7154464669782030592 : Rat) / 89830441576176585) [(1, 1), (5, 2), (9, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 269 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0269_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0269
        rs_R010_ueqv_R010YNN_generator_27_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_27_0269 := by
  native_decide

/-- Coefficient term 270 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0270 : Poly :=
[
  term ((136292076269537487872 : Rat) / 89830441576176585) [(1, 1), (5, 2), (9, 3), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 270 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0270 : Poly :=
[
  term ((272584152539074975744 : Rat) / 89830441576176585) [(1, 1), (5, 2), (9, 3), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-136292076269537487872 : Rat) / 89830441576176585) [(1, 1), (5, 2), (9, 3), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-136292076269537487872 : Rat) / 89830441576176585) [(1, 1), (5, 2), (9, 3), (13, 1), (15, 3), (16, 1)],
  term ((272584152539074975744 : Rat) / 89830441576176585) [(1, 1), (5, 2), (9, 3), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 270 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0270_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0270
        rs_R010_ueqv_R010YNN_generator_27_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_27_0270 := by
  native_decide

/-- Coefficient term 271 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0271 : Poly :=
[
  term ((-3794058785229976960 : Rat) / 53898264945705951) [(1, 1), (5, 2), (11, 1), (16, 1)]
]

/-- Partial product 271 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0271 : Poly :=
[
  term ((-7588117570459953920 : Rat) / 53898264945705951) [(1, 1), (5, 2), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-7588117570459953920 : Rat) / 53898264945705951) [(1, 1), (5, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((3794058785229976960 : Rat) / 53898264945705951) [(1, 1), (5, 2), (11, 1), (14, 2), (16, 1)],
  term ((3794058785229976960 : Rat) / 53898264945705951) [(1, 1), (5, 2), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 271 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0271_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0271
        rs_R010_ueqv_R010YNN_generator_27_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_27_0271 := by
  native_decide

/-- Coefficient term 272 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0272 : Poly :=
[
  term ((107588533212485598608 : Rat) / 1347456623642648775) [(1, 1), (5, 2), (13, 1), (16, 1)]
]

/-- Partial product 272 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0272 : Poly :=
[
  term ((215177066424971197216 : Rat) / 1347456623642648775) [(1, 1), (5, 2), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-107588533212485598608 : Rat) / 1347456623642648775) [(1, 1), (5, 2), (13, 1), (14, 2), (16, 1)],
  term ((-107588533212485598608 : Rat) / 1347456623642648775) [(1, 1), (5, 2), (13, 1), (15, 2), (16, 1)],
  term ((215177066424971197216 : Rat) / 1347456623642648775) [(1, 1), (5, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 272 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0272_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0272
        rs_R010_ueqv_R010YNN_generator_27_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_27_0272 := by
  native_decide

/-- Coefficient term 273 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0273 : Poly :=
[
  term ((207028203880710327242 : Rat) / 1347456623642648775) [(1, 1), (5, 2), (15, 1), (16, 1)]
]

/-- Partial product 273 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0273 : Poly :=
[
  term ((414056407761420654484 : Rat) / 1347456623642648775) [(1, 1), (5, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((414056407761420654484 : Rat) / 1347456623642648775) [(1, 1), (5, 2), (13, 1), (15, 2), (16, 1)],
  term ((-207028203880710327242 : Rat) / 1347456623642648775) [(1, 1), (5, 2), (14, 2), (15, 1), (16, 1)],
  term ((-207028203880710327242 : Rat) / 1347456623642648775) [(1, 1), (5, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 273 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0273_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0273
        rs_R010_ueqv_R010YNN_generator_27_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_27_0273 := by
  native_decide

/-- Coefficient term 274 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0274 : Poly :=
[
  term ((-2450659916236995584 : Rat) / 269491324728529755) [(1, 1), (5, 3), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 274 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0274 : Poly :=
[
  term ((-4901319832473991168 : Rat) / 269491324728529755) [(1, 1), (5, 3), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((2450659916236995584 : Rat) / 269491324728529755) [(1, 1), (5, 3), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((2450659916236995584 : Rat) / 269491324728529755) [(1, 1), (5, 3), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-4901319832473991168 : Rat) / 269491324728529755) [(1, 1), (5, 3), (9, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 274 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0274_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0274
        rs_R010_ueqv_R010YNN_generator_27_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_27_0274 := by
  native_decide

/-- Coefficient term 275 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0275 : Poly :=
[
  term ((-2505624211671313216 : Rat) / 269491324728529755) [(1, 1), (5, 3), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 275 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0275 : Poly :=
[
  term ((-5011248423342626432 : Rat) / 269491324728529755) [(1, 1), (5, 3), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5011248423342626432 : Rat) / 269491324728529755) [(1, 1), (5, 3), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((2505624211671313216 : Rat) / 269491324728529755) [(1, 1), (5, 3), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((2505624211671313216 : Rat) / 269491324728529755) [(1, 1), (5, 3), (9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 275 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0275_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0275
        rs_R010_ueqv_R010YNN_generator_27_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_27_0275 := by
  native_decide

/-- Coefficient term 276 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0276 : Poly :=
[
  term ((-4706269007836633600 : Rat) / 17966088315235317) [(1, 1), (5, 3), (9, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 276 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0276 : Poly :=
[
  term ((-9412538015673267200 : Rat) / 17966088315235317) [(1, 1), (5, 3), (9, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((4706269007836633600 : Rat) / 17966088315235317) [(1, 1), (5, 3), (9, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((4706269007836633600 : Rat) / 17966088315235317) [(1, 1), (5, 3), (9, 2), (13, 1), (15, 3), (16, 1)],
  term ((-9412538015673267200 : Rat) / 17966088315235317) [(1, 1), (5, 3), (9, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 276 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0276_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0276
        rs_R010_ueqv_R010YNN_generator_27_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_27_0276 := by
  native_decide

/-- Coefficient term 277 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0277 : Poly :=
[
  term (2 : Rat) [(1, 1), (13, 1), (16, 1)]
]

/-- Partial product 277 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0277 : Poly :=
[
  term (4 : Rat) [(1, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term (-2 : Rat) [(1, 1), (13, 1), (14, 2), (16, 1)],
  term (-2 : Rat) [(1, 1), (13, 1), (15, 2), (16, 1)],
  term (4 : Rat) [(1, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 277 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0277_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0277
        rs_R010_ueqv_R010YNN_generator_27_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_27_0277 := by
  native_decide

/-- Coefficient term 278 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0278 : Poly :=
[
  term ((3794058785229976960 : Rat) / 53898264945705951) [(1, 2), (3, 1), (5, 1), (16, 1)]
]

/-- Partial product 278 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0278 : Poly :=
[
  term ((7588117570459953920 : Rat) / 53898264945705951) [(1, 2), (3, 1), (5, 1), (12, 1), (14, 1), (16, 1)],
  term ((7588117570459953920 : Rat) / 53898264945705951) [(1, 2), (3, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3794058785229976960 : Rat) / 53898264945705951) [(1, 2), (3, 1), (5, 1), (14, 2), (16, 1)],
  term ((-3794058785229976960 : Rat) / 53898264945705951) [(1, 2), (3, 1), (5, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 278 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0278_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0278
        rs_R010_ueqv_R010YNN_generator_27_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_27_0278 := by
  native_decide

/-- Coefficient term 279 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0279 : Poly :=
[
  term ((-1897029392614988480 : Rat) / 53898264945705951) [(1, 2), (5, 1), (13, 1), (16, 1)]
]

/-- Partial product 279 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0279 : Poly :=
[
  term ((-3794058785229976960 : Rat) / 53898264945705951) [(1, 2), (5, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((1897029392614988480 : Rat) / 53898264945705951) [(1, 2), (5, 1), (13, 1), (14, 2), (16, 1)],
  term ((1897029392614988480 : Rat) / 53898264945705951) [(1, 2), (5, 1), (13, 1), (15, 2), (16, 1)],
  term ((-3794058785229976960 : Rat) / 53898264945705951) [(1, 2), (5, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 279 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0279_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0279
        rs_R010_ueqv_R010YNN_generator_27_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_27_0279 := by
  native_decide

/-- Coefficient term 280 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0280 : Poly :=
[
  term ((434664188152364720 : Rat) / 53898264945705951) [(1, 2), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 280 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0280 : Poly :=
[
  term ((869328376304729440 : Rat) / 53898264945705951) [(1, 2), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((869328376304729440 : Rat) / 53898264945705951) [(1, 2), (5, 1), (13, 1), (15, 2), (16, 1)],
  term ((-434664188152364720 : Rat) / 53898264945705951) [(1, 2), (5, 1), (14, 2), (15, 1), (16, 1)],
  term ((-434664188152364720 : Rat) / 53898264945705951) [(1, 2), (5, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 280 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0280_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0280
        rs_R010_ueqv_R010YNN_generator_27_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_27_0280 := by
  native_decide

/-- Coefficient term 281 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0281 : Poly :=
[
  term ((-1897029392614988480 : Rat) / 53898264945705951) [(1, 2), (5, 2), (16, 1)]
]

/-- Partial product 281 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0281 : Poly :=
[
  term ((-3794058785229976960 : Rat) / 53898264945705951) [(1, 2), (5, 2), (12, 1), (14, 1), (16, 1)],
  term ((-3794058785229976960 : Rat) / 53898264945705951) [(1, 2), (5, 2), (13, 1), (15, 1), (16, 1)],
  term ((1897029392614988480 : Rat) / 53898264945705951) [(1, 2), (5, 2), (14, 2), (16, 1)],
  term ((1897029392614988480 : Rat) / 53898264945705951) [(1, 2), (5, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 281 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0281_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0281
        rs_R010_ueqv_R010YNN_generator_27_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_27_0281 := by
  native_decide

/-- Coefficient term 282 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0282 : Poly :=
[
  term ((25387534520320000 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 1), (9, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 282 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0282 : Poly :=
[
  term ((50775069040640000 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 1), (9, 1), (11, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((50775069040640000 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 1), (9, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((-25387534520320000 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 1), (9, 1), (11, 2), (14, 2), (15, 1), (16, 1)],
  term ((-25387534520320000 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 1), (9, 1), (11, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 282 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0282_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0282
        rs_R010_ueqv_R010YNN_generator_27_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_27_0282 := by
  native_decide

/-- Coefficient term 283 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0283 : Poly :=
[
  term ((125384932858721492512 : Rat) / 269491324728529755) [(3, 1), (4, 1), (5, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 283 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0283 : Poly :=
[
  term ((250769865717442985024 : Rat) / 269491324728529755) [(3, 1), (4, 1), (5, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((250769865717442985024 : Rat) / 269491324728529755) [(3, 1), (4, 1), (5, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-125384932858721492512 : Rat) / 269491324728529755) [(3, 1), (4, 1), (5, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-125384932858721492512 : Rat) / 269491324728529755) [(3, 1), (4, 1), (5, 1), (9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 283 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0283_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0283
        rs_R010_ueqv_R010YNN_generator_27_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_27_0283 := by
  native_decide

/-- Coefficient term 284 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0284 : Poly :=
[
  term ((-1143047210942443520 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 1), (9, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 284 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0284 : Poly :=
[
  term ((-2286094421884887040 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 1), (9, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2286094421884887040 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 1), (9, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((1143047210942443520 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 1), (9, 2), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((1143047210942443520 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 1), (9, 2), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 284 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0284_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0284
        rs_R010_ueqv_R010YNN_generator_27_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_27_0284 := by
  native_decide

/-- Coefficient term 285 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0285 : Poly :=
[
  term ((2160186941291724800 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 1), (9, 3), (15, 1), (16, 1)]
]

/-- Partial product 285 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0285 : Poly :=
[
  term ((4320373882583449600 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 1), (9, 3), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((4320373882583449600 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 1), (9, 3), (13, 1), (15, 2), (16, 1)],
  term ((-2160186941291724800 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 1), (9, 3), (14, 2), (15, 1), (16, 1)],
  term ((-2160186941291724800 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 1), (9, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 285 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0285_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0285
        rs_R010_ueqv_R010YNN_generator_27_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_27_0285 := by
  native_decide

/-- Coefficient term 286 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0286 : Poly :=
[
  term ((25808665688080488016 : Rat) / 269491324728529755) [(3, 1), (4, 1), (5, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 286 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0286 : Poly :=
[
  term ((51617331376160976032 : Rat) / 269491324728529755) [(3, 1), (4, 1), (5, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((51617331376160976032 : Rat) / 269491324728529755) [(3, 1), (4, 1), (5, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-25808665688080488016 : Rat) / 269491324728529755) [(3, 1), (4, 1), (5, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-25808665688080488016 : Rat) / 269491324728529755) [(3, 1), (4, 1), (5, 1), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 286 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0286_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0286
        rs_R010_ueqv_R010YNN_generator_27_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_27_0286 := by
  native_decide

/-- Coefficient term 287 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0287 : Poly :=
[
  term (-4 : Rat) [(3, 1), (4, 1), (5, 1), (16, 1)]
]

/-- Partial product 287 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0287 : Poly :=
[
  term (-8 : Rat) [(3, 1), (4, 1), (5, 1), (12, 1), (14, 1), (16, 1)],
  term (-8 : Rat) [(3, 1), (4, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(3, 1), (4, 1), (5, 1), (14, 2), (16, 1)],
  term (4 : Rat) [(3, 1), (4, 1), (5, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 287 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0287_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0287
        rs_R010_ueqv_R010YNN_generator_27_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_27_0287 := by
  native_decide

/-- Coefficient term 288 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0288 : Poly :=
[
  term ((2944774794302674432 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 2), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 288 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0288 : Poly :=
[
  term ((5889549588605348864 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 2), (9, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((5889549588605348864 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 2), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2944774794302674432 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 2), (9, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-2944774794302674432 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 2), (9, 1), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 288 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0288_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0288
        rs_R010_ueqv_R010YNN_generator_27_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_27_0288 := by
  native_decide

/-- Coefficient term 289 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0289 : Poly :=
[
  term ((-25387534520320000 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 2), (9, 1), (11, 2), (16, 1)]
]

/-- Partial product 289 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0289 : Poly :=
[
  term ((-50775069040640000 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 2), (9, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((-50775069040640000 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 2), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((25387534520320000 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 2), (9, 1), (11, 2), (14, 2), (16, 1)],
  term ((25387534520320000 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 2), (9, 1), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 289 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0289_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0289
        rs_R010_ueqv_R010YNN_generator_27_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_27_0289 := by
  native_decide

/-- Coefficient term 290 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0290 : Poly :=
[
  term ((-125384932858721492512 : Rat) / 269491324728529755) [(3, 1), (4, 1), (5, 2), (9, 1), (16, 1)]
]

/-- Partial product 290 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0290 : Poly :=
[
  term ((-250769865717442985024 : Rat) / 269491324728529755) [(3, 1), (4, 1), (5, 2), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((-250769865717442985024 : Rat) / 269491324728529755) [(3, 1), (4, 1), (5, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((125384932858721492512 : Rat) / 269491324728529755) [(3, 1), (4, 1), (5, 2), (9, 1), (14, 2), (16, 1)],
  term ((125384932858721492512 : Rat) / 269491324728529755) [(3, 1), (4, 1), (5, 2), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 290 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0290_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0290
        rs_R010_ueqv_R010YNN_generator_27_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_27_0290 := by
  native_decide

/-- Coefficient term 291 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0291 : Poly :=
[
  term ((1143047210942443520 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 2), (9, 2), (11, 1), (16, 1)]
]

/-- Partial product 291 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0291 : Poly :=
[
  term ((2286094421884887040 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 2), (9, 2), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((2286094421884887040 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 2), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1143047210942443520 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 2), (9, 2), (11, 1), (14, 2), (16, 1)],
  term ((-1143047210942443520 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 2), (9, 2), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 291 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0291_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0291
        rs_R010_ueqv_R010YNN_generator_27_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_27_0291 := by
  native_decide

/-- Coefficient term 292 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0292 : Poly :=
[
  term ((3702981966416657408 : Rat) / 17966088315235317) [(3, 1), (4, 1), (5, 2), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 292 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0292 : Poly :=
[
  term ((7405963932833314816 : Rat) / 17966088315235317) [(3, 1), (4, 1), (5, 2), (9, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((7405963932833314816 : Rat) / 17966088315235317) [(3, 1), (4, 1), (5, 2), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((-3702981966416657408 : Rat) / 17966088315235317) [(3, 1), (4, 1), (5, 2), (9, 2), (14, 2), (15, 1), (16, 1)],
  term ((-3702981966416657408 : Rat) / 17966088315235317) [(3, 1), (4, 1), (5, 2), (9, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 292 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0292_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0292
        rs_R010_ueqv_R010YNN_generator_27_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_27_0292 := by
  native_decide

/-- Coefficient term 293 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0293 : Poly :=
[
  term ((-2160186941291724800 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 2), (9, 3), (16, 1)]
]

/-- Partial product 293 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0293 : Poly :=
[
  term ((-4320373882583449600 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 2), (9, 3), (12, 1), (14, 1), (16, 1)],
  term ((-4320373882583449600 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 2), (9, 3), (13, 1), (15, 1), (16, 1)],
  term ((2160186941291724800 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 2), (9, 3), (14, 2), (16, 1)],
  term ((2160186941291724800 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 2), (9, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 293 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0293_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0293
        rs_R010_ueqv_R010YNN_generator_27_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_27_0293 := by
  native_decide

/-- Coefficient term 294 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0294 : Poly :=
[
  term ((-25808665688080488016 : Rat) / 269491324728529755) [(3, 1), (4, 1), (5, 2), (11, 1), (16, 1)]
]

/-- Partial product 294 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0294 : Poly :=
[
  term ((-51617331376160976032 : Rat) / 269491324728529755) [(3, 1), (4, 1), (5, 2), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-51617331376160976032 : Rat) / 269491324728529755) [(3, 1), (4, 1), (5, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((25808665688080488016 : Rat) / 269491324728529755) [(3, 1), (4, 1), (5, 2), (11, 1), (14, 2), (16, 1)],
  term ((25808665688080488016 : Rat) / 269491324728529755) [(3, 1), (4, 1), (5, 2), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 294 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0294_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0294
        rs_R010_ueqv_R010YNN_generator_27_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_27_0294 := by
  native_decide

/-- Coefficient term 295 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0295 : Poly :=
[
  term ((-2944774794302674432 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 3), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 295 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0295 : Poly :=
[
  term ((-5889549588605348864 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 3), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-5889549588605348864 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 3), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((2944774794302674432 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 3), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((2944774794302674432 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 3), (9, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 295 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0295_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0295
        rs_R010_ueqv_R010YNN_generator_27_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_27_0295 := by
  native_decide

/-- Coefficient term 296 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0296 : Poly :=
[
  term ((-3702981966416657408 : Rat) / 17966088315235317) [(3, 1), (4, 1), (5, 3), (9, 2), (16, 1)]
]

/-- Partial product 296 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0296 : Poly :=
[
  term ((-7405963932833314816 : Rat) / 17966088315235317) [(3, 1), (4, 1), (5, 3), (9, 2), (12, 1), (14, 1), (16, 1)],
  term ((-7405963932833314816 : Rat) / 17966088315235317) [(3, 1), (4, 1), (5, 3), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((3702981966416657408 : Rat) / 17966088315235317) [(3, 1), (4, 1), (5, 3), (9, 2), (14, 2), (16, 1)],
  term ((3702981966416657408 : Rat) / 17966088315235317) [(3, 1), (4, 1), (5, 3), (9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 296 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0296_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0296
        rs_R010_ueqv_R010YNN_generator_27_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_27_0296 := by
  native_decide

/-- Coefficient term 297 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0297 : Poly :=
[
  term ((-631602007797340160 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 297 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0297 : Poly :=
[
  term ((-1263204015594680320 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1263204015594680320 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((631602007797340160 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 1), (11, 1), (14, 2), (15, 2), (16, 1)],
  term ((631602007797340160 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 1), (11, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 297 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0297_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0297
        rs_R010_ueqv_R010YNN_generator_27_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_27_0297 := by
  native_decide

/-- Coefficient term 298 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0298 : Poly :=
[
  term ((166603837426378240 : Rat) / 17966088315235317) [(3, 1), (5, 1), (6, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 298 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0298 : Poly :=
[
  term ((333207674852756480 : Rat) / 17966088315235317) [(3, 1), (5, 1), (6, 1), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((333207674852756480 : Rat) / 17966088315235317) [(3, 1), (5, 1), (6, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-166603837426378240 : Rat) / 17966088315235317) [(3, 1), (5, 1), (6, 1), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((-166603837426378240 : Rat) / 17966088315235317) [(3, 1), (5, 1), (6, 1), (9, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 298 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0298_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0298
        rs_R010_ueqv_R010YNN_generator_27_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_27_0298 := by
  native_decide

/-- Coefficient term 299 from coefficient polynomial 27. -/
def rs_R010_ueqv_R010YNN_coefficient_27_0299 : Poly :=
[
  term ((-139253367632691200 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 299 for generator 27. -/
def rs_R010_ueqv_R010YNN_partial_27_0299 : Poly :=
[
  term ((-278506735265382400 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 1), (11, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-278506735265382400 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((139253367632691200 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 1), (11, 2), (14, 2), (15, 1), (16, 1)],
  term ((139253367632691200 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 1), (11, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 299 for generator 27. -/
theorem rs_R010_ueqv_R010YNN_partial_27_0299_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_27_0299
        rs_R010_ueqv_R010YNN_generator_27_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_27_0299 := by
  native_decide

/-- Partial products in this block. -/
def rs_R010_ueqv_R010YNN_partials_27_0200_0299 : List Poly :=
[
  rs_R010_ueqv_R010YNN_partial_27_0200,
  rs_R010_ueqv_R010YNN_partial_27_0201,
  rs_R010_ueqv_R010YNN_partial_27_0202,
  rs_R010_ueqv_R010YNN_partial_27_0203,
  rs_R010_ueqv_R010YNN_partial_27_0204,
  rs_R010_ueqv_R010YNN_partial_27_0205,
  rs_R010_ueqv_R010YNN_partial_27_0206,
  rs_R010_ueqv_R010YNN_partial_27_0207,
  rs_R010_ueqv_R010YNN_partial_27_0208,
  rs_R010_ueqv_R010YNN_partial_27_0209,
  rs_R010_ueqv_R010YNN_partial_27_0210,
  rs_R010_ueqv_R010YNN_partial_27_0211,
  rs_R010_ueqv_R010YNN_partial_27_0212,
  rs_R010_ueqv_R010YNN_partial_27_0213,
  rs_R010_ueqv_R010YNN_partial_27_0214,
  rs_R010_ueqv_R010YNN_partial_27_0215,
  rs_R010_ueqv_R010YNN_partial_27_0216,
  rs_R010_ueqv_R010YNN_partial_27_0217,
  rs_R010_ueqv_R010YNN_partial_27_0218,
  rs_R010_ueqv_R010YNN_partial_27_0219,
  rs_R010_ueqv_R010YNN_partial_27_0220,
  rs_R010_ueqv_R010YNN_partial_27_0221,
  rs_R010_ueqv_R010YNN_partial_27_0222,
  rs_R010_ueqv_R010YNN_partial_27_0223,
  rs_R010_ueqv_R010YNN_partial_27_0224,
  rs_R010_ueqv_R010YNN_partial_27_0225,
  rs_R010_ueqv_R010YNN_partial_27_0226,
  rs_R010_ueqv_R010YNN_partial_27_0227,
  rs_R010_ueqv_R010YNN_partial_27_0228,
  rs_R010_ueqv_R010YNN_partial_27_0229,
  rs_R010_ueqv_R010YNN_partial_27_0230,
  rs_R010_ueqv_R010YNN_partial_27_0231,
  rs_R010_ueqv_R010YNN_partial_27_0232,
  rs_R010_ueqv_R010YNN_partial_27_0233,
  rs_R010_ueqv_R010YNN_partial_27_0234,
  rs_R010_ueqv_R010YNN_partial_27_0235,
  rs_R010_ueqv_R010YNN_partial_27_0236,
  rs_R010_ueqv_R010YNN_partial_27_0237,
  rs_R010_ueqv_R010YNN_partial_27_0238,
  rs_R010_ueqv_R010YNN_partial_27_0239,
  rs_R010_ueqv_R010YNN_partial_27_0240,
  rs_R010_ueqv_R010YNN_partial_27_0241,
  rs_R010_ueqv_R010YNN_partial_27_0242,
  rs_R010_ueqv_R010YNN_partial_27_0243,
  rs_R010_ueqv_R010YNN_partial_27_0244,
  rs_R010_ueqv_R010YNN_partial_27_0245,
  rs_R010_ueqv_R010YNN_partial_27_0246,
  rs_R010_ueqv_R010YNN_partial_27_0247,
  rs_R010_ueqv_R010YNN_partial_27_0248,
  rs_R010_ueqv_R010YNN_partial_27_0249,
  rs_R010_ueqv_R010YNN_partial_27_0250,
  rs_R010_ueqv_R010YNN_partial_27_0251,
  rs_R010_ueqv_R010YNN_partial_27_0252,
  rs_R010_ueqv_R010YNN_partial_27_0253,
  rs_R010_ueqv_R010YNN_partial_27_0254,
  rs_R010_ueqv_R010YNN_partial_27_0255,
  rs_R010_ueqv_R010YNN_partial_27_0256,
  rs_R010_ueqv_R010YNN_partial_27_0257,
  rs_R010_ueqv_R010YNN_partial_27_0258,
  rs_R010_ueqv_R010YNN_partial_27_0259,
  rs_R010_ueqv_R010YNN_partial_27_0260,
  rs_R010_ueqv_R010YNN_partial_27_0261,
  rs_R010_ueqv_R010YNN_partial_27_0262,
  rs_R010_ueqv_R010YNN_partial_27_0263,
  rs_R010_ueqv_R010YNN_partial_27_0264,
  rs_R010_ueqv_R010YNN_partial_27_0265,
  rs_R010_ueqv_R010YNN_partial_27_0266,
  rs_R010_ueqv_R010YNN_partial_27_0267,
  rs_R010_ueqv_R010YNN_partial_27_0268,
  rs_R010_ueqv_R010YNN_partial_27_0269,
  rs_R010_ueqv_R010YNN_partial_27_0270,
  rs_R010_ueqv_R010YNN_partial_27_0271,
  rs_R010_ueqv_R010YNN_partial_27_0272,
  rs_R010_ueqv_R010YNN_partial_27_0273,
  rs_R010_ueqv_R010YNN_partial_27_0274,
  rs_R010_ueqv_R010YNN_partial_27_0275,
  rs_R010_ueqv_R010YNN_partial_27_0276,
  rs_R010_ueqv_R010YNN_partial_27_0277,
  rs_R010_ueqv_R010YNN_partial_27_0278,
  rs_R010_ueqv_R010YNN_partial_27_0279,
  rs_R010_ueqv_R010YNN_partial_27_0280,
  rs_R010_ueqv_R010YNN_partial_27_0281,
  rs_R010_ueqv_R010YNN_partial_27_0282,
  rs_R010_ueqv_R010YNN_partial_27_0283,
  rs_R010_ueqv_R010YNN_partial_27_0284,
  rs_R010_ueqv_R010YNN_partial_27_0285,
  rs_R010_ueqv_R010YNN_partial_27_0286,
  rs_R010_ueqv_R010YNN_partial_27_0287,
  rs_R010_ueqv_R010YNN_partial_27_0288,
  rs_R010_ueqv_R010YNN_partial_27_0289,
  rs_R010_ueqv_R010YNN_partial_27_0290,
  rs_R010_ueqv_R010YNN_partial_27_0291,
  rs_R010_ueqv_R010YNN_partial_27_0292,
  rs_R010_ueqv_R010YNN_partial_27_0293,
  rs_R010_ueqv_R010YNN_partial_27_0294,
  rs_R010_ueqv_R010YNN_partial_27_0295,
  rs_R010_ueqv_R010YNN_partial_27_0296,
  rs_R010_ueqv_R010YNN_partial_27_0297,
  rs_R010_ueqv_R010YNN_partial_27_0298,
  rs_R010_ueqv_R010YNN_partial_27_0299
]

/-- Sum of partial products in this block. -/
def rs_R010_ueqv_R010YNN_block_27_0200_0299 : Poly :=
[
  term ((-1897029392614988480 : Rat) / 53898264945705951) [(1, 1), (4, 1), (5, 1), (12, 1), (14, 1), (16, 1)],
  term ((3794058785229976960 : Rat) / 53898264945705951) [(1, 1), (4, 1), (5, 1), (12, 1), (14, 2), (16, 1)],
  term ((3794058785229976960 : Rat) / 53898264945705951) [(1, 1), (4, 1), (5, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1897029392614988480 : Rat) / 53898264945705951) [(1, 1), (4, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1897029392614988480 : Rat) / 53898264945705951) [(1, 1), (4, 1), (5, 1), (14, 1), (15, 2), (16, 1)],
  term ((948514696307494240 : Rat) / 53898264945705951) [(1, 1), (4, 1), (5, 1), (14, 2), (16, 1)],
  term ((-1897029392614988480 : Rat) / 53898264945705951) [(1, 1), (4, 1), (5, 1), (14, 3), (16, 1)],
  term ((948514696307494240 : Rat) / 53898264945705951) [(1, 1), (4, 1), (5, 1), (15, 2), (16, 1)],
  term (-4 : Rat) [(1, 1), (4, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term (2 : Rat) [(1, 1), (4, 1), (13, 1), (14, 2), (16, 1)],
  term (2 : Rat) [(1, 1), (4, 1), (13, 1), (15, 2), (16, 1)],
  term (-4 : Rat) [(1, 1), (4, 1), (13, 2), (15, 1), (16, 1)],
  term ((-850488776525382208 : Rat) / 53898264945705951) [(1, 1), (5, 1), (6, 1), (8, 1), (12, 1), (14, 1), (16, 1)],
  term ((-850488776525382208 : Rat) / 53898264945705951) [(1, 1), (5, 1), (6, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((425244388262691104 : Rat) / 53898264945705951) [(1, 1), (5, 1), (6, 1), (8, 1), (14, 2), (16, 1)],
  term ((425244388262691104 : Rat) / 53898264945705951) [(1, 1), (5, 1), (6, 1), (8, 1), (15, 2), (16, 1)],
  term ((539685528431856080 : Rat) / 5988696105078439) [(1, 1), (5, 1), (6, 1), (12, 1), (14, 1), (16, 1)],
  term ((-4006680979361322512 : Rat) / 53898264945705951) [(1, 1), (5, 1), (6, 1), (12, 1), (14, 2), (16, 1)],
  term ((-4006680979361322512 : Rat) / 53898264945705951) [(1, 1), (5, 1), (6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((539685528431856080 : Rat) / 5988696105078439) [(1, 1), (5, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((2003340489680661256 : Rat) / 53898264945705951) [(1, 1), (5, 1), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((-269842764215928040 : Rat) / 5988696105078439) [(1, 1), (5, 1), (6, 1), (14, 2), (16, 1)],
  term ((2003340489680661256 : Rat) / 53898264945705951) [(1, 1), (5, 1), (6, 1), (14, 3), (16, 1)],
  term ((-269842764215928040 : Rat) / 5988696105078439) [(1, 1), (5, 1), (6, 1), (15, 2), (16, 1)],
  term ((1700977553050764416 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (8, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-850488776525382208 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (8, 1), (13, 1), (14, 2), (16, 1)],
  term ((-850488776525382208 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((1700977553050764416 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (8, 1), (13, 2), (15, 1), (16, 1)],
  term ((-377625914378053734832 : Rat) / 449152207880882925) [(1, 1), (5, 1), (7, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((188812957189026867416 : Rat) / 449152207880882925) [(1, 1), (5, 1), (7, 1), (9, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((188812957189026867416 : Rat) / 449152207880882925) [(1, 1), (5, 1), (7, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((-377625914378053734832 : Rat) / 449152207880882925) [(1, 1), (5, 1), (7, 1), (9, 1), (13, 2), (15, 2), (16, 1)],
  term ((-65618476060569600 : Rat) / 5988696105078439) [(1, 1), (5, 1), (7, 1), (9, 2), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((32809238030284800 : Rat) / 5988696105078439) [(1, 1), (5, 1), (7, 1), (9, 2), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((32809238030284800 : Rat) / 5988696105078439) [(1, 1), (5, 1), (7, 1), (9, 2), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-65618476060569600 : Rat) / 5988696105078439) [(1, 1), (5, 1), (7, 1), (9, 2), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((3158010038986700800 : Rat) / 17966088315235317) [(1, 1), (5, 1), (7, 1), (9, 2), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1579005019493350400 : Rat) / 17966088315235317) [(1, 1), (5, 1), (7, 1), (9, 2), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-1579005019493350400 : Rat) / 17966088315235317) [(1, 1), (5, 1), (7, 1), (9, 2), (13, 1), (15, 4), (16, 1)],
  term ((3158010038986700800 : Rat) / 17966088315235317) [(1, 1), (5, 1), (7, 1), (9, 2), (13, 2), (15, 3), (16, 1)],
  term ((-2101482817422786560 : Rat) / 17966088315235317) [(1, 1), (5, 1), (7, 1), (9, 3), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1050741408711393280 : Rat) / 17966088315235317) [(1, 1), (5, 1), (7, 1), (9, 3), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((1050741408711393280 : Rat) / 17966088315235317) [(1, 1), (5, 1), (7, 1), (9, 3), (13, 1), (15, 3), (16, 1)],
  term ((-2101482817422786560 : Rat) / 17966088315235317) [(1, 1), (5, 1), (7, 1), (9, 3), (13, 2), (15, 2), (16, 1)],
  term ((-850488776525382208 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2486896890576498884 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((425244388262691104 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (13, 1), (14, 2), (16, 1)],
  term ((-687217500771269260 : Rat) / 17966088315235317) [(1, 1), (5, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-850488776525382208 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((1243448445288249442 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((1243448445288249442 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (15, 3), (16, 1)],
  term ((15662397607167180800 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7831198803583590400 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (9, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-7831198803583590400 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (9, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((15662397607167180800 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (9, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((1736905521442685440 : Rat) / 17966088315235317) [(1, 1), (5, 1), (8, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((126015906195558400 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-868452760721342720 : Rat) / 17966088315235317) [(1, 1), (5, 1), (8, 1), (9, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-63007953097779200 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((-63007953097779200 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-868452760721342720 : Rat) / 17966088315235317) [(1, 1), (5, 1), (8, 1), (9, 1), (13, 1), (15, 4), (16, 1)],
  term ((126015906195558400 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((1736905521442685440 : Rat) / 17966088315235317) [(1, 1), (5, 1), (8, 1), (9, 1), (13, 2), (15, 3), (16, 1)],
  term ((3479595011578613760 : Rat) / 5988696105078439) [(1, 1), (5, 1), (8, 1), (9, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1739797505789306880 : Rat) / 5988696105078439) [(1, 1), (5, 1), (8, 1), (9, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1739797505789306880 : Rat) / 5988696105078439) [(1, 1), (5, 1), (8, 1), (9, 2), (13, 1), (15, 3), (16, 1)],
  term ((3479595011578613760 : Rat) / 5988696105078439) [(1, 1), (5, 1), (8, 1), (9, 2), (13, 2), (15, 2), (16, 1)],
  term ((253737326913280000 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-126868663456640000 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-126868663456640000 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((253737326913280000 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((1816669710257900273696 : Rat) / 269491324728529755) [(1, 1), (5, 1), (8, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((440996376537135904 : Rat) / 17966088315235317) [(1, 1), (5, 1), (8, 1), (12, 1), (14, 1), (16, 1)],
  term ((-31503976548889600 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (12, 1), (14, 2), (16, 1)],
  term ((-31503976548889600 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-908334855128950136848 : Rat) / 269491324728529755) [(1, 1), (5, 1), (8, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((440996376537135904 : Rat) / 17966088315235317) [(1, 1), (5, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-908334855128950136848 : Rat) / 269491324728529755) [(1, 1), (5, 1), (8, 1), (13, 1), (15, 3), (16, 1)],
  term ((1816669710257900273696 : Rat) / 269491324728529755) [(1, 1), (5, 1), (8, 1), (13, 2), (15, 2), (16, 1)],
  term ((15751988274444800 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((-220498188268567952 : Rat) / 17966088315235317) [(1, 1), (5, 1), (8, 1), (14, 2), (16, 1)],
  term ((15751988274444800 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (14, 3), (16, 1)],
  term ((-220498188268567952 : Rat) / 17966088315235317) [(1, 1), (5, 1), (8, 1), (15, 2), (16, 1)],
  term ((-12707509183341056000 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6448371121561600 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((45711696775628800 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-371209039572044800 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((-371209039572044800 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((6353754591670528000 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((45711696775628800 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((6334409478305843200 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-12707509183341056000 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((185604519786022400 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((3224185560780800 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 1), (11, 1), (14, 2), (15, 2), (16, 1)],
  term ((-22855848387814400 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((185604519786022400 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (11, 1), (14, 3), (16, 1)],
  term ((-22855848387814400 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((3224185560780800 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 1), (11, 1), (15, 4), (16, 1)],
  term ((1612092780390400 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (11, 2), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((3224185560780800 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 1), (11, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-806046390195200 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (11, 2), (13, 1), (14, 2), (16, 1)],
  term ((8866510292147200 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((1612092780390400 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (11, 2), (13, 2), (15, 1), (16, 1)],
  term ((-1612092780390400 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 1), (11, 2), (14, 2), (15, 1), (16, 1)],
  term ((-1612092780390400 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 1), (11, 2), (15, 3), (16, 1)],
  term ((-4579114556530716160 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((2887294661323520 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1041925557206717428528 : Rat) / 4042369870927946325) [(1, 1), (5, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-138162939205668160 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-138162939205668160 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((2289557278265358080 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-1443647330661760 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((-1042033830756517060528 : Rat) / 4042369870927946325) [(1, 1), (5, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((2289557278265358080 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (13, 1), (15, 4), (16, 1)],
  term ((2887294661323520 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-4579114556530716160 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (13, 2), (15, 3), (16, 1)],
  term ((69081469602834080 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (14, 1), (15, 3), (16, 1)],
  term ((520962778603358714264 : Rat) / 4042369870927946325) [(1, 1), (5, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((69081469602834080 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (14, 3), (15, 1), (16, 1)],
  term ((520962778603358714264 : Rat) / 4042369870927946325) [(1, 1), (5, 1), (9, 1), (15, 3), (16, 1)],
  term ((1187513281884160 : Rat) / 5988696105078439) [(1, 1), (5, 1), (9, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((371903841262858240 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-593756640942080 : Rat) / 5988696105078439) [(1, 1), (5, 1), (9, 2), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((366560031494379520 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((1187513281884160 : Rat) / 5988696105078439) [(1, 1), (5, 1), (9, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-185951920631429120 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 2), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-185951920631429120 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 2), (11, 1), (15, 3), (16, 1)],
  term ((-2450179139316282043328 : Rat) / 449152207880882925) [(1, 1), (5, 1), (9, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-14250159382609920 : Rat) / 5988696105078439) [(1, 1), (5, 1), (9, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-15385702415793920 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 2), (12, 1), (14, 1), (16, 1)],
  term ((-57931834207439360 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 2), (12, 1), (14, 2), (16, 1)],
  term ((-57931834207439360 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1225089569658141021664 : Rat) / 449152207880882925) [(1, 1), (5, 1), (9, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-15385702415793920 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((1224020807704445277664 : Rat) / 449152207880882925) [(1, 1), (5, 1), (9, 2), (13, 1), (15, 3), (16, 1)],
  term ((-2450179139316282043328 : Rat) / 449152207880882925) [(1, 1), (5, 1), (9, 2), (13, 2), (15, 2), (16, 1)],
  term ((28965917103719680 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 2), (14, 1), (15, 2), (16, 1)],
  term ((7125079691304960 : Rat) / 5988696105078439) [(1, 1), (5, 1), (9, 2), (14, 2), (15, 2), (16, 1)],
  term ((7692851207896960 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 2), (14, 2), (16, 1)],
  term ((28965917103719680 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 2), (14, 3), (16, 1)],
  term ((7692851207896960 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 2), (15, 2), (16, 1)],
  term ((7125079691304960 : Rat) / 5988696105078439) [(1, 1), (5, 1), (9, 2), (15, 4), (16, 1)],
  term ((254207685414502400 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 3), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-127103842707251200 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 3), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-127103842707251200 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 3), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((254207685414502400 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 3), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-1016828298440622080 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 3), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1016828298440622080 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 3), (13, 1), (15, 2), (16, 1)],
  term ((508414149220311040 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 3), (14, 2), (15, 1), (16, 1)],
  term ((508414149220311040 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 3), (15, 3), (16, 1)],
  term ((-2871455259507752960 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 4), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1435727629753876480 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 4), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((1435727629753876480 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 4), (13, 1), (15, 3), (16, 1)],
  term ((-2871455259507752960 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 4), (13, 2), (15, 2), (16, 1)],
  term ((195893711407505972 : Rat) / 17966088315235317) [(1, 1), (5, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-391787422815011944 : Rat) / 53898264945705951) [(1, 1), (5, 1), (10, 1), (12, 1), (14, 2), (16, 1)],
  term ((-391787422815011944 : Rat) / 53898264945705951) [(1, 1), (5, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((195893711407505972 : Rat) / 17966088315235317) [(1, 1), (5, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((195893711407505972 : Rat) / 53898264945705951) [(1, 1), (5, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-97946855703752986 : Rat) / 17966088315235317) [(1, 1), (5, 1), (10, 1), (14, 2), (16, 1)],
  term ((195893711407505972 : Rat) / 53898264945705951) [(1, 1), (5, 1), (10, 1), (14, 3), (16, 1)],
  term ((-97946855703752986 : Rat) / 17966088315235317) [(1, 1), (5, 1), (10, 1), (15, 2), (16, 1)],
  term ((-183260484130124934392 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-92135337057135058384 : Rat) / 449152207880882925) [(1, 1), (5, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((91630242065062467196 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-184775769106342707956 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-183260484130124934392 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((46067668528567529192 : Rat) / 449152207880882925) [(1, 1), (5, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((46067668528567529192 : Rat) / 449152207880882925) [(1, 1), (5, 1), (11, 1), (15, 3), (16, 1)],
  term ((3794058785229976960 : Rat) / 53898264945705951) [(1, 1), (5, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((3794058785229976960 : Rat) / 53898264945705951) [(1, 1), (5, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1897029392614988480 : Rat) / 53898264945705951) [(1, 1), (5, 1), (11, 2), (14, 2), (16, 1)],
  term ((-1897029392614988480 : Rat) / 53898264945705951) [(1, 1), (5, 1), (11, 2), (15, 2), (16, 1)],
  term ((-3279549007067311009288 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((76430955438764350304 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((133032009543595945033 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (12, 1), (14, 1), (16, 1)],
  term ((-51773562776986731934 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (12, 1), (14, 2), (16, 1)],
  term ((-51773562776986731934 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1639774503533655504644 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((133032009543595945033 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((1716205458972419854948 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (13, 1), (15, 3), (16, 1)],
  term ((-3279549007067311009288 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (13, 2), (15, 2), (16, 1)],
  term ((25886781388493365967 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (14, 1), (15, 2), (16, 1)],
  term ((-38215477719382175152 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (14, 2), (15, 2), (16, 1)],
  term ((-133032009543595945033 : Rat) / 2694913247285297550) [(1, 1), (5, 1), (14, 2), (16, 1)],
  term ((25886781388493365967 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (14, 3), (16, 1)],
  term ((-133032009543595945033 : Rat) / 2694913247285297550) [(1, 1), (5, 1), (15, 2), (16, 1)],
  term ((-38215477719382175152 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (15, 4), (16, 1)],
  term ((-148491200542136320 : Rat) / 5988696105078439) [(1, 1), (5, 2), (6, 1), (8, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((-148491200542136320 : Rat) / 5988696105078439) [(1, 1), (5, 2), (6, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((74245600271068160 : Rat) / 5988696105078439) [(1, 1), (5, 2), (6, 1), (8, 1), (9, 1), (14, 2), (16, 1)],
  term ((74245600271068160 : Rat) / 5988696105078439) [(1, 1), (5, 2), (6, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((185614000677670400 : Rat) / 5988696105078439) [(1, 1), (5, 2), (6, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((-37122800135534080 : Rat) / 5988696105078439) [(1, 1), (5, 2), (6, 1), (9, 1), (12, 1), (14, 2), (16, 1)],
  term ((-37122800135534080 : Rat) / 5988696105078439) [(1, 1), (5, 2), (6, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((185614000677670400 : Rat) / 5988696105078439) [(1, 1), (5, 2), (6, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((18561400067767040 : Rat) / 5988696105078439) [(1, 1), (5, 2), (6, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-92807000338835200 : Rat) / 5988696105078439) [(1, 1), (5, 2), (6, 1), (9, 1), (14, 2), (16, 1)],
  term ((18561400067767040 : Rat) / 5988696105078439) [(1, 1), (5, 2), (6, 1), (9, 1), (14, 3), (16, 1)],
  term ((-92807000338835200 : Rat) / 5988696105078439) [(1, 1), (5, 2), (6, 1), (9, 1), (15, 2), (16, 1)],
  term ((296982401084272640 : Rat) / 5988696105078439) [(1, 1), (5, 2), (7, 1), (8, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-148491200542136320 : Rat) / 5988696105078439) [(1, 1), (5, 2), (7, 1), (8, 1), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((-148491200542136320 : Rat) / 5988696105078439) [(1, 1), (5, 2), (7, 1), (8, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((296982401084272640 : Rat) / 5988696105078439) [(1, 1), (5, 2), (7, 1), (8, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-148491200542136320 : Rat) / 5988696105078439) [(1, 1), (5, 2), (7, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-176333300643786880 : Rat) / 17966088315235317) [(1, 1), (5, 2), (7, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((74245600271068160 : Rat) / 5988696105078439) [(1, 1), (5, 2), (7, 1), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((46403500169417600 : Rat) / 17966088315235317) [(1, 1), (5, 2), (7, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-148491200542136320 : Rat) / 5988696105078439) [(1, 1), (5, 2), (7, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((88166650321893440 : Rat) / 17966088315235317) [(1, 1), (5, 2), (7, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((88166650321893440 : Rat) / 17966088315235317) [(1, 1), (5, 2), (7, 1), (9, 1), (15, 3), (16, 1)],
  term ((20806045790354688512 : Rat) / 29943480525392195) [(1, 1), (5, 2), (7, 1), (9, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-10403022895177344256 : Rat) / 29943480525392195) [(1, 1), (5, 2), (7, 1), (9, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-10403022895177344256 : Rat) / 29943480525392195) [(1, 1), (5, 2), (7, 1), (9, 2), (13, 1), (15, 3), (16, 1)],
  term ((20806045790354688512 : Rat) / 29943480525392195) [(1, 1), (5, 2), (7, 1), (9, 2), (13, 2), (15, 2), (16, 1)],
  term ((226631849902565358592 : Rat) / 53898264945705951) [(1, 1), (5, 2), (8, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((222736800813204480 : Rat) / 5988696105078439) [(1, 1), (5, 2), (8, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((-113315924951282679296 : Rat) / 53898264945705951) [(1, 1), (5, 2), (8, 1), (9, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((222736800813204480 : Rat) / 5988696105078439) [(1, 1), (5, 2), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-113315924951282679296 : Rat) / 53898264945705951) [(1, 1), (5, 2), (8, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((226631849902565358592 : Rat) / 53898264945705951) [(1, 1), (5, 2), (8, 1), (9, 1), (13, 2), (15, 2), (16, 1)],
  term ((-111368400406602240 : Rat) / 5988696105078439) [(1, 1), (5, 2), (8, 1), (9, 1), (14, 2), (16, 1)],
  term ((-111368400406602240 : Rat) / 5988696105078439) [(1, 1), (5, 2), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((-4110804065241036160 : Rat) / 53898264945705951) [(1, 1), (5, 2), (8, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((2055402032620518080 : Rat) / 53898264945705951) [(1, 1), (5, 2), (8, 1), (13, 1), (14, 2), (16, 1)],
  term ((2055402032620518080 : Rat) / 53898264945705951) [(1, 1), (5, 2), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((-4110804065241036160 : Rat) / 53898264945705951) [(1, 1), (5, 2), (8, 1), (13, 2), (15, 1), (16, 1)],
  term ((-27842100101650560 : Rat) / 5988696105078439) [(1, 1), (5, 2), (9, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((18561400067767040 : Rat) / 5988696105078439) [(1, 1), (5, 2), (9, 1), (10, 1), (12, 1), (14, 2), (16, 1)],
  term ((18561400067767040 : Rat) / 5988696105078439) [(1, 1), (5, 2), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-27842100101650560 : Rat) / 5988696105078439) [(1, 1), (5, 2), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-9280700033883520 : Rat) / 5988696105078439) [(1, 1), (5, 2), (9, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((13921050050825280 : Rat) / 5988696105078439) [(1, 1), (5, 2), (9, 1), (10, 1), (14, 2), (16, 1)],
  term ((-9280700033883520 : Rat) / 5988696105078439) [(1, 1), (5, 2), (9, 1), (10, 1), (14, 3), (16, 1)],
  term ((13921050050825280 : Rat) / 5988696105078439) [(1, 1), (5, 2), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((1741776026814492416 : Rat) / 269491324728529755) [(1, 1), (5, 2), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-7714969840467456 : Rat) / 29943480525392195) [(1, 1), (5, 2), (9, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-870888013407246208 : Rat) / 269491324728529755) [(1, 1), (5, 2), (9, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-940322741971453312 : Rat) / 269491324728529755) [(1, 1), (5, 2), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((1741776026814492416 : Rat) / 269491324728529755) [(1, 1), (5, 2), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((3857484920233728 : Rat) / 29943480525392195) [(1, 1), (5, 2), (9, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((3857484920233728 : Rat) / 29943480525392195) [(1, 1), (5, 2), (9, 1), (11, 1), (15, 3), (16, 1)],
  term ((-426116601758338108576 : Rat) / 269491324728529755) [(1, 1), (5, 2), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-220516371646219264 : Rat) / 89830441576176585) [(1, 1), (5, 2), (9, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((26059628903974594016 : Rat) / 269491324728529755) [(1, 1), (5, 2), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((-44118132122849499968 : Rat) / 269491324728529755) [(1, 1), (5, 2), (9, 1), (12, 1), (14, 2), (16, 1)],
  term ((-44118132122849499968 : Rat) / 269491324728529755) [(1, 1), (5, 2), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((213058300879169054288 : Rat) / 269491324728529755) [(1, 1), (5, 2), (9, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((26059628903974594016 : Rat) / 269491324728529755) [(1, 1), (5, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((212396751764230396496 : Rat) / 269491324728529755) [(1, 1), (5, 2), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((-426116601758338108576 : Rat) / 269491324728529755) [(1, 1), (5, 2), (9, 1), (13, 2), (15, 2), (16, 1)],
  term ((22059066061424749984 : Rat) / 269491324728529755) [(1, 1), (5, 2), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((110258185823109632 : Rat) / 89830441576176585) [(1, 1), (5, 2), (9, 1), (14, 2), (15, 2), (16, 1)],
  term ((-13029814451987297008 : Rat) / 269491324728529755) [(1, 1), (5, 2), (9, 1), (14, 2), (16, 1)],
  term ((22059066061424749984 : Rat) / 269491324728529755) [(1, 1), (5, 2), (9, 1), (14, 3), (16, 1)],
  term ((-13029814451987297008 : Rat) / 269491324728529755) [(1, 1), (5, 2), (9, 1), (15, 2), (16, 1)],
  term ((110258185823109632 : Rat) / 89830441576176585) [(1, 1), (5, 2), (9, 1), (15, 4), (16, 1)],
  term ((475721833237504000 : Rat) / 17966088315235317) [(1, 1), (5, 2), (9, 2), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-237860916618752000 : Rat) / 17966088315235317) [(1, 1), (5, 2), (9, 2), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-237860916618752000 : Rat) / 17966088315235317) [(1, 1), (5, 2), (9, 2), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((475721833237504000 : Rat) / 17966088315235317) [(1, 1), (5, 2), (9, 2), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((2375026563768320 : Rat) / 5988696105078439) [(1, 1), (5, 2), (9, 2), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-14308929339564061184 : Rat) / 89830441576176585) [(1, 1), (5, 2), (9, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1187513281884160 : Rat) / 5988696105078439) [(1, 1), (5, 2), (9, 2), (13, 1), (14, 2), (16, 1)],
  term ((-14326742038792323584 : Rat) / 89830441576176585) [(1, 1), (5, 2), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((2375026563768320 : Rat) / 5988696105078439) [(1, 1), (5, 2), (9, 2), (13, 2), (15, 1), (16, 1)],
  term ((7154464669782030592 : Rat) / 89830441576176585) [(1, 1), (5, 2), (9, 2), (14, 2), (15, 1), (16, 1)],
  term ((7154464669782030592 : Rat) / 89830441576176585) [(1, 1), (5, 2), (9, 2), (15, 3), (16, 1)],
  term ((272584152539074975744 : Rat) / 89830441576176585) [(1, 1), (5, 2), (9, 3), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-136292076269537487872 : Rat) / 89830441576176585) [(1, 1), (5, 2), (9, 3), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-136292076269537487872 : Rat) / 89830441576176585) [(1, 1), (5, 2), (9, 3), (13, 1), (15, 3), (16, 1)],
  term ((272584152539074975744 : Rat) / 89830441576176585) [(1, 1), (5, 2), (9, 3), (13, 2), (15, 2), (16, 1)],
  term ((-7588117570459953920 : Rat) / 53898264945705951) [(1, 1), (5, 2), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-7588117570459953920 : Rat) / 53898264945705951) [(1, 1), (5, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((3794058785229976960 : Rat) / 53898264945705951) [(1, 1), (5, 2), (11, 1), (14, 2), (16, 1)],
  term ((3794058785229976960 : Rat) / 53898264945705951) [(1, 1), (5, 2), (11, 1), (15, 2), (16, 1)],
  term ((215177066424971197216 : Rat) / 1347456623642648775) [(1, 1), (5, 2), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((414056407761420654484 : Rat) / 1347456623642648775) [(1, 1), (5, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-107588533212485598608 : Rat) / 1347456623642648775) [(1, 1), (5, 2), (13, 1), (14, 2), (16, 1)],
  term ((306467874548935055876 : Rat) / 1347456623642648775) [(1, 1), (5, 2), (13, 1), (15, 2), (16, 1)],
  term ((215177066424971197216 : Rat) / 1347456623642648775) [(1, 1), (5, 2), (13, 2), (15, 1), (16, 1)],
  term ((-207028203880710327242 : Rat) / 1347456623642648775) [(1, 1), (5, 2), (14, 2), (15, 1), (16, 1)],
  term ((-207028203880710327242 : Rat) / 1347456623642648775) [(1, 1), (5, 2), (15, 3), (16, 1)],
  term ((-4901319832473991168 : Rat) / 269491324728529755) [(1, 1), (5, 3), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-5011248423342626432 : Rat) / 269491324728529755) [(1, 1), (5, 3), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((2450659916236995584 : Rat) / 269491324728529755) [(1, 1), (5, 3), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((-284509834122847872 : Rat) / 29943480525392195) [(1, 1), (5, 3), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-4901319832473991168 : Rat) / 269491324728529755) [(1, 1), (5, 3), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((2505624211671313216 : Rat) / 269491324728529755) [(1, 1), (5, 3), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((2505624211671313216 : Rat) / 269491324728529755) [(1, 1), (5, 3), (9, 1), (15, 3), (16, 1)],
  term ((-9412538015673267200 : Rat) / 17966088315235317) [(1, 1), (5, 3), (9, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((4706269007836633600 : Rat) / 17966088315235317) [(1, 1), (5, 3), (9, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((4706269007836633600 : Rat) / 17966088315235317) [(1, 1), (5, 3), (9, 2), (13, 1), (15, 3), (16, 1)],
  term ((-9412538015673267200 : Rat) / 17966088315235317) [(1, 1), (5, 3), (9, 2), (13, 2), (15, 2), (16, 1)],
  term (4 : Rat) [(1, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term (-2 : Rat) [(1, 1), (13, 1), (14, 2), (16, 1)],
  term (-2 : Rat) [(1, 1), (13, 1), (15, 2), (16, 1)],
  term (4 : Rat) [(1, 1), (13, 2), (15, 1), (16, 1)],
  term ((7588117570459953920 : Rat) / 53898264945705951) [(1, 2), (3, 1), (5, 1), (12, 1), (14, 1), (16, 1)],
  term ((7588117570459953920 : Rat) / 53898264945705951) [(1, 2), (3, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3794058785229976960 : Rat) / 53898264945705951) [(1, 2), (3, 1), (5, 1), (14, 2), (16, 1)],
  term ((-3794058785229976960 : Rat) / 53898264945705951) [(1, 2), (3, 1), (5, 1), (15, 2), (16, 1)],
  term ((-3794058785229976960 : Rat) / 53898264945705951) [(1, 2), (5, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((869328376304729440 : Rat) / 53898264945705951) [(1, 2), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1897029392614988480 : Rat) / 53898264945705951) [(1, 2), (5, 1), (13, 1), (14, 2), (16, 1)],
  term ((922119256306572640 : Rat) / 17966088315235317) [(1, 2), (5, 1), (13, 1), (15, 2), (16, 1)],
  term ((-3794058785229976960 : Rat) / 53898264945705951) [(1, 2), (5, 1), (13, 2), (15, 1), (16, 1)],
  term ((-434664188152364720 : Rat) / 53898264945705951) [(1, 2), (5, 1), (14, 2), (15, 1), (16, 1)],
  term ((-434664188152364720 : Rat) / 53898264945705951) [(1, 2), (5, 1), (15, 3), (16, 1)],
  term ((-3794058785229976960 : Rat) / 53898264945705951) [(1, 2), (5, 2), (12, 1), (14, 1), (16, 1)],
  term ((-3794058785229976960 : Rat) / 53898264945705951) [(1, 2), (5, 2), (13, 1), (15, 1), (16, 1)],
  term ((1897029392614988480 : Rat) / 53898264945705951) [(1, 2), (5, 2), (14, 2), (16, 1)],
  term ((1897029392614988480 : Rat) / 53898264945705951) [(1, 2), (5, 2), (15, 2), (16, 1)],
  term ((50775069040640000 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 1), (9, 1), (11, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((50775069040640000 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 1), (9, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((-25387534520320000 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 1), (9, 1), (11, 2), (14, 2), (15, 1), (16, 1)],
  term ((-25387534520320000 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 1), (9, 1), (11, 2), (15, 3), (16, 1)],
  term ((250769865717442985024 : Rat) / 269491324728529755) [(3, 1), (4, 1), (5, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((250769865717442985024 : Rat) / 269491324728529755) [(3, 1), (4, 1), (5, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-125384932858721492512 : Rat) / 269491324728529755) [(3, 1), (4, 1), (5, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-125384932858721492512 : Rat) / 269491324728529755) [(3, 1), (4, 1), (5, 1), (9, 1), (15, 3), (16, 1)],
  term ((-2286094421884887040 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 1), (9, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2286094421884887040 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 1), (9, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((1143047210942443520 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 1), (9, 2), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((1143047210942443520 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 1), (9, 2), (11, 1), (15, 3), (16, 1)],
  term ((4320373882583449600 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 1), (9, 3), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((4320373882583449600 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 1), (9, 3), (13, 1), (15, 2), (16, 1)],
  term ((-2160186941291724800 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 1), (9, 3), (14, 2), (15, 1), (16, 1)],
  term ((-2160186941291724800 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 1), (9, 3), (15, 3), (16, 1)],
  term ((51617331376160976032 : Rat) / 269491324728529755) [(3, 1), (4, 1), (5, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((51617331376160976032 : Rat) / 269491324728529755) [(3, 1), (4, 1), (5, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-25808665688080488016 : Rat) / 269491324728529755) [(3, 1), (4, 1), (5, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-25808665688080488016 : Rat) / 269491324728529755) [(3, 1), (4, 1), (5, 1), (11, 1), (15, 3), (16, 1)],
  term (-8 : Rat) [(3, 1), (4, 1), (5, 1), (12, 1), (14, 1), (16, 1)],
  term (-8 : Rat) [(3, 1), (4, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(3, 1), (4, 1), (5, 1), (14, 2), (16, 1)],
  term (4 : Rat) [(3, 1), (4, 1), (5, 1), (15, 2), (16, 1)],
  term ((5889549588605348864 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 2), (9, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((5889549588605348864 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 2), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2944774794302674432 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 2), (9, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-2944774794302674432 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 2), (9, 1), (11, 1), (15, 3), (16, 1)],
  term ((-50775069040640000 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 2), (9, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((-50775069040640000 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 2), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((25387534520320000 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 2), (9, 1), (11, 2), (14, 2), (16, 1)],
  term ((25387534520320000 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 2), (9, 1), (11, 2), (15, 2), (16, 1)],
  term ((-250769865717442985024 : Rat) / 269491324728529755) [(3, 1), (4, 1), (5, 2), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((-250769865717442985024 : Rat) / 269491324728529755) [(3, 1), (4, 1), (5, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((125384932858721492512 : Rat) / 269491324728529755) [(3, 1), (4, 1), (5, 2), (9, 1), (14, 2), (16, 1)],
  term ((125384932858721492512 : Rat) / 269491324728529755) [(3, 1), (4, 1), (5, 2), (9, 1), (15, 2), (16, 1)],
  term ((2286094421884887040 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 2), (9, 2), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((2286094421884887040 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 2), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1143047210942443520 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 2), (9, 2), (11, 1), (14, 2), (16, 1)],
  term ((-1143047210942443520 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 2), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((7405963932833314816 : Rat) / 17966088315235317) [(3, 1), (4, 1), (5, 2), (9, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((7405963932833314816 : Rat) / 17966088315235317) [(3, 1), (4, 1), (5, 2), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((-3702981966416657408 : Rat) / 17966088315235317) [(3, 1), (4, 1), (5, 2), (9, 2), (14, 2), (15, 1), (16, 1)],
  term ((-3702981966416657408 : Rat) / 17966088315235317) [(3, 1), (4, 1), (5, 2), (9, 2), (15, 3), (16, 1)],
  term ((-4320373882583449600 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 2), (9, 3), (12, 1), (14, 1), (16, 1)],
  term ((-4320373882583449600 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 2), (9, 3), (13, 1), (15, 1), (16, 1)],
  term ((2160186941291724800 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 2), (9, 3), (14, 2), (16, 1)],
  term ((2160186941291724800 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 2), (9, 3), (15, 2), (16, 1)],
  term ((-51617331376160976032 : Rat) / 269491324728529755) [(3, 1), (4, 1), (5, 2), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-51617331376160976032 : Rat) / 269491324728529755) [(3, 1), (4, 1), (5, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((25808665688080488016 : Rat) / 269491324728529755) [(3, 1), (4, 1), (5, 2), (11, 1), (14, 2), (16, 1)],
  term ((25808665688080488016 : Rat) / 269491324728529755) [(3, 1), (4, 1), (5, 2), (11, 1), (15, 2), (16, 1)],
  term ((-5889549588605348864 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 3), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-5889549588605348864 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 3), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((2944774794302674432 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 3), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((2944774794302674432 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 3), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-7405963932833314816 : Rat) / 17966088315235317) [(3, 1), (4, 1), (5, 3), (9, 2), (12, 1), (14, 1), (16, 1)],
  term ((-7405963932833314816 : Rat) / 17966088315235317) [(3, 1), (4, 1), (5, 3), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((3702981966416657408 : Rat) / 17966088315235317) [(3, 1), (4, 1), (5, 3), (9, 2), (14, 2), (16, 1)],
  term ((3702981966416657408 : Rat) / 17966088315235317) [(3, 1), (4, 1), (5, 3), (9, 2), (15, 2), (16, 1)],
  term ((-1263204015594680320 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((333207674852756480 : Rat) / 17966088315235317) [(3, 1), (5, 1), (6, 1), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((333207674852756480 : Rat) / 17966088315235317) [(3, 1), (5, 1), (6, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1263204015594680320 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((631602007797340160 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 1), (11, 1), (14, 2), (15, 2), (16, 1)],
  term ((-166603837426378240 : Rat) / 17966088315235317) [(3, 1), (5, 1), (6, 1), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((-166603837426378240 : Rat) / 17966088315235317) [(3, 1), (5, 1), (6, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((631602007797340160 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 1), (11, 1), (15, 4), (16, 1)],
  term ((-278506735265382400 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 1), (11, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-278506735265382400 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((139253367632691200 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 1), (11, 2), (14, 2), (15, 1), (16, 1)],
  term ((139253367632691200 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 1), (11, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 27, terms 200 through 299. -/
theorem rs_R010_ueqv_R010YNN_block_27_0200_0299_valid :
    checkProductSumEq rs_R010_ueqv_R010YNN_partials_27_0200_0299
      rs_R010_ueqv_R010YNN_block_27_0200_0299 = true := by
  native_decide

end R010UeqvR010YNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
