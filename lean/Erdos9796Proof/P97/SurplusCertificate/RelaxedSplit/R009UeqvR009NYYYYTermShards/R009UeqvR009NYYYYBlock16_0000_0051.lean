/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NYYYY, term block 16:0-51

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NYYYYTermShards

/-- Generator polynomial 16 for relaxed split surplus certificate `R009:u=v:R009NYYYY`. -/
def rs_R009_ueqv_R009NYYYY_generator_16_0000_0051 : Poly :=
[
  term (-1 : Rat) [],
  term (-2 : Rat) [(0, 1), (6, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (7, 1)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(6, 1)]
]

/-- Coefficient term 0 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NYYYY_coefficient_16_0000 : Poly :=
[
  term ((-1993254036 : Rat) / 33189485) [(3, 1), (10, 1), (12, 1), (15, 1)]
]

/-- Partial product 0 for generator 16. -/
def rs_R009_ueqv_R009NYYYY_partial_16_0000 : Poly :=
[
  term ((3986508072 : Rat) / 33189485) [(0, 1), (3, 1), (6, 1), (10, 1), (12, 1), (15, 1)],
  term ((-1993254036 : Rat) / 33189485) [(0, 2), (3, 1), (10, 1), (12, 1), (15, 1)],
  term ((3986508072 : Rat) / 33189485) [(1, 1), (3, 1), (7, 1), (10, 1), (12, 1), (15, 1)],
  term ((-1993254036 : Rat) / 33189485) [(1, 2), (3, 1), (10, 1), (12, 1), (15, 1)],
  term ((-3986508072 : Rat) / 33189485) [(3, 1), (6, 1), (10, 1), (12, 1), (15, 1)],
  term ((1993254036 : Rat) / 33189485) [(3, 1), (10, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 16. -/
theorem rs_R009_ueqv_R009NYYYY_partial_16_0000_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_16_0000
        rs_R009_ueqv_R009NYYYY_generator_16_0000_0051 =
      rs_R009_ueqv_R009NYYYY_partial_16_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NYYYY_coefficient_16_0001 : Poly :=
[
  term ((381240 : Rat) / 32699) [(3, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1 for generator 16. -/
def rs_R009_ueqv_R009NYYYY_partial_16_0001 : Poly :=
[
  term ((-762480 : Rat) / 32699) [(0, 1), (3, 1), (6, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((381240 : Rat) / 32699) [(0, 2), (3, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-762480 : Rat) / 32699) [(1, 1), (3, 1), (7, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((381240 : Rat) / 32699) [(1, 2), (3, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((762480 : Rat) / 32699) [(3, 1), (6, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-381240 : Rat) / 32699) [(3, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 16. -/
theorem rs_R009_ueqv_R009NYYYY_partial_16_0001_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_16_0001
        rs_R009_ueqv_R009NYYYY_generator_16_0000_0051 =
      rs_R009_ueqv_R009NYYYY_partial_16_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NYYYY_coefficient_16_0002 : Poly :=
[
  term ((-2657672048 : Rat) / 33189485) [(3, 1), (10, 1), (13, 1), (15, 2)]
]

/-- Partial product 2 for generator 16. -/
def rs_R009_ueqv_R009NYYYY_partial_16_0002 : Poly :=
[
  term ((5315344096 : Rat) / 33189485) [(0, 1), (3, 1), (6, 1), (10, 1), (13, 1), (15, 2)],
  term ((-2657672048 : Rat) / 33189485) [(0, 2), (3, 1), (10, 1), (13, 1), (15, 2)],
  term ((5315344096 : Rat) / 33189485) [(1, 1), (3, 1), (7, 1), (10, 1), (13, 1), (15, 2)],
  term ((-2657672048 : Rat) / 33189485) [(1, 2), (3, 1), (10, 1), (13, 1), (15, 2)],
  term ((-5315344096 : Rat) / 33189485) [(3, 1), (6, 1), (10, 1), (13, 1), (15, 2)],
  term ((2657672048 : Rat) / 33189485) [(3, 1), (10, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 16. -/
theorem rs_R009_ueqv_R009NYYYY_partial_16_0002_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_16_0002
        rs_R009_ueqv_R009NYYYY_generator_16_0000_0051 =
      rs_R009_ueqv_R009NYYYY_partial_16_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NYYYY_coefficient_16_0003 : Poly :=
[
  term ((508320 : Rat) / 32699) [(3, 1), (10, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 3 for generator 16. -/
def rs_R009_ueqv_R009NYYYY_partial_16_0003 : Poly :=
[
  term ((-1016640 : Rat) / 32699) [(0, 1), (3, 1), (6, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((508320 : Rat) / 32699) [(0, 2), (3, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1016640 : Rat) / 32699) [(1, 1), (3, 1), (7, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((508320 : Rat) / 32699) [(1, 2), (3, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((1016640 : Rat) / 32699) [(3, 1), (6, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-508320 : Rat) / 32699) [(3, 1), (10, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 16. -/
theorem rs_R009_ueqv_R009NYYYY_partial_16_0003_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_16_0003
        rs_R009_ueqv_R009NYYYY_generator_16_0000_0051 =
      rs_R009_ueqv_R009NYYYY_partial_16_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NYYYY_coefficient_16_0004 : Poly :=
[
  term ((-166104503 : Rat) / 4741355) [(3, 1), (10, 1), (15, 1)]
]

/-- Partial product 4 for generator 16. -/
def rs_R009_ueqv_R009NYYYY_partial_16_0004 : Poly :=
[
  term ((332209006 : Rat) / 4741355) [(0, 1), (3, 1), (6, 1), (10, 1), (15, 1)],
  term ((-166104503 : Rat) / 4741355) [(0, 2), (3, 1), (10, 1), (15, 1)],
  term ((332209006 : Rat) / 4741355) [(1, 1), (3, 1), (7, 1), (10, 1), (15, 1)],
  term ((-166104503 : Rat) / 4741355) [(1, 2), (3, 1), (10, 1), (15, 1)],
  term ((-332209006 : Rat) / 4741355) [(3, 1), (6, 1), (10, 1), (15, 1)],
  term ((166104503 : Rat) / 4741355) [(3, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 16. -/
theorem rs_R009_ueqv_R009NYYYY_partial_16_0004_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_16_0004
        rs_R009_ueqv_R009NYYYY_generator_16_0000_0051 =
      rs_R009_ueqv_R009NYYYY_partial_16_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NYYYY_coefficient_16_0005 : Poly :=
[
  term ((222390 : Rat) / 32699) [(3, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 5 for generator 16. -/
def rs_R009_ueqv_R009NYYYY_partial_16_0005 : Poly :=
[
  term ((-444780 : Rat) / 32699) [(0, 1), (3, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((222390 : Rat) / 32699) [(0, 2), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((-444780 : Rat) / 32699) [(1, 1), (3, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((222390 : Rat) / 32699) [(1, 2), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((444780 : Rat) / 32699) [(3, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((-222390 : Rat) / 32699) [(3, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 16. -/
theorem rs_R009_ueqv_R009NYYYY_partial_16_0005_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_16_0005
        rs_R009_ueqv_R009NYYYY_generator_16_0000_0051 =
      rs_R009_ueqv_R009NYYYY_partial_16_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NYYYY_coefficient_16_0006 : Poly :=
[
  term ((664418012 : Rat) / 33189485) [(3, 1), (10, 1), (15, 3)]
]

/-- Partial product 6 for generator 16. -/
def rs_R009_ueqv_R009NYYYY_partial_16_0006 : Poly :=
[
  term ((-1328836024 : Rat) / 33189485) [(0, 1), (3, 1), (6, 1), (10, 1), (15, 3)],
  term ((664418012 : Rat) / 33189485) [(0, 2), (3, 1), (10, 1), (15, 3)],
  term ((-1328836024 : Rat) / 33189485) [(1, 1), (3, 1), (7, 1), (10, 1), (15, 3)],
  term ((664418012 : Rat) / 33189485) [(1, 2), (3, 1), (10, 1), (15, 3)],
  term ((1328836024 : Rat) / 33189485) [(3, 1), (6, 1), (10, 1), (15, 3)],
  term ((-664418012 : Rat) / 33189485) [(3, 1), (10, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 16. -/
theorem rs_R009_ueqv_R009NYYYY_partial_16_0006_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_16_0006
        rs_R009_ueqv_R009NYYYY_generator_16_0000_0051 =
      rs_R009_ueqv_R009NYYYY_partial_16_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NYYYY_coefficient_16_0007 : Poly :=
[
  term ((-127080 : Rat) / 32699) [(3, 1), (10, 1), (15, 3), (16, 1)]
]

/-- Partial product 7 for generator 16. -/
def rs_R009_ueqv_R009NYYYY_partial_16_0007 : Poly :=
[
  term ((254160 : Rat) / 32699) [(0, 1), (3, 1), (6, 1), (10, 1), (15, 3), (16, 1)],
  term ((-127080 : Rat) / 32699) [(0, 2), (3, 1), (10, 1), (15, 3), (16, 1)],
  term ((254160 : Rat) / 32699) [(1, 1), (3, 1), (7, 1), (10, 1), (15, 3), (16, 1)],
  term ((-127080 : Rat) / 32699) [(1, 2), (3, 1), (10, 1), (15, 3), (16, 1)],
  term ((-254160 : Rat) / 32699) [(3, 1), (6, 1), (10, 1), (15, 3), (16, 1)],
  term ((127080 : Rat) / 32699) [(3, 1), (10, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 16. -/
theorem rs_R009_ueqv_R009NYYYY_partial_16_0007_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_16_0007
        rs_R009_ueqv_R009NYYYY_generator_16_0000_0051 =
      rs_R009_ueqv_R009NYYYY_partial_16_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NYYYY_coefficient_16_0008 : Poly :=
[
  term ((-1993254036 : Rat) / 33189485) [(3, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 8 for generator 16. -/
def rs_R009_ueqv_R009NYYYY_partial_16_0008 : Poly :=
[
  term ((3986508072 : Rat) / 33189485) [(0, 1), (3, 1), (6, 1), (11, 1), (13, 1), (15, 1)],
  term ((-1993254036 : Rat) / 33189485) [(0, 2), (3, 1), (11, 1), (13, 1), (15, 1)],
  term ((3986508072 : Rat) / 33189485) [(1, 1), (3, 1), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((-1993254036 : Rat) / 33189485) [(1, 2), (3, 1), (11, 1), (13, 1), (15, 1)],
  term ((-3986508072 : Rat) / 33189485) [(3, 1), (6, 1), (11, 1), (13, 1), (15, 1)],
  term ((1993254036 : Rat) / 33189485) [(3, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 16. -/
theorem rs_R009_ueqv_R009NYYYY_partial_16_0008_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_16_0008
        rs_R009_ueqv_R009NYYYY_generator_16_0000_0051 =
      rs_R009_ueqv_R009NYYYY_partial_16_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NYYYY_coefficient_16_0009 : Poly :=
[
  term ((381240 : Rat) / 32699) [(3, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 9 for generator 16. -/
def rs_R009_ueqv_R009NYYYY_partial_16_0009 : Poly :=
[
  term ((-762480 : Rat) / 32699) [(0, 1), (3, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((381240 : Rat) / 32699) [(0, 2), (3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-762480 : Rat) / 32699) [(1, 1), (3, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((381240 : Rat) / 32699) [(1, 2), (3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((762480 : Rat) / 32699) [(3, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-381240 : Rat) / 32699) [(3, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 16. -/
theorem rs_R009_ueqv_R009NYYYY_partial_16_0009_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_16_0009
        rs_R009_ueqv_R009NYYYY_generator_16_0000_0051 =
      rs_R009_ueqv_R009NYYYY_partial_16_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NYYYY_coefficient_16_0010 : Poly :=
[
  term ((-14617196264 : Rat) / 33189485) [(3, 1), (11, 1), (15, 2)]
]

/-- Partial product 10 for generator 16. -/
def rs_R009_ueqv_R009NYYYY_partial_16_0010 : Poly :=
[
  term ((29234392528 : Rat) / 33189485) [(0, 1), (3, 1), (6, 1), (11, 1), (15, 2)],
  term ((-14617196264 : Rat) / 33189485) [(0, 2), (3, 1), (11, 1), (15, 2)],
  term ((29234392528 : Rat) / 33189485) [(1, 1), (3, 1), (7, 1), (11, 1), (15, 2)],
  term ((-14617196264 : Rat) / 33189485) [(1, 2), (3, 1), (11, 1), (15, 2)],
  term ((-29234392528 : Rat) / 33189485) [(3, 1), (6, 1), (11, 1), (15, 2)],
  term ((14617196264 : Rat) / 33189485) [(3, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 16. -/
theorem rs_R009_ueqv_R009NYYYY_partial_16_0010_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_16_0010
        rs_R009_ueqv_R009NYYYY_generator_16_0000_0051 =
      rs_R009_ueqv_R009NYYYY_partial_16_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NYYYY_coefficient_16_0011 : Poly :=
[
  term ((2795760 : Rat) / 32699) [(3, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 11 for generator 16. -/
def rs_R009_ueqv_R009NYYYY_partial_16_0011 : Poly :=
[
  term ((-5591520 : Rat) / 32699) [(0, 1), (3, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((2795760 : Rat) / 32699) [(0, 2), (3, 1), (11, 1), (15, 2), (16, 1)],
  term ((-5591520 : Rat) / 32699) [(1, 1), (3, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((2795760 : Rat) / 32699) [(1, 2), (3, 1), (11, 1), (15, 2), (16, 1)],
  term ((5591520 : Rat) / 32699) [(3, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((-2795760 : Rat) / 32699) [(3, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 16. -/
theorem rs_R009_ueqv_R009NYYYY_partial_16_0011_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_16_0011
        rs_R009_ueqv_R009NYYYY_generator_16_0000_0051 =
      rs_R009_ueqv_R009NYYYY_partial_16_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NYYYY_coefficient_16_0012 : Poly :=
[
  term ((-1328836024 : Rat) / 6637897) [(3, 1), (12, 1), (15, 1)]
]

/-- Partial product 12 for generator 16. -/
def rs_R009_ueqv_R009NYYYY_partial_16_0012 : Poly :=
[
  term ((2657672048 : Rat) / 6637897) [(0, 1), (3, 1), (6, 1), (12, 1), (15, 1)],
  term ((-1328836024 : Rat) / 6637897) [(0, 2), (3, 1), (12, 1), (15, 1)],
  term ((2657672048 : Rat) / 6637897) [(1, 1), (3, 1), (7, 1), (12, 1), (15, 1)],
  term ((-1328836024 : Rat) / 6637897) [(1, 2), (3, 1), (12, 1), (15, 1)],
  term ((-2657672048 : Rat) / 6637897) [(3, 1), (6, 1), (12, 1), (15, 1)],
  term ((1328836024 : Rat) / 6637897) [(3, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 16. -/
theorem rs_R009_ueqv_R009NYYYY_partial_16_0012_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_16_0012
        rs_R009_ueqv_R009NYYYY_generator_16_0000_0051 =
      rs_R009_ueqv_R009NYYYY_partial_16_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NYYYY_coefficient_16_0013 : Poly :=
[
  term ((1270800 : Rat) / 32699) [(3, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 13 for generator 16. -/
def rs_R009_ueqv_R009NYYYY_partial_16_0013 : Poly :=
[
  term ((-2541600 : Rat) / 32699) [(0, 1), (3, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((1270800 : Rat) / 32699) [(0, 2), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2541600 : Rat) / 32699) [(1, 1), (3, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((1270800 : Rat) / 32699) [(1, 2), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((2541600 : Rat) / 32699) [(3, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1270800 : Rat) / 32699) [(3, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 16. -/
theorem rs_R009_ueqv_R009NYYYY_partial_16_0013_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_16_0013
        rs_R009_ueqv_R009NYYYY_generator_16_0000_0051 =
      rs_R009_ueqv_R009NYYYY_partial_16_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NYYYY_coefficient_16_0014 : Poly :=
[
  term ((-5315344096 : Rat) / 19913691) [(3, 1), (13, 1), (15, 2)]
]

/-- Partial product 14 for generator 16. -/
def rs_R009_ueqv_R009NYYYY_partial_16_0014 : Poly :=
[
  term ((10630688192 : Rat) / 19913691) [(0, 1), (3, 1), (6, 1), (13, 1), (15, 2)],
  term ((-5315344096 : Rat) / 19913691) [(0, 2), (3, 1), (13, 1), (15, 2)],
  term ((10630688192 : Rat) / 19913691) [(1, 1), (3, 1), (7, 1), (13, 1), (15, 2)],
  term ((-5315344096 : Rat) / 19913691) [(1, 2), (3, 1), (13, 1), (15, 2)],
  term ((-10630688192 : Rat) / 19913691) [(3, 1), (6, 1), (13, 1), (15, 2)],
  term ((5315344096 : Rat) / 19913691) [(3, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 16. -/
theorem rs_R009_ueqv_R009NYYYY_partial_16_0014_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_16_0014
        rs_R009_ueqv_R009NYYYY_generator_16_0000_0051 =
      rs_R009_ueqv_R009NYYYY_partial_16_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NYYYY_coefficient_16_0015 : Poly :=
[
  term ((1694400 : Rat) / 32699) [(3, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 15 for generator 16. -/
def rs_R009_ueqv_R009NYYYY_partial_16_0015 : Poly :=
[
  term ((-3388800 : Rat) / 32699) [(0, 1), (3, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((1694400 : Rat) / 32699) [(0, 2), (3, 1), (13, 1), (15, 2), (16, 1)],
  term ((-3388800 : Rat) / 32699) [(1, 1), (3, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((1694400 : Rat) / 32699) [(1, 2), (3, 1), (13, 1), (15, 2), (16, 1)],
  term ((3388800 : Rat) / 32699) [(3, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1694400 : Rat) / 32699) [(3, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 16. -/
theorem rs_R009_ueqv_R009NYYYY_partial_16_0015_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_16_0015
        rs_R009_ueqv_R009NYYYY_generator_16_0000_0051 =
      rs_R009_ueqv_R009NYYYY_partial_16_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NYYYY_coefficient_16_0016 : Poly :=
[
  term ((664418012 : Rat) / 4741355) [(3, 1), (15, 1)]
]

/-- Partial product 16 for generator 16. -/
def rs_R009_ueqv_R009NYYYY_partial_16_0016 : Poly :=
[
  term ((-1328836024 : Rat) / 4741355) [(0, 1), (3, 1), (6, 1), (15, 1)],
  term ((664418012 : Rat) / 4741355) [(0, 2), (3, 1), (15, 1)],
  term ((-1328836024 : Rat) / 4741355) [(1, 1), (3, 1), (7, 1), (15, 1)],
  term ((664418012 : Rat) / 4741355) [(1, 2), (3, 1), (15, 1)],
  term ((1328836024 : Rat) / 4741355) [(3, 1), (6, 1), (15, 1)],
  term ((-664418012 : Rat) / 4741355) [(3, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 16. -/
theorem rs_R009_ueqv_R009NYYYY_partial_16_0016_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_16_0016
        rs_R009_ueqv_R009NYYYY_generator_16_0000_0051 =
      rs_R009_ueqv_R009NYYYY_partial_16_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NYYYY_coefficient_16_0017 : Poly :=
[
  term ((-889560 : Rat) / 32699) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 17 for generator 16. -/
def rs_R009_ueqv_R009NYYYY_partial_16_0017 : Poly :=
[
  term ((1779120 : Rat) / 32699) [(0, 1), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((-889560 : Rat) / 32699) [(0, 2), (3, 1), (15, 1), (16, 1)],
  term ((1779120 : Rat) / 32699) [(1, 1), (3, 1), (7, 1), (15, 1), (16, 1)],
  term ((-889560 : Rat) / 32699) [(1, 2), (3, 1), (15, 1), (16, 1)],
  term ((-1779120 : Rat) / 32699) [(3, 1), (6, 1), (15, 1), (16, 1)],
  term ((889560 : Rat) / 32699) [(3, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 16. -/
theorem rs_R009_ueqv_R009NYYYY_partial_16_0017_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_16_0017
        rs_R009_ueqv_R009NYYYY_generator_16_0000_0051 =
      rs_R009_ueqv_R009NYYYY_partial_16_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NYYYY_coefficient_16_0018 : Poly :=
[
  term ((2657672048 : Rat) / 14224065) [(3, 1), (15, 3)]
]

/-- Partial product 18 for generator 16. -/
def rs_R009_ueqv_R009NYYYY_partial_16_0018 : Poly :=
[
  term ((-5315344096 : Rat) / 14224065) [(0, 1), (3, 1), (6, 1), (15, 3)],
  term ((2657672048 : Rat) / 14224065) [(0, 2), (3, 1), (15, 3)],
  term ((-5315344096 : Rat) / 14224065) [(1, 1), (3, 1), (7, 1), (15, 3)],
  term ((2657672048 : Rat) / 14224065) [(1, 2), (3, 1), (15, 3)],
  term ((5315344096 : Rat) / 14224065) [(3, 1), (6, 1), (15, 3)],
  term ((-2657672048 : Rat) / 14224065) [(3, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 16. -/
theorem rs_R009_ueqv_R009NYYYY_partial_16_0018_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_16_0018
        rs_R009_ueqv_R009NYYYY_generator_16_0000_0051 =
      rs_R009_ueqv_R009NYYYY_partial_16_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NYYYY_coefficient_16_0019 : Poly :=
[
  term ((-1186080 : Rat) / 32699) [(3, 1), (15, 3), (16, 1)]
]

/-- Partial product 19 for generator 16. -/
def rs_R009_ueqv_R009NYYYY_partial_16_0019 : Poly :=
[
  term ((2372160 : Rat) / 32699) [(0, 1), (3, 1), (6, 1), (15, 3), (16, 1)],
  term ((-1186080 : Rat) / 32699) [(0, 2), (3, 1), (15, 3), (16, 1)],
  term ((2372160 : Rat) / 32699) [(1, 1), (3, 1), (7, 1), (15, 3), (16, 1)],
  term ((-1186080 : Rat) / 32699) [(1, 2), (3, 1), (15, 3), (16, 1)],
  term ((-2372160 : Rat) / 32699) [(3, 1), (6, 1), (15, 3), (16, 1)],
  term ((1186080 : Rat) / 32699) [(3, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 16. -/
theorem rs_R009_ueqv_R009NYYYY_partial_16_0019_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_16_0019
        rs_R009_ueqv_R009NYYYY_generator_16_0000_0051 =
      rs_R009_ueqv_R009NYYYY_partial_16_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NYYYY_coefficient_16_0020 : Poly :=
[
  term ((3986508072 : Rat) / 33189485) [(10, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 20 for generator 16. -/
def rs_R009_ueqv_R009NYYYY_partial_16_0020 : Poly :=
[
  term ((-7973016144 : Rat) / 33189485) [(0, 1), (6, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((3986508072 : Rat) / 33189485) [(0, 2), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-7973016144 : Rat) / 33189485) [(1, 1), (7, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((3986508072 : Rat) / 33189485) [(1, 2), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((7973016144 : Rat) / 33189485) [(6, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-3986508072 : Rat) / 33189485) [(10, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 16. -/
theorem rs_R009_ueqv_R009NYYYY_partial_16_0020_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_16_0020
        rs_R009_ueqv_R009NYYYY_generator_16_0000_0051 =
      rs_R009_ueqv_R009NYYYY_partial_16_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NYYYY_coefficient_16_0021 : Poly :=
[
  term ((-762480 : Rat) / 32699) [(10, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 21 for generator 16. -/
def rs_R009_ueqv_R009NYYYY_partial_16_0021 : Poly :=
[
  term ((1524960 : Rat) / 32699) [(0, 1), (6, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-762480 : Rat) / 32699) [(0, 2), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1524960 : Rat) / 32699) [(1, 1), (7, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-762480 : Rat) / 32699) [(1, 2), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1524960 : Rat) / 32699) [(6, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((762480 : Rat) / 32699) [(10, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 16. -/
theorem rs_R009_ueqv_R009NYYYY_partial_16_0021_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_16_0021
        rs_R009_ueqv_R009NYYYY_generator_16_0000_0051 =
      rs_R009_ueqv_R009NYYYY_partial_16_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NYYYY_coefficient_16_0022 : Poly :=
[
  term ((-3820403569 : Rat) / 33189485) [(10, 1), (13, 1), (15, 1)]
]

/-- Partial product 22 for generator 16. -/
def rs_R009_ueqv_R009NYYYY_partial_16_0022 : Poly :=
[
  term ((7640807138 : Rat) / 33189485) [(0, 1), (6, 1), (10, 1), (13, 1), (15, 1)],
  term ((-3820403569 : Rat) / 33189485) [(0, 2), (10, 1), (13, 1), (15, 1)],
  term ((7640807138 : Rat) / 33189485) [(1, 1), (7, 1), (10, 1), (13, 1), (15, 1)],
  term ((-3820403569 : Rat) / 33189485) [(1, 2), (10, 1), (13, 1), (15, 1)],
  term ((-7640807138 : Rat) / 33189485) [(6, 1), (10, 1), (13, 1), (15, 1)],
  term ((3820403569 : Rat) / 33189485) [(10, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 16. -/
theorem rs_R009_ueqv_R009NYYYY_partial_16_0022_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_16_0022
        rs_R009_ueqv_R009NYYYY_generator_16_0000_0051 =
      rs_R009_ueqv_R009NYYYY_partial_16_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NYYYY_coefficient_16_0023 : Poly :=
[
  term ((730710 : Rat) / 32699) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 23 for generator 16. -/
def rs_R009_ueqv_R009NYYYY_partial_16_0023 : Poly :=
[
  term ((-1461420 : Rat) / 32699) [(0, 1), (6, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((730710 : Rat) / 32699) [(0, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1461420 : Rat) / 32699) [(1, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((730710 : Rat) / 32699) [(1, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((1461420 : Rat) / 32699) [(6, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-730710 : Rat) / 32699) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 16. -/
theorem rs_R009_ueqv_R009NYYYY_partial_16_0023_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_16_0023
        rs_R009_ueqv_R009NYYYY_generator_16_0000_0051 =
      rs_R009_ueqv_R009NYYYY_partial_16_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NYYYY_coefficient_16_0024 : Poly :=
[
  term ((7308598132 : Rat) / 33189485) [(10, 1), (13, 1), (15, 3)]
]

/-- Partial product 24 for generator 16. -/
def rs_R009_ueqv_R009NYYYY_partial_16_0024 : Poly :=
[
  term ((-14617196264 : Rat) / 33189485) [(0, 1), (6, 1), (10, 1), (13, 1), (15, 3)],
  term ((7308598132 : Rat) / 33189485) [(0, 2), (10, 1), (13, 1), (15, 3)],
  term ((-14617196264 : Rat) / 33189485) [(1, 1), (7, 1), (10, 1), (13, 1), (15, 3)],
  term ((7308598132 : Rat) / 33189485) [(1, 2), (10, 1), (13, 1), (15, 3)],
  term ((14617196264 : Rat) / 33189485) [(6, 1), (10, 1), (13, 1), (15, 3)],
  term ((-7308598132 : Rat) / 33189485) [(10, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 16. -/
theorem rs_R009_ueqv_R009NYYYY_partial_16_0024_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_16_0024
        rs_R009_ueqv_R009NYYYY_generator_16_0000_0051 =
      rs_R009_ueqv_R009NYYYY_partial_16_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NYYYY_coefficient_16_0025 : Poly :=
[
  term ((-1397880 : Rat) / 32699) [(10, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 25 for generator 16. -/
def rs_R009_ueqv_R009NYYYY_partial_16_0025 : Poly :=
[
  term ((2795760 : Rat) / 32699) [(0, 1), (6, 1), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((-1397880 : Rat) / 32699) [(0, 2), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((2795760 : Rat) / 32699) [(1, 1), (7, 1), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((-1397880 : Rat) / 32699) [(1, 2), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((-2795760 : Rat) / 32699) [(6, 1), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((1397880 : Rat) / 32699) [(10, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 16. -/
theorem rs_R009_ueqv_R009NYYYY_partial_16_0025_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_16_0025
        rs_R009_ueqv_R009NYYYY_generator_16_0000_0051 =
      rs_R009_ueqv_R009NYYYY_partial_16_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NYYYY_coefficient_16_0026 : Poly :=
[
  term ((-7973016144 : Rat) / 33189485) [(10, 1), (13, 2), (15, 2)]
]

/-- Partial product 26 for generator 16. -/
def rs_R009_ueqv_R009NYYYY_partial_16_0026 : Poly :=
[
  term ((15946032288 : Rat) / 33189485) [(0, 1), (6, 1), (10, 1), (13, 2), (15, 2)],
  term ((-7973016144 : Rat) / 33189485) [(0, 2), (10, 1), (13, 2), (15, 2)],
  term ((15946032288 : Rat) / 33189485) [(1, 1), (7, 1), (10, 1), (13, 2), (15, 2)],
  term ((-7973016144 : Rat) / 33189485) [(1, 2), (10, 1), (13, 2), (15, 2)],
  term ((-15946032288 : Rat) / 33189485) [(6, 1), (10, 1), (13, 2), (15, 2)],
  term ((7973016144 : Rat) / 33189485) [(10, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 16. -/
theorem rs_R009_ueqv_R009NYYYY_partial_16_0026_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_16_0026
        rs_R009_ueqv_R009NYYYY_generator_16_0000_0051 =
      rs_R009_ueqv_R009NYYYY_partial_16_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NYYYY_coefficient_16_0027 : Poly :=
[
  term ((1524960 : Rat) / 32699) [(10, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 27 for generator 16. -/
def rs_R009_ueqv_R009NYYYY_partial_16_0027 : Poly :=
[
  term ((-3049920 : Rat) / 32699) [(0, 1), (6, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((1524960 : Rat) / 32699) [(0, 2), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((-3049920 : Rat) / 32699) [(1, 1), (7, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((1524960 : Rat) / 32699) [(1, 2), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((3049920 : Rat) / 32699) [(6, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((-1524960 : Rat) / 32699) [(10, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 16. -/
theorem rs_R009_ueqv_R009NYYYY_partial_16_0027_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_16_0027
        rs_R009_ueqv_R009NYYYY_generator_16_0000_0051 =
      rs_R009_ueqv_R009NYYYY_partial_16_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NYYYY_coefficient_16_0028 : Poly :=
[
  term ((332209006 : Rat) / 6637897) [(10, 1), (15, 2)]
]

/-- Partial product 28 for generator 16. -/
def rs_R009_ueqv_R009NYYYY_partial_16_0028 : Poly :=
[
  term ((-664418012 : Rat) / 6637897) [(0, 1), (6, 1), (10, 1), (15, 2)],
  term ((332209006 : Rat) / 6637897) [(0, 2), (10, 1), (15, 2)],
  term ((-664418012 : Rat) / 6637897) [(1, 1), (7, 1), (10, 1), (15, 2)],
  term ((332209006 : Rat) / 6637897) [(1, 2), (10, 1), (15, 2)],
  term ((664418012 : Rat) / 6637897) [(6, 1), (10, 1), (15, 2)],
  term ((-332209006 : Rat) / 6637897) [(10, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 16. -/
theorem rs_R009_ueqv_R009NYYYY_partial_16_0028_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_16_0028
        rs_R009_ueqv_R009NYYYY_generator_16_0000_0051 =
      rs_R009_ueqv_R009NYYYY_partial_16_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NYYYY_coefficient_16_0029 : Poly :=
[
  term ((-317700 : Rat) / 32699) [(10, 1), (15, 2), (16, 1)]
]

/-- Partial product 29 for generator 16. -/
def rs_R009_ueqv_R009NYYYY_partial_16_0029 : Poly :=
[
  term ((635400 : Rat) / 32699) [(0, 1), (6, 1), (10, 1), (15, 2), (16, 1)],
  term ((-317700 : Rat) / 32699) [(0, 2), (10, 1), (15, 2), (16, 1)],
  term ((635400 : Rat) / 32699) [(1, 1), (7, 1), (10, 1), (15, 2), (16, 1)],
  term ((-317700 : Rat) / 32699) [(1, 2), (10, 1), (15, 2), (16, 1)],
  term ((-635400 : Rat) / 32699) [(6, 1), (10, 1), (15, 2), (16, 1)],
  term ((317700 : Rat) / 32699) [(10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 16. -/
theorem rs_R009_ueqv_R009NYYYY_partial_16_0029_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_16_0029
        rs_R009_ueqv_R009NYYYY_generator_16_0000_0051 =
      rs_R009_ueqv_R009NYYYY_partial_16_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NYYYY_coefficient_16_0030 : Poly :=
[
  term ((-1328836024 : Rat) / 33189485) [(10, 1), (15, 4)]
]

/-- Partial product 30 for generator 16. -/
def rs_R009_ueqv_R009NYYYY_partial_16_0030 : Poly :=
[
  term ((2657672048 : Rat) / 33189485) [(0, 1), (6, 1), (10, 1), (15, 4)],
  term ((-1328836024 : Rat) / 33189485) [(0, 2), (10, 1), (15, 4)],
  term ((2657672048 : Rat) / 33189485) [(1, 1), (7, 1), (10, 1), (15, 4)],
  term ((-1328836024 : Rat) / 33189485) [(1, 2), (10, 1), (15, 4)],
  term ((-2657672048 : Rat) / 33189485) [(6, 1), (10, 1), (15, 4)],
  term ((1328836024 : Rat) / 33189485) [(10, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 16. -/
theorem rs_R009_ueqv_R009NYYYY_partial_16_0030_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_16_0030
        rs_R009_ueqv_R009NYYYY_generator_16_0000_0051 =
      rs_R009_ueqv_R009NYYYY_partial_16_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NYYYY_coefficient_16_0031 : Poly :=
[
  term ((254160 : Rat) / 32699) [(10, 1), (15, 4), (16, 1)]
]

/-- Partial product 31 for generator 16. -/
def rs_R009_ueqv_R009NYYYY_partial_16_0031 : Poly :=
[
  term ((-508320 : Rat) / 32699) [(0, 1), (6, 1), (10, 1), (15, 4), (16, 1)],
  term ((254160 : Rat) / 32699) [(0, 2), (10, 1), (15, 4), (16, 1)],
  term ((-508320 : Rat) / 32699) [(1, 1), (7, 1), (10, 1), (15, 4), (16, 1)],
  term ((254160 : Rat) / 32699) [(1, 2), (10, 1), (15, 4), (16, 1)],
  term ((508320 : Rat) / 32699) [(6, 1), (10, 1), (15, 4), (16, 1)],
  term ((-254160 : Rat) / 32699) [(10, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 16. -/
theorem rs_R009_ueqv_R009NYYYY_partial_16_0031_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_16_0031
        rs_R009_ueqv_R009NYYYY_generator_16_0000_0051 =
      rs_R009_ueqv_R009NYYYY_partial_16_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NYYYY_coefficient_16_0032 : Poly :=
[
  term ((17274868312 : Rat) / 33189485) [(11, 1), (12, 1), (15, 1)]
]

/-- Partial product 32 for generator 16. -/
def rs_R009_ueqv_R009NYYYY_partial_16_0032 : Poly :=
[
  term ((-34549736624 : Rat) / 33189485) [(0, 1), (6, 1), (11, 1), (12, 1), (15, 1)],
  term ((17274868312 : Rat) / 33189485) [(0, 2), (11, 1), (12, 1), (15, 1)],
  term ((-34549736624 : Rat) / 33189485) [(1, 1), (7, 1), (11, 1), (12, 1), (15, 1)],
  term ((17274868312 : Rat) / 33189485) [(1, 2), (11, 1), (12, 1), (15, 1)],
  term ((34549736624 : Rat) / 33189485) [(6, 1), (11, 1), (12, 1), (15, 1)],
  term ((-17274868312 : Rat) / 33189485) [(11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 16. -/
theorem rs_R009_ueqv_R009NYYYY_partial_16_0032_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_16_0032
        rs_R009_ueqv_R009NYYYY_generator_16_0000_0051 =
      rs_R009_ueqv_R009NYYYY_partial_16_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NYYYY_coefficient_16_0033 : Poly :=
[
  term ((-3304080 : Rat) / 32699) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 33 for generator 16. -/
def rs_R009_ueqv_R009NYYYY_partial_16_0033 : Poly :=
[
  term ((6608160 : Rat) / 32699) [(0, 1), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3304080 : Rat) / 32699) [(0, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((6608160 : Rat) / 32699) [(1, 1), (7, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3304080 : Rat) / 32699) [(1, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-6608160 : Rat) / 32699) [(6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((3304080 : Rat) / 32699) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 16. -/
theorem rs_R009_ueqv_R009NYYYY_partial_16_0033_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_16_0033
        rs_R009_ueqv_R009NYYYY_generator_16_0000_0051 =
      rs_R009_ueqv_R009NYYYY_partial_16_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NYYYY_coefficient_16_0034 : Poly :=
[
  term ((-4650926084 : Rat) / 4741355) [(11, 1), (13, 1), (15, 2)]
]

/-- Partial product 34 for generator 16. -/
def rs_R009_ueqv_R009NYYYY_partial_16_0034 : Poly :=
[
  term ((9301852168 : Rat) / 4741355) [(0, 1), (6, 1), (11, 1), (13, 1), (15, 2)],
  term ((-4650926084 : Rat) / 4741355) [(0, 2), (11, 1), (13, 1), (15, 2)],
  term ((9301852168 : Rat) / 4741355) [(1, 1), (7, 1), (11, 1), (13, 1), (15, 2)],
  term ((-4650926084 : Rat) / 4741355) [(1, 2), (11, 1), (13, 1), (15, 2)],
  term ((-9301852168 : Rat) / 4741355) [(6, 1), (11, 1), (13, 1), (15, 2)],
  term ((4650926084 : Rat) / 4741355) [(11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 16. -/
theorem rs_R009_ueqv_R009NYYYY_partial_16_0034_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_16_0034
        rs_R009_ueqv_R009NYYYY_generator_16_0000_0051 =
      rs_R009_ueqv_R009NYYYY_partial_16_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NYYYY_coefficient_16_0035 : Poly :=
[
  term ((6226920 : Rat) / 32699) [(11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 35 for generator 16. -/
def rs_R009_ueqv_R009NYYYY_partial_16_0035 : Poly :=
[
  term ((-12453840 : Rat) / 32699) [(0, 1), (6, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((6226920 : Rat) / 32699) [(0, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-12453840 : Rat) / 32699) [(1, 1), (7, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((6226920 : Rat) / 32699) [(1, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((12453840 : Rat) / 32699) [(6, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-6226920 : Rat) / 32699) [(11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 16. -/
theorem rs_R009_ueqv_R009NYYYY_partial_16_0035_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_16_0035
        rs_R009_ueqv_R009NYYYY_generator_16_0000_0051 =
      rs_R009_ueqv_R009NYYYY_partial_16_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NYYYY_coefficient_16_0036 : Poly :=
[
  term ((-18437599833 : Rat) / 33189485) [(11, 1), (15, 1)]
]

/-- Partial product 36 for generator 16. -/
def rs_R009_ueqv_R009NYYYY_partial_16_0036 : Poly :=
[
  term ((36875199666 : Rat) / 33189485) [(0, 1), (6, 1), (11, 1), (15, 1)],
  term ((-18437599833 : Rat) / 33189485) [(0, 2), (11, 1), (15, 1)],
  term ((36875199666 : Rat) / 33189485) [(1, 1), (7, 1), (11, 1), (15, 1)],
  term ((-18437599833 : Rat) / 33189485) [(1, 2), (11, 1), (15, 1)],
  term ((-36875199666 : Rat) / 33189485) [(6, 1), (11, 1), (15, 1)],
  term ((18437599833 : Rat) / 33189485) [(11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 16. -/
theorem rs_R009_ueqv_R009NYYYY_partial_16_0036_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_16_0036
        rs_R009_ueqv_R009NYYYY_generator_16_0000_0051 =
      rs_R009_ueqv_R009NYYYY_partial_16_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NYYYY_coefficient_16_0037 : Poly :=
[
  term ((3526470 : Rat) / 32699) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 37 for generator 16. -/
def rs_R009_ueqv_R009NYYYY_partial_16_0037 : Poly :=
[
  term ((-7052940 : Rat) / 32699) [(0, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((3526470 : Rat) / 32699) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((-7052940 : Rat) / 32699) [(1, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((3526470 : Rat) / 32699) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((7052940 : Rat) / 32699) [(6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3526470 : Rat) / 32699) [(11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 16. -/
theorem rs_R009_ueqv_R009NYYYY_partial_16_0037_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_16_0037
        rs_R009_ueqv_R009NYYYY_generator_16_0000_0051 =
      rs_R009_ueqv_R009NYYYY_partial_16_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NYYYY_coefficient_16_0038 : Poly :=
[
  term ((7308598132 : Rat) / 33189485) [(11, 1), (15, 3)]
]

/-- Partial product 38 for generator 16. -/
def rs_R009_ueqv_R009NYYYY_partial_16_0038 : Poly :=
[
  term ((-14617196264 : Rat) / 33189485) [(0, 1), (6, 1), (11, 1), (15, 3)],
  term ((7308598132 : Rat) / 33189485) [(0, 2), (11, 1), (15, 3)],
  term ((-14617196264 : Rat) / 33189485) [(1, 1), (7, 1), (11, 1), (15, 3)],
  term ((7308598132 : Rat) / 33189485) [(1, 2), (11, 1), (15, 3)],
  term ((14617196264 : Rat) / 33189485) [(6, 1), (11, 1), (15, 3)],
  term ((-7308598132 : Rat) / 33189485) [(11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 16. -/
theorem rs_R009_ueqv_R009NYYYY_partial_16_0038_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_16_0038
        rs_R009_ueqv_R009NYYYY_generator_16_0000_0051 =
      rs_R009_ueqv_R009NYYYY_partial_16_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NYYYY_coefficient_16_0039 : Poly :=
[
  term ((-1397880 : Rat) / 32699) [(11, 1), (15, 3), (16, 1)]
]

/-- Partial product 39 for generator 16. -/
def rs_R009_ueqv_R009NYYYY_partial_16_0039 : Poly :=
[
  term ((2795760 : Rat) / 32699) [(0, 1), (6, 1), (11, 1), (15, 3), (16, 1)],
  term ((-1397880 : Rat) / 32699) [(0, 2), (11, 1), (15, 3), (16, 1)],
  term ((2795760 : Rat) / 32699) [(1, 1), (7, 1), (11, 1), (15, 3), (16, 1)],
  term ((-1397880 : Rat) / 32699) [(1, 2), (11, 1), (15, 3), (16, 1)],
  term ((-2795760 : Rat) / 32699) [(6, 1), (11, 1), (15, 3), (16, 1)],
  term ((1397880 : Rat) / 32699) [(11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 16. -/
theorem rs_R009_ueqv_R009NYYYY_partial_16_0039_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_16_0039
        rs_R009_ueqv_R009NYYYY_generator_16_0000_0051 =
      rs_R009_ueqv_R009NYYYY_partial_16_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NYYYY_coefficient_16_0040 : Poly :=
[
  term ((2657672048 : Rat) / 6637897) [(12, 1), (13, 1), (15, 1)]
]

/-- Partial product 40 for generator 16. -/
def rs_R009_ueqv_R009NYYYY_partial_16_0040 : Poly :=
[
  term ((-5315344096 : Rat) / 6637897) [(0, 1), (6, 1), (12, 1), (13, 1), (15, 1)],
  term ((2657672048 : Rat) / 6637897) [(0, 2), (12, 1), (13, 1), (15, 1)],
  term ((-5315344096 : Rat) / 6637897) [(1, 1), (7, 1), (12, 1), (13, 1), (15, 1)],
  term ((2657672048 : Rat) / 6637897) [(1, 2), (12, 1), (13, 1), (15, 1)],
  term ((5315344096 : Rat) / 6637897) [(6, 1), (12, 1), (13, 1), (15, 1)],
  term ((-2657672048 : Rat) / 6637897) [(12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 16. -/
theorem rs_R009_ueqv_R009NYYYY_partial_16_0040_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_16_0040
        rs_R009_ueqv_R009NYYYY_generator_16_0000_0051 =
      rs_R009_ueqv_R009NYYYY_partial_16_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NYYYY_coefficient_16_0041 : Poly :=
[
  term ((-2541600 : Rat) / 32699) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 41 for generator 16. -/
def rs_R009_ueqv_R009NYYYY_partial_16_0041 : Poly :=
[
  term ((5083200 : Rat) / 32699) [(0, 1), (6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2541600 : Rat) / 32699) [(0, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((5083200 : Rat) / 32699) [(1, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2541600 : Rat) / 32699) [(1, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5083200 : Rat) / 32699) [(6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((2541600 : Rat) / 32699) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 16. -/
theorem rs_R009_ueqv_R009NYYYY_partial_16_0041_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_16_0041
        rs_R009_ueqv_R009NYYYY_generator_16_0000_0051 =
      rs_R009_ueqv_R009NYYYY_partial_16_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NYYYY_coefficient_16_0042 : Poly :=
[
  term ((-29234392528 : Rat) / 99568455) [(13, 1), (15, 1)]
]

/-- Partial product 42 for generator 16. -/
def rs_R009_ueqv_R009NYYYY_partial_16_0042 : Poly :=
[
  term ((58468785056 : Rat) / 99568455) [(0, 1), (6, 1), (13, 1), (15, 1)],
  term ((-29234392528 : Rat) / 99568455) [(0, 2), (13, 1), (15, 1)],
  term ((58468785056 : Rat) / 99568455) [(1, 1), (7, 1), (13, 1), (15, 1)],
  term ((-29234392528 : Rat) / 99568455) [(1, 2), (13, 1), (15, 1)],
  term ((-58468785056 : Rat) / 99568455) [(6, 1), (13, 1), (15, 1)],
  term ((29234392528 : Rat) / 99568455) [(13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 16. -/
theorem rs_R009_ueqv_R009NYYYY_partial_16_0042_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_16_0042
        rs_R009_ueqv_R009NYYYY_generator_16_0000_0051 =
      rs_R009_ueqv_R009NYYYY_partial_16_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NYYYY_coefficient_16_0043 : Poly :=
[
  term ((1863840 : Rat) / 32699) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 43 for generator 16. -/
def rs_R009_ueqv_R009NYYYY_partial_16_0043 : Poly :=
[
  term ((-3727680 : Rat) / 32699) [(0, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((1863840 : Rat) / 32699) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((-3727680 : Rat) / 32699) [(1, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((1863840 : Rat) / 32699) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((3727680 : Rat) / 32699) [(6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1863840 : Rat) / 32699) [(13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 16. -/
theorem rs_R009_ueqv_R009NYYYY_partial_16_0043_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_16_0043
        rs_R009_ueqv_R009NYYYY_generator_16_0000_0051 =
      rs_R009_ueqv_R009NYYYY_partial_16_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NYYYY_coefficient_16_0044 : Poly :=
[
  term ((108964553968 : Rat) / 99568455) [(13, 1), (15, 3)]
]

/-- Partial product 44 for generator 16. -/
def rs_R009_ueqv_R009NYYYY_partial_16_0044 : Poly :=
[
  term ((-217929107936 : Rat) / 99568455) [(0, 1), (6, 1), (13, 1), (15, 3)],
  term ((108964553968 : Rat) / 99568455) [(0, 2), (13, 1), (15, 3)],
  term ((-217929107936 : Rat) / 99568455) [(1, 1), (7, 1), (13, 1), (15, 3)],
  term ((108964553968 : Rat) / 99568455) [(1, 2), (13, 1), (15, 3)],
  term ((217929107936 : Rat) / 99568455) [(6, 1), (13, 1), (15, 3)],
  term ((-108964553968 : Rat) / 99568455) [(13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 16. -/
theorem rs_R009_ueqv_R009NYYYY_partial_16_0044_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_16_0044
        rs_R009_ueqv_R009NYYYY_generator_16_0000_0051 =
      rs_R009_ueqv_R009NYYYY_partial_16_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NYYYY_coefficient_16_0045 : Poly :=
[
  term ((-6947040 : Rat) / 32699) [(13, 1), (15, 3), (16, 1)]
]

/-- Partial product 45 for generator 16. -/
def rs_R009_ueqv_R009NYYYY_partial_16_0045 : Poly :=
[
  term ((13894080 : Rat) / 32699) [(0, 1), (6, 1), (13, 1), (15, 3), (16, 1)],
  term ((-6947040 : Rat) / 32699) [(0, 2), (13, 1), (15, 3), (16, 1)],
  term ((13894080 : Rat) / 32699) [(1, 1), (7, 1), (13, 1), (15, 3), (16, 1)],
  term ((-6947040 : Rat) / 32699) [(1, 2), (13, 1), (15, 3), (16, 1)],
  term ((-13894080 : Rat) / 32699) [(6, 1), (13, 1), (15, 3), (16, 1)],
  term ((6947040 : Rat) / 32699) [(13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 16. -/
theorem rs_R009_ueqv_R009NYYYY_partial_16_0045_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_16_0045
        rs_R009_ueqv_R009NYYYY_generator_16_0000_0051 =
      rs_R009_ueqv_R009NYYYY_partial_16_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NYYYY_coefficient_16_0046 : Poly :=
[
  term ((-5315344096 : Rat) / 6637897) [(13, 2), (15, 2)]
]

/-- Partial product 46 for generator 16. -/
def rs_R009_ueqv_R009NYYYY_partial_16_0046 : Poly :=
[
  term ((10630688192 : Rat) / 6637897) [(0, 1), (6, 1), (13, 2), (15, 2)],
  term ((-5315344096 : Rat) / 6637897) [(0, 2), (13, 2), (15, 2)],
  term ((10630688192 : Rat) / 6637897) [(1, 1), (7, 1), (13, 2), (15, 2)],
  term ((-5315344096 : Rat) / 6637897) [(1, 2), (13, 2), (15, 2)],
  term ((-10630688192 : Rat) / 6637897) [(6, 1), (13, 2), (15, 2)],
  term ((5315344096 : Rat) / 6637897) [(13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 16. -/
theorem rs_R009_ueqv_R009NYYYY_partial_16_0046_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_16_0046
        rs_R009_ueqv_R009NYYYY_generator_16_0000_0051 =
      rs_R009_ueqv_R009NYYYY_partial_16_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NYYYY_coefficient_16_0047 : Poly :=
[
  term ((5083200 : Rat) / 32699) [(13, 2), (15, 2), (16, 1)]
]

/-- Partial product 47 for generator 16. -/
def rs_R009_ueqv_R009NYYYY_partial_16_0047 : Poly :=
[
  term ((-10166400 : Rat) / 32699) [(0, 1), (6, 1), (13, 2), (15, 2), (16, 1)],
  term ((5083200 : Rat) / 32699) [(0, 2), (13, 2), (15, 2), (16, 1)],
  term ((-10166400 : Rat) / 32699) [(1, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((5083200 : Rat) / 32699) [(1, 2), (13, 2), (15, 2), (16, 1)],
  term ((10166400 : Rat) / 32699) [(6, 1), (13, 2), (15, 2), (16, 1)],
  term ((-5083200 : Rat) / 32699) [(13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 16. -/
theorem rs_R009_ueqv_R009NYYYY_partial_16_0047_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_16_0047
        rs_R009_ueqv_R009NYYYY_generator_16_0000_0051 =
      rs_R009_ueqv_R009NYYYY_partial_16_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NYYYY_coefficient_16_0048 : Poly :=
[
  term ((1328836024 : Rat) / 99568455) [(15, 2)]
]

/-- Partial product 48 for generator 16. -/
def rs_R009_ueqv_R009NYYYY_partial_16_0048 : Poly :=
[
  term ((-2657672048 : Rat) / 99568455) [(0, 1), (6, 1), (15, 2)],
  term ((1328836024 : Rat) / 99568455) [(0, 2), (15, 2)],
  term ((-2657672048 : Rat) / 99568455) [(1, 1), (7, 1), (15, 2)],
  term ((1328836024 : Rat) / 99568455) [(1, 2), (15, 2)],
  term ((2657672048 : Rat) / 99568455) [(6, 1), (15, 2)],
  term ((-1328836024 : Rat) / 99568455) [(15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 16. -/
theorem rs_R009_ueqv_R009NYYYY_partial_16_0048_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_16_0048
        rs_R009_ueqv_R009NYYYY_generator_16_0000_0051 =
      rs_R009_ueqv_R009NYYYY_partial_16_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NYYYY_coefficient_16_0049 : Poly :=
[
  term ((-84720 : Rat) / 32699) [(15, 2), (16, 1)]
]

/-- Partial product 49 for generator 16. -/
def rs_R009_ueqv_R009NYYYY_partial_16_0049 : Poly :=
[
  term ((169440 : Rat) / 32699) [(0, 1), (6, 1), (15, 2), (16, 1)],
  term ((-84720 : Rat) / 32699) [(0, 2), (15, 2), (16, 1)],
  term ((169440 : Rat) / 32699) [(1, 1), (7, 1), (15, 2), (16, 1)],
  term ((-84720 : Rat) / 32699) [(1, 2), (15, 2), (16, 1)],
  term ((-169440 : Rat) / 32699) [(6, 1), (15, 2), (16, 1)],
  term ((84720 : Rat) / 32699) [(15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 16. -/
theorem rs_R009_ueqv_R009NYYYY_partial_16_0049_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_16_0049
        rs_R009_ueqv_R009NYYYY_generator_16_0000_0051 =
      rs_R009_ueqv_R009NYYYY_partial_16_0049 := by
  native_decide

/-- Coefficient term 50 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NYYYY_coefficient_16_0050 : Poly :=
[
  term ((-5315344096 : Rat) / 14224065) [(15, 4)]
]

/-- Partial product 50 for generator 16. -/
def rs_R009_ueqv_R009NYYYY_partial_16_0050 : Poly :=
[
  term ((10630688192 : Rat) / 14224065) [(0, 1), (6, 1), (15, 4)],
  term ((-5315344096 : Rat) / 14224065) [(0, 2), (15, 4)],
  term ((10630688192 : Rat) / 14224065) [(1, 1), (7, 1), (15, 4)],
  term ((-5315344096 : Rat) / 14224065) [(1, 2), (15, 4)],
  term ((-10630688192 : Rat) / 14224065) [(6, 1), (15, 4)],
  term ((5315344096 : Rat) / 14224065) [(15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 50 for generator 16. -/
theorem rs_R009_ueqv_R009NYYYY_partial_16_0050_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_16_0050
        rs_R009_ueqv_R009NYYYY_generator_16_0000_0051 =
      rs_R009_ueqv_R009NYYYY_partial_16_0050 := by
  native_decide

/-- Coefficient term 51 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NYYYY_coefficient_16_0051 : Poly :=
[
  term ((2372160 : Rat) / 32699) [(15, 4), (16, 1)]
]

/-- Partial product 51 for generator 16. -/
def rs_R009_ueqv_R009NYYYY_partial_16_0051 : Poly :=
[
  term ((-4744320 : Rat) / 32699) [(0, 1), (6, 1), (15, 4), (16, 1)],
  term ((2372160 : Rat) / 32699) [(0, 2), (15, 4), (16, 1)],
  term ((-4744320 : Rat) / 32699) [(1, 1), (7, 1), (15, 4), (16, 1)],
  term ((2372160 : Rat) / 32699) [(1, 2), (15, 4), (16, 1)],
  term ((4744320 : Rat) / 32699) [(6, 1), (15, 4), (16, 1)],
  term ((-2372160 : Rat) / 32699) [(15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 51 for generator 16. -/
theorem rs_R009_ueqv_R009NYYYY_partial_16_0051_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_16_0051
        rs_R009_ueqv_R009NYYYY_generator_16_0000_0051 =
      rs_R009_ueqv_R009NYYYY_partial_16_0051 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NYYYY_partials_16_0000_0051 : List Poly :=
[
  rs_R009_ueqv_R009NYYYY_partial_16_0000,
  rs_R009_ueqv_R009NYYYY_partial_16_0001,
  rs_R009_ueqv_R009NYYYY_partial_16_0002,
  rs_R009_ueqv_R009NYYYY_partial_16_0003,
  rs_R009_ueqv_R009NYYYY_partial_16_0004,
  rs_R009_ueqv_R009NYYYY_partial_16_0005,
  rs_R009_ueqv_R009NYYYY_partial_16_0006,
  rs_R009_ueqv_R009NYYYY_partial_16_0007,
  rs_R009_ueqv_R009NYYYY_partial_16_0008,
  rs_R009_ueqv_R009NYYYY_partial_16_0009,
  rs_R009_ueqv_R009NYYYY_partial_16_0010,
  rs_R009_ueqv_R009NYYYY_partial_16_0011,
  rs_R009_ueqv_R009NYYYY_partial_16_0012,
  rs_R009_ueqv_R009NYYYY_partial_16_0013,
  rs_R009_ueqv_R009NYYYY_partial_16_0014,
  rs_R009_ueqv_R009NYYYY_partial_16_0015,
  rs_R009_ueqv_R009NYYYY_partial_16_0016,
  rs_R009_ueqv_R009NYYYY_partial_16_0017,
  rs_R009_ueqv_R009NYYYY_partial_16_0018,
  rs_R009_ueqv_R009NYYYY_partial_16_0019,
  rs_R009_ueqv_R009NYYYY_partial_16_0020,
  rs_R009_ueqv_R009NYYYY_partial_16_0021,
  rs_R009_ueqv_R009NYYYY_partial_16_0022,
  rs_R009_ueqv_R009NYYYY_partial_16_0023,
  rs_R009_ueqv_R009NYYYY_partial_16_0024,
  rs_R009_ueqv_R009NYYYY_partial_16_0025,
  rs_R009_ueqv_R009NYYYY_partial_16_0026,
  rs_R009_ueqv_R009NYYYY_partial_16_0027,
  rs_R009_ueqv_R009NYYYY_partial_16_0028,
  rs_R009_ueqv_R009NYYYY_partial_16_0029,
  rs_R009_ueqv_R009NYYYY_partial_16_0030,
  rs_R009_ueqv_R009NYYYY_partial_16_0031,
  rs_R009_ueqv_R009NYYYY_partial_16_0032,
  rs_R009_ueqv_R009NYYYY_partial_16_0033,
  rs_R009_ueqv_R009NYYYY_partial_16_0034,
  rs_R009_ueqv_R009NYYYY_partial_16_0035,
  rs_R009_ueqv_R009NYYYY_partial_16_0036,
  rs_R009_ueqv_R009NYYYY_partial_16_0037,
  rs_R009_ueqv_R009NYYYY_partial_16_0038,
  rs_R009_ueqv_R009NYYYY_partial_16_0039,
  rs_R009_ueqv_R009NYYYY_partial_16_0040,
  rs_R009_ueqv_R009NYYYY_partial_16_0041,
  rs_R009_ueqv_R009NYYYY_partial_16_0042,
  rs_R009_ueqv_R009NYYYY_partial_16_0043,
  rs_R009_ueqv_R009NYYYY_partial_16_0044,
  rs_R009_ueqv_R009NYYYY_partial_16_0045,
  rs_R009_ueqv_R009NYYYY_partial_16_0046,
  rs_R009_ueqv_R009NYYYY_partial_16_0047,
  rs_R009_ueqv_R009NYYYY_partial_16_0048,
  rs_R009_ueqv_R009NYYYY_partial_16_0049,
  rs_R009_ueqv_R009NYYYY_partial_16_0050,
  rs_R009_ueqv_R009NYYYY_partial_16_0051
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NYYYY_block_16_0000_0051 : Poly :=
[
  term ((3986508072 : Rat) / 33189485) [(0, 1), (3, 1), (6, 1), (10, 1), (12, 1), (15, 1)],
  term ((-762480 : Rat) / 32699) [(0, 1), (3, 1), (6, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((5315344096 : Rat) / 33189485) [(0, 1), (3, 1), (6, 1), (10, 1), (13, 1), (15, 2)],
  term ((-1016640 : Rat) / 32699) [(0, 1), (3, 1), (6, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((332209006 : Rat) / 4741355) [(0, 1), (3, 1), (6, 1), (10, 1), (15, 1)],
  term ((-444780 : Rat) / 32699) [(0, 1), (3, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((-1328836024 : Rat) / 33189485) [(0, 1), (3, 1), (6, 1), (10, 1), (15, 3)],
  term ((254160 : Rat) / 32699) [(0, 1), (3, 1), (6, 1), (10, 1), (15, 3), (16, 1)],
  term ((3986508072 : Rat) / 33189485) [(0, 1), (3, 1), (6, 1), (11, 1), (13, 1), (15, 1)],
  term ((-762480 : Rat) / 32699) [(0, 1), (3, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((29234392528 : Rat) / 33189485) [(0, 1), (3, 1), (6, 1), (11, 1), (15, 2)],
  term ((-5591520 : Rat) / 32699) [(0, 1), (3, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((2657672048 : Rat) / 6637897) [(0, 1), (3, 1), (6, 1), (12, 1), (15, 1)],
  term ((-2541600 : Rat) / 32699) [(0, 1), (3, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((10630688192 : Rat) / 19913691) [(0, 1), (3, 1), (6, 1), (13, 1), (15, 2)],
  term ((-3388800 : Rat) / 32699) [(0, 1), (3, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1328836024 : Rat) / 4741355) [(0, 1), (3, 1), (6, 1), (15, 1)],
  term ((1779120 : Rat) / 32699) [(0, 1), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((-5315344096 : Rat) / 14224065) [(0, 1), (3, 1), (6, 1), (15, 3)],
  term ((2372160 : Rat) / 32699) [(0, 1), (3, 1), (6, 1), (15, 3), (16, 1)],
  term ((-7973016144 : Rat) / 33189485) [(0, 1), (6, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((1524960 : Rat) / 32699) [(0, 1), (6, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((7640807138 : Rat) / 33189485) [(0, 1), (6, 1), (10, 1), (13, 1), (15, 1)],
  term ((-1461420 : Rat) / 32699) [(0, 1), (6, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-14617196264 : Rat) / 33189485) [(0, 1), (6, 1), (10, 1), (13, 1), (15, 3)],
  term ((2795760 : Rat) / 32699) [(0, 1), (6, 1), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((15946032288 : Rat) / 33189485) [(0, 1), (6, 1), (10, 1), (13, 2), (15, 2)],
  term ((-3049920 : Rat) / 32699) [(0, 1), (6, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((-664418012 : Rat) / 6637897) [(0, 1), (6, 1), (10, 1), (15, 2)],
  term ((635400 : Rat) / 32699) [(0, 1), (6, 1), (10, 1), (15, 2), (16, 1)],
  term ((2657672048 : Rat) / 33189485) [(0, 1), (6, 1), (10, 1), (15, 4)],
  term ((-508320 : Rat) / 32699) [(0, 1), (6, 1), (10, 1), (15, 4), (16, 1)],
  term ((-34549736624 : Rat) / 33189485) [(0, 1), (6, 1), (11, 1), (12, 1), (15, 1)],
  term ((6608160 : Rat) / 32699) [(0, 1), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((9301852168 : Rat) / 4741355) [(0, 1), (6, 1), (11, 1), (13, 1), (15, 2)],
  term ((-12453840 : Rat) / 32699) [(0, 1), (6, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((36875199666 : Rat) / 33189485) [(0, 1), (6, 1), (11, 1), (15, 1)],
  term ((-7052940 : Rat) / 32699) [(0, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-14617196264 : Rat) / 33189485) [(0, 1), (6, 1), (11, 1), (15, 3)],
  term ((2795760 : Rat) / 32699) [(0, 1), (6, 1), (11, 1), (15, 3), (16, 1)],
  term ((-5315344096 : Rat) / 6637897) [(0, 1), (6, 1), (12, 1), (13, 1), (15, 1)],
  term ((5083200 : Rat) / 32699) [(0, 1), (6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((58468785056 : Rat) / 99568455) [(0, 1), (6, 1), (13, 1), (15, 1)],
  term ((-3727680 : Rat) / 32699) [(0, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-217929107936 : Rat) / 99568455) [(0, 1), (6, 1), (13, 1), (15, 3)],
  term ((13894080 : Rat) / 32699) [(0, 1), (6, 1), (13, 1), (15, 3), (16, 1)],
  term ((10630688192 : Rat) / 6637897) [(0, 1), (6, 1), (13, 2), (15, 2)],
  term ((-10166400 : Rat) / 32699) [(0, 1), (6, 1), (13, 2), (15, 2), (16, 1)],
  term ((-2657672048 : Rat) / 99568455) [(0, 1), (6, 1), (15, 2)],
  term ((169440 : Rat) / 32699) [(0, 1), (6, 1), (15, 2), (16, 1)],
  term ((10630688192 : Rat) / 14224065) [(0, 1), (6, 1), (15, 4)],
  term ((-4744320 : Rat) / 32699) [(0, 1), (6, 1), (15, 4), (16, 1)],
  term ((-1993254036 : Rat) / 33189485) [(0, 2), (3, 1), (10, 1), (12, 1), (15, 1)],
  term ((381240 : Rat) / 32699) [(0, 2), (3, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2657672048 : Rat) / 33189485) [(0, 2), (3, 1), (10, 1), (13, 1), (15, 2)],
  term ((508320 : Rat) / 32699) [(0, 2), (3, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-166104503 : Rat) / 4741355) [(0, 2), (3, 1), (10, 1), (15, 1)],
  term ((222390 : Rat) / 32699) [(0, 2), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((664418012 : Rat) / 33189485) [(0, 2), (3, 1), (10, 1), (15, 3)],
  term ((-127080 : Rat) / 32699) [(0, 2), (3, 1), (10, 1), (15, 3), (16, 1)],
  term ((-1993254036 : Rat) / 33189485) [(0, 2), (3, 1), (11, 1), (13, 1), (15, 1)],
  term ((381240 : Rat) / 32699) [(0, 2), (3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-14617196264 : Rat) / 33189485) [(0, 2), (3, 1), (11, 1), (15, 2)],
  term ((2795760 : Rat) / 32699) [(0, 2), (3, 1), (11, 1), (15, 2), (16, 1)],
  term ((-1328836024 : Rat) / 6637897) [(0, 2), (3, 1), (12, 1), (15, 1)],
  term ((1270800 : Rat) / 32699) [(0, 2), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((-5315344096 : Rat) / 19913691) [(0, 2), (3, 1), (13, 1), (15, 2)],
  term ((1694400 : Rat) / 32699) [(0, 2), (3, 1), (13, 1), (15, 2), (16, 1)],
  term ((664418012 : Rat) / 4741355) [(0, 2), (3, 1), (15, 1)],
  term ((-889560 : Rat) / 32699) [(0, 2), (3, 1), (15, 1), (16, 1)],
  term ((2657672048 : Rat) / 14224065) [(0, 2), (3, 1), (15, 3)],
  term ((-1186080 : Rat) / 32699) [(0, 2), (3, 1), (15, 3), (16, 1)],
  term ((3986508072 : Rat) / 33189485) [(0, 2), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-762480 : Rat) / 32699) [(0, 2), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3820403569 : Rat) / 33189485) [(0, 2), (10, 1), (13, 1), (15, 1)],
  term ((730710 : Rat) / 32699) [(0, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((7308598132 : Rat) / 33189485) [(0, 2), (10, 1), (13, 1), (15, 3)],
  term ((-1397880 : Rat) / 32699) [(0, 2), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((-7973016144 : Rat) / 33189485) [(0, 2), (10, 1), (13, 2), (15, 2)],
  term ((1524960 : Rat) / 32699) [(0, 2), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((332209006 : Rat) / 6637897) [(0, 2), (10, 1), (15, 2)],
  term ((-317700 : Rat) / 32699) [(0, 2), (10, 1), (15, 2), (16, 1)],
  term ((-1328836024 : Rat) / 33189485) [(0, 2), (10, 1), (15, 4)],
  term ((254160 : Rat) / 32699) [(0, 2), (10, 1), (15, 4), (16, 1)],
  term ((17274868312 : Rat) / 33189485) [(0, 2), (11, 1), (12, 1), (15, 1)],
  term ((-3304080 : Rat) / 32699) [(0, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-4650926084 : Rat) / 4741355) [(0, 2), (11, 1), (13, 1), (15, 2)],
  term ((6226920 : Rat) / 32699) [(0, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-18437599833 : Rat) / 33189485) [(0, 2), (11, 1), (15, 1)],
  term ((3526470 : Rat) / 32699) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((7308598132 : Rat) / 33189485) [(0, 2), (11, 1), (15, 3)],
  term ((-1397880 : Rat) / 32699) [(0, 2), (11, 1), (15, 3), (16, 1)],
  term ((2657672048 : Rat) / 6637897) [(0, 2), (12, 1), (13, 1), (15, 1)],
  term ((-2541600 : Rat) / 32699) [(0, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-29234392528 : Rat) / 99568455) [(0, 2), (13, 1), (15, 1)],
  term ((1863840 : Rat) / 32699) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((108964553968 : Rat) / 99568455) [(0, 2), (13, 1), (15, 3)],
  term ((-6947040 : Rat) / 32699) [(0, 2), (13, 1), (15, 3), (16, 1)],
  term ((-5315344096 : Rat) / 6637897) [(0, 2), (13, 2), (15, 2)],
  term ((5083200 : Rat) / 32699) [(0, 2), (13, 2), (15, 2), (16, 1)],
  term ((1328836024 : Rat) / 99568455) [(0, 2), (15, 2)],
  term ((-84720 : Rat) / 32699) [(0, 2), (15, 2), (16, 1)],
  term ((-5315344096 : Rat) / 14224065) [(0, 2), (15, 4)],
  term ((2372160 : Rat) / 32699) [(0, 2), (15, 4), (16, 1)],
  term ((3986508072 : Rat) / 33189485) [(1, 1), (3, 1), (7, 1), (10, 1), (12, 1), (15, 1)],
  term ((-762480 : Rat) / 32699) [(1, 1), (3, 1), (7, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((5315344096 : Rat) / 33189485) [(1, 1), (3, 1), (7, 1), (10, 1), (13, 1), (15, 2)],
  term ((-1016640 : Rat) / 32699) [(1, 1), (3, 1), (7, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((332209006 : Rat) / 4741355) [(1, 1), (3, 1), (7, 1), (10, 1), (15, 1)],
  term ((-444780 : Rat) / 32699) [(1, 1), (3, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-1328836024 : Rat) / 33189485) [(1, 1), (3, 1), (7, 1), (10, 1), (15, 3)],
  term ((254160 : Rat) / 32699) [(1, 1), (3, 1), (7, 1), (10, 1), (15, 3), (16, 1)],
  term ((3986508072 : Rat) / 33189485) [(1, 1), (3, 1), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((-762480 : Rat) / 32699) [(1, 1), (3, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((29234392528 : Rat) / 33189485) [(1, 1), (3, 1), (7, 1), (11, 1), (15, 2)],
  term ((-5591520 : Rat) / 32699) [(1, 1), (3, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((2657672048 : Rat) / 6637897) [(1, 1), (3, 1), (7, 1), (12, 1), (15, 1)],
  term ((-2541600 : Rat) / 32699) [(1, 1), (3, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((10630688192 : Rat) / 19913691) [(1, 1), (3, 1), (7, 1), (13, 1), (15, 2)],
  term ((-3388800 : Rat) / 32699) [(1, 1), (3, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1328836024 : Rat) / 4741355) [(1, 1), (3, 1), (7, 1), (15, 1)],
  term ((1779120 : Rat) / 32699) [(1, 1), (3, 1), (7, 1), (15, 1), (16, 1)],
  term ((-5315344096 : Rat) / 14224065) [(1, 1), (3, 1), (7, 1), (15, 3)],
  term ((2372160 : Rat) / 32699) [(1, 1), (3, 1), (7, 1), (15, 3), (16, 1)],
  term ((-7973016144 : Rat) / 33189485) [(1, 1), (7, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((1524960 : Rat) / 32699) [(1, 1), (7, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((7640807138 : Rat) / 33189485) [(1, 1), (7, 1), (10, 1), (13, 1), (15, 1)],
  term ((-1461420 : Rat) / 32699) [(1, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-14617196264 : Rat) / 33189485) [(1, 1), (7, 1), (10, 1), (13, 1), (15, 3)],
  term ((2795760 : Rat) / 32699) [(1, 1), (7, 1), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((15946032288 : Rat) / 33189485) [(1, 1), (7, 1), (10, 1), (13, 2), (15, 2)],
  term ((-3049920 : Rat) / 32699) [(1, 1), (7, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((-664418012 : Rat) / 6637897) [(1, 1), (7, 1), (10, 1), (15, 2)],
  term ((635400 : Rat) / 32699) [(1, 1), (7, 1), (10, 1), (15, 2), (16, 1)],
  term ((2657672048 : Rat) / 33189485) [(1, 1), (7, 1), (10, 1), (15, 4)],
  term ((-508320 : Rat) / 32699) [(1, 1), (7, 1), (10, 1), (15, 4), (16, 1)],
  term ((-34549736624 : Rat) / 33189485) [(1, 1), (7, 1), (11, 1), (12, 1), (15, 1)],
  term ((6608160 : Rat) / 32699) [(1, 1), (7, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((9301852168 : Rat) / 4741355) [(1, 1), (7, 1), (11, 1), (13, 1), (15, 2)],
  term ((-12453840 : Rat) / 32699) [(1, 1), (7, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((36875199666 : Rat) / 33189485) [(1, 1), (7, 1), (11, 1), (15, 1)],
  term ((-7052940 : Rat) / 32699) [(1, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-14617196264 : Rat) / 33189485) [(1, 1), (7, 1), (11, 1), (15, 3)],
  term ((2795760 : Rat) / 32699) [(1, 1), (7, 1), (11, 1), (15, 3), (16, 1)],
  term ((-5315344096 : Rat) / 6637897) [(1, 1), (7, 1), (12, 1), (13, 1), (15, 1)],
  term ((5083200 : Rat) / 32699) [(1, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((58468785056 : Rat) / 99568455) [(1, 1), (7, 1), (13, 1), (15, 1)],
  term ((-3727680 : Rat) / 32699) [(1, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-217929107936 : Rat) / 99568455) [(1, 1), (7, 1), (13, 1), (15, 3)],
  term ((13894080 : Rat) / 32699) [(1, 1), (7, 1), (13, 1), (15, 3), (16, 1)],
  term ((10630688192 : Rat) / 6637897) [(1, 1), (7, 1), (13, 2), (15, 2)],
  term ((-10166400 : Rat) / 32699) [(1, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((-2657672048 : Rat) / 99568455) [(1, 1), (7, 1), (15, 2)],
  term ((169440 : Rat) / 32699) [(1, 1), (7, 1), (15, 2), (16, 1)],
  term ((10630688192 : Rat) / 14224065) [(1, 1), (7, 1), (15, 4)],
  term ((-4744320 : Rat) / 32699) [(1, 1), (7, 1), (15, 4), (16, 1)],
  term ((-1993254036 : Rat) / 33189485) [(1, 2), (3, 1), (10, 1), (12, 1), (15, 1)],
  term ((381240 : Rat) / 32699) [(1, 2), (3, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2657672048 : Rat) / 33189485) [(1, 2), (3, 1), (10, 1), (13, 1), (15, 2)],
  term ((508320 : Rat) / 32699) [(1, 2), (3, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-166104503 : Rat) / 4741355) [(1, 2), (3, 1), (10, 1), (15, 1)],
  term ((222390 : Rat) / 32699) [(1, 2), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((664418012 : Rat) / 33189485) [(1, 2), (3, 1), (10, 1), (15, 3)],
  term ((-127080 : Rat) / 32699) [(1, 2), (3, 1), (10, 1), (15, 3), (16, 1)],
  term ((-1993254036 : Rat) / 33189485) [(1, 2), (3, 1), (11, 1), (13, 1), (15, 1)],
  term ((381240 : Rat) / 32699) [(1, 2), (3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-14617196264 : Rat) / 33189485) [(1, 2), (3, 1), (11, 1), (15, 2)],
  term ((2795760 : Rat) / 32699) [(1, 2), (3, 1), (11, 1), (15, 2), (16, 1)],
  term ((-1328836024 : Rat) / 6637897) [(1, 2), (3, 1), (12, 1), (15, 1)],
  term ((1270800 : Rat) / 32699) [(1, 2), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((-5315344096 : Rat) / 19913691) [(1, 2), (3, 1), (13, 1), (15, 2)],
  term ((1694400 : Rat) / 32699) [(1, 2), (3, 1), (13, 1), (15, 2), (16, 1)],
  term ((664418012 : Rat) / 4741355) [(1, 2), (3, 1), (15, 1)],
  term ((-889560 : Rat) / 32699) [(1, 2), (3, 1), (15, 1), (16, 1)],
  term ((2657672048 : Rat) / 14224065) [(1, 2), (3, 1), (15, 3)],
  term ((-1186080 : Rat) / 32699) [(1, 2), (3, 1), (15, 3), (16, 1)],
  term ((3986508072 : Rat) / 33189485) [(1, 2), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-762480 : Rat) / 32699) [(1, 2), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3820403569 : Rat) / 33189485) [(1, 2), (10, 1), (13, 1), (15, 1)],
  term ((730710 : Rat) / 32699) [(1, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((7308598132 : Rat) / 33189485) [(1, 2), (10, 1), (13, 1), (15, 3)],
  term ((-1397880 : Rat) / 32699) [(1, 2), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((-7973016144 : Rat) / 33189485) [(1, 2), (10, 1), (13, 2), (15, 2)],
  term ((1524960 : Rat) / 32699) [(1, 2), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((332209006 : Rat) / 6637897) [(1, 2), (10, 1), (15, 2)],
  term ((-317700 : Rat) / 32699) [(1, 2), (10, 1), (15, 2), (16, 1)],
  term ((-1328836024 : Rat) / 33189485) [(1, 2), (10, 1), (15, 4)],
  term ((254160 : Rat) / 32699) [(1, 2), (10, 1), (15, 4), (16, 1)],
  term ((17274868312 : Rat) / 33189485) [(1, 2), (11, 1), (12, 1), (15, 1)],
  term ((-3304080 : Rat) / 32699) [(1, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-4650926084 : Rat) / 4741355) [(1, 2), (11, 1), (13, 1), (15, 2)],
  term ((6226920 : Rat) / 32699) [(1, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-18437599833 : Rat) / 33189485) [(1, 2), (11, 1), (15, 1)],
  term ((3526470 : Rat) / 32699) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((7308598132 : Rat) / 33189485) [(1, 2), (11, 1), (15, 3)],
  term ((-1397880 : Rat) / 32699) [(1, 2), (11, 1), (15, 3), (16, 1)],
  term ((2657672048 : Rat) / 6637897) [(1, 2), (12, 1), (13, 1), (15, 1)],
  term ((-2541600 : Rat) / 32699) [(1, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-29234392528 : Rat) / 99568455) [(1, 2), (13, 1), (15, 1)],
  term ((1863840 : Rat) / 32699) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((108964553968 : Rat) / 99568455) [(1, 2), (13, 1), (15, 3)],
  term ((-6947040 : Rat) / 32699) [(1, 2), (13, 1), (15, 3), (16, 1)],
  term ((-5315344096 : Rat) / 6637897) [(1, 2), (13, 2), (15, 2)],
  term ((5083200 : Rat) / 32699) [(1, 2), (13, 2), (15, 2), (16, 1)],
  term ((1328836024 : Rat) / 99568455) [(1, 2), (15, 2)],
  term ((-84720 : Rat) / 32699) [(1, 2), (15, 2), (16, 1)],
  term ((-5315344096 : Rat) / 14224065) [(1, 2), (15, 4)],
  term ((2372160 : Rat) / 32699) [(1, 2), (15, 4), (16, 1)],
  term ((-3986508072 : Rat) / 33189485) [(3, 1), (6, 1), (10, 1), (12, 1), (15, 1)],
  term ((762480 : Rat) / 32699) [(3, 1), (6, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-5315344096 : Rat) / 33189485) [(3, 1), (6, 1), (10, 1), (13, 1), (15, 2)],
  term ((1016640 : Rat) / 32699) [(3, 1), (6, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-332209006 : Rat) / 4741355) [(3, 1), (6, 1), (10, 1), (15, 1)],
  term ((444780 : Rat) / 32699) [(3, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((1328836024 : Rat) / 33189485) [(3, 1), (6, 1), (10, 1), (15, 3)],
  term ((-254160 : Rat) / 32699) [(3, 1), (6, 1), (10, 1), (15, 3), (16, 1)],
  term ((-3986508072 : Rat) / 33189485) [(3, 1), (6, 1), (11, 1), (13, 1), (15, 1)],
  term ((762480 : Rat) / 32699) [(3, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-29234392528 : Rat) / 33189485) [(3, 1), (6, 1), (11, 1), (15, 2)],
  term ((5591520 : Rat) / 32699) [(3, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((-2657672048 : Rat) / 6637897) [(3, 1), (6, 1), (12, 1), (15, 1)],
  term ((2541600 : Rat) / 32699) [(3, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-10630688192 : Rat) / 19913691) [(3, 1), (6, 1), (13, 1), (15, 2)],
  term ((3388800 : Rat) / 32699) [(3, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((1328836024 : Rat) / 4741355) [(3, 1), (6, 1), (15, 1)],
  term ((-1779120 : Rat) / 32699) [(3, 1), (6, 1), (15, 1), (16, 1)],
  term ((5315344096 : Rat) / 14224065) [(3, 1), (6, 1), (15, 3)],
  term ((-2372160 : Rat) / 32699) [(3, 1), (6, 1), (15, 3), (16, 1)],
  term ((1993254036 : Rat) / 33189485) [(3, 1), (10, 1), (12, 1), (15, 1)],
  term ((-381240 : Rat) / 32699) [(3, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((2657672048 : Rat) / 33189485) [(3, 1), (10, 1), (13, 1), (15, 2)],
  term ((-508320 : Rat) / 32699) [(3, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((166104503 : Rat) / 4741355) [(3, 1), (10, 1), (15, 1)],
  term ((-222390 : Rat) / 32699) [(3, 1), (10, 1), (15, 1), (16, 1)],
  term ((-664418012 : Rat) / 33189485) [(3, 1), (10, 1), (15, 3)],
  term ((127080 : Rat) / 32699) [(3, 1), (10, 1), (15, 3), (16, 1)],
  term ((1993254036 : Rat) / 33189485) [(3, 1), (11, 1), (13, 1), (15, 1)],
  term ((-381240 : Rat) / 32699) [(3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((14617196264 : Rat) / 33189485) [(3, 1), (11, 1), (15, 2)],
  term ((-2795760 : Rat) / 32699) [(3, 1), (11, 1), (15, 2), (16, 1)],
  term ((1328836024 : Rat) / 6637897) [(3, 1), (12, 1), (15, 1)],
  term ((-1270800 : Rat) / 32699) [(3, 1), (12, 1), (15, 1), (16, 1)],
  term ((5315344096 : Rat) / 19913691) [(3, 1), (13, 1), (15, 2)],
  term ((-1694400 : Rat) / 32699) [(3, 1), (13, 1), (15, 2), (16, 1)],
  term ((-664418012 : Rat) / 4741355) [(3, 1), (15, 1)],
  term ((889560 : Rat) / 32699) [(3, 1), (15, 1), (16, 1)],
  term ((-2657672048 : Rat) / 14224065) [(3, 1), (15, 3)],
  term ((1186080 : Rat) / 32699) [(3, 1), (15, 3), (16, 1)],
  term ((7973016144 : Rat) / 33189485) [(6, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-1524960 : Rat) / 32699) [(6, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-7640807138 : Rat) / 33189485) [(6, 1), (10, 1), (13, 1), (15, 1)],
  term ((1461420 : Rat) / 32699) [(6, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((14617196264 : Rat) / 33189485) [(6, 1), (10, 1), (13, 1), (15, 3)],
  term ((-2795760 : Rat) / 32699) [(6, 1), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((-15946032288 : Rat) / 33189485) [(6, 1), (10, 1), (13, 2), (15, 2)],
  term ((3049920 : Rat) / 32699) [(6, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((664418012 : Rat) / 6637897) [(6, 1), (10, 1), (15, 2)],
  term ((-635400 : Rat) / 32699) [(6, 1), (10, 1), (15, 2), (16, 1)],
  term ((-2657672048 : Rat) / 33189485) [(6, 1), (10, 1), (15, 4)],
  term ((508320 : Rat) / 32699) [(6, 1), (10, 1), (15, 4), (16, 1)],
  term ((34549736624 : Rat) / 33189485) [(6, 1), (11, 1), (12, 1), (15, 1)],
  term ((-6608160 : Rat) / 32699) [(6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-9301852168 : Rat) / 4741355) [(6, 1), (11, 1), (13, 1), (15, 2)],
  term ((12453840 : Rat) / 32699) [(6, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-36875199666 : Rat) / 33189485) [(6, 1), (11, 1), (15, 1)],
  term ((7052940 : Rat) / 32699) [(6, 1), (11, 1), (15, 1), (16, 1)],
  term ((14617196264 : Rat) / 33189485) [(6, 1), (11, 1), (15, 3)],
  term ((-2795760 : Rat) / 32699) [(6, 1), (11, 1), (15, 3), (16, 1)],
  term ((5315344096 : Rat) / 6637897) [(6, 1), (12, 1), (13, 1), (15, 1)],
  term ((-5083200 : Rat) / 32699) [(6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-58468785056 : Rat) / 99568455) [(6, 1), (13, 1), (15, 1)],
  term ((3727680 : Rat) / 32699) [(6, 1), (13, 1), (15, 1), (16, 1)],
  term ((217929107936 : Rat) / 99568455) [(6, 1), (13, 1), (15, 3)],
  term ((-13894080 : Rat) / 32699) [(6, 1), (13, 1), (15, 3), (16, 1)],
  term ((-10630688192 : Rat) / 6637897) [(6, 1), (13, 2), (15, 2)],
  term ((10166400 : Rat) / 32699) [(6, 1), (13, 2), (15, 2), (16, 1)],
  term ((2657672048 : Rat) / 99568455) [(6, 1), (15, 2)],
  term ((-169440 : Rat) / 32699) [(6, 1), (15, 2), (16, 1)],
  term ((-10630688192 : Rat) / 14224065) [(6, 1), (15, 4)],
  term ((4744320 : Rat) / 32699) [(6, 1), (15, 4), (16, 1)],
  term ((-3986508072 : Rat) / 33189485) [(10, 1), (12, 1), (13, 1), (15, 1)],
  term ((762480 : Rat) / 32699) [(10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((3820403569 : Rat) / 33189485) [(10, 1), (13, 1), (15, 1)],
  term ((-730710 : Rat) / 32699) [(10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-7308598132 : Rat) / 33189485) [(10, 1), (13, 1), (15, 3)],
  term ((1397880 : Rat) / 32699) [(10, 1), (13, 1), (15, 3), (16, 1)],
  term ((7973016144 : Rat) / 33189485) [(10, 1), (13, 2), (15, 2)],
  term ((-1524960 : Rat) / 32699) [(10, 1), (13, 2), (15, 2), (16, 1)],
  term ((-332209006 : Rat) / 6637897) [(10, 1), (15, 2)],
  term ((317700 : Rat) / 32699) [(10, 1), (15, 2), (16, 1)],
  term ((1328836024 : Rat) / 33189485) [(10, 1), (15, 4)],
  term ((-254160 : Rat) / 32699) [(10, 1), (15, 4), (16, 1)],
  term ((-17274868312 : Rat) / 33189485) [(11, 1), (12, 1), (15, 1)],
  term ((3304080 : Rat) / 32699) [(11, 1), (12, 1), (15, 1), (16, 1)],
  term ((4650926084 : Rat) / 4741355) [(11, 1), (13, 1), (15, 2)],
  term ((-6226920 : Rat) / 32699) [(11, 1), (13, 1), (15, 2), (16, 1)],
  term ((18437599833 : Rat) / 33189485) [(11, 1), (15, 1)],
  term ((-3526470 : Rat) / 32699) [(11, 1), (15, 1), (16, 1)],
  term ((-7308598132 : Rat) / 33189485) [(11, 1), (15, 3)],
  term ((1397880 : Rat) / 32699) [(11, 1), (15, 3), (16, 1)],
  term ((-2657672048 : Rat) / 6637897) [(12, 1), (13, 1), (15, 1)],
  term ((2541600 : Rat) / 32699) [(12, 1), (13, 1), (15, 1), (16, 1)],
  term ((29234392528 : Rat) / 99568455) [(13, 1), (15, 1)],
  term ((-1863840 : Rat) / 32699) [(13, 1), (15, 1), (16, 1)],
  term ((-108964553968 : Rat) / 99568455) [(13, 1), (15, 3)],
  term ((6947040 : Rat) / 32699) [(13, 1), (15, 3), (16, 1)],
  term ((5315344096 : Rat) / 6637897) [(13, 2), (15, 2)],
  term ((-5083200 : Rat) / 32699) [(13, 2), (15, 2), (16, 1)],
  term ((-1328836024 : Rat) / 99568455) [(15, 2)],
  term ((84720 : Rat) / 32699) [(15, 2), (16, 1)],
  term ((5315344096 : Rat) / 14224065) [(15, 4)],
  term ((-2372160 : Rat) / 32699) [(15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 16, terms 0 through 51. -/
theorem rs_R009_ueqv_R009NYYYY_block_16_0000_0051_valid :
    checkProductSumEq rs_R009_ueqv_R009NYYYY_partials_16_0000_0051
      rs_R009_ueqv_R009NYYYY_block_16_0000_0051 = true := by
  native_decide

end R009UeqvR009NYYYYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
