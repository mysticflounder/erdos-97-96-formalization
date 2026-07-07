/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R011:u=v:R011YYY, term block 24:0-25

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R011UeqvR011YYYTermShards

/-- Generator polynomial 24 for relaxed split surplus certificate `R011:u=v:R011YYY`. -/
def rs_R011_ueqv_R011YYY_generator_24_0000_0025 : Poly :=
[
  term (-2 : Rat) [(0, 1), (10, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (11, 1)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(10, 1), (14, 1)],
  term (2 : Rat) [(11, 1), (15, 1)],
  term (-1 : Rat) [(14, 2)],
  term (-1 : Rat) [(15, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 24. -/
def rs_R011_ueqv_R011YYY_coefficient_24_0000 : Poly :=
[
  term ((7692 : Rat) / 1135) [(0, 1), (1, 1), (15, 1), (16, 1)]
]

/-- Partial product 0 for generator 24. -/
def rs_R011_ueqv_R011YYY_partial_24_0000 : Poly :=
[
  term ((15384 : Rat) / 1135) [(0, 1), (1, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((15384 : Rat) / 1135) [(0, 1), (1, 1), (11, 1), (15, 2), (16, 1)],
  term ((-7692 : Rat) / 1135) [(0, 1), (1, 1), (14, 2), (15, 1), (16, 1)],
  term ((-7692 : Rat) / 1135) [(0, 1), (1, 1), (15, 3), (16, 1)],
  term ((-15384 : Rat) / 1135) [(0, 1), (1, 2), (11, 1), (15, 1), (16, 1)],
  term ((7692 : Rat) / 1135) [(0, 1), (1, 3), (15, 1), (16, 1)],
  term ((-15384 : Rat) / 1135) [(0, 2), (1, 1), (10, 1), (15, 1), (16, 1)],
  term ((7692 : Rat) / 1135) [(0, 3), (1, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 24. -/
theorem rs_R011_ueqv_R011YYY_partial_24_0000_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_24_0000
        rs_R011_ueqv_R011YYY_generator_24_0000_0025 =
      rs_R011_ueqv_R011YYY_partial_24_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 24. -/
def rs_R011_ueqv_R011YYY_coefficient_24_0001 : Poly :=
[
  term (-4 : Rat) [(0, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1 for generator 24. -/
def rs_R011_ueqv_R011YYY_partial_24_0001 : Poly :=
[
  term (8 : Rat) [(0, 1), (1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(0, 1), (1, 2), (13, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(0, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(0, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term (4 : Rat) [(0, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term (4 : Rat) [(0, 1), (13, 1), (15, 3), (16, 1)],
  term (8 : Rat) [(0, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(0, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 24. -/
theorem rs_R011_ueqv_R011YYY_partial_24_0001_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_24_0001
        rs_R011_ueqv_R011YYY_generator_24_0000_0025 =
      rs_R011_ueqv_R011YYY_partial_24_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 24. -/
def rs_R011_ueqv_R011YYY_coefficient_24_0002 : Poly :=
[
  term ((-148394 : Rat) / 3405) [(1, 1), (5, 1), (16, 1)]
]

/-- Partial product 2 for generator 24. -/
def rs_R011_ueqv_R011YYY_partial_24_0002 : Poly :=
[
  term ((296788 : Rat) / 3405) [(0, 1), (1, 1), (5, 1), (10, 1), (16, 1)],
  term ((-148394 : Rat) / 3405) [(0, 2), (1, 1), (5, 1), (16, 1)],
  term ((-296788 : Rat) / 3405) [(1, 1), (5, 1), (10, 1), (14, 1), (16, 1)],
  term ((-296788 : Rat) / 3405) [(1, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((148394 : Rat) / 3405) [(1, 1), (5, 1), (14, 2), (16, 1)],
  term ((148394 : Rat) / 3405) [(1, 1), (5, 1), (15, 2), (16, 1)],
  term ((296788 : Rat) / 3405) [(1, 2), (5, 1), (11, 1), (16, 1)],
  term ((-148394 : Rat) / 3405) [(1, 3), (5, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 24. -/
theorem rs_R011_ueqv_R011YYY_partial_24_0002_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_24_0002
        rs_R011_ueqv_R011YYY_generator_24_0000_0025 =
      rs_R011_ueqv_R011YYY_partial_24_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 24. -/
def rs_R011_ueqv_R011YYY_coefficient_24_0003 : Poly :=
[
  term ((7692 : Rat) / 1135) [(1, 1), (6, 1), (13, 1), (16, 1)]
]

/-- Partial product 3 for generator 24. -/
def rs_R011_ueqv_R011YYY_partial_24_0003 : Poly :=
[
  term ((-15384 : Rat) / 1135) [(0, 1), (1, 1), (6, 1), (10, 1), (13, 1), (16, 1)],
  term ((7692 : Rat) / 1135) [(0, 2), (1, 1), (6, 1), (13, 1), (16, 1)],
  term ((15384 : Rat) / 1135) [(1, 1), (6, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((15384 : Rat) / 1135) [(1, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-7692 : Rat) / 1135) [(1, 1), (6, 1), (13, 1), (14, 2), (16, 1)],
  term ((-7692 : Rat) / 1135) [(1, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((-15384 : Rat) / 1135) [(1, 2), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((7692 : Rat) / 1135) [(1, 3), (6, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 24. -/
theorem rs_R011_ueqv_R011YYY_partial_24_0003_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_24_0003
        rs_R011_ueqv_R011YYY_generator_24_0000_0025 =
      rs_R011_ueqv_R011YYY_partial_24_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 24. -/
def rs_R011_ueqv_R011YYY_coefficient_24_0004 : Poly :=
[
  term ((-101122 : Rat) / 3405) [(1, 1), (11, 1), (16, 1)]
]

/-- Partial product 4 for generator 24. -/
def rs_R011_ueqv_R011YYY_partial_24_0004 : Poly :=
[
  term ((202244 : Rat) / 3405) [(0, 1), (1, 1), (10, 1), (11, 1), (16, 1)],
  term ((-101122 : Rat) / 3405) [(0, 2), (1, 1), (11, 1), (16, 1)],
  term ((-202244 : Rat) / 3405) [(1, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((101122 : Rat) / 3405) [(1, 1), (11, 1), (14, 2), (16, 1)],
  term ((101122 : Rat) / 3405) [(1, 1), (11, 1), (15, 2), (16, 1)],
  term ((-202244 : Rat) / 3405) [(1, 1), (11, 2), (15, 1), (16, 1)],
  term ((202244 : Rat) / 3405) [(1, 2), (11, 2), (16, 1)],
  term ((-101122 : Rat) / 3405) [(1, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 24. -/
theorem rs_R011_ueqv_R011YYY_partial_24_0004_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_24_0004
        rs_R011_ueqv_R011YYY_generator_24_0000_0025 =
      rs_R011_ueqv_R011YYY_partial_24_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 24. -/
def rs_R011_ueqv_R011YYY_coefficient_24_0005 : Poly :=
[
  term (40 : Rat) [(1, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 5 for generator 24. -/
def rs_R011_ueqv_R011YYY_partial_24_0005 : Poly :=
[
  term (-80 : Rat) [(0, 1), (1, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term (40 : Rat) [(0, 2), (1, 1), (12, 1), (13, 1), (16, 1)],
  term (80 : Rat) [(1, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term (80 : Rat) [(1, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term (-40 : Rat) [(1, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term (-40 : Rat) [(1, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term (-80 : Rat) [(1, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term (40 : Rat) [(1, 3), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 24. -/
theorem rs_R011_ueqv_R011YYY_partial_24_0005_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_24_0005
        rs_R011_ueqv_R011YYY_generator_24_0000_0025 =
      rs_R011_ueqv_R011YYY_partial_24_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 24. -/
def rs_R011_ueqv_R011YYY_coefficient_24_0006 : Poly :=
[
  term ((30768 : Rat) / 1135) [(1, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 6 for generator 24. -/
def rs_R011_ueqv_R011YYY_partial_24_0006 : Poly :=
[
  term ((-61536 : Rat) / 1135) [(0, 1), (1, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((30768 : Rat) / 1135) [(0, 2), (1, 1), (12, 1), (15, 1), (16, 1)],
  term ((61536 : Rat) / 1135) [(1, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((61536 : Rat) / 1135) [(1, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-30768 : Rat) / 1135) [(1, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-30768 : Rat) / 1135) [(1, 1), (12, 1), (15, 3), (16, 1)],
  term ((-61536 : Rat) / 1135) [(1, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((30768 : Rat) / 1135) [(1, 3), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 24. -/
theorem rs_R011_ueqv_R011YYY_partial_24_0006_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_24_0006
        rs_R011_ueqv_R011YYY_generator_24_0000_0025 =
      rs_R011_ueqv_R011YYY_partial_24_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 24. -/
def rs_R011_ueqv_R011YYY_coefficient_24_0007 : Poly :=
[
  term ((-37896 : Rat) / 1135) [(1, 1), (13, 1), (16, 1)]
]

/-- Partial product 7 for generator 24. -/
def rs_R011_ueqv_R011YYY_partial_24_0007 : Poly :=
[
  term ((75792 : Rat) / 1135) [(0, 1), (1, 1), (10, 1), (13, 1), (16, 1)],
  term ((-37896 : Rat) / 1135) [(0, 2), (1, 1), (13, 1), (16, 1)],
  term ((-75792 : Rat) / 1135) [(1, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-75792 : Rat) / 1135) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((37896 : Rat) / 1135) [(1, 1), (13, 1), (14, 2), (16, 1)],
  term ((37896 : Rat) / 1135) [(1, 1), (13, 1), (15, 2), (16, 1)],
  term ((75792 : Rat) / 1135) [(1, 2), (11, 1), (13, 1), (16, 1)],
  term ((-37896 : Rat) / 1135) [(1, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 24. -/
theorem rs_R011_ueqv_R011YYY_partial_24_0007_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_24_0007
        rs_R011_ueqv_R011YYY_generator_24_0000_0025 =
      rs_R011_ueqv_R011YYY_partial_24_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 24. -/
def rs_R011_ueqv_R011YYY_coefficient_24_0008 : Poly :=
[
  term ((-22756 : Rat) / 681) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 8 for generator 24. -/
def rs_R011_ueqv_R011YYY_partial_24_0008 : Poly :=
[
  term ((45512 : Rat) / 681) [(0, 1), (1, 1), (10, 1), (15, 1), (16, 1)],
  term ((-22756 : Rat) / 681) [(0, 2), (1, 1), (15, 1), (16, 1)],
  term ((-45512 : Rat) / 681) [(1, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-45512 : Rat) / 681) [(1, 1), (11, 1), (15, 2), (16, 1)],
  term ((22756 : Rat) / 681) [(1, 1), (14, 2), (15, 1), (16, 1)],
  term ((22756 : Rat) / 681) [(1, 1), (15, 3), (16, 1)],
  term ((45512 : Rat) / 681) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((-22756 : Rat) / 681) [(1, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 24. -/
theorem rs_R011_ueqv_R011YYY_partial_24_0008_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_24_0008
        rs_R011_ueqv_R011YYY_generator_24_0000_0025 =
      rs_R011_ueqv_R011YYY_partial_24_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 24. -/
def rs_R011_ueqv_R011YYY_coefficient_24_0009 : Poly :=
[
  term ((-15384 : Rat) / 227) [(1, 2), (12, 1), (16, 1)]
]

/-- Partial product 9 for generator 24. -/
def rs_R011_ueqv_R011YYY_partial_24_0009 : Poly :=
[
  term ((30768 : Rat) / 227) [(0, 1), (1, 2), (10, 1), (12, 1), (16, 1)],
  term ((-15384 : Rat) / 227) [(0, 2), (1, 2), (12, 1), (16, 1)],
  term ((-30768 : Rat) / 227) [(1, 2), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-30768 : Rat) / 227) [(1, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((15384 : Rat) / 227) [(1, 2), (12, 1), (14, 2), (16, 1)],
  term ((15384 : Rat) / 227) [(1, 2), (12, 1), (15, 2), (16, 1)],
  term ((30768 : Rat) / 227) [(1, 3), (11, 1), (12, 1), (16, 1)],
  term ((-15384 : Rat) / 227) [(1, 4), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 24. -/
theorem rs_R011_ueqv_R011YYY_partial_24_0009_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_24_0009
        rs_R011_ueqv_R011YYY_generator_24_0000_0025 =
      rs_R011_ueqv_R011YYY_partial_24_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 24. -/
def rs_R011_ueqv_R011YYY_coefficient_24_0010 : Poly :=
[
  term ((11346 : Rat) / 227) [(1, 2), (16, 1)]
]

/-- Partial product 10 for generator 24. -/
def rs_R011_ueqv_R011YYY_partial_24_0010 : Poly :=
[
  term ((-22692 : Rat) / 227) [(0, 1), (1, 2), (10, 1), (16, 1)],
  term ((11346 : Rat) / 227) [(0, 2), (1, 2), (16, 1)],
  term ((22692 : Rat) / 227) [(1, 2), (10, 1), (14, 1), (16, 1)],
  term ((22692 : Rat) / 227) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((-11346 : Rat) / 227) [(1, 2), (14, 2), (16, 1)],
  term ((-11346 : Rat) / 227) [(1, 2), (15, 2), (16, 1)],
  term ((-22692 : Rat) / 227) [(1, 3), (11, 1), (16, 1)],
  term ((11346 : Rat) / 227) [(1, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 24. -/
theorem rs_R011_ueqv_R011YYY_partial_24_0010_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_24_0010
        rs_R011_ueqv_R011YYY_generator_24_0000_0025 =
      rs_R011_ueqv_R011YYY_partial_24_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 24. -/
def rs_R011_ueqv_R011YYY_coefficient_24_0011 : Poly :=
[
  term ((-320 : Rat) / 681) [(5, 1), (11, 1), (16, 1)]
]

/-- Partial product 11 for generator 24. -/
def rs_R011_ueqv_R011YYY_partial_24_0011 : Poly :=
[
  term ((640 : Rat) / 681) [(0, 1), (5, 1), (10, 1), (11, 1), (16, 1)],
  term ((-320 : Rat) / 681) [(0, 2), (5, 1), (11, 1), (16, 1)],
  term ((640 : Rat) / 681) [(1, 1), (5, 1), (11, 2), (16, 1)],
  term ((-320 : Rat) / 681) [(1, 2), (5, 1), (11, 1), (16, 1)],
  term ((-640 : Rat) / 681) [(5, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((320 : Rat) / 681) [(5, 1), (11, 1), (14, 2), (16, 1)],
  term ((320 : Rat) / 681) [(5, 1), (11, 1), (15, 2), (16, 1)],
  term ((-640 : Rat) / 681) [(5, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 24. -/
theorem rs_R011_ueqv_R011YYY_partial_24_0011_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_24_0011
        rs_R011_ueqv_R011YYY_generator_24_0000_0025 =
      rs_R011_ueqv_R011YYY_partial_24_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 24. -/
def rs_R011_ueqv_R011YYY_coefficient_24_0012 : Poly :=
[
  term (26 : Rat) [(5, 1), (13, 1), (16, 1)]
]

/-- Partial product 12 for generator 24. -/
def rs_R011_ueqv_R011YYY_partial_24_0012 : Poly :=
[
  term (-52 : Rat) [(0, 1), (5, 1), (10, 1), (13, 1), (16, 1)],
  term (26 : Rat) [(0, 2), (5, 1), (13, 1), (16, 1)],
  term (-52 : Rat) [(1, 1), (5, 1), (11, 1), (13, 1), (16, 1)],
  term (26 : Rat) [(1, 2), (5, 1), (13, 1), (16, 1)],
  term (52 : Rat) [(5, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term (52 : Rat) [(5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term (-26 : Rat) [(5, 1), (13, 1), (14, 2), (16, 1)],
  term (-26 : Rat) [(5, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 24. -/
theorem rs_R011_ueqv_R011YYY_partial_24_0012_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_24_0012
        rs_R011_ueqv_R011YYY_generator_24_0000_0025 =
      rs_R011_ueqv_R011YYY_partial_24_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 24. -/
def rs_R011_ueqv_R011YYY_coefficient_24_0013 : Poly :=
[
  term (-4 : Rat) [(6, 1), (13, 2), (16, 1)]
]

/-- Partial product 13 for generator 24. -/
def rs_R011_ueqv_R011YYY_partial_24_0013 : Poly :=
[
  term (8 : Rat) [(0, 1), (6, 1), (10, 1), (13, 2), (16, 1)],
  term (-4 : Rat) [(0, 2), (6, 1), (13, 2), (16, 1)],
  term (8 : Rat) [(1, 1), (6, 1), (11, 1), (13, 2), (16, 1)],
  term (-4 : Rat) [(1, 2), (6, 1), (13, 2), (16, 1)],
  term (-8 : Rat) [(6, 1), (10, 1), (13, 2), (14, 1), (16, 1)],
  term (-8 : Rat) [(6, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term (4 : Rat) [(6, 1), (13, 2), (14, 2), (16, 1)],
  term (4 : Rat) [(6, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 24. -/
theorem rs_R011_ueqv_R011YYY_partial_24_0013_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_24_0013
        rs_R011_ueqv_R011YYY_generator_24_0000_0025 =
      rs_R011_ueqv_R011YYY_partial_24_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 24. -/
def rs_R011_ueqv_R011YYY_coefficient_24_0014 : Poly :=
[
  term (-2 : Rat) [(6, 1), (16, 1)]
]

/-- Partial product 14 for generator 24. -/
def rs_R011_ueqv_R011YYY_partial_24_0014 : Poly :=
[
  term (4 : Rat) [(0, 1), (6, 1), (10, 1), (16, 1)],
  term (-2 : Rat) [(0, 2), (6, 1), (16, 1)],
  term (4 : Rat) [(1, 1), (6, 1), (11, 1), (16, 1)],
  term (-2 : Rat) [(1, 2), (6, 1), (16, 1)],
  term (-4 : Rat) [(6, 1), (10, 1), (14, 1), (16, 1)],
  term (-4 : Rat) [(6, 1), (11, 1), (15, 1), (16, 1)],
  term (2 : Rat) [(6, 1), (14, 2), (16, 1)],
  term (2 : Rat) [(6, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 24. -/
theorem rs_R011_ueqv_R011YYY_partial_24_0014_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_24_0014
        rs_R011_ueqv_R011YYY_generator_24_0000_0025 =
      rs_R011_ueqv_R011YYY_partial_24_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 24. -/
def rs_R011_ueqv_R011YYY_coefficient_24_0015 : Poly :=
[
  term ((7184 : Rat) / 1135) [(10, 1), (16, 1)]
]

/-- Partial product 15 for generator 24. -/
def rs_R011_ueqv_R011YYY_partial_24_0015 : Poly :=
[
  term ((-14368 : Rat) / 1135) [(0, 1), (10, 2), (16, 1)],
  term ((7184 : Rat) / 1135) [(0, 2), (10, 1), (16, 1)],
  term ((-14368 : Rat) / 1135) [(1, 1), (10, 1), (11, 1), (16, 1)],
  term ((7184 : Rat) / 1135) [(1, 2), (10, 1), (16, 1)],
  term ((14368 : Rat) / 1135) [(10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-7184 : Rat) / 1135) [(10, 1), (14, 2), (16, 1)],
  term ((-7184 : Rat) / 1135) [(10, 1), (15, 2), (16, 1)],
  term ((14368 : Rat) / 1135) [(10, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 24. -/
theorem rs_R011_ueqv_R011YYY_partial_24_0015_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_24_0015
        rs_R011_ueqv_R011YYY_generator_24_0000_0025 =
      rs_R011_ueqv_R011YYY_partial_24_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 24. -/
def rs_R011_ueqv_R011YYY_coefficient_24_0016 : Poly :=
[
  term (18 : Rat) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 16 for generator 24. -/
def rs_R011_ueqv_R011YYY_partial_24_0016 : Poly :=
[
  term (-36 : Rat) [(0, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term (18 : Rat) [(0, 2), (11, 1), (13, 1), (16, 1)],
  term (-36 : Rat) [(1, 1), (11, 2), (13, 1), (16, 1)],
  term (18 : Rat) [(1, 2), (11, 1), (13, 1), (16, 1)],
  term (36 : Rat) [(10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term (-18 : Rat) [(11, 1), (13, 1), (14, 2), (16, 1)],
  term (-18 : Rat) [(11, 1), (13, 1), (15, 2), (16, 1)],
  term (36 : Rat) [(11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 24. -/
theorem rs_R011_ueqv_R011YYY_partial_24_0016_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_24_0016
        rs_R011_ueqv_R011YYY_generator_24_0000_0025 =
      rs_R011_ueqv_R011YYY_partial_24_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 24. -/
def rs_R011_ueqv_R011YYY_coefficient_24_0017 : Poly :=
[
  term ((3688 : Rat) / 681) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 17 for generator 24. -/
def rs_R011_ueqv_R011YYY_partial_24_0017 : Poly :=
[
  term ((-7376 : Rat) / 681) [(0, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((3688 : Rat) / 681) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((-7376 : Rat) / 681) [(1, 1), (11, 2), (15, 1), (16, 1)],
  term ((3688 : Rat) / 681) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((7376 : Rat) / 681) [(10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3688 : Rat) / 681) [(11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-3688 : Rat) / 681) [(11, 1), (15, 3), (16, 1)],
  term ((7376 : Rat) / 681) [(11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 24. -/
theorem rs_R011_ueqv_R011YYY_partial_24_0017_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_24_0017
        rs_R011_ueqv_R011YYY_generator_24_0000_0025 =
      rs_R011_ueqv_R011YYY_partial_24_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 24. -/
def rs_R011_ueqv_R011YYY_coefficient_24_0018 : Poly :=
[
  term ((128 : Rat) / 681) [(11, 2), (16, 1)]
]

/-- Partial product 18 for generator 24. -/
def rs_R011_ueqv_R011YYY_partial_24_0018 : Poly :=
[
  term ((-256 : Rat) / 681) [(0, 1), (10, 1), (11, 2), (16, 1)],
  term ((128 : Rat) / 681) [(0, 2), (11, 2), (16, 1)],
  term ((-256 : Rat) / 681) [(1, 1), (11, 3), (16, 1)],
  term ((128 : Rat) / 681) [(1, 2), (11, 2), (16, 1)],
  term ((256 : Rat) / 681) [(10, 1), (11, 2), (14, 1), (16, 1)],
  term ((-128 : Rat) / 681) [(11, 2), (14, 2), (16, 1)],
  term ((-128 : Rat) / 681) [(11, 2), (15, 2), (16, 1)],
  term ((256 : Rat) / 681) [(11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 24. -/
theorem rs_R011_ueqv_R011YYY_partial_24_0018_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_24_0018
        rs_R011_ueqv_R011YYY_generator_24_0000_0025 =
      rs_R011_ueqv_R011YYY_partial_24_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 24. -/
def rs_R011_ueqv_R011YYY_coefficient_24_0019 : Poly :=
[
  term (-16 : Rat) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 19 for generator 24. -/
def rs_R011_ueqv_R011YYY_partial_24_0019 : Poly :=
[
  term (32 : Rat) [(0, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term (-16 : Rat) [(0, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term (32 : Rat) [(1, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term (-16 : Rat) [(1, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term (-32 : Rat) [(10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term (-32 : Rat) [(11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term (16 : Rat) [(12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term (16 : Rat) [(12, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 24. -/
theorem rs_R011_ueqv_R011YYY_partial_24_0019_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_24_0019
        rs_R011_ueqv_R011YYY_generator_24_0000_0025 =
      rs_R011_ueqv_R011YYY_partial_24_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 24. -/
def rs_R011_ueqv_R011YYY_coefficient_24_0020 : Poly :=
[
  term (4 : Rat) [(12, 1), (15, 2), (16, 1)]
]

/-- Partial product 20 for generator 24. -/
def rs_R011_ueqv_R011YYY_partial_24_0020 : Poly :=
[
  term (-8 : Rat) [(0, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term (4 : Rat) [(0, 2), (12, 1), (15, 2), (16, 1)],
  term (-8 : Rat) [(1, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term (4 : Rat) [(1, 2), (12, 1), (15, 2), (16, 1)],
  term (8 : Rat) [(10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term (8 : Rat) [(11, 1), (12, 1), (15, 3), (16, 1)],
  term (-4 : Rat) [(12, 1), (14, 2), (15, 2), (16, 1)],
  term (-4 : Rat) [(12, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 24. -/
theorem rs_R011_ueqv_R011YYY_partial_24_0020_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_24_0020
        rs_R011_ueqv_R011YYY_generator_24_0000_0025 =
      rs_R011_ueqv_R011YYY_partial_24_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 24. -/
def rs_R011_ueqv_R011YYY_coefficient_24_0021 : Poly :=
[
  term ((283 : Rat) / 227) [(12, 1), (16, 1)]
]

/-- Partial product 21 for generator 24. -/
def rs_R011_ueqv_R011YYY_partial_24_0021 : Poly :=
[
  term ((-566 : Rat) / 227) [(0, 1), (10, 1), (12, 1), (16, 1)],
  term ((283 : Rat) / 227) [(0, 2), (12, 1), (16, 1)],
  term ((-566 : Rat) / 227) [(1, 1), (11, 1), (12, 1), (16, 1)],
  term ((283 : Rat) / 227) [(1, 2), (12, 1), (16, 1)],
  term ((566 : Rat) / 227) [(10, 1), (12, 1), (14, 1), (16, 1)],
  term ((566 : Rat) / 227) [(11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-283 : Rat) / 227) [(12, 1), (14, 2), (16, 1)],
  term ((-283 : Rat) / 227) [(12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 24. -/
theorem rs_R011_ueqv_R011YYY_partial_24_0021_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_24_0021
        rs_R011_ueqv_R011YYY_generator_24_0000_0025 =
      rs_R011_ueqv_R011YYY_partial_24_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 24. -/
def rs_R011_ueqv_R011YYY_coefficient_24_0022 : Poly :=
[
  term (20 : Rat) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 22 for generator 24. -/
def rs_R011_ueqv_R011YYY_partial_24_0022 : Poly :=
[
  term (-40 : Rat) [(0, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term (20 : Rat) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term (-40 : Rat) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term (20 : Rat) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term (40 : Rat) [(10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term (40 : Rat) [(11, 1), (13, 1), (15, 2), (16, 1)],
  term (-20 : Rat) [(13, 1), (14, 2), (15, 1), (16, 1)],
  term (-20 : Rat) [(13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 24. -/
theorem rs_R011_ueqv_R011YYY_partial_24_0022_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_24_0022
        rs_R011_ueqv_R011YYY_generator_24_0000_0025 =
      rs_R011_ueqv_R011YYY_partial_24_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 24. -/
def rs_R011_ueqv_R011YYY_coefficient_24_0023 : Poly :=
[
  term (2 : Rat) [(13, 2), (16, 1)]
]

/-- Partial product 23 for generator 24. -/
def rs_R011_ueqv_R011YYY_partial_24_0023 : Poly :=
[
  term (-4 : Rat) [(0, 1), (10, 1), (13, 2), (16, 1)],
  term (2 : Rat) [(0, 2), (13, 2), (16, 1)],
  term (-4 : Rat) [(1, 1), (11, 1), (13, 2), (16, 1)],
  term (2 : Rat) [(1, 2), (13, 2), (16, 1)],
  term (4 : Rat) [(10, 1), (13, 2), (14, 1), (16, 1)],
  term (4 : Rat) [(11, 1), (13, 2), (15, 1), (16, 1)],
  term (-2 : Rat) [(13, 2), (14, 2), (16, 1)],
  term (-2 : Rat) [(13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 24. -/
theorem rs_R011_ueqv_R011YYY_partial_24_0023_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_24_0023
        rs_R011_ueqv_R011YYY_generator_24_0000_0025 =
      rs_R011_ueqv_R011YYY_partial_24_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 24. -/
def rs_R011_ueqv_R011YYY_coefficient_24_0024 : Poly :=
[
  term ((1324 : Rat) / 1135) [(15, 2), (16, 1)]
]

/-- Partial product 24 for generator 24. -/
def rs_R011_ueqv_R011YYY_partial_24_0024 : Poly :=
[
  term ((-2648 : Rat) / 1135) [(0, 1), (10, 1), (15, 2), (16, 1)],
  term ((1324 : Rat) / 1135) [(0, 2), (15, 2), (16, 1)],
  term ((-2648 : Rat) / 1135) [(1, 1), (11, 1), (15, 2), (16, 1)],
  term ((1324 : Rat) / 1135) [(1, 2), (15, 2), (16, 1)],
  term ((2648 : Rat) / 1135) [(10, 1), (14, 1), (15, 2), (16, 1)],
  term ((2648 : Rat) / 1135) [(11, 1), (15, 3), (16, 1)],
  term ((-1324 : Rat) / 1135) [(14, 2), (15, 2), (16, 1)],
  term ((-1324 : Rat) / 1135) [(15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 24. -/
theorem rs_R011_ueqv_R011YYY_partial_24_0024_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_24_0024
        rs_R011_ueqv_R011YYY_generator_24_0000_0025 =
      rs_R011_ueqv_R011YYY_partial_24_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 24. -/
def rs_R011_ueqv_R011YYY_coefficient_24_0025 : Poly :=
[
  term ((-1367 : Rat) / 227) [(16, 1)]
]

/-- Partial product 25 for generator 24. -/
def rs_R011_ueqv_R011YYY_partial_24_0025 : Poly :=
[
  term ((2734 : Rat) / 227) [(0, 1), (10, 1), (16, 1)],
  term ((-1367 : Rat) / 227) [(0, 2), (16, 1)],
  term ((2734 : Rat) / 227) [(1, 1), (11, 1), (16, 1)],
  term ((-1367 : Rat) / 227) [(1, 2), (16, 1)],
  term ((-2734 : Rat) / 227) [(10, 1), (14, 1), (16, 1)],
  term ((-2734 : Rat) / 227) [(11, 1), (15, 1), (16, 1)],
  term ((1367 : Rat) / 227) [(14, 2), (16, 1)],
  term ((1367 : Rat) / 227) [(15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 24. -/
theorem rs_R011_ueqv_R011YYY_partial_24_0025_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_24_0025
        rs_R011_ueqv_R011YYY_generator_24_0000_0025 =
      rs_R011_ueqv_R011YYY_partial_24_0025 := by
  native_decide

/-- Partial products in this block. -/
def rs_R011_ueqv_R011YYY_partials_24_0000_0025 : List Poly :=
[
  rs_R011_ueqv_R011YYY_partial_24_0000,
  rs_R011_ueqv_R011YYY_partial_24_0001,
  rs_R011_ueqv_R011YYY_partial_24_0002,
  rs_R011_ueqv_R011YYY_partial_24_0003,
  rs_R011_ueqv_R011YYY_partial_24_0004,
  rs_R011_ueqv_R011YYY_partial_24_0005,
  rs_R011_ueqv_R011YYY_partial_24_0006,
  rs_R011_ueqv_R011YYY_partial_24_0007,
  rs_R011_ueqv_R011YYY_partial_24_0008,
  rs_R011_ueqv_R011YYY_partial_24_0009,
  rs_R011_ueqv_R011YYY_partial_24_0010,
  rs_R011_ueqv_R011YYY_partial_24_0011,
  rs_R011_ueqv_R011YYY_partial_24_0012,
  rs_R011_ueqv_R011YYY_partial_24_0013,
  rs_R011_ueqv_R011YYY_partial_24_0014,
  rs_R011_ueqv_R011YYY_partial_24_0015,
  rs_R011_ueqv_R011YYY_partial_24_0016,
  rs_R011_ueqv_R011YYY_partial_24_0017,
  rs_R011_ueqv_R011YYY_partial_24_0018,
  rs_R011_ueqv_R011YYY_partial_24_0019,
  rs_R011_ueqv_R011YYY_partial_24_0020,
  rs_R011_ueqv_R011YYY_partial_24_0021,
  rs_R011_ueqv_R011YYY_partial_24_0022,
  rs_R011_ueqv_R011YYY_partial_24_0023,
  rs_R011_ueqv_R011YYY_partial_24_0024,
  rs_R011_ueqv_R011YYY_partial_24_0025
]

/-- Sum of partial products in this block. -/
def rs_R011_ueqv_R011YYY_block_24_0000_0025 : Poly :=
[
  term ((296788 : Rat) / 3405) [(0, 1), (1, 1), (5, 1), (10, 1), (16, 1)],
  term ((-15384 : Rat) / 1135) [(0, 1), (1, 1), (6, 1), (10, 1), (13, 1), (16, 1)],
  term ((202244 : Rat) / 3405) [(0, 1), (1, 1), (10, 1), (11, 1), (16, 1)],
  term (-80 : Rat) [(0, 1), (1, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-61536 : Rat) / 1135) [(0, 1), (1, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((75792 : Rat) / 1135) [(0, 1), (1, 1), (10, 1), (13, 1), (16, 1)],
  term ((15384 : Rat) / 1135) [(0, 1), (1, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((45512 : Rat) / 681) [(0, 1), (1, 1), (10, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(0, 1), (1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((15384 : Rat) / 1135) [(0, 1), (1, 1), (11, 1), (15, 2), (16, 1)],
  term ((-7692 : Rat) / 1135) [(0, 1), (1, 1), (14, 2), (15, 1), (16, 1)],
  term ((-7692 : Rat) / 1135) [(0, 1), (1, 1), (15, 3), (16, 1)],
  term ((30768 : Rat) / 227) [(0, 1), (1, 2), (10, 1), (12, 1), (16, 1)],
  term ((-22692 : Rat) / 227) [(0, 1), (1, 2), (10, 1), (16, 1)],
  term ((-15384 : Rat) / 1135) [(0, 1), (1, 2), (11, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(0, 1), (1, 2), (13, 1), (15, 1), (16, 1)],
  term ((7692 : Rat) / 1135) [(0, 1), (1, 3), (15, 1), (16, 1)],
  term ((640 : Rat) / 681) [(0, 1), (5, 1), (10, 1), (11, 1), (16, 1)],
  term (-52 : Rat) [(0, 1), (5, 1), (10, 1), (13, 1), (16, 1)],
  term (8 : Rat) [(0, 1), (6, 1), (10, 1), (13, 2), (16, 1)],
  term (4 : Rat) [(0, 1), (6, 1), (10, 1), (16, 1)],
  term (-36 : Rat) [(0, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-7376 : Rat) / 681) [(0, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-256 : Rat) / 681) [(0, 1), (10, 1), (11, 2), (16, 1)],
  term (32 : Rat) [(0, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(0, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-566 : Rat) / 227) [(0, 1), (10, 1), (12, 1), (16, 1)],
  term (-8 : Rat) [(0, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term (-40 : Rat) [(0, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(0, 1), (10, 1), (13, 2), (16, 1)],
  term ((-2648 : Rat) / 1135) [(0, 1), (10, 1), (15, 2), (16, 1)],
  term ((2734 : Rat) / 227) [(0, 1), (10, 1), (16, 1)],
  term ((-14368 : Rat) / 1135) [(0, 1), (10, 2), (16, 1)],
  term (-8 : Rat) [(0, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term (4 : Rat) [(0, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term (4 : Rat) [(0, 1), (13, 1), (15, 3), (16, 1)],
  term ((-148394 : Rat) / 3405) [(0, 2), (1, 1), (5, 1), (16, 1)],
  term ((7692 : Rat) / 1135) [(0, 2), (1, 1), (6, 1), (13, 1), (16, 1)],
  term ((-15384 : Rat) / 1135) [(0, 2), (1, 1), (10, 1), (15, 1), (16, 1)],
  term ((-101122 : Rat) / 3405) [(0, 2), (1, 1), (11, 1), (16, 1)],
  term (40 : Rat) [(0, 2), (1, 1), (12, 1), (13, 1), (16, 1)],
  term ((30768 : Rat) / 1135) [(0, 2), (1, 1), (12, 1), (15, 1), (16, 1)],
  term ((-37896 : Rat) / 1135) [(0, 2), (1, 1), (13, 1), (16, 1)],
  term ((-22756 : Rat) / 681) [(0, 2), (1, 1), (15, 1), (16, 1)],
  term ((-15384 : Rat) / 227) [(0, 2), (1, 2), (12, 1), (16, 1)],
  term ((11346 : Rat) / 227) [(0, 2), (1, 2), (16, 1)],
  term ((-320 : Rat) / 681) [(0, 2), (5, 1), (11, 1), (16, 1)],
  term (26 : Rat) [(0, 2), (5, 1), (13, 1), (16, 1)],
  term (-4 : Rat) [(0, 2), (6, 1), (13, 2), (16, 1)],
  term (-2 : Rat) [(0, 2), (6, 1), (16, 1)],
  term (8 : Rat) [(0, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((7184 : Rat) / 1135) [(0, 2), (10, 1), (16, 1)],
  term (18 : Rat) [(0, 2), (11, 1), (13, 1), (16, 1)],
  term ((3688 : Rat) / 681) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((128 : Rat) / 681) [(0, 2), (11, 2), (16, 1)],
  term (-16 : Rat) [(0, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(0, 2), (12, 1), (15, 2), (16, 1)],
  term ((283 : Rat) / 227) [(0, 2), (12, 1), (16, 1)],
  term (20 : Rat) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term (2 : Rat) [(0, 2), (13, 2), (16, 1)],
  term ((1324 : Rat) / 1135) [(0, 2), (15, 2), (16, 1)],
  term ((-1367 : Rat) / 227) [(0, 2), (16, 1)],
  term ((7692 : Rat) / 1135) [(0, 3), (1, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(0, 3), (13, 1), (15, 1), (16, 1)],
  term ((-296788 : Rat) / 3405) [(1, 1), (5, 1), (10, 1), (14, 1), (16, 1)],
  term (-52 : Rat) [(1, 1), (5, 1), (11, 1), (13, 1), (16, 1)],
  term ((-296788 : Rat) / 3405) [(1, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((640 : Rat) / 681) [(1, 1), (5, 1), (11, 2), (16, 1)],
  term ((148394 : Rat) / 3405) [(1, 1), (5, 1), (14, 2), (16, 1)],
  term ((148394 : Rat) / 3405) [(1, 1), (5, 1), (15, 2), (16, 1)],
  term ((15384 : Rat) / 1135) [(1, 1), (6, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((15384 : Rat) / 1135) [(1, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(1, 1), (6, 1), (11, 1), (13, 2), (16, 1)],
  term (4 : Rat) [(1, 1), (6, 1), (11, 1), (16, 1)],
  term ((-7692 : Rat) / 1135) [(1, 1), (6, 1), (13, 1), (14, 2), (16, 1)],
  term ((-7692 : Rat) / 1135) [(1, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((-202244 : Rat) / 3405) [(1, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-14368 : Rat) / 1135) [(1, 1), (10, 1), (11, 1), (16, 1)],
  term (80 : Rat) [(1, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((61536 : Rat) / 1135) [(1, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-75792 : Rat) / 1135) [(1, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-45512 : Rat) / 681) [(1, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term (112 : Rat) [(1, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((52456 : Rat) / 1135) [(1, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-566 : Rat) / 227) [(1, 1), (11, 1), (12, 1), (16, 1)],
  term ((-121192 : Rat) / 1135) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(1, 1), (11, 1), (13, 2), (16, 1)],
  term ((101122 : Rat) / 3405) [(1, 1), (11, 1), (14, 2), (16, 1)],
  term ((-44794 : Rat) / 1135) [(1, 1), (11, 1), (15, 2), (16, 1)],
  term ((2734 : Rat) / 227) [(1, 1), (11, 1), (16, 1)],
  term (-36 : Rat) [(1, 1), (11, 2), (13, 1), (16, 1)],
  term ((-79708 : Rat) / 1135) [(1, 1), (11, 2), (15, 1), (16, 1)],
  term ((-256 : Rat) / 681) [(1, 1), (11, 3), (16, 1)],
  term (-40 : Rat) [(1, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term (-40 : Rat) [(1, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-30768 : Rat) / 1135) [(1, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-30768 : Rat) / 1135) [(1, 1), (12, 1), (15, 3), (16, 1)],
  term ((37896 : Rat) / 1135) [(1, 1), (13, 1), (14, 2), (16, 1)],
  term ((37896 : Rat) / 1135) [(1, 1), (13, 1), (15, 2), (16, 1)],
  term ((22756 : Rat) / 681) [(1, 1), (14, 2), (15, 1), (16, 1)],
  term ((22756 : Rat) / 681) [(1, 1), (15, 3), (16, 1)],
  term ((98396 : Rat) / 1135) [(1, 2), (5, 1), (11, 1), (16, 1)],
  term (26 : Rat) [(1, 2), (5, 1), (13, 1), (16, 1)],
  term ((-15384 : Rat) / 1135) [(1, 2), (6, 1), (11, 1), (13, 1), (16, 1)],
  term (-4 : Rat) [(1, 2), (6, 1), (13, 2), (16, 1)],
  term (-2 : Rat) [(1, 2), (6, 1), (16, 1)],
  term ((-30768 : Rat) / 227) [(1, 2), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((22692 : Rat) / 227) [(1, 2), (10, 1), (14, 1), (16, 1)],
  term ((7184 : Rat) / 1135) [(1, 2), (10, 1), (16, 1)],
  term (-80 : Rat) [(1, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-215376 : Rat) / 1135) [(1, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((96222 : Rat) / 1135) [(1, 2), (11, 1), (13, 1), (16, 1)],
  term ((39092 : Rat) / 227) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((67628 : Rat) / 1135) [(1, 2), (11, 2), (16, 1)],
  term (-16 : Rat) [(1, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((15384 : Rat) / 227) [(1, 2), (12, 1), (14, 2), (16, 1)],
  term ((16292 : Rat) / 227) [(1, 2), (12, 1), (15, 2), (16, 1)],
  term ((283 : Rat) / 227) [(1, 2), (12, 1), (16, 1)],
  term (20 : Rat) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term (2 : Rat) [(1, 2), (13, 2), (16, 1)],
  term ((-11346 : Rat) / 227) [(1, 2), (14, 2), (16, 1)],
  term ((-55406 : Rat) / 1135) [(1, 2), (15, 2), (16, 1)],
  term ((-1367 : Rat) / 227) [(1, 2), (16, 1)],
  term ((-148394 : Rat) / 3405) [(1, 3), (5, 1), (16, 1)],
  term ((7692 : Rat) / 1135) [(1, 3), (6, 1), (13, 1), (16, 1)],
  term ((30768 : Rat) / 227) [(1, 3), (11, 1), (12, 1), (16, 1)],
  term ((-441502 : Rat) / 3405) [(1, 3), (11, 1), (16, 1)],
  term (40 : Rat) [(1, 3), (12, 1), (13, 1), (16, 1)],
  term ((30768 : Rat) / 1135) [(1, 3), (12, 1), (15, 1), (16, 1)],
  term ((-37896 : Rat) / 1135) [(1, 3), (13, 1), (16, 1)],
  term ((-22756 : Rat) / 681) [(1, 3), (15, 1), (16, 1)],
  term ((-15384 : Rat) / 227) [(1, 4), (12, 1), (16, 1)],
  term ((11346 : Rat) / 227) [(1, 4), (16, 1)],
  term ((-640 : Rat) / 681) [(5, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term (52 : Rat) [(5, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term (52 : Rat) [(5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((320 : Rat) / 681) [(5, 1), (11, 1), (14, 2), (16, 1)],
  term ((320 : Rat) / 681) [(5, 1), (11, 1), (15, 2), (16, 1)],
  term ((-640 : Rat) / 681) [(5, 1), (11, 2), (15, 1), (16, 1)],
  term (-26 : Rat) [(5, 1), (13, 1), (14, 2), (16, 1)],
  term (-26 : Rat) [(5, 1), (13, 1), (15, 2), (16, 1)],
  term (-8 : Rat) [(6, 1), (10, 1), (13, 2), (14, 1), (16, 1)],
  term (-4 : Rat) [(6, 1), (10, 1), (14, 1), (16, 1)],
  term (-8 : Rat) [(6, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term (-4 : Rat) [(6, 1), (11, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(6, 1), (13, 2), (14, 2), (16, 1)],
  term (4 : Rat) [(6, 1), (13, 2), (15, 2), (16, 1)],
  term (2 : Rat) [(6, 1), (14, 2), (16, 1)],
  term (2 : Rat) [(6, 1), (15, 2), (16, 1)],
  term (36 : Rat) [(10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((7376 : Rat) / 681) [(10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((14368 : Rat) / 1135) [(10, 1), (11, 1), (15, 1), (16, 1)],
  term ((256 : Rat) / 681) [(10, 1), (11, 2), (14, 1), (16, 1)],
  term (-32 : Rat) [(10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((566 : Rat) / 227) [(10, 1), (12, 1), (14, 1), (16, 1)],
  term (40 : Rat) [(10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(10, 1), (13, 2), (14, 1), (16, 1)],
  term ((2648 : Rat) / 1135) [(10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2734 : Rat) / 227) [(10, 1), (14, 1), (16, 1)],
  term ((-7184 : Rat) / 1135) [(10, 1), (14, 2), (16, 1)],
  term ((-7184 : Rat) / 1135) [(10, 1), (15, 2), (16, 1)],
  term ((14368 : Rat) / 1135) [(10, 2), (14, 1), (16, 1)],
  term (-32 : Rat) [(11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((566 : Rat) / 227) [(11, 1), (12, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(11, 1), (12, 1), (15, 3), (16, 1)],
  term (-18 : Rat) [(11, 1), (13, 1), (14, 2), (16, 1)],
  term (22 : Rat) [(11, 1), (13, 1), (15, 2), (16, 1)],
  term (4 : Rat) [(11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-3688 : Rat) / 681) [(11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-2734 : Rat) / 227) [(11, 1), (15, 1), (16, 1)],
  term ((-10496 : Rat) / 3405) [(11, 1), (15, 3), (16, 1)],
  term (36 : Rat) [(11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-128 : Rat) / 681) [(11, 2), (14, 2), (16, 1)],
  term ((2416 : Rat) / 227) [(11, 2), (15, 2), (16, 1)],
  term ((256 : Rat) / 681) [(11, 3), (15, 1), (16, 1)],
  term (16 : Rat) [(12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term (16 : Rat) [(12, 1), (13, 1), (15, 3), (16, 1)],
  term (-4 : Rat) [(12, 1), (14, 2), (15, 2), (16, 1)],
  term ((-283 : Rat) / 227) [(12, 1), (14, 2), (16, 1)],
  term ((-283 : Rat) / 227) [(12, 1), (15, 2), (16, 1)],
  term (-4 : Rat) [(12, 1), (15, 4), (16, 1)],
  term (-20 : Rat) [(13, 1), (14, 2), (15, 1), (16, 1)],
  term (-20 : Rat) [(13, 1), (15, 3), (16, 1)],
  term (-2 : Rat) [(13, 2), (14, 2), (16, 1)],
  term (-2 : Rat) [(13, 2), (15, 2), (16, 1)],
  term ((-1324 : Rat) / 1135) [(14, 2), (15, 2), (16, 1)],
  term ((1367 : Rat) / 227) [(14, 2), (16, 1)],
  term ((1367 : Rat) / 227) [(15, 2), (16, 1)],
  term ((-1324 : Rat) / 1135) [(15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 24, terms 0 through 25. -/
theorem rs_R011_ueqv_R011YYY_block_24_0000_0025_valid :
    checkProductSumEq rs_R011_ueqv_R011YYY_partials_24_0000_0025
      rs_R011_ueqv_R011YYY_block_24_0000_0025 = true := by
  native_decide

end R011UeqvR011YYYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
