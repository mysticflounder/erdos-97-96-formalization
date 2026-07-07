/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NNNYN, term block 16:0-99

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NNNYNTermShards

/-- Generator polynomial 16 for relaxed split surplus certificate `R009:u=v:R009NNNYN`. -/
def rs_R009_ueqv_R009NNNYN_generator_16_0000_0099 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(6, 1)]
]

/-- Coefficient term 0 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0000 : Poly :=
[
  term ((-17 : Rat) / 16) []
]

/-- Partial product 0 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0000 : Poly :=
[
  term ((17 : Rat) / 16) [],
  term ((-17 : Rat) / 8) [(6, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0000_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0000
        rs_R009_ueqv_R009NNNYN_generator_16_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_16_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0001 : Poly :=
[
  term ((19496960 : Rat) / 110226591) [(0, 1), (2, 1), (7, 1), (11, 1)]
]

/-- Partial product 1 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0001 : Poly :=
[
  term ((38993920 : Rat) / 110226591) [(0, 1), (2, 1), (6, 1), (7, 1), (11, 1)],
  term ((-19496960 : Rat) / 110226591) [(0, 1), (2, 1), (7, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0001_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0001
        rs_R009_ueqv_R009NNNYN_generator_16_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_16_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0002 : Poly :=
[
  term ((913920 : Rat) / 12247399) [(0, 1), (2, 1), (7, 1), (13, 1)]
]

/-- Partial product 2 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0002 : Poly :=
[
  term ((1827840 : Rat) / 12247399) [(0, 1), (2, 1), (6, 1), (7, 1), (13, 1)],
  term ((-913920 : Rat) / 12247399) [(0, 1), (2, 1), (7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0002_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0002
        rs_R009_ueqv_R009NNNYN_generator_16_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_16_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0003 : Poly :=
[
  term ((-17582080 : Rat) / 110226591) [(0, 1), (2, 1), (7, 1), (15, 1)]
]

/-- Partial product 3 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0003 : Poly :=
[
  term ((-35164160 : Rat) / 110226591) [(0, 1), (2, 1), (6, 1), (7, 1), (15, 1)],
  term ((17582080 : Rat) / 110226591) [(0, 1), (2, 1), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0003_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0003
        rs_R009_ueqv_R009NNNYN_generator_16_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_16_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0004 : Poly :=
[
  term ((118128640 : Rat) / 36742197) [(0, 1), (2, 1), (9, 1), (11, 1)]
]

/-- Partial product 4 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0004 : Poly :=
[
  term ((236257280 : Rat) / 36742197) [(0, 1), (2, 1), (6, 1), (9, 1), (11, 1)],
  term ((-118128640 : Rat) / 36742197) [(0, 1), (2, 1), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0004_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0004
        rs_R009_ueqv_R009NNNYN_generator_16_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_16_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0005 : Poly :=
[
  term ((16611840 : Rat) / 12247399) [(0, 1), (2, 1), (9, 1), (13, 1)]
]

/-- Partial product 5 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0005 : Poly :=
[
  term ((33223680 : Rat) / 12247399) [(0, 1), (2, 1), (6, 1), (9, 1), (13, 1)],
  term ((-16611840 : Rat) / 12247399) [(0, 1), (2, 1), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0005_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0005
        rs_R009_ueqv_R009NNNYN_generator_16_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_16_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0006 : Poly :=
[
  term ((-106526720 : Rat) / 36742197) [(0, 1), (2, 1), (9, 1), (15, 1)]
]

/-- Partial product 6 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0006 : Poly :=
[
  term ((-213053440 : Rat) / 36742197) [(0, 1), (2, 1), (6, 1), (9, 1), (15, 1)],
  term ((106526720 : Rat) / 36742197) [(0, 1), (2, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0006_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0006
        rs_R009_ueqv_R009NNNYN_generator_16_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_16_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0007 : Poly :=
[
  term ((334888960 : Rat) / 110226591) [(0, 1), (2, 1), (11, 1), (13, 1)]
]

/-- Partial product 7 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0007 : Poly :=
[
  term ((669777920 : Rat) / 110226591) [(0, 1), (2, 1), (6, 1), (11, 1), (13, 1)],
  term ((-334888960 : Rat) / 110226591) [(0, 1), (2, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0007_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0007
        rs_R009_ueqv_R009NNNYN_generator_16_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_16_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0008 : Poly :=
[
  term ((2497600000 : Rat) / 110226591) [(0, 1), (2, 1), (11, 1), (15, 1)]
]

/-- Partial product 8 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0008 : Poly :=
[
  term ((4995200000 : Rat) / 110226591) [(0, 1), (2, 1), (6, 1), (11, 1), (15, 1)],
  term ((-2497600000 : Rat) / 110226591) [(0, 1), (2, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0008_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0008
        rs_R009_ueqv_R009NNNYN_generator_16_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_16_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0009 : Poly :=
[
  term ((751676920 : Rat) / 110226591) [(0, 1), (2, 1), (13, 1), (15, 1)]
]

/-- Partial product 9 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0009 : Poly :=
[
  term ((1503353840 : Rat) / 110226591) [(0, 1), (2, 1), (6, 1), (13, 1), (15, 1)],
  term ((-751676920 : Rat) / 110226591) [(0, 1), (2, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0009_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0009
        rs_R009_ueqv_R009NNNYN_generator_16_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_16_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0010 : Poly :=
[
  term ((15697920 : Rat) / 12247399) [(0, 1), (2, 1), (13, 2)]
]

/-- Partial product 10 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0010 : Poly :=
[
  term ((31395840 : Rat) / 12247399) [(0, 1), (2, 1), (6, 1), (13, 2)],
  term ((-15697920 : Rat) / 12247399) [(0, 1), (2, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0010_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0010
        rs_R009_ueqv_R009NNNYN_generator_16_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_16_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0011 : Poly :=
[
  term ((-2252300000 : Rat) / 110226591) [(0, 1), (2, 1), (15, 2)]
]

/-- Partial product 11 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0011 : Poly :=
[
  term ((-4504600000 : Rat) / 110226591) [(0, 1), (2, 1), (6, 1), (15, 2)],
  term ((2252300000 : Rat) / 110226591) [(0, 1), (2, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0011_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0011
        rs_R009_ueqv_R009NNNYN_generator_16_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_16_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0012 : Poly :=
[
  term ((1185873920 : Rat) / 330679773) [(0, 1), (3, 1), (11, 1)]
]

/-- Partial product 12 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0012 : Poly :=
[
  term ((2371747840 : Rat) / 330679773) [(0, 1), (3, 1), (6, 1), (11, 1)],
  term ((-1185873920 : Rat) / 330679773) [(0, 1), (3, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0012_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0012
        rs_R009_ueqv_R009NNNYN_generator_16_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_16_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0013 : Poly :=
[
  term ((787467520 : Rat) / 330679773) [(0, 1), (3, 1), (11, 1), (12, 1)]
]

/-- Partial product 13 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0013 : Poly :=
[
  term ((1574935040 : Rat) / 330679773) [(0, 1), (3, 1), (6, 1), (11, 1), (12, 1)],
  term ((-787467520 : Rat) / 330679773) [(0, 1), (3, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0013_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0013
        rs_R009_ueqv_R009NNNYN_generator_16_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_16_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0014 : Poly :=
[
  term ((-1687831040 : Rat) / 110226591) [(0, 1), (3, 1), (11, 1), (14, 1)]
]

/-- Partial product 14 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0014 : Poly :=
[
  term ((-3375662080 : Rat) / 110226591) [(0, 1), (3, 1), (6, 1), (11, 1), (14, 1)],
  term ((1687831040 : Rat) / 110226591) [(0, 1), (3, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0014_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0014
        rs_R009_ueqv_R009NNNYN_generator_16_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_16_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0015 : Poly :=
[
  term ((12304180 : Rat) / 12247399) [(0, 1), (3, 1), (12, 1), (13, 1)]
]

/-- Partial product 15 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0015 : Poly :=
[
  term ((24608360 : Rat) / 12247399) [(0, 1), (3, 1), (6, 1), (12, 1), (13, 1)],
  term ((-12304180 : Rat) / 12247399) [(0, 1), (3, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0015_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0015
        rs_R009_ueqv_R009NNNYN_generator_16_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_16_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0016 : Poly :=
[
  term ((-710126960 : Rat) / 330679773) [(0, 1), (3, 1), (12, 1), (15, 1)]
]

/-- Partial product 16 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0016 : Poly :=
[
  term ((-1420253920 : Rat) / 330679773) [(0, 1), (3, 1), (6, 1), (12, 1), (15, 1)],
  term ((710126960 : Rat) / 330679773) [(0, 1), (3, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0016_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0016
        rs_R009_ueqv_R009NNNYN_generator_16_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_16_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0017 : Poly :=
[
  term ((18529280 : Rat) / 12247399) [(0, 1), (3, 1), (13, 1)]
]

/-- Partial product 17 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0017 : Poly :=
[
  term ((37058560 : Rat) / 12247399) [(0, 1), (3, 1), (6, 1), (13, 1)],
  term ((-18529280 : Rat) / 12247399) [(0, 1), (3, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0017_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0017
        rs_R009_ueqv_R009NNNYN_generator_16_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_16_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0018 : Poly :=
[
  term ((-79117080 : Rat) / 12247399) [(0, 1), (3, 1), (13, 1), (14, 1)]
]

/-- Partial product 18 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0018 : Poly :=
[
  term ((-158234160 : Rat) / 12247399) [(0, 1), (3, 1), (6, 1), (13, 1), (14, 1)],
  term ((79117080 : Rat) / 12247399) [(0, 1), (3, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0018_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0018
        rs_R009_ueqv_R009NNNYN_generator_16_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_16_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0019 : Poly :=
[
  term ((1522061920 : Rat) / 110226591) [(0, 1), (3, 1), (14, 1), (15, 1)]
]

/-- Partial product 19 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0019 : Poly :=
[
  term ((3044123840 : Rat) / 110226591) [(0, 1), (3, 1), (6, 1), (14, 1), (15, 1)],
  term ((-1522061920 : Rat) / 110226591) [(0, 1), (3, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0019_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0019
        rs_R009_ueqv_R009NNNYN_generator_16_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_16_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0020 : Poly :=
[
  term ((-1069404160 : Rat) / 330679773) [(0, 1), (3, 1), (15, 1)]
]

/-- Partial product 20 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0020 : Poly :=
[
  term ((-2138808320 : Rat) / 330679773) [(0, 1), (3, 1), (6, 1), (15, 1)],
  term ((1069404160 : Rat) / 330679773) [(0, 1), (3, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0020_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0020
        rs_R009_ueqv_R009NNNYN_generator_16_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_16_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0021 : Poly :=
[
  term ((3406659200 : Rat) / 330679773) [(0, 1), (4, 1), (7, 1), (11, 1)]
]

/-- Partial product 21 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0021 : Poly :=
[
  term ((6813318400 : Rat) / 330679773) [(0, 1), (4, 1), (6, 1), (7, 1), (11, 1)],
  term ((-3406659200 : Rat) / 330679773) [(0, 1), (4, 1), (7, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0021_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0021
        rs_R009_ueqv_R009NNNYN_generator_16_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_16_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0022 : Poly :=
[
  term ((53229050 : Rat) / 12247399) [(0, 1), (4, 1), (7, 1), (13, 1)]
]

/-- Partial product 22 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0022 : Poly :=
[
  term ((106458100 : Rat) / 12247399) [(0, 1), (4, 1), (6, 1), (7, 1), (13, 1)],
  term ((-53229050 : Rat) / 12247399) [(0, 1), (4, 1), (7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0022_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0022
        rs_R009_ueqv_R009NNNYN_generator_16_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_16_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0023 : Poly :=
[
  term ((-3072076600 : Rat) / 330679773) [(0, 1), (4, 1), (7, 1), (15, 1)]
]

/-- Partial product 23 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0023 : Poly :=
[
  term ((-6144153200 : Rat) / 330679773) [(0, 1), (4, 1), (6, 1), (7, 1), (15, 1)],
  term ((3072076600 : Rat) / 330679773) [(0, 1), (4, 1), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0023_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0023
        rs_R009_ueqv_R009NNNYN_generator_16_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_16_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0024 : Poly :=
[
  term ((22436960896 : Rat) / 330679773) [(0, 1), (4, 1), (9, 1), (11, 1)]
]

/-- Partial product 24 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0024 : Poly :=
[
  term ((44873921792 : Rat) / 330679773) [(0, 1), (4, 1), (6, 1), (9, 1), (11, 1)],
  term ((-22436960896 : Rat) / 330679773) [(0, 1), (4, 1), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0024_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0024
        rs_R009_ueqv_R009NNNYN_generator_16_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_16_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0025 : Poly :=
[
  term ((350577514 : Rat) / 12247399) [(0, 1), (4, 1), (9, 1), (13, 1)]
]

/-- Partial product 25 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0025 : Poly :=
[
  term ((701155028 : Rat) / 12247399) [(0, 1), (4, 1), (6, 1), (9, 1), (13, 1)],
  term ((-350577514 : Rat) / 12247399) [(0, 1), (4, 1), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0025_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0025
        rs_R009_ueqv_R009NNNYN_generator_16_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_16_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0026 : Poly :=
[
  term ((-20233330808 : Rat) / 330679773) [(0, 1), (4, 1), (9, 1), (15, 1)]
]

/-- Partial product 26 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0026 : Poly :=
[
  term ((-40466661616 : Rat) / 330679773) [(0, 1), (4, 1), (6, 1), (9, 1), (15, 1)],
  term ((20233330808 : Rat) / 330679773) [(0, 1), (4, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0026_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0026
        rs_R009_ueqv_R009NNNYN_generator_16_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_16_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0027 : Poly :=
[
  term ((-4093454848 : Rat) / 110226591) [(0, 1), (4, 1), (11, 1), (13, 1)]
]

/-- Partial product 27 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0027 : Poly :=
[
  term ((-8186909696 : Rat) / 110226591) [(0, 1), (4, 1), (6, 1), (11, 1), (13, 1)],
  term ((4093454848 : Rat) / 110226591) [(0, 1), (4, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0027_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0027
        rs_R009_ueqv_R009NNNYN_generator_16_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_16_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0028 : Poly :=
[
  term ((7426280960 : Rat) / 330679773) [(0, 1), (4, 1), (11, 1), (15, 1)]
]

/-- Partial product 28 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0028 : Poly :=
[
  term ((14852561920 : Rat) / 330679773) [(0, 1), (4, 1), (6, 1), (11, 1), (15, 1)],
  term ((-7426280960 : Rat) / 330679773) [(0, 1), (4, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0028_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0028
        rs_R009_ueqv_R009NNNYN_generator_16_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_16_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0029 : Poly :=
[
  term ((4735739864 : Rat) / 110226591) [(0, 1), (4, 1), (13, 1), (15, 1)]
]

/-- Partial product 29 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0029 : Poly :=
[
  term ((9471479728 : Rat) / 110226591) [(0, 1), (4, 1), (6, 1), (13, 1), (15, 1)],
  term ((-4735739864 : Rat) / 110226591) [(0, 1), (4, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0029_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0029
        rs_R009_ueqv_R009NNNYN_generator_16_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_16_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0030 : Poly :=
[
  term ((-191880696 : Rat) / 12247399) [(0, 1), (4, 1), (13, 2)]
]

/-- Partial product 30 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0030 : Poly :=
[
  term ((-383761392 : Rat) / 12247399) [(0, 1), (4, 1), (6, 1), (13, 2)],
  term ((191880696 : Rat) / 12247399) [(0, 1), (4, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0030_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0030
        rs_R009_ueqv_R009NNNYN_generator_16_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_16_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0031 : Poly :=
[
  term ((-6696914080 : Rat) / 330679773) [(0, 1), (4, 1), (15, 2)]
]

/-- Partial product 31 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0031 : Poly :=
[
  term ((-13393828160 : Rat) / 330679773) [(0, 1), (4, 1), (6, 1), (15, 2)],
  term ((6696914080 : Rat) / 330679773) [(0, 1), (4, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0031_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0031
        rs_R009_ueqv_R009NNNYN_generator_16_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_16_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0032 : Poly :=
[
  term ((-3406659200 : Rat) / 330679773) [(0, 1), (5, 1), (6, 1), (11, 1)]
]

/-- Partial product 32 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0032 : Poly :=
[
  term ((3406659200 : Rat) / 330679773) [(0, 1), (5, 1), (6, 1), (11, 1)],
  term ((-6813318400 : Rat) / 330679773) [(0, 1), (5, 1), (6, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0032_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0032
        rs_R009_ueqv_R009NNNYN_generator_16_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_16_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0033 : Poly :=
[
  term ((-53229050 : Rat) / 12247399) [(0, 1), (5, 1), (6, 1), (13, 1)]
]

/-- Partial product 33 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0033 : Poly :=
[
  term ((53229050 : Rat) / 12247399) [(0, 1), (5, 1), (6, 1), (13, 1)],
  term ((-106458100 : Rat) / 12247399) [(0, 1), (5, 1), (6, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0033_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0033
        rs_R009_ueqv_R009NNNYN_generator_16_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_16_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0034 : Poly :=
[
  term ((3072076600 : Rat) / 330679773) [(0, 1), (5, 1), (6, 1), (15, 1)]
]

/-- Partial product 34 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0034 : Poly :=
[
  term ((-3072076600 : Rat) / 330679773) [(0, 1), (5, 1), (6, 1), (15, 1)],
  term ((6144153200 : Rat) / 330679773) [(0, 1), (5, 1), (6, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0034_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0034
        rs_R009_ueqv_R009NNNYN_generator_16_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_16_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0035 : Poly :=
[
  term ((294 : Rat) / 67) [(0, 1), (5, 1), (9, 1)]
]

/-- Partial product 35 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0035 : Poly :=
[
  term ((588 : Rat) / 67) [(0, 1), (5, 1), (6, 1), (9, 1)],
  term ((-294 : Rat) / 67) [(0, 1), (5, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0035_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0035
        rs_R009_ueqv_R009NNNYN_generator_16_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_16_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0036 : Poly :=
[
  term ((-1290205715456 : Rat) / 31414578435) [(0, 1), (5, 1), (10, 1), (11, 1)]
]

/-- Partial product 36 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0036 : Poly :=
[
  term ((-2580411430912 : Rat) / 31414578435) [(0, 1), (5, 1), (6, 1), (10, 1), (11, 1)],
  term ((1290205715456 : Rat) / 31414578435) [(0, 1), (5, 1), (10, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0036_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0036
        rs_R009_ueqv_R009NNNYN_generator_16_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_16_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0037 : Poly :=
[
  term ((-20159464304 : Rat) / 1163502905) [(0, 1), (5, 1), (10, 1), (13, 1)]
]

/-- Partial product 37 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0037 : Poly :=
[
  term ((-40318928608 : Rat) / 1163502905) [(0, 1), (5, 1), (6, 1), (10, 1), (13, 1)],
  term ((20159464304 : Rat) / 1163502905) [(0, 1), (5, 1), (10, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0037_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0037
        rs_R009_ueqv_R009NNNYN_generator_16_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_16_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0038 : Poly :=
[
  term ((1163489082688 : Rat) / 31414578435) [(0, 1), (5, 1), (10, 1), (15, 1)]
]

/-- Partial product 38 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0038 : Poly :=
[
  term ((2326978165376 : Rat) / 31414578435) [(0, 1), (5, 1), (6, 1), (10, 1), (15, 1)],
  term ((-1163489082688 : Rat) / 31414578435) [(0, 1), (5, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0038_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0038
        rs_R009_ueqv_R009NNNYN_generator_16_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_16_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0039 : Poly :=
[
  term ((-2997545662048 : Rat) / 94243735305) [(0, 1), (5, 1), (11, 1)]
]

/-- Partial product 39 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0039 : Poly :=
[
  term ((-5995091324096 : Rat) / 94243735305) [(0, 1), (5, 1), (6, 1), (11, 1)],
  term ((2997545662048 : Rat) / 94243735305) [(0, 1), (5, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0039_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0039
        rs_R009_ueqv_R009NNNYN_generator_16_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_16_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0040 : Poly :=
[
  term ((13317484544 : Rat) / 110226591) [(0, 1), (5, 1), (11, 1), (12, 1)]
]

/-- Partial product 40 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0040 : Poly :=
[
  term ((26634969088 : Rat) / 110226591) [(0, 1), (5, 1), (6, 1), (11, 1), (12, 1)],
  term ((-13317484544 : Rat) / 110226591) [(0, 1), (5, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0040_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0040
        rs_R009_ueqv_R009NNNYN_generator_16_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_16_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0041 : Poly :=
[
  term ((19496960 : Rat) / 110226591) [(0, 1), (5, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 41 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0041 : Poly :=
[
  term ((38993920 : Rat) / 110226591) [(0, 1), (5, 1), (6, 1), (11, 1), (13, 1), (15, 1)],
  term ((-19496960 : Rat) / 110226591) [(0, 1), (5, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0041_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0041
        rs_R009_ueqv_R009NNNYN_generator_16_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_16_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0042 : Poly :=
[
  term ((6490663424 : Rat) / 330679773) [(0, 1), (5, 1), (11, 1), (14, 1)]
]

/-- Partial product 42 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0042 : Poly :=
[
  term ((12981326848 : Rat) / 330679773) [(0, 1), (5, 1), (6, 1), (11, 1), (14, 1)],
  term ((-6490663424 : Rat) / 330679773) [(0, 1), (5, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0042_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0042
        rs_R009_ueqv_R009NNNYN_generator_16_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_16_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0043 : Poly :=
[
  term ((-185221120 : Rat) / 110226591) [(0, 1), (5, 1), (11, 1), (15, 2)]
]

/-- Partial product 43 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0043 : Poly :=
[
  term ((-370442240 : Rat) / 110226591) [(0, 1), (5, 1), (6, 1), (11, 1), (15, 2)],
  term ((185221120 : Rat) / 110226591) [(0, 1), (5, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0043_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0043
        rs_R009_ueqv_R009NNNYN_generator_16_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_16_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0044 : Poly :=
[
  term ((624257088 : Rat) / 12247399) [(0, 1), (5, 1), (12, 1), (13, 1)]
]

/-- Partial product 44 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0044 : Poly :=
[
  term ((1248514176 : Rat) / 12247399) [(0, 1), (5, 1), (6, 1), (12, 1), (13, 1)],
  term ((-624257088 : Rat) / 12247399) [(0, 1), (5, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0044_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0044
        rs_R009_ueqv_R009NNNYN_generator_16_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_16_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0045 : Poly :=
[
  term ((-11772612400 : Rat) / 110226591) [(0, 1), (5, 1), (12, 1), (15, 1)]
]

/-- Partial product 45 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0045 : Poly :=
[
  term ((-23545224800 : Rat) / 110226591) [(0, 1), (5, 1), (6, 1), (12, 1), (15, 1)],
  term ((11772612400 : Rat) / 110226591) [(0, 1), (5, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0045_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0045
        rs_R009_ueqv_R009NNNYN_generator_16_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_16_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0046 : Poly :=
[
  term ((-93673301939 : Rat) / 6981017430) [(0, 1), (5, 1), (13, 1)]
]

/-- Partial product 46 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0046 : Poly :=
[
  term ((-93673301939 : Rat) / 3490508715) [(0, 1), (5, 1), (6, 1), (13, 1)],
  term ((93673301939 : Rat) / 6981017430) [(0, 1), (5, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0046_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0046
        rs_R009_ueqv_R009NNNYN_generator_16_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_16_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0047 : Poly :=
[
  term ((101416616 : Rat) / 12247399) [(0, 1), (5, 1), (13, 1), (14, 1)]
]

/-- Partial product 47 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0047 : Poly :=
[
  term ((202833232 : Rat) / 12247399) [(0, 1), (5, 1), (6, 1), (13, 1), (14, 1)],
  term ((-101416616 : Rat) / 12247399) [(0, 1), (5, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0047_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0047
        rs_R009_ueqv_R009NNNYN_generator_16_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_16_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0048 : Poly :=
[
  term ((-1806080 : Rat) / 2079747) [(0, 1), (5, 1), (13, 1), (15, 2)]
]

/-- Partial product 48 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0048 : Poly :=
[
  term ((-3612160 : Rat) / 2079747) [(0, 1), (5, 1), (6, 1), (13, 1), (15, 2)],
  term ((1806080 : Rat) / 2079747) [(0, 1), (5, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0048_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0048
        rs_R009_ueqv_R009NNNYN_generator_16_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_16_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0049 : Poly :=
[
  term ((913920 : Rat) / 12247399) [(0, 1), (5, 1), (13, 2), (15, 1)]
]

/-- Partial product 49 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0049 : Poly :=
[
  term ((1827840 : Rat) / 12247399) [(0, 1), (5, 1), (6, 1), (13, 2), (15, 1)],
  term ((-913920 : Rat) / 12247399) [(0, 1), (5, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0049_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0049
        rs_R009_ueqv_R009NNNYN_generator_16_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_16_0049 := by
  native_decide

/-- Coefficient term 50 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0050 : Poly :=
[
  term ((-5853187552 : Rat) / 330679773) [(0, 1), (5, 1), (14, 1), (15, 1)]
]

/-- Partial product 50 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0050 : Poly :=
[
  term ((-11706375104 : Rat) / 330679773) [(0, 1), (5, 1), (6, 1), (14, 1), (15, 1)],
  term ((5853187552 : Rat) / 330679773) [(0, 1), (5, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 50 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0050_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0050
        rs_R009_ueqv_R009NNNYN_generator_16_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_16_0050 := by
  native_decide

/-- Coefficient term 51 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0051 : Poly :=
[
  term ((2840992901624 : Rat) / 94243735305) [(0, 1), (5, 1), (15, 1)]
]

/-- Partial product 51 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0051 : Poly :=
[
  term ((5681985803248 : Rat) / 94243735305) [(0, 1), (5, 1), (6, 1), (15, 1)],
  term ((-2840992901624 : Rat) / 94243735305) [(0, 1), (5, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 51 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0051_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0051
        rs_R009_ueqv_R009NNNYN_generator_16_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_16_0051 := by
  native_decide

/-- Coefficient term 52 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0052 : Poly :=
[
  term ((167029760 : Rat) / 110226591) [(0, 1), (5, 1), (15, 3)]
]

/-- Partial product 52 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0052 : Poly :=
[
  term ((334059520 : Rat) / 110226591) [(0, 1), (5, 1), (6, 1), (15, 3)],
  term ((-167029760 : Rat) / 110226591) [(0, 1), (5, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 52 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0052_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0052
        rs_R009_ueqv_R009NNNYN_generator_16_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_16_0052 := by
  native_decide

/-- Coefficient term 53 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0053 : Poly :=
[
  term ((-66519040 : Rat) / 330679773) [(0, 1), (6, 1), (11, 1), (13, 1)]
]

/-- Partial product 53 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0053 : Poly :=
[
  term ((66519040 : Rat) / 330679773) [(0, 1), (6, 1), (11, 1), (13, 1)],
  term ((-133038080 : Rat) / 330679773) [(0, 1), (6, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 53 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0053_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0053
        rs_R009_ueqv_R009NNNYN_generator_16_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_16_0053 := by
  native_decide

/-- Coefficient term 54 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0054 : Poly :=
[
  term ((59985920 : Rat) / 330679773) [(0, 1), (6, 1), (13, 1), (15, 1)]
]

/-- Partial product 54 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0054 : Poly :=
[
  term ((-59985920 : Rat) / 330679773) [(0, 1), (6, 1), (13, 1), (15, 1)],
  term ((119971840 : Rat) / 330679773) [(0, 1), (6, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 54 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0054_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0054
        rs_R009_ueqv_R009NNNYN_generator_16_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_16_0054 := by
  native_decide

/-- Coefficient term 55 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0055 : Poly :=
[
  term ((-1039360 : Rat) / 12247399) [(0, 1), (6, 1), (13, 2)]
]

/-- Partial product 55 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0055 : Poly :=
[
  term ((1039360 : Rat) / 12247399) [(0, 1), (6, 1), (13, 2)],
  term ((-2078720 : Rat) / 12247399) [(0, 1), (6, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 55 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0055_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0055
        rs_R009_ueqv_R009NNNYN_generator_16_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_16_0055 := by
  native_decide

/-- Coefficient term 56 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0056 : Poly :=
[
  term ((-294 : Rat) / 67) [(0, 1), (7, 1), (9, 1)]
]

/-- Partial product 56 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0056 : Poly :=
[
  term ((-588 : Rat) / 67) [(0, 1), (6, 1), (7, 1), (9, 1)],
  term ((294 : Rat) / 67) [(0, 1), (7, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 56 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0056_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0056
        rs_R009_ueqv_R009NNNYN_generator_16_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_16_0056 := by
  native_decide

/-- Coefficient term 57 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0057 : Poly :=
[
  term ((-227029927264 : Rat) / 18848747061) [(0, 1), (7, 1), (11, 1)]
]

/-- Partial product 57 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0057 : Poly :=
[
  term ((-454059854528 : Rat) / 18848747061) [(0, 1), (6, 1), (7, 1), (11, 1)],
  term ((227029927264 : Rat) / 18848747061) [(0, 1), (7, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 57 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0057_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0057
        rs_R009_ueqv_R009NNNYN_generator_16_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_16_0057 := by
  native_decide

/-- Coefficient term 58 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0058 : Poly :=
[
  term ((-241821440 : Rat) / 110226591) [(0, 1), (7, 1), (11, 1), (12, 1)]
]

/-- Partial product 58 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0058 : Poly :=
[
  term ((-483642880 : Rat) / 110226591) [(0, 1), (6, 1), (7, 1), (11, 1), (12, 1)],
  term ((241821440 : Rat) / 110226591) [(0, 1), (7, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 58 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0058_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0058
        rs_R009_ueqv_R009NNNYN_generator_16_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_16_0058 := by
  native_decide

/-- Coefficient term 59 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0059 : Poly :=
[
  term ((-19496960 : Rat) / 110226591) [(0, 1), (7, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 59 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0059 : Poly :=
[
  term ((-38993920 : Rat) / 110226591) [(0, 1), (6, 1), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((19496960 : Rat) / 110226591) [(0, 1), (7, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 59 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0059_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0059
        rs_R009_ueqv_R009NNNYN_generator_16_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_16_0059 := by
  native_decide

/-- Coefficient term 60 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0060 : Poly :=
[
  term ((317623040 : Rat) / 36742197) [(0, 1), (7, 1), (11, 1), (14, 1)]
]

/-- Partial product 60 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0060 : Poly :=
[
  term ((635246080 : Rat) / 36742197) [(0, 1), (6, 1), (7, 1), (11, 1), (14, 1)],
  term ((-317623040 : Rat) / 36742197) [(0, 1), (7, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 60 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0060_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0060
        rs_R009_ueqv_R009NNNYN_generator_16_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_16_0060 := by
  native_decide

/-- Coefficient term 61 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0061 : Poly :=
[
  term ((9748480 : Rat) / 36742197) [(0, 1), (7, 1), (11, 1), (15, 2)]
]

/-- Partial product 61 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0061 : Poly :=
[
  term ((19496960 : Rat) / 36742197) [(0, 1), (6, 1), (7, 1), (11, 1), (15, 2)],
  term ((-9748480 : Rat) / 36742197) [(0, 1), (7, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 61 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0061_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0061
        rs_R009_ueqv_R009NNNYN_generator_16_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_16_0061 := by
  native_decide

/-- Coefficient term 62 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0062 : Poly :=
[
  term ((-11335380 : Rat) / 12247399) [(0, 1), (7, 1), (12, 1), (13, 1)]
]

/-- Partial product 62 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0062 : Poly :=
[
  term ((-22670760 : Rat) / 12247399) [(0, 1), (6, 1), (7, 1), (12, 1), (13, 1)],
  term ((11335380 : Rat) / 12247399) [(0, 1), (7, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 62 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0062_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0062
        rs_R009_ueqv_R009NNNYN_generator_16_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_16_0062 := by
  native_decide

/-- Coefficient term 63 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0063 : Poly :=
[
  term ((218071120 : Rat) / 110226591) [(0, 1), (7, 1), (12, 1), (15, 1)]
]

/-- Partial product 63 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0063 : Poly :=
[
  term ((436142240 : Rat) / 110226591) [(0, 1), (6, 1), (7, 1), (12, 1), (15, 1)],
  term ((-218071120 : Rat) / 110226591) [(0, 1), (7, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 63 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0063_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0063
        rs_R009_ueqv_R009NNNYN_generator_16_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_16_0063 := by
  native_decide

/-- Coefficient term 64 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0064 : Poly :=
[
  term ((-7094685227 : Rat) / 1396203486) [(0, 1), (7, 1), (13, 1)]
]

/-- Partial product 64 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0064 : Poly :=
[
  term ((-7094685227 : Rat) / 698101743) [(0, 1), (6, 1), (7, 1), (13, 1)],
  term ((7094685227 : Rat) / 1396203486) [(0, 1), (7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 64 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0064_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0064
        rs_R009_ueqv_R009NNNYN_generator_16_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_16_0064 := by
  native_decide

/-- Coefficient term 65 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0065 : Poly :=
[
  term ((44665740 : Rat) / 12247399) [(0, 1), (7, 1), (13, 1), (14, 1)]
]

/-- Partial product 65 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0065 : Poly :=
[
  term ((89331480 : Rat) / 12247399) [(0, 1), (6, 1), (7, 1), (13, 1), (14, 1)],
  term ((-44665740 : Rat) / 12247399) [(0, 1), (7, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 65 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0065_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0065
        rs_R009_ueqv_R009NNNYN_generator_16_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_16_0065 := by
  native_decide

/-- Coefficient term 66 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0066 : Poly :=
[
  term ((29920000 : Rat) / 110226591) [(0, 1), (7, 1), (13, 1), (15, 2)]
]

/-- Partial product 66 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0066 : Poly :=
[
  term ((59840000 : Rat) / 110226591) [(0, 1), (6, 1), (7, 1), (13, 1), (15, 2)],
  term ((-29920000 : Rat) / 110226591) [(0, 1), (7, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 66 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0066_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0066
        rs_R009_ueqv_R009NNNYN_generator_16_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_16_0066 := by
  native_decide

/-- Coefficient term 67 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0067 : Poly :=
[
  term ((-913920 : Rat) / 12247399) [(0, 1), (7, 1), (13, 2), (15, 1)]
]

/-- Partial product 67 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0067 : Poly :=
[
  term ((-1827840 : Rat) / 12247399) [(0, 1), (6, 1), (7, 1), (13, 2), (15, 1)],
  term ((913920 : Rat) / 12247399) [(0, 1), (7, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 67 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0067_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0067
        rs_R009_ueqv_R009NNNYN_generator_16_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_16_0067 := by
  native_decide

/-- Coefficient term 68 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0068 : Poly :=
[
  term ((-286427920 : Rat) / 36742197) [(0, 1), (7, 1), (14, 1), (15, 1)]
]

/-- Partial product 68 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0068 : Poly :=
[
  term ((-572855840 : Rat) / 36742197) [(0, 1), (6, 1), (7, 1), (14, 1), (15, 1)],
  term ((286427920 : Rat) / 36742197) [(0, 1), (7, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 68 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0068_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0068
        rs_R009_ueqv_R009NNNYN_generator_16_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_16_0068 := by
  native_decide

/-- Coefficient term 69 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0069 : Poly :=
[
  term ((177162535988 : Rat) / 18848747061) [(0, 1), (7, 1), (15, 1)]
]

/-- Partial product 69 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0069 : Poly :=
[
  term ((354325071976 : Rat) / 18848747061) [(0, 1), (6, 1), (7, 1), (15, 1)],
  term ((-177162535988 : Rat) / 18848747061) [(0, 1), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 69 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0069_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0069
        rs_R009_ueqv_R009NNNYN_generator_16_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_16_0069 := by
  native_decide

/-- Coefficient term 70 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0070 : Poly :=
[
  term ((-8791040 : Rat) / 36742197) [(0, 1), (7, 1), (15, 3)]
]

/-- Partial product 70 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0070 : Poly :=
[
  term ((-17582080 : Rat) / 36742197) [(0, 1), (6, 1), (7, 1), (15, 3)],
  term ((8791040 : Rat) / 36742197) [(0, 1), (7, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 70 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0070_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0070
        rs_R009_ueqv_R009NNNYN_generator_16_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_16_0070 := by
  native_decide

/-- Coefficient term 71 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0071 : Poly :=
[
  term ((-635841801728 : Rat) / 31414578435) [(0, 1), (9, 1), (10, 1), (11, 1)]
]

/-- Partial product 71 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0071 : Poly :=
[
  term ((-1271683603456 : Rat) / 31414578435) [(0, 1), (6, 1), (9, 1), (10, 1), (11, 1)],
  term ((635841801728 : Rat) / 31414578435) [(0, 1), (9, 1), (10, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 71 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0071_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0071
        rs_R009_ueqv_R009NNNYN_generator_16_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_16_0071 := by
  native_decide

/-- Coefficient term 72 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0072 : Poly :=
[
  term ((-9935028152 : Rat) / 1163502905) [(0, 1), (9, 1), (10, 1), (13, 1)]
]

/-- Partial product 72 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0072 : Poly :=
[
  term ((-19870056304 : Rat) / 1163502905) [(0, 1), (6, 1), (9, 1), (10, 1), (13, 1)],
  term ((9935028152 : Rat) / 1163502905) [(0, 1), (9, 1), (10, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 72 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0072_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0072
        rs_R009_ueqv_R009NNNYN_generator_16_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_16_0072 := by
  native_decide

/-- Coefficient term 73 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0073 : Poly :=
[
  term ((573393053344 : Rat) / 31414578435) [(0, 1), (9, 1), (10, 1), (15, 1)]
]

/-- Partial product 73 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0073 : Poly :=
[
  term ((1146786106688 : Rat) / 31414578435) [(0, 1), (6, 1), (9, 1), (10, 1), (15, 1)],
  term ((-573393053344 : Rat) / 31414578435) [(0, 1), (9, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 73 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0073_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0073
        rs_R009_ueqv_R009NNNYN_generator_16_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_16_0073 := by
  native_decide

/-- Coefficient term 74 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0074 : Poly :=
[
  term ((2717645423096 : Rat) / 94243735305) [(0, 1), (9, 1), (11, 1)]
]

/-- Partial product 74 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0074 : Poly :=
[
  term ((5435290846192 : Rat) / 94243735305) [(0, 1), (6, 1), (9, 1), (11, 1)],
  term ((-2717645423096 : Rat) / 94243735305) [(0, 1), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 74 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0074_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0074
        rs_R009_ueqv_R009NNNYN_generator_16_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_16_0074 := by
  native_decide

/-- Coefficient term 75 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0075 : Poly :=
[
  term ((-3270356992 : Rat) / 36742197) [(0, 1), (9, 1), (11, 1), (12, 1)]
]

/-- Partial product 75 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0075 : Poly :=
[
  term ((-6540713984 : Rat) / 36742197) [(0, 1), (6, 1), (9, 1), (11, 1), (12, 1)],
  term ((3270356992 : Rat) / 36742197) [(0, 1), (9, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 75 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0075_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0075
        rs_R009_ueqv_R009NNNYN_generator_16_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_16_0075 := by
  native_decide

/-- Coefficient term 76 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0076 : Poly :=
[
  term ((-80120320 : Rat) / 110226591) [(0, 1), (9, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 76 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0076 : Poly :=
[
  term ((-160240640 : Rat) / 110226591) [(0, 1), (6, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((80120320 : Rat) / 110226591) [(0, 1), (9, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 76 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0076_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0076
        rs_R009_ueqv_R009NNNYN_generator_16_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_16_0076 := by
  native_decide

/-- Coefficient term 77 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0077 : Poly :=
[
  term ((2814853888 : Rat) / 110226591) [(0, 1), (9, 1), (11, 1), (14, 1)]
]

/-- Partial product 77 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0077 : Poly :=
[
  term ((5629707776 : Rat) / 110226591) [(0, 1), (6, 1), (9, 1), (11, 1), (14, 1)],
  term ((-2814853888 : Rat) / 110226591) [(0, 1), (9, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 77 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0077_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0077
        rs_R009_ueqv_R009NNNYN_generator_16_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_16_0077 := by
  native_decide

/-- Coefficient term 78 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0078 : Poly :=
[
  term ((22804480 : Rat) / 36742197) [(0, 1), (9, 1), (11, 1), (15, 2)]
]

/-- Partial product 78 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0078 : Poly :=
[
  term ((45608960 : Rat) / 36742197) [(0, 1), (6, 1), (9, 1), (11, 1), (15, 2)],
  term ((-22804480 : Rat) / 36742197) [(0, 1), (9, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 78 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0078_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0078
        rs_R009_ueqv_R009NNNYN_generator_16_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_16_0078 := by
  native_decide

/-- Coefficient term 79 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0079 : Poly :=
[
  term ((-97484800 : Rat) / 110226591) [(0, 1), (9, 1), (11, 2), (15, 1)]
]

/-- Partial product 79 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0079 : Poly :=
[
  term ((-194969600 : Rat) / 110226591) [(0, 1), (6, 1), (9, 1), (11, 2), (15, 1)],
  term ((97484800 : Rat) / 110226591) [(0, 1), (9, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 79 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0079_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0079
        rs_R009_ueqv_R009NNNYN_generator_16_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_16_0079 := by
  native_decide

/-- Coefficient term 80 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0080 : Poly :=
[
  term ((-459893952 : Rat) / 12247399) [(0, 1), (9, 1), (12, 1), (13, 1)]
]

/-- Partial product 80 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0080 : Poly :=
[
  term ((-919787904 : Rat) / 12247399) [(0, 1), (6, 1), (9, 1), (12, 1), (13, 1)],
  term ((459893952 : Rat) / 12247399) [(0, 1), (9, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 80 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0080_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0080
        rs_R009_ueqv_R009NNNYN_generator_16_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_16_0080 := by
  native_decide

/-- Coefficient term 81 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0081 : Poly :=
[
  term ((2949161216 : Rat) / 36742197) [(0, 1), (9, 1), (12, 1), (15, 1)]
]

/-- Partial product 81 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0081 : Poly :=
[
  term ((5898322432 : Rat) / 36742197) [(0, 1), (6, 1), (9, 1), (12, 1), (15, 1)],
  term ((-2949161216 : Rat) / 36742197) [(0, 1), (9, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 81 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0081_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0081
        rs_R009_ueqv_R009NNNYN_generator_16_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_16_0081 := by
  native_decide

/-- Coefficient term 82 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0082 : Poly :=
[
  term ((90201255403 : Rat) / 6981017430) [(0, 1), (9, 1), (13, 1)]
]

/-- Partial product 82 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0082 : Poly :=
[
  term ((90201255403 : Rat) / 3490508715) [(0, 1), (6, 1), (9, 1), (13, 1)],
  term ((-90201255403 : Rat) / 6981017430) [(0, 1), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 82 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0082_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0082
        rs_R009_ueqv_R009NNNYN_generator_16_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_16_0082 := by
  native_decide

/-- Coefficient term 83 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0083 : Poly :=
[
  term ((131946276 : Rat) / 12247399) [(0, 1), (9, 1), (13, 1), (14, 1)]
]

/-- Partial product 83 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0083 : Poly :=
[
  term ((263892552 : Rat) / 12247399) [(0, 1), (6, 1), (9, 1), (13, 1), (14, 1)],
  term ((-131946276 : Rat) / 12247399) [(0, 1), (9, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 83 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0083_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0083
        rs_R009_ueqv_R009NNNYN_generator_16_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_16_0083 := by
  native_decide

/-- Coefficient term 84 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0084 : Poly :=
[
  term ((26938880 : Rat) / 110226591) [(0, 1), (9, 1), (13, 1), (15, 2)]
]

/-- Partial product 84 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0084 : Poly :=
[
  term ((53877760 : Rat) / 110226591) [(0, 1), (6, 1), (9, 1), (13, 1), (15, 2)],
  term ((-26938880 : Rat) / 110226591) [(0, 1), (9, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 84 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0084_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0084
        rs_R009_ueqv_R009NNNYN_generator_16_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_16_0084 := by
  native_decide

/-- Coefficient term 85 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0085 : Poly :=
[
  term ((-1827840 : Rat) / 12247399) [(0, 1), (9, 1), (13, 2), (15, 1)]
]

/-- Partial product 85 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0085 : Poly :=
[
  term ((-3655680 : Rat) / 12247399) [(0, 1), (6, 1), (9, 1), (13, 2), (15, 1)],
  term ((1827840 : Rat) / 12247399) [(0, 1), (9, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 85 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0085_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0085
        rs_R009_ueqv_R009NNNYN_generator_16_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_16_0085 := by
  native_decide

/-- Coefficient term 86 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0086 : Poly :=
[
  term ((-2538395024 : Rat) / 110226591) [(0, 1), (9, 1), (14, 1), (15, 1)]
]

/-- Partial product 86 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0086 : Poly :=
[
  term ((-5076790048 : Rat) / 110226591) [(0, 1), (6, 1), (9, 1), (14, 1), (15, 1)],
  term ((2538395024 : Rat) / 110226591) [(0, 1), (9, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 86 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0086_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0086
        rs_R009_ueqv_R009NNNYN_generator_16_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_16_0086 := by
  native_decide

/-- Coefficient term 87 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0087 : Poly :=
[
  term ((-2878648604398 : Rat) / 94243735305) [(0, 1), (9, 1), (15, 1)]
]

/-- Partial product 87 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0087 : Poly :=
[
  term ((-5757297208796 : Rat) / 94243735305) [(0, 1), (6, 1), (9, 1), (15, 1)],
  term ((2878648604398 : Rat) / 94243735305) [(0, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 87 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0087_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0087
        rs_R009_ueqv_R009NNNYN_generator_16_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_16_0087 := by
  native_decide

/-- Coefficient term 88 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0088 : Poly :=
[
  term ((17582080 : Rat) / 110226591) [(0, 1), (9, 1), (15, 3)]
]

/-- Partial product 88 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0088 : Poly :=
[
  term ((35164160 : Rat) / 110226591) [(0, 1), (6, 1), (9, 1), (15, 3)],
  term ((-17582080 : Rat) / 110226591) [(0, 1), (9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 88 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0088_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0088
        rs_R009_ueqv_R009NNNYN_generator_16_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_16_0088 := by
  native_decide

/-- Coefficient term 89 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0089 : Poly :=
[
  term ((-348 : Rat) / 67) [(0, 1), (9, 2)]
]

/-- Partial product 89 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0089 : Poly :=
[
  term ((-696 : Rat) / 67) [(0, 1), (6, 1), (9, 2)],
  term ((348 : Rat) / 67) [(0, 1), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 89 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0089_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0089
        rs_R009_ueqv_R009NNNYN_generator_16_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_16_0089 := by
  native_decide

/-- Coefficient term 90 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0090 : Poly :=
[
  term ((576880640 : Rat) / 330679773) [(0, 1), (11, 1), (12, 1), (13, 1)]
]

/-- Partial product 90 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0090 : Poly :=
[
  term ((1153761280 : Rat) / 330679773) [(0, 1), (6, 1), (11, 1), (12, 1), (13, 1)],
  term ((-576880640 : Rat) / 330679773) [(0, 1), (11, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 90 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0090_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0090
        rs_R009_ueqv_R009NNNYN_generator_16_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_16_0090 := by
  native_decide

/-- Coefficient term 91 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0091 : Poly :=
[
  term ((-8945914880 : Rat) / 330679773) [(0, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 91 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0091 : Poly :=
[
  term ((-17891829760 : Rat) / 330679773) [(0, 1), (6, 1), (11, 1), (12, 1), (15, 1)],
  term ((8945914880 : Rat) / 330679773) [(0, 1), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 91 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0091_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0091
        rs_R009_ueqv_R009NNNYN_generator_16_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_16_0091 := by
  native_decide

/-- Coefficient term 92 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0092 : Poly :=
[
  term ((70491799532 : Rat) / 3490508715) [(0, 1), (11, 1), (13, 1)]
]

/-- Partial product 92 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0092 : Poly :=
[
  term ((140983599064 : Rat) / 3490508715) [(0, 1), (6, 1), (11, 1), (13, 1)],
  term ((-70491799532 : Rat) / 3490508715) [(0, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 92 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0092_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0092
        rs_R009_ueqv_R009NNNYN_generator_16_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_16_0092 := by
  native_decide

/-- Coefficient term 93 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0093 : Poly :=
[
  term ((-355452160 : Rat) / 110226591) [(0, 1), (11, 1), (13, 1), (14, 1)]
]

/-- Partial product 93 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0093 : Poly :=
[
  term ((-710904320 : Rat) / 110226591) [(0, 1), (6, 1), (11, 1), (13, 1), (14, 1)],
  term ((355452160 : Rat) / 110226591) [(0, 1), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 93 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0093_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0093
        rs_R009_ueqv_R009NNNYN_generator_16_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_16_0093 := by
  native_decide

/-- Coefficient term 94 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0094 : Poly :=
[
  term ((43955200 : Rat) / 110226591) [(0, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 94 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0094 : Poly :=
[
  term ((87910400 : Rat) / 110226591) [(0, 1), (6, 1), (11, 1), (14, 1), (15, 1)],
  term ((-43955200 : Rat) / 110226591) [(0, 1), (11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 94 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0094_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0094
        rs_R009_ueqv_R009NNNYN_generator_16_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_16_0094 := by
  native_decide

/-- Coefficient term 95 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0095 : Poly :=
[
  term ((98349338224 : Rat) / 10471526145) [(0, 1), (11, 1), (15, 1)]
]

/-- Partial product 95 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0095 : Poly :=
[
  term ((196698676448 : Rat) / 10471526145) [(0, 1), (6, 1), (11, 1), (15, 1)],
  term ((-98349338224 : Rat) / 10471526145) [(0, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 95 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0095_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0095
        rs_R009_ueqv_R009NNNYN_generator_16_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_16_0095 := by
  native_decide

/-- Coefficient term 96 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0096 : Poly :=
[
  term ((-109060652288 : Rat) / 10471526145) [(0, 1), (11, 2)]
]

/-- Partial product 96 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0096 : Poly :=
[
  term ((-218121304576 : Rat) / 10471526145) [(0, 1), (6, 1), (11, 2)],
  term ((109060652288 : Rat) / 10471526145) [(0, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 96 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0096_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0096
        rs_R009_ueqv_R009NNNYN_generator_16_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_16_0096 := by
  native_decide

/-- Coefficient term 97 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0097 : Poly :=
[
  term ((-48742400 : Rat) / 110226591) [(0, 1), (11, 2), (14, 1)]
]

/-- Partial product 97 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0097 : Poly :=
[
  term ((-97484800 : Rat) / 110226591) [(0, 1), (6, 1), (11, 2), (14, 1)],
  term ((48742400 : Rat) / 110226591) [(0, 1), (11, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 97 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0097_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0097
        rs_R009_ueqv_R009NNNYN_generator_16_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_16_0097 := by
  native_decide

/-- Coefficient term 98 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0098 : Poly :=
[
  term ((-4294280560 : Rat) / 330679773) [(0, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 98 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0098 : Poly :=
[
  term ((-8588561120 : Rat) / 330679773) [(0, 1), (6, 1), (12, 1), (13, 1), (15, 1)],
  term ((4294280560 : Rat) / 330679773) [(0, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 98 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0098_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0098
        rs_R009_ueqv_R009NNNYN_generator_16_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_16_0098 := by
  native_decide

/-- Coefficient term 99 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0099 : Poly :=
[
  term ((9013760 : Rat) / 12247399) [(0, 1), (12, 1), (13, 2)]
]

/-- Partial product 99 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0099 : Poly :=
[
  term ((18027520 : Rat) / 12247399) [(0, 1), (6, 1), (12, 1), (13, 2)],
  term ((-9013760 : Rat) / 12247399) [(0, 1), (12, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 99 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0099_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0099
        rs_R009_ueqv_R009NNNYN_generator_16_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_16_0099 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NNNYN_partials_16_0000_0099 : List Poly :=
[
  rs_R009_ueqv_R009NNNYN_partial_16_0000,
  rs_R009_ueqv_R009NNNYN_partial_16_0001,
  rs_R009_ueqv_R009NNNYN_partial_16_0002,
  rs_R009_ueqv_R009NNNYN_partial_16_0003,
  rs_R009_ueqv_R009NNNYN_partial_16_0004,
  rs_R009_ueqv_R009NNNYN_partial_16_0005,
  rs_R009_ueqv_R009NNNYN_partial_16_0006,
  rs_R009_ueqv_R009NNNYN_partial_16_0007,
  rs_R009_ueqv_R009NNNYN_partial_16_0008,
  rs_R009_ueqv_R009NNNYN_partial_16_0009,
  rs_R009_ueqv_R009NNNYN_partial_16_0010,
  rs_R009_ueqv_R009NNNYN_partial_16_0011,
  rs_R009_ueqv_R009NNNYN_partial_16_0012,
  rs_R009_ueqv_R009NNNYN_partial_16_0013,
  rs_R009_ueqv_R009NNNYN_partial_16_0014,
  rs_R009_ueqv_R009NNNYN_partial_16_0015,
  rs_R009_ueqv_R009NNNYN_partial_16_0016,
  rs_R009_ueqv_R009NNNYN_partial_16_0017,
  rs_R009_ueqv_R009NNNYN_partial_16_0018,
  rs_R009_ueqv_R009NNNYN_partial_16_0019,
  rs_R009_ueqv_R009NNNYN_partial_16_0020,
  rs_R009_ueqv_R009NNNYN_partial_16_0021,
  rs_R009_ueqv_R009NNNYN_partial_16_0022,
  rs_R009_ueqv_R009NNNYN_partial_16_0023,
  rs_R009_ueqv_R009NNNYN_partial_16_0024,
  rs_R009_ueqv_R009NNNYN_partial_16_0025,
  rs_R009_ueqv_R009NNNYN_partial_16_0026,
  rs_R009_ueqv_R009NNNYN_partial_16_0027,
  rs_R009_ueqv_R009NNNYN_partial_16_0028,
  rs_R009_ueqv_R009NNNYN_partial_16_0029,
  rs_R009_ueqv_R009NNNYN_partial_16_0030,
  rs_R009_ueqv_R009NNNYN_partial_16_0031,
  rs_R009_ueqv_R009NNNYN_partial_16_0032,
  rs_R009_ueqv_R009NNNYN_partial_16_0033,
  rs_R009_ueqv_R009NNNYN_partial_16_0034,
  rs_R009_ueqv_R009NNNYN_partial_16_0035,
  rs_R009_ueqv_R009NNNYN_partial_16_0036,
  rs_R009_ueqv_R009NNNYN_partial_16_0037,
  rs_R009_ueqv_R009NNNYN_partial_16_0038,
  rs_R009_ueqv_R009NNNYN_partial_16_0039,
  rs_R009_ueqv_R009NNNYN_partial_16_0040,
  rs_R009_ueqv_R009NNNYN_partial_16_0041,
  rs_R009_ueqv_R009NNNYN_partial_16_0042,
  rs_R009_ueqv_R009NNNYN_partial_16_0043,
  rs_R009_ueqv_R009NNNYN_partial_16_0044,
  rs_R009_ueqv_R009NNNYN_partial_16_0045,
  rs_R009_ueqv_R009NNNYN_partial_16_0046,
  rs_R009_ueqv_R009NNNYN_partial_16_0047,
  rs_R009_ueqv_R009NNNYN_partial_16_0048,
  rs_R009_ueqv_R009NNNYN_partial_16_0049,
  rs_R009_ueqv_R009NNNYN_partial_16_0050,
  rs_R009_ueqv_R009NNNYN_partial_16_0051,
  rs_R009_ueqv_R009NNNYN_partial_16_0052,
  rs_R009_ueqv_R009NNNYN_partial_16_0053,
  rs_R009_ueqv_R009NNNYN_partial_16_0054,
  rs_R009_ueqv_R009NNNYN_partial_16_0055,
  rs_R009_ueqv_R009NNNYN_partial_16_0056,
  rs_R009_ueqv_R009NNNYN_partial_16_0057,
  rs_R009_ueqv_R009NNNYN_partial_16_0058,
  rs_R009_ueqv_R009NNNYN_partial_16_0059,
  rs_R009_ueqv_R009NNNYN_partial_16_0060,
  rs_R009_ueqv_R009NNNYN_partial_16_0061,
  rs_R009_ueqv_R009NNNYN_partial_16_0062,
  rs_R009_ueqv_R009NNNYN_partial_16_0063,
  rs_R009_ueqv_R009NNNYN_partial_16_0064,
  rs_R009_ueqv_R009NNNYN_partial_16_0065,
  rs_R009_ueqv_R009NNNYN_partial_16_0066,
  rs_R009_ueqv_R009NNNYN_partial_16_0067,
  rs_R009_ueqv_R009NNNYN_partial_16_0068,
  rs_R009_ueqv_R009NNNYN_partial_16_0069,
  rs_R009_ueqv_R009NNNYN_partial_16_0070,
  rs_R009_ueqv_R009NNNYN_partial_16_0071,
  rs_R009_ueqv_R009NNNYN_partial_16_0072,
  rs_R009_ueqv_R009NNNYN_partial_16_0073,
  rs_R009_ueqv_R009NNNYN_partial_16_0074,
  rs_R009_ueqv_R009NNNYN_partial_16_0075,
  rs_R009_ueqv_R009NNNYN_partial_16_0076,
  rs_R009_ueqv_R009NNNYN_partial_16_0077,
  rs_R009_ueqv_R009NNNYN_partial_16_0078,
  rs_R009_ueqv_R009NNNYN_partial_16_0079,
  rs_R009_ueqv_R009NNNYN_partial_16_0080,
  rs_R009_ueqv_R009NNNYN_partial_16_0081,
  rs_R009_ueqv_R009NNNYN_partial_16_0082,
  rs_R009_ueqv_R009NNNYN_partial_16_0083,
  rs_R009_ueqv_R009NNNYN_partial_16_0084,
  rs_R009_ueqv_R009NNNYN_partial_16_0085,
  rs_R009_ueqv_R009NNNYN_partial_16_0086,
  rs_R009_ueqv_R009NNNYN_partial_16_0087,
  rs_R009_ueqv_R009NNNYN_partial_16_0088,
  rs_R009_ueqv_R009NNNYN_partial_16_0089,
  rs_R009_ueqv_R009NNNYN_partial_16_0090,
  rs_R009_ueqv_R009NNNYN_partial_16_0091,
  rs_R009_ueqv_R009NNNYN_partial_16_0092,
  rs_R009_ueqv_R009NNNYN_partial_16_0093,
  rs_R009_ueqv_R009NNNYN_partial_16_0094,
  rs_R009_ueqv_R009NNNYN_partial_16_0095,
  rs_R009_ueqv_R009NNNYN_partial_16_0096,
  rs_R009_ueqv_R009NNNYN_partial_16_0097,
  rs_R009_ueqv_R009NNNYN_partial_16_0098,
  rs_R009_ueqv_R009NNNYN_partial_16_0099
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NNNYN_block_16_0000_0099 : Poly :=
[
  term ((17 : Rat) / 16) [],
  term ((38993920 : Rat) / 110226591) [(0, 1), (2, 1), (6, 1), (7, 1), (11, 1)],
  term ((1827840 : Rat) / 12247399) [(0, 1), (2, 1), (6, 1), (7, 1), (13, 1)],
  term ((-35164160 : Rat) / 110226591) [(0, 1), (2, 1), (6, 1), (7, 1), (15, 1)],
  term ((236257280 : Rat) / 36742197) [(0, 1), (2, 1), (6, 1), (9, 1), (11, 1)],
  term ((33223680 : Rat) / 12247399) [(0, 1), (2, 1), (6, 1), (9, 1), (13, 1)],
  term ((-213053440 : Rat) / 36742197) [(0, 1), (2, 1), (6, 1), (9, 1), (15, 1)],
  term ((669777920 : Rat) / 110226591) [(0, 1), (2, 1), (6, 1), (11, 1), (13, 1)],
  term ((4995200000 : Rat) / 110226591) [(0, 1), (2, 1), (6, 1), (11, 1), (15, 1)],
  term ((1503353840 : Rat) / 110226591) [(0, 1), (2, 1), (6, 1), (13, 1), (15, 1)],
  term ((31395840 : Rat) / 12247399) [(0, 1), (2, 1), (6, 1), (13, 2)],
  term ((-4504600000 : Rat) / 110226591) [(0, 1), (2, 1), (6, 1), (15, 2)],
  term ((-19496960 : Rat) / 110226591) [(0, 1), (2, 1), (7, 1), (11, 1)],
  term ((-913920 : Rat) / 12247399) [(0, 1), (2, 1), (7, 1), (13, 1)],
  term ((17582080 : Rat) / 110226591) [(0, 1), (2, 1), (7, 1), (15, 1)],
  term ((-118128640 : Rat) / 36742197) [(0, 1), (2, 1), (9, 1), (11, 1)],
  term ((-16611840 : Rat) / 12247399) [(0, 1), (2, 1), (9, 1), (13, 1)],
  term ((106526720 : Rat) / 36742197) [(0, 1), (2, 1), (9, 1), (15, 1)],
  term ((-334888960 : Rat) / 110226591) [(0, 1), (2, 1), (11, 1), (13, 1)],
  term ((-2497600000 : Rat) / 110226591) [(0, 1), (2, 1), (11, 1), (15, 1)],
  term ((-751676920 : Rat) / 110226591) [(0, 1), (2, 1), (13, 1), (15, 1)],
  term ((-15697920 : Rat) / 12247399) [(0, 1), (2, 1), (13, 2)],
  term ((2252300000 : Rat) / 110226591) [(0, 1), (2, 1), (15, 2)],
  term ((2371747840 : Rat) / 330679773) [(0, 1), (3, 1), (6, 1), (11, 1)],
  term ((1574935040 : Rat) / 330679773) [(0, 1), (3, 1), (6, 1), (11, 1), (12, 1)],
  term ((-3375662080 : Rat) / 110226591) [(0, 1), (3, 1), (6, 1), (11, 1), (14, 1)],
  term ((24608360 : Rat) / 12247399) [(0, 1), (3, 1), (6, 1), (12, 1), (13, 1)],
  term ((-1420253920 : Rat) / 330679773) [(0, 1), (3, 1), (6, 1), (12, 1), (15, 1)],
  term ((37058560 : Rat) / 12247399) [(0, 1), (3, 1), (6, 1), (13, 1)],
  term ((-158234160 : Rat) / 12247399) [(0, 1), (3, 1), (6, 1), (13, 1), (14, 1)],
  term ((3044123840 : Rat) / 110226591) [(0, 1), (3, 1), (6, 1), (14, 1), (15, 1)],
  term ((-2138808320 : Rat) / 330679773) [(0, 1), (3, 1), (6, 1), (15, 1)],
  term ((-1185873920 : Rat) / 330679773) [(0, 1), (3, 1), (11, 1)],
  term ((-787467520 : Rat) / 330679773) [(0, 1), (3, 1), (11, 1), (12, 1)],
  term ((1687831040 : Rat) / 110226591) [(0, 1), (3, 1), (11, 1), (14, 1)],
  term ((-12304180 : Rat) / 12247399) [(0, 1), (3, 1), (12, 1), (13, 1)],
  term ((710126960 : Rat) / 330679773) [(0, 1), (3, 1), (12, 1), (15, 1)],
  term ((-18529280 : Rat) / 12247399) [(0, 1), (3, 1), (13, 1)],
  term ((79117080 : Rat) / 12247399) [(0, 1), (3, 1), (13, 1), (14, 1)],
  term ((-1522061920 : Rat) / 110226591) [(0, 1), (3, 1), (14, 1), (15, 1)],
  term ((1069404160 : Rat) / 330679773) [(0, 1), (3, 1), (15, 1)],
  term ((6813318400 : Rat) / 330679773) [(0, 1), (4, 1), (6, 1), (7, 1), (11, 1)],
  term ((106458100 : Rat) / 12247399) [(0, 1), (4, 1), (6, 1), (7, 1), (13, 1)],
  term ((-6144153200 : Rat) / 330679773) [(0, 1), (4, 1), (6, 1), (7, 1), (15, 1)],
  term ((44873921792 : Rat) / 330679773) [(0, 1), (4, 1), (6, 1), (9, 1), (11, 1)],
  term ((701155028 : Rat) / 12247399) [(0, 1), (4, 1), (6, 1), (9, 1), (13, 1)],
  term ((-40466661616 : Rat) / 330679773) [(0, 1), (4, 1), (6, 1), (9, 1), (15, 1)],
  term ((-8186909696 : Rat) / 110226591) [(0, 1), (4, 1), (6, 1), (11, 1), (13, 1)],
  term ((14852561920 : Rat) / 330679773) [(0, 1), (4, 1), (6, 1), (11, 1), (15, 1)],
  term ((9471479728 : Rat) / 110226591) [(0, 1), (4, 1), (6, 1), (13, 1), (15, 1)],
  term ((-383761392 : Rat) / 12247399) [(0, 1), (4, 1), (6, 1), (13, 2)],
  term ((-13393828160 : Rat) / 330679773) [(0, 1), (4, 1), (6, 1), (15, 2)],
  term ((-3406659200 : Rat) / 330679773) [(0, 1), (4, 1), (7, 1), (11, 1)],
  term ((-53229050 : Rat) / 12247399) [(0, 1), (4, 1), (7, 1), (13, 1)],
  term ((3072076600 : Rat) / 330679773) [(0, 1), (4, 1), (7, 1), (15, 1)],
  term ((-22436960896 : Rat) / 330679773) [(0, 1), (4, 1), (9, 1), (11, 1)],
  term ((-350577514 : Rat) / 12247399) [(0, 1), (4, 1), (9, 1), (13, 1)],
  term ((20233330808 : Rat) / 330679773) [(0, 1), (4, 1), (9, 1), (15, 1)],
  term ((4093454848 : Rat) / 110226591) [(0, 1), (4, 1), (11, 1), (13, 1)],
  term ((-7426280960 : Rat) / 330679773) [(0, 1), (4, 1), (11, 1), (15, 1)],
  term ((-4735739864 : Rat) / 110226591) [(0, 1), (4, 1), (13, 1), (15, 1)],
  term ((191880696 : Rat) / 12247399) [(0, 1), (4, 1), (13, 2)],
  term ((6696914080 : Rat) / 330679773) [(0, 1), (4, 1), (15, 2)],
  term ((588 : Rat) / 67) [(0, 1), (5, 1), (6, 1), (9, 1)],
  term ((-2580411430912 : Rat) / 31414578435) [(0, 1), (5, 1), (6, 1), (10, 1), (11, 1)],
  term ((-40318928608 : Rat) / 1163502905) [(0, 1), (5, 1), (6, 1), (10, 1), (13, 1)],
  term ((2326978165376 : Rat) / 31414578435) [(0, 1), (5, 1), (6, 1), (10, 1), (15, 1)],
  term ((-5024193452096 : Rat) / 94243735305) [(0, 1), (5, 1), (6, 1), (11, 1)],
  term ((26634969088 : Rat) / 110226591) [(0, 1), (5, 1), (6, 1), (11, 1), (12, 1)],
  term ((38993920 : Rat) / 110226591) [(0, 1), (5, 1), (6, 1), (11, 1), (13, 1), (15, 1)],
  term ((12981326848 : Rat) / 330679773) [(0, 1), (5, 1), (6, 1), (11, 1), (14, 1)],
  term ((-370442240 : Rat) / 110226591) [(0, 1), (5, 1), (6, 1), (11, 1), (15, 2)],
  term ((1248514176 : Rat) / 12247399) [(0, 1), (5, 1), (6, 1), (12, 1), (13, 1)],
  term ((-23545224800 : Rat) / 110226591) [(0, 1), (5, 1), (6, 1), (12, 1), (15, 1)],
  term ((-78503022689 : Rat) / 3490508715) [(0, 1), (5, 1), (6, 1), (13, 1)],
  term ((202833232 : Rat) / 12247399) [(0, 1), (5, 1), (6, 1), (13, 1), (14, 1)],
  term ((-3612160 : Rat) / 2079747) [(0, 1), (5, 1), (6, 1), (13, 1), (15, 2)],
  term ((1827840 : Rat) / 12247399) [(0, 1), (5, 1), (6, 1), (13, 2), (15, 1)],
  term ((-11706375104 : Rat) / 330679773) [(0, 1), (5, 1), (6, 1), (14, 1), (15, 1)],
  term ((4806443972248 : Rat) / 94243735305) [(0, 1), (5, 1), (6, 1), (15, 1)],
  term ((334059520 : Rat) / 110226591) [(0, 1), (5, 1), (6, 1), (15, 3)],
  term ((-6813318400 : Rat) / 330679773) [(0, 1), (5, 1), (6, 2), (11, 1)],
  term ((-106458100 : Rat) / 12247399) [(0, 1), (5, 1), (6, 2), (13, 1)],
  term ((6144153200 : Rat) / 330679773) [(0, 1), (5, 1), (6, 2), (15, 1)],
  term ((-294 : Rat) / 67) [(0, 1), (5, 1), (9, 1)],
  term ((1290205715456 : Rat) / 31414578435) [(0, 1), (5, 1), (10, 1), (11, 1)],
  term ((20159464304 : Rat) / 1163502905) [(0, 1), (5, 1), (10, 1), (13, 1)],
  term ((-1163489082688 : Rat) / 31414578435) [(0, 1), (5, 1), (10, 1), (15, 1)],
  term ((2997545662048 : Rat) / 94243735305) [(0, 1), (5, 1), (11, 1)],
  term ((-13317484544 : Rat) / 110226591) [(0, 1), (5, 1), (11, 1), (12, 1)],
  term ((-19496960 : Rat) / 110226591) [(0, 1), (5, 1), (11, 1), (13, 1), (15, 1)],
  term ((-6490663424 : Rat) / 330679773) [(0, 1), (5, 1), (11, 1), (14, 1)],
  term ((185221120 : Rat) / 110226591) [(0, 1), (5, 1), (11, 1), (15, 2)],
  term ((-624257088 : Rat) / 12247399) [(0, 1), (5, 1), (12, 1), (13, 1)],
  term ((11772612400 : Rat) / 110226591) [(0, 1), (5, 1), (12, 1), (15, 1)],
  term ((93673301939 : Rat) / 6981017430) [(0, 1), (5, 1), (13, 1)],
  term ((-101416616 : Rat) / 12247399) [(0, 1), (5, 1), (13, 1), (14, 1)],
  term ((1806080 : Rat) / 2079747) [(0, 1), (5, 1), (13, 1), (15, 2)],
  term ((-913920 : Rat) / 12247399) [(0, 1), (5, 1), (13, 2), (15, 1)],
  term ((5853187552 : Rat) / 330679773) [(0, 1), (5, 1), (14, 1), (15, 1)],
  term ((-2840992901624 : Rat) / 94243735305) [(0, 1), (5, 1), (15, 1)],
  term ((-167029760 : Rat) / 110226591) [(0, 1), (5, 1), (15, 3)],
  term ((-588 : Rat) / 67) [(0, 1), (6, 1), (7, 1), (9, 1)],
  term ((-454059854528 : Rat) / 18848747061) [(0, 1), (6, 1), (7, 1), (11, 1)],
  term ((-483642880 : Rat) / 110226591) [(0, 1), (6, 1), (7, 1), (11, 1), (12, 1)],
  term ((-38993920 : Rat) / 110226591) [(0, 1), (6, 1), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((635246080 : Rat) / 36742197) [(0, 1), (6, 1), (7, 1), (11, 1), (14, 1)],
  term ((19496960 : Rat) / 36742197) [(0, 1), (6, 1), (7, 1), (11, 1), (15, 2)],
  term ((-22670760 : Rat) / 12247399) [(0, 1), (6, 1), (7, 1), (12, 1), (13, 1)],
  term ((436142240 : Rat) / 110226591) [(0, 1), (6, 1), (7, 1), (12, 1), (15, 1)],
  term ((-7094685227 : Rat) / 698101743) [(0, 1), (6, 1), (7, 1), (13, 1)],
  term ((89331480 : Rat) / 12247399) [(0, 1), (6, 1), (7, 1), (13, 1), (14, 1)],
  term ((59840000 : Rat) / 110226591) [(0, 1), (6, 1), (7, 1), (13, 1), (15, 2)],
  term ((-1827840 : Rat) / 12247399) [(0, 1), (6, 1), (7, 1), (13, 2), (15, 1)],
  term ((-572855840 : Rat) / 36742197) [(0, 1), (6, 1), (7, 1), (14, 1), (15, 1)],
  term ((354325071976 : Rat) / 18848747061) [(0, 1), (6, 1), (7, 1), (15, 1)],
  term ((-17582080 : Rat) / 36742197) [(0, 1), (6, 1), (7, 1), (15, 3)],
  term ((-1271683603456 : Rat) / 31414578435) [(0, 1), (6, 1), (9, 1), (10, 1), (11, 1)],
  term ((-19870056304 : Rat) / 1163502905) [(0, 1), (6, 1), (9, 1), (10, 1), (13, 1)],
  term ((1146786106688 : Rat) / 31414578435) [(0, 1), (6, 1), (9, 1), (10, 1), (15, 1)],
  term ((5435290846192 : Rat) / 94243735305) [(0, 1), (6, 1), (9, 1), (11, 1)],
  term ((-6540713984 : Rat) / 36742197) [(0, 1), (6, 1), (9, 1), (11, 1), (12, 1)],
  term ((-160240640 : Rat) / 110226591) [(0, 1), (6, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((5629707776 : Rat) / 110226591) [(0, 1), (6, 1), (9, 1), (11, 1), (14, 1)],
  term ((45608960 : Rat) / 36742197) [(0, 1), (6, 1), (9, 1), (11, 1), (15, 2)],
  term ((-194969600 : Rat) / 110226591) [(0, 1), (6, 1), (9, 1), (11, 2), (15, 1)],
  term ((-919787904 : Rat) / 12247399) [(0, 1), (6, 1), (9, 1), (12, 1), (13, 1)],
  term ((5898322432 : Rat) / 36742197) [(0, 1), (6, 1), (9, 1), (12, 1), (15, 1)],
  term ((90201255403 : Rat) / 3490508715) [(0, 1), (6, 1), (9, 1), (13, 1)],
  term ((263892552 : Rat) / 12247399) [(0, 1), (6, 1), (9, 1), (13, 1), (14, 1)],
  term ((53877760 : Rat) / 110226591) [(0, 1), (6, 1), (9, 1), (13, 1), (15, 2)],
  term ((-3655680 : Rat) / 12247399) [(0, 1), (6, 1), (9, 1), (13, 2), (15, 1)],
  term ((-5076790048 : Rat) / 110226591) [(0, 1), (6, 1), (9, 1), (14, 1), (15, 1)],
  term ((-5757297208796 : Rat) / 94243735305) [(0, 1), (6, 1), (9, 1), (15, 1)],
  term ((35164160 : Rat) / 110226591) [(0, 1), (6, 1), (9, 1), (15, 3)],
  term ((-696 : Rat) / 67) [(0, 1), (6, 1), (9, 2)],
  term ((1153761280 : Rat) / 330679773) [(0, 1), (6, 1), (11, 1), (12, 1), (13, 1)],
  term ((-17891829760 : Rat) / 330679773) [(0, 1), (6, 1), (11, 1), (12, 1), (15, 1)],
  term ((1275171700376 : Rat) / 31414578435) [(0, 1), (6, 1), (11, 1), (13, 1)],
  term ((-710904320 : Rat) / 110226591) [(0, 1), (6, 1), (11, 1), (13, 1), (14, 1)],
  term ((87910400 : Rat) / 110226591) [(0, 1), (6, 1), (11, 1), (14, 1), (15, 1)],
  term ((196698676448 : Rat) / 10471526145) [(0, 1), (6, 1), (11, 1), (15, 1)],
  term ((-218121304576 : Rat) / 10471526145) [(0, 1), (6, 1), (11, 2)],
  term ((-97484800 : Rat) / 110226591) [(0, 1), (6, 1), (11, 2), (14, 1)],
  term ((-8588561120 : Rat) / 330679773) [(0, 1), (6, 1), (12, 1), (13, 1), (15, 1)],
  term ((18027520 : Rat) / 12247399) [(0, 1), (6, 1), (12, 1), (13, 2)],
  term ((-59985920 : Rat) / 330679773) [(0, 1), (6, 1), (13, 1), (15, 1)],
  term ((1039360 : Rat) / 12247399) [(0, 1), (6, 1), (13, 2)],
  term ((-133038080 : Rat) / 330679773) [(0, 1), (6, 2), (11, 1), (13, 1)],
  term ((119971840 : Rat) / 330679773) [(0, 1), (6, 2), (13, 1), (15, 1)],
  term ((-2078720 : Rat) / 12247399) [(0, 1), (6, 2), (13, 2)],
  term ((294 : Rat) / 67) [(0, 1), (7, 1), (9, 1)],
  term ((227029927264 : Rat) / 18848747061) [(0, 1), (7, 1), (11, 1)],
  term ((241821440 : Rat) / 110226591) [(0, 1), (7, 1), (11, 1), (12, 1)],
  term ((19496960 : Rat) / 110226591) [(0, 1), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((-317623040 : Rat) / 36742197) [(0, 1), (7, 1), (11, 1), (14, 1)],
  term ((-9748480 : Rat) / 36742197) [(0, 1), (7, 1), (11, 1), (15, 2)],
  term ((11335380 : Rat) / 12247399) [(0, 1), (7, 1), (12, 1), (13, 1)],
  term ((-218071120 : Rat) / 110226591) [(0, 1), (7, 1), (12, 1), (15, 1)],
  term ((7094685227 : Rat) / 1396203486) [(0, 1), (7, 1), (13, 1)],
  term ((-44665740 : Rat) / 12247399) [(0, 1), (7, 1), (13, 1), (14, 1)],
  term ((-29920000 : Rat) / 110226591) [(0, 1), (7, 1), (13, 1), (15, 2)],
  term ((913920 : Rat) / 12247399) [(0, 1), (7, 1), (13, 2), (15, 1)],
  term ((286427920 : Rat) / 36742197) [(0, 1), (7, 1), (14, 1), (15, 1)],
  term ((-177162535988 : Rat) / 18848747061) [(0, 1), (7, 1), (15, 1)],
  term ((8791040 : Rat) / 36742197) [(0, 1), (7, 1), (15, 3)],
  term ((635841801728 : Rat) / 31414578435) [(0, 1), (9, 1), (10, 1), (11, 1)],
  term ((9935028152 : Rat) / 1163502905) [(0, 1), (9, 1), (10, 1), (13, 1)],
  term ((-573393053344 : Rat) / 31414578435) [(0, 1), (9, 1), (10, 1), (15, 1)],
  term ((-2717645423096 : Rat) / 94243735305) [(0, 1), (9, 1), (11, 1)],
  term ((3270356992 : Rat) / 36742197) [(0, 1), (9, 1), (11, 1), (12, 1)],
  term ((80120320 : Rat) / 110226591) [(0, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-2814853888 : Rat) / 110226591) [(0, 1), (9, 1), (11, 1), (14, 1)],
  term ((-22804480 : Rat) / 36742197) [(0, 1), (9, 1), (11, 1), (15, 2)],
  term ((97484800 : Rat) / 110226591) [(0, 1), (9, 1), (11, 2), (15, 1)],
  term ((459893952 : Rat) / 12247399) [(0, 1), (9, 1), (12, 1), (13, 1)],
  term ((-2949161216 : Rat) / 36742197) [(0, 1), (9, 1), (12, 1), (15, 1)],
  term ((-90201255403 : Rat) / 6981017430) [(0, 1), (9, 1), (13, 1)],
  term ((-131946276 : Rat) / 12247399) [(0, 1), (9, 1), (13, 1), (14, 1)],
  term ((-26938880 : Rat) / 110226591) [(0, 1), (9, 1), (13, 1), (15, 2)],
  term ((1827840 : Rat) / 12247399) [(0, 1), (9, 1), (13, 2), (15, 1)],
  term ((2538395024 : Rat) / 110226591) [(0, 1), (9, 1), (14, 1), (15, 1)],
  term ((2878648604398 : Rat) / 94243735305) [(0, 1), (9, 1), (15, 1)],
  term ((-17582080 : Rat) / 110226591) [(0, 1), (9, 1), (15, 3)],
  term ((348 : Rat) / 67) [(0, 1), (9, 2)],
  term ((-576880640 : Rat) / 330679773) [(0, 1), (11, 1), (12, 1), (13, 1)],
  term ((8945914880 : Rat) / 330679773) [(0, 1), (11, 1), (12, 1), (15, 1)],
  term ((-70491799532 : Rat) / 3490508715) [(0, 1), (11, 1), (13, 1)],
  term ((355452160 : Rat) / 110226591) [(0, 1), (11, 1), (13, 1), (14, 1)],
  term ((-43955200 : Rat) / 110226591) [(0, 1), (11, 1), (14, 1), (15, 1)],
  term ((-98349338224 : Rat) / 10471526145) [(0, 1), (11, 1), (15, 1)],
  term ((109060652288 : Rat) / 10471526145) [(0, 1), (11, 2)],
  term ((48742400 : Rat) / 110226591) [(0, 1), (11, 2), (14, 1)],
  term ((4294280560 : Rat) / 330679773) [(0, 1), (12, 1), (13, 1), (15, 1)],
  term ((-9013760 : Rat) / 12247399) [(0, 1), (12, 1), (13, 2)],
  term ((-17 : Rat) / 8) [(6, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 16, terms 0 through 99. -/
theorem rs_R009_ueqv_R009NNNYN_block_16_0000_0099_valid :
    checkProductSumEq rs_R009_ueqv_R009NNNYN_partials_16_0000_0099
      rs_R009_ueqv_R009NNNYN_block_16_0000_0099 = true := by
  native_decide

end R009UeqvR009NNNYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
