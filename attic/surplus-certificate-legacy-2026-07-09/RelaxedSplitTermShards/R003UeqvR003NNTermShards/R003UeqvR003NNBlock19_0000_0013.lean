/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R003:u=v:R003NN, term block 19:0-13

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R003UeqvR003NNTermShards

/-- Generator polynomial 19 for relaxed split surplus certificate `R003:u=v:R003NN`. -/
def rs_R003_ueqv_R003NN_generator_19_0000_0013 : Poly :=
[
  term (2 : Rat) [(2, 1), (8, 1)],
  term (-1 : Rat) [(2, 2)],
  term (2 : Rat) [(3, 1), (9, 1)],
  term (-1 : Rat) [(3, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003NN_coefficient_19_0000 : Poly :=
[
  term (12 : Rat) []
]

/-- Partial product 0 for generator 19. -/
def rs_R003_ueqv_R003NN_partial_19_0000 : Poly :=
[
  term (24 : Rat) [(2, 1), (8, 1)],
  term (-12 : Rat) [(2, 2)],
  term (24 : Rat) [(3, 1), (9, 1)],
  term (-12 : Rat) [(3, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 19. -/
theorem rs_R003_ueqv_R003NN_partial_19_0000_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_19_0000
        rs_R003_ueqv_R003NN_generator_19_0000_0013 =
      rs_R003_ueqv_R003NN_partial_19_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003NN_coefficient_19_0001 : Poly :=
[
  term ((-3428 : Rat) / 134037) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 1 for generator 19. -/
def rs_R003_ueqv_R003NN_partial_19_0001 : Poly :=
[
  term ((-6856 : Rat) / 134037) [(1, 1), (2, 1), (8, 1), (15, 1), (16, 1)],
  term ((3428 : Rat) / 134037) [(1, 1), (2, 2), (15, 1), (16, 1)],
  term ((-6856 : Rat) / 134037) [(1, 1), (3, 1), (9, 1), (15, 1), (16, 1)],
  term ((3428 : Rat) / 134037) [(1, 1), (3, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 19. -/
theorem rs_R003_ueqv_R003NN_partial_19_0001_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_19_0001
        rs_R003_ueqv_R003NN_generator_19_0000_0013 =
      rs_R003_ueqv_R003NN_partial_19_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003NN_coefficient_19_0002 : Poly :=
[
  term ((-13712 : Rat) / 44679) [(3, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 2 for generator 19. -/
def rs_R003_ueqv_R003NN_partial_19_0002 : Poly :=
[
  term ((-27424 : Rat) / 44679) [(2, 1), (3, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((13712 : Rat) / 44679) [(2, 2), (3, 1), (13, 1), (15, 2), (16, 1)],
  term ((-27424 : Rat) / 44679) [(3, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((13712 : Rat) / 44679) [(3, 3), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 19. -/
theorem rs_R003_ueqv_R003NN_partial_19_0002_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_19_0002
        rs_R003_ueqv_R003NN_generator_19_0000_0013 =
      rs_R003_ueqv_R003NN_partial_19_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003NN_coefficient_19_0003 : Poly :=
[
  term ((-1714 : Rat) / 44679) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 3 for generator 19. -/
def rs_R003_ueqv_R003NN_partial_19_0003 : Poly :=
[
  term ((-3428 : Rat) / 44679) [(2, 1), (3, 1), (8, 1), (15, 1), (16, 1)],
  term ((1714 : Rat) / 44679) [(2, 2), (3, 1), (15, 1), (16, 1)],
  term ((-3428 : Rat) / 44679) [(3, 2), (9, 1), (15, 1), (16, 1)],
  term ((1714 : Rat) / 44679) [(3, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 19. -/
theorem rs_R003_ueqv_R003NN_partial_19_0003_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_19_0003
        rs_R003_ueqv_R003NN_generator_19_0000_0013 =
      rs_R003_ueqv_R003NN_partial_19_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003NN_coefficient_19_0004 : Poly :=
[
  term ((6856 : Rat) / 44679) [(3, 1), (15, 3), (16, 1)]
]

/-- Partial product 4 for generator 19. -/
def rs_R003_ueqv_R003NN_partial_19_0004 : Poly :=
[
  term ((13712 : Rat) / 44679) [(2, 1), (3, 1), (8, 1), (15, 3), (16, 1)],
  term ((-6856 : Rat) / 44679) [(2, 2), (3, 1), (15, 3), (16, 1)],
  term ((13712 : Rat) / 44679) [(3, 2), (9, 1), (15, 3), (16, 1)],
  term ((-6856 : Rat) / 44679) [(3, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 19. -/
theorem rs_R003_ueqv_R003NN_partial_19_0004_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_19_0004
        rs_R003_ueqv_R003NN_generator_19_0000_0013 =
      rs_R003_ueqv_R003NN_partial_19_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003NN_coefficient_19_0005 : Poly :=
[
  term ((-199667 : Rat) / 268074) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 5 for generator 19. -/
def rs_R003_ueqv_R003NN_partial_19_0005 : Poly :=
[
  term ((-199667 : Rat) / 134037) [(2, 1), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((199667 : Rat) / 268074) [(2, 2), (5, 1), (15, 1), (16, 1)],
  term ((-199667 : Rat) / 134037) [(3, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((199667 : Rat) / 268074) [(3, 2), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 19. -/
theorem rs_R003_ueqv_R003NN_partial_19_0005_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_19_0005
        rs_R003_ueqv_R003NN_generator_19_0000_0013 =
      rs_R003_ueqv_R003NN_partial_19_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003NN_coefficient_19_0006 : Poly :=
[
  term ((1714 : Rat) / 44679) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 6 for generator 19. -/
def rs_R003_ueqv_R003NN_partial_19_0006 : Poly :=
[
  term ((3428 : Rat) / 44679) [(2, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-1714 : Rat) / 44679) [(2, 2), (7, 1), (15, 1), (16, 1)],
  term ((3428 : Rat) / 44679) [(3, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-1714 : Rat) / 44679) [(3, 2), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 19. -/
theorem rs_R003_ueqv_R003NN_partial_19_0006_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_19_0006
        rs_R003_ueqv_R003NN_generator_19_0000_0013 =
      rs_R003_ueqv_R003NN_partial_19_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003NN_coefficient_19_0007 : Poly :=
[
  term ((1180595 : Rat) / 2144592) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 7 for generator 19. -/
def rs_R003_ueqv_R003NN_partial_19_0007 : Poly :=
[
  term ((1180595 : Rat) / 1072296) [(2, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1180595 : Rat) / 2144592) [(2, 2), (11, 1), (15, 1), (16, 1)],
  term ((1180595 : Rat) / 1072296) [(3, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1180595 : Rat) / 2144592) [(3, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 19. -/
theorem rs_R003_ueqv_R003NN_partial_19_0007_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_19_0007
        rs_R003_ueqv_R003NN_generator_19_0000_0013 =
      rs_R003_ueqv_R003NN_partial_19_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003NN_coefficient_19_0008 : Poly :=
[
  term (96 : Rat) [(13, 1), (15, 1)]
]

/-- Partial product 8 for generator 19. -/
def rs_R003_ueqv_R003NN_partial_19_0008 : Poly :=
[
  term (192 : Rat) [(2, 1), (8, 1), (13, 1), (15, 1)],
  term (-96 : Rat) [(2, 2), (13, 1), (15, 1)],
  term (192 : Rat) [(3, 1), (9, 1), (13, 1), (15, 1)],
  term (-96 : Rat) [(3, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 19. -/
theorem rs_R003_ueqv_R003NN_partial_19_0008_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_19_0008
        rs_R003_ueqv_R003NN_generator_19_0000_0013 =
      rs_R003_ueqv_R003NN_partial_19_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003NN_coefficient_19_0009 : Poly :=
[
  term ((1280237 : Rat) / 2144592) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 9 for generator 19. -/
def rs_R003_ueqv_R003NN_partial_19_0009 : Poly :=
[
  term ((1280237 : Rat) / 1072296) [(2, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1280237 : Rat) / 2144592) [(2, 2), (13, 1), (15, 1), (16, 1)],
  term ((1280237 : Rat) / 1072296) [(3, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1280237 : Rat) / 2144592) [(3, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 19. -/
theorem rs_R003_ueqv_R003NN_partial_19_0009_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_19_0009
        rs_R003_ueqv_R003NN_generator_19_0000_0013 =
      rs_R003_ueqv_R003NN_partial_19_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003NN_coefficient_19_0010 : Poly :=
[
  term ((-128807 : Rat) / 44679) [(13, 1), (15, 3), (16, 1)]
]

/-- Partial product 10 for generator 19. -/
def rs_R003_ueqv_R003NN_partial_19_0010 : Poly :=
[
  term ((-257614 : Rat) / 44679) [(2, 1), (8, 1), (13, 1), (15, 3), (16, 1)],
  term ((128807 : Rat) / 44679) [(2, 2), (13, 1), (15, 3), (16, 1)],
  term ((-257614 : Rat) / 44679) [(3, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((128807 : Rat) / 44679) [(3, 2), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 19. -/
theorem rs_R003_ueqv_R003NN_partial_19_0010_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_19_0010
        rs_R003_ueqv_R003NN_generator_19_0000_0013 =
      rs_R003_ueqv_R003NN_partial_19_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003NN_coefficient_19_0011 : Poly :=
[
  term (-48 : Rat) [(15, 2)]
]

/-- Partial product 11 for generator 19. -/
def rs_R003_ueqv_R003NN_partial_19_0011 : Poly :=
[
  term (-96 : Rat) [(2, 1), (8, 1), (15, 2)],
  term (48 : Rat) [(2, 2), (15, 2)],
  term (-96 : Rat) [(3, 1), (9, 1), (15, 2)],
  term (48 : Rat) [(3, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 19. -/
theorem rs_R003_ueqv_R003NN_partial_19_0011_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_19_0011
        rs_R003_ueqv_R003NN_generator_19_0000_0013 =
      rs_R003_ueqv_R003NN_partial_19_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003NN_coefficient_19_0012 : Poly :=
[
  term ((21212 : Rat) / 44679) [(15, 2), (16, 1)]
]

/-- Partial product 12 for generator 19. -/
def rs_R003_ueqv_R003NN_partial_19_0012 : Poly :=
[
  term ((42424 : Rat) / 44679) [(2, 1), (8, 1), (15, 2), (16, 1)],
  term ((-21212 : Rat) / 44679) [(2, 2), (15, 2), (16, 1)],
  term ((42424 : Rat) / 44679) [(3, 1), (9, 1), (15, 2), (16, 1)],
  term ((-21212 : Rat) / 44679) [(3, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 19. -/
theorem rs_R003_ueqv_R003NN_partial_19_0012_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_19_0012
        rs_R003_ueqv_R003NN_generator_19_0000_0013 =
      rs_R003_ueqv_R003NN_partial_19_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003NN_coefficient_19_0013 : Poly :=
[
  term ((128807 : Rat) / 89358) [(15, 4), (16, 1)]
]

/-- Partial product 13 for generator 19. -/
def rs_R003_ueqv_R003NN_partial_19_0013 : Poly :=
[
  term ((128807 : Rat) / 44679) [(2, 1), (8, 1), (15, 4), (16, 1)],
  term ((-128807 : Rat) / 89358) [(2, 2), (15, 4), (16, 1)],
  term ((128807 : Rat) / 44679) [(3, 1), (9, 1), (15, 4), (16, 1)],
  term ((-128807 : Rat) / 89358) [(3, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 19. -/
theorem rs_R003_ueqv_R003NN_partial_19_0013_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_19_0013
        rs_R003_ueqv_R003NN_generator_19_0000_0013 =
      rs_R003_ueqv_R003NN_partial_19_0013 := by
  native_decide

/-- Partial products in this block. -/
def rs_R003_ueqv_R003NN_partials_19_0000_0013 : List Poly :=
[
  rs_R003_ueqv_R003NN_partial_19_0000,
  rs_R003_ueqv_R003NN_partial_19_0001,
  rs_R003_ueqv_R003NN_partial_19_0002,
  rs_R003_ueqv_R003NN_partial_19_0003,
  rs_R003_ueqv_R003NN_partial_19_0004,
  rs_R003_ueqv_R003NN_partial_19_0005,
  rs_R003_ueqv_R003NN_partial_19_0006,
  rs_R003_ueqv_R003NN_partial_19_0007,
  rs_R003_ueqv_R003NN_partial_19_0008,
  rs_R003_ueqv_R003NN_partial_19_0009,
  rs_R003_ueqv_R003NN_partial_19_0010,
  rs_R003_ueqv_R003NN_partial_19_0011,
  rs_R003_ueqv_R003NN_partial_19_0012,
  rs_R003_ueqv_R003NN_partial_19_0013
]

/-- Sum of partial products in this block. -/
def rs_R003_ueqv_R003NN_block_19_0000_0013 : Poly :=
[
  term ((-6856 : Rat) / 134037) [(1, 1), (2, 1), (8, 1), (15, 1), (16, 1)],
  term ((3428 : Rat) / 134037) [(1, 1), (2, 2), (15, 1), (16, 1)],
  term ((-6856 : Rat) / 134037) [(1, 1), (3, 1), (9, 1), (15, 1), (16, 1)],
  term ((3428 : Rat) / 134037) [(1, 1), (3, 2), (15, 1), (16, 1)],
  term ((-27424 : Rat) / 44679) [(2, 1), (3, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((-3428 : Rat) / 44679) [(2, 1), (3, 1), (8, 1), (15, 1), (16, 1)],
  term ((13712 : Rat) / 44679) [(2, 1), (3, 1), (8, 1), (15, 3), (16, 1)],
  term ((-199667 : Rat) / 134037) [(2, 1), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((3428 : Rat) / 44679) [(2, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(2, 1), (8, 1)],
  term ((1180595 : Rat) / 1072296) [(2, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term (192 : Rat) [(2, 1), (8, 1), (13, 1), (15, 1)],
  term ((1280237 : Rat) / 1072296) [(2, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-257614 : Rat) / 44679) [(2, 1), (8, 1), (13, 1), (15, 3), (16, 1)],
  term (-96 : Rat) [(2, 1), (8, 1), (15, 2)],
  term ((42424 : Rat) / 44679) [(2, 1), (8, 1), (15, 2), (16, 1)],
  term ((128807 : Rat) / 44679) [(2, 1), (8, 1), (15, 4), (16, 1)],
  term (-12 : Rat) [(2, 2)],
  term ((13712 : Rat) / 44679) [(2, 2), (3, 1), (13, 1), (15, 2), (16, 1)],
  term ((1714 : Rat) / 44679) [(2, 2), (3, 1), (15, 1), (16, 1)],
  term ((-6856 : Rat) / 44679) [(2, 2), (3, 1), (15, 3), (16, 1)],
  term ((199667 : Rat) / 268074) [(2, 2), (5, 1), (15, 1), (16, 1)],
  term ((-1714 : Rat) / 44679) [(2, 2), (7, 1), (15, 1), (16, 1)],
  term ((-1180595 : Rat) / 2144592) [(2, 2), (11, 1), (15, 1), (16, 1)],
  term (-96 : Rat) [(2, 2), (13, 1), (15, 1)],
  term ((-1280237 : Rat) / 2144592) [(2, 2), (13, 1), (15, 1), (16, 1)],
  term ((128807 : Rat) / 44679) [(2, 2), (13, 1), (15, 3), (16, 1)],
  term (48 : Rat) [(2, 2), (15, 2)],
  term ((-21212 : Rat) / 44679) [(2, 2), (15, 2), (16, 1)],
  term ((-128807 : Rat) / 89358) [(2, 2), (15, 4), (16, 1)],
  term ((-199667 : Rat) / 134037) [(3, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((3428 : Rat) / 44679) [(3, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(3, 1), (9, 1)],
  term ((1180595 : Rat) / 1072296) [(3, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term (192 : Rat) [(3, 1), (9, 1), (13, 1), (15, 1)],
  term ((1280237 : Rat) / 1072296) [(3, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-257614 : Rat) / 44679) [(3, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term (-96 : Rat) [(3, 1), (9, 1), (15, 2)],
  term ((42424 : Rat) / 44679) [(3, 1), (9, 1), (15, 2), (16, 1)],
  term ((128807 : Rat) / 44679) [(3, 1), (9, 1), (15, 4), (16, 1)],
  term (-12 : Rat) [(3, 2)],
  term ((199667 : Rat) / 268074) [(3, 2), (5, 1), (15, 1), (16, 1)],
  term ((-1714 : Rat) / 44679) [(3, 2), (7, 1), (15, 1), (16, 1)],
  term ((-27424 : Rat) / 44679) [(3, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-3428 : Rat) / 44679) [(3, 2), (9, 1), (15, 1), (16, 1)],
  term ((13712 : Rat) / 44679) [(3, 2), (9, 1), (15, 3), (16, 1)],
  term ((-1180595 : Rat) / 2144592) [(3, 2), (11, 1), (15, 1), (16, 1)],
  term (-96 : Rat) [(3, 2), (13, 1), (15, 1)],
  term ((-1280237 : Rat) / 2144592) [(3, 2), (13, 1), (15, 1), (16, 1)],
  term ((128807 : Rat) / 44679) [(3, 2), (13, 1), (15, 3), (16, 1)],
  term (48 : Rat) [(3, 2), (15, 2)],
  term ((-21212 : Rat) / 44679) [(3, 2), (15, 2), (16, 1)],
  term ((-128807 : Rat) / 89358) [(3, 2), (15, 4), (16, 1)],
  term ((13712 : Rat) / 44679) [(3, 3), (13, 1), (15, 2), (16, 1)],
  term ((1714 : Rat) / 44679) [(3, 3), (15, 1), (16, 1)],
  term ((-6856 : Rat) / 44679) [(3, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 19, terms 0 through 13. -/
theorem rs_R003_ueqv_R003NN_block_19_0000_0013_valid :
    checkProductSumEq rs_R003_ueqv_R003NN_partials_19_0000_0013
      rs_R003_ueqv_R003NN_block_19_0000_0013 = true := by
  native_decide

end R003UeqvR003NNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
