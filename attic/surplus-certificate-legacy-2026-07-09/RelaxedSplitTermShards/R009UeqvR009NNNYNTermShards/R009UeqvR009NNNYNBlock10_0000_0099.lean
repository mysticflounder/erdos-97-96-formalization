/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NNNYN, term block 10:0-99

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NNNYNTermShards

/-- Generator polynomial 10 for relaxed split surplus certificate `R009:u=v:R009NNNYN`. -/
def rs_R009_ueqv_R009NNNYN_generator_10_0000_0099 : Poly :=
[
  term (2 : Rat) [(2, 1), (4, 1)],
  term (2 : Rat) [(3, 1), (5, 1)],
  term (-1 : Rat) [(4, 2)],
  term (-1 : Rat) [(5, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNYN_coefficient_10_0000 : Poly :=
[
  term ((2985 : Rat) / 536) []
]

/-- Partial product 0 for generator 10. -/
def rs_R009_ueqv_R009NNNYN_partial_10_0000 : Poly :=
[
  term ((2985 : Rat) / 268) [(2, 1), (4, 1)],
  term ((2985 : Rat) / 268) [(3, 1), (5, 1)],
  term ((-2985 : Rat) / 536) [(4, 2)],
  term ((-2985 : Rat) / 536) [(5, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 10. -/
theorem rs_R009_ueqv_R009NNNYN_partial_10_0000_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_10_0000
        rs_R009_ueqv_R009NNNYN_generator_10_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_10_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNYN_coefficient_10_0001 : Poly :=
[
  term ((373882880 : Rat) / 110226591) [(0, 1), (3, 1), (11, 1)]
]

/-- Partial product 1 for generator 10. -/
def rs_R009_ueqv_R009NNNYN_partial_10_0001 : Poly :=
[
  term ((747765760 : Rat) / 110226591) [(0, 1), (2, 1), (3, 1), (4, 1), (11, 1)],
  term ((-373882880 : Rat) / 110226591) [(0, 1), (3, 1), (4, 2), (11, 1)],
  term ((-373882880 : Rat) / 110226591) [(0, 1), (3, 1), (5, 2), (11, 1)],
  term ((747765760 : Rat) / 110226591) [(0, 1), (3, 2), (5, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 10. -/
theorem rs_R009_ueqv_R009NNNYN_partial_10_0001_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_10_0001
        rs_R009_ueqv_R009NNNYN_generator_10_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_10_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNYN_coefficient_10_0002 : Poly :=
[
  term ((17525760 : Rat) / 12247399) [(0, 1), (3, 1), (13, 1)]
]

/-- Partial product 2 for generator 10. -/
def rs_R009_ueqv_R009NNNYN_partial_10_0002 : Poly :=
[
  term ((35051520 : Rat) / 12247399) [(0, 1), (2, 1), (3, 1), (4, 1), (13, 1)],
  term ((-17525760 : Rat) / 12247399) [(0, 1), (3, 1), (4, 2), (13, 1)],
  term ((-17525760 : Rat) / 12247399) [(0, 1), (3, 1), (5, 2), (13, 1)],
  term ((35051520 : Rat) / 12247399) [(0, 1), (3, 2), (5, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 10. -/
theorem rs_R009_ueqv_R009NNNYN_partial_10_0002_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_10_0002
        rs_R009_ueqv_R009NNNYN_generator_10_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_10_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNYN_coefficient_10_0003 : Poly :=
[
  term ((-337162240 : Rat) / 110226591) [(0, 1), (3, 1), (15, 1)]
]

/-- Partial product 3 for generator 10. -/
def rs_R009_ueqv_R009NNNYN_partial_10_0003 : Poly :=
[
  term ((-674324480 : Rat) / 110226591) [(0, 1), (2, 1), (3, 1), (4, 1), (15, 1)],
  term ((337162240 : Rat) / 110226591) [(0, 1), (3, 1), (4, 2), (15, 1)],
  term ((337162240 : Rat) / 110226591) [(0, 1), (3, 1), (5, 2), (15, 1)],
  term ((-674324480 : Rat) / 110226591) [(0, 1), (3, 2), (5, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 10. -/
theorem rs_R009_ueqv_R009NNNYN_partial_10_0003_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_10_0003
        rs_R009_ueqv_R009NNNYN_generator_10_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_10_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNYN_coefficient_10_0004 : Poly :=
[
  term ((-1936083968 : Rat) / 110226591) [(0, 1), (5, 1), (11, 1)]
]

/-- Partial product 4 for generator 10. -/
def rs_R009_ueqv_R009NNNYN_partial_10_0004 : Poly :=
[
  term ((-3872167936 : Rat) / 110226591) [(0, 1), (2, 1), (4, 1), (5, 1), (11, 1)],
  term ((-3872167936 : Rat) / 110226591) [(0, 1), (3, 1), (5, 2), (11, 1)],
  term ((1936083968 : Rat) / 110226591) [(0, 1), (4, 2), (5, 1), (11, 1)],
  term ((1936083968 : Rat) / 110226591) [(0, 1), (5, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 10. -/
theorem rs_R009_ueqv_R009NNNYN_partial_10_0004_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_10_0004
        rs_R009_ueqv_R009NNNYN_generator_10_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_10_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNYN_coefficient_10_0005 : Poly :=
[
  term ((-90753936 : Rat) / 12247399) [(0, 1), (5, 1), (13, 1)]
]

/-- Partial product 5 for generator 10. -/
def rs_R009_ueqv_R009NNNYN_partial_10_0005 : Poly :=
[
  term ((-181507872 : Rat) / 12247399) [(0, 1), (2, 1), (4, 1), (5, 1), (13, 1)],
  term ((-181507872 : Rat) / 12247399) [(0, 1), (3, 1), (5, 2), (13, 1)],
  term ((90753936 : Rat) / 12247399) [(0, 1), (4, 2), (5, 1), (13, 1)],
  term ((90753936 : Rat) / 12247399) [(0, 1), (5, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 10. -/
theorem rs_R009_ueqv_R009NNNYN_partial_10_0005_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_10_0005
        rs_R009_ueqv_R009NNNYN_generator_10_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_10_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNYN_coefficient_10_0006 : Poly :=
[
  term ((1745932864 : Rat) / 110226591) [(0, 1), (5, 1), (15, 1)]
]

/-- Partial product 6 for generator 10. -/
def rs_R009_ueqv_R009NNNYN_partial_10_0006 : Poly :=
[
  term ((3491865728 : Rat) / 110226591) [(0, 1), (2, 1), (4, 1), (5, 1), (15, 1)],
  term ((3491865728 : Rat) / 110226591) [(0, 1), (3, 1), (5, 2), (15, 1)],
  term ((-1745932864 : Rat) / 110226591) [(0, 1), (4, 2), (5, 1), (15, 1)],
  term ((-1745932864 : Rat) / 110226591) [(0, 1), (5, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 10. -/
theorem rs_R009_ueqv_R009NNNYN_partial_10_0006_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_10_0006
        rs_R009_ueqv_R009NNNYN_generator_10_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_10_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNYN_coefficient_10_0007 : Poly :=
[
  term ((2808960 : Rat) / 231083) [(0, 1), (7, 1), (11, 1)]
]

/-- Partial product 7 for generator 10. -/
def rs_R009_ueqv_R009NNNYN_partial_10_0007 : Poly :=
[
  term ((5617920 : Rat) / 231083) [(0, 1), (2, 1), (4, 1), (7, 1), (11, 1)],
  term ((5617920 : Rat) / 231083) [(0, 1), (3, 1), (5, 1), (7, 1), (11, 1)],
  term ((-2808960 : Rat) / 231083) [(0, 1), (4, 2), (7, 1), (11, 1)],
  term ((-2808960 : Rat) / 231083) [(0, 1), (5, 2), (7, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 10. -/
theorem rs_R009_ueqv_R009NNNYN_partial_10_0007_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_10_0007
        rs_R009_ueqv_R009NNNYN_generator_10_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_10_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNYN_coefficient_10_0008 : Poly :=
[
  term ((1185030 : Rat) / 231083) [(0, 1), (7, 1), (13, 1)]
]

/-- Partial product 8 for generator 10. -/
def rs_R009_ueqv_R009NNNYN_partial_10_0008 : Poly :=
[
  term ((2370060 : Rat) / 231083) [(0, 1), (2, 1), (4, 1), (7, 1), (13, 1)],
  term ((2370060 : Rat) / 231083) [(0, 1), (3, 1), (5, 1), (7, 1), (13, 1)],
  term ((-1185030 : Rat) / 231083) [(0, 1), (4, 2), (7, 1), (13, 1)],
  term ((-1185030 : Rat) / 231083) [(0, 1), (5, 2), (7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 10. -/
theorem rs_R009_ueqv_R009NNNYN_partial_10_0008_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_10_0008
        rs_R009_ueqv_R009NNNYN_generator_10_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_10_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNYN_coefficient_10_0009 : Poly :=
[
  term ((-2533080 : Rat) / 231083) [(0, 1), (7, 1), (15, 1)]
]

/-- Partial product 9 for generator 10. -/
def rs_R009_ueqv_R009NNNYN_partial_10_0009 : Poly :=
[
  term ((-5066160 : Rat) / 231083) [(0, 1), (2, 1), (4, 1), (7, 1), (15, 1)],
  term ((-5066160 : Rat) / 231083) [(0, 1), (3, 1), (5, 1), (7, 1), (15, 1)],
  term ((2533080 : Rat) / 231083) [(0, 1), (4, 2), (7, 1), (15, 1)],
  term ((2533080 : Rat) / 231083) [(0, 1), (5, 2), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 10. -/
theorem rs_R009_ueqv_R009NNNYN_partial_10_0009_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_10_0009
        rs_R009_ueqv_R009NNNYN_generator_10_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_10_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNYN_coefficient_10_0010 : Poly :=
[
  term ((-333438336 : Rat) / 12247399) [(0, 1), (9, 1), (11, 1)]
]

/-- Partial product 10 for generator 10. -/
def rs_R009_ueqv_R009NNNYN_partial_10_0010 : Poly :=
[
  term ((-666876672 : Rat) / 12247399) [(0, 1), (2, 1), (4, 1), (9, 1), (11, 1)],
  term ((-666876672 : Rat) / 12247399) [(0, 1), (3, 1), (5, 1), (9, 1), (11, 1)],
  term ((333438336 : Rat) / 12247399) [(0, 1), (4, 2), (9, 1), (11, 1)],
  term ((333438336 : Rat) / 12247399) [(0, 1), (5, 2), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 10. -/
theorem rs_R009_ueqv_R009NNNYN_partial_10_0010_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_10_0010
        rs_R009_ueqv_R009NNNYN_generator_10_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_10_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNYN_coefficient_10_0011 : Poly :=
[
  term ((-140669298 : Rat) / 12247399) [(0, 1), (9, 1), (13, 1)]
]

/-- Partial product 11 for generator 10. -/
def rs_R009_ueqv_R009NNNYN_partial_10_0011 : Poly :=
[
  term ((-281338596 : Rat) / 12247399) [(0, 1), (2, 1), (4, 1), (9, 1), (13, 1)],
  term ((-281338596 : Rat) / 12247399) [(0, 1), (3, 1), (5, 1), (9, 1), (13, 1)],
  term ((140669298 : Rat) / 12247399) [(0, 1), (4, 2), (9, 1), (13, 1)],
  term ((140669298 : Rat) / 12247399) [(0, 1), (5, 2), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 10. -/
theorem rs_R009_ueqv_R009NNNYN_partial_10_0011_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_10_0011
        rs_R009_ueqv_R009NNNYN_generator_10_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_10_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNYN_coefficient_10_0012 : Poly :=
[
  term ((300689928 : Rat) / 12247399) [(0, 1), (9, 1), (15, 1)]
]

/-- Partial product 12 for generator 10. -/
def rs_R009_ueqv_R009NNNYN_partial_10_0012 : Poly :=
[
  term ((601379856 : Rat) / 12247399) [(0, 1), (2, 1), (4, 1), (9, 1), (15, 1)],
  term ((601379856 : Rat) / 12247399) [(0, 1), (3, 1), (5, 1), (9, 1), (15, 1)],
  term ((-300689928 : Rat) / 12247399) [(0, 1), (4, 2), (9, 1), (15, 1)],
  term ((-300689928 : Rat) / 12247399) [(0, 1), (5, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 10. -/
theorem rs_R009_ueqv_R009NNNYN_partial_10_0012_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_10_0012
        rs_R009_ueqv_R009NNNYN_generator_10_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_10_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNYN_coefficient_10_0013 : Poly :=
[
  term ((4109905408 : Rat) / 110226591) [(0, 1), (11, 1), (13, 1)]
]

/-- Partial product 13 for generator 10. -/
def rs_R009_ueqv_R009NNNYN_partial_10_0013 : Poly :=
[
  term ((8219810816 : Rat) / 110226591) [(0, 1), (2, 1), (4, 1), (11, 1), (13, 1)],
  term ((8219810816 : Rat) / 110226591) [(0, 1), (3, 1), (5, 1), (11, 1), (13, 1)],
  term ((-4109905408 : Rat) / 110226591) [(0, 1), (4, 2), (11, 1), (13, 1)],
  term ((-4109905408 : Rat) / 110226591) [(0, 1), (5, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 10. -/
theorem rs_R009_ueqv_R009NNNYN_partial_10_0013_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_10_0013
        rs_R009_ueqv_R009NNNYN_generator_10_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_10_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNYN_coefficient_10_0014 : Poly :=
[
  term ((-8663161600 : Rat) / 330679773) [(0, 1), (11, 1), (15, 1)]
]

/-- Partial product 14 for generator 10. -/
def rs_R009_ueqv_R009NNNYN_partial_10_0014 : Poly :=
[
  term ((-17326323200 : Rat) / 330679773) [(0, 1), (2, 1), (4, 1), (11, 1), (15, 1)],
  term ((-17326323200 : Rat) / 330679773) [(0, 1), (3, 1), (5, 1), (11, 1), (15, 1)],
  term ((8663161600 : Rat) / 330679773) [(0, 1), (4, 2), (11, 1), (15, 1)],
  term ((8663161600 : Rat) / 330679773) [(0, 1), (5, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 10. -/
theorem rs_R009_ueqv_R009NNNYN_partial_10_0014_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_10_0014
        rs_R009_ueqv_R009NNNYN_generator_10_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_10_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNYN_coefficient_10_0015 : Poly :=
[
  term ((38993920 : Rat) / 110226591) [(0, 1), (11, 2)]
]

/-- Partial product 15 for generator 10. -/
def rs_R009_ueqv_R009NNNYN_partial_10_0015 : Poly :=
[
  term ((77987840 : Rat) / 110226591) [(0, 1), (2, 1), (4, 1), (11, 2)],
  term ((77987840 : Rat) / 110226591) [(0, 1), (3, 1), (5, 1), (11, 2)],
  term ((-38993920 : Rat) / 110226591) [(0, 1), (4, 2), (11, 2)],
  term ((-38993920 : Rat) / 110226591) [(0, 1), (5, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 10. -/
theorem rs_R009_ueqv_R009NNNYN_partial_10_0015_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_10_0015
        rs_R009_ueqv_R009NNNYN_generator_10_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_10_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNYN_coefficient_10_0016 : Poly :=
[
  term ((-4894841324 : Rat) / 110226591) [(0, 1), (13, 1), (15, 1)]
]

/-- Partial product 16 for generator 10. -/
def rs_R009_ueqv_R009NNNYN_partial_10_0016 : Poly :=
[
  term ((-9789682648 : Rat) / 110226591) [(0, 1), (2, 1), (4, 1), (13, 1), (15, 1)],
  term ((-9789682648 : Rat) / 110226591) [(0, 1), (3, 1), (5, 1), (13, 1), (15, 1)],
  term ((4894841324 : Rat) / 110226591) [(0, 1), (4, 2), (13, 1), (15, 1)],
  term ((4894841324 : Rat) / 110226591) [(0, 1), (5, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 10. -/
theorem rs_R009_ueqv_R009NNNYN_partial_10_0016_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_10_0016
        rs_R009_ueqv_R009NNNYN_generator_10_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_10_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNYN_coefficient_10_0017 : Poly :=
[
  term ((191880696 : Rat) / 12247399) [(0, 1), (13, 2)]
]

/-- Partial product 17 for generator 10. -/
def rs_R009_ueqv_R009NNNYN_partial_10_0017 : Poly :=
[
  term ((383761392 : Rat) / 12247399) [(0, 1), (2, 1), (4, 1), (13, 2)],
  term ((383761392 : Rat) / 12247399) [(0, 1), (3, 1), (5, 1), (13, 2)],
  term ((-191880696 : Rat) / 12247399) [(0, 1), (4, 2), (13, 2)],
  term ((-191880696 : Rat) / 12247399) [(0, 1), (5, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 10. -/
theorem rs_R009_ueqv_R009NNNYN_partial_10_0017_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_10_0017
        rs_R009_ueqv_R009NNNYN_generator_10_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_10_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNYN_coefficient_10_0018 : Poly :=
[
  term ((7717183760 : Rat) / 330679773) [(0, 1), (15, 2)]
]

/-- Partial product 18 for generator 10. -/
def rs_R009_ueqv_R009NNNYN_partial_10_0018 : Poly :=
[
  term ((15434367520 : Rat) / 330679773) [(0, 1), (2, 1), (4, 1), (15, 2)],
  term ((15434367520 : Rat) / 330679773) [(0, 1), (3, 1), (5, 1), (15, 2)],
  term ((-7717183760 : Rat) / 330679773) [(0, 1), (4, 2), (15, 2)],
  term ((-7717183760 : Rat) / 330679773) [(0, 1), (5, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 10. -/
theorem rs_R009_ueqv_R009NNNYN_partial_10_0018_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_10_0018
        rs_R009_ueqv_R009NNNYN_generator_10_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_10_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNYN_coefficient_10_0019 : Poly :=
[
  term ((-294 : Rat) / 67) [(1, 1), (9, 1)]
]

/-- Partial product 19 for generator 10. -/
def rs_R009_ueqv_R009NNNYN_partial_10_0019 : Poly :=
[
  term ((-588 : Rat) / 67) [(1, 1), (2, 1), (4, 1), (9, 1)],
  term ((-588 : Rat) / 67) [(1, 1), (3, 1), (5, 1), (9, 1)],
  term ((294 : Rat) / 67) [(1, 1), (4, 2), (9, 1)],
  term ((294 : Rat) / 67) [(1, 1), (5, 2), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 10. -/
theorem rs_R009_ueqv_R009NNNYN_partial_10_0019_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_10_0019
        rs_R009_ueqv_R009NNNYN_generator_10_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_10_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNYN_coefficient_10_0020 : Poly :=
[
  term ((-1290205715456 : Rat) / 31414578435) [(1, 1), (10, 1), (11, 1)]
]

/-- Partial product 20 for generator 10. -/
def rs_R009_ueqv_R009NNNYN_partial_10_0020 : Poly :=
[
  term ((-2580411430912 : Rat) / 31414578435) [(1, 1), (2, 1), (4, 1), (10, 1), (11, 1)],
  term ((-2580411430912 : Rat) / 31414578435) [(1, 1), (3, 1), (5, 1), (10, 1), (11, 1)],
  term ((1290205715456 : Rat) / 31414578435) [(1, 1), (4, 2), (10, 1), (11, 1)],
  term ((1290205715456 : Rat) / 31414578435) [(1, 1), (5, 2), (10, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 10. -/
theorem rs_R009_ueqv_R009NNNYN_partial_10_0020_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_10_0020
        rs_R009_ueqv_R009NNNYN_generator_10_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_10_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNYN_coefficient_10_0021 : Poly :=
[
  term ((-20159464304 : Rat) / 1163502905) [(1, 1), (10, 1), (13, 1)]
]

/-- Partial product 21 for generator 10. -/
def rs_R009_ueqv_R009NNNYN_partial_10_0021 : Poly :=
[
  term ((-40318928608 : Rat) / 1163502905) [(1, 1), (2, 1), (4, 1), (10, 1), (13, 1)],
  term ((-40318928608 : Rat) / 1163502905) [(1, 1), (3, 1), (5, 1), (10, 1), (13, 1)],
  term ((20159464304 : Rat) / 1163502905) [(1, 1), (4, 2), (10, 1), (13, 1)],
  term ((20159464304 : Rat) / 1163502905) [(1, 1), (5, 2), (10, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 10. -/
theorem rs_R009_ueqv_R009NNNYN_partial_10_0021_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_10_0021
        rs_R009_ueqv_R009NNNYN_generator_10_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_10_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNYN_coefficient_10_0022 : Poly :=
[
  term ((1163489082688 : Rat) / 31414578435) [(1, 1), (10, 1), (15, 1)]
]

/-- Partial product 22 for generator 10. -/
def rs_R009_ueqv_R009NNNYN_partial_10_0022 : Poly :=
[
  term ((2326978165376 : Rat) / 31414578435) [(1, 1), (2, 1), (4, 1), (10, 1), (15, 1)],
  term ((2326978165376 : Rat) / 31414578435) [(1, 1), (3, 1), (5, 1), (10, 1), (15, 1)],
  term ((-1163489082688 : Rat) / 31414578435) [(1, 1), (4, 2), (10, 1), (15, 1)],
  term ((-1163489082688 : Rat) / 31414578435) [(1, 1), (5, 2), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 10. -/
theorem rs_R009_ueqv_R009NNNYN_partial_10_0022_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_10_0022
        rs_R009_ueqv_R009NNNYN_generator_10_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_10_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNYN_coefficient_10_0023 : Poly :=
[
  term ((-3431343694688 : Rat) / 94243735305) [(1, 1), (11, 1)]
]

/-- Partial product 23 for generator 10. -/
def rs_R009_ueqv_R009NNNYN_partial_10_0023 : Poly :=
[
  term ((-6862687389376 : Rat) / 94243735305) [(1, 1), (2, 1), (4, 1), (11, 1)],
  term ((-6862687389376 : Rat) / 94243735305) [(1, 1), (3, 1), (5, 1), (11, 1)],
  term ((3431343694688 : Rat) / 94243735305) [(1, 1), (4, 2), (11, 1)],
  term ((3431343694688 : Rat) / 94243735305) [(1, 1), (5, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 10. -/
theorem rs_R009_ueqv_R009NNNYN_partial_10_0023_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_10_0023
        rs_R009_ueqv_R009NNNYN_generator_10_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_10_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNYN_coefficient_10_0024 : Poly :=
[
  term ((9224029696 : Rat) / 110226591) [(1, 1), (11, 1), (12, 1)]
]

/-- Partial product 24 for generator 10. -/
def rs_R009_ueqv_R009NNNYN_partial_10_0024 : Poly :=
[
  term ((18448059392 : Rat) / 110226591) [(1, 1), (2, 1), (4, 1), (11, 1), (12, 1)],
  term ((18448059392 : Rat) / 110226591) [(1, 1), (3, 1), (5, 1), (11, 1), (12, 1)],
  term ((-9224029696 : Rat) / 110226591) [(1, 1), (4, 2), (11, 1), (12, 1)],
  term ((-9224029696 : Rat) / 110226591) [(1, 1), (5, 2), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 10. -/
theorem rs_R009_ueqv_R009NNNYN_partial_10_0024_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_10_0024
        rs_R009_ueqv_R009NNNYN_generator_10_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_10_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNYN_coefficient_10_0025 : Poly :=
[
  term ((-19496960 : Rat) / 110226591) [(1, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 25 for generator 10. -/
def rs_R009_ueqv_R009NNNYN_partial_10_0025 : Poly :=
[
  term ((-38993920 : Rat) / 110226591) [(1, 1), (2, 1), (4, 1), (11, 1), (13, 1), (15, 1)],
  term ((-38993920 : Rat) / 110226591) [(1, 1), (3, 1), (5, 1), (11, 1), (13, 1), (15, 1)],
  term ((19496960 : Rat) / 110226591) [(1, 1), (4, 2), (11, 1), (13, 1), (15, 1)],
  term ((19496960 : Rat) / 110226591) [(1, 1), (5, 2), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 10. -/
theorem rs_R009_ueqv_R009NNNYN_partial_10_0025_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_10_0025
        rs_R009_ueqv_R009NNNYN_generator_10_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_10_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNYN_coefficient_10_0026 : Poly :=
[
  term ((6149457664 : Rat) / 330679773) [(1, 1), (11, 1), (14, 1)]
]

/-- Partial product 26 for generator 10. -/
def rs_R009_ueqv_R009NNNYN_partial_10_0026 : Poly :=
[
  term ((12298915328 : Rat) / 330679773) [(1, 1), (2, 1), (4, 1), (11, 1), (14, 1)],
  term ((12298915328 : Rat) / 330679773) [(1, 1), (3, 1), (5, 1), (11, 1), (14, 1)],
  term ((-6149457664 : Rat) / 330679773) [(1, 1), (4, 2), (11, 1), (14, 1)],
  term ((-6149457664 : Rat) / 330679773) [(1, 1), (5, 2), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 10. -/
theorem rs_R009_ueqv_R009NNNYN_partial_10_0026_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_10_0026
        rs_R009_ueqv_R009NNNYN_generator_10_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_10_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNYN_coefficient_10_0027 : Poly :=
[
  term ((-126730240 : Rat) / 110226591) [(1, 1), (11, 1), (15, 2)]
]

/-- Partial product 27 for generator 10. -/
def rs_R009_ueqv_R009NNNYN_partial_10_0027 : Poly :=
[
  term ((-253460480 : Rat) / 110226591) [(1, 1), (2, 1), (4, 1), (11, 1), (15, 2)],
  term ((-253460480 : Rat) / 110226591) [(1, 1), (3, 1), (5, 1), (11, 1), (15, 2)],
  term ((126730240 : Rat) / 110226591) [(1, 1), (4, 2), (11, 1), (15, 2)],
  term ((126730240 : Rat) / 110226591) [(1, 1), (5, 2), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 10. -/
theorem rs_R009_ueqv_R009NNNYN_partial_10_0027_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_10_0027
        rs_R009_ueqv_R009NNNYN_generator_10_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_10_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNYN_coefficient_10_0028 : Poly :=
[
  term ((432376392 : Rat) / 12247399) [(1, 1), (12, 1), (13, 1)]
]

/-- Partial product 28 for generator 10. -/
def rs_R009_ueqv_R009NNNYN_partial_10_0028 : Poly :=
[
  term ((864752784 : Rat) / 12247399) [(1, 1), (2, 1), (4, 1), (12, 1), (13, 1)],
  term ((864752784 : Rat) / 12247399) [(1, 1), (3, 1), (5, 1), (12, 1), (13, 1)],
  term ((-432376392 : Rat) / 12247399) [(1, 1), (4, 2), (12, 1), (13, 1)],
  term ((-432376392 : Rat) / 12247399) [(1, 1), (5, 2), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 10. -/
theorem rs_R009_ueqv_R009NNNYN_partial_10_0028_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_10_0028
        rs_R009_ueqv_R009NNNYN_generator_10_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_10_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNYN_coefficient_10_0029 : Poly :=
[
  term ((-8081193296 : Rat) / 110226591) [(1, 1), (12, 1), (15, 1)]
]

/-- Partial product 29 for generator 10. -/
def rs_R009_ueqv_R009NNNYN_partial_10_0029 : Poly :=
[
  term ((-16162386592 : Rat) / 110226591) [(1, 1), (2, 1), (4, 1), (12, 1), (15, 1)],
  term ((-16162386592 : Rat) / 110226591) [(1, 1), (3, 1), (5, 1), (12, 1), (15, 1)],
  term ((8081193296 : Rat) / 110226591) [(1, 1), (4, 2), (12, 1), (15, 1)],
  term ((8081193296 : Rat) / 110226591) [(1, 1), (5, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 10. -/
theorem rs_R009_ueqv_R009NNNYN_partial_10_0029_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_10_0029
        rs_R009_ueqv_R009NNNYN_generator_10_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_10_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNYN_coefficient_10_0030 : Poly :=
[
  term ((-107229490459 : Rat) / 6981017430) [(1, 1), (13, 1)]
]

/-- Partial product 30 for generator 10. -/
def rs_R009_ueqv_R009NNNYN_partial_10_0030 : Poly :=
[
  term ((-107229490459 : Rat) / 3490508715) [(1, 1), (2, 1), (4, 1), (13, 1)],
  term ((-107229490459 : Rat) / 3490508715) [(1, 1), (3, 1), (5, 1), (13, 1)],
  term ((107229490459 : Rat) / 6981017430) [(1, 1), (4, 2), (13, 1)],
  term ((107229490459 : Rat) / 6981017430) [(1, 1), (5, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 10. -/
theorem rs_R009_ueqv_R009NNNYN_partial_10_0030_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_10_0030
        rs_R009_ueqv_R009NNNYN_generator_10_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_10_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNYN_coefficient_10_0031 : Poly :=
[
  term ((96085276 : Rat) / 12247399) [(1, 1), (13, 1), (14, 1)]
]

/-- Partial product 31 for generator 10. -/
def rs_R009_ueqv_R009NNNYN_partial_10_0031 : Poly :=
[
  term ((192170552 : Rat) / 12247399) [(1, 1), (2, 1), (4, 1), (13, 1), (14, 1)],
  term ((192170552 : Rat) / 12247399) [(1, 1), (3, 1), (5, 1), (13, 1), (14, 1)],
  term ((-96085276 : Rat) / 12247399) [(1, 1), (4, 2), (13, 1), (14, 1)],
  term ((-96085276 : Rat) / 12247399) [(1, 1), (5, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 10. -/
theorem rs_R009_ueqv_R009NNNYN_partial_10_0031_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_10_0031
        rs_R009_ueqv_R009NNNYN_generator_10_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_10_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNYN_coefficient_10_0032 : Poly :=
[
  term ((-35882240 : Rat) / 110226591) [(1, 1), (13, 1), (15, 2)]
]

/-- Partial product 32 for generator 10. -/
def rs_R009_ueqv_R009NNNYN_partial_10_0032 : Poly :=
[
  term ((-71764480 : Rat) / 110226591) [(1, 1), (2, 1), (4, 1), (13, 1), (15, 2)],
  term ((-71764480 : Rat) / 110226591) [(1, 1), (3, 1), (5, 1), (13, 1), (15, 2)],
  term ((35882240 : Rat) / 110226591) [(1, 1), (4, 2), (13, 1), (15, 2)],
  term ((35882240 : Rat) / 110226591) [(1, 1), (5, 2), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 10. -/
theorem rs_R009_ueqv_R009NNNYN_partial_10_0032_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_10_0032
        rs_R009_ueqv_R009NNNYN_generator_10_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_10_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNYN_coefficient_10_0033 : Poly :=
[
  term ((-913920 : Rat) / 12247399) [(1, 1), (13, 2), (15, 1)]
]

/-- Partial product 33 for generator 10. -/
def rs_R009_ueqv_R009NNNYN_partial_10_0033 : Poly :=
[
  term ((-1827840 : Rat) / 12247399) [(1, 1), (2, 1), (4, 1), (13, 2), (15, 1)],
  term ((-1827840 : Rat) / 12247399) [(1, 1), (3, 1), (5, 1), (13, 2), (15, 1)],
  term ((913920 : Rat) / 12247399) [(1, 1), (4, 2), (13, 2), (15, 1)],
  term ((913920 : Rat) / 12247399) [(1, 1), (5, 2), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 10. -/
theorem rs_R009_ueqv_R009NNNYN_partial_10_0033_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_10_0033
        rs_R009_ueqv_R009NNNYN_generator_10_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_10_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNYN_coefficient_10_0034 : Poly :=
[
  term ((-5545493072 : Rat) / 330679773) [(1, 1), (14, 1), (15, 1)]
]

/-- Partial product 34 for generator 10. -/
def rs_R009_ueqv_R009NNNYN_partial_10_0034 : Poly :=
[
  term ((-11090986144 : Rat) / 330679773) [(1, 1), (2, 1), (4, 1), (14, 1), (15, 1)],
  term ((-11090986144 : Rat) / 330679773) [(1, 1), (3, 1), (5, 1), (14, 1), (15, 1)],
  term ((5545493072 : Rat) / 330679773) [(1, 1), (4, 2), (14, 1), (15, 1)],
  term ((5545493072 : Rat) / 330679773) [(1, 1), (5, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 10. -/
theorem rs_R009_ueqv_R009NNNYN_partial_10_0034_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_10_0034
        rs_R009_ueqv_R009NNNYN_generator_10_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_10_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNYN_coefficient_10_0035 : Poly :=
[
  term ((2956487679004 : Rat) / 94243735305) [(1, 1), (15, 1)]
]

/-- Partial product 35 for generator 10. -/
def rs_R009_ueqv_R009NNNYN_partial_10_0035 : Poly :=
[
  term ((5912975358008 : Rat) / 94243735305) [(1, 1), (2, 1), (4, 1), (15, 1)],
  term ((5912975358008 : Rat) / 94243735305) [(1, 1), (3, 1), (5, 1), (15, 1)],
  term ((-2956487679004 : Rat) / 94243735305) [(1, 1), (4, 2), (15, 1)],
  term ((-2956487679004 : Rat) / 94243735305) [(1, 1), (5, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 10. -/
theorem rs_R009_ueqv_R009NNNYN_partial_10_0035_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_10_0035
        rs_R009_ueqv_R009NNNYN_generator_10_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_10_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNYN_coefficient_10_0036 : Poly :=
[
  term ((114283520 : Rat) / 110226591) [(1, 1), (15, 3)]
]

/-- Partial product 36 for generator 10. -/
def rs_R009_ueqv_R009NNNYN_partial_10_0036 : Poly :=
[
  term ((228567040 : Rat) / 110226591) [(1, 1), (2, 1), (4, 1), (15, 3)],
  term ((228567040 : Rat) / 110226591) [(1, 1), (3, 1), (5, 1), (15, 3)],
  term ((-114283520 : Rat) / 110226591) [(1, 1), (4, 2), (15, 3)],
  term ((-114283520 : Rat) / 110226591) [(1, 1), (5, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 10. -/
theorem rs_R009_ueqv_R009NNNYN_partial_10_0036_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_10_0036
        rs_R009_ueqv_R009NNNYN_generator_10_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_10_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNYN_coefficient_10_0037 : Poly :=
[
  term ((722892800 : Rat) / 330679773) [(2, 1), (5, 1), (11, 1)]
]

/-- Partial product 37 for generator 10. -/
def rs_R009_ueqv_R009NNNYN_partial_10_0037 : Poly :=
[
  term ((1445785600 : Rat) / 330679773) [(2, 1), (3, 1), (5, 2), (11, 1)],
  term ((-722892800 : Rat) / 330679773) [(2, 1), (4, 2), (5, 1), (11, 1)],
  term ((-722892800 : Rat) / 330679773) [(2, 1), (5, 3), (11, 1)],
  term ((1445785600 : Rat) / 330679773) [(2, 2), (4, 1), (5, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 10. -/
theorem rs_R009_ueqv_R009NNNYN_partial_10_0037_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_10_0037
        rs_R009_ueqv_R009NNNYN_generator_10_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_10_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNYN_coefficient_10_0038 : Poly :=
[
  term ((11295200 : Rat) / 12247399) [(2, 1), (5, 1), (13, 1)]
]

/-- Partial product 38 for generator 10. -/
def rs_R009_ueqv_R009NNNYN_partial_10_0038 : Poly :=
[
  term ((22590400 : Rat) / 12247399) [(2, 1), (3, 1), (5, 2), (13, 1)],
  term ((-11295200 : Rat) / 12247399) [(2, 1), (4, 2), (5, 1), (13, 1)],
  term ((-11295200 : Rat) / 12247399) [(2, 1), (5, 3), (13, 1)],
  term ((22590400 : Rat) / 12247399) [(2, 2), (4, 1), (5, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 10. -/
theorem rs_R009_ueqv_R009NNNYN_partial_10_0038_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_10_0038
        rs_R009_ueqv_R009NNNYN_generator_10_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_10_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNYN_coefficient_10_0039 : Poly :=
[
  term ((-651894400 : Rat) / 330679773) [(2, 1), (5, 1), (15, 1)]
]

/-- Partial product 39 for generator 10. -/
def rs_R009_ueqv_R009NNNYN_partial_10_0039 : Poly :=
[
  term ((-1303788800 : Rat) / 330679773) [(2, 1), (3, 1), (5, 2), (15, 1)],
  term ((651894400 : Rat) / 330679773) [(2, 1), (4, 2), (5, 1), (15, 1)],
  term ((651894400 : Rat) / 330679773) [(2, 1), (5, 3), (15, 1)],
  term ((-1303788800 : Rat) / 330679773) [(2, 2), (4, 1), (5, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 10. -/
theorem rs_R009_ueqv_R009NNNYN_partial_10_0039_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_10_0039
        rs_R009_ueqv_R009NNNYN_generator_10_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_10_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNYN_coefficient_10_0040 : Poly :=
[
  term ((898186240 : Rat) / 330679773) [(2, 1), (7, 1), (11, 1)]
]

/-- Partial product 40 for generator 10. -/
def rs_R009_ueqv_R009NNNYN_partial_10_0040 : Poly :=
[
  term ((1796372480 : Rat) / 330679773) [(2, 1), (3, 1), (5, 1), (7, 1), (11, 1)],
  term ((-898186240 : Rat) / 330679773) [(2, 1), (4, 2), (7, 1), (11, 1)],
  term ((-898186240 : Rat) / 330679773) [(2, 1), (5, 2), (7, 1), (11, 1)],
  term ((1796372480 : Rat) / 330679773) [(2, 2), (4, 1), (7, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 10. -/
theorem rs_R009_ueqv_R009NNNYN_partial_10_0040_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_10_0040
        rs_R009_ueqv_R009NNNYN_generator_10_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_10_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNYN_coefficient_10_0041 : Poly :=
[
  term ((14034160 : Rat) / 12247399) [(2, 1), (7, 1), (13, 1)]
]

/-- Partial product 41 for generator 10. -/
def rs_R009_ueqv_R009NNNYN_partial_10_0041 : Poly :=
[
  term ((28068320 : Rat) / 12247399) [(2, 1), (3, 1), (5, 1), (7, 1), (13, 1)],
  term ((-14034160 : Rat) / 12247399) [(2, 1), (4, 2), (7, 1), (13, 1)],
  term ((-14034160 : Rat) / 12247399) [(2, 1), (5, 2), (7, 1), (13, 1)],
  term ((28068320 : Rat) / 12247399) [(2, 2), (4, 1), (7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 10. -/
theorem rs_R009_ueqv_R009NNNYN_partial_10_0041_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_10_0041
        rs_R009_ueqv_R009NNNYN_generator_10_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_10_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNYN_coefficient_10_0042 : Poly :=
[
  term ((-809971520 : Rat) / 330679773) [(2, 1), (7, 1), (15, 1)]
]

/-- Partial product 42 for generator 10. -/
def rs_R009_ueqv_R009NNNYN_partial_10_0042 : Poly :=
[
  term ((-1619943040 : Rat) / 330679773) [(2, 1), (3, 1), (5, 1), (7, 1), (15, 1)],
  term ((809971520 : Rat) / 330679773) [(2, 1), (4, 2), (7, 1), (15, 1)],
  term ((809971520 : Rat) / 330679773) [(2, 1), (5, 2), (7, 1), (15, 1)],
  term ((-1619943040 : Rat) / 330679773) [(2, 2), (4, 1), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 10. -/
theorem rs_R009_ueqv_R009NNNYN_partial_10_0042_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_10_0042
        rs_R009_ueqv_R009NNNYN_generator_10_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_10_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNYN_coefficient_10_0043 : Poly :=
[
  term ((736691200 : Rat) / 330679773) [(2, 1), (9, 1), (11, 1)]
]

/-- Partial product 43 for generator 10. -/
def rs_R009_ueqv_R009NNNYN_partial_10_0043 : Poly :=
[
  term ((1473382400 : Rat) / 330679773) [(2, 1), (3, 1), (5, 1), (9, 1), (11, 1)],
  term ((-736691200 : Rat) / 330679773) [(2, 1), (4, 2), (9, 1), (11, 1)],
  term ((-736691200 : Rat) / 330679773) [(2, 1), (5, 2), (9, 1), (11, 1)],
  term ((1473382400 : Rat) / 330679773) [(2, 2), (4, 1), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 10. -/
theorem rs_R009_ueqv_R009NNNYN_partial_10_0043_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_10_0043
        rs_R009_ueqv_R009NNNYN_generator_10_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_10_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNYN_coefficient_10_0044 : Poly :=
[
  term ((11510800 : Rat) / 12247399) [(2, 1), (9, 1), (13, 1)]
]

/-- Partial product 44 for generator 10. -/
def rs_R009_ueqv_R009NNNYN_partial_10_0044 : Poly :=
[
  term ((23021600 : Rat) / 12247399) [(2, 1), (3, 1), (5, 1), (9, 1), (13, 1)],
  term ((-11510800 : Rat) / 12247399) [(2, 1), (4, 2), (9, 1), (13, 1)],
  term ((-11510800 : Rat) / 12247399) [(2, 1), (5, 2), (9, 1), (13, 1)],
  term ((23021600 : Rat) / 12247399) [(2, 2), (4, 1), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 10. -/
theorem rs_R009_ueqv_R009NNNYN_partial_10_0044_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_10_0044
        rs_R009_ueqv_R009NNNYN_generator_10_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_10_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNYN_coefficient_10_0045 : Poly :=
[
  term ((-664337600 : Rat) / 330679773) [(2, 1), (9, 1), (15, 1)]
]

/-- Partial product 45 for generator 10. -/
def rs_R009_ueqv_R009NNNYN_partial_10_0045 : Poly :=
[
  term ((-1328675200 : Rat) / 330679773) [(2, 1), (3, 1), (5, 1), (9, 1), (15, 1)],
  term ((664337600 : Rat) / 330679773) [(2, 1), (4, 2), (9, 1), (15, 1)],
  term ((664337600 : Rat) / 330679773) [(2, 1), (5, 2), (9, 1), (15, 1)],
  term ((-1328675200 : Rat) / 330679773) [(2, 2), (4, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 10. -/
theorem rs_R009_ueqv_R009NNNYN_partial_10_0045_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_10_0045
        rs_R009_ueqv_R009NNNYN_generator_10_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_10_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNYN_coefficient_10_0046 : Poly :=
[
  term ((-604549120 : Rat) / 330679773) [(2, 1), (11, 1), (13, 1)]
]

/-- Partial product 46 for generator 10. -/
def rs_R009_ueqv_R009NNNYN_partial_10_0046 : Poly :=
[
  term ((-1209098240 : Rat) / 330679773) [(2, 1), (3, 1), (5, 1), (11, 1), (13, 1)],
  term ((604549120 : Rat) / 330679773) [(2, 1), (4, 2), (11, 1), (13, 1)],
  term ((604549120 : Rat) / 330679773) [(2, 1), (5, 2), (11, 1), (13, 1)],
  term ((-1209098240 : Rat) / 330679773) [(2, 2), (4, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 10. -/
theorem rs_R009_ueqv_R009NNNYN_partial_10_0046_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_10_0046
        rs_R009_ueqv_R009NNNYN_generator_10_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_10_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNYN_coefficient_10_0047 : Poly :=
[
  term ((-214323200 : Rat) / 110226591) [(2, 1), (11, 1), (15, 1)]
]

/-- Partial product 47 for generator 10. -/
def rs_R009_ueqv_R009NNNYN_partial_10_0047 : Poly :=
[
  term ((-428646400 : Rat) / 110226591) [(2, 1), (3, 1), (5, 1), (11, 1), (15, 1)],
  term ((214323200 : Rat) / 110226591) [(2, 1), (4, 2), (11, 1), (15, 1)],
  term ((214323200 : Rat) / 110226591) [(2, 1), (5, 2), (11, 1), (15, 1)],
  term ((-428646400 : Rat) / 110226591) [(2, 2), (4, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 10. -/
theorem rs_R009_ueqv_R009NNNYN_partial_10_0047_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_10_0047
        rs_R009_ueqv_R009NNNYN_generator_10_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_10_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNYN_coefficient_10_0048 : Poly :=
[
  term ((5168320 : Rat) / 6239241) [(2, 1), (13, 1), (15, 1)]
]

/-- Partial product 48 for generator 10. -/
def rs_R009_ueqv_R009NNNYN_partial_10_0048 : Poly :=
[
  term ((10336640 : Rat) / 6239241) [(2, 1), (3, 1), (5, 1), (13, 1), (15, 1)],
  term ((-5168320 : Rat) / 6239241) [(2, 1), (4, 2), (13, 1), (15, 1)],
  term ((-5168320 : Rat) / 6239241) [(2, 1), (5, 2), (13, 1), (15, 1)],
  term ((10336640 : Rat) / 6239241) [(2, 2), (4, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 10. -/
theorem rs_R009_ueqv_R009NNNYN_partial_10_0048_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_10_0048
        rs_R009_ueqv_R009NNNYN_generator_10_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_10_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNYN_coefficient_10_0049 : Poly :=
[
  term ((-9446080 : Rat) / 12247399) [(2, 1), (13, 2)]
]

/-- Partial product 49 for generator 10. -/
def rs_R009_ueqv_R009NNNYN_partial_10_0049 : Poly :=
[
  term ((-18892160 : Rat) / 12247399) [(2, 1), (3, 1), (5, 1), (13, 2)],
  term ((9446080 : Rat) / 12247399) [(2, 1), (4, 2), (13, 2)],
  term ((9446080 : Rat) / 12247399) [(2, 1), (5, 2), (13, 2)],
  term ((-18892160 : Rat) / 12247399) [(2, 2), (4, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 10. -/
theorem rs_R009_ueqv_R009NNNYN_partial_10_0049_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_10_0049
        rs_R009_ueqv_R009NNNYN_generator_10_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_10_0049 := by
  native_decide

/-- Coefficient term 50 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNYN_coefficient_10_0050 : Poly :=
[
  term ((193273600 : Rat) / 110226591) [(2, 1), (15, 2)]
]

/-- Partial product 50 for generator 10. -/
def rs_R009_ueqv_R009NNNYN_partial_10_0050 : Poly :=
[
  term ((386547200 : Rat) / 110226591) [(2, 1), (3, 1), (5, 1), (15, 2)],
  term ((-193273600 : Rat) / 110226591) [(2, 1), (4, 2), (15, 2)],
  term ((-193273600 : Rat) / 110226591) [(2, 1), (5, 2), (15, 2)],
  term ((386547200 : Rat) / 110226591) [(2, 2), (4, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 50 for generator 10. -/
theorem rs_R009_ueqv_R009NNNYN_partial_10_0050_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_10_0050
        rs_R009_ueqv_R009NNNYN_generator_10_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_10_0050 := by
  native_decide

/-- Coefficient term 51 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNYN_coefficient_10_0051 : Poly :=
[
  term ((282894080 : Rat) / 110226591) [(3, 1), (11, 1)]
]

/-- Partial product 51 for generator 10. -/
def rs_R009_ueqv_R009NNNYN_partial_10_0051 : Poly :=
[
  term ((565788160 : Rat) / 110226591) [(2, 1), (3, 1), (4, 1), (11, 1)],
  term ((-282894080 : Rat) / 110226591) [(3, 1), (4, 2), (11, 1)],
  term ((-282894080 : Rat) / 110226591) [(3, 1), (5, 2), (11, 1)],
  term ((565788160 : Rat) / 110226591) [(3, 2), (5, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 51 for generator 10. -/
theorem rs_R009_ueqv_R009NNNYN_partial_10_0051_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_10_0051
        rs_R009_ueqv_R009NNNYN_generator_10_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_10_0051 := by
  native_decide

/-- Coefficient term 52 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNYN_coefficient_10_0052 : Poly :=
[
  term ((-402752000 : Rat) / 110226591) [(3, 1), (11, 1), (12, 1)]
]

/-- Partial product 52 for generator 10. -/
def rs_R009_ueqv_R009NNNYN_partial_10_0052 : Poly :=
[
  term ((-805504000 : Rat) / 110226591) [(2, 1), (3, 1), (4, 1), (11, 1), (12, 1)],
  term ((402752000 : Rat) / 110226591) [(3, 1), (4, 2), (11, 1), (12, 1)],
  term ((402752000 : Rat) / 110226591) [(3, 1), (5, 2), (11, 1), (12, 1)],
  term ((-805504000 : Rat) / 110226591) [(3, 2), (5, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 52 for generator 10. -/
theorem rs_R009_ueqv_R009NNNYN_partial_10_0052_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_10_0052
        rs_R009_ueqv_R009NNNYN_generator_10_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_10_0052 := by
  native_decide

/-- Coefficient term 53 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNYN_coefficient_10_0053 : Poly :=
[
  term ((-1363640320 : Rat) / 330679773) [(3, 1), (11, 1), (14, 1)]
]

/-- Partial product 53 for generator 10. -/
def rs_R009_ueqv_R009NNNYN_partial_10_0053 : Poly :=
[
  term ((-2727280640 : Rat) / 330679773) [(2, 1), (3, 1), (4, 1), (11, 1), (14, 1)],
  term ((1363640320 : Rat) / 330679773) [(3, 1), (4, 2), (11, 1), (14, 1)],
  term ((1363640320 : Rat) / 330679773) [(3, 1), (5, 2), (11, 1), (14, 1)],
  term ((-2727280640 : Rat) / 330679773) [(3, 2), (5, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 53 for generator 10. -/
theorem rs_R009_ueqv_R009NNNYN_partial_10_0053_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_10_0053
        rs_R009_ueqv_R009NNNYN_generator_10_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_10_0053 := by
  native_decide

/-- Coefficient term 54 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNYN_coefficient_10_0054 : Poly :=
[
  term ((-18879000 : Rat) / 12247399) [(3, 1), (12, 1), (13, 1)]
]

/-- Partial product 54 for generator 10. -/
def rs_R009_ueqv_R009NNNYN_partial_10_0054 : Poly :=
[
  term ((-37758000 : Rat) / 12247399) [(2, 1), (3, 1), (4, 1), (12, 1), (13, 1)],
  term ((18879000 : Rat) / 12247399) [(3, 1), (4, 2), (12, 1), (13, 1)],
  term ((18879000 : Rat) / 12247399) [(3, 1), (5, 2), (12, 1), (13, 1)],
  term ((-37758000 : Rat) / 12247399) [(3, 2), (5, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 54 for generator 10. -/
theorem rs_R009_ueqv_R009NNNYN_partial_10_0054_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_10_0054
        rs_R009_ueqv_R009NNNYN_generator_10_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_10_0054 := by
  native_decide

/-- Coefficient term 55 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNYN_coefficient_10_0055 : Poly :=
[
  term ((363196000 : Rat) / 110226591) [(3, 1), (12, 1), (15, 1)]
]

/-- Partial product 55 for generator 10. -/
def rs_R009_ueqv_R009NNNYN_partial_10_0055 : Poly :=
[
  term ((726392000 : Rat) / 110226591) [(2, 1), (3, 1), (4, 1), (12, 1), (15, 1)],
  term ((-363196000 : Rat) / 110226591) [(3, 1), (4, 2), (12, 1), (15, 1)],
  term ((-363196000 : Rat) / 110226591) [(3, 1), (5, 2), (12, 1), (15, 1)],
  term ((726392000 : Rat) / 110226591) [(3, 2), (5, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 55 for generator 10. -/
theorem rs_R009_ueqv_R009NNNYN_partial_10_0055_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_10_0055
        rs_R009_ueqv_R009NNNYN_generator_10_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_10_0055 := by
  native_decide

/-- Coefficient term 56 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNYN_coefficient_10_0056 : Poly :=
[
  term ((13260660 : Rat) / 12247399) [(3, 1), (13, 1)]
]

/-- Partial product 56 for generator 10. -/
def rs_R009_ueqv_R009NNNYN_partial_10_0056 : Poly :=
[
  term ((26521320 : Rat) / 12247399) [(2, 1), (3, 1), (4, 1), (13, 1)],
  term ((-13260660 : Rat) / 12247399) [(3, 1), (4, 2), (13, 1)],
  term ((-13260660 : Rat) / 12247399) [(3, 1), (5, 2), (13, 1)],
  term ((26521320 : Rat) / 12247399) [(3, 2), (5, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 56 for generator 10. -/
theorem rs_R009_ueqv_R009NNNYN_partial_10_0056_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_10_0056
        rs_R009_ueqv_R009NNNYN_generator_10_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_10_0056 := by
  native_decide

/-- Coefficient term 57 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNYN_coefficient_10_0057 : Poly :=
[
  term ((-21306880 : Rat) / 12247399) [(3, 1), (13, 1), (14, 1)]
]

/-- Partial product 57 for generator 10. -/
def rs_R009_ueqv_R009NNNYN_partial_10_0057 : Poly :=
[
  term ((-42613760 : Rat) / 12247399) [(2, 1), (3, 1), (4, 1), (13, 1), (14, 1)],
  term ((21306880 : Rat) / 12247399) [(3, 1), (4, 2), (13, 1), (14, 1)],
  term ((21306880 : Rat) / 12247399) [(3, 1), (5, 2), (13, 1), (14, 1)],
  term ((-42613760 : Rat) / 12247399) [(3, 2), (5, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 57 for generator 10. -/
theorem rs_R009_ueqv_R009NNNYN_partial_10_0057_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_10_0057
        rs_R009_ueqv_R009NNNYN_generator_10_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_10_0057 := by
  native_decide

/-- Coefficient term 58 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNYN_coefficient_10_0058 : Poly :=
[
  term ((1229711360 : Rat) / 330679773) [(3, 1), (14, 1), (15, 1)]
]

/-- Partial product 58 for generator 10. -/
def rs_R009_ueqv_R009NNNYN_partial_10_0058 : Poly :=
[
  term ((2459422720 : Rat) / 330679773) [(2, 1), (3, 1), (4, 1), (14, 1), (15, 1)],
  term ((-1229711360 : Rat) / 330679773) [(3, 1), (4, 2), (14, 1), (15, 1)],
  term ((-1229711360 : Rat) / 330679773) [(3, 1), (5, 2), (14, 1), (15, 1)],
  term ((2459422720 : Rat) / 330679773) [(3, 2), (5, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 58 for generator 10. -/
theorem rs_R009_ueqv_R009NNNYN_partial_10_0058_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_10_0058
        rs_R009_ueqv_R009NNNYN_generator_10_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_10_0058 := by
  native_decide

/-- Coefficient term 59 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNYN_coefficient_10_0059 : Poly :=
[
  term ((-255109840 : Rat) / 110226591) [(3, 1), (15, 1)]
]

/-- Partial product 59 for generator 10. -/
def rs_R009_ueqv_R009NNNYN_partial_10_0059 : Poly :=
[
  term ((-510219680 : Rat) / 110226591) [(2, 1), (3, 1), (4, 1), (15, 1)],
  term ((255109840 : Rat) / 110226591) [(3, 1), (4, 2), (15, 1)],
  term ((255109840 : Rat) / 110226591) [(3, 1), (5, 2), (15, 1)],
  term ((-510219680 : Rat) / 110226591) [(3, 2), (5, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 59 for generator 10. -/
theorem rs_R009_ueqv_R009NNNYN_partial_10_0059_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_10_0059
        rs_R009_ueqv_R009NNNYN_generator_10_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_10_0059 := by
  native_decide

/-- Coefficient term 60 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNYN_coefficient_10_0060 : Poly :=
[
  term ((-317542400 : Rat) / 110226591) [(4, 1), (9, 1), (11, 1)]
]

/-- Partial product 60 for generator 10. -/
def rs_R009_ueqv_R009NNNYN_partial_10_0060 : Poly :=
[
  term ((-635084800 : Rat) / 110226591) [(2, 1), (4, 2), (9, 1), (11, 1)],
  term ((-635084800 : Rat) / 110226591) [(3, 1), (4, 1), (5, 1), (9, 1), (11, 1)],
  term ((317542400 : Rat) / 110226591) [(4, 1), (5, 2), (9, 1), (11, 1)],
  term ((317542400 : Rat) / 110226591) [(4, 3), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 60 for generator 10. -/
theorem rs_R009_ueqv_R009NNNYN_partial_10_0060_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_10_0060
        rs_R009_ueqv_R009NNNYN_generator_10_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_10_0060 := by
  native_decide

/-- Coefficient term 61 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNYN_coefficient_10_0061 : Poly :=
[
  term ((-14884800 : Rat) / 12247399) [(4, 1), (9, 1), (13, 1)]
]

/-- Partial product 61 for generator 10. -/
def rs_R009_ueqv_R009NNNYN_partial_10_0061 : Poly :=
[
  term ((-29769600 : Rat) / 12247399) [(2, 1), (4, 2), (9, 1), (13, 1)],
  term ((-29769600 : Rat) / 12247399) [(3, 1), (4, 1), (5, 1), (9, 1), (13, 1)],
  term ((14884800 : Rat) / 12247399) [(4, 1), (5, 2), (9, 1), (13, 1)],
  term ((14884800 : Rat) / 12247399) [(4, 3), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 61 for generator 10. -/
theorem rs_R009_ueqv_R009NNNYN_partial_10_0061_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_10_0061
        rs_R009_ueqv_R009NNNYN_generator_10_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_10_0061 := by
  native_decide

/-- Coefficient term 62 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNYN_coefficient_10_0062 : Poly :=
[
  term ((286355200 : Rat) / 110226591) [(4, 1), (9, 1), (15, 1)]
]

/-- Partial product 62 for generator 10. -/
def rs_R009_ueqv_R009NNNYN_partial_10_0062 : Poly :=
[
  term ((572710400 : Rat) / 110226591) [(2, 1), (4, 2), (9, 1), (15, 1)],
  term ((572710400 : Rat) / 110226591) [(3, 1), (4, 1), (5, 1), (9, 1), (15, 1)],
  term ((-286355200 : Rat) / 110226591) [(4, 1), (5, 2), (9, 1), (15, 1)],
  term ((-286355200 : Rat) / 110226591) [(4, 3), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 62 for generator 10. -/
theorem rs_R009_ueqv_R009NNNYN_partial_10_0062_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_10_0062
        rs_R009_ueqv_R009NNNYN_generator_10_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_10_0062 := by
  native_decide

/-- Coefficient term 63 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNYN_coefficient_10_0063 : Poly :=
[
  term ((-123 : Rat) / 67) [(5, 1), (9, 1)]
]

/-- Partial product 63 for generator 10. -/
def rs_R009_ueqv_R009NNNYN_partial_10_0063 : Poly :=
[
  term ((-246 : Rat) / 67) [(2, 1), (4, 1), (5, 1), (9, 1)],
  term ((-246 : Rat) / 67) [(3, 1), (5, 2), (9, 1)],
  term ((123 : Rat) / 67) [(4, 2), (5, 1), (9, 1)],
  term ((123 : Rat) / 67) [(5, 3), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 63 for generator 10. -/
theorem rs_R009_ueqv_R009NNNYN_partial_10_0063_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_10_0063
        rs_R009_ueqv_R009NNNYN_generator_10_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_10_0063 := by
  native_decide

/-- Coefficient term 64 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNYN_coefficient_10_0064 : Poly :=
[
  term ((19496960 : Rat) / 330679773) [(5, 1), (10, 1), (11, 1)]
]

/-- Partial product 64 for generator 10. -/
def rs_R009_ueqv_R009NNNYN_partial_10_0064 : Poly :=
[
  term ((38993920 : Rat) / 330679773) [(2, 1), (4, 1), (5, 1), (10, 1), (11, 1)],
  term ((38993920 : Rat) / 330679773) [(3, 1), (5, 2), (10, 1), (11, 1)],
  term ((-19496960 : Rat) / 330679773) [(4, 2), (5, 1), (10, 1), (11, 1)],
  term ((-19496960 : Rat) / 330679773) [(5, 3), (10, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 64 for generator 10. -/
theorem rs_R009_ueqv_R009NNNYN_partial_10_0064_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_10_0064
        rs_R009_ueqv_R009NNNYN_generator_10_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_10_0064 := by
  native_decide

/-- Coefficient term 65 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNYN_coefficient_10_0065 : Poly :=
[
  term ((304640 : Rat) / 12247399) [(5, 1), (10, 1), (13, 1)]
]

/-- Partial product 65 for generator 10. -/
def rs_R009_ueqv_R009NNNYN_partial_10_0065 : Poly :=
[
  term ((609280 : Rat) / 12247399) [(2, 1), (4, 1), (5, 1), (10, 1), (13, 1)],
  term ((609280 : Rat) / 12247399) [(3, 1), (5, 2), (10, 1), (13, 1)],
  term ((-304640 : Rat) / 12247399) [(4, 2), (5, 1), (10, 1), (13, 1)],
  term ((-304640 : Rat) / 12247399) [(5, 3), (10, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 65 for generator 10. -/
theorem rs_R009_ueqv_R009NNNYN_partial_10_0065_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_10_0065
        rs_R009_ueqv_R009NNNYN_generator_10_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_10_0065 := by
  native_decide

/-- Coefficient term 66 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNYN_coefficient_10_0066 : Poly :=
[
  term ((-17582080 : Rat) / 330679773) [(5, 1), (10, 1), (15, 1)]
]

/-- Partial product 66 for generator 10. -/
def rs_R009_ueqv_R009NNNYN_partial_10_0066 : Poly :=
[
  term ((-35164160 : Rat) / 330679773) [(2, 1), (4, 1), (5, 1), (10, 1), (15, 1)],
  term ((-35164160 : Rat) / 330679773) [(3, 1), (5, 2), (10, 1), (15, 1)],
  term ((17582080 : Rat) / 330679773) [(4, 2), (5, 1), (10, 1), (15, 1)],
  term ((17582080 : Rat) / 330679773) [(5, 3), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 66 for generator 10. -/
theorem rs_R009_ueqv_R009NNNYN_partial_10_0066_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_10_0066
        rs_R009_ueqv_R009NNNYN_generator_10_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_10_0066 := by
  native_decide

/-- Coefficient term 67 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNYN_coefficient_10_0067 : Poly :=
[
  term ((-5083655092 : Rat) / 330679773) [(5, 1), (11, 1)]
]

/-- Partial product 67 for generator 10. -/
def rs_R009_ueqv_R009NNNYN_partial_10_0067 : Poly :=
[
  term ((-10167310184 : Rat) / 330679773) [(2, 1), (4, 1), (5, 1), (11, 1)],
  term ((-10167310184 : Rat) / 330679773) [(3, 1), (5, 2), (11, 1)],
  term ((5083655092 : Rat) / 330679773) [(4, 2), (5, 1), (11, 1)],
  term ((5083655092 : Rat) / 330679773) [(5, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 67 for generator 10. -/
theorem rs_R009_ueqv_R009NNNYN_partial_10_0067_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_10_0067
        rs_R009_ueqv_R009NNNYN_generator_10_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_10_0067 := by
  native_decide

/-- Coefficient term 68 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNYN_coefficient_10_0068 : Poly :=
[
  term ((-35069440 : Rat) / 110226591) [(5, 1), (11, 1), (12, 1)]
]

/-- Partial product 68 for generator 10. -/
def rs_R009_ueqv_R009NNNYN_partial_10_0068 : Poly :=
[
  term ((-70138880 : Rat) / 110226591) [(2, 1), (4, 1), (5, 1), (11, 1), (12, 1)],
  term ((-70138880 : Rat) / 110226591) [(3, 1), (5, 2), (11, 1), (12, 1)],
  term ((35069440 : Rat) / 110226591) [(4, 2), (5, 1), (11, 1), (12, 1)],
  term ((35069440 : Rat) / 110226591) [(5, 3), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 68 for generator 10. -/
theorem rs_R009_ueqv_R009NNNYN_partial_10_0068_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_10_0068
        rs_R009_ueqv_R009NNNYN_generator_10_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_10_0068 := by
  native_decide

/-- Coefficient term 69 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNYN_coefficient_10_0069 : Poly :=
[
  term ((-913920 : Rat) / 12247399) [(5, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 69 for generator 10. -/
def rs_R009_ueqv_R009NNNYN_partial_10_0069 : Poly :=
[
  term ((-1827840 : Rat) / 12247399) [(2, 1), (4, 1), (5, 1), (11, 1), (13, 1), (15, 1)],
  term ((-1827840 : Rat) / 12247399) [(3, 1), (5, 2), (11, 1), (13, 1), (15, 1)],
  term ((913920 : Rat) / 12247399) [(4, 2), (5, 1), (11, 1), (13, 1), (15, 1)],
  term ((913920 : Rat) / 12247399) [(5, 3), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 69 for generator 10. -/
theorem rs_R009_ueqv_R009NNNYN_partial_10_0069_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_10_0069
        rs_R009_ueqv_R009NNNYN_generator_10_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_10_0069 := by
  native_decide

/-- Coefficient term 70 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNYN_coefficient_10_0070 : Poly :=
[
  term ((1611070720 : Rat) / 110226591) [(5, 1), (11, 1), (14, 1)]
]

/-- Partial product 70 for generator 10. -/
def rs_R009_ueqv_R009NNNYN_partial_10_0070 : Poly :=
[
  term ((3222141440 : Rat) / 110226591) [(2, 1), (4, 1), (5, 1), (11, 1), (14, 1)],
  term ((3222141440 : Rat) / 110226591) [(3, 1), (5, 2), (11, 1), (14, 1)],
  term ((-1611070720 : Rat) / 110226591) [(4, 2), (5, 1), (11, 1), (14, 1)],
  term ((-1611070720 : Rat) / 110226591) [(5, 3), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 70 for generator 10. -/
theorem rs_R009_ueqv_R009NNNYN_partial_10_0070_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_10_0070
        rs_R009_ueqv_R009NNNYN_generator_10_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_10_0070 := by
  native_decide

/-- Coefficient term 71 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNYN_coefficient_10_0071 : Poly :=
[
  term ((32204800 : Rat) / 110226591) [(5, 1), (11, 1), (15, 2)]
]

/-- Partial product 71 for generator 10. -/
def rs_R009_ueqv_R009NNNYN_partial_10_0071 : Poly :=
[
  term ((64409600 : Rat) / 110226591) [(2, 1), (4, 1), (5, 1), (11, 1), (15, 2)],
  term ((64409600 : Rat) / 110226591) [(3, 1), (5, 2), (11, 1), (15, 2)],
  term ((-32204800 : Rat) / 110226591) [(4, 2), (5, 1), (11, 1), (15, 2)],
  term ((-32204800 : Rat) / 110226591) [(5, 3), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 71 for generator 10. -/
theorem rs_R009_ueqv_R009NNNYN_partial_10_0071_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_10_0071
        rs_R009_ueqv_R009NNNYN_generator_10_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_10_0071 := by
  native_decide

/-- Coefficient term 72 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNYN_coefficient_10_0072 : Poly :=
[
  term ((-19496960 : Rat) / 110226591) [(5, 1), (11, 2), (15, 1)]
]

/-- Partial product 72 for generator 10. -/
def rs_R009_ueqv_R009NNNYN_partial_10_0072 : Poly :=
[
  term ((-38993920 : Rat) / 110226591) [(2, 1), (4, 1), (5, 1), (11, 2), (15, 1)],
  term ((-38993920 : Rat) / 110226591) [(3, 1), (5, 2), (11, 2), (15, 1)],
  term ((19496960 : Rat) / 110226591) [(4, 2), (5, 1), (11, 2), (15, 1)],
  term ((19496960 : Rat) / 110226591) [(5, 3), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 72 for generator 10. -/
theorem rs_R009_ueqv_R009NNNYN_partial_10_0072_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_10_0072
        rs_R009_ueqv_R009NNNYN_generator_10_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_10_0072 := by
  native_decide

/-- Coefficient term 73 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNYN_coefficient_10_0073 : Poly :=
[
  term ((-1643880 : Rat) / 12247399) [(5, 1), (12, 1), (13, 1)]
]

/-- Partial product 73 for generator 10. -/
def rs_R009_ueqv_R009NNNYN_partial_10_0073 : Poly :=
[
  term ((-3287760 : Rat) / 12247399) [(2, 1), (4, 1), (5, 1), (12, 1), (13, 1)],
  term ((-3287760 : Rat) / 12247399) [(3, 1), (5, 2), (12, 1), (13, 1)],
  term ((1643880 : Rat) / 12247399) [(4, 2), (5, 1), (12, 1), (13, 1)],
  term ((1643880 : Rat) / 12247399) [(5, 3), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 73 for generator 10. -/
theorem rs_R009_ueqv_R009NNNYN_partial_10_0073_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_10_0073
        rs_R009_ueqv_R009NNNYN_generator_10_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_10_0073 := by
  native_decide

/-- Coefficient term 74 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNYN_coefficient_10_0074 : Poly :=
[
  term ((90851348 : Rat) / 110226591) [(5, 1), (12, 1), (15, 1)]
]

/-- Partial product 74 for generator 10. -/
def rs_R009_ueqv_R009NNNYN_partial_10_0074 : Poly :=
[
  term ((181702696 : Rat) / 110226591) [(2, 1), (4, 1), (5, 1), (12, 1), (15, 1)],
  term ((181702696 : Rat) / 110226591) [(3, 1), (5, 2), (12, 1), (15, 1)],
  term ((-90851348 : Rat) / 110226591) [(4, 2), (5, 1), (12, 1), (15, 1)],
  term ((-90851348 : Rat) / 110226591) [(5, 3), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 74 for generator 10. -/
theorem rs_R009_ueqv_R009NNNYN_partial_10_0074_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_10_0074
        rs_R009_ueqv_R009NNNYN_generator_10_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_10_0074 := by
  native_decide

/-- Coefficient term 75 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNYN_coefficient_10_0075 : Poly :=
[
  term ((-78506701 : Rat) / 12247399) [(5, 1), (13, 1)]
]

/-- Partial product 75 for generator 10. -/
def rs_R009_ueqv_R009NNNYN_partial_10_0075 : Poly :=
[
  term ((-157013402 : Rat) / 12247399) [(2, 1), (4, 1), (5, 1), (13, 1)],
  term ((-157013402 : Rat) / 12247399) [(3, 1), (5, 2), (13, 1)],
  term ((78506701 : Rat) / 12247399) [(4, 2), (5, 1), (13, 1)],
  term ((78506701 : Rat) / 12247399) [(5, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 75 for generator 10. -/
theorem rs_R009_ueqv_R009NNNYN_partial_10_0075_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_10_0075
        rs_R009_ueqv_R009NNNYN_generator_10_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_10_0075 := by
  native_decide

/-- Coefficient term 76 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNYN_coefficient_10_0076 : Poly :=
[
  term ((75518940 : Rat) / 12247399) [(5, 1), (13, 1), (14, 1)]
]

/-- Partial product 76 for generator 10. -/
def rs_R009_ueqv_R009NNNYN_partial_10_0076 : Poly :=
[
  term ((151037880 : Rat) / 12247399) [(2, 1), (4, 1), (5, 1), (13, 1), (14, 1)],
  term ((151037880 : Rat) / 12247399) [(3, 1), (5, 2), (13, 1), (14, 1)],
  term ((-75518940 : Rat) / 12247399) [(4, 2), (5, 1), (13, 1), (14, 1)],
  term ((-75518940 : Rat) / 12247399) [(5, 3), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 76 for generator 10. -/
theorem rs_R009_ueqv_R009NNNYN_partial_10_0076_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_10_0076
        rs_R009_ueqv_R009NNNYN_generator_10_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_10_0076 := by
  native_decide

/-- Coefficient term 77 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNYN_coefficient_10_0077 : Poly :=
[
  term ((685440 : Rat) / 12247399) [(5, 1), (13, 1), (15, 2)]
]

/-- Partial product 77 for generator 10. -/
def rs_R009_ueqv_R009NNNYN_partial_10_0077 : Poly :=
[
  term ((1370880 : Rat) / 12247399) [(2, 1), (4, 1), (5, 1), (13, 1), (15, 2)],
  term ((1370880 : Rat) / 12247399) [(3, 1), (5, 2), (13, 1), (15, 2)],
  term ((-685440 : Rat) / 12247399) [(4, 2), (5, 1), (13, 1), (15, 2)],
  term ((-685440 : Rat) / 12247399) [(5, 3), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 77 for generator 10. -/
theorem rs_R009_ueqv_R009NNNYN_partial_10_0077_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_10_0077
        rs_R009_ueqv_R009NNNYN_generator_10_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_10_0077 := by
  native_decide

/-- Coefficient term 78 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNYN_coefficient_10_0078 : Poly :=
[
  term ((-1452840560 : Rat) / 110226591) [(5, 1), (14, 1), (15, 1)]
]

/-- Partial product 78 for generator 10. -/
def rs_R009_ueqv_R009NNNYN_partial_10_0078 : Poly :=
[
  term ((-2905681120 : Rat) / 110226591) [(2, 1), (4, 1), (5, 1), (14, 1), (15, 1)],
  term ((-2905681120 : Rat) / 110226591) [(3, 1), (5, 2), (14, 1), (15, 1)],
  term ((1452840560 : Rat) / 110226591) [(4, 2), (5, 1), (14, 1), (15, 1)],
  term ((1452840560 : Rat) / 110226591) [(5, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 78 for generator 10. -/
theorem rs_R009_ueqv_R009NNNYN_partial_10_0078_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_10_0078
        rs_R009_ueqv_R009NNNYN_generator_10_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_10_0078 := by
  native_decide

/-- Coefficient term 79 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNYN_coefficient_10_0079 : Poly :=
[
  term ((4259504627 : Rat) / 330679773) [(5, 1), (15, 1)]
]

/-- Partial product 79 for generator 10. -/
def rs_R009_ueqv_R009NNNYN_partial_10_0079 : Poly :=
[
  term ((8519009254 : Rat) / 330679773) [(2, 1), (4, 1), (5, 1), (15, 1)],
  term ((8519009254 : Rat) / 330679773) [(3, 1), (5, 2), (15, 1)],
  term ((-4259504627 : Rat) / 330679773) [(4, 2), (5, 1), (15, 1)],
  term ((-4259504627 : Rat) / 330679773) [(5, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 79 for generator 10. -/
theorem rs_R009_ueqv_R009NNNYN_partial_10_0079_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_10_0079
        rs_R009_ueqv_R009NNNYN_generator_10_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_10_0079 := by
  native_decide

/-- Coefficient term 80 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNYN_coefficient_10_0080 : Poly :=
[
  term ((-4395520 : Rat) / 36742197) [(5, 1), (15, 3)]
]

/-- Partial product 80 for generator 10. -/
def rs_R009_ueqv_R009NNNYN_partial_10_0080 : Poly :=
[
  term ((-8791040 : Rat) / 36742197) [(2, 1), (4, 1), (5, 1), (15, 3)],
  term ((-8791040 : Rat) / 36742197) [(3, 1), (5, 2), (15, 3)],
  term ((4395520 : Rat) / 36742197) [(4, 2), (5, 1), (15, 3)],
  term ((4395520 : Rat) / 36742197) [(5, 3), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 80 for generator 10. -/
theorem rs_R009_ueqv_R009NNNYN_partial_10_0080_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_10_0080
        rs_R009_ueqv_R009NNNYN_generator_10_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_10_0080 := by
  native_decide

/-- Coefficient term 81 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNYN_coefficient_10_0081 : Poly :=
[
  term ((345 : Rat) / 134) [(7, 1), (9, 1)]
]

/-- Partial product 81 for generator 10. -/
def rs_R009_ueqv_R009NNNYN_partial_10_0081 : Poly :=
[
  term ((345 : Rat) / 67) [(2, 1), (4, 1), (7, 1), (9, 1)],
  term ((345 : Rat) / 67) [(3, 1), (5, 1), (7, 1), (9, 1)],
  term ((-345 : Rat) / 134) [(4, 2), (7, 1), (9, 1)],
  term ((-345 : Rat) / 134) [(5, 2), (7, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 81 for generator 10. -/
theorem rs_R009_ueqv_R009NNNYN_partial_10_0081_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_10_0081
        rs_R009_ueqv_R009NNNYN_generator_10_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_10_0081 := by
  native_decide

/-- Coefficient term 82 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNYN_coefficient_10_0082 : Poly :=
[
  term ((2192956060288 : Rat) / 157072892175) [(7, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 82 for generator 10. -/
def rs_R009_ueqv_R009NNNYN_partial_10_0082 : Poly :=
[
  term ((4385912120576 : Rat) / 157072892175) [(2, 1), (4, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((4385912120576 : Rat) / 157072892175) [(3, 1), (5, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-2192956060288 : Rat) / 157072892175) [(4, 2), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-2192956060288 : Rat) / 157072892175) [(5, 2), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 82 for generator 10. -/
theorem rs_R009_ueqv_R009NNNYN_partial_10_0082_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_10_0082
        rs_R009_ueqv_R009NNNYN_generator_10_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_10_0082 := by
  native_decide

/-- Coefficient term 83 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNYN_coefficient_10_0083 : Poly :=
[
  term ((34264938442 : Rat) / 5817514525) [(7, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 83 for generator 10. -/
def rs_R009_ueqv_R009NNNYN_partial_10_0083 : Poly :=
[
  term ((68529876884 : Rat) / 5817514525) [(2, 1), (4, 1), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((68529876884 : Rat) / 5817514525) [(3, 1), (5, 1), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-34264938442 : Rat) / 5817514525) [(4, 2), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-34264938442 : Rat) / 5817514525) [(5, 2), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 83 for generator 10. -/
theorem rs_R009_ueqv_R009NNNYN_partial_10_0083_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_10_0083
        rs_R009_ueqv_R009NNNYN_generator_10_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_10_0083 := by
  native_decide

/-- Coefficient term 84 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNYN_coefficient_10_0084 : Poly :=
[
  term ((-2394874578674 : Rat) / 157072892175) [(7, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 84 for generator 10. -/
def rs_R009_ueqv_R009NNNYN_partial_10_0084 : Poly :=
[
  term ((-4789749157348 : Rat) / 157072892175) [(2, 1), (4, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((-4789749157348 : Rat) / 157072892175) [(3, 1), (5, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((2394874578674 : Rat) / 157072892175) [(4, 2), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((2394874578674 : Rat) / 157072892175) [(5, 2), (7, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 84 for generator 10. -/
theorem rs_R009_ueqv_R009NNNYN_partial_10_0084_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_10_0084
        rs_R009_ueqv_R009NNNYN_generator_10_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_10_0084 := by
  native_decide

/-- Coefficient term 85 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNYN_coefficient_10_0085 : Poly :=
[
  term ((641398435328 : Rat) / 31414578435) [(7, 1), (10, 1), (11, 1)]
]

/-- Partial product 85 for generator 10. -/
def rs_R009_ueqv_R009NNNYN_partial_10_0085 : Poly :=
[
  term ((1282796870656 : Rat) / 31414578435) [(2, 1), (4, 1), (7, 1), (10, 1), (11, 1)],
  term ((1282796870656 : Rat) / 31414578435) [(3, 1), (5, 1), (7, 1), (10, 1), (11, 1)],
  term ((-641398435328 : Rat) / 31414578435) [(4, 2), (7, 1), (10, 1), (11, 1)],
  term ((-641398435328 : Rat) / 31414578435) [(5, 2), (7, 1), (10, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 85 for generator 10. -/
theorem rs_R009_ueqv_R009NNNYN_partial_10_0085_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_10_0085
        rs_R009_ueqv_R009NNNYN_generator_10_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_10_0085 := by
  native_decide

/-- Coefficient term 86 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNYN_coefficient_10_0086 : Poly :=
[
  term ((10021850552 : Rat) / 1163502905) [(7, 1), (10, 1), (13, 1)]
]

/-- Partial product 86 for generator 10. -/
def rs_R009_ueqv_R009NNNYN_partial_10_0086 : Poly :=
[
  term ((20043701104 : Rat) / 1163502905) [(2, 1), (4, 1), (7, 1), (10, 1), (13, 1)],
  term ((20043701104 : Rat) / 1163502905) [(3, 1), (5, 1), (7, 1), (10, 1), (13, 1)],
  term ((-10021850552 : Rat) / 1163502905) [(4, 2), (7, 1), (10, 1), (13, 1)],
  term ((-10021850552 : Rat) / 1163502905) [(5, 2), (7, 1), (10, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 86 for generator 10. -/
theorem rs_R009_ueqv_R009NNNYN_partial_10_0086_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_10_0086
        rs_R009_ueqv_R009NNNYN_generator_10_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_10_0086 := by
  native_decide

/-- Coefficient term 87 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNYN_coefficient_10_0087 : Poly :=
[
  term ((-578403946144 : Rat) / 31414578435) [(7, 1), (10, 1), (15, 1)]
]

/-- Partial product 87 for generator 10. -/
def rs_R009_ueqv_R009NNNYN_partial_10_0087 : Poly :=
[
  term ((-1156807892288 : Rat) / 31414578435) [(2, 1), (4, 1), (7, 1), (10, 1), (15, 1)],
  term ((-1156807892288 : Rat) / 31414578435) [(3, 1), (5, 1), (7, 1), (10, 1), (15, 1)],
  term ((578403946144 : Rat) / 31414578435) [(4, 2), (7, 1), (10, 1), (15, 1)],
  term ((578403946144 : Rat) / 31414578435) [(5, 2), (7, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 87 for generator 10. -/
theorem rs_R009_ueqv_R009NNNYN_partial_10_0087_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_10_0087
        rs_R009_ueqv_R009NNNYN_generator_10_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_10_0087 := by
  native_decide

/-- Coefficient term 88 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNYN_coefficient_10_0088 : Poly :=
[
  term ((21885192743384 : Rat) / 471218676525) [(7, 1), (11, 1)]
]

/-- Partial product 88 for generator 10. -/
def rs_R009_ueqv_R009NNNYN_partial_10_0088 : Poly :=
[
  term ((43770385486768 : Rat) / 471218676525) [(2, 1), (4, 1), (7, 1), (11, 1)],
  term ((43770385486768 : Rat) / 471218676525) [(3, 1), (5, 1), (7, 1), (11, 1)],
  term ((-21885192743384 : Rat) / 471218676525) [(4, 2), (7, 1), (11, 1)],
  term ((-21885192743384 : Rat) / 471218676525) [(5, 2), (7, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 88 for generator 10. -/
theorem rs_R009_ueqv_R009NNNYN_partial_10_0088_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_10_0088
        rs_R009_ueqv_R009NNNYN_generator_10_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_10_0088 := by
  native_decide

/-- Coefficient term 89 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNYN_coefficient_10_0089 : Poly :=
[
  term ((-12890872064 : Rat) / 330679773) [(7, 1), (11, 1), (12, 1)]
]

/-- Partial product 89 for generator 10. -/
def rs_R009_ueqv_R009NNNYN_partial_10_0089 : Poly :=
[
  term ((-25781744128 : Rat) / 330679773) [(2, 1), (4, 1), (7, 1), (11, 1), (12, 1)],
  term ((-25781744128 : Rat) / 330679773) [(3, 1), (5, 1), (7, 1), (11, 1), (12, 1)],
  term ((12890872064 : Rat) / 330679773) [(4, 2), (7, 1), (11, 1), (12, 1)],
  term ((12890872064 : Rat) / 330679773) [(5, 2), (7, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 89 for generator 10. -/
theorem rs_R009_ueqv_R009NNNYN_partial_10_0089_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_10_0089
        rs_R009_ueqv_R009NNNYN_generator_10_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_10_0089 := by
  native_decide

/-- Coefficient term 90 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNYN_coefficient_10_0090 : Poly :=
[
  term ((26199040 : Rat) / 110226591) [(7, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 90 for generator 10. -/
def rs_R009_ueqv_R009NNNYN_partial_10_0090 : Poly :=
[
  term ((52398080 : Rat) / 110226591) [(2, 1), (4, 1), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((52398080 : Rat) / 110226591) [(3, 1), (5, 1), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((-26199040 : Rat) / 110226591) [(4, 2), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((-26199040 : Rat) / 110226591) [(5, 2), (7, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 90 for generator 10. -/
theorem rs_R009_ueqv_R009NNNYN_partial_10_0090_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_10_0090
        rs_R009_ueqv_R009NNNYN_generator_10_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_10_0090 := by
  native_decide

/-- Coefficient term 91 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNYN_coefficient_10_0091 : Poly :=
[
  term ((-277956224 : Rat) / 6239241) [(7, 1), (11, 1), (14, 1)]
]

/-- Partial product 91 for generator 10. -/
def rs_R009_ueqv_R009NNNYN_partial_10_0091 : Poly :=
[
  term ((-555912448 : Rat) / 6239241) [(2, 1), (4, 1), (7, 1), (11, 1), (14, 1)],
  term ((-555912448 : Rat) / 6239241) [(3, 1), (5, 1), (7, 1), (11, 1), (14, 1)],
  term ((277956224 : Rat) / 6239241) [(4, 2), (7, 1), (11, 1), (14, 1)],
  term ((277956224 : Rat) / 6239241) [(5, 2), (7, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 91 for generator 10. -/
theorem rs_R009_ueqv_R009NNNYN_partial_10_0091_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_10_0091
        rs_R009_ueqv_R009NNNYN_generator_10_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_10_0091 := by
  native_decide

/-- Coefficient term 92 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNYN_coefficient_10_0092 : Poly :=
[
  term ((11141120 : Rat) / 110226591) [(7, 1), (11, 1), (15, 2)]
]

/-- Partial product 92 for generator 10. -/
def rs_R009_ueqv_R009NNNYN_partial_10_0092 : Poly :=
[
  term ((22282240 : Rat) / 110226591) [(2, 1), (4, 1), (7, 1), (11, 1), (15, 2)],
  term ((22282240 : Rat) / 110226591) [(3, 1), (5, 1), (7, 1), (11, 1), (15, 2)],
  term ((-11141120 : Rat) / 110226591) [(4, 2), (7, 1), (11, 1), (15, 2)],
  term ((-11141120 : Rat) / 110226591) [(5, 2), (7, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 92 for generator 10. -/
theorem rs_R009_ueqv_R009NNNYN_partial_10_0092_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_10_0092
        rs_R009_ueqv_R009NNNYN_generator_10_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_10_0092 := by
  native_decide

/-- Coefficient term 93 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNYN_coefficient_10_0093 : Poly :=
[
  term ((38993920 : Rat) / 110226591) [(7, 1), (11, 2), (15, 1)]
]

/-- Partial product 93 for generator 10. -/
def rs_R009_ueqv_R009NNNYN_partial_10_0093 : Poly :=
[
  term ((77987840 : Rat) / 110226591) [(2, 1), (4, 1), (7, 1), (11, 2), (15, 1)],
  term ((77987840 : Rat) / 110226591) [(3, 1), (5, 1), (7, 1), (11, 2), (15, 1)],
  term ((-38993920 : Rat) / 110226591) [(4, 2), (7, 1), (11, 2), (15, 1)],
  term ((-38993920 : Rat) / 110226591) [(5, 2), (7, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 93 for generator 10. -/
theorem rs_R009_ueqv_R009NNNYN_partial_10_0093_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_10_0093
        rs_R009_ueqv_R009NNNYN_generator_10_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_10_0093 := by
  native_decide

/-- Coefficient term 94 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNYN_coefficient_10_0094 : Poly :=
[
  term ((-201419876 : Rat) / 12247399) [(7, 1), (12, 1), (13, 1)]
]

/-- Partial product 94 for generator 10. -/
def rs_R009_ueqv_R009NNNYN_partial_10_0094 : Poly :=
[
  term ((-402839752 : Rat) / 12247399) [(2, 1), (4, 1), (7, 1), (12, 1), (13, 1)],
  term ((-402839752 : Rat) / 12247399) [(3, 1), (5, 1), (7, 1), (12, 1), (13, 1)],
  term ((201419876 : Rat) / 12247399) [(4, 2), (7, 1), (12, 1), (13, 1)],
  term ((201419876 : Rat) / 12247399) [(5, 2), (7, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 94 for generator 10. -/
theorem rs_R009_ueqv_R009NNNYN_partial_10_0094_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_10_0094
        rs_R009_ueqv_R009NNNYN_generator_10_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_10_0094 := by
  native_decide

/-- Coefficient term 95 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNYN_coefficient_10_0095 : Poly :=
[
  term ((11180607562 : Rat) / 330679773) [(7, 1), (12, 1), (15, 1)]
]

/-- Partial product 95 for generator 10. -/
def rs_R009_ueqv_R009NNNYN_partial_10_0095 : Poly :=
[
  term ((22361215124 : Rat) / 330679773) [(2, 1), (4, 1), (7, 1), (12, 1), (15, 1)],
  term ((22361215124 : Rat) / 330679773) [(3, 1), (5, 1), (7, 1), (12, 1), (15, 1)],
  term ((-11180607562 : Rat) / 330679773) [(4, 2), (7, 1), (12, 1), (15, 1)],
  term ((-11180607562 : Rat) / 330679773) [(5, 2), (7, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 95 for generator 10. -/
theorem rs_R009_ueqv_R009NNNYN_partial_10_0095_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_10_0095
        rs_R009_ueqv_R009NNNYN_generator_10_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_10_0095 := by
  native_decide

/-- Coefficient term 96 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNYN_coefficient_10_0096 : Poly :=
[
  term ((1357274874599 : Rat) / 69810174300) [(7, 1), (13, 1)]
]

/-- Partial product 96 for generator 10. -/
def rs_R009_ueqv_R009NNNYN_partial_10_0096 : Poly :=
[
  term ((1357274874599 : Rat) / 34905087150) [(2, 1), (4, 1), (7, 1), (13, 1)],
  term ((1357274874599 : Rat) / 34905087150) [(3, 1), (5, 1), (7, 1), (13, 1)],
  term ((-1357274874599 : Rat) / 69810174300) [(4, 2), (7, 1), (13, 1)],
  term ((-1357274874599 : Rat) / 69810174300) [(5, 2), (7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 96 for generator 10. -/
theorem rs_R009_ueqv_R009NNNYN_partial_10_0096_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_10_0096
        rs_R009_ueqv_R009NNNYN_generator_10_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_10_0096 := by
  native_decide

/-- Coefficient term 97 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNYN_coefficient_10_0097 : Poly :=
[
  term ((-4343066 : Rat) / 231083) [(7, 1), (13, 1), (14, 1)]
]

/-- Partial product 97 for generator 10. -/
def rs_R009_ueqv_R009NNNYN_partial_10_0097 : Poly :=
[
  term ((-8686132 : Rat) / 231083) [(2, 1), (4, 1), (7, 1), (13, 1), (14, 1)],
  term ((-8686132 : Rat) / 231083) [(3, 1), (5, 1), (7, 1), (13, 1), (14, 1)],
  term ((4343066 : Rat) / 231083) [(4, 2), (7, 1), (13, 1), (14, 1)],
  term ((4343066 : Rat) / 231083) [(5, 2), (7, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 97 for generator 10. -/
theorem rs_R009_ueqv_R009NNNYN_partial_10_0097_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_10_0097
        rs_R009_ueqv_R009NNNYN_generator_10_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_10_0097 := by
  native_decide

/-- Coefficient term 98 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNYN_coefficient_10_0098 : Poly :=
[
  term ((10744000 : Rat) / 110226591) [(7, 1), (13, 1), (15, 2)]
]

/-- Partial product 98 for generator 10. -/
def rs_R009_ueqv_R009NNNYN_partial_10_0098 : Poly :=
[
  term ((21488000 : Rat) / 110226591) [(2, 1), (4, 1), (7, 1), (13, 1), (15, 2)],
  term ((21488000 : Rat) / 110226591) [(3, 1), (5, 1), (7, 1), (13, 1), (15, 2)],
  term ((-10744000 : Rat) / 110226591) [(4, 2), (7, 1), (13, 1), (15, 2)],
  term ((-10744000 : Rat) / 110226591) [(5, 2), (7, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 98 for generator 10. -/
theorem rs_R009_ueqv_R009NNNYN_partial_10_0098_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_10_0098
        rs_R009_ueqv_R009NNNYN_generator_10_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_10_0098 := by
  native_decide

/-- Coefficient term 99 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009NNNYN_coefficient_10_0099 : Poly :=
[
  term ((456960 : Rat) / 12247399) [(7, 1), (13, 2), (15, 1)]
]

/-- Partial product 99 for generator 10. -/
def rs_R009_ueqv_R009NNNYN_partial_10_0099 : Poly :=
[
  term ((913920 : Rat) / 12247399) [(2, 1), (4, 1), (7, 1), (13, 2), (15, 1)],
  term ((913920 : Rat) / 12247399) [(3, 1), (5, 1), (7, 1), (13, 2), (15, 1)],
  term ((-456960 : Rat) / 12247399) [(4, 2), (7, 1), (13, 2), (15, 1)],
  term ((-456960 : Rat) / 12247399) [(5, 2), (7, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 99 for generator 10. -/
theorem rs_R009_ueqv_R009NNNYN_partial_10_0099_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_10_0099
        rs_R009_ueqv_R009NNNYN_generator_10_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_10_0099 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NNNYN_partials_10_0000_0099 : List Poly :=
[
  rs_R009_ueqv_R009NNNYN_partial_10_0000,
  rs_R009_ueqv_R009NNNYN_partial_10_0001,
  rs_R009_ueqv_R009NNNYN_partial_10_0002,
  rs_R009_ueqv_R009NNNYN_partial_10_0003,
  rs_R009_ueqv_R009NNNYN_partial_10_0004,
  rs_R009_ueqv_R009NNNYN_partial_10_0005,
  rs_R009_ueqv_R009NNNYN_partial_10_0006,
  rs_R009_ueqv_R009NNNYN_partial_10_0007,
  rs_R009_ueqv_R009NNNYN_partial_10_0008,
  rs_R009_ueqv_R009NNNYN_partial_10_0009,
  rs_R009_ueqv_R009NNNYN_partial_10_0010,
  rs_R009_ueqv_R009NNNYN_partial_10_0011,
  rs_R009_ueqv_R009NNNYN_partial_10_0012,
  rs_R009_ueqv_R009NNNYN_partial_10_0013,
  rs_R009_ueqv_R009NNNYN_partial_10_0014,
  rs_R009_ueqv_R009NNNYN_partial_10_0015,
  rs_R009_ueqv_R009NNNYN_partial_10_0016,
  rs_R009_ueqv_R009NNNYN_partial_10_0017,
  rs_R009_ueqv_R009NNNYN_partial_10_0018,
  rs_R009_ueqv_R009NNNYN_partial_10_0019,
  rs_R009_ueqv_R009NNNYN_partial_10_0020,
  rs_R009_ueqv_R009NNNYN_partial_10_0021,
  rs_R009_ueqv_R009NNNYN_partial_10_0022,
  rs_R009_ueqv_R009NNNYN_partial_10_0023,
  rs_R009_ueqv_R009NNNYN_partial_10_0024,
  rs_R009_ueqv_R009NNNYN_partial_10_0025,
  rs_R009_ueqv_R009NNNYN_partial_10_0026,
  rs_R009_ueqv_R009NNNYN_partial_10_0027,
  rs_R009_ueqv_R009NNNYN_partial_10_0028,
  rs_R009_ueqv_R009NNNYN_partial_10_0029,
  rs_R009_ueqv_R009NNNYN_partial_10_0030,
  rs_R009_ueqv_R009NNNYN_partial_10_0031,
  rs_R009_ueqv_R009NNNYN_partial_10_0032,
  rs_R009_ueqv_R009NNNYN_partial_10_0033,
  rs_R009_ueqv_R009NNNYN_partial_10_0034,
  rs_R009_ueqv_R009NNNYN_partial_10_0035,
  rs_R009_ueqv_R009NNNYN_partial_10_0036,
  rs_R009_ueqv_R009NNNYN_partial_10_0037,
  rs_R009_ueqv_R009NNNYN_partial_10_0038,
  rs_R009_ueqv_R009NNNYN_partial_10_0039,
  rs_R009_ueqv_R009NNNYN_partial_10_0040,
  rs_R009_ueqv_R009NNNYN_partial_10_0041,
  rs_R009_ueqv_R009NNNYN_partial_10_0042,
  rs_R009_ueqv_R009NNNYN_partial_10_0043,
  rs_R009_ueqv_R009NNNYN_partial_10_0044,
  rs_R009_ueqv_R009NNNYN_partial_10_0045,
  rs_R009_ueqv_R009NNNYN_partial_10_0046,
  rs_R009_ueqv_R009NNNYN_partial_10_0047,
  rs_R009_ueqv_R009NNNYN_partial_10_0048,
  rs_R009_ueqv_R009NNNYN_partial_10_0049,
  rs_R009_ueqv_R009NNNYN_partial_10_0050,
  rs_R009_ueqv_R009NNNYN_partial_10_0051,
  rs_R009_ueqv_R009NNNYN_partial_10_0052,
  rs_R009_ueqv_R009NNNYN_partial_10_0053,
  rs_R009_ueqv_R009NNNYN_partial_10_0054,
  rs_R009_ueqv_R009NNNYN_partial_10_0055,
  rs_R009_ueqv_R009NNNYN_partial_10_0056,
  rs_R009_ueqv_R009NNNYN_partial_10_0057,
  rs_R009_ueqv_R009NNNYN_partial_10_0058,
  rs_R009_ueqv_R009NNNYN_partial_10_0059,
  rs_R009_ueqv_R009NNNYN_partial_10_0060,
  rs_R009_ueqv_R009NNNYN_partial_10_0061,
  rs_R009_ueqv_R009NNNYN_partial_10_0062,
  rs_R009_ueqv_R009NNNYN_partial_10_0063,
  rs_R009_ueqv_R009NNNYN_partial_10_0064,
  rs_R009_ueqv_R009NNNYN_partial_10_0065,
  rs_R009_ueqv_R009NNNYN_partial_10_0066,
  rs_R009_ueqv_R009NNNYN_partial_10_0067,
  rs_R009_ueqv_R009NNNYN_partial_10_0068,
  rs_R009_ueqv_R009NNNYN_partial_10_0069,
  rs_R009_ueqv_R009NNNYN_partial_10_0070,
  rs_R009_ueqv_R009NNNYN_partial_10_0071,
  rs_R009_ueqv_R009NNNYN_partial_10_0072,
  rs_R009_ueqv_R009NNNYN_partial_10_0073,
  rs_R009_ueqv_R009NNNYN_partial_10_0074,
  rs_R009_ueqv_R009NNNYN_partial_10_0075,
  rs_R009_ueqv_R009NNNYN_partial_10_0076,
  rs_R009_ueqv_R009NNNYN_partial_10_0077,
  rs_R009_ueqv_R009NNNYN_partial_10_0078,
  rs_R009_ueqv_R009NNNYN_partial_10_0079,
  rs_R009_ueqv_R009NNNYN_partial_10_0080,
  rs_R009_ueqv_R009NNNYN_partial_10_0081,
  rs_R009_ueqv_R009NNNYN_partial_10_0082,
  rs_R009_ueqv_R009NNNYN_partial_10_0083,
  rs_R009_ueqv_R009NNNYN_partial_10_0084,
  rs_R009_ueqv_R009NNNYN_partial_10_0085,
  rs_R009_ueqv_R009NNNYN_partial_10_0086,
  rs_R009_ueqv_R009NNNYN_partial_10_0087,
  rs_R009_ueqv_R009NNNYN_partial_10_0088,
  rs_R009_ueqv_R009NNNYN_partial_10_0089,
  rs_R009_ueqv_R009NNNYN_partial_10_0090,
  rs_R009_ueqv_R009NNNYN_partial_10_0091,
  rs_R009_ueqv_R009NNNYN_partial_10_0092,
  rs_R009_ueqv_R009NNNYN_partial_10_0093,
  rs_R009_ueqv_R009NNNYN_partial_10_0094,
  rs_R009_ueqv_R009NNNYN_partial_10_0095,
  rs_R009_ueqv_R009NNNYN_partial_10_0096,
  rs_R009_ueqv_R009NNNYN_partial_10_0097,
  rs_R009_ueqv_R009NNNYN_partial_10_0098,
  rs_R009_ueqv_R009NNNYN_partial_10_0099
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NNNYN_block_10_0000_0099 : Poly :=
[
  term ((747765760 : Rat) / 110226591) [(0, 1), (2, 1), (3, 1), (4, 1), (11, 1)],
  term ((35051520 : Rat) / 12247399) [(0, 1), (2, 1), (3, 1), (4, 1), (13, 1)],
  term ((-674324480 : Rat) / 110226591) [(0, 1), (2, 1), (3, 1), (4, 1), (15, 1)],
  term ((-3872167936 : Rat) / 110226591) [(0, 1), (2, 1), (4, 1), (5, 1), (11, 1)],
  term ((-181507872 : Rat) / 12247399) [(0, 1), (2, 1), (4, 1), (5, 1), (13, 1)],
  term ((3491865728 : Rat) / 110226591) [(0, 1), (2, 1), (4, 1), (5, 1), (15, 1)],
  term ((5617920 : Rat) / 231083) [(0, 1), (2, 1), (4, 1), (7, 1), (11, 1)],
  term ((2370060 : Rat) / 231083) [(0, 1), (2, 1), (4, 1), (7, 1), (13, 1)],
  term ((-5066160 : Rat) / 231083) [(0, 1), (2, 1), (4, 1), (7, 1), (15, 1)],
  term ((-666876672 : Rat) / 12247399) [(0, 1), (2, 1), (4, 1), (9, 1), (11, 1)],
  term ((-281338596 : Rat) / 12247399) [(0, 1), (2, 1), (4, 1), (9, 1), (13, 1)],
  term ((601379856 : Rat) / 12247399) [(0, 1), (2, 1), (4, 1), (9, 1), (15, 1)],
  term ((8219810816 : Rat) / 110226591) [(0, 1), (2, 1), (4, 1), (11, 1), (13, 1)],
  term ((-17326323200 : Rat) / 330679773) [(0, 1), (2, 1), (4, 1), (11, 1), (15, 1)],
  term ((77987840 : Rat) / 110226591) [(0, 1), (2, 1), (4, 1), (11, 2)],
  term ((-9789682648 : Rat) / 110226591) [(0, 1), (2, 1), (4, 1), (13, 1), (15, 1)],
  term ((383761392 : Rat) / 12247399) [(0, 1), (2, 1), (4, 1), (13, 2)],
  term ((15434367520 : Rat) / 330679773) [(0, 1), (2, 1), (4, 1), (15, 2)],
  term ((-373882880 : Rat) / 110226591) [(0, 1), (3, 1), (4, 2), (11, 1)],
  term ((-17525760 : Rat) / 12247399) [(0, 1), (3, 1), (4, 2), (13, 1)],
  term ((337162240 : Rat) / 110226591) [(0, 1), (3, 1), (4, 2), (15, 1)],
  term ((5617920 : Rat) / 231083) [(0, 1), (3, 1), (5, 1), (7, 1), (11, 1)],
  term ((2370060 : Rat) / 231083) [(0, 1), (3, 1), (5, 1), (7, 1), (13, 1)],
  term ((-5066160 : Rat) / 231083) [(0, 1), (3, 1), (5, 1), (7, 1), (15, 1)],
  term ((-666876672 : Rat) / 12247399) [(0, 1), (3, 1), (5, 1), (9, 1), (11, 1)],
  term ((-281338596 : Rat) / 12247399) [(0, 1), (3, 1), (5, 1), (9, 1), (13, 1)],
  term ((601379856 : Rat) / 12247399) [(0, 1), (3, 1), (5, 1), (9, 1), (15, 1)],
  term ((8219810816 : Rat) / 110226591) [(0, 1), (3, 1), (5, 1), (11, 1), (13, 1)],
  term ((-17326323200 : Rat) / 330679773) [(0, 1), (3, 1), (5, 1), (11, 1), (15, 1)],
  term ((77987840 : Rat) / 110226591) [(0, 1), (3, 1), (5, 1), (11, 2)],
  term ((-9789682648 : Rat) / 110226591) [(0, 1), (3, 1), (5, 1), (13, 1), (15, 1)],
  term ((383761392 : Rat) / 12247399) [(0, 1), (3, 1), (5, 1), (13, 2)],
  term ((15434367520 : Rat) / 330679773) [(0, 1), (3, 1), (5, 1), (15, 2)],
  term ((-471783424 : Rat) / 12247399) [(0, 1), (3, 1), (5, 2), (11, 1)],
  term ((-199033632 : Rat) / 12247399) [(0, 1), (3, 1), (5, 2), (13, 1)],
  term ((425447552 : Rat) / 12247399) [(0, 1), (3, 1), (5, 2), (15, 1)],
  term ((747765760 : Rat) / 110226591) [(0, 1), (3, 2), (5, 1), (11, 1)],
  term ((35051520 : Rat) / 12247399) [(0, 1), (3, 2), (5, 1), (13, 1)],
  term ((-674324480 : Rat) / 110226591) [(0, 1), (3, 2), (5, 1), (15, 1)],
  term ((1936083968 : Rat) / 110226591) [(0, 1), (4, 2), (5, 1), (11, 1)],
  term ((90753936 : Rat) / 12247399) [(0, 1), (4, 2), (5, 1), (13, 1)],
  term ((-1745932864 : Rat) / 110226591) [(0, 1), (4, 2), (5, 1), (15, 1)],
  term ((-2808960 : Rat) / 231083) [(0, 1), (4, 2), (7, 1), (11, 1)],
  term ((-1185030 : Rat) / 231083) [(0, 1), (4, 2), (7, 1), (13, 1)],
  term ((2533080 : Rat) / 231083) [(0, 1), (4, 2), (7, 1), (15, 1)],
  term ((333438336 : Rat) / 12247399) [(0, 1), (4, 2), (9, 1), (11, 1)],
  term ((140669298 : Rat) / 12247399) [(0, 1), (4, 2), (9, 1), (13, 1)],
  term ((-300689928 : Rat) / 12247399) [(0, 1), (4, 2), (9, 1), (15, 1)],
  term ((-4109905408 : Rat) / 110226591) [(0, 1), (4, 2), (11, 1), (13, 1)],
  term ((8663161600 : Rat) / 330679773) [(0, 1), (4, 2), (11, 1), (15, 1)],
  term ((-38993920 : Rat) / 110226591) [(0, 1), (4, 2), (11, 2)],
  term ((4894841324 : Rat) / 110226591) [(0, 1), (4, 2), (13, 1), (15, 1)],
  term ((-191880696 : Rat) / 12247399) [(0, 1), (4, 2), (13, 2)],
  term ((-7717183760 : Rat) / 330679773) [(0, 1), (4, 2), (15, 2)],
  term ((-2808960 : Rat) / 231083) [(0, 1), (5, 2), (7, 1), (11, 1)],
  term ((-1185030 : Rat) / 231083) [(0, 1), (5, 2), (7, 1), (13, 1)],
  term ((2533080 : Rat) / 231083) [(0, 1), (5, 2), (7, 1), (15, 1)],
  term ((333438336 : Rat) / 12247399) [(0, 1), (5, 2), (9, 1), (11, 1)],
  term ((140669298 : Rat) / 12247399) [(0, 1), (5, 2), (9, 1), (13, 1)],
  term ((-300689928 : Rat) / 12247399) [(0, 1), (5, 2), (9, 1), (15, 1)],
  term ((-4109905408 : Rat) / 110226591) [(0, 1), (5, 2), (11, 1), (13, 1)],
  term ((8663161600 : Rat) / 330679773) [(0, 1), (5, 2), (11, 1), (15, 1)],
  term ((-38993920 : Rat) / 110226591) [(0, 1), (5, 2), (11, 2)],
  term ((4894841324 : Rat) / 110226591) [(0, 1), (5, 2), (13, 1), (15, 1)],
  term ((-191880696 : Rat) / 12247399) [(0, 1), (5, 2), (13, 2)],
  term ((-7717183760 : Rat) / 330679773) [(0, 1), (5, 2), (15, 2)],
  term ((1936083968 : Rat) / 110226591) [(0, 1), (5, 3), (11, 1)],
  term ((90753936 : Rat) / 12247399) [(0, 1), (5, 3), (13, 1)],
  term ((-1745932864 : Rat) / 110226591) [(0, 1), (5, 3), (15, 1)],
  term ((-588 : Rat) / 67) [(1, 1), (2, 1), (4, 1), (9, 1)],
  term ((-2580411430912 : Rat) / 31414578435) [(1, 1), (2, 1), (4, 1), (10, 1), (11, 1)],
  term ((-40318928608 : Rat) / 1163502905) [(1, 1), (2, 1), (4, 1), (10, 1), (13, 1)],
  term ((2326978165376 : Rat) / 31414578435) [(1, 1), (2, 1), (4, 1), (10, 1), (15, 1)],
  term ((-6862687389376 : Rat) / 94243735305) [(1, 1), (2, 1), (4, 1), (11, 1)],
  term ((18448059392 : Rat) / 110226591) [(1, 1), (2, 1), (4, 1), (11, 1), (12, 1)],
  term ((-38993920 : Rat) / 110226591) [(1, 1), (2, 1), (4, 1), (11, 1), (13, 1), (15, 1)],
  term ((12298915328 : Rat) / 330679773) [(1, 1), (2, 1), (4, 1), (11, 1), (14, 1)],
  term ((-253460480 : Rat) / 110226591) [(1, 1), (2, 1), (4, 1), (11, 1), (15, 2)],
  term ((864752784 : Rat) / 12247399) [(1, 1), (2, 1), (4, 1), (12, 1), (13, 1)],
  term ((-16162386592 : Rat) / 110226591) [(1, 1), (2, 1), (4, 1), (12, 1), (15, 1)],
  term ((-107229490459 : Rat) / 3490508715) [(1, 1), (2, 1), (4, 1), (13, 1)],
  term ((192170552 : Rat) / 12247399) [(1, 1), (2, 1), (4, 1), (13, 1), (14, 1)],
  term ((-71764480 : Rat) / 110226591) [(1, 1), (2, 1), (4, 1), (13, 1), (15, 2)],
  term ((-1827840 : Rat) / 12247399) [(1, 1), (2, 1), (4, 1), (13, 2), (15, 1)],
  term ((-11090986144 : Rat) / 330679773) [(1, 1), (2, 1), (4, 1), (14, 1), (15, 1)],
  term ((5912975358008 : Rat) / 94243735305) [(1, 1), (2, 1), (4, 1), (15, 1)],
  term ((228567040 : Rat) / 110226591) [(1, 1), (2, 1), (4, 1), (15, 3)],
  term ((-588 : Rat) / 67) [(1, 1), (3, 1), (5, 1), (9, 1)],
  term ((-2580411430912 : Rat) / 31414578435) [(1, 1), (3, 1), (5, 1), (10, 1), (11, 1)],
  term ((-40318928608 : Rat) / 1163502905) [(1, 1), (3, 1), (5, 1), (10, 1), (13, 1)],
  term ((2326978165376 : Rat) / 31414578435) [(1, 1), (3, 1), (5, 1), (10, 1), (15, 1)],
  term ((-6862687389376 : Rat) / 94243735305) [(1, 1), (3, 1), (5, 1), (11, 1)],
  term ((18448059392 : Rat) / 110226591) [(1, 1), (3, 1), (5, 1), (11, 1), (12, 1)],
  term ((-38993920 : Rat) / 110226591) [(1, 1), (3, 1), (5, 1), (11, 1), (13, 1), (15, 1)],
  term ((12298915328 : Rat) / 330679773) [(1, 1), (3, 1), (5, 1), (11, 1), (14, 1)],
  term ((-253460480 : Rat) / 110226591) [(1, 1), (3, 1), (5, 1), (11, 1), (15, 2)],
  term ((864752784 : Rat) / 12247399) [(1, 1), (3, 1), (5, 1), (12, 1), (13, 1)],
  term ((-16162386592 : Rat) / 110226591) [(1, 1), (3, 1), (5, 1), (12, 1), (15, 1)],
  term ((-107229490459 : Rat) / 3490508715) [(1, 1), (3, 1), (5, 1), (13, 1)],
  term ((192170552 : Rat) / 12247399) [(1, 1), (3, 1), (5, 1), (13, 1), (14, 1)],
  term ((-71764480 : Rat) / 110226591) [(1, 1), (3, 1), (5, 1), (13, 1), (15, 2)],
  term ((-1827840 : Rat) / 12247399) [(1, 1), (3, 1), (5, 1), (13, 2), (15, 1)],
  term ((-11090986144 : Rat) / 330679773) [(1, 1), (3, 1), (5, 1), (14, 1), (15, 1)],
  term ((5912975358008 : Rat) / 94243735305) [(1, 1), (3, 1), (5, 1), (15, 1)],
  term ((228567040 : Rat) / 110226591) [(1, 1), (3, 1), (5, 1), (15, 3)],
  term ((294 : Rat) / 67) [(1, 1), (4, 2), (9, 1)],
  term ((1290205715456 : Rat) / 31414578435) [(1, 1), (4, 2), (10, 1), (11, 1)],
  term ((20159464304 : Rat) / 1163502905) [(1, 1), (4, 2), (10, 1), (13, 1)],
  term ((-1163489082688 : Rat) / 31414578435) [(1, 1), (4, 2), (10, 1), (15, 1)],
  term ((3431343694688 : Rat) / 94243735305) [(1, 1), (4, 2), (11, 1)],
  term ((-9224029696 : Rat) / 110226591) [(1, 1), (4, 2), (11, 1), (12, 1)],
  term ((19496960 : Rat) / 110226591) [(1, 1), (4, 2), (11, 1), (13, 1), (15, 1)],
  term ((-6149457664 : Rat) / 330679773) [(1, 1), (4, 2), (11, 1), (14, 1)],
  term ((126730240 : Rat) / 110226591) [(1, 1), (4, 2), (11, 1), (15, 2)],
  term ((-432376392 : Rat) / 12247399) [(1, 1), (4, 2), (12, 1), (13, 1)],
  term ((8081193296 : Rat) / 110226591) [(1, 1), (4, 2), (12, 1), (15, 1)],
  term ((107229490459 : Rat) / 6981017430) [(1, 1), (4, 2), (13, 1)],
  term ((-96085276 : Rat) / 12247399) [(1, 1), (4, 2), (13, 1), (14, 1)],
  term ((35882240 : Rat) / 110226591) [(1, 1), (4, 2), (13, 1), (15, 2)],
  term ((913920 : Rat) / 12247399) [(1, 1), (4, 2), (13, 2), (15, 1)],
  term ((5545493072 : Rat) / 330679773) [(1, 1), (4, 2), (14, 1), (15, 1)],
  term ((-2956487679004 : Rat) / 94243735305) [(1, 1), (4, 2), (15, 1)],
  term ((-114283520 : Rat) / 110226591) [(1, 1), (4, 2), (15, 3)],
  term ((294 : Rat) / 67) [(1, 1), (5, 2), (9, 1)],
  term ((1290205715456 : Rat) / 31414578435) [(1, 1), (5, 2), (10, 1), (11, 1)],
  term ((20159464304 : Rat) / 1163502905) [(1, 1), (5, 2), (10, 1), (13, 1)],
  term ((-1163489082688 : Rat) / 31414578435) [(1, 1), (5, 2), (10, 1), (15, 1)],
  term ((3431343694688 : Rat) / 94243735305) [(1, 1), (5, 2), (11, 1)],
  term ((-9224029696 : Rat) / 110226591) [(1, 1), (5, 2), (11, 1), (12, 1)],
  term ((19496960 : Rat) / 110226591) [(1, 1), (5, 2), (11, 1), (13, 1), (15, 1)],
  term ((-6149457664 : Rat) / 330679773) [(1, 1), (5, 2), (11, 1), (14, 1)],
  term ((126730240 : Rat) / 110226591) [(1, 1), (5, 2), (11, 1), (15, 2)],
  term ((-432376392 : Rat) / 12247399) [(1, 1), (5, 2), (12, 1), (13, 1)],
  term ((8081193296 : Rat) / 110226591) [(1, 1), (5, 2), (12, 1), (15, 1)],
  term ((107229490459 : Rat) / 6981017430) [(1, 1), (5, 2), (13, 1)],
  term ((-96085276 : Rat) / 12247399) [(1, 1), (5, 2), (13, 1), (14, 1)],
  term ((35882240 : Rat) / 110226591) [(1, 1), (5, 2), (13, 1), (15, 2)],
  term ((913920 : Rat) / 12247399) [(1, 1), (5, 2), (13, 2), (15, 1)],
  term ((5545493072 : Rat) / 330679773) [(1, 1), (5, 2), (14, 1), (15, 1)],
  term ((-2956487679004 : Rat) / 94243735305) [(1, 1), (5, 2), (15, 1)],
  term ((-114283520 : Rat) / 110226591) [(1, 1), (5, 2), (15, 3)],
  term ((565788160 : Rat) / 110226591) [(2, 1), (3, 1), (4, 1), (11, 1)],
  term ((-805504000 : Rat) / 110226591) [(2, 1), (3, 1), (4, 1), (11, 1), (12, 1)],
  term ((-2727280640 : Rat) / 330679773) [(2, 1), (3, 1), (4, 1), (11, 1), (14, 1)],
  term ((-37758000 : Rat) / 12247399) [(2, 1), (3, 1), (4, 1), (12, 1), (13, 1)],
  term ((726392000 : Rat) / 110226591) [(2, 1), (3, 1), (4, 1), (12, 1), (15, 1)],
  term ((26521320 : Rat) / 12247399) [(2, 1), (3, 1), (4, 1), (13, 1)],
  term ((-42613760 : Rat) / 12247399) [(2, 1), (3, 1), (4, 1), (13, 1), (14, 1)],
  term ((2459422720 : Rat) / 330679773) [(2, 1), (3, 1), (4, 1), (14, 1), (15, 1)],
  term ((-510219680 : Rat) / 110226591) [(2, 1), (3, 1), (4, 1), (15, 1)],
  term ((1796372480 : Rat) / 330679773) [(2, 1), (3, 1), (5, 1), (7, 1), (11, 1)],
  term ((28068320 : Rat) / 12247399) [(2, 1), (3, 1), (5, 1), (7, 1), (13, 1)],
  term ((-1619943040 : Rat) / 330679773) [(2, 1), (3, 1), (5, 1), (7, 1), (15, 1)],
  term ((1473382400 : Rat) / 330679773) [(2, 1), (3, 1), (5, 1), (9, 1), (11, 1)],
  term ((23021600 : Rat) / 12247399) [(2, 1), (3, 1), (5, 1), (9, 1), (13, 1)],
  term ((-1328675200 : Rat) / 330679773) [(2, 1), (3, 1), (5, 1), (9, 1), (15, 1)],
  term ((-1209098240 : Rat) / 330679773) [(2, 1), (3, 1), (5, 1), (11, 1), (13, 1)],
  term ((-428646400 : Rat) / 110226591) [(2, 1), (3, 1), (5, 1), (11, 1), (15, 1)],
  term ((10336640 : Rat) / 6239241) [(2, 1), (3, 1), (5, 1), (13, 1), (15, 1)],
  term ((-18892160 : Rat) / 12247399) [(2, 1), (3, 1), (5, 1), (13, 2)],
  term ((386547200 : Rat) / 110226591) [(2, 1), (3, 1), (5, 1), (15, 2)],
  term ((1445785600 : Rat) / 330679773) [(2, 1), (3, 1), (5, 2), (11, 1)],
  term ((22590400 : Rat) / 12247399) [(2, 1), (3, 1), (5, 2), (13, 1)],
  term ((-1303788800 : Rat) / 330679773) [(2, 1), (3, 1), (5, 2), (15, 1)],
  term ((2985 : Rat) / 268) [(2, 1), (4, 1)],
  term ((-246 : Rat) / 67) [(2, 1), (4, 1), (5, 1), (9, 1)],
  term ((38993920 : Rat) / 330679773) [(2, 1), (4, 1), (5, 1), (10, 1), (11, 1)],
  term ((609280 : Rat) / 12247399) [(2, 1), (4, 1), (5, 1), (10, 1), (13, 1)],
  term ((-35164160 : Rat) / 330679773) [(2, 1), (4, 1), (5, 1), (10, 1), (15, 1)],
  term ((-10167310184 : Rat) / 330679773) [(2, 1), (4, 1), (5, 1), (11, 1)],
  term ((-70138880 : Rat) / 110226591) [(2, 1), (4, 1), (5, 1), (11, 1), (12, 1)],
  term ((-1827840 : Rat) / 12247399) [(2, 1), (4, 1), (5, 1), (11, 1), (13, 1), (15, 1)],
  term ((3222141440 : Rat) / 110226591) [(2, 1), (4, 1), (5, 1), (11, 1), (14, 1)],
  term ((64409600 : Rat) / 110226591) [(2, 1), (4, 1), (5, 1), (11, 1), (15, 2)],
  term ((-38993920 : Rat) / 110226591) [(2, 1), (4, 1), (5, 1), (11, 2), (15, 1)],
  term ((-3287760 : Rat) / 12247399) [(2, 1), (4, 1), (5, 1), (12, 1), (13, 1)],
  term ((181702696 : Rat) / 110226591) [(2, 1), (4, 1), (5, 1), (12, 1), (15, 1)],
  term ((-157013402 : Rat) / 12247399) [(2, 1), (4, 1), (5, 1), (13, 1)],
  term ((151037880 : Rat) / 12247399) [(2, 1), (4, 1), (5, 1), (13, 1), (14, 1)],
  term ((1370880 : Rat) / 12247399) [(2, 1), (4, 1), (5, 1), (13, 1), (15, 2)],
  term ((-2905681120 : Rat) / 110226591) [(2, 1), (4, 1), (5, 1), (14, 1), (15, 1)],
  term ((8519009254 : Rat) / 330679773) [(2, 1), (4, 1), (5, 1), (15, 1)],
  term ((-8791040 : Rat) / 36742197) [(2, 1), (4, 1), (5, 1), (15, 3)],
  term ((345 : Rat) / 67) [(2, 1), (4, 1), (7, 1), (9, 1)],
  term ((4385912120576 : Rat) / 157072892175) [(2, 1), (4, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((68529876884 : Rat) / 5817514525) [(2, 1), (4, 1), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4789749157348 : Rat) / 157072892175) [(2, 1), (4, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((1282796870656 : Rat) / 31414578435) [(2, 1), (4, 1), (7, 1), (10, 1), (11, 1)],
  term ((20043701104 : Rat) / 1163502905) [(2, 1), (4, 1), (7, 1), (10, 1), (13, 1)],
  term ((-1156807892288 : Rat) / 31414578435) [(2, 1), (4, 1), (7, 1), (10, 1), (15, 1)],
  term ((43770385486768 : Rat) / 471218676525) [(2, 1), (4, 1), (7, 1), (11, 1)],
  term ((-25781744128 : Rat) / 330679773) [(2, 1), (4, 1), (7, 1), (11, 1), (12, 1)],
  term ((52398080 : Rat) / 110226591) [(2, 1), (4, 1), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((-555912448 : Rat) / 6239241) [(2, 1), (4, 1), (7, 1), (11, 1), (14, 1)],
  term ((22282240 : Rat) / 110226591) [(2, 1), (4, 1), (7, 1), (11, 1), (15, 2)],
  term ((77987840 : Rat) / 110226591) [(2, 1), (4, 1), (7, 1), (11, 2), (15, 1)],
  term ((-402839752 : Rat) / 12247399) [(2, 1), (4, 1), (7, 1), (12, 1), (13, 1)],
  term ((22361215124 : Rat) / 330679773) [(2, 1), (4, 1), (7, 1), (12, 1), (15, 1)],
  term ((1357274874599 : Rat) / 34905087150) [(2, 1), (4, 1), (7, 1), (13, 1)],
  term ((-8686132 : Rat) / 231083) [(2, 1), (4, 1), (7, 1), (13, 1), (14, 1)],
  term ((21488000 : Rat) / 110226591) [(2, 1), (4, 1), (7, 1), (13, 1), (15, 2)],
  term ((913920 : Rat) / 12247399) [(2, 1), (4, 1), (7, 1), (13, 2), (15, 1)],
  term ((-722892800 : Rat) / 330679773) [(2, 1), (4, 2), (5, 1), (11, 1)],
  term ((-11295200 : Rat) / 12247399) [(2, 1), (4, 2), (5, 1), (13, 1)],
  term ((651894400 : Rat) / 330679773) [(2, 1), (4, 2), (5, 1), (15, 1)],
  term ((-898186240 : Rat) / 330679773) [(2, 1), (4, 2), (7, 1), (11, 1)],
  term ((-14034160 : Rat) / 12247399) [(2, 1), (4, 2), (7, 1), (13, 1)],
  term ((809971520 : Rat) / 330679773) [(2, 1), (4, 2), (7, 1), (15, 1)],
  term ((-2641945600 : Rat) / 330679773) [(2, 1), (4, 2), (9, 1), (11, 1)],
  term ((-41280400 : Rat) / 12247399) [(2, 1), (4, 2), (9, 1), (13, 1)],
  term ((2382468800 : Rat) / 330679773) [(2, 1), (4, 2), (9, 1), (15, 1)],
  term ((604549120 : Rat) / 330679773) [(2, 1), (4, 2), (11, 1), (13, 1)],
  term ((214323200 : Rat) / 110226591) [(2, 1), (4, 2), (11, 1), (15, 1)],
  term ((-5168320 : Rat) / 6239241) [(2, 1), (4, 2), (13, 1), (15, 1)],
  term ((9446080 : Rat) / 12247399) [(2, 1), (4, 2), (13, 2)],
  term ((-193273600 : Rat) / 110226591) [(2, 1), (4, 2), (15, 2)],
  term ((-898186240 : Rat) / 330679773) [(2, 1), (5, 2), (7, 1), (11, 1)],
  term ((-14034160 : Rat) / 12247399) [(2, 1), (5, 2), (7, 1), (13, 1)],
  term ((809971520 : Rat) / 330679773) [(2, 1), (5, 2), (7, 1), (15, 1)],
  term ((-736691200 : Rat) / 330679773) [(2, 1), (5, 2), (9, 1), (11, 1)],
  term ((-11510800 : Rat) / 12247399) [(2, 1), (5, 2), (9, 1), (13, 1)],
  term ((664337600 : Rat) / 330679773) [(2, 1), (5, 2), (9, 1), (15, 1)],
  term ((604549120 : Rat) / 330679773) [(2, 1), (5, 2), (11, 1), (13, 1)],
  term ((214323200 : Rat) / 110226591) [(2, 1), (5, 2), (11, 1), (15, 1)],
  term ((-5168320 : Rat) / 6239241) [(2, 1), (5, 2), (13, 1), (15, 1)],
  term ((9446080 : Rat) / 12247399) [(2, 1), (5, 2), (13, 2)],
  term ((-193273600 : Rat) / 110226591) [(2, 1), (5, 2), (15, 2)],
  term ((-722892800 : Rat) / 330679773) [(2, 1), (5, 3), (11, 1)],
  term ((-11295200 : Rat) / 12247399) [(2, 1), (5, 3), (13, 1)],
  term ((651894400 : Rat) / 330679773) [(2, 1), (5, 3), (15, 1)],
  term ((1445785600 : Rat) / 330679773) [(2, 2), (4, 1), (5, 1), (11, 1)],
  term ((22590400 : Rat) / 12247399) [(2, 2), (4, 1), (5, 1), (13, 1)],
  term ((-1303788800 : Rat) / 330679773) [(2, 2), (4, 1), (5, 1), (15, 1)],
  term ((1796372480 : Rat) / 330679773) [(2, 2), (4, 1), (7, 1), (11, 1)],
  term ((28068320 : Rat) / 12247399) [(2, 2), (4, 1), (7, 1), (13, 1)],
  term ((-1619943040 : Rat) / 330679773) [(2, 2), (4, 1), (7, 1), (15, 1)],
  term ((1473382400 : Rat) / 330679773) [(2, 2), (4, 1), (9, 1), (11, 1)],
  term ((23021600 : Rat) / 12247399) [(2, 2), (4, 1), (9, 1), (13, 1)],
  term ((-1328675200 : Rat) / 330679773) [(2, 2), (4, 1), (9, 1), (15, 1)],
  term ((-1209098240 : Rat) / 330679773) [(2, 2), (4, 1), (11, 1), (13, 1)],
  term ((-428646400 : Rat) / 110226591) [(2, 2), (4, 1), (11, 1), (15, 1)],
  term ((10336640 : Rat) / 6239241) [(2, 2), (4, 1), (13, 1), (15, 1)],
  term ((-18892160 : Rat) / 12247399) [(2, 2), (4, 1), (13, 2)],
  term ((386547200 : Rat) / 110226591) [(2, 2), (4, 1), (15, 2)],
  term ((-635084800 : Rat) / 110226591) [(3, 1), (4, 1), (5, 1), (9, 1), (11, 1)],
  term ((-29769600 : Rat) / 12247399) [(3, 1), (4, 1), (5, 1), (9, 1), (13, 1)],
  term ((572710400 : Rat) / 110226591) [(3, 1), (4, 1), (5, 1), (9, 1), (15, 1)],
  term ((-282894080 : Rat) / 110226591) [(3, 1), (4, 2), (11, 1)],
  term ((402752000 : Rat) / 110226591) [(3, 1), (4, 2), (11, 1), (12, 1)],
  term ((1363640320 : Rat) / 330679773) [(3, 1), (4, 2), (11, 1), (14, 1)],
  term ((18879000 : Rat) / 12247399) [(3, 1), (4, 2), (12, 1), (13, 1)],
  term ((-363196000 : Rat) / 110226591) [(3, 1), (4, 2), (12, 1), (15, 1)],
  term ((-13260660 : Rat) / 12247399) [(3, 1), (4, 2), (13, 1)],
  term ((21306880 : Rat) / 12247399) [(3, 1), (4, 2), (13, 1), (14, 1)],
  term ((-1229711360 : Rat) / 330679773) [(3, 1), (4, 2), (14, 1), (15, 1)],
  term ((255109840 : Rat) / 110226591) [(3, 1), (4, 2), (15, 1)],
  term ((2985 : Rat) / 268) [(3, 1), (5, 1)],
  term ((345 : Rat) / 67) [(3, 1), (5, 1), (7, 1), (9, 1)],
  term ((4385912120576 : Rat) / 157072892175) [(3, 1), (5, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((68529876884 : Rat) / 5817514525) [(3, 1), (5, 1), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4789749157348 : Rat) / 157072892175) [(3, 1), (5, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((1282796870656 : Rat) / 31414578435) [(3, 1), (5, 1), (7, 1), (10, 1), (11, 1)],
  term ((20043701104 : Rat) / 1163502905) [(3, 1), (5, 1), (7, 1), (10, 1), (13, 1)],
  term ((-1156807892288 : Rat) / 31414578435) [(3, 1), (5, 1), (7, 1), (10, 1), (15, 1)],
  term ((43770385486768 : Rat) / 471218676525) [(3, 1), (5, 1), (7, 1), (11, 1)],
  term ((-25781744128 : Rat) / 330679773) [(3, 1), (5, 1), (7, 1), (11, 1), (12, 1)],
  term ((52398080 : Rat) / 110226591) [(3, 1), (5, 1), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((-555912448 : Rat) / 6239241) [(3, 1), (5, 1), (7, 1), (11, 1), (14, 1)],
  term ((22282240 : Rat) / 110226591) [(3, 1), (5, 1), (7, 1), (11, 1), (15, 2)],
  term ((77987840 : Rat) / 110226591) [(3, 1), (5, 1), (7, 1), (11, 2), (15, 1)],
  term ((-402839752 : Rat) / 12247399) [(3, 1), (5, 1), (7, 1), (12, 1), (13, 1)],
  term ((22361215124 : Rat) / 330679773) [(3, 1), (5, 1), (7, 1), (12, 1), (15, 1)],
  term ((1357274874599 : Rat) / 34905087150) [(3, 1), (5, 1), (7, 1), (13, 1)],
  term ((-8686132 : Rat) / 231083) [(3, 1), (5, 1), (7, 1), (13, 1), (14, 1)],
  term ((21488000 : Rat) / 110226591) [(3, 1), (5, 1), (7, 1), (13, 1), (15, 2)],
  term ((913920 : Rat) / 12247399) [(3, 1), (5, 1), (7, 1), (13, 2), (15, 1)],
  term ((-246 : Rat) / 67) [(3, 1), (5, 2), (9, 1)],
  term ((38993920 : Rat) / 330679773) [(3, 1), (5, 2), (10, 1), (11, 1)],
  term ((609280 : Rat) / 12247399) [(3, 1), (5, 2), (10, 1), (13, 1)],
  term ((-35164160 : Rat) / 330679773) [(3, 1), (5, 2), (10, 1), (15, 1)],
  term ((-11015992424 : Rat) / 330679773) [(3, 1), (5, 2), (11, 1)],
  term ((110871040 : Rat) / 36742197) [(3, 1), (5, 2), (11, 1), (12, 1)],
  term ((-1827840 : Rat) / 12247399) [(3, 1), (5, 2), (11, 1), (13, 1), (15, 1)],
  term ((11030064640 : Rat) / 330679773) [(3, 1), (5, 2), (11, 1), (14, 1)],
  term ((64409600 : Rat) / 110226591) [(3, 1), (5, 2), (11, 1), (15, 2)],
  term ((-38993920 : Rat) / 110226591) [(3, 1), (5, 2), (11, 2), (15, 1)],
  term ((15591240 : Rat) / 12247399) [(3, 1), (5, 2), (12, 1), (13, 1)],
  term ((-60497768 : Rat) / 36742197) [(3, 1), (5, 2), (12, 1), (15, 1)],
  term ((-170274062 : Rat) / 12247399) [(3, 1), (5, 2), (13, 1)],
  term ((172344760 : Rat) / 12247399) [(3, 1), (5, 2), (13, 1), (14, 1)],
  term ((1370880 : Rat) / 12247399) [(3, 1), (5, 2), (13, 1), (15, 2)],
  term ((-9946754720 : Rat) / 330679773) [(3, 1), (5, 2), (14, 1), (15, 1)],
  term ((9284338774 : Rat) / 330679773) [(3, 1), (5, 2), (15, 1)],
  term ((-8791040 : Rat) / 36742197) [(3, 1), (5, 2), (15, 3)],
  term ((565788160 : Rat) / 110226591) [(3, 2), (5, 1), (11, 1)],
  term ((-805504000 : Rat) / 110226591) [(3, 2), (5, 1), (11, 1), (12, 1)],
  term ((-2727280640 : Rat) / 330679773) [(3, 2), (5, 1), (11, 1), (14, 1)],
  term ((-37758000 : Rat) / 12247399) [(3, 2), (5, 1), (12, 1), (13, 1)],
  term ((726392000 : Rat) / 110226591) [(3, 2), (5, 1), (12, 1), (15, 1)],
  term ((26521320 : Rat) / 12247399) [(3, 2), (5, 1), (13, 1)],
  term ((-42613760 : Rat) / 12247399) [(3, 2), (5, 1), (13, 1), (14, 1)],
  term ((2459422720 : Rat) / 330679773) [(3, 2), (5, 1), (14, 1), (15, 1)],
  term ((-510219680 : Rat) / 110226591) [(3, 2), (5, 1), (15, 1)],
  term ((317542400 : Rat) / 110226591) [(4, 1), (5, 2), (9, 1), (11, 1)],
  term ((14884800 : Rat) / 12247399) [(4, 1), (5, 2), (9, 1), (13, 1)],
  term ((-286355200 : Rat) / 110226591) [(4, 1), (5, 2), (9, 1), (15, 1)],
  term ((-2985 : Rat) / 536) [(4, 2)],
  term ((123 : Rat) / 67) [(4, 2), (5, 1), (9, 1)],
  term ((-19496960 : Rat) / 330679773) [(4, 2), (5, 1), (10, 1), (11, 1)],
  term ((-304640 : Rat) / 12247399) [(4, 2), (5, 1), (10, 1), (13, 1)],
  term ((17582080 : Rat) / 330679773) [(4, 2), (5, 1), (10, 1), (15, 1)],
  term ((5083655092 : Rat) / 330679773) [(4, 2), (5, 1), (11, 1)],
  term ((35069440 : Rat) / 110226591) [(4, 2), (5, 1), (11, 1), (12, 1)],
  term ((913920 : Rat) / 12247399) [(4, 2), (5, 1), (11, 1), (13, 1), (15, 1)],
  term ((-1611070720 : Rat) / 110226591) [(4, 2), (5, 1), (11, 1), (14, 1)],
  term ((-32204800 : Rat) / 110226591) [(4, 2), (5, 1), (11, 1), (15, 2)],
  term ((19496960 : Rat) / 110226591) [(4, 2), (5, 1), (11, 2), (15, 1)],
  term ((1643880 : Rat) / 12247399) [(4, 2), (5, 1), (12, 1), (13, 1)],
  term ((-90851348 : Rat) / 110226591) [(4, 2), (5, 1), (12, 1), (15, 1)],
  term ((78506701 : Rat) / 12247399) [(4, 2), (5, 1), (13, 1)],
  term ((-75518940 : Rat) / 12247399) [(4, 2), (5, 1), (13, 1), (14, 1)],
  term ((-685440 : Rat) / 12247399) [(4, 2), (5, 1), (13, 1), (15, 2)],
  term ((1452840560 : Rat) / 110226591) [(4, 2), (5, 1), (14, 1), (15, 1)],
  term ((-4259504627 : Rat) / 330679773) [(4, 2), (5, 1), (15, 1)],
  term ((4395520 : Rat) / 36742197) [(4, 2), (5, 1), (15, 3)],
  term ((-345 : Rat) / 134) [(4, 2), (7, 1), (9, 1)],
  term ((-2192956060288 : Rat) / 157072892175) [(4, 2), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-34264938442 : Rat) / 5817514525) [(4, 2), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((2394874578674 : Rat) / 157072892175) [(4, 2), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((-641398435328 : Rat) / 31414578435) [(4, 2), (7, 1), (10, 1), (11, 1)],
  term ((-10021850552 : Rat) / 1163502905) [(4, 2), (7, 1), (10, 1), (13, 1)],
  term ((578403946144 : Rat) / 31414578435) [(4, 2), (7, 1), (10, 1), (15, 1)],
  term ((-21885192743384 : Rat) / 471218676525) [(4, 2), (7, 1), (11, 1)],
  term ((12890872064 : Rat) / 330679773) [(4, 2), (7, 1), (11, 1), (12, 1)],
  term ((-26199040 : Rat) / 110226591) [(4, 2), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((277956224 : Rat) / 6239241) [(4, 2), (7, 1), (11, 1), (14, 1)],
  term ((-11141120 : Rat) / 110226591) [(4, 2), (7, 1), (11, 1), (15, 2)],
  term ((-38993920 : Rat) / 110226591) [(4, 2), (7, 1), (11, 2), (15, 1)],
  term ((201419876 : Rat) / 12247399) [(4, 2), (7, 1), (12, 1), (13, 1)],
  term ((-11180607562 : Rat) / 330679773) [(4, 2), (7, 1), (12, 1), (15, 1)],
  term ((-1357274874599 : Rat) / 69810174300) [(4, 2), (7, 1), (13, 1)],
  term ((4343066 : Rat) / 231083) [(4, 2), (7, 1), (13, 1), (14, 1)],
  term ((-10744000 : Rat) / 110226591) [(4, 2), (7, 1), (13, 1), (15, 2)],
  term ((-456960 : Rat) / 12247399) [(4, 2), (7, 1), (13, 2), (15, 1)],
  term ((317542400 : Rat) / 110226591) [(4, 3), (9, 1), (11, 1)],
  term ((14884800 : Rat) / 12247399) [(4, 3), (9, 1), (13, 1)],
  term ((-286355200 : Rat) / 110226591) [(4, 3), (9, 1), (15, 1)],
  term ((-2985 : Rat) / 536) [(5, 2)],
  term ((-345 : Rat) / 134) [(5, 2), (7, 1), (9, 1)],
  term ((-2192956060288 : Rat) / 157072892175) [(5, 2), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-34264938442 : Rat) / 5817514525) [(5, 2), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((2394874578674 : Rat) / 157072892175) [(5, 2), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((-641398435328 : Rat) / 31414578435) [(5, 2), (7, 1), (10, 1), (11, 1)],
  term ((-10021850552 : Rat) / 1163502905) [(5, 2), (7, 1), (10, 1), (13, 1)],
  term ((578403946144 : Rat) / 31414578435) [(5, 2), (7, 1), (10, 1), (15, 1)],
  term ((-21885192743384 : Rat) / 471218676525) [(5, 2), (7, 1), (11, 1)],
  term ((12890872064 : Rat) / 330679773) [(5, 2), (7, 1), (11, 1), (12, 1)],
  term ((-26199040 : Rat) / 110226591) [(5, 2), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((277956224 : Rat) / 6239241) [(5, 2), (7, 1), (11, 1), (14, 1)],
  term ((-11141120 : Rat) / 110226591) [(5, 2), (7, 1), (11, 1), (15, 2)],
  term ((-38993920 : Rat) / 110226591) [(5, 2), (7, 1), (11, 2), (15, 1)],
  term ((201419876 : Rat) / 12247399) [(5, 2), (7, 1), (12, 1), (13, 1)],
  term ((-11180607562 : Rat) / 330679773) [(5, 2), (7, 1), (12, 1), (15, 1)],
  term ((-1357274874599 : Rat) / 69810174300) [(5, 2), (7, 1), (13, 1)],
  term ((4343066 : Rat) / 231083) [(5, 2), (7, 1), (13, 1), (14, 1)],
  term ((-10744000 : Rat) / 110226591) [(5, 2), (7, 1), (13, 1), (15, 2)],
  term ((-456960 : Rat) / 12247399) [(5, 2), (7, 1), (13, 2), (15, 1)],
  term ((123 : Rat) / 67) [(5, 3), (9, 1)],
  term ((-19496960 : Rat) / 330679773) [(5, 3), (10, 1), (11, 1)],
  term ((-304640 : Rat) / 12247399) [(5, 3), (10, 1), (13, 1)],
  term ((17582080 : Rat) / 330679773) [(5, 3), (10, 1), (15, 1)],
  term ((5083655092 : Rat) / 330679773) [(5, 3), (11, 1)],
  term ((35069440 : Rat) / 110226591) [(5, 3), (11, 1), (12, 1)],
  term ((913920 : Rat) / 12247399) [(5, 3), (11, 1), (13, 1), (15, 1)],
  term ((-1611070720 : Rat) / 110226591) [(5, 3), (11, 1), (14, 1)],
  term ((-32204800 : Rat) / 110226591) [(5, 3), (11, 1), (15, 2)],
  term ((19496960 : Rat) / 110226591) [(5, 3), (11, 2), (15, 1)],
  term ((1643880 : Rat) / 12247399) [(5, 3), (12, 1), (13, 1)],
  term ((-90851348 : Rat) / 110226591) [(5, 3), (12, 1), (15, 1)],
  term ((78506701 : Rat) / 12247399) [(5, 3), (13, 1)],
  term ((-75518940 : Rat) / 12247399) [(5, 3), (13, 1), (14, 1)],
  term ((-685440 : Rat) / 12247399) [(5, 3), (13, 1), (15, 2)],
  term ((1452840560 : Rat) / 110226591) [(5, 3), (14, 1), (15, 1)],
  term ((-4259504627 : Rat) / 330679773) [(5, 3), (15, 1)],
  term ((4395520 : Rat) / 36742197) [(5, 3), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 10, terms 0 through 99. -/
theorem rs_R009_ueqv_R009NNNYN_block_10_0000_0099_valid :
    checkProductSumEq rs_R009_ueqv_R009NNNYN_partials_10_0000_0099
      rs_R009_ueqv_R009NNNYN_block_10_0000_0099 = true := by
  native_decide

end R009UeqvR009NNNYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
