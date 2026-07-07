/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R010:u=v:R010NYN, term block 19:0-14

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R010UeqvR010NYNTermShards

/-- Generator polynomial 19 for relaxed split surplus certificate `R010:u=v:R010NYN`. -/
def rs_R010_ueqv_R010NYN_generator_19_0000_0014 : Poly :=
[
  term (2 : Rat) [(4, 1), (8, 1)],
  term (-1 : Rat) [(4, 2)],
  term (2 : Rat) [(5, 1), (9, 1)],
  term (-1 : Rat) [(5, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 19. -/
def rs_R010_ueqv_R010NYN_coefficient_19_0000 : Poly :=
[
  term ((11652 : Rat) / 599) []
]

/-- Partial product 0 for generator 19. -/
def rs_R010_ueqv_R010NYN_partial_19_0000 : Poly :=
[
  term ((23304 : Rat) / 599) [(4, 1), (8, 1)],
  term ((-11652 : Rat) / 599) [(4, 2)],
  term ((23304 : Rat) / 599) [(5, 1), (9, 1)],
  term ((-11652 : Rat) / 599) [(5, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 19. -/
theorem rs_R010_ueqv_R010NYN_partial_19_0000_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_19_0000
        rs_R010_ueqv_R010NYN_generator_19_0000_0014 =
      rs_R010_ueqv_R010NYN_partial_19_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 19. -/
def rs_R010_ueqv_R010NYN_coefficient_19_0001 : Poly :=
[
  term ((-23304 : Rat) / 599) [(0, 1)]
]

/-- Partial product 1 for generator 19. -/
def rs_R010_ueqv_R010NYN_partial_19_0001 : Poly :=
[
  term ((-46608 : Rat) / 599) [(0, 1), (4, 1), (8, 1)],
  term ((23304 : Rat) / 599) [(0, 1), (4, 2)],
  term ((-46608 : Rat) / 599) [(0, 1), (5, 1), (9, 1)],
  term ((23304 : Rat) / 599) [(0, 1), (5, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 19. -/
theorem rs_R010_ueqv_R010NYN_partial_19_0001_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_19_0001
        rs_R010_ueqv_R010NYN_generator_19_0000_0014 =
      rs_R010_ueqv_R010NYN_partial_19_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 19. -/
def rs_R010_ueqv_R010NYN_coefficient_19_0002 : Poly :=
[
  term ((-2957952 : Rat) / 2995) [(0, 1), (11, 1), (15, 1)]
]

/-- Partial product 2 for generator 19. -/
def rs_R010_ueqv_R010NYN_partial_19_0002 : Poly :=
[
  term ((-5915904 : Rat) / 2995) [(0, 1), (4, 1), (8, 1), (11, 1), (15, 1)],
  term ((2957952 : Rat) / 2995) [(0, 1), (4, 2), (11, 1), (15, 1)],
  term ((-5915904 : Rat) / 2995) [(0, 1), (5, 1), (9, 1), (11, 1), (15, 1)],
  term ((2957952 : Rat) / 2995) [(0, 1), (5, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 19. -/
theorem rs_R010_ueqv_R010NYN_partial_19_0002_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_19_0002
        rs_R010_ueqv_R010NYN_generator_19_0000_0014 =
      rs_R010_ueqv_R010NYN_partial_19_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 19. -/
def rs_R010_ueqv_R010NYN_coefficient_19_0003 : Poly :=
[
  term ((1012 : Rat) / 5) [(0, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 3 for generator 19. -/
def rs_R010_ueqv_R010NYN_partial_19_0003 : Poly :=
[
  term ((2024 : Rat) / 5) [(0, 1), (4, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1012 : Rat) / 5) [(0, 1), (4, 2), (11, 1), (15, 1), (16, 1)],
  term ((2024 : Rat) / 5) [(0, 1), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1012 : Rat) / 5) [(0, 1), (5, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 19. -/
theorem rs_R010_ueqv_R010NYN_partial_19_0003_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_19_0003
        rs_R010_ueqv_R010NYN_generator_19_0000_0014 =
      rs_R010_ueqv_R010NYN_partial_19_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 19. -/
def rs_R010_ueqv_R010NYN_coefficient_19_0004 : Poly :=
[
  term ((2999808 : Rat) / 2995) [(0, 1), (11, 2)]
]

/-- Partial product 4 for generator 19. -/
def rs_R010_ueqv_R010NYN_partial_19_0004 : Poly :=
[
  term ((5999616 : Rat) / 2995) [(0, 1), (4, 1), (8, 1), (11, 2)],
  term ((-2999808 : Rat) / 2995) [(0, 1), (4, 2), (11, 2)],
  term ((5999616 : Rat) / 2995) [(0, 1), (5, 1), (9, 1), (11, 2)],
  term ((-2999808 : Rat) / 2995) [(0, 1), (5, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 19. -/
theorem rs_R010_ueqv_R010NYN_partial_19_0004_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_19_0004
        rs_R010_ueqv_R010NYN_generator_19_0000_0014 =
      rs_R010_ueqv_R010NYN_partial_19_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 19. -/
def rs_R010_ueqv_R010NYN_coefficient_19_0005 : Poly :=
[
  term ((85344 : Rat) / 2995) [(0, 1), (15, 2)]
]

/-- Partial product 5 for generator 19. -/
def rs_R010_ueqv_R010NYN_partial_19_0005 : Poly :=
[
  term ((170688 : Rat) / 2995) [(0, 1), (4, 1), (8, 1), (15, 2)],
  term ((-85344 : Rat) / 2995) [(0, 1), (4, 2), (15, 2)],
  term ((170688 : Rat) / 2995) [(0, 1), (5, 1), (9, 1), (15, 2)],
  term ((-85344 : Rat) / 2995) [(0, 1), (5, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 19. -/
theorem rs_R010_ueqv_R010NYN_partial_19_0005_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_19_0005
        rs_R010_ueqv_R010NYN_generator_19_0000_0014 =
      rs_R010_ueqv_R010NYN_partial_19_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 19. -/
def rs_R010_ueqv_R010NYN_coefficient_19_0006 : Poly :=
[
  term ((-32 : Rat) / 5) [(0, 1), (15, 2), (16, 1)]
]

/-- Partial product 6 for generator 19. -/
def rs_R010_ueqv_R010NYN_partial_19_0006 : Poly :=
[
  term ((-64 : Rat) / 5) [(0, 1), (4, 1), (8, 1), (15, 2), (16, 1)],
  term ((32 : Rat) / 5) [(0, 1), (4, 2), (15, 2), (16, 1)],
  term ((-64 : Rat) / 5) [(0, 1), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((32 : Rat) / 5) [(0, 1), (5, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 19. -/
theorem rs_R010_ueqv_R010NYN_partial_19_0006_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_19_0006
        rs_R010_ueqv_R010NYN_generator_19_0000_0014 =
      rs_R010_ueqv_R010NYN_partial_19_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 19. -/
def rs_R010_ueqv_R010NYN_coefficient_19_0007 : Poly :=
[
  term ((964224 : Rat) / 2995) [(1, 1), (11, 1)]
]

/-- Partial product 7 for generator 19. -/
def rs_R010_ueqv_R010NYN_partial_19_0007 : Poly :=
[
  term ((1928448 : Rat) / 2995) [(1, 1), (4, 1), (8, 1), (11, 1)],
  term ((-964224 : Rat) / 2995) [(1, 1), (4, 2), (11, 1)],
  term ((1928448 : Rat) / 2995) [(1, 1), (5, 1), (9, 1), (11, 1)],
  term ((-964224 : Rat) / 2995) [(1, 1), (5, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 19. -/
theorem rs_R010_ueqv_R010NYN_partial_19_0007_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_19_0007
        rs_R010_ueqv_R010NYN_generator_19_0000_0014 =
      rs_R010_ueqv_R010NYN_partial_19_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 19. -/
def rs_R010_ueqv_R010NYN_coefficient_19_0008 : Poly :=
[
  term ((-911232 : Rat) / 2995) [(1, 1), (15, 1)]
]

/-- Partial product 8 for generator 19. -/
def rs_R010_ueqv_R010NYN_partial_19_0008 : Poly :=
[
  term ((-1822464 : Rat) / 2995) [(1, 1), (4, 1), (8, 1), (15, 1)],
  term ((911232 : Rat) / 2995) [(1, 1), (4, 2), (15, 1)],
  term ((-1822464 : Rat) / 2995) [(1, 1), (5, 1), (9, 1), (15, 1)],
  term ((911232 : Rat) / 2995) [(1, 1), (5, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 19. -/
theorem rs_R010_ueqv_R010NYN_partial_19_0008_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_19_0008
        rs_R010_ueqv_R010NYN_generator_19_0000_0014 =
      rs_R010_ueqv_R010NYN_partial_19_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 19. -/
def rs_R010_ueqv_R010NYN_coefficient_19_0009 : Poly :=
[
  term ((226 : Rat) / 5) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 9 for generator 19. -/
def rs_R010_ueqv_R010NYN_partial_19_0009 : Poly :=
[
  term ((452 : Rat) / 5) [(1, 1), (4, 1), (8, 1), (15, 1), (16, 1)],
  term ((-226 : Rat) / 5) [(1, 1), (4, 2), (15, 1), (16, 1)],
  term ((452 : Rat) / 5) [(1, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((-226 : Rat) / 5) [(1, 1), (5, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 19. -/
theorem rs_R010_ueqv_R010NYN_partial_19_0009_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_19_0009
        rs_R010_ueqv_R010NYN_generator_19_0000_0014 =
      rs_R010_ueqv_R010NYN_partial_19_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 19. -/
def rs_R010_ueqv_R010NYN_coefficient_19_0010 : Poly :=
[
  term ((514752 : Rat) / 2995) [(11, 1), (15, 1)]
]

/-- Partial product 10 for generator 19. -/
def rs_R010_ueqv_R010NYN_partial_19_0010 : Poly :=
[
  term ((1029504 : Rat) / 2995) [(4, 1), (8, 1), (11, 1), (15, 1)],
  term ((-514752 : Rat) / 2995) [(4, 2), (11, 1), (15, 1)],
  term ((1029504 : Rat) / 2995) [(5, 1), (9, 1), (11, 1), (15, 1)],
  term ((-514752 : Rat) / 2995) [(5, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 19. -/
theorem rs_R010_ueqv_R010NYN_partial_19_0010_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_19_0010
        rs_R010_ueqv_R010NYN_generator_19_0000_0014 =
      rs_R010_ueqv_R010NYN_partial_19_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 19. -/
def rs_R010_ueqv_R010NYN_coefficient_19_0011 : Poly :=
[
  term ((-506 : Rat) / 5) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 11 for generator 19. -/
def rs_R010_ueqv_R010NYN_partial_19_0011 : Poly :=
[
  term ((-1012 : Rat) / 5) [(4, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((506 : Rat) / 5) [(4, 2), (11, 1), (15, 1), (16, 1)],
  term ((-1012 : Rat) / 5) [(5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((506 : Rat) / 5) [(5, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 19. -/
theorem rs_R010_ueqv_R010NYN_partial_19_0011_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_19_0011
        rs_R010_ueqv_R010NYN_generator_19_0000_0014 =
      rs_R010_ueqv_R010NYN_partial_19_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 19. -/
def rs_R010_ueqv_R010NYN_coefficient_19_0012 : Poly :=
[
  term ((-1499904 : Rat) / 2995) [(11, 2)]
]

/-- Partial product 12 for generator 19. -/
def rs_R010_ueqv_R010NYN_partial_19_0012 : Poly :=
[
  term ((-2999808 : Rat) / 2995) [(4, 1), (8, 1), (11, 2)],
  term ((1499904 : Rat) / 2995) [(4, 2), (11, 2)],
  term ((-2999808 : Rat) / 2995) [(5, 1), (9, 1), (11, 2)],
  term ((1499904 : Rat) / 2995) [(5, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 19. -/
theorem rs_R010_ueqv_R010NYN_partial_19_0012_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_19_0012
        rs_R010_ueqv_R010NYN_generator_19_0000_0014 =
      rs_R010_ueqv_R010NYN_partial_19_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 19. -/
def rs_R010_ueqv_R010NYN_coefficient_19_0013 : Poly :=
[
  term ((173712 : Rat) / 599) [(15, 2)]
]

/-- Partial product 13 for generator 19. -/
def rs_R010_ueqv_R010NYN_partial_19_0013 : Poly :=
[
  term ((347424 : Rat) / 599) [(4, 1), (8, 1), (15, 2)],
  term ((-173712 : Rat) / 599) [(4, 2), (15, 2)],
  term ((347424 : Rat) / 599) [(5, 1), (9, 1), (15, 2)],
  term ((-173712 : Rat) / 599) [(5, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 19. -/
theorem rs_R010_ueqv_R010NYN_partial_19_0013_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_19_0013
        rs_R010_ueqv_R010NYN_generator_19_0000_0014 =
      rs_R010_ueqv_R010NYN_partial_19_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 19. -/
def rs_R010_ueqv_R010NYN_coefficient_19_0014 : Poly :=
[
  term (-42 : Rat) [(15, 2), (16, 1)]
]

/-- Partial product 14 for generator 19. -/
def rs_R010_ueqv_R010NYN_partial_19_0014 : Poly :=
[
  term (-84 : Rat) [(4, 1), (8, 1), (15, 2), (16, 1)],
  term (42 : Rat) [(4, 2), (15, 2), (16, 1)],
  term (-84 : Rat) [(5, 1), (9, 1), (15, 2), (16, 1)],
  term (42 : Rat) [(5, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 19. -/
theorem rs_R010_ueqv_R010NYN_partial_19_0014_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_19_0014
        rs_R010_ueqv_R010NYN_generator_19_0000_0014 =
      rs_R010_ueqv_R010NYN_partial_19_0014 := by
  native_decide

/-- Partial products in this block. -/
def rs_R010_ueqv_R010NYN_partials_19_0000_0014 : List Poly :=
[
  rs_R010_ueqv_R010NYN_partial_19_0000,
  rs_R010_ueqv_R010NYN_partial_19_0001,
  rs_R010_ueqv_R010NYN_partial_19_0002,
  rs_R010_ueqv_R010NYN_partial_19_0003,
  rs_R010_ueqv_R010NYN_partial_19_0004,
  rs_R010_ueqv_R010NYN_partial_19_0005,
  rs_R010_ueqv_R010NYN_partial_19_0006,
  rs_R010_ueqv_R010NYN_partial_19_0007,
  rs_R010_ueqv_R010NYN_partial_19_0008,
  rs_R010_ueqv_R010NYN_partial_19_0009,
  rs_R010_ueqv_R010NYN_partial_19_0010,
  rs_R010_ueqv_R010NYN_partial_19_0011,
  rs_R010_ueqv_R010NYN_partial_19_0012,
  rs_R010_ueqv_R010NYN_partial_19_0013,
  rs_R010_ueqv_R010NYN_partial_19_0014
]

/-- Sum of partial products in this block. -/
def rs_R010_ueqv_R010NYN_block_19_0000_0014 : Poly :=
[
  term ((-46608 : Rat) / 599) [(0, 1), (4, 1), (8, 1)],
  term ((-5915904 : Rat) / 2995) [(0, 1), (4, 1), (8, 1), (11, 1), (15, 1)],
  term ((2024 : Rat) / 5) [(0, 1), (4, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((5999616 : Rat) / 2995) [(0, 1), (4, 1), (8, 1), (11, 2)],
  term ((170688 : Rat) / 2995) [(0, 1), (4, 1), (8, 1), (15, 2)],
  term ((-64 : Rat) / 5) [(0, 1), (4, 1), (8, 1), (15, 2), (16, 1)],
  term ((23304 : Rat) / 599) [(0, 1), (4, 2)],
  term ((2957952 : Rat) / 2995) [(0, 1), (4, 2), (11, 1), (15, 1)],
  term ((-1012 : Rat) / 5) [(0, 1), (4, 2), (11, 1), (15, 1), (16, 1)],
  term ((-2999808 : Rat) / 2995) [(0, 1), (4, 2), (11, 2)],
  term ((-85344 : Rat) / 2995) [(0, 1), (4, 2), (15, 2)],
  term ((32 : Rat) / 5) [(0, 1), (4, 2), (15, 2), (16, 1)],
  term ((-46608 : Rat) / 599) [(0, 1), (5, 1), (9, 1)],
  term ((-5915904 : Rat) / 2995) [(0, 1), (5, 1), (9, 1), (11, 1), (15, 1)],
  term ((2024 : Rat) / 5) [(0, 1), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((5999616 : Rat) / 2995) [(0, 1), (5, 1), (9, 1), (11, 2)],
  term ((170688 : Rat) / 2995) [(0, 1), (5, 1), (9, 1), (15, 2)],
  term ((-64 : Rat) / 5) [(0, 1), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((23304 : Rat) / 599) [(0, 1), (5, 2)],
  term ((2957952 : Rat) / 2995) [(0, 1), (5, 2), (11, 1), (15, 1)],
  term ((-1012 : Rat) / 5) [(0, 1), (5, 2), (11, 1), (15, 1), (16, 1)],
  term ((-2999808 : Rat) / 2995) [(0, 1), (5, 2), (11, 2)],
  term ((-85344 : Rat) / 2995) [(0, 1), (5, 2), (15, 2)],
  term ((32 : Rat) / 5) [(0, 1), (5, 2), (15, 2), (16, 1)],
  term ((1928448 : Rat) / 2995) [(1, 1), (4, 1), (8, 1), (11, 1)],
  term ((-1822464 : Rat) / 2995) [(1, 1), (4, 1), (8, 1), (15, 1)],
  term ((452 : Rat) / 5) [(1, 1), (4, 1), (8, 1), (15, 1), (16, 1)],
  term ((-964224 : Rat) / 2995) [(1, 1), (4, 2), (11, 1)],
  term ((911232 : Rat) / 2995) [(1, 1), (4, 2), (15, 1)],
  term ((-226 : Rat) / 5) [(1, 1), (4, 2), (15, 1), (16, 1)],
  term ((1928448 : Rat) / 2995) [(1, 1), (5, 1), (9, 1), (11, 1)],
  term ((-1822464 : Rat) / 2995) [(1, 1), (5, 1), (9, 1), (15, 1)],
  term ((452 : Rat) / 5) [(1, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((-964224 : Rat) / 2995) [(1, 1), (5, 2), (11, 1)],
  term ((911232 : Rat) / 2995) [(1, 1), (5, 2), (15, 1)],
  term ((-226 : Rat) / 5) [(1, 1), (5, 2), (15, 1), (16, 1)],
  term ((23304 : Rat) / 599) [(4, 1), (8, 1)],
  term ((1029504 : Rat) / 2995) [(4, 1), (8, 1), (11, 1), (15, 1)],
  term ((-1012 : Rat) / 5) [(4, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-2999808 : Rat) / 2995) [(4, 1), (8, 1), (11, 2)],
  term ((347424 : Rat) / 599) [(4, 1), (8, 1), (15, 2)],
  term (-84 : Rat) [(4, 1), (8, 1), (15, 2), (16, 1)],
  term ((-11652 : Rat) / 599) [(4, 2)],
  term ((-514752 : Rat) / 2995) [(4, 2), (11, 1), (15, 1)],
  term ((506 : Rat) / 5) [(4, 2), (11, 1), (15, 1), (16, 1)],
  term ((1499904 : Rat) / 2995) [(4, 2), (11, 2)],
  term ((-173712 : Rat) / 599) [(4, 2), (15, 2)],
  term (42 : Rat) [(4, 2), (15, 2), (16, 1)],
  term ((23304 : Rat) / 599) [(5, 1), (9, 1)],
  term ((1029504 : Rat) / 2995) [(5, 1), (9, 1), (11, 1), (15, 1)],
  term ((-1012 : Rat) / 5) [(5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-2999808 : Rat) / 2995) [(5, 1), (9, 1), (11, 2)],
  term ((347424 : Rat) / 599) [(5, 1), (9, 1), (15, 2)],
  term (-84 : Rat) [(5, 1), (9, 1), (15, 2), (16, 1)],
  term ((-11652 : Rat) / 599) [(5, 2)],
  term ((-514752 : Rat) / 2995) [(5, 2), (11, 1), (15, 1)],
  term ((506 : Rat) / 5) [(5, 2), (11, 1), (15, 1), (16, 1)],
  term ((1499904 : Rat) / 2995) [(5, 2), (11, 2)],
  term ((-173712 : Rat) / 599) [(5, 2), (15, 2)],
  term (42 : Rat) [(5, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 19, terms 0 through 14. -/
theorem rs_R010_ueqv_R010NYN_block_19_0000_0014_valid :
    checkProductSumEq rs_R010_ueqv_R010NYN_partials_19_0000_0014
      rs_R010_ueqv_R010NYN_block_19_0000_0014 = true := by
  native_decide

end R010UeqvR010NYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
