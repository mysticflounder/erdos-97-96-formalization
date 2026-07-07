/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R003:u=v:R003NN, term block 14:0-18

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R003UeqvR003NNTermShards

/-- Generator polynomial 14 for relaxed split surplus certificate `R003:u=v:R003NN`. -/
def rs_R003_ueqv_R003NN_generator_14_0000_0018 : Poly :=
[
  term (-2 : Rat) [(0, 1), (4, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (5, 1)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(4, 1), (6, 1)],
  term (2 : Rat) [(5, 1), (7, 1)],
  term (-1 : Rat) [(6, 2)],
  term (-1 : Rat) [(7, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 14. -/
def rs_R003_ueqv_R003NN_coefficient_14_0000 : Poly :=
[
  term ((-19709 : Rat) / 178716) [(0, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 0 for generator 14. -/
def rs_R003_ueqv_R003NN_partial_14_0000 : Poly :=
[
  term ((19709 : Rat) / 89358) [(0, 1), (1, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-19709 : Rat) / 178716) [(0, 1), (1, 2), (7, 1), (15, 1), (16, 1)],
  term ((-19709 : Rat) / 89358) [(0, 1), (4, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-19709 : Rat) / 89358) [(0, 1), (5, 1), (7, 2), (15, 1), (16, 1)],
  term ((19709 : Rat) / 178716) [(0, 1), (6, 2), (7, 1), (15, 1), (16, 1)],
  term ((19709 : Rat) / 178716) [(0, 1), (7, 3), (15, 1), (16, 1)],
  term ((19709 : Rat) / 89358) [(0, 2), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((-19709 : Rat) / 178716) [(0, 3), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 14. -/
theorem rs_R003_ueqv_R003NN_partial_14_0000_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_14_0000
        rs_R003_ueqv_R003NN_generator_14_0000_0018 =
      rs_R003_ueqv_R003NN_partial_14_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 14. -/
def rs_R003_ueqv_R003NN_coefficient_14_0001 : Poly :=
[
  term ((3428 : Rat) / 44679) [(0, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1 for generator 14. -/
def rs_R003_ueqv_R003NN_partial_14_0001 : Poly :=
[
  term ((-6856 : Rat) / 44679) [(0, 1), (1, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((3428 : Rat) / 44679) [(0, 1), (1, 2), (13, 1), (15, 1), (16, 1)],
  term ((6856 : Rat) / 44679) [(0, 1), (4, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((6856 : Rat) / 44679) [(0, 1), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3428 : Rat) / 44679) [(0, 1), (6, 2), (13, 1), (15, 1), (16, 1)],
  term ((-3428 : Rat) / 44679) [(0, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-6856 : Rat) / 44679) [(0, 2), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((3428 : Rat) / 44679) [(0, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 14. -/
theorem rs_R003_ueqv_R003NN_partial_14_0001_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_14_0001
        rs_R003_ueqv_R003NN_generator_14_0000_0018 =
      rs_R003_ueqv_R003NN_partial_14_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 14. -/
def rs_R003_ueqv_R003NN_coefficient_14_0002 : Poly :=
[
  term ((19709 : Rat) / 178716) [(1, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 2 for generator 14. -/
def rs_R003_ueqv_R003NN_partial_14_0002 : Poly :=
[
  term ((-19709 : Rat) / 89358) [(0, 1), (1, 1), (4, 1), (6, 1), (15, 1), (16, 1)],
  term ((19709 : Rat) / 178716) [(0, 2), (1, 1), (6, 1), (15, 1), (16, 1)],
  term ((19709 : Rat) / 89358) [(1, 1), (4, 1), (6, 2), (15, 1), (16, 1)],
  term ((19709 : Rat) / 89358) [(1, 1), (5, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-19709 : Rat) / 178716) [(1, 1), (6, 1), (7, 2), (15, 1), (16, 1)],
  term ((-19709 : Rat) / 178716) [(1, 1), (6, 3), (15, 1), (16, 1)],
  term ((-19709 : Rat) / 89358) [(1, 2), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((19709 : Rat) / 178716) [(1, 3), (6, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 14. -/
theorem rs_R003_ueqv_R003NN_partial_14_0002_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_14_0002
        rs_R003_ueqv_R003NN_generator_14_0000_0018 =
      rs_R003_ueqv_R003NN_partial_14_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 14. -/
def rs_R003_ueqv_R003NN_coefficient_14_0003 : Poly :=
[
  term ((-19709 : Rat) / 89358) [(1, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 3 for generator 14. -/
def rs_R003_ueqv_R003NN_partial_14_0003 : Poly :=
[
  term ((19709 : Rat) / 44679) [(0, 1), (1, 1), (4, 1), (12, 1), (15, 1), (16, 1)],
  term ((-19709 : Rat) / 89358) [(0, 2), (1, 1), (12, 1), (15, 1), (16, 1)],
  term ((-19709 : Rat) / 44679) [(1, 1), (4, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-19709 : Rat) / 44679) [(1, 1), (5, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((19709 : Rat) / 89358) [(1, 1), (6, 2), (12, 1), (15, 1), (16, 1)],
  term ((19709 : Rat) / 89358) [(1, 1), (7, 2), (12, 1), (15, 1), (16, 1)],
  term ((19709 : Rat) / 44679) [(1, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-19709 : Rat) / 89358) [(1, 3), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 14. -/
theorem rs_R003_ueqv_R003NN_partial_14_0003_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_14_0003
        rs_R003_ueqv_R003NN_generator_14_0000_0018 =
      rs_R003_ueqv_R003NN_partial_14_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 14. -/
def rs_R003_ueqv_R003NN_coefficient_14_0004 : Poly :=
[
  term ((12853 : Rat) / 178716) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 4 for generator 14. -/
def rs_R003_ueqv_R003NN_partial_14_0004 : Poly :=
[
  term ((-12853 : Rat) / 89358) [(0, 1), (1, 1), (4, 1), (15, 1), (16, 1)],
  term ((12853 : Rat) / 178716) [(0, 2), (1, 1), (15, 1), (16, 1)],
  term ((12853 : Rat) / 89358) [(1, 1), (4, 1), (6, 1), (15, 1), (16, 1)],
  term ((12853 : Rat) / 89358) [(1, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-12853 : Rat) / 178716) [(1, 1), (6, 2), (15, 1), (16, 1)],
  term ((-12853 : Rat) / 178716) [(1, 1), (7, 2), (15, 1), (16, 1)],
  term ((-12853 : Rat) / 89358) [(1, 2), (5, 1), (15, 1), (16, 1)],
  term ((12853 : Rat) / 178716) [(1, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 14. -/
theorem rs_R003_ueqv_R003NN_partial_14_0004_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_14_0004
        rs_R003_ueqv_R003NN_generator_14_0000_0018 =
      rs_R003_ueqv_R003NN_partial_14_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 14. -/
def rs_R003_ueqv_R003NN_coefficient_14_0005 : Poly :=
[
  term ((-199667 : Rat) / 536148) [(2, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 5 for generator 14. -/
def rs_R003_ueqv_R003NN_partial_14_0005 : Poly :=
[
  term ((199667 : Rat) / 268074) [(0, 1), (2, 1), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((-199667 : Rat) / 536148) [(0, 2), (2, 1), (7, 1), (15, 1), (16, 1)],
  term ((199667 : Rat) / 268074) [(1, 1), (2, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-199667 : Rat) / 536148) [(1, 2), (2, 1), (7, 1), (15, 1), (16, 1)],
  term ((-199667 : Rat) / 268074) [(2, 1), (4, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-199667 : Rat) / 268074) [(2, 1), (5, 1), (7, 2), (15, 1), (16, 1)],
  term ((199667 : Rat) / 536148) [(2, 1), (6, 2), (7, 1), (15, 1), (16, 1)],
  term ((199667 : Rat) / 536148) [(2, 1), (7, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 14. -/
theorem rs_R003_ueqv_R003NN_partial_14_0005_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_14_0005
        rs_R003_ueqv_R003NN_generator_14_0000_0018 =
      rs_R003_ueqv_R003NN_partial_14_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 14. -/
def rs_R003_ueqv_R003NN_coefficient_14_0006 : Poly :=
[
  term ((83123 : Rat) / 44679) [(2, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 6 for generator 14. -/
def rs_R003_ueqv_R003NN_partial_14_0006 : Poly :=
[
  term ((-166246 : Rat) / 44679) [(0, 1), (2, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((83123 : Rat) / 44679) [(0, 2), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((-166246 : Rat) / 44679) [(1, 1), (2, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((83123 : Rat) / 44679) [(1, 2), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((166246 : Rat) / 44679) [(2, 1), (4, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((166246 : Rat) / 44679) [(2, 1), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-83123 : Rat) / 44679) [(2, 1), (6, 2), (13, 1), (15, 1), (16, 1)],
  term ((-83123 : Rat) / 44679) [(2, 1), (7, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 14. -/
theorem rs_R003_ueqv_R003NN_partial_14_0006_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_14_0006
        rs_R003_ueqv_R003NN_generator_14_0000_0018 =
      rs_R003_ueqv_R003NN_partial_14_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 14. -/
def rs_R003_ueqv_R003NN_coefficient_14_0007 : Poly :=
[
  term ((199667 : Rat) / 536148) [(3, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 7 for generator 14. -/
def rs_R003_ueqv_R003NN_partial_14_0007 : Poly :=
[
  term ((-199667 : Rat) / 268074) [(0, 1), (3, 1), (4, 1), (6, 1), (15, 1), (16, 1)],
  term ((199667 : Rat) / 536148) [(0, 2), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((-199667 : Rat) / 268074) [(1, 1), (3, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((199667 : Rat) / 536148) [(1, 2), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((199667 : Rat) / 268074) [(3, 1), (4, 1), (6, 2), (15, 1), (16, 1)],
  term ((199667 : Rat) / 268074) [(3, 1), (5, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-199667 : Rat) / 536148) [(3, 1), (6, 1), (7, 2), (15, 1), (16, 1)],
  term ((-199667 : Rat) / 536148) [(3, 1), (6, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 14. -/
theorem rs_R003_ueqv_R003NN_partial_14_0007_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_14_0007
        rs_R003_ueqv_R003NN_generator_14_0000_0018 =
      rs_R003_ueqv_R003NN_partial_14_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 14. -/
def rs_R003_ueqv_R003NN_coefficient_14_0008 : Poly :=
[
  term ((-199667 : Rat) / 268074) [(3, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 8 for generator 14. -/
def rs_R003_ueqv_R003NN_partial_14_0008 : Poly :=
[
  term ((199667 : Rat) / 134037) [(0, 1), (3, 1), (4, 1), (12, 1), (15, 1), (16, 1)],
  term ((-199667 : Rat) / 268074) [(0, 2), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((199667 : Rat) / 134037) [(1, 1), (3, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-199667 : Rat) / 268074) [(1, 2), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((-199667 : Rat) / 134037) [(3, 1), (4, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-199667 : Rat) / 134037) [(3, 1), (5, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((199667 : Rat) / 268074) [(3, 1), (6, 2), (12, 1), (15, 1), (16, 1)],
  term ((199667 : Rat) / 268074) [(3, 1), (7, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 14. -/
theorem rs_R003_ueqv_R003NN_partial_14_0008_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_14_0008
        rs_R003_ueqv_R003NN_generator_14_0000_0018 =
      rs_R003_ueqv_R003NN_partial_14_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 14. -/
def rs_R003_ueqv_R003NN_coefficient_14_0009 : Poly :=
[
  term ((33421 : Rat) / 178716) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 9 for generator 14. -/
def rs_R003_ueqv_R003NN_partial_14_0009 : Poly :=
[
  term ((-33421 : Rat) / 89358) [(0, 1), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((33421 : Rat) / 178716) [(0, 2), (3, 1), (15, 1), (16, 1)],
  term ((-33421 : Rat) / 89358) [(1, 1), (3, 1), (5, 1), (15, 1), (16, 1)],
  term ((33421 : Rat) / 178716) [(1, 2), (3, 1), (15, 1), (16, 1)],
  term ((33421 : Rat) / 89358) [(3, 1), (4, 1), (6, 1), (15, 1), (16, 1)],
  term ((33421 : Rat) / 89358) [(3, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-33421 : Rat) / 178716) [(3, 1), (6, 2), (15, 1), (16, 1)],
  term ((-33421 : Rat) / 178716) [(3, 1), (7, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 14. -/
theorem rs_R003_ueqv_R003NN_partial_14_0009_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_14_0009
        rs_R003_ueqv_R003NN_generator_14_0000_0018 =
      rs_R003_ueqv_R003NN_partial_14_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 14. -/
def rs_R003_ueqv_R003NN_coefficient_14_0010 : Poly :=
[
  term ((-29993 : Rat) / 134037) [(4, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 10 for generator 14. -/
def rs_R003_ueqv_R003NN_partial_14_0010 : Poly :=
[
  term ((59986 : Rat) / 134037) [(0, 1), (4, 2), (13, 1), (15, 1), (16, 1)],
  term ((-29993 : Rat) / 134037) [(0, 2), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((59986 : Rat) / 134037) [(1, 1), (4, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-29993 : Rat) / 134037) [(1, 2), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-59986 : Rat) / 134037) [(4, 1), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((29993 : Rat) / 134037) [(4, 1), (6, 2), (13, 1), (15, 1), (16, 1)],
  term ((29993 : Rat) / 134037) [(4, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-59986 : Rat) / 134037) [(4, 2), (6, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 14. -/
theorem rs_R003_ueqv_R003NN_partial_14_0010_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_14_0010
        rs_R003_ueqv_R003NN_generator_14_0000_0018 =
      rs_R003_ueqv_R003NN_partial_14_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 14. -/
def rs_R003_ueqv_R003NN_coefficient_14_0011 : Poly :=
[
  term ((29993 : Rat) / 268074) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 11 for generator 14. -/
def rs_R003_ueqv_R003NN_partial_14_0011 : Poly :=
[
  term ((-29993 : Rat) / 134037) [(0, 1), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((29993 : Rat) / 268074) [(0, 2), (5, 1), (15, 1), (16, 1)],
  term ((-29993 : Rat) / 134037) [(1, 1), (5, 2), (15, 1), (16, 1)],
  term ((29993 : Rat) / 268074) [(1, 2), (5, 1), (15, 1), (16, 1)],
  term ((29993 : Rat) / 134037) [(4, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-29993 : Rat) / 268074) [(5, 1), (6, 2), (15, 1), (16, 1)],
  term ((-29993 : Rat) / 268074) [(5, 1), (7, 2), (15, 1), (16, 1)],
  term ((29993 : Rat) / 134037) [(5, 2), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 14. -/
theorem rs_R003_ueqv_R003NN_partial_14_0011_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_14_0011
        rs_R003_ueqv_R003NN_generator_14_0000_0018 =
      rs_R003_ueqv_R003NN_partial_14_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 14. -/
def rs_R003_ueqv_R003NN_coefficient_14_0012 : Poly :=
[
  term ((-8855 : Rat) / 29786) [(6, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 12 for generator 14. -/
def rs_R003_ueqv_R003NN_partial_14_0012 : Poly :=
[
  term ((8855 : Rat) / 14893) [(0, 1), (4, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-8855 : Rat) / 29786) [(0, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((8855 : Rat) / 14893) [(1, 1), (5, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-8855 : Rat) / 29786) [(1, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-8855 : Rat) / 14893) [(4, 1), (6, 2), (13, 1), (15, 1), (16, 1)],
  term ((-8855 : Rat) / 14893) [(5, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((8855 : Rat) / 29786) [(6, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((8855 : Rat) / 29786) [(6, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 14. -/
theorem rs_R003_ueqv_R003NN_partial_14_0012_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_14_0012
        rs_R003_ueqv_R003NN_generator_14_0000_0018 =
      rs_R003_ueqv_R003NN_partial_14_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 14. -/
def rs_R003_ueqv_R003NN_coefficient_14_0013 : Poly :=
[
  term ((19709 : Rat) / 178716) [(7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 13 for generator 14. -/
def rs_R003_ueqv_R003NN_partial_14_0013 : Poly :=
[
  term ((-19709 : Rat) / 89358) [(0, 1), (4, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((19709 : Rat) / 178716) [(0, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-19709 : Rat) / 89358) [(1, 1), (5, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((19709 : Rat) / 178716) [(1, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((19709 : Rat) / 89358) [(4, 1), (6, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((19709 : Rat) / 89358) [(5, 1), (7, 2), (12, 1), (15, 1), (16, 1)],
  term ((-19709 : Rat) / 178716) [(6, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-19709 : Rat) / 178716) [(7, 3), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 14. -/
theorem rs_R003_ueqv_R003NN_partial_14_0013_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_14_0013
        rs_R003_ueqv_R003NN_generator_14_0000_0018 =
      rs_R003_ueqv_R003NN_partial_14_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 14. -/
def rs_R003_ueqv_R003NN_coefficient_14_0014 : Poly :=
[
  term ((299071 : Rat) / 1072296) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 14 for generator 14. -/
def rs_R003_ueqv_R003NN_partial_14_0014 : Poly :=
[
  term ((-299071 : Rat) / 536148) [(0, 1), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((299071 : Rat) / 1072296) [(0, 2), (7, 1), (15, 1), (16, 1)],
  term ((-299071 : Rat) / 536148) [(1, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((299071 : Rat) / 1072296) [(1, 2), (7, 1), (15, 1), (16, 1)],
  term ((299071 : Rat) / 536148) [(4, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((299071 : Rat) / 536148) [(5, 1), (7, 2), (15, 1), (16, 1)],
  term ((-299071 : Rat) / 1072296) [(6, 2), (7, 1), (15, 1), (16, 1)],
  term ((-299071 : Rat) / 1072296) [(7, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 14. -/
theorem rs_R003_ueqv_R003NN_partial_14_0014_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_14_0014
        rs_R003_ueqv_R003NN_generator_14_0000_0018 =
      rs_R003_ueqv_R003NN_partial_14_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 14. -/
def rs_R003_ueqv_R003NN_coefficient_14_0015 : Poly :=
[
  term ((-3428 : Rat) / 44679) [(8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 15 for generator 14. -/
def rs_R003_ueqv_R003NN_partial_14_0015 : Poly :=
[
  term ((6856 : Rat) / 44679) [(0, 1), (4, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3428 : Rat) / 44679) [(0, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((6856 : Rat) / 44679) [(1, 1), (5, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3428 : Rat) / 44679) [(1, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-6856 : Rat) / 44679) [(4, 1), (6, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-6856 : Rat) / 44679) [(5, 1), (7, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((3428 : Rat) / 44679) [(6, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((3428 : Rat) / 44679) [(7, 2), (8, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 14. -/
theorem rs_R003_ueqv_R003NN_partial_14_0015_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_14_0015
        rs_R003_ueqv_R003NN_generator_14_0000_0018 =
      rs_R003_ueqv_R003NN_partial_14_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 14. -/
def rs_R003_ueqv_R003NN_coefficient_14_0016 : Poly :=
[
  term ((29993 : Rat) / 134037) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 16 for generator 14. -/
def rs_R003_ueqv_R003NN_partial_14_0016 : Poly :=
[
  term ((-59986 : Rat) / 134037) [(0, 1), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((29993 : Rat) / 134037) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((-59986 : Rat) / 134037) [(1, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((29993 : Rat) / 134037) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term ((59986 : Rat) / 134037) [(4, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((59986 : Rat) / 134037) [(5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-29993 : Rat) / 134037) [(6, 2), (9, 1), (15, 1), (16, 1)],
  term ((-29993 : Rat) / 134037) [(7, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 14. -/
theorem rs_R003_ueqv_R003NN_partial_14_0016_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_14_0016
        rs_R003_ueqv_R003NN_generator_14_0000_0018 =
      rs_R003_ueqv_R003NN_partial_14_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 14. -/
def rs_R003_ueqv_R003NN_coefficient_14_0017 : Poly :=
[
  term ((33421 : Rat) / 89358) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 17 for generator 14. -/
def rs_R003_ueqv_R003NN_partial_14_0017 : Poly :=
[
  term ((-33421 : Rat) / 44679) [(0, 1), (4, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((33421 : Rat) / 89358) [(0, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-33421 : Rat) / 44679) [(1, 1), (5, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((33421 : Rat) / 89358) [(1, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((33421 : Rat) / 44679) [(4, 1), (6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((33421 : Rat) / 44679) [(5, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-33421 : Rat) / 89358) [(6, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-33421 : Rat) / 89358) [(7, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 14. -/
theorem rs_R003_ueqv_R003NN_partial_14_0017_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_14_0017
        rs_R003_ueqv_R003NN_generator_14_0000_0018 =
      rs_R003_ueqv_R003NN_partial_14_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 14. -/
def rs_R003_ueqv_R003NN_coefficient_14_0018 : Poly :=
[
  term ((-616133 : Rat) / 536148) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 18 for generator 14. -/
def rs_R003_ueqv_R003NN_partial_14_0018 : Poly :=
[
  term ((616133 : Rat) / 268074) [(0, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-616133 : Rat) / 536148) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((616133 : Rat) / 268074) [(1, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-616133 : Rat) / 536148) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((-616133 : Rat) / 268074) [(4, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-616133 : Rat) / 268074) [(5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((616133 : Rat) / 536148) [(6, 2), (13, 1), (15, 1), (16, 1)],
  term ((616133 : Rat) / 536148) [(7, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 14. -/
theorem rs_R003_ueqv_R003NN_partial_14_0018_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_14_0018
        rs_R003_ueqv_R003NN_generator_14_0000_0018 =
      rs_R003_ueqv_R003NN_partial_14_0018 := by
  native_decide

/-- Partial products in this block. -/
def rs_R003_ueqv_R003NN_partials_14_0000_0018 : List Poly :=
[
  rs_R003_ueqv_R003NN_partial_14_0000,
  rs_R003_ueqv_R003NN_partial_14_0001,
  rs_R003_ueqv_R003NN_partial_14_0002,
  rs_R003_ueqv_R003NN_partial_14_0003,
  rs_R003_ueqv_R003NN_partial_14_0004,
  rs_R003_ueqv_R003NN_partial_14_0005,
  rs_R003_ueqv_R003NN_partial_14_0006,
  rs_R003_ueqv_R003NN_partial_14_0007,
  rs_R003_ueqv_R003NN_partial_14_0008,
  rs_R003_ueqv_R003NN_partial_14_0009,
  rs_R003_ueqv_R003NN_partial_14_0010,
  rs_R003_ueqv_R003NN_partial_14_0011,
  rs_R003_ueqv_R003NN_partial_14_0012,
  rs_R003_ueqv_R003NN_partial_14_0013,
  rs_R003_ueqv_R003NN_partial_14_0014,
  rs_R003_ueqv_R003NN_partial_14_0015,
  rs_R003_ueqv_R003NN_partial_14_0016,
  rs_R003_ueqv_R003NN_partial_14_0017,
  rs_R003_ueqv_R003NN_partial_14_0018
]

/-- Sum of partial products in this block. -/
def rs_R003_ueqv_R003NN_block_14_0000_0018 : Poly :=
[
  term ((-19709 : Rat) / 89358) [(0, 1), (1, 1), (4, 1), (6, 1), (15, 1), (16, 1)],
  term ((19709 : Rat) / 44679) [(0, 1), (1, 1), (4, 1), (12, 1), (15, 1), (16, 1)],
  term ((-12853 : Rat) / 89358) [(0, 1), (1, 1), (4, 1), (15, 1), (16, 1)],
  term ((19709 : Rat) / 89358) [(0, 1), (1, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-6856 : Rat) / 44679) [(0, 1), (1, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-19709 : Rat) / 178716) [(0, 1), (1, 2), (7, 1), (15, 1), (16, 1)],
  term ((3428 : Rat) / 44679) [(0, 1), (1, 2), (13, 1), (15, 1), (16, 1)],
  term ((199667 : Rat) / 268074) [(0, 1), (2, 1), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((-166246 : Rat) / 44679) [(0, 1), (2, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-199667 : Rat) / 268074) [(0, 1), (3, 1), (4, 1), (6, 1), (15, 1), (16, 1)],
  term ((199667 : Rat) / 134037) [(0, 1), (3, 1), (4, 1), (12, 1), (15, 1), (16, 1)],
  term ((-33421 : Rat) / 89358) [(0, 1), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((-29993 : Rat) / 134037) [(0, 1), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((-19709 : Rat) / 89358) [(0, 1), (4, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((33421 : Rat) / 44679) [(0, 1), (4, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-19709 : Rat) / 89358) [(0, 1), (4, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-299071 : Rat) / 536148) [(0, 1), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((6856 : Rat) / 44679) [(0, 1), (4, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-59986 : Rat) / 134037) [(0, 1), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((-33421 : Rat) / 44679) [(0, 1), (4, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((616133 : Rat) / 268074) [(0, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((59986 : Rat) / 134037) [(0, 1), (4, 2), (13, 1), (15, 1), (16, 1)],
  term ((6856 : Rat) / 44679) [(0, 1), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-19709 : Rat) / 89358) [(0, 1), (5, 1), (7, 2), (15, 1), (16, 1)],
  term ((19709 : Rat) / 178716) [(0, 1), (6, 2), (7, 1), (15, 1), (16, 1)],
  term ((-3428 : Rat) / 44679) [(0, 1), (6, 2), (13, 1), (15, 1), (16, 1)],
  term ((-3428 : Rat) / 44679) [(0, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((19709 : Rat) / 178716) [(0, 1), (7, 3), (15, 1), (16, 1)],
  term ((19709 : Rat) / 178716) [(0, 2), (1, 1), (6, 1), (15, 1), (16, 1)],
  term ((-19709 : Rat) / 89358) [(0, 2), (1, 1), (12, 1), (15, 1), (16, 1)],
  term ((12853 : Rat) / 178716) [(0, 2), (1, 1), (15, 1), (16, 1)],
  term ((-199667 : Rat) / 536148) [(0, 2), (2, 1), (7, 1), (15, 1), (16, 1)],
  term ((83123 : Rat) / 44679) [(0, 2), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((199667 : Rat) / 536148) [(0, 2), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((-199667 : Rat) / 268074) [(0, 2), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((33421 : Rat) / 178716) [(0, 2), (3, 1), (15, 1), (16, 1)],
  term ((19709 : Rat) / 89358) [(0, 2), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((-50561 : Rat) / 134037) [(0, 2), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((29993 : Rat) / 268074) [(0, 2), (5, 1), (15, 1), (16, 1)],
  term ((-8855 : Rat) / 29786) [(0, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((19709 : Rat) / 178716) [(0, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((299071 : Rat) / 1072296) [(0, 2), (7, 1), (15, 1), (16, 1)],
  term ((-3428 : Rat) / 44679) [(0, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((29993 : Rat) / 134037) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((33421 : Rat) / 89358) [(0, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-616133 : Rat) / 536148) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((-19709 : Rat) / 178716) [(0, 3), (7, 1), (15, 1), (16, 1)],
  term ((3428 : Rat) / 44679) [(0, 3), (13, 1), (15, 1), (16, 1)],
  term ((199667 : Rat) / 268074) [(1, 1), (2, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-166246 : Rat) / 44679) [(1, 1), (2, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-199667 : Rat) / 268074) [(1, 1), (3, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((199667 : Rat) / 134037) [(1, 1), (3, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-33421 : Rat) / 89358) [(1, 1), (3, 1), (5, 1), (15, 1), (16, 1)],
  term ((59986 : Rat) / 134037) [(1, 1), (4, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-19709 : Rat) / 44679) [(1, 1), (4, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((12853 : Rat) / 89358) [(1, 1), (4, 1), (6, 1), (15, 1), (16, 1)],
  term ((19709 : Rat) / 89358) [(1, 1), (4, 1), (6, 2), (15, 1), (16, 1)],
  term ((19709 : Rat) / 89358) [(1, 1), (5, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((8855 : Rat) / 14893) [(1, 1), (5, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-19709 : Rat) / 29786) [(1, 1), (5, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-221953 : Rat) / 536148) [(1, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((6856 : Rat) / 44679) [(1, 1), (5, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-59986 : Rat) / 134037) [(1, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((-33421 : Rat) / 44679) [(1, 1), (5, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((616133 : Rat) / 268074) [(1, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-29993 : Rat) / 134037) [(1, 1), (5, 2), (15, 1), (16, 1)],
  term ((-19709 : Rat) / 178716) [(1, 1), (6, 1), (7, 2), (15, 1), (16, 1)],
  term ((19709 : Rat) / 89358) [(1, 1), (6, 2), (12, 1), (15, 1), (16, 1)],
  term ((-12853 : Rat) / 178716) [(1, 1), (6, 2), (15, 1), (16, 1)],
  term ((-19709 : Rat) / 178716) [(1, 1), (6, 3), (15, 1), (16, 1)],
  term ((19709 : Rat) / 89358) [(1, 1), (7, 2), (12, 1), (15, 1), (16, 1)],
  term ((-12853 : Rat) / 178716) [(1, 1), (7, 2), (15, 1), (16, 1)],
  term ((-199667 : Rat) / 536148) [(1, 2), (2, 1), (7, 1), (15, 1), (16, 1)],
  term ((83123 : Rat) / 44679) [(1, 2), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((199667 : Rat) / 536148) [(1, 2), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((-199667 : Rat) / 268074) [(1, 2), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((33421 : Rat) / 178716) [(1, 2), (3, 1), (15, 1), (16, 1)],
  term ((-29993 : Rat) / 134037) [(1, 2), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-19709 : Rat) / 89358) [(1, 2), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((19709 : Rat) / 44679) [(1, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-4283 : Rat) / 134037) [(1, 2), (5, 1), (15, 1), (16, 1)],
  term ((-8855 : Rat) / 29786) [(1, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((19709 : Rat) / 178716) [(1, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((299071 : Rat) / 1072296) [(1, 2), (7, 1), (15, 1), (16, 1)],
  term ((-3428 : Rat) / 44679) [(1, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((29993 : Rat) / 134037) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term ((33421 : Rat) / 89358) [(1, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-616133 : Rat) / 536148) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((19709 : Rat) / 178716) [(1, 3), (6, 1), (15, 1), (16, 1)],
  term ((-19709 : Rat) / 89358) [(1, 3), (12, 1), (15, 1), (16, 1)],
  term ((12853 : Rat) / 178716) [(1, 3), (15, 1), (16, 1)],
  term ((-199667 : Rat) / 268074) [(2, 1), (4, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((166246 : Rat) / 44679) [(2, 1), (4, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((166246 : Rat) / 44679) [(2, 1), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-199667 : Rat) / 268074) [(2, 1), (5, 1), (7, 2), (15, 1), (16, 1)],
  term ((199667 : Rat) / 536148) [(2, 1), (6, 2), (7, 1), (15, 1), (16, 1)],
  term ((-83123 : Rat) / 44679) [(2, 1), (6, 2), (13, 1), (15, 1), (16, 1)],
  term ((-83123 : Rat) / 44679) [(2, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((199667 : Rat) / 536148) [(2, 1), (7, 3), (15, 1), (16, 1)],
  term ((-199667 : Rat) / 134037) [(3, 1), (4, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((33421 : Rat) / 89358) [(3, 1), (4, 1), (6, 1), (15, 1), (16, 1)],
  term ((199667 : Rat) / 268074) [(3, 1), (4, 1), (6, 2), (15, 1), (16, 1)],
  term ((199667 : Rat) / 268074) [(3, 1), (5, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-199667 : Rat) / 134037) [(3, 1), (5, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((33421 : Rat) / 89358) [(3, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-199667 : Rat) / 536148) [(3, 1), (6, 1), (7, 2), (15, 1), (16, 1)],
  term ((199667 : Rat) / 268074) [(3, 1), (6, 2), (12, 1), (15, 1), (16, 1)],
  term ((-33421 : Rat) / 178716) [(3, 1), (6, 2), (15, 1), (16, 1)],
  term ((-199667 : Rat) / 536148) [(3, 1), (6, 3), (15, 1), (16, 1)],
  term ((199667 : Rat) / 268074) [(3, 1), (7, 2), (12, 1), (15, 1), (16, 1)],
  term ((-33421 : Rat) / 178716) [(3, 1), (7, 2), (15, 1), (16, 1)],
  term ((29993 : Rat) / 134037) [(4, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-59986 : Rat) / 134037) [(4, 1), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((19709 : Rat) / 89358) [(4, 1), (6, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((299071 : Rat) / 536148) [(4, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-6856 : Rat) / 44679) [(4, 1), (6, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((59986 : Rat) / 134037) [(4, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((33421 : Rat) / 44679) [(4, 1), (6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-616133 : Rat) / 268074) [(4, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-49702 : Rat) / 134037) [(4, 1), (6, 2), (13, 1), (15, 1), (16, 1)],
  term ((29993 : Rat) / 134037) [(4, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-59986 : Rat) / 134037) [(4, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-8855 : Rat) / 14893) [(5, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-29993 : Rat) / 268074) [(5, 1), (6, 2), (15, 1), (16, 1)],
  term ((-6856 : Rat) / 44679) [(5, 1), (7, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((59986 : Rat) / 134037) [(5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((33421 : Rat) / 44679) [(5, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-616133 : Rat) / 268074) [(5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((19709 : Rat) / 89358) [(5, 1), (7, 2), (12, 1), (15, 1), (16, 1)],
  term ((26565 : Rat) / 59572) [(5, 1), (7, 2), (15, 1), (16, 1)],
  term ((29993 : Rat) / 134037) [(5, 2), (7, 1), (15, 1), (16, 1)],
  term ((8855 : Rat) / 29786) [(6, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-19709 : Rat) / 178716) [(6, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-299071 : Rat) / 1072296) [(6, 2), (7, 1), (15, 1), (16, 1)],
  term ((3428 : Rat) / 44679) [(6, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-29993 : Rat) / 134037) [(6, 2), (9, 1), (15, 1), (16, 1)],
  term ((-33421 : Rat) / 89358) [(6, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((616133 : Rat) / 536148) [(6, 2), (13, 1), (15, 1), (16, 1)],
  term ((8855 : Rat) / 29786) [(6, 3), (13, 1), (15, 1), (16, 1)],
  term ((3428 : Rat) / 44679) [(7, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-29993 : Rat) / 134037) [(7, 2), (9, 1), (15, 1), (16, 1)],
  term ((-33421 : Rat) / 89358) [(7, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((616133 : Rat) / 536148) [(7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-19709 : Rat) / 178716) [(7, 3), (12, 1), (15, 1), (16, 1)],
  term ((-299071 : Rat) / 1072296) [(7, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 14, terms 0 through 18. -/
theorem rs_R003_ueqv_R003NN_block_14_0000_0018_valid :
    checkProductSumEq rs_R003_ueqv_R003NN_partials_14_0000_0018
      rs_R003_ueqv_R003NN_block_14_0000_0018 = true := by
  native_decide

end R003UeqvR003NNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
