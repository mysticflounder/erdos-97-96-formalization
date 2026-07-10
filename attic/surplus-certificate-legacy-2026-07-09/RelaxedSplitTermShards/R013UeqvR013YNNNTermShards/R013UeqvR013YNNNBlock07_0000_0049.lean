/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R013:u=v:R013YNNN, term block 7:0-49

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R013UeqvR013YNNNTermShards

/-- Generator polynomial 7 for relaxed split surplus certificate `R013:u=v:R013YNNN`. -/
def rs_R013_ueqv_R013YNNN_generator_07_0000_0049 : Poly :=
[
  term (-2 : Rat) [(0, 1), (2, 1)],
  term (2 : Rat) [(0, 1), (4, 1)],
  term (-2 : Rat) [(1, 1), (3, 1)],
  term (2 : Rat) [(1, 1), (5, 1)],
  term (1 : Rat) [(2, 2)],
  term (1 : Rat) [(3, 2)],
  term (-1 : Rat) [(4, 2)],
  term (-1 : Rat) [(5, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 7. -/
def rs_R013_ueqv_R013YNNN_coefficient_07_0000 : Poly :=
[
  term ((-61029914400 : Rat) / 150171761) [(1, 1), (2, 1), (11, 1)]
]

/-- Partial product 0 for generator 7. -/
def rs_R013_ueqv_R013YNNN_partial_07_0000 : Poly :=
[
  term ((-122059828800 : Rat) / 150171761) [(0, 1), (1, 1), (2, 1), (4, 1), (11, 1)],
  term ((122059828800 : Rat) / 150171761) [(0, 1), (1, 1), (2, 2), (11, 1)],
  term ((-61029914400 : Rat) / 150171761) [(1, 1), (2, 1), (3, 2), (11, 1)],
  term ((61029914400 : Rat) / 150171761) [(1, 1), (2, 1), (4, 2), (11, 1)],
  term ((61029914400 : Rat) / 150171761) [(1, 1), (2, 1), (5, 2), (11, 1)],
  term ((-61029914400 : Rat) / 150171761) [(1, 1), (2, 3), (11, 1)],
  term ((122059828800 : Rat) / 150171761) [(1, 2), (2, 1), (3, 1), (11, 1)],
  term ((-122059828800 : Rat) / 150171761) [(1, 2), (2, 1), (5, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 7. -/
theorem rs_R013_ueqv_R013YNNN_partial_07_0000_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_07_0000
        rs_R013_ueqv_R013YNNN_generator_07_0000_0049 =
      rs_R013_ueqv_R013YNNN_partial_07_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 7. -/
def rs_R013_ueqv_R013YNNN_coefficient_07_0001 : Poly :=
[
  term ((-2939821596615979530 : Rat) / 1288183727709509) [(1, 1), (2, 1), (11, 2), (15, 1)]
]

/-- Partial product 1 for generator 7. -/
def rs_R013_ueqv_R013YNNN_partial_07_0001 : Poly :=
[
  term ((-5879643193231959060 : Rat) / 1288183727709509) [(0, 1), (1, 1), (2, 1), (4, 1), (11, 2), (15, 1)],
  term ((5879643193231959060 : Rat) / 1288183727709509) [(0, 1), (1, 1), (2, 2), (11, 2), (15, 1)],
  term ((-2939821596615979530 : Rat) / 1288183727709509) [(1, 1), (2, 1), (3, 2), (11, 2), (15, 1)],
  term ((2939821596615979530 : Rat) / 1288183727709509) [(1, 1), (2, 1), (4, 2), (11, 2), (15, 1)],
  term ((2939821596615979530 : Rat) / 1288183727709509) [(1, 1), (2, 1), (5, 2), (11, 2), (15, 1)],
  term ((-2939821596615979530 : Rat) / 1288183727709509) [(1, 1), (2, 3), (11, 2), (15, 1)],
  term ((5879643193231959060 : Rat) / 1288183727709509) [(1, 2), (2, 1), (3, 1), (11, 2), (15, 1)],
  term ((-5879643193231959060 : Rat) / 1288183727709509) [(1, 2), (2, 1), (5, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 7. -/
theorem rs_R013_ueqv_R013YNNN_partial_07_0001_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_07_0001
        rs_R013_ueqv_R013YNNN_generator_07_0000_0049 =
      rs_R013_ueqv_R013YNNN_partial_07_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 7. -/
def rs_R013_ueqv_R013YNNN_coefficient_07_0002 : Poly :=
[
  term ((-1822387496 : Rat) / 8578069) [(1, 1), (2, 1), (15, 1)]
]

/-- Partial product 2 for generator 7. -/
def rs_R013_ueqv_R013YNNN_partial_07_0002 : Poly :=
[
  term ((-3644774992 : Rat) / 8578069) [(0, 1), (1, 1), (2, 1), (4, 1), (15, 1)],
  term ((3644774992 : Rat) / 8578069) [(0, 1), (1, 1), (2, 2), (15, 1)],
  term ((-1822387496 : Rat) / 8578069) [(1, 1), (2, 1), (3, 2), (15, 1)],
  term ((1822387496 : Rat) / 8578069) [(1, 1), (2, 1), (4, 2), (15, 1)],
  term ((1822387496 : Rat) / 8578069) [(1, 1), (2, 1), (5, 2), (15, 1)],
  term ((-1822387496 : Rat) / 8578069) [(1, 1), (2, 3), (15, 1)],
  term ((3644774992 : Rat) / 8578069) [(1, 2), (2, 1), (3, 1), (15, 1)],
  term ((-3644774992 : Rat) / 8578069) [(1, 2), (2, 1), (5, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 7. -/
theorem rs_R013_ueqv_R013YNNN_partial_07_0002_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_07_0002
        rs_R013_ueqv_R013YNNN_generator_07_0000_0049 =
      rs_R013_ueqv_R013YNNN_partial_07_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 7. -/
def rs_R013_ueqv_R013YNNN_coefficient_07_0003 : Poly :=
[
  term ((61029914400 : Rat) / 150171761) [(1, 1), (11, 1), (12, 1)]
]

/-- Partial product 3 for generator 7. -/
def rs_R013_ueqv_R013YNNN_partial_07_0003 : Poly :=
[
  term ((-122059828800 : Rat) / 150171761) [(0, 1), (1, 1), (2, 1), (11, 1), (12, 1)],
  term ((122059828800 : Rat) / 150171761) [(0, 1), (1, 1), (4, 1), (11, 1), (12, 1)],
  term ((61029914400 : Rat) / 150171761) [(1, 1), (2, 2), (11, 1), (12, 1)],
  term ((61029914400 : Rat) / 150171761) [(1, 1), (3, 2), (11, 1), (12, 1)],
  term ((-61029914400 : Rat) / 150171761) [(1, 1), (4, 2), (11, 1), (12, 1)],
  term ((-61029914400 : Rat) / 150171761) [(1, 1), (5, 2), (11, 1), (12, 1)],
  term ((-122059828800 : Rat) / 150171761) [(1, 2), (3, 1), (11, 1), (12, 1)],
  term ((122059828800 : Rat) / 150171761) [(1, 2), (5, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 7. -/
theorem rs_R013_ueqv_R013YNNN_partial_07_0003_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_07_0003
        rs_R013_ueqv_R013YNNN_generator_07_0000_0049 =
      rs_R013_ueqv_R013YNNN_partial_07_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 7. -/
def rs_R013_ueqv_R013YNNN_coefficient_07_0004 : Poly :=
[
  term ((2939821596615979530 : Rat) / 1288183727709509) [(1, 1), (11, 2), (12, 1), (15, 1)]
]

/-- Partial product 4 for generator 7. -/
def rs_R013_ueqv_R013YNNN_partial_07_0004 : Poly :=
[
  term ((-5879643193231959060 : Rat) / 1288183727709509) [(0, 1), (1, 1), (2, 1), (11, 2), (12, 1), (15, 1)],
  term ((5879643193231959060 : Rat) / 1288183727709509) [(0, 1), (1, 1), (4, 1), (11, 2), (12, 1), (15, 1)],
  term ((2939821596615979530 : Rat) / 1288183727709509) [(1, 1), (2, 2), (11, 2), (12, 1), (15, 1)],
  term ((2939821596615979530 : Rat) / 1288183727709509) [(1, 1), (3, 2), (11, 2), (12, 1), (15, 1)],
  term ((-2939821596615979530 : Rat) / 1288183727709509) [(1, 1), (4, 2), (11, 2), (12, 1), (15, 1)],
  term ((-2939821596615979530 : Rat) / 1288183727709509) [(1, 1), (5, 2), (11, 2), (12, 1), (15, 1)],
  term ((-5879643193231959060 : Rat) / 1288183727709509) [(1, 2), (3, 1), (11, 2), (12, 1), (15, 1)],
  term ((5879643193231959060 : Rat) / 1288183727709509) [(1, 2), (5, 1), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 7. -/
theorem rs_R013_ueqv_R013YNNN_partial_07_0004_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_07_0004
        rs_R013_ueqv_R013YNNN_generator_07_0000_0049 =
      rs_R013_ueqv_R013YNNN_partial_07_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 7. -/
def rs_R013_ueqv_R013YNNN_coefficient_07_0005 : Poly :=
[
  term ((1822387496 : Rat) / 8578069) [(1, 1), (12, 1), (15, 1)]
]

/-- Partial product 5 for generator 7. -/
def rs_R013_ueqv_R013YNNN_partial_07_0005 : Poly :=
[
  term ((-3644774992 : Rat) / 8578069) [(0, 1), (1, 1), (2, 1), (12, 1), (15, 1)],
  term ((3644774992 : Rat) / 8578069) [(0, 1), (1, 1), (4, 1), (12, 1), (15, 1)],
  term ((1822387496 : Rat) / 8578069) [(1, 1), (2, 2), (12, 1), (15, 1)],
  term ((1822387496 : Rat) / 8578069) [(1, 1), (3, 2), (12, 1), (15, 1)],
  term ((-1822387496 : Rat) / 8578069) [(1, 1), (4, 2), (12, 1), (15, 1)],
  term ((-1822387496 : Rat) / 8578069) [(1, 1), (5, 2), (12, 1), (15, 1)],
  term ((-3644774992 : Rat) / 8578069) [(1, 2), (3, 1), (12, 1), (15, 1)],
  term ((3644774992 : Rat) / 8578069) [(1, 2), (5, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 7. -/
theorem rs_R013_ueqv_R013YNNN_partial_07_0005_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_07_0005
        rs_R013_ueqv_R013YNNN_generator_07_0000_0049 =
      rs_R013_ueqv_R013YNNN_partial_07_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 7. -/
def rs_R013_ueqv_R013YNNN_coefficient_07_0006 : Poly :=
[
  term ((-42835869600 : Rat) / 150171761) [(2, 1), (3, 1), (11, 1)]
]

/-- Partial product 6 for generator 7. -/
def rs_R013_ueqv_R013YNNN_partial_07_0006 : Poly :=
[
  term ((-85671739200 : Rat) / 150171761) [(0, 1), (2, 1), (3, 1), (4, 1), (11, 1)],
  term ((85671739200 : Rat) / 150171761) [(0, 1), (2, 2), (3, 1), (11, 1)],
  term ((-85671739200 : Rat) / 150171761) [(1, 1), (2, 1), (3, 1), (5, 1), (11, 1)],
  term ((85671739200 : Rat) / 150171761) [(1, 1), (2, 1), (3, 2), (11, 1)],
  term ((42835869600 : Rat) / 150171761) [(2, 1), (3, 1), (4, 2), (11, 1)],
  term ((42835869600 : Rat) / 150171761) [(2, 1), (3, 1), (5, 2), (11, 1)],
  term ((-42835869600 : Rat) / 150171761) [(2, 1), (3, 3), (11, 1)],
  term ((-42835869600 : Rat) / 150171761) [(2, 3), (3, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 7. -/
theorem rs_R013_ueqv_R013YNNN_partial_07_0006_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_07_0006
        rs_R013_ueqv_R013YNNN_generator_07_0000_0049 =
      rs_R013_ueqv_R013YNNN_partial_07_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 7. -/
def rs_R013_ueqv_R013YNNN_coefficient_07_0007 : Poly :=
[
  term ((-2063411292608758770 : Rat) / 1288183727709509) [(2, 1), (3, 1), (11, 2), (15, 1)]
]

/-- Partial product 7 for generator 7. -/
def rs_R013_ueqv_R013YNNN_partial_07_0007 : Poly :=
[
  term ((-4126822585217517540 : Rat) / 1288183727709509) [(0, 1), (2, 1), (3, 1), (4, 1), (11, 2), (15, 1)],
  term ((4126822585217517540 : Rat) / 1288183727709509) [(0, 1), (2, 2), (3, 1), (11, 2), (15, 1)],
  term ((-4126822585217517540 : Rat) / 1288183727709509) [(1, 1), (2, 1), (3, 1), (5, 1), (11, 2), (15, 1)],
  term ((4126822585217517540 : Rat) / 1288183727709509) [(1, 1), (2, 1), (3, 2), (11, 2), (15, 1)],
  term ((2063411292608758770 : Rat) / 1288183727709509) [(2, 1), (3, 1), (4, 2), (11, 2), (15, 1)],
  term ((2063411292608758770 : Rat) / 1288183727709509) [(2, 1), (3, 1), (5, 2), (11, 2), (15, 1)],
  term ((-2063411292608758770 : Rat) / 1288183727709509) [(2, 1), (3, 3), (11, 2), (15, 1)],
  term ((-2063411292608758770 : Rat) / 1288183727709509) [(2, 3), (3, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 7. -/
theorem rs_R013_ueqv_R013YNNN_partial_07_0007_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_07_0007
        rs_R013_ueqv_R013YNNN_generator_07_0000_0049 =
      rs_R013_ueqv_R013YNNN_partial_07_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 7. -/
def rs_R013_ueqv_R013YNNN_coefficient_07_0008 : Poly :=
[
  term ((499743416 : Rat) / 8578069) [(2, 1), (3, 1), (15, 1)]
]

/-- Partial product 8 for generator 7. -/
def rs_R013_ueqv_R013YNNN_partial_07_0008 : Poly :=
[
  term ((999486832 : Rat) / 8578069) [(0, 1), (2, 1), (3, 1), (4, 1), (15, 1)],
  term ((-999486832 : Rat) / 8578069) [(0, 1), (2, 2), (3, 1), (15, 1)],
  term ((999486832 : Rat) / 8578069) [(1, 1), (2, 1), (3, 1), (5, 1), (15, 1)],
  term ((-999486832 : Rat) / 8578069) [(1, 1), (2, 1), (3, 2), (15, 1)],
  term ((-499743416 : Rat) / 8578069) [(2, 1), (3, 1), (4, 2), (15, 1)],
  term ((-499743416 : Rat) / 8578069) [(2, 1), (3, 1), (5, 2), (15, 1)],
  term ((499743416 : Rat) / 8578069) [(2, 1), (3, 3), (15, 1)],
  term ((499743416 : Rat) / 8578069) [(2, 3), (3, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 7. -/
theorem rs_R013_ueqv_R013YNNN_partial_07_0008_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_07_0008
        rs_R013_ueqv_R013YNNN_generator_07_0000_0049 =
      rs_R013_ueqv_R013YNNN_partial_07_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 7. -/
def rs_R013_ueqv_R013YNNN_coefficient_07_0009 : Poly :=
[
  term ((-11131685600 : Rat) / 150171761) [(2, 1), (5, 1), (11, 1)]
]

/-- Partial product 9 for generator 7. -/
def rs_R013_ueqv_R013YNNN_partial_07_0009 : Poly :=
[
  term ((-22263371200 : Rat) / 150171761) [(0, 1), (2, 1), (4, 1), (5, 1), (11, 1)],
  term ((22263371200 : Rat) / 150171761) [(0, 1), (2, 2), (5, 1), (11, 1)],
  term ((22263371200 : Rat) / 150171761) [(1, 1), (2, 1), (3, 1), (5, 1), (11, 1)],
  term ((-22263371200 : Rat) / 150171761) [(1, 1), (2, 1), (5, 2), (11, 1)],
  term ((-11131685600 : Rat) / 150171761) [(2, 1), (3, 2), (5, 1), (11, 1)],
  term ((11131685600 : Rat) / 150171761) [(2, 1), (4, 2), (5, 1), (11, 1)],
  term ((11131685600 : Rat) / 150171761) [(2, 1), (5, 3), (11, 1)],
  term ((-11131685600 : Rat) / 150171761) [(2, 3), (5, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 7. -/
theorem rs_R013_ueqv_R013YNNN_partial_07_0009_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_07_0009
        rs_R013_ueqv_R013YNNN_generator_07_0000_0049 =
      rs_R013_ueqv_R013YNNN_partial_07_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 7. -/
def rs_R013_ueqv_R013YNNN_coefficient_07_0010 : Poly :=
[
  term ((-536215232404440470 : Rat) / 1288183727709509) [(2, 1), (5, 1), (11, 2), (15, 1)]
]

/-- Partial product 10 for generator 7. -/
def rs_R013_ueqv_R013YNNN_partial_07_0010 : Poly :=
[
  term ((-1072430464808880940 : Rat) / 1288183727709509) [(0, 1), (2, 1), (4, 1), (5, 1), (11, 2), (15, 1)],
  term ((1072430464808880940 : Rat) / 1288183727709509) [(0, 1), (2, 2), (5, 1), (11, 2), (15, 1)],
  term ((1072430464808880940 : Rat) / 1288183727709509) [(1, 1), (2, 1), (3, 1), (5, 1), (11, 2), (15, 1)],
  term ((-1072430464808880940 : Rat) / 1288183727709509) [(1, 1), (2, 1), (5, 2), (11, 2), (15, 1)],
  term ((-536215232404440470 : Rat) / 1288183727709509) [(2, 1), (3, 2), (5, 1), (11, 2), (15, 1)],
  term ((536215232404440470 : Rat) / 1288183727709509) [(2, 1), (4, 2), (5, 1), (11, 2), (15, 1)],
  term ((536215232404440470 : Rat) / 1288183727709509) [(2, 1), (5, 3), (11, 2), (15, 1)],
  term ((-536215232404440470 : Rat) / 1288183727709509) [(2, 3), (5, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 7. -/
theorem rs_R013_ueqv_R013YNNN_partial_07_0010_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_07_0010
        rs_R013_ueqv_R013YNNN_generator_07_0000_0049 =
      rs_R013_ueqv_R013YNNN_partial_07_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 7. -/
def rs_R013_ueqv_R013YNNN_coefficient_07_0011 : Poly :=
[
  term ((8895511928 : Rat) / 25734207) [(2, 1), (5, 1), (15, 1)]
]

/-- Partial product 11 for generator 7. -/
def rs_R013_ueqv_R013YNNN_partial_07_0011 : Poly :=
[
  term ((17791023856 : Rat) / 25734207) [(0, 1), (2, 1), (4, 1), (5, 1), (15, 1)],
  term ((-17791023856 : Rat) / 25734207) [(0, 1), (2, 2), (5, 1), (15, 1)],
  term ((-17791023856 : Rat) / 25734207) [(1, 1), (2, 1), (3, 1), (5, 1), (15, 1)],
  term ((17791023856 : Rat) / 25734207) [(1, 1), (2, 1), (5, 2), (15, 1)],
  term ((8895511928 : Rat) / 25734207) [(2, 1), (3, 2), (5, 1), (15, 1)],
  term ((-8895511928 : Rat) / 25734207) [(2, 1), (4, 2), (5, 1), (15, 1)],
  term ((-8895511928 : Rat) / 25734207) [(2, 1), (5, 3), (15, 1)],
  term ((8895511928 : Rat) / 25734207) [(2, 3), (5, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 7. -/
theorem rs_R013_ueqv_R013YNNN_partial_07_0011_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_07_0011
        rs_R013_ueqv_R013YNNN_generator_07_0000_0049 =
      rs_R013_ueqv_R013YNNN_partial_07_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 7. -/
def rs_R013_ueqv_R013YNNN_coefficient_07_0012 : Poly :=
[
  term ((-235123421600 : Rat) / 150171761) [(2, 1), (11, 1), (13, 1)]
]

/-- Partial product 12 for generator 7. -/
def rs_R013_ueqv_R013YNNN_partial_07_0012 : Poly :=
[
  term ((-470246843200 : Rat) / 150171761) [(0, 1), (2, 1), (4, 1), (11, 1), (13, 1)],
  term ((470246843200 : Rat) / 150171761) [(0, 1), (2, 2), (11, 1), (13, 1)],
  term ((470246843200 : Rat) / 150171761) [(1, 1), (2, 1), (3, 1), (11, 1), (13, 1)],
  term ((-470246843200 : Rat) / 150171761) [(1, 1), (2, 1), (5, 1), (11, 1), (13, 1)],
  term ((-235123421600 : Rat) / 150171761) [(2, 1), (3, 2), (11, 1), (13, 1)],
  term ((235123421600 : Rat) / 150171761) [(2, 1), (4, 2), (11, 1), (13, 1)],
  term ((235123421600 : Rat) / 150171761) [(2, 1), (5, 2), (11, 1), (13, 1)],
  term ((-235123421600 : Rat) / 150171761) [(2, 3), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 7. -/
theorem rs_R013_ueqv_R013YNNN_partial_07_0012_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_07_0012
        rs_R013_ueqv_R013YNNN_generator_07_0000_0049 =
      rs_R013_ueqv_R013YNNN_partial_07_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 7. -/
def rs_R013_ueqv_R013YNNN_coefficient_07_0013 : Poly :=
[
  term ((-19009724800 : Rat) / 150171761) [(2, 1), (11, 1), (15, 1)]
]

/-- Partial product 13 for generator 7. -/
def rs_R013_ueqv_R013YNNN_partial_07_0013 : Poly :=
[
  term ((-38019449600 : Rat) / 150171761) [(0, 1), (2, 1), (4, 1), (11, 1), (15, 1)],
  term ((38019449600 : Rat) / 150171761) [(0, 1), (2, 2), (11, 1), (15, 1)],
  term ((38019449600 : Rat) / 150171761) [(1, 1), (2, 1), (3, 1), (11, 1), (15, 1)],
  term ((-38019449600 : Rat) / 150171761) [(1, 1), (2, 1), (5, 1), (11, 1), (15, 1)],
  term ((-19009724800 : Rat) / 150171761) [(2, 1), (3, 2), (11, 1), (15, 1)],
  term ((19009724800 : Rat) / 150171761) [(2, 1), (4, 2), (11, 1), (15, 1)],
  term ((19009724800 : Rat) / 150171761) [(2, 1), (5, 2), (11, 1), (15, 1)],
  term ((-19009724800 : Rat) / 150171761) [(2, 3), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 7. -/
theorem rs_R013_ueqv_R013YNNN_partial_07_0013_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_07_0013
        rs_R013_ueqv_R013YNNN_generator_07_0000_0049 =
      rs_R013_ueqv_R013YNNN_partial_07_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 7. -/
def rs_R013_ueqv_R013YNNN_coefficient_07_0014 : Poly :=
[
  term ((-11325936132886401170 : Rat) / 1288183727709509) [(2, 1), (11, 2), (13, 1), (15, 1)]
]

/-- Partial product 14 for generator 7. -/
def rs_R013_ueqv_R013YNNN_partial_07_0014 : Poly :=
[
  term ((-22651872265772802340 : Rat) / 1288183727709509) [(0, 1), (2, 1), (4, 1), (11, 2), (13, 1), (15, 1)],
  term ((22651872265772802340 : Rat) / 1288183727709509) [(0, 1), (2, 2), (11, 2), (13, 1), (15, 1)],
  term ((22651872265772802340 : Rat) / 1288183727709509) [(1, 1), (2, 1), (3, 1), (11, 2), (13, 1), (15, 1)],
  term ((-22651872265772802340 : Rat) / 1288183727709509) [(1, 1), (2, 1), (5, 1), (11, 2), (13, 1), (15, 1)],
  term ((-11325936132886401170 : Rat) / 1288183727709509) [(2, 1), (3, 2), (11, 2), (13, 1), (15, 1)],
  term ((11325936132886401170 : Rat) / 1288183727709509) [(2, 1), (4, 2), (11, 2), (13, 1), (15, 1)],
  term ((11325936132886401170 : Rat) / 1288183727709509) [(2, 1), (5, 2), (11, 2), (13, 1), (15, 1)],
  term ((-11325936132886401170 : Rat) / 1288183727709509) [(2, 3), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 7. -/
theorem rs_R013_ueqv_R013YNNN_partial_07_0014_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_07_0014
        rs_R013_ueqv_R013YNNN_generator_07_0000_0049 =
      rs_R013_ueqv_R013YNNN_partial_07_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 7. -/
def rs_R013_ueqv_R013YNNN_coefficient_07_0015 : Poly :=
[
  term ((-915701751545736760 : Rat) / 1288183727709509) [(2, 1), (11, 2), (15, 2)]
]

/-- Partial product 15 for generator 7. -/
def rs_R013_ueqv_R013YNNN_partial_07_0015 : Poly :=
[
  term ((-1831403503091473520 : Rat) / 1288183727709509) [(0, 1), (2, 1), (4, 1), (11, 2), (15, 2)],
  term ((1831403503091473520 : Rat) / 1288183727709509) [(0, 1), (2, 2), (11, 2), (15, 2)],
  term ((1831403503091473520 : Rat) / 1288183727709509) [(1, 1), (2, 1), (3, 1), (11, 2), (15, 2)],
  term ((-1831403503091473520 : Rat) / 1288183727709509) [(1, 1), (2, 1), (5, 1), (11, 2), (15, 2)],
  term ((-915701751545736760 : Rat) / 1288183727709509) [(2, 1), (3, 2), (11, 2), (15, 2)],
  term ((915701751545736760 : Rat) / 1288183727709509) [(2, 1), (4, 2), (11, 2), (15, 2)],
  term ((915701751545736760 : Rat) / 1288183727709509) [(2, 1), (5, 2), (11, 2), (15, 2)],
  term ((-915701751545736760 : Rat) / 1288183727709509) [(2, 3), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 7. -/
theorem rs_R013_ueqv_R013YNNN_partial_07_0015_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_07_0015
        rs_R013_ueqv_R013YNNN_generator_07_0000_0049 =
      rs_R013_ueqv_R013YNNN_partial_07_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 7. -/
def rs_R013_ueqv_R013YNNN_coefficient_07_0016 : Poly :=
[
  term ((-91047725272 : Rat) / 25734207) [(2, 1), (13, 1), (15, 1)]
]

/-- Partial product 16 for generator 7. -/
def rs_R013_ueqv_R013YNNN_partial_07_0016 : Poly :=
[
  term ((-182095450544 : Rat) / 25734207) [(0, 1), (2, 1), (4, 1), (13, 1), (15, 1)],
  term ((182095450544 : Rat) / 25734207) [(0, 1), (2, 2), (13, 1), (15, 1)],
  term ((182095450544 : Rat) / 25734207) [(1, 1), (2, 1), (3, 1), (13, 1), (15, 1)],
  term ((-182095450544 : Rat) / 25734207) [(1, 1), (2, 1), (5, 1), (13, 1), (15, 1)],
  term ((-91047725272 : Rat) / 25734207) [(2, 1), (3, 2), (13, 1), (15, 1)],
  term ((91047725272 : Rat) / 25734207) [(2, 1), (4, 2), (13, 1), (15, 1)],
  term ((91047725272 : Rat) / 25734207) [(2, 1), (5, 2), (13, 1), (15, 1)],
  term ((-91047725272 : Rat) / 25734207) [(2, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 7. -/
theorem rs_R013_ueqv_R013YNNN_partial_07_0016_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_07_0016
        rs_R013_ueqv_R013YNNN_generator_07_0000_0049 =
      rs_R013_ueqv_R013YNNN_partial_07_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 7. -/
def rs_R013_ueqv_R013YNNN_coefficient_07_0017 : Poly :=
[
  term ((-3156045536 : Rat) / 25734207) [(2, 1), (15, 2)]
]

/-- Partial product 17 for generator 7. -/
def rs_R013_ueqv_R013YNNN_partial_07_0017 : Poly :=
[
  term ((-6312091072 : Rat) / 25734207) [(0, 1), (2, 1), (4, 1), (15, 2)],
  term ((6312091072 : Rat) / 25734207) [(0, 1), (2, 2), (15, 2)],
  term ((6312091072 : Rat) / 25734207) [(1, 1), (2, 1), (3, 1), (15, 2)],
  term ((-6312091072 : Rat) / 25734207) [(1, 1), (2, 1), (5, 1), (15, 2)],
  term ((-3156045536 : Rat) / 25734207) [(2, 1), (3, 2), (15, 2)],
  term ((3156045536 : Rat) / 25734207) [(2, 1), (4, 2), (15, 2)],
  term ((3156045536 : Rat) / 25734207) [(2, 1), (5, 2), (15, 2)],
  term ((-3156045536 : Rat) / 25734207) [(2, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 7. -/
theorem rs_R013_ueqv_R013YNNN_partial_07_0017_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_07_0017
        rs_R013_ueqv_R013YNNN_generator_07_0000_0049 =
      rs_R013_ueqv_R013YNNN_partial_07_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 7. -/
def rs_R013_ueqv_R013YNNN_coefficient_07_0018 : Poly :=
[
  term ((11131685600 : Rat) / 150171761) [(3, 1), (4, 1), (11, 1)]
]

/-- Partial product 18 for generator 7. -/
def rs_R013_ueqv_R013YNNN_partial_07_0018 : Poly :=
[
  term ((-22263371200 : Rat) / 150171761) [(0, 1), (2, 1), (3, 1), (4, 1), (11, 1)],
  term ((22263371200 : Rat) / 150171761) [(0, 1), (3, 1), (4, 2), (11, 1)],
  term ((22263371200 : Rat) / 150171761) [(1, 1), (3, 1), (4, 1), (5, 1), (11, 1)],
  term ((-22263371200 : Rat) / 150171761) [(1, 1), (3, 2), (4, 1), (11, 1)],
  term ((11131685600 : Rat) / 150171761) [(2, 2), (3, 1), (4, 1), (11, 1)],
  term ((-11131685600 : Rat) / 150171761) [(3, 1), (4, 1), (5, 2), (11, 1)],
  term ((-11131685600 : Rat) / 150171761) [(3, 1), (4, 3), (11, 1)],
  term ((11131685600 : Rat) / 150171761) [(3, 3), (4, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 7. -/
theorem rs_R013_ueqv_R013YNNN_partial_07_0018_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_07_0018
        rs_R013_ueqv_R013YNNN_generator_07_0000_0049 =
      rs_R013_ueqv_R013YNNN_partial_07_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 7. -/
def rs_R013_ueqv_R013YNNN_coefficient_07_0019 : Poly :=
[
  term ((536215232404440470 : Rat) / 1288183727709509) [(3, 1), (4, 1), (11, 2), (15, 1)]
]

/-- Partial product 19 for generator 7. -/
def rs_R013_ueqv_R013YNNN_partial_07_0019 : Poly :=
[
  term ((-1072430464808880940 : Rat) / 1288183727709509) [(0, 1), (2, 1), (3, 1), (4, 1), (11, 2), (15, 1)],
  term ((1072430464808880940 : Rat) / 1288183727709509) [(0, 1), (3, 1), (4, 2), (11, 2), (15, 1)],
  term ((1072430464808880940 : Rat) / 1288183727709509) [(1, 1), (3, 1), (4, 1), (5, 1), (11, 2), (15, 1)],
  term ((-1072430464808880940 : Rat) / 1288183727709509) [(1, 1), (3, 2), (4, 1), (11, 2), (15, 1)],
  term ((536215232404440470 : Rat) / 1288183727709509) [(2, 2), (3, 1), (4, 1), (11, 2), (15, 1)],
  term ((-536215232404440470 : Rat) / 1288183727709509) [(3, 1), (4, 1), (5, 2), (11, 2), (15, 1)],
  term ((-536215232404440470 : Rat) / 1288183727709509) [(3, 1), (4, 3), (11, 2), (15, 1)],
  term ((536215232404440470 : Rat) / 1288183727709509) [(3, 3), (4, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 7. -/
theorem rs_R013_ueqv_R013YNNN_partial_07_0019_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_07_0019
        rs_R013_ueqv_R013YNNN_generator_07_0000_0049 =
      rs_R013_ueqv_R013YNNN_partial_07_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 7. -/
def rs_R013_ueqv_R013YNNN_coefficient_07_0020 : Poly :=
[
  term ((-8895511928 : Rat) / 25734207) [(3, 1), (4, 1), (15, 1)]
]

/-- Partial product 20 for generator 7. -/
def rs_R013_ueqv_R013YNNN_partial_07_0020 : Poly :=
[
  term ((17791023856 : Rat) / 25734207) [(0, 1), (2, 1), (3, 1), (4, 1), (15, 1)],
  term ((-17791023856 : Rat) / 25734207) [(0, 1), (3, 1), (4, 2), (15, 1)],
  term ((-17791023856 : Rat) / 25734207) [(1, 1), (3, 1), (4, 1), (5, 1), (15, 1)],
  term ((17791023856 : Rat) / 25734207) [(1, 1), (3, 2), (4, 1), (15, 1)],
  term ((-8895511928 : Rat) / 25734207) [(2, 2), (3, 1), (4, 1), (15, 1)],
  term ((8895511928 : Rat) / 25734207) [(3, 1), (4, 1), (5, 2), (15, 1)],
  term ((8895511928 : Rat) / 25734207) [(3, 1), (4, 3), (15, 1)],
  term ((-8895511928 : Rat) / 25734207) [(3, 3), (4, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 7. -/
theorem rs_R013_ueqv_R013YNNN_partial_07_0020_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_07_0020
        rs_R013_ueqv_R013YNNN_generator_07_0000_0049 =
      rs_R013_ueqv_R013YNNN_partial_07_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 7. -/
def rs_R013_ueqv_R013YNNN_coefficient_07_0021 : Poly :=
[
  term ((56905387200 : Rat) / 150171761) [(3, 1), (11, 1)]
]

/-- Partial product 21 for generator 7. -/
def rs_R013_ueqv_R013YNNN_partial_07_0021 : Poly :=
[
  term ((-113810774400 : Rat) / 150171761) [(0, 1), (2, 1), (3, 1), (11, 1)],
  term ((113810774400 : Rat) / 150171761) [(0, 1), (3, 1), (4, 1), (11, 1)],
  term ((113810774400 : Rat) / 150171761) [(1, 1), (3, 1), (5, 1), (11, 1)],
  term ((-113810774400 : Rat) / 150171761) [(1, 1), (3, 2), (11, 1)],
  term ((56905387200 : Rat) / 150171761) [(2, 2), (3, 1), (11, 1)],
  term ((-56905387200 : Rat) / 150171761) [(3, 1), (4, 2), (11, 1)],
  term ((-56905387200 : Rat) / 150171761) [(3, 1), (5, 2), (11, 1)],
  term ((56905387200 : Rat) / 150171761) [(3, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 7. -/
theorem rs_R013_ueqv_R013YNNN_partial_07_0021_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_07_0021
        rs_R013_ueqv_R013YNNN_generator_07_0000_0049 =
      rs_R013_ueqv_R013YNNN_partial_07_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 7. -/
def rs_R013_ueqv_R013YNNN_coefficient_07_0022 : Poly :=
[
  term ((-122059828800 : Rat) / 150171761) [(3, 1), (11, 1), (12, 1)]
]

/-- Partial product 22 for generator 7. -/
def rs_R013_ueqv_R013YNNN_partial_07_0022 : Poly :=
[
  term ((244119657600 : Rat) / 150171761) [(0, 1), (2, 1), (3, 1), (11, 1), (12, 1)],
  term ((-244119657600 : Rat) / 150171761) [(0, 1), (3, 1), (4, 1), (11, 1), (12, 1)],
  term ((-244119657600 : Rat) / 150171761) [(1, 1), (3, 1), (5, 1), (11, 1), (12, 1)],
  term ((244119657600 : Rat) / 150171761) [(1, 1), (3, 2), (11, 1), (12, 1)],
  term ((-122059828800 : Rat) / 150171761) [(2, 2), (3, 1), (11, 1), (12, 1)],
  term ((122059828800 : Rat) / 150171761) [(3, 1), (4, 2), (11, 1), (12, 1)],
  term ((122059828800 : Rat) / 150171761) [(3, 1), (5, 2), (11, 1), (12, 1)],
  term ((-122059828800 : Rat) / 150171761) [(3, 3), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 7. -/
theorem rs_R013_ueqv_R013YNNN_partial_07_0022_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_07_0022
        rs_R013_ueqv_R013YNNN_generator_07_0000_0049 =
      rs_R013_ueqv_R013YNNN_partial_07_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 7. -/
def rs_R013_ueqv_R013YNNN_coefficient_07_0023 : Poly :=
[
  term ((-5879643193231959060 : Rat) / 1288183727709509) [(3, 1), (11, 2), (12, 1), (15, 1)]
]

/-- Partial product 23 for generator 7. -/
def rs_R013_ueqv_R013YNNN_partial_07_0023 : Poly :=
[
  term ((11759286386463918120 : Rat) / 1288183727709509) [(0, 1), (2, 1), (3, 1), (11, 2), (12, 1), (15, 1)],
  term ((-11759286386463918120 : Rat) / 1288183727709509) [(0, 1), (3, 1), (4, 1), (11, 2), (12, 1), (15, 1)],
  term ((-11759286386463918120 : Rat) / 1288183727709509) [(1, 1), (3, 1), (5, 1), (11, 2), (12, 1), (15, 1)],
  term ((11759286386463918120 : Rat) / 1288183727709509) [(1, 1), (3, 2), (11, 2), (12, 1), (15, 1)],
  term ((-5879643193231959060 : Rat) / 1288183727709509) [(2, 2), (3, 1), (11, 2), (12, 1), (15, 1)],
  term ((5879643193231959060 : Rat) / 1288183727709509) [(3, 1), (4, 2), (11, 2), (12, 1), (15, 1)],
  term ((5879643193231959060 : Rat) / 1288183727709509) [(3, 1), (5, 2), (11, 2), (12, 1), (15, 1)],
  term ((-5879643193231959060 : Rat) / 1288183727709509) [(3, 3), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 7. -/
theorem rs_R013_ueqv_R013YNNN_partial_07_0023_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_07_0023
        rs_R013_ueqv_R013YNNN_generator_07_0000_0049 =
      rs_R013_ueqv_R013YNNN_partial_07_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 7. -/
def rs_R013_ueqv_R013YNNN_coefficient_07_0024 : Poly :=
[
  term ((2741142403672690140 : Rat) / 1288183727709509) [(3, 1), (11, 2), (15, 1)]
]

/-- Partial product 24 for generator 7. -/
def rs_R013_ueqv_R013YNNN_partial_07_0024 : Poly :=
[
  term ((-5482284807345380280 : Rat) / 1288183727709509) [(0, 1), (2, 1), (3, 1), (11, 2), (15, 1)],
  term ((5482284807345380280 : Rat) / 1288183727709509) [(0, 1), (3, 1), (4, 1), (11, 2), (15, 1)],
  term ((5482284807345380280 : Rat) / 1288183727709509) [(1, 1), (3, 1), (5, 1), (11, 2), (15, 1)],
  term ((-5482284807345380280 : Rat) / 1288183727709509) [(1, 1), (3, 2), (11, 2), (15, 1)],
  term ((2741142403672690140 : Rat) / 1288183727709509) [(2, 2), (3, 1), (11, 2), (15, 1)],
  term ((-2741142403672690140 : Rat) / 1288183727709509) [(3, 1), (4, 2), (11, 2), (15, 1)],
  term ((-2741142403672690140 : Rat) / 1288183727709509) [(3, 1), (5, 2), (11, 2), (15, 1)],
  term ((2741142403672690140 : Rat) / 1288183727709509) [(3, 3), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 7. -/
theorem rs_R013_ueqv_R013YNNN_partial_07_0024_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_07_0024
        rs_R013_ueqv_R013YNNN_generator_07_0000_0049 =
      rs_R013_ueqv_R013YNNN_partial_07_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 7. -/
def rs_R013_ueqv_R013YNNN_coefficient_07_0025 : Poly :=
[
  term ((-3644774992 : Rat) / 8578069) [(3, 1), (12, 1), (15, 1)]
]

/-- Partial product 25 for generator 7. -/
def rs_R013_ueqv_R013YNNN_partial_07_0025 : Poly :=
[
  term ((7289549984 : Rat) / 8578069) [(0, 1), (2, 1), (3, 1), (12, 1), (15, 1)],
  term ((-7289549984 : Rat) / 8578069) [(0, 1), (3, 1), (4, 1), (12, 1), (15, 1)],
  term ((-7289549984 : Rat) / 8578069) [(1, 1), (3, 1), (5, 1), (12, 1), (15, 1)],
  term ((7289549984 : Rat) / 8578069) [(1, 1), (3, 2), (12, 1), (15, 1)],
  term ((-3644774992 : Rat) / 8578069) [(2, 2), (3, 1), (12, 1), (15, 1)],
  term ((3644774992 : Rat) / 8578069) [(3, 1), (4, 2), (12, 1), (15, 1)],
  term ((3644774992 : Rat) / 8578069) [(3, 1), (5, 2), (12, 1), (15, 1)],
  term ((-3644774992 : Rat) / 8578069) [(3, 3), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 7. -/
theorem rs_R013_ueqv_R013YNNN_partial_07_0025_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_07_0025
        rs_R013_ueqv_R013YNNN_generator_07_0000_0049 =
      rs_R013_ueqv_R013YNNN_partial_07_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 7. -/
def rs_R013_ueqv_R013YNNN_coefficient_07_0026 : Poly :=
[
  term ((2451940208 : Rat) / 8578069) [(3, 1), (15, 1)]
]

/-- Partial product 26 for generator 7. -/
def rs_R013_ueqv_R013YNNN_partial_07_0026 : Poly :=
[
  term ((-4903880416 : Rat) / 8578069) [(0, 1), (2, 1), (3, 1), (15, 1)],
  term ((4903880416 : Rat) / 8578069) [(0, 1), (3, 1), (4, 1), (15, 1)],
  term ((4903880416 : Rat) / 8578069) [(1, 1), (3, 1), (5, 1), (15, 1)],
  term ((-4903880416 : Rat) / 8578069) [(1, 1), (3, 2), (15, 1)],
  term ((2451940208 : Rat) / 8578069) [(2, 2), (3, 1), (15, 1)],
  term ((-2451940208 : Rat) / 8578069) [(3, 1), (4, 2), (15, 1)],
  term ((-2451940208 : Rat) / 8578069) [(3, 1), (5, 2), (15, 1)],
  term ((2451940208 : Rat) / 8578069) [(3, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 7. -/
theorem rs_R013_ueqv_R013YNNN_partial_07_0026_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_07_0026
        rs_R013_ueqv_R013YNNN_generator_07_0000_0049 =
      rs_R013_ueqv_R013YNNN_partial_07_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 7. -/
def rs_R013_ueqv_R013YNNN_coefficient_07_0027 : Poly :=
[
  term ((-19009724800 : Rat) / 150171761) [(4, 1), (7, 1), (11, 1)]
]

/-- Partial product 27 for generator 7. -/
def rs_R013_ueqv_R013YNNN_partial_07_0027 : Poly :=
[
  term ((38019449600 : Rat) / 150171761) [(0, 1), (2, 1), (4, 1), (7, 1), (11, 1)],
  term ((-38019449600 : Rat) / 150171761) [(0, 1), (4, 2), (7, 1), (11, 1)],
  term ((38019449600 : Rat) / 150171761) [(1, 1), (3, 1), (4, 1), (7, 1), (11, 1)],
  term ((-38019449600 : Rat) / 150171761) [(1, 1), (4, 1), (5, 1), (7, 1), (11, 1)],
  term ((-19009724800 : Rat) / 150171761) [(2, 2), (4, 1), (7, 1), (11, 1)],
  term ((-19009724800 : Rat) / 150171761) [(3, 2), (4, 1), (7, 1), (11, 1)],
  term ((19009724800 : Rat) / 150171761) [(4, 1), (5, 2), (7, 1), (11, 1)],
  term ((19009724800 : Rat) / 150171761) [(4, 3), (7, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 7. -/
theorem rs_R013_ueqv_R013YNNN_partial_07_0027_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_07_0027
        rs_R013_ueqv_R013YNNN_generator_07_0000_0049 =
      rs_R013_ueqv_R013YNNN_partial_07_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 7. -/
def rs_R013_ueqv_R013YNNN_coefficient_07_0028 : Poly :=
[
  term ((-915701751545736760 : Rat) / 1288183727709509) [(4, 1), (7, 1), (11, 2), (15, 1)]
]

/-- Partial product 28 for generator 7. -/
def rs_R013_ueqv_R013YNNN_partial_07_0028 : Poly :=
[
  term ((1831403503091473520 : Rat) / 1288183727709509) [(0, 1), (2, 1), (4, 1), (7, 1), (11, 2), (15, 1)],
  term ((-1831403503091473520 : Rat) / 1288183727709509) [(0, 1), (4, 2), (7, 1), (11, 2), (15, 1)],
  term ((1831403503091473520 : Rat) / 1288183727709509) [(1, 1), (3, 1), (4, 1), (7, 1), (11, 2), (15, 1)],
  term ((-1831403503091473520 : Rat) / 1288183727709509) [(1, 1), (4, 1), (5, 1), (7, 1), (11, 2), (15, 1)],
  term ((-915701751545736760 : Rat) / 1288183727709509) [(2, 2), (4, 1), (7, 1), (11, 2), (15, 1)],
  term ((-915701751545736760 : Rat) / 1288183727709509) [(3, 2), (4, 1), (7, 1), (11, 2), (15, 1)],
  term ((915701751545736760 : Rat) / 1288183727709509) [(4, 1), (5, 2), (7, 1), (11, 2), (15, 1)],
  term ((915701751545736760 : Rat) / 1288183727709509) [(4, 3), (7, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 7. -/
theorem rs_R013_ueqv_R013YNNN_partial_07_0028_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_07_0028
        rs_R013_ueqv_R013YNNN_generator_07_0000_0049 =
      rs_R013_ueqv_R013YNNN_partial_07_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 7. -/
def rs_R013_ueqv_R013YNNN_coefficient_07_0029 : Poly :=
[
  term ((-3156045536 : Rat) / 25734207) [(4, 1), (7, 1), (15, 1)]
]

/-- Partial product 29 for generator 7. -/
def rs_R013_ueqv_R013YNNN_partial_07_0029 : Poly :=
[
  term ((6312091072 : Rat) / 25734207) [(0, 1), (2, 1), (4, 1), (7, 1), (15, 1)],
  term ((-6312091072 : Rat) / 25734207) [(0, 1), (4, 2), (7, 1), (15, 1)],
  term ((6312091072 : Rat) / 25734207) [(1, 1), (3, 1), (4, 1), (7, 1), (15, 1)],
  term ((-6312091072 : Rat) / 25734207) [(1, 1), (4, 1), (5, 1), (7, 1), (15, 1)],
  term ((-3156045536 : Rat) / 25734207) [(2, 2), (4, 1), (7, 1), (15, 1)],
  term ((-3156045536 : Rat) / 25734207) [(3, 2), (4, 1), (7, 1), (15, 1)],
  term ((3156045536 : Rat) / 25734207) [(4, 1), (5, 2), (7, 1), (15, 1)],
  term ((3156045536 : Rat) / 25734207) [(4, 3), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 7. -/
theorem rs_R013_ueqv_R013YNNN_partial_07_0029_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_07_0029
        rs_R013_ueqv_R013YNNN_generator_07_0000_0049 =
      rs_R013_ueqv_R013YNNN_partial_07_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 7. -/
def rs_R013_ueqv_R013YNNN_coefficient_07_0030 : Poly :=
[
  term ((1626823200 : Rat) / 150171761) [(5, 1), (11, 1)]
]

/-- Partial product 30 for generator 7. -/
def rs_R013_ueqv_R013YNNN_partial_07_0030 : Poly :=
[
  term ((-3253646400 : Rat) / 150171761) [(0, 1), (2, 1), (5, 1), (11, 1)],
  term ((3253646400 : Rat) / 150171761) [(0, 1), (4, 1), (5, 1), (11, 1)],
  term ((-3253646400 : Rat) / 150171761) [(1, 1), (3, 1), (5, 1), (11, 1)],
  term ((3253646400 : Rat) / 150171761) [(1, 1), (5, 2), (11, 1)],
  term ((1626823200 : Rat) / 150171761) [(2, 2), (5, 1), (11, 1)],
  term ((1626823200 : Rat) / 150171761) [(3, 2), (5, 1), (11, 1)],
  term ((-1626823200 : Rat) / 150171761) [(4, 2), (5, 1), (11, 1)],
  term ((-1626823200 : Rat) / 150171761) [(5, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 7. -/
theorem rs_R013_ueqv_R013YNNN_partial_07_0030_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_07_0030
        rs_R013_ueqv_R013YNNN_generator_07_0000_0049 =
      rs_R013_ueqv_R013YNNN_partial_07_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 7. -/
def rs_R013_ueqv_R013YNNN_coefficient_07_0031 : Poly :=
[
  term ((78364356631572090 : Rat) / 1288183727709509) [(5, 1), (11, 2), (15, 1)]
]

/-- Partial product 31 for generator 7. -/
def rs_R013_ueqv_R013YNNN_partial_07_0031 : Poly :=
[
  term ((-156728713263144180 : Rat) / 1288183727709509) [(0, 1), (2, 1), (5, 1), (11, 2), (15, 1)],
  term ((156728713263144180 : Rat) / 1288183727709509) [(0, 1), (4, 1), (5, 1), (11, 2), (15, 1)],
  term ((-156728713263144180 : Rat) / 1288183727709509) [(1, 1), (3, 1), (5, 1), (11, 2), (15, 1)],
  term ((156728713263144180 : Rat) / 1288183727709509) [(1, 1), (5, 2), (11, 2), (15, 1)],
  term ((78364356631572090 : Rat) / 1288183727709509) [(2, 2), (5, 1), (11, 2), (15, 1)],
  term ((78364356631572090 : Rat) / 1288183727709509) [(3, 2), (5, 1), (11, 2), (15, 1)],
  term ((-78364356631572090 : Rat) / 1288183727709509) [(4, 2), (5, 1), (11, 2), (15, 1)],
  term ((-78364356631572090 : Rat) / 1288183727709509) [(5, 3), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 7. -/
theorem rs_R013_ueqv_R013YNNN_partial_07_0031_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_07_0031
        rs_R013_ueqv_R013YNNN_generator_07_0000_0049 =
      rs_R013_ueqv_R013YNNN_partial_07_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 7. -/
def rs_R013_ueqv_R013YNNN_coefficient_07_0032 : Poly :=
[
  term ((-3491178232 : Rat) / 8578069) [(5, 1), (15, 1)]
]

/-- Partial product 32 for generator 7. -/
def rs_R013_ueqv_R013YNNN_partial_07_0032 : Poly :=
[
  term ((6982356464 : Rat) / 8578069) [(0, 1), (2, 1), (5, 1), (15, 1)],
  term ((-6982356464 : Rat) / 8578069) [(0, 1), (4, 1), (5, 1), (15, 1)],
  term ((6982356464 : Rat) / 8578069) [(1, 1), (3, 1), (5, 1), (15, 1)],
  term ((-6982356464 : Rat) / 8578069) [(1, 1), (5, 2), (15, 1)],
  term ((-3491178232 : Rat) / 8578069) [(2, 2), (5, 1), (15, 1)],
  term ((-3491178232 : Rat) / 8578069) [(3, 2), (5, 1), (15, 1)],
  term ((3491178232 : Rat) / 8578069) [(4, 2), (5, 1), (15, 1)],
  term ((3491178232 : Rat) / 8578069) [(5, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 7. -/
theorem rs_R013_ueqv_R013YNNN_partial_07_0032_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_07_0032
        rs_R013_ueqv_R013YNNN_generator_07_0000_0049 =
      rs_R013_ueqv_R013YNNN_partial_07_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 7. -/
def rs_R013_ueqv_R013YNNN_coefficient_07_0033 : Poly :=
[
  term ((38019449600 : Rat) / 150171761) [(7, 1), (11, 1)]
]

/-- Partial product 33 for generator 7. -/
def rs_R013_ueqv_R013YNNN_partial_07_0033 : Poly :=
[
  term ((-76038899200 : Rat) / 150171761) [(0, 1), (2, 1), (7, 1), (11, 1)],
  term ((76038899200 : Rat) / 150171761) [(0, 1), (4, 1), (7, 1), (11, 1)],
  term ((-76038899200 : Rat) / 150171761) [(1, 1), (3, 1), (7, 1), (11, 1)],
  term ((76038899200 : Rat) / 150171761) [(1, 1), (5, 1), (7, 1), (11, 1)],
  term ((38019449600 : Rat) / 150171761) [(2, 2), (7, 1), (11, 1)],
  term ((38019449600 : Rat) / 150171761) [(3, 2), (7, 1), (11, 1)],
  term ((-38019449600 : Rat) / 150171761) [(4, 2), (7, 1), (11, 1)],
  term ((-38019449600 : Rat) / 150171761) [(5, 2), (7, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 7. -/
theorem rs_R013_ueqv_R013YNNN_partial_07_0033_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_07_0033
        rs_R013_ueqv_R013YNNN_generator_07_0000_0049 =
      rs_R013_ueqv_R013YNNN_partial_07_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 7. -/
def rs_R013_ueqv_R013YNNN_coefficient_07_0034 : Poly :=
[
  term ((1831403503091473520 : Rat) / 1288183727709509) [(7, 1), (11, 2), (15, 1)]
]

/-- Partial product 34 for generator 7. -/
def rs_R013_ueqv_R013YNNN_partial_07_0034 : Poly :=
[
  term ((-3662807006182947040 : Rat) / 1288183727709509) [(0, 1), (2, 1), (7, 1), (11, 2), (15, 1)],
  term ((3662807006182947040 : Rat) / 1288183727709509) [(0, 1), (4, 1), (7, 1), (11, 2), (15, 1)],
  term ((-3662807006182947040 : Rat) / 1288183727709509) [(1, 1), (3, 1), (7, 1), (11, 2), (15, 1)],
  term ((3662807006182947040 : Rat) / 1288183727709509) [(1, 1), (5, 1), (7, 1), (11, 2), (15, 1)],
  term ((1831403503091473520 : Rat) / 1288183727709509) [(2, 2), (7, 1), (11, 2), (15, 1)],
  term ((1831403503091473520 : Rat) / 1288183727709509) [(3, 2), (7, 1), (11, 2), (15, 1)],
  term ((-1831403503091473520 : Rat) / 1288183727709509) [(4, 2), (7, 1), (11, 2), (15, 1)],
  term ((-1831403503091473520 : Rat) / 1288183727709509) [(5, 2), (7, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 7. -/
theorem rs_R013_ueqv_R013YNNN_partial_07_0034_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_07_0034
        rs_R013_ueqv_R013YNNN_generator_07_0000_0049 =
      rs_R013_ueqv_R013YNNN_partial_07_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 7. -/
def rs_R013_ueqv_R013YNNN_coefficient_07_0035 : Poly :=
[
  term ((6312091072 : Rat) / 25734207) [(7, 1), (15, 1)]
]

/-- Partial product 35 for generator 7. -/
def rs_R013_ueqv_R013YNNN_partial_07_0035 : Poly :=
[
  term ((-12624182144 : Rat) / 25734207) [(0, 1), (2, 1), (7, 1), (15, 1)],
  term ((12624182144 : Rat) / 25734207) [(0, 1), (4, 1), (7, 1), (15, 1)],
  term ((-12624182144 : Rat) / 25734207) [(1, 1), (3, 1), (7, 1), (15, 1)],
  term ((12624182144 : Rat) / 25734207) [(1, 1), (5, 1), (7, 1), (15, 1)],
  term ((6312091072 : Rat) / 25734207) [(2, 2), (7, 1), (15, 1)],
  term ((6312091072 : Rat) / 25734207) [(3, 2), (7, 1), (15, 1)],
  term ((-6312091072 : Rat) / 25734207) [(4, 2), (7, 1), (15, 1)],
  term ((-6312091072 : Rat) / 25734207) [(5, 2), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 7. -/
theorem rs_R013_ueqv_R013YNNN_partial_07_0035_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_07_0035
        rs_R013_ueqv_R013YNNN_generator_07_0000_0049 =
      rs_R013_ueqv_R013YNNN_partial_07_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 7. -/
def rs_R013_ueqv_R013YNNN_coefficient_07_0036 : Poly :=
[
  term ((-13546041600 : Rat) / 150171761) [(9, 1), (11, 1)]
]

/-- Partial product 36 for generator 7. -/
def rs_R013_ueqv_R013YNNN_partial_07_0036 : Poly :=
[
  term ((27092083200 : Rat) / 150171761) [(0, 1), (2, 1), (9, 1), (11, 1)],
  term ((-27092083200 : Rat) / 150171761) [(0, 1), (4, 1), (9, 1), (11, 1)],
  term ((27092083200 : Rat) / 150171761) [(1, 1), (3, 1), (9, 1), (11, 1)],
  term ((-27092083200 : Rat) / 150171761) [(1, 1), (5, 1), (9, 1), (11, 1)],
  term ((-13546041600 : Rat) / 150171761) [(2, 2), (9, 1), (11, 1)],
  term ((-13546041600 : Rat) / 150171761) [(3, 2), (9, 1), (11, 1)],
  term ((13546041600 : Rat) / 150171761) [(4, 2), (9, 1), (11, 1)],
  term ((13546041600 : Rat) / 150171761) [(5, 2), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 7. -/
theorem rs_R013_ueqv_R013YNNN_partial_07_0036_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_07_0036
        rs_R013_ueqv_R013YNNN_generator_07_0000_0049 =
      rs_R013_ueqv_R013YNNN_partial_07_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 7. -/
def rs_R013_ueqv_R013YNNN_coefficient_07_0037 : Poly :=
[
  term ((-652515181052563920 : Rat) / 1288183727709509) [(9, 1), (11, 2), (15, 1)]
]

/-- Partial product 37 for generator 7. -/
def rs_R013_ueqv_R013YNNN_partial_07_0037 : Poly :=
[
  term ((1305030362105127840 : Rat) / 1288183727709509) [(0, 1), (2, 1), (9, 1), (11, 2), (15, 1)],
  term ((-1305030362105127840 : Rat) / 1288183727709509) [(0, 1), (4, 1), (9, 1), (11, 2), (15, 1)],
  term ((1305030362105127840 : Rat) / 1288183727709509) [(1, 1), (3, 1), (9, 1), (11, 2), (15, 1)],
  term ((-1305030362105127840 : Rat) / 1288183727709509) [(1, 1), (5, 1), (9, 1), (11, 2), (15, 1)],
  term ((-652515181052563920 : Rat) / 1288183727709509) [(2, 2), (9, 1), (11, 2), (15, 1)],
  term ((-652515181052563920 : Rat) / 1288183727709509) [(3, 2), (9, 1), (11, 2), (15, 1)],
  term ((652515181052563920 : Rat) / 1288183727709509) [(4, 2), (9, 1), (11, 2), (15, 1)],
  term ((652515181052563920 : Rat) / 1288183727709509) [(5, 2), (9, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 7. -/
theorem rs_R013_ueqv_R013YNNN_partial_07_0037_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_07_0037
        rs_R013_ueqv_R013YNNN_generator_07_0000_0049 =
      rs_R013_ueqv_R013YNNN_partial_07_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 7. -/
def rs_R013_ueqv_R013YNNN_coefficient_07_0038 : Poly :=
[
  term ((860779296 : Rat) / 8578069) [(9, 1), (15, 1)]
]

/-- Partial product 38 for generator 7. -/
def rs_R013_ueqv_R013YNNN_partial_07_0038 : Poly :=
[
  term ((-1721558592 : Rat) / 8578069) [(0, 1), (2, 1), (9, 1), (15, 1)],
  term ((1721558592 : Rat) / 8578069) [(0, 1), (4, 1), (9, 1), (15, 1)],
  term ((-1721558592 : Rat) / 8578069) [(1, 1), (3, 1), (9, 1), (15, 1)],
  term ((1721558592 : Rat) / 8578069) [(1, 1), (5, 1), (9, 1), (15, 1)],
  term ((860779296 : Rat) / 8578069) [(2, 2), (9, 1), (15, 1)],
  term ((860779296 : Rat) / 8578069) [(3, 2), (9, 1), (15, 1)],
  term ((-860779296 : Rat) / 8578069) [(4, 2), (9, 1), (15, 1)],
  term ((-860779296 : Rat) / 8578069) [(5, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 7. -/
theorem rs_R013_ueqv_R013YNNN_partial_07_0038_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_07_0038
        rs_R013_ueqv_R013YNNN_generator_07_0000_0049 =
      rs_R013_ueqv_R013YNNN_partial_07_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 7. -/
def rs_R013_ueqv_R013YNNN_coefficient_07_0039 : Poly :=
[
  term ((13546041600 : Rat) / 150171761) [(10, 1), (11, 1), (15, 1)]
]

/-- Partial product 39 for generator 7. -/
def rs_R013_ueqv_R013YNNN_partial_07_0039 : Poly :=
[
  term ((-27092083200 : Rat) / 150171761) [(0, 1), (2, 1), (10, 1), (11, 1), (15, 1)],
  term ((27092083200 : Rat) / 150171761) [(0, 1), (4, 1), (10, 1), (11, 1), (15, 1)],
  term ((-27092083200 : Rat) / 150171761) [(1, 1), (3, 1), (10, 1), (11, 1), (15, 1)],
  term ((27092083200 : Rat) / 150171761) [(1, 1), (5, 1), (10, 1), (11, 1), (15, 1)],
  term ((13546041600 : Rat) / 150171761) [(2, 2), (10, 1), (11, 1), (15, 1)],
  term ((13546041600 : Rat) / 150171761) [(3, 2), (10, 1), (11, 1), (15, 1)],
  term ((-13546041600 : Rat) / 150171761) [(4, 2), (10, 1), (11, 1), (15, 1)],
  term ((-13546041600 : Rat) / 150171761) [(5, 2), (10, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 7. -/
theorem rs_R013_ueqv_R013YNNN_partial_07_0039_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_07_0039
        rs_R013_ueqv_R013YNNN_generator_07_0000_0049 =
      rs_R013_ueqv_R013YNNN_partial_07_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 7. -/
def rs_R013_ueqv_R013YNNN_coefficient_07_0040 : Poly :=
[
  term ((652515181052563920 : Rat) / 1288183727709509) [(10, 1), (11, 2), (15, 2)]
]

/-- Partial product 40 for generator 7. -/
def rs_R013_ueqv_R013YNNN_partial_07_0040 : Poly :=
[
  term ((-1305030362105127840 : Rat) / 1288183727709509) [(0, 1), (2, 1), (10, 1), (11, 2), (15, 2)],
  term ((1305030362105127840 : Rat) / 1288183727709509) [(0, 1), (4, 1), (10, 1), (11, 2), (15, 2)],
  term ((-1305030362105127840 : Rat) / 1288183727709509) [(1, 1), (3, 1), (10, 1), (11, 2), (15, 2)],
  term ((1305030362105127840 : Rat) / 1288183727709509) [(1, 1), (5, 1), (10, 1), (11, 2), (15, 2)],
  term ((652515181052563920 : Rat) / 1288183727709509) [(2, 2), (10, 1), (11, 2), (15, 2)],
  term ((652515181052563920 : Rat) / 1288183727709509) [(3, 2), (10, 1), (11, 2), (15, 2)],
  term ((-652515181052563920 : Rat) / 1288183727709509) [(4, 2), (10, 1), (11, 2), (15, 2)],
  term ((-652515181052563920 : Rat) / 1288183727709509) [(5, 2), (10, 1), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 7. -/
theorem rs_R013_ueqv_R013YNNN_partial_07_0040_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_07_0040
        rs_R013_ueqv_R013YNNN_generator_07_0000_0049 =
      rs_R013_ueqv_R013YNNN_partial_07_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 7. -/
def rs_R013_ueqv_R013YNNN_coefficient_07_0041 : Poly :=
[
  term ((-860779296 : Rat) / 8578069) [(10, 1), (15, 2)]
]

/-- Partial product 41 for generator 7. -/
def rs_R013_ueqv_R013YNNN_partial_07_0041 : Poly :=
[
  term ((1721558592 : Rat) / 8578069) [(0, 1), (2, 1), (10, 1), (15, 2)],
  term ((-1721558592 : Rat) / 8578069) [(0, 1), (4, 1), (10, 1), (15, 2)],
  term ((1721558592 : Rat) / 8578069) [(1, 1), (3, 1), (10, 1), (15, 2)],
  term ((-1721558592 : Rat) / 8578069) [(1, 1), (5, 1), (10, 1), (15, 2)],
  term ((-860779296 : Rat) / 8578069) [(2, 2), (10, 1), (15, 2)],
  term ((-860779296 : Rat) / 8578069) [(3, 2), (10, 1), (15, 2)],
  term ((860779296 : Rat) / 8578069) [(4, 2), (10, 1), (15, 2)],
  term ((860779296 : Rat) / 8578069) [(5, 2), (10, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 7. -/
theorem rs_R013_ueqv_R013YNNN_partial_07_0041_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_07_0041
        rs_R013_ueqv_R013YNNN_generator_07_0000_0049 =
      rs_R013_ueqv_R013YNNN_partial_07_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 7. -/
def rs_R013_ueqv_R013YNNN_coefficient_07_0042 : Poly :=
[
  term ((74850589600 : Rat) / 150171761) [(11, 1), (13, 1)]
]

/-- Partial product 42 for generator 7. -/
def rs_R013_ueqv_R013YNNN_partial_07_0042 : Poly :=
[
  term ((-149701179200 : Rat) / 150171761) [(0, 1), (2, 1), (11, 1), (13, 1)],
  term ((149701179200 : Rat) / 150171761) [(0, 1), (4, 1), (11, 1), (13, 1)],
  term ((-149701179200 : Rat) / 150171761) [(1, 1), (3, 1), (11, 1), (13, 1)],
  term ((149701179200 : Rat) / 150171761) [(1, 1), (5, 1), (11, 1), (13, 1)],
  term ((74850589600 : Rat) / 150171761) [(2, 2), (11, 1), (13, 1)],
  term ((74850589600 : Rat) / 150171761) [(3, 2), (11, 1), (13, 1)],
  term ((-74850589600 : Rat) / 150171761) [(4, 2), (11, 1), (13, 1)],
  term ((-74850589600 : Rat) / 150171761) [(5, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 7. -/
theorem rs_R013_ueqv_R013YNNN_partial_07_0042_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_07_0042
        rs_R013_ueqv_R013YNNN_generator_07_0000_0049 =
      rs_R013_ueqv_R013YNNN_partial_07_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 7. -/
def rs_R013_ueqv_R013YNNN_coefficient_07_0043 : Poly :=
[
  term ((343829842164698672 : Rat) / 1288183727709509) [(11, 1), (15, 1)]
]

/-- Partial product 43 for generator 7. -/
def rs_R013_ueqv_R013YNNN_partial_07_0043 : Poly :=
[
  term ((-687659684329397344 : Rat) / 1288183727709509) [(0, 1), (2, 1), (11, 1), (15, 1)],
  term ((687659684329397344 : Rat) / 1288183727709509) [(0, 1), (4, 1), (11, 1), (15, 1)],
  term ((-687659684329397344 : Rat) / 1288183727709509) [(1, 1), (3, 1), (11, 1), (15, 1)],
  term ((687659684329397344 : Rat) / 1288183727709509) [(1, 1), (5, 1), (11, 1), (15, 1)],
  term ((343829842164698672 : Rat) / 1288183727709509) [(2, 2), (11, 1), (15, 1)],
  term ((343829842164698672 : Rat) / 1288183727709509) [(3, 2), (11, 1), (15, 1)],
  term ((-343829842164698672 : Rat) / 1288183727709509) [(4, 2), (11, 1), (15, 1)],
  term ((-343829842164698672 : Rat) / 1288183727709509) [(5, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 7. -/
theorem rs_R013_ueqv_R013YNNN_partial_07_0043_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_07_0043
        rs_R013_ueqv_R013YNNN_generator_07_0000_0049 =
      rs_R013_ueqv_R013YNNN_partial_07_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 7. -/
def rs_R013_ueqv_R013YNNN_coefficient_07_0044 : Poly :=
[
  term ((6773020800 : Rat) / 150171761) [(11, 2)]
]

/-- Partial product 44 for generator 7. -/
def rs_R013_ueqv_R013YNNN_partial_07_0044 : Poly :=
[
  term ((-13546041600 : Rat) / 150171761) [(0, 1), (2, 1), (11, 2)],
  term ((13546041600 : Rat) / 150171761) [(0, 1), (4, 1), (11, 2)],
  term ((-13546041600 : Rat) / 150171761) [(1, 1), (3, 1), (11, 2)],
  term ((13546041600 : Rat) / 150171761) [(1, 1), (5, 1), (11, 2)],
  term ((6773020800 : Rat) / 150171761) [(2, 2), (11, 2)],
  term ((6773020800 : Rat) / 150171761) [(3, 2), (11, 2)],
  term ((-6773020800 : Rat) / 150171761) [(4, 2), (11, 2)],
  term ((-6773020800 : Rat) / 150171761) [(5, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 7. -/
theorem rs_R013_ueqv_R013YNNN_partial_07_0044_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_07_0044
        rs_R013_ueqv_R013YNNN_generator_07_0000_0049 =
      rs_R013_ueqv_R013YNNN_partial_07_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 7. -/
def rs_R013_ueqv_R013YNNN_coefficient_07_0045 : Poly :=
[
  term ((3605565925970222770 : Rat) / 1288183727709509) [(11, 2), (13, 1), (15, 1)]
]

/-- Partial product 45 for generator 7. -/
def rs_R013_ueqv_R013YNNN_partial_07_0045 : Poly :=
[
  term ((-7211131851940445540 : Rat) / 1288183727709509) [(0, 1), (2, 1), (11, 2), (13, 1), (15, 1)],
  term ((7211131851940445540 : Rat) / 1288183727709509) [(0, 1), (4, 1), (11, 2), (13, 1), (15, 1)],
  term ((-7211131851940445540 : Rat) / 1288183727709509) [(1, 1), (3, 1), (11, 2), (13, 1), (15, 1)],
  term ((7211131851940445540 : Rat) / 1288183727709509) [(1, 1), (5, 1), (11, 2), (13, 1), (15, 1)],
  term ((3605565925970222770 : Rat) / 1288183727709509) [(2, 2), (11, 2), (13, 1), (15, 1)],
  term ((3605565925970222770 : Rat) / 1288183727709509) [(3, 2), (11, 2), (13, 1), (15, 1)],
  term ((-3605565925970222770 : Rat) / 1288183727709509) [(4, 2), (11, 2), (13, 1), (15, 1)],
  term ((-3605565925970222770 : Rat) / 1288183727709509) [(5, 2), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 7. -/
theorem rs_R013_ueqv_R013YNNN_partial_07_0045_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_07_0045
        rs_R013_ueqv_R013YNNN_generator_07_0000_0049 =
      rs_R013_ueqv_R013YNNN_partial_07_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 7. -/
def rs_R013_ueqv_R013YNNN_coefficient_07_0046 : Poly :=
[
  term ((2293720871543337740 : Rat) / 1288183727709509) [(11, 2), (15, 2)]
]

/-- Partial product 46 for generator 7. -/
def rs_R013_ueqv_R013YNNN_partial_07_0046 : Poly :=
[
  term ((-4587441743086675480 : Rat) / 1288183727709509) [(0, 1), (2, 1), (11, 2), (15, 2)],
  term ((4587441743086675480 : Rat) / 1288183727709509) [(0, 1), (4, 1), (11, 2), (15, 2)],
  term ((-4587441743086675480 : Rat) / 1288183727709509) [(1, 1), (3, 1), (11, 2), (15, 2)],
  term ((4587441743086675480 : Rat) / 1288183727709509) [(1, 1), (5, 1), (11, 2), (15, 2)],
  term ((2293720871543337740 : Rat) / 1288183727709509) [(2, 2), (11, 2), (15, 2)],
  term ((2293720871543337740 : Rat) / 1288183727709509) [(3, 2), (11, 2), (15, 2)],
  term ((-2293720871543337740 : Rat) / 1288183727709509) [(4, 2), (11, 2), (15, 2)],
  term ((-2293720871543337740 : Rat) / 1288183727709509) [(5, 2), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 7. -/
theorem rs_R013_ueqv_R013YNNN_partial_07_0046_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_07_0046
        rs_R013_ueqv_R013YNNN_generator_07_0000_0049 =
      rs_R013_ueqv_R013YNNN_partial_07_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 7. -/
def rs_R013_ueqv_R013YNNN_coefficient_07_0047 : Poly :=
[
  term ((326257590526281960 : Rat) / 1288183727709509) [(11, 3), (15, 1)]
]

/-- Partial product 47 for generator 7. -/
def rs_R013_ueqv_R013YNNN_partial_07_0047 : Poly :=
[
  term ((-652515181052563920 : Rat) / 1288183727709509) [(0, 1), (2, 1), (11, 3), (15, 1)],
  term ((652515181052563920 : Rat) / 1288183727709509) [(0, 1), (4, 1), (11, 3), (15, 1)],
  term ((-652515181052563920 : Rat) / 1288183727709509) [(1, 1), (3, 1), (11, 3), (15, 1)],
  term ((652515181052563920 : Rat) / 1288183727709509) [(1, 1), (5, 1), (11, 3), (15, 1)],
  term ((326257590526281960 : Rat) / 1288183727709509) [(2, 2), (11, 3), (15, 1)],
  term ((326257590526281960 : Rat) / 1288183727709509) [(3, 2), (11, 3), (15, 1)],
  term ((-326257590526281960 : Rat) / 1288183727709509) [(4, 2), (11, 3), (15, 1)],
  term ((-326257590526281960 : Rat) / 1288183727709509) [(5, 2), (11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 7. -/
theorem rs_R013_ueqv_R013YNNN_partial_07_0047_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_07_0047
        rs_R013_ueqv_R013YNNN_generator_07_0000_0049 =
      rs_R013_ueqv_R013YNNN_partial_07_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 7. -/
def rs_R013_ueqv_R013YNNN_coefficient_07_0048 : Poly :=
[
  term ((40768300952 : Rat) / 25734207) [(13, 1), (15, 1)]
]

/-- Partial product 48 for generator 7. -/
def rs_R013_ueqv_R013YNNN_partial_07_0048 : Poly :=
[
  term ((-81536601904 : Rat) / 25734207) [(0, 1), (2, 1), (13, 1), (15, 1)],
  term ((81536601904 : Rat) / 25734207) [(0, 1), (4, 1), (13, 1), (15, 1)],
  term ((-81536601904 : Rat) / 25734207) [(1, 1), (3, 1), (13, 1), (15, 1)],
  term ((81536601904 : Rat) / 25734207) [(1, 1), (5, 1), (13, 1), (15, 1)],
  term ((40768300952 : Rat) / 25734207) [(2, 2), (13, 1), (15, 1)],
  term ((40768300952 : Rat) / 25734207) [(3, 2), (13, 1), (15, 1)],
  term ((-40768300952 : Rat) / 25734207) [(4, 2), (13, 1), (15, 1)],
  term ((-40768300952 : Rat) / 25734207) [(5, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 7. -/
theorem rs_R013_ueqv_R013YNNN_partial_07_0048_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_07_0048
        rs_R013_ueqv_R013YNNN_generator_07_0000_0049 =
      rs_R013_ueqv_R013YNNN_partial_07_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 7. -/
def rs_R013_ueqv_R013YNNN_coefficient_07_0049 : Poly :=
[
  term ((9434777584 : Rat) / 25734207) [(15, 2)]
]

/-- Partial product 49 for generator 7. -/
def rs_R013_ueqv_R013YNNN_partial_07_0049 : Poly :=
[
  term ((-18869555168 : Rat) / 25734207) [(0, 1), (2, 1), (15, 2)],
  term ((18869555168 : Rat) / 25734207) [(0, 1), (4, 1), (15, 2)],
  term ((-18869555168 : Rat) / 25734207) [(1, 1), (3, 1), (15, 2)],
  term ((18869555168 : Rat) / 25734207) [(1, 1), (5, 1), (15, 2)],
  term ((9434777584 : Rat) / 25734207) [(2, 2), (15, 2)],
  term ((9434777584 : Rat) / 25734207) [(3, 2), (15, 2)],
  term ((-9434777584 : Rat) / 25734207) [(4, 2), (15, 2)],
  term ((-9434777584 : Rat) / 25734207) [(5, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 7. -/
theorem rs_R013_ueqv_R013YNNN_partial_07_0049_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_07_0049
        rs_R013_ueqv_R013YNNN_generator_07_0000_0049 =
      rs_R013_ueqv_R013YNNN_partial_07_0049 := by
  native_decide

/-- Partial products in this block. -/
def rs_R013_ueqv_R013YNNN_partials_07_0000_0049 : List Poly :=
[
  rs_R013_ueqv_R013YNNN_partial_07_0000,
  rs_R013_ueqv_R013YNNN_partial_07_0001,
  rs_R013_ueqv_R013YNNN_partial_07_0002,
  rs_R013_ueqv_R013YNNN_partial_07_0003,
  rs_R013_ueqv_R013YNNN_partial_07_0004,
  rs_R013_ueqv_R013YNNN_partial_07_0005,
  rs_R013_ueqv_R013YNNN_partial_07_0006,
  rs_R013_ueqv_R013YNNN_partial_07_0007,
  rs_R013_ueqv_R013YNNN_partial_07_0008,
  rs_R013_ueqv_R013YNNN_partial_07_0009,
  rs_R013_ueqv_R013YNNN_partial_07_0010,
  rs_R013_ueqv_R013YNNN_partial_07_0011,
  rs_R013_ueqv_R013YNNN_partial_07_0012,
  rs_R013_ueqv_R013YNNN_partial_07_0013,
  rs_R013_ueqv_R013YNNN_partial_07_0014,
  rs_R013_ueqv_R013YNNN_partial_07_0015,
  rs_R013_ueqv_R013YNNN_partial_07_0016,
  rs_R013_ueqv_R013YNNN_partial_07_0017,
  rs_R013_ueqv_R013YNNN_partial_07_0018,
  rs_R013_ueqv_R013YNNN_partial_07_0019,
  rs_R013_ueqv_R013YNNN_partial_07_0020,
  rs_R013_ueqv_R013YNNN_partial_07_0021,
  rs_R013_ueqv_R013YNNN_partial_07_0022,
  rs_R013_ueqv_R013YNNN_partial_07_0023,
  rs_R013_ueqv_R013YNNN_partial_07_0024,
  rs_R013_ueqv_R013YNNN_partial_07_0025,
  rs_R013_ueqv_R013YNNN_partial_07_0026,
  rs_R013_ueqv_R013YNNN_partial_07_0027,
  rs_R013_ueqv_R013YNNN_partial_07_0028,
  rs_R013_ueqv_R013YNNN_partial_07_0029,
  rs_R013_ueqv_R013YNNN_partial_07_0030,
  rs_R013_ueqv_R013YNNN_partial_07_0031,
  rs_R013_ueqv_R013YNNN_partial_07_0032,
  rs_R013_ueqv_R013YNNN_partial_07_0033,
  rs_R013_ueqv_R013YNNN_partial_07_0034,
  rs_R013_ueqv_R013YNNN_partial_07_0035,
  rs_R013_ueqv_R013YNNN_partial_07_0036,
  rs_R013_ueqv_R013YNNN_partial_07_0037,
  rs_R013_ueqv_R013YNNN_partial_07_0038,
  rs_R013_ueqv_R013YNNN_partial_07_0039,
  rs_R013_ueqv_R013YNNN_partial_07_0040,
  rs_R013_ueqv_R013YNNN_partial_07_0041,
  rs_R013_ueqv_R013YNNN_partial_07_0042,
  rs_R013_ueqv_R013YNNN_partial_07_0043,
  rs_R013_ueqv_R013YNNN_partial_07_0044,
  rs_R013_ueqv_R013YNNN_partial_07_0045,
  rs_R013_ueqv_R013YNNN_partial_07_0046,
  rs_R013_ueqv_R013YNNN_partial_07_0047,
  rs_R013_ueqv_R013YNNN_partial_07_0048,
  rs_R013_ueqv_R013YNNN_partial_07_0049
]

/-- Sum of partial products in this block. -/
def rs_R013_ueqv_R013YNNN_block_07_0000_0049 : Poly :=
[
  term ((-122059828800 : Rat) / 150171761) [(0, 1), (1, 1), (2, 1), (4, 1), (11, 1)],
  term ((-5879643193231959060 : Rat) / 1288183727709509) [(0, 1), (1, 1), (2, 1), (4, 1), (11, 2), (15, 1)],
  term ((-3644774992 : Rat) / 8578069) [(0, 1), (1, 1), (2, 1), (4, 1), (15, 1)],
  term ((-122059828800 : Rat) / 150171761) [(0, 1), (1, 1), (2, 1), (11, 1), (12, 1)],
  term ((-5879643193231959060 : Rat) / 1288183727709509) [(0, 1), (1, 1), (2, 1), (11, 2), (12, 1), (15, 1)],
  term ((-3644774992 : Rat) / 8578069) [(0, 1), (1, 1), (2, 1), (12, 1), (15, 1)],
  term ((122059828800 : Rat) / 150171761) [(0, 1), (1, 1), (2, 2), (11, 1)],
  term ((5879643193231959060 : Rat) / 1288183727709509) [(0, 1), (1, 1), (2, 2), (11, 2), (15, 1)],
  term ((3644774992 : Rat) / 8578069) [(0, 1), (1, 1), (2, 2), (15, 1)],
  term ((122059828800 : Rat) / 150171761) [(0, 1), (1, 1), (4, 1), (11, 1), (12, 1)],
  term ((5879643193231959060 : Rat) / 1288183727709509) [(0, 1), (1, 1), (4, 1), (11, 2), (12, 1), (15, 1)],
  term ((3644774992 : Rat) / 8578069) [(0, 1), (1, 1), (4, 1), (12, 1), (15, 1)],
  term ((-107935110400 : Rat) / 150171761) [(0, 1), (2, 1), (3, 1), (4, 1), (11, 1)],
  term ((-5199253050026398480 : Rat) / 1288183727709509) [(0, 1), (2, 1), (3, 1), (4, 1), (11, 2), (15, 1)],
  term ((20789484352 : Rat) / 25734207) [(0, 1), (2, 1), (3, 1), (4, 1), (15, 1)],
  term ((-113810774400 : Rat) / 150171761) [(0, 1), (2, 1), (3, 1), (11, 1)],
  term ((244119657600 : Rat) / 150171761) [(0, 1), (2, 1), (3, 1), (11, 1), (12, 1)],
  term ((11759286386463918120 : Rat) / 1288183727709509) [(0, 1), (2, 1), (3, 1), (11, 2), (12, 1), (15, 1)],
  term ((-5482284807345380280 : Rat) / 1288183727709509) [(0, 1), (2, 1), (3, 1), (11, 2), (15, 1)],
  term ((7289549984 : Rat) / 8578069) [(0, 1), (2, 1), (3, 1), (12, 1), (15, 1)],
  term ((-4903880416 : Rat) / 8578069) [(0, 1), (2, 1), (3, 1), (15, 1)],
  term ((-22263371200 : Rat) / 150171761) [(0, 1), (2, 1), (4, 1), (5, 1), (11, 1)],
  term ((-1072430464808880940 : Rat) / 1288183727709509) [(0, 1), (2, 1), (4, 1), (5, 1), (11, 2), (15, 1)],
  term ((17791023856 : Rat) / 25734207) [(0, 1), (2, 1), (4, 1), (5, 1), (15, 1)],
  term ((38019449600 : Rat) / 150171761) [(0, 1), (2, 1), (4, 1), (7, 1), (11, 1)],
  term ((1831403503091473520 : Rat) / 1288183727709509) [(0, 1), (2, 1), (4, 1), (7, 1), (11, 2), (15, 1)],
  term ((6312091072 : Rat) / 25734207) [(0, 1), (2, 1), (4, 1), (7, 1), (15, 1)],
  term ((-470246843200 : Rat) / 150171761) [(0, 1), (2, 1), (4, 1), (11, 1), (13, 1)],
  term ((-38019449600 : Rat) / 150171761) [(0, 1), (2, 1), (4, 1), (11, 1), (15, 1)],
  term ((-22651872265772802340 : Rat) / 1288183727709509) [(0, 1), (2, 1), (4, 1), (11, 2), (13, 1), (15, 1)],
  term ((-1831403503091473520 : Rat) / 1288183727709509) [(0, 1), (2, 1), (4, 1), (11, 2), (15, 2)],
  term ((-182095450544 : Rat) / 25734207) [(0, 1), (2, 1), (4, 1), (13, 1), (15, 1)],
  term ((-6312091072 : Rat) / 25734207) [(0, 1), (2, 1), (4, 1), (15, 2)],
  term ((-3253646400 : Rat) / 150171761) [(0, 1), (2, 1), (5, 1), (11, 1)],
  term ((-156728713263144180 : Rat) / 1288183727709509) [(0, 1), (2, 1), (5, 1), (11, 2), (15, 1)],
  term ((6982356464 : Rat) / 8578069) [(0, 1), (2, 1), (5, 1), (15, 1)],
  term ((-76038899200 : Rat) / 150171761) [(0, 1), (2, 1), (7, 1), (11, 1)],
  term ((-3662807006182947040 : Rat) / 1288183727709509) [(0, 1), (2, 1), (7, 1), (11, 2), (15, 1)],
  term ((-12624182144 : Rat) / 25734207) [(0, 1), (2, 1), (7, 1), (15, 1)],
  term ((27092083200 : Rat) / 150171761) [(0, 1), (2, 1), (9, 1), (11, 1)],
  term ((1305030362105127840 : Rat) / 1288183727709509) [(0, 1), (2, 1), (9, 1), (11, 2), (15, 1)],
  term ((-1721558592 : Rat) / 8578069) [(0, 1), (2, 1), (9, 1), (15, 1)],
  term ((-27092083200 : Rat) / 150171761) [(0, 1), (2, 1), (10, 1), (11, 1), (15, 1)],
  term ((-1305030362105127840 : Rat) / 1288183727709509) [(0, 1), (2, 1), (10, 1), (11, 2), (15, 2)],
  term ((1721558592 : Rat) / 8578069) [(0, 1), (2, 1), (10, 1), (15, 2)],
  term ((-149701179200 : Rat) / 150171761) [(0, 1), (2, 1), (11, 1), (13, 1)],
  term ((-687659684329397344 : Rat) / 1288183727709509) [(0, 1), (2, 1), (11, 1), (15, 1)],
  term ((-13546041600 : Rat) / 150171761) [(0, 1), (2, 1), (11, 2)],
  term ((-7211131851940445540 : Rat) / 1288183727709509) [(0, 1), (2, 1), (11, 2), (13, 1), (15, 1)],
  term ((-4587441743086675480 : Rat) / 1288183727709509) [(0, 1), (2, 1), (11, 2), (15, 2)],
  term ((-652515181052563920 : Rat) / 1288183727709509) [(0, 1), (2, 1), (11, 3), (15, 1)],
  term ((-81536601904 : Rat) / 25734207) [(0, 1), (2, 1), (13, 1), (15, 1)],
  term ((-18869555168 : Rat) / 25734207) [(0, 1), (2, 1), (15, 2)],
  term ((85671739200 : Rat) / 150171761) [(0, 1), (2, 2), (3, 1), (11, 1)],
  term ((4126822585217517540 : Rat) / 1288183727709509) [(0, 1), (2, 2), (3, 1), (11, 2), (15, 1)],
  term ((-999486832 : Rat) / 8578069) [(0, 1), (2, 2), (3, 1), (15, 1)],
  term ((22263371200 : Rat) / 150171761) [(0, 1), (2, 2), (5, 1), (11, 1)],
  term ((1072430464808880940 : Rat) / 1288183727709509) [(0, 1), (2, 2), (5, 1), (11, 2), (15, 1)],
  term ((-17791023856 : Rat) / 25734207) [(0, 1), (2, 2), (5, 1), (15, 1)],
  term ((470246843200 : Rat) / 150171761) [(0, 1), (2, 2), (11, 1), (13, 1)],
  term ((38019449600 : Rat) / 150171761) [(0, 1), (2, 2), (11, 1), (15, 1)],
  term ((22651872265772802340 : Rat) / 1288183727709509) [(0, 1), (2, 2), (11, 2), (13, 1), (15, 1)],
  term ((1831403503091473520 : Rat) / 1288183727709509) [(0, 1), (2, 2), (11, 2), (15, 2)],
  term ((182095450544 : Rat) / 25734207) [(0, 1), (2, 2), (13, 1), (15, 1)],
  term ((6312091072 : Rat) / 25734207) [(0, 1), (2, 2), (15, 2)],
  term ((113810774400 : Rat) / 150171761) [(0, 1), (3, 1), (4, 1), (11, 1)],
  term ((-244119657600 : Rat) / 150171761) [(0, 1), (3, 1), (4, 1), (11, 1), (12, 1)],
  term ((-11759286386463918120 : Rat) / 1288183727709509) [(0, 1), (3, 1), (4, 1), (11, 2), (12, 1), (15, 1)],
  term ((5482284807345380280 : Rat) / 1288183727709509) [(0, 1), (3, 1), (4, 1), (11, 2), (15, 1)],
  term ((-7289549984 : Rat) / 8578069) [(0, 1), (3, 1), (4, 1), (12, 1), (15, 1)],
  term ((4903880416 : Rat) / 8578069) [(0, 1), (3, 1), (4, 1), (15, 1)],
  term ((22263371200 : Rat) / 150171761) [(0, 1), (3, 1), (4, 2), (11, 1)],
  term ((1072430464808880940 : Rat) / 1288183727709509) [(0, 1), (3, 1), (4, 2), (11, 2), (15, 1)],
  term ((-17791023856 : Rat) / 25734207) [(0, 1), (3, 1), (4, 2), (15, 1)],
  term ((3253646400 : Rat) / 150171761) [(0, 1), (4, 1), (5, 1), (11, 1)],
  term ((156728713263144180 : Rat) / 1288183727709509) [(0, 1), (4, 1), (5, 1), (11, 2), (15, 1)],
  term ((-6982356464 : Rat) / 8578069) [(0, 1), (4, 1), (5, 1), (15, 1)],
  term ((76038899200 : Rat) / 150171761) [(0, 1), (4, 1), (7, 1), (11, 1)],
  term ((3662807006182947040 : Rat) / 1288183727709509) [(0, 1), (4, 1), (7, 1), (11, 2), (15, 1)],
  term ((12624182144 : Rat) / 25734207) [(0, 1), (4, 1), (7, 1), (15, 1)],
  term ((-27092083200 : Rat) / 150171761) [(0, 1), (4, 1), (9, 1), (11, 1)],
  term ((-1305030362105127840 : Rat) / 1288183727709509) [(0, 1), (4, 1), (9, 1), (11, 2), (15, 1)],
  term ((1721558592 : Rat) / 8578069) [(0, 1), (4, 1), (9, 1), (15, 1)],
  term ((27092083200 : Rat) / 150171761) [(0, 1), (4, 1), (10, 1), (11, 1), (15, 1)],
  term ((1305030362105127840 : Rat) / 1288183727709509) [(0, 1), (4, 1), (10, 1), (11, 2), (15, 2)],
  term ((-1721558592 : Rat) / 8578069) [(0, 1), (4, 1), (10, 1), (15, 2)],
  term ((149701179200 : Rat) / 150171761) [(0, 1), (4, 1), (11, 1), (13, 1)],
  term ((687659684329397344 : Rat) / 1288183727709509) [(0, 1), (4, 1), (11, 1), (15, 1)],
  term ((13546041600 : Rat) / 150171761) [(0, 1), (4, 1), (11, 2)],
  term ((7211131851940445540 : Rat) / 1288183727709509) [(0, 1), (4, 1), (11, 2), (13, 1), (15, 1)],
  term ((4587441743086675480 : Rat) / 1288183727709509) [(0, 1), (4, 1), (11, 2), (15, 2)],
  term ((652515181052563920 : Rat) / 1288183727709509) [(0, 1), (4, 1), (11, 3), (15, 1)],
  term ((81536601904 : Rat) / 25734207) [(0, 1), (4, 1), (13, 1), (15, 1)],
  term ((18869555168 : Rat) / 25734207) [(0, 1), (4, 1), (15, 2)],
  term ((-38019449600 : Rat) / 150171761) [(0, 1), (4, 2), (7, 1), (11, 1)],
  term ((-1831403503091473520 : Rat) / 1288183727709509) [(0, 1), (4, 2), (7, 1), (11, 2), (15, 1)],
  term ((-6312091072 : Rat) / 25734207) [(0, 1), (4, 2), (7, 1), (15, 1)],
  term ((-3729904000 : Rat) / 8833633) [(1, 1), (2, 1), (3, 1), (5, 1), (11, 1)],
  term ((-179670124729919800 : Rat) / 75775513394677) [(1, 1), (2, 1), (3, 1), (5, 1), (11, 2), (15, 1)],
  term ((-14792563360 : Rat) / 25734207) [(1, 1), (2, 1), (3, 1), (5, 1), (15, 1)],
  term ((470246843200 : Rat) / 150171761) [(1, 1), (2, 1), (3, 1), (11, 1), (13, 1)],
  term ((38019449600 : Rat) / 150171761) [(1, 1), (2, 1), (3, 1), (11, 1), (15, 1)],
  term ((22651872265772802340 : Rat) / 1288183727709509) [(1, 1), (2, 1), (3, 1), (11, 2), (13, 1), (15, 1)],
  term ((1831403503091473520 : Rat) / 1288183727709509) [(1, 1), (2, 1), (3, 1), (11, 2), (15, 2)],
  term ((182095450544 : Rat) / 25734207) [(1, 1), (2, 1), (3, 1), (13, 1), (15, 1)],
  term ((6312091072 : Rat) / 25734207) [(1, 1), (2, 1), (3, 1), (15, 2)],
  term ((24641824800 : Rat) / 150171761) [(1, 1), (2, 1), (3, 2), (11, 1)],
  term ((1187000988601538010 : Rat) / 1288183727709509) [(1, 1), (2, 1), (3, 2), (11, 2), (15, 1)],
  term ((-2821874328 : Rat) / 8578069) [(1, 1), (2, 1), (3, 2), (15, 1)],
  term ((61029914400 : Rat) / 150171761) [(1, 1), (2, 1), (4, 2), (11, 1)],
  term ((2939821596615979530 : Rat) / 1288183727709509) [(1, 1), (2, 1), (4, 2), (11, 2), (15, 1)],
  term ((1822387496 : Rat) / 8578069) [(1, 1), (2, 1), (4, 2), (15, 1)],
  term ((-470246843200 : Rat) / 150171761) [(1, 1), (2, 1), (5, 1), (11, 1), (13, 1)],
  term ((-38019449600 : Rat) / 150171761) [(1, 1), (2, 1), (5, 1), (11, 1), (15, 1)],
  term ((-22651872265772802340 : Rat) / 1288183727709509) [(1, 1), (2, 1), (5, 1), (11, 2), (13, 1), (15, 1)],
  term ((-1831403503091473520 : Rat) / 1288183727709509) [(1, 1), (2, 1), (5, 1), (11, 2), (15, 2)],
  term ((-182095450544 : Rat) / 25734207) [(1, 1), (2, 1), (5, 1), (13, 1), (15, 1)],
  term ((-6312091072 : Rat) / 25734207) [(1, 1), (2, 1), (5, 1), (15, 2)],
  term ((38766543200 : Rat) / 150171761) [(1, 1), (2, 1), (5, 2), (11, 1)],
  term ((1867391131807098590 : Rat) / 1288183727709509) [(1, 1), (2, 1), (5, 2), (11, 2), (15, 1)],
  term ((23258186344 : Rat) / 25734207) [(1, 1), (2, 1), (5, 2), (15, 1)],
  term ((61029914400 : Rat) / 150171761) [(1, 1), (2, 2), (11, 1), (12, 1)],
  term ((2939821596615979530 : Rat) / 1288183727709509) [(1, 1), (2, 2), (11, 2), (12, 1), (15, 1)],
  term ((1822387496 : Rat) / 8578069) [(1, 1), (2, 2), (12, 1), (15, 1)],
  term ((-61029914400 : Rat) / 150171761) [(1, 1), (2, 3), (11, 1)],
  term ((-2939821596615979530 : Rat) / 1288183727709509) [(1, 1), (2, 3), (11, 2), (15, 1)],
  term ((-1822387496 : Rat) / 8578069) [(1, 1), (2, 3), (15, 1)],
  term ((22263371200 : Rat) / 150171761) [(1, 1), (3, 1), (4, 1), (5, 1), (11, 1)],
  term ((1072430464808880940 : Rat) / 1288183727709509) [(1, 1), (3, 1), (4, 1), (5, 1), (11, 2), (15, 1)],
  term ((-17791023856 : Rat) / 25734207) [(1, 1), (3, 1), (4, 1), (5, 1), (15, 1)],
  term ((38019449600 : Rat) / 150171761) [(1, 1), (3, 1), (4, 1), (7, 1), (11, 1)],
  term ((1831403503091473520 : Rat) / 1288183727709509) [(1, 1), (3, 1), (4, 1), (7, 1), (11, 2), (15, 1)],
  term ((6312091072 : Rat) / 25734207) [(1, 1), (3, 1), (4, 1), (7, 1), (15, 1)],
  term ((110557128000 : Rat) / 150171761) [(1, 1), (3, 1), (5, 1), (11, 1)],
  term ((-244119657600 : Rat) / 150171761) [(1, 1), (3, 1), (5, 1), (11, 1), (12, 1)],
  term ((-11759286386463918120 : Rat) / 1288183727709509) [(1, 1), (3, 1), (5, 1), (11, 2), (12, 1), (15, 1)],
  term ((5325556094082236100 : Rat) / 1288183727709509) [(1, 1), (3, 1), (5, 1), (11, 2), (15, 1)],
  term ((-7289549984 : Rat) / 8578069) [(1, 1), (3, 1), (5, 1), (12, 1), (15, 1)],
  term ((11886236880 : Rat) / 8578069) [(1, 1), (3, 1), (5, 1), (15, 1)],
  term ((-76038899200 : Rat) / 150171761) [(1, 1), (3, 1), (7, 1), (11, 1)],
  term ((-3662807006182947040 : Rat) / 1288183727709509) [(1, 1), (3, 1), (7, 1), (11, 2), (15, 1)],
  term ((-12624182144 : Rat) / 25734207) [(1, 1), (3, 1), (7, 1), (15, 1)],
  term ((27092083200 : Rat) / 150171761) [(1, 1), (3, 1), (9, 1), (11, 1)],
  term ((1305030362105127840 : Rat) / 1288183727709509) [(1, 1), (3, 1), (9, 1), (11, 2), (15, 1)],
  term ((-1721558592 : Rat) / 8578069) [(1, 1), (3, 1), (9, 1), (15, 1)],
  term ((-27092083200 : Rat) / 150171761) [(1, 1), (3, 1), (10, 1), (11, 1), (15, 1)],
  term ((-1305030362105127840 : Rat) / 1288183727709509) [(1, 1), (3, 1), (10, 1), (11, 2), (15, 2)],
  term ((1721558592 : Rat) / 8578069) [(1, 1), (3, 1), (10, 1), (15, 2)],
  term ((-149701179200 : Rat) / 150171761) [(1, 1), (3, 1), (11, 1), (13, 1)],
  term ((-687659684329397344 : Rat) / 1288183727709509) [(1, 1), (3, 1), (11, 1), (15, 1)],
  term ((-13546041600 : Rat) / 150171761) [(1, 1), (3, 1), (11, 2)],
  term ((-7211131851940445540 : Rat) / 1288183727709509) [(1, 1), (3, 1), (11, 2), (13, 1), (15, 1)],
  term ((-4587441743086675480 : Rat) / 1288183727709509) [(1, 1), (3, 1), (11, 2), (15, 2)],
  term ((-652515181052563920 : Rat) / 1288183727709509) [(1, 1), (3, 1), (11, 3), (15, 1)],
  term ((-81536601904 : Rat) / 25734207) [(1, 1), (3, 1), (13, 1), (15, 1)],
  term ((-18869555168 : Rat) / 25734207) [(1, 1), (3, 1), (15, 2)],
  term ((-22263371200 : Rat) / 150171761) [(1, 1), (3, 2), (4, 1), (11, 1)],
  term ((-1072430464808880940 : Rat) / 1288183727709509) [(1, 1), (3, 2), (4, 1), (11, 2), (15, 1)],
  term ((17791023856 : Rat) / 25734207) [(1, 1), (3, 2), (4, 1), (15, 1)],
  term ((-113810774400 : Rat) / 150171761) [(1, 1), (3, 2), (11, 1)],
  term ((305149572000 : Rat) / 150171761) [(1, 1), (3, 2), (11, 1), (12, 1)],
  term ((14699107983079897650 : Rat) / 1288183727709509) [(1, 1), (3, 2), (11, 2), (12, 1), (15, 1)],
  term ((-5482284807345380280 : Rat) / 1288183727709509) [(1, 1), (3, 2), (11, 2), (15, 1)],
  term ((9111937480 : Rat) / 8578069) [(1, 1), (3, 2), (12, 1), (15, 1)],
  term ((-4903880416 : Rat) / 8578069) [(1, 1), (3, 2), (15, 1)],
  term ((-38019449600 : Rat) / 150171761) [(1, 1), (4, 1), (5, 1), (7, 1), (11, 1)],
  term ((-1831403503091473520 : Rat) / 1288183727709509) [(1, 1), (4, 1), (5, 1), (7, 1), (11, 2), (15, 1)],
  term ((-6312091072 : Rat) / 25734207) [(1, 1), (4, 1), (5, 1), (7, 1), (15, 1)],
  term ((-61029914400 : Rat) / 150171761) [(1, 1), (4, 2), (11, 1), (12, 1)],
  term ((-2939821596615979530 : Rat) / 1288183727709509) [(1, 1), (4, 2), (11, 2), (12, 1), (15, 1)],
  term ((-1822387496 : Rat) / 8578069) [(1, 1), (4, 2), (12, 1), (15, 1)],
  term ((76038899200 : Rat) / 150171761) [(1, 1), (5, 1), (7, 1), (11, 1)],
  term ((3662807006182947040 : Rat) / 1288183727709509) [(1, 1), (5, 1), (7, 1), (11, 2), (15, 1)],
  term ((12624182144 : Rat) / 25734207) [(1, 1), (5, 1), (7, 1), (15, 1)],
  term ((-27092083200 : Rat) / 150171761) [(1, 1), (5, 1), (9, 1), (11, 1)],
  term ((-1305030362105127840 : Rat) / 1288183727709509) [(1, 1), (5, 1), (9, 1), (11, 2), (15, 1)],
  term ((1721558592 : Rat) / 8578069) [(1, 1), (5, 1), (9, 1), (15, 1)],
  term ((27092083200 : Rat) / 150171761) [(1, 1), (5, 1), (10, 1), (11, 1), (15, 1)],
  term ((1305030362105127840 : Rat) / 1288183727709509) [(1, 1), (5, 1), (10, 1), (11, 2), (15, 2)],
  term ((-1721558592 : Rat) / 8578069) [(1, 1), (5, 1), (10, 1), (15, 2)],
  term ((149701179200 : Rat) / 150171761) [(1, 1), (5, 1), (11, 1), (13, 1)],
  term ((687659684329397344 : Rat) / 1288183727709509) [(1, 1), (5, 1), (11, 1), (15, 1)],
  term ((13546041600 : Rat) / 150171761) [(1, 1), (5, 1), (11, 2)],
  term ((7211131851940445540 : Rat) / 1288183727709509) [(1, 1), (5, 1), (11, 2), (13, 1), (15, 1)],
  term ((4587441743086675480 : Rat) / 1288183727709509) [(1, 1), (5, 1), (11, 2), (15, 2)],
  term ((652515181052563920 : Rat) / 1288183727709509) [(1, 1), (5, 1), (11, 3), (15, 1)],
  term ((81536601904 : Rat) / 25734207) [(1, 1), (5, 1), (13, 1), (15, 1)],
  term ((18869555168 : Rat) / 25734207) [(1, 1), (5, 1), (15, 2)],
  term ((3253646400 : Rat) / 150171761) [(1, 1), (5, 2), (11, 1)],
  term ((-61029914400 : Rat) / 150171761) [(1, 1), (5, 2), (11, 1), (12, 1)],
  term ((-2939821596615979530 : Rat) / 1288183727709509) [(1, 1), (5, 2), (11, 2), (12, 1), (15, 1)],
  term ((156728713263144180 : Rat) / 1288183727709509) [(1, 1), (5, 2), (11, 2), (15, 1)],
  term ((-1822387496 : Rat) / 8578069) [(1, 1), (5, 2), (12, 1), (15, 1)],
  term ((-6982356464 : Rat) / 8578069) [(1, 1), (5, 2), (15, 1)],
  term ((122059828800 : Rat) / 150171761) [(1, 2), (2, 1), (3, 1), (11, 1)],
  term ((5879643193231959060 : Rat) / 1288183727709509) [(1, 2), (2, 1), (3, 1), (11, 2), (15, 1)],
  term ((3644774992 : Rat) / 8578069) [(1, 2), (2, 1), (3, 1), (15, 1)],
  term ((-122059828800 : Rat) / 150171761) [(1, 2), (2, 1), (5, 1), (11, 1)],
  term ((-5879643193231959060 : Rat) / 1288183727709509) [(1, 2), (2, 1), (5, 1), (11, 2), (15, 1)],
  term ((-3644774992 : Rat) / 8578069) [(1, 2), (2, 1), (5, 1), (15, 1)],
  term ((-122059828800 : Rat) / 150171761) [(1, 2), (3, 1), (11, 1), (12, 1)],
  term ((-5879643193231959060 : Rat) / 1288183727709509) [(1, 2), (3, 1), (11, 2), (12, 1), (15, 1)],
  term ((-3644774992 : Rat) / 8578069) [(1, 2), (3, 1), (12, 1), (15, 1)],
  term ((122059828800 : Rat) / 150171761) [(1, 2), (5, 1), (11, 1), (12, 1)],
  term ((5879643193231959060 : Rat) / 1288183727709509) [(1, 2), (5, 1), (11, 2), (12, 1), (15, 1)],
  term ((3644774992 : Rat) / 8578069) [(1, 2), (5, 1), (12, 1), (15, 1)],
  term ((42835869600 : Rat) / 150171761) [(2, 1), (3, 1), (4, 2), (11, 1)],
  term ((2063411292608758770 : Rat) / 1288183727709509) [(2, 1), (3, 1), (4, 2), (11, 2), (15, 1)],
  term ((-499743416 : Rat) / 8578069) [(2, 1), (3, 1), (4, 2), (15, 1)],
  term ((42835869600 : Rat) / 150171761) [(2, 1), (3, 1), (5, 2), (11, 1)],
  term ((2063411292608758770 : Rat) / 1288183727709509) [(2, 1), (3, 1), (5, 2), (11, 2), (15, 1)],
  term ((-499743416 : Rat) / 8578069) [(2, 1), (3, 1), (5, 2), (15, 1)],
  term ((-11131685600 : Rat) / 150171761) [(2, 1), (3, 2), (5, 1), (11, 1)],
  term ((-536215232404440470 : Rat) / 1288183727709509) [(2, 1), (3, 2), (5, 1), (11, 2), (15, 1)],
  term ((8895511928 : Rat) / 25734207) [(2, 1), (3, 2), (5, 1), (15, 1)],
  term ((-235123421600 : Rat) / 150171761) [(2, 1), (3, 2), (11, 1), (13, 1)],
  term ((-19009724800 : Rat) / 150171761) [(2, 1), (3, 2), (11, 1), (15, 1)],
  term ((-11325936132886401170 : Rat) / 1288183727709509) [(2, 1), (3, 2), (11, 2), (13, 1), (15, 1)],
  term ((-915701751545736760 : Rat) / 1288183727709509) [(2, 1), (3, 2), (11, 2), (15, 2)],
  term ((-91047725272 : Rat) / 25734207) [(2, 1), (3, 2), (13, 1), (15, 1)],
  term ((-3156045536 : Rat) / 25734207) [(2, 1), (3, 2), (15, 2)],
  term ((-42835869600 : Rat) / 150171761) [(2, 1), (3, 3), (11, 1)],
  term ((-2063411292608758770 : Rat) / 1288183727709509) [(2, 1), (3, 3), (11, 2), (15, 1)],
  term ((499743416 : Rat) / 8578069) [(2, 1), (3, 3), (15, 1)],
  term ((11131685600 : Rat) / 150171761) [(2, 1), (4, 2), (5, 1), (11, 1)],
  term ((536215232404440470 : Rat) / 1288183727709509) [(2, 1), (4, 2), (5, 1), (11, 2), (15, 1)],
  term ((-8895511928 : Rat) / 25734207) [(2, 1), (4, 2), (5, 1), (15, 1)],
  term ((235123421600 : Rat) / 150171761) [(2, 1), (4, 2), (11, 1), (13, 1)],
  term ((19009724800 : Rat) / 150171761) [(2, 1), (4, 2), (11, 1), (15, 1)],
  term ((11325936132886401170 : Rat) / 1288183727709509) [(2, 1), (4, 2), (11, 2), (13, 1), (15, 1)],
  term ((915701751545736760 : Rat) / 1288183727709509) [(2, 1), (4, 2), (11, 2), (15, 2)],
  term ((91047725272 : Rat) / 25734207) [(2, 1), (4, 2), (13, 1), (15, 1)],
  term ((3156045536 : Rat) / 25734207) [(2, 1), (4, 2), (15, 2)],
  term ((235123421600 : Rat) / 150171761) [(2, 1), (5, 2), (11, 1), (13, 1)],
  term ((19009724800 : Rat) / 150171761) [(2, 1), (5, 2), (11, 1), (15, 1)],
  term ((11325936132886401170 : Rat) / 1288183727709509) [(2, 1), (5, 2), (11, 2), (13, 1), (15, 1)],
  term ((915701751545736760 : Rat) / 1288183727709509) [(2, 1), (5, 2), (11, 2), (15, 2)],
  term ((91047725272 : Rat) / 25734207) [(2, 1), (5, 2), (13, 1), (15, 1)],
  term ((3156045536 : Rat) / 25734207) [(2, 1), (5, 2), (15, 2)],
  term ((11131685600 : Rat) / 150171761) [(2, 1), (5, 3), (11, 1)],
  term ((536215232404440470 : Rat) / 1288183727709509) [(2, 1), (5, 3), (11, 2), (15, 1)],
  term ((-8895511928 : Rat) / 25734207) [(2, 1), (5, 3), (15, 1)],
  term ((11131685600 : Rat) / 150171761) [(2, 2), (3, 1), (4, 1), (11, 1)],
  term ((536215232404440470 : Rat) / 1288183727709509) [(2, 2), (3, 1), (4, 1), (11, 2), (15, 1)],
  term ((-8895511928 : Rat) / 25734207) [(2, 2), (3, 1), (4, 1), (15, 1)],
  term ((56905387200 : Rat) / 150171761) [(2, 2), (3, 1), (11, 1)],
  term ((-122059828800 : Rat) / 150171761) [(2, 2), (3, 1), (11, 1), (12, 1)],
  term ((-5879643193231959060 : Rat) / 1288183727709509) [(2, 2), (3, 1), (11, 2), (12, 1), (15, 1)],
  term ((2741142403672690140 : Rat) / 1288183727709509) [(2, 2), (3, 1), (11, 2), (15, 1)],
  term ((-3644774992 : Rat) / 8578069) [(2, 2), (3, 1), (12, 1), (15, 1)],
  term ((2451940208 : Rat) / 8578069) [(2, 2), (3, 1), (15, 1)],
  term ((-19009724800 : Rat) / 150171761) [(2, 2), (4, 1), (7, 1), (11, 1)],
  term ((-915701751545736760 : Rat) / 1288183727709509) [(2, 2), (4, 1), (7, 1), (11, 2), (15, 1)],
  term ((-3156045536 : Rat) / 25734207) [(2, 2), (4, 1), (7, 1), (15, 1)],
  term ((1626823200 : Rat) / 150171761) [(2, 2), (5, 1), (11, 1)],
  term ((78364356631572090 : Rat) / 1288183727709509) [(2, 2), (5, 1), (11, 2), (15, 1)],
  term ((-3491178232 : Rat) / 8578069) [(2, 2), (5, 1), (15, 1)],
  term ((38019449600 : Rat) / 150171761) [(2, 2), (7, 1), (11, 1)],
  term ((1831403503091473520 : Rat) / 1288183727709509) [(2, 2), (7, 1), (11, 2), (15, 1)],
  term ((6312091072 : Rat) / 25734207) [(2, 2), (7, 1), (15, 1)],
  term ((-13546041600 : Rat) / 150171761) [(2, 2), (9, 1), (11, 1)],
  term ((-652515181052563920 : Rat) / 1288183727709509) [(2, 2), (9, 1), (11, 2), (15, 1)],
  term ((860779296 : Rat) / 8578069) [(2, 2), (9, 1), (15, 1)],
  term ((13546041600 : Rat) / 150171761) [(2, 2), (10, 1), (11, 1), (15, 1)],
  term ((652515181052563920 : Rat) / 1288183727709509) [(2, 2), (10, 1), (11, 2), (15, 2)],
  term ((-860779296 : Rat) / 8578069) [(2, 2), (10, 1), (15, 2)],
  term ((74850589600 : Rat) / 150171761) [(2, 2), (11, 1), (13, 1)],
  term ((343829842164698672 : Rat) / 1288183727709509) [(2, 2), (11, 1), (15, 1)],
  term ((6773020800 : Rat) / 150171761) [(2, 2), (11, 2)],
  term ((3605565925970222770 : Rat) / 1288183727709509) [(2, 2), (11, 2), (13, 1), (15, 1)],
  term ((2293720871543337740 : Rat) / 1288183727709509) [(2, 2), (11, 2), (15, 2)],
  term ((326257590526281960 : Rat) / 1288183727709509) [(2, 2), (11, 3), (15, 1)],
  term ((40768300952 : Rat) / 25734207) [(2, 2), (13, 1), (15, 1)],
  term ((9434777584 : Rat) / 25734207) [(2, 2), (15, 2)],
  term ((-42835869600 : Rat) / 150171761) [(2, 3), (3, 1), (11, 1)],
  term ((-2063411292608758770 : Rat) / 1288183727709509) [(2, 3), (3, 1), (11, 2), (15, 1)],
  term ((499743416 : Rat) / 8578069) [(2, 3), (3, 1), (15, 1)],
  term ((-11131685600 : Rat) / 150171761) [(2, 3), (5, 1), (11, 1)],
  term ((-536215232404440470 : Rat) / 1288183727709509) [(2, 3), (5, 1), (11, 2), (15, 1)],
  term ((8895511928 : Rat) / 25734207) [(2, 3), (5, 1), (15, 1)],
  term ((-235123421600 : Rat) / 150171761) [(2, 3), (11, 1), (13, 1)],
  term ((-19009724800 : Rat) / 150171761) [(2, 3), (11, 1), (15, 1)],
  term ((-11325936132886401170 : Rat) / 1288183727709509) [(2, 3), (11, 2), (13, 1), (15, 1)],
  term ((-915701751545736760 : Rat) / 1288183727709509) [(2, 3), (11, 2), (15, 2)],
  term ((-91047725272 : Rat) / 25734207) [(2, 3), (13, 1), (15, 1)],
  term ((-3156045536 : Rat) / 25734207) [(2, 3), (15, 2)],
  term ((-11131685600 : Rat) / 150171761) [(3, 1), (4, 1), (5, 2), (11, 1)],
  term ((-536215232404440470 : Rat) / 1288183727709509) [(3, 1), (4, 1), (5, 2), (11, 2), (15, 1)],
  term ((8895511928 : Rat) / 25734207) [(3, 1), (4, 1), (5, 2), (15, 1)],
  term ((-56905387200 : Rat) / 150171761) [(3, 1), (4, 2), (11, 1)],
  term ((122059828800 : Rat) / 150171761) [(3, 1), (4, 2), (11, 1), (12, 1)],
  term ((5879643193231959060 : Rat) / 1288183727709509) [(3, 1), (4, 2), (11, 2), (12, 1), (15, 1)],
  term ((-2741142403672690140 : Rat) / 1288183727709509) [(3, 1), (4, 2), (11, 2), (15, 1)],
  term ((3644774992 : Rat) / 8578069) [(3, 1), (4, 2), (12, 1), (15, 1)],
  term ((-2451940208 : Rat) / 8578069) [(3, 1), (4, 2), (15, 1)],
  term ((-11131685600 : Rat) / 150171761) [(3, 1), (4, 3), (11, 1)],
  term ((-536215232404440470 : Rat) / 1288183727709509) [(3, 1), (4, 3), (11, 2), (15, 1)],
  term ((8895511928 : Rat) / 25734207) [(3, 1), (4, 3), (15, 1)],
  term ((-56905387200 : Rat) / 150171761) [(3, 1), (5, 2), (11, 1)],
  term ((122059828800 : Rat) / 150171761) [(3, 1), (5, 2), (11, 1), (12, 1)],
  term ((5879643193231959060 : Rat) / 1288183727709509) [(3, 1), (5, 2), (11, 2), (12, 1), (15, 1)],
  term ((-2741142403672690140 : Rat) / 1288183727709509) [(3, 1), (5, 2), (11, 2), (15, 1)],
  term ((3644774992 : Rat) / 8578069) [(3, 1), (5, 2), (12, 1), (15, 1)],
  term ((-2451940208 : Rat) / 8578069) [(3, 1), (5, 2), (15, 1)],
  term ((-19009724800 : Rat) / 150171761) [(3, 2), (4, 1), (7, 1), (11, 1)],
  term ((-915701751545736760 : Rat) / 1288183727709509) [(3, 2), (4, 1), (7, 1), (11, 2), (15, 1)],
  term ((-3156045536 : Rat) / 25734207) [(3, 2), (4, 1), (7, 1), (15, 1)],
  term ((1626823200 : Rat) / 150171761) [(3, 2), (5, 1), (11, 1)],
  term ((78364356631572090 : Rat) / 1288183727709509) [(3, 2), (5, 1), (11, 2), (15, 1)],
  term ((-3491178232 : Rat) / 8578069) [(3, 2), (5, 1), (15, 1)],
  term ((38019449600 : Rat) / 150171761) [(3, 2), (7, 1), (11, 1)],
  term ((1831403503091473520 : Rat) / 1288183727709509) [(3, 2), (7, 1), (11, 2), (15, 1)],
  term ((6312091072 : Rat) / 25734207) [(3, 2), (7, 1), (15, 1)],
  term ((-13546041600 : Rat) / 150171761) [(3, 2), (9, 1), (11, 1)],
  term ((-652515181052563920 : Rat) / 1288183727709509) [(3, 2), (9, 1), (11, 2), (15, 1)],
  term ((860779296 : Rat) / 8578069) [(3, 2), (9, 1), (15, 1)],
  term ((13546041600 : Rat) / 150171761) [(3, 2), (10, 1), (11, 1), (15, 1)],
  term ((652515181052563920 : Rat) / 1288183727709509) [(3, 2), (10, 1), (11, 2), (15, 2)],
  term ((-860779296 : Rat) / 8578069) [(3, 2), (10, 1), (15, 2)],
  term ((74850589600 : Rat) / 150171761) [(3, 2), (11, 1), (13, 1)],
  term ((343829842164698672 : Rat) / 1288183727709509) [(3, 2), (11, 1), (15, 1)],
  term ((6773020800 : Rat) / 150171761) [(3, 2), (11, 2)],
  term ((3605565925970222770 : Rat) / 1288183727709509) [(3, 2), (11, 2), (13, 1), (15, 1)],
  term ((2293720871543337740 : Rat) / 1288183727709509) [(3, 2), (11, 2), (15, 2)],
  term ((326257590526281960 : Rat) / 1288183727709509) [(3, 2), (11, 3), (15, 1)],
  term ((40768300952 : Rat) / 25734207) [(3, 2), (13, 1), (15, 1)],
  term ((9434777584 : Rat) / 25734207) [(3, 2), (15, 2)],
  term ((11131685600 : Rat) / 150171761) [(3, 3), (4, 1), (11, 1)],
  term ((536215232404440470 : Rat) / 1288183727709509) [(3, 3), (4, 1), (11, 2), (15, 1)],
  term ((-8895511928 : Rat) / 25734207) [(3, 3), (4, 1), (15, 1)],
  term ((56905387200 : Rat) / 150171761) [(3, 3), (11, 1)],
  term ((-122059828800 : Rat) / 150171761) [(3, 3), (11, 1), (12, 1)],
  term ((-5879643193231959060 : Rat) / 1288183727709509) [(3, 3), (11, 2), (12, 1), (15, 1)],
  term ((2741142403672690140 : Rat) / 1288183727709509) [(3, 3), (11, 2), (15, 1)],
  term ((-3644774992 : Rat) / 8578069) [(3, 3), (12, 1), (15, 1)],
  term ((2451940208 : Rat) / 8578069) [(3, 3), (15, 1)],
  term ((19009724800 : Rat) / 150171761) [(4, 1), (5, 2), (7, 1), (11, 1)],
  term ((915701751545736760 : Rat) / 1288183727709509) [(4, 1), (5, 2), (7, 1), (11, 2), (15, 1)],
  term ((3156045536 : Rat) / 25734207) [(4, 1), (5, 2), (7, 1), (15, 1)],
  term ((-1626823200 : Rat) / 150171761) [(4, 2), (5, 1), (11, 1)],
  term ((-78364356631572090 : Rat) / 1288183727709509) [(4, 2), (5, 1), (11, 2), (15, 1)],
  term ((3491178232 : Rat) / 8578069) [(4, 2), (5, 1), (15, 1)],
  term ((-38019449600 : Rat) / 150171761) [(4, 2), (7, 1), (11, 1)],
  term ((-1831403503091473520 : Rat) / 1288183727709509) [(4, 2), (7, 1), (11, 2), (15, 1)],
  term ((-6312091072 : Rat) / 25734207) [(4, 2), (7, 1), (15, 1)],
  term ((13546041600 : Rat) / 150171761) [(4, 2), (9, 1), (11, 1)],
  term ((652515181052563920 : Rat) / 1288183727709509) [(4, 2), (9, 1), (11, 2), (15, 1)],
  term ((-860779296 : Rat) / 8578069) [(4, 2), (9, 1), (15, 1)],
  term ((-13546041600 : Rat) / 150171761) [(4, 2), (10, 1), (11, 1), (15, 1)],
  term ((-652515181052563920 : Rat) / 1288183727709509) [(4, 2), (10, 1), (11, 2), (15, 2)],
  term ((860779296 : Rat) / 8578069) [(4, 2), (10, 1), (15, 2)],
  term ((-74850589600 : Rat) / 150171761) [(4, 2), (11, 1), (13, 1)],
  term ((-343829842164698672 : Rat) / 1288183727709509) [(4, 2), (11, 1), (15, 1)],
  term ((-6773020800 : Rat) / 150171761) [(4, 2), (11, 2)],
  term ((-3605565925970222770 : Rat) / 1288183727709509) [(4, 2), (11, 2), (13, 1), (15, 1)],
  term ((-2293720871543337740 : Rat) / 1288183727709509) [(4, 2), (11, 2), (15, 2)],
  term ((-326257590526281960 : Rat) / 1288183727709509) [(4, 2), (11, 3), (15, 1)],
  term ((-40768300952 : Rat) / 25734207) [(4, 2), (13, 1), (15, 1)],
  term ((-9434777584 : Rat) / 25734207) [(4, 2), (15, 2)],
  term ((19009724800 : Rat) / 150171761) [(4, 3), (7, 1), (11, 1)],
  term ((915701751545736760 : Rat) / 1288183727709509) [(4, 3), (7, 1), (11, 2), (15, 1)],
  term ((3156045536 : Rat) / 25734207) [(4, 3), (7, 1), (15, 1)],
  term ((-38019449600 : Rat) / 150171761) [(5, 2), (7, 1), (11, 1)],
  term ((-1831403503091473520 : Rat) / 1288183727709509) [(5, 2), (7, 1), (11, 2), (15, 1)],
  term ((-6312091072 : Rat) / 25734207) [(5, 2), (7, 1), (15, 1)],
  term ((13546041600 : Rat) / 150171761) [(5, 2), (9, 1), (11, 1)],
  term ((652515181052563920 : Rat) / 1288183727709509) [(5, 2), (9, 1), (11, 2), (15, 1)],
  term ((-860779296 : Rat) / 8578069) [(5, 2), (9, 1), (15, 1)],
  term ((-13546041600 : Rat) / 150171761) [(5, 2), (10, 1), (11, 1), (15, 1)],
  term ((-652515181052563920 : Rat) / 1288183727709509) [(5, 2), (10, 1), (11, 2), (15, 2)],
  term ((860779296 : Rat) / 8578069) [(5, 2), (10, 1), (15, 2)],
  term ((-74850589600 : Rat) / 150171761) [(5, 2), (11, 1), (13, 1)],
  term ((-343829842164698672 : Rat) / 1288183727709509) [(5, 2), (11, 1), (15, 1)],
  term ((-6773020800 : Rat) / 150171761) [(5, 2), (11, 2)],
  term ((-3605565925970222770 : Rat) / 1288183727709509) [(5, 2), (11, 2), (13, 1), (15, 1)],
  term ((-2293720871543337740 : Rat) / 1288183727709509) [(5, 2), (11, 2), (15, 2)],
  term ((-326257590526281960 : Rat) / 1288183727709509) [(5, 2), (11, 3), (15, 1)],
  term ((-40768300952 : Rat) / 25734207) [(5, 2), (13, 1), (15, 1)],
  term ((-9434777584 : Rat) / 25734207) [(5, 2), (15, 2)],
  term ((-1626823200 : Rat) / 150171761) [(5, 3), (11, 1)],
  term ((-78364356631572090 : Rat) / 1288183727709509) [(5, 3), (11, 2), (15, 1)],
  term ((3491178232 : Rat) / 8578069) [(5, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 7, terms 0 through 49. -/
theorem rs_R013_ueqv_R013YNNN_block_07_0000_0049_valid :
    checkProductSumEq rs_R013_ueqv_R013YNNN_partials_07_0000_0049
      rs_R013_ueqv_R013YNNN_block_07_0000_0049 = true := by
  native_decide

end R013UeqvR013YNNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
