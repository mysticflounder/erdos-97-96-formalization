/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R003:u=v:R003NN, term block 9:0-31

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R003UeqvR003NNTermShards

/-- Generator polynomial 9 for relaxed split surplus certificate `R003:u=v:R003NN`. -/
def rs_R003_ueqv_R003NN_generator_09_0000_0031 : Poly :=
[
  term (1 : Rat) [],
  term (-2 : Rat) [(0, 1)],
  term (2 : Rat) [(0, 1), (12, 1)],
  term (2 : Rat) [(1, 1), (13, 1)],
  term (-1 : Rat) [(12, 2)],
  term (-1 : Rat) [(13, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 9. -/
def rs_R003_ueqv_R003NN_coefficient_09_0000 : Poly :=
[
  term (-86 : Rat) []
]

/-- Partial product 0 for generator 9. -/
def rs_R003_ueqv_R003NN_partial_09_0000 : Poly :=
[
  term (-86 : Rat) [],
  term (172 : Rat) [(0, 1)],
  term (-172 : Rat) [(0, 1), (12, 1)],
  term (-172 : Rat) [(1, 1), (13, 1)],
  term (86 : Rat) [(12, 2)],
  term (86 : Rat) [(13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 9. -/
theorem rs_R003_ueqv_R003NN_partial_09_0000_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_09_0000
        rs_R003_ueqv_R003NN_generator_09_0000_0031 =
      rs_R003_ueqv_R003NN_partial_09_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 9. -/
def rs_R003_ueqv_R003NN_coefficient_09_0001 : Poly :=
[
  term ((46191 : Rat) / 59572) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 1 for generator 9. -/
def rs_R003_ueqv_R003NN_partial_09_0001 : Poly :=
[
  term ((46191 : Rat) / 29786) [(0, 1), (1, 1), (12, 1), (15, 1), (16, 1)],
  term ((-46191 : Rat) / 29786) [(0, 1), (1, 1), (15, 1), (16, 1)],
  term ((-46191 : Rat) / 59572) [(1, 1), (12, 2), (15, 1), (16, 1)],
  term ((-46191 : Rat) / 59572) [(1, 1), (13, 2), (15, 1), (16, 1)],
  term ((46191 : Rat) / 59572) [(1, 1), (15, 1), (16, 1)],
  term ((46191 : Rat) / 29786) [(1, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 9. -/
theorem rs_R003_ueqv_R003NN_partial_09_0001_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_09_0001
        rs_R003_ueqv_R003NN_generator_09_0000_0031 =
      rs_R003_ueqv_R003NN_partial_09_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 9. -/
def rs_R003_ueqv_R003NN_coefficient_09_0002 : Poly :=
[
  term ((18565 : Rat) / 178716) [(2, 1), (15, 2), (16, 1)]
]

/-- Partial product 2 for generator 9. -/
def rs_R003_ueqv_R003NN_partial_09_0002 : Poly :=
[
  term ((18565 : Rat) / 89358) [(0, 1), (2, 1), (12, 1), (15, 2), (16, 1)],
  term ((-18565 : Rat) / 89358) [(0, 1), (2, 1), (15, 2), (16, 1)],
  term ((18565 : Rat) / 89358) [(1, 1), (2, 1), (13, 1), (15, 2), (16, 1)],
  term ((-18565 : Rat) / 178716) [(2, 1), (12, 2), (15, 2), (16, 1)],
  term ((-18565 : Rat) / 178716) [(2, 1), (13, 2), (15, 2), (16, 1)],
  term ((18565 : Rat) / 178716) [(2, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 9. -/
theorem rs_R003_ueqv_R003NN_partial_09_0002_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_09_0002
        rs_R003_ueqv_R003NN_generator_09_0000_0031 =
      rs_R003_ueqv_R003NN_partial_09_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 9. -/
def rs_R003_ueqv_R003NN_coefficient_09_0003 : Poly :=
[
  term ((-13712 : Rat) / 44679) [(3, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 3 for generator 9. -/
def rs_R003_ueqv_R003NN_partial_09_0003 : Poly :=
[
  term ((-27424 : Rat) / 44679) [(0, 1), (3, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((27424 : Rat) / 44679) [(0, 1), (3, 1), (8, 1), (15, 1), (16, 1)],
  term ((-27424 : Rat) / 44679) [(1, 1), (3, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((13712 : Rat) / 44679) [(3, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((13712 : Rat) / 44679) [(3, 1), (8, 1), (13, 2), (15, 1), (16, 1)],
  term ((-13712 : Rat) / 44679) [(3, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 9. -/
theorem rs_R003_ueqv_R003NN_partial_09_0003_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_09_0003
        rs_R003_ueqv_R003NN_generator_09_0000_0031 =
      rs_R003_ueqv_R003NN_partial_09_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 9. -/
def rs_R003_ueqv_R003NN_coefficient_09_0004 : Poly :=
[
  term ((-13712 : Rat) / 134037) [(3, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 4 for generator 9. -/
def rs_R003_ueqv_R003NN_partial_09_0004 : Poly :=
[
  term ((-27424 : Rat) / 134037) [(0, 1), (3, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((27424 : Rat) / 134037) [(0, 1), (3, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-27424 : Rat) / 134037) [(1, 1), (3, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((13712 : Rat) / 134037) [(3, 1), (9, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-13712 : Rat) / 134037) [(3, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((13712 : Rat) / 134037) [(3, 1), (9, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 9. -/
theorem rs_R003_ueqv_R003NN_partial_09_0004_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_09_0004
        rs_R003_ueqv_R003NN_generator_09_0000_0031 =
      rs_R003_ueqv_R003NN_partial_09_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 9. -/
def rs_R003_ueqv_R003NN_coefficient_09_0005 : Poly :=
[
  term ((27424 : Rat) / 134037) [(3, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 5 for generator 9. -/
def rs_R003_ueqv_R003NN_partial_09_0005 : Poly :=
[
  term ((54848 : Rat) / 134037) [(0, 1), (3, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-54848 : Rat) / 134037) [(0, 1), (3, 1), (9, 1), (15, 2), (16, 1)],
  term ((54848 : Rat) / 134037) [(1, 1), (3, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-27424 : Rat) / 134037) [(3, 1), (9, 1), (12, 2), (15, 2), (16, 1)],
  term ((-27424 : Rat) / 134037) [(3, 1), (9, 1), (13, 2), (15, 2), (16, 1)],
  term ((27424 : Rat) / 134037) [(3, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 9. -/
theorem rs_R003_ueqv_R003NN_partial_09_0005_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_09_0005
        rs_R003_ueqv_R003NN_generator_09_0000_0031 =
      rs_R003_ueqv_R003NN_partial_09_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 9. -/
def rs_R003_ueqv_R003NN_coefficient_09_0006 : Poly :=
[
  term ((-37708 : Rat) / 134037) [(3, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 6 for generator 9. -/
def rs_R003_ueqv_R003NN_partial_09_0006 : Poly :=
[
  term ((-75416 : Rat) / 134037) [(0, 1), (3, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((75416 : Rat) / 134037) [(0, 1), (3, 1), (13, 1), (15, 2), (16, 1)],
  term ((-75416 : Rat) / 134037) [(1, 1), (3, 1), (13, 2), (15, 2), (16, 1)],
  term ((37708 : Rat) / 134037) [(3, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-37708 : Rat) / 134037) [(3, 1), (13, 1), (15, 2), (16, 1)],
  term ((37708 : Rat) / 134037) [(3, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 9. -/
theorem rs_R003_ueqv_R003NN_partial_09_0006_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_09_0006
        rs_R003_ueqv_R003NN_generator_09_0000_0031 =
      rs_R003_ueqv_R003NN_partial_09_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 9. -/
def rs_R003_ueqv_R003NN_coefficient_09_0007 : Poly :=
[
  term ((818317 : Rat) / 1072296) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 7 for generator 9. -/
def rs_R003_ueqv_R003NN_partial_09_0007 : Poly :=
[
  term ((818317 : Rat) / 536148) [(0, 1), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((-818317 : Rat) / 536148) [(0, 1), (3, 1), (15, 1), (16, 1)],
  term ((818317 : Rat) / 536148) [(1, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((-818317 : Rat) / 1072296) [(3, 1), (12, 2), (15, 1), (16, 1)],
  term ((-818317 : Rat) / 1072296) [(3, 1), (13, 2), (15, 1), (16, 1)],
  term ((818317 : Rat) / 1072296) [(3, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 9. -/
theorem rs_R003_ueqv_R003NN_partial_09_0007_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_09_0007
        rs_R003_ueqv_R003NN_generator_09_0000_0031 =
      rs_R003_ueqv_R003NN_partial_09_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 9. -/
def rs_R003_ueqv_R003NN_coefficient_09_0008 : Poly :=
[
  term ((75416 : Rat) / 134037) [(3, 1), (15, 3), (16, 1)]
]

/-- Partial product 8 for generator 9. -/
def rs_R003_ueqv_R003NN_partial_09_0008 : Poly :=
[
  term ((150832 : Rat) / 134037) [(0, 1), (3, 1), (12, 1), (15, 3), (16, 1)],
  term ((-150832 : Rat) / 134037) [(0, 1), (3, 1), (15, 3), (16, 1)],
  term ((150832 : Rat) / 134037) [(1, 1), (3, 1), (13, 1), (15, 3), (16, 1)],
  term ((-75416 : Rat) / 134037) [(3, 1), (12, 2), (15, 3), (16, 1)],
  term ((-75416 : Rat) / 134037) [(3, 1), (13, 2), (15, 3), (16, 1)],
  term ((75416 : Rat) / 134037) [(3, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 9. -/
theorem rs_R003_ueqv_R003NN_partial_09_0008_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_09_0008
        rs_R003_ueqv_R003NN_generator_09_0000_0031 =
      rs_R003_ueqv_R003NN_partial_09_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 9. -/
def rs_R003_ueqv_R003NN_coefficient_09_0009 : Poly :=
[
  term ((-59986 : Rat) / 134037) [(4, 1), (15, 2), (16, 1)]
]

/-- Partial product 9 for generator 9. -/
def rs_R003_ueqv_R003NN_partial_09_0009 : Poly :=
[
  term ((-119972 : Rat) / 134037) [(0, 1), (4, 1), (12, 1), (15, 2), (16, 1)],
  term ((119972 : Rat) / 134037) [(0, 1), (4, 1), (15, 2), (16, 1)],
  term ((-119972 : Rat) / 134037) [(1, 1), (4, 1), (13, 1), (15, 2), (16, 1)],
  term ((59986 : Rat) / 134037) [(4, 1), (12, 2), (15, 2), (16, 1)],
  term ((59986 : Rat) / 134037) [(4, 1), (13, 2), (15, 2), (16, 1)],
  term ((-59986 : Rat) / 134037) [(4, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 9. -/
theorem rs_R003_ueqv_R003NN_partial_09_0009_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_09_0009
        rs_R003_ueqv_R003NN_generator_09_0000_0031 =
      rs_R003_ueqv_R003NN_partial_09_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 9. -/
def rs_R003_ueqv_R003NN_coefficient_09_0010 : Poly :=
[
  term ((-33421 : Rat) / 44679) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 10 for generator 9. -/
def rs_R003_ueqv_R003NN_partial_09_0010 : Poly :=
[
  term ((-66842 : Rat) / 44679) [(0, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((66842 : Rat) / 44679) [(0, 1), (5, 1), (15, 1), (16, 1)],
  term ((-66842 : Rat) / 44679) [(1, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((33421 : Rat) / 44679) [(5, 1), (12, 2), (15, 1), (16, 1)],
  term ((33421 : Rat) / 44679) [(5, 1), (13, 2), (15, 1), (16, 1)],
  term ((-33421 : Rat) / 44679) [(5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 9. -/
theorem rs_R003_ueqv_R003NN_partial_09_0010_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_09_0010
        rs_R003_ueqv_R003NN_generator_09_0000_0031 =
      rs_R003_ueqv_R003NN_partial_09_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 9. -/
def rs_R003_ueqv_R003NN_coefficient_09_0011 : Poly :=
[
  term ((132845 : Rat) / 268074) [(6, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 11 for generator 9. -/
def rs_R003_ueqv_R003NN_partial_09_0011 : Poly :=
[
  term ((132845 : Rat) / 134037) [(0, 1), (6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-132845 : Rat) / 134037) [(0, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((132845 : Rat) / 134037) [(1, 1), (6, 1), (13, 2), (15, 1), (16, 1)],
  term ((-132845 : Rat) / 268074) [(6, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((132845 : Rat) / 268074) [(6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-132845 : Rat) / 268074) [(6, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 9. -/
theorem rs_R003_ueqv_R003NN_partial_09_0011_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_09_0011
        rs_R003_ueqv_R003NN_generator_09_0000_0031 =
      rs_R003_ueqv_R003NN_partial_09_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 9. -/
def rs_R003_ueqv_R003NN_coefficient_09_0012 : Poly :=
[
  term ((-304249 : Rat) / 268074) [(6, 1), (15, 2), (16, 1)]
]

/-- Partial product 12 for generator 9. -/
def rs_R003_ueqv_R003NN_partial_09_0012 : Poly :=
[
  term ((-304249 : Rat) / 134037) [(0, 1), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((304249 : Rat) / 134037) [(0, 1), (6, 1), (15, 2), (16, 1)],
  term ((-304249 : Rat) / 134037) [(1, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((304249 : Rat) / 268074) [(6, 1), (12, 2), (15, 2), (16, 1)],
  term ((304249 : Rat) / 268074) [(6, 1), (13, 2), (15, 2), (16, 1)],
  term ((-304249 : Rat) / 268074) [(6, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 9. -/
theorem rs_R003_ueqv_R003NN_partial_09_0012_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_09_0012
        rs_R003_ueqv_R003NN_generator_09_0000_0031 =
      rs_R003_ueqv_R003NN_partial_09_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 9. -/
def rs_R003_ueqv_R003NN_coefficient_09_0013 : Poly :=
[
  term (24 : Rat) [(7, 1), (13, 1)]
]

/-- Partial product 13 for generator 9. -/
def rs_R003_ueqv_R003NN_partial_09_0013 : Poly :=
[
  term (48 : Rat) [(0, 1), (7, 1), (12, 1), (13, 1)],
  term (-48 : Rat) [(0, 1), (7, 1), (13, 1)],
  term (48 : Rat) [(1, 1), (7, 1), (13, 2)],
  term (-24 : Rat) [(7, 1), (12, 2), (13, 1)],
  term (24 : Rat) [(7, 1), (13, 1)],
  term (-24 : Rat) [(7, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 9. -/
theorem rs_R003_ueqv_R003NN_partial_09_0013_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_09_0013
        rs_R003_ueqv_R003NN_generator_09_0000_0031 =
      rs_R003_ueqv_R003NN_partial_09_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 9. -/
def rs_R003_ueqv_R003NN_coefficient_09_0014 : Poly :=
[
  term (-48 : Rat) [(7, 1), (15, 1)]
]

/-- Partial product 14 for generator 9. -/
def rs_R003_ueqv_R003NN_partial_09_0014 : Poly :=
[
  term (-96 : Rat) [(0, 1), (7, 1), (12, 1), (15, 1)],
  term (96 : Rat) [(0, 1), (7, 1), (15, 1)],
  term (-96 : Rat) [(1, 1), (7, 1), (13, 1), (15, 1)],
  term (48 : Rat) [(7, 1), (12, 2), (15, 1)],
  term (48 : Rat) [(7, 1), (13, 2), (15, 1)],
  term (-48 : Rat) [(7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 9. -/
theorem rs_R003_ueqv_R003NN_partial_09_0014_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_09_0014
        rs_R003_ueqv_R003NN_generator_09_0000_0031 =
      rs_R003_ueqv_R003NN_partial_09_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 9. -/
def rs_R003_ueqv_R003NN_coefficient_09_0015 : Poly :=
[
  term ((-439615 : Rat) / 536148) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 15 for generator 9. -/
def rs_R003_ueqv_R003NN_partial_09_0015 : Poly :=
[
  term ((-439615 : Rat) / 268074) [(0, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((439615 : Rat) / 268074) [(0, 1), (7, 1), (15, 1), (16, 1)],
  term ((-439615 : Rat) / 268074) [(1, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((439615 : Rat) / 536148) [(7, 1), (12, 2), (15, 1), (16, 1)],
  term ((439615 : Rat) / 536148) [(7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-439615 : Rat) / 536148) [(7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 9. -/
theorem rs_R003_ueqv_R003NN_partial_09_0015_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_09_0015
        rs_R003_ueqv_R003NN_generator_09_0000_0031 =
      rs_R003_ueqv_R003NN_partial_09_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 9. -/
def rs_R003_ueqv_R003NN_coefficient_09_0016 : Poly :=
[
  term (48 : Rat) [(8, 1)]
]

/-- Partial product 16 for generator 9. -/
def rs_R003_ueqv_R003NN_partial_09_0016 : Poly :=
[
  term (-96 : Rat) [(0, 1), (8, 1)],
  term (96 : Rat) [(0, 1), (8, 1), (12, 1)],
  term (96 : Rat) [(1, 1), (8, 1), (13, 1)],
  term (48 : Rat) [(8, 1)],
  term (-48 : Rat) [(8, 1), (12, 2)],
  term (-48 : Rat) [(8, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 9. -/
theorem rs_R003_ueqv_R003NN_partial_09_0016_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_09_0016
        rs_R003_ueqv_R003NN_generator_09_0000_0031 =
      rs_R003_ueqv_R003NN_partial_09_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 9. -/
def rs_R003_ueqv_R003NN_coefficient_09_0017 : Poly :=
[
  term ((1180595 : Rat) / 536148) [(8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 17 for generator 9. -/
def rs_R003_ueqv_R003NN_partial_09_0017 : Poly :=
[
  term ((1180595 : Rat) / 268074) [(0, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1180595 : Rat) / 268074) [(0, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((1180595 : Rat) / 268074) [(1, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1180595 : Rat) / 536148) [(8, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1180595 : Rat) / 536148) [(8, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((1180595 : Rat) / 536148) [(8, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 9. -/
theorem rs_R003_ueqv_R003NN_partial_09_0017_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_09_0017
        rs_R003_ueqv_R003NN_generator_09_0000_0031 =
      rs_R003_ueqv_R003NN_partial_09_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 9. -/
def rs_R003_ueqv_R003NN_coefficient_09_0018 : Poly :=
[
  term ((-128807 : Rat) / 89358) [(8, 1), (15, 2), (16, 1)]
]

/-- Partial product 18 for generator 9. -/
def rs_R003_ueqv_R003NN_partial_09_0018 : Poly :=
[
  term ((-128807 : Rat) / 44679) [(0, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((128807 : Rat) / 44679) [(0, 1), (8, 1), (15, 2), (16, 1)],
  term ((-128807 : Rat) / 44679) [(1, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((128807 : Rat) / 89358) [(8, 1), (12, 2), (15, 2), (16, 1)],
  term ((128807 : Rat) / 89358) [(8, 1), (13, 2), (15, 2), (16, 1)],
  term ((-128807 : Rat) / 89358) [(8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 9. -/
theorem rs_R003_ueqv_R003NN_partial_09_0018_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_09_0018
        rs_R003_ueqv_R003NN_generator_09_0000_0031 =
      rs_R003_ueqv_R003NN_partial_09_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 9. -/
def rs_R003_ueqv_R003NN_coefficient_09_0019 : Poly :=
[
  term (32 : Rat) [(9, 1), (13, 1)]
]

/-- Partial product 19 for generator 9. -/
def rs_R003_ueqv_R003NN_partial_09_0019 : Poly :=
[
  term (64 : Rat) [(0, 1), (9, 1), (12, 1), (13, 1)],
  term (-64 : Rat) [(0, 1), (9, 1), (13, 1)],
  term (64 : Rat) [(1, 1), (9, 1), (13, 2)],
  term (-32 : Rat) [(9, 1), (12, 2), (13, 1)],
  term (32 : Rat) [(9, 1), (13, 1)],
  term (-32 : Rat) [(9, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 9. -/
theorem rs_R003_ueqv_R003NN_partial_09_0019_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_09_0019
        rs_R003_ueqv_R003NN_generator_09_0000_0031 =
      rs_R003_ueqv_R003NN_partial_09_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 9. -/
def rs_R003_ueqv_R003NN_coefficient_09_0020 : Poly :=
[
  term ((-128807 : Rat) / 134037) [(9, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 20 for generator 9. -/
def rs_R003_ueqv_R003NN_partial_09_0020 : Poly :=
[
  term ((-257614 : Rat) / 134037) [(0, 1), (9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((257614 : Rat) / 134037) [(0, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-257614 : Rat) / 134037) [(1, 1), (9, 1), (13, 2), (15, 2), (16, 1)],
  term ((128807 : Rat) / 134037) [(9, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-128807 : Rat) / 134037) [(9, 1), (13, 1), (15, 2), (16, 1)],
  term ((128807 : Rat) / 134037) [(9, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 9. -/
theorem rs_R003_ueqv_R003NN_partial_09_0020_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_09_0020
        rs_R003_ueqv_R003NN_generator_09_0000_0031 =
      rs_R003_ueqv_R003NN_partial_09_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 9. -/
def rs_R003_ueqv_R003NN_coefficient_09_0021 : Poly :=
[
  term (-64 : Rat) [(9, 1), (15, 1)]
]

/-- Partial product 21 for generator 9. -/
def rs_R003_ueqv_R003NN_partial_09_0021 : Poly :=
[
  term (-128 : Rat) [(0, 1), (9, 1), (12, 1), (15, 1)],
  term (128 : Rat) [(0, 1), (9, 1), (15, 1)],
  term (-128 : Rat) [(1, 1), (9, 1), (13, 1), (15, 1)],
  term (64 : Rat) [(9, 1), (12, 2), (15, 1)],
  term (64 : Rat) [(9, 1), (13, 2), (15, 1)],
  term (-64 : Rat) [(9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 9. -/
theorem rs_R003_ueqv_R003NN_partial_09_0021_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_09_0021
        rs_R003_ueqv_R003NN_generator_09_0000_0031 =
      rs_R003_ueqv_R003NN_partial_09_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 9. -/
def rs_R003_ueqv_R003NN_coefficient_09_0022 : Poly :=
[
  term ((7221481 : Rat) / 3216888) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 22 for generator 9. -/
def rs_R003_ueqv_R003NN_partial_09_0022 : Poly :=
[
  term ((7221481 : Rat) / 1608444) [(0, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-7221481 : Rat) / 1608444) [(0, 1), (9, 1), (15, 1), (16, 1)],
  term ((7221481 : Rat) / 1608444) [(1, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-7221481 : Rat) / 3216888) [(9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-7221481 : Rat) / 3216888) [(9, 1), (13, 2), (15, 1), (16, 1)],
  term ((7221481 : Rat) / 3216888) [(9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 9. -/
theorem rs_R003_ueqv_R003NN_partial_09_0022_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_09_0022
        rs_R003_ueqv_R003NN_generator_09_0000_0031 =
      rs_R003_ueqv_R003NN_partial_09_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 9. -/
def rs_R003_ueqv_R003NN_coefficient_09_0023 : Poly :=
[
  term ((257614 : Rat) / 134037) [(9, 1), (15, 3), (16, 1)]
]

/-- Partial product 23 for generator 9. -/
def rs_R003_ueqv_R003NN_partial_09_0023 : Poly :=
[
  term ((515228 : Rat) / 134037) [(0, 1), (9, 1), (12, 1), (15, 3), (16, 1)],
  term ((-515228 : Rat) / 134037) [(0, 1), (9, 1), (15, 3), (16, 1)],
  term ((515228 : Rat) / 134037) [(1, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((-257614 : Rat) / 134037) [(9, 1), (12, 2), (15, 3), (16, 1)],
  term ((-257614 : Rat) / 134037) [(9, 1), (13, 2), (15, 3), (16, 1)],
  term ((257614 : Rat) / 134037) [(9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 9. -/
theorem rs_R003_ueqv_R003NN_partial_09_0023_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_09_0023
        rs_R003_ueqv_R003NN_generator_09_0000_0031 =
      rs_R003_ueqv_R003NN_partial_09_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 9. -/
def rs_R003_ueqv_R003NN_coefficient_09_0024 : Poly :=
[
  term ((397805 : Rat) / 536148) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 24 for generator 9. -/
def rs_R003_ueqv_R003NN_partial_09_0024 : Poly :=
[
  term ((397805 : Rat) / 268074) [(0, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-397805 : Rat) / 268074) [(0, 1), (11, 1), (15, 1), (16, 1)],
  term ((397805 : Rat) / 268074) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-397805 : Rat) / 536148) [(11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-397805 : Rat) / 536148) [(11, 1), (13, 2), (15, 1), (16, 1)],
  term ((397805 : Rat) / 536148) [(11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 9. -/
theorem rs_R003_ueqv_R003NN_partial_09_0024_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_09_0024
        rs_R003_ueqv_R003NN_generator_09_0000_0031 =
      rs_R003_ueqv_R003NN_partial_09_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 9. -/
def rs_R003_ueqv_R003NN_coefficient_09_0025 : Poly :=
[
  term (-464 : Rat) [(13, 1), (15, 1)]
]

/-- Partial product 25 for generator 9. -/
def rs_R003_ueqv_R003NN_partial_09_0025 : Poly :=
[
  term (-928 : Rat) [(0, 1), (12, 1), (13, 1), (15, 1)],
  term (928 : Rat) [(0, 1), (13, 1), (15, 1)],
  term (-928 : Rat) [(1, 1), (13, 2), (15, 1)],
  term (464 : Rat) [(12, 2), (13, 1), (15, 1)],
  term (-464 : Rat) [(13, 1), (15, 1)],
  term (464 : Rat) [(13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 9. -/
theorem rs_R003_ueqv_R003NN_partial_09_0025_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_09_0025
        rs_R003_ueqv_R003NN_generator_09_0000_0031 =
      rs_R003_ueqv_R003NN_partial_09_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 9. -/
def rs_R003_ueqv_R003NN_coefficient_09_0026 : Poly :=
[
  term ((845677 : Rat) / 714864) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 26 for generator 9. -/
def rs_R003_ueqv_R003NN_partial_09_0026 : Poly :=
[
  term ((845677 : Rat) / 357432) [(0, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-845677 : Rat) / 357432) [(0, 1), (13, 1), (15, 1), (16, 1)],
  term ((845677 : Rat) / 357432) [(1, 1), (13, 2), (15, 1), (16, 1)],
  term ((-845677 : Rat) / 714864) [(12, 2), (13, 1), (15, 1), (16, 1)],
  term ((845677 : Rat) / 714864) [(13, 1), (15, 1), (16, 1)],
  term ((-845677 : Rat) / 714864) [(13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 9. -/
theorem rs_R003_ueqv_R003NN_partial_09_0026_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_09_0026
        rs_R003_ueqv_R003NN_generator_09_0000_0031 =
      rs_R003_ueqv_R003NN_partial_09_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 9. -/
def rs_R003_ueqv_R003NN_coefficient_09_0027 : Poly :=
[
  term ((-1416877 : Rat) / 536148) [(13, 1), (15, 3), (16, 1)]
]

/-- Partial product 27 for generator 9. -/
def rs_R003_ueqv_R003NN_partial_09_0027 : Poly :=
[
  term ((-1416877 : Rat) / 268074) [(0, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((1416877 : Rat) / 268074) [(0, 1), (13, 1), (15, 3), (16, 1)],
  term ((-1416877 : Rat) / 268074) [(1, 1), (13, 2), (15, 3), (16, 1)],
  term ((1416877 : Rat) / 536148) [(12, 2), (13, 1), (15, 3), (16, 1)],
  term ((-1416877 : Rat) / 536148) [(13, 1), (15, 3), (16, 1)],
  term ((1416877 : Rat) / 536148) [(13, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 9. -/
theorem rs_R003_ueqv_R003NN_partial_09_0027_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_09_0027
        rs_R003_ueqv_R003NN_generator_09_0000_0031 =
      rs_R003_ueqv_R003NN_partial_09_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 9. -/
def rs_R003_ueqv_R003NN_coefficient_09_0028 : Poly :=
[
  term (216 : Rat) [(13, 2)]
]

/-- Partial product 28 for generator 9. -/
def rs_R003_ueqv_R003NN_partial_09_0028 : Poly :=
[
  term (432 : Rat) [(0, 1), (12, 1), (13, 2)],
  term (-432 : Rat) [(0, 1), (13, 2)],
  term (432 : Rat) [(1, 1), (13, 3)],
  term (-216 : Rat) [(12, 2), (13, 2)],
  term (216 : Rat) [(13, 2)],
  term (-216 : Rat) [(13, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 9. -/
theorem rs_R003_ueqv_R003NN_partial_09_0028_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_09_0028
        rs_R003_ueqv_R003NN_generator_09_0000_0031 =
      rs_R003_ueqv_R003NN_partial_09_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 9. -/
def rs_R003_ueqv_R003NN_coefficient_09_0029 : Poly :=
[
  term (64 : Rat) [(15, 2)]
]

/-- Partial product 29 for generator 9. -/
def rs_R003_ueqv_R003NN_partial_09_0029 : Poly :=
[
  term (128 : Rat) [(0, 1), (12, 1), (15, 2)],
  term (-128 : Rat) [(0, 1), (15, 2)],
  term (128 : Rat) [(1, 1), (13, 1), (15, 2)],
  term (-64 : Rat) [(12, 2), (15, 2)],
  term (-64 : Rat) [(13, 2), (15, 2)],
  term (64 : Rat) [(15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 9. -/
theorem rs_R003_ueqv_R003NN_partial_09_0029_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_09_0029
        rs_R003_ueqv_R003NN_generator_09_0000_0031 =
      rs_R003_ueqv_R003NN_partial_09_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 9. -/
def rs_R003_ueqv_R003NN_coefficient_09_0030 : Poly :=
[
  term ((2428691 : Rat) / 804222) [(15, 2), (16, 1)]
]

/-- Partial product 30 for generator 9. -/
def rs_R003_ueqv_R003NN_partial_09_0030 : Poly :=
[
  term ((2428691 : Rat) / 402111) [(0, 1), (12, 1), (15, 2), (16, 1)],
  term ((-2428691 : Rat) / 402111) [(0, 1), (15, 2), (16, 1)],
  term ((2428691 : Rat) / 402111) [(1, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2428691 : Rat) / 804222) [(12, 2), (15, 2), (16, 1)],
  term ((-2428691 : Rat) / 804222) [(13, 2), (15, 2), (16, 1)],
  term ((2428691 : Rat) / 804222) [(15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 9. -/
theorem rs_R003_ueqv_R003NN_partial_09_0030_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_09_0030
        rs_R003_ueqv_R003NN_generator_09_0000_0031 =
      rs_R003_ueqv_R003NN_partial_09_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 9. -/
def rs_R003_ueqv_R003NN_coefficient_09_0031 : Poly :=
[
  term ((1416877 : Rat) / 268074) [(15, 4), (16, 1)]
]

/-- Partial product 31 for generator 9. -/
def rs_R003_ueqv_R003NN_partial_09_0031 : Poly :=
[
  term ((1416877 : Rat) / 134037) [(0, 1), (12, 1), (15, 4), (16, 1)],
  term ((-1416877 : Rat) / 134037) [(0, 1), (15, 4), (16, 1)],
  term ((1416877 : Rat) / 134037) [(1, 1), (13, 1), (15, 4), (16, 1)],
  term ((-1416877 : Rat) / 268074) [(12, 2), (15, 4), (16, 1)],
  term ((-1416877 : Rat) / 268074) [(13, 2), (15, 4), (16, 1)],
  term ((1416877 : Rat) / 268074) [(15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 9. -/
theorem rs_R003_ueqv_R003NN_partial_09_0031_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_09_0031
        rs_R003_ueqv_R003NN_generator_09_0000_0031 =
      rs_R003_ueqv_R003NN_partial_09_0031 := by
  native_decide

/-- Partial products in this block. -/
def rs_R003_ueqv_R003NN_partials_09_0000_0031 : List Poly :=
[
  rs_R003_ueqv_R003NN_partial_09_0000,
  rs_R003_ueqv_R003NN_partial_09_0001,
  rs_R003_ueqv_R003NN_partial_09_0002,
  rs_R003_ueqv_R003NN_partial_09_0003,
  rs_R003_ueqv_R003NN_partial_09_0004,
  rs_R003_ueqv_R003NN_partial_09_0005,
  rs_R003_ueqv_R003NN_partial_09_0006,
  rs_R003_ueqv_R003NN_partial_09_0007,
  rs_R003_ueqv_R003NN_partial_09_0008,
  rs_R003_ueqv_R003NN_partial_09_0009,
  rs_R003_ueqv_R003NN_partial_09_0010,
  rs_R003_ueqv_R003NN_partial_09_0011,
  rs_R003_ueqv_R003NN_partial_09_0012,
  rs_R003_ueqv_R003NN_partial_09_0013,
  rs_R003_ueqv_R003NN_partial_09_0014,
  rs_R003_ueqv_R003NN_partial_09_0015,
  rs_R003_ueqv_R003NN_partial_09_0016,
  rs_R003_ueqv_R003NN_partial_09_0017,
  rs_R003_ueqv_R003NN_partial_09_0018,
  rs_R003_ueqv_R003NN_partial_09_0019,
  rs_R003_ueqv_R003NN_partial_09_0020,
  rs_R003_ueqv_R003NN_partial_09_0021,
  rs_R003_ueqv_R003NN_partial_09_0022,
  rs_R003_ueqv_R003NN_partial_09_0023,
  rs_R003_ueqv_R003NN_partial_09_0024,
  rs_R003_ueqv_R003NN_partial_09_0025,
  rs_R003_ueqv_R003NN_partial_09_0026,
  rs_R003_ueqv_R003NN_partial_09_0027,
  rs_R003_ueqv_R003NN_partial_09_0028,
  rs_R003_ueqv_R003NN_partial_09_0029,
  rs_R003_ueqv_R003NN_partial_09_0030,
  rs_R003_ueqv_R003NN_partial_09_0031
]

/-- Sum of partial products in this block. -/
def rs_R003_ueqv_R003NN_block_09_0000_0031 : Poly :=
[
  term (-86 : Rat) [],
  term (172 : Rat) [(0, 1)],
  term ((46191 : Rat) / 29786) [(0, 1), (1, 1), (12, 1), (15, 1), (16, 1)],
  term ((-46191 : Rat) / 29786) [(0, 1), (1, 1), (15, 1), (16, 1)],
  term ((18565 : Rat) / 89358) [(0, 1), (2, 1), (12, 1), (15, 2), (16, 1)],
  term ((-18565 : Rat) / 89358) [(0, 1), (2, 1), (15, 2), (16, 1)],
  term ((-27424 : Rat) / 44679) [(0, 1), (3, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((27424 : Rat) / 44679) [(0, 1), (3, 1), (8, 1), (15, 1), (16, 1)],
  term ((-27424 : Rat) / 134037) [(0, 1), (3, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((54848 : Rat) / 134037) [(0, 1), (3, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((27424 : Rat) / 134037) [(0, 1), (3, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-54848 : Rat) / 134037) [(0, 1), (3, 1), (9, 1), (15, 2), (16, 1)],
  term ((-75416 : Rat) / 134037) [(0, 1), (3, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((818317 : Rat) / 536148) [(0, 1), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((150832 : Rat) / 134037) [(0, 1), (3, 1), (12, 1), (15, 3), (16, 1)],
  term ((75416 : Rat) / 134037) [(0, 1), (3, 1), (13, 1), (15, 2), (16, 1)],
  term ((-818317 : Rat) / 536148) [(0, 1), (3, 1), (15, 1), (16, 1)],
  term ((-150832 : Rat) / 134037) [(0, 1), (3, 1), (15, 3), (16, 1)],
  term ((-119972 : Rat) / 134037) [(0, 1), (4, 1), (12, 1), (15, 2), (16, 1)],
  term ((119972 : Rat) / 134037) [(0, 1), (4, 1), (15, 2), (16, 1)],
  term ((-66842 : Rat) / 44679) [(0, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((66842 : Rat) / 44679) [(0, 1), (5, 1), (15, 1), (16, 1)],
  term ((132845 : Rat) / 134037) [(0, 1), (6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-304249 : Rat) / 134037) [(0, 1), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((-132845 : Rat) / 134037) [(0, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((304249 : Rat) / 134037) [(0, 1), (6, 1), (15, 2), (16, 1)],
  term (48 : Rat) [(0, 1), (7, 1), (12, 1), (13, 1)],
  term (-96 : Rat) [(0, 1), (7, 1), (12, 1), (15, 1)],
  term ((-439615 : Rat) / 268074) [(0, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term (-48 : Rat) [(0, 1), (7, 1), (13, 1)],
  term (96 : Rat) [(0, 1), (7, 1), (15, 1)],
  term ((439615 : Rat) / 268074) [(0, 1), (7, 1), (15, 1), (16, 1)],
  term (-96 : Rat) [(0, 1), (8, 1)],
  term ((1180595 : Rat) / 268074) [(0, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1180595 : Rat) / 268074) [(0, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term (96 : Rat) [(0, 1), (8, 1), (12, 1)],
  term ((-128807 : Rat) / 44679) [(0, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((128807 : Rat) / 44679) [(0, 1), (8, 1), (15, 2), (16, 1)],
  term (64 : Rat) [(0, 1), (9, 1), (12, 1), (13, 1)],
  term ((-257614 : Rat) / 134037) [(0, 1), (9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term (-128 : Rat) [(0, 1), (9, 1), (12, 1), (15, 1)],
  term ((7221481 : Rat) / 1608444) [(0, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((515228 : Rat) / 134037) [(0, 1), (9, 1), (12, 1), (15, 3), (16, 1)],
  term (-64 : Rat) [(0, 1), (9, 1), (13, 1)],
  term ((257614 : Rat) / 134037) [(0, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term (128 : Rat) [(0, 1), (9, 1), (15, 1)],
  term ((-7221481 : Rat) / 1608444) [(0, 1), (9, 1), (15, 1), (16, 1)],
  term ((-515228 : Rat) / 134037) [(0, 1), (9, 1), (15, 3), (16, 1)],
  term ((397805 : Rat) / 268074) [(0, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-397805 : Rat) / 268074) [(0, 1), (11, 1), (15, 1), (16, 1)],
  term (-172 : Rat) [(0, 1), (12, 1)],
  term (-928 : Rat) [(0, 1), (12, 1), (13, 1), (15, 1)],
  term ((845677 : Rat) / 357432) [(0, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1416877 : Rat) / 268074) [(0, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term (432 : Rat) [(0, 1), (12, 1), (13, 2)],
  term (128 : Rat) [(0, 1), (12, 1), (15, 2)],
  term ((2428691 : Rat) / 402111) [(0, 1), (12, 1), (15, 2), (16, 1)],
  term ((1416877 : Rat) / 134037) [(0, 1), (12, 1), (15, 4), (16, 1)],
  term (928 : Rat) [(0, 1), (13, 1), (15, 1)],
  term ((-845677 : Rat) / 357432) [(0, 1), (13, 1), (15, 1), (16, 1)],
  term ((1416877 : Rat) / 268074) [(0, 1), (13, 1), (15, 3), (16, 1)],
  term (-432 : Rat) [(0, 1), (13, 2)],
  term (-128 : Rat) [(0, 1), (15, 2)],
  term ((-2428691 : Rat) / 402111) [(0, 1), (15, 2), (16, 1)],
  term ((-1416877 : Rat) / 134037) [(0, 1), (15, 4), (16, 1)],
  term ((18565 : Rat) / 89358) [(1, 1), (2, 1), (13, 1), (15, 2), (16, 1)],
  term ((-27424 : Rat) / 44679) [(1, 1), (3, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((54848 : Rat) / 134037) [(1, 1), (3, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-27424 : Rat) / 134037) [(1, 1), (3, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((818317 : Rat) / 536148) [(1, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((150832 : Rat) / 134037) [(1, 1), (3, 1), (13, 1), (15, 3), (16, 1)],
  term ((-75416 : Rat) / 134037) [(1, 1), (3, 1), (13, 2), (15, 2), (16, 1)],
  term ((-119972 : Rat) / 134037) [(1, 1), (4, 1), (13, 1), (15, 2), (16, 1)],
  term ((-66842 : Rat) / 44679) [(1, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-304249 : Rat) / 134037) [(1, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((132845 : Rat) / 134037) [(1, 1), (6, 1), (13, 2), (15, 1), (16, 1)],
  term (-96 : Rat) [(1, 1), (7, 1), (13, 1), (15, 1)],
  term ((-439615 : Rat) / 268074) [(1, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term (48 : Rat) [(1, 1), (7, 1), (13, 2)],
  term ((1180595 : Rat) / 268074) [(1, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term (96 : Rat) [(1, 1), (8, 1), (13, 1)],
  term ((-128807 : Rat) / 44679) [(1, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term (-128 : Rat) [(1, 1), (9, 1), (13, 1), (15, 1)],
  term ((7221481 : Rat) / 1608444) [(1, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((515228 : Rat) / 134037) [(1, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term (64 : Rat) [(1, 1), (9, 1), (13, 2)],
  term ((-257614 : Rat) / 134037) [(1, 1), (9, 1), (13, 2), (15, 2), (16, 1)],
  term ((397805 : Rat) / 268074) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-46191 : Rat) / 59572) [(1, 1), (12, 2), (15, 1), (16, 1)],
  term (-172 : Rat) [(1, 1), (13, 1)],
  term (128 : Rat) [(1, 1), (13, 1), (15, 2)],
  term ((2428691 : Rat) / 402111) [(1, 1), (13, 1), (15, 2), (16, 1)],
  term ((1416877 : Rat) / 134037) [(1, 1), (13, 1), (15, 4), (16, 1)],
  term (-928 : Rat) [(1, 1), (13, 2), (15, 1)],
  term ((10727 : Rat) / 6744) [(1, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1416877 : Rat) / 268074) [(1, 1), (13, 2), (15, 3), (16, 1)],
  term (432 : Rat) [(1, 1), (13, 3)],
  term ((46191 : Rat) / 59572) [(1, 1), (15, 1), (16, 1)],
  term ((46191 : Rat) / 29786) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((-18565 : Rat) / 178716) [(2, 1), (12, 2), (15, 2), (16, 1)],
  term ((-18565 : Rat) / 178716) [(2, 1), (13, 2), (15, 2), (16, 1)],
  term ((18565 : Rat) / 178716) [(2, 1), (15, 2), (16, 1)],
  term ((13712 : Rat) / 44679) [(3, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((13712 : Rat) / 44679) [(3, 1), (8, 1), (13, 2), (15, 1), (16, 1)],
  term ((-13712 : Rat) / 44679) [(3, 1), (8, 1), (15, 1), (16, 1)],
  term ((13712 : Rat) / 134037) [(3, 1), (9, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-27424 : Rat) / 134037) [(3, 1), (9, 1), (12, 2), (15, 2), (16, 1)],
  term ((-13712 : Rat) / 134037) [(3, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-27424 : Rat) / 134037) [(3, 1), (9, 1), (13, 2), (15, 2), (16, 1)],
  term ((13712 : Rat) / 134037) [(3, 1), (9, 1), (13, 3), (15, 1), (16, 1)],
  term ((27424 : Rat) / 134037) [(3, 1), (9, 1), (15, 2), (16, 1)],
  term ((37708 : Rat) / 134037) [(3, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-818317 : Rat) / 1072296) [(3, 1), (12, 2), (15, 1), (16, 1)],
  term ((-75416 : Rat) / 134037) [(3, 1), (12, 2), (15, 3), (16, 1)],
  term ((-37708 : Rat) / 134037) [(3, 1), (13, 1), (15, 2), (16, 1)],
  term ((-818317 : Rat) / 1072296) [(3, 1), (13, 2), (15, 1), (16, 1)],
  term ((-75416 : Rat) / 134037) [(3, 1), (13, 2), (15, 3), (16, 1)],
  term ((37708 : Rat) / 134037) [(3, 1), (13, 3), (15, 2), (16, 1)],
  term ((818317 : Rat) / 1072296) [(3, 1), (15, 1), (16, 1)],
  term ((75416 : Rat) / 134037) [(3, 1), (15, 3), (16, 1)],
  term ((59986 : Rat) / 134037) [(4, 1), (12, 2), (15, 2), (16, 1)],
  term ((59986 : Rat) / 134037) [(4, 1), (13, 2), (15, 2), (16, 1)],
  term ((-59986 : Rat) / 134037) [(4, 1), (15, 2), (16, 1)],
  term ((33421 : Rat) / 44679) [(5, 1), (12, 2), (15, 1), (16, 1)],
  term ((33421 : Rat) / 44679) [(5, 1), (13, 2), (15, 1), (16, 1)],
  term ((-33421 : Rat) / 44679) [(5, 1), (15, 1), (16, 1)],
  term ((-132845 : Rat) / 268074) [(6, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((304249 : Rat) / 268074) [(6, 1), (12, 2), (15, 2), (16, 1)],
  term ((132845 : Rat) / 268074) [(6, 1), (13, 1), (15, 1), (16, 1)],
  term ((304249 : Rat) / 268074) [(6, 1), (13, 2), (15, 2), (16, 1)],
  term ((-132845 : Rat) / 268074) [(6, 1), (13, 3), (15, 1), (16, 1)],
  term ((-304249 : Rat) / 268074) [(6, 1), (15, 2), (16, 1)],
  term (-24 : Rat) [(7, 1), (12, 2), (13, 1)],
  term (48 : Rat) [(7, 1), (12, 2), (15, 1)],
  term ((439615 : Rat) / 536148) [(7, 1), (12, 2), (15, 1), (16, 1)],
  term (24 : Rat) [(7, 1), (13, 1)],
  term (48 : Rat) [(7, 1), (13, 2), (15, 1)],
  term ((439615 : Rat) / 536148) [(7, 1), (13, 2), (15, 1), (16, 1)],
  term (-24 : Rat) [(7, 1), (13, 3)],
  term (-48 : Rat) [(7, 1), (15, 1)],
  term ((-439615 : Rat) / 536148) [(7, 1), (15, 1), (16, 1)],
  term (48 : Rat) [(8, 1)],
  term ((-1180595 : Rat) / 536148) [(8, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1180595 : Rat) / 536148) [(8, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((1180595 : Rat) / 536148) [(8, 1), (11, 1), (15, 1), (16, 1)],
  term (-48 : Rat) [(8, 1), (12, 2)],
  term ((128807 : Rat) / 89358) [(8, 1), (12, 2), (15, 2), (16, 1)],
  term (-48 : Rat) [(8, 1), (13, 2)],
  term ((128807 : Rat) / 89358) [(8, 1), (13, 2), (15, 2), (16, 1)],
  term ((-128807 : Rat) / 89358) [(8, 1), (15, 2), (16, 1)],
  term (-32 : Rat) [(9, 1), (12, 2), (13, 1)],
  term ((128807 : Rat) / 134037) [(9, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term (64 : Rat) [(9, 1), (12, 2), (15, 1)],
  term ((-7221481 : Rat) / 3216888) [(9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-257614 : Rat) / 134037) [(9, 1), (12, 2), (15, 3), (16, 1)],
  term (32 : Rat) [(9, 1), (13, 1)],
  term ((-128807 : Rat) / 134037) [(9, 1), (13, 1), (15, 2), (16, 1)],
  term (64 : Rat) [(9, 1), (13, 2), (15, 1)],
  term ((-7221481 : Rat) / 3216888) [(9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-257614 : Rat) / 134037) [(9, 1), (13, 2), (15, 3), (16, 1)],
  term (-32 : Rat) [(9, 1), (13, 3)],
  term ((128807 : Rat) / 134037) [(9, 1), (13, 3), (15, 2), (16, 1)],
  term (-64 : Rat) [(9, 1), (15, 1)],
  term ((7221481 : Rat) / 3216888) [(9, 1), (15, 1), (16, 1)],
  term ((257614 : Rat) / 134037) [(9, 1), (15, 3), (16, 1)],
  term ((-397805 : Rat) / 536148) [(11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-397805 : Rat) / 536148) [(11, 1), (13, 2), (15, 1), (16, 1)],
  term ((397805 : Rat) / 536148) [(11, 1), (15, 1), (16, 1)],
  term (86 : Rat) [(12, 2)],
  term (464 : Rat) [(12, 2), (13, 1), (15, 1)],
  term ((-845677 : Rat) / 714864) [(12, 2), (13, 1), (15, 1), (16, 1)],
  term ((1416877 : Rat) / 536148) [(12, 2), (13, 1), (15, 3), (16, 1)],
  term (-216 : Rat) [(12, 2), (13, 2)],
  term (-64 : Rat) [(12, 2), (15, 2)],
  term ((-2428691 : Rat) / 804222) [(12, 2), (15, 2), (16, 1)],
  term ((-1416877 : Rat) / 268074) [(12, 2), (15, 4), (16, 1)],
  term (-464 : Rat) [(13, 1), (15, 1)],
  term ((845677 : Rat) / 714864) [(13, 1), (15, 1), (16, 1)],
  term ((-1416877 : Rat) / 536148) [(13, 1), (15, 3), (16, 1)],
  term (302 : Rat) [(13, 2)],
  term (-64 : Rat) [(13, 2), (15, 2)],
  term ((-2428691 : Rat) / 804222) [(13, 2), (15, 2), (16, 1)],
  term ((-1416877 : Rat) / 268074) [(13, 2), (15, 4), (16, 1)],
  term (464 : Rat) [(13, 3), (15, 1)],
  term ((-845677 : Rat) / 714864) [(13, 3), (15, 1), (16, 1)],
  term ((1416877 : Rat) / 536148) [(13, 3), (15, 3), (16, 1)],
  term (-216 : Rat) [(13, 4)],
  term (64 : Rat) [(15, 2)],
  term ((2428691 : Rat) / 804222) [(15, 2), (16, 1)],
  term ((1416877 : Rat) / 268074) [(15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 9, terms 0 through 31. -/
theorem rs_R003_ueqv_R003NN_block_09_0000_0031_valid :
    checkProductSumEq rs_R003_ueqv_R003NN_partials_09_0000_0031
      rs_R003_ueqv_R003NN_block_09_0000_0031 = true := by
  native_decide

end R003UeqvR003NNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
