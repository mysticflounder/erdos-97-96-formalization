/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NNNYN, term block 5:400-451

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NNNYNTermShards

/-- Generator polynomial 5 for relaxed split surplus certificate `R009:u=v:R009NNNYN`. -/
def rs_R009_ueqv_R009NNNYN_generator_05_0400_0451 : Poly :=
[
  term (-2 : Rat) [(4, 1)],
  term (1 : Rat) [(4, 2)],
  term (1 : Rat) [(5, 2)],
  term (2 : Rat) [(14, 1)],
  term (-1 : Rat) [(14, 2)],
  term (-1 : Rat) [(15, 2)]
]

/-- Coefficient term 400 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NNNYN_coefficient_05_0400 : Poly :=
[
  term ((9748480 : Rat) / 110226591) [(10, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 400 for generator 5. -/
def rs_R009_ueqv_R009NNNYN_partial_05_0400 : Poly :=
[
  term ((-19496960 : Rat) / 110226591) [(4, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((9748480 : Rat) / 110226591) [(4, 2), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((9748480 : Rat) / 110226591) [(5, 2), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-9748480 : Rat) / 110226591) [(10, 1), (11, 1), (14, 1), (15, 3)],
  term ((19496960 : Rat) / 110226591) [(10, 1), (11, 1), (14, 2), (15, 1)],
  term ((-9748480 : Rat) / 110226591) [(10, 1), (11, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 400 for generator 5. -/
theorem rs_R009_ueqv_R009NNNYN_partial_05_0400_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_05_0400
        rs_R009_ueqv_R009NNNYN_generator_05_0400_0451 =
      rs_R009_ueqv_R009NNNYN_partial_05_0400 := by
  native_decide

/-- Coefficient term 401 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NNNYN_coefficient_05_0401 : Poly :=
[
  term ((164180954372 : Rat) / 10471526145) [(10, 1), (11, 1), (15, 1)]
]

/-- Partial product 401 for generator 5. -/
def rs_R009_ueqv_R009NNNYN_partial_05_0401 : Poly :=
[
  term ((-328361908744 : Rat) / 10471526145) [(4, 1), (10, 1), (11, 1), (15, 1)],
  term ((164180954372 : Rat) / 10471526145) [(4, 2), (10, 1), (11, 1), (15, 1)],
  term ((164180954372 : Rat) / 10471526145) [(5, 2), (10, 1), (11, 1), (15, 1)],
  term ((328361908744 : Rat) / 10471526145) [(10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-164180954372 : Rat) / 10471526145) [(10, 1), (11, 1), (14, 2), (15, 1)],
  term ((-164180954372 : Rat) / 10471526145) [(10, 1), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 401 for generator 5. -/
theorem rs_R009_ueqv_R009NNNYN_partial_05_0401_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_05_0401
        rs_R009_ueqv_R009NNNYN_generator_05_0400_0451 =
      rs_R009_ueqv_R009NNNYN_partial_05_0401 := by
  native_decide

/-- Coefficient term 402 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NNNYN_coefficient_05_0402 : Poly :=
[
  term ((-178697921024 : Rat) / 10471526145) [(10, 1), (11, 2)]
]

/-- Partial product 402 for generator 5. -/
def rs_R009_ueqv_R009NNNYN_partial_05_0402 : Poly :=
[
  term ((357395842048 : Rat) / 10471526145) [(4, 1), (10, 1), (11, 2)],
  term ((-178697921024 : Rat) / 10471526145) [(4, 2), (10, 1), (11, 2)],
  term ((-178697921024 : Rat) / 10471526145) [(5, 2), (10, 1), (11, 2)],
  term ((-357395842048 : Rat) / 10471526145) [(10, 1), (11, 2), (14, 1)],
  term ((178697921024 : Rat) / 10471526145) [(10, 1), (11, 2), (14, 2)],
  term ((178697921024 : Rat) / 10471526145) [(10, 1), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 402 for generator 5. -/
theorem rs_R009_ueqv_R009NNNYN_partial_05_0402_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_05_0402
        rs_R009_ueqv_R009NNNYN_generator_05_0400_0451 =
      rs_R009_ueqv_R009NNNYN_partial_05_0402 := by
  native_decide

/-- Coefficient term 403 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NNNYN_coefficient_05_0403 : Poly :=
[
  term ((18 : Rat) / 67) [(10, 1), (12, 1)]
]

/-- Partial product 403 for generator 5. -/
def rs_R009_ueqv_R009NNNYN_partial_05_0403 : Poly :=
[
  term ((-36 : Rat) / 67) [(4, 1), (10, 1), (12, 1)],
  term ((18 : Rat) / 67) [(4, 2), (10, 1), (12, 1)],
  term ((18 : Rat) / 67) [(5, 2), (10, 1), (12, 1)],
  term ((36 : Rat) / 67) [(10, 1), (12, 1), (14, 1)],
  term ((-18 : Rat) / 67) [(10, 1), (12, 1), (14, 2)],
  term ((-18 : Rat) / 67) [(10, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 403 for generator 5. -/
theorem rs_R009_ueqv_R009NNNYN_partial_05_0403_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_05_0403
        rs_R009_ueqv_R009NNNYN_generator_05_0400_0451 =
      rs_R009_ueqv_R009NNNYN_partial_05_0403 := by
  native_decide

/-- Coefficient term 404 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NNNYN_coefficient_05_0404 : Poly :=
[
  term ((4569600 : Rat) / 12247399) [(10, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 404 for generator 5. -/
def rs_R009_ueqv_R009NNNYN_partial_05_0404 : Poly :=
[
  term ((-9139200 : Rat) / 12247399) [(4, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((4569600 : Rat) / 12247399) [(4, 2), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((4569600 : Rat) / 12247399) [(5, 2), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((9139200 : Rat) / 12247399) [(10, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-4569600 : Rat) / 12247399) [(10, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((-4569600 : Rat) / 12247399) [(10, 1), (12, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 404 for generator 5. -/
theorem rs_R009_ueqv_R009NNNYN_partial_05_0404_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_05_0404
        rs_R009_ueqv_R009NNNYN_generator_05_0400_0451 =
      rs_R009_ueqv_R009NNNYN_partial_05_0404 := by
  native_decide

/-- Coefficient term 405 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NNNYN_coefficient_05_0405 : Poly :=
[
  term ((-87910400 : Rat) / 110226591) [(10, 1), (12, 1), (15, 2)]
]

/-- Partial product 405 for generator 5. -/
def rs_R009_ueqv_R009NNNYN_partial_05_0405 : Poly :=
[
  term ((175820800 : Rat) / 110226591) [(4, 1), (10, 1), (12, 1), (15, 2)],
  term ((-87910400 : Rat) / 110226591) [(4, 2), (10, 1), (12, 1), (15, 2)],
  term ((-87910400 : Rat) / 110226591) [(5, 2), (10, 1), (12, 1), (15, 2)],
  term ((-175820800 : Rat) / 110226591) [(10, 1), (12, 1), (14, 1), (15, 2)],
  term ((87910400 : Rat) / 110226591) [(10, 1), (12, 1), (14, 2), (15, 2)],
  term ((87910400 : Rat) / 110226591) [(10, 1), (12, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 405 for generator 5. -/
theorem rs_R009_ueqv_R009NNNYN_partial_05_0405_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_05_0405
        rs_R009_ueqv_R009NNNYN_generator_05_0400_0451 =
      rs_R009_ueqv_R009NNNYN_partial_05_0405 := by
  native_decide

/-- Coefficient term 406 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NNNYN_coefficient_05_0406 : Poly :=
[
  term ((456960 : Rat) / 12247399) [(10, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 406 for generator 5. -/
def rs_R009_ueqv_R009NNNYN_partial_05_0406 : Poly :=
[
  term ((-913920 : Rat) / 12247399) [(4, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((456960 : Rat) / 12247399) [(4, 2), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((456960 : Rat) / 12247399) [(5, 2), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-456960 : Rat) / 12247399) [(10, 1), (13, 1), (14, 1), (15, 3)],
  term ((913920 : Rat) / 12247399) [(10, 1), (13, 1), (14, 2), (15, 1)],
  term ((-456960 : Rat) / 12247399) [(10, 1), (13, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 406 for generator 5. -/
theorem rs_R009_ueqv_R009NNNYN_partial_05_0406_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_05_0406
        rs_R009_ueqv_R009NNNYN_generator_05_0400_0451 =
      rs_R009_ueqv_R009NNNYN_partial_05_0406 := by
  native_decide

/-- Coefficient term 407 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NNNYN_coefficient_05_0407 : Poly :=
[
  term ((-23081920 : Rat) / 110226591) [(10, 1), (13, 1), (15, 1)]
]

/-- Partial product 407 for generator 5. -/
def rs_R009_ueqv_R009NNNYN_partial_05_0407 : Poly :=
[
  term ((46163840 : Rat) / 110226591) [(4, 1), (10, 1), (13, 1), (15, 1)],
  term ((-23081920 : Rat) / 110226591) [(4, 2), (10, 1), (13, 1), (15, 1)],
  term ((-23081920 : Rat) / 110226591) [(5, 2), (10, 1), (13, 1), (15, 1)],
  term ((-46163840 : Rat) / 110226591) [(10, 1), (13, 1), (14, 1), (15, 1)],
  term ((23081920 : Rat) / 110226591) [(10, 1), (13, 1), (14, 2), (15, 1)],
  term ((23081920 : Rat) / 110226591) [(10, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 407 for generator 5. -/
theorem rs_R009_ueqv_R009NNNYN_partial_05_0407_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_05_0407
        rs_R009_ueqv_R009NNNYN_generator_05_0400_0451 =
      rs_R009_ueqv_R009NNNYN_partial_05_0407 := by
  native_decide

/-- Coefficient term 408 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NNNYN_coefficient_05_0408 : Poly :=
[
  term ((-456960 : Rat) / 12247399) [(10, 1), (13, 2)]
]

/-- Partial product 408 for generator 5. -/
def rs_R009_ueqv_R009NNNYN_partial_05_0408 : Poly :=
[
  term ((913920 : Rat) / 12247399) [(4, 1), (10, 1), (13, 2)],
  term ((-456960 : Rat) / 12247399) [(4, 2), (10, 1), (13, 2)],
  term ((-456960 : Rat) / 12247399) [(5, 2), (10, 1), (13, 2)],
  term ((-913920 : Rat) / 12247399) [(10, 1), (13, 2), (14, 1)],
  term ((456960 : Rat) / 12247399) [(10, 1), (13, 2), (14, 2)],
  term ((456960 : Rat) / 12247399) [(10, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 408 for generator 5. -/
theorem rs_R009_ueqv_R009NNNYN_partial_05_0408_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_05_0408
        rs_R009_ueqv_R009NNNYN_generator_05_0400_0451 =
      rs_R009_ueqv_R009NNNYN_partial_05_0408 := by
  native_decide

/-- Coefficient term 409 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NNNYN_coefficient_05_0409 : Poly :=
[
  term ((-6 : Rat) / 67) [(10, 1), (14, 1)]
]

/-- Partial product 409 for generator 5. -/
def rs_R009_ueqv_R009NNNYN_partial_05_0409 : Poly :=
[
  term ((12 : Rat) / 67) [(4, 1), (10, 1), (14, 1)],
  term ((-6 : Rat) / 67) [(4, 2), (10, 1), (14, 1)],
  term ((-6 : Rat) / 67) [(5, 2), (10, 1), (14, 1)],
  term ((6 : Rat) / 67) [(10, 1), (14, 1), (15, 2)],
  term ((-12 : Rat) / 67) [(10, 1), (14, 2)],
  term ((6 : Rat) / 67) [(10, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 409 for generator 5. -/
theorem rs_R009_ueqv_R009NNNYN_partial_05_0409_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_05_0409
        rs_R009_ueqv_R009NNNYN_generator_05_0400_0451 =
      rs_R009_ueqv_R009NNNYN_partial_05_0409 := by
  native_decide

/-- Coefficient term 410 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NNNYN_coefficient_05_0410 : Poly :=
[
  term ((-8791040 : Rat) / 110226591) [(10, 1), (14, 1), (15, 2)]
]

/-- Partial product 410 for generator 5. -/
def rs_R009_ueqv_R009NNNYN_partial_05_0410 : Poly :=
[
  term ((17582080 : Rat) / 110226591) [(4, 1), (10, 1), (14, 1), (15, 2)],
  term ((-8791040 : Rat) / 110226591) [(4, 2), (10, 1), (14, 1), (15, 2)],
  term ((-8791040 : Rat) / 110226591) [(5, 2), (10, 1), (14, 1), (15, 2)],
  term ((8791040 : Rat) / 110226591) [(10, 1), (14, 1), (15, 4)],
  term ((-17582080 : Rat) / 110226591) [(10, 1), (14, 2), (15, 2)],
  term ((8791040 : Rat) / 110226591) [(10, 1), (14, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 410 for generator 5. -/
theorem rs_R009_ueqv_R009NNNYN_partial_05_0410_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_05_0410
        rs_R009_ueqv_R009NNNYN_generator_05_0400_0451 =
      rs_R009_ueqv_R009NNNYN_partial_05_0410 := by
  native_decide

/-- Coefficient term 411 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NNNYN_coefficient_05_0411 : Poly :=
[
  term ((332455022 : Rat) / 110226591) [(10, 1), (15, 2)]
]

/-- Partial product 411 for generator 5. -/
def rs_R009_ueqv_R009NNNYN_partial_05_0411 : Poly :=
[
  term ((-664910044 : Rat) / 110226591) [(4, 1), (10, 1), (15, 2)],
  term ((332455022 : Rat) / 110226591) [(4, 2), (10, 1), (15, 2)],
  term ((332455022 : Rat) / 110226591) [(5, 2), (10, 1), (15, 2)],
  term ((664910044 : Rat) / 110226591) [(10, 1), (14, 1), (15, 2)],
  term ((-332455022 : Rat) / 110226591) [(10, 1), (14, 2), (15, 2)],
  term ((-332455022 : Rat) / 110226591) [(10, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 411 for generator 5. -/
theorem rs_R009_ueqv_R009NNNYN_partial_05_0411_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_05_0411
        rs_R009_ueqv_R009NNNYN_generator_05_0400_0451 =
      rs_R009_ueqv_R009NNNYN_partial_05_0411 := by
  native_decide

/-- Coefficient term 412 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NNNYN_coefficient_05_0412 : Poly :=
[
  term ((-1827840 : Rat) / 12247399) [(11, 1), (12, 1), (13, 1)]
]

/-- Partial product 412 for generator 5. -/
def rs_R009_ueqv_R009NNNYN_partial_05_0412 : Poly :=
[
  term ((3655680 : Rat) / 12247399) [(4, 1), (11, 1), (12, 1), (13, 1)],
  term ((-1827840 : Rat) / 12247399) [(4, 2), (11, 1), (12, 1), (13, 1)],
  term ((-1827840 : Rat) / 12247399) [(5, 2), (11, 1), (12, 1), (13, 1)],
  term ((-3655680 : Rat) / 12247399) [(11, 1), (12, 1), (13, 1), (14, 1)],
  term ((1827840 : Rat) / 12247399) [(11, 1), (12, 1), (13, 1), (14, 2)],
  term ((1827840 : Rat) / 12247399) [(11, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 412 for generator 5. -/
theorem rs_R009_ueqv_R009NNNYN_partial_05_0412_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_05_0412
        rs_R009_ueqv_R009NNNYN_generator_05_0400_0451 =
      rs_R009_ueqv_R009NNNYN_partial_05_0412 := by
  native_decide

/-- Coefficient term 413 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NNNYN_coefficient_05_0413 : Poly :=
[
  term ((4569600 : Rat) / 12247399) [(11, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 413 for generator 5. -/
def rs_R009_ueqv_R009NNNYN_partial_05_0413 : Poly :=
[
  term ((-9139200 : Rat) / 12247399) [(4, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((4569600 : Rat) / 12247399) [(4, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((4569600 : Rat) / 12247399) [(5, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-4569600 : Rat) / 12247399) [(11, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((9139200 : Rat) / 12247399) [(11, 1), (12, 1), (13, 1), (14, 2)],
  term ((-4569600 : Rat) / 12247399) [(11, 1), (12, 1), (13, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 413 for generator 5. -/
theorem rs_R009_ueqv_R009NNNYN_partial_05_0413_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_05_0413
        rs_R009_ueqv_R009NNNYN_generator_05_0400_0451 =
      rs_R009_ueqv_R009NNNYN_partial_05_0413 := by
  native_decide

/-- Coefficient term 414 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NNNYN_coefficient_05_0414 : Poly :=
[
  term ((-61798400 : Rat) / 36742197) [(11, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 414 for generator 5. -/
def rs_R009_ueqv_R009NNNYN_partial_05_0414 : Poly :=
[
  term ((123596800 : Rat) / 36742197) [(4, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-61798400 : Rat) / 36742197) [(4, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-61798400 : Rat) / 36742197) [(5, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((61798400 : Rat) / 36742197) [(11, 1), (12, 1), (14, 1), (15, 3)],
  term ((-123596800 : Rat) / 36742197) [(11, 1), (12, 1), (14, 2), (15, 1)],
  term ((61798400 : Rat) / 36742197) [(11, 1), (12, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 414 for generator 5. -/
theorem rs_R009_ueqv_R009NNNYN_partial_05_0414_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_05_0414
        rs_R009_ueqv_R009NNNYN_generator_05_0400_0451 =
      rs_R009_ueqv_R009NNNYN_partial_05_0414 := by
  native_decide

/-- Coefficient term 415 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NNNYN_coefficient_05_0415 : Poly :=
[
  term ((794140160 : Rat) / 330679773) [(11, 1), (12, 1), (15, 1)]
]

/-- Partial product 415 for generator 5. -/
def rs_R009_ueqv_R009NNNYN_partial_05_0415 : Poly :=
[
  term ((-1588280320 : Rat) / 330679773) [(4, 1), (11, 1), (12, 1), (15, 1)],
  term ((794140160 : Rat) / 330679773) [(4, 2), (11, 1), (12, 1), (15, 1)],
  term ((794140160 : Rat) / 330679773) [(5, 2), (11, 1), (12, 1), (15, 1)],
  term ((1588280320 : Rat) / 330679773) [(11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-794140160 : Rat) / 330679773) [(11, 1), (12, 1), (14, 2), (15, 1)],
  term ((-794140160 : Rat) / 330679773) [(11, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 415 for generator 5. -/
theorem rs_R009_ueqv_R009NNNYN_partial_05_0415_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_05_0415
        rs_R009_ueqv_R009NNNYN_generator_05_0400_0451 =
      rs_R009_ueqv_R009NNNYN_partial_05_0415 := by
  native_decide

/-- Coefficient term 416 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NNNYN_coefficient_05_0416 : Poly :=
[
  term ((249717141013 : Rat) / 62829156870) [(11, 1), (13, 1)]
]

/-- Partial product 416 for generator 5. -/
def rs_R009_ueqv_R009NNNYN_partial_05_0416 : Poly :=
[
  term ((-249717141013 : Rat) / 31414578435) [(4, 1), (11, 1), (13, 1)],
  term ((249717141013 : Rat) / 62829156870) [(4, 2), (11, 1), (13, 1)],
  term ((249717141013 : Rat) / 62829156870) [(5, 2), (11, 1), (13, 1)],
  term ((249717141013 : Rat) / 31414578435) [(11, 1), (13, 1), (14, 1)],
  term ((-249717141013 : Rat) / 62829156870) [(11, 1), (13, 1), (14, 2)],
  term ((-249717141013 : Rat) / 62829156870) [(11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 416 for generator 5. -/
theorem rs_R009_ueqv_R009NNNYN_partial_05_0416_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_05_0416
        rs_R009_ueqv_R009NNNYN_generator_05_0400_0451 =
      rs_R009_ueqv_R009NNNYN_partial_05_0416 := by
  native_decide

/-- Coefficient term 417 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NNNYN_coefficient_05_0417 : Poly :=
[
  term ((-228558400 : Rat) / 330679773) [(11, 1), (13, 1), (14, 1)]
]

/-- Partial product 417 for generator 5. -/
def rs_R009_ueqv_R009NNNYN_partial_05_0417 : Poly :=
[
  term ((457116800 : Rat) / 330679773) [(4, 1), (11, 1), (13, 1), (14, 1)],
  term ((-228558400 : Rat) / 330679773) [(4, 2), (11, 1), (13, 1), (14, 1)],
  term ((-228558400 : Rat) / 330679773) [(5, 2), (11, 1), (13, 1), (14, 1)],
  term ((228558400 : Rat) / 330679773) [(11, 1), (13, 1), (14, 1), (15, 2)],
  term ((-457116800 : Rat) / 330679773) [(11, 1), (13, 1), (14, 2)],
  term ((228558400 : Rat) / 330679773) [(11, 1), (13, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 417 for generator 5. -/
theorem rs_R009_ueqv_R009NNNYN_partial_05_0417_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_05_0417
        rs_R009_ueqv_R009NNNYN_generator_05_0400_0451 =
      rs_R009_ueqv_R009NNNYN_partial_05_0417 := by
  native_decide

/-- Coefficient term 418 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NNNYN_coefficient_05_0418 : Poly :=
[
  term ((-20157760 : Rat) / 36742197) [(11, 1), (13, 1), (14, 2)]
]

/-- Partial product 418 for generator 5. -/
def rs_R009_ueqv_R009NNNYN_partial_05_0418 : Poly :=
[
  term ((40315520 : Rat) / 36742197) [(4, 1), (11, 1), (13, 1), (14, 2)],
  term ((-20157760 : Rat) / 36742197) [(4, 2), (11, 1), (13, 1), (14, 2)],
  term ((-20157760 : Rat) / 36742197) [(5, 2), (11, 1), (13, 1), (14, 2)],
  term ((20157760 : Rat) / 36742197) [(11, 1), (13, 1), (14, 2), (15, 2)],
  term ((-40315520 : Rat) / 36742197) [(11, 1), (13, 1), (14, 3)],
  term ((20157760 : Rat) / 36742197) [(11, 1), (13, 1), (14, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 418 for generator 5. -/
theorem rs_R009_ueqv_R009NNNYN_partial_05_0418_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_05_0418
        rs_R009_ueqv_R009NNNYN_generator_05_0400_0451 =
      rs_R009_ueqv_R009NNNYN_partial_05_0418 := by
  native_decide

/-- Coefficient term 419 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NNNYN_coefficient_05_0419 : Poly :=
[
  term ((-44594240 : Rat) / 36742197) [(11, 1), (13, 1), (15, 2)]
]

/-- Partial product 419 for generator 5. -/
def rs_R009_ueqv_R009NNNYN_partial_05_0419 : Poly :=
[
  term ((89188480 : Rat) / 36742197) [(4, 1), (11, 1), (13, 1), (15, 2)],
  term ((-44594240 : Rat) / 36742197) [(4, 2), (11, 1), (13, 1), (15, 2)],
  term ((-44594240 : Rat) / 36742197) [(5, 2), (11, 1), (13, 1), (15, 2)],
  term ((-89188480 : Rat) / 36742197) [(11, 1), (13, 1), (14, 1), (15, 2)],
  term ((44594240 : Rat) / 36742197) [(11, 1), (13, 1), (14, 2), (15, 2)],
  term ((44594240 : Rat) / 36742197) [(11, 1), (13, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 419 for generator 5. -/
theorem rs_R009_ueqv_R009NNNYN_partial_05_0419_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_05_0419
        rs_R009_ueqv_R009NNNYN_generator_05_0400_0451 =
      rs_R009_ueqv_R009NNNYN_partial_05_0419 := by
  native_decide

/-- Coefficient term 420 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NNNYN_coefficient_05_0420 : Poly :=
[
  term ((2741760 : Rat) / 12247399) [(11, 1), (13, 2), (15, 1)]
]

/-- Partial product 420 for generator 5. -/
def rs_R009_ueqv_R009NNNYN_partial_05_0420 : Poly :=
[
  term ((-5483520 : Rat) / 12247399) [(4, 1), (11, 1), (13, 2), (15, 1)],
  term ((2741760 : Rat) / 12247399) [(4, 2), (11, 1), (13, 2), (15, 1)],
  term ((2741760 : Rat) / 12247399) [(5, 2), (11, 1), (13, 2), (15, 1)],
  term ((5483520 : Rat) / 12247399) [(11, 1), (13, 2), (14, 1), (15, 1)],
  term ((-2741760 : Rat) / 12247399) [(11, 1), (13, 2), (14, 2), (15, 1)],
  term ((-2741760 : Rat) / 12247399) [(11, 1), (13, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 420 for generator 5. -/
theorem rs_R009_ueqv_R009NNNYN_partial_05_0420_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_05_0420
        rs_R009_ueqv_R009NNNYN_generator_05_0400_0451 =
      rs_R009_ueqv_R009NNNYN_partial_05_0420 := by
  native_decide

/-- Coefficient term 421 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NNNYN_coefficient_05_0421 : Poly :=
[
  term ((8037829706 : Rat) / 330679773) [(11, 1), (14, 1), (15, 1)]
]

/-- Partial product 421 for generator 5. -/
def rs_R009_ueqv_R009NNNYN_partial_05_0421 : Poly :=
[
  term ((-16075659412 : Rat) / 330679773) [(4, 1), (11, 1), (14, 1), (15, 1)],
  term ((8037829706 : Rat) / 330679773) [(4, 2), (11, 1), (14, 1), (15, 1)],
  term ((8037829706 : Rat) / 330679773) [(5, 2), (11, 1), (14, 1), (15, 1)],
  term ((-8037829706 : Rat) / 330679773) [(11, 1), (14, 1), (15, 3)],
  term ((16075659412 : Rat) / 330679773) [(11, 1), (14, 2), (15, 1)],
  term ((-8037829706 : Rat) / 330679773) [(11, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 421 for generator 5. -/
theorem rs_R009_ueqv_R009NNNYN_partial_05_0421_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_05_0421
        rs_R009_ueqv_R009NNNYN_generator_05_0400_0451 =
      rs_R009_ueqv_R009NNNYN_partial_05_0421 := by
  native_decide

/-- Coefficient term 422 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NNNYN_coefficient_05_0422 : Poly :=
[
  term ((-218159360 : Rat) / 110226591) [(11, 1), (14, 2), (15, 1)]
]

/-- Partial product 422 for generator 5. -/
def rs_R009_ueqv_R009NNNYN_partial_05_0422 : Poly :=
[
  term ((436318720 : Rat) / 110226591) [(4, 1), (11, 1), (14, 2), (15, 1)],
  term ((-218159360 : Rat) / 110226591) [(4, 2), (11, 1), (14, 2), (15, 1)],
  term ((-218159360 : Rat) / 110226591) [(5, 2), (11, 1), (14, 2), (15, 1)],
  term ((218159360 : Rat) / 110226591) [(11, 1), (14, 2), (15, 3)],
  term ((-436318720 : Rat) / 110226591) [(11, 1), (14, 3), (15, 1)],
  term ((218159360 : Rat) / 110226591) [(11, 1), (14, 4), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 422 for generator 5. -/
theorem rs_R009_ueqv_R009NNNYN_partial_05_0422_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_05_0422
        rs_R009_ueqv_R009NNNYN_generator_05_0400_0451 =
      rs_R009_ueqv_R009NNNYN_partial_05_0422 := by
  native_decide

/-- Coefficient term 423 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NNNYN_coefficient_05_0423 : Poly :=
[
  term ((-804320254952 : Rat) / 94243735305) [(11, 1), (15, 1)]
]

/-- Partial product 423 for generator 5. -/
def rs_R009_ueqv_R009NNNYN_partial_05_0423 : Poly :=
[
  term ((1608640509904 : Rat) / 94243735305) [(4, 1), (11, 1), (15, 1)],
  term ((-804320254952 : Rat) / 94243735305) [(4, 2), (11, 1), (15, 1)],
  term ((-804320254952 : Rat) / 94243735305) [(5, 2), (11, 1), (15, 1)],
  term ((-1608640509904 : Rat) / 94243735305) [(11, 1), (14, 1), (15, 1)],
  term ((804320254952 : Rat) / 94243735305) [(11, 1), (14, 2), (15, 1)],
  term ((804320254952 : Rat) / 94243735305) [(11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 423 for generator 5. -/
theorem rs_R009_ueqv_R009NNNYN_partial_05_0423_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_05_0423
        rs_R009_ueqv_R009NNNYN_generator_05_0400_0451 =
      rs_R009_ueqv_R009NNNYN_partial_05_0423 := by
  native_decide

/-- Coefficient term 424 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NNNYN_coefficient_05_0424 : Poly :=
[
  term ((-159581440 : Rat) / 110226591) [(11, 1), (15, 3)]
]

/-- Partial product 424 for generator 5. -/
def rs_R009_ueqv_R009NNNYN_partial_05_0424 : Poly :=
[
  term ((319162880 : Rat) / 110226591) [(4, 1), (11, 1), (15, 3)],
  term ((-159581440 : Rat) / 110226591) [(4, 2), (11, 1), (15, 3)],
  term ((-159581440 : Rat) / 110226591) [(5, 2), (11, 1), (15, 3)],
  term ((-319162880 : Rat) / 110226591) [(11, 1), (14, 1), (15, 3)],
  term ((159581440 : Rat) / 110226591) [(11, 1), (14, 2), (15, 3)],
  term ((159581440 : Rat) / 110226591) [(11, 1), (15, 5)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 424 for generator 5. -/
theorem rs_R009_ueqv_R009NNNYN_partial_05_0424_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_05_0424
        rs_R009_ueqv_R009NNNYN_generator_05_0400_0451 =
      rs_R009_ueqv_R009NNNYN_partial_05_0424 := by
  native_decide

/-- Coefficient term 425 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NNNYN_coefficient_05_0425 : Poly :=
[
  term ((-327965041376 : Rat) / 94243735305) [(11, 2)]
]

/-- Partial product 425 for generator 5. -/
def rs_R009_ueqv_R009NNNYN_partial_05_0425 : Poly :=
[
  term ((655930082752 : Rat) / 94243735305) [(4, 1), (11, 2)],
  term ((-327965041376 : Rat) / 94243735305) [(4, 2), (11, 2)],
  term ((-327965041376 : Rat) / 94243735305) [(5, 2), (11, 2)],
  term ((-655930082752 : Rat) / 94243735305) [(11, 2), (14, 1)],
  term ((327965041376 : Rat) / 94243735305) [(11, 2), (14, 2)],
  term ((327965041376 : Rat) / 94243735305) [(11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 425 for generator 5. -/
theorem rs_R009_ueqv_R009NNNYN_partial_05_0425_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_05_0425
        rs_R009_ueqv_R009NNNYN_generator_05_0400_0451 =
      rs_R009_ueqv_R009NNNYN_partial_05_0425 := by
  native_decide

/-- Coefficient term 426 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NNNYN_coefficient_05_0426 : Poly :=
[
  term ((-38993920 : Rat) / 110226591) [(11, 2), (12, 1)]
]

/-- Partial product 426 for generator 5. -/
def rs_R009_ueqv_R009NNNYN_partial_05_0426 : Poly :=
[
  term ((77987840 : Rat) / 110226591) [(4, 1), (11, 2), (12, 1)],
  term ((-38993920 : Rat) / 110226591) [(4, 2), (11, 2), (12, 1)],
  term ((-38993920 : Rat) / 110226591) [(5, 2), (11, 2), (12, 1)],
  term ((-77987840 : Rat) / 110226591) [(11, 2), (12, 1), (14, 1)],
  term ((38993920 : Rat) / 110226591) [(11, 2), (12, 1), (14, 2)],
  term ((38993920 : Rat) / 110226591) [(11, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 426 for generator 5. -/
theorem rs_R009_ueqv_R009NNNYN_partial_05_0426_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_05_0426
        rs_R009_ueqv_R009NNNYN_generator_05_0400_0451 =
      rs_R009_ueqv_R009NNNYN_partial_05_0426 := by
  native_decide

/-- Coefficient term 427 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NNNYN_coefficient_05_0427 : Poly :=
[
  term ((97484800 : Rat) / 110226591) [(11, 2), (12, 1), (14, 1)]
]

/-- Partial product 427 for generator 5. -/
def rs_R009_ueqv_R009NNNYN_partial_05_0427 : Poly :=
[
  term ((-194969600 : Rat) / 110226591) [(4, 1), (11, 2), (12, 1), (14, 1)],
  term ((97484800 : Rat) / 110226591) [(4, 2), (11, 2), (12, 1), (14, 1)],
  term ((97484800 : Rat) / 110226591) [(5, 2), (11, 2), (12, 1), (14, 1)],
  term ((-97484800 : Rat) / 110226591) [(11, 2), (12, 1), (14, 1), (15, 2)],
  term ((194969600 : Rat) / 110226591) [(11, 2), (12, 1), (14, 2)],
  term ((-97484800 : Rat) / 110226591) [(11, 2), (12, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 427 for generator 5. -/
theorem rs_R009_ueqv_R009NNNYN_partial_05_0427_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_05_0427
        rs_R009_ueqv_R009NNNYN_generator_05_0400_0451 =
      rs_R009_ueqv_R009NNNYN_partial_05_0427 := by
  native_decide

/-- Coefficient term 428 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NNNYN_coefficient_05_0428 : Poly :=
[
  term ((19496960 : Rat) / 36742197) [(11, 2), (13, 1), (15, 1)]
]

/-- Partial product 428 for generator 5. -/
def rs_R009_ueqv_R009NNNYN_partial_05_0428 : Poly :=
[
  term ((-38993920 : Rat) / 36742197) [(4, 1), (11, 2), (13, 1), (15, 1)],
  term ((19496960 : Rat) / 36742197) [(4, 2), (11, 2), (13, 1), (15, 1)],
  term ((19496960 : Rat) / 36742197) [(5, 2), (11, 2), (13, 1), (15, 1)],
  term ((38993920 : Rat) / 36742197) [(11, 2), (13, 1), (14, 1), (15, 1)],
  term ((-19496960 : Rat) / 36742197) [(11, 2), (13, 1), (14, 2), (15, 1)],
  term ((-19496960 : Rat) / 36742197) [(11, 2), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 428 for generator 5. -/
theorem rs_R009_ueqv_R009NNNYN_partial_05_0428_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_05_0428
        rs_R009_ueqv_R009NNNYN_generator_05_0400_0451 =
      rs_R009_ueqv_R009NNNYN_partial_05_0428 := by
  native_decide

/-- Coefficient term 429 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NNNYN_coefficient_05_0429 : Poly :=
[
  term ((-2536468480 : Rat) / 330679773) [(11, 2), (14, 1)]
]

/-- Partial product 429 for generator 5. -/
def rs_R009_ueqv_R009NNNYN_partial_05_0429 : Poly :=
[
  term ((5072936960 : Rat) / 330679773) [(4, 1), (11, 2), (14, 1)],
  term ((-2536468480 : Rat) / 330679773) [(4, 2), (11, 2), (14, 1)],
  term ((-2536468480 : Rat) / 330679773) [(5, 2), (11, 2), (14, 1)],
  term ((2536468480 : Rat) / 330679773) [(11, 2), (14, 1), (15, 2)],
  term ((-5072936960 : Rat) / 330679773) [(11, 2), (14, 2)],
  term ((2536468480 : Rat) / 330679773) [(11, 2), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 429 for generator 5. -/
theorem rs_R009_ueqv_R009NNNYN_partial_05_0429_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_05_0429
        rs_R009_ueqv_R009NNNYN_generator_05_0400_0451 =
      rs_R009_ueqv_R009NNNYN_partial_05_0429 := by
  native_decide

/-- Coefficient term 430 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NNNYN_coefficient_05_0430 : Poly :=
[
  term ((716800 : Rat) / 231083) [(11, 2), (14, 2)]
]

/-- Partial product 430 for generator 5. -/
def rs_R009_ueqv_R009NNNYN_partial_05_0430 : Poly :=
[
  term ((-1433600 : Rat) / 231083) [(4, 1), (11, 2), (14, 2)],
  term ((716800 : Rat) / 231083) [(4, 2), (11, 2), (14, 2)],
  term ((716800 : Rat) / 231083) [(5, 2), (11, 2), (14, 2)],
  term ((-716800 : Rat) / 231083) [(11, 2), (14, 2), (15, 2)],
  term ((1433600 : Rat) / 231083) [(11, 2), (14, 3)],
  term ((-716800 : Rat) / 231083) [(11, 2), (14, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 430 for generator 5. -/
theorem rs_R009_ueqv_R009NNNYN_partial_05_0430_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_05_0430
        rs_R009_ueqv_R009NNNYN_generator_05_0400_0451 =
      rs_R009_ueqv_R009NNNYN_partial_05_0430 := by
  native_decide

/-- Coefficient term 431 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NNNYN_coefficient_05_0431 : Poly :=
[
  term ((293171200 : Rat) / 110226591) [(11, 2), (15, 2)]
]

/-- Partial product 431 for generator 5. -/
def rs_R009_ueqv_R009NNNYN_partial_05_0431 : Poly :=
[
  term ((-586342400 : Rat) / 110226591) [(4, 1), (11, 2), (15, 2)],
  term ((293171200 : Rat) / 110226591) [(4, 2), (11, 2), (15, 2)],
  term ((293171200 : Rat) / 110226591) [(5, 2), (11, 2), (15, 2)],
  term ((586342400 : Rat) / 110226591) [(11, 2), (14, 1), (15, 2)],
  term ((-293171200 : Rat) / 110226591) [(11, 2), (14, 2), (15, 2)],
  term ((-293171200 : Rat) / 110226591) [(11, 2), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 431 for generator 5. -/
theorem rs_R009_ueqv_R009NNNYN_partial_05_0431_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_05_0431
        rs_R009_ueqv_R009NNNYN_generator_05_0400_0451 =
      rs_R009_ueqv_R009NNNYN_partial_05_0431 := by
  native_decide

/-- Coefficient term 432 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NNNYN_coefficient_05_0432 : Poly :=
[
  term ((54 : Rat) / 67) [(12, 1)]
]

/-- Partial product 432 for generator 5. -/
def rs_R009_ueqv_R009NNNYN_partial_05_0432 : Poly :=
[
  term ((-108 : Rat) / 67) [(4, 1), (12, 1)],
  term ((54 : Rat) / 67) [(4, 2), (12, 1)],
  term ((54 : Rat) / 67) [(5, 2), (12, 1)],
  term ((108 : Rat) / 67) [(12, 1), (14, 1)],
  term ((-54 : Rat) / 67) [(12, 1), (14, 2)],
  term ((-54 : Rat) / 67) [(12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 432 for generator 5. -/
theorem rs_R009_ueqv_R009NNNYN_partial_05_0432_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_05_0432
        rs_R009_ueqv_R009NNNYN_generator_05_0400_0451 =
      rs_R009_ueqv_R009NNNYN_partial_05_0432 := by
  native_decide

/-- Coefficient term 433 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NNNYN_coefficient_05_0433 : Poly :=
[
  term ((-4569600 : Rat) / 12247399) [(12, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 433 for generator 5. -/
def rs_R009_ueqv_R009NNNYN_partial_05_0433 : Poly :=
[
  term ((9139200 : Rat) / 12247399) [(4, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-4569600 : Rat) / 12247399) [(4, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-4569600 : Rat) / 12247399) [(5, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((4569600 : Rat) / 12247399) [(12, 1), (13, 1), (14, 1), (15, 3)],
  term ((-9139200 : Rat) / 12247399) [(12, 1), (13, 1), (14, 2), (15, 1)],
  term ((4569600 : Rat) / 12247399) [(12, 1), (13, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 433 for generator 5. -/
theorem rs_R009_ueqv_R009NNNYN_partial_05_0433_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_05_0433
        rs_R009_ueqv_R009NNNYN_generator_05_0400_0451 =
      rs_R009_ueqv_R009NNNYN_partial_05_0433 := by
  native_decide

/-- Coefficient term 434 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NNNYN_coefficient_05_0434 : Poly :=
[
  term ((10760120 : Rat) / 12247399) [(12, 1), (13, 1), (15, 1)]
]

/-- Partial product 434 for generator 5. -/
def rs_R009_ueqv_R009NNNYN_partial_05_0434 : Poly :=
[
  term ((-21520240 : Rat) / 12247399) [(4, 1), (12, 1), (13, 1), (15, 1)],
  term ((10760120 : Rat) / 12247399) [(4, 2), (12, 1), (13, 1), (15, 1)],
  term ((10760120 : Rat) / 12247399) [(5, 2), (12, 1), (13, 1), (15, 1)],
  term ((21520240 : Rat) / 12247399) [(12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-10760120 : Rat) / 12247399) [(12, 1), (13, 1), (14, 2), (15, 1)],
  term ((-10760120 : Rat) / 12247399) [(12, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 434 for generator 5. -/
theorem rs_R009_ueqv_R009NNNYN_partial_05_0434_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_05_0434
        rs_R009_ueqv_R009NNNYN_generator_05_0400_0451 =
      rs_R009_ueqv_R009NNNYN_partial_05_0434 := by
  native_decide

/-- Coefficient term 435 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NNNYN_coefficient_05_0435 : Poly :=
[
  term ((-18 : Rat) / 67) [(12, 1), (14, 1)]
]

/-- Partial product 435 for generator 5. -/
def rs_R009_ueqv_R009NNNYN_partial_05_0435 : Poly :=
[
  term ((36 : Rat) / 67) [(4, 1), (12, 1), (14, 1)],
  term ((-18 : Rat) / 67) [(4, 2), (12, 1), (14, 1)],
  term ((-18 : Rat) / 67) [(5, 2), (12, 1), (14, 1)],
  term ((18 : Rat) / 67) [(12, 1), (14, 1), (15, 2)],
  term ((-36 : Rat) / 67) [(12, 1), (14, 2)],
  term ((18 : Rat) / 67) [(12, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 435 for generator 5. -/
theorem rs_R009_ueqv_R009NNNYN_partial_05_0435_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_05_0435
        rs_R009_ueqv_R009NNNYN_generator_05_0400_0451 =
      rs_R009_ueqv_R009NNNYN_partial_05_0435 := by
  native_decide

/-- Coefficient term 436 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NNNYN_coefficient_05_0436 : Poly :=
[
  term ((87910400 : Rat) / 110226591) [(12, 1), (14, 1), (15, 2)]
]

/-- Partial product 436 for generator 5. -/
def rs_R009_ueqv_R009NNNYN_partial_05_0436 : Poly :=
[
  term ((-175820800 : Rat) / 110226591) [(4, 1), (12, 1), (14, 1), (15, 2)],
  term ((87910400 : Rat) / 110226591) [(4, 2), (12, 1), (14, 1), (15, 2)],
  term ((87910400 : Rat) / 110226591) [(5, 2), (12, 1), (14, 1), (15, 2)],
  term ((-87910400 : Rat) / 110226591) [(12, 1), (14, 1), (15, 4)],
  term ((175820800 : Rat) / 110226591) [(12, 1), (14, 2), (15, 2)],
  term ((-87910400 : Rat) / 110226591) [(12, 1), (14, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 436 for generator 5. -/
theorem rs_R009_ueqv_R009NNNYN_partial_05_0436_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_05_0436
        rs_R009_ueqv_R009NNNYN_generator_05_0400_0451 =
      rs_R009_ueqv_R009NNNYN_partial_05_0436 := by
  native_decide

/-- Coefficient term 437 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NNNYN_coefficient_05_0437 : Poly :=
[
  term ((-532173298 : Rat) / 330679773) [(12, 1), (15, 2)]
]

/-- Partial product 437 for generator 5. -/
def rs_R009_ueqv_R009NNNYN_partial_05_0437 : Poly :=
[
  term ((1064346596 : Rat) / 330679773) [(4, 1), (12, 1), (15, 2)],
  term ((-532173298 : Rat) / 330679773) [(4, 2), (12, 1), (15, 2)],
  term ((-532173298 : Rat) / 330679773) [(5, 2), (12, 1), (15, 2)],
  term ((-1064346596 : Rat) / 330679773) [(12, 1), (14, 1), (15, 2)],
  term ((532173298 : Rat) / 330679773) [(12, 1), (14, 2), (15, 2)],
  term ((532173298 : Rat) / 330679773) [(12, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 437 for generator 5. -/
theorem rs_R009_ueqv_R009NNNYN_partial_05_0437_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_05_0437
        rs_R009_ueqv_R009NNNYN_generator_05_0400_0451 =
      rs_R009_ueqv_R009NNNYN_partial_05_0437 := by
  native_decide

/-- Coefficient term 438 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NNNYN_coefficient_05_0438 : Poly :=
[
  term ((1243742678 : Rat) / 330679773) [(13, 1), (14, 1), (15, 1)]
]

/-- Partial product 438 for generator 5. -/
def rs_R009_ueqv_R009NNNYN_partial_05_0438 : Poly :=
[
  term ((-2487485356 : Rat) / 330679773) [(4, 1), (13, 1), (14, 1), (15, 1)],
  term ((1243742678 : Rat) / 330679773) [(4, 2), (13, 1), (14, 1), (15, 1)],
  term ((1243742678 : Rat) / 330679773) [(5, 2), (13, 1), (14, 1), (15, 1)],
  term ((-1243742678 : Rat) / 330679773) [(13, 1), (14, 1), (15, 3)],
  term ((2487485356 : Rat) / 330679773) [(13, 1), (14, 2), (15, 1)],
  term ((-1243742678 : Rat) / 330679773) [(13, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 438 for generator 5. -/
theorem rs_R009_ueqv_R009NNNYN_partial_05_0438_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_05_0438
        rs_R009_ueqv_R009NNNYN_generator_05_0400_0451 =
      rs_R009_ueqv_R009NNNYN_partial_05_0438 := by
  native_decide

/-- Coefficient term 439 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NNNYN_coefficient_05_0439 : Poly :=
[
  term ((74217920 : Rat) / 36742197) [(13, 1), (14, 2), (15, 1)]
]

/-- Partial product 439 for generator 5. -/
def rs_R009_ueqv_R009NNNYN_partial_05_0439 : Poly :=
[
  term ((-148435840 : Rat) / 36742197) [(4, 1), (13, 1), (14, 2), (15, 1)],
  term ((74217920 : Rat) / 36742197) [(4, 2), (13, 1), (14, 2), (15, 1)],
  term ((74217920 : Rat) / 36742197) [(5, 2), (13, 1), (14, 2), (15, 1)],
  term ((-74217920 : Rat) / 36742197) [(13, 1), (14, 2), (15, 3)],
  term ((148435840 : Rat) / 36742197) [(13, 1), (14, 3), (15, 1)],
  term ((-74217920 : Rat) / 36742197) [(13, 1), (14, 4), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 439 for generator 5. -/
theorem rs_R009_ueqv_R009NNNYN_partial_05_0439_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_05_0439
        rs_R009_ueqv_R009NNNYN_generator_05_0400_0451 =
      rs_R009_ueqv_R009NNNYN_partial_05_0439 := by
  native_decide

/-- Coefficient term 440 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NNNYN_coefficient_05_0440 : Poly :=
[
  term ((-6273188833 : Rat) / 661359546) [(13, 1), (15, 1)]
]

/-- Partial product 440 for generator 5. -/
def rs_R009_ueqv_R009NNNYN_partial_05_0440 : Poly :=
[
  term ((6273188833 : Rat) / 330679773) [(4, 1), (13, 1), (15, 1)],
  term ((-6273188833 : Rat) / 661359546) [(4, 2), (13, 1), (15, 1)],
  term ((-6273188833 : Rat) / 661359546) [(5, 2), (13, 1), (15, 1)],
  term ((-6273188833 : Rat) / 330679773) [(13, 1), (14, 1), (15, 1)],
  term ((6273188833 : Rat) / 661359546) [(13, 1), (14, 2), (15, 1)],
  term ((6273188833 : Rat) / 661359546) [(13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 440 for generator 5. -/
theorem rs_R009_ueqv_R009NNNYN_partial_05_0440_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_05_0440
        rs_R009_ueqv_R009NNNYN_generator_05_0400_0451 =
      rs_R009_ueqv_R009NNNYN_partial_05_0440 := by
  native_decide

/-- Coefficient term 441 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NNNYN_coefficient_05_0441 : Poly :=
[
  term ((76274240 : Rat) / 36742197) [(13, 1), (15, 3)]
]

/-- Partial product 441 for generator 5. -/
def rs_R009_ueqv_R009NNNYN_partial_05_0441 : Poly :=
[
  term ((-152548480 : Rat) / 36742197) [(4, 1), (13, 1), (15, 3)],
  term ((76274240 : Rat) / 36742197) [(4, 2), (13, 1), (15, 3)],
  term ((76274240 : Rat) / 36742197) [(5, 2), (13, 1), (15, 3)],
  term ((152548480 : Rat) / 36742197) [(13, 1), (14, 1), (15, 3)],
  term ((-76274240 : Rat) / 36742197) [(13, 1), (14, 2), (15, 3)],
  term ((-76274240 : Rat) / 36742197) [(13, 1), (15, 5)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 441 for generator 5. -/
theorem rs_R009_ueqv_R009NNNYN_partial_05_0441_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_05_0441
        rs_R009_ueqv_R009NNNYN_generator_05_0400_0451 =
      rs_R009_ueqv_R009NNNYN_partial_05_0441 := by
  native_decide

/-- Coefficient term 442 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NNNYN_coefficient_05_0442 : Poly :=
[
  term ((53466749 : Rat) / 24494798) [(13, 2)]
]

/-- Partial product 442 for generator 5. -/
def rs_R009_ueqv_R009NNNYN_partial_05_0442 : Poly :=
[
  term ((-53466749 : Rat) / 12247399) [(4, 1), (13, 2)],
  term ((53466749 : Rat) / 24494798) [(4, 2), (13, 2)],
  term ((53466749 : Rat) / 24494798) [(5, 2), (13, 2)],
  term ((53466749 : Rat) / 12247399) [(13, 2), (14, 1)],
  term ((-53466749 : Rat) / 24494798) [(13, 2), (14, 2)],
  term ((-53466749 : Rat) / 24494798) [(13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 442 for generator 5. -/
theorem rs_R009_ueqv_R009NNNYN_partial_05_0442_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_05_0442
        rs_R009_ueqv_R009NNNYN_generator_05_0400_0451 =
      rs_R009_ueqv_R009NNNYN_partial_05_0442 := by
  native_decide

/-- Coefficient term 443 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NNNYN_coefficient_05_0443 : Poly :=
[
  term ((13148660 : Rat) / 12247399) [(13, 2), (14, 1)]
]

/-- Partial product 443 for generator 5. -/
def rs_R009_ueqv_R009NNNYN_partial_05_0443 : Poly :=
[
  term ((-26297320 : Rat) / 12247399) [(4, 1), (13, 2), (14, 1)],
  term ((13148660 : Rat) / 12247399) [(4, 2), (13, 2), (14, 1)],
  term ((13148660 : Rat) / 12247399) [(5, 2), (13, 2), (14, 1)],
  term ((-13148660 : Rat) / 12247399) [(13, 2), (14, 1), (15, 2)],
  term ((26297320 : Rat) / 12247399) [(13, 2), (14, 2)],
  term ((-13148660 : Rat) / 12247399) [(13, 2), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 443 for generator 5. -/
theorem rs_R009_ueqv_R009NNNYN_partial_05_0443_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_05_0443
        rs_R009_ueqv_R009NNNYN_generator_05_0400_0451 =
      rs_R009_ueqv_R009NNNYN_partial_05_0443 := by
  native_decide

/-- Coefficient term 444 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NNNYN_coefficient_05_0444 : Poly :=
[
  term ((-9596160 : Rat) / 12247399) [(13, 2), (14, 2)]
]

/-- Partial product 444 for generator 5. -/
def rs_R009_ueqv_R009NNNYN_partial_05_0444 : Poly :=
[
  term ((19192320 : Rat) / 12247399) [(4, 1), (13, 2), (14, 2)],
  term ((-9596160 : Rat) / 12247399) [(4, 2), (13, 2), (14, 2)],
  term ((-9596160 : Rat) / 12247399) [(5, 2), (13, 2), (14, 2)],
  term ((9596160 : Rat) / 12247399) [(13, 2), (14, 2), (15, 2)],
  term ((-19192320 : Rat) / 12247399) [(13, 2), (14, 3)],
  term ((9596160 : Rat) / 12247399) [(13, 2), (14, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 444 for generator 5. -/
theorem rs_R009_ueqv_R009NNNYN_partial_05_0444_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_05_0444
        rs_R009_ueqv_R009NNNYN_generator_05_0400_0451 =
      rs_R009_ueqv_R009NNNYN_partial_05_0444 := by
  native_decide

/-- Coefficient term 445 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NNNYN_coefficient_05_0445 : Poly :=
[
  term ((-9596160 : Rat) / 12247399) [(13, 2), (15, 2)]
]

/-- Partial product 445 for generator 5. -/
def rs_R009_ueqv_R009NNNYN_partial_05_0445 : Poly :=
[
  term ((19192320 : Rat) / 12247399) [(4, 1), (13, 2), (15, 2)],
  term ((-9596160 : Rat) / 12247399) [(4, 2), (13, 2), (15, 2)],
  term ((-9596160 : Rat) / 12247399) [(5, 2), (13, 2), (15, 2)],
  term ((-19192320 : Rat) / 12247399) [(13, 2), (14, 1), (15, 2)],
  term ((9596160 : Rat) / 12247399) [(13, 2), (14, 2), (15, 2)],
  term ((9596160 : Rat) / 12247399) [(13, 2), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 445 for generator 5. -/
theorem rs_R009_ueqv_R009NNNYN_partial_05_0445_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_05_0445
        rs_R009_ueqv_R009NNNYN_generator_05_0400_0451 =
      rs_R009_ueqv_R009NNNYN_partial_05_0445 := by
  native_decide

/-- Coefficient term 446 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NNNYN_coefficient_05_0446 : Poly :=
[
  term ((337 : Rat) / 67) [(14, 1)]
]

/-- Partial product 446 for generator 5. -/
def rs_R009_ueqv_R009NNNYN_partial_05_0446 : Poly :=
[
  term ((-674 : Rat) / 67) [(4, 1), (14, 1)],
  term ((337 : Rat) / 67) [(4, 2), (14, 1)],
  term ((337 : Rat) / 67) [(5, 2), (14, 1)],
  term ((-337 : Rat) / 67) [(14, 1), (15, 2)],
  term ((674 : Rat) / 67) [(14, 2)],
  term ((-337 : Rat) / 67) [(14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 446 for generator 5. -/
theorem rs_R009_ueqv_R009NNNYN_partial_05_0446_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_05_0446
        rs_R009_ueqv_R009NNNYN_generator_05_0400_0451 =
      rs_R009_ueqv_R009NNNYN_partial_05_0446 := by
  native_decide

/-- Coefficient term 447 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NNNYN_coefficient_05_0447 : Poly :=
[
  term ((-496734160 : Rat) / 36742197) [(14, 1), (15, 2)]
]

/-- Partial product 447 for generator 5. -/
def rs_R009_ueqv_R009NNNYN_partial_05_0447 : Poly :=
[
  term ((993468320 : Rat) / 36742197) [(4, 1), (14, 1), (15, 2)],
  term ((-496734160 : Rat) / 36742197) [(4, 2), (14, 1), (15, 2)],
  term ((-496734160 : Rat) / 36742197) [(5, 2), (14, 1), (15, 2)],
  term ((496734160 : Rat) / 36742197) [(14, 1), (15, 4)],
  term ((-993468320 : Rat) / 36742197) [(14, 2), (15, 2)],
  term ((496734160 : Rat) / 36742197) [(14, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 447 for generator 5. -/
theorem rs_R009_ueqv_R009NNNYN_partial_05_0447_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_05_0447
        rs_R009_ueqv_R009NNNYN_generator_05_0400_0451 =
      rs_R009_ueqv_R009NNNYN_partial_05_0447 := by
  native_decide

/-- Coefficient term 448 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NNNYN_coefficient_05_0448 : Poly :=
[
  term ((-92 : Rat) / 67) [(14, 2)]
]

/-- Partial product 448 for generator 5. -/
def rs_R009_ueqv_R009NNNYN_partial_05_0448 : Poly :=
[
  term ((184 : Rat) / 67) [(4, 1), (14, 2)],
  term ((-92 : Rat) / 67) [(4, 2), (14, 2)],
  term ((-92 : Rat) / 67) [(5, 2), (14, 2)],
  term ((92 : Rat) / 67) [(14, 2), (15, 2)],
  term ((-184 : Rat) / 67) [(14, 3)],
  term ((92 : Rat) / 67) [(14, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 448 for generator 5. -/
theorem rs_R009_ueqv_R009NNNYN_partial_05_0448_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_05_0448
        rs_R009_ueqv_R009NNNYN_generator_05_0400_0451 =
      rs_R009_ueqv_R009NNNYN_partial_05_0448 := by
  native_decide

/-- Coefficient term 449 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NNNYN_coefficient_05_0449 : Poly :=
[
  term ((-81317120 : Rat) / 110226591) [(14, 2), (15, 2)]
]

/-- Partial product 449 for generator 5. -/
def rs_R009_ueqv_R009NNNYN_partial_05_0449 : Poly :=
[
  term ((162634240 : Rat) / 110226591) [(4, 1), (14, 2), (15, 2)],
  term ((-81317120 : Rat) / 110226591) [(4, 2), (14, 2), (15, 2)],
  term ((-81317120 : Rat) / 110226591) [(5, 2), (14, 2), (15, 2)],
  term ((81317120 : Rat) / 110226591) [(14, 2), (15, 4)],
  term ((-162634240 : Rat) / 110226591) [(14, 3), (15, 2)],
  term ((81317120 : Rat) / 110226591) [(14, 4), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 449 for generator 5. -/
theorem rs_R009_ueqv_R009NNNYN_partial_05_0449_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_05_0449
        rs_R009_ueqv_R009NNNYN_generator_05_0400_0451 =
      rs_R009_ueqv_R009NNNYN_partial_05_0449 := by
  native_decide

/-- Coefficient term 450 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NNNYN_coefficient_05_0450 : Poly :=
[
  term ((5874810953 : Rat) / 661359546) [(15, 2)]
]

/-- Partial product 450 for generator 5. -/
def rs_R009_ueqv_R009NNNYN_partial_05_0450 : Poly :=
[
  term ((-5874810953 : Rat) / 330679773) [(4, 1), (15, 2)],
  term ((5874810953 : Rat) / 661359546) [(4, 2), (15, 2)],
  term ((5874810953 : Rat) / 661359546) [(5, 2), (15, 2)],
  term ((5874810953 : Rat) / 330679773) [(14, 1), (15, 2)],
  term ((-5874810953 : Rat) / 661359546) [(14, 2), (15, 2)],
  term ((-5874810953 : Rat) / 661359546) [(15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 450 for generator 5. -/
theorem rs_R009_ueqv_R009NNNYN_partial_05_0450_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_05_0450
        rs_R009_ueqv_R009NNNYN_generator_05_0400_0451 =
      rs_R009_ueqv_R009NNNYN_partial_05_0450 := by
  native_decide

/-- Coefficient term 451 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NNNYN_coefficient_05_0451 : Poly :=
[
  term ((-94503680 : Rat) / 110226591) [(15, 4)]
]

/-- Partial product 451 for generator 5. -/
def rs_R009_ueqv_R009NNNYN_partial_05_0451 : Poly :=
[
  term ((189007360 : Rat) / 110226591) [(4, 1), (15, 4)],
  term ((-94503680 : Rat) / 110226591) [(4, 2), (15, 4)],
  term ((-94503680 : Rat) / 110226591) [(5, 2), (15, 4)],
  term ((-189007360 : Rat) / 110226591) [(14, 1), (15, 4)],
  term ((94503680 : Rat) / 110226591) [(14, 2), (15, 4)],
  term ((94503680 : Rat) / 110226591) [(15, 6)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 451 for generator 5. -/
theorem rs_R009_ueqv_R009NNNYN_partial_05_0451_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_05_0451
        rs_R009_ueqv_R009NNNYN_generator_05_0400_0451 =
      rs_R009_ueqv_R009NNNYN_partial_05_0451 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NNNYN_partials_05_0400_0451 : List Poly :=
[
  rs_R009_ueqv_R009NNNYN_partial_05_0400,
  rs_R009_ueqv_R009NNNYN_partial_05_0401,
  rs_R009_ueqv_R009NNNYN_partial_05_0402,
  rs_R009_ueqv_R009NNNYN_partial_05_0403,
  rs_R009_ueqv_R009NNNYN_partial_05_0404,
  rs_R009_ueqv_R009NNNYN_partial_05_0405,
  rs_R009_ueqv_R009NNNYN_partial_05_0406,
  rs_R009_ueqv_R009NNNYN_partial_05_0407,
  rs_R009_ueqv_R009NNNYN_partial_05_0408,
  rs_R009_ueqv_R009NNNYN_partial_05_0409,
  rs_R009_ueqv_R009NNNYN_partial_05_0410,
  rs_R009_ueqv_R009NNNYN_partial_05_0411,
  rs_R009_ueqv_R009NNNYN_partial_05_0412,
  rs_R009_ueqv_R009NNNYN_partial_05_0413,
  rs_R009_ueqv_R009NNNYN_partial_05_0414,
  rs_R009_ueqv_R009NNNYN_partial_05_0415,
  rs_R009_ueqv_R009NNNYN_partial_05_0416,
  rs_R009_ueqv_R009NNNYN_partial_05_0417,
  rs_R009_ueqv_R009NNNYN_partial_05_0418,
  rs_R009_ueqv_R009NNNYN_partial_05_0419,
  rs_R009_ueqv_R009NNNYN_partial_05_0420,
  rs_R009_ueqv_R009NNNYN_partial_05_0421,
  rs_R009_ueqv_R009NNNYN_partial_05_0422,
  rs_R009_ueqv_R009NNNYN_partial_05_0423,
  rs_R009_ueqv_R009NNNYN_partial_05_0424,
  rs_R009_ueqv_R009NNNYN_partial_05_0425,
  rs_R009_ueqv_R009NNNYN_partial_05_0426,
  rs_R009_ueqv_R009NNNYN_partial_05_0427,
  rs_R009_ueqv_R009NNNYN_partial_05_0428,
  rs_R009_ueqv_R009NNNYN_partial_05_0429,
  rs_R009_ueqv_R009NNNYN_partial_05_0430,
  rs_R009_ueqv_R009NNNYN_partial_05_0431,
  rs_R009_ueqv_R009NNNYN_partial_05_0432,
  rs_R009_ueqv_R009NNNYN_partial_05_0433,
  rs_R009_ueqv_R009NNNYN_partial_05_0434,
  rs_R009_ueqv_R009NNNYN_partial_05_0435,
  rs_R009_ueqv_R009NNNYN_partial_05_0436,
  rs_R009_ueqv_R009NNNYN_partial_05_0437,
  rs_R009_ueqv_R009NNNYN_partial_05_0438,
  rs_R009_ueqv_R009NNNYN_partial_05_0439,
  rs_R009_ueqv_R009NNNYN_partial_05_0440,
  rs_R009_ueqv_R009NNNYN_partial_05_0441,
  rs_R009_ueqv_R009NNNYN_partial_05_0442,
  rs_R009_ueqv_R009NNNYN_partial_05_0443,
  rs_R009_ueqv_R009NNNYN_partial_05_0444,
  rs_R009_ueqv_R009NNNYN_partial_05_0445,
  rs_R009_ueqv_R009NNNYN_partial_05_0446,
  rs_R009_ueqv_R009NNNYN_partial_05_0447,
  rs_R009_ueqv_R009NNNYN_partial_05_0448,
  rs_R009_ueqv_R009NNNYN_partial_05_0449,
  rs_R009_ueqv_R009NNNYN_partial_05_0450,
  rs_R009_ueqv_R009NNNYN_partial_05_0451
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NNNYN_block_05_0400_0451 : Poly :=
[
  term ((-19496960 : Rat) / 110226591) [(4, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-328361908744 : Rat) / 10471526145) [(4, 1), (10, 1), (11, 1), (15, 1)],
  term ((357395842048 : Rat) / 10471526145) [(4, 1), (10, 1), (11, 2)],
  term ((-36 : Rat) / 67) [(4, 1), (10, 1), (12, 1)],
  term ((-9139200 : Rat) / 12247399) [(4, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((175820800 : Rat) / 110226591) [(4, 1), (10, 1), (12, 1), (15, 2)],
  term ((-913920 : Rat) / 12247399) [(4, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((46163840 : Rat) / 110226591) [(4, 1), (10, 1), (13, 1), (15, 1)],
  term ((913920 : Rat) / 12247399) [(4, 1), (10, 1), (13, 2)],
  term ((12 : Rat) / 67) [(4, 1), (10, 1), (14, 1)],
  term ((17582080 : Rat) / 110226591) [(4, 1), (10, 1), (14, 1), (15, 2)],
  term ((-664910044 : Rat) / 110226591) [(4, 1), (10, 1), (15, 2)],
  term ((3655680 : Rat) / 12247399) [(4, 1), (11, 1), (12, 1), (13, 1)],
  term ((-9139200 : Rat) / 12247399) [(4, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((123596800 : Rat) / 36742197) [(4, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-1588280320 : Rat) / 330679773) [(4, 1), (11, 1), (12, 1), (15, 1)],
  term ((-249717141013 : Rat) / 31414578435) [(4, 1), (11, 1), (13, 1)],
  term ((457116800 : Rat) / 330679773) [(4, 1), (11, 1), (13, 1), (14, 1)],
  term ((40315520 : Rat) / 36742197) [(4, 1), (11, 1), (13, 1), (14, 2)],
  term ((89188480 : Rat) / 36742197) [(4, 1), (11, 1), (13, 1), (15, 2)],
  term ((-5483520 : Rat) / 12247399) [(4, 1), (11, 1), (13, 2), (15, 1)],
  term ((-16075659412 : Rat) / 330679773) [(4, 1), (11, 1), (14, 1), (15, 1)],
  term ((436318720 : Rat) / 110226591) [(4, 1), (11, 1), (14, 2), (15, 1)],
  term ((1608640509904 : Rat) / 94243735305) [(4, 1), (11, 1), (15, 1)],
  term ((319162880 : Rat) / 110226591) [(4, 1), (11, 1), (15, 3)],
  term ((655930082752 : Rat) / 94243735305) [(4, 1), (11, 2)],
  term ((77987840 : Rat) / 110226591) [(4, 1), (11, 2), (12, 1)],
  term ((-194969600 : Rat) / 110226591) [(4, 1), (11, 2), (12, 1), (14, 1)],
  term ((-38993920 : Rat) / 36742197) [(4, 1), (11, 2), (13, 1), (15, 1)],
  term ((5072936960 : Rat) / 330679773) [(4, 1), (11, 2), (14, 1)],
  term ((-1433600 : Rat) / 231083) [(4, 1), (11, 2), (14, 2)],
  term ((-586342400 : Rat) / 110226591) [(4, 1), (11, 2), (15, 2)],
  term ((-108 : Rat) / 67) [(4, 1), (12, 1)],
  term ((9139200 : Rat) / 12247399) [(4, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-21520240 : Rat) / 12247399) [(4, 1), (12, 1), (13, 1), (15, 1)],
  term ((36 : Rat) / 67) [(4, 1), (12, 1), (14, 1)],
  term ((-175820800 : Rat) / 110226591) [(4, 1), (12, 1), (14, 1), (15, 2)],
  term ((1064346596 : Rat) / 330679773) [(4, 1), (12, 1), (15, 2)],
  term ((-2487485356 : Rat) / 330679773) [(4, 1), (13, 1), (14, 1), (15, 1)],
  term ((-148435840 : Rat) / 36742197) [(4, 1), (13, 1), (14, 2), (15, 1)],
  term ((6273188833 : Rat) / 330679773) [(4, 1), (13, 1), (15, 1)],
  term ((-152548480 : Rat) / 36742197) [(4, 1), (13, 1), (15, 3)],
  term ((-53466749 : Rat) / 12247399) [(4, 1), (13, 2)],
  term ((-26297320 : Rat) / 12247399) [(4, 1), (13, 2), (14, 1)],
  term ((19192320 : Rat) / 12247399) [(4, 1), (13, 2), (14, 2)],
  term ((19192320 : Rat) / 12247399) [(4, 1), (13, 2), (15, 2)],
  term ((-674 : Rat) / 67) [(4, 1), (14, 1)],
  term ((993468320 : Rat) / 36742197) [(4, 1), (14, 1), (15, 2)],
  term ((184 : Rat) / 67) [(4, 1), (14, 2)],
  term ((162634240 : Rat) / 110226591) [(4, 1), (14, 2), (15, 2)],
  term ((-5874810953 : Rat) / 330679773) [(4, 1), (15, 2)],
  term ((189007360 : Rat) / 110226591) [(4, 1), (15, 4)],
  term ((9748480 : Rat) / 110226591) [(4, 2), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((164180954372 : Rat) / 10471526145) [(4, 2), (10, 1), (11, 1), (15, 1)],
  term ((-178697921024 : Rat) / 10471526145) [(4, 2), (10, 1), (11, 2)],
  term ((18 : Rat) / 67) [(4, 2), (10, 1), (12, 1)],
  term ((4569600 : Rat) / 12247399) [(4, 2), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-87910400 : Rat) / 110226591) [(4, 2), (10, 1), (12, 1), (15, 2)],
  term ((456960 : Rat) / 12247399) [(4, 2), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-23081920 : Rat) / 110226591) [(4, 2), (10, 1), (13, 1), (15, 1)],
  term ((-456960 : Rat) / 12247399) [(4, 2), (10, 1), (13, 2)],
  term ((-6 : Rat) / 67) [(4, 2), (10, 1), (14, 1)],
  term ((-8791040 : Rat) / 110226591) [(4, 2), (10, 1), (14, 1), (15, 2)],
  term ((332455022 : Rat) / 110226591) [(4, 2), (10, 1), (15, 2)],
  term ((-1827840 : Rat) / 12247399) [(4, 2), (11, 1), (12, 1), (13, 1)],
  term ((4569600 : Rat) / 12247399) [(4, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-61798400 : Rat) / 36742197) [(4, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((794140160 : Rat) / 330679773) [(4, 2), (11, 1), (12, 1), (15, 1)],
  term ((249717141013 : Rat) / 62829156870) [(4, 2), (11, 1), (13, 1)],
  term ((-228558400 : Rat) / 330679773) [(4, 2), (11, 1), (13, 1), (14, 1)],
  term ((-20157760 : Rat) / 36742197) [(4, 2), (11, 1), (13, 1), (14, 2)],
  term ((-44594240 : Rat) / 36742197) [(4, 2), (11, 1), (13, 1), (15, 2)],
  term ((2741760 : Rat) / 12247399) [(4, 2), (11, 1), (13, 2), (15, 1)],
  term ((8037829706 : Rat) / 330679773) [(4, 2), (11, 1), (14, 1), (15, 1)],
  term ((-218159360 : Rat) / 110226591) [(4, 2), (11, 1), (14, 2), (15, 1)],
  term ((-804320254952 : Rat) / 94243735305) [(4, 2), (11, 1), (15, 1)],
  term ((-159581440 : Rat) / 110226591) [(4, 2), (11, 1), (15, 3)],
  term ((-327965041376 : Rat) / 94243735305) [(4, 2), (11, 2)],
  term ((-38993920 : Rat) / 110226591) [(4, 2), (11, 2), (12, 1)],
  term ((97484800 : Rat) / 110226591) [(4, 2), (11, 2), (12, 1), (14, 1)],
  term ((19496960 : Rat) / 36742197) [(4, 2), (11, 2), (13, 1), (15, 1)],
  term ((-2536468480 : Rat) / 330679773) [(4, 2), (11, 2), (14, 1)],
  term ((716800 : Rat) / 231083) [(4, 2), (11, 2), (14, 2)],
  term ((293171200 : Rat) / 110226591) [(4, 2), (11, 2), (15, 2)],
  term ((54 : Rat) / 67) [(4, 2), (12, 1)],
  term ((-4569600 : Rat) / 12247399) [(4, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((10760120 : Rat) / 12247399) [(4, 2), (12, 1), (13, 1), (15, 1)],
  term ((-18 : Rat) / 67) [(4, 2), (12, 1), (14, 1)],
  term ((87910400 : Rat) / 110226591) [(4, 2), (12, 1), (14, 1), (15, 2)],
  term ((-532173298 : Rat) / 330679773) [(4, 2), (12, 1), (15, 2)],
  term ((1243742678 : Rat) / 330679773) [(4, 2), (13, 1), (14, 1), (15, 1)],
  term ((74217920 : Rat) / 36742197) [(4, 2), (13, 1), (14, 2), (15, 1)],
  term ((-6273188833 : Rat) / 661359546) [(4, 2), (13, 1), (15, 1)],
  term ((76274240 : Rat) / 36742197) [(4, 2), (13, 1), (15, 3)],
  term ((53466749 : Rat) / 24494798) [(4, 2), (13, 2)],
  term ((13148660 : Rat) / 12247399) [(4, 2), (13, 2), (14, 1)],
  term ((-9596160 : Rat) / 12247399) [(4, 2), (13, 2), (14, 2)],
  term ((-9596160 : Rat) / 12247399) [(4, 2), (13, 2), (15, 2)],
  term ((337 : Rat) / 67) [(4, 2), (14, 1)],
  term ((-496734160 : Rat) / 36742197) [(4, 2), (14, 1), (15, 2)],
  term ((-92 : Rat) / 67) [(4, 2), (14, 2)],
  term ((-81317120 : Rat) / 110226591) [(4, 2), (14, 2), (15, 2)],
  term ((5874810953 : Rat) / 661359546) [(4, 2), (15, 2)],
  term ((-94503680 : Rat) / 110226591) [(4, 2), (15, 4)],
  term ((9748480 : Rat) / 110226591) [(5, 2), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((164180954372 : Rat) / 10471526145) [(5, 2), (10, 1), (11, 1), (15, 1)],
  term ((-178697921024 : Rat) / 10471526145) [(5, 2), (10, 1), (11, 2)],
  term ((18 : Rat) / 67) [(5, 2), (10, 1), (12, 1)],
  term ((4569600 : Rat) / 12247399) [(5, 2), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-87910400 : Rat) / 110226591) [(5, 2), (10, 1), (12, 1), (15, 2)],
  term ((456960 : Rat) / 12247399) [(5, 2), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-23081920 : Rat) / 110226591) [(5, 2), (10, 1), (13, 1), (15, 1)],
  term ((-456960 : Rat) / 12247399) [(5, 2), (10, 1), (13, 2)],
  term ((-6 : Rat) / 67) [(5, 2), (10, 1), (14, 1)],
  term ((-8791040 : Rat) / 110226591) [(5, 2), (10, 1), (14, 1), (15, 2)],
  term ((332455022 : Rat) / 110226591) [(5, 2), (10, 1), (15, 2)],
  term ((-1827840 : Rat) / 12247399) [(5, 2), (11, 1), (12, 1), (13, 1)],
  term ((4569600 : Rat) / 12247399) [(5, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-61798400 : Rat) / 36742197) [(5, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((794140160 : Rat) / 330679773) [(5, 2), (11, 1), (12, 1), (15, 1)],
  term ((249717141013 : Rat) / 62829156870) [(5, 2), (11, 1), (13, 1)],
  term ((-228558400 : Rat) / 330679773) [(5, 2), (11, 1), (13, 1), (14, 1)],
  term ((-20157760 : Rat) / 36742197) [(5, 2), (11, 1), (13, 1), (14, 2)],
  term ((-44594240 : Rat) / 36742197) [(5, 2), (11, 1), (13, 1), (15, 2)],
  term ((2741760 : Rat) / 12247399) [(5, 2), (11, 1), (13, 2), (15, 1)],
  term ((8037829706 : Rat) / 330679773) [(5, 2), (11, 1), (14, 1), (15, 1)],
  term ((-218159360 : Rat) / 110226591) [(5, 2), (11, 1), (14, 2), (15, 1)],
  term ((-804320254952 : Rat) / 94243735305) [(5, 2), (11, 1), (15, 1)],
  term ((-159581440 : Rat) / 110226591) [(5, 2), (11, 1), (15, 3)],
  term ((-327965041376 : Rat) / 94243735305) [(5, 2), (11, 2)],
  term ((-38993920 : Rat) / 110226591) [(5, 2), (11, 2), (12, 1)],
  term ((97484800 : Rat) / 110226591) [(5, 2), (11, 2), (12, 1), (14, 1)],
  term ((19496960 : Rat) / 36742197) [(5, 2), (11, 2), (13, 1), (15, 1)],
  term ((-2536468480 : Rat) / 330679773) [(5, 2), (11, 2), (14, 1)],
  term ((716800 : Rat) / 231083) [(5, 2), (11, 2), (14, 2)],
  term ((293171200 : Rat) / 110226591) [(5, 2), (11, 2), (15, 2)],
  term ((54 : Rat) / 67) [(5, 2), (12, 1)],
  term ((-4569600 : Rat) / 12247399) [(5, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((10760120 : Rat) / 12247399) [(5, 2), (12, 1), (13, 1), (15, 1)],
  term ((-18 : Rat) / 67) [(5, 2), (12, 1), (14, 1)],
  term ((87910400 : Rat) / 110226591) [(5, 2), (12, 1), (14, 1), (15, 2)],
  term ((-532173298 : Rat) / 330679773) [(5, 2), (12, 1), (15, 2)],
  term ((1243742678 : Rat) / 330679773) [(5, 2), (13, 1), (14, 1), (15, 1)],
  term ((74217920 : Rat) / 36742197) [(5, 2), (13, 1), (14, 2), (15, 1)],
  term ((-6273188833 : Rat) / 661359546) [(5, 2), (13, 1), (15, 1)],
  term ((76274240 : Rat) / 36742197) [(5, 2), (13, 1), (15, 3)],
  term ((53466749 : Rat) / 24494798) [(5, 2), (13, 2)],
  term ((13148660 : Rat) / 12247399) [(5, 2), (13, 2), (14, 1)],
  term ((-9596160 : Rat) / 12247399) [(5, 2), (13, 2), (14, 2)],
  term ((-9596160 : Rat) / 12247399) [(5, 2), (13, 2), (15, 2)],
  term ((337 : Rat) / 67) [(5, 2), (14, 1)],
  term ((-496734160 : Rat) / 36742197) [(5, 2), (14, 1), (15, 2)],
  term ((-92 : Rat) / 67) [(5, 2), (14, 2)],
  term ((-81317120 : Rat) / 110226591) [(5, 2), (14, 2), (15, 2)],
  term ((5874810953 : Rat) / 661359546) [(5, 2), (15, 2)],
  term ((-94503680 : Rat) / 110226591) [(5, 2), (15, 4)],
  term ((328361908744 : Rat) / 10471526145) [(10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-9748480 : Rat) / 110226591) [(10, 1), (11, 1), (14, 1), (15, 3)],
  term ((-162328743172 : Rat) / 10471526145) [(10, 1), (11, 1), (14, 2), (15, 1)],
  term ((-9748480 : Rat) / 110226591) [(10, 1), (11, 1), (14, 3), (15, 1)],
  term ((-164180954372 : Rat) / 10471526145) [(10, 1), (11, 1), (15, 3)],
  term ((-357395842048 : Rat) / 10471526145) [(10, 1), (11, 2), (14, 1)],
  term ((178697921024 : Rat) / 10471526145) [(10, 1), (11, 2), (14, 2)],
  term ((178697921024 : Rat) / 10471526145) [(10, 1), (11, 2), (15, 2)],
  term ((9139200 : Rat) / 12247399) [(10, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-4569600 : Rat) / 12247399) [(10, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((-4569600 : Rat) / 12247399) [(10, 1), (12, 1), (13, 1), (15, 3)],
  term ((36 : Rat) / 67) [(10, 1), (12, 1), (14, 1)],
  term ((-175820800 : Rat) / 110226591) [(10, 1), (12, 1), (14, 1), (15, 2)],
  term ((-18 : Rat) / 67) [(10, 1), (12, 1), (14, 2)],
  term ((87910400 : Rat) / 110226591) [(10, 1), (12, 1), (14, 2), (15, 2)],
  term ((-18 : Rat) / 67) [(10, 1), (12, 1), (15, 2)],
  term ((87910400 : Rat) / 110226591) [(10, 1), (12, 1), (15, 4)],
  term ((-46163840 : Rat) / 110226591) [(10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-456960 : Rat) / 12247399) [(10, 1), (13, 1), (14, 1), (15, 3)],
  term ((31307200 : Rat) / 110226591) [(10, 1), (13, 1), (14, 2), (15, 1)],
  term ((-456960 : Rat) / 12247399) [(10, 1), (13, 1), (14, 3), (15, 1)],
  term ((23081920 : Rat) / 110226591) [(10, 1), (13, 1), (15, 3)],
  term ((-913920 : Rat) / 12247399) [(10, 1), (13, 2), (14, 1)],
  term ((456960 : Rat) / 12247399) [(10, 1), (13, 2), (14, 2)],
  term ((456960 : Rat) / 12247399) [(10, 1), (13, 2), (15, 2)],
  term ((674781082 : Rat) / 110226591) [(10, 1), (14, 1), (15, 2)],
  term ((8791040 : Rat) / 110226591) [(10, 1), (14, 1), (15, 4)],
  term ((-12 : Rat) / 67) [(10, 1), (14, 2)],
  term ((-116679034 : Rat) / 36742197) [(10, 1), (14, 2), (15, 2)],
  term ((6 : Rat) / 67) [(10, 1), (14, 3)],
  term ((8791040 : Rat) / 110226591) [(10, 1), (14, 3), (15, 2)],
  term ((-332455022 : Rat) / 110226591) [(10, 1), (15, 4)],
  term ((-3655680 : Rat) / 12247399) [(11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-4569600 : Rat) / 12247399) [(11, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((10967040 : Rat) / 12247399) [(11, 1), (12, 1), (13, 1), (14, 2)],
  term ((-4569600 : Rat) / 12247399) [(11, 1), (12, 1), (13, 1), (14, 3)],
  term ((1827840 : Rat) / 12247399) [(11, 1), (12, 1), (13, 1), (15, 2)],
  term ((1588280320 : Rat) / 330679773) [(11, 1), (12, 1), (14, 1), (15, 1)],
  term ((61798400 : Rat) / 36742197) [(11, 1), (12, 1), (14, 1), (15, 3)],
  term ((-1906511360 : Rat) / 330679773) [(11, 1), (12, 1), (14, 2), (15, 1)],
  term ((61798400 : Rat) / 36742197) [(11, 1), (12, 1), (14, 3), (15, 1)],
  term ((-794140160 : Rat) / 330679773) [(11, 1), (12, 1), (15, 3)],
  term ((249717141013 : Rat) / 31414578435) [(11, 1), (13, 1), (14, 1)],
  term ((-574137920 : Rat) / 330679773) [(11, 1), (13, 1), (14, 1), (15, 2)],
  term ((-37396592557 : Rat) / 6981017430) [(11, 1), (13, 1), (14, 2)],
  term ((21584000 : Rat) / 12247399) [(11, 1), (13, 1), (14, 2), (15, 2)],
  term ((-134281280 : Rat) / 330679773) [(11, 1), (13, 1), (14, 3)],
  term ((20157760 : Rat) / 36742197) [(11, 1), (13, 1), (14, 4)],
  term ((-249717141013 : Rat) / 62829156870) [(11, 1), (13, 1), (15, 2)],
  term ((44594240 : Rat) / 36742197) [(11, 1), (13, 1), (15, 4)],
  term ((5483520 : Rat) / 12247399) [(11, 1), (13, 2), (14, 1), (15, 1)],
  term ((-2741760 : Rat) / 12247399) [(11, 1), (13, 2), (14, 2), (15, 1)],
  term ((-2741760 : Rat) / 12247399) [(11, 1), (13, 2), (15, 3)],
  term ((-1608640509904 : Rat) / 94243735305) [(11, 1), (14, 1), (15, 1)],
  term ((-8995318346 : Rat) / 330679773) [(11, 1), (14, 1), (15, 3)],
  term ((5385883187372 : Rat) / 94243735305) [(11, 1), (14, 2), (15, 1)],
  term ((41971200 : Rat) / 12247399) [(11, 1), (14, 2), (15, 3)],
  term ((-9346785866 : Rat) / 330679773) [(11, 1), (14, 3), (15, 1)],
  term ((218159360 : Rat) / 110226591) [(11, 1), (14, 4), (15, 1)],
  term ((804320254952 : Rat) / 94243735305) [(11, 1), (15, 3)],
  term ((159581440 : Rat) / 110226591) [(11, 1), (15, 5)],
  term ((-77987840 : Rat) / 110226591) [(11, 2), (12, 1), (14, 1)],
  term ((-97484800 : Rat) / 110226591) [(11, 2), (12, 1), (14, 1), (15, 2)],
  term ((77987840 : Rat) / 36742197) [(11, 2), (12, 1), (14, 2)],
  term ((-97484800 : Rat) / 110226591) [(11, 2), (12, 1), (14, 3)],
  term ((38993920 : Rat) / 110226591) [(11, 2), (12, 1), (15, 2)],
  term ((38993920 : Rat) / 36742197) [(11, 2), (13, 1), (14, 1), (15, 1)],
  term ((-19496960 : Rat) / 36742197) [(11, 2), (13, 1), (14, 2), (15, 1)],
  term ((-19496960 : Rat) / 36742197) [(11, 2), (13, 1), (15, 3)],
  term ((-655930082752 : Rat) / 94243735305) [(11, 2), (14, 1)],
  term ((4295495680 : Rat) / 330679773) [(11, 2), (14, 1), (15, 2)],
  term ((-1117821992224 : Rat) / 94243735305) [(11, 2), (14, 2)],
  term ((-635084800 : Rat) / 110226591) [(11, 2), (14, 2), (15, 2)],
  term ((4587950080 : Rat) / 330679773) [(11, 2), (14, 3)],
  term ((-716800 : Rat) / 231083) [(11, 2), (14, 4)],
  term ((327965041376 : Rat) / 94243735305) [(11, 2), (15, 2)],
  term ((-293171200 : Rat) / 110226591) [(11, 2), (15, 4)],
  term ((21520240 : Rat) / 12247399) [(12, 1), (13, 1), (14, 1), (15, 1)],
  term ((4569600 : Rat) / 12247399) [(12, 1), (13, 1), (14, 1), (15, 3)],
  term ((-19899320 : Rat) / 12247399) [(12, 1), (13, 1), (14, 2), (15, 1)],
  term ((4569600 : Rat) / 12247399) [(12, 1), (13, 1), (14, 3), (15, 1)],
  term ((-10760120 : Rat) / 12247399) [(12, 1), (13, 1), (15, 3)],
  term ((108 : Rat) / 67) [(12, 1), (14, 1)],
  term ((-975507254 : Rat) / 330679773) [(12, 1), (14, 1), (15, 2)],
  term ((-87910400 : Rat) / 110226591) [(12, 1), (14, 1), (15, 4)],
  term ((-90 : Rat) / 67) [(12, 1), (14, 2)],
  term ((1059635698 : Rat) / 330679773) [(12, 1), (14, 2), (15, 2)],
  term ((18 : Rat) / 67) [(12, 1), (14, 3)],
  term ((-87910400 : Rat) / 110226591) [(12, 1), (14, 3), (15, 2)],
  term ((-54 : Rat) / 67) [(12, 1), (15, 2)],
  term ((532173298 : Rat) / 330679773) [(12, 1), (15, 4)],
  term ((-6273188833 : Rat) / 330679773) [(13, 1), (14, 1), (15, 1)],
  term ((129193642 : Rat) / 330679773) [(13, 1), (14, 1), (15, 3)],
  term ((1249795505 : Rat) / 73484394) [(13, 1), (14, 2), (15, 1)],
  term ((-150492160 : Rat) / 36742197) [(13, 1), (14, 2), (15, 3)],
  term ((92179882 : Rat) / 330679773) [(13, 1), (14, 3), (15, 1)],
  term ((-74217920 : Rat) / 36742197) [(13, 1), (14, 4), (15, 1)],
  term ((6273188833 : Rat) / 661359546) [(13, 1), (15, 3)],
  term ((-76274240 : Rat) / 36742197) [(13, 1), (15, 5)],
  term ((53466749 : Rat) / 12247399) [(13, 2), (14, 1)],
  term ((-32340980 : Rat) / 12247399) [(13, 2), (14, 1), (15, 2)],
  term ((-872109 : Rat) / 24494798) [(13, 2), (14, 2)],
  term ((19192320 : Rat) / 12247399) [(13, 2), (14, 2), (15, 2)],
  term ((-32340980 : Rat) / 12247399) [(13, 2), (14, 3)],
  term ((9596160 : Rat) / 12247399) [(13, 2), (14, 4)],
  term ((-53466749 : Rat) / 24494798) [(13, 2), (15, 2)],
  term ((9596160 : Rat) / 12247399) [(13, 2), (15, 4)],
  term ((4211541050 : Rat) / 330679773) [(14, 1), (15, 2)],
  term ((1301195120 : Rat) / 110226591) [(14, 1), (15, 4)],
  term ((674 : Rat) / 67) [(14, 2)],
  term ((-22849105217 : Rat) / 661359546) [(14, 2), (15, 2)],
  term ((175820800 : Rat) / 110226591) [(14, 2), (15, 4)],
  term ((-521 : Rat) / 67) [(14, 3)],
  term ((1327568240 : Rat) / 110226591) [(14, 3), (15, 2)],
  term ((92 : Rat) / 67) [(14, 4)],
  term ((81317120 : Rat) / 110226591) [(14, 4), (15, 2)],
  term ((-5874810953 : Rat) / 661359546) [(15, 4)],
  term ((94503680 : Rat) / 110226591) [(15, 6)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 5, terms 400 through 451. -/
theorem rs_R009_ueqv_R009NNNYN_block_05_0400_0451_valid :
    checkProductSumEq rs_R009_ueqv_R009NNNYN_partials_05_0400_0451
      rs_R009_ueqv_R009NNNYN_block_05_0400_0451 = true := by
  native_decide

end R009UeqvR009NNNYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
