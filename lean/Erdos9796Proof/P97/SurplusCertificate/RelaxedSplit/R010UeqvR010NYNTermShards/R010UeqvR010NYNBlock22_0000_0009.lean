/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R010:u=v:R010NYN, term block 22:0-9

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R010UeqvR010NYNTermShards

/-- Generator polynomial 22 for relaxed split surplus certificate `R010:u=v:R010NYN`. -/
def rs_R010_ueqv_R010NYN_generator_22_0000_0009 : Poly :=
[
  term (-2 : Rat) [(0, 1), (10, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (11, 1)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(2, 1), (10, 1)],
  term (-1 : Rat) [(2, 2)],
  term (2 : Rat) [(3, 1), (11, 1)],
  term (-1 : Rat) [(3, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 22. -/
def rs_R010_ueqv_R010NYN_coefficient_22_0000 : Poly :=
[
  term ((160704 : Rat) / 2995) [(1, 1), (11, 1)]
]

/-- Partial product 0 for generator 22. -/
def rs_R010_ueqv_R010NYN_partial_22_0000 : Poly :=
[
  term ((-321408 : Rat) / 2995) [(0, 1), (1, 1), (10, 1), (11, 1)],
  term ((160704 : Rat) / 2995) [(0, 2), (1, 1), (11, 1)],
  term ((321408 : Rat) / 2995) [(1, 1), (2, 1), (10, 1), (11, 1)],
  term ((-160704 : Rat) / 2995) [(1, 1), (2, 2), (11, 1)],
  term ((321408 : Rat) / 2995) [(1, 1), (3, 1), (11, 2)],
  term ((-160704 : Rat) / 2995) [(1, 1), (3, 2), (11, 1)],
  term ((-321408 : Rat) / 2995) [(1, 2), (11, 2)],
  term ((160704 : Rat) / 2995) [(1, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 22. -/
theorem rs_R010_ueqv_R010NYN_partial_22_0000_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_22_0000
        rs_R010_ueqv_R010NYN_generator_22_0000_0009 =
      rs_R010_ueqv_R010NYN_partial_22_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 22. -/
def rs_R010_ueqv_R010NYN_coefficient_22_0001 : Poly :=
[
  term ((-122112 : Rat) / 2995) [(1, 1), (15, 1)]
]

/-- Partial product 1 for generator 22. -/
def rs_R010_ueqv_R010NYN_partial_22_0001 : Poly :=
[
  term ((244224 : Rat) / 2995) [(0, 1), (1, 1), (10, 1), (15, 1)],
  term ((-122112 : Rat) / 2995) [(0, 2), (1, 1), (15, 1)],
  term ((-244224 : Rat) / 2995) [(1, 1), (2, 1), (10, 1), (15, 1)],
  term ((122112 : Rat) / 2995) [(1, 1), (2, 2), (15, 1)],
  term ((-244224 : Rat) / 2995) [(1, 1), (3, 1), (11, 1), (15, 1)],
  term ((122112 : Rat) / 2995) [(1, 1), (3, 2), (15, 1)],
  term ((244224 : Rat) / 2995) [(1, 2), (11, 1), (15, 1)],
  term ((-122112 : Rat) / 2995) [(1, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 22. -/
theorem rs_R010_ueqv_R010NYN_partial_22_0001_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_22_0001
        rs_R010_ueqv_R010NYN_generator_22_0000_0009 =
      rs_R010_ueqv_R010NYN_partial_22_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 22. -/
def rs_R010_ueqv_R010NYN_coefficient_22_0002 : Poly :=
[
  term ((36 : Rat) / 5) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 2 for generator 22. -/
def rs_R010_ueqv_R010NYN_partial_22_0002 : Poly :=
[
  term ((-72 : Rat) / 5) [(0, 1), (1, 1), (10, 1), (15, 1), (16, 1)],
  term ((36 : Rat) / 5) [(0, 2), (1, 1), (15, 1), (16, 1)],
  term ((72 : Rat) / 5) [(1, 1), (2, 1), (10, 1), (15, 1), (16, 1)],
  term ((-36 : Rat) / 5) [(1, 1), (2, 2), (15, 1), (16, 1)],
  term ((72 : Rat) / 5) [(1, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((-36 : Rat) / 5) [(1, 1), (3, 2), (15, 1), (16, 1)],
  term ((-72 : Rat) / 5) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((36 : Rat) / 5) [(1, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 22. -/
theorem rs_R010_ueqv_R010NYN_partial_22_0002_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_22_0002
        rs_R010_ueqv_R010NYN_generator_22_0000_0009 =
      rs_R010_ueqv_R010NYN_partial_22_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 22. -/
def rs_R010_ueqv_R010NYN_coefficient_22_0003 : Poly :=
[
  term ((-1285632 : Rat) / 2995) [(9, 1), (11, 1)]
]

/-- Partial product 3 for generator 22. -/
def rs_R010_ueqv_R010NYN_partial_22_0003 : Poly :=
[
  term ((2571264 : Rat) / 2995) [(0, 1), (9, 1), (10, 1), (11, 1)],
  term ((-1285632 : Rat) / 2995) [(0, 2), (9, 1), (11, 1)],
  term ((2571264 : Rat) / 2995) [(1, 1), (9, 1), (11, 2)],
  term ((-1285632 : Rat) / 2995) [(1, 2), (9, 1), (11, 1)],
  term ((-2571264 : Rat) / 2995) [(2, 1), (9, 1), (10, 1), (11, 1)],
  term ((1285632 : Rat) / 2995) [(2, 2), (9, 1), (11, 1)],
  term ((-2571264 : Rat) / 2995) [(3, 1), (9, 1), (11, 2)],
  term ((1285632 : Rat) / 2995) [(3, 2), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 22. -/
theorem rs_R010_ueqv_R010NYN_partial_22_0003_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_22_0003
        rs_R010_ueqv_R010NYN_generator_22_0000_0009 =
      rs_R010_ueqv_R010NYN_partial_22_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 22. -/
def rs_R010_ueqv_R010NYN_coefficient_22_0004 : Poly :=
[
  term ((1378656 : Rat) / 2995) [(9, 1), (15, 1)]
]

/-- Partial product 4 for generator 22. -/
def rs_R010_ueqv_R010NYN_partial_22_0004 : Poly :=
[
  term ((-2757312 : Rat) / 2995) [(0, 1), (9, 1), (10, 1), (15, 1)],
  term ((1378656 : Rat) / 2995) [(0, 2), (9, 1), (15, 1)],
  term ((-2757312 : Rat) / 2995) [(1, 1), (9, 1), (11, 1), (15, 1)],
  term ((1378656 : Rat) / 2995) [(1, 2), (9, 1), (15, 1)],
  term ((2757312 : Rat) / 2995) [(2, 1), (9, 1), (10, 1), (15, 1)],
  term ((-1378656 : Rat) / 2995) [(2, 2), (9, 1), (15, 1)],
  term ((2757312 : Rat) / 2995) [(3, 1), (9, 1), (11, 1), (15, 1)],
  term ((-1378656 : Rat) / 2995) [(3, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 22. -/
theorem rs_R010_ueqv_R010NYN_partial_22_0004_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_22_0004
        rs_R010_ueqv_R010NYN_generator_22_0000_0009 =
      rs_R010_ueqv_R010NYN_partial_22_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 22. -/
def rs_R010_ueqv_R010NYN_coefficient_22_0005 : Poly :=
[
  term ((-348 : Rat) / 5) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 5 for generator 22. -/
def rs_R010_ueqv_R010NYN_partial_22_0005 : Poly :=
[
  term ((696 : Rat) / 5) [(0, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-348 : Rat) / 5) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((696 : Rat) / 5) [(1, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-348 : Rat) / 5) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term ((-696 : Rat) / 5) [(2, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((348 : Rat) / 5) [(2, 2), (9, 1), (15, 1), (16, 1)],
  term ((-696 : Rat) / 5) [(3, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((348 : Rat) / 5) [(3, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 22. -/
theorem rs_R010_ueqv_R010NYN_partial_22_0005_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_22_0005
        rs_R010_ueqv_R010NYN_generator_22_0000_0009 =
      rs_R010_ueqv_R010NYN_partial_22_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 22. -/
def rs_R010_ueqv_R010NYN_coefficient_22_0006 : Poly :=
[
  term ((1124928 : Rat) / 2995) [(11, 1), (15, 1)]
]

/-- Partial product 6 for generator 22. -/
def rs_R010_ueqv_R010NYN_partial_22_0006 : Poly :=
[
  term ((-2249856 : Rat) / 2995) [(0, 1), (10, 1), (11, 1), (15, 1)],
  term ((1124928 : Rat) / 2995) [(0, 2), (11, 1), (15, 1)],
  term ((-2249856 : Rat) / 2995) [(1, 1), (11, 2), (15, 1)],
  term ((1124928 : Rat) / 2995) [(1, 2), (11, 1), (15, 1)],
  term ((2249856 : Rat) / 2995) [(2, 1), (10, 1), (11, 1), (15, 1)],
  term ((-1124928 : Rat) / 2995) [(2, 2), (11, 1), (15, 1)],
  term ((2249856 : Rat) / 2995) [(3, 1), (11, 2), (15, 1)],
  term ((-1124928 : Rat) / 2995) [(3, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 22. -/
theorem rs_R010_ueqv_R010NYN_partial_22_0006_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_22_0006
        rs_R010_ueqv_R010NYN_generator_22_0000_0009 =
      rs_R010_ueqv_R010NYN_partial_22_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 22. -/
def rs_R010_ueqv_R010NYN_coefficient_22_0007 : Poly :=
[
  term (4 : Rat) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 7 for generator 22. -/
def rs_R010_ueqv_R010NYN_partial_22_0007 : Poly :=
[
  term (-8 : Rat) [(0, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(2, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(2, 2), (13, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(3, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 22. -/
theorem rs_R010_ueqv_R010NYN_partial_22_0007_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_22_0007
        rs_R010_ueqv_R010NYN_generator_22_0000_0009 =
      rs_R010_ueqv_R010NYN_partial_22_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 22. -/
def rs_R010_ueqv_R010NYN_coefficient_22_0008 : Poly :=
[
  term ((-1256544 : Rat) / 2995) [(15, 2)]
]

/-- Partial product 8 for generator 22. -/
def rs_R010_ueqv_R010NYN_partial_22_0008 : Poly :=
[
  term ((2513088 : Rat) / 2995) [(0, 1), (10, 1), (15, 2)],
  term ((-1256544 : Rat) / 2995) [(0, 2), (15, 2)],
  term ((2513088 : Rat) / 2995) [(1, 1), (11, 1), (15, 2)],
  term ((-1256544 : Rat) / 2995) [(1, 2), (15, 2)],
  term ((-2513088 : Rat) / 2995) [(2, 1), (10, 1), (15, 2)],
  term ((1256544 : Rat) / 2995) [(2, 2), (15, 2)],
  term ((-2513088 : Rat) / 2995) [(3, 1), (11, 1), (15, 2)],
  term ((1256544 : Rat) / 2995) [(3, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 22. -/
theorem rs_R010_ueqv_R010NYN_partial_22_0008_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_22_0008
        rs_R010_ueqv_R010NYN_generator_22_0000_0009 =
      rs_R010_ueqv_R010NYN_partial_22_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 22. -/
def rs_R010_ueqv_R010NYN_coefficient_22_0009 : Poly :=
[
  term ((272 : Rat) / 5) [(15, 2), (16, 1)]
]

/-- Partial product 9 for generator 22. -/
def rs_R010_ueqv_R010NYN_partial_22_0009 : Poly :=
[
  term ((-544 : Rat) / 5) [(0, 1), (10, 1), (15, 2), (16, 1)],
  term ((272 : Rat) / 5) [(0, 2), (15, 2), (16, 1)],
  term ((-544 : Rat) / 5) [(1, 1), (11, 1), (15, 2), (16, 1)],
  term ((272 : Rat) / 5) [(1, 2), (15, 2), (16, 1)],
  term ((544 : Rat) / 5) [(2, 1), (10, 1), (15, 2), (16, 1)],
  term ((-272 : Rat) / 5) [(2, 2), (15, 2), (16, 1)],
  term ((544 : Rat) / 5) [(3, 1), (11, 1), (15, 2), (16, 1)],
  term ((-272 : Rat) / 5) [(3, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 22. -/
theorem rs_R010_ueqv_R010NYN_partial_22_0009_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_22_0009
        rs_R010_ueqv_R010NYN_generator_22_0000_0009 =
      rs_R010_ueqv_R010NYN_partial_22_0009 := by
  native_decide

/-- Partial products in this block. -/
def rs_R010_ueqv_R010NYN_partials_22_0000_0009 : List Poly :=
[
  rs_R010_ueqv_R010NYN_partial_22_0000,
  rs_R010_ueqv_R010NYN_partial_22_0001,
  rs_R010_ueqv_R010NYN_partial_22_0002,
  rs_R010_ueqv_R010NYN_partial_22_0003,
  rs_R010_ueqv_R010NYN_partial_22_0004,
  rs_R010_ueqv_R010NYN_partial_22_0005,
  rs_R010_ueqv_R010NYN_partial_22_0006,
  rs_R010_ueqv_R010NYN_partial_22_0007,
  rs_R010_ueqv_R010NYN_partial_22_0008,
  rs_R010_ueqv_R010NYN_partial_22_0009
]

/-- Sum of partial products in this block. -/
def rs_R010_ueqv_R010NYN_block_22_0000_0009 : Poly :=
[
  term ((-321408 : Rat) / 2995) [(0, 1), (1, 1), (10, 1), (11, 1)],
  term ((244224 : Rat) / 2995) [(0, 1), (1, 1), (10, 1), (15, 1)],
  term ((-72 : Rat) / 5) [(0, 1), (1, 1), (10, 1), (15, 1), (16, 1)],
  term ((2571264 : Rat) / 2995) [(0, 1), (9, 1), (10, 1), (11, 1)],
  term ((-2757312 : Rat) / 2995) [(0, 1), (9, 1), (10, 1), (15, 1)],
  term ((696 : Rat) / 5) [(0, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-2249856 : Rat) / 2995) [(0, 1), (10, 1), (11, 1), (15, 1)],
  term (-8 : Rat) [(0, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((2513088 : Rat) / 2995) [(0, 1), (10, 1), (15, 2)],
  term ((-544 : Rat) / 5) [(0, 1), (10, 1), (15, 2), (16, 1)],
  term ((160704 : Rat) / 2995) [(0, 2), (1, 1), (11, 1)],
  term ((-122112 : Rat) / 2995) [(0, 2), (1, 1), (15, 1)],
  term ((36 : Rat) / 5) [(0, 2), (1, 1), (15, 1), (16, 1)],
  term ((-1285632 : Rat) / 2995) [(0, 2), (9, 1), (11, 1)],
  term ((1378656 : Rat) / 2995) [(0, 2), (9, 1), (15, 1)],
  term ((-348 : Rat) / 5) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((1124928 : Rat) / 2995) [(0, 2), (11, 1), (15, 1)],
  term (4 : Rat) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1256544 : Rat) / 2995) [(0, 2), (15, 2)],
  term ((272 : Rat) / 5) [(0, 2), (15, 2), (16, 1)],
  term ((321408 : Rat) / 2995) [(1, 1), (2, 1), (10, 1), (11, 1)],
  term ((-244224 : Rat) / 2995) [(1, 1), (2, 1), (10, 1), (15, 1)],
  term ((72 : Rat) / 5) [(1, 1), (2, 1), (10, 1), (15, 1), (16, 1)],
  term ((-160704 : Rat) / 2995) [(1, 1), (2, 2), (11, 1)],
  term ((122112 : Rat) / 2995) [(1, 1), (2, 2), (15, 1)],
  term ((-36 : Rat) / 5) [(1, 1), (2, 2), (15, 1), (16, 1)],
  term ((-244224 : Rat) / 2995) [(1, 1), (3, 1), (11, 1), (15, 1)],
  term ((72 : Rat) / 5) [(1, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((321408 : Rat) / 2995) [(1, 1), (3, 1), (11, 2)],
  term ((-160704 : Rat) / 2995) [(1, 1), (3, 2), (11, 1)],
  term ((122112 : Rat) / 2995) [(1, 1), (3, 2), (15, 1)],
  term ((-36 : Rat) / 5) [(1, 1), (3, 2), (15, 1), (16, 1)],
  term ((-2757312 : Rat) / 2995) [(1, 1), (9, 1), (11, 1), (15, 1)],
  term ((696 : Rat) / 5) [(1, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((2571264 : Rat) / 2995) [(1, 1), (9, 1), (11, 2)],
  term (-8 : Rat) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((2513088 : Rat) / 2995) [(1, 1), (11, 1), (15, 2)],
  term ((-544 : Rat) / 5) [(1, 1), (11, 1), (15, 2), (16, 1)],
  term ((-2249856 : Rat) / 2995) [(1, 1), (11, 2), (15, 1)],
  term ((-1285632 : Rat) / 2995) [(1, 2), (9, 1), (11, 1)],
  term ((1378656 : Rat) / 2995) [(1, 2), (9, 1), (15, 1)],
  term ((-348 : Rat) / 5) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term ((1369152 : Rat) / 2995) [(1, 2), (11, 1), (15, 1)],
  term ((-72 : Rat) / 5) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((-321408 : Rat) / 2995) [(1, 2), (11, 2)],
  term (4 : Rat) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1256544 : Rat) / 2995) [(1, 2), (15, 2)],
  term ((272 : Rat) / 5) [(1, 2), (15, 2), (16, 1)],
  term ((160704 : Rat) / 2995) [(1, 3), (11, 1)],
  term ((-122112 : Rat) / 2995) [(1, 3), (15, 1)],
  term ((36 : Rat) / 5) [(1, 3), (15, 1), (16, 1)],
  term ((-2571264 : Rat) / 2995) [(2, 1), (9, 1), (10, 1), (11, 1)],
  term ((2757312 : Rat) / 2995) [(2, 1), (9, 1), (10, 1), (15, 1)],
  term ((-696 : Rat) / 5) [(2, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((2249856 : Rat) / 2995) [(2, 1), (10, 1), (11, 1), (15, 1)],
  term (8 : Rat) [(2, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2513088 : Rat) / 2995) [(2, 1), (10, 1), (15, 2)],
  term ((544 : Rat) / 5) [(2, 1), (10, 1), (15, 2), (16, 1)],
  term ((1285632 : Rat) / 2995) [(2, 2), (9, 1), (11, 1)],
  term ((-1378656 : Rat) / 2995) [(2, 2), (9, 1), (15, 1)],
  term ((348 : Rat) / 5) [(2, 2), (9, 1), (15, 1), (16, 1)],
  term ((-1124928 : Rat) / 2995) [(2, 2), (11, 1), (15, 1)],
  term (-4 : Rat) [(2, 2), (13, 1), (15, 1), (16, 1)],
  term ((1256544 : Rat) / 2995) [(2, 2), (15, 2)],
  term ((-272 : Rat) / 5) [(2, 2), (15, 2), (16, 1)],
  term ((2757312 : Rat) / 2995) [(3, 1), (9, 1), (11, 1), (15, 1)],
  term ((-696 : Rat) / 5) [(3, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-2571264 : Rat) / 2995) [(3, 1), (9, 1), (11, 2)],
  term (8 : Rat) [(3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2513088 : Rat) / 2995) [(3, 1), (11, 1), (15, 2)],
  term ((544 : Rat) / 5) [(3, 1), (11, 1), (15, 2), (16, 1)],
  term ((2249856 : Rat) / 2995) [(3, 1), (11, 2), (15, 1)],
  term ((1285632 : Rat) / 2995) [(3, 2), (9, 1), (11, 1)],
  term ((-1378656 : Rat) / 2995) [(3, 2), (9, 1), (15, 1)],
  term ((348 : Rat) / 5) [(3, 2), (9, 1), (15, 1), (16, 1)],
  term ((-1124928 : Rat) / 2995) [(3, 2), (11, 1), (15, 1)],
  term (-4 : Rat) [(3, 2), (13, 1), (15, 1), (16, 1)],
  term ((1256544 : Rat) / 2995) [(3, 2), (15, 2)],
  term ((-272 : Rat) / 5) [(3, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 22, terms 0 through 9. -/
theorem rs_R010_ueqv_R010NYN_block_22_0000_0009_valid :
    checkProductSumEq rs_R010_ueqv_R010NYN_partials_22_0000_0009
      rs_R010_ueqv_R010NYN_block_22_0000_0009 = true := by
  native_decide

end R010UeqvR010NYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
