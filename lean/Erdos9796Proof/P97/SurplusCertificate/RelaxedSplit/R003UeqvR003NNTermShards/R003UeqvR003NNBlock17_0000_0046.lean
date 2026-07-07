/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R003:u=v:R003NN, term block 17:0-46

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R003UeqvR003NNTermShards

/-- Generator polynomial 17 for relaxed split surplus certificate `R003:u=v:R003NN`. -/
def rs_R003_ueqv_R003NN_generator_17_0000_0046 : Poly :=
[
  term (-2 : Rat) [(0, 1), (6, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (7, 1)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(2, 1), (6, 1)],
  term (-1 : Rat) [(2, 2)],
  term (2 : Rat) [(3, 1), (7, 1)],
  term (-1 : Rat) [(3, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 17. -/
def rs_R003_ueqv_R003NN_coefficient_17_0000 : Poly :=
[
  term (-9 : Rat) []
]

/-- Partial product 0 for generator 17. -/
def rs_R003_ueqv_R003NN_partial_17_0000 : Poly :=
[
  term (18 : Rat) [(0, 1), (6, 1)],
  term (-9 : Rat) [(0, 2)],
  term (18 : Rat) [(1, 1), (7, 1)],
  term (-9 : Rat) [(1, 2)],
  term (-18 : Rat) [(2, 1), (6, 1)],
  term (9 : Rat) [(2, 2)],
  term (-18 : Rat) [(3, 1), (7, 1)],
  term (9 : Rat) [(3, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 17. -/
theorem rs_R003_ueqv_R003NN_partial_17_0000_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_17_0000
        rs_R003_ueqv_R003NN_generator_17_0000_0046 =
      rs_R003_ueqv_R003NN_partial_17_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 17. -/
def rs_R003_ueqv_R003NN_coefficient_17_0001 : Poly :=
[
  term ((109403 : Rat) / 178716) [(0, 1), (3, 1), (15, 1), (16, 1)]
]

/-- Partial product 1 for generator 17. -/
def rs_R003_ueqv_R003NN_partial_17_0001 : Poly :=
[
  term ((-109403 : Rat) / 89358) [(0, 1), (1, 1), (3, 1), (7, 1), (15, 1), (16, 1)],
  term ((109403 : Rat) / 178716) [(0, 1), (1, 2), (3, 1), (15, 1), (16, 1)],
  term ((109403 : Rat) / 89358) [(0, 1), (2, 1), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((-109403 : Rat) / 178716) [(0, 1), (2, 2), (3, 1), (15, 1), (16, 1)],
  term ((109403 : Rat) / 89358) [(0, 1), (3, 2), (7, 1), (15, 1), (16, 1)],
  term ((-109403 : Rat) / 178716) [(0, 1), (3, 3), (15, 1), (16, 1)],
  term ((-109403 : Rat) / 89358) [(0, 2), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((109403 : Rat) / 178716) [(0, 3), (3, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 17. -/
theorem rs_R003_ueqv_R003NN_partial_17_0001_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_17_0001
        rs_R003_ueqv_R003NN_generator_17_0000_0046 =
      rs_R003_ueqv_R003NN_partial_17_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 17. -/
def rs_R003_ueqv_R003NN_coefficient_17_0002 : Poly :=
[
  term ((-62561 : Rat) / 178716) [(0, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 2 for generator 17. -/
def rs_R003_ueqv_R003NN_partial_17_0002 : Poly :=
[
  term ((62561 : Rat) / 89358) [(0, 1), (1, 1), (7, 2), (15, 1), (16, 1)],
  term ((-62561 : Rat) / 178716) [(0, 1), (1, 2), (7, 1), (15, 1), (16, 1)],
  term ((-62561 : Rat) / 89358) [(0, 1), (2, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((62561 : Rat) / 178716) [(0, 1), (2, 2), (7, 1), (15, 1), (16, 1)],
  term ((-62561 : Rat) / 89358) [(0, 1), (3, 1), (7, 2), (15, 1), (16, 1)],
  term ((62561 : Rat) / 178716) [(0, 1), (3, 2), (7, 1), (15, 1), (16, 1)],
  term ((62561 : Rat) / 89358) [(0, 2), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-62561 : Rat) / 178716) [(0, 3), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 17. -/
theorem rs_R003_ueqv_R003NN_partial_17_0002_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_17_0002
        rs_R003_ueqv_R003NN_generator_17_0000_0046 =
      rs_R003_ueqv_R003NN_partial_17_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 17. -/
def rs_R003_ueqv_R003NN_coefficient_17_0003 : Poly :=
[
  term ((3428 : Rat) / 134037) [(0, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 3 for generator 17. -/
def rs_R003_ueqv_R003NN_partial_17_0003 : Poly :=
[
  term ((-6856 : Rat) / 134037) [(0, 1), (1, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((3428 : Rat) / 134037) [(0, 1), (1, 2), (11, 1), (15, 1), (16, 1)],
  term ((6856 : Rat) / 134037) [(0, 1), (2, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3428 : Rat) / 134037) [(0, 1), (2, 2), (11, 1), (15, 1), (16, 1)],
  term ((6856 : Rat) / 134037) [(0, 1), (3, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3428 : Rat) / 134037) [(0, 1), (3, 2), (11, 1), (15, 1), (16, 1)],
  term ((-6856 : Rat) / 134037) [(0, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((3428 : Rat) / 134037) [(0, 3), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 17. -/
theorem rs_R003_ueqv_R003NN_partial_17_0003_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_17_0003
        rs_R003_ueqv_R003NN_generator_17_0000_0046 =
      rs_R003_ueqv_R003NN_partial_17_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 17. -/
def rs_R003_ueqv_R003NN_coefficient_17_0004 : Poly :=
[
  term ((-506549 : Rat) / 536148) [(0, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 4 for generator 17. -/
def rs_R003_ueqv_R003NN_partial_17_0004 : Poly :=
[
  term ((506549 : Rat) / 268074) [(0, 1), (1, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-506549 : Rat) / 536148) [(0, 1), (1, 2), (13, 1), (15, 1), (16, 1)],
  term ((-506549 : Rat) / 268074) [(0, 1), (2, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((506549 : Rat) / 536148) [(0, 1), (2, 2), (13, 1), (15, 1), (16, 1)],
  term ((-506549 : Rat) / 268074) [(0, 1), (3, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((506549 : Rat) / 536148) [(0, 1), (3, 2), (13, 1), (15, 1), (16, 1)],
  term ((506549 : Rat) / 268074) [(0, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-506549 : Rat) / 536148) [(0, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 17. -/
theorem rs_R003_ueqv_R003NN_partial_17_0004_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_17_0004
        rs_R003_ueqv_R003NN_generator_17_0000_0046 =
      rs_R003_ueqv_R003NN_partial_17_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 17. -/
def rs_R003_ueqv_R003NN_coefficient_17_0005 : Poly :=
[
  term ((99701 : Rat) / 89358) [(0, 1), (15, 2), (16, 1)]
]

/-- Partial product 5 for generator 17. -/
def rs_R003_ueqv_R003NN_partial_17_0005 : Poly :=
[
  term ((-99701 : Rat) / 44679) [(0, 1), (1, 1), (7, 1), (15, 2), (16, 1)],
  term ((99701 : Rat) / 89358) [(0, 1), (1, 2), (15, 2), (16, 1)],
  term ((99701 : Rat) / 44679) [(0, 1), (2, 1), (6, 1), (15, 2), (16, 1)],
  term ((-99701 : Rat) / 89358) [(0, 1), (2, 2), (15, 2), (16, 1)],
  term ((99701 : Rat) / 44679) [(0, 1), (3, 1), (7, 1), (15, 2), (16, 1)],
  term ((-99701 : Rat) / 89358) [(0, 1), (3, 2), (15, 2), (16, 1)],
  term ((-99701 : Rat) / 44679) [(0, 2), (6, 1), (15, 2), (16, 1)],
  term ((99701 : Rat) / 89358) [(0, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 17. -/
theorem rs_R003_ueqv_R003NN_partial_17_0005_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_17_0005
        rs_R003_ueqv_R003NN_generator_17_0000_0046 =
      rs_R003_ueqv_R003NN_partial_17_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 17. -/
def rs_R003_ueqv_R003NN_coefficient_17_0006 : Poly :=
[
  term ((-109403 : Rat) / 178716) [(1, 1), (2, 1), (15, 1), (16, 1)]
]

/-- Partial product 6 for generator 17. -/
def rs_R003_ueqv_R003NN_partial_17_0006 : Poly :=
[
  term ((109403 : Rat) / 89358) [(0, 1), (1, 1), (2, 1), (6, 1), (15, 1), (16, 1)],
  term ((-109403 : Rat) / 178716) [(0, 2), (1, 1), (2, 1), (15, 1), (16, 1)],
  term ((-109403 : Rat) / 89358) [(1, 1), (2, 1), (3, 1), (7, 1), (15, 1), (16, 1)],
  term ((109403 : Rat) / 178716) [(1, 1), (2, 1), (3, 2), (15, 1), (16, 1)],
  term ((-109403 : Rat) / 89358) [(1, 1), (2, 2), (6, 1), (15, 1), (16, 1)],
  term ((109403 : Rat) / 178716) [(1, 1), (2, 3), (15, 1), (16, 1)],
  term ((109403 : Rat) / 89358) [(1, 2), (2, 1), (7, 1), (15, 1), (16, 1)],
  term ((-109403 : Rat) / 178716) [(1, 3), (2, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 17. -/
theorem rs_R003_ueqv_R003NN_partial_17_0006_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_17_0006
        rs_R003_ueqv_R003NN_generator_17_0000_0046 =
      rs_R003_ueqv_R003NN_partial_17_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 17. -/
def rs_R003_ueqv_R003NN_coefficient_17_0007 : Poly :=
[
  term ((62561 : Rat) / 178716) [(1, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 7 for generator 17. -/
def rs_R003_ueqv_R003NN_partial_17_0007 : Poly :=
[
  term ((-62561 : Rat) / 89358) [(0, 1), (1, 1), (6, 2), (15, 1), (16, 1)],
  term ((62561 : Rat) / 178716) [(0, 2), (1, 1), (6, 1), (15, 1), (16, 1)],
  term ((62561 : Rat) / 89358) [(1, 1), (2, 1), (6, 2), (15, 1), (16, 1)],
  term ((-62561 : Rat) / 178716) [(1, 1), (2, 2), (6, 1), (15, 1), (16, 1)],
  term ((62561 : Rat) / 89358) [(1, 1), (3, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-62561 : Rat) / 178716) [(1, 1), (3, 2), (6, 1), (15, 1), (16, 1)],
  term ((-62561 : Rat) / 89358) [(1, 2), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((62561 : Rat) / 178716) [(1, 3), (6, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 17. -/
theorem rs_R003_ueqv_R003NN_partial_17_0007_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_17_0007
        rs_R003_ueqv_R003NN_generator_17_0000_0046 =
      rs_R003_ueqv_R003NN_partial_17_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 17. -/
def rs_R003_ueqv_R003NN_coefficient_17_0008 : Poly :=
[
  term ((-62561 : Rat) / 89358) [(1, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 8 for generator 17. -/
def rs_R003_ueqv_R003NN_partial_17_0008 : Poly :=
[
  term ((62561 : Rat) / 44679) [(0, 1), (1, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-62561 : Rat) / 89358) [(0, 2), (1, 1), (12, 1), (15, 1), (16, 1)],
  term ((-62561 : Rat) / 44679) [(1, 1), (2, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((62561 : Rat) / 89358) [(1, 1), (2, 2), (12, 1), (15, 1), (16, 1)],
  term ((-62561 : Rat) / 44679) [(1, 1), (3, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((62561 : Rat) / 89358) [(1, 1), (3, 2), (12, 1), (15, 1), (16, 1)],
  term ((62561 : Rat) / 44679) [(1, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-62561 : Rat) / 89358) [(1, 3), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 17. -/
theorem rs_R003_ueqv_R003NN_partial_17_0008_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_17_0008
        rs_R003_ueqv_R003NN_generator_17_0000_0046 =
      rs_R003_ueqv_R003NN_partial_17_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 17. -/
def rs_R003_ueqv_R003NN_coefficient_17_0009 : Poly :=
[
  term ((109403 : Rat) / 357432) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 9 for generator 17. -/
def rs_R003_ueqv_R003NN_partial_17_0009 : Poly :=
[
  term ((-109403 : Rat) / 178716) [(0, 1), (1, 1), (6, 1), (15, 1), (16, 1)],
  term ((109403 : Rat) / 357432) [(0, 2), (1, 1), (15, 1), (16, 1)],
  term ((109403 : Rat) / 178716) [(1, 1), (2, 1), (6, 1), (15, 1), (16, 1)],
  term ((-109403 : Rat) / 357432) [(1, 1), (2, 2), (15, 1), (16, 1)],
  term ((109403 : Rat) / 178716) [(1, 1), (3, 1), (7, 1), (15, 1), (16, 1)],
  term ((-109403 : Rat) / 357432) [(1, 1), (3, 2), (15, 1), (16, 1)],
  term ((-109403 : Rat) / 178716) [(1, 2), (7, 1), (15, 1), (16, 1)],
  term ((109403 : Rat) / 357432) [(1, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 17. -/
theorem rs_R003_ueqv_R003NN_partial_17_0009_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_17_0009
        rs_R003_ueqv_R003NN_generator_17_0000_0046 =
      rs_R003_ueqv_R003NN_partial_17_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 17. -/
def rs_R003_ueqv_R003NN_coefficient_17_0010 : Poly :=
[
  term ((-13712 : Rat) / 44679) [(3, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 10 for generator 17. -/
def rs_R003_ueqv_R003NN_partial_17_0010 : Poly :=
[
  term ((27424 : Rat) / 44679) [(0, 1), (3, 1), (6, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-13712 : Rat) / 44679) [(0, 2), (3, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((27424 : Rat) / 44679) [(1, 1), (3, 1), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-13712 : Rat) / 44679) [(1, 2), (3, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-27424 : Rat) / 44679) [(2, 1), (3, 1), (6, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((13712 : Rat) / 44679) [(2, 2), (3, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-27424 : Rat) / 44679) [(3, 2), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((13712 : Rat) / 44679) [(3, 3), (9, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 17. -/
theorem rs_R003_ueqv_R003NN_partial_17_0010_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_17_0010
        rs_R003_ueqv_R003NN_generator_17_0000_0046 =
      rs_R003_ueqv_R003NN_partial_17_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 17. -/
def rs_R003_ueqv_R003NN_coefficient_17_0011 : Poly :=
[
  term ((6856 : Rat) / 44679) [(3, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 11 for generator 17. -/
def rs_R003_ueqv_R003NN_partial_17_0011 : Poly :=
[
  term ((-13712 : Rat) / 44679) [(0, 1), (3, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((6856 : Rat) / 44679) [(0, 2), (3, 1), (11, 1), (15, 2), (16, 1)],
  term ((-13712 : Rat) / 44679) [(1, 1), (3, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((6856 : Rat) / 44679) [(1, 2), (3, 1), (11, 1), (15, 2), (16, 1)],
  term ((13712 : Rat) / 44679) [(2, 1), (3, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((-6856 : Rat) / 44679) [(2, 2), (3, 1), (11, 1), (15, 2), (16, 1)],
  term ((13712 : Rat) / 44679) [(3, 2), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((-6856 : Rat) / 44679) [(3, 3), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 17. -/
theorem rs_R003_ueqv_R003NN_partial_17_0011_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_17_0011
        rs_R003_ueqv_R003NN_generator_17_0000_0046 =
      rs_R003_ueqv_R003NN_partial_17_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 17. -/
def rs_R003_ueqv_R003NN_coefficient_17_0012 : Poly :=
[
  term ((17140 : Rat) / 44679) [(3, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 12 for generator 17. -/
def rs_R003_ueqv_R003NN_partial_17_0012 : Poly :=
[
  term ((-34280 : Rat) / 44679) [(0, 1), (3, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((17140 : Rat) / 44679) [(0, 2), (3, 1), (13, 1), (15, 2), (16, 1)],
  term ((-34280 : Rat) / 44679) [(1, 1), (3, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((17140 : Rat) / 44679) [(1, 2), (3, 1), (13, 1), (15, 2), (16, 1)],
  term ((34280 : Rat) / 44679) [(2, 1), (3, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((-17140 : Rat) / 44679) [(2, 2), (3, 1), (13, 1), (15, 2), (16, 1)],
  term ((34280 : Rat) / 44679) [(3, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-17140 : Rat) / 44679) [(3, 3), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 17. -/
theorem rs_R003_ueqv_R003NN_partial_17_0012_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_17_0012
        rs_R003_ueqv_R003NN_generator_17_0000_0046 =
      rs_R003_ueqv_R003NN_partial_17_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 17. -/
def rs_R003_ueqv_R003NN_coefficient_17_0013 : Poly :=
[
  term ((857 : Rat) / 29786) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 13 for generator 17. -/
def rs_R003_ueqv_R003NN_partial_17_0013 : Poly :=
[
  term ((-857 : Rat) / 14893) [(0, 1), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((857 : Rat) / 29786) [(0, 2), (3, 1), (15, 1), (16, 1)],
  term ((-857 : Rat) / 14893) [(1, 1), (3, 1), (7, 1), (15, 1), (16, 1)],
  term ((857 : Rat) / 29786) [(1, 2), (3, 1), (15, 1), (16, 1)],
  term ((857 : Rat) / 14893) [(2, 1), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((-857 : Rat) / 29786) [(2, 2), (3, 1), (15, 1), (16, 1)],
  term ((857 : Rat) / 14893) [(3, 2), (7, 1), (15, 1), (16, 1)],
  term ((-857 : Rat) / 29786) [(3, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 17. -/
theorem rs_R003_ueqv_R003NN_partial_17_0013_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_17_0013
        rs_R003_ueqv_R003NN_generator_17_0000_0046 =
      rs_R003_ueqv_R003NN_partial_17_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 17. -/
def rs_R003_ueqv_R003NN_coefficient_17_0014 : Poly :=
[
  term ((-1714 : Rat) / 14893) [(3, 1), (15, 3), (16, 1)]
]

/-- Partial product 14 for generator 17. -/
def rs_R003_ueqv_R003NN_partial_17_0014 : Poly :=
[
  term ((3428 : Rat) / 14893) [(0, 1), (3, 1), (6, 1), (15, 3), (16, 1)],
  term ((-1714 : Rat) / 14893) [(0, 2), (3, 1), (15, 3), (16, 1)],
  term ((3428 : Rat) / 14893) [(1, 1), (3, 1), (7, 1), (15, 3), (16, 1)],
  term ((-1714 : Rat) / 14893) [(1, 2), (3, 1), (15, 3), (16, 1)],
  term ((-3428 : Rat) / 14893) [(2, 1), (3, 1), (6, 1), (15, 3), (16, 1)],
  term ((1714 : Rat) / 14893) [(2, 2), (3, 1), (15, 3), (16, 1)],
  term ((-3428 : Rat) / 14893) [(3, 2), (7, 1), (15, 3), (16, 1)],
  term ((1714 : Rat) / 14893) [(3, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 17. -/
theorem rs_R003_ueqv_R003NN_partial_17_0014_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_17_0014
        rs_R003_ueqv_R003NN_generator_17_0000_0046 =
      rs_R003_ueqv_R003NN_partial_17_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 17. -/
def rs_R003_ueqv_R003NN_coefficient_17_0015 : Poly :=
[
  term ((199667 : Rat) / 536148) [(4, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 15 for generator 17. -/
def rs_R003_ueqv_R003NN_partial_17_0015 : Poly :=
[
  term ((-199667 : Rat) / 268074) [(0, 1), (4, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((199667 : Rat) / 536148) [(0, 2), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((-199667 : Rat) / 268074) [(1, 1), (4, 1), (7, 2), (15, 1), (16, 1)],
  term ((199667 : Rat) / 536148) [(1, 2), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((199667 : Rat) / 268074) [(2, 1), (4, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-199667 : Rat) / 536148) [(2, 2), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((199667 : Rat) / 268074) [(3, 1), (4, 1), (7, 2), (15, 1), (16, 1)],
  term ((-199667 : Rat) / 536148) [(3, 2), (4, 1), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 17. -/
theorem rs_R003_ueqv_R003NN_partial_17_0015_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_17_0015
        rs_R003_ueqv_R003NN_generator_17_0000_0046 =
      rs_R003_ueqv_R003NN_partial_17_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 17. -/
def rs_R003_ueqv_R003NN_coefficient_17_0016 : Poly :=
[
  term ((-17710 : Rat) / 14893) [(4, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 16 for generator 17. -/
def rs_R003_ueqv_R003NN_partial_17_0016 : Poly :=
[
  term ((35420 : Rat) / 14893) [(0, 1), (4, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-17710 : Rat) / 14893) [(0, 2), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((35420 : Rat) / 14893) [(1, 1), (4, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-17710 : Rat) / 14893) [(1, 2), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((-35420 : Rat) / 14893) [(2, 1), (4, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((17710 : Rat) / 14893) [(2, 2), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((-35420 : Rat) / 14893) [(3, 1), (4, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((17710 : Rat) / 14893) [(3, 2), (4, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 17. -/
theorem rs_R003_ueqv_R003NN_partial_17_0016_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_17_0016
        rs_R003_ueqv_R003NN_generator_17_0000_0046 =
      rs_R003_ueqv_R003NN_partial_17_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 17. -/
def rs_R003_ueqv_R003NN_coefficient_17_0017 : Poly :=
[
  term ((-199667 : Rat) / 268074) [(4, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 17 for generator 17. -/
def rs_R003_ueqv_R003NN_partial_17_0017 : Poly :=
[
  term ((199667 : Rat) / 134037) [(0, 1), (4, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-199667 : Rat) / 268074) [(0, 2), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((199667 : Rat) / 134037) [(1, 1), (4, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-199667 : Rat) / 268074) [(1, 2), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-199667 : Rat) / 134037) [(2, 1), (4, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((199667 : Rat) / 268074) [(2, 2), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-199667 : Rat) / 134037) [(3, 1), (4, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((199667 : Rat) / 268074) [(3, 2), (4, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 17. -/
theorem rs_R003_ueqv_R003NN_partial_17_0017_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_17_0017
        rs_R003_ueqv_R003NN_generator_17_0000_0046 =
      rs_R003_ueqv_R003NN_partial_17_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 17. -/
def rs_R003_ueqv_R003NN_coefficient_17_0018 : Poly :=
[
  term ((8855 : Rat) / 14893) [(4, 1), (15, 2), (16, 1)]
]

/-- Partial product 18 for generator 17. -/
def rs_R003_ueqv_R003NN_partial_17_0018 : Poly :=
[
  term ((-17710 : Rat) / 14893) [(0, 1), (4, 1), (6, 1), (15, 2), (16, 1)],
  term ((8855 : Rat) / 14893) [(0, 2), (4, 1), (15, 2), (16, 1)],
  term ((-17710 : Rat) / 14893) [(1, 1), (4, 1), (7, 1), (15, 2), (16, 1)],
  term ((8855 : Rat) / 14893) [(1, 2), (4, 1), (15, 2), (16, 1)],
  term ((17710 : Rat) / 14893) [(2, 1), (4, 1), (6, 1), (15, 2), (16, 1)],
  term ((-8855 : Rat) / 14893) [(2, 2), (4, 1), (15, 2), (16, 1)],
  term ((17710 : Rat) / 14893) [(3, 1), (4, 1), (7, 1), (15, 2), (16, 1)],
  term ((-8855 : Rat) / 14893) [(3, 2), (4, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 17. -/
theorem rs_R003_ueqv_R003NN_partial_17_0018_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_17_0018
        rs_R003_ueqv_R003NN_generator_17_0000_0046 =
      rs_R003_ueqv_R003NN_partial_17_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 17. -/
def rs_R003_ueqv_R003NN_coefficient_17_0019 : Poly :=
[
  term ((-199667 : Rat) / 536148) [(5, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 19 for generator 17. -/
def rs_R003_ueqv_R003NN_partial_17_0019 : Poly :=
[
  term ((199667 : Rat) / 268074) [(0, 1), (5, 1), (6, 2), (15, 1), (16, 1)],
  term ((-199667 : Rat) / 536148) [(0, 2), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((199667 : Rat) / 268074) [(1, 1), (5, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-199667 : Rat) / 536148) [(1, 2), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-199667 : Rat) / 268074) [(2, 1), (5, 1), (6, 2), (15, 1), (16, 1)],
  term ((199667 : Rat) / 536148) [(2, 2), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-199667 : Rat) / 268074) [(3, 1), (5, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((199667 : Rat) / 536148) [(3, 2), (5, 1), (6, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 17. -/
theorem rs_R003_ueqv_R003NN_partial_17_0019_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_17_0019
        rs_R003_ueqv_R003NN_generator_17_0000_0046 =
      rs_R003_ueqv_R003NN_partial_17_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 17. -/
def rs_R003_ueqv_R003NN_coefficient_17_0020 : Poly :=
[
  term ((-99404 : Rat) / 134037) [(5, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 20 for generator 17. -/
def rs_R003_ueqv_R003NN_partial_17_0020 : Poly :=
[
  term ((198808 : Rat) / 134037) [(0, 1), (5, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-99404 : Rat) / 134037) [(0, 2), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((198808 : Rat) / 134037) [(1, 1), (5, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-99404 : Rat) / 134037) [(1, 2), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-198808 : Rat) / 134037) [(2, 1), (5, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((99404 : Rat) / 134037) [(2, 2), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-198808 : Rat) / 134037) [(3, 1), (5, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((99404 : Rat) / 134037) [(3, 2), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 17. -/
theorem rs_R003_ueqv_R003NN_partial_17_0020_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_17_0020
        rs_R003_ueqv_R003NN_generator_17_0000_0046 =
      rs_R003_ueqv_R003NN_partial_17_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 17. -/
def rs_R003_ueqv_R003NN_coefficient_17_0021 : Poly :=
[
  term ((199667 : Rat) / 268074) [(5, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 21 for generator 17. -/
def rs_R003_ueqv_R003NN_partial_17_0021 : Poly :=
[
  term ((-199667 : Rat) / 134037) [(0, 1), (5, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((199667 : Rat) / 268074) [(0, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-199667 : Rat) / 134037) [(1, 1), (5, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((199667 : Rat) / 268074) [(1, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((199667 : Rat) / 134037) [(2, 1), (5, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-199667 : Rat) / 268074) [(2, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((199667 : Rat) / 134037) [(3, 1), (5, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-199667 : Rat) / 268074) [(3, 2), (5, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 17. -/
theorem rs_R003_ueqv_R003NN_partial_17_0021_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_17_0021
        rs_R003_ueqv_R003NN_generator_17_0000_0046 =
      rs_R003_ueqv_R003NN_partial_17_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 17. -/
def rs_R003_ueqv_R003NN_coefficient_17_0022 : Poly :=
[
  term ((49702 : Rat) / 134037) [(5, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 22 for generator 17. -/
def rs_R003_ueqv_R003NN_partial_17_0022 : Poly :=
[
  term ((-99404 : Rat) / 134037) [(0, 1), (5, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((49702 : Rat) / 134037) [(0, 2), (5, 1), (13, 1), (15, 2), (16, 1)],
  term ((-99404 : Rat) / 134037) [(1, 1), (5, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((49702 : Rat) / 134037) [(1, 2), (5, 1), (13, 1), (15, 2), (16, 1)],
  term ((99404 : Rat) / 134037) [(2, 1), (5, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((-49702 : Rat) / 134037) [(2, 2), (5, 1), (13, 1), (15, 2), (16, 1)],
  term ((99404 : Rat) / 134037) [(3, 1), (5, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-49702 : Rat) / 134037) [(3, 2), (5, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 17. -/
theorem rs_R003_ueqv_R003NN_partial_17_0022_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_17_0022
        rs_R003_ueqv_R003NN_generator_17_0000_0046 =
      rs_R003_ueqv_R003NN_partial_17_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 17. -/
def rs_R003_ueqv_R003NN_coefficient_17_0023 : Poly :=
[
  term ((-1714 : Rat) / 44679) [(6, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 23 for generator 17. -/
def rs_R003_ueqv_R003NN_partial_17_0023 : Poly :=
[
  term ((3428 : Rat) / 44679) [(0, 1), (6, 2), (11, 1), (15, 1), (16, 1)],
  term ((-1714 : Rat) / 44679) [(0, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((3428 : Rat) / 44679) [(1, 1), (6, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1714 : Rat) / 44679) [(1, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3428 : Rat) / 44679) [(2, 1), (6, 2), (11, 1), (15, 1), (16, 1)],
  term ((1714 : Rat) / 44679) [(2, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3428 : Rat) / 44679) [(3, 1), (6, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((1714 : Rat) / 44679) [(3, 2), (6, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 17. -/
theorem rs_R003_ueqv_R003NN_partial_17_0023_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_17_0023
        rs_R003_ueqv_R003NN_generator_17_0000_0046 =
      rs_R003_ueqv_R003NN_partial_17_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 17. -/
def rs_R003_ueqv_R003NN_coefficient_17_0024 : Poly :=
[
  term ((289619 : Rat) / 268074) [(6, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 24 for generator 17. -/
def rs_R003_ueqv_R003NN_partial_17_0024 : Poly :=
[
  term ((-289619 : Rat) / 134037) [(0, 1), (6, 2), (13, 1), (15, 1), (16, 1)],
  term ((289619 : Rat) / 268074) [(0, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-289619 : Rat) / 134037) [(1, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((289619 : Rat) / 268074) [(1, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((289619 : Rat) / 134037) [(2, 1), (6, 2), (13, 1), (15, 1), (16, 1)],
  term ((-289619 : Rat) / 268074) [(2, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((289619 : Rat) / 134037) [(3, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-289619 : Rat) / 268074) [(3, 2), (6, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 17. -/
theorem rs_R003_ueqv_R003NN_partial_17_0024_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_17_0024
        rs_R003_ueqv_R003NN_generator_17_0000_0046 =
      rs_R003_ueqv_R003NN_partial_17_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 17. -/
def rs_R003_ueqv_R003NN_coefficient_17_0025 : Poly :=
[
  term ((-273343 : Rat) / 536148) [(6, 1), (15, 2), (16, 1)]
]

/-- Partial product 25 for generator 17. -/
def rs_R003_ueqv_R003NN_partial_17_0025 : Poly :=
[
  term ((273343 : Rat) / 268074) [(0, 1), (6, 2), (15, 2), (16, 1)],
  term ((-273343 : Rat) / 536148) [(0, 2), (6, 1), (15, 2), (16, 1)],
  term ((273343 : Rat) / 268074) [(1, 1), (6, 1), (7, 1), (15, 2), (16, 1)],
  term ((-273343 : Rat) / 536148) [(1, 2), (6, 1), (15, 2), (16, 1)],
  term ((-273343 : Rat) / 268074) [(2, 1), (6, 2), (15, 2), (16, 1)],
  term ((273343 : Rat) / 536148) [(2, 2), (6, 1), (15, 2), (16, 1)],
  term ((-273343 : Rat) / 268074) [(3, 1), (6, 1), (7, 1), (15, 2), (16, 1)],
  term ((273343 : Rat) / 536148) [(3, 2), (6, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 17. -/
theorem rs_R003_ueqv_R003NN_partial_17_0025_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_17_0025
        rs_R003_ueqv_R003NN_generator_17_0000_0046 =
      rs_R003_ueqv_R003NN_partial_17_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 17. -/
def rs_R003_ueqv_R003NN_coefficient_17_0026 : Poly :=
[
  term ((62561 : Rat) / 178716) [(7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 26 for generator 17. -/
def rs_R003_ueqv_R003NN_partial_17_0026 : Poly :=
[
  term ((-62561 : Rat) / 89358) [(0, 1), (6, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((62561 : Rat) / 178716) [(0, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-62561 : Rat) / 89358) [(1, 1), (7, 2), (12, 1), (15, 1), (16, 1)],
  term ((62561 : Rat) / 178716) [(1, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((62561 : Rat) / 89358) [(2, 1), (6, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-62561 : Rat) / 178716) [(2, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((62561 : Rat) / 89358) [(3, 1), (7, 2), (12, 1), (15, 1), (16, 1)],
  term ((-62561 : Rat) / 178716) [(3, 2), (7, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 17. -/
theorem rs_R003_ueqv_R003NN_partial_17_0026_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_17_0026
        rs_R003_ueqv_R003NN_generator_17_0000_0046 =
      rs_R003_ueqv_R003NN_partial_17_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 17. -/
def rs_R003_ueqv_R003NN_coefficient_17_0027 : Poly :=
[
  term ((-128807 : Rat) / 178716) [(7, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 27 for generator 17. -/
def rs_R003_ueqv_R003NN_partial_17_0027 : Poly :=
[
  term ((128807 : Rat) / 89358) [(0, 1), (6, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-128807 : Rat) / 178716) [(0, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((128807 : Rat) / 89358) [(1, 1), (7, 2), (13, 1), (15, 2), (16, 1)],
  term ((-128807 : Rat) / 178716) [(1, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-128807 : Rat) / 89358) [(2, 1), (6, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((128807 : Rat) / 178716) [(2, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-128807 : Rat) / 89358) [(3, 1), (7, 2), (13, 1), (15, 2), (16, 1)],
  term ((128807 : Rat) / 178716) [(3, 2), (7, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 17. -/
theorem rs_R003_ueqv_R003NN_partial_17_0027_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_17_0027
        rs_R003_ueqv_R003NN_generator_17_0000_0046 =
      rs_R003_ueqv_R003NN_partial_17_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 17. -/
def rs_R003_ueqv_R003NN_coefficient_17_0028 : Poly :=
[
  term ((-1593181 : Rat) / 4289184) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 28 for generator 17. -/
def rs_R003_ueqv_R003NN_partial_17_0028 : Poly :=
[
  term ((1593181 : Rat) / 2144592) [(0, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-1593181 : Rat) / 4289184) [(0, 2), (7, 1), (15, 1), (16, 1)],
  term ((1593181 : Rat) / 2144592) [(1, 1), (7, 2), (15, 1), (16, 1)],
  term ((-1593181 : Rat) / 4289184) [(1, 2), (7, 1), (15, 1), (16, 1)],
  term ((-1593181 : Rat) / 2144592) [(2, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((1593181 : Rat) / 4289184) [(2, 2), (7, 1), (15, 1), (16, 1)],
  term ((-1593181 : Rat) / 2144592) [(3, 1), (7, 2), (15, 1), (16, 1)],
  term ((1593181 : Rat) / 4289184) [(3, 2), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 17. -/
theorem rs_R003_ueqv_R003NN_partial_17_0028_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_17_0028
        rs_R003_ueqv_R003NN_generator_17_0000_0046 =
      rs_R003_ueqv_R003NN_partial_17_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 17. -/
def rs_R003_ueqv_R003NN_coefficient_17_0029 : Poly :=
[
  term ((128807 : Rat) / 357432) [(7, 1), (15, 3), (16, 1)]
]

/-- Partial product 29 for generator 17. -/
def rs_R003_ueqv_R003NN_partial_17_0029 : Poly :=
[
  term ((-128807 : Rat) / 178716) [(0, 1), (6, 1), (7, 1), (15, 3), (16, 1)],
  term ((128807 : Rat) / 357432) [(0, 2), (7, 1), (15, 3), (16, 1)],
  term ((-128807 : Rat) / 178716) [(1, 1), (7, 2), (15, 3), (16, 1)],
  term ((128807 : Rat) / 357432) [(1, 2), (7, 1), (15, 3), (16, 1)],
  term ((128807 : Rat) / 178716) [(2, 1), (6, 1), (7, 1), (15, 3), (16, 1)],
  term ((-128807 : Rat) / 357432) [(2, 2), (7, 1), (15, 3), (16, 1)],
  term ((128807 : Rat) / 178716) [(3, 1), (7, 2), (15, 3), (16, 1)],
  term ((-128807 : Rat) / 357432) [(3, 2), (7, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 17. -/
theorem rs_R003_ueqv_R003NN_partial_17_0029_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_17_0029
        rs_R003_ueqv_R003NN_generator_17_0000_0046 =
      rs_R003_ueqv_R003NN_partial_17_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 17. -/
def rs_R003_ueqv_R003NN_coefficient_17_0030 : Poly :=
[
  term ((-1180595 : Rat) / 1072296) [(8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 30 for generator 17. -/
def rs_R003_ueqv_R003NN_partial_17_0030 : Poly :=
[
  term ((1180595 : Rat) / 536148) [(0, 1), (6, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1180595 : Rat) / 1072296) [(0, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((1180595 : Rat) / 536148) [(1, 1), (7, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1180595 : Rat) / 1072296) [(1, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1180595 : Rat) / 536148) [(2, 1), (6, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((1180595 : Rat) / 1072296) [(2, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1180595 : Rat) / 536148) [(3, 1), (7, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((1180595 : Rat) / 1072296) [(3, 2), (8, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 17. -/
theorem rs_R003_ueqv_R003NN_partial_17_0030_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_17_0030
        rs_R003_ueqv_R003NN_generator_17_0000_0046 =
      rs_R003_ueqv_R003NN_partial_17_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 17. -/
def rs_R003_ueqv_R003NN_coefficient_17_0031 : Poly :=
[
  term ((-18705487 : Rat) / 3216888) [(8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 31 for generator 17. -/
def rs_R003_ueqv_R003NN_partial_17_0031 : Poly :=
[
  term ((18705487 : Rat) / 1608444) [(0, 1), (6, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-18705487 : Rat) / 3216888) [(0, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((18705487 : Rat) / 1608444) [(1, 1), (7, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-18705487 : Rat) / 3216888) [(1, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-18705487 : Rat) / 1608444) [(2, 1), (6, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((18705487 : Rat) / 3216888) [(2, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-18705487 : Rat) / 1608444) [(3, 1), (7, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((18705487 : Rat) / 3216888) [(3, 2), (8, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 17. -/
theorem rs_R003_ueqv_R003NN_partial_17_0031_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_17_0031
        rs_R003_ueqv_R003NN_generator_17_0000_0046 =
      rs_R003_ueqv_R003NN_partial_17_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 17. -/
def rs_R003_ueqv_R003NN_coefficient_17_0032 : Poly :=
[
  term ((3079121 : Rat) / 804222) [(8, 1), (15, 2), (16, 1)]
]

/-- Partial product 32 for generator 17. -/
def rs_R003_ueqv_R003NN_partial_17_0032 : Poly :=
[
  term ((-3079121 : Rat) / 402111) [(0, 1), (6, 1), (8, 1), (15, 2), (16, 1)],
  term ((3079121 : Rat) / 804222) [(0, 2), (8, 1), (15, 2), (16, 1)],
  term ((-3079121 : Rat) / 402111) [(1, 1), (7, 1), (8, 1), (15, 2), (16, 1)],
  term ((3079121 : Rat) / 804222) [(1, 2), (8, 1), (15, 2), (16, 1)],
  term ((3079121 : Rat) / 402111) [(2, 1), (6, 1), (8, 1), (15, 2), (16, 1)],
  term ((-3079121 : Rat) / 804222) [(2, 2), (8, 1), (15, 2), (16, 1)],
  term ((3079121 : Rat) / 402111) [(3, 1), (7, 1), (8, 1), (15, 2), (16, 1)],
  term ((-3079121 : Rat) / 804222) [(3, 2), (8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 17. -/
theorem rs_R003_ueqv_R003NN_partial_17_0032_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_17_0032
        rs_R003_ueqv_R003NN_generator_17_0000_0046 =
      rs_R003_ueqv_R003NN_partial_17_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 17. -/
def rs_R003_ueqv_R003NN_coefficient_17_0033 : Poly :=
[
  term (96 : Rat) [(9, 1), (13, 1)]
]

/-- Partial product 33 for generator 17. -/
def rs_R003_ueqv_R003NN_partial_17_0033 : Poly :=
[
  term (-192 : Rat) [(0, 1), (6, 1), (9, 1), (13, 1)],
  term (96 : Rat) [(0, 2), (9, 1), (13, 1)],
  term (-192 : Rat) [(1, 1), (7, 1), (9, 1), (13, 1)],
  term (96 : Rat) [(1, 2), (9, 1), (13, 1)],
  term (192 : Rat) [(2, 1), (6, 1), (9, 1), (13, 1)],
  term (-96 : Rat) [(2, 2), (9, 1), (13, 1)],
  term (192 : Rat) [(3, 1), (7, 1), (9, 1), (13, 1)],
  term (-96 : Rat) [(3, 2), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 17. -/
theorem rs_R003_ueqv_R003NN_partial_17_0033_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_17_0033
        rs_R003_ueqv_R003NN_generator_17_0000_0046 =
      rs_R003_ueqv_R003NN_partial_17_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 17. -/
def rs_R003_ueqv_R003NN_coefficient_17_0034 : Poly :=
[
  term ((-128807 : Rat) / 44679) [(9, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 34 for generator 17. -/
def rs_R003_ueqv_R003NN_partial_17_0034 : Poly :=
[
  term ((257614 : Rat) / 44679) [(0, 1), (6, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-128807 : Rat) / 44679) [(0, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((257614 : Rat) / 44679) [(1, 1), (7, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-128807 : Rat) / 44679) [(1, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-257614 : Rat) / 44679) [(2, 1), (6, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((128807 : Rat) / 44679) [(2, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-257614 : Rat) / 44679) [(3, 1), (7, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((128807 : Rat) / 44679) [(3, 2), (9, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 17. -/
theorem rs_R003_ueqv_R003NN_partial_17_0034_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_17_0034
        rs_R003_ueqv_R003NN_generator_17_0000_0046 =
      rs_R003_ueqv_R003NN_partial_17_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 17. -/
def rs_R003_ueqv_R003NN_coefficient_17_0035 : Poly :=
[
  term ((-18565 : Rat) / 536148) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 35 for generator 17. -/
def rs_R003_ueqv_R003NN_partial_17_0035 : Poly :=
[
  term ((18565 : Rat) / 268074) [(0, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-18565 : Rat) / 536148) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((18565 : Rat) / 268074) [(1, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-18565 : Rat) / 536148) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term ((-18565 : Rat) / 268074) [(2, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((18565 : Rat) / 536148) [(2, 2), (9, 1), (15, 1), (16, 1)],
  term ((-18565 : Rat) / 268074) [(3, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((18565 : Rat) / 536148) [(3, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 17. -/
theorem rs_R003_ueqv_R003NN_partial_17_0035_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_17_0035
        rs_R003_ueqv_R003NN_generator_17_0000_0046 =
      rs_R003_ueqv_R003NN_partial_17_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 17. -/
def rs_R003_ueqv_R003NN_coefficient_17_0036 : Poly :=
[
  term (-48 : Rat) [(11, 1), (15, 1)]
]

/-- Partial product 36 for generator 17. -/
def rs_R003_ueqv_R003NN_partial_17_0036 : Poly :=
[
  term (96 : Rat) [(0, 1), (6, 1), (11, 1), (15, 1)],
  term (-48 : Rat) [(0, 2), (11, 1), (15, 1)],
  term (96 : Rat) [(1, 1), (7, 1), (11, 1), (15, 1)],
  term (-48 : Rat) [(1, 2), (11, 1), (15, 1)],
  term (-96 : Rat) [(2, 1), (6, 1), (11, 1), (15, 1)],
  term (48 : Rat) [(2, 2), (11, 1), (15, 1)],
  term (-96 : Rat) [(3, 1), (7, 1), (11, 1), (15, 1)],
  term (48 : Rat) [(3, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 17. -/
theorem rs_R003_ueqv_R003NN_partial_17_0036_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_17_0036
        rs_R003_ueqv_R003NN_generator_17_0000_0046 =
      rs_R003_ueqv_R003NN_partial_17_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 17. -/
def rs_R003_ueqv_R003NN_coefficient_17_0037 : Poly :=
[
  term ((-938851 : Rat) / 6433776) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 37 for generator 17. -/
def rs_R003_ueqv_R003NN_partial_17_0037 : Poly :=
[
  term ((938851 : Rat) / 3216888) [(0, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-938851 : Rat) / 6433776) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((938851 : Rat) / 3216888) [(1, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-938851 : Rat) / 6433776) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((-938851 : Rat) / 3216888) [(2, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((938851 : Rat) / 6433776) [(2, 2), (11, 1), (15, 1), (16, 1)],
  term ((-938851 : Rat) / 3216888) [(3, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((938851 : Rat) / 6433776) [(3, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 17. -/
theorem rs_R003_ueqv_R003NN_partial_17_0037_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_17_0037
        rs_R003_ueqv_R003NN_generator_17_0000_0046 =
      rs_R003_ueqv_R003NN_partial_17_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 17. -/
def rs_R003_ueqv_R003NN_coefficient_17_0038 : Poly :=
[
  term ((128807 : Rat) / 89358) [(11, 1), (15, 3), (16, 1)]
]

/-- Partial product 38 for generator 17. -/
def rs_R003_ueqv_R003NN_partial_17_0038 : Poly :=
[
  term ((-128807 : Rat) / 44679) [(0, 1), (6, 1), (11, 1), (15, 3), (16, 1)],
  term ((128807 : Rat) / 89358) [(0, 2), (11, 1), (15, 3), (16, 1)],
  term ((-128807 : Rat) / 44679) [(1, 1), (7, 1), (11, 1), (15, 3), (16, 1)],
  term ((128807 : Rat) / 89358) [(1, 2), (11, 1), (15, 3), (16, 1)],
  term ((128807 : Rat) / 44679) [(2, 1), (6, 1), (11, 1), (15, 3), (16, 1)],
  term ((-128807 : Rat) / 89358) [(2, 2), (11, 1), (15, 3), (16, 1)],
  term ((128807 : Rat) / 44679) [(3, 1), (7, 1), (11, 1), (15, 3), (16, 1)],
  term ((-128807 : Rat) / 89358) [(3, 2), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 17. -/
theorem rs_R003_ueqv_R003NN_partial_17_0038_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_17_0038
        rs_R003_ueqv_R003NN_generator_17_0000_0046 =
      rs_R003_ueqv_R003NN_partial_17_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 17. -/
def rs_R003_ueqv_R003NN_coefficient_17_0039 : Poly :=
[
  term ((-213379 : Rat) / 268074) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 39 for generator 17. -/
def rs_R003_ueqv_R003NN_partial_17_0039 : Poly :=
[
  term ((213379 : Rat) / 134037) [(0, 1), (6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-213379 : Rat) / 268074) [(0, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((213379 : Rat) / 134037) [(1, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-213379 : Rat) / 268074) [(1, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-213379 : Rat) / 134037) [(2, 1), (6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((213379 : Rat) / 268074) [(2, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-213379 : Rat) / 134037) [(3, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((213379 : Rat) / 268074) [(3, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 17. -/
theorem rs_R003_ueqv_R003NN_partial_17_0039_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_17_0039
        rs_R003_ueqv_R003NN_generator_17_0000_0046 =
      rs_R003_ueqv_R003NN_partial_17_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 17. -/
def rs_R003_ueqv_R003NN_coefficient_17_0040 : Poly :=
[
  term (-120 : Rat) [(13, 1), (15, 1)]
]

/-- Partial product 40 for generator 17. -/
def rs_R003_ueqv_R003NN_partial_17_0040 : Poly :=
[
  term (240 : Rat) [(0, 1), (6, 1), (13, 1), (15, 1)],
  term (-120 : Rat) [(0, 2), (13, 1), (15, 1)],
  term (240 : Rat) [(1, 1), (7, 1), (13, 1), (15, 1)],
  term (-120 : Rat) [(1, 2), (13, 1), (15, 1)],
  term (-240 : Rat) [(2, 1), (6, 1), (13, 1), (15, 1)],
  term (120 : Rat) [(2, 2), (13, 1), (15, 1)],
  term (-240 : Rat) [(3, 1), (7, 1), (13, 1), (15, 1)],
  term (120 : Rat) [(3, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 17. -/
theorem rs_R003_ueqv_R003NN_partial_17_0040_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_17_0040
        rs_R003_ueqv_R003NN_generator_17_0000_0046 =
      rs_R003_ueqv_R003NN_partial_17_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 17. -/
def rs_R003_ueqv_R003NN_coefficient_17_0041 : Poly :=
[
  term ((52832167 : Rat) / 12867552) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 41 for generator 17. -/
def rs_R003_ueqv_R003NN_partial_17_0041 : Poly :=
[
  term ((-52832167 : Rat) / 6433776) [(0, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((52832167 : Rat) / 12867552) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((-52832167 : Rat) / 6433776) [(1, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((52832167 : Rat) / 12867552) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((52832167 : Rat) / 6433776) [(2, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-52832167 : Rat) / 12867552) [(2, 2), (13, 1), (15, 1), (16, 1)],
  term ((52832167 : Rat) / 6433776) [(3, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-52832167 : Rat) / 12867552) [(3, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 17. -/
theorem rs_R003_ueqv_R003NN_partial_17_0041_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_17_0041
        rs_R003_ueqv_R003NN_generator_17_0000_0046 =
      rs_R003_ueqv_R003NN_partial_17_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 17. -/
def rs_R003_ueqv_R003NN_coefficient_17_0042 : Poly :=
[
  term ((3735403 : Rat) / 1072296) [(13, 1), (15, 3), (16, 1)]
]

/-- Partial product 42 for generator 17. -/
def rs_R003_ueqv_R003NN_partial_17_0042 : Poly :=
[
  term ((-3735403 : Rat) / 536148) [(0, 1), (6, 1), (13, 1), (15, 3), (16, 1)],
  term ((3735403 : Rat) / 1072296) [(0, 2), (13, 1), (15, 3), (16, 1)],
  term ((-3735403 : Rat) / 536148) [(1, 1), (7, 1), (13, 1), (15, 3), (16, 1)],
  term ((3735403 : Rat) / 1072296) [(1, 2), (13, 1), (15, 3), (16, 1)],
  term ((3735403 : Rat) / 536148) [(2, 1), (6, 1), (13, 1), (15, 3), (16, 1)],
  term ((-3735403 : Rat) / 1072296) [(2, 2), (13, 1), (15, 3), (16, 1)],
  term ((3735403 : Rat) / 536148) [(3, 1), (7, 1), (13, 1), (15, 3), (16, 1)],
  term ((-3735403 : Rat) / 1072296) [(3, 2), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 17. -/
theorem rs_R003_ueqv_R003NN_partial_17_0042_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_17_0042
        rs_R003_ueqv_R003NN_generator_17_0000_0046 =
      rs_R003_ueqv_R003NN_partial_17_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 17. -/
def rs_R003_ueqv_R003NN_coefficient_17_0043 : Poly :=
[
  term ((128807 : Rat) / 536148) [(13, 2), (15, 2), (16, 1)]
]

/-- Partial product 43 for generator 17. -/
def rs_R003_ueqv_R003NN_partial_17_0043 : Poly :=
[
  term ((-128807 : Rat) / 268074) [(0, 1), (6, 1), (13, 2), (15, 2), (16, 1)],
  term ((128807 : Rat) / 536148) [(0, 2), (13, 2), (15, 2), (16, 1)],
  term ((-128807 : Rat) / 268074) [(1, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((128807 : Rat) / 536148) [(1, 2), (13, 2), (15, 2), (16, 1)],
  term ((128807 : Rat) / 268074) [(2, 1), (6, 1), (13, 2), (15, 2), (16, 1)],
  term ((-128807 : Rat) / 536148) [(2, 2), (13, 2), (15, 2), (16, 1)],
  term ((128807 : Rat) / 268074) [(3, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((-128807 : Rat) / 536148) [(3, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 17. -/
theorem rs_R003_ueqv_R003NN_partial_17_0043_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_17_0043
        rs_R003_ueqv_R003NN_generator_17_0000_0046 =
      rs_R003_ueqv_R003NN_partial_17_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 17. -/
def rs_R003_ueqv_R003NN_coefficient_17_0044 : Poly :=
[
  term (36 : Rat) [(15, 2)]
]

/-- Partial product 44 for generator 17. -/
def rs_R003_ueqv_R003NN_partial_17_0044 : Poly :=
[
  term (-72 : Rat) [(0, 1), (6, 1), (15, 2)],
  term (36 : Rat) [(0, 2), (15, 2)],
  term (-72 : Rat) [(1, 1), (7, 1), (15, 2)],
  term (36 : Rat) [(1, 2), (15, 2)],
  term (72 : Rat) [(2, 1), (6, 1), (15, 2)],
  term (-36 : Rat) [(2, 2), (15, 2)],
  term (72 : Rat) [(3, 1), (7, 1), (15, 2)],
  term (-36 : Rat) [(3, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 17. -/
theorem rs_R003_ueqv_R003NN_partial_17_0044_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_17_0044
        rs_R003_ueqv_R003NN_generator_17_0000_0046 =
      rs_R003_ueqv_R003NN_partial_17_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 17. -/
def rs_R003_ueqv_R003NN_coefficient_17_0045 : Poly :=
[
  term ((-29094907 : Rat) / 12867552) [(15, 2), (16, 1)]
]

/-- Partial product 45 for generator 17. -/
def rs_R003_ueqv_R003NN_partial_17_0045 : Poly :=
[
  term ((29094907 : Rat) / 6433776) [(0, 1), (6, 1), (15, 2), (16, 1)],
  term ((-29094907 : Rat) / 12867552) [(0, 2), (15, 2), (16, 1)],
  term ((29094907 : Rat) / 6433776) [(1, 1), (7, 1), (15, 2), (16, 1)],
  term ((-29094907 : Rat) / 12867552) [(1, 2), (15, 2), (16, 1)],
  term ((-29094907 : Rat) / 6433776) [(2, 1), (6, 1), (15, 2), (16, 1)],
  term ((29094907 : Rat) / 12867552) [(2, 2), (15, 2), (16, 1)],
  term ((-29094907 : Rat) / 6433776) [(3, 1), (7, 1), (15, 2), (16, 1)],
  term ((29094907 : Rat) / 12867552) [(3, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 17. -/
theorem rs_R003_ueqv_R003NN_partial_17_0045_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_17_0045
        rs_R003_ueqv_R003NN_generator_17_0000_0046 =
      rs_R003_ueqv_R003NN_partial_17_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 17. -/
def rs_R003_ueqv_R003NN_coefficient_17_0046 : Poly :=
[
  term ((-128807 : Rat) / 119144) [(15, 4), (16, 1)]
]

/-- Partial product 46 for generator 17. -/
def rs_R003_ueqv_R003NN_partial_17_0046 : Poly :=
[
  term ((128807 : Rat) / 59572) [(0, 1), (6, 1), (15, 4), (16, 1)],
  term ((-128807 : Rat) / 119144) [(0, 2), (15, 4), (16, 1)],
  term ((128807 : Rat) / 59572) [(1, 1), (7, 1), (15, 4), (16, 1)],
  term ((-128807 : Rat) / 119144) [(1, 2), (15, 4), (16, 1)],
  term ((-128807 : Rat) / 59572) [(2, 1), (6, 1), (15, 4), (16, 1)],
  term ((128807 : Rat) / 119144) [(2, 2), (15, 4), (16, 1)],
  term ((-128807 : Rat) / 59572) [(3, 1), (7, 1), (15, 4), (16, 1)],
  term ((128807 : Rat) / 119144) [(3, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 17. -/
theorem rs_R003_ueqv_R003NN_partial_17_0046_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_17_0046
        rs_R003_ueqv_R003NN_generator_17_0000_0046 =
      rs_R003_ueqv_R003NN_partial_17_0046 := by
  native_decide

/-- Partial products in this block. -/
def rs_R003_ueqv_R003NN_partials_17_0000_0046 : List Poly :=
[
  rs_R003_ueqv_R003NN_partial_17_0000,
  rs_R003_ueqv_R003NN_partial_17_0001,
  rs_R003_ueqv_R003NN_partial_17_0002,
  rs_R003_ueqv_R003NN_partial_17_0003,
  rs_R003_ueqv_R003NN_partial_17_0004,
  rs_R003_ueqv_R003NN_partial_17_0005,
  rs_R003_ueqv_R003NN_partial_17_0006,
  rs_R003_ueqv_R003NN_partial_17_0007,
  rs_R003_ueqv_R003NN_partial_17_0008,
  rs_R003_ueqv_R003NN_partial_17_0009,
  rs_R003_ueqv_R003NN_partial_17_0010,
  rs_R003_ueqv_R003NN_partial_17_0011,
  rs_R003_ueqv_R003NN_partial_17_0012,
  rs_R003_ueqv_R003NN_partial_17_0013,
  rs_R003_ueqv_R003NN_partial_17_0014,
  rs_R003_ueqv_R003NN_partial_17_0015,
  rs_R003_ueqv_R003NN_partial_17_0016,
  rs_R003_ueqv_R003NN_partial_17_0017,
  rs_R003_ueqv_R003NN_partial_17_0018,
  rs_R003_ueqv_R003NN_partial_17_0019,
  rs_R003_ueqv_R003NN_partial_17_0020,
  rs_R003_ueqv_R003NN_partial_17_0021,
  rs_R003_ueqv_R003NN_partial_17_0022,
  rs_R003_ueqv_R003NN_partial_17_0023,
  rs_R003_ueqv_R003NN_partial_17_0024,
  rs_R003_ueqv_R003NN_partial_17_0025,
  rs_R003_ueqv_R003NN_partial_17_0026,
  rs_R003_ueqv_R003NN_partial_17_0027,
  rs_R003_ueqv_R003NN_partial_17_0028,
  rs_R003_ueqv_R003NN_partial_17_0029,
  rs_R003_ueqv_R003NN_partial_17_0030,
  rs_R003_ueqv_R003NN_partial_17_0031,
  rs_R003_ueqv_R003NN_partial_17_0032,
  rs_R003_ueqv_R003NN_partial_17_0033,
  rs_R003_ueqv_R003NN_partial_17_0034,
  rs_R003_ueqv_R003NN_partial_17_0035,
  rs_R003_ueqv_R003NN_partial_17_0036,
  rs_R003_ueqv_R003NN_partial_17_0037,
  rs_R003_ueqv_R003NN_partial_17_0038,
  rs_R003_ueqv_R003NN_partial_17_0039,
  rs_R003_ueqv_R003NN_partial_17_0040,
  rs_R003_ueqv_R003NN_partial_17_0041,
  rs_R003_ueqv_R003NN_partial_17_0042,
  rs_R003_ueqv_R003NN_partial_17_0043,
  rs_R003_ueqv_R003NN_partial_17_0044,
  rs_R003_ueqv_R003NN_partial_17_0045,
  rs_R003_ueqv_R003NN_partial_17_0046
]

/-- Sum of partial products in this block. -/
def rs_R003_ueqv_R003NN_block_17_0000_0046 : Poly :=
[
  term ((109403 : Rat) / 89358) [(0, 1), (1, 1), (2, 1), (6, 1), (15, 1), (16, 1)],
  term ((-109403 : Rat) / 89358) [(0, 1), (1, 1), (3, 1), (7, 1), (15, 1), (16, 1)],
  term ((62561 : Rat) / 44679) [(0, 1), (1, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-109403 : Rat) / 178716) [(0, 1), (1, 1), (6, 1), (15, 1), (16, 1)],
  term ((-62561 : Rat) / 89358) [(0, 1), (1, 1), (6, 2), (15, 1), (16, 1)],
  term ((-6856 : Rat) / 134037) [(0, 1), (1, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((506549 : Rat) / 268074) [(0, 1), (1, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-99701 : Rat) / 44679) [(0, 1), (1, 1), (7, 1), (15, 2), (16, 1)],
  term ((62561 : Rat) / 89358) [(0, 1), (1, 1), (7, 2), (15, 1), (16, 1)],
  term ((109403 : Rat) / 178716) [(0, 1), (1, 2), (3, 1), (15, 1), (16, 1)],
  term ((-62561 : Rat) / 178716) [(0, 1), (1, 2), (7, 1), (15, 1), (16, 1)],
  term ((3428 : Rat) / 134037) [(0, 1), (1, 2), (11, 1), (15, 1), (16, 1)],
  term ((-506549 : Rat) / 536148) [(0, 1), (1, 2), (13, 1), (15, 1), (16, 1)],
  term ((99701 : Rat) / 89358) [(0, 1), (1, 2), (15, 2), (16, 1)],
  term ((109403 : Rat) / 89358) [(0, 1), (2, 1), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((-62561 : Rat) / 89358) [(0, 1), (2, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((6856 : Rat) / 134037) [(0, 1), (2, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-506549 : Rat) / 268074) [(0, 1), (2, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((99701 : Rat) / 44679) [(0, 1), (2, 1), (6, 1), (15, 2), (16, 1)],
  term ((-109403 : Rat) / 178716) [(0, 1), (2, 2), (3, 1), (15, 1), (16, 1)],
  term ((62561 : Rat) / 178716) [(0, 1), (2, 2), (7, 1), (15, 1), (16, 1)],
  term ((-3428 : Rat) / 134037) [(0, 1), (2, 2), (11, 1), (15, 1), (16, 1)],
  term ((506549 : Rat) / 536148) [(0, 1), (2, 2), (13, 1), (15, 1), (16, 1)],
  term ((-99701 : Rat) / 89358) [(0, 1), (2, 2), (15, 2), (16, 1)],
  term ((27424 : Rat) / 44679) [(0, 1), (3, 1), (6, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-13712 : Rat) / 44679) [(0, 1), (3, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((-34280 : Rat) / 44679) [(0, 1), (3, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((-857 : Rat) / 14893) [(0, 1), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((3428 : Rat) / 14893) [(0, 1), (3, 1), (6, 1), (15, 3), (16, 1)],
  term ((6856 : Rat) / 134037) [(0, 1), (3, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-506549 : Rat) / 268074) [(0, 1), (3, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((99701 : Rat) / 44679) [(0, 1), (3, 1), (7, 1), (15, 2), (16, 1)],
  term ((-62561 : Rat) / 89358) [(0, 1), (3, 1), (7, 2), (15, 1), (16, 1)],
  term ((93789 : Rat) / 59572) [(0, 1), (3, 2), (7, 1), (15, 1), (16, 1)],
  term ((-3428 : Rat) / 134037) [(0, 1), (3, 2), (11, 1), (15, 1), (16, 1)],
  term ((506549 : Rat) / 536148) [(0, 1), (3, 2), (13, 1), (15, 1), (16, 1)],
  term ((-99701 : Rat) / 89358) [(0, 1), (3, 2), (15, 2), (16, 1)],
  term ((-109403 : Rat) / 178716) [(0, 1), (3, 3), (15, 1), (16, 1)],
  term ((-199667 : Rat) / 268074) [(0, 1), (4, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((35420 : Rat) / 14893) [(0, 1), (4, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((199667 : Rat) / 134037) [(0, 1), (4, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-17710 : Rat) / 14893) [(0, 1), (4, 1), (6, 1), (15, 2), (16, 1)],
  term ((198808 : Rat) / 134037) [(0, 1), (5, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-199667 : Rat) / 134037) [(0, 1), (5, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-99404 : Rat) / 134037) [(0, 1), (5, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((199667 : Rat) / 268074) [(0, 1), (5, 1), (6, 2), (15, 1), (16, 1)],
  term (18 : Rat) [(0, 1), (6, 1)],
  term ((-62561 : Rat) / 89358) [(0, 1), (6, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((128807 : Rat) / 89358) [(0, 1), (6, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((1593181 : Rat) / 2144592) [(0, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-128807 : Rat) / 178716) [(0, 1), (6, 1), (7, 1), (15, 3), (16, 1)],
  term ((1180595 : Rat) / 536148) [(0, 1), (6, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((18705487 : Rat) / 1608444) [(0, 1), (6, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3079121 : Rat) / 402111) [(0, 1), (6, 1), (8, 1), (15, 2), (16, 1)],
  term (-192 : Rat) [(0, 1), (6, 1), (9, 1), (13, 1)],
  term ((257614 : Rat) / 44679) [(0, 1), (6, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((18565 : Rat) / 268074) [(0, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term (96 : Rat) [(0, 1), (6, 1), (11, 1), (15, 1)],
  term ((938851 : Rat) / 3216888) [(0, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-128807 : Rat) / 44679) [(0, 1), (6, 1), (11, 1), (15, 3), (16, 1)],
  term ((213379 : Rat) / 134037) [(0, 1), (6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term (240 : Rat) [(0, 1), (6, 1), (13, 1), (15, 1)],
  term ((-52832167 : Rat) / 6433776) [(0, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3735403 : Rat) / 536148) [(0, 1), (6, 1), (13, 1), (15, 3), (16, 1)],
  term ((-128807 : Rat) / 268074) [(0, 1), (6, 1), (13, 2), (15, 2), (16, 1)],
  term (-72 : Rat) [(0, 1), (6, 1), (15, 2)],
  term ((29094907 : Rat) / 6433776) [(0, 1), (6, 1), (15, 2), (16, 1)],
  term ((128807 : Rat) / 59572) [(0, 1), (6, 1), (15, 4), (16, 1)],
  term ((3428 : Rat) / 44679) [(0, 1), (6, 2), (11, 1), (15, 1), (16, 1)],
  term ((-289619 : Rat) / 134037) [(0, 1), (6, 2), (13, 1), (15, 1), (16, 1)],
  term ((273343 : Rat) / 268074) [(0, 1), (6, 2), (15, 2), (16, 1)],
  term (-9 : Rat) [(0, 2)],
  term ((-109403 : Rat) / 178716) [(0, 2), (1, 1), (2, 1), (15, 1), (16, 1)],
  term ((62561 : Rat) / 178716) [(0, 2), (1, 1), (6, 1), (15, 1), (16, 1)],
  term ((-62561 : Rat) / 89358) [(0, 2), (1, 1), (12, 1), (15, 1), (16, 1)],
  term ((109403 : Rat) / 357432) [(0, 2), (1, 1), (15, 1), (16, 1)],
  term ((-109403 : Rat) / 89358) [(0, 2), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((-13712 : Rat) / 44679) [(0, 2), (3, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((6856 : Rat) / 44679) [(0, 2), (3, 1), (11, 1), (15, 2), (16, 1)],
  term ((17140 : Rat) / 44679) [(0, 2), (3, 1), (13, 1), (15, 2), (16, 1)],
  term ((857 : Rat) / 29786) [(0, 2), (3, 1), (15, 1), (16, 1)],
  term ((-1714 : Rat) / 14893) [(0, 2), (3, 1), (15, 3), (16, 1)],
  term ((199667 : Rat) / 536148) [(0, 2), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((-17710 : Rat) / 14893) [(0, 2), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((-199667 : Rat) / 268074) [(0, 2), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((8855 : Rat) / 14893) [(0, 2), (4, 1), (15, 2), (16, 1)],
  term ((-199667 : Rat) / 536148) [(0, 2), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-99404 : Rat) / 134037) [(0, 2), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((199667 : Rat) / 268074) [(0, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((49702 : Rat) / 134037) [(0, 2), (5, 1), (13, 1), (15, 2), (16, 1)],
  term ((62561 : Rat) / 89358) [(0, 2), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-11998 : Rat) / 134037) [(0, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((398084 : Rat) / 134037) [(0, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1469755 : Rat) / 536148) [(0, 2), (6, 1), (15, 2), (16, 1)],
  term ((62561 : Rat) / 178716) [(0, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-128807 : Rat) / 178716) [(0, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1593181 : Rat) / 4289184) [(0, 2), (7, 1), (15, 1), (16, 1)],
  term ((128807 : Rat) / 357432) [(0, 2), (7, 1), (15, 3), (16, 1)],
  term ((-1180595 : Rat) / 1072296) [(0, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-18705487 : Rat) / 3216888) [(0, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((3079121 : Rat) / 804222) [(0, 2), (8, 1), (15, 2), (16, 1)],
  term (96 : Rat) [(0, 2), (9, 1), (13, 1)],
  term ((-128807 : Rat) / 44679) [(0, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-18565 : Rat) / 536148) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term (-48 : Rat) [(0, 2), (11, 1), (15, 1)],
  term ((-938851 : Rat) / 6433776) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((128807 : Rat) / 89358) [(0, 2), (11, 1), (15, 3), (16, 1)],
  term ((-213379 : Rat) / 268074) [(0, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term (-120 : Rat) [(0, 2), (13, 1), (15, 1)],
  term ((52832167 : Rat) / 12867552) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((3735403 : Rat) / 1072296) [(0, 2), (13, 1), (15, 3), (16, 1)],
  term ((128807 : Rat) / 536148) [(0, 2), (13, 2), (15, 2), (16, 1)],
  term (36 : Rat) [(0, 2), (15, 2)],
  term ((-29094907 : Rat) / 12867552) [(0, 2), (15, 2), (16, 1)],
  term ((-128807 : Rat) / 119144) [(0, 2), (15, 4), (16, 1)],
  term ((109403 : Rat) / 178716) [(0, 3), (3, 1), (15, 1), (16, 1)],
  term ((-62561 : Rat) / 178716) [(0, 3), (7, 1), (15, 1), (16, 1)],
  term ((3428 : Rat) / 134037) [(0, 3), (11, 1), (15, 1), (16, 1)],
  term ((-506549 : Rat) / 536148) [(0, 3), (13, 1), (15, 1), (16, 1)],
  term ((99701 : Rat) / 89358) [(0, 3), (15, 2), (16, 1)],
  term ((-109403 : Rat) / 89358) [(1, 1), (2, 1), (3, 1), (7, 1), (15, 1), (16, 1)],
  term ((109403 : Rat) / 178716) [(1, 1), (2, 1), (3, 2), (15, 1), (16, 1)],
  term ((-62561 : Rat) / 44679) [(1, 1), (2, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((109403 : Rat) / 178716) [(1, 1), (2, 1), (6, 1), (15, 1), (16, 1)],
  term ((62561 : Rat) / 89358) [(1, 1), (2, 1), (6, 2), (15, 1), (16, 1)],
  term ((-93789 : Rat) / 59572) [(1, 1), (2, 2), (6, 1), (15, 1), (16, 1)],
  term ((62561 : Rat) / 89358) [(1, 1), (2, 2), (12, 1), (15, 1), (16, 1)],
  term ((-109403 : Rat) / 357432) [(1, 1), (2, 2), (15, 1), (16, 1)],
  term ((109403 : Rat) / 178716) [(1, 1), (2, 3), (15, 1), (16, 1)],
  term ((62561 : Rat) / 89358) [(1, 1), (3, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((27424 : Rat) / 44679) [(1, 1), (3, 1), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-13712 : Rat) / 44679) [(1, 1), (3, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((-62561 : Rat) / 44679) [(1, 1), (3, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-34280 : Rat) / 44679) [(1, 1), (3, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((99119 : Rat) / 178716) [(1, 1), (3, 1), (7, 1), (15, 1), (16, 1)],
  term ((3428 : Rat) / 14893) [(1, 1), (3, 1), (7, 1), (15, 3), (16, 1)],
  term ((-62561 : Rat) / 178716) [(1, 1), (3, 2), (6, 1), (15, 1), (16, 1)],
  term ((62561 : Rat) / 89358) [(1, 1), (3, 2), (12, 1), (15, 1), (16, 1)],
  term ((-109403 : Rat) / 357432) [(1, 1), (3, 2), (15, 1), (16, 1)],
  term ((35420 : Rat) / 14893) [(1, 1), (4, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((199667 : Rat) / 134037) [(1, 1), (4, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-17710 : Rat) / 14893) [(1, 1), (4, 1), (7, 1), (15, 2), (16, 1)],
  term ((-199667 : Rat) / 268074) [(1, 1), (4, 1), (7, 2), (15, 1), (16, 1)],
  term ((199667 : Rat) / 268074) [(1, 1), (5, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((198808 : Rat) / 134037) [(1, 1), (5, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-199667 : Rat) / 134037) [(1, 1), (5, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-99404 : Rat) / 134037) [(1, 1), (5, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((3428 : Rat) / 44679) [(1, 1), (6, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-289619 : Rat) / 134037) [(1, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((273343 : Rat) / 268074) [(1, 1), (6, 1), (7, 1), (15, 2), (16, 1)],
  term (18 : Rat) [(1, 1), (7, 1)],
  term ((1180595 : Rat) / 536148) [(1, 1), (7, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((18705487 : Rat) / 1608444) [(1, 1), (7, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3079121 : Rat) / 402111) [(1, 1), (7, 1), (8, 1), (15, 2), (16, 1)],
  term (-192 : Rat) [(1, 1), (7, 1), (9, 1), (13, 1)],
  term ((257614 : Rat) / 44679) [(1, 1), (7, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((18565 : Rat) / 268074) [(1, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term (96 : Rat) [(1, 1), (7, 1), (11, 1), (15, 1)],
  term ((938851 : Rat) / 3216888) [(1, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-128807 : Rat) / 44679) [(1, 1), (7, 1), (11, 1), (15, 3), (16, 1)],
  term ((213379 : Rat) / 134037) [(1, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term (240 : Rat) [(1, 1), (7, 1), (13, 1), (15, 1)],
  term ((-52832167 : Rat) / 6433776) [(1, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3735403 : Rat) / 536148) [(1, 1), (7, 1), (13, 1), (15, 3), (16, 1)],
  term ((-128807 : Rat) / 268074) [(1, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term (-72 : Rat) [(1, 1), (7, 1), (15, 2)],
  term ((29094907 : Rat) / 6433776) [(1, 1), (7, 1), (15, 2), (16, 1)],
  term ((128807 : Rat) / 59572) [(1, 1), (7, 1), (15, 4), (16, 1)],
  term ((-62561 : Rat) / 89358) [(1, 1), (7, 2), (12, 1), (15, 1), (16, 1)],
  term ((128807 : Rat) / 89358) [(1, 1), (7, 2), (13, 1), (15, 2), (16, 1)],
  term ((1593181 : Rat) / 2144592) [(1, 1), (7, 2), (15, 1), (16, 1)],
  term ((-128807 : Rat) / 178716) [(1, 1), (7, 2), (15, 3), (16, 1)],
  term (-9 : Rat) [(1, 2)],
  term ((109403 : Rat) / 89358) [(1, 2), (2, 1), (7, 1), (15, 1), (16, 1)],
  term ((-13712 : Rat) / 44679) [(1, 2), (3, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((6856 : Rat) / 44679) [(1, 2), (3, 1), (11, 1), (15, 2), (16, 1)],
  term ((17140 : Rat) / 44679) [(1, 2), (3, 1), (13, 1), (15, 2), (16, 1)],
  term ((857 : Rat) / 29786) [(1, 2), (3, 1), (15, 1), (16, 1)],
  term ((-1714 : Rat) / 14893) [(1, 2), (3, 1), (15, 3), (16, 1)],
  term ((199667 : Rat) / 536148) [(1, 2), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((-17710 : Rat) / 14893) [(1, 2), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((-199667 : Rat) / 268074) [(1, 2), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((8855 : Rat) / 14893) [(1, 2), (4, 1), (15, 2), (16, 1)],
  term ((-199667 : Rat) / 536148) [(1, 2), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-99404 : Rat) / 134037) [(1, 2), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((199667 : Rat) / 268074) [(1, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((49702 : Rat) / 134037) [(1, 2), (5, 1), (13, 1), (15, 2), (16, 1)],
  term ((-62561 : Rat) / 89358) [(1, 2), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-1714 : Rat) / 44679) [(1, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((289619 : Rat) / 268074) [(1, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-273343 : Rat) / 536148) [(1, 2), (6, 1), (15, 2), (16, 1)],
  term ((312805 : Rat) / 178716) [(1, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-128807 : Rat) / 178716) [(1, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-79601 : Rat) / 80928) [(1, 2), (7, 1), (15, 1), (16, 1)],
  term ((128807 : Rat) / 357432) [(1, 2), (7, 1), (15, 3), (16, 1)],
  term ((-1180595 : Rat) / 1072296) [(1, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-18705487 : Rat) / 3216888) [(1, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((3079121 : Rat) / 804222) [(1, 2), (8, 1), (15, 2), (16, 1)],
  term (96 : Rat) [(1, 2), (9, 1), (13, 1)],
  term ((-128807 : Rat) / 44679) [(1, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-18565 : Rat) / 536148) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term (-48 : Rat) [(1, 2), (11, 1), (15, 1)],
  term ((-938851 : Rat) / 6433776) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((128807 : Rat) / 89358) [(1, 2), (11, 1), (15, 3), (16, 1)],
  term ((-213379 : Rat) / 268074) [(1, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term (-120 : Rat) [(1, 2), (13, 1), (15, 1)],
  term ((52832167 : Rat) / 12867552) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((3735403 : Rat) / 1072296) [(1, 2), (13, 1), (15, 3), (16, 1)],
  term ((128807 : Rat) / 536148) [(1, 2), (13, 2), (15, 2), (16, 1)],
  term (36 : Rat) [(1, 2), (15, 2)],
  term ((-29094907 : Rat) / 12867552) [(1, 2), (15, 2), (16, 1)],
  term ((-128807 : Rat) / 119144) [(1, 2), (15, 4), (16, 1)],
  term ((-109403 : Rat) / 178716) [(1, 3), (2, 1), (15, 1), (16, 1)],
  term ((62561 : Rat) / 178716) [(1, 3), (6, 1), (15, 1), (16, 1)],
  term ((-62561 : Rat) / 89358) [(1, 3), (12, 1), (15, 1), (16, 1)],
  term ((109403 : Rat) / 357432) [(1, 3), (15, 1), (16, 1)],
  term ((-27424 : Rat) / 44679) [(2, 1), (3, 1), (6, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((13712 : Rat) / 44679) [(2, 1), (3, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((34280 : Rat) / 44679) [(2, 1), (3, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((857 : Rat) / 14893) [(2, 1), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((-3428 : Rat) / 14893) [(2, 1), (3, 1), (6, 1), (15, 3), (16, 1)],
  term ((199667 : Rat) / 268074) [(2, 1), (4, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-35420 : Rat) / 14893) [(2, 1), (4, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-199667 : Rat) / 134037) [(2, 1), (4, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((17710 : Rat) / 14893) [(2, 1), (4, 1), (6, 1), (15, 2), (16, 1)],
  term ((-198808 : Rat) / 134037) [(2, 1), (5, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((199667 : Rat) / 134037) [(2, 1), (5, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((99404 : Rat) / 134037) [(2, 1), (5, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((-199667 : Rat) / 268074) [(2, 1), (5, 1), (6, 2), (15, 1), (16, 1)],
  term (-18 : Rat) [(2, 1), (6, 1)],
  term ((62561 : Rat) / 89358) [(2, 1), (6, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-128807 : Rat) / 89358) [(2, 1), (6, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1593181 : Rat) / 2144592) [(2, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((128807 : Rat) / 178716) [(2, 1), (6, 1), (7, 1), (15, 3), (16, 1)],
  term ((-1180595 : Rat) / 536148) [(2, 1), (6, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-18705487 : Rat) / 1608444) [(2, 1), (6, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((3079121 : Rat) / 402111) [(2, 1), (6, 1), (8, 1), (15, 2), (16, 1)],
  term (192 : Rat) [(2, 1), (6, 1), (9, 1), (13, 1)],
  term ((-257614 : Rat) / 44679) [(2, 1), (6, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-18565 : Rat) / 268074) [(2, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term (-96 : Rat) [(2, 1), (6, 1), (11, 1), (15, 1)],
  term ((-938851 : Rat) / 3216888) [(2, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((128807 : Rat) / 44679) [(2, 1), (6, 1), (11, 1), (15, 3), (16, 1)],
  term ((-213379 : Rat) / 134037) [(2, 1), (6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term (-240 : Rat) [(2, 1), (6, 1), (13, 1), (15, 1)],
  term ((52832167 : Rat) / 6433776) [(2, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((3735403 : Rat) / 536148) [(2, 1), (6, 1), (13, 1), (15, 3), (16, 1)],
  term ((128807 : Rat) / 268074) [(2, 1), (6, 1), (13, 2), (15, 2), (16, 1)],
  term (72 : Rat) [(2, 1), (6, 1), (15, 2)],
  term ((-29094907 : Rat) / 6433776) [(2, 1), (6, 1), (15, 2), (16, 1)],
  term ((-128807 : Rat) / 59572) [(2, 1), (6, 1), (15, 4), (16, 1)],
  term ((-3428 : Rat) / 44679) [(2, 1), (6, 2), (11, 1), (15, 1), (16, 1)],
  term ((289619 : Rat) / 134037) [(2, 1), (6, 2), (13, 1), (15, 1), (16, 1)],
  term ((-273343 : Rat) / 268074) [(2, 1), (6, 2), (15, 2), (16, 1)],
  term (9 : Rat) [(2, 2)],
  term ((13712 : Rat) / 44679) [(2, 2), (3, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-6856 : Rat) / 44679) [(2, 2), (3, 1), (11, 1), (15, 2), (16, 1)],
  term ((-17140 : Rat) / 44679) [(2, 2), (3, 1), (13, 1), (15, 2), (16, 1)],
  term ((-857 : Rat) / 29786) [(2, 2), (3, 1), (15, 1), (16, 1)],
  term ((1714 : Rat) / 14893) [(2, 2), (3, 1), (15, 3), (16, 1)],
  term ((-199667 : Rat) / 536148) [(2, 2), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((17710 : Rat) / 14893) [(2, 2), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((199667 : Rat) / 268074) [(2, 2), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-8855 : Rat) / 14893) [(2, 2), (4, 1), (15, 2), (16, 1)],
  term ((199667 : Rat) / 536148) [(2, 2), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((99404 : Rat) / 134037) [(2, 2), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-199667 : Rat) / 268074) [(2, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-49702 : Rat) / 134037) [(2, 2), (5, 1), (13, 1), (15, 2), (16, 1)],
  term ((1714 : Rat) / 44679) [(2, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-289619 : Rat) / 268074) [(2, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((273343 : Rat) / 536148) [(2, 2), (6, 1), (15, 2), (16, 1)],
  term ((-62561 : Rat) / 178716) [(2, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((128807 : Rat) / 178716) [(2, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((1593181 : Rat) / 4289184) [(2, 2), (7, 1), (15, 1), (16, 1)],
  term ((-128807 : Rat) / 357432) [(2, 2), (7, 1), (15, 3), (16, 1)],
  term ((1180595 : Rat) / 1072296) [(2, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((18705487 : Rat) / 3216888) [(2, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3079121 : Rat) / 804222) [(2, 2), (8, 1), (15, 2), (16, 1)],
  term (-96 : Rat) [(2, 2), (9, 1), (13, 1)],
  term ((128807 : Rat) / 44679) [(2, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((18565 : Rat) / 536148) [(2, 2), (9, 1), (15, 1), (16, 1)],
  term (48 : Rat) [(2, 2), (11, 1), (15, 1)],
  term ((938851 : Rat) / 6433776) [(2, 2), (11, 1), (15, 1), (16, 1)],
  term ((-128807 : Rat) / 89358) [(2, 2), (11, 1), (15, 3), (16, 1)],
  term ((213379 : Rat) / 268074) [(2, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term (120 : Rat) [(2, 2), (13, 1), (15, 1)],
  term ((-52832167 : Rat) / 12867552) [(2, 2), (13, 1), (15, 1), (16, 1)],
  term ((-3735403 : Rat) / 1072296) [(2, 2), (13, 1), (15, 3), (16, 1)],
  term ((-128807 : Rat) / 536148) [(2, 2), (13, 2), (15, 2), (16, 1)],
  term (-36 : Rat) [(2, 2), (15, 2)],
  term ((29094907 : Rat) / 12867552) [(2, 2), (15, 2), (16, 1)],
  term ((128807 : Rat) / 119144) [(2, 2), (15, 4), (16, 1)],
  term ((-35420 : Rat) / 14893) [(3, 1), (4, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-199667 : Rat) / 134037) [(3, 1), (4, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((17710 : Rat) / 14893) [(3, 1), (4, 1), (7, 1), (15, 2), (16, 1)],
  term ((199667 : Rat) / 268074) [(3, 1), (4, 1), (7, 2), (15, 1), (16, 1)],
  term ((-199667 : Rat) / 268074) [(3, 1), (5, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-198808 : Rat) / 134037) [(3, 1), (5, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((199667 : Rat) / 134037) [(3, 1), (5, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((99404 : Rat) / 134037) [(3, 1), (5, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-3428 : Rat) / 44679) [(3, 1), (6, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((289619 : Rat) / 134037) [(3, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-273343 : Rat) / 268074) [(3, 1), (6, 1), (7, 1), (15, 2), (16, 1)],
  term (-18 : Rat) [(3, 1), (7, 1)],
  term ((-1180595 : Rat) / 536148) [(3, 1), (7, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-18705487 : Rat) / 1608444) [(3, 1), (7, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((3079121 : Rat) / 402111) [(3, 1), (7, 1), (8, 1), (15, 2), (16, 1)],
  term (192 : Rat) [(3, 1), (7, 1), (9, 1), (13, 1)],
  term ((-257614 : Rat) / 44679) [(3, 1), (7, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-18565 : Rat) / 268074) [(3, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term (-96 : Rat) [(3, 1), (7, 1), (11, 1), (15, 1)],
  term ((-938851 : Rat) / 3216888) [(3, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((128807 : Rat) / 44679) [(3, 1), (7, 1), (11, 1), (15, 3), (16, 1)],
  term ((-213379 : Rat) / 134037) [(3, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term (-240 : Rat) [(3, 1), (7, 1), (13, 1), (15, 1)],
  term ((52832167 : Rat) / 6433776) [(3, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((3735403 : Rat) / 536148) [(3, 1), (7, 1), (13, 1), (15, 3), (16, 1)],
  term ((128807 : Rat) / 268074) [(3, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term (72 : Rat) [(3, 1), (7, 1), (15, 2)],
  term ((-29094907 : Rat) / 6433776) [(3, 1), (7, 1), (15, 2), (16, 1)],
  term ((-128807 : Rat) / 59572) [(3, 1), (7, 1), (15, 4), (16, 1)],
  term ((62561 : Rat) / 89358) [(3, 1), (7, 2), (12, 1), (15, 1), (16, 1)],
  term ((-128807 : Rat) / 89358) [(3, 1), (7, 2), (13, 1), (15, 2), (16, 1)],
  term ((-1593181 : Rat) / 2144592) [(3, 1), (7, 2), (15, 1), (16, 1)],
  term ((128807 : Rat) / 178716) [(3, 1), (7, 2), (15, 3), (16, 1)],
  term (9 : Rat) [(3, 2)],
  term ((-199667 : Rat) / 536148) [(3, 2), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((17710 : Rat) / 14893) [(3, 2), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((199667 : Rat) / 268074) [(3, 2), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-8855 : Rat) / 14893) [(3, 2), (4, 1), (15, 2), (16, 1)],
  term ((199667 : Rat) / 536148) [(3, 2), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((99404 : Rat) / 134037) [(3, 2), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-199667 : Rat) / 268074) [(3, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-49702 : Rat) / 134037) [(3, 2), (5, 1), (13, 1), (15, 2), (16, 1)],
  term ((1714 : Rat) / 44679) [(3, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-289619 : Rat) / 268074) [(3, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((273343 : Rat) / 536148) [(3, 2), (6, 1), (15, 2), (16, 1)],
  term ((-27424 : Rat) / 44679) [(3, 2), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((13712 : Rat) / 44679) [(3, 2), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((-62561 : Rat) / 178716) [(3, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((265927 : Rat) / 178716) [(3, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((1839997 : Rat) / 4289184) [(3, 2), (7, 1), (15, 1), (16, 1)],
  term ((-211079 : Rat) / 357432) [(3, 2), (7, 1), (15, 3), (16, 1)],
  term ((1180595 : Rat) / 1072296) [(3, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((18705487 : Rat) / 3216888) [(3, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3079121 : Rat) / 804222) [(3, 2), (8, 1), (15, 2), (16, 1)],
  term (-96 : Rat) [(3, 2), (9, 1), (13, 1)],
  term ((128807 : Rat) / 44679) [(3, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((18565 : Rat) / 536148) [(3, 2), (9, 1), (15, 1), (16, 1)],
  term (48 : Rat) [(3, 2), (11, 1), (15, 1)],
  term ((938851 : Rat) / 6433776) [(3, 2), (11, 1), (15, 1), (16, 1)],
  term ((-128807 : Rat) / 89358) [(3, 2), (11, 1), (15, 3), (16, 1)],
  term ((213379 : Rat) / 268074) [(3, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term (120 : Rat) [(3, 2), (13, 1), (15, 1)],
  term ((-52832167 : Rat) / 12867552) [(3, 2), (13, 1), (15, 1), (16, 1)],
  term ((-3735403 : Rat) / 1072296) [(3, 2), (13, 1), (15, 3), (16, 1)],
  term ((-128807 : Rat) / 536148) [(3, 2), (13, 2), (15, 2), (16, 1)],
  term (-36 : Rat) [(3, 2), (15, 2)],
  term ((29094907 : Rat) / 12867552) [(3, 2), (15, 2), (16, 1)],
  term ((128807 : Rat) / 119144) [(3, 2), (15, 4), (16, 1)],
  term ((13712 : Rat) / 44679) [(3, 3), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-6856 : Rat) / 44679) [(3, 3), (11, 1), (15, 2), (16, 1)],
  term ((-17140 : Rat) / 44679) [(3, 3), (13, 1), (15, 2), (16, 1)],
  term ((-857 : Rat) / 29786) [(3, 3), (15, 1), (16, 1)],
  term ((1714 : Rat) / 14893) [(3, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 17, terms 0 through 46. -/
theorem rs_R003_ueqv_R003NN_block_17_0000_0046_valid :
    checkProductSumEq rs_R003_ueqv_R003NN_partials_17_0000_0046
      rs_R003_ueqv_R003NN_block_17_0000_0046 = true := by
  native_decide

end R003UeqvR003NNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
