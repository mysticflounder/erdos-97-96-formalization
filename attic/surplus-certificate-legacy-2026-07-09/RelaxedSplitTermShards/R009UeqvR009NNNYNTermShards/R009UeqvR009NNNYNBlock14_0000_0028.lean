/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NNNYN, term block 14:0-28

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NNNYNTermShards

/-- Generator polynomial 14 for relaxed split surplus certificate `R009:u=v:R009NNNYN`. -/
def rs_R009_ueqv_R009NNNYN_generator_14_0000_0028 : Poly :=
[
  term (-2 : Rat) [(2, 1), (4, 1)],
  term (1 : Rat) [(2, 2)],
  term (-2 : Rat) [(3, 1), (5, 1)],
  term (1 : Rat) [(3, 2)],
  term (2 : Rat) [(4, 1), (10, 1)],
  term (2 : Rat) [(5, 1), (11, 1)],
  term (-1 : Rat) [(10, 2)],
  term (-1 : Rat) [(11, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NNNYN_coefficient_14_0000 : Poly :=
[
  term ((235 : Rat) / 134) []
]

/-- Partial product 0 for generator 14. -/
def rs_R009_ueqv_R009NNNYN_partial_14_0000 : Poly :=
[
  term ((-235 : Rat) / 67) [(2, 1), (4, 1)],
  term ((235 : Rat) / 134) [(2, 2)],
  term ((-235 : Rat) / 67) [(3, 1), (5, 1)],
  term ((235 : Rat) / 134) [(3, 2)],
  term ((235 : Rat) / 67) [(4, 1), (10, 1)],
  term ((235 : Rat) / 67) [(5, 1), (11, 1)],
  term ((-235 : Rat) / 134) [(10, 2)],
  term ((-235 : Rat) / 134) [(11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 14. -/
theorem rs_R009_ueqv_R009NNNYN_partial_14_0000_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_14_0000
        rs_R009_ueqv_R009NNNYN_generator_14_0000_0028 =
      rs_R009_ueqv_R009NNNYN_partial_14_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NNNYN_coefficient_14_0001 : Poly :=
[
  term ((-38993920 : Rat) / 110226591) [(0, 1), (11, 1), (15, 1)]
]

/-- Partial product 1 for generator 14. -/
def rs_R009_ueqv_R009NNNYN_partial_14_0001 : Poly :=
[
  term ((77987840 : Rat) / 110226591) [(0, 1), (2, 1), (4, 1), (11, 1), (15, 1)],
  term ((-38993920 : Rat) / 110226591) [(0, 1), (2, 2), (11, 1), (15, 1)],
  term ((77987840 : Rat) / 110226591) [(0, 1), (3, 1), (5, 1), (11, 1), (15, 1)],
  term ((-38993920 : Rat) / 110226591) [(0, 1), (3, 2), (11, 1), (15, 1)],
  term ((-77987840 : Rat) / 110226591) [(0, 1), (4, 1), (10, 1), (11, 1), (15, 1)],
  term ((-77987840 : Rat) / 110226591) [(0, 1), (5, 1), (11, 2), (15, 1)],
  term ((38993920 : Rat) / 110226591) [(0, 1), (10, 2), (11, 1), (15, 1)],
  term ((38993920 : Rat) / 110226591) [(0, 1), (11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 14. -/
theorem rs_R009_ueqv_R009NNNYN_partial_14_0001_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_14_0001
        rs_R009_ueqv_R009NNNYN_generator_14_0000_0028 =
      rs_R009_ueqv_R009NNNYN_partial_14_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NNNYN_coefficient_14_0002 : Poly :=
[
  term ((-1827840 : Rat) / 12247399) [(0, 1), (13, 1), (15, 1)]
]

/-- Partial product 2 for generator 14. -/
def rs_R009_ueqv_R009NNNYN_partial_14_0002 : Poly :=
[
  term ((3655680 : Rat) / 12247399) [(0, 1), (2, 1), (4, 1), (13, 1), (15, 1)],
  term ((-1827840 : Rat) / 12247399) [(0, 1), (2, 2), (13, 1), (15, 1)],
  term ((3655680 : Rat) / 12247399) [(0, 1), (3, 1), (5, 1), (13, 1), (15, 1)],
  term ((-1827840 : Rat) / 12247399) [(0, 1), (3, 2), (13, 1), (15, 1)],
  term ((-3655680 : Rat) / 12247399) [(0, 1), (4, 1), (10, 1), (13, 1), (15, 1)],
  term ((-3655680 : Rat) / 12247399) [(0, 1), (5, 1), (11, 1), (13, 1), (15, 1)],
  term ((1827840 : Rat) / 12247399) [(0, 1), (10, 2), (13, 1), (15, 1)],
  term ((1827840 : Rat) / 12247399) [(0, 1), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 14. -/
theorem rs_R009_ueqv_R009NNNYN_partial_14_0002_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_14_0002
        rs_R009_ueqv_R009NNNYN_generator_14_0000_0028 =
      rs_R009_ueqv_R009NNNYN_partial_14_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NNNYN_coefficient_14_0003 : Poly :=
[
  term ((35164160 : Rat) / 110226591) [(0, 1), (15, 2)]
]

/-- Partial product 3 for generator 14. -/
def rs_R009_ueqv_R009NNNYN_partial_14_0003 : Poly :=
[
  term ((-70328320 : Rat) / 110226591) [(0, 1), (2, 1), (4, 1), (15, 2)],
  term ((35164160 : Rat) / 110226591) [(0, 1), (2, 2), (15, 2)],
  term ((-70328320 : Rat) / 110226591) [(0, 1), (3, 1), (5, 1), (15, 2)],
  term ((35164160 : Rat) / 110226591) [(0, 1), (3, 2), (15, 2)],
  term ((70328320 : Rat) / 110226591) [(0, 1), (4, 1), (10, 1), (15, 2)],
  term ((70328320 : Rat) / 110226591) [(0, 1), (5, 1), (11, 1), (15, 2)],
  term ((-35164160 : Rat) / 110226591) [(0, 1), (10, 2), (15, 2)],
  term ((-35164160 : Rat) / 110226591) [(0, 1), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 14. -/
theorem rs_R009_ueqv_R009NNNYN_partial_14_0003_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_14_0003
        rs_R009_ueqv_R009NNNYN_generator_14_0000_0028 =
      rs_R009_ueqv_R009NNNYN_partial_14_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NNNYN_coefficient_14_0004 : Poly :=
[
  term ((-588 : Rat) / 67) [(1, 1), (9, 1)]
]

/-- Partial product 4 for generator 14. -/
def rs_R009_ueqv_R009NNNYN_partial_14_0004 : Poly :=
[
  term ((1176 : Rat) / 67) [(1, 1), (2, 1), (4, 1), (9, 1)],
  term ((-588 : Rat) / 67) [(1, 1), (2, 2), (9, 1)],
  term ((1176 : Rat) / 67) [(1, 1), (3, 1), (5, 1), (9, 1)],
  term ((-588 : Rat) / 67) [(1, 1), (3, 2), (9, 1)],
  term ((-1176 : Rat) / 67) [(1, 1), (4, 1), (9, 1), (10, 1)],
  term ((-1176 : Rat) / 67) [(1, 1), (5, 1), (9, 1), (11, 1)],
  term ((588 : Rat) / 67) [(1, 1), (9, 1), (10, 2)],
  term ((588 : Rat) / 67) [(1, 1), (9, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 14. -/
theorem rs_R009_ueqv_R009NNNYN_partial_14_0004_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_14_0004
        rs_R009_ueqv_R009NNNYN_generator_14_0000_0028 =
      rs_R009_ueqv_R009NNNYN_partial_14_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NNNYN_coefficient_14_0005 : Poly :=
[
  term ((-183849393728 : Rat) / 18848747061) [(1, 1), (11, 1)]
]

/-- Partial product 5 for generator 14. -/
def rs_R009_ueqv_R009NNNYN_partial_14_0005 : Poly :=
[
  term ((367698787456 : Rat) / 18848747061) [(1, 1), (2, 1), (4, 1), (11, 1)],
  term ((-183849393728 : Rat) / 18848747061) [(1, 1), (2, 2), (11, 1)],
  term ((367698787456 : Rat) / 18848747061) [(1, 1), (3, 1), (5, 1), (11, 1)],
  term ((-183849393728 : Rat) / 18848747061) [(1, 1), (3, 2), (11, 1)],
  term ((-367698787456 : Rat) / 18848747061) [(1, 1), (4, 1), (10, 1), (11, 1)],
  term ((-367698787456 : Rat) / 18848747061) [(1, 1), (5, 1), (11, 2)],
  term ((183849393728 : Rat) / 18848747061) [(1, 1), (10, 2), (11, 1)],
  term ((183849393728 : Rat) / 18848747061) [(1, 1), (11, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 14. -/
theorem rs_R009_ueqv_R009NNNYN_partial_14_0005_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_14_0005
        rs_R009_ueqv_R009NNNYN_generator_14_0000_0028 =
      rs_R009_ueqv_R009NNNYN_partial_14_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NNNYN_coefficient_14_0006 : Poly :=
[
  term ((-38993920 : Rat) / 110226591) [(1, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 6 for generator 14. -/
def rs_R009_ueqv_R009NNNYN_partial_14_0006 : Poly :=
[
  term ((77987840 : Rat) / 110226591) [(1, 1), (2, 1), (4, 1), (11, 1), (13, 1), (15, 1)],
  term ((-38993920 : Rat) / 110226591) [(1, 1), (2, 2), (11, 1), (13, 1), (15, 1)],
  term ((77987840 : Rat) / 110226591) [(1, 1), (3, 1), (5, 1), (11, 1), (13, 1), (15, 1)],
  term ((-38993920 : Rat) / 110226591) [(1, 1), (3, 2), (11, 1), (13, 1), (15, 1)],
  term ((-77987840 : Rat) / 110226591) [(1, 1), (4, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-77987840 : Rat) / 110226591) [(1, 1), (5, 1), (11, 2), (13, 1), (15, 1)],
  term ((38993920 : Rat) / 110226591) [(1, 1), (10, 2), (11, 1), (13, 1), (15, 1)],
  term ((38993920 : Rat) / 110226591) [(1, 1), (11, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 14. -/
theorem rs_R009_ueqv_R009NNNYN_partial_14_0006_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_14_0006
        rs_R009_ueqv_R009NNNYN_generator_14_0000_0028 =
      rs_R009_ueqv_R009NNNYN_partial_14_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NNNYN_coefficient_14_0007 : Poly :=
[
  term ((19496960 : Rat) / 36742197) [(1, 1), (11, 1), (15, 2)]
]

/-- Partial product 7 for generator 14. -/
def rs_R009_ueqv_R009NNNYN_partial_14_0007 : Poly :=
[
  term ((-38993920 : Rat) / 36742197) [(1, 1), (2, 1), (4, 1), (11, 1), (15, 2)],
  term ((19496960 : Rat) / 36742197) [(1, 1), (2, 2), (11, 1), (15, 2)],
  term ((-38993920 : Rat) / 36742197) [(1, 1), (3, 1), (5, 1), (11, 1), (15, 2)],
  term ((19496960 : Rat) / 36742197) [(1, 1), (3, 2), (11, 1), (15, 2)],
  term ((38993920 : Rat) / 36742197) [(1, 1), (4, 1), (10, 1), (11, 1), (15, 2)],
  term ((38993920 : Rat) / 36742197) [(1, 1), (5, 1), (11, 2), (15, 2)],
  term ((-19496960 : Rat) / 36742197) [(1, 1), (10, 2), (11, 1), (15, 2)],
  term ((-19496960 : Rat) / 36742197) [(1, 1), (11, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 14. -/
theorem rs_R009_ueqv_R009NNNYN_partial_14_0007_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_14_0007
        rs_R009_ueqv_R009NNNYN_generator_14_0000_0028 =
      rs_R009_ueqv_R009NNNYN_partial_14_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NNNYN_coefficient_14_0008 : Poly :=
[
  term ((-2872646777 : Rat) / 698101743) [(1, 1), (13, 1)]
]

/-- Partial product 8 for generator 14. -/
def rs_R009_ueqv_R009NNNYN_partial_14_0008 : Poly :=
[
  term ((5745293554 : Rat) / 698101743) [(1, 1), (2, 1), (4, 1), (13, 1)],
  term ((-2872646777 : Rat) / 698101743) [(1, 1), (2, 2), (13, 1)],
  term ((5745293554 : Rat) / 698101743) [(1, 1), (3, 1), (5, 1), (13, 1)],
  term ((-2872646777 : Rat) / 698101743) [(1, 1), (3, 2), (13, 1)],
  term ((-5745293554 : Rat) / 698101743) [(1, 1), (4, 1), (10, 1), (13, 1)],
  term ((-5745293554 : Rat) / 698101743) [(1, 1), (5, 1), (11, 1), (13, 1)],
  term ((2872646777 : Rat) / 698101743) [(1, 1), (10, 2), (13, 1)],
  term ((2872646777 : Rat) / 698101743) [(1, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 14. -/
theorem rs_R009_ueqv_R009NNNYN_partial_14_0008_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_14_0008
        rs_R009_ueqv_R009NNNYN_generator_14_0000_0028 =
      rs_R009_ueqv_R009NNNYN_partial_14_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NNNYN_coefficient_14_0009 : Poly :=
[
  term ((59840000 : Rat) / 110226591) [(1, 1), (13, 1), (15, 2)]
]

/-- Partial product 9 for generator 14. -/
def rs_R009_ueqv_R009NNNYN_partial_14_0009 : Poly :=
[
  term ((-119680000 : Rat) / 110226591) [(1, 1), (2, 1), (4, 1), (13, 1), (15, 2)],
  term ((59840000 : Rat) / 110226591) [(1, 1), (2, 2), (13, 1), (15, 2)],
  term ((-119680000 : Rat) / 110226591) [(1, 1), (3, 1), (5, 1), (13, 1), (15, 2)],
  term ((59840000 : Rat) / 110226591) [(1, 1), (3, 2), (13, 1), (15, 2)],
  term ((119680000 : Rat) / 110226591) [(1, 1), (4, 1), (10, 1), (13, 1), (15, 2)],
  term ((119680000 : Rat) / 110226591) [(1, 1), (5, 1), (11, 1), (13, 1), (15, 2)],
  term ((-59840000 : Rat) / 110226591) [(1, 1), (10, 2), (13, 1), (15, 2)],
  term ((-59840000 : Rat) / 110226591) [(1, 1), (11, 2), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 14. -/
theorem rs_R009_ueqv_R009NNNYN_partial_14_0009_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_14_0009
        rs_R009_ueqv_R009NNNYN_generator_14_0000_0028 =
      rs_R009_ueqv_R009NNNYN_partial_14_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NNNYN_coefficient_14_0010 : Poly :=
[
  term ((-1827840 : Rat) / 12247399) [(1, 1), (13, 2), (15, 1)]
]

/-- Partial product 10 for generator 14. -/
def rs_R009_ueqv_R009NNNYN_partial_14_0010 : Poly :=
[
  term ((3655680 : Rat) / 12247399) [(1, 1), (2, 1), (4, 1), (13, 2), (15, 1)],
  term ((-1827840 : Rat) / 12247399) [(1, 1), (2, 2), (13, 2), (15, 1)],
  term ((3655680 : Rat) / 12247399) [(1, 1), (3, 1), (5, 1), (13, 2), (15, 1)],
  term ((-1827840 : Rat) / 12247399) [(1, 1), (3, 2), (13, 2), (15, 1)],
  term ((-3655680 : Rat) / 12247399) [(1, 1), (4, 1), (10, 1), (13, 2), (15, 1)],
  term ((-3655680 : Rat) / 12247399) [(1, 1), (5, 1), (11, 1), (13, 2), (15, 1)],
  term ((1827840 : Rat) / 12247399) [(1, 1), (10, 2), (13, 2), (15, 1)],
  term ((1827840 : Rat) / 12247399) [(1, 1), (11, 2), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 14. -/
theorem rs_R009_ueqv_R009NNNYN_partial_14_0010_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_14_0010
        rs_R009_ueqv_R009NNNYN_generator_14_0000_0028 =
      rs_R009_ueqv_R009NNNYN_partial_14_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NNNYN_coefficient_14_0011 : Poly :=
[
  term ((110653138576 : Rat) / 18848747061) [(1, 1), (15, 1)]
]

/-- Partial product 11 for generator 14. -/
def rs_R009_ueqv_R009NNNYN_partial_14_0011 : Poly :=
[
  term ((-221306277152 : Rat) / 18848747061) [(1, 1), (2, 1), (4, 1), (15, 1)],
  term ((110653138576 : Rat) / 18848747061) [(1, 1), (2, 2), (15, 1)],
  term ((-221306277152 : Rat) / 18848747061) [(1, 1), (3, 1), (5, 1), (15, 1)],
  term ((110653138576 : Rat) / 18848747061) [(1, 1), (3, 2), (15, 1)],
  term ((221306277152 : Rat) / 18848747061) [(1, 1), (4, 1), (10, 1), (15, 1)],
  term ((221306277152 : Rat) / 18848747061) [(1, 1), (5, 1), (11, 1), (15, 1)],
  term ((-110653138576 : Rat) / 18848747061) [(1, 1), (10, 2), (15, 1)],
  term ((-110653138576 : Rat) / 18848747061) [(1, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 14. -/
theorem rs_R009_ueqv_R009NNNYN_partial_14_0011_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_14_0011
        rs_R009_ueqv_R009NNNYN_generator_14_0000_0028 =
      rs_R009_ueqv_R009NNNYN_partial_14_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NNNYN_coefficient_14_0012 : Poly :=
[
  term ((-17582080 : Rat) / 36742197) [(1, 1), (15, 3)]
]

/-- Partial product 12 for generator 14. -/
def rs_R009_ueqv_R009NNNYN_partial_14_0012 : Poly :=
[
  term ((35164160 : Rat) / 36742197) [(1, 1), (2, 1), (4, 1), (15, 3)],
  term ((-17582080 : Rat) / 36742197) [(1, 1), (2, 2), (15, 3)],
  term ((35164160 : Rat) / 36742197) [(1, 1), (3, 1), (5, 1), (15, 3)],
  term ((-17582080 : Rat) / 36742197) [(1, 1), (3, 2), (15, 3)],
  term ((-35164160 : Rat) / 36742197) [(1, 1), (4, 1), (10, 1), (15, 3)],
  term ((-35164160 : Rat) / 36742197) [(1, 1), (5, 1), (11, 1), (15, 3)],
  term ((17582080 : Rat) / 36742197) [(1, 1), (10, 2), (15, 3)],
  term ((17582080 : Rat) / 36742197) [(1, 1), (11, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 14. -/
theorem rs_R009_ueqv_R009NNNYN_partial_14_0012_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_14_0012
        rs_R009_ueqv_R009NNNYN_generator_14_0000_0028 =
      rs_R009_ueqv_R009NNNYN_partial_14_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NNNYN_coefficient_14_0013 : Poly :=
[
  term ((2455754 : Rat) / 110226591) [(9, 1), (11, 1)]
]

/-- Partial product 13 for generator 14. -/
def rs_R009_ueqv_R009NNNYN_partial_14_0013 : Poly :=
[
  term ((-4911508 : Rat) / 110226591) [(2, 1), (4, 1), (9, 1), (11, 1)],
  term ((2455754 : Rat) / 110226591) [(2, 2), (9, 1), (11, 1)],
  term ((-4911508 : Rat) / 110226591) [(3, 1), (5, 1), (9, 1), (11, 1)],
  term ((2455754 : Rat) / 110226591) [(3, 2), (9, 1), (11, 1)],
  term ((4911508 : Rat) / 110226591) [(4, 1), (9, 1), (10, 1), (11, 1)],
  term ((4911508 : Rat) / 110226591) [(5, 1), (9, 1), (11, 2)],
  term ((-2455754 : Rat) / 110226591) [(9, 1), (10, 2), (11, 1)],
  term ((-2455754 : Rat) / 110226591) [(9, 1), (11, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 14. -/
theorem rs_R009_ueqv_R009NNNYN_partial_14_0013_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_14_0013
        rs_R009_ueqv_R009NNNYN_generator_14_0000_0028 =
      rs_R009_ueqv_R009NNNYN_partial_14_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NNNYN_coefficient_14_0014 : Poly :=
[
  term ((-7442400 : Rat) / 12247399) [(9, 1), (13, 1)]
]

/-- Partial product 14 for generator 14. -/
def rs_R009_ueqv_R009NNNYN_partial_14_0014 : Poly :=
[
  term ((14884800 : Rat) / 12247399) [(2, 1), (4, 1), (9, 1), (13, 1)],
  term ((-7442400 : Rat) / 12247399) [(2, 2), (9, 1), (13, 1)],
  term ((14884800 : Rat) / 12247399) [(3, 1), (5, 1), (9, 1), (13, 1)],
  term ((-7442400 : Rat) / 12247399) [(3, 2), (9, 1), (13, 1)],
  term ((-14884800 : Rat) / 12247399) [(4, 1), (9, 1), (10, 1), (13, 1)],
  term ((-14884800 : Rat) / 12247399) [(5, 1), (9, 1), (11, 1), (13, 1)],
  term ((7442400 : Rat) / 12247399) [(9, 1), (10, 2), (13, 1)],
  term ((7442400 : Rat) / 12247399) [(9, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 14. -/
theorem rs_R009_ueqv_R009NNNYN_partial_14_0014_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_14_0014
        rs_R009_ueqv_R009NNNYN_generator_14_0000_0028 =
      rs_R009_ueqv_R009NNNYN_partial_14_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NNNYN_coefficient_14_0015 : Poly :=
[
  term ((143177600 : Rat) / 110226591) [(9, 1), (15, 1)]
]

/-- Partial product 15 for generator 14. -/
def rs_R009_ueqv_R009NNNYN_partial_14_0015 : Poly :=
[
  term ((-286355200 : Rat) / 110226591) [(2, 1), (4, 1), (9, 1), (15, 1)],
  term ((143177600 : Rat) / 110226591) [(2, 2), (9, 1), (15, 1)],
  term ((-286355200 : Rat) / 110226591) [(3, 1), (5, 1), (9, 1), (15, 1)],
  term ((143177600 : Rat) / 110226591) [(3, 2), (9, 1), (15, 1)],
  term ((286355200 : Rat) / 110226591) [(4, 1), (9, 1), (10, 1), (15, 1)],
  term ((286355200 : Rat) / 110226591) [(5, 1), (9, 1), (11, 1), (15, 1)],
  term ((-143177600 : Rat) / 110226591) [(9, 1), (10, 2), (15, 1)],
  term ((-143177600 : Rat) / 110226591) [(9, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 14. -/
theorem rs_R009_ueqv_R009NNNYN_partial_14_0015_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_14_0015
        rs_R009_ueqv_R009NNNYN_generator_14_0000_0028 =
      rs_R009_ueqv_R009NNNYN_partial_14_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NNNYN_coefficient_14_0016 : Poly :=
[
  term ((97484800 : Rat) / 110226591) [(11, 1), (12, 1), (15, 1)]
]

/-- Partial product 16 for generator 14. -/
def rs_R009_ueqv_R009NNNYN_partial_14_0016 : Poly :=
[
  term ((-194969600 : Rat) / 110226591) [(2, 1), (4, 1), (11, 1), (12, 1), (15, 1)],
  term ((97484800 : Rat) / 110226591) [(2, 2), (11, 1), (12, 1), (15, 1)],
  term ((-194969600 : Rat) / 110226591) [(3, 1), (5, 1), (11, 1), (12, 1), (15, 1)],
  term ((97484800 : Rat) / 110226591) [(3, 2), (11, 1), (12, 1), (15, 1)],
  term ((194969600 : Rat) / 110226591) [(4, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((194969600 : Rat) / 110226591) [(5, 1), (11, 2), (12, 1), (15, 1)],
  term ((-97484800 : Rat) / 110226591) [(10, 2), (11, 1), (12, 1), (15, 1)],
  term ((-97484800 : Rat) / 110226591) [(11, 3), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 14. -/
theorem rs_R009_ueqv_R009NNNYN_partial_14_0016_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_14_0016
        rs_R009_ueqv_R009NNNYN_generator_14_0000_0028 =
      rs_R009_ueqv_R009NNNYN_partial_14_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NNNYN_coefficient_14_0017 : Poly :=
[
  term ((-4188232524 : Rat) / 1163502905) [(11, 1), (13, 1)]
]

/-- Partial product 17 for generator 14. -/
def rs_R009_ueqv_R009NNNYN_partial_14_0017 : Poly :=
[
  term ((8376465048 : Rat) / 1163502905) [(2, 1), (4, 1), (11, 1), (13, 1)],
  term ((-4188232524 : Rat) / 1163502905) [(2, 2), (11, 1), (13, 1)],
  term ((8376465048 : Rat) / 1163502905) [(3, 1), (5, 1), (11, 1), (13, 1)],
  term ((-4188232524 : Rat) / 1163502905) [(3, 2), (11, 1), (13, 1)],
  term ((-8376465048 : Rat) / 1163502905) [(4, 1), (10, 1), (11, 1), (13, 1)],
  term ((-8376465048 : Rat) / 1163502905) [(5, 1), (11, 2), (13, 1)],
  term ((4188232524 : Rat) / 1163502905) [(10, 2), (11, 1), (13, 1)],
  term ((4188232524 : Rat) / 1163502905) [(11, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 14. -/
theorem rs_R009_ueqv_R009NNNYN_partial_14_0017_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_14_0017
        rs_R009_ueqv_R009NNNYN_generator_14_0000_0028 =
      rs_R009_ueqv_R009NNNYN_partial_14_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NNNYN_coefficient_14_0018 : Poly :=
[
  term ((9748480 : Rat) / 110226591) [(11, 1), (14, 1), (15, 1)]
]

/-- Partial product 18 for generator 14. -/
def rs_R009_ueqv_R009NNNYN_partial_14_0018 : Poly :=
[
  term ((-19496960 : Rat) / 110226591) [(2, 1), (4, 1), (11, 1), (14, 1), (15, 1)],
  term ((9748480 : Rat) / 110226591) [(2, 2), (11, 1), (14, 1), (15, 1)],
  term ((-19496960 : Rat) / 110226591) [(3, 1), (5, 1), (11, 1), (14, 1), (15, 1)],
  term ((9748480 : Rat) / 110226591) [(3, 2), (11, 1), (14, 1), (15, 1)],
  term ((19496960 : Rat) / 110226591) [(4, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((19496960 : Rat) / 110226591) [(5, 1), (11, 2), (14, 1), (15, 1)],
  term ((-9748480 : Rat) / 110226591) [(10, 2), (11, 1), (14, 1), (15, 1)],
  term ((-9748480 : Rat) / 110226591) [(11, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 14. -/
theorem rs_R009_ueqv_R009NNNYN_partial_14_0018_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_14_0018
        rs_R009_ueqv_R009NNNYN_generator_14_0000_0028 =
      rs_R009_ueqv_R009NNNYN_partial_14_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NNNYN_coefficient_14_0019 : Poly :=
[
  term ((3418249474 : Rat) / 468874305) [(11, 1), (15, 1)]
]

/-- Partial product 19 for generator 14. -/
def rs_R009_ueqv_R009NNNYN_partial_14_0019 : Poly :=
[
  term ((-6836498948 : Rat) / 468874305) [(2, 1), (4, 1), (11, 1), (15, 1)],
  term ((3418249474 : Rat) / 468874305) [(2, 2), (11, 1), (15, 1)],
  term ((-6836498948 : Rat) / 468874305) [(3, 1), (5, 1), (11, 1), (15, 1)],
  term ((3418249474 : Rat) / 468874305) [(3, 2), (11, 1), (15, 1)],
  term ((6836498948 : Rat) / 468874305) [(4, 1), (10, 1), (11, 1), (15, 1)],
  term ((6836498948 : Rat) / 468874305) [(5, 1), (11, 2), (15, 1)],
  term ((-3418249474 : Rat) / 468874305) [(10, 2), (11, 1), (15, 1)],
  term ((-3418249474 : Rat) / 468874305) [(11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 14. -/
theorem rs_R009_ueqv_R009NNNYN_partial_14_0019_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_14_0019
        rs_R009_ueqv_R009NNNYN_generator_14_0000_0028 =
      rs_R009_ueqv_R009NNNYN_partial_14_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NNNYN_coefficient_14_0020 : Poly :=
[
  term ((-89348960512 : Rat) / 10471526145) [(11, 2)]
]

/-- Partial product 20 for generator 14. -/
def rs_R009_ueqv_R009NNNYN_partial_14_0020 : Poly :=
[
  term ((178697921024 : Rat) / 10471526145) [(2, 1), (4, 1), (11, 2)],
  term ((-89348960512 : Rat) / 10471526145) [(2, 2), (11, 2)],
  term ((178697921024 : Rat) / 10471526145) [(3, 1), (5, 1), (11, 2)],
  term ((-89348960512 : Rat) / 10471526145) [(3, 2), (11, 2)],
  term ((-178697921024 : Rat) / 10471526145) [(4, 1), (10, 1), (11, 2)],
  term ((-178697921024 : Rat) / 10471526145) [(5, 1), (11, 3)],
  term ((89348960512 : Rat) / 10471526145) [(10, 2), (11, 2)],
  term ((89348960512 : Rat) / 10471526145) [(11, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 14. -/
theorem rs_R009_ueqv_R009NNNYN_partial_14_0020_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_14_0020
        rs_R009_ueqv_R009NNNYN_generator_14_0000_0028 =
      rs_R009_ueqv_R009NNNYN_partial_14_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NNNYN_coefficient_14_0021 : Poly :=
[
  term ((18 : Rat) / 67) [(12, 1)]
]

/-- Partial product 21 for generator 14. -/
def rs_R009_ueqv_R009NNNYN_partial_14_0021 : Poly :=
[
  term ((-36 : Rat) / 67) [(2, 1), (4, 1), (12, 1)],
  term ((18 : Rat) / 67) [(2, 2), (12, 1)],
  term ((-36 : Rat) / 67) [(3, 1), (5, 1), (12, 1)],
  term ((18 : Rat) / 67) [(3, 2), (12, 1)],
  term ((36 : Rat) / 67) [(4, 1), (10, 1), (12, 1)],
  term ((36 : Rat) / 67) [(5, 1), (11, 1), (12, 1)],
  term ((-18 : Rat) / 67) [(10, 2), (12, 1)],
  term ((-18 : Rat) / 67) [(11, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 14. -/
theorem rs_R009_ueqv_R009NNNYN_partial_14_0021_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_14_0021
        rs_R009_ueqv_R009NNNYN_generator_14_0000_0028 =
      rs_R009_ueqv_R009NNNYN_partial_14_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NNNYN_coefficient_14_0022 : Poly :=
[
  term ((4569600 : Rat) / 12247399) [(12, 1), (13, 1), (15, 1)]
]

/-- Partial product 22 for generator 14. -/
def rs_R009_ueqv_R009NNNYN_partial_14_0022 : Poly :=
[
  term ((-9139200 : Rat) / 12247399) [(2, 1), (4, 1), (12, 1), (13, 1), (15, 1)],
  term ((4569600 : Rat) / 12247399) [(2, 2), (12, 1), (13, 1), (15, 1)],
  term ((-9139200 : Rat) / 12247399) [(3, 1), (5, 1), (12, 1), (13, 1), (15, 1)],
  term ((4569600 : Rat) / 12247399) [(3, 2), (12, 1), (13, 1), (15, 1)],
  term ((9139200 : Rat) / 12247399) [(4, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((9139200 : Rat) / 12247399) [(5, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-4569600 : Rat) / 12247399) [(10, 2), (12, 1), (13, 1), (15, 1)],
  term ((-4569600 : Rat) / 12247399) [(11, 2), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 14. -/
theorem rs_R009_ueqv_R009NNNYN_partial_14_0022_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_14_0022
        rs_R009_ueqv_R009NNNYN_generator_14_0000_0028 =
      rs_R009_ueqv_R009NNNYN_partial_14_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NNNYN_coefficient_14_0023 : Poly :=
[
  term ((-87910400 : Rat) / 110226591) [(12, 1), (15, 2)]
]

/-- Partial product 23 for generator 14. -/
def rs_R009_ueqv_R009NNNYN_partial_14_0023 : Poly :=
[
  term ((175820800 : Rat) / 110226591) [(2, 1), (4, 1), (12, 1), (15, 2)],
  term ((-87910400 : Rat) / 110226591) [(2, 2), (12, 1), (15, 2)],
  term ((175820800 : Rat) / 110226591) [(3, 1), (5, 1), (12, 1), (15, 2)],
  term ((-87910400 : Rat) / 110226591) [(3, 2), (12, 1), (15, 2)],
  term ((-175820800 : Rat) / 110226591) [(4, 1), (10, 1), (12, 1), (15, 2)],
  term ((-175820800 : Rat) / 110226591) [(5, 1), (11, 1), (12, 1), (15, 2)],
  term ((87910400 : Rat) / 110226591) [(10, 2), (12, 1), (15, 2)],
  term ((87910400 : Rat) / 110226591) [(11, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 14. -/
theorem rs_R009_ueqv_R009NNNYN_partial_14_0023_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_14_0023
        rs_R009_ueqv_R009NNNYN_generator_14_0000_0028 =
      rs_R009_ueqv_R009NNNYN_partial_14_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NNNYN_coefficient_14_0024 : Poly :=
[
  term ((456960 : Rat) / 12247399) [(13, 1), (14, 1), (15, 1)]
]

/-- Partial product 24 for generator 14. -/
def rs_R009_ueqv_R009NNNYN_partial_14_0024 : Poly :=
[
  term ((-913920 : Rat) / 12247399) [(2, 1), (4, 1), (13, 1), (14, 1), (15, 1)],
  term ((456960 : Rat) / 12247399) [(2, 2), (13, 1), (14, 1), (15, 1)],
  term ((-913920 : Rat) / 12247399) [(3, 1), (5, 1), (13, 1), (14, 1), (15, 1)],
  term ((456960 : Rat) / 12247399) [(3, 2), (13, 1), (14, 1), (15, 1)],
  term ((913920 : Rat) / 12247399) [(4, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((913920 : Rat) / 12247399) [(5, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-456960 : Rat) / 12247399) [(10, 2), (13, 1), (14, 1), (15, 1)],
  term ((-456960 : Rat) / 12247399) [(11, 2), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 14. -/
theorem rs_R009_ueqv_R009NNNYN_partial_14_0024_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_14_0024
        rs_R009_ueqv_R009NNNYN_generator_14_0000_0028 =
      rs_R009_ueqv_R009NNNYN_partial_14_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NNNYN_coefficient_14_0025 : Poly :=
[
  term ((-4607680 : Rat) / 12247399) [(13, 1), (15, 1)]
]

/-- Partial product 25 for generator 14. -/
def rs_R009_ueqv_R009NNNYN_partial_14_0025 : Poly :=
[
  term ((9215360 : Rat) / 12247399) [(2, 1), (4, 1), (13, 1), (15, 1)],
  term ((-4607680 : Rat) / 12247399) [(2, 2), (13, 1), (15, 1)],
  term ((9215360 : Rat) / 12247399) [(3, 1), (5, 1), (13, 1), (15, 1)],
  term ((-4607680 : Rat) / 12247399) [(3, 2), (13, 1), (15, 1)],
  term ((-9215360 : Rat) / 12247399) [(4, 1), (10, 1), (13, 1), (15, 1)],
  term ((-9215360 : Rat) / 12247399) [(5, 1), (11, 1), (13, 1), (15, 1)],
  term ((4607680 : Rat) / 12247399) [(10, 2), (13, 1), (15, 1)],
  term ((4607680 : Rat) / 12247399) [(11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 14. -/
theorem rs_R009_ueqv_R009NNNYN_partial_14_0025_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_14_0025
        rs_R009_ueqv_R009NNNYN_generator_14_0000_0028 =
      rs_R009_ueqv_R009NNNYN_partial_14_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NNNYN_coefficient_14_0026 : Poly :=
[
  term ((-6 : Rat) / 67) [(14, 1)]
]

/-- Partial product 26 for generator 14. -/
def rs_R009_ueqv_R009NNNYN_partial_14_0026 : Poly :=
[
  term ((12 : Rat) / 67) [(2, 1), (4, 1), (14, 1)],
  term ((-6 : Rat) / 67) [(2, 2), (14, 1)],
  term ((12 : Rat) / 67) [(3, 1), (5, 1), (14, 1)],
  term ((-6 : Rat) / 67) [(3, 2), (14, 1)],
  term ((-12 : Rat) / 67) [(4, 1), (10, 1), (14, 1)],
  term ((-12 : Rat) / 67) [(5, 1), (11, 1), (14, 1)],
  term ((6 : Rat) / 67) [(10, 2), (14, 1)],
  term ((6 : Rat) / 67) [(11, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 14. -/
theorem rs_R009_ueqv_R009NNNYN_partial_14_0026_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_14_0026
        rs_R009_ueqv_R009NNNYN_generator_14_0000_0028 =
      rs_R009_ueqv_R009NNNYN_partial_14_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NNNYN_coefficient_14_0027 : Poly :=
[
  term ((-8791040 : Rat) / 110226591) [(14, 1), (15, 2)]
]

/-- Partial product 27 for generator 14. -/
def rs_R009_ueqv_R009NNNYN_partial_14_0027 : Poly :=
[
  term ((17582080 : Rat) / 110226591) [(2, 1), (4, 1), (14, 1), (15, 2)],
  term ((-8791040 : Rat) / 110226591) [(2, 2), (14, 1), (15, 2)],
  term ((17582080 : Rat) / 110226591) [(3, 1), (5, 1), (14, 1), (15, 2)],
  term ((-8791040 : Rat) / 110226591) [(3, 2), (14, 1), (15, 2)],
  term ((-17582080 : Rat) / 110226591) [(4, 1), (10, 1), (14, 1), (15, 2)],
  term ((-17582080 : Rat) / 110226591) [(5, 1), (11, 1), (14, 1), (15, 2)],
  term ((8791040 : Rat) / 110226591) [(10, 2), (14, 1), (15, 2)],
  term ((8791040 : Rat) / 110226591) [(11, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 14. -/
theorem rs_R009_ueqv_R009NNNYN_partial_14_0027_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_14_0027
        rs_R009_ueqv_R009NNNYN_generator_14_0000_0028 =
      rs_R009_ueqv_R009NNNYN_partial_14_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NNNYN_coefficient_14_0028 : Poly :=
[
  term ((1058902346 : Rat) / 330679773) [(15, 2)]
]

/-- Partial product 28 for generator 14. -/
def rs_R009_ueqv_R009NNNYN_partial_14_0028 : Poly :=
[
  term ((-2117804692 : Rat) / 330679773) [(2, 1), (4, 1), (15, 2)],
  term ((1058902346 : Rat) / 330679773) [(2, 2), (15, 2)],
  term ((-2117804692 : Rat) / 330679773) [(3, 1), (5, 1), (15, 2)],
  term ((1058902346 : Rat) / 330679773) [(3, 2), (15, 2)],
  term ((2117804692 : Rat) / 330679773) [(4, 1), (10, 1), (15, 2)],
  term ((2117804692 : Rat) / 330679773) [(5, 1), (11, 1), (15, 2)],
  term ((-1058902346 : Rat) / 330679773) [(10, 2), (15, 2)],
  term ((-1058902346 : Rat) / 330679773) [(11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 14. -/
theorem rs_R009_ueqv_R009NNNYN_partial_14_0028_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_14_0028
        rs_R009_ueqv_R009NNNYN_generator_14_0000_0028 =
      rs_R009_ueqv_R009NNNYN_partial_14_0028 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NNNYN_partials_14_0000_0028 : List Poly :=
[
  rs_R009_ueqv_R009NNNYN_partial_14_0000,
  rs_R009_ueqv_R009NNNYN_partial_14_0001,
  rs_R009_ueqv_R009NNNYN_partial_14_0002,
  rs_R009_ueqv_R009NNNYN_partial_14_0003,
  rs_R009_ueqv_R009NNNYN_partial_14_0004,
  rs_R009_ueqv_R009NNNYN_partial_14_0005,
  rs_R009_ueqv_R009NNNYN_partial_14_0006,
  rs_R009_ueqv_R009NNNYN_partial_14_0007,
  rs_R009_ueqv_R009NNNYN_partial_14_0008,
  rs_R009_ueqv_R009NNNYN_partial_14_0009,
  rs_R009_ueqv_R009NNNYN_partial_14_0010,
  rs_R009_ueqv_R009NNNYN_partial_14_0011,
  rs_R009_ueqv_R009NNNYN_partial_14_0012,
  rs_R009_ueqv_R009NNNYN_partial_14_0013,
  rs_R009_ueqv_R009NNNYN_partial_14_0014,
  rs_R009_ueqv_R009NNNYN_partial_14_0015,
  rs_R009_ueqv_R009NNNYN_partial_14_0016,
  rs_R009_ueqv_R009NNNYN_partial_14_0017,
  rs_R009_ueqv_R009NNNYN_partial_14_0018,
  rs_R009_ueqv_R009NNNYN_partial_14_0019,
  rs_R009_ueqv_R009NNNYN_partial_14_0020,
  rs_R009_ueqv_R009NNNYN_partial_14_0021,
  rs_R009_ueqv_R009NNNYN_partial_14_0022,
  rs_R009_ueqv_R009NNNYN_partial_14_0023,
  rs_R009_ueqv_R009NNNYN_partial_14_0024,
  rs_R009_ueqv_R009NNNYN_partial_14_0025,
  rs_R009_ueqv_R009NNNYN_partial_14_0026,
  rs_R009_ueqv_R009NNNYN_partial_14_0027,
  rs_R009_ueqv_R009NNNYN_partial_14_0028
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NNNYN_block_14_0000_0028 : Poly :=
[
  term ((77987840 : Rat) / 110226591) [(0, 1), (2, 1), (4, 1), (11, 1), (15, 1)],
  term ((3655680 : Rat) / 12247399) [(0, 1), (2, 1), (4, 1), (13, 1), (15, 1)],
  term ((-70328320 : Rat) / 110226591) [(0, 1), (2, 1), (4, 1), (15, 2)],
  term ((-38993920 : Rat) / 110226591) [(0, 1), (2, 2), (11, 1), (15, 1)],
  term ((-1827840 : Rat) / 12247399) [(0, 1), (2, 2), (13, 1), (15, 1)],
  term ((35164160 : Rat) / 110226591) [(0, 1), (2, 2), (15, 2)],
  term ((77987840 : Rat) / 110226591) [(0, 1), (3, 1), (5, 1), (11, 1), (15, 1)],
  term ((3655680 : Rat) / 12247399) [(0, 1), (3, 1), (5, 1), (13, 1), (15, 1)],
  term ((-70328320 : Rat) / 110226591) [(0, 1), (3, 1), (5, 1), (15, 2)],
  term ((-38993920 : Rat) / 110226591) [(0, 1), (3, 2), (11, 1), (15, 1)],
  term ((-1827840 : Rat) / 12247399) [(0, 1), (3, 2), (13, 1), (15, 1)],
  term ((35164160 : Rat) / 110226591) [(0, 1), (3, 2), (15, 2)],
  term ((-77987840 : Rat) / 110226591) [(0, 1), (4, 1), (10, 1), (11, 1), (15, 1)],
  term ((-3655680 : Rat) / 12247399) [(0, 1), (4, 1), (10, 1), (13, 1), (15, 1)],
  term ((70328320 : Rat) / 110226591) [(0, 1), (4, 1), (10, 1), (15, 2)],
  term ((-3655680 : Rat) / 12247399) [(0, 1), (5, 1), (11, 1), (13, 1), (15, 1)],
  term ((70328320 : Rat) / 110226591) [(0, 1), (5, 1), (11, 1), (15, 2)],
  term ((-77987840 : Rat) / 110226591) [(0, 1), (5, 1), (11, 2), (15, 1)],
  term ((38993920 : Rat) / 110226591) [(0, 1), (10, 2), (11, 1), (15, 1)],
  term ((1827840 : Rat) / 12247399) [(0, 1), (10, 2), (13, 1), (15, 1)],
  term ((-35164160 : Rat) / 110226591) [(0, 1), (10, 2), (15, 2)],
  term ((1827840 : Rat) / 12247399) [(0, 1), (11, 2), (13, 1), (15, 1)],
  term ((-35164160 : Rat) / 110226591) [(0, 1), (11, 2), (15, 2)],
  term ((38993920 : Rat) / 110226591) [(0, 1), (11, 3), (15, 1)],
  term ((1176 : Rat) / 67) [(1, 1), (2, 1), (4, 1), (9, 1)],
  term ((367698787456 : Rat) / 18848747061) [(1, 1), (2, 1), (4, 1), (11, 1)],
  term ((77987840 : Rat) / 110226591) [(1, 1), (2, 1), (4, 1), (11, 1), (13, 1), (15, 1)],
  term ((-38993920 : Rat) / 36742197) [(1, 1), (2, 1), (4, 1), (11, 1), (15, 2)],
  term ((5745293554 : Rat) / 698101743) [(1, 1), (2, 1), (4, 1), (13, 1)],
  term ((-119680000 : Rat) / 110226591) [(1, 1), (2, 1), (4, 1), (13, 1), (15, 2)],
  term ((3655680 : Rat) / 12247399) [(1, 1), (2, 1), (4, 1), (13, 2), (15, 1)],
  term ((-221306277152 : Rat) / 18848747061) [(1, 1), (2, 1), (4, 1), (15, 1)],
  term ((35164160 : Rat) / 36742197) [(1, 1), (2, 1), (4, 1), (15, 3)],
  term ((-588 : Rat) / 67) [(1, 1), (2, 2), (9, 1)],
  term ((-183849393728 : Rat) / 18848747061) [(1, 1), (2, 2), (11, 1)],
  term ((-38993920 : Rat) / 110226591) [(1, 1), (2, 2), (11, 1), (13, 1), (15, 1)],
  term ((19496960 : Rat) / 36742197) [(1, 1), (2, 2), (11, 1), (15, 2)],
  term ((-2872646777 : Rat) / 698101743) [(1, 1), (2, 2), (13, 1)],
  term ((59840000 : Rat) / 110226591) [(1, 1), (2, 2), (13, 1), (15, 2)],
  term ((-1827840 : Rat) / 12247399) [(1, 1), (2, 2), (13, 2), (15, 1)],
  term ((110653138576 : Rat) / 18848747061) [(1, 1), (2, 2), (15, 1)],
  term ((-17582080 : Rat) / 36742197) [(1, 1), (2, 2), (15, 3)],
  term ((1176 : Rat) / 67) [(1, 1), (3, 1), (5, 1), (9, 1)],
  term ((367698787456 : Rat) / 18848747061) [(1, 1), (3, 1), (5, 1), (11, 1)],
  term ((77987840 : Rat) / 110226591) [(1, 1), (3, 1), (5, 1), (11, 1), (13, 1), (15, 1)],
  term ((-38993920 : Rat) / 36742197) [(1, 1), (3, 1), (5, 1), (11, 1), (15, 2)],
  term ((5745293554 : Rat) / 698101743) [(1, 1), (3, 1), (5, 1), (13, 1)],
  term ((-119680000 : Rat) / 110226591) [(1, 1), (3, 1), (5, 1), (13, 1), (15, 2)],
  term ((3655680 : Rat) / 12247399) [(1, 1), (3, 1), (5, 1), (13, 2), (15, 1)],
  term ((-221306277152 : Rat) / 18848747061) [(1, 1), (3, 1), (5, 1), (15, 1)],
  term ((35164160 : Rat) / 36742197) [(1, 1), (3, 1), (5, 1), (15, 3)],
  term ((-588 : Rat) / 67) [(1, 1), (3, 2), (9, 1)],
  term ((-183849393728 : Rat) / 18848747061) [(1, 1), (3, 2), (11, 1)],
  term ((-38993920 : Rat) / 110226591) [(1, 1), (3, 2), (11, 1), (13, 1), (15, 1)],
  term ((19496960 : Rat) / 36742197) [(1, 1), (3, 2), (11, 1), (15, 2)],
  term ((-2872646777 : Rat) / 698101743) [(1, 1), (3, 2), (13, 1)],
  term ((59840000 : Rat) / 110226591) [(1, 1), (3, 2), (13, 1), (15, 2)],
  term ((-1827840 : Rat) / 12247399) [(1, 1), (3, 2), (13, 2), (15, 1)],
  term ((110653138576 : Rat) / 18848747061) [(1, 1), (3, 2), (15, 1)],
  term ((-17582080 : Rat) / 36742197) [(1, 1), (3, 2), (15, 3)],
  term ((-1176 : Rat) / 67) [(1, 1), (4, 1), (9, 1), (10, 1)],
  term ((-367698787456 : Rat) / 18848747061) [(1, 1), (4, 1), (10, 1), (11, 1)],
  term ((-77987840 : Rat) / 110226591) [(1, 1), (4, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((38993920 : Rat) / 36742197) [(1, 1), (4, 1), (10, 1), (11, 1), (15, 2)],
  term ((-5745293554 : Rat) / 698101743) [(1, 1), (4, 1), (10, 1), (13, 1)],
  term ((119680000 : Rat) / 110226591) [(1, 1), (4, 1), (10, 1), (13, 1), (15, 2)],
  term ((-3655680 : Rat) / 12247399) [(1, 1), (4, 1), (10, 1), (13, 2), (15, 1)],
  term ((221306277152 : Rat) / 18848747061) [(1, 1), (4, 1), (10, 1), (15, 1)],
  term ((-35164160 : Rat) / 36742197) [(1, 1), (4, 1), (10, 1), (15, 3)],
  term ((-1176 : Rat) / 67) [(1, 1), (5, 1), (9, 1), (11, 1)],
  term ((-5745293554 : Rat) / 698101743) [(1, 1), (5, 1), (11, 1), (13, 1)],
  term ((119680000 : Rat) / 110226591) [(1, 1), (5, 1), (11, 1), (13, 1), (15, 2)],
  term ((-3655680 : Rat) / 12247399) [(1, 1), (5, 1), (11, 1), (13, 2), (15, 1)],
  term ((221306277152 : Rat) / 18848747061) [(1, 1), (5, 1), (11, 1), (15, 1)],
  term ((-35164160 : Rat) / 36742197) [(1, 1), (5, 1), (11, 1), (15, 3)],
  term ((-367698787456 : Rat) / 18848747061) [(1, 1), (5, 1), (11, 2)],
  term ((-77987840 : Rat) / 110226591) [(1, 1), (5, 1), (11, 2), (13, 1), (15, 1)],
  term ((38993920 : Rat) / 36742197) [(1, 1), (5, 1), (11, 2), (15, 2)],
  term ((588 : Rat) / 67) [(1, 1), (9, 1), (10, 2)],
  term ((588 : Rat) / 67) [(1, 1), (9, 1), (11, 2)],
  term ((183849393728 : Rat) / 18848747061) [(1, 1), (10, 2), (11, 1)],
  term ((38993920 : Rat) / 110226591) [(1, 1), (10, 2), (11, 1), (13, 1), (15, 1)],
  term ((-19496960 : Rat) / 36742197) [(1, 1), (10, 2), (11, 1), (15, 2)],
  term ((2872646777 : Rat) / 698101743) [(1, 1), (10, 2), (13, 1)],
  term ((-59840000 : Rat) / 110226591) [(1, 1), (10, 2), (13, 1), (15, 2)],
  term ((1827840 : Rat) / 12247399) [(1, 1), (10, 2), (13, 2), (15, 1)],
  term ((-110653138576 : Rat) / 18848747061) [(1, 1), (10, 2), (15, 1)],
  term ((17582080 : Rat) / 36742197) [(1, 1), (10, 2), (15, 3)],
  term ((2872646777 : Rat) / 698101743) [(1, 1), (11, 2), (13, 1)],
  term ((-59840000 : Rat) / 110226591) [(1, 1), (11, 2), (13, 1), (15, 2)],
  term ((1827840 : Rat) / 12247399) [(1, 1), (11, 2), (13, 2), (15, 1)],
  term ((-110653138576 : Rat) / 18848747061) [(1, 1), (11, 2), (15, 1)],
  term ((17582080 : Rat) / 36742197) [(1, 1), (11, 2), (15, 3)],
  term ((183849393728 : Rat) / 18848747061) [(1, 1), (11, 3)],
  term ((38993920 : Rat) / 110226591) [(1, 1), (11, 3), (13, 1), (15, 1)],
  term ((-19496960 : Rat) / 36742197) [(1, 1), (11, 3), (15, 2)],
  term ((-235 : Rat) / 67) [(2, 1), (4, 1)],
  term ((-4911508 : Rat) / 110226591) [(2, 1), (4, 1), (9, 1), (11, 1)],
  term ((14884800 : Rat) / 12247399) [(2, 1), (4, 1), (9, 1), (13, 1)],
  term ((-286355200 : Rat) / 110226591) [(2, 1), (4, 1), (9, 1), (15, 1)],
  term ((-194969600 : Rat) / 110226591) [(2, 1), (4, 1), (11, 1), (12, 1), (15, 1)],
  term ((8376465048 : Rat) / 1163502905) [(2, 1), (4, 1), (11, 1), (13, 1)],
  term ((-19496960 : Rat) / 110226591) [(2, 1), (4, 1), (11, 1), (14, 1), (15, 1)],
  term ((-6836498948 : Rat) / 468874305) [(2, 1), (4, 1), (11, 1), (15, 1)],
  term ((178697921024 : Rat) / 10471526145) [(2, 1), (4, 1), (11, 2)],
  term ((-36 : Rat) / 67) [(2, 1), (4, 1), (12, 1)],
  term ((-9139200 : Rat) / 12247399) [(2, 1), (4, 1), (12, 1), (13, 1), (15, 1)],
  term ((175820800 : Rat) / 110226591) [(2, 1), (4, 1), (12, 1), (15, 2)],
  term ((-913920 : Rat) / 12247399) [(2, 1), (4, 1), (13, 1), (14, 1), (15, 1)],
  term ((9215360 : Rat) / 12247399) [(2, 1), (4, 1), (13, 1), (15, 1)],
  term ((12 : Rat) / 67) [(2, 1), (4, 1), (14, 1)],
  term ((17582080 : Rat) / 110226591) [(2, 1), (4, 1), (14, 1), (15, 2)],
  term ((-2117804692 : Rat) / 330679773) [(2, 1), (4, 1), (15, 2)],
  term ((235 : Rat) / 134) [(2, 2)],
  term ((2455754 : Rat) / 110226591) [(2, 2), (9, 1), (11, 1)],
  term ((-7442400 : Rat) / 12247399) [(2, 2), (9, 1), (13, 1)],
  term ((143177600 : Rat) / 110226591) [(2, 2), (9, 1), (15, 1)],
  term ((97484800 : Rat) / 110226591) [(2, 2), (11, 1), (12, 1), (15, 1)],
  term ((-4188232524 : Rat) / 1163502905) [(2, 2), (11, 1), (13, 1)],
  term ((9748480 : Rat) / 110226591) [(2, 2), (11, 1), (14, 1), (15, 1)],
  term ((3418249474 : Rat) / 468874305) [(2, 2), (11, 1), (15, 1)],
  term ((-89348960512 : Rat) / 10471526145) [(2, 2), (11, 2)],
  term ((18 : Rat) / 67) [(2, 2), (12, 1)],
  term ((4569600 : Rat) / 12247399) [(2, 2), (12, 1), (13, 1), (15, 1)],
  term ((-87910400 : Rat) / 110226591) [(2, 2), (12, 1), (15, 2)],
  term ((456960 : Rat) / 12247399) [(2, 2), (13, 1), (14, 1), (15, 1)],
  term ((-4607680 : Rat) / 12247399) [(2, 2), (13, 1), (15, 1)],
  term ((-6 : Rat) / 67) [(2, 2), (14, 1)],
  term ((-8791040 : Rat) / 110226591) [(2, 2), (14, 1), (15, 2)],
  term ((1058902346 : Rat) / 330679773) [(2, 2), (15, 2)],
  term ((-235 : Rat) / 67) [(3, 1), (5, 1)],
  term ((-4911508 : Rat) / 110226591) [(3, 1), (5, 1), (9, 1), (11, 1)],
  term ((14884800 : Rat) / 12247399) [(3, 1), (5, 1), (9, 1), (13, 1)],
  term ((-286355200 : Rat) / 110226591) [(3, 1), (5, 1), (9, 1), (15, 1)],
  term ((-194969600 : Rat) / 110226591) [(3, 1), (5, 1), (11, 1), (12, 1), (15, 1)],
  term ((8376465048 : Rat) / 1163502905) [(3, 1), (5, 1), (11, 1), (13, 1)],
  term ((-19496960 : Rat) / 110226591) [(3, 1), (5, 1), (11, 1), (14, 1), (15, 1)],
  term ((-6836498948 : Rat) / 468874305) [(3, 1), (5, 1), (11, 1), (15, 1)],
  term ((178697921024 : Rat) / 10471526145) [(3, 1), (5, 1), (11, 2)],
  term ((-36 : Rat) / 67) [(3, 1), (5, 1), (12, 1)],
  term ((-9139200 : Rat) / 12247399) [(3, 1), (5, 1), (12, 1), (13, 1), (15, 1)],
  term ((175820800 : Rat) / 110226591) [(3, 1), (5, 1), (12, 1), (15, 2)],
  term ((-913920 : Rat) / 12247399) [(3, 1), (5, 1), (13, 1), (14, 1), (15, 1)],
  term ((9215360 : Rat) / 12247399) [(3, 1), (5, 1), (13, 1), (15, 1)],
  term ((12 : Rat) / 67) [(3, 1), (5, 1), (14, 1)],
  term ((17582080 : Rat) / 110226591) [(3, 1), (5, 1), (14, 1), (15, 2)],
  term ((-2117804692 : Rat) / 330679773) [(3, 1), (5, 1), (15, 2)],
  term ((235 : Rat) / 134) [(3, 2)],
  term ((2455754 : Rat) / 110226591) [(3, 2), (9, 1), (11, 1)],
  term ((-7442400 : Rat) / 12247399) [(3, 2), (9, 1), (13, 1)],
  term ((143177600 : Rat) / 110226591) [(3, 2), (9, 1), (15, 1)],
  term ((97484800 : Rat) / 110226591) [(3, 2), (11, 1), (12, 1), (15, 1)],
  term ((-4188232524 : Rat) / 1163502905) [(3, 2), (11, 1), (13, 1)],
  term ((9748480 : Rat) / 110226591) [(3, 2), (11, 1), (14, 1), (15, 1)],
  term ((3418249474 : Rat) / 468874305) [(3, 2), (11, 1), (15, 1)],
  term ((-89348960512 : Rat) / 10471526145) [(3, 2), (11, 2)],
  term ((18 : Rat) / 67) [(3, 2), (12, 1)],
  term ((4569600 : Rat) / 12247399) [(3, 2), (12, 1), (13, 1), (15, 1)],
  term ((-87910400 : Rat) / 110226591) [(3, 2), (12, 1), (15, 2)],
  term ((456960 : Rat) / 12247399) [(3, 2), (13, 1), (14, 1), (15, 1)],
  term ((-4607680 : Rat) / 12247399) [(3, 2), (13, 1), (15, 1)],
  term ((-6 : Rat) / 67) [(3, 2), (14, 1)],
  term ((-8791040 : Rat) / 110226591) [(3, 2), (14, 1), (15, 2)],
  term ((1058902346 : Rat) / 330679773) [(3, 2), (15, 2)],
  term ((4911508 : Rat) / 110226591) [(4, 1), (9, 1), (10, 1), (11, 1)],
  term ((-14884800 : Rat) / 12247399) [(4, 1), (9, 1), (10, 1), (13, 1)],
  term ((286355200 : Rat) / 110226591) [(4, 1), (9, 1), (10, 1), (15, 1)],
  term ((235 : Rat) / 67) [(4, 1), (10, 1)],
  term ((194969600 : Rat) / 110226591) [(4, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-8376465048 : Rat) / 1163502905) [(4, 1), (10, 1), (11, 1), (13, 1)],
  term ((19496960 : Rat) / 110226591) [(4, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((6836498948 : Rat) / 468874305) [(4, 1), (10, 1), (11, 1), (15, 1)],
  term ((-178697921024 : Rat) / 10471526145) [(4, 1), (10, 1), (11, 2)],
  term ((36 : Rat) / 67) [(4, 1), (10, 1), (12, 1)],
  term ((9139200 : Rat) / 12247399) [(4, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-175820800 : Rat) / 110226591) [(4, 1), (10, 1), (12, 1), (15, 2)],
  term ((913920 : Rat) / 12247399) [(4, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-9215360 : Rat) / 12247399) [(4, 1), (10, 1), (13, 1), (15, 1)],
  term ((-12 : Rat) / 67) [(4, 1), (10, 1), (14, 1)],
  term ((-17582080 : Rat) / 110226591) [(4, 1), (10, 1), (14, 1), (15, 2)],
  term ((2117804692 : Rat) / 330679773) [(4, 1), (10, 1), (15, 2)],
  term ((-14884800 : Rat) / 12247399) [(5, 1), (9, 1), (11, 1), (13, 1)],
  term ((286355200 : Rat) / 110226591) [(5, 1), (9, 1), (11, 1), (15, 1)],
  term ((4911508 : Rat) / 110226591) [(5, 1), (9, 1), (11, 2)],
  term ((235 : Rat) / 67) [(5, 1), (11, 1)],
  term ((36 : Rat) / 67) [(5, 1), (11, 1), (12, 1)],
  term ((9139200 : Rat) / 12247399) [(5, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-175820800 : Rat) / 110226591) [(5, 1), (11, 1), (12, 1), (15, 2)],
  term ((913920 : Rat) / 12247399) [(5, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-9215360 : Rat) / 12247399) [(5, 1), (11, 1), (13, 1), (15, 1)],
  term ((-12 : Rat) / 67) [(5, 1), (11, 1), (14, 1)],
  term ((-17582080 : Rat) / 110226591) [(5, 1), (11, 1), (14, 1), (15, 2)],
  term ((2117804692 : Rat) / 330679773) [(5, 1), (11, 1), (15, 2)],
  term ((194969600 : Rat) / 110226591) [(5, 1), (11, 2), (12, 1), (15, 1)],
  term ((-8376465048 : Rat) / 1163502905) [(5, 1), (11, 2), (13, 1)],
  term ((19496960 : Rat) / 110226591) [(5, 1), (11, 2), (14, 1), (15, 1)],
  term ((6836498948 : Rat) / 468874305) [(5, 1), (11, 2), (15, 1)],
  term ((-178697921024 : Rat) / 10471526145) [(5, 1), (11, 3)],
  term ((-2455754 : Rat) / 110226591) [(9, 1), (10, 2), (11, 1)],
  term ((7442400 : Rat) / 12247399) [(9, 1), (10, 2), (13, 1)],
  term ((-143177600 : Rat) / 110226591) [(9, 1), (10, 2), (15, 1)],
  term ((7442400 : Rat) / 12247399) [(9, 1), (11, 2), (13, 1)],
  term ((-143177600 : Rat) / 110226591) [(9, 1), (11, 2), (15, 1)],
  term ((-2455754 : Rat) / 110226591) [(9, 1), (11, 3)],
  term ((-235 : Rat) / 134) [(10, 2)],
  term ((-97484800 : Rat) / 110226591) [(10, 2), (11, 1), (12, 1), (15, 1)],
  term ((4188232524 : Rat) / 1163502905) [(10, 2), (11, 1), (13, 1)],
  term ((-9748480 : Rat) / 110226591) [(10, 2), (11, 1), (14, 1), (15, 1)],
  term ((-3418249474 : Rat) / 468874305) [(10, 2), (11, 1), (15, 1)],
  term ((89348960512 : Rat) / 10471526145) [(10, 2), (11, 2)],
  term ((-18 : Rat) / 67) [(10, 2), (12, 1)],
  term ((-4569600 : Rat) / 12247399) [(10, 2), (12, 1), (13, 1), (15, 1)],
  term ((87910400 : Rat) / 110226591) [(10, 2), (12, 1), (15, 2)],
  term ((-456960 : Rat) / 12247399) [(10, 2), (13, 1), (14, 1), (15, 1)],
  term ((4607680 : Rat) / 12247399) [(10, 2), (13, 1), (15, 1)],
  term ((6 : Rat) / 67) [(10, 2), (14, 1)],
  term ((8791040 : Rat) / 110226591) [(10, 2), (14, 1), (15, 2)],
  term ((-1058902346 : Rat) / 330679773) [(10, 2), (15, 2)],
  term ((-235 : Rat) / 134) [(11, 2)],
  term ((-18 : Rat) / 67) [(11, 2), (12, 1)],
  term ((-4569600 : Rat) / 12247399) [(11, 2), (12, 1), (13, 1), (15, 1)],
  term ((87910400 : Rat) / 110226591) [(11, 2), (12, 1), (15, 2)],
  term ((-456960 : Rat) / 12247399) [(11, 2), (13, 1), (14, 1), (15, 1)],
  term ((4607680 : Rat) / 12247399) [(11, 2), (13, 1), (15, 1)],
  term ((6 : Rat) / 67) [(11, 2), (14, 1)],
  term ((8791040 : Rat) / 110226591) [(11, 2), (14, 1), (15, 2)],
  term ((-1058902346 : Rat) / 330679773) [(11, 2), (15, 2)],
  term ((-97484800 : Rat) / 110226591) [(11, 3), (12, 1), (15, 1)],
  term ((4188232524 : Rat) / 1163502905) [(11, 3), (13, 1)],
  term ((-9748480 : Rat) / 110226591) [(11, 3), (14, 1), (15, 1)],
  term ((-3418249474 : Rat) / 468874305) [(11, 3), (15, 1)],
  term ((89348960512 : Rat) / 10471526145) [(11, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 14, terms 0 through 28. -/
theorem rs_R009_ueqv_R009NNNYN_block_14_0000_0028_valid :
    checkProductSumEq rs_R009_ueqv_R009NNNYN_partials_14_0000_0028
      rs_R009_ueqv_R009NNNYN_block_14_0000_0028 = true := by
  native_decide

end R009UeqvR009NNNYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
