/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R003:u=v:R003NY, term block 19:0-34

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R003UeqvR003NYTermShards

/-- Generator polynomial 19 for relaxed split surplus certificate `R003:u=v:R003NY`. -/
def rs_R003_ueqv_R003NY_generator_19_0000_0034 : Poly :=
[
  term (-2 : Rat) [(0, 1), (8, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (9, 1)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(2, 1), (8, 1)],
  term (-1 : Rat) [(2, 2)],
  term (2 : Rat) [(3, 1), (9, 1)],
  term (-1 : Rat) [(3, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003NY_coefficient_19_0000 : Poly :=
[
  term ((1800 : Rat) / 299) [(0, 1), (1, 1), (15, 1), (16, 1)]
]

/-- Partial product 0 for generator 19. -/
def rs_R003_ueqv_R003NY_partial_19_0000 : Poly :=
[
  term ((3600 : Rat) / 299) [(0, 1), (1, 1), (2, 1), (8, 1), (15, 1), (16, 1)],
  term ((-1800 : Rat) / 299) [(0, 1), (1, 1), (2, 2), (15, 1), (16, 1)],
  term ((3600 : Rat) / 299) [(0, 1), (1, 1), (3, 1), (9, 1), (15, 1), (16, 1)],
  term ((-1800 : Rat) / 299) [(0, 1), (1, 1), (3, 2), (15, 1), (16, 1)],
  term ((-3600 : Rat) / 299) [(0, 1), (1, 2), (9, 1), (15, 1), (16, 1)],
  term ((1800 : Rat) / 299) [(0, 1), (1, 3), (15, 1), (16, 1)],
  term ((-3600 : Rat) / 299) [(0, 2), (1, 1), (8, 1), (15, 1), (16, 1)],
  term ((1800 : Rat) / 299) [(0, 3), (1, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 19. -/
theorem rs_R003_ueqv_R003NY_partial_19_0000_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_19_0000
        rs_R003_ueqv_R003NY_generator_19_0000_0034 =
      rs_R003_ueqv_R003NY_partial_19_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003NY_coefficient_19_0001 : Poly :=
[
  term ((600 : Rat) / 299) [(0, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 1 for generator 19. -/
def rs_R003_ueqv_R003NY_partial_19_0001 : Poly :=
[
  term ((-1200 : Rat) / 299) [(0, 1), (1, 1), (9, 2), (11, 1), (16, 1)],
  term ((600 : Rat) / 299) [(0, 1), (1, 2), (9, 1), (11, 1), (16, 1)],
  term ((1200 : Rat) / 299) [(0, 1), (2, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-600 : Rat) / 299) [(0, 1), (2, 2), (9, 1), (11, 1), (16, 1)],
  term ((1200 : Rat) / 299) [(0, 1), (3, 1), (9, 2), (11, 1), (16, 1)],
  term ((-600 : Rat) / 299) [(0, 1), (3, 2), (9, 1), (11, 1), (16, 1)],
  term ((-1200 : Rat) / 299) [(0, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((600 : Rat) / 299) [(0, 3), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 19. -/
theorem rs_R003_ueqv_R003NY_partial_19_0001_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_19_0001
        rs_R003_ueqv_R003NY_generator_19_0000_0034 =
      rs_R003_ueqv_R003NY_partial_19_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003NY_coefficient_19_0002 : Poly :=
[
  term ((-7200 : Rat) / 299) [(0, 1), (9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 2 for generator 19. -/
def rs_R003_ueqv_R003NY_partial_19_0002 : Poly :=
[
  term ((14400 : Rat) / 299) [(0, 1), (1, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((-7200 : Rat) / 299) [(0, 1), (1, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-14400 : Rat) / 299) [(0, 1), (2, 1), (8, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((7200 : Rat) / 299) [(0, 1), (2, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-14400 : Rat) / 299) [(0, 1), (3, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((7200 : Rat) / 299) [(0, 1), (3, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((14400 : Rat) / 299) [(0, 2), (8, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-7200 : Rat) / 299) [(0, 3), (9, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 19. -/
theorem rs_R003_ueqv_R003NY_partial_19_0002_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_19_0002
        rs_R003_ueqv_R003NY_generator_19_0000_0034 =
      rs_R003_ueqv_R003NY_partial_19_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003NY_coefficient_19_0003 : Poly :=
[
  term ((1800 : Rat) / 299) [(0, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 3 for generator 19. -/
def rs_R003_ueqv_R003NY_partial_19_0003 : Poly :=
[
  term ((-3600 : Rat) / 299) [(0, 1), (1, 1), (9, 2), (13, 1), (16, 1)],
  term ((1800 : Rat) / 299) [(0, 1), (1, 2), (9, 1), (13, 1), (16, 1)],
  term ((3600 : Rat) / 299) [(0, 1), (2, 1), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((-1800 : Rat) / 299) [(0, 1), (2, 2), (9, 1), (13, 1), (16, 1)],
  term ((3600 : Rat) / 299) [(0, 1), (3, 1), (9, 2), (13, 1), (16, 1)],
  term ((-1800 : Rat) / 299) [(0, 1), (3, 2), (9, 1), (13, 1), (16, 1)],
  term ((-3600 : Rat) / 299) [(0, 2), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((1800 : Rat) / 299) [(0, 3), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 19. -/
theorem rs_R003_ueqv_R003NY_partial_19_0003_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_19_0003
        rs_R003_ueqv_R003NY_generator_19_0000_0034 =
      rs_R003_ueqv_R003NY_partial_19_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003NY_coefficient_19_0004 : Poly :=
[
  term ((-4320 : Rat) / 299) [(0, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 4 for generator 19. -/
def rs_R003_ueqv_R003NY_partial_19_0004 : Poly :=
[
  term ((8640 : Rat) / 299) [(0, 1), (1, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((-4320 : Rat) / 299) [(0, 1), (1, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-8640 : Rat) / 299) [(0, 1), (2, 1), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((4320 : Rat) / 299) [(0, 1), (2, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-8640 : Rat) / 299) [(0, 1), (3, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((4320 : Rat) / 299) [(0, 1), (3, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((8640 : Rat) / 299) [(0, 2), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4320 : Rat) / 299) [(0, 3), (9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 19. -/
theorem rs_R003_ueqv_R003NY_partial_19_0004_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_19_0004
        rs_R003_ueqv_R003NY_generator_19_0000_0034 =
      rs_R003_ueqv_R003NY_partial_19_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003NY_coefficient_19_0005 : Poly :=
[
  term ((4320 : Rat) / 299) [(0, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 5 for generator 19. -/
def rs_R003_ueqv_R003NY_partial_19_0005 : Poly :=
[
  term ((-8640 : Rat) / 299) [(0, 1), (1, 1), (9, 2), (15, 1), (16, 1)],
  term ((4320 : Rat) / 299) [(0, 1), (1, 2), (9, 1), (15, 1), (16, 1)],
  term ((8640 : Rat) / 299) [(0, 1), (2, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-4320 : Rat) / 299) [(0, 1), (2, 2), (9, 1), (15, 1), (16, 1)],
  term ((8640 : Rat) / 299) [(0, 1), (3, 1), (9, 2), (15, 1), (16, 1)],
  term ((-4320 : Rat) / 299) [(0, 1), (3, 2), (9, 1), (15, 1), (16, 1)],
  term ((-8640 : Rat) / 299) [(0, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((4320 : Rat) / 299) [(0, 3), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 19. -/
theorem rs_R003_ueqv_R003NY_partial_19_0005_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_19_0005
        rs_R003_ueqv_R003NY_generator_19_0000_0034 =
      rs_R003_ueqv_R003NY_partial_19_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003NY_coefficient_19_0006 : Poly :=
[
  term ((-3600 : Rat) / 299) [(0, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 6 for generator 19. -/
def rs_R003_ueqv_R003NY_partial_19_0006 : Poly :=
[
  term ((7200 : Rat) / 299) [(0, 1), (1, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-3600 : Rat) / 299) [(0, 1), (1, 2), (11, 1), (13, 1), (16, 1)],
  term ((-7200 : Rat) / 299) [(0, 1), (2, 1), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((3600 : Rat) / 299) [(0, 1), (2, 2), (11, 1), (13, 1), (16, 1)],
  term ((-7200 : Rat) / 299) [(0, 1), (3, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((3600 : Rat) / 299) [(0, 1), (3, 2), (11, 1), (13, 1), (16, 1)],
  term ((7200 : Rat) / 299) [(0, 2), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((-3600 : Rat) / 299) [(0, 3), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 19. -/
theorem rs_R003_ueqv_R003NY_partial_19_0006_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_19_0006
        rs_R003_ueqv_R003NY_generator_19_0000_0034 =
      rs_R003_ueqv_R003NY_partial_19_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003NY_coefficient_19_0007 : Poly :=
[
  term ((-240 : Rat) / 299) [(0, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 7 for generator 19. -/
def rs_R003_ueqv_R003NY_partial_19_0007 : Poly :=
[
  term ((480 : Rat) / 299) [(0, 1), (1, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-240 : Rat) / 299) [(0, 1), (1, 2), (11, 1), (15, 1), (16, 1)],
  term ((-480 : Rat) / 299) [(0, 1), (2, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((240 : Rat) / 299) [(0, 1), (2, 2), (11, 1), (15, 1), (16, 1)],
  term ((-480 : Rat) / 299) [(0, 1), (3, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((240 : Rat) / 299) [(0, 1), (3, 2), (11, 1), (15, 1), (16, 1)],
  term ((480 : Rat) / 299) [(0, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-240 : Rat) / 299) [(0, 3), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 19. -/
theorem rs_R003_ueqv_R003NY_partial_19_0007_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_19_0007
        rs_R003_ueqv_R003NY_generator_19_0000_0034 =
      rs_R003_ueqv_R003NY_partial_19_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003NY_coefficient_19_0008 : Poly :=
[
  term ((-1800 : Rat) / 299) [(0, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 8 for generator 19. -/
def rs_R003_ueqv_R003NY_partial_19_0008 : Poly :=
[
  term ((3600 : Rat) / 299) [(0, 1), (1, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1800 : Rat) / 299) [(0, 1), (1, 2), (13, 1), (15, 1), (16, 1)],
  term ((-3600 : Rat) / 299) [(0, 1), (2, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((1800 : Rat) / 299) [(0, 1), (2, 2), (13, 1), (15, 1), (16, 1)],
  term ((-3600 : Rat) / 299) [(0, 1), (3, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((1800 : Rat) / 299) [(0, 1), (3, 2), (13, 1), (15, 1), (16, 1)],
  term ((3600 : Rat) / 299) [(0, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1800 : Rat) / 299) [(0, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 19. -/
theorem rs_R003_ueqv_R003NY_partial_19_0008_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_19_0008
        rs_R003_ueqv_R003NY_generator_19_0000_0034 =
      rs_R003_ueqv_R003NY_partial_19_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003NY_coefficient_19_0009 : Poly :=
[
  term ((-180 : Rat) / 299) [(0, 1), (14, 1), (16, 1)]
]

/-- Partial product 9 for generator 19. -/
def rs_R003_ueqv_R003NY_partial_19_0009 : Poly :=
[
  term ((360 : Rat) / 299) [(0, 1), (1, 1), (9, 1), (14, 1), (16, 1)],
  term ((-180 : Rat) / 299) [(0, 1), (1, 2), (14, 1), (16, 1)],
  term ((-360 : Rat) / 299) [(0, 1), (2, 1), (8, 1), (14, 1), (16, 1)],
  term ((180 : Rat) / 299) [(0, 1), (2, 2), (14, 1), (16, 1)],
  term ((-360 : Rat) / 299) [(0, 1), (3, 1), (9, 1), (14, 1), (16, 1)],
  term ((180 : Rat) / 299) [(0, 1), (3, 2), (14, 1), (16, 1)],
  term ((360 : Rat) / 299) [(0, 2), (8, 1), (14, 1), (16, 1)],
  term ((-180 : Rat) / 299) [(0, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 19. -/
theorem rs_R003_ueqv_R003NY_partial_19_0009_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_19_0009
        rs_R003_ueqv_R003NY_generator_19_0000_0034 =
      rs_R003_ueqv_R003NY_partial_19_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003NY_coefficient_19_0010 : Poly :=
[
  term ((2160 : Rat) / 299) [(0, 1), (15, 2), (16, 1)]
]

/-- Partial product 10 for generator 19. -/
def rs_R003_ueqv_R003NY_partial_19_0010 : Poly :=
[
  term ((-4320 : Rat) / 299) [(0, 1), (1, 1), (9, 1), (15, 2), (16, 1)],
  term ((2160 : Rat) / 299) [(0, 1), (1, 2), (15, 2), (16, 1)],
  term ((4320 : Rat) / 299) [(0, 1), (2, 1), (8, 1), (15, 2), (16, 1)],
  term ((-2160 : Rat) / 299) [(0, 1), (2, 2), (15, 2), (16, 1)],
  term ((4320 : Rat) / 299) [(0, 1), (3, 1), (9, 1), (15, 2), (16, 1)],
  term ((-2160 : Rat) / 299) [(0, 1), (3, 2), (15, 2), (16, 1)],
  term ((-4320 : Rat) / 299) [(0, 2), (8, 1), (15, 2), (16, 1)],
  term ((2160 : Rat) / 299) [(0, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 19. -/
theorem rs_R003_ueqv_R003NY_partial_19_0010_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_19_0010
        rs_R003_ueqv_R003NY_generator_19_0000_0034 =
      rs_R003_ueqv_R003NY_partial_19_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003NY_coefficient_19_0011 : Poly :=
[
  term ((90 : Rat) / 299) [(0, 1), (16, 1)]
]

/-- Partial product 11 for generator 19. -/
def rs_R003_ueqv_R003NY_partial_19_0011 : Poly :=
[
  term ((-180 : Rat) / 299) [(0, 1), (1, 1), (9, 1), (16, 1)],
  term ((90 : Rat) / 299) [(0, 1), (1, 2), (16, 1)],
  term ((180 : Rat) / 299) [(0, 1), (2, 1), (8, 1), (16, 1)],
  term ((-90 : Rat) / 299) [(0, 1), (2, 2), (16, 1)],
  term ((180 : Rat) / 299) [(0, 1), (3, 1), (9, 1), (16, 1)],
  term ((-90 : Rat) / 299) [(0, 1), (3, 2), (16, 1)],
  term ((-180 : Rat) / 299) [(0, 2), (8, 1), (16, 1)],
  term ((90 : Rat) / 299) [(0, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 19. -/
theorem rs_R003_ueqv_R003NY_partial_19_0011_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_19_0011
        rs_R003_ueqv_R003NY_generator_19_0000_0034 =
      rs_R003_ueqv_R003NY_partial_19_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003NY_coefficient_19_0012 : Poly :=
[
  term ((-1800 : Rat) / 299) [(1, 1), (2, 1), (15, 1), (16, 1)]
]

/-- Partial product 12 for generator 19. -/
def rs_R003_ueqv_R003NY_partial_19_0012 : Poly :=
[
  term ((3600 : Rat) / 299) [(0, 1), (1, 1), (2, 1), (8, 1), (15, 1), (16, 1)],
  term ((-1800 : Rat) / 299) [(0, 2), (1, 1), (2, 1), (15, 1), (16, 1)],
  term ((-3600 : Rat) / 299) [(1, 1), (2, 1), (3, 1), (9, 1), (15, 1), (16, 1)],
  term ((1800 : Rat) / 299) [(1, 1), (2, 1), (3, 2), (15, 1), (16, 1)],
  term ((-3600 : Rat) / 299) [(1, 1), (2, 2), (8, 1), (15, 1), (16, 1)],
  term ((1800 : Rat) / 299) [(1, 1), (2, 3), (15, 1), (16, 1)],
  term ((3600 : Rat) / 299) [(1, 2), (2, 1), (9, 1), (15, 1), (16, 1)],
  term ((-1800 : Rat) / 299) [(1, 3), (2, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 19. -/
theorem rs_R003_ueqv_R003NY_partial_19_0012_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_19_0012
        rs_R003_ueqv_R003NY_generator_19_0000_0034 =
      rs_R003_ueqv_R003NY_partial_19_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003NY_coefficient_19_0013 : Poly :=
[
  term ((24 : Rat) / 13) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 13 for generator 19. -/
def rs_R003_ueqv_R003NY_partial_19_0013 : Poly :=
[
  term ((-48 : Rat) / 13) [(0, 1), (1, 1), (8, 1), (15, 1), (16, 1)],
  term ((24 : Rat) / 13) [(0, 2), (1, 1), (15, 1), (16, 1)],
  term ((48 : Rat) / 13) [(1, 1), (2, 1), (8, 1), (15, 1), (16, 1)],
  term ((-24 : Rat) / 13) [(1, 1), (2, 2), (15, 1), (16, 1)],
  term ((48 : Rat) / 13) [(1, 1), (3, 1), (9, 1), (15, 1), (16, 1)],
  term ((-24 : Rat) / 13) [(1, 1), (3, 2), (15, 1), (16, 1)],
  term ((-48 : Rat) / 13) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term ((24 : Rat) / 13) [(1, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 19. -/
theorem rs_R003_ueqv_R003NY_partial_19_0013_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_19_0013
        rs_R003_ueqv_R003NY_generator_19_0000_0034 =
      rs_R003_ueqv_R003NY_partial_19_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003NY_coefficient_19_0014 : Poly :=
[
  term ((-600 : Rat) / 299) [(2, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 14 for generator 19. -/
def rs_R003_ueqv_R003NY_partial_19_0014 : Poly :=
[
  term ((1200 : Rat) / 299) [(0, 1), (2, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-600 : Rat) / 299) [(0, 2), (2, 1), (9, 1), (11, 1), (16, 1)],
  term ((1200 : Rat) / 299) [(1, 1), (2, 1), (9, 2), (11, 1), (16, 1)],
  term ((-600 : Rat) / 299) [(1, 2), (2, 1), (9, 1), (11, 1), (16, 1)],
  term ((-1200 : Rat) / 299) [(2, 1), (3, 1), (9, 2), (11, 1), (16, 1)],
  term ((600 : Rat) / 299) [(2, 1), (3, 2), (9, 1), (11, 1), (16, 1)],
  term ((-1200 : Rat) / 299) [(2, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((600 : Rat) / 299) [(2, 3), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 19. -/
theorem rs_R003_ueqv_R003NY_partial_19_0014_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_19_0014
        rs_R003_ueqv_R003NY_generator_19_0000_0034 =
      rs_R003_ueqv_R003NY_partial_19_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003NY_coefficient_19_0015 : Poly :=
[
  term ((7200 : Rat) / 299) [(2, 1), (9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 15 for generator 19. -/
def rs_R003_ueqv_R003NY_partial_19_0015 : Poly :=
[
  term ((-14400 : Rat) / 299) [(0, 1), (2, 1), (8, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((7200 : Rat) / 299) [(0, 2), (2, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-14400 : Rat) / 299) [(1, 1), (2, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((7200 : Rat) / 299) [(1, 2), (2, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((14400 : Rat) / 299) [(2, 1), (3, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((-7200 : Rat) / 299) [(2, 1), (3, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((14400 : Rat) / 299) [(2, 2), (8, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-7200 : Rat) / 299) [(2, 3), (9, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 19. -/
theorem rs_R003_ueqv_R003NY_partial_19_0015_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_19_0015
        rs_R003_ueqv_R003NY_generator_19_0000_0034 =
      rs_R003_ueqv_R003NY_partial_19_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003NY_coefficient_19_0016 : Poly :=
[
  term ((-1800 : Rat) / 299) [(2, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 16 for generator 19. -/
def rs_R003_ueqv_R003NY_partial_19_0016 : Poly :=
[
  term ((3600 : Rat) / 299) [(0, 1), (2, 1), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((-1800 : Rat) / 299) [(0, 2), (2, 1), (9, 1), (13, 1), (16, 1)],
  term ((3600 : Rat) / 299) [(1, 1), (2, 1), (9, 2), (13, 1), (16, 1)],
  term ((-1800 : Rat) / 299) [(1, 2), (2, 1), (9, 1), (13, 1), (16, 1)],
  term ((-3600 : Rat) / 299) [(2, 1), (3, 1), (9, 2), (13, 1), (16, 1)],
  term ((1800 : Rat) / 299) [(2, 1), (3, 2), (9, 1), (13, 1), (16, 1)],
  term ((-3600 : Rat) / 299) [(2, 2), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((1800 : Rat) / 299) [(2, 3), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 19. -/
theorem rs_R003_ueqv_R003NY_partial_19_0016_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_19_0016
        rs_R003_ueqv_R003NY_generator_19_0000_0034 =
      rs_R003_ueqv_R003NY_partial_19_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003NY_coefficient_19_0017 : Poly :=
[
  term ((4320 : Rat) / 299) [(2, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 17 for generator 19. -/
def rs_R003_ueqv_R003NY_partial_19_0017 : Poly :=
[
  term ((-8640 : Rat) / 299) [(0, 1), (2, 1), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((4320 : Rat) / 299) [(0, 2), (2, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-8640 : Rat) / 299) [(1, 1), (2, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((4320 : Rat) / 299) [(1, 2), (2, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((8640 : Rat) / 299) [(2, 1), (3, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((-4320 : Rat) / 299) [(2, 1), (3, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((8640 : Rat) / 299) [(2, 2), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4320 : Rat) / 299) [(2, 3), (9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 19. -/
theorem rs_R003_ueqv_R003NY_partial_19_0017_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_19_0017
        rs_R003_ueqv_R003NY_generator_19_0000_0034 =
      rs_R003_ueqv_R003NY_partial_19_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003NY_coefficient_19_0018 : Poly :=
[
  term ((-4320 : Rat) / 299) [(2, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 18 for generator 19. -/
def rs_R003_ueqv_R003NY_partial_19_0018 : Poly :=
[
  term ((8640 : Rat) / 299) [(0, 1), (2, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-4320 : Rat) / 299) [(0, 2), (2, 1), (9, 1), (15, 1), (16, 1)],
  term ((8640 : Rat) / 299) [(1, 1), (2, 1), (9, 2), (15, 1), (16, 1)],
  term ((-4320 : Rat) / 299) [(1, 2), (2, 1), (9, 1), (15, 1), (16, 1)],
  term ((-8640 : Rat) / 299) [(2, 1), (3, 1), (9, 2), (15, 1), (16, 1)],
  term ((4320 : Rat) / 299) [(2, 1), (3, 2), (9, 1), (15, 1), (16, 1)],
  term ((-8640 : Rat) / 299) [(2, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((4320 : Rat) / 299) [(2, 3), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 19. -/
theorem rs_R003_ueqv_R003NY_partial_19_0018_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_19_0018
        rs_R003_ueqv_R003NY_generator_19_0000_0034 =
      rs_R003_ueqv_R003NY_partial_19_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003NY_coefficient_19_0019 : Poly :=
[
  term ((3600 : Rat) / 299) [(2, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 19 for generator 19. -/
def rs_R003_ueqv_R003NY_partial_19_0019 : Poly :=
[
  term ((-7200 : Rat) / 299) [(0, 1), (2, 1), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((3600 : Rat) / 299) [(0, 2), (2, 1), (11, 1), (13, 1), (16, 1)],
  term ((-7200 : Rat) / 299) [(1, 1), (2, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((3600 : Rat) / 299) [(1, 2), (2, 1), (11, 1), (13, 1), (16, 1)],
  term ((7200 : Rat) / 299) [(2, 1), (3, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-3600 : Rat) / 299) [(2, 1), (3, 2), (11, 1), (13, 1), (16, 1)],
  term ((7200 : Rat) / 299) [(2, 2), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((-3600 : Rat) / 299) [(2, 3), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 19. -/
theorem rs_R003_ueqv_R003NY_partial_19_0019_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_19_0019
        rs_R003_ueqv_R003NY_generator_19_0000_0034 =
      rs_R003_ueqv_R003NY_partial_19_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003NY_coefficient_19_0020 : Poly :=
[
  term ((240 : Rat) / 299) [(2, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 20 for generator 19. -/
def rs_R003_ueqv_R003NY_partial_19_0020 : Poly :=
[
  term ((-480 : Rat) / 299) [(0, 1), (2, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((240 : Rat) / 299) [(0, 2), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((-480 : Rat) / 299) [(1, 1), (2, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((240 : Rat) / 299) [(1, 2), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((480 : Rat) / 299) [(2, 1), (3, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-240 : Rat) / 299) [(2, 1), (3, 2), (11, 1), (15, 1), (16, 1)],
  term ((480 : Rat) / 299) [(2, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-240 : Rat) / 299) [(2, 3), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 19. -/
theorem rs_R003_ueqv_R003NY_partial_19_0020_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_19_0020
        rs_R003_ueqv_R003NY_generator_19_0000_0034 =
      rs_R003_ueqv_R003NY_partial_19_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003NY_coefficient_19_0021 : Poly :=
[
  term ((1800 : Rat) / 299) [(2, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 21 for generator 19. -/
def rs_R003_ueqv_R003NY_partial_19_0021 : Poly :=
[
  term ((-3600 : Rat) / 299) [(0, 1), (2, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((1800 : Rat) / 299) [(0, 2), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3600 : Rat) / 299) [(1, 1), (2, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((1800 : Rat) / 299) [(1, 2), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((3600 : Rat) / 299) [(2, 1), (3, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1800 : Rat) / 299) [(2, 1), (3, 2), (13, 1), (15, 1), (16, 1)],
  term ((3600 : Rat) / 299) [(2, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1800 : Rat) / 299) [(2, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 19. -/
theorem rs_R003_ueqv_R003NY_partial_19_0021_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_19_0021
        rs_R003_ueqv_R003NY_generator_19_0000_0034 =
      rs_R003_ueqv_R003NY_partial_19_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003NY_coefficient_19_0022 : Poly :=
[
  term ((180 : Rat) / 299) [(2, 1), (14, 1), (16, 1)]
]

/-- Partial product 22 for generator 19. -/
def rs_R003_ueqv_R003NY_partial_19_0022 : Poly :=
[
  term ((-360 : Rat) / 299) [(0, 1), (2, 1), (8, 1), (14, 1), (16, 1)],
  term ((180 : Rat) / 299) [(0, 2), (2, 1), (14, 1), (16, 1)],
  term ((-360 : Rat) / 299) [(1, 1), (2, 1), (9, 1), (14, 1), (16, 1)],
  term ((180 : Rat) / 299) [(1, 2), (2, 1), (14, 1), (16, 1)],
  term ((360 : Rat) / 299) [(2, 1), (3, 1), (9, 1), (14, 1), (16, 1)],
  term ((-180 : Rat) / 299) [(2, 1), (3, 2), (14, 1), (16, 1)],
  term ((360 : Rat) / 299) [(2, 2), (8, 1), (14, 1), (16, 1)],
  term ((-180 : Rat) / 299) [(2, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 19. -/
theorem rs_R003_ueqv_R003NY_partial_19_0022_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_19_0022
        rs_R003_ueqv_R003NY_generator_19_0000_0034 =
      rs_R003_ueqv_R003NY_partial_19_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003NY_coefficient_19_0023 : Poly :=
[
  term ((-2160 : Rat) / 299) [(2, 1), (15, 2), (16, 1)]
]

/-- Partial product 23 for generator 19. -/
def rs_R003_ueqv_R003NY_partial_19_0023 : Poly :=
[
  term ((4320 : Rat) / 299) [(0, 1), (2, 1), (8, 1), (15, 2), (16, 1)],
  term ((-2160 : Rat) / 299) [(0, 2), (2, 1), (15, 2), (16, 1)],
  term ((4320 : Rat) / 299) [(1, 1), (2, 1), (9, 1), (15, 2), (16, 1)],
  term ((-2160 : Rat) / 299) [(1, 2), (2, 1), (15, 2), (16, 1)],
  term ((-4320 : Rat) / 299) [(2, 1), (3, 1), (9, 1), (15, 2), (16, 1)],
  term ((2160 : Rat) / 299) [(2, 1), (3, 2), (15, 2), (16, 1)],
  term ((-4320 : Rat) / 299) [(2, 2), (8, 1), (15, 2), (16, 1)],
  term ((2160 : Rat) / 299) [(2, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 19. -/
theorem rs_R003_ueqv_R003NY_partial_19_0023_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_19_0023
        rs_R003_ueqv_R003NY_generator_19_0000_0034 =
      rs_R003_ueqv_R003NY_partial_19_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003NY_coefficient_19_0024 : Poly :=
[
  term ((-90 : Rat) / 299) [(2, 1), (16, 1)]
]

/-- Partial product 24 for generator 19. -/
def rs_R003_ueqv_R003NY_partial_19_0024 : Poly :=
[
  term ((180 : Rat) / 299) [(0, 1), (2, 1), (8, 1), (16, 1)],
  term ((-90 : Rat) / 299) [(0, 2), (2, 1), (16, 1)],
  term ((180 : Rat) / 299) [(1, 1), (2, 1), (9, 1), (16, 1)],
  term ((-90 : Rat) / 299) [(1, 2), (2, 1), (16, 1)],
  term ((-180 : Rat) / 299) [(2, 1), (3, 1), (9, 1), (16, 1)],
  term ((90 : Rat) / 299) [(2, 1), (3, 2), (16, 1)],
  term ((-180 : Rat) / 299) [(2, 2), (8, 1), (16, 1)],
  term ((90 : Rat) / 299) [(2, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 19. -/
theorem rs_R003_ueqv_R003NY_partial_19_0024_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_19_0024
        rs_R003_ueqv_R003NY_generator_19_0000_0034 =
      rs_R003_ueqv_R003NY_partial_19_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003NY_coefficient_19_0025 : Poly :=
[
  term ((72 : Rat) / 13) [(3, 1), (9, 1), (16, 1)]
]

/-- Partial product 25 for generator 19. -/
def rs_R003_ueqv_R003NY_partial_19_0025 : Poly :=
[
  term ((-144 : Rat) / 13) [(0, 1), (3, 1), (8, 1), (9, 1), (16, 1)],
  term ((72 : Rat) / 13) [(0, 2), (3, 1), (9, 1), (16, 1)],
  term ((-144 : Rat) / 13) [(1, 1), (3, 1), (9, 2), (16, 1)],
  term ((72 : Rat) / 13) [(1, 2), (3, 1), (9, 1), (16, 1)],
  term ((144 : Rat) / 13) [(2, 1), (3, 1), (8, 1), (9, 1), (16, 1)],
  term ((-72 : Rat) / 13) [(2, 2), (3, 1), (9, 1), (16, 1)],
  term ((144 : Rat) / 13) [(3, 2), (9, 2), (16, 1)],
  term ((-72 : Rat) / 13) [(3, 3), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 19. -/
theorem rs_R003_ueqv_R003NY_partial_19_0025_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_19_0025
        rs_R003_ueqv_R003NY_generator_19_0000_0034 =
      rs_R003_ueqv_R003NY_partial_19_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003NY_coefficient_19_0026 : Poly :=
[
  term ((-244 : Rat) / 299) [(9, 1), (11, 1), (16, 1)]
]

/-- Partial product 26 for generator 19. -/
def rs_R003_ueqv_R003NY_partial_19_0026 : Poly :=
[
  term ((488 : Rat) / 299) [(0, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-244 : Rat) / 299) [(0, 2), (9, 1), (11, 1), (16, 1)],
  term ((488 : Rat) / 299) [(1, 1), (9, 2), (11, 1), (16, 1)],
  term ((-244 : Rat) / 299) [(1, 2), (9, 1), (11, 1), (16, 1)],
  term ((-488 : Rat) / 299) [(2, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((244 : Rat) / 299) [(2, 2), (9, 1), (11, 1), (16, 1)],
  term ((-488 : Rat) / 299) [(3, 1), (9, 2), (11, 1), (16, 1)],
  term ((244 : Rat) / 299) [(3, 2), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 19. -/
theorem rs_R003_ueqv_R003NY_partial_19_0026_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_19_0026
        rs_R003_ueqv_R003NY_generator_19_0000_0034 =
      rs_R003_ueqv_R003NY_partial_19_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003NY_coefficient_19_0027 : Poly :=
[
  term ((-96 : Rat) / 13) [(9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 27 for generator 19. -/
def rs_R003_ueqv_R003NY_partial_19_0027 : Poly :=
[
  term ((192 : Rat) / 13) [(0, 1), (8, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-96 : Rat) / 13) [(0, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((192 : Rat) / 13) [(1, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((-96 : Rat) / 13) [(1, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-192 : Rat) / 13) [(2, 1), (8, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((96 : Rat) / 13) [(2, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-192 : Rat) / 13) [(3, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((96 : Rat) / 13) [(3, 2), (9, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 19. -/
theorem rs_R003_ueqv_R003NY_partial_19_0027_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_19_0027
        rs_R003_ueqv_R003NY_generator_19_0000_0034 =
      rs_R003_ueqv_R003NY_partial_19_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003NY_coefficient_19_0028 : Poly :=
[
  term ((24 : Rat) / 13) [(9, 1), (13, 1), (16, 1)]
]

/-- Partial product 28 for generator 19. -/
def rs_R003_ueqv_R003NY_partial_19_0028 : Poly :=
[
  term ((-48 : Rat) / 13) [(0, 1), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((24 : Rat) / 13) [(0, 2), (9, 1), (13, 1), (16, 1)],
  term ((-48 : Rat) / 13) [(1, 1), (9, 2), (13, 1), (16, 1)],
  term ((24 : Rat) / 13) [(1, 2), (9, 1), (13, 1), (16, 1)],
  term ((48 : Rat) / 13) [(2, 1), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((-24 : Rat) / 13) [(2, 2), (9, 1), (13, 1), (16, 1)],
  term ((48 : Rat) / 13) [(3, 1), (9, 2), (13, 1), (16, 1)],
  term ((-24 : Rat) / 13) [(3, 2), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 19. -/
theorem rs_R003_ueqv_R003NY_partial_19_0028_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_19_0028
        rs_R003_ueqv_R003NY_generator_19_0000_0034 =
      rs_R003_ueqv_R003NY_partial_19_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003NY_coefficient_19_0029 : Poly :=
[
  term ((60 : Rat) / 13) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 29 for generator 19. -/
def rs_R003_ueqv_R003NY_partial_19_0029 : Poly :=
[
  term ((-120 : Rat) / 13) [(0, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((60 : Rat) / 13) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((-120 : Rat) / 13) [(1, 1), (9, 2), (15, 1), (16, 1)],
  term ((60 : Rat) / 13) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term ((120 : Rat) / 13) [(2, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-60 : Rat) / 13) [(2, 2), (9, 1), (15, 1), (16, 1)],
  term ((120 : Rat) / 13) [(3, 1), (9, 2), (15, 1), (16, 1)],
  term ((-60 : Rat) / 13) [(3, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 19. -/
theorem rs_R003_ueqv_R003NY_partial_19_0029_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_19_0029
        rs_R003_ueqv_R003NY_generator_19_0000_0034 =
      rs_R003_ueqv_R003NY_partial_19_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003NY_coefficient_19_0030 : Poly :=
[
  term ((-48 : Rat) / 13) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 30 for generator 19. -/
def rs_R003_ueqv_R003NY_partial_19_0030 : Poly :=
[
  term ((96 : Rat) / 13) [(0, 1), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((-48 : Rat) / 13) [(0, 2), (11, 1), (13, 1), (16, 1)],
  term ((96 : Rat) / 13) [(1, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-48 : Rat) / 13) [(1, 2), (11, 1), (13, 1), (16, 1)],
  term ((-96 : Rat) / 13) [(2, 1), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((48 : Rat) / 13) [(2, 2), (11, 1), (13, 1), (16, 1)],
  term ((-96 : Rat) / 13) [(3, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((48 : Rat) / 13) [(3, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 19. -/
theorem rs_R003_ueqv_R003NY_partial_19_0030_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_19_0030
        rs_R003_ueqv_R003NY_generator_19_0000_0034 =
      rs_R003_ueqv_R003NY_partial_19_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003NY_coefficient_19_0031 : Poly :=
[
  term ((-476 : Rat) / 299) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 31 for generator 19. -/
def rs_R003_ueqv_R003NY_partial_19_0031 : Poly :=
[
  term ((952 : Rat) / 299) [(0, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-476 : Rat) / 299) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((952 : Rat) / 299) [(1, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-476 : Rat) / 299) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((-952 : Rat) / 299) [(2, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((476 : Rat) / 299) [(2, 2), (11, 1), (15, 1), (16, 1)],
  term ((-952 : Rat) / 299) [(3, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((476 : Rat) / 299) [(3, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 19. -/
theorem rs_R003_ueqv_R003NY_partial_19_0031_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_19_0031
        rs_R003_ueqv_R003NY_generator_19_0000_0034 =
      rs_R003_ueqv_R003NY_partial_19_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003NY_coefficient_19_0032 : Poly :=
[
  term ((-24 : Rat) / 13) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 32 for generator 19. -/
def rs_R003_ueqv_R003NY_partial_19_0032 : Poly :=
[
  term ((48 : Rat) / 13) [(0, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-24 : Rat) / 13) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((48 : Rat) / 13) [(1, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-24 : Rat) / 13) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((-48 : Rat) / 13) [(2, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((24 : Rat) / 13) [(2, 2), (13, 1), (15, 1), (16, 1)],
  term ((-48 : Rat) / 13) [(3, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((24 : Rat) / 13) [(3, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 19. -/
theorem rs_R003_ueqv_R003NY_partial_19_0032_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_19_0032
        rs_R003_ueqv_R003NY_generator_19_0000_0034 =
      rs_R003_ueqv_R003NY_partial_19_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003NY_coefficient_19_0033 : Poly :=
[
  term ((14 : Rat) / 13) [(14, 1), (16, 1)]
]

/-- Partial product 33 for generator 19. -/
def rs_R003_ueqv_R003NY_partial_19_0033 : Poly :=
[
  term ((-28 : Rat) / 13) [(0, 1), (8, 1), (14, 1), (16, 1)],
  term ((14 : Rat) / 13) [(0, 2), (14, 1), (16, 1)],
  term ((-28 : Rat) / 13) [(1, 1), (9, 1), (14, 1), (16, 1)],
  term ((14 : Rat) / 13) [(1, 2), (14, 1), (16, 1)],
  term ((28 : Rat) / 13) [(2, 1), (8, 1), (14, 1), (16, 1)],
  term ((-14 : Rat) / 13) [(2, 2), (14, 1), (16, 1)],
  term ((28 : Rat) / 13) [(3, 1), (9, 1), (14, 1), (16, 1)],
  term ((-14 : Rat) / 13) [(3, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 19. -/
theorem rs_R003_ueqv_R003NY_partial_19_0033_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_19_0033
        rs_R003_ueqv_R003NY_generator_19_0000_0034 =
      rs_R003_ueqv_R003NY_partial_19_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003NY_coefficient_19_0034 : Poly :=
[
  term ((-7 : Rat) / 13) [(16, 1)]
]

/-- Partial product 34 for generator 19. -/
def rs_R003_ueqv_R003NY_partial_19_0034 : Poly :=
[
  term ((14 : Rat) / 13) [(0, 1), (8, 1), (16, 1)],
  term ((-7 : Rat) / 13) [(0, 2), (16, 1)],
  term ((14 : Rat) / 13) [(1, 1), (9, 1), (16, 1)],
  term ((-7 : Rat) / 13) [(1, 2), (16, 1)],
  term ((-14 : Rat) / 13) [(2, 1), (8, 1), (16, 1)],
  term ((7 : Rat) / 13) [(2, 2), (16, 1)],
  term ((-14 : Rat) / 13) [(3, 1), (9, 1), (16, 1)],
  term ((7 : Rat) / 13) [(3, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 19. -/
theorem rs_R003_ueqv_R003NY_partial_19_0034_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_19_0034
        rs_R003_ueqv_R003NY_generator_19_0000_0034 =
      rs_R003_ueqv_R003NY_partial_19_0034 := by
  native_decide

/-- Partial products in this block. -/
def rs_R003_ueqv_R003NY_partials_19_0000_0034 : List Poly :=
[
  rs_R003_ueqv_R003NY_partial_19_0000,
  rs_R003_ueqv_R003NY_partial_19_0001,
  rs_R003_ueqv_R003NY_partial_19_0002,
  rs_R003_ueqv_R003NY_partial_19_0003,
  rs_R003_ueqv_R003NY_partial_19_0004,
  rs_R003_ueqv_R003NY_partial_19_0005,
  rs_R003_ueqv_R003NY_partial_19_0006,
  rs_R003_ueqv_R003NY_partial_19_0007,
  rs_R003_ueqv_R003NY_partial_19_0008,
  rs_R003_ueqv_R003NY_partial_19_0009,
  rs_R003_ueqv_R003NY_partial_19_0010,
  rs_R003_ueqv_R003NY_partial_19_0011,
  rs_R003_ueqv_R003NY_partial_19_0012,
  rs_R003_ueqv_R003NY_partial_19_0013,
  rs_R003_ueqv_R003NY_partial_19_0014,
  rs_R003_ueqv_R003NY_partial_19_0015,
  rs_R003_ueqv_R003NY_partial_19_0016,
  rs_R003_ueqv_R003NY_partial_19_0017,
  rs_R003_ueqv_R003NY_partial_19_0018,
  rs_R003_ueqv_R003NY_partial_19_0019,
  rs_R003_ueqv_R003NY_partial_19_0020,
  rs_R003_ueqv_R003NY_partial_19_0021,
  rs_R003_ueqv_R003NY_partial_19_0022,
  rs_R003_ueqv_R003NY_partial_19_0023,
  rs_R003_ueqv_R003NY_partial_19_0024,
  rs_R003_ueqv_R003NY_partial_19_0025,
  rs_R003_ueqv_R003NY_partial_19_0026,
  rs_R003_ueqv_R003NY_partial_19_0027,
  rs_R003_ueqv_R003NY_partial_19_0028,
  rs_R003_ueqv_R003NY_partial_19_0029,
  rs_R003_ueqv_R003NY_partial_19_0030,
  rs_R003_ueqv_R003NY_partial_19_0031,
  rs_R003_ueqv_R003NY_partial_19_0032,
  rs_R003_ueqv_R003NY_partial_19_0033,
  rs_R003_ueqv_R003NY_partial_19_0034
]

/-- Sum of partial products in this block. -/
def rs_R003_ueqv_R003NY_block_19_0000_0034 : Poly :=
[
  term ((7200 : Rat) / 299) [(0, 1), (1, 1), (2, 1), (8, 1), (15, 1), (16, 1)],
  term ((-1800 : Rat) / 299) [(0, 1), (1, 1), (2, 2), (15, 1), (16, 1)],
  term ((3600 : Rat) / 299) [(0, 1), (1, 1), (3, 1), (9, 1), (15, 1), (16, 1)],
  term ((-1800 : Rat) / 299) [(0, 1), (1, 1), (3, 2), (15, 1), (16, 1)],
  term ((-48 : Rat) / 13) [(0, 1), (1, 1), (8, 1), (15, 1), (16, 1)],
  term ((7200 : Rat) / 299) [(0, 1), (1, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((480 : Rat) / 299) [(0, 1), (1, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((3600 : Rat) / 299) [(0, 1), (1, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((360 : Rat) / 299) [(0, 1), (1, 1), (9, 1), (14, 1), (16, 1)],
  term ((-4320 : Rat) / 299) [(0, 1), (1, 1), (9, 1), (15, 2), (16, 1)],
  term ((-180 : Rat) / 299) [(0, 1), (1, 1), (9, 1), (16, 1)],
  term ((-1200 : Rat) / 299) [(0, 1), (1, 1), (9, 2), (11, 1), (16, 1)],
  term ((14400 : Rat) / 299) [(0, 1), (1, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((-3600 : Rat) / 299) [(0, 1), (1, 1), (9, 2), (13, 1), (16, 1)],
  term ((8640 : Rat) / 299) [(0, 1), (1, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((-8640 : Rat) / 299) [(0, 1), (1, 1), (9, 2), (15, 1), (16, 1)],
  term ((600 : Rat) / 299) [(0, 1), (1, 2), (9, 1), (11, 1), (16, 1)],
  term ((-7200 : Rat) / 299) [(0, 1), (1, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((1800 : Rat) / 299) [(0, 1), (1, 2), (9, 1), (13, 1), (16, 1)],
  term ((-4320 : Rat) / 299) [(0, 1), (1, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((720 : Rat) / 299) [(0, 1), (1, 2), (9, 1), (15, 1), (16, 1)],
  term ((-3600 : Rat) / 299) [(0, 1), (1, 2), (11, 1), (13, 1), (16, 1)],
  term ((-240 : Rat) / 299) [(0, 1), (1, 2), (11, 1), (15, 1), (16, 1)],
  term ((-1800 : Rat) / 299) [(0, 1), (1, 2), (13, 1), (15, 1), (16, 1)],
  term ((-180 : Rat) / 299) [(0, 1), (1, 2), (14, 1), (16, 1)],
  term ((2160 : Rat) / 299) [(0, 1), (1, 2), (15, 2), (16, 1)],
  term ((90 : Rat) / 299) [(0, 1), (1, 2), (16, 1)],
  term ((1800 : Rat) / 299) [(0, 1), (1, 3), (15, 1), (16, 1)],
  term ((2400 : Rat) / 299) [(0, 1), (2, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-28800 : Rat) / 299) [(0, 1), (2, 1), (8, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((7200 : Rat) / 299) [(0, 1), (2, 1), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((-17280 : Rat) / 299) [(0, 1), (2, 1), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((17280 : Rat) / 299) [(0, 1), (2, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-14400 : Rat) / 299) [(0, 1), (2, 1), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((-960 : Rat) / 299) [(0, 1), (2, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-7200 : Rat) / 299) [(0, 1), (2, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-720 : Rat) / 299) [(0, 1), (2, 1), (8, 1), (14, 1), (16, 1)],
  term ((8640 : Rat) / 299) [(0, 1), (2, 1), (8, 1), (15, 2), (16, 1)],
  term ((360 : Rat) / 299) [(0, 1), (2, 1), (8, 1), (16, 1)],
  term ((-600 : Rat) / 299) [(0, 1), (2, 2), (9, 1), (11, 1), (16, 1)],
  term ((7200 : Rat) / 299) [(0, 1), (2, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1800 : Rat) / 299) [(0, 1), (2, 2), (9, 1), (13, 1), (16, 1)],
  term ((4320 : Rat) / 299) [(0, 1), (2, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4320 : Rat) / 299) [(0, 1), (2, 2), (9, 1), (15, 1), (16, 1)],
  term ((3600 : Rat) / 299) [(0, 1), (2, 2), (11, 1), (13, 1), (16, 1)],
  term ((240 : Rat) / 299) [(0, 1), (2, 2), (11, 1), (15, 1), (16, 1)],
  term ((1800 : Rat) / 299) [(0, 1), (2, 2), (13, 1), (15, 1), (16, 1)],
  term ((180 : Rat) / 299) [(0, 1), (2, 2), (14, 1), (16, 1)],
  term ((-2160 : Rat) / 299) [(0, 1), (2, 2), (15, 2), (16, 1)],
  term ((-90 : Rat) / 299) [(0, 1), (2, 2), (16, 1)],
  term ((-144 : Rat) / 13) [(0, 1), (3, 1), (8, 1), (9, 1), (16, 1)],
  term ((-7200 : Rat) / 299) [(0, 1), (3, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-480 : Rat) / 299) [(0, 1), (3, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3600 : Rat) / 299) [(0, 1), (3, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-360 : Rat) / 299) [(0, 1), (3, 1), (9, 1), (14, 1), (16, 1)],
  term ((4320 : Rat) / 299) [(0, 1), (3, 1), (9, 1), (15, 2), (16, 1)],
  term ((180 : Rat) / 299) [(0, 1), (3, 1), (9, 1), (16, 1)],
  term ((1200 : Rat) / 299) [(0, 1), (3, 1), (9, 2), (11, 1), (16, 1)],
  term ((-14400 : Rat) / 299) [(0, 1), (3, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((3600 : Rat) / 299) [(0, 1), (3, 1), (9, 2), (13, 1), (16, 1)],
  term ((-8640 : Rat) / 299) [(0, 1), (3, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((8640 : Rat) / 299) [(0, 1), (3, 1), (9, 2), (15, 1), (16, 1)],
  term ((-600 : Rat) / 299) [(0, 1), (3, 2), (9, 1), (11, 1), (16, 1)],
  term ((7200 : Rat) / 299) [(0, 1), (3, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1800 : Rat) / 299) [(0, 1), (3, 2), (9, 1), (13, 1), (16, 1)],
  term ((4320 : Rat) / 299) [(0, 1), (3, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4320 : Rat) / 299) [(0, 1), (3, 2), (9, 1), (15, 1), (16, 1)],
  term ((3600 : Rat) / 299) [(0, 1), (3, 2), (11, 1), (13, 1), (16, 1)],
  term ((240 : Rat) / 299) [(0, 1), (3, 2), (11, 1), (15, 1), (16, 1)],
  term ((1800 : Rat) / 299) [(0, 1), (3, 2), (13, 1), (15, 1), (16, 1)],
  term ((180 : Rat) / 299) [(0, 1), (3, 2), (14, 1), (16, 1)],
  term ((-2160 : Rat) / 299) [(0, 1), (3, 2), (15, 2), (16, 1)],
  term ((-90 : Rat) / 299) [(0, 1), (3, 2), (16, 1)],
  term ((488 : Rat) / 299) [(0, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((192 : Rat) / 13) [(0, 1), (8, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-48 : Rat) / 13) [(0, 1), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((-120 : Rat) / 13) [(0, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((96 : Rat) / 13) [(0, 1), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((952 : Rat) / 299) [(0, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((48 : Rat) / 13) [(0, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-28 : Rat) / 13) [(0, 1), (8, 1), (14, 1), (16, 1)],
  term ((14 : Rat) / 13) [(0, 1), (8, 1), (16, 1)],
  term ((-1800 : Rat) / 299) [(0, 2), (1, 1), (2, 1), (15, 1), (16, 1)],
  term ((-3600 : Rat) / 299) [(0, 2), (1, 1), (8, 1), (15, 1), (16, 1)],
  term ((24 : Rat) / 13) [(0, 2), (1, 1), (15, 1), (16, 1)],
  term ((-600 : Rat) / 299) [(0, 2), (2, 1), (9, 1), (11, 1), (16, 1)],
  term ((7200 : Rat) / 299) [(0, 2), (2, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1800 : Rat) / 299) [(0, 2), (2, 1), (9, 1), (13, 1), (16, 1)],
  term ((4320 : Rat) / 299) [(0, 2), (2, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4320 : Rat) / 299) [(0, 2), (2, 1), (9, 1), (15, 1), (16, 1)],
  term ((3600 : Rat) / 299) [(0, 2), (2, 1), (11, 1), (13, 1), (16, 1)],
  term ((240 : Rat) / 299) [(0, 2), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((1800 : Rat) / 299) [(0, 2), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((180 : Rat) / 299) [(0, 2), (2, 1), (14, 1), (16, 1)],
  term ((-2160 : Rat) / 299) [(0, 2), (2, 1), (15, 2), (16, 1)],
  term ((-90 : Rat) / 299) [(0, 2), (2, 1), (16, 1)],
  term ((72 : Rat) / 13) [(0, 2), (3, 1), (9, 1), (16, 1)],
  term ((-1200 : Rat) / 299) [(0, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((14400 : Rat) / 299) [(0, 2), (8, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3600 : Rat) / 299) [(0, 2), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((8640 : Rat) / 299) [(0, 2), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-8640 : Rat) / 299) [(0, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((7200 : Rat) / 299) [(0, 2), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((480 : Rat) / 299) [(0, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((3600 : Rat) / 299) [(0, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((360 : Rat) / 299) [(0, 2), (8, 1), (14, 1), (16, 1)],
  term ((-4320 : Rat) / 299) [(0, 2), (8, 1), (15, 2), (16, 1)],
  term ((-180 : Rat) / 299) [(0, 2), (8, 1), (16, 1)],
  term ((-244 : Rat) / 299) [(0, 2), (9, 1), (11, 1), (16, 1)],
  term ((-96 : Rat) / 13) [(0, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((24 : Rat) / 13) [(0, 2), (9, 1), (13, 1), (16, 1)],
  term ((60 : Rat) / 13) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((-48 : Rat) / 13) [(0, 2), (11, 1), (13, 1), (16, 1)],
  term ((-476 : Rat) / 299) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((-24 : Rat) / 13) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((14 : Rat) / 13) [(0, 2), (14, 1), (16, 1)],
  term ((-7 : Rat) / 13) [(0, 2), (16, 1)],
  term ((1800 : Rat) / 299) [(0, 3), (1, 1), (15, 1), (16, 1)],
  term ((600 : Rat) / 299) [(0, 3), (9, 1), (11, 1), (16, 1)],
  term ((-7200 : Rat) / 299) [(0, 3), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((1800 : Rat) / 299) [(0, 3), (9, 1), (13, 1), (16, 1)],
  term ((-4320 : Rat) / 299) [(0, 3), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((4320 : Rat) / 299) [(0, 3), (9, 1), (15, 1), (16, 1)],
  term ((-3600 : Rat) / 299) [(0, 3), (11, 1), (13, 1), (16, 1)],
  term ((-240 : Rat) / 299) [(0, 3), (11, 1), (15, 1), (16, 1)],
  term ((-1800 : Rat) / 299) [(0, 3), (13, 1), (15, 1), (16, 1)],
  term ((-180 : Rat) / 299) [(0, 3), (14, 1), (16, 1)],
  term ((2160 : Rat) / 299) [(0, 3), (15, 2), (16, 1)],
  term ((90 : Rat) / 299) [(0, 3), (16, 1)],
  term ((-3600 : Rat) / 299) [(1, 1), (2, 1), (3, 1), (9, 1), (15, 1), (16, 1)],
  term ((1800 : Rat) / 299) [(1, 1), (2, 1), (3, 2), (15, 1), (16, 1)],
  term ((48 : Rat) / 13) [(1, 1), (2, 1), (8, 1), (15, 1), (16, 1)],
  term ((-7200 : Rat) / 299) [(1, 1), (2, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-480 : Rat) / 299) [(1, 1), (2, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3600 : Rat) / 299) [(1, 1), (2, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-360 : Rat) / 299) [(1, 1), (2, 1), (9, 1), (14, 1), (16, 1)],
  term ((4320 : Rat) / 299) [(1, 1), (2, 1), (9, 1), (15, 2), (16, 1)],
  term ((180 : Rat) / 299) [(1, 1), (2, 1), (9, 1), (16, 1)],
  term ((1200 : Rat) / 299) [(1, 1), (2, 1), (9, 2), (11, 1), (16, 1)],
  term ((-14400 : Rat) / 299) [(1, 1), (2, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((3600 : Rat) / 299) [(1, 1), (2, 1), (9, 2), (13, 1), (16, 1)],
  term ((-8640 : Rat) / 299) [(1, 1), (2, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((8640 : Rat) / 299) [(1, 1), (2, 1), (9, 2), (15, 1), (16, 1)],
  term ((-3600 : Rat) / 299) [(1, 1), (2, 2), (8, 1), (15, 1), (16, 1)],
  term ((-24 : Rat) / 13) [(1, 1), (2, 2), (15, 1), (16, 1)],
  term ((1800 : Rat) / 299) [(1, 1), (2, 3), (15, 1), (16, 1)],
  term ((48 : Rat) / 13) [(1, 1), (3, 1), (9, 1), (15, 1), (16, 1)],
  term ((-144 : Rat) / 13) [(1, 1), (3, 1), (9, 2), (16, 1)],
  term ((-24 : Rat) / 13) [(1, 1), (3, 2), (15, 1), (16, 1)],
  term ((96 : Rat) / 13) [(1, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((952 : Rat) / 299) [(1, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((48 : Rat) / 13) [(1, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-28 : Rat) / 13) [(1, 1), (9, 1), (14, 1), (16, 1)],
  term ((14 : Rat) / 13) [(1, 1), (9, 1), (16, 1)],
  term ((488 : Rat) / 299) [(1, 1), (9, 2), (11, 1), (16, 1)],
  term ((192 : Rat) / 13) [(1, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((-48 : Rat) / 13) [(1, 1), (9, 2), (13, 1), (16, 1)],
  term ((-120 : Rat) / 13) [(1, 1), (9, 2), (15, 1), (16, 1)],
  term ((-600 : Rat) / 299) [(1, 2), (2, 1), (9, 1), (11, 1), (16, 1)],
  term ((7200 : Rat) / 299) [(1, 2), (2, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1800 : Rat) / 299) [(1, 2), (2, 1), (9, 1), (13, 1), (16, 1)],
  term ((4320 : Rat) / 299) [(1, 2), (2, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-720 : Rat) / 299) [(1, 2), (2, 1), (9, 1), (15, 1), (16, 1)],
  term ((3600 : Rat) / 299) [(1, 2), (2, 1), (11, 1), (13, 1), (16, 1)],
  term ((240 : Rat) / 299) [(1, 2), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((1800 : Rat) / 299) [(1, 2), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((180 : Rat) / 299) [(1, 2), (2, 1), (14, 1), (16, 1)],
  term ((-2160 : Rat) / 299) [(1, 2), (2, 1), (15, 2), (16, 1)],
  term ((-90 : Rat) / 299) [(1, 2), (2, 1), (16, 1)],
  term ((72 : Rat) / 13) [(1, 2), (3, 1), (9, 1), (16, 1)],
  term ((-244 : Rat) / 299) [(1, 2), (9, 1), (11, 1), (16, 1)],
  term ((-96 : Rat) / 13) [(1, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((24 : Rat) / 13) [(1, 2), (9, 1), (13, 1), (16, 1)],
  term ((12 : Rat) / 13) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term ((-48 : Rat) / 13) [(1, 2), (11, 1), (13, 1), (16, 1)],
  term ((-476 : Rat) / 299) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((-24 : Rat) / 13) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((14 : Rat) / 13) [(1, 2), (14, 1), (16, 1)],
  term ((-7 : Rat) / 13) [(1, 2), (16, 1)],
  term ((-1800 : Rat) / 299) [(1, 3), (2, 1), (15, 1), (16, 1)],
  term ((24 : Rat) / 13) [(1, 3), (15, 1), (16, 1)],
  term ((144 : Rat) / 13) [(2, 1), (3, 1), (8, 1), (9, 1), (16, 1)],
  term ((7200 : Rat) / 299) [(2, 1), (3, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((480 : Rat) / 299) [(2, 1), (3, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((3600 : Rat) / 299) [(2, 1), (3, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((360 : Rat) / 299) [(2, 1), (3, 1), (9, 1), (14, 1), (16, 1)],
  term ((-4320 : Rat) / 299) [(2, 1), (3, 1), (9, 1), (15, 2), (16, 1)],
  term ((-180 : Rat) / 299) [(2, 1), (3, 1), (9, 1), (16, 1)],
  term ((-1200 : Rat) / 299) [(2, 1), (3, 1), (9, 2), (11, 1), (16, 1)],
  term ((14400 : Rat) / 299) [(2, 1), (3, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((-3600 : Rat) / 299) [(2, 1), (3, 1), (9, 2), (13, 1), (16, 1)],
  term ((8640 : Rat) / 299) [(2, 1), (3, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((-8640 : Rat) / 299) [(2, 1), (3, 1), (9, 2), (15, 1), (16, 1)],
  term ((600 : Rat) / 299) [(2, 1), (3, 2), (9, 1), (11, 1), (16, 1)],
  term ((-7200 : Rat) / 299) [(2, 1), (3, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((1800 : Rat) / 299) [(2, 1), (3, 2), (9, 1), (13, 1), (16, 1)],
  term ((-4320 : Rat) / 299) [(2, 1), (3, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((4320 : Rat) / 299) [(2, 1), (3, 2), (9, 1), (15, 1), (16, 1)],
  term ((-3600 : Rat) / 299) [(2, 1), (3, 2), (11, 1), (13, 1), (16, 1)],
  term ((-240 : Rat) / 299) [(2, 1), (3, 2), (11, 1), (15, 1), (16, 1)],
  term ((-1800 : Rat) / 299) [(2, 1), (3, 2), (13, 1), (15, 1), (16, 1)],
  term ((-180 : Rat) / 299) [(2, 1), (3, 2), (14, 1), (16, 1)],
  term ((2160 : Rat) / 299) [(2, 1), (3, 2), (15, 2), (16, 1)],
  term ((90 : Rat) / 299) [(2, 1), (3, 2), (16, 1)],
  term ((-488 : Rat) / 299) [(2, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-192 : Rat) / 13) [(2, 1), (8, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((48 : Rat) / 13) [(2, 1), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((120 : Rat) / 13) [(2, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-96 : Rat) / 13) [(2, 1), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((-952 : Rat) / 299) [(2, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-48 : Rat) / 13) [(2, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((28 : Rat) / 13) [(2, 1), (8, 1), (14, 1), (16, 1)],
  term ((-14 : Rat) / 13) [(2, 1), (8, 1), (16, 1)],
  term ((-72 : Rat) / 13) [(2, 2), (3, 1), (9, 1), (16, 1)],
  term ((-1200 : Rat) / 299) [(2, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((14400 : Rat) / 299) [(2, 2), (8, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3600 : Rat) / 299) [(2, 2), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((8640 : Rat) / 299) [(2, 2), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-8640 : Rat) / 299) [(2, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((7200 : Rat) / 299) [(2, 2), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((480 : Rat) / 299) [(2, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((3600 : Rat) / 299) [(2, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((360 : Rat) / 299) [(2, 2), (8, 1), (14, 1), (16, 1)],
  term ((-4320 : Rat) / 299) [(2, 2), (8, 1), (15, 2), (16, 1)],
  term ((-180 : Rat) / 299) [(2, 2), (8, 1), (16, 1)],
  term ((244 : Rat) / 299) [(2, 2), (9, 1), (11, 1), (16, 1)],
  term ((96 : Rat) / 13) [(2, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-24 : Rat) / 13) [(2, 2), (9, 1), (13, 1), (16, 1)],
  term ((-60 : Rat) / 13) [(2, 2), (9, 1), (15, 1), (16, 1)],
  term ((48 : Rat) / 13) [(2, 2), (11, 1), (13, 1), (16, 1)],
  term ((476 : Rat) / 299) [(2, 2), (11, 1), (15, 1), (16, 1)],
  term ((24 : Rat) / 13) [(2, 2), (13, 1), (15, 1), (16, 1)],
  term ((-14 : Rat) / 13) [(2, 2), (14, 1), (16, 1)],
  term ((7 : Rat) / 13) [(2, 2), (16, 1)],
  term ((600 : Rat) / 299) [(2, 3), (9, 1), (11, 1), (16, 1)],
  term ((-7200 : Rat) / 299) [(2, 3), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((1800 : Rat) / 299) [(2, 3), (9, 1), (13, 1), (16, 1)],
  term ((-4320 : Rat) / 299) [(2, 3), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((4320 : Rat) / 299) [(2, 3), (9, 1), (15, 1), (16, 1)],
  term ((-3600 : Rat) / 299) [(2, 3), (11, 1), (13, 1), (16, 1)],
  term ((-240 : Rat) / 299) [(2, 3), (11, 1), (15, 1), (16, 1)],
  term ((-1800 : Rat) / 299) [(2, 3), (13, 1), (15, 1), (16, 1)],
  term ((-180 : Rat) / 299) [(2, 3), (14, 1), (16, 1)],
  term ((2160 : Rat) / 299) [(2, 3), (15, 2), (16, 1)],
  term ((90 : Rat) / 299) [(2, 3), (16, 1)],
  term ((-96 : Rat) / 13) [(3, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-952 : Rat) / 299) [(3, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-48 : Rat) / 13) [(3, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((28 : Rat) / 13) [(3, 1), (9, 1), (14, 1), (16, 1)],
  term ((-14 : Rat) / 13) [(3, 1), (9, 1), (16, 1)],
  term ((-488 : Rat) / 299) [(3, 1), (9, 2), (11, 1), (16, 1)],
  term ((-192 : Rat) / 13) [(3, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((48 : Rat) / 13) [(3, 1), (9, 2), (13, 1), (16, 1)],
  term ((120 : Rat) / 13) [(3, 1), (9, 2), (15, 1), (16, 1)],
  term ((244 : Rat) / 299) [(3, 2), (9, 1), (11, 1), (16, 1)],
  term ((96 : Rat) / 13) [(3, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-24 : Rat) / 13) [(3, 2), (9, 1), (13, 1), (16, 1)],
  term ((-60 : Rat) / 13) [(3, 2), (9, 1), (15, 1), (16, 1)],
  term ((144 : Rat) / 13) [(3, 2), (9, 2), (16, 1)],
  term ((48 : Rat) / 13) [(3, 2), (11, 1), (13, 1), (16, 1)],
  term ((476 : Rat) / 299) [(3, 2), (11, 1), (15, 1), (16, 1)],
  term ((24 : Rat) / 13) [(3, 2), (13, 1), (15, 1), (16, 1)],
  term ((-14 : Rat) / 13) [(3, 2), (14, 1), (16, 1)],
  term ((7 : Rat) / 13) [(3, 2), (16, 1)],
  term ((-72 : Rat) / 13) [(3, 3), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 19, terms 0 through 34. -/
theorem rs_R003_ueqv_R003NY_block_19_0000_0034_valid :
    checkProductSumEq rs_R003_ueqv_R003NY_partials_19_0000_0034
      rs_R003_ueqv_R003NY_block_19_0000_0034 = true := by
  native_decide

end R003UeqvR003NYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
