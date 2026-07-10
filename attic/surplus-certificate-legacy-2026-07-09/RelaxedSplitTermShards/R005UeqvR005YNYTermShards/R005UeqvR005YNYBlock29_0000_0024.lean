/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R005:u=v:R005YNY, term block 29:0-24

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R005UeqvR005YNYTermShards

/-- Generator polynomial 29 for relaxed split surplus certificate `R005:u=v:R005YNY`. -/
def rs_R005_ueqv_R005YNY_generator_29_0000_0024 : Poly :=
[
  term (2 : Rat) [(8, 1), (14, 1)],
  term (-1 : Rat) [(8, 2)],
  term (2 : Rat) [(9, 1), (15, 1)],
  term (-1 : Rat) [(9, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005YNY_coefficient_29_0000 : Poly :=
[
  term ((45738 : Rat) / 3749) [(4, 1), (7, 1), (13, 1), (16, 1)]
]

/-- Partial product 0 for generator 29. -/
def rs_R005_ueqv_R005YNY_partial_29_0000 : Poly :=
[
  term ((91476 : Rat) / 3749) [(4, 1), (7, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((-45738 : Rat) / 3749) [(4, 1), (7, 1), (8, 2), (13, 1), (16, 1)],
  term ((91476 : Rat) / 3749) [(4, 1), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-45738 : Rat) / 3749) [(4, 1), (7, 1), (9, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 29. -/
theorem rs_R005_ueqv_R005YNY_partial_29_0000_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_29_0000
        rs_R005_ueqv_R005YNY_generator_29_0000_0024 =
      rs_R005_ueqv_R005YNY_partial_29_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005YNY_coefficient_29_0001 : Poly :=
[
  term ((-37170 : Rat) / 3749) [(4, 1), (8, 1), (16, 1)]
]

/-- Partial product 1 for generator 29. -/
def rs_R005_ueqv_R005YNY_partial_29_0001 : Poly :=
[
  term ((-74340 : Rat) / 3749) [(4, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((37170 : Rat) / 3749) [(4, 1), (8, 1), (9, 2), (16, 1)],
  term ((-74340 : Rat) / 3749) [(4, 1), (8, 2), (14, 1), (16, 1)],
  term ((37170 : Rat) / 3749) [(4, 1), (8, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 29. -/
theorem rs_R005_ueqv_R005YNY_partial_29_0001_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_29_0001
        rs_R005_ueqv_R005YNY_generator_29_0000_0024 =
      rs_R005_ueqv_R005YNY_partial_29_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005YNY_coefficient_29_0002 : Poly :=
[
  term ((74340 : Rat) / 3749) [(4, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 2 for generator 29. -/
def rs_R005_ueqv_R005YNY_partial_29_0002 : Poly :=
[
  term ((148680 : Rat) / 3749) [(4, 1), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-74340 : Rat) / 3749) [(4, 1), (8, 2), (9, 1), (15, 1), (16, 1)],
  term ((148680 : Rat) / 3749) [(4, 1), (9, 2), (15, 2), (16, 1)],
  term ((-74340 : Rat) / 3749) [(4, 1), (9, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 29. -/
theorem rs_R005_ueqv_R005YNY_partial_29_0002_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_29_0002
        rs_R005_ueqv_R005YNY_generator_29_0000_0024 =
      rs_R005_ueqv_R005YNY_partial_29_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005YNY_coefficient_29_0003 : Poly :=
[
  term ((37170 : Rat) / 3749) [(4, 1), (10, 1), (16, 1)]
]

/-- Partial product 3 for generator 29. -/
def rs_R005_ueqv_R005YNY_partial_29_0003 : Poly :=
[
  term ((74340 : Rat) / 3749) [(4, 1), (8, 1), (10, 1), (14, 1), (16, 1)],
  term ((-37170 : Rat) / 3749) [(4, 1), (8, 2), (10, 1), (16, 1)],
  term ((74340 : Rat) / 3749) [(4, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-37170 : Rat) / 3749) [(4, 1), (9, 2), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 29. -/
theorem rs_R005_ueqv_R005YNY_partial_29_0003_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_29_0003
        rs_R005_ueqv_R005YNY_generator_29_0000_0024 =
      rs_R005_ueqv_R005YNY_partial_29_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005YNY_coefficient_29_0004 : Poly :=
[
  term ((-86772 : Rat) / 3749) [(4, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 4 for generator 29. -/
def rs_R005_ueqv_R005YNY_partial_29_0004 : Poly :=
[
  term ((-173544 : Rat) / 3749) [(4, 1), (8, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((86772 : Rat) / 3749) [(4, 1), (8, 2), (11, 1), (13, 1), (16, 1)],
  term ((-173544 : Rat) / 3749) [(4, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((86772 : Rat) / 3749) [(4, 1), (9, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 29. -/
theorem rs_R005_ueqv_R005YNY_partial_29_0004_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_29_0004
        rs_R005_ueqv_R005YNY_generator_29_0000_0024 =
      rs_R005_ueqv_R005YNY_partial_29_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005YNY_coefficient_29_0005 : Poly :=
[
  term ((199584 : Rat) / 3749) [(4, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 5 for generator 29. -/
def rs_R005_ueqv_R005YNY_partial_29_0005 : Poly :=
[
  term ((399168 : Rat) / 3749) [(4, 1), (8, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-199584 : Rat) / 3749) [(4, 1), (8, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((399168 : Rat) / 3749) [(4, 1), (9, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-199584 : Rat) / 3749) [(4, 1), (9, 2), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 29. -/
theorem rs_R005_ueqv_R005YNY_partial_29_0005_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_29_0005
        rs_R005_ueqv_R005YNY_generator_29_0000_0024 =
      rs_R005_ueqv_R005YNY_partial_29_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005YNY_coefficient_29_0006 : Poly :=
[
  term ((-44604 : Rat) / 3749) [(4, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 6 for generator 29. -/
def rs_R005_ueqv_R005YNY_partial_29_0006 : Poly :=
[
  term ((-89208 : Rat) / 3749) [(4, 1), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((44604 : Rat) / 3749) [(4, 1), (8, 2), (11, 1), (15, 1), (16, 1)],
  term ((-89208 : Rat) / 3749) [(4, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((44604 : Rat) / 3749) [(4, 1), (9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 29. -/
theorem rs_R005_ueqv_R005YNY_partial_29_0006_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_29_0006
        rs_R005_ueqv_R005YNY_generator_29_0000_0024 =
      rs_R005_ueqv_R005YNY_partial_29_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005YNY_coefficient_29_0007 : Poly :=
[
  term ((187110 : Rat) / 3749) [(4, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 7 for generator 29. -/
def rs_R005_ueqv_R005YNY_partial_29_0007 : Poly :=
[
  term ((374220 : Rat) / 3749) [(4, 1), (8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-187110 : Rat) / 3749) [(4, 1), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((374220 : Rat) / 3749) [(4, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-187110 : Rat) / 3749) [(4, 1), (9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 29. -/
theorem rs_R005_ueqv_R005YNY_partial_29_0007_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_29_0007
        rs_R005_ueqv_R005YNY_generator_29_0000_0024 =
      rs_R005_ueqv_R005YNY_partial_29_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005YNY_coefficient_29_0008 : Poly :=
[
  term ((111720 : Rat) / 3749) [(4, 1), (13, 2), (16, 1)]
]

/-- Partial product 8 for generator 29. -/
def rs_R005_ueqv_R005YNY_partial_29_0008 : Poly :=
[
  term ((223440 : Rat) / 3749) [(4, 1), (8, 1), (13, 2), (14, 1), (16, 1)],
  term ((-111720 : Rat) / 3749) [(4, 1), (8, 2), (13, 2), (16, 1)],
  term ((223440 : Rat) / 3749) [(4, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-111720 : Rat) / 3749) [(4, 1), (9, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 29. -/
theorem rs_R005_ueqv_R005YNY_partial_29_0008_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_29_0008
        rs_R005_ueqv_R005YNY_generator_29_0000_0024 =
      rs_R005_ueqv_R005YNY_partial_29_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005YNY_coefficient_29_0009 : Poly :=
[
  term ((51660 : Rat) / 3749) [(4, 1), (16, 1)]
]

/-- Partial product 9 for generator 29. -/
def rs_R005_ueqv_R005YNY_partial_29_0009 : Poly :=
[
  term ((103320 : Rat) / 3749) [(4, 1), (8, 1), (14, 1), (16, 1)],
  term ((-51660 : Rat) / 3749) [(4, 1), (8, 2), (16, 1)],
  term ((103320 : Rat) / 3749) [(4, 1), (9, 1), (15, 1), (16, 1)],
  term ((-51660 : Rat) / 3749) [(4, 1), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 29. -/
theorem rs_R005_ueqv_R005YNY_partial_29_0009_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_29_0009
        rs_R005_ueqv_R005YNY_generator_29_0000_0024 =
      rs_R005_ueqv_R005YNY_partial_29_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005YNY_coefficient_29_0010 : Poly :=
[
  term ((542745 : Rat) / 41239) [(5, 1), (7, 1), (16, 1)]
]

/-- Partial product 10 for generator 29. -/
def rs_R005_ueqv_R005YNY_partial_29_0010 : Poly :=
[
  term ((1085490 : Rat) / 41239) [(5, 1), (7, 1), (8, 1), (14, 1), (16, 1)],
  term ((-542745 : Rat) / 41239) [(5, 1), (7, 1), (8, 2), (16, 1)],
  term ((1085490 : Rat) / 41239) [(5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-542745 : Rat) / 41239) [(5, 1), (7, 1), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 29. -/
theorem rs_R005_ueqv_R005YNY_partial_29_0010_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_29_0010
        rs_R005_ueqv_R005YNY_generator_29_0000_0024 =
      rs_R005_ueqv_R005YNY_partial_29_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005YNY_coefficient_29_0011 : Poly :=
[
  term ((-169344 : Rat) / 41239) [(5, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 11 for generator 29. -/
def rs_R005_ueqv_R005YNY_partial_29_0011 : Poly :=
[
  term ((-338688 : Rat) / 41239) [(5, 1), (8, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((169344 : Rat) / 41239) [(5, 1), (8, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-338688 : Rat) / 41239) [(5, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((169344 : Rat) / 41239) [(5, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 29. -/
theorem rs_R005_ueqv_R005YNY_partial_29_0011_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_29_0011
        rs_R005_ueqv_R005YNY_generator_29_0000_0024 =
      rs_R005_ueqv_R005YNY_partial_29_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005YNY_coefficient_29_0012 : Poly :=
[
  term ((1739262 : Rat) / 41239) [(5, 1), (11, 1), (16, 1)]
]

/-- Partial product 12 for generator 29. -/
def rs_R005_ueqv_R005YNY_partial_29_0012 : Poly :=
[
  term ((3478524 : Rat) / 41239) [(5, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((-1739262 : Rat) / 41239) [(5, 1), (8, 2), (11, 1), (16, 1)],
  term ((3478524 : Rat) / 41239) [(5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1739262 : Rat) / 41239) [(5, 1), (9, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 29. -/
theorem rs_R005_ueqv_R005YNY_partial_29_0012_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_29_0012
        rs_R005_ueqv_R005YNY_generator_29_0000_0024 =
      rs_R005_ueqv_R005YNY_partial_29_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005YNY_coefficient_29_0013 : Poly :=
[
  term ((565782 : Rat) / 41239) [(5, 1), (13, 1), (16, 1)]
]

/-- Partial product 13 for generator 29. -/
def rs_R005_ueqv_R005YNY_partial_29_0013 : Poly :=
[
  term ((1131564 : Rat) / 41239) [(5, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((-565782 : Rat) / 41239) [(5, 1), (8, 2), (13, 1), (16, 1)],
  term ((1131564 : Rat) / 41239) [(5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-565782 : Rat) / 41239) [(5, 1), (9, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 29. -/
theorem rs_R005_ueqv_R005YNY_partial_29_0013_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_29_0013
        rs_R005_ueqv_R005YNY_generator_29_0000_0024 =
      rs_R005_ueqv_R005YNY_partial_29_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005YNY_coefficient_29_0014 : Poly :=
[
  term ((-766899 : Rat) / 41239) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 14 for generator 29. -/
def rs_R005_ueqv_R005YNY_partial_29_0014 : Poly :=
[
  term ((-1533798 : Rat) / 41239) [(5, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((766899 : Rat) / 41239) [(5, 1), (8, 2), (15, 1), (16, 1)],
  term ((-1533798 : Rat) / 41239) [(5, 1), (9, 1), (15, 2), (16, 1)],
  term ((766899 : Rat) / 41239) [(5, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 29. -/
theorem rs_R005_ueqv_R005YNY_partial_29_0014_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_29_0014
        rs_R005_ueqv_R005YNY_generator_29_0000_0024 =
      rs_R005_ueqv_R005YNY_partial_29_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005YNY_coefficient_29_0015 : Poly :=
[
  term ((123321 : Rat) / 7498) [(7, 1), (13, 1), (16, 1)]
]

/-- Partial product 15 for generator 29. -/
def rs_R005_ueqv_R005YNY_partial_29_0015 : Poly :=
[
  term ((123321 : Rat) / 3749) [(7, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((-123321 : Rat) / 7498) [(7, 1), (8, 2), (13, 1), (16, 1)],
  term ((123321 : Rat) / 3749) [(7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-123321 : Rat) / 7498) [(7, 1), (9, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 29. -/
theorem rs_R005_ueqv_R005YNY_partial_29_0015_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_29_0015
        rs_R005_ueqv_R005YNY_generator_29_0000_0024 =
      rs_R005_ueqv_R005YNY_partial_29_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005YNY_coefficient_29_0016 : Poly :=
[
  term ((-256977 : Rat) / 3749) [(9, 1), (11, 1), (16, 1)]
]

/-- Partial product 16 for generator 29. -/
def rs_R005_ueqv_R005YNY_partial_29_0016 : Poly :=
[
  term ((-513954 : Rat) / 3749) [(8, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((256977 : Rat) / 3749) [(8, 2), (9, 1), (11, 1), (16, 1)],
  term ((-513954 : Rat) / 3749) [(9, 2), (11, 1), (15, 1), (16, 1)],
  term ((256977 : Rat) / 3749) [(9, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 29. -/
theorem rs_R005_ueqv_R005YNY_partial_29_0016_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_29_0016
        rs_R005_ueqv_R005YNY_generator_29_0000_0024 =
      rs_R005_ueqv_R005YNY_partial_29_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005YNY_coefficient_29_0017 : Poly :=
[
  term ((182637 : Rat) / 3749) [(9, 1), (13, 1), (16, 1)]
]

/-- Partial product 17 for generator 29. -/
def rs_R005_ueqv_R005YNY_partial_29_0017 : Poly :=
[
  term ((365274 : Rat) / 3749) [(8, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-182637 : Rat) / 3749) [(8, 2), (9, 1), (13, 1), (16, 1)],
  term ((365274 : Rat) / 3749) [(9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-182637 : Rat) / 3749) [(9, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 29. -/
theorem rs_R005_ueqv_R005YNY_partial_29_0017_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_29_0017
        rs_R005_ueqv_R005YNY_generator_29_0000_0024 =
      rs_R005_ueqv_R005YNY_partial_29_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005YNY_coefficient_29_0018 : Poly :=
[
  term ((-18585 : Rat) / 3749) [(10, 1), (16, 1)]
]

/-- Partial product 18 for generator 29. -/
def rs_R005_ueqv_R005YNY_partial_29_0018 : Poly :=
[
  term ((-37170 : Rat) / 3749) [(8, 1), (10, 1), (14, 1), (16, 1)],
  term ((18585 : Rat) / 3749) [(8, 2), (10, 1), (16, 1)],
  term ((-37170 : Rat) / 3749) [(9, 1), (10, 1), (15, 1), (16, 1)],
  term ((18585 : Rat) / 3749) [(9, 2), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 29. -/
theorem rs_R005_ueqv_R005YNY_partial_29_0018_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_29_0018
        rs_R005_ueqv_R005YNY_generator_29_0000_0024 =
      rs_R005_ueqv_R005YNY_partial_29_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005YNY_coefficient_29_0019 : Poly :=
[
  term ((-1307099 : Rat) / 52486) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 19 for generator 29. -/
def rs_R005_ueqv_R005YNY_partial_29_0019 : Poly :=
[
  term ((-1307099 : Rat) / 26243) [(8, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((1307099 : Rat) / 52486) [(8, 2), (11, 1), (13, 1), (16, 1)],
  term ((-1307099 : Rat) / 26243) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((1307099 : Rat) / 52486) [(9, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 29. -/
theorem rs_R005_ueqv_R005YNY_partial_29_0019_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_29_0019
        rs_R005_ueqv_R005YNY_generator_29_0000_0024 =
      rs_R005_ueqv_R005YNY_partial_29_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005YNY_coefficient_29_0020 : Poly :=
[
  term ((269064 : Rat) / 3749) [(11, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 20 for generator 29. -/
def rs_R005_ueqv_R005YNY_partial_29_0020 : Poly :=
[
  term ((538128 : Rat) / 3749) [(8, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-269064 : Rat) / 3749) [(8, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((538128 : Rat) / 3749) [(9, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-269064 : Rat) / 3749) [(9, 2), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 29. -/
theorem rs_R005_ueqv_R005YNY_partial_29_0020_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_29_0020
        rs_R005_ueqv_R005YNY_generator_29_0000_0024 =
      rs_R005_ueqv_R005YNY_partial_29_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005YNY_coefficient_29_0021 : Poly :=
[
  term ((5771859 : Rat) / 52486) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 21 for generator 29. -/
def rs_R005_ueqv_R005YNY_partial_29_0021 : Poly :=
[
  term ((5771859 : Rat) / 26243) [(8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5771859 : Rat) / 52486) [(8, 2), (11, 1), (15, 1), (16, 1)],
  term ((5771859 : Rat) / 26243) [(9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-5771859 : Rat) / 52486) [(9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 29. -/
theorem rs_R005_ueqv_R005YNY_partial_29_0021_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_29_0021
        rs_R005_ueqv_R005YNY_generator_29_0000_0024 =
      rs_R005_ueqv_R005YNY_partial_29_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005YNY_coefficient_29_0022 : Poly :=
[
  term ((-2158185 : Rat) / 26243) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 22 for generator 29. -/
def rs_R005_ueqv_R005YNY_partial_29_0022 : Poly :=
[
  term ((-4316370 : Rat) / 26243) [(8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((2158185 : Rat) / 26243) [(8, 2), (13, 1), (15, 1), (16, 1)],
  term ((-4316370 : Rat) / 26243) [(9, 1), (13, 1), (15, 2), (16, 1)],
  term ((2158185 : Rat) / 26243) [(9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 29. -/
theorem rs_R005_ueqv_R005YNY_partial_29_0022_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_29_0022
        rs_R005_ueqv_R005YNY_generator_29_0000_0024 =
      rs_R005_ueqv_R005YNY_partial_29_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005YNY_coefficient_29_0023 : Poly :=
[
  term ((3037457 : Rat) / 52486) [(13, 2), (16, 1)]
]

/-- Partial product 23 for generator 29. -/
def rs_R005_ueqv_R005YNY_partial_29_0023 : Poly :=
[
  term ((3037457 : Rat) / 26243) [(8, 1), (13, 2), (14, 1), (16, 1)],
  term ((-3037457 : Rat) / 52486) [(8, 2), (13, 2), (16, 1)],
  term ((3037457 : Rat) / 26243) [(9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-3037457 : Rat) / 52486) [(9, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 29. -/
theorem rs_R005_ueqv_R005YNY_partial_29_0023_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_29_0023
        rs_R005_ueqv_R005YNY_generator_29_0000_0024 =
      rs_R005_ueqv_R005YNY_partial_29_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005YNY_coefficient_29_0024 : Poly :=
[
  term ((19509 : Rat) / 14996) [(16, 1)]
]

/-- Partial product 24 for generator 29. -/
def rs_R005_ueqv_R005YNY_partial_29_0024 : Poly :=
[
  term ((19509 : Rat) / 7498) [(8, 1), (14, 1), (16, 1)],
  term ((-19509 : Rat) / 14996) [(8, 2), (16, 1)],
  term ((19509 : Rat) / 7498) [(9, 1), (15, 1), (16, 1)],
  term ((-19509 : Rat) / 14996) [(9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 29. -/
theorem rs_R005_ueqv_R005YNY_partial_29_0024_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_29_0024
        rs_R005_ueqv_R005YNY_generator_29_0000_0024 =
      rs_R005_ueqv_R005YNY_partial_29_0024 := by
  native_decide

/-- Partial products in this block. -/
def rs_R005_ueqv_R005YNY_partials_29_0000_0024 : List Poly :=
[
  rs_R005_ueqv_R005YNY_partial_29_0000,
  rs_R005_ueqv_R005YNY_partial_29_0001,
  rs_R005_ueqv_R005YNY_partial_29_0002,
  rs_R005_ueqv_R005YNY_partial_29_0003,
  rs_R005_ueqv_R005YNY_partial_29_0004,
  rs_R005_ueqv_R005YNY_partial_29_0005,
  rs_R005_ueqv_R005YNY_partial_29_0006,
  rs_R005_ueqv_R005YNY_partial_29_0007,
  rs_R005_ueqv_R005YNY_partial_29_0008,
  rs_R005_ueqv_R005YNY_partial_29_0009,
  rs_R005_ueqv_R005YNY_partial_29_0010,
  rs_R005_ueqv_R005YNY_partial_29_0011,
  rs_R005_ueqv_R005YNY_partial_29_0012,
  rs_R005_ueqv_R005YNY_partial_29_0013,
  rs_R005_ueqv_R005YNY_partial_29_0014,
  rs_R005_ueqv_R005YNY_partial_29_0015,
  rs_R005_ueqv_R005YNY_partial_29_0016,
  rs_R005_ueqv_R005YNY_partial_29_0017,
  rs_R005_ueqv_R005YNY_partial_29_0018,
  rs_R005_ueqv_R005YNY_partial_29_0019,
  rs_R005_ueqv_R005YNY_partial_29_0020,
  rs_R005_ueqv_R005YNY_partial_29_0021,
  rs_R005_ueqv_R005YNY_partial_29_0022,
  rs_R005_ueqv_R005YNY_partial_29_0023,
  rs_R005_ueqv_R005YNY_partial_29_0024
]

/-- Sum of partial products in this block. -/
def rs_R005_ueqv_R005YNY_block_29_0000_0024 : Poly :=
[
  term ((91476 : Rat) / 3749) [(4, 1), (7, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((-45738 : Rat) / 3749) [(4, 1), (7, 1), (8, 2), (13, 1), (16, 1)],
  term ((91476 : Rat) / 3749) [(4, 1), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-45738 : Rat) / 3749) [(4, 1), (7, 1), (9, 2), (13, 1), (16, 1)],
  term ((148680 : Rat) / 3749) [(4, 1), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-74340 : Rat) / 3749) [(4, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((37170 : Rat) / 3749) [(4, 1), (8, 1), (9, 2), (16, 1)],
  term ((74340 : Rat) / 3749) [(4, 1), (8, 1), (10, 1), (14, 1), (16, 1)],
  term ((-173544 : Rat) / 3749) [(4, 1), (8, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((399168 : Rat) / 3749) [(4, 1), (8, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-89208 : Rat) / 3749) [(4, 1), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((374220 : Rat) / 3749) [(4, 1), (8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((223440 : Rat) / 3749) [(4, 1), (8, 1), (13, 2), (14, 1), (16, 1)],
  term ((103320 : Rat) / 3749) [(4, 1), (8, 1), (14, 1), (16, 1)],
  term ((-74340 : Rat) / 3749) [(4, 1), (8, 2), (9, 1), (15, 1), (16, 1)],
  term ((-37170 : Rat) / 3749) [(4, 1), (8, 2), (10, 1), (16, 1)],
  term ((86772 : Rat) / 3749) [(4, 1), (8, 2), (11, 1), (13, 1), (16, 1)],
  term ((-199584 : Rat) / 3749) [(4, 1), (8, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((44604 : Rat) / 3749) [(4, 1), (8, 2), (11, 1), (15, 1), (16, 1)],
  term ((-187110 : Rat) / 3749) [(4, 1), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((-111720 : Rat) / 3749) [(4, 1), (8, 2), (13, 2), (16, 1)],
  term ((-74340 : Rat) / 3749) [(4, 1), (8, 2), (14, 1), (16, 1)],
  term ((-51660 : Rat) / 3749) [(4, 1), (8, 2), (16, 1)],
  term ((37170 : Rat) / 3749) [(4, 1), (8, 3), (16, 1)],
  term ((74340 : Rat) / 3749) [(4, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-173544 : Rat) / 3749) [(4, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((399168 : Rat) / 3749) [(4, 1), (9, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-89208 : Rat) / 3749) [(4, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((374220 : Rat) / 3749) [(4, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((223440 : Rat) / 3749) [(4, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((103320 : Rat) / 3749) [(4, 1), (9, 1), (15, 1), (16, 1)],
  term ((-37170 : Rat) / 3749) [(4, 1), (9, 2), (10, 1), (16, 1)],
  term ((86772 : Rat) / 3749) [(4, 1), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-199584 : Rat) / 3749) [(4, 1), (9, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((44604 : Rat) / 3749) [(4, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-187110 : Rat) / 3749) [(4, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-111720 : Rat) / 3749) [(4, 1), (9, 2), (13, 2), (16, 1)],
  term ((148680 : Rat) / 3749) [(4, 1), (9, 2), (15, 2), (16, 1)],
  term ((-51660 : Rat) / 3749) [(4, 1), (9, 2), (16, 1)],
  term ((-74340 : Rat) / 3749) [(4, 1), (9, 3), (15, 1), (16, 1)],
  term ((1085490 : Rat) / 41239) [(5, 1), (7, 1), (8, 1), (14, 1), (16, 1)],
  term ((-542745 : Rat) / 41239) [(5, 1), (7, 1), (8, 2), (16, 1)],
  term ((1085490 : Rat) / 41239) [(5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-542745 : Rat) / 41239) [(5, 1), (7, 1), (9, 2), (16, 1)],
  term ((-338688 : Rat) / 41239) [(5, 1), (8, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((3478524 : Rat) / 41239) [(5, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((1131564 : Rat) / 41239) [(5, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1533798 : Rat) / 41239) [(5, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((169344 : Rat) / 41239) [(5, 1), (8, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1739262 : Rat) / 41239) [(5, 1), (8, 2), (11, 1), (16, 1)],
  term ((-565782 : Rat) / 41239) [(5, 1), (8, 2), (13, 1), (16, 1)],
  term ((766899 : Rat) / 41239) [(5, 1), (8, 2), (15, 1), (16, 1)],
  term ((-338688 : Rat) / 41239) [(5, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((3478524 : Rat) / 41239) [(5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((1131564 : Rat) / 41239) [(5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1533798 : Rat) / 41239) [(5, 1), (9, 1), (15, 2), (16, 1)],
  term ((169344 : Rat) / 41239) [(5, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1739262 : Rat) / 41239) [(5, 1), (9, 2), (11, 1), (16, 1)],
  term ((-565782 : Rat) / 41239) [(5, 1), (9, 2), (13, 1), (16, 1)],
  term ((766899 : Rat) / 41239) [(5, 1), (9, 2), (15, 1), (16, 1)],
  term ((123321 : Rat) / 3749) [(7, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((-123321 : Rat) / 7498) [(7, 1), (8, 2), (13, 1), (16, 1)],
  term ((123321 : Rat) / 3749) [(7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-123321 : Rat) / 7498) [(7, 1), (9, 2), (13, 1), (16, 1)],
  term ((-513954 : Rat) / 3749) [(8, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((365274 : Rat) / 3749) [(8, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-37170 : Rat) / 3749) [(8, 1), (10, 1), (14, 1), (16, 1)],
  term ((-1307099 : Rat) / 26243) [(8, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((538128 : Rat) / 3749) [(8, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((5771859 : Rat) / 26243) [(8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4316370 : Rat) / 26243) [(8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((3037457 : Rat) / 26243) [(8, 1), (13, 2), (14, 1), (16, 1)],
  term ((19509 : Rat) / 7498) [(8, 1), (14, 1), (16, 1)],
  term ((256977 : Rat) / 3749) [(8, 2), (9, 1), (11, 1), (16, 1)],
  term ((-182637 : Rat) / 3749) [(8, 2), (9, 1), (13, 1), (16, 1)],
  term ((18585 : Rat) / 3749) [(8, 2), (10, 1), (16, 1)],
  term ((1307099 : Rat) / 52486) [(8, 2), (11, 1), (13, 1), (16, 1)],
  term ((-269064 : Rat) / 3749) [(8, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-5771859 : Rat) / 52486) [(8, 2), (11, 1), (15, 1), (16, 1)],
  term ((2158185 : Rat) / 26243) [(8, 2), (13, 1), (15, 1), (16, 1)],
  term ((-3037457 : Rat) / 52486) [(8, 2), (13, 2), (16, 1)],
  term ((-19509 : Rat) / 14996) [(8, 2), (16, 1)],
  term ((-37170 : Rat) / 3749) [(9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-1307099 : Rat) / 26243) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((538128 : Rat) / 3749) [(9, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((5771859 : Rat) / 26243) [(9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-4316370 : Rat) / 26243) [(9, 1), (13, 1), (15, 2), (16, 1)],
  term ((3037457 : Rat) / 26243) [(9, 1), (13, 2), (15, 1), (16, 1)],
  term ((19509 : Rat) / 7498) [(9, 1), (15, 1), (16, 1)],
  term ((18585 : Rat) / 3749) [(9, 2), (10, 1), (16, 1)],
  term ((1307099 : Rat) / 52486) [(9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-269064 : Rat) / 3749) [(9, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-12967215 : Rat) / 52486) [(9, 2), (11, 1), (15, 1), (16, 1)],
  term ((4715103 : Rat) / 26243) [(9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-3037457 : Rat) / 52486) [(9, 2), (13, 2), (16, 1)],
  term ((-19509 : Rat) / 14996) [(9, 2), (16, 1)],
  term ((256977 : Rat) / 3749) [(9, 3), (11, 1), (16, 1)],
  term ((-182637 : Rat) / 3749) [(9, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 29, terms 0 through 24. -/
theorem rs_R005_ueqv_R005YNY_block_29_0000_0024_valid :
    checkProductSumEq rs_R005_ueqv_R005YNY_partials_29_0000_0024
      rs_R005_ueqv_R005YNY_block_29_0000_0024 = true := by
  native_decide

end R005UeqvR005YNYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
