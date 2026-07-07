/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NNNYN, term block 2:400-432

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NNNYNTermShards

/-- Generator polynomial 2 for relaxed split surplus certificate `R009:u=v:R009NNNYN`. -/
def rs_R009_ueqv_R009NNNYN_generator_02_0400_0432 : Poly :=
[
  term (1 : Rat) [(0, 2)],
  term (1 : Rat) [(1, 2)],
  term (-1 : Rat) [(10, 2)],
  term (-1 : Rat) [(11, 2)]
]

/-- Coefficient term 400 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNYN_coefficient_02_0400 : Poly :=
[
  term ((-3655680 : Rat) / 12247399) [(11, 1), (13, 2), (15, 1)]
]

/-- Partial product 400 for generator 2. -/
def rs_R009_ueqv_R009NNNYN_partial_02_0400 : Poly :=
[
  term ((-3655680 : Rat) / 12247399) [(0, 2), (11, 1), (13, 2), (15, 1)],
  term ((-3655680 : Rat) / 12247399) [(1, 2), (11, 1), (13, 2), (15, 1)],
  term ((3655680 : Rat) / 12247399) [(10, 2), (11, 1), (13, 2), (15, 1)],
  term ((3655680 : Rat) / 12247399) [(11, 3), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 400 for generator 2. -/
theorem rs_R009_ueqv_R009NNNYN_partial_02_0400_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_02_0400
        rs_R009_ueqv_R009NNNYN_generator_02_0400_0432 =
      rs_R009_ueqv_R009NNNYN_partial_02_0400 := by
  native_decide

/-- Coefficient term 401 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNYN_coefficient_02_0401 : Poly :=
[
  term ((-7563635786 : Rat) / 330679773) [(11, 1), (14, 1), (15, 1)]
]

/-- Partial product 401 for generator 2. -/
def rs_R009_ueqv_R009NNNYN_partial_02_0401 : Poly :=
[
  term ((-7563635786 : Rat) / 330679773) [(0, 2), (11, 1), (14, 1), (15, 1)],
  term ((-7563635786 : Rat) / 330679773) [(1, 2), (11, 1), (14, 1), (15, 1)],
  term ((7563635786 : Rat) / 330679773) [(10, 2), (11, 1), (14, 1), (15, 1)],
  term ((7563635786 : Rat) / 330679773) [(11, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 401 for generator 2. -/
theorem rs_R009_ueqv_R009NNNYN_partial_02_0401_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_02_0401
        rs_R009_ueqv_R009NNNYN_generator_02_0400_0432 =
      rs_R009_ueqv_R009NNNYN_partial_02_0401 := by
  native_decide

/-- Coefficient term 402 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNYN_coefficient_02_0402 : Poly :=
[
  term ((218159360 : Rat) / 110226591) [(11, 1), (14, 2), (15, 1)]
]

/-- Partial product 402 for generator 2. -/
def rs_R009_ueqv_R009NNNYN_partial_02_0402 : Poly :=
[
  term ((218159360 : Rat) / 110226591) [(0, 2), (11, 1), (14, 2), (15, 1)],
  term ((218159360 : Rat) / 110226591) [(1, 2), (11, 1), (14, 2), (15, 1)],
  term ((-218159360 : Rat) / 110226591) [(10, 2), (11, 1), (14, 2), (15, 1)],
  term ((-218159360 : Rat) / 110226591) [(11, 3), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 402 for generator 2. -/
theorem rs_R009_ueqv_R009NNNYN_partial_02_0402_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_02_0402
        rs_R009_ueqv_R009NNNYN_generator_02_0400_0432 =
      rs_R009_ueqv_R009NNNYN_partial_02_0402 := by
  native_decide

/-- Coefficient term 403 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNYN_coefficient_02_0403 : Poly :=
[
  term ((101211285097 : Rat) / 18848747061) [(11, 1), (15, 1)]
]

/-- Partial product 403 for generator 2. -/
def rs_R009_ueqv_R009NNNYN_partial_02_0403 : Poly :=
[
  term ((101211285097 : Rat) / 18848747061) [(0, 2), (11, 1), (15, 1)],
  term ((101211285097 : Rat) / 18848747061) [(1, 2), (11, 1), (15, 1)],
  term ((-101211285097 : Rat) / 18848747061) [(10, 2), (11, 1), (15, 1)],
  term ((-101211285097 : Rat) / 18848747061) [(11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 403 for generator 2. -/
theorem rs_R009_ueqv_R009NNNYN_partial_02_0403_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_02_0403
        rs_R009_ueqv_R009NNNYN_generator_02_0400_0432 =
      rs_R009_ueqv_R009NNNYN_partial_02_0403 := by
  native_decide

/-- Coefficient term 404 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNYN_coefficient_02_0404 : Poly :=
[
  term ((203536640 : Rat) / 110226591) [(11, 1), (15, 3)]
]

/-- Partial product 404 for generator 2. -/
def rs_R009_ueqv_R009NNNYN_partial_02_0404 : Poly :=
[
  term ((203536640 : Rat) / 110226591) [(0, 2), (11, 1), (15, 3)],
  term ((203536640 : Rat) / 110226591) [(1, 2), (11, 1), (15, 3)],
  term ((-203536640 : Rat) / 110226591) [(10, 2), (11, 1), (15, 3)],
  term ((-203536640 : Rat) / 110226591) [(11, 3), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 404 for generator 2. -/
theorem rs_R009_ueqv_R009NNNYN_partial_02_0404_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_02_0404
        rs_R009_ueqv_R009NNNYN_generator_02_0400_0432 =
      rs_R009_ueqv_R009NNNYN_partial_02_0404 := by
  native_decide

/-- Coefficient term 405 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNYN_coefficient_02_0405 : Poly :=
[
  term ((-235252836440 : Rat) / 18848747061) [(11, 2)]
]

/-- Partial product 405 for generator 2. -/
def rs_R009_ueqv_R009NNNYN_partial_02_0405 : Poly :=
[
  term ((-235252836440 : Rat) / 18848747061) [(0, 2), (11, 2)],
  term ((-235252836440 : Rat) / 18848747061) [(1, 2), (11, 2)],
  term ((235252836440 : Rat) / 18848747061) [(10, 2), (11, 2)],
  term ((235252836440 : Rat) / 18848747061) [(11, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 405 for generator 2. -/
theorem rs_R009_ueqv_R009NNNYN_partial_02_0405_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_02_0405
        rs_R009_ueqv_R009NNNYN_generator_02_0400_0432 =
      rs_R009_ueqv_R009NNNYN_partial_02_0405 := by
  native_decide

/-- Coefficient term 406 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNYN_coefficient_02_0406 : Poly :=
[
  term ((77987840 : Rat) / 110226591) [(11, 2), (12, 1)]
]

/-- Partial product 406 for generator 2. -/
def rs_R009_ueqv_R009NNNYN_partial_02_0406 : Poly :=
[
  term ((77987840 : Rat) / 110226591) [(0, 2), (11, 2), (12, 1)],
  term ((77987840 : Rat) / 110226591) [(1, 2), (11, 2), (12, 1)],
  term ((-77987840 : Rat) / 110226591) [(10, 2), (11, 2), (12, 1)],
  term ((-77987840 : Rat) / 110226591) [(11, 4), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 406 for generator 2. -/
theorem rs_R009_ueqv_R009NNNYN_partial_02_0406_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_02_0406
        rs_R009_ueqv_R009NNNYN_generator_02_0400_0432 =
      rs_R009_ueqv_R009NNNYN_partial_02_0406 := by
  native_decide

/-- Coefficient term 407 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNYN_coefficient_02_0407 : Poly :=
[
  term ((-97484800 : Rat) / 110226591) [(11, 2), (12, 1), (14, 1)]
]

/-- Partial product 407 for generator 2. -/
def rs_R009_ueqv_R009NNNYN_partial_02_0407 : Poly :=
[
  term ((-97484800 : Rat) / 110226591) [(0, 2), (11, 2), (12, 1), (14, 1)],
  term ((-97484800 : Rat) / 110226591) [(1, 2), (11, 2), (12, 1), (14, 1)],
  term ((97484800 : Rat) / 110226591) [(10, 2), (11, 2), (12, 1), (14, 1)],
  term ((97484800 : Rat) / 110226591) [(11, 4), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 407 for generator 2. -/
theorem rs_R009_ueqv_R009NNNYN_partial_02_0407_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_02_0407
        rs_R009_ueqv_R009NNNYN_generator_02_0400_0432 =
      rs_R009_ueqv_R009NNNYN_partial_02_0407 := by
  native_decide

/-- Coefficient term 408 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNYN_coefficient_02_0408 : Poly :=
[
  term ((4264960 : Rat) / 110226591) [(11, 2), (13, 1), (15, 1)]
]

/-- Partial product 408 for generator 2. -/
def rs_R009_ueqv_R009NNNYN_partial_02_0408 : Poly :=
[
  term ((4264960 : Rat) / 110226591) [(0, 2), (11, 2), (13, 1), (15, 1)],
  term ((4264960 : Rat) / 110226591) [(1, 2), (11, 2), (13, 1), (15, 1)],
  term ((-4264960 : Rat) / 110226591) [(10, 2), (11, 2), (13, 1), (15, 1)],
  term ((-4264960 : Rat) / 110226591) [(11, 4), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 408 for generator 2. -/
theorem rs_R009_ueqv_R009NNNYN_partial_02_0408_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_02_0408
        rs_R009_ueqv_R009NNNYN_generator_02_0400_0432 =
      rs_R009_ueqv_R009NNNYN_partial_02_0408 := by
  native_decide

/-- Coefficient term 409 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNYN_coefficient_02_0409 : Poly :=
[
  term ((2302504960 : Rat) / 330679773) [(11, 2), (14, 1)]
]

/-- Partial product 409 for generator 2. -/
def rs_R009_ueqv_R009NNNYN_partial_02_0409 : Poly :=
[
  term ((2302504960 : Rat) / 330679773) [(0, 2), (11, 2), (14, 1)],
  term ((2302504960 : Rat) / 330679773) [(1, 2), (11, 2), (14, 1)],
  term ((-2302504960 : Rat) / 330679773) [(10, 2), (11, 2), (14, 1)],
  term ((-2302504960 : Rat) / 330679773) [(11, 4), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 409 for generator 2. -/
theorem rs_R009_ueqv_R009NNNYN_partial_02_0409_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_02_0409
        rs_R009_ueqv_R009NNNYN_generator_02_0400_0432 =
      rs_R009_ueqv_R009NNNYN_partial_02_0409 := by
  native_decide

/-- Coefficient term 410 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNYN_coefficient_02_0410 : Poly :=
[
  term ((-716800 : Rat) / 231083) [(11, 2), (14, 2)]
]

/-- Partial product 410 for generator 2. -/
def rs_R009_ueqv_R009NNNYN_partial_02_0410 : Poly :=
[
  term ((-716800 : Rat) / 231083) [(0, 2), (11, 2), (14, 2)],
  term ((-716800 : Rat) / 231083) [(1, 2), (11, 2), (14, 2)],
  term ((716800 : Rat) / 231083) [(10, 2), (11, 2), (14, 2)],
  term ((716800 : Rat) / 231083) [(11, 4), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 410 for generator 2. -/
theorem rs_R009_ueqv_R009NNNYN_partial_02_0410_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_02_0410
        rs_R009_ueqv_R009NNNYN_generator_02_0400_0432 =
      rs_R009_ueqv_R009NNNYN_partial_02_0410 := by
  native_decide

/-- Coefficient term 411 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNYN_coefficient_02_0411 : Poly :=
[
  term ((-517734400 : Rat) / 110226591) [(11, 2), (15, 2)]
]

/-- Partial product 411 for generator 2. -/
def rs_R009_ueqv_R009NNNYN_partial_02_0411 : Poly :=
[
  term ((-517734400 : Rat) / 110226591) [(0, 2), (11, 2), (15, 2)],
  term ((-517734400 : Rat) / 110226591) [(1, 2), (11, 2), (15, 2)],
  term ((517734400 : Rat) / 110226591) [(10, 2), (11, 2), (15, 2)],
  term ((517734400 : Rat) / 110226591) [(11, 4), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 411 for generator 2. -/
theorem rs_R009_ueqv_R009NNNYN_partial_02_0411_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_02_0411
        rs_R009_ueqv_R009NNNYN_generator_02_0400_0432 =
      rs_R009_ueqv_R009NNNYN_partial_02_0411 := by
  native_decide

/-- Coefficient term 412 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNYN_coefficient_02_0412 : Poly :=
[
  term ((194969600 : Rat) / 110226591) [(11, 3), (15, 1)]
]

/-- Partial product 412 for generator 2. -/
def rs_R009_ueqv_R009NNNYN_partial_02_0412 : Poly :=
[
  term ((194969600 : Rat) / 110226591) [(0, 2), (11, 3), (15, 1)],
  term ((194969600 : Rat) / 110226591) [(1, 2), (11, 3), (15, 1)],
  term ((-194969600 : Rat) / 110226591) [(10, 2), (11, 3), (15, 1)],
  term ((-194969600 : Rat) / 110226591) [(11, 5), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 412 for generator 2. -/
theorem rs_R009_ueqv_R009NNNYN_partial_02_0412_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_02_0412
        rs_R009_ueqv_R009NNNYN_generator_02_0400_0432 =
      rs_R009_ueqv_R009NNNYN_partial_02_0412 := by
  native_decide

/-- Coefficient term 413 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNYN_coefficient_02_0413 : Poly :=
[
  term ((-18 : Rat) / 67) [(12, 1)]
]

/-- Partial product 413 for generator 2. -/
def rs_R009_ueqv_R009NNNYN_partial_02_0413 : Poly :=
[
  term ((-18 : Rat) / 67) [(0, 2), (12, 1)],
  term ((-18 : Rat) / 67) [(1, 2), (12, 1)],
  term ((18 : Rat) / 67) [(10, 2), (12, 1)],
  term ((18 : Rat) / 67) [(11, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 413 for generator 2. -/
theorem rs_R009_ueqv_R009NNNYN_partial_02_0413_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_02_0413
        rs_R009_ueqv_R009NNNYN_generator_02_0400_0432 =
      rs_R009_ueqv_R009NNNYN_partial_02_0413 := by
  native_decide

/-- Coefficient term 414 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNYN_coefficient_02_0414 : Poly :=
[
  term ((4569600 : Rat) / 12247399) [(12, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 414 for generator 2. -/
def rs_R009_ueqv_R009NNNYN_partial_02_0414 : Poly :=
[
  term ((4569600 : Rat) / 12247399) [(0, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((4569600 : Rat) / 12247399) [(1, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-4569600 : Rat) / 12247399) [(10, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-4569600 : Rat) / 12247399) [(11, 2), (12, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 414 for generator 2. -/
theorem rs_R009_ueqv_R009NNNYN_partial_02_0414_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_02_0414
        rs_R009_ueqv_R009NNNYN_generator_02_0400_0432 =
      rs_R009_ueqv_R009NNNYN_partial_02_0414 := by
  native_decide

/-- Coefficient term 415 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNYN_coefficient_02_0415 : Poly :=
[
  term ((-15056440 : Rat) / 12247399) [(12, 1), (13, 1), (15, 1)]
]

/-- Partial product 415 for generator 2. -/
def rs_R009_ueqv_R009NNNYN_partial_02_0415 : Poly :=
[
  term ((-15056440 : Rat) / 12247399) [(0, 2), (12, 1), (13, 1), (15, 1)],
  term ((-15056440 : Rat) / 12247399) [(1, 2), (12, 1), (13, 1), (15, 1)],
  term ((15056440 : Rat) / 12247399) [(10, 2), (12, 1), (13, 1), (15, 1)],
  term ((15056440 : Rat) / 12247399) [(11, 2), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 415 for generator 2. -/
theorem rs_R009_ueqv_R009NNNYN_partial_02_0415_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_02_0415
        rs_R009_ueqv_R009NNNYN_generator_02_0400_0432 =
      rs_R009_ueqv_R009NNNYN_partial_02_0415 := by
  native_decide

/-- Coefficient term 416 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNYN_coefficient_02_0416 : Poly :=
[
  term ((18 : Rat) / 67) [(12, 1), (14, 1)]
]

/-- Partial product 416 for generator 2. -/
def rs_R009_ueqv_R009NNNYN_partial_02_0416 : Poly :=
[
  term ((18 : Rat) / 67) [(0, 2), (12, 1), (14, 1)],
  term ((18 : Rat) / 67) [(1, 2), (12, 1), (14, 1)],
  term ((-18 : Rat) / 67) [(10, 2), (12, 1), (14, 1)],
  term ((-18 : Rat) / 67) [(11, 2), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 416 for generator 2. -/
theorem rs_R009_ueqv_R009NNNYN_partial_02_0416_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_02_0416
        rs_R009_ueqv_R009NNNYN_generator_02_0400_0432 =
      rs_R009_ueqv_R009NNNYN_partial_02_0416 := by
  native_decide

/-- Coefficient term 417 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNYN_coefficient_02_0417 : Poly :=
[
  term ((-87910400 : Rat) / 110226591) [(12, 1), (14, 1), (15, 2)]
]

/-- Partial product 417 for generator 2. -/
def rs_R009_ueqv_R009NNNYN_partial_02_0417 : Poly :=
[
  term ((-87910400 : Rat) / 110226591) [(0, 2), (12, 1), (14, 1), (15, 2)],
  term ((-87910400 : Rat) / 110226591) [(1, 2), (12, 1), (14, 1), (15, 2)],
  term ((87910400 : Rat) / 110226591) [(10, 2), (12, 1), (14, 1), (15, 2)],
  term ((87910400 : Rat) / 110226591) [(11, 2), (12, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 417 for generator 2. -/
theorem rs_R009_ueqv_R009NNNYN_partial_02_0417_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_02_0417
        rs_R009_ueqv_R009NNNYN_generator_02_0400_0432 =
      rs_R009_ueqv_R009NNNYN_partial_02_0417 := by
  native_decide

/-- Coefficient term 418 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNYN_coefficient_02_0418 : Poly :=
[
  term ((780132338 : Rat) / 330679773) [(12, 1), (15, 2)]
]

/-- Partial product 418 for generator 2. -/
def rs_R009_ueqv_R009NNNYN_partial_02_0418 : Poly :=
[
  term ((780132338 : Rat) / 330679773) [(0, 2), (12, 1), (15, 2)],
  term ((780132338 : Rat) / 330679773) [(1, 2), (12, 1), (15, 2)],
  term ((-780132338 : Rat) / 330679773) [(10, 2), (12, 1), (15, 2)],
  term ((-780132338 : Rat) / 330679773) [(11, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 418 for generator 2. -/
theorem rs_R009_ueqv_R009NNNYN_partial_02_0418_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_02_0418
        rs_R009_ueqv_R009NNNYN_generator_02_0400_0432 =
      rs_R009_ueqv_R009NNNYN_partial_02_0418 := by
  native_decide

/-- Coefficient term 419 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNYN_coefficient_02_0419 : Poly :=
[
  term ((-173919142 : Rat) / 36742197) [(13, 1), (14, 1), (15, 1)]
]

/-- Partial product 419 for generator 2. -/
def rs_R009_ueqv_R009NNNYN_partial_02_0419 : Poly :=
[
  term ((-173919142 : Rat) / 36742197) [(0, 2), (13, 1), (14, 1), (15, 1)],
  term ((-173919142 : Rat) / 36742197) [(1, 2), (13, 1), (14, 1), (15, 1)],
  term ((173919142 : Rat) / 36742197) [(10, 2), (13, 1), (14, 1), (15, 1)],
  term ((173919142 : Rat) / 36742197) [(11, 2), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 419 for generator 2. -/
theorem rs_R009_ueqv_R009NNNYN_partial_02_0419_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_02_0419
        rs_R009_ueqv_R009NNNYN_generator_02_0400_0432 =
      rs_R009_ueqv_R009NNNYN_partial_02_0419 := by
  native_decide

/-- Coefficient term 420 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNYN_coefficient_02_0420 : Poly :=
[
  term ((-74217920 : Rat) / 36742197) [(13, 1), (14, 2), (15, 1)]
]

/-- Partial product 420 for generator 2. -/
def rs_R009_ueqv_R009NNNYN_partial_02_0420 : Poly :=
[
  term ((-74217920 : Rat) / 36742197) [(0, 2), (13, 1), (14, 2), (15, 1)],
  term ((-74217920 : Rat) / 36742197) [(1, 2), (13, 1), (14, 2), (15, 1)],
  term ((74217920 : Rat) / 36742197) [(10, 2), (13, 1), (14, 2), (15, 1)],
  term ((74217920 : Rat) / 36742197) [(11, 2), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 420 for generator 2. -/
theorem rs_R009_ueqv_R009NNNYN_partial_02_0420_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_02_0420
        rs_R009_ueqv_R009NNNYN_generator_02_0400_0432 =
      rs_R009_ueqv_R009NNNYN_partial_02_0420 := by
  native_decide

/-- Coefficient term 421 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNYN_coefficient_02_0421 : Poly :=
[
  term ((-523972417 : Rat) / 220453182) [(13, 1), (15, 1)]
]

/-- Partial product 421 for generator 2. -/
def rs_R009_ueqv_R009NNNYN_partial_02_0421 : Poly :=
[
  term ((-523972417 : Rat) / 220453182) [(0, 2), (13, 1), (15, 1)],
  term ((-523972417 : Rat) / 220453182) [(1, 2), (13, 1), (15, 1)],
  term ((523972417 : Rat) / 220453182) [(10, 2), (13, 1), (15, 1)],
  term ((523972417 : Rat) / 220453182) [(11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 421 for generator 2. -/
theorem rs_R009_ueqv_R009NNNYN_partial_02_0421_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_02_0421
        rs_R009_ueqv_R009NNNYN_generator_02_0400_0432 =
      rs_R009_ueqv_R009NNNYN_partial_02_0421 := by
  native_decide

/-- Coefficient term 422 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNYN_coefficient_02_0422 : Poly :=
[
  term ((-76274240 : Rat) / 36742197) [(13, 1), (15, 3)]
]

/-- Partial product 422 for generator 2. -/
def rs_R009_ueqv_R009NNNYN_partial_02_0422 : Poly :=
[
  term ((-76274240 : Rat) / 36742197) [(0, 2), (13, 1), (15, 3)],
  term ((-76274240 : Rat) / 36742197) [(1, 2), (13, 1), (15, 3)],
  term ((76274240 : Rat) / 36742197) [(10, 2), (13, 1), (15, 3)],
  term ((76274240 : Rat) / 36742197) [(11, 2), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 422 for generator 2. -/
theorem rs_R009_ueqv_R009NNNYN_partial_02_0422_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_02_0422
        rs_R009_ueqv_R009NNNYN_generator_02_0400_0432 =
      rs_R009_ueqv_R009NNNYN_partial_02_0422 := by
  native_decide

/-- Coefficient term 423 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNYN_coefficient_02_0423 : Poly :=
[
  term ((8893311 : Rat) / 24494798) [(13, 2)]
]

/-- Partial product 423 for generator 2. -/
def rs_R009_ueqv_R009NNNYN_partial_02_0423 : Poly :=
[
  term ((8893311 : Rat) / 24494798) [(0, 2), (13, 2)],
  term ((8893311 : Rat) / 24494798) [(1, 2), (13, 2)],
  term ((-8893311 : Rat) / 24494798) [(10, 2), (13, 2)],
  term ((-8893311 : Rat) / 24494798) [(11, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 423 for generator 2. -/
theorem rs_R009_ueqv_R009NNNYN_partial_02_0423_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_02_0423
        rs_R009_ueqv_R009NNNYN_generator_02_0400_0432 =
      rs_R009_ueqv_R009NNNYN_partial_02_0423 := by
  native_decide

/-- Coefficient term 424 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNYN_coefficient_02_0424 : Poly :=
[
  term ((-5653620 : Rat) / 12247399) [(13, 2), (14, 1)]
]

/-- Partial product 424 for generator 2. -/
def rs_R009_ueqv_R009NNNYN_partial_02_0424 : Poly :=
[
  term ((-5653620 : Rat) / 12247399) [(0, 2), (13, 2), (14, 1)],
  term ((-5653620 : Rat) / 12247399) [(1, 2), (13, 2), (14, 1)],
  term ((5653620 : Rat) / 12247399) [(10, 2), (13, 2), (14, 1)],
  term ((5653620 : Rat) / 12247399) [(11, 2), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 424 for generator 2. -/
theorem rs_R009_ueqv_R009NNNYN_partial_02_0424_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_02_0424
        rs_R009_ueqv_R009NNNYN_generator_02_0400_0432 =
      rs_R009_ueqv_R009NNNYN_partial_02_0424 := by
  native_decide

/-- Coefficient term 425 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNYN_coefficient_02_0425 : Poly :=
[
  term ((9596160 : Rat) / 12247399) [(13, 2), (14, 2)]
]

/-- Partial product 425 for generator 2. -/
def rs_R009_ueqv_R009NNNYN_partial_02_0425 : Poly :=
[
  term ((9596160 : Rat) / 12247399) [(0, 2), (13, 2), (14, 2)],
  term ((9596160 : Rat) / 12247399) [(1, 2), (13, 2), (14, 2)],
  term ((-9596160 : Rat) / 12247399) [(10, 2), (13, 2), (14, 2)],
  term ((-9596160 : Rat) / 12247399) [(11, 2), (13, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 425 for generator 2. -/
theorem rs_R009_ueqv_R009NNNYN_partial_02_0425_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_02_0425
        rs_R009_ueqv_R009NNNYN_generator_02_0400_0432 =
      rs_R009_ueqv_R009NNNYN_partial_02_0425 := by
  native_decide

/-- Coefficient term 426 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNYN_coefficient_02_0426 : Poly :=
[
  term ((9596160 : Rat) / 12247399) [(13, 2), (15, 2)]
]

/-- Partial product 426 for generator 2. -/
def rs_R009_ueqv_R009NNNYN_partial_02_0426 : Poly :=
[
  term ((9596160 : Rat) / 12247399) [(0, 2), (13, 2), (15, 2)],
  term ((9596160 : Rat) / 12247399) [(1, 2), (13, 2), (15, 2)],
  term ((-9596160 : Rat) / 12247399) [(10, 2), (13, 2), (15, 2)],
  term ((-9596160 : Rat) / 12247399) [(11, 2), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 426 for generator 2. -/
theorem rs_R009_ueqv_R009NNNYN_partial_02_0426_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_02_0426
        rs_R009_ueqv_R009NNNYN_generator_02_0400_0432 =
      rs_R009_ueqv_R009NNNYN_partial_02_0426 := by
  native_decide

/-- Coefficient term 427 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNYN_coefficient_02_0427 : Poly :=
[
  term ((-266 : Rat) / 67) [(14, 1)]
]

/-- Partial product 427 for generator 2. -/
def rs_R009_ueqv_R009NNNYN_partial_02_0427 : Poly :=
[
  term ((-266 : Rat) / 67) [(0, 2), (14, 1)],
  term ((-266 : Rat) / 67) [(1, 2), (14, 1)],
  term ((266 : Rat) / 67) [(10, 2), (14, 1)],
  term ((266 : Rat) / 67) [(11, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 427 for generator 2. -/
theorem rs_R009_ueqv_R009NNNYN_partial_02_0427_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_02_0427
        rs_R009_ueqv_R009NNNYN_generator_02_0400_0432 =
      rs_R009_ueqv_R009NNNYN_partial_02_0427 := by
  native_decide

/-- Coefficient term 428 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNYN_coefficient_02_0428 : Poly :=
[
  term ((470361040 : Rat) / 36742197) [(14, 1), (15, 2)]
]

/-- Partial product 428 for generator 2. -/
def rs_R009_ueqv_R009NNNYN_partial_02_0428 : Poly :=
[
  term ((470361040 : Rat) / 36742197) [(0, 2), (14, 1), (15, 2)],
  term ((470361040 : Rat) / 36742197) [(1, 2), (14, 1), (15, 2)],
  term ((-470361040 : Rat) / 36742197) [(10, 2), (14, 1), (15, 2)],
  term ((-470361040 : Rat) / 36742197) [(11, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 428 for generator 2. -/
theorem rs_R009_ueqv_R009NNNYN_partial_02_0428_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_02_0428
        rs_R009_ueqv_R009NNNYN_generator_02_0400_0432 =
      rs_R009_ueqv_R009NNNYN_partial_02_0428 := by
  native_decide

/-- Coefficient term 429 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNYN_coefficient_02_0429 : Poly :=
[
  term ((92 : Rat) / 67) [(14, 2)]
]

/-- Partial product 429 for generator 2. -/
def rs_R009_ueqv_R009NNNYN_partial_02_0429 : Poly :=
[
  term ((92 : Rat) / 67) [(0, 2), (14, 2)],
  term ((92 : Rat) / 67) [(1, 2), (14, 2)],
  term ((-92 : Rat) / 67) [(10, 2), (14, 2)],
  term ((-92 : Rat) / 67) [(11, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 429 for generator 2. -/
theorem rs_R009_ueqv_R009NNNYN_partial_02_0429_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_02_0429
        rs_R009_ueqv_R009NNNYN_generator_02_0400_0432 =
      rs_R009_ueqv_R009NNNYN_partial_02_0429 := by
  native_decide

/-- Coefficient term 430 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNYN_coefficient_02_0430 : Poly :=
[
  term ((81317120 : Rat) / 110226591) [(14, 2), (15, 2)]
]

/-- Partial product 430 for generator 2. -/
def rs_R009_ueqv_R009NNNYN_partial_02_0430 : Poly :=
[
  term ((81317120 : Rat) / 110226591) [(0, 2), (14, 2), (15, 2)],
  term ((81317120 : Rat) / 110226591) [(1, 2), (14, 2), (15, 2)],
  term ((-81317120 : Rat) / 110226591) [(10, 2), (14, 2), (15, 2)],
  term ((-81317120 : Rat) / 110226591) [(11, 2), (14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 430 for generator 2. -/
theorem rs_R009_ueqv_R009NNNYN_partial_02_0430_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_02_0430
        rs_R009_ueqv_R009NNNYN_generator_02_0400_0432 =
      rs_R009_ueqv_R009NNNYN_partial_02_0430 := by
  native_decide

/-- Coefficient term 431 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNYN_coefficient_02_0431 : Poly :=
[
  term ((1074406201 : Rat) / 661359546) [(15, 2)]
]

/-- Partial product 431 for generator 2. -/
def rs_R009_ueqv_R009NNNYN_partial_02_0431 : Poly :=
[
  term ((1074406201 : Rat) / 661359546) [(0, 2), (15, 2)],
  term ((1074406201 : Rat) / 661359546) [(1, 2), (15, 2)],
  term ((-1074406201 : Rat) / 661359546) [(10, 2), (15, 2)],
  term ((-1074406201 : Rat) / 661359546) [(11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 431 for generator 2. -/
theorem rs_R009_ueqv_R009NNNYN_partial_02_0431_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_02_0431
        rs_R009_ueqv_R009NNNYN_generator_02_0400_0432 =
      rs_R009_ueqv_R009NNNYN_partial_02_0431 := by
  native_decide

/-- Coefficient term 432 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNYN_coefficient_02_0432 : Poly :=
[
  term ((94503680 : Rat) / 110226591) [(15, 4)]
]

/-- Partial product 432 for generator 2. -/
def rs_R009_ueqv_R009NNNYN_partial_02_0432 : Poly :=
[
  term ((94503680 : Rat) / 110226591) [(0, 2), (15, 4)],
  term ((94503680 : Rat) / 110226591) [(1, 2), (15, 4)],
  term ((-94503680 : Rat) / 110226591) [(10, 2), (15, 4)],
  term ((-94503680 : Rat) / 110226591) [(11, 2), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 432 for generator 2. -/
theorem rs_R009_ueqv_R009NNNYN_partial_02_0432_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_02_0432
        rs_R009_ueqv_R009NNNYN_generator_02_0400_0432 =
      rs_R009_ueqv_R009NNNYN_partial_02_0432 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NNNYN_partials_02_0400_0432 : List Poly :=
[
  rs_R009_ueqv_R009NNNYN_partial_02_0400,
  rs_R009_ueqv_R009NNNYN_partial_02_0401,
  rs_R009_ueqv_R009NNNYN_partial_02_0402,
  rs_R009_ueqv_R009NNNYN_partial_02_0403,
  rs_R009_ueqv_R009NNNYN_partial_02_0404,
  rs_R009_ueqv_R009NNNYN_partial_02_0405,
  rs_R009_ueqv_R009NNNYN_partial_02_0406,
  rs_R009_ueqv_R009NNNYN_partial_02_0407,
  rs_R009_ueqv_R009NNNYN_partial_02_0408,
  rs_R009_ueqv_R009NNNYN_partial_02_0409,
  rs_R009_ueqv_R009NNNYN_partial_02_0410,
  rs_R009_ueqv_R009NNNYN_partial_02_0411,
  rs_R009_ueqv_R009NNNYN_partial_02_0412,
  rs_R009_ueqv_R009NNNYN_partial_02_0413,
  rs_R009_ueqv_R009NNNYN_partial_02_0414,
  rs_R009_ueqv_R009NNNYN_partial_02_0415,
  rs_R009_ueqv_R009NNNYN_partial_02_0416,
  rs_R009_ueqv_R009NNNYN_partial_02_0417,
  rs_R009_ueqv_R009NNNYN_partial_02_0418,
  rs_R009_ueqv_R009NNNYN_partial_02_0419,
  rs_R009_ueqv_R009NNNYN_partial_02_0420,
  rs_R009_ueqv_R009NNNYN_partial_02_0421,
  rs_R009_ueqv_R009NNNYN_partial_02_0422,
  rs_R009_ueqv_R009NNNYN_partial_02_0423,
  rs_R009_ueqv_R009NNNYN_partial_02_0424,
  rs_R009_ueqv_R009NNNYN_partial_02_0425,
  rs_R009_ueqv_R009NNNYN_partial_02_0426,
  rs_R009_ueqv_R009NNNYN_partial_02_0427,
  rs_R009_ueqv_R009NNNYN_partial_02_0428,
  rs_R009_ueqv_R009NNNYN_partial_02_0429,
  rs_R009_ueqv_R009NNNYN_partial_02_0430,
  rs_R009_ueqv_R009NNNYN_partial_02_0431,
  rs_R009_ueqv_R009NNNYN_partial_02_0432
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NNNYN_block_02_0400_0432 : Poly :=
[
  term ((-3655680 : Rat) / 12247399) [(0, 2), (11, 1), (13, 2), (15, 1)],
  term ((-7563635786 : Rat) / 330679773) [(0, 2), (11, 1), (14, 1), (15, 1)],
  term ((218159360 : Rat) / 110226591) [(0, 2), (11, 1), (14, 2), (15, 1)],
  term ((101211285097 : Rat) / 18848747061) [(0, 2), (11, 1), (15, 1)],
  term ((203536640 : Rat) / 110226591) [(0, 2), (11, 1), (15, 3)],
  term ((-235252836440 : Rat) / 18848747061) [(0, 2), (11, 2)],
  term ((77987840 : Rat) / 110226591) [(0, 2), (11, 2), (12, 1)],
  term ((-97484800 : Rat) / 110226591) [(0, 2), (11, 2), (12, 1), (14, 1)],
  term ((4264960 : Rat) / 110226591) [(0, 2), (11, 2), (13, 1), (15, 1)],
  term ((2302504960 : Rat) / 330679773) [(0, 2), (11, 2), (14, 1)],
  term ((-716800 : Rat) / 231083) [(0, 2), (11, 2), (14, 2)],
  term ((-517734400 : Rat) / 110226591) [(0, 2), (11, 2), (15, 2)],
  term ((194969600 : Rat) / 110226591) [(0, 2), (11, 3), (15, 1)],
  term ((-18 : Rat) / 67) [(0, 2), (12, 1)],
  term ((4569600 : Rat) / 12247399) [(0, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-15056440 : Rat) / 12247399) [(0, 2), (12, 1), (13, 1), (15, 1)],
  term ((18 : Rat) / 67) [(0, 2), (12, 1), (14, 1)],
  term ((-87910400 : Rat) / 110226591) [(0, 2), (12, 1), (14, 1), (15, 2)],
  term ((780132338 : Rat) / 330679773) [(0, 2), (12, 1), (15, 2)],
  term ((-173919142 : Rat) / 36742197) [(0, 2), (13, 1), (14, 1), (15, 1)],
  term ((-74217920 : Rat) / 36742197) [(0, 2), (13, 1), (14, 2), (15, 1)],
  term ((-523972417 : Rat) / 220453182) [(0, 2), (13, 1), (15, 1)],
  term ((-76274240 : Rat) / 36742197) [(0, 2), (13, 1), (15, 3)],
  term ((8893311 : Rat) / 24494798) [(0, 2), (13, 2)],
  term ((-5653620 : Rat) / 12247399) [(0, 2), (13, 2), (14, 1)],
  term ((9596160 : Rat) / 12247399) [(0, 2), (13, 2), (14, 2)],
  term ((9596160 : Rat) / 12247399) [(0, 2), (13, 2), (15, 2)],
  term ((-266 : Rat) / 67) [(0, 2), (14, 1)],
  term ((470361040 : Rat) / 36742197) [(0, 2), (14, 1), (15, 2)],
  term ((92 : Rat) / 67) [(0, 2), (14, 2)],
  term ((81317120 : Rat) / 110226591) [(0, 2), (14, 2), (15, 2)],
  term ((1074406201 : Rat) / 661359546) [(0, 2), (15, 2)],
  term ((94503680 : Rat) / 110226591) [(0, 2), (15, 4)],
  term ((-3655680 : Rat) / 12247399) [(1, 2), (11, 1), (13, 2), (15, 1)],
  term ((-7563635786 : Rat) / 330679773) [(1, 2), (11, 1), (14, 1), (15, 1)],
  term ((218159360 : Rat) / 110226591) [(1, 2), (11, 1), (14, 2), (15, 1)],
  term ((101211285097 : Rat) / 18848747061) [(1, 2), (11, 1), (15, 1)],
  term ((203536640 : Rat) / 110226591) [(1, 2), (11, 1), (15, 3)],
  term ((-235252836440 : Rat) / 18848747061) [(1, 2), (11, 2)],
  term ((77987840 : Rat) / 110226591) [(1, 2), (11, 2), (12, 1)],
  term ((-97484800 : Rat) / 110226591) [(1, 2), (11, 2), (12, 1), (14, 1)],
  term ((4264960 : Rat) / 110226591) [(1, 2), (11, 2), (13, 1), (15, 1)],
  term ((2302504960 : Rat) / 330679773) [(1, 2), (11, 2), (14, 1)],
  term ((-716800 : Rat) / 231083) [(1, 2), (11, 2), (14, 2)],
  term ((-517734400 : Rat) / 110226591) [(1, 2), (11, 2), (15, 2)],
  term ((194969600 : Rat) / 110226591) [(1, 2), (11, 3), (15, 1)],
  term ((-18 : Rat) / 67) [(1, 2), (12, 1)],
  term ((4569600 : Rat) / 12247399) [(1, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-15056440 : Rat) / 12247399) [(1, 2), (12, 1), (13, 1), (15, 1)],
  term ((18 : Rat) / 67) [(1, 2), (12, 1), (14, 1)],
  term ((-87910400 : Rat) / 110226591) [(1, 2), (12, 1), (14, 1), (15, 2)],
  term ((780132338 : Rat) / 330679773) [(1, 2), (12, 1), (15, 2)],
  term ((-173919142 : Rat) / 36742197) [(1, 2), (13, 1), (14, 1), (15, 1)],
  term ((-74217920 : Rat) / 36742197) [(1, 2), (13, 1), (14, 2), (15, 1)],
  term ((-523972417 : Rat) / 220453182) [(1, 2), (13, 1), (15, 1)],
  term ((-76274240 : Rat) / 36742197) [(1, 2), (13, 1), (15, 3)],
  term ((8893311 : Rat) / 24494798) [(1, 2), (13, 2)],
  term ((-5653620 : Rat) / 12247399) [(1, 2), (13, 2), (14, 1)],
  term ((9596160 : Rat) / 12247399) [(1, 2), (13, 2), (14, 2)],
  term ((9596160 : Rat) / 12247399) [(1, 2), (13, 2), (15, 2)],
  term ((-266 : Rat) / 67) [(1, 2), (14, 1)],
  term ((470361040 : Rat) / 36742197) [(1, 2), (14, 1), (15, 2)],
  term ((92 : Rat) / 67) [(1, 2), (14, 2)],
  term ((81317120 : Rat) / 110226591) [(1, 2), (14, 2), (15, 2)],
  term ((1074406201 : Rat) / 661359546) [(1, 2), (15, 2)],
  term ((94503680 : Rat) / 110226591) [(1, 2), (15, 4)],
  term ((3655680 : Rat) / 12247399) [(10, 2), (11, 1), (13, 2), (15, 1)],
  term ((7563635786 : Rat) / 330679773) [(10, 2), (11, 1), (14, 1), (15, 1)],
  term ((-218159360 : Rat) / 110226591) [(10, 2), (11, 1), (14, 2), (15, 1)],
  term ((-101211285097 : Rat) / 18848747061) [(10, 2), (11, 1), (15, 1)],
  term ((-203536640 : Rat) / 110226591) [(10, 2), (11, 1), (15, 3)],
  term ((235252836440 : Rat) / 18848747061) [(10, 2), (11, 2)],
  term ((-77987840 : Rat) / 110226591) [(10, 2), (11, 2), (12, 1)],
  term ((97484800 : Rat) / 110226591) [(10, 2), (11, 2), (12, 1), (14, 1)],
  term ((-4264960 : Rat) / 110226591) [(10, 2), (11, 2), (13, 1), (15, 1)],
  term ((-2302504960 : Rat) / 330679773) [(10, 2), (11, 2), (14, 1)],
  term ((716800 : Rat) / 231083) [(10, 2), (11, 2), (14, 2)],
  term ((517734400 : Rat) / 110226591) [(10, 2), (11, 2), (15, 2)],
  term ((-194969600 : Rat) / 110226591) [(10, 2), (11, 3), (15, 1)],
  term ((18 : Rat) / 67) [(10, 2), (12, 1)],
  term ((-4569600 : Rat) / 12247399) [(10, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((15056440 : Rat) / 12247399) [(10, 2), (12, 1), (13, 1), (15, 1)],
  term ((-18 : Rat) / 67) [(10, 2), (12, 1), (14, 1)],
  term ((87910400 : Rat) / 110226591) [(10, 2), (12, 1), (14, 1), (15, 2)],
  term ((-780132338 : Rat) / 330679773) [(10, 2), (12, 1), (15, 2)],
  term ((173919142 : Rat) / 36742197) [(10, 2), (13, 1), (14, 1), (15, 1)],
  term ((74217920 : Rat) / 36742197) [(10, 2), (13, 1), (14, 2), (15, 1)],
  term ((523972417 : Rat) / 220453182) [(10, 2), (13, 1), (15, 1)],
  term ((76274240 : Rat) / 36742197) [(10, 2), (13, 1), (15, 3)],
  term ((-8893311 : Rat) / 24494798) [(10, 2), (13, 2)],
  term ((5653620 : Rat) / 12247399) [(10, 2), (13, 2), (14, 1)],
  term ((-9596160 : Rat) / 12247399) [(10, 2), (13, 2), (14, 2)],
  term ((-9596160 : Rat) / 12247399) [(10, 2), (13, 2), (15, 2)],
  term ((266 : Rat) / 67) [(10, 2), (14, 1)],
  term ((-470361040 : Rat) / 36742197) [(10, 2), (14, 1), (15, 2)],
  term ((-92 : Rat) / 67) [(10, 2), (14, 2)],
  term ((-81317120 : Rat) / 110226591) [(10, 2), (14, 2), (15, 2)],
  term ((-1074406201 : Rat) / 661359546) [(10, 2), (15, 2)],
  term ((-94503680 : Rat) / 110226591) [(10, 2), (15, 4)],
  term ((18 : Rat) / 67) [(11, 2), (12, 1)],
  term ((-4569600 : Rat) / 12247399) [(11, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((15056440 : Rat) / 12247399) [(11, 2), (12, 1), (13, 1), (15, 1)],
  term ((-18 : Rat) / 67) [(11, 2), (12, 1), (14, 1)],
  term ((87910400 : Rat) / 110226591) [(11, 2), (12, 1), (14, 1), (15, 2)],
  term ((-780132338 : Rat) / 330679773) [(11, 2), (12, 1), (15, 2)],
  term ((173919142 : Rat) / 36742197) [(11, 2), (13, 1), (14, 1), (15, 1)],
  term ((74217920 : Rat) / 36742197) [(11, 2), (13, 1), (14, 2), (15, 1)],
  term ((523972417 : Rat) / 220453182) [(11, 2), (13, 1), (15, 1)],
  term ((76274240 : Rat) / 36742197) [(11, 2), (13, 1), (15, 3)],
  term ((-8893311 : Rat) / 24494798) [(11, 2), (13, 2)],
  term ((5653620 : Rat) / 12247399) [(11, 2), (13, 2), (14, 1)],
  term ((-9596160 : Rat) / 12247399) [(11, 2), (13, 2), (14, 2)],
  term ((-9596160 : Rat) / 12247399) [(11, 2), (13, 2), (15, 2)],
  term ((266 : Rat) / 67) [(11, 2), (14, 1)],
  term ((-470361040 : Rat) / 36742197) [(11, 2), (14, 1), (15, 2)],
  term ((-92 : Rat) / 67) [(11, 2), (14, 2)],
  term ((-81317120 : Rat) / 110226591) [(11, 2), (14, 2), (15, 2)],
  term ((-1074406201 : Rat) / 661359546) [(11, 2), (15, 2)],
  term ((-94503680 : Rat) / 110226591) [(11, 2), (15, 4)],
  term ((3655680 : Rat) / 12247399) [(11, 3), (13, 2), (15, 1)],
  term ((7563635786 : Rat) / 330679773) [(11, 3), (14, 1), (15, 1)],
  term ((-218159360 : Rat) / 110226591) [(11, 3), (14, 2), (15, 1)],
  term ((-101211285097 : Rat) / 18848747061) [(11, 3), (15, 1)],
  term ((-203536640 : Rat) / 110226591) [(11, 3), (15, 3)],
  term ((235252836440 : Rat) / 18848747061) [(11, 4)],
  term ((-77987840 : Rat) / 110226591) [(11, 4), (12, 1)],
  term ((97484800 : Rat) / 110226591) [(11, 4), (12, 1), (14, 1)],
  term ((-4264960 : Rat) / 110226591) [(11, 4), (13, 1), (15, 1)],
  term ((-2302504960 : Rat) / 330679773) [(11, 4), (14, 1)],
  term ((716800 : Rat) / 231083) [(11, 4), (14, 2)],
  term ((517734400 : Rat) / 110226591) [(11, 4), (15, 2)],
  term ((-194969600 : Rat) / 110226591) [(11, 5), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 2, terms 400 through 432. -/
theorem rs_R009_ueqv_R009NNNYN_block_02_0400_0432_valid :
    checkProductSumEq rs_R009_ueqv_R009NNNYN_partials_02_0400_0432
      rs_R009_ueqv_R009NNNYN_block_02_0400_0432 = true := by
  native_decide

end R009UeqvR009NNNYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
