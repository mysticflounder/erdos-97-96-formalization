/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NNNYN, term block 28:0-51

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NNNYNTermShards

/-- Generator polynomial 28 for relaxed split surplus certificate `R009:u=v:R009NNNYN`. -/
def rs_R009_ueqv_R009NNNYN_generator_28_0000_0051 : Poly :=
[
  term (1 : Rat) [],
  term (2 : Rat) [(2, 1), (14, 1)],
  term (-1 : Rat) [(2, 2)],
  term (2 : Rat) [(3, 1), (15, 1)],
  term (-1 : Rat) [(3, 2)],
  term (-2 : Rat) [(14, 1)]
]

/-- Coefficient term 0 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NNNYN_coefficient_28_0000 : Poly :=
[
  term ((902030080 : Rat) / 330679773) [(0, 1), (3, 1), (11, 1)]
]

/-- Partial product 0 for generator 28. -/
def rs_R009_ueqv_R009NNNYN_partial_28_0000 : Poly :=
[
  term ((1804060160 : Rat) / 330679773) [(0, 1), (2, 1), (3, 1), (11, 1), (14, 1)],
  term ((-902030080 : Rat) / 330679773) [(0, 1), (2, 2), (3, 1), (11, 1)],
  term ((902030080 : Rat) / 330679773) [(0, 1), (3, 1), (11, 1)],
  term ((-1804060160 : Rat) / 330679773) [(0, 1), (3, 1), (11, 1), (14, 1)],
  term ((1804060160 : Rat) / 330679773) [(0, 1), (3, 2), (11, 1), (15, 1)],
  term ((-902030080 : Rat) / 330679773) [(0, 1), (3, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 28. -/
theorem rs_R009_ueqv_R009NNNYN_partial_28_0000_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_28_0000
        rs_R009_ueqv_R009NNNYN_generator_28_0000_0051 =
      rs_R009_ueqv_R009NNNYN_partial_28_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NNNYN_coefficient_28_0001 : Poly :=
[
  term ((14094220 : Rat) / 12247399) [(0, 1), (3, 1), (13, 1)]
]

/-- Partial product 1 for generator 28. -/
def rs_R009_ueqv_R009NNNYN_partial_28_0001 : Poly :=
[
  term ((28188440 : Rat) / 12247399) [(0, 1), (2, 1), (3, 1), (13, 1), (14, 1)],
  term ((-14094220 : Rat) / 12247399) [(0, 1), (2, 2), (3, 1), (13, 1)],
  term ((14094220 : Rat) / 12247399) [(0, 1), (3, 1), (13, 1)],
  term ((-28188440 : Rat) / 12247399) [(0, 1), (3, 1), (13, 1), (14, 1)],
  term ((28188440 : Rat) / 12247399) [(0, 1), (3, 2), (13, 1), (15, 1)],
  term ((-14094220 : Rat) / 12247399) [(0, 1), (3, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 28. -/
theorem rs_R009_ueqv_R009NNNYN_partial_28_0001_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_28_0001
        rs_R009_ueqv_R009NNNYN_generator_28_0000_0051 =
      rs_R009_ueqv_R009NNNYN_partial_28_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NNNYN_coefficient_28_0002 : Poly :=
[
  term ((-813437840 : Rat) / 330679773) [(0, 1), (3, 1), (15, 1)]
]

/-- Partial product 2 for generator 28. -/
def rs_R009_ueqv_R009NNNYN_partial_28_0002 : Poly :=
[
  term ((-1626875680 : Rat) / 330679773) [(0, 1), (2, 1), (3, 1), (14, 1), (15, 1)],
  term ((813437840 : Rat) / 330679773) [(0, 1), (2, 2), (3, 1), (15, 1)],
  term ((1626875680 : Rat) / 330679773) [(0, 1), (3, 1), (14, 1), (15, 1)],
  term ((-813437840 : Rat) / 330679773) [(0, 1), (3, 1), (15, 1)],
  term ((-1626875680 : Rat) / 330679773) [(0, 1), (3, 2), (15, 2)],
  term ((813437840 : Rat) / 330679773) [(0, 1), (3, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 28. -/
theorem rs_R009_ueqv_R009NNNYN_partial_28_0002_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_28_0002
        rs_R009_ueqv_R009NNNYN_generator_28_0000_0051 =
      rs_R009_ueqv_R009NNNYN_partial_28_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NNNYN_coefficient_28_0003 : Poly :=
[
  term ((-341205760 : Rat) / 330679773) [(0, 1), (5, 1), (11, 1)]
]

/-- Partial product 3 for generator 28. -/
def rs_R009_ueqv_R009NNNYN_partial_28_0003 : Poly :=
[
  term ((-682411520 : Rat) / 330679773) [(0, 1), (2, 1), (5, 1), (11, 1), (14, 1)],
  term ((341205760 : Rat) / 330679773) [(0, 1), (2, 2), (5, 1), (11, 1)],
  term ((-682411520 : Rat) / 330679773) [(0, 1), (3, 1), (5, 1), (11, 1), (15, 1)],
  term ((341205760 : Rat) / 330679773) [(0, 1), (3, 2), (5, 1), (11, 1)],
  term ((-341205760 : Rat) / 330679773) [(0, 1), (5, 1), (11, 1)],
  term ((682411520 : Rat) / 330679773) [(0, 1), (5, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 28. -/
theorem rs_R009_ueqv_R009NNNYN_partial_28_0003_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_28_0003
        rs_R009_ueqv_R009NNNYN_generator_28_0000_0051 =
      rs_R009_ueqv_R009NNNYN_partial_28_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NNNYN_coefficient_28_0004 : Poly :=
[
  term ((-5331340 : Rat) / 12247399) [(0, 1), (5, 1), (13, 1)]
]

/-- Partial product 4 for generator 28. -/
def rs_R009_ueqv_R009NNNYN_partial_28_0004 : Poly :=
[
  term ((-10662680 : Rat) / 12247399) [(0, 1), (2, 1), (5, 1), (13, 1), (14, 1)],
  term ((5331340 : Rat) / 12247399) [(0, 1), (2, 2), (5, 1), (13, 1)],
  term ((-10662680 : Rat) / 12247399) [(0, 1), (3, 1), (5, 1), (13, 1), (15, 1)],
  term ((5331340 : Rat) / 12247399) [(0, 1), (3, 2), (5, 1), (13, 1)],
  term ((-5331340 : Rat) / 12247399) [(0, 1), (5, 1), (13, 1)],
  term ((10662680 : Rat) / 12247399) [(0, 1), (5, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 28. -/
theorem rs_R009_ueqv_R009NNNYN_partial_28_0004_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_28_0004
        rs_R009_ueqv_R009NNNYN_generator_28_0000_0051 =
      rs_R009_ueqv_R009NNNYN_partial_28_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NNNYN_coefficient_28_0005 : Poly :=
[
  term ((307694480 : Rat) / 330679773) [(0, 1), (5, 1), (15, 1)]
]

/-- Partial product 5 for generator 28. -/
def rs_R009_ueqv_R009NNNYN_partial_28_0005 : Poly :=
[
  term ((615388960 : Rat) / 330679773) [(0, 1), (2, 1), (5, 1), (14, 1), (15, 1)],
  term ((-307694480 : Rat) / 330679773) [(0, 1), (2, 2), (5, 1), (15, 1)],
  term ((615388960 : Rat) / 330679773) [(0, 1), (3, 1), (5, 1), (15, 2)],
  term ((-307694480 : Rat) / 330679773) [(0, 1), (3, 2), (5, 1), (15, 1)],
  term ((-615388960 : Rat) / 330679773) [(0, 1), (5, 1), (14, 1), (15, 1)],
  term ((307694480 : Rat) / 330679773) [(0, 1), (5, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 28. -/
theorem rs_R009_ueqv_R009NNNYN_partial_28_0005_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_28_0005
        rs_R009_ueqv_R009NNNYN_generator_28_0000_0051 =
      rs_R009_ueqv_R009NNNYN_partial_28_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NNNYN_coefficient_28_0006 : Poly :=
[
  term ((2497600000 : Rat) / 110226591) [(0, 1), (7, 1), (11, 1)]
]

/-- Partial product 6 for generator 28. -/
def rs_R009_ueqv_R009NNNYN_partial_28_0006 : Poly :=
[
  term ((4995200000 : Rat) / 110226591) [(0, 1), (2, 1), (7, 1), (11, 1), (14, 1)],
  term ((-2497600000 : Rat) / 110226591) [(0, 1), (2, 2), (7, 1), (11, 1)],
  term ((4995200000 : Rat) / 110226591) [(0, 1), (3, 1), (7, 1), (11, 1), (15, 1)],
  term ((-2497600000 : Rat) / 110226591) [(0, 1), (3, 2), (7, 1), (11, 1)],
  term ((2497600000 : Rat) / 110226591) [(0, 1), (7, 1), (11, 1)],
  term ((-4995200000 : Rat) / 110226591) [(0, 1), (7, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 28. -/
theorem rs_R009_ueqv_R009NNNYN_partial_28_0006_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_28_0006
        rs_R009_ueqv_R009NNNYN_generator_28_0000_0051 =
      rs_R009_ueqv_R009NNNYN_partial_28_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NNNYN_coefficient_28_0007 : Poly :=
[
  term ((117075000 : Rat) / 12247399) [(0, 1), (7, 1), (13, 1)]
]

/-- Partial product 7 for generator 28. -/
def rs_R009_ueqv_R009NNNYN_partial_28_0007 : Poly :=
[
  term ((234150000 : Rat) / 12247399) [(0, 1), (2, 1), (7, 1), (13, 1), (14, 1)],
  term ((-117075000 : Rat) / 12247399) [(0, 1), (2, 2), (7, 1), (13, 1)],
  term ((234150000 : Rat) / 12247399) [(0, 1), (3, 1), (7, 1), (13, 1), (15, 1)],
  term ((-117075000 : Rat) / 12247399) [(0, 1), (3, 2), (7, 1), (13, 1)],
  term ((117075000 : Rat) / 12247399) [(0, 1), (7, 1), (13, 1)],
  term ((-234150000 : Rat) / 12247399) [(0, 1), (7, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 28. -/
theorem rs_R009_ueqv_R009NNNYN_partial_28_0007_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_28_0007
        rs_R009_ueqv_R009NNNYN_generator_28_0000_0051 =
      rs_R009_ueqv_R009NNNYN_partial_28_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NNNYN_coefficient_28_0008 : Poly :=
[
  term ((-2252300000 : Rat) / 110226591) [(0, 1), (7, 1), (15, 1)]
]

/-- Partial product 8 for generator 28. -/
def rs_R009_ueqv_R009NNNYN_partial_28_0008 : Poly :=
[
  term ((-4504600000 : Rat) / 110226591) [(0, 1), (2, 1), (7, 1), (14, 1), (15, 1)],
  term ((2252300000 : Rat) / 110226591) [(0, 1), (2, 2), (7, 1), (15, 1)],
  term ((-4504600000 : Rat) / 110226591) [(0, 1), (3, 1), (7, 1), (15, 2)],
  term ((2252300000 : Rat) / 110226591) [(0, 1), (3, 2), (7, 1), (15, 1)],
  term ((4504600000 : Rat) / 110226591) [(0, 1), (7, 1), (14, 1), (15, 1)],
  term ((-2252300000 : Rat) / 110226591) [(0, 1), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 28. -/
theorem rs_R009_ueqv_R009NNNYN_partial_28_0008_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_28_0008
        rs_R009_ueqv_R009NNNYN_generator_28_0000_0051 =
      rs_R009_ueqv_R009NNNYN_partial_28_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NNNYN_coefficient_28_0009 : Poly :=
[
  term ((351339520 : Rat) / 110226591) [(0, 1), (11, 1), (13, 1)]
]

/-- Partial product 9 for generator 28. -/
def rs_R009_ueqv_R009NNNYN_partial_28_0009 : Poly :=
[
  term ((702679040 : Rat) / 110226591) [(0, 1), (2, 1), (11, 1), (13, 1), (14, 1)],
  term ((-351339520 : Rat) / 110226591) [(0, 1), (2, 2), (11, 1), (13, 1)],
  term ((702679040 : Rat) / 110226591) [(0, 1), (3, 1), (11, 1), (13, 1), (15, 1)],
  term ((-351339520 : Rat) / 110226591) [(0, 1), (3, 2), (11, 1), (13, 1)],
  term ((351339520 : Rat) / 110226591) [(0, 1), (11, 1), (13, 1)],
  term ((-702679040 : Rat) / 110226591) [(0, 1), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 28. -/
theorem rs_R009_ueqv_R009NNNYN_partial_28_0009_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_28_0009
        rs_R009_ueqv_R009NNNYN_generator_28_0000_0051 =
      rs_R009_ueqv_R009NNNYN_partial_28_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NNNYN_coefficient_28_0010 : Poly :=
[
  term ((-35164160 : Rat) / 110226591) [(0, 1), (11, 1), (15, 1)]
]

/-- Partial product 10 for generator 28. -/
def rs_R009_ueqv_R009NNNYN_partial_28_0010 : Poly :=
[
  term ((-70328320 : Rat) / 110226591) [(0, 1), (2, 1), (11, 1), (14, 1), (15, 1)],
  term ((35164160 : Rat) / 110226591) [(0, 1), (2, 2), (11, 1), (15, 1)],
  term ((-70328320 : Rat) / 110226591) [(0, 1), (3, 1), (11, 1), (15, 2)],
  term ((35164160 : Rat) / 110226591) [(0, 1), (3, 2), (11, 1), (15, 1)],
  term ((70328320 : Rat) / 110226591) [(0, 1), (11, 1), (14, 1), (15, 1)],
  term ((-35164160 : Rat) / 110226591) [(0, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 28. -/
theorem rs_R009_ueqv_R009NNNYN_partial_28_0010_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_28_0010
        rs_R009_ueqv_R009NNNYN_generator_28_0000_0051 =
      rs_R009_ueqv_R009NNNYN_partial_28_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NNNYN_coefficient_28_0011 : Poly :=
[
  term ((38993920 : Rat) / 110226591) [(0, 1), (11, 2)]
]

/-- Partial product 11 for generator 28. -/
def rs_R009_ueqv_R009NNNYN_partial_28_0011 : Poly :=
[
  term ((77987840 : Rat) / 110226591) [(0, 1), (2, 1), (11, 2), (14, 1)],
  term ((-38993920 : Rat) / 110226591) [(0, 1), (2, 2), (11, 2)],
  term ((77987840 : Rat) / 110226591) [(0, 1), (3, 1), (11, 2), (15, 1)],
  term ((-38993920 : Rat) / 110226591) [(0, 1), (3, 2), (11, 2)],
  term ((38993920 : Rat) / 110226591) [(0, 1), (11, 2)],
  term ((-77987840 : Rat) / 110226591) [(0, 1), (11, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 28. -/
theorem rs_R009_ueqv_R009NNNYN_partial_28_0011_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_28_0011
        rs_R009_ueqv_R009NNNYN_generator_28_0000_0051 =
      rs_R009_ueqv_R009NNNYN_partial_28_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NNNYN_coefficient_28_0012 : Poly :=
[
  term ((-301998080 : Rat) / 110226591) [(0, 1), (13, 1), (15, 1)]
]

/-- Partial product 12 for generator 28. -/
def rs_R009_ueqv_R009NNNYN_partial_28_0012 : Poly :=
[
  term ((-603996160 : Rat) / 110226591) [(0, 1), (2, 1), (13, 1), (14, 1), (15, 1)],
  term ((301998080 : Rat) / 110226591) [(0, 1), (2, 2), (13, 1), (15, 1)],
  term ((-603996160 : Rat) / 110226591) [(0, 1), (3, 1), (13, 1), (15, 2)],
  term ((301998080 : Rat) / 110226591) [(0, 1), (3, 2), (13, 1), (15, 1)],
  term ((603996160 : Rat) / 110226591) [(0, 1), (13, 1), (14, 1), (15, 1)],
  term ((-301998080 : Rat) / 110226591) [(0, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 28. -/
theorem rs_R009_ueqv_R009NNNYN_partial_28_0012_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_28_0012
        rs_R009_ueqv_R009NNNYN_generator_28_0000_0051 =
      rs_R009_ueqv_R009NNNYN_partial_28_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NNNYN_coefficient_28_0013 : Poly :=
[
  term ((15697920 : Rat) / 12247399) [(0, 1), (13, 2)]
]

/-- Partial product 13 for generator 28. -/
def rs_R009_ueqv_R009NNNYN_partial_28_0013 : Poly :=
[
  term ((31395840 : Rat) / 12247399) [(0, 1), (2, 1), (13, 2), (14, 1)],
  term ((-15697920 : Rat) / 12247399) [(0, 1), (2, 2), (13, 2)],
  term ((31395840 : Rat) / 12247399) [(0, 1), (3, 1), (13, 2), (15, 1)],
  term ((-15697920 : Rat) / 12247399) [(0, 1), (3, 2), (13, 2)],
  term ((15697920 : Rat) / 12247399) [(0, 1), (13, 2)],
  term ((-31395840 : Rat) / 12247399) [(0, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 28. -/
theorem rs_R009_ueqv_R009NNNYN_partial_28_0013_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_28_0013
        rs_R009_ueqv_R009NNNYN_generator_28_0000_0051 =
      rs_R009_ueqv_R009NNNYN_partial_28_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NNNYN_coefficient_28_0014 : Poly :=
[
  term ((-902030080 : Rat) / 330679773) [(1, 1), (2, 1), (11, 1)]
]

/-- Partial product 14 for generator 28. -/
def rs_R009_ueqv_R009NNNYN_partial_28_0014 : Poly :=
[
  term ((-1804060160 : Rat) / 330679773) [(1, 1), (2, 1), (3, 1), (11, 1), (15, 1)],
  term ((902030080 : Rat) / 330679773) [(1, 1), (2, 1), (3, 2), (11, 1)],
  term ((-902030080 : Rat) / 330679773) [(1, 1), (2, 1), (11, 1)],
  term ((1804060160 : Rat) / 330679773) [(1, 1), (2, 1), (11, 1), (14, 1)],
  term ((-1804060160 : Rat) / 330679773) [(1, 1), (2, 2), (11, 1), (14, 1)],
  term ((902030080 : Rat) / 330679773) [(1, 1), (2, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 28. -/
theorem rs_R009_ueqv_R009NNNYN_partial_28_0014_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_28_0014
        rs_R009_ueqv_R009NNNYN_generator_28_0000_0051 =
      rs_R009_ueqv_R009NNNYN_partial_28_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NNNYN_coefficient_28_0015 : Poly :=
[
  term ((-14094220 : Rat) / 12247399) [(1, 1), (2, 1), (13, 1)]
]

/-- Partial product 15 for generator 28. -/
def rs_R009_ueqv_R009NNNYN_partial_28_0015 : Poly :=
[
  term ((-28188440 : Rat) / 12247399) [(1, 1), (2, 1), (3, 1), (13, 1), (15, 1)],
  term ((14094220 : Rat) / 12247399) [(1, 1), (2, 1), (3, 2), (13, 1)],
  term ((-14094220 : Rat) / 12247399) [(1, 1), (2, 1), (13, 1)],
  term ((28188440 : Rat) / 12247399) [(1, 1), (2, 1), (13, 1), (14, 1)],
  term ((-28188440 : Rat) / 12247399) [(1, 1), (2, 2), (13, 1), (14, 1)],
  term ((14094220 : Rat) / 12247399) [(1, 1), (2, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 28. -/
theorem rs_R009_ueqv_R009NNNYN_partial_28_0015_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_28_0015
        rs_R009_ueqv_R009NNNYN_generator_28_0000_0051 =
      rs_R009_ueqv_R009NNNYN_partial_28_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NNNYN_coefficient_28_0016 : Poly :=
[
  term ((813437840 : Rat) / 330679773) [(1, 1), (2, 1), (15, 1)]
]

/-- Partial product 16 for generator 28. -/
def rs_R009_ueqv_R009NNNYN_partial_28_0016 : Poly :=
[
  term ((1626875680 : Rat) / 330679773) [(1, 1), (2, 1), (3, 1), (15, 2)],
  term ((-813437840 : Rat) / 330679773) [(1, 1), (2, 1), (3, 2), (15, 1)],
  term ((-1626875680 : Rat) / 330679773) [(1, 1), (2, 1), (14, 1), (15, 1)],
  term ((813437840 : Rat) / 330679773) [(1, 1), (2, 1), (15, 1)],
  term ((1626875680 : Rat) / 330679773) [(1, 1), (2, 2), (14, 1), (15, 1)],
  term ((-813437840 : Rat) / 330679773) [(1, 1), (2, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 28. -/
theorem rs_R009_ueqv_R009NNNYN_partial_28_0016_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_28_0016
        rs_R009_ueqv_R009NNNYN_generator_28_0000_0051 =
      rs_R009_ueqv_R009NNNYN_partial_28_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NNNYN_coefficient_28_0017 : Poly :=
[
  term ((-4136621440 : Rat) / 330679773) [(1, 1), (11, 1)]
]

/-- Partial product 17 for generator 28. -/
def rs_R009_ueqv_R009NNNYN_partial_28_0017 : Poly :=
[
  term ((-8273242880 : Rat) / 330679773) [(1, 1), (2, 1), (11, 1), (14, 1)],
  term ((4136621440 : Rat) / 330679773) [(1, 1), (2, 2), (11, 1)],
  term ((-8273242880 : Rat) / 330679773) [(1, 1), (3, 1), (11, 1), (15, 1)],
  term ((4136621440 : Rat) / 330679773) [(1, 1), (3, 2), (11, 1)],
  term ((-4136621440 : Rat) / 330679773) [(1, 1), (11, 1)],
  term ((8273242880 : Rat) / 330679773) [(1, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 28. -/
theorem rs_R009_ueqv_R009NNNYN_partial_28_0017_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_28_0017
        rs_R009_ueqv_R009NNNYN_generator_28_0000_0051 =
      rs_R009_ueqv_R009NNNYN_partial_28_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NNNYN_coefficient_28_0018 : Poly :=
[
  term ((-64634710 : Rat) / 12247399) [(1, 1), (13, 1)]
]

/-- Partial product 18 for generator 28. -/
def rs_R009_ueqv_R009NNNYN_partial_28_0018 : Poly :=
[
  term ((-129269420 : Rat) / 12247399) [(1, 1), (2, 1), (13, 1), (14, 1)],
  term ((64634710 : Rat) / 12247399) [(1, 1), (2, 2), (13, 1)],
  term ((-129269420 : Rat) / 12247399) [(1, 1), (3, 1), (13, 1), (15, 1)],
  term ((64634710 : Rat) / 12247399) [(1, 1), (3, 2), (13, 1)],
  term ((-64634710 : Rat) / 12247399) [(1, 1), (13, 1)],
  term ((129269420 : Rat) / 12247399) [(1, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 28. -/
theorem rs_R009_ueqv_R009NNNYN_partial_28_0018_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_28_0018
        rs_R009_ueqv_R009NNNYN_generator_28_0000_0051 =
      rs_R009_ueqv_R009NNNYN_partial_28_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NNNYN_coefficient_28_0019 : Poly :=
[
  term ((3730346120 : Rat) / 330679773) [(1, 1), (15, 1)]
]

/-- Partial product 19 for generator 28. -/
def rs_R009_ueqv_R009NNNYN_partial_28_0019 : Poly :=
[
  term ((7460692240 : Rat) / 330679773) [(1, 1), (2, 1), (14, 1), (15, 1)],
  term ((-3730346120 : Rat) / 330679773) [(1, 1), (2, 2), (15, 1)],
  term ((7460692240 : Rat) / 330679773) [(1, 1), (3, 1), (15, 2)],
  term ((-3730346120 : Rat) / 330679773) [(1, 1), (3, 2), (15, 1)],
  term ((-7460692240 : Rat) / 330679773) [(1, 1), (14, 1), (15, 1)],
  term ((3730346120 : Rat) / 330679773) [(1, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 28. -/
theorem rs_R009_ueqv_R009NNNYN_partial_28_0019_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_28_0019
        rs_R009_ueqv_R009NNNYN_generator_28_0000_0051 =
      rs_R009_ueqv_R009NNNYN_partial_28_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NNNYN_coefficient_28_0020 : Poly :=
[
  term ((317542400 : Rat) / 110226591) [(2, 1), (7, 1), (11, 1)]
]

/-- Partial product 20 for generator 28. -/
def rs_R009_ueqv_R009NNNYN_partial_28_0020 : Poly :=
[
  term ((635084800 : Rat) / 110226591) [(2, 1), (3, 1), (7, 1), (11, 1), (15, 1)],
  term ((-317542400 : Rat) / 110226591) [(2, 1), (3, 2), (7, 1), (11, 1)],
  term ((317542400 : Rat) / 110226591) [(2, 1), (7, 1), (11, 1)],
  term ((-635084800 : Rat) / 110226591) [(2, 1), (7, 1), (11, 1), (14, 1)],
  term ((635084800 : Rat) / 110226591) [(2, 2), (7, 1), (11, 1), (14, 1)],
  term ((-317542400 : Rat) / 110226591) [(2, 3), (7, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 28. -/
theorem rs_R009_ueqv_R009NNNYN_partial_28_0020_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_28_0020
        rs_R009_ueqv_R009NNNYN_generator_28_0000_0051 =
      rs_R009_ueqv_R009NNNYN_partial_28_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NNNYN_coefficient_28_0021 : Poly :=
[
  term ((14884800 : Rat) / 12247399) [(2, 1), (7, 1), (13, 1)]
]

/-- Partial product 21 for generator 28. -/
def rs_R009_ueqv_R009NNNYN_partial_28_0021 : Poly :=
[
  term ((29769600 : Rat) / 12247399) [(2, 1), (3, 1), (7, 1), (13, 1), (15, 1)],
  term ((-14884800 : Rat) / 12247399) [(2, 1), (3, 2), (7, 1), (13, 1)],
  term ((14884800 : Rat) / 12247399) [(2, 1), (7, 1), (13, 1)],
  term ((-29769600 : Rat) / 12247399) [(2, 1), (7, 1), (13, 1), (14, 1)],
  term ((29769600 : Rat) / 12247399) [(2, 2), (7, 1), (13, 1), (14, 1)],
  term ((-14884800 : Rat) / 12247399) [(2, 3), (7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 28. -/
theorem rs_R009_ueqv_R009NNNYN_partial_28_0021_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_28_0021
        rs_R009_ueqv_R009NNNYN_generator_28_0000_0051 =
      rs_R009_ueqv_R009NNNYN_partial_28_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NNNYN_coefficient_28_0022 : Poly :=
[
  term ((-286355200 : Rat) / 110226591) [(2, 1), (7, 1), (15, 1)]
]

/-- Partial product 22 for generator 28. -/
def rs_R009_ueqv_R009NNNYN_partial_28_0022 : Poly :=
[
  term ((-572710400 : Rat) / 110226591) [(2, 1), (3, 1), (7, 1), (15, 2)],
  term ((286355200 : Rat) / 110226591) [(2, 1), (3, 2), (7, 1), (15, 1)],
  term ((572710400 : Rat) / 110226591) [(2, 1), (7, 1), (14, 1), (15, 1)],
  term ((-286355200 : Rat) / 110226591) [(2, 1), (7, 1), (15, 1)],
  term ((-572710400 : Rat) / 110226591) [(2, 2), (7, 1), (14, 1), (15, 1)],
  term ((286355200 : Rat) / 110226591) [(2, 3), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 28. -/
theorem rs_R009_ueqv_R009NNNYN_partial_28_0022_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_28_0022
        rs_R009_ueqv_R009NNNYN_generator_28_0000_0051 =
      rs_R009_ueqv_R009NNNYN_partial_28_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NNNYN_coefficient_28_0023 : Poly :=
[
  term ((-158771200 : Rat) / 110226591) [(3, 1), (11, 1)]
]

/-- Partial product 23 for generator 28. -/
def rs_R009_ueqv_R009NNNYN_partial_28_0023 : Poly :=
[
  term ((-317542400 : Rat) / 110226591) [(2, 1), (3, 1), (11, 1), (14, 1)],
  term ((158771200 : Rat) / 110226591) [(2, 2), (3, 1), (11, 1)],
  term ((-158771200 : Rat) / 110226591) [(3, 1), (11, 1)],
  term ((317542400 : Rat) / 110226591) [(3, 1), (11, 1), (14, 1)],
  term ((-317542400 : Rat) / 110226591) [(3, 2), (11, 1), (15, 1)],
  term ((158771200 : Rat) / 110226591) [(3, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 28. -/
theorem rs_R009_ueqv_R009NNNYN_partial_28_0023_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_28_0023
        rs_R009_ueqv_R009NNNYN_generator_28_0000_0051 =
      rs_R009_ueqv_R009NNNYN_partial_28_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NNNYN_coefficient_28_0024 : Poly :=
[
  term ((-7442400 : Rat) / 12247399) [(3, 1), (13, 1)]
]

/-- Partial product 24 for generator 28. -/
def rs_R009_ueqv_R009NNNYN_partial_28_0024 : Poly :=
[
  term ((-14884800 : Rat) / 12247399) [(2, 1), (3, 1), (13, 1), (14, 1)],
  term ((7442400 : Rat) / 12247399) [(2, 2), (3, 1), (13, 1)],
  term ((-7442400 : Rat) / 12247399) [(3, 1), (13, 1)],
  term ((14884800 : Rat) / 12247399) [(3, 1), (13, 1), (14, 1)],
  term ((-14884800 : Rat) / 12247399) [(3, 2), (13, 1), (15, 1)],
  term ((7442400 : Rat) / 12247399) [(3, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 28. -/
theorem rs_R009_ueqv_R009NNNYN_partial_28_0024_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_28_0024
        rs_R009_ueqv_R009NNNYN_generator_28_0000_0051 =
      rs_R009_ueqv_R009NNNYN_partial_28_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NNNYN_coefficient_28_0025 : Poly :=
[
  term ((143177600 : Rat) / 110226591) [(3, 1), (15, 1)]
]

/-- Partial product 25 for generator 28. -/
def rs_R009_ueqv_R009NNNYN_partial_28_0025 : Poly :=
[
  term ((286355200 : Rat) / 110226591) [(2, 1), (3, 1), (14, 1), (15, 1)],
  term ((-143177600 : Rat) / 110226591) [(2, 2), (3, 1), (15, 1)],
  term ((-286355200 : Rat) / 110226591) [(3, 1), (14, 1), (15, 1)],
  term ((143177600 : Rat) / 110226591) [(3, 1), (15, 1)],
  term ((286355200 : Rat) / 110226591) [(3, 2), (15, 2)],
  term ((-143177600 : Rat) / 110226591) [(3, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 28. -/
theorem rs_R009_ueqv_R009NNNYN_partial_28_0025_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_28_0025
        rs_R009_ueqv_R009NNNYN_generator_28_0000_0051 =
      rs_R009_ueqv_R009NNNYN_partial_28_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NNNYN_coefficient_28_0026 : Poly :=
[
  term ((361446400 : Rat) / 330679773) [(5, 1), (11, 1)]
]

/-- Partial product 26 for generator 28. -/
def rs_R009_ueqv_R009NNNYN_partial_28_0026 : Poly :=
[
  term ((722892800 : Rat) / 330679773) [(2, 1), (5, 1), (11, 1), (14, 1)],
  term ((-361446400 : Rat) / 330679773) [(2, 2), (5, 1), (11, 1)],
  term ((722892800 : Rat) / 330679773) [(3, 1), (5, 1), (11, 1), (15, 1)],
  term ((-361446400 : Rat) / 330679773) [(3, 2), (5, 1), (11, 1)],
  term ((361446400 : Rat) / 330679773) [(5, 1), (11, 1)],
  term ((-722892800 : Rat) / 330679773) [(5, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 28. -/
theorem rs_R009_ueqv_R009NNNYN_partial_28_0026_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_28_0026
        rs_R009_ueqv_R009NNNYN_generator_28_0000_0051 =
      rs_R009_ueqv_R009NNNYN_partial_28_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NNNYN_coefficient_28_0027 : Poly :=
[
  term ((63365120 : Rat) / 36742197) [(5, 1), (11, 1), (12, 1)]
]

/-- Partial product 27 for generator 28. -/
def rs_R009_ueqv_R009NNNYN_partial_28_0027 : Poly :=
[
  term ((126730240 : Rat) / 36742197) [(2, 1), (5, 1), (11, 1), (12, 1), (14, 1)],
  term ((-63365120 : Rat) / 36742197) [(2, 2), (5, 1), (11, 1), (12, 1)],
  term ((126730240 : Rat) / 36742197) [(3, 1), (5, 1), (11, 1), (12, 1), (15, 1)],
  term ((-63365120 : Rat) / 36742197) [(3, 2), (5, 1), (11, 1), (12, 1)],
  term ((63365120 : Rat) / 36742197) [(5, 1), (11, 1), (12, 1)],
  term ((-126730240 : Rat) / 36742197) [(5, 1), (11, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 28. -/
theorem rs_R009_ueqv_R009NNNYN_partial_28_0027_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_28_0027
        rs_R009_ueqv_R009NNNYN_generator_28_0000_0051 =
      rs_R009_ueqv_R009NNNYN_partial_28_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NNNYN_coefficient_28_0028 : Poly :=
[
  term ((-63365120 : Rat) / 36742197) [(5, 1), (11, 1), (14, 1)]
]

/-- Partial product 28 for generator 28. -/
def rs_R009_ueqv_R009NNNYN_partial_28_0028 : Poly :=
[
  term ((-126730240 : Rat) / 36742197) [(2, 1), (5, 1), (11, 1), (14, 2)],
  term ((63365120 : Rat) / 36742197) [(2, 2), (5, 1), (11, 1), (14, 1)],
  term ((-126730240 : Rat) / 36742197) [(3, 1), (5, 1), (11, 1), (14, 1), (15, 1)],
  term ((63365120 : Rat) / 36742197) [(3, 2), (5, 1), (11, 1), (14, 1)],
  term ((-63365120 : Rat) / 36742197) [(5, 1), (11, 1), (14, 1)],
  term ((126730240 : Rat) / 36742197) [(5, 1), (11, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 28. -/
theorem rs_R009_ueqv_R009NNNYN_partial_28_0028_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_28_0028
        rs_R009_ueqv_R009NNNYN_generator_28_0000_0051 =
      rs_R009_ueqv_R009NNNYN_partial_28_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NNNYN_coefficient_28_0029 : Poly :=
[
  term ((8910720 : Rat) / 12247399) [(5, 1), (12, 1), (13, 1)]
]

/-- Partial product 29 for generator 28. -/
def rs_R009_ueqv_R009NNNYN_partial_28_0029 : Poly :=
[
  term ((17821440 : Rat) / 12247399) [(2, 1), (5, 1), (12, 1), (13, 1), (14, 1)],
  term ((-8910720 : Rat) / 12247399) [(2, 2), (5, 1), (12, 1), (13, 1)],
  term ((17821440 : Rat) / 12247399) [(3, 1), (5, 1), (12, 1), (13, 1), (15, 1)],
  term ((-8910720 : Rat) / 12247399) [(3, 2), (5, 1), (12, 1), (13, 1)],
  term ((8910720 : Rat) / 12247399) [(5, 1), (12, 1), (13, 1)],
  term ((-17821440 : Rat) / 12247399) [(5, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 28. -/
theorem rs_R009_ueqv_R009NNNYN_partial_28_0029_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_28_0029
        rs_R009_ueqv_R009NNNYN_generator_28_0000_0051 =
      rs_R009_ueqv_R009NNNYN_partial_28_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NNNYN_coefficient_28_0030 : Poly :=
[
  term ((-57141760 : Rat) / 36742197) [(5, 1), (12, 1), (15, 1)]
]

/-- Partial product 30 for generator 28. -/
def rs_R009_ueqv_R009NNNYN_partial_28_0030 : Poly :=
[
  term ((-114283520 : Rat) / 36742197) [(2, 1), (5, 1), (12, 1), (14, 1), (15, 1)],
  term ((57141760 : Rat) / 36742197) [(2, 2), (5, 1), (12, 1), (15, 1)],
  term ((-114283520 : Rat) / 36742197) [(3, 1), (5, 1), (12, 1), (15, 2)],
  term ((57141760 : Rat) / 36742197) [(3, 2), (5, 1), (12, 1), (15, 1)],
  term ((114283520 : Rat) / 36742197) [(5, 1), (12, 1), (14, 1), (15, 1)],
  term ((-57141760 : Rat) / 36742197) [(5, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 28. -/
theorem rs_R009_ueqv_R009NNNYN_partial_28_0030_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_28_0030
        rs_R009_ueqv_R009NNNYN_generator_28_0000_0051 =
      rs_R009_ueqv_R009NNNYN_partial_28_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NNNYN_coefficient_28_0031 : Poly :=
[
  term ((5647600 : Rat) / 12247399) [(5, 1), (13, 1)]
]

/-- Partial product 31 for generator 28. -/
def rs_R009_ueqv_R009NNNYN_partial_28_0031 : Poly :=
[
  term ((11295200 : Rat) / 12247399) [(2, 1), (5, 1), (13, 1), (14, 1)],
  term ((-5647600 : Rat) / 12247399) [(2, 2), (5, 1), (13, 1)],
  term ((11295200 : Rat) / 12247399) [(3, 1), (5, 1), (13, 1), (15, 1)],
  term ((-5647600 : Rat) / 12247399) [(3, 2), (5, 1), (13, 1)],
  term ((5647600 : Rat) / 12247399) [(5, 1), (13, 1)],
  term ((-11295200 : Rat) / 12247399) [(5, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 28. -/
theorem rs_R009_ueqv_R009NNNYN_partial_28_0031_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_28_0031
        rs_R009_ueqv_R009NNNYN_generator_28_0000_0051 =
      rs_R009_ueqv_R009NNNYN_partial_28_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NNNYN_coefficient_28_0032 : Poly :=
[
  term ((-8910720 : Rat) / 12247399) [(5, 1), (13, 1), (14, 1)]
]

/-- Partial product 32 for generator 28. -/
def rs_R009_ueqv_R009NNNYN_partial_28_0032 : Poly :=
[
  term ((-17821440 : Rat) / 12247399) [(2, 1), (5, 1), (13, 1), (14, 2)],
  term ((8910720 : Rat) / 12247399) [(2, 2), (5, 1), (13, 1), (14, 1)],
  term ((-17821440 : Rat) / 12247399) [(3, 1), (5, 1), (13, 1), (14, 1), (15, 1)],
  term ((8910720 : Rat) / 12247399) [(3, 2), (5, 1), (13, 1), (14, 1)],
  term ((-8910720 : Rat) / 12247399) [(5, 1), (13, 1), (14, 1)],
  term ((17821440 : Rat) / 12247399) [(5, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 28. -/
theorem rs_R009_ueqv_R009NNNYN_partial_28_0032_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_28_0032
        rs_R009_ueqv_R009NNNYN_generator_28_0000_0051 =
      rs_R009_ueqv_R009NNNYN_partial_28_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NNNYN_coefficient_28_0033 : Poly :=
[
  term ((57141760 : Rat) / 36742197) [(5, 1), (14, 1), (15, 1)]
]

/-- Partial product 33 for generator 28. -/
def rs_R009_ueqv_R009NNNYN_partial_28_0033 : Poly :=
[
  term ((114283520 : Rat) / 36742197) [(2, 1), (5, 1), (14, 2), (15, 1)],
  term ((-57141760 : Rat) / 36742197) [(2, 2), (5, 1), (14, 1), (15, 1)],
  term ((114283520 : Rat) / 36742197) [(3, 1), (5, 1), (14, 1), (15, 2)],
  term ((-57141760 : Rat) / 36742197) [(3, 2), (5, 1), (14, 1), (15, 1)],
  term ((57141760 : Rat) / 36742197) [(5, 1), (14, 1), (15, 1)],
  term ((-114283520 : Rat) / 36742197) [(5, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 28. -/
theorem rs_R009_ueqv_R009NNNYN_partial_28_0033_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_28_0033
        rs_R009_ueqv_R009NNNYN_generator_28_0000_0051 =
      rs_R009_ueqv_R009NNNYN_partial_28_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NNNYN_coefficient_28_0034 : Poly :=
[
  term ((-325947200 : Rat) / 330679773) [(5, 1), (15, 1)]
]

/-- Partial product 34 for generator 28. -/
def rs_R009_ueqv_R009NNNYN_partial_28_0034 : Poly :=
[
  term ((-651894400 : Rat) / 330679773) [(2, 1), (5, 1), (14, 1), (15, 1)],
  term ((325947200 : Rat) / 330679773) [(2, 2), (5, 1), (15, 1)],
  term ((-651894400 : Rat) / 330679773) [(3, 1), (5, 1), (15, 2)],
  term ((325947200 : Rat) / 330679773) [(3, 2), (5, 1), (15, 1)],
  term ((651894400 : Rat) / 330679773) [(5, 1), (14, 1), (15, 1)],
  term ((-325947200 : Rat) / 330679773) [(5, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 28. -/
theorem rs_R009_ueqv_R009NNNYN_partial_28_0034_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_28_0034
        rs_R009_ueqv_R009NNNYN_generator_28_0000_0051 =
      rs_R009_ueqv_R009NNNYN_partial_28_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NNNYN_coefficient_28_0035 : Poly :=
[
  term ((-950862080 : Rat) / 330679773) [(7, 1), (11, 1)]
]

/-- Partial product 35 for generator 28. -/
def rs_R009_ueqv_R009NNNYN_partial_28_0035 : Poly :=
[
  term ((-1901724160 : Rat) / 330679773) [(2, 1), (7, 1), (11, 1), (14, 1)],
  term ((950862080 : Rat) / 330679773) [(2, 2), (7, 1), (11, 1)],
  term ((-1901724160 : Rat) / 330679773) [(3, 1), (7, 1), (11, 1), (15, 1)],
  term ((950862080 : Rat) / 330679773) [(3, 2), (7, 1), (11, 1)],
  term ((-950862080 : Rat) / 330679773) [(7, 1), (11, 1)],
  term ((1901724160 : Rat) / 330679773) [(7, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 28. -/
theorem rs_R009_ueqv_R009NNNYN_partial_28_0035_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_28_0035
        rs_R009_ueqv_R009NNNYN_generator_28_0000_0051 =
      rs_R009_ueqv_R009NNNYN_partial_28_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NNNYN_coefficient_28_0036 : Poly :=
[
  term ((104796160 : Rat) / 110226591) [(7, 1), (11, 1), (14, 1)]
]

/-- Partial product 36 for generator 28. -/
def rs_R009_ueqv_R009NNNYN_partial_28_0036 : Poly :=
[
  term ((209592320 : Rat) / 110226591) [(2, 1), (7, 1), (11, 1), (14, 2)],
  term ((-104796160 : Rat) / 110226591) [(2, 2), (7, 1), (11, 1), (14, 1)],
  term ((209592320 : Rat) / 110226591) [(3, 1), (7, 1), (11, 1), (14, 1), (15, 1)],
  term ((-104796160 : Rat) / 110226591) [(3, 2), (7, 1), (11, 1), (14, 1)],
  term ((104796160 : Rat) / 110226591) [(7, 1), (11, 1), (14, 1)],
  term ((-209592320 : Rat) / 110226591) [(7, 1), (11, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 28. -/
theorem rs_R009_ueqv_R009NNNYN_partial_28_0036_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_28_0036
        rs_R009_ueqv_R009NNNYN_generator_28_0000_0051 =
      rs_R009_ueqv_R009NNNYN_partial_28_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NNNYN_coefficient_28_0037 : Poly :=
[
  term ((-14857220 : Rat) / 12247399) [(7, 1), (13, 1)]
]

/-- Partial product 37 for generator 28. -/
def rs_R009_ueqv_R009NNNYN_partial_28_0037 : Poly :=
[
  term ((-29714440 : Rat) / 12247399) [(2, 1), (7, 1), (13, 1), (14, 1)],
  term ((14857220 : Rat) / 12247399) [(2, 2), (7, 1), (13, 1)],
  term ((-29714440 : Rat) / 12247399) [(3, 1), (7, 1), (13, 1), (15, 1)],
  term ((14857220 : Rat) / 12247399) [(3, 2), (7, 1), (13, 1)],
  term ((-14857220 : Rat) / 12247399) [(7, 1), (13, 1)],
  term ((29714440 : Rat) / 12247399) [(7, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 28. -/
theorem rs_R009_ueqv_R009NNNYN_partial_28_0037_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_28_0037
        rs_R009_ueqv_R009NNNYN_generator_28_0000_0051 =
      rs_R009_ueqv_R009NNNYN_partial_28_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NNNYN_coefficient_28_0038 : Poly :=
[
  term ((4912320 : Rat) / 12247399) [(7, 1), (13, 1), (14, 1)]
]

/-- Partial product 38 for generator 28. -/
def rs_R009_ueqv_R009NNNYN_partial_28_0038 : Poly :=
[
  term ((9824640 : Rat) / 12247399) [(2, 1), (7, 1), (13, 1), (14, 2)],
  term ((-4912320 : Rat) / 12247399) [(2, 2), (7, 1), (13, 1), (14, 1)],
  term ((9824640 : Rat) / 12247399) [(3, 1), (7, 1), (13, 1), (14, 1), (15, 1)],
  term ((-4912320 : Rat) / 12247399) [(3, 2), (7, 1), (13, 1), (14, 1)],
  term ((4912320 : Rat) / 12247399) [(7, 1), (13, 1), (14, 1)],
  term ((-9824640 : Rat) / 12247399) [(7, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 28. -/
theorem rs_R009_ueqv_R009NNNYN_partial_28_0038_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_28_0038
        rs_R009_ueqv_R009NNNYN_generator_28_0000_0051 =
      rs_R009_ueqv_R009NNNYN_partial_28_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NNNYN_coefficient_28_0039 : Poly :=
[
  term ((-94503680 : Rat) / 110226591) [(7, 1), (14, 1), (15, 1)]
]

/-- Partial product 39 for generator 28. -/
def rs_R009_ueqv_R009NNNYN_partial_28_0039 : Poly :=
[
  term ((-189007360 : Rat) / 110226591) [(2, 1), (7, 1), (14, 2), (15, 1)],
  term ((94503680 : Rat) / 110226591) [(2, 2), (7, 1), (14, 1), (15, 1)],
  term ((-189007360 : Rat) / 110226591) [(3, 1), (7, 1), (14, 1), (15, 2)],
  term ((94503680 : Rat) / 110226591) [(3, 2), (7, 1), (14, 1), (15, 1)],
  term ((-94503680 : Rat) / 110226591) [(7, 1), (14, 1), (15, 1)],
  term ((189007360 : Rat) / 110226591) [(7, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 28. -/
theorem rs_R009_ueqv_R009NNNYN_partial_28_0039_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_28_0039
        rs_R009_ueqv_R009NNNYN_generator_28_0000_0051 =
      rs_R009_ueqv_R009NNNYN_partial_28_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NNNYN_coefficient_28_0040 : Poly :=
[
  term ((857473840 : Rat) / 330679773) [(7, 1), (15, 1)]
]

/-- Partial product 40 for generator 28. -/
def rs_R009_ueqv_R009NNNYN_partial_28_0040 : Poly :=
[
  term ((1714947680 : Rat) / 330679773) [(2, 1), (7, 1), (14, 1), (15, 1)],
  term ((-857473840 : Rat) / 330679773) [(2, 2), (7, 1), (15, 1)],
  term ((1714947680 : Rat) / 330679773) [(3, 1), (7, 1), (15, 2)],
  term ((-857473840 : Rat) / 330679773) [(3, 2), (7, 1), (15, 1)],
  term ((-1714947680 : Rat) / 330679773) [(7, 1), (14, 1), (15, 1)],
  term ((857473840 : Rat) / 330679773) [(7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 28. -/
theorem rs_R009_ueqv_R009NNNYN_partial_28_0040_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_28_0040
        rs_R009_ueqv_R009NNNYN_generator_28_0000_0051 =
      rs_R009_ueqv_R009NNNYN_partial_28_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NNNYN_coefficient_28_0041 : Poly :=
[
  term ((6594560 : Rat) / 330679773) [(11, 1), (12, 1), (15, 1)]
]

/-- Partial product 41 for generator 28. -/
def rs_R009_ueqv_R009NNNYN_partial_28_0041 : Poly :=
[
  term ((13189120 : Rat) / 330679773) [(2, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-6594560 : Rat) / 330679773) [(2, 2), (11, 1), (12, 1), (15, 1)],
  term ((13189120 : Rat) / 330679773) [(3, 1), (11, 1), (12, 1), (15, 2)],
  term ((-6594560 : Rat) / 330679773) [(3, 2), (11, 1), (12, 1), (15, 1)],
  term ((-13189120 : Rat) / 330679773) [(11, 1), (12, 1), (14, 1), (15, 1)],
  term ((6594560 : Rat) / 330679773) [(11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 28. -/
theorem rs_R009_ueqv_R009NNNYN_partial_28_0041_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_28_0041
        rs_R009_ueqv_R009NNNYN_generator_28_0000_0051 =
      rs_R009_ueqv_R009NNNYN_partial_28_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NNNYN_coefficient_28_0042 : Poly :=
[
  term ((188921600 : Rat) / 110226591) [(11, 1), (13, 1)]
]

/-- Partial product 42 for generator 28. -/
def rs_R009_ueqv_R009NNNYN_partial_28_0042 : Poly :=
[
  term ((377843200 : Rat) / 110226591) [(2, 1), (11, 1), (13, 1), (14, 1)],
  term ((-188921600 : Rat) / 110226591) [(2, 2), (11, 1), (13, 1)],
  term ((377843200 : Rat) / 110226591) [(3, 1), (11, 1), (13, 1), (15, 1)],
  term ((-188921600 : Rat) / 110226591) [(3, 2), (11, 1), (13, 1)],
  term ((188921600 : Rat) / 110226591) [(11, 1), (13, 1)],
  term ((-377843200 : Rat) / 110226591) [(11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 28. -/
theorem rs_R009_ueqv_R009NNNYN_partial_28_0042_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_28_0042
        rs_R009_ueqv_R009NNNYN_generator_28_0000_0051 =
      rs_R009_ueqv_R009NNNYN_partial_28_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NNNYN_coefficient_28_0043 : Poly :=
[
  term ((-6594560 : Rat) / 330679773) [(11, 1), (13, 1), (14, 1)]
]

/-- Partial product 43 for generator 28. -/
def rs_R009_ueqv_R009NNNYN_partial_28_0043 : Poly :=
[
  term ((-13189120 : Rat) / 330679773) [(2, 1), (11, 1), (13, 1), (14, 2)],
  term ((6594560 : Rat) / 330679773) [(2, 2), (11, 1), (13, 1), (14, 1)],
  term ((-13189120 : Rat) / 330679773) [(3, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((6594560 : Rat) / 330679773) [(3, 2), (11, 1), (13, 1), (14, 1)],
  term ((-6594560 : Rat) / 330679773) [(11, 1), (13, 1), (14, 1)],
  term ((13189120 : Rat) / 330679773) [(11, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 28. -/
theorem rs_R009_ueqv_R009NNNYN_partial_28_0043_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_28_0043
        rs_R009_ueqv_R009NNNYN_generator_28_0000_0051 =
      rs_R009_ueqv_R009NNNYN_partial_28_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NNNYN_coefficient_28_0044 : Poly :=
[
  term ((-134543360 : Rat) / 330679773) [(11, 1), (15, 1)]
]

/-- Partial product 44 for generator 28. -/
def rs_R009_ueqv_R009NNNYN_partial_28_0044 : Poly :=
[
  term ((-269086720 : Rat) / 330679773) [(2, 1), (11, 1), (14, 1), (15, 1)],
  term ((134543360 : Rat) / 330679773) [(2, 2), (11, 1), (15, 1)],
  term ((-269086720 : Rat) / 330679773) [(3, 1), (11, 1), (15, 2)],
  term ((134543360 : Rat) / 330679773) [(3, 2), (11, 1), (15, 1)],
  term ((269086720 : Rat) / 330679773) [(11, 1), (14, 1), (15, 1)],
  term ((-134543360 : Rat) / 330679773) [(11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 28. -/
theorem rs_R009_ueqv_R009NNNYN_partial_28_0044_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_28_0044
        rs_R009_ueqv_R009NNNYN_generator_28_0000_0051 =
      rs_R009_ueqv_R009NNNYN_partial_28_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NNNYN_coefficient_28_0045 : Poly :=
[
  term ((103040 : Rat) / 12247399) [(12, 1), (13, 1), (15, 1)]
]

/-- Partial product 45 for generator 28. -/
def rs_R009_ueqv_R009NNNYN_partial_28_0045 : Poly :=
[
  term ((206080 : Rat) / 12247399) [(2, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-103040 : Rat) / 12247399) [(2, 2), (12, 1), (13, 1), (15, 1)],
  term ((206080 : Rat) / 12247399) [(3, 1), (12, 1), (13, 1), (15, 2)],
  term ((-103040 : Rat) / 12247399) [(3, 2), (12, 1), (13, 1), (15, 1)],
  term ((-206080 : Rat) / 12247399) [(12, 1), (13, 1), (14, 1), (15, 1)],
  term ((103040 : Rat) / 12247399) [(12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 28. -/
theorem rs_R009_ueqv_R009NNNYN_partial_28_0045_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_28_0045
        rs_R009_ueqv_R009NNNYN_generator_28_0000_0051 =
      rs_R009_ueqv_R009NNNYN_partial_28_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NNNYN_coefficient_28_0046 : Poly :=
[
  term ((-5946880 : Rat) / 330679773) [(12, 1), (15, 2)]
]

/-- Partial product 46 for generator 28. -/
def rs_R009_ueqv_R009NNNYN_partial_28_0046 : Poly :=
[
  term ((-11893760 : Rat) / 330679773) [(2, 1), (12, 1), (14, 1), (15, 2)],
  term ((5946880 : Rat) / 330679773) [(2, 2), (12, 1), (15, 2)],
  term ((-11893760 : Rat) / 330679773) [(3, 1), (12, 1), (15, 3)],
  term ((5946880 : Rat) / 330679773) [(3, 2), (12, 1), (15, 2)],
  term ((11893760 : Rat) / 330679773) [(12, 1), (14, 1), (15, 2)],
  term ((-5946880 : Rat) / 330679773) [(12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 28. -/
theorem rs_R009_ueqv_R009NNNYN_partial_28_0046_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_28_0046
        rs_R009_ueqv_R009NNNYN_generator_28_0000_0051 =
      rs_R009_ueqv_R009NNNYN_partial_28_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NNNYN_coefficient_28_0047 : Poly :=
[
  term ((5946880 : Rat) / 330679773) [(13, 1), (14, 1), (15, 1)]
]

/-- Partial product 47 for generator 28. -/
def rs_R009_ueqv_R009NNNYN_partial_28_0047 : Poly :=
[
  term ((11893760 : Rat) / 330679773) [(2, 1), (13, 1), (14, 2), (15, 1)],
  term ((-5946880 : Rat) / 330679773) [(2, 2), (13, 1), (14, 1), (15, 1)],
  term ((11893760 : Rat) / 330679773) [(3, 1), (13, 1), (14, 1), (15, 2)],
  term ((-5946880 : Rat) / 330679773) [(3, 2), (13, 1), (14, 1), (15, 1)],
  term ((5946880 : Rat) / 330679773) [(13, 1), (14, 1), (15, 1)],
  term ((-11893760 : Rat) / 330679773) [(13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 28. -/
theorem rs_R009_ueqv_R009NNNYN_partial_28_0047_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_28_0047
        rs_R009_ueqv_R009NNNYN_generator_28_0000_0051 =
      rs_R009_ueqv_R009NNNYN_partial_28_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NNNYN_coefficient_28_0048 : Poly :=
[
  term ((-189286960 : Rat) / 110226591) [(13, 1), (15, 1)]
]

/-- Partial product 48 for generator 28. -/
def rs_R009_ueqv_R009NNNYN_partial_28_0048 : Poly :=
[
  term ((-378573920 : Rat) / 110226591) [(2, 1), (13, 1), (14, 1), (15, 1)],
  term ((189286960 : Rat) / 110226591) [(2, 2), (13, 1), (15, 1)],
  term ((-378573920 : Rat) / 110226591) [(3, 1), (13, 1), (15, 2)],
  term ((189286960 : Rat) / 110226591) [(3, 2), (13, 1), (15, 1)],
  term ((378573920 : Rat) / 110226591) [(13, 1), (14, 1), (15, 1)],
  term ((-189286960 : Rat) / 110226591) [(13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 28. -/
theorem rs_R009_ueqv_R009NNNYN_partial_28_0048_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_28_0048
        rs_R009_ueqv_R009NNNYN_generator_28_0000_0051 =
      rs_R009_ueqv_R009NNNYN_partial_28_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NNNYN_coefficient_28_0049 : Poly :=
[
  term ((8855700 : Rat) / 12247399) [(13, 2)]
]

/-- Partial product 49 for generator 28. -/
def rs_R009_ueqv_R009NNNYN_partial_28_0049 : Poly :=
[
  term ((17711400 : Rat) / 12247399) [(2, 1), (13, 2), (14, 1)],
  term ((-8855700 : Rat) / 12247399) [(2, 2), (13, 2)],
  term ((17711400 : Rat) / 12247399) [(3, 1), (13, 2), (15, 1)],
  term ((-8855700 : Rat) / 12247399) [(3, 2), (13, 2)],
  term ((8855700 : Rat) / 12247399) [(13, 2)],
  term ((-17711400 : Rat) / 12247399) [(13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 28. -/
theorem rs_R009_ueqv_R009NNNYN_partial_28_0049_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_28_0049
        rs_R009_ueqv_R009NNNYN_generator_28_0000_0051 =
      rs_R009_ueqv_R009NNNYN_partial_28_0049 := by
  native_decide

/-- Coefficient term 50 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NNNYN_coefficient_28_0050 : Poly :=
[
  term ((-103040 : Rat) / 12247399) [(13, 2), (14, 1)]
]

/-- Partial product 50 for generator 28. -/
def rs_R009_ueqv_R009NNNYN_partial_28_0050 : Poly :=
[
  term ((-206080 : Rat) / 12247399) [(2, 1), (13, 2), (14, 2)],
  term ((103040 : Rat) / 12247399) [(2, 2), (13, 2), (14, 1)],
  term ((-206080 : Rat) / 12247399) [(3, 1), (13, 2), (14, 1), (15, 1)],
  term ((103040 : Rat) / 12247399) [(3, 2), (13, 2), (14, 1)],
  term ((-103040 : Rat) / 12247399) [(13, 2), (14, 1)],
  term ((206080 : Rat) / 12247399) [(13, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 50 for generator 28. -/
theorem rs_R009_ueqv_R009NNNYN_partial_28_0050_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_28_0050
        rs_R009_ueqv_R009NNNYN_generator_28_0000_0051 =
      rs_R009_ueqv_R009NNNYN_partial_28_0050 := by
  native_decide

/-- Coefficient term 51 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NNNYN_coefficient_28_0051 : Poly :=
[
  term ((121329280 : Rat) / 330679773) [(15, 2)]
]

/-- Partial product 51 for generator 28. -/
def rs_R009_ueqv_R009NNNYN_partial_28_0051 : Poly :=
[
  term ((242658560 : Rat) / 330679773) [(2, 1), (14, 1), (15, 2)],
  term ((-121329280 : Rat) / 330679773) [(2, 2), (15, 2)],
  term ((242658560 : Rat) / 330679773) [(3, 1), (15, 3)],
  term ((-121329280 : Rat) / 330679773) [(3, 2), (15, 2)],
  term ((-242658560 : Rat) / 330679773) [(14, 1), (15, 2)],
  term ((121329280 : Rat) / 330679773) [(15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 51 for generator 28. -/
theorem rs_R009_ueqv_R009NNNYN_partial_28_0051_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_28_0051
        rs_R009_ueqv_R009NNNYN_generator_28_0000_0051 =
      rs_R009_ueqv_R009NNNYN_partial_28_0051 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NNNYN_partials_28_0000_0051 : List Poly :=
[
  rs_R009_ueqv_R009NNNYN_partial_28_0000,
  rs_R009_ueqv_R009NNNYN_partial_28_0001,
  rs_R009_ueqv_R009NNNYN_partial_28_0002,
  rs_R009_ueqv_R009NNNYN_partial_28_0003,
  rs_R009_ueqv_R009NNNYN_partial_28_0004,
  rs_R009_ueqv_R009NNNYN_partial_28_0005,
  rs_R009_ueqv_R009NNNYN_partial_28_0006,
  rs_R009_ueqv_R009NNNYN_partial_28_0007,
  rs_R009_ueqv_R009NNNYN_partial_28_0008,
  rs_R009_ueqv_R009NNNYN_partial_28_0009,
  rs_R009_ueqv_R009NNNYN_partial_28_0010,
  rs_R009_ueqv_R009NNNYN_partial_28_0011,
  rs_R009_ueqv_R009NNNYN_partial_28_0012,
  rs_R009_ueqv_R009NNNYN_partial_28_0013,
  rs_R009_ueqv_R009NNNYN_partial_28_0014,
  rs_R009_ueqv_R009NNNYN_partial_28_0015,
  rs_R009_ueqv_R009NNNYN_partial_28_0016,
  rs_R009_ueqv_R009NNNYN_partial_28_0017,
  rs_R009_ueqv_R009NNNYN_partial_28_0018,
  rs_R009_ueqv_R009NNNYN_partial_28_0019,
  rs_R009_ueqv_R009NNNYN_partial_28_0020,
  rs_R009_ueqv_R009NNNYN_partial_28_0021,
  rs_R009_ueqv_R009NNNYN_partial_28_0022,
  rs_R009_ueqv_R009NNNYN_partial_28_0023,
  rs_R009_ueqv_R009NNNYN_partial_28_0024,
  rs_R009_ueqv_R009NNNYN_partial_28_0025,
  rs_R009_ueqv_R009NNNYN_partial_28_0026,
  rs_R009_ueqv_R009NNNYN_partial_28_0027,
  rs_R009_ueqv_R009NNNYN_partial_28_0028,
  rs_R009_ueqv_R009NNNYN_partial_28_0029,
  rs_R009_ueqv_R009NNNYN_partial_28_0030,
  rs_R009_ueqv_R009NNNYN_partial_28_0031,
  rs_R009_ueqv_R009NNNYN_partial_28_0032,
  rs_R009_ueqv_R009NNNYN_partial_28_0033,
  rs_R009_ueqv_R009NNNYN_partial_28_0034,
  rs_R009_ueqv_R009NNNYN_partial_28_0035,
  rs_R009_ueqv_R009NNNYN_partial_28_0036,
  rs_R009_ueqv_R009NNNYN_partial_28_0037,
  rs_R009_ueqv_R009NNNYN_partial_28_0038,
  rs_R009_ueqv_R009NNNYN_partial_28_0039,
  rs_R009_ueqv_R009NNNYN_partial_28_0040,
  rs_R009_ueqv_R009NNNYN_partial_28_0041,
  rs_R009_ueqv_R009NNNYN_partial_28_0042,
  rs_R009_ueqv_R009NNNYN_partial_28_0043,
  rs_R009_ueqv_R009NNNYN_partial_28_0044,
  rs_R009_ueqv_R009NNNYN_partial_28_0045,
  rs_R009_ueqv_R009NNNYN_partial_28_0046,
  rs_R009_ueqv_R009NNNYN_partial_28_0047,
  rs_R009_ueqv_R009NNNYN_partial_28_0048,
  rs_R009_ueqv_R009NNNYN_partial_28_0049,
  rs_R009_ueqv_R009NNNYN_partial_28_0050,
  rs_R009_ueqv_R009NNNYN_partial_28_0051
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NNNYN_block_28_0000_0051 : Poly :=
[
  term ((1804060160 : Rat) / 330679773) [(0, 1), (2, 1), (3, 1), (11, 1), (14, 1)],
  term ((28188440 : Rat) / 12247399) [(0, 1), (2, 1), (3, 1), (13, 1), (14, 1)],
  term ((-1626875680 : Rat) / 330679773) [(0, 1), (2, 1), (3, 1), (14, 1), (15, 1)],
  term ((-682411520 : Rat) / 330679773) [(0, 1), (2, 1), (5, 1), (11, 1), (14, 1)],
  term ((-10662680 : Rat) / 12247399) [(0, 1), (2, 1), (5, 1), (13, 1), (14, 1)],
  term ((615388960 : Rat) / 330679773) [(0, 1), (2, 1), (5, 1), (14, 1), (15, 1)],
  term ((4995200000 : Rat) / 110226591) [(0, 1), (2, 1), (7, 1), (11, 1), (14, 1)],
  term ((234150000 : Rat) / 12247399) [(0, 1), (2, 1), (7, 1), (13, 1), (14, 1)],
  term ((-4504600000 : Rat) / 110226591) [(0, 1), (2, 1), (7, 1), (14, 1), (15, 1)],
  term ((702679040 : Rat) / 110226591) [(0, 1), (2, 1), (11, 1), (13, 1), (14, 1)],
  term ((-70328320 : Rat) / 110226591) [(0, 1), (2, 1), (11, 1), (14, 1), (15, 1)],
  term ((77987840 : Rat) / 110226591) [(0, 1), (2, 1), (11, 2), (14, 1)],
  term ((-603996160 : Rat) / 110226591) [(0, 1), (2, 1), (13, 1), (14, 1), (15, 1)],
  term ((31395840 : Rat) / 12247399) [(0, 1), (2, 1), (13, 2), (14, 1)],
  term ((-902030080 : Rat) / 330679773) [(0, 1), (2, 2), (3, 1), (11, 1)],
  term ((-14094220 : Rat) / 12247399) [(0, 1), (2, 2), (3, 1), (13, 1)],
  term ((813437840 : Rat) / 330679773) [(0, 1), (2, 2), (3, 1), (15, 1)],
  term ((341205760 : Rat) / 330679773) [(0, 1), (2, 2), (5, 1), (11, 1)],
  term ((5331340 : Rat) / 12247399) [(0, 1), (2, 2), (5, 1), (13, 1)],
  term ((-307694480 : Rat) / 330679773) [(0, 1), (2, 2), (5, 1), (15, 1)],
  term ((-2497600000 : Rat) / 110226591) [(0, 1), (2, 2), (7, 1), (11, 1)],
  term ((-117075000 : Rat) / 12247399) [(0, 1), (2, 2), (7, 1), (13, 1)],
  term ((2252300000 : Rat) / 110226591) [(0, 1), (2, 2), (7, 1), (15, 1)],
  term ((-351339520 : Rat) / 110226591) [(0, 1), (2, 2), (11, 1), (13, 1)],
  term ((35164160 : Rat) / 110226591) [(0, 1), (2, 2), (11, 1), (15, 1)],
  term ((-38993920 : Rat) / 110226591) [(0, 1), (2, 2), (11, 2)],
  term ((301998080 : Rat) / 110226591) [(0, 1), (2, 2), (13, 1), (15, 1)],
  term ((-15697920 : Rat) / 12247399) [(0, 1), (2, 2), (13, 2)],
  term ((-682411520 : Rat) / 330679773) [(0, 1), (3, 1), (5, 1), (11, 1), (15, 1)],
  term ((-10662680 : Rat) / 12247399) [(0, 1), (3, 1), (5, 1), (13, 1), (15, 1)],
  term ((615388960 : Rat) / 330679773) [(0, 1), (3, 1), (5, 1), (15, 2)],
  term ((4995200000 : Rat) / 110226591) [(0, 1), (3, 1), (7, 1), (11, 1), (15, 1)],
  term ((234150000 : Rat) / 12247399) [(0, 1), (3, 1), (7, 1), (13, 1), (15, 1)],
  term ((-4504600000 : Rat) / 110226591) [(0, 1), (3, 1), (7, 1), (15, 2)],
  term ((902030080 : Rat) / 330679773) [(0, 1), (3, 1), (11, 1)],
  term ((702679040 : Rat) / 110226591) [(0, 1), (3, 1), (11, 1), (13, 1), (15, 1)],
  term ((-1804060160 : Rat) / 330679773) [(0, 1), (3, 1), (11, 1), (14, 1)],
  term ((-70328320 : Rat) / 110226591) [(0, 1), (3, 1), (11, 1), (15, 2)],
  term ((77987840 : Rat) / 110226591) [(0, 1), (3, 1), (11, 2), (15, 1)],
  term ((14094220 : Rat) / 12247399) [(0, 1), (3, 1), (13, 1)],
  term ((-28188440 : Rat) / 12247399) [(0, 1), (3, 1), (13, 1), (14, 1)],
  term ((-603996160 : Rat) / 110226591) [(0, 1), (3, 1), (13, 1), (15, 2)],
  term ((31395840 : Rat) / 12247399) [(0, 1), (3, 1), (13, 2), (15, 1)],
  term ((1626875680 : Rat) / 330679773) [(0, 1), (3, 1), (14, 1), (15, 1)],
  term ((-813437840 : Rat) / 330679773) [(0, 1), (3, 1), (15, 1)],
  term ((341205760 : Rat) / 330679773) [(0, 1), (3, 2), (5, 1), (11, 1)],
  term ((5331340 : Rat) / 12247399) [(0, 1), (3, 2), (5, 1), (13, 1)],
  term ((-307694480 : Rat) / 330679773) [(0, 1), (3, 2), (5, 1), (15, 1)],
  term ((-2497600000 : Rat) / 110226591) [(0, 1), (3, 2), (7, 1), (11, 1)],
  term ((-117075000 : Rat) / 12247399) [(0, 1), (3, 2), (7, 1), (13, 1)],
  term ((2252300000 : Rat) / 110226591) [(0, 1), (3, 2), (7, 1), (15, 1)],
  term ((-351339520 : Rat) / 110226591) [(0, 1), (3, 2), (11, 1), (13, 1)],
  term ((1909552640 : Rat) / 330679773) [(0, 1), (3, 2), (11, 1), (15, 1)],
  term ((-38993920 : Rat) / 110226591) [(0, 1), (3, 2), (11, 2)],
  term ((555694040 : Rat) / 110226591) [(0, 1), (3, 2), (13, 1), (15, 1)],
  term ((-15697920 : Rat) / 12247399) [(0, 1), (3, 2), (13, 2)],
  term ((-1626875680 : Rat) / 330679773) [(0, 1), (3, 2), (15, 2)],
  term ((-902030080 : Rat) / 330679773) [(0, 1), (3, 3), (11, 1)],
  term ((-14094220 : Rat) / 12247399) [(0, 1), (3, 3), (13, 1)],
  term ((813437840 : Rat) / 330679773) [(0, 1), (3, 3), (15, 1)],
  term ((-341205760 : Rat) / 330679773) [(0, 1), (5, 1), (11, 1)],
  term ((682411520 : Rat) / 330679773) [(0, 1), (5, 1), (11, 1), (14, 1)],
  term ((-5331340 : Rat) / 12247399) [(0, 1), (5, 1), (13, 1)],
  term ((10662680 : Rat) / 12247399) [(0, 1), (5, 1), (13, 1), (14, 1)],
  term ((-615388960 : Rat) / 330679773) [(0, 1), (5, 1), (14, 1), (15, 1)],
  term ((307694480 : Rat) / 330679773) [(0, 1), (5, 1), (15, 1)],
  term ((2497600000 : Rat) / 110226591) [(0, 1), (7, 1), (11, 1)],
  term ((-4995200000 : Rat) / 110226591) [(0, 1), (7, 1), (11, 1), (14, 1)],
  term ((117075000 : Rat) / 12247399) [(0, 1), (7, 1), (13, 1)],
  term ((-234150000 : Rat) / 12247399) [(0, 1), (7, 1), (13, 1), (14, 1)],
  term ((4504600000 : Rat) / 110226591) [(0, 1), (7, 1), (14, 1), (15, 1)],
  term ((-2252300000 : Rat) / 110226591) [(0, 1), (7, 1), (15, 1)],
  term ((351339520 : Rat) / 110226591) [(0, 1), (11, 1), (13, 1)],
  term ((-702679040 : Rat) / 110226591) [(0, 1), (11, 1), (13, 1), (14, 1)],
  term ((70328320 : Rat) / 110226591) [(0, 1), (11, 1), (14, 1), (15, 1)],
  term ((-35164160 : Rat) / 110226591) [(0, 1), (11, 1), (15, 1)],
  term ((38993920 : Rat) / 110226591) [(0, 1), (11, 2)],
  term ((-77987840 : Rat) / 110226591) [(0, 1), (11, 2), (14, 1)],
  term ((603996160 : Rat) / 110226591) [(0, 1), (13, 1), (14, 1), (15, 1)],
  term ((-301998080 : Rat) / 110226591) [(0, 1), (13, 1), (15, 1)],
  term ((15697920 : Rat) / 12247399) [(0, 1), (13, 2)],
  term ((-31395840 : Rat) / 12247399) [(0, 1), (13, 2), (14, 1)],
  term ((-1804060160 : Rat) / 330679773) [(1, 1), (2, 1), (3, 1), (11, 1), (15, 1)],
  term ((-28188440 : Rat) / 12247399) [(1, 1), (2, 1), (3, 1), (13, 1), (15, 1)],
  term ((1626875680 : Rat) / 330679773) [(1, 1), (2, 1), (3, 1), (15, 2)],
  term ((902030080 : Rat) / 330679773) [(1, 1), (2, 1), (3, 2), (11, 1)],
  term ((14094220 : Rat) / 12247399) [(1, 1), (2, 1), (3, 2), (13, 1)],
  term ((-813437840 : Rat) / 330679773) [(1, 1), (2, 1), (3, 2), (15, 1)],
  term ((-902030080 : Rat) / 330679773) [(1, 1), (2, 1), (11, 1)],
  term ((-239599360 : Rat) / 12247399) [(1, 1), (2, 1), (11, 1), (14, 1)],
  term ((-14094220 : Rat) / 12247399) [(1, 1), (2, 1), (13, 1)],
  term ((-101080980 : Rat) / 12247399) [(1, 1), (2, 1), (13, 1), (14, 1)],
  term ((216067280 : Rat) / 12247399) [(1, 1), (2, 1), (14, 1), (15, 1)],
  term ((813437840 : Rat) / 330679773) [(1, 1), (2, 1), (15, 1)],
  term ((4136621440 : Rat) / 330679773) [(1, 1), (2, 2), (11, 1)],
  term ((-1804060160 : Rat) / 330679773) [(1, 1), (2, 2), (11, 1), (14, 1)],
  term ((64634710 : Rat) / 12247399) [(1, 1), (2, 2), (13, 1)],
  term ((-28188440 : Rat) / 12247399) [(1, 1), (2, 2), (13, 1), (14, 1)],
  term ((1626875680 : Rat) / 330679773) [(1, 1), (2, 2), (14, 1), (15, 1)],
  term ((-3730346120 : Rat) / 330679773) [(1, 1), (2, 2), (15, 1)],
  term ((902030080 : Rat) / 330679773) [(1, 1), (2, 3), (11, 1)],
  term ((14094220 : Rat) / 12247399) [(1, 1), (2, 3), (13, 1)],
  term ((-813437840 : Rat) / 330679773) [(1, 1), (2, 3), (15, 1)],
  term ((-8273242880 : Rat) / 330679773) [(1, 1), (3, 1), (11, 1), (15, 1)],
  term ((-129269420 : Rat) / 12247399) [(1, 1), (3, 1), (13, 1), (15, 1)],
  term ((7460692240 : Rat) / 330679773) [(1, 1), (3, 1), (15, 2)],
  term ((4136621440 : Rat) / 330679773) [(1, 1), (3, 2), (11, 1)],
  term ((64634710 : Rat) / 12247399) [(1, 1), (3, 2), (13, 1)],
  term ((-3730346120 : Rat) / 330679773) [(1, 1), (3, 2), (15, 1)],
  term ((-4136621440 : Rat) / 330679773) [(1, 1), (11, 1)],
  term ((8273242880 : Rat) / 330679773) [(1, 1), (11, 1), (14, 1)],
  term ((-64634710 : Rat) / 12247399) [(1, 1), (13, 1)],
  term ((129269420 : Rat) / 12247399) [(1, 1), (13, 1), (14, 1)],
  term ((-7460692240 : Rat) / 330679773) [(1, 1), (14, 1), (15, 1)],
  term ((3730346120 : Rat) / 330679773) [(1, 1), (15, 1)],
  term ((635084800 : Rat) / 110226591) [(2, 1), (3, 1), (7, 1), (11, 1), (15, 1)],
  term ((29769600 : Rat) / 12247399) [(2, 1), (3, 1), (7, 1), (13, 1), (15, 1)],
  term ((-572710400 : Rat) / 110226591) [(2, 1), (3, 1), (7, 1), (15, 2)],
  term ((-317542400 : Rat) / 110226591) [(2, 1), (3, 1), (11, 1), (14, 1)],
  term ((-14884800 : Rat) / 12247399) [(2, 1), (3, 1), (13, 1), (14, 1)],
  term ((286355200 : Rat) / 110226591) [(2, 1), (3, 1), (14, 1), (15, 1)],
  term ((-317542400 : Rat) / 110226591) [(2, 1), (3, 2), (7, 1), (11, 1)],
  term ((-14884800 : Rat) / 12247399) [(2, 1), (3, 2), (7, 1), (13, 1)],
  term ((286355200 : Rat) / 110226591) [(2, 1), (3, 2), (7, 1), (15, 1)],
  term ((126730240 : Rat) / 36742197) [(2, 1), (5, 1), (11, 1), (12, 1), (14, 1)],
  term ((722892800 : Rat) / 330679773) [(2, 1), (5, 1), (11, 1), (14, 1)],
  term ((-126730240 : Rat) / 36742197) [(2, 1), (5, 1), (11, 1), (14, 2)],
  term ((17821440 : Rat) / 12247399) [(2, 1), (5, 1), (12, 1), (13, 1), (14, 1)],
  term ((-114283520 : Rat) / 36742197) [(2, 1), (5, 1), (12, 1), (14, 1), (15, 1)],
  term ((11295200 : Rat) / 12247399) [(2, 1), (5, 1), (13, 1), (14, 1)],
  term ((-17821440 : Rat) / 12247399) [(2, 1), (5, 1), (13, 1), (14, 2)],
  term ((-651894400 : Rat) / 330679773) [(2, 1), (5, 1), (14, 1), (15, 1)],
  term ((114283520 : Rat) / 36742197) [(2, 1), (5, 1), (14, 2), (15, 1)],
  term ((317542400 : Rat) / 110226591) [(2, 1), (7, 1), (11, 1)],
  term ((-3806978560 : Rat) / 330679773) [(2, 1), (7, 1), (11, 1), (14, 1)],
  term ((209592320 : Rat) / 110226591) [(2, 1), (7, 1), (11, 1), (14, 2)],
  term ((14884800 : Rat) / 12247399) [(2, 1), (7, 1), (13, 1)],
  term ((-59484040 : Rat) / 12247399) [(2, 1), (7, 1), (13, 1), (14, 1)],
  term ((9824640 : Rat) / 12247399) [(2, 1), (7, 1), (13, 1), (14, 2)],
  term ((3433078880 : Rat) / 330679773) [(2, 1), (7, 1), (14, 1), (15, 1)],
  term ((-189007360 : Rat) / 110226591) [(2, 1), (7, 1), (14, 2), (15, 1)],
  term ((-286355200 : Rat) / 110226591) [(2, 1), (7, 1), (15, 1)],
  term ((13189120 : Rat) / 330679773) [(2, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((377843200 : Rat) / 110226591) [(2, 1), (11, 1), (13, 1), (14, 1)],
  term ((-13189120 : Rat) / 330679773) [(2, 1), (11, 1), (13, 1), (14, 2)],
  term ((-269086720 : Rat) / 330679773) [(2, 1), (11, 1), (14, 1), (15, 1)],
  term ((206080 : Rat) / 12247399) [(2, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-11893760 : Rat) / 330679773) [(2, 1), (12, 1), (14, 1), (15, 2)],
  term ((-378573920 : Rat) / 110226591) [(2, 1), (13, 1), (14, 1), (15, 1)],
  term ((11893760 : Rat) / 330679773) [(2, 1), (13, 1), (14, 2), (15, 1)],
  term ((17711400 : Rat) / 12247399) [(2, 1), (13, 2), (14, 1)],
  term ((-206080 : Rat) / 12247399) [(2, 1), (13, 2), (14, 2)],
  term ((242658560 : Rat) / 330679773) [(2, 1), (14, 1), (15, 2)],
  term ((158771200 : Rat) / 110226591) [(2, 2), (3, 1), (11, 1)],
  term ((7442400 : Rat) / 12247399) [(2, 2), (3, 1), (13, 1)],
  term ((-143177600 : Rat) / 110226591) [(2, 2), (3, 1), (15, 1)],
  term ((-361446400 : Rat) / 330679773) [(2, 2), (5, 1), (11, 1)],
  term ((-63365120 : Rat) / 36742197) [(2, 2), (5, 1), (11, 1), (12, 1)],
  term ((63365120 : Rat) / 36742197) [(2, 2), (5, 1), (11, 1), (14, 1)],
  term ((-8910720 : Rat) / 12247399) [(2, 2), (5, 1), (12, 1), (13, 1)],
  term ((57141760 : Rat) / 36742197) [(2, 2), (5, 1), (12, 1), (15, 1)],
  term ((-5647600 : Rat) / 12247399) [(2, 2), (5, 1), (13, 1)],
  term ((8910720 : Rat) / 12247399) [(2, 2), (5, 1), (13, 1), (14, 1)],
  term ((-57141760 : Rat) / 36742197) [(2, 2), (5, 1), (14, 1), (15, 1)],
  term ((325947200 : Rat) / 330679773) [(2, 2), (5, 1), (15, 1)],
  term ((950862080 : Rat) / 330679773) [(2, 2), (7, 1), (11, 1)],
  term ((58920960 : Rat) / 12247399) [(2, 2), (7, 1), (11, 1), (14, 1)],
  term ((14857220 : Rat) / 12247399) [(2, 2), (7, 1), (13, 1)],
  term ((24857280 : Rat) / 12247399) [(2, 2), (7, 1), (13, 1), (14, 1)],
  term ((-53134080 : Rat) / 12247399) [(2, 2), (7, 1), (14, 1), (15, 1)],
  term ((-857473840 : Rat) / 330679773) [(2, 2), (7, 1), (15, 1)],
  term ((-6594560 : Rat) / 330679773) [(2, 2), (11, 1), (12, 1), (15, 1)],
  term ((-188921600 : Rat) / 110226591) [(2, 2), (11, 1), (13, 1)],
  term ((6594560 : Rat) / 330679773) [(2, 2), (11, 1), (13, 1), (14, 1)],
  term ((134543360 : Rat) / 330679773) [(2, 2), (11, 1), (15, 1)],
  term ((-103040 : Rat) / 12247399) [(2, 2), (12, 1), (13, 1), (15, 1)],
  term ((5946880 : Rat) / 330679773) [(2, 2), (12, 1), (15, 2)],
  term ((-5946880 : Rat) / 330679773) [(2, 2), (13, 1), (14, 1), (15, 1)],
  term ((189286960 : Rat) / 110226591) [(2, 2), (13, 1), (15, 1)],
  term ((-8855700 : Rat) / 12247399) [(2, 2), (13, 2)],
  term ((103040 : Rat) / 12247399) [(2, 2), (13, 2), (14, 1)],
  term ((-121329280 : Rat) / 330679773) [(2, 2), (15, 2)],
  term ((-317542400 : Rat) / 110226591) [(2, 3), (7, 1), (11, 1)],
  term ((-14884800 : Rat) / 12247399) [(2, 3), (7, 1), (13, 1)],
  term ((286355200 : Rat) / 110226591) [(2, 3), (7, 1), (15, 1)],
  term ((126730240 : Rat) / 36742197) [(3, 1), (5, 1), (11, 1), (12, 1), (15, 1)],
  term ((-126730240 : Rat) / 36742197) [(3, 1), (5, 1), (11, 1), (14, 1), (15, 1)],
  term ((722892800 : Rat) / 330679773) [(3, 1), (5, 1), (11, 1), (15, 1)],
  term ((17821440 : Rat) / 12247399) [(3, 1), (5, 1), (12, 1), (13, 1), (15, 1)],
  term ((-114283520 : Rat) / 36742197) [(3, 1), (5, 1), (12, 1), (15, 2)],
  term ((-17821440 : Rat) / 12247399) [(3, 1), (5, 1), (13, 1), (14, 1), (15, 1)],
  term ((11295200 : Rat) / 12247399) [(3, 1), (5, 1), (13, 1), (15, 1)],
  term ((114283520 : Rat) / 36742197) [(3, 1), (5, 1), (14, 1), (15, 2)],
  term ((-651894400 : Rat) / 330679773) [(3, 1), (5, 1), (15, 2)],
  term ((209592320 : Rat) / 110226591) [(3, 1), (7, 1), (11, 1), (14, 1), (15, 1)],
  term ((-1901724160 : Rat) / 330679773) [(3, 1), (7, 1), (11, 1), (15, 1)],
  term ((9824640 : Rat) / 12247399) [(3, 1), (7, 1), (13, 1), (14, 1), (15, 1)],
  term ((-29714440 : Rat) / 12247399) [(3, 1), (7, 1), (13, 1), (15, 1)],
  term ((-189007360 : Rat) / 110226591) [(3, 1), (7, 1), (14, 1), (15, 2)],
  term ((1714947680 : Rat) / 330679773) [(3, 1), (7, 1), (15, 2)],
  term ((-158771200 : Rat) / 110226591) [(3, 1), (11, 1)],
  term ((13189120 : Rat) / 330679773) [(3, 1), (11, 1), (12, 1), (15, 2)],
  term ((-13189120 : Rat) / 330679773) [(3, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((377843200 : Rat) / 110226591) [(3, 1), (11, 1), (13, 1), (15, 1)],
  term ((317542400 : Rat) / 110226591) [(3, 1), (11, 1), (14, 1)],
  term ((-269086720 : Rat) / 330679773) [(3, 1), (11, 1), (15, 2)],
  term ((206080 : Rat) / 12247399) [(3, 1), (12, 1), (13, 1), (15, 2)],
  term ((-11893760 : Rat) / 330679773) [(3, 1), (12, 1), (15, 3)],
  term ((-7442400 : Rat) / 12247399) [(3, 1), (13, 1)],
  term ((14884800 : Rat) / 12247399) [(3, 1), (13, 1), (14, 1)],
  term ((11893760 : Rat) / 330679773) [(3, 1), (13, 1), (14, 1), (15, 2)],
  term ((-378573920 : Rat) / 110226591) [(3, 1), (13, 1), (15, 2)],
  term ((-206080 : Rat) / 12247399) [(3, 1), (13, 2), (14, 1), (15, 1)],
  term ((17711400 : Rat) / 12247399) [(3, 1), (13, 2), (15, 1)],
  term ((-286355200 : Rat) / 110226591) [(3, 1), (14, 1), (15, 1)],
  term ((143177600 : Rat) / 110226591) [(3, 1), (15, 1)],
  term ((242658560 : Rat) / 330679773) [(3, 1), (15, 3)],
  term ((-361446400 : Rat) / 330679773) [(3, 2), (5, 1), (11, 1)],
  term ((-63365120 : Rat) / 36742197) [(3, 2), (5, 1), (11, 1), (12, 1)],
  term ((63365120 : Rat) / 36742197) [(3, 2), (5, 1), (11, 1), (14, 1)],
  term ((-8910720 : Rat) / 12247399) [(3, 2), (5, 1), (12, 1), (13, 1)],
  term ((57141760 : Rat) / 36742197) [(3, 2), (5, 1), (12, 1), (15, 1)],
  term ((-5647600 : Rat) / 12247399) [(3, 2), (5, 1), (13, 1)],
  term ((8910720 : Rat) / 12247399) [(3, 2), (5, 1), (13, 1), (14, 1)],
  term ((-57141760 : Rat) / 36742197) [(3, 2), (5, 1), (14, 1), (15, 1)],
  term ((325947200 : Rat) / 330679773) [(3, 2), (5, 1), (15, 1)],
  term ((950862080 : Rat) / 330679773) [(3, 2), (7, 1), (11, 1)],
  term ((-104796160 : Rat) / 110226591) [(3, 2), (7, 1), (11, 1), (14, 1)],
  term ((14857220 : Rat) / 12247399) [(3, 2), (7, 1), (13, 1)],
  term ((-4912320 : Rat) / 12247399) [(3, 2), (7, 1), (13, 1), (14, 1)],
  term ((94503680 : Rat) / 110226591) [(3, 2), (7, 1), (14, 1), (15, 1)],
  term ((-857473840 : Rat) / 330679773) [(3, 2), (7, 1), (15, 1)],
  term ((-6594560 : Rat) / 330679773) [(3, 2), (11, 1), (12, 1), (15, 1)],
  term ((-188921600 : Rat) / 110226591) [(3, 2), (11, 1), (13, 1)],
  term ((6594560 : Rat) / 330679773) [(3, 2), (11, 1), (13, 1), (14, 1)],
  term ((-818083840 : Rat) / 330679773) [(3, 2), (11, 1), (15, 1)],
  term ((-103040 : Rat) / 12247399) [(3, 2), (12, 1), (13, 1), (15, 1)],
  term ((5946880 : Rat) / 330679773) [(3, 2), (12, 1), (15, 2)],
  term ((-5946880 : Rat) / 330679773) [(3, 2), (13, 1), (14, 1), (15, 1)],
  term ((55323760 : Rat) / 110226591) [(3, 2), (13, 1), (15, 1)],
  term ((-8855700 : Rat) / 12247399) [(3, 2), (13, 2)],
  term ((103040 : Rat) / 12247399) [(3, 2), (13, 2), (14, 1)],
  term ((737736320 : Rat) / 330679773) [(3, 2), (15, 2)],
  term ((158771200 : Rat) / 110226591) [(3, 3), (11, 1)],
  term ((7442400 : Rat) / 12247399) [(3, 3), (13, 1)],
  term ((-143177600 : Rat) / 110226591) [(3, 3), (15, 1)],
  term ((361446400 : Rat) / 330679773) [(5, 1), (11, 1)],
  term ((63365120 : Rat) / 36742197) [(5, 1), (11, 1), (12, 1)],
  term ((-126730240 : Rat) / 36742197) [(5, 1), (11, 1), (12, 1), (14, 1)],
  term ((-1293178880 : Rat) / 330679773) [(5, 1), (11, 1), (14, 1)],
  term ((126730240 : Rat) / 36742197) [(5, 1), (11, 1), (14, 2)],
  term ((8910720 : Rat) / 12247399) [(5, 1), (12, 1), (13, 1)],
  term ((-17821440 : Rat) / 12247399) [(5, 1), (12, 1), (13, 1), (14, 1)],
  term ((114283520 : Rat) / 36742197) [(5, 1), (12, 1), (14, 1), (15, 1)],
  term ((-57141760 : Rat) / 36742197) [(5, 1), (12, 1), (15, 1)],
  term ((5647600 : Rat) / 12247399) [(5, 1), (13, 1)],
  term ((-20205920 : Rat) / 12247399) [(5, 1), (13, 1), (14, 1)],
  term ((17821440 : Rat) / 12247399) [(5, 1), (13, 1), (14, 2)],
  term ((1166170240 : Rat) / 330679773) [(5, 1), (14, 1), (15, 1)],
  term ((-114283520 : Rat) / 36742197) [(5, 1), (14, 2), (15, 1)],
  term ((-325947200 : Rat) / 330679773) [(5, 1), (15, 1)],
  term ((-950862080 : Rat) / 330679773) [(7, 1), (11, 1)],
  term ((2216112640 : Rat) / 330679773) [(7, 1), (11, 1), (14, 1)],
  term ((-209592320 : Rat) / 110226591) [(7, 1), (11, 1), (14, 2)],
  term ((-14857220 : Rat) / 12247399) [(7, 1), (13, 1)],
  term ((34626760 : Rat) / 12247399) [(7, 1), (13, 1), (14, 1)],
  term ((-9824640 : Rat) / 12247399) [(7, 1), (13, 1), (14, 2)],
  term ((-1998458720 : Rat) / 330679773) [(7, 1), (14, 1), (15, 1)],
  term ((189007360 : Rat) / 110226591) [(7, 1), (14, 2), (15, 1)],
  term ((857473840 : Rat) / 330679773) [(7, 1), (15, 1)],
  term ((-13189120 : Rat) / 330679773) [(11, 1), (12, 1), (14, 1), (15, 1)],
  term ((6594560 : Rat) / 330679773) [(11, 1), (12, 1), (15, 1)],
  term ((188921600 : Rat) / 110226591) [(11, 1), (13, 1)],
  term ((-1140124160 : Rat) / 330679773) [(11, 1), (13, 1), (14, 1)],
  term ((13189120 : Rat) / 330679773) [(11, 1), (13, 1), (14, 2)],
  term ((269086720 : Rat) / 330679773) [(11, 1), (14, 1), (15, 1)],
  term ((-134543360 : Rat) / 330679773) [(11, 1), (15, 1)],
  term ((-206080 : Rat) / 12247399) [(12, 1), (13, 1), (14, 1), (15, 1)],
  term ((103040 : Rat) / 12247399) [(12, 1), (13, 1), (15, 1)],
  term ((11893760 : Rat) / 330679773) [(12, 1), (14, 1), (15, 2)],
  term ((-5946880 : Rat) / 330679773) [(12, 1), (15, 2)],
  term ((1141668640 : Rat) / 330679773) [(13, 1), (14, 1), (15, 1)],
  term ((-11893760 : Rat) / 330679773) [(13, 1), (14, 2), (15, 1)],
  term ((-189286960 : Rat) / 110226591) [(13, 1), (15, 1)],
  term ((8855700 : Rat) / 12247399) [(13, 2)],
  term ((-17814440 : Rat) / 12247399) [(13, 2), (14, 1)],
  term ((206080 : Rat) / 12247399) [(13, 2), (14, 2)],
  term ((-242658560 : Rat) / 330679773) [(14, 1), (15, 2)],
  term ((121329280 : Rat) / 330679773) [(15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 28, terms 0 through 51. -/
theorem rs_R009_ueqv_R009NNNYN_block_28_0000_0051_valid :
    checkProductSumEq rs_R009_ueqv_R009NNNYN_partials_28_0000_0051
      rs_R009_ueqv_R009NNNYN_block_28_0000_0051 = true := by
  native_decide

end R009UeqvR009NNNYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
