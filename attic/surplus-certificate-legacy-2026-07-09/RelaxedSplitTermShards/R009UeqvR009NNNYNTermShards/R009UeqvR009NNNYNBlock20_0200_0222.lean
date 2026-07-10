/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NNNYN, term block 20:200-222

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NNNYNTermShards

/-- Generator polynomial 20 for relaxed split surplus certificate `R009:u=v:R009NNNYN`. -/
def rs_R009_ueqv_R009NNNYN_generator_20_0200_0222 : Poly :=
[
  term (2 : Rat) [(4, 1), (8, 1)],
  term (-1 : Rat) [(4, 2)],
  term (2 : Rat) [(5, 1), (9, 1)],
  term (-1 : Rat) [(5, 2)]
]

/-- Coefficient term 200 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NNNYN_coefficient_20_0200 : Poly :=
[
  term ((68130560 : Rat) / 110226591) [(11, 1), (13, 1), (15, 2)]
]

/-- Partial product 200 for generator 20. -/
def rs_R009_ueqv_R009NNNYN_partial_20_0200 : Poly :=
[
  term ((136261120 : Rat) / 110226591) [(4, 1), (8, 1), (11, 1), (13, 1), (15, 2)],
  term ((-68130560 : Rat) / 110226591) [(4, 2), (11, 1), (13, 1), (15, 2)],
  term ((136261120 : Rat) / 110226591) [(5, 1), (9, 1), (11, 1), (13, 1), (15, 2)],
  term ((-68130560 : Rat) / 110226591) [(5, 2), (11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 200 for generator 20. -/
theorem rs_R009_ueqv_R009NNNYN_partial_20_0200_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_20_0200
        rs_R009_ueqv_R009NNNYN_generator_20_0200_0222 =
      rs_R009_ueqv_R009NNNYN_partial_20_0200 := by
  native_decide

/-- Coefficient term 201 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NNNYN_coefficient_20_0201 : Poly :=
[
  term ((-2741760 : Rat) / 12247399) [(11, 1), (13, 2), (15, 1)]
]

/-- Partial product 201 for generator 20. -/
def rs_R009_ueqv_R009NNNYN_partial_20_0201 : Poly :=
[
  term ((-5483520 : Rat) / 12247399) [(4, 1), (8, 1), (11, 1), (13, 2), (15, 1)],
  term ((2741760 : Rat) / 12247399) [(4, 2), (11, 1), (13, 2), (15, 1)],
  term ((-5483520 : Rat) / 12247399) [(5, 1), (9, 1), (11, 1), (13, 2), (15, 1)],
  term ((2741760 : Rat) / 12247399) [(5, 2), (11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 201 for generator 20. -/
theorem rs_R009_ueqv_R009NNNYN_partial_20_0201_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_20_0201
        rs_R009_ueqv_R009NNNYN_generator_20_0200_0222 =
      rs_R009_ueqv_R009NNNYN_partial_20_0201 := by
  native_decide

/-- Coefficient term 202 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NNNYN_coefficient_20_0202 : Poly :=
[
  term ((-153741932 : Rat) / 330679773) [(11, 1), (14, 1), (15, 1)]
]

/-- Partial product 202 for generator 20. -/
def rs_R009_ueqv_R009NNNYN_partial_20_0202 : Poly :=
[
  term ((-307483864 : Rat) / 330679773) [(4, 1), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((153741932 : Rat) / 330679773) [(4, 2), (11, 1), (14, 1), (15, 1)],
  term ((-307483864 : Rat) / 330679773) [(5, 1), (9, 1), (11, 1), (14, 1), (15, 1)],
  term ((153741932 : Rat) / 330679773) [(5, 2), (11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 202 for generator 20. -/
theorem rs_R009_ueqv_R009NNNYN_partial_20_0202_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_20_0202
        rs_R009_ueqv_R009NNNYN_generator_20_0200_0222 =
      rs_R009_ueqv_R009NNNYN_partial_20_0202 := by
  native_decide

/-- Coefficient term 203 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NNNYN_coefficient_20_0203 : Poly :=
[
  term ((8791040 : Rat) / 36742197) [(11, 1), (14, 2), (15, 1)]
]

/-- Partial product 203 for generator 20. -/
def rs_R009_ueqv_R009NNNYN_partial_20_0203 : Poly :=
[
  term ((17582080 : Rat) / 36742197) [(4, 1), (8, 1), (11, 1), (14, 2), (15, 1)],
  term ((-8791040 : Rat) / 36742197) [(4, 2), (11, 1), (14, 2), (15, 1)],
  term ((17582080 : Rat) / 36742197) [(5, 1), (9, 1), (11, 1), (14, 2), (15, 1)],
  term ((-8791040 : Rat) / 36742197) [(5, 2), (11, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 203 for generator 20. -/
theorem rs_R009_ueqv_R009NNNYN_partial_20_0203_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_20_0203
        rs_R009_ueqv_R009NNNYN_generator_20_0200_0222 =
      rs_R009_ueqv_R009NNNYN_partial_20_0203 := by
  native_decide

/-- Coefficient term 204 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NNNYN_coefficient_20_0204 : Poly :=
[
  term ((1197351675839 : Rat) / 94243735305) [(11, 1), (15, 1)]
]

/-- Partial product 204 for generator 20. -/
def rs_R009_ueqv_R009NNNYN_partial_20_0204 : Poly :=
[
  term ((2394703351678 : Rat) / 94243735305) [(4, 1), (8, 1), (11, 1), (15, 1)],
  term ((-1197351675839 : Rat) / 94243735305) [(4, 2), (11, 1), (15, 1)],
  term ((2394703351678 : Rat) / 94243735305) [(5, 1), (9, 1), (11, 1), (15, 1)],
  term ((-1197351675839 : Rat) / 94243735305) [(5, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 204 for generator 20. -/
theorem rs_R009_ueqv_R009NNNYN_partial_20_0204_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_20_0204
        rs_R009_ueqv_R009NNNYN_generator_20_0200_0222 =
      rs_R009_ueqv_R009NNNYN_partial_20_0204 := by
  native_decide

/-- Coefficient term 205 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NNNYN_coefficient_20_0205 : Poly :=
[
  term ((8791040 : Rat) / 110226591) [(11, 1), (15, 3)]
]

/-- Partial product 205 for generator 20. -/
def rs_R009_ueqv_R009NNNYN_partial_20_0205 : Poly :=
[
  term ((17582080 : Rat) / 110226591) [(4, 1), (8, 1), (11, 1), (15, 3)],
  term ((-8791040 : Rat) / 110226591) [(4, 2), (11, 1), (15, 3)],
  term ((17582080 : Rat) / 110226591) [(5, 1), (9, 1), (11, 1), (15, 3)],
  term ((-8791040 : Rat) / 110226591) [(5, 2), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 205 for generator 20. -/
theorem rs_R009_ueqv_R009NNNYN_partial_20_0205_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_20_0205
        rs_R009_ueqv_R009NNNYN_generator_20_0200_0222 =
      rs_R009_ueqv_R009NNNYN_partial_20_0205 := by
  native_decide

/-- Coefficient term 206 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NNNYN_coefficient_20_0206 : Poly :=
[
  term ((-154391463296 : Rat) / 31414578435) [(11, 2)]
]

/-- Partial product 206 for generator 20. -/
def rs_R009_ueqv_R009NNNYN_partial_20_0206 : Poly :=
[
  term ((-308782926592 : Rat) / 31414578435) [(4, 1), (8, 1), (11, 2)],
  term ((154391463296 : Rat) / 31414578435) [(4, 2), (11, 2)],
  term ((-308782926592 : Rat) / 31414578435) [(5, 1), (9, 1), (11, 2)],
  term ((154391463296 : Rat) / 31414578435) [(5, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 206 for generator 20. -/
theorem rs_R009_ueqv_R009NNNYN_partial_20_0206_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_20_0206
        rs_R009_ueqv_R009NNNYN_generator_20_0200_0222 =
      rs_R009_ueqv_R009NNNYN_partial_20_0206 := by
  native_decide

/-- Coefficient term 207 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NNNYN_coefficient_20_0207 : Poly :=
[
  term ((77987840 : Rat) / 110226591) [(11, 2), (12, 1)]
]

/-- Partial product 207 for generator 20. -/
def rs_R009_ueqv_R009NNNYN_partial_20_0207 : Poly :=
[
  term ((155975680 : Rat) / 110226591) [(4, 1), (8, 1), (11, 2), (12, 1)],
  term ((-77987840 : Rat) / 110226591) [(4, 2), (11, 2), (12, 1)],
  term ((155975680 : Rat) / 110226591) [(5, 1), (9, 1), (11, 2), (12, 1)],
  term ((-77987840 : Rat) / 110226591) [(5, 2), (11, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 207 for generator 20. -/
theorem rs_R009_ueqv_R009NNNYN_partial_20_0207_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_20_0207
        rs_R009_ueqv_R009NNNYN_generator_20_0200_0222 =
      rs_R009_ueqv_R009NNNYN_partial_20_0207 := by
  native_decide

/-- Coefficient term 208 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NNNYN_coefficient_20_0208 : Poly :=
[
  term ((-194969600 : Rat) / 110226591) [(11, 2), (12, 1), (14, 1)]
]

/-- Partial product 208 for generator 20. -/
def rs_R009_ueqv_R009NNNYN_partial_20_0208 : Poly :=
[
  term ((-389939200 : Rat) / 110226591) [(4, 1), (8, 1), (11, 2), (12, 1), (14, 1)],
  term ((194969600 : Rat) / 110226591) [(4, 2), (11, 2), (12, 1), (14, 1)],
  term ((-389939200 : Rat) / 110226591) [(5, 1), (9, 1), (11, 2), (12, 1), (14, 1)],
  term ((194969600 : Rat) / 110226591) [(5, 2), (11, 2), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 208 for generator 20. -/
theorem rs_R009_ueqv_R009NNNYN_partial_20_0208_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_20_0208
        rs_R009_ueqv_R009NNNYN_generator_20_0200_0222 =
      rs_R009_ueqv_R009NNNYN_partial_20_0208 := by
  native_decide

/-- Coefficient term 209 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NNNYN_coefficient_20_0209 : Poly :=
[
  term ((-19496960 : Rat) / 36742197) [(11, 2), (13, 1), (15, 1)]
]

/-- Partial product 209 for generator 20. -/
def rs_R009_ueqv_R009NNNYN_partial_20_0209 : Poly :=
[
  term ((-38993920 : Rat) / 36742197) [(4, 1), (8, 1), (11, 2), (13, 1), (15, 1)],
  term ((19496960 : Rat) / 36742197) [(4, 2), (11, 2), (13, 1), (15, 1)],
  term ((-38993920 : Rat) / 36742197) [(5, 1), (9, 1), (11, 2), (13, 1), (15, 1)],
  term ((19496960 : Rat) / 36742197) [(5, 2), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 209 for generator 20. -/
theorem rs_R009_ueqv_R009NNNYN_partial_20_0209_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_20_0209
        rs_R009_ueqv_R009NNNYN_generator_20_0200_0222 =
      rs_R009_ueqv_R009NNNYN_partial_20_0209 := by
  native_decide

/-- Coefficient term 210 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NNNYN_coefficient_20_0210 : Poly :=
[
  term ((536166400 : Rat) / 330679773) [(11, 2), (14, 1)]
]

/-- Partial product 210 for generator 20. -/
def rs_R009_ueqv_R009NNNYN_partial_20_0210 : Poly :=
[
  term ((1072332800 : Rat) / 330679773) [(4, 1), (8, 1), (11, 2), (14, 1)],
  term ((-536166400 : Rat) / 330679773) [(4, 2), (11, 2), (14, 1)],
  term ((1072332800 : Rat) / 330679773) [(5, 1), (9, 1), (11, 2), (14, 1)],
  term ((-536166400 : Rat) / 330679773) [(5, 2), (11, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 210 for generator 20. -/
theorem rs_R009_ueqv_R009NNNYN_partial_20_0210_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_20_0210
        rs_R009_ueqv_R009NNNYN_generator_20_0200_0222 =
      rs_R009_ueqv_R009NNNYN_partial_20_0210 := by
  native_decide

/-- Coefficient term 211 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NNNYN_coefficient_20_0211 : Poly :=
[
  term ((-9748480 : Rat) / 36742197) [(11, 2), (14, 2)]
]

/-- Partial product 211 for generator 20. -/
def rs_R009_ueqv_R009NNNYN_partial_20_0211 : Poly :=
[
  term ((-19496960 : Rat) / 36742197) [(4, 1), (8, 1), (11, 2), (14, 2)],
  term ((9748480 : Rat) / 36742197) [(4, 2), (11, 2), (14, 2)],
  term ((-19496960 : Rat) / 36742197) [(5, 1), (9, 1), (11, 2), (14, 2)],
  term ((9748480 : Rat) / 36742197) [(5, 2), (11, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 211 for generator 20. -/
theorem rs_R009_ueqv_R009NNNYN_partial_20_0211_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_20_0211
        rs_R009_ueqv_R009NNNYN_generator_20_0200_0222 =
      rs_R009_ueqv_R009NNNYN_partial_20_0211 := by
  native_decide

/-- Coefficient term 212 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NNNYN_coefficient_20_0212 : Poly :=
[
  term ((-9748480 : Rat) / 110226591) [(11, 2), (15, 2)]
]

/-- Partial product 212 for generator 20. -/
def rs_R009_ueqv_R009NNNYN_partial_20_0212 : Poly :=
[
  term ((-19496960 : Rat) / 110226591) [(4, 1), (8, 1), (11, 2), (15, 2)],
  term ((9748480 : Rat) / 110226591) [(4, 2), (11, 2), (15, 2)],
  term ((-19496960 : Rat) / 110226591) [(5, 1), (9, 1), (11, 2), (15, 2)],
  term ((9748480 : Rat) / 110226591) [(5, 2), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 212 for generator 20. -/
theorem rs_R009_ueqv_R009NNNYN_partial_20_0212_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_20_0212
        rs_R009_ueqv_R009NNNYN_generator_20_0200_0222 =
      rs_R009_ueqv_R009NNNYN_partial_20_0212 := by
  native_decide

/-- Coefficient term 213 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NNNYN_coefficient_20_0213 : Poly :=
[
  term ((-36 : Rat) / 67) [(12, 1)]
]

/-- Partial product 213 for generator 20. -/
def rs_R009_ueqv_R009NNNYN_partial_20_0213 : Poly :=
[
  term ((-72 : Rat) / 67) [(4, 1), (8, 1), (12, 1)],
  term ((36 : Rat) / 67) [(4, 2), (12, 1)],
  term ((-72 : Rat) / 67) [(5, 1), (9, 1), (12, 1)],
  term ((36 : Rat) / 67) [(5, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 213 for generator 20. -/
theorem rs_R009_ueqv_R009NNNYN_partial_20_0213_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_20_0213
        rs_R009_ueqv_R009NNNYN_generator_20_0200_0222 =
      rs_R009_ueqv_R009NNNYN_partial_20_0213 := by
  native_decide

/-- Coefficient term 214 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NNNYN_coefficient_20_0214 : Poly :=
[
  term ((-14056420 : Rat) / 12247399) [(12, 1), (13, 1), (15, 1)]
]

/-- Partial product 214 for generator 20. -/
def rs_R009_ueqv_R009NNNYN_partial_20_0214 : Poly :=
[
  term ((-28112840 : Rat) / 12247399) [(4, 1), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((14056420 : Rat) / 12247399) [(4, 2), (12, 1), (13, 1), (15, 1)],
  term ((-28112840 : Rat) / 12247399) [(5, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((14056420 : Rat) / 12247399) [(5, 2), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 214 for generator 20. -/
theorem rs_R009_ueqv_R009NNNYN_partial_20_0214_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_20_0214
        rs_R009_ueqv_R009NNNYN_generator_20_0200_0222 =
      rs_R009_ueqv_R009NNNYN_partial_20_0214 := by
  native_decide

/-- Coefficient term 215 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NNNYN_coefficient_20_0215 : Poly :=
[
  term ((1166613608 : Rat) / 330679773) [(12, 1), (15, 2)]
]

/-- Partial product 215 for generator 20. -/
def rs_R009_ueqv_R009NNNYN_partial_20_0215 : Poly :=
[
  term ((2333227216 : Rat) / 330679773) [(4, 1), (8, 1), (12, 1), (15, 2)],
  term ((-1166613608 : Rat) / 330679773) [(4, 2), (12, 1), (15, 2)],
  term ((2333227216 : Rat) / 330679773) [(5, 1), (9, 1), (12, 1), (15, 2)],
  term ((-1166613608 : Rat) / 330679773) [(5, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 215 for generator 20. -/
theorem rs_R009_ueqv_R009NNNYN_partial_20_0215_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_20_0215
        rs_R009_ueqv_R009NNNYN_generator_20_0200_0222 =
      rs_R009_ueqv_R009NNNYN_partial_20_0215 := by
  native_decide

/-- Coefficient term 216 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NNNYN_coefficient_20_0216 : Poly :=
[
  term ((114240 : Rat) / 12247399) [(13, 1), (14, 1), (15, 1)]
]

/-- Partial product 216 for generator 20. -/
def rs_R009_ueqv_R009NNNYN_partial_20_0216 : Poly :=
[
  term ((228480 : Rat) / 12247399) [(4, 1), (8, 1), (13, 1), (14, 1), (15, 1)],
  term ((-114240 : Rat) / 12247399) [(4, 2), (13, 1), (14, 1), (15, 1)],
  term ((228480 : Rat) / 12247399) [(5, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((-114240 : Rat) / 12247399) [(5, 2), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 216 for generator 20. -/
theorem rs_R009_ueqv_R009NNNYN_partial_20_0216_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_20_0216
        rs_R009_ueqv_R009NNNYN_generator_20_0200_0222 =
      rs_R009_ueqv_R009NNNYN_partial_20_0216 := by
  native_decide

/-- Coefficient term 217 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NNNYN_coefficient_20_0217 : Poly :=
[
  term ((5227508867 : Rat) / 1396203486) [(13, 1), (15, 1)]
]

/-- Partial product 217 for generator 20. -/
def rs_R009_ueqv_R009NNNYN_partial_20_0217 : Poly :=
[
  term ((5227508867 : Rat) / 698101743) [(4, 1), (8, 1), (13, 1), (15, 1)],
  term ((-5227508867 : Rat) / 1396203486) [(4, 2), (13, 1), (15, 1)],
  term ((5227508867 : Rat) / 698101743) [(5, 1), (9, 1), (13, 1), (15, 1)],
  term ((-5227508867 : Rat) / 1396203486) [(5, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 217 for generator 20. -/
theorem rs_R009_ueqv_R009NNNYN_partial_20_0217_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_20_0217
        rs_R009_ueqv_R009NNNYN_generator_20_0200_0222 =
      rs_R009_ueqv_R009NNNYN_partial_20_0217 := by
  native_decide

/-- Coefficient term 218 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NNNYN_coefficient_20_0218 : Poly :=
[
  term ((-17582080 : Rat) / 110226591) [(13, 1), (15, 3)]
]

/-- Partial product 218 for generator 20. -/
def rs_R009_ueqv_R009NNNYN_partial_20_0218 : Poly :=
[
  term ((-35164160 : Rat) / 110226591) [(4, 1), (8, 1), (13, 1), (15, 3)],
  term ((17582080 : Rat) / 110226591) [(4, 2), (13, 1), (15, 3)],
  term ((-35164160 : Rat) / 110226591) [(5, 1), (9, 1), (13, 1), (15, 3)],
  term ((17582080 : Rat) / 110226591) [(5, 2), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 218 for generator 20. -/
theorem rs_R009_ueqv_R009NNNYN_partial_20_0218_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_20_0218
        rs_R009_ueqv_R009NNNYN_generator_20_0200_0222 =
      rs_R009_ueqv_R009NNNYN_partial_20_0218 := by
  native_decide

/-- Coefficient term 219 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NNNYN_coefficient_20_0219 : Poly :=
[
  term ((913920 : Rat) / 12247399) [(13, 2), (15, 2)]
]

/-- Partial product 219 for generator 20. -/
def rs_R009_ueqv_R009NNNYN_partial_20_0219 : Poly :=
[
  term ((1827840 : Rat) / 12247399) [(4, 1), (8, 1), (13, 2), (15, 2)],
  term ((-913920 : Rat) / 12247399) [(4, 2), (13, 2), (15, 2)],
  term ((1827840 : Rat) / 12247399) [(5, 1), (9, 1), (13, 2), (15, 2)],
  term ((-913920 : Rat) / 12247399) [(5, 2), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 219 for generator 20. -/
theorem rs_R009_ueqv_R009NNNYN_partial_20_0219_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_20_0219
        rs_R009_ueqv_R009NNNYN_generator_20_0200_0222 =
      rs_R009_ueqv_R009NNNYN_partial_20_0219 := by
  native_decide

/-- Coefficient term 220 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NNNYN_coefficient_20_0220 : Poly :=
[
  term ((12 : Rat) / 67) [(14, 1)]
]

/-- Partial product 220 for generator 20. -/
def rs_R009_ueqv_R009NNNYN_partial_20_0220 : Poly :=
[
  term ((24 : Rat) / 67) [(4, 1), (8, 1), (14, 1)],
  term ((-12 : Rat) / 67) [(4, 2), (14, 1)],
  term ((24 : Rat) / 67) [(5, 1), (9, 1), (14, 1)],
  term ((-12 : Rat) / 67) [(5, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 220 for generator 20. -/
theorem rs_R009_ueqv_R009NNNYN_partial_20_0220_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_20_0220
        rs_R009_ueqv_R009NNNYN_generator_20_0200_0222 =
      rs_R009_ueqv_R009NNNYN_partial_20_0220 := by
  native_decide

/-- Coefficient term 221 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NNNYN_coefficient_20_0221 : Poly :=
[
  term ((-2197760 : Rat) / 110226591) [(14, 1), (15, 2)]
]

/-- Partial product 221 for generator 20. -/
def rs_R009_ueqv_R009NNNYN_partial_20_0221 : Poly :=
[
  term ((-4395520 : Rat) / 110226591) [(4, 1), (8, 1), (14, 1), (15, 2)],
  term ((2197760 : Rat) / 110226591) [(4, 2), (14, 1), (15, 2)],
  term ((-4395520 : Rat) / 110226591) [(5, 1), (9, 1), (14, 1), (15, 2)],
  term ((2197760 : Rat) / 110226591) [(5, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 221 for generator 20. -/
theorem rs_R009_ueqv_R009NNNYN_partial_20_0221_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_20_0221
        rs_R009_ueqv_R009NNNYN_generator_20_0200_0222 =
      rs_R009_ueqv_R009NNNYN_partial_20_0221 := by
  native_decide

/-- Coefficient term 222 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009NNNYN_coefficient_20_0222 : Poly :=
[
  term ((-161353754594 : Rat) / 18848747061) [(15, 2)]
]

/-- Partial product 222 for generator 20. -/
def rs_R009_ueqv_R009NNNYN_partial_20_0222 : Poly :=
[
  term ((-322707509188 : Rat) / 18848747061) [(4, 1), (8, 1), (15, 2)],
  term ((161353754594 : Rat) / 18848747061) [(4, 2), (15, 2)],
  term ((-322707509188 : Rat) / 18848747061) [(5, 1), (9, 1), (15, 2)],
  term ((161353754594 : Rat) / 18848747061) [(5, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 222 for generator 20. -/
theorem rs_R009_ueqv_R009NNNYN_partial_20_0222_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_20_0222
        rs_R009_ueqv_R009NNNYN_generator_20_0200_0222 =
      rs_R009_ueqv_R009NNNYN_partial_20_0222 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NNNYN_partials_20_0200_0222 : List Poly :=
[
  rs_R009_ueqv_R009NNNYN_partial_20_0200,
  rs_R009_ueqv_R009NNNYN_partial_20_0201,
  rs_R009_ueqv_R009NNNYN_partial_20_0202,
  rs_R009_ueqv_R009NNNYN_partial_20_0203,
  rs_R009_ueqv_R009NNNYN_partial_20_0204,
  rs_R009_ueqv_R009NNNYN_partial_20_0205,
  rs_R009_ueqv_R009NNNYN_partial_20_0206,
  rs_R009_ueqv_R009NNNYN_partial_20_0207,
  rs_R009_ueqv_R009NNNYN_partial_20_0208,
  rs_R009_ueqv_R009NNNYN_partial_20_0209,
  rs_R009_ueqv_R009NNNYN_partial_20_0210,
  rs_R009_ueqv_R009NNNYN_partial_20_0211,
  rs_R009_ueqv_R009NNNYN_partial_20_0212,
  rs_R009_ueqv_R009NNNYN_partial_20_0213,
  rs_R009_ueqv_R009NNNYN_partial_20_0214,
  rs_R009_ueqv_R009NNNYN_partial_20_0215,
  rs_R009_ueqv_R009NNNYN_partial_20_0216,
  rs_R009_ueqv_R009NNNYN_partial_20_0217,
  rs_R009_ueqv_R009NNNYN_partial_20_0218,
  rs_R009_ueqv_R009NNNYN_partial_20_0219,
  rs_R009_ueqv_R009NNNYN_partial_20_0220,
  rs_R009_ueqv_R009NNNYN_partial_20_0221,
  rs_R009_ueqv_R009NNNYN_partial_20_0222
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NNNYN_block_20_0200_0222 : Poly :=
[
  term ((136261120 : Rat) / 110226591) [(4, 1), (8, 1), (11, 1), (13, 1), (15, 2)],
  term ((-5483520 : Rat) / 12247399) [(4, 1), (8, 1), (11, 1), (13, 2), (15, 1)],
  term ((-307483864 : Rat) / 330679773) [(4, 1), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((17582080 : Rat) / 36742197) [(4, 1), (8, 1), (11, 1), (14, 2), (15, 1)],
  term ((2394703351678 : Rat) / 94243735305) [(4, 1), (8, 1), (11, 1), (15, 1)],
  term ((17582080 : Rat) / 110226591) [(4, 1), (8, 1), (11, 1), (15, 3)],
  term ((-308782926592 : Rat) / 31414578435) [(4, 1), (8, 1), (11, 2)],
  term ((155975680 : Rat) / 110226591) [(4, 1), (8, 1), (11, 2), (12, 1)],
  term ((-389939200 : Rat) / 110226591) [(4, 1), (8, 1), (11, 2), (12, 1), (14, 1)],
  term ((-38993920 : Rat) / 36742197) [(4, 1), (8, 1), (11, 2), (13, 1), (15, 1)],
  term ((1072332800 : Rat) / 330679773) [(4, 1), (8, 1), (11, 2), (14, 1)],
  term ((-19496960 : Rat) / 36742197) [(4, 1), (8, 1), (11, 2), (14, 2)],
  term ((-19496960 : Rat) / 110226591) [(4, 1), (8, 1), (11, 2), (15, 2)],
  term ((-72 : Rat) / 67) [(4, 1), (8, 1), (12, 1)],
  term ((-28112840 : Rat) / 12247399) [(4, 1), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((2333227216 : Rat) / 330679773) [(4, 1), (8, 1), (12, 1), (15, 2)],
  term ((228480 : Rat) / 12247399) [(4, 1), (8, 1), (13, 1), (14, 1), (15, 1)],
  term ((5227508867 : Rat) / 698101743) [(4, 1), (8, 1), (13, 1), (15, 1)],
  term ((-35164160 : Rat) / 110226591) [(4, 1), (8, 1), (13, 1), (15, 3)],
  term ((1827840 : Rat) / 12247399) [(4, 1), (8, 1), (13, 2), (15, 2)],
  term ((24 : Rat) / 67) [(4, 1), (8, 1), (14, 1)],
  term ((-4395520 : Rat) / 110226591) [(4, 1), (8, 1), (14, 1), (15, 2)],
  term ((-322707509188 : Rat) / 18848747061) [(4, 1), (8, 1), (15, 2)],
  term ((-68130560 : Rat) / 110226591) [(4, 2), (11, 1), (13, 1), (15, 2)],
  term ((2741760 : Rat) / 12247399) [(4, 2), (11, 1), (13, 2), (15, 1)],
  term ((153741932 : Rat) / 330679773) [(4, 2), (11, 1), (14, 1), (15, 1)],
  term ((-8791040 : Rat) / 36742197) [(4, 2), (11, 1), (14, 2), (15, 1)],
  term ((-1197351675839 : Rat) / 94243735305) [(4, 2), (11, 1), (15, 1)],
  term ((-8791040 : Rat) / 110226591) [(4, 2), (11, 1), (15, 3)],
  term ((154391463296 : Rat) / 31414578435) [(4, 2), (11, 2)],
  term ((-77987840 : Rat) / 110226591) [(4, 2), (11, 2), (12, 1)],
  term ((194969600 : Rat) / 110226591) [(4, 2), (11, 2), (12, 1), (14, 1)],
  term ((19496960 : Rat) / 36742197) [(4, 2), (11, 2), (13, 1), (15, 1)],
  term ((-536166400 : Rat) / 330679773) [(4, 2), (11, 2), (14, 1)],
  term ((9748480 : Rat) / 36742197) [(4, 2), (11, 2), (14, 2)],
  term ((9748480 : Rat) / 110226591) [(4, 2), (11, 2), (15, 2)],
  term ((36 : Rat) / 67) [(4, 2), (12, 1)],
  term ((14056420 : Rat) / 12247399) [(4, 2), (12, 1), (13, 1), (15, 1)],
  term ((-1166613608 : Rat) / 330679773) [(4, 2), (12, 1), (15, 2)],
  term ((-114240 : Rat) / 12247399) [(4, 2), (13, 1), (14, 1), (15, 1)],
  term ((-5227508867 : Rat) / 1396203486) [(4, 2), (13, 1), (15, 1)],
  term ((17582080 : Rat) / 110226591) [(4, 2), (13, 1), (15, 3)],
  term ((-913920 : Rat) / 12247399) [(4, 2), (13, 2), (15, 2)],
  term ((-12 : Rat) / 67) [(4, 2), (14, 1)],
  term ((2197760 : Rat) / 110226591) [(4, 2), (14, 1), (15, 2)],
  term ((161353754594 : Rat) / 18848747061) [(4, 2), (15, 2)],
  term ((136261120 : Rat) / 110226591) [(5, 1), (9, 1), (11, 1), (13, 1), (15, 2)],
  term ((-5483520 : Rat) / 12247399) [(5, 1), (9, 1), (11, 1), (13, 2), (15, 1)],
  term ((-307483864 : Rat) / 330679773) [(5, 1), (9, 1), (11, 1), (14, 1), (15, 1)],
  term ((17582080 : Rat) / 36742197) [(5, 1), (9, 1), (11, 1), (14, 2), (15, 1)],
  term ((2394703351678 : Rat) / 94243735305) [(5, 1), (9, 1), (11, 1), (15, 1)],
  term ((17582080 : Rat) / 110226591) [(5, 1), (9, 1), (11, 1), (15, 3)],
  term ((-308782926592 : Rat) / 31414578435) [(5, 1), (9, 1), (11, 2)],
  term ((155975680 : Rat) / 110226591) [(5, 1), (9, 1), (11, 2), (12, 1)],
  term ((-389939200 : Rat) / 110226591) [(5, 1), (9, 1), (11, 2), (12, 1), (14, 1)],
  term ((-38993920 : Rat) / 36742197) [(5, 1), (9, 1), (11, 2), (13, 1), (15, 1)],
  term ((1072332800 : Rat) / 330679773) [(5, 1), (9, 1), (11, 2), (14, 1)],
  term ((-19496960 : Rat) / 36742197) [(5, 1), (9, 1), (11, 2), (14, 2)],
  term ((-19496960 : Rat) / 110226591) [(5, 1), (9, 1), (11, 2), (15, 2)],
  term ((-72 : Rat) / 67) [(5, 1), (9, 1), (12, 1)],
  term ((-28112840 : Rat) / 12247399) [(5, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((2333227216 : Rat) / 330679773) [(5, 1), (9, 1), (12, 1), (15, 2)],
  term ((228480 : Rat) / 12247399) [(5, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((5227508867 : Rat) / 698101743) [(5, 1), (9, 1), (13, 1), (15, 1)],
  term ((-35164160 : Rat) / 110226591) [(5, 1), (9, 1), (13, 1), (15, 3)],
  term ((1827840 : Rat) / 12247399) [(5, 1), (9, 1), (13, 2), (15, 2)],
  term ((24 : Rat) / 67) [(5, 1), (9, 1), (14, 1)],
  term ((-4395520 : Rat) / 110226591) [(5, 1), (9, 1), (14, 1), (15, 2)],
  term ((-322707509188 : Rat) / 18848747061) [(5, 1), (9, 1), (15, 2)],
  term ((-68130560 : Rat) / 110226591) [(5, 2), (11, 1), (13, 1), (15, 2)],
  term ((2741760 : Rat) / 12247399) [(5, 2), (11, 1), (13, 2), (15, 1)],
  term ((153741932 : Rat) / 330679773) [(5, 2), (11, 1), (14, 1), (15, 1)],
  term ((-8791040 : Rat) / 36742197) [(5, 2), (11, 1), (14, 2), (15, 1)],
  term ((-1197351675839 : Rat) / 94243735305) [(5, 2), (11, 1), (15, 1)],
  term ((-8791040 : Rat) / 110226591) [(5, 2), (11, 1), (15, 3)],
  term ((154391463296 : Rat) / 31414578435) [(5, 2), (11, 2)],
  term ((-77987840 : Rat) / 110226591) [(5, 2), (11, 2), (12, 1)],
  term ((194969600 : Rat) / 110226591) [(5, 2), (11, 2), (12, 1), (14, 1)],
  term ((19496960 : Rat) / 36742197) [(5, 2), (11, 2), (13, 1), (15, 1)],
  term ((-536166400 : Rat) / 330679773) [(5, 2), (11, 2), (14, 1)],
  term ((9748480 : Rat) / 36742197) [(5, 2), (11, 2), (14, 2)],
  term ((9748480 : Rat) / 110226591) [(5, 2), (11, 2), (15, 2)],
  term ((36 : Rat) / 67) [(5, 2), (12, 1)],
  term ((14056420 : Rat) / 12247399) [(5, 2), (12, 1), (13, 1), (15, 1)],
  term ((-1166613608 : Rat) / 330679773) [(5, 2), (12, 1), (15, 2)],
  term ((-114240 : Rat) / 12247399) [(5, 2), (13, 1), (14, 1), (15, 1)],
  term ((-5227508867 : Rat) / 1396203486) [(5, 2), (13, 1), (15, 1)],
  term ((17582080 : Rat) / 110226591) [(5, 2), (13, 1), (15, 3)],
  term ((-913920 : Rat) / 12247399) [(5, 2), (13, 2), (15, 2)],
  term ((-12 : Rat) / 67) [(5, 2), (14, 1)],
  term ((2197760 : Rat) / 110226591) [(5, 2), (14, 1), (15, 2)],
  term ((161353754594 : Rat) / 18848747061) [(5, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 20, terms 200 through 222. -/
theorem rs_R009_ueqv_R009NNNYN_block_20_0200_0222_valid :
    checkProductSumEq rs_R009_ueqv_R009NNNYN_partials_20_0200_0222
      rs_R009_ueqv_R009NNNYN_block_20_0200_0222 = true := by
  native_decide

end R009UeqvR009NNNYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
