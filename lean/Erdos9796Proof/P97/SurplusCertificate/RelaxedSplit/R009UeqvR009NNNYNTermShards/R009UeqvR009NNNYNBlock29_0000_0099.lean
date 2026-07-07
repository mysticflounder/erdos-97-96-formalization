/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NNNYN, term block 29:0-99

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NNNYNTermShards

/-- Generator polynomial 29 for relaxed split surplus certificate `R009:u=v:R009NNNYN`. -/
def rs_R009_ueqv_R009NNNYN_generator_29_0000_0099 : Poly :=
[
  term (1 : Rat) [],
  term (2 : Rat) [(10, 1), (14, 1)],
  term (-1 : Rat) [(10, 2)],
  term (2 : Rat) [(11, 1), (15, 1)],
  term (-1 : Rat) [(11, 2)],
  term (-2 : Rat) [(14, 1)]
]

/-- Coefficient term 0 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0000 : Poly :=
[
  term ((-1369 : Rat) / 536) []
]

/-- Partial product 0 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0000 : Poly :=
[
  term ((-1369 : Rat) / 536) [],
  term ((-1369 : Rat) / 268) [(10, 1), (14, 1)],
  term ((1369 : Rat) / 536) [(10, 2)],
  term ((-1369 : Rat) / 268) [(11, 1), (15, 1)],
  term ((1369 : Rat) / 536) [(11, 2)],
  term ((1369 : Rat) / 268) [(14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0000_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0000
        rs_R009_ueqv_R009NNNYN_generator_29_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_29_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0001 : Poly :=
[
  term ((-780442880 : Rat) / 330679773) [(0, 1), (2, 1), (11, 1), (15, 1)]
]

/-- Partial product 1 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0001 : Poly :=
[
  term ((-1560885760 : Rat) / 330679773) [(0, 1), (2, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((780442880 : Rat) / 330679773) [(0, 1), (2, 1), (10, 2), (11, 1), (15, 1)],
  term ((1560885760 : Rat) / 330679773) [(0, 1), (2, 1), (11, 1), (14, 1), (15, 1)],
  term ((-780442880 : Rat) / 330679773) [(0, 1), (2, 1), (11, 1), (15, 1)],
  term ((-1560885760 : Rat) / 330679773) [(0, 1), (2, 1), (11, 2), (15, 2)],
  term ((780442880 : Rat) / 330679773) [(0, 1), (2, 1), (11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0001_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0001
        rs_R009_ueqv_R009NNNYN_generator_29_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_29_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0002 : Poly :=
[
  term ((-12194420 : Rat) / 12247399) [(0, 1), (2, 1), (13, 1), (15, 1)]
]

/-- Partial product 2 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0002 : Poly :=
[
  term ((-24388840 : Rat) / 12247399) [(0, 1), (2, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((12194420 : Rat) / 12247399) [(0, 1), (2, 1), (10, 2), (13, 1), (15, 1)],
  term ((-24388840 : Rat) / 12247399) [(0, 1), (2, 1), (11, 1), (13, 1), (15, 2)],
  term ((12194420 : Rat) / 12247399) [(0, 1), (2, 1), (11, 2), (13, 1), (15, 1)],
  term ((24388840 : Rat) / 12247399) [(0, 1), (2, 1), (13, 1), (14, 1), (15, 1)],
  term ((-12194420 : Rat) / 12247399) [(0, 1), (2, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0002_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0002
        rs_R009_ueqv_R009NNNYN_generator_29_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_29_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0003 : Poly :=
[
  term ((703792240 : Rat) / 330679773) [(0, 1), (2, 1), (15, 2)]
]

/-- Partial product 3 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0003 : Poly :=
[
  term ((1407584480 : Rat) / 330679773) [(0, 1), (2, 1), (10, 1), (14, 1), (15, 2)],
  term ((-703792240 : Rat) / 330679773) [(0, 1), (2, 1), (10, 2), (15, 2)],
  term ((1407584480 : Rat) / 330679773) [(0, 1), (2, 1), (11, 1), (15, 3)],
  term ((-703792240 : Rat) / 330679773) [(0, 1), (2, 1), (11, 2), (15, 2)],
  term ((-1407584480 : Rat) / 330679773) [(0, 1), (2, 1), (14, 1), (15, 2)],
  term ((703792240 : Rat) / 330679773) [(0, 1), (2, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0003_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0003
        rs_R009_ueqv_R009NNNYN_generator_29_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_29_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0004 : Poly :=
[
  term ((-373882880 : Rat) / 110226591) [(0, 1), (3, 1), (11, 1)]
]

/-- Partial product 4 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0004 : Poly :=
[
  term ((-747765760 : Rat) / 110226591) [(0, 1), (3, 1), (10, 1), (11, 1), (14, 1)],
  term ((373882880 : Rat) / 110226591) [(0, 1), (3, 1), (10, 2), (11, 1)],
  term ((-373882880 : Rat) / 110226591) [(0, 1), (3, 1), (11, 1)],
  term ((747765760 : Rat) / 110226591) [(0, 1), (3, 1), (11, 1), (14, 1)],
  term ((-747765760 : Rat) / 110226591) [(0, 1), (3, 1), (11, 2), (15, 1)],
  term ((373882880 : Rat) / 110226591) [(0, 1), (3, 1), (11, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0004_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0004
        rs_R009_ueqv_R009NNNYN_generator_29_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_29_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0005 : Poly :=
[
  term ((373882880 : Rat) / 110226591) [(0, 1), (3, 1), (11, 1), (14, 1)]
]

/-- Partial product 5 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0005 : Poly :=
[
  term ((747765760 : Rat) / 110226591) [(0, 1), (3, 1), (10, 1), (11, 1), (14, 2)],
  term ((-373882880 : Rat) / 110226591) [(0, 1), (3, 1), (10, 2), (11, 1), (14, 1)],
  term ((373882880 : Rat) / 110226591) [(0, 1), (3, 1), (11, 1), (14, 1)],
  term ((-747765760 : Rat) / 110226591) [(0, 1), (3, 1), (11, 1), (14, 2)],
  term ((747765760 : Rat) / 110226591) [(0, 1), (3, 1), (11, 2), (14, 1), (15, 1)],
  term ((-373882880 : Rat) / 110226591) [(0, 1), (3, 1), (11, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0005_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0005
        rs_R009_ueqv_R009NNNYN_generator_29_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_29_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0006 : Poly :=
[
  term ((-17525760 : Rat) / 12247399) [(0, 1), (3, 1), (13, 1)]
]

/-- Partial product 6 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0006 : Poly :=
[
  term ((-35051520 : Rat) / 12247399) [(0, 1), (3, 1), (10, 1), (13, 1), (14, 1)],
  term ((17525760 : Rat) / 12247399) [(0, 1), (3, 1), (10, 2), (13, 1)],
  term ((-35051520 : Rat) / 12247399) [(0, 1), (3, 1), (11, 1), (13, 1), (15, 1)],
  term ((17525760 : Rat) / 12247399) [(0, 1), (3, 1), (11, 2), (13, 1)],
  term ((-17525760 : Rat) / 12247399) [(0, 1), (3, 1), (13, 1)],
  term ((35051520 : Rat) / 12247399) [(0, 1), (3, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0006_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0006
        rs_R009_ueqv_R009NNNYN_generator_29_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_29_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0007 : Poly :=
[
  term ((17525760 : Rat) / 12247399) [(0, 1), (3, 1), (13, 1), (14, 1)]
]

/-- Partial product 7 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0007 : Poly :=
[
  term ((35051520 : Rat) / 12247399) [(0, 1), (3, 1), (10, 1), (13, 1), (14, 2)],
  term ((-17525760 : Rat) / 12247399) [(0, 1), (3, 1), (10, 2), (13, 1), (14, 1)],
  term ((35051520 : Rat) / 12247399) [(0, 1), (3, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-17525760 : Rat) / 12247399) [(0, 1), (3, 1), (11, 2), (13, 1), (14, 1)],
  term ((17525760 : Rat) / 12247399) [(0, 1), (3, 1), (13, 1), (14, 1)],
  term ((-35051520 : Rat) / 12247399) [(0, 1), (3, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0007_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0007
        rs_R009_ueqv_R009NNNYN_generator_29_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_29_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0008 : Poly :=
[
  term ((-337162240 : Rat) / 110226591) [(0, 1), (3, 1), (14, 1), (15, 1)]
]

/-- Partial product 8 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0008 : Poly :=
[
  term ((-674324480 : Rat) / 110226591) [(0, 1), (3, 1), (10, 1), (14, 2), (15, 1)],
  term ((337162240 : Rat) / 110226591) [(0, 1), (3, 1), (10, 2), (14, 1), (15, 1)],
  term ((-674324480 : Rat) / 110226591) [(0, 1), (3, 1), (11, 1), (14, 1), (15, 2)],
  term ((337162240 : Rat) / 110226591) [(0, 1), (3, 1), (11, 2), (14, 1), (15, 1)],
  term ((-337162240 : Rat) / 110226591) [(0, 1), (3, 1), (14, 1), (15, 1)],
  term ((674324480 : Rat) / 110226591) [(0, 1), (3, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0008_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0008
        rs_R009_ueqv_R009NNNYN_generator_29_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_29_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0009 : Poly :=
[
  term ((337162240 : Rat) / 110226591) [(0, 1), (3, 1), (15, 1)]
]

/-- Partial product 9 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0009 : Poly :=
[
  term ((674324480 : Rat) / 110226591) [(0, 1), (3, 1), (10, 1), (14, 1), (15, 1)],
  term ((-337162240 : Rat) / 110226591) [(0, 1), (3, 1), (10, 2), (15, 1)],
  term ((674324480 : Rat) / 110226591) [(0, 1), (3, 1), (11, 1), (15, 2)],
  term ((-337162240 : Rat) / 110226591) [(0, 1), (3, 1), (11, 2), (15, 1)],
  term ((-674324480 : Rat) / 110226591) [(0, 1), (3, 1), (14, 1), (15, 1)],
  term ((337162240 : Rat) / 110226591) [(0, 1), (3, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0009_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0009
        rs_R009_ueqv_R009NNNYN_generator_29_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_29_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0010 : Poly :=
[
  term ((1936083968 : Rat) / 110226591) [(0, 1), (4, 1), (11, 1), (15, 1)]
]

/-- Partial product 10 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0010 : Poly :=
[
  term ((3872167936 : Rat) / 110226591) [(0, 1), (4, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-1936083968 : Rat) / 110226591) [(0, 1), (4, 1), (10, 2), (11, 1), (15, 1)],
  term ((-3872167936 : Rat) / 110226591) [(0, 1), (4, 1), (11, 1), (14, 1), (15, 1)],
  term ((1936083968 : Rat) / 110226591) [(0, 1), (4, 1), (11, 1), (15, 1)],
  term ((3872167936 : Rat) / 110226591) [(0, 1), (4, 1), (11, 2), (15, 2)],
  term ((-1936083968 : Rat) / 110226591) [(0, 1), (4, 1), (11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0010_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0010
        rs_R009_ueqv_R009NNNYN_generator_29_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_29_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0011 : Poly :=
[
  term ((90753936 : Rat) / 12247399) [(0, 1), (4, 1), (13, 1), (15, 1)]
]

/-- Partial product 11 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0011 : Poly :=
[
  term ((181507872 : Rat) / 12247399) [(0, 1), (4, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-90753936 : Rat) / 12247399) [(0, 1), (4, 1), (10, 2), (13, 1), (15, 1)],
  term ((181507872 : Rat) / 12247399) [(0, 1), (4, 1), (11, 1), (13, 1), (15, 2)],
  term ((-90753936 : Rat) / 12247399) [(0, 1), (4, 1), (11, 2), (13, 1), (15, 1)],
  term ((-181507872 : Rat) / 12247399) [(0, 1), (4, 1), (13, 1), (14, 1), (15, 1)],
  term ((90753936 : Rat) / 12247399) [(0, 1), (4, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0011_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0011
        rs_R009_ueqv_R009NNNYN_generator_29_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_29_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0012 : Poly :=
[
  term ((-1745932864 : Rat) / 110226591) [(0, 1), (4, 1), (15, 2)]
]

/-- Partial product 12 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0012 : Poly :=
[
  term ((-3491865728 : Rat) / 110226591) [(0, 1), (4, 1), (10, 1), (14, 1), (15, 2)],
  term ((1745932864 : Rat) / 110226591) [(0, 1), (4, 1), (10, 2), (15, 2)],
  term ((-3491865728 : Rat) / 110226591) [(0, 1), (4, 1), (11, 1), (15, 3)],
  term ((1745932864 : Rat) / 110226591) [(0, 1), (4, 1), (11, 2), (15, 2)],
  term ((3491865728 : Rat) / 110226591) [(0, 1), (4, 1), (14, 1), (15, 2)],
  term ((-1745932864 : Rat) / 110226591) [(0, 1), (4, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0012_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0012
        rs_R009_ueqv_R009NNNYN_generator_29_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_29_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0013 : Poly :=
[
  term ((1176 : Rat) / 67) [(0, 1), (5, 1), (9, 1)]
]

/-- Partial product 13 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0013 : Poly :=
[
  term ((1176 : Rat) / 67) [(0, 1), (5, 1), (9, 1)],
  term ((2352 : Rat) / 67) [(0, 1), (5, 1), (9, 1), (10, 1), (14, 1)],
  term ((-1176 : Rat) / 67) [(0, 1), (5, 1), (9, 1), (10, 2)],
  term ((2352 : Rat) / 67) [(0, 1), (5, 1), (9, 1), (11, 1), (15, 1)],
  term ((-1176 : Rat) / 67) [(0, 1), (5, 1), (9, 1), (11, 2)],
  term ((-2352 : Rat) / 67) [(0, 1), (5, 1), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0013_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0013
        rs_R009_ueqv_R009NNNYN_generator_29_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_29_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0014 : Poly :=
[
  term ((7364462876288 : Rat) / 94243735305) [(0, 1), (5, 1), (11, 1)]
]

/-- Partial product 14 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0014 : Poly :=
[
  term ((14728925752576 : Rat) / 94243735305) [(0, 1), (5, 1), (10, 1), (11, 1), (14, 1)],
  term ((-7364462876288 : Rat) / 94243735305) [(0, 1), (5, 1), (10, 2), (11, 1)],
  term ((7364462876288 : Rat) / 94243735305) [(0, 1), (5, 1), (11, 1)],
  term ((-14728925752576 : Rat) / 94243735305) [(0, 1), (5, 1), (11, 1), (14, 1)],
  term ((14728925752576 : Rat) / 94243735305) [(0, 1), (5, 1), (11, 2), (15, 1)],
  term ((-7364462876288 : Rat) / 94243735305) [(0, 1), (5, 1), (11, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0014_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0014
        rs_R009_ueqv_R009NNNYN_generator_29_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_29_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0015 : Poly :=
[
  term ((77987840 : Rat) / 110226591) [(0, 1), (5, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 15 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0015 : Poly :=
[
  term ((155975680 : Rat) / 110226591) [(0, 1), (5, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-77987840 : Rat) / 110226591) [(0, 1), (5, 1), (10, 2), (11, 1), (13, 1), (15, 1)],
  term ((-155975680 : Rat) / 110226591) [(0, 1), (5, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((77987840 : Rat) / 110226591) [(0, 1), (5, 1), (11, 1), (13, 1), (15, 1)],
  term ((155975680 : Rat) / 110226591) [(0, 1), (5, 1), (11, 2), (13, 1), (15, 2)],
  term ((-77987840 : Rat) / 110226591) [(0, 1), (5, 1), (11, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0015_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0015
        rs_R009_ueqv_R009NNNYN_generator_29_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_29_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0016 : Poly :=
[
  term ((-1936083968 : Rat) / 110226591) [(0, 1), (5, 1), (11, 1), (14, 1)]
]

/-- Partial product 16 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0016 : Poly :=
[
  term ((-3872167936 : Rat) / 110226591) [(0, 1), (5, 1), (10, 1), (11, 1), (14, 2)],
  term ((1936083968 : Rat) / 110226591) [(0, 1), (5, 1), (10, 2), (11, 1), (14, 1)],
  term ((-1936083968 : Rat) / 110226591) [(0, 1), (5, 1), (11, 1), (14, 1)],
  term ((3872167936 : Rat) / 110226591) [(0, 1), (5, 1), (11, 1), (14, 2)],
  term ((-3872167936 : Rat) / 110226591) [(0, 1), (5, 1), (11, 2), (14, 1), (15, 1)],
  term ((1936083968 : Rat) / 110226591) [(0, 1), (5, 1), (11, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0016_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0016
        rs_R009_ueqv_R009NNNYN_generator_29_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_29_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0017 : Poly :=
[
  term ((-38993920 : Rat) / 36742197) [(0, 1), (5, 1), (11, 1), (15, 2)]
]

/-- Partial product 17 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0017 : Poly :=
[
  term ((-77987840 : Rat) / 36742197) [(0, 1), (5, 1), (10, 1), (11, 1), (14, 1), (15, 2)],
  term ((38993920 : Rat) / 36742197) [(0, 1), (5, 1), (10, 2), (11, 1), (15, 2)],
  term ((77987840 : Rat) / 36742197) [(0, 1), (5, 1), (11, 1), (14, 1), (15, 2)],
  term ((-38993920 : Rat) / 36742197) [(0, 1), (5, 1), (11, 1), (15, 2)],
  term ((-77987840 : Rat) / 36742197) [(0, 1), (5, 1), (11, 2), (15, 3)],
  term ((38993920 : Rat) / 36742197) [(0, 1), (5, 1), (11, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0017_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0017
        rs_R009_ueqv_R009NNNYN_generator_29_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_29_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0018 : Poly :=
[
  term ((115069732442 : Rat) / 3490508715) [(0, 1), (5, 1), (13, 1)]
]

/-- Partial product 18 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0018 : Poly :=
[
  term ((230139464884 : Rat) / 3490508715) [(0, 1), (5, 1), (10, 1), (13, 1), (14, 1)],
  term ((-115069732442 : Rat) / 3490508715) [(0, 1), (5, 1), (10, 2), (13, 1)],
  term ((230139464884 : Rat) / 3490508715) [(0, 1), (5, 1), (11, 1), (13, 1), (15, 1)],
  term ((-115069732442 : Rat) / 3490508715) [(0, 1), (5, 1), (11, 2), (13, 1)],
  term ((115069732442 : Rat) / 3490508715) [(0, 1), (5, 1), (13, 1)],
  term ((-230139464884 : Rat) / 3490508715) [(0, 1), (5, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0018_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0018
        rs_R009_ueqv_R009NNNYN_generator_29_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_29_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0019 : Poly :=
[
  term ((-90753936 : Rat) / 12247399) [(0, 1), (5, 1), (13, 1), (14, 1)]
]

/-- Partial product 19 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0019 : Poly :=
[
  term ((-181507872 : Rat) / 12247399) [(0, 1), (5, 1), (10, 1), (13, 1), (14, 2)],
  term ((90753936 : Rat) / 12247399) [(0, 1), (5, 1), (10, 2), (13, 1), (14, 1)],
  term ((-181507872 : Rat) / 12247399) [(0, 1), (5, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((90753936 : Rat) / 12247399) [(0, 1), (5, 1), (11, 2), (13, 1), (14, 1)],
  term ((-90753936 : Rat) / 12247399) [(0, 1), (5, 1), (13, 1), (14, 1)],
  term ((181507872 : Rat) / 12247399) [(0, 1), (5, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0019_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0019
        rs_R009_ueqv_R009NNNYN_generator_29_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_29_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0020 : Poly :=
[
  term ((-119680000 : Rat) / 110226591) [(0, 1), (5, 1), (13, 1), (15, 2)]
]

/-- Partial product 20 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0020 : Poly :=
[
  term ((-239360000 : Rat) / 110226591) [(0, 1), (5, 1), (10, 1), (13, 1), (14, 1), (15, 2)],
  term ((119680000 : Rat) / 110226591) [(0, 1), (5, 1), (10, 2), (13, 1), (15, 2)],
  term ((-239360000 : Rat) / 110226591) [(0, 1), (5, 1), (11, 1), (13, 1), (15, 3)],
  term ((119680000 : Rat) / 110226591) [(0, 1), (5, 1), (11, 2), (13, 1), (15, 2)],
  term ((239360000 : Rat) / 110226591) [(0, 1), (5, 1), (13, 1), (14, 1), (15, 2)],
  term ((-119680000 : Rat) / 110226591) [(0, 1), (5, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0020_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0020
        rs_R009_ueqv_R009NNNYN_generator_29_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_29_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0021 : Poly :=
[
  term ((3655680 : Rat) / 12247399) [(0, 1), (5, 1), (13, 2), (15, 1)]
]

/-- Partial product 21 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0021 : Poly :=
[
  term ((7311360 : Rat) / 12247399) [(0, 1), (5, 1), (10, 1), (13, 2), (14, 1), (15, 1)],
  term ((-3655680 : Rat) / 12247399) [(0, 1), (5, 1), (10, 2), (13, 2), (15, 1)],
  term ((7311360 : Rat) / 12247399) [(0, 1), (5, 1), (11, 1), (13, 2), (15, 2)],
  term ((-3655680 : Rat) / 12247399) [(0, 1), (5, 1), (11, 2), (13, 2), (15, 1)],
  term ((-7311360 : Rat) / 12247399) [(0, 1), (5, 1), (13, 2), (14, 1), (15, 1)],
  term ((3655680 : Rat) / 12247399) [(0, 1), (5, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0021_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0021
        rs_R009_ueqv_R009NNNYN_generator_29_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_29_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0022 : Poly :=
[
  term ((1745932864 : Rat) / 110226591) [(0, 1), (5, 1), (14, 1), (15, 1)]
]

/-- Partial product 22 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0022 : Poly :=
[
  term ((3491865728 : Rat) / 110226591) [(0, 1), (5, 1), (10, 1), (14, 2), (15, 1)],
  term ((-1745932864 : Rat) / 110226591) [(0, 1), (5, 1), (10, 2), (14, 1), (15, 1)],
  term ((3491865728 : Rat) / 110226591) [(0, 1), (5, 1), (11, 1), (14, 1), (15, 2)],
  term ((-1745932864 : Rat) / 110226591) [(0, 1), (5, 1), (11, 2), (14, 1), (15, 1)],
  term ((1745932864 : Rat) / 110226591) [(0, 1), (5, 1), (14, 1), (15, 1)],
  term ((-3491865728 : Rat) / 110226591) [(0, 1), (5, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0022_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0022
        rs_R009_ueqv_R009NNNYN_generator_29_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_29_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0023 : Poly :=
[
  term ((-6089771232544 : Rat) / 94243735305) [(0, 1), (5, 1), (15, 1)]
]

/-- Partial product 23 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0023 : Poly :=
[
  term ((-12179542465088 : Rat) / 94243735305) [(0, 1), (5, 1), (10, 1), (14, 1), (15, 1)],
  term ((6089771232544 : Rat) / 94243735305) [(0, 1), (5, 1), (10, 2), (15, 1)],
  term ((-12179542465088 : Rat) / 94243735305) [(0, 1), (5, 1), (11, 1), (15, 2)],
  term ((6089771232544 : Rat) / 94243735305) [(0, 1), (5, 1), (11, 2), (15, 1)],
  term ((12179542465088 : Rat) / 94243735305) [(0, 1), (5, 1), (14, 1), (15, 1)],
  term ((-6089771232544 : Rat) / 94243735305) [(0, 1), (5, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0023_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0023
        rs_R009_ueqv_R009NNNYN_generator_29_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_29_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0024 : Poly :=
[
  term ((35164160 : Rat) / 36742197) [(0, 1), (5, 1), (15, 3)]
]

/-- Partial product 24 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0024 : Poly :=
[
  term ((70328320 : Rat) / 36742197) [(0, 1), (5, 1), (10, 1), (14, 1), (15, 3)],
  term ((-35164160 : Rat) / 36742197) [(0, 1), (5, 1), (10, 2), (15, 3)],
  term ((70328320 : Rat) / 36742197) [(0, 1), (5, 1), (11, 1), (15, 4)],
  term ((-35164160 : Rat) / 36742197) [(0, 1), (5, 1), (11, 2), (15, 3)],
  term ((-70328320 : Rat) / 36742197) [(0, 1), (5, 1), (14, 1), (15, 3)],
  term ((35164160 : Rat) / 36742197) [(0, 1), (5, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0024_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0024
        rs_R009_ueqv_R009NNNYN_generator_29_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_29_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0025 : Poly :=
[
  term ((-1882381312 : Rat) / 36742197) [(0, 1), (7, 1), (11, 1)]
]

/-- Partial product 25 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0025 : Poly :=
[
  term ((-3764762624 : Rat) / 36742197) [(0, 1), (7, 1), (10, 1), (11, 1), (14, 1)],
  term ((1882381312 : Rat) / 36742197) [(0, 1), (7, 1), (10, 2), (11, 1)],
  term ((-1882381312 : Rat) / 36742197) [(0, 1), (7, 1), (11, 1)],
  term ((3764762624 : Rat) / 36742197) [(0, 1), (7, 1), (11, 1), (14, 1)],
  term ((-3764762624 : Rat) / 36742197) [(0, 1), (7, 1), (11, 2), (15, 1)],
  term ((1882381312 : Rat) / 36742197) [(0, 1), (7, 1), (11, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0025_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0025
        rs_R009_ueqv_R009NNNYN_generator_29_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_29_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0026 : Poly :=
[
  term ((7426280960 : Rat) / 330679773) [(0, 1), (7, 1), (11, 1), (14, 1)]
]

/-- Partial product 26 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0026 : Poly :=
[
  term ((14852561920 : Rat) / 330679773) [(0, 1), (7, 1), (10, 1), (11, 1), (14, 2)],
  term ((-7426280960 : Rat) / 330679773) [(0, 1), (7, 1), (10, 2), (11, 1), (14, 1)],
  term ((7426280960 : Rat) / 330679773) [(0, 1), (7, 1), (11, 1), (14, 1)],
  term ((-14852561920 : Rat) / 330679773) [(0, 1), (7, 1), (11, 1), (14, 2)],
  term ((14852561920 : Rat) / 330679773) [(0, 1), (7, 1), (11, 2), (14, 1), (15, 1)],
  term ((-7426280960 : Rat) / 330679773) [(0, 1), (7, 1), (11, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0026_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0026
        rs_R009_ueqv_R009NNNYN_generator_29_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_29_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0027 : Poly :=
[
  term ((-264709872 : Rat) / 12247399) [(0, 1), (7, 1), (13, 1)]
]

/-- Partial product 27 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0027 : Poly :=
[
  term ((-529419744 : Rat) / 12247399) [(0, 1), (7, 1), (10, 1), (13, 1), (14, 1)],
  term ((264709872 : Rat) / 12247399) [(0, 1), (7, 1), (10, 2), (13, 1)],
  term ((-529419744 : Rat) / 12247399) [(0, 1), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((264709872 : Rat) / 12247399) [(0, 1), (7, 1), (11, 2), (13, 1)],
  term ((-264709872 : Rat) / 12247399) [(0, 1), (7, 1), (13, 1)],
  term ((529419744 : Rat) / 12247399) [(0, 1), (7, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0027_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0027
        rs_R009_ueqv_R009NNNYN_generator_29_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_29_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0028 : Poly :=
[
  term ((116035640 : Rat) / 12247399) [(0, 1), (7, 1), (13, 1), (14, 1)]
]

/-- Partial product 28 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0028 : Poly :=
[
  term ((232071280 : Rat) / 12247399) [(0, 1), (7, 1), (10, 1), (13, 1), (14, 2)],
  term ((-116035640 : Rat) / 12247399) [(0, 1), (7, 1), (10, 2), (13, 1), (14, 1)],
  term ((232071280 : Rat) / 12247399) [(0, 1), (7, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-116035640 : Rat) / 12247399) [(0, 1), (7, 1), (11, 2), (13, 1), (14, 1)],
  term ((116035640 : Rat) / 12247399) [(0, 1), (7, 1), (13, 1), (14, 1)],
  term ((-232071280 : Rat) / 12247399) [(0, 1), (7, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0028_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0028
        rs_R009_ueqv_R009NNNYN_generator_29_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_29_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0029 : Poly :=
[
  term ((-6696914080 : Rat) / 330679773) [(0, 1), (7, 1), (14, 1), (15, 1)]
]

/-- Partial product 29 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0029 : Poly :=
[
  term ((-13393828160 : Rat) / 330679773) [(0, 1), (7, 1), (10, 1), (14, 2), (15, 1)],
  term ((6696914080 : Rat) / 330679773) [(0, 1), (7, 1), (10, 2), (14, 1), (15, 1)],
  term ((-13393828160 : Rat) / 330679773) [(0, 1), (7, 1), (11, 1), (14, 1), (15, 2)],
  term ((6696914080 : Rat) / 330679773) [(0, 1), (7, 1), (11, 2), (14, 1), (15, 1)],
  term ((-6696914080 : Rat) / 330679773) [(0, 1), (7, 1), (14, 1), (15, 1)],
  term ((13393828160 : Rat) / 330679773) [(0, 1), (7, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0029_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0029
        rs_R009_ueqv_R009NNNYN_generator_29_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_29_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0030 : Poly :=
[
  term ((1697504576 : Rat) / 36742197) [(0, 1), (7, 1), (15, 1)]
]

/-- Partial product 30 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0030 : Poly :=
[
  term ((3395009152 : Rat) / 36742197) [(0, 1), (7, 1), (10, 1), (14, 1), (15, 1)],
  term ((-1697504576 : Rat) / 36742197) [(0, 1), (7, 1), (10, 2), (15, 1)],
  term ((3395009152 : Rat) / 36742197) [(0, 1), (7, 1), (11, 1), (15, 2)],
  term ((-1697504576 : Rat) / 36742197) [(0, 1), (7, 1), (11, 2), (15, 1)],
  term ((-3395009152 : Rat) / 36742197) [(0, 1), (7, 1), (14, 1), (15, 1)],
  term ((1697504576 : Rat) / 36742197) [(0, 1), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0030_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0030
        rs_R009_ueqv_R009NNNYN_generator_29_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_29_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0031 : Poly :=
[
  term ((-2058155080772 : Rat) / 94243735305) [(0, 1), (9, 1), (11, 1)]
]

/-- Partial product 31 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0031 : Poly :=
[
  term ((-4116310161544 : Rat) / 94243735305) [(0, 1), (9, 1), (10, 1), (11, 1), (14, 1)],
  term ((2058155080772 : Rat) / 94243735305) [(0, 1), (9, 1), (10, 2), (11, 1)],
  term ((-2058155080772 : Rat) / 94243735305) [(0, 1), (9, 1), (11, 1)],
  term ((4116310161544 : Rat) / 94243735305) [(0, 1), (9, 1), (11, 1), (14, 1)],
  term ((-4116310161544 : Rat) / 94243735305) [(0, 1), (9, 1), (11, 2), (15, 1)],
  term ((2058155080772 : Rat) / 94243735305) [(0, 1), (9, 1), (11, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0031_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0031
        rs_R009_ueqv_R009NNNYN_generator_29_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_29_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0032 : Poly :=
[
  term ((-19496960 : Rat) / 110226591) [(0, 1), (9, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 32 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0032 : Poly :=
[
  term ((-38993920 : Rat) / 110226591) [(0, 1), (9, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((19496960 : Rat) / 110226591) [(0, 1), (9, 1), (10, 2), (11, 1), (13, 1), (15, 1)],
  term ((38993920 : Rat) / 110226591) [(0, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-19496960 : Rat) / 110226591) [(0, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-38993920 : Rat) / 110226591) [(0, 1), (9, 1), (11, 2), (13, 1), (15, 2)],
  term ((19496960 : Rat) / 110226591) [(0, 1), (9, 1), (11, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0032_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0032
        rs_R009_ueqv_R009NNNYN_generator_29_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_29_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0033 : Poly :=
[
  term ((13434125824 : Rat) / 330679773) [(0, 1), (9, 1), (11, 1), (14, 1)]
]

/-- Partial product 33 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0033 : Poly :=
[
  term ((26868251648 : Rat) / 330679773) [(0, 1), (9, 1), (10, 1), (11, 1), (14, 2)],
  term ((-13434125824 : Rat) / 330679773) [(0, 1), (9, 1), (10, 2), (11, 1), (14, 1)],
  term ((13434125824 : Rat) / 330679773) [(0, 1), (9, 1), (11, 1), (14, 1)],
  term ((-26868251648 : Rat) / 330679773) [(0, 1), (9, 1), (11, 1), (14, 2)],
  term ((26868251648 : Rat) / 330679773) [(0, 1), (9, 1), (11, 2), (14, 1), (15, 1)],
  term ((-13434125824 : Rat) / 330679773) [(0, 1), (9, 1), (11, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0033_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0033
        rs_R009_ueqv_R009NNNYN_generator_29_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_29_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0034 : Poly :=
[
  term ((9748480 : Rat) / 36742197) [(0, 1), (9, 1), (11, 1), (15, 2)]
]

/-- Partial product 34 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0034 : Poly :=
[
  term ((19496960 : Rat) / 36742197) [(0, 1), (9, 1), (10, 1), (11, 1), (14, 1), (15, 2)],
  term ((-9748480 : Rat) / 36742197) [(0, 1), (9, 1), (10, 2), (11, 1), (15, 2)],
  term ((-19496960 : Rat) / 36742197) [(0, 1), (9, 1), (11, 1), (14, 1), (15, 2)],
  term ((9748480 : Rat) / 36742197) [(0, 1), (9, 1), (11, 1), (15, 2)],
  term ((19496960 : Rat) / 36742197) [(0, 1), (9, 1), (11, 2), (15, 3)],
  term ((-9748480 : Rat) / 36742197) [(0, 1), (9, 1), (11, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0034_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0034
        rs_R009_ueqv_R009NNNYN_generator_29_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_29_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0035 : Poly :=
[
  term ((-38470650211 : Rat) / 6981017430) [(0, 1), (9, 1), (13, 1)]
]

/-- Partial product 35 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0035 : Poly :=
[
  term ((-38470650211 : Rat) / 3490508715) [(0, 1), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((38470650211 : Rat) / 6981017430) [(0, 1), (9, 1), (10, 2), (13, 1)],
  term ((-38470650211 : Rat) / 3490508715) [(0, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((38470650211 : Rat) / 6981017430) [(0, 1), (9, 1), (11, 2), (13, 1)],
  term ((-38470650211 : Rat) / 6981017430) [(0, 1), (9, 1), (13, 1)],
  term ((38470650211 : Rat) / 3490508715) [(0, 1), (9, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0035_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0035
        rs_R009_ueqv_R009NNNYN_generator_29_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_29_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0036 : Poly :=
[
  term ((209908216 : Rat) / 12247399) [(0, 1), (9, 1), (13, 1), (14, 1)]
]

/-- Partial product 36 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0036 : Poly :=
[
  term ((419816432 : Rat) / 12247399) [(0, 1), (9, 1), (10, 1), (13, 1), (14, 2)],
  term ((-209908216 : Rat) / 12247399) [(0, 1), (9, 1), (10, 2), (13, 1), (14, 1)],
  term ((419816432 : Rat) / 12247399) [(0, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-209908216 : Rat) / 12247399) [(0, 1), (9, 1), (11, 2), (13, 1), (14, 1)],
  term ((209908216 : Rat) / 12247399) [(0, 1), (9, 1), (13, 1), (14, 1)],
  term ((-419816432 : Rat) / 12247399) [(0, 1), (9, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0036_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0036
        rs_R009_ueqv_R009NNNYN_generator_29_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_29_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0037 : Poly :=
[
  term ((29920000 : Rat) / 110226591) [(0, 1), (9, 1), (13, 1), (15, 2)]
]

/-- Partial product 37 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0037 : Poly :=
[
  term ((59840000 : Rat) / 110226591) [(0, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 2)],
  term ((-29920000 : Rat) / 110226591) [(0, 1), (9, 1), (10, 2), (13, 1), (15, 2)],
  term ((59840000 : Rat) / 110226591) [(0, 1), (9, 1), (11, 1), (13, 1), (15, 3)],
  term ((-29920000 : Rat) / 110226591) [(0, 1), (9, 1), (11, 2), (13, 1), (15, 2)],
  term ((-59840000 : Rat) / 110226591) [(0, 1), (9, 1), (13, 1), (14, 1), (15, 2)],
  term ((29920000 : Rat) / 110226591) [(0, 1), (9, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0037_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0037
        rs_R009_ueqv_R009NNNYN_generator_29_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_29_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0038 : Poly :=
[
  term ((-913920 : Rat) / 12247399) [(0, 1), (9, 1), (13, 2), (15, 1)]
]

/-- Partial product 38 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0038 : Poly :=
[
  term ((-1827840 : Rat) / 12247399) [(0, 1), (9, 1), (10, 1), (13, 2), (14, 1), (15, 1)],
  term ((913920 : Rat) / 12247399) [(0, 1), (9, 1), (10, 2), (13, 2), (15, 1)],
  term ((-1827840 : Rat) / 12247399) [(0, 1), (9, 1), (11, 1), (13, 2), (15, 2)],
  term ((913920 : Rat) / 12247399) [(0, 1), (9, 1), (11, 2), (13, 2), (15, 1)],
  term ((1827840 : Rat) / 12247399) [(0, 1), (9, 1), (13, 2), (14, 1), (15, 1)],
  term ((-913920 : Rat) / 12247399) [(0, 1), (9, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0038_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0038
        rs_R009_ueqv_R009NNNYN_generator_29_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_29_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0039 : Poly :=
[
  term ((-12114702752 : Rat) / 330679773) [(0, 1), (9, 1), (14, 1), (15, 1)]
]

/-- Partial product 39 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0039 : Poly :=
[
  term ((-24229405504 : Rat) / 330679773) [(0, 1), (9, 1), (10, 1), (14, 2), (15, 1)],
  term ((12114702752 : Rat) / 330679773) [(0, 1), (9, 1), (10, 2), (14, 1), (15, 1)],
  term ((-24229405504 : Rat) / 330679773) [(0, 1), (9, 1), (11, 1), (14, 1), (15, 2)],
  term ((12114702752 : Rat) / 330679773) [(0, 1), (9, 1), (11, 2), (14, 1), (15, 1)],
  term ((-12114702752 : Rat) / 330679773) [(0, 1), (9, 1), (14, 1), (15, 1)],
  term ((24229405504 : Rat) / 330679773) [(0, 1), (9, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0039_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0039
        rs_R009_ueqv_R009NNNYN_generator_29_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_29_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0040 : Poly :=
[
  term ((972304003276 : Rat) / 94243735305) [(0, 1), (9, 1), (15, 1)]
]

/-- Partial product 40 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0040 : Poly :=
[
  term ((1944608006552 : Rat) / 94243735305) [(0, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-972304003276 : Rat) / 94243735305) [(0, 1), (9, 1), (10, 2), (15, 1)],
  term ((1944608006552 : Rat) / 94243735305) [(0, 1), (9, 1), (11, 1), (15, 2)],
  term ((-972304003276 : Rat) / 94243735305) [(0, 1), (9, 1), (11, 2), (15, 1)],
  term ((-1944608006552 : Rat) / 94243735305) [(0, 1), (9, 1), (14, 1), (15, 1)],
  term ((972304003276 : Rat) / 94243735305) [(0, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0040_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0040
        rs_R009_ueqv_R009NNNYN_generator_29_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_29_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0041 : Poly :=
[
  term ((-8791040 : Rat) / 36742197) [(0, 1), (9, 1), (15, 3)]
]

/-- Partial product 41 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0041 : Poly :=
[
  term ((-17582080 : Rat) / 36742197) [(0, 1), (9, 1), (10, 1), (14, 1), (15, 3)],
  term ((8791040 : Rat) / 36742197) [(0, 1), (9, 1), (10, 2), (15, 3)],
  term ((-17582080 : Rat) / 36742197) [(0, 1), (9, 1), (11, 1), (15, 4)],
  term ((8791040 : Rat) / 36742197) [(0, 1), (9, 1), (11, 2), (15, 3)],
  term ((17582080 : Rat) / 36742197) [(0, 1), (9, 1), (14, 1), (15, 3)],
  term ((-8791040 : Rat) / 36742197) [(0, 1), (9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0041_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0041
        rs_R009_ueqv_R009NNNYN_generator_29_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_29_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0042 : Poly :=
[
  term ((-294 : Rat) / 67) [(0, 1), (9, 2)]
]

/-- Partial product 42 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0042 : Poly :=
[
  term ((-294 : Rat) / 67) [(0, 1), (9, 2)],
  term ((-588 : Rat) / 67) [(0, 1), (9, 2), (10, 1), (14, 1)],
  term ((294 : Rat) / 67) [(0, 1), (9, 2), (10, 2)],
  term ((-588 : Rat) / 67) [(0, 1), (9, 2), (11, 1), (15, 1)],
  term ((294 : Rat) / 67) [(0, 1), (9, 2), (11, 2)],
  term ((588 : Rat) / 67) [(0, 1), (9, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0042_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0042
        rs_R009_ueqv_R009NNNYN_generator_29_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_29_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0043 : Poly :=
[
  term ((-38993920 : Rat) / 110226591) [(0, 1), (10, 1), (11, 1), (15, 1)]
]

/-- Partial product 43 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0043 : Poly :=
[
  term ((77987840 : Rat) / 110226591) [(0, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-38993920 : Rat) / 110226591) [(0, 1), (10, 1), (11, 1), (15, 1)],
  term ((-77987840 : Rat) / 110226591) [(0, 1), (10, 1), (11, 2), (15, 2)],
  term ((38993920 : Rat) / 110226591) [(0, 1), (10, 1), (11, 3), (15, 1)],
  term ((-77987840 : Rat) / 110226591) [(0, 1), (10, 2), (11, 1), (14, 1), (15, 1)],
  term ((38993920 : Rat) / 110226591) [(0, 1), (10, 3), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0043_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0043
        rs_R009_ueqv_R009NNNYN_generator_29_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_29_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0044 : Poly :=
[
  term ((-1827840 : Rat) / 12247399) [(0, 1), (10, 1), (13, 1), (15, 1)]
]

/-- Partial product 44 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0044 : Poly :=
[
  term ((-3655680 : Rat) / 12247399) [(0, 1), (10, 1), (11, 1), (13, 1), (15, 2)],
  term ((1827840 : Rat) / 12247399) [(0, 1), (10, 1), (11, 2), (13, 1), (15, 1)],
  term ((3655680 : Rat) / 12247399) [(0, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-1827840 : Rat) / 12247399) [(0, 1), (10, 1), (13, 1), (15, 1)],
  term ((-3655680 : Rat) / 12247399) [(0, 1), (10, 2), (13, 1), (14, 1), (15, 1)],
  term ((1827840 : Rat) / 12247399) [(0, 1), (10, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0044_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0044
        rs_R009_ueqv_R009NNNYN_generator_29_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_29_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0045 : Poly :=
[
  term ((35164160 : Rat) / 110226591) [(0, 1), (10, 1), (15, 2)]
]

/-- Partial product 45 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0045 : Poly :=
[
  term ((70328320 : Rat) / 110226591) [(0, 1), (10, 1), (11, 1), (15, 3)],
  term ((-35164160 : Rat) / 110226591) [(0, 1), (10, 1), (11, 2), (15, 2)],
  term ((-70328320 : Rat) / 110226591) [(0, 1), (10, 1), (14, 1), (15, 2)],
  term ((35164160 : Rat) / 110226591) [(0, 1), (10, 1), (15, 2)],
  term ((70328320 : Rat) / 110226591) [(0, 1), (10, 2), (14, 1), (15, 2)],
  term ((-35164160 : Rat) / 110226591) [(0, 1), (10, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0045_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0045
        rs_R009_ueqv_R009NNNYN_generator_29_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_29_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0046 : Poly :=
[
  term ((-329809199503 : Rat) / 10471526145) [(0, 1), (11, 1), (13, 1)]
]

/-- Partial product 46 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0046 : Poly :=
[
  term ((-659618399006 : Rat) / 10471526145) [(0, 1), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((329809199503 : Rat) / 10471526145) [(0, 1), (10, 2), (11, 1), (13, 1)],
  term ((-329809199503 : Rat) / 10471526145) [(0, 1), (11, 1), (13, 1)],
  term ((659618399006 : Rat) / 10471526145) [(0, 1), (11, 1), (13, 1), (14, 1)],
  term ((-659618399006 : Rat) / 10471526145) [(0, 1), (11, 2), (13, 1), (15, 1)],
  term ((329809199503 : Rat) / 10471526145) [(0, 1), (11, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0046_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0046
        rs_R009_ueqv_R009NNNYN_generator_29_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_29_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0047 : Poly :=
[
  term ((1827840 : Rat) / 12247399) [(0, 1), (11, 1), (13, 1), (14, 1)]
]

/-- Partial product 47 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0047 : Poly :=
[
  term ((3655680 : Rat) / 12247399) [(0, 1), (10, 1), (11, 1), (13, 1), (14, 2)],
  term ((-1827840 : Rat) / 12247399) [(0, 1), (10, 2), (11, 1), (13, 1), (14, 1)],
  term ((1827840 : Rat) / 12247399) [(0, 1), (11, 1), (13, 1), (14, 1)],
  term ((-3655680 : Rat) / 12247399) [(0, 1), (11, 1), (13, 1), (14, 2)],
  term ((3655680 : Rat) / 12247399) [(0, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((-1827840 : Rat) / 12247399) [(0, 1), (11, 3), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0047_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0047
        rs_R009_ueqv_R009NNNYN_generator_29_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_29_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0048 : Poly :=
[
  term ((59840000 : Rat) / 110226591) [(0, 1), (11, 1), (13, 1), (15, 2)]
]

/-- Partial product 48 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0048 : Poly :=
[
  term ((119680000 : Rat) / 110226591) [(0, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((-59840000 : Rat) / 110226591) [(0, 1), (10, 2), (11, 1), (13, 1), (15, 2)],
  term ((-119680000 : Rat) / 110226591) [(0, 1), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((59840000 : Rat) / 110226591) [(0, 1), (11, 1), (13, 1), (15, 2)],
  term ((119680000 : Rat) / 110226591) [(0, 1), (11, 2), (13, 1), (15, 3)],
  term ((-59840000 : Rat) / 110226591) [(0, 1), (11, 3), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0048_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0048
        rs_R009_ueqv_R009NNNYN_generator_29_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_29_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0049 : Poly :=
[
  term ((-1827840 : Rat) / 12247399) [(0, 1), (11, 1), (13, 2), (15, 1)]
]

/-- Partial product 49 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0049 : Poly :=
[
  term ((-3655680 : Rat) / 12247399) [(0, 1), (10, 1), (11, 1), (13, 2), (14, 1), (15, 1)],
  term ((1827840 : Rat) / 12247399) [(0, 1), (10, 2), (11, 1), (13, 2), (15, 1)],
  term ((3655680 : Rat) / 12247399) [(0, 1), (11, 1), (13, 2), (14, 1), (15, 1)],
  term ((-1827840 : Rat) / 12247399) [(0, 1), (11, 1), (13, 2), (15, 1)],
  term ((-3655680 : Rat) / 12247399) [(0, 1), (11, 2), (13, 2), (15, 2)],
  term ((1827840 : Rat) / 12247399) [(0, 1), (11, 3), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0049_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0049
        rs_R009_ueqv_R009NNNYN_generator_29_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_29_0049 := by
  native_decide

/-- Coefficient term 50 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0050 : Poly :=
[
  term ((-113152000 : Rat) / 110226591) [(0, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 50 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0050 : Poly :=
[
  term ((-226304000 : Rat) / 110226591) [(0, 1), (10, 1), (11, 1), (14, 2), (15, 1)],
  term ((113152000 : Rat) / 110226591) [(0, 1), (10, 2), (11, 1), (14, 1), (15, 1)],
  term ((-113152000 : Rat) / 110226591) [(0, 1), (11, 1), (14, 1), (15, 1)],
  term ((226304000 : Rat) / 110226591) [(0, 1), (11, 1), (14, 2), (15, 1)],
  term ((-226304000 : Rat) / 110226591) [(0, 1), (11, 2), (14, 1), (15, 2)],
  term ((113152000 : Rat) / 110226591) [(0, 1), (11, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 50 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0050_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0050
        rs_R009_ueqv_R009NNNYN_generator_29_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_29_0050 := by
  native_decide

/-- Coefficient term 51 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0051 : Poly :=
[
  term ((-221021067088 : Rat) / 94243735305) [(0, 1), (11, 1), (15, 1)]
]

/-- Partial product 51 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0051 : Poly :=
[
  term ((-442042134176 : Rat) / 94243735305) [(0, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((221021067088 : Rat) / 94243735305) [(0, 1), (10, 2), (11, 1), (15, 1)],
  term ((442042134176 : Rat) / 94243735305) [(0, 1), (11, 1), (14, 1), (15, 1)],
  term ((-221021067088 : Rat) / 94243735305) [(0, 1), (11, 1), (15, 1)],
  term ((-442042134176 : Rat) / 94243735305) [(0, 1), (11, 2), (15, 2)],
  term ((221021067088 : Rat) / 94243735305) [(0, 1), (11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 51 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0051_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0051
        rs_R009_ueqv_R009NNNYN_generator_29_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_29_0051 := by
  native_decide

/-- Coefficient term 52 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0052 : Poly :=
[
  term ((-17582080 : Rat) / 36742197) [(0, 1), (11, 1), (15, 3)]
]

/-- Partial product 52 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0052 : Poly :=
[
  term ((-35164160 : Rat) / 36742197) [(0, 1), (10, 1), (11, 1), (14, 1), (15, 3)],
  term ((17582080 : Rat) / 36742197) [(0, 1), (10, 2), (11, 1), (15, 3)],
  term ((35164160 : Rat) / 36742197) [(0, 1), (11, 1), (14, 1), (15, 3)],
  term ((-17582080 : Rat) / 36742197) [(0, 1), (11, 1), (15, 3)],
  term ((-35164160 : Rat) / 36742197) [(0, 1), (11, 2), (15, 4)],
  term ((17582080 : Rat) / 36742197) [(0, 1), (11, 3), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 52 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0052_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0052
        rs_R009_ueqv_R009NNNYN_generator_29_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_29_0052 := by
  native_decide

/-- Coefficient term 53 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0053 : Poly :=
[
  term ((-2887895343424 : Rat) / 94243735305) [(0, 1), (11, 2)]
]

/-- Partial product 53 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0053 : Poly :=
[
  term ((-5775790686848 : Rat) / 94243735305) [(0, 1), (10, 1), (11, 2), (14, 1)],
  term ((2887895343424 : Rat) / 94243735305) [(0, 1), (10, 2), (11, 2)],
  term ((-2887895343424 : Rat) / 94243735305) [(0, 1), (11, 2)],
  term ((5775790686848 : Rat) / 94243735305) [(0, 1), (11, 2), (14, 1)],
  term ((-5775790686848 : Rat) / 94243735305) [(0, 1), (11, 3), (15, 1)],
  term ((2887895343424 : Rat) / 94243735305) [(0, 1), (11, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 53 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0053_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0053
        rs_R009_ueqv_R009NNNYN_generator_29_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_29_0053 := by
  native_decide

/-- Coefficient term 54 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0054 : Poly :=
[
  term ((-38993920 : Rat) / 110226591) [(0, 1), (11, 2), (13, 1), (15, 1)]
]

/-- Partial product 54 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0054 : Poly :=
[
  term ((-77987840 : Rat) / 110226591) [(0, 1), (10, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((38993920 : Rat) / 110226591) [(0, 1), (10, 2), (11, 2), (13, 1), (15, 1)],
  term ((77987840 : Rat) / 110226591) [(0, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((-38993920 : Rat) / 110226591) [(0, 1), (11, 2), (13, 1), (15, 1)],
  term ((-77987840 : Rat) / 110226591) [(0, 1), (11, 3), (13, 1), (15, 2)],
  term ((38993920 : Rat) / 110226591) [(0, 1), (11, 4), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 54 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0054_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0054
        rs_R009_ueqv_R009NNNYN_generator_29_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_29_0054 := by
  native_decide

/-- Coefficient term 55 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0055 : Poly :=
[
  term ((38993920 : Rat) / 110226591) [(0, 1), (11, 2), (14, 1)]
]

/-- Partial product 55 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0055 : Poly :=
[
  term ((77987840 : Rat) / 110226591) [(0, 1), (10, 1), (11, 2), (14, 2)],
  term ((-38993920 : Rat) / 110226591) [(0, 1), (10, 2), (11, 2), (14, 1)],
  term ((38993920 : Rat) / 110226591) [(0, 1), (11, 2), (14, 1)],
  term ((-77987840 : Rat) / 110226591) [(0, 1), (11, 2), (14, 2)],
  term ((77987840 : Rat) / 110226591) [(0, 1), (11, 3), (14, 1), (15, 1)],
  term ((-38993920 : Rat) / 110226591) [(0, 1), (11, 4), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 55 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0055_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0055
        rs_R009_ueqv_R009NNNYN_generator_29_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_29_0055 := by
  native_decide

/-- Coefficient term 56 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0056 : Poly :=
[
  term ((19496960 : Rat) / 36742197) [(0, 1), (11, 2), (15, 2)]
]

/-- Partial product 56 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0056 : Poly :=
[
  term ((38993920 : Rat) / 36742197) [(0, 1), (10, 1), (11, 2), (14, 1), (15, 2)],
  term ((-19496960 : Rat) / 36742197) [(0, 1), (10, 2), (11, 2), (15, 2)],
  term ((-38993920 : Rat) / 36742197) [(0, 1), (11, 2), (14, 1), (15, 2)],
  term ((19496960 : Rat) / 36742197) [(0, 1), (11, 2), (15, 2)],
  term ((38993920 : Rat) / 36742197) [(0, 1), (11, 3), (15, 3)],
  term ((-19496960 : Rat) / 36742197) [(0, 1), (11, 4), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 56 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0056_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0056
        rs_R009_ueqv_R009NNNYN_generator_29_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_29_0056 := by
  native_decide

/-- Coefficient term 57 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0057 : Poly :=
[
  term ((-3655680 : Rat) / 12247399) [(0, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 57 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0057 : Poly :=
[
  term ((-7311360 : Rat) / 12247399) [(0, 1), (10, 1), (13, 1), (14, 2), (15, 1)],
  term ((3655680 : Rat) / 12247399) [(0, 1), (10, 2), (13, 1), (14, 1), (15, 1)],
  term ((-7311360 : Rat) / 12247399) [(0, 1), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((3655680 : Rat) / 12247399) [(0, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((-3655680 : Rat) / 12247399) [(0, 1), (13, 1), (14, 1), (15, 1)],
  term ((7311360 : Rat) / 12247399) [(0, 1), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 57 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0057_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0057
        rs_R009_ueqv_R009NNNYN_generator_29_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_29_0057 := by
  native_decide

/-- Coefficient term 58 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0058 : Poly :=
[
  term ((587690272 : Rat) / 110226591) [(0, 1), (13, 1), (15, 1)]
]

/-- Partial product 58 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0058 : Poly :=
[
  term ((1175380544 : Rat) / 110226591) [(0, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-587690272 : Rat) / 110226591) [(0, 1), (10, 2), (13, 1), (15, 1)],
  term ((1175380544 : Rat) / 110226591) [(0, 1), (11, 1), (13, 1), (15, 2)],
  term ((-587690272 : Rat) / 110226591) [(0, 1), (11, 2), (13, 1), (15, 1)],
  term ((-1175380544 : Rat) / 110226591) [(0, 1), (13, 1), (14, 1), (15, 1)],
  term ((587690272 : Rat) / 110226591) [(0, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 58 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0058_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0058
        rs_R009_ueqv_R009NNNYN_generator_29_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_29_0058 := by
  native_decide

/-- Coefficient term 59 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0059 : Poly :=
[
  term ((-95940348 : Rat) / 12247399) [(0, 1), (13, 2)]
]

/-- Partial product 59 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0059 : Poly :=
[
  term ((-191880696 : Rat) / 12247399) [(0, 1), (10, 1), (13, 2), (14, 1)],
  term ((95940348 : Rat) / 12247399) [(0, 1), (10, 2), (13, 2)],
  term ((-191880696 : Rat) / 12247399) [(0, 1), (11, 1), (13, 2), (15, 1)],
  term ((95940348 : Rat) / 12247399) [(0, 1), (11, 2), (13, 2)],
  term ((-95940348 : Rat) / 12247399) [(0, 1), (13, 2)],
  term ((191880696 : Rat) / 12247399) [(0, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 59 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0059_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0059
        rs_R009_ueqv_R009NNNYN_generator_29_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_29_0059 := by
  native_decide

/-- Coefficient term 60 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0060 : Poly :=
[
  term ((70328320 : Rat) / 110226591) [(0, 1), (14, 1), (15, 2)]
]

/-- Partial product 60 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0060 : Poly :=
[
  term ((140656640 : Rat) / 110226591) [(0, 1), (10, 1), (14, 2), (15, 2)],
  term ((-70328320 : Rat) / 110226591) [(0, 1), (10, 2), (14, 1), (15, 2)],
  term ((140656640 : Rat) / 110226591) [(0, 1), (11, 1), (14, 1), (15, 3)],
  term ((-70328320 : Rat) / 110226591) [(0, 1), (11, 2), (14, 1), (15, 2)],
  term ((70328320 : Rat) / 110226591) [(0, 1), (14, 1), (15, 2)],
  term ((-140656640 : Rat) / 110226591) [(0, 1), (14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 60 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0060_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0060
        rs_R009_ueqv_R009NNNYN_generator_29_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_29_0060 := by
  native_decide

/-- Coefficient term 61 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0061 : Poly :=
[
  term ((8067298240 : Rat) / 330679773) [(0, 1), (15, 2)]
]

/-- Partial product 61 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0061 : Poly :=
[
  term ((16134596480 : Rat) / 330679773) [(0, 1), (10, 1), (14, 1), (15, 2)],
  term ((-8067298240 : Rat) / 330679773) [(0, 1), (10, 2), (15, 2)],
  term ((16134596480 : Rat) / 330679773) [(0, 1), (11, 1), (15, 3)],
  term ((-8067298240 : Rat) / 330679773) [(0, 1), (11, 2), (15, 2)],
  term ((-16134596480 : Rat) / 330679773) [(0, 1), (14, 1), (15, 2)],
  term ((8067298240 : Rat) / 330679773) [(0, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 61 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0061_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0061
        rs_R009_ueqv_R009NNNYN_generator_29_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_29_0061 := by
  native_decide

/-- Coefficient term 62 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0062 : Poly :=
[
  term ((-341205760 : Rat) / 330679773) [(1, 1), (2, 1), (11, 1), (14, 1)]
]

/-- Partial product 62 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0062 : Poly :=
[
  term ((-682411520 : Rat) / 330679773) [(1, 1), (2, 1), (10, 1), (11, 1), (14, 2)],
  term ((341205760 : Rat) / 330679773) [(1, 1), (2, 1), (10, 2), (11, 1), (14, 1)],
  term ((-341205760 : Rat) / 330679773) [(1, 1), (2, 1), (11, 1), (14, 1)],
  term ((682411520 : Rat) / 330679773) [(1, 1), (2, 1), (11, 1), (14, 2)],
  term ((-682411520 : Rat) / 330679773) [(1, 1), (2, 1), (11, 2), (14, 1), (15, 1)],
  term ((341205760 : Rat) / 330679773) [(1, 1), (2, 1), (11, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 62 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0062_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0062
        rs_R009_ueqv_R009NNNYN_generator_29_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_29_0062 := by
  native_decide

/-- Coefficient term 63 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0063 : Poly :=
[
  term ((-5331340 : Rat) / 12247399) [(1, 1), (2, 1), (13, 1), (14, 1)]
]

/-- Partial product 63 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0063 : Poly :=
[
  term ((-10662680 : Rat) / 12247399) [(1, 1), (2, 1), (10, 1), (13, 1), (14, 2)],
  term ((5331340 : Rat) / 12247399) [(1, 1), (2, 1), (10, 2), (13, 1), (14, 1)],
  term ((-10662680 : Rat) / 12247399) [(1, 1), (2, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((5331340 : Rat) / 12247399) [(1, 1), (2, 1), (11, 2), (13, 1), (14, 1)],
  term ((-5331340 : Rat) / 12247399) [(1, 1), (2, 1), (13, 1), (14, 1)],
  term ((10662680 : Rat) / 12247399) [(1, 1), (2, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 63 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0063_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0063
        rs_R009_ueqv_R009NNNYN_generator_29_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_29_0063 := by
  native_decide

/-- Coefficient term 64 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0064 : Poly :=
[
  term ((307694480 : Rat) / 330679773) [(1, 1), (2, 1), (14, 1), (15, 1)]
]

/-- Partial product 64 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0064 : Poly :=
[
  term ((615388960 : Rat) / 330679773) [(1, 1), (2, 1), (10, 1), (14, 2), (15, 1)],
  term ((-307694480 : Rat) / 330679773) [(1, 1), (2, 1), (10, 2), (14, 1), (15, 1)],
  term ((615388960 : Rat) / 330679773) [(1, 1), (2, 1), (11, 1), (14, 1), (15, 2)],
  term ((-307694480 : Rat) / 330679773) [(1, 1), (2, 1), (11, 2), (14, 1), (15, 1)],
  term ((307694480 : Rat) / 330679773) [(1, 1), (2, 1), (14, 1), (15, 1)],
  term ((-615388960 : Rat) / 330679773) [(1, 1), (2, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 64 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0064_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0064
        rs_R009_ueqv_R009NNNYN_generator_29_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_29_0064 := by
  native_decide

/-- Coefficient term 65 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0065 : Poly :=
[
  term ((-17016832 : Rat) / 182797) [(1, 1), (7, 1), (11, 1), (13, 1)]
]

/-- Partial product 65 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0065 : Poly :=
[
  term ((-34033664 : Rat) / 182797) [(1, 1), (7, 1), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((17016832 : Rat) / 182797) [(1, 1), (7, 1), (10, 2), (11, 1), (13, 1)],
  term ((-17016832 : Rat) / 182797) [(1, 1), (7, 1), (11, 1), (13, 1)],
  term ((34033664 : Rat) / 182797) [(1, 1), (7, 1), (11, 1), (13, 1), (14, 1)],
  term ((-34033664 : Rat) / 182797) [(1, 1), (7, 1), (11, 2), (13, 1), (15, 1)],
  term ((17016832 : Rat) / 182797) [(1, 1), (7, 1), (11, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 65 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0065_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0065
        rs_R009_ueqv_R009NNNYN_generator_29_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_29_0065 := by
  native_decide

/-- Coefficient term 66 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0066 : Poly :=
[
  term ((975505376 : Rat) / 12247399) [(1, 1), (7, 1), (13, 1), (15, 1)]
]

/-- Partial product 66 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0066 : Poly :=
[
  term ((1951010752 : Rat) / 12247399) [(1, 1), (7, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-975505376 : Rat) / 12247399) [(1, 1), (7, 1), (10, 2), (13, 1), (15, 1)],
  term ((1951010752 : Rat) / 12247399) [(1, 1), (7, 1), (11, 1), (13, 1), (15, 2)],
  term ((-975505376 : Rat) / 12247399) [(1, 1), (7, 1), (11, 2), (13, 1), (15, 1)],
  term ((-1951010752 : Rat) / 12247399) [(1, 1), (7, 1), (13, 1), (14, 1), (15, 1)],
  term ((975505376 : Rat) / 12247399) [(1, 1), (7, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 66 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0066_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0066
        rs_R009_ueqv_R009NNNYN_generator_29_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_29_0066 := by
  native_decide

/-- Coefficient term 67 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0067 : Poly :=
[
  term ((-7178976 : Rat) / 182797) [(1, 1), (7, 1), (13, 2)]
]

/-- Partial product 67 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0067 : Poly :=
[
  term ((-14357952 : Rat) / 182797) [(1, 1), (7, 1), (10, 1), (13, 2), (14, 1)],
  term ((7178976 : Rat) / 182797) [(1, 1), (7, 1), (10, 2), (13, 2)],
  term ((-14357952 : Rat) / 182797) [(1, 1), (7, 1), (11, 1), (13, 2), (15, 1)],
  term ((7178976 : Rat) / 182797) [(1, 1), (7, 1), (11, 2), (13, 2)],
  term ((-7178976 : Rat) / 182797) [(1, 1), (7, 1), (13, 2)],
  term ((14357952 : Rat) / 182797) [(1, 1), (7, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 67 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0067_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0067
        rs_R009_ueqv_R009NNNYN_generator_29_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_29_0067 := by
  native_decide

/-- Coefficient term 68 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0068 : Poly :=
[
  term (3 : Rat) [(1, 1), (9, 1)]
]

/-- Partial product 68 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0068 : Poly :=
[
  term (3 : Rat) [(1, 1), (9, 1)],
  term (6 : Rat) [(1, 1), (9, 1), (10, 1), (14, 1)],
  term (-3 : Rat) [(1, 1), (9, 1), (10, 2)],
  term (6 : Rat) [(1, 1), (9, 1), (11, 1), (15, 1)],
  term (-3 : Rat) [(1, 1), (9, 1), (11, 2)],
  term (-6 : Rat) [(1, 1), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 68 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0068_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0068
        rs_R009_ueqv_R009NNNYN_generator_29_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_29_0068 := by
  native_decide

/-- Coefficient term 69 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0069 : Poly :=
[
  term ((-588 : Rat) / 67) [(1, 1), (9, 1), (10, 1)]
]

/-- Partial product 69 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0069 : Poly :=
[
  term ((-588 : Rat) / 67) [(1, 1), (9, 1), (10, 1)],
  term ((-1176 : Rat) / 67) [(1, 1), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((588 : Rat) / 67) [(1, 1), (9, 1), (10, 1), (11, 2)],
  term ((1176 : Rat) / 67) [(1, 1), (9, 1), (10, 1), (14, 1)],
  term ((-1176 : Rat) / 67) [(1, 1), (9, 1), (10, 2), (14, 1)],
  term ((588 : Rat) / 67) [(1, 1), (9, 1), (10, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 69 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0069_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0069
        rs_R009_ueqv_R009NNNYN_generator_29_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_29_0069 := by
  native_decide

/-- Coefficient term 70 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0070 : Poly :=
[
  term ((8508416 : Rat) / 182797) [(1, 1), (9, 1), (11, 1), (13, 1)]
]

/-- Partial product 70 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0070 : Poly :=
[
  term ((17016832 : Rat) / 182797) [(1, 1), (9, 1), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((-8508416 : Rat) / 182797) [(1, 1), (9, 1), (10, 2), (11, 1), (13, 1)],
  term ((8508416 : Rat) / 182797) [(1, 1), (9, 1), (11, 1), (13, 1)],
  term ((-17016832 : Rat) / 182797) [(1, 1), (9, 1), (11, 1), (13, 1), (14, 1)],
  term ((17016832 : Rat) / 182797) [(1, 1), (9, 1), (11, 2), (13, 1), (15, 1)],
  term ((-8508416 : Rat) / 182797) [(1, 1), (9, 1), (11, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 70 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0070_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0070
        rs_R009_ueqv_R009NNNYN_generator_29_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_29_0070 := by
  native_decide

/-- Coefficient term 71 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0071 : Poly :=
[
  term ((-487752688 : Rat) / 12247399) [(1, 1), (9, 1), (13, 1), (15, 1)]
]

/-- Partial product 71 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0071 : Poly :=
[
  term ((-975505376 : Rat) / 12247399) [(1, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((487752688 : Rat) / 12247399) [(1, 1), (9, 1), (10, 2), (13, 1), (15, 1)],
  term ((-975505376 : Rat) / 12247399) [(1, 1), (9, 1), (11, 1), (13, 1), (15, 2)],
  term ((487752688 : Rat) / 12247399) [(1, 1), (9, 1), (11, 2), (13, 1), (15, 1)],
  term ((975505376 : Rat) / 12247399) [(1, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((-487752688 : Rat) / 12247399) [(1, 1), (9, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 71 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0071_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0071
        rs_R009_ueqv_R009NNNYN_generator_29_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_29_0071 := by
  native_decide

/-- Coefficient term 72 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0072 : Poly :=
[
  term ((3589488 : Rat) / 182797) [(1, 1), (9, 1), (13, 2)]
]

/-- Partial product 72 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0072 : Poly :=
[
  term ((7178976 : Rat) / 182797) [(1, 1), (9, 1), (10, 1), (13, 2), (14, 1)],
  term ((-3589488 : Rat) / 182797) [(1, 1), (9, 1), (10, 2), (13, 2)],
  term ((7178976 : Rat) / 182797) [(1, 1), (9, 1), (11, 1), (13, 2), (15, 1)],
  term ((-3589488 : Rat) / 182797) [(1, 1), (9, 1), (11, 2), (13, 2)],
  term ((3589488 : Rat) / 182797) [(1, 1), (9, 1), (13, 2)],
  term ((-7178976 : Rat) / 182797) [(1, 1), (9, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 72 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0072_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0072
        rs_R009_ueqv_R009NNNYN_generator_29_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_29_0072 := by
  native_decide

/-- Coefficient term 73 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0073 : Poly :=
[
  term ((57187651136 : Rat) / 1163502905) [(1, 1), (10, 1), (11, 1)]
]

/-- Partial product 73 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0073 : Poly :=
[
  term ((57187651136 : Rat) / 1163502905) [(1, 1), (10, 1), (11, 1)],
  term ((-114375302272 : Rat) / 1163502905) [(1, 1), (10, 1), (11, 1), (14, 1)],
  term ((114375302272 : Rat) / 1163502905) [(1, 1), (10, 1), (11, 2), (15, 1)],
  term ((-57187651136 : Rat) / 1163502905) [(1, 1), (10, 1), (11, 3)],
  term ((114375302272 : Rat) / 1163502905) [(1, 1), (10, 2), (11, 1), (14, 1)],
  term ((-57187651136 : Rat) / 1163502905) [(1, 1), (10, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 73 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0073_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0073
        rs_R009_ueqv_R009NNNYN_generator_29_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_29_0073 := by
  native_decide

/-- Coefficient term 74 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0074 : Poly :=
[
  term ((-38993920 : Rat) / 110226591) [(1, 1), (10, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 74 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0074 : Poly :=
[
  term ((77987840 : Rat) / 110226591) [(1, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-38993920 : Rat) / 110226591) [(1, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-77987840 : Rat) / 110226591) [(1, 1), (10, 1), (11, 2), (13, 1), (15, 2)],
  term ((38993920 : Rat) / 110226591) [(1, 1), (10, 1), (11, 3), (13, 1), (15, 1)],
  term ((-77987840 : Rat) / 110226591) [(1, 1), (10, 2), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((38993920 : Rat) / 110226591) [(1, 1), (10, 3), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 74 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0074_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0074
        rs_R009_ueqv_R009NNNYN_generator_29_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_29_0074 := by
  native_decide

/-- Coefficient term 75 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0075 : Poly :=
[
  term ((19496960 : Rat) / 36742197) [(1, 1), (10, 1), (11, 1), (15, 2)]
]

/-- Partial product 75 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0075 : Poly :=
[
  term ((-38993920 : Rat) / 36742197) [(1, 1), (10, 1), (11, 1), (14, 1), (15, 2)],
  term ((19496960 : Rat) / 36742197) [(1, 1), (10, 1), (11, 1), (15, 2)],
  term ((38993920 : Rat) / 36742197) [(1, 1), (10, 1), (11, 2), (15, 3)],
  term ((-19496960 : Rat) / 36742197) [(1, 1), (10, 1), (11, 3), (15, 2)],
  term ((38993920 : Rat) / 36742197) [(1, 1), (10, 2), (11, 1), (14, 1), (15, 2)],
  term ((-19496960 : Rat) / 36742197) [(1, 1), (10, 3), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 75 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0075_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0075
        rs_R009_ueqv_R009NNNYN_generator_29_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_29_0075 := by
  native_decide

/-- Coefficient term 76 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0076 : Poly :=
[
  term ((24126040323 : Rat) / 1163502905) [(1, 1), (10, 1), (13, 1)]
]

/-- Partial product 76 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0076 : Poly :=
[
  term ((48252080646 : Rat) / 1163502905) [(1, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-24126040323 : Rat) / 1163502905) [(1, 1), (10, 1), (11, 2), (13, 1)],
  term ((24126040323 : Rat) / 1163502905) [(1, 1), (10, 1), (13, 1)],
  term ((-48252080646 : Rat) / 1163502905) [(1, 1), (10, 1), (13, 1), (14, 1)],
  term ((48252080646 : Rat) / 1163502905) [(1, 1), (10, 2), (13, 1), (14, 1)],
  term ((-24126040323 : Rat) / 1163502905) [(1, 1), (10, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 76 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0076_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0076
        rs_R009_ueqv_R009NNNYN_generator_29_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_29_0076 := by
  native_decide

/-- Coefficient term 77 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0077 : Poly :=
[
  term ((59840000 : Rat) / 110226591) [(1, 1), (10, 1), (13, 1), (15, 2)]
]

/-- Partial product 77 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0077 : Poly :=
[
  term ((119680000 : Rat) / 110226591) [(1, 1), (10, 1), (11, 1), (13, 1), (15, 3)],
  term ((-59840000 : Rat) / 110226591) [(1, 1), (10, 1), (11, 2), (13, 1), (15, 2)],
  term ((-119680000 : Rat) / 110226591) [(1, 1), (10, 1), (13, 1), (14, 1), (15, 2)],
  term ((59840000 : Rat) / 110226591) [(1, 1), (10, 1), (13, 1), (15, 2)],
  term ((119680000 : Rat) / 110226591) [(1, 1), (10, 2), (13, 1), (14, 1), (15, 2)],
  term ((-59840000 : Rat) / 110226591) [(1, 1), (10, 3), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 77 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0077_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0077
        rs_R009_ueqv_R009NNNYN_generator_29_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_29_0077 := by
  native_decide

/-- Coefficient term 78 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0078 : Poly :=
[
  term ((-1827840 : Rat) / 12247399) [(1, 1), (10, 1), (13, 2), (15, 1)]
]

/-- Partial product 78 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0078 : Poly :=
[
  term ((-3655680 : Rat) / 12247399) [(1, 1), (10, 1), (11, 1), (13, 2), (15, 2)],
  term ((1827840 : Rat) / 12247399) [(1, 1), (10, 1), (11, 2), (13, 2), (15, 1)],
  term ((3655680 : Rat) / 12247399) [(1, 1), (10, 1), (13, 2), (14, 1), (15, 1)],
  term ((-1827840 : Rat) / 12247399) [(1, 1), (10, 1), (13, 2), (15, 1)],
  term ((-3655680 : Rat) / 12247399) [(1, 1), (10, 2), (13, 2), (14, 1), (15, 1)],
  term ((1827840 : Rat) / 12247399) [(1, 1), (10, 3), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 78 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0078_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0078
        rs_R009_ueqv_R009NNNYN_generator_29_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_29_0078 := by
  native_decide

/-- Coefficient term 79 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0079 : Poly :=
[
  term ((-54974686968 : Rat) / 1163502905) [(1, 1), (10, 1), (15, 1)]
]

/-- Partial product 79 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0079 : Poly :=
[
  term ((-109949373936 : Rat) / 1163502905) [(1, 1), (10, 1), (11, 1), (15, 2)],
  term ((54974686968 : Rat) / 1163502905) [(1, 1), (10, 1), (11, 2), (15, 1)],
  term ((109949373936 : Rat) / 1163502905) [(1, 1), (10, 1), (14, 1), (15, 1)],
  term ((-54974686968 : Rat) / 1163502905) [(1, 1), (10, 1), (15, 1)],
  term ((-109949373936 : Rat) / 1163502905) [(1, 1), (10, 2), (14, 1), (15, 1)],
  term ((54974686968 : Rat) / 1163502905) [(1, 1), (10, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 79 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0079_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0079
        rs_R009_ueqv_R009NNNYN_generator_29_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_29_0079 := by
  native_decide

/-- Coefficient term 80 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0080 : Poly :=
[
  term ((-17582080 : Rat) / 36742197) [(1, 1), (10, 1), (15, 3)]
]

/-- Partial product 80 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0080 : Poly :=
[
  term ((-35164160 : Rat) / 36742197) [(1, 1), (10, 1), (11, 1), (15, 4)],
  term ((17582080 : Rat) / 36742197) [(1, 1), (10, 1), (11, 2), (15, 3)],
  term ((35164160 : Rat) / 36742197) [(1, 1), (10, 1), (14, 1), (15, 3)],
  term ((-17582080 : Rat) / 36742197) [(1, 1), (10, 1), (15, 3)],
  term ((-35164160 : Rat) / 36742197) [(1, 1), (10, 2), (14, 1), (15, 3)],
  term ((17582080 : Rat) / 36742197) [(1, 1), (10, 3), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 80 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0080_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0080
        rs_R009_ueqv_R009NNNYN_generator_29_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_29_0080 := by
  native_decide

/-- Coefficient term 81 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0081 : Poly :=
[
  term ((-800732495608 : Rat) / 31414578435) [(1, 1), (11, 1)]
]

/-- Partial product 81 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0081 : Poly :=
[
  term ((-1601464991216 : Rat) / 31414578435) [(1, 1), (10, 1), (11, 1), (14, 1)],
  term ((800732495608 : Rat) / 31414578435) [(1, 1), (10, 2), (11, 1)],
  term ((-800732495608 : Rat) / 31414578435) [(1, 1), (11, 1)],
  term ((1601464991216 : Rat) / 31414578435) [(1, 1), (11, 1), (14, 1)],
  term ((-1601464991216 : Rat) / 31414578435) [(1, 1), (11, 2), (15, 1)],
  term ((800732495608 : Rat) / 31414578435) [(1, 1), (11, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 81 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0081_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0081
        rs_R009_ueqv_R009NNNYN_generator_29_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_29_0081 := by
  native_decide

/-- Coefficient term 82 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0082 : Poly :=
[
  term ((-13142182144 : Rat) / 330679773) [(1, 1), (11, 1), (12, 1)]
]

/-- Partial product 82 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0082 : Poly :=
[
  term ((-26284364288 : Rat) / 330679773) [(1, 1), (10, 1), (11, 1), (12, 1), (14, 1)],
  term ((13142182144 : Rat) / 330679773) [(1, 1), (10, 2), (11, 1), (12, 1)],
  term ((-13142182144 : Rat) / 330679773) [(1, 1), (11, 1), (12, 1)],
  term ((26284364288 : Rat) / 330679773) [(1, 1), (11, 1), (12, 1), (14, 1)],
  term ((-26284364288 : Rat) / 330679773) [(1, 1), (11, 2), (12, 1), (15, 1)],
  term ((13142182144 : Rat) / 330679773) [(1, 1), (11, 3), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 82 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0082_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0082
        rs_R009_ueqv_R009NNNYN_generator_29_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_29_0082 := by
  native_decide

/-- Coefficient term 83 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0083 : Poly :=
[
  term ((-576880640 : Rat) / 330679773) [(1, 1), (11, 1), (12, 1), (14, 1)]
]

/-- Partial product 83 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0083 : Poly :=
[
  term ((-1153761280 : Rat) / 330679773) [(1, 1), (10, 1), (11, 1), (12, 1), (14, 2)],
  term ((576880640 : Rat) / 330679773) [(1, 1), (10, 2), (11, 1), (12, 1), (14, 1)],
  term ((-576880640 : Rat) / 330679773) [(1, 1), (11, 1), (12, 1), (14, 1)],
  term ((1153761280 : Rat) / 330679773) [(1, 1), (11, 1), (12, 1), (14, 2)],
  term ((-1153761280 : Rat) / 330679773) [(1, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((576880640 : Rat) / 330679773) [(1, 1), (11, 3), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 83 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0083_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0083
        rs_R009_ueqv_R009NNNYN_generator_29_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_29_0083 := by
  native_decide

/-- Coefficient term 84 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0084 : Poly :=
[
  term ((-242385920 : Rat) / 330679773) [(1, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 84 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0084 : Poly :=
[
  term ((-484771840 : Rat) / 330679773) [(1, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((242385920 : Rat) / 330679773) [(1, 1), (10, 2), (11, 1), (13, 1), (15, 1)],
  term ((484771840 : Rat) / 330679773) [(1, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-242385920 : Rat) / 330679773) [(1, 1), (11, 1), (13, 1), (15, 1)],
  term ((-484771840 : Rat) / 330679773) [(1, 1), (11, 2), (13, 1), (15, 2)],
  term ((242385920 : Rat) / 330679773) [(1, 1), (11, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 84 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0084_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0084
        rs_R009_ueqv_R009NNNYN_generator_29_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_29_0084 := by
  native_decide

/-- Coefficient term 85 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0085 : Poly :=
[
  term ((9329684224 : Rat) / 330679773) [(1, 1), (11, 1), (14, 1)]
]

/-- Partial product 85 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0085 : Poly :=
[
  term ((18659368448 : Rat) / 330679773) [(1, 1), (10, 1), (11, 1), (14, 2)],
  term ((-9329684224 : Rat) / 330679773) [(1, 1), (10, 2), (11, 1), (14, 1)],
  term ((9329684224 : Rat) / 330679773) [(1, 1), (11, 1), (14, 1)],
  term ((-18659368448 : Rat) / 330679773) [(1, 1), (11, 1), (14, 2)],
  term ((18659368448 : Rat) / 330679773) [(1, 1), (11, 2), (14, 1), (15, 1)],
  term ((-9329684224 : Rat) / 330679773) [(1, 1), (11, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 85 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0085_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0085
        rs_R009_ueqv_R009NNNYN_generator_29_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_29_0085 := by
  native_decide

/-- Coefficient term 86 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0086 : Poly :=
[
  term ((288440320 : Rat) / 330679773) [(1, 1), (11, 1), (14, 2)]
]

/-- Partial product 86 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0086 : Poly :=
[
  term ((576880640 : Rat) / 330679773) [(1, 1), (10, 1), (11, 1), (14, 3)],
  term ((-288440320 : Rat) / 330679773) [(1, 1), (10, 2), (11, 1), (14, 2)],
  term ((288440320 : Rat) / 330679773) [(1, 1), (11, 1), (14, 2)],
  term ((-576880640 : Rat) / 330679773) [(1, 1), (11, 1), (14, 3)],
  term ((576880640 : Rat) / 330679773) [(1, 1), (11, 2), (14, 2), (15, 1)],
  term ((-288440320 : Rat) / 330679773) [(1, 1), (11, 3), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 86 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0086_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0086
        rs_R009_ueqv_R009NNNYN_generator_29_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_29_0086 := by
  native_decide

/-- Coefficient term 87 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0087 : Poly :=
[
  term ((-370626560 : Rat) / 330679773) [(1, 1), (11, 1), (15, 2)]
]

/-- Partial product 87 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0087 : Poly :=
[
  term ((-741253120 : Rat) / 330679773) [(1, 1), (10, 1), (11, 1), (14, 1), (15, 2)],
  term ((370626560 : Rat) / 330679773) [(1, 1), (10, 2), (11, 1), (15, 2)],
  term ((741253120 : Rat) / 330679773) [(1, 1), (11, 1), (14, 1), (15, 2)],
  term ((-370626560 : Rat) / 330679773) [(1, 1), (11, 1), (15, 2)],
  term ((-741253120 : Rat) / 330679773) [(1, 1), (11, 2), (15, 3)],
  term ((370626560 : Rat) / 330679773) [(1, 1), (11, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 87 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0087_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0087
        rs_R009_ueqv_R009NNNYN_generator_29_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_29_0087 := by
  native_decide

/-- Coefficient term 88 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0088 : Poly :=
[
  term ((194969600 : Rat) / 110226591) [(1, 1), (11, 2), (15, 1)]
]

/-- Partial product 88 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0088 : Poly :=
[
  term ((389939200 : Rat) / 110226591) [(1, 1), (10, 1), (11, 2), (14, 1), (15, 1)],
  term ((-194969600 : Rat) / 110226591) [(1, 1), (10, 2), (11, 2), (15, 1)],
  term ((-389939200 : Rat) / 110226591) [(1, 1), (11, 2), (14, 1), (15, 1)],
  term ((194969600 : Rat) / 110226591) [(1, 1), (11, 2), (15, 1)],
  term ((389939200 : Rat) / 110226591) [(1, 1), (11, 3), (15, 2)],
  term ((-194969600 : Rat) / 110226591) [(1, 1), (11, 4), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 88 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0088_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0088
        rs_R009_ueqv_R009NNNYN_generator_29_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_29_0088 := by
  native_decide

/-- Coefficient term 89 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0089 : Poly :=
[
  term ((-205346596 : Rat) / 12247399) [(1, 1), (12, 1), (13, 1)]
]

/-- Partial product 89 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0089 : Poly :=
[
  term ((-410693192 : Rat) / 12247399) [(1, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((205346596 : Rat) / 12247399) [(1, 1), (10, 2), (12, 1), (13, 1)],
  term ((-410693192 : Rat) / 12247399) [(1, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((205346596 : Rat) / 12247399) [(1, 1), (11, 2), (12, 1), (13, 1)],
  term ((-205346596 : Rat) / 12247399) [(1, 1), (12, 1), (13, 1)],
  term ((410693192 : Rat) / 12247399) [(1, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 89 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0089_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0089
        rs_R009_ueqv_R009NNNYN_generator_29_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_29_0089 := by
  native_decide

/-- Coefficient term 90 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0090 : Poly :=
[
  term ((-9013760 : Rat) / 12247399) [(1, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 90 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0090 : Poly :=
[
  term ((-18027520 : Rat) / 12247399) [(1, 1), (10, 1), (12, 1), (13, 1), (14, 2)],
  term ((9013760 : Rat) / 12247399) [(1, 1), (10, 2), (12, 1), (13, 1), (14, 1)],
  term ((-18027520 : Rat) / 12247399) [(1, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((9013760 : Rat) / 12247399) [(1, 1), (11, 2), (12, 1), (13, 1), (14, 1)],
  term ((-9013760 : Rat) / 12247399) [(1, 1), (12, 1), (13, 1), (14, 1)],
  term ((18027520 : Rat) / 12247399) [(1, 1), (12, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 90 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0090_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0090
        rs_R009_ueqv_R009NNNYN_generator_29_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_29_0090 := by
  native_decide

/-- Coefficient term 91 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0091 : Poly :=
[
  term ((520222720 : Rat) / 330679773) [(1, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 91 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0091 : Poly :=
[
  term ((1040445440 : Rat) / 330679773) [(1, 1), (10, 1), (12, 1), (14, 2), (15, 1)],
  term ((-520222720 : Rat) / 330679773) [(1, 1), (10, 2), (12, 1), (14, 1), (15, 1)],
  term ((1040445440 : Rat) / 330679773) [(1, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((-520222720 : Rat) / 330679773) [(1, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((520222720 : Rat) / 330679773) [(1, 1), (12, 1), (14, 1), (15, 1)],
  term ((-1040445440 : Rat) / 330679773) [(1, 1), (12, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 91 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0091_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0091
        rs_R009_ueqv_R009NNNYN_generator_29_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_29_0091 := by
  native_decide

/-- Coefficient term 92 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0092 : Poly :=
[
  term ((11496074744 : Rat) / 330679773) [(1, 1), (12, 1), (15, 1)]
]

/-- Partial product 92 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0092 : Poly :=
[
  term ((22992149488 : Rat) / 330679773) [(1, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-11496074744 : Rat) / 330679773) [(1, 1), (10, 2), (12, 1), (15, 1)],
  term ((22992149488 : Rat) / 330679773) [(1, 1), (11, 1), (12, 1), (15, 2)],
  term ((-11496074744 : Rat) / 330679773) [(1, 1), (11, 2), (12, 1), (15, 1)],
  term ((-22992149488 : Rat) / 330679773) [(1, 1), (12, 1), (14, 1), (15, 1)],
  term ((11496074744 : Rat) / 330679773) [(1, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 92 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0092_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0092
        rs_R009_ueqv_R009NNNYN_generator_29_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_29_0092 := by
  native_decide

/-- Coefficient term 93 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0093 : Poly :=
[
  term ((-53562338263 : Rat) / 4654011620) [(1, 1), (13, 1)]
]

/-- Partial product 93 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0093 : Poly :=
[
  term ((-53562338263 : Rat) / 2327005810) [(1, 1), (10, 1), (13, 1), (14, 1)],
  term ((53562338263 : Rat) / 4654011620) [(1, 1), (10, 2), (13, 1)],
  term ((-53562338263 : Rat) / 2327005810) [(1, 1), (11, 1), (13, 1), (15, 1)],
  term ((53562338263 : Rat) / 4654011620) [(1, 1), (11, 2), (13, 1)],
  term ((-53562338263 : Rat) / 4654011620) [(1, 1), (13, 1)],
  term ((53562338263 : Rat) / 2327005810) [(1, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 93 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0093_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0093
        rs_R009_ueqv_R009NNNYN_generator_29_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_29_0093 := by
  native_decide

/-- Coefficient term 94 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0094 : Poly :=
[
  term ((145776316 : Rat) / 12247399) [(1, 1), (13, 1), (14, 1)]
]

/-- Partial product 94 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0094 : Poly :=
[
  term ((291552632 : Rat) / 12247399) [(1, 1), (10, 1), (13, 1), (14, 2)],
  term ((-145776316 : Rat) / 12247399) [(1, 1), (10, 2), (13, 1), (14, 1)],
  term ((291552632 : Rat) / 12247399) [(1, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-145776316 : Rat) / 12247399) [(1, 1), (11, 2), (13, 1), (14, 1)],
  term ((145776316 : Rat) / 12247399) [(1, 1), (13, 1), (14, 1)],
  term ((-291552632 : Rat) / 12247399) [(1, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 94 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0094_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0094
        rs_R009_ueqv_R009NNNYN_generator_29_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_29_0094 := by
  native_decide

/-- Coefficient term 95 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0095 : Poly :=
[
  term ((4506880 : Rat) / 12247399) [(1, 1), (13, 1), (14, 2)]
]

/-- Partial product 95 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0095 : Poly :=
[
  term ((9013760 : Rat) / 12247399) [(1, 1), (10, 1), (13, 1), (14, 3)],
  term ((-4506880 : Rat) / 12247399) [(1, 1), (10, 2), (13, 1), (14, 2)],
  term ((9013760 : Rat) / 12247399) [(1, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((-4506880 : Rat) / 12247399) [(1, 1), (11, 2), (13, 1), (14, 2)],
  term ((4506880 : Rat) / 12247399) [(1, 1), (13, 1), (14, 2)],
  term ((-9013760 : Rat) / 12247399) [(1, 1), (13, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 95 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0095_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0095
        rs_R009_ueqv_R009NNNYN_generator_29_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_29_0095 := by
  native_decide

/-- Coefficient term 96 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0096 : Poly :=
[
  term ((507268480 : Rat) / 330679773) [(1, 1), (13, 1), (15, 2)]
]

/-- Partial product 96 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0096 : Poly :=
[
  term ((1014536960 : Rat) / 330679773) [(1, 1), (10, 1), (13, 1), (14, 1), (15, 2)],
  term ((-507268480 : Rat) / 330679773) [(1, 1), (10, 2), (13, 1), (15, 2)],
  term ((1014536960 : Rat) / 330679773) [(1, 1), (11, 1), (13, 1), (15, 3)],
  term ((-507268480 : Rat) / 330679773) [(1, 1), (11, 2), (13, 1), (15, 2)],
  term ((-1014536960 : Rat) / 330679773) [(1, 1), (13, 1), (14, 1), (15, 2)],
  term ((507268480 : Rat) / 330679773) [(1, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 96 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0096_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0096
        rs_R009_ueqv_R009NNNYN_generator_29_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_29_0096 := by
  native_decide

/-- Coefficient term 97 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0097 : Poly :=
[
  term ((-7642880 : Rat) / 12247399) [(1, 1), (13, 2), (15, 1)]
]

/-- Partial product 97 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0097 : Poly :=
[
  term ((-15285760 : Rat) / 12247399) [(1, 1), (10, 1), (13, 2), (14, 1), (15, 1)],
  term ((7642880 : Rat) / 12247399) [(1, 1), (10, 2), (13, 2), (15, 1)],
  term ((-15285760 : Rat) / 12247399) [(1, 1), (11, 1), (13, 2), (15, 2)],
  term ((7642880 : Rat) / 12247399) [(1, 1), (11, 2), (13, 2), (15, 1)],
  term ((15285760 : Rat) / 12247399) [(1, 1), (13, 2), (14, 1), (15, 1)],
  term ((-7642880 : Rat) / 12247399) [(1, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 97 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0097_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0097
        rs_R009_ueqv_R009NNNYN_generator_29_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_29_0097 := by
  native_decide

/-- Coefficient term 98 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0098 : Poly :=
[
  term ((-8413375952 : Rat) / 330679773) [(1, 1), (14, 1), (15, 1)]
]

/-- Partial product 98 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0098 : Poly :=
[
  term ((-16826751904 : Rat) / 330679773) [(1, 1), (10, 1), (14, 2), (15, 1)],
  term ((8413375952 : Rat) / 330679773) [(1, 1), (10, 2), (14, 1), (15, 1)],
  term ((-16826751904 : Rat) / 330679773) [(1, 1), (11, 1), (14, 1), (15, 2)],
  term ((8413375952 : Rat) / 330679773) [(1, 1), (11, 2), (14, 1), (15, 1)],
  term ((-8413375952 : Rat) / 330679773) [(1, 1), (14, 1), (15, 1)],
  term ((16826751904 : Rat) / 330679773) [(1, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 98 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0098_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0098
        rs_R009_ueqv_R009NNNYN_generator_29_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_29_0098 := by
  native_decide

/-- Coefficient term 99 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0099 : Poly :=
[
  term ((-260111360 : Rat) / 330679773) [(1, 1), (14, 2), (15, 1)]
]

/-- Partial product 99 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0099 : Poly :=
[
  term ((-520222720 : Rat) / 330679773) [(1, 1), (10, 1), (14, 3), (15, 1)],
  term ((260111360 : Rat) / 330679773) [(1, 1), (10, 2), (14, 2), (15, 1)],
  term ((-520222720 : Rat) / 330679773) [(1, 1), (11, 1), (14, 2), (15, 2)],
  term ((260111360 : Rat) / 330679773) [(1, 1), (11, 2), (14, 2), (15, 1)],
  term ((-260111360 : Rat) / 330679773) [(1, 1), (14, 2), (15, 1)],
  term ((520222720 : Rat) / 330679773) [(1, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 99 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0099_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0099
        rs_R009_ueqv_R009NNNYN_generator_29_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_29_0099 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NNNYN_partials_29_0000_0099 : List Poly :=
[
  rs_R009_ueqv_R009NNNYN_partial_29_0000,
  rs_R009_ueqv_R009NNNYN_partial_29_0001,
  rs_R009_ueqv_R009NNNYN_partial_29_0002,
  rs_R009_ueqv_R009NNNYN_partial_29_0003,
  rs_R009_ueqv_R009NNNYN_partial_29_0004,
  rs_R009_ueqv_R009NNNYN_partial_29_0005,
  rs_R009_ueqv_R009NNNYN_partial_29_0006,
  rs_R009_ueqv_R009NNNYN_partial_29_0007,
  rs_R009_ueqv_R009NNNYN_partial_29_0008,
  rs_R009_ueqv_R009NNNYN_partial_29_0009,
  rs_R009_ueqv_R009NNNYN_partial_29_0010,
  rs_R009_ueqv_R009NNNYN_partial_29_0011,
  rs_R009_ueqv_R009NNNYN_partial_29_0012,
  rs_R009_ueqv_R009NNNYN_partial_29_0013,
  rs_R009_ueqv_R009NNNYN_partial_29_0014,
  rs_R009_ueqv_R009NNNYN_partial_29_0015,
  rs_R009_ueqv_R009NNNYN_partial_29_0016,
  rs_R009_ueqv_R009NNNYN_partial_29_0017,
  rs_R009_ueqv_R009NNNYN_partial_29_0018,
  rs_R009_ueqv_R009NNNYN_partial_29_0019,
  rs_R009_ueqv_R009NNNYN_partial_29_0020,
  rs_R009_ueqv_R009NNNYN_partial_29_0021,
  rs_R009_ueqv_R009NNNYN_partial_29_0022,
  rs_R009_ueqv_R009NNNYN_partial_29_0023,
  rs_R009_ueqv_R009NNNYN_partial_29_0024,
  rs_R009_ueqv_R009NNNYN_partial_29_0025,
  rs_R009_ueqv_R009NNNYN_partial_29_0026,
  rs_R009_ueqv_R009NNNYN_partial_29_0027,
  rs_R009_ueqv_R009NNNYN_partial_29_0028,
  rs_R009_ueqv_R009NNNYN_partial_29_0029,
  rs_R009_ueqv_R009NNNYN_partial_29_0030,
  rs_R009_ueqv_R009NNNYN_partial_29_0031,
  rs_R009_ueqv_R009NNNYN_partial_29_0032,
  rs_R009_ueqv_R009NNNYN_partial_29_0033,
  rs_R009_ueqv_R009NNNYN_partial_29_0034,
  rs_R009_ueqv_R009NNNYN_partial_29_0035,
  rs_R009_ueqv_R009NNNYN_partial_29_0036,
  rs_R009_ueqv_R009NNNYN_partial_29_0037,
  rs_R009_ueqv_R009NNNYN_partial_29_0038,
  rs_R009_ueqv_R009NNNYN_partial_29_0039,
  rs_R009_ueqv_R009NNNYN_partial_29_0040,
  rs_R009_ueqv_R009NNNYN_partial_29_0041,
  rs_R009_ueqv_R009NNNYN_partial_29_0042,
  rs_R009_ueqv_R009NNNYN_partial_29_0043,
  rs_R009_ueqv_R009NNNYN_partial_29_0044,
  rs_R009_ueqv_R009NNNYN_partial_29_0045,
  rs_R009_ueqv_R009NNNYN_partial_29_0046,
  rs_R009_ueqv_R009NNNYN_partial_29_0047,
  rs_R009_ueqv_R009NNNYN_partial_29_0048,
  rs_R009_ueqv_R009NNNYN_partial_29_0049,
  rs_R009_ueqv_R009NNNYN_partial_29_0050,
  rs_R009_ueqv_R009NNNYN_partial_29_0051,
  rs_R009_ueqv_R009NNNYN_partial_29_0052,
  rs_R009_ueqv_R009NNNYN_partial_29_0053,
  rs_R009_ueqv_R009NNNYN_partial_29_0054,
  rs_R009_ueqv_R009NNNYN_partial_29_0055,
  rs_R009_ueqv_R009NNNYN_partial_29_0056,
  rs_R009_ueqv_R009NNNYN_partial_29_0057,
  rs_R009_ueqv_R009NNNYN_partial_29_0058,
  rs_R009_ueqv_R009NNNYN_partial_29_0059,
  rs_R009_ueqv_R009NNNYN_partial_29_0060,
  rs_R009_ueqv_R009NNNYN_partial_29_0061,
  rs_R009_ueqv_R009NNNYN_partial_29_0062,
  rs_R009_ueqv_R009NNNYN_partial_29_0063,
  rs_R009_ueqv_R009NNNYN_partial_29_0064,
  rs_R009_ueqv_R009NNNYN_partial_29_0065,
  rs_R009_ueqv_R009NNNYN_partial_29_0066,
  rs_R009_ueqv_R009NNNYN_partial_29_0067,
  rs_R009_ueqv_R009NNNYN_partial_29_0068,
  rs_R009_ueqv_R009NNNYN_partial_29_0069,
  rs_R009_ueqv_R009NNNYN_partial_29_0070,
  rs_R009_ueqv_R009NNNYN_partial_29_0071,
  rs_R009_ueqv_R009NNNYN_partial_29_0072,
  rs_R009_ueqv_R009NNNYN_partial_29_0073,
  rs_R009_ueqv_R009NNNYN_partial_29_0074,
  rs_R009_ueqv_R009NNNYN_partial_29_0075,
  rs_R009_ueqv_R009NNNYN_partial_29_0076,
  rs_R009_ueqv_R009NNNYN_partial_29_0077,
  rs_R009_ueqv_R009NNNYN_partial_29_0078,
  rs_R009_ueqv_R009NNNYN_partial_29_0079,
  rs_R009_ueqv_R009NNNYN_partial_29_0080,
  rs_R009_ueqv_R009NNNYN_partial_29_0081,
  rs_R009_ueqv_R009NNNYN_partial_29_0082,
  rs_R009_ueqv_R009NNNYN_partial_29_0083,
  rs_R009_ueqv_R009NNNYN_partial_29_0084,
  rs_R009_ueqv_R009NNNYN_partial_29_0085,
  rs_R009_ueqv_R009NNNYN_partial_29_0086,
  rs_R009_ueqv_R009NNNYN_partial_29_0087,
  rs_R009_ueqv_R009NNNYN_partial_29_0088,
  rs_R009_ueqv_R009NNNYN_partial_29_0089,
  rs_R009_ueqv_R009NNNYN_partial_29_0090,
  rs_R009_ueqv_R009NNNYN_partial_29_0091,
  rs_R009_ueqv_R009NNNYN_partial_29_0092,
  rs_R009_ueqv_R009NNNYN_partial_29_0093,
  rs_R009_ueqv_R009NNNYN_partial_29_0094,
  rs_R009_ueqv_R009NNNYN_partial_29_0095,
  rs_R009_ueqv_R009NNNYN_partial_29_0096,
  rs_R009_ueqv_R009NNNYN_partial_29_0097,
  rs_R009_ueqv_R009NNNYN_partial_29_0098,
  rs_R009_ueqv_R009NNNYN_partial_29_0099
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NNNYN_block_29_0000_0099 : Poly :=
[
  term ((-1369 : Rat) / 536) [],
  term ((-1560885760 : Rat) / 330679773) [(0, 1), (2, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-24388840 : Rat) / 12247399) [(0, 1), (2, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((1407584480 : Rat) / 330679773) [(0, 1), (2, 1), (10, 1), (14, 1), (15, 2)],
  term ((780442880 : Rat) / 330679773) [(0, 1), (2, 1), (10, 2), (11, 1), (15, 1)],
  term ((12194420 : Rat) / 12247399) [(0, 1), (2, 1), (10, 2), (13, 1), (15, 1)],
  term ((-703792240 : Rat) / 330679773) [(0, 1), (2, 1), (10, 2), (15, 2)],
  term ((-24388840 : Rat) / 12247399) [(0, 1), (2, 1), (11, 1), (13, 1), (15, 2)],
  term ((1560885760 : Rat) / 330679773) [(0, 1), (2, 1), (11, 1), (14, 1), (15, 1)],
  term ((-780442880 : Rat) / 330679773) [(0, 1), (2, 1), (11, 1), (15, 1)],
  term ((1407584480 : Rat) / 330679773) [(0, 1), (2, 1), (11, 1), (15, 3)],
  term ((12194420 : Rat) / 12247399) [(0, 1), (2, 1), (11, 2), (13, 1), (15, 1)],
  term ((-2264678000 : Rat) / 330679773) [(0, 1), (2, 1), (11, 2), (15, 2)],
  term ((780442880 : Rat) / 330679773) [(0, 1), (2, 1), (11, 3), (15, 1)],
  term ((24388840 : Rat) / 12247399) [(0, 1), (2, 1), (13, 1), (14, 1), (15, 1)],
  term ((-12194420 : Rat) / 12247399) [(0, 1), (2, 1), (13, 1), (15, 1)],
  term ((-1407584480 : Rat) / 330679773) [(0, 1), (2, 1), (14, 1), (15, 2)],
  term ((703792240 : Rat) / 330679773) [(0, 1), (2, 1), (15, 2)],
  term ((-747765760 : Rat) / 110226591) [(0, 1), (3, 1), (10, 1), (11, 1), (14, 1)],
  term ((747765760 : Rat) / 110226591) [(0, 1), (3, 1), (10, 1), (11, 1), (14, 2)],
  term ((-35051520 : Rat) / 12247399) [(0, 1), (3, 1), (10, 1), (13, 1), (14, 1)],
  term ((35051520 : Rat) / 12247399) [(0, 1), (3, 1), (10, 1), (13, 1), (14, 2)],
  term ((674324480 : Rat) / 110226591) [(0, 1), (3, 1), (10, 1), (14, 1), (15, 1)],
  term ((-674324480 : Rat) / 110226591) [(0, 1), (3, 1), (10, 1), (14, 2), (15, 1)],
  term ((373882880 : Rat) / 110226591) [(0, 1), (3, 1), (10, 2), (11, 1)],
  term ((-373882880 : Rat) / 110226591) [(0, 1), (3, 1), (10, 2), (11, 1), (14, 1)],
  term ((17525760 : Rat) / 12247399) [(0, 1), (3, 1), (10, 2), (13, 1)],
  term ((-17525760 : Rat) / 12247399) [(0, 1), (3, 1), (10, 2), (13, 1), (14, 1)],
  term ((337162240 : Rat) / 110226591) [(0, 1), (3, 1), (10, 2), (14, 1), (15, 1)],
  term ((-337162240 : Rat) / 110226591) [(0, 1), (3, 1), (10, 2), (15, 1)],
  term ((-373882880 : Rat) / 110226591) [(0, 1), (3, 1), (11, 1)],
  term ((35051520 : Rat) / 12247399) [(0, 1), (3, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-35051520 : Rat) / 12247399) [(0, 1), (3, 1), (11, 1), (13, 1), (15, 1)],
  term ((373882880 : Rat) / 36742197) [(0, 1), (3, 1), (11, 1), (14, 1)],
  term ((-674324480 : Rat) / 110226591) [(0, 1), (3, 1), (11, 1), (14, 1), (15, 2)],
  term ((-747765760 : Rat) / 110226591) [(0, 1), (3, 1), (11, 1), (14, 2)],
  term ((674324480 : Rat) / 110226591) [(0, 1), (3, 1), (11, 1), (15, 2)],
  term ((17525760 : Rat) / 12247399) [(0, 1), (3, 1), (11, 2), (13, 1)],
  term ((-17525760 : Rat) / 12247399) [(0, 1), (3, 1), (11, 2), (13, 1), (14, 1)],
  term ((1084928000 : Rat) / 110226591) [(0, 1), (3, 1), (11, 2), (14, 1), (15, 1)],
  term ((-1084928000 : Rat) / 110226591) [(0, 1), (3, 1), (11, 2), (15, 1)],
  term ((373882880 : Rat) / 110226591) [(0, 1), (3, 1), (11, 3)],
  term ((-373882880 : Rat) / 110226591) [(0, 1), (3, 1), (11, 3), (14, 1)],
  term ((-17525760 : Rat) / 12247399) [(0, 1), (3, 1), (13, 1)],
  term ((52577280 : Rat) / 12247399) [(0, 1), (3, 1), (13, 1), (14, 1)],
  term ((-35051520 : Rat) / 12247399) [(0, 1), (3, 1), (13, 1), (14, 2)],
  term ((-337162240 : Rat) / 36742197) [(0, 1), (3, 1), (14, 1), (15, 1)],
  term ((674324480 : Rat) / 110226591) [(0, 1), (3, 1), (14, 2), (15, 1)],
  term ((337162240 : Rat) / 110226591) [(0, 1), (3, 1), (15, 1)],
  term ((3872167936 : Rat) / 110226591) [(0, 1), (4, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((181507872 : Rat) / 12247399) [(0, 1), (4, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-3491865728 : Rat) / 110226591) [(0, 1), (4, 1), (10, 1), (14, 1), (15, 2)],
  term ((-1936083968 : Rat) / 110226591) [(0, 1), (4, 1), (10, 2), (11, 1), (15, 1)],
  term ((-90753936 : Rat) / 12247399) [(0, 1), (4, 1), (10, 2), (13, 1), (15, 1)],
  term ((1745932864 : Rat) / 110226591) [(0, 1), (4, 1), (10, 2), (15, 2)],
  term ((181507872 : Rat) / 12247399) [(0, 1), (4, 1), (11, 1), (13, 1), (15, 2)],
  term ((-3872167936 : Rat) / 110226591) [(0, 1), (4, 1), (11, 1), (14, 1), (15, 1)],
  term ((1936083968 : Rat) / 110226591) [(0, 1), (4, 1), (11, 1), (15, 1)],
  term ((-3491865728 : Rat) / 110226591) [(0, 1), (4, 1), (11, 1), (15, 3)],
  term ((-90753936 : Rat) / 12247399) [(0, 1), (4, 1), (11, 2), (13, 1), (15, 1)],
  term ((5618100800 : Rat) / 110226591) [(0, 1), (4, 1), (11, 2), (15, 2)],
  term ((-1936083968 : Rat) / 110226591) [(0, 1), (4, 1), (11, 3), (15, 1)],
  term ((-181507872 : Rat) / 12247399) [(0, 1), (4, 1), (13, 1), (14, 1), (15, 1)],
  term ((90753936 : Rat) / 12247399) [(0, 1), (4, 1), (13, 1), (15, 1)],
  term ((3491865728 : Rat) / 110226591) [(0, 1), (4, 1), (14, 1), (15, 2)],
  term ((-1745932864 : Rat) / 110226591) [(0, 1), (4, 1), (15, 2)],
  term ((1176 : Rat) / 67) [(0, 1), (5, 1), (9, 1)],
  term ((2352 : Rat) / 67) [(0, 1), (5, 1), (9, 1), (10, 1), (14, 1)],
  term ((-1176 : Rat) / 67) [(0, 1), (5, 1), (9, 1), (10, 2)],
  term ((2352 : Rat) / 67) [(0, 1), (5, 1), (9, 1), (11, 1), (15, 1)],
  term ((-1176 : Rat) / 67) [(0, 1), (5, 1), (9, 1), (11, 2)],
  term ((-2352 : Rat) / 67) [(0, 1), (5, 1), (9, 1), (14, 1)],
  term ((155975680 : Rat) / 110226591) [(0, 1), (5, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((14728925752576 : Rat) / 94243735305) [(0, 1), (5, 1), (10, 1), (11, 1), (14, 1)],
  term ((-77987840 : Rat) / 36742197) [(0, 1), (5, 1), (10, 1), (11, 1), (14, 1), (15, 2)],
  term ((-3872167936 : Rat) / 110226591) [(0, 1), (5, 1), (10, 1), (11, 1), (14, 2)],
  term ((230139464884 : Rat) / 3490508715) [(0, 1), (5, 1), (10, 1), (13, 1), (14, 1)],
  term ((-239360000 : Rat) / 110226591) [(0, 1), (5, 1), (10, 1), (13, 1), (14, 1), (15, 2)],
  term ((-181507872 : Rat) / 12247399) [(0, 1), (5, 1), (10, 1), (13, 1), (14, 2)],
  term ((7311360 : Rat) / 12247399) [(0, 1), (5, 1), (10, 1), (13, 2), (14, 1), (15, 1)],
  term ((-12179542465088 : Rat) / 94243735305) [(0, 1), (5, 1), (10, 1), (14, 1), (15, 1)],
  term ((70328320 : Rat) / 36742197) [(0, 1), (5, 1), (10, 1), (14, 1), (15, 3)],
  term ((3491865728 : Rat) / 110226591) [(0, 1), (5, 1), (10, 1), (14, 2), (15, 1)],
  term ((-7364462876288 : Rat) / 94243735305) [(0, 1), (5, 1), (10, 2), (11, 1)],
  term ((-77987840 : Rat) / 110226591) [(0, 1), (5, 1), (10, 2), (11, 1), (13, 1), (15, 1)],
  term ((1936083968 : Rat) / 110226591) [(0, 1), (5, 1), (10, 2), (11, 1), (14, 1)],
  term ((38993920 : Rat) / 36742197) [(0, 1), (5, 1), (10, 2), (11, 1), (15, 2)],
  term ((-115069732442 : Rat) / 3490508715) [(0, 1), (5, 1), (10, 2), (13, 1)],
  term ((90753936 : Rat) / 12247399) [(0, 1), (5, 1), (10, 2), (13, 1), (14, 1)],
  term ((119680000 : Rat) / 110226591) [(0, 1), (5, 1), (10, 2), (13, 1), (15, 2)],
  term ((-3655680 : Rat) / 12247399) [(0, 1), (5, 1), (10, 2), (13, 2), (15, 1)],
  term ((-1745932864 : Rat) / 110226591) [(0, 1), (5, 1), (10, 2), (14, 1), (15, 1)],
  term ((6089771232544 : Rat) / 94243735305) [(0, 1), (5, 1), (10, 2), (15, 1)],
  term ((-35164160 : Rat) / 36742197) [(0, 1), (5, 1), (10, 2), (15, 3)],
  term ((7364462876288 : Rat) / 94243735305) [(0, 1), (5, 1), (11, 1)],
  term ((-1789546528 : Rat) / 110226591) [(0, 1), (5, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((697827239452 : Rat) / 10471526145) [(0, 1), (5, 1), (11, 1), (13, 1), (15, 1)],
  term ((-239360000 : Rat) / 110226591) [(0, 1), (5, 1), (11, 1), (13, 1), (15, 3)],
  term ((7311360 : Rat) / 12247399) [(0, 1), (5, 1), (11, 1), (13, 2), (15, 2)],
  term ((-16384277545216 : Rat) / 94243735305) [(0, 1), (5, 1), (11, 1), (14, 1)],
  term ((3725829248 : Rat) / 110226591) [(0, 1), (5, 1), (11, 1), (14, 1), (15, 2)],
  term ((3872167936 : Rat) / 110226591) [(0, 1), (5, 1), (11, 1), (14, 2)],
  term ((-12279561869888 : Rat) / 94243735305) [(0, 1), (5, 1), (11, 1), (15, 2)],
  term ((70328320 : Rat) / 36742197) [(0, 1), (5, 1), (11, 1), (15, 4)],
  term ((-115069732442 : Rat) / 3490508715) [(0, 1), (5, 1), (11, 2), (13, 1)],
  term ((90753936 : Rat) / 12247399) [(0, 1), (5, 1), (11, 2), (13, 1), (14, 1)],
  term ((275655680 : Rat) / 110226591) [(0, 1), (5, 1), (11, 2), (13, 1), (15, 2)],
  term ((-3655680 : Rat) / 12247399) [(0, 1), (5, 1), (11, 2), (13, 2), (15, 1)],
  term ((-5618100800 : Rat) / 110226591) [(0, 1), (5, 1), (11, 2), (14, 1), (15, 1)],
  term ((4163739397024 : Rat) / 18848747061) [(0, 1), (5, 1), (11, 2), (15, 1)],
  term ((-113152000 : Rat) / 36742197) [(0, 1), (5, 1), (11, 2), (15, 3)],
  term ((-7364462876288 : Rat) / 94243735305) [(0, 1), (5, 1), (11, 3)],
  term ((-77987840 : Rat) / 110226591) [(0, 1), (5, 1), (11, 3), (13, 1), (15, 1)],
  term ((1936083968 : Rat) / 110226591) [(0, 1), (5, 1), (11, 3), (14, 1)],
  term ((38993920 : Rat) / 36742197) [(0, 1), (5, 1), (11, 3), (15, 2)],
  term ((115069732442 : Rat) / 3490508715) [(0, 1), (5, 1), (13, 1)],
  term ((-256004336644 : Rat) / 3490508715) [(0, 1), (5, 1), (13, 1), (14, 1)],
  term ((239360000 : Rat) / 110226591) [(0, 1), (5, 1), (13, 1), (14, 1), (15, 2)],
  term ((181507872 : Rat) / 12247399) [(0, 1), (5, 1), (13, 1), (14, 2)],
  term ((-119680000 : Rat) / 110226591) [(0, 1), (5, 1), (13, 1), (15, 2)],
  term ((-7311360 : Rat) / 12247399) [(0, 1), (5, 1), (13, 2), (14, 1), (15, 1)],
  term ((3655680 : Rat) / 12247399) [(0, 1), (5, 1), (13, 2), (15, 1)],
  term ((13672315063808 : Rat) / 94243735305) [(0, 1), (5, 1), (14, 1), (15, 1)],
  term ((-70328320 : Rat) / 36742197) [(0, 1), (5, 1), (14, 1), (15, 3)],
  term ((-3491865728 : Rat) / 110226591) [(0, 1), (5, 1), (14, 2), (15, 1)],
  term ((-6089771232544 : Rat) / 94243735305) [(0, 1), (5, 1), (15, 1)],
  term ((35164160 : Rat) / 36742197) [(0, 1), (5, 1), (15, 3)],
  term ((-3764762624 : Rat) / 36742197) [(0, 1), (7, 1), (10, 1), (11, 1), (14, 1)],
  term ((14852561920 : Rat) / 330679773) [(0, 1), (7, 1), (10, 1), (11, 1), (14, 2)],
  term ((-529419744 : Rat) / 12247399) [(0, 1), (7, 1), (10, 1), (13, 1), (14, 1)],
  term ((232071280 : Rat) / 12247399) [(0, 1), (7, 1), (10, 1), (13, 1), (14, 2)],
  term ((3395009152 : Rat) / 36742197) [(0, 1), (7, 1), (10, 1), (14, 1), (15, 1)],
  term ((-13393828160 : Rat) / 330679773) [(0, 1), (7, 1), (10, 1), (14, 2), (15, 1)],
  term ((1882381312 : Rat) / 36742197) [(0, 1), (7, 1), (10, 2), (11, 1)],
  term ((-7426280960 : Rat) / 330679773) [(0, 1), (7, 1), (10, 2), (11, 1), (14, 1)],
  term ((264709872 : Rat) / 12247399) [(0, 1), (7, 1), (10, 2), (13, 1)],
  term ((-116035640 : Rat) / 12247399) [(0, 1), (7, 1), (10, 2), (13, 1), (14, 1)],
  term ((6696914080 : Rat) / 330679773) [(0, 1), (7, 1), (10, 2), (14, 1), (15, 1)],
  term ((-1697504576 : Rat) / 36742197) [(0, 1), (7, 1), (10, 2), (15, 1)],
  term ((-1882381312 : Rat) / 36742197) [(0, 1), (7, 1), (11, 1)],
  term ((232071280 : Rat) / 12247399) [(0, 1), (7, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-529419744 : Rat) / 12247399) [(0, 1), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((41309144576 : Rat) / 330679773) [(0, 1), (7, 1), (11, 1), (14, 1)],
  term ((-13393828160 : Rat) / 330679773) [(0, 1), (7, 1), (11, 1), (14, 1), (15, 2)],
  term ((-14852561920 : Rat) / 330679773) [(0, 1), (7, 1), (11, 1), (14, 2)],
  term ((3395009152 : Rat) / 36742197) [(0, 1), (7, 1), (11, 1), (15, 2)],
  term ((264709872 : Rat) / 12247399) [(0, 1), (7, 1), (11, 2), (13, 1)],
  term ((-116035640 : Rat) / 12247399) [(0, 1), (7, 1), (11, 2), (13, 1), (14, 1)],
  term ((21549476000 : Rat) / 330679773) [(0, 1), (7, 1), (11, 2), (14, 1), (15, 1)],
  term ((-5462267200 : Rat) / 36742197) [(0, 1), (7, 1), (11, 2), (15, 1)],
  term ((1882381312 : Rat) / 36742197) [(0, 1), (7, 1), (11, 3)],
  term ((-7426280960 : Rat) / 330679773) [(0, 1), (7, 1), (11, 3), (14, 1)],
  term ((-264709872 : Rat) / 12247399) [(0, 1), (7, 1), (13, 1)],
  term ((645455384 : Rat) / 12247399) [(0, 1), (7, 1), (13, 1), (14, 1)],
  term ((-232071280 : Rat) / 12247399) [(0, 1), (7, 1), (13, 1), (14, 2)],
  term ((-37251996448 : Rat) / 330679773) [(0, 1), (7, 1), (14, 1), (15, 1)],
  term ((13393828160 : Rat) / 330679773) [(0, 1), (7, 1), (14, 2), (15, 1)],
  term ((1697504576 : Rat) / 36742197) [(0, 1), (7, 1), (15, 1)],
  term ((-38993920 : Rat) / 110226591) [(0, 1), (9, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-4116310161544 : Rat) / 94243735305) [(0, 1), (9, 1), (10, 1), (11, 1), (14, 1)],
  term ((19496960 : Rat) / 36742197) [(0, 1), (9, 1), (10, 1), (11, 1), (14, 1), (15, 2)],
  term ((26868251648 : Rat) / 330679773) [(0, 1), (9, 1), (10, 1), (11, 1), (14, 2)],
  term ((-38470650211 : Rat) / 3490508715) [(0, 1), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((59840000 : Rat) / 110226591) [(0, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 2)],
  term ((419816432 : Rat) / 12247399) [(0, 1), (9, 1), (10, 1), (13, 1), (14, 2)],
  term ((-1827840 : Rat) / 12247399) [(0, 1), (9, 1), (10, 1), (13, 2), (14, 1), (15, 1)],
  term ((1944608006552 : Rat) / 94243735305) [(0, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-17582080 : Rat) / 36742197) [(0, 1), (9, 1), (10, 1), (14, 1), (15, 3)],
  term ((-24229405504 : Rat) / 330679773) [(0, 1), (9, 1), (10, 1), (14, 2), (15, 1)],
  term ((2058155080772 : Rat) / 94243735305) [(0, 1), (9, 1), (10, 2), (11, 1)],
  term ((19496960 : Rat) / 110226591) [(0, 1), (9, 1), (10, 2), (11, 1), (13, 1), (15, 1)],
  term ((-13434125824 : Rat) / 330679773) [(0, 1), (9, 1), (10, 2), (11, 1), (14, 1)],
  term ((-9748480 : Rat) / 36742197) [(0, 1), (9, 1), (10, 2), (11, 1), (15, 2)],
  term ((38470650211 : Rat) / 6981017430) [(0, 1), (9, 1), (10, 2), (13, 1)],
  term ((-209908216 : Rat) / 12247399) [(0, 1), (9, 1), (10, 2), (13, 1), (14, 1)],
  term ((-29920000 : Rat) / 110226591) [(0, 1), (9, 1), (10, 2), (13, 1), (15, 2)],
  term ((913920 : Rat) / 12247399) [(0, 1), (9, 1), (10, 2), (13, 2), (15, 1)],
  term ((12114702752 : Rat) / 330679773) [(0, 1), (9, 1), (10, 2), (14, 1), (15, 1)],
  term ((-972304003276 : Rat) / 94243735305) [(0, 1), (9, 1), (10, 2), (15, 1)],
  term ((8791040 : Rat) / 36742197) [(0, 1), (9, 1), (10, 2), (15, 3)],
  term ((-2058155080772 : Rat) / 94243735305) [(0, 1), (9, 1), (11, 1)],
  term ((3817341808 : Rat) / 110226591) [(0, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-117264161833 : Rat) / 10471526145) [(0, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((59840000 : Rat) / 110226591) [(0, 1), (9, 1), (11, 1), (13, 1), (15, 3)],
  term ((-1827840 : Rat) / 12247399) [(0, 1), (9, 1), (11, 1), (13, 2), (15, 2)],
  term ((7945036021384 : Rat) / 94243735305) [(0, 1), (9, 1), (11, 1), (14, 1)],
  term ((-24404878144 : Rat) / 330679773) [(0, 1), (9, 1), (11, 1), (14, 1), (15, 2)],
  term ((-26868251648 : Rat) / 330679773) [(0, 1), (9, 1), (11, 1), (14, 2)],
  term ((1969612857752 : Rat) / 94243735305) [(0, 1), (9, 1), (11, 1), (15, 2)],
  term ((-17582080 : Rat) / 36742197) [(0, 1), (9, 1), (11, 1), (15, 4)],
  term ((38470650211 : Rat) / 6981017430) [(0, 1), (9, 1), (11, 2), (13, 1)],
  term ((-209908216 : Rat) / 12247399) [(0, 1), (9, 1), (11, 2), (13, 1), (14, 1)],
  term ((-68913920 : Rat) / 110226591) [(0, 1), (9, 1), (11, 2), (13, 1), (15, 2)],
  term ((913920 : Rat) / 12247399) [(0, 1), (9, 1), (11, 2), (13, 2), (15, 1)],
  term ((38982954400 : Rat) / 330679773) [(0, 1), (9, 1), (11, 2), (14, 1), (15, 1)],
  term ((-1017722832964 : Rat) / 18848747061) [(0, 1), (9, 1), (11, 2), (15, 1)],
  term ((28288000 : Rat) / 36742197) [(0, 1), (9, 1), (11, 2), (15, 3)],
  term ((2058155080772 : Rat) / 94243735305) [(0, 1), (9, 1), (11, 3)],
  term ((19496960 : Rat) / 110226591) [(0, 1), (9, 1), (11, 3), (13, 1), (15, 1)],
  term ((-13434125824 : Rat) / 330679773) [(0, 1), (9, 1), (11, 3), (14, 1)],
  term ((-9748480 : Rat) / 36742197) [(0, 1), (9, 1), (11, 3), (15, 2)],
  term ((-38470650211 : Rat) / 6981017430) [(0, 1), (9, 1), (13, 1)],
  term ((98294491771 : Rat) / 3490508715) [(0, 1), (9, 1), (13, 1), (14, 1)],
  term ((-59840000 : Rat) / 110226591) [(0, 1), (9, 1), (13, 1), (14, 1), (15, 2)],
  term ((-419816432 : Rat) / 12247399) [(0, 1), (9, 1), (13, 1), (14, 2)],
  term ((29920000 : Rat) / 110226591) [(0, 1), (9, 1), (13, 1), (15, 2)],
  term ((1827840 : Rat) / 12247399) [(0, 1), (9, 1), (13, 2), (14, 1), (15, 1)],
  term ((-913920 : Rat) / 12247399) [(0, 1), (9, 1), (13, 2), (15, 1)],
  term ((-5397298290872 : Rat) / 94243735305) [(0, 1), (9, 1), (14, 1), (15, 1)],
  term ((17582080 : Rat) / 36742197) [(0, 1), (9, 1), (14, 1), (15, 3)],
  term ((24229405504 : Rat) / 330679773) [(0, 1), (9, 1), (14, 2), (15, 1)],
  term ((972304003276 : Rat) / 94243735305) [(0, 1), (9, 1), (15, 1)],
  term ((-8791040 : Rat) / 36742197) [(0, 1), (9, 1), (15, 3)],
  term ((-294 : Rat) / 67) [(0, 1), (9, 2)],
  term ((-588 : Rat) / 67) [(0, 1), (9, 2), (10, 1), (14, 1)],
  term ((294 : Rat) / 67) [(0, 1), (9, 2), (10, 2)],
  term ((-588 : Rat) / 67) [(0, 1), (9, 2), (11, 1), (15, 1)],
  term ((294 : Rat) / 67) [(0, 1), (9, 2), (11, 2)],
  term ((588 : Rat) / 67) [(0, 1), (9, 2), (14, 1)],
  term ((-659618399006 : Rat) / 10471526145) [(0, 1), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((119680000 : Rat) / 110226591) [(0, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((3655680 : Rat) / 12247399) [(0, 1), (10, 1), (11, 1), (13, 1), (14, 2)],
  term ((-3655680 : Rat) / 12247399) [(0, 1), (10, 1), (11, 1), (13, 1), (15, 2)],
  term ((-3655680 : Rat) / 12247399) [(0, 1), (10, 1), (11, 1), (13, 2), (14, 1), (15, 1)],
  term ((-375362530976 : Rat) / 94243735305) [(0, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-35164160 : Rat) / 36742197) [(0, 1), (10, 1), (11, 1), (14, 1), (15, 3)],
  term ((-226304000 : Rat) / 110226591) [(0, 1), (10, 1), (11, 1), (14, 2), (15, 1)],
  term ((-38993920 : Rat) / 110226591) [(0, 1), (10, 1), (11, 1), (15, 1)],
  term ((70328320 : Rat) / 110226591) [(0, 1), (10, 1), (11, 1), (15, 3)],
  term ((-77987840 : Rat) / 110226591) [(0, 1), (10, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((1827840 : Rat) / 12247399) [(0, 1), (10, 1), (11, 2), (13, 1), (15, 1)],
  term ((-5775790686848 : Rat) / 94243735305) [(0, 1), (10, 1), (11, 2), (14, 1)],
  term ((38993920 : Rat) / 36742197) [(0, 1), (10, 1), (11, 2), (14, 1), (15, 2)],
  term ((77987840 : Rat) / 110226591) [(0, 1), (10, 1), (11, 2), (14, 2)],
  term ((-113152000 : Rat) / 110226591) [(0, 1), (10, 1), (11, 2), (15, 2)],
  term ((38993920 : Rat) / 110226591) [(0, 1), (10, 1), (11, 3), (15, 1)],
  term ((1208281664 : Rat) / 110226591) [(0, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-7311360 : Rat) / 12247399) [(0, 1), (10, 1), (13, 1), (14, 2), (15, 1)],
  term ((-1827840 : Rat) / 12247399) [(0, 1), (10, 1), (13, 1), (15, 1)],
  term ((-191880696 : Rat) / 12247399) [(0, 1), (10, 1), (13, 2), (14, 1)],
  term ((15923611520 : Rat) / 330679773) [(0, 1), (10, 1), (14, 1), (15, 2)],
  term ((140656640 : Rat) / 110226591) [(0, 1), (10, 1), (14, 2), (15, 2)],
  term ((35164160 : Rat) / 110226591) [(0, 1), (10, 1), (15, 2)],
  term ((329809199503 : Rat) / 10471526145) [(0, 1), (10, 2), (11, 1), (13, 1)],
  term ((-1827840 : Rat) / 12247399) [(0, 1), (10, 2), (11, 1), (13, 1), (14, 1)],
  term ((-59840000 : Rat) / 110226591) [(0, 1), (10, 2), (11, 1), (13, 1), (15, 2)],
  term ((1827840 : Rat) / 12247399) [(0, 1), (10, 2), (11, 1), (13, 2), (15, 1)],
  term ((35164160 : Rat) / 110226591) [(0, 1), (10, 2), (11, 1), (14, 1), (15, 1)],
  term ((221021067088 : Rat) / 94243735305) [(0, 1), (10, 2), (11, 1), (15, 1)],
  term ((17582080 : Rat) / 36742197) [(0, 1), (10, 2), (11, 1), (15, 3)],
  term ((2887895343424 : Rat) / 94243735305) [(0, 1), (10, 2), (11, 2)],
  term ((38993920 : Rat) / 110226591) [(0, 1), (10, 2), (11, 2), (13, 1), (15, 1)],
  term ((-38993920 : Rat) / 110226591) [(0, 1), (10, 2), (11, 2), (14, 1)],
  term ((-19496960 : Rat) / 36742197) [(0, 1), (10, 2), (11, 2), (15, 2)],
  term ((-587690272 : Rat) / 110226591) [(0, 1), (10, 2), (13, 1), (15, 1)],
  term ((95940348 : Rat) / 12247399) [(0, 1), (10, 2), (13, 2)],
  term ((-8067298240 : Rat) / 330679773) [(0, 1), (10, 2), (15, 2)],
  term ((38993920 : Rat) / 110226591) [(0, 1), (10, 3), (11, 1), (15, 1)],
  term ((1827840 : Rat) / 12247399) [(0, 1), (10, 3), (13, 1), (15, 1)],
  term ((-35164160 : Rat) / 110226591) [(0, 1), (10, 3), (15, 2)],
  term ((-329809199503 : Rat) / 10471526145) [(0, 1), (11, 1), (13, 1)],
  term ((661181202206 : Rat) / 10471526145) [(0, 1), (11, 1), (13, 1), (14, 1)],
  term ((-185482240 : Rat) / 110226591) [(0, 1), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((-3655680 : Rat) / 12247399) [(0, 1), (11, 1), (13, 1), (14, 2)],
  term ((23306048 : Rat) / 2079747) [(0, 1), (11, 1), (13, 1), (15, 2)],
  term ((3655680 : Rat) / 12247399) [(0, 1), (11, 1), (13, 2), (14, 1), (15, 1)],
  term ((-193708536 : Rat) / 12247399) [(0, 1), (11, 1), (13, 2), (15, 1)],
  term ((345297174176 : Rat) / 94243735305) [(0, 1), (11, 1), (14, 1), (15, 1)],
  term ((246149120 : Rat) / 110226591) [(0, 1), (11, 1), (14, 1), (15, 3)],
  term ((226304000 : Rat) / 110226591) [(0, 1), (11, 1), (14, 2), (15, 1)],
  term ((-221021067088 : Rat) / 94243735305) [(0, 1), (11, 1), (15, 1)],
  term ((15976357760 : Rat) / 330679773) [(0, 1), (11, 1), (15, 3)],
  term ((-2887895343424 : Rat) / 94243735305) [(0, 1), (11, 2)],
  term ((143790080 : Rat) / 110226591) [(0, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((-239717799082 : Rat) / 3490508715) [(0, 1), (11, 2), (13, 1), (15, 1)],
  term ((119680000 : Rat) / 110226591) [(0, 1), (11, 2), (13, 1), (15, 3)],
  term ((95940348 : Rat) / 12247399) [(0, 1), (11, 2), (13, 2)],
  term ((-3655680 : Rat) / 12247399) [(0, 1), (11, 2), (13, 2), (15, 2)],
  term ((5809130488448 : Rat) / 94243735305) [(0, 1), (11, 2), (14, 1)],
  term ((-45957120 : Rat) / 12247399) [(0, 1), (11, 2), (14, 1), (15, 2)],
  term ((-77987840 : Rat) / 110226591) [(0, 1), (11, 2), (14, 2)],
  term ((-2691212430176 : Rat) / 94243735305) [(0, 1), (11, 2), (15, 2)],
  term ((-35164160 : Rat) / 36742197) [(0, 1), (11, 2), (15, 4)],
  term ((329809199503 : Rat) / 10471526145) [(0, 1), (11, 3), (13, 1)],
  term ((-1827840 : Rat) / 12247399) [(0, 1), (11, 3), (13, 1), (14, 1)],
  term ((-137827840 : Rat) / 110226591) [(0, 1), (11, 3), (13, 1), (15, 2)],
  term ((1827840 : Rat) / 12247399) [(0, 1), (11, 3), (13, 2), (15, 1)],
  term ((21237760 : Rat) / 12247399) [(0, 1), (11, 3), (14, 1), (15, 1)],
  term ((-1110953923952 : Rat) / 18848747061) [(0, 1), (11, 3), (15, 1)],
  term ((56576000 : Rat) / 36742197) [(0, 1), (11, 3), (15, 3)],
  term ((2887895343424 : Rat) / 94243735305) [(0, 1), (11, 4)],
  term ((38993920 : Rat) / 110226591) [(0, 1), (11, 4), (13, 1), (15, 1)],
  term ((-38993920 : Rat) / 110226591) [(0, 1), (11, 4), (14, 1)],
  term ((-19496960 : Rat) / 36742197) [(0, 1), (11, 4), (15, 2)],
  term ((-1208281664 : Rat) / 110226591) [(0, 1), (13, 1), (14, 1), (15, 1)],
  term ((7311360 : Rat) / 12247399) [(0, 1), (13, 1), (14, 2), (15, 1)],
  term ((587690272 : Rat) / 110226591) [(0, 1), (13, 1), (15, 1)],
  term ((-95940348 : Rat) / 12247399) [(0, 1), (13, 2)],
  term ((191880696 : Rat) / 12247399) [(0, 1), (13, 2), (14, 1)],
  term ((-15923611520 : Rat) / 330679773) [(0, 1), (14, 1), (15, 2)],
  term ((-140656640 : Rat) / 110226591) [(0, 1), (14, 2), (15, 2)],
  term ((8067298240 : Rat) / 330679773) [(0, 1), (15, 2)],
  term ((-682411520 : Rat) / 330679773) [(1, 1), (2, 1), (10, 1), (11, 1), (14, 2)],
  term ((-10662680 : Rat) / 12247399) [(1, 1), (2, 1), (10, 1), (13, 1), (14, 2)],
  term ((615388960 : Rat) / 330679773) [(1, 1), (2, 1), (10, 1), (14, 2), (15, 1)],
  term ((341205760 : Rat) / 330679773) [(1, 1), (2, 1), (10, 2), (11, 1), (14, 1)],
  term ((5331340 : Rat) / 12247399) [(1, 1), (2, 1), (10, 2), (13, 1), (14, 1)],
  term ((-307694480 : Rat) / 330679773) [(1, 1), (2, 1), (10, 2), (14, 1), (15, 1)],
  term ((-10662680 : Rat) / 12247399) [(1, 1), (2, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-341205760 : Rat) / 330679773) [(1, 1), (2, 1), (11, 1), (14, 1)],
  term ((615388960 : Rat) / 330679773) [(1, 1), (2, 1), (11, 1), (14, 1), (15, 2)],
  term ((682411520 : Rat) / 330679773) [(1, 1), (2, 1), (11, 1), (14, 2)],
  term ((5331340 : Rat) / 12247399) [(1, 1), (2, 1), (11, 2), (13, 1), (14, 1)],
  term ((-990106000 : Rat) / 330679773) [(1, 1), (2, 1), (11, 2), (14, 1), (15, 1)],
  term ((341205760 : Rat) / 330679773) [(1, 1), (2, 1), (11, 3), (14, 1)],
  term ((-5331340 : Rat) / 12247399) [(1, 1), (2, 1), (13, 1), (14, 1)],
  term ((10662680 : Rat) / 12247399) [(1, 1), (2, 1), (13, 1), (14, 2)],
  term ((307694480 : Rat) / 330679773) [(1, 1), (2, 1), (14, 1), (15, 1)],
  term ((-615388960 : Rat) / 330679773) [(1, 1), (2, 1), (14, 2), (15, 1)],
  term ((-34033664 : Rat) / 182797) [(1, 1), (7, 1), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((1951010752 : Rat) / 12247399) [(1, 1), (7, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-14357952 : Rat) / 182797) [(1, 1), (7, 1), (10, 1), (13, 2), (14, 1)],
  term ((17016832 : Rat) / 182797) [(1, 1), (7, 1), (10, 2), (11, 1), (13, 1)],
  term ((-975505376 : Rat) / 12247399) [(1, 1), (7, 1), (10, 2), (13, 1), (15, 1)],
  term ((7178976 : Rat) / 182797) [(1, 1), (7, 1), (10, 2), (13, 2)],
  term ((-17016832 : Rat) / 182797) [(1, 1), (7, 1), (11, 1), (13, 1)],
  term ((34033664 : Rat) / 182797) [(1, 1), (7, 1), (11, 1), (13, 1), (14, 1)],
  term ((1951010752 : Rat) / 12247399) [(1, 1), (7, 1), (11, 1), (13, 1), (15, 2)],
  term ((-14357952 : Rat) / 182797) [(1, 1), (7, 1), (11, 1), (13, 2), (15, 1)],
  term ((-3255760864 : Rat) / 12247399) [(1, 1), (7, 1), (11, 2), (13, 1), (15, 1)],
  term ((7178976 : Rat) / 182797) [(1, 1), (7, 1), (11, 2), (13, 2)],
  term ((17016832 : Rat) / 182797) [(1, 1), (7, 1), (11, 3), (13, 1)],
  term ((-1951010752 : Rat) / 12247399) [(1, 1), (7, 1), (13, 1), (14, 1), (15, 1)],
  term ((975505376 : Rat) / 12247399) [(1, 1), (7, 1), (13, 1), (15, 1)],
  term ((-7178976 : Rat) / 182797) [(1, 1), (7, 1), (13, 2)],
  term ((14357952 : Rat) / 182797) [(1, 1), (7, 1), (13, 2), (14, 1)],
  term (3 : Rat) [(1, 1), (9, 1)],
  term ((-588 : Rat) / 67) [(1, 1), (9, 1), (10, 1)],
  term ((17016832 : Rat) / 182797) [(1, 1), (9, 1), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((-1176 : Rat) / 67) [(1, 1), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((588 : Rat) / 67) [(1, 1), (9, 1), (10, 1), (11, 2)],
  term ((-975505376 : Rat) / 12247399) [(1, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((7178976 : Rat) / 182797) [(1, 1), (9, 1), (10, 1), (13, 2), (14, 1)],
  term ((1578 : Rat) / 67) [(1, 1), (9, 1), (10, 1), (14, 1)],
  term (-3 : Rat) [(1, 1), (9, 1), (10, 2)],
  term ((-8508416 : Rat) / 182797) [(1, 1), (9, 1), (10, 2), (11, 1), (13, 1)],
  term ((487752688 : Rat) / 12247399) [(1, 1), (9, 1), (10, 2), (13, 1), (15, 1)],
  term ((-3589488 : Rat) / 182797) [(1, 1), (9, 1), (10, 2), (13, 2)],
  term ((-1176 : Rat) / 67) [(1, 1), (9, 1), (10, 2), (14, 1)],
  term ((588 : Rat) / 67) [(1, 1), (9, 1), (10, 3)],
  term ((8508416 : Rat) / 182797) [(1, 1), (9, 1), (11, 1), (13, 1)],
  term ((-17016832 : Rat) / 182797) [(1, 1), (9, 1), (11, 1), (13, 1), (14, 1)],
  term ((-975505376 : Rat) / 12247399) [(1, 1), (9, 1), (11, 1), (13, 1), (15, 2)],
  term ((7178976 : Rat) / 182797) [(1, 1), (9, 1), (11, 1), (13, 2), (15, 1)],
  term (6 : Rat) [(1, 1), (9, 1), (11, 1), (15, 1)],
  term (-3 : Rat) [(1, 1), (9, 1), (11, 2)],
  term ((1627880432 : Rat) / 12247399) [(1, 1), (9, 1), (11, 2), (13, 1), (15, 1)],
  term ((-3589488 : Rat) / 182797) [(1, 1), (9, 1), (11, 2), (13, 2)],
  term ((-8508416 : Rat) / 182797) [(1, 1), (9, 1), (11, 3), (13, 1)],
  term ((975505376 : Rat) / 12247399) [(1, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((-487752688 : Rat) / 12247399) [(1, 1), (9, 1), (13, 1), (15, 1)],
  term ((3589488 : Rat) / 182797) [(1, 1), (9, 1), (13, 2)],
  term ((-7178976 : Rat) / 182797) [(1, 1), (9, 1), (13, 2), (14, 1)],
  term (-6 : Rat) [(1, 1), (9, 1), (14, 1)],
  term ((57187651136 : Rat) / 1163502905) [(1, 1), (10, 1), (11, 1)],
  term ((-26284364288 : Rat) / 330679773) [(1, 1), (10, 1), (11, 1), (12, 1), (14, 1)],
  term ((-1153761280 : Rat) / 330679773) [(1, 1), (10, 1), (11, 1), (12, 1), (14, 2)],
  term ((-250808320 : Rat) / 330679773) [(1, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((430564303414 : Rat) / 10471526145) [(1, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((119680000 : Rat) / 110226591) [(1, 1), (10, 1), (11, 1), (13, 1), (15, 3)],
  term ((-3655680 : Rat) / 12247399) [(1, 1), (10, 1), (11, 1), (13, 2), (15, 2)],
  term ((-937919630512 : Rat) / 6282915687) [(1, 1), (10, 1), (11, 1), (14, 1)],
  term ((-1092198400 : Rat) / 330679773) [(1, 1), (10, 1), (11, 1), (14, 1), (15, 2)],
  term ((18659368448 : Rat) / 330679773) [(1, 1), (10, 1), (11, 1), (14, 2)],
  term ((576880640 : Rat) / 330679773) [(1, 1), (10, 1), (11, 1), (14, 3)],
  term ((-327995910608 : Rat) / 3490508715) [(1, 1), (10, 1), (11, 1), (15, 2)],
  term ((-35164160 : Rat) / 36742197) [(1, 1), (10, 1), (11, 1), (15, 4)],
  term ((-24126040323 : Rat) / 1163502905) [(1, 1), (10, 1), (11, 2), (13, 1)],
  term ((-137827840 : Rat) / 110226591) [(1, 1), (10, 1), (11, 2), (13, 1), (15, 2)],
  term ((1827840 : Rat) / 12247399) [(1, 1), (10, 1), (11, 2), (13, 2), (15, 1)],
  term ((389939200 : Rat) / 110226591) [(1, 1), (10, 1), (11, 2), (14, 1), (15, 1)],
  term ((33869997848 : Rat) / 232700581) [(1, 1), (10, 1), (11, 2), (15, 1)],
  term ((56576000 : Rat) / 36742197) [(1, 1), (10, 1), (11, 2), (15, 3)],
  term ((-57187651136 : Rat) / 1163502905) [(1, 1), (10, 1), (11, 3)],
  term ((38993920 : Rat) / 110226591) [(1, 1), (10, 1), (11, 3), (13, 1), (15, 1)],
  term ((-19496960 : Rat) / 36742197) [(1, 1), (10, 1), (11, 3), (15, 2)],
  term ((-410693192 : Rat) / 12247399) [(1, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((-18027520 : Rat) / 12247399) [(1, 1), (10, 1), (12, 1), (13, 1), (14, 2)],
  term ((22992149488 : Rat) / 330679773) [(1, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((1040445440 : Rat) / 330679773) [(1, 1), (10, 1), (12, 1), (14, 2), (15, 1)],
  term ((24126040323 : Rat) / 1163502905) [(1, 1), (10, 1), (13, 1)],
  term ((-30013299911 : Rat) / 465401162) [(1, 1), (10, 1), (13, 1), (14, 1)],
  term ((655496960 : Rat) / 330679773) [(1, 1), (10, 1), (13, 1), (14, 1), (15, 2)],
  term ((291552632 : Rat) / 12247399) [(1, 1), (10, 1), (13, 1), (14, 2)],
  term ((9013760 : Rat) / 12247399) [(1, 1), (10, 1), (13, 1), (14, 3)],
  term ((59840000 : Rat) / 110226591) [(1, 1), (10, 1), (13, 1), (15, 2)],
  term ((-11630080 : Rat) / 12247399) [(1, 1), (10, 1), (13, 2), (14, 1), (15, 1)],
  term ((-1827840 : Rat) / 12247399) [(1, 1), (10, 1), (13, 2), (15, 1)],
  term ((109949373936 : Rat) / 1163502905) [(1, 1), (10, 1), (14, 1), (15, 1)],
  term ((35164160 : Rat) / 36742197) [(1, 1), (10, 1), (14, 1), (15, 3)],
  term ((-16826751904 : Rat) / 330679773) [(1, 1), (10, 1), (14, 2), (15, 1)],
  term ((-520222720 : Rat) / 330679773) [(1, 1), (10, 1), (14, 3), (15, 1)],
  term ((-54974686968 : Rat) / 1163502905) [(1, 1), (10, 1), (15, 1)],
  term ((-17582080 : Rat) / 36742197) [(1, 1), (10, 1), (15, 3)],
  term ((800732495608 : Rat) / 31414578435) [(1, 1), (10, 2), (11, 1)],
  term ((13142182144 : Rat) / 330679773) [(1, 1), (10, 2), (11, 1), (12, 1)],
  term ((576880640 : Rat) / 330679773) [(1, 1), (10, 2), (11, 1), (12, 1), (14, 1)],
  term ((-77987840 : Rat) / 110226591) [(1, 1), (10, 2), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((242385920 : Rat) / 330679773) [(1, 1), (10, 2), (11, 1), (13, 1), (15, 1)],
  term ((2201813160064 : Rat) / 31414578435) [(1, 1), (10, 2), (11, 1), (14, 1)],
  term ((38993920 : Rat) / 36742197) [(1, 1), (10, 2), (11, 1), (14, 1), (15, 2)],
  term ((-288440320 : Rat) / 330679773) [(1, 1), (10, 2), (11, 1), (14, 2)],
  term ((370626560 : Rat) / 330679773) [(1, 1), (10, 2), (11, 1), (15, 2)],
  term ((-194969600 : Rat) / 110226591) [(1, 1), (10, 2), (11, 2), (15, 1)],
  term ((205346596 : Rat) / 12247399) [(1, 1), (10, 2), (12, 1), (13, 1)],
  term ((9013760 : Rat) / 12247399) [(1, 1), (10, 2), (12, 1), (13, 1), (14, 1)],
  term ((-520222720 : Rat) / 330679773) [(1, 1), (10, 2), (12, 1), (14, 1), (15, 1)],
  term ((-11496074744 : Rat) / 330679773) [(1, 1), (10, 2), (12, 1), (15, 1)],
  term ((53562338263 : Rat) / 4654011620) [(1, 1), (10, 2), (13, 1)],
  term ((34403330626 : Rat) / 1163502905) [(1, 1), (10, 2), (13, 1), (14, 1)],
  term ((119680000 : Rat) / 110226591) [(1, 1), (10, 2), (13, 1), (14, 1), (15, 2)],
  term ((-4506880 : Rat) / 12247399) [(1, 1), (10, 2), (13, 1), (14, 2)],
  term ((-507268480 : Rat) / 330679773) [(1, 1), (10, 2), (13, 1), (15, 2)],
  term ((-3655680 : Rat) / 12247399) [(1, 1), (10, 2), (13, 2), (14, 1), (15, 1)],
  term ((7642880 : Rat) / 12247399) [(1, 1), (10, 2), (13, 2), (15, 1)],
  term ((-2169362380832 : Rat) / 31414578435) [(1, 1), (10, 2), (14, 1), (15, 1)],
  term ((-35164160 : Rat) / 36742197) [(1, 1), (10, 2), (14, 1), (15, 3)],
  term ((260111360 : Rat) / 330679773) [(1, 1), (10, 2), (14, 2), (15, 1)],
  term ((-57187651136 : Rat) / 1163502905) [(1, 1), (10, 3), (11, 1)],
  term ((38993920 : Rat) / 110226591) [(1, 1), (10, 3), (11, 1), (13, 1), (15, 1)],
  term ((-19496960 : Rat) / 36742197) [(1, 1), (10, 3), (11, 1), (15, 2)],
  term ((-24126040323 : Rat) / 1163502905) [(1, 1), (10, 3), (13, 1)],
  term ((-59840000 : Rat) / 110226591) [(1, 1), (10, 3), (13, 1), (15, 2)],
  term ((1827840 : Rat) / 12247399) [(1, 1), (10, 3), (13, 2), (15, 1)],
  term ((54974686968 : Rat) / 1163502905) [(1, 1), (10, 3), (15, 1)],
  term ((17582080 : Rat) / 36742197) [(1, 1), (10, 3), (15, 3)],
  term ((-800732495608 : Rat) / 31414578435) [(1, 1), (11, 1)],
  term ((-13142182144 : Rat) / 330679773) [(1, 1), (11, 1), (12, 1)],
  term ((-18027520 : Rat) / 12247399) [(1, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-410693192 : Rat) / 12247399) [(1, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((952129024 : Rat) / 12247399) [(1, 1), (11, 1), (12, 1), (14, 1)],
  term ((1040445440 : Rat) / 330679773) [(1, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((1153761280 : Rat) / 330679773) [(1, 1), (11, 1), (12, 1), (14, 2)],
  term ((22992149488 : Rat) / 330679773) [(1, 1), (11, 1), (12, 1), (15, 2)],
  term ((8356692904 : Rat) / 330679773) [(1, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((9013760 : Rat) / 12247399) [(1, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((-1492236457901 : Rat) / 62829156870) [(1, 1), (11, 1), (13, 1), (15, 1)],
  term ((1014536960 : Rat) / 330679773) [(1, 1), (11, 1), (13, 1), (15, 3)],
  term ((-15285760 : Rat) / 12247399) [(1, 1), (11, 1), (13, 2), (15, 2)],
  term ((2487784992496 : Rat) / 31414578435) [(1, 1), (11, 1), (14, 1)],
  term ((-5361832928 : Rat) / 110226591) [(1, 1), (11, 1), (14, 1), (15, 2)],
  term ((-18370928128 : Rat) / 330679773) [(1, 1), (11, 1), (14, 2)],
  term ((-520222720 : Rat) / 330679773) [(1, 1), (11, 1), (14, 2), (15, 2)],
  term ((-576880640 : Rat) / 330679773) [(1, 1), (11, 1), (14, 3)],
  term ((-370626560 : Rat) / 330679773) [(1, 1), (11, 1), (15, 2)],
  term ((205346596 : Rat) / 12247399) [(1, 1), (11, 2), (12, 1), (13, 1)],
  term ((9013760 : Rat) / 12247399) [(1, 1), (11, 2), (12, 1), (13, 1), (14, 1)],
  term ((-1673984000 : Rat) / 330679773) [(1, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((-37780439032 : Rat) / 330679773) [(1, 1), (11, 2), (12, 1), (15, 1)],
  term ((53562338263 : Rat) / 4654011620) [(1, 1), (11, 2), (13, 1)],
  term ((-145776316 : Rat) / 12247399) [(1, 1), (11, 2), (13, 1), (14, 1)],
  term ((-4506880 : Rat) / 12247399) [(1, 1), (11, 2), (13, 1), (14, 2)],
  term ((-992040320 : Rat) / 330679773) [(1, 1), (11, 2), (13, 1), (15, 2)],
  term ((7642880 : Rat) / 12247399) [(1, 1), (11, 2), (13, 2), (15, 1)],
  term ((25902926800 : Rat) / 330679773) [(1, 1), (11, 2), (14, 1), (15, 1)],
  term ((836992000 : Rat) / 330679773) [(1, 1), (11, 2), (14, 2), (15, 1)],
  term ((-1545898655216 : Rat) / 31414578435) [(1, 1), (11, 2), (15, 1)],
  term ((-741253120 : Rat) / 330679773) [(1, 1), (11, 2), (15, 3)],
  term ((800732495608 : Rat) / 31414578435) [(1, 1), (11, 3)],
  term ((13142182144 : Rat) / 330679773) [(1, 1), (11, 3), (12, 1)],
  term ((576880640 : Rat) / 330679773) [(1, 1), (11, 3), (12, 1), (14, 1)],
  term ((242385920 : Rat) / 330679773) [(1, 1), (11, 3), (13, 1), (15, 1)],
  term ((-9329684224 : Rat) / 330679773) [(1, 1), (11, 3), (14, 1)],
  term ((-288440320 : Rat) / 330679773) [(1, 1), (11, 3), (14, 2)],
  term ((1540444160 : Rat) / 330679773) [(1, 1), (11, 3), (15, 2)],
  term ((-194969600 : Rat) / 110226591) [(1, 1), (11, 4), (15, 1)],
  term ((-205346596 : Rat) / 12247399) [(1, 1), (12, 1), (13, 1)],
  term ((401679432 : Rat) / 12247399) [(1, 1), (12, 1), (13, 1), (14, 1)],
  term ((18027520 : Rat) / 12247399) [(1, 1), (12, 1), (13, 1), (14, 2)],
  term ((-832293584 : Rat) / 12247399) [(1, 1), (12, 1), (14, 1), (15, 1)],
  term ((-1040445440 : Rat) / 330679773) [(1, 1), (12, 1), (14, 2), (15, 1)],
  term ((11496074744 : Rat) / 330679773) [(1, 1), (12, 1), (15, 1)],
  term ((-53562338263 : Rat) / 4654011620) [(1, 1), (13, 1)],
  term ((81259838303 : Rat) / 2327005810) [(1, 1), (13, 1), (14, 1)],
  term ((-1014536960 : Rat) / 330679773) [(1, 1), (13, 1), (14, 1), (15, 2)],
  term ((-287045752 : Rat) / 12247399) [(1, 1), (13, 1), (14, 2)],
  term ((-9013760 : Rat) / 12247399) [(1, 1), (13, 1), (14, 3)],
  term ((507268480 : Rat) / 330679773) [(1, 1), (13, 1), (15, 2)],
  term ((15285760 : Rat) / 12247399) [(1, 1), (13, 2), (14, 1), (15, 1)],
  term ((-7642880 : Rat) / 12247399) [(1, 1), (13, 2), (15, 1)],
  term ((-8413375952 : Rat) / 330679773) [(1, 1), (14, 1), (15, 1)],
  term ((16566640544 : Rat) / 330679773) [(1, 1), (14, 2), (15, 1)],
  term ((520222720 : Rat) / 330679773) [(1, 1), (14, 3), (15, 1)],
  term ((-1369 : Rat) / 268) [(10, 1), (14, 1)],
  term ((1369 : Rat) / 536) [(10, 2)],
  term ((-1369 : Rat) / 268) [(11, 1), (15, 1)],
  term ((1369 : Rat) / 536) [(11, 2)],
  term ((1369 : Rat) / 268) [(14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 29, terms 0 through 99. -/
theorem rs_R009_ueqv_R009NNNYN_block_29_0000_0099_valid :
    checkProductSumEq rs_R009_ueqv_R009NNNYN_partials_29_0000_0099
      rs_R009_ueqv_R009NNNYN_block_29_0000_0099 = true := by
  native_decide

end R009UeqvR009NNNYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
