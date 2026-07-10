/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NNNYN, term block 12:0-42

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NNNYNTermShards

/-- Generator polynomial 12 for relaxed split surplus certificate `R009:u=v:R009NNNYN`. -/
def rs_R009_ueqv_R009NNNYN_generator_12_0000_0042 : Poly :=
[
  term (2 : Rat) [(2, 1), (12, 1)],
  term (2 : Rat) [(3, 1), (13, 1)],
  term (-1 : Rat) [(12, 2)],
  term (-1 : Rat) [(13, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NNNYN_coefficient_12_0000 : Poly :=
[
  term ((341205760 : Rat) / 330679773) [(0, 1), (7, 1), (11, 1)]
]

/-- Partial product 0 for generator 12. -/
def rs_R009_ueqv_R009NNNYN_partial_12_0000 : Poly :=
[
  term ((682411520 : Rat) / 330679773) [(0, 1), (2, 1), (7, 1), (11, 1), (12, 1)],
  term ((682411520 : Rat) / 330679773) [(0, 1), (3, 1), (7, 1), (11, 1), (13, 1)],
  term ((-341205760 : Rat) / 330679773) [(0, 1), (7, 1), (11, 1), (12, 2)],
  term ((-341205760 : Rat) / 330679773) [(0, 1), (7, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 12. -/
theorem rs_R009_ueqv_R009NNNYN_partial_12_0000_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_12_0000
        rs_R009_ueqv_R009NNNYN_generator_12_0000_0042 =
      rs_R009_ueqv_R009NNNYN_partial_12_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NNNYN_coefficient_12_0001 : Poly :=
[
  term ((5331340 : Rat) / 12247399) [(0, 1), (7, 1), (13, 1)]
]

/-- Partial product 1 for generator 12. -/
def rs_R009_ueqv_R009NNNYN_partial_12_0001 : Poly :=
[
  term ((10662680 : Rat) / 12247399) [(0, 1), (2, 1), (7, 1), (12, 1), (13, 1)],
  term ((10662680 : Rat) / 12247399) [(0, 1), (3, 1), (7, 1), (13, 2)],
  term ((-5331340 : Rat) / 12247399) [(0, 1), (7, 1), (12, 2), (13, 1)],
  term ((-5331340 : Rat) / 12247399) [(0, 1), (7, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 12. -/
theorem rs_R009_ueqv_R009NNNYN_partial_12_0001_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_12_0001
        rs_R009_ueqv_R009NNNYN_generator_12_0000_0042 =
      rs_R009_ueqv_R009NNNYN_partial_12_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NNNYN_coefficient_12_0002 : Poly :=
[
  term ((-307694480 : Rat) / 330679773) [(0, 1), (7, 1), (15, 1)]
]

/-- Partial product 2 for generator 12. -/
def rs_R009_ueqv_R009NNNYN_partial_12_0002 : Poly :=
[
  term ((-615388960 : Rat) / 330679773) [(0, 1), (2, 1), (7, 1), (12, 1), (15, 1)],
  term ((-615388960 : Rat) / 330679773) [(0, 1), (3, 1), (7, 1), (13, 1), (15, 1)],
  term ((307694480 : Rat) / 330679773) [(0, 1), (7, 1), (12, 2), (15, 1)],
  term ((307694480 : Rat) / 330679773) [(0, 1), (7, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 12. -/
theorem rs_R009_ueqv_R009NNNYN_partial_12_0002_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_12_0002
        rs_R009_ueqv_R009NNNYN_generator_12_0000_0042 =
      rs_R009_ueqv_R009NNNYN_partial_12_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NNNYN_coefficient_12_0003 : Poly :=
[
  term ((1656094720 : Rat) / 330679773) [(0, 1), (11, 1), (13, 1)]
]

/-- Partial product 3 for generator 12. -/
def rs_R009_ueqv_R009NNNYN_partial_12_0003 : Poly :=
[
  term ((3312189440 : Rat) / 330679773) [(0, 1), (2, 1), (11, 1), (12, 1), (13, 1)],
  term ((3312189440 : Rat) / 330679773) [(0, 1), (3, 1), (11, 1), (13, 2)],
  term ((-1656094720 : Rat) / 330679773) [(0, 1), (11, 1), (12, 2), (13, 1)],
  term ((-1656094720 : Rat) / 330679773) [(0, 1), (11, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 12. -/
theorem rs_R009_ueqv_R009NNNYN_partial_12_0003_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_12_0003
        rs_R009_ueqv_R009NNNYN_generator_12_0000_0042 =
      rs_R009_ueqv_R009NNNYN_partial_12_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NNNYN_coefficient_12_0004 : Poly :=
[
  term ((-2190540800 : Rat) / 330679773) [(0, 1), (11, 1), (15, 1)]
]

/-- Partial product 4 for generator 12. -/
def rs_R009_ueqv_R009NNNYN_partial_12_0004 : Poly :=
[
  term ((-4381081600 : Rat) / 330679773) [(0, 1), (2, 1), (11, 1), (12, 1), (15, 1)],
  term ((-4381081600 : Rat) / 330679773) [(0, 1), (3, 1), (11, 1), (13, 1), (15, 1)],
  term ((2190540800 : Rat) / 330679773) [(0, 1), (11, 1), (12, 2), (15, 1)],
  term ((2190540800 : Rat) / 330679773) [(0, 1), (11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 12. -/
theorem rs_R009_ueqv_R009NNNYN_partial_12_0004_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_12_0004
        rs_R009_ueqv_R009NNNYN_generator_12_0000_0042 =
      rs_R009_ueqv_R009NNNYN_partial_12_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NNNYN_coefficient_12_0005 : Poly :=
[
  term ((-2417576960 : Rat) / 330679773) [(0, 1), (13, 1), (15, 1)]
]

/-- Partial product 5 for generator 12. -/
def rs_R009_ueqv_R009NNNYN_partial_12_0005 : Poly :=
[
  term ((-4835153920 : Rat) / 330679773) [(0, 1), (2, 1), (12, 1), (13, 1), (15, 1)],
  term ((-4835153920 : Rat) / 330679773) [(0, 1), (3, 1), (13, 2), (15, 1)],
  term ((2417576960 : Rat) / 330679773) [(0, 1), (12, 2), (13, 1), (15, 1)],
  term ((2417576960 : Rat) / 330679773) [(0, 1), (13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 12. -/
theorem rs_R009_ueqv_R009NNNYN_partial_12_0005_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_12_0005
        rs_R009_ueqv_R009NNNYN_generator_12_0000_0042 =
      rs_R009_ueqv_R009NNNYN_partial_12_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NNNYN_coefficient_12_0006 : Poly :=
[
  term ((25876480 : Rat) / 12247399) [(0, 1), (13, 2)]
]

/-- Partial product 6 for generator 12. -/
def rs_R009_ueqv_R009NNNYN_partial_12_0006 : Poly :=
[
  term ((51752960 : Rat) / 12247399) [(0, 1), (2, 1), (12, 1), (13, 2)],
  term ((51752960 : Rat) / 12247399) [(0, 1), (3, 1), (13, 3)],
  term ((-25876480 : Rat) / 12247399) [(0, 1), (12, 2), (13, 2)],
  term ((-25876480 : Rat) / 12247399) [(0, 1), (13, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 12. -/
theorem rs_R009_ueqv_R009NNNYN_partial_12_0006_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_12_0006
        rs_R009_ueqv_R009NNNYN_generator_12_0000_0042 =
      rs_R009_ueqv_R009NNNYN_partial_12_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NNNYN_coefficient_12_0007 : Poly :=
[
  term ((1975398400 : Rat) / 330679773) [(0, 1), (15, 2)]
]

/-- Partial product 7 for generator 12. -/
def rs_R009_ueqv_R009NNNYN_partial_12_0007 : Poly :=
[
  term ((3950796800 : Rat) / 330679773) [(0, 1), (2, 1), (12, 1), (15, 2)],
  term ((3950796800 : Rat) / 330679773) [(0, 1), (3, 1), (13, 1), (15, 2)],
  term ((-1975398400 : Rat) / 330679773) [(0, 1), (12, 2), (15, 2)],
  term ((-1975398400 : Rat) / 330679773) [(0, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 12. -/
theorem rs_R009_ueqv_R009NNNYN_partial_12_0007_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_12_0007
        rs_R009_ueqv_R009NNNYN_generator_12_0000_0042 =
      rs_R009_ueqv_R009NNNYN_partial_12_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NNNYN_coefficient_12_0008 : Poly :=
[
  term ((1010629760 : Rat) / 330679773) [(1, 1), (11, 1)]
]

/-- Partial product 8 for generator 12. -/
def rs_R009_ueqv_R009NNNYN_partial_12_0008 : Poly :=
[
  term ((2021259520 : Rat) / 330679773) [(1, 1), (2, 1), (11, 1), (12, 1)],
  term ((2021259520 : Rat) / 330679773) [(1, 1), (3, 1), (11, 1), (13, 1)],
  term ((-1010629760 : Rat) / 330679773) [(1, 1), (11, 1), (12, 2)],
  term ((-1010629760 : Rat) / 330679773) [(1, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 12. -/
theorem rs_R009_ueqv_R009NNNYN_partial_12_0008_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_12_0008
        rs_R009_ueqv_R009NNNYN_generator_12_0000_0042 =
      rs_R009_ueqv_R009NNNYN_partial_12_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NNNYN_coefficient_12_0009 : Poly :=
[
  term ((-1656094720 : Rat) / 330679773) [(1, 1), (11, 1), (12, 1)]
]

/-- Partial product 9 for generator 12. -/
def rs_R009_ueqv_R009NNNYN_partial_12_0009 : Poly :=
[
  term ((-3312189440 : Rat) / 330679773) [(1, 1), (2, 1), (11, 1), (12, 2)],
  term ((-3312189440 : Rat) / 330679773) [(1, 1), (3, 1), (11, 1), (12, 1), (13, 1)],
  term ((1656094720 : Rat) / 330679773) [(1, 1), (11, 1), (12, 1), (13, 2)],
  term ((1656094720 : Rat) / 330679773) [(1, 1), (11, 1), (12, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 12. -/
theorem rs_R009_ueqv_R009NNNYN_partial_12_0009_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_12_0009
        rs_R009_ueqv_R009NNNYN_generator_12_0000_0042 =
      rs_R009_ueqv_R009NNNYN_partial_12_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NNNYN_coefficient_12_0010 : Poly :=
[
  term ((2190540800 : Rat) / 330679773) [(1, 1), (11, 1), (14, 1)]
]

/-- Partial product 10 for generator 12. -/
def rs_R009_ueqv_R009NNNYN_partial_12_0010 : Poly :=
[
  term ((4381081600 : Rat) / 330679773) [(1, 1), (2, 1), (11, 1), (12, 1), (14, 1)],
  term ((4381081600 : Rat) / 330679773) [(1, 1), (3, 1), (11, 1), (13, 1), (14, 1)],
  term ((-2190540800 : Rat) / 330679773) [(1, 1), (11, 1), (12, 2), (14, 1)],
  term ((-2190540800 : Rat) / 330679773) [(1, 1), (11, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 12. -/
theorem rs_R009_ueqv_R009NNNYN_partial_12_0010_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_12_0010
        rs_R009_ueqv_R009NNNYN_generator_12_0000_0042 =
      rs_R009_ueqv_R009NNNYN_partial_12_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NNNYN_coefficient_12_0011 : Poly :=
[
  term ((-25876480 : Rat) / 12247399) [(1, 1), (12, 1), (13, 1)]
]

/-- Partial product 11 for generator 12. -/
def rs_R009_ueqv_R009NNNYN_partial_12_0011 : Poly :=
[
  term ((-51752960 : Rat) / 12247399) [(1, 1), (2, 1), (12, 2), (13, 1)],
  term ((-51752960 : Rat) / 12247399) [(1, 1), (3, 1), (12, 1), (13, 2)],
  term ((25876480 : Rat) / 12247399) [(1, 1), (12, 1), (13, 3)],
  term ((25876480 : Rat) / 12247399) [(1, 1), (12, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 12. -/
theorem rs_R009_ueqv_R009NNNYN_partial_12_0011_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_12_0011
        rs_R009_ueqv_R009NNNYN_generator_12_0000_0042 =
      rs_R009_ueqv_R009NNNYN_partial_12_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NNNYN_coefficient_12_0012 : Poly :=
[
  term ((1493442560 : Rat) / 330679773) [(1, 1), (12, 1), (15, 1)]
]

/-- Partial product 12 for generator 12. -/
def rs_R009_ueqv_R009NNNYN_partial_12_0012 : Poly :=
[
  term ((2986885120 : Rat) / 330679773) [(1, 1), (2, 1), (12, 2), (15, 1)],
  term ((2986885120 : Rat) / 330679773) [(1, 1), (3, 1), (12, 1), (13, 1), (15, 1)],
  term ((-1493442560 : Rat) / 330679773) [(1, 1), (12, 1), (13, 2), (15, 1)],
  term ((-1493442560 : Rat) / 330679773) [(1, 1), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 12. -/
theorem rs_R009_ueqv_R009NNNYN_partial_12_0012_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_12_0012
        rs_R009_ueqv_R009NNNYN_generator_12_0000_0042 =
      rs_R009_ueqv_R009NNNYN_partial_12_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NNNYN_coefficient_12_0013 : Poly :=
[
  term ((15791090 : Rat) / 12247399) [(1, 1), (13, 1)]
]

/-- Partial product 13 for generator 12. -/
def rs_R009_ueqv_R009NNNYN_partial_12_0013 : Poly :=
[
  term ((31582180 : Rat) / 12247399) [(1, 1), (2, 1), (12, 1), (13, 1)],
  term ((31582180 : Rat) / 12247399) [(1, 1), (3, 1), (13, 2)],
  term ((-15791090 : Rat) / 12247399) [(1, 1), (12, 2), (13, 1)],
  term ((-15791090 : Rat) / 12247399) [(1, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 12. -/
theorem rs_R009_ueqv_R009NNNYN_partial_12_0013_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_12_0013
        rs_R009_ueqv_R009NNNYN_generator_12_0000_0042 =
      rs_R009_ueqv_R009NNNYN_partial_12_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NNNYN_coefficient_12_0014 : Poly :=
[
  term ((34227200 : Rat) / 12247399) [(1, 1), (13, 1), (14, 1)]
]

/-- Partial product 14 for generator 12. -/
def rs_R009_ueqv_R009NNNYN_partial_12_0014 : Poly :=
[
  term ((68454400 : Rat) / 12247399) [(1, 1), (2, 1), (12, 1), (13, 1), (14, 1)],
  term ((68454400 : Rat) / 12247399) [(1, 1), (3, 1), (13, 2), (14, 1)],
  term ((-34227200 : Rat) / 12247399) [(1, 1), (12, 2), (13, 1), (14, 1)],
  term ((-34227200 : Rat) / 12247399) [(1, 1), (13, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 12. -/
theorem rs_R009_ueqv_R009NNNYN_partial_12_0014_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_12_0014
        rs_R009_ueqv_R009NNNYN_generator_12_0000_0042 =
      rs_R009_ueqv_R009NNNYN_partial_12_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NNNYN_coefficient_12_0015 : Poly :=
[
  term ((-1975398400 : Rat) / 330679773) [(1, 1), (14, 1), (15, 1)]
]

/-- Partial product 15 for generator 12. -/
def rs_R009_ueqv_R009NNNYN_partial_12_0015 : Poly :=
[
  term ((-3950796800 : Rat) / 330679773) [(1, 1), (2, 1), (12, 1), (14, 1), (15, 1)],
  term ((-3950796800 : Rat) / 330679773) [(1, 1), (3, 1), (13, 1), (14, 1), (15, 1)],
  term ((1975398400 : Rat) / 330679773) [(1, 1), (12, 2), (14, 1), (15, 1)],
  term ((1975398400 : Rat) / 330679773) [(1, 1), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 12. -/
theorem rs_R009_ueqv_R009NNNYN_partial_12_0015_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_12_0015
        rs_R009_ueqv_R009NNNYN_generator_12_0000_0042 =
      rs_R009_ueqv_R009NNNYN_partial_12_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NNNYN_coefficient_12_0016 : Poly :=
[
  term ((-911371480 : Rat) / 330679773) [(1, 1), (15, 1)]
]

/-- Partial product 16 for generator 12. -/
def rs_R009_ueqv_R009NNNYN_partial_12_0016 : Poly :=
[
  term ((-1822742960 : Rat) / 330679773) [(1, 1), (2, 1), (12, 1), (15, 1)],
  term ((-1822742960 : Rat) / 330679773) [(1, 1), (3, 1), (13, 1), (15, 1)],
  term ((911371480 : Rat) / 330679773) [(1, 1), (12, 2), (15, 1)],
  term ((911371480 : Rat) / 330679773) [(1, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 12. -/
theorem rs_R009_ueqv_R009NNNYN_partial_12_0016_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_12_0016
        rs_R009_ueqv_R009NNNYN_generator_12_0000_0042 =
      rs_R009_ueqv_R009NNNYN_partial_12_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NNNYN_coefficient_12_0017 : Poly :=
[
  term ((-268011520 : Rat) / 330679773) [(5, 1), (11, 1)]
]

/-- Partial product 17 for generator 12. -/
def rs_R009_ueqv_R009NNNYN_partial_12_0017 : Poly :=
[
  term ((-536023040 : Rat) / 330679773) [(2, 1), (5, 1), (11, 1), (12, 1)],
  term ((-536023040 : Rat) / 330679773) [(3, 1), (5, 1), (11, 1), (13, 1)],
  term ((268011520 : Rat) / 330679773) [(5, 1), (11, 1), (12, 2)],
  term ((268011520 : Rat) / 330679773) [(5, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 12. -/
theorem rs_R009_ueqv_R009NNNYN_partial_12_0017_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_12_0017
        rs_R009_ueqv_R009NNNYN_generator_12_0000_0042 =
      rs_R009_ueqv_R009NNNYN_partial_12_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NNNYN_coefficient_12_0018 : Poly :=
[
  term ((63365120 : Rat) / 36742197) [(5, 1), (11, 1), (14, 1)]
]

/-- Partial product 18 for generator 12. -/
def rs_R009_ueqv_R009NNNYN_partial_12_0018 : Poly :=
[
  term ((126730240 : Rat) / 36742197) [(2, 1), (5, 1), (11, 1), (12, 1), (14, 1)],
  term ((126730240 : Rat) / 36742197) [(3, 1), (5, 1), (11, 1), (13, 1), (14, 1)],
  term ((-63365120 : Rat) / 36742197) [(5, 1), (11, 1), (12, 2), (14, 1)],
  term ((-63365120 : Rat) / 36742197) [(5, 1), (11, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 12. -/
theorem rs_R009_ueqv_R009NNNYN_partial_12_0018_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_12_0018
        rs_R009_ueqv_R009NNNYN_generator_12_0000_0042 =
      rs_R009_ueqv_R009NNNYN_partial_12_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NNNYN_coefficient_12_0019 : Poly :=
[
  term ((-4187680 : Rat) / 12247399) [(5, 1), (13, 1)]
]

/-- Partial product 19 for generator 12. -/
def rs_R009_ueqv_R009NNNYN_partial_12_0019 : Poly :=
[
  term ((-8375360 : Rat) / 12247399) [(2, 1), (5, 1), (12, 1), (13, 1)],
  term ((-8375360 : Rat) / 12247399) [(3, 1), (5, 1), (13, 2)],
  term ((4187680 : Rat) / 12247399) [(5, 1), (12, 2), (13, 1)],
  term ((4187680 : Rat) / 12247399) [(5, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 12. -/
theorem rs_R009_ueqv_R009NNNYN_partial_12_0019_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_12_0019
        rs_R009_ueqv_R009NNNYN_generator_12_0000_0042 =
      rs_R009_ueqv_R009NNNYN_partial_12_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NNNYN_coefficient_12_0020 : Poly :=
[
  term ((8910720 : Rat) / 12247399) [(5, 1), (13, 1), (14, 1)]
]

/-- Partial product 20 for generator 12. -/
def rs_R009_ueqv_R009NNNYN_partial_12_0020 : Poly :=
[
  term ((17821440 : Rat) / 12247399) [(2, 1), (5, 1), (12, 1), (13, 1), (14, 1)],
  term ((17821440 : Rat) / 12247399) [(3, 1), (5, 1), (13, 2), (14, 1)],
  term ((-8910720 : Rat) / 12247399) [(5, 1), (12, 2), (13, 1), (14, 1)],
  term ((-8910720 : Rat) / 12247399) [(5, 1), (13, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 12. -/
theorem rs_R009_ueqv_R009NNNYN_partial_12_0020_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_12_0020
        rs_R009_ueqv_R009NNNYN_generator_12_0000_0042 =
      rs_R009_ueqv_R009NNNYN_partial_12_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NNNYN_coefficient_12_0021 : Poly :=
[
  term ((-57141760 : Rat) / 36742197) [(5, 1), (14, 1), (15, 1)]
]

/-- Partial product 21 for generator 12. -/
def rs_R009_ueqv_R009NNNYN_partial_12_0021 : Poly :=
[
  term ((-114283520 : Rat) / 36742197) [(2, 1), (5, 1), (12, 1), (14, 1), (15, 1)],
  term ((-114283520 : Rat) / 36742197) [(3, 1), (5, 1), (13, 1), (14, 1), (15, 1)],
  term ((57141760 : Rat) / 36742197) [(5, 1), (12, 2), (14, 1), (15, 1)],
  term ((57141760 : Rat) / 36742197) [(5, 1), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 12. -/
theorem rs_R009_ueqv_R009NNNYN_partial_12_0021_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_12_0021
        rs_R009_ueqv_R009NNNYN_generator_12_0000_0042 =
      rs_R009_ueqv_R009NNNYN_partial_12_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NNNYN_coefficient_12_0022 : Poly :=
[
  term ((241688960 : Rat) / 330679773) [(5, 1), (15, 1)]
]

/-- Partial product 22 for generator 12. -/
def rs_R009_ueqv_R009NNNYN_partial_12_0022 : Poly :=
[
  term ((483377920 : Rat) / 330679773) [(2, 1), (5, 1), (12, 1), (15, 1)],
  term ((483377920 : Rat) / 330679773) [(3, 1), (5, 1), (13, 1), (15, 1)],
  term ((-241688960 : Rat) / 330679773) [(5, 1), (12, 2), (15, 1)],
  term ((-241688960 : Rat) / 330679773) [(5, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 12. -/
theorem rs_R009_ueqv_R009NNNYN_partial_12_0022_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_12_0022
        rs_R009_ueqv_R009NNNYN_generator_12_0000_0042 =
      rs_R009_ueqv_R009NNNYN_partial_12_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NNNYN_coefficient_12_0023 : Poly :=
[
  term ((-1605578240 : Rat) / 330679773) [(7, 1), (11, 1)]
]

/-- Partial product 23 for generator 12. -/
def rs_R009_ueqv_R009NNNYN_partial_12_0023 : Poly :=
[
  term ((-3211156480 : Rat) / 330679773) [(2, 1), (7, 1), (11, 1), (12, 1)],
  term ((-3211156480 : Rat) / 330679773) [(3, 1), (7, 1), (11, 1), (13, 1)],
  term ((1605578240 : Rat) / 330679773) [(7, 1), (11, 1), (12, 2)],
  term ((1605578240 : Rat) / 330679773) [(7, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 12. -/
theorem rs_R009_ueqv_R009NNNYN_partial_12_0023_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_12_0023
        rs_R009_ueqv_R009NNNYN_generator_12_0000_0042 =
      rs_R009_ueqv_R009NNNYN_partial_12_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NNNYN_coefficient_12_0024 : Poly :=
[
  term ((63365120 : Rat) / 36742197) [(7, 1), (11, 1), (12, 1)]
]

/-- Partial product 24 for generator 12. -/
def rs_R009_ueqv_R009NNNYN_partial_12_0024 : Poly :=
[
  term ((126730240 : Rat) / 36742197) [(2, 1), (7, 1), (11, 1), (12, 2)],
  term ((126730240 : Rat) / 36742197) [(3, 1), (7, 1), (11, 1), (12, 1), (13, 1)],
  term ((-63365120 : Rat) / 36742197) [(7, 1), (11, 1), (12, 1), (13, 2)],
  term ((-63365120 : Rat) / 36742197) [(7, 1), (11, 1), (12, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 12. -/
theorem rs_R009_ueqv_R009NNNYN_partial_12_0024_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_12_0024
        rs_R009_ueqv_R009NNNYN_generator_12_0000_0042 =
      rs_R009_ueqv_R009NNNYN_partial_12_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NNNYN_coefficient_12_0025 : Poly :=
[
  term ((-205300480 : Rat) / 330679773) [(7, 1), (11, 1), (14, 1)]
]

/-- Partial product 25 for generator 12. -/
def rs_R009_ueqv_R009NNNYN_partial_12_0025 : Poly :=
[
  term ((-410600960 : Rat) / 330679773) [(2, 1), (7, 1), (11, 1), (12, 1), (14, 1)],
  term ((-410600960 : Rat) / 330679773) [(3, 1), (7, 1), (11, 1), (13, 1), (14, 1)],
  term ((205300480 : Rat) / 330679773) [(7, 1), (11, 1), (12, 2), (14, 1)],
  term ((205300480 : Rat) / 330679773) [(7, 1), (11, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 12. -/
theorem rs_R009_ueqv_R009NNNYN_partial_12_0025_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_12_0025
        rs_R009_ueqv_R009NNNYN_generator_12_0000_0042 =
      rs_R009_ueqv_R009NNNYN_partial_12_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NNNYN_coefficient_12_0026 : Poly :=
[
  term ((8910720 : Rat) / 12247399) [(7, 1), (12, 1), (13, 1)]
]

/-- Partial product 26 for generator 12. -/
def rs_R009_ueqv_R009NNNYN_partial_12_0026 : Poly :=
[
  term ((17821440 : Rat) / 12247399) [(2, 1), (7, 1), (12, 2), (13, 1)],
  term ((17821440 : Rat) / 12247399) [(3, 1), (7, 1), (12, 1), (13, 2)],
  term ((-8910720 : Rat) / 12247399) [(7, 1), (12, 1), (13, 3)],
  term ((-8910720 : Rat) / 12247399) [(7, 1), (12, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 12. -/
theorem rs_R009_ueqv_R009NNNYN_partial_12_0026_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_12_0026
        rs_R009_ueqv_R009NNNYN_generator_12_0000_0042 =
      rs_R009_ueqv_R009NNNYN_partial_12_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NNNYN_coefficient_12_0027 : Poly :=
[
  term ((-57141760 : Rat) / 36742197) [(7, 1), (12, 1), (15, 1)]
]

/-- Partial product 27 for generator 12. -/
def rs_R009_ueqv_R009NNNYN_partial_12_0027 : Poly :=
[
  term ((-114283520 : Rat) / 36742197) [(2, 1), (7, 1), (12, 2), (15, 1)],
  term ((-114283520 : Rat) / 36742197) [(3, 1), (7, 1), (12, 1), (13, 1), (15, 1)],
  term ((57141760 : Rat) / 36742197) [(7, 1), (12, 1), (13, 2), (15, 1)],
  term ((57141760 : Rat) / 36742197) [(7, 1), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 12. -/
theorem rs_R009_ueqv_R009NNNYN_partial_12_0027_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_12_0027
        rs_R009_ueqv_R009NNNYN_generator_12_0000_0042 =
      rs_R009_ueqv_R009NNNYN_partial_12_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NNNYN_coefficient_12_0028 : Poly :=
[
  term ((-25087160 : Rat) / 12247399) [(7, 1), (13, 1)]
]

/-- Partial product 28 for generator 12. -/
def rs_R009_ueqv_R009NNNYN_partial_12_0028 : Poly :=
[
  term ((-50174320 : Rat) / 12247399) [(2, 1), (7, 1), (12, 1), (13, 1)],
  term ((-50174320 : Rat) / 12247399) [(3, 1), (7, 1), (13, 2)],
  term ((25087160 : Rat) / 12247399) [(7, 1), (12, 2), (13, 1)],
  term ((25087160 : Rat) / 12247399) [(7, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 12. -/
theorem rs_R009_ueqv_R009NNNYN_partial_12_0028_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_12_0028
        rs_R009_ueqv_R009NNNYN_generator_12_0000_0042 =
      rs_R009_ueqv_R009NNNYN_partial_12_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NNNYN_coefficient_12_0029 : Poly :=
[
  term ((-3207820 : Rat) / 12247399) [(7, 1), (13, 1), (14, 1)]
]

/-- Partial product 29 for generator 12. -/
def rs_R009_ueqv_R009NNNYN_partial_12_0029 : Poly :=
[
  term ((-6415640 : Rat) / 12247399) [(2, 1), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((-6415640 : Rat) / 12247399) [(3, 1), (7, 1), (13, 2), (14, 1)],
  term ((3207820 : Rat) / 12247399) [(7, 1), (12, 2), (13, 1), (14, 1)],
  term ((3207820 : Rat) / 12247399) [(7, 1), (13, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 12. -/
theorem rs_R009_ueqv_R009NNNYN_partial_12_0029_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_12_0029
        rs_R009_ueqv_R009NNNYN_generator_12_0000_0042 =
      rs_R009_ueqv_R009NNNYN_partial_12_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NNNYN_coefficient_12_0030 : Poly :=
[
  term ((185137040 : Rat) / 330679773) [(7, 1), (14, 1), (15, 1)]
]

/-- Partial product 30 for generator 12. -/
def rs_R009_ueqv_R009NNNYN_partial_12_0030 : Poly :=
[
  term ((370274080 : Rat) / 330679773) [(2, 1), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((370274080 : Rat) / 330679773) [(3, 1), (7, 1), (13, 1), (14, 1), (15, 1)],
  term ((-185137040 : Rat) / 330679773) [(7, 1), (12, 2), (14, 1), (15, 1)],
  term ((-185137040 : Rat) / 330679773) [(7, 1), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 12. -/
theorem rs_R009_ueqv_R009NNNYN_partial_12_0030_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_12_0030
        rs_R009_ueqv_R009NNNYN_generator_12_0000_0042 =
      rs_R009_ueqv_R009NNNYN_partial_12_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NNNYN_coefficient_12_0031 : Poly :=
[
  term ((1447887520 : Rat) / 330679773) [(7, 1), (15, 1)]
]

/-- Partial product 31 for generator 12. -/
def rs_R009_ueqv_R009NNNYN_partial_12_0031 : Poly :=
[
  term ((2895775040 : Rat) / 330679773) [(2, 1), (7, 1), (12, 1), (15, 1)],
  term ((2895775040 : Rat) / 330679773) [(3, 1), (7, 1), (13, 1), (15, 1)],
  term ((-1447887520 : Rat) / 330679773) [(7, 1), (12, 2), (15, 1)],
  term ((-1447887520 : Rat) / 330679773) [(7, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 12. -/
theorem rs_R009_ueqv_R009NNNYN_partial_12_0031_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_12_0031
        rs_R009_ueqv_R009NNNYN_generator_12_0000_0042 =
      rs_R009_ueqv_R009NNNYN_partial_12_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NNNYN_coefficient_12_0032 : Poly :=
[
  term ((167444480 : Rat) / 110226591) [(11, 1), (12, 1), (15, 1)]
]

/-- Partial product 32 for generator 12. -/
def rs_R009_ueqv_R009NNNYN_partial_12_0032 : Poly :=
[
  term ((334888960 : Rat) / 110226591) [(2, 1), (11, 1), (12, 2), (15, 1)],
  term ((334888960 : Rat) / 110226591) [(3, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-167444480 : Rat) / 110226591) [(11, 1), (12, 1), (13, 2), (15, 1)],
  term ((-167444480 : Rat) / 110226591) [(11, 1), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 12. -/
theorem rs_R009_ueqv_R009NNNYN_partial_12_0032_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_12_0032
        rs_R009_ueqv_R009NNNYN_generator_12_0000_0042 =
      rs_R009_ueqv_R009NNNYN_partial_12_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NNNYN_coefficient_12_0033 : Poly :=
[
  term ((-868618240 : Rat) / 330679773) [(11, 1), (13, 1)]
]

/-- Partial product 33 for generator 12. -/
def rs_R009_ueqv_R009NNNYN_partial_12_0033 : Poly :=
[
  term ((-1737236480 : Rat) / 330679773) [(2, 1), (11, 1), (12, 1), (13, 1)],
  term ((-1737236480 : Rat) / 330679773) [(3, 1), (11, 1), (13, 2)],
  term ((868618240 : Rat) / 330679773) [(11, 1), (12, 2), (13, 1)],
  term ((868618240 : Rat) / 330679773) [(11, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 12. -/
theorem rs_R009_ueqv_R009NNNYN_partial_12_0033_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_12_0033
        rs_R009_ueqv_R009NNNYN_generator_12_0000_0042 =
      rs_R009_ueqv_R009NNNYN_partial_12_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NNNYN_coefficient_12_0034 : Poly :=
[
  term ((-167444480 : Rat) / 110226591) [(11, 1), (13, 1), (14, 1)]
]

/-- Partial product 34 for generator 12. -/
def rs_R009_ueqv_R009NNNYN_partial_12_0034 : Poly :=
[
  term ((-334888960 : Rat) / 110226591) [(2, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-334888960 : Rat) / 110226591) [(3, 1), (11, 1), (13, 2), (14, 1)],
  term ((167444480 : Rat) / 110226591) [(11, 1), (12, 2), (13, 1), (14, 1)],
  term ((167444480 : Rat) / 110226591) [(11, 1), (13, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 12. -/
theorem rs_R009_ueqv_R009NNNYN_partial_12_0034_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_12_0034
        rs_R009_ueqv_R009NNNYN_generator_12_0000_0042 =
      rs_R009_ueqv_R009NNNYN_partial_12_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NNNYN_coefficient_12_0035 : Poly :=
[
  term ((1093339520 : Rat) / 330679773) [(11, 1), (15, 1)]
]

/-- Partial product 35 for generator 12. -/
def rs_R009_ueqv_R009NNNYN_partial_12_0035 : Poly :=
[
  term ((2186679040 : Rat) / 330679773) [(2, 1), (11, 1), (12, 1), (15, 1)],
  term ((2186679040 : Rat) / 330679773) [(3, 1), (11, 1), (13, 1), (15, 1)],
  term ((-1093339520 : Rat) / 330679773) [(11, 1), (12, 2), (15, 1)],
  term ((-1093339520 : Rat) / 330679773) [(11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 12. -/
theorem rs_R009_ueqv_R009NNNYN_partial_12_0035_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_12_0035
        rs_R009_ueqv_R009NNNYN_generator_12_0000_0042 =
      rs_R009_ueqv_R009NNNYN_partial_12_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NNNYN_coefficient_12_0036 : Poly :=
[
  term ((7848960 : Rat) / 12247399) [(12, 1), (13, 1), (15, 1)]
]

/-- Partial product 36 for generator 12. -/
def rs_R009_ueqv_R009NNNYN_partial_12_0036 : Poly :=
[
  term ((15697920 : Rat) / 12247399) [(2, 1), (12, 2), (13, 1), (15, 1)],
  term ((15697920 : Rat) / 12247399) [(3, 1), (12, 1), (13, 2), (15, 1)],
  term ((-7848960 : Rat) / 12247399) [(12, 1), (13, 3), (15, 1)],
  term ((-7848960 : Rat) / 12247399) [(12, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 12. -/
theorem rs_R009_ueqv_R009NNNYN_partial_12_0036_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_12_0036
        rs_R009_ueqv_R009NNNYN_generator_12_0000_0042 =
      rs_R009_ueqv_R009NNNYN_partial_12_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NNNYN_coefficient_12_0037 : Poly :=
[
  term ((-150999040 : Rat) / 110226591) [(12, 1), (15, 2)]
]

/-- Partial product 37 for generator 12. -/
def rs_R009_ueqv_R009NNNYN_partial_12_0037 : Poly :=
[
  term ((-301998080 : Rat) / 110226591) [(2, 1), (12, 2), (15, 2)],
  term ((-301998080 : Rat) / 110226591) [(3, 1), (12, 1), (13, 1), (15, 2)],
  term ((150999040 : Rat) / 110226591) [(12, 1), (13, 2), (15, 2)],
  term ((150999040 : Rat) / 110226591) [(12, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 12. -/
theorem rs_R009_ueqv_R009NNNYN_partial_12_0037_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_12_0037
        rs_R009_ueqv_R009NNNYN_generator_12_0000_0042 =
      rs_R009_ueqv_R009NNNYN_partial_12_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NNNYN_coefficient_12_0038 : Poly :=
[
  term ((150999040 : Rat) / 110226591) [(13, 1), (14, 1), (15, 1)]
]

/-- Partial product 38 for generator 12. -/
def rs_R009_ueqv_R009NNNYN_partial_12_0038 : Poly :=
[
  term ((301998080 : Rat) / 110226591) [(2, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((301998080 : Rat) / 110226591) [(3, 1), (13, 2), (14, 1), (15, 1)],
  term ((-150999040 : Rat) / 110226591) [(12, 2), (13, 1), (14, 1), (15, 1)],
  term ((-150999040 : Rat) / 110226591) [(13, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 12. -/
theorem rs_R009_ueqv_R009NNNYN_partial_12_0038_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_12_0038
        rs_R009_ueqv_R009NNNYN_generator_12_0000_0042 =
      rs_R009_ueqv_R009NNNYN_partial_12_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NNNYN_coefficient_12_0039 : Poly :=
[
  term ((1244560130 : Rat) / 330679773) [(13, 1), (15, 1)]
]

/-- Partial product 39 for generator 12. -/
def rs_R009_ueqv_R009NNNYN_partial_12_0039 : Poly :=
[
  term ((2489120260 : Rat) / 330679773) [(2, 1), (12, 1), (13, 1), (15, 1)],
  term ((2489120260 : Rat) / 330679773) [(3, 1), (13, 2), (15, 1)],
  term ((-1244560130 : Rat) / 330679773) [(12, 2), (13, 1), (15, 1)],
  term ((-1244560130 : Rat) / 330679773) [(13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 12. -/
theorem rs_R009_ueqv_R009NNNYN_partial_12_0039_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_12_0039
        rs_R009_ueqv_R009NNNYN_generator_12_0000_0042 =
      rs_R009_ueqv_R009NNNYN_partial_12_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NNNYN_coefficient_12_0040 : Poly :=
[
  term ((-13572160 : Rat) / 12247399) [(13, 2)]
]

/-- Partial product 40 for generator 12. -/
def rs_R009_ueqv_R009NNNYN_partial_12_0040 : Poly :=
[
  term ((-27144320 : Rat) / 12247399) [(2, 1), (12, 1), (13, 2)],
  term ((-27144320 : Rat) / 12247399) [(3, 1), (13, 3)],
  term ((13572160 : Rat) / 12247399) [(12, 2), (13, 2)],
  term ((13572160 : Rat) / 12247399) [(13, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 12. -/
theorem rs_R009_ueqv_R009NNNYN_partial_12_0040_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_12_0040
        rs_R009_ueqv_R009NNNYN_generator_12_0000_0042 =
      rs_R009_ueqv_R009NNNYN_partial_12_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NNNYN_coefficient_12_0041 : Poly :=
[
  term ((-7848960 : Rat) / 12247399) [(13, 2), (14, 1)]
]

/-- Partial product 41 for generator 12. -/
def rs_R009_ueqv_R009NNNYN_partial_12_0041 : Poly :=
[
  term ((-15697920 : Rat) / 12247399) [(2, 1), (12, 1), (13, 2), (14, 1)],
  term ((-15697920 : Rat) / 12247399) [(3, 1), (13, 3), (14, 1)],
  term ((7848960 : Rat) / 12247399) [(12, 2), (13, 2), (14, 1)],
  term ((7848960 : Rat) / 12247399) [(13, 4), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 12. -/
theorem rs_R009_ueqv_R009NNNYN_partial_12_0041_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_12_0041
        rs_R009_ueqv_R009NNNYN_generator_12_0000_0042 =
      rs_R009_ueqv_R009NNNYN_partial_12_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009NNNYN_coefficient_12_0042 : Poly :=
[
  term ((-985957960 : Rat) / 330679773) [(15, 2)]
]

/-- Partial product 42 for generator 12. -/
def rs_R009_ueqv_R009NNNYN_partial_12_0042 : Poly :=
[
  term ((-1971915920 : Rat) / 330679773) [(2, 1), (12, 1), (15, 2)],
  term ((-1971915920 : Rat) / 330679773) [(3, 1), (13, 1), (15, 2)],
  term ((985957960 : Rat) / 330679773) [(12, 2), (15, 2)],
  term ((985957960 : Rat) / 330679773) [(13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 12. -/
theorem rs_R009_ueqv_R009NNNYN_partial_12_0042_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_12_0042
        rs_R009_ueqv_R009NNNYN_generator_12_0000_0042 =
      rs_R009_ueqv_R009NNNYN_partial_12_0042 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NNNYN_partials_12_0000_0042 : List Poly :=
[
  rs_R009_ueqv_R009NNNYN_partial_12_0000,
  rs_R009_ueqv_R009NNNYN_partial_12_0001,
  rs_R009_ueqv_R009NNNYN_partial_12_0002,
  rs_R009_ueqv_R009NNNYN_partial_12_0003,
  rs_R009_ueqv_R009NNNYN_partial_12_0004,
  rs_R009_ueqv_R009NNNYN_partial_12_0005,
  rs_R009_ueqv_R009NNNYN_partial_12_0006,
  rs_R009_ueqv_R009NNNYN_partial_12_0007,
  rs_R009_ueqv_R009NNNYN_partial_12_0008,
  rs_R009_ueqv_R009NNNYN_partial_12_0009,
  rs_R009_ueqv_R009NNNYN_partial_12_0010,
  rs_R009_ueqv_R009NNNYN_partial_12_0011,
  rs_R009_ueqv_R009NNNYN_partial_12_0012,
  rs_R009_ueqv_R009NNNYN_partial_12_0013,
  rs_R009_ueqv_R009NNNYN_partial_12_0014,
  rs_R009_ueqv_R009NNNYN_partial_12_0015,
  rs_R009_ueqv_R009NNNYN_partial_12_0016,
  rs_R009_ueqv_R009NNNYN_partial_12_0017,
  rs_R009_ueqv_R009NNNYN_partial_12_0018,
  rs_R009_ueqv_R009NNNYN_partial_12_0019,
  rs_R009_ueqv_R009NNNYN_partial_12_0020,
  rs_R009_ueqv_R009NNNYN_partial_12_0021,
  rs_R009_ueqv_R009NNNYN_partial_12_0022,
  rs_R009_ueqv_R009NNNYN_partial_12_0023,
  rs_R009_ueqv_R009NNNYN_partial_12_0024,
  rs_R009_ueqv_R009NNNYN_partial_12_0025,
  rs_R009_ueqv_R009NNNYN_partial_12_0026,
  rs_R009_ueqv_R009NNNYN_partial_12_0027,
  rs_R009_ueqv_R009NNNYN_partial_12_0028,
  rs_R009_ueqv_R009NNNYN_partial_12_0029,
  rs_R009_ueqv_R009NNNYN_partial_12_0030,
  rs_R009_ueqv_R009NNNYN_partial_12_0031,
  rs_R009_ueqv_R009NNNYN_partial_12_0032,
  rs_R009_ueqv_R009NNNYN_partial_12_0033,
  rs_R009_ueqv_R009NNNYN_partial_12_0034,
  rs_R009_ueqv_R009NNNYN_partial_12_0035,
  rs_R009_ueqv_R009NNNYN_partial_12_0036,
  rs_R009_ueqv_R009NNNYN_partial_12_0037,
  rs_R009_ueqv_R009NNNYN_partial_12_0038,
  rs_R009_ueqv_R009NNNYN_partial_12_0039,
  rs_R009_ueqv_R009NNNYN_partial_12_0040,
  rs_R009_ueqv_R009NNNYN_partial_12_0041,
  rs_R009_ueqv_R009NNNYN_partial_12_0042
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NNNYN_block_12_0000_0042 : Poly :=
[
  term ((682411520 : Rat) / 330679773) [(0, 1), (2, 1), (7, 1), (11, 1), (12, 1)],
  term ((10662680 : Rat) / 12247399) [(0, 1), (2, 1), (7, 1), (12, 1), (13, 1)],
  term ((-615388960 : Rat) / 330679773) [(0, 1), (2, 1), (7, 1), (12, 1), (15, 1)],
  term ((3312189440 : Rat) / 330679773) [(0, 1), (2, 1), (11, 1), (12, 1), (13, 1)],
  term ((-4381081600 : Rat) / 330679773) [(0, 1), (2, 1), (11, 1), (12, 1), (15, 1)],
  term ((-4835153920 : Rat) / 330679773) [(0, 1), (2, 1), (12, 1), (13, 1), (15, 1)],
  term ((51752960 : Rat) / 12247399) [(0, 1), (2, 1), (12, 1), (13, 2)],
  term ((3950796800 : Rat) / 330679773) [(0, 1), (2, 1), (12, 1), (15, 2)],
  term ((682411520 : Rat) / 330679773) [(0, 1), (3, 1), (7, 1), (11, 1), (13, 1)],
  term ((-615388960 : Rat) / 330679773) [(0, 1), (3, 1), (7, 1), (13, 1), (15, 1)],
  term ((10662680 : Rat) / 12247399) [(0, 1), (3, 1), (7, 1), (13, 2)],
  term ((-4381081600 : Rat) / 330679773) [(0, 1), (3, 1), (11, 1), (13, 1), (15, 1)],
  term ((3312189440 : Rat) / 330679773) [(0, 1), (3, 1), (11, 1), (13, 2)],
  term ((3950796800 : Rat) / 330679773) [(0, 1), (3, 1), (13, 1), (15, 2)],
  term ((-4835153920 : Rat) / 330679773) [(0, 1), (3, 1), (13, 2), (15, 1)],
  term ((51752960 : Rat) / 12247399) [(0, 1), (3, 1), (13, 3)],
  term ((-341205760 : Rat) / 330679773) [(0, 1), (7, 1), (11, 1), (12, 2)],
  term ((-341205760 : Rat) / 330679773) [(0, 1), (7, 1), (11, 1), (13, 2)],
  term ((-5331340 : Rat) / 12247399) [(0, 1), (7, 1), (12, 2), (13, 1)],
  term ((307694480 : Rat) / 330679773) [(0, 1), (7, 1), (12, 2), (15, 1)],
  term ((307694480 : Rat) / 330679773) [(0, 1), (7, 1), (13, 2), (15, 1)],
  term ((-5331340 : Rat) / 12247399) [(0, 1), (7, 1), (13, 3)],
  term ((-1656094720 : Rat) / 330679773) [(0, 1), (11, 1), (12, 2), (13, 1)],
  term ((2190540800 : Rat) / 330679773) [(0, 1), (11, 1), (12, 2), (15, 1)],
  term ((2190540800 : Rat) / 330679773) [(0, 1), (11, 1), (13, 2), (15, 1)],
  term ((-1656094720 : Rat) / 330679773) [(0, 1), (11, 1), (13, 3)],
  term ((2417576960 : Rat) / 330679773) [(0, 1), (12, 2), (13, 1), (15, 1)],
  term ((-25876480 : Rat) / 12247399) [(0, 1), (12, 2), (13, 2)],
  term ((-1975398400 : Rat) / 330679773) [(0, 1), (12, 2), (15, 2)],
  term ((-1975398400 : Rat) / 330679773) [(0, 1), (13, 2), (15, 2)],
  term ((2417576960 : Rat) / 330679773) [(0, 1), (13, 3), (15, 1)],
  term ((-25876480 : Rat) / 12247399) [(0, 1), (13, 4)],
  term ((2021259520 : Rat) / 330679773) [(1, 1), (2, 1), (11, 1), (12, 1)],
  term ((4381081600 : Rat) / 330679773) [(1, 1), (2, 1), (11, 1), (12, 1), (14, 1)],
  term ((-3312189440 : Rat) / 330679773) [(1, 1), (2, 1), (11, 1), (12, 2)],
  term ((31582180 : Rat) / 12247399) [(1, 1), (2, 1), (12, 1), (13, 1)],
  term ((68454400 : Rat) / 12247399) [(1, 1), (2, 1), (12, 1), (13, 1), (14, 1)],
  term ((-3950796800 : Rat) / 330679773) [(1, 1), (2, 1), (12, 1), (14, 1), (15, 1)],
  term ((-1822742960 : Rat) / 330679773) [(1, 1), (2, 1), (12, 1), (15, 1)],
  term ((-51752960 : Rat) / 12247399) [(1, 1), (2, 1), (12, 2), (13, 1)],
  term ((2986885120 : Rat) / 330679773) [(1, 1), (2, 1), (12, 2), (15, 1)],
  term ((-3312189440 : Rat) / 330679773) [(1, 1), (3, 1), (11, 1), (12, 1), (13, 1)],
  term ((2021259520 : Rat) / 330679773) [(1, 1), (3, 1), (11, 1), (13, 1)],
  term ((4381081600 : Rat) / 330679773) [(1, 1), (3, 1), (11, 1), (13, 1), (14, 1)],
  term ((2986885120 : Rat) / 330679773) [(1, 1), (3, 1), (12, 1), (13, 1), (15, 1)],
  term ((-51752960 : Rat) / 12247399) [(1, 1), (3, 1), (12, 1), (13, 2)],
  term ((-3950796800 : Rat) / 330679773) [(1, 1), (3, 1), (13, 1), (14, 1), (15, 1)],
  term ((-1822742960 : Rat) / 330679773) [(1, 1), (3, 1), (13, 1), (15, 1)],
  term ((31582180 : Rat) / 12247399) [(1, 1), (3, 1), (13, 2)],
  term ((68454400 : Rat) / 12247399) [(1, 1), (3, 1), (13, 2), (14, 1)],
  term ((1656094720 : Rat) / 330679773) [(1, 1), (11, 1), (12, 1), (13, 2)],
  term ((-1010629760 : Rat) / 330679773) [(1, 1), (11, 1), (12, 2)],
  term ((-2190540800 : Rat) / 330679773) [(1, 1), (11, 1), (12, 2), (14, 1)],
  term ((1656094720 : Rat) / 330679773) [(1, 1), (11, 1), (12, 3)],
  term ((-1010629760 : Rat) / 330679773) [(1, 1), (11, 1), (13, 2)],
  term ((-2190540800 : Rat) / 330679773) [(1, 1), (11, 1), (13, 2), (14, 1)],
  term ((-1493442560 : Rat) / 330679773) [(1, 1), (12, 1), (13, 2), (15, 1)],
  term ((25876480 : Rat) / 12247399) [(1, 1), (12, 1), (13, 3)],
  term ((-15791090 : Rat) / 12247399) [(1, 1), (12, 2), (13, 1)],
  term ((-34227200 : Rat) / 12247399) [(1, 1), (12, 2), (13, 1), (14, 1)],
  term ((1975398400 : Rat) / 330679773) [(1, 1), (12, 2), (14, 1), (15, 1)],
  term ((911371480 : Rat) / 330679773) [(1, 1), (12, 2), (15, 1)],
  term ((25876480 : Rat) / 12247399) [(1, 1), (12, 3), (13, 1)],
  term ((-1493442560 : Rat) / 330679773) [(1, 1), (12, 3), (15, 1)],
  term ((1975398400 : Rat) / 330679773) [(1, 1), (13, 2), (14, 1), (15, 1)],
  term ((911371480 : Rat) / 330679773) [(1, 1), (13, 2), (15, 1)],
  term ((-15791090 : Rat) / 12247399) [(1, 1), (13, 3)],
  term ((-34227200 : Rat) / 12247399) [(1, 1), (13, 3), (14, 1)],
  term ((-536023040 : Rat) / 330679773) [(2, 1), (5, 1), (11, 1), (12, 1)],
  term ((126730240 : Rat) / 36742197) [(2, 1), (5, 1), (11, 1), (12, 1), (14, 1)],
  term ((-8375360 : Rat) / 12247399) [(2, 1), (5, 1), (12, 1), (13, 1)],
  term ((17821440 : Rat) / 12247399) [(2, 1), (5, 1), (12, 1), (13, 1), (14, 1)],
  term ((-114283520 : Rat) / 36742197) [(2, 1), (5, 1), (12, 1), (14, 1), (15, 1)],
  term ((483377920 : Rat) / 330679773) [(2, 1), (5, 1), (12, 1), (15, 1)],
  term ((-3211156480 : Rat) / 330679773) [(2, 1), (7, 1), (11, 1), (12, 1)],
  term ((-410600960 : Rat) / 330679773) [(2, 1), (7, 1), (11, 1), (12, 1), (14, 1)],
  term ((126730240 : Rat) / 36742197) [(2, 1), (7, 1), (11, 1), (12, 2)],
  term ((-50174320 : Rat) / 12247399) [(2, 1), (7, 1), (12, 1), (13, 1)],
  term ((-6415640 : Rat) / 12247399) [(2, 1), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((370274080 : Rat) / 330679773) [(2, 1), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((2895775040 : Rat) / 330679773) [(2, 1), (7, 1), (12, 1), (15, 1)],
  term ((17821440 : Rat) / 12247399) [(2, 1), (7, 1), (12, 2), (13, 1)],
  term ((-114283520 : Rat) / 36742197) [(2, 1), (7, 1), (12, 2), (15, 1)],
  term ((-1737236480 : Rat) / 330679773) [(2, 1), (11, 1), (12, 1), (13, 1)],
  term ((-334888960 : Rat) / 110226591) [(2, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((2186679040 : Rat) / 330679773) [(2, 1), (11, 1), (12, 1), (15, 1)],
  term ((334888960 : Rat) / 110226591) [(2, 1), (11, 1), (12, 2), (15, 1)],
  term ((301998080 : Rat) / 110226591) [(2, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((2489120260 : Rat) / 330679773) [(2, 1), (12, 1), (13, 1), (15, 1)],
  term ((-27144320 : Rat) / 12247399) [(2, 1), (12, 1), (13, 2)],
  term ((-15697920 : Rat) / 12247399) [(2, 1), (12, 1), (13, 2), (14, 1)],
  term ((-1971915920 : Rat) / 330679773) [(2, 1), (12, 1), (15, 2)],
  term ((15697920 : Rat) / 12247399) [(2, 1), (12, 2), (13, 1), (15, 1)],
  term ((-301998080 : Rat) / 110226591) [(2, 1), (12, 2), (15, 2)],
  term ((-536023040 : Rat) / 330679773) [(3, 1), (5, 1), (11, 1), (13, 1)],
  term ((126730240 : Rat) / 36742197) [(3, 1), (5, 1), (11, 1), (13, 1), (14, 1)],
  term ((-114283520 : Rat) / 36742197) [(3, 1), (5, 1), (13, 1), (14, 1), (15, 1)],
  term ((483377920 : Rat) / 330679773) [(3, 1), (5, 1), (13, 1), (15, 1)],
  term ((-8375360 : Rat) / 12247399) [(3, 1), (5, 1), (13, 2)],
  term ((17821440 : Rat) / 12247399) [(3, 1), (5, 1), (13, 2), (14, 1)],
  term ((126730240 : Rat) / 36742197) [(3, 1), (7, 1), (11, 1), (12, 1), (13, 1)],
  term ((-3211156480 : Rat) / 330679773) [(3, 1), (7, 1), (11, 1), (13, 1)],
  term ((-410600960 : Rat) / 330679773) [(3, 1), (7, 1), (11, 1), (13, 1), (14, 1)],
  term ((-114283520 : Rat) / 36742197) [(3, 1), (7, 1), (12, 1), (13, 1), (15, 1)],
  term ((17821440 : Rat) / 12247399) [(3, 1), (7, 1), (12, 1), (13, 2)],
  term ((370274080 : Rat) / 330679773) [(3, 1), (7, 1), (13, 1), (14, 1), (15, 1)],
  term ((2895775040 : Rat) / 330679773) [(3, 1), (7, 1), (13, 1), (15, 1)],
  term ((-50174320 : Rat) / 12247399) [(3, 1), (7, 1), (13, 2)],
  term ((-6415640 : Rat) / 12247399) [(3, 1), (7, 1), (13, 2), (14, 1)],
  term ((334888960 : Rat) / 110226591) [(3, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((2186679040 : Rat) / 330679773) [(3, 1), (11, 1), (13, 1), (15, 1)],
  term ((-1737236480 : Rat) / 330679773) [(3, 1), (11, 1), (13, 2)],
  term ((-334888960 : Rat) / 110226591) [(3, 1), (11, 1), (13, 2), (14, 1)],
  term ((-301998080 : Rat) / 110226591) [(3, 1), (12, 1), (13, 1), (15, 2)],
  term ((15697920 : Rat) / 12247399) [(3, 1), (12, 1), (13, 2), (15, 1)],
  term ((-1971915920 : Rat) / 330679773) [(3, 1), (13, 1), (15, 2)],
  term ((301998080 : Rat) / 110226591) [(3, 1), (13, 2), (14, 1), (15, 1)],
  term ((2489120260 : Rat) / 330679773) [(3, 1), (13, 2), (15, 1)],
  term ((-27144320 : Rat) / 12247399) [(3, 1), (13, 3)],
  term ((-15697920 : Rat) / 12247399) [(3, 1), (13, 3), (14, 1)],
  term ((268011520 : Rat) / 330679773) [(5, 1), (11, 1), (12, 2)],
  term ((-63365120 : Rat) / 36742197) [(5, 1), (11, 1), (12, 2), (14, 1)],
  term ((268011520 : Rat) / 330679773) [(5, 1), (11, 1), (13, 2)],
  term ((-63365120 : Rat) / 36742197) [(5, 1), (11, 1), (13, 2), (14, 1)],
  term ((4187680 : Rat) / 12247399) [(5, 1), (12, 2), (13, 1)],
  term ((-8910720 : Rat) / 12247399) [(5, 1), (12, 2), (13, 1), (14, 1)],
  term ((57141760 : Rat) / 36742197) [(5, 1), (12, 2), (14, 1), (15, 1)],
  term ((-241688960 : Rat) / 330679773) [(5, 1), (12, 2), (15, 1)],
  term ((57141760 : Rat) / 36742197) [(5, 1), (13, 2), (14, 1), (15, 1)],
  term ((-241688960 : Rat) / 330679773) [(5, 1), (13, 2), (15, 1)],
  term ((4187680 : Rat) / 12247399) [(5, 1), (13, 3)],
  term ((-8910720 : Rat) / 12247399) [(5, 1), (13, 3), (14, 1)],
  term ((-63365120 : Rat) / 36742197) [(7, 1), (11, 1), (12, 1), (13, 2)],
  term ((1605578240 : Rat) / 330679773) [(7, 1), (11, 1), (12, 2)],
  term ((205300480 : Rat) / 330679773) [(7, 1), (11, 1), (12, 2), (14, 1)],
  term ((-63365120 : Rat) / 36742197) [(7, 1), (11, 1), (12, 3)],
  term ((1605578240 : Rat) / 330679773) [(7, 1), (11, 1), (13, 2)],
  term ((205300480 : Rat) / 330679773) [(7, 1), (11, 1), (13, 2), (14, 1)],
  term ((57141760 : Rat) / 36742197) [(7, 1), (12, 1), (13, 2), (15, 1)],
  term ((-8910720 : Rat) / 12247399) [(7, 1), (12, 1), (13, 3)],
  term ((25087160 : Rat) / 12247399) [(7, 1), (12, 2), (13, 1)],
  term ((3207820 : Rat) / 12247399) [(7, 1), (12, 2), (13, 1), (14, 1)],
  term ((-185137040 : Rat) / 330679773) [(7, 1), (12, 2), (14, 1), (15, 1)],
  term ((-1447887520 : Rat) / 330679773) [(7, 1), (12, 2), (15, 1)],
  term ((-8910720 : Rat) / 12247399) [(7, 1), (12, 3), (13, 1)],
  term ((57141760 : Rat) / 36742197) [(7, 1), (12, 3), (15, 1)],
  term ((-185137040 : Rat) / 330679773) [(7, 1), (13, 2), (14, 1), (15, 1)],
  term ((-1447887520 : Rat) / 330679773) [(7, 1), (13, 2), (15, 1)],
  term ((25087160 : Rat) / 12247399) [(7, 1), (13, 3)],
  term ((3207820 : Rat) / 12247399) [(7, 1), (13, 3), (14, 1)],
  term ((-167444480 : Rat) / 110226591) [(11, 1), (12, 1), (13, 2), (15, 1)],
  term ((868618240 : Rat) / 330679773) [(11, 1), (12, 2), (13, 1)],
  term ((167444480 : Rat) / 110226591) [(11, 1), (12, 2), (13, 1), (14, 1)],
  term ((-1093339520 : Rat) / 330679773) [(11, 1), (12, 2), (15, 1)],
  term ((-167444480 : Rat) / 110226591) [(11, 1), (12, 3), (15, 1)],
  term ((-1093339520 : Rat) / 330679773) [(11, 1), (13, 2), (15, 1)],
  term ((868618240 : Rat) / 330679773) [(11, 1), (13, 3)],
  term ((167444480 : Rat) / 110226591) [(11, 1), (13, 3), (14, 1)],
  term ((150999040 : Rat) / 110226591) [(12, 1), (13, 2), (15, 2)],
  term ((-7848960 : Rat) / 12247399) [(12, 1), (13, 3), (15, 1)],
  term ((-150999040 : Rat) / 110226591) [(12, 2), (13, 1), (14, 1), (15, 1)],
  term ((-1244560130 : Rat) / 330679773) [(12, 2), (13, 1), (15, 1)],
  term ((13572160 : Rat) / 12247399) [(12, 2), (13, 2)],
  term ((7848960 : Rat) / 12247399) [(12, 2), (13, 2), (14, 1)],
  term ((985957960 : Rat) / 330679773) [(12, 2), (15, 2)],
  term ((-7848960 : Rat) / 12247399) [(12, 3), (13, 1), (15, 1)],
  term ((150999040 : Rat) / 110226591) [(12, 3), (15, 2)],
  term ((985957960 : Rat) / 330679773) [(13, 2), (15, 2)],
  term ((-150999040 : Rat) / 110226591) [(13, 3), (14, 1), (15, 1)],
  term ((-1244560130 : Rat) / 330679773) [(13, 3), (15, 1)],
  term ((13572160 : Rat) / 12247399) [(13, 4)],
  term ((7848960 : Rat) / 12247399) [(13, 4), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 12, terms 0 through 42. -/
theorem rs_R009_ueqv_R009NNNYN_block_12_0000_0042_valid :
    checkProductSumEq rs_R009_ueqv_R009NNNYN_partials_12_0000_0042
      rs_R009_ueqv_R009NNNYN_block_12_0000_0042 = true := by
  native_decide

end R009UeqvR009NNNYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
