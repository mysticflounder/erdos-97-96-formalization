/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R010:u=v:R010YY, term block 17:0-28

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R010UeqvR010YYTermShards

/-- Generator polynomial 17 for relaxed split surplus certificate `R010:u=v:R010YY`. -/
def rs_R010_ueqv_R010YY_generator_17_0000_0028 : Poly :=
[
  term (-2 : Rat) [(0, 1), (6, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (7, 1)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(4, 1), (6, 1)],
  term (-1 : Rat) [(4, 2)],
  term (2 : Rat) [(5, 1), (7, 1)],
  term (-1 : Rat) [(5, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 17. -/
def rs_R010_ueqv_R010YY_coefficient_17_0000 : Poly :=
[
  term ((-28064 : Rat) / 25) [(0, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 0 for generator 17. -/
def rs_R010_ueqv_R010YY_partial_17_0000 : Poly :=
[
  term ((56128 : Rat) / 25) [(0, 1), (1, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-28064 : Rat) / 25) [(0, 1), (1, 2), (9, 1), (15, 1), (16, 1)],
  term ((-56128 : Rat) / 25) [(0, 1), (4, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((28064 : Rat) / 25) [(0, 1), (4, 2), (9, 1), (15, 1), (16, 1)],
  term ((-56128 : Rat) / 25) [(0, 1), (5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((28064 : Rat) / 25) [(0, 1), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((56128 : Rat) / 25) [(0, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-28064 : Rat) / 25) [(0, 3), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 17. -/
theorem rs_R010_ueqv_R010YY_partial_17_0000_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_17_0000
        rs_R010_ueqv_R010YY_generator_17_0000_0028 =
      rs_R010_ueqv_R010YY_partial_17_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 17. -/
def rs_R010_ueqv_R010YY_coefficient_17_0001 : Poly :=
[
  term ((-11436 : Rat) / 25) [(0, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 1 for generator 17. -/
def rs_R010_ueqv_R010YY_partial_17_0001 : Poly :=
[
  term ((22872 : Rat) / 25) [(0, 1), (1, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-11436 : Rat) / 25) [(0, 1), (1, 2), (11, 1), (15, 1), (16, 1)],
  term ((-22872 : Rat) / 25) [(0, 1), (4, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((11436 : Rat) / 25) [(0, 1), (4, 2), (11, 1), (15, 1), (16, 1)],
  term ((-22872 : Rat) / 25) [(0, 1), (5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((11436 : Rat) / 25) [(0, 1), (5, 2), (11, 1), (15, 1), (16, 1)],
  term ((22872 : Rat) / 25) [(0, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-11436 : Rat) / 25) [(0, 3), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 17. -/
theorem rs_R010_ueqv_R010YY_partial_17_0001_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_17_0001
        rs_R010_ueqv_R010YY_generator_17_0000_0028 =
      rs_R010_ueqv_R010YY_partial_17_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 17. -/
def rs_R010_ueqv_R010YY_coefficient_17_0002 : Poly :=
[
  term ((28064 : Rat) / 25) [(1, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 2 for generator 17. -/
def rs_R010_ueqv_R010YY_partial_17_0002 : Poly :=
[
  term ((-56128 : Rat) / 25) [(0, 1), (1, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((28064 : Rat) / 25) [(0, 2), (1, 1), (8, 1), (15, 1), (16, 1)],
  term ((56128 : Rat) / 25) [(1, 1), (4, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((-28064 : Rat) / 25) [(1, 1), (4, 2), (8, 1), (15, 1), (16, 1)],
  term ((56128 : Rat) / 25) [(1, 1), (5, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-28064 : Rat) / 25) [(1, 1), (5, 2), (8, 1), (15, 1), (16, 1)],
  term ((-56128 : Rat) / 25) [(1, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((28064 : Rat) / 25) [(1, 3), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 17. -/
theorem rs_R010_ueqv_R010YY_partial_17_0002_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_17_0002
        rs_R010_ueqv_R010YY_generator_17_0000_0028 =
      rs_R010_ueqv_R010YY_partial_17_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 17. -/
def rs_R010_ueqv_R010YY_coefficient_17_0003 : Poly :=
[
  term ((-5718 : Rat) / 25) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 3 for generator 17. -/
def rs_R010_ueqv_R010YY_partial_17_0003 : Poly :=
[
  term ((11436 : Rat) / 25) [(0, 1), (1, 1), (6, 1), (15, 1), (16, 1)],
  term ((-5718 : Rat) / 25) [(0, 2), (1, 1), (15, 1), (16, 1)],
  term ((-11436 : Rat) / 25) [(1, 1), (4, 1), (6, 1), (15, 1), (16, 1)],
  term ((5718 : Rat) / 25) [(1, 1), (4, 2), (15, 1), (16, 1)],
  term ((-11436 : Rat) / 25) [(1, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((5718 : Rat) / 25) [(1, 1), (5, 2), (15, 1), (16, 1)],
  term ((11436 : Rat) / 25) [(1, 2), (7, 1), (15, 1), (16, 1)],
  term ((-5718 : Rat) / 25) [(1, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 17. -/
theorem rs_R010_ueqv_R010YY_partial_17_0003_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_17_0003
        rs_R010_ueqv_R010YY_generator_17_0000_0028 =
      rs_R010_ueqv_R010YY_partial_17_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 17. -/
def rs_R010_ueqv_R010YY_coefficient_17_0004 : Poly :=
[
  term ((896 : Rat) / 25) [(3, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 4 for generator 17. -/
def rs_R010_ueqv_R010YY_partial_17_0004 : Poly :=
[
  term ((-1792 : Rat) / 25) [(0, 1), (3, 1), (6, 2), (15, 1), (16, 1)],
  term ((896 : Rat) / 25) [(0, 2), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((-1792 : Rat) / 25) [(1, 1), (3, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((896 : Rat) / 25) [(1, 2), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((1792 : Rat) / 25) [(3, 1), (4, 1), (6, 2), (15, 1), (16, 1)],
  term ((-896 : Rat) / 25) [(3, 1), (4, 2), (6, 1), (15, 1), (16, 1)],
  term ((1792 : Rat) / 25) [(3, 1), (5, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-896 : Rat) / 25) [(3, 1), (5, 2), (6, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 17. -/
theorem rs_R010_ueqv_R010YY_partial_17_0004_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_17_0004
        rs_R010_ueqv_R010YY_generator_17_0000_0028 =
      rs_R010_ueqv_R010YY_partial_17_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 17. -/
def rs_R010_ueqv_R010YY_coefficient_17_0005 : Poly :=
[
  term ((1792 : Rat) / 25) [(3, 1), (7, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 5 for generator 17. -/
def rs_R010_ueqv_R010YY_partial_17_0005 : Poly :=
[
  term ((-3584 : Rat) / 25) [(0, 1), (3, 1), (6, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((1792 : Rat) / 25) [(0, 2), (3, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-3584 : Rat) / 25) [(1, 1), (3, 1), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((1792 : Rat) / 25) [(1, 2), (3, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((3584 : Rat) / 25) [(3, 1), (4, 1), (6, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-1792 : Rat) / 25) [(3, 1), (4, 2), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((3584 : Rat) / 25) [(3, 1), (5, 1), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((-1792 : Rat) / 25) [(3, 1), (5, 2), (7, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 17. -/
theorem rs_R010_ueqv_R010YY_partial_17_0005_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_17_0005
        rs_R010_ueqv_R010YY_generator_17_0000_0028 =
      rs_R010_ueqv_R010YY_partial_17_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 17. -/
def rs_R010_ueqv_R010YY_coefficient_17_0006 : Poly :=
[
  term ((1792 : Rat) / 25) [(3, 1), (7, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 6 for generator 17. -/
def rs_R010_ueqv_R010YY_partial_17_0006 : Poly :=
[
  term ((-3584 : Rat) / 25) [(0, 1), (3, 1), (6, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((1792 : Rat) / 25) [(0, 2), (3, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3584 : Rat) / 25) [(1, 1), (3, 1), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((1792 : Rat) / 25) [(1, 2), (3, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((3584 : Rat) / 25) [(3, 1), (4, 1), (6, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1792 : Rat) / 25) [(3, 1), (4, 2), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((3584 : Rat) / 25) [(3, 1), (5, 1), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((-1792 : Rat) / 25) [(3, 1), (5, 2), (7, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 17. -/
theorem rs_R010_ueqv_R010YY_partial_17_0006_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_17_0006
        rs_R010_ueqv_R010YY_generator_17_0000_0028 =
      rs_R010_ueqv_R010YY_partial_17_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 17. -/
def rs_R010_ueqv_R010YY_coefficient_17_0007 : Poly :=
[
  term ((-1792 : Rat) / 25) [(3, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 7 for generator 17. -/
def rs_R010_ueqv_R010YY_partial_17_0007 : Poly :=
[
  term ((3584 : Rat) / 25) [(0, 1), (3, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1792 : Rat) / 25) [(0, 2), (3, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((3584 : Rat) / 25) [(1, 1), (3, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1792 : Rat) / 25) [(1, 2), (3, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3584 : Rat) / 25) [(3, 1), (4, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((1792 : Rat) / 25) [(3, 1), (4, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3584 : Rat) / 25) [(3, 1), (5, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((1792 : Rat) / 25) [(3, 1), (5, 2), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 17. -/
theorem rs_R010_ueqv_R010YY_partial_17_0007_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_17_0007
        rs_R010_ueqv_R010YY_generator_17_0000_0028 =
      rs_R010_ueqv_R010YY_partial_17_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 17. -/
def rs_R010_ueqv_R010YY_coefficient_17_0008 : Poly :=
[
  term ((-1792 : Rat) / 25) [(3, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 8 for generator 17. -/
def rs_R010_ueqv_R010YY_partial_17_0008 : Poly :=
[
  term ((3584 : Rat) / 25) [(0, 1), (3, 1), (6, 1), (9, 2), (15, 1), (16, 1)],
  term ((-1792 : Rat) / 25) [(0, 2), (3, 1), (9, 2), (15, 1), (16, 1)],
  term ((3584 : Rat) / 25) [(1, 1), (3, 1), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((-1792 : Rat) / 25) [(1, 2), (3, 1), (9, 2), (15, 1), (16, 1)],
  term ((-3584 : Rat) / 25) [(3, 1), (4, 1), (6, 1), (9, 2), (15, 1), (16, 1)],
  term ((1792 : Rat) / 25) [(3, 1), (4, 2), (9, 2), (15, 1), (16, 1)],
  term ((-3584 : Rat) / 25) [(3, 1), (5, 1), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((1792 : Rat) / 25) [(3, 1), (5, 2), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 17. -/
theorem rs_R010_ueqv_R010YY_partial_17_0008_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_17_0008
        rs_R010_ueqv_R010YY_generator_17_0000_0028 =
      rs_R010_ueqv_R010YY_partial_17_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 17. -/
def rs_R010_ueqv_R010YY_coefficient_17_0009 : Poly :=
[
  term ((7036 : Rat) / 25) [(3, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 9 for generator 17. -/
def rs_R010_ueqv_R010YY_partial_17_0009 : Poly :=
[
  term ((-14072 : Rat) / 25) [(0, 1), (3, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((7036 : Rat) / 25) [(0, 2), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((-14072 : Rat) / 25) [(1, 1), (3, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((7036 : Rat) / 25) [(1, 2), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((14072 : Rat) / 25) [(3, 1), (4, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((-7036 : Rat) / 25) [(3, 1), (4, 2), (10, 1), (15, 1), (16, 1)],
  term ((14072 : Rat) / 25) [(3, 1), (5, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-7036 : Rat) / 25) [(3, 1), (5, 2), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 17. -/
theorem rs_R010_ueqv_R010YY_partial_17_0009_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_17_0009
        rs_R010_ueqv_R010YY_generator_17_0000_0028 =
      rs_R010_ueqv_R010YY_partial_17_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 17. -/
def rs_R010_ueqv_R010YY_coefficient_17_0010 : Poly :=
[
  term ((7036 : Rat) / 25) [(3, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 10 for generator 17. -/
def rs_R010_ueqv_R010YY_partial_17_0010 : Poly :=
[
  term ((-14072 : Rat) / 25) [(0, 1), (3, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((7036 : Rat) / 25) [(0, 2), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((-14072 : Rat) / 25) [(1, 1), (3, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((7036 : Rat) / 25) [(1, 2), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((14072 : Rat) / 25) [(3, 1), (4, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7036 : Rat) / 25) [(3, 1), (4, 2), (14, 1), (15, 1), (16, 1)],
  term ((14072 : Rat) / 25) [(3, 1), (5, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7036 : Rat) / 25) [(3, 1), (5, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 17. -/
theorem rs_R010_ueqv_R010YY_partial_17_0010_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_17_0010
        rs_R010_ueqv_R010YY_generator_17_0000_0028 =
      rs_R010_ueqv_R010YY_partial_17_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 17. -/
def rs_R010_ueqv_R010YY_coefficient_17_0011 : Poly :=
[
  term ((-1228 : Rat) / 5) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 11 for generator 17. -/
def rs_R010_ueqv_R010YY_partial_17_0011 : Poly :=
[
  term ((2456 : Rat) / 5) [(0, 1), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((-1228 : Rat) / 5) [(0, 2), (3, 1), (15, 1), (16, 1)],
  term ((2456 : Rat) / 5) [(1, 1), (3, 1), (7, 1), (15, 1), (16, 1)],
  term ((-1228 : Rat) / 5) [(1, 2), (3, 1), (15, 1), (16, 1)],
  term ((-2456 : Rat) / 5) [(3, 1), (4, 1), (6, 1), (15, 1), (16, 1)],
  term ((1228 : Rat) / 5) [(3, 1), (4, 2), (15, 1), (16, 1)],
  term ((-2456 : Rat) / 5) [(3, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((1228 : Rat) / 5) [(3, 1), (5, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 17. -/
theorem rs_R010_ueqv_R010YY_partial_17_0011_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_17_0011
        rs_R010_ueqv_R010YY_generator_17_0000_0028 =
      rs_R010_ueqv_R010YY_partial_17_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 17. -/
def rs_R010_ueqv_R010YY_coefficient_17_0012 : Poly :=
[
  term ((-1792 : Rat) / 25) [(6, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 12 for generator 17. -/
def rs_R010_ueqv_R010YY_partial_17_0012 : Poly :=
[
  term ((3584 : Rat) / 25) [(0, 1), (6, 2), (9, 1), (15, 1), (16, 1)],
  term ((-1792 : Rat) / 25) [(0, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((3584 : Rat) / 25) [(1, 1), (6, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-1792 : Rat) / 25) [(1, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-3584 : Rat) / 25) [(4, 1), (6, 2), (9, 1), (15, 1), (16, 1)],
  term ((1792 : Rat) / 25) [(4, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-3584 : Rat) / 25) [(5, 1), (6, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((1792 : Rat) / 25) [(5, 2), (6, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 17. -/
theorem rs_R010_ueqv_R010YY_partial_17_0012_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_17_0012
        rs_R010_ueqv_R010YY_generator_17_0000_0028 =
      rs_R010_ueqv_R010YY_partial_17_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 17. -/
def rs_R010_ueqv_R010YY_coefficient_17_0013 : Poly :=
[
  term ((-3584 : Rat) / 25) [(6, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 13 for generator 17. -/
def rs_R010_ueqv_R010YY_partial_17_0013 : Poly :=
[
  term ((7168 : Rat) / 25) [(0, 1), (6, 2), (11, 1), (15, 1), (16, 1)],
  term ((-3584 : Rat) / 25) [(0, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((7168 : Rat) / 25) [(1, 1), (6, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3584 : Rat) / 25) [(1, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-7168 : Rat) / 25) [(4, 1), (6, 2), (11, 1), (15, 1), (16, 1)],
  term ((3584 : Rat) / 25) [(4, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-7168 : Rat) / 25) [(5, 1), (6, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((3584 : Rat) / 25) [(5, 2), (6, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 17. -/
theorem rs_R010_ueqv_R010YY_partial_17_0013_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_17_0013
        rs_R010_ueqv_R010YY_generator_17_0000_0028 =
      rs_R010_ueqv_R010YY_partial_17_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 17. -/
def rs_R010_ueqv_R010YY_coefficient_17_0014 : Poly :=
[
  term ((896 : Rat) / 25) [(7, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 14 for generator 17. -/
def rs_R010_ueqv_R010YY_partial_17_0014 : Poly :=
[
  term ((-1792 : Rat) / 25) [(0, 1), (6, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((896 : Rat) / 25) [(0, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-1792 : Rat) / 25) [(1, 1), (7, 2), (8, 1), (15, 1), (16, 1)],
  term ((896 : Rat) / 25) [(1, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((1792 : Rat) / 25) [(4, 1), (6, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-896 : Rat) / 25) [(4, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((1792 : Rat) / 25) [(5, 1), (7, 2), (8, 1), (15, 1), (16, 1)],
  term ((-896 : Rat) / 25) [(5, 2), (7, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 17. -/
theorem rs_R010_ueqv_R010YY_partial_17_0014_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_17_0014
        rs_R010_ueqv_R010YY_generator_17_0000_0028 =
      rs_R010_ueqv_R010YY_partial_17_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 17. -/
def rs_R010_ueqv_R010YY_coefficient_17_0015 : Poly :=
[
  term ((-1792 : Rat) / 25) [(7, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 15 for generator 17. -/
def rs_R010_ueqv_R010YY_partial_17_0015 : Poly :=
[
  term ((3584 : Rat) / 25) [(0, 1), (6, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-1792 : Rat) / 25) [(0, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((3584 : Rat) / 25) [(1, 1), (7, 2), (10, 1), (15, 1), (16, 1)],
  term ((-1792 : Rat) / 25) [(1, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-3584 : Rat) / 25) [(4, 1), (6, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((1792 : Rat) / 25) [(4, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-3584 : Rat) / 25) [(5, 1), (7, 2), (10, 1), (15, 1), (16, 1)],
  term ((1792 : Rat) / 25) [(5, 2), (7, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 17. -/
theorem rs_R010_ueqv_R010YY_partial_17_0015_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_17_0015
        rs_R010_ueqv_R010YY_generator_17_0000_0028 =
      rs_R010_ueqv_R010YY_partial_17_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 17. -/
def rs_R010_ueqv_R010YY_coefficient_17_0016 : Poly :=
[
  term ((-448 : Rat) / 25) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 16 for generator 17. -/
def rs_R010_ueqv_R010YY_partial_17_0016 : Poly :=
[
  term ((896 : Rat) / 25) [(0, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-448 : Rat) / 25) [(0, 2), (7, 1), (15, 1), (16, 1)],
  term ((896 : Rat) / 25) [(1, 1), (7, 2), (15, 1), (16, 1)],
  term ((-448 : Rat) / 25) [(1, 2), (7, 1), (15, 1), (16, 1)],
  term ((-896 : Rat) / 25) [(4, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((448 : Rat) / 25) [(4, 2), (7, 1), (15, 1), (16, 1)],
  term ((-896 : Rat) / 25) [(5, 1), (7, 2), (15, 1), (16, 1)],
  term ((448 : Rat) / 25) [(5, 2), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 17. -/
theorem rs_R010_ueqv_R010YY_partial_17_0016_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_17_0016
        rs_R010_ueqv_R010YY_generator_17_0000_0028 =
      rs_R010_ueqv_R010YY_partial_17_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 17. -/
def rs_R010_ueqv_R010YY_coefficient_17_0017 : Poly :=
[
  term ((896 : Rat) / 25) [(8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 17 for generator 17. -/
def rs_R010_ueqv_R010YY_partial_17_0017 : Poly :=
[
  term ((-1792 : Rat) / 25) [(0, 1), (6, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((896 : Rat) / 25) [(0, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-1792 : Rat) / 25) [(1, 1), (7, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((896 : Rat) / 25) [(1, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((1792 : Rat) / 25) [(4, 1), (6, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-896 : Rat) / 25) [(4, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((1792 : Rat) / 25) [(5, 1), (7, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-896 : Rat) / 25) [(5, 2), (8, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 17. -/
theorem rs_R010_ueqv_R010YY_partial_17_0017_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_17_0017
        rs_R010_ueqv_R010YY_generator_17_0000_0028 =
      rs_R010_ueqv_R010YY_partial_17_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 17. -/
def rs_R010_ueqv_R010YY_coefficient_17_0018 : Poly :=
[
  term ((1792 : Rat) / 25) [(8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 18 for generator 17. -/
def rs_R010_ueqv_R010YY_partial_17_0018 : Poly :=
[
  term ((-3584 : Rat) / 25) [(0, 1), (6, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((1792 : Rat) / 25) [(0, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3584 : Rat) / 25) [(1, 1), (7, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((1792 : Rat) / 25) [(1, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((3584 : Rat) / 25) [(4, 1), (6, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1792 : Rat) / 25) [(4, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((3584 : Rat) / 25) [(5, 1), (7, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1792 : Rat) / 25) [(5, 2), (8, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 17. -/
theorem rs_R010_ueqv_R010YY_partial_17_0018_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_17_0018
        rs_R010_ueqv_R010YY_generator_17_0000_0028 =
      rs_R010_ueqv_R010YY_partial_17_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 17. -/
def rs_R010_ueqv_R010YY_coefficient_17_0019 : Poly :=
[
  term ((-28064 : Rat) / 25) [(8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 19 for generator 17. -/
def rs_R010_ueqv_R010YY_partial_17_0019 : Poly :=
[
  term ((56128 : Rat) / 25) [(0, 1), (6, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-28064 : Rat) / 25) [(0, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((56128 : Rat) / 25) [(1, 1), (7, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-28064 : Rat) / 25) [(1, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-56128 : Rat) / 25) [(4, 1), (6, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((28064 : Rat) / 25) [(4, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-56128 : Rat) / 25) [(5, 1), (7, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((28064 : Rat) / 25) [(5, 2), (8, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 17. -/
theorem rs_R010_ueqv_R010YY_partial_17_0019_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_17_0019
        rs_R010_ueqv_R010YY_generator_17_0000_0028 =
      rs_R010_ueqv_R010YY_partial_17_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 17. -/
def rs_R010_ueqv_R010YY_coefficient_17_0020 : Poly :=
[
  term ((28064 : Rat) / 25) [(8, 1), (15, 2), (16, 1)]
]

/-- Partial product 20 for generator 17. -/
def rs_R010_ueqv_R010YY_partial_17_0020 : Poly :=
[
  term ((-56128 : Rat) / 25) [(0, 1), (6, 1), (8, 1), (15, 2), (16, 1)],
  term ((28064 : Rat) / 25) [(0, 2), (8, 1), (15, 2), (16, 1)],
  term ((-56128 : Rat) / 25) [(1, 1), (7, 1), (8, 1), (15, 2), (16, 1)],
  term ((28064 : Rat) / 25) [(1, 2), (8, 1), (15, 2), (16, 1)],
  term ((56128 : Rat) / 25) [(4, 1), (6, 1), (8, 1), (15, 2), (16, 1)],
  term ((-28064 : Rat) / 25) [(4, 2), (8, 1), (15, 2), (16, 1)],
  term ((56128 : Rat) / 25) [(5, 1), (7, 1), (8, 1), (15, 2), (16, 1)],
  term ((-28064 : Rat) / 25) [(5, 2), (8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 17. -/
theorem rs_R010_ueqv_R010YY_partial_17_0020_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_17_0020
        rs_R010_ueqv_R010YY_generator_17_0000_0028 =
      rs_R010_ueqv_R010YY_partial_17_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 17. -/
def rs_R010_ueqv_R010YY_coefficient_17_0021 : Poly :=
[
  term ((1792 : Rat) / 25) [(9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 21 for generator 17. -/
def rs_R010_ueqv_R010YY_partial_17_0021 : Poly :=
[
  term ((-3584 : Rat) / 25) [(0, 1), (6, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((1792 : Rat) / 25) [(0, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-3584 : Rat) / 25) [(1, 1), (7, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((1792 : Rat) / 25) [(1, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((3584 : Rat) / 25) [(4, 1), (6, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-1792 : Rat) / 25) [(4, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((3584 : Rat) / 25) [(5, 1), (7, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-1792 : Rat) / 25) [(5, 2), (9, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 17. -/
theorem rs_R010_ueqv_R010YY_partial_17_0021_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_17_0021
        rs_R010_ueqv_R010YY_generator_17_0000_0028 =
      rs_R010_ueqv_R010YY_partial_17_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 17. -/
def rs_R010_ueqv_R010YY_coefficient_17_0022 : Poly :=
[
  term ((-26272 : Rat) / 25) [(9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 22 for generator 17. -/
def rs_R010_ueqv_R010YY_partial_17_0022 : Poly :=
[
  term ((52544 : Rat) / 25) [(0, 1), (6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-26272 : Rat) / 25) [(0, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((52544 : Rat) / 25) [(1, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-26272 : Rat) / 25) [(1, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-52544 : Rat) / 25) [(4, 1), (6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((26272 : Rat) / 25) [(4, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-52544 : Rat) / 25) [(5, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((26272 : Rat) / 25) [(5, 2), (9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 17. -/
theorem rs_R010_ueqv_R010YY_partial_17_0022_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_17_0022
        rs_R010_ueqv_R010YY_generator_17_0000_0028 =
      rs_R010_ueqv_R010YY_partial_17_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 17. -/
def rs_R010_ueqv_R010YY_coefficient_17_0023 : Poly :=
[
  term ((14032 : Rat) / 25) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 23 for generator 17. -/
def rs_R010_ueqv_R010YY_partial_17_0023 : Poly :=
[
  term ((-28064 : Rat) / 25) [(0, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((14032 : Rat) / 25) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((-28064 : Rat) / 25) [(1, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((14032 : Rat) / 25) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term ((28064 : Rat) / 25) [(4, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-14032 : Rat) / 25) [(4, 2), (9, 1), (15, 1), (16, 1)],
  term ((28064 : Rat) / 25) [(5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-14032 : Rat) / 25) [(5, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 17. -/
theorem rs_R010_ueqv_R010YY_partial_17_0023_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_17_0023
        rs_R010_ueqv_R010YY_generator_17_0000_0028 =
      rs_R010_ueqv_R010YY_partial_17_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 17. -/
def rs_R010_ueqv_R010YY_coefficient_17_0024 : Poly :=
[
  term ((-14072 : Rat) / 25) [(10, 1), (15, 2), (16, 1)]
]

/-- Partial product 24 for generator 17. -/
def rs_R010_ueqv_R010YY_partial_17_0024 : Poly :=
[
  term ((28144 : Rat) / 25) [(0, 1), (6, 1), (10, 1), (15, 2), (16, 1)],
  term ((-14072 : Rat) / 25) [(0, 2), (10, 1), (15, 2), (16, 1)],
  term ((28144 : Rat) / 25) [(1, 1), (7, 1), (10, 1), (15, 2), (16, 1)],
  term ((-14072 : Rat) / 25) [(1, 2), (10, 1), (15, 2), (16, 1)],
  term ((-28144 : Rat) / 25) [(4, 1), (6, 1), (10, 1), (15, 2), (16, 1)],
  term ((14072 : Rat) / 25) [(4, 2), (10, 1), (15, 2), (16, 1)],
  term ((-28144 : Rat) / 25) [(5, 1), (7, 1), (10, 1), (15, 2), (16, 1)],
  term ((14072 : Rat) / 25) [(5, 2), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 17. -/
theorem rs_R010_ueqv_R010YY_partial_17_0024_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_17_0024
        rs_R010_ueqv_R010YY_generator_17_0000_0028 =
      rs_R010_ueqv_R010YY_partial_17_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 17. -/
def rs_R010_ueqv_R010YY_coefficient_17_0025 : Poly :=
[
  term ((-23716 : Rat) / 25) [(11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 25 for generator 17. -/
def rs_R010_ueqv_R010YY_partial_17_0025 : Poly :=
[
  term ((47432 : Rat) / 25) [(0, 1), (6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-23716 : Rat) / 25) [(0, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((47432 : Rat) / 25) [(1, 1), (7, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-23716 : Rat) / 25) [(1, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-47432 : Rat) / 25) [(4, 1), (6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((23716 : Rat) / 25) [(4, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-47432 : Rat) / 25) [(5, 1), (7, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((23716 : Rat) / 25) [(5, 2), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 17. -/
theorem rs_R010_ueqv_R010YY_partial_17_0025_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_17_0025
        rs_R010_ueqv_R010YY_generator_17_0000_0028 =
      rs_R010_ueqv_R010YY_partial_17_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 17. -/
def rs_R010_ueqv_R010YY_coefficient_17_0026 : Poly :=
[
  term ((21094 : Rat) / 25) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 26 for generator 17. -/
def rs_R010_ueqv_R010YY_partial_17_0026 : Poly :=
[
  term ((-42188 : Rat) / 25) [(0, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((21094 : Rat) / 25) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((-42188 : Rat) / 25) [(1, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((21094 : Rat) / 25) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((42188 : Rat) / 25) [(4, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-21094 : Rat) / 25) [(4, 2), (11, 1), (15, 1), (16, 1)],
  term ((42188 : Rat) / 25) [(5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-21094 : Rat) / 25) [(5, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 17. -/
theorem rs_R010_ueqv_R010YY_partial_17_0026_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_17_0026
        rs_R010_ueqv_R010YY_generator_17_0000_0028 =
      rs_R010_ueqv_R010YY_partial_17_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 17. -/
def rs_R010_ueqv_R010YY_coefficient_17_0027 : Poly :=
[
  term ((-5718 : Rat) / 25) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 27 for generator 17. -/
def rs_R010_ueqv_R010YY_partial_17_0027 : Poly :=
[
  term ((11436 : Rat) / 25) [(0, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5718 : Rat) / 25) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((11436 : Rat) / 25) [(1, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5718 : Rat) / 25) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((-11436 : Rat) / 25) [(4, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((5718 : Rat) / 25) [(4, 2), (13, 1), (15, 1), (16, 1)],
  term ((-11436 : Rat) / 25) [(5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((5718 : Rat) / 25) [(5, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 17. -/
theorem rs_R010_ueqv_R010YY_partial_17_0027_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_17_0027
        rs_R010_ueqv_R010YY_generator_17_0000_0028 =
      rs_R010_ueqv_R010YY_partial_17_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 17. -/
def rs_R010_ueqv_R010YY_coefficient_17_0028 : Poly :=
[
  term ((2722 : Rat) / 5) [(15, 2), (16, 1)]
]

/-- Partial product 28 for generator 17. -/
def rs_R010_ueqv_R010YY_partial_17_0028 : Poly :=
[
  term ((-5444 : Rat) / 5) [(0, 1), (6, 1), (15, 2), (16, 1)],
  term ((2722 : Rat) / 5) [(0, 2), (15, 2), (16, 1)],
  term ((-5444 : Rat) / 5) [(1, 1), (7, 1), (15, 2), (16, 1)],
  term ((2722 : Rat) / 5) [(1, 2), (15, 2), (16, 1)],
  term ((5444 : Rat) / 5) [(4, 1), (6, 1), (15, 2), (16, 1)],
  term ((-2722 : Rat) / 5) [(4, 2), (15, 2), (16, 1)],
  term ((5444 : Rat) / 5) [(5, 1), (7, 1), (15, 2), (16, 1)],
  term ((-2722 : Rat) / 5) [(5, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 17. -/
theorem rs_R010_ueqv_R010YY_partial_17_0028_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_17_0028
        rs_R010_ueqv_R010YY_generator_17_0000_0028 =
      rs_R010_ueqv_R010YY_partial_17_0028 := by
  native_decide

/-- Partial products in this block. -/
def rs_R010_ueqv_R010YY_partials_17_0000_0028 : List Poly :=
[
  rs_R010_ueqv_R010YY_partial_17_0000,
  rs_R010_ueqv_R010YY_partial_17_0001,
  rs_R010_ueqv_R010YY_partial_17_0002,
  rs_R010_ueqv_R010YY_partial_17_0003,
  rs_R010_ueqv_R010YY_partial_17_0004,
  rs_R010_ueqv_R010YY_partial_17_0005,
  rs_R010_ueqv_R010YY_partial_17_0006,
  rs_R010_ueqv_R010YY_partial_17_0007,
  rs_R010_ueqv_R010YY_partial_17_0008,
  rs_R010_ueqv_R010YY_partial_17_0009,
  rs_R010_ueqv_R010YY_partial_17_0010,
  rs_R010_ueqv_R010YY_partial_17_0011,
  rs_R010_ueqv_R010YY_partial_17_0012,
  rs_R010_ueqv_R010YY_partial_17_0013,
  rs_R010_ueqv_R010YY_partial_17_0014,
  rs_R010_ueqv_R010YY_partial_17_0015,
  rs_R010_ueqv_R010YY_partial_17_0016,
  rs_R010_ueqv_R010YY_partial_17_0017,
  rs_R010_ueqv_R010YY_partial_17_0018,
  rs_R010_ueqv_R010YY_partial_17_0019,
  rs_R010_ueqv_R010YY_partial_17_0020,
  rs_R010_ueqv_R010YY_partial_17_0021,
  rs_R010_ueqv_R010YY_partial_17_0022,
  rs_R010_ueqv_R010YY_partial_17_0023,
  rs_R010_ueqv_R010YY_partial_17_0024,
  rs_R010_ueqv_R010YY_partial_17_0025,
  rs_R010_ueqv_R010YY_partial_17_0026,
  rs_R010_ueqv_R010YY_partial_17_0027,
  rs_R010_ueqv_R010YY_partial_17_0028
]

/-- Sum of partial products in this block. -/
def rs_R010_ueqv_R010YY_block_17_0000_0028 : Poly :=
[
  term ((-56128 : Rat) / 25) [(0, 1), (1, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((11436 : Rat) / 25) [(0, 1), (1, 1), (6, 1), (15, 1), (16, 1)],
  term ((56128 : Rat) / 25) [(0, 1), (1, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((22872 : Rat) / 25) [(0, 1), (1, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-28064 : Rat) / 25) [(0, 1), (1, 2), (9, 1), (15, 1), (16, 1)],
  term ((-11436 : Rat) / 25) [(0, 1), (1, 2), (11, 1), (15, 1), (16, 1)],
  term ((-3584 : Rat) / 25) [(0, 1), (3, 1), (6, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-3584 : Rat) / 25) [(0, 1), (3, 1), (6, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((3584 : Rat) / 25) [(0, 1), (3, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((3584 : Rat) / 25) [(0, 1), (3, 1), (6, 1), (9, 2), (15, 1), (16, 1)],
  term ((-14072 : Rat) / 25) [(0, 1), (3, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((-14072 : Rat) / 25) [(0, 1), (3, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((2456 : Rat) / 5) [(0, 1), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((-1792 : Rat) / 25) [(0, 1), (3, 1), (6, 2), (15, 1), (16, 1)],
  term ((-56128 : Rat) / 25) [(0, 1), (4, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-22872 : Rat) / 25) [(0, 1), (4, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((28064 : Rat) / 25) [(0, 1), (4, 2), (9, 1), (15, 1), (16, 1)],
  term ((11436 : Rat) / 25) [(0, 1), (4, 2), (11, 1), (15, 1), (16, 1)],
  term ((-56128 : Rat) / 25) [(0, 1), (5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-22872 : Rat) / 25) [(0, 1), (5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((28064 : Rat) / 25) [(0, 1), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((11436 : Rat) / 25) [(0, 1), (5, 2), (11, 1), (15, 1), (16, 1)],
  term ((-1792 : Rat) / 25) [(0, 1), (6, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((3584 : Rat) / 25) [(0, 1), (6, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((896 : Rat) / 25) [(0, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-1792 : Rat) / 25) [(0, 1), (6, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-3584 : Rat) / 25) [(0, 1), (6, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((56128 : Rat) / 25) [(0, 1), (6, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-56128 : Rat) / 25) [(0, 1), (6, 1), (8, 1), (15, 2), (16, 1)],
  term ((-3584 : Rat) / 25) [(0, 1), (6, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((52544 : Rat) / 25) [(0, 1), (6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-28064 : Rat) / 25) [(0, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((28144 : Rat) / 25) [(0, 1), (6, 1), (10, 1), (15, 2), (16, 1)],
  term ((47432 : Rat) / 25) [(0, 1), (6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-42188 : Rat) / 25) [(0, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((11436 : Rat) / 25) [(0, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5444 : Rat) / 5) [(0, 1), (6, 1), (15, 2), (16, 1)],
  term ((3584 : Rat) / 25) [(0, 1), (6, 2), (9, 1), (15, 1), (16, 1)],
  term ((7168 : Rat) / 25) [(0, 1), (6, 2), (11, 1), (15, 1), (16, 1)],
  term ((28064 : Rat) / 25) [(0, 2), (1, 1), (8, 1), (15, 1), (16, 1)],
  term ((-5718 : Rat) / 25) [(0, 2), (1, 1), (15, 1), (16, 1)],
  term ((896 : Rat) / 25) [(0, 2), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((1792 : Rat) / 25) [(0, 2), (3, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((1792 : Rat) / 25) [(0, 2), (3, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1792 : Rat) / 25) [(0, 2), (3, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1792 : Rat) / 25) [(0, 2), (3, 1), (9, 2), (15, 1), (16, 1)],
  term ((7036 : Rat) / 25) [(0, 2), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((7036 : Rat) / 25) [(0, 2), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1228 : Rat) / 5) [(0, 2), (3, 1), (15, 1), (16, 1)],
  term ((54336 : Rat) / 25) [(0, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((19288 : Rat) / 25) [(0, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((896 : Rat) / 25) [(0, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-1792 : Rat) / 25) [(0, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-448 : Rat) / 25) [(0, 2), (7, 1), (15, 1), (16, 1)],
  term ((896 : Rat) / 25) [(0, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((1792 : Rat) / 25) [(0, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-28064 : Rat) / 25) [(0, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((28064 : Rat) / 25) [(0, 2), (8, 1), (15, 2), (16, 1)],
  term ((1792 : Rat) / 25) [(0, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-26272 : Rat) / 25) [(0, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((14032 : Rat) / 25) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((-14072 : Rat) / 25) [(0, 2), (10, 1), (15, 2), (16, 1)],
  term ((-23716 : Rat) / 25) [(0, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((21094 : Rat) / 25) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((-5718 : Rat) / 25) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((2722 : Rat) / 5) [(0, 2), (15, 2), (16, 1)],
  term ((-28064 : Rat) / 25) [(0, 3), (9, 1), (15, 1), (16, 1)],
  term ((-11436 : Rat) / 25) [(0, 3), (11, 1), (15, 1), (16, 1)],
  term ((-1792 : Rat) / 25) [(1, 1), (3, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((3584 : Rat) / 25) [(1, 1), (3, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((3584 : Rat) / 25) [(1, 1), (3, 1), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((-14072 : Rat) / 25) [(1, 1), (3, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-14072 : Rat) / 25) [(1, 1), (3, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((2456 : Rat) / 5) [(1, 1), (3, 1), (7, 1), (15, 1), (16, 1)],
  term ((-3584 : Rat) / 25) [(1, 1), (3, 1), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((-3584 : Rat) / 25) [(1, 1), (3, 1), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((56128 : Rat) / 25) [(1, 1), (4, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((-11436 : Rat) / 25) [(1, 1), (4, 1), (6, 1), (15, 1), (16, 1)],
  term ((-28064 : Rat) / 25) [(1, 1), (4, 2), (8, 1), (15, 1), (16, 1)],
  term ((5718 : Rat) / 25) [(1, 1), (4, 2), (15, 1), (16, 1)],
  term ((56128 : Rat) / 25) [(1, 1), (5, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-11436 : Rat) / 25) [(1, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-28064 : Rat) / 25) [(1, 1), (5, 2), (8, 1), (15, 1), (16, 1)],
  term ((5718 : Rat) / 25) [(1, 1), (5, 2), (15, 1), (16, 1)],
  term ((3584 : Rat) / 25) [(1, 1), (6, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((7168 : Rat) / 25) [(1, 1), (6, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1792 : Rat) / 25) [(1, 1), (7, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-3584 : Rat) / 25) [(1, 1), (7, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((56128 : Rat) / 25) [(1, 1), (7, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-56128 : Rat) / 25) [(1, 1), (7, 1), (8, 1), (15, 2), (16, 1)],
  term ((-3584 : Rat) / 25) [(1, 1), (7, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((52544 : Rat) / 25) [(1, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-28064 : Rat) / 25) [(1, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((28144 : Rat) / 25) [(1, 1), (7, 1), (10, 1), (15, 2), (16, 1)],
  term ((47432 : Rat) / 25) [(1, 1), (7, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-42188 : Rat) / 25) [(1, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((11436 : Rat) / 25) [(1, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5444 : Rat) / 5) [(1, 1), (7, 1), (15, 2), (16, 1)],
  term ((-1792 : Rat) / 25) [(1, 1), (7, 2), (8, 1), (15, 1), (16, 1)],
  term ((3584 : Rat) / 25) [(1, 1), (7, 2), (10, 1), (15, 1), (16, 1)],
  term ((896 : Rat) / 25) [(1, 1), (7, 2), (15, 1), (16, 1)],
  term ((896 : Rat) / 25) [(1, 2), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((1792 : Rat) / 25) [(1, 2), (3, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((1792 : Rat) / 25) [(1, 2), (3, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1792 : Rat) / 25) [(1, 2), (3, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1792 : Rat) / 25) [(1, 2), (3, 1), (9, 2), (15, 1), (16, 1)],
  term ((7036 : Rat) / 25) [(1, 2), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((7036 : Rat) / 25) [(1, 2), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1228 : Rat) / 5) [(1, 2), (3, 1), (15, 1), (16, 1)],
  term ((-1792 : Rat) / 25) [(1, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-3584 : Rat) / 25) [(1, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-55232 : Rat) / 25) [(1, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-1792 : Rat) / 25) [(1, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((10988 : Rat) / 25) [(1, 2), (7, 1), (15, 1), (16, 1)],
  term ((896 : Rat) / 25) [(1, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((1792 : Rat) / 25) [(1, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-28064 : Rat) / 25) [(1, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((28064 : Rat) / 25) [(1, 2), (8, 1), (15, 2), (16, 1)],
  term ((1792 : Rat) / 25) [(1, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-26272 : Rat) / 25) [(1, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((14032 : Rat) / 25) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term ((-14072 : Rat) / 25) [(1, 2), (10, 1), (15, 2), (16, 1)],
  term ((-23716 : Rat) / 25) [(1, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((21094 : Rat) / 25) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((-5718 : Rat) / 25) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((2722 : Rat) / 5) [(1, 2), (15, 2), (16, 1)],
  term ((28064 : Rat) / 25) [(1, 3), (8, 1), (15, 1), (16, 1)],
  term ((-5718 : Rat) / 25) [(1, 3), (15, 1), (16, 1)],
  term ((3584 : Rat) / 25) [(3, 1), (4, 1), (6, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((3584 : Rat) / 25) [(3, 1), (4, 1), (6, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3584 : Rat) / 25) [(3, 1), (4, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3584 : Rat) / 25) [(3, 1), (4, 1), (6, 1), (9, 2), (15, 1), (16, 1)],
  term ((14072 : Rat) / 25) [(3, 1), (4, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((14072 : Rat) / 25) [(3, 1), (4, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2456 : Rat) / 5) [(3, 1), (4, 1), (6, 1), (15, 1), (16, 1)],
  term ((1792 : Rat) / 25) [(3, 1), (4, 1), (6, 2), (15, 1), (16, 1)],
  term ((-896 : Rat) / 25) [(3, 1), (4, 2), (6, 1), (15, 1), (16, 1)],
  term ((-1792 : Rat) / 25) [(3, 1), (4, 2), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-1792 : Rat) / 25) [(3, 1), (4, 2), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((1792 : Rat) / 25) [(3, 1), (4, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((1792 : Rat) / 25) [(3, 1), (4, 2), (9, 2), (15, 1), (16, 1)],
  term ((-7036 : Rat) / 25) [(3, 1), (4, 2), (10, 1), (15, 1), (16, 1)],
  term ((-7036 : Rat) / 25) [(3, 1), (4, 2), (14, 1), (15, 1), (16, 1)],
  term ((1228 : Rat) / 5) [(3, 1), (4, 2), (15, 1), (16, 1)],
  term ((1792 : Rat) / 25) [(3, 1), (5, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-3584 : Rat) / 25) [(3, 1), (5, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3584 : Rat) / 25) [(3, 1), (5, 1), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((14072 : Rat) / 25) [(3, 1), (5, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((14072 : Rat) / 25) [(3, 1), (5, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2456 : Rat) / 5) [(3, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((3584 : Rat) / 25) [(3, 1), (5, 1), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((3584 : Rat) / 25) [(3, 1), (5, 1), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((-896 : Rat) / 25) [(3, 1), (5, 2), (6, 1), (15, 1), (16, 1)],
  term ((-1792 : Rat) / 25) [(3, 1), (5, 2), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-1792 : Rat) / 25) [(3, 1), (5, 2), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((1792 : Rat) / 25) [(3, 1), (5, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((1792 : Rat) / 25) [(3, 1), (5, 2), (9, 2), (15, 1), (16, 1)],
  term ((-7036 : Rat) / 25) [(3, 1), (5, 2), (10, 1), (15, 1), (16, 1)],
  term ((-7036 : Rat) / 25) [(3, 1), (5, 2), (14, 1), (15, 1), (16, 1)],
  term ((1228 : Rat) / 5) [(3, 1), (5, 2), (15, 1), (16, 1)],
  term ((1792 : Rat) / 25) [(4, 1), (6, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-3584 : Rat) / 25) [(4, 1), (6, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-896 : Rat) / 25) [(4, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((1792 : Rat) / 25) [(4, 1), (6, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((3584 : Rat) / 25) [(4, 1), (6, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-56128 : Rat) / 25) [(4, 1), (6, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((56128 : Rat) / 25) [(4, 1), (6, 1), (8, 1), (15, 2), (16, 1)],
  term ((3584 : Rat) / 25) [(4, 1), (6, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-52544 : Rat) / 25) [(4, 1), (6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((28064 : Rat) / 25) [(4, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-28144 : Rat) / 25) [(4, 1), (6, 1), (10, 1), (15, 2), (16, 1)],
  term ((-47432 : Rat) / 25) [(4, 1), (6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((42188 : Rat) / 25) [(4, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-11436 : Rat) / 25) [(4, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((5444 : Rat) / 5) [(4, 1), (6, 1), (15, 2), (16, 1)],
  term ((-3584 : Rat) / 25) [(4, 1), (6, 2), (9, 1), (15, 1), (16, 1)],
  term ((-7168 : Rat) / 25) [(4, 1), (6, 2), (11, 1), (15, 1), (16, 1)],
  term ((1792 : Rat) / 25) [(4, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((3584 : Rat) / 25) [(4, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-896 : Rat) / 25) [(4, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((1792 : Rat) / 25) [(4, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((448 : Rat) / 25) [(4, 2), (7, 1), (15, 1), (16, 1)],
  term ((-896 : Rat) / 25) [(4, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-1792 : Rat) / 25) [(4, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((28064 : Rat) / 25) [(4, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-28064 : Rat) / 25) [(4, 2), (8, 1), (15, 2), (16, 1)],
  term ((-1792 : Rat) / 25) [(4, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((26272 : Rat) / 25) [(4, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-14032 : Rat) / 25) [(4, 2), (9, 1), (15, 1), (16, 1)],
  term ((14072 : Rat) / 25) [(4, 2), (10, 1), (15, 2), (16, 1)],
  term ((23716 : Rat) / 25) [(4, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-21094 : Rat) / 25) [(4, 2), (11, 1), (15, 1), (16, 1)],
  term ((5718 : Rat) / 25) [(4, 2), (13, 1), (15, 1), (16, 1)],
  term ((-2722 : Rat) / 5) [(4, 2), (15, 2), (16, 1)],
  term ((-3584 : Rat) / 25) [(5, 1), (6, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-7168 : Rat) / 25) [(5, 1), (6, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((1792 : Rat) / 25) [(5, 1), (7, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((3584 : Rat) / 25) [(5, 1), (7, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-56128 : Rat) / 25) [(5, 1), (7, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((56128 : Rat) / 25) [(5, 1), (7, 1), (8, 1), (15, 2), (16, 1)],
  term ((3584 : Rat) / 25) [(5, 1), (7, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-52544 : Rat) / 25) [(5, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((28064 : Rat) / 25) [(5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-28144 : Rat) / 25) [(5, 1), (7, 1), (10, 1), (15, 2), (16, 1)],
  term ((-47432 : Rat) / 25) [(5, 1), (7, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((42188 : Rat) / 25) [(5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-11436 : Rat) / 25) [(5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((5444 : Rat) / 5) [(5, 1), (7, 1), (15, 2), (16, 1)],
  term ((1792 : Rat) / 25) [(5, 1), (7, 2), (8, 1), (15, 1), (16, 1)],
  term ((-3584 : Rat) / 25) [(5, 1), (7, 2), (10, 1), (15, 1), (16, 1)],
  term ((-896 : Rat) / 25) [(5, 1), (7, 2), (15, 1), (16, 1)],
  term ((1792 : Rat) / 25) [(5, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((3584 : Rat) / 25) [(5, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-896 : Rat) / 25) [(5, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((1792 : Rat) / 25) [(5, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((448 : Rat) / 25) [(5, 2), (7, 1), (15, 1), (16, 1)],
  term ((-896 : Rat) / 25) [(5, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-1792 : Rat) / 25) [(5, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((28064 : Rat) / 25) [(5, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-28064 : Rat) / 25) [(5, 2), (8, 1), (15, 2), (16, 1)],
  term ((-1792 : Rat) / 25) [(5, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((26272 : Rat) / 25) [(5, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-14032 : Rat) / 25) [(5, 2), (9, 1), (15, 1), (16, 1)],
  term ((14072 : Rat) / 25) [(5, 2), (10, 1), (15, 2), (16, 1)],
  term ((23716 : Rat) / 25) [(5, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-21094 : Rat) / 25) [(5, 2), (11, 1), (15, 1), (16, 1)],
  term ((5718 : Rat) / 25) [(5, 2), (13, 1), (15, 1), (16, 1)],
  term ((-2722 : Rat) / 5) [(5, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 17, terms 0 through 28. -/
theorem rs_R010_ueqv_R010YY_block_17_0000_0028_valid :
    checkProductSumEq rs_R010_ueqv_R010YY_partials_17_0000_0028
      rs_R010_ueqv_R010YY_block_17_0000_0028 = true := by
  native_decide

end R010UeqvR010YYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
