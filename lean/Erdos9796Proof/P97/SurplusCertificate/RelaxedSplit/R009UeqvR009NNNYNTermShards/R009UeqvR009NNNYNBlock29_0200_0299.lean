/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NNNYN, term block 29:200-299

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NNNYNTermShards

/-- Generator polynomial 29 for relaxed split surplus certificate `R009:u=v:R009NNNYN`. -/
def rs_R009_ueqv_R009NNNYN_generator_29_0200_0299 : Poly :=
[
  term (1 : Rat) [],
  term (2 : Rat) [(10, 1), (14, 1)],
  term (-1 : Rat) [(10, 2)],
  term (2 : Rat) [(11, 1), (15, 1)],
  term (-1 : Rat) [(11, 2)],
  term (-2 : Rat) [(14, 1)]
]

/-- Coefficient term 200 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0200 : Poly :=
[
  term ((4385912120576 : Rat) / 157072892175) [(5, 1), (7, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 200 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0200 : Poly :=
[
  term ((8771824241152 : Rat) / 157072892175) [(5, 1), (7, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4385912120576 : Rat) / 157072892175) [(5, 1), (7, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-8771824241152 : Rat) / 157072892175) [(5, 1), (7, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((4385912120576 : Rat) / 157072892175) [(5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((8771824241152 : Rat) / 157072892175) [(5, 1), (7, 1), (11, 2), (15, 2), (16, 1)],
  term ((-4385912120576 : Rat) / 157072892175) [(5, 1), (7, 1), (11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 200 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0200_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0200
        rs_R009_ueqv_R009NNNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_29_0200 := by
  native_decide

/-- Coefficient term 201 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0201 : Poly :=
[
  term ((-12730977280 : Rat) / 110226591) [(5, 1), (7, 1), (11, 2)]
]

/-- Partial product 201 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0201 : Poly :=
[
  term ((-25461954560 : Rat) / 110226591) [(5, 1), (7, 1), (10, 1), (11, 2), (14, 1)],
  term ((12730977280 : Rat) / 110226591) [(5, 1), (7, 1), (10, 2), (11, 2)],
  term ((-12730977280 : Rat) / 110226591) [(5, 1), (7, 1), (11, 2)],
  term ((25461954560 : Rat) / 110226591) [(5, 1), (7, 1), (11, 2), (14, 1)],
  term ((-25461954560 : Rat) / 110226591) [(5, 1), (7, 1), (11, 3), (15, 1)],
  term ((12730977280 : Rat) / 110226591) [(5, 1), (7, 1), (11, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 201 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0201_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0201
        rs_R009_ueqv_R009NNNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_29_0201 := by
  native_decide

/-- Coefficient term 202 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0202 : Poly :=
[
  term ((589910160 : Rat) / 12247399) [(5, 1), (7, 1), (13, 1), (15, 1)]
]

/-- Partial product 202 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0202 : Poly :=
[
  term ((1179820320 : Rat) / 12247399) [(5, 1), (7, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-589910160 : Rat) / 12247399) [(5, 1), (7, 1), (10, 2), (13, 1), (15, 1)],
  term ((1179820320 : Rat) / 12247399) [(5, 1), (7, 1), (11, 1), (13, 1), (15, 2)],
  term ((-589910160 : Rat) / 12247399) [(5, 1), (7, 1), (11, 2), (13, 1), (15, 1)],
  term ((-1179820320 : Rat) / 12247399) [(5, 1), (7, 1), (13, 1), (14, 1), (15, 1)],
  term ((589910160 : Rat) / 12247399) [(5, 1), (7, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 202 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0202_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0202
        rs_R009_ueqv_R009NNNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_29_0202 := by
  native_decide

/-- Coefficient term 203 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0203 : Poly :=
[
  term ((68529876884 : Rat) / 5817514525) [(5, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 203 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0203 : Poly :=
[
  term ((137059753768 : Rat) / 5817514525) [(5, 1), (7, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-68529876884 : Rat) / 5817514525) [(5, 1), (7, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((137059753768 : Rat) / 5817514525) [(5, 1), (7, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-68529876884 : Rat) / 5817514525) [(5, 1), (7, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-137059753768 : Rat) / 5817514525) [(5, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((68529876884 : Rat) / 5817514525) [(5, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 203 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0203_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0203
        rs_R009_ueqv_R009NNNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_29_0203 := by
  native_decide

/-- Coefficient term 204 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0204 : Poly :=
[
  term ((-9762801068 : Rat) / 110226591) [(5, 1), (7, 1), (15, 2)]
]

/-- Partial product 204 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0204 : Poly :=
[
  term ((-19525602136 : Rat) / 110226591) [(5, 1), (7, 1), (10, 1), (14, 1), (15, 2)],
  term ((9762801068 : Rat) / 110226591) [(5, 1), (7, 1), (10, 2), (15, 2)],
  term ((-19525602136 : Rat) / 110226591) [(5, 1), (7, 1), (11, 1), (15, 3)],
  term ((9762801068 : Rat) / 110226591) [(5, 1), (7, 1), (11, 2), (15, 2)],
  term ((19525602136 : Rat) / 110226591) [(5, 1), (7, 1), (14, 1), (15, 2)],
  term ((-9762801068 : Rat) / 110226591) [(5, 1), (7, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 204 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0204_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0204
        rs_R009_ueqv_R009NNNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_29_0204 := by
  native_decide

/-- Coefficient term 205 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0205 : Poly :=
[
  term ((-4789749157348 : Rat) / 157072892175) [(5, 1), (7, 1), (15, 2), (16, 1)]
]

/-- Partial product 205 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0205 : Poly :=
[
  term ((-9579498314696 : Rat) / 157072892175) [(5, 1), (7, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((4789749157348 : Rat) / 157072892175) [(5, 1), (7, 1), (10, 2), (15, 2), (16, 1)],
  term ((-9579498314696 : Rat) / 157072892175) [(5, 1), (7, 1), (11, 1), (15, 3), (16, 1)],
  term ((4789749157348 : Rat) / 157072892175) [(5, 1), (7, 1), (11, 2), (15, 2), (16, 1)],
  term ((9579498314696 : Rat) / 157072892175) [(5, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((-4789749157348 : Rat) / 157072892175) [(5, 1), (7, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 205 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0205_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0205
        rs_R009_ueqv_R009NNNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_29_0205 := by
  native_decide

/-- Coefficient term 206 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0206 : Poly :=
[
  term ((2192956060288 : Rat) / 52357630725) [(5, 1), (7, 2), (11, 1)]
]

/-- Partial product 206 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0206 : Poly :=
[
  term ((4385912120576 : Rat) / 52357630725) [(5, 1), (7, 2), (10, 1), (11, 1), (14, 1)],
  term ((-2192956060288 : Rat) / 52357630725) [(5, 1), (7, 2), (10, 2), (11, 1)],
  term ((2192956060288 : Rat) / 52357630725) [(5, 1), (7, 2), (11, 1)],
  term ((-4385912120576 : Rat) / 52357630725) [(5, 1), (7, 2), (11, 1), (14, 1)],
  term ((4385912120576 : Rat) / 52357630725) [(5, 1), (7, 2), (11, 2), (15, 1)],
  term ((-2192956060288 : Rat) / 52357630725) [(5, 1), (7, 2), (11, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 206 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0206_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0206
        rs_R009_ueqv_R009NNNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_29_0206 := by
  native_decide

/-- Coefficient term 207 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0207 : Poly :=
[
  term ((102794815326 : Rat) / 5817514525) [(5, 1), (7, 2), (13, 1)]
]

/-- Partial product 207 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0207 : Poly :=
[
  term ((205589630652 : Rat) / 5817514525) [(5, 1), (7, 2), (10, 1), (13, 1), (14, 1)],
  term ((-102794815326 : Rat) / 5817514525) [(5, 1), (7, 2), (10, 2), (13, 1)],
  term ((205589630652 : Rat) / 5817514525) [(5, 1), (7, 2), (11, 1), (13, 1), (15, 1)],
  term ((-102794815326 : Rat) / 5817514525) [(5, 1), (7, 2), (11, 2), (13, 1)],
  term ((102794815326 : Rat) / 5817514525) [(5, 1), (7, 2), (13, 1)],
  term ((-205589630652 : Rat) / 5817514525) [(5, 1), (7, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 207 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0207_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0207
        rs_R009_ueqv_R009NNNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_29_0207 := by
  native_decide

/-- Coefficient term 208 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0208 : Poly :=
[
  term ((-2394874578674 : Rat) / 52357630725) [(5, 1), (7, 2), (15, 1)]
]

/-- Partial product 208 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0208 : Poly :=
[
  term ((-4789749157348 : Rat) / 52357630725) [(5, 1), (7, 2), (10, 1), (14, 1), (15, 1)],
  term ((2394874578674 : Rat) / 52357630725) [(5, 1), (7, 2), (10, 2), (15, 1)],
  term ((-4789749157348 : Rat) / 52357630725) [(5, 1), (7, 2), (11, 1), (15, 2)],
  term ((2394874578674 : Rat) / 52357630725) [(5, 1), (7, 2), (11, 2), (15, 1)],
  term ((4789749157348 : Rat) / 52357630725) [(5, 1), (7, 2), (14, 1), (15, 1)],
  term ((-2394874578674 : Rat) / 52357630725) [(5, 1), (7, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 208 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0208_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0208
        rs_R009_ueqv_R009NNNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_29_0208 := by
  native_decide

/-- Coefficient term 209 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0209 : Poly :=
[
  term ((-1817 : Rat) / 268) [(5, 1), (9, 1)]
]

/-- Partial product 209 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0209 : Poly :=
[
  term ((-1817 : Rat) / 268) [(5, 1), (9, 1)],
  term ((-1817 : Rat) / 134) [(5, 1), (9, 1), (10, 1), (14, 1)],
  term ((1817 : Rat) / 268) [(5, 1), (9, 1), (10, 2)],
  term ((-1817 : Rat) / 134) [(5, 1), (9, 1), (11, 1), (15, 1)],
  term ((1817 : Rat) / 268) [(5, 1), (9, 1), (11, 2)],
  term ((1817 : Rat) / 134) [(5, 1), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 209 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0209_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0209
        rs_R009_ueqv_R009NNNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_29_0209 := by
  native_decide

/-- Coefficient term 210 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0210 : Poly :=
[
  term ((-196 : Rat) / 67) [(5, 1), (9, 1), (10, 1)]
]

/-- Partial product 210 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0210 : Poly :=
[
  term ((-196 : Rat) / 67) [(5, 1), (9, 1), (10, 1)],
  term ((-392 : Rat) / 67) [(5, 1), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((196 : Rat) / 67) [(5, 1), (9, 1), (10, 1), (11, 2)],
  term ((392 : Rat) / 67) [(5, 1), (9, 1), (10, 1), (14, 1)],
  term ((-392 : Rat) / 67) [(5, 1), (9, 1), (10, 2), (14, 1)],
  term ((196 : Rat) / 67) [(5, 1), (9, 1), (10, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 210 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0210_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0210
        rs_R009_ueqv_R009NNNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_29_0210 := by
  native_decide

/-- Coefficient term 211 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0211 : Poly :=
[
  term ((298382280 : Rat) / 12247399) [(5, 1), (9, 1), (11, 1), (13, 1)]
]

/-- Partial product 211 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0211 : Poly :=
[
  term ((596764560 : Rat) / 12247399) [(5, 1), (9, 1), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((-298382280 : Rat) / 12247399) [(5, 1), (9, 1), (10, 2), (11, 1), (13, 1)],
  term ((298382280 : Rat) / 12247399) [(5, 1), (9, 1), (11, 1), (13, 1)],
  term ((-596764560 : Rat) / 12247399) [(5, 1), (9, 1), (11, 1), (13, 1), (14, 1)],
  term ((596764560 : Rat) / 12247399) [(5, 1), (9, 1), (11, 2), (13, 1), (15, 1)],
  term ((-298382280 : Rat) / 12247399) [(5, 1), (9, 1), (11, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 211 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0211_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0211
        rs_R009_ueqv_R009NNNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_29_0211 := by
  native_decide

/-- Coefficient term 212 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0212 : Poly :=
[
  term ((-1460901006 : Rat) / 12247399) [(5, 1), (9, 1), (11, 1), (15, 1)]
]

/-- Partial product 212 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0212 : Poly :=
[
  term ((-2921802012 : Rat) / 12247399) [(5, 1), (9, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((1460901006 : Rat) / 12247399) [(5, 1), (9, 1), (10, 2), (11, 1), (15, 1)],
  term ((2921802012 : Rat) / 12247399) [(5, 1), (9, 1), (11, 1), (14, 1), (15, 1)],
  term ((-1460901006 : Rat) / 12247399) [(5, 1), (9, 1), (11, 1), (15, 1)],
  term ((-2921802012 : Rat) / 12247399) [(5, 1), (9, 1), (11, 2), (15, 2)],
  term ((1460901006 : Rat) / 12247399) [(5, 1), (9, 1), (11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 212 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0212_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0212
        rs_R009_ueqv_R009NNNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_29_0212 := by
  native_decide

/-- Coefficient term 213 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0213 : Poly :=
[
  term ((-44102409344 : Rat) / 18848747061) [(5, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 213 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0213 : Poly :=
[
  term ((-88204818688 : Rat) / 18848747061) [(5, 1), (9, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((44102409344 : Rat) / 18848747061) [(5, 1), (9, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((88204818688 : Rat) / 18848747061) [(5, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-44102409344 : Rat) / 18848747061) [(5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-88204818688 : Rat) / 18848747061) [(5, 1), (9, 1), (11, 2), (15, 2), (16, 1)],
  term ((44102409344 : Rat) / 18848747061) [(5, 1), (9, 1), (11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 213 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0213_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0213
        rs_R009_ueqv_R009NNNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_29_0213 := by
  native_decide

/-- Coefficient term 214 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0214 : Poly :=
[
  term ((6365488640 : Rat) / 110226591) [(5, 1), (9, 1), (11, 2)]
]

/-- Partial product 214 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0214 : Poly :=
[
  term ((12730977280 : Rat) / 110226591) [(5, 1), (9, 1), (10, 1), (11, 2), (14, 1)],
  term ((-6365488640 : Rat) / 110226591) [(5, 1), (9, 1), (10, 2), (11, 2)],
  term ((6365488640 : Rat) / 110226591) [(5, 1), (9, 1), (11, 2)],
  term ((-12730977280 : Rat) / 110226591) [(5, 1), (9, 1), (11, 2), (14, 1)],
  term ((12730977280 : Rat) / 110226591) [(5, 1), (9, 1), (11, 3), (15, 1)],
  term ((-6365488640 : Rat) / 110226591) [(5, 1), (9, 1), (11, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 214 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0214_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0214
        rs_R009_ueqv_R009NNNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_29_0214 := by
  native_decide

/-- Coefficient term 215 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0215 : Poly :=
[
  term ((-294955080 : Rat) / 12247399) [(5, 1), (9, 1), (13, 1), (15, 1)]
]

/-- Partial product 215 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0215 : Poly :=
[
  term ((-589910160 : Rat) / 12247399) [(5, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((294955080 : Rat) / 12247399) [(5, 1), (9, 1), (10, 2), (13, 1), (15, 1)],
  term ((-589910160 : Rat) / 12247399) [(5, 1), (9, 1), (11, 1), (13, 1), (15, 2)],
  term ((294955080 : Rat) / 12247399) [(5, 1), (9, 1), (11, 2), (13, 1), (15, 1)],
  term ((589910160 : Rat) / 12247399) [(5, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((-294955080 : Rat) / 12247399) [(5, 1), (9, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 215 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0215_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0215
        rs_R009_ueqv_R009NNNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_29_0215 := by
  native_decide

/-- Coefficient term 216 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0216 : Poly :=
[
  term ((-689100146 : Rat) / 698101743) [(5, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 216 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0216 : Poly :=
[
  term ((-1378200292 : Rat) / 698101743) [(5, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((689100146 : Rat) / 698101743) [(5, 1), (9, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1378200292 : Rat) / 698101743) [(5, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((689100146 : Rat) / 698101743) [(5, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((1378200292 : Rat) / 698101743) [(5, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-689100146 : Rat) / 698101743) [(5, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 216 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0216_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0216
        rs_R009_ueqv_R009NNNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_29_0216 := by
  native_decide

/-- Coefficient term 217 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0217 : Poly :=
[
  term ((73 : Rat) / 67) [(5, 1), (9, 1), (14, 1)]
]

/-- Partial product 217 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0217 : Poly :=
[
  term ((146 : Rat) / 67) [(5, 1), (9, 1), (10, 1), (14, 2)],
  term ((-73 : Rat) / 67) [(5, 1), (9, 1), (10, 2), (14, 1)],
  term ((146 : Rat) / 67) [(5, 1), (9, 1), (11, 1), (14, 1), (15, 1)],
  term ((-73 : Rat) / 67) [(5, 1), (9, 1), (11, 2), (14, 1)],
  term ((73 : Rat) / 67) [(5, 1), (9, 1), (14, 1)],
  term ((-146 : Rat) / 67) [(5, 1), (9, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 217 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0217_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0217
        rs_R009_ueqv_R009NNNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_29_0217 := by
  native_decide

/-- Coefficient term 218 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0218 : Poly :=
[
  term ((4881400534 : Rat) / 110226591) [(5, 1), (9, 1), (15, 2)]
]

/-- Partial product 218 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0218 : Poly :=
[
  term ((9762801068 : Rat) / 110226591) [(5, 1), (9, 1), (10, 1), (14, 1), (15, 2)],
  term ((-4881400534 : Rat) / 110226591) [(5, 1), (9, 1), (10, 2), (15, 2)],
  term ((9762801068 : Rat) / 110226591) [(5, 1), (9, 1), (11, 1), (15, 3)],
  term ((-4881400534 : Rat) / 110226591) [(5, 1), (9, 1), (11, 2), (15, 2)],
  term ((-9762801068 : Rat) / 110226591) [(5, 1), (9, 1), (14, 1), (15, 2)],
  term ((4881400534 : Rat) / 110226591) [(5, 1), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 218 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0218_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0218
        rs_R009_ueqv_R009NNNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_29_0218 := by
  native_decide

/-- Coefficient term 219 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0219 : Poly :=
[
  term ((76905767668 : Rat) / 18848747061) [(5, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 219 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0219 : Poly :=
[
  term ((153811535336 : Rat) / 18848747061) [(5, 1), (9, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-76905767668 : Rat) / 18848747061) [(5, 1), (9, 1), (10, 2), (15, 2), (16, 1)],
  term ((153811535336 : Rat) / 18848747061) [(5, 1), (9, 1), (11, 1), (15, 3), (16, 1)],
  term ((-76905767668 : Rat) / 18848747061) [(5, 1), (9, 1), (11, 2), (15, 2), (16, 1)],
  term ((-153811535336 : Rat) / 18848747061) [(5, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((76905767668 : Rat) / 18848747061) [(5, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 219 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0219_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0219
        rs_R009_ueqv_R009NNNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_29_0219 := by
  native_decide

/-- Coefficient term 220 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0220 : Poly :=
[
  term ((11025602336 : Rat) / 6282915687) [(5, 1), (9, 2), (11, 1)]
]

/-- Partial product 220 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0220 : Poly :=
[
  term ((22051204672 : Rat) / 6282915687) [(5, 1), (9, 2), (10, 1), (11, 1), (14, 1)],
  term ((-11025602336 : Rat) / 6282915687) [(5, 1), (9, 2), (10, 2), (11, 1)],
  term ((11025602336 : Rat) / 6282915687) [(5, 1), (9, 2), (11, 1)],
  term ((-22051204672 : Rat) / 6282915687) [(5, 1), (9, 2), (11, 1), (14, 1)],
  term ((22051204672 : Rat) / 6282915687) [(5, 1), (9, 2), (11, 2), (15, 1)],
  term ((-11025602336 : Rat) / 6282915687) [(5, 1), (9, 2), (11, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 220 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0220_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0220
        rs_R009_ueqv_R009NNNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_29_0220 := by
  native_decide

/-- Coefficient term 221 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0221 : Poly :=
[
  term ((344550073 : Rat) / 465401162) [(5, 1), (9, 2), (13, 1)]
]

/-- Partial product 221 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0221 : Poly :=
[
  term ((344550073 : Rat) / 232700581) [(5, 1), (9, 2), (10, 1), (13, 1), (14, 1)],
  term ((-344550073 : Rat) / 465401162) [(5, 1), (9, 2), (10, 2), (13, 1)],
  term ((344550073 : Rat) / 232700581) [(5, 1), (9, 2), (11, 1), (13, 1), (15, 1)],
  term ((-344550073 : Rat) / 465401162) [(5, 1), (9, 2), (11, 2), (13, 1)],
  term ((344550073 : Rat) / 465401162) [(5, 1), (9, 2), (13, 1)],
  term ((-344550073 : Rat) / 232700581) [(5, 1), (9, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 221 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0221_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0221
        rs_R009_ueqv_R009NNNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_29_0221 := by
  native_decide

/-- Coefficient term 222 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0222 : Poly :=
[
  term ((-19226441917 : Rat) / 6282915687) [(5, 1), (9, 2), (15, 1)]
]

/-- Partial product 222 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0222 : Poly :=
[
  term ((-38452883834 : Rat) / 6282915687) [(5, 1), (9, 2), (10, 1), (14, 1), (15, 1)],
  term ((19226441917 : Rat) / 6282915687) [(5, 1), (9, 2), (10, 2), (15, 1)],
  term ((-38452883834 : Rat) / 6282915687) [(5, 1), (9, 2), (11, 1), (15, 2)],
  term ((19226441917 : Rat) / 6282915687) [(5, 1), (9, 2), (11, 2), (15, 1)],
  term ((38452883834 : Rat) / 6282915687) [(5, 1), (9, 2), (14, 1), (15, 1)],
  term ((-19226441917 : Rat) / 6282915687) [(5, 1), (9, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 222 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0222_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0222
        rs_R009_ueqv_R009NNNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_29_0222 := by
  native_decide

/-- Coefficient term 223 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0223 : Poly :=
[
  term ((-83996018176 : Rat) / 3490508715) [(5, 1), (10, 1), (11, 1)]
]

/-- Partial product 223 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0223 : Poly :=
[
  term ((-83996018176 : Rat) / 3490508715) [(5, 1), (10, 1), (11, 1)],
  term ((167992036352 : Rat) / 3490508715) [(5, 1), (10, 1), (11, 1), (14, 1)],
  term ((-167992036352 : Rat) / 3490508715) [(5, 1), (10, 1), (11, 2), (15, 1)],
  term ((83996018176 : Rat) / 3490508715) [(5, 1), (10, 1), (11, 3)],
  term ((-167992036352 : Rat) / 3490508715) [(5, 1), (10, 2), (11, 1), (14, 1)],
  term ((83996018176 : Rat) / 3490508715) [(5, 1), (10, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 223 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0223_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0223
        rs_R009_ueqv_R009NNNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_29_0223 := by
  native_decide

/-- Coefficient term 224 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0224 : Poly :=
[
  term ((19496960 : Rat) / 330679773) [(5, 1), (10, 1), (11, 1), (14, 1)]
]

/-- Partial product 224 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0224 : Poly :=
[
  term ((19496960 : Rat) / 330679773) [(5, 1), (10, 1), (11, 1), (14, 1)],
  term ((-38993920 : Rat) / 330679773) [(5, 1), (10, 1), (11, 1), (14, 2)],
  term ((38993920 : Rat) / 330679773) [(5, 1), (10, 1), (11, 2), (14, 1), (15, 1)],
  term ((-19496960 : Rat) / 330679773) [(5, 1), (10, 1), (11, 3), (14, 1)],
  term ((38993920 : Rat) / 330679773) [(5, 1), (10, 2), (11, 1), (14, 2)],
  term ((-19496960 : Rat) / 330679773) [(5, 1), (10, 3), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 224 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0224_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0224
        rs_R009_ueqv_R009NNNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_29_0224 := by
  native_decide

/-- Coefficient term 225 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0225 : Poly :=
[
  term ((-11811940056 : Rat) / 1163502905) [(5, 1), (10, 1), (13, 1)]
]

/-- Partial product 225 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0225 : Poly :=
[
  term ((-23623880112 : Rat) / 1163502905) [(5, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((11811940056 : Rat) / 1163502905) [(5, 1), (10, 1), (11, 2), (13, 1)],
  term ((-11811940056 : Rat) / 1163502905) [(5, 1), (10, 1), (13, 1)],
  term ((23623880112 : Rat) / 1163502905) [(5, 1), (10, 1), (13, 1), (14, 1)],
  term ((-23623880112 : Rat) / 1163502905) [(5, 1), (10, 2), (13, 1), (14, 1)],
  term ((11811940056 : Rat) / 1163502905) [(5, 1), (10, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 225 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0225_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0225
        rs_R009_ueqv_R009NNNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_29_0225 := by
  native_decide

/-- Coefficient term 226 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0226 : Poly :=
[
  term ((304640 : Rat) / 12247399) [(5, 1), (10, 1), (13, 1), (14, 1)]
]

/-- Partial product 226 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0226 : Poly :=
[
  term ((609280 : Rat) / 12247399) [(5, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-304640 : Rat) / 12247399) [(5, 1), (10, 1), (11, 2), (13, 1), (14, 1)],
  term ((304640 : Rat) / 12247399) [(5, 1), (10, 1), (13, 1), (14, 1)],
  term ((-609280 : Rat) / 12247399) [(5, 1), (10, 1), (13, 1), (14, 2)],
  term ((609280 : Rat) / 12247399) [(5, 1), (10, 2), (13, 1), (14, 2)],
  term ((-304640 : Rat) / 12247399) [(5, 1), (10, 3), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 226 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0226_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0226
        rs_R009_ueqv_R009NNNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_29_0226 := by
  native_decide

/-- Coefficient term 227 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0227 : Poly :=
[
  term ((-17582080 : Rat) / 330679773) [(5, 1), (10, 1), (14, 1), (15, 1)]
]

/-- Partial product 227 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0227 : Poly :=
[
  term ((-35164160 : Rat) / 330679773) [(5, 1), (10, 1), (11, 1), (14, 1), (15, 2)],
  term ((17582080 : Rat) / 330679773) [(5, 1), (10, 1), (11, 2), (14, 1), (15, 1)],
  term ((-17582080 : Rat) / 330679773) [(5, 1), (10, 1), (14, 1), (15, 1)],
  term ((35164160 : Rat) / 330679773) [(5, 1), (10, 1), (14, 2), (15, 1)],
  term ((-35164160 : Rat) / 330679773) [(5, 1), (10, 2), (14, 2), (15, 1)],
  term ((17582080 : Rat) / 330679773) [(5, 1), (10, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 227 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0227_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0227
        rs_R009_ueqv_R009NNNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_29_0227 := by
  native_decide

/-- Coefficient term 228 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0228 : Poly :=
[
  term ((24114243036 : Rat) / 1163502905) [(5, 1), (10, 1), (15, 1)]
]

/-- Partial product 228 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0228 : Poly :=
[
  term ((48228486072 : Rat) / 1163502905) [(5, 1), (10, 1), (11, 1), (15, 2)],
  term ((-24114243036 : Rat) / 1163502905) [(5, 1), (10, 1), (11, 2), (15, 1)],
  term ((-48228486072 : Rat) / 1163502905) [(5, 1), (10, 1), (14, 1), (15, 1)],
  term ((24114243036 : Rat) / 1163502905) [(5, 1), (10, 1), (15, 1)],
  term ((48228486072 : Rat) / 1163502905) [(5, 1), (10, 2), (14, 1), (15, 1)],
  term ((-24114243036 : Rat) / 1163502905) [(5, 1), (10, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 228 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0228_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0228
        rs_R009_ueqv_R009NNNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_29_0228 := by
  native_decide

/-- Coefficient term 229 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0229 : Poly :=
[
  term ((-6464293562492 : Rat) / 94243735305) [(5, 1), (11, 1)]
]

/-- Partial product 229 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0229 : Poly :=
[
  term ((-12928587124984 : Rat) / 94243735305) [(5, 1), (10, 1), (11, 1), (14, 1)],
  term ((6464293562492 : Rat) / 94243735305) [(5, 1), (10, 2), (11, 1)],
  term ((-6464293562492 : Rat) / 94243735305) [(5, 1), (11, 1)],
  term ((12928587124984 : Rat) / 94243735305) [(5, 1), (11, 1), (14, 1)],
  term ((-12928587124984 : Rat) / 94243735305) [(5, 1), (11, 2), (15, 1)],
  term ((6464293562492 : Rat) / 94243735305) [(5, 1), (11, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 229 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0229_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0229
        rs_R009_ueqv_R009NNNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_29_0229 := by
  native_decide

/-- Coefficient term 230 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0230 : Poly :=
[
  term ((9527182336 : Rat) / 110226591) [(5, 1), (11, 1), (12, 1)]
]

/-- Partial product 230 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0230 : Poly :=
[
  term ((19054364672 : Rat) / 110226591) [(5, 1), (10, 1), (11, 1), (12, 1), (14, 1)],
  term ((-9527182336 : Rat) / 110226591) [(5, 1), (10, 2), (11, 1), (12, 1)],
  term ((9527182336 : Rat) / 110226591) [(5, 1), (11, 1), (12, 1)],
  term ((-19054364672 : Rat) / 110226591) [(5, 1), (11, 1), (12, 1), (14, 1)],
  term ((19054364672 : Rat) / 110226591) [(5, 1), (11, 2), (12, 1), (15, 1)],
  term ((-9527182336 : Rat) / 110226591) [(5, 1), (11, 3), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 230 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0230_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0230
        rs_R009_ueqv_R009NNNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_29_0230 := by
  native_decide

/-- Coefficient term 231 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0231 : Poly :=
[
  term ((-46681600 : Rat) / 12247399) [(5, 1), (11, 1), (12, 1), (14, 1)]
]

/-- Partial product 231 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0231 : Poly :=
[
  term ((-93363200 : Rat) / 12247399) [(5, 1), (10, 1), (11, 1), (12, 1), (14, 2)],
  term ((46681600 : Rat) / 12247399) [(5, 1), (10, 2), (11, 1), (12, 1), (14, 1)],
  term ((-46681600 : Rat) / 12247399) [(5, 1), (11, 1), (12, 1), (14, 1)],
  term ((93363200 : Rat) / 12247399) [(5, 1), (11, 1), (12, 1), (14, 2)],
  term ((-93363200 : Rat) / 12247399) [(5, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((46681600 : Rat) / 12247399) [(5, 1), (11, 3), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 231 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0231_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0231
        rs_R009_ueqv_R009NNNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_29_0231 := by
  native_decide

/-- Coefficient term 232 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0232 : Poly :=
[
  term ((-913920 : Rat) / 12247399) [(5, 1), (11, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 232 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0232 : Poly :=
[
  term ((-1827840 : Rat) / 12247399) [(5, 1), (10, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((913920 : Rat) / 12247399) [(5, 1), (10, 2), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-913920 : Rat) / 12247399) [(5, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((1827840 : Rat) / 12247399) [(5, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((-1827840 : Rat) / 12247399) [(5, 1), (11, 2), (13, 1), (14, 1), (15, 2)],
  term ((913920 : Rat) / 12247399) [(5, 1), (11, 3), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 232 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0232_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0232
        rs_R009_ueqv_R009NNNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_29_0232 := by
  native_decide

/-- Coefficient term 233 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0233 : Poly :=
[
  term ((-259857920 : Rat) / 110226591) [(5, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 233 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0233 : Poly :=
[
  term ((-519715840 : Rat) / 110226591) [(5, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((259857920 : Rat) / 110226591) [(5, 1), (10, 2), (11, 1), (13, 1), (15, 1)],
  term ((519715840 : Rat) / 110226591) [(5, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-259857920 : Rat) / 110226591) [(5, 1), (11, 1), (13, 1), (15, 1)],
  term ((-519715840 : Rat) / 110226591) [(5, 1), (11, 2), (13, 1), (15, 2)],
  term ((259857920 : Rat) / 110226591) [(5, 1), (11, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 233 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0233_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0233
        rs_R009_ueqv_R009NNNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_29_0233 := by
  native_decide

/-- Coefficient term 234 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0234 : Poly :=
[
  term ((-3231243188 : Rat) / 330679773) [(5, 1), (11, 1), (14, 1)]
]

/-- Partial product 234 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0234 : Poly :=
[
  term ((-6462486376 : Rat) / 330679773) [(5, 1), (10, 1), (11, 1), (14, 2)],
  term ((3231243188 : Rat) / 330679773) [(5, 1), (10, 2), (11, 1), (14, 1)],
  term ((-3231243188 : Rat) / 330679773) [(5, 1), (11, 1), (14, 1)],
  term ((6462486376 : Rat) / 330679773) [(5, 1), (11, 1), (14, 2)],
  term ((-6462486376 : Rat) / 330679773) [(5, 1), (11, 2), (14, 1), (15, 1)],
  term ((3231243188 : Rat) / 330679773) [(5, 1), (11, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 234 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0234_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0234
        rs_R009_ueqv_R009NNNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_29_0234 := by
  native_decide

/-- Coefficient term 235 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0235 : Poly :=
[
  term ((32204800 : Rat) / 110226591) [(5, 1), (11, 1), (14, 1), (15, 2)]
]

/-- Partial product 235 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0235 : Poly :=
[
  term ((64409600 : Rat) / 110226591) [(5, 1), (10, 1), (11, 1), (14, 2), (15, 2)],
  term ((-32204800 : Rat) / 110226591) [(5, 1), (10, 2), (11, 1), (14, 1), (15, 2)],
  term ((32204800 : Rat) / 110226591) [(5, 1), (11, 1), (14, 1), (15, 2)],
  term ((-64409600 : Rat) / 110226591) [(5, 1), (11, 1), (14, 2), (15, 2)],
  term ((64409600 : Rat) / 110226591) [(5, 1), (11, 2), (14, 1), (15, 3)],
  term ((-32204800 : Rat) / 110226591) [(5, 1), (11, 3), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 235 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0235_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0235
        rs_R009_ueqv_R009NNNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_29_0235 := by
  native_decide

/-- Coefficient term 236 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0236 : Poly :=
[
  term ((-206685851456 : Rat) / 24800982975) [(5, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 236 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0236 : Poly :=
[
  term ((-413371702912 : Rat) / 24800982975) [(5, 1), (10, 1), (11, 1), (14, 2), (16, 1)],
  term ((206685851456 : Rat) / 24800982975) [(5, 1), (10, 2), (11, 1), (14, 1), (16, 1)],
  term ((-206685851456 : Rat) / 24800982975) [(5, 1), (11, 1), (14, 1), (16, 1)],
  term ((413371702912 : Rat) / 24800982975) [(5, 1), (11, 1), (14, 2), (16, 1)],
  term ((-413371702912 : Rat) / 24800982975) [(5, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((206685851456 : Rat) / 24800982975) [(5, 1), (11, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 236 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0236_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0236
        rs_R009_ueqv_R009NNNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_29_0236 := by
  native_decide

/-- Coefficient term 237 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0237 : Poly :=
[
  term ((1676872960 : Rat) / 110226591) [(5, 1), (11, 1), (14, 2)]
]

/-- Partial product 237 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0237 : Poly :=
[
  term ((3353745920 : Rat) / 110226591) [(5, 1), (10, 1), (11, 1), (14, 3)],
  term ((-1676872960 : Rat) / 110226591) [(5, 1), (10, 2), (11, 1), (14, 2)],
  term ((1676872960 : Rat) / 110226591) [(5, 1), (11, 1), (14, 2)],
  term ((-3353745920 : Rat) / 110226591) [(5, 1), (11, 1), (14, 3)],
  term ((3353745920 : Rat) / 110226591) [(5, 1), (11, 2), (14, 2), (15, 1)],
  term ((-1676872960 : Rat) / 110226591) [(5, 1), (11, 3), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 237 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0237_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0237
        rs_R009_ueqv_R009NNNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_29_0237 := by
  native_decide

/-- Coefficient term 238 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0238 : Poly :=
[
  term ((-34641920 : Rat) / 110226591) [(5, 1), (11, 1), (15, 2)]
]

/-- Partial product 238 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0238 : Poly :=
[
  term ((-69283840 : Rat) / 110226591) [(5, 1), (10, 1), (11, 1), (14, 1), (15, 2)],
  term ((34641920 : Rat) / 110226591) [(5, 1), (10, 2), (11, 1), (15, 2)],
  term ((69283840 : Rat) / 110226591) [(5, 1), (11, 1), (14, 1), (15, 2)],
  term ((-34641920 : Rat) / 110226591) [(5, 1), (11, 1), (15, 2)],
  term ((-69283840 : Rat) / 110226591) [(5, 1), (11, 2), (15, 3)],
  term ((34641920 : Rat) / 110226591) [(5, 1), (11, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 238 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0238_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0238
        rs_R009_ueqv_R009NNNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_29_0238 := by
  native_decide

/-- Coefficient term 239 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0239 : Poly :=
[
  term ((4640 : Rat) / 201) [(5, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 239 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0239 : Poly :=
[
  term ((9280 : Rat) / 201) [(5, 1), (10, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-4640 : Rat) / 201) [(5, 1), (10, 2), (11, 1), (15, 2), (16, 1)],
  term ((-9280 : Rat) / 201) [(5, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((4640 : Rat) / 201) [(5, 1), (11, 1), (15, 2), (16, 1)],
  term ((9280 : Rat) / 201) [(5, 1), (11, 2), (15, 3), (16, 1)],
  term ((-4640 : Rat) / 201) [(5, 1), (11, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 239 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0239_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0239
        rs_R009_ueqv_R009NNNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_29_0239 := by
  native_decide

/-- Coefficient term 240 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0240 : Poly :=
[
  term ((405093715256 : Rat) / 24800982975) [(5, 1), (11, 1), (16, 1)]
]

/-- Partial product 240 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0240 : Poly :=
[
  term ((810187430512 : Rat) / 24800982975) [(5, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-405093715256 : Rat) / 24800982975) [(5, 1), (10, 2), (11, 1), (16, 1)],
  term ((-810187430512 : Rat) / 24800982975) [(5, 1), (11, 1), (14, 1), (16, 1)],
  term ((405093715256 : Rat) / 24800982975) [(5, 1), (11, 1), (16, 1)],
  term ((810187430512 : Rat) / 24800982975) [(5, 1), (11, 2), (15, 1), (16, 1)],
  term ((-405093715256 : Rat) / 24800982975) [(5, 1), (11, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 240 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0240_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0240
        rs_R009_ueqv_R009NNNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_29_0240 := by
  native_decide

/-- Coefficient term 241 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0241 : Poly :=
[
  term ((-19496960 : Rat) / 110226591) [(5, 1), (11, 2), (14, 1), (15, 1)]
]

/-- Partial product 241 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0241 : Poly :=
[
  term ((-38993920 : Rat) / 110226591) [(5, 1), (10, 1), (11, 2), (14, 2), (15, 1)],
  term ((19496960 : Rat) / 110226591) [(5, 1), (10, 2), (11, 2), (14, 1), (15, 1)],
  term ((-19496960 : Rat) / 110226591) [(5, 1), (11, 2), (14, 1), (15, 1)],
  term ((38993920 : Rat) / 110226591) [(5, 1), (11, 2), (14, 2), (15, 1)],
  term ((-38993920 : Rat) / 110226591) [(5, 1), (11, 3), (14, 1), (15, 2)],
  term ((19496960 : Rat) / 110226591) [(5, 1), (11, 4), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 241 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0241_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0241
        rs_R009_ueqv_R009NNNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_29_0241 := by
  native_decide

/-- Coefficient term 242 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0242 : Poly :=
[
  term ((19496960 : Rat) / 110226591) [(5, 1), (11, 2), (15, 1)]
]

/-- Partial product 242 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0242 : Poly :=
[
  term ((38993920 : Rat) / 110226591) [(5, 1), (10, 1), (11, 2), (14, 1), (15, 1)],
  term ((-19496960 : Rat) / 110226591) [(5, 1), (10, 2), (11, 2), (15, 1)],
  term ((-38993920 : Rat) / 110226591) [(5, 1), (11, 2), (14, 1), (15, 1)],
  term ((19496960 : Rat) / 110226591) [(5, 1), (11, 2), (15, 1)],
  term ((38993920 : Rat) / 110226591) [(5, 1), (11, 3), (15, 2)],
  term ((-19496960 : Rat) / 110226591) [(5, 1), (11, 4), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 242 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0242_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0242
        rs_R009_ueqv_R009NNNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_29_0242 := by
  native_decide

/-- Coefficient term 243 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0243 : Poly :=
[
  term ((446586672 : Rat) / 12247399) [(5, 1), (12, 1), (13, 1)]
]

/-- Partial product 243 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0243 : Poly :=
[
  term ((893173344 : Rat) / 12247399) [(5, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((-446586672 : Rat) / 12247399) [(5, 1), (10, 2), (12, 1), (13, 1)],
  term ((893173344 : Rat) / 12247399) [(5, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-446586672 : Rat) / 12247399) [(5, 1), (11, 2), (12, 1), (13, 1)],
  term ((446586672 : Rat) / 12247399) [(5, 1), (12, 1), (13, 1)],
  term ((-893173344 : Rat) / 12247399) [(5, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 243 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0243_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0243
        rs_R009_ueqv_R009NNNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_29_0243 := by
  native_decide

/-- Coefficient term 244 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0244 : Poly :=
[
  term ((-19693800 : Rat) / 12247399) [(5, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 244 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0244 : Poly :=
[
  term ((-39387600 : Rat) / 12247399) [(5, 1), (10, 1), (12, 1), (13, 1), (14, 2)],
  term ((19693800 : Rat) / 12247399) [(5, 1), (10, 2), (12, 1), (13, 1), (14, 1)],
  term ((-39387600 : Rat) / 12247399) [(5, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((19693800 : Rat) / 12247399) [(5, 1), (11, 2), (12, 1), (13, 1), (14, 1)],
  term ((-19693800 : Rat) / 12247399) [(5, 1), (12, 1), (13, 1), (14, 1)],
  term ((39387600 : Rat) / 12247399) [(5, 1), (12, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 244 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0244_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0244
        rs_R009_ueqv_R009NNNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_29_0244 := by
  native_decide

/-- Coefficient term 245 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0245 : Poly :=
[
  term ((48677492 : Rat) / 12247399) [(5, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 245 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0245 : Poly :=
[
  term ((97354984 : Rat) / 12247399) [(5, 1), (10, 1), (12, 1), (14, 2), (15, 1)],
  term ((-48677492 : Rat) / 12247399) [(5, 1), (10, 2), (12, 1), (14, 1), (15, 1)],
  term ((97354984 : Rat) / 12247399) [(5, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((-48677492 : Rat) / 12247399) [(5, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((48677492 : Rat) / 12247399) [(5, 1), (12, 1), (14, 1), (15, 1)],
  term ((-97354984 : Rat) / 12247399) [(5, 1), (12, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 245 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0245_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0245
        rs_R009_ueqv_R009NNNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_29_0245 := by
  native_decide

/-- Coefficient term 246 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0246 : Poly :=
[
  term ((-8413798244 : Rat) / 110226591) [(5, 1), (12, 1), (15, 1)]
]

/-- Partial product 246 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0246 : Poly :=
[
  term ((-16827596488 : Rat) / 110226591) [(5, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((8413798244 : Rat) / 110226591) [(5, 1), (10, 2), (12, 1), (15, 1)],
  term ((-16827596488 : Rat) / 110226591) [(5, 1), (11, 1), (12, 1), (15, 2)],
  term ((8413798244 : Rat) / 110226591) [(5, 1), (11, 2), (12, 1), (15, 1)],
  term ((16827596488 : Rat) / 110226591) [(5, 1), (12, 1), (14, 1), (15, 1)],
  term ((-8413798244 : Rat) / 110226591) [(5, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 246 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0246_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0246
        rs_R009_ueqv_R009NNNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_29_0246 := by
  native_decide

/-- Coefficient term 247 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0247 : Poly :=
[
  term ((-126 : Rat) / 67) [(5, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 247 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0247 : Poly :=
[
  term ((-252 : Rat) / 67) [(5, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((126 : Rat) / 67) [(5, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((-252 : Rat) / 67) [(5, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((126 : Rat) / 67) [(5, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((252 : Rat) / 67) [(5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-126 : Rat) / 67) [(5, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 247 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0247_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0247
        rs_R009_ueqv_R009NNNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_29_0247 := by
  native_decide

/-- Coefficient term 248 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0248 : Poly :=
[
  term ((-202536657421 : Rat) / 6981017430) [(5, 1), (13, 1)]
]

/-- Partial product 248 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0248 : Poly :=
[
  term ((-202536657421 : Rat) / 3490508715) [(5, 1), (10, 1), (13, 1), (14, 1)],
  term ((202536657421 : Rat) / 6981017430) [(5, 1), (10, 2), (13, 1)],
  term ((-202536657421 : Rat) / 3490508715) [(5, 1), (11, 1), (13, 1), (15, 1)],
  term ((202536657421 : Rat) / 6981017430) [(5, 1), (11, 2), (13, 1)],
  term ((-202536657421 : Rat) / 6981017430) [(5, 1), (13, 1)],
  term ((202536657421 : Rat) / 3490508715) [(5, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 248 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0248_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0248
        rs_R009_ueqv_R009NNNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_29_0248 := by
  native_decide

/-- Coefficient term 249 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0249 : Poly :=
[
  term ((-49562765 : Rat) / 12247399) [(5, 1), (13, 1), (14, 1)]
]

/-- Partial product 249 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0249 : Poly :=
[
  term ((-99125530 : Rat) / 12247399) [(5, 1), (10, 1), (13, 1), (14, 2)],
  term ((49562765 : Rat) / 12247399) [(5, 1), (10, 2), (13, 1), (14, 1)],
  term ((-99125530 : Rat) / 12247399) [(5, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((49562765 : Rat) / 12247399) [(5, 1), (11, 2), (13, 1), (14, 1)],
  term ((-49562765 : Rat) / 12247399) [(5, 1), (13, 1), (14, 1)],
  term ((99125530 : Rat) / 12247399) [(5, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 249 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0249_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0249
        rs_R009_ueqv_R009NNNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_29_0249 := by
  native_decide

/-- Coefficient term 250 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0250 : Poly :=
[
  term ((685440 : Rat) / 12247399) [(5, 1), (13, 1), (14, 1), (15, 2)]
]

/-- Partial product 250 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0250 : Poly :=
[
  term ((1370880 : Rat) / 12247399) [(5, 1), (10, 1), (13, 1), (14, 2), (15, 2)],
  term ((-685440 : Rat) / 12247399) [(5, 1), (10, 2), (13, 1), (14, 1), (15, 2)],
  term ((1370880 : Rat) / 12247399) [(5, 1), (11, 1), (13, 1), (14, 1), (15, 3)],
  term ((-685440 : Rat) / 12247399) [(5, 1), (11, 2), (13, 1), (14, 1), (15, 2)],
  term ((685440 : Rat) / 12247399) [(5, 1), (13, 1), (14, 1), (15, 2)],
  term ((-1370880 : Rat) / 12247399) [(5, 1), (13, 1), (14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 250 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0250_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0250
        rs_R009_ueqv_R009NNNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_29_0250 := by
  native_decide

/-- Coefficient term 251 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0251 : Poly :=
[
  term ((-3229466429 : Rat) / 918554925) [(5, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 251 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0251 : Poly :=
[
  term ((-6458932858 : Rat) / 918554925) [(5, 1), (10, 1), (13, 1), (14, 2), (16, 1)],
  term ((3229466429 : Rat) / 918554925) [(5, 1), (10, 2), (13, 1), (14, 1), (16, 1)],
  term ((-6458932858 : Rat) / 918554925) [(5, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((3229466429 : Rat) / 918554925) [(5, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((-3229466429 : Rat) / 918554925) [(5, 1), (13, 1), (14, 1), (16, 1)],
  term ((6458932858 : Rat) / 918554925) [(5, 1), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 251 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0251_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0251
        rs_R009_ueqv_R009NNNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_29_0251 := by
  native_decide

/-- Coefficient term 252 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0252 : Poly :=
[
  term ((78603420 : Rat) / 12247399) [(5, 1), (13, 1), (14, 2)]
]

/-- Partial product 252 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0252 : Poly :=
[
  term ((157206840 : Rat) / 12247399) [(5, 1), (10, 1), (13, 1), (14, 3)],
  term ((-78603420 : Rat) / 12247399) [(5, 1), (10, 2), (13, 1), (14, 2)],
  term ((157206840 : Rat) / 12247399) [(5, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((-78603420 : Rat) / 12247399) [(5, 1), (11, 2), (13, 1), (14, 2)],
  term ((78603420 : Rat) / 12247399) [(5, 1), (13, 1), (14, 2)],
  term ((-157206840 : Rat) / 12247399) [(5, 1), (13, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 252 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0252_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0252
        rs_R009_ueqv_R009NNNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_29_0252 := by
  native_decide

/-- Coefficient term 253 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0253 : Poly :=
[
  term ((234556480 : Rat) / 110226591) [(5, 1), (13, 1), (15, 2)]
]

/-- Partial product 253 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0253 : Poly :=
[
  term ((469112960 : Rat) / 110226591) [(5, 1), (10, 1), (13, 1), (14, 1), (15, 2)],
  term ((-234556480 : Rat) / 110226591) [(5, 1), (10, 2), (13, 1), (15, 2)],
  term ((469112960 : Rat) / 110226591) [(5, 1), (11, 1), (13, 1), (15, 3)],
  term ((-234556480 : Rat) / 110226591) [(5, 1), (11, 2), (13, 1), (15, 2)],
  term ((-469112960 : Rat) / 110226591) [(5, 1), (13, 1), (14, 1), (15, 2)],
  term ((234556480 : Rat) / 110226591) [(5, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 253 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0253_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0253
        rs_R009_ueqv_R009NNNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_29_0253 := by
  native_decide

/-- Coefficient term 254 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0254 : Poly :=
[
  term ((3229466429 : Rat) / 918554925) [(5, 1), (13, 1), (16, 1)]
]

/-- Partial product 254 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0254 : Poly :=
[
  term ((6458932858 : Rat) / 918554925) [(5, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3229466429 : Rat) / 918554925) [(5, 1), (10, 2), (13, 1), (16, 1)],
  term ((6458932858 : Rat) / 918554925) [(5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3229466429 : Rat) / 918554925) [(5, 1), (11, 2), (13, 1), (16, 1)],
  term ((-6458932858 : Rat) / 918554925) [(5, 1), (13, 1), (14, 1), (16, 1)],
  term ((3229466429 : Rat) / 918554925) [(5, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 254 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0254_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0254
        rs_R009_ueqv_R009NNNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_29_0254 := by
  native_decide

/-- Coefficient term 255 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0255 : Poly :=
[
  term ((-12566400 : Rat) / 12247399) [(5, 1), (13, 2), (15, 1)]
]

/-- Partial product 255 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0255 : Poly :=
[
  term ((-25132800 : Rat) / 12247399) [(5, 1), (10, 1), (13, 2), (14, 1), (15, 1)],
  term ((12566400 : Rat) / 12247399) [(5, 1), (10, 2), (13, 2), (15, 1)],
  term ((-25132800 : Rat) / 12247399) [(5, 1), (11, 1), (13, 2), (15, 2)],
  term ((12566400 : Rat) / 12247399) [(5, 1), (11, 2), (13, 2), (15, 1)],
  term ((25132800 : Rat) / 12247399) [(5, 1), (13, 2), (14, 1), (15, 1)],
  term ((-12566400 : Rat) / 12247399) [(5, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 255 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0255_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0255
        rs_R009_ueqv_R009NNNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_29_0255 := by
  native_decide

/-- Coefficient term 256 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0256 : Poly :=
[
  term ((2911479943 : Rat) / 330679773) [(5, 1), (14, 1), (15, 1)]
]

/-- Partial product 256 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0256 : Poly :=
[
  term ((5822959886 : Rat) / 330679773) [(5, 1), (10, 1), (14, 2), (15, 1)],
  term ((-2911479943 : Rat) / 330679773) [(5, 1), (10, 2), (14, 1), (15, 1)],
  term ((5822959886 : Rat) / 330679773) [(5, 1), (11, 1), (14, 1), (15, 2)],
  term ((-2911479943 : Rat) / 330679773) [(5, 1), (11, 2), (14, 1), (15, 1)],
  term ((2911479943 : Rat) / 330679773) [(5, 1), (14, 1), (15, 1)],
  term ((-5822959886 : Rat) / 330679773) [(5, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 256 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0256_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0256
        rs_R009_ueqv_R009NNNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_29_0256 := by
  native_decide

/-- Coefficient term 257 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0257 : Poly :=
[
  term ((41282089588 : Rat) / 24800982975) [(5, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 257 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0257 : Poly :=
[
  term ((82564179176 : Rat) / 24800982975) [(5, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((-41282089588 : Rat) / 24800982975) [(5, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((82564179176 : Rat) / 24800982975) [(5, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-41282089588 : Rat) / 24800982975) [(5, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((41282089588 : Rat) / 24800982975) [(5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-82564179176 : Rat) / 24800982975) [(5, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 257 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0257_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0257
        rs_R009_ueqv_R009NNNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_29_0257 := by
  native_decide

/-- Coefficient term 258 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0258 : Poly :=
[
  term ((-4395520 : Rat) / 36742197) [(5, 1), (14, 1), (15, 3)]
]

/-- Partial product 258 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0258 : Poly :=
[
  term ((-8791040 : Rat) / 36742197) [(5, 1), (10, 1), (14, 2), (15, 3)],
  term ((4395520 : Rat) / 36742197) [(5, 1), (10, 2), (14, 1), (15, 3)],
  term ((-8791040 : Rat) / 36742197) [(5, 1), (11, 1), (14, 1), (15, 4)],
  term ((4395520 : Rat) / 36742197) [(5, 1), (11, 2), (14, 1), (15, 3)],
  term ((-4395520 : Rat) / 36742197) [(5, 1), (14, 1), (15, 3)],
  term ((8791040 : Rat) / 36742197) [(5, 1), (14, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 258 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0258_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0258
        rs_R009_ueqv_R009NNNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_29_0258 := by
  native_decide

/-- Coefficient term 259 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0259 : Poly :=
[
  term ((-1512180080 : Rat) / 110226591) [(5, 1), (14, 2), (15, 1)]
]

/-- Partial product 259 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0259 : Poly :=
[
  term ((-3024360160 : Rat) / 110226591) [(5, 1), (10, 1), (14, 3), (15, 1)],
  term ((1512180080 : Rat) / 110226591) [(5, 1), (10, 2), (14, 2), (15, 1)],
  term ((-3024360160 : Rat) / 110226591) [(5, 1), (11, 1), (14, 2), (15, 2)],
  term ((1512180080 : Rat) / 110226591) [(5, 1), (11, 2), (14, 2), (15, 1)],
  term ((-1512180080 : Rat) / 110226591) [(5, 1), (14, 2), (15, 1)],
  term ((3024360160 : Rat) / 110226591) [(5, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 259 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0259_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0259
        rs_R009_ueqv_R009NNNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_29_0259 := by
  native_decide

/-- Coefficient term 260 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0260 : Poly :=
[
  term ((5751792144616 : Rat) / 94243735305) [(5, 1), (15, 1)]
]

/-- Partial product 260 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0260 : Poly :=
[
  term ((11503584289232 : Rat) / 94243735305) [(5, 1), (10, 1), (14, 1), (15, 1)],
  term ((-5751792144616 : Rat) / 94243735305) [(5, 1), (10, 2), (15, 1)],
  term ((11503584289232 : Rat) / 94243735305) [(5, 1), (11, 1), (15, 2)],
  term ((-5751792144616 : Rat) / 94243735305) [(5, 1), (11, 2), (15, 1)],
  term ((-11503584289232 : Rat) / 94243735305) [(5, 1), (14, 1), (15, 1)],
  term ((5751792144616 : Rat) / 94243735305) [(5, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 260 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0260_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0260
        rs_R009_ueqv_R009NNNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_29_0260 := by
  native_decide

/-- Coefficient term 261 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0261 : Poly :=
[
  term ((60636377762 : Rat) / 24800982975) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 261 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0261 : Poly :=
[
  term ((121272755524 : Rat) / 24800982975) [(5, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-60636377762 : Rat) / 24800982975) [(5, 1), (10, 2), (15, 1), (16, 1)],
  term ((121272755524 : Rat) / 24800982975) [(5, 1), (11, 1), (15, 2), (16, 1)],
  term ((-60636377762 : Rat) / 24800982975) [(5, 1), (11, 2), (15, 1), (16, 1)],
  term ((-121272755524 : Rat) / 24800982975) [(5, 1), (14, 1), (15, 1), (16, 1)],
  term ((60636377762 : Rat) / 24800982975) [(5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 261 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0261_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0261
        rs_R009_ueqv_R009NNNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_29_0261 := by
  native_decide

/-- Coefficient term 262 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0262 : Poly :=
[
  term ((15384320 : Rat) / 110226591) [(5, 1), (15, 3)]
]

/-- Partial product 262 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0262 : Poly :=
[
  term ((30768640 : Rat) / 110226591) [(5, 1), (10, 1), (14, 1), (15, 3)],
  term ((-15384320 : Rat) / 110226591) [(5, 1), (10, 2), (15, 3)],
  term ((30768640 : Rat) / 110226591) [(5, 1), (11, 1), (15, 4)],
  term ((-15384320 : Rat) / 110226591) [(5, 1), (11, 2), (15, 3)],
  term ((-30768640 : Rat) / 110226591) [(5, 1), (14, 1), (15, 3)],
  term ((15384320 : Rat) / 110226591) [(5, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 262 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0262_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0262
        rs_R009_ueqv_R009NNNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_29_0262 := by
  native_decide

/-- Coefficient term 263 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0263 : Poly :=
[
  term ((-507 : Rat) / 268) [(7, 1), (9, 1)]
]

/-- Partial product 263 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0263 : Poly :=
[
  term ((-507 : Rat) / 268) [(7, 1), (9, 1)],
  term ((-507 : Rat) / 134) [(7, 1), (9, 1), (10, 1), (14, 1)],
  term ((507 : Rat) / 268) [(7, 1), (9, 1), (10, 2)],
  term ((-507 : Rat) / 134) [(7, 1), (9, 1), (11, 1), (15, 1)],
  term ((507 : Rat) / 268) [(7, 1), (9, 1), (11, 2)],
  term ((507 : Rat) / 134) [(7, 1), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 263 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0263_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0263
        rs_R009_ueqv_R009NNNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_29_0263 := by
  native_decide

/-- Coefficient term 264 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0264 : Poly :=
[
  term ((99460760 : Rat) / 12247399) [(7, 1), (9, 1), (11, 1), (13, 1)]
]

/-- Partial product 264 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0264 : Poly :=
[
  term ((198921520 : Rat) / 12247399) [(7, 1), (9, 1), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((-99460760 : Rat) / 12247399) [(7, 1), (9, 1), (10, 2), (11, 1), (13, 1)],
  term ((99460760 : Rat) / 12247399) [(7, 1), (9, 1), (11, 1), (13, 1)],
  term ((-198921520 : Rat) / 12247399) [(7, 1), (9, 1), (11, 1), (13, 1), (14, 1)],
  term ((198921520 : Rat) / 12247399) [(7, 1), (9, 1), (11, 2), (13, 1), (15, 1)],
  term ((-99460760 : Rat) / 12247399) [(7, 1), (9, 1), (11, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 264 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0264_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0264
        rs_R009_ueqv_R009NNNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_29_0264 := by
  native_decide

/-- Coefficient term 265 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0265 : Poly :=
[
  term ((-26417483816414 : Rat) / 471218676525) [(7, 1), (9, 1), (11, 1), (15, 1)]
]

/-- Partial product 265 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0265 : Poly :=
[
  term ((-52834967632828 : Rat) / 471218676525) [(7, 1), (9, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((26417483816414 : Rat) / 471218676525) [(7, 1), (9, 1), (10, 2), (11, 1), (15, 1)],
  term ((52834967632828 : Rat) / 471218676525) [(7, 1), (9, 1), (11, 1), (14, 1), (15, 1)],
  term ((-26417483816414 : Rat) / 471218676525) [(7, 1), (9, 1), (11, 1), (15, 1)],
  term ((-52834967632828 : Rat) / 471218676525) [(7, 1), (9, 1), (11, 2), (15, 2)],
  term ((26417483816414 : Rat) / 471218676525) [(7, 1), (9, 1), (11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 265 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0265_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0265
        rs_R009_ueqv_R009NNNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_29_0265 := by
  native_decide

/-- Coefficient term 266 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0266 : Poly :=
[
  term ((1372118088544 : Rat) / 157072892175) [(7, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 266 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0266 : Poly :=
[
  term ((2744236177088 : Rat) / 157072892175) [(7, 1), (9, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1372118088544 : Rat) / 157072892175) [(7, 1), (9, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-2744236177088 : Rat) / 157072892175) [(7, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((1372118088544 : Rat) / 157072892175) [(7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((2744236177088 : Rat) / 157072892175) [(7, 1), (9, 1), (11, 2), (15, 2), (16, 1)],
  term ((-1372118088544 : Rat) / 157072892175) [(7, 1), (9, 1), (11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 266 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0266_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0266
        rs_R009_ueqv_R009NNNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_29_0266 := by
  native_decide

/-- Coefficient term 267 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0267 : Poly :=
[
  term ((6365488640 : Rat) / 330679773) [(7, 1), (9, 1), (11, 2)]
]

/-- Partial product 267 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0267 : Poly :=
[
  term ((12730977280 : Rat) / 330679773) [(7, 1), (9, 1), (10, 1), (11, 2), (14, 1)],
  term ((-6365488640 : Rat) / 330679773) [(7, 1), (9, 1), (10, 2), (11, 2)],
  term ((6365488640 : Rat) / 330679773) [(7, 1), (9, 1), (11, 2)],
  term ((-12730977280 : Rat) / 330679773) [(7, 1), (9, 1), (11, 2), (14, 1)],
  term ((12730977280 : Rat) / 330679773) [(7, 1), (9, 1), (11, 3), (15, 1)],
  term ((-6365488640 : Rat) / 330679773) [(7, 1), (9, 1), (11, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 267 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0267_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0267
        rs_R009_ueqv_R009NNNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_29_0267 := by
  native_decide

/-- Coefficient term 268 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0268 : Poly :=
[
  term ((-260125981976 : Rat) / 17452543575) [(7, 1), (9, 1), (13, 1), (15, 1)]
]

/-- Partial product 268 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0268 : Poly :=
[
  term ((-520251963952 : Rat) / 17452543575) [(7, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((260125981976 : Rat) / 17452543575) [(7, 1), (9, 1), (10, 2), (13, 1), (15, 1)],
  term ((-520251963952 : Rat) / 17452543575) [(7, 1), (9, 1), (11, 1), (13, 1), (15, 2)],
  term ((260125981976 : Rat) / 17452543575) [(7, 1), (9, 1), (11, 2), (13, 1), (15, 1)],
  term ((520251963952 : Rat) / 17452543575) [(7, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((-260125981976 : Rat) / 17452543575) [(7, 1), (9, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 268 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0268_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0268
        rs_R009_ueqv_R009NNNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_29_0268 := by
  native_decide

/-- Coefficient term 269 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0269 : Poly :=
[
  term ((42878690267 : Rat) / 11635029050) [(7, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 269 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0269 : Poly :=
[
  term ((42878690267 : Rat) / 5817514525) [(7, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-42878690267 : Rat) / 11635029050) [(7, 1), (9, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((42878690267 : Rat) / 5817514525) [(7, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-42878690267 : Rat) / 11635029050) [(7, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-42878690267 : Rat) / 5817514525) [(7, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((42878690267 : Rat) / 11635029050) [(7, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 269 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0269_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0269
        rs_R009_ueqv_R009NNNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_29_0269 := by
  native_decide

/-- Coefficient term 270 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0270 : Poly :=
[
  term ((392 : Rat) / 67) [(7, 1), (9, 1), (14, 1)]
]

/-- Partial product 270 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0270 : Poly :=
[
  term ((784 : Rat) / 67) [(7, 1), (9, 1), (10, 1), (14, 2)],
  term ((-392 : Rat) / 67) [(7, 1), (9, 1), (10, 2), (14, 1)],
  term ((784 : Rat) / 67) [(7, 1), (9, 1), (11, 1), (14, 1), (15, 1)],
  term ((-392 : Rat) / 67) [(7, 1), (9, 1), (11, 2), (14, 1)],
  term ((392 : Rat) / 67) [(7, 1), (9, 1), (14, 1)],
  term ((-784 : Rat) / 67) [(7, 1), (9, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 270 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0270_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0270
        rs_R009_ueqv_R009NNNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_29_0270 := by
  native_decide

/-- Coefficient term 271 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0271 : Poly :=
[
  term ((16063263688672 : Rat) / 471218676525) [(7, 1), (9, 1), (15, 2)]
]

/-- Partial product 271 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0271 : Poly :=
[
  term ((32126527377344 : Rat) / 471218676525) [(7, 1), (9, 1), (10, 1), (14, 1), (15, 2)],
  term ((-16063263688672 : Rat) / 471218676525) [(7, 1), (9, 1), (10, 2), (15, 2)],
  term ((32126527377344 : Rat) / 471218676525) [(7, 1), (9, 1), (11, 1), (15, 3)],
  term ((-16063263688672 : Rat) / 471218676525) [(7, 1), (9, 1), (11, 2), (15, 2)],
  term ((-32126527377344 : Rat) / 471218676525) [(7, 1), (9, 1), (14, 1), (15, 2)],
  term ((16063263688672 : Rat) / 471218676525) [(7, 1), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 271 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0271_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0271
        rs_R009_ueqv_R009NNNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_29_0271 := by
  native_decide

/-- Coefficient term 272 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0272 : Poly :=
[
  term ((-1678098337262 : Rat) / 157072892175) [(7, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 272 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0272 : Poly :=
[
  term ((-3356196674524 : Rat) / 157072892175) [(7, 1), (9, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((1678098337262 : Rat) / 157072892175) [(7, 1), (9, 1), (10, 2), (15, 2), (16, 1)],
  term ((-3356196674524 : Rat) / 157072892175) [(7, 1), (9, 1), (11, 1), (15, 3), (16, 1)],
  term ((1678098337262 : Rat) / 157072892175) [(7, 1), (9, 1), (11, 2), (15, 2), (16, 1)],
  term ((3356196674524 : Rat) / 157072892175) [(7, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1678098337262 : Rat) / 157072892175) [(7, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 272 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0272_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0272
        rs_R009_ueqv_R009NNNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_29_0272 := by
  native_decide

/-- Coefficient term 273 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0273 : Poly :=
[
  term ((11025602336 : Rat) / 18848747061) [(7, 1), (9, 2), (11, 1)]
]

/-- Partial product 273 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0273 : Poly :=
[
  term ((22051204672 : Rat) / 18848747061) [(7, 1), (9, 2), (10, 1), (11, 1), (14, 1)],
  term ((-11025602336 : Rat) / 18848747061) [(7, 1), (9, 2), (10, 2), (11, 1)],
  term ((11025602336 : Rat) / 18848747061) [(7, 1), (9, 2), (11, 1)],
  term ((-22051204672 : Rat) / 18848747061) [(7, 1), (9, 2), (11, 1), (14, 1)],
  term ((22051204672 : Rat) / 18848747061) [(7, 1), (9, 2), (11, 2), (15, 1)],
  term ((-11025602336 : Rat) / 18848747061) [(7, 1), (9, 2), (11, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 273 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0273_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0273
        rs_R009_ueqv_R009NNNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_29_0273 := by
  native_decide

/-- Coefficient term 274 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0274 : Poly :=
[
  term ((344550073 : Rat) / 1396203486) [(7, 1), (9, 2), (13, 1)]
]

/-- Partial product 274 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0274 : Poly :=
[
  term ((344550073 : Rat) / 698101743) [(7, 1), (9, 2), (10, 1), (13, 1), (14, 1)],
  term ((-344550073 : Rat) / 1396203486) [(7, 1), (9, 2), (10, 2), (13, 1)],
  term ((344550073 : Rat) / 698101743) [(7, 1), (9, 2), (11, 1), (13, 1), (15, 1)],
  term ((-344550073 : Rat) / 1396203486) [(7, 1), (9, 2), (11, 2), (13, 1)],
  term ((344550073 : Rat) / 1396203486) [(7, 1), (9, 2), (13, 1)],
  term ((-344550073 : Rat) / 698101743) [(7, 1), (9, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 274 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0274_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0274
        rs_R009_ueqv_R009NNNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_29_0274 := by
  native_decide

/-- Coefficient term 275 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0275 : Poly :=
[
  term ((-19226441917 : Rat) / 18848747061) [(7, 1), (9, 2), (15, 1)]
]

/-- Partial product 275 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0275 : Poly :=
[
  term ((-38452883834 : Rat) / 18848747061) [(7, 1), (9, 2), (10, 1), (14, 1), (15, 1)],
  term ((19226441917 : Rat) / 18848747061) [(7, 1), (9, 2), (10, 2), (15, 1)],
  term ((-38452883834 : Rat) / 18848747061) [(7, 1), (9, 2), (11, 1), (15, 2)],
  term ((19226441917 : Rat) / 18848747061) [(7, 1), (9, 2), (11, 2), (15, 1)],
  term ((38452883834 : Rat) / 18848747061) [(7, 1), (9, 2), (14, 1), (15, 1)],
  term ((-19226441917 : Rat) / 18848747061) [(7, 1), (9, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 275 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0275_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0275
        rs_R009_ueqv_R009NNNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_29_0275 := by
  native_decide

/-- Coefficient term 276 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0276 : Poly :=
[
  term ((-488457671296 : Rat) / 31414578435) [(7, 1), (10, 1), (11, 1)]
]

/-- Partial product 276 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0276 : Poly :=
[
  term ((-488457671296 : Rat) / 31414578435) [(7, 1), (10, 1), (11, 1)],
  term ((976915342592 : Rat) / 31414578435) [(7, 1), (10, 1), (11, 1), (14, 1)],
  term ((-976915342592 : Rat) / 31414578435) [(7, 1), (10, 1), (11, 2), (15, 1)],
  term ((488457671296 : Rat) / 31414578435) [(7, 1), (10, 1), (11, 3)],
  term ((-976915342592 : Rat) / 31414578435) [(7, 1), (10, 2), (11, 1), (14, 1)],
  term ((488457671296 : Rat) / 31414578435) [(7, 1), (10, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 276 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0276_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0276
        rs_R009_ueqv_R009NNNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_29_0276 := by
  native_decide

/-- Coefficient term 277 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0277 : Poly :=
[
  term ((-7632151114 : Rat) / 1163502905) [(7, 1), (10, 1), (13, 1)]
]

/-- Partial product 277 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0277 : Poly :=
[
  term ((-15264302228 : Rat) / 1163502905) [(7, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((7632151114 : Rat) / 1163502905) [(7, 1), (10, 1), (11, 2), (13, 1)],
  term ((-7632151114 : Rat) / 1163502905) [(7, 1), (10, 1), (13, 1)],
  term ((15264302228 : Rat) / 1163502905) [(7, 1), (10, 1), (13, 1), (14, 1)],
  term ((-15264302228 : Rat) / 1163502905) [(7, 1), (10, 2), (13, 1), (14, 1)],
  term ((7632151114 : Rat) / 1163502905) [(7, 1), (10, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 277 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0277_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0277
        rs_R009_ueqv_R009NNNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_29_0277 := by
  native_decide

/-- Coefficient term 278 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0278 : Poly :=
[
  term ((440484150008 : Rat) / 31414578435) [(7, 1), (10, 1), (15, 1)]
]

/-- Partial product 278 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0278 : Poly :=
[
  term ((880968300016 : Rat) / 31414578435) [(7, 1), (10, 1), (11, 1), (15, 2)],
  term ((-440484150008 : Rat) / 31414578435) [(7, 1), (10, 1), (11, 2), (15, 1)],
  term ((-880968300016 : Rat) / 31414578435) [(7, 1), (10, 1), (14, 1), (15, 1)],
  term ((440484150008 : Rat) / 31414578435) [(7, 1), (10, 1), (15, 1)],
  term ((880968300016 : Rat) / 31414578435) [(7, 1), (10, 2), (14, 1), (15, 1)],
  term ((-440484150008 : Rat) / 31414578435) [(7, 1), (10, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 278 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0278_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0278
        rs_R009_ueqv_R009NNNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_29_0278 := by
  native_decide

/-- Coefficient term 279 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0279 : Poly :=
[
  term ((32410934519977 : Rat) / 471218676525) [(7, 1), (11, 1)]
]

/-- Partial product 279 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0279 : Poly :=
[
  term ((64821869039954 : Rat) / 471218676525) [(7, 1), (10, 1), (11, 1), (14, 1)],
  term ((-32410934519977 : Rat) / 471218676525) [(7, 1), (10, 2), (11, 1)],
  term ((32410934519977 : Rat) / 471218676525) [(7, 1), (11, 1)],
  term ((-64821869039954 : Rat) / 471218676525) [(7, 1), (11, 1), (14, 1)],
  term ((64821869039954 : Rat) / 471218676525) [(7, 1), (11, 2), (15, 1)],
  term ((-32410934519977 : Rat) / 471218676525) [(7, 1), (11, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 279 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0279_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0279
        rs_R009_ueqv_R009NNNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_29_0279 := by
  native_decide

/-- Coefficient term 280 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0280 : Poly :=
[
  term ((11173375808 : Rat) / 330679773) [(7, 1), (11, 1), (12, 1)]
]

/-- Partial product 280 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0280 : Poly :=
[
  term ((22346751616 : Rat) / 330679773) [(7, 1), (10, 1), (11, 1), (12, 1), (14, 1)],
  term ((-11173375808 : Rat) / 330679773) [(7, 1), (10, 2), (11, 1), (12, 1)],
  term ((11173375808 : Rat) / 330679773) [(7, 1), (11, 1), (12, 1)],
  term ((-22346751616 : Rat) / 330679773) [(7, 1), (11, 1), (12, 1), (14, 1)],
  term ((22346751616 : Rat) / 330679773) [(7, 1), (11, 2), (12, 1), (15, 1)],
  term ((-11173375808 : Rat) / 330679773) [(7, 1), (11, 3), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 280 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0280_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0280
        rs_R009_ueqv_R009NNNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_29_0280 := by
  native_decide

/-- Coefficient term 281 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0281 : Poly :=
[
  term ((90576640 : Rat) / 110226591) [(7, 1), (11, 1), (12, 1), (14, 1)]
]

/-- Partial product 281 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0281 : Poly :=
[
  term ((181153280 : Rat) / 110226591) [(7, 1), (10, 1), (11, 1), (12, 1), (14, 2)],
  term ((-90576640 : Rat) / 110226591) [(7, 1), (10, 2), (11, 1), (12, 1), (14, 1)],
  term ((90576640 : Rat) / 110226591) [(7, 1), (11, 1), (12, 1), (14, 1)],
  term ((-181153280 : Rat) / 110226591) [(7, 1), (11, 1), (12, 1), (14, 2)],
  term ((181153280 : Rat) / 110226591) [(7, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((-90576640 : Rat) / 110226591) [(7, 1), (11, 3), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 281 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0281_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0281
        rs_R009_ueqv_R009NNNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_29_0281 := by
  native_decide

/-- Coefficient term 282 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0282 : Poly :=
[
  term ((389939200 : Rat) / 110226591) [(7, 1), (11, 1), (12, 1), (15, 2)]
]

/-- Partial product 282 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0282 : Poly :=
[
  term ((779878400 : Rat) / 110226591) [(7, 1), (10, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((-389939200 : Rat) / 110226591) [(7, 1), (10, 2), (11, 1), (12, 1), (15, 2)],
  term ((-779878400 : Rat) / 110226591) [(7, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((389939200 : Rat) / 110226591) [(7, 1), (11, 1), (12, 1), (15, 2)],
  term ((779878400 : Rat) / 110226591) [(7, 1), (11, 2), (12, 1), (15, 3)],
  term ((-389939200 : Rat) / 110226591) [(7, 1), (11, 3), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 282 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0282_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0282
        rs_R009_ueqv_R009NNNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_29_0282 := by
  native_decide

/-- Coefficient term 283 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0283 : Poly :=
[
  term ((19496960 : Rat) / 110226591) [(7, 1), (11, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 283 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0283 : Poly :=
[
  term ((38993920 : Rat) / 110226591) [(7, 1), (10, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((-19496960 : Rat) / 110226591) [(7, 1), (10, 2), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((19496960 : Rat) / 110226591) [(7, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-38993920 : Rat) / 110226591) [(7, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((38993920 : Rat) / 110226591) [(7, 1), (11, 2), (13, 1), (14, 1), (15, 2)],
  term ((-19496960 : Rat) / 110226591) [(7, 1), (11, 3), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 283 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0283_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0283
        rs_R009_ueqv_R009NNNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_29_0283 := by
  native_decide

/-- Coefficient term 284 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0284 : Poly :=
[
  term ((11728640 : Rat) / 12247399) [(7, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 284 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0284 : Poly :=
[
  term ((23457280 : Rat) / 12247399) [(7, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-11728640 : Rat) / 12247399) [(7, 1), (10, 2), (11, 1), (13, 1), (15, 1)],
  term ((-23457280 : Rat) / 12247399) [(7, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((11728640 : Rat) / 12247399) [(7, 1), (11, 1), (13, 1), (15, 1)],
  term ((23457280 : Rat) / 12247399) [(7, 1), (11, 2), (13, 1), (15, 2)],
  term ((-11728640 : Rat) / 12247399) [(7, 1), (11, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 284 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0284_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0284
        rs_R009_ueqv_R009NNNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_29_0284 := by
  native_decide

/-- Coefficient term 285 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0285 : Poly :=
[
  term ((-6677716192 : Rat) / 918554925) [(7, 1), (11, 1), (14, 1)]
]

/-- Partial product 285 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0285 : Poly :=
[
  term ((-13355432384 : Rat) / 918554925) [(7, 1), (10, 1), (11, 1), (14, 2)],
  term ((6677716192 : Rat) / 918554925) [(7, 1), (10, 2), (11, 1), (14, 1)],
  term ((-6677716192 : Rat) / 918554925) [(7, 1), (11, 1), (14, 1)],
  term ((13355432384 : Rat) / 918554925) [(7, 1), (11, 1), (14, 2)],
  term ((-13355432384 : Rat) / 918554925) [(7, 1), (11, 2), (14, 1), (15, 1)],
  term ((6677716192 : Rat) / 918554925) [(7, 1), (11, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 285 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0285_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0285
        rs_R009_ueqv_R009NNNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_29_0285 := by
  native_decide

/-- Coefficient term 286 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0286 : Poly :=
[
  term ((9748480 : Rat) / 36742197) [(7, 1), (11, 1), (14, 1), (15, 2)]
]

/-- Partial product 286 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0286 : Poly :=
[
  term ((19496960 : Rat) / 36742197) [(7, 1), (10, 1), (11, 1), (14, 2), (15, 2)],
  term ((-9748480 : Rat) / 36742197) [(7, 1), (10, 2), (11, 1), (14, 1), (15, 2)],
  term ((9748480 : Rat) / 36742197) [(7, 1), (11, 1), (14, 1), (15, 2)],
  term ((-19496960 : Rat) / 36742197) [(7, 1), (11, 1), (14, 2), (15, 2)],
  term ((19496960 : Rat) / 36742197) [(7, 1), (11, 2), (14, 1), (15, 3)],
  term ((-9748480 : Rat) / 36742197) [(7, 1), (11, 3), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 286 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0286_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0286
        rs_R009_ueqv_R009NNNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_29_0286 := by
  native_decide

/-- Coefficient term 287 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0287 : Poly :=
[
  term ((51671462864 : Rat) / 8266994325) [(7, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 287 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0287 : Poly :=
[
  term ((103342925728 : Rat) / 8266994325) [(7, 1), (10, 1), (11, 1), (14, 2), (16, 1)],
  term ((-51671462864 : Rat) / 8266994325) [(7, 1), (10, 2), (11, 1), (14, 1), (16, 1)],
  term ((51671462864 : Rat) / 8266994325) [(7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-103342925728 : Rat) / 8266994325) [(7, 1), (11, 1), (14, 2), (16, 1)],
  term ((103342925728 : Rat) / 8266994325) [(7, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-51671462864 : Rat) / 8266994325) [(7, 1), (11, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 287 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0287_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0287
        rs_R009_ueqv_R009NNNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_29_0287 := by
  native_decide

/-- Coefficient term 288 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0288 : Poly :=
[
  term ((-3290739200 : Rat) / 110226591) [(7, 1), (11, 1), (14, 2)]
]

/-- Partial product 288 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0288 : Poly :=
[
  term ((-6581478400 : Rat) / 110226591) [(7, 1), (10, 1), (11, 1), (14, 3)],
  term ((3290739200 : Rat) / 110226591) [(7, 1), (10, 2), (11, 1), (14, 2)],
  term ((-3290739200 : Rat) / 110226591) [(7, 1), (11, 1), (14, 2)],
  term ((6581478400 : Rat) / 110226591) [(7, 1), (11, 1), (14, 3)],
  term ((-6581478400 : Rat) / 110226591) [(7, 1), (11, 2), (14, 2), (15, 1)],
  term ((3290739200 : Rat) / 110226591) [(7, 1), (11, 3), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 288 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0288_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0288
        rs_R009_ueqv_R009NNNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_29_0288 := by
  native_decide

/-- Coefficient term 289 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0289 : Poly :=
[
  term ((-3985667360 : Rat) / 110226591) [(7, 1), (11, 1), (15, 2)]
]

/-- Partial product 289 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0289 : Poly :=
[
  term ((-7971334720 : Rat) / 110226591) [(7, 1), (10, 1), (11, 1), (14, 1), (15, 2)],
  term ((3985667360 : Rat) / 110226591) [(7, 1), (10, 2), (11, 1), (15, 2)],
  term ((7971334720 : Rat) / 110226591) [(7, 1), (11, 1), (14, 1), (15, 2)],
  term ((-3985667360 : Rat) / 110226591) [(7, 1), (11, 1), (15, 2)],
  term ((-7971334720 : Rat) / 110226591) [(7, 1), (11, 2), (15, 3)],
  term ((3985667360 : Rat) / 110226591) [(7, 1), (11, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 289 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0289_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0289
        rs_R009_ueqv_R009NNNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_29_0289 := by
  native_decide

/-- Coefficient term 290 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0290 : Poly :=
[
  term ((-1160 : Rat) / 67) [(7, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 290 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0290 : Poly :=
[
  term ((-2320 : Rat) / 67) [(7, 1), (10, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((1160 : Rat) / 67) [(7, 1), (10, 2), (11, 1), (15, 2), (16, 1)],
  term ((2320 : Rat) / 67) [(7, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1160 : Rat) / 67) [(7, 1), (11, 1), (15, 2), (16, 1)],
  term ((-2320 : Rat) / 67) [(7, 1), (11, 2), (15, 3), (16, 1)],
  term ((1160 : Rat) / 67) [(7, 1), (11, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 290 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0290_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0290
        rs_R009_ueqv_R009NNNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_29_0290 := by
  native_decide

/-- Coefficient term 291 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0291 : Poly :=
[
  term ((-101273428814 : Rat) / 8266994325) [(7, 1), (11, 1), (16, 1)]
]

/-- Partial product 291 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0291 : Poly :=
[
  term ((-202546857628 : Rat) / 8266994325) [(7, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((101273428814 : Rat) / 8266994325) [(7, 1), (10, 2), (11, 1), (16, 1)],
  term ((202546857628 : Rat) / 8266994325) [(7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-101273428814 : Rat) / 8266994325) [(7, 1), (11, 1), (16, 1)],
  term ((-202546857628 : Rat) / 8266994325) [(7, 1), (11, 2), (15, 1), (16, 1)],
  term ((101273428814 : Rat) / 8266994325) [(7, 1), (11, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 291 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0291_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0291
        rs_R009_ueqv_R009NNNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_29_0291 := by
  native_decide

/-- Coefficient term 292 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0292 : Poly :=
[
  term ((48742400 : Rat) / 36742197) [(7, 1), (11, 2), (15, 1)]
]

/-- Partial product 292 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0292 : Poly :=
[
  term ((97484800 : Rat) / 36742197) [(7, 1), (10, 1), (11, 2), (14, 1), (15, 1)],
  term ((-48742400 : Rat) / 36742197) [(7, 1), (10, 2), (11, 2), (15, 1)],
  term ((-97484800 : Rat) / 36742197) [(7, 1), (11, 2), (14, 1), (15, 1)],
  term ((48742400 : Rat) / 36742197) [(7, 1), (11, 2), (15, 1)],
  term ((97484800 : Rat) / 36742197) [(7, 1), (11, 3), (15, 2)],
  term ((-48742400 : Rat) / 36742197) [(7, 1), (11, 4), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 292 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0292_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0292
        rs_R009_ueqv_R009NNNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_29_0292 := by
  native_decide

/-- Coefficient term 293 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0293 : Poly :=
[
  term ((174583997 : Rat) / 12247399) [(7, 1), (12, 1), (13, 1)]
]

/-- Partial product 293 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0293 : Poly :=
[
  term ((349167994 : Rat) / 12247399) [(7, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((-174583997 : Rat) / 12247399) [(7, 1), (10, 2), (12, 1), (13, 1)],
  term ((349167994 : Rat) / 12247399) [(7, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-174583997 : Rat) / 12247399) [(7, 1), (11, 2), (12, 1), (13, 1)],
  term ((174583997 : Rat) / 12247399) [(7, 1), (12, 1), (13, 1)],
  term ((-349167994 : Rat) / 12247399) [(7, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 293 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0293_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0293
        rs_R009_ueqv_R009NNNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_29_0293 := by
  native_decide

/-- Coefficient term 294 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0294 : Poly :=
[
  term ((4245780 : Rat) / 12247399) [(7, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 294 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0294 : Poly :=
[
  term ((8491560 : Rat) / 12247399) [(7, 1), (10, 1), (12, 1), (13, 1), (14, 2)],
  term ((-4245780 : Rat) / 12247399) [(7, 1), (10, 2), (12, 1), (13, 1), (14, 1)],
  term ((8491560 : Rat) / 12247399) [(7, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-4245780 : Rat) / 12247399) [(7, 1), (11, 2), (12, 1), (13, 1), (14, 1)],
  term ((4245780 : Rat) / 12247399) [(7, 1), (12, 1), (13, 1), (14, 1)],
  term ((-8491560 : Rat) / 12247399) [(7, 1), (12, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 294 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0294_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0294
        rs_R009_ueqv_R009NNNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_29_0294 := by
  native_decide

/-- Coefficient term 295 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0295 : Poly :=
[
  term ((18278400 : Rat) / 12247399) [(7, 1), (12, 1), (13, 1), (15, 2)]
]

/-- Partial product 295 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0295 : Poly :=
[
  term ((36556800 : Rat) / 12247399) [(7, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((-18278400 : Rat) / 12247399) [(7, 1), (10, 2), (12, 1), (13, 1), (15, 2)],
  term ((36556800 : Rat) / 12247399) [(7, 1), (11, 1), (12, 1), (13, 1), (15, 3)],
  term ((-18278400 : Rat) / 12247399) [(7, 1), (11, 2), (12, 1), (13, 1), (15, 2)],
  term ((-36556800 : Rat) / 12247399) [(7, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((18278400 : Rat) / 12247399) [(7, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 295 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0295_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0295
        rs_R009_ueqv_R009NNNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_29_0295 := by
  native_decide

/-- Coefficient term 296 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0296 : Poly :=
[
  term ((-81680720 : Rat) / 110226591) [(7, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 296 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0296 : Poly :=
[
  term ((-163361440 : Rat) / 110226591) [(7, 1), (10, 1), (12, 1), (14, 2), (15, 1)],
  term ((81680720 : Rat) / 110226591) [(7, 1), (10, 2), (12, 1), (14, 1), (15, 1)],
  term ((-163361440 : Rat) / 110226591) [(7, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((81680720 : Rat) / 110226591) [(7, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((-81680720 : Rat) / 110226591) [(7, 1), (12, 1), (14, 1), (15, 1)],
  term ((163361440 : Rat) / 110226591) [(7, 1), (12, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 296 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0296_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0296
        rs_R009_ueqv_R009NNNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_29_0296 := by
  native_decide

/-- Coefficient term 297 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0297 : Poly :=
[
  term ((-10164830026 : Rat) / 330679773) [(7, 1), (12, 1), (15, 1)]
]

/-- Partial product 297 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0297 : Poly :=
[
  term ((-20329660052 : Rat) / 330679773) [(7, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((10164830026 : Rat) / 330679773) [(7, 1), (10, 2), (12, 1), (15, 1)],
  term ((-20329660052 : Rat) / 330679773) [(7, 1), (11, 1), (12, 1), (15, 2)],
  term ((10164830026 : Rat) / 330679773) [(7, 1), (11, 2), (12, 1), (15, 1)],
  term ((20329660052 : Rat) / 330679773) [(7, 1), (12, 1), (14, 1), (15, 1)],
  term ((-10164830026 : Rat) / 330679773) [(7, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 297 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0297_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0297
        rs_R009_ueqv_R009NNNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_29_0297 := by
  native_decide

/-- Coefficient term 298 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0298 : Poly :=
[
  term ((189 : Rat) / 134) [(7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 298 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0298 : Poly :=
[
  term ((189 : Rat) / 67) [(7, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-189 : Rat) / 134) [(7, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((189 : Rat) / 67) [(7, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-189 : Rat) / 134) [(7, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-189 : Rat) / 67) [(7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((189 : Rat) / 134) [(7, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 298 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0298_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0298
        rs_R009_ueqv_R009NNNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_29_0298 := by
  native_decide

/-- Coefficient term 299 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0299 : Poly :=
[
  term ((-351641600 : Rat) / 110226591) [(7, 1), (12, 1), (15, 3)]
]

/-- Partial product 299 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0299 : Poly :=
[
  term ((-703283200 : Rat) / 110226591) [(7, 1), (10, 1), (12, 1), (14, 1), (15, 3)],
  term ((351641600 : Rat) / 110226591) [(7, 1), (10, 2), (12, 1), (15, 3)],
  term ((-703283200 : Rat) / 110226591) [(7, 1), (11, 1), (12, 1), (15, 4)],
  term ((351641600 : Rat) / 110226591) [(7, 1), (11, 2), (12, 1), (15, 3)],
  term ((703283200 : Rat) / 110226591) [(7, 1), (12, 1), (14, 1), (15, 3)],
  term ((-351641600 : Rat) / 110226591) [(7, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 299 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0299_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0299
        rs_R009_ueqv_R009NNNYN_generator_29_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_29_0299 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NNNYN_partials_29_0200_0299 : List Poly :=
[
  rs_R009_ueqv_R009NNNYN_partial_29_0200,
  rs_R009_ueqv_R009NNNYN_partial_29_0201,
  rs_R009_ueqv_R009NNNYN_partial_29_0202,
  rs_R009_ueqv_R009NNNYN_partial_29_0203,
  rs_R009_ueqv_R009NNNYN_partial_29_0204,
  rs_R009_ueqv_R009NNNYN_partial_29_0205,
  rs_R009_ueqv_R009NNNYN_partial_29_0206,
  rs_R009_ueqv_R009NNNYN_partial_29_0207,
  rs_R009_ueqv_R009NNNYN_partial_29_0208,
  rs_R009_ueqv_R009NNNYN_partial_29_0209,
  rs_R009_ueqv_R009NNNYN_partial_29_0210,
  rs_R009_ueqv_R009NNNYN_partial_29_0211,
  rs_R009_ueqv_R009NNNYN_partial_29_0212,
  rs_R009_ueqv_R009NNNYN_partial_29_0213,
  rs_R009_ueqv_R009NNNYN_partial_29_0214,
  rs_R009_ueqv_R009NNNYN_partial_29_0215,
  rs_R009_ueqv_R009NNNYN_partial_29_0216,
  rs_R009_ueqv_R009NNNYN_partial_29_0217,
  rs_R009_ueqv_R009NNNYN_partial_29_0218,
  rs_R009_ueqv_R009NNNYN_partial_29_0219,
  rs_R009_ueqv_R009NNNYN_partial_29_0220,
  rs_R009_ueqv_R009NNNYN_partial_29_0221,
  rs_R009_ueqv_R009NNNYN_partial_29_0222,
  rs_R009_ueqv_R009NNNYN_partial_29_0223,
  rs_R009_ueqv_R009NNNYN_partial_29_0224,
  rs_R009_ueqv_R009NNNYN_partial_29_0225,
  rs_R009_ueqv_R009NNNYN_partial_29_0226,
  rs_R009_ueqv_R009NNNYN_partial_29_0227,
  rs_R009_ueqv_R009NNNYN_partial_29_0228,
  rs_R009_ueqv_R009NNNYN_partial_29_0229,
  rs_R009_ueqv_R009NNNYN_partial_29_0230,
  rs_R009_ueqv_R009NNNYN_partial_29_0231,
  rs_R009_ueqv_R009NNNYN_partial_29_0232,
  rs_R009_ueqv_R009NNNYN_partial_29_0233,
  rs_R009_ueqv_R009NNNYN_partial_29_0234,
  rs_R009_ueqv_R009NNNYN_partial_29_0235,
  rs_R009_ueqv_R009NNNYN_partial_29_0236,
  rs_R009_ueqv_R009NNNYN_partial_29_0237,
  rs_R009_ueqv_R009NNNYN_partial_29_0238,
  rs_R009_ueqv_R009NNNYN_partial_29_0239,
  rs_R009_ueqv_R009NNNYN_partial_29_0240,
  rs_R009_ueqv_R009NNNYN_partial_29_0241,
  rs_R009_ueqv_R009NNNYN_partial_29_0242,
  rs_R009_ueqv_R009NNNYN_partial_29_0243,
  rs_R009_ueqv_R009NNNYN_partial_29_0244,
  rs_R009_ueqv_R009NNNYN_partial_29_0245,
  rs_R009_ueqv_R009NNNYN_partial_29_0246,
  rs_R009_ueqv_R009NNNYN_partial_29_0247,
  rs_R009_ueqv_R009NNNYN_partial_29_0248,
  rs_R009_ueqv_R009NNNYN_partial_29_0249,
  rs_R009_ueqv_R009NNNYN_partial_29_0250,
  rs_R009_ueqv_R009NNNYN_partial_29_0251,
  rs_R009_ueqv_R009NNNYN_partial_29_0252,
  rs_R009_ueqv_R009NNNYN_partial_29_0253,
  rs_R009_ueqv_R009NNNYN_partial_29_0254,
  rs_R009_ueqv_R009NNNYN_partial_29_0255,
  rs_R009_ueqv_R009NNNYN_partial_29_0256,
  rs_R009_ueqv_R009NNNYN_partial_29_0257,
  rs_R009_ueqv_R009NNNYN_partial_29_0258,
  rs_R009_ueqv_R009NNNYN_partial_29_0259,
  rs_R009_ueqv_R009NNNYN_partial_29_0260,
  rs_R009_ueqv_R009NNNYN_partial_29_0261,
  rs_R009_ueqv_R009NNNYN_partial_29_0262,
  rs_R009_ueqv_R009NNNYN_partial_29_0263,
  rs_R009_ueqv_R009NNNYN_partial_29_0264,
  rs_R009_ueqv_R009NNNYN_partial_29_0265,
  rs_R009_ueqv_R009NNNYN_partial_29_0266,
  rs_R009_ueqv_R009NNNYN_partial_29_0267,
  rs_R009_ueqv_R009NNNYN_partial_29_0268,
  rs_R009_ueqv_R009NNNYN_partial_29_0269,
  rs_R009_ueqv_R009NNNYN_partial_29_0270,
  rs_R009_ueqv_R009NNNYN_partial_29_0271,
  rs_R009_ueqv_R009NNNYN_partial_29_0272,
  rs_R009_ueqv_R009NNNYN_partial_29_0273,
  rs_R009_ueqv_R009NNNYN_partial_29_0274,
  rs_R009_ueqv_R009NNNYN_partial_29_0275,
  rs_R009_ueqv_R009NNNYN_partial_29_0276,
  rs_R009_ueqv_R009NNNYN_partial_29_0277,
  rs_R009_ueqv_R009NNNYN_partial_29_0278,
  rs_R009_ueqv_R009NNNYN_partial_29_0279,
  rs_R009_ueqv_R009NNNYN_partial_29_0280,
  rs_R009_ueqv_R009NNNYN_partial_29_0281,
  rs_R009_ueqv_R009NNNYN_partial_29_0282,
  rs_R009_ueqv_R009NNNYN_partial_29_0283,
  rs_R009_ueqv_R009NNNYN_partial_29_0284,
  rs_R009_ueqv_R009NNNYN_partial_29_0285,
  rs_R009_ueqv_R009NNNYN_partial_29_0286,
  rs_R009_ueqv_R009NNNYN_partial_29_0287,
  rs_R009_ueqv_R009NNNYN_partial_29_0288,
  rs_R009_ueqv_R009NNNYN_partial_29_0289,
  rs_R009_ueqv_R009NNNYN_partial_29_0290,
  rs_R009_ueqv_R009NNNYN_partial_29_0291,
  rs_R009_ueqv_R009NNNYN_partial_29_0292,
  rs_R009_ueqv_R009NNNYN_partial_29_0293,
  rs_R009_ueqv_R009NNNYN_partial_29_0294,
  rs_R009_ueqv_R009NNNYN_partial_29_0295,
  rs_R009_ueqv_R009NNNYN_partial_29_0296,
  rs_R009_ueqv_R009NNNYN_partial_29_0297,
  rs_R009_ueqv_R009NNNYN_partial_29_0298,
  rs_R009_ueqv_R009NNNYN_partial_29_0299
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NNNYN_block_29_0200_0299 : Poly :=
[
  term ((8771824241152 : Rat) / 157072892175) [(5, 1), (7, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-25461954560 : Rat) / 110226591) [(5, 1), (7, 1), (10, 1), (11, 2), (14, 1)],
  term ((1179820320 : Rat) / 12247399) [(5, 1), (7, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((137059753768 : Rat) / 5817514525) [(5, 1), (7, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-19525602136 : Rat) / 110226591) [(5, 1), (7, 1), (10, 1), (14, 1), (15, 2)],
  term ((-9579498314696 : Rat) / 157072892175) [(5, 1), (7, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-4385912120576 : Rat) / 157072892175) [(5, 1), (7, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((12730977280 : Rat) / 110226591) [(5, 1), (7, 1), (10, 2), (11, 2)],
  term ((-589910160 : Rat) / 12247399) [(5, 1), (7, 1), (10, 2), (13, 1), (15, 1)],
  term ((-68529876884 : Rat) / 5817514525) [(5, 1), (7, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((9762801068 : Rat) / 110226591) [(5, 1), (7, 1), (10, 2), (15, 2)],
  term ((4789749157348 : Rat) / 157072892175) [(5, 1), (7, 1), (10, 2), (15, 2), (16, 1)],
  term ((1179820320 : Rat) / 12247399) [(5, 1), (7, 1), (11, 1), (13, 1), (15, 2)],
  term ((137059753768 : Rat) / 5817514525) [(5, 1), (7, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-8771824241152 : Rat) / 157072892175) [(5, 1), (7, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((4385912120576 : Rat) / 157072892175) [(5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-19525602136 : Rat) / 110226591) [(5, 1), (7, 1), (11, 1), (15, 3)],
  term ((-9579498314696 : Rat) / 157072892175) [(5, 1), (7, 1), (11, 1), (15, 3), (16, 1)],
  term ((-12730977280 : Rat) / 110226591) [(5, 1), (7, 1), (11, 2)],
  term ((-589910160 : Rat) / 12247399) [(5, 1), (7, 1), (11, 2), (13, 1), (15, 1)],
  term ((-68529876884 : Rat) / 5817514525) [(5, 1), (7, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((25461954560 : Rat) / 110226591) [(5, 1), (7, 1), (11, 2), (14, 1)],
  term ((9762801068 : Rat) / 110226591) [(5, 1), (7, 1), (11, 2), (15, 2)],
  term ((542462935940 : Rat) / 6282915687) [(5, 1), (7, 1), (11, 2), (15, 2), (16, 1)],
  term ((-25461954560 : Rat) / 110226591) [(5, 1), (7, 1), (11, 3), (15, 1)],
  term ((-4385912120576 : Rat) / 157072892175) [(5, 1), (7, 1), (11, 3), (15, 1), (16, 1)],
  term ((12730977280 : Rat) / 110226591) [(5, 1), (7, 1), (11, 4)],
  term ((-1179820320 : Rat) / 12247399) [(5, 1), (7, 1), (13, 1), (14, 1), (15, 1)],
  term ((-137059753768 : Rat) / 5817514525) [(5, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((589910160 : Rat) / 12247399) [(5, 1), (7, 1), (13, 1), (15, 1)],
  term ((68529876884 : Rat) / 5817514525) [(5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((19525602136 : Rat) / 110226591) [(5, 1), (7, 1), (14, 1), (15, 2)],
  term ((9579498314696 : Rat) / 157072892175) [(5, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((-9762801068 : Rat) / 110226591) [(5, 1), (7, 1), (15, 2)],
  term ((-4789749157348 : Rat) / 157072892175) [(5, 1), (7, 1), (15, 2), (16, 1)],
  term ((4385912120576 : Rat) / 52357630725) [(5, 1), (7, 2), (10, 1), (11, 1), (14, 1)],
  term ((205589630652 : Rat) / 5817514525) [(5, 1), (7, 2), (10, 1), (13, 1), (14, 1)],
  term ((-4789749157348 : Rat) / 52357630725) [(5, 1), (7, 2), (10, 1), (14, 1), (15, 1)],
  term ((-2192956060288 : Rat) / 52357630725) [(5, 1), (7, 2), (10, 2), (11, 1)],
  term ((-102794815326 : Rat) / 5817514525) [(5, 1), (7, 2), (10, 2), (13, 1)],
  term ((2394874578674 : Rat) / 52357630725) [(5, 1), (7, 2), (10, 2), (15, 1)],
  term ((2192956060288 : Rat) / 52357630725) [(5, 1), (7, 2), (11, 1)],
  term ((205589630652 : Rat) / 5817514525) [(5, 1), (7, 2), (11, 1), (13, 1), (15, 1)],
  term ((-4385912120576 : Rat) / 52357630725) [(5, 1), (7, 2), (11, 1), (14, 1)],
  term ((-4789749157348 : Rat) / 52357630725) [(5, 1), (7, 2), (11, 1), (15, 2)],
  term ((-102794815326 : Rat) / 5817514525) [(5, 1), (7, 2), (11, 2), (13, 1)],
  term ((271231467970 : Rat) / 2094305229) [(5, 1), (7, 2), (11, 2), (15, 1)],
  term ((-2192956060288 : Rat) / 52357630725) [(5, 1), (7, 2), (11, 3)],
  term ((102794815326 : Rat) / 5817514525) [(5, 1), (7, 2), (13, 1)],
  term ((-205589630652 : Rat) / 5817514525) [(5, 1), (7, 2), (13, 1), (14, 1)],
  term ((4789749157348 : Rat) / 52357630725) [(5, 1), (7, 2), (14, 1), (15, 1)],
  term ((-2394874578674 : Rat) / 52357630725) [(5, 1), (7, 2), (15, 1)],
  term ((-1817 : Rat) / 268) [(5, 1), (9, 1)],
  term ((-196 : Rat) / 67) [(5, 1), (9, 1), (10, 1)],
  term ((596764560 : Rat) / 12247399) [(5, 1), (9, 1), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((-2921802012 : Rat) / 12247399) [(5, 1), (9, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-88204818688 : Rat) / 18848747061) [(5, 1), (9, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-392 : Rat) / 67) [(5, 1), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((196 : Rat) / 67) [(5, 1), (9, 1), (10, 1), (11, 2)],
  term ((12730977280 : Rat) / 110226591) [(5, 1), (9, 1), (10, 1), (11, 2), (14, 1)],
  term ((-589910160 : Rat) / 12247399) [(5, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-1378200292 : Rat) / 698101743) [(5, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1033 : Rat) / 134) [(5, 1), (9, 1), (10, 1), (14, 1)],
  term ((9762801068 : Rat) / 110226591) [(5, 1), (9, 1), (10, 1), (14, 1), (15, 2)],
  term ((153811535336 : Rat) / 18848747061) [(5, 1), (9, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((146 : Rat) / 67) [(5, 1), (9, 1), (10, 1), (14, 2)],
  term ((1817 : Rat) / 268) [(5, 1), (9, 1), (10, 2)],
  term ((-298382280 : Rat) / 12247399) [(5, 1), (9, 1), (10, 2), (11, 1), (13, 1)],
  term ((1460901006 : Rat) / 12247399) [(5, 1), (9, 1), (10, 2), (11, 1), (15, 1)],
  term ((44102409344 : Rat) / 18848747061) [(5, 1), (9, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-6365488640 : Rat) / 110226591) [(5, 1), (9, 1), (10, 2), (11, 2)],
  term ((294955080 : Rat) / 12247399) [(5, 1), (9, 1), (10, 2), (13, 1), (15, 1)],
  term ((689100146 : Rat) / 698101743) [(5, 1), (9, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-465 : Rat) / 67) [(5, 1), (9, 1), (10, 2), (14, 1)],
  term ((-4881400534 : Rat) / 110226591) [(5, 1), (9, 1), (10, 2), (15, 2)],
  term ((-76905767668 : Rat) / 18848747061) [(5, 1), (9, 1), (10, 2), (15, 2), (16, 1)],
  term ((196 : Rat) / 67) [(5, 1), (9, 1), (10, 3)],
  term ((298382280 : Rat) / 12247399) [(5, 1), (9, 1), (11, 1), (13, 1)],
  term ((-596764560 : Rat) / 12247399) [(5, 1), (9, 1), (11, 1), (13, 1), (14, 1)],
  term ((-589910160 : Rat) / 12247399) [(5, 1), (9, 1), (11, 1), (13, 1), (15, 2)],
  term ((-1378200292 : Rat) / 698101743) [(5, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((2948490374 : Rat) / 12247399) [(5, 1), (9, 1), (11, 1), (14, 1), (15, 1)],
  term ((88204818688 : Rat) / 18848747061) [(5, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3253944161 : Rat) / 24494798) [(5, 1), (9, 1), (11, 1), (15, 1)],
  term ((-44102409344 : Rat) / 18848747061) [(5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((9762801068 : Rat) / 110226591) [(5, 1), (9, 1), (11, 1), (15, 3)],
  term ((153811535336 : Rat) / 18848747061) [(5, 1), (9, 1), (11, 1), (15, 3), (16, 1)],
  term ((28451233901 : Rat) / 440906364) [(5, 1), (9, 1), (11, 2)],
  term ((891719640 : Rat) / 12247399) [(5, 1), (9, 1), (11, 2), (13, 1), (15, 1)],
  term ((689100146 : Rat) / 698101743) [(5, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-12851074909 : Rat) / 110226591) [(5, 1), (9, 1), (11, 2), (14, 1)],
  term ((-31177618642 : Rat) / 110226591) [(5, 1), (9, 1), (11, 2), (15, 2)],
  term ((-165110586356 : Rat) / 18848747061) [(5, 1), (9, 1), (11, 2), (15, 2), (16, 1)],
  term ((-298382280 : Rat) / 12247399) [(5, 1), (9, 1), (11, 3), (13, 1)],
  term ((25879086334 : Rat) / 110226591) [(5, 1), (9, 1), (11, 3), (15, 1)],
  term ((44102409344 : Rat) / 18848747061) [(5, 1), (9, 1), (11, 3), (15, 1), (16, 1)],
  term ((-6365488640 : Rat) / 110226591) [(5, 1), (9, 1), (11, 4)],
  term ((589910160 : Rat) / 12247399) [(5, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((1378200292 : Rat) / 698101743) [(5, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-294955080 : Rat) / 12247399) [(5, 1), (9, 1), (13, 1), (15, 1)],
  term ((-689100146 : Rat) / 698101743) [(5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((1963 : Rat) / 134) [(5, 1), (9, 1), (14, 1)],
  term ((-9762801068 : Rat) / 110226591) [(5, 1), (9, 1), (14, 1), (15, 2)],
  term ((-153811535336 : Rat) / 18848747061) [(5, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-146 : Rat) / 67) [(5, 1), (9, 1), (14, 2)],
  term ((4881400534 : Rat) / 110226591) [(5, 1), (9, 1), (15, 2)],
  term ((76905767668 : Rat) / 18848747061) [(5, 1), (9, 1), (15, 2), (16, 1)],
  term ((22051204672 : Rat) / 6282915687) [(5, 1), (9, 2), (10, 1), (11, 1), (14, 1)],
  term ((344550073 : Rat) / 232700581) [(5, 1), (9, 2), (10, 1), (13, 1), (14, 1)],
  term ((-38452883834 : Rat) / 6282915687) [(5, 1), (9, 2), (10, 1), (14, 1), (15, 1)],
  term ((-11025602336 : Rat) / 6282915687) [(5, 1), (9, 2), (10, 2), (11, 1)],
  term ((-344550073 : Rat) / 465401162) [(5, 1), (9, 2), (10, 2), (13, 1)],
  term ((19226441917 : Rat) / 6282915687) [(5, 1), (9, 2), (10, 2), (15, 1)],
  term ((11025602336 : Rat) / 6282915687) [(5, 1), (9, 2), (11, 1)],
  term ((344550073 : Rat) / 232700581) [(5, 1), (9, 2), (11, 1), (13, 1), (15, 1)],
  term ((-22051204672 : Rat) / 6282915687) [(5, 1), (9, 2), (11, 1), (14, 1)],
  term ((-38452883834 : Rat) / 6282915687) [(5, 1), (9, 2), (11, 1), (15, 2)],
  term ((-344550073 : Rat) / 465401162) [(5, 1), (9, 2), (11, 2), (13, 1)],
  term ((41277646589 : Rat) / 6282915687) [(5, 1), (9, 2), (11, 2), (15, 1)],
  term ((-11025602336 : Rat) / 6282915687) [(5, 1), (9, 2), (11, 3)],
  term ((344550073 : Rat) / 465401162) [(5, 1), (9, 2), (13, 1)],
  term ((-344550073 : Rat) / 232700581) [(5, 1), (9, 2), (13, 1), (14, 1)],
  term ((38452883834 : Rat) / 6282915687) [(5, 1), (9, 2), (14, 1), (15, 1)],
  term ((-19226441917 : Rat) / 6282915687) [(5, 1), (9, 2), (15, 1)],
  term ((-83996018176 : Rat) / 3490508715) [(5, 1), (10, 1), (11, 1)],
  term ((19054364672 : Rat) / 110226591) [(5, 1), (10, 1), (11, 1), (12, 1), (14, 1)],
  term ((-93363200 : Rat) / 12247399) [(5, 1), (10, 1), (11, 1), (12, 1), (14, 2)],
  term ((-514232320 : Rat) / 110226591) [(5, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-1827840 : Rat) / 12247399) [(5, 1), (10, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((-23623880112 : Rat) / 1163502905) [(5, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-1677449101976 : Rat) / 18848747061) [(5, 1), (10, 1), (11, 1), (14, 1)],
  term ((-243015680 : Rat) / 330679773) [(5, 1), (10, 1), (11, 1), (14, 1), (15, 2)],
  term ((9280 : Rat) / 201) [(5, 1), (10, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((810187430512 : Rat) / 24800982975) [(5, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-6501480296 : Rat) / 330679773) [(5, 1), (10, 1), (11, 1), (14, 2)],
  term ((64409600 : Rat) / 110226591) [(5, 1), (10, 1), (11, 1), (14, 2), (15, 2)],
  term ((-413371702912 : Rat) / 24800982975) [(5, 1), (10, 1), (11, 1), (14, 2), (16, 1)],
  term ((3353745920 : Rat) / 110226591) [(5, 1), (10, 1), (11, 1), (14, 3)],
  term ((48228486072 : Rat) / 1163502905) [(5, 1), (10, 1), (11, 1), (15, 2)],
  term ((11811940056 : Rat) / 1163502905) [(5, 1), (10, 1), (11, 2), (13, 1)],
  term ((-304640 : Rat) / 12247399) [(5, 1), (10, 1), (11, 2), (13, 1), (14, 1)],
  term ((173557760 : Rat) / 330679773) [(5, 1), (10, 1), (11, 2), (14, 1), (15, 1)],
  term ((-38993920 : Rat) / 110226591) [(5, 1), (10, 1), (11, 2), (14, 2), (15, 1)],
  term ((-48066953092 : Rat) / 698101743) [(5, 1), (10, 1), (11, 2), (15, 1)],
  term ((83996018176 : Rat) / 3490508715) [(5, 1), (10, 1), (11, 3)],
  term ((-19496960 : Rat) / 330679773) [(5, 1), (10, 1), (11, 3), (14, 1)],
  term ((893173344 : Rat) / 12247399) [(5, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((-39387600 : Rat) / 12247399) [(5, 1), (10, 1), (12, 1), (13, 1), (14, 2)],
  term ((-16827596488 : Rat) / 110226591) [(5, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-252 : Rat) / 67) [(5, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((97354984 : Rat) / 12247399) [(5, 1), (10, 1), (12, 1), (14, 2), (15, 1)],
  term ((-11811940056 : Rat) / 1163502905) [(5, 1), (10, 1), (13, 1)],
  term ((-26315638937 : Rat) / 698101743) [(5, 1), (10, 1), (13, 1), (14, 1)],
  term ((469112960 : Rat) / 110226591) [(5, 1), (10, 1), (13, 1), (14, 1), (15, 2)],
  term ((6458932858 : Rat) / 918554925) [(5, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-99734810 : Rat) / 12247399) [(5, 1), (10, 1), (13, 1), (14, 2)],
  term ((1370880 : Rat) / 12247399) [(5, 1), (10, 1), (13, 1), (14, 2), (15, 2)],
  term ((-6458932858 : Rat) / 918554925) [(5, 1), (10, 1), (13, 1), (14, 2), (16, 1)],
  term ((157206840 : Rat) / 12247399) [(5, 1), (10, 1), (13, 1), (14, 3)],
  term ((-25132800 : Rat) / 12247399) [(5, 1), (10, 1), (13, 2), (14, 1), (15, 1)],
  term ((1518413204920 : Rat) / 18848747061) [(5, 1), (10, 1), (14, 1), (15, 1)],
  term ((121272755524 : Rat) / 24800982975) [(5, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((30768640 : Rat) / 110226591) [(5, 1), (10, 1), (14, 1), (15, 3)],
  term ((5858124046 : Rat) / 330679773) [(5, 1), (10, 1), (14, 2), (15, 1)],
  term ((82564179176 : Rat) / 24800982975) [(5, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((-8791040 : Rat) / 36742197) [(5, 1), (10, 1), (14, 2), (15, 3)],
  term ((-3024360160 : Rat) / 110226591) [(5, 1), (10, 1), (14, 3), (15, 1)],
  term ((24114243036 : Rat) / 1163502905) [(5, 1), (10, 1), (15, 1)],
  term ((6464293562492 : Rat) / 94243735305) [(5, 1), (10, 2), (11, 1)],
  term ((-9527182336 : Rat) / 110226591) [(5, 1), (10, 2), (11, 1), (12, 1)],
  term ((46681600 : Rat) / 12247399) [(5, 1), (10, 2), (11, 1), (12, 1), (14, 1)],
  term ((913920 : Rat) / 12247399) [(5, 1), (10, 2), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((259857920 : Rat) / 110226591) [(5, 1), (10, 2), (11, 1), (13, 1), (15, 1)],
  term ((-1204960224308 : Rat) / 31414578435) [(5, 1), (10, 2), (11, 1), (14, 1)],
  term ((-32204800 : Rat) / 110226591) [(5, 1), (10, 2), (11, 1), (14, 1), (15, 2)],
  term ((206685851456 : Rat) / 24800982975) [(5, 1), (10, 2), (11, 1), (14, 1), (16, 1)],
  term ((-4991624960 : Rat) / 330679773) [(5, 1), (10, 2), (11, 1), (14, 2)],
  term ((34641920 : Rat) / 110226591) [(5, 1), (10, 2), (11, 1), (15, 2)],
  term ((-4640 : Rat) / 201) [(5, 1), (10, 2), (11, 1), (15, 2), (16, 1)],
  term ((-405093715256 : Rat) / 24800982975) [(5, 1), (10, 2), (11, 1), (16, 1)],
  term ((19496960 : Rat) / 110226591) [(5, 1), (10, 2), (11, 2), (14, 1), (15, 1)],
  term ((-19496960 : Rat) / 110226591) [(5, 1), (10, 2), (11, 2), (15, 1)],
  term ((-446586672 : Rat) / 12247399) [(5, 1), (10, 2), (12, 1), (13, 1)],
  term ((19693800 : Rat) / 12247399) [(5, 1), (10, 2), (12, 1), (13, 1), (14, 1)],
  term ((-48677492 : Rat) / 12247399) [(5, 1), (10, 2), (12, 1), (14, 1), (15, 1)],
  term ((8413798244 : Rat) / 110226591) [(5, 1), (10, 2), (12, 1), (15, 1)],
  term ((126 : Rat) / 67) [(5, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((202536657421 : Rat) / 6981017430) [(5, 1), (10, 2), (13, 1)],
  term ((-18915417437 : Rat) / 1163502905) [(5, 1), (10, 2), (13, 1), (14, 1)],
  term ((-685440 : Rat) / 12247399) [(5, 1), (10, 2), (13, 1), (14, 1), (15, 2)],
  term ((3229466429 : Rat) / 918554925) [(5, 1), (10, 2), (13, 1), (14, 1), (16, 1)],
  term ((-77994140 : Rat) / 12247399) [(5, 1), (10, 2), (13, 1), (14, 2)],
  term ((-234556480 : Rat) / 110226591) [(5, 1), (10, 2), (13, 1), (15, 2)],
  term ((-3229466429 : Rat) / 918554925) [(5, 1), (10, 2), (13, 1), (16, 1)],
  term ((12566400 : Rat) / 12247399) [(5, 1), (10, 2), (13, 2), (15, 1)],
  term ((1025578529359 : Rat) / 31414578435) [(5, 1), (10, 2), (14, 1), (15, 1)],
  term ((-41282089588 : Rat) / 24800982975) [(5, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((4395520 : Rat) / 36742197) [(5, 1), (10, 2), (14, 1), (15, 3)],
  term ((4501376080 : Rat) / 330679773) [(5, 1), (10, 2), (14, 2), (15, 1)],
  term ((-5751792144616 : Rat) / 94243735305) [(5, 1), (10, 2), (15, 1)],
  term ((-60636377762 : Rat) / 24800982975) [(5, 1), (10, 2), (15, 1), (16, 1)],
  term ((-15384320 : Rat) / 110226591) [(5, 1), (10, 2), (15, 3)],
  term ((83996018176 : Rat) / 3490508715) [(5, 1), (10, 3), (11, 1)],
  term ((-19496960 : Rat) / 330679773) [(5, 1), (10, 3), (11, 1), (14, 1)],
  term ((11811940056 : Rat) / 1163502905) [(5, 1), (10, 3), (13, 1)],
  term ((-304640 : Rat) / 12247399) [(5, 1), (10, 3), (13, 1), (14, 1)],
  term ((17582080 : Rat) / 330679773) [(5, 1), (10, 3), (14, 1), (15, 1)],
  term ((-24114243036 : Rat) / 1163502905) [(5, 1), (10, 3), (15, 1)],
  term ((-6464293562492 : Rat) / 94243735305) [(5, 1), (11, 1)],
  term ((9527182336 : Rat) / 110226591) [(5, 1), (11, 1), (12, 1)],
  term ((-39387600 : Rat) / 12247399) [(5, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((893173344 : Rat) / 12247399) [(5, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-19474499072 : Rat) / 110226591) [(5, 1), (11, 1), (12, 1), (14, 1)],
  term ((97354984 : Rat) / 12247399) [(5, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((93363200 : Rat) / 12247399) [(5, 1), (11, 1), (12, 1), (14, 2)],
  term ((-16827596488 : Rat) / 110226591) [(5, 1), (11, 1), (12, 1), (15, 2)],
  term ((-252 : Rat) / 67) [(5, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-380639210 : Rat) / 110226591) [(5, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-6458932858 : Rat) / 918554925) [(5, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1370880 : Rat) / 12247399) [(5, 1), (11, 1), (13, 1), (14, 1), (15, 3)],
  term ((159034680 : Rat) / 12247399) [(5, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((-632296474663 : Rat) / 10471526145) [(5, 1), (11, 1), (13, 1), (15, 1)],
  term ((6458932858 : Rat) / 918554925) [(5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((469112960 : Rat) / 110226591) [(5, 1), (11, 1), (13, 1), (15, 3)],
  term ((-25132800 : Rat) / 12247399) [(5, 1), (11, 1), (13, 2), (15, 2)],
  term ((12007682816404 : Rat) / 94243735305) [(5, 1), (11, 1), (14, 1)],
  term ((6127425806 : Rat) / 330679773) [(5, 1), (11, 1), (14, 1), (15, 2)],
  term ((-1062476228824 : Rat) / 24800982975) [(5, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-8791040 : Rat) / 36742197) [(5, 1), (11, 1), (14, 1), (15, 4)],
  term ((-338957760656 : Rat) / 8266994325) [(5, 1), (11, 1), (14, 1), (16, 1)],
  term ((11493105256 : Rat) / 330679773) [(5, 1), (11, 1), (14, 2)],
  term ((-343196640 : Rat) / 12247399) [(5, 1), (11, 1), (14, 2), (15, 2)],
  term ((413371702912 : Rat) / 24800982975) [(5, 1), (11, 1), (14, 2), (16, 1)],
  term ((-3353745920 : Rat) / 110226591) [(5, 1), (11, 1), (14, 3)],
  term ((11473965447632 : Rat) / 94243735305) [(5, 1), (11, 1), (15, 2)],
  term ((693792959524 : Rat) / 24800982975) [(5, 1), (11, 1), (15, 2), (16, 1)],
  term ((30768640 : Rat) / 110226591) [(5, 1), (11, 1), (15, 4)],
  term ((405093715256 : Rat) / 24800982975) [(5, 1), (11, 1), (16, 1)],
  term ((-446586672 : Rat) / 12247399) [(5, 1), (11, 2), (12, 1), (13, 1)],
  term ((19693800 : Rat) / 12247399) [(5, 1), (11, 2), (12, 1), (13, 1), (14, 1)],
  term ((-142040692 : Rat) / 12247399) [(5, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((27468162916 : Rat) / 110226591) [(5, 1), (11, 2), (12, 1), (15, 1)],
  term ((126 : Rat) / 67) [(5, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((202536657421 : Rat) / 6981017430) [(5, 1), (11, 2), (13, 1)],
  term ((49562765 : Rat) / 12247399) [(5, 1), (11, 2), (13, 1), (14, 1)],
  term ((-2513280 : Rat) / 12247399) [(5, 1), (11, 2), (13, 1), (14, 1), (15, 2)],
  term ((3229466429 : Rat) / 918554925) [(5, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((-78603420 : Rat) / 12247399) [(5, 1), (11, 2), (13, 1), (14, 2)],
  term ((-754272320 : Rat) / 110226591) [(5, 1), (11, 2), (13, 1), (15, 2)],
  term ((-3229466429 : Rat) / 918554925) [(5, 1), (11, 2), (13, 1), (16, 1)],
  term ((12566400 : Rat) / 12247399) [(5, 1), (11, 2), (13, 2), (15, 1)],
  term ((-9549438959 : Rat) / 330679773) [(5, 1), (11, 2), (14, 1), (15, 1)],
  term ((-271435100 : Rat) / 14806557) [(5, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((77596160 : Rat) / 110226591) [(5, 1), (11, 2), (14, 1), (15, 3)],
  term ((73207760 : Rat) / 1645173) [(5, 1), (11, 2), (14, 2), (15, 1)],
  term ((-55712565280 : Rat) / 281324583) [(5, 1), (11, 2), (15, 1)],
  term ((29982042110 : Rat) / 992039319) [(5, 1), (11, 2), (15, 1), (16, 1)],
  term ((-28222720 : Rat) / 36742197) [(5, 1), (11, 2), (15, 3)],
  term ((9280 : Rat) / 201) [(5, 1), (11, 2), (15, 3), (16, 1)],
  term ((6464293562492 : Rat) / 94243735305) [(5, 1), (11, 3)],
  term ((-9527182336 : Rat) / 110226591) [(5, 1), (11, 3), (12, 1)],
  term ((46681600 : Rat) / 12247399) [(5, 1), (11, 3), (12, 1), (14, 1)],
  term ((913920 : Rat) / 12247399) [(5, 1), (11, 3), (13, 1), (14, 1), (15, 1)],
  term ((259857920 : Rat) / 110226591) [(5, 1), (11, 3), (13, 1), (15, 1)],
  term ((3231243188 : Rat) / 330679773) [(5, 1), (11, 3), (14, 1)],
  term ((-71198720 : Rat) / 110226591) [(5, 1), (11, 3), (14, 1), (15, 2)],
  term ((206685851456 : Rat) / 24800982975) [(5, 1), (11, 3), (14, 1), (16, 1)],
  term ((-1676872960 : Rat) / 110226591) [(5, 1), (11, 3), (14, 2)],
  term ((8181760 : Rat) / 12247399) [(5, 1), (11, 3), (15, 2)],
  term ((-4640 : Rat) / 201) [(5, 1), (11, 3), (15, 2), (16, 1)],
  term ((-405093715256 : Rat) / 24800982975) [(5, 1), (11, 3), (16, 1)],
  term ((19496960 : Rat) / 110226591) [(5, 1), (11, 4), (14, 1), (15, 1)],
  term ((-19496960 : Rat) / 110226591) [(5, 1), (11, 4), (15, 1)],
  term ((446586672 : Rat) / 12247399) [(5, 1), (12, 1), (13, 1)],
  term ((-912867144 : Rat) / 12247399) [(5, 1), (12, 1), (13, 1), (14, 1)],
  term ((39387600 : Rat) / 12247399) [(5, 1), (12, 1), (13, 1), (14, 2)],
  term ((17265693916 : Rat) / 110226591) [(5, 1), (12, 1), (14, 1), (15, 1)],
  term ((252 : Rat) / 67) [(5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-97354984 : Rat) / 12247399) [(5, 1), (12, 1), (14, 2), (15, 1)],
  term ((-8413798244 : Rat) / 110226591) [(5, 1), (12, 1), (15, 1)],
  term ((-126 : Rat) / 67) [(5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-202536657421 : Rat) / 6981017430) [(5, 1), (13, 1)],
  term ((188411269396 : Rat) / 3490508715) [(5, 1), (13, 1), (14, 1)],
  term ((-462944000 : Rat) / 110226591) [(5, 1), (13, 1), (14, 1), (15, 2)],
  term ((-3229466429 : Rat) / 306184975) [(5, 1), (13, 1), (14, 1), (16, 1)],
  term ((177728950 : Rat) / 12247399) [(5, 1), (13, 1), (14, 2)],
  term ((-1370880 : Rat) / 12247399) [(5, 1), (13, 1), (14, 2), (15, 2)],
  term ((6458932858 : Rat) / 918554925) [(5, 1), (13, 1), (14, 2), (16, 1)],
  term ((-157206840 : Rat) / 12247399) [(5, 1), (13, 1), (14, 3)],
  term ((234556480 : Rat) / 110226591) [(5, 1), (13, 1), (15, 2)],
  term ((3229466429 : Rat) / 918554925) [(5, 1), (13, 1), (16, 1)],
  term ((25132800 : Rat) / 12247399) [(5, 1), (13, 2), (14, 1), (15, 1)],
  term ((-12566400 : Rat) / 12247399) [(5, 1), (13, 2), (15, 1)],
  term ((-10673812505477 : Rat) / 94243735305) [(5, 1), (14, 1), (15, 1)],
  term ((-26663555312 : Rat) / 8266994325) [(5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-43955200 : Rat) / 110226591) [(5, 1), (14, 1), (15, 3)],
  term ((-10359500126 : Rat) / 330679773) [(5, 1), (14, 2), (15, 1)],
  term ((-82564179176 : Rat) / 24800982975) [(5, 1), (14, 2), (15, 1), (16, 1)],
  term ((8791040 : Rat) / 36742197) [(5, 1), (14, 2), (15, 3)],
  term ((3024360160 : Rat) / 110226591) [(5, 1), (14, 3), (15, 1)],
  term ((5751792144616 : Rat) / 94243735305) [(5, 1), (15, 1)],
  term ((60636377762 : Rat) / 24800982975) [(5, 1), (15, 1), (16, 1)],
  term ((15384320 : Rat) / 110226591) [(5, 1), (15, 3)],
  term ((-507 : Rat) / 268) [(7, 1), (9, 1)],
  term ((198921520 : Rat) / 12247399) [(7, 1), (9, 1), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((-52834967632828 : Rat) / 471218676525) [(7, 1), (9, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((2744236177088 : Rat) / 157072892175) [(7, 1), (9, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((12730977280 : Rat) / 330679773) [(7, 1), (9, 1), (10, 1), (11, 2), (14, 1)],
  term ((-520251963952 : Rat) / 17452543575) [(7, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((42878690267 : Rat) / 5817514525) [(7, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-507 : Rat) / 134) [(7, 1), (9, 1), (10, 1), (14, 1)],
  term ((32126527377344 : Rat) / 471218676525) [(7, 1), (9, 1), (10, 1), (14, 1), (15, 2)],
  term ((-3356196674524 : Rat) / 157072892175) [(7, 1), (9, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((784 : Rat) / 67) [(7, 1), (9, 1), (10, 1), (14, 2)],
  term ((507 : Rat) / 268) [(7, 1), (9, 1), (10, 2)],
  term ((-99460760 : Rat) / 12247399) [(7, 1), (9, 1), (10, 2), (11, 1), (13, 1)],
  term ((26417483816414 : Rat) / 471218676525) [(7, 1), (9, 1), (10, 2), (11, 1), (15, 1)],
  term ((-1372118088544 : Rat) / 157072892175) [(7, 1), (9, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-6365488640 : Rat) / 330679773) [(7, 1), (9, 1), (10, 2), (11, 2)],
  term ((260125981976 : Rat) / 17452543575) [(7, 1), (9, 1), (10, 2), (13, 1), (15, 1)],
  term ((-42878690267 : Rat) / 11635029050) [(7, 1), (9, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-392 : Rat) / 67) [(7, 1), (9, 1), (10, 2), (14, 1)],
  term ((-16063263688672 : Rat) / 471218676525) [(7, 1), (9, 1), (10, 2), (15, 2)],
  term ((1678098337262 : Rat) / 157072892175) [(7, 1), (9, 1), (10, 2), (15, 2), (16, 1)],
  term ((99460760 : Rat) / 12247399) [(7, 1), (9, 1), (11, 1), (13, 1)],
  term ((-198921520 : Rat) / 12247399) [(7, 1), (9, 1), (11, 1), (13, 1), (14, 1)],
  term ((-520251963952 : Rat) / 17452543575) [(7, 1), (9, 1), (11, 1), (13, 1), (15, 2)],
  term ((42878690267 : Rat) / 5817514525) [(7, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((58348929459628 : Rat) / 471218676525) [(7, 1), (9, 1), (11, 1), (14, 1), (15, 1)],
  term ((-2744236177088 : Rat) / 157072892175) [(7, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-56400756722353 : Rat) / 942437353050) [(7, 1), (9, 1), (11, 1), (15, 1)],
  term ((1372118088544 : Rat) / 157072892175) [(7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((32126527377344 : Rat) / 471218676525) [(7, 1), (9, 1), (11, 1), (15, 3)],
  term ((-3356196674524 : Rat) / 157072892175) [(7, 1), (9, 1), (11, 1), (15, 3), (16, 1)],
  term ((27964262693 : Rat) / 1322719092) [(7, 1), (9, 1), (11, 2)],
  term ((543589147976 : Rat) / 17452543575) [(7, 1), (9, 1), (11, 2), (13, 1), (15, 1)],
  term ((-42878690267 : Rat) / 11635029050) [(7, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-14665700728 : Rat) / 330679773) [(7, 1), (9, 1), (11, 2), (14, 1)],
  term ((-2755929252860 : Rat) / 18848747061) [(7, 1), (9, 1), (11, 2), (15, 2)],
  term ((176893380574 : Rat) / 6282915687) [(7, 1), (9, 1), (11, 2), (15, 2), (16, 1)],
  term ((-99460760 : Rat) / 12247399) [(7, 1), (9, 1), (11, 3), (13, 1)],
  term ((44559126440414 : Rat) / 471218676525) [(7, 1), (9, 1), (11, 3), (15, 1)],
  term ((-1372118088544 : Rat) / 157072892175) [(7, 1), (9, 1), (11, 3), (15, 1), (16, 1)],
  term ((-6365488640 : Rat) / 330679773) [(7, 1), (9, 1), (11, 4)],
  term ((520251963952 : Rat) / 17452543575) [(7, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((-42878690267 : Rat) / 5817514525) [(7, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-260125981976 : Rat) / 17452543575) [(7, 1), (9, 1), (13, 1), (15, 1)],
  term ((42878690267 : Rat) / 11635029050) [(7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((1291 : Rat) / 134) [(7, 1), (9, 1), (14, 1)],
  term ((-32126527377344 : Rat) / 471218676525) [(7, 1), (9, 1), (14, 1), (15, 2)],
  term ((3356196674524 : Rat) / 157072892175) [(7, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-784 : Rat) / 67) [(7, 1), (9, 1), (14, 2)],
  term ((16063263688672 : Rat) / 471218676525) [(7, 1), (9, 1), (15, 2)],
  term ((-1678098337262 : Rat) / 157072892175) [(7, 1), (9, 1), (15, 2), (16, 1)],
  term ((22051204672 : Rat) / 18848747061) [(7, 1), (9, 2), (10, 1), (11, 1), (14, 1)],
  term ((344550073 : Rat) / 698101743) [(7, 1), (9, 2), (10, 1), (13, 1), (14, 1)],
  term ((-38452883834 : Rat) / 18848747061) [(7, 1), (9, 2), (10, 1), (14, 1), (15, 1)],
  term ((-11025602336 : Rat) / 18848747061) [(7, 1), (9, 2), (10, 2), (11, 1)],
  term ((-344550073 : Rat) / 1396203486) [(7, 1), (9, 2), (10, 2), (13, 1)],
  term ((19226441917 : Rat) / 18848747061) [(7, 1), (9, 2), (10, 2), (15, 1)],
  term ((11025602336 : Rat) / 18848747061) [(7, 1), (9, 2), (11, 1)],
  term ((344550073 : Rat) / 698101743) [(7, 1), (9, 2), (11, 1), (13, 1), (15, 1)],
  term ((-22051204672 : Rat) / 18848747061) [(7, 1), (9, 2), (11, 1), (14, 1)],
  term ((-38452883834 : Rat) / 18848747061) [(7, 1), (9, 2), (11, 1), (15, 2)],
  term ((-344550073 : Rat) / 1396203486) [(7, 1), (9, 2), (11, 2), (13, 1)],
  term ((41277646589 : Rat) / 18848747061) [(7, 1), (9, 2), (11, 2), (15, 1)],
  term ((-11025602336 : Rat) / 18848747061) [(7, 1), (9, 2), (11, 3)],
  term ((344550073 : Rat) / 1396203486) [(7, 1), (9, 2), (13, 1)],
  term ((-344550073 : Rat) / 698101743) [(7, 1), (9, 2), (13, 1), (14, 1)],
  term ((38452883834 : Rat) / 18848747061) [(7, 1), (9, 2), (14, 1), (15, 1)],
  term ((-19226441917 : Rat) / 18848747061) [(7, 1), (9, 2), (15, 1)],
  term ((-488457671296 : Rat) / 31414578435) [(7, 1), (10, 1), (11, 1)],
  term ((22346751616 : Rat) / 330679773) [(7, 1), (10, 1), (11, 1), (12, 1), (14, 1)],
  term ((779878400 : Rat) / 110226591) [(7, 1), (10, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((181153280 : Rat) / 110226591) [(7, 1), (10, 1), (11, 1), (12, 1), (14, 2)],
  term ((23457280 : Rat) / 12247399) [(7, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((38993920 : Rat) / 110226591) [(7, 1), (10, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((-15264302228 : Rat) / 1163502905) [(7, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((79475599178834 : Rat) / 471218676525) [(7, 1), (10, 1), (11, 1), (14, 1)],
  term ((-7971334720 : Rat) / 110226591) [(7, 1), (10, 1), (11, 1), (14, 1), (15, 2)],
  term ((-2320 : Rat) / 67) [(7, 1), (10, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-202546857628 : Rat) / 8266994325) [(7, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-13355432384 : Rat) / 918554925) [(7, 1), (10, 1), (11, 1), (14, 2)],
  term ((19496960 : Rat) / 36742197) [(7, 1), (10, 1), (11, 1), (14, 2), (15, 2)],
  term ((103342925728 : Rat) / 8266994325) [(7, 1), (10, 1), (11, 1), (14, 2), (16, 1)],
  term ((-6581478400 : Rat) / 110226591) [(7, 1), (10, 1), (11, 1), (14, 3)],
  term ((880968300016 : Rat) / 31414578435) [(7, 1), (10, 1), (11, 1), (15, 2)],
  term ((7632151114 : Rat) / 1163502905) [(7, 1), (10, 1), (11, 2), (13, 1)],
  term ((97484800 : Rat) / 36742197) [(7, 1), (10, 1), (11, 2), (14, 1), (15, 1)],
  term ((-283479898520 : Rat) / 6282915687) [(7, 1), (10, 1), (11, 2), (15, 1)],
  term ((488457671296 : Rat) / 31414578435) [(7, 1), (10, 1), (11, 3)],
  term ((349167994 : Rat) / 12247399) [(7, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((36556800 : Rat) / 12247399) [(7, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((8491560 : Rat) / 12247399) [(7, 1), (10, 1), (12, 1), (13, 1), (14, 2)],
  term ((-20329660052 : Rat) / 330679773) [(7, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((189 : Rat) / 67) [(7, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-703283200 : Rat) / 110226591) [(7, 1), (10, 1), (12, 1), (14, 1), (15, 3)],
  term ((-163361440 : Rat) / 110226591) [(7, 1), (10, 1), (12, 1), (14, 2), (15, 1)],
  term ((-7632151114 : Rat) / 1163502905) [(7, 1), (10, 1), (13, 1)],
  term ((15264302228 : Rat) / 1163502905) [(7, 1), (10, 1), (13, 1), (14, 1)],
  term ((-880968300016 : Rat) / 31414578435) [(7, 1), (10, 1), (14, 1), (15, 1)],
  term ((440484150008 : Rat) / 31414578435) [(7, 1), (10, 1), (15, 1)],
  term ((-32410934519977 : Rat) / 471218676525) [(7, 1), (10, 2), (11, 1)],
  term ((-11173375808 : Rat) / 330679773) [(7, 1), (10, 2), (11, 1), (12, 1)],
  term ((-90576640 : Rat) / 110226591) [(7, 1), (10, 2), (11, 1), (12, 1), (14, 1)],
  term ((-389939200 : Rat) / 110226591) [(7, 1), (10, 2), (11, 1), (12, 1), (15, 2)],
  term ((-19496960 : Rat) / 110226591) [(7, 1), (10, 2), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-11728640 : Rat) / 12247399) [(7, 1), (10, 2), (11, 1), (13, 1), (15, 1)],
  term ((-3742687244128 : Rat) / 157072892175) [(7, 1), (10, 2), (11, 1), (14, 1)],
  term ((-9748480 : Rat) / 36742197) [(7, 1), (10, 2), (11, 1), (14, 1), (15, 2)],
  term ((-51671462864 : Rat) / 8266994325) [(7, 1), (10, 2), (11, 1), (14, 1), (16, 1)],
  term ((3290739200 : Rat) / 110226591) [(7, 1), (10, 2), (11, 1), (14, 2)],
  term ((3985667360 : Rat) / 110226591) [(7, 1), (10, 2), (11, 1), (15, 2)],
  term ((1160 : Rat) / 67) [(7, 1), (10, 2), (11, 1), (15, 2), (16, 1)],
  term ((101273428814 : Rat) / 8266994325) [(7, 1), (10, 2), (11, 1), (16, 1)],
  term ((-48742400 : Rat) / 36742197) [(7, 1), (10, 2), (11, 2), (15, 1)],
  term ((-174583997 : Rat) / 12247399) [(7, 1), (10, 2), (12, 1), (13, 1)],
  term ((-4245780 : Rat) / 12247399) [(7, 1), (10, 2), (12, 1), (13, 1), (14, 1)],
  term ((-18278400 : Rat) / 12247399) [(7, 1), (10, 2), (12, 1), (13, 1), (15, 2)],
  term ((81680720 : Rat) / 110226591) [(7, 1), (10, 2), (12, 1), (14, 1), (15, 1)],
  term ((10164830026 : Rat) / 330679773) [(7, 1), (10, 2), (12, 1), (15, 1)],
  term ((-189 : Rat) / 134) [(7, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((351641600 : Rat) / 110226591) [(7, 1), (10, 2), (12, 1), (15, 3)],
  term ((-15264302228 : Rat) / 1163502905) [(7, 1), (10, 2), (13, 1), (14, 1)],
  term ((880968300016 : Rat) / 31414578435) [(7, 1), (10, 2), (14, 1), (15, 1)],
  term ((488457671296 : Rat) / 31414578435) [(7, 1), (10, 3), (11, 1)],
  term ((7632151114 : Rat) / 1163502905) [(7, 1), (10, 3), (13, 1)],
  term ((-440484150008 : Rat) / 31414578435) [(7, 1), (10, 3), (15, 1)],
  term ((32410934519977 : Rat) / 471218676525) [(7, 1), (11, 1)],
  term ((11173375808 : Rat) / 330679773) [(7, 1), (11, 1), (12, 1)],
  term ((8491560 : Rat) / 12247399) [(7, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((349167994 : Rat) / 12247399) [(7, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((36556800 : Rat) / 12247399) [(7, 1), (11, 1), (12, 1), (13, 1), (15, 3)],
  term ((-22075021696 : Rat) / 330679773) [(7, 1), (11, 1), (12, 1), (14, 1)],
  term ((-314413280 : Rat) / 36742197) [(7, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((-181153280 : Rat) / 110226591) [(7, 1), (11, 1), (12, 1), (14, 2)],
  term ((-19159842452 : Rat) / 330679773) [(7, 1), (11, 1), (12, 1), (15, 2)],
  term ((189 : Rat) / 67) [(7, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-703283200 : Rat) / 110226591) [(7, 1), (11, 1), (12, 1), (15, 4)],
  term ((-191618560 : Rat) / 110226591) [(7, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-38993920 : Rat) / 110226591) [(7, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((11728640 : Rat) / 12247399) [(7, 1), (11, 1), (13, 1), (15, 1)],
  term ((-2729901497858 : Rat) / 18848747061) [(7, 1), (11, 1), (14, 1)],
  term ((8000580160 : Rat) / 110226591) [(7, 1), (11, 1), (14, 1), (15, 2)],
  term ((2320 : Rat) / 67) [(7, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((84739440164 : Rat) / 2755664775) [(7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-42202182848 : Rat) / 2755664775) [(7, 1), (11, 1), (14, 2)],
  term ((-19496960 : Rat) / 36742197) [(7, 1), (11, 1), (14, 2), (15, 2)],
  term ((-103342925728 : Rat) / 8266994325) [(7, 1), (11, 1), (14, 2), (16, 1)],
  term ((6581478400 : Rat) / 110226591) [(7, 1), (11, 1), (14, 3)],
  term ((-3985667360 : Rat) / 110226591) [(7, 1), (11, 1), (15, 2)],
  term ((-1160 : Rat) / 67) [(7, 1), (11, 1), (15, 2), (16, 1)],
  term ((-101273428814 : Rat) / 8266994325) [(7, 1), (11, 1), (16, 1)],
  term ((-174583997 : Rat) / 12247399) [(7, 1), (11, 2), (12, 1), (13, 1)],
  term ((-4245780 : Rat) / 12247399) [(7, 1), (11, 2), (12, 1), (13, 1), (14, 1)],
  term ((-18278400 : Rat) / 12247399) [(7, 1), (11, 2), (12, 1), (13, 1), (15, 2)],
  term ((262834000 : Rat) / 110226591) [(7, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((32511581642 : Rat) / 330679773) [(7, 1), (11, 2), (12, 1), (15, 1)],
  term ((-189 : Rat) / 134) [(7, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((1131520000 : Rat) / 110226591) [(7, 1), (11, 2), (12, 1), (15, 3)],
  term ((38993920 : Rat) / 110226591) [(7, 1), (11, 2), (13, 1), (14, 1), (15, 2)],
  term ((23457280 : Rat) / 12247399) [(7, 1), (11, 2), (13, 1), (15, 2)],
  term ((-5264184128 : Rat) / 306184975) [(7, 1), (11, 2), (14, 1), (15, 1)],
  term ((103342925728 : Rat) / 8266994325) [(7, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((19496960 : Rat) / 36742197) [(7, 1), (11, 2), (14, 1), (15, 3)],
  term ((-6581478400 : Rat) / 110226591) [(7, 1), (11, 2), (14, 2), (15, 1)],
  term ((65446990319954 : Rat) / 471218676525) [(7, 1), (11, 2), (15, 1)],
  term ((-202546857628 : Rat) / 8266994325) [(7, 1), (11, 2), (15, 1), (16, 1)],
  term ((-7971334720 : Rat) / 110226591) [(7, 1), (11, 2), (15, 3)],
  term ((-2320 : Rat) / 67) [(7, 1), (11, 2), (15, 3), (16, 1)],
  term ((-32410934519977 : Rat) / 471218676525) [(7, 1), (11, 3)],
  term ((-11173375808 : Rat) / 330679773) [(7, 1), (11, 3), (12, 1)],
  term ((-90576640 : Rat) / 110226591) [(7, 1), (11, 3), (12, 1), (14, 1)],
  term ((-389939200 : Rat) / 110226591) [(7, 1), (11, 3), (12, 1), (15, 2)],
  term ((-19496960 : Rat) / 110226591) [(7, 1), (11, 3), (13, 1), (14, 1), (15, 1)],
  term ((-11728640 : Rat) / 12247399) [(7, 1), (11, 3), (13, 1), (15, 1)],
  term ((6677716192 : Rat) / 918554925) [(7, 1), (11, 3), (14, 1)],
  term ((-9748480 : Rat) / 36742197) [(7, 1), (11, 3), (14, 1), (15, 2)],
  term ((-51671462864 : Rat) / 8266994325) [(7, 1), (11, 3), (14, 1), (16, 1)],
  term ((3290739200 : Rat) / 110226591) [(7, 1), (11, 3), (14, 2)],
  term ((4278121760 : Rat) / 110226591) [(7, 1), (11, 3), (15, 2)],
  term ((1160 : Rat) / 67) [(7, 1), (11, 3), (15, 2), (16, 1)],
  term ((101273428814 : Rat) / 8266994325) [(7, 1), (11, 3), (16, 1)],
  term ((-48742400 : Rat) / 36742197) [(7, 1), (11, 4), (15, 1)],
  term ((174583997 : Rat) / 12247399) [(7, 1), (12, 1), (13, 1)],
  term ((-344922214 : Rat) / 12247399) [(7, 1), (12, 1), (13, 1), (14, 1)],
  term ((-36556800 : Rat) / 12247399) [(7, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((-8491560 : Rat) / 12247399) [(7, 1), (12, 1), (13, 1), (14, 2)],
  term ((18278400 : Rat) / 12247399) [(7, 1), (12, 1), (13, 1), (15, 2)],
  term ((20084617892 : Rat) / 330679773) [(7, 1), (12, 1), (14, 1), (15, 1)],
  term ((-189 : Rat) / 67) [(7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((703283200 : Rat) / 110226591) [(7, 1), (12, 1), (14, 1), (15, 3)],
  term ((163361440 : Rat) / 110226591) [(7, 1), (12, 1), (14, 2), (15, 1)],
  term ((-10164830026 : Rat) / 330679773) [(7, 1), (12, 1), (15, 1)],
  term ((189 : Rat) / 134) [(7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-351641600 : Rat) / 110226591) [(7, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 29, terms 200 through 299. -/
theorem rs_R009_ueqv_R009NNNYN_block_29_0200_0299_valid :
    checkProductSumEq rs_R009_ueqv_R009NNNYN_partials_29_0200_0299
      rs_R009_ueqv_R009NNNYN_block_29_0200_0299 = true := by
  native_decide

end R009UeqvR009NNNYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
