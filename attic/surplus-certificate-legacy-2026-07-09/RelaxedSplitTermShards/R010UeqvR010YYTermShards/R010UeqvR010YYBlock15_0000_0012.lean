/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R010:u=v:R010YY, term block 15:0-12

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R010UeqvR010YYTermShards

/-- Generator polynomial 15 for relaxed split surplus certificate `R010:u=v:R010YY`. -/
def rs_R010_ueqv_R010YY_generator_15_0000_0012 : Poly :=
[
  term (-2 : Rat) [(2, 1), (4, 1)],
  term (1 : Rat) [(2, 2)],
  term (-2 : Rat) [(3, 1), (5, 1)],
  term (1 : Rat) [(3, 2)],
  term (2 : Rat) [(4, 1), (14, 1)],
  term (2 : Rat) [(5, 1), (15, 1)],
  term (-1 : Rat) [(14, 2)],
  term (-1 : Rat) [(15, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 15. -/
def rs_R010_ueqv_R010YY_coefficient_15_0000 : Poly :=
[
  term ((-56128 : Rat) / 25) [(0, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 0 for generator 15. -/
def rs_R010_ueqv_R010YY_partial_15_0000 : Poly :=
[
  term ((112256 : Rat) / 25) [(0, 1), (2, 1), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((-56128 : Rat) / 25) [(0, 1), (2, 2), (9, 1), (15, 1), (16, 1)],
  term ((112256 : Rat) / 25) [(0, 1), (3, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((-56128 : Rat) / 25) [(0, 1), (3, 2), (9, 1), (15, 1), (16, 1)],
  term ((-112256 : Rat) / 25) [(0, 1), (4, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-112256 : Rat) / 25) [(0, 1), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((56128 : Rat) / 25) [(0, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((56128 : Rat) / 25) [(0, 1), (9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 15. -/
theorem rs_R010_ueqv_R010YY_partial_15_0000_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_15_0000
        rs_R010_ueqv_R010YY_generator_15_0000_0012 =
      rs_R010_ueqv_R010YY_partial_15_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 15. -/
def rs_R010_ueqv_R010YY_coefficient_15_0001 : Poly :=
[
  term ((-22872 : Rat) / 25) [(0, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 1 for generator 15. -/
def rs_R010_ueqv_R010YY_partial_15_0001 : Poly :=
[
  term ((45744 : Rat) / 25) [(0, 1), (2, 1), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((-22872 : Rat) / 25) [(0, 1), (2, 2), (11, 1), (15, 1), (16, 1)],
  term ((45744 : Rat) / 25) [(0, 1), (3, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((-22872 : Rat) / 25) [(0, 1), (3, 2), (11, 1), (15, 1), (16, 1)],
  term ((-45744 : Rat) / 25) [(0, 1), (4, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-45744 : Rat) / 25) [(0, 1), (5, 1), (11, 1), (15, 2), (16, 1)],
  term ((22872 : Rat) / 25) [(0, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((22872 : Rat) / 25) [(0, 1), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 15. -/
theorem rs_R010_ueqv_R010YY_partial_15_0001_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_15_0001
        rs_R010_ueqv_R010YY_generator_15_0000_0012 =
      rs_R010_ueqv_R010YY_partial_15_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 15. -/
def rs_R010_ueqv_R010YY_coefficient_15_0002 : Poly :=
[
  term ((56128 : Rat) / 25) [(1, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 2 for generator 15. -/
def rs_R010_ueqv_R010YY_partial_15_0002 : Poly :=
[
  term ((-112256 : Rat) / 25) [(1, 1), (2, 1), (4, 1), (8, 1), (15, 1), (16, 1)],
  term ((56128 : Rat) / 25) [(1, 1), (2, 2), (8, 1), (15, 1), (16, 1)],
  term ((-112256 : Rat) / 25) [(1, 1), (3, 1), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((56128 : Rat) / 25) [(1, 1), (3, 2), (8, 1), (15, 1), (16, 1)],
  term ((112256 : Rat) / 25) [(1, 1), (4, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((112256 : Rat) / 25) [(1, 1), (5, 1), (8, 1), (15, 2), (16, 1)],
  term ((-56128 : Rat) / 25) [(1, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((-56128 : Rat) / 25) [(1, 1), (8, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 15. -/
theorem rs_R010_ueqv_R010YY_partial_15_0002_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_15_0002
        rs_R010_ueqv_R010YY_generator_15_0000_0012 =
      rs_R010_ueqv_R010YY_partial_15_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 15. -/
def rs_R010_ueqv_R010YY_coefficient_15_0003 : Poly :=
[
  term ((5718 : Rat) / 25) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 3 for generator 15. -/
def rs_R010_ueqv_R010YY_partial_15_0003 : Poly :=
[
  term ((-11436 : Rat) / 25) [(1, 1), (2, 1), (4, 1), (15, 1), (16, 1)],
  term ((5718 : Rat) / 25) [(1, 1), (2, 2), (15, 1), (16, 1)],
  term ((-11436 : Rat) / 25) [(1, 1), (3, 1), (5, 1), (15, 1), (16, 1)],
  term ((5718 : Rat) / 25) [(1, 1), (3, 2), (15, 1), (16, 1)],
  term ((11436 : Rat) / 25) [(1, 1), (4, 1), (14, 1), (15, 1), (16, 1)],
  term ((11436 : Rat) / 25) [(1, 1), (5, 1), (15, 2), (16, 1)],
  term ((-5718 : Rat) / 25) [(1, 1), (14, 2), (15, 1), (16, 1)],
  term ((-5718 : Rat) / 25) [(1, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 15. -/
theorem rs_R010_ueqv_R010YY_partial_15_0003_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_15_0003
        rs_R010_ueqv_R010YY_generator_15_0000_0012 =
      rs_R010_ueqv_R010YY_partial_15_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 15. -/
def rs_R010_ueqv_R010YY_coefficient_15_0004 : Poly :=
[
  term ((-1792 : Rat) / 25) [(6, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 4 for generator 15. -/
def rs_R010_ueqv_R010YY_partial_15_0004 : Poly :=
[
  term ((3584 : Rat) / 25) [(2, 1), (4, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-1792 : Rat) / 25) [(2, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((3584 : Rat) / 25) [(3, 1), (5, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-1792 : Rat) / 25) [(3, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-3584 : Rat) / 25) [(4, 1), (6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3584 : Rat) / 25) [(5, 1), (6, 1), (9, 1), (15, 2), (16, 1)],
  term ((1792 : Rat) / 25) [(6, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((1792 : Rat) / 25) [(6, 1), (9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 15. -/
theorem rs_R010_ueqv_R010YY_partial_15_0004_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_15_0004
        rs_R010_ueqv_R010YY_generator_15_0000_0012 =
      rs_R010_ueqv_R010YY_partial_15_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 15. -/
def rs_R010_ueqv_R010YY_coefficient_15_0005 : Poly :=
[
  term ((-1792 : Rat) / 25) [(6, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 5 for generator 15. -/
def rs_R010_ueqv_R010YY_partial_15_0005 : Poly :=
[
  term ((3584 : Rat) / 25) [(2, 1), (4, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1792 : Rat) / 25) [(2, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((3584 : Rat) / 25) [(3, 1), (5, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1792 : Rat) / 25) [(3, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3584 : Rat) / 25) [(4, 1), (6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3584 : Rat) / 25) [(5, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((1792 : Rat) / 25) [(6, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((1792 : Rat) / 25) [(6, 1), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 15. -/
theorem rs_R010_ueqv_R010YY_partial_15_0005_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_15_0005
        rs_R010_ueqv_R010YY_generator_15_0000_0012 =
      rs_R010_ueqv_R010YY_partial_15_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 15. -/
def rs_R010_ueqv_R010YY_coefficient_15_0006 : Poly :=
[
  term ((1344 : Rat) / 25) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 6 for generator 15. -/
def rs_R010_ueqv_R010YY_partial_15_0006 : Poly :=
[
  term ((-2688 : Rat) / 25) [(2, 1), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((1344 : Rat) / 25) [(2, 2), (7, 1), (15, 1), (16, 1)],
  term ((-2688 : Rat) / 25) [(3, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((1344 : Rat) / 25) [(3, 2), (7, 1), (15, 1), (16, 1)],
  term ((2688 : Rat) / 25) [(4, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((2688 : Rat) / 25) [(5, 1), (7, 1), (15, 2), (16, 1)],
  term ((-1344 : Rat) / 25) [(7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1344 : Rat) / 25) [(7, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 15. -/
theorem rs_R010_ueqv_R010YY_partial_15_0006_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_15_0006
        rs_R010_ueqv_R010YY_generator_15_0000_0012 =
      rs_R010_ueqv_R010YY_partial_15_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 15. -/
def rs_R010_ueqv_R010YY_coefficient_15_0007 : Poly :=
[
  term ((1792 : Rat) / 25) [(8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 7 for generator 15. -/
def rs_R010_ueqv_R010YY_partial_15_0007 : Poly :=
[
  term ((-3584 : Rat) / 25) [(2, 1), (4, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((1792 : Rat) / 25) [(2, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-3584 : Rat) / 25) [(3, 1), (5, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((1792 : Rat) / 25) [(3, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((3584 : Rat) / 25) [(4, 1), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((3584 : Rat) / 25) [(5, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((-1792 : Rat) / 25) [(8, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1792 : Rat) / 25) [(8, 1), (9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 15. -/
theorem rs_R010_ueqv_R010YY_partial_15_0007_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_15_0007
        rs_R010_ueqv_R010YY_generator_15_0000_0012 =
      rs_R010_ueqv_R010YY_partial_15_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 15. -/
def rs_R010_ueqv_R010YY_coefficient_15_0008 : Poly :=
[
  term ((1792 : Rat) / 25) [(8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 8 for generator 15. -/
def rs_R010_ueqv_R010YY_partial_15_0008 : Poly :=
[
  term ((-3584 : Rat) / 25) [(2, 1), (4, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((1792 : Rat) / 25) [(2, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3584 : Rat) / 25) [(3, 1), (5, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((1792 : Rat) / 25) [(3, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((3584 : Rat) / 25) [(4, 1), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((3584 : Rat) / 25) [(5, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((-1792 : Rat) / 25) [(8, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1792 : Rat) / 25) [(8, 1), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 15. -/
theorem rs_R010_ueqv_R010YY_partial_15_0008_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_15_0008
        rs_R010_ueqv_R010YY_generator_15_0000_0012 =
      rs_R010_ueqv_R010YY_partial_15_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 15. -/
def rs_R010_ueqv_R010YY_coefficient_15_0009 : Poly :=
[
  term ((-28064 : Rat) / 25) [(8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 9 for generator 15. -/
def rs_R010_ueqv_R010YY_partial_15_0009 : Poly :=
[
  term ((56128 : Rat) / 25) [(2, 1), (4, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-28064 : Rat) / 25) [(2, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((56128 : Rat) / 25) [(3, 1), (5, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-28064 : Rat) / 25) [(3, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-56128 : Rat) / 25) [(4, 1), (8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-56128 : Rat) / 25) [(5, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((28064 : Rat) / 25) [(8, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((28064 : Rat) / 25) [(8, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 15. -/
theorem rs_R010_ueqv_R010YY_partial_15_0009_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_15_0009
        rs_R010_ueqv_R010YY_generator_15_0000_0012 =
      rs_R010_ueqv_R010YY_partial_15_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 15. -/
def rs_R010_ueqv_R010YY_coefficient_15_0010 : Poly :=
[
  term ((12688 : Rat) / 25) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 10 for generator 15. -/
def rs_R010_ueqv_R010YY_partial_15_0010 : Poly :=
[
  term ((-25376 : Rat) / 25) [(2, 1), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((12688 : Rat) / 25) [(2, 2), (9, 1), (15, 1), (16, 1)],
  term ((-25376 : Rat) / 25) [(3, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((12688 : Rat) / 25) [(3, 2), (9, 1), (15, 1), (16, 1)],
  term ((25376 : Rat) / 25) [(4, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((25376 : Rat) / 25) [(5, 1), (9, 1), (15, 2), (16, 1)],
  term ((-12688 : Rat) / 25) [(9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-12688 : Rat) / 25) [(9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 15. -/
theorem rs_R010_ueqv_R010YY_partial_15_0010_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_15_0010
        rs_R010_ueqv_R010YY_generator_15_0000_0012 =
      rs_R010_ueqv_R010YY_partial_15_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 15. -/
def rs_R010_ueqv_R010YY_coefficient_15_0011 : Poly :=
[
  term ((11436 : Rat) / 25) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 11 for generator 15. -/
def rs_R010_ueqv_R010YY_partial_15_0011 : Poly :=
[
  term ((-22872 : Rat) / 25) [(2, 1), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((11436 : Rat) / 25) [(2, 2), (11, 1), (15, 1), (16, 1)],
  term ((-22872 : Rat) / 25) [(3, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((11436 : Rat) / 25) [(3, 2), (11, 1), (15, 1), (16, 1)],
  term ((22872 : Rat) / 25) [(4, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((22872 : Rat) / 25) [(5, 1), (11, 1), (15, 2), (16, 1)],
  term ((-11436 : Rat) / 25) [(11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-11436 : Rat) / 25) [(11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 15. -/
theorem rs_R010_ueqv_R010YY_partial_15_0011_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_15_0011
        rs_R010_ueqv_R010YY_generator_15_0000_0012 =
      rs_R010_ueqv_R010YY_partial_15_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 15. -/
def rs_R010_ueqv_R010YY_coefficient_15_0012 : Poly :=
[
  term ((-5718 : Rat) / 25) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 12 for generator 15. -/
def rs_R010_ueqv_R010YY_partial_15_0012 : Poly :=
[
  term ((11436 : Rat) / 25) [(2, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5718 : Rat) / 25) [(2, 2), (13, 1), (15, 1), (16, 1)],
  term ((11436 : Rat) / 25) [(3, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5718 : Rat) / 25) [(3, 2), (13, 1), (15, 1), (16, 1)],
  term ((-11436 : Rat) / 25) [(4, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-11436 : Rat) / 25) [(5, 1), (13, 1), (15, 2), (16, 1)],
  term ((5718 : Rat) / 25) [(13, 1), (14, 2), (15, 1), (16, 1)],
  term ((5718 : Rat) / 25) [(13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 15. -/
theorem rs_R010_ueqv_R010YY_partial_15_0012_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_15_0012
        rs_R010_ueqv_R010YY_generator_15_0000_0012 =
      rs_R010_ueqv_R010YY_partial_15_0012 := by
  native_decide

/-- Partial products in this block. -/
def rs_R010_ueqv_R010YY_partials_15_0000_0012 : List Poly :=
[
  rs_R010_ueqv_R010YY_partial_15_0000,
  rs_R010_ueqv_R010YY_partial_15_0001,
  rs_R010_ueqv_R010YY_partial_15_0002,
  rs_R010_ueqv_R010YY_partial_15_0003,
  rs_R010_ueqv_R010YY_partial_15_0004,
  rs_R010_ueqv_R010YY_partial_15_0005,
  rs_R010_ueqv_R010YY_partial_15_0006,
  rs_R010_ueqv_R010YY_partial_15_0007,
  rs_R010_ueqv_R010YY_partial_15_0008,
  rs_R010_ueqv_R010YY_partial_15_0009,
  rs_R010_ueqv_R010YY_partial_15_0010,
  rs_R010_ueqv_R010YY_partial_15_0011,
  rs_R010_ueqv_R010YY_partial_15_0012
]

/-- Sum of partial products in this block. -/
def rs_R010_ueqv_R010YY_block_15_0000_0012 : Poly :=
[
  term ((112256 : Rat) / 25) [(0, 1), (2, 1), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((45744 : Rat) / 25) [(0, 1), (2, 1), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((-56128 : Rat) / 25) [(0, 1), (2, 2), (9, 1), (15, 1), (16, 1)],
  term ((-22872 : Rat) / 25) [(0, 1), (2, 2), (11, 1), (15, 1), (16, 1)],
  term ((112256 : Rat) / 25) [(0, 1), (3, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((45744 : Rat) / 25) [(0, 1), (3, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((-56128 : Rat) / 25) [(0, 1), (3, 2), (9, 1), (15, 1), (16, 1)],
  term ((-22872 : Rat) / 25) [(0, 1), (3, 2), (11, 1), (15, 1), (16, 1)],
  term ((-112256 : Rat) / 25) [(0, 1), (4, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-45744 : Rat) / 25) [(0, 1), (4, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-112256 : Rat) / 25) [(0, 1), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((-45744 : Rat) / 25) [(0, 1), (5, 1), (11, 1), (15, 2), (16, 1)],
  term ((56128 : Rat) / 25) [(0, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((56128 : Rat) / 25) [(0, 1), (9, 1), (15, 3), (16, 1)],
  term ((22872 : Rat) / 25) [(0, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((22872 : Rat) / 25) [(0, 1), (11, 1), (15, 3), (16, 1)],
  term ((-112256 : Rat) / 25) [(1, 1), (2, 1), (4, 1), (8, 1), (15, 1), (16, 1)],
  term ((-11436 : Rat) / 25) [(1, 1), (2, 1), (4, 1), (15, 1), (16, 1)],
  term ((56128 : Rat) / 25) [(1, 1), (2, 2), (8, 1), (15, 1), (16, 1)],
  term ((5718 : Rat) / 25) [(1, 1), (2, 2), (15, 1), (16, 1)],
  term ((-112256 : Rat) / 25) [(1, 1), (3, 1), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-11436 : Rat) / 25) [(1, 1), (3, 1), (5, 1), (15, 1), (16, 1)],
  term ((56128 : Rat) / 25) [(1, 1), (3, 2), (8, 1), (15, 1), (16, 1)],
  term ((5718 : Rat) / 25) [(1, 1), (3, 2), (15, 1), (16, 1)],
  term ((112256 : Rat) / 25) [(1, 1), (4, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((11436 : Rat) / 25) [(1, 1), (4, 1), (14, 1), (15, 1), (16, 1)],
  term ((112256 : Rat) / 25) [(1, 1), (5, 1), (8, 1), (15, 2), (16, 1)],
  term ((11436 : Rat) / 25) [(1, 1), (5, 1), (15, 2), (16, 1)],
  term ((-56128 : Rat) / 25) [(1, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((-56128 : Rat) / 25) [(1, 1), (8, 1), (15, 3), (16, 1)],
  term ((-5718 : Rat) / 25) [(1, 1), (14, 2), (15, 1), (16, 1)],
  term ((-5718 : Rat) / 25) [(1, 1), (15, 3), (16, 1)],
  term ((3584 : Rat) / 25) [(2, 1), (4, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((3584 : Rat) / 25) [(2, 1), (4, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-2688 : Rat) / 25) [(2, 1), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((-3584 : Rat) / 25) [(2, 1), (4, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-3584 : Rat) / 25) [(2, 1), (4, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((56128 : Rat) / 25) [(2, 1), (4, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-25376 : Rat) / 25) [(2, 1), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((-22872 : Rat) / 25) [(2, 1), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((11436 : Rat) / 25) [(2, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1792 : Rat) / 25) [(2, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-1792 : Rat) / 25) [(2, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((1344 : Rat) / 25) [(2, 2), (7, 1), (15, 1), (16, 1)],
  term ((1792 : Rat) / 25) [(2, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((1792 : Rat) / 25) [(2, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-28064 : Rat) / 25) [(2, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((12688 : Rat) / 25) [(2, 2), (9, 1), (15, 1), (16, 1)],
  term ((11436 : Rat) / 25) [(2, 2), (11, 1), (15, 1), (16, 1)],
  term ((-5718 : Rat) / 25) [(2, 2), (13, 1), (15, 1), (16, 1)],
  term ((3584 : Rat) / 25) [(3, 1), (5, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((3584 : Rat) / 25) [(3, 1), (5, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-2688 : Rat) / 25) [(3, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-3584 : Rat) / 25) [(3, 1), (5, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-3584 : Rat) / 25) [(3, 1), (5, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((56128 : Rat) / 25) [(3, 1), (5, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-25376 : Rat) / 25) [(3, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((-22872 : Rat) / 25) [(3, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((11436 : Rat) / 25) [(3, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1792 : Rat) / 25) [(3, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-1792 : Rat) / 25) [(3, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((1344 : Rat) / 25) [(3, 2), (7, 1), (15, 1), (16, 1)],
  term ((1792 : Rat) / 25) [(3, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((1792 : Rat) / 25) [(3, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-28064 : Rat) / 25) [(3, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((12688 : Rat) / 25) [(3, 2), (9, 1), (15, 1), (16, 1)],
  term ((11436 : Rat) / 25) [(3, 2), (11, 1), (15, 1), (16, 1)],
  term ((-5718 : Rat) / 25) [(3, 2), (13, 1), (15, 1), (16, 1)],
  term ((-3584 : Rat) / 25) [(4, 1), (6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3584 : Rat) / 25) [(4, 1), (6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((2688 : Rat) / 25) [(4, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((3584 : Rat) / 25) [(4, 1), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((3584 : Rat) / 25) [(4, 1), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-56128 : Rat) / 25) [(4, 1), (8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((25376 : Rat) / 25) [(4, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((22872 : Rat) / 25) [(4, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-11436 : Rat) / 25) [(4, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3584 : Rat) / 25) [(5, 1), (6, 1), (9, 1), (15, 2), (16, 1)],
  term ((-3584 : Rat) / 25) [(5, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((2688 : Rat) / 25) [(5, 1), (7, 1), (15, 2), (16, 1)],
  term ((3584 : Rat) / 25) [(5, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((3584 : Rat) / 25) [(5, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((-56128 : Rat) / 25) [(5, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((25376 : Rat) / 25) [(5, 1), (9, 1), (15, 2), (16, 1)],
  term ((22872 : Rat) / 25) [(5, 1), (11, 1), (15, 2), (16, 1)],
  term ((-11436 : Rat) / 25) [(5, 1), (13, 1), (15, 2), (16, 1)],
  term ((1792 : Rat) / 25) [(6, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((1792 : Rat) / 25) [(6, 1), (9, 1), (15, 3), (16, 1)],
  term ((1792 : Rat) / 25) [(6, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((1792 : Rat) / 25) [(6, 1), (11, 1), (15, 3), (16, 1)],
  term ((-1344 : Rat) / 25) [(7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1344 : Rat) / 25) [(7, 1), (15, 3), (16, 1)],
  term ((-1792 : Rat) / 25) [(8, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1792 : Rat) / 25) [(8, 1), (9, 1), (15, 3), (16, 1)],
  term ((-1792 : Rat) / 25) [(8, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1792 : Rat) / 25) [(8, 1), (11, 1), (15, 3), (16, 1)],
  term ((28064 : Rat) / 25) [(8, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((28064 : Rat) / 25) [(8, 1), (13, 1), (15, 3), (16, 1)],
  term ((-12688 : Rat) / 25) [(9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-12688 : Rat) / 25) [(9, 1), (15, 3), (16, 1)],
  term ((-11436 : Rat) / 25) [(11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-11436 : Rat) / 25) [(11, 1), (15, 3), (16, 1)],
  term ((5718 : Rat) / 25) [(13, 1), (14, 2), (15, 1), (16, 1)],
  term ((5718 : Rat) / 25) [(13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 15, terms 0 through 12. -/
theorem rs_R010_ueqv_R010YY_block_15_0000_0012_valid :
    checkProductSumEq rs_R010_ueqv_R010YY_partials_15_0000_0012
      rs_R010_ueqv_R010YY_block_15_0000_0012 = true := by
  native_decide

end R010UeqvR010YYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
