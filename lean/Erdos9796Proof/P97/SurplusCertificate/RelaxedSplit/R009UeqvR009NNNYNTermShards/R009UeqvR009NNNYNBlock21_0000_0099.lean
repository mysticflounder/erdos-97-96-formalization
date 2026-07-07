/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NNNYN, term block 21:0-99

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NNNYNTermShards

/-- Generator polynomial 21 for relaxed split surplus certificate `R009:u=v:R009NNNYN`. -/
def rs_R009_ueqv_R009NNNYN_generator_21_0000_0099 : Poly :=
[
  term (2 : Rat) [(8, 1), (10, 1)],
  term (2 : Rat) [(9, 1), (11, 1)],
  term (-1 : Rat) [(10, 2)],
  term (-1 : Rat) [(11, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NNNYN_coefficient_21_0000 : Poly :=
[
  term ((-29 : Rat) / 268) []
]

/-- Partial product 0 for generator 21. -/
def rs_R009_ueqv_R009NNNYN_partial_21_0000 : Poly :=
[
  term ((-29 : Rat) / 134) [(8, 1), (10, 1)],
  term ((-29 : Rat) / 134) [(9, 1), (11, 1)],
  term ((29 : Rat) / 268) [(10, 2)],
  term ((29 : Rat) / 268) [(11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 21. -/
theorem rs_R009_ueqv_R009NNNYN_partial_21_0000_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_21_0000
        rs_R009_ueqv_R009NNNYN_generator_21_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_21_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NNNYN_coefficient_21_0001 : Poly :=
[
  term ((120 : Rat) / 67) [(0, 1)]
]

/-- Partial product 1 for generator 21. -/
def rs_R009_ueqv_R009NNNYN_partial_21_0001 : Poly :=
[
  term ((240 : Rat) / 67) [(0, 1), (8, 1), (10, 1)],
  term ((240 : Rat) / 67) [(0, 1), (9, 1), (11, 1)],
  term ((-120 : Rat) / 67) [(0, 1), (10, 2)],
  term ((-120 : Rat) / 67) [(0, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 21. -/
theorem rs_R009_ueqv_R009NNNYN_partial_21_0001_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_21_0001
        rs_R009_ueqv_R009NNNYN_generator_21_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_21_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NNNYN_coefficient_21_0002 : Poly :=
[
  term ((-1176 : Rat) / 67) [(0, 1), (5, 1), (9, 1)]
]

/-- Partial product 2 for generator 21. -/
def rs_R009_ueqv_R009NNNYN_partial_21_0002 : Poly :=
[
  term ((-2352 : Rat) / 67) [(0, 1), (5, 1), (8, 1), (9, 1), (10, 1)],
  term ((1176 : Rat) / 67) [(0, 1), (5, 1), (9, 1), (10, 2)],
  term ((1176 : Rat) / 67) [(0, 1), (5, 1), (9, 1), (11, 2)],
  term ((-2352 : Rat) / 67) [(0, 1), (5, 1), (9, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 21. -/
theorem rs_R009_ueqv_R009NNNYN_partial_21_0002_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_21_0002
        rs_R009_ueqv_R009NNNYN_generator_21_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_21_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NNNYN_coefficient_21_0003 : Poly :=
[
  term ((-5709111083648 : Rat) / 94243735305) [(0, 1), (5, 1), (11, 1)]
]

/-- Partial product 3 for generator 21. -/
def rs_R009_ueqv_R009NNNYN_partial_21_0003 : Poly :=
[
  term ((-11418222167296 : Rat) / 94243735305) [(0, 1), (5, 1), (8, 1), (10, 1), (11, 1)],
  term ((-11418222167296 : Rat) / 94243735305) [(0, 1), (5, 1), (9, 1), (11, 2)],
  term ((5709111083648 : Rat) / 94243735305) [(0, 1), (5, 1), (10, 2), (11, 1)],
  term ((5709111083648 : Rat) / 94243735305) [(0, 1), (5, 1), (11, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 21. -/
theorem rs_R009_ueqv_R009NNNYN_partial_21_0003_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_21_0003
        rs_R009_ueqv_R009NNNYN_generator_21_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_21_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NNNYN_coefficient_21_0004 : Poly :=
[
  term ((-77987840 : Rat) / 110226591) [(0, 1), (5, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 4 for generator 21. -/
def rs_R009_ueqv_R009NNNYN_partial_21_0004 : Poly :=
[
  term ((-155975680 : Rat) / 110226591) [(0, 1), (5, 1), (8, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-155975680 : Rat) / 110226591) [(0, 1), (5, 1), (9, 1), (11, 2), (13, 1), (15, 1)],
  term ((77987840 : Rat) / 110226591) [(0, 1), (5, 1), (10, 2), (11, 1), (13, 1), (15, 1)],
  term ((77987840 : Rat) / 110226591) [(0, 1), (5, 1), (11, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 21. -/
theorem rs_R009_ueqv_R009NNNYN_partial_21_0004_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_21_0004
        rs_R009_ueqv_R009NNNYN_generator_21_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_21_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NNNYN_coefficient_21_0005 : Poly :=
[
  term ((38993920 : Rat) / 36742197) [(0, 1), (5, 1), (11, 1), (15, 2)]
]

/-- Partial product 5 for generator 21. -/
def rs_R009_ueqv_R009NNNYN_partial_21_0005 : Poly :=
[
  term ((77987840 : Rat) / 36742197) [(0, 1), (5, 1), (8, 1), (10, 1), (11, 1), (15, 2)],
  term ((77987840 : Rat) / 36742197) [(0, 1), (5, 1), (9, 1), (11, 2), (15, 2)],
  term ((-38993920 : Rat) / 36742197) [(0, 1), (5, 1), (10, 2), (11, 1), (15, 2)],
  term ((-38993920 : Rat) / 36742197) [(0, 1), (5, 1), (11, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 21. -/
theorem rs_R009_ueqv_R009NNNYN_partial_21_0005_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_21_0005
        rs_R009_ueqv_R009NNNYN_generator_21_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_21_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NNNYN_coefficient_21_0006 : Poly :=
[
  term ((-89204860682 : Rat) / 3490508715) [(0, 1), (5, 1), (13, 1)]
]

/-- Partial product 6 for generator 21. -/
def rs_R009_ueqv_R009NNNYN_partial_21_0006 : Poly :=
[
  term ((-178409721364 : Rat) / 3490508715) [(0, 1), (5, 1), (8, 1), (10, 1), (13, 1)],
  term ((-178409721364 : Rat) / 3490508715) [(0, 1), (5, 1), (9, 1), (11, 1), (13, 1)],
  term ((89204860682 : Rat) / 3490508715) [(0, 1), (5, 1), (10, 2), (13, 1)],
  term ((89204860682 : Rat) / 3490508715) [(0, 1), (5, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 21. -/
theorem rs_R009_ueqv_R009NNNYN_partial_21_0006_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_21_0006
        rs_R009_ueqv_R009NNNYN_generator_21_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_21_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NNNYN_coefficient_21_0007 : Poly :=
[
  term ((119680000 : Rat) / 110226591) [(0, 1), (5, 1), (13, 1), (15, 2)]
]

/-- Partial product 7 for generator 21. -/
def rs_R009_ueqv_R009NNNYN_partial_21_0007 : Poly :=
[
  term ((239360000 : Rat) / 110226591) [(0, 1), (5, 1), (8, 1), (10, 1), (13, 1), (15, 2)],
  term ((239360000 : Rat) / 110226591) [(0, 1), (5, 1), (9, 1), (11, 1), (13, 1), (15, 2)],
  term ((-119680000 : Rat) / 110226591) [(0, 1), (5, 1), (10, 2), (13, 1), (15, 2)],
  term ((-119680000 : Rat) / 110226591) [(0, 1), (5, 1), (11, 2), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 21. -/
theorem rs_R009_ueqv_R009NNNYN_partial_21_0007_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_21_0007
        rs_R009_ueqv_R009NNNYN_generator_21_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_21_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NNNYN_coefficient_21_0008 : Poly :=
[
  term ((-3655680 : Rat) / 12247399) [(0, 1), (5, 1), (13, 2), (15, 1)]
]

/-- Partial product 8 for generator 21. -/
def rs_R009_ueqv_R009NNNYN_partial_21_0008 : Poly :=
[
  term ((-7311360 : Rat) / 12247399) [(0, 1), (5, 1), (8, 1), (10, 1), (13, 2), (15, 1)],
  term ((-7311360 : Rat) / 12247399) [(0, 1), (5, 1), (9, 1), (11, 1), (13, 2), (15, 1)],
  term ((3655680 : Rat) / 12247399) [(0, 1), (5, 1), (10, 2), (13, 2), (15, 1)],
  term ((3655680 : Rat) / 12247399) [(0, 1), (5, 1), (11, 2), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 21. -/
theorem rs_R009_ueqv_R009NNNYN_partial_21_0008_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_21_0008
        rs_R009_ueqv_R009NNNYN_generator_21_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_21_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NNNYN_coefficient_21_0009 : Poly :=
[
  term ((4596998633824 : Rat) / 94243735305) [(0, 1), (5, 1), (15, 1)]
]

/-- Partial product 9 for generator 21. -/
def rs_R009_ueqv_R009NNNYN_partial_21_0009 : Poly :=
[
  term ((9193997267648 : Rat) / 94243735305) [(0, 1), (5, 1), (8, 1), (10, 1), (15, 1)],
  term ((9193997267648 : Rat) / 94243735305) [(0, 1), (5, 1), (9, 1), (11, 1), (15, 1)],
  term ((-4596998633824 : Rat) / 94243735305) [(0, 1), (5, 1), (10, 2), (15, 1)],
  term ((-4596998633824 : Rat) / 94243735305) [(0, 1), (5, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 21. -/
theorem rs_R009_ueqv_R009NNNYN_partial_21_0009_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_21_0009
        rs_R009_ueqv_R009NNNYN_generator_21_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_21_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NNNYN_coefficient_21_0010 : Poly :=
[
  term ((-35164160 : Rat) / 36742197) [(0, 1), (5, 1), (15, 3)]
]

/-- Partial product 10 for generator 21. -/
def rs_R009_ueqv_R009NNNYN_partial_21_0010 : Poly :=
[
  term ((-70328320 : Rat) / 36742197) [(0, 1), (5, 1), (8, 1), (10, 1), (15, 3)],
  term ((-70328320 : Rat) / 36742197) [(0, 1), (5, 1), (9, 1), (11, 1), (15, 3)],
  term ((35164160 : Rat) / 36742197) [(0, 1), (5, 1), (10, 2), (15, 3)],
  term ((35164160 : Rat) / 36742197) [(0, 1), (5, 1), (11, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 21. -/
theorem rs_R009_ueqv_R009NNNYN_partial_21_0010_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_21_0010
        rs_R009_ueqv_R009NNNYN_generator_21_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_21_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NNNYN_coefficient_21_0011 : Poly :=
[
  term ((2854555541824 : Rat) / 94243735305) [(0, 1), (9, 1), (11, 1)]
]

/-- Partial product 11 for generator 21. -/
def rs_R009_ueqv_R009NNNYN_partial_21_0011 : Poly :=
[
  term ((5709111083648 : Rat) / 94243735305) [(0, 1), (8, 1), (9, 1), (10, 1), (11, 1)],
  term ((-2854555541824 : Rat) / 94243735305) [(0, 1), (9, 1), (10, 2), (11, 1)],
  term ((-2854555541824 : Rat) / 94243735305) [(0, 1), (9, 1), (11, 3)],
  term ((5709111083648 : Rat) / 94243735305) [(0, 1), (9, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 21. -/
theorem rs_R009_ueqv_R009NNNYN_partial_21_0011_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_21_0011
        rs_R009_ueqv_R009NNNYN_generator_21_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_21_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NNNYN_coefficient_21_0012 : Poly :=
[
  term ((38993920 : Rat) / 110226591) [(0, 1), (9, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 12 for generator 21. -/
def rs_R009_ueqv_R009NNNYN_partial_21_0012 : Poly :=
[
  term ((77987840 : Rat) / 110226591) [(0, 1), (8, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-38993920 : Rat) / 110226591) [(0, 1), (9, 1), (10, 2), (11, 1), (13, 1), (15, 1)],
  term ((-38993920 : Rat) / 110226591) [(0, 1), (9, 1), (11, 3), (13, 1), (15, 1)],
  term ((77987840 : Rat) / 110226591) [(0, 1), (9, 2), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 21. -/
theorem rs_R009_ueqv_R009NNNYN_partial_21_0012_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_21_0012
        rs_R009_ueqv_R009NNNYN_generator_21_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_21_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NNNYN_coefficient_21_0013 : Poly :=
[
  term ((-19496960 : Rat) / 36742197) [(0, 1), (9, 1), (11, 1), (15, 2)]
]

/-- Partial product 13 for generator 21. -/
def rs_R009_ueqv_R009NNNYN_partial_21_0013 : Poly :=
[
  term ((-38993920 : Rat) / 36742197) [(0, 1), (8, 1), (9, 1), (10, 1), (11, 1), (15, 2)],
  term ((19496960 : Rat) / 36742197) [(0, 1), (9, 1), (10, 2), (11, 1), (15, 2)],
  term ((19496960 : Rat) / 36742197) [(0, 1), (9, 1), (11, 3), (15, 2)],
  term ((-38993920 : Rat) / 36742197) [(0, 1), (9, 2), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 21. -/
theorem rs_R009_ueqv_R009NNNYN_partial_21_0013_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_21_0013
        rs_R009_ueqv_R009NNNYN_generator_21_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_21_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NNNYN_coefficient_21_0014 : Poly :=
[
  term ((44602430341 : Rat) / 3490508715) [(0, 1), (9, 1), (13, 1)]
]

/-- Partial product 14 for generator 21. -/
def rs_R009_ueqv_R009NNNYN_partial_21_0014 : Poly :=
[
  term ((89204860682 : Rat) / 3490508715) [(0, 1), (8, 1), (9, 1), (10, 1), (13, 1)],
  term ((-44602430341 : Rat) / 3490508715) [(0, 1), (9, 1), (10, 2), (13, 1)],
  term ((-44602430341 : Rat) / 3490508715) [(0, 1), (9, 1), (11, 2), (13, 1)],
  term ((89204860682 : Rat) / 3490508715) [(0, 1), (9, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 21. -/
theorem rs_R009_ueqv_R009NNNYN_partial_21_0014_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_21_0014
        rs_R009_ueqv_R009NNNYN_generator_21_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_21_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NNNYN_coefficient_21_0015 : Poly :=
[
  term ((-59840000 : Rat) / 110226591) [(0, 1), (9, 1), (13, 1), (15, 2)]
]

/-- Partial product 15 for generator 21. -/
def rs_R009_ueqv_R009NNNYN_partial_21_0015 : Poly :=
[
  term ((-119680000 : Rat) / 110226591) [(0, 1), (8, 1), (9, 1), (10, 1), (13, 1), (15, 2)],
  term ((59840000 : Rat) / 110226591) [(0, 1), (9, 1), (10, 2), (13, 1), (15, 2)],
  term ((59840000 : Rat) / 110226591) [(0, 1), (9, 1), (11, 2), (13, 1), (15, 2)],
  term ((-119680000 : Rat) / 110226591) [(0, 1), (9, 2), (11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 21. -/
theorem rs_R009_ueqv_R009NNNYN_partial_21_0015_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_21_0015
        rs_R009_ueqv_R009NNNYN_generator_21_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_21_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NNNYN_coefficient_21_0016 : Poly :=
[
  term ((1827840 : Rat) / 12247399) [(0, 1), (9, 1), (13, 2), (15, 1)]
]

/-- Partial product 16 for generator 21. -/
def rs_R009_ueqv_R009NNNYN_partial_21_0016 : Poly :=
[
  term ((3655680 : Rat) / 12247399) [(0, 1), (8, 1), (9, 1), (10, 1), (13, 2), (15, 1)],
  term ((-1827840 : Rat) / 12247399) [(0, 1), (9, 1), (10, 2), (13, 2), (15, 1)],
  term ((-1827840 : Rat) / 12247399) [(0, 1), (9, 1), (11, 2), (13, 2), (15, 1)],
  term ((3655680 : Rat) / 12247399) [(0, 1), (9, 2), (11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 21. -/
theorem rs_R009_ueqv_R009NNNYN_partial_21_0016_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_21_0016
        rs_R009_ueqv_R009NNNYN_generator_21_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_21_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NNNYN_coefficient_21_0017 : Poly :=
[
  term ((-2298499316912 : Rat) / 94243735305) [(0, 1), (9, 1), (15, 1)]
]

/-- Partial product 17 for generator 21. -/
def rs_R009_ueqv_R009NNNYN_partial_21_0017 : Poly :=
[
  term ((-4596998633824 : Rat) / 94243735305) [(0, 1), (8, 1), (9, 1), (10, 1), (15, 1)],
  term ((2298499316912 : Rat) / 94243735305) [(0, 1), (9, 1), (10, 2), (15, 1)],
  term ((2298499316912 : Rat) / 94243735305) [(0, 1), (9, 1), (11, 2), (15, 1)],
  term ((-4596998633824 : Rat) / 94243735305) [(0, 1), (9, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 21. -/
theorem rs_R009_ueqv_R009NNNYN_partial_21_0017_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_21_0017
        rs_R009_ueqv_R009NNNYN_generator_21_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_21_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NNNYN_coefficient_21_0018 : Poly :=
[
  term ((17582080 : Rat) / 36742197) [(0, 1), (9, 1), (15, 3)]
]

/-- Partial product 18 for generator 21. -/
def rs_R009_ueqv_R009NNNYN_partial_21_0018 : Poly :=
[
  term ((35164160 : Rat) / 36742197) [(0, 1), (8, 1), (9, 1), (10, 1), (15, 3)],
  term ((-17582080 : Rat) / 36742197) [(0, 1), (9, 1), (10, 2), (15, 3)],
  term ((-17582080 : Rat) / 36742197) [(0, 1), (9, 1), (11, 2), (15, 3)],
  term ((35164160 : Rat) / 36742197) [(0, 1), (9, 2), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 21. -/
theorem rs_R009_ueqv_R009NNNYN_partial_21_0018_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_21_0018
        rs_R009_ueqv_R009NNNYN_generator_21_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_21_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NNNYN_coefficient_21_0019 : Poly :=
[
  term ((588 : Rat) / 67) [(0, 1), (9, 2)]
]

/-- Partial product 19 for generator 21. -/
def rs_R009_ueqv_R009NNNYN_partial_21_0019 : Poly :=
[
  term ((1176 : Rat) / 67) [(0, 1), (8, 1), (9, 2), (10, 1)],
  term ((-588 : Rat) / 67) [(0, 1), (9, 2), (10, 2)],
  term ((-588 : Rat) / 67) [(0, 1), (9, 2), (11, 2)],
  term ((1176 : Rat) / 67) [(0, 1), (9, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 21. -/
theorem rs_R009_ueqv_R009NNNYN_partial_21_0019_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_21_0019
        rs_R009_ueqv_R009NNNYN_generator_21_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_21_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NNNYN_coefficient_21_0020 : Poly :=
[
  term ((11912110336 : Rat) / 330679773) [(0, 1), (11, 1), (15, 1)]
]

/-- Partial product 20 for generator 21. -/
def rs_R009_ueqv_R009NNNYN_partial_21_0020 : Poly :=
[
  term ((23824220672 : Rat) / 330679773) [(0, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((23824220672 : Rat) / 330679773) [(0, 1), (9, 1), (11, 2), (15, 1)],
  term ((-11912110336 : Rat) / 330679773) [(0, 1), (10, 2), (11, 1), (15, 1)],
  term ((-11912110336 : Rat) / 330679773) [(0, 1), (11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 21. -/
theorem rs_R009_ueqv_R009NNNYN_partial_21_0020_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_21_0020
        rs_R009_ueqv_R009NNNYN_generator_21_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_21_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NNNYN_coefficient_21_0021 : Poly :=
[
  term ((186126724 : Rat) / 12247399) [(0, 1), (13, 1), (15, 1)]
]

/-- Partial product 21 for generator 21. -/
def rs_R009_ueqv_R009NNNYN_partial_21_0021 : Poly :=
[
  term ((372253448 : Rat) / 12247399) [(0, 1), (8, 1), (10, 1), (13, 1), (15, 1)],
  term ((372253448 : Rat) / 12247399) [(0, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-186126724 : Rat) / 12247399) [(0, 1), (10, 2), (13, 1), (15, 1)],
  term ((-186126724 : Rat) / 12247399) [(0, 1), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 21. -/
theorem rs_R009_ueqv_R009NNNYN_partial_21_0021_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_21_0021
        rs_R009_ueqv_R009NNNYN_generator_21_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_21_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NNNYN_coefficient_21_0022 : Poly :=
[
  term ((-10742170928 : Rat) / 330679773) [(0, 1), (15, 2)]
]

/-- Partial product 22 for generator 21. -/
def rs_R009_ueqv_R009NNNYN_partial_21_0022 : Poly :=
[
  term ((-21484341856 : Rat) / 330679773) [(0, 1), (8, 1), (10, 1), (15, 2)],
  term ((-21484341856 : Rat) / 330679773) [(0, 1), (9, 1), (11, 1), (15, 2)],
  term ((10742170928 : Rat) / 330679773) [(0, 1), (10, 2), (15, 2)],
  term ((10742170928 : Rat) / 330679773) [(0, 1), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 21. -/
theorem rs_R009_ueqv_R009NNNYN_partial_21_0022_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_21_0022
        rs_R009_ueqv_R009NNNYN_generator_21_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_21_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NNNYN_coefficient_21_0023 : Poly :=
[
  term ((828 : Rat) / 67) [(1, 1), (9, 1)]
]

/-- Partial product 23 for generator 21. -/
def rs_R009_ueqv_R009NNNYN_partial_21_0023 : Poly :=
[
  term ((1656 : Rat) / 67) [(1, 1), (8, 1), (9, 1), (10, 1)],
  term ((-828 : Rat) / 67) [(1, 1), (9, 1), (10, 2)],
  term ((-828 : Rat) / 67) [(1, 1), (9, 1), (11, 2)],
  term ((1656 : Rat) / 67) [(1, 1), (9, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 21. -/
theorem rs_R009_ueqv_R009NNNYN_partial_21_0023_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_21_0023
        rs_R009_ueqv_R009NNNYN_generator_21_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_21_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NNNYN_coefficient_21_0024 : Poly :=
[
  term ((-3616138137472 : Rat) / 94243735305) [(1, 1), (10, 1), (11, 1)]
]

/-- Partial product 24 for generator 21. -/
def rs_R009_ueqv_R009NNNYN_partial_21_0024 : Poly :=
[
  term ((-7232276274944 : Rat) / 94243735305) [(1, 1), (8, 1), (10, 2), (11, 1)],
  term ((-7232276274944 : Rat) / 94243735305) [(1, 1), (9, 1), (10, 1), (11, 2)],
  term ((3616138137472 : Rat) / 94243735305) [(1, 1), (10, 1), (11, 3)],
  term ((3616138137472 : Rat) / 94243735305) [(1, 1), (10, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 21. -/
theorem rs_R009_ueqv_R009NNNYN_partial_21_0024_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_21_0024
        rs_R009_ueqv_R009NNNYN_generator_21_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_21_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NNNYN_coefficient_21_0025 : Poly :=
[
  term ((-56502158398 : Rat) / 3490508715) [(1, 1), (10, 1), (13, 1)]
]

/-- Partial product 25 for generator 21. -/
def rs_R009_ueqv_R009NNNYN_partial_21_0025 : Poly :=
[
  term ((-113004316796 : Rat) / 3490508715) [(1, 1), (8, 1), (10, 2), (13, 1)],
  term ((-113004316796 : Rat) / 3490508715) [(1, 1), (9, 1), (10, 1), (11, 1), (13, 1)],
  term ((56502158398 : Rat) / 3490508715) [(1, 1), (10, 1), (11, 2), (13, 1)],
  term ((56502158398 : Rat) / 3490508715) [(1, 1), (10, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 21. -/
theorem rs_R009_ueqv_R009NNNYN_partial_21_0025_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_21_0025
        rs_R009_ueqv_R009NNNYN_generator_21_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_21_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NNNYN_coefficient_21_0026 : Poly :=
[
  term ((3260981713256 : Rat) / 94243735305) [(1, 1), (10, 1), (15, 1)]
]

/-- Partial product 26 for generator 21. -/
def rs_R009_ueqv_R009NNNYN_partial_21_0026 : Poly :=
[
  term ((6521963426512 : Rat) / 94243735305) [(1, 1), (8, 1), (10, 2), (15, 1)],
  term ((6521963426512 : Rat) / 94243735305) [(1, 1), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((-3260981713256 : Rat) / 94243735305) [(1, 1), (10, 1), (11, 2), (15, 1)],
  term ((-3260981713256 : Rat) / 94243735305) [(1, 1), (10, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 21. -/
theorem rs_R009_ueqv_R009NNNYN_partial_21_0026_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_21_0026
        rs_R009_ueqv_R009NNNYN_generator_21_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_21_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NNNYN_coefficient_21_0027 : Poly :=
[
  term ((66607265128 : Rat) / 3490508715) [(1, 1), (11, 1)]
]

/-- Partial product 27 for generator 21. -/
def rs_R009_ueqv_R009NNNYN_partial_21_0027 : Poly :=
[
  term ((133214530256 : Rat) / 3490508715) [(1, 1), (8, 1), (10, 1), (11, 1)],
  term ((133214530256 : Rat) / 3490508715) [(1, 1), (9, 1), (11, 2)],
  term ((-66607265128 : Rat) / 3490508715) [(1, 1), (10, 2), (11, 1)],
  term ((-66607265128 : Rat) / 3490508715) [(1, 1), (11, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 21. -/
theorem rs_R009_ueqv_R009NNNYN_partial_21_0027_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_21_0027
        rs_R009_ueqv_R009NNNYN_generator_21_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_21_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NNNYN_coefficient_21_0028 : Poly :=
[
  term ((-38993920 : Rat) / 110226591) [(1, 1), (11, 1), (12, 1)]
]

/-- Partial product 28 for generator 21. -/
def rs_R009_ueqv_R009NNNYN_partial_21_0028 : Poly :=
[
  term ((-77987840 : Rat) / 110226591) [(1, 1), (8, 1), (10, 1), (11, 1), (12, 1)],
  term ((-77987840 : Rat) / 110226591) [(1, 1), (9, 1), (11, 2), (12, 1)],
  term ((38993920 : Rat) / 110226591) [(1, 1), (10, 2), (11, 1), (12, 1)],
  term ((38993920 : Rat) / 110226591) [(1, 1), (11, 3), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 21. -/
theorem rs_R009_ueqv_R009NNNYN_partial_21_0028_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_21_0028
        rs_R009_ueqv_R009NNNYN_generator_21_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_21_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NNNYN_coefficient_21_0029 : Poly :=
[
  term ((-43258880 : Rat) / 110226591) [(1, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 29 for generator 21. -/
def rs_R009_ueqv_R009NNNYN_partial_21_0029 : Poly :=
[
  term ((-86517760 : Rat) / 110226591) [(1, 1), (8, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-86517760 : Rat) / 110226591) [(1, 1), (9, 1), (11, 2), (13, 1), (15, 1)],
  term ((43258880 : Rat) / 110226591) [(1, 1), (10, 2), (11, 1), (13, 1), (15, 1)],
  term ((43258880 : Rat) / 110226591) [(1, 1), (11, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 21. -/
theorem rs_R009_ueqv_R009NNNYN_partial_21_0029_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_21_0029
        rs_R009_ueqv_R009NNNYN_generator_21_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_21_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NNNYN_coefficient_21_0030 : Poly :=
[
  term ((-219790592 : Rat) / 6239241) [(1, 1), (11, 1), (14, 1)]
]

/-- Partial product 30 for generator 21. -/
def rs_R009_ueqv_R009NNNYN_partial_21_0030 : Poly :=
[
  term ((-439581184 : Rat) / 6239241) [(1, 1), (8, 1), (10, 1), (11, 1), (14, 1)],
  term ((-439581184 : Rat) / 6239241) [(1, 1), (9, 1), (11, 2), (14, 1)],
  term ((219790592 : Rat) / 6239241) [(1, 1), (10, 2), (11, 1), (14, 1)],
  term ((219790592 : Rat) / 6239241) [(1, 1), (11, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 21. -/
theorem rs_R009_ueqv_R009NNNYN_partial_21_0030_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_21_0030
        rs_R009_ueqv_R009NNNYN_generator_21_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_21_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NNNYN_coefficient_21_0031 : Poly :=
[
  term ((65105920 : Rat) / 36742197) [(1, 1), (11, 1), (15, 2)]
]

/-- Partial product 31 for generator 21. -/
def rs_R009_ueqv_R009NNNYN_partial_21_0031 : Poly :=
[
  term ((130211840 : Rat) / 36742197) [(1, 1), (8, 1), (10, 1), (11, 1), (15, 2)],
  term ((130211840 : Rat) / 36742197) [(1, 1), (9, 1), (11, 2), (15, 2)],
  term ((-65105920 : Rat) / 36742197) [(1, 1), (10, 2), (11, 1), (15, 2)],
  term ((-65105920 : Rat) / 36742197) [(1, 1), (11, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 21. -/
theorem rs_R009_ueqv_R009NNNYN_partial_21_0031_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_21_0031
        rs_R009_ueqv_R009NNNYN_generator_21_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_21_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NNNYN_coefficient_21_0032 : Poly :=
[
  term ((-194969600 : Rat) / 110226591) [(1, 1), (11, 2), (15, 1)]
]

/-- Partial product 32 for generator 21. -/
def rs_R009_ueqv_R009NNNYN_partial_21_0032 : Poly :=
[
  term ((-389939200 : Rat) / 110226591) [(1, 1), (8, 1), (10, 1), (11, 2), (15, 1)],
  term ((-389939200 : Rat) / 110226591) [(1, 1), (9, 1), (11, 3), (15, 1)],
  term ((194969600 : Rat) / 110226591) [(1, 1), (10, 2), (11, 2), (15, 1)],
  term ((194969600 : Rat) / 110226591) [(1, 1), (11, 4), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 21. -/
theorem rs_R009_ueqv_R009NNNYN_partial_21_0032_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_21_0032
        rs_R009_ueqv_R009NNNYN_generator_21_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_21_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NNNYN_coefficient_21_0033 : Poly :=
[
  term ((-1827840 : Rat) / 12247399) [(1, 1), (12, 1), (13, 1)]
]

/-- Partial product 33 for generator 21. -/
def rs_R009_ueqv_R009NNNYN_partial_21_0033 : Poly :=
[
  term ((-3655680 : Rat) / 12247399) [(1, 1), (8, 1), (10, 1), (12, 1), (13, 1)],
  term ((-3655680 : Rat) / 12247399) [(1, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((1827840 : Rat) / 12247399) [(1, 1), (10, 2), (12, 1), (13, 1)],
  term ((1827840 : Rat) / 12247399) [(1, 1), (11, 2), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 21. -/
theorem rs_R009_ueqv_R009NNNYN_partial_21_0033_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_21_0033
        rs_R009_ueqv_R009NNNYN_generator_21_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_21_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NNNYN_coefficient_21_0034 : Poly :=
[
  term ((35164160 : Rat) / 110226591) [(1, 1), (12, 1), (15, 1)]
]

/-- Partial product 34 for generator 21. -/
def rs_R009_ueqv_R009NNNYN_partial_21_0034 : Poly :=
[
  term ((70328320 : Rat) / 110226591) [(1, 1), (8, 1), (10, 1), (12, 1), (15, 1)],
  term ((70328320 : Rat) / 110226591) [(1, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((-35164160 : Rat) / 110226591) [(1, 1), (10, 2), (12, 1), (15, 1)],
  term ((-35164160 : Rat) / 110226591) [(1, 1), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 21. -/
theorem rs_R009_ueqv_R009NNNYN_partial_21_0034_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_21_0034
        rs_R009_ueqv_R009NNNYN_generator_21_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_21_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NNNYN_coefficient_21_0035 : Poly :=
[
  term ((20491571961 : Rat) / 2327005810) [(1, 1), (13, 1)]
]

/-- Partial product 35 for generator 21. -/
def rs_R009_ueqv_R009NNNYN_partial_21_0035 : Poly :=
[
  term ((20491571961 : Rat) / 1163502905) [(1, 1), (8, 1), (10, 1), (13, 1)],
  term ((20491571961 : Rat) / 1163502905) [(1, 1), (9, 1), (11, 1), (13, 1)],
  term ((-20491571961 : Rat) / 2327005810) [(1, 1), (10, 2), (13, 1)],
  term ((-20491571961 : Rat) / 2327005810) [(1, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 21. -/
theorem rs_R009_ueqv_R009NNNYN_partial_21_0035_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_21_0035
        rs_R009_ueqv_R009NNNYN_generator_21_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_21_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NNNYN_coefficient_21_0036 : Poly :=
[
  term ((-3434228 : Rat) / 231083) [(1, 1), (13, 1), (14, 1)]
]

/-- Partial product 36 for generator 21. -/
def rs_R009_ueqv_R009NNNYN_partial_21_0036 : Poly :=
[
  term ((-6868456 : Rat) / 231083) [(1, 1), (8, 1), (10, 1), (13, 1), (14, 1)],
  term ((-6868456 : Rat) / 231083) [(1, 1), (9, 1), (11, 1), (13, 1), (14, 1)],
  term ((3434228 : Rat) / 231083) [(1, 1), (10, 2), (13, 1), (14, 1)],
  term ((3434228 : Rat) / 231083) [(1, 1), (11, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 21. -/
theorem rs_R009_ueqv_R009NNNYN_partial_21_0036_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_21_0036
        rs_R009_ueqv_R009NNNYN_generator_21_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_21_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NNNYN_coefficient_21_0037 : Poly :=
[
  term ((-26938880 : Rat) / 110226591) [(1, 1), (13, 1), (15, 2)]
]

/-- Partial product 37 for generator 21. -/
def rs_R009_ueqv_R009NNNYN_partial_21_0037 : Poly :=
[
  term ((-53877760 : Rat) / 110226591) [(1, 1), (8, 1), (10, 1), (13, 1), (15, 2)],
  term ((-53877760 : Rat) / 110226591) [(1, 1), (9, 1), (11, 1), (13, 1), (15, 2)],
  term ((26938880 : Rat) / 110226591) [(1, 1), (10, 2), (13, 1), (15, 2)],
  term ((26938880 : Rat) / 110226591) [(1, 1), (11, 2), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 21. -/
theorem rs_R009_ueqv_R009NNNYN_partial_21_0037_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_21_0037
        rs_R009_ueqv_R009NNNYN_generator_21_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_21_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NNNYN_coefficient_21_0038 : Poly :=
[
  term ((1827840 : Rat) / 12247399) [(1, 1), (13, 2), (15, 1)]
]

/-- Partial product 38 for generator 21. -/
def rs_R009_ueqv_R009NNNYN_partial_21_0038 : Poly :=
[
  term ((3655680 : Rat) / 12247399) [(1, 1), (8, 1), (10, 1), (13, 2), (15, 1)],
  term ((3655680 : Rat) / 12247399) [(1, 1), (9, 1), (11, 1), (13, 2), (15, 1)],
  term ((-1827840 : Rat) / 12247399) [(1, 1), (10, 2), (13, 2), (15, 1)],
  term ((-1827840 : Rat) / 12247399) [(1, 1), (11, 2), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 21. -/
theorem rs_R009_ueqv_R009NNNYN_partial_21_0038_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_21_0038
        rs_R009_ueqv_R009NNNYN_generator_21_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_21_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NNNYN_coefficient_21_0039 : Poly :=
[
  term ((198204016 : Rat) / 6239241) [(1, 1), (14, 1), (15, 1)]
]

/-- Partial product 39 for generator 21. -/
def rs_R009_ueqv_R009NNNYN_partial_21_0039 : Poly :=
[
  term ((396408032 : Rat) / 6239241) [(1, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((396408032 : Rat) / 6239241) [(1, 1), (9, 1), (11, 1), (14, 1), (15, 1)],
  term ((-198204016 : Rat) / 6239241) [(1, 1), (10, 2), (14, 1), (15, 1)],
  term ((-198204016 : Rat) / 6239241) [(1, 1), (11, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 21. -/
theorem rs_R009_ueqv_R009NNNYN_partial_21_0039_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_21_0039
        rs_R009_ueqv_R009NNNYN_generator_21_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_21_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NNNYN_coefficient_21_0040 : Poly :=
[
  term ((-55492095074 : Rat) / 3490508715) [(1, 1), (15, 1)]
]

/-- Partial product 40 for generator 21. -/
def rs_R009_ueqv_R009NNNYN_partial_21_0040 : Poly :=
[
  term ((-110984190148 : Rat) / 3490508715) [(1, 1), (8, 1), (10, 1), (15, 1)],
  term ((-110984190148 : Rat) / 3490508715) [(1, 1), (9, 1), (11, 1), (15, 1)],
  term ((55492095074 : Rat) / 3490508715) [(1, 1), (10, 2), (15, 1)],
  term ((55492095074 : Rat) / 3490508715) [(1, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 21. -/
theorem rs_R009_ueqv_R009NNNYN_partial_21_0040_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_21_0040
        rs_R009_ueqv_R009NNNYN_generator_21_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_21_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NNNYN_coefficient_21_0041 : Poly :=
[
  term ((-17582080 : Rat) / 110226591) [(1, 1), (15, 3)]
]

/-- Partial product 41 for generator 21. -/
def rs_R009_ueqv_R009NNNYN_partial_21_0041 : Poly :=
[
  term ((-35164160 : Rat) / 110226591) [(1, 1), (8, 1), (10, 1), (15, 3)],
  term ((-35164160 : Rat) / 110226591) [(1, 1), (9, 1), (11, 1), (15, 3)],
  term ((17582080 : Rat) / 110226591) [(1, 1), (10, 2), (15, 3)],
  term ((17582080 : Rat) / 110226591) [(1, 1), (11, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 21. -/
theorem rs_R009_ueqv_R009NNNYN_partial_21_0041_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_21_0041
        rs_R009_ueqv_R009NNNYN_generator_21_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_21_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NNNYN_coefficient_21_0042 : Poly :=
[
  term ((317542400 : Rat) / 110226591) [(4, 1), (9, 1), (11, 1)]
]

/-- Partial product 42 for generator 21. -/
def rs_R009_ueqv_R009NNNYN_partial_21_0042 : Poly :=
[
  term ((635084800 : Rat) / 110226591) [(4, 1), (8, 1), (9, 1), (10, 1), (11, 1)],
  term ((-317542400 : Rat) / 110226591) [(4, 1), (9, 1), (10, 2), (11, 1)],
  term ((-317542400 : Rat) / 110226591) [(4, 1), (9, 1), (11, 3)],
  term ((635084800 : Rat) / 110226591) [(4, 1), (9, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 21. -/
theorem rs_R009_ueqv_R009NNNYN_partial_21_0042_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_21_0042
        rs_R009_ueqv_R009NNNYN_generator_21_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_21_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NNNYN_coefficient_21_0043 : Poly :=
[
  term ((14884800 : Rat) / 12247399) [(4, 1), (9, 1), (13, 1)]
]

/-- Partial product 43 for generator 21. -/
def rs_R009_ueqv_R009NNNYN_partial_21_0043 : Poly :=
[
  term ((29769600 : Rat) / 12247399) [(4, 1), (8, 1), (9, 1), (10, 1), (13, 1)],
  term ((-14884800 : Rat) / 12247399) [(4, 1), (9, 1), (10, 2), (13, 1)],
  term ((-14884800 : Rat) / 12247399) [(4, 1), (9, 1), (11, 2), (13, 1)],
  term ((29769600 : Rat) / 12247399) [(4, 1), (9, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 21. -/
theorem rs_R009_ueqv_R009NNNYN_partial_21_0043_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_21_0043
        rs_R009_ueqv_R009NNNYN_generator_21_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_21_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NNNYN_coefficient_21_0044 : Poly :=
[
  term ((-286355200 : Rat) / 110226591) [(4, 1), (9, 1), (15, 1)]
]

/-- Partial product 44 for generator 21. -/
def rs_R009_ueqv_R009NNNYN_partial_21_0044 : Poly :=
[
  term ((-572710400 : Rat) / 110226591) [(4, 1), (8, 1), (9, 1), (10, 1), (15, 1)],
  term ((286355200 : Rat) / 110226591) [(4, 1), (9, 1), (10, 2), (15, 1)],
  term ((286355200 : Rat) / 110226591) [(4, 1), (9, 1), (11, 2), (15, 1)],
  term ((-572710400 : Rat) / 110226591) [(4, 1), (9, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 21. -/
theorem rs_R009_ueqv_R009NNNYN_partial_21_0044_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_21_0044
        rs_R009_ueqv_R009NNNYN_generator_21_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_21_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NNNYN_coefficient_21_0045 : Poly :=
[
  term ((49 : Rat) / 67) [(5, 1), (9, 1)]
]

/-- Partial product 45 for generator 21. -/
def rs_R009_ueqv_R009NNNYN_partial_21_0045 : Poly :=
[
  term ((98 : Rat) / 67) [(5, 1), (8, 1), (9, 1), (10, 1)],
  term ((-49 : Rat) / 67) [(5, 1), (9, 1), (10, 2)],
  term ((-49 : Rat) / 67) [(5, 1), (9, 1), (11, 2)],
  term ((98 : Rat) / 67) [(5, 1), (9, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 21. -/
theorem rs_R009_ueqv_R009NNNYN_partial_21_0045_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_21_0045
        rs_R009_ueqv_R009NNNYN_generator_21_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_21_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NNNYN_coefficient_21_0046 : Poly :=
[
  term ((196 : Rat) / 67) [(5, 1), (9, 1), (10, 1)]
]

/-- Partial product 46 for generator 21. -/
def rs_R009_ueqv_R009NNNYN_partial_21_0046 : Poly :=
[
  term ((392 : Rat) / 67) [(5, 1), (8, 1), (9, 1), (10, 2)],
  term ((-196 : Rat) / 67) [(5, 1), (9, 1), (10, 1), (11, 2)],
  term ((-196 : Rat) / 67) [(5, 1), (9, 1), (10, 3)],
  term ((392 : Rat) / 67) [(5, 1), (9, 2), (10, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 21. -/
theorem rs_R009_ueqv_R009NNNYN_partial_21_0046_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_21_0046
        rs_R009_ueqv_R009NNNYN_generator_21_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_21_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NNNYN_coefficient_21_0047 : Poly :=
[
  term ((-196 : Rat) / 67) [(5, 1), (9, 1), (14, 1)]
]

/-- Partial product 47 for generator 21. -/
def rs_R009_ueqv_R009NNNYN_partial_21_0047 : Poly :=
[
  term ((-392 : Rat) / 67) [(5, 1), (8, 1), (9, 1), (10, 1), (14, 1)],
  term ((196 : Rat) / 67) [(5, 1), (9, 1), (10, 2), (14, 1)],
  term ((196 : Rat) / 67) [(5, 1), (9, 1), (11, 2), (14, 1)],
  term ((-392 : Rat) / 67) [(5, 1), (9, 2), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 21. -/
theorem rs_R009_ueqv_R009NNNYN_partial_21_0047_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_21_0047
        rs_R009_ueqv_R009NNNYN_generator_21_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_21_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NNNYN_coefficient_21_0048 : Poly :=
[
  term ((-178697921024 : Rat) / 10471526145) [(5, 1), (10, 1), (11, 1)]
]

/-- Partial product 48 for generator 21. -/
def rs_R009_ueqv_R009NNNYN_partial_21_0048 : Poly :=
[
  term ((-357395842048 : Rat) / 10471526145) [(5, 1), (8, 1), (10, 2), (11, 1)],
  term ((-357395842048 : Rat) / 10471526145) [(5, 1), (9, 1), (10, 1), (11, 2)],
  term ((178697921024 : Rat) / 10471526145) [(5, 1), (10, 1), (11, 3)],
  term ((178697921024 : Rat) / 10471526145) [(5, 1), (10, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 21. -/
theorem rs_R009_ueqv_R009NNNYN_partial_21_0048_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_21_0048
        rs_R009_ueqv_R009NNNYN_generator_21_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_21_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NNNYN_coefficient_21_0049 : Poly :=
[
  term ((-8376465048 : Rat) / 1163502905) [(5, 1), (10, 1), (13, 1)]
]

/-- Partial product 49 for generator 21. -/
def rs_R009_ueqv_R009NNNYN_partial_21_0049 : Poly :=
[
  term ((-16752930096 : Rat) / 1163502905) [(5, 1), (8, 1), (10, 2), (13, 1)],
  term ((-16752930096 : Rat) / 1163502905) [(5, 1), (9, 1), (10, 1), (11, 1), (13, 1)],
  term ((8376465048 : Rat) / 1163502905) [(5, 1), (10, 1), (11, 2), (13, 1)],
  term ((8376465048 : Rat) / 1163502905) [(5, 1), (10, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 21. -/
theorem rs_R009_ueqv_R009NNNYN_partial_21_0049_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_21_0049
        rs_R009_ueqv_R009NNNYN_generator_21_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_21_0049 := by
  native_decide

/-- Coefficient term 50 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NNNYN_coefficient_21_0050 : Poly :=
[
  term ((171358272772 : Rat) / 10471526145) [(5, 1), (10, 1), (15, 1)]
]

/-- Partial product 50 for generator 21. -/
def rs_R009_ueqv_R009NNNYN_partial_21_0050 : Poly :=
[
  term ((342716545544 : Rat) / 10471526145) [(5, 1), (8, 1), (10, 2), (15, 1)],
  term ((342716545544 : Rat) / 10471526145) [(5, 1), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((-171358272772 : Rat) / 10471526145) [(5, 1), (10, 1), (11, 2), (15, 1)],
  term ((-171358272772 : Rat) / 10471526145) [(5, 1), (10, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 50 for generator 21. -/
theorem rs_R009_ueqv_R009NNNYN_partial_21_0050_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_21_0050
        rs_R009_ueqv_R009NNNYN_generator_21_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_21_0050 := by
  native_decide

/-- Coefficient term 51 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NNNYN_coefficient_21_0051 : Poly :=
[
  term ((199641255296 : Rat) / 31414578435) [(5, 1), (11, 1)]
]

/-- Partial product 51 for generator 21. -/
def rs_R009_ueqv_R009NNNYN_partial_21_0051 : Poly :=
[
  term ((399282510592 : Rat) / 31414578435) [(5, 1), (8, 1), (10, 1), (11, 1)],
  term ((399282510592 : Rat) / 31414578435) [(5, 1), (9, 1), (11, 2)],
  term ((-199641255296 : Rat) / 31414578435) [(5, 1), (10, 2), (11, 1)],
  term ((-199641255296 : Rat) / 31414578435) [(5, 1), (11, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 51 for generator 21. -/
theorem rs_R009_ueqv_R009NNNYN_partial_21_0051_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_21_0051
        rs_R009_ueqv_R009NNNYN_generator_21_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_21_0051 := by
  native_decide

/-- Coefficient term 52 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NNNYN_coefficient_21_0052 : Poly :=
[
  term ((-77987840 : Rat) / 110226591) [(5, 1), (11, 1), (12, 1)]
]

/-- Partial product 52 for generator 21. -/
def rs_R009_ueqv_R009NNNYN_partial_21_0052 : Poly :=
[
  term ((-155975680 : Rat) / 110226591) [(5, 1), (8, 1), (10, 1), (11, 1), (12, 1)],
  term ((-155975680 : Rat) / 110226591) [(5, 1), (9, 1), (11, 2), (12, 1)],
  term ((77987840 : Rat) / 110226591) [(5, 1), (10, 2), (11, 1), (12, 1)],
  term ((77987840 : Rat) / 110226591) [(5, 1), (11, 3), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 52 for generator 21. -/
theorem rs_R009_ueqv_R009NNNYN_partial_21_0052_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_21_0052
        rs_R009_ueqv_R009NNNYN_generator_21_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_21_0052 := by
  native_decide

/-- Coefficient term 53 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NNNYN_coefficient_21_0053 : Poly :=
[
  term ((194969600 : Rat) / 110226591) [(5, 1), (11, 1), (12, 1), (14, 1)]
]

/-- Partial product 53 for generator 21. -/
def rs_R009_ueqv_R009NNNYN_partial_21_0053 : Poly :=
[
  term ((389939200 : Rat) / 110226591) [(5, 1), (8, 1), (10, 1), (11, 1), (12, 1), (14, 1)],
  term ((389939200 : Rat) / 110226591) [(5, 1), (9, 1), (11, 2), (12, 1), (14, 1)],
  term ((-194969600 : Rat) / 110226591) [(5, 1), (10, 2), (11, 1), (12, 1), (14, 1)],
  term ((-194969600 : Rat) / 110226591) [(5, 1), (11, 3), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 53 for generator 21. -/
theorem rs_R009_ueqv_R009NNNYN_partial_21_0053_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_21_0053
        rs_R009_ueqv_R009NNNYN_generator_21_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_21_0053 := by
  native_decide

/-- Coefficient term 54 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NNNYN_coefficient_21_0054 : Poly :=
[
  term ((19496960 : Rat) / 36742197) [(5, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 54 for generator 21. -/
def rs_R009_ueqv_R009NNNYN_partial_21_0054 : Poly :=
[
  term ((38993920 : Rat) / 36742197) [(5, 1), (8, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((38993920 : Rat) / 36742197) [(5, 1), (9, 1), (11, 2), (13, 1), (15, 1)],
  term ((-19496960 : Rat) / 36742197) [(5, 1), (10, 2), (11, 1), (13, 1), (15, 1)],
  term ((-19496960 : Rat) / 36742197) [(5, 1), (11, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 54 for generator 21. -/
theorem rs_R009_ueqv_R009NNNYN_partial_21_0054_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_21_0054
        rs_R009_ueqv_R009NNNYN_generator_21_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_21_0054 := by
  native_decide

/-- Coefficient term 55 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NNNYN_coefficient_21_0055 : Poly :=
[
  term ((-536166400 : Rat) / 330679773) [(5, 1), (11, 1), (14, 1)]
]

/-- Partial product 55 for generator 21. -/
def rs_R009_ueqv_R009NNNYN_partial_21_0055 : Poly :=
[
  term ((-1072332800 : Rat) / 330679773) [(5, 1), (8, 1), (10, 1), (11, 1), (14, 1)],
  term ((-1072332800 : Rat) / 330679773) [(5, 1), (9, 1), (11, 2), (14, 1)],
  term ((536166400 : Rat) / 330679773) [(5, 1), (10, 2), (11, 1), (14, 1)],
  term ((536166400 : Rat) / 330679773) [(5, 1), (11, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 55 for generator 21. -/
theorem rs_R009_ueqv_R009NNNYN_partial_21_0055_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_21_0055
        rs_R009_ueqv_R009NNNYN_generator_21_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_21_0055 := by
  native_decide

/-- Coefficient term 56 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NNNYN_coefficient_21_0056 : Poly :=
[
  term ((9748480 : Rat) / 36742197) [(5, 1), (11, 1), (14, 2)]
]

/-- Partial product 56 for generator 21. -/
def rs_R009_ueqv_R009NNNYN_partial_21_0056 : Poly :=
[
  term ((19496960 : Rat) / 36742197) [(5, 1), (8, 1), (10, 1), (11, 1), (14, 2)],
  term ((19496960 : Rat) / 36742197) [(5, 1), (9, 1), (11, 2), (14, 2)],
  term ((-9748480 : Rat) / 36742197) [(5, 1), (10, 2), (11, 1), (14, 2)],
  term ((-9748480 : Rat) / 36742197) [(5, 1), (11, 3), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 56 for generator 21. -/
theorem rs_R009_ueqv_R009NNNYN_partial_21_0056_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_21_0056
        rs_R009_ueqv_R009NNNYN_generator_21_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_21_0056 := by
  native_decide

/-- Coefficient term 57 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NNNYN_coefficient_21_0057 : Poly :=
[
  term ((-9748480 : Rat) / 36742197) [(5, 1), (11, 1), (15, 2)]
]

/-- Partial product 57 for generator 21. -/
def rs_R009_ueqv_R009NNNYN_partial_21_0057 : Poly :=
[
  term ((-19496960 : Rat) / 36742197) [(5, 1), (8, 1), (10, 1), (11, 1), (15, 2)],
  term ((-19496960 : Rat) / 36742197) [(5, 1), (9, 1), (11, 2), (15, 2)],
  term ((9748480 : Rat) / 36742197) [(5, 1), (10, 2), (11, 1), (15, 2)],
  term ((9748480 : Rat) / 36742197) [(5, 1), (11, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 57 for generator 21. -/
theorem rs_R009_ueqv_R009NNNYN_partial_21_0057_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_21_0057
        rs_R009_ueqv_R009NNNYN_generator_21_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_21_0057 := by
  native_decide

/-- Coefficient term 58 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NNNYN_coefficient_21_0058 : Poly :=
[
  term ((-3655680 : Rat) / 12247399) [(5, 1), (12, 1), (13, 1)]
]

/-- Partial product 58 for generator 21. -/
def rs_R009_ueqv_R009NNNYN_partial_21_0058 : Poly :=
[
  term ((-7311360 : Rat) / 12247399) [(5, 1), (8, 1), (10, 1), (12, 1), (13, 1)],
  term ((-7311360 : Rat) / 12247399) [(5, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((3655680 : Rat) / 12247399) [(5, 1), (10, 2), (12, 1), (13, 1)],
  term ((3655680 : Rat) / 12247399) [(5, 1), (11, 2), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 58 for generator 21. -/
theorem rs_R009_ueqv_R009NNNYN_partial_21_0058_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_21_0058
        rs_R009_ueqv_R009NNNYN_generator_21_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_21_0058 := by
  native_decide

/-- Coefficient term 59 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NNNYN_coefficient_21_0059 : Poly :=
[
  term ((9139200 : Rat) / 12247399) [(5, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 59 for generator 21. -/
def rs_R009_ueqv_R009NNNYN_partial_21_0059 : Poly :=
[
  term ((18278400 : Rat) / 12247399) [(5, 1), (8, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((18278400 : Rat) / 12247399) [(5, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-9139200 : Rat) / 12247399) [(5, 1), (10, 2), (12, 1), (13, 1), (14, 1)],
  term ((-9139200 : Rat) / 12247399) [(5, 1), (11, 2), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 59 for generator 21. -/
theorem rs_R009_ueqv_R009NNNYN_partial_21_0059_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_21_0059
        rs_R009_ueqv_R009NNNYN_generator_21_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_21_0059 := by
  native_decide

/-- Coefficient term 60 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NNNYN_coefficient_21_0060 : Poly :=
[
  term ((-175820800 : Rat) / 110226591) [(5, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 60 for generator 21. -/
def rs_R009_ueqv_R009NNNYN_partial_21_0060 : Poly :=
[
  term ((-351641600 : Rat) / 110226591) [(5, 1), (8, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-351641600 : Rat) / 110226591) [(5, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((175820800 : Rat) / 110226591) [(5, 1), (10, 2), (12, 1), (14, 1), (15, 1)],
  term ((175820800 : Rat) / 110226591) [(5, 1), (11, 2), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 60 for generator 21. -/
theorem rs_R009_ueqv_R009NNNYN_partial_21_0060_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_21_0060
        rs_R009_ueqv_R009NNNYN_generator_21_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_21_0060 := by
  native_decide

/-- Coefficient term 61 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NNNYN_coefficient_21_0061 : Poly :=
[
  term ((70328320 : Rat) / 110226591) [(5, 1), (12, 1), (15, 1)]
]

/-- Partial product 61 for generator 21. -/
def rs_R009_ueqv_R009NNNYN_partial_21_0061 : Poly :=
[
  term ((140656640 : Rat) / 110226591) [(5, 1), (8, 1), (10, 1), (12, 1), (15, 1)],
  term ((140656640 : Rat) / 110226591) [(5, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((-70328320 : Rat) / 110226591) [(5, 1), (10, 2), (12, 1), (15, 1)],
  term ((-70328320 : Rat) / 110226591) [(5, 1), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 61 for generator 21. -/
theorem rs_R009_ueqv_R009NNNYN_partial_21_0061_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_21_0061
        rs_R009_ueqv_R009NNNYN_generator_21_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_21_0061 := by
  native_decide

/-- Coefficient term 62 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NNNYN_coefficient_21_0062 : Poly :=
[
  term ((3119394614 : Rat) / 1163502905) [(5, 1), (13, 1)]
]

/-- Partial product 62 for generator 21. -/
def rs_R009_ueqv_R009NNNYN_partial_21_0062 : Poly :=
[
  term ((6238789228 : Rat) / 1163502905) [(5, 1), (8, 1), (10, 1), (13, 1)],
  term ((6238789228 : Rat) / 1163502905) [(5, 1), (9, 1), (11, 1), (13, 1)],
  term ((-3119394614 : Rat) / 1163502905) [(5, 1), (10, 2), (13, 1)],
  term ((-3119394614 : Rat) / 1163502905) [(5, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 62 for generator 21. -/
theorem rs_R009_ueqv_R009NNNYN_partial_21_0062_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_21_0062
        rs_R009_ueqv_R009NNNYN_generator_21_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_21_0062 := by
  native_decide

/-- Coefficient term 63 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NNNYN_coefficient_21_0063 : Poly :=
[
  term ((-8377600 : Rat) / 12247399) [(5, 1), (13, 1), (14, 1)]
]

/-- Partial product 63 for generator 21. -/
def rs_R009_ueqv_R009NNNYN_partial_21_0063 : Poly :=
[
  term ((-16755200 : Rat) / 12247399) [(5, 1), (8, 1), (10, 1), (13, 1), (14, 1)],
  term ((-16755200 : Rat) / 12247399) [(5, 1), (9, 1), (11, 1), (13, 1), (14, 1)],
  term ((8377600 : Rat) / 12247399) [(5, 1), (10, 2), (13, 1), (14, 1)],
  term ((8377600 : Rat) / 12247399) [(5, 1), (11, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 63 for generator 21. -/
theorem rs_R009_ueqv_R009NNNYN_partial_21_0063_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_21_0063
        rs_R009_ueqv_R009NNNYN_generator_21_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_21_0063 := by
  native_decide

/-- Coefficient term 64 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NNNYN_coefficient_21_0064 : Poly :=
[
  term ((1370880 : Rat) / 12247399) [(5, 1), (13, 1), (14, 2)]
]

/-- Partial product 64 for generator 21. -/
def rs_R009_ueqv_R009NNNYN_partial_21_0064 : Poly :=
[
  term ((2741760 : Rat) / 12247399) [(5, 1), (8, 1), (10, 1), (13, 1), (14, 2)],
  term ((2741760 : Rat) / 12247399) [(5, 1), (9, 1), (11, 1), (13, 1), (14, 2)],
  term ((-1370880 : Rat) / 12247399) [(5, 1), (10, 2), (13, 1), (14, 2)],
  term ((-1370880 : Rat) / 12247399) [(5, 1), (11, 2), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 64 for generator 21. -/
theorem rs_R009_ueqv_R009NNNYN_partial_21_0064_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_21_0064
        rs_R009_ueqv_R009NNNYN_generator_21_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_21_0064 := by
  native_decide

/-- Coefficient term 65 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NNNYN_coefficient_21_0065 : Poly :=
[
  term ((-21694720 : Rat) / 36742197) [(5, 1), (13, 1), (15, 2)]
]

/-- Partial product 65 for generator 21. -/
def rs_R009_ueqv_R009NNNYN_partial_21_0065 : Poly :=
[
  term ((-43389440 : Rat) / 36742197) [(5, 1), (8, 1), (10, 1), (13, 1), (15, 2)],
  term ((-43389440 : Rat) / 36742197) [(5, 1), (9, 1), (11, 1), (13, 1), (15, 2)],
  term ((21694720 : Rat) / 36742197) [(5, 1), (10, 2), (13, 1), (15, 2)],
  term ((21694720 : Rat) / 36742197) [(5, 1), (11, 2), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 65 for generator 21. -/
theorem rs_R009_ueqv_R009NNNYN_partial_21_0065_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_21_0065
        rs_R009_ueqv_R009NNNYN_generator_21_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_21_0065 := by
  native_decide

/-- Coefficient term 66 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NNNYN_coefficient_21_0066 : Poly :=
[
  term ((2741760 : Rat) / 12247399) [(5, 1), (13, 2), (15, 1)]
]

/-- Partial product 66 for generator 21. -/
def rs_R009_ueqv_R009NNNYN_partial_21_0066 : Poly :=
[
  term ((5483520 : Rat) / 12247399) [(5, 1), (8, 1), (10, 1), (13, 2), (15, 1)],
  term ((5483520 : Rat) / 12247399) [(5, 1), (9, 1), (11, 1), (13, 2), (15, 1)],
  term ((-2741760 : Rat) / 12247399) [(5, 1), (10, 2), (13, 2), (15, 1)],
  term ((-2741760 : Rat) / 12247399) [(5, 1), (11, 2), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 66 for generator 21. -/
theorem rs_R009_ueqv_R009NNNYN_partial_21_0066_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_21_0066
        rs_R009_ueqv_R009NNNYN_generator_21_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_21_0066 := by
  native_decide

/-- Coefficient term 67 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NNNYN_coefficient_21_0067 : Poly :=
[
  term ((161053292 : Rat) / 330679773) [(5, 1), (14, 1), (15, 1)]
]

/-- Partial product 67 for generator 21. -/
def rs_R009_ueqv_R009NNNYN_partial_21_0067 : Poly :=
[
  term ((322106584 : Rat) / 330679773) [(5, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((322106584 : Rat) / 330679773) [(5, 1), (9, 1), (11, 1), (14, 1), (15, 1)],
  term ((-161053292 : Rat) / 330679773) [(5, 1), (10, 2), (14, 1), (15, 1)],
  term ((-161053292 : Rat) / 330679773) [(5, 1), (11, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 67 for generator 21. -/
theorem rs_R009_ueqv_R009NNNYN_partial_21_0067_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_21_0067
        rs_R009_ueqv_R009NNNYN_generator_21_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_21_0067 := by
  native_decide

/-- Coefficient term 68 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NNNYN_coefficient_21_0068 : Poly :=
[
  term ((-8791040 : Rat) / 36742197) [(5, 1), (14, 2), (15, 1)]
]

/-- Partial product 68 for generator 21. -/
def rs_R009_ueqv_R009NNNYN_partial_21_0068 : Poly :=
[
  term ((-17582080 : Rat) / 36742197) [(5, 1), (8, 1), (10, 1), (14, 2), (15, 1)],
  term ((-17582080 : Rat) / 36742197) [(5, 1), (9, 1), (11, 1), (14, 2), (15, 1)],
  term ((8791040 : Rat) / 36742197) [(5, 1), (10, 2), (14, 2), (15, 1)],
  term ((8791040 : Rat) / 36742197) [(5, 1), (11, 2), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 68 for generator 21. -/
theorem rs_R009_ueqv_R009NNNYN_partial_21_0068_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_21_0068
        rs_R009_ueqv_R009NNNYN_generator_21_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_21_0068 := by
  native_decide

/-- Coefficient term 69 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NNNYN_coefficient_21_0069 : Poly :=
[
  term ((-172375351693 : Rat) / 31414578435) [(5, 1), (15, 1)]
]

/-- Partial product 69 for generator 21. -/
def rs_R009_ueqv_R009NNNYN_partial_21_0069 : Poly :=
[
  term ((-344750703386 : Rat) / 31414578435) [(5, 1), (8, 1), (10, 1), (15, 1)],
  term ((-344750703386 : Rat) / 31414578435) [(5, 1), (9, 1), (11, 1), (15, 1)],
  term ((172375351693 : Rat) / 31414578435) [(5, 1), (10, 2), (15, 1)],
  term ((172375351693 : Rat) / 31414578435) [(5, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 69 for generator 21. -/
theorem rs_R009_ueqv_R009NNNYN_partial_21_0069_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_21_0069
        rs_R009_ueqv_R009NNNYN_generator_21_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_21_0069 := by
  native_decide

/-- Coefficient term 70 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NNNYN_coefficient_21_0070 : Poly :=
[
  term ((8791040 : Rat) / 36742197) [(5, 1), (15, 3)]
]

/-- Partial product 70 for generator 21. -/
def rs_R009_ueqv_R009NNNYN_partial_21_0070 : Poly :=
[
  term ((17582080 : Rat) / 36742197) [(5, 1), (8, 1), (10, 1), (15, 3)],
  term ((17582080 : Rat) / 36742197) [(5, 1), (9, 1), (11, 1), (15, 3)],
  term ((-8791040 : Rat) / 36742197) [(5, 1), (10, 2), (15, 3)],
  term ((-8791040 : Rat) / 36742197) [(5, 1), (11, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 70 for generator 21. -/
theorem rs_R009_ueqv_R009NNNYN_partial_21_0070_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_21_0070
        rs_R009_ueqv_R009NNNYN_generator_21_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_21_0070 := by
  native_decide

/-- Coefficient term 71 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NNNYN_coefficient_21_0071 : Poly :=
[
  term ((165906242432 : Rat) / 31414578435) [(7, 1), (11, 1)]
]

/-- Partial product 71 for generator 21. -/
def rs_R009_ueqv_R009NNNYN_partial_21_0071 : Poly :=
[
  term ((331812484864 : Rat) / 31414578435) [(7, 1), (8, 1), (10, 1), (11, 1)],
  term ((331812484864 : Rat) / 31414578435) [(7, 1), (9, 1), (11, 2)],
  term ((-165906242432 : Rat) / 31414578435) [(7, 1), (10, 2), (11, 1)],
  term ((-165906242432 : Rat) / 31414578435) [(7, 1), (11, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 71 for generator 21. -/
theorem rs_R009_ueqv_R009NNNYN_partial_21_0071_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_21_0071
        rs_R009_ueqv_R009NNNYN_generator_21_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_21_0071 := by
  native_decide

/-- Coefficient term 72 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NNNYN_coefficient_21_0072 : Poly :=
[
  term ((2592285038 : Rat) / 1163502905) [(7, 1), (13, 1)]
]

/-- Partial product 72 for generator 21. -/
def rs_R009_ueqv_R009NNNYN_partial_21_0072 : Poly :=
[
  term ((5184570076 : Rat) / 1163502905) [(7, 1), (8, 1), (10, 1), (13, 1)],
  term ((5184570076 : Rat) / 1163502905) [(7, 1), (9, 1), (11, 1), (13, 1)],
  term ((-2592285038 : Rat) / 1163502905) [(7, 1), (10, 2), (13, 1)],
  term ((-2592285038 : Rat) / 1163502905) [(7, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 72 for generator 21. -/
theorem rs_R009_ueqv_R009NNNYN_partial_21_0072_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_21_0072
        rs_R009_ueqv_R009NNNYN_generator_21_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_21_0072 := by
  native_decide

/-- Coefficient term 73 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NNNYN_coefficient_21_0073 : Poly :=
[
  term ((-149611879336 : Rat) / 31414578435) [(7, 1), (15, 1)]
]

/-- Partial product 73 for generator 21. -/
def rs_R009_ueqv_R009NNNYN_partial_21_0073 : Poly :=
[
  term ((-299223758672 : Rat) / 31414578435) [(7, 1), (8, 1), (10, 1), (15, 1)],
  term ((-299223758672 : Rat) / 31414578435) [(7, 1), (9, 1), (11, 1), (15, 1)],
  term ((149611879336 : Rat) / 31414578435) [(7, 1), (10, 2), (15, 1)],
  term ((149611879336 : Rat) / 31414578435) [(7, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 73 for generator 21. -/
theorem rs_R009_ueqv_R009NNNYN_partial_21_0073_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_21_0073
        rs_R009_ueqv_R009NNNYN_generator_21_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_21_0073 := by
  native_decide

/-- Coefficient term 74 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NNNYN_coefficient_21_0074 : Poly :=
[
  term ((2612209713344 : Rat) / 94243735305) [(9, 1), (10, 1), (11, 1)]
]

/-- Partial product 74 for generator 21. -/
def rs_R009_ueqv_R009NNNYN_partial_21_0074 : Poly :=
[
  term ((5224419426688 : Rat) / 94243735305) [(8, 1), (9, 1), (10, 2), (11, 1)],
  term ((-2612209713344 : Rat) / 94243735305) [(9, 1), (10, 1), (11, 3)],
  term ((-2612209713344 : Rat) / 94243735305) [(9, 1), (10, 3), (11, 1)],
  term ((5224419426688 : Rat) / 94243735305) [(9, 2), (10, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 74 for generator 21. -/
theorem rs_R009_ueqv_R009NNNYN_partial_21_0074_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_21_0074
        rs_R009_ueqv_R009NNNYN_generator_21_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_21_0074 := by
  native_decide

/-- Coefficient term 75 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NNNYN_coefficient_21_0075 : Poly :=
[
  term ((40815776771 : Rat) / 3490508715) [(9, 1), (10, 1), (13, 1)]
]

/-- Partial product 75 for generator 21. -/
def rs_R009_ueqv_R009NNNYN_partial_21_0075 : Poly :=
[
  term ((81631553542 : Rat) / 3490508715) [(8, 1), (9, 1), (10, 2), (13, 1)],
  term ((-40815776771 : Rat) / 3490508715) [(9, 1), (10, 1), (11, 2), (13, 1)],
  term ((-40815776771 : Rat) / 3490508715) [(9, 1), (10, 3), (13, 1)],
  term ((81631553542 : Rat) / 3490508715) [(9, 2), (10, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 75 for generator 21. -/
theorem rs_R009_ueqv_R009NNNYN_partial_21_0075_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_21_0075
        rs_R009_ueqv_R009NNNYN_generator_21_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_21_0075 := by
  native_decide

/-- Coefficient term 76 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NNNYN_coefficient_21_0076 : Poly :=
[
  term ((-2401603084102 : Rat) / 94243735305) [(9, 1), (10, 1), (15, 1)]
]

/-- Partial product 76 for generator 21. -/
def rs_R009_ueqv_R009NNNYN_partial_21_0076 : Poly :=
[
  term ((-4803206168204 : Rat) / 94243735305) [(8, 1), (9, 1), (10, 2), (15, 1)],
  term ((2401603084102 : Rat) / 94243735305) [(9, 1), (10, 1), (11, 2), (15, 1)],
  term ((2401603084102 : Rat) / 94243735305) [(9, 1), (10, 3), (15, 1)],
  term ((-4803206168204 : Rat) / 94243735305) [(9, 2), (10, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 76 for generator 21. -/
theorem rs_R009_ueqv_R009NNNYN_partial_21_0076_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_21_0076
        rs_R009_ueqv_R009NNNYN_generator_21_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_21_0076 := by
  native_decide

/-- Coefficient term 77 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NNNYN_coefficient_21_0077 : Poly :=
[
  term ((-118586450791 : Rat) / 10471526145) [(9, 1), (11, 1)]
]

/-- Partial product 77 for generator 21. -/
def rs_R009_ueqv_R009NNNYN_partial_21_0077 : Poly :=
[
  term ((-237172901582 : Rat) / 10471526145) [(8, 1), (9, 1), (10, 1), (11, 1)],
  term ((118586450791 : Rat) / 10471526145) [(9, 1), (10, 2), (11, 1)],
  term ((118586450791 : Rat) / 10471526145) [(9, 1), (11, 3)],
  term ((-237172901582 : Rat) / 10471526145) [(9, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 77 for generator 21. -/
theorem rs_R009_ueqv_R009NNNYN_partial_21_0077_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_21_0077
        rs_R009_ueqv_R009NNNYN_generator_21_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_21_0077 := by
  native_decide

/-- Coefficient term 78 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NNNYN_coefficient_21_0078 : Poly :=
[
  term ((19496960 : Rat) / 36742197) [(9, 1), (11, 1), (12, 1)]
]

/-- Partial product 78 for generator 21. -/
def rs_R009_ueqv_R009NNNYN_partial_21_0078 : Poly :=
[
  term ((38993920 : Rat) / 36742197) [(8, 1), (9, 1), (10, 1), (11, 1), (12, 1)],
  term ((-19496960 : Rat) / 36742197) [(9, 1), (10, 2), (11, 1), (12, 1)],
  term ((-19496960 : Rat) / 36742197) [(9, 1), (11, 3), (12, 1)],
  term ((38993920 : Rat) / 36742197) [(9, 2), (11, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 78 for generator 21. -/
theorem rs_R009_ueqv_R009NNNYN_partial_21_0078_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_21_0078
        rs_R009_ueqv_R009NNNYN_generator_21_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_21_0078 := by
  native_decide

/-- Coefficient term 79 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NNNYN_coefficient_21_0079 : Poly :=
[
  term ((-97484800 : Rat) / 110226591) [(9, 1), (11, 1), (12, 1), (14, 1)]
]

/-- Partial product 79 for generator 21. -/
def rs_R009_ueqv_R009NNNYN_partial_21_0079 : Poly :=
[
  term ((-194969600 : Rat) / 110226591) [(8, 1), (9, 1), (10, 1), (11, 1), (12, 1), (14, 1)],
  term ((97484800 : Rat) / 110226591) [(9, 1), (10, 2), (11, 1), (12, 1), (14, 1)],
  term ((97484800 : Rat) / 110226591) [(9, 1), (11, 3), (12, 1), (14, 1)],
  term ((-194969600 : Rat) / 110226591) [(9, 2), (11, 2), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 79 for generator 21. -/
theorem rs_R009_ueqv_R009NNNYN_partial_21_0079_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_21_0079
        rs_R009_ueqv_R009NNNYN_generator_21_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_21_0079 := by
  native_decide

/-- Coefficient term 80 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NNNYN_coefficient_21_0080 : Poly :=
[
  term ((2132480 : Rat) / 110226591) [(9, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 80 for generator 21. -/
def rs_R009_ueqv_R009NNNYN_partial_21_0080 : Poly :=
[
  term ((4264960 : Rat) / 110226591) [(8, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-2132480 : Rat) / 110226591) [(9, 1), (10, 2), (11, 1), (13, 1), (15, 1)],
  term ((-2132480 : Rat) / 110226591) [(9, 1), (11, 3), (13, 1), (15, 1)],
  term ((4264960 : Rat) / 110226591) [(9, 2), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 80 for generator 21. -/
theorem rs_R009_ueqv_R009NNNYN_partial_21_0080_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_21_0080
        rs_R009_ueqv_R009NNNYN_generator_21_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_21_0080 := by
  native_decide

/-- Coefficient term 81 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NNNYN_coefficient_21_0081 : Poly :=
[
  term ((238837760 : Rat) / 330679773) [(9, 1), (11, 1), (14, 1)]
]

/-- Partial product 81 for generator 21. -/
def rs_R009_ueqv_R009NNNYN_partial_21_0081 : Poly :=
[
  term ((477675520 : Rat) / 330679773) [(8, 1), (9, 1), (10, 1), (11, 1), (14, 1)],
  term ((-238837760 : Rat) / 330679773) [(9, 1), (10, 2), (11, 1), (14, 1)],
  term ((-238837760 : Rat) / 330679773) [(9, 1), (11, 3), (14, 1)],
  term ((477675520 : Rat) / 330679773) [(9, 2), (11, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 81 for generator 21. -/
theorem rs_R009_ueqv_R009NNNYN_partial_21_0081_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_21_0081
        rs_R009_ueqv_R009NNNYN_generator_21_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_21_0081 := by
  native_decide

/-- Coefficient term 82 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NNNYN_coefficient_21_0082 : Poly :=
[
  term ((-4874240 : Rat) / 36742197) [(9, 1), (11, 1), (14, 2)]
]

/-- Partial product 82 for generator 21. -/
def rs_R009_ueqv_R009NNNYN_partial_21_0082 : Poly :=
[
  term ((-9748480 : Rat) / 36742197) [(8, 1), (9, 1), (10, 1), (11, 1), (14, 2)],
  term ((4874240 : Rat) / 36742197) [(9, 1), (10, 2), (11, 1), (14, 2)],
  term ((4874240 : Rat) / 36742197) [(9, 1), (11, 3), (14, 2)],
  term ((-9748480 : Rat) / 36742197) [(9, 2), (11, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 82 for generator 21. -/
theorem rs_R009_ueqv_R009NNNYN_partial_21_0082_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_21_0082
        rs_R009_ueqv_R009NNNYN_generator_21_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_21_0082 := by
  native_decide

/-- Coefficient term 83 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NNNYN_coefficient_21_0083 : Poly :=
[
  term ((-32552960 : Rat) / 36742197) [(9, 1), (11, 1), (15, 2)]
]

/-- Partial product 83 for generator 21. -/
def rs_R009_ueqv_R009NNNYN_partial_21_0083 : Poly :=
[
  term ((-65105920 : Rat) / 36742197) [(8, 1), (9, 1), (10, 1), (11, 1), (15, 2)],
  term ((32552960 : Rat) / 36742197) [(9, 1), (10, 2), (11, 1), (15, 2)],
  term ((32552960 : Rat) / 36742197) [(9, 1), (11, 3), (15, 2)],
  term ((-65105920 : Rat) / 36742197) [(9, 2), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 83 for generator 21. -/
theorem rs_R009_ueqv_R009NNNYN_partial_21_0083_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_21_0083
        rs_R009_ueqv_R009NNNYN_generator_21_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_21_0083 := by
  native_decide

/-- Coefficient term 84 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NNNYN_coefficient_21_0084 : Poly :=
[
  term ((97484800 : Rat) / 110226591) [(9, 1), (11, 2), (15, 1)]
]

/-- Partial product 84 for generator 21. -/
def rs_R009_ueqv_R009NNNYN_partial_21_0084 : Poly :=
[
  term ((194969600 : Rat) / 110226591) [(8, 1), (9, 1), (10, 1), (11, 2), (15, 1)],
  term ((-97484800 : Rat) / 110226591) [(9, 1), (10, 2), (11, 2), (15, 1)],
  term ((-97484800 : Rat) / 110226591) [(9, 1), (11, 4), (15, 1)],
  term ((194969600 : Rat) / 110226591) [(9, 2), (11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 84 for generator 21. -/
theorem rs_R009_ueqv_R009NNNYN_partial_21_0084_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_21_0084
        rs_R009_ueqv_R009NNNYN_generator_21_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_21_0084 := by
  native_decide

/-- Coefficient term 85 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NNNYN_coefficient_21_0085 : Poly :=
[
  term ((2741760 : Rat) / 12247399) [(9, 1), (12, 1), (13, 1)]
]

/-- Partial product 85 for generator 21. -/
def rs_R009_ueqv_R009NNNYN_partial_21_0085 : Poly :=
[
  term ((5483520 : Rat) / 12247399) [(8, 1), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((-2741760 : Rat) / 12247399) [(9, 1), (10, 2), (12, 1), (13, 1)],
  term ((-2741760 : Rat) / 12247399) [(9, 1), (11, 2), (12, 1), (13, 1)],
  term ((5483520 : Rat) / 12247399) [(9, 2), (11, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 85 for generator 21. -/
theorem rs_R009_ueqv_R009NNNYN_partial_21_0085_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_21_0085
        rs_R009_ueqv_R009NNNYN_generator_21_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_21_0085 := by
  native_decide

/-- Coefficient term 86 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NNNYN_coefficient_21_0086 : Poly :=
[
  term ((-4569600 : Rat) / 12247399) [(9, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 86 for generator 21. -/
def rs_R009_ueqv_R009NNNYN_partial_21_0086 : Poly :=
[
  term ((-9139200 : Rat) / 12247399) [(8, 1), (9, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((4569600 : Rat) / 12247399) [(9, 1), (10, 2), (12, 1), (13, 1), (14, 1)],
  term ((4569600 : Rat) / 12247399) [(9, 1), (11, 2), (12, 1), (13, 1), (14, 1)],
  term ((-9139200 : Rat) / 12247399) [(9, 2), (11, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 86 for generator 21. -/
theorem rs_R009_ueqv_R009NNNYN_partial_21_0086_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_21_0086
        rs_R009_ueqv_R009NNNYN_generator_21_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_21_0086 := by
  native_decide

/-- Coefficient term 87 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NNNYN_coefficient_21_0087 : Poly :=
[
  term ((87910400 : Rat) / 110226591) [(9, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 87 for generator 21. -/
def rs_R009_ueqv_R009NNNYN_partial_21_0087 : Poly :=
[
  term ((175820800 : Rat) / 110226591) [(8, 1), (9, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-87910400 : Rat) / 110226591) [(9, 1), (10, 2), (12, 1), (14, 1), (15, 1)],
  term ((-87910400 : Rat) / 110226591) [(9, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((175820800 : Rat) / 110226591) [(9, 2), (11, 1), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 87 for generator 21. -/
theorem rs_R009_ueqv_R009NNNYN_partial_21_0087_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_21_0087
        rs_R009_ueqv_R009NNNYN_generator_21_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_21_0087 := by
  native_decide

/-- Coefficient term 88 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NNNYN_coefficient_21_0088 : Poly :=
[
  term ((-17582080 : Rat) / 36742197) [(9, 1), (12, 1), (15, 1)]
]

/-- Partial product 88 for generator 21. -/
def rs_R009_ueqv_R009NNNYN_partial_21_0088 : Poly :=
[
  term ((-35164160 : Rat) / 36742197) [(8, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((17582080 : Rat) / 36742197) [(9, 1), (10, 2), (12, 1), (15, 1)],
  term ((17582080 : Rat) / 36742197) [(9, 1), (11, 2), (12, 1), (15, 1)],
  term ((-35164160 : Rat) / 36742197) [(9, 2), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 88 for generator 21. -/
theorem rs_R009_ueqv_R009NNNYN_partial_21_0088_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_21_0088
        rs_R009_ueqv_R009NNNYN_generator_21_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_21_0088 := by
  native_decide

/-- Coefficient term 89 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NNNYN_coefficient_21_0089 : Poly :=
[
  term ((-5639327652 : Rat) / 1163502905) [(9, 1), (13, 1)]
]

/-- Partial product 89 for generator 21. -/
def rs_R009_ueqv_R009NNNYN_partial_21_0089 : Poly :=
[
  term ((-11278655304 : Rat) / 1163502905) [(8, 1), (9, 1), (10, 1), (13, 1)],
  term ((5639327652 : Rat) / 1163502905) [(9, 1), (10, 2), (13, 1)],
  term ((5639327652 : Rat) / 1163502905) [(9, 1), (11, 2), (13, 1)],
  term ((-11278655304 : Rat) / 1163502905) [(9, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 89 for generator 21. -/
theorem rs_R009_ueqv_R009NNNYN_partial_21_0089_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_21_0089
        rs_R009_ueqv_R009NNNYN_generator_21_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_21_0089 := by
  native_decide

/-- Coefficient term 90 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NNNYN_coefficient_21_0090 : Poly :=
[
  term ((3731840 : Rat) / 12247399) [(9, 1), (13, 1), (14, 1)]
]

/-- Partial product 90 for generator 21. -/
def rs_R009_ueqv_R009NNNYN_partial_21_0090 : Poly :=
[
  term ((7463680 : Rat) / 12247399) [(8, 1), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((-3731840 : Rat) / 12247399) [(9, 1), (10, 2), (13, 1), (14, 1)],
  term ((-3731840 : Rat) / 12247399) [(9, 1), (11, 2), (13, 1), (14, 1)],
  term ((7463680 : Rat) / 12247399) [(9, 2), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 90 for generator 21. -/
theorem rs_R009_ueqv_R009NNNYN_partial_21_0090_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_21_0090
        rs_R009_ueqv_R009NNNYN_generator_21_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_21_0090 := by
  native_decide

/-- Coefficient term 91 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NNNYN_coefficient_21_0091 : Poly :=
[
  term ((-685440 : Rat) / 12247399) [(9, 1), (13, 1), (14, 2)]
]

/-- Partial product 91 for generator 21. -/
def rs_R009_ueqv_R009NNNYN_partial_21_0091 : Poly :=
[
  term ((-1370880 : Rat) / 12247399) [(8, 1), (9, 1), (10, 1), (13, 1), (14, 2)],
  term ((685440 : Rat) / 12247399) [(9, 1), (10, 2), (13, 1), (14, 2)],
  term ((685440 : Rat) / 12247399) [(9, 1), (11, 2), (13, 1), (14, 2)],
  term ((-1370880 : Rat) / 12247399) [(9, 2), (11, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 91 for generator 21. -/
theorem rs_R009_ueqv_R009NNNYN_partial_21_0091_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_21_0091
        rs_R009_ueqv_R009NNNYN_generator_21_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_21_0091 := by
  native_decide

/-- Coefficient term 92 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NNNYN_coefficient_21_0092 : Poly :=
[
  term ((31051520 : Rat) / 110226591) [(9, 1), (13, 1), (15, 2)]
]

/-- Partial product 92 for generator 21. -/
def rs_R009_ueqv_R009NNNYN_partial_21_0092 : Poly :=
[
  term ((62103040 : Rat) / 110226591) [(8, 1), (9, 1), (10, 1), (13, 1), (15, 2)],
  term ((-31051520 : Rat) / 110226591) [(9, 1), (10, 2), (13, 1), (15, 2)],
  term ((-31051520 : Rat) / 110226591) [(9, 1), (11, 2), (13, 1), (15, 2)],
  term ((62103040 : Rat) / 110226591) [(9, 2), (11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 92 for generator 21. -/
theorem rs_R009_ueqv_R009NNNYN_partial_21_0092_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_21_0092
        rs_R009_ueqv_R009NNNYN_generator_21_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_21_0092 := by
  native_decide

/-- Coefficient term 93 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NNNYN_coefficient_21_0093 : Poly :=
[
  term ((-1827840 : Rat) / 12247399) [(9, 1), (13, 2), (15, 1)]
]

/-- Partial product 93 for generator 21. -/
def rs_R009_ueqv_R009NNNYN_partial_21_0093 : Poly :=
[
  term ((-3655680 : Rat) / 12247399) [(8, 1), (9, 1), (10, 1), (13, 2), (15, 1)],
  term ((1827840 : Rat) / 12247399) [(9, 1), (10, 2), (13, 2), (15, 1)],
  term ((1827840 : Rat) / 12247399) [(9, 1), (11, 2), (13, 2), (15, 1)],
  term ((-3655680 : Rat) / 12247399) [(9, 2), (11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 93 for generator 21. -/
theorem rs_R009_ueqv_R009NNNYN_partial_21_0093_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_21_0093
        rs_R009_ueqv_R009NNNYN_generator_21_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_21_0093 := by
  native_decide

/-- Coefficient term 94 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NNNYN_coefficient_21_0094 : Poly :=
[
  term ((-54153526 : Rat) / 330679773) [(9, 1), (14, 1), (15, 1)]
]

/-- Partial product 94 for generator 21. -/
def rs_R009_ueqv_R009NNNYN_partial_21_0094 : Poly :=
[
  term ((-108307052 : Rat) / 330679773) [(8, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((54153526 : Rat) / 330679773) [(9, 1), (10, 2), (14, 1), (15, 1)],
  term ((54153526 : Rat) / 330679773) [(9, 1), (11, 2), (14, 1), (15, 1)],
  term ((-108307052 : Rat) / 330679773) [(9, 2), (11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 94 for generator 21. -/
theorem rs_R009_ueqv_R009NNNYN_partial_21_0094_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_21_0094
        rs_R009_ueqv_R009NNNYN_generator_21_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_21_0094 := by
  native_decide

/-- Coefficient term 95 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NNNYN_coefficient_21_0095 : Poly :=
[
  term ((4395520 : Rat) / 36742197) [(9, 1), (14, 2), (15, 1)]
]

/-- Partial product 95 for generator 21. -/
def rs_R009_ueqv_R009NNNYN_partial_21_0095 : Poly :=
[
  term ((8791040 : Rat) / 36742197) [(8, 1), (9, 1), (10, 1), (14, 2), (15, 1)],
  term ((-4395520 : Rat) / 36742197) [(9, 1), (10, 2), (14, 2), (15, 1)],
  term ((-4395520 : Rat) / 36742197) [(9, 1), (11, 2), (14, 2), (15, 1)],
  term ((8791040 : Rat) / 36742197) [(9, 2), (11, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 95 for generator 21. -/
theorem rs_R009_ueqv_R009NNNYN_partial_21_0095_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_21_0095
        rs_R009_ueqv_R009NNNYN_generator_21_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_21_0095 := by
  native_decide

/-- Coefficient term 96 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NNNYN_coefficient_21_0096 : Poly :=
[
  term ((105937162343 : Rat) / 10471526145) [(9, 1), (15, 1)]
]

/-- Partial product 96 for generator 21. -/
def rs_R009_ueqv_R009NNNYN_partial_21_0096 : Poly :=
[
  term ((211874324686 : Rat) / 10471526145) [(8, 1), (9, 1), (10, 1), (15, 1)],
  term ((-105937162343 : Rat) / 10471526145) [(9, 1), (10, 2), (15, 1)],
  term ((-105937162343 : Rat) / 10471526145) [(9, 1), (11, 2), (15, 1)],
  term ((211874324686 : Rat) / 10471526145) [(9, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 96 for generator 21. -/
theorem rs_R009_ueqv_R009NNNYN_partial_21_0096_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_21_0096
        rs_R009_ueqv_R009NNNYN_generator_21_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_21_0096 := by
  native_decide

/-- Coefficient term 97 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NNNYN_coefficient_21_0097 : Poly :=
[
  term ((8791040 : Rat) / 110226591) [(9, 1), (15, 3)]
]

/-- Partial product 97 for generator 21. -/
def rs_R009_ueqv_R009NNNYN_partial_21_0097 : Poly :=
[
  term ((17582080 : Rat) / 110226591) [(8, 1), (9, 1), (10, 1), (15, 3)],
  term ((-8791040 : Rat) / 110226591) [(9, 1), (10, 2), (15, 3)],
  term ((-8791040 : Rat) / 110226591) [(9, 1), (11, 2), (15, 3)],
  term ((17582080 : Rat) / 110226591) [(9, 2), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 97 for generator 21. -/
theorem rs_R009_ueqv_R009NNNYN_partial_21_0097_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_21_0097
        rs_R009_ueqv_R009NNNYN_generator_21_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_21_0097 := by
  native_decide

/-- Coefficient term 98 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NNNYN_coefficient_21_0098 : Poly :=
[
  term ((-316 : Rat) / 67) [(9, 2)]
]

/-- Partial product 98 for generator 21. -/
def rs_R009_ueqv_R009NNNYN_partial_21_0098 : Poly :=
[
  term ((-632 : Rat) / 67) [(8, 1), (9, 2), (10, 1)],
  term ((316 : Rat) / 67) [(9, 2), (10, 2)],
  term ((316 : Rat) / 67) [(9, 2), (11, 2)],
  term ((-632 : Rat) / 67) [(9, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 98 for generator 21. -/
theorem rs_R009_ueqv_R009NNNYN_partial_21_0098_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_21_0098
        rs_R009_ueqv_R009NNNYN_generator_21_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_21_0098 := by
  native_decide

/-- Coefficient term 99 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009NNNYN_coefficient_21_0099 : Poly :=
[
  term ((-98 : Rat) / 67) [(9, 2), (10, 1)]
]

/-- Partial product 99 for generator 21. -/
def rs_R009_ueqv_R009NNNYN_partial_21_0099 : Poly :=
[
  term ((-196 : Rat) / 67) [(8, 1), (9, 2), (10, 2)],
  term ((98 : Rat) / 67) [(9, 2), (10, 1), (11, 2)],
  term ((98 : Rat) / 67) [(9, 2), (10, 3)],
  term ((-196 : Rat) / 67) [(9, 3), (10, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 99 for generator 21. -/
theorem rs_R009_ueqv_R009NNNYN_partial_21_0099_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_21_0099
        rs_R009_ueqv_R009NNNYN_generator_21_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_21_0099 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NNNYN_partials_21_0000_0099 : List Poly :=
[
  rs_R009_ueqv_R009NNNYN_partial_21_0000,
  rs_R009_ueqv_R009NNNYN_partial_21_0001,
  rs_R009_ueqv_R009NNNYN_partial_21_0002,
  rs_R009_ueqv_R009NNNYN_partial_21_0003,
  rs_R009_ueqv_R009NNNYN_partial_21_0004,
  rs_R009_ueqv_R009NNNYN_partial_21_0005,
  rs_R009_ueqv_R009NNNYN_partial_21_0006,
  rs_R009_ueqv_R009NNNYN_partial_21_0007,
  rs_R009_ueqv_R009NNNYN_partial_21_0008,
  rs_R009_ueqv_R009NNNYN_partial_21_0009,
  rs_R009_ueqv_R009NNNYN_partial_21_0010,
  rs_R009_ueqv_R009NNNYN_partial_21_0011,
  rs_R009_ueqv_R009NNNYN_partial_21_0012,
  rs_R009_ueqv_R009NNNYN_partial_21_0013,
  rs_R009_ueqv_R009NNNYN_partial_21_0014,
  rs_R009_ueqv_R009NNNYN_partial_21_0015,
  rs_R009_ueqv_R009NNNYN_partial_21_0016,
  rs_R009_ueqv_R009NNNYN_partial_21_0017,
  rs_R009_ueqv_R009NNNYN_partial_21_0018,
  rs_R009_ueqv_R009NNNYN_partial_21_0019,
  rs_R009_ueqv_R009NNNYN_partial_21_0020,
  rs_R009_ueqv_R009NNNYN_partial_21_0021,
  rs_R009_ueqv_R009NNNYN_partial_21_0022,
  rs_R009_ueqv_R009NNNYN_partial_21_0023,
  rs_R009_ueqv_R009NNNYN_partial_21_0024,
  rs_R009_ueqv_R009NNNYN_partial_21_0025,
  rs_R009_ueqv_R009NNNYN_partial_21_0026,
  rs_R009_ueqv_R009NNNYN_partial_21_0027,
  rs_R009_ueqv_R009NNNYN_partial_21_0028,
  rs_R009_ueqv_R009NNNYN_partial_21_0029,
  rs_R009_ueqv_R009NNNYN_partial_21_0030,
  rs_R009_ueqv_R009NNNYN_partial_21_0031,
  rs_R009_ueqv_R009NNNYN_partial_21_0032,
  rs_R009_ueqv_R009NNNYN_partial_21_0033,
  rs_R009_ueqv_R009NNNYN_partial_21_0034,
  rs_R009_ueqv_R009NNNYN_partial_21_0035,
  rs_R009_ueqv_R009NNNYN_partial_21_0036,
  rs_R009_ueqv_R009NNNYN_partial_21_0037,
  rs_R009_ueqv_R009NNNYN_partial_21_0038,
  rs_R009_ueqv_R009NNNYN_partial_21_0039,
  rs_R009_ueqv_R009NNNYN_partial_21_0040,
  rs_R009_ueqv_R009NNNYN_partial_21_0041,
  rs_R009_ueqv_R009NNNYN_partial_21_0042,
  rs_R009_ueqv_R009NNNYN_partial_21_0043,
  rs_R009_ueqv_R009NNNYN_partial_21_0044,
  rs_R009_ueqv_R009NNNYN_partial_21_0045,
  rs_R009_ueqv_R009NNNYN_partial_21_0046,
  rs_R009_ueqv_R009NNNYN_partial_21_0047,
  rs_R009_ueqv_R009NNNYN_partial_21_0048,
  rs_R009_ueqv_R009NNNYN_partial_21_0049,
  rs_R009_ueqv_R009NNNYN_partial_21_0050,
  rs_R009_ueqv_R009NNNYN_partial_21_0051,
  rs_R009_ueqv_R009NNNYN_partial_21_0052,
  rs_R009_ueqv_R009NNNYN_partial_21_0053,
  rs_R009_ueqv_R009NNNYN_partial_21_0054,
  rs_R009_ueqv_R009NNNYN_partial_21_0055,
  rs_R009_ueqv_R009NNNYN_partial_21_0056,
  rs_R009_ueqv_R009NNNYN_partial_21_0057,
  rs_R009_ueqv_R009NNNYN_partial_21_0058,
  rs_R009_ueqv_R009NNNYN_partial_21_0059,
  rs_R009_ueqv_R009NNNYN_partial_21_0060,
  rs_R009_ueqv_R009NNNYN_partial_21_0061,
  rs_R009_ueqv_R009NNNYN_partial_21_0062,
  rs_R009_ueqv_R009NNNYN_partial_21_0063,
  rs_R009_ueqv_R009NNNYN_partial_21_0064,
  rs_R009_ueqv_R009NNNYN_partial_21_0065,
  rs_R009_ueqv_R009NNNYN_partial_21_0066,
  rs_R009_ueqv_R009NNNYN_partial_21_0067,
  rs_R009_ueqv_R009NNNYN_partial_21_0068,
  rs_R009_ueqv_R009NNNYN_partial_21_0069,
  rs_R009_ueqv_R009NNNYN_partial_21_0070,
  rs_R009_ueqv_R009NNNYN_partial_21_0071,
  rs_R009_ueqv_R009NNNYN_partial_21_0072,
  rs_R009_ueqv_R009NNNYN_partial_21_0073,
  rs_R009_ueqv_R009NNNYN_partial_21_0074,
  rs_R009_ueqv_R009NNNYN_partial_21_0075,
  rs_R009_ueqv_R009NNNYN_partial_21_0076,
  rs_R009_ueqv_R009NNNYN_partial_21_0077,
  rs_R009_ueqv_R009NNNYN_partial_21_0078,
  rs_R009_ueqv_R009NNNYN_partial_21_0079,
  rs_R009_ueqv_R009NNNYN_partial_21_0080,
  rs_R009_ueqv_R009NNNYN_partial_21_0081,
  rs_R009_ueqv_R009NNNYN_partial_21_0082,
  rs_R009_ueqv_R009NNNYN_partial_21_0083,
  rs_R009_ueqv_R009NNNYN_partial_21_0084,
  rs_R009_ueqv_R009NNNYN_partial_21_0085,
  rs_R009_ueqv_R009NNNYN_partial_21_0086,
  rs_R009_ueqv_R009NNNYN_partial_21_0087,
  rs_R009_ueqv_R009NNNYN_partial_21_0088,
  rs_R009_ueqv_R009NNNYN_partial_21_0089,
  rs_R009_ueqv_R009NNNYN_partial_21_0090,
  rs_R009_ueqv_R009NNNYN_partial_21_0091,
  rs_R009_ueqv_R009NNNYN_partial_21_0092,
  rs_R009_ueqv_R009NNNYN_partial_21_0093,
  rs_R009_ueqv_R009NNNYN_partial_21_0094,
  rs_R009_ueqv_R009NNNYN_partial_21_0095,
  rs_R009_ueqv_R009NNNYN_partial_21_0096,
  rs_R009_ueqv_R009NNNYN_partial_21_0097,
  rs_R009_ueqv_R009NNNYN_partial_21_0098,
  rs_R009_ueqv_R009NNNYN_partial_21_0099
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NNNYN_block_21_0000_0099 : Poly :=
[
  term ((-2352 : Rat) / 67) [(0, 1), (5, 1), (8, 1), (9, 1), (10, 1)],
  term ((-11418222167296 : Rat) / 94243735305) [(0, 1), (5, 1), (8, 1), (10, 1), (11, 1)],
  term ((-155975680 : Rat) / 110226591) [(0, 1), (5, 1), (8, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((77987840 : Rat) / 36742197) [(0, 1), (5, 1), (8, 1), (10, 1), (11, 1), (15, 2)],
  term ((-178409721364 : Rat) / 3490508715) [(0, 1), (5, 1), (8, 1), (10, 1), (13, 1)],
  term ((239360000 : Rat) / 110226591) [(0, 1), (5, 1), (8, 1), (10, 1), (13, 1), (15, 2)],
  term ((-7311360 : Rat) / 12247399) [(0, 1), (5, 1), (8, 1), (10, 1), (13, 2), (15, 1)],
  term ((9193997267648 : Rat) / 94243735305) [(0, 1), (5, 1), (8, 1), (10, 1), (15, 1)],
  term ((-70328320 : Rat) / 36742197) [(0, 1), (5, 1), (8, 1), (10, 1), (15, 3)],
  term ((1176 : Rat) / 67) [(0, 1), (5, 1), (9, 1), (10, 2)],
  term ((-178409721364 : Rat) / 3490508715) [(0, 1), (5, 1), (9, 1), (11, 1), (13, 1)],
  term ((239360000 : Rat) / 110226591) [(0, 1), (5, 1), (9, 1), (11, 1), (13, 1), (15, 2)],
  term ((-7311360 : Rat) / 12247399) [(0, 1), (5, 1), (9, 1), (11, 1), (13, 2), (15, 1)],
  term ((9193997267648 : Rat) / 94243735305) [(0, 1), (5, 1), (9, 1), (11, 1), (15, 1)],
  term ((-70328320 : Rat) / 36742197) [(0, 1), (5, 1), (9, 1), (11, 1), (15, 3)],
  term ((-9764033619256 : Rat) / 94243735305) [(0, 1), (5, 1), (9, 1), (11, 2)],
  term ((-155975680 : Rat) / 110226591) [(0, 1), (5, 1), (9, 1), (11, 2), (13, 1), (15, 1)],
  term ((77987840 : Rat) / 36742197) [(0, 1), (5, 1), (9, 1), (11, 2), (15, 2)],
  term ((-2352 : Rat) / 67) [(0, 1), (5, 1), (9, 2), (11, 1)],
  term ((5709111083648 : Rat) / 94243735305) [(0, 1), (5, 1), (10, 2), (11, 1)],
  term ((77987840 : Rat) / 110226591) [(0, 1), (5, 1), (10, 2), (11, 1), (13, 1), (15, 1)],
  term ((-38993920 : Rat) / 36742197) [(0, 1), (5, 1), (10, 2), (11, 1), (15, 2)],
  term ((89204860682 : Rat) / 3490508715) [(0, 1), (5, 1), (10, 2), (13, 1)],
  term ((-119680000 : Rat) / 110226591) [(0, 1), (5, 1), (10, 2), (13, 1), (15, 2)],
  term ((3655680 : Rat) / 12247399) [(0, 1), (5, 1), (10, 2), (13, 2), (15, 1)],
  term ((-4596998633824 : Rat) / 94243735305) [(0, 1), (5, 1), (10, 2), (15, 1)],
  term ((35164160 : Rat) / 36742197) [(0, 1), (5, 1), (10, 2), (15, 3)],
  term ((89204860682 : Rat) / 3490508715) [(0, 1), (5, 1), (11, 2), (13, 1)],
  term ((-119680000 : Rat) / 110226591) [(0, 1), (5, 1), (11, 2), (13, 1), (15, 2)],
  term ((3655680 : Rat) / 12247399) [(0, 1), (5, 1), (11, 2), (13, 2), (15, 1)],
  term ((-4596998633824 : Rat) / 94243735305) [(0, 1), (5, 1), (11, 2), (15, 1)],
  term ((35164160 : Rat) / 36742197) [(0, 1), (5, 1), (11, 2), (15, 3)],
  term ((5709111083648 : Rat) / 94243735305) [(0, 1), (5, 1), (11, 3)],
  term ((77987840 : Rat) / 110226591) [(0, 1), (5, 1), (11, 3), (13, 1), (15, 1)],
  term ((-38993920 : Rat) / 36742197) [(0, 1), (5, 1), (11, 3), (15, 2)],
  term ((5709111083648 : Rat) / 94243735305) [(0, 1), (8, 1), (9, 1), (10, 1), (11, 1)],
  term ((77987840 : Rat) / 110226591) [(0, 1), (8, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-38993920 : Rat) / 36742197) [(0, 1), (8, 1), (9, 1), (10, 1), (11, 1), (15, 2)],
  term ((89204860682 : Rat) / 3490508715) [(0, 1), (8, 1), (9, 1), (10, 1), (13, 1)],
  term ((-119680000 : Rat) / 110226591) [(0, 1), (8, 1), (9, 1), (10, 1), (13, 1), (15, 2)],
  term ((3655680 : Rat) / 12247399) [(0, 1), (8, 1), (9, 1), (10, 1), (13, 2), (15, 1)],
  term ((-4596998633824 : Rat) / 94243735305) [(0, 1), (8, 1), (9, 1), (10, 1), (15, 1)],
  term ((35164160 : Rat) / 36742197) [(0, 1), (8, 1), (9, 1), (10, 1), (15, 3)],
  term ((1176 : Rat) / 67) [(0, 1), (8, 1), (9, 2), (10, 1)],
  term ((240 : Rat) / 67) [(0, 1), (8, 1), (10, 1)],
  term ((23824220672 : Rat) / 330679773) [(0, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((372253448 : Rat) / 12247399) [(0, 1), (8, 1), (10, 1), (13, 1), (15, 1)],
  term ((-21484341856 : Rat) / 330679773) [(0, 1), (8, 1), (10, 1), (15, 2)],
  term ((-2854555541824 : Rat) / 94243735305) [(0, 1), (9, 1), (10, 2), (11, 1)],
  term ((-38993920 : Rat) / 110226591) [(0, 1), (9, 1), (10, 2), (11, 1), (13, 1), (15, 1)],
  term ((19496960 : Rat) / 36742197) [(0, 1), (9, 1), (10, 2), (11, 1), (15, 2)],
  term ((-44602430341 : Rat) / 3490508715) [(0, 1), (9, 1), (10, 2), (13, 1)],
  term ((59840000 : Rat) / 110226591) [(0, 1), (9, 1), (10, 2), (13, 1), (15, 2)],
  term ((-1827840 : Rat) / 12247399) [(0, 1), (9, 1), (10, 2), (13, 2), (15, 1)],
  term ((2298499316912 : Rat) / 94243735305) [(0, 1), (9, 1), (10, 2), (15, 1)],
  term ((-17582080 : Rat) / 36742197) [(0, 1), (9, 1), (10, 2), (15, 3)],
  term ((240 : Rat) / 67) [(0, 1), (9, 1), (11, 1)],
  term ((372253448 : Rat) / 12247399) [(0, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-21484341856 : Rat) / 330679773) [(0, 1), (9, 1), (11, 1), (15, 2)],
  term ((-44602430341 : Rat) / 3490508715) [(0, 1), (9, 1), (11, 2), (13, 1)],
  term ((59840000 : Rat) / 110226591) [(0, 1), (9, 1), (11, 2), (13, 1), (15, 2)],
  term ((-1827840 : Rat) / 12247399) [(0, 1), (9, 1), (11, 2), (13, 2), (15, 1)],
  term ((9088402208432 : Rat) / 94243735305) [(0, 1), (9, 1), (11, 2), (15, 1)],
  term ((-17582080 : Rat) / 36742197) [(0, 1), (9, 1), (11, 2), (15, 3)],
  term ((-2854555541824 : Rat) / 94243735305) [(0, 1), (9, 1), (11, 3)],
  term ((-38993920 : Rat) / 110226591) [(0, 1), (9, 1), (11, 3), (13, 1), (15, 1)],
  term ((19496960 : Rat) / 36742197) [(0, 1), (9, 1), (11, 3), (15, 2)],
  term ((-588 : Rat) / 67) [(0, 1), (9, 2), (10, 2)],
  term ((89204860682 : Rat) / 3490508715) [(0, 1), (9, 2), (11, 1), (13, 1)],
  term ((-119680000 : Rat) / 110226591) [(0, 1), (9, 2), (11, 1), (13, 1), (15, 2)],
  term ((3655680 : Rat) / 12247399) [(0, 1), (9, 2), (11, 1), (13, 2), (15, 1)],
  term ((-4596998633824 : Rat) / 94243735305) [(0, 1), (9, 2), (11, 1), (15, 1)],
  term ((35164160 : Rat) / 36742197) [(0, 1), (9, 2), (11, 1), (15, 3)],
  term ((4882016809628 : Rat) / 94243735305) [(0, 1), (9, 2), (11, 2)],
  term ((77987840 : Rat) / 110226591) [(0, 1), (9, 2), (11, 2), (13, 1), (15, 1)],
  term ((-38993920 : Rat) / 36742197) [(0, 1), (9, 2), (11, 2), (15, 2)],
  term ((1176 : Rat) / 67) [(0, 1), (9, 3), (11, 1)],
  term ((-120 : Rat) / 67) [(0, 1), (10, 2)],
  term ((-11912110336 : Rat) / 330679773) [(0, 1), (10, 2), (11, 1), (15, 1)],
  term ((-186126724 : Rat) / 12247399) [(0, 1), (10, 2), (13, 1), (15, 1)],
  term ((10742170928 : Rat) / 330679773) [(0, 1), (10, 2), (15, 2)],
  term ((-120 : Rat) / 67) [(0, 1), (11, 2)],
  term ((-186126724 : Rat) / 12247399) [(0, 1), (11, 2), (13, 1), (15, 1)],
  term ((10742170928 : Rat) / 330679773) [(0, 1), (11, 2), (15, 2)],
  term ((-11912110336 : Rat) / 330679773) [(0, 1), (11, 3), (15, 1)],
  term ((1656 : Rat) / 67) [(1, 1), (8, 1), (9, 1), (10, 1)],
  term ((133214530256 : Rat) / 3490508715) [(1, 1), (8, 1), (10, 1), (11, 1)],
  term ((-77987840 : Rat) / 110226591) [(1, 1), (8, 1), (10, 1), (11, 1), (12, 1)],
  term ((-86517760 : Rat) / 110226591) [(1, 1), (8, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-439581184 : Rat) / 6239241) [(1, 1), (8, 1), (10, 1), (11, 1), (14, 1)],
  term ((130211840 : Rat) / 36742197) [(1, 1), (8, 1), (10, 1), (11, 1), (15, 2)],
  term ((-389939200 : Rat) / 110226591) [(1, 1), (8, 1), (10, 1), (11, 2), (15, 1)],
  term ((-3655680 : Rat) / 12247399) [(1, 1), (8, 1), (10, 1), (12, 1), (13, 1)],
  term ((70328320 : Rat) / 110226591) [(1, 1), (8, 1), (10, 1), (12, 1), (15, 1)],
  term ((20491571961 : Rat) / 1163502905) [(1, 1), (8, 1), (10, 1), (13, 1)],
  term ((-6868456 : Rat) / 231083) [(1, 1), (8, 1), (10, 1), (13, 1), (14, 1)],
  term ((-53877760 : Rat) / 110226591) [(1, 1), (8, 1), (10, 1), (13, 1), (15, 2)],
  term ((3655680 : Rat) / 12247399) [(1, 1), (8, 1), (10, 1), (13, 2), (15, 1)],
  term ((396408032 : Rat) / 6239241) [(1, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((-110984190148 : Rat) / 3490508715) [(1, 1), (8, 1), (10, 1), (15, 1)],
  term ((-35164160 : Rat) / 110226591) [(1, 1), (8, 1), (10, 1), (15, 3)],
  term ((-7232276274944 : Rat) / 94243735305) [(1, 1), (8, 1), (10, 2), (11, 1)],
  term ((-113004316796 : Rat) / 3490508715) [(1, 1), (8, 1), (10, 2), (13, 1)],
  term ((6521963426512 : Rat) / 94243735305) [(1, 1), (8, 1), (10, 2), (15, 1)],
  term ((-113004316796 : Rat) / 3490508715) [(1, 1), (9, 1), (10, 1), (11, 1), (13, 1)],
  term ((6521963426512 : Rat) / 94243735305) [(1, 1), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((-7232276274944 : Rat) / 94243735305) [(1, 1), (9, 1), (10, 1), (11, 2)],
  term ((-828 : Rat) / 67) [(1, 1), (9, 1), (10, 2)],
  term ((-3655680 : Rat) / 12247399) [(1, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((70328320 : Rat) / 110226591) [(1, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((20491571961 : Rat) / 1163502905) [(1, 1), (9, 1), (11, 1), (13, 1)],
  term ((-6868456 : Rat) / 231083) [(1, 1), (9, 1), (11, 1), (13, 1), (14, 1)],
  term ((-53877760 : Rat) / 110226591) [(1, 1), (9, 1), (11, 1), (13, 1), (15, 2)],
  term ((3655680 : Rat) / 12247399) [(1, 1), (9, 1), (11, 1), (13, 2), (15, 1)],
  term ((396408032 : Rat) / 6239241) [(1, 1), (9, 1), (11, 1), (14, 1), (15, 1)],
  term ((-110984190148 : Rat) / 3490508715) [(1, 1), (9, 1), (11, 1), (15, 1)],
  term ((-35164160 : Rat) / 110226591) [(1, 1), (9, 1), (11, 1), (15, 3)],
  term ((90078094196 : Rat) / 3490508715) [(1, 1), (9, 1), (11, 2)],
  term ((-77987840 : Rat) / 110226591) [(1, 1), (9, 1), (11, 2), (12, 1)],
  term ((-86517760 : Rat) / 110226591) [(1, 1), (9, 1), (11, 2), (13, 1), (15, 1)],
  term ((-439581184 : Rat) / 6239241) [(1, 1), (9, 1), (11, 2), (14, 1)],
  term ((130211840 : Rat) / 36742197) [(1, 1), (9, 1), (11, 2), (15, 2)],
  term ((-389939200 : Rat) / 110226591) [(1, 1), (9, 1), (11, 3), (15, 1)],
  term ((1656 : Rat) / 67) [(1, 1), (9, 2), (11, 1)],
  term ((56502158398 : Rat) / 3490508715) [(1, 1), (10, 1), (11, 2), (13, 1)],
  term ((-3260981713256 : Rat) / 94243735305) [(1, 1), (10, 1), (11, 2), (15, 1)],
  term ((3616138137472 : Rat) / 94243735305) [(1, 1), (10, 1), (11, 3)],
  term ((-66607265128 : Rat) / 3490508715) [(1, 1), (10, 2), (11, 1)],
  term ((38993920 : Rat) / 110226591) [(1, 1), (10, 2), (11, 1), (12, 1)],
  term ((43258880 : Rat) / 110226591) [(1, 1), (10, 2), (11, 1), (13, 1), (15, 1)],
  term ((219790592 : Rat) / 6239241) [(1, 1), (10, 2), (11, 1), (14, 1)],
  term ((-65105920 : Rat) / 36742197) [(1, 1), (10, 2), (11, 1), (15, 2)],
  term ((194969600 : Rat) / 110226591) [(1, 1), (10, 2), (11, 2), (15, 1)],
  term ((1827840 : Rat) / 12247399) [(1, 1), (10, 2), (12, 1), (13, 1)],
  term ((-35164160 : Rat) / 110226591) [(1, 1), (10, 2), (12, 1), (15, 1)],
  term ((-20491571961 : Rat) / 2327005810) [(1, 1), (10, 2), (13, 1)],
  term ((3434228 : Rat) / 231083) [(1, 1), (10, 2), (13, 1), (14, 1)],
  term ((26938880 : Rat) / 110226591) [(1, 1), (10, 2), (13, 1), (15, 2)],
  term ((-1827840 : Rat) / 12247399) [(1, 1), (10, 2), (13, 2), (15, 1)],
  term ((-198204016 : Rat) / 6239241) [(1, 1), (10, 2), (14, 1), (15, 1)],
  term ((55492095074 : Rat) / 3490508715) [(1, 1), (10, 2), (15, 1)],
  term ((17582080 : Rat) / 110226591) [(1, 1), (10, 2), (15, 3)],
  term ((3616138137472 : Rat) / 94243735305) [(1, 1), (10, 3), (11, 1)],
  term ((56502158398 : Rat) / 3490508715) [(1, 1), (10, 3), (13, 1)],
  term ((-3260981713256 : Rat) / 94243735305) [(1, 1), (10, 3), (15, 1)],
  term ((1827840 : Rat) / 12247399) [(1, 1), (11, 2), (12, 1), (13, 1)],
  term ((-35164160 : Rat) / 110226591) [(1, 1), (11, 2), (12, 1), (15, 1)],
  term ((-20491571961 : Rat) / 2327005810) [(1, 1), (11, 2), (13, 1)],
  term ((3434228 : Rat) / 231083) [(1, 1), (11, 2), (13, 1), (14, 1)],
  term ((26938880 : Rat) / 110226591) [(1, 1), (11, 2), (13, 1), (15, 2)],
  term ((-1827840 : Rat) / 12247399) [(1, 1), (11, 2), (13, 2), (15, 1)],
  term ((-198204016 : Rat) / 6239241) [(1, 1), (11, 2), (14, 1), (15, 1)],
  term ((55492095074 : Rat) / 3490508715) [(1, 1), (11, 2), (15, 1)],
  term ((17582080 : Rat) / 110226591) [(1, 1), (11, 2), (15, 3)],
  term ((-66607265128 : Rat) / 3490508715) [(1, 1), (11, 3)],
  term ((38993920 : Rat) / 110226591) [(1, 1), (11, 3), (12, 1)],
  term ((43258880 : Rat) / 110226591) [(1, 1), (11, 3), (13, 1), (15, 1)],
  term ((219790592 : Rat) / 6239241) [(1, 1), (11, 3), (14, 1)],
  term ((-65105920 : Rat) / 36742197) [(1, 1), (11, 3), (15, 2)],
  term ((194969600 : Rat) / 110226591) [(1, 1), (11, 4), (15, 1)],
  term ((635084800 : Rat) / 110226591) [(4, 1), (8, 1), (9, 1), (10, 1), (11, 1)],
  term ((29769600 : Rat) / 12247399) [(4, 1), (8, 1), (9, 1), (10, 1), (13, 1)],
  term ((-572710400 : Rat) / 110226591) [(4, 1), (8, 1), (9, 1), (10, 1), (15, 1)],
  term ((-317542400 : Rat) / 110226591) [(4, 1), (9, 1), (10, 2), (11, 1)],
  term ((-14884800 : Rat) / 12247399) [(4, 1), (9, 1), (10, 2), (13, 1)],
  term ((286355200 : Rat) / 110226591) [(4, 1), (9, 1), (10, 2), (15, 1)],
  term ((-14884800 : Rat) / 12247399) [(4, 1), (9, 1), (11, 2), (13, 1)],
  term ((286355200 : Rat) / 110226591) [(4, 1), (9, 1), (11, 2), (15, 1)],
  term ((-317542400 : Rat) / 110226591) [(4, 1), (9, 1), (11, 3)],
  term ((29769600 : Rat) / 12247399) [(4, 1), (9, 2), (11, 1), (13, 1)],
  term ((-572710400 : Rat) / 110226591) [(4, 1), (9, 2), (11, 1), (15, 1)],
  term ((635084800 : Rat) / 110226591) [(4, 1), (9, 2), (11, 2)],
  term ((98 : Rat) / 67) [(5, 1), (8, 1), (9, 1), (10, 1)],
  term ((-392 : Rat) / 67) [(5, 1), (8, 1), (9, 1), (10, 1), (14, 1)],
  term ((392 : Rat) / 67) [(5, 1), (8, 1), (9, 1), (10, 2)],
  term ((399282510592 : Rat) / 31414578435) [(5, 1), (8, 1), (10, 1), (11, 1)],
  term ((-155975680 : Rat) / 110226591) [(5, 1), (8, 1), (10, 1), (11, 1), (12, 1)],
  term ((389939200 : Rat) / 110226591) [(5, 1), (8, 1), (10, 1), (11, 1), (12, 1), (14, 1)],
  term ((38993920 : Rat) / 36742197) [(5, 1), (8, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-1072332800 : Rat) / 330679773) [(5, 1), (8, 1), (10, 1), (11, 1), (14, 1)],
  term ((19496960 : Rat) / 36742197) [(5, 1), (8, 1), (10, 1), (11, 1), (14, 2)],
  term ((-19496960 : Rat) / 36742197) [(5, 1), (8, 1), (10, 1), (11, 1), (15, 2)],
  term ((-7311360 : Rat) / 12247399) [(5, 1), (8, 1), (10, 1), (12, 1), (13, 1)],
  term ((18278400 : Rat) / 12247399) [(5, 1), (8, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((-351641600 : Rat) / 110226591) [(5, 1), (8, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((140656640 : Rat) / 110226591) [(5, 1), (8, 1), (10, 1), (12, 1), (15, 1)],
  term ((6238789228 : Rat) / 1163502905) [(5, 1), (8, 1), (10, 1), (13, 1)],
  term ((-16755200 : Rat) / 12247399) [(5, 1), (8, 1), (10, 1), (13, 1), (14, 1)],
  term ((2741760 : Rat) / 12247399) [(5, 1), (8, 1), (10, 1), (13, 1), (14, 2)],
  term ((-43389440 : Rat) / 36742197) [(5, 1), (8, 1), (10, 1), (13, 1), (15, 2)],
  term ((5483520 : Rat) / 12247399) [(5, 1), (8, 1), (10, 1), (13, 2), (15, 1)],
  term ((322106584 : Rat) / 330679773) [(5, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((-17582080 : Rat) / 36742197) [(5, 1), (8, 1), (10, 1), (14, 2), (15, 1)],
  term ((-344750703386 : Rat) / 31414578435) [(5, 1), (8, 1), (10, 1), (15, 1)],
  term ((17582080 : Rat) / 36742197) [(5, 1), (8, 1), (10, 1), (15, 3)],
  term ((-357395842048 : Rat) / 10471526145) [(5, 1), (8, 1), (10, 2), (11, 1)],
  term ((-16752930096 : Rat) / 1163502905) [(5, 1), (8, 1), (10, 2), (13, 1)],
  term ((342716545544 : Rat) / 10471526145) [(5, 1), (8, 1), (10, 2), (15, 1)],
  term ((-16752930096 : Rat) / 1163502905) [(5, 1), (9, 1), (10, 1), (11, 1), (13, 1)],
  term ((342716545544 : Rat) / 10471526145) [(5, 1), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((-388028963308 : Rat) / 10471526145) [(5, 1), (9, 1), (10, 1), (11, 2)],
  term ((-49 : Rat) / 67) [(5, 1), (9, 1), (10, 2)],
  term ((196 : Rat) / 67) [(5, 1), (9, 1), (10, 2), (14, 1)],
  term ((-196 : Rat) / 67) [(5, 1), (9, 1), (10, 3)],
  term ((-7311360 : Rat) / 12247399) [(5, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((18278400 : Rat) / 12247399) [(5, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-351641600 : Rat) / 110226591) [(5, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((140656640 : Rat) / 110226591) [(5, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((6238789228 : Rat) / 1163502905) [(5, 1), (9, 1), (11, 1), (13, 1)],
  term ((-16755200 : Rat) / 12247399) [(5, 1), (9, 1), (11, 1), (13, 1), (14, 1)],
  term ((2741760 : Rat) / 12247399) [(5, 1), (9, 1), (11, 1), (13, 1), (14, 2)],
  term ((-43389440 : Rat) / 36742197) [(5, 1), (9, 1), (11, 1), (13, 1), (15, 2)],
  term ((5483520 : Rat) / 12247399) [(5, 1), (9, 1), (11, 1), (13, 2), (15, 1)],
  term ((322106584 : Rat) / 330679773) [(5, 1), (9, 1), (11, 1), (14, 1), (15, 1)],
  term ((-17582080 : Rat) / 36742197) [(5, 1), (9, 1), (11, 1), (14, 2), (15, 1)],
  term ((-344750703386 : Rat) / 31414578435) [(5, 1), (9, 1), (11, 1), (15, 1)],
  term ((17582080 : Rat) / 36742197) [(5, 1), (9, 1), (11, 1), (15, 3)],
  term ((376307669647 : Rat) / 31414578435) [(5, 1), (9, 1), (11, 2)],
  term ((-155975680 : Rat) / 110226591) [(5, 1), (9, 1), (11, 2), (12, 1)],
  term ((389939200 : Rat) / 110226591) [(5, 1), (9, 1), (11, 2), (12, 1), (14, 1)],
  term ((38993920 : Rat) / 36742197) [(5, 1), (9, 1), (11, 2), (13, 1), (15, 1)],
  term ((-104971076 : Rat) / 330679773) [(5, 1), (9, 1), (11, 2), (14, 1)],
  term ((19496960 : Rat) / 36742197) [(5, 1), (9, 1), (11, 2), (14, 2)],
  term ((-19496960 : Rat) / 36742197) [(5, 1), (9, 1), (11, 2), (15, 2)],
  term ((392 : Rat) / 67) [(5, 1), (9, 2), (10, 1), (11, 1)],
  term ((98 : Rat) / 67) [(5, 1), (9, 2), (11, 1)],
  term ((-392 : Rat) / 67) [(5, 1), (9, 2), (11, 1), (14, 1)],
  term ((8376465048 : Rat) / 1163502905) [(5, 1), (10, 1), (11, 2), (13, 1)],
  term ((-171358272772 : Rat) / 10471526145) [(5, 1), (10, 1), (11, 2), (15, 1)],
  term ((178697921024 : Rat) / 10471526145) [(5, 1), (10, 1), (11, 3)],
  term ((-199641255296 : Rat) / 31414578435) [(5, 1), (10, 2), (11, 1)],
  term ((77987840 : Rat) / 110226591) [(5, 1), (10, 2), (11, 1), (12, 1)],
  term ((-194969600 : Rat) / 110226591) [(5, 1), (10, 2), (11, 1), (12, 1), (14, 1)],
  term ((-19496960 : Rat) / 36742197) [(5, 1), (10, 2), (11, 1), (13, 1), (15, 1)],
  term ((536166400 : Rat) / 330679773) [(5, 1), (10, 2), (11, 1), (14, 1)],
  term ((-9748480 : Rat) / 36742197) [(5, 1), (10, 2), (11, 1), (14, 2)],
  term ((9748480 : Rat) / 36742197) [(5, 1), (10, 2), (11, 1), (15, 2)],
  term ((3655680 : Rat) / 12247399) [(5, 1), (10, 2), (12, 1), (13, 1)],
  term ((-9139200 : Rat) / 12247399) [(5, 1), (10, 2), (12, 1), (13, 1), (14, 1)],
  term ((175820800 : Rat) / 110226591) [(5, 1), (10, 2), (12, 1), (14, 1), (15, 1)],
  term ((-70328320 : Rat) / 110226591) [(5, 1), (10, 2), (12, 1), (15, 1)],
  term ((-3119394614 : Rat) / 1163502905) [(5, 1), (10, 2), (13, 1)],
  term ((8377600 : Rat) / 12247399) [(5, 1), (10, 2), (13, 1), (14, 1)],
  term ((-1370880 : Rat) / 12247399) [(5, 1), (10, 2), (13, 1), (14, 2)],
  term ((21694720 : Rat) / 36742197) [(5, 1), (10, 2), (13, 1), (15, 2)],
  term ((-2741760 : Rat) / 12247399) [(5, 1), (10, 2), (13, 2), (15, 1)],
  term ((-161053292 : Rat) / 330679773) [(5, 1), (10, 2), (14, 1), (15, 1)],
  term ((8791040 : Rat) / 36742197) [(5, 1), (10, 2), (14, 2), (15, 1)],
  term ((172375351693 : Rat) / 31414578435) [(5, 1), (10, 2), (15, 1)],
  term ((-8791040 : Rat) / 36742197) [(5, 1), (10, 2), (15, 3)],
  term ((178697921024 : Rat) / 10471526145) [(5, 1), (10, 3), (11, 1)],
  term ((8376465048 : Rat) / 1163502905) [(5, 1), (10, 3), (13, 1)],
  term ((-171358272772 : Rat) / 10471526145) [(5, 1), (10, 3), (15, 1)],
  term ((3655680 : Rat) / 12247399) [(5, 1), (11, 2), (12, 1), (13, 1)],
  term ((-9139200 : Rat) / 12247399) [(5, 1), (11, 2), (12, 1), (13, 1), (14, 1)],
  term ((175820800 : Rat) / 110226591) [(5, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((-70328320 : Rat) / 110226591) [(5, 1), (11, 2), (12, 1), (15, 1)],
  term ((-3119394614 : Rat) / 1163502905) [(5, 1), (11, 2), (13, 1)],
  term ((8377600 : Rat) / 12247399) [(5, 1), (11, 2), (13, 1), (14, 1)],
  term ((-1370880 : Rat) / 12247399) [(5, 1), (11, 2), (13, 1), (14, 2)],
  term ((21694720 : Rat) / 36742197) [(5, 1), (11, 2), (13, 1), (15, 2)],
  term ((-2741760 : Rat) / 12247399) [(5, 1), (11, 2), (13, 2), (15, 1)],
  term ((-161053292 : Rat) / 330679773) [(5, 1), (11, 2), (14, 1), (15, 1)],
  term ((8791040 : Rat) / 36742197) [(5, 1), (11, 2), (14, 2), (15, 1)],
  term ((172375351693 : Rat) / 31414578435) [(5, 1), (11, 2), (15, 1)],
  term ((-8791040 : Rat) / 36742197) [(5, 1), (11, 2), (15, 3)],
  term ((-199641255296 : Rat) / 31414578435) [(5, 1), (11, 3)],
  term ((77987840 : Rat) / 110226591) [(5, 1), (11, 3), (12, 1)],
  term ((-194969600 : Rat) / 110226591) [(5, 1), (11, 3), (12, 1), (14, 1)],
  term ((-19496960 : Rat) / 36742197) [(5, 1), (11, 3), (13, 1), (15, 1)],
  term ((536166400 : Rat) / 330679773) [(5, 1), (11, 3), (14, 1)],
  term ((-9748480 : Rat) / 36742197) [(5, 1), (11, 3), (14, 2)],
  term ((9748480 : Rat) / 36742197) [(5, 1), (11, 3), (15, 2)],
  term ((331812484864 : Rat) / 31414578435) [(7, 1), (8, 1), (10, 1), (11, 1)],
  term ((5184570076 : Rat) / 1163502905) [(7, 1), (8, 1), (10, 1), (13, 1)],
  term ((-299223758672 : Rat) / 31414578435) [(7, 1), (8, 1), (10, 1), (15, 1)],
  term ((5184570076 : Rat) / 1163502905) [(7, 1), (9, 1), (11, 1), (13, 1)],
  term ((-299223758672 : Rat) / 31414578435) [(7, 1), (9, 1), (11, 1), (15, 1)],
  term ((331812484864 : Rat) / 31414578435) [(7, 1), (9, 1), (11, 2)],
  term ((-165906242432 : Rat) / 31414578435) [(7, 1), (10, 2), (11, 1)],
  term ((-2592285038 : Rat) / 1163502905) [(7, 1), (10, 2), (13, 1)],
  term ((149611879336 : Rat) / 31414578435) [(7, 1), (10, 2), (15, 1)],
  term ((-2592285038 : Rat) / 1163502905) [(7, 1), (11, 2), (13, 1)],
  term ((149611879336 : Rat) / 31414578435) [(7, 1), (11, 2), (15, 1)],
  term ((-165906242432 : Rat) / 31414578435) [(7, 1), (11, 3)],
  term ((-237172901582 : Rat) / 10471526145) [(8, 1), (9, 1), (10, 1), (11, 1)],
  term ((38993920 : Rat) / 36742197) [(8, 1), (9, 1), (10, 1), (11, 1), (12, 1)],
  term ((-194969600 : Rat) / 110226591) [(8, 1), (9, 1), (10, 1), (11, 1), (12, 1), (14, 1)],
  term ((4264960 : Rat) / 110226591) [(8, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((477675520 : Rat) / 330679773) [(8, 1), (9, 1), (10, 1), (11, 1), (14, 1)],
  term ((-9748480 : Rat) / 36742197) [(8, 1), (9, 1), (10, 1), (11, 1), (14, 2)],
  term ((-65105920 : Rat) / 36742197) [(8, 1), (9, 1), (10, 1), (11, 1), (15, 2)],
  term ((194969600 : Rat) / 110226591) [(8, 1), (9, 1), (10, 1), (11, 2), (15, 1)],
  term ((5483520 : Rat) / 12247399) [(8, 1), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((-9139200 : Rat) / 12247399) [(8, 1), (9, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((175820800 : Rat) / 110226591) [(8, 1), (9, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-35164160 : Rat) / 36742197) [(8, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-11278655304 : Rat) / 1163502905) [(8, 1), (9, 1), (10, 1), (13, 1)],
  term ((7463680 : Rat) / 12247399) [(8, 1), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((-1370880 : Rat) / 12247399) [(8, 1), (9, 1), (10, 1), (13, 1), (14, 2)],
  term ((62103040 : Rat) / 110226591) [(8, 1), (9, 1), (10, 1), (13, 1), (15, 2)],
  term ((-3655680 : Rat) / 12247399) [(8, 1), (9, 1), (10, 1), (13, 2), (15, 1)],
  term ((-108307052 : Rat) / 330679773) [(8, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((8791040 : Rat) / 36742197) [(8, 1), (9, 1), (10, 1), (14, 2), (15, 1)],
  term ((211874324686 : Rat) / 10471526145) [(8, 1), (9, 1), (10, 1), (15, 1)],
  term ((17582080 : Rat) / 110226591) [(8, 1), (9, 1), (10, 1), (15, 3)],
  term ((5224419426688 : Rat) / 94243735305) [(8, 1), (9, 1), (10, 2), (11, 1)],
  term ((81631553542 : Rat) / 3490508715) [(8, 1), (9, 1), (10, 2), (13, 1)],
  term ((-4803206168204 : Rat) / 94243735305) [(8, 1), (9, 1), (10, 2), (15, 1)],
  term ((-632 : Rat) / 67) [(8, 1), (9, 2), (10, 1)],
  term ((-196 : Rat) / 67) [(8, 1), (9, 2), (10, 2)],
  term ((-29 : Rat) / 134) [(8, 1), (10, 1)],
  term ((-40815776771 : Rat) / 3490508715) [(9, 1), (10, 1), (11, 2), (13, 1)],
  term ((2401603084102 : Rat) / 94243735305) [(9, 1), (10, 1), (11, 2), (15, 1)],
  term ((-2612209713344 : Rat) / 94243735305) [(9, 1), (10, 1), (11, 3)],
  term ((118586450791 : Rat) / 10471526145) [(9, 1), (10, 2), (11, 1)],
  term ((-19496960 : Rat) / 36742197) [(9, 1), (10, 2), (11, 1), (12, 1)],
  term ((97484800 : Rat) / 110226591) [(9, 1), (10, 2), (11, 1), (12, 1), (14, 1)],
  term ((-2132480 : Rat) / 110226591) [(9, 1), (10, 2), (11, 1), (13, 1), (15, 1)],
  term ((-238837760 : Rat) / 330679773) [(9, 1), (10, 2), (11, 1), (14, 1)],
  term ((4874240 : Rat) / 36742197) [(9, 1), (10, 2), (11, 1), (14, 2)],
  term ((32552960 : Rat) / 36742197) [(9, 1), (10, 2), (11, 1), (15, 2)],
  term ((-97484800 : Rat) / 110226591) [(9, 1), (10, 2), (11, 2), (15, 1)],
  term ((-2741760 : Rat) / 12247399) [(9, 1), (10, 2), (12, 1), (13, 1)],
  term ((4569600 : Rat) / 12247399) [(9, 1), (10, 2), (12, 1), (13, 1), (14, 1)],
  term ((-87910400 : Rat) / 110226591) [(9, 1), (10, 2), (12, 1), (14, 1), (15, 1)],
  term ((17582080 : Rat) / 36742197) [(9, 1), (10, 2), (12, 1), (15, 1)],
  term ((5639327652 : Rat) / 1163502905) [(9, 1), (10, 2), (13, 1)],
  term ((-3731840 : Rat) / 12247399) [(9, 1), (10, 2), (13, 1), (14, 1)],
  term ((685440 : Rat) / 12247399) [(9, 1), (10, 2), (13, 1), (14, 2)],
  term ((-31051520 : Rat) / 110226591) [(9, 1), (10, 2), (13, 1), (15, 2)],
  term ((1827840 : Rat) / 12247399) [(9, 1), (10, 2), (13, 2), (15, 1)],
  term ((54153526 : Rat) / 330679773) [(9, 1), (10, 2), (14, 1), (15, 1)],
  term ((-4395520 : Rat) / 36742197) [(9, 1), (10, 2), (14, 2), (15, 1)],
  term ((-105937162343 : Rat) / 10471526145) [(9, 1), (10, 2), (15, 1)],
  term ((-8791040 : Rat) / 110226591) [(9, 1), (10, 2), (15, 3)],
  term ((-2612209713344 : Rat) / 94243735305) [(9, 1), (10, 3), (11, 1)],
  term ((-40815776771 : Rat) / 3490508715) [(9, 1), (10, 3), (13, 1)],
  term ((2401603084102 : Rat) / 94243735305) [(9, 1), (10, 3), (15, 1)],
  term ((-29 : Rat) / 134) [(9, 1), (11, 1)],
  term ((-2741760 : Rat) / 12247399) [(9, 1), (11, 2), (12, 1), (13, 1)],
  term ((4569600 : Rat) / 12247399) [(9, 1), (11, 2), (12, 1), (13, 1), (14, 1)],
  term ((-87910400 : Rat) / 110226591) [(9, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((17582080 : Rat) / 36742197) [(9, 1), (11, 2), (12, 1), (15, 1)],
  term ((5639327652 : Rat) / 1163502905) [(9, 1), (11, 2), (13, 1)],
  term ((-3731840 : Rat) / 12247399) [(9, 1), (11, 2), (13, 1), (14, 1)],
  term ((685440 : Rat) / 12247399) [(9, 1), (11, 2), (13, 1), (14, 2)],
  term ((-31051520 : Rat) / 110226591) [(9, 1), (11, 2), (13, 1), (15, 2)],
  term ((1827840 : Rat) / 12247399) [(9, 1), (11, 2), (13, 2), (15, 1)],
  term ((54153526 : Rat) / 330679773) [(9, 1), (11, 2), (14, 1), (15, 1)],
  term ((-4395520 : Rat) / 36742197) [(9, 1), (11, 2), (14, 2), (15, 1)],
  term ((-105937162343 : Rat) / 10471526145) [(9, 1), (11, 2), (15, 1)],
  term ((-8791040 : Rat) / 110226591) [(9, 1), (11, 2), (15, 3)],
  term ((118586450791 : Rat) / 10471526145) [(9, 1), (11, 3)],
  term ((-19496960 : Rat) / 36742197) [(9, 1), (11, 3), (12, 1)],
  term ((97484800 : Rat) / 110226591) [(9, 1), (11, 3), (12, 1), (14, 1)],
  term ((-2132480 : Rat) / 110226591) [(9, 1), (11, 3), (13, 1), (15, 1)],
  term ((-238837760 : Rat) / 330679773) [(9, 1), (11, 3), (14, 1)],
  term ((4874240 : Rat) / 36742197) [(9, 1), (11, 3), (14, 2)],
  term ((32552960 : Rat) / 36742197) [(9, 1), (11, 3), (15, 2)],
  term ((-97484800 : Rat) / 110226591) [(9, 1), (11, 4), (15, 1)],
  term ((81631553542 : Rat) / 3490508715) [(9, 2), (10, 1), (11, 1), (13, 1)],
  term ((-4803206168204 : Rat) / 94243735305) [(9, 2), (10, 1), (11, 1), (15, 1)],
  term ((5362268472358 : Rat) / 94243735305) [(9, 2), (10, 1), (11, 2)],
  term ((316 : Rat) / 67) [(9, 2), (10, 2)],
  term ((98 : Rat) / 67) [(9, 2), (10, 3)],
  term ((5483520 : Rat) / 12247399) [(9, 2), (11, 1), (12, 1), (13, 1)],
  term ((-9139200 : Rat) / 12247399) [(9, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((175820800 : Rat) / 110226591) [(9, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-35164160 : Rat) / 36742197) [(9, 2), (11, 1), (12, 1), (15, 1)],
  term ((-11278655304 : Rat) / 1163502905) [(9, 2), (11, 1), (13, 1)],
  term ((7463680 : Rat) / 12247399) [(9, 2), (11, 1), (13, 1), (14, 1)],
  term ((-1370880 : Rat) / 12247399) [(9, 2), (11, 1), (13, 1), (14, 2)],
  term ((62103040 : Rat) / 110226591) [(9, 2), (11, 1), (13, 1), (15, 2)],
  term ((-3655680 : Rat) / 12247399) [(9, 2), (11, 1), (13, 2), (15, 1)],
  term ((-108307052 : Rat) / 330679773) [(9, 2), (11, 1), (14, 1), (15, 1)],
  term ((8791040 : Rat) / 36742197) [(9, 2), (11, 1), (14, 2), (15, 1)],
  term ((211874324686 : Rat) / 10471526145) [(9, 2), (11, 1), (15, 1)],
  term ((17582080 : Rat) / 110226591) [(9, 2), (11, 1), (15, 3)],
  term ((-187784808122 : Rat) / 10471526145) [(9, 2), (11, 2)],
  term ((38993920 : Rat) / 36742197) [(9, 2), (11, 2), (12, 1)],
  term ((-194969600 : Rat) / 110226591) [(9, 2), (11, 2), (12, 1), (14, 1)],
  term ((4264960 : Rat) / 110226591) [(9, 2), (11, 2), (13, 1), (15, 1)],
  term ((477675520 : Rat) / 330679773) [(9, 2), (11, 2), (14, 1)],
  term ((-9748480 : Rat) / 36742197) [(9, 2), (11, 2), (14, 2)],
  term ((-65105920 : Rat) / 36742197) [(9, 2), (11, 2), (15, 2)],
  term ((194969600 : Rat) / 110226591) [(9, 2), (11, 3), (15, 1)],
  term ((-196 : Rat) / 67) [(9, 3), (10, 1), (11, 1)],
  term ((-632 : Rat) / 67) [(9, 3), (11, 1)],
  term ((29 : Rat) / 268) [(10, 2)],
  term ((29 : Rat) / 268) [(11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 21, terms 0 through 99. -/
theorem rs_R009_ueqv_R009NNNYN_block_21_0000_0099_valid :
    checkProductSumEq rs_R009_ueqv_R009NNNYN_partials_21_0000_0099
      rs_R009_ueqv_R009NNNYN_block_21_0000_0099 = true := by
  native_decide

end R009UeqvR009NNNYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
