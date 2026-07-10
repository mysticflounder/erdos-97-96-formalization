/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NNNYN, term block 18:200-230

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NNNYNTermShards

/-- Generator polynomial 18 for relaxed split surplus certificate `R009:u=v:R009NNNYN`. -/
def rs_R009_ueqv_R009NNNYN_generator_18_0200_0230 : Poly :=
[
  term (2 : Rat) [(6, 1), (8, 1)],
  term (2 : Rat) [(7, 1), (9, 1)],
  term (-1 : Rat) [(8, 2)],
  term (-1 : Rat) [(9, 2)]
]

/-- Coefficient term 200 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0200 : Poly :=
[
  term ((-1827840 : Rat) / 12247399) [(9, 1), (13, 2), (15, 1)]
]

/-- Partial product 200 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0200 : Poly :=
[
  term ((-3655680 : Rat) / 12247399) [(6, 1), (8, 1), (9, 1), (13, 2), (15, 1)],
  term ((-3655680 : Rat) / 12247399) [(7, 1), (9, 2), (13, 2), (15, 1)],
  term ((1827840 : Rat) / 12247399) [(8, 2), (9, 1), (13, 2), (15, 1)],
  term ((1827840 : Rat) / 12247399) [(9, 3), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 200 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0200_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0200
        rs_R009_ueqv_R009NNNYN_generator_18_0200_0230 =
      rs_R009_ueqv_R009NNNYN_partial_18_0200 := by
  native_decide

/-- Coefficient term 201 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0201 : Poly :=
[
  term ((-386709077576 : Rat) / 24800982975) [(9, 1), (14, 1), (15, 1)]
]

/-- Partial product 201 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0201 : Poly :=
[
  term ((-773418155152 : Rat) / 24800982975) [(6, 1), (8, 1), (9, 1), (14, 1), (15, 1)],
  term ((-773418155152 : Rat) / 24800982975) [(7, 1), (9, 2), (14, 1), (15, 1)],
  term ((386709077576 : Rat) / 24800982975) [(8, 2), (9, 1), (14, 1), (15, 1)],
  term ((386709077576 : Rat) / 24800982975) [(9, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 201 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0201_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0201
        rs_R009_ueqv_R009NNNYN_generator_18_0200_0230 =
      rs_R009_ueqv_R009NNNYN_partial_18_0201 := by
  native_decide

/-- Coefficient term 202 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0202 : Poly :=
[
  term ((20641044794 : Rat) / 24800982975) [(9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 202 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0202 : Poly :=
[
  term ((41282089588 : Rat) / 24800982975) [(6, 1), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((41282089588 : Rat) / 24800982975) [(7, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((-20641044794 : Rat) / 24800982975) [(8, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-20641044794 : Rat) / 24800982975) [(9, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 202 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0202_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0202
        rs_R009_ueqv_R009NNNYN_generator_18_0200_0230 =
      rs_R009_ueqv_R009NNNYN_partial_18_0202 := by
  native_decide

/-- Coefficient term 203 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0203 : Poly :=
[
  term ((17582080 : Rat) / 36742197) [(9, 1), (14, 1), (15, 3)]
]

/-- Partial product 203 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0203 : Poly :=
[
  term ((35164160 : Rat) / 36742197) [(6, 1), (8, 1), (9, 1), (14, 1), (15, 3)],
  term ((35164160 : Rat) / 36742197) [(7, 1), (9, 2), (14, 1), (15, 3)],
  term ((-17582080 : Rat) / 36742197) [(8, 2), (9, 1), (14, 1), (15, 3)],
  term ((-17582080 : Rat) / 36742197) [(9, 3), (14, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 203 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0203_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0203
        rs_R009_ueqv_R009NNNYN_generator_18_0200_0230 =
      rs_R009_ueqv_R009NNNYN_partial_18_0203 := by
  native_decide

/-- Coefficient term 204 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0204 : Poly :=
[
  term ((213203006214 : Rat) / 5817514525) [(9, 1), (15, 1)]
]

/-- Partial product 204 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0204 : Poly :=
[
  term ((426406012428 : Rat) / 5817514525) [(6, 1), (8, 1), (9, 1), (15, 1)],
  term ((426406012428 : Rat) / 5817514525) [(7, 1), (9, 2), (15, 1)],
  term ((-213203006214 : Rat) / 5817514525) [(8, 2), (9, 1), (15, 1)],
  term ((-213203006214 : Rat) / 5817514525) [(9, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 204 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0204_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0204
        rs_R009_ueqv_R009NNNYN_generator_18_0200_0230 =
      rs_R009_ueqv_R009NNNYN_partial_18_0204 := by
  native_decide

/-- Coefficient term 205 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0205 : Poly :=
[
  term ((30318188881 : Rat) / 24800982975) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 205 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0205 : Poly :=
[
  term ((60636377762 : Rat) / 24800982975) [(6, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((60636377762 : Rat) / 24800982975) [(7, 1), (9, 2), (15, 1), (16, 1)],
  term ((-30318188881 : Rat) / 24800982975) [(8, 2), (9, 1), (15, 1), (16, 1)],
  term ((-30318188881 : Rat) / 24800982975) [(9, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 205 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0205_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0205
        rs_R009_ueqv_R009NNNYN_generator_18_0200_0230 =
      rs_R009_ueqv_R009NNNYN_partial_18_0205 := by
  native_decide

/-- Coefficient term 206 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0206 : Poly :=
[
  term ((-5648728000 : Rat) / 110226591) [(9, 1), (15, 3)]
]

/-- Partial product 206 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0206 : Poly :=
[
  term ((-11297456000 : Rat) / 110226591) [(6, 1), (8, 1), (9, 1), (15, 3)],
  term ((-11297456000 : Rat) / 110226591) [(7, 1), (9, 2), (15, 3)],
  term ((5648728000 : Rat) / 110226591) [(8, 2), (9, 1), (15, 3)],
  term ((5648728000 : Rat) / 110226591) [(9, 3), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 206 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0206_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0206
        rs_R009_ueqv_R009NNNYN_generator_18_0200_0230 =
      rs_R009_ueqv_R009NNNYN_partial_18_0206 := by
  native_decide

/-- Coefficient term 207 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0207 : Poly :=
[
  term ((-463 : Rat) / 134) [(9, 2)]
]

/-- Partial product 207 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0207 : Poly :=
[
  term ((-463 : Rat) / 67) [(6, 1), (8, 1), (9, 2)],
  term ((-463 : Rat) / 67) [(7, 1), (9, 3)],
  term ((463 : Rat) / 134) [(8, 2), (9, 2)],
  term ((463 : Rat) / 134) [(9, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 207 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0207_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0207
        rs_R009_ueqv_R009NNNYN_generator_18_0200_0230 =
      rs_R009_ueqv_R009NNNYN_partial_18_0207 := by
  native_decide

/-- Coefficient term 208 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0208 : Poly :=
[
  term ((44102409344 : Rat) / 18848747061) [(9, 2), (11, 1), (15, 1)]
]

/-- Partial product 208 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0208 : Poly :=
[
  term ((88204818688 : Rat) / 18848747061) [(6, 1), (8, 1), (9, 2), (11, 1), (15, 1)],
  term ((88204818688 : Rat) / 18848747061) [(7, 1), (9, 3), (11, 1), (15, 1)],
  term ((-44102409344 : Rat) / 18848747061) [(8, 2), (9, 2), (11, 1), (15, 1)],
  term ((-44102409344 : Rat) / 18848747061) [(9, 4), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 208 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0208_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0208
        rs_R009_ueqv_R009NNNYN_generator_18_0200_0230 =
      rs_R009_ueqv_R009NNNYN_partial_18_0208 := by
  native_decide

/-- Coefficient term 209 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0209 : Poly :=
[
  term ((-22051204672 : Rat) / 18848747061) [(9, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 209 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0209 : Poly :=
[
  term ((-44102409344 : Rat) / 18848747061) [(6, 1), (8, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-44102409344 : Rat) / 18848747061) [(7, 1), (9, 3), (11, 1), (15, 1), (16, 1)],
  term ((22051204672 : Rat) / 18848747061) [(8, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((22051204672 : Rat) / 18848747061) [(9, 4), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 209 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0209_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0209
        rs_R009_ueqv_R009NNNYN_generator_18_0200_0230 =
      rs_R009_ueqv_R009NNNYN_partial_18_0209 := by
  native_decide

/-- Coefficient term 210 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0210 : Poly :=
[
  term ((689100146 : Rat) / 698101743) [(9, 2), (13, 1), (15, 1)]
]

/-- Partial product 210 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0210 : Poly :=
[
  term ((1378200292 : Rat) / 698101743) [(6, 1), (8, 1), (9, 2), (13, 1), (15, 1)],
  term ((1378200292 : Rat) / 698101743) [(7, 1), (9, 3), (13, 1), (15, 1)],
  term ((-689100146 : Rat) / 698101743) [(8, 2), (9, 2), (13, 1), (15, 1)],
  term ((-689100146 : Rat) / 698101743) [(9, 4), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 210 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0210_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0210
        rs_R009_ueqv_R009NNNYN_generator_18_0200_0230 =
      rs_R009_ueqv_R009NNNYN_partial_18_0210 := by
  native_decide

/-- Coefficient term 211 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0211 : Poly :=
[
  term ((-344550073 : Rat) / 698101743) [(9, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 211 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0211 : Poly :=
[
  term ((-689100146 : Rat) / 698101743) [(6, 1), (8, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-689100146 : Rat) / 698101743) [(7, 1), (9, 3), (13, 1), (15, 1), (16, 1)],
  term ((344550073 : Rat) / 698101743) [(8, 2), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((344550073 : Rat) / 698101743) [(9, 4), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 211 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0211_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0211
        rs_R009_ueqv_R009NNNYN_generator_18_0200_0230 =
      rs_R009_ueqv_R009NNNYN_partial_18_0211 := by
  native_decide

/-- Coefficient term 212 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0212 : Poly :=
[
  term ((-76905767668 : Rat) / 18848747061) [(9, 2), (15, 2)]
]

/-- Partial product 212 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0212 : Poly :=
[
  term ((-153811535336 : Rat) / 18848747061) [(6, 1), (8, 1), (9, 2), (15, 2)],
  term ((-153811535336 : Rat) / 18848747061) [(7, 1), (9, 3), (15, 2)],
  term ((76905767668 : Rat) / 18848747061) [(8, 2), (9, 2), (15, 2)],
  term ((76905767668 : Rat) / 18848747061) [(9, 4), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 212 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0212_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0212
        rs_R009_ueqv_R009NNNYN_generator_18_0200_0230 =
      rs_R009_ueqv_R009NNNYN_partial_18_0212 := by
  native_decide

/-- Coefficient term 213 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0213 : Poly :=
[
  term ((38452883834 : Rat) / 18848747061) [(9, 2), (15, 2), (16, 1)]
]

/-- Partial product 213 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0213 : Poly :=
[
  term ((76905767668 : Rat) / 18848747061) [(6, 1), (8, 1), (9, 2), (15, 2), (16, 1)],
  term ((76905767668 : Rat) / 18848747061) [(7, 1), (9, 3), (15, 2), (16, 1)],
  term ((-38452883834 : Rat) / 18848747061) [(8, 2), (9, 2), (15, 2), (16, 1)],
  term ((-38452883834 : Rat) / 18848747061) [(9, 4), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 213 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0213_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0213
        rs_R009_ueqv_R009NNNYN_generator_18_0200_0230 =
      rs_R009_ueqv_R009NNNYN_partial_18_0213 := by
  native_decide

/-- Coefficient term 214 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0214 : Poly :=
[
  term ((-19496960 : Rat) / 110226591) [(10, 1), (11, 1), (13, 1)]
]

/-- Partial product 214 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0214 : Poly :=
[
  term ((-38993920 : Rat) / 110226591) [(6, 1), (8, 1), (10, 1), (11, 1), (13, 1)],
  term ((-38993920 : Rat) / 110226591) [(7, 1), (9, 1), (10, 1), (11, 1), (13, 1)],
  term ((19496960 : Rat) / 110226591) [(8, 2), (10, 1), (11, 1), (13, 1)],
  term ((19496960 : Rat) / 110226591) [(9, 2), (10, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 214 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0214_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0214
        rs_R009_ueqv_R009NNNYN_generator_18_0200_0230 =
      rs_R009_ueqv_R009NNNYN_partial_18_0214 := by
  native_decide

/-- Coefficient term 215 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0215 : Poly :=
[
  term ((17582080 : Rat) / 110226591) [(10, 1), (13, 1), (15, 1)]
]

/-- Partial product 215 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0215 : Poly :=
[
  term ((35164160 : Rat) / 110226591) [(6, 1), (8, 1), (10, 1), (13, 1), (15, 1)],
  term ((35164160 : Rat) / 110226591) [(7, 1), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((-17582080 : Rat) / 110226591) [(8, 2), (10, 1), (13, 1), (15, 1)],
  term ((-17582080 : Rat) / 110226591) [(9, 2), (10, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 215 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0215_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0215
        rs_R009_ueqv_R009NNNYN_generator_18_0200_0230 =
      rs_R009_ueqv_R009NNNYN_partial_18_0215 := by
  native_decide

/-- Coefficient term 216 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0216 : Poly :=
[
  term ((-913920 : Rat) / 12247399) [(10, 1), (13, 2)]
]

/-- Partial product 216 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0216 : Poly :=
[
  term ((-1827840 : Rat) / 12247399) [(6, 1), (8, 1), (10, 1), (13, 2)],
  term ((-1827840 : Rat) / 12247399) [(7, 1), (9, 1), (10, 1), (13, 2)],
  term ((913920 : Rat) / 12247399) [(8, 2), (10, 1), (13, 2)],
  term ((913920 : Rat) / 12247399) [(9, 2), (10, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 216 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0216_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0216
        rs_R009_ueqv_R009NNNYN_generator_18_0200_0230 =
      rs_R009_ueqv_R009NNNYN_partial_18_0216 := by
  native_decide

/-- Coefficient term 217 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0217 : Poly :=
[
  term ((27564402158 : Rat) / 10471526145) [(11, 1), (13, 1)]
]

/-- Partial product 217 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0217 : Poly :=
[
  term ((55128804316 : Rat) / 10471526145) [(6, 1), (8, 1), (11, 1), (13, 1)],
  term ((55128804316 : Rat) / 10471526145) [(7, 1), (9, 1), (11, 1), (13, 1)],
  term ((-27564402158 : Rat) / 10471526145) [(8, 2), (11, 1), (13, 1)],
  term ((-27564402158 : Rat) / 10471526145) [(9, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 217 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0217_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0217
        rs_R009_ueqv_R009NNNYN_generator_18_0200_0230 =
      rs_R009_ueqv_R009NNNYN_partial_18_0217 := by
  native_decide

/-- Coefficient term 218 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0218 : Poly :=
[
  term ((1060460800 : Rat) / 330679773) [(11, 1), (13, 1), (14, 1)]
]

/-- Partial product 218 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0218 : Poly :=
[
  term ((2120921600 : Rat) / 330679773) [(6, 1), (8, 1), (11, 1), (13, 1), (14, 1)],
  term ((2120921600 : Rat) / 330679773) [(7, 1), (9, 1), (11, 1), (13, 1), (14, 1)],
  term ((-1060460800 : Rat) / 330679773) [(8, 2), (11, 1), (13, 1), (14, 1)],
  term ((-1060460800 : Rat) / 330679773) [(9, 2), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 218 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0218_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0218
        rs_R009_ueqv_R009NNNYN_generator_18_0200_0230 =
      rs_R009_ueqv_R009NNNYN_partial_18_0218 := by
  native_decide

/-- Coefficient term 219 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0219 : Poly :=
[
  term ((-72243200 : Rat) / 110226591) [(11, 1), (13, 1), (15, 2)]
]

/-- Partial product 219 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0219 : Poly :=
[
  term ((-144486400 : Rat) / 110226591) [(6, 1), (8, 1), (11, 1), (13, 1), (15, 2)],
  term ((-144486400 : Rat) / 110226591) [(7, 1), (9, 1), (11, 1), (13, 1), (15, 2)],
  term ((72243200 : Rat) / 110226591) [(8, 2), (11, 1), (13, 1), (15, 2)],
  term ((72243200 : Rat) / 110226591) [(9, 2), (11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 219 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0219_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0219
        rs_R009_ueqv_R009NNNYN_generator_18_0200_0230 =
      rs_R009_ueqv_R009NNNYN_partial_18_0219 := by
  native_decide

/-- Coefficient term 220 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0220 : Poly :=
[
  term ((2741760 : Rat) / 12247399) [(11, 1), (13, 2), (15, 1)]
]

/-- Partial product 220 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0220 : Poly :=
[
  term ((5483520 : Rat) / 12247399) [(6, 1), (8, 1), (11, 1), (13, 2), (15, 1)],
  term ((5483520 : Rat) / 12247399) [(7, 1), (9, 1), (11, 1), (13, 2), (15, 1)],
  term ((-2741760 : Rat) / 12247399) [(8, 2), (11, 1), (13, 2), (15, 1)],
  term ((-2741760 : Rat) / 12247399) [(9, 2), (11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 220 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0220_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0220
        rs_R009_ueqv_R009NNNYN_generator_18_0200_0230 =
      rs_R009_ueqv_R009NNNYN_partial_18_0220 := by
  native_decide

/-- Coefficient term 221 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0221 : Poly :=
[
  term ((149611879336 : Rat) / 31414578435) [(11, 1), (15, 1)]
]

/-- Partial product 221 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0221 : Poly :=
[
  term ((299223758672 : Rat) / 31414578435) [(6, 1), (8, 1), (11, 1), (15, 1)],
  term ((299223758672 : Rat) / 31414578435) [(7, 1), (9, 1), (11, 1), (15, 1)],
  term ((-149611879336 : Rat) / 31414578435) [(8, 2), (11, 1), (15, 1)],
  term ((-149611879336 : Rat) / 31414578435) [(9, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 221 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0221_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0221
        rs_R009_ueqv_R009NNNYN_generator_18_0200_0230 =
      rs_R009_ueqv_R009NNNYN_partial_18_0221 := by
  native_decide

/-- Coefficient term 222 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0222 : Poly :=
[
  term ((-165906242432 : Rat) / 31414578435) [(11, 2)]
]

/-- Partial product 222 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0222 : Poly :=
[
  term ((-331812484864 : Rat) / 31414578435) [(6, 1), (8, 1), (11, 2)],
  term ((-331812484864 : Rat) / 31414578435) [(7, 1), (9, 1), (11, 2)],
  term ((165906242432 : Rat) / 31414578435) [(8, 2), (11, 2)],
  term ((165906242432 : Rat) / 31414578435) [(9, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 222 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0222_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0222
        rs_R009_ueqv_R009NNNYN_generator_18_0200_0230 =
      rs_R009_ueqv_R009NNNYN_partial_18_0222 := by
  native_decide

/-- Coefficient term 223 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0223 : Poly :=
[
  term ((19496960 : Rat) / 36742197) [(11, 2), (13, 1), (15, 1)]
]

/-- Partial product 223 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0223 : Poly :=
[
  term ((38993920 : Rat) / 36742197) [(6, 1), (8, 1), (11, 2), (13, 1), (15, 1)],
  term ((38993920 : Rat) / 36742197) [(7, 1), (9, 1), (11, 2), (13, 1), (15, 1)],
  term ((-19496960 : Rat) / 36742197) [(8, 2), (11, 2), (13, 1), (15, 1)],
  term ((-19496960 : Rat) / 36742197) [(9, 2), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 223 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0223_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0223
        rs_R009_ueqv_R009NNNYN_generator_18_0200_0230 =
      rs_R009_ueqv_R009NNNYN_partial_18_0223 := by
  native_decide

/-- Coefficient term 224 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0224 : Poly :=
[
  term ((-1311665768 : Rat) / 330679773) [(13, 1), (14, 1), (15, 1)]
]

/-- Partial product 224 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0224 : Poly :=
[
  term ((-2623331536 : Rat) / 330679773) [(6, 1), (8, 1), (13, 1), (14, 1), (15, 1)],
  term ((-2623331536 : Rat) / 330679773) [(7, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((1311665768 : Rat) / 330679773) [(8, 2), (13, 1), (14, 1), (15, 1)],
  term ((1311665768 : Rat) / 330679773) [(9, 2), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 224 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0224_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0224
        rs_R009_ueqv_R009NNNYN_generator_18_0200_0230 =
      rs_R009_ueqv_R009NNNYN_partial_18_0224 := by
  native_decide

/-- Coefficient term 225 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0225 : Poly :=
[
  term ((-400097042 : Rat) / 110226591) [(13, 1), (15, 1)]
]

/-- Partial product 225 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0225 : Poly :=
[
  term ((-800194084 : Rat) / 110226591) [(6, 1), (8, 1), (13, 1), (15, 1)],
  term ((-800194084 : Rat) / 110226591) [(7, 1), (9, 1), (13, 1), (15, 1)],
  term ((400097042 : Rat) / 110226591) [(8, 2), (13, 1), (15, 1)],
  term ((400097042 : Rat) / 110226591) [(9, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 225 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0225_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0225
        rs_R009_ueqv_R009NNNYN_generator_18_0200_0230 =
      rs_R009_ueqv_R009NNNYN_partial_18_0225 := by
  native_decide

/-- Coefficient term 226 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0226 : Poly :=
[
  term ((17582080 : Rat) / 110226591) [(13, 1), (15, 3)]
]

/-- Partial product 226 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0226 : Poly :=
[
  term ((35164160 : Rat) / 110226591) [(6, 1), (8, 1), (13, 1), (15, 3)],
  term ((35164160 : Rat) / 110226591) [(7, 1), (9, 1), (13, 1), (15, 3)],
  term ((-17582080 : Rat) / 110226591) [(8, 2), (13, 1), (15, 3)],
  term ((-17582080 : Rat) / 110226591) [(9, 2), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 226 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0226_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0226
        rs_R009_ueqv_R009NNNYN_generator_18_0200_0230 =
      rs_R009_ueqv_R009NNNYN_partial_18_0226 := by
  native_decide

/-- Coefficient term 227 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0227 : Poly :=
[
  term ((22336419 : Rat) / 12247399) [(13, 2)]
]

/-- Partial product 227 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0227 : Poly :=
[
  term ((44672838 : Rat) / 12247399) [(6, 1), (8, 1), (13, 2)],
  term ((44672838 : Rat) / 12247399) [(7, 1), (9, 1), (13, 2)],
  term ((-22336419 : Rat) / 12247399) [(8, 2), (13, 2)],
  term ((-22336419 : Rat) / 12247399) [(9, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 227 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0227_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0227
        rs_R009_ueqv_R009NNNYN_generator_18_0200_0230 =
      rs_R009_ueqv_R009NNNYN_partial_18_0227 := by
  native_decide

/-- Coefficient term 228 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0228 : Poly :=
[
  term ((16569700 : Rat) / 12247399) [(13, 2), (14, 1)]
]

/-- Partial product 228 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0228 : Poly :=
[
  term ((33139400 : Rat) / 12247399) [(6, 1), (8, 1), (13, 2), (14, 1)],
  term ((33139400 : Rat) / 12247399) [(7, 1), (9, 1), (13, 2), (14, 1)],
  term ((-16569700 : Rat) / 12247399) [(8, 2), (13, 2), (14, 1)],
  term ((-16569700 : Rat) / 12247399) [(9, 2), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 228 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0228_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0228
        rs_R009_ueqv_R009NNNYN_generator_18_0200_0230 =
      rs_R009_ueqv_R009NNNYN_partial_18_0228 := by
  native_decide

/-- Coefficient term 229 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0229 : Poly :=
[
  term ((-913920 : Rat) / 12247399) [(13, 2), (15, 2)]
]

/-- Partial product 229 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0229 : Poly :=
[
  term ((-1827840 : Rat) / 12247399) [(6, 1), (8, 1), (13, 2), (15, 2)],
  term ((-1827840 : Rat) / 12247399) [(7, 1), (9, 1), (13, 2), (15, 2)],
  term ((913920 : Rat) / 12247399) [(8, 2), (13, 2), (15, 2)],
  term ((913920 : Rat) / 12247399) [(9, 2), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 229 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0229_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0229
        rs_R009_ueqv_R009NNNYN_generator_18_0200_0230 =
      rs_R009_ueqv_R009NNNYN_partial_18_0229 := by
  native_decide

/-- Coefficient term 230 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0230 : Poly :=
[
  term ((147 : Rat) / 67) [(14, 1)]
]

/-- Partial product 230 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0230 : Poly :=
[
  term ((294 : Rat) / 67) [(6, 1), (8, 1), (14, 1)],
  term ((294 : Rat) / 67) [(7, 1), (9, 1), (14, 1)],
  term ((-147 : Rat) / 67) [(8, 2), (14, 1)],
  term ((-147 : Rat) / 67) [(9, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 230 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0230_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0230
        rs_R009_ueqv_R009NNNYN_generator_18_0200_0230 =
      rs_R009_ueqv_R009NNNYN_partial_18_0230 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NNNYN_partials_18_0200_0230 : List Poly :=
[
  rs_R009_ueqv_R009NNNYN_partial_18_0200,
  rs_R009_ueqv_R009NNNYN_partial_18_0201,
  rs_R009_ueqv_R009NNNYN_partial_18_0202,
  rs_R009_ueqv_R009NNNYN_partial_18_0203,
  rs_R009_ueqv_R009NNNYN_partial_18_0204,
  rs_R009_ueqv_R009NNNYN_partial_18_0205,
  rs_R009_ueqv_R009NNNYN_partial_18_0206,
  rs_R009_ueqv_R009NNNYN_partial_18_0207,
  rs_R009_ueqv_R009NNNYN_partial_18_0208,
  rs_R009_ueqv_R009NNNYN_partial_18_0209,
  rs_R009_ueqv_R009NNNYN_partial_18_0210,
  rs_R009_ueqv_R009NNNYN_partial_18_0211,
  rs_R009_ueqv_R009NNNYN_partial_18_0212,
  rs_R009_ueqv_R009NNNYN_partial_18_0213,
  rs_R009_ueqv_R009NNNYN_partial_18_0214,
  rs_R009_ueqv_R009NNNYN_partial_18_0215,
  rs_R009_ueqv_R009NNNYN_partial_18_0216,
  rs_R009_ueqv_R009NNNYN_partial_18_0217,
  rs_R009_ueqv_R009NNNYN_partial_18_0218,
  rs_R009_ueqv_R009NNNYN_partial_18_0219,
  rs_R009_ueqv_R009NNNYN_partial_18_0220,
  rs_R009_ueqv_R009NNNYN_partial_18_0221,
  rs_R009_ueqv_R009NNNYN_partial_18_0222,
  rs_R009_ueqv_R009NNNYN_partial_18_0223,
  rs_R009_ueqv_R009NNNYN_partial_18_0224,
  rs_R009_ueqv_R009NNNYN_partial_18_0225,
  rs_R009_ueqv_R009NNNYN_partial_18_0226,
  rs_R009_ueqv_R009NNNYN_partial_18_0227,
  rs_R009_ueqv_R009NNNYN_partial_18_0228,
  rs_R009_ueqv_R009NNNYN_partial_18_0229,
  rs_R009_ueqv_R009NNNYN_partial_18_0230
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NNNYN_block_18_0200_0230 : Poly :=
[
  term ((-3655680 : Rat) / 12247399) [(6, 1), (8, 1), (9, 1), (13, 2), (15, 1)],
  term ((-773418155152 : Rat) / 24800982975) [(6, 1), (8, 1), (9, 1), (14, 1), (15, 1)],
  term ((41282089588 : Rat) / 24800982975) [(6, 1), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((35164160 : Rat) / 36742197) [(6, 1), (8, 1), (9, 1), (14, 1), (15, 3)],
  term ((426406012428 : Rat) / 5817514525) [(6, 1), (8, 1), (9, 1), (15, 1)],
  term ((60636377762 : Rat) / 24800982975) [(6, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-11297456000 : Rat) / 110226591) [(6, 1), (8, 1), (9, 1), (15, 3)],
  term ((-463 : Rat) / 67) [(6, 1), (8, 1), (9, 2)],
  term ((88204818688 : Rat) / 18848747061) [(6, 1), (8, 1), (9, 2), (11, 1), (15, 1)],
  term ((-44102409344 : Rat) / 18848747061) [(6, 1), (8, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((1378200292 : Rat) / 698101743) [(6, 1), (8, 1), (9, 2), (13, 1), (15, 1)],
  term ((-689100146 : Rat) / 698101743) [(6, 1), (8, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-153811535336 : Rat) / 18848747061) [(6, 1), (8, 1), (9, 2), (15, 2)],
  term ((76905767668 : Rat) / 18848747061) [(6, 1), (8, 1), (9, 2), (15, 2), (16, 1)],
  term ((-38993920 : Rat) / 110226591) [(6, 1), (8, 1), (10, 1), (11, 1), (13, 1)],
  term ((35164160 : Rat) / 110226591) [(6, 1), (8, 1), (10, 1), (13, 1), (15, 1)],
  term ((-1827840 : Rat) / 12247399) [(6, 1), (8, 1), (10, 1), (13, 2)],
  term ((55128804316 : Rat) / 10471526145) [(6, 1), (8, 1), (11, 1), (13, 1)],
  term ((2120921600 : Rat) / 330679773) [(6, 1), (8, 1), (11, 1), (13, 1), (14, 1)],
  term ((-144486400 : Rat) / 110226591) [(6, 1), (8, 1), (11, 1), (13, 1), (15, 2)],
  term ((5483520 : Rat) / 12247399) [(6, 1), (8, 1), (11, 1), (13, 2), (15, 1)],
  term ((299223758672 : Rat) / 31414578435) [(6, 1), (8, 1), (11, 1), (15, 1)],
  term ((-331812484864 : Rat) / 31414578435) [(6, 1), (8, 1), (11, 2)],
  term ((38993920 : Rat) / 36742197) [(6, 1), (8, 1), (11, 2), (13, 1), (15, 1)],
  term ((-2623331536 : Rat) / 330679773) [(6, 1), (8, 1), (13, 1), (14, 1), (15, 1)],
  term ((-800194084 : Rat) / 110226591) [(6, 1), (8, 1), (13, 1), (15, 1)],
  term ((35164160 : Rat) / 110226591) [(6, 1), (8, 1), (13, 1), (15, 3)],
  term ((44672838 : Rat) / 12247399) [(6, 1), (8, 1), (13, 2)],
  term ((33139400 : Rat) / 12247399) [(6, 1), (8, 1), (13, 2), (14, 1)],
  term ((-1827840 : Rat) / 12247399) [(6, 1), (8, 1), (13, 2), (15, 2)],
  term ((294 : Rat) / 67) [(6, 1), (8, 1), (14, 1)],
  term ((-38993920 : Rat) / 110226591) [(7, 1), (9, 1), (10, 1), (11, 1), (13, 1)],
  term ((35164160 : Rat) / 110226591) [(7, 1), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((-1827840 : Rat) / 12247399) [(7, 1), (9, 1), (10, 1), (13, 2)],
  term ((55128804316 : Rat) / 10471526145) [(7, 1), (9, 1), (11, 1), (13, 1)],
  term ((2120921600 : Rat) / 330679773) [(7, 1), (9, 1), (11, 1), (13, 1), (14, 1)],
  term ((-144486400 : Rat) / 110226591) [(7, 1), (9, 1), (11, 1), (13, 1), (15, 2)],
  term ((5483520 : Rat) / 12247399) [(7, 1), (9, 1), (11, 1), (13, 2), (15, 1)],
  term ((299223758672 : Rat) / 31414578435) [(7, 1), (9, 1), (11, 1), (15, 1)],
  term ((-331812484864 : Rat) / 31414578435) [(7, 1), (9, 1), (11, 2)],
  term ((38993920 : Rat) / 36742197) [(7, 1), (9, 1), (11, 2), (13, 1), (15, 1)],
  term ((-2623331536 : Rat) / 330679773) [(7, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((-800194084 : Rat) / 110226591) [(7, 1), (9, 1), (13, 1), (15, 1)],
  term ((35164160 : Rat) / 110226591) [(7, 1), (9, 1), (13, 1), (15, 3)],
  term ((44672838 : Rat) / 12247399) [(7, 1), (9, 1), (13, 2)],
  term ((33139400 : Rat) / 12247399) [(7, 1), (9, 1), (13, 2), (14, 1)],
  term ((-1827840 : Rat) / 12247399) [(7, 1), (9, 1), (13, 2), (15, 2)],
  term ((294 : Rat) / 67) [(7, 1), (9, 1), (14, 1)],
  term ((-3655680 : Rat) / 12247399) [(7, 1), (9, 2), (13, 2), (15, 1)],
  term ((-773418155152 : Rat) / 24800982975) [(7, 1), (9, 2), (14, 1), (15, 1)],
  term ((41282089588 : Rat) / 24800982975) [(7, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((35164160 : Rat) / 36742197) [(7, 1), (9, 2), (14, 1), (15, 3)],
  term ((426406012428 : Rat) / 5817514525) [(7, 1), (9, 2), (15, 1)],
  term ((60636377762 : Rat) / 24800982975) [(7, 1), (9, 2), (15, 1), (16, 1)],
  term ((-11297456000 : Rat) / 110226591) [(7, 1), (9, 2), (15, 3)],
  term ((-463 : Rat) / 67) [(7, 1), (9, 3)],
  term ((88204818688 : Rat) / 18848747061) [(7, 1), (9, 3), (11, 1), (15, 1)],
  term ((-44102409344 : Rat) / 18848747061) [(7, 1), (9, 3), (11, 1), (15, 1), (16, 1)],
  term ((1378200292 : Rat) / 698101743) [(7, 1), (9, 3), (13, 1), (15, 1)],
  term ((-689100146 : Rat) / 698101743) [(7, 1), (9, 3), (13, 1), (15, 1), (16, 1)],
  term ((-153811535336 : Rat) / 18848747061) [(7, 1), (9, 3), (15, 2)],
  term ((76905767668 : Rat) / 18848747061) [(7, 1), (9, 3), (15, 2), (16, 1)],
  term ((1827840 : Rat) / 12247399) [(8, 2), (9, 1), (13, 2), (15, 1)],
  term ((386709077576 : Rat) / 24800982975) [(8, 2), (9, 1), (14, 1), (15, 1)],
  term ((-20641044794 : Rat) / 24800982975) [(8, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-17582080 : Rat) / 36742197) [(8, 2), (9, 1), (14, 1), (15, 3)],
  term ((-213203006214 : Rat) / 5817514525) [(8, 2), (9, 1), (15, 1)],
  term ((-30318188881 : Rat) / 24800982975) [(8, 2), (9, 1), (15, 1), (16, 1)],
  term ((5648728000 : Rat) / 110226591) [(8, 2), (9, 1), (15, 3)],
  term ((463 : Rat) / 134) [(8, 2), (9, 2)],
  term ((-44102409344 : Rat) / 18848747061) [(8, 2), (9, 2), (11, 1), (15, 1)],
  term ((22051204672 : Rat) / 18848747061) [(8, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-689100146 : Rat) / 698101743) [(8, 2), (9, 2), (13, 1), (15, 1)],
  term ((344550073 : Rat) / 698101743) [(8, 2), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((76905767668 : Rat) / 18848747061) [(8, 2), (9, 2), (15, 2)],
  term ((-38452883834 : Rat) / 18848747061) [(8, 2), (9, 2), (15, 2), (16, 1)],
  term ((19496960 : Rat) / 110226591) [(8, 2), (10, 1), (11, 1), (13, 1)],
  term ((-17582080 : Rat) / 110226591) [(8, 2), (10, 1), (13, 1), (15, 1)],
  term ((913920 : Rat) / 12247399) [(8, 2), (10, 1), (13, 2)],
  term ((-27564402158 : Rat) / 10471526145) [(8, 2), (11, 1), (13, 1)],
  term ((-1060460800 : Rat) / 330679773) [(8, 2), (11, 1), (13, 1), (14, 1)],
  term ((72243200 : Rat) / 110226591) [(8, 2), (11, 1), (13, 1), (15, 2)],
  term ((-2741760 : Rat) / 12247399) [(8, 2), (11, 1), (13, 2), (15, 1)],
  term ((-149611879336 : Rat) / 31414578435) [(8, 2), (11, 1), (15, 1)],
  term ((165906242432 : Rat) / 31414578435) [(8, 2), (11, 2)],
  term ((-19496960 : Rat) / 36742197) [(8, 2), (11, 2), (13, 1), (15, 1)],
  term ((1311665768 : Rat) / 330679773) [(8, 2), (13, 1), (14, 1), (15, 1)],
  term ((400097042 : Rat) / 110226591) [(8, 2), (13, 1), (15, 1)],
  term ((-17582080 : Rat) / 110226591) [(8, 2), (13, 1), (15, 3)],
  term ((-22336419 : Rat) / 12247399) [(8, 2), (13, 2)],
  term ((-16569700 : Rat) / 12247399) [(8, 2), (13, 2), (14, 1)],
  term ((913920 : Rat) / 12247399) [(8, 2), (13, 2), (15, 2)],
  term ((-147 : Rat) / 67) [(8, 2), (14, 1)],
  term ((19496960 : Rat) / 110226591) [(9, 2), (10, 1), (11, 1), (13, 1)],
  term ((-17582080 : Rat) / 110226591) [(9, 2), (10, 1), (13, 1), (15, 1)],
  term ((913920 : Rat) / 12247399) [(9, 2), (10, 1), (13, 2)],
  term ((-27564402158 : Rat) / 10471526145) [(9, 2), (11, 1), (13, 1)],
  term ((-1060460800 : Rat) / 330679773) [(9, 2), (11, 1), (13, 1), (14, 1)],
  term ((72243200 : Rat) / 110226591) [(9, 2), (11, 1), (13, 1), (15, 2)],
  term ((-2741760 : Rat) / 12247399) [(9, 2), (11, 1), (13, 2), (15, 1)],
  term ((-149611879336 : Rat) / 31414578435) [(9, 2), (11, 1), (15, 1)],
  term ((165906242432 : Rat) / 31414578435) [(9, 2), (11, 2)],
  term ((-19496960 : Rat) / 36742197) [(9, 2), (11, 2), (13, 1), (15, 1)],
  term ((1311665768 : Rat) / 330679773) [(9, 2), (13, 1), (14, 1), (15, 1)],
  term ((400097042 : Rat) / 110226591) [(9, 2), (13, 1), (15, 1)],
  term ((-17582080 : Rat) / 110226591) [(9, 2), (13, 1), (15, 3)],
  term ((-22336419 : Rat) / 12247399) [(9, 2), (13, 2)],
  term ((-16569700 : Rat) / 12247399) [(9, 2), (13, 2), (14, 1)],
  term ((913920 : Rat) / 12247399) [(9, 2), (13, 2), (15, 2)],
  term ((-147 : Rat) / 67) [(9, 2), (14, 1)],
  term ((1827840 : Rat) / 12247399) [(9, 3), (13, 2), (15, 1)],
  term ((386709077576 : Rat) / 24800982975) [(9, 3), (14, 1), (15, 1)],
  term ((-20641044794 : Rat) / 24800982975) [(9, 3), (14, 1), (15, 1), (16, 1)],
  term ((-17582080 : Rat) / 36742197) [(9, 3), (14, 1), (15, 3)],
  term ((-213203006214 : Rat) / 5817514525) [(9, 3), (15, 1)],
  term ((-30318188881 : Rat) / 24800982975) [(9, 3), (15, 1), (16, 1)],
  term ((5648728000 : Rat) / 110226591) [(9, 3), (15, 3)],
  term ((463 : Rat) / 134) [(9, 4)],
  term ((-44102409344 : Rat) / 18848747061) [(9, 4), (11, 1), (15, 1)],
  term ((22051204672 : Rat) / 18848747061) [(9, 4), (11, 1), (15, 1), (16, 1)],
  term ((-689100146 : Rat) / 698101743) [(9, 4), (13, 1), (15, 1)],
  term ((344550073 : Rat) / 698101743) [(9, 4), (13, 1), (15, 1), (16, 1)],
  term ((76905767668 : Rat) / 18848747061) [(9, 4), (15, 2)],
  term ((-38452883834 : Rat) / 18848747061) [(9, 4), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 18, terms 200 through 230. -/
theorem rs_R009_ueqv_R009NNNYN_block_18_0200_0230_valid :
    checkProductSumEq rs_R009_ueqv_R009NNNYN_partials_18_0200_0230
      rs_R009_ueqv_R009NNNYN_block_18_0200_0230 = true := by
  native_decide

end R009UeqvR009NNNYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
