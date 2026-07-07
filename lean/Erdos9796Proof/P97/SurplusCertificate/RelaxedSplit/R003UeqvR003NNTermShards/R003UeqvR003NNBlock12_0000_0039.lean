/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R003:u=v:R003NN, term block 12:0-39

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R003UeqvR003NNTermShards

/-- Generator polynomial 12 for relaxed split surplus certificate `R003:u=v:R003NN`. -/
def rs_R003_ueqv_R003NN_generator_12_0000_0039 : Poly :=
[
  term (-2 : Rat) [(2, 1), (4, 1)],
  term (2 : Rat) [(2, 1), (14, 1)],
  term (-2 : Rat) [(3, 1), (5, 1)],
  term (2 : Rat) [(3, 1), (15, 1)],
  term (1 : Rat) [(4, 2)],
  term (1 : Rat) [(5, 2)],
  term (-1 : Rat) [(14, 2)],
  term (-1 : Rat) [(15, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 12. -/
def rs_R003_ueqv_R003NN_coefficient_12_0000 : Poly :=
[
  term (-9 : Rat) []
]

/-- Partial product 0 for generator 12. -/
def rs_R003_ueqv_R003NN_partial_12_0000 : Poly :=
[
  term (18 : Rat) [(2, 1), (4, 1)],
  term (-18 : Rat) [(2, 1), (14, 1)],
  term (18 : Rat) [(3, 1), (5, 1)],
  term (-18 : Rat) [(3, 1), (15, 1)],
  term (-9 : Rat) [(4, 2)],
  term (-9 : Rat) [(5, 2)],
  term (9 : Rat) [(14, 2)],
  term (9 : Rat) [(15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 12. -/
theorem rs_R003_ueqv_R003NN_partial_12_0000_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_12_0000
        rs_R003_ueqv_R003NN_generator_12_0000_0039 =
      rs_R003_ueqv_R003NN_partial_12_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 12. -/
def rs_R003_ueqv_R003NN_coefficient_12_0001 : Poly :=
[
  term ((109403 : Rat) / 178716) [(0, 1), (3, 1), (15, 1), (16, 1)]
]

/-- Partial product 1 for generator 12. -/
def rs_R003_ueqv_R003NN_partial_12_0001 : Poly :=
[
  term ((-109403 : Rat) / 89358) [(0, 1), (2, 1), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((109403 : Rat) / 89358) [(0, 1), (2, 1), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((109403 : Rat) / 178716) [(0, 1), (3, 1), (4, 2), (15, 1), (16, 1)],
  term ((109403 : Rat) / 178716) [(0, 1), (3, 1), (5, 2), (15, 1), (16, 1)],
  term ((-109403 : Rat) / 178716) [(0, 1), (3, 1), (14, 2), (15, 1), (16, 1)],
  term ((-109403 : Rat) / 178716) [(0, 1), (3, 1), (15, 3), (16, 1)],
  term ((-109403 : Rat) / 89358) [(0, 1), (3, 2), (5, 1), (15, 1), (16, 1)],
  term ((109403 : Rat) / 89358) [(0, 1), (3, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 12. -/
theorem rs_R003_ueqv_R003NN_partial_12_0001_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_12_0001
        rs_R003_ueqv_R003NN_generator_12_0000_0039 =
      rs_R003_ueqv_R003NN_partial_12_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 12. -/
def rs_R003_ueqv_R003NN_coefficient_12_0002 : Poly :=
[
  term ((3428 : Rat) / 134037) [(0, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 2 for generator 12. -/
def rs_R003_ueqv_R003NN_partial_12_0002 : Poly :=
[
  term ((-6856 : Rat) / 134037) [(0, 1), (2, 1), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((6856 : Rat) / 134037) [(0, 1), (2, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6856 : Rat) / 134037) [(0, 1), (3, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((6856 : Rat) / 134037) [(0, 1), (3, 1), (11, 1), (15, 2), (16, 1)],
  term ((3428 : Rat) / 134037) [(0, 1), (4, 2), (11, 1), (15, 1), (16, 1)],
  term ((3428 : Rat) / 134037) [(0, 1), (5, 2), (11, 1), (15, 1), (16, 1)],
  term ((-3428 : Rat) / 134037) [(0, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-3428 : Rat) / 134037) [(0, 1), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 12. -/
theorem rs_R003_ueqv_R003NN_partial_12_0002_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_12_0002
        rs_R003_ueqv_R003NN_generator_12_0000_0039 =
      rs_R003_ueqv_R003NN_partial_12_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 12. -/
def rs_R003_ueqv_R003NN_coefficient_12_0003 : Poly :=
[
  term ((-1265819 : Rat) / 536148) [(0, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 3 for generator 12. -/
def rs_R003_ueqv_R003NN_partial_12_0003 : Poly :=
[
  term ((1265819 : Rat) / 268074) [(0, 1), (2, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1265819 : Rat) / 268074) [(0, 1), (2, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1265819 : Rat) / 268074) [(0, 1), (3, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1265819 : Rat) / 268074) [(0, 1), (3, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1265819 : Rat) / 536148) [(0, 1), (4, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1265819 : Rat) / 536148) [(0, 1), (5, 2), (13, 1), (15, 1), (16, 1)],
  term ((1265819 : Rat) / 536148) [(0, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((1265819 : Rat) / 536148) [(0, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 12. -/
theorem rs_R003_ueqv_R003NN_partial_12_0003_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_12_0003
        rs_R003_ueqv_R003NN_generator_12_0000_0039 =
      rs_R003_ueqv_R003NN_partial_12_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 12. -/
def rs_R003_ueqv_R003NN_coefficient_12_0004 : Poly :=
[
  term ((99701 : Rat) / 89358) [(0, 1), (15, 2), (16, 1)]
]

/-- Partial product 4 for generator 12. -/
def rs_R003_ueqv_R003NN_partial_12_0004 : Poly :=
[
  term ((-99701 : Rat) / 44679) [(0, 1), (2, 1), (4, 1), (15, 2), (16, 1)],
  term ((99701 : Rat) / 44679) [(0, 1), (2, 1), (14, 1), (15, 2), (16, 1)],
  term ((-99701 : Rat) / 44679) [(0, 1), (3, 1), (5, 1), (15, 2), (16, 1)],
  term ((99701 : Rat) / 44679) [(0, 1), (3, 1), (15, 3), (16, 1)],
  term ((99701 : Rat) / 89358) [(0, 1), (4, 2), (15, 2), (16, 1)],
  term ((99701 : Rat) / 89358) [(0, 1), (5, 2), (15, 2), (16, 1)],
  term ((-99701 : Rat) / 89358) [(0, 1), (14, 2), (15, 2), (16, 1)],
  term ((-99701 : Rat) / 89358) [(0, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 12. -/
theorem rs_R003_ueqv_R003NN_partial_12_0004_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_12_0004
        rs_R003_ueqv_R003NN_generator_12_0000_0039 =
      rs_R003_ueqv_R003NN_partial_12_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 12. -/
def rs_R003_ueqv_R003NN_coefficient_12_0005 : Poly :=
[
  term ((-109403 : Rat) / 178716) [(1, 1), (2, 1), (15, 1), (16, 1)]
]

/-- Partial product 5 for generator 12. -/
def rs_R003_ueqv_R003NN_partial_12_0005 : Poly :=
[
  term ((109403 : Rat) / 89358) [(1, 1), (2, 1), (3, 1), (5, 1), (15, 1), (16, 1)],
  term ((-109403 : Rat) / 89358) [(1, 1), (2, 1), (3, 1), (15, 2), (16, 1)],
  term ((-109403 : Rat) / 178716) [(1, 1), (2, 1), (4, 2), (15, 1), (16, 1)],
  term ((-109403 : Rat) / 178716) [(1, 1), (2, 1), (5, 2), (15, 1), (16, 1)],
  term ((109403 : Rat) / 178716) [(1, 1), (2, 1), (14, 2), (15, 1), (16, 1)],
  term ((109403 : Rat) / 178716) [(1, 1), (2, 1), (15, 3), (16, 1)],
  term ((109403 : Rat) / 89358) [(1, 1), (2, 2), (4, 1), (15, 1), (16, 1)],
  term ((-109403 : Rat) / 89358) [(1, 1), (2, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 12. -/
theorem rs_R003_ueqv_R003NN_partial_12_0005_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_12_0005
        rs_R003_ueqv_R003NN_generator_12_0000_0039 =
      rs_R003_ueqv_R003NN_partial_12_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 12. -/
def rs_R003_ueqv_R003NN_coefficient_12_0006 : Poly :=
[
  term ((251083 : Rat) / 357432) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 6 for generator 12. -/
def rs_R003_ueqv_R003NN_partial_12_0006 : Poly :=
[
  term ((-251083 : Rat) / 178716) [(1, 1), (2, 1), (4, 1), (15, 1), (16, 1)],
  term ((251083 : Rat) / 178716) [(1, 1), (2, 1), (14, 1), (15, 1), (16, 1)],
  term ((-251083 : Rat) / 178716) [(1, 1), (3, 1), (5, 1), (15, 1), (16, 1)],
  term ((251083 : Rat) / 178716) [(1, 1), (3, 1), (15, 2), (16, 1)],
  term ((251083 : Rat) / 357432) [(1, 1), (4, 2), (15, 1), (16, 1)],
  term ((251083 : Rat) / 357432) [(1, 1), (5, 2), (15, 1), (16, 1)],
  term ((-251083 : Rat) / 357432) [(1, 1), (14, 2), (15, 1), (16, 1)],
  term ((-251083 : Rat) / 357432) [(1, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 12. -/
theorem rs_R003_ueqv_R003NN_partial_12_0006_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_12_0006
        rs_R003_ueqv_R003NN_generator_12_0000_0039 =
      rs_R003_ueqv_R003NN_partial_12_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 12. -/
def rs_R003_ueqv_R003NN_coefficient_12_0007 : Poly :=
[
  term ((-13712 : Rat) / 44679) [(3, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 7 for generator 12. -/
def rs_R003_ueqv_R003NN_partial_12_0007 : Poly :=
[
  term ((27424 : Rat) / 44679) [(2, 1), (3, 1), (4, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-27424 : Rat) / 44679) [(2, 1), (3, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-13712 : Rat) / 44679) [(3, 1), (4, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-13712 : Rat) / 44679) [(3, 1), (5, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((13712 : Rat) / 44679) [(3, 1), (9, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((13712 : Rat) / 44679) [(3, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((27424 : Rat) / 44679) [(3, 2), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-27424 : Rat) / 44679) [(3, 2), (9, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 12. -/
theorem rs_R003_ueqv_R003NN_partial_12_0007_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_12_0007
        rs_R003_ueqv_R003NN_generator_12_0000_0039 =
      rs_R003_ueqv_R003NN_partial_12_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 12. -/
def rs_R003_ueqv_R003NN_coefficient_12_0008 : Poly :=
[
  term ((6856 : Rat) / 44679) [(3, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 8 for generator 12. -/
def rs_R003_ueqv_R003NN_partial_12_0008 : Poly :=
[
  term ((-13712 : Rat) / 44679) [(2, 1), (3, 1), (4, 1), (11, 1), (15, 2), (16, 1)],
  term ((13712 : Rat) / 44679) [(2, 1), (3, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((6856 : Rat) / 44679) [(3, 1), (4, 2), (11, 1), (15, 2), (16, 1)],
  term ((6856 : Rat) / 44679) [(3, 1), (5, 2), (11, 1), (15, 2), (16, 1)],
  term ((-6856 : Rat) / 44679) [(3, 1), (11, 1), (14, 2), (15, 2), (16, 1)],
  term ((-6856 : Rat) / 44679) [(3, 1), (11, 1), (15, 4), (16, 1)],
  term ((-13712 : Rat) / 44679) [(3, 2), (5, 1), (11, 1), (15, 2), (16, 1)],
  term ((13712 : Rat) / 44679) [(3, 2), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 12. -/
theorem rs_R003_ueqv_R003NN_partial_12_0008_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_12_0008
        rs_R003_ueqv_R003NN_generator_12_0000_0039 =
      rs_R003_ueqv_R003NN_partial_12_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 12. -/
def rs_R003_ueqv_R003NN_coefficient_12_0009 : Poly :=
[
  term ((17140 : Rat) / 44679) [(3, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 9 for generator 12. -/
def rs_R003_ueqv_R003NN_partial_12_0009 : Poly :=
[
  term ((-34280 : Rat) / 44679) [(2, 1), (3, 1), (4, 1), (13, 1), (15, 2), (16, 1)],
  term ((34280 : Rat) / 44679) [(2, 1), (3, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((17140 : Rat) / 44679) [(3, 1), (4, 2), (13, 1), (15, 2), (16, 1)],
  term ((17140 : Rat) / 44679) [(3, 1), (5, 2), (13, 1), (15, 2), (16, 1)],
  term ((-17140 : Rat) / 44679) [(3, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-17140 : Rat) / 44679) [(3, 1), (13, 1), (15, 4), (16, 1)],
  term ((-34280 : Rat) / 44679) [(3, 2), (5, 1), (13, 1), (15, 2), (16, 1)],
  term ((34280 : Rat) / 44679) [(3, 2), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 12. -/
theorem rs_R003_ueqv_R003NN_partial_12_0009_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_12_0009
        rs_R003_ueqv_R003NN_generator_12_0000_0039 =
      rs_R003_ueqv_R003NN_partial_12_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 12. -/
def rs_R003_ueqv_R003NN_coefficient_12_0010 : Poly :=
[
  term ((857 : Rat) / 29786) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 10 for generator 12. -/
def rs_R003_ueqv_R003NN_partial_12_0010 : Poly :=
[
  term ((-857 : Rat) / 14893) [(2, 1), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((857 : Rat) / 14893) [(2, 1), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((857 : Rat) / 29786) [(3, 1), (4, 2), (15, 1), (16, 1)],
  term ((857 : Rat) / 29786) [(3, 1), (5, 2), (15, 1), (16, 1)],
  term ((-857 : Rat) / 29786) [(3, 1), (14, 2), (15, 1), (16, 1)],
  term ((-857 : Rat) / 29786) [(3, 1), (15, 3), (16, 1)],
  term ((-857 : Rat) / 14893) [(3, 2), (5, 1), (15, 1), (16, 1)],
  term ((857 : Rat) / 14893) [(3, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 12. -/
theorem rs_R003_ueqv_R003NN_partial_12_0010_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_12_0010
        rs_R003_ueqv_R003NN_generator_12_0000_0039 =
      rs_R003_ueqv_R003NN_partial_12_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 12. -/
def rs_R003_ueqv_R003NN_coefficient_12_0011 : Poly :=
[
  term ((-1714 : Rat) / 14893) [(3, 1), (15, 3), (16, 1)]
]

/-- Partial product 11 for generator 12. -/
def rs_R003_ueqv_R003NN_partial_12_0011 : Poly :=
[
  term ((3428 : Rat) / 14893) [(2, 1), (3, 1), (4, 1), (15, 3), (16, 1)],
  term ((-3428 : Rat) / 14893) [(2, 1), (3, 1), (14, 1), (15, 3), (16, 1)],
  term ((-1714 : Rat) / 14893) [(3, 1), (4, 2), (15, 3), (16, 1)],
  term ((-1714 : Rat) / 14893) [(3, 1), (5, 2), (15, 3), (16, 1)],
  term ((1714 : Rat) / 14893) [(3, 1), (14, 2), (15, 3), (16, 1)],
  term ((1714 : Rat) / 14893) [(3, 1), (15, 5), (16, 1)],
  term ((3428 : Rat) / 14893) [(3, 2), (5, 1), (15, 3), (16, 1)],
  term ((-3428 : Rat) / 14893) [(3, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 12. -/
theorem rs_R003_ueqv_R003NN_partial_12_0011_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_12_0011
        rs_R003_ueqv_R003NN_generator_12_0000_0039 =
      rs_R003_ueqv_R003NN_partial_12_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 12. -/
def rs_R003_ueqv_R003NN_coefficient_12_0012 : Poly :=
[
  term ((-17710 : Rat) / 14893) [(4, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 12 for generator 12. -/
def rs_R003_ueqv_R003NN_partial_12_0012 : Poly :=
[
  term ((-35420 : Rat) / 14893) [(2, 1), (4, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((35420 : Rat) / 14893) [(2, 1), (4, 2), (11, 1), (15, 1), (16, 1)],
  term ((35420 : Rat) / 14893) [(3, 1), (4, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((-35420 : Rat) / 14893) [(3, 1), (4, 1), (11, 1), (15, 2), (16, 1)],
  term ((-17710 : Rat) / 14893) [(4, 1), (5, 2), (11, 1), (15, 1), (16, 1)],
  term ((17710 : Rat) / 14893) [(4, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((17710 : Rat) / 14893) [(4, 1), (11, 1), (15, 3), (16, 1)],
  term ((-17710 : Rat) / 14893) [(4, 3), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 12. -/
theorem rs_R003_ueqv_R003NN_partial_12_0012_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_12_0012
        rs_R003_ueqv_R003NN_generator_12_0000_0039 =
      rs_R003_ueqv_R003NN_partial_12_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 12. -/
def rs_R003_ueqv_R003NN_coefficient_12_0013 : Poly :=
[
  term ((-24851 : Rat) / 134037) [(4, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 13 for generator 12. -/
def rs_R003_ueqv_R003NN_partial_12_0013 : Poly :=
[
  term ((-49702 : Rat) / 134037) [(2, 1), (4, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((49702 : Rat) / 134037) [(2, 1), (4, 2), (13, 1), (15, 1), (16, 1)],
  term ((49702 : Rat) / 134037) [(3, 1), (4, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-49702 : Rat) / 134037) [(3, 1), (4, 1), (13, 1), (15, 2), (16, 1)],
  term ((-24851 : Rat) / 134037) [(4, 1), (5, 2), (13, 1), (15, 1), (16, 1)],
  term ((24851 : Rat) / 134037) [(4, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((24851 : Rat) / 134037) [(4, 1), (13, 1), (15, 3), (16, 1)],
  term ((-24851 : Rat) / 134037) [(4, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 12. -/
theorem rs_R003_ueqv_R003NN_partial_12_0013_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_12_0013
        rs_R003_ueqv_R003NN_generator_12_0000_0039 =
      rs_R003_ueqv_R003NN_partial_12_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 12. -/
def rs_R003_ueqv_R003NN_coefficient_12_0014 : Poly :=
[
  term ((8855 : Rat) / 14893) [(4, 1), (15, 2), (16, 1)]
]

/-- Partial product 14 for generator 12. -/
def rs_R003_ueqv_R003NN_partial_12_0014 : Poly :=
[
  term ((17710 : Rat) / 14893) [(2, 1), (4, 1), (14, 1), (15, 2), (16, 1)],
  term ((-17710 : Rat) / 14893) [(2, 1), (4, 2), (15, 2), (16, 1)],
  term ((-17710 : Rat) / 14893) [(3, 1), (4, 1), (5, 1), (15, 2), (16, 1)],
  term ((17710 : Rat) / 14893) [(3, 1), (4, 1), (15, 3), (16, 1)],
  term ((8855 : Rat) / 14893) [(4, 1), (5, 2), (15, 2), (16, 1)],
  term ((-8855 : Rat) / 14893) [(4, 1), (14, 2), (15, 2), (16, 1)],
  term ((-8855 : Rat) / 14893) [(4, 1), (15, 4), (16, 1)],
  term ((8855 : Rat) / 14893) [(4, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 12. -/
theorem rs_R003_ueqv_R003NN_partial_12_0014_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_12_0014
        rs_R003_ueqv_R003NN_generator_12_0000_0039 =
      rs_R003_ueqv_R003NN_partial_12_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 12. -/
def rs_R003_ueqv_R003NN_coefficient_12_0015 : Poly :=
[
  term ((-99404 : Rat) / 134037) [(5, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 15 for generator 12. -/
def rs_R003_ueqv_R003NN_partial_12_0015 : Poly :=
[
  term ((198808 : Rat) / 134037) [(2, 1), (4, 1), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-198808 : Rat) / 134037) [(2, 1), (5, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-198808 : Rat) / 134037) [(3, 1), (5, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((198808 : Rat) / 134037) [(3, 1), (5, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-99404 : Rat) / 134037) [(4, 2), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((99404 : Rat) / 134037) [(5, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((99404 : Rat) / 134037) [(5, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-99404 : Rat) / 134037) [(5, 3), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 12. -/
theorem rs_R003_ueqv_R003NN_partial_12_0015_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_12_0015
        rs_R003_ueqv_R003NN_generator_12_0000_0039 =
      rs_R003_ueqv_R003NN_partial_12_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 12. -/
def rs_R003_ueqv_R003NN_coefficient_12_0016 : Poly :=
[
  term ((49702 : Rat) / 134037) [(5, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 16 for generator 12. -/
def rs_R003_ueqv_R003NN_partial_12_0016 : Poly :=
[
  term ((-99404 : Rat) / 134037) [(2, 1), (4, 1), (5, 1), (13, 1), (15, 2), (16, 1)],
  term ((99404 : Rat) / 134037) [(2, 1), (5, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((99404 : Rat) / 134037) [(3, 1), (5, 1), (13, 1), (15, 3), (16, 1)],
  term ((-99404 : Rat) / 134037) [(3, 1), (5, 2), (13, 1), (15, 2), (16, 1)],
  term ((49702 : Rat) / 134037) [(4, 2), (5, 1), (13, 1), (15, 2), (16, 1)],
  term ((-49702 : Rat) / 134037) [(5, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-49702 : Rat) / 134037) [(5, 1), (13, 1), (15, 4), (16, 1)],
  term ((49702 : Rat) / 134037) [(5, 3), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 12. -/
theorem rs_R003_ueqv_R003NN_partial_12_0016_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_12_0016
        rs_R003_ueqv_R003NN_generator_12_0000_0039 =
      rs_R003_ueqv_R003NN_partial_12_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 12. -/
def rs_R003_ueqv_R003NN_coefficient_12_0017 : Poly :=
[
  term ((24851 : Rat) / 268074) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 17 for generator 12. -/
def rs_R003_ueqv_R003NN_partial_12_0017 : Poly :=
[
  term ((-24851 : Rat) / 134037) [(2, 1), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((24851 : Rat) / 134037) [(2, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((24851 : Rat) / 134037) [(3, 1), (5, 1), (15, 2), (16, 1)],
  term ((-24851 : Rat) / 134037) [(3, 1), (5, 2), (15, 1), (16, 1)],
  term ((24851 : Rat) / 268074) [(4, 2), (5, 1), (15, 1), (16, 1)],
  term ((-24851 : Rat) / 268074) [(5, 1), (14, 2), (15, 1), (16, 1)],
  term ((-24851 : Rat) / 268074) [(5, 1), (15, 3), (16, 1)],
  term ((24851 : Rat) / 268074) [(5, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 12. -/
theorem rs_R003_ueqv_R003NN_partial_12_0017_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_12_0017
        rs_R003_ueqv_R003NN_generator_12_0000_0039 =
      rs_R003_ueqv_R003NN_partial_12_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 12. -/
def rs_R003_ueqv_R003NN_coefficient_12_0018 : Poly :=
[
  term ((-1714 : Rat) / 44679) [(6, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 18 for generator 12. -/
def rs_R003_ueqv_R003NN_partial_12_0018 : Poly :=
[
  term ((3428 : Rat) / 44679) [(2, 1), (4, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3428 : Rat) / 44679) [(2, 1), (6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((3428 : Rat) / 44679) [(3, 1), (5, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3428 : Rat) / 44679) [(3, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((-1714 : Rat) / 44679) [(4, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1714 : Rat) / 44679) [(5, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((1714 : Rat) / 44679) [(6, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((1714 : Rat) / 44679) [(6, 1), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 12. -/
theorem rs_R003_ueqv_R003NN_partial_12_0018_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_12_0018
        rs_R003_ueqv_R003NN_generator_12_0000_0039 =
      rs_R003_ueqv_R003NN_partial_12_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 12. -/
def rs_R003_ueqv_R003NN_coefficient_12_0019 : Poly :=
[
  term ((124249 : Rat) / 89358) [(6, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 19 for generator 12. -/
def rs_R003_ueqv_R003NN_partial_12_0019 : Poly :=
[
  term ((-124249 : Rat) / 44679) [(2, 1), (4, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((124249 : Rat) / 44679) [(2, 1), (6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-124249 : Rat) / 44679) [(3, 1), (5, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((124249 : Rat) / 44679) [(3, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((124249 : Rat) / 89358) [(4, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((124249 : Rat) / 89358) [(5, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-124249 : Rat) / 89358) [(6, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-124249 : Rat) / 89358) [(6, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 12. -/
theorem rs_R003_ueqv_R003NN_partial_12_0019_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_12_0019
        rs_R003_ueqv_R003NN_generator_12_0000_0039 =
      rs_R003_ueqv_R003NN_partial_12_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 12. -/
def rs_R003_ueqv_R003NN_coefficient_12_0020 : Poly :=
[
  term ((-273343 : Rat) / 536148) [(6, 1), (15, 2), (16, 1)]
]

/-- Partial product 20 for generator 12. -/
def rs_R003_ueqv_R003NN_partial_12_0020 : Poly :=
[
  term ((273343 : Rat) / 268074) [(2, 1), (4, 1), (6, 1), (15, 2), (16, 1)],
  term ((-273343 : Rat) / 268074) [(2, 1), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((273343 : Rat) / 268074) [(3, 1), (5, 1), (6, 1), (15, 2), (16, 1)],
  term ((-273343 : Rat) / 268074) [(3, 1), (6, 1), (15, 3), (16, 1)],
  term ((-273343 : Rat) / 536148) [(4, 2), (6, 1), (15, 2), (16, 1)],
  term ((-273343 : Rat) / 536148) [(5, 2), (6, 1), (15, 2), (16, 1)],
  term ((273343 : Rat) / 536148) [(6, 1), (14, 2), (15, 2), (16, 1)],
  term ((273343 : Rat) / 536148) [(6, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 12. -/
theorem rs_R003_ueqv_R003NN_partial_12_0020_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_12_0020
        rs_R003_ueqv_R003NN_generator_12_0000_0039 =
      rs_R003_ueqv_R003NN_partial_12_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 12. -/
def rs_R003_ueqv_R003NN_coefficient_12_0021 : Poly :=
[
  term ((-128807 : Rat) / 178716) [(7, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 21 for generator 12. -/
def rs_R003_ueqv_R003NN_partial_12_0021 : Poly :=
[
  term ((128807 : Rat) / 89358) [(2, 1), (4, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-128807 : Rat) / 89358) [(2, 1), (7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((128807 : Rat) / 89358) [(3, 1), (5, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-128807 : Rat) / 89358) [(3, 1), (7, 1), (13, 1), (15, 3), (16, 1)],
  term ((-128807 : Rat) / 178716) [(4, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-128807 : Rat) / 178716) [(5, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((128807 : Rat) / 178716) [(7, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((128807 : Rat) / 178716) [(7, 1), (13, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 12. -/
theorem rs_R003_ueqv_R003NN_partial_12_0021_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_12_0021
        rs_R003_ueqv_R003NN_generator_12_0000_0039 =
      rs_R003_ueqv_R003NN_partial_12_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 12. -/
def rs_R003_ueqv_R003NN_coefficient_12_0022 : Poly :=
[
  term ((-167497 : Rat) / 476576) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 22 for generator 12. -/
def rs_R003_ueqv_R003NN_partial_12_0022 : Poly :=
[
  term ((167497 : Rat) / 238288) [(2, 1), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((-167497 : Rat) / 238288) [(2, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((167497 : Rat) / 238288) [(3, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-167497 : Rat) / 238288) [(3, 1), (7, 1), (15, 2), (16, 1)],
  term ((-167497 : Rat) / 476576) [(4, 2), (7, 1), (15, 1), (16, 1)],
  term ((-167497 : Rat) / 476576) [(5, 2), (7, 1), (15, 1), (16, 1)],
  term ((167497 : Rat) / 476576) [(7, 1), (14, 2), (15, 1), (16, 1)],
  term ((167497 : Rat) / 476576) [(7, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 12. -/
theorem rs_R003_ueqv_R003NN_partial_12_0022_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_12_0022
        rs_R003_ueqv_R003NN_generator_12_0000_0039 =
      rs_R003_ueqv_R003NN_partial_12_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 12. -/
def rs_R003_ueqv_R003NN_coefficient_12_0023 : Poly :=
[
  term ((128807 : Rat) / 357432) [(7, 1), (15, 3), (16, 1)]
]

/-- Partial product 23 for generator 12. -/
def rs_R003_ueqv_R003NN_partial_12_0023 : Poly :=
[
  term ((-128807 : Rat) / 178716) [(2, 1), (4, 1), (7, 1), (15, 3), (16, 1)],
  term ((128807 : Rat) / 178716) [(2, 1), (7, 1), (14, 1), (15, 3), (16, 1)],
  term ((-128807 : Rat) / 178716) [(3, 1), (5, 1), (7, 1), (15, 3), (16, 1)],
  term ((128807 : Rat) / 178716) [(3, 1), (7, 1), (15, 4), (16, 1)],
  term ((128807 : Rat) / 357432) [(4, 2), (7, 1), (15, 3), (16, 1)],
  term ((128807 : Rat) / 357432) [(5, 2), (7, 1), (15, 3), (16, 1)],
  term ((-128807 : Rat) / 357432) [(7, 1), (14, 2), (15, 3), (16, 1)],
  term ((-128807 : Rat) / 357432) [(7, 1), (15, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 12. -/
theorem rs_R003_ueqv_R003NN_partial_12_0023_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_12_0023
        rs_R003_ueqv_R003NN_generator_12_0000_0039 =
      rs_R003_ueqv_R003NN_partial_12_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 12. -/
def rs_R003_ueqv_R003NN_coefficient_12_0024 : Poly :=
[
  term ((-1180595 : Rat) / 1072296) [(8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 24 for generator 12. -/
def rs_R003_ueqv_R003NN_partial_12_0024 : Poly :=
[
  term ((1180595 : Rat) / 536148) [(2, 1), (4, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1180595 : Rat) / 536148) [(2, 1), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((1180595 : Rat) / 536148) [(3, 1), (5, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1180595 : Rat) / 536148) [(3, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((-1180595 : Rat) / 1072296) [(4, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1180595 : Rat) / 1072296) [(5, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((1180595 : Rat) / 1072296) [(8, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((1180595 : Rat) / 1072296) [(8, 1), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 12. -/
theorem rs_R003_ueqv_R003NN_partial_12_0024_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_12_0024
        rs_R003_ueqv_R003NN_generator_12_0000_0039 =
      rs_R003_ueqv_R003NN_partial_12_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 12. -/
def rs_R003_ueqv_R003NN_coefficient_12_0025 : Poly :=
[
  term ((-18705487 : Rat) / 3216888) [(8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 25 for generator 12. -/
def rs_R003_ueqv_R003NN_partial_12_0025 : Poly :=
[
  term ((18705487 : Rat) / 1608444) [(2, 1), (4, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-18705487 : Rat) / 1608444) [(2, 1), (8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((18705487 : Rat) / 1608444) [(3, 1), (5, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-18705487 : Rat) / 1608444) [(3, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((-18705487 : Rat) / 3216888) [(4, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-18705487 : Rat) / 3216888) [(5, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((18705487 : Rat) / 3216888) [(8, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((18705487 : Rat) / 3216888) [(8, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 12. -/
theorem rs_R003_ueqv_R003NN_partial_12_0025_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_12_0025
        rs_R003_ueqv_R003NN_generator_12_0000_0039 =
      rs_R003_ueqv_R003NN_partial_12_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 12. -/
def rs_R003_ueqv_R003NN_coefficient_12_0026 : Poly :=
[
  term ((3079121 : Rat) / 804222) [(8, 1), (15, 2), (16, 1)]
]

/-- Partial product 26 for generator 12. -/
def rs_R003_ueqv_R003NN_partial_12_0026 : Poly :=
[
  term ((-3079121 : Rat) / 402111) [(2, 1), (4, 1), (8, 1), (15, 2), (16, 1)],
  term ((3079121 : Rat) / 402111) [(2, 1), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((-3079121 : Rat) / 402111) [(3, 1), (5, 1), (8, 1), (15, 2), (16, 1)],
  term ((3079121 : Rat) / 402111) [(3, 1), (8, 1), (15, 3), (16, 1)],
  term ((3079121 : Rat) / 804222) [(4, 2), (8, 1), (15, 2), (16, 1)],
  term ((3079121 : Rat) / 804222) [(5, 2), (8, 1), (15, 2), (16, 1)],
  term ((-3079121 : Rat) / 804222) [(8, 1), (14, 2), (15, 2), (16, 1)],
  term ((-3079121 : Rat) / 804222) [(8, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 12. -/
theorem rs_R003_ueqv_R003NN_partial_12_0026_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_12_0026
        rs_R003_ueqv_R003NN_generator_12_0000_0039 =
      rs_R003_ueqv_R003NN_partial_12_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 12. -/
def rs_R003_ueqv_R003NN_coefficient_12_0027 : Poly :=
[
  term (96 : Rat) [(9, 1), (13, 1)]
]

/-- Partial product 27 for generator 12. -/
def rs_R003_ueqv_R003NN_partial_12_0027 : Poly :=
[
  term (-192 : Rat) [(2, 1), (4, 1), (9, 1), (13, 1)],
  term (192 : Rat) [(2, 1), (9, 1), (13, 1), (14, 1)],
  term (-192 : Rat) [(3, 1), (5, 1), (9, 1), (13, 1)],
  term (192 : Rat) [(3, 1), (9, 1), (13, 1), (15, 1)],
  term (96 : Rat) [(4, 2), (9, 1), (13, 1)],
  term (96 : Rat) [(5, 2), (9, 1), (13, 1)],
  term (-96 : Rat) [(9, 1), (13, 1), (14, 2)],
  term (-96 : Rat) [(9, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 12. -/
theorem rs_R003_ueqv_R003NN_partial_12_0027_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_12_0027
        rs_R003_ueqv_R003NN_generator_12_0000_0039 =
      rs_R003_ueqv_R003NN_partial_12_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 12. -/
def rs_R003_ueqv_R003NN_coefficient_12_0028 : Poly :=
[
  term ((-128807 : Rat) / 44679) [(9, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 28 for generator 12. -/
def rs_R003_ueqv_R003NN_partial_12_0028 : Poly :=
[
  term ((257614 : Rat) / 44679) [(2, 1), (4, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-257614 : Rat) / 44679) [(2, 1), (9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((257614 : Rat) / 44679) [(3, 1), (5, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-257614 : Rat) / 44679) [(3, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((-128807 : Rat) / 44679) [(4, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-128807 : Rat) / 44679) [(5, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((128807 : Rat) / 44679) [(9, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((128807 : Rat) / 44679) [(9, 1), (13, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 12. -/
theorem rs_R003_ueqv_R003NN_partial_12_0028_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_12_0028
        rs_R003_ueqv_R003NN_generator_12_0000_0039 =
      rs_R003_ueqv_R003NN_partial_12_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 12. -/
def rs_R003_ueqv_R003NN_coefficient_12_0029 : Poly :=
[
  term ((-18565 : Rat) / 536148) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 29 for generator 12. -/
def rs_R003_ueqv_R003NN_partial_12_0029 : Poly :=
[
  term ((18565 : Rat) / 268074) [(2, 1), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((-18565 : Rat) / 268074) [(2, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((18565 : Rat) / 268074) [(3, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((-18565 : Rat) / 268074) [(3, 1), (9, 1), (15, 2), (16, 1)],
  term ((-18565 : Rat) / 536148) [(4, 2), (9, 1), (15, 1), (16, 1)],
  term ((-18565 : Rat) / 536148) [(5, 2), (9, 1), (15, 1), (16, 1)],
  term ((18565 : Rat) / 536148) [(9, 1), (14, 2), (15, 1), (16, 1)],
  term ((18565 : Rat) / 536148) [(9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 12. -/
theorem rs_R003_ueqv_R003NN_partial_12_0029_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_12_0029
        rs_R003_ueqv_R003NN_generator_12_0000_0039 =
      rs_R003_ueqv_R003NN_partial_12_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 12. -/
def rs_R003_ueqv_R003NN_coefficient_12_0030 : Poly :=
[
  term (-48 : Rat) [(11, 1), (15, 1)]
]

/-- Partial product 30 for generator 12. -/
def rs_R003_ueqv_R003NN_partial_12_0030 : Poly :=
[
  term (96 : Rat) [(2, 1), (4, 1), (11, 1), (15, 1)],
  term (-96 : Rat) [(2, 1), (11, 1), (14, 1), (15, 1)],
  term (96 : Rat) [(3, 1), (5, 1), (11, 1), (15, 1)],
  term (-96 : Rat) [(3, 1), (11, 1), (15, 2)],
  term (-48 : Rat) [(4, 2), (11, 1), (15, 1)],
  term (-48 : Rat) [(5, 2), (11, 1), (15, 1)],
  term (48 : Rat) [(11, 1), (14, 2), (15, 1)],
  term (48 : Rat) [(11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 12. -/
theorem rs_R003_ueqv_R003NN_partial_12_0030_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_12_0030
        rs_R003_ueqv_R003NN_generator_12_0000_0039 =
      rs_R003_ueqv_R003NN_partial_12_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 12. -/
def rs_R003_ueqv_R003NN_coefficient_12_0031 : Poly :=
[
  term ((-3694771 : Rat) / 6433776) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 31 for generator 12. -/
def rs_R003_ueqv_R003NN_partial_12_0031 : Poly :=
[
  term ((3694771 : Rat) / 3216888) [(2, 1), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3694771 : Rat) / 3216888) [(2, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((3694771 : Rat) / 3216888) [(3, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3694771 : Rat) / 3216888) [(3, 1), (11, 1), (15, 2), (16, 1)],
  term ((-3694771 : Rat) / 6433776) [(4, 2), (11, 1), (15, 1), (16, 1)],
  term ((-3694771 : Rat) / 6433776) [(5, 2), (11, 1), (15, 1), (16, 1)],
  term ((3694771 : Rat) / 6433776) [(11, 1), (14, 2), (15, 1), (16, 1)],
  term ((3694771 : Rat) / 6433776) [(11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 12. -/
theorem rs_R003_ueqv_R003NN_partial_12_0031_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_12_0031
        rs_R003_ueqv_R003NN_generator_12_0000_0039 =
      rs_R003_ueqv_R003NN_partial_12_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 12. -/
def rs_R003_ueqv_R003NN_coefficient_12_0032 : Poly :=
[
  term ((128807 : Rat) / 89358) [(11, 1), (15, 3), (16, 1)]
]

/-- Partial product 32 for generator 12. -/
def rs_R003_ueqv_R003NN_partial_12_0032 : Poly :=
[
  term ((-128807 : Rat) / 44679) [(2, 1), (4, 1), (11, 1), (15, 3), (16, 1)],
  term ((128807 : Rat) / 44679) [(2, 1), (11, 1), (14, 1), (15, 3), (16, 1)],
  term ((-128807 : Rat) / 44679) [(3, 1), (5, 1), (11, 1), (15, 3), (16, 1)],
  term ((128807 : Rat) / 44679) [(3, 1), (11, 1), (15, 4), (16, 1)],
  term ((128807 : Rat) / 89358) [(4, 2), (11, 1), (15, 3), (16, 1)],
  term ((128807 : Rat) / 89358) [(5, 2), (11, 1), (15, 3), (16, 1)],
  term ((-128807 : Rat) / 89358) [(11, 1), (14, 2), (15, 3), (16, 1)],
  term ((-128807 : Rat) / 89358) [(11, 1), (15, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 12. -/
theorem rs_R003_ueqv_R003NN_partial_12_0032_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_12_0032
        rs_R003_ueqv_R003NN_generator_12_0000_0039 =
      rs_R003_ueqv_R003NN_partial_12_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 12. -/
def rs_R003_ueqv_R003NN_coefficient_12_0033 : Poly :=
[
  term (-120 : Rat) [(13, 1), (15, 1)]
]

/-- Partial product 33 for generator 12. -/
def rs_R003_ueqv_R003NN_partial_12_0033 : Poly :=
[
  term (240 : Rat) [(2, 1), (4, 1), (13, 1), (15, 1)],
  term (-240 : Rat) [(2, 1), (13, 1), (14, 1), (15, 1)],
  term (240 : Rat) [(3, 1), (5, 1), (13, 1), (15, 1)],
  term (-240 : Rat) [(3, 1), (13, 1), (15, 2)],
  term (-120 : Rat) [(4, 2), (13, 1), (15, 1)],
  term (-120 : Rat) [(5, 2), (13, 1), (15, 1)],
  term (120 : Rat) [(13, 1), (14, 2), (15, 1)],
  term (120 : Rat) [(13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 12. -/
theorem rs_R003_ueqv_R003NN_partial_12_0033_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_12_0033
        rs_R003_ueqv_R003NN_generator_12_0000_0039 =
      rs_R003_ueqv_R003NN_partial_12_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 12. -/
def rs_R003_ueqv_R003NN_coefficient_12_0034 : Poly :=
[
  term ((65706343 : Rat) / 12867552) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 34 for generator 12. -/
def rs_R003_ueqv_R003NN_partial_12_0034 : Poly :=
[
  term ((-65706343 : Rat) / 6433776) [(2, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((65706343 : Rat) / 6433776) [(2, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-65706343 : Rat) / 6433776) [(3, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((65706343 : Rat) / 6433776) [(3, 1), (13, 1), (15, 2), (16, 1)],
  term ((65706343 : Rat) / 12867552) [(4, 2), (13, 1), (15, 1), (16, 1)],
  term ((65706343 : Rat) / 12867552) [(5, 2), (13, 1), (15, 1), (16, 1)],
  term ((-65706343 : Rat) / 12867552) [(13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-65706343 : Rat) / 12867552) [(13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 12. -/
theorem rs_R003_ueqv_R003NN_partial_12_0034_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_12_0034
        rs_R003_ueqv_R003NN_generator_12_0000_0039 =
      rs_R003_ueqv_R003NN_partial_12_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 12. -/
def rs_R003_ueqv_R003NN_coefficient_12_0035 : Poly :=
[
  term ((3735403 : Rat) / 1072296) [(13, 1), (15, 3), (16, 1)]
]

/-- Partial product 35 for generator 12. -/
def rs_R003_ueqv_R003NN_partial_12_0035 : Poly :=
[
  term ((-3735403 : Rat) / 536148) [(2, 1), (4, 1), (13, 1), (15, 3), (16, 1)],
  term ((3735403 : Rat) / 536148) [(2, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-3735403 : Rat) / 536148) [(3, 1), (5, 1), (13, 1), (15, 3), (16, 1)],
  term ((3735403 : Rat) / 536148) [(3, 1), (13, 1), (15, 4), (16, 1)],
  term ((3735403 : Rat) / 1072296) [(4, 2), (13, 1), (15, 3), (16, 1)],
  term ((3735403 : Rat) / 1072296) [(5, 2), (13, 1), (15, 3), (16, 1)],
  term ((-3735403 : Rat) / 1072296) [(13, 1), (14, 2), (15, 3), (16, 1)],
  term ((-3735403 : Rat) / 1072296) [(13, 1), (15, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 12. -/
theorem rs_R003_ueqv_R003NN_partial_12_0035_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_12_0035
        rs_R003_ueqv_R003NN_generator_12_0000_0039 =
      rs_R003_ueqv_R003NN_partial_12_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 12. -/
def rs_R003_ueqv_R003NN_coefficient_12_0036 : Poly :=
[
  term ((128807 : Rat) / 536148) [(13, 2), (15, 2), (16, 1)]
]

/-- Partial product 36 for generator 12. -/
def rs_R003_ueqv_R003NN_partial_12_0036 : Poly :=
[
  term ((-128807 : Rat) / 268074) [(2, 1), (4, 1), (13, 2), (15, 2), (16, 1)],
  term ((128807 : Rat) / 268074) [(2, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-128807 : Rat) / 268074) [(3, 1), (5, 1), (13, 2), (15, 2), (16, 1)],
  term ((128807 : Rat) / 268074) [(3, 1), (13, 2), (15, 3), (16, 1)],
  term ((128807 : Rat) / 536148) [(4, 2), (13, 2), (15, 2), (16, 1)],
  term ((128807 : Rat) / 536148) [(5, 2), (13, 2), (15, 2), (16, 1)],
  term ((-128807 : Rat) / 536148) [(13, 2), (14, 2), (15, 2), (16, 1)],
  term ((-128807 : Rat) / 536148) [(13, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 12. -/
theorem rs_R003_ueqv_R003NN_partial_12_0036_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_12_0036
        rs_R003_ueqv_R003NN_generator_12_0000_0039 =
      rs_R003_ueqv_R003NN_partial_12_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 12. -/
def rs_R003_ueqv_R003NN_coefficient_12_0037 : Poly :=
[
  term (36 : Rat) [(15, 2)]
]

/-- Partial product 37 for generator 12. -/
def rs_R003_ueqv_R003NN_partial_12_0037 : Poly :=
[
  term (-72 : Rat) [(2, 1), (4, 1), (15, 2)],
  term (72 : Rat) [(2, 1), (14, 1), (15, 2)],
  term (-72 : Rat) [(3, 1), (5, 1), (15, 2)],
  term (72 : Rat) [(3, 1), (15, 3)],
  term (36 : Rat) [(4, 2), (15, 2)],
  term (36 : Rat) [(5, 2), (15, 2)],
  term (-36 : Rat) [(14, 2), (15, 2)],
  term (-36 : Rat) [(15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 12. -/
theorem rs_R003_ueqv_R003NN_partial_12_0037_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_12_0037
        rs_R003_ueqv_R003NN_generator_12_0000_0039 =
      rs_R003_ueqv_R003NN_partial_12_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 12. -/
def rs_R003_ueqv_R003NN_coefficient_12_0038 : Poly :=
[
  term ((-27127555 : Rat) / 12867552) [(15, 2), (16, 1)]
]

/-- Partial product 38 for generator 12. -/
def rs_R003_ueqv_R003NN_partial_12_0038 : Poly :=
[
  term ((27127555 : Rat) / 6433776) [(2, 1), (4, 1), (15, 2), (16, 1)],
  term ((-27127555 : Rat) / 6433776) [(2, 1), (14, 1), (15, 2), (16, 1)],
  term ((27127555 : Rat) / 6433776) [(3, 1), (5, 1), (15, 2), (16, 1)],
  term ((-27127555 : Rat) / 6433776) [(3, 1), (15, 3), (16, 1)],
  term ((-27127555 : Rat) / 12867552) [(4, 2), (15, 2), (16, 1)],
  term ((-27127555 : Rat) / 12867552) [(5, 2), (15, 2), (16, 1)],
  term ((27127555 : Rat) / 12867552) [(14, 2), (15, 2), (16, 1)],
  term ((27127555 : Rat) / 12867552) [(15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 12. -/
theorem rs_R003_ueqv_R003NN_partial_12_0038_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_12_0038
        rs_R003_ueqv_R003NN_generator_12_0000_0039 =
      rs_R003_ueqv_R003NN_partial_12_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 12. -/
def rs_R003_ueqv_R003NN_coefficient_12_0039 : Poly :=
[
  term ((-128807 : Rat) / 119144) [(15, 4), (16, 1)]
]

/-- Partial product 39 for generator 12. -/
def rs_R003_ueqv_R003NN_partial_12_0039 : Poly :=
[
  term ((128807 : Rat) / 59572) [(2, 1), (4, 1), (15, 4), (16, 1)],
  term ((-128807 : Rat) / 59572) [(2, 1), (14, 1), (15, 4), (16, 1)],
  term ((128807 : Rat) / 59572) [(3, 1), (5, 1), (15, 4), (16, 1)],
  term ((-128807 : Rat) / 59572) [(3, 1), (15, 5), (16, 1)],
  term ((-128807 : Rat) / 119144) [(4, 2), (15, 4), (16, 1)],
  term ((-128807 : Rat) / 119144) [(5, 2), (15, 4), (16, 1)],
  term ((128807 : Rat) / 119144) [(14, 2), (15, 4), (16, 1)],
  term ((128807 : Rat) / 119144) [(15, 6), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 12. -/
theorem rs_R003_ueqv_R003NN_partial_12_0039_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_12_0039
        rs_R003_ueqv_R003NN_generator_12_0000_0039 =
      rs_R003_ueqv_R003NN_partial_12_0039 := by
  native_decide

/-- Partial products in this block. -/
def rs_R003_ueqv_R003NN_partials_12_0000_0039 : List Poly :=
[
  rs_R003_ueqv_R003NN_partial_12_0000,
  rs_R003_ueqv_R003NN_partial_12_0001,
  rs_R003_ueqv_R003NN_partial_12_0002,
  rs_R003_ueqv_R003NN_partial_12_0003,
  rs_R003_ueqv_R003NN_partial_12_0004,
  rs_R003_ueqv_R003NN_partial_12_0005,
  rs_R003_ueqv_R003NN_partial_12_0006,
  rs_R003_ueqv_R003NN_partial_12_0007,
  rs_R003_ueqv_R003NN_partial_12_0008,
  rs_R003_ueqv_R003NN_partial_12_0009,
  rs_R003_ueqv_R003NN_partial_12_0010,
  rs_R003_ueqv_R003NN_partial_12_0011,
  rs_R003_ueqv_R003NN_partial_12_0012,
  rs_R003_ueqv_R003NN_partial_12_0013,
  rs_R003_ueqv_R003NN_partial_12_0014,
  rs_R003_ueqv_R003NN_partial_12_0015,
  rs_R003_ueqv_R003NN_partial_12_0016,
  rs_R003_ueqv_R003NN_partial_12_0017,
  rs_R003_ueqv_R003NN_partial_12_0018,
  rs_R003_ueqv_R003NN_partial_12_0019,
  rs_R003_ueqv_R003NN_partial_12_0020,
  rs_R003_ueqv_R003NN_partial_12_0021,
  rs_R003_ueqv_R003NN_partial_12_0022,
  rs_R003_ueqv_R003NN_partial_12_0023,
  rs_R003_ueqv_R003NN_partial_12_0024,
  rs_R003_ueqv_R003NN_partial_12_0025,
  rs_R003_ueqv_R003NN_partial_12_0026,
  rs_R003_ueqv_R003NN_partial_12_0027,
  rs_R003_ueqv_R003NN_partial_12_0028,
  rs_R003_ueqv_R003NN_partial_12_0029,
  rs_R003_ueqv_R003NN_partial_12_0030,
  rs_R003_ueqv_R003NN_partial_12_0031,
  rs_R003_ueqv_R003NN_partial_12_0032,
  rs_R003_ueqv_R003NN_partial_12_0033,
  rs_R003_ueqv_R003NN_partial_12_0034,
  rs_R003_ueqv_R003NN_partial_12_0035,
  rs_R003_ueqv_R003NN_partial_12_0036,
  rs_R003_ueqv_R003NN_partial_12_0037,
  rs_R003_ueqv_R003NN_partial_12_0038,
  rs_R003_ueqv_R003NN_partial_12_0039
]

/-- Sum of partial products in this block. -/
def rs_R003_ueqv_R003NN_block_12_0000_0039 : Poly :=
[
  term ((-109403 : Rat) / 89358) [(0, 1), (2, 1), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((109403 : Rat) / 89358) [(0, 1), (2, 1), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6856 : Rat) / 134037) [(0, 1), (2, 1), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((1265819 : Rat) / 268074) [(0, 1), (2, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-99701 : Rat) / 44679) [(0, 1), (2, 1), (4, 1), (15, 2), (16, 1)],
  term ((6856 : Rat) / 134037) [(0, 1), (2, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1265819 : Rat) / 268074) [(0, 1), (2, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((99701 : Rat) / 44679) [(0, 1), (2, 1), (14, 1), (15, 2), (16, 1)],
  term ((109403 : Rat) / 178716) [(0, 1), (3, 1), (4, 2), (15, 1), (16, 1)],
  term ((-6856 : Rat) / 134037) [(0, 1), (3, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((1265819 : Rat) / 268074) [(0, 1), (3, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-99701 : Rat) / 44679) [(0, 1), (3, 1), (5, 1), (15, 2), (16, 1)],
  term ((109403 : Rat) / 178716) [(0, 1), (3, 1), (5, 2), (15, 1), (16, 1)],
  term ((6856 : Rat) / 134037) [(0, 1), (3, 1), (11, 1), (15, 2), (16, 1)],
  term ((-1265819 : Rat) / 268074) [(0, 1), (3, 1), (13, 1), (15, 2), (16, 1)],
  term ((-109403 : Rat) / 178716) [(0, 1), (3, 1), (14, 2), (15, 1), (16, 1)],
  term ((96467 : Rat) / 59572) [(0, 1), (3, 1), (15, 3), (16, 1)],
  term ((-109403 : Rat) / 89358) [(0, 1), (3, 2), (5, 1), (15, 1), (16, 1)],
  term ((109403 : Rat) / 89358) [(0, 1), (3, 2), (15, 2), (16, 1)],
  term ((3428 : Rat) / 134037) [(0, 1), (4, 2), (11, 1), (15, 1), (16, 1)],
  term ((-1265819 : Rat) / 536148) [(0, 1), (4, 2), (13, 1), (15, 1), (16, 1)],
  term ((99701 : Rat) / 89358) [(0, 1), (4, 2), (15, 2), (16, 1)],
  term ((3428 : Rat) / 134037) [(0, 1), (5, 2), (11, 1), (15, 1), (16, 1)],
  term ((-1265819 : Rat) / 536148) [(0, 1), (5, 2), (13, 1), (15, 1), (16, 1)],
  term ((99701 : Rat) / 89358) [(0, 1), (5, 2), (15, 2), (16, 1)],
  term ((-3428 : Rat) / 134037) [(0, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-3428 : Rat) / 134037) [(0, 1), (11, 1), (15, 3), (16, 1)],
  term ((1265819 : Rat) / 536148) [(0, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((1265819 : Rat) / 536148) [(0, 1), (13, 1), (15, 3), (16, 1)],
  term ((-99701 : Rat) / 89358) [(0, 1), (14, 2), (15, 2), (16, 1)],
  term ((-99701 : Rat) / 89358) [(0, 1), (15, 4), (16, 1)],
  term ((109403 : Rat) / 89358) [(1, 1), (2, 1), (3, 1), (5, 1), (15, 1), (16, 1)],
  term ((-109403 : Rat) / 89358) [(1, 1), (2, 1), (3, 1), (15, 2), (16, 1)],
  term ((-251083 : Rat) / 178716) [(1, 1), (2, 1), (4, 1), (15, 1), (16, 1)],
  term ((-109403 : Rat) / 178716) [(1, 1), (2, 1), (4, 2), (15, 1), (16, 1)],
  term ((-109403 : Rat) / 178716) [(1, 1), (2, 1), (5, 2), (15, 1), (16, 1)],
  term ((251083 : Rat) / 178716) [(1, 1), (2, 1), (14, 1), (15, 1), (16, 1)],
  term ((109403 : Rat) / 178716) [(1, 1), (2, 1), (14, 2), (15, 1), (16, 1)],
  term ((109403 : Rat) / 178716) [(1, 1), (2, 1), (15, 3), (16, 1)],
  term ((109403 : Rat) / 89358) [(1, 1), (2, 2), (4, 1), (15, 1), (16, 1)],
  term ((-109403 : Rat) / 89358) [(1, 1), (2, 2), (14, 1), (15, 1), (16, 1)],
  term ((-251083 : Rat) / 178716) [(1, 1), (3, 1), (5, 1), (15, 1), (16, 1)],
  term ((251083 : Rat) / 178716) [(1, 1), (3, 1), (15, 2), (16, 1)],
  term ((251083 : Rat) / 357432) [(1, 1), (4, 2), (15, 1), (16, 1)],
  term ((251083 : Rat) / 357432) [(1, 1), (5, 2), (15, 1), (16, 1)],
  term ((-251083 : Rat) / 357432) [(1, 1), (14, 2), (15, 1), (16, 1)],
  term ((-251083 : Rat) / 357432) [(1, 1), (15, 3), (16, 1)],
  term ((27424 : Rat) / 44679) [(2, 1), (3, 1), (4, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-13712 : Rat) / 44679) [(2, 1), (3, 1), (4, 1), (11, 1), (15, 2), (16, 1)],
  term ((-34280 : Rat) / 44679) [(2, 1), (3, 1), (4, 1), (13, 1), (15, 2), (16, 1)],
  term ((-857 : Rat) / 14893) [(2, 1), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((3428 : Rat) / 14893) [(2, 1), (3, 1), (4, 1), (15, 3), (16, 1)],
  term ((-27424 : Rat) / 44679) [(2, 1), (3, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((13712 : Rat) / 44679) [(2, 1), (3, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((34280 : Rat) / 44679) [(2, 1), (3, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((857 : Rat) / 14893) [(2, 1), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3428 : Rat) / 14893) [(2, 1), (3, 1), (14, 1), (15, 3), (16, 1)],
  term (18 : Rat) [(2, 1), (4, 1)],
  term ((198808 : Rat) / 134037) [(2, 1), (4, 1), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-99404 : Rat) / 134037) [(2, 1), (4, 1), (5, 1), (13, 1), (15, 2), (16, 1)],
  term ((-24851 : Rat) / 134037) [(2, 1), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((3428 : Rat) / 44679) [(2, 1), (4, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-124249 : Rat) / 44679) [(2, 1), (4, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((273343 : Rat) / 268074) [(2, 1), (4, 1), (6, 1), (15, 2), (16, 1)],
  term ((128807 : Rat) / 89358) [(2, 1), (4, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((167497 : Rat) / 238288) [(2, 1), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((-128807 : Rat) / 178716) [(2, 1), (4, 1), (7, 1), (15, 3), (16, 1)],
  term ((1180595 : Rat) / 536148) [(2, 1), (4, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((18705487 : Rat) / 1608444) [(2, 1), (4, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3079121 : Rat) / 402111) [(2, 1), (4, 1), (8, 1), (15, 2), (16, 1)],
  term (-192 : Rat) [(2, 1), (4, 1), (9, 1), (13, 1)],
  term ((257614 : Rat) / 44679) [(2, 1), (4, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((18565 : Rat) / 268074) [(2, 1), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((-35420 : Rat) / 14893) [(2, 1), (4, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term (96 : Rat) [(2, 1), (4, 1), (11, 1), (15, 1)],
  term ((3694771 : Rat) / 3216888) [(2, 1), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((-128807 : Rat) / 44679) [(2, 1), (4, 1), (11, 1), (15, 3), (16, 1)],
  term ((-49702 : Rat) / 134037) [(2, 1), (4, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term (240 : Rat) [(2, 1), (4, 1), (13, 1), (15, 1)],
  term ((-65706343 : Rat) / 6433776) [(2, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3735403 : Rat) / 536148) [(2, 1), (4, 1), (13, 1), (15, 3), (16, 1)],
  term ((-128807 : Rat) / 268074) [(2, 1), (4, 1), (13, 2), (15, 2), (16, 1)],
  term ((17710 : Rat) / 14893) [(2, 1), (4, 1), (14, 1), (15, 2), (16, 1)],
  term (-72 : Rat) [(2, 1), (4, 1), (15, 2)],
  term ((27127555 : Rat) / 6433776) [(2, 1), (4, 1), (15, 2), (16, 1)],
  term ((128807 : Rat) / 59572) [(2, 1), (4, 1), (15, 4), (16, 1)],
  term ((35420 : Rat) / 14893) [(2, 1), (4, 2), (11, 1), (15, 1), (16, 1)],
  term ((49702 : Rat) / 134037) [(2, 1), (4, 2), (13, 1), (15, 1), (16, 1)],
  term ((-17710 : Rat) / 14893) [(2, 1), (4, 2), (15, 2), (16, 1)],
  term ((-198808 : Rat) / 134037) [(2, 1), (5, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((99404 : Rat) / 134037) [(2, 1), (5, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((24851 : Rat) / 134037) [(2, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3428 : Rat) / 44679) [(2, 1), (6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((124249 : Rat) / 44679) [(2, 1), (6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-273343 : Rat) / 268074) [(2, 1), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((-128807 : Rat) / 89358) [(2, 1), (7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-167497 : Rat) / 238288) [(2, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((128807 : Rat) / 178716) [(2, 1), (7, 1), (14, 1), (15, 3), (16, 1)],
  term ((-1180595 : Rat) / 536148) [(2, 1), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-18705487 : Rat) / 1608444) [(2, 1), (8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((3079121 : Rat) / 402111) [(2, 1), (8, 1), (14, 1), (15, 2), (16, 1)],
  term (192 : Rat) [(2, 1), (9, 1), (13, 1), (14, 1)],
  term ((-257614 : Rat) / 44679) [(2, 1), (9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-18565 : Rat) / 268074) [(2, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term (-96 : Rat) [(2, 1), (11, 1), (14, 1), (15, 1)],
  term ((-3694771 : Rat) / 3216888) [(2, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((128807 : Rat) / 44679) [(2, 1), (11, 1), (14, 1), (15, 3), (16, 1)],
  term (-240 : Rat) [(2, 1), (13, 1), (14, 1), (15, 1)],
  term ((65706343 : Rat) / 6433776) [(2, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((3735403 : Rat) / 536148) [(2, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((128807 : Rat) / 268074) [(2, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term (-18 : Rat) [(2, 1), (14, 1)],
  term (72 : Rat) [(2, 1), (14, 1), (15, 2)],
  term ((-27127555 : Rat) / 6433776) [(2, 1), (14, 1), (15, 2), (16, 1)],
  term ((-128807 : Rat) / 59572) [(2, 1), (14, 1), (15, 4), (16, 1)],
  term ((35420 : Rat) / 14893) [(3, 1), (4, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((49702 : Rat) / 134037) [(3, 1), (4, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-17710 : Rat) / 14893) [(3, 1), (4, 1), (5, 1), (15, 2), (16, 1)],
  term ((-35420 : Rat) / 14893) [(3, 1), (4, 1), (11, 1), (15, 2), (16, 1)],
  term ((-49702 : Rat) / 134037) [(3, 1), (4, 1), (13, 1), (15, 2), (16, 1)],
  term ((17710 : Rat) / 14893) [(3, 1), (4, 1), (15, 3), (16, 1)],
  term ((-13712 : Rat) / 44679) [(3, 1), (4, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((6856 : Rat) / 44679) [(3, 1), (4, 2), (11, 1), (15, 2), (16, 1)],
  term ((17140 : Rat) / 44679) [(3, 1), (4, 2), (13, 1), (15, 2), (16, 1)],
  term ((857 : Rat) / 29786) [(3, 1), (4, 2), (15, 1), (16, 1)],
  term ((-1714 : Rat) / 14893) [(3, 1), (4, 2), (15, 3), (16, 1)],
  term (18 : Rat) [(3, 1), (5, 1)],
  term ((3428 : Rat) / 44679) [(3, 1), (5, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-124249 : Rat) / 44679) [(3, 1), (5, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((273343 : Rat) / 268074) [(3, 1), (5, 1), (6, 1), (15, 2), (16, 1)],
  term ((128807 : Rat) / 89358) [(3, 1), (5, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((167497 : Rat) / 238288) [(3, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-128807 : Rat) / 178716) [(3, 1), (5, 1), (7, 1), (15, 3), (16, 1)],
  term ((1180595 : Rat) / 536148) [(3, 1), (5, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((18705487 : Rat) / 1608444) [(3, 1), (5, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3079121 : Rat) / 402111) [(3, 1), (5, 1), (8, 1), (15, 2), (16, 1)],
  term (-192 : Rat) [(3, 1), (5, 1), (9, 1), (13, 1)],
  term ((257614 : Rat) / 44679) [(3, 1), (5, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((18565 : Rat) / 268074) [(3, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((-198808 : Rat) / 134037) [(3, 1), (5, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term (96 : Rat) [(3, 1), (5, 1), (11, 1), (15, 1)],
  term ((3694771 : Rat) / 3216888) [(3, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((-128807 : Rat) / 44679) [(3, 1), (5, 1), (11, 1), (15, 3), (16, 1)],
  term (240 : Rat) [(3, 1), (5, 1), (13, 1), (15, 1)],
  term ((-65706343 : Rat) / 6433776) [(3, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3337787 : Rat) / 536148) [(3, 1), (5, 1), (13, 1), (15, 3), (16, 1)],
  term ((-128807 : Rat) / 268074) [(3, 1), (5, 1), (13, 2), (15, 2), (16, 1)],
  term (-72 : Rat) [(3, 1), (5, 1), (15, 2)],
  term ((28320403 : Rat) / 6433776) [(3, 1), (5, 1), (15, 2), (16, 1)],
  term ((128807 : Rat) / 59572) [(3, 1), (5, 1), (15, 4), (16, 1)],
  term ((-13712 : Rat) / 44679) [(3, 1), (5, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((198808 : Rat) / 134037) [(3, 1), (5, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((6856 : Rat) / 44679) [(3, 1), (5, 2), (11, 1), (15, 2), (16, 1)],
  term ((-47984 : Rat) / 134037) [(3, 1), (5, 2), (13, 1), (15, 2), (16, 1)],
  term ((-41989 : Rat) / 268074) [(3, 1), (5, 2), (15, 1), (16, 1)],
  term ((-1714 : Rat) / 14893) [(3, 1), (5, 2), (15, 3), (16, 1)],
  term ((-3428 : Rat) / 44679) [(3, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((124249 : Rat) / 44679) [(3, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((-273343 : Rat) / 268074) [(3, 1), (6, 1), (15, 3), (16, 1)],
  term ((-128807 : Rat) / 89358) [(3, 1), (7, 1), (13, 1), (15, 3), (16, 1)],
  term ((-167497 : Rat) / 238288) [(3, 1), (7, 1), (15, 2), (16, 1)],
  term ((128807 : Rat) / 178716) [(3, 1), (7, 1), (15, 4), (16, 1)],
  term ((-1180595 : Rat) / 536148) [(3, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((-18705487 : Rat) / 1608444) [(3, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((3079121 : Rat) / 402111) [(3, 1), (8, 1), (15, 3), (16, 1)],
  term ((13712 : Rat) / 44679) [(3, 1), (9, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term (192 : Rat) [(3, 1), (9, 1), (13, 1), (15, 1)],
  term ((-243902 : Rat) / 44679) [(3, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((-18565 : Rat) / 268074) [(3, 1), (9, 1), (15, 2), (16, 1)],
  term ((-6856 : Rat) / 44679) [(3, 1), (11, 1), (14, 2), (15, 2), (16, 1)],
  term (-96 : Rat) [(3, 1), (11, 1), (15, 2)],
  term ((-3694771 : Rat) / 3216888) [(3, 1), (11, 1), (15, 2), (16, 1)],
  term ((121951 : Rat) / 44679) [(3, 1), (11, 1), (15, 4), (16, 1)],
  term ((-17140 : Rat) / 44679) [(3, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term (-240 : Rat) [(3, 1), (13, 1), (15, 2)],
  term ((65706343 : Rat) / 6433776) [(3, 1), (13, 1), (15, 2), (16, 1)],
  term ((3529723 : Rat) / 536148) [(3, 1), (13, 1), (15, 4), (16, 1)],
  term ((128807 : Rat) / 268074) [(3, 1), (13, 2), (15, 3), (16, 1)],
  term ((-857 : Rat) / 29786) [(3, 1), (14, 2), (15, 1), (16, 1)],
  term ((1714 : Rat) / 14893) [(3, 1), (14, 2), (15, 3), (16, 1)],
  term (-18 : Rat) [(3, 1), (15, 1)],
  term (72 : Rat) [(3, 1), (15, 3)],
  term ((-27312667 : Rat) / 6433776) [(3, 1), (15, 3), (16, 1)],
  term ((-121951 : Rat) / 59572) [(3, 1), (15, 5), (16, 1)],
  term ((27424 : Rat) / 44679) [(3, 2), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-13712 : Rat) / 44679) [(3, 2), (5, 1), (11, 1), (15, 2), (16, 1)],
  term ((-34280 : Rat) / 44679) [(3, 2), (5, 1), (13, 1), (15, 2), (16, 1)],
  term ((-857 : Rat) / 14893) [(3, 2), (5, 1), (15, 1), (16, 1)],
  term ((3428 : Rat) / 14893) [(3, 2), (5, 1), (15, 3), (16, 1)],
  term ((-27424 : Rat) / 44679) [(3, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((13712 : Rat) / 44679) [(3, 2), (11, 1), (15, 3), (16, 1)],
  term ((34280 : Rat) / 44679) [(3, 2), (13, 1), (15, 3), (16, 1)],
  term ((857 : Rat) / 14893) [(3, 2), (15, 2), (16, 1)],
  term ((-3428 : Rat) / 14893) [(3, 2), (15, 4), (16, 1)],
  term ((-17710 : Rat) / 14893) [(4, 1), (5, 2), (11, 1), (15, 1), (16, 1)],
  term ((-24851 : Rat) / 134037) [(4, 1), (5, 2), (13, 1), (15, 1), (16, 1)],
  term ((8855 : Rat) / 14893) [(4, 1), (5, 2), (15, 2), (16, 1)],
  term ((17710 : Rat) / 14893) [(4, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((17710 : Rat) / 14893) [(4, 1), (11, 1), (15, 3), (16, 1)],
  term ((24851 : Rat) / 134037) [(4, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((24851 : Rat) / 134037) [(4, 1), (13, 1), (15, 3), (16, 1)],
  term ((-8855 : Rat) / 14893) [(4, 1), (14, 2), (15, 2), (16, 1)],
  term ((-8855 : Rat) / 14893) [(4, 1), (15, 4), (16, 1)],
  term (-9 : Rat) [(4, 2)],
  term ((-99404 : Rat) / 134037) [(4, 2), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((49702 : Rat) / 134037) [(4, 2), (5, 1), (13, 1), (15, 2), (16, 1)],
  term ((24851 : Rat) / 268074) [(4, 2), (5, 1), (15, 1), (16, 1)],
  term ((-1714 : Rat) / 44679) [(4, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((124249 : Rat) / 89358) [(4, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-273343 : Rat) / 536148) [(4, 2), (6, 1), (15, 2), (16, 1)],
  term ((-128807 : Rat) / 178716) [(4, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-167497 : Rat) / 476576) [(4, 2), (7, 1), (15, 1), (16, 1)],
  term ((128807 : Rat) / 357432) [(4, 2), (7, 1), (15, 3), (16, 1)],
  term ((-1180595 : Rat) / 1072296) [(4, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-18705487 : Rat) / 3216888) [(4, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((3079121 : Rat) / 804222) [(4, 2), (8, 1), (15, 2), (16, 1)],
  term (96 : Rat) [(4, 2), (9, 1), (13, 1)],
  term ((-128807 : Rat) / 44679) [(4, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-18565 : Rat) / 536148) [(4, 2), (9, 1), (15, 1), (16, 1)],
  term (-48 : Rat) [(4, 2), (11, 1), (15, 1)],
  term ((-3694771 : Rat) / 6433776) [(4, 2), (11, 1), (15, 1), (16, 1)],
  term ((128807 : Rat) / 89358) [(4, 2), (11, 1), (15, 3), (16, 1)],
  term (-120 : Rat) [(4, 2), (13, 1), (15, 1)],
  term ((65706343 : Rat) / 12867552) [(4, 2), (13, 1), (15, 1), (16, 1)],
  term ((3735403 : Rat) / 1072296) [(4, 2), (13, 1), (15, 3), (16, 1)],
  term ((128807 : Rat) / 536148) [(4, 2), (13, 2), (15, 2), (16, 1)],
  term (36 : Rat) [(4, 2), (15, 2)],
  term ((-27127555 : Rat) / 12867552) [(4, 2), (15, 2), (16, 1)],
  term ((-128807 : Rat) / 119144) [(4, 2), (15, 4), (16, 1)],
  term ((-17710 : Rat) / 14893) [(4, 3), (11, 1), (15, 1), (16, 1)],
  term ((-24851 : Rat) / 134037) [(4, 3), (13, 1), (15, 1), (16, 1)],
  term ((8855 : Rat) / 14893) [(4, 3), (15, 2), (16, 1)],
  term ((99404 : Rat) / 134037) [(5, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((99404 : Rat) / 134037) [(5, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-49702 : Rat) / 134037) [(5, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-49702 : Rat) / 134037) [(5, 1), (13, 1), (15, 4), (16, 1)],
  term ((-24851 : Rat) / 268074) [(5, 1), (14, 2), (15, 1), (16, 1)],
  term ((-24851 : Rat) / 268074) [(5, 1), (15, 3), (16, 1)],
  term (-9 : Rat) [(5, 2)],
  term ((-1714 : Rat) / 44679) [(5, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((124249 : Rat) / 89358) [(5, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-273343 : Rat) / 536148) [(5, 2), (6, 1), (15, 2), (16, 1)],
  term ((-128807 : Rat) / 178716) [(5, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-167497 : Rat) / 476576) [(5, 2), (7, 1), (15, 1), (16, 1)],
  term ((128807 : Rat) / 357432) [(5, 2), (7, 1), (15, 3), (16, 1)],
  term ((-1180595 : Rat) / 1072296) [(5, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-18705487 : Rat) / 3216888) [(5, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((3079121 : Rat) / 804222) [(5, 2), (8, 1), (15, 2), (16, 1)],
  term (96 : Rat) [(5, 2), (9, 1), (13, 1)],
  term ((-128807 : Rat) / 44679) [(5, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-18565 : Rat) / 536148) [(5, 2), (9, 1), (15, 1), (16, 1)],
  term (-48 : Rat) [(5, 2), (11, 1), (15, 1)],
  term ((-3694771 : Rat) / 6433776) [(5, 2), (11, 1), (15, 1), (16, 1)],
  term ((128807 : Rat) / 89358) [(5, 2), (11, 1), (15, 3), (16, 1)],
  term (-120 : Rat) [(5, 2), (13, 1), (15, 1)],
  term ((65706343 : Rat) / 12867552) [(5, 2), (13, 1), (15, 1), (16, 1)],
  term ((3735403 : Rat) / 1072296) [(5, 2), (13, 1), (15, 3), (16, 1)],
  term ((128807 : Rat) / 536148) [(5, 2), (13, 2), (15, 2), (16, 1)],
  term (36 : Rat) [(5, 2), (15, 2)],
  term ((-27127555 : Rat) / 12867552) [(5, 2), (15, 2), (16, 1)],
  term ((-128807 : Rat) / 119144) [(5, 2), (15, 4), (16, 1)],
  term ((-99404 : Rat) / 134037) [(5, 3), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((49702 : Rat) / 134037) [(5, 3), (13, 1), (15, 2), (16, 1)],
  term ((24851 : Rat) / 268074) [(5, 3), (15, 1), (16, 1)],
  term ((1714 : Rat) / 44679) [(6, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((1714 : Rat) / 44679) [(6, 1), (11, 1), (15, 3), (16, 1)],
  term ((-124249 : Rat) / 89358) [(6, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-124249 : Rat) / 89358) [(6, 1), (13, 1), (15, 3), (16, 1)],
  term ((273343 : Rat) / 536148) [(6, 1), (14, 2), (15, 2), (16, 1)],
  term ((273343 : Rat) / 536148) [(6, 1), (15, 4), (16, 1)],
  term ((128807 : Rat) / 178716) [(7, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((128807 : Rat) / 178716) [(7, 1), (13, 1), (15, 4), (16, 1)],
  term ((167497 : Rat) / 476576) [(7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-128807 : Rat) / 357432) [(7, 1), (14, 2), (15, 3), (16, 1)],
  term ((167497 : Rat) / 476576) [(7, 1), (15, 3), (16, 1)],
  term ((-128807 : Rat) / 357432) [(7, 1), (15, 5), (16, 1)],
  term ((1180595 : Rat) / 1072296) [(8, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((1180595 : Rat) / 1072296) [(8, 1), (11, 1), (15, 3), (16, 1)],
  term ((18705487 : Rat) / 3216888) [(8, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((18705487 : Rat) / 3216888) [(8, 1), (13, 1), (15, 3), (16, 1)],
  term ((-3079121 : Rat) / 804222) [(8, 1), (14, 2), (15, 2), (16, 1)],
  term ((-3079121 : Rat) / 804222) [(8, 1), (15, 4), (16, 1)],
  term (-96 : Rat) [(9, 1), (13, 1), (14, 2)],
  term ((128807 : Rat) / 44679) [(9, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term (-96 : Rat) [(9, 1), (13, 1), (15, 2)],
  term ((128807 : Rat) / 44679) [(9, 1), (13, 1), (15, 4), (16, 1)],
  term ((18565 : Rat) / 536148) [(9, 1), (14, 2), (15, 1), (16, 1)],
  term ((18565 : Rat) / 536148) [(9, 1), (15, 3), (16, 1)],
  term (48 : Rat) [(11, 1), (14, 2), (15, 1)],
  term ((3694771 : Rat) / 6433776) [(11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-128807 : Rat) / 89358) [(11, 1), (14, 2), (15, 3), (16, 1)],
  term (48 : Rat) [(11, 1), (15, 3)],
  term ((3694771 : Rat) / 6433776) [(11, 1), (15, 3), (16, 1)],
  term ((-128807 : Rat) / 89358) [(11, 1), (15, 5), (16, 1)],
  term (120 : Rat) [(13, 1), (14, 2), (15, 1)],
  term ((-65706343 : Rat) / 12867552) [(13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-3735403 : Rat) / 1072296) [(13, 1), (14, 2), (15, 3), (16, 1)],
  term (120 : Rat) [(13, 1), (15, 3)],
  term ((-65706343 : Rat) / 12867552) [(13, 1), (15, 3), (16, 1)],
  term ((-3735403 : Rat) / 1072296) [(13, 1), (15, 5), (16, 1)],
  term ((-128807 : Rat) / 536148) [(13, 2), (14, 2), (15, 2), (16, 1)],
  term ((-128807 : Rat) / 536148) [(13, 2), (15, 4), (16, 1)],
  term (9 : Rat) [(14, 2)],
  term (-36 : Rat) [(14, 2), (15, 2)],
  term ((27127555 : Rat) / 12867552) [(14, 2), (15, 2), (16, 1)],
  term ((128807 : Rat) / 119144) [(14, 2), (15, 4), (16, 1)],
  term (9 : Rat) [(15, 2)],
  term (-36 : Rat) [(15, 4)],
  term ((27127555 : Rat) / 12867552) [(15, 4), (16, 1)],
  term ((128807 : Rat) / 119144) [(15, 6), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 12, terms 0 through 39. -/
theorem rs_R003_ueqv_R003NN_block_12_0000_0039_valid :
    checkProductSumEq rs_R003_ueqv_R003NN_partials_12_0000_0039
      rs_R003_ueqv_R003NN_block_12_0000_0039 = true := by
  native_decide

end R003UeqvR003NNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
